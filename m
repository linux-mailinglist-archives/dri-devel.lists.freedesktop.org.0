Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 541F176B1D2
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 12:30:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3B810E06E;
	Tue,  1 Aug 2023 10:30:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A1E10E06E
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 10:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1690885852; x=1722421852;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=AXZNOWsXQFGRgN/CfdKy8knJkQs1QJiVb5bOiuA/Orc=;
 b=O1rsEpMXbcmVZkayiCXjFBKwOdrCENNPm+NnICFX7AAyEJMmrp5B+d6A
 HwDH2I/K73xrZN9HPOwjNQz6iYMomiKC935fEzS7RnJ1z9Ze9LV9wP+hk
 ZsEioN7mTNFkhyfIJEnOL5tKEoxssGfUu3KL9/fc/js7bmikX9KBjrF3a
 qYT2rsRkPfHfA6eTNzd5TC8BULsEmmc3UAIi1pC8ZmSm93Gt7vdiKE0Px
 Zkq/QuRMXeQUT+OBXYaFhF9GF/w+DNT6iisi639gam77U1tIoteStbdZ8
 omq+3N0EApcuKpvpUsgRcs4rsrgfF3iR73WQ4Ocrtw9M5w5t4FWkiu3sp Q==;
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="164286827"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Aug 2023 03:30:49 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 1 Aug 2023 03:30:35 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 1 Aug 2023 03:30:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LzKbMN4xkcBP7FaHjrGLEtu7ANRLLjDjmlLOXXphLpwLTbzKsOrhN4hJT1vIaUn8VP80Z76Eu3QriirYaMEC2Bi3P34ZC/FhOSlLhPa2lOBMkERMbnf4bHKVc8lPd8Vi6am74MpjtEhwDusCp/b0lcTl/hdGucfSIuokf2ALMDJ9j0J+PJLCk4CTujZgnt7Af0+bHMM/8dJ98kNcfDB63Wvi9aBwfQbUwymXi7sxplcgfBtAuQvmy5hkspG8xXrgs185VsaKbm/DqoK8bvPbjFcptvu1aAnQSXNi5GprnIa76K2e7V080QtHp9vduaau7uy2e0qGVDisxVyXhRRWLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AXZNOWsXQFGRgN/CfdKy8knJkQs1QJiVb5bOiuA/Orc=;
 b=MOPYnNlt2zXC4ORSVe6uGI4Psu9UwyUaaB10qLrI7H1GER0ru2XiDmu0djDxhZGiZ1SR1kigTOXPnw4/GblVXv/G2DaXxihqjM4KTGG7Qx+YfyysMjUFVj3CemXh1/FFgLDFr8RPvW+0Sb/zOvDOisKDifY14evs4VI61doRWHjNtUrX3MJ5bKx3C+JkC923ickCWujJBu14VstAM5RaTWr7Me5bqYHHzaAGD6p9FW7pjcpQmzdhKJbVpOix5IhUnAKFuuzebv0hq8LIu0WbenQJV60O806ZZTbfWRQ1PwiUxCPOV2Y8QLmzBx4dby6FujMFtMmf3kJS/edhKZcpAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXZNOWsXQFGRgN/CfdKy8knJkQs1QJiVb5bOiuA/Orc=;
 b=a2PHsf6WRPNSsydY8TUTUpArl8gSFM6kOJ6hX8mPrR3xp+pRAsHseU965Xd6ECCqCsaMfRPWpnty8bD4m3Jfe/G3ILsIX+qglG4kfUj5ejYIErx08gGuujTwmrpQAOAJrFahr3h+uT3X7vF7edTFAsQQkMWNkTlEYVLcFjzOyLM=
