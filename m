Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DAA4F9B5F
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 19:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49F5910E4B4;
	Fri,  8 Apr 2022 17:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.142.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 264D010E0EC;
 Fri,  8 Apr 2022 17:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qti.qualcomm.com; i=@qti.qualcomm.com; q=dns/txt;
 s=qccesdkim1; t=1649437975; x=1650042775;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=leFdFo5LapAeT/iEoi3m8H/vxb43JSie8IGgsx0zhNA=;
 b=guZJ9wfIWeBkN70ND7chu86+JCrxCkQ0ZyTYbPh/jSfPVmjpIwXgNE/k
 1M9mirydgHhFwcWW9IPHtIqI4ZBsGSjd8UY1esUvB/PQWjRMV8RqQ+o/M
 0ydgoMNMcqwHT+6ud1Kj9cEa7ShBS6RaPlW4uO2c8yttOqlL9GRs1Vksf 8=;
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 17:12:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K9Ia5noWK8mGLoYWud9+W8sNn94UvTAjQfcEFZ3NTNGaW7RzyFpQJATnqNYOdWVjn+nYQCnyYLgr1asWE3tpLqJDR0LmAUUr/6p+jEJ0baMO4+oWOdHoHefJXDgPjzyq3BfbhF5GgCfMxkKfpU4S6SqHWNpejkDOG9jpns2ANi+1hWAgAp0+dGjvIbxAlubkwv1x684UEKh8Lwv/CBRR73L4nfNZ2JY+ucQEvr/IQazY/S5/JU7Qa7lIO/3DgGAwzQ5Swwki7+0TkFeM0k1HHTvp46o59EN/WrOFOjDDeaLqnUhlTbIki1rPvOec9bGbUjOgjHKVPGVO+4/Y6OYicw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=leFdFo5LapAeT/iEoi3m8H/vxb43JSie8IGgsx0zhNA=;
 b=IEr4o7AI5jf9SS39mUh31/7w7TCe+w3R4KBR1aBFOcZ5gB3oUqgUP3p29wRsksThlqUuSbci1QUMcyOxSiPU48aT4QX0G72GRVi4jo6Y1SPpXFSyQp5azXR71FdVumdfSiRQ8De+RByncijr7u4BVjdXeWmSEjx03+59U9XbzoUKnYFE7J6Q5O6QH2pC8K7FhIggNGjZON1gXiU99/oo+FkRmjhRWcxWAzlC2mkONCiCDFqKEAjO4vyXXbLPoDETDmexwhNvYJJp7yLexCIKewYMbWQLogesBoe7FtYcAEwVygZ3KC3vzSPOOhA4yTz19aRriQM43Ivq6s8sABMVCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6)
 by DM6PR02MB5786.namprd02.prod.outlook.com (2603:10b6:5:17d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 17:12:49 +0000
Received: from MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::9485:c59c:6877:f492]) by MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::9485:c59c:6877:f492%7]) with mapi id 15.20.5144.022; Fri, 8 Apr 2022
 17:12:49 +0000
From: Sankeerth Billakanti <sbillaka@qti.qualcomm.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, Doug Anderson
 <dianders@chromium.org>, "Sankeerth Billakanti (QUIC)"
 <quic_sbillaka@quicinc.com>
Subject: RE: [PATCH v6 5/8] drm/msm/dp: prevent multiple votes for dp resources
Thread-Topic: [PATCH v6 5/8] drm/msm/dp: prevent multiple votes for dp
 resources
Thread-Index: AQHYRE/GcQocYa4qfUa1ywd1Z9u6yKzaI+yAgAwbAgCAAA2g8A==
Date: Fri, 8 Apr 2022 17:12:49 +0000
Message-ID: <MW4PR02MB7186B3A2F8EDF388CA521498E1E99@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-6-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=Wn-XypjRcw-D0VtBHZbuTz=RHiMq6RCHCa=CWmZM42nQ@mail.gmail.com>
 <94da2c97-2ad2-4575-bd73-d66ad989e17b@linaro.org>
