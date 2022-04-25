Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D97D50D73F
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 04:55:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D285110E14D;
	Mon, 25 Apr 2022 02:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.142.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF9710E14D;
 Mon, 25 Apr 2022 02:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1650855334; x=1651460134;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wHBV/6NhzNt4u/3u1HDSlYaVy6bHF6nQIckJX7UufuE=;
 b=azw0hKkhEOPJwNV/1dFjDR0ouo/6y/xiX+4+uz/rUyZV1DOcId5yoD4S
 ticn73uPgtBDoqQu06pPoGtkFJvzTQUzZ4XnuAm3ldkT0LDmz8Dl9+T+F
 RJuYb94RpqVuIhNfabuCnrgaBV3Y0wWhZoRMket8i5n7HJ1Uvi88JRlSv 4=;
Received: from mail-dm6nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.175])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 02:55:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j4wt/tc+IYLheEOW1eV0f5Rllql6m3TWZjGfT9Up8KnbEwd1acncyEdIZ2j77GG3gvt0LkPsjip0fuQ8ZdqD8tWO+MltD7WvX++iT7baixnGEOTaah7b3hNfbuQAOydovB1X01j0Ku14gCxB/uaISAr10Emq09paO+Wduy1FLq1q6i4BOkPPkswn8HZa/MKOHmfJu7kRQdFBH2owsyttA7BXEZNXPc5E69gYgBlKWKmzdX+VIxoh+gpZt3He8mmMzTkpsgzpydjKuiPkU7RL4K1U8HJweZcD8tjvZkl9IFOftHY9ZsAqyxHBdb+Nn1Q7l8HtzDYTYs6tAi5JdvwfyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHBV/6NhzNt4u/3u1HDSlYaVy6bHF6nQIckJX7UufuE=;
 b=QfjBvNMAn4mQOu8+DoW0Qxp+Ru8gPHDc4HfSaU8yxo+ymqWO7Pb8D6B4EM4YoZDPLyQISMlwuApHmr2MdsXhlKD1rwOJoFGO/Cv30BDjglGUJb88mfyhIbVkuin5dGjLwXFODSs3b3bEDAnqBnsnXDucBqnjlFFCsRwdyrq58/vScaJpzRLTap4D/zGa+nCSbLDEaq4FaR4GttyJYKu8EwECTIYMFRnp/2Z3FNd+LfvhtVsWyG7gQJRc8gLlRqLRdapInk6EhGUaWgDVRhg3xcQcUDrDFQv5OP57c/FKbFNcWJTcf7Ac7N9FHOJyKELkPdxx1IqlSZvUi/ZQ/fJHWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6)
 by SN6PR02MB4736.namprd02.prod.outlook.com (2603:10b6:805:94::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Mon, 25 Apr
 2022 02:55:29 +0000
Received: from MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::1d18:abb7:c311:543f]) by MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::1d18:abb7:c311:543f%4]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 02:55:29 +0000
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
Thread-Index: AQHYVij949GuwPpnhkq0MCzvgEg91az8phaAgANNanA=
Date: Mon, 25 Apr 2022 02:55:29 +0000
Message-ID: <MW4PR02MB7186AE3B9B573FB1C594DA35E1F89@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <1650618666-15342-1-git-send-email-quic_sbillaka@quicinc.com>
 <1650618666-15342-3-git-send-email-quic_sbillaka@quicinc.com>
 <CAE-0n52tKt3yywZFEKobet4t9xXA_GbTDcUqPPEj5A-KkDET3Q@mail.gmail.com>
