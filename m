Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EC050EF5C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 05:46:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEFA510E525;
	Tue, 26 Apr 2022 03:45:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.142.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F49910E334;
 Tue, 26 Apr 2022 03:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1650944755; x=1651549555;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CPiiT2nO/1DsqeAWw6+5FxxmGKiwZHEWfKZkquRruU0=;
 b=kxDzd7ZHLDaX0M8Nt9hVhh11OQuJQpv8LQDDM8w6tE5FISJ4sSPNL23c
 CMFJwKnGaGINprlJCTYlgvBtjhTR7YNJFqo040eDikgyMhj8zZzVZ5yBh
 Nr1ns4WjgF2WIgz4TSaa7/O04xoX3Vvy5DKKQa2x8hL1VPFiyPVYv/OIE c=;
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 03:45:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NW2i2VYdnQdnhuM10CuVqtJNAx0Uqyn7WXaEwCff+k6dEg5qwiMPqYbm6fWPTKKZAdONoEDHQGN5/qkADX4Gt8gCHXE0gElVNiOpCBygLSoTgZme2ur7jOiLwPE40OZ6C8KOaHDrWY5jnLn9IDf6mhCn/yAR2TcjdRzSw38xs/rO6Dqoq3/jOuj2E+E0gdVPP8YQar5p2AIV6o73FVDfN+dmgPrkwhwhOIJo0lad5NcJhjoWyS7Jl9i7BdOCkQqLFaNJJjoNIi+LXJ5HJdH2RBdrysG0dUy5pKJu9m45i0JahXfWz9VWUJivW4JfnLbgyYfVcZU9mVtJsnc/IehLqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CPiiT2nO/1DsqeAWw6+5FxxmGKiwZHEWfKZkquRruU0=;
 b=AKdHdqRq/fy+UPUgUCbnFDFzq9VoMstEHK8dlMeRvxl6pkC06BEjOBOIDrIkKuhSjNjSt6Fa/y9kpvv4InuHVftnaUadPi/CimFRiqBeqwdmPU0o2N9r58FRhuL4dXsMt8TMjxFAYZqRu0lkWrE+lRKZFrONZNit79RmWFQP7rZc6MnVxCa+7Hg/VGEyOik6DaBCl8jEtCrW5YY3bBjAEhr4piShoCj7Bbzjo42Zq1MyGGqzZNCdd0RMOKXj/DJ2TGG1vndRb+sQP6t82ZmQx4NgIHGqbtKLrbZT0qBJ6QCzb5FXNKB/hWTGymjZtV+PLzuV6yHZFqf0PERvlMXzTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6)
 by DM6PR02MB5594.namprd02.prod.outlook.com (2603:10b6:5:34::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Tue, 26 Apr
 2022 03:45:49 +0000
Received: from MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::1d18:abb7:c311:543f]) by MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::1d18:abb7:c311:543f%4]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 03:45:49 +0000
From: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
To: Stephen Boyd <swboyd@chromium.org>, "Sankeerth Billakanti (QUIC)"
 <quic_sbillaka@quicinc.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "freedreno@lists.freedesktop.org"
 <freedreno@lists.freedesktop.org>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v9 2/4] drm/msm/dp: Support only IRQ_HPD and REPLUG
 interrupts for eDP
Thread-Topic: [PATCH v9 2/4] drm/msm/dp: Support only IRQ_HPD and REPLUG
 interrupts for eDP
Thread-Index: AQHYVij949GuwPpnhkq0MCzvgEg91az8phaAgANNanCAASXWgIAAeo/A
Date: Tue, 26 Apr 2022 03:45:49 +0000
Message-ID: <MW4PR02MB7186136C182E076A38270FFBE1FB9@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <1650618666-15342-1-git-send-email-quic_sbillaka@quicinc.com>
 <1650618666-15342-3-git-send-email-quic_sbillaka@quicinc.com>
 <CAE-0n52tKt3yywZFEKobet4t9xXA_GbTDcUqPPEj5A-KkDET3Q@mail.gmail.com>
 <MW4PR02MB7186AE3B9B573FB1C594DA35E1F89@MW4PR02MB7186.namprd02.prod.outlook.com>
 <CAE-0n53KXNdt64xLqFHBaj3z7ocV-b5fUxpxthkFw7-26EdB-A@mail.gmail.com>
