Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBC254E02A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 13:41:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82FF11A4D5;
	Thu, 16 Jun 2022 11:41:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Thu, 16 Jun 2022 09:50:23 UTC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A18113D48
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 09:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1655373023; x=1686909023;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=qSd2EipBZStgkVWBiZcdqV1bbQTQMUmVcu4wCg1EUsU=;
 b=RA/QxcFxFFzVBdqWPQtJMH8JD3+qht04UE11F4SLz2uS5aK04fkF6D36
 7RraDEC0RE540HXIRl/wKcLVSjuilo9O6jot/ZGdjUIQ13899RvaoBST4
 MLMw34drM+qcDYfYUrjpFD+tOqUnqO01fUdD+8hHsU9Rw+YfdRdUKAPcE
 /0vIMcgfo6Wl+wxKEiFwn/yzFAzWNAwWR5C7Y6a/7HU/G1pNDVUb4Epwx
 UV97zKzgNw5At5RcAEPy5YzVqtCXdgP5+2PJGQmnjq/TzKbi4WGYLci5q
 YRdDKSWJ5t0JiKypvRRhbZkanAKYqH5mVeq5pIx9wfEMuv5eUtDgi+wH/ A==;
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; d="scan'208";a="168359321"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Jun 2022 02:43:18 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 16 Jun 2022 02:43:16 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 16 Jun 2022 02:43:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NppUET2gpYBSZaa6UWswT6p1gwg62uywehhGJisnVTWD0tahuDOgbpbU8HRlOHIsedA5ZbMOX7ilwA3Nh6yTnoT6LI5T3EwPUkUZTcL+W5OArRte6p8f8rorzEcfh6HdoEV4lXy7zD3PyxaDOzUiaPuJRuqD3tuPW8DV5v80KYaKdnvVyTYCR1Jg/ZYQtnrZ86Elgn7DIN8Dh/qqJf59zXVjDHO6m/pcePulylaOCjiwP3XRDbsWvMQmU7LKL6Ukt3qohBUMa3T30Cpq6c7JRPm/d4eDTXvALprwvuNjfOKIEIv8/XXMzZrnQpY0wUBzpHIzboPuQkqiKo22kXUKqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qSd2EipBZStgkVWBiZcdqV1bbQTQMUmVcu4wCg1EUsU=;
 b=ngdwH8SUSD8apkMyA4bKg025UliBFVuc9nrAdKsT9WU9kMvTDnieJDctNV2oGANEp+irmvTpOBItkmsGWj469UImAejr6wq3BFu/mhYz25/eC3jDEioKKIkRAw6RSO+v55YekVPvRQMsKRXRcvAZUcx9sYCVzqE7niAToDLZCYr2jXrW4n16M5dmJz2I/d0OIJxSEh7HQYaWBna0U6FiQ8T/HiCnVP4I4pfMnHPlyaKySk5XVJtpK716S3w2zaF+Ajt3LhZpaHwyD7vASiDTd8cjk2C8mhSLRm6vYScCykkJTcmOFOivHqxuFxo5ykRY2qwTdnTY0JAsJX5RcKdZzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qSd2EipBZStgkVWBiZcdqV1bbQTQMUmVcu4wCg1EUsU=;
 b=N62i+WlfSlympJ8k19VAM1yG49BU75C6V8BvUQDzlJJg14ECZm3+fCHqyPGlSNbB5+YnBLHSpnbtoVExiMut90RsxxgqdC2eeEz/Qo45s00/lPVnmqaxPAMwVVodjl6X9OmDuSBE9nVnIAeLSGBHBzBOxNud/PtIKOcz7/TdzU4=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM5PR11MB0058.namprd11.prod.outlook.com (2603:10b6:4:6c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20; Thu, 16 Jun
 2022 09:43:14 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5332.022; Thu, 16 Jun 2022
 09:43:14 +0000
From: <Conor.Dooley@microchip.com>
To: <windhl@126.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH] drivers: tty: serial: Add missing
 of_node_put() in serial-tegra.c
