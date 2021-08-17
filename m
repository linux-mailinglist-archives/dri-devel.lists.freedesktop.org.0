Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E0F3EE7CC
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 09:51:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2467A6E108;
	Tue, 17 Aug 2021 07:51:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2070.outbound.protection.outlook.com [40.107.243.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDDF589F99;
 Tue, 17 Aug 2021 07:51:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TLFGn+P8kzJURbeMqfsdTHbYn7spytKcdA4ZdJ9rAhfHORO+rxnpFp0FgzxxULLAbvkghIOG0sVQUVhxxFMIlNcOkArVPXPLWzRiB5IvkwpGLo21ZfgGrNpLKFoA3jJ1ohPLGd3Ov6itWfY9eBmm64EX3GKyLHkTK/jsGJuqKCk8M1MBYcBKOYY9S8t+OyDfL4lulURFnPjeN1s9uxwXkYGYKIXnwDOFckx/fUFT4o90DMB+HKzclbwzCBKHWc4PYKAI1vDjLtVi2MmnzNb2M/2ZJAI/137krsNsLaB9I//QlWMGpE5Z+qYWnUseJjCfUYQC6SxctlDSqiR8VDa9LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nr4MhdIo4mLGfTImEgiYYuKgxLl+VntIQkdKHmYW4CM=;
 b=eSTnpUIXe7xY97gWlJ6zzl9++2Q2QWFImn5jsvu6EVt8236NVVOrvCMQJS/WShNVhxuAa3paaK5oAXKZNEvAmbAWMRlHIFBs/UFQBq1R9ZLqsoaGmdmk44eoAScjOqIoSWixqbwzTFb3WMB/vFnLJRopw64UTSSnPXY7DbAVN2PbFRcGYKawz+Y6hnVCtvJyHaaFum6pHT1FTMtlvc+mEIbuqkMktQgN6W+fO4xtWzeqgkEEEcmyp2EOFXMQfxVbtemxnEPuWHnTqFyIQtXqVW2c30UZJ3+lsVXYeZWtbotbGVJ4aOm++5vFr5ffNtLJdMQ1RD00A2kEsBcgi5z9KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nr4MhdIo4mLGfTImEgiYYuKgxLl+VntIQkdKHmYW4CM=;
 b=pqGsWSk31xXLRt764Dj2s+x0+Ht3fKI4WSGPYKWySLzgKZnlt8TGLYvQkujlda5GczhLEcV+2GBY5gSFrTDODeaJAIK0A+2iDl5i5uh88QenZAQr+YLyjiBXQjQo/La+lo9/Jy0NN8CMNfR1+uXAf+hzX3s1EkbAzeqrvfJ20+I=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 DM6PR12MB3179.namprd12.prod.outlook.com (2603:10b6:5:183::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.15; Tue, 17 Aug 2021 07:51:36 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::e9f8:55de:32f0:a7e6]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::e9f8:55de:32f0:a7e6%7]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 07:51:35 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
CC: "Liu, Leo" <Leo.Liu@amd.com>, "Zhu, James" <James.Zhu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v3] drm/amdgpu: Cancel delayed work when GFXOFF is disabled
Thread-Topic: [PATCH v3] drm/amdgpu: Cancel delayed work when GFXOFF is
 disabled
Thread-Index: AQHXkopxiUHpSc0Wzk6cu91YftKJ+qt3UzOw
Date: Tue, 17 Aug 2021 07:51:35 +0000
Message-ID: <DM6PR12MB26191A1092AA54AA6405F0DAE4FE9@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20210813102920.3458-1-michel@daenzer.net>
 <20210816103506.2671-1-michel@daenzer.net>
In-Reply-To: <20210816103506.2671-1-michel@daenzer.net>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-08-17T07:51:32Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=8be44135-8053-4f3c-bc1e-9de197f57263;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: daenzer.net; dkim=none (message not signed)
 header.d=none;daenzer.net; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c0cd2cbc-20bb-4b80-e676-08d96153d689