In-Reply-To: <CAE-0n53KXNdt64xLqFHBaj3z7ocV-b5fUxpxthkFw7-26EdB-A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2eae45eb-40ef-4bc0-7977-08da273740fa
x-ms-traffictypediagnostic: DM6PR02MB5594:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <DM6PR02MB55947C7DDAF2114695DF65629DFB9@DM6PR02MB5594.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lEBxte4SHwGq4Hao1J7UGjT8sNcUbSWav5WktTdHwEWWM4GtezeSW4xb3A+sa9dqC3CV0PvieeEPyY5q/DpwQJ3axCjHVqIyRrOgPpxExZl9TRyvysDwt2oKervBjKkV5fzBJmY/JHjLIuTwKgo879qCcVSeAhmIqMRsiniGf0pZsHKUb8vKMgVY15qCB4L7fsjCJNArLB6sDQ88StNq4O9aaBWSPgId8pCgaxPeuahq0e+l83ix97bxV0sp18m7DBq3V9nkXsgbxv/S8zsGLWeqMItCvUFGcq7NmfFlwq44HNJknnOXRraB8f4W4ThFRH9hH5ludvWN7SJuWjKzXuE4DTkrwmGSUMmjHb3nfvo5UmzyqCkT97LpPxRkPsSj6FUBKxozwsu8oUN+qi8iGHIjjyP3Zo1Z4bHsmWz13XQV2xJXU2n58K7qpo7h1pXSztBgOKL3kITFBokjpuavSuOBrni7dU6dq7BKb2ZbobOwqFRXhCoSJvl6IOzyEVFaS2cE92TdqvL5oWKExhCNiAD1UWMnYY80rw/DZgK8KangWi0FXUiZ6cKM1ZfFu+DwBuUJhojL0ZoafPqAcEiD8WWZfKowmOLnXmeRs8vmEMjHapfrVF3lgeJ6bBw8554V0TTHlWP9CCyG+q57J0OaJn24FJXNiBmEvuGOvvd4vZtMkMBObUTDcu28savUvY+k59+TPVqT1nBNNbXcgJg0hA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR02MB7186.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(2906002)(6506007)(71200400001)(66556008)(64756008)(66946007)(7416002)(5660300002)(8676002)(66446008)(76116006)(33656002)(4326008)(316002)(8936002)(66476007)(52536014)(7696005)(55016003)(54906003)(26005)(9686003)(38070700005)(38100700002)(122000001)(508600001)(186003)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cjlOZmVNWW1vZ25nN2pBd3pzTXVnVUZqQWZ4MFNWMy9Lai9EMlhVMDNpQkhE?=
 =?utf-8?B?V3FQSkhXSkNKL3ZyOTB0RFAzNFRpRlgrZEk4RGdYbnFqSmtFUDB0cGczUkht?=
 =?utf-8?B?aGFObWlXakgyM1lUTm10WTVSelRiQm1ZMkQrcE40TklUS1pJYW9JazYzSXVq?=
 =?utf-8?B?UWRHeVJPa0NJNUowaWdRVFhiR0lKbXQ1T0swcEZjLyswaUlMT2RrSlVxeU9O?=
 =?utf-8?B?RFF4dy85V01FVFVEeC8rdDVMa2J2UVFnRjdvVlpUTTlwTjVwclI0RGdoeUU5?=
 =?utf-8?B?U0poSThSMlJoUTd2YXBQU3pOc1dlVUhvMjdBTzl2K3MwRk9iL05iUkJMMVlL?=
 =?utf-8?B?ZTJ2Y3cwa3hJVXdUWWZSYWYwU2NzcjZVVFFwY1BtYTM4VFhPOEh6dERjcHBG?=
 =?utf-8?B?dnFRTFBLUHlmQnphZ1VSMUMwNEZwSjM3eTBKYXdGTTJNTkhtbGJpaWZ4VUx3?=
 =?utf-8?B?a2ZZRXBJNklZV1dKandrWmJOTHhtajhpdSsrZk9ML2NkakFXZWp2eDBlMGx0?=
 =?utf-8?B?aVN3VEdnalZ0R0h5bmM4bnFMK2pzL2VPQzd2djFMRSs1SkdRRFhkcTlPMFY1?=
 =?utf-8?B?U29ubm5sQjdXSWgzYnpxRHVwMnVZcmk4M21VUWpCaWp4eGhPbTZqOGNEeDlk?=
 =?utf-8?B?Vmk5bXJRWW84cGl5QUN6azRIZzkvNCtucFZSbm84WDQ1cklaVEdzN0tUeE92?=
 =?utf-8?B?cUgrL3Nsd0VjUnY3UGRYZm9sTndaS0FrRjB6SFJsMVlHZ3lGbVAzRTU4eWNS?=
 =?utf-8?B?U01DVFI4dTdzWGJYSTZUL0hsUHNMZWtDOXRJRVVYUWlSTVBsYlFjSGdlSHI2?=
 =?utf-8?B?eWRqcU9DUThOWm1CV2dXbjVTK1ZTb2QvaFlzTExMelFQTEgwdThJc1JrVGha?=
 =?utf-8?B?RExUTmNmVWlhVFdEUmlkVlhocGVZaTkzODc2MThrV0xhQ2NNSXFnQVBDNTNu?=
 =?utf-8?B?QTRLY2NVUGRvTkFQVHc1YTNlc1kxR2s5clpHMkhDOTFhTU0rWGVXeEZYYWJY?=
 =?utf-8?B?alN2eXlFRS84c0I3YjAzOEhNZGNhU01WMkY2ZHJ2N284SVpSYmNqajNNZk1Y?=
 =?utf-8?B?OTY5Ym1kUmpEK0ZRNkFxLzZaUmJyZTI5VS91NXNoYVZOeElYQndZYVJ3VzdI?=
 =?utf-8?B?dGgrUFAxSkwxeFl2SjRpdFpLbCtTbnRUY2dzMUZEcXhzTEcrYTExWThjTjlm?=
 =?utf-8?B?OUtnZGtSMVVSMXk0ZzZvNHRxbFVRTXNmakF4S2pOejVTcmxVNHdtWjQvQy9t?=
 =?utf-8?B?UlNSMXV0b1NZc3BKQ1JlNjNlcUJBQWMyNG1veHNHTU1jYjZ1NjRtVFhRU3hk?=
 =?utf-8?B?NVlERi9tQmRFTC9TMDg4MmdOYjZqVFNJK2NCVG5ZcVA5Q0JzajJObzg0WUM4?=
 =?utf-8?B?cmhnTmpURngxUFNBcnptU2RWWFkrK1poUzErNG5rMHVYNzVldzdLaVBQWndp?=
 =?utf-8?B?cG5yT0FxcUZmQnZMVGYrM05xbUR3NDUyUzYrQ29ucXhNdi9ibmU1dW1hQjdz?=
 =?utf-8?B?V2xrUWpqVzVTdWxQQVBEanJ0UlBlOHZKSmRJdThqQjFKVmEzZlQzenA1NSs2?=
 =?utf-8?B?aEQxbTNOOFVJSDhNeklxb3lhbGdDNjBDdWFlbWZ5UHdnbkoxNGl2TXg4RlFr?=
 =?utf-8?B?UUNlYXJWUUZXSkVqWG90SXp3R2tmL2N3MEZqQzcrQmpicmIzcGx3YVBhTUJT?=
 =?utf-8?B?RSs3eWRqSHF4QzRrUUZLQkdsUHY0ZGVpVE9nRW51RkdQUlVSMTFYVmVDbFJD?=
 =?utf-8?B?ZndhSGpobFIwYnp0eUIvQm5yamtDYUFEM2JSdXkyaERVSmtrNDJkc2VENXJD?=
 =?utf-8?B?OFhDKzBnYjk3eVVQbWdYaDFSQmxzVTRFSHFXZnhJbFluQU9WTkhTb1RKblo0?=
 =?utf-8?B?aDVTSHNqeUZia2x3cjNLalhHcCs1djJLTHRFUC9obVlvcUxWSEFWTUNHZmNB?=
 =?utf-8?B?ZlBZUUpaRjdUaWJmMFRScHUxR2RUUit2QnZIR2p0T1RwbGsweERuWDF4S1FH?=
 =?utf-8?B?cGxKdzh6VVVZMlpZb1JwZWRqcUhmZGxFSmJnajNhVGZiY0lxT2dTYzk1MWR0?=
 =?utf-8?B?aEtkNnVtOWQ1T01NSk5rVlpmTjhNODBuVkRnbjBldkdlTXF6eXd0QkhXNHB2?=
 =?utf-8?B?K1VVTDBwaDM5eDF4TVdiWllhUTFiS2ZQMWJXaTZ5QzlyVEh6VUExaEN5c3Np?=
 =?utf-8?B?NDBmNHRMc3RSVTI4ZVY0dnVOUjJ0SWQ1aldBSUVaWFFPSVNrcjBVZE5MV0NU?=
 =?utf-8?B?SXFUaGhlaUNickR3dHRLVHJRUVRMMG4wdCtlSnNRUDRWUUEvL1dVOWNtYnZG?=
 =?utf-8?B?UHkyWmxEc3U2MGpuK2g4ZEpOQVo3NThvVDI5SlhTb3JwNTB2QnZxdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eae45eb-40ef-4bc0-7977-08da273740fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2022 03:45:49.3031 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G8K45QQ5iIkNZF9M2bwXdeGRzY43sVGa+W45Eq+pQhxtybbMS9SiWUhl5JakA3hL4REcwau9MhoMDb3ZW4CXa/nvtbcBE2aMt0v9BRnQ/Ts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5594
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
 "dianders@chromium.org" <dianders@chromium.org>,
 quic_vproddut <quic_vproddut@quicinc.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "Abhinav
 Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>, "steev@kali.org" <steev@kali.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "sean@poorly.run" <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU3RlcGhlbiwNCg0KPj4gPj4gIGludCBkcF9jYXRhbG9nX2N0cmxfZ2V0X2ludGVycnVwdChz