Thread-Topic: [Linaro-mm-sig] Re: [PATCH] drivers: tty: serial: Add missing
 of_node_put() in serial-tegra.c
Thread-Index: AQHYgWV/Waz33ma2+E2jkIxfCV7yHQ==
Date: Thu, 16 Jun 2022 09:43:14 +0000
Message-ID: <a006a52b-3177-ee80-2b6b-56e54ac63486@microchip.com>
References: <20220615104833.3963552-1-windhl@126.com>
 <Yqm6LvDGqaRMaUHa@kroah.com>
 <CAPM=9twCiqyakgPLz0v=7-abUhzLb8ZZH7-U65PV8qtQOP7Xww@mail.gmail.com>
 <CAKMK7uG+TeATXctJaXBgSRxpinDdtOhGa+o2CMPaPtO1QyHtJA@mail.gmail.com>
 <YqrtP2jS0Gg4pBRe@kroah.com>
 <5911192c.6793.1816bb6a391.Coremail.windhl@126.com>
 <1f70f001-7bab-9146-b52c-2f75265137d9@microchip.com>
 <5bf0d156.721e.1816be1bcc3.Coremail.windhl@126.com>
In-Reply-To: <5bf0d156.721e.1816be1bcc3.Coremail.windhl@126.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c33940f3-d68a-45ce-6fe5-08da4f7ca22f
x-ms-traffictypediagnostic: DM5PR11MB0058:EE_
x-microsoft-antispam-prvs: <DM5PR11MB0058C3975E8966ABB8106A1D98AC9@DM5PR11MB0058.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SbAGKd+4Se+MK32r075oEbnQnwH/Imulg37OQTYlP4TC+OFJqq/DgKQsRl2t/uZtz9ARgrCVAx88wWI684HB5btkuFtVUPds3kOT8nIaxGxb3NNJtMl/1HrR/qlbmXjlgs44N/sIqPqZOQwnbCUcp78ooorhrmLVbTtob4Jrecz9lvDcsSDHv+zzYkTysqveCKBQtVk6o/TrejVhqBDKGZHxGju0eP9W/gMe+9yJPFtddGD6otOo+sWZUQxGoLaG626IMkFf5DBzVxRhO7l+aBI/KMjuBOiKuIOVptpIGHNoNi3L5bCCgP9m77W/YYdH/W1AdoWhD52VxnFC7OO3hddYutXGC+bifrfk1vCABNj5ZO/Tjc+cpJIWYSb0N5tF3TwxjWcq+IR9Y2xEaj7dUt1HmYKAU7+IxY2iYmflEkuXidOsVD/gjfPlW0Ml2PAoEKjGI8NjBwX9uuNFyXjSdtsZH44cMtARiMYRq+lHVgNf8MhcmKUhhr2apRq2uPOtY6nbdjTu4NaAnu2EgtjgxRpNmlTZmn3CdkYLNA6NXH5JNTNZInF44jBmjWvsryZZ9EZdmL03aB/u/k3wgVs2TRZeZPVn6ON63R0DRB9a7Mpip2rd/pzEiY5+tbEilVVYdDRzvRsHdwka13izpQTBRW3l2vVQwzU675LfpPHw1J4rjUfd4eAO7yooplcLOR/D+tCbTiVN0MBgireMFf4x2D88tP3EgL/EUotkWhZjSeCOxFsRK8LzKt3DoqiC2ybKN3yqmegeHwGGdkdjqshTCA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(6512007)(186003)(2616005)(26005)(76116006)(66446008)(316002)(31686004)(66946007)(83380400001)(2906002)(8936002)(53546011)(6486002)(508600001)(36756003)(38100700002)(71200400001)(6916009)(122000001)(64756008)(8676002)(5660300002)(91956017)(4326008)(6506007)(66556008)(54906003)(66476007)(31696002)(86362001)(38070700005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UnNkbUNYa0JEa3dEcGpuUTNldGtMeTRMV1ZXdVRJZTYzeTZMT2JmU3dHSjNB?=
 =?utf-8?B?OGxkbkd6bDlqK1J6NHVRNytmUlBTaEZ4RnJnMTlUMVRzdkxUc29QaDhPWXlF?=
 =?utf-8?B?YnM1cGNsSFRaRVV5Mk1MYktIVnRzNjV3L1dlNnJNU3NjZGdScHA1WWdZdTFr?=
 =?utf-8?B?akpOMTlNbE10M0NicTFCZTNyb25XbDRHQkRMZ21WWTA1NGI5NDJ5UjRVUmMz?=
 =?utf-8?B?S2dnSFdMcUZaa0o4VElEdTdtYmJYNXBmcmMyQmhxOWt3QXhQVGxZaVEwb3Jn?=
 =?utf-8?B?Ynl0SXV0eWlSK1M5MHpnMFBXMG5mMVNBSFJCTWxQWjl1QXltVFpQWnpNdDJG?=
 =?utf-8?B?bmg4MXJkWENlV0pzZm9nVFM3bTNoeWNOdW55d24rRmFKVTM2ZGoyRzlTL1pU?=
 =?utf-8?B?dWNWZXhkWlJWbHJaUFFQTEZFN0V5TmY2TW1RUFRJSElwdFlyc2dVYWxlQjQ4?=
 =?utf-8?B?WTA3eWpVRGVTNHI3SEZCMUZkSzFBUHFyc2tWWXdsd3cvNktoYVhBMDZZeFN0?=
 =?utf-8?B?N3Uvb0xxWWJlcXVpRkxMUkppbEROZXhFNlBJeXRmSlVOVkticjRDSURzdDNr?=
 =?utf-8?B?MVFBT3hqTVVwWWF5anAzTWM3ajRRb2JWZTdvTU1IVFJQV2wwSXNJd3puYUp6?=
 =?utf-8?B?dGxzU2hlOXc4ejZQK1Q5NGNlWDhDQXZYK0d2T25vTDg0ZlFMZSszRmwrUzBI?=
 =?utf-8?B?a05qZ292SUQydGI3ME5KOE8vcFhmdnY3b2Z4ZzRqSTNlTVBBTlFBS3JidHJz?=
 =?utf-8?B?am9xQlVnM3BoeVUveXhWU1dZTUdvT3lhSWZHUm92UXZKeTBjTTFlRmc5REcw?=
 =?utf-8?B?Zko2alNSR0NJMEhtd21mNzRpeDZZNFdqbUxxVE9lMjRxaHRYS2NlK3ZvajY1?=
 =?utf-8?B?NHhBRno5TFlJMFlhRUNiU2tvOU5VMnFZODdJWXpqQ0dNTXlWT2UvY1VZMG5D?=
 =?utf-8?B?VHJSbnQ1SDRjU3JheXhCRDhMVW9XWjBDVm9EaUxYR1ErbVZyU2ZCdWkzVnRu?=
 =?utf-8?B?Z0xOTVluNTZYUE5JUjBNcTk3ZWJVeW82R0hheml2L0JoRUxxMHNlMWY3TU1L?=
 =?utf-8?B?ZmdCZmRLRkNqOU9tZG1mczJwOVUvWmM4U2FHTjhJVnp4aUNvL0ExSVpJT0xs?=
 =?utf-8?B?bElSMktTaVhHNWk2WVV5M2hoUVNvcUsybjJLU3lvc01JdjlWYTMxYWV6blEz?=
 =?utf-8?B?Qld3NHhPT2dqUHU3b3lITjR6TUMzZlVaUmtvTjNuS1d1ekpTeG9hV01sdHBF?=
 =?utf-8?B?YW5rb0ZxYnNLOVZQQ2YvTG5IU21sRXJob1JMT1VHeGEvUmFCU3RPMURGQ1lJ?=
 =?utf-8?B?S3NUeHI3SUMwNFhMTHFxNWJIYkhUWW9ESnZmaTJEbnZmZzFrdlhPL1N3L1E2?=
 =?utf-8?B?WjJVYWVFczdKSG8weHVKd3JFV0ZiaGZqLzl0dnBHRUhLRDQyUWVpc1JNS0N3?=
 =?utf-8?B?S3ZJQTJEc0VtYXZkQU5kQWhwMzBLdFg1bTBJL1h2V3VNdkRERjRCNi92Vk55?=
 =?utf-8?B?dFM5Nlhjd1pONktRZFV3dzc0ZG5YeUk3TXZiT0RRUXJiSFZwUnQvbWN5bE8y?=
 =?utf-8?B?UVJQaXdWb3IvVU8rb3FZOWxYdzQwRjRBaWRXdjhvTHI5VXB3WmNlWlF2cjZx?=
 =?utf-8?B?eDAwek1WTHFkZThtWFloM2t1RnFZWGJWZExCVFV1N3RVSTl3anl5bnp1ZkNP?=
 =?utf-8?B?WlBYL0dFdlg0eXpBYU8zM1NlZ3hOd2RmdjY5VUdsYVhKNWFlQm50czlsbEto?=
 =?utf-8?B?MFFFZnFNelI0Nm9senB3UEJMQ1NGVVhHbXBES3hPeFhSOTJPN0htUzc5M254?=
 =?utf-8?B?cTI4czZMcit2RWgreDdSK0ZoRE16eFFWVDlzdklXVGdRWS9aWFJNdnYyZ3RH?=
 =?utf-8?B?OUY5ZDR0dWxhNGNRaURqL0JWcjE0Z1JES2lXMEthcEZaZEFhZFR0Z2xYK1RS?=
 =?utf-8?B?dlp0bFIxdlNGYkVYM2xYZTc0Mk9kMURVOTA3aWJ1bHRJdHFDbWpXc3Y5VjZQ?=
 =?utf-8?B?bTdhSFZROEk3ZHNuTkNiNW5zaTZRcnFJODVZQmR2SkZlSS9JZDAydVFMbUNo?=
 =?utf-8?B?Ti9lMU03dmkxTVpUMno0ZXlwSnBiT1RBM3czSHVMajNaRXRRNlZWeVR5YUJC?=
 =?utf-8?B?V2U3bXZ4ckp2dCtZTU16OUlYV01LdzhveDBDV1ZnMlRpR2RnVFVmY0ZQdkFw?=
 =?utf-8?B?cUhWWXFoUSt2ZUZoUDcyb1NMSXdFa29iaHdGdmNTdmVORDB6VFdOUDdYeUt0?=
 =?utf-8?B?c0MyZnVBc3BmV1U1QXVmbmtuTE0yeEZ3OTZIcWppaldEMW5NRmlGUXZCelV1?=
 =?utf-8?B?WmJ0cmcvNG1nMVEwSTVLeVRCUU1SL1QrWC8vQXRCZktQTWVBaWJJdlN3cGxz?=
 =?utf-8?Q?B4BuKWOAL1VdFK1o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C5F3E8F3EA7D645950A4077FF7818B1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c33940f3-d68a-45ce-6fe5-08da4f7ca22f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2022 09:43:14.1747 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L/PwcS4U+1CIgHZoZenxuDZm4KvrSkaonCRz5r4t18EuKwlqHBObuwoi3uTDJyQZ2SfI54fwx1Pg50MwbDoENAlyFHXmqzhj+bmJ1g0yP/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0058
X-Mailman-Approved-At: Thu, 16 Jun 2022 11:41:09 +0000
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
Cc: linux-serial@vger.kernel.org, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTYvMDYvMjAyMiAxMDozOSwgTGlhbmcgSGUgd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlMOiBE
byBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cgdGhl
IGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gQXQgMjAyMi0wNi0xNiAxNzoyMDoyNCwgQ29ub3IuRG9v
bGV5QG1pY3JvY2hpcC5jb20gd3JvdGU6DQo+PiBPbiAxNi8wNi8yMDIyIDA5OjUyLCBMaWFuZyBI
ZSB3cm90ZToNCj4+PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4g
YXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4+Pg0KPj4+
IEF0IDIwMjItMDYtMTYgMTY6NDM6NDMsICJHcmVnIEtIIiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlv
bi5vcmc+IHdyb3RlOg0KPj4+PiBPbiBXZWQsIEp1biAxNSwgMjAyMiBhdCAxMDozMDo0N1BNICsw
MjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOg0KPj4+Pj4gT24gV2VkLCAxNSBKdW4gMjAyMiBhdCAy
MjoyMywgRGF2ZSBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPiB3cm90ZToNCj4+Pj4+Pg0KPj4+
Pj4+IE9uIFdlZCwgMTUgSnVuIDIwMjIgYXQgMjA6NTMsIEdyZWcgS0ggPGdyZWdraEBsaW51eGZv
dW5kYXRpb24ub3JnPiB3cm90ZToNCj4+Pj4+Pj4NCj4+Pj4+Pj4gT24gV2VkLCBKdW4gMTUsIDIw
MjIgYXQgMDY6NDg6MzNQTSArMDgwMCwgaGVsaWFuZyB3cm90ZToNCj4+Pj4+Pj4+IEluIHRlZ3Jh
X3VhcnRfaW5pdCgpLCBvZl9maW5kX21hdGNoaW5nX25vZGUoKSB3aWxsIHJldHVybiBhIG5vZGUN
Cj4+Pj4+Pj4+IHBvaW50ZXIgd2l0aCByZWZjb3VudCBpbmNyZW1lbnRlZC4gV2Ugc2hvdWxkIHVz
ZSBvZl9ub2RlX3B1dCgpDQo+Pj4+Pj4+PiB3aGVuIGl0IGlzIG5vdCB1c2VkIGFueW1vcmUuDQo+
Pj4+Pj4+Pg0KPj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogaGVsaWFuZyA8d2luZGhsQDEyNi5jb20+
DQo+Pj4+Pj4+DQo+Pj4+Pj4+IFdlIG5lZWQgYSByZWFsIG5hbWUgcGxlYXNlLCBvbmUgeW91IHNp
Z24gZG9jdW1lbnRzIHdpdGguDQo+Pj4+Pj4NCj4+Pj4+PiBIb3cgZG8gd2UgZW5mb3JjZSB0aGF0
PyBXaGF0IGlmIFdvbmcsIEFkZWxlIG9yIEJleW9uY2Ugc3VibWl0IGEgcGF0Y2g/DQo+Pj4+Pj4N
Cj4+Pj4+PiBXaGF0IGhhcHBlbnMgaWYgdGhhdCBwYXRjaCBnZXRzIHJlcG9zdGVkLCB3aXRoIFMt
by1iOiBIZSBMaWFuZw0KPj4+Pj4+IDx3aW5kaGxAMTI2LmNvbT4gb3IgSGVsIElhbmcsIEhlbGkg
QW5nPyBEbyB5b3Uga25vdyBhbnkgb2YgdGhvc2UgYXJlDQo+Pj4+Pj4gcmVhbCBuYW1lcz8gV2hh
dCBoYXBwZW5zIGlmIHRoZXkgcG9zdCBhIHJlYWwgbmFtZSBpbg0KPj4+Pj4+IE1hbmRhcmluL1Ro
YWkvQ3lyaWxsaWMsIGNhbiB5b3UgdmFsaWRhdGUgaXQ/DQo+Pj4+Pj4NCj4+Pj4+PiBSZWFsbHkg
d2UgcmVxdWlyZSB5b3UgaGF2ZSBhbiBpZGVudGl0eSBhdHRhY2hlZCB0byBhbiBlbWFpbC4gSWYg
dGhlcmUNCj4+Pj4+PiBpcyBhIHByb2JsZW0gaW4gdGhlIGZ1dHVyZSwgd2UnZCBwcmVmZXIgdGhl
IGVtYWlsIGNvbnRpbnVlcyB0byB3b3JrIHNvDQo+Pj4+Pj4gdGhhdCB5b3UgYXJlIGNvbnRhY3Rh
YmxlLiBJZiB5b3UgYXJlIHN1Ym1pdHRpbmcgYSBzbWFsbCBhbW91bnQgb2YNCj4+Pj4+PiBjaGFu
Z2VzIGl0J3MgcHJvYmFibHkgbmV2ZXIgZ29pbmcgdG8gbWF0dGVyLiBJZiB5b3UgYXJlIHN1Ym1p
dHRpbmcNCj4+Pj4+PiBsYXJnZXIgYm9kaWVzIG9mIHdvcmsgb2YgY291cnNlIGl0IHdvdWxkIGJl
IGdvb2QgdG8gaGF2ZSBhIGNvbXBhbnkgb3INCj4+Pj4+PiBsYXJnZXIgb3JnIGF0dGFjaGVkIHRv
IHRyYWNrIHRoaW5ncyBkb3duIGxlZ2FsbHkgbGF0ZXIsIGJ1dCBhZ2FpbiB0aGF0DQo+Pj4+Pj4g
aXNuJ3QgYWx3YXlzIHBvc3NpYmxlLg0KPj4+Pj4+DQo+Pj4+Pj4gSSBkb24ndCB0aGluayBhbGll
bmF0aW5nIHRoZSBudW1lcm91cyBkZXZlbG9wZXJzIHdobyBubyBsb25nZXIgdXNlDQo+Pj4+Pj4g
dGhlaXIgbGVnYWwgbmFtZXMgYXJlIGlkZW50aWZpZWQgYnkgb25lIG5hbWUsIGJ1dCBoYXZlbid0
IGNoYW5nZWQNCj4+Pj4+PiB0aGVpciBsZWdhbCBvbmUgeWV0IHBlb3BsZSB3aG8gZ2V0IG1hcnJp
ZWQgYW5kIGNoYW5nZSB0aGVpciBsZWdhbCBuYW1lDQo+Pj4+Pj4gYnV0IGRvbid0IGNoYW5nZSB0
aGVpciBjb250cmlidXRpb24gbmFtZSBhbmQgSSBjb3VsZCBydW4gdGhpcyBzZW50ZW5jZQ0KPj4+
Pj4+IG9uIGZvcmV2ZXIuDQo+Pj4+Pg0KPj4+Pj4gWWVhaCBsaWtlIGFic29sdXRlIGJlc3QgY2Fz
ZSB0cnlpbmcgdG8gImVuZm9yY2UiIHRoaXMganVzdCByZXN1bHRzIGluDQo+Pj4+PiBlbmNvdXJh
Z2luZyBwZW9wbGUgdG8gY29tZSB1cCB3aXRoIGVudGlyZWx5IGZha2UgYnV0IEVuZ2xpc2ggbG9v
a2luZw0KPj4+Pj4gbmFtZXMgZm9yIHRoZW1zZWx2ZXMuIFdoaWNoIC4uLiBqdXN0IG5vLg0KPj4+
Pg0KPj4+PiBBZ3JlZSwgYWdhaW4sIEknZCBwcmVmZXIgdG8gdGFrZSByZWFsIG5hbWVzIGluIG5h
dGl2ZSBsYW5ndWFnZXMsIG91cg0KPj4+PiB0b29scyBjYW4gaGFuZGxlIHRoYXQganVzdCBmaW5l
LiAgTm8gbmVlZCB0byBtYWtlIHVwIGFueXRoaW5nLg0KPj4NCj4+IFNpbmNlIHRoaXMgaXMgdGhl
IG9ubHkgbWFpbCBmcm9tIHRoaXMgY2hhaW4gaW4gbXkgaW5ib3ggYW5kIEkgYXNrZWQgdGhlDQo+
PiBzYW1lIHF1ZXN0aW9uIGFzIEdyZWcgb24gb3RoZXIgcGF0Y2hlczoNCj4+IEkgdGhpbmsgaXQg
aXMgcHJldHR5IHJlYXNvbmFibGUgdG8gL2Fzay8gaWYgc29tZXRoaW5nIGlzIG5vdCBhIHJlYWwg
bmFtZQ0KPj4gd2hlbiB5b3Ugc2VlIHNvbWV0aGluZyBsaWtlICJoZWxpYW5nIDx3aW5kaGxAMTI2
LmNvbT4iIHdoZXJlIHRoZXJlJ3MgYQ0KPj4gY2xlYXIgZGlmZmVyZW5jZS4gQW5kICJJdCBpcyBt
eSByZWFsIG5hbWUiIGlzIGEgcGVyZmVjdGx5IHJlYXNvbmFibGUNCj4+IHJlc3BvbnNlIC9zaHJ1
Zy4NCj4+IFRydXN0IGJ1dCB2ZXJpZnkgcmlnaHQ/IEl0J3Mgbm90IGxpa2UgSSdtIGdvbm5hIGFy
Z3VlIHRoZSB0b3NzIHdpdGgNCj4+IHNvbWVvbmUgaWYgdGhleSBzYXkgaXQgaXMgdGhlaXIgcmVh
bCBuYW1lLi4uDQo+Pg0KPj4gVGhhbmtzLA0KPj4gQ29uY2h1YmhhciA7KQ0KPj4NCj4+Pj4NCj4+
Pj4gdGhhbmtzLA0KPj4+Pg0KPj4+PiBncmVnIGstaA0KPj4+DQo+Pj4gaGksIEdyZWcgSy1ILA0K
Pj4+DQo+Pj4gSSBoYXZlIHJlc2VudCBhIG5ldyBwYXRjaCBmb3IgbXkgY29tbWl0IG9mIHRlZ3Jh
X3VhcnRfaW5pdCgpIGJ1ZyB3aXRoIG15IHJlYWwgbmFtZSBmb3IgU29iLg0KPj4+DQo+Pj4gU28g
dGhlcmUgaXMgYW55b3RoZXIgdGhpbmcgSSBzaG91bGQgZG8/DQo+Pg0KPiANCj4gDQo+IFNvcnJ5
LCBDb25vciBhbmQgR3JlcCBLLUguDQoNCk5vIG5lZWQgdG8gYXBvbG9naXNlLCBteSBtYWlsIHdh
cyBkaXJlY3RlZCBhdCBEYW5pZWwgJiBEYXZlIG5vdCB5b3UgOikNCg0KPiANCj4gSSBkaWQgbm90
IGV4cGxhaW4gY2xlYXJseSBhbmQgSSByZXNwZWN0IGFsbCB5b3VyIHN1Z2dlc3Rpb25zLg0KPiAN
Cj4gSSBoYXZlIHJlc2VudCB3aXRoICdMaWFuZyBIZScgYXMgbXkgcmVhbCBuYW1lIGZvciBhbGwg
cGF0Y2hlcyB3aGljaCBJIHNlbnQgd2l0aCBoZWxpYW5nIHllc3RlcmRheS4NCj4gQW5kIEkgdXNl
ICdbUEFUQ0ggdjJdJyBmb3IgdGhlcmUgcmVzZW50IHBhdGNoZXMuDQo+IA0KPiBTb3JyeSBhZ2Fp
bi4NCg0K
