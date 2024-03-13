Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0BD87B23C
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 20:48:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0372C10E7B5;
	Wed, 13 Mar 2024 19:48:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kS7Wg91O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061.outbound.protection.outlook.com [40.107.93.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A7910E7B1;
 Wed, 13 Mar 2024 19:48:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=da+VjRrEamoOmOaAtq6TuXl0PmNJNH0QapxTHHSN45bnvDhataqrpfJf4yUCPLzwt+qzG0/jf85DUNN5saewZUGImR1pBCOnylADUjKx542PH43mNajMFAv9B2Yhib/vPcPAni4sjhwoJlkvyIoueAP6iJZglsUe+Q6aRW7irIxpMLMAOkqA72vMDlhepUiXYDhkGrMSt+clFcaoR8Tr5DV7ocWHZ7joTLxJFaDdmMERGPZ2tKjreamyOl8Q/jNizxHfheIXgXuZ0PtD1nqG3+jmv2VCgYFJTkqA0lDQjYW4cIptQfY9K6/wwzaZ6zN+QYgcEIpJ70O8UJAvixpIEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FDxpGq6Z5WJcPm4lJB9pT5k382m0pZ+5gKY87Tzny5w=;
 b=VtP7t1Q1JsUt1zA/BcFgF3QVmqQDCyMDrNhTOtQ9rlSEJFXNy6D5dbvW8qfmKg93YCsuOxZEiL4Ipo8/OmMIYpnUQbnH6Iz/QYdz0vHLEpEDhzQi50Em26h7lODEDbTABtwpnT3v4X8BQ7MTsLCl5AQziSamGWXOfWgjf6CjBk7F+L22R3UE7c0WrNxMigQ3641P2aGQT+2kk173oZFISNYa8f2T061NUDnh/NYMKtN8kJNz9IN1jqTtohs2PZAyBbriTUNUWDMnMKsFjEqcMjczHpKqPPV3wXTwGXQpjqEZl1EjZALvhTVw45pfYZClslZFdFeEeJY+RQfiAV1Tdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDxpGq6Z5WJcPm4lJB9pT5k382m0pZ+5gKY87Tzny5w=;
 b=kS7Wg91OewLgTnH8UV9Za+UqApU7q2ho00ezluoT3U3h02cIIdfDTm+H5SmgxW4ycomftc5yIQoO2AHtsWik5HJgbLCp99rYSeiXwYzIgMP0Su9I942wnW2S8Y/1ue7kCLYEzINSV/2gos9elPx2QM6B0gvtFrCgIWhVRZcCHDs=
Received: from PH7PR12MB5596.namprd12.prod.outlook.com (2603:10b6:510:136::13)
 by DS7PR12MB8418.namprd12.prod.outlook.com (2603:10b6:8:e9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Wed, 13 Mar
 2024 19:48:30 +0000
Received: from PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6974:3875:ed0:7033]) by PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6974:3875:ed0:7033%3]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 19:48:29 +0000
From: "Khatri, Sunil" <Sunil.Khatri@amd.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Sharma, Shashank" <Shashank.Sharma@amd.com>
CC: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] drm:amdgpu: add firmware information of all IP's
Thread-Topic: [PATCH 2/2] drm:amdgpu: add firmware information of all IP's
Thread-Index: AQHadHqvmxkCngqE4E+taWjJ/7vkLrE2Fczk
Date: Wed, 13 Mar 2024 19:48:29 +0000
Message-ID: <PH7PR12MB55967E85ACB9593ED5A896FC932A2@PH7PR12MB5596.namprd12.prod.outlook.com>
References: <20240312124148.257067-1-sunil.khatri@amd.com>
 <20240312124148.257067-2-sunil.khatri@amd.com>
