Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C09D459564F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 11:31:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72CD018B728;
	Tue, 16 Aug 2022 09:31:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8426F11355D
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 09:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1660642294; x=1692178294;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=cvl7F2wg5OwirEutbUrVs3ANWA+39erQI1g0eloiahs=;
 b=TyJ62aCiUipS0wqF9ZFAGR0LfCzCHXT1jHjQ3BBlQBrEYid3U6z6C5Rr
 h4H5o+IjzmoCQChVfkjLVJ1wuID272vi9JBsgeyLSqbbpK4SvXZBwALUW
 W/OL/TF8dO1lLQhrdSt8RriCX0S3YxH63wNFcoO4nLV9g/hQaTMvPU11v
 crhJuiRqcFrC7/Dw1wIcOXOOWGeCst9Po4JsQP/FbmoqsoJGEUPuNVSZr
 ABzzfE7DBVxDOBbE7+mX2KeVdLxjnamASaIW0/2rwig+pw3x6n3Ad39TH
 Soes0832HoKHzFFG2wsKehDUDGFnujBMGmKjCyJv11ntMh1fucKBu/yad w==;
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; d="scan'208";a="172638935"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Aug 2022 02:31:30 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 16 Aug 2022 02:31:29 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Tue, 16 Aug 2022 02:31:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1v0PJ3u7owO9YwmoXt8yFLNx94q9SwEXlOGp7RECxtMHXxAS2hj3rj4e1z8/XCWCdSiRHB3xDyKegIv4Cn1RIBZCVvg1S3eFZJ/2G+cb+FL15MFP+222iKJbjgs+diqQxsnpk3HL1+4nzAnsbDeY4QTkQobsU3B7qsObCKjrzIJxTAkI6QHZ7otMEly9pehKGvHZmgGBJZX6nzztEchBk3jSGzzBrHqv6nsX+tYvz8IhrzoKwH/odebpqyA2yoe37P8jOv8gnFJp/9r8RsmD5W84XttRiGDnlUHxgISlgewKNUeqkbHfDt/KCaH3MZ1S9Rk/Uy9H7XrrWkZ0o/jhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvl7F2wg5OwirEutbUrVs3ANWA+39erQI1g0eloiahs=;
 b=WDPn4wfuvvLAMVxCI/Kh1JmBCAYAARw0JJfOJp3z3eoKxy4+mA0X2BG5XQyAiq9ufGqrxvpIb2hsUuusJz2a9eW3LSGfGTcsgnAQulXkDNgtVNxNv4pOWJQ3J9p+klalHg01yO1j/9Fal/vZP5qns0Uc6/oZjWc35daj52F4LxBY+UNxtaYZYmVQTlgxEw/L2vuOxcLCnZuHUVTFFaXC3sZI1x3tjudw1OMokl4IxU9+ewCv+TTN7t9nz1/LO6JaenLCBLslyzVZ+HbQXqi7NZwRFKAxHQl0tHKPfFptOKvcXyCLDp1z7QdTOXsYtkRwzLmhnChsk3xp49LbnXZqPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cvl7F2wg5OwirEutbUrVs3ANWA+39erQI1g0eloiahs=;
 b=S/hzsPnhQI0lITsm/mdA8jG6boHhKPvc5Nn7k+ccunhm0mXA4PT7J0sE887csMS7MIusNobtEiKRbnvzvXW8OGznqFY/KDbCvEFrWaCO5nn3mQXE8fowTsUqGRtw3meBkslihpqoyNhMWGL6mG+U+eAdB6cXOPKDdUMvFjGU+JU=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM4PR11MB6455.namprd11.prod.outlook.com (2603:10b6:8:ba::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Tue, 16 Aug
 2022 09:31:23 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Tue, 16 Aug 2022
 09:31:23 +0000
From: <Conor.Dooley@microchip.com>
To: <krzysztof.kozlowski@linaro.org>, <mail@conchuod.ie>, <airlied@linux.ie>, 
 <daniel@ffwll.ch>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, 
 <thierry.reding@gmail.com>, <sam@ravnborg.org>,
 <Eugeniy.Paltsev@synopsys.com>, <vkoul@kernel.org>,
 <fancer.lancer@gmail.com>, <daniel.lezcano@linaro.org>, <palmer@dabbelt.com>, 
 <palmer@rivosinc.com>
Subject: Re: [PATCH v5 04/13] dt-bindings: memory-controllers: add canaan k210
 sram controller
Thread-Topic: [PATCH v5 04/13] dt-bindings: memory-controllers: add canaan
 k210 sram controller
Thread-Index: AQHYkLmpMN95aImTj0GtIyfn+RYzcq2xgzyAgAABI4A=
Date: Tue, 16 Aug 2022 09:31:23 +0000
Message-ID: <d1c1e2bd-39cb-4927-ac0b-22583ac7a420@microchip.com>
References: <20220705215213.1802496-1-mail@conchuod.ie>
 <20220705215213.1802496-5-mail@conchuod.ie>
 <d6acd450-a3bc-d5bd-eda9-9664e6beadf9@linaro.org>
In-Reply-To: <d6acd450-a3bc-d5bd-eda9-9664e6beadf9@linaro.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d46bb0f5-6465-40b1-35db-08da7f6a15f8
x-ms-traffictypediagnostic: DM4PR11MB6455:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: =?utf-8?B?NXJiVmY3NWs0OUNBOUxoOVlXYzdYOU9CRElFNjZYeHFmMjdITXY1TFZlM05H?=
 =?utf-8?B?SGplUkR5NEZrdVdUb3FabWtIOFgxMG9Pd0kralVIcGZqb0JLNktLRCttS243?=
 =?utf-8?B?Sm9VQlA0UFlINDM2blQwamN1Mld3aVErRFZKNytZZk9uUGxUKzBGYlVjQklY?=
 =?utf-8?B?a3czZWJlSXI2SWxyM3FXTVRQZWJmV1hIOHdENnRsSlZlYXhua3JheFQyTE5a?=
 =?utf-8?B?TDFzS1JzNVZJU2R6aWlpeWd5MjMwdG9mUFFhVmVGYVBxYUhvajV5bWlSak9C?=
 =?utf-8?B?eFpMcjVXZmZqN3NFaTl4WGRMRm1kOFFNQTN2QjkrVjVob2t2L29ZdjkxTTdq?=
 =?utf-8?B?Y21XT3Q1Q3FjbHN0cFJVY21qYkxuTG9ZdHJPR2VydXgvNjVKbjUxQU1vT0J6?=
 =?utf-8?B?d2VJRFpjYVdGVWZpSDR4RTBra2p0RE85SHNlR2pRUy9zQklPUlk4RkVrVFUz?=
 =?utf-8?B?SnV3WHR5WFhhUTk1b2ZieVhxQXpWdDQ3eDFGcXNLQlVSZG02THh6YWRJUVJM?=
 =?utf-8?B?Z2NiK0tJQ0o0RHVUUFd2NFR0R01hNGtWZDVmdGVZTVdhSDc1c2FHQkQ0YVFj?=
 =?utf-8?B?S2tjdDUrV2tJbElJQVlTZXMvZXF4V1UyaUZYMEw2YXFJbEwzY2lSWUw1Mklv?=
 =?utf-8?B?UDMrMUd1S3NiV1pRQlBmNHNOUzg2VVprV3VCZkg3ZktXTGp1Y1RxZXNwZG1K?=
 =?utf-8?B?RFZjdklXYlVqV29yTVcyMTUxdjZoNmg4c085Zkk0REJaOEZ5WWkrcjNMUkZl?=
 =?utf-8?B?T1E1bU83Q1dHQUwxMXEzbkltdlVTaUFrbjhQUmhqdndGTURPdkIzbTRGU1c3?=
 =?utf-8?B?SEMya1hwWjBwaWowMWZqZkdTNDRCRStHRmJCTWtKWEZ6RCt3L2M4UlJaQWhD?=
 =?utf-8?B?UGs4SzVEcHgrTEZ2RFNJblZkMFJORTBESjd6VHRtdjhpaVhHdTU3aG5meWYr?=
 =?utf-8?B?VVJ0RDcrMXpxT05ZOWhmZURtUEU0czgvNmNUSjk1WjRXaFZMYXhqMnUzRTlJ?=
 =?utf-8?B?dTFPdDNvRHZNZ3JOT2hVUVEzZzR4NWhubjduOFc1TWthVU5yYStmb2hSOGZn?=
 =?utf-8?B?ZUdzY3lUcDhwcmt1UzRkN2NUK1hoVkM1N1kxeFlaSHRINWwrZWtnWHhSNkkv?=
 =?utf-8?B?RjA2ejZxSHlsU0hsSUk0R2t6TU1iOFRMZWIyb3lITXVYcVcxRnA3QmI3OUdn?=
 =?utf-8?B?U0hScGVTaUFhWlZkU2czellOTHMxY1IwZWpjdTc1Z2ZGM2E5QmxaVFpJTmZ6?=
 =?utf-8?B?KzV5a1Vmc2VpNjFyMGVHc3VRWFhERHlKZVZlUTN0VDRUM0J1UT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(136003)(346002)(376002)(366004)(396003)(71200400001)(4326008)(31696002)(66946007)(122000001)(6486002)(86362001)(2906002)(64756008)(966005)(5660300002)(8676002)(66556008)(38100700002)(91956017)(8936002)(66476007)(66446008)(76116006)(316002)(110136005)(54906003)(921005)(53546011)(38070700005)(6506007)(36756003)(7416002)(41300700001)(186003)(26005)(31686004)(478600001)(83380400001)(2616005)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MHJ1Ni9DV0x6ckpXS1FOOWhYbHArQ1B6bVIwVWp5WjlTUTk0bjZhYithQ3Jh?=
 =?utf-8?B?MTJ2UHdCYXdOWW1tZTkvb0pESFR2M2E5QnhzNk1BeUNFVnNrV2xiaUdmZGpn?=
 =?utf-8?B?cEU2UjVTaVRLMUhRQ250Z1cyZE1YanhOT0lsaU9NVGJlaEdiOHFKdWprTG95?=
 =?utf-8?B?a2loZ2ZWNWhya0Ryd2NnMkY4TGhsT0tyOWl2VENvMDNKTmQ5OGtvVmVSVE12?=
 =?utf-8?B?bFZ3bEo1OE05YjZ4b0U2bDd3YUd5RTNvSWY2ajFQZ0hHQmdTcmIzYjgwWkJR?=
 =?utf-8?B?dUxCTW50dStpd0hNclB0cTlFWmFmMFNXVncxVDBVOHd2b2k5dktCMlFhZFZZ?=
 =?utf-8?B?TkJQaTYzVzFYMzVyRnU5TWlDTXVQY0oxbEEwUTBMd1RXL3E1K05mcU1IeWN5?=
 =?utf-8?B?ZW56VWo1NGlRbWVxOGFTaXdrNzdqYkxwd2ozZjVvM2pUeDU4YkZOSXlwNmQx?=
 =?utf-8?B?aDUyZzVmeFBlMFRHaXcySklRRTg3UTFHeWV5Z2xxbWh1TlBNc3BCcjh1c25M?=
 =?utf-8?B?d0NJaGR5V0wzeVJMMzd5Q1Y0ODF2SHVaU0FKZzYzR2txNFdMV1I4VjQzVjlH?=
 =?utf-8?B?QU5CVDhKVkVtZ05KQlNpeHdpSjBLbDYxckswV2pkVlAyR0ZBYnkvOXkvMENW?=
 =?utf-8?B?TEg2UWVwTVRWSkFUSTUycUdhNHdUd0o4aWVZbTU3ZGYrNkNEQVcvZXg4YS9D?=
 =?utf-8?B?cmllc0VFK2RxY2FwUFA1dnk2ZldsWnErQ0VxbEZMZ1p1K1IvZ0NPZEgrVUpH?=
 =?utf-8?B?Q3FJY0M0ZC9RZXlWWWp1Z1d5aFloTnZiM3lrenJ0Qldyd0VvaWxydmRicTNh?=
 =?utf-8?B?VEkxVzhjUTJUdFJocDNaMWJZTDVpSWpiNUIxbllJaGk0YlpCeFM0TFpBME9a?=
 =?utf-8?B?eVFIdmp6YWhuV1VmaU9xVU0xWWZWNUNGczF0MmVsUVYzN0NFZm5PZU56S3Qx?=
 =?utf-8?B?Z29jdmdXc1NGSUNtVnMrczhqWFVrUFhBemZPVkI2dnJyUzRWb3c4OFlyYzBG?=
 =?utf-8?B?ZVpPcFlUSTg2WEp3d0paSXBFL0RxZVd1TTh5SUVobndHaE1UbklUc0U0Wmdo?=
 =?utf-8?B?bkJYbzNLOWV6bGQ3NWVFb2MyQmhNRXF3M3hReisvb3RtcUN3NW5vSEF6OW90?=
 =?utf-8?B?MmdXNzZZM3JKR3dFakxzTkUyMml6b0QzTWRJQnM1cW51cUlEVEM0bXF3RjBL?=
 =?utf-8?B?ZHV1MVI0bmJMSzhrc3JXcThxM210SVdtY2UzRUNyUDlwbTdaeFNIaDRYK2Q0?=
 =?utf-8?B?YWdCejU5SEwySWNsS3AzN3E0M3RDZVdkV0NuYWRtMVNObUhJQlJ0KzI0WDhr?=
 =?utf-8?B?RnFGZm1SazlVVWkvYVBxWUtSTW8yWnlZbkRCMDlDZ1g3Uk90MDNkNTN6bmtx?=
 =?utf-8?B?R01GU25SZC9XbFRCOGFZU1ErUlFjcGF2a1JReU5PZlRMNm1aTmpRZlpVQXJX?=
 =?utf-8?B?Mk1TUEtnOW81Nzd3amZiaStoT2pWclNmaWorQXdMRTNWdWJ1bWpRcmVkM21E?=
 =?utf-8?B?ZDVEWXhiSXFxWE1uek50THRLSW50ZGdHeXZ0cVljL2FjbE9vZXhhdStFQnJO?=
 =?utf-8?B?Y2toQnNyTHM0NzkrRkpqdngxVDhnSXRRNktrVnkyN2NwdFJzd2NtcVpIZUtr?=
 =?utf-8?B?N056MzZlU1lSRFB2c2pOUm1VakJnWHJLcTVvWG54L2dkaGVkUU5IUGRDTE0z?=
 =?utf-8?B?ZFE0WFY3bFZGTkhKenFEd0dSU0hhaWJiMGgxUkd2T0VkTlVsSVJoaks3di91?=
 =?utf-8?B?MFBVUFdDdkhDVmlmZytScDMydWhLYkF4emlTNUUrOVRiYys3L2wwd3FUS2dI?=
 =?utf-8?B?c0poOGc2UTdRTnZpcGtNZ1J2OWxIUXZxWW5neTJrWUVFMXdBVmFyMFQxak5s?=
 =?utf-8?B?b2RqeEJaWmluOUptb2V5OFRYYVRXZDlxa3NIblVpS254UEhOdktpS3YvMktQ?=
 =?utf-8?B?RHZ0S04zZ0thRitWUklEc0VSTVF5UjJQa0hDaE5UN21WUm1EREtuTzI5d0dy?=
 =?utf-8?B?WjhuNzZvNlhJWVZNZndhQTNvOE5LOTExRjlXSFZnQjFxT1RrQ2psLzM2emNV?=
 =?utf-8?B?bDZvSysrSUtPT3ZzU0RsdzdHb1JYQ01zNnhTc2hwb3o4d2xzSWJBQlhXWDQ3?=
 =?utf-8?Q?Zg7KHUuqP4YKw/heX6WxA3+RF?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AFD0A215B29FA340AD1ED976E0028589@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d46bb0f5-6465-40b1-35db-08da7f6a15f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2022 09:31:23.7726 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VBAjfImDD+83rb3G5xlCAtowaH154LPgcCfNQrBa0QaBK2wnK8qgKQpL7x/R6yi6tgF8JeTpOZSp3gTnHxuiI4eUyq8yO8PXmTtXHkggOBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6455
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
Cc: niklas.cassel@wdc.com, aou@eecs.berkeley.edu, devicetree@vger.kernel.org,
 masahiroy@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, geert@linux-m68k.org,
 paul.walmsley@sifive.com, dmaengine@vger.kernel.org,
 linux-riscv@lists.infradead.org, dillon.minfei@gmail.com,
 damien.lemoal@opensource.wdc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTYvMDgvMjAyMiAxMDoyNywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gRVhURVJO
QUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiAwNi8wNy8yMDIyIDAwOjUyLCBD
b25vciBEb29sZXkgd3JvdGU6DQo+PiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBt
aWNyb2NoaXAuY29tPg0KPj4NCj4+IFRoZSBrMjEwIFUtQm9vdCBwb3J0IGhhcyBiZWVuIHVzaW5n
IHRoZSBjbG9ja3MgZGVmaW5lZCBpbiB0aGUNCj4+IGRldmljZXRyZWUgdG8gYnJpbmcgdXAgdGhl
IGJvYXJkJ3MgU1JBTSwgYnV0IHRoaXMgdmlvbGF0ZXMgdGhlDQo+PiBkdC1zY2hlbWEuIEFzIHN1
Y2gsIG1vdmUgdGhlIGNsb2NrcyB0byBhIGRlZGljYXRlZCBub2RlIHdpdGgNCj4+IHRoZSBzYW1l
IGNvbXBhdGlibGUgc3RyaW5nICYgZG9jdW1lbnQgaXQuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
Q29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4+IC0tLQ0KPiANCj4g
RG9lcyBub3QgYXBwbHkgdG8gbXkgdHJlZS4gUGxlYXNlIHJlYmFzZSBhbmQgcmVzZW5kLg0KDQpQ
YWxtZXIgdG9vayBpdCB3aXRoIHRoZSByZXN0IG9mIHRoZSBjYW5hYW4gc3R1ZmYgYXMgcGVyOg0K
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL2VlZWQ0M2NmLTdiZDYtOWQ3Ny05ZTFmLWUwMThh
MjM2YTA1OEBsaW5hcm8ub3JnLw0KDQpJdCBpcyBub3cgaW4gdjYuMC1yYzE6DQpjb21taXQgNzI3
YjA1ZTQ2Y2ZmZDc0YWRjYTk2Y2ExM2U1NzM1MjMzOTg3NTU4Ng0KQXV0aG9yOiBDb25vciBEb29s
ZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPg0KRGF0ZTogICBUdWUgSnVsIDUgMjI6NTI6
MDUgMjAyMiArMDEwMA0KDQogICAgIGR0LWJpbmRpbmdzOiBtZW1vcnktY29udHJvbGxlcnM6IGFk
ZCBjYW5hYW4gazIxMCBzcmFtIGNvbnRyb2xsZXINCiAgICAgDQogICAgIFRoZSBrMjEwIFUtQm9v
dCBwb3J0IGhhcyBiZWVuIHVzaW5nIHRoZSBjbG9ja3MgZGVmaW5lZCBpbiB0aGUNCiAgICAgZGV2
aWNldHJlZSB0byBicmluZyB1cCB0aGUgYm9hcmQncyBTUkFNLCBidXQgdGhpcyB2aW9sYXRlcyB0
aGUNCiAgICAgZHQtc2NoZW1hLiBBcyBzdWNoLCBtb3ZlIHRoZSBjbG9ja3MgdG8gYSBkZWRpY2F0
ZWQgbm9kZSB3aXRoDQogICAgIHRoZSBzYW1lIGNvbXBhdGlibGUgc3RyaW5nICYgZG9jdW1lbnQg
aXQuDQogICAgIA0KICAgICBTaWduZWQtb2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xl
eUBtaWNyb2NoaXAuY29tPg0KICAgICBSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2Vy
bmVsLm9yZz4NCiAgICAgUmV2aWV3ZWQtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRv
Zi5rb3psb3dza2lAbGluYXJvLm9yZz4NCiAgICAgTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvci8yMDIyMDcwNTIxNTIxMy4xODAyNDk2LTUtbWFpbEBjb25jaHVvZC5pZQ0KICAgICBTaWdu
ZWQtb2ZmLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4NCg0K
