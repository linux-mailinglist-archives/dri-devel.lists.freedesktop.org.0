Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2E54ED3AF
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 08:02:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8DAB10F9F8;
	Thu, 31 Mar 2022 06:02:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.142.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB1B10F9F7;
 Thu, 31 Mar 2022 06:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1648706554; x=1649311354;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=edLSptgDeyxwnVN+ymSB4MLSJDyiSf7kFdOzbuxLhQE=;
 b=176TuUXxiwDgtoqyy/wLvqMv510EwvHUjK63bWG9jbSApjbC5xTWyz0e
 Fgvj7+8dcEHPnlshoA5R3+C8lGAHUNw/LMHHXWTvkvyL7h+YUCOnNv15r
 QeO+dOm4s51Zr6JS8LaMn/z8FaP6OjZnB2xi0QZ1stL57Ry134u080w+t 4=;
Received: from mail-bn7nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.105])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:02:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mTcAxcsmVzwwP3Au59vQT0wSYYd1ydqqN5FWRFMKM5iNaKSAo8EPjtlwkiC6LPAryV1MVcQ+oGK0QZEJUZIZLLXSi2wRfk4ExNRPHEPtAyPduI5klKjmIAa1SoMYyLsUi4Jaswe4WyFCi8W84DkTCakeKasi6HMLbw7LCOuG14pLXF+dMTNze3QS2vY2J5wB7aHrIj9TZYuLrnkwAJ18A8FHkPbvUZ1YoYjMfdvUjYhn5Y2UB9Cz4o9tqlV60HFlbRIVZqb3lVJqFnj2EuAwjeupVzPMl3vaKlaiq4C/0WNf146b3qoMWxI0JneRmvkzS6BPGUfYCoUfrEqMoZnAHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=edLSptgDeyxwnVN+ymSB4MLSJDyiSf7kFdOzbuxLhQE=;
 b=CGaUXUXF0rnDwBF4mntnqFXES2aum/F0Lq+JuVSY2Mz70FLruallzz5yq3JBHl3P8s5YXhq2ReKxmbFde2p0M1zweBm+JHaBksnZ3wMdUrdQkai8tWXidt7ZKlyb+a4iwB4+a4FA23gxclb8qgziiLcs8XfHe9Lbgqs0oBI0WvQKqAC4QDC8YFyQOmkt3lh6hulWFv3eRpokJ9XlCF6/btORaxFj4aw+qNYn+LupoDKJU55pyjfZcG89QOcstSpxlsnXka4HEZoT48L0a2PhGRZ00uz6RyuPnLnDyt2LtUMOvUOpypuK8OpA9rHV/73YCp632iPpBg/uQL2DBebi6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6)
 by CO1PR02MB8458.namprd02.prod.outlook.com (2603:10b6:303:156::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Thu, 31 Mar
 2022 06:02:28 +0000
Received: from MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::9485:c59c:6877:f492]) by MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::9485:c59c:6877:f492%6]) with mapi id 15.20.5123.021; Thu, 31 Mar 2022
 06:02:28 +0000
From: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "Sankeerth
 Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
Subject: RE: [PATCH v6 8/8] drm/msm/dp: Handle eDP mode_valid differently from
 dp
Thread-Topic: [PATCH v6 8/8] drm/msm/dp: Handle eDP mode_valid differently
 from dp
Thread-Index: AQHYRE/UsJWR5XLNukW2wMYYKa9U06zYfJ8AgACEi0A=
Date: Thu, 31 Mar 2022 06:02:28 +0000
Message-ID: <MW4PR02MB71867220A90FCFED295830D0E1E19@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-9-git-send-email-quic_sbillaka@quicinc.com>
 <CAA8EJprvE31ex3fCQHZ-=x+EWHK4UZ0qqHRh+rH4dk5TPhmVyw@mail.gmail.com>
