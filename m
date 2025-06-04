Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1885FACEBDF
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 10:30:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C64710E80E;
	Thu,  5 Jun 2025 08:29:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="Bm3iMoNc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010052.outbound.protection.outlook.com [52.101.229.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D349910E7BF
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 11:54:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=amDHOsBWuknTsSPtkCzmA96iJlUuop+anMOmhEwJz9wXyV0Wx/JizU1vicGLx2/jB08GouCqvyGTqft/V9as/sMYsWDfzUe8NpZ4spqL5NnhYcARD0/nivYPRqO666JryNlgvx+DKIYkqFqa+J+VW/hMj1RM6+Nr3qz1haV/UM0RpOBgnTIIj1eKBrKF354ZKWvs6SyXveBrT+K917ohkOqOYhGBEPaot+ypVcWbon7hQVZSginxtDU4/f4KHgCXKSm5slG78DypsShY5pxzS23dkbiCSkim+H+JdMMmqo/Uk09p/b6Dsi6APHZvhQ5FanWI8HAQVF2YbHKidWFh/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMvmqWZGWCKdJcGFjkYWMbd1en9FJ+RgAIo1JkEl4bQ=;
 b=eqio0dP8pq4V8uhF7v+qrj0qn9gCkQeM2DhvuyzwJC/fhyucKOpT/MouOohgBHq8WVQj/H4BofC/eUG/LpyDZokcTOdgYunwu1vrmj4VByIL552iJ5ZaILdXNiI4XiL3qiDInHPY2qUf/cTWnrZzzXTNp+4I7rMk/8yDzZvKUVBcfPSSJSqAAZm9kBlMu0ECWCkBG7lgYHDIjj6BEtknB1D51Nx8oUz1p8m9quBYE+N8wKIYfkThW29owLS1n6o/8R8F1I4okXS86sfe1F0bXqKJn8GgNimQ+/yocn2UB29NinpTENONS+riDR9QueHfPiOCwNUlYERkvZEWsldBJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMvmqWZGWCKdJcGFjkYWMbd1en9FJ+RgAIo1JkEl4bQ=;
 b=Bm3iMoNcCnh6MLPmGuZgfdXK9oE55og5t5UIsEMxZ8VQAURtWeKzq9S+mkgP9N2q8xzF/c1LiN21klggdb3TyKRPag9E0QbVQrZxlqZ8Za5MLrWEtpFT3O6kkckoYMXPMZ+RnxBTw6L+Se09uIakXAxbWlAcsJVN+vYrn9jdzMA=
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com (2603:1096:604:1a2::11)
 by TYCPR01MB9894.jpnprd01.prod.outlook.com (2603:1096:400:220::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.19; Wed, 4 Jun
 2025 11:54:28 +0000
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::3bc8:765f:f19e:16d5]) by OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::3bc8:765f:f19e:16d5%5]) with mapi id 15.20.8813.018; Wed, 4 Jun 2025
 11:54:28 +0000
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Hugo Villeneuve <hugo@hugovil.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hugo
 Villeneuve <hvilleneuve@dimonoff.com>
Subject: RE: [PATCH v3 2/2] drm: renesas: rz-du: Set DCS maximum return packet
 size
Thread-Topic: [PATCH v3 2/2] drm: renesas: rz-du: Set DCS maximum return
 packet size
Thread-Index: AQHbyydYZROipDs4Mk6V13hnElvTOLPy9BEw
Date: Wed, 4 Jun 2025 11:54:28 +0000
Message-ID: <OS3PR01MB831999C4A5A32FE11CC04A078A6CA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20250522143911.138077-1-hugo@hugovil.com>
 <20250522143911.138077-3-hugo@hugovil.com>
