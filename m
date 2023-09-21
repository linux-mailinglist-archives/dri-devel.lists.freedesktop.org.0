Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A076F7A9DFD
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 21:52:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB3B110E55E;
	Thu, 21 Sep 2023 19:52:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2041.outbound.protection.outlook.com [40.107.243.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57FB210E55E;
 Thu, 21 Sep 2023 19:52:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xooq8gd51z2qk3XPLAieZ8GXfK4GfbPXkDH4yIWiQ3rfQNfU+LWzEG4lUZDuBuSD/oblVQvU+VJXSryFopLmM2/oJLvdX5iJx2rHee+T15+gKj4WUenS8Kpgg2EpZR9bNsBtnCxlRhRlOqOrCKF6Qwjr+c+N5EbImR0mkdfKd1IfP2xJ9KJz/rWSDHAScEh/xYCfyOspH1XlapXtuwUx99DXtTv7qTiKnUIxDwwuNXfiGL+zLX3rh97X/6oeDr3H2IMb+O+sgGu373fxcFSCd4KpuXfLICODnvG4AZDeX5AzwfnWiF+PYe4LGRDUvzrMFoflfOUbpi2fHgP2hOV5ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jxP6Fp2te7qt+BooHUJIsmn+JKNqLhb4u9Y+mX8LayY=;
 b=bEhgOtiYQ7xGMUFLTCOVEd+iMNv72DJVjouGl5pTWdM7A/dD9vWMXN8AZcm+WvcwEw20/baodqZFge3bdBSTZtHmeQwvYcFetTm2JI4sfwXBIb11s8qHNxCK1NQo81NqXt8NX6JrcCqOTM8TWriuWyHgIprhoPfBzlyR+UzJ7ci8eFRgfeRVVWp2ILBe9845hFei8FUvT63zxahS/lLsPwJu/EAfyIvkxkxA4F+KZDxyMRv6YJwyNQB8L3fSCgwX+GQ6qseDStBMEuG+v/i5gNzMDat2LN+zj6S2x1KZrzTKhoiSX2vAbpVrCTitF3vFCU1Rzo+z4YoV8dXScZzYdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxP6Fp2te7qt+BooHUJIsmn+JKNqLhb4u9Y+mX8LayY=;
 b=yy2GZ6eM4XQf8GCSW4US+oGdII2WyZMQVWXTK4AraolTKswt54l/hk+MtIopyaf1TSkz5zvAdOUm+hRyILeDOtFsWjj56FX+psyA9LWtYnU51hEaEo/2SjHJsaXBjqQvL5+xt/nvOETIkgYztrWfU8h3Suxhqo/xeCpfjv7Agyk=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by CY8PR12MB7684.namprd12.prod.outlook.com (2603:10b6:930:87::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Thu, 21 Sep
 2023 19:52:23 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::629e:e981:228d:3822]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::629e:e981:228d:3822%5]) with mapi id 15.20.6792.026; Thu, 21 Sep 2023
 19:52:23 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, "Yu, Lang" <Lang.Yu@amd.com>
Subject: RE: WARNING in amdgpu_sync_keep_later / dma_fence_is_later should be
 rate limited
Thread-Topic: WARNING in amdgpu_sync_keep_later / dma_fence_is_later should be
 rate limited
