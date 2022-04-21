Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 269A150A5F7
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 18:39:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A771110E11B;
	Thu, 21 Apr 2022 16:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.140.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F30E210E11B;
 Thu, 21 Apr 2022 16:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1650559142; x=1651163942;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=teBGALF4kS+lMrnCbfjDCNUPP71SbtREbkIbkyksw+M=;
 b=EK6KUZqdj6nW1na+YijV3HAVkLlu9VxRviwNHUIb4ci9f6++Qd6f5NS6
 ysMfZgtcjRlW6vokISzfAy+8taU/jB1xhOnoEgOChrEEBB/oB/K/cpUG6
 kfINws6YlnU7/WICkbXej2JOKlUxIjNtWFahgxcZZk2HZT1Rop8o0+akj Y=;
Received: from mail-dm6nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.168])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 16:38:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bjtcd3/gNS7lJ/ROkY1htFyATrRmm0wi4zdpMPUxicWjKK+B3SHGjxU8uAUxsoZuZRjVDK45A3mcPWa9Y4wPWmkuEe9QrFGzezPJr8YjYOrlDRQzAspanwIUjqh5y15NAvnTxUyV78DurPjh+g65Tc3ksgRW0XT0ZKVs0Sc7XO20PfOO5llBjR0kTGQp1BxM9sl3L+oVqXsn8NkSj45FHvy5qmh7FHCkHLNE2qWZvc0Ulo0X4/k/AupRCUCnsoNKTbEWr5QBcrHlE3YFYonj6OQ6GhueHwHtIj4K+MUCD5xpz7SEOOFEc2rXiFW5cQ6Wguny46MK0iWNWw2O1SL0XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=teBGALF4kS+lMrnCbfjDCNUPP71SbtREbkIbkyksw+M=;
 b=kQC/txtkyRp8tIIZB9k1OUPRCpymsaRb48j7xyyNc899fY7CRy6Ns9bevlh+QazB6J4z0/Nch9esUnYyutyjmPy/XHaVAcWCsgSllNspi9/tIGGZGqCeSuQr++2lU4g1j0lfTeVJ8JZ1ZsqiBsdf/nfqWMSZt9fyrzxqB8VIl4mIjidHY8IhGY/sqMaHdQdyw+17msqjvoaRsS0uXDZCN7EjyUTqTuZRTSPgki6AX7GJaBNzY3O0EUmMZ/AMLqzdTY87ZeOMNOgza8KbqN9jhU0M7XI0lTYYzJNOQvUPZvL9k33E/N4BRkN+3kQnbmAojCkkiYimCOcQg/kDrZrjYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6)
 by SN4PR0201MB3408.namprd02.prod.outlook.com (2603:10b6:803:50::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.25; Thu, 21 Apr
 2022 16:38:57 +0000
Received: from MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::1d18:abb7:c311:543f]) by MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::1d18:abb7:c311:543f%4]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 16:38:57 +0000
From: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
To: Doug Anderson <dianders@chromium.org>, "Sankeerth Billakanti (QUIC)"
 <quic_sbillaka@quicinc.com>
Subject: RE: [PATCH v8 2/4] drm/msm/dp: Support only IRQ_HPD and REPLUG
 interrupts for eDP
Thread-Topic: [PATCH v8 2/4] drm/msm/dp: Support only IRQ_HPD and REPLUG
 interrupts for eDP
Thread-Index: AQHYVY1ZsNJe929Of0aaK86TusFo2az6fHWAgAAVA0A=
Date: Thu, 21 Apr 2022 16:38:56 +0000
Message-ID: <MW4PR02MB71869CCA50E1706926C4B6FAE1F49@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <1650551811-24319-1-git-send-email-quic_sbillaka@quicinc.com>
 <1650551811-24319-3-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=UVmUG0t-8wFXT-NT1-naojeJ_gcd8eEVr96AnMos0m4A@mail.gmail.com>