x-ms-traffictypediagnostic: DM6PR12MB3179:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB31794808B0D9D3FDEFF02916E4FE9@DM6PR12MB3179.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AhaOXC9VFkXLzMDoFJOeIbs6g8bv+z/dS4RMhfQblRiNu1YJnLOQ66rZgLZUptNIXPN7iDewtAf5YKHZOr/Zdrg3WFbUfUuBjt6eUZeiOLPvoc/11VIrsQBh5LV2IY8N8JtsLVtcAV5T7PNNoF1LmU1tLl/KpBLQAUyVGQPl2NfQfv4MR4P+pV/kQaflUIG7FnoU8JbQ1IN2zPp6fL3UNfGAcanFId6ro9drY36dQPx1j3kentUGMVakqiP3hkKFnipzDqDmXLO+chkom0zUJZGBlKtBknZtMzimRu0ftSZAgo8qH+X1b4RAIOzl0Gp8vM4GWyDZJLzGQXkLThFASgRPSHjiDH+wnP9O67Dznoo/DsuipYEPbtBbLDmg4T31/+hzWU2wbxtfC7DfYeTt20NdCrDNd1Ivw7iJXjhPLmxrnfd3nifftMdIeJCJskCvTxOgE7mzjYbMZLCPAmUH7zTXSLxKFhrBfrDQXBvj3+P9QpfQIEaPeu5JzM1h0rEhxp0gw8g4si7FO+XIzG3528TRwewrxIYJ8bS5D+/u5NSwD4fPDkzL6/DrVzHButFtjkvKT2zIRftgL7U109mw/HjEx8kNZVl5ME6k7wS8AzZOEcsxbDSZn/vlJlrGqtPb22D25ivC3jIaiZvN0Cu7VGYV6qSFTs1+9xLWVwpgrb2ZMlAUjeec3Mt6+coGzZDDyox9kZXHGVYHaWFpM6OW4Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(39860400002)(396003)(136003)(186003)(26005)(38070700005)(6506007)(53546011)(86362001)(316002)(9686003)(478600001)(8936002)(8676002)(55016002)(5660300002)(33656002)(54906003)(6636002)(76116006)(66446008)(83380400001)(64756008)(38100700002)(7696005)(66556008)(2906002)(66476007)(66946007)(66574015)(52536014)(71200400001)(110136005)(4326008)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eTZ3NGxaWmNqSTE4dTJqenNrYXBXRkJmNURyOUR4ZFVqNXJ3M0U0TTdlSDNa?=
 =?utf-8?B?aENQVk42NlQzSnFTTGpFK2lHQVlyWFR2WDdoVlE1TnRPcGJFbUlrV3cxWDhH?=
 =?utf-8?B?bFdRc25RVW1lcWxDWG1qTi9XQThzejhaNmNERE8ya0JnVStiRDgyTC9UcGRG?=
 =?utf-8?B?cTVjVWZYclFHdkkvUERQZElGTVVKVGZ6UEVYbHVMTVpoZXFYd2dQOUdRcjlG?=
 =?utf-8?B?MlBtcDF2d3ZjdlQvWkRHYWNKY1hRQ3NqYTZNeGxhTkFqOWo4REZjdnlDbmIz?=
 =?utf-8?B?aUw2eEIzK1pzZmF0Vlp1YWFubEhySzBrMnFTTmhzekdOa2J0aG1RVEZuYWJD?=
 =?utf-8?B?UzNXNkxDZVNGSVl5TUlMc0JCeGQ1S2xXTDNETk5SY3JESVljcDh4SGxIZVBa?=
 =?utf-8?B?SjZOQnh2djVMc0JVSGdOZ0lOVk9ZMXp1WEN4eE5nbHpUZ2RJYXl0RUpPc0d2?=
 =?utf-8?B?S0FkeFhBaWRETmcvUEEraWM2cStHOEQrczdYSTRRZ2traFdVWlpLRW5NZDdZ?=
 =?utf-8?B?a2ZZUWZpbWROWG8rL29iMk5ac3pTNUNMUk9sQnBuQjNKajg5SFdNNmY4OFBl?=
 =?utf-8?B?YVNBT0RKSktUd2ZOaTZqV2xzL0pXb0Vmd3JZcGZUL1M3UHlRdjJHSGR5QlF6?=
 =?utf-8?B?OFZuaGlNTGpwZFhnNlhZYVFJUzhyaWE3STdEOFluaU9XOHk0NjBFU2k0c3Fo?=
 =?utf-8?B?c2MxOWxkWjBwRGJQdmVBbGRsNzcwVkNtd3JDRnhrZTRkYnRrRTNPVitDNU0x?=
 =?utf-8?B?Rys4YzM2OXg5aDZUNUtZMWpMSWhmYlZlblJGVk5DZ0krUW9tMkF3OGNDTnhy?=
 =?utf-8?B?TVQ4UTFDcGNXYWlNd0Jvc1RnZlBwZWNZdE1acWlocDNDSzRWVjExRXduSTJv?=
 =?utf-8?B?aWtjS3ZmczN0OWZIM2VkWnRROHI2d2RrNEhqSm1hdkpUWWI0OXFoQkhKMGxQ?=
 =?utf-8?B?MTNMK2prTTF1UXVaT0dST1JVS29LYlVMZWZqOUF0eTgrbHVNT0Job2UzbnpY?=
 =?utf-8?B?Snp5MTFiRXNXa1hrbk1uNjQrdHFTeWl4NkMzYzd3SnAyNUtoN0F0Q1JxWDVn?=
 =?utf-8?B?M0pvUFEzUzVRQlRmSk04YXp2aWFJWG02K3h4a21vRm1udjZkbXJKU0ZHTUhD?=
 =?utf-8?B?WVBmVlhpWUY5L3JvYU1jTkZ6UFZEbmFHZHpHM081ZHhkeU4yMG8relF2UTJ1?=
 =?utf-8?B?U1kwdWI2L3FFRXhSN1ZpYkE4YW8yb2RxS2ZyelVtREZqN0txYjV4akhTSXpB?=
 =?utf-8?B?NWJqa3FxNmovYzFrTys4VFBzeDNRK3NmcU8rVmlQOEF2aldSVThUMVd1cXE5?=
 =?utf-8?B?OTRUTzNRQndKZzhXTjdaY21kQjVjQ3BzU3A3VnlGMVpxR2psVE5qMGd0TXJh?=
 =?utf-8?B?S2tTU2RJVTFCUnl1YThqL2ZySFE3VGFQL0ptczhLNGVEV09WVTFSbVNlSEZF?=
 =?utf-8?B?TmhUM0FZd1FaMXNSQVRydklZYWRUOHhMdXdVSXhseHlScU1yTzdRcHpyOGwz?=
 =?utf-8?B?RUFXU2hJSGxBOXB2MjYxbExscEh4UUlHNnpMZEtBUnJrc3NmTnlzQTVOTGor?=
 =?utf-8?B?MjA5eWZaRUNTclBuMUhPTnJKcUlod0FUTm9STUlyN2NXMFhlUXBxa2RjbFgw?=
 =?utf-8?B?SmErODczM1lPaFp1MTlEWXlDaG80b1BFaFBWS1hqeGwzZnQyei9ubjFiUDhT?=
 =?utf-8?B?NWxSdkFtRW16azhOZC9WSHRmQmlCR081dThqaHRmVGlWU25YZThVY3d1R3Vi?=
 =?utf-8?Q?2ji8TYwup6n+mS7ZAMZwDBXrFj0dJf0A6k8XUH5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0cd2cbc-20bb-4b80-e676-08d96153d689
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2021 07:51:35.7098 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hLbaN8O1xl9xgIOJItmpfGv55yWvzJT9AvkBivkiKYQ6y49E/v9RhcyiKXrtD886
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3179
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seV0NCg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zz4gT24gQmVoYWxmIE9mDQo+IE1pY2hlbCBEw6RuemVyDQo+IFNlbnQ6IE1vbmRheSwgQXVndXN0
IDE2LCAyMDIxIDY6MzUgUE0NCj4gVG86IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRl
dWNoZXJAYW1kLmNvbT47IEtvZW5pZywgQ2hyaXN0aWFuDQo+IDxDaHJpc3RpYW4uS29lbmlnQGFt
ZC5jb20+DQo+IENjOiBMaXUsIExlbyA8TGVvLkxpdUBhbWQuY29tPjsgWmh1LCBKYW1lcyA8SmFt
ZXMuWmh1QGFtZC5jb20+OyBhbWQtDQo+IGdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogW1BBVENIIHYzXSBkcm0vYW1k
Z3B1OiBDYW5jZWwgZGVsYXllZCB3b3JrIHdoZW4gR0ZYT0ZGIGlzDQo+IGRpc2FibGVkDQo+IA0K
PiBGcm9tOiBNaWNoZWwgRMOkbnplciA8bWRhZW56ZXJAcmVkaGF0LmNvbT4NCj4gDQo+IHNjaGVk
dWxlX2RlbGF5ZWRfd29yayBkb2VzIG5vdCBwdXNoIGJhY2sgdGhlIHdvcmsgaWYgaXQgd2FzIGFs
cmVhZHkNCj4gc2NoZWR1bGVkIGJlZm9yZSwgc28gYW1kZ3B1X2RldmljZV9kZWxheV9lbmFibGVf
Z2Z4X29mZiByYW4gfjEwMCBtcw0KPiBhZnRlciB0aGUgZmlyc3QgdGltZSBHRlhPRkYgd2FzIGRp
c2FibGVkIGFuZCByZS1lbmFibGVkLCBldmVuIGlmIEdGWE9GRg0KPiB3YXMgZGlzYWJsZWQgYW5k
IHJlLWVuYWJsZWQgYWdhaW4gZHVyaW5nIHRob3NlIDEwMCBtcy4NCj4gDQo+IFRoaXMgcmVzdWx0
ZWQgaW4gZnJhbWUgZHJvcHMgLyBzdHV0dGVyIHdpdGggdGhlIHVwY29taW5nIG11dHRlciA0MQ0K
PiByZWxlYXNlIG9uIE5hdmkgMTQsIGR1ZSB0byBjb25zdGFudGx5IGVuYWJsaW5nIEdGWE9GRiBp
biB0aGUgSFcgYW5kDQo+IGRpc2FibGluZyBpdCBhZ2FpbiAoZm9yIGdldHRpbmcgdGhlIEdQVSBj
bG9jayBjb3VudGVyKS4NCj4gDQo+IFRvIGZpeCB0aGlzLCBjYWxsIGNhbmNlbF9kZWxheWVkX3dv
cmtfc3luYyB3aGVuIHRoZSBkaXNhYmxlIGNvdW50DQo+IHRyYW5zaXRpb25zIGZyb20gMCB0byAx
LCBhbmQgb25seSBzY2hlZHVsZSB0aGUgZGVsYXllZCB3b3JrIG9uIHRoZQ0KPiByZXZlcnNlIHRy
YW5zaXRpb24sIG5vdCBpZiB0aGUgZGlzYWJsZSBjb3VudCB3YXMgYWxyZWFkeSAwLiBUaGlzIG1h
a2VzDQo+IHN1cmUgdGhlIGRlbGF5ZWQgd29yayBkb2Vzbid0IHJ1biBhdCB1bmV4cGVjdGVkIHRp
bWVzLCBhbmQgYWxsb3dzIGl0IHRvDQo+IGJlIGxvY2stZnJlZS4NCj4gDQo+IHYyOg0KPiAqIFVz
ZSBjYW5jZWxfZGVsYXllZF93b3JrX3N5bmMgJiBtdXRleF90cnlsb2NrIGluc3RlYWQgb2YNCj4g
ICBtb2RfZGVsYXllZF93b3JrLg0KPiB2MzoNCj4gKiBNYWtlIGFtZGdwdV9kZXZpY2VfZGVsYXlf
ZW5hYmxlX2dmeF9vZmYgbG9jay1mcmVlIChDaHJpc3RpYW4gS8O2bmlnKQ0KPiANCj4gQ2M6IHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmcNCj4gU2lnbmVkLW9mZi1ieTogTWljaGVsIETDpG56ZXIgPG1k
YWVuemVyQHJlZGhhdC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2RldmljZS5jIHwgMTEgKysrKystLS0tLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9nZnguYyAgICB8IDIyICsrKysrKysrKysrKysrKysrLQ0KPiAtLS0tDQo+
ICAyIGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2Uu
Yw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYw0KPiBpbmRl
eCBmM2ZkNWVjNzEwYjYuLmY5NDRlZDg1OGYzZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYw0KPiBAQCAtMjc3NywxMiArMjc3NywxMSBAQCBzdGF0
aWMgdm9pZA0KPiBhbWRncHVfZGV2aWNlX2RlbGF5X2VuYWJsZV9nZnhfb2ZmKHN0cnVjdCB3b3Jr
X3N0cnVjdCAqd29yaykNCj4gIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9DQo+ICAJCWNv
bnRhaW5lcl9vZih3b3JrLCBzdHJ1Y3QgYW1kZ3B1X2RldmljZSwNCj4gZ2Z4LmdmeF9vZmZfZGVs
YXlfd29yay53b3JrKTsNCj4gDQo+IC0JbXV0ZXhfbG9jaygmYWRldi0+Z2Z4LmdmeF9vZmZfbXV0
ZXgpOw0KPiAtCWlmICghYWRldi0+Z2Z4LmdmeF9vZmZfc3RhdGUgJiYgIWFkZXYtPmdmeC5nZnhf
b2ZmX3JlcV9jb3VudCkgew0KPiAtCQlpZiAoIWFtZGdwdV9kcG1fc2V0X3Bvd2VyZ2F0aW5nX2J5
X3NtdShhZGV2LA0KPiBBTURfSVBfQkxPQ0tfVFlQRV9HRlgsIHRydWUpKQ0KPiAtCQkJYWRldi0+
Z2Z4LmdmeF9vZmZfc3RhdGUgPSB0cnVlOw0KPiAtCX0NCj4gLQltdXRleF91bmxvY2soJmFkZXYt
PmdmeC5nZnhfb2ZmX211dGV4KTsNCj4gKwlXQVJOX09OX09OQ0UoYWRldi0+Z2Z4LmdmeF9vZmZf
c3RhdGUpOw0KPiArCVdBUk5fT05fT05DRShhZGV2LT5nZnguZ2Z4X29mZl9yZXFfY291bnQpOw0K
PiArDQo+ICsJaWYgKCFhbWRncHVfZHBtX3NldF9wb3dlcmdhdGluZ19ieV9zbXUoYWRldiwNCj4g
QU1EX0lQX0JMT0NLX1RZUEVfR0ZYLCB0cnVlKSkNCj4gKwkJYWRldi0+Z2Z4LmdmeF9vZmZfc3Rh
dGUgPSB0cnVlOw0KPiAgfQ0KPiANCj4gIC8qKg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2dmeC5jDQo+IGluZGV4IGEwYmUwNzcyYzhiMy4uY2E5MWFhZmNiMzJiIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmMNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5jDQo+IEBAIC01NjMsMTUg
KzU2MywyNiBAQCB2b2lkIGFtZGdwdV9nZnhfb2ZmX2N0cmwoc3RydWN0IGFtZGdwdV9kZXZpY2UN
Cj4gKmFkZXYsIGJvb2wgZW5hYmxlKQ0KPiANCj4gIAltdXRleF9sb2NrKCZhZGV2LT5nZnguZ2Z4
X29mZl9tdXRleCk7DQo+IA0KPiAtCWlmICghZW5hYmxlKQ0KPiAtCQlhZGV2LT5nZnguZ2Z4X29m
Zl9yZXFfY291bnQrKzsNCj4gLQllbHNlIGlmIChhZGV2LT5nZnguZ2Z4X29mZl9yZXFfY291bnQg
PiAwKQ0KPiArCWlmIChlbmFibGUpIHsNCj4gKwkJLyogSWYgdGhlIGNvdW50IGlzIGFscmVhZHkg
MCwgaXQgbWVhbnMgdGhlcmUncyBhbiBpbWJhbGFuY2UgYnVnDQo+IHNvbWV3aGVyZS4NCj4gKwkJ
ICogTm90ZSB0aGF0IHRoZSBidWcgbWF5IGJlIGluIGEgZGlmZmVyZW50IGNhbGxlciB0aGFuIHRo
ZSBvbmUNCj4gd2hpY2ggdHJpZ2dlcnMgdGhlDQo+ICsJCSAqIFdBUk5fT05fT05DRS4NCj4gKwkJ
ICovDQo+ICsJCWlmIChXQVJOX09OX09OQ0UoYWRldi0+Z2Z4LmdmeF9vZmZfcmVxX2NvdW50ID09
IDApKQ0KPiArCQkJZ290byB1bmxvY2s7DQo+ICsNCj4gIAkJYWRldi0+Z2Z4LmdmeF9vZmZfcmVx
X2NvdW50LS07DQo+ICsJfSBlbHNlIHsNCj4gKwkJYWRldi0+Z2Z4LmdmeF9vZmZfcmVxX2NvdW50
Kys7DQo+ICsJfQ0KPiANCj4gIAlpZiAoZW5hYmxlICYmICFhZGV2LT5nZnguZ2Z4X29mZl9zdGF0
ZSAmJiAhYWRldi0NCj4gPmdmeC5nZnhfb2ZmX3JlcV9jb3VudCkgew0KPiAgCQlzY2hlZHVsZV9k
ZWxheWVkX3dvcmsoJmFkZXYtPmdmeC5nZnhfb2ZmX2RlbGF5X3dvcmssDQo+IEdGWF9PRkZfREVM
QVlfRU5BQkxFKTsNCj4gLQl9IGVsc2UgaWYgKCFlbmFibGUgJiYgYWRldi0+Z2Z4LmdmeF9vZmZf
c3RhdGUpIHsNCj4gLQkJaWYgKCFhbWRncHVfZHBtX3NldF9wb3dlcmdhdGluZ19ieV9zbXUoYWRl
diwNCj4gQU1EX0lQX0JMT0NLX1RZUEVfR0ZYLCBmYWxzZSkpIHsNCj4gKwl9IGVsc2UgaWYgKCFl
bmFibGUgJiYgYWRldi0+Z2Z4LmdmeF9vZmZfcmVxX2NvdW50ID09IDEpIHsNCltRdWFuLCBFdmFu
XSBJdCBzZWVtcyBoZXJlIHdpbGwgbGVhdmUgYSBzbWFsbCB0aW1lIHdpbmRvdyBmb3IgcmFjZSBj
b25kaXRpb24uIElmIGFtZGdwdV9kZXZpY2VfZGVsYXlfZW5hYmxlX2dmeF9vZmYoKSBoYXBwZW5z
IHRvIG9jY3VyIGhlcmUsIGl0IHdpbGwgIldBUk5fT05fT05DRShhZGV2LT5nZnguZ2Z4X29mZl9y
ZXFfY291bnQpOyIuIEhvdyBhYm91dCBzb21ldGhpbmcgYXMgYmVsb3c/DQpAQCAtNTczLDEzICs1
NzMsMTEgQEAgdm9pZCBhbWRncHVfZ2Z4X29mZl9jdHJsKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2LCBib29sIGVuYWJsZSkNCiAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gdW5sb2NrOw0K
DQogICAgICAgICAgICAgICAgYWRldi0+Z2Z4LmdmeF9vZmZfcmVxX2NvdW50LS07DQotICAgICAg
IH0gZWxzZSB7DQotICAgICAgICAgICAgICAgYWRldi0+Z2Z4LmdmeF9vZmZfcmVxX2NvdW50Kys7
DQogICAgICAgIH0NCg0KICAgICAgICBpZiAoZW5hYmxlICYmICFhZGV2LT5nZnguZ2Z4X29mZl9z
dGF0ZSAmJiAhYWRldi0+Z2Z4LmdmeF9vZmZfcmVxX2NvdW50KSB7DQogICAgICAgICAgICAgICAg
c2NoZWR1bGVfZGVsYXllZF93b3JrKCZhZGV2LT5nZnguZ2Z4X29mZl9kZWxheV93b3JrLCBHRlhf
T0ZGX0RFTEFZX0VOQUJMRSk7DQotICAgICAgIH0gZWxzZSBpZiAoIWVuYWJsZSAmJiBhZGV2LT5n
ZnguZ2Z4X29mZl9yZXFfY291bnQgPT0gMSkgew0KKyAgICAgICB9IGVsc2UgaWYgKCFlbmFibGUg
JiYgYWRldi0+Z2Z4LmdmeF9vZmZfcmVxX2NvdW50ID09IDApIHsNCiAgICAgICAgICAgICAgICBj
YW5jZWxfZGVsYXllZF93b3JrX3N5bmMoJmFkZXYtPmdmeC5nZnhfb2ZmX2RlbGF5X3dvcmspOw0K
DQogICAgICAgICAgICAgICAgaWYgKGFkZXYtPmdmeC5nZnhfb2ZmX3N0YXRlICYmDQpAQCAtNTkz
LDYgKzU5MSw5IEBAIHZvaWQgYW1kZ3B1X2dmeF9vZmZfY3RybChzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwgYm9vbCBlbmFibGUpDQogICAgICAgICAgICAgICAgfQ0KICAgICAgICB9DQoNCisg
ICAgICAgaWYgKCFlbmFibGUpDQorICAgICAgICAgICAgICAgYWRldi0+Z2Z4LmdmeF9vZmZfcmVx
X2NvdW50Kys7DQorDQogdW5sb2NrOg0KDQpCUg0KRXZhbg0KPiArCQljYW5jZWxfZGVsYXllZF93
b3JrX3N5bmMoJmFkZXYtDQo+ID5nZnguZ2Z4X29mZl9kZWxheV93b3JrKTsNCj4gKw0KPiArCQlp
ZiAoYWRldi0+Z2Z4LmdmeF9vZmZfc3RhdGUgJiYNCj4gKwkJICAgICFhbWRncHVfZHBtX3NldF9w
b3dlcmdhdGluZ19ieV9zbXUoYWRldiwNCj4gQU1EX0lQX0JMT0NLX1RZUEVfR0ZYLCBmYWxzZSkp
IHsNCj4gIAkJCWFkZXYtPmdmeC5nZnhfb2ZmX3N0YXRlID0gZmFsc2U7DQo+IA0KPiAgCQkJaWYg
KGFkZXYtPmdmeC5mdW5jcy0+aW5pdF9zcG1fZ29sZGVuKSB7DQo+IEBAIC01ODEsNiArNTkyLDcg
QEAgdm9pZCBhbWRncHVfZ2Z4X29mZl9jdHJsKHN0cnVjdCBhbWRncHVfZGV2aWNlDQo+ICphZGV2
LCBib29sIGVuYWJsZSkNCj4gIAkJfQ0KPiAgCX0NCj4gDQo+ICt1bmxvY2s6DQo+ICAJbXV0ZXhf
dW5sb2NrKCZhZGV2LT5nZnguZ2Z4X29mZl9tdXRleCk7DQo+ICB9DQo+IA0KPiAtLQ0KPiAyLjMy
LjANCg==