In-Reply-To: <20250522143911.138077-3-hugo@hugovil.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB8319:EE_|TYCPR01MB9894:EE_
x-ms-office365-filtering-correlation-id: 7e1b19a7-88d3-4f0c-bbea-08dda35e8f8f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Fmyj1KikUkKi0mSHJe3gVwH+DGW0Q90mzj+6dph6S2kDuOSu4ZEVwVG2XSw4?=
 =?us-ascii?Q?eOURvMvE+Oca+rSRTUZtQgEwT/EwiYKCT8RDqCvYPpkm8oIwbWL5SX7SLBXO?=
 =?us-ascii?Q?aSbO0PN6Rvlci08P3Ik4jIiIT2oQq37lc5xrGys4+Tf+oVVuEIcxgH3sN9TT?=
 =?us-ascii?Q?CkeI3+2CQvNDCZaU8GYQzKla+6cVg8sYMZ3PDtKDpZT+Hm3lfsotR0zLHJZn?=
 =?us-ascii?Q?56o3pXKlZPJpgKBUtcc6bTXS4BUv4S0c2oVeEG4LzaRzOK5uc3rbEcrPzOm5?=
 =?us-ascii?Q?0vkPgVyvN4hA+hzXacSIYmbI+o2F0NL8IJ6glyq2fTzy0KL+MReCSitsFvko?=
 =?us-ascii?Q?bDncfH69wWh2igDJrmfbRGd6ihtRgstMYeol9d00gY67yZb2ixQy1Up6o09R?=
 =?us-ascii?Q?ofKp7gJltj0OZXnMq5tKsifxFODatxkMJGdgWeSAfG5CHuunC871S3x/RvT8?=
 =?us-ascii?Q?JF2j4TDtI7qy1XgGLgnSJAnz8CEB7xt6vfNr6RkW6Zekz5RDmCZ+nhmgBVh5?=
 =?us-ascii?Q?653c3lUuVe4xysg/kK5UX08wG6+fzFvk2AL9WYcpIVPd+wSra5F//LtymX5k?=
 =?us-ascii?Q?2+MKAq0nE/BBF/paQ9ngEgdot6xcSyLZNJdniMbEOBRLmaQXxQiFuOZSH4Jb?=
 =?us-ascii?Q?nkQ7/g7xxhxHPMgmm2z/rNef2YD9aOF9ZnHuBFHQVUuuKVOSpQzFlmvh+Sw/?=
 =?us-ascii?Q?JZouGeix4BuGHHeDDYSXQERev6Nlj2QXOovZehqOuj00udwlz8M/qsZEVQYE?=
 =?us-ascii?Q?jJBFGAAM9oo7Z4iac+HegDWk0/SzSsdn3TsYqX0Mh3KGpdQtCKGhUhCYoKf6?=
 =?us-ascii?Q?MweLFJ1UsZSPFfk+lDyyp7jKuR0jwdqQWUBv6mZ0bHaUpEygVUViwub6RCtd?=
 =?us-ascii?Q?qgK9dq4HFOiHxSIhFgAjXg1Cnrg0yBeN+WXLC6V5UWBICzYKwF0bSWFCA8Xf?=
 =?us-ascii?Q?E8H5YRcqGPoY/gg7znMByax/qF/HbGUA/QM5HRR35FKnt/MtCZ0x3I3zGEWL?=
 =?us-ascii?Q?PDCW8L19BIsz5y/oCNDbEpyBWUo5drTjub3sdyvopgObVLCPTmUaPrln9nCQ?=
 =?us-ascii?Q?LEfVWD1263+ewE9K3l7CQGiNhVig3D3TM5HGQufw22GlcZpaG/+BPM8gbGFG?=
 =?us-ascii?Q?IGm0VLW9z7WVjuJtN3F7xcq1z7bC8hx03ojOOCaHJx2eN1OyWITvUHJF92e2?=
 =?us-ascii?Q?OGdg3l38H9K5t44KK/pjUz8oSD/2v0PLgcpNHa1OjjNGEf6fqvyoELyHjdoI?=
 =?us-ascii?Q?dOlsyyp02s7iMXjnLIKJRfIonr1O0Lkjie2ZmVxQubbcyvjvzRZ+KOq2UkVT?=
 =?us-ascii?Q?Y0RdQzSIiR2xIL3Ke63zwj2kSAS3Q2v1SkPC4E/ciIuB53l0hsYVqlvDb/N2?=
 =?us-ascii?Q?tvQS+Y7NmiEDBML3EbIvLpYejXEIWqAtSQAY9QnfKFzyUB/SEAuViUOP3Kaa?=
 =?us-ascii?Q?rZvFDv3QFEUtRKsnZ6Qvd8NTNyf2T98CKHx5/8VPJSwmZB/LOG28BA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8319.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qJrOxUX4UT/drBrsUumTFKN9YHxz0wrfXP33SonwSOv3Ss+DfRN8hqNwU53z?=
 =?us-ascii?Q?u36QWghhdfaP9wFPrC9gmaUyy0eyD4u/HpbkpBStjAh38+5Kt1YZh/U1DhHY?=
 =?us-ascii?Q?lL5AqGROK4PcL8nO2hcoXpK/rnz0WH4Bq1VywrdUHQVDgyFGjm02nkO9mId6?=
 =?us-ascii?Q?7WqzkBfEpAJBx4Ehh40b+fe3I96pmMKytDviEQ0cC6UMv02mbZ4HP0JitUrR?=
 =?us-ascii?Q?f2Rk8Z7Tz6A1o59Uj0xEFqL+8tFhL5QD3Hp5lANUkMOFzf+aieeiKgIRiuPg?=
 =?us-ascii?Q?yJ9ydYuHkbxwMcJYUTx4hSvZxZcZd4AV+rSFQaEFfmjNoUJAujuM4rsSXZUO?=
 =?us-ascii?Q?FCRV8SGHpdKA6NJs0vRF9m6VczNFYaNBv3QzCKovOr/XjPbwqm2l3GVHD6l1?=
 =?us-ascii?Q?1bojtEl+68Rzpy3I+vws8oJLpfC7HQ/IYUxcNA40dqxoZJUfJQWYcv7rR1XF?=
 =?us-ascii?Q?K9xJed+8VTxanPWlDEXqAIGFzLCmvBM6U+cPHeuEfg4DFdoq4T0SAZTQrhn2?=
 =?us-ascii?Q?nT5omN2VJj1ngsocrO1H/UGSaLM2cfYHAb1dv1dD9GH9Q8Iho0BtqB9BVCfa?=
 =?us-ascii?Q?bbSSJ3ar9yliZl5Yfs1mKec0+4BSt9nOSbEhZdtDSV2As+61DPemy3etYtRH?=
 =?us-ascii?Q?ankg1scbsC7RttOudaexppMjQhJG1aLVCmwWHtLhNZlgBxTdi0wFd6BZWwQB?=
 =?us-ascii?Q?7wxfFWYi7bFYh3ZVxP5lHfUe4xJ9MDgOf5Yb28BXbej3l3iuswJ2j5RU8HEw?=
 =?us-ascii?Q?S/aN3qSzhBbgPb6mhnjpGfiQoFc2cnWlf7rfxe1xckUCo+lGKbT3eZkPtSNA?=
 =?us-ascii?Q?033ApZ7atHR9sDzdpXnUjjKrrCq+tED/xXCfESDGA3dBAGv2pQLpAbgpk/Ve?=
 =?us-ascii?Q?OOdLypGO6LJKxMfAQT54QSOnatmFEaftz3atD5mnqEeUj5JsbHNUitAw2KWW?=
 =?us-ascii?Q?BRTFr51MKW6ClRZWjYtfQN4Ks5upxoDwMLerg5rjL3NljOLFEfZ2euvIG7XC?=
 =?us-ascii?Q?kkD1fwKMlxIBpsib5bNwB40yaM+08fnRry8w4hJxoxCCgUZjRWvtdBM21rsN?=
 =?us-ascii?Q?BT4mN0mzAYP5NPcVNlhGaYesdyCDkqOeWP5YY1MrtlXykG9mwzs5ZakGTWzK?=
 =?us-ascii?Q?+wc9XHWmps1sxj6P4dLPPrXqXksYdTzeA5pN9Y55w2rBF2QI6WjTBwOjsPr8?=
 =?us-ascii?Q?+Cp/AZIK3LF3ScFmlvsvJAbO/KkNn3fItZj3/z2anFORetvQnDv8K796sJYe?=
 =?us-ascii?Q?LuTaHcOAJKFuYxLTdjsROsEw3r/P0yEaMu+Prz7eiVkqBbYta1u4TLoMXHZf?=
 =?us-ascii?Q?iHFXlBJaxpGbH+84NHCD9lo+1cevWkzsJQ8Z0NaHj8da+fEEuwmMWcncuEV6?=
 =?us-ascii?Q?BfP+8CahJgC6XCeh8s2cRHgDIzK+r4DrC4yCsRfcihHvtJ74Y7UMAH0igKqC?=
 =?us-ascii?Q?TqbNHmgRIJmVQgW3KTdnVwrUL3pFSl1z6Fid3X2KX/gvWQbRayrPQLMyaqwF?=
 =?us-ascii?Q?E1xLbH5ouwkUFsHwuAlKGBHo1HseYxNMh5kLv3sBDiNxZjY/rIr04ZBiTPPz?=
 =?us-ascii?Q?SnGj4qmBNRxcEnanO7onTu6AS9K4pKgPqhldPLgw?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8319.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e1b19a7-88d3-4f0c-bbea-08dda35e8f8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2025 11:54:28.7029 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WFks0g8Uod6970pX1e0AfvgDMwdoky4e4TI6+sNIKoxv91YGTzdQ03Wl/8fg09b+49uokEh5gABFLSEq2/NF4E/eHLDQOlbql3bEnYW9nHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9894
