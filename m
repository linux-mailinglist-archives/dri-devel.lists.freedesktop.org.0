Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C4A8C2B24
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 22:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00BA010E07E;
	Fri, 10 May 2024 20:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=purdue.edu header.i=@purdue.edu header.b="H5xh2okd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2095.outbound.protection.outlook.com [40.107.236.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C7210E0E7;
 Fri, 10 May 2024 19:37:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bn1+FDM9Meh0r2J+bYquz0E0kK/WkeRGh/rr0+xtGxDYTs12ETKqTTMssUxbXCGFKqpGIbAoRnKAF0uNF0wHAfQuq9anzsKrLZK8yT/IVJfY/1uVTUZMVQUwkeBsHZTdWi637Yt9SF9gp40nCx+dco7D9BO99UlFUGs+guW1HLZoPS2fXYmBe/YcHpaY/NhEraQh+inVb6qml8uq4rJku2bWtA0N0F7CaOoo9IlGAVsuhgY3wS1OGp7CBxkrZeHm3cBowCO3yTOOPGRo1OEiTjEf/vxWNu7/0Ne1uorK1WFLbThkTlFaTICosz+2mCzQZHyr4ONrDHXb7e0mAMTWwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GOrqD0IVD5FWy89xDIAitnyDLNwGmrI0eezJx6cMxUI=;
 b=fH1NUORn4hnFYPpw0GxPEQEagnoD22s4A/+dip1HZAho/Xb0DZvo8gEc7aMvtM8uIk5BiadkEBOp6h0u/pZIV7MdmxVh0aZErWTlpDhpEdVz58FU0ybFOA4w4HV524e3/KzXjgW50iSFJCruXE1D7rmgzx9uxJzjhyclvzISsEWOMksXyodUAL9Gr/BAQsrk6m4GNeDZ3EPS4tGnqrrV/xjIj3w+CL//eGfm5hUnZSLR44I3lIHrJfMbxKpmnI4TfIph0dPnxjg+KxAxENK679fTiSsvxLQaW5rNiO8I6uqmbOX0Q5ObZQpSNC/w2gnxb8DdNJ/c1ZDx1g9kmgb5Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=purdue.edu; dmarc=pass action=none header.from=purdue.edu;
 dkim=pass header.d=purdue.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=purdue.edu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOrqD0IVD5FWy89xDIAitnyDLNwGmrI0eezJx6cMxUI=;
 b=H5xh2okdgnZldY0lX65TdWpyQubD2fiPlsmGayPz9WPAXviepdBm+85ZFG/wkYvcns7PN41JaJnFO7uojv2fzhuOUJsDg0PxwNwlOWb7ap5E2TLDQDDqYA8AGzpBk7AE9HiOzwtSxIOWFPhHj4vlDXwbQVQ2h6zgLQEYt0LPVcs=
