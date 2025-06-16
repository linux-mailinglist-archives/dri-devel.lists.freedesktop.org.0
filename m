Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8EEADB343
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 16:15:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C061D10E37F;
	Mon, 16 Jun 2025 14:15:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Rq/RnMYH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2053.outbound.protection.outlook.com [40.107.237.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF26610E37F
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 14:15:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KvU7oLnZUbzdwaGGARRUAEF8uwZwgsUVA6F3OJ31MXafNsj7NBdXOSt6KlRAY+bZyD+WTGReZNR7dgfERVPI3ejT1h6td3MMCuoNu7sywOW7riTMtA4yyzwYwGEBVCt4bEd1lxmHlaUaaCmC/XW6U9UC0SD3r7s/W+abupqkKPEy+14TvapY/tmhCzh4G9TsT4+CVScrR3vcCytF0ABC4mmE/Vq/9YjkdWfWOJkgpcpfRNSMq6ol+tkBWhj2Zchjl3ESNhC1tD4zWyxpqbnfguLLxQK+6FK3r2ioAaJ9oEf0sr2V5DeE8DzAzDLU9X027YmttSKJ28b/tkVA4hGyhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICkhhob4Y1ezC3AFB1nrI2mvO7dT2Rxx3EBYG9BUNmE=;
 b=oSLe1j4kzTjWg7JSYG4lnRyrQG2zkxoFh6xO85VPxcuqepeJCJGHYFsmysLnk0HmM+rD6UOSAGGJxJ/lPvRWFVg+L2fHWVT0zqelTVa/GVBLiNqylhfVmzN26l76i0jFzeiUtsHxl9SGt9Rwlksg123cKxRI8U9z7YaoYGXOzVJ/QU/zGvEv51cNIeJxoVPsEnsJUeIO+YkAZn8gxcoUSo1mCsvFlaWrtRVdm3+U8I3PtAROps5qTxbXC7I8D6BOnpiryaV//R8/uXTOyr0EyTWN1LEILt0SZYHbFYXfqkgsr5Z7gL9tu71/uAfp85z7kV0fx6sFtOgDeoD0JE73DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICkhhob4Y1ezC3AFB1nrI2mvO7dT2Rxx3EBYG9BUNmE=;
 b=Rq/RnMYHsXafnuuL8f4AJzcpZWY9ca6ek9Vre4ic9vQkUG5g0w3mUAOqlDKHTCrnqUWSXW01ExLPVd+ZfgGa5LETd3mon8gk4y0b08QK0B+wFI1J5dquucm7R7KyJvY8SLSsEUKSFv9KGXBf5sAU0kltCpcPVqjDKzqQd7MXIYs=
Received: from SA1PR12MB8144.namprd12.prod.outlook.com (2603:10b6:806:337::15)
 by SJ2PR12MB8063.namprd12.prod.outlook.com (2603:10b6:a03:4d1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Mon, 16 Jun
 2025 14:15:12 +0000
Received: from SA1PR12MB8144.namprd12.prod.outlook.com
 ([fe80::fb96:ddab:e63d:a523]) by SA1PR12MB8144.namprd12.prod.outlook.com
 ([fe80::fb96:ddab:e63d:a523%2]) with mapi id 15.20.8835.026; Mon, 16 Jun 2025
 14:15:12 +0000
From: "Francis, David" <David.Francis@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "tvrtko.ursulin@igalia.com" <tvrtko.ursulin@igalia.com>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>, "Yat Sin, David" <David.YatSin@amd.com>,
 "Freehill, Chris" <Chris.Freehill@amd.com>, "dcostantino@meta.com"
 <dcostantino@meta.com>, "sruffell@meta.com" <sruffell@meta.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>
Subject: Re: [PATCH 2/3] drm/amdgpu: Adding amdgpu CRIU ioctl
Thread-Topic: [PATCH 2/3] drm/amdgpu: Adding amdgpu CRIU ioctl
Thread-Index: AQHb3JBTb/XAfV+7m0qENSYqC+adV7QFgXsAgABXhpk=
Date: Mon, 16 Jun 2025 14:15:12 +0000
Message-ID: <SA1PR12MB81448862F5C3E0CD347ED4BDEF70A@SA1PR12MB8144.namprd12.prod.outlook.com>
References: <20250613182337.3767389-1-David.Francis@amd.com>
 <20250613182337.3767389-3-David.Francis@amd.com>
 <e53a356e-a0d2-4643-98e3-721be16277cf@amd.com>
In-Reply-To: <e53a356e-a0d2-4643-98e3-721be16277cf@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-06-16T14:15:11.9150000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB8144:EE_|SJ2PR12MB8063:EE_
x-ms-office365-filtering-correlation-id: 36c889bd-64e6-48d5-ab85-08ddace03566
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|8096899003|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?hwEASgB3MJ1xoiusxiHt5tRXF2CmppAIJjcx4QlpU/E+M5uVJw6r7rS0zzvr?=
 =?us-ascii?Q?sI97LbagCSsm6zkhxoeiFMYYcnloSm9NarvnI7bQqyWj4b4nD4E0q8HS9Lrk?=
 =?us-ascii?Q?GMBlDHyHAdy57nn3HTBsbtXMxE83LepAJe5xXe1SQ+BBgWKOcmeWIqkOK2Iv?=
 =?us-ascii?Q?bdM0fLV2lMVh1ZUsA+aKbzmR/OgEdIZblp217d0bs21sKLvUQSkEommQM1v1?=
 =?us-ascii?Q?+OWG2+MHR6PcReJenj6+al3EFu3NVknhTJ6s8+JmBeqwBP2GUJTsk7Zw95lL?=
 =?us-ascii?Q?hR7YkFGZ7GTwVEkfgxBkU31VQoaqn27Bx7RCMxi8ytW83Tr5zoNp10e5wOdU?=
 =?us-ascii?Q?8m/9o8F28cpuzL0x3P8H+zm+MDt7Aqjqxzyqb6h6Rp5rhM72fSdz037ucN7j?=
 =?us-ascii?Q?jGTS0I2kCQu/7ETPdqEu62Z0NPC9n8ezd8cqQQhmlByn9wUjFjWZRyfmAt6j?=
 =?us-ascii?Q?cO9TIy+YHZjXHdw0dc64KwQzYiX5xwGzj+jIljKu7Ys88UIgcY20QWvAutRj?=
 =?us-ascii?Q?7iqUne1JuphgFLBXK6KN3q/axlKxOXvNjTm5zomi2MZPdLiT7Ur+MUXLIJpp?=
 =?us-ascii?Q?BdFeeUlr4ZDpbT+lljF3/Ilqxf+AeP4yHwNLZXFOji2toScOycNdkliYeQU2?=
 =?us-ascii?Q?TONXX0v8il+Wl2gL2ZyChomAIv1y1S3jpzNWfUgVhjbPCFNJF+/ETaAZodZF?=
 =?us-ascii?Q?p8DfckZRG0UIDNUAO98G8+Oy94KaMKDOP6Dktf0QP9yYQdeAKmQU5E8CvMVC?=
 =?us-ascii?Q?/+oki7azrSOOXcW/LmX/nXTBS/M420SBIrZwAmk8ylQ34890G3ufVhUhbPTy?=
 =?us-ascii?Q?pxuH4xRP3/CJD+2Wgykvq5h+CkhqmZQM1FNZJS+np7l7hpyg6neH9p6u6pyi?=
 =?us-ascii?Q?RqBij+K+EZd7dRkk44rR/B22YH631tFxaKzdVzlGFyYNe35XOFZTeDBiGRx+?=
 =?us-ascii?Q?ACiTkW//s/Cme/i+fKqN95tXvwM4DrcH26VlQgx4i6YLxLtCLXkVtq+G98p1?=
 =?us-ascii?Q?HM6mrFyTc8DfwiOgHWuboohZ0sc72iqUfUVc7lCx36nv2M/It3pyT6LlIZj3?=
 =?us-ascii?Q?7YVrHZ9zPxOV8mMiWtWofUu1yVv5vQxQfBiVenQ8msS80QRS869ZV0ebM89z?=
 =?us-ascii?Q?tlfd1imF+ruIe96veONIC2SUZ00eyQYLyeFYKSiiLIM1Srt5uberG3YjIrFg?=
 =?us-ascii?Q?gbRefomsvNX1RYZlc5d+FE1AYjgMYgSmeEdMURbLbIbLLnkJdD1uBO6Nf4+a?=
 =?us-ascii?Q?tZKLyOeKG2TdSOulWxqxT31lXOniUEGVzDvLfz2VOMWiUd+mLSKnfPM6WyTr?=
 =?us-ascii?Q?eOzTPfQpZiOuI/1XSyJ+g3lX70HR+WMSPCr7UVfL1JSuEFZhQGyuH9wrUyqH?=
 =?us-ascii?Q?4dgDh5hEd1mpDwe4Y4Suer90Xapp2FJ+YgU1LwgE3alPcJW7QZuGKTGCm5SB?=
 =?us-ascii?Q?YUTxvoMoent8fJkBdT6lCIxOuHqk7xLnEcC/R1t52NGnn3LpwbA9bw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB8144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(8096899003)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Kh2S3y4E7YCIRYGmhvxE+MipcrfwmA5eSwcMv5gn5qUASIFOD0JliN64vvZ4?=
 =?us-ascii?Q?cY+mhZd3lSJc7Xf3BLOTDhy0K46uZ10L+G9JPp7AlCubhP1G2POkjGj4OrKc?=
 =?us-ascii?Q?Lh5VJ9r1I+KailjSBBKJOzuPV3L4noCTQ1Uj2D/LMlXmfE87mEWXl9v34rgu?=
 =?us-ascii?Q?4pTeZVZLRT0Z+n9bWVKOT5KXp5cfdHwjo0RGCY0vrprFxoElXifPhUPcBtBw?=
 =?us-ascii?Q?kEuk7xuGpcY4qB3BwChri7yLHU8xbzj2AmJHDGPpEEuFT7KyBOwY0ygAKXpU?=
 =?us-ascii?Q?8M6axh/JWfvrfVLStnhY/RGju4NczY30dsLLEzoGyJha6d0Nknow/6ZA5pPt?=
 =?us-ascii?Q?xM2CGVkJhSf+EWgxNFKr82AuLc5FigJrL8+L80oUNM+SPD1SVIwO8YgsCGWW?=
 =?us-ascii?Q?nFlD22Rrgrb0YzV8zQK2PubZ7LJgS/aGEWgUVxKzsPxU4QrgyyljxbSRMgx4?=
 =?us-ascii?Q?fzHKL6b+fUZLw/1azPa6xcSjwKR4qFDsHAJUMu7TCPMp0gAPgExru0cRhsyF?=
 =?us-ascii?Q?nr69UYXM7EeJZR3lLeU1TFWHm8J9V3rCs18/nkecT4OOWBVfjH4G9TtiUhGU?=
 =?us-ascii?Q?wFLYMSVoAo7g1mVSsemxfRWBn4sC0hx4hoUJ8PgsWsauIVcImK76bjRh0G7V?=
 =?us-ascii?Q?UZjmhN1agbswuA54ociRsKI/Cxyxmgx26QuZmhOW0zbVNSimw+ZRJb8PmoME?=
 =?us-ascii?Q?Nqz9kqE9VWhwOSBhfJKz3louWxxyQ1zqECxBRy+TM+oPMqLd0H3Q1SH0dqiv?=
 =?us-ascii?Q?AqGJimgwcw85BFQUwEK73nbQffTktZYTw8gMoIypT3I+X6m3uEm4FWR8Iq94?=
 =?us-ascii?Q?hU+J7JHZnjYuImJJ2vG1xcXH2IVn+LBkW8ovlKhqgRdBlCnf4oRzwzwDpXH6?=
 =?us-ascii?Q?OSIRc1AGtLOYifiNZf0N5G59M1Sw+nMnsHCPsKOPH3ojBFC2jvPrH7YmKRRZ?=
 =?us-ascii?Q?9JFfjth/WhGeHPEGF7Bw5mnAFYvscS/HyGmljgAbDg+MQlpiYndHS+g3aXV5?=
 =?us-ascii?Q?1P4JKJrD0XyXwH4YfeWARbzGEqlxTQzZv4nkGYxBKWtSrgXMY8B0xdEv3dSQ?=
 =?us-ascii?Q?MczmKSK/YuncIXHfJ5MASG1GCGmfIDSpqEW8ywL2EJ0kn3a9Tb92SJnFcLet?=
 =?us-ascii?Q?zz6sQlxfWU06pV64vioKTE34GsNehHCOXtIjB5Clngj7gVpYqFaRSYfGd4M4?=
 =?us-ascii?Q?pxi+8t1jdnGjKGf3U+iKgQCyUz6v+oTo7iTfv2ai6z0jI8gXMaNS5qdvTY2Q?=
 =?us-ascii?Q?g+arIIZzdg6B9qC2JEoMBKVjp2Q5TG1e/Z81SF2TszsUK8vMg1T/18QHuSJN?=
 =?us-ascii?Q?sYGnxSer/sL/uWnqHOn+0d9YD4W5pOL+ewFBpF8JvXP4XQe8bDntPk4MgT0c?=
 =?us-ascii?Q?mjmNL8806y3HZk5OTvtPEBeWVE3vGTExHDlZc3YIRym0rINVQPLwP3TFkL6a?=
 =?us-ascii?Q?3HfHccybFX0jhjXtWIv7kNPjiaf183giQr01WRikS8WY06onqjI5eU/lOCKT?=
 =?us-ascii?Q?Uy4R9ddU0N8fA7ZTmFPpnebw5HhvqMP7njGzUgU74f6yumdjkscppTAU9iCd?=
 =?us-ascii?Q?30cFpj6gMY1B7cPejHI=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SA1PR12MB81448862F5C3E0CD347ED4BDEF70ASA1PR12MB8144namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB8144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36c889bd-64e6-48d5-ab85-08ddace03566
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2025 14:15:12.4520 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UoGkNr0PrHPqlznBwe2lCvPTyFaTLOoDR45frU3DryX7G6DmzvkV4PDMgFGLd2Jf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8063
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

--_000_SA1PR12MB81448862F5C3E0CD347ED4BDEF70ASA1PR12MB8144namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - AMD Internal Distribution Only]

> > +     amdgpu_vm_it_for_each_entry(avm, mapping, 0, U64_MAX) {
> > +             if (mapping->bo_va =3D=3D bo_va) {
> > +                     if (vm_index < args->num_mappings) {
> > +                             vm_buckets[vm_index].start =3D mapping->s=
tart;
> > +                             vm_buckets[vm_index].last =3D mapping->la=
st;
> > +                             vm_buckets[vm_index].offset =3D mapping->=
offset;
> > +                             vm_buckets[vm_index].flags =3D hardware_f=
lags_to_uapi_flags(drm_to_adev(dev), mapping->flags);
> > +                     }
> > +                     vm_index +=3D 1;
> > +             }
> > +     }
>
> This chunk should go into amdgpu_vm.c And I strongly suggest to not go ov=
er the mapping rb tree but rather the list in the bo_va.
>

Do you mean the invalids and valids lists? I remember you having objections=
 to using those in a previous patch.

David
________________________________
From: Koenig, Christian <Christian.Koenig@amd.com>
Sent: Monday, June 16, 2025 5:01 AM
To: Francis, David <David.Francis@amd.com>; dri-devel@lists.freedesktop.org=
 <dri-devel@lists.freedesktop.org>
Cc: tvrtko.ursulin@igalia.com <tvrtko.ursulin@igalia.com>; Kuehling, Felix =
<Felix.Kuehling@amd.com>; Yat Sin, David <David.YatSin@amd.com>; Freehill, =
Chris <Chris.Freehill@amd.com>; dcostantino@meta.com <dcostantino@meta.com>=
; sruffell@meta.com <sruffell@meta.com>; simona@ffwll.ch <simona@ffwll.ch>;=
 mripard@kernel.org <mripard@kernel.org>; tzimmermann@suse.de <tzimmermann@=
suse.de>
Subject: Re: [PATCH 2/3] drm/amdgpu: Adding amdgpu CRIU ioctl

On 6/13/25 20:23, David Francis wrote:
> amdgpu CRIU requires an amdgpu CRIU ioctl. This ioctl
> has a similar interface to the amdkfd CRIU ioctl.
>
> The objects that can be checkpointed and restored are bos and vm
> mappings. Because a single amdgpu bo can have multiple mappings.
> the mappings are recorded separately.
>
> The ioctl has two modes: PROCESS_INFO, which sends to the user
> how many bos and vms to expect, and CHECKPOINT, which copies
> data about bos and vms into user-provided buffers.
>
> Restore is handled using existing amdgpu and drm ioctls.
>
> The new ioctl lives in a new file amdgpu_criu.c with its own
> header amdgpu_criu.h
>
> Signed-off-by: David Francis <David.Francis@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/Makefile      |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c | 234 +++++++++++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h |  34 ++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  |   3 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c   |  11 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h   |  10 +
>  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |   2 +
>  include/uapi/drm/amdgpu_drm.h            |  62 ++++++
>  8 files changed, 357 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/am=
dgpu/Makefile
> index 87080c06e5fc..0863edcdd03f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
> @@ -63,7 +63,7 @@ amdgpu-y +=3D amdgpu_device.o amdgpu_doorbell_mgr.o amd=
gpu_kms.o \
>        amdgpu_xgmi.o amdgpu_csa.o amdgpu_ras.o amdgpu_vm_cpu.o \
>        amdgpu_vm_sdma.o amdgpu_discovery.o amdgpu_ras_eeprom.o amdgpu_nbi=
o.o \
>        amdgpu_umc.o smu_v11_0_i2c.o amdgpu_fru_eeprom.o amdgpu_rap.o \
> -     amdgpu_fw_attestation.o amdgpu_securedisplay.o \
> +     amdgpu_fw_attestation.o amdgpu_securedisplay.o amdgpu_criu.o \
>        amdgpu_eeprom.o amdgpu_mca.o amdgpu_psp_ta.o amdgpu_lsdma.o \
>        amdgpu_ring_mux.o amdgpu_xcp.o amdgpu_seq64.o amdgpu_aca.o amdgpu_=
dev_coredump.o \
>        amdgpu_cper.o amdgpu_userq_fence.o amdgpu_eviction_fence.o
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_criu.c
> new file mode 100644
> index 000000000000..8141ab09698c
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c
> @@ -0,0 +1,234 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> +* Copyright 2025 Advanced Micro Devices, Inc.
> +*
> +* Permission is hereby granted, free of charge, to any person obtaining =
a
> +* copy of this software and associated documentation files (the "Softwar=
e"),
> +* to deal in the Software without restriction, including without limitat=
ion
> +* the rights to use, copy, modify, merge, publish, distribute, sublicens=
e,
> +* and/or sell copies of the Software, and to permit persons to whom the
> +* Software is furnished to do so, subject to the following conditions:
> +*
> +* The above copyright notice and this permission notice shall be include=
d in
> +* all copies or substantial portions of the Software.
> +*
> +* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRES=
S OR
> +* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILIT=
Y,
> +* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHA=
LL
> +* THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES =
OR
> +* OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> +* ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> +* OTHER DEALINGS IN THE SOFTWARE.
> +*/
> +
> +#include <linux/dma-buf.h>
> +#include <linux/hashtable.h>
> +#include <linux/mutex.h>
> +#include <linux/random.h>
> +
> +#include <drm/amdgpu_drm.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_file.h>
> +
> +#include "amdgpu_criu.h"
> +
> +#include <drm/amdgpu_drm.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_exec.h>
> +#include <drm/drm_gem_ttm_helper.h>
> +#include <drm/ttm/ttm_tt.h>
> +#include <linux/interval_tree_generic.h>
> +
> +#include "amdgpu.h"
> +#include "amdgpu_display.h"
> +#include "amdgpu_dma_buf.h"
> +#include "amdgpu_hmm.h"
> +#include "amdgpu_xgmi.h"
> +
> +static uint32_t hardware_flags_to_uapi_flags(struct amdgpu_device *adev,=
 uint64_t pte_flags)
> +{
> +     uint32_t gem_flags =3D 0;
> +
> +     //This function will be replaced by the mapping flags rework
> +
> +     if (pte_flags & AMDGPU_PTE_EXECUTABLE)
> +             gem_flags |=3D AMDGPU_VM_PAGE_EXECUTABLE;
> +     if (pte_flags & AMDGPU_PTE_READABLE)
> +             gem_flags |=3D AMDGPU_VM_PAGE_READABLE;
> +     if (pte_flags & AMDGPU_PTE_WRITEABLE)
> +             gem_flags |=3D AMDGPU_VM_PAGE_WRITEABLE;
> +     if (pte_flags & AMDGPU_PTE_PRT_FLAG(adev))
> +             gem_flags |=3D AMDGPU_VM_PAGE_PRT;
> +     if (pte_flags & AMDGPU_PTE_NOALLOC)
> +             gem_flags |=3D AMDGPU_VM_PAGE_NOALLOC;
> +
> +     return gem_flags;
> +}
> +
> +
> +/**
> + * amdgpu_criu_bo_info_ioctl - get information about a process' buffer o=
bjects
> + *
> + * @dev: drm device pointer
> + * @data: drm_amdgpu_criu_bo_info_args
> + * @filp: drm file pointer
> + *
> + * num_bos is set as an input to the size of the bo_buckets array.
> + * num_bos is sent back as output as the number of bos in the process.
> + * If that number is larger than the size of the array, the ioctl must
> + * be retried.
> + *
> + * Returns:
> + * 0 for success, -errno for errors.
> + */
> +int amdgpu_criu_bo_info_ioctl(struct drm_device *dev, void *data,
> +                         struct drm_file *filp)
> +{
> +     struct drm_amdgpu_criu_bo_info_args *args =3D data;
> +     struct drm_amdgpu_criu_bo_bucket *bo_buckets;
> +     struct drm_gem_object *gobj;
> +     int id, ret =3D 0;
> +     int bo_index =3D 0;
> +     int num_bos =3D 0;
> +
> +     spin_lock(&filp->table_lock);
> +     idr_for_each_entry(&filp->object_idr, gobj, id)
> +             num_bos +=3D 1;
> +     spin_unlock(&filp->table_lock);
> +
> +     if (args->num_bos < num_bos) {
> +             args->num_bos =3D num_bos;
> +             goto exit;
> +     }
> +     args->num_bos =3D num_bos;
> +     if (num_bos =3D=3D 0) {
> +             goto exit;
> +     }
> +
> +     bo_buckets =3D kvzalloc(num_bos * sizeof(*bo_buckets), GFP_KERNEL);
> +     if (!bo_buckets) {
> +             ret =3D -ENOMEM;
> +             goto free_buckets;
> +     }
> +
> +     spin_lock(&filp->table_lock);
> +     idr_for_each_entry(&filp->object_idr, gobj, id) {
> +             struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(gobj);
> +             struct drm_amdgpu_criu_bo_bucket *bo_bucket;
> +
> +             bo_bucket =3D &bo_buckets[bo_index];
> +
> +             bo_bucket->size =3D amdgpu_bo_size(bo);
> +             bo_bucket->offset =3D amdgpu_bo_mmap_offset(bo);

Not all BOs have a MMAP offset. Additional to that we already have an IOCTL=
 to query the mmap offset which does the appropriate checks and doesn't pot=
entially crash when there is none.

> +             bo_bucket->alloc_flags =3D bo->flags & (~AMDGPU_GEM_CREATE_=
VRAM_WIPE_ON_RELEASE);
> +             bo_bucket->preferred_domains =3D bo->preferred_domains;
> +             bo_bucket->gem_handle =3D id;
> +
> +             if (bo->tbo.base.import_attach)
> +                     bo_bucket->flags |=3D AMDGPU_CRIU_BO_FLAG_IS_IMPORT=
;
> +
> +             bo_index +=3D 1;
> +     }
> +     spin_unlock(&filp->table_lock);
> +
> +     ret =3D copy_to_user((void __user *)args->bo_buckets, bo_buckets, n=
um_bos * sizeof(*bo_buckets));
> +     if (ret) {
> +             pr_debug("Failed to copy BO information to user\n");
> +             ret =3D -EFAULT;
> +     }
> +
> +free_buckets:
> +     kvfree(bo_buckets);
> +exit:
> +
> +     return ret;
> +}
> +
> +/**
> + * amdgpu_criu_bo_info_ioctl - get information about a process' buffer o=
bjects
> + *
> + * @dev: drm device pointer
> + * @data: drm_amdgpu_criu_mapping_info_args
> + * @filp: drm file pointer
> + *
> + * num_mappings is set as an input to the size of the vm_buckets array.
> + * num_mappings is sent back as output as the number of mappings the bo =
has.
> + * If that number is larger than the size of the array, the ioctl must
> + * be retried.
> + *
> + * Returns:
> + * 0 for success, -errno for errors.
> + */
> +int amdgpu_criu_mapping_info_ioctl(struct drm_device *dev, void *data,
> +                         struct drm_file *filp)

Please split adding that into a separate patch.



> +{
> +     struct drm_amdgpu_criu_mapping_info_args *args =3D data;
> +     struct drm_gem_object *gobj =3D idr_find(&filp->object_idr, args->g=
em_handle);
> +     struct amdgpu_vm *avm =3D &((struct amdgpu_fpriv *)filp->driver_pri=
v)->vm;
> +     struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(gobj);
> +     struct amdgpu_bo_va *bo_va =3D amdgpu_vm_bo_find(avm, bo);
> +     struct amdgpu_fpriv *fpriv =3D filp->driver_priv;
> +     struct drm_amdgpu_criu_vm_bucket *vm_buckets;
> +     struct amdgpu_bo_va_mapping *mapping;
> +     struct drm_exec exec;

> +     int vm_index =3D 0;

That needs a better name.

> +     int ret =3D 0;

Don't initialize return variables if you don't need it. That is very bad pr=
actice.

> +
> +     vm_buckets =3D kvzalloc(args->num_mappings * sizeof(*vm_buckets), G=
FP_KERNEL);
> +     if (!vm_buckets) {
> +             ret =3D -ENOMEM;
> +             goto free_vms;
> +     }
> +
> +     drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
> +                   DRM_EXEC_IGNORE_DUPLICATES, 0);
> +     drm_exec_until_all_locked(&exec) {
> +             if (gobj) {
> +                     ret =3D drm_exec_lock_obj(&exec, gobj);
> +                     drm_exec_retry_on_contention(&exec);
> +                     if (ret)
> +                             goto unlock_exec;
> +             }
> +
> +             ret =3D amdgpu_vm_lock_pd(&fpriv->vm, &exec, 2);
> +             drm_exec_retry_on_contention(&exec);
> +             if (ret)
> +                     goto unlock_exec;
> +     }
> +


> +     amdgpu_vm_it_for_each_entry(avm, mapping, 0, U64_MAX) {
> +             if (mapping->bo_va =3D=3D bo_va) {
> +                     if (vm_index < args->num_mappings) {
> +                             vm_buckets[vm_index].start =3D mapping->sta=
rt;
> +                             vm_buckets[vm_index].last =3D mapping->last=
;
> +                             vm_buckets[vm_index].offset =3D mapping->of=
fset;
> +                             vm_buckets[vm_index].flags =3D hardware_fla=
gs_to_uapi_flags(drm_to_adev(dev), mapping->flags);
> +                     }
> +                     vm_index +=3D 1;
> +             }
> +     }

This chunk should go into amdgpu_vm.c And I strongly suggest to not go over=
 the mapping rb tree but rather the list in the bo_va.

Regards,
Christian.

> +
> +     drm_exec_fini(&exec);
> +
> +     if (vm_index > 0) {
> +             if (vm_index <=3D args->num_mappings) {
> +                     ret =3D copy_to_user((void __user *)args->vm_bucket=
s, vm_buckets, vm_index * sizeof(*vm_buckets));
> +                     if (ret) {
> +                             pr_debug("Failed to copy BO information to =
user\n");
> +                             ret =3D -EFAULT;
> +                     }
> +             }
> +     }
> +     args->num_mappings =3D vm_index;
> +
> +
> +     kvfree(vm_buckets);
> +
> +     return ret;
> +unlock_exec:
> +     drm_exec_fini(&exec);
> +free_vms:
> +     kvfree(vm_buckets);
> +
> +     return ret;
> +}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_criu.h
> new file mode 100644
> index 000000000000..9c196973ed0f
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> +* Copyright 2025 Advanced Micro Devices, Inc.
> +*
> +* Permission is hereby granted, free of charge, to any person obtaining =
a
> +* copy of this software and associated documentation files (the "Softwar=
e"),
> +* to deal in the Software without restriction, including without limitat=
ion
> +* the rights to use, copy, modify, merge, publish, distribute, sublicens=
e,
> +* and/or sell copies of the Software, and to permit persons to whom the
> +* Software is furnished to do so, subject to the following conditions:
> +*
> +* The above copyright notice and this permission notice shall be include=
d in
> +* all copies or substantial portions of the Software.
> +*
> +* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRES=
S OR
> +* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILIT=
Y,
> +* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHA=
LL
> +* THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES =
OR
> +* OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> +* ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> +* OTHER DEALINGS IN THE SOFTWARE.
> +*/
> +
> +#ifndef __AMDGPU_CRIU_H__
> +#define __AMDGPU_CRIU_H__
> +
> +#include <drm/amdgpu_drm.h>
> +
> +int amdgpu_criu_bo_info_ioctl(struct drm_device *dev, void *data,
> +                         struct drm_file *filp);
> +int amdgpu_criu_mapping_info_ioctl(struct drm_device *dev, void *data,
> +                         struct drm_file *filp);
> +
> +#endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_drv.c
> index 4db92e0a60da..5f3de93a665d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -53,6 +53,7 @@
>  #include "amdgpu_xgmi.h"
>  #include "amdgpu_userq.h"
>  #include "amdgpu_userq_fence.h"
> +#include "amdgpu_criu.h"
>  #include "../amdxcp/amdgpu_xcp_drv.h"
>
>  /*
> @@ -3021,6 +3022,8 @@ const struct drm_ioctl_desc amdgpu_ioctls_kms[] =3D=
 {
>        DRM_IOCTL_DEF_DRV(AMDGPU_USERQ, amdgpu_userq_ioctl, DRM_AUTH|DRM_R=
ENDER_ALLOW),
>        DRM_IOCTL_DEF_DRV(AMDGPU_USERQ_SIGNAL, amdgpu_userq_signal_ioctl, =
DRM_AUTH|DRM_RENDER_ALLOW),
>        DRM_IOCTL_DEF_DRV(AMDGPU_USERQ_WAIT, amdgpu_userq_wait_ioctl, DRM_=
AUTH|DRM_RENDER_ALLOW),
> +     DRM_IOCTL_DEF_DRV(AMDGPU_CRIU_BO_INFO, amdgpu_criu_bo_info_ioctl, D=
RM_AUTH|DRM_RENDER_ALLOW),
> +     DRM_IOCTL_DEF_DRV(AMDGPU_CRIU_MAPPING_INFO, amdgpu_criu_mapping_inf=
o_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>  };
>
>  static const struct drm_driver amdgpu_kms_driver =3D {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_vm.c
> index 3911c78f8282..f803908cf46d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -3156,3 +3156,14 @@ bool amdgpu_vm_is_bo_always_valid(struct amdgpu_vm=
 *vm, struct amdgpu_bo *bo)
>  {
>        return bo && bo->tbo.base.resv =3D=3D vm->root.bo->tbo.base.resv;
>  }
> +
> +
> +struct amdgpu_bo_va_mapping *amdgpu_vm_it_first_mapping_in_range(struct =
amdgpu_vm *avm, uint64_t start, uint64_t end)
> +{
> +     return amdgpu_vm_it_iter_first(&avm->va, start, end);
> +}
> +
> +struct amdgpu_bo_va_mapping *amdgpu_vm_it_next_mapping_in_range(struct a=
mdgpu_bo_va_mapping *mapping, uint64_t start, uint64_t end)
> +{
> +     return amdgpu_vm_it_iter_next(mapping, start, end);
> +}
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_vm.h
> index f3ad687125ad..cd7d3940cc7a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -668,4 +668,14 @@ void amdgpu_vm_tlb_fence_create(struct amdgpu_device=
 *adev,
>                                 struct amdgpu_vm *vm,
>                                 struct dma_fence **fence);
>
> +struct amdgpu_bo_va_mapping *amdgpu_vm_it_first_mapping_in_range(
> +     struct amdgpu_vm *avm, uint64_t start, uint64_t end);
> +struct amdgpu_bo_va_mapping *amdgpu_vm_it_next_mapping_in_range(
> +     struct amdgpu_bo_va_mapping *mapping, uint64_t start, uint64_t end)=
;
> +
> +#define amdgpu_vm_it_for_each_entry(avm, mapping, start, end) \
> +     for (mapping =3D amdgpu_vm_it_first_mapping_in_range(avm, start, en=
d); \
> +             mapping; \
> +             mapping =3D amdgpu_vm_it_next_mapping_in_range(mapping, sta=
rt, end))
> +
>  #endif
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/a=
md/amdkfd/kfd_chardev.c
> index a2149afa5803..a8cf2d4580cc 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -45,6 +45,8 @@
>  #include "amdgpu_dma_buf.h"
>  #include "kfd_debug.h"
>
> +#include "amdgpu_criu.h"
> +
>  static long kfd_ioctl(struct file *, unsigned int, unsigned long);
>  static int kfd_open(struct inode *, struct file *);
>  static int kfd_release(struct inode *, struct file *);
> diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.=
h
> index 45c4fa13499c..16aee825e116 100644
> --- a/include/uapi/drm/amdgpu_drm.h
> +++ b/include/uapi/drm/amdgpu_drm.h
> @@ -57,6 +57,10 @@ extern "C" {
>  #define DRM_AMDGPU_USERQ             0x16
>  #define DRM_AMDGPU_USERQ_SIGNAL              0x17
>  #define DRM_AMDGPU_USERQ_WAIT                0x18
> +#define DRM_AMDGPU_CRIU_OP           0x19
> +
> +#define DRM_AMDGPU_CRIU_BO_INFO      0x20
> +#define DRM_AMDGPU_CRIU_MAPPING_INFO 0x21
>
>  #define DRM_IOCTL_AMDGPU_GEM_CREATE  DRM_IOWR(DRM_COMMAND_BASE + DRM_AMD=
GPU_GEM_CREATE, union drm_amdgpu_gem_create)
>  #define DRM_IOCTL_AMDGPU_GEM_MMAP    DRM_IOWR(DRM_COMMAND_BASE + DRM_AMD=
GPU_GEM_MMAP, union drm_amdgpu_gem_mmap)
> @@ -77,6 +81,10 @@ extern "C" {
>  #define DRM_IOCTL_AMDGPU_USERQ               DRM_IOWR(DRM_COMMAND_BASE +=
 DRM_AMDGPU_USERQ, union drm_amdgpu_userq)
>  #define DRM_IOCTL_AMDGPU_USERQ_SIGNAL        DRM_IOWR(DRM_COMMAND_BASE +=
 DRM_AMDGPU_USERQ_SIGNAL, struct drm_amdgpu_userq_signal)
>  #define DRM_IOCTL_AMDGPU_USERQ_WAIT  DRM_IOWR(DRM_COMMAND_BASE + DRM_AMD=
GPU_USERQ_WAIT, struct drm_amdgpu_userq_wait)
> +#define DRM_IOCTL_AMDGPU_CRIU_OP     DRM_IOWR(DRM_COMMAND_BASE + DRM_AMD=
GPU_CRIU_OP, struct drm_amdgpu_criu_args)
> +
> +#define DRM_IOCTL_AMDGPU_CRIU_BO_INFO        DRM_IOWR(DRM_COMMAND_BASE +=
 DRM_AMDGPU_CRIU_BO_INFO, struct drm_amdgpu_criu_bo_info_args)
> +#define DRM_IOCTL_AMDGPU_CRIU_MAPPING_INFO   DRM_IOWR(DRM_COMMAND_BASE +=
 DRM_AMDGPU_CRIU_MAPPING_INFO, struct drm_amdgpu_criu_mapping_info_args)
>
>  /**
>   * DOC: memory domains
> @@ -1626,6 +1634,60 @@ struct drm_color_ctm_3x4 {
>        __u64 matrix[12];
>  };
>
> +#define AMDGPU_CRIU_BO_FLAG_IS_IMPORT        (1 << 0)
> +
> +struct drm_amdgpu_criu_bo_info_args {
> +    /* IN: Size of bo_buckets buffer. OUT: Number of bos in process (if =
larger than size of buffer, must retry) */
> +    __u32   num_bos;
> +
> +    /* User pointer to array of drm_amdgpu_criu_bo_bucket */
> +    __u64   bo_buckets;
> +};
> +
> +struct drm_amdgpu_criu_bo_bucket {
> +    /* Size of bo */
> +    __u64 size;
> +
> +    /* Offset of bo in device file */
> +    __u64 offset;
> +
> +    /* GEM_CREATE flags for re-creation of buffer */
> +    __u64 alloc_flags;
> +
> +    /* Pending how to handle this; provides information needed to remake=
 the buffer on restore */
> +    __u32 preferred_domains;
> +
> +    /* Currently just one flag: IS_IMPORT */
> +    __u32 flags;
> +
> +    __u32 gem_handle;
> +};
> +
> +struct drm_amdgpu_criu_mapping_info_args {
> +    /* Handle of bo to get mappings of */
> +    __u32   gem_handle;
> +
> +    /* IN: Size of vm_buckets buffer. OUT: Number of bos in process (if =
larger than size of buffer, must retry) */
> +    __u32   num_mappings;
> +
> +    /* User pointer to array of drm_amdgpu_criu_vm_bucket */
> +    __u64   vm_buckets;
> +};
> +
> +struct drm_amdgpu_criu_vm_bucket {
> +    /* Start of mapping (in number of pages) */
> +    __u64 start;
> +
> +    /* End of mapping (in number of pages) */
> +    __u64 last;
> +
> +    /* Mapping offset */
> +    __u64 offset;
> +
> +    /* flags needed to recreate mapping; still pending how to get these =
*/
> +    __u64 flags;
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif


--_000_SA1PR12MB81448862F5C3E0CD347ED4BDEF70ASA1PR12MB8144namp_
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
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt; &gt; + &nbsp; &nbsp; amdgpu_vm_it_for_each_entry(avm, mapping, 0, U64_=
MAX) {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (mapping-&gt;bo_va=
 =3D=3D bo_va) {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; if (vm_index &lt; args-&gt;num_mappings) {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; vm_buckets[vm_index].start =3D mapping-&=
gt;start;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; vm_buckets[vm_index].last =3D mapping-&g=
t;last;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; vm_buckets[vm_index].offset =3D mapping-=
&gt;offset;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; vm_buckets[vm_index].flags =3D hardware_=
flags_to_uapi_flags(drm_to_adev(dev), mapping-&gt;flags);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; }</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; vm_index +=3D 1;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt; &gt; + &nbsp; &nbsp; }</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt; This chunk should go into amdgpu_vm.c And I strongly suggest to not go=
 over the mapping rb tree but rather the list in the bo_va.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Do you mean the invalids and valids lists? I remember you having objections=
 to using those in a previous patch.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
David</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Koenig, Christian &lt=
;Christian.Koenig@amd.com&gt;<br>
<b>Sent:</b> Monday, June 16, 2025 5:01 AM<br>
<b>To:</b> Francis, David &lt;David.Francis@amd.com&gt;; dri-devel@lists.fr=
eedesktop.org &lt;dri-devel@lists.freedesktop.org&gt;<br>
<b>Cc:</b> tvrtko.ursulin@igalia.com &lt;tvrtko.ursulin@igalia.com&gt;; Kue=
hling, Felix &lt;Felix.Kuehling@amd.com&gt;; Yat Sin, David &lt;David.YatSi=
n@amd.com&gt;; Freehill, Chris &lt;Chris.Freehill@amd.com&gt;; dcostantino@=
meta.com &lt;dcostantino@meta.com&gt;; sruffell@meta.com &lt;sruffell@meta.=
com&gt;;
 simona@ffwll.ch &lt;simona@ffwll.ch&gt;; mripard@kernel.org &lt;mripard@ke=
rnel.org&gt;; tzimmermann@suse.de &lt;tzimmermann@suse.de&gt;<br>
<b>Subject:</b> Re: [PATCH 2/3] drm/amdgpu: Adding amdgpu CRIU ioctl</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 6/13/25 20:23, David Francis wrote:<br>
&gt; amdgpu CRIU requires an amdgpu CRIU ioctl. This ioctl<br>
&gt; has a similar interface to the amdkfd CRIU ioctl.<br>
&gt; <br>
&gt; The objects that can be checkpointed and restored are bos and vm<br>
&gt; mappings. Because a single amdgpu bo can have multiple mappings.<br>
&gt; the mappings are recorded separately.<br>
&gt; <br>
&gt; The ioctl has two modes: PROCESS_INFO, which sends to the user<br>
&gt; how many bos and vms to expect, and CHECKPOINT, which copies<br>
&gt; data about bos and vms into user-provided buffers.<br>
&gt; <br>
&gt; Restore is handled using existing amdgpu and drm ioctls.<br>
&gt; <br>
&gt; The new ioctl lives in a new file amdgpu_criu.c with its own<br>
&gt; header amdgpu_criu.h<br>
&gt; <br>
&gt; Signed-off-by: David Francis &lt;David.Francis@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; drivers/gpu/drm/amd/amdgpu/Makefile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp;&nbsp; 2 +-<br>
&gt;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c | 234 +++++++++++++++++=
++++++<br>
&gt;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h |&nbsp; 34 ++++<br>
&gt;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c&nbsp; |&nbsp;&nbsp; 3 +<=
br>
&gt;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c&nbsp;&nbsp; |&nbsp; 11 ++=
<br>
&gt;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h&nbsp;&nbsp; |&nbsp; 10 +<=
br>
&gt;&nbsp; drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |&nbsp;&nbsp; 2 +<br>
&gt;&nbsp; include/uapi/drm/amdgpu_drm.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 62 ++++++<br>
&gt;&nbsp; 8 files changed, 357 insertions(+), 1 deletion(-)<br>
&gt;&nbsp; create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c<br>
&gt;&nbsp; create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd=
/amdgpu/Makefile<br>
&gt; index 87080c06e5fc..0863edcdd03f 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/Makefile<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/Makefile<br>
&gt; @@ -63,7 +63,7 @@ amdgpu-y +=3D amdgpu_device.o amdgpu_doorbell_mgr.o =
amdgpu_kms.o \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_xgmi.o amdgpu_csa.o a=
mdgpu_ras.o amdgpu_vm_cpu.o \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_vm_sdma.o amdgpu_disc=
overy.o amdgpu_ras_eeprom.o amdgpu_nbio.o \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_umc.o smu_v11_0_i2c.o=
 amdgpu_fru_eeprom.o amdgpu_rap.o \<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_fw_attestation.o amdgpu_securedisplay=
.o \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_fw_attestation.o amdgpu_securedisplay=
.o amdgpu_criu.o \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_eeprom.o amdgpu_mca.o=
 amdgpu_psp_ta.o amdgpu_lsdma.o \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_mux.o amdgpu_xcp=
.o amdgpu_seq64.o amdgpu_aca.o amdgpu_dev_coredump.o \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_cper.o amdgpu_userq_f=
ence.o amdgpu_eviction_fence.o<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_criu.c<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..8141ab09698c<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c<br>
&gt; @@ -0,0 +1,234 @@<br>
&gt; +/* SPDX-License-Identifier: MIT */<br>
&gt; +/*<br>
&gt; +* Copyright 2025 Advanced Micro Devices, Inc.<br>
&gt; +*<br>
&gt; +* Permission is hereby granted, free of charge, to any person obtaini=
ng a<br>
&gt; +* copy of this software and associated documentation files (the &quot=
;Software&quot;),<br>
&gt; +* to deal in the Software without restriction, including without limi=
tation<br>
&gt; +* the rights to use, copy, modify, merge, publish, distribute, sublic=
ense,<br>
&gt; +* and/or sell copies of the Software, and to permit persons to whom t=
he<br>
&gt; +* Software is furnished to do so, subject to the following conditions=
:<br>
&gt; +*<br>
&gt; +* The above copyright notice and this permission notice shall be incl=
uded in<br>
&gt; +* all copies or substantial portions of the Software.<br>
&gt; +*<br>
&gt; +* THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY=
 KIND, EXPRESS OR<br>
&gt; +* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,<br>
&gt; +* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.&nbsp; IN NO E=
VENT SHALL<br>
&gt; +* THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAG=
ES OR<br>
&gt; +* OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWIS=
E,<br>
&gt; +* ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE =
OR<br>
&gt; +* OTHER DEALINGS IN THE SOFTWARE.<br>
&gt; +*/<br>
&gt; +<br>
&gt; +#include &lt;linux/dma-buf.h&gt;<br>
&gt; +#include &lt;linux/hashtable.h&gt;<br>
&gt; +#include &lt;linux/mutex.h&gt;<br>
&gt; +#include &lt;linux/random.h&gt;<br>
&gt; +<br>
&gt; +#include &lt;drm/amdgpu_drm.h&gt;<br>
&gt; +#include &lt;drm/drm_device.h&gt;<br>
&gt; +#include &lt;drm/drm_file.h&gt;<br>
&gt; +<br>
&gt; +#include &quot;amdgpu_criu.h&quot;<br>
&gt; +<br>
&gt; +#include &lt;drm/amdgpu_drm.h&gt;<br>
&gt; +#include &lt;drm/drm_drv.h&gt;<br>
&gt; +#include &lt;drm/drm_exec.h&gt;<br>
&gt; +#include &lt;drm/drm_gem_ttm_helper.h&gt;<br>
&gt; +#include &lt;drm/ttm/ttm_tt.h&gt;<br>
&gt; +#include &lt;linux/interval_tree_generic.h&gt;<br>
&gt; +<br>
&gt; +#include &quot;amdgpu.h&quot;<br>
&gt; +#include &quot;amdgpu_display.h&quot;<br>
&gt; +#include &quot;amdgpu_dma_buf.h&quot;<br>
&gt; +#include &quot;amdgpu_hmm.h&quot;<br>
&gt; +#include &quot;amdgpu_xgmi.h&quot;<br>
&gt; +<br>
&gt; +static uint32_t hardware_flags_to_uapi_flags(struct amdgpu_device *ad=
ev, uint64_t pte_flags)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; uint32_t gem_flags =3D 0;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; //This function will be replaced by the mapp=
ing flags rework<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (pte_flags &amp; AMDGPU_PTE_EXECUTABLE)<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; gem_flags |=3D AMDGPU_VM_PAGE_EXECUTABLE;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (pte_flags &amp; AMDGPU_PTE_READABLE)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; gem_flags |=3D AMDGPU_VM_PAGE_READABLE;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (pte_flags &amp; AMDGPU_PTE_WRITEABLE)<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; gem_flags |=3D AMDGPU_VM_PAGE_WRITEABLE;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (pte_flags &amp; AMDGPU_PTE_PRT_FLAG(adev=
))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; gem_flags |=3D AMDGPU_VM_PAGE_PRT;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (pte_flags &amp; AMDGPU_PTE_NOALLOC)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; gem_flags |=3D AMDGPU_VM_PAGE_NOALLOC;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return gem_flags;<br>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * amdgpu_criu_bo_info_ioctl - get information about a process' buffe=
r objects<br>
&gt; + *<br>
&gt; + * @dev: drm device pointer<br>
&gt; + * @data: drm_amdgpu_criu_bo_info_args<br>
&gt; + * @filp: drm file pointer<br>
&gt; + *<br>
&gt; + * num_bos is set as an input to the size of the bo_buckets array.<br=
>
&gt; + * num_bos is sent back as output as the number of bos in the process=
.<br>
&gt; + * If that number is larger than the size of the array, the ioctl mus=
t<br>
&gt; + * be retried.<br>
&gt; + *<br>
&gt; + * Returns:<br>
&gt; + * 0 for success, -errno for errors.<br>
&gt; + */<br>
&gt; +int amdgpu_criu_bo_info_ioctl(struct drm_device *dev, void *data,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 struct drm_file *filp)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct drm_amdgpu_criu_bo_info_args *args =
=3D data;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct drm_amdgpu_criu_bo_bucket *bo_buckets=
;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct drm_gem_object *gobj;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int id, ret =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int bo_index =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int num_bos =3D 0;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; spin_lock(&amp;filp-&gt;table_lock);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; idr_for_each_entry(&amp;filp-&gt;object_idr,=
 gobj, id)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; num_bos +=3D 1;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; spin_unlock(&amp;filp-&gt;table_lock);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (args-&gt;num_bos &lt; num_bos) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; args-&gt;num_bos =3D num_bos;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; goto exit;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; args-&gt;num_bos =3D num_bos;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (num_bos =3D=3D 0) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; goto exit;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; bo_buckets =3D kvzalloc(num_bos * sizeof(*bo=
_buckets), GFP_KERNEL);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!bo_buckets) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D -ENOMEM;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; goto free_buckets;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; spin_lock(&amp;filp-&gt;table_lock);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; idr_for_each_entry(&amp;filp-&gt;object_idr,=
 gobj, id) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(gobj);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct drm_amdgpu_criu_bo_bucket *bo_bucket;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bo_bucket =3D &amp;bo_buckets[bo_index];<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bo_bucket-&gt;size =3D amdgpu_bo_size(bo);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bo_bucket-&gt;offset =3D amdgpu_bo_mmap_offset(bo);<br>
<br>
Not all BOs have a MMAP offset. Additional to that we already have an IOCTL=
 to query the mmap offset which does the appropriate checks and doesn't pot=
entially crash when there is none.<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bo_bucket-&gt;alloc_flags =3D bo-&gt;flags &amp; (~AMDGPU_GEM_CREATE_VR=
AM_WIPE_ON_RELEASE);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bo_bucket-&gt;preferred_domains =3D bo-&gt;preferred_domains;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bo_bucket-&gt;gem_handle =3D id;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (bo-&gt;tbo.base.import_attach)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bo_bucket-&gt;flags |=
=3D AMDGPU_CRIU_BO_FLAG_IS_IMPORT;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bo_index +=3D 1;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; spin_unlock(&amp;filp-&gt;table_lock);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ret =3D copy_to_user((void __user *)args-&gt=
;bo_buckets, bo_buckets, num_bos * sizeof(*bo_buckets));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; pr_debug(&quot;Failed to copy BO information to user\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D -EFAULT;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +free_buckets:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; kvfree(bo_buckets);<br>
&gt; +exit:<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * amdgpu_criu_bo_info_ioctl - get information about a process' buffe=
r objects<br>
&gt; + *<br>
&gt; + * @dev: drm device pointer<br>
&gt; + * @data: drm_amdgpu_criu_mapping_info_args<br>
&gt; + * @filp: drm file pointer<br>
&gt; + *<br>
&gt; + * num_mappings is set as an input to the size of the vm_buckets arra=
y.<br>
&gt; + * num_mappings is sent back as output as the number of mappings the =
bo has.<br>
&gt; + * If that number is larger than the size of the array, the ioctl mus=
t<br>
&gt; + * be retried.<br>
&gt; + *<br>
&gt; + * Returns:<br>
&gt; + * 0 for success, -errno for errors.<br>
&gt; + */<br>
&gt; +int amdgpu_criu_mapping_info_ioctl(struct drm_device *dev, void *data=
,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 struct drm_file *filp)<br>
<br>
Please split adding that into a separate patch.<br>
<br>
<br>
<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct drm_amdgpu_criu_mapping_info_args *ar=
gs =3D data;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct drm_gem_object *gobj =3D idr_find(&am=
p;filp-&gt;object_idr, args-&gt;gem_handle);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_vm *avm =3D &amp;((struct amdg=
pu_fpriv *)filp-&gt;driver_priv)-&gt;vm;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(go=
bj);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_bo_va *bo_va =3D amdgpu_vm_bo_=
find(avm, bo);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_fpriv *fpriv =3D filp-&gt;driv=
er_priv;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct drm_amdgpu_criu_vm_bucket *vm_buckets=
;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_bo_va_mapping *mapping;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct drm_exec exec;<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int vm_index =3D 0;<br>
<br>
That needs a better name.<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
<br>
Don't initialize return variables if you don't need it. That is very bad pr=
actice.<br>
<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; vm_buckets =3D kvzalloc(args-&gt;num_mapping=
s * sizeof(*vm_buckets), GFP_KERNEL);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!vm_buckets) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D -ENOMEM;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; goto free_vms;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; drm_exec_init(&amp;exec, DRM_EXEC_INTERRUPTI=
BLE_WAIT |<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_EXEC_IGNORE_DUPLICATES, 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; drm_exec_until_all_locked(&amp;exec) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (gobj) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drm_exec_lock_o=
bj(&amp;exec, gobj);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_exec_retry_on_conte=
ntion(&amp;exec);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; goto unlock_exec;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D amdgpu_vm_lock_pd(&amp;fpriv-&gt;vm, &amp;exec, 2);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; drm_exec_retry_on_contention(&amp;exec);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (ret)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto unlock_exec;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_vm_it_for_each_entry(avm, mapping, 0,=
 U64_MAX) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (mapping-&gt;bo_va =3D=3D bo_va) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (vm_index &lt; args-=
&gt;num_mappings) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; vm_buckets[vm_index].start =3D mapping-&gt;start;<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; vm_buckets[vm_index].last =3D mapping-&gt;last;<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; vm_buckets[vm_index].offset =3D mapping-&gt;offset=
;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; vm_buckets[vm_index].flags =3D hardware_flags_to_u=
api_flags(drm_to_adev(dev), mapping-&gt;flags);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vm_index +=3D 1;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
<br>
This chunk should go into amdgpu_vm.c And I strongly suggest to not go over=
 the mapping rb tree but rather the list in the bo_va.<br>
<br>
Regards,<br>
Christian.<br>
<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; drm_exec_fini(&amp;exec);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (vm_index &gt; 0) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (vm_index &lt;=3D args-&gt;num_mappings) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D copy_to_user((v=
oid __user *)args-&gt;vm_buckets, vm_buckets, vm_index * sizeof(*vm_buckets=
));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; pr_debug(&quot;Failed to copy BO information to us=
er\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; ret =3D -EFAULT;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; args-&gt;num_mappings =3D vm_index;<br>
&gt; +<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; kvfree(vm_buckets);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; +unlock_exec:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; drm_exec_fini(&amp;exec);<br>
&gt; +free_vms:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; kvfree(vm_buckets);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; +}<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_criu.h<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..9c196973ed0f<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h<br>
&gt; @@ -0,0 +1,34 @@<br>
&gt; +/* SPDX-License-Identifier: MIT */<br>
&gt; +/*<br>
&gt; +* Copyright 2025 Advanced Micro Devices, Inc.<br>
&gt; +*<br>
&gt; +* Permission is hereby granted, free of charge, to any person obtaini=
ng a<br>
&gt; +* copy of this software and associated documentation files (the &quot=
;Software&quot;),<br>
&gt; +* to deal in the Software without restriction, including without limi=
tation<br>
&gt; +* the rights to use, copy, modify, merge, publish, distribute, sublic=
ense,<br>
&gt; +* and/or sell copies of the Software, and to permit persons to whom t=
he<br>
&gt; +* Software is furnished to do so, subject to the following conditions=
:<br>
&gt; +*<br>
&gt; +* The above copyright notice and this permission notice shall be incl=
uded in<br>
&gt; +* all copies or substantial portions of the Software.<br>
&gt; +*<br>
&gt; +* THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY=
 KIND, EXPRESS OR<br>
&gt; +* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,<br>
&gt; +* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.&nbsp; IN NO E=
VENT SHALL<br>
&gt; +* THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAG=
ES OR<br>
&gt; +* OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWIS=
E,<br>
&gt; +* ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE =
OR<br>
&gt; +* OTHER DEALINGS IN THE SOFTWARE.<br>
&gt; +*/<br>
&gt; +<br>
&gt; +#ifndef __AMDGPU_CRIU_H__<br>
&gt; +#define __AMDGPU_CRIU_H__<br>
&gt; +<br>
&gt; +#include &lt;drm/amdgpu_drm.h&gt;<br>
&gt; +<br>
&gt; +int amdgpu_criu_bo_info_ioctl(struct drm_device *dev, void *data,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 struct drm_file *filp);<br>
&gt; +int amdgpu_criu_mapping_info_ioctl(struct drm_device *dev, void *data=
,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 struct drm_file *filp);<br>
&gt; +<br>
&gt; +#endif<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_drv.c<br>
&gt; index 4db92e0a60da..5f3de93a665d 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&gt; @@ -53,6 +53,7 @@<br>
&gt;&nbsp; #include &quot;amdgpu_xgmi.h&quot;<br>
&gt;&nbsp; #include &quot;amdgpu_userq.h&quot;<br>
&gt;&nbsp; #include &quot;amdgpu_userq_fence.h&quot;<br>
&gt; +#include &quot;amdgpu_criu.h&quot;<br>
&gt;&nbsp; #include &quot;../amdxcp/amdgpu_xcp_drv.h&quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; /*<br>
&gt; @@ -3021,6 +3022,8 @@ const struct drm_ioctl_desc amdgpu_ioctls_kms[] =
=3D {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_IOCTL_DEF_DRV(AMDGPU_USE=
RQ, amdgpu_userq_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_IOCTL_DEF_DRV(AMDGPU_USE=
RQ_SIGNAL, amdgpu_userq_signal_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_IOCTL_DEF_DRV(AMDGPU_USE=
RQ_WAIT, amdgpu_userq_wait_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; DRM_IOCTL_DEF_DRV(AMDGPU_CRIU_BO_INFO, amdgp=
u_criu_bo_info_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; DRM_IOCTL_DEF_DRV(AMDGPU_CRIU_MAPPING_INFO, =
amdgpu_criu_mapping_info_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),<br>
&gt;&nbsp; };<br>
&gt;&nbsp; <br>
&gt;&nbsp; static const struct drm_driver amdgpu_kms_driver =3D {<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_vm.c<br>
&gt; index 3911c78f8282..f803908cf46d 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c<br>
&gt; @@ -3156,3 +3156,14 @@ bool amdgpu_vm_is_bo_always_valid(struct amdgpu=
_vm *vm, struct amdgpu_bo *bo)<br>
&gt;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return bo &amp;&amp; bo-&gt;=
tbo.base.resv =3D=3D vm-&gt;root.bo-&gt;tbo.base.resv;<br>
&gt;&nbsp; }<br>
&gt; +<br>
&gt; +<br>
&gt; +struct amdgpu_bo_va_mapping *amdgpu_vm_it_first_mapping_in_range(stru=
ct amdgpu_vm *avm, uint64_t start, uint64_t end)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return amdgpu_vm_it_iter_first(&amp;avm-&gt;=
va, start, end);<br>
&gt; +}<br>
&gt; +<br>
&gt; +struct amdgpu_bo_va_mapping *amdgpu_vm_it_next_mapping_in_range(struc=
t amdgpu_bo_va_mapping *mapping, uint64_t start, uint64_t end)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return amdgpu_vm_it_iter_next(mapping, start=
, end);<br>
&gt; +}<br>
&gt; \ No newline at end of file<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_vm.h<br>
&gt; index f3ad687125ad..cd7d3940cc7a 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h<br>
&gt; @@ -668,4 +668,14 @@ void amdgpu_vm_tlb_fence_create(struct amdgpu_dev=
ice *adev,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_vm *vm,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dma_fence **fence);<b=
r>
&gt;&nbsp; <br>
&gt; +struct amdgpu_bo_va_mapping *amdgpu_vm_it_first_mapping_in_range(<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_vm *avm, uint64_t start, uint6=
4_t end);<br>
&gt; +struct amdgpu_bo_va_mapping *amdgpu_vm_it_next_mapping_in_range(<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_bo_va_mapping *mapping, uint64=
_t start, uint64_t end);<br>
&gt; +<br>
&gt; +#define amdgpu_vm_it_for_each_entry(avm, mapping, start, end) \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for (mapping =3D amdgpu_vm_it_first_mapping_=
in_range(avm, start, end); \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; mapping; \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; mapping =3D amdgpu_vm_it_next_mapping_in_range(mapping, start, end))<br=
>
&gt; +<br>
&gt;&nbsp; #endif<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/dr=
m/amd/amdkfd/kfd_chardev.c<br>
&gt; index a2149afa5803..a8cf2d4580cc 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c<br>
&gt; +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c<br>
&gt; @@ -45,6 +45,8 @@<br>
&gt;&nbsp; #include &quot;amdgpu_dma_buf.h&quot;<br>
&gt;&nbsp; #include &quot;kfd_debug.h&quot;<br>
&gt;&nbsp; <br>
&gt; +#include &quot;amdgpu_criu.h&quot;<br>
&gt; +<br>
&gt;&nbsp; static long kfd_ioctl(struct file *, unsigned int, unsigned long=
);<br>
&gt;&nbsp; static int kfd_open(struct inode *, struct file *);<br>
&gt;&nbsp; static int kfd_release(struct inode *, struct file *);<br>
&gt; diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_d=
rm.h<br>
&gt; index 45c4fa13499c..16aee825e116 100644<br>
&gt; --- a/include/uapi/drm/amdgpu_drm.h<br>
&gt; +++ b/include/uapi/drm/amdgpu_drm.h<br>
&gt; @@ -57,6 +57,10 @@ extern &quot;C&quot; {<br>
&gt;&nbsp; #define DRM_AMDGPU_USERQ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x16<br>
&gt;&nbsp; #define DRM_AMDGPU_USERQ_SIGNAL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x17<br>
&gt;&nbsp; #define DRM_AMDGPU_USERQ_WAIT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x18<br>
&gt; +#define DRM_AMDGPU_CRIU_OP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; 0x19<br>
&gt; +<br>
&gt; +#define DRM_AMDGPU_CRIU_BO_INFO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x20<br=
>
&gt; +#define DRM_AMDGPU_CRIU_MAPPING_INFO 0x21<br>
&gt;&nbsp; <br>
&gt;&nbsp; #define DRM_IOCTL_AMDGPU_GEM_CREATE&nbsp; DRM_IOWR(DRM_COMMAND_B=
ASE + DRM_AMDGPU_GEM_CREATE, union drm_amdgpu_gem_create)<br>
&gt;&nbsp; #define DRM_IOCTL_AMDGPU_GEM_MMAP&nbsp;&nbsp;&nbsp; DRM_IOWR(DRM=
_COMMAND_BASE + DRM_AMDGPU_GEM_MMAP, union drm_amdgpu_gem_mmap)<br>
&gt; @@ -77,6 +81,10 @@ extern &quot;C&quot; {<br>
&gt;&nbsp; #define DRM_IOCTL_AMDGPU_USERQ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_IOWR(DRM_COMMAND_BAS=
E + DRM_AMDGPU_USERQ, union drm_amdgpu_userq)<br>
&gt;&nbsp; #define DRM_IOCTL_AMDGPU_USERQ_SIGNAL&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_SIGNAL, struct=
 drm_amdgpu_userq_signal)<br>
&gt;&nbsp; #define DRM_IOCTL_AMDGPU_USERQ_WAIT&nbsp; DRM_IOWR(DRM_COMMAND_B=
ASE + DRM_AMDGPU_USERQ_WAIT, struct drm_amdgpu_userq_wait)<br>
&gt; +#define DRM_IOCTL_AMDGPU_CRIU_OP&nbsp;&nbsp;&nbsp;&nbsp; DRM_IOWR(DRM=
_COMMAND_BASE + DRM_AMDGPU_CRIU_OP, struct drm_amdgpu_criu_args)<br>
&gt; +<br>
&gt; +#define DRM_IOCTL_AMDGPU_CRIU_BO_INFO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_CRIU_BO_INFO, struct drm_=
amdgpu_criu_bo_info_args)<br>
&gt; +#define DRM_IOCTL_AMDGPU_CRIU_MAPPING_INFO&nbsp;&nbsp; DRM_IOWR(DRM_C=
OMMAND_BASE + DRM_AMDGPU_CRIU_MAPPING_INFO, struct drm_amdgpu_criu_mapping_=
info_args)<br>
&gt;&nbsp; <br>
&gt;&nbsp; /**<br>
&gt;&nbsp;&nbsp; * DOC: memory domains<br>
&gt; @@ -1626,6 +1634,60 @@ struct drm_color_ctm_3x4 {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __u64 matrix[12];<br>
&gt;&nbsp; };<br>
&gt;&nbsp; <br>
&gt; +#define AMDGPU_CRIU_BO_FLAG_IS_IMPORT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; (1 &lt;&lt; 0)<br>
&gt; +<br>
&gt; +struct drm_amdgpu_criu_bo_info_args {<br>
&gt; +&nbsp;&nbsp;&nbsp; /* IN: Size of bo_buckets buffer. OUT: Number of b=
os in process (if larger than size of buffer, must retry) */<br>
&gt; +&nbsp;&nbsp;&nbsp; __u32&nbsp;&nbsp; num_bos;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; /* User pointer to array of drm_amdgpu_criu_bo_buc=
ket */<br>
&gt; +&nbsp;&nbsp;&nbsp; __u64&nbsp;&nbsp; bo_buckets;<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct drm_amdgpu_criu_bo_bucket {<br>
&gt; +&nbsp;&nbsp;&nbsp; /* Size of bo */<br>
&gt; +&nbsp;&nbsp;&nbsp; __u64 size;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; /* Offset of bo in device file */<br>
&gt; +&nbsp;&nbsp;&nbsp; __u64 offset;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; /* GEM_CREATE flags for re-creation of buffer */<b=
r>
&gt; +&nbsp;&nbsp;&nbsp; __u64 alloc_flags;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; /* Pending how to handle this; provides informatio=
n needed to remake the buffer on restore */<br>
&gt; +&nbsp;&nbsp;&nbsp; __u32 preferred_domains;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; /* Currently just one flag: IS_IMPORT */<br>
&gt; +&nbsp;&nbsp;&nbsp; __u32 flags;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; __u32 gem_handle;<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct drm_amdgpu_criu_mapping_info_args {<br>
&gt; +&nbsp;&nbsp;&nbsp; /* Handle of bo to get mappings of */<br>
&gt; +&nbsp;&nbsp;&nbsp; __u32&nbsp;&nbsp; gem_handle;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; /* IN: Size of vm_buckets buffer. OUT: Number of b=
os in process (if larger than size of buffer, must retry) */<br>
&gt; +&nbsp;&nbsp;&nbsp; __u32&nbsp;&nbsp; num_mappings;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; /* User pointer to array of drm_amdgpu_criu_vm_buc=
ket */<br>
&gt; +&nbsp;&nbsp;&nbsp; __u64&nbsp;&nbsp; vm_buckets;<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct drm_amdgpu_criu_vm_bucket {<br>
&gt; +&nbsp;&nbsp;&nbsp; /* Start of mapping (in number of pages) */<br>
&gt; +&nbsp;&nbsp;&nbsp; __u64 start;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; /* End of mapping (in number of pages) */<br>
&gt; +&nbsp;&nbsp;&nbsp; __u64 last;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; /* Mapping offset */<br>
&gt; +&nbsp;&nbsp;&nbsp; __u64 offset;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; /* flags needed to recreate mapping; still pending=
 how to get these */<br>
&gt; +&nbsp;&nbsp;&nbsp; __u64 flags;<br>
&gt; +};<br>
&gt; +<br>
&gt;&nbsp; #if defined(__cplusplus)<br>
&gt;&nbsp; }<br>
&gt;&nbsp; #endif<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_SA1PR12MB81448862F5C3E0CD347ED4BDEF70ASA1PR12MB8144namp_--
