Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0AD4CB918
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 09:33:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B233210EF3D;
	Thu,  3 Mar 2022 08:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Thu, 03 Mar 2022 08:28:21 UTC
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.140.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4823910EDAA;
 Thu,  3 Mar 2022 08:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qti.qualcomm.com; i=@qti.qualcomm.com; q=dns/txt;
 s=qccesdkim1; t=1646296101; x=1646900901;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jrBufxSFikkVT1Rh/bmitsiztA5eL8AP5G1Fa32fvtw=;
 b=B0eGNhGF22fujGU6Ce5LAfbNyNINe6Zd/D6RvMyA8gIqA6cRyCKTaCn0
 VA/20eK/Tb2VBDnnOP1GnLo4W+69Kib0E4fY8hGl5Jps/s1CYtzXQpzxv
 uHKs7BAlk14SvNnxPJb3cSdPrpCq3th4xIz8uOW1VOsKrMNlAIvdQ5NdT w=;
Received: from mail-bn8nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.173])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 08:21:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IkHlGQlc9zH0r4ANX85Nw9sBeqYyZY+UwfNTKUIXdnn1nQ+vnu9uzKZNKx3T3QmT0KuLc3Vi8lHH1wWuTDqitq65iC4nTC/sm7tEZejGtYoBKezFCuQCOgDhcoPUh4ulpCgFMBknwWXTF2qFNTPAzwcHa8KKLgNNRWR0oHhGQwQ1lHalfreMLkt6LFee9KQNay8Cpvv8DHo16VUgrWPFLzG2J3CsDPTT96D6TXIpXMqUPqQBdB2yUYFq9bMcwuZXRbUNCBEtg7m3EfbPt67KePVzYtyDsQDZ/+wr8S+K1euBqzoyF1QGhvdFALKbemSIefYjJAKUOoAQ5MI5Q4pNpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jrBufxSFikkVT1Rh/bmitsiztA5eL8AP5G1Fa32fvtw=;
 b=dcYbdzKVC1GZZBXHLtJxAt4nh9mtwMxVKi1wE+PlvlDMX+f03uRt3VzCpc2zaBmcSy9kHuiLzAHBhXYYr4zyjiHGLCcQ+rubBFOQWU8hlVcGc64rx+WzJ6dkhFDxIW0vmPKT0kX9ka7Y8OgFwgjIUqjX7Xbke4gyat3A9hR++inwW4I7drCV5KcCk//bhKTv3PYEnsTBb/e21VeCBppaInmh2/lULcQIlWKccEs4H8ph3oiHZwzkgdmpVMfT6N7l2TrzR9jeP7vpS4fnuV/JzdNRxz8VetVtHVOMY0X+jLg/id6it1KAC2Hhm9GNKpYcF/k6adEdjlLEhKSQPI4xsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB8173.namprd02.prod.outlook.com (2603:10b6:408:163::15)
 by MN2PR02MB6719.namprd02.prod.outlook.com (2603:10b6:208:1d8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 08:21:10 +0000
Received: from BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::198b:e44b:f8af:4635]) by BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::198b:e44b:f8af:4635%7]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 08:21:09 +0000
From: Vinod Polimera <vpolimer@qti.qualcomm.com>
To: Stephen Boyd <swboyd@chromium.org>, quic_vpolimer
 <quic_vpolimer@quicinc.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "freedreno@lists.freedesktop.org"
 <freedreno@lists.freedesktop.org>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] drm/msm/disp/dpu1: set mdp clk to the maximum
 frequency in opp table
Thread-Topic: [PATCH v2 2/2] drm/msm/disp/dpu1: set mdp clk to the maximum
 frequency in opp table
Thread-Index: AQHYKmCHyhoJeYdypkedphVKgE7RHaykkcsAgAjH2RA=
Date: Thu, 3 Mar 2022 08:21:09 +0000
Message-ID: <BN0PR02MB817330180F35E6134CD15725E4049@BN0PR02MB8173.namprd02.prod.outlook.com>
References: <1645804670-21898-1-git-send-email-quic_vpolimer@quicinc.com>
 <1645804670-21898-3-git-send-email-quic_vpolimer@quicinc.com>
 <CAE-0n50q4WitTP-dBUwGAWkkF+_hisCHQLntRf7MOi=KSyxQpQ@mail.gmail.com>