In-Reply-To: <20240312124148.257067-2-sunil.khatri@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=True;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2024-03-13T19:48:10.7155937Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB5596:EE_|DS7PR12MB8418:EE_
x-ms-office365-filtering-correlation-id: 23e52a4e-5597-4ee6-16bb-08dc43968ec5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QCrLBlOK1C7U9z6pCuooEUP8csmSdTiZ4RIDTrtAUd6QKMlLRUuabA4/PxmlWMbU9F+uoWhziVgJp2ZisdgjmKnEhfaGrG93gCZM81EeNk0GKVMSD0oEW1ZoxVm4B/7sOvbf11SGz8MGK8hDczf3Exla4jEQU1v4Eky81SazGP/2I5OXJyW6A1+H77EhpVkOSekVN8hcmlRKH0M098UpOBHS6jNanQak+DvVYdvIOjIzNlR4sAokjAHC0PQ8AkV4gxlptMC7s/RiSGQQB5BXSf1EpP/gffaFdeqXPhh/VICBLZPb6E4yON1lp+N1kmXy4jtMaFiqfnqBeBj33+g/W/d03Qmf+Q4L2DCbIwmDQ0OOcFPRREmgdFEVfnnk+KBjXfp/DQpBMukZPzQvoFZD3+zyb0kNY3dMx8l5hzILhzbkKkSaykp3EeOdvV/BIuR6Uo08xb85Mv/mT8p3M5yDXYqNh3m3PAtbThlvRgBhQ2clPbGGG7xjq9OVzZM9iPku0R6doY01iUmSyH+oD61tJEcjGTtxRL5g2yO0qyhEXPmwlE0JhxKEAXvLrfk1hLrqbW4ktiUOvBjs4luLBO8MqOfmIUU324w/6FVBX0Y+ag/VeVxid9BXRaLOVkx3mPZlOnpJwcQhJcvsL44hZXWAQ5Of4H5lyB+HG1H2B9hdSyc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5596.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tjnKL5n0ANXOQKwfTfOOHaL5tOxk1wCbyaamUX+IBOT/uLRYdEpbf+wrj4dw?=
 =?us-ascii?Q?MszDneEO1a9bA1mC15vfogkzdLu6WqvpAJly5TNu7OvYif7k/AGDQPenFvA+?=
 =?us-ascii?Q?vZbxnmolahBed+pf12Ruh4EAH5uaCXV1ZX+3By3Qv9/4XKZUMNC40UmqHHw7?=
 =?us-ascii?Q?MPOUT1YGEmHxDofcYbkbRm0h+V4tnJOZLBfVCt0mlLqhXbwMss10pECyVB0O?=
 =?us-ascii?Q?Vmi8RwamYoKgnXVZNxcT8xpwOOwW3MaxriKtgJMr8Rjga3aExgvgIlsJWHUt?=
 =?us-ascii?Q?KixZYv55XagwomrV6jjL95PFFjc7ULYFra/orJX8t3bk0Des6WOyxv5Ug6hS?=
 =?us-ascii?Q?RHscF28ybUAh/2P9d2Xr9/82XzrMCxM7ML0DGXm8uodrdh4GeZgCigFB7cBd?=
 =?us-ascii?Q?sbiBnRT1v2IZajQxLz7Kc2P3DMeqNTf8+sT85KVZ9RgAFBo478OfLPoArP6l?=
 =?us-ascii?Q?3t4yNxUC7Tg941umgox3VB3Tr5VFR4PvyHaUaMgVe2n7UsnaCBiY+BeDKFYL?=
 =?us-ascii?Q?k2Qs2VFWYVhWE4P2+/SdIrbygeyrAd29Xyhrym2cellnPYUlW30wm6EVluz3?=
 =?us-ascii?Q?77G9JnqwNVTtO3vRWVeUFApPKum0jRY9P7K0mp7pAR3w/a3Cg+/INDMnLpaN?=
 =?us-ascii?Q?uQDJG462OoQwIkbILbbaF58GE86TJ/VbW6AmYCo71eH65Z7jRSUodoX84aIi?=
 =?us-ascii?Q?uVFuGhnCDAXiJg3DEpFBt41d47I2S+2cUHuT/bnlsf7qUHLzFmphOyPBy4VW?=
 =?us-ascii?Q?29VVe21wm7E5StDD+gKs2h9wQjQFhxASJgb2oxZq/6+HCP09C1GIL45pN5kp?=
 =?us-ascii?Q?tJNkGuZ6GjZftn0rSMLdXk8kLIfMV+XrX6KeXipWHddLH7hHkNdmuFDv2C4r?=
 =?us-ascii?Q?H3qt+QXfv/BvAmA1TK61PXoCx1U0a4i8Z4ENUtagVo8g9A+aztfMHMtT6ELA?=
 =?us-ascii?Q?2SToGmUqDKjp6JFICfAvr+O8TnZFlMTZRjsqO785av2EbuXAnSD7zh/cdb+y?=
 =?us-ascii?Q?9pw1Xam7vd2sBmqKIKjCFfR3Lobosfn+GjU6NAjlPWElRocgbXBN/GxhOhwr?=
 =?us-ascii?Q?7JzoIMNPN4H7TW1IckoHP5hyzhbOEMlbZxggAls9wHCT1lF1qSDDcApBn+tO?=
 =?us-ascii?Q?G+hZUcO3rDm3rsSBgJGXuAjjvX9v9ZDObWh3Zh9LYNchJDZnmIvg5OBscSR7?=
 =?us-ascii?Q?gJw11S6p+9uTpe5h6yPmS1UVemyIcsPoISydnI4R42nSsR2pCCDo/0D6SlNo?=
 =?us-ascii?Q?Pv5gAXKkfosdje1sIROPaWy+3+RJiXDXBu4r+PR3KUoG6xf710hslDL2qNsF?=
 =?us-ascii?Q?IwRHJcUU7njBQe+utAbf/A7TmFisj+bLkVsMR+NCYzUwixwWOQ4DeDjFnoo0?=
 =?us-ascii?Q?CokOM9g89rRPBZrFOFj1yixVnh3d5j8jEEP0s3UTU7JRuskcDFSBbFYmmLUu?=
 =?us-ascii?Q?UUuiWjvMOP+PIgeebcxT0FOUjcCQBLSq1PvzAy5Yqm1Lj9377HzUQ79irfxx?=
 =?us-ascii?Q?QXtDNgOqjb9po/IUSI7EZaYgySdqSHeaFaVJOfzb/ANFTZmUlBXPijn75CvG?=
 =?us-ascii?Q?Wo6dY3G6MzXAGlNMBH2mA+Pf4fS/6b7biLz4gSJljKSfoHwlCavWsHR4x0r/?=
 =?us-ascii?Q?2w=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_PH7PR12MB55967E85ACB9593ED5A896FC932A2PH7PR12MB5596namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5596.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23e52a4e-5597-4ee6-16bb-08dc43968ec5
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2024 19:48:29.9005 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P/iUzO+O+IczztN2HR2szTL9EkHDCkspH4wnNkzwlUWe/4Lt+KfMbus07akSav5H+6oui7qDDD6orWMsnJ1jeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8418
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_PH7PR12MB55967E85ACB9593ED5A896FC932A2PH7PR12MB5596namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

