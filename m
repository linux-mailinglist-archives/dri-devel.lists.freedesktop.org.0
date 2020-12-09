Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 131612D3D61
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 09:32:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB2826E22C;
	Wed,  9 Dec 2020 08:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2043.outbound.protection.outlook.com [40.107.20.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC626E10C
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 06:33:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XwQO1CKPzb7TuDFr6kt6z2WI7orcNRKOLxmQQ8aths1IxZDGkl2nkUDmXPMq6IelS0CobEDOEaydk4Ye2m8I/1YDxKU/IPdGiEqjhGoiJ5UW+J1DbZlvBpSr2y9BcAq5huzwLtQ4/D161LNZbEv4y7NeYde0U2dgFlgppspHkMoQUxegruKI11e832eSn9ir5ZGFWxFQO9XiXuIkxJZLfkUaPrPqvmx4prJPnDRIT4k9xfYPbaRn3g48DAGdpTO8cim927FgWNwhAtwX1E3Fly5awQmPP06rPzRI+T+almhIdXJg+Z5TX8D82fgJ/BmFzP94UqRuAKh3dOmxUWSPRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lG1zJgoDHOPeXa0tD82qWzRQ8c/TDnK/mnh4zsxzewo=;
 b=A5b7x6Hnjm43eXc7HI3oAg4zuX1umLhgKvlkV3w2fpXB5s2b5fEn6o5/8/GrHXutn3qPTIy7Q/hRJaKs3ZTtMjP5z2ZuMMTdFCUkwMjo8VviIE9nTSooGgctaFoafOJ2v1GZb8TmpHSE1t0c/bUJwxTRojy8hKdsRXZ3MDqLFHxfq6S8BbkuyU3J68IYXrAaG1rx/ntzeqh8Z34SkgS8fo8Y66GGXoz2gc1CVNtFnN7PujKwDJkfAdfwuLAc2jus2AYuaIjYe5XdT60i5xPOV1nyXT3NE1YFODXs+oPt6ArnKujewA95DmEqP/mDYdwxO1MZe5DbFVzmVNDcDX9eTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lG1zJgoDHOPeXa0tD82qWzRQ8c/TDnK/mnh4zsxzewo=;
 b=G8ysRQNhUPf5jZQD61MUEmiyW02ryZNOEodYL03KhKC4elQTLOmhw37y15+TvNHVTxR+H7ntJhyNdMgljmNqbckWnBmF5XdTh9GpHH6NUq7dOjT83MVA2Cdf1tk1JX8BDAJRovDZ+9VOti1/nSvQDvOTfX73/XYONcS8bkWUVpo=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB6144.eurprd04.prod.outlook.com (2603:10a6:803:fd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Wed, 9 Dec
 2020 06:32:59 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3632.023; Wed, 9 Dec 2020
 06:32:59 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/5] drm/bridge: nwl-dsi: Set PHY mode in nwl_dsi_enable()
Date: Wed,  9 Dec 2020 14:24:24 +0800
Message-Id: <1607495069-10946-2-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607495069-10946-1-git-send-email-victor.liu@nxp.com>
References: <1607495069-10946-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0148.apcprd06.prod.outlook.com
 (2603:1096:1:1f::26) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR06CA0148.apcprd06.prod.outlook.com (2603:1096:1:1f::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3654.12 via Frontend Transport; Wed, 9 Dec 2020 06:32:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 791e4ddb-fc67-4224-9422-08d89c0c457c
X-MS-TrafficTypeDiagnostic: VI1PR04MB6144:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB6144E4885C286FB9678D657498CC0@VI1PR04MB6144.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KZFgGssoxvMYJwGnrUmeYGO/HtvlTK6lZyMzcJKp+yD50ZyUXZ0ZydPZW3WDuhnuyjug/0Ej2fXxvINO0yhdb8m+rW3T1esraWtjpkU+nGnueaWizWTkU0+a+wrnAQMDpjkP0O9LUT9MR7b5nKx964/lGLv6RCZ5bVV7MqXgkoqMRapYkUrMBOYqhkxfZyAq9racUGmz9Hjw7z4sWvjt/mOGvMPlLSHoCU3azXUZ3VII/LYkeRcWA6aFKI8Hh8U7NHoRh7XmM3vVxpQU3smuv5ZiZhyyCpiee+HDS5eitecCBeFC6WLmCMTy1nBZlo+sRGDtpEcWiIrwLE3eJBLdaludY541ozSGG5Ni1kRLPNE4DOX2XqkNQL3iuqZJV/B9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(376002)(2616005)(26005)(52116002)(5660300002)(186003)(16526019)(34490700003)(8936002)(8676002)(6486002)(6666004)(66476007)(2906002)(7416002)(956004)(36756003)(6512007)(508600001)(66946007)(4326008)(6506007)(86362001)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YTAyVGdhc1dVYUVKT05jVFY1YzhJMjRPSjN2allhTkNVZGluVEQ5QTY1UkJt?=
 =?utf-8?B?UE82cXdVQmt1WitFL0xNNS9RRnBCUW81SHowM1NlUWJqSTB1NXpsajdSZ0lx?=
 =?utf-8?B?cVFBR3hpT2M0blJDejR2OTBReFhrTDNVUW5pclZvNTRwVGtHcmErRzZRQ0JZ?=
 =?utf-8?B?VGpoWlVkYnBFdGQ5dVVDOGl4djdjWTBycjdVZElRV1RNaW9LMk0zUmoxZ042?=
 =?utf-8?B?VDgrNGw5MytNSjIrUU9MUlUyK1JTS3FramFWT2EyMFhGNzNZMUlXK0RFWFk1?=
 =?utf-8?B?WENUdlZuK3pRamtBOUhPbjZWZzgyd3FKelZUb2VHODJoSm9tOW40T0F5bUs5?=
 =?utf-8?B?M21tTGFNWitlYkRkYjJVRzEyaDZrUjZzSHBqaWVpV0dJdGNGVUNUY0h6TzlB?=
 =?utf-8?B?bG50dXkyNkgrU2RhemdmZXV6Nm42M04zam5ITHZOaWpUZ3Zvc1ZXekVFOEtj?=
 =?utf-8?B?NzBNTjNxdWg2V1FlMlREZnc1ME1qNlI3eFczemdhWmhzZWtYU3hreVJlVXBY?=
 =?utf-8?B?UHo4UDhuNGF2dFNocE1XQWxmNTk3eXpNM3YrVzFIRWRQcjc0b1hxTTBQOGdy?=
 =?utf-8?B?MXRIWXJqSjV6ZlVjemszeTY5NnNjQUwvZXlzZ3c1dHNtZDNJMVorWFdValdH?=
 =?utf-8?B?UEtvWEhtQXpyTWp0c0lVbzlwOWxhQUs3L0x3ZTNDdDlpVXJXWkFlZE1VQ245?=
 =?utf-8?B?cGxYeFJzYlZKcnVlVXpUSjgwYlpjdXJHK3BoWS9aYllmUzByNUE5cjNDWHk1?=
 =?utf-8?B?bEpLYk1VR25zSU5mcUlsR0tzdmU5N2s5NHBEYnlWUGoyWnFINitNTmlpN2dv?=
 =?utf-8?B?S0ZqV2RpQ1lzRUF3VnBDbEFhMWdRQWc5YloxMXZFQUxsUFJkbTk1ZkdscVNj?=
 =?utf-8?B?Q2tmZFJmV0tVRVM2bUx5Wk15NENzWE91NlZ0MkVmZHJ3S05DTi9hSWpHa0h2?=
 =?utf-8?B?K0VXRmJtZGV6c21DTDZzNkkxSEhjMy91YnVyVEpmak1IUkVuTEdHdjYvL3oz?=
 =?utf-8?B?aVZJb2Y2L01iYVIvWGxLanAyRVN4YnFWaGhOQkpQekxIcTJCaldWOWRSejdk?=
 =?utf-8?B?cmdZNEFWZ0ZaWFo0c2tTZW1UWEcwOEs4aFR4ZzRtbnpUalo3TjFFUnVVNDQ0?=
 =?utf-8?B?SzZqSHVvQ0lMRE9ONXoxSkRNU3lGNHAvNzRnMlNKazdRWnhQWmN4S2h5MnVV?=
 =?utf-8?B?R0oxSUtZQzBTTVNzSk9NNFdUS1FJZWtZVzJjSkdMbFlyV1kwcXNyL3I2N3R1?=
 =?utf-8?B?SGtkeHFkM0RRS1dPckYyYTExRW43OEwvSHEvZFg5SEgyRDIrbDZmNXdCUVh2?=
 =?utf-8?Q?SvAeUQESHl+GmkRak9ts4ZA+9V6Pd5gaxC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 06:32:59.0499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 791e4ddb-fc67-4224-9422-08d89c0c457c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L8Rx8kTRN613DoWxiiy7aIadLWU+pf3rxCm3DD7sO0Kzrz3iVgM7zMuMqxGUU0/etJNZdsfzEY0QziJDnK2Qdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6144
X-Mailman-Approved-At: Wed, 09 Dec 2020 08:32:01 +0000
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
aW5nIDx2aWN0b3IubGl1QG54cC5jb20+Ci0tLQp2MS0+djI6CiogQWRkIEd1aWRvJ3MgUi1iIHRh
Zy4KCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL253bC1kc2kuYyB8IDYgKysrKysrCiAxIGZpbGUg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9ud2wtZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL253bC1kc2kuYwppbmRleCA2
NmI2NzQwLi5iZTZiZmM1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL253bC1k
c2kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL253bC1kc2kuYwpAQCAtNjc4LDYgKzY3
OCwxMiBAQCBzdGF0aWMgaW50IG53bF9kc2lfZW5hYmxlKHN0cnVjdCBud2xfZHNpICpkc2kpCiAJ
CXJldHVybiByZXQ7CiAJfQogCisJcmV0ID0gcGh5X3NldF9tb2RlKGRzaS0+cGh5LCBQSFlfTU9E
RV9NSVBJX0RQSFkpOworCWlmIChyZXQgPCAwKSB7CisJCURSTV9ERVZfRVJST1IoZGV2LCAiRmFp
bGVkIHRvIHNldCBEU0kgcGh5IG1vZGU6ICVkXG4iLCByZXQpOworCQlnb3RvIHVuaW5pdF9waHk7
CisJfQorCiAJcmV0ID0gcGh5X2NvbmZpZ3VyZShkc2ktPnBoeSwgcGh5X2NmZyk7CiAJaWYgKHJl
dCA8IDApIHsKIAkJRFJNX0RFVl9FUlJPUihkZXYsICJGYWlsZWQgdG8gY29uZmlndXJlIERTSSBw
aHk6ICVkXG4iLCByZXQpOwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
