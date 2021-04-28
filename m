Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E1C36DB10
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 17:14:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DDC56EB8F;
	Wed, 28 Apr 2021 15:14:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD1B6EB6E;
 Wed, 28 Apr 2021 15:13:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XgksMQ07JI2RbM4qQEes06vQRQw27WPwMW3eb0Bj6W3WD2eT/VvZdlVMhcZbdJrfcYDyMtDi5dVWO9aPsQlw8bx1QVI+nAuHzMjX2mdtRMTDaQkdzN6JSBz8GfcYzU6ApEGpgxFaKr4lriwpYVGzN1ycrL9I34K7tZJyfI0FoXGL4Y98fqGzAi79tJPA/AM7gwJMoftoigT2uH7nT9e4BQ7h88cekkZMMf3izFeosuUSbZajFLcXzyoPFyCMAcKh9ifx6tWYT4ByOAOZUTghmz+r7JB1kokTS/YIbNiCrRL8EOstq4dAX6VdLSp948mgmZdjp6C1b7q3L6EskgaPWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=meHqu+jOFx/NRlvPU7mQmRV3l7XcXGwpzu52oFSr+mw=;
 b=L+zTszkrwlbYSlBFEP9ZPWyu9pBvuYyvkvZhlpPXM0sL8SDqGV7yozie+cEeHbbpjNWdxzCSJbwfEtbzZxO8f4+tdH4dOYu2aK0xECqhgcLXzq5UPUCWDuryB8HwbFsHSc0QUJkl2G8sDm0z6WHUPz4wW5HcJPqXoRL4PSY6RzoTFV0LOeHgc8ifkPWa6Co8NZccT6+WUFhkqkCnnS6cXdUPlSO4HxfHwvaF9gLqv+1ncp6x0nubtFr+Q+LweKYpM7tsPv+9fIFRnjj6RJ475wzCdD/PGUAC4actaJ2Gis0Lgv8ZRlvaS/DxvDrKoDuvYRf7z3xWOr+x3HT2Es0AKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=meHqu+jOFx/NRlvPU7mQmRV3l7XcXGwpzu52oFSr+mw=;
 b=26zbk4XIzqTVs86507SBqq7G6chmCbVULo5AtxVvVsEF5ftrvq+v9QeoudEIq0k1mKIhXispGTiEbNFFiI96rGPvZYrFgpxaGXjijpMewHtAGxJY0fIp/WAe+CRxtcQwOjcImTPzYhP7sb8OpoeuNjqt8qIC3DnmrdGYuW9PQG0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2749.namprd12.prod.outlook.com (2603:10b6:805:6d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Wed, 28 Apr
 2021 15:13:10 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4065.026; Wed, 28 Apr 2021
 15:13:09 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v5 21/27] drm/amdgpu: Add support for hot-unplug feature at
 DRM level.
Date: Wed, 28 Apr 2021 11:12:01 -0400
Message-Id: <20210428151207.1212258-22-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
X-Originating-IP: [2607:fea8:3edf:49b0:7212:f93a:73b0:8f23]
X-ClientProxiedBy: YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::21) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:7212:f93a:73b0:8f23) by
 YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Wed, 28 Apr 2021 15:13:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3c4d4a1-8837-48fa-e49b-08d90a582226
