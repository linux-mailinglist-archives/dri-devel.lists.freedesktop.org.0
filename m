Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5CC38CEAF
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 22:14:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A7AA6F8DA;
	Fri, 21 May 2021 20:14:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC046F8DA;
 Fri, 21 May 2021 20:14:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TC5YJ/on0hCRrhTMSSXRv4dCxMohcKtFPvGF0PQ86bPeuHTCzBNoWsN0aJ5tOPHP9E5zX/HJCppwm/vWLDNsc5mz8kvEDCFroeXxGU7TcM+pR/iju3RopcJpRRt/nbym4aYli9icJLmsdrGQVlRcW/7EEgUthyraElkNPzBHXB5Ec4kDeRKHz4xziTVHzGlLzpmtd7UGiPTMneL2fFyZnH0OnRKhPLezU6CX1C06am2w+CqvLJVQCgARASes/ZKLIgDcn/cqKi6L0UlfNjx09+YSq/EZ7oAKJuqr3W/CxbVdeoOqOLbYNs6R8abjDDWv7Jc5S+/TO6Ko9a42kOAwhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVisVSSzU4/yujfVmyvXCHGhdgz4QE3euQLV38Az1J4=;
 b=QUHJV57OPUu9R+hLEc0M6VQOZYko+nvbkCOH3BY1XZquCkNIQT7j/58tv8OUqB1RUlULAVjItZg3U2ndmrkWgaUq7aWO+RGijf4j+JBrdVM10gxdLyzy1cFYYXiH+KTT155+MP/73/L/xAd2xE9R3s+v6epPreW2N9mZyQ5Zxs6Y+2iVDM01rIK3n5Jk7qXOQ8H/a2rWcGsC0ZRYiXSif1rIuYGu4cAGEhR83Z7O7aZU8qL7OoXyloRNSsz9VSorZzaE1zXL4bATTYUY9tGnxSG4VuBGuWR63a3M6qxietGsgdme1D3gxTdwIKhZc9TdKKJMD2A+v6fL4a0eVEd3Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVisVSSzU4/yujfVmyvXCHGhdgz4QE3euQLV38Az1J4=;
 b=VBYWsxwy24fQZzuJLzHDxA1e6ASK6Bv5w6ZNv8LYpx2Xh3tdbIxjuLDtysVfuWSr+uz5heSztTAEaZewxTHU8Of6Hm7IUtZDD4oJMURIVngZwCsyVFNWasIMLGeMOM10abHLkroCB9md6Wyr2/h+4bRhBwafgIv+YsyUn1b3ZpY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4615.namprd12.prod.outlook.com (2603:10b6:a03:96::21)
 by BY5PR12MB3906.namprd12.prod.outlook.com (2603:10b6:a03:1a9::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Fri, 21 May
 2021 20:14:27 +0000
Received: from BYAPR12MB4615.namprd12.prod.outlook.com
 ([fe80::58e2:2ca1:afbc:5122]) by BYAPR12MB4615.namprd12.prod.outlook.com
 ([fe80::58e2:2ca1:afbc:5122%7]) with mapi id 15.20.4129.035; Fri, 21 May 2021
 20:14:27 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 ckoenig.leichtzumerken@gmail.com
Subject: [PATCH] drm/amdgpu: Fix crash when hot unplug in BACO.
Date: Fri, 21 May 2021 16:14:12 -0400
Message-Id: <20210521201412.746745-1-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2607:fea8:3edf:49b0:b74b:1af9:3eb:e31d]
X-ClientProxiedBy: YTXPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::38) To BYAPR12MB4615.namprd12.prod.outlook.com
 (2603:10b6:a03:96::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:b74b:1af9:3eb:e31d) by
 YTXPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.31 via Frontend
 Transport; Fri, 21 May 2021 20:14:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c712d03b-f7f0-469d-f0b1-08d91c95086d