In-Reply-To: <CAA8EJprvE31ex3fCQHZ-=x+EWHK4UZ0qqHRh+rH4dk5TPhmVyw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: becda820-81ed-4b8d-db1a-08da12dc0929
x-ms-traffictypediagnostic: CO1PR02MB8458:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <CO1PR02MB84589B62962D9BAF2F1B7F0C9DE19@CO1PR02MB8458.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 61ztZ+FGXzB5oITlJ22w81QTJW5w09BYO17e9sXT2JI9XWBJtrkQsRvNKDijSs9q8nf5pbLPyV55vrO2DzGnfXYQm216hIeAz4e+P/P6f6RtgRnbGSmQHKGsJX+kvSOPp9JaIilYCBYU2h8bockCj4iF92kSHItNW76ZzNEB28Ph5BuPSZHDoLE+bxcluY3scA6vvn16sllUIPF6FostpqHwSRpZ1T23t5prag9j90xFpM/2ufIgiJdeMtnSbnkS/g2gfsU+LJTto5XqLuWS2/CybOl6sxKHBAGZ81jp4SzWaWIhX8fnTcObjPaMufxMPjxL7RyIFxOcTMLRwAfDXvEL6Ddo1hqpe4QIyVL4MZpZCx0PMX/TmcKhJ0pVQjp/B88Csrzg49IbJYp143AKp2jcVu/xu5m2NZcvfxXtcCTeCNxGI/40LEIKXXt1uYlJqkkmvnf6BXct/M+3MHNewdT8TXrjCOjgu55LHnHa8K65OIC0Kx9KFBxxdePuu6veKyADO5KJ/cu3tf8DgiMkGZlVx5hewrYCpH6/d0NSKDOx12kr5+NPDQreeo56r3diCdqBTPoDP9+5spKZYQ2mv6f3rbO1Li/uR9TECfutUaXJclfXPzt8AvfGCkuUiX6zjPgCiaaSH+qvmCvU9nXDcJ/Pn4vJNmh9pwOXlz86lcOFidZuGehXSyG5om1/DoYUcAfT1d1Z8WBF7R3jUMwxvA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR02MB7186.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(966005)(186003)(508600001)(26005)(122000001)(52536014)(71200400001)(7416002)(8936002)(38070700005)(55016003)(2906002)(107886003)(4326008)(110136005)(316002)(66556008)(86362001)(9686003)(38100700002)(33656002)(5660300002)(8676002)(76116006)(54906003)(66946007)(7696005)(83380400001)(64756008)(66476007)(66446008)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QkI5cXQ1YmN6cndjN0pnakd6UTJOMTIrV0VvUTV1TTQ0K0xDUDQzaUlXUzE4?=
 =?utf-8?B?bkdXMVFGUTJmZjhJUk1yWDA0ZFkyaUpvcmhWdmYxWHJvSnUwUTJpeFN1MnRE?=
 =?utf-8?B?blJJcU90cU51SE93L2NVVURkelU5a01hWVhOd3hkYTdKNDJ1ejhZTmFUd3pa?=
 =?utf-8?B?b1FRdTBhOFZkTUdzVmVkdTZjQmpFckxCaGFQSmJ6NEJLSmFwV1E4aFlKZlIx?=
 =?utf-8?B?eGhiaUUzdCtidi94Mmw4dkwzQWhtK3VhV2orYWE1L2Y3WVRqVTZpQlRORTRl?=
 =?utf-8?B?TGtHcytReGRZMEhjcEo5SFNvaUVZTjhUeTdmcVE4TGYxS1lsc1dWZVA5eHN6?=
 =?utf-8?B?VFVxN2hwYjd2NTNvNERSdEYzM3ZoUnFsTE5Ta0NYcEhSOVlOT0JDVncwZlBv?=
 =?utf-8?B?bUxHUlQ5eUJ1L2gvSy9IODhEaTBMbi9jbENrck5EYXk5OFZjQTRWY3dhZmh3?=
 =?utf-8?B?bys1YlRVRlZjdXlaaEplM0x5KytaUXBKaWNlZ1o1cHRlRmMreGwwa1RTNzY1?=
 =?utf-8?B?L3pWOU5NdDRFRWNacDBURzBYYmREYXlMNjBjcnNkTS9veGRraXFoZzR0UWor?=
 =?utf-8?B?a1libmlOQzhJNTlMRFllRG1yWldDOTYwd2x5NXdGNWpHYTdTc2s4YjRoMFYy?=
 =?utf-8?B?T3g0amxEaDM0UC80ZThLSzB2Zk1jV1FOWm5mVnNZbHoxak1wTC8ra1RxRGlY?=
 =?utf-8?B?eEREQWNsd3IyZzhKQlNzNFRsamcyZkl6RG03MTBERWh3VEcrUEVMVjNTOUFq?=
 =?utf-8?B?MUtDMVlJYUE0OFRKYzkybHJJU2NGSjY5eHMyc2VKTjkzaUhueXY0M0tiejR5?=
 =?utf-8?B?QitoOFlRMnpJQzhTOVU2YU5nRUxvcm9rbHROdU5VK3B6OStmeDR1QSthcDYr?=
 =?utf-8?B?bUVjL2JLVEFoUFVpeHJjeTFybkRSZ3poVXNrMVd3aENMRit6bnZ1anIzZGh3?=
 =?utf-8?B?RUl5aTNJRk9sSFFrbGJSdWRrVHRFNVliZ0dYazl1b3U5VWVBUFNacnhHNkV1?=
 =?utf-8?B?R09wajRzRk0zeXU4eXZ3NWlYbXNSUm1xZmVIRUY5TVVhR0hlU2xlQTJib1Jq?=
 =?utf-8?B?SHh3TUJlMFlveEFhUy9DNTErUHg5emFYc1YySkJqU2ZZRUlRRFdwYUtUcTlp?=
 =?utf-8?B?Mkt0bWFONGYzR1lxajVRYTZWMEhWdkVremlneG5OUU1leExHelVLRlQwVnJF?=
 =?utf-8?B?R0N1dXlBSVI2RzdlTkE4YlJST2RQZGYwcmUvckxYTGZTVk8rWTB5Y3dKY1ov?=
 =?utf-8?B?YytTbmJHcDl4OHcrU3hHTGJmWW1YVXNldnRaZUkxK2VuMFVnUnQ5RFVrOXRX?=
 =?utf-8?B?cGRFcWJUeTRGY0lqWlRsdzk0bTJMZURzYVRQM1VmbnVucmJ6c29oekVmanlk?=
 =?utf-8?B?MTdPdk1xdFgrdElCOGJOd0h3YWpabFhDOVVTTW1ER1diTmZDbVRuMi9aMEdt?=
 =?utf-8?B?TllqMUZUOWR5bjZqdnBKZHNPRklYWXV3Y3lReCtZcXRualpxRVBWVW1vTm9Y?=
 =?utf-8?B?emI2aWFOTUMrakVFcU9NZ0M5VnJnV0U4RytEWTVGbGtCUGYwN0RoKzNYOVo1?=
 =?utf-8?B?TUN3ZWN1eUZhdUtTSk5NTHBmQURpTGQ4eVJySjl4b2lOck1TN3FvdlArcTFm?=
 =?utf-8?B?U1BpWVdnODY5dVVQekhWREVaYjJTWXJ4MmJmNnlvV1VId1lwMm5DTlo3TlFl?=
 =?utf-8?B?dlQrWjkxeVVKZlhUWURQc3hZcDgzcDhmUDBNNkNldjFEUERJa05PV0JLSER3?=
 =?utf-8?B?S0RBcitvRjg5UVVHKzlTMG03WGJERkFSZEg3ZHhFa1M5eE10ek1NQ1RHZFhK?=
 =?utf-8?B?bXZrd1NkU1BnRGNFaUxZK1RYN2lEc1NLMG02UFI4WFozT0xFU3Q4eGdiajBX?=
 =?utf-8?B?YzBNc3pvdmRWTFlRUUluV1lJYU5uM2ZmZmtyN0J6WnNSa2xXeUpYRmRXWE1l?=
 =?utf-8?B?cGtvUFBEMDFXR1gvdnMzVWFUWTV2SXVJMkJsR2ZpTU1FaGZ3S2ZqYUJ1SU9K?=
 =?utf-8?B?UU5mSTlXVXovbWhFT3NsdmllVXhzd0dldkJacXBrWnZkRWlKYkQyMWFJQWI0?=
 =?utf-8?B?Vmpkb01nODNsWVdaN2xpOS84ZWlPdkZlKzVROXBJZkVmTnhTQjFENklNSGFr?=
 =?utf-8?B?TktCdlM0VjlVdHhDR1IvNkMydUdjdUdBQSthYWx0UGJQNFFhWUVSMVVjeU11?=
 =?utf-8?B?azJCWE9hcnZubElpSURySFMrWkRydGgwZFpFQ2hoVXJ0c0lOd3ROU1VTOWNP?=
 =?utf-8?B?U1FPalBFTkVUZjlCcGNrYjBjREw0V2gxNDRhT1owb1NtWUdpam9Yek15SUZw?=
 =?utf-8?B?VGI1a09Dbm82KzBxWCtWaE9uMXN2NzcwRE5IZVp4UnNpNGJhbld6dz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: becda820-81ed-4b8d-db1a-08da12dc0929
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2022 06:02:28.0783 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A7VGNRJOq1nYjyu4dx91W+2t13KZdDLCwf03G1EhjNhkY0uZ2cqG2DkCuM/I0kZhzebgavrjord7z8uRMB5BEoYjdTqp2/SbB66cZ87Msn4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR02MB8458
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
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "sean@poorly.run" <sean@poorly.run>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG1pdHJ5LA0KDQo+IE9uIFdlZCwgMzAgTWFyIDIwMjIgYXQgMTk6MDQsIFNhbmtlZXJ0aCBC
aWxsYWthbnRpDQo+IDxxdWljX3NiaWxsYWthQHF1aWNpbmMuY29tPiB3cm90ZToNCj4gPg0KPiA+
IFRoZSBwYW5lbC1lZHAgZHJpdmVyIG1vZGVzIG5lZWRzIHRvIGJlIHZhbGlkYXRlZCBkaWZmZXJl
bnRseSBmcm9tIERQDQo+ID4gYmVjYXVzZSB0aGUgbGluayBjYXBhYmlsaXRpZXMgYXJlIG5vdCBh
dmFpbGFibGUgZm9yIEVEUCBieSB0aGF0IHRpbWUuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBT
YW5rZWVydGggQmlsbGFrYW50aSA8cXVpY19zYmlsbGFrYUBxdWljaW5jLmNvbT4NCj4gDQo+IFRo
aXMgc2hvdWxkIG5vdCBiZSBuZWNlc3NhcnkgYWZ0ZXINCj4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJl
ZWRlc2t0b3Aub3JnL3BhdGNoLzQ3OTI2MS8/c2VyaWVzPTEwMTY4MiZyZXY9MS4NCj4gQ291bGQg
eW91IHBsZWFzZSBjaGVjaz8NCj4gDQoNClRoZSBjaGVjayBmb3IgRFBfTUFYX1BJWEVMX0NMS19L
SFogaXMgbm90IG5lY2Vzc2FyeSBhbnltb3JlIGJ1dCB3ZSBuZWVkDQp0byByZXR1cm4gZWFybHkg
Zm9yIGVEUCBiZWNhdXNlIHVubGlrZSBEUCwgZURQIGNvbnRleHQgd2lsbCBub3QgaGF2ZSB0aGUg
aW5mb3JtYXRpb24NCmFib3V0IHRoZSBudW1iZXIgb2YgbGFuZXMgYW5kIGxpbmsgY2xvY2suDQoN
ClNvLCBJIHdpbGwgbW9kaWZ5IHRoZSBwYXRjaCB0byByZXR1cm4gYWZ0ZXIgdGhlIERQX01BWF9Q
SVhFTF9DTEtfS0haIGNoZWNrIGlmIGlzX2VEUCBpcyBzZXQuDQoNCj4gPiAtLS0NCj4gPiAgZHJp
dmVycy9ncHUvZHJtL21zbS9kcC9kcF9kaXNwbGF5LmMgfCA2ICsrKysrKw0KPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL21zbS9kcC9kcF9kaXNwbGF5LmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHAv
ZHBfZGlzcGxheS5jDQo+ID4gaW5kZXggOGJhZmRkMC4uZjljN2Q5YSAxMDA2NDQNCj4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2Rpc3BsYXkuYw0KPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9tc20vZHAvZHBfZGlzcGxheS5jDQo+ID4gQEAgLTEwMDMsNiArMTAwMywxMiBAQCBl
bnVtIGRybV9tb2RlX3N0YXR1cw0KPiBkcF9icmlkZ2VfbW9kZV92YWxpZChzdHJ1Y3QgZHJtX2Jy
aWRnZSAqYnJpZGdlLA0KPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiAg
ICAgICAgIH0NCj4gPg0KPiA+ICsgICAgICAgaWYgKGRwLT5jb25uZWN0b3JfdHlwZSA9PSBEUk1f
TU9ERV9DT05ORUNUT1JfZURQKSB7DQo+ID4gKyAgICAgICAgICAgICAgIGlmIChtb2RlX3BjbGtf
a2h6ID4gRFBfTUFYX1BJWEVMX0NMS19LSFopDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
cmV0dXJuIE1PREVfQ0xPQ0tfSElHSDsNCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIE1PREVf
T0s7DQo+ID4gKyAgICAgICB9DQo+ID4gKw0KPiA+ICAgICAgICAgaWYgKChkcC0+bWF4X3BjbGtf
a2h6IDw9IDApIHx8DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgKGRwLT5tYXhfcGNsa19r
aHogPiBEUF9NQVhfUElYRUxfQ0xLX0tIWikgfHwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAobW9kZS0+Y2xvY2sgPiBkcC0+bWF4X3BjbGtfa2h6KSkNCj4gPiAtLQ0KPiA+IDIuNy40DQo+
ID4NCj4gDQo+IA0KPiAtLQ0KPiBXaXRoIGJlc3Qgd2lzaGVzDQo+IERtaXRyeQ0K
