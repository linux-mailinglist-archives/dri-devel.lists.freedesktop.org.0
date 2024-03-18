Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C399387E85B
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 12:18:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4CDE10EFB5;
	Mon, 18 Mar 2024 11:18:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=asem.it header.i=@asem.it header.b="EfVpeZjs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C03110EFB5
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 11:18:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bUUvgFZhILi7Tx7wROEWiIhgGkXUkMNnPMDYim11ZkZXhaIa4aRJ2/18oLmb+1EsYH5OhPcIGReCPVQZofvm6UNntGCDJHJ0s2yNg31Otpc84pMl3a15TuasfQQCGH49Imq3BEZXxiSi6X5dj+DAFCz13hTy06GL5YodhQQqBj4jTKhU+d9lUFsj/tn95+n/qeGK2s4p6F8ZXqzgPUBmex3Uj9GbhDHw1mPMgpYXkEc9olhBCmS3nyxgXm8ofXhjNmsBdBbP/9oaJqbNcHZ3uyGYFml5WQYVMnivfmktK6eAy9rUmQuAJpuMsiBzGMhBDRxO6XEcePhvVuRIxtyxVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Q7s2oeB8PjHAoDn6LW/FRIrE6Tm52EMITyyGLnEHXE=;
 b=hWKGZsoofDFe4QzBccGcI5mbleVrTerv/10pfKfAsuR+KpNKNH1V13immdm//b9s1BSGjpkVre80t1xSyUkXiR4bAPU7xHu5ra7QeG3E1QqoAASnKXiJk6KCxY83u05kffCJ35LJS8bGfKNAIgLtuMjrrqlQkv+nI50glZs6fPmiZUqMH/mLc/fLjAeLaPEhtd77Kiyr1xm+xvO+dslo/sNcNeyDZDgIz+VoWfC0X6hlZLj+hHBYJ1al5Beci4LmP6H1x2kl2eSQjFK7Gp/qUWeTheuGuy/whdVR3TeZs2OrqczwuoJGDAPlIZhHiEr3WBEeDOjl8zNa+L1BM9ZHyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asem.it; dmarc=pass action=none header.from=asem.it; dkim=pass
 header.d=asem.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Q7s2oeB8PjHAoDn6LW/FRIrE6Tm52EMITyyGLnEHXE=;
 b=EfVpeZjsQ+dxSQFgey8m5WIxNw4qUMw57mCgja6g/s9XF5et3qkzm+I4+N8/Yfa28EQk+jojRFUcL934RSLiNDXBSudPlYeMd7lak6rQFkBvXVMUgkzL8Co3EJPfpD06EHWI6C9p6LidZmtXueLkiRqwgKgO3JtQkGhrYJ6woGCGx+O3u+j9DpdXixmluC4udMzloNRGbn7CaefxMStoD7qu4HJiJm2KNed4lpD1vGlJusAeGEQWVihHebL3XNI7s4QKv6SS0ZKZ0XDa9XSY3CC1/RL9de+BgpzgbF+YDaE1/iksLFPJrCXjAPWHAxIwaj0hOg4mzSflFIC5dpRRQg==
Received: from PH0PR22MB3789.namprd22.prod.outlook.com (2603:10b6:510:29c::11)
 by PH7PR22MB3685.namprd22.prod.outlook.com (2603:10b6:510:1d4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26; Mon, 18 Mar
 2024 11:18:21 +0000
Received: from PH0PR22MB3789.namprd22.prod.outlook.com
 ([fe80::35ce:ff48:fa8b:d4a7]) by PH0PR22MB3789.namprd22.prod.outlook.com
 ([fe80::35ce:ff48:fa8b:d4a7%7]) with mapi id 15.20.7386.025; Mon, 18 Mar 2024
 11:18:21 +0000
From: FLAVIO SULIGOI <f.suligoi@asem.it>
To: 'Dan Carpenter' <dan.carpenter@linaro.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
CC: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH] backlight: mp3309c: fix signedness bug in
 mp3309c_parse_fwnode()
Thread-Topic: [PATCH] backlight: mp3309c: fix signedness bug in
 mp3309c_parse_fwnode()
