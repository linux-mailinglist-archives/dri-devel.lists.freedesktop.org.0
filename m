Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D45CD853ABD
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 20:19:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF37110E47B;
	Tue, 13 Feb 2024 19:19:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="D/DOsXW0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5214D10E47B;
 Tue, 13 Feb 2024 19:19:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gAKx+mrv/BUfN7inl1g3IJZi/bLg2tPFoZhbU6xRg3VzyeyxgTWVq9sfjgUd3lHJIJctZoho7drcXXXh7jcpX71czHGsaY1oPoEp1aX7QH2XugmcWkopIGGd1t4tFQm0z/SPB8CjHGgfd9yPd/CV1CkJ/quseAEDisUdxKnamLzbkScYi/JKgyhgtlgmZSDGTgwMSdVDqBHGhAV0EU1pYUWWBw2d80HLv2O0g57o9YPtXlBsoqCIWY4R7kCfNWKeA4u18WNL8J2B8o44Z7qWPrEW8Rdj3+YjyLBZDkihtsXYsjySkZsmSHSvmNIzfhA2DvaoRg7qhac6J6FEe3DmpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C95vZfKoaz5cNQ2ezikXrgzhsVXXOo2uDJPkVzo5Y/k=;
 b=bLjw24Atn3mGYeatdxR5fnQIrhozU1z//E3JaevNXA9Frr3Z0LBDCBcjlHvDGR9KPIDsqFJrAl/YgcKbhirQhZyJ+EULHSxlhGTpWZmGTrrwxGM/U7O/RySlBs9emNrhgWpdT7jWcl+U8IpDZvy6dskS9nzv/K5pDjBD3SSyS2SS0YJKRxCZGCPFJc1+Wdfgp6s1JouZF4+hqsojXn6QOnSD8qH6M+UX+oN4vrdIB4O1wvIQw7cPRpMobgRjbD2tde2cXa5b9zSygjzBP65S/HNTXZmd05yttr8A86junS8tlhZxQc8MRve73Fo0GPaPHw1jpQVy3uagWd9dJUXVZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C95vZfKoaz5cNQ2ezikXrgzhsVXXOo2uDJPkVzo5Y/k=;
 b=D/DOsXW0tU5Uo8HBErB+/Se9iKr2NijrXT0t4cFVxH6iOLtXbGrCGz8LGknUmpo+1//6yrzuHaJ3w5wiqVEkJ4LZQ5V5AtvIjZiOVs7Ev/pHRiaQTdM3X/TWDxMZUs0aoP5Vx+4MEdOx8e9VdJ5uVFlmaXwAU5TmILsC+toFdIG8lXKnPMe3AW6PmhSUxxa2oHLdl+pUWXIKKYJyfirdRLflwVAij+54zGFNn9W4quWxjOf+tFGZyFl7A2T062w0G1m900+hn+Hl4MjYUVZmqB8MOtD2AGl6bHTyJ6UBjpqTmdMmWPGUlJkbsmLCxlbQkICKtYl1r1NILXLILUXb2A==
Received: from SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 by CH3PR12MB9455.namprd12.prod.outlook.com (2603:10b6:610:1c1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25; Tue, 13 Feb
 2024 19:19:33 +0000
Received: from SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::a969:afd:ee0a:796b]) by SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::a969:afd:ee0a:796b%7]) with mapi id 15.20.7292.018; Tue, 13 Feb 2024
 19:19:33 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@redhat.com" <dakr@redhat.com>
CC: "airlied@redhat.com" <airlied@redhat.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "lyude@redhat.com" <lyude@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] [v3] nouveau: add command-line GSP-RM registry support
Thread-Topic: [PATCH 1/2] [v3] nouveau: add command-line GSP-RM registry
 support
