Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07994AFC6C8
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 11:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21F8010E5D4;
	Tue,  8 Jul 2025 09:12:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZgeyUB23";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 976B810E169;
 Tue,  8 Jul 2025 09:12:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t0N38Hw0CVazyA64Q6gQPng3n8FFym1b3HrxB6RuWMbTvlW90HLHdnj5z24CiHtaEJVltKtHOtKuTsV6P+cnnmd/OU1zzezqmtUKO34Vi9xkaaq3PO5l0VnWh4KZ1UzFOHQdzPOb3zKu5QHgYZfLGM5bW/3CZskVjTSccpB7JiCL9UhlftRDAz8JtmDVA1XVAjGbEWOhCJxjmIyLrUs8fPNQaSGr+ErFQ3PQ6IsmdESdhuYgze3Jo/j7wBFZWyCTQ8ks7j4X5IUYuvB3aXAAOj3/N9pJDnouF1jEdgJt1rW34/xRocHhvJDGe49kWUYlexfNP7WfspBUekoTmhgWNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vp5toj2d2VEVcEsXz8Dx8lYWIYnK2CpLXTvfLRfs9Ec=;
 b=FDzAfP/ZflCIASLQg0TO8Bqip0RrniSUfDqZzMn/G5plvCK4zPwLgyW73gV0tpuz/JBcARsaz0vzD2qY0wwxeJI5Tvhk49e48gqCUNzAaxAvKXvZTrBeJ/isZeoP86rndBN3JFD4QwmfBBCsUiJm0v5gsY/QP0XFh1eP0i1KLMFoQ1VgaG4DvUHiMHUAr1xi8ThsPerJZ6GlB4raeD9N1T6cOdqobtLMwRL9jKn5suEBsqfAMRgxwH91klQDtd3lx4+bjxDBqHhoOmmzj6s93a2TvNcsbV4H3s6VvbcVCh6AFBaEbHtGUdBlAYV7n+xXhzXzp1cFswHDNH+2rz72dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vp5toj2d2VEVcEsXz8Dx8lYWIYnK2CpLXTvfLRfs9Ec=;
 b=ZgeyUB239EqU83WmLPr4/FlHLDH7KK9ryRftpGWZizajlz1Crodu4gahraUPkXnQO/hsKnFjOEfPkSbTLTKmXaRFmoFAGQQFg+UIIh2Kd16fZQft/+UrdzWuVEyf0sqXQTneSt7N1c3wXLX5RG6Tt1rq+TIP33wXIKMNNGEf8TE=
