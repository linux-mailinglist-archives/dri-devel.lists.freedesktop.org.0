Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E1042C42A
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 16:56:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 128B96EA6F;
	Wed, 13 Oct 2021 14:56:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2067.outbound.protection.outlook.com [40.107.92.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 990CF6EA6F
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 14:56:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PWqtqGngzeCpycIp89gXM38Vf+Dsd1e3dmhLuydwR8MFDt84bNm3UtN9/NYQ8jwX+DoSKaxsXcrHCVPqjAQVFE5BOkPCE5WMOsSlsMhlFsbIZtFFyO/quKFRS4rlIrwnwTiPnoxAnUsUjY65fm43KfAJb2kpX4e2LaafYpl+Eg2B/OCfjgcJShMv7a6drbEV3H0zLQnDt6fWBRzrQQSFFA81O4SlAuvjxoVVhN7SlTCfG3EP/NzrDc2JAf3wQGR4w1OFNbahq9po22tYXH624BD7qjek/Wb0FeFWSpgEZy4+66iRbup3g6GZQQ/yB3sR9WrhtO5u+wuW/3iF76J/ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J1UDoaJDKCsuYir73ilppmzy/hSrxV/HUx2IERg3Kbc=;
 b=RVxj++SYrV270yleyGRji5PvEM9kdMMdzw9VOd2ZUS1PgfjxgVjYMH2kHZuk66svYB+wn1SIaV1n4T6FKtUPd0Z4RNjrGMwrwfn7QXMtXOZhlUF9559oETf+WSJHqMyPV2Z9KjOlcSE3AtCaczIBdYjQEGi/iOF7uAZqGYuooWgsPYNHksvEKfd+ioX8/x9HpMUaeRSjzmMLP0zeQXlwQUGOoACKWpQAkH+0/IZA0ij1xjKhcdiFptgPi/1N66hVxAcvz93+/bFkjIbmZzbt0Ko3IUzUe4erA/8vsbksVMHVmbbLKxlRbmFfJxy7cRw4Qqt+vPLbx1Ev7cDrlMRQog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1UDoaJDKCsuYir73ilppmzy/hSrxV/HUx2IERg3Kbc=;
 b=i4J0EjMomYylczKX6ESMfDHLT4oK/usF+Xa21omH63rdCQzWv+4lMH7J656aUbVvb4yJ1WLzdfLsuhHnwBK4PqR2NC2qN4jjcwXsSfQORuzxcglI/xiR3s+51x0G8ddIcjSPLtRe5L4g18nrO9i1scFbptYIvux1EJvY6AmSU+0=
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by MN2PR05MB6670.namprd05.prod.outlook.com (2603:10b6:208:d5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Wed, 13 Oct
 2021 14:56:04 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::611d:3cfb:e99a:b768]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::611d:3cfb:e99a:b768%7]) with mapi id 15.20.4608.016; Wed, 13 Oct 2021
 14:56:04 +0000
From: Zack Rusin <zackr@vmware.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 0/5] drm/vmwgfx: Support module unload and hotunplug
Thread-Topic: [PATCH 0/5] drm/vmwgfx: Support module unload and hotunplug
Thread-Index: AQHXvGph9gw8C8/5FkWZqC6NMx9TmqvJjTwAgAADZACAAAlcAIAD3geAgAA/YgCAAVXUgIAAC9UAgACNBoCAAULlAIAAIxSA
Date: Wed, 13 Oct 2021 14:56:04 +0000
Message-ID: <5976b685423b4145dc0aee374fc1ae35e652577b.camel@vmware.com>
References: <20211008173146.645127-1-zackr@vmware.com>
 <7abe3906a814e40786da5cd5d45a7b826e262d8e.camel@linux.intel.com>
 <dbfb505f1034a2d725d76e30a26d2da0a850dd41.camel@vmware.com>
 <96a89fdb5a10141e87d7283720b4088461db722b.camel@linux.intel.com>
 <232f45e9-8748-1243-09bf-56763e6668b3@amd.com>
 <4041c72ff1d3d149437cedbcf3c598ae2238519d.camel@linux.intel.com>
 <1b80b739-3d7e-1228-03d5-eba11f58dbe0@amd.com>
 <02f01e6df6c1a55e7444926d06cc0239001bfd91.camel@linux.intel.com>
 <cbfa8b5a879975e45d490b009d17e5b229cf3de4.camel@vmware.com>
 <YWbWFtg0FARHcjf1@phenom.ffwll.local>
