Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDA7844FDF
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 04:39:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCFCA10E61E;
	Thu,  1 Feb 2024 03:39:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEDBD10E61E
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 03:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1706758754; x=1738294754;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=HwDYnrdElNZYlgSNsRPCJiTcgxwibcLlquez18YxWns=;
 b=BMM+/CclTLP1GzgjTJ59jKu12nXuq9+lMtDT4oJTEDKwG563IsdFSMDP
 aBuoIKtQDISUaPw+IPG11WkVd7dSbvMQXDvN3sUqQg8JRKTbGzWB9SaWA
 bybOI5B4YYrfm4nq5jLQHGRQcZtHMIx25/WTGk+4fo66MPvcIt4/87DD5
 AQ9ipsfgHjyaGqMwYgk0OGaqrySxCbVGsjWkqhJ+6pLRdaw/0Er+WFh4h
 Au7v0xeaR/FjJzSfcJvbR3zBj1ayIgCUKw/AUduEI8nKSeUHxMa9Km4OS
 CzMcXiMrPTjEmpgMMRHMLj64gZjcMFSgjOsbh9sH4Squkfm2hl9vvYFvd w==;
X-CSE-ConnectionGUID: NIaZ0aBKSoOwXDiSTUTK/A==
X-CSE-MsgGUID: 2z/lmbsRSmKm7g8iVr+scw==
X-IronPort-AV: E=Sophos;i="6.05,234,1701154800"; d="scan'208";a="182854435"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 Jan 2024 20:39:11 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 20:38:40 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 31 Jan 2024 20:38:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P/s1U2MLoHlEMleNFiw7d8Q7kQz19gul8oecn+CEByJtop4D8YWhW0zfLDiu3r43w+5j2JQa57YXCqQRGseNg4rhK7AmYPWsk62O7m8TR7Tk9wXKxWrjayeAQ4JPoJBizJBqcDaDlftrm1cWXZkEtuNakVbBnoTgBKgG+8B+RyK3jpyYlbiCF62Qb2PRDeGHx4WJ7VrqDrfGfuM7W0be5dyHQK7DsHMe2BiAIUpl89eu+vRjctlX+7HXh9DDy3/Ihnf8E+/UX3MzguTG0QEOi2Pj52VRNfHQH5qEaNLWKFfp0JYvhnAub7nUiD+jmAT7PnRGHUtX864jAXxiaR3Jzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HwDYnrdElNZYlgSNsRPCJiTcgxwibcLlquez18YxWns=;
 b=YdqiA6tnVNqzlUTxNnU2k9KKjblSwQzVi4JPWBwpi3xgpXdHzTMF0OBjaOY23wkTRMeT0xYEhJuG77D8Bi/hyPB4oP08iPmkhbi2/82KXOCJT1exhKy2vUFzCnbHmeUOntf591/3M8As9AoU9GBeXGxi4xTwcQRQsUiBKCm1bwuK3xBHPuPt3/EI9i8OmGnw5Iw1ybp2EWQsDGlFNOmY3dUX82DzNeADYJ7cx9Dywq7SV27cnmPZ2Qe+WIwqaONFnZy5qot1rLUOp0yIT8JNYTe5MIzO0KDyTyLKx8DYy5jEVWGPngbkDLQYhwc86Uzsg36Czpio91i4hNJ1vef77Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HwDYnrdElNZYlgSNsRPCJiTcgxwibcLlquez18YxWns=;
 b=sVuwHc3/JuAsw5qWSoCLL7W7vAIhf11wU3Q2TBI3O79UrbFhGW2KMDm9JhPN3wDDUj/oOrbXDL6uBGmWjRIGeRgjE5akyoVBF7bbcy2B+X+yHrFmCXvd/SQ5CDwLt0tUQD2luvRgQ63cPRvoVFUd9yu3x3TcLLQSE92OR7GErMdBlUJbVTncZffDl7+vhTk6dXEPheTl0YAExxFJTInLEIrevcwgJu25W/PrCU0fKzvWFJnpKbiICDsukOJDnbk7icLdYbUlmdXOLLPJ1tEgFKX4+BuQQBm7pfg9A0FQsfFzmLk4skfd9YvabhehvRkXBrAo7LGTT9q4gpUMtBWk3Q==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by IA1PR11MB8100.namprd11.prod.outlook.com (2603:10b6:208:445::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24; Thu, 1 Feb
 2024 03:38:37 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee%3]) with mapi id 15.20.7249.024; Thu, 1 Feb 2024
 03:38:37 +0000