In-Reply-To: <CAD=FV=UVmUG0t-8wFXT-NT1-naojeJ_gcd8eEVr96AnMos0m4A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 38d9a765-2f68-4ee2-afdf-08da23b56e1d
x-ms-traffictypediagnostic: SN4PR0201MB3408:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <SN4PR0201MB340830E22FE3AE154BDC9FF19DF49@SN4PR0201MB3408.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NggW8Ngu+g8rIO4CvjLEs/wVNB8vgt/UW0J4fTN33EVrau4FPMcYZA1mGzMJUJKbIpL1VIKrAsylRwQlUFIIy1k2W2OgTngqlvZRRHYsg5FurI92ueA856D6YPof1JKvhI63g5vIJZa2X7QqB4hHyw572Lc2du3lZN9HdF2GzXpxCbToVDIscqissCPVVaxWDvk4dsg/TE/5lgN5qLFZU3bvqoYiEjYIuT//wUpGEzGJigiJDFSK7572vbqeKsjhc6FOEfmJ3NXceLkXpv/ndF+i8QU30I9ua6V7G69wAxvyELYzz4F0eaa+ycKNdwdzcti5hHuaZUT0WKQgFX55v//JeA8cVEkEgEg/80CMxMpvpyNEGQwzfAAr240gIT+6hAGLQ0sxz6iJB7lEjc6zg8KGUbXYoHUUin6fAdnrQDcIOm8k0J5E50vWJO/6oAWNkA19z8mREt42BYkX0bylhRNOXfzDkKKMOT5BMoRapFl6AZF6eJl665gVnrMak5u7DNLzjouCfSG01z/GR0bxn8E9GVgTmWmW7bR7yABtOP73mkOuawlhSEds+V9ZZUKuG/8dQGiXw4sy7/Q86abNTsMPIqke736xwOiYtRNEclS0i134BqRXuvPv50y0gs2bj7mCVROAqcCPDFRg/HmKGIaP8ah3cJbCdFFXQe568gNTFCaLh+k3x0qpsqR+hupEq3ThyFtH90JqrBN85wLvYA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR02MB7186.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66556008)(8936002)(66476007)(66946007)(38100700002)(54906003)(76116006)(110136005)(64756008)(8676002)(316002)(5660300002)(66446008)(33656002)(38070700005)(2906002)(122000001)(55016003)(4326008)(508600001)(86362001)(71200400001)(52536014)(7416002)(83380400001)(9686003)(6506007)(7696005)(186003)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dFYrYWU4cDEzSDBPRFpDVDl0ZTY0UXgvUWcwT084cWlxKzM0VjNoRGpWdnkw?=
 =?utf-8?B?R2ZSTC9ISG03UTNwL1IxRyt4YjZaaVBRT1hLNHpLNTlmWHhJbGJSRmk3aitB?=
 =?utf-8?B?eFh3TG9FTFROS1NpL2JVU1dCSGowb3V6ZWNObmU1VjYvRmludVRoc2Jrc0w3?=
 =?utf-8?B?MjBxcUxEbVFscHRzOFRxR2dxNXEyK2ZGTVdScHlaOEhERnVzVU1rTEZQbDZ3?=
 =?utf-8?B?RCtSaWNGWWNaY1pvNHBnK1dzUUNwNWlTQ0s1b2FMdjVEbEFnRnhTS0ZMaHFT?=
 =?utf-8?B?dElaaU92T0NXS09YSitteE5mMS9XZnhod2t1dHd6dTdnclpscUNhcG5QWVht?=
 =?utf-8?B?djZ6cURSeWl1TS8wdml1alJIMSs2Z3FLbTZZQk12OFhqMUcyOWhxdmtGNmph?=
 =?utf-8?B?dGlIOGVDNlY1MlhaQzZGcUlQSlpCWGVJa0dBRitmazZzOUdmMVF5OGZoUHlL?=
 =?utf-8?B?NUcvWFoxei9qcndLOHBsOGVRUGtIVmRjUHhTRWxZQ0R0c1NoVFZKN2ZhOERW?=
 =?utf-8?B?S3UyWnBuWlU2ZEw3dnJCaVlZUjlrMVFJVFZuMlY1VmM0WkhaZmJmOTZPNXhv?=
 =?utf-8?B?dFBDeUczNktwT0t0OUtsUXltMWVSZG1BTExHcDZsRzhXdEhrcmlpdm5lU1Z2?=
 =?utf-8?B?RnExZjhid3ovSFFBcjRJT21wUk1qWi9JanViOFBzcHkxZklycDNZY2MvenpT?=
 =?utf-8?B?QTQxOWJkaTZrckxFOFcwUFFpcTY2QkxIdHlNb01Wa2NvMGZUZ3hzaTRaNlZX?=
 =?utf-8?B?NVMxTjVsbDdHRkgyb3pScWxnTFV2V0VtVXV0SlZXRGlCdDBiTDczUlc2YnZP?=
 =?utf-8?B?Q0l1dWtJWkc3cjNEaGJEVDV3M2JOWWQySmhRK2hQS2YvZ0lhVjBxUWlscW1B?=
 =?utf-8?B?aUwxWlcwL2dnc21JeUw5Q0Jhcm4ySDV5czN3NWRrOTQzNkxDNFBvNWFvOUY4?=
 =?utf-8?B?WTM4RWtkNUxkTkt0THd0TW9QS3JVV251bTJsMGlUU0NJTFNVbWFNd3d5YytF?=
 =?utf-8?B?b1hvMWRhbnJxMnVHb25IMTgvRkluQXJYQUFvYy9qa3lSUFdKMDVxZGRYaCtW?=
 =?utf-8?B?RmxIRkhQUDYwdHRpWTlOdWxqdFN0ZUpZclRUYXlMM1cvYjA5SEdxcURwS1Rk?=
 =?utf-8?B?UzR3WkJnZGhXdndHQVVISFhIUi9oRm5UeXpBQnMyWU5KbWRNT3ptdEpRR3hM?=
 =?utf-8?B?WFMydzFBaUx5OWUzRHBUZ0ZuaFZqd2x3Sk1qMEsyRC9CSXBMVHN0blJRaFBm?=
 =?utf-8?B?NG9uZFR2NnRkd2RCMGhZdW9EanBvZ1ZaNlNPOTBlUzhtRjlyWHpFL0duQks0?=
 =?utf-8?B?MUl1OTVuZFM2RTZhQ2ZQZFNmZjZQdUpIalU4TXlDYTNIemdoR0JGNmpLOTA5?=
 =?utf-8?B?eHZKaTl2dkhJN3F5RldnZ3BLcXFrMHFZeFZWMzZvV2hOeW9iZmlwckh0a1V2?=
 =?utf-8?B?UmlERnRCb3FXNjdPSWM1SHI4dEZJY2VaeCtEY2FUVzFzbUxjSDdnSGU1VUxs?=
 =?utf-8?B?RnFJbm5ndUN4Y0x2d3I0Q29TV3YxdXFyUkZUL0dKekJHMUxLMk1YaVB2MG9v?=
 =?utf-8?B?SkFuOXFtZWFTdS8reDlDTE90M3k2emtoL2VzeDArMmxMMnNwWVJaVWdZQm5E?=
 =?utf-8?B?eHVydk9haGFhelJEZlRwYXFpR1kzMWNFTUhLMTk4OVZ4YWtzQXV2OFNNeUEr?=
 =?utf-8?B?ZjBFdjZHMDdJWWhQQ1ZaRXNqOEtjRmhESmtMaG1WQXBkbDZ2WTlBdXVSNXYx?=
 =?utf-8?B?WnJSZDJKVU9GZ2s4KytNTy95WG43bmNzRHp6RURZbUM5aE5iSWNjczFVdmlO?=
 =?utf-8?B?NndXbytxaDdYc0o1ZlNCVDR1SVhsQ2V0Zzl2V1hBUi9PTFVXVEM3ckFXc1dS?=
 =?utf-8?B?bUJ6eTJEQlFOdVp2d2U2dGhsOEM4dDAwQUEyNGRuV1pmMVAvMFFKYWtMQXJw?=
 =?utf-8?B?eiszUEkyVUZ1bEsvemkxVWFQTUREQTZ3NDcwK3NFUk84b21lSDFGV1NlbUdp?=
 =?utf-8?B?cW5XMEJZTWVPcS9WbDRpakFTbnorQ2pmelVqbHViRTViTmJma29BR2JNOXU2?=
 =?utf-8?B?bVp2U0FzTEp6c2tFQTdOcHIxdEJUVGlKcCtoU2hRY1ZFWTFYQXB0VVMxVlRq?=
 =?utf-8?B?SnJzdEdtK2kvaVB3ZlIzTkV4d3FiVjdNa0lKYWV2NVhrRXNMWXBZZHpabjlI?=
 =?utf-8?B?WFFkRU00RG9oY3BUU0t4UUg1SHJIbjFXczk0MWxUamtBU1ZpVlN1RDR6TnZh?=
 =?utf-8?B?eGJnVGJqQXJWWHZsYUMzbmQvZExGNjB6R2VJUWlaUW1zSW5iK1dYZXFuTTZy?=
 =?utf-8?B?NCtJNnEyNHArMCtYMTNUVjM4NHFYSDVlSUJpUmd4dEY1WmdHbHNrZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38d9a765-2f68-4ee2-afdf-08da23b56e1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 16:38:56.9522 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2r5d/ot4BiHoBfVTcZhnIxI7Jalkkf0BFN64YJobGCbGRiwSbFNrMZ3slCGWZLQdXoNqhs92yhT9m7ACDywM5dU6khSeKBGxMX3ZKZUeYeg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB3408
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
 Sean Paul <seanpaul@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG91ZywNCg0KPk9uIFRodSwgQXByIDIxLCAyMDIyIGF0IDc6MzcgQU0gU2Fua2VlcnRoIEJp