Thread-Index: AQHaeSX7sx3kNaLcF0SXkvq4SwekQQ==
Date: Mon, 18 Mar 2024 11:18:20 +0000
Message-ID: <PH0PR22MB37894A0A8F267262A2A9C0A3F92D2@PH0PR22MB3789.namprd22.prod.outlook.com>
References: <74347f67-360d-4513-8939-595e3c4764fa@moroto.mountain>
In-Reply-To: <74347f67-360d-4513-8939-595e3c4764fa@moroto.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=asem.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR22MB3789:EE_|PH7PR22MB3685:EE_
x-ms-office365-filtering-correlation-id: d5c1708b-ac0e-49a2-4403-08dc473d1e7e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Mqia5YLOMwOlaPuxhbyzY0CtWAI3rragLclSKvlbfVjx/FA8+LUb1EXbUroz612M5RSANvkeeDjPziCryhehF15tpr1QH9XR1eiA8m2J+U0ufG47hgWRbl78GTVVgkHZhZE5877QIcVeqO+pwHTyEV4ipHFnAm1PDaRRVIu1s5S5TF/hPAY8JGL8IFi+eOc22Ejr1LaAUZJYSXfliLomwsjkVIW2ogPdG4JBZCN6D1r/0sjjrAQE1fKAuyF2cMnKbZwW3bhRu+0QYlDbBYancrtBNCL463detpj7mxXZhnjW/j3DvWSMr6kpOK2t1qnREmAWqdbDjjxpRKKbvWXB6Z8m+9TVSBQROQjRGEmtKHpDlb0ZH+Yo8tDKuN4MZcHBMeBj3iLE5NeO8flou52izqIGJN0///msai1JYu7WF7KFm0TbiH1YQ8T8LWrRxcDnGA60mdlIHFWaA8p2NgdLzGtHmh5bFTx4iGAI41NoL5wKrAT3+aVtfnZ6Cwg1e9eNUpw1s+ucOeG/pQtcwA+QdptXjBKu+pt2C1ERz+gJYYDI1OkcAOweUjA/yCMXVOW/Hxb0qLpAcHl8eaWVAA1i9aNOGVEp87Sm/b7542j6HtnhPZeaXlK26rWX1MpgGAlf6JkVms+bqwkyHlAI10tLGQEP4djAW4tNu7clXjv8Ux8PAIGsxl/0yqRbnzlhKJFEaBQLBEhrQUPiBwizBCh2Og==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR22MB3789.namprd22.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(7416005)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NlxnOYpFJS/WVEtnmekhvgM2oG0U7mrTo4khGgA6a0TLYBcdJsMCRi06lCJn?=
 =?us-ascii?Q?LA18yrKcK9Frm+ZHXM4rhFzLvJRv/IG385oPy+D0T9WsAgQF3NezmUZH+VXA?=
 =?us-ascii?Q?39Uecp57hp1g49g+aTQzNiMn9a9cnJMsk2uwx0wJgnQ0NHcxrSPepvCqOqtb?=
 =?us-ascii?Q?x7w7WHOeQ4ZPgY4CgAMwtwmIPG2Dkkix9N0kupo5RbMrZ76SCKbCWng5UY2e?=
 =?us-ascii?Q?mjwHAvzLZ104zjP6ZDjt2hr9E+WZSHXxrz02XaMXOOhe5pD14zlS4iEdtenw?=
 =?us-ascii?Q?tk/CYOwxaztA1U6ogA9wri9HIlRG7XM3QjwaofFFIZzZSIrOdlDNntw5/7f1?=
 =?us-ascii?Q?JB7HqM0Y3hd7TR96N2ut120qZYYamMjj9/1ETrJt695+/Kf3isPjhUq/lIS0?=
 =?us-ascii?Q?4gzHVQTozVQs9fN7VznOvFBgODKXdgdBFTpHA3wy0m8InWsvnBtyNYtltBZ3?=
 =?us-ascii?Q?TTTCcr+ffluXWN0H8EouVTL+uuGkg/KUtTvTkhM5CU6CEJrukMgE4S8tk4hv?=
 =?us-ascii?Q?7V2todh3ziJXBLxaP1HWqaVRCFPBhBKj4cpuiWrfR/f78kx7Gz4LC4avMt/C?=
 =?us-ascii?Q?wzYaG21xIiOJpJYBRKj5SYA13iml9/AUMEARuBinwoj6YIU7HL+tISk3X04w?=
 =?us-ascii?Q?0r97nEhHV0slVkvBRuN6xCCvojIRCyFe+axXDk+L34Dq4AiI7O7dG/yTtz6x?=
 =?us-ascii?Q?0LziNgbR22FkGmReSvGNM7EJWmKCYj31GvcseqcT/ohiGkRFPlmHQndpdwrY?=
 =?us-ascii?Q?y6n39B3B2dNl61tj0pJa/2oHjn6c2OSvnB07XHdnFQSr0bN95AsEHqZsuSYm?=
 =?us-ascii?Q?9l7ydYmYTpg1LIEuKRHEXu5FUIsADpzzOx1cxyBIsnM2klXlkSdP2g8WmCIw?=
 =?us-ascii?Q?a1kDoezROgTCZ+vpbCYhPWPjQc+PtQueqIp+p/dK5UdAXt2Fgt7QsISlLYdI?=
 =?us-ascii?Q?/nNBOPiX392y7qXqA2wcMpK9lSs7Ubd7Vy799iRoD0JWB5IOW0zpc0baxgy+?=
 =?us-ascii?Q?kNZvuRHyOZHZnhm6b0vVosOIZuOfsUx2997fPqNbwNyN93WXsv3ERTn70VAr?=
 =?us-ascii?Q?Rpl8/Pn+MiFjZBJmFQeMOCXm+rFdmiA0W2bwcp2Lz2/+pFrTIhAmOGdman5v?=
 =?us-ascii?Q?4eJq1QezwSlppGk9RBxJ9llA+NegeM5lHdD9Ta0nU4sTfhqXWUZ15fJ+RU5e?=
 =?us-ascii?Q?BWABO5o4Vbk0zeuqstKAjmhAnQrn1r9OZzzNxs0DR/IaEhDFdboSviDG74n6?=
 =?us-ascii?Q?PDRV/88Z5YfSDdOsD7n1Kc9HT/5FALpA1+ARwxAkdEmHm0A22TKYoFHFEdAl?=
 =?us-ascii?Q?j3FLp+aNj67PK3uJAGi07oUMyfQeyfnmYKtoR2X65ezJpk2NULwE+7u9LW2l?=
 =?us-ascii?Q?dHeBaxbBV6R5jThV7tCWz9NepL1yebstHUUIImYZvSeddM1ckzVjcjAr2SQS?=
 =?us-ascii?Q?hzUr1vB5aH2LFMuZEta6Sd8zx0M7qh+jf5Er0Kq/z9usgw/xA17mqa3Y4Fql?=
 =?us-ascii?Q?uXOUn4r1/+kJyg6MHvM3wWyJNu+wyNFFB9HIdqYgsJPb9uxdZTTDg0pcCvWL?=
 =?us-ascii?Q?J813qzutT8oJ9Q5MzLVS1MSQaWLTJ/JoaBoCjhomhWFxx7FC/H436stBArYq?=
 =?us-ascii?Q?yu1VNQ3yKDbykM1u6YH5BBw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR22MB3789.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5c1708b-ac0e-49a2-4403-08dc473d1e7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2024 11:18:20.9565 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 855b093e-7340-45c7-9f0c-96150415893e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gbxVntwZCZ5huYKYrtZvqddYt2D+xwUJAAyapVrz2Y5WfLkPnUGq4Sk4jCSEXzyUfvO8PS2aRWDxbRbeVnK5Mn0i863W3MJ853O0EAYR9AwCkJCCw158ruYEMiGZizpp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR22MB3685
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

Hi Dan,

> The "num_levels" variable is used to store error codes from
> device_property_count_u32() so it needs to be signed.  This doesn't cause=
 an
> issue at runtime because devm_kcalloc() won't allocate negative sizes.
> However, it's still worth fixing.
>=20
> Fixes: b54c828bdba9 ("backlight: mp3309c: Make use of device properties")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

I've just tested on my board with the mp3309c chip, all is ok.
Thanks!

Tested-by: Flavio Suligoi <f.suligoi@asem.it>

