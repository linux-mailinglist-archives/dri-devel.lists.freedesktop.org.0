Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 980D2348C6E
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 10:14:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B9C6EB47;
	Thu, 25 Mar 2021 09:14:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150083.outbound.protection.outlook.com [40.107.15.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF0D6EB47
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 09:14:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eNtV1xsR2prVCrx86CaX7+TRlU8iy/df1IhUkVlgqnOaloyr4bqrBUIHrEjbbNuLlxQ/wFBpJzDbPmBvXd2a5lT3HJVgPGAU1Pom/+l2Eb1iYfOjPdt4shk+mK6h2UcjY5/LvTL4WnD5umFTghKPZnDa1Y0EveQLchJI4XHM18WFaeDTmS6P6xQ8nzzTWuNCpifjSxjB61qtv0N/8gNawQSyHYzZTzqs9WPPo+DubldhumGVXdJiRnAfzhCV5DNvLtGXUD0FpydveysHZ/2i6IHfM1wqbBYVik43gCWvIhxYLhIN8weEsMLybjHLcnCOEu4PbHuFp9BN+ULLXma3ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zKUevlIS/pPr9dxRWiV7l3CwA0jZ5orOFptAqFk/LNU=;
 b=AuPr0U8VsyQ0tec+6Bv7iPI+RhqGk344eAo5Q+nYJg8/MhY/ilDmMxrxsDqiSqWkedqQw/fmG1dRomkYxSoFapZdNUOlW87beDN0B139Kz8IQm3Moz9vIyzjp4tTxw8nGvLjNqc8ku41ZNhueNelF1Y2AaMBcHCcfFHipcG3NI8Sn7h3wnh4qay0Lp4zwygSk1R7xaPao/O88iMjvAjsRyuvr5ieq39ohE3gyae6H5EpPpgvyOlOcdqG9uhZ/PbTXA5UzfUN0yn+fYZW8DMkhZbfE31K7zzxzkKwIFoO4xArhmugndWF2xWgLNxEVNh2xUU3mlR5vK1WGGQmhnmGAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zKUevlIS/pPr9dxRWiV7l3CwA0jZ5orOFptAqFk/LNU=;
 b=qfbDMMrVycJwPIqMC6hkSAyrRUpW6VLaZDw3cgqO8yZ9Qv8gsb5idHHb6ELm//Cx2SS/Tvddhtu9ha7Kb1QAzzirHl5Us+TSA8xGh2gCBzgKGBLlGv48UKr2IpfoQ99a/Mc6ym93KpN9dOVFO4dmO7lX7zyFd0ThIaQ0rJtT/hA=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0401MB2319.eurprd04.prod.outlook.com (2603:10a6:800:26::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Thu, 25 Mar
 2021 09:14:50 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c%5]) with mapi id 15.20.3977.026; Thu, 25 Mar 2021
 09:14:49 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 1/5] drm/bridge: nwl-dsi: Set PHY mode in nwl_dsi_enable()
