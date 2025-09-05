Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFE3B45834
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 14:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9164C10EB9B;
	Fri,  5 Sep 2025 12:52:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LiRyhKSD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2062.outbound.protection.outlook.com [40.107.102.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89CE210E106;
 Fri,  5 Sep 2025 12:52:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jW3NyO8MbF8KTuA8EQNRzbqUN6S4EbgZOdNAWwp5pye+4IXD/XAClQ3Q3Ug4O1i3mmBMeBBfrBKmO6TRQ1tIv5p9v6hgV6wotrU0AQ7NlKJ6XMJ+55Hvrcogm8FggkLyvQMerqlUbILSm+EU+uqDP8DGTJiUtNJ7TXRFTYcf0PrcJuvhGy+znug+hQDpnR1F0ckjQsz1ZUvBHH1geayffJYkjB6FtLLBS37FS91jwnLVyjkSaFDydO12svOxzBoxFe5u65emGo8DY3jOyMt1a4Mp+Jxi74UIpLZrTuQaWJ/vLvt80n90rc2UxE9vJ1Vbdg5b1rq2MRSiPGKMfQ3cVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yhxJpOU9qAzxzOobqSyZ76LgSAHy3Zrrlr9kweZUyjE=;
 b=k1N1Fwa56x7Tety+B8LghhkraS6vWaQhJ2zMYGiT+PfFvWpr9a2P7u44+8aFCWHlzVJ6cerEARLazjLGeoaICgcEfEryR9tm4dVB5MvdhpVmIRYn24Wk2Tqef2x6kDdwS6vsrz+MQC862ALU0nN3QZmsc0evVkdUTewWz1m47+/Xs+u+vE3BdJyo8PfNAaIEwVL9Z+gI8CAKo+ml0o2UR9SYLLlQCMv8isMRLMYc6JmbmwMOoP1FE939Mx2mWObrPmf06xX9/5fYYucdtKF88Zn3RbGmFX/PjRYGTMGfIdeQTCyFLZDlKagVG7Yq4JmrBEKyCYNMDkMsoH9MtAXbUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yhxJpOU9qAzxzOobqSyZ76LgSAHy3Zrrlr9kweZUyjE=;
 b=LiRyhKSDvDCa0V+am8A0DJm57v/Rz9P1pdYqPi7ljl5eqrmG66Z+FMRhcCAJ3WSZTgQDCI7kOW39aVrh6hDtM2T7Ql0tVGmktyFZqh1fnyJqAzAgS28HeGSthbXjOExHahdG0y7kas/Bp8flDBd0uhwf4hbkXLZ5OoxBveiHJdQ=
Received: from SA1PR12MB8144.namprd12.prod.outlook.com (2603:10b6:806:337::15)
 by DS7PR12MB6360.namprd12.prod.outlook.com (2603:10b6:8:93::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Fri, 5 Sep
 2025 12:52:39 +0000
Received: from SA1PR12MB8144.namprd12.prod.outlook.com
 ([fe80::fb96:ddab:e63d:a523]) by SA1PR12MB8144.namprd12.prod.outlook.com
 ([fe80::fb96:ddab:e63d:a523%4]) with mapi id 15.20.9073.026; Fri, 5 Sep 2025
 12:52:38 +0000
From: "Francis, David" <David.Francis@amd.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Arvind Yadav <Arvind.Yadav@amd.com>, "Sharma, Shashank"
 <Shashank.Sharma@amd.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH next] drm/amdgpu: Fix error codes if copy_to_user() fails
Thread-Topic: [PATCH next] drm/amdgpu: Fix error codes if copy_to_user() fails
Thread-Index: AQHcHc361Y235ORiHEiR12qTqjp4SLSEjA0y
Date: Fri, 5 Sep 2025 12:52:38 +0000
Message-ID: <SA1PR12MB814473BD381D10C842F30422EF03A@SA1PR12MB8144.namprd12.prod.outlook.com>
References: <aLnhaU9cLeAdim7J@stanley.mountain>
In-Reply-To: <aLnhaU9cLeAdim7J@stanley.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-09-05T12:52:38.564Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=1;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB8144:EE_|DS7PR12MB6360:EE_
x-ms-office365-filtering-correlation-id: 8b811822-b19c-4884-f1e8-08ddec7b1847
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|8096899003|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?LhrH20DRYj1EtJg/wQWbw25gWCYiOA+ftr5gWSaiByyj3jt0Cu0NK9N2n+zs?=
 =?us-ascii?Q?TiF5MvYQpiIuG7gmtvjaugunoTwAymNVxpTqlnOtuuAT5opH6U82HcD3mxXy?=
 =?us-ascii?Q?PjosKhy4CUoU+prr1LuaLO49sxbGnCKLqfOo0NYiMQvxXvdGREANsObtXVPA?=
 =?us-ascii?Q?dQJ42JK/hXI44H2Scj/sIUyofTkhN8WOy8Um0QFXyyy9bNStpoASrRImDIS4?=
 =?us-ascii?Q?BT1Y7el3kE1nQdjh1YZRm+5VByFwcL/dRmc8nf+sx7DzwHE8TxtasfZ8IE+v?=
 =?us-ascii?Q?9LzkTsZ6WFWGzkbnEEsS5nukzaxFuWXtSgo5AGsRCLEGKdSEMgS5jFMMXdE3?=
 =?us-ascii?Q?brRgMnGfBlTL85Wfx06XASXQvGarRtdo6Z1nqKmmC94Fb650PRsqd+/T1NWc?=
 =?us-ascii?Q?W6r3xwFCikLkH83yVmj5XLMB3XIZBVEGMYIgsZO+i11bs2UZGC/ojR01aUUL?=
 =?us-ascii?Q?U1yozg3R4K0vdLG8IqGa+GCzzcNEHg03CHvjXJRskGTaMPGBesB0TCtNS3AR?=
 =?us-ascii?Q?cJEwna05Ey9t+hEA/Gfpfal5EE6oMymJ6dc2PzyYz9UwYnhKcCnlJoTgJTgG?=
 =?us-ascii?Q?NRo6xeGsWxOWFpsWDCStyLXGbguVvDevdMlDQobR+E24OxnqkAFGw0AoC0Zg?=
 =?us-ascii?Q?7C56Xa7sB9P3/PkHk/ApQcVynAJVirvYSiNvSnOx1P0W2hS8DoylN3nnyVL2?=
 =?us-ascii?Q?2T+h8Rxt4BEB8e/ff3ZYAb2nc2238Bqvt8gM343m6Uch6pMinxzpiKiIpFY9?=
 =?us-ascii?Q?rUpx+EHfvIACSaxXuvYAwY2RqyONLc4E572QFts9KNI7ObsnRwe9wASh8alu?=
 =?us-ascii?Q?cYXxDsDWWyfGeD0rVXkSTXFnnWJzTB+GbJqLPDmGqHacLBMUynuj0dw6r7q+?=
 =?us-ascii?Q?BZrqX6Ar50lnlSMYT+pI/CO+Pdj75TfX9BEJi4jd6elC8uNfWW3ojm95Dn1M?=
 =?us-ascii?Q?Vg4UGl2j6vi5UuVLmYLV0f2AH8X7Xpg6XP5LB3imH15XjbGO7tZ5cnSj7dEA?=
 =?us-ascii?Q?hJwbyLoQMCMPK4FzGruphigKM9OVbxQeOezQGA/PPmVpMG87AxJGpEn66e1S?=
 =?us-ascii?Q?xEDXV2l0AIi/Sz1MzPBWZtMMVljMKbMnb908+LuPZz5DlqzinqVbMjNK6mj6?=
 =?us-ascii?Q?IuBslT5SQJkfq7Rl+QP8GWop56FbFoCsT+HImsjbIDTE7z04XSVSB5xdvHik?=
 =?us-ascii?Q?skmLgPww0viwdxLbLr4BT8eAVf79lYFxzF3LgGVtoza5+l1xl+FIngQUKSGe?=
 =?us-ascii?Q?pi2hlY5IrK1LX8DkiwcrkAhMuBjl/J6xfp8AqPCUoY7XNgxyELzD8wezLpmK?=
 =?us-ascii?Q?ahng2aC3SZJDQp9X7y+DYSEmWr9W0tnUvnZbmtBdwrIvnhLmIFn8iyENSRD8?=
 =?us-ascii?Q?SEDN8UxlNhvjflnePwF2IrXhDIhoL1WfCNeoN2yFyKtFOJEfaSdSec6Gj2pG?=
 =?us-ascii?Q?eAE14swpzOEh28b+vi5H0U25HtsT1tBWbkyRCG4vJLTof4MqUeP45Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB8144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(8096899003)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Q+FR0DHj4CQkEybBmg0bESaBbfQXVa1u9hrTxukvFHecKfk1mtGAeLjIEZ+n?=
 =?us-ascii?Q?JpeNzUKzDm5GQFatuIb4dZRUGUy2vfQ+Hk7+sNaDA8oTo/ybw6uShYgnpUKN?=
 =?us-ascii?Q?TaTTZvHzGdMjZjznn8Vh8Yj1KNfUqXopxHPLUFYYiLV7Fx8fcf0QciZ8qRC3?=
 =?us-ascii?Q?2Tmd/Ma63ExPNO/gVAbEWXxrpxSdZiuB/mcF/n/IX+a2UjWQWI1RcO3ur5y6?=
 =?us-ascii?Q?XMmvoPpC9bTLdlpcIl6GsACzEVrssWTS/+L5+piQvF6qnA0PXuRRb9+I7olh?=
 =?us-ascii?Q?6nxlG7kCs+maD+dBKPw3pc6X6azvgF7q5bl+deBvm/dM6IvKp9unZ8VUkRiX?=
 =?us-ascii?Q?WGP39tg0Gmu5UvXZ7idf5FGcr/asNLZnr+Y85/Z6VnQTuUvFmUkVMie96elz?=
 =?us-ascii?Q?UN9RBemHXVoANUs9W8vljQQXY1fwqIrUV9xreBuYGl6g6M/U0HmoOxzk9ONO?=
 =?us-ascii?Q?k/J+DENN0CoRCJT8EQZ8ozMH1aOWIJsZcnz1U14wk8JBZJM7imSVN/pVcWPE?=
 =?us-ascii?Q?NbL6zGhqcW9UCVmgOWZrmILyPlBoqdY+S8wU374PhJXD9eYDC22+DZwxRtZs?=
 =?us-ascii?Q?Pp4gymUhU0LNavdVMOroWQztC5qzZXezkSkEkA1rmGlZMQCCKFPqvB0lnA+u?=
 =?us-ascii?Q?ONk85VVW6fxLufxD5ol1+XKJmWLaz/6+isu5Rm0EPQXq3kZKcn5ZhEqsI49S?=
 =?us-ascii?Q?Z5/8/SKhQbDI6gUjYs2JVaEGHJvc8GBC/xriH5+Vj9V52umbu2pDb46Vi3p7?=
 =?us-ascii?Q?aD7Epvd918C9X90t/tolkS0s9mvvktGuw65VIQUB+X5NJcZzmvpIdlZC+h26?=
 =?us-ascii?Q?GyZJVSZgEPfaO25ljBn3E4gR/9IrAPx0SkgTNRpC26qMzO/pL1MIxrXJE9xU?=
 =?us-ascii?Q?ozgCQ2maiGzkKic5QLZnvvd1c4xACJ7JO7M9bohBQN4ZfMihXr6XxpRQESrh?=
 =?us-ascii?Q?cjdWz8SKjRQ69pW2pEhl9QPYEvtfk7UTMeo2GQsLH3XnDvxXmWefzZgrRA0i?=
 =?us-ascii?Q?zhqXvf6SzybDm3UQrr39s9s0kTNKr18LJce1O5MvrMUKc14+ORFBU+zEpkd+?=
 =?us-ascii?Q?zV5baJZ57aoYbfNyi85ZVluRljIxuSgHimU35qvsnTPJMP10/0BbFmUL0XHb?=
 =?us-ascii?Q?FjhEhes+Gs5YTXLsmNZvCW/0hGtSzVdvvFMYKZct912ac23v6YylSuFtEQ44?=
 =?us-ascii?Q?qcGlat5mM96y2gXaS62IEk4frrRXlM9fK45tTunaZMj/rV7o5sZLb0wsZpCE?=
 =?us-ascii?Q?zhlLZ+stQRzexhdX87CWVgKVqoFUC9iRXqieodvqWLFYtTkcdOmtPch8juC0?=
 =?us-ascii?Q?H1GteVyzM5FDpxsX9WjepuIXRJDXURJNLp5wgC+3aWa1z3F5TINL8wpxLx1G?=
 =?us-ascii?Q?X6HdY+HcJ7fv2Tk90GJzq/RK+/CO4Rg0LhGnl5XY7iOQZdMxbW29iKiPKH4v?=
 =?us-ascii?Q?9qC0l6BOf27eQhQXnq3ZXL7bLpBNH4FrVQwWx+mMAN9V2ha3DrdLTtONkgZf?=
 =?us-ascii?Q?O7A5kNnnxX+pmrApQZfVt36ogl2u00RvWHVgGhhkmvNt2XMNZ/EGxCSsMjGN?=
 =?us-ascii?Q?7DtKMjWtl+0zPNvuVAU=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SA1PR12MB814473BD381D10C842F30422EF03ASA1PR12MB8144namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB8144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b811822-b19c-4884-f1e8-08ddec7b1847
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2025 12:52:38.8497 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B5oD79tvHrQLhyMr4onKOfHxVFLsgKRZf/I9d2UoxPOF1VjzvKoIvO/I1LwOWrZ+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6360
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

--_000_SA1PR12MB814473BD381D10C842F30422EF03ASA1PR12MB8144namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - AMD Internal Distribution Only]

