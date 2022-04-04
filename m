Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 201CC4F19D1
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 20:32:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C75D10E60A;
	Mon,  4 Apr 2022 18:32:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.140.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD1D010E191;
 Mon,  4 Apr 2022 18:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1649097150; x=1649701950;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nJ/qkYsrk8q77eY7ztnak0wqUo0J5cHkRmmvqZaB9SI=;
 b=tMXRYXLVQAQJwjLir5TZJKH2MGxlrz9E2sricVlrsjQW28i49Wb8jD8E
 pS+DLKFrHaTDMY+aVgCXNDGuR0M2C/Dtpg2TnLuXD1tsVQZN7LXslZ5hU
 2SZaIquA9fXksdo5Ple+TbEAYgZFD6odBvR7o/S9NOr0wNvMfvkCGoEjE 0=;
Received: from mail-dm6nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.100])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2022 18:32:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c9EawQuOy4oHsShn8UppxkOcszsP/CEMn5yUuvcnrPaGMLLqrndDa1MeUGeoO6EMEwl1U/SOiu2MIFlhTPTjW/JfO1UFDm2YZF26Adn3mgBYPow8QSkKQomefzOTwnQ6JAjiGivf2WU9ut7YPbC6v3h6F0+mzMBZTtsNhrXKihgJ5BM6oDqUEZz38YTcKH0/AF8JgGuEZs0D5r0x28cwMfJiwmy+zatEqcCe2Xvf/Pcn93+SZ/HkdcPN9f9EtvFYWNcVBkkOArlxayZ24yyT8whp7wHzDEV+tQcaRAATHnzXdRQQ6Q31NXaZER8LMV9O8hhz7OKTasMCfs0zRLs4mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJ/qkYsrk8q77eY7ztnak0wqUo0J5cHkRmmvqZaB9SI=;
 b=F97//QTZODW/CUJTc/R7qS3j0znNaAiVVBhSoWArX0uJAi2CneLAupgYKGoDHq4YPBMy/tlMNYMXLIl2cDw3bzBLZODGsw3WyvjZurpiwjyOLE33DIdJNAjn6hG4HLv3OR7f9Mo69pQl5JSpD27T2koOUCQLO2wdIc4hGhbKZ73PPHfgGdTyLD1hIDx8qnLp87LWspTLQx1LWatEMb9VPyJ+ivI55GIiDBP0VR02cFHR56QkLh7YdVpfbWNRcP07jGhsJa9SsSHVpYBsDpdF89w0/ys0izMYMP49IUKBLrKg5jGCDjDk4NCS0SmagNhCDg50VYzQJvjf//iHrO/WlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6)
 by BYAPR02MB5591.namprd02.prod.outlook.com (2603:10b6:a03:a6::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 18:32:25 +0000
Received: from MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::9485:c59c:6877:f492]) by MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::9485:c59c:6877:f492%6]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 18:32:25 +0000
From: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
To: Doug Anderson <dianders@chromium.org>, "Sankeerth Billakanti (QUIC)"
 <quic_sbillaka@quicinc.com>