X-Mailman-Approved-At: Thu, 05 Jun 2025 08:29:58 +0000
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

Hi Hugo,

I'm fine with the code, but maybe it should go in a different location.

Since it's a register setup, it should probably go in rzg2l_mipi_dsi_startu=
p() with the others.

Additionally, since it is required to make rzg2l_mipi_dsi_host_transfer() o=
perate properly, my suggestion
is to add this to your previous patch instead of making it separate.
Otherwise, it's like you are submitting one patch with a known bug, then im=
mediately fixing it with a second patch.

This also would prevent the merge conflict with my patch that also modifies=
 rzg2l_mipi_dsi_atomic_enable().

Chris


-----Original Message-----
From: Hugo Villeneuve <hugo@hugovil.com>=20
Sent: Thursday, May 22, 2025 10:39 AM
To: Biju Das <biju.das.jz@bp.renesas.com>; maarten.lankhorst@linux.intel.co=
m; mripard@kernel.org; tzimmermann@suse.de; airlied@gmail.com; simona@ffwll=
.ch
Cc: dri-devel@lists.freedesktop.org; linux-renesas-soc@vger.kernel.org; lin=
ux-kernel@vger.kernel.org; hugo@hugovil.com; Hugo Villeneuve <hvilleneuve@d=
imonoff.com>; Chris Brandt <Chris.Brandt@renesas.com>
Subject: [PATCH v3 2/2] drm: renesas: rz-du: Set DCS maximum return packet =
size

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

The default value of 1 will result in long read commands payload not being =
saved to memory.

Fix by setting this value to the DMA buffer size.

Cc: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Chris Brandt <chris.brandt@renesas.com>
Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c      | 10 ++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/d=
rm/renesas/rz-du/rzg2l_mipi_dsi.c
index a048d473db00b..745aae63af9d8 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -549,6 +549,7 @@ static void rzg2l_mipi_dsi_atomic_enable(struct drm_bri=
dge *bridge,
 	const struct drm_display_mode *mode;
 	struct drm_connector *connector;
 	struct drm_crtc *crtc;
+	u32 value;
 	int ret;
=20
 	connector =3D drm_atomic_get_new_connector_for_encoder(state, bridge->enc=
oder); @@ -561,6 +562,15 @@ static void rzg2l_mipi_dsi_atomic_enable(struct=
 drm_bridge *bridge,
=20
 	rzg2l_mipi_dsi_set_display_timing(dsi, mode);
=20
+	/*
+	 * The default value of 1 will result in long read commands payload
+	 * not being saved to memory. Set to the DMA buffer size.
+	 */
+	value =3D rzg2l_mipi_dsi_link_read(dsi, DSISETR);
+	value &=3D ~DSISETR_MRPSZ;
+	value |=3D FIELD_PREP(DSISETR_MRPSZ, RZG2L_DCS_BUF_SIZE);
+	rzg2l_mipi_dsi_link_write(dsi, DSISETR, value);
+
 	ret =3D rzg2l_mipi_dsi_start_hs_clock(dsi);
 	if (ret < 0)
 		goto err_stop;
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h b/drivers/=
gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
index 0e432b04188d0..26d8a37ee6351 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
@@ -81,6 +81,10 @@
 #define RSTSR_SWRSTLP			(1 << 1)
 #define RSTSR_SWRSTHS			(1 << 0)
=20
+/* DSI Set Register */
+#define DSISETR				0x120
+#define DSISETR_MRPSZ			GENMASK(15, 0)
+
 /* Rx Result Save Slot 0 Register */
 #define RXRSS0R				0x240
 #define RXRSS0R_RXPKTDFAIL		BIT(28)
--
2.39.5

