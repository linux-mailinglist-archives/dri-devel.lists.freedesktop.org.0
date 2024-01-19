Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFC78325D7
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 09:41:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F83B10E99B;
	Fri, 19 Jan 2024 08:41:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 488BB10E993
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 08:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1705653673; x=1737189673;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=IcPAsYyb8agVNnqTKryYS5Rg90OgTBUYYVzfBKNm/5E=;
 b=1oi/ia8WB+UrswcuXcq755H/YMtumds4Cz9zvJqDVCj/hXpVSxEnKwoS
 ieM/ATdoeayf2cv0EGi7nus/4ntnn6QgTFHhvttE+JDiA0xC61qxXGCrk
 a9uGrLMyf646/pFzhxIoJCtmh3GE5qyGYZB/21FdILR7Ny4NZ2SvQ5FM8
 lU7jvjQUMH25EcaG/QUWq7ZUi8LqcKSATs1+rWtUCnp6Kd4QPfe0GV9mf
 cU2Ya6uQDU8hjqm8vLhtzPvQSELUdhIAeuSLioBRDec5h7sekwCzGZVer
 DqFYyJbqUuAVryuKqojlN3OZ9xPrW8mYWINhPlgqbf547vkfJvmI4eZRa A==;
X-CSE-ConnectionGUID: RtxeGdiTQi2EA5IUfTpDHA==
X-CSE-MsgGUID: YefU/4fSQo+lq3HZihisNA==
X-IronPort-AV: E=Sophos;i="6.05,204,1701154800"; d="scan'208";a="182227076"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2024 01:41:11 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 01:41:10 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Jan 2024 01:41:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KUtZOLHTalZHl2+REqN8+v8STYXvNxYrApc8VFVVXvuJdSkjRtQ6x9DE/O/NwYwBEpu6fqAlx9UHpYo9RQfsDM824TANRv3hu57o3P3st/D9rhyWWJmH8VCJEDIrq6Xi5NtCmcYu7Y9PAwFkfECIX72ijuHIenS7Ql+6EPB5hEk/k5CnMRN8n6N8NJGG9V1X2BO/L4ohcUFFUPQSmXm5CmqZDNf9a7R4HDNXpsBFt+P1E2CxEzPhew6pJwegoUYVWDQckoQCzZ9w1axuuQcKOUrvQeLz48IL4q1Jus4TyJZSG0HnjAwqR6jUjxaUvGjWxU7Hg8Z/TBIOLJqnrwyf8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IcPAsYyb8agVNnqTKryYS5Rg90OgTBUYYVzfBKNm/5E=;
 b=K8o9vEbM9L+enTUUxtXGbzs32eBcigf/oF4iHq9QL96SF+XOEHA2SB4DG0xVa1OVJEYkqmaC8VKG3giEHcGPJtdK+5w3LNJnUyFHdvfPKJlgwiTCaeumdg31dSporNalUHONsm5kR1vpQZziLmY0d43CpaDWxIKXNZN/BKWVnyjwxyg6If3OeMGxU32TC152QgSkRiP5LsiVxM2sFqqHzYEsk/ZbqB8WvwqGFqhTol5sLM0iGPjBvqyZMAKBRzQ2xnEjqQeaqebMenNYh+ACDgJLRmmf9Lz05OGCUP1g3C+drUK/U5LkXoO3QUL1YAveB2Sez6VHeSl8ZAN/TkREXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IcPAsYyb8agVNnqTKryYS5Rg90OgTBUYYVzfBKNm/5E=;
 b=RiFIXUTA3T2Bjg1S83g6dtEznbdQ+W635mGN/2RDzmDdABOKb2r54O77aA4hlgj0l9WU+TC6hWeqI20w9cEKVybI9c7hVRyTfi8ftquK3QVuazKO0GV7fi6V3Zo867Cjp9sTJQKkjOqNPClq//6NfrxOwiNseMybCPOokLKUvRdGasUS3LgTbOgQotpLup34ocQKK46FK1FPNMedURtlP59gzTMr57ZJFfFGYRJ4hYWifcnq30OJL5SIPPlF4K3mzqCyFRNTGpfUALmF7rDuB9SwvulDJJzvsXFWEM5UoWys8LiQxzjYHkT0jLMsBKEosYNofMqA8kEoSm1ark5Xiw==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by PH7PR11MB7027.namprd11.prod.outlook.com (2603:10b6:510:20a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Fri, 19 Jan
 2024 08:41:04 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee%3]) with mapi id 15.20.7202.020; Fri, 19 Jan 2024
 08:41:04 +0000
