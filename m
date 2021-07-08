Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E5B3C19E9
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 21:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 779676E94D;
	Thu,  8 Jul 2021 19:36:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2083.outbound.protection.outlook.com [40.107.243.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB1566E030;
 Thu,  8 Jul 2021 19:36:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FweU26HTPO+8FmWY86l3K04hUT1WMVkhGgjunULBj14lHp8rRvK6uP/WyOYVmBUkr8/UIlhiqtZ2R5tUf3aElH4qU6AeKuA+XbS/FamPZkNLA1wFiBwpfgaLnJJj+CMonaGkgDBhCiQQrA5BwkvzsEwVMwGnAdBlog5UkBmdFcg6yKRR2osw9herkU1HYVsSmOw3CCH5Q59YMYUckCfI4G5lO9/IKhZyEM4bprptndqf5eyKvwJ9b3sCU3/HPrqgSWzUMKhy7RsIHungC1QU7uebyDOBmZiWp/AeXEb1fZyToumeZKVRTwdC5HLLoMjKGnnES6vuklV8zRVk/EWMmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfL9XSYKUdp/hyb4dGOnbRBRhpvpptdqt28go8wgvVQ=;
 b=Oo7RQF/ijgXZ2FG1yHsTEubwphjKB+ytviXBpR2D0+y9uIb/8+BtLzrOGnkm+ogcUL1MTcmDXa3csjIwIR1aTFyEv1v3KJlm+4FUlnIHjdao6OLKnCMJv4x+wMmwGlMvzb/5fZbaVa9OEZ9dRQf+y8Bo0QKwZUvqQmjep3xLckxoGHFZE/i5YiGEIZbbrQY1sm5rOEtkAq4FICBWL8T7PTlLmXHdARJaZiFAGbCdEivuQ4tyrCeiwj2NYsULI3ds8mt6RgPtY/O+xHVXvwqdiRBBG93vOqfU326EzuD0braZHz45G+gLn+lpVmg6eq97ZkklAOQOJqqe6pQ71miF2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfL9XSYKUdp/hyb4dGOnbRBRhpvpptdqt28go8wgvVQ=;
 b=2ouzOen48sfTduCN8lGjdeMldNOPN8w8WlGWIMe+HY7XT6wp+7vuzknhxcU4SAxMYF2iDbt7/S4QHFa1wbF428fE7KYUqzJsLo7Ykg3VKeA0S7FHzBbi7+ayOxHVJ8ZDbM9YAAMmQ6GR7Xs7Ue/gGfi8DypTSFnE8j/wPJXfgZk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by BL1PR12MB5206.namprd12.prod.outlook.com (2603:10b6:208:31c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Thu, 8 Jul
 2021 19:36:39 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::8cb6:59d6:24d0:4dc3]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::8cb6:59d6:24d0:4dc3%9]) with mapi id 15.20.4308.023; Thu, 8 Jul 2021
 19:36:39 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/amdkfd: Allow CPU access for all VRAM BOs
