Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 970AF1A619E
	for <lists+dri-devel@lfdr.de>; Mon, 13 Apr 2020 04:50:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CCC489DA4;
	Mon, 13 Apr 2020 02:50:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2088.outbound.protection.outlook.com [40.107.236.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A0189DA4;
 Mon, 13 Apr 2020 02:50:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a2/BpQT+NBixYEUp3p5nNetsehpKsv7epICOb9/zg2t2UJU/QE4pIfjG9fpdQHQ8AfPaVjtR3RUotdQSGO6vw9LxjezXkwWqlnsRuxWSKEzknSMgysKB6JoaQTPQpLbKVV0DI8md4bQh1BBP6FcpEuqGifPCR348rOKTnMkLRtzl/FQaBrVGE4mTxXZVIddN5g+RlnvQbND47FY7rfgAo7ORGOQon+nnpFLqRHI8WYwuI3FctWy6HOtsMDC4mLO9lWzOupVtFMAlrBvcdkPPKCrvl92kN3MW/sXEo3QgpYWonnGWc5bWzBPRDaYkPQmY72u6FJR57EceeqQq7J22rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gi3z6D7LI1jyYn0qGYcdPriGslYwAbsq3EWVtQMA9ZY=;
 b=WuU58Y5rNcHBROTblJcMpMXjNOPofBGmnRF8mLIHPTuXfv/TQmhSeljmqOYfJrcihzkgiDSzj7OOIS8o+R6vwYDgxFJFo+ugr9lqEJUghNCr6BD9GI3tXK6cfsFJrRikC2RHUo2xCWJdcVFXsm+U6dFd2K92yTXR3SM4AOOn6Ai9Poc1wTm4yHDoSTl4tghTXHKbHEEY/Qmqut6DyP6gIXWg4251+5cTEl3nz7H15iSIoV+pcfWcNc5xJ/E1SBz0BXxL8DdGUviXAn/2WHQ4SeIQDpoiLgykQVCqk9q4DYFPCRCvmvv8kdYt+xxqzZquccyWpF9c9C30346fkI/eiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gi3z6D7LI1jyYn0qGYcdPriGslYwAbsq3EWVtQMA9ZY=;
 b=H3DqDbhRw5+Up7Jl45w8YfVToshtZbs8zO+rkOrTtWCmf5rKvBhIBaiXxuywkwEWtAfJ9duc1NDiyKv1M5OZrK2Os9gYJAnAJldcLKkTEtcymgLIVPAFfYXCXO8ghv2rpNzAc7gtYk+aWAfn34E5gmzjGEg9SMSrE434XoI/9XA=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 DM6PR12MB3915.namprd12.prod.outlook.com (2603:10b6:5:1c4::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.26; Mon, 13 Apr 2020 02:50:09 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::5c27:185c:be20:1fb6]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::5c27:185c:be20:1fb6%5]) with mapi id 15.20.2878.022; Mon, 13 Apr 2020
 02:50:09 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Zhou, David(ChunMing)" <David1.Zhou@amd.com>, "airlied@linux.ie"
 <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "Zhang, Hawking"
 <Hawking.Zhang@amd.com>, "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "Liu, Monk" <Monk.Liu@amd.com>, "Russell, Kent" <Kent.Russell@amd.com>, "Ma,
 Le" <Le.Ma@amd.com>
Subject: RE: [PATCH] drm/amdgpu: Add missing '\n' in log messages
Thread-Topic: [PATCH] drm/amdgpu: Add missing '\n' in log messages
Thread-Index: AQHWEAoQdASoACOpX0iyhRsgnE8QdKh2XEiA
Date: Mon, 13 Apr 2020 02:50:08 +0000
Message-ID: <DM6PR12MB26190847ADE19FC3BC5BBD56E4DD0@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20200411140356.28211-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200411140356.28211-1-christophe.jaillet@wanadoo.fr>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=2c42595f-1e44-4d72-a3f0-00002f97f841;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Use Only - Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-04-13T02:49:42Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a4ba2bde-aeca-4796-38ed-08d7df55611d
x-ms-traffictypediagnostic: DM6PR12MB3915:|DM6PR12MB3915:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3915B58C6479831090EB4F3BE4DD0@DM6PR12MB3915.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:619;
x-forefront-prvs: 037291602B
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(376002)(136003)(366004)(396003)(39860400002)(346002)(76116006)(316002)(6636002)(6506007)(26005)(86362001)(64756008)(66446008)(478600001)(66556008)(81156014)(66946007)(53546011)(4326008)(110136005)(33656002)(8676002)(71200400001)(8936002)(7696005)(186003)(15650500001)(54906003)(66476007)(9686003)(5660300002)(2906002)(52536014)(55016002)(921003)(21314003)(1121003);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6MOFRRZzYGuUkNsFy46ictYesbxAYFLebIoZTVT5zNVZVQNPC+KPZfCjhHMt09U1Mk3oHFGjOSmmLBUKkGUGhY8IngYYr8TI3q3HC5U7gihGg3GDU8Enq3R1o5RwzFBSDjntxWjEByzh+YfOEO2kZRvxbtoHHYmb8+kwt2OCdS349vgeF6GSWpRh+FfJqe0uaxYHvfO7VYo07WKeuHBajkxFaTarOpOCInmC+C4jqU3iVBq5t9TSamYxT0CMKmrmy824ochUWcsbAoVOYaryrHeK72oGohueWt1x3E4XTuRmkwFqR81QqNpaF0z53ih/9xDPRE1/dST6L6sBn6XH3udiQpiV5AV258YVminRe1me2AoCyTXvyrPso6DUohQ3RNi5TLcxZcPZUMaS79nzCGt0TZLF3nmwq0U7MwOs9lUWCiArPdyYpbgxABvYm7H86c5va+mtjPwqKFpV0nmSBKrP69J1i0Jf22GXBso8TQwNRPeBMTOGVxR2VHxgG20vcz93oQuDL2ztjag8nJJQfg==
x-ms-exchange-antispam-messagedata: AKbkIEBHTy1KNg8QhMJ0/b7Lbt0657TrSUk35v6FMBPtQvE6SXKSIE4AWn0MZ2/V7LL1zdQXpslZh42yaiBOKBSboV62HqoqwuBGoFbTkvLdJQF0nH6NahVjzG5SK1R5lZn4w+qttIRHNZfinr7czQ==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4ba2bde-aeca-4796-38ed-08d7df55611d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2020 02:50:08.9590 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fhqJj1T+d7TOTp3VzoBeVe4XDDehkCrqwbnFBuJTAklGe0y95JBlrqrFzJVCcY3g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3915
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
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Evan Quan <evan.quan@amd.com>

-----Original Message-----
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr> 
Sent: Saturday, April 11, 2020 10:04 PM
To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Zhou, David(ChunMing) <David1.Zhou@amd.com>; airlied@linux.ie; daniel@ffwll.ch; Zhang, Hawking <Hawking.Zhang@amd.com>; Quan, Evan <Evan.Quan@amd.com>; Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; Liu, Monk <Monk.Liu@amd.com>; Russell, Kent <Kent.Russell@amd.com>; Ma, Le <Le.Ma@amd.com>
Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; kernel-janitors@vger.kernel.org; Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] drm/amdgpu: Add missing '\n' in log messages

Message logged by 'dev_xxx()' or 'pr_xxx()' should end with a '\n'.

While at it, split some long lines that where not that far.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Most of them have been added in commit bd607166af7f ("drm/amdgpu: Enable reading FRU chip via I2C v3")
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 87f7c129c8ce..3d0a50e8c36b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3249,25 +3249,25 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 
 	r = device_create_file(adev->dev, &dev_attr_pcie_replay_count);
 	if (r) {
-		dev_err(adev->dev, "Could not create pcie_replay_count");
+		dev_err(adev->dev, "Could not create pcie_replay_count\n");
 		return r;
 	}
 
 	r = device_create_file(adev->dev, &dev_attr_product_name);
 	if (r) {
-		dev_err(adev->dev, "Could not create product_name");
+		dev_err(adev->dev, "Could not create product_name\n");
 		return r;
 	}
 
 	r = device_create_file(adev->dev, &dev_attr_product_number);
 	if (r) {
-		dev_err(adev->dev, "Could not create product_number");
+		dev_err(adev->dev, "Could not create product_number\n");
 		return r;
 	}
 
 	r = device_create_file(adev->dev, &dev_attr_serial_number);
 	if (r) {
-		dev_err(adev->dev, "Could not create serial_number");
+		dev_err(adev->dev, "Could not create serial_number\n");
 		return r;
 	}
 
@@ -4270,7 +4270,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 		job_signaled = true;
 
 	if (job_signaled) {
-		dev_info(adev->dev, "Guilty job already signaled, skipping HW reset");
+		dev_info(adev->dev, "Guilty job already signaled, skipping HW reset\n");
 		goto skip_hw_reset;
 	}
 
@@ -4339,10 +4339,12 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 
 		if (r) {
 			/* bad news, how to tell it to userspace ? */
-			dev_info(tmp_adev->dev, "GPU reset(%d) failed\n", atomic_read(&tmp_adev->gpu_reset_counter));
+			dev_info(tmp_adev->dev, "GPU reset(%d) failed\n",
+				 atomic_read(&tmp_adev->gpu_reset_counter));
 			amdgpu_vf_error_put(tmp_adev, AMDGIM_ERROR_VF_GPU_RESET_FAIL, 0, r);
 		} else {
-			dev_info(tmp_adev->dev, "GPU reset(%d) succeeded!\n", atomic_read(&tmp_adev->gpu_reset_counter));
+			dev_info(tmp_adev->dev, "GPU reset(%d) succeeded!\n",
+				 atomic_read(&tmp_adev->gpu_reset_counter));
 		}
 	}
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