Received: from PH7PR12MB5595.namprd12.prod.outlook.com (2603:10b6:510:135::20)
 by DS4PR12MB9636.namprd12.prod.outlook.com (2603:10b6:8:27f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Tue, 8 Jul
 2025 09:12:49 +0000
Received: from PH7PR12MB5595.namprd12.prod.outlook.com
 ([fe80::6c0:e416:3955:9ea0]) by PH7PR12MB5595.namprd12.prod.outlook.com
 ([fe80::6c0:e416:3955:9ea0%3]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 09:12:49 +0000
From: "McRae, Geoffrey" <Geoffrey.McRae@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/1] drm/amdkfd: return -ENOTTY for unsupported IOCTLs
Thread-Topic: [PATCH v2 1/1] drm/amdkfd: return -ENOTTY for unsupported IOCTLs
Thread-Index: AQHb77/sLYx20FAtKk6DcQGnXi6e9bQnzKYAgAAkOa0=
Date: Tue, 8 Jul 2025 09:12:49 +0000
Message-ID: <PH7PR12MB55958988869861DF44D3D007884EA@PH7PR12MB5595.namprd12.prod.outlook.com>
References: <20250708042219.180109-1-geoffrey.mcrae@amd.com>
 <470a613e-d85d-4943-aa48-7590d84f7fd2@amd.com>
In-Reply-To: <470a613e-d85d-4943-aa48-7590d84f7fd2@amd.com>
Accept-Language: en-AU, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-07-08T09:12:49.4740000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB5595:EE_|DS4PR12MB9636:EE_
x-ms-office365-filtering-correlation-id: 32680ab2-e7ec-474a-e4fa-08ddbdff9c6c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|8096899003|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Jt/LavnNdQ66PzMALKsaKJc1g5OHe5LHF7Tr/DXPJG54ddyDj58uMdYdW1jI?=
 =?us-ascii?Q?ZMMDo9ZqD+0Jn49UNae2SNHUtcp+vBJHnWF5m88jDX+56g62HQ49+g9z62yt?=
 =?us-ascii?Q?Qyz7JNC3Jx8e9vHMAqGiV7l5f2tTUVrMdzf85bhCFRgBu8uwIIkPSipDCkdK?=
 =?us-ascii?Q?BJbzwj8RLTGa/NSG9OEV/TXD4mWj8/LEPAbV8Yv/ghchv+M4gWb27lVfby4S?=
 =?us-ascii?Q?QF7WQTDuXzjiLhQhdPXeWc82ybns3SyjEUJzEZGCbJ6ekjISpQdtBWHAyt9V?=
 =?us-ascii?Q?aR4envXYL6iqfekDj6pTLh4uNVDO2/vJIK3CN2r4KjX5/vDo65P9QZIxoshb?=
 =?us-ascii?Q?J3RvqV/YneX1YcngWXOeYyjl6oyWs7jbZFaQYEE49nmzCX7/j8RfgsZN4eMh?=
 =?us-ascii?Q?GQUvZEs/JnyKqml+V5m5teN6aupyT20+gmhLFAEfJq00vInwaLr9dM92JK4q?=
 =?us-ascii?Q?n7H4gDGCZ06qSXbcDJabkjkxqcSom9EJl2Dp7UuKeyLtgKMIRCMmFRFqF86p?=
 =?us-ascii?Q?R9hvCwI8S7D0GjbW+9w/s2jao0UHNYx7PPMFbvpRQ2C5awAYftsj+WlVf3jS?=
 =?us-ascii?Q?1awGSgiUXqpDC+1MG+DdY/4AFh/QMWNjgXmcuflC/VlV43iboifOsHSrcKkd?=
 =?us-ascii?Q?+vzf8gkKVljk6LULS7dIzwTzGH/1mrqC+Va9SzkJfAE1ECavd8KQrjPv93aP?=
 =?us-ascii?Q?kgl7qR+YrEnOzgM1jftYS3l6TMV9HL4vaAfL4yjjVaW/fyY0fBqcrn+m9CQ7?=
 =?us-ascii?Q?NnHT+c4C5bRDdhUuEFHTlcmXzPYHA90vg1eg6rvebwBOEH+O3IIzHSCNd7ET?=
 =?us-ascii?Q?CBnH7EA14JDnf4gieD0BX5nps1ah+Ez55//cpnIpKlDaP5o4/VHIKeeg6PyI?=
 =?us-ascii?Q?VywAQRklZ0rtGjqkxyfmUYx3JkyM/qgltuYAYbq1v685+qlWg+E1OtWLewmQ?=
 =?us-ascii?Q?v837WZ66KCzb1C7rVdrHjfcEjZM4FJbqfWTj1O9a4oWpS3I8MctDjP/Wz3PD?=
 =?us-ascii?Q?wsMxYkpdvZTjVaXIAWzsE8M7lnHjOCkiwq2VmkuZzT5lVFFCYbyUbNLom+RQ?=
 =?us-ascii?Q?Es65uoEMGc/2zjxJPEWOoKFAujN1+JIUp2EoDyfd1pLBFlv6j8+0rmUARl53?=
 =?us-ascii?Q?d5APpz8wF6+Q+Acugy3B13HdprQjim1E6V/XyJMbLXu6aQOHWuQDzNws+4gR?=
 =?us-ascii?Q?rzb81QtLbnbcjoPp84hcMI6fqKWsif+aZXDjdMD/Se/6OdIg3Yq+CxuNTGRO?=
 =?us-ascii?Q?QeLfFi6Xv9LhNrTpxsLfIp/Kkf9rlMdHveE9VXHz9H5k5srLluWksnvbUIuv?=
 =?us-ascii?Q?H/QeCP7Yihuu+ZUDRowCxV0T/f5PD9eSNCtgcfrevqjWv6O4qS+31JiwAdf5?=
 =?us-ascii?Q?ShcSjxU8X+yeyoY9trmO/seOryRbwleFM7pm9NjY40SRJzcdlKlXY7KQbnDL?=
 =?us-ascii?Q?+dUpGoC4V+XlZ0k2Ugw3Y0YrSBWZ7CclCAL9LNybgForAxTWAbh+Rg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5595.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(8096899003)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uOg8GR7MaIYxo1cy5AHt2mAia5c8vHCSeVwzLH+2s7FmLG99CIhjJOAwcumZ?=
 =?us-ascii?Q?mZGjCkxPf1MpsCBC/oulqcL5QHU9C8x1xg8cYF7r5NI5P77yjZ344D+WPfWh?=
 =?us-ascii?Q?D42Fj8tnreKP8+wMudUfsdtuXqFzAwvf5LTfkMvck0h49Hg9uWBxu7E63CzL?=
 =?us-ascii?Q?w5jqgJeD2xyKrAnnI47GIDyoj6Ik+WB95IDlfeIWkfQgZAny7wRvmi2SYD6U?=
 =?us-ascii?Q?52NLNDNn3OPaosdsxwFRqxnQgngVe1VAOcNzKPXQprmXuEMjepnT0NJkmxWl?=
 =?us-ascii?Q?2RifFcdBJOu9S6YPs4jcYNW8N2Mclc5Rb16kLmNDosQeQ6Rgx6wPvNV90lAm?=
 =?us-ascii?Q?JUmGZbgN9jbmX4w7vleNNyTiVJbxzBY5yPkoZCCspWQ2ucleLwjZWTq7JQOZ?=
 =?us-ascii?Q?ljcgrFAoEeLSt/QvLS9Sd/FQjl/bAGs2hasG+LEGuqzra+q7yU/FKd3i/nwX?=
 =?us-ascii?Q?ao0kd2mFqXcx1UlKZq/H1r00oYajMi6YtAI2x1aZc30xPBxCTs8TPvbZSxLZ?=
 =?us-ascii?Q?zadASpP8qoRBLrkucyO5ZTu2xdT28RbOcG5TdajM3goK7WtTiYnVD7Zco2DA?=
 =?us-ascii?Q?GqRx5Yf7Du6hNVwfZPOxOOxnqgLwCw56eTLQIDlah48cPF7q8B5t+OUhTvBB?=
 =?us-ascii?Q?MSVi00B5P30bTiJ10FIcNDtSxZoaGqCNRu0++xsTKvlPlYId2gUHaH743Xm5?=
 =?us-ascii?Q?mWFQAuKh4aRL8k/j3/4DhE0JO58kDSwX1x953D+A9D5B0vTHyrFDUIw9VK1J?=
 =?us-ascii?Q?U9m7jkEwCl4yhzhT1x/hXQIB8iShPMWiEltKl+t4dGceTYWRAt164VFE/XoB?=
 =?us-ascii?Q?S1U1dscW7FY7aciOt/eP3xf2eBuYpDiel88J1hZjxFtfP3W5GIYbb/h2N7P+?=
 =?us-ascii?Q?9Bgd1o+52Gi0O72MFnA2sRMqflQf0kfBhBslUODCBAjNjZiJbT36DhQ0EIFe?=
 =?us-ascii?Q?U3c2jhiZ08m50PxPxdM2Vn87+hXIIFmPL86XAKuFvFM6Tukj/JwxrHJfoAIx?=
 =?us-ascii?Q?3lVMAyu7+9RML+8i6Ok583ZCGBUnL8lGYqSZaNmGRcbfNU6siZgmFwhnp+Ma?=
 =?us-ascii?Q?Lr3ZXFnNyAVKEUmdxO3aYcbmqu5ThTuIzWvDUE1rSHzqJd/KY3a+MSmIoqpm?=
 =?us-ascii?Q?irmfU4yxZf8nvBD85HLtmNxikoAcPQZVf6enzud+K0dydxtYg1t+gskdN/ng?=
 =?us-ascii?Q?7myZLKu0BDktWOlqvEjM0cU04OeivfjblcS+WgnRUPRT3Yev9CNHLguyEMBj?=
 =?us-ascii?Q?yxfnOV+/uSuN66b94Fae+dEmjfnW3/dJ88eEZJj0Aucao6jLOAYTnk7I0f9P?=
 =?us-ascii?Q?pV8qZ35bqpDJUDUDHA7EzqrbOUS21/gwdaJfVR9k3bxp/p2HfZ2zjkSyWCQQ?=
 =?us-ascii?Q?tKFc8Qf54aHO53ALSM0E50sKu4+vbHo8p52r8PgDJnLQBMLOPfkTkvNO31my?=
 =?us-ascii?Q?0Fx+mkTxAzny6wSByIjdCAG73lVWbKXDXxw3wTgpqYqay/c+AMNBQ8etSKbu?=
 =?us-ascii?Q?VJMMphT/M8CvDVqrW2eFTrkDW+MnzPD9i2JDCANrCWCBi8/0lfq2vxJ5MEUv?=
 =?us-ascii?Q?KfUgCbKTAypnZxr2VHY=3D?=
Content-Type: multipart/alternative;
 boundary="_000_PH7PR12MB55958988869861DF44D3D007884EAPH7PR12MB5595namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5595.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32680ab2-e7ec-474a-e4fa-08ddbdff9c6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2025 09:12:49.4600 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lmNFbx2D1T0AreaMlQbFyFre7sazlp0CEKSXeW5R0AlIlycORDfTyU8FY9cOO473oiNR+AOGcdZ4Y4kgFkm2Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9636
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

--_000_PH7PR12MB55958988869861DF44D3D007884EAPH7PR12MB5595namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - AMD Internal Distribution Only]

