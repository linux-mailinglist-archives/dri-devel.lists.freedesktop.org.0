Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C222E508F9C
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 20:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FF310E1E8;
	Wed, 20 Apr 2022 18:41:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2080.outbound.protection.outlook.com [40.107.93.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 378C210E1E8;
 Wed, 20 Apr 2022 18:41:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FtTOKnD5SsPzTUdGFEVImjmNplLA2lbsiUd28EO20nd61tLvBOPyU/Nb+k/MYbqACBCGPmywnFAKr/r42uYymDUqv+9IapjXENZoiUbS2ZpLa2RZium1qXd2WGYI2tJJiaXSLlMzGwVCJSB0+Y8n9Eb84AgypXjpGHxl+E4BAZ5kwxS6n/1eObfgdoPrYuXnWIAFf1WENLV+8fQHB+d7weJIjb5EHOpNGz+TAApLD2RMoTMh3xU2RBJ8npCoFLJBB6DADJsGhHUQygwEdfooLWA17jjSYUbJmPQXXecicZ2GCn+dT5d+tuairs2pnXxDEWeRFIuRNH7VqWetU6wAIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AnX9VBByf/TpON90i6N8yKqUyx64kvzjY8fwYIcdmPY=;
 b=ajcHDfzAKpQFZ6AF6Ol0mDRU0FFdcFcW1yDXlokjRs//on68SSveFNgfrjUtNdjMCjmS7H719Q235I6PZ4W2C4BnXU9F/I0lFpDVFYKC4aBEhUF1NpiqjtisGNFAYlZE22sEh5SerTp5DHyHzx2rmSR0HUqxx1Esq1f3zNdqG6PTF9tPsz3ZXO33S93Y8TMSaqdD+ylquutCZIwpzezGlIY9akna6XOyxPiRmpCFmU5ot62PZTyoq6bqEDKrOXlunL0tM/YXwwezUkBe1sS7+ZqPE/mx+BHWAU+67SqtIBPiKFVZVbwO/YoXk7wghekaUPVm2YW+fMRbvMnK9kigzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AnX9VBByf/TpON90i6N8yKqUyx64kvzjY8fwYIcdmPY=;
 b=RBQRURfTgo218diYFxnChxT6GjzYXhQtkqwiAUKWhOUGwo4B6jdehTnNn7cE7nrYlljyRFdMODZsfNjiSHamMeI7viGIo+OGvh58H/au4XXvDwxh5eVbIk9TLqTzVrM8ZA73spMKuL3PpfzaJhOh9kKJY5uILU0I8hPUaCuDp8A=
Received: from BN8PR05MB6611.namprd05.prod.outlook.com (2603:10b6:408:57::15)
 by SN6PR05MB5149.namprd05.prod.outlook.com (2603:10b6:805:e1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 20 Apr
 2022 18:41:32 +0000
Received: from BN8PR05MB6611.namprd05.prod.outlook.com
 ([fe80::2cee:3759:958:cf21]) by BN8PR05MB6611.namprd05.prod.outlook.com
 ([fe80::2cee:3759:958:cf21%7]) with mapi id 15.20.5186.013; Wed, 20 Apr 2022
 18:41:32 +0000
From: Zack Rusin <zackr@vmware.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 03/15] dma-buf & drm/amdgpu: remove dma_resv workaround
Thread-Topic: [PATCH 03/15] dma-buf & drm/amdgpu: remove dma_resv workaround
Thread-Index: AQHYSl3exfVYH/xFlEu2kvqVBiXOdKz4QIGAgAA93oCAAKfqAIAAAGQAgAARGQA=
Date: Wed, 20 Apr 2022 18:41:32 +0000
Message-ID: <e1c60e2a1478c406f515d51608a751fdc9feff3a.camel@vmware.com>
References: <20220407085946.744568-1-christian.koenig@amd.com>
 <20220407085946.744568-4-christian.koenig@amd.com>
 <60ab53ce1ce1333f5e6a15fc83c3c05cd9bd1084.camel@vmware.com>
 <4c2e9414-3926-c9d7-8482-0d6d9191c2ac@amd.com>
 <fe8916b53b0f0101e6616d23eb6896399b092d58.camel@vmware.com>
 <54d00af9-9384-5794-490c-7d4cafe086b6@gmail.com>
In-Reply-To: <54d00af9-9384-5794-490c-7d4cafe086b6@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4-1ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f91146d4-d5c3-43d5-7647-08da22fd6424
x-ms-traffictypediagnostic: SN6PR05MB5149:EE_
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs: <SN6PR05MB5149A9E3BBF25D67A1E4A41BCEF59@SN6PR05MB5149.namprd05.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m2D+CD3C5xTZq6FlcfSnASPArxc4+e1YvWMzjZ4KMBBR3hUnNXnsArwClgEpxSD7EQ5mRQwlqll8hlVTpVNuykviu/0Pu+F6kyKzX6464mP8c7It/tFz9C9EX3S5VQA/OxxVAKooucqv/iI3C+eAky5TV93eNEusTdmAtmM98AYIjylfk/QrLxTmFeQZ/cMQxk5eRIB6CNGsPCOmF3yf3RhBT96GjnDURSn/M5I5dfLaRx5UocAe9vqNb2LogoW+W8iMk9QnxuEjAtJ14l4KaimLdh6q/BOZSFkQjjUZpZUfaOBU1Qh6wozqn5SOeijuK0f6K3SvtttkVolFgNJIRXp6HeDkqt/2A3CipFYnIqt8n38r4QoBHVNLYjRs/NZ5kzreNznXsk1VaBckrNaqP2WdDT+zdgDfkjmIqZrWwIwboO7x3Sx/vW4gBHMGK52K4NWDnGBMQ9EQplwvEtZ4N1OLY+h5yBckDkb4Ur8SVPcLazSOJVXp8BGj9OFn8PNPuN7ca9tB+/wd4ImrEWxXPe5KxS+J58JTgHYXOK3BwDohYpj+gJHbSZ/bc6rSJ83SEtct69BGc12Rc3TI0/3x4ve3llFhu6eWDWW8jv1flEj4G0vNG9x8R01H+L6POy8kWukn1wnO2/3AntvuagNzkDVyJ9DYLbniSEiGNkYFYORqWtA2PfuA7vdtEui3m2gIZk1o9dNOAIBKWsqyqxGlyA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR05MB6611.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(186003)(36756003)(110136005)(316002)(508600001)(2616005)(26005)(5660300002)(6506007)(2906002)(83380400001)(4326008)(8676002)(86362001)(8936002)(66446008)(66556008)(66946007)(76116006)(38070700005)(64756008)(66476007)(122000001)(91956017)(6512007)(71200400001)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MHNNeHF4aGx3bTZwbE1MZ09zcC9PK21FL0FwMFQzMFE1OWREdHNza2o0WTYz?=
 =?utf-8?B?MWxRY0VMdS81V05xb0dpUHpCRDNiNVZubVp3YUxKSUZSUEh0ZGNUd1pIU0FL?=
 =?utf-8?B?Y1hzajRPdkVaY21EdWN1NERzb2Y3SmlHYlBpNnZYTFpqcTczSHoyVE1JVGRL?=
 =?utf-8?B?VGFXTVN1Q3hrZEcrWFY5TGM2NU5WMVZ6VFlPWWN0UENqOGZIdFp4WjZQYTB1?=
 =?utf-8?B?Yzd6MjhvaXloU3BVUjhJKzFPaTBnb3hudXovVEp5bnkza3VYeXdaYm12dUV1?=
 =?utf-8?B?NngrUTFaWTI5dDZuT3BjVzJ5QmVLTzBIQ29OZE9ma2R6NDkvWVE0ZExROVlt?=
 =?utf-8?B?VEd0V25vYXRMZnorRHcrTkIvTjhKcGNBYzBXM2hraUE4ZVpGVjFnZWxrSVF5?=
 =?utf-8?B?QU93QjNEMmwzdUU4QjcwaU5EemI5Yk5hQ3VwUXdPT2EzUGsvbWloaVBXV0F1?=
 =?utf-8?B?RGZBdlRWZ0JWcnV3amF1ek5kaEpCVmNUdDBSUjhxNDRWc05Sd21rc2lZMllD?=
 =?utf-8?B?M1RBVU12bE5EUG5DRDU5LytVNDJ1WEU1K29lZ24reXVrRWxEVHl6RVhaL2Z1?=
 =?utf-8?B?eUpaNDdrazBoL1pUTlZkd2ZiRzRQSkRidEs1NzZVcXdldGttcm9PVFhoc2N6?=
 =?utf-8?B?My9FMGVpa2JiVWNOZ1hBSHUxc3VDNHpXZFZxMTEvN2h3VHovWTMram11YTQ5?=
 =?utf-8?B?blFDR3FpTmYvQTd5VkpDMmJOOGhtaFNxQU5hY2VES3ZKUlRaMVYxU0ZQK3hO?=
 =?utf-8?B?S3Y2QmJHY05iVEkxQS9UeTB2THJHL2pnZ2xuUEVmcVd2WndUR3ROQURKaXJ4?=
 =?utf-8?B?NW93dk0xbVAwYnovbXg0ZnlobzJzdGVCdm1jNHlJU0FiYjE1akxvMVhLd0hh?=
 =?utf-8?B?VG5kSzBBQzdtUE5GNXNmMGVMS043T3BacnE3WUVjdHNabzlselFLNWpGaGFM?=
 =?utf-8?B?N1dPS1VXUlhyMEdrSlNXMUNHaTd4dk5QRnp0K2FyK0hZYVFhL1NiOCttVUtk?=
 =?utf-8?B?d0NRVW5aWkhVN000T0M4Y0ZIeUtpTzI0SE9hNVBkckpkZUJQN0RucmxZeTds?=
 =?utf-8?B?R1JxK1lxWXYzcHRRaGJYQ0t3L2NVMDdpcEdXcmdYOVhBSi9iczdYUlFTVk5I?=
 =?utf-8?B?YURpYUhsdnRsdFZBeU9Sdkd0bm1DVWNSU0I4NjMyU1pLaEowVENydHgxQkdm?=
 =?utf-8?B?OW40ZXdralluSy9PUERaSjZyelB6WGxoSFM5Y2x5K25pbkp3VWZ3NUNDOHhi?=
 =?utf-8?B?Z2hYQjl6TklRbVprS3JWb3pRODU3ZVRMT2F6d3VwNEtFeVovL2NObUpCNktW?=
 =?utf-8?B?ajdnTHBKUmpxZmZScmxUcmFBVThTc1lKNlJhbFU5aCswTFJwRHlkU2tORTNZ?=
 =?utf-8?B?enF5d2lCbk92Z3BpNFJVekFOb0dBRW1BbzRnRnFuV2tnVFZLbW9nNXk1Sk1Y?=
 =?utf-8?B?aXdNVEZCNUZpUjBOeU1KeHhiRmVnS3hzN0pNUmdWM2QzVGpWM0hEQ2VKRU56?=
 =?utf-8?B?NU1IUnZFYUdHSDB2Q203TjUrV2FnZzA2YUdHOWxGeG9mQjVIOG1XbW82d0Zm?=
 =?utf-8?B?NzAzL3lmZnlOY2pndHN2d1grOHR3bCtWMi9ud25QRVY0NVp1NExxQ0kxUGZI?=
 =?utf-8?B?dDFUclRweHByWGdxN0pwRGI1aGpiQTN3L1ByVzFOTCt4bWJIRGtMSGcxSzNs?=
 =?utf-8?B?VWVFN0EwQkp6U2pJSkl3dXJERlZQSk5DS2krcmQzRkNVekR3YmdWY0t1U1lV?=
 =?utf-8?B?VTg4UVpTVHM4d0R5ak1XMUF2dmtvdWFpSUF4b1l0ZExsMVp6SHZlNXh3dnJm?=
 =?utf-8?B?OTdhOENPbUJ0cUZjVGJ6OUkrbzN4VGcrNzQ0MzFsRXFYM2hIZkNXWSt3bC9Q?=
 =?utf-8?B?UUlMdkdQNW56WTZNQjJvSy8wZzRhc2liUzQyTmhlWURIc2x4d3hDdlRhcjcx?=
 =?utf-8?B?cE1GaXRjTi9jV1Q5NjNNZ3l1cElYZVJWNHR6V1NoRlBKUWVBRE9jNUJsOUx5?=
 =?utf-8?B?L01oem8vNm1yRXRXQlRacjMvNnY2YlVMTC9rQWpyMW5NQ0ZXakNuYmFIZW94?=
 =?utf-8?B?b1BvaGVzL0J1Z0QxRnRJaElydVkvckg1ZXpRQTRkb0JQb0Q5N1g4MFdGN0Vl?=
 =?utf-8?B?MnhZdzhvQkZ5RjVCaUxIcVRvaCtVcG9Wa05JMW9ZOUlxR0h1Y3kxOFZVQ3d0?=
 =?utf-8?B?UTBuaEZFdW5PRWU3d29sa21PNm5STTBLaVJ4UWRQRndSc3BVSHo0bWJHM3VV?=
 =?utf-8?B?NzFueVlhaTUveTkrMG5NNG10K1J0ZVl2MFJaNjVWS0psSmFWeHE2OHByQkRB?=
 =?utf-8?B?M2JHc0ptejNVdXBsK1Q4WS9aSnUvQ2E4UzhRNmxta1lBdFR3dUdiZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DF121225A888214382ABDFEE73774996@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR05MB6611.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f91146d4-d5c3-43d5-7647-08da22fd6424
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 18:41:32.8371 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QQPzwpGizEhDd0L//sDxkozX7PcwmaurQgPLLvoOin7ADVOQohW81fmrTX4En0D6MJFMyQvtY9zQDOHjHWKJ0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR05MB5149
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIyLTA0LTIwIGF0IDE5OjQwICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Og0KPiANCj4gQW0gMjAuMDQuMjIgdW0gMTk6Mzggc2NocmllYiBaYWNrIFJ1c2luOg0KPiA+IE9u
IFdlZCwgMjAyMi0wNC0yMCBhdCAwOTozNyArMDIwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToN
Cj4gPiA+IOKaoCBFeHRlcm5hbCBFbWFpbA0KPiA+ID4gDQo+ID4gPiBIaSBaYWNrLA0KPiA+ID4g
DQo+ID4gPiBBbSAyMC4wNC4yMiB1bSAwNTo1NiBzY2hyaWViIFphY2sgUnVzaW46DQo+ID4gPiA+
IE9uIFRodSwgMjAyMi0wNC0wNyBhdCAxMDo1OSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90
ZToNCj4gPiA+ID4gPiBSZXdvcmsgdGhlIGludGVybmFscyBvZiB0aGUgZG1hX3Jlc3Ygb2JqZWN0
IHRvIGFsbG93IGFkZGluZw0KPiA+ID4gPiA+IG1vcmUNCj4gPiA+ID4gPiB0aGFuDQo+ID4gPiA+
ID4gb25lDQo+ID4gPiA+ID4gd3JpdGUgZmVuY2UgYW5kIHJlbWVtYmVyIGZvciBlYWNoIGZlbmNl
IHdoYXQgcHVycG9zZSBpdCBoYWQuDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gVGhpcyBhbGxvd3Mg
cmVtb3ZpbmcgdGhlIHdvcmthcm91bmQgZnJvbSBhbWRncHUgd2hpY2ggdXNlZCBhDQo+ID4gPiA+
ID4gY29udGFpbmVyDQo+ID4gPiA+ID4gZm9yDQo+ID4gPiA+ID4gdGhpcyBpbnN0ZWFkLg0KPiA+
ID4gPiA+IA0KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4gPiA+ID4gPiBSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4NCj4gPiA+ID4gPiBDYzogYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCj4gPiA+ID4gYWZhaWN0IHRoaXMgY2hhbmdlIGJyb2tlIHZtd2dmeCB3
aGljaCBub3cga2VybmVsIG9vcHMgcmlnaHQNCj4gPiA+ID4gYWZ0ZXINCj4gPiA+ID4gYm9vdC4N
Cj4gPiA+ID4gSSBoYXZlbid0IGhhZCB0aGUgdGltZSB0byBsb29rIGludG8gaXQgeWV0LCBzbyBJ
J20gbm90IHN1cmUNCj4gPiA+ID4gd2hhdCdzDQo+ID4gPiA+IHRoZQ0KPiA+ID4gPiBwcm9ibGVt
LiBJJ2xsIGxvb2sgYXQgdGhpcyB0b21vcnJvdywgYnV0IGp1c3QgaW4gY2FzZSB5b3UgaGF2ZQ0K
PiA+ID4gPiBzb21lDQo+ID4gPiA+IGNsdWVzLCB0aGUgYmFja3RyYWNlIGZvbGxvd3M6DQo+ID4g
PiB0aGF0J3MgYSBrbm93biBpc3N1ZSBhbmQgc2hvdWxkIGFscmVhZHkgYmUgZml4ZWQgd2l0aDoN
Cj4gPiA+IA0KPiA+ID4gY29tbWl0IGQ3MmRjYmU5ZmNlNTA1MjI4ZGFlNDNiZWY5ZGE4ZjJiNzA3
ZDFiM2QNCj4gPiA+IEF1dGhvcjogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0Bh
bWQuY29tPg0KPiA+ID4gRGF0ZTrCoMKgIE1vbiBBcHIgMTEgMTU6MjE6NTkgMjAyMiArMDIwMA0K
PiA+IFVuZm9ydHVuYXRlbHkgdGhhdCBkb2Vzbid0IHNlZW0gdG8gYmUgaXQuIFRoZSBiYWNrdHJh
Y2UgaXMgZnJvbSB0aGUNCj4gPiBjdXJyZW50IChhcyBvZiB0aGUgdGltZSBvZiBzZW5kaW5nIG9m
IHRoaXMgZW1haWwpIGRybS1taXNjLW5leHQsDQo+ID4gd2hpY2gNCj4gPiBoYXMgdGhpcyBjaGFu
Z2UsIHNvIGl0J3Mgc29tZXRoaW5nIGVsc2UuDQo+IA0KPiBPaywgdGhhdCdzIHN0cmFuZ2UuIElu
IHRoaXMgY2FzZSBJIG5lZWQgdG8gaW52ZXN0aWdhdGUgZnVydGhlci4NCj4gDQo+IE1heWJlIFZN
V0dGWCBpcyBhZGRpbmcgbW9yZSB0aGFuIG9uZSBmZW5jZSBhbmQgd2UgYWN0dWFsbHkgbmVlZCB0
bw0KPiByZXNlcnZlIG11bHRpcGxlIHNsb3RzLg0KDQpUaGlzIG1pZ2h0IGJlIGhlbHBlciBjb2Rl
IGlzc3VlIHdpdGggQ09ORklHX0RFQlVHX01VVEVYRVMgc2V0LiBPbiB0aGF0IGNvbmZpZw0KZG1h
X3Jlc3ZfcmVzZXRfbWF4X2ZlbmNlcyBkb2VzOsKgDQogICBmZW5jZXMtPm1heF9mZW5jZXMgPSBm
ZW5jZXMtPm51bV9mZW5jZXM7DQpGb3Igc29tZSBvYmplY3RzIG51bV9mZW5jZXMgaXMgMCBhbmQg
c28gYWZ0ZXIgbWF4X2ZlbmNlcyBhbmQgbnVtX2ZlbmNlcyBhcmUgYm90aCAwLg0KQW5kIHRoZW4g
QlVHX09OKG51bV9mZW5jZXMgPj0gbWF4X2ZlbmNlcykgaXMgdHJpZ2dlcmVkLg0KDQp6DQoNCg==