Gentle reminder

Regards
Sunil

Get Outlook for Android<https://aka.ms/AAb9ysg>
________________________________
From: Sunil Khatri <sunil.khatri@amd.com>
Sent: Tuesday, March 12, 2024 6:11:48 PM
To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Chri=
stian.Koenig@amd.com>; Sharma, Shashank <Shashank.Sharma@amd.com>
Cc: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; dri-deve=
l@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; linux-kernel@vge=
r.kernel.org <linux-kernel@vger.kernel.org>; Khatri, Sunil <Sunil.Khatri@am=
d.com>
Subject: [PATCH 2/2] drm:amdgpu: add firmware information of all IP's

Add firmware version information of each
IP and each instance where applicable.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 122 ++++++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_reset.c
index 611fdb90a1fc..78ddc58aef67 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
@@ -168,6 +168,123 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool=
 vram_lost,
 {
 }
 #else
+static void amdgpu_devcoredump_fw_info(struct amdgpu_device *adev, struct =
drm_printer *p)
+{
+       uint32_t version;
+       uint32_t feature;
+       uint8_t smu_program, smu_major, smu_minor, smu_debug;
+
+       drm_printf(p, "VCE feature version: %u, fw version: 0x%08x\n",
+                  adev->vce.fb_version, adev->vce.fw_version);
+       drm_printf(p, "UVD feature version: %u, fw version: 0x%08x\n",
+                  0, adev->uvd.fw_version);
+       drm_printf(p, "GMC feature version: %u, fw version: 0x%08x\n",
+                  0, adev->gmc.fw_version);
+       drm_printf(p, "ME feature version: %u, fw version: 0x%08x\n",
+                  adev->gfx.me_feature_version, adev->gfx.me_fw_version);
+       drm_printf(p, "PFP feature version: %u, fw version: 0x%08x\n",
+                  adev->gfx.pfp_feature_version, adev->gfx.pfp_fw_version)=
;
+       drm_printf(p, "CE feature version: %u, fw version: 0x%08x\n",
+                  adev->gfx.ce_feature_version, adev->gfx.ce_fw_version);
+       drm_printf(p, "RLC feature version: %u, fw version: 0x%08x\n",
+                  adev->gfx.rlc_feature_version, adev->gfx.rlc_fw_version)=
;
+
+       drm_printf(p, "RLC SRLC feature version: %u, fw version: 0x%08x\n",
+                  adev->gfx.rlc_srlc_feature_version,
+                  adev->gfx.rlc_srlc_fw_version);
+       drm_printf(p, "RLC SRLG feature version: %u, fw version: 0x%08x\n",
+                  adev->gfx.rlc_srlg_feature_version,
+                  adev->gfx.rlc_srlg_fw_version);
+       drm_printf(p, "RLC SRLS feature version: %u, fw version: 0x%08x\n",
+                  adev->gfx.rlc_srls_feature_version,
+                  adev->gfx.rlc_srls_fw_version);
+       drm_printf(p, "RLCP feature version: %u, fw version: 0x%08x\n",
+                  adev->gfx.rlcp_ucode_feature_version,
+                  adev->gfx.rlcp_ucode_version);
+       drm_printf(p, "RLCV feature version: %u, fw version: 0x%08x\n",
+                  adev->gfx.rlcv_ucode_feature_version,
+                  adev->gfx.rlcv_ucode_version);
+       drm_printf(p, "MEC feature version: %u, fw version: 0x%08x\n",
+                  adev->gfx.mec_feature_version,
+                  adev->gfx.mec_fw_version);
+
+       if (adev->gfx.mec2_fw)
+               drm_printf(p,
+                          "MEC2 feature version: %u, fw version: 0x%08x\n"=
,
+                          adev->gfx.mec2_feature_version,
+                          adev->gfx.mec2_fw_version);
+
+       drm_printf(p, "IMU feature version: %u, fw version: 0x%08x\n",
+                  0, adev->gfx.imu_fw_version);
+       drm_printf(p, "PSP SOS feature version: %u, fw version: 0x%08x\n",
+                  adev->psp.sos.feature_version,
+                  adev->psp.sos.fw_version);
+       drm_printf(p, "PSP ASD feature version: %u, fw version: 0x%08x\n",
+                  adev->psp.asd_context.bin_desc.feature_version,
+                  adev->psp.asd_context.bin_desc.fw_version);
+
+       drm_printf(p, "TA XGMI feature version: 0x%08x, fw version: 0x%08x\=
n",
+                  adev->psp.xgmi_context.context.bin_desc.feature_version,
+                  adev->psp.xgmi_context.context.bin_desc.fw_version);
+       drm_printf(p, "TA RAS feature version: 0x%08x, fw version: 0x%08x\n=
",
+                  adev->psp.ras_context.context.bin_desc.feature_version,
+                  adev->psp.ras_context.context.bin_desc.fw_version);
+       drm_printf(p, "TA HDCP feature version: 0x%08x, fw version: 0x%08x\=
n",
+                  adev->psp.hdcp_context.context.bin_desc.feature_version,
+                  adev->psp.hdcp_context.context.bin_desc.fw_version);
+       drm_printf(p, "TA DTM feature version: 0x%08x, fw version: 0x%08x\n=
",
+                  adev->psp.dtm_context.context.bin_desc.feature_version,
+                  adev->psp.dtm_context.context.bin_desc.fw_version);
+       drm_printf(p, "TA RAP feature version: 0x%08x, fw version: 0x%08x\n=
",
+                  adev->psp.rap_context.context.bin_desc.feature_version,
+                  adev->psp.rap_context.context.bin_desc.fw_version);
+       drm_printf(p, "TA SECURE DISPLAY feature version: 0x%08x, fw versio=
n: 0x%08x\n",
+               adev->psp.securedisplay_context.context.bin_desc.feature_ve=
rsion,
+               adev->psp.securedisplay_context.context.bin_desc.fw_version=
);
+
+       /* SMC firmware */
+       version =3D adev->pm.fw_version;
+
+       smu_program =3D (version >> 24) & 0xff;
+       smu_major =3D (version >> 16) & 0xff;
+       smu_minor =3D (version >> 8) & 0xff;
+       smu_debug =3D (version >> 0) & 0xff;
+       drm_printf(p, "SMC feature version: %u, program: %d, fw version: 0x=
%08x (%d.%d.%d)\n",
+                  0, smu_program, version, smu_major, smu_minor, smu_debug=
);
+
+       /* SDMA firmware */
+       for (int i =3D 0; i < adev->sdma.num_instances; i++) {
+               drm_printf(p, "SDMA%d feature version: %u, firmware version=
: 0x%08x\n",
+                          i, adev->sdma.instance[i].feature_version,
+                          adev->sdma.instance[i].fw_version);
+       }
+
+       drm_printf(p, "VCN feature version: %u, fw version: 0x%08x\n",
+                  0, adev->vcn.fw_version);
+       drm_printf(p, "DMCU feature version: %u, fw version: 0x%08x\n",
+                  0, adev->dm.dmcu_fw_version);
+       drm_printf(p, "DMCUB feature version: %u, fw version: 0x%08x\n",
+                  0, adev->dm.dmcub_fw_version);
+       drm_printf(p, "PSP TOC feature version: %u, fw version: 0x%08x\n",
+                  adev->psp.toc.feature_version, adev->psp.toc.fw_version)=
;
+
+       version =3D adev->mes.kiq_version & AMDGPU_MES_VERSION_MASK;
+       feature =3D (adev->mes.kiq_version & AMDGPU_MES_FEAT_VERSION_MASK)
+                                       >> AMDGPU_MES_FEAT_VERSION_SHIFT;
+       drm_printf(p, "MES_KIQ feature version: %u, fw version: 0x%08x\n",
+                  feature, version);
+
+       version =3D adev->mes.sched_version & AMDGPU_MES_VERSION_MASK;
+       feature =3D (adev->mes.sched_version & AMDGPU_MES_FEAT_VERSION_MASK=
)
+                                       >> AMDGPU_MES_FEAT_VERSION_SHIFT;
+       drm_printf(p, "MES feature version: %u, fw version: 0x%08x\n",
+                  feature, version);
+
+       drm_printf(p, "VPE feature version: %u, fw version: 0x%08x\n",
+                  adev->vpe.feature_version, adev->vpe.fw_version);
+
+}
+
 static ssize_t
 amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
                         void *data, size_t datalen)
