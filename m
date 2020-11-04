Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 448132A5CF8
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 04:12:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 429EA6E934;
	Wed,  4 Nov 2020 03:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2063.outbound.protection.outlook.com [40.107.236.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE04A6E926;
 Wed,  4 Nov 2020 03:11:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zwq0A+1kqRiXwWYDutw1kmREMGMH24w/oBhtMuBed+nQOfKlV+4uhlD6T7tH55fczukvyn4w8QNPjJ/4U/Sk2/8tuU9bZ9oo/hdvd/rEr4bLSju5/sWiaUi15319ogJ4wBcWQngBRGQnes27gNBg1uOwhrwIuFB3CHo0n8I+AsVuIJtcVauYT4tzRin7++qOVLnMMlQS+60eOGniaeAwLnDL8GL0yOhvDe8bJ5WY+B/Xtq70Xo5q8erJl1mF5R5YxjeIsWj+rjcbGwW4kRj1Ny4xyQgrQv7bx/AS+zgsUVBYajmyJj0RBZRkUQKwMFVEjJNCFOkPnobX5TjprXwVUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXvkh2ALUYeQMlBiuTfgbyKimax6K796vVMMqrSh7DE=;
 b=CYDZa3BjFJ6J//3jnb/1g5NH8ElkhLRFiRBgIBil6sGvtLYL1GcEbKZhB5gqJpVkAYVciz1aw6XykWAtM5RSk1ORkZ3LybBwo3QNLozuMYgQnVC/Rs637XulAGaZZA84bCQhHVldSbv0uzPq+5gYYJDBZKDOCJ7ynjX4Dx2aLX7KkLERHeLbG7a/5eGMM1ud9QKQx0+CyVvgSK5TdSas2FQFoNbRA0re6ALKAT6WtIbdo+z4ZNIgKEsBnBzHmPv+65ZU5iLzzkcfMRu9ge9d2P1fgfphj1ooFauN66qtHgu8GoqvWk1qIAyv3ulYTBqP+4r6h5ccLaSoy9tYgis95A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXvkh2ALUYeQMlBiuTfgbyKimax6K796vVMMqrSh7DE=;
 b=RPRmTm/gis7pHJYKICMqs3k+gL87u1UQKUS9FO4ZBPbEG14u6ji8FjRBMGKMKWy73aPrtLcrr1tmukfSrzAoWdnmfi42xgey1xB7KkrTPqouii3MUaOyS9lQnyUeox3nyPP/iaq7Lcsbj5SPQk8lX13k82SE6tJx8oXzZ3Hr0Rk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM5PR12MB1770.namprd12.prod.outlook.com (2603:10b6:3:108::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 4 Nov
 2020 03:11:49 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::935:a67:59f8:7067]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::935:a67:59f8:7067%7]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 03:11:47 +0000
From: Luben Tuikov <luben.tuikov@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/amdgpu/virt: fix handling of the atomic flag
Date: Tue,  3 Nov 2020 22:11:28 -0500
Message-Id: <20201104031129.361178-2-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.29.2.154.g7f7ebe054a
In-Reply-To: <20201104031129.361178-1-luben.tuikov@amd.com>
References: <20201104031129.361178-1-luben.tuikov@amd.com>
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: YT1PR01CA0082.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::21) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain.amd.com (165.204.55.250) by
 YT1PR01CA0082.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.19 via Frontend Transport; Wed, 4 Nov 2020 03:11:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a7eea442-3a3b-4ead-a872-08d8806f5d48
X-MS-TrafficTypeDiagnostic: DM5PR12MB1770:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1770F58F8E15F658541C192E99EF0@DM5PR12MB1770.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h8x1AwLL9CRuLpD6Maz5+6CoUqYFG/Oz1icbYa3NnWFQImRi29lOCPAuwa8tBgEKqImqfDlL4u6//+ysWxk0eEZkoG/xiwevcvafY7adWFwbpK9IplOrqTZe4hCt4mwsFDkD77b2btKoaZWELQ8hkYItGxmAYL/iZjwUk2kHprpQp8BBMFIybBPNzbVjCiGde64KVdR0hcXRNukD+U+Jk5dP/Ia6UfYzIlg4DIkFpN7Z4ykQRrMrq8WdXo20I7dXrDf+YPhvaXxJ2eeS0ogjYEvCiEqxsRISMmdFQ+R8MvaPGZ7pa8rCLIqEfNDsTWmCl8wSd85G3hCxVKw7a3K/zQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(5660300002)(36756003)(186003)(7696005)(2906002)(44832011)(6486002)(16526019)(6666004)(26005)(478600001)(52116002)(2616005)(66946007)(8676002)(86362001)(66556008)(8936002)(54906003)(4326008)(956004)(83380400001)(1076003)(316002)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: cEP3zHAq/d68iCnuy77j37MQ88C5edVdosZrRXq6S8KGrhOcc8+MvW55J7QJTXvD0KveSS5+vW507uogX/L+EELyZvaUtHwgTwnIVTEmQ64lRbuz6L64qIf3lDRK/XFaSAjfsuR6Z7z+nEobgLCX0QQ1frxk7iMHu0Dob/YVRCX2/j/D5TU3FzNiGupkbcEvZVe05ZEbh33F/oCQHMYWKgqvnDPlh4V+uARA2NWtXozpceuzh7MOjxir3q/Ai7OO+PTRqRSAz6GSjoZOaitL9hLTRlJ8U7iJ3MhEXXZ/KtIQRRk8LubkWupDsK++WCVLTrk3CApZyXCveL0Pb0jMeG7uC9IHUsWpmZGdtRuUroBRendJd4RtEd0oPBlrROhXiJWKnRSQb0mezGn5NMjNk9oSwC0dNxod4BaAAE28SKfLmEUNt0YYvXtCp6YdfVOawVOGxnnAUHfdUN86Xc9fMeNCwXmuv8rlrXYKq8ZyWJKDSb2sI/JEmewf4zgBKcil5lv3ndaUsA5oG8nptDMf9vnK1JUek5TwyVjchML9pe2RMiioExmzh9Hn8JlQXFZBkyBS7ulFE/20ih7wsXJ25spRepe+zCByDDsY329e8kXOK+Uiro9m2xPRtF96HD1VQZU06KZIKy/M6PoTYOowvw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7eea442-3a3b-4ead-a872-08d8806f5d48
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2020 03:11:47.6548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4XbZWyLVp7Ach9lrbckcjmjnoqUwrJGzr6YEYPJqIqkdyqtNl/GUgZrhsLEaLL5V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1770
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, Luben Tuikov <luben.tuikov@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Deucher <alexdeucher@gmail.com>

Use the per device drm driver feature flags rather than the
global one.  This way we can make the drm driver struct const.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
index d0aea5e39531..8aff6ef50f91 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
@@ -47,11 +47,13 @@ bool amdgpu_virt_mmio_blocked(struct amdgpu_device *adev)
 
 void amdgpu_virt_init_setting(struct amdgpu_device *adev)
 {
+	struct drm_device *ddev = adev_to_drm(adev);
+
 	/* enable virtual display */
 	if (adev->mode_info.num_crtc == 0)
 		adev->mode_info.num_crtc = 1;
 	adev->enable_virtual_display = true;
-	adev_to_drm(adev)->driver->driver_features &= ~DRIVER_ATOMIC;
+	ddev->driver_features &= ~DRIVER_ATOMIC;
 	adev->cg_flags = 0;
 	adev->pg_flags = 0;
 }
-- 
2.29.2.154.g7f7ebe054a

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