dHJ1Y3QgZHBfY2F0YWxvZyAqZHBfY2F0YWxvZykNCj4+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbXNtL2RwL2RwX2Rpc3BsYXkuYw0KPj4gPj4gYi9kcml2ZXJzL2dwdS9kcm0vbXNt
L2RwL2RwX2Rpc3BsYXkuYw0KPj4gPj4gaW5kZXggMDU1NjgxYS4uZGVhNGRlOSAxMDA2NDQNCj4+
ID4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfZGlzcGxheS5jDQo+PiA+PiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2Rpc3BsYXkuYw0KPj4gPj4gQEAgLTEwOTYsNiAr
MTA5NywxMyBAQCBzdGF0aWMgdm9pZCBkcF9kaXNwbGF5X2NvbmZpZ19ocGQoc3RydWN0DQo+PiA+
ZHBfZGlzcGxheV9wcml2YXRlICpkcCkNCj4+ID4+ICAgICAgICAgZHBfZGlzcGxheV9ob3N0X2lu
aXQoZHApOw0KPj4gPj4gICAgICAgICBkcF9jYXRhbG9nX2N0cmxfaHBkX2NvbmZpZyhkcC0+Y2F0
YWxvZyk7DQo+PiA+Pg0KPj4gPj4gKyAgICAgICAvKiBFbmFibGUgcGx1ZyBhbmQgdW5wbHVnIGlu
dGVycnVwdHMgb25seSBmb3IgZXh0ZXJuYWwgRGlzcGxheVBvcnQgKi8NCj4+ID4+ICsgICAgICAg
aWYgKCFkcC0+ZHBfZGlzcGxheS5pc19lZHApDQo+PiA+PiArICAgICAgICAgICAgICAgZHBfY2F0
YWxvZ19ocGRfY29uZmlnX2ludHIoZHAtPmNhdGFsb2csDQo+PiA+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIERQX0RQX0hQRF9QTFVHX0lOVF9NQVNLIHwNCj4+ID4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgRFBfRFBfSFBEX1VOUExVR19JTlRfTUFTSywNCj4+ID4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdHJ1ZSk7DQo+PiA+PiArDQo+PiA+DQo+
PiA+SXQgc2VlbXMgbGlrZSBvbmx5IHRoZSBwbHVnIGFuZCB1bnBsdWcgaXMgZW5hYmxlZCBmb3Ig
RFAgaGVyZS4gSXMNCj4+ID5yZXBsdWcgZW5hYmxlZCBmb3IgZURQIHdoZW4gaXQgc2hvdWxkbid0
IGJlPw0KPj4gPg0KPj4NCj4+IEJ5IGRlZmF1bHQsIGFsbCB0aGUgaW50ZXJydXB0cyBhcmUgbWFz
a2VkLiBUaGlzIGZ1bmN0aW9uIGlzIG5vdA0KPj4gZXhlY3V0ZWQgZm9yIGVEUCBhbnltb3JlIGJl
Y2F1c2UgdGhlIGhvc3RfaW5pdCwgcGh5X2luaXQgYW5kDQo+PiBlbmFibGVfaXJxIGFyZSBhbGwg
ZG9uZSBmcm9tIG1vZGVzZXRfaW5pdCBmb3IgZURQIHdpdGggYXV4X2J1cy4gU28sDQo+PiBub25l
IG9mIHRoZSBlRFAgaHBkIGludGVycnVwdHMgYXJlIGVuYWJsZWQgb3IgdW5tYXNrZWQgYmVmb3Jl
IHByZS0NCj5lbmFibGUuDQo+Pg0KPj4gVGhlIHJlcGx1ZyBpbnRlcnJ1cHQgaXMgdW5tYXNrZWQg
Zm9yIERQIGFuZCBlRFAgZnJvbSB0aGUNCj4+IGRwX2hwZF9wbHVnX2hhbmRsZSgpIGFuZCBtYXNr
ZWQgZnJvbSBkcF9ocGRfdW5wbHVnX2hhbmRsZSgpLg0KPg0KPldoeSBpcyByZXBsdWcgZW5hYmxl
ZCBmb3IgZURQPw0KDQpBcyB0aGUgZURQIHBhbmVsIGlzIGFzc3VtZWQgdG8gYmUgYWx3YXlzIGNv
bm5lY3RlZCwganVzdCBlbmFibGluZyB0aGUgSVJRX0hQRCBpcyBzdWZmaWNpZW50Lg0KDQpUaGUg
UkVQTFVHIGlzIGVuYWJsZWQgb3IgdW5tYXNrZWQgYWxvbmcgd2l0aCBJUlFfSFBEIGluIGNvZGUu
DQoNCkkgZGlkIG5vdCByZW1vdmUgdGhlIFJFUExVRyBldmVudCBzdXBwb3J0IGZvciBlRFAgc28g
dGhhdCB3ZSBoYXZlIGFuIG9wdGlvbiB0byBzZWUgaWYgdGhlIGVEUCBwYW5lbA0KY2FuIHVuZGVy
Z28gYSBzaG9ydCBkaXNjb25uZWN0L2Nvbm5lY3QgY3ljbGUgYWZ0ZXIgcHJlLWVuYWJsZSAod2hp
bGUgdGhlIHBhbmVsIHBvd2VyIGlzIGVuYWJsZWQpLg0KDQpSRVBMVUcgY2FuIGJlIGdlbmVyYXRl
ZCBmb3IgZURQIGlmLA0KYSkgdGhlIHBhbmVsIHBvd2VyIHR1cm5zIG9mZiBhbmQgb24gT1IgDQpi
KSB0aGUgc2luayBpdHNlbGYgaXNzdWVzIGEgZmFzdCBkaXNjb25uZWN0LWNvbm5lY3QuDQoNClJF
UExVRyBldmVudCBpbml0aWF0ZWQgYnkgc2luayBpcyByYXJlIGFuZCB3ZSBvYnNlcnZlZCBpdCBv
bmx5IGR1cmluZyB0aGUgRFAgY29tcGxpYW5jZSB0ZXN0Lg0KDQpTb21lIG1vcmUgaW5mb3JtYXRp
b24gb24gSFBEIGV2ZW50cyBnZW5lcmF0ZWQgYnkgdGhlIHNvdXJjZToNCg0KUmVwbHVnIGludGVy
cnVwdCBpcyBzb21ldGhpbmcgb3VyIGNvbnRyb2xsZXIgSFcgc3VwcG9ydHMgYW5kIG5vdCBwYXJ0
IG9mIHRoZSBEUC9lRFAgc3BlY2lmaWNhdGlvbi4NCg0KVGhlIHByb2dyYW1tZWQgdmFsdWVzIGZv
ciBIUEQgb24gdGhlIEhXIGNvbnRyb2xsZXIgaW5kaWNhdGVzIHRoZSBmb2xsb3dpbmc6DQoNCjEu
IFRoZSBIT1RQTFVHIGludGVycnVwdCB3aWxsIGJlIGdlbmVyYXRlZCBpZiB0aGUgSFBEIGxpbmUg
aXMgY29udGludW91c2x5IGhpZ2ggZm9yIDEwMG1zLg0KMi4gU2ltaWxhcmx5LCBVTlBMVUcgaW50
ZXJydXB0IHdpbGwgYmUgZ2VuZXJhdGVkIHdoZW4gdGhlIEhQRCBsaW5lIHRyYW5zaXRpb25zIGZy
b20gaGlnaCB0byBsb3cgYW5kIHJlbWFpbnMgbG93IGZvciAxMDBtcy4NCjMuIElSUV9IUEQgd2ls
bCBiZSBnZW5lcmF0ZWQgd2hlbiB0aGUgSFBEIGxpbmUgdHJhbnNpdGlvbnMgZnJvbSBoaWdoIHRv
IGxvdyBhbmQgcmVtYWlucyBsb3cgZm9yIGxlc3MgdGhhbiAybXMuDQo0LiBSRVBMVUcgd2lsbCBi
ZSBnZW5lcmF0ZWQgaWYgdGhlIEhQRCBsaW5lIHJlbWFpbnMgbG93IGZvciBtb3JlIHRoYW4gMm1z
IGJ1dCBsZXNzIHRoYW4gMTAwbXMuDQoNCkFjY29yZGluZyB0byB0aGUgRFAgc3BlYywgcmVwbHVn
IGV2ZW50IHNob3VsZCBiZSBjb25zaWRlcmVkIGFzIGEgZGlzY29ubmVjdCBhbmQgdGhlbiBjb25u
ZWN0Lg0KDQpUbyBhbnN3ZXIgeW91ciBxdWVzdGlvbiwgSSBkaWQgbm90IHJlbW92ZSBSRVBMVUcg
c3VwcG9ydCBmb3IgZURQIGJlY2F1c2UgSSBmZWx0IGl0IHdpbGwgbm90IGFmZmVjdCB0aGUgZURQ
IG5vcm1hbCBmdW5jdGlvbmluZyBpbiBhbnl3YXkuDQoNClRoYW5rIHlvdSwNClNhbmtlZXJ0aA0K
