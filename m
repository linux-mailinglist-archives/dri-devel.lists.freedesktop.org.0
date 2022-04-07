Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FBE4F7F56
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 14:41:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3ABF10EA0C;
	Thu,  7 Apr 2022 12:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.140.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C549810EA0C;
 Thu,  7 Apr 2022 12:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1649335303; x=1649940103;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tnfZAa4PJ+UZ2DOn+ZkqOaJOWOyk4SsyUjpsUa21OAM=;
 b=v4SPCB+K7z5bpaRVzUCbRfcFM6t9Gd6D0qe+Y9EnhP7s0F2X1yxURV+M
 zDuVMraVpGVjFRVJnt+ZsjUl21btHSl9Wp0SI8+glRvE9wFBFOSYcCR7j
 MwK6ewWuKzV4LLzqQuavMLIxBOncoaDXKPwy2cPrgfaWWVO+E/5+gheNT k=;
Received: from mail-mw2nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.100])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 12:41:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q2nbIy/vdQOrly+9qD3Y5K5FYENFBYXhS1sOxyrcL1W8jyBTJtv/GXUm7loGkU234ChFlijHegsgVH0MnbbsSPos+B7KK6WtocWzQSKR2EoT/HpMmQ/hujUBjT/JHyiMQMqcU48vdOoQBkpAGaNtgKzm/Roz27MvC0JyZfKEEGHPEqvMBBnXUHJQ2nNvGGeQ7IjFnS/QQQSk7YKypwCryJuK4BwjNQkwt/WRIIH3iZFZ04lPP8K0P9nTfbB6ouLVIGG9B3Im7QXRNQibizX0X92EciE/KPK8V64vX7yI1DpT21zRXQLKMlgxGAHljSvMvSCIbWFVbQls6h2KUiOicA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tnfZAa4PJ+UZ2DOn+ZkqOaJOWOyk4SsyUjpsUa21OAM=;
 b=Yc3JMKUutc7QzLUyQaUZn1ZrWDzkFtopeHvg8XJOjnO7GMcAWZPwBS2QeqSr563GbIxz0RNaJO6I54Awin7MF8sIyb0BF+sEJxyJxps0MAvRmMvpV29zMoRvwpQ8DZtKKwRGqHbfmUd9mR9/5V+GUl+ENid5LbRkUs1S7wSTxpP2rmU64JDIQckd4eGR1fUkOuWhI2lvByUOhwbg3dGTS+0LFW7FYaDsZTCDq2aPuPY1mX5yTAgdNEtjny0fvfGiWgEiQEmMF0DqwrAg1cFX97qh+Pm6hAfxyI/RaXmH5wi8JpLzVJ1rGJSSSdiNzcC44GlaHci1ddU86dZaca1aGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6)
 by MN2PR02MB6320.namprd02.prod.outlook.com (2603:10b6:208:1ba::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 12:41:35 +0000
Received: from MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::9485:c59c:6877:f492]) by MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::9485:c59c:6877:f492%7]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 12:41:35 +0000
From: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "Sankeerth
 Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
Subject: RE: [PATCH v6 7/8] drm/msm/dp: Support edp/dp without hpd
Thread-Topic: [PATCH v6 7/8] drm/msm/dp: Support edp/dp without hpd
Thread-Index: AQHYRE/ShPa/kTPBlEuRjU9qR0RcAazaJBUAgAX38oCAAC2CAIAEJ3fA
Date: Thu, 7 Apr 2022 12:41:35 +0000
Message-ID: <MW4PR02MB71866443CD6174EFCF57251BE1E69@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-8-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=V92j=yEoaM4REO6ws=AXpBjM6zWwBtZ8SbPiFd2cu3yw@mail.gmail.com>
 <MW4PR02MB7186DD14809500D97C3ABDBBE1E59@MW4PR02MB7186.namprd02.prod.outlook.com>
 <CAA8EJppB8s=myUG+swLF5vQU+b+mGSjrNsn1-=1cgO9rKXC7Xw@mail.gmail.com>