In-Reply-To: <YWbWFtg0FARHcjf1@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.0-1 
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e190be06-eee5-4c64-64c9-08d98e59946d
x-ms-traffictypediagnostic: MN2PR05MB6670:
x-microsoft-antispam-prvs: <MN2PR05MB66701BE7242BA0A05A5679A6CEB79@MN2PR05MB6670.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iUupntRxJQBU8VbxQVzF06YiJvyXcoOi5csTqQQ0Iz9BjIFz2xsFfvPhbPlqCaW+bjDCYwuVpKAQ21YJiusuPUHya7IiM0OqGL6v+dEZQEg5xUL+Lw1gzRogu96r/UvScBc4T43bVdGTemG9NhApx9dqk00gQBOoeuUpjU5iYogE5oX//u4swhNMU61aoDBIlPfB4dCvi8w5oB+BHPovBSIq7qhFt6Mi6hgQnC4VHjibzA1GoIq1QHURNknHp/CIxwKyN9uT2FqkRzyH0ln2CIIvbNl6RwtLRcj2j/bLKo7MfgJy+z4JTFaEW6AyX56f9XtoJCZCUgi2j0ZKouF9eYra6oEPTRs9mOQ4qWx/OiOuoOaq9+lSvtwhdo60ZyUfPio/GGADjoC9tQ9VCWMbf6/UlHPp32ke6moh3i7WdnY5YunCVJeGDMWDXSjD173hamK2YmKFdY3wTyGc5CpS7sRXNGx9YutyMGXtWyMmjWIMSDzZPADURzuEsZMUhy+tynvMOIOrwFPiLHDPZ3oJPPKLwPv3lxMGabyF0d0iiV6oxtzuknqlxdeTJTCxu4WbATJfwZfEaaLJ61MFU3qmPZQQF9V1isE9EkUemlchnjunMiQim8Qge8+vumf5ADwd7h7oJ+uUqLm1Se/bPwHDmORkxKY5dqc2YDxQ1pLXyFbZ7GZ2RQCdhfUJyJrk0D9GuIYbZCKvBGaa0nRmwVRUlA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(122000001)(64756008)(26005)(8676002)(86362001)(83380400001)(36756003)(4001150100001)(66476007)(2906002)(54906003)(66446008)(2616005)(6506007)(4326008)(8936002)(71200400001)(38070700005)(6486002)(66946007)(508600001)(76116006)(186003)(6916009)(38100700002)(5660300002)(316002)(6512007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UGIxYjZJUXVWYXhvK3RBTndwcG1BTUc3RmlmVENTOElkeTRwcjN4d1h0U1d5?=
 =?utf-8?B?Sy9ZZlV2ZVZuQmVMYjRod3NucE5kZlo0MFhlZFA1c29lbXBLZC92Wkh4WERu?=
 =?utf-8?B?NDM1WHhpbTRNYUdhZURyS2ttbUE0KzFRRkd1UU9PVWY1ZlpvaXZ6V3duR3Zk?=
 =?utf-8?B?bE5iRng5OXJZamJEaGY5TndmYkFiRkQ0czJ2dnJxenBoVnRjcDgrWjc1ejVi?=
 =?utf-8?B?bWpkUmpyQVZoZWlhekk3b2pvNFN1anpMNDIxUkVqdlNTWFJxQ1ZJcXV0elRX?=
 =?utf-8?B?dWpPTW14elEvR25MeGkxbzdzbUdCMFZDSUlzNU00RmlEVFI3V3RKdXA5RUJj?=
 =?utf-8?B?OVdsS2lZNVdiMGI1S1p2RE5ZL3l6T1F1TGZQRXVJR09pa1g2TThMSWwveXBp?=
 =?utf-8?B?OExnRDBJQ0VZL1BEL1l6VTY5ZVVudXVOMHBGUk43NitRM2hrNTRVWGcreThN?=
 =?utf-8?B?L2twY0JyTVdBa3E2OElaZzRYaGRCdk9MYXRtSlcwOWF4cWNpOTJFaVhabm5G?=
 =?utf-8?B?bGN1VFFIOVRyR3dWam04c0JjcnZEZ21DNXdxNXFFWG9nU0VoM1NnbWRrUEpD?=
 =?utf-8?B?SDd0dmVFbloyc0hrQXRoVkI4QnZuMFROUzhla2NmSHJETUFVMjlsT25jWE1r?=
 =?utf-8?B?STNINXlYczVaQzFNclBOQXVpeDNaRUJXbjhScDl2MitrbzRYbVFmNlRHb3R3?=
 =?utf-8?B?Q3B6S3VseWNpRHk5eWpna1ZSVEJZbzVDc0toTDVDK1g3UkxFTW4rWW1Gdk1W?=
 =?utf-8?B?blUzQ3VxQk5lb3BjaWxKb0w0Z2xqblNzM2trVVdSVit5ZGdtSVNWT1ZUaGRG?=
 =?utf-8?B?S1BDN053ZldQMGl5d0V4bjFKak5zNVVFSmV2Z1ljYmFiT2IyTW9MNzFJRGs0?=
 =?utf-8?B?YkprVDVCTUhuRWlYalk2VGZ3VVlHVVFYQm11YTZxbmxtbjBZaENVSlJZaFdK?=
 =?utf-8?B?UTNZYmlOZnFZSHBFRHR2VTNNUjFOdzZ2SVMyZlBPRGNGR2FFM01ad1U4MXFS?=
 =?utf-8?B?eXcvanpOTERHUmxWU2tVMDBTVWs1MFRKTHE1dFY2Q2ltRzFLWkk3OVloQU5i?=
 =?utf-8?B?bjlBQVNIbk0zOFIvamhSdmdaeGE2a3ZVODBrbkpMcDBqK2xURUlqN3NOMnZB?=
 =?utf-8?B?Tk9URDlrY0tES2VWdnpueEhQZmthcTBoa05MWGpjUVVZNDEzQnJBUThpWnVs?=
 =?utf-8?B?cUVVUmI0T1hOZW5PYzhoNFBKTVN6TldsMVAwcHpTWms3MkF4S3U4RUhGOGFw?=
 =?utf-8?B?bjZReHY4Uy9rQWhYMVhZUXQ5cXpTdFA1akQxZGdBNlA4UlBYb05IdUtHSUFG?=
 =?utf-8?B?RVRlazRYUVFyVk5Sa2ZGSDNWRGJzbnRwV3dObHhjVU9GdVdyd0JjTGIrR0RL?=
 =?utf-8?B?RUdHdmhmaGo0V1RCZlExRkNGUzVzVi9NSUJtN1BuRVhZY3N0QjF4eGRsWVA2?=
 =?utf-8?B?aTZsQzFCV05QOGR4U0ZyOGRGcHc1MGpYOG1nRlRxTDdZcmhYQTFaeDBWNnFK?=
 =?utf-8?B?U2ZCbnNUZzZyWjBZRzBCVGdjbmxMc3NxVUdnVmwraDRrTFpIRkYrRWhMWXpQ?=
 =?utf-8?B?aFFsR1JqdHlKK1hZVWRzakNQdE1rMDdROW9pRHZmVGIvWmpZTFFheWNhQTRR?=
 =?utf-8?B?SHErVXA3KzRPYlBUQkExL01PeGVPK2s0VFZ5UXdYS3Y4Z0ZEaURQMTFPNERs?=
 =?utf-8?B?R3RXWWsyVXJWdjBLSm5Nc055UTNmMTFJRmYzMUxLbjBJdUEzeDBmTi9CYXl6?=
 =?utf-8?Q?Va5gO26CZiMlrrVWjCLgELs+gkOgn/Nz2FSpOPc?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <7FA732CA1644944ABACC436791C22011@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e190be06-eee5-4c64-64c9-08d98e59946d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2021 14:56:04.1547 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OIWgX2gs+ECx64I9A5D0iB/IjH+p0cW83pf6jH0LQOVyOP+jE/uEeEXVFAy5dObMjZ0+KqQoLoGo2MPTWfSBfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6670
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