@@ -215,6 +332,11 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, s=
ize_t count,
                 }
         }

+       if (coredump->adev) {
+               drm_printf(&p, "IP Firmwares\n");
+               amdgpu_devcoredump_fw_info(coredump->adev, &p);
+       }
+
         if (coredump->ring) {
                 drm_printf(&p, "\nRing timed out details\n");
                 drm_printf(&p, "IP Type: %d Ring Name: %s\n",
--
2.34.1


--_000_PH7PR12MB55967E85ACB9593ED5A896FC932A2PH7PR12MB5596namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;font-=
style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[AMD Official Use Only - General]<br>
</p>
<br>
<div>
<div dir=3D"auto">Gentle reminder</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Regards</div>
<div dir=3D"auto">Sunil</div>
<div><br>
</div>
<div id=3D"ms-outlook-mobile-signature" dir=3D"auto">Get <a href=3D"https:/=
/aka.ms/AAb9ysg">
Outlook for Android</a></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Sunil Khatri &lt;suni=
l.khatri@amd.com&gt;<br>
<b>Sent:</b> Tuesday, March 12, 2024 6:11:48 PM<br>
<b>To:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Koenig, Ch=
ristian &lt;Christian.Koenig@amd.com&gt;; Sharma, Shashank &lt;Shashank.Sha=
rma@amd.com&gt;<br>
<b>Cc:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;; dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt=
;; linux-kernel@vger.kernel.org &lt;linux-kernel@vger.kernel.org&gt;; Khatr=
i, Sunil &lt;Sunil.Khatri@amd.com&gt;<br>
<b>Subject:</b> [PATCH 2/2] drm:amdgpu: add firmware information of all IP'=
s</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Add firmware version information of each<br>
IP and each instance where applicable.<br>
<br>
Signed-off-by: Sunil Khatri &lt;sunil.khatri@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 122 +++++++++++++++++++++=
+<br>
&nbsp;1 file changed, 122 insertions(+)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_reset.c<br>
index 611fdb90a1fc..78ddc58aef67 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c<br>
@@ -168,6 +168,123 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool=
 vram_lost,<br>
&nbsp;{<br>
&nbsp;}<br>
&nbsp;#else<br>
+static void amdgpu_devcoredump_fw_info(struct amdgpu_device *adev, struct =
drm_printer *p)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t version;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t feature;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint8_t smu_program, smu_major, smu_m=
inor, smu_debug;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;VCE feature versi=
on: %u, fw version: 0x%08x\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;vce.fb_version, adev-&gt;vce.fw_versi=
on);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;UVD feature versi=
on: %u, fw version: 0x%08x\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; 0, adev-&gt;uvd.fw_version);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;GMC feature versi=
on: %u, fw version: 0x%08x\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; 0, adev-&gt;gmc.fw_version);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;ME feature versio=
n: %u, fw version: 0x%08x\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;gfx.me_feature_version, adev-&gt;gfx.=
me_fw_version);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;PFP feature versi=
on: %u, fw version: 0x%08x\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;gfx.pfp_feature_version, adev-&gt;gfx=
.pfp_fw_version);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;CE feature versio=
n: %u, fw version: 0x%08x\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;gfx.ce_feature_version, adev-&gt;gfx.=
ce_fw_version);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;RLC feature versi=
on: %u, fw version: 0x%08x\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;gfx.rlc_feature_version, adev-&gt;gfx=
.rlc_fw_version);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;RLC SRLC feature =
version: %u, fw version: 0x%08x\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;gfx.rlc_srlc_feature_version,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;gfx.rlc_srlc_fw_version);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;RLC SRLG feature =
version: %u, fw version: 0x%08x\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;gfx.rlc_srlg_feature_version,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;gfx.rlc_srlg_fw_version);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;RLC SRLS feature =
version: %u, fw version: 0x%08x\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;gfx.rlc_srls_feature_version,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;gfx.rlc_srls_fw_version);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;RLCP feature vers=
ion: %u, fw version: 0x%08x\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;gfx.rlcp_ucode_feature_version,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;gfx.rlcp_ucode_version);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;RLCV feature vers=
ion: %u, fw version: 0x%08x\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;gfx.rlcv_ucode_feature_version,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;gfx.rlcv_ucode_version);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;MEC feature versi=
on: %u, fw version: 0x%08x\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;gfx.mec_feature_version,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;gfx.mec_fw_version);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;gfx.mec2_fw)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; drm_printf(p,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;MEC2 feature version: %u, fw version: 0x%08x\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; adev-&gt;gfx.mec2_feature_version,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; adev-&gt;gfx.mec2_fw_version);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;IMU feature versi=
on: %u, fw version: 0x%08x\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; 0, adev-&gt;gfx.imu_fw_version);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;PSP SOS feature v=
ersion: %u, fw version: 0x%08x\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;psp.sos.feature_version,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;psp.sos.fw_version);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;PSP ASD feature v=
ersion: %u, fw version: 0x%08x\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;psp.asd_context.bin_desc.feature_vers=
ion,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;psp.asd_context.bin_desc.fw_version);=
<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;TA XGMI feature v=
ersion: 0x%08x, fw version: 0x%08x\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;psp.xgmi_context.context.bin_desc.fea=
ture_version,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;psp.xgmi_context.context.bin_desc.fw_=
version);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;TA RAS feature ve=
rsion: 0x%08x, fw version: 0x%08x\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;psp.ras_context.context.bin_desc.feat=
ure_version,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;psp.ras_context.context.bin_desc.fw_v=
ersion);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;TA HDCP feature v=
ersion: 0x%08x, fw version: 0x%08x\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;psp.hdcp_context.context.bin_desc.fea=
ture_version,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;psp.hdcp_context.context.bin_desc.fw_=
version);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;TA DTM feature ve=
rsion: 0x%08x, fw version: 0x%08x\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;psp.dtm_context.context.bin_desc.feat=
ure_version,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;psp.dtm_context.context.bin_desc.fw_v=
ersion);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;TA RAP feature ve=
rsion: 0x%08x, fw version: 0x%08x\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;psp.rap_context.context.bin_desc.feat=
ure_version,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;psp.rap_context.context.bin_desc.fw_v=
ersion);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;TA SECURE DISPLAY=
 feature version: 0x%08x, fw version: 0x%08x\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; adev-&gt;psp.securedisplay_context.context.bin_desc.feature_vers=