In-Reply-To: <CAA8EJppB8s=myUG+swLF5vQU+b+mGSjrNsn1-=1cgO9rKXC7Xw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dfc108e0-8b4f-44c6-9e94-08da1893f3f6
x-ms-traffictypediagnostic: MN2PR02MB6320:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <MN2PR02MB6320B4159D7FED2ECCAE68E89DE69@MN2PR02MB6320.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fqOMF5LCfQcT+2nHgari+J4Z+yzXR0CdPcRUbDd1iZ2JljU3UaCcBzcxRWT9tdGGr6yI33mWuQTbAIVBqiUnSij3O4ECo5R6WtmByoEuhO7OpoNN2NwodvuQF+8dTWld3Fq3o/VhZ+vgVlTdwKCErxZ3bQ68+QVvFTQYSSXSl2c9aw/iO42ET3X1/VN5pWYuPm2zYX+eFOLhChbtz3+Oy2hs6C0esHaYoX3mrsFTNNMie5gYLXAZCl8n+ZZF2Bhaq5lTK35msjg7jbsCXioSBWjVZu9wBdJguEdWNosHIn92OSIIsRIN63YnhbGaxt2a1IKIJ2BB+qV4DX1JeRLAjttb1/j6wc4cdjQzqu6kbezyFILqSVYmUeeYF/UahAl0r5gT2iir8FSOX8R9aJdwMXT4WfGWijBggemYVNQI7VGGFtmG2gdom2EpR3pGsfkYVNokfkpgl1oNnjscanyJyjTvMHr6+MJHl8Idz/aFkSAghR1K9LXv94UXPfEG23zcnjNCZqDuI7Y9MF/hts0gN6U+u2yhsR1XFT3r8xgn6as6ZdcBob3U3iMA1drI1q4i3XTVkXUscJ32dXqrxeFCq0dBpkjnYupHTg7sTsbAAAhCJyz1J8K9I4snuNKq9s2bAHC4YOmU4x38F/JZsI2sIOv8cr1RN+o3V5t1mi8gSYfF3G9uWCfNeiAfpE1EsiBJ2rcpTxQ+zSEdrkriEmfnYQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR02MB7186.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(33656002)(76116006)(64756008)(66476007)(66446008)(4326008)(66946007)(8676002)(186003)(53546011)(66556008)(9686003)(7696005)(6506007)(316002)(26005)(508600001)(38100700002)(2906002)(52536014)(5660300002)(107886003)(83380400001)(122000001)(8936002)(55016003)(71200400001)(7416002)(38070700005)(110136005)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHg0QjFHU3JNUnM3YzREUXBXckp0QTBQRy9HT3hoYy9KeVhGMUdtSHJnMzgx?=
 =?utf-8?B?VkZyLzZuOFZRS3dpeHp6QlhtcWRETG80TEZUekV0RXRMR2pRdjJPT3J0ZXZZ?=
 =?utf-8?B?VGVDeFJGeHpkSWkxKzhPOHp2aGMzSTBFMXRVbURJaDhoWW5IamdqQnVJakZG?=
 =?utf-8?B?TnZXb2dIeUpLeDdEWllkbDZIb1pmNjhaajVCcFVxV3REcUx5TUtUSXcxMkJZ?=
 =?utf-8?B?bkFVZVkxV0NBc3J0NEtjdG95VUZkdVJvVDBKQjZoRVNGdEt5SFBFZmFtYmlY?=
 =?utf-8?B?U0oxQ25XVWI0di9GZXhKMGhpbnpXQ3IrUVRIQzJob2YrSzkrY0xOL1ZUQ2dH?=
 =?utf-8?B?MkZxRWp1NXErWkt0VWlFWU9Uc0FQM0xoRDY2SnVrOGwrWisxSEk3VHk2YVBJ?=
 =?utf-8?B?WDhGQW5zalVmaC95eEpiTWhUeHhzb2dpaC9jaEVudmJhUWVSdkZIaWhRUFE0?=
 =?utf-8?B?bEJCZldIaUZ4blZIZzFSRWd2WkVVanF5VmQ3cE44UGpCVGZ0alNiNHg2VWsy?=
 =?utf-8?B?WURyUTBrVk1LQWQyU1BuNndFcXBqRFdITWlDSWxpRGVjSWNReUVtNDFhcjBU?=
 =?utf-8?B?anlKVDNPZzBPaFNuS2Yvbkg2aHY2T1VyRnFnclJTdWhFQXlJc0NKZ0F4bk40?=
 =?utf-8?B?cVo5cEtqWmVHYW9KdWJiWlM5QzNvcXhGY2RqMXdVdVZGaDhkWk10YjFkUURj?=
 =?utf-8?B?OUpXdHNnS2gva3VZRXNWUVUyUE1Ub3E0SGJqUVFXc2NYZ00rTHpBWmZiZW4z?=
 =?utf-8?B?VE8rZER5RXpkcHdrYnRZQ2V6a1o3UjA3NGVieXlLSzNaL1lvWnR1L3lFV3N4?=
 =?utf-8?B?RFFOcmttU2gxM3dHQldGMnlzdmF2d0VOSkZGbktWWm9lbUpBZkZHWFhZYUlV?=
 =?utf-8?B?VEtrK3lhR3BQcmc5cW4zaWJseWlBM1VhT0s4bS9BbE5TbHFmUnZOWDZPUUZx?=
 =?utf-8?B?bFpuZlNrQW9pZkVvWTg4YmUvaTVxc0RZQk1Bd0d2UzBrODBPcFBvcWZFemoz?=
 =?utf-8?B?RWR5VHRuU1BOVHhjMzA5M2RMN1BPdXBnQW5jNmhRV0hnQStORm0xY3NxQWlT?=
 =?utf-8?B?UXhZYjUyaHBiaXZTU0UwSXRpam1LWm5aRTFvNDNGVzR0cTN2R3JhVVEzRTF4?=
 =?utf-8?B?cGxkUkRxRWNIRzluajBhaUt5ZDF0WWlDUEx2azNRejFkMW03a2RXZGo1YW9Q?=
 =?utf-8?B?aWQ2YWEwaWNNR3pkMS9mYjA2bGcvN2drQ1lFRjB5MWJUODVHdk1YYnlORUVj?=
 =?utf-8?B?em9tM1lFUVR0aXJTNDBVOWhKVXhucW16RmVPTVJxWFVwQzdiZU0vbHlOUzc3?=
 =?utf-8?B?bUJFb3hNUkdMbVJ0aUE5RExOcCtQaENoTXFvbklsWW5tTWdxZDgwOHExcDVv?=
 =?utf-8?B?SEQ3eFJ6V1cvRFE5Mk54aTR0bnNlMEpDVzFvNlhpTDdpRW8yR0tXNW0rUC8x?=
 =?utf-8?B?aDVtckNhdksvYm1SNnJYN0NYeUsyY1VFWjRzc1FjcDBpb2Q5djU5cUpWZEo0?=
 =?utf-8?B?YlBwQUhvelNvWVBjZHJJZFd0TDREdnRQYjhibXVPc1dQWTZOdHVoSHgvRTAx?=
 =?utf-8?B?WkUwY3E3N1I4Z0tzUU5ZNldpU3BtdE1iNzNrRlBWRERZdW9rY3lydlRqTFVR?=
 =?utf-8?B?c0d2eUNwNmp4UnJPZ29JNFd0QXVmZVVVWHJJSllQY29LZURBZVh2YXlHc2M4?=
 =?utf-8?B?RTRzZGd2REdnM1RodjhYanhjbWJaV0hENkxPREN2eFc2b2VUUG1taWFpdFBL?=
 =?utf-8?B?VTJxVmxDTm1FOWdVVVFvb2R5dlRjODB3RjZpV0phclJmVVRaU0FneW9TMlZr?=
 =?utf-8?B?N3B1Qnk4SUNOTzc2N0FHSmhlbHVTcHRrS1MwK0hRN1orOHNiaGVsWk0xenBU?=
 =?utf-8?B?WnQ4VUZKUy9OTExacDVVNVU0eVZDV2FWTjVBYm93TkFHL2tPdWFpb1pjWWYv?=
 =?utf-8?B?RFhTdTMwK2ZiVWJKb3VtVStKWExLVWgyOThrdDRKV3ZRdWg0RVJuN0NHYjgw?=
 =?utf-8?B?SGgzZXFHVlRCM1FNWUdOUW8zc2h1S1Z6dkdxSm0zQXhEU3VIVVdFUnpWeHUy?=
 =?utf-8?B?TmlEMVpPZDY0Sm94QmpMK2l4WWxCODBuRWhTTEVBM0JmdnNzVTQ1YXd0cDEv?=
 =?utf-8?B?Y043OE9lS3dISkwwNGs1YkpaZjBMQ2lqdDJHTk5XOTZzVklwU2ozaGRRak14?=
 =?utf-8?B?L3FhYzdGU1lUVVljelJJL2FpdzdTSnVCNW4yUnpRcGl6QVk0Z3hKWTUxZ2tT?=
 =?utf-8?B?MGRyQ1l1VjJ6RFhQVS9ubDhPcVVkeTYwdXE1d3h2WE1HVWI1dTI0T2lzckYy?=
 =?utf-8?B?ZDd2SWlaeGJJMjViNEZoSHV2aFN4RFY4dnQzN1ZQRlROQzhmTVdkQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfc108e0-8b4f-44c6-9e94-08da1893f3f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2022 12:41:35.7694 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AquS5g1yPV3rKXCkyXuFgUBZ7vUW1dFpwJoCzyQLhST1ePU/z+O2fFpzsxms0SjtzHIKK4BTHJkj5KyLBFGLsxPRLr4xpnB46BVSeIOF5z8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6320
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
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Sean Paul <seanpaul@chromium.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiA+ID4gT24gV2VkLCBNYXIgMzAsIDIwMjIgYXQgOTowNCBBTSBTYW5rZWVydGggQmlsbGFrYW50
aQ0KPiA+ID4gPHF1aWNfc2JpbGxha2FAcXVpY2luYy5jb20+IHdyb3RlOg0KPiA+ID4gPg0KPiA+
ID4gPiBTb21lIGVEUCBzaW5rcyBvciBwbGF0Zm9ybSBib2FyZHMgd2lsbCBub3Qgc3VwcG9ydCBo
cGQuDQo+ID4gPiA+IFRoaXMgcGF0Y2ggYWRkcyBzdXBwb3J0IGZvciB0aG9zZSBjYXNlcy4NCj4g
PiA+DQo+ID4gPiBZb3UgY291bGQgc2F5IG1vcmUsIGxpa2U6DQo+ID4gPg0KPiA+ID4gSWYgd2Un
cmUgbm90IHVzaW5nIEhQRCB0aGVuIF9ib3RoXyB0aGUgcGFuZWwgbm9kZSBhbmQgdGhlIGVEUA0K
PiA+ID4gY29udHJvbGxlciBub2RlIHdpbGwgaGF2ZSAibm8taHBkIi4gVGhpcyB0ZWxscyB0aGUg
ZURQIHBhbmVsIGNvZGUgdG8NCj4gPiA+IGhhcmRjb2RlIHRoZSBtYXhpbXVtIHBvc3NpYmxlIGRl
bGF5IGZvciBhIHBhbmVsIHRvIHBvd2VyIHVwIGFuZA0KPiA+ID4gdGVsbHMgdGhlIGVEUCBkcml2
ZXIgdGhhdCBpdCBzaG91bGQgY29udGludWUgdG8gZG8gdHJhbnNmZXJzIGV2ZW4gaWYgSFBEDQo+
IGlzbid0IGFzc2VydGVkLg0KPiA+ID4NCj4gPg0KPiA+IE9rYXkuIEkgd2lsbCBhZGQgaXQNCj4g
Pg0KPiA+ID4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogU2Fua2VlcnRoIEJpbGxha2FudGkgPHF1
aWNfc2JpbGxha2FAcXVpY2luYy5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAgZHJpdmVycy9n
cHUvZHJtL21zbS9kcC9kcF9jYXRhbG9nLmMgfCAxNSArKysrKysrKysrKystLS0NCj4gPiA+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+ID4g
Pg0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9jYXRhbG9n
LmMNCj4gPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2NhdGFsb2cuYw0KPiA+ID4g
PiBpbmRleCAxODA5Y2UyLi44ZjFmYzcxIDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbXNtL2RwL2RwX2NhdGFsb2cuYw0KPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bXNtL2RwL2RwX2NhdGFsb2cuYw0KPiA+ID4gPiBAQCAtMjQ0LDEwICsyNDQsMTcgQEAgdm9pZCBk
cF9jYXRhbG9nX2F1eF91cGRhdGVfY2ZnKHN0cnVjdA0KPiA+ID4gZHBfY2F0YWxvZw0KPiA+ID4g
PiAqZHBfY2F0YWxvZykNCj4gPiA+ID4NCj4gPiA+ID4gIGludCBkcF9jYXRhbG9nX2F1eF93YWl0
X2Zvcl9ocGRfY29ubmVjdF9zdGF0ZShzdHJ1Y3QgZHBfY2F0YWxvZw0KPiA+ID4gPiAqZHBfY2F0
YWxvZykgIHsNCj4gPiA+ID4gLSAgICAgICB1MzIgc3RhdGU7DQo+ID4gPiA+ICsgICAgICAgdTMy
IHN0YXRlLCBocGRfZW47DQo+ID4gPiA+ICAgICAgICAgc3RydWN0IGRwX2NhdGFsb2dfcHJpdmF0
ZSAqY2F0YWxvZyA9IGNvbnRhaW5lcl9vZihkcF9jYXRhbG9nLA0KPiA+ID4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkcF9jYXRhbG9nX3ByaXZhdGUsDQo+ID4gPiA+
IGRwX2NhdGFsb2cpOw0KPiA+ID4gPg0KPiA+ID4gPiArICAgICAgIGhwZF9lbiA9IGRwX3JlYWRf
YXV4KGNhdGFsb2csIFJFR19EUF9EUF9IUERfQ1RSTCk7DQo+ID4gPiA+ICsgICAgICAgaHBkX2Vu
ICY9IERQX0RQX0hQRF9DVFJMX0hQRF9FTjsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICAgIC8q
IG5vLWhwZCBjYXNlICovDQo+ID4gPiA+ICsgICAgICAgaWYgKCFocGRfZW4pDQo+ID4gPiA+ICsg
ICAgICAgICAgICAgICByZXR1cm4gMDsNCj4gPiA+ID4gKw0KPiA+ID4gPiAgICAgICAgIC8qIHBv
bGwgZm9yIGhwZCBjb25uZWN0ZWQgc3RhdHVzIGV2ZXJ5IDJtcyBhbmQgdGltZW91dCBhZnRlcg0K
PiA1MDBtcyAqLw0KPiA+ID4gPiAgICAgICAgIHJldHVybiByZWFkbF9wb2xsX3RpbWVvdXQoY2F0
YWxvZy0+aW8tPmRwX2NvbnRyb2xsZXIuYXV4LmJhc2UgKw0KPiA+ID4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFJFR19EUF9EUF9IUERfSU5UX1NUQVRVUywgQEANCj4gPiA+ID4g
LTU4Niw4DQo+ID4gPiA+ICs1OTMsMTAgQEAgdm9pZCBkcF9jYXRhbG9nX2N0cmxfaHBkX2NvbmZp
ZyhzdHJ1Y3QgZHBfY2F0YWxvZw0KPiA+ID4gKmRwX2NhdGFsb2cpDQo+ID4gPiA+ICAgICAgICAg
cmVmdGltZXIgfD0gRFBfRFBfSFBEX1JFRlRJTUVSX0VOQUJMRTsNCj4gPiA+ID4gICAgICAgICBk
cF93cml0ZV9hdXgoY2F0YWxvZywgUkVHX0RQX0RQX0hQRF9SRUZUSU1FUiwgcmVmdGltZXIpOw0K
PiA+ID4gPg0KPiA+ID4gPiAtICAgICAgIC8qIEVuYWJsZSBIUEQgKi8NCj4gPiA+ID4gLSAgICAg
ICBkcF93cml0ZV9hdXgoY2F0YWxvZywgUkVHX0RQX0RQX0hQRF9DVFJMLA0KPiA+ID4gRFBfRFBf
SFBEX0NUUkxfSFBEX0VOKTsNCj4gPiA+ID4gKyAgICAgICAvKiBFbmFibGUgSFBEIGlmIHN1cHBv
cnRlZCovDQo+ID4gPiA+ICsgICAgICAgaWYgKCFvZl9wcm9wZXJ0eV9yZWFkX2Jvb2woY2F0YWxv
Zy0+ZGV2LT5vZl9ub2RlLA0KPiA+ID4gPiArICJuby1ocGQiKSkNCj4gPiA+DQo+ID4gPiBJIGRv
bid0IHRoaW5rIHRoaXMgaXMgYSBwYXJ0aWN1bGFybHkgbGlnaHR3ZWlnaHQgb3BlcmF0aW9uLiBJ
dCdzDQo+ID4gPiBsaXRlcmFsbHkgaXRlcmF0aW5nIHRocm91Z2ggYWxsIG9mIG91ciBkZXZpY2Ug
dHJlZSBwcm9wZXJ0aWVzIGFuZCBkb2luZyBzdHJpbmcNCj4gY29tcGFyZXMgb24gdGhlbS4NCj4g
PiA+IC4uLmJ1dCB0aGlzIGZ1bmN0aW9uIGlzIGNhbGxlZCBzb21ld2hhdCBvZnRlbiwgaXNuJ3Qg
aXQ/IEl0IGZlZWxzDQo+ID4gPiBsaWtlIHRoZSBraW5kIG9mIHRoaW5nIHRoYXQgc2hvdWxkIGhh
cHBlbiBhdCBwcm9iZSB0aW1lIGFuZCBiZSBzdG9yZWQgaW4gYQ0KPiBib29sZWFuLg0KPiA+ID4N
Cj4gPiA+IC4uLmFuZCB0aGVuIHlvdSBjYW4gdXNlIHRoYXQgc2FtZSBib29sZWFuIGluDQo+ID4g
PiBkcF9jYXRhbG9nX2F1eF93YWl0X2Zvcl9ocGRfY29ubmVjdF9zdGF0ZSgpIHJhdGhlciB0aGFu
IHJlYWRpbmcgdGhlDQo+ID4gPiByZWdpc3RlciB2YWx1ZSwgcmlnaHQ/DQo+ID4gPg0KPiA+IEl0
IGlzIGNhbGxlZCB0d2ljZSBmb3IgRFAuIE9uY2Ugd2hpbGUgYm9vdGluZyB0aHJvdWdoIGEgdGhy
ZWFkDQo+ID4gc2NoZWR1bGVkIGZyb20ga21zX29ial9pbml0IGFuZCB3aGVuIHJlc3VtaW5nIGZy
b20gUE0gc3VzcGVuZC4NCj4gPg0KPiA+IFdpdGggYXV4X2J1cyBhZGRpdGlvbiwgdGhpcyBmdW5j
dGlvbiB3aWxsIGJlIGNhbGxlZCB0aHJpY2UgZm9yIGVEUC4NCj4gPiBPbmNlIGR1cmluZyBib290
dXAgd2l0aCBhdXhfYnVzLCB0aGVuIGZyb20gc2NoZWR1bGVkIGV2ZW50IGZyb20NCj4ga21zX29i
al9pbml0IGFuZCBwbSByZXN1bWUgbGlrZSBEUC4NCj4gPg0KPiA+IEkgd2lsbCBjaGVjayBpZiB3
ZSBjYW4gdXNlIGEgbm8taHBkIEJvb2xlYW4gZmxhZyBpbnN0ZWFkLg0KPiANCj4gQXMgdGhlIGRy
aXZlciBoYXMgYSBzZXBhcmF0ZSBkcF9wYXJzZXIgY29kZSwgaXQgbWlnaHQgYmUgYSBnb29kIGZp
dCB0byBwYXJzZQ0KPiB0aGUgRFQgb25jZSBhbmQgdGhlbiB0byB1c2UgYm9vbGVhbiBmbGFnIGFm
dGVyd2FyZHMuDQo+IA0KDQpPa2F5LiBXaWxsIGFkZCBpdC4NCg0KPiAtLQ0KPiBXaXRoIGJlc3Qg
d2lzaGVzDQo+IERtaXRyeQ0K