X-MS-TrafficTypeDiagnostic: BY5PR12MB3906:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB3906A0D49594CC36BA087482EA299@BY5PR12MB3906.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cV0R3+lFAJ1WAkKNNUe5xdHLgEmrX1kRHDFHkxGE9g8ekmDlMBOjKYo8vo3NRskX3cZkyapL+qzrf8HXJbEihM3QtoCD6oR16bs3Tf0HPY5v/Rd7rlPoTQKkA2wVSN8zQ1glpW3/qZgO0e2erc6Li+X5zxXLpGKDGIBSdNUcC7aJvxvjMnQf73VDypqkolUYQMDYtScIBp0r3SXdxHKkphZE4V2mOeuIUooDvg7778Kmv1uyrwjzl2qmFufLhpMurAO1AUJ2Gr4k9Jy8ECWJQix6dU4Kk2TYvVEjSvZg5cfABSo7jhW2cLTdmiNs5nFNvwrx0//sFW2aZxs2kuEnWoKk0G8/U6i5n1QMCRnVZ/0XofZUvTVHnPCDgGOSLndPskkLr20Hmg0m2O+Q7wPyiWfXxmLfXfwxYou0LlkUnY00iOaC2NkHENdOkvKkh1eNWau9I1nAUHiPUZ7X2IebYfu6E517iQP8Mq8tAo8Ty3kJnViTsS9WppPSJkqnHsBh+8RCeh9sW44zKWs3t7ZKyT2etBpBesXj6HaEiHyLlnMJOTMNUilo058I9ArzQaa5LSAQlagoqBrpkbSY053WbH8E8/Be0oWbJeWRQ56uSbCTOJ/wA4WhcFAsqRDd1/XUXcaZ4nnB6uaixLM2O5wXqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(346002)(39860400002)(366004)(6506007)(966005)(38100700002)(52116002)(6666004)(86362001)(44832011)(478600001)(316002)(36756003)(2616005)(5660300002)(1076003)(83380400001)(6512007)(8936002)(8676002)(4326008)(66476007)(66556008)(66946007)(186003)(2906002)(16526019)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Ys3NjIeIGw/LALEW4nCAkIQvCFhn9+UQ8Gs2uBp3KXYqq/ZbKjscQ73AWMnk?=
 =?us-ascii?Q?T70MgnVKLG5XMPg8zawTqOPmnRIXc3vfanTUR19ze8axaZYLgf1yW1vQLRHD?=
 =?us-ascii?Q?8FaTWIy5+T2nS2NeYKoVnvj66FISrfwCDay7ppB+kwik10ngytFGhdu1xGvL?=
 =?us-ascii?Q?5LxxjOvCQwCI7GGHw8aDvt6Pl+Jqgp826iY7wqkp8kXf9F9+7Ei3WYCDFRrb?=
 =?us-ascii?Q?FiGzNbktcLsyZbhAoI6Km8IwtFDKiYF7uXuUL5xwa+qUPh41VAzW/HzciCB2?=
 =?us-ascii?Q?0NnSw4nI6e2hOxsQNEf0Oh2I7Zctkj+rT6yFZ5gCW2zT6LGupLvjYzcm7UfR?=
 =?us-ascii?Q?xrvDBmAdj3vU9OXLh2TT8N5te5SUEVXI66YbUmtrcd4LpnN3ohEEdDs7nUdx?=
 =?us-ascii?Q?rAq42Fqc2xoCofS5G4S2Nt49w4N+fnPZ89yovQLfhd3/rbCaOzTX+iEeS6G1?=
 =?us-ascii?Q?gqnAtXCbXnvSfXEo90zWx5X+UTiPwUwEr6tRx8mA1/64mWHeciynlI0PRQQO?=
 =?us-ascii?Q?OtjXnqN3ayWuib+IIi6gBKOLxWA2W0MN5iNF3OzK2Tq1pN9BhqEPseOhPsjK?=
 =?us-ascii?Q?BjgB1Cp+otdMc6rCyxJmSgCSkCbH2yomC4LP5UkX0jl+myevp7cgRJO1woZd?=
 =?us-ascii?Q?8FG9DJ3EK6ugVe+orbNM864WmyV6meJnbdYwyEW9X0q3LVtrV55ejK9xr8Js?=
 =?us-ascii?Q?QyBMk1cnNPSrRL8726pB8AhDmd+wjavmDDevf1Id5Z00OOVmsBZoSqmUGVGi?=
 =?us-ascii?Q?te+Xzpo3wbtYeE5KVc1cT7FUOm3CNeJyIZ7cVcemP5ZtFmTyKdFgwGnjM7Sx?=
 =?us-ascii?Q?n2bIjrm4H16nZ3Vn3Wj9nM3iTQBZr73C0+25Ce0srhWJx6YY05ZqCYd6Cr7b?=
 =?us-ascii?Q?ftu/ZlTqGqM8BPKoJ+G72W4fUhWm/Lx+UMBcz57j4mAWfloW72zDOAfoGEaE?=
 =?us-ascii?Q?1XgnMIGoXXLA96EblkZZRWZkWfn2e74U5XHF5puNOYTTdo1Z3xl/iXP0SOOU?=
 =?us-ascii?Q?9fDi9oky9KXomGlH7Sk+AXvg8/4OrV0ugpBwM8+s1wAhpYe68n9Vzu/npmVM?=
 =?us-ascii?Q?XOHnYZlBJcAc3mxX+VK/T0ph836EoYX7hPOXdZb2Rtj+fVqqJkowsk3+VW/f?=
 =?us-ascii?Q?6t7/e5vbAx6MNm4fmJmp+v9haT93QL72dvFsDA25Oa9CAcJsIFeJJBKdsxIU?=
 =?us-ascii?Q?TQNwQ3rH4dECglhMzhU00X2JamZ6vMk+QQULkaZKnbms2bz9DfLB8MY4rT5r?=
 =?us-ascii?Q?YUHQEdwj3+1GLY14IBg0qgvGr/gjI6yahpnGc6dmdw/ayFBcqfkppHFqSH7T?=
 =?us-ascii?Q?gzw3kDKGxfkgpPTmphFhyOg7/MysGWUuiDFeZoGtOR/S/NJv8R/tJPr0fx/e?=
 =?us-ascii?Q?mg/1DQQLh1Jmq0pVDayxriur6PuX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c712d03b-f7f0-469d-f0b1-08d91c95086d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 20:14:26.8672 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZDhMpLnjthMptKM+EiHVO+9bi/J/L5yBIuOrr42gcN/GlsyvxShhZERsLrLmosF80CDmVRHmXana7eui+10U8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3906
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
Cc: Alexander.Deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Problem:
When device goes into sleep state due to prolonged
innactivity (e.g. BACO sleep) and then hot unplugged,
PCI core will try to wake up the device as part of
unplug process. Since the device is gone all HW
programming during rpm resume fails leading
to a bad SW state later during pci remove handling.

Fix:
Use a flag we use for PCIe error recovery to avoid
accessing registres. This allows to succefully complete
rpm resume sequence and finish pci remove.

P.S Must use pci_device_is_present and not drm_dev_enter/exit
here since rpm resume happens before PCI remove and so the 
unplug flag is not set yet.

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1081
Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index d8db5929cdd9..ab95ebf56636 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1555,6 +1555,11 @@ static int amdgpu_pmops_runtime_resume(struct device *dev)
 	if (!adev->runpm)
 		return -EINVAL;
 
+	/* Avoids registers access if device is physically gone */
+	if (!pci_device_is_present(adev->pdev))
+		adev->in_pci_err_recovery = true;
+
+
 	if (amdgpu_device_supports_px(drm_dev)) {
 		drm_dev->switch_power_state = DRM_SWITCH_POWER_CHANGING;
 
-- 
2.25.1

