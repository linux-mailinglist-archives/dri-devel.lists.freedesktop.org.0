Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F2687B6A2
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 04:00:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5906110F785;
	Thu, 14 Mar 2024 03:00:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PAZ9/AfN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2070.outbound.protection.outlook.com [40.107.220.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CBF710F760;
 Thu, 14 Mar 2024 03:00:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jWXmbQgRNOPshp0rKXiHyRO0HiimvM1/OvToZ7GrqFbFGzAsFfPtAT/t28Y+rW78sd3A0Zbx2X9achVrRgbrmFqN7zd5rgoMWMfmBwYqwAkhDtom3YxxhH0LObfBIBh0cWvBa0fBrpEHgA/ZsUCNUXfX6wmxPezF5wBXYxafC4ArQ4oW67HoGnOmOz2/Zx0I6rgwh73BwHs9LeLfdFpWdbpAZomgafx3AQ0Z/seEM+DOBzD6wmu3Xd95MPQXfnHUN/qii7z2gaeMGf0McxWb6fpe1WOlHAikaEIDIF6+Akj1OCKzyMc/j7aPu0SzKNFqpC0Rk0WahyOxp7HnQb7thw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MuNZiBc79L8NYh5WlCzqVBsUFqlLsstZ3fy24m8QnVg=;
 b=PMNOlMVowxxc6R29e03L9mS9ujizuVWYGHGp36NGW3rmj0qOwgSNAS7RKMIkFF9pN1fBH/uRN6MiLs75JKqP3mS0dAo1YKnuRK16FmsHob2ant7BCRAeFvvNZ/0NDtjx0KQNM0wmnXfXesl9Mvj3/tchbAddh8+0/+ak7Q9+s+EsMU5eE1I7R0XJOxVDGsyEkGlQ/P6Xg1su1b3vdaSb1d9CbFvjMiphj6GotECXTbjuni6RTfuu/GiDwjS008aQbhN2dwJfj4Frgttjkdd+GOWzfo97Lgi8yO8DOxIZXd/AboZ3r6MUakZQKRCYMcx4t7OW98lGtatJqI6GSLSnrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MuNZiBc79L8NYh5WlCzqVBsUFqlLsstZ3fy24m8QnVg=;
 b=PAZ9/AfN7pHd8q3Mfv2/6vS51rOf6BNU7fStOyB4BTy08ITbRHnmwYL9lD6ZATpZOmo51sCrHpM+T1XgGE/x11UkKAZKmTvSlhQowR3ulBeNrw4O83MWxlFMjbn7Q3H9H/XexY3clEvCiatO9cZ8FppXU4yBr1i3axdSLQeWivY=
Received: from DS7PR12MB6005.namprd12.prod.outlook.com (2603:10b6:8:7c::17) by
 LV3PR12MB9330.namprd12.prod.outlook.com (2603:10b6:408:217::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Thu, 14 Mar
 2024 03:00:41 +0000
Received: from DS7PR12MB6005.namprd12.prod.outlook.com
 ([fe80::a702:68e0:aa54:fb87]) by DS7PR12MB6005.namprd12.prod.outlook.com
 ([fe80::a702:68e0:aa54:fb87%4]) with mapi id 15.20.7362.035; Thu, 14 Mar 2024
 03:00:41 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>
CC: Sasha Levin <sashal@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "Zhang, Hawking"
 <Hawking.Zhang@amd.com>, "Lazar, Lijo" <Lijo.Lazar@amd.com>, "Ma, Le"
 <Le.Ma@amd.com>, "Zhu, James" <James.Zhu@amd.com>, "Xiao, Shane"
 <shane.xiao@amd.com>, "Jiang, Sonny" <Sonny.Jiang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH AUTOSEL 5.15 3/5] drm/amdgpu: Enable gpu reset for S3
 abort cases on Raven series
Thread-Topic: [PATCH AUTOSEL 5.15 3/5] drm/amdgpu: Enable gpu reset for S3
 abort cases on Raven series
Thread-Index: AQHac8bXYQof3+sluk60IFsTJAEbMLE2G4SAgAAL3ACAAFBjoA==
Date: Thu, 14 Mar 2024 03:00:41 +0000
Message-ID: <DS7PR12MB6005CE495A063B43939F6CE8FB292@DS7PR12MB6005.namprd12.prod.outlook.com>
References: <20240311151424.318621-1-sashal@kernel.org>
 <20240311151424.318621-3-sashal@kernel.org>
 <65d9f97b-95a8-474f-a716-32f810cbb1bc@amd.com>
 <CADnq5_OHW9Sw5quFqk52ymGVKXe3PGidB9uLW9wcQcA=pCOTCA@mail.gmail.com>
In-Reply-To: <CADnq5_OHW9Sw5quFqk52ymGVKXe3PGidB9uLW9wcQcA=pCOTCA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=e8629579-166d-466a-823a-bb116716c51a;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2024-03-14T01:33:47Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB6005:EE_|LV3PR12MB9330:EE_
x-ms-office365-filtering-correlation-id: 5bdc7f03-2b7e-4794-5ce2-08dc43d2ef24
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 054VM8bXgXE4eKEAfNqcknY8sKgxI8RO+IHQBUbma5qR17pSMJC+ezVkv2cjPMNAt7roWSsR8MOcp2qzETb9YZirLksSnP5nyw3phq87aznd5y8cfz6Ihvl+tyyhuUZG4G7ojJcHGvUYIVeJpmdXj5Uo2LDBl27Tx73JfbhWQGakDgPVss5Dz0MmVEwc5zTvG7OU2u5LRGbaHZZpGLwnrskkvlWAPAkvdNMUutpinXyxL/kFRmuIOfriZoySo0BuluYUp4cUzgPdj9nc8D22qWTJ4VzTWjSqwrOHjrLBliNC7yfVPVwyJ2YgvrQQS/YlRZJy0IFAAa530hWL58pdzjkg2rrKcFZJlfzQM1rd+jE+tIboLX8M4Irfdm+r4R5TqfcCBZhupsSCLf924TrDAcJs0Ont2jvC17w3CvEkYmRjyTh04VUSfOpUrG5mtjqnWk++kRrCMlpCjkH5bZthsXa7H8V6Lzs6we1ZG85bPkYH0FFxHSmlqEMiXk/BiMKe3sf3nQyuLEvETVa7b2QxwstJXfv+Gh31K5bBDmXn3dNlN8eOFsZ1Bx1FiBc3UWqeXlO+fzMEFdbe9Mo5tLbQTa0PZLQ8Q4aWhxbHVuhuBfQ7FIv7z1NY6CP5OIZn9pXsA3WjfzTADGIV+xnysxaf0A+OudxgpIJKFi9MahPDvJylEyMpzZNytvJi3yyrQwi4gJcjWCQgTMXOjFm6XOq+oPvcMD+0EUdRLFBwg/T6s78=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB6005.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V0hBQ1JXdG12OHUxYjZiYmE3SktTVU9DM0NoQjI1MHFnQWpVYUxBMG5QUkMy?=
 =?utf-8?B?cUs3V2JtVXp5dkZIYlpuQzRoZVdGTk1XR2V1ZStlNGdBbEI4aERTVTkrMGx1?=
 =?utf-8?B?QzU3K3FvMmR4OXFQZWltejdFZlJCdFNubEJBNUVOS1MwbldqWmd1MVB5VWJi?=
 =?utf-8?B?bEs1K1M2OWFFOFRKaGFGd0h5YStwc2lIbFJjbGRkaWtPcURSMU1LTXI4aFZE?=
 =?utf-8?B?bUFEUk5hMUpwYyt6YXlZb2NIcUN1dGh2cmxZY3NiczBwMll0Q205YW9HTjhm?=
 =?utf-8?B?b3UxMWlaTXV0enh0T2NKVGpUNjlYZDcrSEJrUWFvWVJWU1h5ZkhvS01NMkZl?=
 =?utf-8?B?WG9tTVlkSDY4YXRNVUx2OWpaQ1dEZ0d1bG0xZkZXUWRUMHlEbytrbXpnODFF?=
 =?utf-8?B?NWdGL3pzQ3laWDlIT3hZOVZWV0gzVFYvUkV4ekN1cGVSeFdpaXdrb0lIZFpI?=
 =?utf-8?B?NDZRZlo1ay9DQXNVeXF0ZTlyeE8wUENmYkpSNkhHYlpuenhYSkpjSkdiKzNC?=
 =?utf-8?B?UERDQjE4cEJsNTh5cFIyOWhGN0k5NFN0MVAyV1krSGdVZkIzNFVUVTM4UVQv?=
 =?utf-8?B?VWZnRE0yWVlDOXkrTnRZdXVDTVpMWGVVTHF5d0NxOUlRTGlmUDNIbCtvR3Ns?=
 =?utf-8?B?Y2kzL2hoZEFSVnhmR0FzUmlVZ1d0TGY5eit3cXZwenlLR0JNK29WdUI0amph?=
 =?utf-8?B?UVBNeklzb1pZS1pCb0lTYnNpbWtFNWE4bzhWY00wSFVnNEk5bWRuZnJ3b2FV?=
 =?utf-8?B?QlJDS3dsaTc3eVFzcXovZ0lCOUFUbXhLSmd4Y0ZTdytsVEFhQ1RKSVUzNWVq?=
 =?utf-8?B?ejlGZmtwTXFTWUdRc0VmZmhEM0FKWllnU1F4MDc3Wk5UK1VPTEU3SWtZUThH?=
 =?utf-8?B?TGxlelpoQkZjdXZPUCtjbmRNSHlSTFdHY0RaWUVHdm5GcVBDakVNamlZcjZF?=
 =?utf-8?B?U3N1T2orblZQbXk0ZWVETmVvQnMrSG4xUFNocW9uS0oxeXI5VUgyd1FvaFNM?=
 =?utf-8?B?UDNySTBSbzllbGVSeG1HazBTU1dNV0N1QTZpODMzdXdqcmVBTWNhZXp0U2pC?=
 =?utf-8?B?MXRhYzNQaHlFR1Fha0pXaVJVd1NCK0dad2lSRDZnOHNTVi8xSGJCSEZFZUk1?=
 =?utf-8?B?b25kTFB3ZEFlVkhuOHAxYWRNVnFwMXIxVWdGVzc3N2k3elI5OVlzYXpTUnQy?=
 =?utf-8?B?a0cxSlRDMVJvRGJPNEYzTHZKUUo5Z1NkaEdlQXlSLzFHZi9MajRIeWRoMElR?=
 =?utf-8?B?Znd5ZEYyTGNkSWx4Nmc0b2Z5Z3ZwYW1TMERsckFzdW9JaDArZ3NvaFBRMWVp?=
 =?utf-8?B?WWhNUTNxTlR0aElEZHNkbzZ1am51cXlOdEtVanJKMlB5b25od1piZmFVblkw?=
 =?utf-8?B?dzRIZTlZTExXb1dWcFlZZmJabzBOblVzV0F0bmFNbW5zQ0RtSVpFaHBmMXcy?=
 =?utf-8?B?OXVqN0N3R1JoUUphdThjcEVvb1RtSjZTYmNBNVczT3FTYVBJekw2TklkREZZ?=
 =?utf-8?B?MDkzZHZUQ1M4NU15bEdYbEkrSGkvWjd5UC9pcXBIVXZsNFM4RDFlS2xNT3By?=
 =?utf-8?B?TjFxZ05HTEVyOFNXdGhWempwYTJrWWRkVjcxVlUvNktKN3Y4VHpLTWs4Y2d3?=
 =?utf-8?B?MGUxbXhmNHF5MTlEOXdxKzBCaWlPd0FpL0tRT2JoL3dxTDduK292eHk1ekdO?=
 =?utf-8?B?LzZYa3JSZm15VC9tVmFCOVZzQmJScTFMRVI1K2hxaFpZUWNxS2NhN0RqQnVE?=
 =?utf-8?B?WktSSmtzTWNCa1ZsVzh4TWp1V2I3WlA3ZUxCemhzWG9VcGh6N3hpZVFLZXhy?=
 =?utf-8?B?cGMvZmRKQkZlMTV5K2RvQ0xWWUJUUDB3MXlOajlqdHAyVGZLZTRzeE5nZFdB?=
 =?utf-8?B?OEpBWkg3UVpWNnd3RzYxOWdzTzhRTjNCMjJBN0w4WWg0N0cxT2lhaWpRUlpu?=
 =?utf-8?B?cEhVRnBJamJMSEdad2x1ZjdYZUV4UlBQQ0tQbllERVlwRHN0RlUxczNCdlpa?=
 =?utf-8?B?LzRRU00zRHFScGVhclZTQXdOR1BBdEFFTEpMcUtOci9QSnBqUUhaQVZDY2R2?=
 =?utf-8?B?MzZhb1ZHeFJyd09kQzhrR1N2Q0JYK3NSdkpWTDlCZzFraDhPNndDR1RsOXRS?=
 =?utf-8?Q?Ls8g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6005.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bdc7f03-2b7e-4794-5ce2-08dc43d2ef24
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2024 03:00:41.3755 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 16NpT7/er1DpKkjR30Gokli7R/ZBw4Hk0fG0dGC9RcDhpJMCc1DZ1JAvJXm5k5ub
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9330
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCj4gRnJvbTogQWxleCBEZXVjaGVy
IDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBNYXJjaCAxNCwgMjAy
NCA0OjQ2IEFNDQo+IFRvOiBLdWVobGluZywgRmVsaXggPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+
DQo+IENjOiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+OyBsaW51eC1rZXJuZWxAdmdl
ci5rZXJuZWwub3JnOw0KPiBzdGFibGVAdmdlci5rZXJuZWwub3JnOyBMaWFuZywgUHJpa2UgPFBy
aWtlLkxpYW5nQGFtZC5jb20+OyBEZXVjaGVyLA0KPiBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVj
aGVyQGFtZC5jb20+OyBLb2VuaWcsIENocmlzdGlhbg0KPiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQu
Y29tPjsgUGFuLCBYaW5odWkgPFhpbmh1aS5QYW5AYW1kLmNvbT47DQo+IGFpcmxpZWRAZ21haWwu
Y29tOyBkYW5pZWxAZmZ3bGwuY2g7IFpoYW5nLCBIYXdraW5nDQo+IDxIYXdraW5nLlpoYW5nQGFt
ZC5jb20+OyBMYXphciwgTGlqbyA8TGlqby5MYXphckBhbWQuY29tPjsgTWEsIExlDQo+IDxMZS5N
YUBhbWQuY29tPjsgWmh1LCBKYW1lcyA8SmFtZXMuWmh1QGFtZC5jb20+OyBYaWFvLCBTaGFuZQ0K
PiA8c2hhbmUueGlhb0BhbWQuY29tPjsgSmlhbmcsIFNvbm55IDxTb25ueS5KaWFuZ0BhbWQuY29t
PjsgYW1kLQ0KPiBnZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggQVVUT1NFTCA1LjE1IDMvNV0gZHJt
L2FtZGdwdTogRW5hYmxlIGdwdSByZXNldCBmb3IgUzMNCj4gYWJvcnQgY2FzZXMgb24gUmF2ZW4g
c2VyaWVzDQo+DQo+IE9uIFdlZCwgTWFyIDEzLCAyMDI0IGF0IDQ6MTLigK9QTSBGZWxpeCBLdWVo
bGluZyA8ZmVsaXgua3VlaGxpbmdAYW1kLmNvbT4NCj4gd3JvdGU6DQo+ID4NCj4gPiBPbiAyMDI0
LTAzLTExIDExOjE0LCBTYXNoYSBMZXZpbiB3cm90ZToNCj4gPiA+IEZyb206IFByaWtlIExpYW5n
IDxQcmlrZS5MaWFuZ0BhbWQuY29tPg0KPiA+ID4NCj4gPiA+IFsgVXBzdHJlYW0gY29tbWl0IGM2
NzFlYzAxMzExYjQ3NDRiMzc3Zjk4YjBiNGM2ZDAzM2ZlNTY5YjMgXQ0KPiA+ID4NCj4gPiA+IEN1
cnJlbnRseSwgR1BVIHJlc2V0cyBjYW4gbm93IGJlIHBlcmZvcm1lZCBzdWNjZXNzZnVsbHkgb24g
dGhlIFJhdmVuDQo+ID4gPiBzZXJpZXMuIFdoaWxlIEdQVSByZXNldCBpcyByZXF1aXJlZCBmb3Ig
dGhlIFMzIHN1c3BlbmQgYWJvcnQgY2FzZS4NCj4gPiA+IFNvIG5vdyBjYW4gZW5hYmxlIGdwdSBy
ZXNldCBmb3IgUzMgYWJvcnQgY2FzZXMgb24gdGhlIFJhdmVuIHNlcmllcy4NCj4gPg0KPiA+IFRo
aXMgbG9va3Mgc3VzcGljaW91cyB0byBtZS4gSSdtIG5vdCBzdXJlIHdoYXQgY29uZGl0aW9ucyBt
YWRlIHRoZSBHUFUNCj4gPiByZXNldCBzdWNjZXNzZnVsLiBCdXQgdW5sZXNzIGFsbCB0aGUgY2hh
bmdlcyBpbnZvbHZlZCB3ZXJlIGFsc28NCj4gPiBiYWNrcG9ydGVkLCB0aGlzIHNob3VsZCBwcm9i
YWJseSBub3QgYmUgYXBwbGllZCB0byBvbGRlciBrZXJuZWwNCj4gPiBicmFuY2hlcy4gSSdtIHNw
ZWN1bGF0aW5nIGl0IG1heSBiZSByZWxhdGVkIHRvIHRoZSByZW1vdmFsIG9mIEFNRA0KPiBJT01N
VXYyLg0KPiA+DQo+DQo+IFdlIHNob3VsZCBnZXQgY29uZmlybWF0aW9uIGZyb20gUHJpa2UsIGJ1
dCBJIHRoaW5rIGhlIHRlc3RlZCB0aGlzIG9uIG9sZGVyDQo+IGtlcm5lbHMgYXMgd2VsbC4NCj4N
Cj4gQWxleA0KPg0KPiA+IFJlZ2FyZHMsDQo+ID4gICAgRmVsaXgNCj4gPg0KDQpUaGUgUmF2ZW4v
UmF2ZW4yIHNlcmllcyBHUFUgcmVzZXQgZnVuY3Rpb24gd2FzIGVuYWJsZWQgaW4gc29tZSBvbGRl
ciBrZXJuZWwgdmVyc2lvbnMgc3VjaCBhcyA1LjUgYnV0IGZpbHRlcmVkIG91dCBpbiBtb3JlIHJl
Y2VudCBrZXJuZWwgZHJpdmVyIHZlcnNpb25zLiBUaGVyZWZvcmUsIHRoaXMgcGF0Y2ggb25seSBh
cHBsaWVzIHRvIHRoZSBsYXRlc3Qga2VybmVsIHZlcnNpb24sIGFuZCBpdCBzaG91bGQgYmUgc2Fm
ZSB3aXRob3V0IGFmZmVjdGluZyBvdGhlciBjYXNlcyBieSBlbmFibGluZyB0aGUgUmF2ZW4gR1BV
IHJlc2V0IG9ubHkgb24gdGhlIFMzIHN1c3BlbmQgYWJvcnQgY2FzZS4gRnJvbSB0aGUgQ2hyb21l
IGtlcm5lbCBsb2cgaW5kaWNhdGluZyB0aGF0IHRoZSBBTUQgSU9NTVV2MiBkcml2ZXIgaXMgbG9h
ZGVkLCBhbmQgd2l0aCB0aGlzIHBhdGNoIHRyaWdnZXJpbmcgdGhlIEdQVSByZXNldCBiZWZvcmUg
dGhlIEFNREdQVSBkZXZpY2UgcmVpbml0aWFsaXphdGlvbiwgaXQgY2FuIGVmZmVjdGl2ZWx5IGhh
bmRsZSB0aGUgUzMgc3VzcGVuZCBhYm9ydCByZXN1bWUgcHJvYmxlbSBvbiB0aGUgUmF2ZW4gc2Vy
aWVzLg0KDQpXYXMgdGhlIFJhdmVuIEdQVSByZXNldCBwcmV2aW91c2x5IGRpc2FibGVkIGR1ZSB0
byB0aGUgQU1EIElPTU1VdjIgZHJpdmVyPyBJZiBzbywgYmFzZWQgb24gdGhlIENocm9tZWJvb2sn
cyB2ZXJpZmljYXRpb24gcmVzdWx0LCB0aGUgUmF2ZW4gc2VyaWVzIEdQVSByZXNldCBjYW4gcHJv
YmFibHkgYmUgZW5hYmxlZCB3aXRoIElPTU1VdjIgZm9yIG90aGVyIGNhc2VzIGFzIHdlbGwuDQoN
ClRoYW5rcywNClByaWtlDQo+ID4NCj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBQcmlrZSBM
aWFuZyA8UHJpa2UuTGlhbmdAYW1kLmNvbT4NCj4gPiA+IEFja2VkLWJ5OiBBbGV4IERldWNoZXIg
PGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IERl
dWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBT
YXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+DQo+ID4gPiAtLS0NCj4gPiA+ICAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyB8IDQ1ICsrKysrKysrKysrKysrKysrLS0tLS0t
LS0tLQ0KPiAtLS0NCj4gPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDIw
IGRlbGV0aW9ucygtKQ0KPiA+ID4NCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9zb2MxNS5jDQo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Nv
YzE1LmMNCj4gPiA+IGluZGV4IDZhMzQ4NmY1MmQ2OTguLmVmNWIzZWVkYzg2MTUgMTAwNjQ0DQo+
ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jDQo+ID4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jDQo+ID4gPiBAQCAtNjA1LDExICs2
MDUsMzQgQEAgc29jMTVfYXNpY19yZXNldF9tZXRob2Qoc3RydWN0DQo+IGFtZGdwdV9kZXZpY2Ug
KmFkZXYpDQo+ID4gPiAgICAgICAgICAgICAgIHJldHVybiBBTURfUkVTRVRfTUVUSE9EX01PREUx
Ow0KPiA+ID4gICB9DQo+ID4gPg0KPiA+ID4gK3N0YXRpYyBib29sIHNvYzE1X25lZWRfcmVzZXRf
b25fcmVzdW1lKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KPiA+ID4gK3sNCj4gPiA+ICsg
ICAgIHUzMiBzb2xfcmVnOw0KPiA+ID4gKw0KPiA+ID4gKyAgICAgc29sX3JlZyA9IFJSRUczMl9T
T0MxNShNUDAsIDAsIG1tTVAwX1NNTl9DMlBNU0dfODEpOw0KPiA+ID4gKw0KPiA+ID4gKyAgICAg
LyogV2lsbCByZXNldCBmb3IgdGhlIGZvbGxvd2luZyBzdXNwZW5kIGFib3J0IGNhc2VzLg0KPiA+
ID4gKyAgICAgICogMSkgT25seSByZXNldCBsaW1pdCBvbiBBUFUgc2lkZSwgZEdQVSBoYXNuJ3Qg
Y2hlY2tlZCB5ZXQuDQo+ID4gPiArICAgICAgKiAyKSBTMyBzdXNwZW5kIGFib3J0IGFuZCBUT1Mg
YWxyZWFkeSBsYXVuY2hlZC4NCj4gPiA+ICsgICAgICAqLw0KPiA+ID4gKyAgICAgaWYgKGFkZXYt
PmZsYWdzICYgQU1EX0lTX0FQVSAmJiBhZGV2LT5pbl9zMyAmJg0KPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICFhZGV2LT5zdXNwZW5kX2NvbXBsZXRlICYmDQo+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgc29sX3JlZykNCj4gPiA+ICsgICAgICAgICAgICAgcmV0dXJuIHRydWU7DQo+ID4g
PiArDQo+ID4gPiArICAgICByZXR1cm4gZmFsc2U7DQo+ID4gPiArfQ0KPiA+ID4gKw0KPiA+ID4g
ICBzdGF0aWMgaW50IHNvYzE1X2FzaWNfcmVzZXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
DQo+ID4gPiAgIHsNCj4gPiA+ICAgICAgIC8qIG9yaWdpbmFsIHJhdmVuIGRvZXNuJ3QgaGF2ZSBm
dWxsIGFzaWMgcmVzZXQgKi8NCj4gPiA+IC0gICAgIGlmICgoYWRldi0+YXB1X2ZsYWdzICYgQU1E
X0FQVV9JU19SQVZFTikgfHwNCj4gPiA+IC0gICAgICAgICAoYWRldi0+YXB1X2ZsYWdzICYgQU1E
X0FQVV9JU19SQVZFTjIpKQ0KPiA+ID4gKyAgICAgLyogT24gdGhlIGxhdGVzdCBSYXZlbiwgdGhl
IEdQVSByZXNldCBjYW4gYmUgcGVyZm9ybWVkDQo+ID4gPiArICAgICAgKiBzdWNjZXNzZnVsbHku
IFNvIG5vdywgdGVtcG9yYXJpbHkgZW5hYmxlIGl0IGZvciB0aGUNCj4gPiA+ICsgICAgICAqIFMz
IHN1c3BlbmQgYWJvcnQgY2FzZS4NCj4gPiA+ICsgICAgICAqLw0KPiA+ID4gKyAgICAgaWYgKCgo
YWRldi0+YXB1X2ZsYWdzICYgQU1EX0FQVV9JU19SQVZFTikgfHwNCj4gPiA+ICsgICAgICAgICAo
YWRldi0+YXB1X2ZsYWdzICYgQU1EX0FQVV9JU19SQVZFTjIpKSAmJg0KPiA+ID4gKyAgICAgICAg
ICAgICAhc29jMTVfbmVlZF9yZXNldF9vbl9yZXN1bWUoYWRldikpDQo+ID4gPiAgICAgICAgICAg
ICAgIHJldHVybiAwOw0KPiA+ID4NCj4gPiA+ICAgICAgIHN3aXRjaCAoc29jMTVfYXNpY19yZXNl
dF9tZXRob2QoYWRldikpIHsgQEAgLTE0OTAsMjQgKzE1MTMsNg0KPiA+ID4gQEAgc3RhdGljIGlu
dCBzb2MxNV9jb21tb25fc3VzcGVuZCh2b2lkICpoYW5kbGUpDQo+ID4gPiAgICAgICByZXR1cm4g
c29jMTVfY29tbW9uX2h3X2ZpbmkoYWRldik7DQo+ID4gPiAgIH0NCj4gPiA+DQo+ID4gPiAtc3Rh
dGljIGJvb2wgc29jMTVfbmVlZF9yZXNldF9vbl9yZXN1bWUoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYpDQo+ID4gPiAtew0KPiA+ID4gLSAgICAgdTMyIHNvbF9yZWc7DQo+ID4gPiAtDQo+ID4g
PiAtICAgICBzb2xfcmVnID0gUlJFRzMyX1NPQzE1KE1QMCwgMCwgbW1NUDBfU01OX0MyUE1TR184
MSk7DQo+ID4gPiAtDQo+ID4gPiAtICAgICAvKiBXaWxsIHJlc2V0IGZvciB0aGUgZm9sbG93aW5n
IHN1c3BlbmQgYWJvcnQgY2FzZXMuDQo+ID4gPiAtICAgICAgKiAxKSBPbmx5IHJlc2V0IGxpbWl0
IG9uIEFQVSBzaWRlLCBkR1BVIGhhc24ndCBjaGVja2VkIHlldC4NCj4gPiA+IC0gICAgICAqIDIp
IFMzIHN1c3BlbmQgYWJvcnQgYW5kIFRPUyBhbHJlYWR5IGxhdW5jaGVkLg0KPiA+ID4gLSAgICAg
ICovDQo+ID4gPiAtICAgICBpZiAoYWRldi0+ZmxhZ3MgJiBBTURfSVNfQVBVICYmIGFkZXYtPmlu
X3MzICYmDQo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgIWFkZXYtPnN1c3BlbmRfY29tcGxl
dGUgJiYNCj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICBzb2xfcmVnKQ0KPiA+ID4gLSAgICAg
ICAgICAgICByZXR1cm4gdHJ1ZTsNCj4gPiA+IC0NCj4gPiA+IC0gICAgIHJldHVybiBmYWxzZTsN
Cj4gPiA+IC19DQo+ID4gPiAtDQo+ID4gPiAgIHN0YXRpYyBpbnQgc29jMTVfY29tbW9uX3Jlc3Vt
ZSh2b2lkICpoYW5kbGUpDQo+ID4gPiAgIHsNCj4gPiA+ICAgICAgIHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNlICopaGFuZGxlOw0K
