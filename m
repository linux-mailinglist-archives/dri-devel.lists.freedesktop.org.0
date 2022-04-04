Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1F84F168F
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 15:53:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C1110F057;
	Mon,  4 Apr 2022 13:53:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.140.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0935110EA8C;
 Mon,  4 Apr 2022 13:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1649080381; x=1649685181;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Vz8IdrLj6QHDVZN5ulfC4WUZrcSPMiOGYBxN6XxsnOk=;
 b=Y+89ZxooBjI4G0lwH4w/z0cCz2La+sVLKnK9Jb7ID0aGDlpb9PoiUFSp
 jcU11aHovxOLEJS8jiQKpRgLAvmeWGOrV8ldXeARYyZ9Ur9MZm0B3lquf
 TtemfPhmnszLzW+QS47IWvmx3mMXTz0AHQAjHR89JDuXt15zjTbUM+lKW c=;
Received: from mail-mw2nam12lp2048.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.48])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2022 13:53:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P1TobAoJ2opOUxlumH0xbUGPyOWLSWfhJLDHGqAxOB3JGkeSZaA8Wxx8vnmmFVUC1y49PrJ7MHrDP6NOmHl3A1UCNZ0fe7Av7k4yZ/uB/7WNj7l6lsMrZJA0d962Eya0/YynJR/xi5rscYVTa1t5DXg34ij97G5ZBY5W3F8Sk8tU20j3Px83TmYPt6rVKXNHFjZtyJdFTiLwiWpa9BJFnIxQCAMSVsDME99Byidc74j9RVmfuniTwQrUof0D3KjRkXzsL3J4DNFJ77Nr+VUknnR2qOqUEueCi2V51O6veDWEn9dBGHbUc94fV+5+YnSndmBChoGVNTLAKMQvGnDFqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vz8IdrLj6QHDVZN5ulfC4WUZrcSPMiOGYBxN6XxsnOk=;
 b=jgsbR8TIqePDtAkZe/q8bWYTT7TRuf4PMyLCUDroty2JIgaefuaX89YO7QAdzohVpJAvRFHX6H9O/W+HyFKjes+9rMVF7KwZQ6QIL+S86dlvLpQ6VlSdGvJ1Wre3GbrF6HLArIkMK4X95owyYcBLQqpS7HAypYaREYx9UUxQKjKg2QbRAA1X/nviMswbFFxEKeFnrKbImjSLCutGs00Mxtuw9ryFqFYcLSHCV7pAt8hbLU625X/q9cAH3qkI0nHSK+ibGq2J2ex89c4FTiVQGgovAV+70ohR30Kv8f0SgDAIorCza6D8kTknrpA4lppFekAUI8vC8Gerj+hTt9qq/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6)
 by CO6PR02MB7682.namprd02.prod.outlook.com (2603:10b6:303:aa::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 13:52:55 +0000
Received: from MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::9485:c59c:6877:f492]) by MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::9485:c59c:6877:f492%6]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 13:52:55 +0000
From: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
To: Doug Anderson <dianders@chromium.org>, "Sankeerth Billakanti (QUIC)"
 <quic_sbillaka@quicinc.com>