From: <Dharma.B@microchip.com>
To: <sam@ravnborg.org>, <bbrezillon@kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <conor+dt@kernel.org>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <lee@kernel.org>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <linux-pwm@vger.kernel.org>
Subject: Re: [linux][PATCH v5 0/3] Convert Microchip's HLCDC Text based DT
 bindings to JSON schema
Thread-Topic: [linux][PATCH v5 0/3] Convert Microchip's HLCDC Text based DT
 bindings to JSON schema
Thread-Index: AQHaU/afGNCqaviMx0Sn8Qd7rlUHCrD02FgA
Date: Thu, 1 Feb 2024 03:38:37 +0000
Message-ID: <478cab42-5f30-4fbe-b42d-02d16b81ca11@microchip.com>
References: <20240131033523.577450-1-dharma.b@microchip.com>
In-Reply-To: <20240131033523.577450-1-dharma.b@microchip.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|IA1PR11MB8100:EE_
x-ms-office365-filtering-correlation-id: ffd47a9b-ee7e-41e7-1b40-08dc22d74662
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0vi1KFOcLeyfT5Uj7/7uw7vaf7yFw1NEYH/Y++8XgPV3VmWh9izg34TyIEcSM4nXEXzwSu/uiZfem/FTdV5joJ7aqg9qlOHafdNfSmBWoTOaNeyRMGZFhGLUKh/oOmMeGGMYdzBxy5kBbI+BQV7RQ5kVMaNSHEz8mjojhY4WO5QHR2z6U3B0fmuhoo980tGP6iBk7JqaWMdcq9IRkhlKjZ9NQ9eI/47SrPs+FZQ1hZTtfxJq/CXmdzszVFYBxYd5zpQOfy+p8XwLd5pQthJ8Enhh3J7CN59L3kj0VYW4z0yH0Kaxl25ayms/AqDyXlnbQVLGpRBT1Bwf7Dm8dag2DBu/f+pQlOrjweNtgyPkJqpibz7zEWqpTFKjw1AYIIfKMwdkqGlaaHORCyxg3fumiB3P1QQrGU3Cg/GGiZbInBz0TAqEH9Bj2cozyQ9LBhQyNED7SUMGRf+1BI8d7cUQlePT8LFqhy5OeMPiUDrNhw6qHyaTtzqlFCDqIxfHSgES1XqBHsEsyVrdDkwzSngk8vqmt8ofc6bmYMDIU0mlhkGvsqHy+6c2s8cjN5/JRnO3NVXfGUKeifPiZvpnbmJSR7M6wexbEBWzFQAcSyuo3JfhxgljAcYEq1hPnIHu2aYtqo0+IeIHDXXxLN1N6GP/pm+HFaZkbeK0wntYoWSlxxU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(136003)(376002)(396003)(366004)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(921011)(26005)(5660300002)(107886003)(6506007)(4326008)(53546011)(6512007)(2616005)(66556008)(2906002)(7416002)(83380400001)(76116006)(66476007)(66446008)(6486002)(66946007)(110136005)(64756008)(478600001)(316002)(54906003)(8936002)(91956017)(31686004)(71200400001)(8676002)(38070700009)(86362001)(38100700002)(122000001)(41300700001)(36756003)(31696002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c0poUU5FSytWQ1VGenhpbDN4L0pXK3Z4ajNjL2J0UkNHUmFOdTJWVENROGNx?=
 =?utf-8?B?WHkzSjVJK2pxbzkvbWVleDljeWdWakMxK0x3Z0tsZklRcmZyZFdBUTdCUjla?=
 =?utf-8?B?NDZTUjlvT04xSW5yaXZac1ZSb3RWRFk1dEJEWU1yUnJLcTg1UXprSGRoaVcw?=
 =?utf-8?B?ZDhhNnB6dVpscUFUVVcvbzVyRkxJRDBJU3RhZkRhMmtOQldoZ0hvaTB6cENs?=
 =?utf-8?B?citINThaa3NmeXRwQUt6UVN0czAxbWJoaFdDSERvWkthQTFLUEdFbHFUVXB2?=
 =?utf-8?B?ekNOR3VYWHYySGRRNkNPTUVvMUNUNlVzcGk2QllTQzN4aE5vaDZnSVYwbUZV?=
 =?utf-8?B?U0VabjE2UE9pVEh1OHU1YldhcloxbHpwZ2xOb0tGMThUQlJIVVdlYlROWExz?=
 =?utf-8?B?bnZOMzlUVEdMeXo3cWVqNEc1WG0vNEJ4dnRqb0RGTFZGS1c4endWdmVUMmxR?=
 =?utf-8?B?TENkYnhrUmVYZjdxeVBEUTBWbmdva3hBNjlXMTkvVldKVVI2TGhYUXZTekl1?=
 =?utf-8?B?VjZrN1RKQWE0dUx2WU5zaWJHSy91cE54ZnY2UllKQVNzTFZobHRDRVZYQ3pw?=
 =?utf-8?B?bnN5SFJma2dzei82ekZUTWpMY0ZIajNjeDdGc0NMSGd4T1ViVWZCVHB1R09B?=
 =?utf-8?B?UFlXZEtmK0ZnZXY3cXJ0ckl1VXp1OWlZTFRNY0VuQ1B6ckRZVTdDbjVpbmFI?=
 =?utf-8?B?bk5kYWhjMG12WTllc1ZsbTVFNXFlVllocmdnSm84eVlibURMdGpPR2Nkb0ox?=
 =?utf-8?B?UG82MWVxRUtQa2RMcGJyLytWQ2czZC8vakRFejluVllBUXFjOTYzZ05Pd0I5?=
 =?utf-8?B?VklNcE1XaUR3WmRRdGZ2Umd6Z2huSHBvOXY1ZWpSWnNKVlkrTVZEaUg3UUJj?=
 =?utf-8?B?RzR5UkpRZ1dONk1ZQ1lwRldab1FrRTlRaGpQUmpEa29xdlJHTEdXL0xyQnR0?=
 =?utf-8?B?bjNza0ZBY29KSXBUTVBzZVNCNFV1UXhKKzVaNUtYMUdyaXAzVi8wZ3U3eHdr?=
 =?utf-8?B?NFpLdWprN2JkWkJKZnk1dXplV0t5WVQyeUp1LzJZcXZ2VVB4ODFZTnJEdWtH?=
 =?utf-8?B?dUp2cVQ4bGZKOFpvY0RmQjVZallRMGdzRkNSTjZFaVlLVjNQbXVzOFg3MWg3?=
 =?utf-8?B?amhCWjZoM0ExWWVQREd4UmdUU3Y4SFNyQXArMHc0eVNwWTltYU9MRVIxOU1W?=
 =?utf-8?B?N2o5MGQrY3NqM1lvQTZKQjl4VlNlS2pQZEJmSVlMQnBuNW5XaHJ1U2Y1WVE5?=
 =?utf-8?B?MndKbVczc2VmWUZTVmlsZWFacmV0RGlKaGVGMWF1ZlAxUDIyejhPOVMrcDFz?=
 =?utf-8?B?aU9rNVJNZGdEV0ttcnh3aWowN2U2VVNZSWkzenFSUDdPaHo5SDFYOTZ3TUNh?=
 =?utf-8?B?ZzZrOGFwVzJoTm5UZjJnOFR5dVFvSFNxdjVPS1lVQ3B4VmI5SFhsUG5ZaHc1?=
 =?utf-8?B?Zm1wUGhINTZnQWVKOFY4c0RXNTZzcGdmQ0dzSkJkMGEya1E3WWtoS0ZiUFFN?=
 =?utf-8?B?YnQyR203V0M5b0VCbGdKbXdXMXNianovVXdxdkhvMnc4WHRiakdVelEzQzho?=
 =?utf-8?B?b0J1d1NHNXF0S2hJcVpPMUFCZFVLQzlxS0JzaVJNV2xKZTJERmM3Q3lWUUlI?=
 =?utf-8?B?WlVOOHhaT0NOUDhMaC9mZTBXb0YxMllyS1VqSzNlZjVYNHJDNUNSczdBMEp1?=
 =?utf-8?B?eUNBc0UvdDZjZEVoTjRlSnQ3L0wvZkNTL1JyT1Yzd3Z3QTdoSEw4OXZ0MXJX?=
 =?utf-8?B?N2tMd3FCOWdYeGdGem40Wml2RzBIQVVsems5ZW5pb3ZJSERDcGlMRHAvdGRF?=
 =?utf-8?B?c1pCODBXb0JPclNYY09ZU0QzdDJuVEtUTmR2c2FubmJFZ25CSERUMnh5YlJ1?=
 =?utf-8?B?dnpnM0NOdjBvWXpWZDN4S1pqV0VoakdtL0dEUTZucFRFdzY2MzJYUUhzRlZz?=
 =?utf-8?B?QnIrcmhwOTdhbEhTVVNVTkF4bWk2Rm9HVmtOdUJGaTFOUkxna3NHRkRvcUVI?=
 =?utf-8?B?Q3BOTmw1YytFT05xcElxSG0wRzcvS3AvTjBlaXRBYkNkQXFXMlR5MHhmT0FI?=
 =?utf-8?B?bXA1dFRMQ2xkbmphRFltOXZsdnBncE1UcWl3MTdES1NYaS9EdHU4ak1LUk1w?=
 =?utf-8?Q?BPD3OubnWeNJ7EJ8DA82lBBid?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2B1473B76BE8D3409BE241D8D99C708B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffd47a9b-ee7e-41e7-1b40-08dc22d74662
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2024 03:38:37.3312 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9kJsmtu4Ch5jTAOF/oLsAjqL4Q7us7rlFoO23h3jlBC8/WO7ImsKJErEKwlutQGIG6A8bCkzi0bzmIM0SnvPQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8100
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
Cc: Hari.PrasathGE@microchip.com, Manikandan.M@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLA0KDQpPbiAzMS8wMS8yNCA5OjA1IGFtLCBEaGFybWEgQiAtIEk3MDg0MyB3cm90ZToN
Cj4gQ29udmVydGVkIHRoZSB0ZXh0IGJpbmRpbmdzIHRvIFlBTUwgYW5kIHZhbGlkYXRlZCB0aGVt
IGluZGl2aWR1YWxseSB1c2luZyBmb2xsb3dpbmcgY29tbWFuZHMNCj4gDQo+ICQgbWFrZSBkdF9i
aW5kaW5nX2NoZWNrIERUX1NDSEVNQV9GSUxFUz1Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvDQo+ICQgbWFrZSBkdGJzX2NoZWNrIERUX1NDSEVNQV9GSUxFUz1Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvDQo+IA0KPiBjaGFuZ2Vsb2dzIGFyZSBhdmFpbGFibGUgaW4g
cmVzcGVjdGl2ZSBwYXRjaGVzLg0KPiANCj4gQXMgU2FtIHN1Z2dlc3RlZCBJJ20gc2VuZGluZyB0
aGUgUFdNIGJpbmRpbmcgYXMgaXQgaXMgaW4gdGhpcyBwYXRjaCBzZXJpZXMsIGNsZWFuIHVwIHBh
dGNoDQo+IHdpbGwgYmUgc2VudCBhcyBzZXBhcmF0ZSBwYXRjaC4NCj4gDQoNCkkgd291bGQgd2Fu
dCB0byBrbm93IGlmIEkgY2FuIGhhdmUgdGhlIGV4YW1wbGVzIGluIGRpc3BsYXkgYW5kIHB3bSAN
CmJpbmRpbmdzIHNlcGFyYXRlbHkgb3IgaWYgSSBoYXZlIHRvIGRlbGV0ZSB0aGVtIGZyb20gYm90
aCBhbmQgaGF2ZSBhIA0Kc2luZ2xlLCBjb21wcmVoZW5zaXZlIGV4YW1wbGUgaW4gbWZkIGJpbmRp
bmcuIEknbSBhIGxpdHRsZSBwdXp6bGVkIGFib3V0IA0KdGhpcy4NCg0KPiBEaGFybWEgQmFsYXN1
YmlyYW1hbmkgKDMpOg0KPiAgICBkdC1iaW5kaW5nczogZGlzcGxheTogY29udmVydCBBdG1lbCdz
IEhMQ0RDIHRvIERUIHNjaGVtYQ0KPiAgICBkdC1iaW5kaW5nczogYXRtZWwsaGxjZGM6IGNvbnZl
cnQgcHdtIGJpbmRpbmdzIHRvIGpzb24tc2NoZW1hDQo+ICAgIGR0LWJpbmRpbmdzOiBtZmQ6IGF0
bWVsLGhsY2RjOiBDb252ZXJ0IHRvIERUIHNjaGVtYSBmb3JtYXQNCj4gDQo+ICAgLi4uL2F0bWVs
L2F0bWVsLGhsY2RjLWRpc3BsYXktY29udHJvbGxlci55YW1sIHwgODUgKysrKysrKysrKysrKysr
Kw0KPiAgIC4uLi9iaW5kaW5ncy9kaXNwbGF5L2F0bWVsL2hsY2RjLWRjLnR4dCAgICAgICB8IDc1
IC0tLS0tLS0tLS0tLS0tDQo+ICAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL2F0bWVsLGhs
Y2RjLnlhbWwgIHwgOTkgKysrKysrKysrKysrKysrKysrKw0KPiAgIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21mZC9hdG1lbC1obGNkYy50eHQgICB8IDU2IC0tLS0tLS0tLS0tDQo+ICAgLi4uL2Jp
bmRpbmdzL3B3bS9hdG1lbCxobGNkYy1wd20ueWFtbCAgICAgICAgIHwgNDQgKysrKysrKysrDQo+
ICAgLi4uL2JpbmRpbmdzL3B3bS9hdG1lbC1obGNkYy1wd20udHh0ICAgICAgICAgIHwgMjkgLS0t
LS0tDQo+ICAgNiBmaWxlcyBjaGFuZ2VkLCAyMjggaW5zZXJ0aW9ucygrKSwgMTYwIGRlbGV0aW9u
cygtKQ0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9hdG1lbC9hdG1lbCxobGNkYy1kaXNwbGF5LWNvbnRyb2xsZXIueWFtbA0K
PiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9hdG1lbC9obGNkYy1kYy50eHQNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9hdG1lbCxobGNkYy55YW1sDQo+ICAgZGVs
ZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvYXRt
ZWwtaGxjZGMudHh0DQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9wd20vYXRtZWwsaGxjZGMtcHdtLnlhbWwNCj4gICBkZWxldGUgbW9kZSAx
MDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS9hdG1lbC1obGNkYy1w
d20udHh0DQo+IA0KDQotLSANCldpdGggQmVzdCBSZWdhcmRzLA0KRGhhcm1hIEIuDQoNCg==