Received: from IA1PR11MB6193.namprd11.prod.outlook.com (2603:10b6:208:3eb::19)
 by MW4PR11MB6809.namprd11.prod.outlook.com (2603:10b6:303:1e9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.41; Tue, 1 Aug
 2023 10:30:33 +0000
Received: from IA1PR11MB6193.namprd11.prod.outlook.com
 ([fe80::4352:94ae:4654:c4b7]) by IA1PR11MB6193.namprd11.prod.outlook.com
 ([fe80::4352:94ae:4654:c4b7%4]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 10:30:30 +0000
From: <Manikandan.M@microchip.com>
To: <lee@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <Claudiu.Beznea@microchip.com>, <sam@ravnborg.org>, <bbrezillon@kernel.org>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 0/9] Add support for XLCDC to sam9x7 SoC family.
Thread-Topic: [PATCH v2 0/9] Add support for XLCDC to sam9x7 SoC family.
Thread-Index: AQHZtGpG07WSjSdJ1Uq8b6fdWM+RZK/VXYwA
Date: Tue, 1 Aug 2023 10:30:30 +0000
Message-ID: <90631430-c9ec-7424-7679-fe8adbe043cb@microchip.com>
References: <20230712024017.218921-1-manikandan.m@microchip.com>
In-Reply-To: <20230712024017.218921-1-manikandan.m@microchip.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6193:EE_|MW4PR11MB6809:EE_
x-ms-office365-filtering-correlation-id: b4566d6d-51c7-48ba-3804-08db927a547f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GGleZB0W/9JL79DtstkQ03OuqYKFFEfGmttOj0esbFbXS/0xVQsDQMjF6t8cN2HcGgHv6ICcW59ru6g6Gv4jsg6lEKEOQHxXDU56aKoLJDBB2FdQNcwt+SEtjWmRO2KEb0/SJK86MC7sLRN6icNH1QvZFEgElZx+tgP+t59A6uZG5VujAun68QZ35bz88OBlac4RDB5nfLKlgik1hjZiZdwtLQTRMTTY1Kw+6ufZ4EfKpPmSbn+B1uXIyOF628dCeGiwfSWwKqWif9eb/RVJqtvvTsg0lEfLfkJ4mZVZFaRd4wgRS21l+tShWuIlZye1K627GNoTSDCBsZB4SXwZlc9ZHnOJC20COgrV5NTVFTH/RTUUfGEhps6dEc2tfajYUZidW/0SKmxZYiupkgFngPLopohOOn4Vchntewp+ZcRMDbiA3v4Hr8+keFz3Rdk55c6Rnz87pGq79WOiY8jA21ipjIKncecyy0C02sLtsaxQGTUDFcTt5IW41T+o+Wco/vPQqkyH/wHr+2arnmKoc1U9aK+tniGWSb/lUypnpp5ccpyBvTBDnJmfFbw3DNB64vGvqs7IAlJSMt8NVj6/T/wOIT2NQAZRV4ENM25u0NLsUezxwheTqCAB5RJELyz0rJYArD3bQrJJKfWpZuw3N+8/6yOH52NhHz41IMaBYC0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6193.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(366004)(39860400002)(376002)(346002)(451199021)(2616005)(5660300002)(8936002)(6506007)(186003)(8676002)(53546011)(76116006)(83380400001)(7416002)(316002)(26005)(4326008)(478600001)(54906003)(91956017)(66556008)(66946007)(110136005)(66446008)(64756008)(107886003)(66476007)(86362001)(6486002)(41300700001)(6512007)(71200400001)(38070700005)(36756003)(31696002)(2906002)(38100700002)(921005)(122000001)(31686004)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MzJLbTFPT09XY3Q2OElER3ByL3pUZVZFdU1kOE81QmJjeHpUQWg4cGtoK3By?=
 =?utf-8?B?SkUrVmdEU1dXYVl0S3UvR1gvTy9qTHJIYTJlL1Q5UitSQTA1eXBrdW1jdGUv?=
 =?utf-8?B?UXRNR1QrOHlxUHo4eUR1YmhqemxUdnNTRFM4UnNjOVMxc1RsL0lZK2JLU2Rm?=
 =?utf-8?B?N2piaEdaekZtWEI4eCs4WDJMbmlCNWJQN0JPWjhaakNmWUluRXhFeGg1MUx3?=
 =?utf-8?B?OVA5MjBVaDFocnloT2d6Qm5mNnJHVnd0YW1RNHRZcXQyUUNUTnVsT3pTU1o2?=
 =?utf-8?B?UGphWkczMkxPaVNHU3VWQks3ZWxtVUhMOUt3VFdLWXhUQXhZbFVHZ3pTSnZi?=
 =?utf-8?B?UUYzT1JCSlNwbEJGNHh3ZmZKdzJtN3RTaWcrSWtqMDBxUnBXVys5a0NYSTN0?=
 =?utf-8?B?NHpGZEljOFZyOW01ZWs4YzdQUm82T1V5Z2ZlZmZ4SFFrcFNHWkxybkx0Rjdp?=
 =?utf-8?B?Y0tzOGgvTStya3MrWWxnamFpTHpwVWlDZ2F4RnVMaGRyNitjVTAreFNXby82?=
 =?utf-8?B?MmRUM3ZueDVNVkZzN2NKK2xHUklWNHh2akl6Sm82cGJ0VDFaRmZQQUgvb0FL?=
 =?utf-8?B?RmNZRWxtblNJN0RQUUFUQ1NnN2MzQUN3VlFxd3hwOUo5NkJHR05oZ2FRWEpx?=
 =?utf-8?B?VGQvMDUyUXhwZ1VrMVE1QjJiOU5ZODk0NVFNRTd0d2UwM3hwMDV1RTdHOUgz?=
 =?utf-8?B?RDN0L2lza2E2SHpmVFBBeCsvWGRaV3I1NWhCQkl6WVcvcWlad3pycmM0K25u?=
 =?utf-8?B?Q3ZTVlM3MnNHOGJ5TEhpc2lqRWpVRWtET083VE5kUU5uZjhFMTJQZWZVaWF0?=
 =?utf-8?B?WDlsYnR4dkg3WnRScEYzRjJKMVc2aG1WUzYvNUN5V28wNUVZS3F4SW1paWRC?=
 =?utf-8?B?aXVoaWZENGhSSlBycWU1djNCeDc4dVBVbXRaaWk0emNnd3IvMEtZaVdkWWM1?=
 =?utf-8?B?TkhzeEhiMEgxcURjZ1FIbnM3Q0JoSzl3S24wMHVXS3FmVlZBUlRscHdkSUR4?=
 =?utf-8?B?RVI2RWJ6MHk1WDhsZWJmUUNhWml0a25LcWdUVUtlOGlXWkgveGlSYTgxNUNi?=
 =?utf-8?B?VU1iS3IzUVhzYndpWVM5MlNmSlgrVlRSRXYrNTFibTJyZXZKUm0va0ZCM1d4?=
 =?utf-8?B?RUM2eG9qNW5SRHdEa0NTRVV6Y000dko0UERRUVJqb08zSkszeWxac1FsOTYy?=
 =?utf-8?B?SWNxMDNBUWFYWWl4MVUrZHlYUmFhVTYvdjBHYzVUbWJKSFBLM0NEeDRjemJL?=
 =?utf-8?B?QUUvNW8vbHBwaTEzVW92S1dLNlBHSnEwaUpySUVEdkJWWUJyYnhLQUt2T2l6?=
 =?utf-8?B?S3dtazEyVDdhMTZGOUxzMlVEajZIbjVwWEJZanBwZWdRVHM3cGhsWXM5bTNl?=
 =?utf-8?B?eU9hOUNJanN0TlBOYURFVkpuYWRsWDkzUWNXVlc3UU9iOWZ2SXlYdjJ6TzJG?=
 =?utf-8?B?QnlxVnVxdlB6SmMxOGxDSDlweTYvTGNSM0NMQTQ2elFiMFhOc2hpN0VlMFk1?=
 =?utf-8?B?RFcyWjVJMGVoOVA1a2kvcXRGQTBMbzlBbSsvem1uaWdDeXdTZXV5UlpDWjNo?=
 =?utf-8?B?SFRCcHNGdnh3Ly90Y3dYVnMwZE54bTFicElDNlpacjliNm9aQUlXV0lqSkUv?=
 =?utf-8?B?U0RrYUpoUFdVVXE0OEJUNmtxa1NZSWZnSmIrRml6N0Z4YzA5eHNYTlI4VTUx?=
 =?utf-8?B?ZEtoZ01JamIzYy9PN0F1MTZmaGJJTWlhcXB6MWZoT0ZQZmJ1U01JYklJZk9l?=
 =?utf-8?B?ckVjc1JadUpHZlhzS0psc2hvOTlRVlgzSFRyaXVhZDlndWxHRTFXQUQ0eUda?=
 =?utf-8?B?M3Z3NEthcjRlbW9iTlp3TWI3R0YweDlxanZmR3JKSnNZNFpqRkdFbDJXTDVj?=
 =?utf-8?B?UkpiL1ZrT2p2QXdpOHJGd3JPcXRTK2c0TytHZWFLY3lrZnFEWE5kYzl6K3Fs?=
 =?utf-8?B?Rk5NaFJLV3ZOdlJIQVgyM2ZCdzduY0NGYzVXUjJxcDJGYUZ4RUZDVXFqZjF0?=
 =?utf-8?B?T3NHa0JLZExhdFJxbDhsaEoyR2lCckZMR054a0tHamZqdHc0R096ZE1rZ3Qr?=
 =?utf-8?B?NWlQendOYTRpN29CcnpCWG5OT2ZJVURyczJMaSttQXo4NUhHTFQzcS9HVE5X?=
 =?utf-8?Q?1/EJldGgg+09h/YgYJDVN+Gyp?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <577AED1FCD84524EB8FBEF19249835E4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6193.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4566d6d-51c7-48ba-3804-08db927a547f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2023 10:30:30.3933 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T1US2YhpOpQy56p8SQN7uUrsHt8PmfDShckpTR6rwn5QxpYPGWDJGdWpwYIDqMcKAWxN/yX1HNDHxxqajV5vfTn8rpSNDY4svx0wZCRvcXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6809
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
Cc: Balakrishnan.S@microchip.com, Nayabbasha.Sayed@microchip.com,
 Balamanikandan.Gunasundar@microchip.com, Hari.PrasathGE@microchip.com,
 Dharma.B@microchip.com, Durai.ManickamKR@microchip.com,
 Varshini.Rajendran@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTIvMDcvMjMgODoxMCBhbSwgTWFuaWthbmRhbiBNdXJhbGlkaGFyYW4gd3JvdGU6DQo+IEVY
VEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxl
c3MgeW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gVGhpcyBwYXRjaCBzZXJpZXMg
YWltcyB0byBhZGQgc3VwcG9ydCBmb3IgWExDREMgSVAgb2Ygc2FtOXg3IFNvQyBmYW1pbHkNCj4g
dG8gdGhlIERSTSBzdWJzeXN0ZW0uWExDREMgSVAgaGFzIGFkZGl0aW9uYWwgcmVnaXN0ZXJzIGFu
ZCBuZXcNCj4gY29uZmlndXJhdGlvbiBiaXRzIGNvbXBhcmVkIHRvIHRoZSBleGlzdGluZyByZWdp
c3RlciBzZXQgb2YgSExDREMgSVAuDQo+IFRoZSBuZXcgY29tcGF0aWJsZSBzdHJpbmcgIm1pY3Jv
Y2hpcCxzYW05eDc1LXhsY2RjIiBpcyBkZWZpbmVkIGZvciBzYW05eDc1DQo+IHZhcmlhbnQgb2Yg
dGhlIHNhbTl4NyBTb0MgZmFtaWx5LlRoZSBpc194bGNkYyBmbGFnIHVuZGVyIGRyaXZlciBkYXRh
IGhlbHBzDQo+IHRvIGRpZmZlcmVudGlhdGUgdGhlIFhMQ0RDIGFuZCBleGlzdGluZyBITENEQyBj
b2RlIHdpdGhpbiB0aGUgc2FtZSBkcml2ZXIuDQpIaSBBbGwNCg0KQSBHZW50bGUgcmVtaW5kZXIg
dG8gcmV2aWV3IHRoaXMgcGF0Y2ggc2VyaWVzIDIvOSB0byA5LzkuDQo+IA0KPiBjaGFuZ2VzIGlu
IHYyOg0KPiAqIENoYW5nZSB0aGUgZHJpdmVyIGNvbXBhdGlibGUgbmFtZSBmcm9tICJtaWNyb2No
aXAsc2FtOXg3LXhsY2RjIiB0bw0KPiAibWljcm9jaGlwLHNhbTl4NzUteGxjZGMiLg0KPiAqIE1v
dmUgaXNfeGxjZGMgZmxhZyB0byBkcml2ZXIgZGF0YS4NCj4gKiBSZW1vdmUgdW5zZWQgTWFjcm8g
ZGVmaW5pdGlvbnMuDQo+ICogQWRkIGNvLWRldmVsb3BlZC1ieXMgdGFncw0KPiAqIFJlcGxhY2Ug
cmVnbWFwX3JlYWQoKSB3aXRoIHJlZ21hcF9yZWFkX3BvbGxfdGltZW91dCgpIGNhbGwNCj4gKiBT
cGxpdCBjb2RlIGludG8gdHdvIGhlbHBlcnMgZm9yIGNvZGUgcmVhZGFibGl0aXR5Lg0KPiANCj4g
RHVyYWkgTWFuaWNrYW0gS1IgKDEpOg0KPiAgICBkcm06IGF0bWVsLWhsY2RjOiBEZWZpbmUgU0FN
OVg3IFNvQyBYTENEQyBzcGVjaWZpYyByZWdpc3RlcnMNCj4gDQo+IE1hbmlrYW5kYW4gTXVyYWxp
ZGhhcmFuICg4KToNCj4gICAgZHQtYmluZGluZ3M6IG1mZDogQWRkIGJpbmRpbmdzIGZvciBTQU05
WDc1IExDRCBjb250cm9sbGVyDQo+ICAgIG1mZDogYXRtZWwtaGxjZGM6IEFkZCBjb21wYXRpYmxl
IGZvciBzYW05eDc1IFhMQ0QgY29udHJvbGxlcg0KPiAgICBkcm06IGF0bWVsLWhsY2RjOiBhZGQg
ZmxhZyB0byBkaWZmZXJlbnRpYXRlIFhMQ0RDIGFuZCBITENEQyBJUA0KPiAgICBkcm06IGF0bWVs
LWhsY2RjOiBhZGQgTENEIGNvbnRyb2xsZXIgbGF5ZXIgZGVmaW5pdGlvbiBmb3Igc2FtOXg3NQ0K
PiAgICBkcm06IGF0bWVsX2hsY2RjOiBBZGQgc3VwcG9ydCBmb3IgWExDREMgaW4gYXRtZWwgTENE
IGRyaXZlcg0KPiAgICBkcm06IGF0bWVsLWhsY2RjOiBhZGQgRFBJIG1vZGUgc3VwcG9ydCBmb3Ig
WExDREMNCj4gICAgZHJtOiBhdG1lbC1obGNkYzogYWRkIHZlcnRpY2FsIGFuZCBob3Jpem9udGFs
IHNjYWxpbmcgc3VwcG9ydCBmb3INCj4gICAgICBYTENEQw0KPiAgICBkcm06IGF0bWVsLWhsY2Rj
OiBhZGQgc3VwcG9ydCBmb3IgRFNJIG91dHB1dCBmb3JtYXRzDQo+IA0KPiAgIC4uLi9kZXZpY2V0
cmVlL2JpbmRpbmdzL21mZC9hdG1lbC1obGNkYy50eHQgICB8ICAgMSArDQo+ICAgLi4uL2dwdS9k
cm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxjZGNfY3J0Yy5jICAgIHwgMTcxICsrKysrKystLQ0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19kYy5jICB8ICA5OSArKysr
Kw0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19kYy5oICB8ICA0
OCArKysNCj4gICAuLi4vZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19wbGFuZS5jICAg
fCAzNTcgKysrKysrKysrKysrKysrLS0tDQo+ICAgZHJpdmVycy9tZmQvYXRtZWwtaGxjZGMuYyAg
ICAgICAgICAgICAgICAgICAgIHwgICAxICsNCj4gICBpbmNsdWRlL2xpbnV4L21mZC9hdG1lbC1o
bGNkYy5oICAgICAgICAgICAgICAgfCAgMTAgKw0KPiAgIDcgZmlsZXMgY2hhbmdlZCwgNTk2IGlu
c2VydGlvbnMoKyksIDkxIGRlbGV0aW9ucygtKQ0KPiANCj4gLS0NCj4gMi4yNS4xDQo+IA0KDQot
LSANClRoYW5rcyBhbmQgUmVnYXJkcywNCk1hbmlrYW5kYW4gTS4NCg0K
