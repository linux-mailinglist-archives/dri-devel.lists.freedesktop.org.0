Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF84B50A4E9
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 18:00:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E8D10E67D;
	Thu, 21 Apr 2022 16:00:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.142.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64B210E660;
 Thu, 21 Apr 2022 16:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1650556849; x=1651161649;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=O2dTzYXzEPMkFcMNTjb6mmd+s+RPaf0253NjZVvx78I=;
 b=UJp/c3u7Ndyechz38EZX1gx1L+g/tvUA9PbOeIJFp7jyBshWQBfZHpFn
 kJTzfz+pAdIQaMn8zzgvEG54yPwVDDQTp3a/PMbJL0vhLbXSFqsjlGsOw
 hlOP/SmR0rRSFLHEf1yCfrT80JjHJj91Q+MwU32u6RL62M5vQ7w1/HaK0 A=;
Received: from mail-bn7nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.109])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 16:00:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LnixhuDLDHiaeN25tp+f/wimBwWTrIRu/FBzuoOYlcO3ig5fErJyZWkYWayM8FPxBWnysUOazsS+H+Gc1zfI+6s5LgQ+nktyiOaK+vQVhzw4RE1e0pKqEGQKdJRKSz6W8y2Oo5mKK6pM04f8yJMAiAOAc7dejhlIwwu3mwxmgMsE27GYLjydngisM0J5YwALijn7fmJv0DnpKCJVx8Du7akZrFpCIOhZqJozv2e5iOq19OETJ6wM8Aal1WVxSIysbVX5hFLO40nAwPHQ2AkCkuQNABfYcym5JhfH+muzo2m94uNZDOcqyMpfIjgD/yA3pV9kae21UA1mmLPiNmUv5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O2dTzYXzEPMkFcMNTjb6mmd+s+RPaf0253NjZVvx78I=;
 b=UyUHdVWLjuNjyafCEENWUn9CXhWo1UVHybE9cmdSbVc2TEQdbnKYMTPfqrh+QE3kTH8k0TP33btUgx/uWyzJoNddepAjaidjg3pf6D/nC5m8Y3lmoT9EUQDBq6xFhMv5Ns9IQzkEpUIA9uhQzmbqvdm6v8srGszEIxSem1cZoEi52U30cL6PiIyravxyR8gFwmejfzfpCK0AFAJcxWxC9L9kv4H+v0sKii5ND+cICosq+kGc9u0eJR85nNu86aIugtPKB5yOyk+rhzgbSK6pUU+1ETETcbpFC4IyZ6k07RQ1313OHMSA+3nuco1kekXRDmBNHvSGokxIbzoFxUgbYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6)
 by CO1PR02MB8585.namprd02.prod.outlook.com (2603:10b6:303:15c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Thu, 21 Apr
 2022 16:00:42 +0000
Received: from MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::1d18:abb7:c311:543f]) by MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::1d18:abb7:c311:543f%4]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 16:00:42 +0000
From: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
To: Doug Anderson <dianders@chromium.org>, "Sankeerth Billakanti (QUIC)"
 <quic_sbillaka@quicinc.com>
Subject: RE: [PATCH v8 1/4] drm/msm/dp: Add eDP support via aux_bus
Thread-Topic: [PATCH v8 1/4] drm/msm/dp: Add eDP support via aux_bus
Thread-Index: AQHYVY1QlOHIcTOTrkKJpoqzSwRwa6z6fEqAgAAKffA=
Date: Thu, 21 Apr 2022 16:00:41 +0000
Message-ID: <MW4PR02MB718603608E45FB53A8D942C7E1F49@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <1650551811-24319-1-git-send-email-quic_sbillaka@quicinc.com>
 <1650551811-24319-2-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=Ug-ZRiMrVyVH+OT1fMhyUnAixP2FfWKTQpLZXka0U_=g@mail.gmail.com>
