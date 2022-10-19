Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A113604D79
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 18:33:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 998C010E90E;
	Wed, 19 Oct 2022 16:32:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from na01-obe.outbound.protection.outlook.com
 (mail-centralusazon11013009.outbound.protection.outlook.com [52.101.64.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4528F10E90E
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 16:32:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UeMP2UdF9Rc/sh4l3FP5xghvV6HLqjsYVU7KPc6B4DtZHU+T8pvOLdxGr1RllQFz4fmWjOWVEC+XH5/kXW9wyJ+z34yHCh2aigvMIC1rfUHrU2l+jvhXPMJjzhWOzIUIHCioASGntA9QgFS/PqDxC5sFlzoPWAfqi/ouMpXZnoOIrRWh6SaYIlyRjroIs2+6idqRiqvrDi0wJJl87l1bGr4nZf4edOmShbaWhky//RNuOWclbAT/7nDrKD170SD04bMXuwI3/kb3GW3QC4WQ4tx14dlbyABHmXbkZpRvxr5q1NAGlinWKqCRkEkBwlE40vkoAQNrgute2gPecYCrUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xz183M7+esU27ms3/n28H9unnCqgr+PGsItwimXmUH4=;
 b=KdM1N5NwuyFxo126BnBDBR+HbT0845P4UNYAcY/1wkuy40merLoNNkrFW6KVJF65b6zn88rHW8BF7D6SdYWEEVvEkHIStZ2d26fgrI9SWhtjODu0TI8jH8uxL+eeBnlNxHbWxUnmlm3yN/zV+332xQoR0L2lS8nrMqvnzW2cIJ/Ohw17MFbJR98ZTY5McoGGWvinWGKd8VigMewSlbkMW+JGt6F13uakM75mVF2334TkKvxfdPTo2+CL/XsO2SBFaZQxVLh8IIdyPzhU8PnETJ8Pgkjtt2006fCavDRfbwpmbin5evS6izzaU7sjhl2/4j270hz3OMDOrHsUahXVZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xz183M7+esU27ms3/n28H9unnCqgr+PGsItwimXmUH4=;
 b=OvjqcjTmyzMSpg944Muycu9ROilF2Lv6Y/Aw9jtP02FefucBAcA/CBGLQqLhnOeYKQR+rlUag0bFwsmCuXUG/wznbdTv6fKSz+FnYggNUrx/W7tBbuAvrLqWPAui2xVGPRnk8NrkrEzl/rdMv+UB4UktkOAQALrf53BjADdFJkE=
Received: from CY4PR05MB3047.namprd05.prod.outlook.com (2603:10b6:903:f4::7)
 by BYAPR05MB4822.namprd05.prod.outlook.com (2603:10b6:a03:50::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.20; Wed, 19 Oct
 2022 16:32:41 +0000
Received: from CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::d893:b27e:529:35ae]) by CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::d893:b27e:529:35ae%7]) with mapi id 15.20.5746.017; Wed, 19 Oct 2022
 16:32:41 +0000
From: Zack Rusin <zackr@vmware.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "thomas_os@shipmail.org" <thomas_os@shipmail.org>
Subject: Re: [PATCH 05/16] drm/vmwgfx: Refactor resource validation hashtable
 to use linux/hashtable implementation.
Thread-Topic: [PATCH 05/16] drm/vmwgfx: Refactor resource validation hashtable
 to use linux/hashtable implementation.
Thread-Index: AQHY4mJWzAsU1TAPKUSNg5oUCn2LvK4VhFWAgABntQA=
Date: Wed, 19 Oct 2022 16:32:40 +0000
Message-ID: <3e4aab9f149159e3c860374f2d6fb33e1ec28c7c.camel@vmware.com>
References: <20221017195440.311862-1-zack@kde.org>
 <20221017195440.311862-6-zack@kde.org>
 <968d3fa5-aa51-d388-7ec1-7c2e6dfb0911@shipmail.org>