T24gV2VkLCAyMDIxLTEwLTEzIGF0IDE0OjUwICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOg0K
PiBPbiBUdWUsIE9jdCAxMiwgMjAyMSBhdCAwNTozNDo1MFBNICswMDAwLCBaYWNrIFJ1c2luIHdy
b3RlOg0KPiANCj4gPiBPbiB0aGUgZmxpcCBzaWRlIHRoYXQgZG9lcyBtZWFuIHRoYXQgdm13Z2Z4
IGFuZCBpOTE1IG5lZWQgdG8gcmVkbw0KPiA+IHNvbWUNCj4gPiBjb2RlLiBGb3Igdm13Z2Z4IGl0
J3MgcHJvYmFibHkgYSBuZXQgcG9zaXRpdmUgYW55d2F5IGFzIHdlJ3ZlIGJlZW4NCj4gPiB1c2lu
ZyBUVE0gZm9yLCB3aGF0IGlzIHJlYWxseSBub3dhZGF5cywgYW4gaW50ZWdyYXRlZCBHUFUgc28g
bWF5YmUNCj4gPiBpdCdzDQo+ID4gdGltZSBmb3IgdXMgdG8gdGhpbmsgYWJvdXQgdHJhbnNpdGlv
biB0byBnZW0uDQo+IA0KPiBBc2lkZSwgYnV0IHdlJ3JlIGxvb2tpbmcgYXQgYWRvcHRpbmcgdHRt
IGZvciBpbnRlZ3JhdGVkIGdwdSB0b28uIFRoZQ0KPiBleGVjYnVmIHV0aWxzIGFuZCBkeW5hbWlj
IG1lbW9yeSBtYW5hZ2VtZW50IGhlbHBlcnMgZm9yIHB1cmUgZ2VtIGp1c3QNCj4gYXJlbid0IHF1
aXRlIHRoZXJlIHlldCwgYW5kIGltcHJvdmluZyB0dG0gYSBiaXQgaW4gdGhpcyBhcmVhIGxvb2tz
DQo+IHJlYXNvbmFibGUgKGxpa2UgYWRkaW5nIGEgdW5pZmllZCBtZW1vcnkgYXdhcmUgc2hyaW5r
ZXIgbGlrZSB3ZSBoYXZlDQo+IGluDQo+IGk5MTUtZ2VtKS4NCj4gDQoNClRoYXQgd291bGQgY2Vy
dGFpbmx5IGJlIGEgYmlnIGhlbHAuIFRoZSBzaXR1YXRpb24gdGhhdCBJIHdhbnQgdG8gYXZvaWQN
CmlzIGhhdmluZyB2bXdnZnggdXNpbmcgVFRNIGZvciB3aGF0IG5vIG90aGVyIGRyaXZlciBpcyB1
c2luZyBpdCBmb3IuDQoNCg0KPiBBbHNvIEkgdGhvdWdodCB2bXdnZnggaXMgdXNpbmcgdHRtIHRv
IGFsc28gbWFuYWdlIHNvbWUgaWQgc3BhY2VzLA0KPiB5b3UnZA0KPiBoYXZlIHRvIGhhbmQtcm9s
bCB0aGF0Lg0KDQpZZXMsIGl0J3Mgd29yayBlaXRoZXIgd2F5LCBpdCdzIGxpa2VseSBsZXNzIGNv
ZGUgd2l0aCBHRU0gYnV0IHdlJ2QgbG9zZQ0Kc3VwcG9ydCBmb3IgM0Qgb24gb2xkZXIgaGFyZHdh
cmUgd2hlcmUgb3VyIGRldmljZSBkaWQgaGF2ZSBkZWRpY2F0ZWQNClZSQU0uwqANCg0KTm93YWRh
eXMgbWVtb3J5IG1hbmFnZW1lbnQgaW4gb3VyIGRldmljZSBpcyByYXRoZXIgdHJpdmlhbDogZXZl
cnkgR1BVDQpvYmplY3QgaXMganVzdCBrZXJuZWwgdmlydHVhbCBtZW1vcnkuwqBUbyBhbGxvdyBv
dXIgdmlydHVhbCBkZXZpY2UgdG8NCndyaXRlIGludG8gdGhhdCBtZW1vcnkgd2Ugc2VuZCBpdCBh
biBpZGVudGlmaWVyIHRvIGJlIGFibGUgdG8gbmFtZSB0aGUNCm9iamVjdCAod2UgdXNlIGlkJ3Mg
YnV0IGl0IGNvdWxkIGJlIGp1c3QgdGhlIGtlcm5lbCB2aXJ0dWFsIGFkZHJlc3MgYXMNCmludGVn
ZXIpIHBsdXMgYSBwYWdlIHRhYmxlIGJlY2F1c2UsIG9mIGNvdXJzZSwgdm14IGNhbid0IHJlYWQg
Z3Vlc3QNCmtlcm5lbCdzIHBhZ2UgdGFibGVzIHNvIHdlIG5lZWQgdG8gbWFwIHRoZSBrZXJuZWwg
dmlydHVhbCBhZGRyZXNzIHNwYWNlDQp0byBwaHlzaWNhbCBhZGRyZXNzZXMgc28gdGhhdCB0aGUg
aG9zdCBjYW4gd3JpdGUgaW50byB0aGVtLiBTbyBtbSBpbg0Kdm13Z2Z4IHNob3VsZG4ndCByZXF1
aXJlIHBlcmZvcm1hbmNlIGVuaGFuY2luZyBkcnVncyB0byB1bmRlcnN0YW5kIGFuZA0KZHJ1ZyB1
c2FnZSB3aGlsZSB3cml0aW5nIHZtd2dmeCBjb2RlIHNob3VsZCByZW1haW4gcHVyZWx5IHJlY3Jl
YXRpb25hbA0KOykNCg0Keg0KDQo=