In-Reply-To: <CAE-0n50q4WitTP-dBUwGAWkkF+_hisCHQLntRf7MOi=KSyxQpQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8a7d8a2d-79cc-4351-f07f-08d9fceec5bc
x-ms-traffictypediagnostic: MN2PR02MB6719:EE_
x-microsoft-antispam-prvs: <MN2PR02MB671974C491F0FDC106C5573FE4049@MN2PR02MB6719.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t51yRFiRoBNOyfJGRg1pTDt0Y1Z92Lg0FlZhcm4bOBHiy4ZVSDlaNWqa1+2PPkzSfuXdx+JkBKvAjIj1zqbcqmvM8vvz3PirksQ6afO7Rs+QOdOrWbWF2wHya+iYN3J6/uinyC1jm1c7McXub6bl5mmWsGoHexO/lmiUVmwn0frEz7S2KMR7m2crGtdO4BMlywfOeqlOJljgDhu+PsZFEpEQUL2YkQRaYzGunPvBEok+jd5xBLI+1jmrEs9D0WANffShCjI98+V+vxwV0ubppZ5Al47u/1ITJrQDcEC6a78f20Wb/tjL6PRwY/s1kqnJyEc6CsAf505Zcmmgc2dwydicar5B+0Zu+HlxoDXSW65VTFBUrat1ixRrMuLj4f+MTGnsHUacNdJFgXRKZuSKjbvaYwROt8jQy136EN3MqxJ65jgvUQq/iYfvvmSHEQKr2Y40E8oyMVivBOsrHkqmujl9VsPJ9qCw4tiZCOVcZzwHhv3+KXX+aafd3xZaNppuYNzJrAWpVRXTjhEke5jCmHwTOzo7G+Pvkdm6Pb5py5MjsbrBC7S1D+lcx7CATm9L9Ko4X22RLw3c961rGBVgdB8N2LN4RzlpT1dpjR4xw+nsC2AFtALw5JIDxGFCnTVaprLi8bQ1jBXe5gOuScLR/3BSaugcl387C6ME+9OqTVy6vzs+F/5lMEvvikGspaDgUYyOXHU2NjLf+YLhCBpIfA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR02MB8173.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(64756008)(316002)(54906003)(5660300002)(52536014)(110136005)(83380400001)(66946007)(66446008)(66476007)(66556008)(76116006)(4326008)(8676002)(122000001)(186003)(8936002)(26005)(508600001)(2906002)(6506007)(107886003)(53546011)(9686003)(7696005)(71200400001)(55016003)(33656002)(38100700002)(38070700005)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NWtsK2NSSUtFdlU2a1IwSEhGNnZIbG9kSE5CSk12UWVtY3lMcnZCWVBxUWpH?=
 =?utf-8?B?aHBwelMwVzliRzlNV2JzY2ZvdmFaOWxlZWc1czFyUnFFVit4ZU1LVjhHZWRC?=
 =?utf-8?B?OTdhek5BVjZXSnBHL2YxbjV0UTJraWtBMlBvRVlmdTF5N2ZPSG1UYXYzbFNR?=
 =?utf-8?B?ZE12OTA3ajFKV2twOGdEeTlYa3c5ZVFiNVUvUDZtUlB3ZEkzSk92NjB4aFZW?=
 =?utf-8?B?UVlCOU02OExYWk8yMFVaMUxWTjMwOVBCOGExU2xpT3QxWW1yVmsvcDM3MlFo?=
 =?utf-8?B?ZHgxQk8wMWVGSkI4WDJ1MDdZYlNUa004MFZhZ0J4Z1ZtRTNpWUpoTzBKanJ6?=
 =?utf-8?B?MzZUN2c5TFZaVTlKVitNUWQ2Rk1qSEpxMzJYekV3S0ovZksxbXRxYzRNYTlx?=
 =?utf-8?B?UUNYNklKME5SN0s2ODB4TWR5K29HSGVlTXl0N29QRC8xUitaTEgwOXJaaWlz?=
 =?utf-8?B?YTNSa3cyRHdlVVVzZUppTjVqa09hZTZpSDY1WUVwV01BazRZU3lTSlI0aSt3?=
 =?utf-8?B?aytjeGZtL3NGZHpYd3Jpd2xudExMV3VyUUY1V3JrNjNRR0k0TTAzaUZHL1dh?=
 =?utf-8?B?V0VYNFl1di9zb2ZEaTVGNFY5OEY4QUxLWVVvVzBXV3lJK3QyaFhKZXVBRTRB?=
 =?utf-8?B?K2MxNlhZdDVaS2oyVk1lcml5VmcrbXNFQk1HVUZ1RVE2d1hiSW1ROXVsdGd1?=
 =?utf-8?B?Ky8zeUFaYVhVSXl0d3NTNkFxc2EvUTFrVTFJU2ViL3NJNVYycVMvMGpFZzBH?=
 =?utf-8?B?VjRLbldzdGo3MmNreks2Z1Bia091c1ByMmZCbmRKRUlINjJJeC9oY01wSWFp?=
 =?utf-8?B?ZitEQ2JKZnNlSHVad0l3UEU2L3RyZ0ZnL05Oc3FDYUtGOThqWUp6YXJFT2dk?=
 =?utf-8?B?NXd2bEdGemt2RnlCQTcyVDFqNkZRTk12S1k3SVBqZnNiRXJKM2VQMWhNNk8v?=
 =?utf-8?B?NVN0RFdsa0M4clRoaTVVMUlRMnl5VU1TTVZuSUhKeFkzeHJET3pIV3h5WWtj?=
 =?utf-8?B?TGkxNTdTNkMrR21vUExYUG12Qno3QVFaVnNSSEVUaEdHY0hpYkhORlYrYlZK?=
 =?utf-8?B?aVcxQm52b2t4SEkzd094eHZ2Yzc5eVJ6ZTFKcE05ZlI0MGpqTnFiamo5cEV1?=
 =?utf-8?B?RUoyR2dpL0JES2FqNnkrMyt1Q0NjaFJyYjlYREJzUlJyUkxRbXVUTFhvSmg3?=
 =?utf-8?B?bDJJMHBxbDhBL1B2TUg1N20rRU1jTjJMdzFIb3p0QmJKNFdyYm1IRDlxTFM1?=
 =?utf-8?B?UmFMK2NubU90SWl0cVdiSlQrb0k1dkU5SEIwaUwrR3p1NExDemZGRWVRWVQy?=
 =?utf-8?B?YTk4MmVNMWNveW1CL09scm5vcG1EZzZRcVo3cXozeDh5T2UveThVRHg0eVlH?=
 =?utf-8?B?eE90bTZ3OHJlQWwrSDNtQlBUTUdSblN5MHFwbWJZUDV3RGFCVlhTaDVJN0Fs?=
 =?utf-8?B?eUtOM0hIQXBsb0JwbUtXOG9zK0ZONWNFL2JnR2sydVd3S3hxMHRrcDZJSUJw?=
 =?utf-8?B?ZlJxY2VpcVhSMGRhRUdManY3eDRLbHl5VkNVQnFtRmJBMTc1NTJjb1h6bUQ0?=
 =?utf-8?B?SElJYTdSVDdKMDBsTDlqYjNwTW9YMDRZWWJHaW9yOFdERW9KSksrcU15aWhR?=
 =?utf-8?B?ZmQwK2pMbmxFb0E3RExuczAyRGNRRDcreThIZnVvUXpITldBOFMwRUFGR0hY?=
 =?utf-8?B?SElIZUNQNzhySjFkUFpxM2VRbVQrWmVYZjBHN2VBWXZmSlcxcUJFK3ozZ0M3?=
 =?utf-8?B?c3FtU1dOc1FmZGFQdUdLUFpadk9lWGxkVUtLNEY1UE1NWmFpbkZIZUhWNWpj?=
 =?utf-8?B?NHU5bGZjNkV1T3B4d0Z5VnhuZHFYTUhUaUdReTJuZVFjellmNGxhSVFTN3gw?=
 =?utf-8?B?d1hpRTU5amlkMThkYzA5WTQ4aEhLNGNWWHFPMnVHOUxZaEhrOXRqd291L1Q2?=
 =?utf-8?B?Y1ZaQzNnb0ZiZHUycm1TTG9QajZLaHB3ZC9lUHJLVjdYRzMyT2srY25ydUdi?=
 =?utf-8?B?d2FFeDZtQldyU1g1UTVET010RkFRamszQUIrYTh6VVpyWGZHL3I4UzJpMHFq?=
 =?utf-8?B?TXN4QnJTYjdDUkdwcmsvcG5TVkpQWUZhQ3FMV0tndFVON3hpMFR2ODk2elBX?=
 =?utf-8?B?c1oxVW5YQjd6bW1jMmV3emg2R1pjd0tMVTlVRVFCWlg3VTRrb0VBWkNRUng4?=
 =?utf-8?B?aUppeVlmZjl5dUU2UVEyV01STGNNSjdteE1lTDNUSFRYSWtZQWpKQnpsT3lI?=
 =?utf-8?B?ajAxNCs5ZzBJWUsxaE4rWjVqK3dnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8173.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a7d8a2d-79cc-4351-f07f-08d9fceec5bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2022 08:21:09.8295 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZyTQD1xs3LbPP4palaRnS7Nb1e2srowuS5hGS7zkL9g81RhFP+LvFaBtDx2sBGr/MD41CG/wF6DI7uwkY4/ktFNfHDeCww9dtDJnO0f0M38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6719
