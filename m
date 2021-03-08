Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEA53306BA
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 05:06:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EFC16E2C0;
	Mon,  8 Mar 2021 04:05:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70074.outbound.protection.outlook.com [40.107.7.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75BB36E043
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 04:05:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F7Tn1OZmAPRkG7GQsiLdwfDnzY0/S0a6Ruezr/uVu3sK6jr0UxGHFHrfAlPU140wL/h+RlFtBIYW5S4wHwuYLXLGl+qTI8pq9+/sK5/7GUd+TpaEUsDmp6JnDjiwxbyFjK97IjC93T+Yvuh2S2SyeQQ+gfLy4qh07KNQq2AlFRHGPt5z6LaouxFDBIKZqKMoBJHumJqUlu7sQMNrxQr7kFnRi97DsITrqvQFp7d3SFnYpOglJWOeAF20fNUB1DhELxVlS5Vp3gYnV0PZ8lrsJpslgthqm1tcEolkVskCh8JYojn4eOwKO4cvI7tyLmWTkRK4CIqNyk50SC/2aoSOeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbInIKlOtjX3/3zhPTADoSmdAO/icXL/ZHMPb5qQbSs=;
 b=kSoFYlviz4rFpX8+TZmjknzikW/50am144zLsgR1srTaDXRKUeScFr7K7s/yi6TjpH8Hy1LP3T5k/kIDQjpFrFbof7+NM1E/3DGor02RwBPF+Is4umi8+LKfwRHy3hnEzRQgS5qvat8bCJ4oKyiypvuM4UPCGj58muHoOjK+r8/qFTGC/elQ/UIMq/gjnKmfypKKyjRosAPXPc6B1cXNEHGShO1VCeHI4L4TB/p3ukEtKq0+sq762aXN+M8WCLyB3CwyJ0m8szMBRlc73+RkeNm/EdoyNh7PcJ5Ec6+1lF9BpotJwoxHBweiuZtLZZn5xSnLW8wIfNxRZMBAEweGSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbInIKlOtjX3/3zhPTADoSmdAO/icXL/ZHMPb5qQbSs=;
 b=pkoCK6puUp3doWzUj712VNukFZISV92ZA2jF7SZNTbVIOyV6Vj3lnYKE16TNNxUA5SKZiw9w1UtiAioIat2RiDlZ9E3juYSRv6lYZweyiKLi5pRTkJTrxQSu2mBIEMmqfyUfLANJUzIlMZocPk8wF0Dn/k3bwEn+MwpfUi9XvoA=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB3310.eurprd04.prod.outlook.com (2603:10a6:802:11::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.27; Mon, 8 Mar
 2021 04:05:49 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3912.027; Mon, 8 Mar 2021
 04:05:49 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 1/5] drm/bridge: nwl-dsi: Set PHY mode in nwl_dsi_enable()
Date: Mon,  8 Mar 2021 11:52:17 +0800
Message-Id: <1615175541-29009-2-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615175541-29009-1-git-send-email-victor.liu@nxp.com>
References: <1615175541-29009-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR04CA0088.apcprd04.prod.outlook.com
 (2603:1096:202:15::32) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 HK2PR04CA0088.apcprd04.prod.outlook.com (2603:1096:202:15::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 04:05:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2173e023-d69e-4ab9-42dc-08d8e1e7752d
X-MS-TrafficTypeDiagnostic: VI1PR04MB3310:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB33107A54B8DA9011E342B36398939@VI1PR04MB3310.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nc0oFr73I43rJKLus7DfC9hDZEYU2acT/o8FLanAjubROqcICtK8tVdpDqxhFLRxdTSDkMsn1jEgpulXAXEjrjyTbWqSWyHzWYa4XDz3cLnkVPjMwskI0C7zIK86fDkNe+4EkbFWZm5/p8Vfxe8FkWr79+UqI/ia/NQQRPzcRdOKfLR0x7Bp0ge2lZ8sxyoLEtqMvKmHhDZS+aJeVzffSrlkLAoHwN9hptpCRXqjdpGgoy2vpP/t+CFTsGuyB8tCsSJpFNjCCrGlNAhjYHzKS93wbTDL2e8pT+vZDsJ+U0i07IoW1pQZOaP8miEupum0Xkl2mZHvcQQhcvrniv5GV1Wt/Ml1v1cDbCLOrKyF8UDahvxloQbDOqSQ+G1IqXv+6mRnYuwFaqp72pW46lKEoTk51vktD9P0wR/Axzgrz63AJWG9O+2h6iYCdsK/TVFxHuz8A2OiLgUmdMJ9zgZXXy3KYGieyTA5ja70HMjYIrufYK063QgJa7hXQ40/3mchq5HTgwXqTkHP008GJtVjqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(136003)(396003)(366004)(346002)(66556008)(186003)(16526019)(478600001)(66946007)(2906002)(316002)(66476007)(26005)(5660300002)(52116002)(8936002)(6666004)(6486002)(36756003)(8676002)(6512007)(7416002)(4326008)(956004)(6506007)(2616005)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NFJBSmU1R2JTZ3ZoSjM4ZXpYYmxPcG8wS1U0T205OHo4Vm1wcWxFQ3VuSXMx?=
 =?utf-8?B?alpxcHpWbkVtMENzajM2OURSYTBaNGhCWkVGc2tteVB6SHlFTG8weUQ0TTR3?=
 =?utf-8?B?OFpHTUI4dlhwU21DT0Z2U2hPYkRzbzRsK1FISnM1cXR3aWZxSXhNR2ttMEkz?=
 =?utf-8?B?WE1RaHBCUUlNNzBPcEtqeGtTNUlBYjNmRUtBSndQTDA3bDczN2MvSDhPTFRl?=
 =?utf-8?B?MytoQU1Pc0tCcnZsZ2lsbjZMd1VwT3h6blAvVjhsTmluSXM1Y2taNCtYZFox?=
 =?utf-8?B?T3FPelBqU1dpTWFueml6bzRhRGNQU3J4ajdNcDhGZDVReS9XZkd5YXZ3T1hJ?=
 =?utf-8?B?UUV4elVHeHdFd3owS1hFeHNzVXB4UjJUWXd2SzR0LzY4dy8wYUt0NlVudWcv?=
 =?utf-8?B?djk0Mmw1YUdoczBOai9kOTlTa3RDVWlCeUp3ZVlJYi8wenFxZWo4SGY5aHd1?=
 =?utf-8?B?MEJzKzBUNFg1RytiTmpvYnBpdmpRckp1cGMzbU9ITkJOckJXdVBEZkE1ZmFJ?=
 =?utf-8?B?dW5vOXFQWHF0bWFESjI0Y25ramZqZmJJV1FnV3IxU2s5OWhYRjZweDNTT0ln?=
 =?utf-8?B?V0Q4MXE4a1VIdmluQlhUbFA3RFRDVTMrcGUrc2hSdnd6Q3hSK2lRbTdaN2Ri?=
 =?utf-8?B?dzA0NHlMOFc5WE1zMXVxUEZIU1RMMVNwb1ZZaUlaQUFucEsvOWhBTzdNaXRG?=
 =?utf-8?B?ZkduU0pRb2lsUUhJOWxRUWlpVDFGbkp1d254cWFsR0RITGIrVC9EZ1ZZTE5M?=
 =?utf-8?B?TWlxUlVCVHRoOWVEYnI3aThncW1zSFVwMDZ0b1V0SDZoc0JPZDRjL3JGVWd4?=
 =?utf-8?B?MEZqRFJKRGlLdVVYcW9pOUdNeUUwQTFjWEJscHo5SnROWFhvVUpocjJQZlZT?=
 =?utf-8?B?VmcrNlJhRGhUNVRKS3RGRUI4M0xnQnZpYk9VUi9MMkh1QWVMQm5PR0NFTjla?=
 =?utf-8?B?NTF4cjJad2hRUHFWMC9SUnRZdnV1aHR0R0RqSmF5S2F1UUFsc010NUdib3B0?=
 =?utf-8?B?U2xnTFAyODJvK24zcC9RcGRja3BuSzBQeXU2UWdxdHpNS1lScmU3R1J5SFlE?=
 =?utf-8?B?dEU3YVQ1YTlvT0I1U2lJVVhobnc3ZmtNVmZUOEM4UGFzbDljMlkvYXhmNDQy?=
 =?utf-8?B?ZkJiUGV6RGhOUjdScUx0dXAxZjl0WFZESXB1aEs0M255cmhSSjl0TSsvUDBw?=
 =?utf-8?B?Y0dZUzAyaFUvWWlSTGN5c0pvWHBaRUI2czNnRG9qNm9Ec1plSGxESXgxSzd5?=
 =?utf-8?B?cWlOcWR5RTVVUVlCa09UQTFBVkxOa3lPNWxLTVFsN0FpYnF1YkhTSTJvcWNl?=
 =?utf-8?B?UzFOeC8yMzBCclJtd0s2SXdnckIra3dxajV1cGwzbldaNUpzdjBCQlJ5TjMy?=
 =?utf-8?B?VmlEaW1SNEovQWpDNVF3OXRvMUtxT0cybUhsbkRTLzh3U2dJT3lmU0h0YXBN?=
 =?utf-8?B?cjVTMTN6VXR1Tm9hcUNIcVM3c2xMQ2lNcjhjRTNtRzdlU01FSWpoekE2K2c2?=
 =?utf-8?B?bzMxVy9ScTR1VUVPNk5RQVNZVHV2ejkvTVZaRU9PQXIzUmZaZDlmQXJEdW50?=
 =?utf-8?B?TWNONzZBNUxPam1VbCtHY3lRS25rZjdQMGw4SzN1MENHY296L2pvaXVHNmk1?=
 =?utf-8?B?cnJRdUJmdEpGME5XdSt5cUtuSHRyZlNIaitWcWpRTXRLOGtxV0ZwNktTaVk0?=
 =?utf-8?B?OTFZRENxQm05UXJCa05OT1JpMm9pSlpPQXJ3aEs5c2FlNitLb0tTdDRYRDBY?=
 =?utf-8?Q?jDJ9rw7BNyv15JHjf/mhMsdJ15yW+UwVhe/L0nP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2173e023-d69e-4ab9-42dc-08d8e1e7752d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 04:05:49.4639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9+eSgLRCf9JFYpvGAG2DTNVEwSvV/TD5QPhBWSy5VJR9HCrx6ptOES9ic04sdYX3lToOyhK+Ew9OK2EC/00odg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3310
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
aW5nIDx2aWN0b3IubGl1QG54cC5jb20+Ci0tLQp2My0+djQ6CiogTm8gY2hhbmdlLgoKdjItPnYz
OgoqIE5vIGNoYW5nZS4KCnYxLT52MjoKKiBBZGQgR3VpZG8ncyBSLWIgdGFnLgoKIGRyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvbndsLWRzaS5jIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL253bC1kc2ku
YyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbndsLWRzaS5jCmluZGV4IDY2YjY3NDAuLmJlNmJm
YzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbndsLWRzaS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvbndsLWRzaS5jCkBAIC02NzgsNiArNjc4LDEyIEBAIHN0YXRp
YyBpbnQgbndsX2RzaV9lbmFibGUoc3RydWN0IG53bF9kc2kgKmRzaSkKIAkJcmV0dXJuIHJldDsK
IAl9CiAKKwlyZXQgPSBwaHlfc2V0X21vZGUoZHNpLT5waHksIFBIWV9NT0RFX01JUElfRFBIWSk7
CisJaWYgKHJldCA8IDApIHsKKwkJRFJNX0RFVl9FUlJPUihkZXYsICJGYWlsZWQgdG8gc2V0IERT
SSBwaHkgbW9kZTogJWRcbiIsIHJldCk7CisJCWdvdG8gdW5pbml0X3BoeTsKKwl9CisKIAlyZXQg
PSBwaHlfY29uZmlndXJlKGRzaS0+cGh5LCBwaHlfY2ZnKTsKIAlpZiAocmV0IDwgMCkgewogCQlE
Uk1fREVWX0VSUk9SKGRldiwgIkZhaWxlZCB0byBjb25maWd1cmUgRFNJIHBoeTogJWRcbiIsIHJl
dCk7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