From: <Dharma.B@microchip.com>
To: <sam@ravnborg.org>
Subject: Re: [PATCH v3 0/3] Convert Microchip's HLCDC Text based DT bindings
 to JSON schema
Thread-Topic: [PATCH v3 0/3] Convert Microchip's HLCDC Text based DT bindings
 to JSON schema
Thread-Index: AQHaSfBtFpABnI0MwEGuolZ8EVFW4bDf9cIAgADc1AA=
Date: Fri, 19 Jan 2024 08:41:04 +0000
Message-ID: <e308b833-8cfe-41c0-954e-f1470108394a@microchip.com>
References: <20240118092612.117491-1-dharma.b@microchip.com>
 <20240118193040.GA223383@ravnborg.org>
In-Reply-To: <20240118193040.GA223383@ravnborg.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|PH7PR11MB7027:EE_
x-ms-office365-filtering-correlation-id: 2aba715f-7188-4e98-a2e8-08dc18ca5f7a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZrDWEFsJyDlBoFw0A/iADArXWpGeAQ/qwsDcFF34W7zrlK9lSf3MpcxEUbGAKOJBJMLaf0Nhb2XoRlJJ+PniZUzv/aFSyQNVC/64ei2e1y/yTib58H+/7ywuaniRWbcP6LgVuxCYWYRcJ3hyzx8b+7Sko0uY8gC8kx/lS/4ZKNKmKQVqpBn9rQy5GOv8iiprJZ8NIZWMIaYkKbsWrYIfj6DDuF7lfPHUHVrbMuPLmIcms84JL1ksmIFkJ1oZn3oFEzj8vLuUDkAcvhvgHN+8T1fgiO6Owo//VSeFCdTIAl/14pUJlY/9H6tz1CXBsFzRecnts80iJtLO5cLG+I/khfX5qkx2ZM3+6VMHgyIvCbR/apmzZU91t61gVU5pCx/eL6Oa/M3AtqyVZtttk0pmyXtbhEtl+dIOEmig7fEMiT2Hf3oK8eZ35driMj6iE2HyEb8nXuhM4DtxJ1TpHO0IX8A6fi126YiZ0THE0Cn8zfMjxbtdd/JC/Gt4O74WZMQsHPde4FtkRzKNkboX8wVMQJ4/mJROJKIZKtyPv/4xf3fBLQDGKN6xp8RNsu01lvenQGJMj+rjwQ9cqFzoUarzN9bmqr8t4+OWv94iAxjp2wIR/qraHeWKLpJSvELQ22MAxfyNgyLleom1QlY+8yv2MD7Y5RcW0F0vG0Rb6jloJd0uA7nzPcWJ8A/iQUtt+qZwtTzEU+hEIB0xZXof0E+QUTcnwNIfRpSpXicEEY6Twa0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(366004)(376002)(346002)(39860400002)(230273577357003)(230473577357003)(230373577357003)(230173577357003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(54906003)(5660300002)(2906002)(7416002)(31686004)(4326008)(8676002)(8936002)(316002)(66946007)(91956017)(6916009)(66446008)(64756008)(66556008)(66476007)(76116006)(478600001)(2616005)(6506007)(6486002)(71200400001)(966005)(6512007)(107886003)(53546011)(83380400001)(122000001)(26005)(41300700001)(38070700009)(38100700002)(36756003)(31696002)(86362001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eUF0d0VIK2ZXakNHd1BUcU1oRjFBY2dKRmFYWmF4enJxL0hyWTcvZXcwRGcz?=
 =?utf-8?B?UlNoL0FtUnFmL3VTNTVURlJzYjg0NlFpVExvcDZKR25MMHU4QUEwdjVydVVS?=
 =?utf-8?B?V2FaaHdrNWZXaW45ZllUWTdjTy9xdnpQWlR6bHNjWGdXK211Z3Y5L1RZY09h?=
 =?utf-8?B?cG55MjRmQnZqRTZtTWluK0p4blpKT0YvKzhPQUZjaGJHWVMxMXlTR0JTdDhO?=
 =?utf-8?B?cWtLQnJPWjdOYi9RRHl0UjIzSG94UzN5VGU1OTg0N1F6WmhYT01MOUdQTmNS?=
 =?utf-8?B?MG9LUWlqZ0lHZDhYOEdwZHgwV2s0eEx3eEI0MGNMNnoxUzV4OU52TmYwV0Ju?=
 =?utf-8?B?d3NhRnpDa2RMTDlSRWx1L244QWI5cTlqN3VVWE8wS1YwMUNuNzI5emVuVGI2?=
 =?utf-8?B?ckViblZvYWhaV2Fia0hmVXRtM1NrVVpFODFieUNWZWNWeUpqY1JIditkeHMr?=
 =?utf-8?B?L1FvTWluVjBGd0QrbXRjTEJqUHJkNW9EQU9pZFJVWGIxU21WdW5pamFWcE1J?=
 =?utf-8?B?RC9EK0lVVTltWW9vSUZhQklVUitoVzkreHdMU0lCOXhKb1Nwek9QNk1iNzJK?=
 =?utf-8?B?dFN3djlYNHN5eWZNNXJsZmFRLzBTQktJQUFOWkNNVGUxMTByajhRS1pCdTRI?=
 =?utf-8?B?SG5GV01tWlRWVmJhYU1hWjhzV2pOM2NpdDI4WSsyOW44eG5pL1AxeWpqUzZv?=
 =?utf-8?B?N2lVVjlkSStJU2t1d29IVHVMTkV0c1Y3N0NYWW1vSVJMcFZhakdtenJnUXQ4?=
 =?utf-8?B?RHZlR1dRNWViZjdMcno2YnBiWWt2WWszbXlJUnlTaGR5c1FWeEpmZ21jRTRL?=
 =?utf-8?B?NXVYbFRENWhiWS81MFZVUStoZGJEc28rMGVqd2J1QTFieFlvekl1RnFSU3Vp?=
 =?utf-8?B?a1dJODlVR3BBUEptUzVuZUxQQXVZbjJsdUFyOUtzS2VVYW1mZUJRcWxOeTdr?=
 =?utf-8?B?UGw4aEJIS0g1bXovcnd2aHkxZUlpMUZQWXRaTm9jdlJESTFNL0Fya0hDMUpr?=
 =?utf-8?B?b1ZCMWNRSDVkdzA0QXpyK0o5MFp1RmxUdHkzaFRJcThqY29Sd2FrU3RmN0JX?=
 =?utf-8?B?S2NLaFNjRVh6aGdiRlVOeXJyRDFMYWowUTlaYUVEaU9SdTRsL3NCNGJES3px?=
 =?utf-8?B?d2tjVGpnWjFCdjRQWU1OWEhUK2R5dGZZTWJUaG1jZ1RWbk8vMmY1R1NUSzJu?=
 =?utf-8?B?ZlU1cHpkTURoTTdiZjRrSXYwU2NadElZV0J0L0NVU0N5Sk00VXZyRmdIUWJ1?=
 =?utf-8?B?TGdXd0tNdkFxNEE4bnprVUhKUUZHVFRQdGxiTTJ0cFY0L2UyQnB4NEpnL0Rp?=
 =?utf-8?B?bkRBOU0zL2Q2bHpjRnVaWUdOOTNLSE5taVFKb2wzUHZYaFBDTUZma0JzbVlD?=
 =?utf-8?B?T1kwaXFIOWNmUGRFbWdyU25ISHc0M1pOeWNsOXp4cFAxYkg4YjVwN2VEd0p0?=
 =?utf-8?B?S0xtRGxtM0NmcVJZMk42ODhNZHROejkyTUZVcHdsVU9xblZDYnc4Q1RJdU8r?=
 =?utf-8?B?ODY5bHRIQW9ZRFFjU04xMkpMNG1jay9xbExkd1dhcGxrQkRicGtnYkp0MU5w?=
 =?utf-8?B?cDRmbnBPOFg3NGx4Q3RrSDVzQm4rVlh2RGx3ZlZZem5RT0dTMTlFVXB2aGdR?=
 =?utf-8?B?R3Bra1VTN0NvUDk2cnU3emNLUFVrVzRMVk1QcXk5a2t1bis0Sm8zUkZLdVMy?=
 =?utf-8?B?TGJlazFES0VLS0lSS05Tc2xVM0R3SzBHZXd4bHVoeWRpQ3p1TFBkR0lKU1hK?=
 =?utf-8?B?Sm5LWndnYzJMNExQMVJqNGFnOUttS3JWQk9NcTFpR1hqQ3VJaXJmalJDN3gv?=
 =?utf-8?B?bnl0RU5Kcmo2MzhVdkp2eDB1RXhNY01TdWYzN1VLN1Q3K0xoR24ydjhmaWoy?=
 =?utf-8?B?eXQvTGNqQ2w4bEJFSGN6MjhiV3YvUHFFNlo3MGczbWVGMm1HdnBNblZBaGJN?=
 =?utf-8?B?blE1WE5jNnN3cjg1M2dnWTd2eVUwWU1QZHRScWdDUmtVNGlsNnlkNkR4L0x5?=
 =?utf-8?B?YTM2Zm1ZZDNCUS8xa0F3cVlhMzBNRVYrdTZQUEVBREFNc21Wd3grb0hNckdh?=
 =?utf-8?B?MVVmTGY4bVMvbEMzOUpmaFhXUlduSGp4Umh3NnNjNldtR0FGTHFmSFJxbW53?=
 =?utf-8?Q?l1HxuJllF3sAf0QMTOrocfXAC?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1E92E73D5A3BF04B9FE8933EE12CE74E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aba715f-7188-4e98-a2e8-08dc18ca5f7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2024 08:41:04.4023 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vl56lj2kESTWdB/vF/fJ8qKqYHJkpp2AtP4qoEvzCzPN80fw6xQKuASIwIFg2iiRL5jF1s0sOZogB+L90EWCWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7027
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
Cc: Linux4Microchip@microchip.com, linux-pwm@vger.kernel.org,
 alexandre.belloni@bootlin.com, dri-devel@lists.freedesktop.org,
 Nicolas.Ferre@microchip.com, Conor.Dooley@microchip.com,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 claudiu.beznea@tuxon.dev, airlied@gmail.com, lee@kernel.org,
 u.kleine-koenig@pengutronix.de, devicetree@vger.kernel.org,
 conor+dt@kernel.org, tzimmermann@suse.de, mripard@kernel.org,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org, daniel@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLA0KT24gMTkvMDEvMjQgMTowMCBhbSwgU2FtIFJhdm5ib3JnIHdyb3RlOg0KPiBbWW91
IGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIHNhbUByYXZuYm9yZy5vcmcuIExlYXJuIHdoeSB0
aGlzIGlzIGltcG9ydGFudCBhdCBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRp
ZmljYXRpb24gXQ0KPiANCj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBv
cGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0K
PiBIaSBEaGFybWEgZXQgYWwuDQo+IA0KPiBPbiBUaHUsIEphbiAxOCwgMjAyNCBhdCAwMjo1Njow
OVBNICswNTMwLCBEaGFybWEgQmFsYXN1YmlyYW1hbmkgd3JvdGU6DQo+PiBDb252ZXJ0ZWQgdGhl
IHRleHQgYmluZGluZ3MgdG8gWUFNTCBhbmQgdmFsaWRhdGVkIHRoZW0gaW5kaXZpZHVhbGx5IHVz
aW5nIGZvbGxvd2luZyBjb21tYW5kcw0KPj4NCj4+ICQgbWFrZSBkdF9iaW5kaW5nX2NoZWNrIERU
X1NDSEVNQV9GSUxFUz1Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvDQo+PiAkIG1h
a2UgZHRic19jaGVjayBEVF9TQ0hFTUFfRklMRVM9RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzLw0KPj4NCj4+IGNoYW5nZWxvZ3MgYXJlIGF2YWlsYWJsZSBpbiByZXNwZWN0aXZlIHBh
dGNoZXMuDQo+Pg0KPj4gRGhhcm1hIEJhbGFzdWJpcmFtYW5pICgzKToNCj4+ICAgIGR0LWJpbmRp
bmdzOiBkaXNwbGF5OiBjb252ZXJ0IEF0bWVsJ3MgSExDREMgdG8gRFQgc2NoZW1hDQo+PiAgICBk
dC1iaW5kaW5nczogYXRtZWwsaGxjZGM6IGNvbnZlcnQgcHdtIGJpbmRpbmdzIHRvIGpzb24tc2No
ZW1hDQo+PiAgICBkdC1iaW5kaW5nczogbWZkOiBhdG1lbCxobGNkYzogQ29udmVydCB0byBEVCBz
Y2hlbWEgZm9ybWF0DQo+IA0KPiBJIGtub3cgdGhpcyBpcyBhIGJpdCBsYXRlIHRvIGFzayAtIHNv
cnJ5IGluIGFkdmFuY2UuDQo+IA0KPiBUaGUgYmluZGluZyBkZXNjcmliZXMgdGhlIHNpbmdsZSBJ
UCBibG9jayBhcyBhIG11bHRpIGZ1bmN0aW9uYWwgZGV2aWNlLA0KPiBidXQgaXQgaXMgYSBzaW5n
bGUgSVAgYmxvY2sgdGhhdCBpbmNsdWRlcyB0aGUgZGlzcGxheSBjb250cm9sbGVyIGFuZCBhDQo+
IHNpbXBsZSBwd20gdGhhdCBjYW4gYmUgdXNlZCBmb3IgY29udHJhc3Qgb3IgYmFja2xpZ2h0Lg0K
eWVzLg0KPiANCj4gSWYgd2UgaWdub3JlIHRoZSBmYWN0IHRoYXQgdGhlIGN1cnJlbnQgZHJpdmVy
cyBmb3IgaGxjZGMgdXNlcyBhbiBtZmQNCj4gYWJzdHJhY3Rpb24sIGlzIHRoaXMgdGhlbiB0aGUg
b3B0aW1hbCB3YXkgdG8gZGVzY3JpYmUgdGhlIEhXPw0KPiANCj4gDQo+IEluIG9uZSBvZiBteSBz
dGFsZSBnaXQgdHJlZSBJIGNvbnZlcnRlZCBhdG1lbCBsY2RjIHRvIERULCBhbmQgaGVyZQ0KQXJl
IHlvdSByZWZlcnJpbmcgdGhlICJiaW5kaW5ncy9kaXNwbGF5L2F0bWVsLGxjZGMudHh0Ij8NCj4g
SSB1c2VkOg0KPiANCj4gKyAgIiNwd20tY2VsbHMiOg0KPiArICAgIGRlc2NyaXB0aW9uOg0KPiAr
ICAgICAgVGhpcyBQV00gY2hpcCB1c2UgdGhlIGRlZmF1bHQgMyBjZWxscyBiaW5kaW5ncw0KPiAr
ICAgICAgZGVmaW5lZCBpbiAuLi8uLi9wd20vcHdtLnlhbWwuDQo+ICsgICAgY29uc3Q6IDMNCj4g
Kw0KPiArICBjbG9ja3M6DQo+ICsgICAgbWF4SXRlbXM6IDINCj4gKw0KPiArICBjbG9jay1uYW1l
czoNCj4gKyAgICBtYXhJdGVtczogMg0KPiArICAgIGl0ZW1zOg0KPiArICAgICAgLSBjb25zdDog
bGNkY19jbGsNCj4gKyAgICAgIC0gY29uc3Q6IGhjbGsNCj4gDQo+IFRoaXMgcHJvdmVkIHRvIGJl
IGEgc2ltcGxlIHdheSB0byBkZXNjcmliZSB0aGUgSFcuDQo+IA0KPiBUbyBtYWtlIHRoZSBEVCBi
aW5kaW5nIGJhY2t3YXJkIGNvbXBhdGlibGUgeW91IGxpa2VseSBuZWVkIHRvIGFkZCBhIGZldw0K
PiBjb21wYXRpYmxlIHRoYXQgb3RoZXJ3aXNlIHdvdWxkIGhhdmUgYmVlbiBsZWZ0IG91dCAtIGJ1
dCB0aGF0IHNob3VsZCBkbw0KPiB0aGUgdHJpY2suDQphZ2FpbiB5b3UgbWVhbiB0aGUgY29tcGF0
aWJsZXMgZnJvbSBhdG1lbCxsY2RjIGJpbmRpbmc/DQo+IA0KPiBUaGUgY3VycmVudCBhdG1lbCBo
bGNkYyBkcml2ZXIgdGhhdCBpcyBzcGxpdCBpbiB0aHJlZSBpcyBJTU8gYW4NCj4gb3Zlci1lbmdp
bmVlcmluZywgYW5kIHRoZSBkcml2ZXIgY291bGQgYmVuZWZpdCBtZXJnaW5nIGl0IGFsbCBpbiBv
bmUuDQo+IEFuZCB0aGUgYmluZGluZyBzaG91bGQgbm90IHByZXZlbnQgdGhpcy4NCmNvdWxkIHlv
dSBwbGVhc2UgY29uZmlybSBpZiBteSB1bmRlcnN0YW5kaW5nIGlzIGNvcnJlY3Q6IHlvdSB3YW50
IGEgDQp1bmlmaWVkIGRpc3BsYXkgYmluZGluZyB0aGF0IGVuY29tcGFzc2VzIHRoZSBwcm9wZXJ0
aWVzIG9mIHRoZSB0d28gDQpzdWJkZXZpY2VzIChkaXNwbGF5IGNvbnRyb2xsZXIgYW5kIHB3bSks
IGVsaW1pbmF0aW5nIHRoZSBuZWVkIHRvIA0KcmVmZXJlbmNlIHRoZW0gaW4gYWRkaXRpb25hbCBi
aW5kaW5ncz8NCj4gDQo+ICAgICAgICAgIFNhbQ0KDQotLSANCldpdGggQmVzdCBSZWdhcmRzLA0K
RGhhcm1hIEIuDQoNCg==
