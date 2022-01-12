Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F37C48CD84
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 22:16:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D101A10E790;
	Wed, 12 Jan 2022 21:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Wed, 12 Jan 2022 15:24:19 UTC
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.142.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE8810EA85;
 Wed, 12 Jan 2022 15:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qti.qualcomm.com; i=@qti.qualcomm.com; q=dns/txt;
 s=qccesdkim1; t=1642001059; x=1642605859;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hpBAmlHKqn85V4/2mDwvSQER7Hv6GU8J1XQdo3F/EjU=;
 b=SjGd/cjFOPySFiiESy9giOPE5LRQNmw+/RoMs8rdYFr9rRiacvw+qJRj
 qlJ1vNKhHa0jG++GP0w93YfwNwCpD/yUjXEfBi8p/2fAABCK33sB80N4A
 Kv5E906NRaXSMnCP559eU7iJu9//zJeqbZm2ws8Qq6Uj43s/xHXZwdzqL Q=;
Received: from mail-bn7nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.106])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 15:17:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J0WAkiT8WO0CxFywuwtq4uAUSHYx+s8urSbnuNw234xnMez4tTNCUTCv8kJDUfRtlN/eIhzhDeOwcYo3HXcixyASmIpvFu3wV1GhcrHzPS4lCXwOEweTNVKINYtVD/aSHvFLHmAxskqsw1zdXZro2Sn9Dmii4nV5BXiDsAvB8BxSyuaKzw8nDeOreUItVQnC9Aa1+8eXzJRJPpOeNjgynjh5deS58x8j1ShrPJtljG5JAlNChiy+E/7b8TJj7ITFNUql9eIx5qvr2LDQjn5kq78Gfsu1QojNzU3npVMDbJDu2hxipa5K0IWb7X8cXvKjjkmE4H2bL9O92nIu0PncMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hpBAmlHKqn85V4/2mDwvSQER7Hv6GU8J1XQdo3F/EjU=;
 b=ND3iuJ6yAO78LLw+5nsg7RG0YLijd6Soq7hPBE/9RNOAptrF05KDMqXWXX9/RBpIr20zB59EzTtdmANTkFgUq4sxSJGZPuazWLAzAosgTKwYkkcIeOh6yAM4zSk7ek7IuaQ2huHkDAA5YbwJF4cqHDXVhPqS5FsSEV+rWnsCHw54QJlMv9r5x+pnteVYBbQYTU8E92ZuKLQ3q5CIvrLBMUR4y1jmHAo/xIFJJL7kX6so3FMrDyAtPtVPPgETtW6sIjzR/1Zv9Yyv7Pp2xa4BYODJygd9rImPd+w0k9G3FvbL3luKwQYpOWXf1hMHux467klsHqUQpifJ8P/uEWyTrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from MW2PR02MB3820.namprd02.prod.outlook.com (2603:10b6:907:c::16)
 by CO6PR02MB7729.namprd02.prod.outlook.com (2603:10b6:303:af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Wed, 12 Jan
 2022 15:17:06 +0000
Received: from MW2PR02MB3820.namprd02.prod.outlook.com
 ([fe80::d941:6af6:1ee:d00f]) by MW2PR02MB3820.namprd02.prod.outlook.com
 ([fe80::d941:6af6:1ee:d00f%5]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 15:17:06 +0000
From: Rajeev Nandan <RAJEEVNY@qti.qualcomm.com>
To: Rob Herring <robh@kernel.org>, "dmitry.baryshkov@linaro.org"
 <dmitry.baryshkov@linaro.org>
Subject: RE: [v2 1/3] dt-bindings: msm/dsi: Add 10nm dsi phy tuning properties
Thread-Topic: [v2 1/3] dt-bindings: msm/dsi: Add 10nm dsi phy tuning properties
Thread-Index: AQHYBiF6dkdMBsoMWEeZ2WHs3Et74qxcSiSAgAA4pYCAAvsY0A==
Date: Wed, 12 Jan 2022 15:17:06 +0000
Message-ID: <MW2PR02MB3820CCD15224BE887454D30BEA529@MW2PR02MB3820.namprd02.prod.outlook.com>
References: <1641819337-17037-1-git-send-email-quic_rajeevny@quicinc.com>
 <1641819337-17037-2-git-send-email-quic_rajeevny@quicinc.com>
 <CAA8EJprrRZK+ocW9zDY_eyeo_m_xbu+KmfWf8QmTYscAh5SxLw@mail.gmail.com>
 <Ydxsz+XSreBKFNcr@robh.at.kernel.org>
In-Reply-To: <Ydxsz+XSreBKFNcr@robh.at.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d9f2707-0361-49d0-4f75-08d9d5de984e
x-ms-traffictypediagnostic: CO6PR02MB7729:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <CO6PR02MB77296416155EDA301C8525BBEA529@CO6PR02MB7729.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4TG4Vi4Wbr462JKrcma9dLZZUUWGiK0Ww7YTsCjFXtkzlJr2l52e8DB5yWqx4kJCi0obPfFmaoFIaUcY/BUWP8kS79KpLf+f9b/orYzMDiMrSuQMJxnFEOf66xthGGG8CtVDKeISDBXOH2tIG3nq9kRNTKLi+Zqp7lbsmdqUjTn5LxhBZiNRA9bfSYtlTKLXFjAzXVu+x62oUl/Qi1FPSDpDuJ98EYGTwhnIbAvZilXjKElqKTwET4zfe5svGfihrieGsgJHVV/fervAHddjX2Jx7hh2T9kZdBXQ0JGeK9nu9/GZ+NnLcOY1XWeUmxj3PUnCn3VIEDsbZGw9rcrzbHABwhBl1tnADvX9TpL5vv0/QM0WRs1OZv4AkXVcO3fllZDs5DnQ1dgB2IYFrV3tISBWgM35WAVQuScFU/yQQlWfbGPSJNJshxzVxB3cwovUZ5pK95Cff10hJVetq1+BCM14cSp+7csih2u1/3pIqCikUhQ6sPRKJ0thvosbMJX2lDu0PzxLOq3tLZi5SQMKGVPl/3A4ijYFOe5gvWOGjGhBIqmWN+OKEjO5SNtwTdY4MqH1MkrhrblEn8XLnOVh+AuYT49P7gkfAjKca9zXYKsW7Zbv68Z3afAiEzgLWduO1NO70VlnMZ/XNJ1NOsqUZ2b5U8o40+Q844sjVerHUFLDRXsAO3S4BYJuNxfJbuOcoTIWZjGu3aFsylPvg3irFA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR02MB3820.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52536014)(8936002)(38100700002)(86362001)(33656002)(4326008)(66446008)(64756008)(66476007)(8676002)(54906003)(66556008)(110136005)(122000001)(186003)(38070700005)(316002)(55016003)(71200400001)(83380400001)(5660300002)(7416002)(26005)(6506007)(76116006)(66946007)(7696005)(2906002)(508600001)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RFY4ZTdzdXB3RUhUdGd6S0hBclVkN0s0SVBDWTM2enRrVC9mWXR2Tm1HeitH?=
 =?utf-8?B?ZzFKZXVPUlNRcW5EOGtPQ3d1LzFRVUZXYnNFNmxQUGphVnpuanRTWXlqWEF3?=
 =?utf-8?B?cFpTM3BNdElVcGVKY29CaXF3TTJaZ3JvaHJ3bThsS1padm43ZDlkWW5UOVNB?=
 =?utf-8?B?bXdQbi8zQVlrdFBJOCtVZkl0K3pxNzNrWm1pMkhCZ3R5MW8yNVRUeW9yUG84?=
 =?utf-8?B?eFZ6a0ZDWUl6UE03dm9HNVpwa0R5YmY1UHVaaW8rYkZ3bkhYN3ZFQmdPSnI3?=
 =?utf-8?B?a0FNVHpMOW9QaThmVkloZ3dQSWo5ZmtZaVNvTEFmNG50eDlxclRHQmtuNTJO?=
 =?utf-8?B?VitXaDVvNkl1VldzemoxV0lhaStySFRNekN4UlRIOHUxcU5XRjg5SldRTnp1?=
 =?utf-8?B?Qjc2alVTdy9uM0plRzQrTFBJaDgzTHk0NlNKUlFLN0wzQldXbDY1YVROTkdi?=
 =?utf-8?B?QlpjdWg3Z085NGJaaDduWmJIVHZjaEtGcG1nY1ZFQXNxenNwRG1IQlY0N0lG?=
 =?utf-8?B?WUwzZEcvdmlmdm1VWHVtcjNuSkdqWlpvdmxrUHBYbU03ZnVwcnFuWTRETU5n?=
 =?utf-8?B?S2pESXRFZGdGcHFhb1BGbldrOE1NMDZ1Ym1kallzMWViMktPZXlWRStnVGlJ?=
 =?utf-8?B?YUZOL3hhZEhJSURjU21rdHNGbmlORHJ0OFJrOXRFVnFPNUFaL0pKNmtLcWl4?=
 =?utf-8?B?N2dacjJBS0o1K3RkeG93Yjg0a2dMQnNiTE9jQ2xLK0toc0Zsd21jSFNSczcz?=
 =?utf-8?B?eG02MVY1Z2ozTVp6dXJLaW9NRnUrK2pDTVNxbEtPVmphV3JwN2dHaFJTSWpU?=
 =?utf-8?B?anZyaEUxU3JtS3lCblZadDg3d0w2LzZlSjMzaUZUUzRSdWpseFcyMjhiT0tk?=
 =?utf-8?B?SWt1bktUOVNDcGRpcC9lUVBVTVZJQUtESG52emJYMHd6ZlhYYkxvaEZuMzZY?=
 =?utf-8?B?aUxDRVN6Y040S1gvTFFta1Q1Z3gxNHhwQ2tSZXFLT1dXTW4rUzUweEN1Z2pz?=
 =?utf-8?B?Ly9DKzJFUGxhZFkvendyeTB0anc0aHYyd09ucnduU1ZOMDYzTnV4WkUxVlI3?=
 =?utf-8?B?NHZwWnB3enVVZEhSakt2d3drMDZqOHY0b0JheWZHTEN2ZXl3UUNrcnVRTEdx?=
 =?utf-8?B?enVWYkExclZBWGhLL1o1Snh1bUN1VEUrZUs2TjBRVFhTd21zaTFONFMyR2Mx?=
 =?utf-8?B?VGQxbkh0Y1NJem9hNkhoWldpdEZCa3VGTlZTcnhiWnhXZEFmQllQTmtLb2V3?=
 =?utf-8?B?UG9GeE9PREcxUWxPUzZZcTZNU1AyZXlLWDlpanZZWVdycEcxOUN5d2pyVFJ5?=
 =?utf-8?B?Z2dNcGgxYVE1c1d3UWVSMW9XS1FoNU5vVlNkeW9xZDhWdndkQ002d0xxeXlh?=
 =?utf-8?B?OXU4ZmxLbzNaSjZWR2l0VHdWN21VanNFZXBabUhjQ3dZcU1Ha3lUdm8xZy9Y?=
 =?utf-8?B?YXpINnVUK0dwVlFiN1dJZ3lDZGpWOFRJWkJKNUxiZUtNdlVKdkFwdm0xOWN0?=
 =?utf-8?B?S1p4NzBBWDNLRUhhd3dsODZhRllBUGVVcDV6UXNFVFRZOGlpRmtDdmlVTDlV?=
 =?utf-8?B?c1o0OFUzd0xyYlc3bWxQdkpvSGFqV0hBeGZsV2ZnSUd2M1FNOGZQU1Vtc09l?=
 =?utf-8?B?dmZVdmxGMzBCVEJFUXpVYzl0MEc5Z2lBbXdvajNkTFppTnltVXNLY1FoMDZh?=
 =?utf-8?B?MFdDeCt6YUd6bUF3UStCcVBhVHZJZ1hTOHVFM01qbCtiTlg3Um00NUVKUmt0?=
 =?utf-8?B?WXJWWng5OHkwNDFtbDNkdUtiSHlrOWZ4OUo0YTlGTkduekF1ckhTbmJIcjA5?=
 =?utf-8?B?c0J3eUhkelNzMXJpR3o5bFdoRUZTQW9HWHhQV2VPNkw4UVdkY2JmcUhqQ0hO?=
 =?utf-8?B?d0tLclJlSE14eXIxQ29sdkQvTXROMEowRVMvK1R3NDNSREJRTm1sQ1cyYVBy?=
 =?utf-8?B?Q2R3dlhUTXc3MFZsdkdRbEZJbkJQcHJid0x2WkhEcTZ4bnBHbkx0em5OcGh1?=
 =?utf-8?B?SnViSUttUXRCdDFGRmhlNzBsOERSQ1hIU1JIb1lIWmZUTEExUjhva1UwUktR?=
 =?utf-8?B?aUVCRE9MVElZVjE4cVFGdnBaRi9SdUhNMFdoQXc5NDRZMlpTdG1wQzAxVXc3?=
 =?utf-8?B?VmxxSmc3aDM5Z0pxc1dIMk5zTStjMDRFMW00blVSdlBudUQzOVJFSmFNQ3RT?=
 =?utf-8?B?aTVhcXdHYS91aE85UlZCSVBlTm9rMDdBK29GVStKaUpRSGJmalNJeXdBaUla?=
 =?utf-8?B?WjFvRmcrMnlTQTJxNGxKbHNvK1V3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR02MB3820.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d9f2707-0361-49d0-4f75-08d9d5de984e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2022 15:17:06.2798 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3edvpUIzYI63CLuF3HyxWLy2mq/9nbN1kGQ5ZpMJo7KVZ72pdKOtQm/y5VqrIkOdtBGOCRJV0MVLG/CZWlbk5vNMmMScks7fZx0F18U4WZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7729
X-Mailman-Approved-At: Wed, 12 Jan 2022 21:16:00 +0000
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
Cc: "sean@poorly.run" <sean@poorly.run>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 quic_kalyant <quic_kalyant@quicinc.com>,
 "jonathan@marek.ca" <jonathan@marek.ca>, "airlied@linux.ie" <airlied@linux.ie>,
 quic_rajeevny <quic_rajeevny@quicinc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_mkrishn <quic_mkrishn@quicinc.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG1pdHJ5LCBSb2IsDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldy4NCj4gDQo+IE9uIE1vbiwg
SmFuIDEwLCAyMDIyIGF0IDA1OjA2OjAzUE0gKzAzMDAsIERtaXRyeSBCYXJ5c2hrb3Ygd3JvdGU6
DQo+ID4gT24gTW9uLCAxMCBKYW4gMjAyMiBhdCAxNTo1NiwgUmFqZWV2IE5hbmRhbg0KPiA8cXVp
Y19yYWplZXZueUBxdWljaW5jLmNvbT4gd3JvdGU6DQo+ID4gPg0KPiA+ID4gSW4gbW9zdCBjYXNl
cywgdGhlIGRlZmF1bHQgdmFsdWVzIG9mIERTSSBQSFkgdHVuaW5nIHJlZ2lzdGVycyBzaG91bGQN
Cj4gPiA+IGJlIHN1ZmZpY2llbnQgYXMgdGhleSBhcmUgZnVsbHkgb3B0aW1pemVkLiBIb3dldmVy
LCBpbiBzb21lIGNhc2VzDQo+ID4gPiB3aGVyZSBleHRyZW1lIGJvYXJkIHBhcmFzaXRpY3MgY2F1
c2UgdGhlIGV5ZSBzaGFwZSB0byBkZWdyYWRlLCB0aGUNCj4gPiA+IG92ZXJyaWRlIGJpdHMgY2Fu
IGJlIHVzZWQgdG8gaW1wcm92ZSB0aGUgc2lnbmFsIHF1YWxpdHkuDQo+ID4gPg0KPiA+ID4gVGhl
IGdlbmVyYWwgZ3VpZGVsaW5lcyBmb3IgRFNJIFBIWSB0dW5pbmcgaW5jbHVkZToNCj4gPiA+IC0g
SGlnaCBhbmQgbW9kZXJhdGUgZGF0YSByYXRlcyBtYXkgYmVuZWZpdCBmcm9tIHRoZSBkcml2ZSBz
dHJlbmd0aCBhbmQNCj4gPiA+ICAgZHJpdmUgbGV2ZWwgdHVuaW5nLg0KPiA+ID4gLSBEcml2ZSBz
dHJlbmd0aCB0dW5pbmcgd2lsbCBhZmZlY3QgdGhlIG91dHB1dCBpbXBlZGFuY2UgYW5kIG1heSBi
ZSB1c2VkDQo+ID4gPiAgIGZvciBtYXRjaGluZyBvcHRpbWl6YXRpb24uDQo+ID4gPiAtIERyaXZl
IGxldmVsIHR1bmluZyB3aWxsIGFmZmVjdCB0aGUgb3V0cHV0IGxldmVscyB3aXRob3V0IGFmZmVj
dGluZyB0aGUNCj4gPiA+ICAgaW1wZWRhbmNlLg0KPiA+ID4NCj4gPiA+IFRoZSBjbG9jayBhbmQg
ZGF0YSBsYW5lcyBoYXZlIGEgY2FsaWJyYXRpb24gY2lyY3VpdHJ5IGZlYXR1cmUuIFRoZQ0KPiA+
ID4gZHJpdmUgc3RyZW5ndGggdHVuaW5nIGNhbiBiZSBkb25lIGJ5IGFkanVzdGluZyByZXNjb2Rl
IG9mZnNldCBmb3INCj4gPiA+IGhzdG9wL2hzYm90LCBhbmQgdGhlIGRyaXZlIGxldmVsIHR1bmlu
ZyBjYW4gYmUgZG9uZSBieSBhZGp1c3RpbmcgdGhlDQo+ID4gPiBMRE8gb3V0cHV0IGxldmVsIGZv
ciB0aGUgSFNUWCBkcml2ZS4NCj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBSYWplZXYgTmFu
ZGFuIDxxdWljX3JhamVldm55QHF1aWNpbmMuY29tPg0KPiA+ID4gLS0tDQo+ID4gPg0KPiA+ID4g
Q2hhbmdlcyBpbiB2MjoNCj4gPiA+ICAtIE1vcmUgZGV0YWlscyBpbiB0aGUgY29tbWl0IHRleHQg
KFN0ZXBoZW4gQm95ZCkNCj4gPiA+ICAtIFVzZSBodW1hbiB1bmRlcnN0YW5kYWJsZSB2YWx1ZXMg
KFN0ZXBoZW4gQm95ZCwgRG1pdHJ5IEJhcnlzaGtvdikNCj4gPiA+ICAtIERvIG5vdCB0YWtlIHZh
bHVlcyB0aGF0IGFyZSBnb2luZyB0byBiZSB1bnVzZWQgKERtaXRyeSBCYXJ5c2hrb3YpDQo+ID4g
Pg0KPiA+ID4gIC4uLi9iaW5kaW5ncy9kaXNwbGF5L21zbS9kc2ktcGh5LTEwbm0ueWFtbCAgICAg
ICAgIHwgMzMNCj4gKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAzMyBpbnNlcnRpb25zKCspDQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdpdA0KPiA+ID4gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZHNpLXBoeS0xMG5tLnlh
bWwNCj4gPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNt
L2RzaS1waHktMTBubS55YW1sDQo+ID4gPiBpbmRleCA0Mzk5NzE1Li5kMGViOGY2IDEwMDY0NA0K
PiA+ID4gLS0tDQo+ID4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L21zbS9kc2ktcGh5LTEwbm0ueWFtbA0KPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL2RzaS1waHktDQo+IDEwbm0ueWFtDQo+ID4gPiAr
KysgbA0KPiA+ID4gQEAgLTM1LDYgKzM1LDM1IEBAIHByb3BlcnRpZXM6DQo+ID4gPiAgICAgICAg
Q29ubmVjdGVkIHRvIERTSTBfTUlQSV9EU0lfUExMX1ZEREEwUDkgcGluIGZvciBzYzcxODAgdGFy
Z2V0IGFuZA0KPiA+ID4gICAgICAgIGNvbm5lY3RlZCB0byBWRERBX01JUElfRFNJXzBfUExMXzBQ
OSBwaW4gZm9yIHNkbTg0NSB0YXJnZXQNCj4gPg0KPiA+IEdlbmVyaWMgbm90ZToNCj4gPiBJIHRo
aW5rIHRoZXNlIHByb3BlcnRpZXMgc2hvdWxkIGJlIHByZWZpeGVkIHdpdGggInFjb20sIiBwcmVm
aXguDQpTdXJlLCBJIHdpbGwgdXBkYXRlIGluIG5leHQgdmVyc2lvbiBhbG9uZyB3aXRoIHJlbW92
aW5nIGVuY29kaW5nIGZvciBwaHktZHJpdmUtbGRvLWxldmVsIHByb3BlcnR5Lg0KDQo+ID4NCj4g
PiA+DQo+ID4gPiArICBwaHktcmVzY29kZS1vZmZzZXQtdG9wOg0KPiA+ID4gKyAgICAkcmVmOiAv
c2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50OC1hcnJheQ0KPiA+ID4gKyAgICBt
aW5JdGVtczogNQ0KPiA+ID4gKyAgICBtYXhJdGVtczogNQ0KPiA+ID4gKyAgICBkZXNjcmlwdGlv
bjoNCj4gPiA+ICsgICAgICBJbnRlZ2VyIGFycmF5IG9mIG9mZnNldCBmb3IgcHVsbC11cCBsZWdz
IHJlc2NvZGUgZm9yIGFsbCBmaXZlIGxhbmVzLg0KPiA+ID4gKyAgICAgIFRvIG9mZnNldCB0aGUg
ZHJpdmUgc3RyZW5ndGggZnJvbSB0aGUgY2FsaWJyYXRlZCB2YWx1ZSBpbiBhbiBpbmNyZWFzaW5n
DQo+ID4gPiArICAgICAgb3IgZGVjcmVhc2luZyBtYW5uZXIsIHVzZSA2IGJpdCB0d2/igJlzIGNv
bXBsZW1lbnQgdmFsdWVzLg0KPiA+DQo+ID4gZHRjIHNob3VsZCBzdXBwb3J0IG5lZ2F0aXZlIHZh
bHVlcywgZ29vZ2xlIGhpbnRzIHRoYXQgPCgtMik+IHNob3VsZCB3b3JrLg0KVGhpcyBmb3JtYXQg
aXMgd29ya2luZy4NCj4gDQo+IFllcywgYnV0IHRoZSBzY2hlbWEgY2hlY2tzIGRvbid0IGNoZWNr
IG5lZ2F0aXZlIHZhbHVlcyBjb3JyZWN0bHkgeWV0LiBTbyB5b3UNCj4gY2FuIHVzZSAnaW50OC1h
cnJheScsIGJ1dCBqdXN0IGRvbid0IHVzZSBuZWdhdGl2ZSB2YWx1ZXMgaW4gdGhlIGV4YW1wbGVz
LiBJJ20NCj4gd29ya2luZyBvbiBjaGFuZ2VzIHRoYXQgd2lsbCBmaXggdGhpcyBpc3N1ZS4NCj4g
DQo+IFdoYXQgZG9lcyA2LWJpdCBtZWFuPyAweDNmIGlzIG5lZ2F0aXZlPyBKdXN0IHNpZ24gZXh0
ZW5kIHRoZSB2YWx1ZXMgYW5kDQo+IHNwZWNpZnkgdGhlIHZhbGlkIHJhbmdlIGluc3RlYWQ6DQo+
IA0KPiBtaW5pbXVtOiAtMzINCj4gbWF4aW11bTogMzENClllcywgUm9iLiAweDNmIGlzIG5lZ2F0
aXZlIHZhbHVlICgtMSkgaW4gNi1iaXQgdHdvJ3MgY29tcGxlbWVudC4NCkkgd2lsbCBpbXBsZW1l
bnQgeW91ciBzdWdnZXN0aW9uIGluIHRoZSBuZXh0IHBhdGNoIHZlcnNpb24uDQoNCj4gDQo+IFJv
Yg0KDQpUaGFua3MsDQpSYWplZXYNCg==
