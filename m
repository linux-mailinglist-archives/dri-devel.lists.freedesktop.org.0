Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 812424F1552
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 14:56:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0752310F5CB;
	Mon,  4 Apr 2022 12:56:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.142.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83FBF10F5CB;
 Mon,  4 Apr 2022 12:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1649076998; x=1649681798;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nHoIgWxHWBrhLNwVPFcj3lJeBG5FRRCK/mwwmO808dU=;
 b=zsAEtLjp2k3kKJ44oAE+ktE9wDIae/tLBh9LXcxm7smFXhoRKhYdCtHm
 3CTCCWX73UZ0XFxHHQ0dtluuE5nT+Nhy87hTA4lWuNJJzVnHFHYKGb4d0
 kpXN7EG4ull30T+VyAOzyOmV15TV2kjaK3EknKil+6LyBRNAmobywe8Gd o=;
Received: from mail-bn7nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.106])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2022 12:56:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LHCbvWtsdNI6ZfUYT3cDg4brd3hfyGdG9+H7Xj3VS8/kAdfd0Q1x2HYkww2/RSI3ls901u9XN9MH+gFKknVTRGmNxSt7noWHdMdGdKW4Kyt/RwlT5BgvI2H4NuvuYsq8Hqb4sYkGiVYXE+TfHkqUthF4VuBOUjVqKOtnVNpAnseqADyLaqJJm+ZEKYPwrdMIVAtCOkYfcaJ7W9PhPEylmFxyJaCvTh4Nhzdk+DbrgCh7hUX98i2IhqsABEQLIrD+JLfR6+M2KWHpdp4AnO8sdrQTuDvAnjenPLAH3DWlXYE6F5Kod6POv7Q3BkkMhoAu00S8bOipjVq/V05IZltO+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nHoIgWxHWBrhLNwVPFcj3lJeBG5FRRCK/mwwmO808dU=;
 b=e/IlU/xtkiWFNc7tW+bFCzhSHmppsyopigfv008h3++bHE9YRMG6bPdbRrALbWoCh+9m/19IDt8337IXwOZ7CgjvKt/VMsHTjMIM9G0Yxo9i0mXi7HfnQuATMDtPL4X/+KT2Kod7ApkU9Fpqbm0ltKZmDrC50ANMAkAiDoQ8cCHW4OygRlLZxCwtTIkCAk1vPMv08zgGjsWHd6avOxAWLLH7jCWRaQmJmranlYBSkU4awXQWAlCCGq+hP/NQu3We6wVuOfSx7C5akmh+QpKpdD4HN86D+H1NUzHqZ3ecLqekatb0ew+DWdO750HG0LRdUip/yQWb6Pg5qg5orRAMLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6)
 by SN1PR02MB3694.namprd02.prod.outlook.com (2603:10b6:802:2c::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 12:56:33 +0000
Received: from MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::9485:c59c:6877:f492]) by MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::9485:c59c:6877:f492%6]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 12:56:33 +0000
From: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
To: Doug Anderson <dianders@chromium.org>, "Sankeerth Billakanti (QUIC)"
 <quic_sbillaka@quicinc.com>
Subject: RE: [PATCH v6 3/8] drm/msm/dp: Support only IRQ_HPD and REPLUG
 interrupts for eDP
Thread-Topic: [PATCH v6 3/8] drm/msm/dp: Support only IRQ_HPD and REPLUG
 interrupts for eDP