I am happy to use EOPNOTSUPP but I must point out that this is not the patt=
ern used across the kernel, the standard is to use ENOTTY, which is also th=
e default that fs/ioctl.c returns when no handler is present. Userspace too=
ling such as strace and glibc specifically expectect ENOTTY to indicate inv=
alid or unsupported IOCTL.
________________________________
From: Koenig, Christian <Christian.Koenig@amd.com>
Sent: Tuesday, 8 July 2025 5:01 PM
To: McRae, Geoffrey <Geoffrey.McRae@amd.com>; Kuehling, Felix <Felix.Kuehli=
ng@amd.com>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; amd-gfx@lists.freedeskt=
op.org <amd-gfx@lists.freedesktop.org>; dri-devel@lists.freedesktop.org <dr=
i-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/1] drm/amdkfd: return -ENOTTY for unsupported IOCT=
Ls

On 08.07.25 06:22, Geoffrey McRae wrote:
> Some kfd ioctls may not be available depending on the kernel version the
> user is running, as such we need to report -ENOTTY so userland can
> determine the cause of the ioctl failure.

In general sounds like a good idea, but ENOTTY is potentially a bit mislead=
ing.

We usually use EOPNOTSUPP for that even if its not the original meaning of =
that error code.

Regards,
Christian.