Subject: RE: [PATCH v6 6/8] drm/msm/dp: remove unnecessary delay during boot
Thread-Topic: [PATCH v6 6/8] drm/msm/dp: remove unnecessary delay during boot
Thread-Index: AQHYRE/OalQb15tWkU6TQa4mr1tu5azaJAGAgAWp7UA=
Date: Mon, 4 Apr 2022 13:52:55 +0000
Message-ID: <MW4PR02MB718631182DC72076DC794C1DE1E59@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-7-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=UX9Mg71EKvgNp_wNG5q7_ugBgVPbcFWFX5XBG+cQCi8Q@mail.gmail.com>
In-Reply-To: <CAD=FV=UX9Mg71EKvgNp_wNG5q7_ugBgVPbcFWFX5XBG+cQCi8Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1793c005-6201-461a-0261-08da16426b9e
x-ms-traffictypediagnostic: CO6PR02MB7682:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <CO6PR02MB768240B97049CDC3516AABBA9DE59@CO6PR02MB7682.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iJa0lxl8tK75H8A6GULGZCUvMMYMckv7T0bCuDah+taXLsk/V6KxBd/7Sa9phYQP6hd1XsZQcNjpiDOcUpzPHDfgyL4j10kj/preQFoae0MQ2o8L9DCLgarOPgWLicDQtmsUTIHUH4hRFULmUCKu+JpYhsf1LCvqUZ1ClU7P59wSmu2byZW2OJITHTqdriDtQI4vxpGyNZEnEvEAVApkoI/Lbg1BU4uIRXo3TlFcvq/pBlO0CpL1VI90Ns4GK1StwzQElLjLyCZCjIG/I7v4ueVPxXSb6OIkXA2ne4bYe2o1gI0oKDHBFOvTnTT/bBlD+C8OxxB4VRDRi5YOel9gWPdrC87PXNMB5DEnuT9psev2rIiDnjdXhXx1z6sjlPwAthCMokCxSWV9WsH30Um3DxNSoKyoWOtq9hwsetOF3SYfHGVAnbSffS4EPv1MY8/+PITrJr/hJ5DXbTqqb+LZCQ8K8uI+krNmE4u1kO6iOgIRHJNu2aopfB93aQKIJgBDnp8MxHR/gZ8p+LXoS3thZ+uYRFoWCoHa1qs9yarht5UNTDQ7tkJH+1dbVnxvXz0TBMNtsq4DRZqzX2hTbiJbrWXzMXtipSrSDJAUWkbHXJJcpZUGyVbWtyME3jJbboeV+Bm/42sFaFjNzXGhnaciyjVSz0wS68kf/mzd0N32F9dugQuZsKVLJNxR7YGEgAwc7hAyAaIkbeYFtC1yekoMVS7oqZBRqNs58+03QozTuL/ZUkHFkERNjZgT319XiBdgR5s0tEo66Szso44zIlZ3Hm8crA+Hlbrbhjx5nrHSQqQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR02MB7186.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(4326008)(86362001)(76116006)(66556008)(66446008)(66946007)(38070700005)(2906002)(38100700002)(5660300002)(122000001)(7416002)(8936002)(66476007)(52536014)(64756008)(83380400001)(53546011)(54906003)(107886003)(6506007)(7696005)(26005)(186003)(316002)(9686003)(110136005)(966005)(508600001)(71200400001)(55016003)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z0FXZ2tkYjdRUmxUUTJiVEpkY2QrZjlyYlBYMEVpV1pmZEZsNUE0RmdVd2VY?=
 =?utf-8?B?MTRwU1lRLzFLeEVWbWJhdHhGcThWbDVDOGkxVjQ0RURBTko0RWYyd3Uva2oy?=
 =?utf-8?B?ZXJWcTUyOEVpR1Exdzc5VTNBMzVMcW1NRDljRHBkT0NVbHdneFlCKzdLYnV2?=
 =?utf-8?B?VzdTbXhFeS9JVTVDM0Q0R0VXM3JHSEhka0ppbFFsK0xQRnhCc3dXOVBvbUpk?=
 =?utf-8?B?cDNUQWxiZVd3RlNrUkVtNDV0UzBnM1BiSDNWK3BHc1NvNmRlVmtTS0NST09D?=
 =?utf-8?B?WldRaGE0YmN2eCs5UFRhcG9LdXZjcTlGMEx2akxFM2NYMU5HSXBSK2oxREVh?=
 =?utf-8?B?VFZVZFpTL3A5U0c3NmJpSTJyblFCbWxTZTUvcmxOZWw0TmNFTStSOE40Zm5p?=
 =?utf-8?B?UkZZRnJqV3ZXeGRyMkFmbkZsY3owUFcwMU5LSHdrSjJHQVdvb21aU29QN3Jm?=
 =?utf-8?B?dFdkLzlzQTdaQjdXT1ZqdmdCOFNUU3VUcy81WlJTSG02RXNjTThxRG02SU1G?=
 =?utf-8?B?ZGxLQnYwa2hPaWN2cmxXc1M4ZlMrUkdSQ0Iva204Q1E0eWJpQndiTGFDUjhN?=
 =?utf-8?B?Z1gwNFFkR3RDNTJNaGhDLzBDaVdYK01aaFBGSSt2MzcxTVV6WG04RDBnYWNi?=
 =?utf-8?B?T1Z5SldpVm90TlRmME5ZN2dsSE1sRjBycHJaVG9namhkd0Z1Tks2ajVrSllB?=
 =?utf-8?B?LzJTSy8wS01ONE93K2VJam4xc25TbzZZMDM2YmZJUHl5bTEzMXkyMDBlc05q?=
 =?utf-8?B?dlNJUlV1a0l0NGtOMHJtcmNpZ0didUVhTXdwdG85VVJzUGNJOTFOSjVwTERM?=
 =?utf-8?B?VkZRRkxMNnBGYzRRcEJHcTZha2l0eEVLL2ZSdk9QbVBJQkNsWHlGbDdDRUZH?=
 =?utf-8?B?Z29DOVV0bXArOTFvMzNvR29NdkllRDBSdjIxTUVOaExGNW9jSWswVUJXTkhU?=
 =?utf-8?B?Rm5WelVtQnNxZDY5cFM4dVRuY1BTQ2lYN1RSandQdHF2TXhHOTZjdHc1V2RJ?=
 =?utf-8?B?aGpVQmpBc2daeEtRNGoyM1JtazMzWXJRRFRrS1MrVXh1ZGp6WFJBUTlwQ3RK?=
 =?utf-8?B?QjVPYWpISmRSa3pOU1lJNEppdjMvOEhnYm51NmFUN1JSQlZGRzBRU1J2Tkg5?=
 =?utf-8?B?VmVlMU5TcHh2ZFc2RmVWMjhTSmtBQk9zbmZ1WVVxTU9Kc3ZwTzc2a1RzekdK?=
 =?utf-8?B?alhIWGdNTVdWcnRIbEV3K2FMZTkvZ0tjV3YyaHFkZFdqeEYzS1dPTVd1WW9B?=
 =?utf-8?B?YXhnTmx3bVkyajE4QUJzUWlKNlJ0TGI5dzdzT3NTQzA3cnphZ0hzR3VYcTc0?=
 =?utf-8?B?dy93WXQvUFc4OUxXR3ZWdm9GcW9qeCtiVXR5aDdWWlgvUFJQNGdLSitrZFlo?=
 =?utf-8?B?VFJhcGIrSWpCSzRzZlhQempSWFBuVHV3RjVTVTdLUFJBREdBQkVWWTlqTG0w?=
 =?utf-8?B?MUcwUzFQVGZVQS9vYkdObWdaL1dKbjZrS1pwUmZOeXpsdDVJdlhXYkZyU0xB?=
 =?utf-8?B?Kzc5V3NzRDhsd05lZWM5MnJNSVY4OElhbE5TbmJyU2xuUm5VRkp0Z3AvQTd4?=
 =?utf-8?B?UXMvRUFmYWVJdENjb3l3S2dBQUZ1bzRiZ2Z1bEJDZ0k2MnNvSFF4NUpCWkUy?=
 =?utf-8?B?Z1V3OWxEa0g4MUZyaW1NZ3VZUjJyOFUxMnFrSXdjcDMreWQyaFNrZlV1aGNP?=
 =?utf-8?B?cnh1Ky9ab0NwTzB1TUlkYzZwZUJYWTBpYTlsVVFmOGtoN1lzd1ZPWDRadHhh?=
 =?utf-8?B?VVB6cW91enpKa1pTSnZUQTVRa1lDSDIzam94K0o2OWw4cDUwSGdPQWlhOEpQ?=
 =?utf-8?B?ampQdlQyaTVjNTlFTTVMSUdHZ3NNWkI1cVRtWndRbzRjWG1KS2hBNGswUm0w?=
 =?utf-8?B?ZStFUU41RHpNVG5aQ05XVyt3TWJRbUJ4a1hsR0JYZ3A0T1NIUm5qUE9WWGpl?=
 =?utf-8?B?RDA5WUpUNU41cjk5QWNzeFNOM2hzQkE4bWd6d2VJaEE3WU9jbUZva2NQRlVw?=
 =?utf-8?B?V3BUTjgwc2l5ZzVac3pXTkRJbS9tQzVqaVZKbXIxMzllZzdSb0hYN3ZEMGd1?=
 =?utf-8?B?eEhZeUREbml0MzlVWXFaWTlSdnkrN1dCN0ZkMlMyQmJ2dml0bWRSN1FGMWVT?=
 =?utf-8?B?MjNKcGxENGllbGtRR3V4MExIcW1iYm5QaWJiWHhSSVRxYU9wTk9YQmhBMFpw?=
 =?utf-8?B?NlVVb3NhMVhia2U0ZnNqVVkwTmdCS21sSDRtVGFDd1BuOWZjOFBQOEVGNjZj?=
 =?utf-8?B?bWpkZjhycWRLaURYQi8yZnlHRGh3NkYrc1lXQlRnUkJNTmxrU2oxNkdtTzA0?=
 =?utf-8?B?eHFJQUVhaXNGcm9VV1RVZVJkR3BmOTdRWTZQek1xRmlGd2dFZERQZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1793c005-6201-461a-0261-08da16426b9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2022 13:52:55.3641 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7ujIatp/f0sKtB+1JF+4lD6aSMnUWj41Hx3k0VVFXTa0lDQeaKa4JxuHrx4RKQQSAstKYLPUSEKWDRkFJVXOn76ANqiuZmefYT3THot+zhc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7682
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