Thread-Index: AQHYRE+9Cw2uVhnbAEW7x0TCoIRCqqzaI9UAgAWaWhA=
Date: Mon, 4 Apr 2022 12:56:32 +0000
Message-ID: <MW4PR02MB71864A396097B9DB1E4032B3E1E59@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-4-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=X_ULva3J-Y7EF+0VPRRoFXSmtuKcXG9H=041Kmwa=W4A@mail.gmail.com>
In-Reply-To: <CAD=FV=X_ULva3J-Y7EF+0VPRRoFXSmtuKcXG9H=041Kmwa=W4A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 26288556-3843-4806-6738-08da163a8b7c
x-ms-traffictypediagnostic: SN1PR02MB3694:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <SN1PR02MB3694B9460A6683D6903BBA6C9DE59@SN1PR02MB3694.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1OSh3Regv2B6LeF2/sTgU68GDy/r4cIivjFJXZNEASgTHhC+KJlhLKaQstCUmuxXBxj2ff72bJkR6jOxuqJhMu32cA7OaFIGqx66tGDSQCtb8q6lPh+6ceGiIPwq2xGsfGI1tIi/EPDDt2U3PJpC/Z6FIzdPIoUoToKeqNN4EcPL+6c3THG5rQDIGjS5EJaKrVk/Ctf+gTogox+kOo/FjvX7sn4Xn3Ij8O6FzsLZKL4F4X/+wnAYbn77kZap+17nMh+TKNOXvz/hYQF7RYlfU5o0x5RSAXyIBqyc98PEfdb1WO7Rfei9b+N86feGJ4YTGz+XSzmbQuedo7LBInfgv+Jr28JElNXV5Q7W0RXz0K4NiWiNfz+wEG8FmX/VkT9e193xUo+MMQf3P7KAaR80fUvqxvvkwieKQbv8NojNnb1KD7Xw9Zb923B7bUaHrkFk1vnokfMG6R4YLCaRipUlCBZQQqtV/lXJcmkt8scv6Zql2cVJxmX+qRwwXakveSQeuUfQIl8OORH7ykt9Eq6zWjQIWzREqBtcjWHE3rny7yMcEkn7FvNSN4Tp7uqwEMl82//3V/H9MrmfAlppT2sc1cjJks4upVz40F+MxRITQKAmcGftF6ZH9jmP470XjrOST6HHOm2X6BIZPlYkCCT0e8ax0ZODjW8ZIO2tDYXGKR76gMS4+bY47d/Eu1R1a/VIOtBMhBTy7U+gOO/4Zcsyhw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR02MB7186.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(76116006)(2906002)(66476007)(66946007)(66556008)(64756008)(66446008)(5660300002)(7416002)(52536014)(86362001)(7696005)(6506007)(186003)(53546011)(508600001)(4326008)(8676002)(26005)(33656002)(9686003)(107886003)(8936002)(83380400001)(110136005)(54906003)(122000001)(38070700005)(71200400001)(38100700002)(316002)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aDRHV3hJS0MyNFFmeHpaVDNkY0lTb3o3RUpKN0NCNS95MzJ6SnBPL2ZWTVFW?=
 =?utf-8?B?Y1FQeDBjZHJXYmRHa1dSVDBCU3ZyN1pQYUNHbW9Kak1YSlo5cWM5TlNUMENi?=
 =?utf-8?B?OVVtaSsxeWt6dlc5Zy9QQW5xV1IvRjhVWnlPaDd2TXFieHNFOE80VjZMekk2?=
 =?utf-8?B?QVhvQ09KY1ZKbFRZRlVWbDdXQ2x4Q0JiTkV4SmEwUEZTM3ZoZ1NLRDFMT2ti?=
 =?utf-8?B?VUVaVlJ1SmUrQ1ZsZFMva2ZyY0xiZ0l0bVA3cWpCZ0FxU1JBSHZmVi91Nmdv?=
 =?utf-8?B?WHVxdVI4dENJSTNhVVZZUjlpdHQ2UW9qT2tLM2dPTnE1VzFsUEllSFpZNDhH?=
 =?utf-8?B?bGpqWjQ0TGI2VTdqdVdlRXpCUXZZQVRMd09CVmtFbjdGbFJjSXlhcmhCQXRG?=
 =?utf-8?B?V1ZwYU1rR3QxVmZSY0JUdHVpWnk3ZEd4eDdFaTZLRTVkVDVjZ3dRT1hwbVRH?=
 =?utf-8?B?c0xkaldFTDFQVXlOS25GSzZZbjcwS015cWp3ODJVNlFYbnBXMi85ODdzeDBl?=
 =?utf-8?B?L3V2M3hmWXFGS1h3UWFLYzRQUzNUdFI0REtDdkpUYU5PekNsbkRNazhIckpU?=
 =?utf-8?B?OTdWWlpqUU00aHhXTm02K3RZQUNML0Q1cnljemt0eUJYaUh6OVRjWkN5YmNy?=
 =?utf-8?B?ZlFuOU9qdENYSVNYa1JjSG54dExLRitVb0h3TkFJRDRUVlFNT3kwdkZ0V1d0?=
 =?utf-8?B?Y09lNkNYc051L2FoWFBXeVUyYnl2bHF0RjhsY2RUQTBSMlJ6VVBZanpKbEdi?=
 =?utf-8?B?Lyt2d2RtaUdNVy82ODdRcGM0aTlrZnBTazJMaWxnbG9yTExGemlOQTRmeVhQ?=
 =?utf-8?B?SjFkTWdWSU0zdTNPWlMxNzUra2RnaHdRdkorc2ZNVnlBcHdzNEFoU0FqRDlq?=
 =?utf-8?B?V3MrZGwxYXpwblBBVWMvYVhvaU5pRDBZZ21VbHFPZ1R2RERwVFFxNjRVZ2xx?=
 =?utf-8?B?S2VGd1VKeENHdVVCRjBTUFBFL3VaSERTUTcrT1NSaG1kVDFUTUNGTTE5MW1w?=
 =?utf-8?B?NGxsdjhKdUNyWmpJOWpZTG5LZk8rNlZMY2RZMWlqL2tsMkxQQ0xNTGJqditt?=
 =?utf-8?B?a2tRTWVVMEs2S2JUamtOUXFvWDBSaDBJeXpiTWRjZG1mNHBHZXVVVFUraG80?=
 =?utf-8?B?cUNNNnJLdDVEVkhsanlLcEJQZ1grTDVubEx2Q0wyNzZoZEcxa0tQampwdTZy?=
 =?utf-8?B?WVhhd0FyZU5BNjBLUXdyY0Jmc1E4bWpZckVzSXRteXpxbDZsSmhZR2dyMFls?=
 =?utf-8?B?K2Noa2t6bi9heWwwR1RVUU4vdS9MbWNjWkFNWlZEaURzUWhEYVd1UUdRcUZH?=
 =?utf-8?B?UTlRbUZWY04wcEpPMk1PUGdMNVNueGZ6US9TVDA1UmloTXpyeUVCOWkweTls?=
 =?utf-8?B?dm16VnJnZS96bEIvTU1meS9KRzRDaDdNeFZVbmlsaFYxdVVvdmNSTnVvSFRM?=
 =?utf-8?B?eGpmU3k0L2h0Q3pDaWFLOFpRejFxNlZheitWamZkU1BlL3NLM0RwRHBwb01t?=
 =?utf-8?B?WXY3bWEySlBjWnhVeFdMalFncnRNa1lxVWJMczBzODlhNGZuYmpKM2VOWURM?=
 =?utf-8?B?K2V4bjNYYXZOcGN4aFdJSmlqdUdJQnJLKzRLeUNQQytyUGRqMTEvc3pxSjY1?=
 =?utf-8?B?RGZJSFJ3aTFaUENaTVhzbkhjcFhndGV5Ykp5ZE9IY1Z1UnUyVWlEQUNhNTgv?=
 =?utf-8?B?OStrdzVxaVV0UVNrVnFFM0FsM0RsZ05JT0NRWUdDSm80V1M0eEEvRXRmVUpP?=
 =?utf-8?B?b3ZlcnRFWFFXU0xlYW5ZYUpFZjZidWtHUFZOL09ReHBkTllnQkZVTUZibXJn?=
 =?utf-8?B?Mmk2YUNyK1lNSzVaTU5YQXdaejFQMVJ0YXNrVXY0WFJ0YmtldUdEa2dEdXda?=
 =?utf-8?B?L0NvdG5KclhFUzZuY1dBWXNwYmkzaTJuNkFxa0ZFSCtKUnE5bzZ3Mjh4Y0Ri?=
 =?utf-8?B?Vm9DRmFnTlpYWFpUNmpxQVptOXFEU1ROMXhNQ1hPS252Z1doT3kxWHl5RHVX?=
 =?utf-8?B?ZkhWY0FyQ0xHZlJXRFlkWDJEWHBFSWlVWnI3dGZUblp3dllsbUYrVXF5bE9u?=
 =?utf-8?B?VThtNzN0ODV4NVdyYTR6WWROWEZmSDJRYk1VMlBOTEw2UzA3OXd5VnUrUG1M?=
 =?utf-8?B?THJRaHdEWDJXVmhjZ3R6dDZ4Z1hVMlhsWDFJVDNjRFU5RlpvMEpLTnhERVl1?=
 =?utf-8?B?ZWZYRCsvaXZEYm5oWVZLY1FnT0w4YTNYYVVQVTJQdjlsWU1HemxMRXAxUnQw?=
 =?utf-8?B?a1VrUlJPUDBmQ0g2Qm5KY2dxMGFJYTI0cEFOU2IydXdoQnMwSGVqOFo0aFZn?=
 =?utf-8?B?eWhoY1ZuNVZaR0hTcy9IWWdSQjBSdUcrMk50MjE5QjhWUzVUcUxKdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26288556-3843-4806-6738-08da163a8b7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2022 12:56:32.9196 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OqcQiYLcs61RxHRDNi6eV48LJMsQDPQC1ZM3stX0w+wADByszb7sl/mH1nKtU0hB6KJIFkxc0h86Ma1RyKP02WKLwnrrWYDPyPZ9nZKmEMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB3694
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
IEBAIC0xMzc0LDYgKzEzODIsMTIgQEAgc3RhdGljIGludCBkcF9wbV9yZXN1bWUoc3RydWN0IGRl
dmljZSAqZGV2KQ0KPiA+ICAgICAgICAgZHBfY2F0YWxvZ19jdHJsX2hwZF9jb25maWcoZHAtPmNh
dGFsb2cpOw0KPiA+DQo+ID4NCj4gPiArICAgICAgIGlmIChkcC0+ZHBfZGlzcGxheS5jb25uZWN0
b3JfdHlwZSA9PQ0KPiBEUk1fTU9ERV9DT05ORUNUT1JfRGlzcGxheVBvcnQpDQo+ID4gKyAgICAg
ICAgICAgICAgIGRwX2NhdGFsb2dfaHBkX2NvbmZpZ19pbnRyKGRwLT5jYXRhbG9nLA0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRFBfRFBfSFBEX1BMVUdfSU5UX01BU0sgfA0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRFBfRFBfSFBEX1VOUExVR19JTlRf
TUFTSywNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRydWUpOw0KPiA+ICsN
Cj4gDQo+IG5pdDogd2h5IGFyZSB0aGVyZSB0d28gYmxhbmsgbGluZXMgYWJvdmU/DQo+IA0KPg0K
DQpXaWxsIHJlbW92ZSBhIGJsYW5rIGxpbmUuDQogDQo+ID4gQEAgLTE2MzksNiArMTY1Myw5IEBA
IHZvaWQgZHBfYnJpZGdlX2VuYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZQ0KPiAqZHJtX2JyaWRnZSkN
Cj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuOw0KPiA+ICAgICAgICAgfQ0KPiA+DQo+ID4gKyAg
ICAgICBpZiAoZHAtPmNvbm5lY3Rvcl90eXBlID09IERSTV9NT0RFX0NPTk5FQ1RPUl9lRFApDQo+
ID4gKyAgICAgICAgICAgICAgIGRwX2hwZF9wbHVnX2hhbmRsZShkcF9kaXNwbGF5LCAwKTsNCj4g
PiArDQo+IA0KPiBTaG91bGQgeW91IGFkZCBhICJwcmVfZW5hYmxlIiBhbmQgZG8gaXQgdGhlcmU/
IFRoYXQgd291bGQgbWFrZSBpdCBtb3JlDQo+IHN5bW1ldHJpYyB3aXRoIHRoZSBmYWN0IHRoYXQg
eW91IGhhdmUgdGhlIGNvdW50ZXJ0cGFydCBpbiAicG9zdF9kaXNhYmxlIi4NCj4NCg0KV2Ugd2Fu
dCB0byBoYW5kbGUgdGhlIHNjcmVlbiBvZmYgb3IgZURQIGRpc2FibGUgbGlrZSBhIGNhYmxlIHVu
cGx1ZyBzbyB0aGF0IGl0IGNhbiBiZSBpbnRlZ3JhdGVkIGludG8gdGhlIGRwIGNvZGUuDQpTbywg
d2UgY2FuIG1vdmUgcGx1Z19oYW5kbGUgaW50byBwcmVfZW5hYmxlIGFuZCB0aGUgdW5wbHVnX2hh
bmRsZSB0byBwcmVfZGlzYWJsZS4NCg0KSWYgd2UgZG8gdW5wbHVnIGluIHBvc3RfZGlzYWJsZSwg
d2UgbmVlZCB0byBoYW5kbGUgdGhlIHN0YXRlIGNoYW5nZXMgYWxzby4gSXQgd2lsbCBjb21wbGlj
YXRlIHRoZSBkcml2ZXIgY29kZS4NCg0KPiANCj4gT3ZlcmFsbDogSSdtIHByb2JhYmx5IG5vdCBm
YW1pbGlhciBlbm91Z2ggd2l0aCB0aGlzIGNvZGUgdG8gZ2l2ZSBpdCBhIGZ1bGwNCj4gcmV2aWV3
LiBJJ20gaG9waW5nIHRoYXQgRG1pdHJ5IGtub3dzIGl0IHdlbGwgZW5vdWdoLi4uIDstKQ0KPiAN
Cj4gDQo+IC1Eb3VnDQoNClRoYW5rIHlvdSwNClNhbmtlZXJ0aA0K
