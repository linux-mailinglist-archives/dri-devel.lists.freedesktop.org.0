Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A45073BA634
	for <lists+dri-devel@lfdr.de>; Sat,  3 Jul 2021 01:05:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1ABC6E21D;
	Fri,  2 Jul 2021 23:05:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BCF26E216;
 Fri,  2 Jul 2021 23:05:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OfLtsv7FBgS6ZKJWG3GfunZXSB3uUDEiZn3CyzZSGUSh6KglSXdRcaSlW73AaLuAbqnL74Nk5oXDvE1jye4WgmH74XHgpv4CivEZ0xlT81NyKatytM3o7YoVpwlbNgfi/qPlpNJ9HEzMDgiucTslKz4V78pinjLIRPFBSiodqpHerJvkUDzrDNPPXmi4fJ7ofGz+6UjlE0cZxTtthN5oJtSwEVMz8glWZNoJ0IJ+QWS6+9viLpFmVoamk9qDauZSdRVejNI+E2w8ukNsFAJhub5QermG/06ipXiRzsurIA17UV8gTM4obNVshzHT824y5MSCpA1q+MGehE3KrzVL3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDj49dAYvo4b6H+hnVy2At5BIDxumBxIfqo5cWFIZSU=;
 b=Ksfs/KKi/U9qES1B10/xbS8QoyIfeaMpdE//21zfmln13RXz4yIXWEL8ggwz8AW6pPYNP4Dc5Tu6bmKdNZmekI7L67EztmRy4tA4Tw1uDlrggKmEietH1pgJn6h1j/MRScZsvx5X2c09cY9LU2MqUJzxjHogm641KP04cngKhHsmF2xA0qzvZ765RRJ4SGwqqf3BC56O0a6raHM7P1DYw0SZARRRQ3Ya0T2eyznD2z/vi0KysLF2ZWOIt7kHLqpNTGm1RaJrIomyJqLer0dl9cOO9GGyuGEUP0a/KF0pR2+ShaSmkOiPu6Dqfq3DjWTcCvT8bWBn3Bo7RYoFP6BEMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDj49dAYvo4b6H+hnVy2At5BIDxumBxIfqo5cWFIZSU=;
 b=pi/gbA3Ei1dISb2ICXpVxRdKz6A28caqKy8fKp9f7F0HUHNLfdFd+a3skt8qqSZlI0Hd1FBXpay1XtWkrFymCns29H55Mr+OFOeFSshwDiHMbzjw4JKgCvTYMVd4u3WlR4T2HJD4024iViGLgZLoNuH+3uJGKRkZXGKwUpS0Aaw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM5PR1201MB2504.namprd12.prod.outlook.com (2603:10b6:3:e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.21; Fri, 2 Jul
 2021 23:05:10 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::50f2:699c:121d:f257]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::50f2:699c:121d:f257%4]) with mapi id 15.20.4287.023; Fri, 2 Jul 2021
 23:05:10 +0000