SGkgRG91ZywNCg0KPiBPbiBXZWQsIE1hciAzMCwgMjAyMiBhdCA5OjA0IEFNIFNhbmtlZXJ0aCBC
aWxsYWthbnRpDQo+IDxxdWljX3NiaWxsYWthQHF1aWNpbmMuY29tPiB3cm90ZToNCj4gPg0KPiA+
IFJlbW92ZSB0aGUgdW5uZWNlc3NhcnkgZGVsYXkgaW4gZXhlY3V0aW5nIHRoZSBFVl9IUERfSU5J
VF9TRVRVUA0KPiBldmVudC4NCj4gDQo+IFRlbGwgbWUgbW9yZSBhbmQgcHV0IGl0IGluIHRoZSBj
b21taXQgbWVzc2FnZSEgV2h5IGRpZCBpdCB1c2VkIHRvIGJlDQo+IG5lY2Vzc2FyeSBhbmQgd2h5
IGlzIGl0IG5vIGxvbmdlciBuZWNlc3Nhcnk/IElucXVpcmluZyBtaW5kcyB3YW50IHRvIGtub3cu
DQo+DQoNCk9rYXkuIEkgd2lsbCBhZGQgcHJvcGVyIGRlc2NyaXB0aW9uLiBUaGUgRFAgcGh5IGlz
IHNoYXJlZCB3aXRoIHVzYiBhbmQgZXhlY3V0aW5nIHRoZQ0KZHAgcGh5X2luaXQgYmVmb3JlIHRo
ZSB1c2IgcGh5X2luaXQgd2FzIGNhdXNpbmcgdXNiIGRldmljZXMgdG8gbm90IGZ1bmN0aW9uLg0K
DQpFYXJsaWVyLCBlbmFibGluZyBwaHlfaW5pdCB3YXMgZG9uZSB3aGVuIHRoZSBFVl9IUERfSU5J
VF9TRVRVUCBldmVudCB3YXMgZXhlY3V0ZWQuDQpTbywgd2UgaGFkIHNjaGVkdWxlZCBpdCB0byBl
eGVjdXRlIGFmdGVyIDEwIHNlY29uZCB0byBsZXQgdGhlIHVzYiBkcml2ZXIgY29tcGxldGUgdGhl
IHBoeV9pbml0IGZpcnN0Lg0KDQpLdW9nZWUgbWFkZSB0aGUgYmVsb3cgY2hhbmdlIHRvIG1vdmUg
dGhlIERQIHBoeV9pbml0IHRvIGV4ZWN1dGUgYWZ0ZXIgdGhlIERQIGlzIGNvbm5lY3RlZA0KaHR0
cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LWFybS1tc20vcGF0Y2gvMTY0
MjUzMTY0OC04NDQ4LTItZ2l0LXNlbmQtZW1haWwtcXVpY19raHNpZWhAcXVpY2luYy5jb20vDQoN
ClNvLCB0aGVyZSBpcyBubyBuZWVkIGZvciB0aGUgRFAgZHJpdmVyIHRvIHdhaXQgMTAgc2Vjb25k
cyBmb3IgdGhlIHBoeSBpbml0aWFsaXphdGlvbiBhbnltb3JlLg0KDQplRFAgUEhZIGlzIG5vdCBz
aGFyZWQgd2l0aCB1c2IuIFNvLCBpdCBjYW4gYmUgcHJvZ3JhbW1lZCBhbnl0aW1lLCBoZW5jZSBu
b3QgbmVlZGluZyBhbnkgZGVsYXkuDQoNCj4gLURvdWcNCg0KVGhhbmsgeW91LA0KU2Fua2VlcnRo
DQo=