bGxha2FudGkNCj48cXVpY19zYmlsbGFrYUBxdWljaW5jLmNvbT4gd3JvdGU6DQo+Pg0KPj4gVGhl
IHBhbmVsLWVkcCBlbmFibGVzIHRoZSBlRFAgcGFuZWwgcG93ZXIgZHVyaW5nIHByb2JlLCBnZXRf
bW9kZXMgYW5kDQo+PiBwcmUtZW5hYmxlLiBUaGUgZURQIGNvbm5lY3QgYW5kIGRpc2Nvbm5lY3Qg
aW50ZXJydXB0cyBmb3IgdGhlIGVEUC9EUA0KPj4gY29udHJvbGxlciBhcmUgZGlyZWN0bHkgZGVw
ZW5kZW50IG9uIHBhbmVsIHBvd2VyLiBBcyBlRFAgZGlzcGxheSBjYW4NCj4+IGJlIGFzc3VtZWQg
YXMgYWx3YXlzIGNvbm5lY3RlZCwgdGhlIGNvbnRyb2xsZXIgZHJpdmVyIGNhbiBza2lwIHRoZSBl
RFANCj4+IGNvbm5lY3QgYW5kIGRpc2Nvbm5lY3QgaW50ZXJydXB0cy4gQW55IGRpc3J1cHRpb24g
aW4gdGhlIGxpbmsgc3RhdHVzDQo+PiB3aWxsIGJlIGluZGljYXRlZCB2aWEgdGhlIElSUV9IUEQg
aW50ZXJydXB0cy4NCj4+DQo+PiBTbywgdGhlIGVEUCBjb250cm9sbGVyIGRyaXZlciBjYW4ganVz
dCBlbmFibGUgdGhlIElSUV9IUEQgYW5kIHJlcGx1Zw0KPj4gaW50ZXJydXB0cy4gVGhlIERQIGNv
bnRyb2xsZXIgZHJpdmVyIHN0aWxsIG5lZWRzIHRvIGVuYWJsZSBhbGwgdGhlDQo+PiBpbnRlcnJ1
cHRzLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFNhbmtlZXJ0aCBCaWxsYWthbnRpIDxxdWljX3Ni
aWxsYWthQHF1aWNpbmMuY29tPg0KPj4gLS0tDQo+PiBDaGFuZ2VzIGluIHY4Og0KPj4gICAtIGFk
ZCBjb21tZW50IGV4cGxhaW5pbmcgdGhlIGludGVycnVwdCBzdGF0dXMgcmV0dXJuDQo+Pg0KPj4g
Q2hhbmdlcyBpbiB2NzoNCj4+ICAgLSByZW9yZGVyZWQgdGhlIHBhdGNoIGluIHRoZSBzZXJpZXMN
Cj4+ICAgLSBtb2RpZmllZCB0aGUgcmV0dXJuIHN0YXRlbWVudCBmb3IgaXNyDQo+PiAgIC0gY29u
bmVjdG9yIGNoZWNrIG1vZGlmaWVkIHRvIGp1c3QgY2hlY2sgZm9yIGVEUA0KPj4NCj4+ICBkcml2
ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2NhdGFsb2cuYyB8IDE4ICsrKysrKysrKysrKy0tLS0tLQ0K
Pj4gZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9kaXNwbGF5LmMgfCAyMiArKysrKysrKysrKysr
KysrKysrKystDQo+PiAgMiBmaWxlcyBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspLCA3IGRlbGV0
aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2Nh
dGFsb2cuYw0KPj4gYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2NhdGFsb2cuYw0KPj4gaW5k
ZXggZmFjODE1Zi4uM2EyOThlOSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20v
ZHAvZHBfY2F0YWxvZy5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2NhdGFs
b2cuYw0KPj4gQEAgLTU2OSwxMCArNTY5LDYgQEAgdm9pZCBkcF9jYXRhbG9nX2N0cmxfaHBkX2Nv
bmZpZyhzdHJ1Y3QgZHBfY2F0YWxvZw0KPj4gKmRwX2NhdGFsb2cpDQo+Pg0KPj4gICAgICAgICB1
MzIgcmVmdGltZXIgPSBkcF9yZWFkX2F1eChjYXRhbG9nLCBSRUdfRFBfRFBfSFBEX1JFRlRJTUVS
KTsNCj4+DQo+PiAtICAgICAgIC8qIGVuYWJsZSBIUEQgcGx1ZyBhbmQgdW5wbHVnIGludGVycnVw
dHMgKi8NCj4+IC0gICAgICAgZHBfY2F0YWxvZ19ocGRfY29uZmlnX2ludHIoZHBfY2F0YWxvZywN
Cj4+IC0gICAgICAgICAgICAgICBEUF9EUF9IUERfUExVR19JTlRfTUFTSyB8DQo+RFBfRFBfSFBE
X1VOUExVR19JTlRfTUFTSywgdHJ1ZSk7DQo+PiAtDQo+PiAgICAgICAgIC8qIENvbmZpZ3VyZSBS
RUZUSU1FUiBhbmQgZW5hYmxlIGl0ICovDQo+PiAgICAgICAgIHJlZnRpbWVyIHw9IERQX0RQX0hQ
RF9SRUZUSU1FUl9FTkFCTEU7DQo+PiAgICAgICAgIGRwX3dyaXRlX2F1eChjYXRhbG9nLCBSRUdf
RFBfRFBfSFBEX1JFRlRJTUVSLCByZWZ0aW1lcik7IEBADQo+PiAtNTk5LDEzICs1OTUsMjMgQEAg
dTMyIGRwX2NhdGFsb2dfaHBkX2dldF9pbnRyX3N0YXR1cyhzdHJ1Y3QNCj4+IGRwX2NhdGFsb2cg
KmRwX2NhdGFsb2cpICB7DQo+PiAgICAgICAgIHN0cnVjdCBkcF9jYXRhbG9nX3ByaXZhdGUgKmNh
dGFsb2cgPSBjb250YWluZXJfb2YoZHBfY2F0YWxvZywNCj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc3RydWN0IGRwX2NhdGFsb2dfcHJpdmF0ZSwgZHBfY2F0YWxvZyk7DQo+PiAt
ICAgICAgIGludCBpc3IgPSAwOw0KPj4gKyAgICAgICBpbnQgaXNyLCBtYXNrOw0KPj4NCj4+ICAg
ICAgICAgaXNyID0gZHBfcmVhZF9hdXgoY2F0YWxvZywgUkVHX0RQX0RQX0hQRF9JTlRfU1RBVFVT
KTsNCj4+ICAgICAgICAgZHBfd3JpdGVfYXV4KGNhdGFsb2csIFJFR19EUF9EUF9IUERfSU5UX0FD
SywNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChpc3IgJiBEUF9EUF9IUERf
SU5UX01BU0spKTsNCj4+ICsgICAgICAgbWFzayA9IGRwX3JlYWRfYXV4KGNhdGFsb2csIFJFR19E
UF9EUF9IUERfSU5UX01BU0spOw0KPj4NCj4+IC0gICAgICAgcmV0dXJuIGlzcjsNCj4+ICsgICAg
ICAgLyoNCj4+ICsgICAgICAgICogUkVHX0RQX0RQX0hQRF9JTlRfU1RBVFVTIHJlcG9ydHMgdGhl
IHN0YXR1cyBvZiBhbGwgaW50ZXJydXB0cw0KPj4gKyAgICAgICAgKiBpcnJlc3BlY3RpdmUgb2Yg
dGhlaXIgbWFza2VkIHN0YXR1cy4gVGhlIEhXIGludGVycnVwdCB3aWxsIG5vdCBiZQ0KPj4gKyAg
ICAgICAgKiBnZW5lcmF0ZWQgaWYgYW4gaW50ZXJydXB0IGlzIG1hc2tlZC4gSG93ZXZlciwgdGhl
IGludGVycnVwdCBzdGF0dXMNCj4+ICsgICAgICAgICogYml0IGluIHRoZSByZWdpc3RlciB3aWxs
IHN0aWxsIGJlIHNldC4gVGhlIGVEUCBjb250cm9sbGVyIGRyaXZlcg0KPj4gKyAgICAgICAgKiBt
YXNrcyB0aGUgcGx1ZyBhbmQgdW5wbHVnIGludGVycnVwdHMgdW5saWtlIERQIGNvbnRyb2xsZXIg
d2hpY2gNCj4+ICsgICAgICAgICogdW5tYXNrcyBhbGwgdGhlIGludGVycnVwdHMuIFNvLCBkbyBu
b3QgcmVwb3J0IHRoZSBzdGF0dXMgb2YgdGhlDQo+PiArICAgICAgICAqIG1hc2tlZCBpbnRlcnJ1
cHRzLg0KPj4gKyAgICAgICAgKi8NCj4+ICsgICAgICAgcmV0dXJuIGlzciAmIChtYXNrIHwgfkRQ
X0RQX0hQRF9JTlRfTUFTSyk7DQo+DQo+V2hhdCdzIHN0aWxsIG1pc3NpbmcgaW4geW91ciBjb21t
ZW50cyBpcyB3aHkgeW91IGFyZW4ndCBqdXN0IGRvaW5nICJyZXR1cm4gaXNyICYNCj5tYXNrOyIu
IEluIG90aGVyIHdvcmRzLCB3aHkgaXMgdGhlIEFQSSBmb3IgSFBEIGJpdHMgZGlmZmVyZW50IGZy
b20gdGhlIEFQSSBmb3INCj5ub24tSFBEIGJpdHM/IFdoYXQgY29kZSBvdXQgdGhlcmUgd2FudHMg
dG8ga25vdyBhYm91dCBub24tSFBEIGludGVycnVwdHMNCj5ldmVuIGlmIHRoZXkgYXJlIG1hc2tl
ZD8NCg0KVGhlIG1hc2sgcmVnaXN0ZXIgYml0ZmllbGRzIGFyZSBkaWZmZXJlbnQgZnJvbSB0aGUg
SU5UX1NUQVRVUyByZWdpc3Rlci4NClRoZSBJTlRfU1RBVFVTIHJlZ2lzdGVyIGhhcyBhZGRpdGlv
bmFsIGJpdHMgWzMxOjI4XSB3aGljaCBpbmRpY2F0ZXMgdGhlIEhQRCBzdGF0ZSBtYWNoaW5lDQpz
dGF0dXMgYW5kIFszOjBdIGluZGljYXRlcyB0aGUgYWN0dWFsIGdlbmVyYXRlZC9zZXQgaW50ZXJy
dXB0LiBUaGUgZmllbGRzIFszOjBdIGFyZSBzaW1pbGFyIHRvDQp0aGUgbWFzayBhbmQgYWNrIGlu
dGVycnVwdHMuDQoNCiNkZWZpbmUgRFBfRFBfSFBEX1NUQVRFX1NUQVRVU19DT05ORUNURUQgICAg
ICAgICgweDQwMDAwMDAwKQ0KI2RlZmluZSBEUF9EUF9IUERfU1RBVEVfU1RBVFVTX1BFTkRJTkcg
ICAgICAgICAgKDB4MjAwMDAwMDApDQojZGVmaW5lIERQX0RQX0hQRF9TVEFURV9TVEFUVVNfRElT
Q09OTkVDVEVEICAgICAoMHgwMDAwMDAwMCkNCiNkZWZpbmUgRFBfRFBfSFBEX1NUQVRFX1NUQVRV
U19NQVNLICAgICAgICAgICAgICgweEUwMDAwMDAwKQ0KDQpTbywgZWFybGllciBJIHJldHVybmVk
IGlzciAmIChtYXNrIHwgRFBfRFBfSFBEX1NUQVRFX1NUQVRVU19NQVNLKTsNCg0KQWN0dWFsbHks
IHRoZXJlIGlzIG5vIHJlYXNvbiB0byBkbyB0aGlzLiBXZSBjYW4ganVzdCBkbyB0aGUgYmVsb3c6
DQpyZXR1cm4gaXNyICYgbWFzazsNCg0KPg0KPkFjdHVhbGx5LCB0aGlua2luZyBhYm91dCB0aGlz
IG1vcmUsIG15IHByZWZlcmVuY2Ugd291bGQgYmUgdGhpczoNCj4NCj5hKSBSZW5hbWUgdGhlIGV4
aXN0aW5nIGZ1bmN0aW9uIHRvIGRwX2NhdGFsb2dfaHBkX2dldF9pbnRyX3N0YXR1c19yYXcoKQ0K
Pg0KPmIpIENyZWF0ZSBhIG5ldyBmdW5jdGlvbiBjYWxsZWQgZHBfY2F0YWxvZ19ocGRfZ2V0X2lu
dHJfc3RhdHVzKCkgd2hvc2UNCj5pbXBsZW1lbnRhdGlvbiBpczoNCj4NCj4gIHJldHVybiBkcF9j
YXRhbG9nX2hwZF9nZXRfaW50cl9zdGF0dXNfcmF3KCkgJiBtYXNrOw0KPg0KPlRoZW4gYW55IGNh
bGxlcnMgd2hvIGNhcmUgYWJvdXQgdGhlIHJhdyBzdGF0dXMgY2FuIGJlIGNoYW5nZWQgdG8gY2Fs
bA0KPmRwX2NhdGFsb2dfaHBkX2dldF9pbnRyX3N0YXR1c19yYXcoKS4gSWYgbm8gY2FsbGVycyBu
ZWVkDQo+ZHBfY2F0YWxvZ19ocGRfZ2V0X2ludHJfc3RhdHVzX3JhdygpIHRoZW4geW91IGRvbid0
IGFjdHVhbGx5IG5lZWQgdG8NCj5jcmVhdGUgdGhpcyBmdW5jdGlvbi4NCj4NCg0KVGhlcmUgaXMg
bm8gY2FsbGVyIGZvciByYXcgc3RhdHVzLiBBbGwgaW50ZXJydXB0cyBhcmUgdW5tYXNrZWQgZm9y
IERQLg0KV2hpbGUgaGFuZGxpbmcgdGhlIGF1eCBpbnRlcnJ1cHRzIGdlbmVyYXRlZCBkdXJpbmcg
dGhlIHRyYW5zZmVyIGNhbGwgZnJvbSBwYW5lbCBwcm9iZSwNCndlIHJlYWQgdGhhdCB0aGUgSFBE
IGludGVycnVwdCBzdGF0dXMgWzM6MF0gYml0MCBpcyBzZXQgYW5kIHByb2NlZWQgdG8gaGFuZGxl
IGNvbm5lY3QgbGlrZSBEUC4NCldlIGV4cGVyaW1lbnRlZCB0byBmaW5kIG91dCB0aGF0IHRoZSBj
b25uZWN0IGludGVycnVwdCBpcyBub3QgZ2VuZXJhdGVkIGJ1dCBqdXN0IHRoZSBzdGF0dXMNCmJp
dCBpcyBzZXQuDQoNCkFzIHRoZSBpbnRlcnJ1cHRzIGFyZSBnZW5lcmF0ZWQgb3ZlciBhIHNpbmds
ZSBNRFNTIGxpbmUsIHRoZSBjb250cm9sbGVyIGRyaXZlciBoYXMgdG8gcmVhZCBhbGwgdGhlDQpp
bnRlcnJ1cHQgc3RhdHVzIHJlZ2lzdGVycyBhbmQgaGFuZGxlIGFsbCB0aGUgc2V0IGludGVycnVw
dCBiaXRzLiBTbywgd2hpbGUgaGFuZGxpbmcgYXV4IHRyYW5zZmVyDQppbnRlcnJ1cHRzLCB3ZSB3
ZXJlIHByb2NlZWRpbmcgdG8gaGFuZGxlIGNvbm5lY3QgaW50ZXJydXB0IGFsc28gYXMgYSBjb25z
ZXF1ZW5jZS4NCg0KPklmIHlvdSBtYWtlIHRoYXQgY2hhbmdlIHRoZW4gYWxsIG9mIGEgc3VkZGVu
IHRoZSBBUEkgaXNuJ3Qgd2VpcmQvd29ua3kgYW5kDQo+eW91IGNhbiBqdXN0IGdldCByaWQgb2Yg
dGhlIGNvbW1lbnQgSSBhc2tlZCB5b3UgdG8gYWRkLg0KPg0KPg0KPi1Eb3VnDQo=