In-Reply-To: <CAD=FV=Ug-ZRiMrVyVH+OT1fMhyUnAixP2FfWKTQpLZXka0U_=g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8392afe4-a5dd-4006-a393-08da23b0162d
x-ms-traffictypediagnostic: CO1PR02MB8585:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <CO1PR02MB858560C123249C65A55D9FCC9DF49@CO1PR02MB8585.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sWBXm5RveuAlLw0TEfw6ThjU7d7aywDXLqdHvqQyQi3auB8yaUcyjmsqUUAWpU0rbdD1DzIIzQ7+iy8PfoCc7dHBdaduvCHL36SYF+aaE2GAS3bzwI+MfgtQodA44PKZPfXIQT9gcGky/8pdPkcDuNQKpHvH30bLuX4BYOhPl04eUlroGK50tfxTPIHd1Z+lumQcdZJlAu/+mcV+6wGKw92KS9xe2wKqPkuIZ/6F1v6QIbolbEplUUmUJ85VKgix08ffamAALH2fkuj5Qr7G5R4Omv1mJBQLq9vlZouT4Pnj/jsA/c5bofon/ZG/3WHK6SmwHzI2q73If4WenEpMSIFg1nCy/pRHGayNRlQY1pwu5AazcTkVhpIJIyjWOahPEcvlpKGd93CLxuv/A+/aDUyRwTma/d0oV2dQ/SVOeuqsn9+gNj6Le2bMY+zAlmAybjw63VpSZfYM45Kbbv8Cx6YxynG5XCOOSJ4oL8/Y1ht8Yy6Li3WIp8t3KQ2tPOMxHa81qN1FyPpfNLKoCM4r5vEJ9tkH9wnoaBw3u5/9B5PuAA11nMfTFTHs6Ylm1fHFdTCNwhhh6uLST9K+mPlm+fyYTdPk8fOXhkqGbi73m2aqmaq1NtebwxCdy/CwsumWz6zBFPhav0977s7i5Fqq5rDZK0bz4EtotlwuMt2w5eSMlinto5sz5Ls26KGV5pLNmXOKFSQtqRQDtTmZt1LLnA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR02MB7186.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(508600001)(6506007)(9686003)(8676002)(7416002)(8936002)(66476007)(7696005)(71200400001)(316002)(33656002)(110136005)(66556008)(66946007)(64756008)(66446008)(26005)(186003)(86362001)(76116006)(2906002)(122000001)(5660300002)(52536014)(4326008)(55016003)(83380400001)(38100700002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YzBRMDVSNHQ3eC9UcmRkQm1XalMyZVFuTDIwMG1EV1AwNWZSMzZRN0t4TElH?=
 =?utf-8?B?d3hzaUdieCtBLzBtVFh0UHdaRHZUdVkvVHZBckUyZkZHSzhHalc4K1VFK0o2?=
 =?utf-8?B?ZUlTaUJiZHIxV0F2Ty9hWXlubGd2SGpqTll6MExEZUJ0N1U4cnVPQWVVZ0dm?=
 =?utf-8?B?T3VWbkxSVG9sNVl1a3NiSlVFUWZsaGx4aWcrcGlPNXBCcmp5ZVg1ZVVDMHpw?=
 =?utf-8?B?Um03RDVYeldyNFZmSzYwNXBlM05NOWdDRTJVcWN6ckVOTUlqWlJKOVlHYlUr?=
 =?utf-8?B?YkNkNGdxckMzZTd2ZFZIYjZiRU5mUFlzNzlqZ3EzcHZHeEtQV2RFWm5FbnhV?=
 =?utf-8?B?RnFPUFNyYXlyODJRcjNKVVpvWFNqemk0MStieHFXZ2dSdXdBSkYxZTVqOW1C?=
 =?utf-8?B?MTdaZlF2emZ1YWFPb0dMMkFoTm1NT0RRVGlicnJlV1JPK285M1NmSXNuRVQy?=
 =?utf-8?B?U1ZMTU44R09mdS8zRXc2bVIxY1lEa3V1R25yOE9Kc3pIWjFMSnEvSWI3T05h?=
 =?utf-8?B?Vk5XYkpwQW1FQzRoazVwM0t0LzFrbFhIRkc5WHZMZXU2a1g4UUJyUjgvQUN6?=
 =?utf-8?B?b1k2djVYTEJoL2FiQ3FKcjBjSU1UQlIzbDVsNFc2dG02T00xWVYveEhtVzlm?=
 =?utf-8?B?Nk91K045TnQybXdKaHZwOXFpTkQ1dGVxTDdzMEZuOUdTNGpOL09FUFFuV3Z4?=
 =?utf-8?B?SVNoc0ErWVNPZndCSEhxc1hCc3ovRDlyMlNBQ0xJQjU0U3E4aGl4YlM4cHNs?=
 =?utf-8?B?L3hJbHp0MG1XSXlIV094L3ZSYkV2bk9BSHJsaXF4OGJZbENhNjZDQ0thZG9N?=
 =?utf-8?B?ZG9taHdNTHlXL2FURGFvRlBPMHNUc28xdWhuODlCdndiSlRnTjBrcXhQTkhi?=
 =?utf-8?B?VWx1TVoyYTdKb0NHTm9SYXhRZC96anVMZ3pSbEtaU2xwL0hWbm1VTTBRU3dt?=
 =?utf-8?B?N0hhM0I0Rnk5YWM1UVRybDZCYldsbWp1bmdUUzJkRk82eUJXejlHWnpFU3Jz?=
 =?utf-8?B?RytDclRUbVUyWktXbThseFJEcldYbk1aM1FXbDZNTWVNLzdPZkt1ekF2N1JH?=
 =?utf-8?B?a09zTmNWTTI2bnRudTVZQ1NGcmpwOUNQRWNZNHNuUXJlS2w0SDg1ZjRvbVZp?=
 =?utf-8?B?U1h1NkNRTjJNYmZkaXVocmo1eWV4L01Dbno5ZldabWpsS0EwbnIveUp0dFdQ?=
 =?utf-8?B?ejdLNC95ZTFQL0EvNWF0MlpjajhPMGZ4UlBJdTJQRkd1T3JydG9FZUdwZ2Nh?=
 =?utf-8?B?T3c2cTJpVXBGUWw4WGNvTmNIazBOUEROcVhZcm1pb1FwUXlUdHZDSlpQREFv?=
 =?utf-8?B?aS9QbzRlcVVzcVJhOWRibHVOVE1UTktJTVR2cUpaUXVlVGxrbURpQU95T0Z0?=
 =?utf-8?B?bU5GR2dGclhyQlRjMVlkSTZMcUZocEJucHBsZFVBUWR1TDBDUXBWNU9WQXU5?=
 =?utf-8?B?Z0Z6K0tERnFEaUh2MzFBaHRiTmRhRHNXT3RQaUI4RU5YL2RiTVpBVzJleDJT?=
 =?utf-8?B?bjJpVzlEY2UzOWxUL2FQbkhPVDJoYk9kZDlvL3FsRGROWTJoY1BKNFBudXJB?=
 =?utf-8?B?U1NWS0c3R3B3cHdXRjFjNFlMR2VzcnExckJYb0cyYWJaeGtJMnViU05UbjlR?=
 =?utf-8?B?Z0xwQ3JCdmxvN3FUT1c4YXFFM2JRVDIxcDN3T2xIWUVTRzE0ZDdmdlhOa1Fn?=
 =?utf-8?B?MHlrZ2haOW81UlNxTlVWRmw4bmUvM21aUm9seEs5aWJrM1k2Ui9PMmg3MTY0?=
 =?utf-8?B?Ty9XamhkVzhkclFMalY5KzRqWmRaZlpqSkZDYXlDUm5xRmVkdE91T1dsaSth?=
 =?utf-8?B?eFdVM1lVcExaS3Z3ZG92c01aL1dQeHpZd2Jlcm45TnFjaDBVWTVVZDZaNnpk?=
 =?utf-8?B?N2w4bTRJUHBxWnNNTm83NHczZ3R0WnBpcFk3c2x6N3grdmlCbEtCdE5VYTlY?=
 =?utf-8?B?NXQzV1QwNC92Uys0MjFPNDNxTW1nTXB3M2dCQXoxUUc2VzVMRGE1Tll3Qito?=
 =?utf-8?B?MmJpT0FJejk1KzRhdXJvWGI3QlVCNGNQK2VwcXUvL0k5aXpacGJ2OXF4QjVz?=
 =?utf-8?B?ampQRCtDRlVmZmg2U1FpM2pNRk15dTlHc01pakJINWRuR0k0NlZscy9oc014?=
 =?utf-8?B?d2JBUkI5akoxZUtSVUVDMzFuQmhtejZnNXVxSldrclllbkxIbmxGODF5WFpV?=
 =?utf-8?B?RmRVYTF0RERZV2M2YTRoM3lwa3ZTME9DWkxOK0tyS2tmaTJHM0RXWi9Ob0Zn?=
 =?utf-8?B?YXptOW8zOGxYM1B3NElLNzliWXhLK0d5Z1JtWDd3OFpjNVBtWldRZ2Q0Znd2?=
 =?utf-8?B?dnlTN2FGNkdOQUJaMzRmcm04ZEFPVms4aDJIeThkSzFDVEdWZVJjQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8392afe4-a5dd-4006-a393-08da23b0162d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 16:00:41.9496 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ep8YP7SVGS+hzVNEOYZhxRqdKcEKK0D1aeh/LC/zBv0hAnuFzq4wmXBwHAN4MMJLzYTXZE0SEu/gp+EpUUwdO85qjyLnI8cZrFnwQtwXDT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR02MB8585
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
bGxha2FudGkNCj48cXVpY19zYmlsbGFrYUBxdWljaW5jLmNvbT4gd3JvdGU6DQo+Pg0KPj4gQEAg
LTE1MzAsNiArMTUzMiw2MSBAQCB2b2lkIG1zbV9kcF9kZWJ1Z2ZzX2luaXQoc3RydWN0IG1zbV9k
cA0KPipkcF9kaXNwbGF5LCBzdHJ1Y3QgZHJtX21pbm9yICptaW5vcikNCj4+ICAgICAgICAgfQ0K
Pj4gIH0NCj4+DQo+PiArc3RhdGljIGludCBkcF9kaXNwbGF5X2dldF9uZXh0X2JyaWRnZShzdHJ1
Y3QgbXNtX2RwICpkcCkgew0KPj4gKyAgICAgICBpbnQgcmM7DQo+PiArICAgICAgIHN0cnVjdCBk
cF9kaXNwbGF5X3ByaXZhdGUgKmRwX3ByaXY7DQo+PiArICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9k
ZSAqYXV4X2J1czsNCj4+ICsgICAgICAgc3RydWN0IGRldmljZSAqZGV2Ow0KPj4gKw0KPj4gKyAg
ICAgICBkcF9wcml2ID0gY29udGFpbmVyX29mKGRwLCBzdHJ1Y3QgZHBfZGlzcGxheV9wcml2YXRl
LCBkcF9kaXNwbGF5KTsNCj4+ICsgICAgICAgZGV2ID0gJmRwX3ByaXYtPnBkZXYtPmRldjsNCj4+
ICsgICAgICAgYXV4X2J1cyA9IG9mX2dldF9jaGlsZF9ieV9uYW1lKGRldi0+b2Zfbm9kZSwgImF1
eC1idXMiKTsNCj4+ICsNCj4+ICsgICAgICAgaWYgKGF1eF9idXMgJiYgZHAtPmlzX2VkcCkgew0K
Pj4gKyAgICAgICAgICAgICAgIGRwX2Rpc3BsYXlfaG9zdF9pbml0KGRwX3ByaXYpOw0KPj4gKyAg
ICAgICAgICAgICAgIGRwX2NhdGFsb2dfY3RybF9ocGRfY29uZmlnKGRwX3ByaXYtPmNhdGFsb2cp
Ow0KPj4gKyAgICAgICAgICAgICAgIGRwX2Rpc3BsYXlfaG9zdF9waHlfaW5pdChkcF9wcml2KTsN
Cj4+ICsgICAgICAgICAgICAgICBlbmFibGVfaXJxKGRwX3ByaXYtPmlycSk7DQo+PiArDQo+PiAr
ICAgICAgICAgICAgICAgcmMgPSBkZXZtX29mX2RwX2F1eF9wb3B1bGF0ZV9lcF9kZXZpY2VzKGRw
X3ByaXYtPmF1eCk7DQo+DQo+SSB0aGluayBhIGNvbW1lbnQgd2FzIHJlcXVlc3RlZCBhYm92ZSB0
aGF0IGxpbmUgc2F5aW5nIHNvbWV0aGluZyBsaWtlOg0KPg0KPi8qDQo+ICogVGhlIGNvZGUgYmVs
b3cgYXNzdW1lcyB0aGF0IHRoZSBwYW5lbCB3aWxsIGZpbmlzaCBwcm9iaW5nDQo+ICogYnkgdGhl
IHRpbWUgZGV2bV9vZl9kcF9hdXhfcG9wdWxhdGVfZXBfZGV2aWNlcygpIHJldHVybnMuDQo+ICog
VGhpcyBpc24ndCBhIGdyZWF0IGFzc3VtcHRpb24gc2luY2UgaXQgd2lsbCBmYWlsIGlmIHRoZQ0K
PiAqIHBhbmVsIGRyaXZlciBpcyBwcm9iZWQgYXN5bmNocm9ub3VzbHkgYnV0IGlzIHRoZSBiZXN0
IHdlDQo+ICogY2FuIGRvIHdpdGhvdXQgYSBiaWdnZXIgZHJpdmVyIHJlb3JnYW5pemF0aW9uLg0K
PiAqLw0KPg0KPg0KDQpXaWxsIGFkZCB0aGUgY29tbWVudA0KDQo+PiArICAgICAgICAgICAgICAg
b2Zfbm9kZV9wdXQoYXV4X2J1cyk7DQo+PiArICAgICAgICAgICAgICAgaWYgKHJjKQ0KPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgZ290byBlZHBfZXJyb3I7DQo+PiArICAgICAgIH0gZWxzZSBp
ZiAoZHAtPmlzX2VkcCkgew0KPj4gKyAgICAgICAgICAgICAgIERSTV9FUlJPUigiZURQIGF1eF9i
dXMgbm90IGZvdW5kXG4iKTsNCj4+ICsgICAgICAgICAgICAgICByYyA9IC1FTk9ERVY7DQo+PiAr
ICAgICAgICAgICAgICAgZ290byBlcnJvcjsNCj4NCj5UaGlzIGdvdG8gZG9lc24ndCBhZGQgbXVj
aC4gSnVzdCBsZWF2ZSB0aGUgYWJvdmUgbGlrZSBpdCB3YXMgaW4gdjcuDQo+cmV0dXJuIC1FTk9E
RVYgdy8gbm8gZ290by4NCj4NCj4NCg0KT2theQ0KDQo+PiArICAgICAgIH0NCj4+ICsNCj4+ICsg
ICAgICAgLyoNCj4+ICsgICAgICAgICogRXh0ZXJuYWwgYnJpZGdlcyBhcmUgbWFuZGF0b3J5IGZv
ciBlRFAgaW50ZXJmYWNlczogb25lIGhhcyB0bw0KPj4gKyAgICAgICAgKiBwcm92aWRlIGF0IGxl
YXN0IGFuIGVEUCBwYW5lbCAod2hpY2ggZ2V0cyB3cmFwcGVkIGludG8gcGFuZWwtDQo+YnJpZGdl
KS4NCj4+ICsgICAgICAgICoNCj4+ICsgICAgICAgICogRm9yIERpc3BsYXlQb3J0IGludGVyZmFj
ZXMgZXh0ZXJuYWwgYnJpZGdlcyBhcmUgb3B0aW9uYWwsIHNvDQo+PiArICAgICAgICAqIHNpbGVu
dGx5IGlnbm9yZSBhbiBlcnJvciBpZiBvbmUgaXMgbm90IHByZXNlbnQgKC1FTk9ERVYpLg0KPj4g
KyAgICAgICAgKi8NCj4+ICsgICAgICAgcmMgPSBkcF9wYXJzZXJfZmluZF9uZXh0X2JyaWRnZShk
cF9wcml2LT5wYXJzZXIpOw0KPj4gKyAgICAgICBpZiAocmMgJiYgZHAtPmlzX2VkcCkgew0KPj4g
KyAgICAgICAgICAgICAgIERSTV9FUlJPUigiZURQOiBjYW5ub3QgZmluZCB0aGUgbmV4dCBicmlk
Z2UsIHJjID0gJWRcbiIsIHJjKTsNCj4+ICsgICAgICAgICAgICAgICBnb3RvIGVkcF9lcnJvcjsN
Cj4+ICsgICAgICAgfSBlbHNlIGlmIChyYyAmJiByYyAhPSAtRU5PREVWKSB7DQo+PiArICAgICAg
ICAgICAgICAgRFJNX0VSUk9SKCJEUDogY2Fubm90IGZpbmQgdGhlIG5leHQgYnJpZGdlLCByYyA9
ICVkXG4iLCByYyk7DQo+PiArICAgICAgICAgICAgICAgZ290byBlcnJvcjsNCj4+ICsgICAgICAg
fQ0KPg0KPlRoZSBhYm92ZSB3b3VsZG4ndCBiZSBteSBmYXZvcml0ZSB3YXkgb2YgZG9pbmcgdGhp
cy4gSW5zdGVhZCwgSSB3b3VsZCBoYXZlDQo+d3JpdHRlbjoNCj4NCj4gIGlmIChyYykgew0KPiAg
ICBEUk1fRVJST1IoIkNhbm5vdCBmaW5kIHRoZSBuZXh0IGJyaWRnZSwgcmMgPSAlZFxuIiwgcmMp
Ow0KPiAgICBnb3RvIGVycjsNCj4gIH0NCj4gIC4uLg0KPg0KPmVycjoNCj4gIGlmIChkcC0+aXNf
ZWRwKSB7DQo+ICAgIGRpc2FibGVfaXJxKC4uLik7DQo+ICAgIGRwX2Rpc3BsYXlfaG9zdF9waHlf
ZXhpdCguLi4pOw0KPiAgICBkcF9kaXNwbGF5X2hvc3RfZGVpbml0KC4uLik7DQo+ICB9DQo+ICBy
ZXR1cm4gcmM7DQo+DQoNCklmIHJjIGlzIEVOT0RFViBmb3IgRFAsIHRoZW4gd2UgbmVlZCB0byBy
ZXR1cm4gMC4gU2hhbGwgSSBhZGQgbGlrZSBiZWxvdyA/DQoNCmVycjoNCiAgaWYgKGRwLT5pc19l
ZHApIHsNCiAgICBkaXNhYmxlX2lycSguLi4pOw0KICAgIGRwX2Rpc3BsYXlfaG9zdF9waHlfZXhp
dCguLi4pOw0KICAgIGRwX2Rpc3BsYXlfaG9zdF9kZWluaXQoLi4uKTsNCiAgfSBlbHNlDQogICAg
ICAgIElmIChyYyA9PSAtRU5PREVWKQ0KICAgICAgICAgICAgcmMgPSAwOw0KICByZXR1cm4gcmM7
DQoNCj4+ICsNCj4+ICsgICAgICAgZHAtPm5leHRfYnJpZGdlID0gZHBfcHJpdi0+cGFyc2VyLT5u
ZXh0X2JyaWRnZTsNCj4+ICsNCj4+ICsgICAgICAgcmV0dXJuIDA7DQo+PiArDQo+PiArZWRwX2Vy
cm9yOg0KPj4gKyAgICAgICBkaXNhYmxlX2lycShkcF9wcml2LT5pcnEpOw0KPj4gKyAgICAgICBk
cF9kaXNwbGF5X2hvc3RfcGh5X2V4aXQoZHBfcHJpdik7DQo+PiArICAgICAgIGRwX2Rpc3BsYXlf
aG9zdF9kZWluaXQoZHBfcHJpdik7DQo+PiArZXJyb3I6DQo+PiArICAgICAgIHJldHVybiByYzsN
Cj4+ICt9DQo+PiArDQo+PiAgaW50IG1zbV9kcF9tb2Rlc2V0X2luaXQoc3RydWN0IG1zbV9kcCAq
ZHBfZGlzcGxheSwgc3RydWN0IGRybV9kZXZpY2UNCj4qZGV2LA0KPj4gICAgICAgICAgICAgICAg
ICAgICAgICAgc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyKSAgew0KPg0KPldpdGggdGhlIGFi
b3ZlIGZpeGVzLCBJJ2QgYmUgaGFwcHkgZW5vdWdoIGZvciBteSBSZXZpZXdlZC1ieSB0YWcgd2l0
aCB0aGUNCj5leHBlY3RhdGlvbiB0aGF0IGNvbnRpbnVlZCB3b3JrIHdpbGwgaGFwcGVuIHRvIGNv
bnRpbnVlIGNsZWFuaW5nIHRoaXMgdXAuDQo+DQo+DQo+LURvdWcNCg==