Whoops. Yep, story checks out.

This is
Reviewed-By: David Francis <David.Francis@amd.com>
________________________________
From: Dan Carpenter <dan.carpenter@linaro.org>
Sent: Thursday, September 4, 2025 2:58 PM
To: Francis, David <David.Francis@amd.com>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Chri=
stian.Koenig@amd.com>; David Airlie <airlied@gmail.com>; Simona Vetter <sim=
ona@ffwll.ch>; Arvind Yadav <Arvind.Yadav@amd.com>; Sharma, Shashank <Shash=
ank.Sharma@amd.com>; Thomas Zimmermann <tzimmermann@suse.de>; amd-gfx@lists=
.freedesktop.org <amd-gfx@lists.freedesktop.org>; dri-devel@lists.freedeskt=
op.org <dri-devel@lists.freedesktop.org>; linux-kernel@vger.kernel.org <lin=
ux-kernel@vger.kernel.org>; kernel-janitors@vger.kernel.org <kernel-janitor=
s@vger.kernel.org>
Subject: [PATCH next] drm/amdgpu: Fix error codes if copy_to_user() fails

The copy_to_user() function returns the number of bytes that it wasn't
able to copy, but we should return -EFAULT to the user.

Fixes: 4d82724f7f2b ("drm/amdgpu: Add mapping info option for GEM_OP ioctl"=
)
Fixes: f9db1fc52ceb ("drm/amdgpu: Add ioctl to get all gem handles for a pr=
ocess")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_gem.c
index 63eb75a579ce..2b58bc805374 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -1067,7 +1067,8 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev, void =
*data,
                 drm_exec_fini(&exec);

                 if (num_mappings > 0 && num_mappings <=3D args->num_entrie=
s)
-                       r =3D copy_to_user(u64_to_user_ptr(args->value), vm=
_entries, num_mappings * sizeof(*vm_entries));
+                       if (copy_to_user(u64_to_user_ptr(args->value), vm_e=
ntries, num_mappings * sizeof(*vm_entries)))
+                               r =3D -EFAULT;

                 args->num_entries =3D num_mappings;

@@ -1159,7 +1160,8 @@ int amdgpu_gem_list_handles_ioctl(struct drm_device *=
dev, void *data,
         args->num_entries =3D bo_index;

         if (!ret)
-               ret =3D copy_to_user(u64_to_user_ptr(args->entries), bo_ent=
ries, num_bos * sizeof(*bo_entries));
+               if (copy_to_user(u64_to_user_ptr(args->entries), bo_entries=
, num_bos * sizeof(*bo_entries)))
+                       ret =3D -EFAULT;

         kvfree(bo_entries);

--
2.47.2


--_000_SA1PR12MB814473BD381D10C842F30422EF03ASA1PR12MB8144namp_
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
<div class=3D"elementToProof" style=3D"text-align: left; margin-left: 5pt; =
font-family: Calibri; font-size: 10pt; color: rgb(0, 0, 255);">
[AMD Official Use Only - AMD Internal Distribution Only]</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Whoops. Yep, story checks out.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
This is<br>
Reviewed-By: David Francis &lt;David.Francis@amd.com&gt;</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Dan Carpenter &lt;dan=
.carpenter@linaro.org&gt;<br>
<b>Sent:</b> Thursday, September 4, 2025 2:58 PM<br>
<b>To:</b> Francis, David &lt;David.Francis@amd.com&gt;<br>
<b>Cc:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Koenig, Ch=
ristian &lt;Christian.Koenig@amd.com&gt;; David Airlie &lt;airlied@gmail.co=
m&gt;; Simona Vetter &lt;simona@ffwll.ch&gt;; Arvind Yadav &lt;Arvind.Yadav=
@amd.com&gt;; Sharma, Shashank &lt;Shashank.Sharma@amd.com&gt;; Thomas
 Zimmermann &lt;tzimmermann@suse.de&gt;; amd-gfx@lists.freedesktop.org &lt;=
amd-gfx@lists.freedesktop.org&gt;; dri-devel@lists.freedesktop.org &lt;dri-=
devel@lists.freedesktop.org&gt;; linux-kernel@vger.kernel.org &lt;linux-ker=
nel@vger.kernel.org&gt;; kernel-janitors@vger.kernel.org
 &lt;kernel-janitors@vger.kernel.org&gt;<br>
<b>Subject:</b> [PATCH next] drm/amdgpu: Fix error codes if copy_to_user() =
fails</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">The copy_to_user() function returns the number of =
bytes that it wasn't<br>
able to copy, but we should return -EFAULT to the user.<br>
<br>
Fixes: 4d82724f7f2b (&quot;drm/amdgpu: Add mapping info option for GEM_OP i=
octl&quot;)<br>
Fixes: f9db1fc52ceb (&quot;drm/amdgpu: Add ioctl to get all gem handles for=
 a process&quot;)<br>
Signed-off-by: Dan Carpenter &lt;dan.carpenter@linaro.org&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 6 ++++--<br>
&nbsp;1 file changed, 4 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_gem.c<br>
index 63eb75a579ce..2b58bc805374 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c<br>
@@ -1067,7 +1067,8 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev, void =
*data,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; drm_exec_fini(&amp;exec);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (num_mappings &gt; 0 &amp;&amp; num_mappings &lt;=
=3D args-&gt;num_entries)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D copy_to_us=
er(u64_to_user_ptr(args-&gt;value), vm_entries, num_mappings * sizeof(*vm_e=
ntries));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (copy_to_user=
(u64_to_user_ptr(args-&gt;value), vm_entries, num_mappings * sizeof(*vm_ent=
ries)))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D -EFAULT;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; args-&gt;num_entries =3D num_mappings;<br>
&nbsp;<br>
@@ -1159,7 +1160,8 @@ int amdgpu_gem_list_handles_ioctl(struct drm_device *=
dev, void *data,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; args-&gt;num_entries =3D b=
o_index;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ret)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ret =3D copy_to_user(u64_to_user_ptr(args-&gt;entries), bo_entri=
es, num_bos * sizeof(*bo_entries));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (copy_to_user(u64_to_user_ptr(args-&gt;entries), bo_entries, =
num_bos * sizeof(*bo_entries)))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D -EFAULT;=
<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kvfree(bo_entries);<br>
&nbsp;<br>
-- <br>
2.47.2<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_SA1PR12MB814473BD381D10C842F30422EF03ASA1PR12MB8144namp_--