From: Luben Tuikov <luben.tuikov@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: Return error if no RAS
Date: Fri,  2 Jul 2021 19:04:55 -0400
Message-Id: <20210702230455.31196-1-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <a836cafa-86a9-3d72-1f02-f9f2d58ee127@amd.com>
References: <a836cafa-86a9-3d72-1f02-f9f2d58ee127@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [108.162.138.69]
X-ClientProxiedBy: YT1PR01CA0059.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::28) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (108.162.138.69) by
 YT1PR01CA0059.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.23 via Frontend Transport; Fri, 2 Jul 2021 23:05:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: edf4c41b-ecc1-4e6f-39fb-08d93dadd73b
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2504:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1201MB2504BB845ACA6FE22B0F6FD0991F9@DM5PR1201MB2504.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GutNB8pW9AHtFn5MaNXexJ/VhwcJRUFmc7TG2aI4g+IyMA+1SWllQer7MtXdgptsGADL7ZMWtCiZDhev7EfOp+6qfkFfljvUFJAr7TGUWNi8wOvq+ZNBtIE9iiHranQnctwFbNK8+H3nAI0vRTM114OvIDUAYuureEITs4Ty++2FB1gYCzVIpV6Uyn5GkX1R7OJhQIPxxSrdXa1380F6T7DUOMrEzGG2MHP681V2nu+wbqNRDXWqikSxanp9joU7agFI2vRo5E7kN2p/PPWZdsL2mhWQWue+CmAYZE5lUjS/KQjvioPylDrBsgaLUB/Nv0vDxxKgo1TBGqhkux1IubySJVyRIXvgzm0CjhOSvCly1XMHdtoW3CENrBrQJLYLeF5f1X+f4ph5czvpAjgng/IdJPpoODrloOl8XkYBJT6ozt4LyXr/EVP+SVoFtFXE2XgoFbs6DOdIccyUqzVnuNoQj+ukWCZiGNEKazlfovNMRixyWpE4zcP04ow5MwmnlhMzh3mnFYkPbuv75wqfGwYScHP1zni/m89z019ITjQUm9H8nVhqionIA34ZryDxnEsihBfKl2SK0xOiad7hxgLxTGlZTaQXEx+YHNszT26ggJT2lCsd0hmhCsluQzC29bwAgr/cCXZXGl2fs4N2elW0vEBZAgKTVmYN8uRtPrcamMrUEOoibyoXNOYPkWsxEtUmDWRVGU7xHL3nFDn/CCtKwtWDjzz9ymN+ZYCVOxk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39860400002)(396003)(376002)(136003)(6666004)(6506007)(66476007)(316002)(83380400001)(55236004)(38350700002)(86362001)(38100700002)(4326008)(66946007)(5660300002)(6916009)(54906003)(478600001)(66556008)(1076003)(2616005)(52116002)(6486002)(44832011)(6512007)(36756003)(186003)(956004)(8936002)(2906002)(8676002)(26005)(16526019)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dNq4w6ABhgVY2m50rk8nZ5qjRIzksf8U+h0eKFIYHfnjCziXB0MMH69/lxRq?=
 =?us-ascii?Q?rKVn3NtypBSCzlgXJi1pELtketeKxb19jYz/p71d7GG7sk1ztxLfBHBwPN3i?=
 =?us-ascii?Q?3jhai0SyEcAmF9ncIktxu147fytLKGYDACb1ONAFPSQKeIb6E2YOYZuSLxo/?=
 =?us-ascii?Q?PBrN4+H3WlGYtT2OmD+qXXkFix4TIu4fmmwU2/F4C+1jGhlhvEoa80jim2jV?=
 =?us-ascii?Q?RmmRhdHAx7DddlOsiOnu+IxbL1OrepDKUdiNS7INDZ41dCB0LQfS8Z0tVBqY?=
 =?us-ascii?Q?aZAH3LaELmPILWsegCE5ZlJhb1zCDv6hOe0uw4uURFwwh9pWww+cev3i8RV8?=
 =?us-ascii?Q?fZ1c61gVARHMd5HrXJjDH0/L6lqFiXaWVMgcWBfBtODhZCfnV3nhnCzjUuD7?=
 =?us-ascii?Q?X/EX3LjV6jwdC/xH0BhYSSsFvPB7gEjcu0/ql5tjOzLP0GOJay9jOHtN4KmW?=
 =?us-ascii?Q?vcZaD0Kicyukf13nLoFFz/iG29MnKlwmABs/tbj7kdMe+bX+Y/GCjbOb1I9B?=
 =?us-ascii?Q?fwwwJXYl5cG7SKZpG7rPMGuG9037Vlpb8fsZusniiwXvTAJGqAAyYVl/8ysD?=
 =?us-ascii?Q?mN4Y6QMc8mrGh5BogUxBI8cvxNXeCvsAqjGsE+jE+itGvwy6A52jelqyhZPR?=
 =?us-ascii?Q?Owxo9InmQn5zsBaVyFGGuj3FivI4WM7pdv9vHC7UyQNz4m8EYFxfJV3TeAe5?=
 =?us-ascii?Q?1MimTJ9RQnLzn0yZO2oq1f0nyWe1Zm/FHHX8JTjruzyjmxLTAul+3DdHtjKY?=
 =?us-ascii?Q?xGqgqjrNTIyPalbik87BU3MdMMJbehcXNXjOB6ywYrVq/TYSZ0O9P/VcdqXO?=
 =?us-ascii?Q?sQHggLOgIC/ZfwSfMql0REYit/P7jODjykyUOmwJaYvFlqig0Qf5LIbeim2V?=
 =?us-ascii?Q?LD2GEvsuNmPciNw5UHrfVWdF0RRGD+tsGrBhG+v02MGBv3LC9aJXcpP1JXrO?=
 =?us-ascii?Q?Mgb22NotRWAyx+xcEVoDMxr9/mz9C01rbJFpmdZtuu26h8ADHsn2OOuANQcV?=
 =?us-ascii?Q?5pTj41+bTKnVzfNzKKtc7tw8T/QynSR+qEEjLbdIdSCExBYCOREQFHto3hVZ?=
 =?us-ascii?Q?xic1c5dD8g7mtAqp2GNnXZ0CyMV9xrulSVHvp7LzjWqfgFwyd+i21DpPQASk?=
 =?us-ascii?Q?BzypDrMc59dVDfb/MHKFEHr7i0xQ+pRW27olBwiuuBvQeTw+KkS6Z73RBEwL?=
 =?us-ascii?Q?gKswEWHPS8InE4JedeG/NeoOCnI6yysHDUcbPDWT9c5U5VRcxdxS7At4umwf?=
 =?us-ascii?Q?smBcF1ja6LmsaAUmX5oMk5zIEt+W7Gi0A8yoIXPRGHqJXJI8GiYQImE4t4AW?=
 =?us-ascii?Q?Dr0EnbJatXJJ5QoJ/MW1kGWg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edf4c41b-ecc1-4e6f-39fb-08d93dadd73b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2021 23:05:10.1044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AxJCt2qFrI2oFT03yZatDAHTcOoHudzbJ2VHXJ5bu5nS6MlFyiMgwU7dXAGrxWBK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2504
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
Cc: Luben Tuikov <luben.tuikov@amd.com>, guchun.chen@amd.com, airlied@linux.ie,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Xinhui.Pan@amd.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, nirmoy.das@amd.com, Stanley.Yang@amd.com,
 Tom Rix <trix@redhat.com>, Alexander Deucher <Alexander.Deucher@amd.com>,
 John Clements <john.clements@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Dennis.Li@amd.com, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In amdgpu_ras_query_error_count() return an error