X-MS-TrafficTypeDiagnostic: SN6PR12MB2749:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2749DD5D65C0079A0A54875EEA409@SN6PR12MB2749.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tle/rZQEq3prdKuWJjJZ4LBP8qlTX98sIBzJkr6lnEuWlK8x+TEDTnvBjJrcDkeHJEG+WCG9oW4BKsAq8hU1NhVkeImP7cp0wysfyf49zfBs2UmoY+yQM0x9+agb3loVFKqkkb65jv86yKe2BhNc1D6ZKYzN2IbfCf3VXLQEJ9dVm8iN1CTV9VFATSkyzpmZSYD11WiVp66cDc91GDmxZ5l85n1J2nNgPJTEVAUP7mBsYMZ2KwUYi6UpGqESdwXaA3Y9EAWlo4Mak1o2x7zu42HtVlJzLQn0b9DqqxkpBC5JSIywr8JastaiTLssrQjWgRlD4arpugqiLksoMSIdSY/KvvCaXvDwR9SM9t/69fffxmky6ePzh0u+0DW3Kg6GvbSJv8fn0qowQuLxLu7t0w60crty0ZDddPbCAwJ+C0LJB5wa0JeerEOi8QPvYDBLci9wUwe/xGtBkFClDVV29bGTZhDc43f3g4VyTpoZNv9e0v3LPMc5sWwUDHr1YZVdi0FB3nRpWm9Asr7l4w18GvKLOWZXgOY/4gY9IHE0EmVAl5+p4H7A9F8PSEMDGCE25Kc9a0ZRc91S8yl80hZgLalIWNu8Mdd9Rb26t6dcP/4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(16526019)(4744005)(6666004)(6512007)(2616005)(1076003)(2906002)(6636002)(66556008)(186003)(86362001)(5660300002)(8936002)(83380400001)(6486002)(478600001)(44832011)(38100700002)(66946007)(52116002)(6506007)(66476007)(8676002)(4326008)(36756003)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?bre9UeMHsFArHqmsYkQ2V2xj6mWir6VV+c8WOk5iwtdxORLthg3oN+EbJyoV?=
 =?us-ascii?Q?jJtQB9xbErtJcoPJqA9MEaAz4jcVg5a0feqTqdb732Q5tzEWe/5zPkFd7PAP?=
 =?us-ascii?Q?lu893pzvOTeLrNekdyfNGAo9GM2HIrISve1+VZgRROyKAqQ64XdYrP04uYMT?=
 =?us-ascii?Q?f9mFGgpcZOt3m7vgVodqGley8nGlvTmAKNFsVCJXVrQiuB9BAzKvgxLWFrBB?=
 =?us-ascii?Q?EDg54eRDjbJeMOVqwac6i+knVT6IQ53jqJsYUCCXPyS0S/6DYo0wZ0iKMQ24?=
 =?us-ascii?Q?pa+LaQdYsfqVUr/xs+SGi5MwieXd0cB/dhBuGH8acG4TKyp7Sej1u17XFWCA?=
 =?us-ascii?Q?mgzdbxde+lxv2XEp0Ad9+lWMmAtfSKWtRJEqBMMRZdBVq3T7rl0mGN89q/xY?=
 =?us-ascii?Q?9qV9pcpXr6TPNxlFl2i9c+7Fwh9HGlFCy0r8lGTkpSQSlrUocuwHEH/0v+IT?=
 =?us-ascii?Q?mJ0IhioKzE5ILB5xR760piDOBRQSTFQmiz0M1oLhtTKBJYbNL7VKN6hsLE2J?=
 =?us-ascii?Q?DZ3OHbgvj9wXvYxIsbUn6o4s1bv/k+sfx4JQz1zEilxd64Yp1++ZhkK/8d9u?=
 =?us-ascii?Q?7bsR8Rxp/SZ5/UzTUlwfnKCyf8z50rpIkgEBWX8qP/f5P9DkMEBhKjrTr0kL?=
 =?us-ascii?Q?r09ADuuLlzpxmFqI338FdNQIhkau/RV27tKfmAW1SZSGV4X0QioEjXTnWGwb?=
 =?us-ascii?Q?hQdlb3LIYd10cgLQw3CiKrqdxfoNfUwOktDbhx3Js2jeKT0zkUnr6S4T6xup?=
 =?us-ascii?Q?FQnxRNPm20ddSqITOkf65iDfqKiz469uJePg3RhtvE07hIYQFPzzr2XcsIT+?=
 =?us-ascii?Q?LggXRsNQwQCMTqfux2qPMEMV3Vr6RDoC9CvYQ55yWZ+sOSB89sR8ylbcc14n?=
 =?us-ascii?Q?se/3+BD7bk1fPEFrzuBfHoLh9RV/90dffjW8vAHN79so7f1Fy5khHlKfSaaI?=
 =?us-ascii?Q?InBGJuEJFZ1NFCFF9NFXXZqf20LJ0iUOd2E0te/Jj0Esc78wak8xPufZWX/Z?=
 =?us-ascii?Q?OKMQHB2bsdG/TRVpa5BcL4vbAjuT9qQzEvTyYDGkUJEAlXRKK7W8mz8xTxau?=
 =?us-ascii?Q?wQklpyc2lXrC4jFFrcBn2orAjl3LbaukEBkzlgPQHbc5Fx6YR0aQxncRNwzd?=
 =?us-ascii?Q?vjjjtP6oh9nP+1T6MswxXEOiQMQQ5dnZnhESIFSl9jJwAbSBdkY5Gt8VK8V/?=
 =?us-ascii?Q?L3V+oxL+Ufz+sEk8Lx75LZnxqvYgunKq0ALL9rJ3aThB8JaOBItSmIJNZ3qt?=
 =?us-ascii?Q?KAByq3VUcIZfBYdYH945JK+lRTejQlVdLAIvmeQSYUxHmFMcPcPmULzYsDvz?=
 =?us-ascii?Q?Hh6IEA1sVSupeiyfdZ3I5jib2vYdcfeOQPJO+NGzH81otz3KBXwnkdg/f3Ag?=
 =?us-ascii?Q?P2degxGJpZTe8JZcUfi28hJV7Ckv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3c4d4a1-8837-48fa-e49b-08d90a582226
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:13:09.7878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8GmPxwRIL5XN+T/ADHVF2TfHK6SM+OggFj5Y1xyVkeJ43ZjaRpJOChzpSRK/3J48qEtuR0qZYhZQogpryHxPEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2749
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
Cc: gregkh@linuxfoundation.org, Felix.Kuehling@amd.com, helgaas@kernel.org,
 Alexander.Deucher@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To allow scoping DRM IOCTLs with drm_dev_enter/exit.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 8a19b8dd02ee..d0f34f230ef3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1579,7 +1579,7 @@ static const struct drm_driver amdgpu_kms_driver = {
 	    DRIVER_ATOMIC |
 	    DRIVER_GEM |
 	    DRIVER_RENDER | DRIVER_MODESET | DRIVER_SYNCOBJ |
-	    DRIVER_SYNCOBJ_TIMELINE,
+	    DRIVER_SYNCOBJ_TIMELINE | DRIVER_HOTUNPLUG_SUPPORT,
 	.open = amdgpu_driver_open_kms,
 	.postclose = amdgpu_driver_postclose_kms,
 	.lastclose = amdgpu_driver_lastclose_kms,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
