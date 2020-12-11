Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0620F2D714C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 09:16:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E0D6EC9F;
	Fri, 11 Dec 2020 08:16:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2059.outbound.protection.outlook.com [40.107.20.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A846E817
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 01:54:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TU6syKgUCRG19ZNZch7tCUcwVhvXGhmCL+F3nhzXpZduvkc+HmrGMF3PslgS2YNM2ePKB5Mura3Tl3WElpmLPKoKGEXzsFWW7U0CO+c6xV7zZ3B6sz7fj1uikzisSdBXPSNHczpuwJ/sTxpmQhkRb/taZKnBXy9GUpfED7wPtjhasO/xw03teoheVZ5GGLEP9/+mXst/2+Xz60cBzhHp+A0xMFCNnI29nwHFzfITsV8Mj9+tkFk51zdW4nw/5zNU0apjCmftrcKnDQd9xd4PCm+rc5Se/1k72gVOCG7xe0bIdhlIS6WODr2vY/UR+xZWN+A2vrlmeIVXuHqOn7dngA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7JCMEc2TvZTAAQajmMNmgCYyH/TNXyB8QG4yF7Olg8=;
 b=OEmVrt0eINLSWY3nbtPtJ4RZY6CsxFSaQCV3q2VmcWga79Y9eQMVixkQv8ZNGw61duER4YAJqUQnxFE0ToSBPEPwHIGxAvx2WG1GNUztldJbrSddrIQUjdISQ+qAlONNQ571GF0yWSJ+3tI6L31lODzKRPcweKUb9UciVGwsxyvB1BEFNwOlPZBarsWfprYtFON4oV8JsR9Y9cCVh2J11TENgO5eGOSGTu32t9Kk8WgTpxZBTH/5uHvSdlUx+x/nVG0UZHLYqtrUeDyYNnNNGEexVmg2t/PXF/c8nXeNPRj2gXu1ep4Pw/eKCU9Vs+dfYyKr+7rN7hz11HQsrwHr9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7JCMEc2TvZTAAQajmMNmgCYyH/TNXyB8QG4yF7Olg8=;
 b=XH+DIHrh2wefqYV2uyHiJMlBHigg5nbluj6N535iWAnhS05noRSUDtKWPV/PY9T7kTReI8aVQukZEy5P+aw28MpDjwX9d0emOaThR95oHquQhMmngLAVMxbP0DmwO5Gr3Lj9/kVG6WmcWGx0K8vfza3YA9TB0Q7+0cnwJ0Dj2V4=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB3952.eurprd04.prod.outlook.com (2603:10a6:803:1c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Fri, 11 Dec
 2020 01:54:48 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3632.023; Fri, 11 Dec 2020
 01:54:48 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 1/5] drm/bridge: nwl-dsi: Set PHY mode in nwl_dsi_enable()
Date: Fri, 11 Dec 2020 09:46:18 +0800
Message-Id: <1607651182-12307-2-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607651182-12307-1-git-send-email-victor.liu@nxp.com>
References: <1607651182-12307-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2P153CA0042.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::11)
 To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2P153CA0042.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3676.5 via Frontend Transport; Fri, 11 Dec 2020 01:54:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bc22d55c-db69-412b-3f22-08d89d77bdaa
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3952:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3952992F080F6F5CBC90014598CA0@VI1PR0402MB3952.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YawtK11IMTjcTjvC1VXb+ZtgHyfVT6PktdNPo9O0Ud4iS/5LQukSrpVHMrlZEhS1LJS9juuruQEzvpv2IAX3M4dAzc/mp3bwPCnc8BixbkzLOGgk9C0Px5dpPLAaOMEX2Z7yOuHY+/+VIE71gFPH81Ij4W49aM2yeB/8GZZgq92OYLoHoZJ56K1JXmloeZWaS8FomfZ2wKPXWfrC6+H0PGhfiGHK0vBjr0rixfGoMlbBa23ZneDrRGZNC51lhccsNBNuwQIceeddDe0Jbip2w7u5R6nr5XdPM6tO8FDAmimZOe5YtYdlXgP62Q37J+XaFgE7Yv3gDRmO3+SN6o4K9g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(39860400002)(346002)(366004)(52116002)(316002)(956004)(2616005)(5660300002)(66556008)(4326008)(66476007)(2906002)(66946007)(6512007)(7416002)(8676002)(16526019)(26005)(186003)(8936002)(6486002)(36756003)(478600001)(86362001)(6666004)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K2thcWJqTlFESVQ5b250aTJPVEFaeG5MRzZhbk5DVkk0UG96eTdpYUhGYUV1?=
 =?utf-8?B?YnFwNVVna3RUVkNyNzBsbWVOZmNyWFVacDVXbDEzWnkzVUI0R2t0OTJQdVlF?=
 =?utf-8?B?T1A5MHFhbm4xYTk1UFA3M3BhQk1jd3dYYmFEa05LTHFPa1gxVEFWd3lpcFFt?=
 =?utf-8?B?a1JmaFZsV1dlSEFhQktxSXpEcWFVQUVoZWUvSkRacng0OHdJTzhIN2VxOWRB?=
 =?utf-8?B?MmljUE12SVlxTGEvaEpzdFcraW5TSlp6d1FKa2pjUVZCN3g5aXRHU1RVZDhI?=
 =?utf-8?B?WXJJaFVQN2VpODFPamROaE1UbHFTQ2tJNTlnaEF2cHhiUHNTWFRxUGRlQTRt?=
 =?utf-8?B?djN2R2UxUHN0MVZwMGhWTzhyV0dDaGNOZ1BqRGlxQU5rMTZZbUFUajk4NFp3?=
 =?utf-8?B?dkVEYkpmY0FqMUZMc2RIT0ovQU5IMW5VenpzR0JMVjdqQWZqR1orL0VmVVJP?=
 =?utf-8?B?WjN2U2lNb3NiZmU1TXZZUUUzWnJXVWlrNytMWFZTTS8zc3E4a1FWL2VoV3cx?=
 =?utf-8?B?dVowMDVDcHZSMzZRVTI5SmU0VExxdEQrVHM1RUJQWmVheUIwMG1NdDNPbVdi?=
 =?utf-8?B?djlEelZYalFlRGNzNG1RMlRDWXFtb09nQWFldEJCMWRBSHJza1d5aVNudzBm?=
 =?utf-8?B?a1JZSGw1K3grQjF5SzZTck43Y1FCcVJqNjdlWll3bjFvTmVDS0VqeHhRSnFw?=
 =?utf-8?B?eU9QWlNMTUJrMVl5NHNDS0FJUTJxRmhlbFlwTDZDVW1OaG05UzJhME5TckVj?=
 =?utf-8?B?RGR5OTBreVJabVh1T2g5VzdXbkI1WkZRYVZrUTBYUEMxMzBZN3F1TlUyZXl4?=
 =?utf-8?B?b1NYcHlBYWpjeEtRNFJxQkRBOXVJSyswdzNYaXpPRUxIZHJtRGc0eE84bFdX?=
 =?utf-8?B?N0ZqS0tzVlNYcEF6aW1yZTlhcm05NmhVT0FpSjZhOWI5ekcxa0FWbmRmc3I4?=
 =?utf-8?B?ZGZzR2VrK0xTQ3BYVkRFWXNQUjYwdG5IeWRUU2Z2VHJtUlJpRGVMNklnblVB?=
 =?utf-8?B?ck9oYnFjM0JrSW5pMVdDdGdiajk0eURZSUh5SVZGeXIyUlFaandyVUJUem84?=
 =?utf-8?B?TFlzTE1UakNSTUtiMVFhaEdSUzFES2lVVXgvaTUyelZxa2QrT2I1WFpHNmNx?=
 =?utf-8?B?NVMzNG5xT2tiN1M5MjN6TThXOVZtdE81RHJuY0FnUHFacXV0bzJML1cxcmU1?=
 =?utf-8?B?VjlUbmJNNDRvTUN0YlJFcG5QU1JXUFNMbUNHVW9WOXFmWjJwa0NGczVsb1dB?=
 =?utf-8?B?b2U3eDZqWUJkZTU0dFo0dGliQ1R2SkZXVXpPcitoR0EvSG9ocTExdVI3Ujg3?=
 =?utf-8?Q?cxg076Lc9WZHX8DqWhR7fzrgDWcWwLJL01?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 01:54:47.8846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: bc22d55c-db69-412b-3f22-08d89d77bdaa
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c4Ft0Plr/xtyJRrxoICZ2Z2hTPmf2fhUWDkpSwdc0gLjH5tVHSw1RZLCjVLmzPz2b104fnRoNqpmV0EIauOJxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3952
X-Mailman-Approved-At: Fri, 11 Dec 2020 08:16:08 +0000
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
 jonas@kwiboo.se, kishon@ti.com, a.hajda@samsung.com, vkoul@kernel.org,
 robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com, robert.chiras@nxp.com,
 shawnguo@kernel.org, agx@sigxcpu.org, linux-imx@nxp.com
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
aW5nIDx2aWN0b3IubGl1QG54cC5jb20+Ci0tLQp2Mi0+djM6CiogTm8gY2hhbmdlLgoKdjEtPnYy
OgoqIEFkZCBHdWlkbydzIFItYiB0YWcuCgogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9ud2wtZHNp
LmMgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbndsLWRzaS5jIGIvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9ud2wtZHNpLmMKaW5kZXggNjZiNjc0MC4uYmU2YmZjNSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9ud2wtZHNpLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9u
d2wtZHNpLmMKQEAgLTY3OCw2ICs2NzgsMTIgQEAgc3RhdGljIGludCBud2xfZHNpX2VuYWJsZShz
dHJ1Y3QgbndsX2RzaSAqZHNpKQogCQlyZXR1cm4gcmV0OwogCX0KIAorCXJldCA9IHBoeV9zZXRf
bW9kZShkc2ktPnBoeSwgUEhZX01PREVfTUlQSV9EUEhZKTsKKwlpZiAocmV0IDwgMCkgeworCQlE
Uk1fREVWX0VSUk9SKGRldiwgIkZhaWxlZCB0byBzZXQgRFNJIHBoeSBtb2RlOiAlZFxuIiwgcmV0
KTsKKwkJZ290byB1bmluaXRfcGh5OworCX0KKwogCXJldCA9IHBoeV9jb25maWd1cmUoZHNpLT5w
aHksIHBoeV9jZmcpOwogCWlmIChyZXQgPCAwKSB7CiAJCURSTV9ERVZfRVJST1IoZGV2LCAiRmFp
bGVkIHRvIGNvbmZpZ3VyZSBEU0kgcGh5OiAlZFxuIiwgcmV0KTsKLS0gCjIuNy40CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
