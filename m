Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3C13BC4B1
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 04:04:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A45E389938;
	Tue,  6 Jul 2021 02:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6CB898EA;
 Tue,  6 Jul 2021 02:04:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mjRirFZZQk5i+pPb8VqF1yRYQX2knI/xNAGhpJwHpFL82+TiwMlOgM0llyiBEqYKC9stBRMIly/zlYFzBPveLnVcwFO5r6QSGGYz0Th1JPhiO5NqXKAupQx0TG+AD4f0DdaywtPvE9Sjw4N5a5BmiHlN+5tDxGHSGcDoGfFFPU/5zokvOM7nkbCSwWH8/OKD0SVBZeSwOBzuruE3tGzPwDw3GMz5Lr/jvrSPQIWQlnlNSFKLdpL0fRaNoFeZiYvrdXUjfadKNMGW5khU5VfuvICiC8HfRG66JR6ZclyqD4o1Z9R6pErg7SvEtAS6qX9/hot0hR8UrVkBp10X4YcXeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8Nhmo2aBlk1wMh1/ezaSp7leKqLGdPjsCelBWMdgW0=;
 b=SqS3XWdxT+gwN7JL2UASx5a0T7lhMCT3yHILungl1C536jVaCFz/BBqHrFYwOss+2fzUrbwkosrfvTVcGVphECC/4nX0k7oT+Yi7YuMYtfiHQzIG1lI7OUwnQWOKdStKStMEBhozpphzyLCEp0pB/w+GYfWVuDzJ/Ah5vDohb4P7s0WbmWO6P4vxmcz+9WHE2ex4GMM3g9/NpOaMk+InoMWq9jdurHAAuUILEInXZMPoWeRo/IpyZVferS4PpDjEDwTinEW2/+dBMU0DnalRbzvWrGxWeaacUzeVIcf0ZuJMTn93nWlZh6ZLwyZJBYoQFeB63hJwMKjP3G4+SptCcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8Nhmo2aBlk1wMh1/ezaSp7leKqLGdPjsCelBWMdgW0=;
 b=ePRtcAzMAD6/ZCwslKe04NBP0mZkGuM9n1OgVb8BWaw0aOIIqaEb8wsbOs4IZUOkCnKe3BamxwQcrxkrVYHdrs/WjgGq7dR8z/il1jdEvyrWKIPztT0OhA9TU7gzFTS98dQViPMLQgeVIskC9uFH+tHwnXNY+zHZTz2Vc0K2dMc=
