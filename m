Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9563877FDD
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 13:21:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD481129EF;
	Mon, 11 Mar 2024 12:21:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LDZFu4qI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2080.outbound.protection.outlook.com [40.107.243.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E19C10F915;
 Mon, 11 Mar 2024 12:21:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UV0GlgD+w8MQ8RMOCdK9H7mRttueIefSdY4VCe08E4A8LLvqTCfJX8u3+PSzBzKxoXKyaI54MxaEWsvXAf27jZU0dJWPUwaUwk+8WIHU68nFHjOP8yAXuStRgilvg9tu2/9Kj55oe3HP37VMEEAtCtasdq9z42RxepRcDE8a4LkIkuujeAA++4BdsxcJOc9LYGt6vHH43RuF2Fdy9DFXFjkfgR//wkpjb79luWN2KXu09K4gvAQJIZKyULpkhhQRJY9WpgLKdKMkZnBi6MDiI0FEbkcuZYXDcp6z7rEjqEZvjJUU9w6MdVNsoPP97Uazi9ZWvQ+FUGa2t3WycFebbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CnM82sadJF7yC9zsjkONHj8i1bFrCThqFhgoTfGv8gg=;
 b=AAywmmw2m+PSCVIiUetQyLhi+VKEKvwHD+r4SZdNuQ7WMyuF+81Ne10gSX+DaEGJPHJ4DzAwL78nEOO/9qZchaCfdMkLsdx/44vEC12pd5apcP0CEL0cIqJ7EIh8MhhGlvI7jlxTVEhHULx3Jb6mcQJh9TaXZsDLwaFZUJjtZy6bEZB7YLSOSEeGizJLA0qGcguQif9RTv4hNNGn7X8qAN8D12i4hW2f0/UIWs/LgW2oYBIZ1PHPsAeONCSlrb2lGKSSIg2wEa5XNt4l81AwiIdAHUNCbo+q0v883ZjDz/sUgZF+pu6u1VyYzaGMNKysxW3STN1SgDyERO9v1OzVyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CnM82sadJF7yC9zsjkONHj8i1bFrCThqFhgoTfGv8gg=;
 b=LDZFu4qIaJwoyp+ZZ389a/h/ZXpSA2p03HX9wrYa7f8MrrMAKuaClri+0FVe5xLv3bxToJxlEtRw2dvG1td4fbRcxX8mDWt/IIW3FPbydR4KgH+uF77XG3RgbLzo2Ja5+39BkX1RvvcbkUxqOzqSjrkM+siZ9fqOROzFU+R+w00=
Received: from PH7PR12MB5596.namprd12.prod.outlook.com (2603:10b6:510:136::13)
 by CYYPR12MB8853.namprd12.prod.outlook.com (2603:10b6:930:cb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Mon, 11 Mar
 2024 12:21:33 +0000
Received: from PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6f48:e3f1:6ff9:75bd]) by PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6f48:e3f1:6ff9:75bd%4]) with mapi id 15.20.7362.031; Mon, 11 Mar 2024
 12:21:33 +0000