Thread-Index: AQHaXfi1VfQ0vivJK0aTIRsDuxRkcbEIau8AgAA8Q4A=
Date: Tue, 13 Feb 2024 19:19:33 +0000
Message-ID: <9efd5556a69f842c6ebaa5474128457ddb7878ee.camel@nvidia.com>
References: <20240212211548.1094496-1-ttabi@nvidia.com>
 <20240212211548.1094496-2-ttabi@nvidia.com>
 <824eea2e-30df-45e3-a357-daaad4b8ce57@redhat.com>
In-Reply-To: <824eea2e-30df-45e3-a357-daaad4b8ce57@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8769:EE_|CH3PR12MB9455:EE_
x-ms-office365-filtering-correlation-id: 7749dc54-2eb9-4659-2bbe-08dc2cc8b5a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ic/L/v9ld3LLXZKthoJbmUyKleyMGuhnMEN0autKjq4kLeQY4ZdQBJtYzmzfLsCjtY2PauqbKV9RiAK7UtlQNaP3to+xmt0OgL9usIkoJ8mQDuYoEuOCUBu1ebBseU5+W8rAOSEUqbRQgkgaG5LoVRkie7fW0eOy8zJ8XNMXxCyW40lDrhu3T7ki4oibhcZdIM8u4TWWbvFCydK64KiAEgsShgVyk/+IDRLGnJg4o57/U6W8/JDYARg5xKTIpDbzASe4pHAmoljGD/4+hMeqojgV3dT7FH5k/EEqv8rTfO3mQFS9Gs4iSqEsuW1RjiCEhYDiXieWEUNSF4PrwW/wKw4IPUTYZXiCCRdmrrM64SZglvlzoau+uvvVkJ7L0YIVntCLR0UXSjhLpEQB/hf+Q3z6cJHP0qUnOEOObisDopFVudGAxNoVnVMUsT2Qg2kCLXk93n77I6foSPoSHjsj7J52tY6ING1Gom0I+kKp8PXtHjcr1nwEXts4e+06ax5OBML7RTwLz4mp+2grbsQ/re37/8j4UW1OtOoXY4MNUM9YDJXWyUSKWFa5DUIMEHgsRfuuWfSpJ/eQYknTIUmJFQilV4XFgXmQYh+zef4MziIrxSlFqdYVCvcotH3OqtRM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(376002)(39860400002)(396003)(136003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(8676002)(4326008)(5660300002)(8936002)(2906002)(83380400001)(2616005)(26005)(36756003)(38100700002)(122000001)(86362001)(38070700009)(6506007)(66946007)(66476007)(66446008)(76116006)(6916009)(54906003)(66556008)(316002)(64756008)(71200400001)(478600001)(6512007)(6486002)(41300700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QzhXbG9uN1ZhRjduYnpNVUh6K2tFeTNZUkNIVXRvd2ZCR3ZHdXRKa3BzcGlI?=
 =?utf-8?B?emVuS0RFekwySmozOFZ5SWNKaGROdEg0eW5rRUFJaTA5Zll4Q0ZHeHpSM1dq?=
 =?utf-8?B?M0tNVGw0Y1lDZkR2bXptUXhTWTk2UXZsNXdaSTQvbmt2K0FmdDdmZzNNcGVh?=
 =?utf-8?B?OUJRQTYzMGl4dlRScFlodUN1N0Naam9EQlFTZDhJSCtsSVl0MHhUaVBBZk55?=
 =?utf-8?B?S1ZJSHRaOUpONFhOTFpEU3lMVUpxN1krRU1ZMXNPd1VYamk5aEN3R1ltbGVB?=
 =?utf-8?B?SE9CSkgvMDNhM3JSdExTQ05Fdkl1UERrTXVBbmFSaDZ6djBPK0N1dEwzcE1M?=
 =?utf-8?B?S0xuelRjdnk1Y1BOeTlxSzU4ODBVN09xZ1NRYTNUMHNrTlp0QmtKRGkvUG9C?=
 =?utf-8?B?SkVIdk9DSDBMWEVYQlk2cUhqOEM0RnlQOVZEK3NMR0hEREcrd2ZYMkJDOFVx?=
 =?utf-8?B?M3Z3VDlsckRockdWZEhFRzhJRkVIRkx1RVZDZVByaldoV0hYTzJTWkxWdkF5?=
 =?utf-8?B?Q2ZuWkNBRjBSMHlNMHJnSERaMTVvdEI0aStNYVlHNVhJc0FDQ21hSFhrdnBN?=
 =?utf-8?B?SDg2SlM3ZVhTVnpXMDhEUkhGVE9hMCszbVZVSGxUdkhUTkxKMGZRWEpXVVND?=
 =?utf-8?B?Wm55RlRxKzRTTzFZVGpLaFpBOGxvRUNkWUNpTTlaY0hwVEM3cTdpa2VxcE1F?=
 =?utf-8?B?aFlEQXFuRnpzVTIrZXpmS05zbzJiaXQ5RGsrNjgvM1BiTVBCUXdXUjRNS21s?=
 =?utf-8?B?VVZiTC8rY0ZTN0MwRm5DWC83WTU0QlJmbEZ2RTlESXVSTWFWWjZIYzIrS1Jn?=
 =?utf-8?B?cjNKcGxrMmhDaGpQY05uRkJmUkJYeVp4dVVlT0hLUmVUTFBKcUo4NUU5cGNJ?=
 =?utf-8?B?KzhOWTZKWFpuOUFFelliVkxsMzd2OHZsSVZDZ0dRcEJhQkFWeDBYQWp5Wmk2?=
 =?utf-8?B?b1R3OEhma2NrUkF4MDIydnRLeTdyMkpDVDd6NDROMFF2cmIwOGp6K052dHZk?=
 =?utf-8?B?U2swUFBzQVJ4UTVSTlh5V0ZxdTUvUGJMeTV1dVRxeTRCMklFRzJmT2FTaS9U?=
 =?utf-8?B?QmV2VnYrT25oRU02NG43UWFJQzYzUlZGUWZTeERneEhsMzNGMzBRZGZKYVkv?=
 =?utf-8?B?U1JUSWZkWXVyRTlkZFRwK0JrdTI1NXdzNHlGbUJSV1ppVzZFN2JjOWJ4dnYw?=
 =?utf-8?B?YTBhaFNEUytZclo1eG5YQXZsb0RwaXF4c0JLQ3NqQzdsT0VyeVBKMGFERU1p?=
 =?utf-8?B?VnZ2MWFqTnV1bUlHVTlTcEtETkhkQ2JNVFU4bjNpZXJYVmdIbXB6V0VsT011?=
 =?utf-8?B?MDhyTDB2MTdpVmFwU2lPbFR0RXdRR1JScDFzVzFoRkVacmJReTNRbmpCWmEx?=
 =?utf-8?B?M3ZGWGtwMEtwUTE2eDk0QkhiOG1DbnpQNCtjSFRRUmVkMjdhWjA1QnFWeVIv?=
 =?utf-8?B?Z0NIaUFOZGVvaDdFVS83c1gxL0xqWEp1ZHp2QzR2N3VUaVVSbkxUR0lPNWc3?=
 =?utf-8?B?SzhuWSsxRXNCNGVjeFJCOXBSRkp6MlNMWXlKVzVwZWswVXUveERMR050UEhn?=
 =?utf-8?B?azdqaWJhaEllR1F3akVkM1kwaWo1L1lGOVRlMjhkQnhlYUNZaUZWak5BUWMr?=
 =?utf-8?B?Ui8yTDJDRitPcVN6U1AxM09MeHFZY3h6dm1PWENtcCtjY1RQNUc4SVMrM0dJ?=
 =?utf-8?B?L3BMUkhZYjFQcXJBQ1dBbFB6VHJyU2NyQ21TaURTMHMwVWRKUDFkSTBYbDNv?=
 =?utf-8?B?N2hGM2JJMW5Ud0ExTlRSQlFjZFZLU1dkTks5ejRWRVlJMzBDUjFkT1VXN01z?=
 =?utf-8?B?K0RZd3dJNDFvMjYvUnhCeDk0YXM4SGpmTHZZT2hyVzV5bTZGZ09ScnBvSDhj?=
 =?utf-8?B?TXVqOExGN0VFS0h1cmltQWFBOGdQYkQ3Z25iL2RnbFRiZ25EL2Z3UytNTk1Z?=
 =?utf-8?B?MlVFQkhNUUpINER2TDY4b3FvSlhQQjVSZlZrMUxRaVgzSERLN2creG9seU9w?=
 =?utf-8?B?Q0k0cmJBSWpEcHpYcWs4RXRxNGZNWGF3eFVta24vSHlURGRVekRVWHMvUFhO?=
 =?utf-8?B?am1xSm9hTEVLTjhuaVYxU2lHVDhtZzU3SG5qYzdNRzcxbjcvc292ZEoxbTNh?=
 =?utf-8?Q?7xuwn/S5n3shsrSb/gP+PQCvN?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CE5D039DACAC594C8670E09663FF519C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7749dc54-2eb9-4659-2bbe-08dc2cc8b5a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2024 19:19:33.1793 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wSQb62BUS0lxnfo0gP6aJE+wAMDXqM6KemQKPxMSvppLmSG16SGJv5dNGavOX9MxUIJ7A/rohGVsSZjYgQYirg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9455
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDI0LTAyLTEzIGF0IDE2OjQzICswMTAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiA+ICtzdHJ1Y3QgcmVnaXN0cnlfbGlzdF9lbnRyeSB7DQo+ID4gKwlzdHJ1Y3QgbGlzdF9o
ZWFkIGxpc3Q7DQo+IA0KPiBOaXQ6ICdoZWFkJyBvciAnZW50cnknIG1pZ2h0IGJlIG1vcmUgc3Vp
dGFibGUuDQoNCldpbGwgZml4IGluIHY0Lg0KDQo+IA0KPiA+ICsJc2l6ZV90IG5hbWVfbGVuOw0K
PiA+ICsJdTMyIHR5cGU7DQo+IA0KPiBJIHByZWZlciB0byByZXByZXNlbnQgdHlwZSBhcyBlbnVt
IG9yIHVzZSBhIGRlZmluZSBmb3IgJzEgPSBpbnRlZ2VyJyBpbnN0ZWFkLg0KPiBUaGlzIGFsc28g
Z2V0cyB5b3UgcmlkIG9mIHRoZSBuZWVkIHRvIGV4cGxpY2l0bHkgZXhwbGFpbiBpdCdzIG1lYW5p
bmcgaW4gdGhlDQo+IGRvY3VtZW50YXRpb24gb2YgYWRkX3JlZ2lzdHJ5KCkuDQoNCldpbGwgZml4
IGluIHY0Lg0KDQo+IA0KPiA+ICsJdTMyIGRhdGE7DQo+ID4gKwl1MzIgbGVuZ3RoOw0KPiA+ICsJ
Y2hhciBuYW1lW107DQo+ID4gK307DQo+ID4gKw0KPiA+ICsvKioNCj4gPiArICogYWRkX3JlZ2lz
dHJ5IC0tIGFkZHMgYSByZWdpc3RyeSBlbnRyeQ0KPiA+ICsgKiBAZ3NwOiBnc3AgcG9pbnRlcg0K
PiA+ICsgKiBAbmFtZTogbmFtZSBvZiB0aGUgcmVnaXN0cnkga2V5DQo+ID4gKyAqIEB0eXBlOiB0
eXBlIG9mIGRhdGEgKDEgPSBpbnRlZ2VyKQ0KPiA+ICsgKiBAZGF0YTogdmFsdWUNCj4gPiArICog
QGxlbmd0aDogc2l6ZSBvZiBkYXRhLCBpbiBieXRlcw0KPiA+ICsgKg0KPiA+ICsgKiBBZGRzIGEg
cmVnaXN0cnkga2V5L3ZhbHVlIHBhaXIgdG8gdGhlIHJlZ2lzdHJ5IGRhdGFiYXNlLg0KPiA+ICsg
Kg0KPiA+ICsgKiBDdXJyZW50bHksIG9ubHkgMzItYml0IGludGVnZXJzICh0eXBlID09IDEsIGxl
bmd0aCA9PSA0KSBhcmUgc3VwcG9ydGVkLg0KPiANCj4gV2hhdCBpZiB3ZSBwYXNzIHNvbWV0aGlu
ZyBlbHNlPyBUaGlzIGZ1bmN0aW9uIGRvZXNuJ3Qgc2VlbSB0byBlbnN1cmUgbm90aGluZw0KPiBl
bHNlIGlzIGFjY2VwdGVkLiBBbHRob3VnaCBJIHJlY29nbml6ZSB0aGF0IGl0J3Mgb25seSB1c2Vk
IGJ5IGFkZF9yZWdpc3RyeV9udW0oKQ0KPiBlbmZvcmNpbmcgdGhpcyBsaW1pdGF0aW9uIGJ5IGl0
J3MgZnVuY3Rpb24gc2lnbmF0dXJlLg0KDQpHU1AtUk0gdGVjaG5pY2FsbHkgc3VwcG9ydHMgdHdv
IG90aGVyIHR5cGVzOiBiaW5hcnkgZGF0YSBhbmQgc3RyaW5ncy4gIEZvcg0KZXhhbXBsZSwgYXBw
YXJlbnRseSBpdCdzIHBvc3NpYmxlIHRvIG92ZXJyaWRlIHRoZSBWQklPUyBpdHNlbGYgd2l0aCBh
DQpyZWdpc3RyeSBrZXkuICBIb3dldmVyLCBJJ20gbm90IGZhbWlsaWFyIHdpdGggYW55IGFjdHVh
bCBub24tbnVtZXJpYw0KcmVnaXN0cnkga2V5cyB0aGF0IHRoZSB1c2VyIHdvdWxkIHNldC4NCg0K
SSBjYW4gYWRkIHN1cHBvcnQgZm9yIGJpbmFyeSBkYXRhIGFuZCBzdHJpbmdzLg0KDQo+IA0KPiA+
ICsgKg0KPiA+ICsgKiBUaGlzIGZ1bmN0aW9uIGNvbGxlY3RzIHRoZSByZWdpc3RyeSBpbmZvcm1h
dGlvbiBpbiBhIGxpbmtlZCBsaXN0LiAgQWZ0ZXINCj4gPiArICogYWxsIHJlZ2lzdHJ5IGtleXMg
aGF2ZSBiZWVuIGFkZGVkLCBidWlsZF9yZWdpc3RyeSgpIGlzIHVzZWQgdG8gY3JlYXRlIHRoZQ0K
PiA+ICsgKiBSUEMgZGF0YSBzdHJ1Y3R1cmUuDQo+ID4gKyAqDQo+ID4gKyAqIHJlZ2lzdHJ5X3Jw
Y19zaXplIGlzIGEgcnVubmluZyB0b3RhbCBvZiB0aGUgc2l6ZSBvZiBhbGwgcmVnaXN0cnkga2V5
cy4NCj4gPiArICogSXQncyB1c2VkIHRvIGF2b2lkIGFuIE8obikgY2FsY3VsYXRpb24gb2YgdGhl
IHNpemUgd2hlbiB0aGUgUlBDIGlzIGJ1aWx0Lg0KPiA+ICsgKg0KPiA+ICsgKiBSZXR1cm5zIDAg
b24gc3VjY2Vzcywgb3IgbmVnYXRpdmUgZXJyb3IgY29kZSBvbiBlcnJvci4NCj4gPiArICovDQo+
ID4gK3N0YXRpYyBpbnQgYWRkX3JlZ2lzdHJ5KHN0cnVjdCBudmttX2dzcCAqZ3NwLCBjb25zdCBj
aGFyICpuYW1lLCB1MzIgdHlwZSwgdTMyIGRhdGEsIHUzMiBsZW5ndGgpDQo+ID4gK3sNCj4gPiAr
CXN0cnVjdCByZWdpc3RyeV9saXN0X2VudHJ5ICpyZWc7DQo+ID4gKwlzaXplX3QgbmxlbiA9IHN0
cmxlbihuYW1lKSArIDE7DQo+ID4gKw0KPiA+ICsJLyogU2V0IGFuIGFyYml0cmFyeSBsaW1pdCB0
byBhdm9pZCBwcm9ibGVtcyB3aXRoIGJyb2tlbiBjb21tYW5kIGxpbmVzICovDQo+ID4gKwlpZiAo
c3RybGVuKG5hbWUpID4gNjQpDQo+IA0KPiBDb3VsZCByZS11c2UgbmxlbiBmb3IgdGhpcyBjaGVj
ay4NCg0KV2lsbCBmaXggaW4gdjQuDQoNCj4gDQo+ID4gKwkJcmV0dXJuIC1FRkJJRzsNCj4gDQo+
IFRoaXMgZXJyb3IgY29kZSBkb2Vzbid0IHNlZW0gdG8gYXBwbHkgaGVyZSwgcHJlZmVyIEVJTlZB
TC4NCg0KWW91IGRvbid0IGxpa2UgY3JlYXRpdmUgdXNhZ2Ugb2YgZXJyb3IgY29kZXM/DQoNCj4g
PiArCQl3aGlsZSAoKHN0YXJ0ID0gc3Ryc2VwKCZuZXh0LCAiOyIpKSkgew0KPiA+ICsJCQlsb25n
IHZhbHVlOw0KPiA+ICsNCj4gPiArCQkJZXF1YWwgPSBzdHJjaHIoc3RhcnQsICc9Jyk7DQo+ID4g
KwkJCWlmICghZXF1YWwgfHwgKGVxdWFsID09IHN0YXJ0KSB8fCAhaXNkaWdpdChlcXVhbFsxXSkp
IHsNCj4gPiArCQkJCW52a21fZXJyb3IoJmdzcC0+c3ViZGV2LA0KPiA+ICsJCQkJCSJpZ25vcmlu
ZyBpbnZhbGlkIHJlZ2lzdHJ5IHN0cmluZyAnJXMnXG4iLCBzdGFydCk7DQo+ID4gKwkJCQljb250
aW51ZTsNCj4gPiArCQkJfQ0KPiA+ICAgDQo+ID4gLQlycGMtPm51bUVudHJpZXMgPSBOVl9HU1Bf
UkVHX05VTV9FTlRSSUVTOw0KPiA+ICsJCQlyZXQgPSBrc3RydG9sKGVxdWFsICsgMSwgMCwgJnZh
bHVlKTsNCj4gPiArCQkJaWYgKHJldCkgew0KPiA+ICsJCQkJbnZrbV9lcnJvcigmZ3NwLT5zdWJk
ZXYsDQo+ID4gKwkJCQkJImlnbm9yaW5nIGludmFsaWQgcmVnaXN0cnkgdmFsdWUgaW4gJyVzJ1xu
Iiwgc3RhcnQpOw0KPiA+ICsJCQkJY29udGludWU7DQo+ID4gKwkJCX0NCj4gDQo+IEF0IGEgZmly
c3QgZ2xhbmNlLCB0aGUgc3RyaW5nIHBhcnNpbmcgbG9va3MgY29ycmVjdCB0byBtZS4gRGlkIHlv
dSB0ZXN0IHdpdGggaW52YWxpZA0KPiBzdHJpbmdzIGFzIHdlbGw/DQoNClllcy4gIEl0IHdvdWxk
IGJlIG5pY2UgaWYgdGhlcmUgd2VyZSBhIHJlZ2V4IHBhcnNlciBpbiB0aGUga2VybmVsLCBidXQg
SQ0KdGhpbmsgSSBkaWQgYSBnb29kIGpvYiB0ZXN0aW5nIGFuZCByZWplY3Rpbmcgc3RyaW5ncy4g
IA0KDQo+ID4gLQlzdHJfb2Zmc2V0ID0gb2Zmc2V0b2YodHlwZW9mKCpycGMpLCBlbnRyaWVzW05W
X0dTUF9SRUdfTlVNX0VOVFJJRVNdKTsNCj4gPiAtCXN0cmluZ3MgPSAoY2hhciAqKSZycGMtPmVu
dHJpZXNbTlZfR1NQX1JFR19OVU1fRU5UUklFU107DQo+ID4gLQlmb3IgKGkgPSAwOyBpIDwgTlZf
R1NQX1JFR19OVU1fRU5UUklFUzsgaSsrKSB7DQo+ID4gLQkJaW50IG5hbWVfbGVuID0gc3RybGVu
KHI1MzVfcmVnaXN0cnlfZW50cmllc1tpXS5uYW1lKSArIDE7DQo+ID4gLQ0KPiA+IC0JCXJwYy0+
ZW50cmllc1tpXS5uYW1lT2Zmc2V0ID0gc3RyX29mZnNldDsNCj4gPiAtCQlycGMtPmVudHJpZXNb
aV0udHlwZSA9IDE7DQo+ID4gLQkJcnBjLT5lbnRyaWVzW2ldLmRhdGEgPSByNTM1X3JlZ2lzdHJ5
X2VudHJpZXNbaV0udmFsdWU7DQo+ID4gLQkJcnBjLT5lbnRyaWVzW2ldLmxlbmd0aCA9IDQ7DQo+
ID4gLQkJbWVtY3B5KHN0cmluZ3MsIHI1MzVfcmVnaXN0cnlfZW50cmllc1tpXS5uYW1lLCBuYW1l
X2xlbik7DQo+ID4gLQkJc3RyaW5ncyArPSBuYW1lX2xlbjsNCj4gPiAtCQlzdHJfb2Zmc2V0ICs9
IG5hbWVfbGVuOw0KPiA+ICsJCQkvKiBUcnVuY2F0ZSB0aGUga2V5PXZhbHVlIHN0cmluZyB0byBq
dXN0IGtleSAqLw0KPiA+ICsJCQkqZXF1YWwgPSAwOw0KPiANCj4gV2hhdCdzIHRoZSBwdXJwb3Nl
IGZvciB0aGF0Pw0KDQpUYWtlIGZvciBleGFtcGxlLCB0aGlzIHBhcmFtZXRlciBwYXNzZWQgdG8g
Tm91dmVhdToNCg0KCU5WcmVnX1JlZ2lzdHJ5RHdvcmRzPSJSTTE0NTc1ODg9MTtURVNUPTUzIg0K
DQpUaGUgc3Ryc2VwKCkgY2FsbCBwb2ludHMgJ25leHQnIHRvICJSTTE0NTc1ODg9MSIsIHJlcGxh
Y2luZyB0aGUgOyB3aXRoIFwwLg0KDQonZXF1YWwnIHRoZW4gcG9pbnRzIHRvIHRoZSAnPScuICBr
c3RydG9sKCkgY29udmVydHMgdGhlICIxIiB0byAxLiAgU28gYWxsDQp0aGF0J3MgbGVmdCBpcyBl
eHRyYWN0aW5nIHRoZSAiUk0xNDU3NTg4IiBpbnRvIGl0cyBvd24gc3RyaW5nLiAgVGhhdCdzIHdo
YXQNCiIqZXF1YWwgPSAwIiBkb2VzLiAgDQo=