In-Reply-To: <94da2c97-2ad2-4575-bd73-d66ad989e17b@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b7dc4f4-105f-44f9-2acc-08da19830237
x-ms-traffictypediagnostic: DM6PR02MB5786:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <DM6PR02MB5786A3821A327BDEAAA84B3FE1E99@DM6PR02MB5786.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WCiZFg/SqOAtZ4f2hLqD+N2eWHCy1W3OphEFEaA19g9jlj06t12P9wefMJmrEuwgX77mUyX5zXLzIBaAPbCzm+mC7VQznD3ku8itftMg5L2fFIkg38J+560mOclyYhkOdULgHSnhLZPzTyitlfi3DM9zkWCZE0M66Y/hgSCCOeheHOaHXRSoHdM04gvwgrUwnOnkA8i5k5SablQHP16rAdXOT4nN2a9FpnMZQw04JehaUp+DgU2i2SFQaMThOzdrIZN3FM7U6j10KBE1zGRxQxto9SCSmW9/ZDs5Y50QuAuLsOsCnY7pZb7m6cKJ2j5Lc9e5wXflNnTlxNP+MNXCdLIrbo1a5ItuSkyGFcX3Gadksq40PpzL7exBJB+hUuRGBj9thdOHzhFI4xcyQKN6450HYCp3S2fXb5bacYi5AzXK2jrg/86drJb7miPhzkskqdnlgMRxnVTS1cub1JTD3o3aGKkzTSp/4vyp3PNZHsja1ZwU1QTjFJX5etaxbCg/XRx9c1MualdCtiuXBGh1kQ11FLlzzDeK/90YVp3hcKpJre9GqDaqsHjwgnO5LWlHII3iQcd19KX9qg/JqMNVjblEjHfhhlj0j6LbglGupyBwCVHi7IiXpFvWvFb81s32lUYgRyH9B4aHXLlw94nFJv2ZwT7tFu4LLdqW7EhkDaxd5nI6scI37g/CngcuwwFFgkJwzaQRai9/ojzyfTNjrQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR02MB7186.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7696005)(4326008)(8676002)(76116006)(38070700005)(66946007)(66556008)(66476007)(66446008)(508600001)(186003)(38100700002)(26005)(64756008)(110136005)(71200400001)(122000001)(53546011)(9686003)(6506007)(33656002)(55016003)(2906002)(5660300002)(7416002)(54906003)(86362001)(107886003)(52536014)(8936002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R1lHZXI4N3c5NFlybUJlZytaYXZBOS9LQkJPODJpaXdnY2M3bzBGSFV5YnZB?=
 =?utf-8?B?eFl0cmh6Y1dwRWxtSHJOR2dpZnpKaHFjR08ySjFETnJaL2h2WExYU1BpcDB6?=
 =?utf-8?B?VkJnKzNhK3Q1cmdDZThRTlVTRkFkRDhMRFJ4WG9OWFg4MHBISGhnVHEwdnNz?=
 =?utf-8?B?WXBveUJ4K0ljU04xQk56dkNNMUFlQkNkY3FSYk1iWS9WdnFtdlppdzFwTWlt?=
 =?utf-8?B?N3dqNEtrMDlCV0FPM2xZWm15by9adzRHVFZuSURkOVNRdVBGeG42dFN4SmYz?=
 =?utf-8?B?Ky85SmhNbm9Bcjc4WGM1SzVTMEN3MTRZYm5Bd1o2Mk5xbFcwc0ZLK1I3bkZI?=
 =?utf-8?B?ekVGN0xvU0cyTEVLMlRXTEh0ZXNnaUp2VWpxRTZSOW5VZHQ5a1FINnZ1TmtV?=
 =?utf-8?B?eDNNR3hPdVBKTGRueHdybWxvSzZIazVlcFZZa3BhbVhTV2tZRFNEVXJPU0Zl?=
 =?utf-8?B?MDVkclpoUEVicDhhNDhQRml2SFQ1WDhvYmZIUVFFM2ZjWFlLaXlqT09XODdp?=
 =?utf-8?B?U08zeDNpOW8zWTRwbFBNZ3c1a3lwa0taQjg4emwvV3lwNTl1TDNUWGpNeG53?=
 =?utf-8?B?S2hwMFUzaHRDdjAvT3JlVzltOXpUUE5VdkZmQTlER3hZd3ZhM1pXNkNLT0Jw?=
 =?utf-8?B?M2tvRGxjZHEycEJScGhIWlRMa0F4cTJmY3pJQzkxR2JZRDJyZitFR3EyK2pT?=
 =?utf-8?B?UEFweVZDZ3pCRVJLNUEwWlFNa3czZFZUc0pTMGl0U1FzOHlQa1V2VnRFNTJC?=
 =?utf-8?B?dlBUU2V4QkQvZ3BHTDZhU09oeVRlRHdwSXlCQk1ZekUxbjRxM1RUcDR5aXlO?=
 =?utf-8?B?SGpxeElvVFF0ZmZKVDJFR1Mxckx5dVVkaXJvRURkQXhFVkVaYXgxN1hoNm1o?=
 =?utf-8?B?NktNQTZQT2pKak52bHZoaWZ0b05NWVhCUkpNRTJhZ3ZVN1pBS1k4ZFNDQXNL?=
 =?utf-8?B?UDFSUDR2NTBqZGt1OWpHNnd1UmluUVFka29WRlJZNkgzazc1NXNDWVFKcmJ1?=
 =?utf-8?B?S1dWY2VLeGN6MEF2b1dSUjhmZ3p1a3BNZGpYWDhiZ0dGQ2YxeTZMMWVrSUxK?=
 =?utf-8?B?U0RjcWRsbjc4OWFHQWlPQ2lzdXBWUEdMQVVoTkxSMFFGdGlaZ2haVHJYYTNu?=
 =?utf-8?B?N2R1eGxJajJuZkhUczI5ZGpNaG1lUzhLSWFnemdmeFBDSHVYTHJ6b2x1c2FO?=
 =?utf-8?B?TUpzUUh3SHJSYXZsTjIrN1RhcHA2SlRjTHpveFdKdmdQdU1zVngwN3lOV1I4?=
 =?utf-8?B?dkFlZ2pxdDhBaXNKNjU1enRndlplMlhYWGRPTWQxNzlPUTl4a3R0TlZpTnJw?=
 =?utf-8?B?UWtvdnk0YzNhYlpLMVR1Ukh3Rmpkb3lGSDVKSmd0Y2ZBdERxVFFZS1JZSDNE?=
 =?utf-8?B?ZWM1OXlON1laRjU5RENEMXdZTUQycGl5MWI2MnVpSVN0ZitQT0lIemdZYjZ2?=
 =?utf-8?B?aXBWMGZXRFZaWURDMm8zWU12VUg0VmJIOUZvZ0N5QVRpUWdaazVXdWtaYkNO?=
 =?utf-8?B?OGdtR3BzN3orS1NqeHd6SmVvakEvUldNTTRTdjFRM1NPcGpJQlNrNDlpWHJL?=
 =?utf-8?B?TktIczJPbkt1QTkxYXJ1RVBzMkgxRXVERFE1YlhFSTFLcDE0Nkl2bVlNYmR2?=
 =?utf-8?B?ZG1NK1pLRHl3QjBHeUhKNWlOY0I0WDJsbTd6T29aNUsyTkVuQkRsKzUxTEd2?=
 =?utf-8?B?Q3NEMmVNY2lHd0FJVnFwQ2k1RSs4L2REc1FBaStHVDFVSDFUOTcrVXViVU1O?=
 =?utf-8?B?QitNT2FqWW16UEJxREU5Ry8rVkRSRG01UWdZK05TeW9xSkI3ZnlPalBjL2R5?=
 =?utf-8?B?NFJGK21YK0ZsNi9WS1FWZVV2aEdjTW1XWjFLK0tqdzBQdE1TUkpOR20zUXZI?=
 =?utf-8?B?RUJkYkFWbTJaL2t5bnB3WHRZdTBJb2didmxYbCtGTGVQSTdwT05CZmpybmpQ?=
 =?utf-8?B?QmxodnNkTGFxTEI3WmdTWHZ1bEZJazljTmgvenJzRkkrdUdCUTVBZmxVVE9D?=
 =?utf-8?B?VVBLWENNRzQ5L1VRelN3Y0JYVDVYNERxZmptRWFIMEk4RnZPRmZzNXFKYW5L?=
 =?utf-8?B?TG5Uc2FtdXdSelZFYmljNDhaSTlMcjRoNGlaR1NLbFl5S0VuL1h4K0pvSDRG?=
 =?utf-8?B?dW1IU1BaUVczTGdMbHdkN1kvVWkrcllqUWtGaHpoL1o4UkhUZCtlUFZmdW56?=
 =?utf-8?B?QmpkR1lLRW1UUzhtYkY3TElNeEtoclk3Q1ZqMWRuZExXeXdGWllSM2hNTk1a?=
 =?utf-8?B?WkUrL0FMbTZVdDNVUFdrdzg0d09HdkszUUt5L3MwNEFHRzIzNE1kakxQc2JH?=
 =?utf-8?B?YU9EZDFtc05hZlI5WTNTTVN3TzFGMmhRdHNOVWJKSURjYkRqS3JWclVPQndC?=
 =?utf-8?Q?2ZXse5PVnTs4WFLs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b7dc4f4-105f-44f9-2acc-08da19830237
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2022 17:12:49.3208 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XxwQuYpeyJVpwz+W5D8G0q4QwZEKuedBlfTtw+AnGNFoDUwkxbxucgPb79ruwbqiJJKY+qNt8tU+wBaUyqEtvNIyWKzY9P3lzWC9zA2dP8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5786
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
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiA+IE9uIFdlZCwgTWFyIDMwLCAyMDIyIGF0IDk6MDQgQU0gU2Fua2VlcnRoIEJpbGxha2FudGkN
Cj4gPiA8cXVpY19zYmlsbGFrYUBxdWljaW5jLmNvbT4gd3JvdGU6DQo+ID4+DQo+ID4+IFRoZSBh
dXhfYnVzIHN1cHBvcnQgd2l0aCB0aGUgZHBfZGlzcGxheSBkcml2ZXIgd2lsbCBlbmFibGUgdGhl
IGRwDQo+ID4+IHJlc291cmNlcyBkdXJpbmcgbXNtX2RwX21vZGVzZXRfaW5pdC4gVGhlIGhvc3Rf
aW5pdCBoYXMgdG8gcmV0dXJuDQo+ID4+IGVhcmx5IGlmIHRoZSBjb3JlIGlzIGFscmVhZHkgaW5p
dGlhbGl6ZWQgdG8gcHJldmVudCBwdXR0aW5nIGFuDQo+ID4+IGFkZGl0aW9uYWwgdm90ZSBmb3Ig
dGhlIGRwIGNvbnRyb2xsZXIgcmVzb3VyY2VzLg0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBT
YW5rZWVydGggQmlsbGFrYW50aSA8cXVpY19zYmlsbGFrYUBxdWljaW5jLmNvbT4NCj4gPj4gLS0t
DQo+ID4+ICAgZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9kaXNwbGF5LmMgfCAxMCArKysrKysr
KysrDQo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IEkn
bSBub3QgYSBodWdlIGZhbiBvZiB0aGlzIGJ1dCBJJ2xsIGxlYXZlIGl0IHVwIHRvIERtaXRyeS4g
SW4gZ2VuZXJhbA0KPiA+IGl0IGZlZWxzIGxpa2UgdGhlcmUgc2hvdWxkIGJlIF9hXyBwbGFjZSB0
aGF0IGVuYWJsZXMgdGhlc2UgcmVzb3VyY2VzLg0KPiA+IENoZWNrcyBsaWtlIHRoaXMgbWFrZSBp
dCBmZWVsIGxpa2Ugd2UganVzdCBzY2F0dGVyc2hvdCBlbmFibGluZw0KPiA+IHJlc291cmNlcyBp
biBhIGJ1bmNoIG9mIHJhbmRvbSBwbGFjZXMgaW5zdGVhZCBvZiBjb21pbmcgdXAgd2l0aCB0aGUN
Cj4gPiBkZXNpZ24gZm9yIGVuYWJsaW5nIHRoZW0gaW4gdGhlIHJpZ2h0IHBsYWNlLg0KPiANCj4g
SSdkIHByZWZlciB0byBzZWUgYSBjaGVjayBmb3IgZURQIGluIGRwX2Rpc3BsYXlfY29uZmlnX2hw
ZCgpLiBPciBldmVuIGJldHRlcg0KPiB0byBzZWUgdGhhdCB0aGlzIGZ1bmN0aW9uIGlzbid0IGNh
bGxlZCBmb3IgZURQIGF0IGFsbC4NCj4NCg0KVGhpcyBuZWVkcyB0byBiZSBjYWxsZWQgd2hlbiBl
RFAgaXMgbm90IHVzaW5nIHRoZSBhdXhfYnVzIHBhdGguIElmIHRoZSBlRFAgcGFuZWwgaXMNCmdp
dmVuIGFzIGEgc2VwYXJhdGUgcGFuZWwgZHJpdmVyLCB0aGVuIHRoZSByZXNvdXJjZXMgbmVlZCB0
byBiZSBlbmFibGVkIGhlcmUuDQoNCklmIHdlIGRvbid0IHdhbnQgdG8gc3VwcG9ydCBlRFAgd2l0
aG91dCBhdXhfYnVzLCB0aGVuIHdlIGNhbiBza2lwIHRoaXMgZnVuY3Rpb24uDQogDQo+ID4NCj4g
PiBJbiBhbnkgY2FzZSwgaWYgd2UgZG8gZW5kIHVwIGxhbmRpbmcgdGhpcyBwYXRjaCwgaXQgc3Vy
ZSBmZWVscyBsaWtlIGl0DQo+ID4gbmVlZHMgdG8gbW92ZSBlYXJsaWVyIGluIHRoZSBwYXRjaCBz
ZXJpZXMsIHJpZ2h0PyBUaGlzIHBhdGNoIHNob3VsZG4ndA0KPiA+IGh1cnQgZXZlbiB3aXRob3V0
IHRoZSBvdGhlciBwYXRjaGVzIGluIHRoZSBzZXJpZXMgYnV0IGlmIHlvdSBhcHBseSB0aGUNCj4g
PiBlYXJsaWVyIHBhdGNoZXMgaW4gdGhlIHNlcmllcyB3aXRob3V0IHRoaXMgb25lIHRoZW4geW91
J2xsIGhhdmUgYSBidWcsDQo+ID4gcmlnaHQ/IFRoYXQgbWVhbnMgdGhpcyBuZWVkcyB0byBjb21l
IGVhcmxpZXIuDQo+ID4NCj4gPiAtRG91Zw0KPiANCj4gDQo+IC0tDQo+IFdpdGggYmVzdCB3aXNo
ZXMNCj4gRG1pdHJ5DQoNClRoYW5rIHlvdSwNClNhbmtlZXJ0aA0K
