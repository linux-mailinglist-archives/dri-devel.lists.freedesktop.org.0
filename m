Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A600A52B322
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 09:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D62D113E26;
	Wed, 18 May 2022 07:13:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2137.outbound.protection.outlook.com [40.107.255.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E3CF10E15B
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 14:53:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V7Y7oDlJY5KvvwFi9/EXsrnKRjhbm3WsfKRGQMgVBUjzTHTYztb9bmpuw1hZbWq2ckvqCAzr30LfmX9TH8qS3AyAtRr9vqWrEYTGKYcYQp+4mRge3aIu156tDUGXpExRCOBjVEORUDBrezEpO272n1bVU2aqh6hB3INciskhGg1Kk6N4a/RRk5HUlEbnh4yjlcqeUkopQwwnI+wOX1FT6ssMVeZmCmmd1VkZN8cjdchPVa7tQRP/8vNHVtFci5eCbs152i7J2jEtmyz+Nb/nWCjABiAeycbtCfLKYHGYxJfC83G2Pqzk3RGshjHOwJFDFl6dX5yLtvZOH1QZnMdS2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4+6MkMnyXbissvbcN/KqvkiDsFIDze0LoiVLk/fd9JE=;
 b=Ei+G7/AFwjL+94B++HotQH1eAXWB1rq5wiEqByVXZyAB4X2p03gSiKYJ2Pm6Ts6HenG/NDPfvO/f+Zs4gmSJ9QL/Etl06geoEFhFupIrzZFdZO25Q1z1vK9sxmm6PdtgGdcDV8yq4BnhP9w08ZLKsnewFtBD9R6ocCDvKWuxiVN2osjlg24iEykqhcUoGyuaSc5Fs1R+jEzcB/IbgH4gjWY03F09enE41XqHMSJKj7jZJ8/7xZ3CsApxMlfUDfgO9mmtCM8DkanLYfY2+aAfioVB1xvA+m10lCkBmAHwR09GQNcwrJNCoVAqqbmpiSzzgMIKQfcpT5GraymQ4w6uJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4+6MkMnyXbissvbcN/KqvkiDsFIDze0LoiVLk/fd9JE=;
 b=lrtjHWsxtOlalLCSbi46FW5a4BrQqf/mj2FtkwzjtOMqtXrNmjFxhKzgbf5sZ3cbRD6aVQxj0dAwdi5HfPCquxFNhCkBFpATN7xMvVcWE1OilnPNitUGUPyUb47zVhW0/up+1+S7nOg2uoQJUQcBazKAGic55T577aawHGpFMN2DVArlSMtfkd5oFebHkRgLpc8qRlcq3W5pWqXiIcJyoHYmg0dBHscLE5WkUbbKD/RgPKjnX7QCI6ADa32Wvh2Or1imJt554nTwcQmf2p/8lWXglCPf4Pk3Tcck/ineFClmpfrRUPoTya7AxmS3dQBficLvoxBtWr0y9hfRdfdl8w==
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com (2603:1096:203:87::17)
 by KL1PR0601MB4002.apcprd06.prod.outlook.com (2603:1096:820:20::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Tue, 17 May
 2022 14:53:38 +0000
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::3d31:8c42:b7f1:ece8]) by HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::3d31:8c42:b7f1:ece8%7]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 14:53:38 +0000
From: Neal Liu <neal_liu@aspeedtech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@aj.id.au>, Felipe Balbi <balbi@kernel.org>, Sumit
 Semwal <sumit.semwal@linaro.org>, =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?=
 <christian.koenig@amd.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Li
 Yang <leoyang.li@nxp.com>
Subject: RE: [PATCH v2 3/3] dt-bindings: usb: add documentation for aspeed udc
Thread-Topic: [PATCH v2 3/3] dt-bindings: usb: add documentation for aspeed udc
Thread-Index: AQHYacfENGn/JRqu4k+Y/371X1knIK0i+LqAgAAvS/A=
Date: Tue, 17 May 2022 14:53:38 +0000
Message-ID: <HK0PR06MB32029E580BA9841DECF68FBD80CE9@HK0PR06MB3202.apcprd06.prod.outlook.com>
References: <20220517082558.3534161-1-neal_liu@aspeedtech.com>
 <20220517082558.3534161-4-neal_liu@aspeedtech.com>
 <414d09f8-328a-4bf4-c20e-f8ce4a6ddfc7@linaro.org>
