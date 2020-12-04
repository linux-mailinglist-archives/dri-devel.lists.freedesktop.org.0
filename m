Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E55BB2CE9C7
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:34:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044F96E138;
	Fri,  4 Dec 2020 08:33:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00070.outbound.protection.outlook.com [40.107.0.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F09D6E133
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 07:42:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nBIL0Cubgkm8+dmxOMubxLQdy3CQhIJF9AMLxEiZHgJKRWxpzVfrghNk3fEGJkqRX0jW6iBiAn0tgfFcLDDhay4E1qipgWIWCB84XGIVL4C/1BAO4VMFySAkryfEz6P3TH/V+rXEcj6AeN0jlAzegvTEA2A8rJKtPKPToCG+uKPE+JFdUwI6rouzdQA03jMm38yMqDqRmShTd/umQFnqJLyQoZTXsgd9x+/0kcryR33shKco2SrkH9bhr8WbMuDQJ5UKntk/ZJYon+rD0CEyNOhPenjnRQyfITFCA32gbi8ygzwtlhO/TrMwNBNj7OMHjibJW44b/zCIP4VdcVIViw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0GY+mPBR68leo2+CVA8zk7THF2LYgIVwEjfNNPnFlpo=;
 b=mSE0LAn2hWf2IEinQhFbJyBtkXkL/o6HakIxHpkBEE7tD9fLPJJrhfJsP3MXTit6Iem8adVrt1adJgFIrClhn8OIe0YJSrlo6ZD6ttMu9govIk9PrxaFdUnzZUtCkHfhDA6Hpk7gaLgTp4sRsp+Of0jkUguM98PaEDbgmNoXp2iK8iXNbqFHkzHH0C4WYKzXjTJTvgbaK73QRN7hYVcrcUKT7ORHueqk8muoohOCg8MFw5ZWfTETTHQZujh1+TIBckn3QSQmslLiCIHxjxow9SG0UglTwl16M1qS2TsnkG0IS/CQE10KCd/6dAhGgssXIY+45zbm2pPK+X6InA7xHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0GY+mPBR68leo2+CVA8zk7THF2LYgIVwEjfNNPnFlpo=;
 b=gND8LVV8q14yXv23uyG8TYoD7bQoSjNZRRA2XWl9yQMgQZUXI+mITqvMFTahwyG/ZyvfgFrwM6NSXt1V+pvEuvYF7RKNR4Eyq5lOU5uiEDzVDC5NU+4PNgx+x4idzlaWoUgsPvkf39SrBKYHRUiGdxb7EMUliz5Rm1eSknAEIoU=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB3421.eurprd04.prod.outlook.com (2603:10a6:803:5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Fri, 4 Dec
 2020 07:42:07 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3611.025; Fri, 4 Dec 2020
 07:42:07 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/4] drm/bridge: nwl-dsi: Set PHY mode in nwl_dsi_enable()
Date: Fri,  4 Dec 2020 15:33:41 +0800
Message-Id: <1607067224-15616-2-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607067224-15616-1-git-send-email-victor.liu@nxp.com>
References: <1607067224-15616-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0098.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::24) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR01CA0098.apcprd01.prod.exchangelabs.com (2603:1096:3:15::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3632.17 via Frontend
 Transport; Fri, 4 Dec 2020 07:42:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: db29b7c2-516d-419c-12f6-08d8982819d7
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3421:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3421CB61935A70BBFE126EE598F10@VI1PR0402MB3421.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /0+Yjp6pbosezozu9svnkWtxsc38PFDPxKhweML4r2T3abEK9+sLTf+1AdqpuODnc2n5Nv2q21HbnuoNMZQJ/qLu1S6SnRSe/yDCC/55ZJ9CrJrG2kN3AJiP2F51JHxaTwTPRoq3HTMQXUSuQq9gyoY7I8qnhyJSva7oK1owGPrA6rKbaP/HHNHT7zaaoi7k+63iSXOY7qX3P5mWKXh4J7KuVg9LA5MZOOOwe/vsNl2Omut2A9qCSBOfBO+Ntss9snnQ+nOCZ5xx+4PduPO/L7pBWm1rJBMjgD0hHz6UwakPM9KvZ3Zw75XYcVo6Tu4lklisyIwya2Uld9mi+Hgh2g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(4326008)(66556008)(6512007)(66476007)(66946007)(316002)(8676002)(36756003)(7416002)(2906002)(86362001)(6486002)(8936002)(26005)(186003)(52116002)(16526019)(2616005)(956004)(478600001)(6666004)(5660300002)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WGFSSGlucnFQR0hCQjN4RVVhbHBnVXdEL3c0SityUGRqYXk0K0RGV0Q3Mmpy?=
 =?utf-8?B?ekN5VDdiZlR6MmdpeFMycGdkc2dEK241UTVBWE54aW55QmxhQS8rTFFETFVZ?=
 =?utf-8?B?b2t4N0c0WmFmbkZwd2M4d3ltZzBmejdBdUp6cGo5bkZheUphaEV0dVhKRGJ3?=
 =?utf-8?B?THNldDdqRjU2eFdIVXVnRDl2VFN2RXB0WkxUR2V6VENaSGRuNkRrYnZTOUF3?=
 =?utf-8?B?Q0lxS2phVnJzK09aQTVlODZ1bSs0WlFRN0dLajFZNFFxQkp5OG81djdiSnRN?=
 =?utf-8?B?NHM1NUZ6NTFtTzNiM0JXK0loZnI5WVU4VXk3UVc1eUFsV0xMTUZscWgzbkQ1?=
 =?utf-8?B?K0ZiaG1LbTBXZG1KKzhqUEZDcC84MUNkUmRjSkRxdWJUWHM0d3VtZS92dDZP?=
 =?utf-8?B?RTdnS2JKZnlyUVMybE9uUU5oNDdzQjhGZTMwbjAwSW1GTjBQTUo3eFNNUFFi?=
 =?utf-8?B?TTJTNUVGQ0k4TmpFWDdDSGtTaGRkekR0OFdhcEY1RDRjZWtFWG5uTWZqa1Y4?=
 =?utf-8?B?Y0FtWkhvWU5CRWZabUt6TG5XRXhBZzBSakd5a2tNWmNZU3NJeVkxRFh0Y1Va?=
 =?utf-8?B?djRRelBOUU9HZE5XYTJVd0J3TElqemVkL3pOdzBJdzlCVHB3SEpDZFY4dlZP?=
 =?utf-8?B?aytOcW13WFEzWVREa2hJM2trVklYRkFnZWNuUndueWkrU1QzSi81NW9ubjNT?=
 =?utf-8?B?Z1pLOENiTG1IK0pwSWtFc3NUS0ZJM2FmWWlrMHBsWjg2M3AzM3pNVnBYQkZX?=
 =?utf-8?B?ZVcrTUVQUXpQaWd6TnlMNzRQOE1XNEZRUUhVWVVleEs2eEswa2pxdHpjbnlk?=
 =?utf-8?B?eFRzVzVEZ09NcFRlWVlDT1hzRzYxSExCM2xTazVBelFNdTNpcHFUUXVzb1kx?=
 =?utf-8?B?KzVTeERsTXFDVnE0MG94ejBDemg3L1pMOEw4OVN0bUYydjhIWGhNanVwSDlO?=
 =?utf-8?B?cEFmSllIdVloMVRibmRxVUZWQ2pNZjZQa1ZJYXl2MDlKZmdYTzUwc3Nieldt?=
 =?utf-8?B?elVGRDhubE40VEV4UzJCckVzYnJPL01PVEtVYjBKQ1JleHl5cEhTcU9MKy9W?=
 =?utf-8?B?ZjliQW5UTjhCSGlmek96NVk3VUp5MkVIYnNjbUl5SS9oZzJJR3RsYkNmdElX?=
 =?utf-8?B?M1hFV3FmbklmSFEvTGxDaDZIZWwwVnNzamxmYTZJczhqSlRDMTZZQkdTL0k0?=
 =?utf-8?B?Tyt3Rkt2RkRWTGIvM0FMNnpTYWhxZVRub2ZiZnZ3WWMrNnFkdVNNL09qdlFB?=
 =?utf-8?B?cGVhUFYyNEswc2RrR2liSnpxOEpiY0VGZkdoZllEZFk2RWplaDdpT25yejhM?=
 =?utf-8?Q?ULsbalJswdfFlcwdwFj+8bNqKDkdiNdNjG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db29b7c2-516d-419c-12f6-08d8982819d7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2020 07:42:07.5692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9xf7cy49ghIJzeGKpo9WfZIqKjKirSnTbumzD9Xt0a43mYesV3mn+snEM8rGIPA8h3uVZw+QNvgKmdsgh7kv/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3421
X-Mailman-Approved-At: Fri, 04 Dec 2020 08:33:33 +0000
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
ZndsbC5jaD4KQ2M6IE5YUCBMaW51eCBUZWFtIDxsaW51eC1pbXhAbnhwLmNvbT4KU2lnbmVkLW9m
Zi1ieTogTGl1IFlpbmcgPHZpY3Rvci5saXVAbnhwLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL253bC1kc2kuYyB8IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9ud2wtZHNpLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL253bC1kc2kuYwppbmRleCA2NmI2NzQwLi5iZTZiZmM1IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL253bC1kc2kuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL253bC1kc2kuYwpAQCAtNjc4LDYgKzY3OCwxMiBAQCBzdGF0aWMgaW50IG53
bF9kc2lfZW5hYmxlKHN0cnVjdCBud2xfZHNpICpkc2kpCiAJCXJldHVybiByZXQ7CiAJfQogCisJ
cmV0ID0gcGh5X3NldF9tb2RlKGRzaS0+cGh5LCBQSFlfTU9ERV9NSVBJX0RQSFkpOworCWlmIChy
ZXQgPCAwKSB7CisJCURSTV9ERVZfRVJST1IoZGV2LCAiRmFpbGVkIHRvIHNldCBEU0kgcGh5IG1v
ZGU6ICVkXG4iLCByZXQpOworCQlnb3RvIHVuaW5pdF9waHk7CisJfQorCiAJcmV0ID0gcGh5X2Nv
bmZpZ3VyZShkc2ktPnBoeSwgcGh5X2NmZyk7CiAJaWYgKHJldCA8IDApIHsKIAkJRFJNX0RFVl9F
UlJPUihkZXYsICJGYWlsZWQgdG8gY29uZmlndXJlIERTSSBwaHk6ICVkXG4iLCByZXQpOwotLSAK
Mi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