Received: from SA1PR22MB5493.namprd22.prod.outlook.com (2603:10b6:806:3dc::14)
 by MN0PR22MB5544.namprd22.prod.outlook.com (2603:10b6:208:4cb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.49; Fri, 10 May
 2024 19:37:43 +0000
Received: from SA1PR22MB5493.namprd22.prod.outlook.com
 ([fe80::a308:2ed6:d751:9a0c]) by SA1PR22MB5493.namprd22.prod.outlook.com
 ([fe80::a308:2ed6:d751:9a0c%3]) with mapi id 15.20.7544.048; Fri, 10 May 2024
 19:37:42 +0000
From: Jiasheng Jiang <jian1000@purdue.edu>
To: "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>, "tursulin@ursulin.net"
 <tursulin@ursulin.net>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "chris@chris-wilson.co.uk"
 <chris@chris-wilson.co.uk>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/i915: Correct error handler 
Thread-Topic: [PATCH] drm/i915: Correct error handler 
Thread-Index: AQHaoxETCk8DC9ozWUiFWKd1h6T+Yg==
Date: Fri, 10 May 2024 19:37:42 +0000
Message-ID: <SA1PR22MB54936E5DBE266CFFD42C001EAEE72@SA1PR22MB5493.namprd22.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=purdue.edu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR22MB5493:EE_|MN0PR22MB5544:EE_
x-ms-office365-filtering-correlation-id: a2da9241-82ba-4c39-416b-08dc7128a89c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|376005|366007|1800799015|7416005|38070700009; 
x-microsoft-antispam-message-info: =?us-ascii?Q?51BS3vT4gtTc4f8jeVpD/YsFV4KemIKJVcau7owoeVyll7kBgIUTjEuGGh1j?=
 =?us-ascii?Q?/N9pzFA3t5BkTQ44EugEQlwnvCTqhyfu9kY4Nwp+Fb48NQ3bS71ADfj88AeD?=
 =?us-ascii?Q?sJkny26ZQ7IpHzmFpYWxuGGsybsUgh5V0ec6GIZMzKS8j+cn00AO81hAxV85?=
 =?us-ascii?Q?rL3H+DvXJXm7jg1EEvlpTq6pBGU0E7NDhJDxTiPEuEBOEpxHJMz/fq4mkBbE?=
 =?us-ascii?Q?c5gmVMI+wW8Gnl3RXxjqR1Rod3qN+lreZadw6QAOkZKj0CYhCheOVk9yhxxF?=
 =?us-ascii?Q?BIYboJw8hMpQ7iAcwVG5Ds7FkoNnMUuALLJXtSaxU4hH15MQ8EPyPOGYsWAq?=
 =?us-ascii?Q?6p+tIeH0JtLdm3XI/O8NkHpaJu94oew/d/i3Ic14nnFD8OxBgV9LISLWkZIy?=
 =?us-ascii?Q?rReR1n4bgVWmJzNNFtmYlMpE+Zze/mUmdbfKNQy4z+cqvGkQRmTtt992Ku1A?=
 =?us-ascii?Q?rOhVff1lzgqpmO5cWeLhDpBF3xlN9Vanqn29noZ3IJvdMJVGdmTBnvsj5jH8?=
 =?us-ascii?Q?V927g66urimSotj2+CpkLXWSmW3FB9h8Gs+lOJngr9E9mHFEAZUq35jWp5/6?=
 =?us-ascii?Q?J9TG0IZutJiTi9T7cdVUipbhr4kjmtoSyc4BwQS03qI3ug9Yy5UnTAB8l3A2?=
 =?us-ascii?Q?4s+1/+QFtCadkpg7miAt1SaNauW7kM8s1jvHnapD9r7jcL9ydMLzAOzV0szI?=
 =?us-ascii?Q?Ierb35jB+35f/cp2Ur8ZOEjEfHp1ZdJhdvrIQfLT2KWxHYZ34Cd38br7qjl0?=
 =?us-ascii?Q?N0mTd29c/ok5XkaA2xDCKHlEYAnztG2xWR5ZnbiwhFQKNYLS1d2uSjjSGVPV?=
 =?us-ascii?Q?y78XS7UabDi9EHmg/lvSiQAkrYChhQVvTGq2iZJik7lu4J+yG+mVTqdLLq8y?=
 =?us-ascii?Q?vqXbMWzx7pXexduUGl7G7HKtsh8QuwWZA4RBqE7hItExCBOUvuyNpGV1Apld?=
 =?us-ascii?Q?AgzboOZUBfFYC/SoacZe4TaYQiZd52EeOEe6/C/5ltLJ15yoJXBLINXsh9W2?=
 =?us-ascii?Q?iGPUq5e8J+rZJkV1ueNl4BzbuHlVp9VD6n8Zw11F5OxQ4mAZBW2+eRmFLotL?=
 =?us-ascii?Q?FT9ZR1Wvx1IBCbGs5Gs/EPfFMUrnz//jPRRzKulMNo7VP2Q13l7BzRoOUeUA?=
 =?us-ascii?Q?FiMG4jkIefxN6gct2E6/MzvwtmkPQ1sAP8yQu0KIQs8tVcY/H09PKpq1E/c2?=
 =?us-ascii?Q?DOwIws9qydbAuR+hLluNOj1V3QlQKPVevR3yZeyMu8y6q08qqArY+xJ1z4q7?=
 =?us-ascii?Q?QZyjn4jme7DtrAQIYPpFQZWgCEY1AEtlPhrvYMPejXyS8IYvK8UsVg2/TQyM?=
 =?us-ascii?Q?FiPCZMJ0HVLsIrZw7jhd5A/EjjGtX8jWLquXQ6JnIWrIOg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR22MB5493.namprd22.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(7416005)(38070700009); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IQx7FTw8cQrKsDhzHtjU3nQBakLtE3zohudBX9Mg68uBoQ8f/CCvoF9SOD2j?=
 =?us-ascii?Q?FAVbZSCmlIgaVX+t5GLvLmZO+ZNOlNWdCE+HKAmCkEyZvPOF6brjcpKbdQz5?=
 =?us-ascii?Q?GWPmNyPoYFz3P118m3mm4bUp/Kc+QJTC/NSk+roF0D85CEvdSx36ufiu23d5?=
 =?us-ascii?Q?4nqopUMb+tXlgkYLr2GhFrdhNH7posl6ZuT4gAA9WLJcevx55rn7rClGW4Vh?=
 =?us-ascii?Q?2WxNO1djMyjUOplFQS6aGXxkXyW+uA5XV22jrumycWIHQEm+4a1cPaVhup2N?=
 =?us-ascii?Q?o7jJUocMK+Wth/j1TMOXB85eD/MIBPFg6bfVvwCFJxOmFL1Xr5vpPgL5Y4i7?=
 =?us-ascii?Q?LjX8HI/OFARYCmSnUmp8xSQETlUXx1D7Wltb4RU1PkLaJIKhvPi78bcCyij4?=
 =?us-ascii?Q?Av7brusiq8YAA18B2A/2t+kkYbl6KiCo7Xj92xY3ai3sr+VeqnaFZepudbxv?=
 =?us-ascii?Q?AEFPtHD7qesQ++Cx94AinUsPqSck0hefV+/PODlzdfjYtsZYH4H+aLm2Gwl6?=
 =?us-ascii?Q?P5F2jVGrAP+F253GB7n/XvyQhQ5KZO8j8KZuIgY9nvoUJcgqvUxY7VL5ZsVN?=
 =?us-ascii?Q?jqekbxfhwnKHV5a0c4uq7HWOcoGfdMGfAeVXss8rjt641fvafaQuDjyPk0g/?=
 =?us-ascii?Q?3U0NqZMYbHLge+eqNrcWkkwpmvLc8gf8gzbMJ2Z3cFxgDcVFffNsXrmskA8B?=
 =?us-ascii?Q?x9OfszT1BjfTTkNCs68yAb0XwlCD4ln2OpxJZrJNGUKGF59yIazM5Bhcg+wn?=
 =?us-ascii?Q?0AwDtaL441BfURYdwFGMbp54XP4KJGUP3sknT43d6ReP4uv2OxtPkCtbFgNQ?=
 =?us-ascii?Q?+djiUaJdeJQIqqn67nzTXekcwUXrbduBul/SMDOaFiRvR8+ncv4lhBrm/OcK?=
 =?us-ascii?Q?G+Wz6dDM0g6DrStaGYwDeC0q/xHxV7j/dGHnJkV1Ks39Nv/7hWXz24tAgFxZ?=
 =?us-ascii?Q?zAX4KLln6AnDNA+Z9P+zrAorb/fkR5jvyh7667Z/a5K1faJtf3etVaala9Mm?=
 =?us-ascii?Q?2IkjO9b54rrC0Dn96RpCRSUY19mGSyCeAyAJiDs7+NVaRYmJN78ZIDE0eGfo?=
 =?us-ascii?Q?8/lOrBgruguQel27vb9b9+HsLMdMWWDdBhUr6nQAJPSAYUJoiFf/jO14OjAv?=
 =?us-ascii?Q?H3nn2cMrsJbM2bs0dxivzpDEsREm6kfwgb5UXoAFRYZbQ10XRcPsU5s+mt/r?=
 =?us-ascii?Q?i6JIUNC+J9vbmAqoGV11RWR75AyHUEITQtTF4RWWo5OmoJgTcVGakvpH7tT+?=
 =?us-ascii?Q?wf2Qczbhr0wROEGCnKVMQFQNmC5e0KrxJLZYcxOuhf0FmHEs8ilIz/+GqsdK?=
 =?us-ascii?Q?nenLwrvowV2lsNK/PCOrOYfRq/lYPZ/SadK9rzGpmlPUzbWhpoCKTPpnazNA?=
 =?us-ascii?Q?8oDynI/ik4OncBqDF1WL9CSgYkHkz0JUfKm5N86vLm/L3Ixthqyd9++vRMvm?=
 =?us-ascii?Q?g8cu29mZqLi66+8pTrQSuo0/O2uor0LuLaLcXXKSW092IUTjCEdKaopA+Yrn?=
 =?us-ascii?Q?Xd4rVVH4+XXjCfBepMKvikQD56ugGWPhFwrfLNA+NwlD59Mby3ULnXiEUfaZ?=
 =?us-ascii?Q?ssYhdekX1Z/qbKvNkOOMvGEc6n09oQ9TYXbR53qu9BTmF7EkvRcwHrBJhkff?=
 =?us-ascii?Q?TA=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SA1PR22MB54936E5DBE266CFFD42C001EAEE72SA1PR22MB5493namp_"
MIME-Version: 1.0
X-OriginatorOrg: purdue.edu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR22MB5493.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2da9241-82ba-4c39-416b-08dc7128a89c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2024 19:37:42.0935 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4130bd39-7c53-419c-b1e5-8758d6d63f21
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NI7+V1iSG+Xhn8EtY5sZc6sDQQwbInII8xpgdnZ1wMHRutQx7bNHR12Xerd50RXfzmoYSBL0aMvspPz7F38MHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR22MB5544
X-Mailman-Approved-At: Fri, 10 May 2024 20:26:01 +0000
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

--_000_SA1PR22MB54936E5DBE266CFFD42C001EAEE72SA1PR22MB5493namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Replace "slab_priorities" with "slab_dependencies" in the error handler
to avoid memory leak.

Fixes: 32eb6bcfdda9 ("drm/i915: Make request allocation caches global")
Signed-off-by: Jiasheng Jiang <jiasheng@purdue.edu>
---
drivers/gpu/drm/i915/i915_scheduler.c | 2 +-
1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_scheduler.c b/drivers/gpu/drm/i915/i=
915_scheduler.c
index 762127dd56c5..70a854557e6e 100644
--- a/drivers/gpu/drm/i915/i915_scheduler.c
+++ b/drivers/gpu/drm/i915/i915_scheduler.c
@@ -506,6 +506,6 @@ int __init i915_scheduler_module_init(void)
               return 0;
 err_priorities:
-              kmem_cache_destroy(slab_priorities);
+              kmem_cache_destroy(slab_dependencies);
               return -ENOMEM;
}
--
2.25.1