From: "Khatri, Sunil" <Sunil.Khatri@amd.com>
To: "Khatri, Sunil" <Sunil.Khatri@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Sharma, Shashank" <Shashank.Sharma@amd.com>
CC: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm/amdgpu: add all ringbuffer information in devcoredump
Thread-Topic: [PATCH] drm/amdgpu: add all ringbuffer information in devcoredump
Thread-Index: AQHac6gEoTKbKOkInUSBXcRVy017XLEydd4Q
Date: Mon, 11 Mar 2024 12:21:33 +0000
Message-ID: <PH7PR12MB5596D6E313368B21FEC9295C93242@PH7PR12MB5596.namprd12.prod.outlook.com>
References: <20240311113351.271734-1-sunil.khatri@amd.com>
In-Reply-To: <20240311113351.271734-1-sunil.khatri@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB5596:EE_|CYYPR12MB8853:EE_
x-ms-office365-filtering-correlation-id: a9ca8c31-1215-48da-e238-08dc41c5ca2d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nFupKqHxALIip+03erPwQPx2gvvlTIMLYKOeqlneWoS+vhB3y1GunJjqyBnDKskZTTB+42H9R6NvPkGjqiF5feEojRezhRbgbw9lcUBrBffJ9BMk8we1frOT4h7krIzFkBOcq60LKnkbup/WGn+9vYEn7KFWvWrE8Qfgy8Ett5AJyngI8eNTJ9z21Yqc2RQyyZiYPU+H+Ax0Olyp1JHaL76V8bTG7Lb+VcX8+0p9HolZ8IV57ghER1aBVVmW9zOS5b2K2WSlfskgLeM04k7lIkm4YWjb7xpiteKt6DJ01ohRpxifVMx/VCyNFTbXku5jcHjBwncf7L6t6Ep+y8OH5oYKUcgwrI+FpP+hJosyGNP2putqyTrG1AAtaraxXxNkb+gU/zR9aHC0YR2CQ5X30yzNsKqtJct8x14uRPWLnuKZHsrf/X3TnnHluQj1lxYi9fJNjTwHcfW/dwezsIPKbN0dzJXzpDRKgge0qqZbWn/IYkSMqRtHbKxsCFH5CplIpdSlDNVfqSm0eq7bQzJrzZk5O7hz4xcy04oGdOoaBO/LghPejytomlDRWWTJvRYx2Jt6iCTKa0amEUrT9K4dRJJ7agmXAOLSrvQpAiQx0rOiDajXrHpYqbiFCFDnwd8TiqkDquc9/ssAm776Z5hCrk/TbvTlVX/0DQNaRtwFKQFHZfpvd7Qo72Dw+bSnLm0bfgM0ccy7NG0pl7R6KVkTOInouSsZquXIMnuQImFqJuI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5596.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KamERkkrFHnsttuWcMTBgh7XBjlSfgrQVJajaO0fDZLMxUToxOMubyJBqM2L?=
 =?us-ascii?Q?IPJvZXSws+g4nzAwcAS5uD1uC+HioVfrLY32TgycZhReGaxJbcE7WN/eYnCP?=
 =?us-ascii?Q?lahy6ScllGkpOo4SVkdRmLz4TVLukEUNXTaHEk2aAKGpqfI8RugOUIyMQ+p1?=
 =?us-ascii?Q?Ox7nM0JY/LCycRIAfa70waYqiF43jqAX8ERM5+5xTEJkb3//EqYDNegBwvud?=
 =?us-ascii?Q?Ofmcx5b4Ox8XItU5DLRC25Aw0hEVGkB3TR47Va3h/xVWvAJjeUf4qzmVoUZg?=
 =?us-ascii?Q?4yC6dm8NX8lYnFzJD62a9ieYap8CarsZYYIgZq3w3dXN3DjbdwgD3yKVUSfb?=
 =?us-ascii?Q?dEYLIDBrBiZNQ0rhdKVhEepIsQJLb4kPjdgtKjdtWzrjF5FAk0bKLp/+XQn2?=
 =?us-ascii?Q?J4FPC8UT5ZmtUhveWfHhPrnrXRLEwYHbaS0HRs1bgQpi2eiQaiZ2qt34x2U1?=
 =?us-ascii?Q?03HyWtWZx3rucvSgx+KvkmPfzY/9v5EyKuwbNv9Tq3Po1iy2J96Ob9ckGWI+?=
 =?us-ascii?Q?SfQbHN2Zypljmwy6iUisI639V81+OyybjGvBEQUGewUcBkHnovbDOvHpUtDE?=
 =?us-ascii?Q?wxA3z70PcCkiaAbZtL6AYfuegiUARidKDWNDGzABvWuqqKz672vPrcnvr0ro?=
 =?us-ascii?Q?WOWMq37HqH6IRBYzfWOQGw8KudEyQbM1etVhZ+yyOy4jyuvVXeMvRJRP/RPE?=
 =?us-ascii?Q?/c0IsoC+2QjiEzd+66zAm9xD6usXGDTG3r74NAPpHrSzKbs9MaE3v1nEYdgp?=
 =?us-ascii?Q?kmChwdJjeUA1PHzjrXsqPGOBZRJqL32I0Aqog8seK/EZN5GdkeN9lNYnzALU?=
 =?us-ascii?Q?3VqNRmEpNgHTJgwEbBdJ5xaKXD37Dh5NSvfzBRvT5oxZ4+PwxiL5kswGPMKQ?=
 =?us-ascii?Q?wFo7zLrPaAK7GfmJWcDd5Ofc7K0ZpT3zGaOpBhOrck131EzN+pO5EX+fYSMg?=
 =?us-ascii?Q?8QJzEXIaxeYdpSbyVLJCsCTy9sS5vd7/Kj4Tu1xKYOQgbtCQZomT/zlxH4VB?=
 =?us-ascii?Q?L2Z6/9FczYQ+4a1lgx2tFo/awPf5nOEN8P/f5p1azfMmvLNhix16+T02HFTG?=
 =?us-ascii?Q?jHASr4nZXBZ3KAZdfP9uudSMnz8FebhHRwiUQnMFQy1jvTqIV9fC0lIr3vp7?=
 =?us-ascii?Q?D4NBGDvyFQyL0VsvTnsxBLEJlovLkmS8jirngveG/y543p+w8iyb4PjwY4qo?=
 =?us-ascii?Q?uLFlN3sSaFIf26MNm8D90pwZQpGkv3v8N8g8dudJVwvsAdmp6SQ960A/qRym?=
 =?us-ascii?Q?qVXx60ZsaHb7jxvliWSaF4kysuMbmw3JTjGmaJJvE97rfQbFek2h3SknmJXz?=
 =?us-ascii?Q?Fo1L91tE83iNACalNld8JXf+lfoGExOKCevoV1oH+PRNDn//CRkUCdwv/lhV?=
 =?us-ascii?Q?7ZlQqt1F9My+0pBIN/75+fJAD2tust3cuRQMDtzlhoJ85tv+xIFIVT6ht6tb?=
 =?us-ascii?Q?1ldZyE+bgICqReFVFO5hzj3Kql2yhHfx6+TDiMmK0Ms7NXRketaBvXC/Fwl8?=
 =?us-ascii?Q?IBpYtweUskVsv9e1WR++j3w9LpBhD77RyJI6+buICy2nCtyArEYpEJfbisn1?=
 =?us-ascii?Q?Qq16fpdXGBdy1c45dKk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5596.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9ca8c31-1215-48da-e238-08dc41c5ca2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2024 12:21:33.5835 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lR6t5JpDqFB0ZIhPLzS7QKjLhoau3fuO2g9o9FxZ4RUgvSeoyIrdZRDerKNbgAKM4KuIbzA6PbcmjM9nRzsBDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8853
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

