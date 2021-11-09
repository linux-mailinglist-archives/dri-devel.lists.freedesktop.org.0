Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 133ED44AD7E
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 13:28:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518396E5C6;
	Tue,  9 Nov 2021 12:28:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC40B6E5C6;
 Tue,  9 Nov 2021 12:28:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hD47h4tONaASfiyX4qISePmghuyDc0EicqPBxnjLn6LsA4PBuX2JraPtjtnVhtJS0saQrR+koZY3cEwkgea9FYxxEQbUYfWCGkZeWJXyUV6NMtubxwiBKn45Ay/qNx+vFgUV4SQwdR1qWwmrOiwN8GPGP1PjHODFEOFh2kWyXGP2cI26ITJqHh6ohXuZ7CplhEpPNwdEU8udFCLbBUxUYktBUz2lK2DzRAJW8xtiOAkBwbeZ0P/ID/i9M3VBY9xXtPdhMi7xyLGBBpZucVJuECBM0Mu9hejkD3ycPIYLJSQPx6ahqwD+GuLzy4sVPzTEc07/PKJ0ojWuapVIT41fNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMbaDCI9/eVDy6068PBqynuDQiMrx28MBPXy8DxXmog=;
 b=BQY/uk5DfGSNXp7IdLmbvN46IKkJ2+TOhTGcegKJFNQN6kXUnjNRL3HvB/sQ91Jp1HLPZQSD2SlW9sXV45iqSawTmzB5DZjtDciKKtSBHoKSVfXIaSf8m7xdx8gf/wiJvIZA+tAe+ss0NR1JMJrX87kkftM9PjkQBcsc7Z6gHcz19WRbhI6E5Xvb94vKIss+ueqk0JA6c6AMnrKPlcOCLOU2PeIM8umuRnSj2FrxjeYWgO5AkDRrgmCGKRYq5TiOBjIKem1uq3HPl/C7xi1kVbjo+OvMpsUv2gc45zAa4cAhvgLqlXuptRZWLWN+PWnnxNPA/PDvNKMdhPuAAMnWsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NMbaDCI9/eVDy6068PBqynuDQiMrx28MBPXy8DxXmog=;
 b=pRNm7WvLtHNWnq/opG7BisojjhJHvPti35id7BEbsb2oKCR3oV7K4yt+DBZ2YN+AhAjBX2NnnC/xs++CiT1CtFI2wXm9pdrdPF3O5iQSg/haf2TEFCr+5rzJxnZfc9G/KBNLWY5F20COGUJnhgp2Jo27FJXZzO2Lu8nzp/rLxTI=
Received: from DM4PR12MB5165.namprd12.prod.outlook.com (2603:10b6:5:394::9) by
 DM4PR12MB5231.namprd12.prod.outlook.com (2603:10b6:5:39b::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.16; Tue, 9 Nov 2021 12:28:06 +0000
Received: from DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::3070:7b8d:5f19:ce5f]) by DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::3070:7b8d:5f19:ce5f%8]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 12:28:06 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: =?utf-8?B?5Zue5aSNOiBbUEFUQ0hdIGRybS90dG06IFB1dCBCTyBpbiBpdHMgbWVtb3J5?=
 =?utf-8?Q?_manager's_lru_list?=
Thread-Topic: [PATCH] drm/ttm: Put BO in its memory manager's lru list
Thread-Index: AQHX1VvXjWHPm2/pokm2eFnZq+sX9Kv7Hb8AgAAAQ4c=
Date: Tue, 9 Nov 2021 12:28:06 +0000
Message-ID: <DM4PR12MB51653AB0F1A0B89A41782B1087929@DM4PR12MB5165.namprd12.prod.outlook.com>
References: <20211109111954.41968-1-xinhui.pan@amd.com>
 <da46c607-1a3c-7ea9-92ef-78a2b60d38c9@amd.com>
In-Reply-To: <da46c607-1a3c-7ea9-92ef-78a2b60d38c9@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=True;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-11-09T12:28:05.385Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use
 Only; MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard; 