>
> Signed-off-by: Geoffrey McRae <geoffrey.mcrae@amd.com>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/a=
md/amdkfd/kfd_chardev.c
> index a2149afa5803..36396b7318e7 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -3253,8 +3253,10 @@ static long kfd_ioctl(struct file *filep, unsigned=
 int cmd, unsigned long arg)
>        int retcode =3D -EINVAL;
>        bool ptrace_attached =3D false;
>
> -     if (nr >=3D AMDKFD_CORE_IOCTL_COUNT)
> +     if (nr >=3D AMDKFD_CORE_IOCTL_COUNT) {
> +             retcode =3D -ENOTTY;
>                goto err_i1;
> +     }
>
>        if ((nr >=3D AMDKFD_COMMAND_START) && (nr < AMDKFD_COMMAND_END)) {
>                u32 amdkfd_size;
> @@ -3267,8 +3269,10 @@ static long kfd_ioctl(struct file *filep, unsigned=
 int cmd, unsigned long arg)
>                        asize =3D amdkfd_size;
>
>                cmd =3D ioctl->cmd;
> -     } else
> +     } else {
> +             retcode =3D -ENOTTY;
>                goto err_i1;
> +     }
>
>        dev_dbg(kfd_device, "ioctl cmd 0x%x (#0x%x), arg 0x%lx\n", cmd, nr=
, arg);
>