In-Reply-To: <968d3fa5-aa51-d388-7ec1-7c2e6dfb0911@shipmail.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR05MB3047:EE_|BYAPR05MB4822:EE_
x-ms-office365-filtering-correlation-id: 6db7c03b-6ed9-49bd-25ae-08dab1ef8ad9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rXGP5ft1uEpCdhXgrBFzjhAbv9AgZSKNBZtPpzXshxtUomxwONaLbLg8o0lm5so40kVsAhnaXohvd+tzQN4yhzRsfHpji24m46J4jHDPEF7DI6Rohs48tjJF9ysDcbQVd3ob096u2gZqv4CIMXVfaDTh/zD/sNqofO/mDusU1OlE1Rypxs5OuxMv8gwLQJ2T06dQEnHxVwLB+pLun00mvX8crTY2Gx8P+ZvG5eCYu4ZsDyrI+W5erE1NT28Lu3YYx3zjltYOyN0QUcTHrjgXdVhPS6QQj7zcmfqW/t6yk1VR7kOUfSdqjipj5DA0DzQgMyvCbbd94tbKClzIOA/zU9gFz8HPglEqMprAWIoE05yDBFClRwF/b3jl6MjdhLTQtLxJANlntScLaNTzlCfsrXwlmeA3R/GWNnaYN5ynz+h1a6bC9lqwqykiCq6UaEQmd7v9l9LMz0SQ0c6t3sjnQbnN9GWDzByE3nqlTQwiRma5Xn390bxkGWcrprZ7A0VEDmyKWiFyjkQqiqlTPnMZAIAOy+UeiKQhSt0bHLnWR/pSrAEQwVHqEwStlyPWwe3i6GBZBRdFiEF5+5noKrt0S00Z85iLfVIoc3nOHJUAVHoVzBoScbZveOa1LCqpeLIrB5cqwCUUQR+8udQRLeO2EgZOwAtLnNbgGOr4UXNVxC/d4GOBR/vUMYJSV/J4jlX7GKRThJ1PvYTLAxEwhnAX595hwIcTofEqyKziT83MD160aWtsmJ625+zxG5JBijBrkFOn64GMFLKVstTUptdkRMot6xN39IbyegyPSKkUMRZNAJPObAw2qCvtuZUEb+OD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR05MB3047.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(396003)(376002)(366004)(346002)(451199015)(478600001)(71200400001)(83380400001)(86362001)(6486002)(76116006)(107886003)(66946007)(36756003)(91956017)(66476007)(66556008)(53546011)(66446008)(8676002)(6506007)(316002)(41300700001)(26005)(6512007)(8936002)(110136005)(4326008)(54906003)(5660300002)(2616005)(4001150100001)(2906002)(186003)(64756008)(122000001)(38070700005)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dmFtK1d6WndPOEoxTEhoZVBmUUZpOSszWFRQVHdHT2RLa0ROMzlkeDZ2c0JS?=
 =?utf-8?B?RUMvRkVIMjh4K3Bob3ZFNzVwRGpQaE1jMUdSVFRublk2ZWkzZHB2akhacDBq?=
 =?utf-8?B?WHFDQy8xS0JualJ5YnZQUG5QN3lVNU1LbEEyOXkwSG00czNHRUpkdHBuU0lI?=
 =?utf-8?B?TG5kU2JwV1Q3V1cwZ1M1Z0dUYm94QlBzV2haVUNBcEtXcGxTK0pFUUI1WGg2?=
 =?utf-8?B?dHJjK3d2NXZDZXFBNEkxR0ZSbHNxUlhwWDlVUVdUU1Npb2hkckVKNWhub2JB?=
 =?utf-8?B?RkFoc2pRT1liU1RDemxrODQ4M0Q2ckwzeVVRRUlGejlzdlVYd2hoN2xoS0pC?=
 =?utf-8?B?V3JndkhBTHdrMXBUVkVJeUh2ZWhwVEh5YXk0bU02WTUrUjNvYkxOaHhkMDlL?=
 =?utf-8?B?NWQ1VFoyUFNGb00zWkVmaU5jRHdSN1lGMEF6UE5HVlVxVWFncUFnT3lIb0ha?=
 =?utf-8?B?d3N5QUFZaExnb3dLSmlHMjVLek54MmdVTnlVN1EvanhPaTErN3o5bm9EbHgz?=
 =?utf-8?B?aDhUK3lrSk5QdVhpcnJzRXJnY3hmdVlnTVFPYXhpOWUvU2s3K0JyNWV1TVZN?=
 =?utf-8?B?WTdONUtWS1pyMHZGc1BjYVlEWTMwbXZROGZpWkppQjRZN1k1eWlyWEJpeEds?=
 =?utf-8?B?amo5SEdrQlQvd3JNdmZNcUpsOEt2cUk5ckoxUVlrMEY0Z1E1SDN3ZDdWT0o3?=
 =?utf-8?B?bUNFWGxhZThjbkwzSjhUS2g1TnBTd0dsdWNIQ3QxSnpIN3Irc1duUTBoSjZj?=
 =?utf-8?B?b0dINHZ2eTZaODN0QllwWFRDQVEwNnZSMHhrK0txVFo5WjJ5NlVtWlZpUmdD?=
 =?utf-8?B?MkxNMktaTWpYVlJyNVNNUEZ6U3FrQTF5bHRmeWNmcXY4Z1J6OS90T0JlT1Z0?=
 =?utf-8?B?QUNwRUpnejZqOHJTMjd0R1JzV3IvZnNzUGRXYU1HRzBONjUreUpjMGZWMFRH?=
 =?utf-8?B?Q3RlTjd3ZGRyTWVjV0s1dVdUQ1ZJeGFlTm1NYUVOWCtmc0RvaGlYMjZXQVVh?=
 =?utf-8?B?Zjg1bjJNeC82MEROTjcxNlVaWTI2V08vWDhIbVdNWi9PUEw0U0JYRnBVTWZJ?=
 =?utf-8?B?ZFVlbG5tZkZoZWN5ck82SVhrNmNvNTBmWUtHTTdaNXBoaVRlR0paVVJpbUha?=
 =?utf-8?B?S0w0TkEyUnMzcXN0ZjkyanZIRTBPbmdZSjI5UU44OGQ3cjVjR09ZczMwaUJy?=
 =?utf-8?B?VytTdmpQM2RZR3hYbFhVT2ExaW5DcjdWaWlhSDBzSVY2ZDlMQXFXdkZ5WVhJ?=
 =?utf-8?B?VE5SMTQveHdJTnFpd09RR3YwVkx4emtYbmJBRm5lY0dhVUloaCtLRi9PRTdx?=
 =?utf-8?B?Ym8vR3lPY2pTUWZGMHBiUlB6ZVRONVpjWnlJblljYnF1NEVKZHc2bXpsajFF?=
 =?utf-8?B?YWZxMFVkK0o5Qk9PSWtybHh5RURycU9yTU1Sa09YY0xnRnJLeERxQkRsYUc1?=
 =?utf-8?B?Uk1YVDNtQUNuUkpRSzVseGFsalZCcjhsRmlGaTlBSDBhTE02R3BFTVNqOUEz?=
 =?utf-8?B?ZVZLbFluVW91ekM1VS83em1YbjBuenVRMUlGdXdyaDZybWdUWWdCMXlGc2dC?=
 =?utf-8?B?Qy96NXhYMGM5TmtYaWVGYnRkallkUzdKUkMyYXFNTVhweGMxMmxGU1lTUEUx?=
 =?utf-8?B?V3FPSGw1TEN3b3hiN0d3N05maHNTRFgrcld3azc2MGRaRWdSdDlldDdrVWhS?=
 =?utf-8?B?Z2YzNThFU2tGTFc2RGF2YWpJLy9LcENRT2dBNTFMUy8zR2FmZms5NURLZ2E3?=
 =?utf-8?B?QlhGSEp5TnYvWC9wVmFDMWRTQzdZQ3RxUC9ReE5rK3hFTUlrVGFjSmlYeGZG?=
 =?utf-8?B?SS9HVXZBTnFOOEt0aEFvanJibVBReGUrU2Vud09jYmp1WWJUNzlLT012M3VH?=
 =?utf-8?B?OTBiLzE0NjdSZ3I1aStuQ0tUVktzYXBKVEtaUHRCclU1S1JNN3hrWWdKRFd6?=
 =?utf-8?B?bzRMRTNJMUxTL1QzRDU5V0I5OFAwUm9FTUR1SUNTdWg4UlFWaHYyK05YUWgx?=
 =?utf-8?B?RnBjQXFucXp4OXc2bUpXV1dQTytuVzV5U25DODZVLysxanV5aStZTEQ4NjZs?=
 =?utf-8?B?UFFWMXozZXJGQ2ZRSWpLR0xnOUsrbi9zVzZ3SkxJNUFxdTN3TlpzTHo4VGtV?=
 =?utf-8?Q?zo0Gi3IKP/cgWsX95Crk4cpLP?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6CD812303D5F144484823E061C4F9B61@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR05MB3047.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6db7c03b-6ed9-49bd-25ae-08dab1ef8ad9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2022 16:32:41.0508 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y1Sqvn5R/Uh9BCujDcB6CZpOzIWt+4B/pv2ZK4btZ2AcfBwePefXvmOHe/NwO3dP2+2rK79NwyxIQ4cajIjCOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR05MB4822
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
Cc: Martin Krastev <krastevm@vmware.com>, Michael Banack <banackm@vmware.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIyLTEwLTE5IGF0IDEyOjIxICswMjAwLCBUaG9tYXMgSGVsbHN0csO2bSAoSW50
ZWwpIHdyb3RlOg0KPiDimqAgRXh0ZXJuYWwgRW1haWwNCj4gDQo+IE9uIDEwLzE3LzIyIDIxOjU0
LCBaYWNrIFJ1c2luIHdyb3RlOg0KPiA+IEZyb206IE1hYXogTW9tYmFzYXdhbGEgPG1vbWJhc2F3
YWxhbUB2bXdhcmUuY29tPg0KPiA+IA0KPiA+IFZtd2dmeCdzIGhhc2h0YWIgaW1wbGVtZW50YXRp
b24gbmVlZHMgdG8gYmUgcmVwbGFjZWQgd2l0aCBsaW51eC9oYXNodGFibGUNCj4gPiB0byByZWR1
Y2UgbWFpbnRlbmVuY2UgYnVyZGVuLg0KPiA+IEFzIHBhcnQgb2YgdGhpcyBlZmZvcnQsIHJlZmFj
dG9yIHRoZSByZXNfaHQgaGFzaHRhYmxlIHVzZWQgZm9yIHJlc291cmNlDQo+ID4gdmFsaWRhdGlv
biBkdXJpbmcgZXhlY2J1ZiBleGVjdXRpb24gdG8gdXNlIGxpbnV4L2hhc2h0YWJsZSBpbXBsZW1l
bnRhdGlvbi4NCj4gPiBUaGlzIGFsc28gcmVmYWN0b3JzIHZtd192YWxpZGF0aW9uX2NvbnRleHQg
dG8gdXNlIHZtd19zd19jb250ZXh0IGFzIHRoZQ0KPiA+IGNvbnRhaW5lciBmb3IgdGhlIGhhc2h0
YWJsZSwgd2hlcmVhcyBiZWZvcmUgaXQgdXNlZCBhIHZtd2dmeF9vcGVuX2hhc2gNCj4gPiBkaXJl
Y3RseS4gVGhpcyBtYWtlcyB2bXdfdmFsaWRhdGlvbl9jb250ZXh0IGxlc3MgZ2VuZXJpYywgYnV0
IHRoZXJlIGlzDQo+ID4gbm8gZnVuY3Rpb25hbCBjaGFuZ2Ugc2luY2UgcmVzX2h0IGlzIHRoZSBv
bmx5IGluc3RhbmNlIHdoZXJlIHZhbGlkYXRpb24NCj4gPiBjb250ZXh0IHVzZWQgYSBoYXNodGFi
bGUgaW4gdm13Z2Z4IGRyaXZlci4NCj4gDQo+IFdoeSBpcyBhIHBvaW50ZXIgdG8gdGhlIHZtd19z
d19jb250ZXh0IGFkZGVkIHRvIHRoZSB2YWxpZGF0aW9uIGNvbnRleHQsDQo+IHJhdGhlciB0aGFu
IGEgcG9pbnRlciB0byB0aGUgbmV3IGhhc2ggdGFibGUgdHlwZSBpdHNlbGY/IFNlZW1zIGxpa2Ug
YW4NCj4gdW5uZWNlc3NhcnkgaW5kaXJlY3Rpb24gd2hpY2ggYWRkcyBhIGRlcGVuZGVuY3kgb24g
dGhlIHN3IGNvbnRleHQgdG8gdGhlDQo+IHZhbGlkYXRpb24gY29udGV4dD8NCg0KSGksIFRob21h
cy4gVGhhbmtzIGZvciB0YWtpbmcgYSBsb29rIGF0IHRoaXMhIFRoYXQncyBiZWNhdXNlIHRoZSBl
bnRpcmUgcHVibGljDQppbnRlcmZhY2Ugb2YgaGFzaHRhYmxlIGRlcGVuZHMgb24gaXQgYmVpbmcg
YSBzdHJ1Y3Qgb24gd2hpY2ggc2l6ZW9mIHdvcmtzIHJhdGhlcg0KdGhhbiBhIHBvaW50ZXIsIGku
ZS4gYWxtb3N0IHRoZSBlbnRpcmUgaW50ZXJmYWNlIG9mIGhhc3RoYmFsZS5oIGlzIGRlZmluZWQg
YW5kIHRoZXkNCmFsbCByZXF1aXJlIHRoYXQgSEFTSF9TSVpFKGhhc2h0YWJsZSkgd2hpY2ggaXMg
ZGVmaW5lZCBhcw0KI2RlZmluZSBIQVNIX1NJWkUoaGFzaHRhYmxlKSAoQVJSQVlfU0laRShoYXNo
dGFibGUpKQ0Kd29ya3Mgb24gdGhlIGhhc2h0YWJsZS7CoFNvIHRoZSBpbnRlcmZhY2Ugb2YgaGFz
aHRhYmxlLmggY2FuJ3Qgb3BlcmF0ZSBvbiBwb2ludGVycywNCmJ1dCByYXRoZXIgbmVlZHMgdGhl
IGZ1bGwgc3RydWN0Lg0KDQpTbyB0aGUgb25seSB0d28gb3B0aW9ucyBhcmUgZWl0aGVyIHJld3Jp
dGluZyB0aGUgZnVuY3Rpb25zIGZyb20gbGludXgvaGFzaHRhYmxlLmggdG8NCnRha2UgZXhwbGlj
aXQgSEFTSF9TSVpFKGhhc2h0YWJsZSkgb3IgbWFrZSBzdXJlIHRoYXQgaW4gdGhlIGZ1bmN0aW9u
cyB3aGVyZSB5b3Ugd2lsbA0KdXNlIGhhc2h0YWJsZS5oIHlvdSBwYXNzIHRoZSBwYXJlbnQgc3Ry
dWN0IHNvIHRoYXQgc2l6ZW9mIG9uIHRoZSBoYXNodGFibGUgd29ya3MNCmNvcnJlY3RseS4gSSd2
ZSBzZWVuIGJvdGggYXBwcm9hY2hlcyBpbiB0aGUga2VybmVsLCBidXQgaW4gdGhpcyBjYXNlIHdl
IHRob3VnaHQgdGhlDQpsYXR0ZXIgbWFkZSBtb3JlIHNlbnNlLg0KDQoNCj4gPiArICAgICBpZiAo
Y3R4LT5zd19jb250ZXh0KSB7DQo+ID4gICAgICAgICAgICAgICBzdHJ1Y3Qgdm13Z2Z4X2hhc2hf
aXRlbSAqaGFzaDsNCj4gPiArICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcga2V5ID0gKHVuc2ln
bmVkIGxvbmcpIHZibzsNCj4gPiANCj4gPiAtICAgICAgICAgICAgIGlmICghdm13Z2Z4X2h0X2Zp
bmRfaXRlbShjdHgtPmh0LCAodW5zaWduZWQgbG9uZykgdmJvLCAmaGFzaCkpDQo+ID4gLSAgICAg
ICAgICAgICAgICAgICAgIGJvX25vZGUgPSBjb250YWluZXJfb2YoaGFzaCwgdHlwZW9mKCpib19u
b2RlKSwgaGFzaCk7DQo+ID4gKyAgICAgICAgICAgICBoYXNoX2Zvcl9lYWNoX3Bvc3NpYmxlX3Jj
dShjdHgtPnN3X2NvbnRleHQtPnJlc19odCwgaGFzaCwgaGVhZCwga2V5KSB7DQo+IA0KPiBUaGlz
IG9wZW4tY29kZWQgbG9vcCBzZWVtcyB0byBiZSB1c2VkIHRocm91Z2hvdXQgdGhlIGNvbnZlcnNp
b24sIGFuZA0KPiBhbHNvIGluIG90aGVyIHBhdGNoZXMuIFBlcmhhcHMgYSBzbWFsbCBoZWxwZXIg
aW4gcGxhY2U/DQoNClllcywgdGhhdCdzIGEgZ29vZCBpZGVhLiBXZSdsbCBzZWUgaWYgd2UgY2Fu
IGFic3RyYWN0IHRoYXQuIFRoZSB0cmlja3kgYml0IG9mDQphYnN0cmFjdGluZyBjb2RlIHRoYXQn
cyB1c2luZyBoYXNoXyogZnVuY3Rpb25zIGlzIHRoYXQsIGFzIG1lbnRpb25lZCBhYm92ZSwgdGhl
c2UNCmFyZSBhbGwgbWFjcm9zIHRoYXQgZGVwZW5kIG9uIGhhc2h0YWJsZSBub3QgYmVpbmcgYSBw
b2ludGVyLCBzbyBpZiB5b3UgY2FuJ3QgZml0DQp5b3VyIGhlbHBlciBpbiBhbm90aGVyIGRlZmlu
ZSB0aGVuIHlvdSBoYXZlIHRoZSBzYW1lIGNob2ljZSBhcyBhYm92ZSAoaS5lLiByZXdyaXRlDQp3
aGF0ZXZlciBoYXNoXyogZnVuY3Rpb24geW91IHdlcmUgdXNpbmcgdG8gYWxsb3cgZm9yIGV4cGxp
Y2l0IGhhc2ggc2l6ZSwgb3IgbWFrZQ0KeW91ciBoZWxwZXIgdGFrZSB0aGUgcGFyZW50IG9mIHRo
ZSBoYXNoIGFzIGFyZ3VtZW50KS4NCg0KDQo+IE90aGVyd2lzZSBMR1RNLg0KDQpUaGFua3MhIA0K
DQp6DQo=