ion,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; adev-&gt;psp.securedisplay_context.context.bin_desc.fw_version);=
<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* SMC firmware */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; version =3D adev-&gt;pm.fw_version;<b=
r>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_program =3D (version &gt;&gt; 24)=
 &amp; 0xff;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_major =3D (version &gt;&gt; 16) &=
amp; 0xff;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_minor =3D (version &gt;&gt; 8) &a=
mp; 0xff;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_debug =3D (version &gt;&gt; 0) &a=
mp; 0xff;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;SMC feature versi=
on: %u, program: %d, fw version: 0x%08x (%d.%d.%d)\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; 0, smu_program, version, smu_major, smu_minor,=
 smu_debug);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* SDMA firmware */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (int i =3D 0; i &lt; adev-&gt;sdm=
a.num_instances; i++) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; drm_printf(p, &quot;SDMA%d feature version: %u, firmware version=
: 0x%08x\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; i, adev-&gt;sdma.instance[i].feature_version,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; adev-&gt;sdma.instance[i].fw_version);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;VCN feature versi=
on: %u, fw version: 0x%08x\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; 0, adev-&gt;vcn.fw_version);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;DMCU feature vers=
ion: %u, fw version: 0x%08x\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; 0, adev-&gt;dm.dmcu_fw_version);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;DMCUB feature ver=
sion: %u, fw version: 0x%08x\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; 0, adev-&gt;dm.dmcub_fw_version);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;PSP TOC feature v=
ersion: %u, fw version: 0x%08x\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;psp.toc.feature_version, adev-&gt;psp=
.toc.fw_version);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; version =3D adev-&gt;mes.kiq_version =
&amp; AMDGPU_MES_VERSION_MASK;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; feature =3D (adev-&gt;mes.kiq_version=
 &amp; AMDGPU_MES_FEAT_VERSION_MASK)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; &gt;&gt; AMDGPU_MES_FEAT_VERSION_SHIFT;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;MES_KIQ feature v=