In-Reply-To: <414d09f8-328a-4bf4-c20e-f8ce4a6ddfc7@linaro.org>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2d2e28cb-8738-4851-2994-08da381506d6
x-ms-traffictypediagnostic: KL1PR0601MB4002:EE_
x-microsoft-antispam-prvs: <KL1PR0601MB4002DE9DF569DA391D47C68C80CE9@KL1PR0601MB4002.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JkqMVjudG5C0ljsDID3qkYAjyttbpiEW8KBg8+yP2DBZArk6nU8CgmsCOhyE87NUvcBT6IZIyGCf6MFb9ZOxZKvsigA566On02pLUi5U9dSoXxaAG9XX1OoTLCEN8zlLfUaYb/jiejhazP80EkIvtb4PbcAHeX5QzdToMHIqSljihamnnjpRbuzFAMlrxNtf7D0sEidJ6J4bcgFBqqYaIWSlKht/cyt//fv7nXjAIOcfHFOMZpK5k6B8tlDfofHk6ssVPVthZwom77qHeU+EO5TMnPN2N6pVvs3C2wqdViXjsCUCBP9J+YSCb6mzNMm34CpuN6+5+KSZy04fOa1pntoSLZbxKr/Hn0v8HdB2PysczAPTvddPw/+Mg8CdhjFQ8Ujn8ZoT73ldR9Pkc7HTgLwLTOCJMS/9GiwRYvoYzZU0OV+YozeFvOfUn6VeZn8lC4liMxT/dB6oEQxAjRs80fsVWYpiXIC4vwXb8k5XATYsf7eKVT0yNP/Hod/DfuHtJKASe5SH7YkeMi1kh70Ldvzum64XjQnjqmHDKfpKsCzvlqSE65ySU9oqT1GDKUxGOgtJu9ajUxKGZ72XEhfM6G7JChMbVkWO5PJUeniMgTnm68FTl10mKTwm21cxvm+8AVOG2FqA6qYy5mCUCENgVjWBzRVq8KxyVvm8z3QNQMkL2MnwRirk73s184nfq/AlmBxffZDUHPpBpO6bArxbL0MoCJ8g2hZ/n5xbbq9QcVU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3202.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(396003)(136003)(376002)(366004)(39850400004)(346002)(66446008)(66556008)(8676002)(64756008)(76116006)(66476007)(4326008)(66946007)(86362001)(38070700005)(26005)(53546011)(71200400001)(8936002)(52536014)(508600001)(110136005)(5660300002)(7416002)(55016003)(33656002)(38100700002)(54906003)(7696005)(186003)(2906002)(83380400001)(921005)(316002)(122000001)(66574015)(41300700001)(6506007)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ODVBb25RSy9RUkRFZ0UrcjcyMlZYTEg0c2c1Skhma0lnSy9xejgrY3k0SnVn?=
 =?utf-8?B?YU5aWTlWM2huTXNpTXk2YkxmV2ExbDkzQWRESmYwRUhkdHRuYWx0djZyeGZv?=
 =?utf-8?B?UnhTMGdFRGNGWEs5ekwzS3ZFQXhkU3VIY0pQQ1ZtbE9OUlR4dy9ncXVpa1cy?=
 =?utf-8?B?YllwRmYwNmtoU3huREVPa0Z0NmhCcThQU3QycmZ3VVBvSmt1RDU3VitzRWwr?=
 =?utf-8?B?b2RhY0YyTVhsVlpYSTBrUkxwcFFjclk1ZTBDd3dEdjdVdFd6MTZtWDBFa3NX?=
 =?utf-8?B?ZnRIS1luemI1TnF5MFMrdkNMS25JenUvOFovbXFQU1ZRTHppMzU3QkxZOUd2?=
 =?utf-8?B?dVJqci9GM2RyU2h3N1hXWkZlVnpWUGtlMnlTM2tFS2MrSWFWUGdLMEpzQm9w?=
 =?utf-8?B?dkw5UjdqcDVLSUttNVFyN3NDRDJDVXJGSE5wODN5Vjl0Vkgvc2djQkh3SlJh?=
 =?utf-8?B?RnJIdkNORlUrb0FRd2gweXdyUWpQSDlYRWFjWHFZVGpHT0d0Wkx0UzkxaHJG?=
 =?utf-8?B?QTRaWG8zNDVSSUEzYytaVmRkTUFiRWViSk92SE9vd0Yvd3R3NUxnMlV2N0FN?=
 =?utf-8?B?TXNoTkV5UEppRVFWb3VLY3pWb2d6dkthNXVKempYa1JuUlcySzlvcVZZZkpt?=
 =?utf-8?B?cmVTT01zT1J4MWF3U3RvMzZNWDZKUmhDNFh5UFJEVEd3QWo2MHV2cXhEd2s0?=
 =?utf-8?B?V0NtZlNTL0pvRXg5TStyMlppelVBWjVZelBzNW9LQkFPWnFiQno2b1g2Kzd5?=
 =?utf-8?B?cHJubHVZZXZvNVZEQ3ZlczhFU1g0ZHAvS3BjdVd1dWdYdzF2Q3MxOG8yR1or?=
 =?utf-8?B?V1FHeHVkUGhmajlYWkpoa1dMZmd5dnpkbVpXYzh2UG1VRkorQ1hvYWNtaHA0?=
 =?utf-8?B?cHEzMElYQVpLZUdaT2VYYWtkemRpQVNhSjVJd2E3d0hCakEzRHNPa1JKYnlT?=
 =?utf-8?B?QnJEQkNjWTNBYmF4dFNYTXhodU1VNWlqTmVMdFMyQi9EbnRJOFNKUHFvVzJP?=
 =?utf-8?B?RzFrSS80L2EyVFpWeDVJdjNiZEY4NUY0alhQRnBHQ2N2UjduQWR1QXd2c2tv?=
 =?utf-8?B?R1owYnlrMWI0bzloWkNOZGtFT3lFaDF4VGtpZDN5WkVqbCs2WXh3UE5pSFl6?=
 =?utf-8?B?QkZYRkR5RGUrZ3ZUMHIrdEtOYWE4Qk1DK1M5N3B3azRrR2o4dFZKOEdmamd2?=
 =?utf-8?B?SkdWaXptaW55a0pFU3locncxRU5jVWdSVmt5bmVMdE1EeHlJcXJYZDczNjll?=
 =?utf-8?B?UUhFNVVLWGQreDJnZW50cm1WZDc5VUQ0bjBBNTlNRERQbEc4K0VoOFg4NXNn?=
 =?utf-8?B?NmxaK2preU1LNS90S3daSkRJTkhZOHJ5WUthdWwyUXFHYllVMm5UdUo0Y3J5?=
 =?utf-8?B?UTNOTEs4MUJGQXRTQkpuZkhDbUh3OFF4VDRVY3VTN2twMG1rZWVBODhqL1BI?=
 =?utf-8?B?anJ6YmM4eERDWitlblJQZGhYbVltcnJJdzJWa2o5UjBqNkFqU0YzdEJOV0lV?=
 =?utf-8?B?MkZqQlVXMngrakIxUFhMSkNpRU1vM3pyNFJSbmhkaWJVa2duZlhVUUNoQ3NE?=
 =?utf-8?B?TGEwQ2VRd040Z0pkSmJ0T2kwb0ZybXNQUTd3UVhXWEt2dURuSnhqV0NwdHBW?=
 =?utf-8?B?Rno5bXU3Q3JZRTJwVk1zTk1MSis3U1QranFnNjUvZFd4V2RRYmZIcmNHOFhp?=
 =?utf-8?B?TU0rREtoakgvV3FhcngrOWROcFp4dVdRSWcwTGh2aUdCakkrNU1RN3lqY1px?=
 =?utf-8?B?bktHKzZZbUkxWHdPRDZrb1NoUWZBaFc1amtINkt6eTZ4SGxSUGc2WTlqQXEx?=
 =?utf-8?B?MkFoVS9CMmY4d3FmOHdHOEVYUmdrOHM3dzFCdXpFeWs4MkZ0WWRHZVd4Y2kr?=
 =?utf-8?B?c2M5TU1tTzF6dDcrVFloR3Mra0xGSFRLbWJOK0VLOC9GbTZINHRVY09YYTE5?=
 =?utf-8?B?NzhkWGlBQ2wwamliRUdnTmVEckxiaDhPMVFuc2tVZHRoSm1vbWRRV2IxNWdF?=
 =?utf-8?B?aWVrK0pxSWdJdk1YYmFlSXNFWlpIK2ZKcnBsWFFRNkQrVUxxWWtEK25iQXVW?=
 =?utf-8?B?eUpsbDMxM25HYmRqQyt6ZE1WMUt1SVdFeTJTWXNRMHlTbFdUd3dUNCtmMVNH?=
 =?utf-8?B?bis5ZXhuQ1F3T3F2WjBXV3I4V3BuTmhlZUVyaGJ4TTVuQlU2UVZYTkhVY25R?=
 =?utf-8?B?NFg3bDRwNERHYWVRbHg4Z1A1ZFNNd2RtQXpIVkR6dERWWVhZK0VxUGNGV0t2?=
 =?utf-8?B?YndiUDR2MUpTTk5HMHQ3cU1FZkg0YW1tVGVvSFlqbUdxeTV4WmVZcjJPc05t?=
 =?utf-8?B?ODBuNzlNMEFTZlpRVWorZUZ3czNrbTRsMFgyUlZGbzVuVVEvT1Jadz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3202.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d2e28cb-8738-4851-2994-08da381506d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2022 14:53:38.5888 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LsGNn/bqz5xk7xClDUBOdwMrc7cS1Ezu15YDqPfvvaTk6M2FdIb7Y/EbjiJappfDhHtYyKgl5iOOok5PVu6VZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4002