In-Reply-To: <CAE-0n52tKt3yywZFEKobet4t9xXA_GbTDcUqPPEj5A-KkDET3Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a39f069-d00e-4ce3-3947-08da26670e99
x-ms-traffictypediagnostic: SN6PR02MB4736:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <SN6PR02MB47366C7A7CAB4E178E59718A9DF89@SN6PR02MB4736.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dilaDNPOt9S58wl3U2yBJ915EqI+q256HckUoKgLdf47F/VA0XQw0OXZpEs4/qu1PkfDYz8znCRB3dMJEpsbGYQP1WZcOsp0ulkUH9fOnS+zFlA8usue4ybSvBarRkzRZVZc4M5IMqg2wmXl2VynDihlIT0OCgSQ1oA9d3XHNXweC42mTWYOFDAHwosL1qjO+CYv01kl/L4W+d8fGWKAv0gsBo0J2iQo2ebGxmlDq0H2cVM6vAyyCFYv8y3+D5Phk7JMaFhQnHgY5r3A8yJPyqijb2NkjPKyMG+G/zVlFifqh3zPTxexr10b6TuULtNrGf/jaXWp7djuJu/rDaj+LQhZ7A0Snq9zelzoiGEtzEYV6RgyMA9Laiz0LLbIEzfd86+4LdS7IekvYT8+SVTZuviVPuv50NzmYjZuUyyAz0hzMyeZcvO+65neADm83gZENbJacSV1hHi9VP+gAtm4byK0HEmpMVoO1UvrlVmJT5Zjp7gmKB2ZSeYeWZnJeGyuftxt+Lq3ypj0MuRSGf90uqR6aOKd3z5Q5S/F/ghNaWw97ffeJ2E+X8D5TFPiiMxi4K8lVtaJz1DoBKZ9wJeFtj0y9ZeSuDccpbQSGYvSZDbdk54jRe/QMQB6MmsrsDLCR9D64xlgCTD6k3HKE1uTybwfrkdQ2Z38OmH/W0CJp0G6j+swH4FLGvyGj3kp2gMPL8YdalbxTNs6mKsHvSqLjA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR02MB7186.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(71200400001)(26005)(64756008)(66476007)(66946007)(8676002)(66556008)(66446008)(186003)(86362001)(122000001)(9686003)(6506007)(7696005)(2906002)(38100700002)(55016003)(5660300002)(52536014)(33656002)(83380400001)(76116006)(508600001)(7416002)(316002)(8936002)(38070700005)(110136005)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WXY5Mm5qK1lTNnA1LzAvTm9nVDZndVZmMnpJVXh1Ly9RZWdnayt5bUh0bENs?=
 =?utf-8?B?ZitvT0xjL3ArSmhwY2xSL1luNTdzR1ZSTzJPSVpFU0J1ckJhZ3MxTHhvV0Jk?=
 =?utf-8?B?UER0ZWpESUxNM1J6d0FtdGVlVTFmRnhtZ1VDd0hEYzBQTDd3NUhsdmh1Y0h3?=
 =?utf-8?B?YVVWWjZKQk5JeXFpQm8wcnpvczhXelo0bGwvTzRaY1JzbnhyZkVPaHJTNE8w?=
 =?utf-8?B?VmsrSmRNMUNjVGt1WE1RVXJhR2JIczRQQUVOMWtvNWpSQUZoVmxMcHBZc2da?=
 =?utf-8?B?bUJqdStIeEYxeFFjdjNiOGpnSkxnbTR6RjUyREs5TDZUMEI5R2x0QjEwQXBz?=
 =?utf-8?B?ckFmaGtORmxhUjJ6OTlwYTJTNXloL3BTVFp4UXF2VDA3elVyN1Z5TFhpQVdM?=
 =?utf-8?B?bWVTQ3BJK3Nua1dZYVpZRzJBWi9RRXJyYXJ4ZFhuYWZrRnhDbVJLOThZSGhs?=
 =?utf-8?B?amp5aUIzKzYzYWdlWXBvL3o1WkVJdTIvV1lBV3RRWHFpbFBIQU1XeE5PQm5C?=
 =?utf-8?B?QTNtNUpvbUVCc2NRVFJ2TkJtYlgzZWQrazdyU3hkVkQ1RHFnbnF2Z1RXV2o3?=
 =?utf-8?B?SVR4eVMxRHErT0tPTlliamFJa0U3WHpZT2V2ZkhJRzE2V0o4UFJBcVQ2RWVn?=
 =?utf-8?B?eVoxM296eU5raHo2TjNlQ292eG9icmRzdG4zNTY2NUUybjBIVit5WmsweVJr?=
 =?utf-8?B?bm02dlpXL2lnOWtmUHRWd3JWN2tMalNQOE93Q0ZPWm5VUFJlWVdTRDhZQUd6?=
 =?utf-8?B?L1hWekVTRWlFbDE1ekdVcmFRRktuT05tdHRwTzNkcFpSK1lXSHFWaWNyWjlQ?=
 =?utf-8?B?R3ppWW9qcERHdGw0aDlZcjF4eUlKUVVtSFZINEFGSGpqc1hYS0JmZ1plNmdR?=
 =?utf-8?B?MDQ2MmlzVU9TUTNlQ2RvUWJ2ZXdzcHc1d3l0ZHMxM2t1SHU5NFpJMldhc3Y4?=
 =?utf-8?B?ZmlVRVhwZVQwSDRGcUV2UWxzM3E1Mm9zNGZEV0ZlMmtJS1plY1Z6bjBHNGhp?=
 =?utf-8?B?YTdqcXJDV2JGV3JiOEdSRTdieUhUWFFqTnIyOXN2WVBxZUoxZkhZSlExK093?=
 =?utf-8?B?NFJ0WXp2RzNwN3FueXNXVzRCbW1YUXhQRjFnMnlSWUdDa2twNENvb1JQbzRx?=
 =?utf-8?B?enN5RU5yL3Q4QU56amhCamNIeDJ2VVRKNEtFalNUZlVJUHU0MXpFZUFmb01W?=
 =?utf-8?B?RUo0Nk11TFB3UWZoK2tTSnpsMm94WmRweE10eVFPRHlwM2hjdUJHd3o4NGZj?=
 =?utf-8?B?NGlpelpRS1NYd0E3bzJYM1VmRVNwN1ZkSXowakNaUGlPQUFXSXZwTnJqQS9U?=
 =?utf-8?B?Mm43M2tJRGFGUDVldnRvUjd2NlFuWWFjMkpSQ2dRMUpDTjM5cGNNZml2c0NT?=
 =?utf-8?B?cEZMZFlRdzVYZnpJU3pwUXdQdDVTa0V1TlU1Myt5QUtkRi9EZk5aMk5iL0J0?=
 =?utf-8?B?NkVMbTFqWUNpdHRteUR4dThjaGVVTXBIZTB1dFFIWDlmM2dMQmUyNGFVREt1?=
 =?utf-8?B?WEd5MmIwY1BNZmxBQW5ia2ZJa3FWZjc5c0Z2TTMxeTg3QXhJdlFkdlNWZi9L?=
 =?utf-8?B?UGxKTStGd2Vzd2tubEpzNUsxVEdTRnY3OG9SLzVBTjByYnBkQ29BYUlKQ1BD?=
 =?utf-8?B?c3ByVThnUk9adllRdzkwUks3WWJBQ3N2c3I5dlFyZ25rK3NHdytGVEYrZlhn?=
 =?utf-8?B?VnZyT3VFbjNZSU5rZGhVajFBVENqNHBZZzd3d0dkc2VIS2VROVRMSjJ4Zk9T?=
 =?utf-8?B?RlFsVkJvWDl0OGErcDBOZDZVTy9rRktFMXdSR1cyY1hlNGx1NUtGL0VzTmY3?=
 =?utf-8?B?ZzBERkNXQ1Q4OUZjNEVrSlhvd1l4M2h3ZW9UcDlzdlAySVA1ZXg3MFlEOWxq?=
 =?utf-8?B?aUZnQ3FjZHQ2Z3l3T1N6NDNveHlIQXVXbncrR3RVQjVBSlF2WVFXbmNHQjZR?=
 =?utf-8?B?T0c0WGtndkE5ZGNYUm9nL1NHUzIvRk5WeENkL3VZd3I1d3N4Nm1JUjhjNTFp?=
 =?utf-8?B?VXpldUR2OFBNdW1rbzVjdXcxZ0MzWnlLUzBtelNYUEdUV1pCcVZZajdwY3g5?=
 =?utf-8?B?VVRlZG1Td215S1hqWk84cjZ6VWtmVkpCY2tsZGhsT2hBOXUwdTBGYVVjcVlI?=
 =?utf-8?B?MFhtTVZLMlAzbjVBQUZEZGU5ZTZocC9relBpT3pUUVU0TWpFcXZKR0dudjV5?=
 =?utf-8?B?NWlWL0xtbmdZNkZXZDdtdS9OTGRZKzdBSkJrYUlZVlZ0djNET0FZRyt5Mi9L?=
 =?utf-8?B?Z1hJUlVXdVQ2dkY0MWZsYUtHSE1hRmFrSEg3eGF6YjJ3MUF2emRrSVEvVXVU?=
 =?utf-8?B?TFMyYW9UTEQvN24zN1doSFNua0pqSGp0VnNERi9FVi9iRisyd3RRZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a39f069-d00e-4ce3-3947-08da26670e99
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2022 02:55:29.4600 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PY2v8RWLo3eKB/KhRs18x5LhYTCE3Jbf3LZHfRmNvmAS/8xZ+nbdr7zJX+/YEuMhJEO1lMqvsAkhFzka5Kh3nYBKxc8KsQgOxLfQHKNMSxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4736
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

