Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D84EF4F1519
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 14:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A1D810F4DD;
	Mon,  4 Apr 2022 12:43:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.140.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A0F10F4DD;
 Mon,  4 Apr 2022 12:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1649076201; x=1649681001;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zT2JJG4vYBZg4v0syQzXGiOX4T2IrKAdn+3qPJB7dzw=;
 b=D3/ETc3nLeTvCH0QjdA6upAmTcqDzyfpJDUv1dpn0A8bk8ysJJLM3RY4
 Ypko//ZtDO1pWCZdNnJNyrdfxN6ho+HwFEsLBBwqUyoKy6nMQLR6PPl98
 mlQf8A1XRPjmSQ8IhLdtFP+wE7ytP5Iz/463ok1khTZ+McEFu4nLtpnvm 4=;
Received: from mail-dm6nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.174])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2022 12:43:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dk/B+YcDnC5h/P1CtfLaf3rn5zkynNNx7qLPQM7tRyf+26y4FqC620xVXxvPDm+UZp4EnXOyYKZeePrxnbNCEChvEbhbwTlc5hTd7i4psUI+ewPsL1eVu3TL05A9wZXy+pkzlJnZd7hZZ6da+C69yWjS2g9wfW60m8JUDOt3NKSTiVYh2DO8v44gQZINbR7WVaIyZkc1EVV//zrAC4ov3Gb6P3+EyuYnSdj2AOGfcEFA8KRDGPn+uM/wVSQMInM6Q4G1b8ib8DmON5NsWNSxdXsBRqhK53WjvP2q+GVF2lzRZGEzx20rSAGymoVdYRdFYD+kDPYRhy+2bV879aXmug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zT2JJG4vYBZg4v0syQzXGiOX4T2IrKAdn+3qPJB7dzw=;
 b=efyJkw6PsNoFqSOVm+q3ikj/ibaoPv0BBAg1isFdH+73RnUs5K+Wmjf2xxOC0XBKQANqgndgQjJtefSxHYSkrw6woycHwkC6uAnaAKGtSbclvXorMBqFsuKEdKFk1kR6fZXAeo7cNnIKMbgv4GWy9qsvjZwnzXYchMkXZ4CE9fumRtoJRPJ+zigE6bc1ag5S7fDk8g98y18EbvBHi3BdTsl2OxysBXqTVvRf0N6GgKQ7JbhLKMh1TSz384OYmJDXjAStW7oej2PdHR0WlzJwH5LRmM49G/NRCDLI+KbuVZ/DCND8r4GnwpXOy9JqjniRWISOwQeTusExLnSO47PJ+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6)
 by MWHPR0201MB3531.namprd02.prod.outlook.com (2603:10b6:301:7c::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 12:43:16 +0000
Received: from MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::9485:c59c:6877:f492]) by MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::9485:c59c:6877:f492%6]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 12:43:16 +0000
From: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
To: Doug Anderson <dianders@chromium.org>, "Sankeerth Billakanti (QUIC)"
 <quic_sbillaka@quicinc.com>
Subject: RE: [PATCH v6 2/8] drm/msm/dp: wait for hpd high before aux
 transaction
Thread-Topic: [PATCH v6 2/8] drm/msm/dp: wait for hpd high before aux
 transaction