X-Mailman-Approved-At: Wed, 18 May 2022 07:13:30 +0000
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIE1heSAx
NywgMjAyMiA4OjA0IFBNDQo+IFRvOiBOZWFsIExpdSA8bmVhbF9saXVAYXNwZWVkdGVjaC5jb20+
OyBHcmVnIEtyb2FoLUhhcnRtYW4NCj4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPjsgUm9i
IEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz47IEtyenlzenRvZg0KPiBLb3psb3dza2kgPGty
enlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZz47IEpvZWwgU3RhbmxleSA8am9lbEBqbXMu
aWQuYXU+Ow0KPiBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3QGFqLmlkLmF1PjsgRmVsaXBlIEJhbGJp
IDxiYWxiaUBrZXJuZWwub3JnPjsgU3VtaXQNCj4gU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJv
Lm9yZz47IENocmlzdGlhbiBLw7ZuaWcNCj4gPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT47IEdl
ZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+Ow0KPiBMaSBZYW5nIDxsZW95
YW5nLmxpQG54cC5jb20+DQo+IENjOiBsaW51eC1hc3BlZWRAbGlzdHMub3psYWJzLm9yZzsgbGlu
dXgtdXNiQHZnZXIua2VybmVsLm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxp
bnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZzsgbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOw0KPiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnOyBsaW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFyby5vcmcNCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2MiAzLzNdIGR0LWJpbmRpbmdzOiB1c2I6IGFkZCBkb2N1bWVudGF0
aW9uIGZvciBhc3BlZWQNCj4gdWRjDQo+IA0KPiBPbiAxNy8wNS8yMDIyIDEwOjI1LCBOZWFsIExp
dSB3cm90ZToNCj4gPiArDQo+ID4gKyAgaW50ZXJydXB0czoNCj4gPiArICAgIG1heEl0ZW1zOiAx
DQo+ID4gKw0KPiA+ICtyZXF1aXJlZDoNCj4gPiArICAtIGNvbXBhdGlibGUNCj4gPiArICAtIHJl
Zw0KPiA+ICsgIC0gY2xvY2tzDQo+ID4gKyAgLSBpbnRlcnJ1cHRzDQo+ID4gKw0KPiA+ICthZGRp
dGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4gPiArDQo+ID4gK2V4YW1wbGVzOg0KPiA+ICsgIC0g
fA0KPiA+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL2FzcGVlZC1jbG9jay5oPg0K
PiA+ICsgICAgdXNiOiB1c2JAMWU2YTIwMDAgew0KPiA+ICsgICAgICAgICAgICBjb21wYXRpYmxl
ID0gImFzcGVlZCxhc3QyNjAwLXVkYyI7DQo+IA0KPiBTb3JyeSBmb3Igbm90IG5vdGljaW5nIGl0
IGVhcmxpZXIgLSBzbGlwcGVkIHRocm91Z2ggdGhlIGNyYWNrcy4gWW91IHVzZSBoZXJlDQo+IHVu
dXN1YWwgaW5kZW50YXRpb24gKG5vdCBtYXRjaGluZyB0aGUgcmVzdCBvZiB0aGUgZXhhbXBsZSAt
IGFib3ZlIGlzIDQgc3BhY2VzLA0KPiBoZXJlIGlzIDcgb3IgOCkuDQo+IA0KPiBKdXN0IGtlZXAg
NCBzcGFjZXMgZm9yIERUUyBleGFtcGxlLg0KPiANCj4gUmV2aWV3ZWQtYnk6IEtyenlzenRvZiBL
b3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4gDQpHb3QgaXQuIEkn
bGwgcmV2aXNlIGl0IGZvciBuZXh0IHBhdGNoLg0KVGhhbmtzIGZvciB5b3VyIHJldmlldy4NCg0K
PiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0K