SGkgU3RlcGhlbiwNCg0KPlF1b3RpbmcgU2Fua2VlcnRoIEJpbGxha2FudGkgKDIwMjItMDQtMjIg
MDI6MTE6MDQpDQo+PiBUaGUgcGFuZWwtZWRwIGVuYWJsZXMgdGhlIGVEUCBwYW5lbCBwb3dlciBk
dXJpbmcgcHJvYmUsIGdldF9tb2RlcyBhbmQNCj4+IHByZS1lbmFibGUuIFRoZSBlRFAgY29ubmVj
dCBhbmQgZGlzY29ubmVjdCBpbnRlcnJ1cHRzIGZvciB0aGUgZURQL0RQDQo+PiBjb250cm9sbGVy
IGFyZSBkaXJlY3RseSBkZXBlbmRlbnQgb24gcGFuZWwgcG93ZXIuIEFzIGVEUCBkaXNwbGF5IGNh
bg0KPj4gYmUgYXNzdW1lZCBhcyBhbHdheXMgY29ubmVjdGVkLCB0aGUgY29udHJvbGxlciBkcml2
ZXIgY2FuIHNraXAgdGhlIGVEUA0KPj4gY29ubmVjdCBhbmQgZGlzY29ubmVjdCBpbnRlcnJ1cHRz
LiBBbnkgZGlzcnVwdGlvbiBpbiB0aGUgbGluayBzdGF0dXMNCj4+IHdpbGwgYmUgaW5kaWNhdGVk
IHZpYSB0aGUgSVJRX0hQRCBpbnRlcnJ1cHRzLg0KPj4NCj4+IFNvLCB0aGUgZURQIGNvbnRyb2xs
ZXIgZHJpdmVyIGNhbiBqdXN0IGVuYWJsZSB0aGUgSVJRX0hQRCBhbmQgcmVwbHVnDQo+PiBpbnRl
cnJ1cHRzLiBUaGUgRFAgY29udHJvbGxlciBkcml2ZXIgc3RpbGwgbmVlZHMgdG8gZW5hYmxlIGFs
bCB0aGUNCj4+IGludGVycnVwdHMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogU2Fua2VlcnRoIEJp
bGxha2FudGkgPHF1aWNfc2JpbGxha2FAcXVpY2luYy5jb20+DQo+DQo+VGhlIHNwcmlua2xpbmcg
b2YgaWYgY29uZGl0aW9ucyBhbmQgbWFudWFsIGRyaXZpbmcgb2YgdGhlIERQIHBsdWcvdW5wbHVn
IHN0YXRlDQo+bWFjaGluZSBpcyBwcmV0dHkgY29udm9sdXRlZC4gVG8gbWFrZSBpdCBiZXR0ZXIg
dGhlIGRyaXZlciBuZWVkcyBhbiBvdmVyaGF1bC4NCj5Bbnl3YXksIGl0IGxvb2tzIG1vc3RseSBm
aW5lIHRvIG1lIGV4Y2VwdCBmb3IgdGhpcyByZXBsdWcgaW50ZXJydXB0IHF1ZXN0aW9uDQo+YmVs
b3cuIE90aGVyd2lzZQ0KPg0KPlJldmlld2VkLWJ5OiBTdGVwaGVuIEJveWQgPHN3Ym95ZEBjaHJv
bWl1bS5vcmc+DQo+DQo+PiAgaW50IGRwX2NhdGFsb2dfY3RybF9nZXRfaW50ZXJydXB0KHN0cnVj
dCBkcF9jYXRhbG9nICpkcF9jYXRhbG9nKSBkaWZmDQo+PiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vZHAvZHBfZGlzcGxheS5jDQo+PiBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfZGlz
cGxheS5jDQo+PiBpbmRleCAwNTU2ODFhLi5kZWE0ZGU5IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21zbS9kcC9kcF9kaXNwbGF5LmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
c20vZHAvZHBfZGlzcGxheS5jDQo+PiBAQCAtMTA5Niw2ICsxMDk3LDEzIEBAIHN0YXRpYyB2b2lk
IGRwX2Rpc3BsYXlfY29uZmlnX2hwZChzdHJ1Y3QNCj5kcF9kaXNwbGF5X3ByaXZhdGUgKmRwKQ0K
Pj4gICAgICAgICBkcF9kaXNwbGF5X2hvc3RfaW5pdChkcCk7DQo+PiAgICAgICAgIGRwX2NhdGFs
b2dfY3RybF9ocGRfY29uZmlnKGRwLT5jYXRhbG9nKTsNCj4+DQo+PiArICAgICAgIC8qIEVuYWJs
ZSBwbHVnIGFuZCB1bnBsdWcgaW50ZXJydXB0cyBvbmx5IGZvciBleHRlcm5hbCBEaXNwbGF5UG9y
dCAqLw0KPj4gKyAgICAgICBpZiAoIWRwLT5kcF9kaXNwbGF5LmlzX2VkcCkNCj4+ICsgICAgICAg
ICAgICAgICBkcF9jYXRhbG9nX2hwZF9jb25maWdfaW50cihkcC0+Y2F0YWxvZywNCj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgRFBfRFBfSFBEX1BMVUdfSU5UX01BU0sgfA0KPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBEUF9EUF9IUERfVU5QTFVHX0lOVF9NQVNL
LA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0cnVlKTsNCj4+ICsNCj4NCj5J
dCBzZWVtcyBsaWtlIG9ubHkgdGhlIHBsdWcgYW5kIHVucGx1ZyBpcyBlbmFibGVkIGZvciBEUCBo
ZXJlLiBJcyByZXBsdWcNCj5lbmFibGVkIGZvciBlRFAgd2hlbiBpdCBzaG91bGRuJ3QgYmU/DQo+
DQoNCkJ5IGRlZmF1bHQsIGFsbCB0aGUgaW50ZXJydXB0cyBhcmUgbWFza2VkLiBUaGlzIGZ1bmN0
aW9uIGlzIG5vdCBleGVjdXRlZCBmb3IgZURQDQphbnltb3JlIGJlY2F1c2UgdGhlIGhvc3RfaW5p
dCwgcGh5X2luaXQgYW5kIGVuYWJsZV9pcnEgYXJlIGFsbCBkb25lIGZyb20NCm1vZGVzZXRfaW5p
dCBmb3IgZURQIHdpdGggYXV4X2J1cy4gU28sIG5vbmUgb2YgdGhlIGVEUCBocGQgaW50ZXJydXB0
cyBhcmUNCmVuYWJsZWQgb3IgdW5tYXNrZWQgYmVmb3JlIHByZS1lbmFibGUuDQoNClRoZSByZXBs
dWcgaW50ZXJydXB0IGlzIHVubWFza2VkIGZvciBEUCBhbmQgZURQIGZyb20gdGhlIGRwX2hwZF9w
bHVnX2hhbmRsZSgpDQphbmQgbWFza2VkIGZyb20gZHBfaHBkX3VucGx1Z19oYW5kbGUoKS4NCg0K
Pj4gICAgICAgICAvKiBFbmFibGUgaW50ZXJydXB0IGZpcnN0IHRpbWUNCj4+ICAgICAgICAgICog
d2UgYXJlIGxlYXZpbmcgZHAgY2xvY2tzIG9uIGR1cmluZyBkaXNjb25uZWN0DQo+PiAgICAgICAg
ICAqIGFuZCBuZXZlciBkaXNhYmxlIGludGVycnVwdA0K