Thread-Index: AQHYRE+4vbMdbQ6aBkS4lzhesUsPTqzaI7sAgAWWvXA=
Date: Mon, 4 Apr 2022 12:43:16 +0000
Message-ID: <MW4PR02MB7186656298691D9F575BE7EBE1E59@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-3-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=UtnNTWmMPYPkSJ5qceWspXtZ+hL6UTgSn=rHzd39Y42g@mail.gmail.com>
In-Reply-To: <CAD=FV=UtnNTWmMPYPkSJ5qceWspXtZ+hL6UTgSn=rHzd39Y42g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: effdbfdf-2234-43c9-cfaa-08da1638b0bd
x-ms-traffictypediagnostic: MWHPR0201MB3531:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <MWHPR0201MB3531AABCFEF2498DDC0F2A299DE59@MWHPR0201MB3531.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rE38ahtpX+z8I50uBVMqe5H0s4wH0HxsKRJ/82zjInvejKqAoW80XFIs+f3ZvYMiTcp5atm/XfASSjiLP1fs7qkgwsqXbm6Lp7ezAzfwQhnosri6kR1JfrjQn67HaEd9qlzByhM9XMIGyktcmhbYXktdnHBKLO3Aha+xtOXiy/Xjy2SuwNRwXWFDIbouhI4ETUiL1IvV9wrHODWMysW2LrW44b2MKTCZ7A5O0kSa/QzHtfTwWihKKFtrvnnIs/NWXLKEAvl3Idsej8wAz8P1W6HwTduCiduNwIyKs+BUC75xlW3/+UNUNRW0P+5jjasY1o6fPuCxIuASjVRu7S+8EQxGLpQ91qZ7uTAyTtPmKwiRFJxjXSORvTuK+2mnBjMW7Rz+WaxkaMlg6b/ldcRlGQc8pbJU4d3MgOkxkFddnKTCui6Ydackn8bilntVOrEVXI6vcONhLUk5L9txMYg3uB3C5E/hXtxVlsPsWeMENEMSSQ6BlddV7loQUKFsS1m6YVhZuWKi1KHMwbVTClplPuy69Szn94u1JsfHUnxudQE9sAMmaSypc8k0l/0RDkNB+P5HwZtCkQVL8BjCao0g/1RD3N1RQH8dH4V0mI/4Xiir91VNllghk1S9jqoG+NK7+qaho4M7yEW4gsMNaElerJgx1pcI5RCoFwFOOvG5seNhfthlK10PIzugzd7ycHxh03nTCgKXGNPdGHnFx92lTw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR02MB7186.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(66946007)(64756008)(26005)(4326008)(186003)(76116006)(66476007)(83380400001)(86362001)(66556008)(66446008)(7416002)(38100700002)(5660300002)(2906002)(122000001)(107886003)(55016003)(52536014)(316002)(38070700005)(8936002)(508600001)(9686003)(6506007)(53546011)(7696005)(33656002)(71200400001)(110136005)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eEhPMXBINzlVSEQ4OEdSR3pwK05WV3BCSktNZ1I5VTUrTzh5YXdJYjFPYXRu?=
 =?utf-8?B?RktTdW9DQzFRRGpzMXBEMjdRWTh4UWJJWFh1Zk1adjUzT2M3QTJmb1d6RE00?=
 =?utf-8?B?TVpPb2RwQmVoSGpNT0pLRGtYSE85dmZHc2JOMW8yYkh0aUo2Z01ncGprbkQx?=
 =?utf-8?B?SWlpVzJmZHQ2RVRSbXVmSmZBbHdDVlhsd1Y2enZ0OXlXVEJzM090bE5LckJQ?=
 =?utf-8?B?QThza0NhZE5TTVpzUE96VVViUWwwbDdVemhxMExjZ3pyRjF2Rk5RWGpzVXc0?=
 =?utf-8?B?WEs0M3o3Z0NUWXpUZ0ZQWjMzZ1cxUzhWV0dlU1VQa3ZSbUY4TUo5L0JxVzdH?=
 =?utf-8?B?OGFSOUxYM09IYXFlVlBDeFY3eTdPZ2pIREZUbEtJbE5NL3JkWDlTc0kyZDlx?=
 =?utf-8?B?czBGcnhPcjc3VTVnQUdBUTBXV2VOSFNBYnV2eFBSeHBKSnpDM2pSWXZuZlI1?=
 =?utf-8?B?Qm1BN0RBL2Jqd0hUWHFaUU1EZTZ1U0VUTjhMM0dEbzFTbTA0bUMzL2xBYmJy?=
 =?utf-8?B?dzVUak5TL1NDMzIvb0tsVVIzdEdza0VDVnNTYXdHSVdpN0lPaGJCRlhEdU1G?=
 =?utf-8?B?Z3JGOE50Q2wvdE0zcUFEdmpmZ3N1dDh6UHhmRm1yL0FWUXQxcEhPYkhlY3Zj?=
 =?utf-8?B?SlBOazd6d1B4VWFvdXEzNGNVRk9HdUVhUjVWaUJSWWRrSEJPZnR4UmNvM1FT?=
 =?utf-8?B?Y0xOT295RDdES1ZlYWNaV05RMEswZ01sd3BqOXp2cGpVMTZEY25kTTN2dzI5?=
 =?utf-8?B?dE9DSFcwWDYzNWhMREd6Rkk0WEFSSEdvSkRKbmFNUW1hc08wRHNDOEcyRGVw?=
 =?utf-8?B?MC85NmthN3dVT0xjM3YyZ1BmVW5uS1dBZjNrZWtnb3FVV1ZDM1o4MUpyd1dz?=
 =?utf-8?B?TUVWOGhyWjB1WldncGV6QUZHQmxGdDByMkpjZmIyOVMrNTA0KzlMcUZtNnhy?=
 =?utf-8?B?K01OZit0R01ESENlRzBKTktYNW1lYy8wUXJRVlAyWitIQ1I2RFpCeDRKSUVM?=
 =?utf-8?B?WXVKWDFXelhBMnUzN1VCOGowc0FDTFpodWFOdmRySnhqR2ZoalZQM1lpZERh?=
 =?utf-8?B?cW5iZTNzUHZkb3NIMHZ1M1FzdFR5elRkS1haZkdrUXh0QVVzWTFtNmttNkpM?=
 =?utf-8?B?WGpDOGZvOHUyZFMyWmJDQnA3dk5GSVJiQUlNNThmYXVsRlU0RDRzQUNNR2Jj?=
 =?utf-8?B?Q3lRSExNcUN0OHZuK0I2cVB6THFxWFdyU2hIems0dlErTzRKbkdvQ1p5Z08z?=
 =?utf-8?B?aHp5NWxqaFIyaHFqVEpGejJyYWo4TjBxQ0lnYlFmbTV0aWFFYmtTWDRIbFll?=
 =?utf-8?B?Z1dhRm5kamRERVUzVWdqbFlXeE1tS0sxemNUcllFNkJ4eGFlNGx5YW1KbXh6?=
 =?utf-8?B?ejNjL29pTzJsV1pRd0pod0t0U1J2clNDdzhIOXZkbmhTYTMvTitGMjZsekRL?=
 =?utf-8?B?OWMvU3BoVXVmZ1E0YmJvR0RCZFlwV2dHN0tvR3pqUVFjYUNIMWhseEY5TUpD?=
 =?utf-8?B?MEI4SGVqVExNdWtUb1hwaG9GOUVxZWR0QzU4bnZZQTBWcWhJdWJaSzBHc05u?=
 =?utf-8?B?QzI3ak9YRVM2TjFsMWN1cWZuMWI3djdDTmgxMk9CaG4xb01HM0IxWEpjUHVB?=
 =?utf-8?B?K0dGM0ZIaTNMZDgrU3lTZ3F3Mk9Weis4Tlh3WG9MTXlxblBSNUVIbVh2SEhy?=
 =?utf-8?B?alpnZ3JBb0NWajdzalcwczRlNnovWTczTVJzV3VjWHdFVFhyWmtyK1JWeVJ2?=
 =?utf-8?B?NndhdzN3cWNJa2o3VXNFRlpNb0FnRVVJSE9HM2lKTDdFRW9NRS85OE5JdkY2?=
 =?utf-8?B?ek9IV3JvbnNiZlQwdXJCV1dVK3ZlemlPZ0YwV1RzQUZkc3JyUWVhTXRzSjdC?=
 =?utf-8?B?OUxRek9zY1VBZ0pSS0NkZ0cwQjJsQVVwc0gyRDg5TzVCZkN0MXBaT05Gb2lr?=
 =?utf-8?B?d2QxSSs2N3p2ZWZDMVhlbnVNem1OZk9kelBNNXhGWUxJVHRBWTA4SldYVktB?=
 =?utf-8?B?dlliOWgrbW8rOHVaTTRaVjRrN3NDeXQzaFZUQUpHTk5rQTNibHV0TE5RS0Ns?=
 =?utf-8?B?TXptaVpxZm5vL0hsK3JUTk9Ib3ZncndnbE83L3BKblloTHRBVmlzSTJmd1la?=
 =?utf-8?B?cnNnam4xOEEzNW9wZWU2MFp4Q2ppYUx6ZW9IeldEL1B5NUdvVVlGZFFvZnNX?=
 =?utf-8?B?TzZJZFEvUElkZTUyenlwV05ybGM3ODMrYTh1czZLTFoya3FZMU9MTk8va2g0?=
 =?utf-8?B?L3dlbWo2M2ZDT0xvZmxxUDU4K2Y2c2VZdGQ3L2ZwSXdYNkFyQWdRREU1a1ZI?=
 =?utf-8?B?b1dnWlJGbGZGWnllZXNZTTNWb3ZIN2Z2aXlhZTRoSXJnbE1BUEdSUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: effdbfdf-2234-43c9-cfaa-08da1638b0bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2022 12:43:16.3993 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tsa4HLRBiYSU12YV1VcCGYUf5xlz3JIKmjo2hJnPCLQJDi/rWb/Cf+0j3koLzmSLwQOZiq6ipUCjcAVS8yqhQdeVF7Rwa1QdbhSMkk8oFpk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0201MB3531
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "Abhinav
 Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Sean Paul <seanpaul@chromium.org>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG91ZywNCg0KPiBPbiBXZWQsIE1hciAzMCwgMjAyMiBhdCA5OjAzIEFNIFNhbmtlZXJ0aCBC
