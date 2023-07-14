Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5810753757
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 12:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7952410E851;
	Fri, 14 Jul 2023 10:02:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::61b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F2910E851;
 Fri, 14 Jul 2023 10:02:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Doe/kIL7KXfGNib8peZz+eTcr71lAUnNbshFqBurPEGu2OaFwXYsoLj8k24TbprUBX4VO+VbJLrYvVFq4aMwk6buYEXOu5J+KXshOC+mlPhnysM0VmHBow0YP2lVkVCe/aoCRfVpUIdjz1A2VMQZJnNXOOsTg2pVkGvLdFbtObVC84liJ3QZr8w6GAKreAn4ddxLWKnadg9e2GqZqyTW8AC5f/8HtnIFGjdgbQBHdrzHx7JZHNnPxRyZNi41kZoiZxMNPOrTX+p5UtNmRDDIxeZa47cDqduSkXFQ2LK7ze1W2ht3imbXzMQjm6PcVFNgD+n0fOeo3WnxE1s9SJPmuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YjsU3cHSR/eKpYC9UfwPDyR/p8L6XNMvnaOCA8t4FjU=;
 b=n4s8uIRTPs9vcE6Z7s+8DPZqouDuw7z6jBEQkB2G/+/zDnQrFZKlBY0PzAUQABtOwooICuO93QoH9V70Ff+l1gtedQA3fVQTqHVtl9eBCdkWeKqV29mKwXV6nG4f6xHcweRO5HSmh4VGXHcq8HGLBMvHtJ6c3Wnt61L65FDeazc0L1fqxdKFRIavKk1EVhIErN7VGrF4mK3qYthJZafd115cmJpnqZWVNNvd55cu4HG8SAPDBtM/TIQ5LbIGH4CS69+WGAv9qX+Xm9EMZVrvMt49KJQTW4OkSiPlOn6e+3vS3DH1SSkywBUwpYvMVQTEAnzVrHuv3Z2lWv6r1/MDjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YjsU3cHSR/eKpYC9UfwPDyR/p8L6XNMvnaOCA8t4FjU=;
 b=sVFQVT5aqcq09bXq9p4NXVjyBYIPkLlbQlFmbbZ8oW3x2h5HDFzloZuAnvmCfZYeZlFUyZV5TXsbCrZIlqRaFgGSrDgoY8K1qPmx/RDehZDf0uWPH8HzvJX+C7mjbqjIUvrZcbRxuksVdZbq02WPGmvDEFW+YuNzOHn1S3isyZg=