Received: from CY4PR12MB1287.namprd12.prod.outlook.com (2603:10b6:903:40::8)
 by CY4PR12MB1511.namprd12.prod.outlook.com (2603:10b6:910:4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Tue, 6 Jul
 2021 02:04:46 +0000
Received: from CY4PR12MB1287.namprd12.prod.outlook.com
 ([fe80::2cb6:690b:e6a0:d008]) by CY4PR12MB1287.namprd12.prod.outlook.com
 ([fe80::2cb6:690b:e6a0:d008%3]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 02:04:46 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: Yang Yingliang <yangyingliang@huawei.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH -next] drm/amdgpu: Fix missing unlock on error in
 amdgpu_ras_debugfs_table_read()
Thread-Topic: [PATCH -next] drm/amdgpu: Fix missing unlock on error in
 amdgpu_ras_debugfs_table_read()
Thread-Index: AQHXcWwkQcl2qvPTfEmTUhkGSkuc5Ks1MhqA
Date: Tue, 6 Jul 2021 02:04:46 +0000
Message-ID: <CY4PR12MB128781615D9C3955B8F845ABF11B9@CY4PR12MB1287.namprd12.prod.outlook.com>
References: <20210705013948.3112994-1-yangyingliang@huawei.com>
In-Reply-To: <20210705013948.3112994-1-yangyingliang@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2021-07-06T02:04:44Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=615d6e5c-edce-4fdd-b227-07b4938a28db;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.134.244]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b1fe2a72-5443-40f0-2b11-08d940226e0b
x-ms-traffictypediagnostic: CY4PR12MB1511:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR12MB151189EDB666626966CD5119F11B9@CY4PR12MB1511.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x1VzyU4hENZhh6hkSXM/xALY9piwkvWesBdkF6rf/PVj8F7IOv8VOJSotZptreMzh7iSf3jDRLUvNKSL3awlnHctbpi5FrLxLiCX1V7tYjwQd4SA61+JdGI8vZh6FgSL4X4cbXh/FqAPl7q+GDLr2K5UeoQTZJA32x5XA44JTuLqNSIXJ/HfFqpjlmax/Uru+YHp8ddkUiQh+I8DG8vpymNjBtn9zGivm13vpSZl5+XDwkQQzX8N4yWe+HncOY7X45AFVmuzMVQ8bG2FkwsO84l0lTCMRKMC8+umYoCd+2cYVzzF5saO3KK3Y8xINuPn6b1s24W6x8diU8fUSbA8Cpf9lFKlQG08V9E+dZn60u83hSxtzKaxeeNy1VwaJ39vuqmO7lj+zh7QHcYs42rxcRrpVJP1JQKL2GgSZhuLiMd4bzX5Dp9FA+cmm6cjzfCD7SCbPM8vXZkeT7eaTYr3U0DwsjwbeUYdSTesnFBCpG3Abb5vGvL6ro+Dgflky8z/Ts2sGa9r5JJGtTSbiS7BzzlE3kz496ETO8LHa1WSX8qqa8Qcm/F/922tLo9tk73KjT1f6j1w7x/AXnU0m+uvVHmke2LNLYRGnm4Jg9r4fz172BecyNGaJlHlk3tswz6PpbVwvPZZVLb96NbZjzdArQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1287.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(45080400002)(110136005)(4326008)(33656002)(7696005)(83380400001)(8936002)(9686003)(55016002)(8676002)(71200400001)(6506007)(316002)(66556008)(64756008)(66476007)(5660300002)(86362001)(966005)(2906002)(53546011)(38100700002)(52536014)(76116006)(66446008)(66946007)(186003)(122000001)(478600001)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9XTS+ezUdZXaVovOhfShhfdQimbM0MppbzsEPbOaQdQfFnWBBk3YXq2JF48G?=
 =?us-ascii?Q?Vove2tftOOvhZ33rwsgbFW1CEBA4CpobKbkZ2na4tkbRM+WYTRB0l6A5R2l6?=
 =?us-ascii?Q?9ovIE2Qi9x1NuMuBOY/z+zaEMBj7wb9AF5npVBmbLXWHPwLXXGOuHVy/7W26?=
 =?us-ascii?Q?XLMcPK4l/gPaiqnJD/+8Wj4ouFIJvyegnWMh2hFfghAUG4lcU8ME0APtrjuA?=
 =?us-ascii?Q?MDNihK02CVi2Faq0ri5soAM8aL/hVwYwE3ii3xu+6h4LlPOxbZXTXE5NkvIy?=
 =?us-ascii?Q?XXtZ7bzDa9tHc0QEhG9x4DoWQgzPMwyuD9gNqw7tNbfp9UXbuONOGMePWCZr?=
 =?us-ascii?Q?TAemrKf8sLiYkg0CFOA44l/CVlbdTWcjkxssZBwxay2iQZW/dRqhsoGPgfTa?=
 =?us-ascii?Q?5Ijm5wuAZFXY6MBn/SeUYRNa2lzttH+dFYKSuy9aFIGUKkNzKfsHhAGf1V6n?=
 =?us-ascii?Q?Ys5StM8xm3PJ6LzLelOkHUS5XgnXB2sRQ59b1InD+21yVS+4a7ZN8JcRnQSR?=
 =?us-ascii?Q?J6cziJ9mpsqhKHqO4JJ/5KP+48KHP8EvegfThFwNWrn6SVEwgWiQAygKIMzu?=
 =?us-ascii?Q?x7nBYn/7KnAzu9Nf6tqGp7VANLp4wX4/gj2d8qnSwvfEsZagM5BFtG+GECqp?=
 =?us-ascii?Q?Rmqq68KiWR51NtjnqHVFtZ0Q4IL1vfUHfSKNZmlwCv2J+dfs0RJGiTXtX4n9?=
 =?us-ascii?Q?lhVAqh119yY7So3r8uKApj5s9JX5PzT2OURJIryIjr+hUoubEqTtnM5vatnu?=
 =?us-ascii?Q?Igy/VsJ4mxYqsSSbYK/4zmQ4VpAbBfRhVe5qlA5+OD7AAaZCMwlw8owoODOn?=
 =?us-ascii?Q?CX8h7J4J0mO2diyUiFmM4xho1HeY+2pSN324S18u+BRdrpvt7ZV/lB4eSv8s?=
 =?us-ascii?Q?eFs6vSHPPGjJFH/pS0M51vfHB8huLOBOopLUI+amdAXkMdq09LROvq/o/PZP?=
 =?us-ascii?Q?rYtShfdYxpOl9uXsJ4bPhaaWCRx1nJNcvFSdyek2yMLSoYD177nY004jBsoI?=
 =?us-ascii?Q?NIYkNBc9N8ye/uhlWBoy68rkfg4nAzArUSOna2Q0LYVRw4ry5p6MubTxO3Ls?=
 =?us-ascii?Q?8dhAX33zm4wiTc/hmdZPWsfqcch7J/LO7x+iSPSJmfbwRYWdcct5Urd8sXyI?=
 =?us-ascii?Q?fLYQ1FTspfSboK6TYsmeDiaQM6qMII2ZSfz3VlBjbrxn9gCZexXIvcOR5ufK?=
 =?us-ascii?Q?FnBAp6Y5yGa7WCpaIOA486JBKUsvqjp74wWoswIFJDbNRuYYkysF9n2m3d/t?=
 =?us-ascii?Q?YCARhzC8Lw7MmxWt0bs1U1HI8htBVV3nVe1HCuZXPn67yyOaIsLGDQDKkVat?=
 =?us-ascii?Q?30Y5FamF8/cmgceoUK5IvUy0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1287.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1fe2a72-5443-40f0-2b11-08d940226e0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2021 02:04:46.7397 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4D68G3vC7313MW2ne4LdtfW5Tk4zrOi0Jy+Kuz8EGbvbKCXRsdqytk+tEoO+ibhl16RqLJYsanBCZB9mfIcVrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1511
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]