Date: Thu,  8 Jul 2021 15:36:20 -0400
Message-Id: <20210708193621.2198733-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR15CA0016.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::29) To BL1PR12MB5144.namprd12.prod.outlook.com
 (2603:10b6:208:316::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (192.161.79.198) by
 MN2PR15CA0016.namprd15.prod.outlook.com (2603:10b6:208:1b4::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend
 Transport; Thu, 8 Jul 2021 19:36:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd644e8d-4bcc-4a01-6738-08d94247b46d
X-MS-TrafficTypeDiagnostic: BL1PR12MB5206:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB52060F88D4AEDA5758AEAFD7F7199@BL1PR12MB5206.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EKiLbSkpDx4qChoPSRzqcbDDd98B5gC0fF6ZIXqJW+Ic81wfiEkksPr0/c+6bdoD6oVXtIpGGxFTX0MvhIKwYJandaNbtZnubOdYcBD+pxh6JLAS52d1aXVfYU1Uv+VS5in4vwcagbebZz4b8FIMzgiMUiJchU6tEcw/7brDMaHev544HfYK4YN7YGOAYNwMosIuNfTnSk8cTHpwYFf71tH0S/yoj4OmjYFLWGO6GdCMP0ChjBrki+o+cTBkYy9rs/Wi6xeLqux2VkPeClsCKzJTtYbqdgkkMantxK8MOOsGoocS0FNyX2RCtxAWQ0kQ35qSjNcFagIBTCsnr6rGF9gB9pfTYM3VBBsSUaiuniB/TPp7KD5eTmnlz2OoBjBM8xOHBlk92sMTbT+SLSLTV+ytgm2ovG5wophQGcFcM08UcaeA45rHXgwPL+6gIas42+FUdJ0ZWiYjXt7CbdY/SwhhVoBtvRLjl+Y1o5e28S67Hfze2Gjoj/X/DhSNb+/W13HC8wsFCRAwbC1HQAXs+OnoqWdSfwCxxnzkYLqv1ZeP0Jpw3XXwdqCW4oqxbULKzvm7RZUUEd9oOGS+tEvXR1Uf/ffUutRSv8izcB7mAw1la0h49YUXp5GpUcJWSHyIxtk5KEiVJNlzBTLjnfXlCGvX6S5fNZHWzTaWNZT9yT4Rk8IFbfonNCwGrZQHish+KE/Zkm1kxb8CpMBi7KUbTQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(5660300002)(26005)(316002)(6486002)(6512007)(86362001)(6666004)(6506007)(2906002)(83380400001)(52116002)(66556008)(66946007)(66476007)(186003)(478600001)(36756003)(450100002)(4326008)(8676002)(8936002)(2616005)(956004)(1076003)(54906003)(38350700002)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eR3WrxU3KkOpxdSDn7KMJnjCkDjQslQAMy6hZxZpXP+Frj/M54duySmdwyJv?=
 =?us-ascii?Q?1Gp2k+k1nsbPpvTrGeoIzesMu6YcMkUVcuT5Vac49Xg5JxYTV/IBM9GScBaC?=
 =?us-ascii?Q?7kHaca7KojDfDx1eKZH5+LDQYz3Pe1w3+ZgYGzgKqIpfoffBxcHWHOKBVUmO?=
 =?us-ascii?Q?zhEb2NsY/9K5GDlJrfktLac1pWGQyAyGmxAZ0jrY+4+39QEo7Qwj2x0pFks/?=
 =?us-ascii?Q?iVOoWeGYBLybmOHuaJ7ppVbnffxK1oYJ34+EX5RKIQz5gEkD/riAV/J0TP4v?=
 =?us-ascii?Q?qAlGDPw3ICpT1vxZQLpBaZONEqrFBKvA1UOnowQzWlLRn53pK0rrXgqvL6+p?=
 =?us-ascii?Q?BZRxE8O5IH7fDcRReU1ZPqrb6z9Z221vdmze44TLNuJ/005G9bsbrzrP21VB?=
 =?us-ascii?Q?SnVvsr6eve95no/GFg2wqNqr/H+uKCaxTUn8PyJURypVrvIYUN9Iq+IPsDON?=
 =?us-ascii?Q?8G9kIVK542y+XkuRsg3LwLmfaVFR2LLiF4DgaKtq5KuaKjTyovZGuk2QhUQ4?=
 =?us-ascii?Q?qkhCHny8R8HTYbSudvyu0EQznNd4y/0IyvvN8U3iaCipuU0fu241wXVxIbTx?=
 =?us-ascii?Q?q5bSHfygPQEl3VBODks9vpS9iIkP0+Amw/PElZTfEo0NTMXLP0R4tc4sZmHe?=
 =?us-ascii?Q?oBFISWgUluKjDp+mN7BQ+9F7sKtZU6FT2tDCgpDXwem5vYeXiH/V4o+qUbtk?=
 =?us-ascii?Q?vHu1JSnTtKIqAf8AadSshwx0rs/8lay0S3hstYNBtkIdXc379F3QRx1iOQz9?=
 =?us-ascii?Q?ZiDMWjpPkUlh0QDBi7GALC4JgXub9s1/4n1O/+FnuBd3CHTUDxS0jYsFabME?=
 =?us-ascii?Q?wUM0/LKMUUFLPGCBWyHzve0+pSxsufe9UAl2Ym9MPKWPlhSM4FawyhWPrqkA?=
 =?us-ascii?Q?VcQ7ULPkH3A39UW0pnmFwdNWEYO5Xne+1PxRPWTyNkRfZ9lIWAlz3IRukGGs?=
 =?us-ascii?Q?7uQ859InQw9yYxwbXWTDbCmlPQebCvMRQMVws9dnRZzu4efFwuduvVU5Egrs?=
 =?us-ascii?Q?YDzJvf/CJW/NZWexKIfe7poxLvc4JXlXhbZ0A9GPUHW5AlLROyfTDWeSEWgx?=
 =?us-ascii?Q?5sYF8Bpis5VN0H2YYPGgtl0G2hsdZjTe+jQEx9F3J23cX0Fzh/MVxZiE0E9L?=
 =?us-ascii?Q?MJ8AV0ybczIgV61eU5aa2uLUA/dSK0hpEdnQFLP5KPnxUgp5WA2gtR8GAAA7?=
 =?us-ascii?Q?pE7Vq89m9eFrgPybsFnrD788pIPO0mcgDxhoPk/mXTQOt6tHq70cdT10Kj/V?=
 =?us-ascii?Q?FR78TJk3SDqkTh0Z/Xx2Skv3Wk21zsflj9JBdvvKO36cn728haYll6qUD7V5?=
 =?us-ascii?Q?5v9W2sk8e4FtfxZFVrQ0HtWk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd644e8d-4bcc-4a01-6738-08d94247b46d
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 19:36:38.8826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 96ck7IvhyifHsmRjOx4QOMhYpIu6vFVAdyL6NqSd3Ek8o1Bte/ayUxnHbu8v/8pQ+dgp5PEOmN0sVNL405loTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5206
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Felix Kuehling <Felix.Kuehling@amd.com>

The thunk needs to mmap all BOs for CPU access to allow the debugger to
access them. Invisible ones are mapped with PROT_NONE.

Fixes: 71df0368e9b6 ("drm/amdgpu: Implement mmap as GEM object function")
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 3e487e199771..2d6b2d77b738 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1404,8 +1404,7 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 		domain = alloc_domain = AMDGPU_GEM_DOMAIN_VRAM;
 		alloc_flags = AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE;
 		alloc_flags |= (flags & KFD_IOC_ALLOC_MEM_FLAGS_PUBLIC) ?
-			AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED :
-			AMDGPU_GEM_CREATE_NO_CPU_ACCESS;
+			AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED : 0;
 	} else if (flags & KFD_IOC_ALLOC_MEM_FLAGS_GTT) {
 		domain = alloc_domain = AMDGPU_GEM_DOMAIN_GTT;
 		alloc_flags = 0;
-- 
2.31.1