if the device doesn't support RAS. This prevents
that function from having to always set the values
of the integer pointers (if set), and thus
prevents function side effects--always to have to
set values of integers if integer pointers set,
regardless of whether RAS is supported or
not--with this change this side effect is
mitigated.

Also, if no pointers are set, don't count, since
we've no way of reporting the counts.

Also, give this function a kernel-doc.

Cc: Alexander Deucher <Alexander.Deucher@amd.com>
Cc: John Clements <john.clements@amd.com>
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Reported-by: Tom Rix <trix@redhat.com>
Fixes: a46751fbcde505 ("drm/amdgpu: Fix RAS function interface")
Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 49 ++++++++++++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h |  6 +--
 2 files changed, 38 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index c6ae63893dbdb2..ed698b2be79023 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -813,7 +813,7 @@ static int amdgpu_ras_enable_all_features(struct amdgpu_device *adev,
 
 /* query/inject/cure begin */
 int amdgpu_ras_query_error_status(struct amdgpu_device *adev,
-	struct ras_query_if *info)
+				  struct ras_query_if *info)
 {
 	struct ras_manager *obj = amdgpu_ras_find_obj(adev, &info->head);
 	struct ras_err_data err_data = {0, 0, 0, NULL};
@@ -1047,17 +1047,32 @@ int amdgpu_ras_error_inject(struct amdgpu_device *adev,
 	return ret;
 }
 
-/* get the total error counts on all IPs */
-void amdgpu_ras_query_error_count(struct amdgpu_device *adev,
-				  unsigned long *ce_count,
-				  unsigned long *ue_count)
+/**
+ * amdgpu_ras_query_error_count -- Get error counts of all IPs
+ * adev: pointer to AMD GPU device
+ * ce_count: pointer to an integer to be set to the count of correctible errors.
+ * ue_count: pointer to an integer to be set to the count of uncorrectible
+ * errors.
+ *
+ * If set, @ce_count or @ue_count, count and return the corresponding
+ * error counts in those integer pointers. Return 0 if the device
+ * supports RAS. Return -EINVAL if the device doesn't support RAS.
+ */
+int amdgpu_ras_query_error_count(struct amdgpu_device *adev,
+				 unsigned long *ce_count,
+				 unsigned long *ue_count)
 {
 	struct amdgpu_ras *con = amdgpu_ras_get_context(adev);
 	struct ras_manager *obj;
 	unsigned long ce, ue;
 
 	if (!adev->ras_enabled || !con)
-		return;
+		return -EINVAL;
+
+	/* Don't count since no reporting.
+	 */
+	if (!ce_count && !ue_count)
+		return 0;
 
 	ce = 0;
 	ue = 0;
@@ -1065,9 +1080,11 @@ void amdgpu_ras_query_error_count(struct amdgpu_device *adev,
 		struct ras_query_if info = {
 			.head = obj->head,
 		};
+		int res;
 
-		if (amdgpu_ras_query_error_status(adev, &info))
-			return;
+		res = amdgpu_ras_query_error_status(adev, &info);
+		if (res)
+			return res;
 
 		ce += info.ce_count;
 		ue += info.ue_count;
@@ -1078,6 +1095,8 @@ void amdgpu_ras_query_error_count(struct amdgpu_device *adev,
 
 	if (ue_count)
 		*ue_count = ue;
+
+	return 0;
 }
 /* query/inject/cure end */
 
@@ -2145,9 +2164,10 @@ static void amdgpu_ras_counte_dw(struct work_struct *work)
 
 	/* Cache new values.
 	 */
-	amdgpu_ras_query_error_count(adev, &ce_count, &ue_count);
-	atomic_set(&con->ras_ce_count, ce_count);
-	atomic_set(&con->ras_ue_count, ue_count);
+	if (amdgpu_ras_query_error_count(adev, &ce_count, &ue_count) == 0) {
+		atomic_set(&con->ras_ce_count, ce_count);
+		atomic_set(&con->ras_ue_count, ue_count);
+	}
 
 	pm_runtime_mark_last_busy(dev->dev);
 Out:
@@ -2320,9 +2340,10 @@ int amdgpu_ras_late_init(struct amdgpu_device *adev,
 
 	/* Those are the cached values at init.
 	 */
-	amdgpu_ras_query_error_count(adev, &ce_count, &ue_count);
-	atomic_set(&con->ras_ce_count, ce_count);
-	atomic_set(&con->ras_ue_count, ue_count);
+	if (amdgpu_ras_query_error_count(adev, &ce_count, &ue_count) == 0) {
+		atomic_set(&con->ras_ce_count, ce_count);
+		atomic_set(&con->ras_ue_count, ue_count);
+	}
 
 	return 0;
 cleanup:
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
index 283afd791db107..4d9c63f2f37718 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
@@ -491,9 +491,9 @@ int amdgpu_ras_request_reset_on_boot(struct amdgpu_device *adev,
 void amdgpu_ras_resume(struct amdgpu_device *adev);
 void amdgpu_ras_suspend(struct amdgpu_device *adev);
 
-void amdgpu_ras_query_error_count(struct amdgpu_device *adev,
-				  unsigned long *ce_count,
-				  unsigned long *ue_count);
+int amdgpu_ras_query_error_count(struct amdgpu_device *adev,
+				 unsigned long *ce_count,
+				 unsigned long *ue_count);
 
 /* error handling functions */
 int amdgpu_ras_add_bad_pages(struct amdgpu_device *adev,
-- 
2.32.0