ersion: %u, fw version: 0x%08x\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; feature, version);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; version =3D adev-&gt;mes.sched_versio=
n &amp; AMDGPU_MES_VERSION_MASK;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; feature =3D (adev-&gt;mes.sched_versi=
on &amp; AMDGPU_MES_FEAT_VERSION_MASK)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; &gt;&gt; AMDGPU_MES_FEAT_VERSION_SHIFT;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;MES feature versi=
on: %u, fw version: 0x%08x\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; feature, version);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(p, &quot;VPE feature versi=
on: %u, fw version: 0x%08x\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;vpe.feature_version, adev-&gt;vpe.fw_=
version);<br>
+<br>
+}<br>
+<br>
&nbsp;static ssize_t<br>
&nbsp;amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void =
*data, size_t datalen)<br>
@@ -215,6 +332,11 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, s=
ize_t count,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (coredump-&gt;adev) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; drm_printf(&amp;p, &quot;IP Firmwares\n&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; amdgpu_devcoredump_fw_info(coredump-&gt;adev, &amp;p);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (coredump-&gt;ring) {<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; drm_printf(&amp;p, &quot;\nRing timed out details\n&q=
uot;);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; drm_printf(&amp;p, &quot;IP Type: %d Ring Name: %s\n&=
quot;,<br>
-- <br>
2.34.1<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_PH7PR12MB55967E85ACB9593ED5A896FC932A2PH7PR12MB5596namp_--
