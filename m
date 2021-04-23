Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4113368F91
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 11:42:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EF036EB5D;
	Fri, 23 Apr 2021 09:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140057.outbound.protection.outlook.com [40.107.14.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B3F16EB5C
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 09:42:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lAvpOGqDisacT3p3Pa9EZm/Zo0CoNth79CXsqDK2j61xbwDv4mabRipAMceh8j4m/HhTd8v6vVKbM95i7bbAmPuaOjEONeD3rWVP6enyqXdTMlxviU/KDw4uKNpBAMvjixjdpY4FTUciRm9JqLRByQzepHlgqUdIx+PVMKPF5KkiPy53XzlYst2fvHf2W5/U56c57fmeQQDe6PEsyB+T7WB2PzslSA0FPQ6FkTiZrWNSsSMNCdrXur+BKewMzcZQfwT7Nr36U6r1ry5axlD2zIlotCBV1a+U/DqaLIRTy0v7gE8SBa0FUjTme2hIKwXwiyJQl9BxnMZb2LXHZavzPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RoMUdqA2OyqCBybPV0IXzjVbE71UnLKGZ0hGPNA0S5k=;
 b=cblAqmQsOwrsBANtI5IGJPCmQ8iHTSJmL2BcRPNqenS4owKEwpVBIEvkfB/RnHUR/7nKzy/DdS2T/TUcewwg1+mwBr0thYimviq3fB+FnLW0+glaBOedWf8JBhLwDkKQWfs0H240GrrhVwoSq8uH2EhQxoC/BgkOviCA0vy1/mnBRcxGkWXc3xVNC37nZM8Ym7pSuc9p0I6MKiYarxMzDOrgyhH6dHFEJN8ibGOXTLc2yPduSe//oD2t7Y7JFaLkOYY2jmIWiTsc8ge3Bk6ABHV3qJCnKfkJtficiENtiQcSQABjBTIEPglASo9UAFYFR12f8sEUrcmpd4nWgPX1cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RoMUdqA2OyqCBybPV0IXzjVbE71UnLKGZ0hGPNA0S5k=;
 b=LBCCW5WaK4ZYDCdYABhrR1Jf1N4hDQ13k3d6kcNSaz7qOHUWIARIW+nypFNcOvCOi3GPT4mTMHQcfQHBBMdjJrLIa9cd9ST/kG6xmx/BaNpYZtUFmDzmWRn3oxywbD792rkcuscM8J7Ao3lRdRVe8THtbldvbOTy25E1mLwJpgw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB5711.eurprd04.prod.outlook.com (2603:10a6:803:e7::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Fri, 23 Apr
 2021 09:42:33 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::a5f3:fde9:1d85:5f28]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::a5f3:fde9:1d85:5f28%7]) with mapi id 15.20.4065.021; Fri, 23 Apr 2021
 09:42:33 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/3] drm/bridge: nwl-dsi: Get MIPI DSI controller and PHY
 ready in ->mode_set()