--_000_PH7PR12MB55958988869861DF44D3D007884EAPH7PR12MB5595namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Calibri;font-size:10pt;color:#0000FF;margin:5pt;fon=
t-style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[AMD Official Use Only - AMD Internal Distribution Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
I am happy to use EOPNOTSUPP but I must point out that this is not the patt=
ern used across the kernel, the standard is to use ENOTTY, which is also th=
e default that fs/ioctl.c returns when no handler is present. Userspace too=
ling such as strace and glibc specifically
 expectect ENOTTY to indicate invalid or unsupported IOCTL.</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Koenig, Christian &lt=
;Christian.Koenig@amd.com&gt;<br>
<b>Sent:</b> Tuesday, 8 July 2025 5:01 PM<br>
<b>To:</b> McRae, Geoffrey &lt;Geoffrey.McRae@amd.com&gt;; Kuehling, Felix =
&lt;Felix.Kuehling@amd.com&gt;<br>
<b>Cc:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; amd-gfx@li=
sts.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;; dri-devel@lists.=
freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt;<br>
<b>Subject:</b> Re: [PATCH v2 1/1] drm/amdkfd: return -ENOTTY for unsupport=
ed IOCTLs</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 08.07.25 06:22, Geoffrey McRae wrote:<br>
&gt; Some kfd ioctls may not be available depending on the kernel version t=
he<br>
&gt; user is running, as such we need to report -ENOTTY so userland can<br>
&gt; determine the cause of the ioctl failure.<br>
<br>
In general sounds like a good idea, but ENOTTY is potentially a bit mislead=
ing.<br>
<br>
We usually use EOPNOTSUPP for that even if its not the original meaning of =
that error code.<br>
<br>
Regards,<br>
Christian.<br>
<br>
&gt; <br>
&gt; Signed-off-by: Geoffrey McRae &lt;geoffrey.mcrae@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 8 ++++++--<br>
&gt;&nbsp; 1 file changed, 6 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/dr=
m/amd/amdkfd/kfd_chardev.c<br>
&gt; index a2149afa5803..36396b7318e7 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c<br>
&gt; +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c<br>
&gt; @@ -3253,8 +3253,10 @@ static long kfd_ioctl(struct file *filep, unsig=
ned int cmd, unsigned long arg)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int retcode =3D -EINVAL;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool ptrace_attached =3D fal=
se;<br>
&gt;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (nr &gt;=3D AMDKFD_CORE_IOCTL_COUNT)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (nr &gt;=3D AMDKFD_CORE_IOCTL_COUNT) {<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; retcode =3D -ENOTTY;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; goto err_i1;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((nr &gt;=3D AMDKFD_COMMA=
ND_START) &amp;&amp; (nr &lt; AMDKFD_COMMAND_END)) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; u32 amdkfd_size;<br>
&gt; @@ -3267,8 +3269,10 @@ static long kfd_ioctl(struct file *filep, unsig=
ned int cmd, unsigned long arg)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; asize =
=3D amdkfd_size;<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; cmd =3D ioctl-&gt;cmd;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; } else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; retcode =3D -ENOTTY;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; goto err_i1;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_dbg(kfd_device, &quot;io=
ctl cmd 0x%x (#0x%x), arg 0x%lx\n&quot;, cmd, nr, arg);<br>
&gt;&nbsp; <br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_PH7PR12MB55958988869861DF44D3D007884EAPH7PR12MB5595namp_--
