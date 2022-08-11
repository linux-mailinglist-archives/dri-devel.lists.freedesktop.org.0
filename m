Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1AE58F79B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 08:27:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D49A3791;
	Thu, 11 Aug 2022 06:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 495F1A2E5D
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 06:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1660199205; x=1691735205;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=640R792qt4o2P4zUb5kyJsbn8p2pHhO+FDoDkSu+9oI=;
 b=hfXmqiD132aXPvkuWJdpzmJUEr/QlbtcFatEw/z5bymVsbAKJF7jwsSs
 O6dRZfN7Uae/8hD3yLIk0BDPXDjEcvfWgFTkyPmrSCaz0/64DYOy7qjUz
 5JrfmLUHWEXqG6O8EpGZInGioASmLnSU1Tuw64Pwws2pY0zWX85S+6V1K
 RnItJVTjsBMHL0BYcalbXZ2xQaIpJbaFN2LZHttrLp2tJbChgMLLkdEA1
 QIsANjJ5LESh136E+2NGxdqWjRZgaR21Z7r9hJW0t6VVtg0BMSVRxgnQG
 NTe+9zFMYo/ELTjidFVVa6thW2QIFdDktueLDwobvW81mgXFl6ANw4pV1 g==;
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; d="scan'208";a="171949565"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 10 Aug 2022 23:26:42 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 10 Aug 2022 23:26:42 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 10 Aug 2022 23:26:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lcWDHDkBowWCc896D/39BaDJQJRyALtZXnmHSvGHm5r2e6zNF0BXo/ChgzcWJ3CT4LCcrXxvghlqehQ6EhAJnjFdKR+VmGIKBdoaEylCmoD+++711szkd5D3UAlOCgomHdaUJSDDpeTiAOcry7RPmcQ4mpR0xNrZHYtSfklG9U4ON0s8wq5AEJ2S41zP46JQiI/NKLXyG0AA+/+dyqfVrhbIb1bt0/oP04dR2inmQ+ylFuDRX+YlBt0Xe5CgTwN/AQZB8hL5daFKqDJXDf/6ngV2v9dE9A4NEbS6GDidDOrWlx+rkX+zvbEF+2kT6Biwe+uwEGAHpiFOqx6jGEoKsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=640R792qt4o2P4zUb5kyJsbn8p2pHhO+FDoDkSu+9oI=;
 b=J08D0xQDt3JBABcrpa7PEntSZYzy1BMGTvdSBfE3v9y6jntPfzXCfegXRxlrRBMrgp4BfE7UkaymLPM5lPuUREL5H1rz/laBMg7x3U5VOjhA3r7tJFYCBNNdyxl3VD7FqniXTBOHs82bLLJ3cBxZSdSSJWooDE7U5LQd0xHAyq1FswsRQmLVMvR5j2nk62kA1qBqK3f7MEr5KipDaoQSoIWlKMr8uEJn2s5FD7LZrv/N0FFm0dcsePy8Y5ETZX+pRQwiEQfGJ5ixB8Ny0heaOlqg5tEYrGdkGtZqeiotzPQft2KCtEDFGUw6/yvYabAxcwV78G+AbGNHfZH20SDGoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=640R792qt4o2P4zUb5kyJsbn8p2pHhO+FDoDkSu+9oI=;
 b=L9lOsGGW3sbERw+PX4iC3rzKPjnXOagCRb4a9sG5WIbWMj/6feydtfpUYBQdwDDflk2inNVvoyDM3bSr1Gxi47XAuVMi6elfm/jSoFZbMx2YwQOUskOdwvwqLWOS30F/tbXcTfBjGTQwmEGXZdRN7tLyOUXDWCmS7rDXt0vwUak=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN7PR11MB2579.namprd11.prod.outlook.com (2603:10b6:406:ab::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Thu, 11 Aug
 2022 06:26:39 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Thu, 11 Aug 2022
 06:26:39 +0000
From: <Conor.Dooley@microchip.com>
To: <palmer@rivosinc.com>
Subject: Re: [PATCH v5 00/13] Canaan devicetree fixes
Thread-Topic: [PATCH v5 00/13] Canaan devicetree fixes
Thread-Index: AQHYkLmL7CYc+NRsR0eTQHc1KpCiaq1+edOAgAAB/ICAIkqWAIAIIbEAgACNBIA=
Date: Thu, 11 Aug 2022 06:26:39 +0000
Message-ID: <6312b182-1f7f-270e-d5bc-853627d5f0f0@microchip.com>
References: <mhng-1373d9c2-ae29-488e-b2c1-032ab2cd52ba@palmer-mbp2014>
In-Reply-To: <mhng-1373d9c2-ae29-488e-b2c1-032ab2cd52ba@palmer-mbp2014>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a99e9fe-ba7a-4a14-4c31-08da7b6272ef
x-ms-traffictypediagnostic: BN7PR11MB2579:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QNiuAypMs1EoLsvQNi4j6pGulm63/pFUV6PB2+4E5izY8Rm4/hCINiFMByB3Y1rjmdfijuqU4tKXk6zGF9fx9MUzGRxHMsyKkx9lGvlgSN7z+j9fSZprlapfpfJKLr/pUu1f9C5mxEjbc7g0pLmJIDjs638dAAnlbzYWAIQ3jyO3iTNNb+vxbtt+ilgoNWxaANbZBJN7GfVizdILEtpQ7lyfsHGTjS0ebLvZfhhVSY7kd1egFv1ftpde8RXly5TxBz6/uPagljonmRNV92NSaTjgkMaC2ZaOa6ALBX/54WYUMn96wEu1/ufR12ge7kxttEt0ppHoKaKWE491V4mTfjn+Qzl4HtrC8NHvSnj128T0PK33aO5nCrT9fgHrt9exJDROR9tRZgw85MN96noYYzYs9kZ83sG9YJrvk/QUnv5wQW62veCc1X+b7jSAkmYj7OMOjRR1txM3WX+Rp6rQbLbXB8YzBlO2FBV97nAFJ3A31rRhm7pnRgTSBlQfJnKwjKI2SKh9/0qbu/jmtkTIIDsvu2pZV5brhmaAlQoBCB7CC6bJ5ksnzWRz1U/1ls/duHfjwxY61I2G6jA4St6cQtm5XQYQcgtKX1xcrfIYSE34qufG0Ixqy53PceNUUG0NC3zYXeGb81pw2c44CNDQEUuprtGqRXXXMG4YCrcF5XAZza77HQxJ8u1ev2xSxi+C8CMaryYvOkx3maJuy3H8Rmm48HcZhdNlFUg6ja5S2jcp3UQ45CmCLyVdIrzhSBpNSR+dlv0LOkBsg8qsUwauZ6xzilXDt6CkaOqY7/B4DYW/5HJE74jUccfwvS88mNrr5GILBUFBZKX8UPvECZ+mKh57OGvYL+/Ze4naRIB034o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(376002)(346002)(366004)(136003)(396003)(8676002)(54906003)(6916009)(4326008)(36756003)(31686004)(66946007)(76116006)(71200400001)(6486002)(91956017)(66446008)(316002)(66556008)(66476007)(64756008)(8936002)(5660300002)(53546011)(2616005)(86362001)(31696002)(7416002)(41300700001)(186003)(478600001)(2906002)(38070700005)(38100700002)(6506007)(6512007)(26005)(122000001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Rjg2THBRSy9NNFhDT2tKTENDSmMrWjE0ZFJWeDRHMUdFUUFsWUl5b2hkR1Ay?=
 =?utf-8?B?bUlkNTk5U0p3Nm5YWWZnNStwbmtoSFBMZ3AvYityekFEQzJlUVZJRTBZM2t3?=
 =?utf-8?B?Yk5iSDdXWUgzTEdXRWVYUERRL2gyYTBTMG5PRFpGR1lzV2ZMcjBlWUFDQjhm?=
 =?utf-8?B?Vkp6eER1RmZ2Y1ZqWmh4QW1CdHRMKzcrNUZhZy83SEtBY0psL0tLZmNDZzJi?=
 =?utf-8?B?VlZCWlVBclNTVFhCQ3UxUVMxMkYzR2h2Ry80RGJOem9KNVkyWnVkQllLTkli?=
 =?utf-8?B?ZW5UOHVUK3JGRzBYd24rVzJ6S044MngvVEx6NUdSbUo4QXNiWUNJWmVVc2dF?=
 =?utf-8?B?NU1WTzNRMEVOWTVNbHE0WE1rb1RvQ1ZMLzJEZXFTTndSLzFvMkVYVnJVR1c1?=
 =?utf-8?B?Uld0blRBSnowdWYzWlU5VmZGQ1lvL2FxY0FYUzYvWmlobmFrQWNxQzUxVnp3?=
 =?utf-8?B?dSttbzdHeWc4andHU1FZZzAxenJqczhNWG9aRUZ3WGxwMzliUnFwT3RPblhv?=
 =?utf-8?B?QXRKVElEUkhvdFFmR3NuN1ZCMnByZGxjVnpXenRJcVhRaDQvbE1yM3UrUElt?=
 =?utf-8?B?YS9jRis4N2tsNCtxSnBka0psQXhmVHllZlAzdWMwNnRrSnNIMHdWUllxWnE0?=
 =?utf-8?B?UWdEN3laNFFRcWo3Uk5nTUZBS2IyQmFnQTdDMGloTThVR1hnZncybW1yQU1r?=
 =?utf-8?B?L0I2T3EwMlFHdzJLYnJpeldsSXV0UEE1QXZZek9iUGhFaENyZGg1L3hXL0o5?=
 =?utf-8?B?N2VBd1NhWm5sRDRjSUFWZ0l5TXhKK3U4emwrMlBZVFJNWFpMRDZoWUlhN1hn?=
 =?utf-8?B?b05nZnJ6c3YwMW9GR0tnUU5EdnNlek5KY0orS2JHaG12MmsrK3YxQUkySVBx?=
 =?utf-8?B?aFY3YlRYRDVBa0JXeDFlb3RraXNVbldob3RVUVQvZzVnRXhPVXZFVzMzNmFW?=
 =?utf-8?B?MThSdDVBUWJFMkdUY2RSTlBoT1ZIMVBhczM3UEE3d1ZyTUZ0NlFkWVYvdGg5?=
 =?utf-8?B?bklwS0VYVys4Ky9INUNIOFVMbEtMRU4wM1psWVBqd0kwOVl1QS8rQkNuOFpO?=
 =?utf-8?B?ZzlUUkVrY0RJYmpkd2gxcTNPMmxxdW9iWmZEV3pTcUNVemNmbERnbklPcmN4?=
 =?utf-8?B?K3J6QVJNbTRNQVZjMXJxdWRRWVAzUXMyK0tpeDRFWUNoTFAzUmZPZm1xQm1x?=
 =?utf-8?B?Q2o5Zjk5bFllMTFteHlBZENUeDhTUGdEV0VpazYwU2ptVGJZUEljYTIwZ01E?=
 =?utf-8?B?dlBhcHViNnVPRUxITVdzU2VsK1ZjRlZONVN0ZEtvMG1kQ1VsQytEZnYzRXVH?=
 =?utf-8?B?U3JqWkhTRDdzYjZWOE9raVNVM0hsS0FTYXhoNDN2Y0xRQW1BeWJZSE5EdmdB?=
 =?utf-8?B?OEF6RWFPSW9BSjMzZW5CbU1MdXlybmJ5U0FFYWhNaWYzZXRhOC90Qkd6NXRO?=
 =?utf-8?B?bFN5L2RoOTE4czNxRkVYeFZFanpiNjNaQzMxWlFhZlFWWFA3ZVVzZ0c3UEJY?=
 =?utf-8?B?SXp1Vyt0akxJSjA5Q0pxZ1RHVlZ6TjZIRGxPS09UVWk2aGRqaXBTWFFWbTRk?=
 =?utf-8?B?K3h4TEx5bGRqM3A1RUJ1WXJRdGF5WFlCWVNLYUJNSjJYdEovb2ZIWHYxNHls?=
 =?utf-8?B?Uy9LaGlmS2FiaS9pQ3BBVU8yTkdkRHp6emlkbWlqZ2dScEFDdlVPQjF6bWM4?=
 =?utf-8?B?VUJDZ2tWSXY1NHpzWjkyYTZwM0Vwcnp1bkF1QlNzejZkOUJtL3V4Nkx6eWxE?=
 =?utf-8?B?SlJtaGN6ZmFUK0VZTExvWmx0b1NCSjQ0dHltbkx5bXN0OEdPaHdpenZLWVJK?=
 =?utf-8?B?OWxUaytmYlhhd3V3NDVQemcxZXNMZmRRelRyZnNBQjNTaGJNdnAyQ2p5THRi?=
 =?utf-8?B?aDMwNzF4RDRRU003V2RPS1R3eWRUQjZkaVIvc2p0RUt0OFVEZURENFJ3aU5B?=
 =?utf-8?B?SHRIa2FhWUpRS0p0a3YxVDBGTEljZHM1OWtXOEJKMmMrUEllTVBxREZkbWxH?=
 =?utf-8?B?MzZPRFhUVjVrQUMwZGdKSzgxclpUQlZWWXVHSmwyRytocU9pa2l4NU9DSzNy?=
 =?utf-8?B?d3UwZFhuRVZVY1VtdFE4aWlyOExtQkJoZ1NJbjlUcHEyb2VXclVRSWowb0M4?=
 =?utf-8?Q?F2ZT5MzP7IRoKzXlx437MFXpx?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EBFAADBC12FF164E9B6F1ADC0C751C94@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a99e9fe-ba7a-4a14-4c31-08da7b6272ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2022 06:26:39.1174 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LwWBlARF3jspbNMicZa2KnrjjYSR6rgdjAxNfzri6tFMVEy36drvwYVMq+tRKjZAaxPDYjyX1H+Wd6RKCnfDgJH8F8N7lYO/kaIZ+RpKs+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2579
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
Cc: niklas.cassel@wdc.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-riscv@lists.infradead.org, sam@ravnborg.org, masahiroy@kernel.org,
 daniel.lezcano@linaro.org, geert@linux-m68k.org, Eugeniy.Paltsev@synopsys.com,
 devicetree@vger.kernel.org, aou@eecs.berkeley.edu, robh+dt@kernel.org,
 paul.walmsley@sifive.com, dillon.minfei@gmail.com,
 linux-kernel@vger.kernel.org, fancer.lancer@gmail.com, vkoul@kernel.org,
 dmaengine@vger.kernel.org, damien.lemoal@opensource.wdc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvMDgvMjAyMiAyMzowMSwgUGFsbWVyIERhYmJlbHQgd3JvdGU6DQo+IEVYVEVSTkFMIEVN
QUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtu
b3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gRnJpLCAwNSBBdWcgMjAyMiAxMDo1MTow
MCBQRFQgKC0wNzAwKSwgQ29ub3IuRG9vbGV5QG1pY3JvY2hpcC5jb20gd3JvdGU6DQo+PiBPbiAx
NC8wNy8yMDIyIDIzOjExLCBDb25vciBEb29sZXkgLSBNNTI2OTEgd3JvdGU6DQo+Pj4gT24gMTQv
MDcvMjAyMiAyMzowNCwgUGFsbWVyIERhYmJlbHQgd3JvdGU6DQo+Pj4+IEknbSB0cnlpbmcgdG8g
c29ydCBvdXQgaG93IHRvIG1lcmdlIHRoaXMgb25lLsKgIEknbSBub3Qgb3Bwb3NlZCB0byB0YWtp
bmcgaXQgdGhyb3VnaCB0aGUgUklTQy1WIHRyZWUgYXMgUm9iJ3MgcmV2aWV3ZWQvYWNrZWQgdGhl
IGJpbmRpbmdzLCBidXQganVzdCBmaWd1cmVkIEknZCBzYXkgc29tZXRoaW5nIGJlZm9yZSBwdXR0
aW5nIGFueXRoaW5nIG9uIGZvci1uZXh0IHRvIHRyeSBhbmQgbWluaW1pemUgY29uZnVzaW9uLg0K
Pj4+Pg0KPj4+PiBVbmxlc3MgSSdtIG1pc3Npbmcgc29tZXRoaW5nIGl0J3MganVzdCBwYXRjaCAz
IHRoYXQncyBiZWVuIHRha2VuIHNvIGZhciwgdmlhIFZpbm9kJ3MgdHJlZS7CoCBJJ3ZlIGRyb3Bw
ZWQgdGhhdCBvbmUgYW5kIHB1dCB0aGUgcmVzdCBvbiBwYWxtZXIvcmlzY3YtY2FuYWFuX2R0X3Nj
aGVtYSwgaWYgdGhhdCBsb29rcyBnb29kIHRoZW4gSSdsbCB0YWtlIGl0IGludG8gcmlzY3YvZm9y
LW5leHQgd2hlbiB0aGlzIGxvb3BzIGJhY2sgdG8gdGhlIHRvcCBvZiBteSBxdWV1ZS4NCj4+Pj4N
Cj4+Pj4gVGhhbmtzIQ0KPj4+DQo+Pj4gUGF0Y2hlcyAxICYgMiBuZXZlciBnb3QgcmV2aWV3IGZy
b20gdGhlIERSTSBzaWRlIGFuZCBwYXRjaCAxMg0KPj4+IGRlcGVuZHMgb24gdGhvc2UuIElmIGl0
IGNvbWVzIHRvIGl0LCB5b3UgY291bGQgZHJvcCB0aG9zZSB0aHJlZQ0KPj4+IChhbmQgcGF0Y2gg
MyB0aGF0IFZpbm9kIHRvb2spLiBUaGUgb25seSBvdGhlciBvbmUgaXMgcGF0Y2ggNCwNCj4+PiB3
aGljaCBoYXMgS3J6eXN6dG9mJ3MgYWNrIGFzIG1lbW9yeS1jb250cm9sbGVyIG1haW50YWluZXIs
IHNvDQo+Pj4gdGhhdCBvbmUgc2hvdWxkIGJlIG9rYXkuDQo+Pg0KPj4gSGV5IFBhbG1lciwNCj4+
IFRoZXNlIGZpeGVzIGhhdmUgYmVlbiBzaXR0aW5nIG9uIHBhbG1lci9yaXNjdi1jYW5hYW5fZHRf
c2NoZW1hIGZvcg0KPj4gYSBmZXcgd2Vla3Mgbm93LCB3aXRob3V0IGFuIGF1dG9idWlsZGVyIGNv
bXBsYWludCBldGMuIENvdWxkIHlvdQ0KPj4gbW92ZSBpdCBvbnRvIGZvci1uZXh0Pw0KPiANCj4g
VGhlc2UgYXJlIG9uIGZvci1uZXh0Lg0KDQpTd2VldCwgbmVhcmx5IGNsZWFyIG9mIGR0YnNfY2hl
Y2sgcHJvYmxlbXMgbm93IDopDQpUaGFua3MhDQo=