Date: Fri, 23 Apr 2021 17:26:43 +0800
Message-Id: <1619170003-4817-4-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619170003-4817-1-git-send-email-victor.liu@nxp.com>
References: <1619170003-4817-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR02CA0181.apcprd02.prod.outlook.com
 (2603:1096:201:21::17) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 HK2PR02CA0181.apcprd02.prod.outlook.com (2603:1096:201:21::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4065.20 via Frontend Transport; Fri, 23 Apr 2021 09:42:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e10bee85-7b80-44f6-1ddc-08d9063c1e82
X-MS-TrafficTypeDiagnostic: VI1PR04MB5711:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5711726248BEBCF9F27B509298459@VI1PR04MB5711.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vZXr0LK96cAE4OfcFwvwY538FulBcuNEiliQlTsB/CEYgae3VnkV+0W3ffQ9doq2QPuXQzNZP6pNEx2uJLnaSuA2tBsYvwl1WM6ztwlQg6ghX7o2NYCR+d9hOlKHLeZ7Rsw+kDu7rCNOtMC2wdp9Qxyl72j8Ygk7uFHUvkbqr0ba0sBa0w3P0AnoXRFWZejciQxITlZR5NV1lahvLyJSL8a6XLSiy0jMMN3amzmSGlOwuJ0rqwOlG7kucJnYtzfCenyWgywlecPge/Cv0WdzWr5J1BOOUXtRAHca377W+AK3tU7ctLvgZMaOHjyF8ZVvsN5oiLn4bwhm1krAEkbsYJuKEUTUay1jKPV7fE5I1bKs4An+HqyiqfJUG4/WIDCZsiSXspG8jYooSvoMEl7uoTJ7Cvj14eprL36i5aKKT04ODSDbyiwNa/uXjQeV+gPKA5J0jS006vapkjN634idVUkoM263PycnE9gAMil5p8f0gnqz62bZBKQLqNPj3EheLWsmBgGCkfjmHIrqODx9JWIpj5wODVDtfcz9YlfeJ1WuZsSddifMlGHXSVtvJ8sRDO3tSXNw1b2cVpY8uJJw6FPUZvTqMZ2XdqyPCfsRdiDpi7rWWmJL0IGvKJ/gpHBwm28RkkSpxyXWK1XaZOwprD4+W6220FGvG8VF62AOAtE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(136003)(366004)(39860400002)(38100700002)(4326008)(8936002)(316002)(83380400001)(6916009)(52116002)(86362001)(6506007)(36756003)(6512007)(186003)(38350700002)(16526019)(66476007)(8676002)(26005)(7416002)(66556008)(66946007)(6486002)(2906002)(956004)(5660300002)(478600001)(6666004)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WEw3c0xkMExSZmxLYVlFYVYrN0lzQ3hwUzN1cEthbUpGcG5WM3RzNkUxRjZt?=
 =?utf-8?B?SStveFJkeXZyaU9Ednk4dEp2UGVRa2d1dEJ0cVVobFE1NzdYNCs1azI5WlF0?=
 =?utf-8?B?UnE2ejN2RCtIcm52am5UODJrRGp2Z0hvczJzZks4MjFKajZlUmRXQjJDM0Vi?=
 =?utf-8?B?NWdyNjIxT2VtTk1pSGxpbTU4Tk9GcmxRTGdZSERzSGo3S0p6djV4clhMajNt?=
 =?utf-8?B?d3BTeGNHeGVsL29iWnB0aXBhc0s5SUczYXpaK0pDaVdoc0p1OWR4ZkplV2JG?=
 =?utf-8?B?MThkbmwvR2RDcnFjSWxkaUVqa3grN2RiV3FCR1Q5QXJVdGlkNGdoM3dOLy9q?=
 =?utf-8?B?dFgwV0NDeTk0bkJpNTZEYmVvWFJqUmlqMGtoLzExSmRDMHRQb0I4eEVFbEVE?=
 =?utf-8?B?MXJ0QStnVC9LSUtySmlhRG50SFpObEQxNDdDSWttY281aHpkby9RUWg5TTJP?=
 =?utf-8?B?aktIbEVEY3BFaGRpT0pqMnkwOGRIakZtMmhXRmpLdGd3U3ZZMWZOUGRWYktB?=
 =?utf-8?B?MmIvdWtMMndJb0tWeS9NU0J3T1FFaXpWWkhkUEViTjFSaW4wSzI5MFJxVDhM?=
 =?utf-8?B?ajVYTXAxSThhaWo2ZEwxM3NYVXl4UUhIb1VucTVsenk3Ly9Lb3dzeVA4NW9B?=
 =?utf-8?B?Wi9ZZVM3QzNSajZrbmU0SGltRTJtK2Z0WEk1eEk1bUQ3ZXR5ME43bXpONlUx?=
 =?utf-8?B?U0VPdlk4MEx1QnRsQkUyeTJZRklZS3FKQ2dRd0FLWXFlK2g4YWRmeG1pTExQ?=
 =?utf-8?B?dWF1TnhZWnlvRmp5dDY0WXplY0VFNzNiYWd4bHd2dGxlb0tlSU1XaEMzdExZ?=
 =?utf-8?B?a0FWaGE1VFc5TExCSFdGT0RzdmRGaURTZDZKRmZPMWk5aDg1M2xHQmFFekpR?=
 =?utf-8?B?RHZIeTBLZHFQZjJLb29JcW9sSHBBWWR1Yk8xNjg3WWk2QUZvU0lWR2JCemg3?=
 =?utf-8?B?NGNuTjhoaEN5bkdTT2ZCSkNvMmphbXhUUThBalBSR0pBU0s4S0dXbE4ybytH?=
 =?utf-8?B?WVJ5UjRNT256NTcwam03aGNNYmdkdS9jQm5vRFl1VmZBYTJvcy83WjhPQU1h?=
 =?utf-8?B?SkR3WGs2eXRnNm8yd0ttWjNWVFZySW5oeW1ZTHZUQWZpcWlIdjJIeUVDZVR5?=
 =?utf-8?B?enpHSkN2UVIzcG1lTHRleTVMUVhPd3JJdmhzZmhGdFFrb2VZbk5Mc3NlNDFP?=
 =?utf-8?B?bmFCQnRmYVpER0Z1T3QzWkZYMi9uMmUyZEpjMGQ3N3RwRENnVGpiSm1CbHNk?=
 =?utf-8?B?NmxOeUt1V2RadXF5YmxjNzZSb01SelVSRHB5biswd1Q0MGdablY1Wm1XWVpB?=
 =?utf-8?B?Wnp1UWdTU3V2Qml6LzJBeGVPa29WZVl0d3VQK2hSdm9CWlZkU05rUnN3RXd4?=
 =?utf-8?B?V0RUQnAyNnFBVVFFb0N4QU4rblZvcDFoV3E5TXkrakxoUnJ6ckVmcHRtRFlF?=
 =?utf-8?B?aklkRVlpWk9LcWNQUjNhb2hZeDRQZWFaNEJIYmY4Tmk0MXI4RUhqQnVVSGhn?=
 =?utf-8?B?aXlPTjJhd1lXaHBpcjZvSnM5R25aM090NGprWm5yeEtlT1JrUHlqVmFpd2g2?=
 =?utf-8?B?ZWhMSFRsa1VKNjN2amRxZStuUXFoTHRjdW9ZOUtBYVF3R2p1VnM0elBwRFln?=
 =?utf-8?B?em1hbExLd0xpUGRUeUIyQmFKb01RUFJYRW42a0k0SW10QXVDNE1CYSs2Z2Y4?=
 =?utf-8?B?VFRPWWovZWw5V2ZDd2RaOUdRMVVXOWl4SkxBZDlVYXpvMHdKZ0ZnU3RyYmcv?=
 =?utf-8?Q?GiwOIuQdyWjqrlEK4fT8GHfQoPfNdky9oTMv/Ha?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e10bee85-7b80-44f6-1ddc-08d9063c1e82
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 09:42:33.0843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RWpxbGv2EKDBVHuFvcwkeyzMFNs+0NoUt3RM7IfvWPuGP8p71nNgI0p80uazx9DpfcMqliqItOvhZ76dsYHaAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5711
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, airlied@linux.ie, agx@sigxcpu.org,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org, robert.foss@linaro.org,
 a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, robert.chiras@nxp.com,
 linux-imx@nxp.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U29tZSBNSVBJIERTSSBwYW5lbCBkcml2ZXJzIGxpa2UgJ3JheWRpdW0scm02ODIwMCcgc2VuZApN
SVBJX0RDU19TRVRfRElTUExBWV9PTiBjb21tYW5kcyBpbiBwYW5lbF9mdW5jcy0+cHJlcGFyZSgp
LCB3aGljaApyZXF1aXJlcyB0aGUgTUlQSSBEU0kgY29udHJvbGxlciBhbmQgUEhZIHRvIGJlIHJl
YWR5IGJlZm9yZWhhbmQuCldpdGhvdXQgdGhpcyBwYXRjaCwgdGhlIG53bC1kc2kgZHJpdmVyIGdl
dHMgdGhlIE1JUEkgRFNJIGNvbnRyb2xsZXIKYW5kIFBIWSByZWFkeSBpbiBicmlkZ2VfZnVuY3Mt
PmF0b21pY19wcmVfZW5hYmxlKCksIHdoaWNoIGhhcHBlbnMgYWZ0ZXIKdGhlIHBhbmVsX2Z1bmNz
LT5wcmVwYXJlKCkuICBTbywgdGhpcyBwYXRjaCBzaGlmdHMgdGhlIGJyaWRnZSBvcGVyYXRpb24K
ZWFsaWVyIGZyb20gYnJpZGdlX2Z1bmNzLT5hdG9taWNfcHJlX2VuYWJsZSgpIHRvIGJyaWRnZV9m
dW5jcy0+bW9kZV9zZXQoKS4KVGhpcyB3YXksIG1vcmUgTUlQSSBEU0kgcGFuZWxzIGNhbiBjb25u
ZWN0IHRvIHRoaXMgbndsLWRzaSBicmlkZ2UuCgpDYzogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBz
YW1zdW5nLmNvbT4KQ2M6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4K
Q2M6IFJvYmVydCBGb3NzIDxyb2JlcnQuZm9zc0BsaW5hcm8ub3JnPgpDYzogTGF1cmVudCBQaW5j
aGFydCA8TGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgpDYzogSm9uYXMgS2FybG1h
biA8am9uYXNAa3dpYm9vLnNlPgpDYzogSmVybmVqIFNrcmFiZWMgPGplcm5lai5za3JhYmVjQHNp
b2wubmV0PgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogR3VpZG8gR8O8bnRoZXIgPGFneEBzaWd4Y3B1Lm9y
Zz4KQ2M6IFJvYmVydCBDaGlyYXMgPHJvYmVydC5jaGlyYXNAbnhwLmNvbT4KQ2M6IE5YUCBMaW51
eCBUZWFtIDxsaW51eC1pbXhAbnhwLmNvbT4KU2lnbmVkLW9mZi1ieTogTGl1IFlpbmcgPHZpY3Rv
ci5saXVAbnhwLmNvbT4KLS0tCnYyLT52MzoKKiBTcGxpdCBzb21lIGNoYW5nZXMgdG8gcGF0Y2gg
MS8zIGFuZCAyLzMsIHRvIGNsYXJpZnkgY2hhbmdlcy4gKE5laWwpCgp2MS0+djI6CiogRml4IGEg
dHlwbyBpbiBjb21taXQgbWVzc2FnZSAtIHMvdW5jaGFuZ2UvdW5jaGFuZ2VkLwoKIGRyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvbndsLWRzaS5jIHwgMjggKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbndsLWRzaS5jIGIvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9ud2wtZHNpLmMKaW5kZXggNjAxY2NjNGE3Y2RjNy4uODczOTk1ZjBhNzQxNiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9ud2wtZHNpLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9ud2wtZHNpLmMKQEAgLTY2Miw3ICs2NjIsNyBAQCBzdGF0aWMgaXJx
cmV0dXJuX3QgbndsX2RzaV9pcnFfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkYXRhKQogCXJldHVy
biBJUlFfSEFORExFRDsKIH0KIAotc3RhdGljIGludCBud2xfZHNpX2VuYWJsZShzdHJ1Y3Qgbnds
X2RzaSAqZHNpKQorc3RhdGljIGludCBud2xfZHNpX21vZGVfc2V0KHN0cnVjdCBud2xfZHNpICpk
c2kpCiB7CiAJc3RydWN0IGRldmljZSAqZGV2ID0gZHNpLT5kZXY7CiAJdW5pb24gcGh5X2NvbmZp
Z3VyZV9vcHRzICpwaHlfY2ZnID0gJmRzaS0+cGh5X2NmZzsKQEAgLTgzNCw3ICs4MzQsMTIgQEAg
c3RhdGljIGludCBud2xfZHNpX2JyaWRnZV9hdG9taWNfY2hlY2soc3RydWN0IGRybV9icmlkZ2Ug
KmJyaWRnZSwKIAlhZGp1c3RlZF9tb2RlLT5mbGFncyB8PSAoRFJNX01PREVfRkxBR19QSFNZTkMg
fCBEUk1fTU9ERV9GTEFHX1BWU1lOQyk7CiAJYWRqdXN0ZWRfbW9kZS0+ZmxhZ3MgJj0gfihEUk1f
TU9ERV9GTEFHX05IU1lOQyB8IERSTV9NT0RFX0ZMQUdfTlZTWU5DKTsKIAotCS8qIERvIGEgZnVs
bCBtb2Rlc2V0IGlmIGNydGNfc3RhdGUtPmFjdGl2ZSBpcyBjaGFuZ2VkIHRvIGJlIHRydWUuICov
CisJLyoKKwkgKiBEbyBhIGZ1bGwgbW9kZXNldCBpZiBjcnRjX3N0YXRlLT5hY3RpdmUgaXMgY2hh
bmdlZCB0byBiZSB0cnVlLgorCSAqIFRoaXMgZW5zdXJlcyBvdXIgLT5tb2RlX3NldCgpIGlzIGNh
bGxlZCB0byBnZXQgdGhlIERTSSBjb250cm9sbGVyCisJICogYW5kIHRoZSBQSFkgcmVhZHkgdG8g
c2VuZCBEQ1MgY29tbWFuZHMsIHdoZW4gb25seSB0aGUgY29ubmVjdG9yJ3MKKwkgKiBEUE1TIGlz
IGJyb3VnaHQgb3V0IG9mICJPZmYiIHN0YXR1cy4KKwkgKi8KIAlpZiAoY3J0Y19zdGF0ZS0+YWN0
aXZlX2NoYW5nZWQgJiYgY3J0Y19zdGF0ZS0+YWN0aXZlKQogCQljcnRjX3N0YXRlLT5tb2RlX2No
YW5nZWQgPSB0cnVlOwogCkBAIC04NjMsMTYgKzg2OCw4IEBAIG53bF9kc2lfYnJpZGdlX21vZGVf
c2V0KHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsCiAKIAltZW1jcHkoJmRzaS0+bW9kZSwgYWRq
dXN0ZWRfbW9kZSwgc2l6ZW9mKGRzaS0+bW9kZSkpOwogCWRybV9tb2RlX2RlYnVnX3ByaW50bW9k
ZWxpbmUoYWRqdXN0ZWRfbW9kZSk7Ci19Ci0KLXN0YXRpYyB2b2lkCi1ud2xfZHNpX2JyaWRnZV9h
dG9taWNfcHJlX2VuYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLAotCQkJCSBzdHJ1Y3Qg
ZHJtX2JyaWRnZV9zdGF0ZSAqb2xkX2JyaWRnZV9zdGF0ZSkKLXsKLQlzdHJ1Y3QgbndsX2RzaSAq
ZHNpID0gYnJpZGdlX3RvX2RzaShicmlkZ2UpOwotCWludCByZXQ7CiAKLQlwbV9ydW50aW1lX2dl
dF9zeW5jKGRzaS0+ZGV2KTsKKwlwbV9ydW50aW1lX2dldF9zeW5jKGRldik7CiAKIAlpZiAoY2xr
X3ByZXBhcmVfZW5hYmxlKGRzaS0+bGNkaWZfY2xrKSA8IDApCiAJCXJldHVybjsKQEAgLTg4Miwy
MiArODc5LDIyIEBAIG53bF9kc2lfYnJpZGdlX2F0b21pY19wcmVfZW5hYmxlKHN0cnVjdCBkcm1f
YnJpZGdlICpicmlkZ2UsCiAJLyogU3RlcCAxIGZyb20gRFNJIHJlc2V0LW91dCBpbnN0cnVjdGlv
bnMgKi8KIAlyZXQgPSByZXNldF9jb250cm9sX2RlYXNzZXJ0KGRzaS0+cnN0X3BjbGspOwogCWlm
IChyZXQgPCAwKSB7Ci0JCURSTV9ERVZfRVJST1IoZHNpLT5kZXYsICJGYWlsZWQgdG8gZGVhc3Nl
cnQgUENMSzogJWRcbiIsIHJldCk7CisJCURSTV9ERVZfRVJST1IoZGV2LCAiRmFpbGVkIHRvIGRl
YXNzZXJ0IFBDTEs6ICVkXG4iLCByZXQpOwogCQlyZXR1cm47CiAJfQogCiAJLyogU3RlcCAyIGZy
b20gRFNJIHJlc2V0LW91dCBpbnN0cnVjdGlvbnMgKi8KLQlud2xfZHNpX2VuYWJsZShkc2kpOwor
CW53bF9kc2lfbW9kZV9zZXQoZHNpKTsKIAogCS8qIFN0ZXAgMyBmcm9tIERTSSByZXNldC1vdXQg
aW5zdHJ1Y3Rpb25zICovCiAJcmV0ID0gcmVzZXRfY29udHJvbF9kZWFzc2VydChkc2ktPnJzdF9l
c2MpOwogCWlmIChyZXQgPCAwKSB7Ci0JCURSTV9ERVZfRVJST1IoZHNpLT5kZXYsICJGYWlsZWQg
dG8gZGVhc3NlcnQgRVNDOiAlZFxuIiwgcmV0KTsKKwkJRFJNX0RFVl9FUlJPUihkZXYsICJGYWls
ZWQgdG8gZGVhc3NlcnQgRVNDOiAlZFxuIiwgcmV0KTsKIAkJcmV0dXJuOwogCX0KIAlyZXQgPSBy
ZXNldF9jb250cm9sX2RlYXNzZXJ0KGRzaS0+cnN0X2J5dGUpOwogCWlmIChyZXQgPCAwKSB7Ci0J
CURSTV9ERVZfRVJST1IoZHNpLT5kZXYsICJGYWlsZWQgdG8gZGVhc3NlcnQgQllURTogJWRcbiIs
IHJldCk7CisJCURSTV9ERVZfRVJST1IoZGV2LCAiRmFpbGVkIHRvIGRlYXNzZXJ0IEJZVEU6ICVk
XG4iLCByZXQpOwogCQlyZXR1cm47CiAJfQogfQpAQCAtOTUzLDcgKzk1MCw2IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgZHJtX2JyaWRnZV9mdW5jcyBud2xfZHNpX2JyaWRnZV9mdW5jcyA9IHsKIAku
YXRvbWljX2Rlc3Ryb3lfc3RhdGUJPSBkcm1fYXRvbWljX2hlbHBlcl9icmlkZ2VfZGVzdHJveV9z
dGF0ZSwKIAkuYXRvbWljX3Jlc2V0CQk9IGRybV9hdG9taWNfaGVscGVyX2JyaWRnZV9yZXNldCwK
IAkuYXRvbWljX2NoZWNrCQk9IG53bF9kc2lfYnJpZGdlX2F0b21pY19jaGVjaywKLQkuYXRvbWlj
X3ByZV9lbmFibGUJPSBud2xfZHNpX2JyaWRnZV9hdG9taWNfcHJlX2VuYWJsZSwKIAkuYXRvbWlj
X2VuYWJsZQkJPSBud2xfZHNpX2JyaWRnZV9hdG9taWNfZW5hYmxlLAogCS5hdG9taWNfZGlzYWJs
ZQkJPSBud2xfZHNpX2JyaWRnZV9hdG9taWNfZGlzYWJsZSwKIAkubW9kZV9zZXQJCT0gbndsX2Rz
aV9icmlkZ2VfbW9kZV9zZXQsCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