--_000_SA1PR22MB54936E5DBE266CFFD42C001EAEE72SA1PR22MB5493namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Aptos;
	panose-1:2 11 0 4 2 2 2 2 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt">Replace &quot;slab_=
priorities&quot; with &quot;slab_dependencies&quot; in the error handler<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt">to avoid memory lea=
k.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt">Fixes: 32eb6bcfdda9=
 (&quot;drm/i915: Make request allocation caches global&quot;)<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt">Signed-off-by: Jias=
heng Jiang &lt;jiasheng@purdue.edu&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt">---<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt">drivers/gpu/drm/i91=
5/i915_scheduler.c | 2 +-<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt">1 file changed, 1 i=
nsertion(+), 1 deletion(-)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt">diff --git a/driver=
s/gpu/drm/i915/i915_scheduler.c b/drivers/gpu/drm/i915/i915_scheduler.c<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt">index 762127dd56c5.=
.70a854557e6e 100644<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt">--- a/drivers/gpu/d=
rm/i915/i915_scheduler.c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt">+++ b/drivers/gpu/d=
rm/i915/i915_scheduler.c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt">@@ -506,6 +506,6 @@=
 int __init i915_scheduler_module_init(void)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt"><o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt">&nbsp;err_prioritie=
s:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt">-&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kmem_cache_des=
troy(slab_priorities);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt">+&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kmem_cache_des=
troy(slab_dependencies);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -E=
NOMEM;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt">}<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt">-- <o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt">2.25.1<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt"><o:p>&nbsp;</o:p></=
span></p>
</div>
</body>
</html>

--_000_SA1PR22MB54936E5DBE266CFFD42C001EAEE72SA1PR22MB5493namp_--
