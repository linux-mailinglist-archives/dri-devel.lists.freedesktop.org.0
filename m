Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C6B2A8047
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 15:02:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C0E66ED83;
	Thu,  5 Nov 2020 14:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60087.outbound.protection.outlook.com [40.107.6.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A08FA6ED7C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 14:02:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NxH0gfC9vZIyDcjF8xl+vaof6X4pTeXHXnCIYR91ODkD/E9lkAxXc0yPd2oonFVLIkXHeJI5SpUH5f0R+xrGAWx04EE8YAtU4/29r9ajEUmItDWerlepOgjgjNHPdU6xtWz/UwiQiK7t8I4qH8PmntKnswdTYw9BPONzxQ2A6cVBWv1Yy9X5BVXswHAfLpJPz9ywOvE5sY5raja8QbckbIt6zD5dMlD/WLqnhlCd/jZz0dEGCs/c8A4jm/HqRL2BfLn7xaxuEfCH17VQB2qBG6FpqfI1XuP+g30HDyJCn6FnrHt9pUfQIs/fwXCwGolsepMZO3toEL7PYE53u9sJ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=prET9u9QSJm4qrev/Qz6IyHePSTHaneCZT3oG0PJgZE=;
 b=Hn6/tDS5pwy/CDtnB5QZnEPDUHV3Mc/A6YfeG9qw39+CBLA5k+t+0flh7Ml7uNfhF5GpXvfwB7rNBKLmCyL+9PXx3oyxNqO1nCewauW1DGriRUqieOG8RPYfcfRbMFVXFVgIiQygu2p8x8VIpSa8WaDGFAp0VjDwimExWGWxKWA2gpd3Md9pszBUa5pJxkprz0JJcH744PCThD5WfCQE6+6/5WJfVapoh7jRuvy0eAG0heQcXveI+HT+V62i/jRTI2XafjqRWiov7vZzv5YDZ5a9NAKoAZ+lPSkPOU4gJfzAOuhSURgu0gMO0fqQXqTEn9xG6FZkeyBpslGOgCxviQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=prET9u9QSJm4qrev/Qz6IyHePSTHaneCZT3oG0PJgZE=;
 b=ji/pxpNT4JPegW3UFxLSgL4O+LEHdTmrXzkKZHZZIoO5ENcL5YQk7W1OrjzG/6KZILMtnK52Uet+nlCYnHnt8drMRKdnPnmcnMsj+vzQz/JgZxyf0ChxlDaeGFC5UzeiTFW5OH+SrczhX5ihyOVoOKVXHZfTPvwryuPajO+heE4=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none; pengutronix.de; dmarc=none action=none header.from=oss.nxp.com; 
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR04MB6783.eurprd04.prod.outlook.com
 (2603:10a6:803:130::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Thu, 5 Nov
 2020 14:01:59 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::f000:d709:509:bb5]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::f000:d709:509:bb5%3]) with mapi id 15.20.3499.032; Thu, 5 Nov 2020
 14:01:59 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@nxp.com>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] drm/imx/dcss: a couple of fixes
Date: Thu,  5 Nov 2020 16:01:24 +0200
Message-Id: <20201105140127.25249-1-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-ClientProxiedBy: AM3PR07CA0084.eurprd07.prod.outlook.com
 (2603:10a6:207:6::18) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141.ea.freescale.net (83.217.231.2) by
 AM3PR07CA0084.eurprd07.prod.outlook.com (2603:10a6:207:6::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.15 via Frontend Transport; Thu, 5 Nov 2020 14:01:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e77c3a5a-01f1-4b8f-b50a-08d881935d18
X-MS-TrafficTypeDiagnostic: VI1PR04MB6783:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB67832958FEAF0FAEA723FEDABEEE0@VI1PR04MB6783.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fPlo55nXm5hKn8kRQwkD4khduj0i4Ooe2bq6J0vnq7s61I/9LY0j2YJOPZNQJZhLH52GKAnI3F+sfjWxuQIb9vfq/fUNIdErJVgBA9MoPy0UYFDG12MkkuPs1o7j+VG8AOgXTDQgxPg4l6GdyslAnSfnKrpLE0EuWLofUN642ot3Pb1ys1hoivBZ+MeuMwVI/j6SHDkafP9GJUw6EdBTJ9+iGbxnHxoewuaLMjz2bkM4R1ygKzPETy4pooFtXWUA79x35hyK0GLpt0JNvS5gNdpMIm0G1F5c2xgJJVOqLqH9rKhGzfXfAWzszLugymyxp8dj2ORYNshjBgwBCiyfsg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(8676002)(4744005)(2616005)(956004)(6512007)(44832011)(83380400001)(6666004)(8936002)(66946007)(2906002)(6486002)(66476007)(66556008)(316002)(52116002)(86362001)(478600001)(5660300002)(1076003)(6506007)(186003)(26005)(16526019)(110136005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: XZlNfUMAXf+RN7OtNYJ/ISscZgHhyyI0sgJoALocN2c9wtAiU5Ity4u4K+x8EvLUTYeVS6HE1Sw2g9EpD5YNVCT/U7bLAj/NqM7xG+f8yFsNkr5GRc7yIFoU0mT6Rb3ARimrtTgZSlGwfjKCaKYtgMJdNlKV5nEZ2Vri6PJOykquwFJnttipQ+oF32OID5EvjLk12lZqsbGvdS6pvqJiyO0A0M2TlODFJA1KyjIAR4AMjCcfeTX8aNBFduQXtwWsJ2Ih5IeB6arq8KLT11S0HEsTD2R4b0fQUsuZJUX25TVSW2hStIGRFGMoZ3MglpxNrZLV8TGzKdcWnY+9KNdgfe0Y+yhaqjn6LlpxhPafQGI4LaPCpVnuKdPCtvJrxfiJ3ZlV0Rsl9XFzjMPazkGhvAP6ObWRGNDmlTiKxHrnhadZRx//4KWRHqMplfYJhGo5ODcs7W/qaKVBritkQFWJ7mzVFol3y5BtI1wpHrtiiCSRCqEz95/USHAd7OR2Pzs5G40KFCrJdSxM7IGhqACb+6JO8eLVgIqcogZ79Vip/LGYZMaO3enylduYbp40uGJIapkWtx2pOLnzr4YRAmFAZLuTSNv9MLADs6QaaOZrgjRLLHuDLlcFaBQAPu90cw+AXnF5rfuab4F4rzRcToEypg==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e77c3a5a-01f1-4b8f-b50a-08d881935d18
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2020 14:01:59.8759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eV8dc5xEkp/piZRhflqRYm2Uk01fHI2WdKFdXicbNqa2ydl/ZfQX5H5iqScQ+raLBykNXBBOwhdh4mUcSUyHgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6783
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This patchset fixes 90/270 rotations for Vivante tiled and super-tiled
formats and a Coccinelle warning.

Thanks,
laurentiu

Laurentiu Palcu (2):
  drm/imx/dcss: fix rotations for Vivante tiled formats
  drm/imx/dcss: fix coccinelle warning

 drivers/gpu/drm/imx/dcss/dcss-plane.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
