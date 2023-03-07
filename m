Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A684D6AE75D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 17:54:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BCB10E150;
	Tue,  7 Mar 2023 16:54:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04olkn2062.outbound.protection.outlook.com [40.92.74.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C307C10E64E
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 16:45:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kkcGxM0ENISEyfiPeQvHhbbNkeOZNlajCFUb6+xz2mszyhiIFiEWI+1KdOR7Nmo9paK/EBVe2A09UhcrelkLVo8CvuMuT9SvZJgTz2DdVCKs5UukYomCtdTPlYypJw3EdrJjrduSmxku4JZoCg+G72m6jvpGH0U3WgidxKRJFLn50uvAmCiiu/izqLWJuQm4L15qQ3PzvocgwvBV1AN5Gd4g5LzNQ+Wwq37jWHvaFkETeWjhozq728C7pELE5Y80bf9Txi+B/dAwk/6q3N9tgHj/2kW2v6OybFVl6lbSGBI6OdIDjREfnqeF7R6jmc4yWVv9jsBhr+30EwYOJktDjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4DCV1DbP4RHa3FGhSxHbIO5PK2hvaIKDtVAi0nMBXto=;
 b=D6UTnid/xGoQb2OQvnzIdFi11w5t4s8L3UI7KOA84WbxSi7EisH2LoeNA9Sfl/m/LXtIHvUoZPmppr3FD5d4fdRaKGBbW+QBOH9fFdkiFxtL90fXNGxpjvCdjeov8t3q8UYu9i6li3DO7R4zkgqxb+MJfTDb1io4M2eRJbfv2O1VQp5EKnOR+JDwyWkGHXhvveACJh78Ih8a2lF+uH6HTX7PUeg6S1fhiaJiyHokFmWUZzffzHH4jjogBt3bdEICvaQ/LWUMOdSobVfo16CFT09tjxb6zdVwa3dFKviEi58RgHaH9uI75L/HAqp0nuaPnRW0KxOt3l21W6emIcBFMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4DCV1DbP4RHa3FGhSxHbIO5PK2hvaIKDtVAi0nMBXto=;
 b=rkrrzWBAf9RntVI0t7CNrjEgeLFC5DUE/CCjBw1cNqEOVsX4WPYbEK8H4KupN0vbb7rd9tM9dmotr11TSCRZlOeQUf1Fohc8AeOd/bcv0kCrUyd1F2L689lavhyK3lXRGO06nODEY+wNFIfrhPPME6BI5pJMwOUOMe1rGt+YMqfqmRS2BUeqaeFeVZh0w6nUVexkIxUP7CZQyPhhkJKJ/gLciz+4ixqDOghoHGc+U9Zdqiz7uYiPPnHcZ3c5kK60IYnwy9/4hpfzu7OLQvu1gTRfshDCr3lCqZS3Wcg2oupfCH/ZVdMxYoDsakeznWuv1NXgXL3yoW5z2XphPGec/g==
Received: from DB6P189MB0568.EURP189.PROD.OUTLOOK.COM (2603:10a6:6:31::16) by
 DU0P189MB2201.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3ee::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.27; Tue, 7 Mar 2023 16:45:24 +0000
Received: from DB6P189MB0568.EURP189.PROD.OUTLOOK.COM
 ([fe80::325a:fba5:af4e:4484]) by DB6P189MB0568.EURP189.PROD.OUTLOOK.COM
 ([fe80::325a:fba5:af4e:4484%7]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 16:45:24 +0000
From: David Binderman <dcb314@hotmail.com>
To: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "rfoss@kernel.org"
 <rfoss@kernel.org>, "Laurent.pinchart@ideasonboard.com"
 <Laurent.pinchart@ideasonboard.com>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: drivers/gpu/drm/bridge/fsl-ldb.c:101: possible loss of information.
Thread-Topic: drivers/gpu/drm/bridge/fsl-ldb.c:101: possible loss of
 information.
Thread-Index: AQHZUROWy83Z6Qqx6EKYMWjImUxUIA==
Date: Tue, 7 Mar 2023 16:45:24 +0000
Message-ID: <DB6P189MB0568FCA97758B820EAC036989CB79@DB6P189MB0568.EURP189.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [bGlcbavkRP0QOHREDjtmiHPmNXXYYqDj]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6P189MB0568:EE_|DU0P189MB2201:EE_
x-ms-office365-filtering-correlation-id: 6479f4e2-e538-4f34-0bdd-08db1f2b5937
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sVbr/6hJpObsx0qSsjy4Z7Opcr3F8SCrelthxZDc7eqJSpmT9LkrlSz7O3MZARgF+OZLzSoiiDW/b+lOGqozgKG+CtvC2k6C8l+5+k7RKLYRmjE7kZ2jVd0+Gi4bxLBInOtEb9jVIgK6M+MX+Qub8AOgqnBlCO/M/kHLTuuCdemVuU04Qsfe5rcUV58TvJjtYaci7vPPPKt6oVEB3VsegfS+r47bsJCoYNdYlX/UJeoXjJZTR8uH6xqRfx0Pcc9snCMy30i41inzRhYjDRVIqekebW5f11JU00wZR9k8ceG781eLtQ0CkfwZHbar2KiV0WBg38nRvC3rD6bDPl9wCS1s532s4cnPa3hcrh+FQVL8XwqlH3KDPa9h87kTl3AjeUHPy7cXbay1/VFctzEX1GiARV6j8MzroyYCY4CJuXl/qpQyBDX7doE7mHjtFKfLy7ne5znQL8mbKI7f/O4cfBiHFn4m6XALRo+++DKXGQuk2vtSNC6hibqhGOC/ZpErkez0Qzh6uicEdJ5g2zaeJbEee4SzrGNMl4ZjgDLl02dmC6t2BALGkzknt2LwXXVVLbPfPr9S8BQAwODiIHJh7+cnm1YsNiFRDLbWl9dTPro=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?LD5pH0sRJX0CWTTualTsgn1kNCSa5DHXH0CLQmBotPddBBkaobkbeRdeaZ?=
 =?iso-8859-1?Q?IseMEIV0jlTpsIsMDik/ipuDZCM6jeWTHBQicRErIJfvT1NppWR9L9jzlK?=
 =?iso-8859-1?Q?6PCL/DC/7oId9oxUpdGwbKItpOAy7Pu0dEZfHf0/5+ddhWLV10IBdpSgF7?=
 =?iso-8859-1?Q?m0vRvdCFGR+nJXzzE49c38rRIfLfpJI7YGRcMndBEGrmnUh4Eh1DcCeLpl?=
 =?iso-8859-1?Q?IVTnvrxUPKpERd/NUPAQIoTxeCMQ70QtLW1lSqQ6CK012c7GvUieLvfgkl?=
 =?iso-8859-1?Q?i1RIQCV5p9NJYSk1m9/Iek5uS9dBFTG0wMCfE6Fah6pGqlew5RdOUyaWpS?=
 =?iso-8859-1?Q?9xEr4S7VPHbKQEmYMmrqp0iosDm8KehEktAqbJUDJk/fauP5mf5Sjih4mP?=
 =?iso-8859-1?Q?pGPBjrksgQf5UclwUE9Rv7aEMyTOjwTuhw4PaU9Z5Aj9u8ofL7p9FGleu6?=
 =?iso-8859-1?Q?LtMNvkd50dw71YpEc5YK16P+aAAbKOkfvwu9Zq7NU9Nk9ZLOUAtVDIuVOV?=
 =?iso-8859-1?Q?i/vM8kU6V3tSReMkSdT/UiHL5N4WfZt/Z076LsCEPQ/zZe2XZNsi/yBp7U?=
 =?iso-8859-1?Q?XzkQo0RNm6hT93LcQWJlLVhNOat4BKXQILHcS7UafqFkxaKajPjELoBy6N?=
 =?iso-8859-1?Q?wgIy3kbNZr8LlJqGhyM8dn4QkxoHz4ILUVIQTXDESZGWVVEF33Vk0xHBes?=
 =?iso-8859-1?Q?KQEal4RRudNdMLLHCAojHUrWXKVPT7mksOaEDBBwxwMkez5NX6J4HFfkS3?=
 =?iso-8859-1?Q?+XyD83fZX+gT2GnDeqBAlJt+TaVXwGBpRbZxrTzQr82F0cue4LOPvePiAP?=
 =?iso-8859-1?Q?RrdFF5FxpAyPdRu/gNF4RAgg3jRjF1i92JMYQ68sm+CXhvubsKiW3daG+v?=
 =?iso-8859-1?Q?zdTG6iuhylqKhIgCxDmnW8IcIct0T68yRmwend+HS9qJzVTb49QI20ZUXW?=
 =?iso-8859-1?Q?87+l25mT6TXdg0m6aA4f1q6TlMSLJhi+dLbcq5M/AmmZc42Jd7YhG4IFfx?=
 =?iso-8859-1?Q?L4pm6nN5jtF679VoPwxF5Fd+4/Un30LkmsrgNihY98rrNZBsddqvIbewky?=
 =?iso-8859-1?Q?txSW4dYIaDtCEUjxYEgpDqlmy3pJpW0yVPXxiDc7izJkqP5Bvy4IYZflpB?=
 =?iso-8859-1?Q?KfyM3PljuxR1qQB07IRRHZyVlA+5F11cBqkZnxZjx8FOwbaXoAImHYcsiQ?=
 =?iso-8859-1?Q?YM0p/bmlQ6R9YY40TsKA1R22ghgQLtcLAuFvCopqiHDHd8+zhHooZ/iA8C?=
 =?iso-8859-1?Q?ai8NvmA0S5oahbw74/485vcnICeZHwp2339Ojjn1wMueXxLnhJ3q8uwlH5?=
 =?iso-8859-1?Q?QRtg?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4734-24-msonline-outlook-c54b5.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6P189MB0568.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 6479f4e2-e538-4f34-0bdd-08db1f2b5937
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2023 16:45:24.3422 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2201
X-Mailman-Approved-At: Tue, 07 Mar 2023 16:53:59 +0000
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

Hello there,=0A=
=0A=
I just ran the static analyser "cppcheck" over the source code of linux-6.2=
-rc1. It said:=0A=
=0A=
linux-6.3-rc1/drivers/gpu/drm/bridge/fsl-ldb.c:101:3: style: int result is =
returned as long value. If the return value is long to avoid loss of inform=
ation, then you have loss of information. [truncLongCastReturn]=0A=
=0A=
Source code is=0A=
=0A=
static unsigned long fsl_ldb_link_frequency(struct fsl_ldb *fsl_ldb, int cl=
ock)=0A=
{=0A=
    if (fsl_ldb->lvds_dual_link)=0A=
        return clock * 3500;=0A=
    else=0A=
        return clock * 7000;=0A=
}=0A=
=0A=
Depending on the range of the value of clock, maybe unsigned long literals,=
 like 3500UL, should=0A=
have been used ?=0A=
=0A=
Regards=0A=
=0A=
David Binderman=0A=
=0A=
=0A=
=0A=