Ignore this as I updated commit message and subject so sending new mail.


-----Original Message-----
From: Sunil Khatri <sunil.khatri@amd.com>=20
Sent: Monday, March 11, 2024 5:04 PM
To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Chri=
stian.Koenig@amd.com>; Sharma, Shashank <Shashank.Sharma@amd.com>
Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-k=
ernel@vger.kernel.org; Khatri, Sunil <Sunil.Khatri@amd.com>
Subject: [PATCH] drm/amdgpu: add all ringbuffer information in devcoredump

Add ringbuffer information such as:
rptr, wptr, ring name, ring size and also the ring contents for each ring o=
n a gpu reset.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_reset.c
index 6d059f853adc..1992760039da 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
@@ -215,6 +215,27 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, s=
ize_t count,
 			   fault_info->status);
 	}
=20
+	drm_printf(&p, "Ring buffer information\n");
+	for (int i =3D 0; i < coredump->adev->num_rings; i++) {
+		int j =3D 0;
+		struct amdgpu_ring *ring =3D coredump->adev->rings[i];
+
+		drm_printf(&p, "ring name: %s\n", ring->name);
+		drm_printf(&p, "Rptr: 0x%llx Wptr: 0x%llx\n",
+			   amdgpu_ring_get_rptr(ring) & ring->buf_mask,
+			   amdgpu_ring_get_wptr(ring) & ring->buf_mask);
+		drm_printf(&p, "Ring size in dwords: %d\n",
+			   ring->ring_size / 4);
+		drm_printf(&p, "Ring contents\n");
+		drm_printf(&p, "Offset \t Value\n");
+
+		while (j < ring->ring_size) {
+			drm_printf(&p, "0x%x \t 0x%x\n", j, ring->ring[j/4]);
+			j +=3D 4;
+		}
+		drm_printf(&p, "Ring dumped\n");
+	}
+
 	if (coredump->reset_vram_lost)
 		drm_printf(&p, "VRAM is lost due to GPU reset!\n");
 	if (coredump->adev->reset_info.num_regs) {
--
2.34.1