Thank you for the patch, Yingliang.

There is a similar patch sent out last Saturday and under review. Please ch=
eck it.

[PATCH 3/4] drm/amdgpu: unlock on error in amdgpu_ras_debugfs

Regards,
Guchun

-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Yang Yin=
gliang
Sent: Monday, July 5, 2021 9:40 AM
To: linux-kernel@vger.kernel.org; dri-devel@lists.freedesktop.org; amd-gfx@=
lists.freedesktop.org
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>
Subject: [PATCH -next] drm/amdgpu: Fix missing unlock on error in amdgpu_ra=
s_debugfs_table_read()

Add the missing unlock before return from function
amdgpu_ras_debugfs_table_read() in the error handling case.

Fixes: 9b790694a031 ("drm/amdgpu: RAS EEPROM table is now in debugfs")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_ras_eeprom.c
index fc70620369e4..dbeeb4986ca6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
@@ -912,8 +912,10 @@ static ssize_t amdgpu_ras_debugfs_table_read(struct fi=
le *f, char __user *buf,
 				 record.retired_page);
=20
 			data_len =3D min_t(size_t, rec_hdr_fmt_size - r, size);
-			if (copy_to_user(buf, &data[r], data_len))
-				return -EINVAL;
+			if (copy_to_user(buf, &data[r], data_len)) {
+				res =3D -EINVAL;
+				goto Out;
+			}
 			buf +=3D data_len;
 			size -=3D data_len;
 			*pos +=3D data_len;
--
2.25.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.f=
reedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D04%7C01%7Cguchun.c=
hen%40amd.com%7C895d0b06d5e54b3598cf08d93f83454a%7C3dd8961fe4884e608e11a82d=
994e183d%7C0%7C0%7C637610655312805026%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL=
jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3Db8=
UQJCZDgKs7CkMFMMXtFUfGe%2FQA4Cnm%2FKJKOlvV1K0%3D&amp;reserved=3D0