Date: Thu, 25 Mar 2021 17:00:28 +0800
Message-Id: <1616662832-27048-2-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616662832-27048-1-git-send-email-victor.liu@nxp.com>
References: <1616662832-27048-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR02CA0164.apcprd02.prod.outlook.com
 (2603:1096:201:1f::24) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 HK2PR02CA0164.apcprd02.prod.outlook.com (2603:1096:201:1f::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3977.25 via Frontend Transport; Thu, 25 Mar 2021 09:14:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: be1694d7-b3f4-4709-39fd-08d8ef6e7123
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2319:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB23191D4A3CD9749B9B931A5F98629@VI1PR0401MB2319.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PtazQV0CyT/lnkTszIg0RzGotApb8RAAwXOin50cqVOQTtqfemVvFfFlzOqQ42wH85tbUxE0uIvHl4LbrjHCKjev5OIWOufCfUEafzZTHjWDsSaK7K2y7xg+tR19x4gXScIbs4aBJHRP3L5Lt7GIZpATdJAaXhiPoEeGbYQGgNMgGr3bHRouQz4muM1PT7Kl6+bHb8TaxKcuy3dDvFg/a0KOCSTv4t7+48GOMD32rsauBAEahMonf5i5o/Wz2hN8z74R58nZ+p/LRvQybUILgqusHjU4cRZ0qF8nk49DFtNP157rFwqOABg05dxGSTNeyIzOM9/LA4OdeE6g6lNXjduADH5k2AO6tJlYNl9Dgxq56VUo1Iy+N3Z3hBZSuVlzaRBwc1IdC7k2tsL/67X5PtkpSoAWHJAkvtrVUSpF7613u6TU56aXVW19wSaS8uJvf2Nvv2Oo8gsyMCMUIG4Tm2JIDq+u6YgE8yLKbob5iiWf0XX1eGiKH+RacOUTcYYxk6SXgK8RMJ3Tsd8bZ9jQYsuYgIxGNcjlfqLHGclAM1ZcSUGMxGyVdgKCL+KJ6j3rrHpzDy2XBzHcJWtdGDE7VwRaFVuaHWq76eUMghzHTh1Hqhd6om/0gZfNZBchxd8FRVXwc8G1isDMx+yzFT4UyAZXPpcmhyKQE9Ak8H8Y7ic=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(6512007)(2906002)(7416002)(6666004)(5660300002)(6506007)(8936002)(6486002)(8676002)(66556008)(66476007)(4326008)(66946007)(2616005)(956004)(316002)(38100700001)(16526019)(186003)(52116002)(478600001)(86362001)(36756003)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MUN0NG9SWG94WHVhNno4Zm1hVVp5NkNyc09INDhNQTdQYlhtREtpaVB4UDJB?=
 =?utf-8?B?NlJON1FEdVFQL3J0VnF3Tzh5TS92RzlBcnRJQlJZeTh1cmdKWkxmMCtBdEhF?=
 =?utf-8?B?SWxyMlBoME51bE10RkdpTmUzRnNqMjFhd1VsaThRenJaR3ZjM0YxbVpabEgw?=
 =?utf-8?B?d3NwRUoyV0VlOHE0SEpwMnEzWk93RU1tVm9SK1h0dTVpbk42QUY1MFJYZ0w5?=
 =?utf-8?B?MUdFbE5VT2d6dkRMV3ZTM2ljc2NpVDByemtOUkdPTWhwTGhEci9BWWJnR3k5?=
 =?utf-8?B?bXVNZXkzSmk3aXlWTXVudEw0Y25JZWJ0dlpSRXloMkJsdmUvOE1JK09pd0tL?=
 =?utf-8?B?a2NydXZtNTlRSWs5T0VydC9PQ3YrR0doTVB4eFkrbkdveThjbk04LzlHNmhU?=
 =?utf-8?B?bld3ZFdmZm5NQzg5T0hqTGcxcjJyOTdGT2VXVW05VDdldXF0bmRIcUxETGtM?=
 =?utf-8?B?cVRnSkxtaEJqQUhCNytjaDZLdFpFUHZpNDBXMVV5OFhkYTdjbXRGM1BhRTZB?=
 =?utf-8?B?bHQ2ZVlLRzBHczV4Z05KSVBrSkEyd0F1dDB2OVRtZkFTamJoOTFxbXhHQzV6?=
 =?utf-8?B?ekZodW8rOG5PSVJ5eGVTcnd1aDVvRjJCSnJ5VnZVK09MOHFkZXMzM2xscTZW?=
 =?utf-8?B?WU02ZlloaXlsSVE4SXdNMGwzNitVWGhFbDVHakkvTHFtaWpxdjV2dlJDbENN?=
 =?utf-8?B?WEc4cndWeFZ1ditnUG5ycnhhVHkyTVdraUFqaDg1L3RGWG1PcjVzZFpMRnFr?=
 =?utf-8?B?bDZ1R2hVM2g1MCtyMmxJa3g0Tm5OT0kzb2NIRjJzbk15dkRDbUcwTUMyUHEv?=
 =?utf-8?B?TVZGZEhhc29udU5yYWZ5QmpBWjJaMjF1ZUVQQitsczdUYWNSSFJiUkJTS0N4?=
 =?utf-8?B?Z25yZ29RS0dvVFk0LzZWWjdtdlZGVkRYaWJ2Zzc2RVJRdllzM3d2K3ppYnRM?=
 =?utf-8?B?K09kK2dwcmtCZGlBN1BJWWdnclJ6VXRhQlZtOExaZzJUSmYyUFVqSCs4ZEJW?=
 =?utf-8?B?SGtLaXdNdTd6V1N2dkpnYVpoTlRLY21SQzN3dVFzdGw2Z1pMa0dxREhXUDMy?=
 =?utf-8?B?b2lGQnhsbkYydXd4MzNnb3NoV1lNeHo3VFY5azVrbDFRRURjUmRRbHVSRDR4?=
 =?utf-8?B?NHFZZFQ4Wnc3dGFOSzJXTkRzbHVBcis4QW9wN0I5dUdyN0lreW9kaXA4dVhX?=
 =?utf-8?B?c0liNEFjME9PcFg5MitjZGQ4K0x1ZUg0Szk2UXdCSmtQU1hxcGx5eGZCdGZy?=
 =?utf-8?B?QTRQbTFTa1FDYWlMVjNEWUYwdEhoa3l0YUdWV0RQbUZlMlNUeUNDdW4zVHZV?=
 =?utf-8?B?ZlpERUtBWDFISDFJSWxGSDM2UVN5ZTUvQ2VldzdXQmlmdkJHSFc4YW41TzFv?=
 =?utf-8?B?bFY2OHNicCtWV0lQRElUNlFmWmhIZ0daTmVHSDdKYy9SZzVhYkthMjNjU05K?=
 =?utf-8?B?WU1zbUUvd01VUnhrTzR1TkE3eG1PWHJvM0ZpdVBFZVpnSHBMOGRkV1pLbmVr?=
 =?utf-8?B?Y2JBRFUvZTQxN1htR3VBRkk0Rml6VkRsemFLdXg1ODRVU0oxMXhjS25XQ3NQ?=
 =?utf-8?B?cUozckozNjYyVHZvcGRUc0FRS1dTZ3h2NnpUOWVxVFd0eWRVK0tMM1BFUGdj?=
 =?utf-8?B?UjVSZ1dCamFFejBiaExPVG56ejErbS9xVDAzZGhvYkIvTXJ3dWllQ2YvcnlN?=
 =?utf-8?B?dzlaSXBPQUdYLzhNVFEwUG51Rk1ZamJCU2xyVTVFNTB3UUppdUM3UHJCZHNB?=
 =?utf-8?Q?l+pPaLa3BBPjiQvhvcwmp4enx/lSzGQwDK6GQrg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be1694d7-b3f4-4709-39fd-08d8ef6e7123
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 09:14:49.8459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: //10cXfxsP1Ybl8uGwSZ9Pg+jVsgl/HXKnuYRuP4xouGhm/A5TE6TfyfURbrEM8Vj+gwYp6iTU/yTjBIZZwlvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2319
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
Cc: martin.kepplinger@puri.sm, jernej.skrabec@siol.net, kernel@pengutronix.de,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, robert.foss@linaro.org, kishon@ti.com, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 robert.chiras@nxp.com, shawnguo@kernel.org, agx@sigxcpu.org, linux-imx@nxp.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIE5vcnRod2VzdCBMb2dpYyBNSVBJIERTSSBob3N0IGNvbnRyb2xsZXIgZW1iZWRkZWQgaW4g
aS5NWDhxeHAKd29ya3Mgd2l0aCBhIE1peGVsIE1JUEkgRFBIWSArIExWRFMgUEhZIGNvbWJvIHRv
IHN1cHBvcnQgZWl0aGVyCmEgTUlQSSBEU0kgZGlzcGxheSBvciBhIExWRFMgZGlzcGxheS4gIFNv
LCB0aGlzIHBhdGNoIGNhbGxzCnBoeV9zZXRfbW9kZSgpIGZyb20gbndsX2RzaV9lbmFibGUoKSB0
byBzZXQgUEhZIG1vZGUgdG8gTUlQSSBEUEhZCmV4cGxpY2l0bHkuCgpDYzogR3VpZG8gR8O8bnRo
ZXIgPGFneEBzaWd4Y3B1Lm9yZz4KQ2M6IFJvYmVydCBDaGlyYXMgPHJvYmVydC5jaGlyYXNAbnhw
LmNvbT4KQ2M6IE1hcnRpbiBLZXBwbGluZ2VyIDxtYXJ0aW4ua2VwcGxpbmdlckBwdXJpLnNtPgpD
YzogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KQ2M6IE5laWwgQXJtc3Ryb25n
IDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KQ2M6IExhdXJlbnQgUGluY2hhcnQgPExhdXJlbnQu
cGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KQ2M6IEpvbmFzIEthcmxtYW4gPGpvbmFzQGt3aWJv
by5zZT4KQ2M6IEplcm5laiBTa3JhYmVjIDxqZXJuZWouc2tyYWJlY0BzaW9sLm5ldD4KQ2M6IERh
dmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBm
ZndsbC5jaD4KQ2M6IE5YUCBMaW51eCBUZWFtIDxsaW51eC1pbXhAbnhwLmNvbT4KUmV2aWV3ZWQt
Ynk6IEd1aWRvIEfDvG50aGVyIDxhZ3hAc2lneGNwdS5vcmc+ClNpZ25lZC1vZmYtYnk6IExpdSBZ
aW5nIDx2aWN0b3IubGl1QG54cC5jb20+Ci0tLQp2NC0+djU6CiogTm8gY2hhbmdlLgoKdjMtPnY0
OgoqIE5vIGNoYW5nZS4KCnYyLT52MzoKKiBObyBjaGFuZ2UuCgp2MS0+djI6CiogQWRkIEd1aWRv
J3MgUi1iIHRhZy4KCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL253bC1kc2kuYyB8IDYgKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9ud2wtZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL253bC1kc2ku
YwppbmRleCA2NmI2NzQwLi5iZTZiZmM1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL253bC1kc2kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL253bC1kc2kuYwpAQCAt
Njc4LDYgKzY3OCwxMiBAQCBzdGF0aWMgaW50IG53bF9kc2lfZW5hYmxlKHN0cnVjdCBud2xfZHNp
ICpkc2kpCiAJCXJldHVybiByZXQ7CiAJfQogCisJcmV0ID0gcGh5X3NldF9tb2RlKGRzaS0+cGh5
LCBQSFlfTU9ERV9NSVBJX0RQSFkpOworCWlmIChyZXQgPCAwKSB7CisJCURSTV9ERVZfRVJST1Io
ZGV2LCAiRmFpbGVkIHRvIHNldCBEU0kgcGh5IG1vZGU6ICVkXG4iLCByZXQpOworCQlnb3RvIHVu
aW5pdF9waHk7CisJfQorCiAJcmV0ID0gcGh5X2NvbmZpZ3VyZShkc2ktPnBoeSwgcGh5X2NmZyk7
CiAJaWYgKHJldCA8IDApIHsKIAkJRFJNX0RFVl9FUlJPUihkZXYsICJGYWlsZWQgdG8gY29uZmln
dXJlIERTSSBwaHk6ICVkXG4iLCByZXQpOwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
