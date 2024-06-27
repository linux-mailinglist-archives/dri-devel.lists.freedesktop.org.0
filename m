Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0ED919D03
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 03:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C36610E02B;
	Thu, 27 Jun 2024 01:45:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=buckeyemail.osu.edu header.i=@buckeyemail.osu.edu header.b="qUIsAvaz";
	dkim=pass (1024-bit key; unprotected) header.d=buckeyemail.osu.edu header.i=@buckeyemail.osu.edu header.b="gIhq5BhV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1325 seconds by postgrey-1.36 at gabe;
 Thu, 27 Jun 2024 01:45:16 UTC
Received: from mx0b-002cfd01.pphosted.com (mx0b-002cfd01.pphosted.com
 [148.163.155.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D0810E02B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 01:45:16 +0000 (UTC)
Received: from pps.filterd (m0130878.ppops.net [127.0.0.1])
 by mx0a-002cfd01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLacww025210;
 Wed, 26 Jun 2024 21:22:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 buckeyemail.osu.edu; h=from:to:cc:subject:date:message-id
 :references:in-reply-to:content-type:content-transfer-encoding
 :mime-version; s=pps1; bh=gdFuTi/cr9ufmT8xGlyfkLNobMajucnEf33MGJ
 3MiCY=; b=qUIsAvazvV2c23vX3qFFhhYfLKNusW9LnrowOxQcObzXOc2mmkjgJv
 RPO+eEoJeOHZquJHjTmSe1G0exohjdBT79IjgICbCkpgPaZQ5rBv9gSEdrotMvd7
 jdk2BZo2bLGIgIQNcc3LSFb43zxii8fWsGfiO7oMnMjeo8fFhS+3U+9XL5CFNnle
 QpVI+WZEp8Iz19H8RQ2T1XU9BlypmpQz5ep4g9OmY0kswOWaaZMccgEYhlHEvG1d
 rqaY2FNGx+li6vesQd5fl2qbnzi5vtXrM8SM5wZlmlfCT10+UNPI05Hmj+7IwFMe
 oHvbgBJKo5odBdLIQpjxRhHejKkaco7g==
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2041.outbound.protection.outlook.com [104.47.57.41])
 by mx0a-002cfd01.pphosted.com (PPS) with ESMTPS id 4004cm0fxd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jun 2024 21:22:51 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IKxG/PseFODfAtQvvuDigAd6nTjd97ewqO073NeSYV1Gae2m/su/kk6yNk1ejqkeVriDOQ4endtvfxsQ6+w6lJIfa77DX/r0CGWh6dEpMen4QF9qBDsBCXPz+xoqUahxwdQW7suO9ymNKnG5HCrwCsyBN82mLLJoV/Ajn7jXNKhvAm/UVyvktnpBZNsxjPj0OWL05EnDRfyR7ZBMLvO2MUJWb+8kTCpzrEFR3hnFB/8cFPfvV7nYHlG+V3DBnWRLVfL7t7HQUXUinegzTMaZZ0aN1ZyGPQ0x0ON7wTjUnfaoRu9A5TB1L5+oPNnRqQd7bMIAj8JOm4lfgI3thgoWNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gdFuTi/cr9ufmT8xGlyfkLNobMajucnEf33MGJ3MiCY=;
 b=Ifto8M4oiLYSRMUGn3khDIN0Tlv28P/DqbUb+r7jBBWNn6/rZM4kzBTC62SoURvTuz92CeDggICBMUlq71u/YQjduUj8qyXc2mt5W01eVN7Bm7Q9YUzZkIzMqhrZC4MG0NzZV63a2pqloAjIp9/p41nhlV6PmrHhaSvesU3/LWMBIAy7Tm10T/ZC3aetjlxZ7r0Yv/mwuO8XDFsUNk8xRL+BmXToM9Zb1j5S11DkVt/MfyvGTJ7uavo5h/78qyqm3YwtI7nN5X7OEqg9OBXs9n3EeeGVWBEuV3tDYuWQKa4Pp8F0pVDS6UC7FA3wql/Ct+m5p56byTrq8km3ACsnVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=buckeyemail.osu.edu; dmarc=pass action=none
 header.from=buckeyemail.osu.edu; dkim=pass header.d=buckeyemail.osu.edu;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buckeyemail.osu.edu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gdFuTi/cr9ufmT8xGlyfkLNobMajucnEf33MGJ3MiCY=;
 b=gIhq5BhVqL/yU6RUa9jiSPBS0CdiRLXUV5TICFpyf4saRev8zYwhXAAFNtzcvOXgnM2wdL2hseU9EN0ZJs0I3KfHidJXA75+Bcz3bvlKSPi1ay90PWcsAtAvwi9rkcPfAZKTWvz9WlbTZhjI1ENMSUfN97BhfCp8tiNFYiNNxmg=
Received: from CH2PR01MB5799.prod.exchangelabs.com (2603:10b6:610:42::32) by
 DM8PR01MB7111.prod.exchangelabs.com (2603:10b6:8:3::13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.32; Thu, 27 Jun 2024 01:22:47 +0000
Received: from CH2PR01MB5799.prod.exchangelabs.com
 ([fe80::bc2:98b6:6a60:21e3]) by CH2PR01MB5799.prod.exchangelabs.com
 ([fe80::bc2:98b6:6a60:21e3%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 01:22:47 +0000
From: "Pafford, Robert J." <pafford.9@buckeyemail.osu.edu>
To: Frank Oltmanns <frank@oltmanns.dev>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 =?iso-8859-1?Q?Guido_G=FCnther?= <agx@sigxcpu.org>, Purism Kernel Team
 <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, Sam
 Ravnborg <sam@ravnborg.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-sunxi@lists.linux.dev"
 <linux-sunxi@lists.linux.dev>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: Re: [PATCH v4 1/5] clk: sunxi-ng: common: Support minimum and maximum
 rate
Thread-Topic: [PATCH v4 1/5] clk: sunxi-ng: common: Support minimum and
 maximum rate
Thread-Index: AQHavqzpBgj5D7bkhkG8vcHmuBIAebHH7mBAgAjhLiCACXU+bYAAFHSAgACCGds=
Date: Thu, 27 Jun 2024 01:22:47 +0000
Message-ID: <CH2PR01MB57990FBF72970DECF96294E2F7D72@CH2PR01MB5799.prod.exchangelabs.com>
References: <20240310-pinephone-pll-fixes-v4-1-46fc80c83637@oltmanns.dev>
 <DM6PR01MB58047C810DDD5D0AE397CADFF7C22@DM6PR01MB5804.prod.exchangelabs.com>
 <87wmmjfxcj.fsf@oltmanns.dev>
 <DM6PR01MB58043A518B836D1CC3509554F7D62@DM6PR01MB5804.prod.exchangelabs.com>
 <1b359d7e-fe85-48ca-87aa-37ab7e34aaf6@oltmanns.dev>
In-Reply-To: <1b359d7e-fe85-48ca-87aa-37ab7e34aaf6@oltmanns.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR01MB5799:EE_|DM8PR01MB7111:EE_
x-ms-office365-filtering-correlation-id: 93cf9ce0-d52b-418d-30d6-08dc9647a722
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?1X4tBl4UxawPCRzqo/yjvLGpAlvCCKSyRZbJvE/JHnkFFzEtZHgpWTgXxL?=
 =?iso-8859-1?Q?iuUKjBS9hOMMaXwUmcWX0qGN9PuX+Tfp7SUwJHsjxZx5IKwL+QHExTglwE?=
 =?iso-8859-1?Q?CvhPUkJYX+KSr4rUCf5bJK2ZF2BVnO72yNC4y49+q24WygAHTuIEbpBBXa?=
 =?iso-8859-1?Q?Xr4AoAuDV9n1ANyYfBnGwyhmrQ9kFHlJE821b3d1X4oYUM3bs3C/l3yS36?=
 =?iso-8859-1?Q?URTwwrvZr3hOtb5rWq7Wz2M1Gd0LWcOXo8ykLGQLWad+PRTQGnEu/jF+e3?=
 =?iso-8859-1?Q?78OHpoUECVeYbhNq4dAnncUidyF7ERyH8u/LfOx/PVVfkj7jo/RuWrPn0E?=
 =?iso-8859-1?Q?VuL7Fl+tTJhHHpGHpqjAuCI3FPwDq7KjAekRJ2P4CtX2mFApmS+hjmXBOy?=
 =?iso-8859-1?Q?9/v7MzvN0U3Ei423UytALdq/wtS12VH1m10oSrOZCHQ7uGAHV/PohAe4QJ?=
 =?iso-8859-1?Q?rGqqbN0Pxn3DQru82MoEID7HVLuEsy1rgRl7+IfA7i/GNQ+rQpQW2pzScz?=
 =?iso-8859-1?Q?imxZwLjixzANNxeZ0KYlfqrV/J007wE16EoWRKD4p0MI0vafw2YiHI4vvO?=
 =?iso-8859-1?Q?WJ+nXfGLjNIdcu4MjRHM8BihJkVy5DQc+Z/B2bkyND+ZZvjOBpARuCSJuA?=
 =?iso-8859-1?Q?vN8xhlayYwKc/D2lD535Nd81r7j7KBJvmHPCDxltoQ12rkaUt+ggXGX4Fs?=
 =?iso-8859-1?Q?TtZALknTP5FMEjrmnt/ZfLADaGsTwzvXzNiRD/pdhiElPVgcndZBrB6QHd?=
 =?iso-8859-1?Q?Y/896CEYeQryaFGcKzzlXY51PZvOiyLMZVQicFZgRDqDfVmSxEXgMHnjxO?=
 =?iso-8859-1?Q?v2AnDxhzg0M1r9Z1aGthhBFn6COJfUXHPAsmtJ7Gy7B5F8/tn1jPGa2XUG?=
 =?iso-8859-1?Q?nqQhFOLFXrgugYxt+nCcspfNCypRHzMYmltLTvoEj6W7uC8VQBCR4uogex?=
 =?iso-8859-1?Q?vJER+6xzAln/vhgCWANJzuGkENzK16OVS5y/FaZfLr977eptcfSUPTn7RA?=
 =?iso-8859-1?Q?1NoQlyBXYvba/2zETFu3w3v9Ab+0Kxx2pREc9oDTwjQQaGQzSJkdaNqmMA?=
 =?iso-8859-1?Q?4+Ws2dRikqJ3DKGaiJuZLLaqwN7KMUJS6+B8eAWVLVU+JBLpnbx2gChtjz?=
 =?iso-8859-1?Q?inax7VWK0jBUBmaH1hQv/BnYnpTwN8uH73qp9IxULUbW4xZ8BD4DqxiFXc?=
 =?iso-8859-1?Q?bsCJ2PjROV+AOYtlMXIb2zLrrOSy4/rMl2UOsvEyXM/kWOiyyWleaiux2A?=
 =?iso-8859-1?Q?S5pjx6XR3DSjl19aj/i/+FqxPeZxk5jznZ8Ymbbg1o61GSIJkGibnv4m2g?=
 =?iso-8859-1?Q?6Y94RfXWQtdpXUZiowmTPcWFe3rrgdRJ6jHv3b3wi2ovwzJ+S/MwilHqUP?=
 =?iso-8859-1?Q?NY8mcqW4Ms?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR01MB5799.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?tii2UVlEYsoKGkII79ZlVUb7c37VPN+2TwfjehtjL9JawaMSgXKQUFpi7Z?=
 =?iso-8859-1?Q?W9fRRlWmPjT8tcNwYnz6IiPmRyYPBvITq+i2+zXfYb+M6+rmkAlotDW7kH?=
 =?iso-8859-1?Q?bfVaQAIz7+Qw3Dy1iEuPCJ/+Y2dlUX/R2gLHR5o3uTAFBS49s2AAUMuwpX?=
 =?iso-8859-1?Q?lDCxXW+kR6Mle0VcAaqkcn63WfW2SUK+I2D6WwtjO9Pd6pqrBgHj8Zytvt?=
 =?iso-8859-1?Q?JsudDVwZNFEYqv4+3DLG+fTo5wD62NctJmAn9y9Doa1yVgzc+RIQpr9GwU?=
 =?iso-8859-1?Q?CTJ0nheQrsXAB8rqTiZQbbKVFDYH6xLsSxsx3V6fCpA8NuJIf+lqTFSM4F?=
 =?iso-8859-1?Q?Rhb+Ve5G+vNpQYNwKTbqE43WzE6OHF9zVA4LtJsD4b4HX5a/cw92q1tKbJ?=
 =?iso-8859-1?Q?lrnZ7sApjgrrYsvlRqxye+XPfXHRRyc5pfaF0tIjM+063jVSkJTPOlbVZC?=
 =?iso-8859-1?Q?Pq6Fuq/EAo6Cwj5/th0q8yTm2TYaNjIJ1WrkxFmLBCUHn7gyNNqt7xlLYm?=
 =?iso-8859-1?Q?xSL4wwCH/u+Y836KnJBRzV8TUWM+wdGz6XdVwlFdkUdO3I/FPcMNCu3GQK?=
 =?iso-8859-1?Q?N12lPnYrFT/n9uxw4UubPMkdXX2oh0idsgTJSb6+4mAo1yrBZyRfcsZa6z?=
 =?iso-8859-1?Q?s8I4Chvuc9d4BI2Ic1j+glWUUPmQxFvlMJasfMZVk5S6rK+T2jBqwYn8w1?=
 =?iso-8859-1?Q?js2cTJYEW8etxmID9TQhtd6aS+LjnZoR4D3nY0IUIm3FqI8df57M7KtFt7?=
 =?iso-8859-1?Q?BLPxUbtSr6OHuB4OXXFmyLcguE+5lUDJC3JCQhu7h68AVvoMDyTDKkQZDS?=
 =?iso-8859-1?Q?sAFvDpbjhePkE6t/XjPvV8+87Ima9zRRubVlFeWFiMZ0PdImgkoTToc6OG?=
 =?iso-8859-1?Q?xanW5B/G+PI1pgXHzLO64Mq/Tdpw9rkohM39HDuOivXumhrBIbM1QO2I2K?=
 =?iso-8859-1?Q?cpJmouJgMhhOvcuUoEsq+mJMBMECSjQGk9aa/HaIshqEiyngJvzunw+0vP?=
 =?iso-8859-1?Q?94V+ygmgzFech5q0ayEHK+fFagrITp3JnzL7zSWMeavmC8NvJ7kFBpGsBW?=
 =?iso-8859-1?Q?yC3R+4r0Fzx0vPk2G0HbgrBrVo2T+2KpTBQC8mzE5P7u6W5DfmHwoItCYB?=
 =?iso-8859-1?Q?l8uId5Zvd2A92zb9fHWO7Lh8E3X9L96xCAI2z1vu7xOGvQx1PFw5f9NXeP?=
 =?iso-8859-1?Q?kA02eJDVpV5oHE6OqgTSBT1LGOKzRE75lepKawag5KY6RLc6OYQapi8K+/?=
 =?iso-8859-1?Q?RYMlcgTf+VtaAIvmWPFyk9NTF6zGleVsap2LI6CYEz39GsOWg8Y4pvvbHG?=
 =?iso-8859-1?Q?/kcKIXHgkQW2ILISVBSCjaVI3Ci6v9ZUUTcI8r8qm0KF3P2NdCbAxVM9q6?=
 =?iso-8859-1?Q?Yr6HHXQQ5+LOwSnRd50l1VyoEjyGYEjlp1NLv9R9f81jNqsdT2OGyeIUAz?=
 =?iso-8859-1?Q?eFWZIF6eAdgCrD0QtS5GqvoVJ5Cm6nV3RCVZi/lT4UTvK3GBYQlTJwsQxo?=
 =?iso-8859-1?Q?nID6Lm2FUHhHiymDwuRsXCfS8nlPqtb0uFIGhz9RaerVy7JiwYjoI4Tbau?=
 =?iso-8859-1?Q?8sPkGsux+T79CYRMmFyY+4eJB2YSfi2aauwf4Gku8uAJg2KcxAWj6XMGss?=
 =?iso-8859-1?Q?elNG9bluXpuz/7B3OFPB/PaHEH56R4I6gN7MrxJuPXIPlazRR53vzzYqMl?=
 =?iso-8859-1?Q?sd8aRKzKdTVZxYrc9KsGDGGEBKNtaANC70kGJefynQzq4CkXfFSO2n8sLU?=
 =?iso-8859-1?Q?waUg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: buckeyemail.osu.edu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR01MB5799.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93cf9ce0-d52b-418d-30d6-08dc9647a722
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2024 01:22:47.0481 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eb095636-1052-4895-952b-1ff9df1d1121
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /CrklcSRtRwd0eNcDQGRzHxOFEdozLuApcoQ6MnZGZCisNUHpXdwK6+DNbpYmzmZHuv/T2Tf4QfVhOcPuEuhjF7FQYLXtfTVXpqwY3SSBR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR01MB7111
X-Proofpoint-ORIG-GUID: H7nkjiYEQhpIJrGf9AcuCD21uHgkdME8
X-Proofpoint-GUID: H7nkjiYEQhpIJrGf9AcuCD21uHgkdME8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_17,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 mlxlogscore=999 clxscore=1015 phishscore=0 mlxscore=0 suspectscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406270008
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

Frank Oltmanns <frank@oltmanns.dev> writes:=0A=
=0A=
> Hi Robert,=0A=
>=0A=
> 26.06.2024 18:03:24 Pafford, Robert J. <pafford.9@buckeyemail.osu.edu>:=
=0A=
>=0A=
>> Hi Frank,=0A=
>>=0A=
>> Moving to a new for loop makes sense. Let me know when you have a patch=
=0A=
>=0A=
> The patch is here, strange you didn't receive it:=0A=
> https://lore.kernel.org/all/20240623-sunxi-ng_fix_common_probe-v1-1-7c97e=
32824a1@oltmanns.dev/=0A=
=0A=
Ah, this must have slipped through my inbox. I just applied it on my board =
and it is=0A=
now cooperating with the min/max clock rates!=0A=
=0A=
>=0A=
>> and I'll be glad to test it on my board. I do also wonder if this may=0A=
>> have contributed to some of the HDMI issues seen in the other thread.=0A=
>=0A=
> My thought's exactly!=0A=
>=0A=
> Best regards,=0A=
> =A0 Frank=0A=
>=0A=
>>=0A=
>> Best,=0A=
>> Robert=0A=
>>=0A=
>>> Hi Robert,=0A=
>>>=0A=
>>> I'm truly sorry for the trouble the patch has caused you and for my lat=
e=0A=
>>> reply!=0A=
>>>=0A=
>>> On 2024-06-14 at 23:52:08 +0000, "Pafford, Robert J." <pafford.9@buckey=
email.osu.edu> wrote:=0A=
>>>>> The Allwinner SoC's typically have an upper and lower limit for their=
=0A=
>>>>> clocks' rates. Up until now, support for that has been implemented=0A=
>>>>> separately for each clock type.=0A=
>>>>>=0A=
>>>>> Implement that functionality in the sunxi-ng's common part making use=
 of=0A=
>>>>> the CCF rate liming capabilities, so that it is available for all clo=
ck=0A=
>>>>> types.=0A=
>>>>>=0A=
>>>>> Suggested-by: Maxime Ripard <mripard@kernel.org>=0A=
>>>>> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>=0A=
>>>>> Cc: stable@vger.kernel.org=0A=
>>>>> ---=0A=
>>>>> =A0 drivers/clk/sunxi-ng/ccu_common.c | 19 +++++++++++++++++++=0A=
>>>>> =A0 drivers/clk/sunxi-ng/ccu_common.h |=A0 3 +++=0A=
>>>>> =A0 2 files changed, 22 insertions(+)=0A=
>>>>=0A=
>>>> This patch appears to cause a buffer under-read bug due to the call to=
 'hw_to_ccu_common', which assumes all entries=0A=
>>>> in the desc->hw_clocks->hws array are contained in ccu_common structs.=
=0A=
>>>>=0A=
>>>> However, not all clocks in the array are contained in ccu_common struc=
ts. For example, as part=0A=
>>>> of the "sun20i-d1-ccu" driver, the "pll-video0" clock holds the 'clk_h=
w' struct inside of a 'clk_fixed_factor' struct,=0A=
>>>> as it is a fixed factor clock based on the "pll-video0-4x" clock, crea=
ted with the CLK_FIXED_FACTOR_HWS macro.=0A=
>>>> This results in undefined behavior as the hw_to_ccu_common returns an =
invalid pointer referencing memory before the=0A=
>>>> 'clk_fixed_factor' struct.=0A=
>>>>=0A=
>>>=0A=
>>> Great catch! At first glance, it seems to me that calling=0A=
>>> clk_hw_set_rate_range() in sunxi_ccu_probe() should not have happenend=
=0A=
>>> in the loop that iterates over the hw_clks.=0A=
>>>=0A=
>>> Instead we should add one more loop that iterates over the ccu_clks.=0A=
>>> Note, that there is already one such loop but, unfortunately, we can't=
=0A=
>>> use that as it happens before the hw_clks loop and we can only call=0A=
>>> clk_hw_set_rate_range() after the hw_clk has been registered.=0A=
>>>=0A=
>>> Hence, I propose to move the offending code to a new loop:=0A=
>>> =A0=A0=A0=A0=A0=A0=A0 for (i =3D 0; i < desc->num_ccu_clks; i++) {=0A=
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct ccu_common *cclk =
=3D desc->ccu_clks[i];=0A=
>>>=0A=
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (!cclk)=0A=
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 c=
ontinue;=0A=
>>>=0A=
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (cclk->max_rate)=0A=
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 c=
lk_hw_set_rate_range(&cclk->hw, common->min_rate,=0A=
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 common->=
max_rate);=0A=
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 else=0A=
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 W=
ARN(cclk->min_rate,=0A=
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 "No max_rate, ignoring min_rate of clock %d - %s\n",=0A=
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 i, cclk->hw.init->name);=0A=
>>> =A0=A0=A0=A0=A0=A0=A0 }=0A=
>>>=0A=
>>> I haven't tested (or even compiled) the above, but I'll test and send a=
=0A=
>>> patch within the next few days for you to test.=0A=
>>>=0A=
>>> Thanks again,=0A=
>>> =A0 Frank=0A=
>>>=0A=
>>>>=0A=
>>>> I have attached kernel warnings from a system based on the "sun8i-t113=
s.dtsi" device tree, where the memory contains=0A=
>>>> a non-zero value for the min-rate but a zero value for the max-rate, t=
riggering the "No max_rate, ignoring min_rate"=0A=
>>>> warning in the 'sunxi_ccu_probe' function.=0A=
>>>>=0A=
>>>> [...]=0A=
=0A=
Thanks,=0A=
Robert=