Received: from BYAPR12MB2693.namprd12.prod.outlook.com (2603:10b6:a03:6a::33)
 by SN7PR12MB7348.namprd12.prod.outlook.com (2603:10b6:806:29b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 10:02:25 +0000
Received: from BYAPR12MB2693.namprd12.prod.outlook.com
 ([fe80::c141:bba7:6b43:8c13]) by BYAPR12MB2693.namprd12.prod.outlook.com
 ([fe80::c141:bba7:6b43:8c13%6]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 10:02:25 +0000
From: "Gopalakrishnan, Veerabadhran (Veera)"
 <Veerabadhran.Gopalakrishnan@amd.com>
To: "Guttula, Suresh" <Suresh.Guttula@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Liu, Leo" <Leo.Liu@amd.com>
Subject: RE: [PATCH 2/2] drm/amdgpu: Add FW shared flag for DRM KEY INJECT
Thread-Topic: [PATCH 2/2] drm/amdgpu: Add FW shared flag for DRM KEY INJECT
Thread-Index: AQHZtjgc8zVuAB3B6EqpVoUM74fxBK+5BeHw
Date: Fri, 14 Jul 2023 10:02:25 +0000
Message-ID: <BYAPR12MB26934057D5D3AF6DBE58D825FA34A@BYAPR12MB2693.namprd12.prod.outlook.com>
References: <20230714094617.3178269-1-Suresh.Guttula@amd.com>
In-Reply-To: <20230714094617.3178269-1-Suresh.Guttula@amd.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=d1adefa6-925b-4876-a16c-5d1069c92d70;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-07-14T09:54:19Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB2693:EE_|SN7PR12MB7348:EE_
x-ms-office365-filtering-correlation-id: 1e9c3e2b-efca-4332-9aac-08db84516cb3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GJYgyl8eLPTjBN1fu/LSNVnOsiudvsAbiupG3dg9zirlk96JAjy1pdgkW9lEjHT0EDVOa7S3Dz9GVaoMSgOekcslNaCIygfF3Pop74A/UozBqmccIXrsBF19FTW6uXuilmdSAAm9KKFJCIHcZ0s+t1Xz5xOXTdz9Or76dU7c8U4rmUBqItpV1aTJz51uGW1OenuNwX/l638zTy1vrYFwQ8L96kLsLvZU1U4L8OmfjjIVWuijMMcjoHOuRdzXxTh8fy3fBvirDxEcB7sBow5hlX2qQv4w5e3FaVfLEOcu70MvZWn/Rcpd3FmZywOQw2xYhOVGIdw7df9/ENcK3DkAxYMH6/ph6bLSePL5EnbogCk2iW98edvbL3zU0kajvxnoBr/2xu2sst9CIGqW+q2dEbt5WOm87GkTmIBTvVZz0ygB0cYtCiSMHzIFLyS51XKJ05GDLrkIZ9+maEJEwAQWytTxXMwTl+79+ehcawbG+Ucq22tR7AvROu49sZLqbu7AOrdpnqyw7EcoBcATJqORtkgjgOcFVTSRw0TXYHVXNTrUUD7dTBVVwIBrvPsK8y8JNVZLAX/ObA0S7UPdyiPj1k4OTRZ6bTwjvkR7zZRoUVJrBtksB+9oCXKatNXtmELi
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB2693.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(136003)(396003)(366004)(346002)(451199021)(7696005)(9686003)(71200400001)(6506007)(33656002)(53546011)(186003)(83380400001)(86362001)(38070700005)(38100700002)(122000001)(26005)(55016003)(4326008)(6636002)(66446008)(76116006)(66556008)(66476007)(64756008)(66946007)(41300700001)(2906002)(316002)(450100002)(52536014)(8936002)(8676002)(54906003)(5660300002)(110136005)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YpsspQ4pcMyJ7Ad2AhFRu2jRIQvNwfI8h0XISAxO7JQjZ3Uy84ccEAQeE0/d?=
 =?us-ascii?Q?zme/na+m+YPFxabHQjx2T0hAAyfDUQrnHPJyy4V/PrLCalYTSp7iDaE2FCAN?=
 =?us-ascii?Q?cdEgblLwbWVStczfvMCO3Ac3Wn0cmKiAlEvMltHuwfNY+yZT0txWKoDLLFTQ?=
 =?us-ascii?Q?dEgKxYKytmY+8UDNGcBTW+3zYbCcTpwX9q626fsqkwHFkZ6u2HtewJoj+xuW?=
 =?us-ascii?Q?4ADb8dhLvxwU+FO6rP1CvlaDA/sN9oR8sJ0bGErzD9kzDzCTrF/8102yjFIi?=
 =?us-ascii?Q?ZLfIRfQiPCnCPLzOlGD6mvq5BHhH9O4E90vrdQPAda0o9XpZp6Xz0o+57+8l?=
 =?us-ascii?Q?wGLfVvVmlfBUdjeVfEgduMmXHYc30EgtqkMQYjvbk63MXptJE0ddsN816Jk/?=
 =?us-ascii?Q?Fyv24L8QB1iGzsEpGlegum7SzfHUO/Y9ksDRrPY1/Q9dbuSSVmxhkUJ2fAkd?=
 =?us-ascii?Q?/N4YT/79lOJWpL2KatvkgdlGb9gsnITYDHc2bm3RsvcZoOVRU80BwDp155MQ?=
 =?us-ascii?Q?dq9Im+9rQ7pQy9N8we23cul3DGz7gseNqtUiInXBsWufZKWjkCrcyB4Q/PHS?=
 =?us-ascii?Q?SCOG5hOrkRQPggQXVHvn7/YJc3aUJU/vTWc3axtMwas3uYSjU36c/1z6yAqZ?=
 =?us-ascii?Q?AMQW8Jp+rbAmRqyW6IHLkAX0S9sjotMrL2SW6tTvdwI2pbhlEGUiWGPjbah4?=
 =?us-ascii?Q?1/nUwwgxaP9gFrDlBLBEWSzyfW8u9mzcoZpikSHJUxQNGHXvi79Xq4pvOGJb?=
 =?us-ascii?Q?OwbScOjGuVAen5Dcx4Qv8HDNYkzTGx5Z7AUBCyKONtNUARhGxmbGSePi55yu?=
 =?us-ascii?Q?8RcS8AldeiSTX9m6Jw/2/eDr/bLl7bfZzG4CBCDUOd7ZL9BNgM+KFxk7UyqT?=
 =?us-ascii?Q?G0yrv5Rq5jQjD1nwNEXWmqy1HX6ddA1gKiTU6IvJnydUn9/uO/uMCikzf16W?=
 =?us-ascii?Q?q2oGPfxdzENS6qyCx5G+PB3gnRFOJKQfe4Z6geaqZ836inbgYa4oJWVOZV5Y?=
 =?us-ascii?Q?jxCK0gOteLFHDJ0rzMkIWEcY0jUhMAcgdhzaeiQSLMbiYfCVtcgFlclJ/+pz?=
 =?us-ascii?Q?KQNCn0M7Lw9u84ZvB16jVvRyzvmFnPBOgH15AP4AjfORJ2JhAt7HEO1FfrBp?=
 =?us-ascii?Q?YajWFfd5n9FM6g2tgFtSIYRCVh2fkNJeI6ZtcDQx85MGxGZqWiqUJXfGgXf/?=
 =?us-ascii?Q?c3ZKjx6VxiBH21pvNJr+2JdQvUibBMtvFgemzl471dV5agFPEgtFesCYa+Gp?=
 =?us-ascii?Q?5HnvVpWyNlG+fp4JzZFcWD5FeS4O1IrRkUPpby3TK5AtQYVHPN40RTvEM1a2?=
 =?us-ascii?Q?3muyMsZvIDLZYmxQO7m9KZm9DVlY+oyETeL/Z4O4T5F7Nu8Tt1Yfzqb/EpvO?=
 =?us-ascii?Q?qZiCcO+CNwF29dq1Sp113+GCteHmtM7ENy8baPAcLuPdV3RNNqyorPlPUex+?=
 =?us-ascii?Q?ZTmom79Fl0GSbshXBQtpZupxi6jtU2Cx3yY5vDh11WVPhygm/OBY0aWNVVLX?=
 =?us-ascii?Q?pgdge/GdFduP1Srw2hqlDGc+LkdVJD6Xw4pobbjHPit5IIVSCkhAA8ZpcLxO?=
 =?us-ascii?Q?mtLZZAyk5i5LGjb4kBM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2693.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e9c3e2b-efca-4332-9aac-08db84516cb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2023 10:02:25.3470 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AC91OJQqoo68f4MPi/7MzPSdxBNlj/VmtNm9FBc//vudZ5I42Kp5A9qFuNwiIjyMkA6dFUzx7EkIThScCnnq9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7348
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Guttula,
 Suresh" <Suresh.Guttula@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - General]

Suresh,
Please modify the commit message to a more meaningful one.
1. add a commit title
2. write about the changes than the effect of the change.
Something like Enabling FW workaround in using shared memory for VCN 4
3. Can you please check if this change is applicable for VCN_4.0.3 as well?
The same changes may need to go in vcn_v4_0_3.c as well.

Thanks & Regards,
Veera


-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of sguttula
Sent: Friday, July 14, 2023 3:16 PM
To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Chri=
stian.Koenig@amd.com>; Liu, Leo <Leo.Liu@amd.com>
Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; Guttula=
, Suresh <Suresh.Guttula@amd.com>
Subject: [PATCH 2/2] drm/amdgpu: Add FW shared flag for DRM KEY INJECT

This patch will fix the secure playback corruption due to HW bug on VCN4.

Signed-off-by: sguttula <Suresh.Guttula@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h | 9 +++++++++
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c   | 4 ++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_vcn.h
index 1f1d7dc94f90..a3eed90b6af0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
@@ -161,6 +161,7 @@
        } while (0)

 #define AMDGPU_FW_SHARED_FLAG_0_UNIFIED_QUEUE (1 << 2)
+#define AMDGPU_FW_SHARED_FLAG_0_DRM_KEY_INJECT (1 << 4)
 #define AMDGPU_VCN_FW_SHARED_FLAG_0_RB (1 << 6)
 #define AMDGPU_VCN_MULTI_QUEUE_FLAG    (1 << 8)
 #define AMDGPU_VCN_SW_RING_FLAG                (1 << 9)
@@ -180,6 +181,8 @@
 #define AMDGPU_VCN_SMU_DPM_INTERFACE_DGPU (0)  #define AMDGPU_VCN_SMU_DPM_=
INTERFACE_APU (1)

+#define AMDGPU_DRM_KEY_INJECT_WORKAROUND_VCNFW_ASD_HANDSHAKING 2
+
 enum fw_queue_mode {
        FW_QUEUE_RING_RESET =3D 1,
        FW_QUEUE_DPG_HOLD_OFF =3D 2,
@@ -343,6 +346,11 @@ struct amdgpu_fw_shared_rb_setup {
        uint32_t  reserved[6];
 };

+struct amdgpu_fw_shared_drm_key_wa {
+       uint8_t  method;
+       uint8_t  reserved[3];
+};
+
 struct amdgpu_vcn4_fw_shared {
        uint32_t present_flag_0;
        uint8_t pad[12];
@@ -352,6 +360,7 @@ struct amdgpu_vcn4_fw_shared {
        uint8_t pad2[20];
        struct amdgpu_fw_shared_rb_setup rb_setup;
        struct amdgpu_fw_shared_smu_interface_info smu_dpm_interface;
+       struct amdgpu_fw_shared_drm_key_wa drm_key_wa;
 };

 struct amdgpu_vcn_fwlog {
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/am=
dgpu/vcn_v4_0.c
index d199f87febd1..9f32c9f73941 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
@@ -169,6 +169,10 @@ static int vcn_v4_0_sw_init(void *handle)
                fw_shared->smu_dpm_interface.smu_interface_type =3D (adev->=
flags & AMD_IS_APU) ?
                        AMDGPU_VCN_SMU_DPM_INTERFACE_APU : AMDGPU_VCN_SMU_D=
PM_INTERFACE_DGPU;

+               fw_shared->present_flag_0 |=3D AMDGPU_FW_SHARED_FLAG_0_DRM_=
KEY_INJECT;
+               fw_shared->drm_key_wa.method =3D
+                       AMDGPU_DRM_KEY_INJECT_WORKAROUND_VCNFW_ASD_HANDSHAK=
ING;
+
                if (amdgpu_sriov_vf(adev))
                        fw_shared->present_flag_0 |=3D cpu_to_le32(AMDGPU_V=
CN_VF_RB_SETUP_FLAG);

--
2.25.1