Thread-Index: AQHZ7MOffdyTZjsfyEyQt8bXcEBBdLAlrx3A
Date: Thu, 21 Sep 2023 19:52:23 +0000
Message-ID: <BL1PR12MB51444F28FD848B91BAEDE88AF7F8A@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <CACna6rxtaHG6QTinuHyNyA7rck_aEBiMHtxSCLktArU1OoqxLg@mail.gmail.com>
In-Reply-To: <CACna6rxtaHG6QTinuHyNyA7rck_aEBiMHtxSCLktArU1OoqxLg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=bdbcf787-c1cd-4232-bc16-7bc0936feab4;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-09-21T19:46:44Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|CY8PR12MB7684:EE_
x-ms-office365-filtering-correlation-id: e1a0c59c-3725-4c9c-72e1-08dbbadc4629
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 16zbp3yOrfPbcl8wHIQSURTX98wlUIpp0Ylj7AuOeqjhxKMUyJPvsVsLi0INv4apBTMtDKNoxKaWf+i3lDNMahdcwox3PpndZJ6pdJbDkk63/fU6jKw8aL6jEghi36M4kK60geg3+jyoKyKXjrA+SVL+T71Afd83NBJQpb7D0PwOZ7e2PRhbHmi9Z07zGrqf9awHAD1IPHS8Xwseobem+UlaWo8taJHH3sdq+HxB8hkWBpOfsz01G/N+C/dEnekrV0XGdgZRwNaoxkTLpcOEaZbvz1bofGenNG/UCHYDpXvC6FUyBJFwzKGBqjql5a0QSWfueg4YXDfA+L+bIUTbbsDNcgYy4yDXS/R7hl2h37eaXYR7MEK9Nr+w9556OTBzBT0+YRcmgj25FwSo16qVZSCw/+IgEk17IYc0Zw30jbQpcMJ91OJq3KJmAiTeEqhbNO6Vs5QUN/4WfOPNrHWE+cxYwT7n2w1r6opq9bytPCMEJYVsixJV/V4WwV1w5anQFx0wO4WEtmKwWZXQBCy7yX7vyHNl9YiaU8hRHNuEby0yHNzh2zgodzlZVyol27ZfWuKGL/QJyqZPOeMmPJFBwb9JPl08041ph0Y0PPkU/I0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(346002)(136003)(366004)(396003)(451199024)(1800799009)(186009)(41300700001)(5660300002)(66946007)(66556008)(66446008)(66476007)(64756008)(6636002)(8936002)(8676002)(52536014)(110136005)(76116006)(316002)(2906002)(66574015)(55016003)(122000001)(83380400001)(38100700002)(38070700005)(9686003)(33656002)(86362001)(53546011)(26005)(478600001)(966005)(6506007)(7696005)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TlpFb2l0U3c5Q050S2tDVnFWbUdsN1Nhd0ltbDh5N0lkN3Vmd2I0SnRKbU1Y?=
 =?utf-8?B?TVRLdUV2OW1LNlZJWWFzK2FqWUNBaTh4alo5czM0MG8xTU44eUlLOUllZjNG?=
 =?utf-8?B?TmNvbTlrTzNzQ3pweHlGdkErZndGTVF5QVFxbVVQZU10NmF0Mm9hK2pyU1oy?=
 =?utf-8?B?TldlSGd1bW56RFFFaFdYSEdrMTErYVhDcVlKdnN0dGpXeTRhTlk5RUVMOGY0?=
 =?utf-8?B?Zmh0aTVhazBIaW9GMlpsMXQwV2FRUWE2MEp2OGxmT1hPb3dONFM2WHVlSVBD?=
 =?utf-8?B?dUZjSmZ3Q1o4MFI3aVdad1Zya01qNW83ZWxVY09ySHF6aGxrcnZJZXNmdk1S?=
 =?utf-8?B?SENSUUdWdnJ3dUFyMStSbFdFVUV4aS9FejFpU1dGUGhsc1g5WnlmUEhTNlNn?=
 =?utf-8?B?MWdlenEzbUJDQ2t5RnZieDhCdEg3Nm1vY09pQ3JmdVMxS3JyRjVsdzdpeTJ4?=
 =?utf-8?B?Y0hlWjlXY2g3SURqR1U1bmdDb2ZDcjJlY0lnS1g0Q0YvanIxZFAwT2VEOVBX?=
 =?utf-8?B?ZFJCdEVVa2NRSDFnZFY5bTA0Ung3bDI3TjRPZ2FTcEtmZjM3MGl2cEpuWnVa?=
 =?utf-8?B?SzU0ZUZCRUViMUU4a2pIQmRRODk2Q3pzOGZPaC9uUFRuR1BJcUdZTkwvZnNV?=
 =?utf-8?B?UjNERDQzRkU0MEdiWjZKeTlJZkhzdHlORVoyWjUyUlJYWFl0NzNraCt3cUFs?=
 =?utf-8?B?b1ZrZWYrNUFFTXBWbnA5Zy80ZmhtdUMrWTJZWUVJQ3I0NXVtamhOK1ZYOVJo?=
 =?utf-8?B?YThkd294aHZ2MEYxYnZuV3F4ZXpEVEpOQkVZVXBuQ3h1N2xxUUJ5YVRmTG96?=
 =?utf-8?B?RDdZY2ErUnlPdXIwU1JYU01VS29iTEdqL1IrZWU2T1pSYlNzd0d2Kzd4Uiti?=
 =?utf-8?B?dFhld29GZFpWamxGSzRrQXJ3c29MVU1XQmVBR043Y2dpZ3Vtd0hOWWRDK2Nz?=
 =?utf-8?B?K3FIZGFYY0VheFRmQkdUeCtzdnNndlBpbUIrR1ZyZ1JKVUpjUGZQQVJ2VFF1?=
 =?utf-8?B?VzhUM2g4NFU3T2NweituZzE4TjZoR0w2UVBGcy9IaVg3Zk14WUd2NTlqdk1a?=
 =?utf-8?B?MGRtMWhnS05oMHNzbXB2aGQrOW9UbDRCajZjSmFsd3BPWndQZnJsem03Smtv?=
 =?utf-8?B?WGc3ZHZpU3llVzhic0hlTmc3MzltYkxYaThOTE9FcWZXY0l4UEx5NGh6T3h4?=
 =?utf-8?B?Sm5RTzZobFVIVzhLdXFQY2liVHBxanYxODNNelhKZzFudVorQjdOSFdzTTQw?=
 =?utf-8?B?VmdtNDgvNytDZWJQaXA3RS9yZHN0YnFIZ0daaWdKVm9qZ0h4U3RKWFYwdzFh?=
 =?utf-8?B?cnF0WDZDSDlkRStXNmcrQWxRM3pYRmNVOGtXSHZka3VZdmoxMkh0U2I2eWor?=
 =?utf-8?B?RWl5MGpqRnAzaVp3TUhBN203OTA1ZUdZVFplUXI5dWU0MXE0SWxpYlRJVGtt?=
 =?utf-8?B?eWZ4NDlaSHh0enRjQUs0ZWVxUVU1WldHUWYzOTcweXRJMkRmOHNTRGhTUnBS?=
 =?utf-8?B?YlZDZnRKMjJXeGlHN3RtVkNUdU1VbVhhd29ienFvV0JlMXloWFRocnlVVmpQ?=
 =?utf-8?B?TExiUmw5VWVSbS8zcTVIdm1XdWRKenNRK3ZHdzJqcWg2dkx5TXB6VG5yOUoy?=
 =?utf-8?B?aWIyRGh5QjBOSFlMUm0vTW9vdUFzNTFsOXJySjFJRTNZbGoxUTQvMXFRdVE1?=
 =?utf-8?B?STBJSStXWEx6KzU3ZzRCTWtaeTY0TVpNVTFTVlBraU9RcUNzWExCWmJZOTBT?=
 =?utf-8?B?c0VHc2hwTWlhaUI2Z1E4QVU3aUVFSGpKVUpUSDN6aVMwNGozWm5YM3NyQURT?=
 =?utf-8?B?NStXM3hwdnlwdXNsNTBkK2hwL0lSYnc4YkRGeHhMdlUxMDBnWVdQOEhidW5i?=
 =?utf-8?B?K2xUdXpsOTk5RkwxMExpaklpa1Z4TlZEVG43bEdhdkpWUWRJbVpFWS9qaGli?=
 =?utf-8?B?TGJFUzlJSDdTdkRlMTFzSjZVQlY5N2xMcHpnRHd2SFlaMWhYQzFmYjczeVZO?=
 =?utf-8?B?ZWNiazZlcjRqVmFlK0loYUJXZmloTjZYWXdxUVRLbjVtTHJNV3l6WjFPVWM2?=
 =?utf-8?B?N1MrbU5PWE5LYXB1TzVMekVhRHpmc0NzM0Z4b2pqVnZTOHBaZHp4Z21aT3ho?=
 =?utf-8?Q?BgZU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1a0c59c-3725-4c9c-72e1-08dbbadc4629
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2023 19:52:23.5710 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IM5SiT+yZaAyIM/thYeKrfT8EI/7Em7yQI6B6UmI5rvgo/L8hz9wkJUNKeti88Lzha6PHAMBYrZBziK4AZK79g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7684
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

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSYWZhxYIg
TWnFgmVja2kgPHphamVjNUBnbWFpbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIg
MjEsIDIwMjMgMzo0MSBQTQ0KPiBUbzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1
Y2hlckBhbWQuY29tPjsgS29lbmlnLCBDaHJpc3RpYW4NCj4gPENocmlzdGlhbi5Lb2VuaWdAYW1k
LmNvbT47IFBhbiwgWGluaHVpIDxYaW5odWkuUGFuQGFtZC5jb20+OyBhbWQtDQo+IGdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbCA8ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZz47IFl1LA0KPiBMYW5nIDxMYW5nLll1QGFtZC5jb20+DQo+IFN1YmplY3Q6IFdBUk5JTkcg
aW4gYW1kZ3B1X3N5bmNfa2VlcF9sYXRlciAvIGRtYV9mZW5jZV9pc19sYXRlciBzaG91bGQNCj4g
YmUgcmF0ZSBsaW1pdGVkDQo+DQo+IEhpLA0KPg0KPiBiYWNrcG9ydGluZyBjb21taXQgMTg3OTE2
ZTZlZDlkICgiZHJtL2FtZGdwdTogaW5zdGFsbCBzdHViIGZlbmNlIGludG8NCj4gcG90ZW50aWFs
IHVudXNlZCBmZW5jZSBwb2ludGVycyIpIHRvIHN0YWJsZSBrZXJuZWxzIHJlc3VsdGVkIGluIGxv
dHMgb2YNCj4gV0FSTklOR3Mgb24gc29tZSBkZXZpY2VzLiBJbiBteSBjYXNlIEkgd2FzIGdldHRp
bmcgMyBXQVJOSU5HcyBwZXINCj4gc2Vjb25kICh+MTUwIGxpbmVzIGxvZ2dlZCBldmVyeSBzZWNv
bmQpLiBDb21taXQgZW5kZWQgdXAgYmVpbmcgcmV2ZXJ0ZWQgZm9yDQo+IHN0YWJsZSBidXQgaXQg
ZXhwb3NlZCBhIHBvdGVudGlhbCBwcm9ibGVtLiBNeSBtZXNzYWdlcyBsb2cgc2l6ZSB3YXMgcmVh
Y2hpbmcNCj4gZ2lnYWJ5dGVzIGFuZCB3YXMgcnVubmluZyBteSAvdG1wLyBvdXQgb2Ygc3BhY2Uu
DQo+DQo+IENvdWxkIHNvbWVvbmUgdGFrZSBhIGxvb2sgYXQgYW1kZ3B1X3N5bmNfa2VlcF9sYXRl
ciAvIGRtYV9mZW5jZV9pc19sYXRlcg0KPiBhbmQgbWFrZSBzdXJlIGl0cyBsb2dnaW5nIGlzIHJh
dGUgbGltaXRlZCB0byBhdm9pZCBzdWNoIHNpdHVhdGlvbnMgaW4gdGhlIGZ1dHVyZSwNCj4gcGxl
YXNlPw0KPg0KPiBSZXZlcnQgaW4gbGludXgtNS4xNS54Og0KPiBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zdGFibGUvbGludXguZ2l0L2NvbW1pdC8/aD1s
aQ0KPiBudXgtNS4xNS55JmlkPWZhZTJkNTkxZjNjYjMxZjcyMmM3ZjA2NWFjZjU4NjgzMGVhYjhj
MmENCj4NCj4gb3BlblNVU0UgYnVnIHJlcG9ydDoNCj4gaHR0cHM6Ly9idWd6aWxsYS5vcGVuc3Vz
ZS5vcmcvc2hvd19idWcuY2dpP2lkPTEyMTU1MjMNCg0KVGhlc2UgcGF0Y2hlcyB3ZXJlIG5ldmVy
IGludGVuZGVkIGZvciBzdGFibGUuICBUaGV5IHdlcmUgcGlja2VkIHVwIGJ5IFNhc2hhJ3Mgc3Rh
YmxlIGF1dG9zZWxlY3QgdG9vbHMgYW5kIGF1dG9tYXRpY2FsbHkgYXBwbGllZCB0byBzdGFibGUg
a2VybmVscy4NCg0KQWxleA0KDQo=