suggested_attachment_session_id: c6388a67-abad-b166-2ab6-ac536d3cb416
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7a1aec4b-d064-4d97-cf13-08d9a37c61d9
x-ms-traffictypediagnostic: DM4PR12MB5231:
x-microsoft-antispam-prvs: <DM4PR12MB52315B2BADC675BB0540C23087929@DM4PR12MB5231.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EcGNHHJ25G51m5WJjsSWtrVyAX1rXSHS7zsADWI6GA2wKPG82NiYo4RWpy0QJYgs3sdDazjAVt/R1kmMO+FuJ7ioAJuDwda9fj/eHD5vIRYhvRcLCYePOADUBCSChlVd8v1hKMmypeqI45ln8+Ig39fCg/ih0spsXnzjuP/0ailr0GXSfPq1AZNdyuyN3o8VA1XT+DFMndDZFUsO56cR8ZwVMDP4BHk7wCmIluMc9b887CbR68x/x2+BgTGNS5P0Pu2mkrVWDenKr90ZUGq+IsUsBjz1lTonkt45VO/MfOs3yCPZyq/+ZQhoyWlm61dM+ra0zwguuWg2fppQra8jhLYi5rd6aVi7JgT/nx8h8SpdPWMPcmcpoHjOL/iKybQV4V5TqXlEJjB+K1JPSSHvIR2F0zt8SznQuk16R3QOh35PSgxWFS+apK+/BnifWColLoD+9MThY9acNhmLuYdpa9t8hwQfjcMvaoqsNi7Dhl41Hy8giTRTSnXgTsL7cYWiHbOzIxdLvpB0subCtLpQ5SQ/n/K9mYZcq4hji/YHzvfBZ3Bz9wFB1NYiGIw2u4FZXslmXUYC87Pduv+bf7jhd2p2Bq6DS2w/EAgjDKDqRZALtDaS8AhrWwBwVQDuHlu29tSYvjiux05oxzIfjtb+mVFFC06t23+YrBbx1Nr8omRBOQJzJayvbxn8Bvt2k+SwikzSDIEEG/4CAEB+41MjUA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(38070700005)(55016002)(6506007)(450100002)(7696005)(8936002)(26005)(71200400001)(9686003)(52536014)(110136005)(2906002)(316002)(83380400001)(66476007)(66574015)(66556008)(86362001)(38100700002)(122000001)(224303003)(66946007)(66446008)(186003)(64756008)(76116006)(91956017)(508600001)(33656002)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZW5QQ2w5blUvSUl5enhKQ2krdnovWGNkQmNzQWVINncvSmhJc2x5bmZ5V3Rr?=
 =?utf-8?B?UjVJcFovZ0hhYmV6N1VTNWFCa2NIYWkzaGNveDk1UU9KUXF0WEhZKy94SEhW?=
 =?utf-8?B?V2g4LzFQSk9mYzE0Ukttd05tZWFFWkgwZWc3cmdoSGRFcHBQazZEcTIrOWU4?=
 =?utf-8?B?WTlBTTB0VUdzVjk1Um5Ld0pmYXQrYnh6bVFOZDVYNnY5KzFXL0RUcERuMFZR?=
 =?utf-8?B?eW9EWGhtdnVVb0VoQmh1dHdoOWFMOGY4azQzeGxlQWhodG5oY0k0ZWxUV3k2?=
 =?utf-8?B?VElHMHFROWlNS3VTeFhvSHYrYUl5K0E2NnczVVFLcE1oVUNYNEpNa0U2bzNy?=
 =?utf-8?B?TWI4aFN6OXhERHAwYktNYTdvRTJuRnRBWmRpK1I1dzI3OVl2T05rOXlYQTkx?=
 =?utf-8?B?QnUzdWFmQVpzQ2haNEV4TkhWTHRaZUhuL3NTSnV6dThQSVdNTFFSYUgyWkx4?=
 =?utf-8?B?aHJwbzUyajd0ZjdBQ00wVGNIdjZxWkxab0RQaXV0aXY3c0gvUFR1Q1hQWEVT?=
 =?utf-8?B?QlFJZkM2QTRPVkxxeHdlTUNUaXh6azBuVVl2bUM0bURYQnFRVzYyZUJRRDl4?=
 =?utf-8?B?QzJoS1FiK0ZCNTR3dzBKdEpOeWxreVRrblpsK2EvTUZ6L3NBRm5KVTAyOUZX?=
 =?utf-8?B?dWNKSC84bnp1bFJQT0F4WjZ0WnhKcC8vT0ZwUzZOdTdtN1ZzZzVtOEQvcmsw?=
 =?utf-8?B?djN4NUt4TmJiTUx5cmdYM2pNZnpCOXFTalpLNUFkSkRaRVhDb3JoOEtkdWk2?=
 =?utf-8?B?bnhRUU90RW9Ha0hvVlVhTEtQRlllUzNPUU12OUhKK0VQT09GdFlZRVNmcjNZ?=
 =?utf-8?B?bVJXcFlhYlRSV1VWUHlMcDNLbTRDYWJicXBZNWQwZjU0Y3BEWjBqSnY3djVy?=
 =?utf-8?B?Tm1OSVJZQ1l6VTBZdGpkNzRPT1hVazlhVlMrT0pyNWdiQTZZZ0xlTHRuT0s4?=
 =?utf-8?B?UWhDdVI3VE9wQktzaTJnQVVMVS9zZWhvdkNrckU2a1daVVlnV3VnMmsya3JV?=
 =?utf-8?B?bnZNdUdOMUQ0QzRDczlFakFQVmgvUWdZSm5tcXg4dXJjR3ZWRU5xNzNmTWZw?=
 =?utf-8?B?Wmg3WEdVYWQxUzhQSklQaGZyMUZBeXc2SlptVVNWaXRnV0dSblBabGdqUEpR?=
 =?utf-8?B?Y2hNRW1VK2N1VkIwQU5LMTZEcER3REFFc0JJT1hPUjlmTzhBNGFXZUlkQUZE?=
 =?utf-8?B?TWxtcDd5UFU5djZYdzRya3hSUm8yVXBwZjBHS2xKL2dzOFNZTCtZYUxOWUs5?=
 =?utf-8?B?THNqNFlWemJod0JNYjh2N1YxUTVDOFBoOWFJSm1zWUljUmt6SjJ6eHAzQUxJ?=
 =?utf-8?B?OVFiN3hkd1hOeHVIaEJ2MGZlb2FXdFBNNGw2UUJKUjRtZHlKdHkxTEYwSjFX?=
 =?utf-8?B?UzNvbnkrRG5TTGU1cStFWnJMUWJSUldlNG1UOExoYUROc3pPangyajhwc3pX?=
 =?utf-8?B?ZGZKYU1YYUlGTDF6UXVmWXdkZzluTFh5U3lFTjB4NnNjNFg2Q3dJenBhY0xv?=
 =?utf-8?B?eEtKNXZZM3hBNmlPS21HYUtsR253VDRuZStqc0pQWkJTODJBSEhsdDRweWhj?=
 =?utf-8?B?bExsTTI3cjJlczBtQW9KOGkzaVJLYU5YNG1SU1FkT0pmc1VTOWNoNGpvQ3FV?=
 =?utf-8?B?UEEyUnhvbG02Y2NzTmZKUDhVMlBuMjI5RDJhK1ZvK3VVNmNSZmJwSkhvK051?=
 =?utf-8?B?Nmhtc3M4OUVXNmNWRWU0cjIydmNkd0IyREt3dnJwR3dXeTFGYUp6YWtuOFlJ?=
 =?utf-8?B?Y0NGclE1OEJkYTZ6UWdFaEp6QjFRMjhlclVUK2wvU3VNMGt4TEoramM5TjEv?=
 =?utf-8?B?S3ZmY29yRExyL1pHZjkyK1NmWk93VmJaSzRST2hxMkdzVllBZVAwcjEvNjdT?=
 =?utf-8?B?Mkt1OElsdCtEaUk0NGpEUWk4d2tadENkY043N1FpNW1DNjF5YTdGSlV0cDJ0?=
 =?utf-8?B?Nlo2QVRZZHFlQzQ1QWpVRy9XRUhLMVp0THBnMDdBUmFldEZZVEpkSEpLZFJp?=
 =?utf-8?B?MituOUNISVExWmZlYU16MTVSQ1ZoL1NRelZ4a2RYdFdaMUZnTSsxVkFMN09s?=
 =?utf-8?B?eGIwLzhNdGhJakJJVjE1V3p2ZnYrWTdNRlNRdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a1aec4b-d064-4d97-cf13-08d9a37c61d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2021 12:28:06.0591 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NkqzX5oyENLC2rhCKBg6rdF2jtJPkLDFuWeomFMkzIouFiOhHkhfwjIGxBa3layh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5231
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seV0NCg0KSSBoaXQgdnVsa2FuIGN0cyB0ZXN0IGhhbmcgd2l0
aCBuYXZpMjMuDQoNCmRtZXNnIHNheXMgZ21jIHBhZ2UgZmF1bHQgd2l0aCBhZGRyZXNzIDB4MCwg
MHgxMDAwLCAweDIwMDAuLi4uDQpBbmQgc29tZSBkZWJ1ZyBsb2cgYWxzbyBzYXlzIGFtZGd1IGNv
cHkgb25lIEJPIGZyb20gc3lzdGVtIERvbWFpbiB0byBzeXN0ZW0gRG9tYWluIHdoaWNoIGlzIHJl
YWxseSB3ZWlyZC4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCuWP
keS7tuS6ujogS29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4NCuWP
kemAgeaXtumXtDogMjAyMeW5tDEx5pyIOeaXpSAyMDoyMA0K5pS25Lu25Lq6OiBQYW4sIFhpbmh1
aTsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCuaKhOmAgTogZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZw0K5Li76aKYOiBSZTogW1BBVENIXSBkcm0vdHRtOiBQdXQgQk8gaW4g
aXRzIG1lbW9yeSBtYW5hZ2VyJ3MgbHJ1IGxpc3QNCg0KQW0gMDkuMTEuMjEgdW0gMTI6MTkgc2No
cmllYiB4aW5odWkgcGFuOg0KPiBBZnRlciB3ZSBtb3ZlIEJPIHRvIGEgbmV3IG1lbW9yeSByZWdp
b24sIHdlIHNob3VsZCBwdXQgaXQgdG8NCj4gdGhlIG5ldyBtZW1vcnkgbWFuYWdlcidzIGxydSBs
aXN0IHJlZ2FyZGxlc3Mgd2UgdW5sb2NrIHRoZSByZXN2IG9yIG5vdC4NCj4NCj4gU2lnbmVkLW9m
Zi1ieTogeGluaHVpIHBhbiA8eGluaHVpLnBhbkBhbWQuY29tPg0KDQpJbnRlcmVzdGluZyBmaW5k
LCBkaWQgeW91IHRyaWdnZXIgdGhhdCBzb21laG93IG9yIGRpZCB5b3UganVzdCBzdHVtYmxlZA0K
b3ZlciBpdCBieSByZWFkaW5nIHRoZSBjb2RlPw0KDQpQYXRjaCBpcyBSZXZpZXdlZC1ieTogQ2hy
aXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiwgSSB3aWxsDQpwaWNrIHRo
YXQgdXAgZm9yIGRybS1taXNjLW5leHQuDQoNClRoYW5rcywNCkNocmlzdGlhbi4NCg0KPiAtLS0N
Cj4gICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIHwgMiArKw0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKykNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jDQo+IGluZGV4IGYxMzY3
MTA3OTI1Yi4uZTMwNzAwNGYwYjI4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRt
L3R0bV9iby5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMNCj4gQEAgLTcw
MSw2ICs3MDEsOCBAQCBpbnQgdHRtX21lbV9ldmljdF9maXJzdChzdHJ1Y3QgdHRtX2RldmljZSAq
YmRldiwNCj4gICAgICAgcmV0ID0gdHRtX2JvX2V2aWN0KGJvLCBjdHgpOw0KPiAgICAgICBpZiAo
bG9ja2VkKQ0KPiAgICAgICAgICAgICAgIHR0bV9ib191bnJlc2VydmUoYm8pOw0KPiArICAgICBl
bHNlDQo+ICsgICAgICAgICAgICAgdHRtX2JvX21vdmVfdG9fbHJ1X3RhaWxfdW5sb2NrZWQoYm8p
Ow0KPg0KPiAgICAgICB0dG1fYm9fcHV0KGJvKTsNCj4gICAgICAgcmV0dXJuIHJldDsNCg0K