X-Mailman-Approved-At: Thu, 03 Mar 2022 08:33:09 +0000
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dianders@chromium.org" <dianders@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3RlcGhlbiBCb3lkIDxz
d2JveWRAY2hyb21pdW0ub3JnPg0KPiBTZW50OiBGcmlkYXksIEZlYnJ1YXJ5IDI1LCAyMDIyIDEx
OjQzIFBNDQo+IFRvOiBxdWljX3Zwb2xpbWVyIDxxdWljX3Zwb2xpbWVyQHF1aWNpbmMuY29tPjsN
Cj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmc7DQo+IGZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbnV4LWFybS1tc21A
dmdlci5rZXJuZWwub3JnDQo+IENjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyByb2Jk
Y2xhcmtAZ21haWwuY29tOw0KPiBkaWFuZGVyc0BjaHJvbWl1bS5vcmc7IHF1aWNfa2FseWFudCA8
cXVpY19rYWx5YW50QHF1aWNpbmMuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDIvMl0g
ZHJtL21zbS9kaXNwL2RwdTE6IHNldCBtZHAgY2xrIHRvIHRoZQ0KPiBtYXhpbXVtIGZyZXF1ZW5j
eSBpbiBvcHAgdGFibGUNCj4gDQo+IFdBUk5JTkc6IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9t
IG91dHNpZGUgb2YgUXVhbGNvbW0uIFBsZWFzZSBiZSB3YXJ5DQo+IG9mIGFueSBsaW5rcyBvciBh
dHRhY2htZW50cywgYW5kIGRvIG5vdCBlbmFibGUgbWFjcm9zLg0KPiANCj4gUXVvdGluZyBWaW5v
ZCBQb2xpbWVyYSAoMjAyMi0wMi0yNSAwNzo1Nzo1MCkNCj4gPiB1c2UgbWF4IGNsb2NrIGR1cmlu
ZyByZXN1bWUgc2VxdWVuY2UgZnJvbSB0aGUgb3BwIHRhYmxlLg0KPiANCj4gcy91c2UvVXNlLw0K
PiANCj4gPiBUaGUgY2xvY2sgd2lsbCBiZSBzY2FsZWQgZG93biB3aGVuIGZyYW1ld29yayBzZW5k
cyBhbiB1cGRhdGUuDQo+ID4NCj4gPiBGaXhlczogNjJmYmRjZTkxKCJhcm02NDogZHRzOiBxY29t
OiBzYzcyODA6IGFkZCBkaXNwbGF5IGR0IG5vZGVzIikNCj4gDQo+IFByZXN1bWFibHkgdGhpcyBp
cyB0aGUgd3JvbmcgZml4ZXMgdGFnLCBzZWUgYmVsb3cuDQo+IA0KPiA+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogVmlub2QgUG9saW1lcmEgPHF1aWNfdnBvbGltZXJAcXVpY2luYy5jb20+DQo+ID4gLS0t
DQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuYyB8IDMgKysrDQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfa21zLmMNCj4gPiBiL2RyaXZlcnMv
Z3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuYw0KPiA+IGluZGV4IGQ1NTBmOTAuLjMyODhm
NTIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2tt
cy5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jDQo+
ID4gQEAgLTEzMTksNiArMTMxOSw3IEBAIHN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQNCj4gZHB1
X3J1bnRpbWVfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gPiAgICAgICAgIHN0cnVjdCBk
cm1fZGV2aWNlICpkZGV2Ow0KPiA+ICAgICAgICAgc3RydWN0IGRzc19tb2R1bGVfcG93ZXIgKm1w
ID0gJmRwdV9rbXMtPm1wOw0KPiA+ICAgICAgICAgaW50IGk7DQo+ID4gKyAgICAgICB1bnNpZ25l
ZCBsb25nIG1heF9mcmVxID0gVUxPTkdfTUFYOw0KPiA+DQo+ID4gICAgICAgICBkZGV2ID0gZHB1
X2ttcy0+ZGV2Ow0KPiA+DQo+ID4gQEAgLTEzMzMsNiArMTMzNCw4IEBAIHN0YXRpYyBpbnQgX19t
YXliZV91bnVzZWQNCj4gZHB1X3J1bnRpbWVfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikNCj4g
PiAgICAgICAgICAgICAgICAgcmV0dXJuIHJjOw0KPiA+ICAgICAgICAgfQ0KPiA+DQo+ID4gKyAg
ICAgICBkZXZfcG1fb3BwX2ZpbmRfZnJlcV9mbG9vcihkZXYsICZtYXhfZnJlcSk7DQo+IA0KPiBU
aGlzIGlzbid0IGV4YWN0bHkgYSBjaGVhcCB0aGluZyB0byBkbyBldmVyeSBydW50aW1lIHJlc3Vt
ZS4gUGxlYXNlIGdldCB0aGUNCj4gbWF4IGZyZXF1ZW5jeSBkdXJpbmcgcHJvYmUgYW5kIHN0YXNo
IGl0IHNvbWV3aGVyZSB0byBhdm9pZCBtYWtpbmcgdGhpcyBjYWxsDQo+IG92ZXIgYW5kIG92ZXIg
YWdhaW4uDQo+IA0KPiA+ICsgICAgICAgZGV2X3BtX29wcF9zZXRfcmF0ZShkZXYsIG1heF9mcmVx
KTsNCj4gDQo+IFRoaXMgaXMgZW50aXJlbHkgbmV3LiBUaGUgYXNzaWduZWQgY2xvY2sgcmF0ZXMg
ZnJvbSBEVCBhcmVuJ3Qgc2V0IGR1cmluZw0KPiBydW50aW1lIHJlc3VtZSwgb25seSBkdXJpbmcg
ZGV2aWNlIHByb2JlLiBNeSBxdWVzdGlvbiBpcywgaWYgdGhpcyBpcyBuZWVkZWQNCj4gbm93IHRo
ZW4gZG9lcyBpdCBtZWFuIHdlJ3ZlIGJlZW4gcnVubmluZyB0aGUgY2xrIGF0IGxvdyBzcGVlZCBh
ZnRlciB0aGUNCj4gZmlyc3QgcnVudGltZSBzdXNwZW5kIGFuZCBuZXZlciBiZWVuIHB1c2hpbmcg
aXQgYmFjayB1cCBhZ2Fpbj8NCm1kcCBjbG9jayByYXRlIGlzIHNldCBiYXNlZCBvbiB0aGUgY2Fs
Y3VsYXRlZCB2YWx1ZSBmb3IgZWFjaCB1cGRhdGUgYW5kIGRvZXMgbm90IHJlcXVpcmUgdG8NCnNl
dCB0aGUgY2xvY2sgdG8gbWF4IHZhbHVlIGluIG9wcCB0YWJsZS4gU28sIGRyb3BwaW5nIHRoaXMg
cGF0Y2guDQo+IA0KPiA+ICAgICAgICAgZHB1X3ZiaWZfaW5pdF9tZW10eXBlcyhkcHVfa21zKTsN
Cj4gPg0KPiA+ICAgICAgICAgZHJtX2Zvcl9lYWNoX2VuY29kZXIoZW5jb2RlciwgZGRldikNCg==