aWxsYWthbnRpDQo+IDxxdWljX3NiaWxsYWthQHF1aWNpbmMuY29tPiB3cm90ZToNCj4gPg0KPiA+
IFRoZSBzb3VyY2UgZGV2aWNlIHNob3VsZCBlbnN1cmUgdGhlIHNpbmsgaXMgcmVhZHkgYmVmb3Jl
IHByb2NlZWRpbmcgdG8NCj4gPiByZWFkIHRoZSBzaW5rIGNhcGFiaWxpdHkgb3IgcGVyZm9ybWlu
ZyBhbnkgYXV4IHRyYW5zYWN0aW9ucy4gVGhlIHNpbmsNCj4gDQo+IHMvcGVyZm9ybWluZy9wZXJm
b3JtDQo+IA0KPiA+IHdpbGwgaW5kaWNhdGUgaXRzIHJlYWRpbmVzcyBieSBhc3NlcnRpbmcgdGhl
IEhQRCBsaW5lLiBUaGUgY29udHJvbGxlcg0KPiA+IGRyaXZlciBuZWVkcyB0byB3YWl0IGZvciB0
aGUgaHBkIGxpbmUgdG8gYmUgYXNzZXJ0ZWQgYnkgdGhlIHNpbmsNCj4gPiBiZWZvcmUgcGVyZm9y
bWluZyBhbnkgYXV4IHRyYW5zYWN0aW9ucy4NCj4gPg0KPiA+IFRoZSBlRFAgc2luayBpcyBhc3N1
bWVkIHRvIGJlIGFsd2F5cyBjb25uZWN0ZWQuIEl0IG5lZWRzIHBvd2VyIGZyb20NCj4gPiB0aGUg
c291cmNlIGFuZCBpdHMgSFBEIGxpbmUgd2lsbCBiZSBhc3NlcnRlZCBvbmx5IGFmdGVyIHRoZSBw
YW5lbCBpcw0KPiA+IHBvd2VyZWQgb24uIFRoZSBwYW5lbCBwb3dlciB3aWxsIGJlIGVuYWJsZWQg
ZnJvbSB0aGUgcGFuZWwtZWRwIGRyaXZlcg0KPiA+IGFuZCBvbmx5IGFmdGVyIHRoYXQsIHRoZSBo
cGQgbGluZSB3aWxsIGJlIGFzc2VydGVkLg0KPiA+DQo+ID4gV2hlcmVhcyBmb3IgRFAsIHRoZSBz
aW5rIGNhbiBiZSBob3RwbHVnZ2VkIGFuZCB1bnBsdWdnZWQgYW55dGltZS4gVGhlDQo+ID4gaHBk
IGxpbmUgZ2V0cyBhc3NlcnRlZCB0byBpbmRpY2F0ZSB0aGUgc2luayBpcyBjb25uZWN0ZWQgYW5k
IHJlYWR5Lg0KPiA+IEhlbmNlIHRoZXJlIGlzIG5vIG5lZWQgdG8gd2FpdCBmb3IgdGhlIGhwZCBs
aW5lIHRvIGJlIGFzc2VydGVkIGZvciBhIERQIHNpbmsuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBTYW5rZWVydGggQmlsbGFrYW50aSA8cXVpY19zYmlsbGFrYUBxdWljaW5jLmNvbT4NCj4gPiAt
LS0NCj4gPg0KPiA+IENoYW5nZXMgaW4gdjY6DQo+ID4gICAtIFdhaXQgZm9yIGhwZCBoaWdoIG9u
bHkgZm9yIGVEUA0KPiA+ICAgLSBTcGxpdCBpbnRvIHNtYWxsZXIgcGF0Y2hlcw0KPiA+DQo+ID4g
IGRyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfYXV4LmMgICAgIHwgMTMgKysrKysrKysrKysrLQ0K
PiA+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2F1eC5oICAgICB8ICAzICsrLQ0KPiA+ICBk
cml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2NhdGFsb2cuYyB8IDEzICsrKysrKysrKysrKysNCj4g
PiBkcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2NhdGFsb2cuaCB8ICAxICsNCj4gPiBkcml2ZXJz
L2dwdS9kcm0vbXNtL2RwL2RwX2Rpc3BsYXkuYyB8ICAzICsrLQ0KPiA+ICA1IGZpbGVzIGNoYW5n
ZWQsIDMwIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9hdXguYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJt
L21zbS9kcC9kcF9hdXguYyBpbmRleCA2ZDM2ZjYzLi5hMjE3YzgwIDEwMDY0NA0KPiA+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfYXV4LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vbXNtL2RwL2RwX2F1eC5jDQo+ID4gQEAgLTM2LDYgKzM2LDcgQEAgc3RydWN0IGRwX2F1eF9w
cml2YXRlIHsNCj4gPiAgICAgICAgIGJvb2wgaW5pdHRlZDsNCj4gPiAgICAgICAgIHUzMiBvZmZz
ZXQ7DQo+ID4gICAgICAgICB1MzIgc2VnbWVudDsNCj4gPiArICAgICAgIGJvb2wgaXNfZWRwOw0K
PiA+DQo+ID4gICAgICAgICBzdHJ1Y3QgZHJtX2RwX2F1eCBkcF9hdXg7DQo+ID4gIH07DQo+ID4g
QEAgLTMzNyw2ICszMzgsMTQgQEAgc3RhdGljIHNzaXplX3QgZHBfYXV4X3RyYW5zZmVyKHN0cnVj
dCBkcm1fZHBfYXV4DQo+ICpkcF9hdXgsDQo+ID4gICAgICAgICAgICAgICAgIGdvdG8gZXhpdDsN
Cj4gPiAgICAgICAgIH0NCj4gPg0KPiA+ICsgICAgICAgaWYgKGF1eC0+aXNfZWRwKSB7DQo+IA0K
PiBBZGRpbmcgYSBjb21tZW50IGFib3V0IF93aHlfIHlvdSdyZSBkb2luZyB0aGlzIGp1c3QgZm9y
IGVEUCB3b3VsZA0KPiBwcm9iYWJseSBiZSBhIGdvb2QgaWRlYS4gTGlrZSBtYXliZToNCj4gDQo+
IC8qDQo+ICAqIEZvciBlRFAgaXQncyBpbXBvcnRhbnQgdG8gZ2l2ZSBhIHJlYXNvbmFibHkgbG9u
ZyB3YWl0IGhlcmUgZm9yIEhQRA0KPiAgKiB0byBiZSBhc3NlcnRlZC4gVGhpcyBpcyBiZWNhdXNl
IHRoZSBwYW5lbCBkcml2ZXIgbWF5IGhhdmUgX2p1c3RfDQo+ICAqIHR1cm5lZCBvbiB0aGUgcGFu
ZWwgYW5kIHRoZW4gdHJpZWQgdG8gZG8gYW4gQVVYIHRyYW5zZmVyLiBUaGUgcGFuZWwNCj4gICog
ZHJpdmVyIGhhcyBubyB3YXkgb2Yga25vd2luZyB3aGVuIHRoZSBwYW5lbCBpcyByZWFkeSwgc28g
aXQncyB1cA0KPiAgKiB0byB1cyB0byB3YWl0LiBGb3IgRFAgd2UgbmV2ZXIgZ2V0IGludG8gdGhp
cyBzaXR1YXRpb24gc28gbGV0J3MNCj4gICogYXZvaWQgZXZlciBkb2luZyB0aGUgZXh0cmEgbG9u
ZyB3YWl0IGZvciBEUC4NCj4gICovDQo+IA0KPiANCg0KT2theS4gV2lsbCBhZGQgaXQNCg0KPiA+
IEBAIC00OTEsNyArNTAwLDggQEAgdm9pZCBkcF9hdXhfdW5yZWdpc3RlcihzdHJ1Y3QgZHJtX2Rw
X2F1eA0KPiAqZHBfYXV4KQ0KPiA+ICAgICAgICAgZHJtX2RwX2F1eF91bnJlZ2lzdGVyKGRwX2F1
eCk7ICB9DQo+ID4NCj4gPiAtc3RydWN0IGRybV9kcF9hdXggKmRwX2F1eF9nZXQoc3RydWN0IGRl
dmljZSAqZGV2LCBzdHJ1Y3QgZHBfY2F0YWxvZw0KPiA+ICpjYXRhbG9nKQ0KPiA+ICtzdHJ1Y3Qg
ZHJtX2RwX2F1eCAqZHBfYXV4X2dldChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkcF9jYXRh
bG9nDQo+ICpjYXRhbG9nLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9v
bCBpc19lZHApDQo+IA0KPiBuaXQ6IEkgdGhpbmsgeW91ciBpbmRlbnRhdGlvbiBvZiB0aGUgMm5k
IGxpbmUgaXNuJ3QgcXVpdGUgcmlnaHQuDQo+IA0KPg0KDQpJIG1vdmVkIGJvb2wgaXNfZWRwIGlu
dG8gdGhlIG5leHQgbGluZS4gSW4gdmltICwgaXQgd2FzIHNvd2luZyBmaW5lLiBJJ2xsIGNoZWNr
DQogDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfYXV4LmgNCj4g
PiBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfYXV4LmggaW5kZXggODJhZmM4ZC4uYzk5YWVl
YyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2F1eC5oDQo+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9hdXguaA0KPiA+IEBAIC0xNiw3ICsxNiw4
IEBAIHZvaWQgZHBfYXV4X2luaXQoc3RydWN0IGRybV9kcF9hdXggKmRwX2F1eCk7ICB2b2lkDQo+
ID4gZHBfYXV4X2RlaW5pdChzdHJ1Y3QgZHJtX2RwX2F1eCAqZHBfYXV4KTsgIHZvaWQgZHBfYXV4
X3JlY29uZmlnKHN0cnVjdA0KPiA+IGRybV9kcF9hdXggKmRwX2F1eCk7DQo+ID4NCj4gPiAtc3Ry
dWN0IGRybV9kcF9hdXggKmRwX2F1eF9nZXQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZHBf
Y2F0YWxvZw0KPiA+ICpjYXRhbG9nKTsNCj4gPiArc3RydWN0IGRybV9kcF9hdXggKmRwX2F1eF9n
ZXQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZHBfY2F0YWxvZw0KPiAqY2F0YWxvZywNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgaXNfZWRwKTsNCj4gDQo+IG5p
dDogSSB0aGluayB5b3VyIGluZGVudGF0aW9uIG9mIHRoZSAybmQgbGluZSBpc24ndCBxdWl0ZSBy
aWdodC4NCj4gDQoNCkknbGwgY2hlY2sNCg0KPiANCj4gVGhpbmdzIGFyZSBwcmV0dHkgbXVjaCBu
aXRzLCBzbyBGV0lXOg0KPiANCj4gUmV2aWV3ZWQtYnk6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5k
ZXJzQGNocm9taXVtLm9yZz4NCg0KVGhhbmsgeW91LA0KU2Fua2VlcnRoDQo=