Subject: RE: [PATCH v6 7/8] drm/msm/dp: Support edp/dp without hpd
Thread-Topic: [PATCH v6 7/8] drm/msm/dp: Support edp/dp without hpd
Thread-Index: AQHYRE/ShPa/kTPBlEuRjU9qR0RcAazaJBUAgAX38oA=
Date: Mon, 4 Apr 2022 18:32:25 +0000
Message-ID: <MW4PR02MB7186DD14809500D97C3ABDBBE1E59@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-8-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=V92j=yEoaM4REO6ws=AXpBjM6zWwBtZ8SbPiFd2cu3yw@mail.gmail.com>
In-Reply-To: <CAD=FV=V92j=yEoaM4REO6ws=AXpBjM6zWwBtZ8SbPiFd2cu3yw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7653b7c3-d5f1-4d10-aaaf-08da16697731
x-ms-traffictypediagnostic: BYAPR02MB5591:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <BYAPR02MB5591B764112006448C519A959DE59@BYAPR02MB5591.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /yeeTGQgDJH8BI/HgGw0Oaa9d7WLW6cIzA8WuD6ujbEC/XM5p4RsLxrsj5TosH34rtIwWzJZFBwksmxbccpMATixahFEc0TBd0G1z90oImjUi2JEQtoy3OjWbqwoPg7ZMFCmJ2xuVT3W1ER6GJ2l/i8dAhrZRaqnKgcIa/juEinvsT5HJhvpXElM3ywQFP0Cgt37tajunnWyjATIPy6NK6Wvo1eSJ7jE4zCG7nAe1Rmph7Ci+t6k8phvZ72W+EKniCXeAwJBLSDhm7T6TRdPcaXIfAKzDPEmJCks4ke+HjsplDzNeYR7qRcB6AxkYlz/asFjkh3hZEczj3CEkC2+541spzD87jvb59bziS08QiLUXCulERkJVJYJ4e3cYTcYU75kTTD//WCb8qFFzXiLigA62cnMxQoA4XbYmoMpt98Wf388UCKfu+LEl67j4qGp0ZKdfVbIQhY4DVcFsxrZ1xBagLTT6yNEir3bjquaPp3MImXxdcMhpPY+tnbzaCt12YpNbvHWmePOXYhulXu+RD7HyOXiS6iyiSZrnjPoopvJBdjWUbl9YzZgcVN+xUpafFKKSOc3q9Yy+8KZCYZwyf/ujihQDZWKdkVvcXOG+pSqum4BrgBzuEHgCEKbTF08N/imf3IDPp3N4lgM6XRI1fr6cadXD7jG8h3o3Y7ARR8FlInsMZpZnWini43QSKhi0NOrnPJWHSjEUqvZih6iYQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR02MB7186.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38070700005)(86362001)(54906003)(9686003)(316002)(2906002)(83380400001)(110136005)(8936002)(33656002)(71200400001)(52536014)(6506007)(76116006)(7696005)(66556008)(55016003)(53546011)(38100700002)(4326008)(66476007)(66946007)(66446008)(64756008)(26005)(107886003)(508600001)(186003)(7416002)(122000001)(5660300002)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cEE2TVN3MklldVhmemJydjZFQVYwNlkySFRqYXhFNFZ2d2xRVUxiSHVndkVH?=
 =?utf-8?B?Y050b002RWxTQnRqSDdIeHA3ZW5TMWcxNHV5VERKQXJzdmgyRjI1ejhCaWRQ?=
 =?utf-8?B?dW5OOUgxTDVTTmFZaTUvV2hueUxyQUh6TWZBUjBPRG4zZWpyU0dJdlY4MU4x?=
 =?utf-8?B?d3ZuTjdDVG45TzFDZzA2WnE5NjVPZ25md0ltZUVYeVEyZGVEaTFyaGlkQ3RK?=
 =?utf-8?B?R0I5d2c0R2UwR3hpanc0OStNYkpBYkhtYXExTWtocDI4NU1YcStlbG4xTXVs?=
 =?utf-8?B?OXVOM3UwOWp1U2puR21zclBvOTluQkZsQnMySmtLRml5aVdIOVFFM0lVYXo2?=
 =?utf-8?B?NFBGak1HVWNNUUJ3djYrNEFTcVFNTmVTZjRoWVF2bG92eEZoTVNyZnZmaDUz?=
 =?utf-8?B?eFY2SGhoRGRqZWZGMFdiVzBDQXdzVy92cEJURWt2dHNDVjMrRFZFbGZ2N0hx?=
 =?utf-8?B?OUNkWUFjN3V3K01GV2trUkt0dTJ1Mm01TnQ2cllpd2IwVW9tejBQQWpuTEtk?=
 =?utf-8?B?d3NHNWlTY3k0cWp0bTlURGxRTU9UcVg2VTlNblZ4TG5obThna3RoR1pQbFQy?=
 =?utf-8?B?SkoxUFNkaXN0V3dGSkxiZVY3U2o5bjdPTlF2Qk85Z2ZhNTdrSU1vWUQrUFgr?=
 =?utf-8?B?VCtCQ1o4UG1OTjZIMUpBWXJDQlZzR21qKzR5WDM1a3djZWtkYkhGK2F6SmZP?=
 =?utf-8?B?aE1DcnIrUThZOWdsWXNCekYzbTU5OC8yRXFOYWUrZnc4VmprMk9oYjlheW1X?=
 =?utf-8?B?VkZxVGxhMmJJdCtKaExOeCtGV0dQZ3cxYW5kTVFLVm1ZN1NlU0Y3VjcxUXBE?=
 =?utf-8?B?U3MxYmFjS0lSSEdXVk1WR2M1Y2FBUk5wNnFIMkRtODQvT3hyWlZ6a1lRa3VZ?=
 =?utf-8?B?RVpNb1pjVzFNMFZFcHdKNVpoTTRoVkpaRXIwcDdQN1Bub2gzVC9NY0hvQ0Jo?=
 =?utf-8?B?UmQ1OGUrdC9JbzZ0ZmVKamtJTGlLSjY2NlVYN041MDg4emxRWmVCNnZDRzB2?=
 =?utf-8?B?Nm80OVVEMEFINzJBWkdZaGdvTmdOd21GekRYTEFLUWF3SStRTGw2VE1xVUto?=
 =?utf-8?B?NjZiZzg3bFAxOXgyR0R5NGxUaEhtYTRBdFdXNWZqMjk1YnU5a3lqMlZ3ZXE5?=
 =?utf-8?B?Qm02M201dDVpZm9Mb1d6NFlORFdRWUptYkt1ZFloZ0lwK3hXWUZDNjlFK3dR?=
 =?utf-8?B?MXZQZE9XUmY4L3o5TnV2aUhMczFERnR3dktjTjgwUWVpTkR3L3VZb0xtWklw?=
 =?utf-8?B?ZkJjSXRUUDJpNEJmb3hWeEpoNnFhMHFLRXYwa0tlaEJqUURUaXl6MUptZmx4?=
 =?utf-8?B?SCtxTTRMZFNMQm9ocllGZHpMSUtjWXhUTTB3NEtHTnJWejNjSXdVYVdpMVEz?=
 =?utf-8?B?N20yK0tna043MDBZb05JV0dzSGM2YlZjeTNiUndmQ2FwVnBXQUFBbEkvK1VP?=
 =?utf-8?B?Y0x2WHg2UmJPaE9LMUpEdUI2QU04NFAxQWxOWHJERzZxb0I1eG93TDc4Y3JV?=
 =?utf-8?B?Q0hOUHh3VzVzdjIraWpMdDdPUGdvZVpZdlRKdXd2L0ZZTVRYV2FWL1ZBWURk?=
 =?utf-8?B?cy9neTJNelM2emxLQUU4MitEOStycGhCMGlxZXhlRzkyeVljeVFiRW1hcFZl?=
 =?utf-8?B?UGhWUEw5eUUrNFdIOXk5WUc3dFRtMDBkdUp3S2hQYWVpNlB4ekxDZE9QWUxO?=
 =?utf-8?B?VFBIUXo0RXlMTFR6a1NOSGRsQVFpV2tiNlFRdkpSODBBUVV5QWozNTFtbkRH?=
 =?utf-8?B?OTdqempKQy81bGw1N0tlLzVSQmo2SFBucmg0TUpBdFptb2VmWENnR2pUWGNo?=
 =?utf-8?B?djNZU1o4V2hwVHJVRGt5bEVLQWhCdkQ0Y3JoaUJKeG56VGFCTFlWTW9kdlU2?=
 =?utf-8?B?a21lTy82UkhCdG52cGR4NEhoOHRTVW9UVlhQZ3loc1ZLUFZJdEFIMzZPa1Rq?=
 =?utf-8?B?a0ZQd0VkaWloQUNuM0I1QjdWU0M0TXdYVnhhVysycGRPaXpnZ2xwb3pqejRX?=
 =?utf-8?B?VHo1YmtiYnNwdHA5c1VtanlVNlRudU1zd09mNnlrUURHYzdLejlobDB6dWYy?=
 =?utf-8?B?c0NETnVlYnJ3bDN2eUFDdHJBMDdRbzNvQ3BqUzYvVjJRcnpqZjZxcmhHVXJL?=
 =?utf-8?B?ekRpdVcvYjdIaDN4LzJzRG1hNHdyUWJmbzRJdEJQVVpLZUxFeUhlQVhTNEYr?=
 =?utf-8?B?N1k5SlNweTN2V1dHM0lwVENrSVcwUEU5WVhIeU1mbVQ5RUVaeTI0S3ZJbGVp?=
 =?utf-8?B?cXBTc3l6elZZOWtXZXhEQTY4OUkvZVFxZE9kZ2o2NXhiTjRmcEpSa2ZRUlRx?=
 =?utf-8?B?eTBXa0NvK2s2WjAwTFZKRmpvakJZY3NjNFBmdGJ0a1ZzbmI2TVRjZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7653b7c3-d5f1-4d10-aaaf-08da16697731
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2022 18:32:25.1905 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rA0HptU1gQv4Hl0yej05HC2jKeoH2r9T1i9xQfaiAwh2Z3Xu8Y2FCr6ipiYOyiB3IKHNUS/PIzn42l0jTwynLWLoy3u4Y6yvJv74ROmYVLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5591
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
IFNvbWUgZURQIHNpbmtzIG9yIHBsYXRmb3JtIGJvYXJkcyB3aWxsIG5vdCBzdXBwb3J0IGhwZC4N
Cj4gPiBUaGlzIHBhdGNoIGFkZHMgc3VwcG9ydCBmb3IgdGhvc2UgY2FzZXMuDQo+IA0KPiBZb3Ug
Y291bGQgc2F5IG1vcmUsIGxpa2U6DQo+IA0KPiBJZiB3ZSdyZSBub3QgdXNpbmcgSFBEIHRoZW4g
X2JvdGhfIHRoZSBwYW5lbCBub2RlIGFuZCB0aGUgZURQIGNvbnRyb2xsZXINCj4gbm9kZSB3aWxs
IGhhdmUgIm5vLWhwZCIuIFRoaXMgdGVsbHMgdGhlIGVEUCBwYW5lbCBjb2RlIHRvIGhhcmRjb2Rl
IHRoZQ0KPiBtYXhpbXVtIHBvc3NpYmxlIGRlbGF5IGZvciBhIHBhbmVsIHRvIHBvd2VyIHVwIGFu
ZCB0ZWxscyB0aGUgZURQIGRyaXZlciB0aGF0DQo+IGl0IHNob3VsZCBjb250aW51ZSB0byBkbyB0
cmFuc2ZlcnMgZXZlbiBpZiBIUEQgaXNuJ3QgYXNzZXJ0ZWQuDQo+IA0KDQpPa2F5LiBJIHdpbGwg
YWRkIGl0DQoNCj4gDQo+ID4gU2lnbmVkLW9mZi1ieTogU2Fua2VlcnRoIEJpbGxha2FudGkgPHF1
aWNfc2JpbGxha2FAcXVpY2luYy5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9t
c20vZHAvZHBfY2F0YWxvZy5jIHwgMTUgKysrKysrKysrKysrLS0tDQo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAxMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfY2F0YWxvZy5jDQo+ID4gYi9kcml2ZXJzL2dw
dS9kcm0vbXNtL2RwL2RwX2NhdGFsb2cuYw0KPiA+IGluZGV4IDE4MDljZTIuLjhmMWZjNzEgMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9jYXRhbG9nLmMNCj4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2NhdGFsb2cuYw0KPiA+IEBAIC0yNDQsMTAg
KzI0NCwxNyBAQCB2b2lkIGRwX2NhdGFsb2dfYXV4X3VwZGF0ZV9jZmcoc3RydWN0DQo+IGRwX2Nh
dGFsb2cNCj4gPiAqZHBfY2F0YWxvZykNCj4gPg0KPiA+ICBpbnQgZHBfY2F0YWxvZ19hdXhfd2Fp
dF9mb3JfaHBkX2Nvbm5lY3Rfc3RhdGUoc3RydWN0IGRwX2NhdGFsb2cNCj4gPiAqZHBfY2F0YWxv
ZykgIHsNCj4gPiAtICAgICAgIHUzMiBzdGF0ZTsNCj4gPiArICAgICAgIHUzMiBzdGF0ZSwgaHBk
X2VuOw0KPiA+ICAgICAgICAgc3RydWN0IGRwX2NhdGFsb2dfcHJpdmF0ZSAqY2F0YWxvZyA9IGNv
bnRhaW5lcl9vZihkcF9jYXRhbG9nLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc3RydWN0IGRwX2NhdGFsb2dfcHJpdmF0ZSwNCj4gPiBkcF9jYXRhbG9nKTsNCj4gPg0KPiA+
ICsgICAgICAgaHBkX2VuID0gZHBfcmVhZF9hdXgoY2F0YWxvZywgUkVHX0RQX0RQX0hQRF9DVFJM
KTsNCj4gPiArICAgICAgIGhwZF9lbiAmPSBEUF9EUF9IUERfQ1RSTF9IUERfRU47DQo+ID4gKw0K
PiA+ICsgICAgICAgLyogbm8taHBkIGNhc2UgKi8NCj4gPiArICAgICAgIGlmICghaHBkX2VuKQ0K
PiA+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsNCj4gPiArDQo+ID4gICAgICAgICAvKiBwb2xs
IGZvciBocGQgY29ubmVjdGVkIHN0YXR1cyBldmVyeSAybXMgYW5kIHRpbWVvdXQgYWZ0ZXIgNTAw
bXMgKi8NCj4gPiAgICAgICAgIHJldHVybiByZWFkbF9wb2xsX3RpbWVvdXQoY2F0YWxvZy0+aW8t
PmRwX2NvbnRyb2xsZXIuYXV4LmJhc2UgKw0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgUkVHX0RQX0RQX0hQRF9JTlRfU1RBVFVTLCBAQCAtNTg2LDgNCj4gPiArNTkzLDEwIEBA
IHZvaWQgZHBfY2F0YWxvZ19jdHJsX2hwZF9jb25maWcoc3RydWN0IGRwX2NhdGFsb2cNCj4gKmRw
X2NhdGFsb2cpDQo+ID4gICAgICAgICByZWZ0aW1lciB8PSBEUF9EUF9IUERfUkVGVElNRVJfRU5B
QkxFOw0KPiA+ICAgICAgICAgZHBfd3JpdGVfYXV4KGNhdGFsb2csIFJFR19EUF9EUF9IUERfUkVG
VElNRVIsIHJlZnRpbWVyKTsNCj4gPg0KPiA+IC0gICAgICAgLyogRW5hYmxlIEhQRCAqLw0KPiA+
IC0gICAgICAgZHBfd3JpdGVfYXV4KGNhdGFsb2csIFJFR19EUF9EUF9IUERfQ1RSTCwNCj4gRFBf
RFBfSFBEX0NUUkxfSFBEX0VOKTsNCj4gPiArICAgICAgIC8qIEVuYWJsZSBIUEQgaWYgc3VwcG9y
dGVkKi8NCj4gPiArICAgICAgIGlmICghb2ZfcHJvcGVydHlfcmVhZF9ib29sKGNhdGFsb2ctPmRl
di0+b2Zfbm9kZSwgIm5vLWhwZCIpKQ0KPiANCj4gSSBkb24ndCB0aGluayB0aGlzIGlzIGEgcGFy
dGljdWxhcmx5IGxpZ2h0d2VpZ2h0IG9wZXJhdGlvbi4gSXQncyBsaXRlcmFsbHkgaXRlcmF0aW5n
DQo+IHRocm91Z2ggYWxsIG9mIG91ciBkZXZpY2UgdHJlZSBwcm9wZXJ0aWVzIGFuZCBkb2luZyBz
dHJpbmcgY29tcGFyZXMgb24gdGhlbS4NCj4gLi4uYnV0IHRoaXMgZnVuY3Rpb24gaXMgY2FsbGVk
IHNvbWV3aGF0IG9mdGVuLCBpc24ndCBpdD8gSXQgZmVlbHMgbGlrZSB0aGUga2luZCBvZg0KPiB0
aGluZyB0aGF0IHNob3VsZCBoYXBwZW4gYXQgcHJvYmUgdGltZSBhbmQgYmUgc3RvcmVkIGluIGEg
Ym9vbGVhbi4NCj4gDQo+IC4uLmFuZCB0aGVuIHlvdSBjYW4gdXNlIHRoYXQgc2FtZSBib29sZWFu
IGluDQo+IGRwX2NhdGFsb2dfYXV4X3dhaXRfZm9yX2hwZF9jb25uZWN0X3N0YXRlKCkgcmF0aGVy
IHRoYW4gcmVhZGluZyB0aGUNCj4gcmVnaXN0ZXIgdmFsdWUsIHJpZ2h0Pw0KPiANCkl0IGlzIGNh
bGxlZCB0d2ljZSBmb3IgRFAuIE9uY2Ugd2hpbGUgYm9vdGluZyB0aHJvdWdoIGEgdGhyZWFkIHNj
aGVkdWxlZCBmcm9tIGttc19vYmpfaW5pdA0KYW5kIHdoZW4gcmVzdW1pbmcgZnJvbSBQTSBzdXNw
ZW5kLg0KDQpXaXRoIGF1eF9idXMgYWRkaXRpb24sIHRoaXMgZnVuY3Rpb24gd2lsbCBiZSBjYWxs
ZWQgdGhyaWNlIGZvciBlRFAuIE9uY2UgZHVyaW5nIGJvb3R1cCB3aXRoDQphdXhfYnVzLCB0aGVu
IGZyb20gc2NoZWR1bGVkIGV2ZW50IGZyb20ga21zX29ial9pbml0IGFuZCBwbSByZXN1bWUgbGlr
ZSBEUC4NCg0KSSB3aWxsIGNoZWNrIGlmIHdlIGNhbiB1c2UgYSBuby1ocGQgQm9vbGVhbiBmbGFn
IGluc3RlYWQuDQoNCj4gDQo+IC1Eb3VnDQoNClRoYW5rIHlvdSwNClNhbmtlZXJ0aA0K
