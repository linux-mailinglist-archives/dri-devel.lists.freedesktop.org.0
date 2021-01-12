Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EF52F29C7
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 09:12:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05FA66E11C;
	Tue, 12 Jan 2021 08:12:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2056.outbound.protection.outlook.com [40.107.236.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B956E11C;
 Tue, 12 Jan 2021 08:12:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RkT4TIRWPnOUVaOfRP1c0+WuZP6l5MOlqfrEcknqwrwVaaPxxFt95wFKNPkoaXSHQHuttN1fmXdmAvAPjXn9AMhMd09savHEp632BpQAIIsXT5+u1XSzMA3r/fB6tJNSo+4cRAXrAn5t9fP3QJojmVDuE5tWPGwLhiWHrRWGWezLi70aTjip1ZPQ2yYqH0a76vYDzWwU4uS+4YqXQ2ETNz4mga1gTgyFtEogHL60eXKnmgvDSHUDgQYZqdh8HBvZ94L+1kd9FChlIWNuggt70DOyeCI1HALmMQLeOwTdaHhi6rX/roIMRpyiTBBn/T+Q3HeJfnTh3OjtyPPbrtFY3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UZIKRFyEEXk9+0PYHOWMrTjUWEJ8M7D2iOYTHlYOPRs=;
 b=Nq5E5FKnhuJVXjosvbUDj6eHPV+gvuhex4/9s3wxbYRtX4VB90Cpy1wwx0wbT4g/T1JQe5dDrRtFcGzR7IoKq137PpIpAGX1N/9/VY9r3+h5gSdqIxLVDS5rI2TvaNN6TdXol04gXbAqiKExRtXA1pyqv4nKmkLvnZlzS19oey1KsEC3A/3JYf4YLZUjxQ60mu3e279g8c8+aWzanyioF0nNZ6NgWqOLM5Ded4XVGe1ZcZUW1QiMYAJue1j77RwKgGSSsjUEzEtrqN04H8PhjYKCTgaUO3RN84ZtTUZMF7nKBdQ14Hq3gUOtl+EwpAka2zJQyWbCmfrW7S/+RfkMMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UZIKRFyEEXk9+0PYHOWMrTjUWEJ8M7D2iOYTHlYOPRs=;
 b=AdwI1t7IJglfEGmt9UkZlOUSft+X+WSD0Id9FRVF/xRXPvyAZnpaXHFuiHkbSff2gkoO8LrHtLB1cToLpZvQ4N2mCqG91k12GQ63UhlXlIVt5b9nOur1IGWy82hb+dnZvng4BX+nbHoYEBX20ZXw7vmJNjYDsIj0HZsMWD+azPo=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4126.namprd12.prod.outlook.com (2603:10b6:208:199::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Tue, 12 Jan
 2021 08:12:46 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 08:12:46 +0000
Subject: Re: [PATCH v3 01/12] drm: Add dummy page per device or GEM object
To: Daniel Vetter <daniel@ffwll.ch>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
References: <f374aaa4-4a30-e60c-cd4b-d463443c1137@amd.com>
 <X/c1IXX11chjHyl4@phenom.ffwll.local>
 <75c8a6f3-1e71-3242-6576-c0e661d6a62f@amd.com>
 <X/c3PKL70HXBt3Jk@phenom.ffwll.local>
 <589ece1f-2718-87ab-ec07-4044c3df1c58@amd.com>
 <a140ca34-9cfc-9c2f-39e2-1af156faabfe@amd.com>
 <b73319b2-1723-6650-8d03-d8f775119e53@amd.com>
 <29ef0c97-ac1b-a8e6-ee57-16727ff1803e@amd.com>
 <62645d03-704f-571e-bfe6-7d992b010a08@amd.com>
 <SN6PR12MB46235A1D04FDF4BBD9E60F94EAAE0@SN6PR12MB4623.namprd12.prod.outlook.com>
 <X/x5RD0xQxWUYvQ3@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <99bae58b-dde2-bd46-5944-a89b106a6ae0@amd.com>
Date: Tue, 12 Jan 2021 09:12:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <X/x5RD0xQxWUYvQ3@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR02CA0013.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::26) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR02CA0013.eurprd02.prod.outlook.com (2603:10a6:208:3e::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 08:12:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bbee22bd-600f-4e10-816a-08d8b6d1d83f
X-MS-TrafficTypeDiagnostic: MN2PR12MB4126:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4126B73FE64079E02884665D83AA0@MN2PR12MB4126.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MJGog7GoRoYzRF2pFbQEA+oLfRQefkob6wfO+HFa08sHBK60fiPxzmr8hgq+hV0T6yxkl7cGWWt/5U2TFQrtihrG8d7RE9G5N5mW0M3t1z4NdTlZqI9QJ+qT9+4ZupgNKxMMXBc2sQcq0FFylF0oqVCdewIGazgC0ya3IRvonP1UAXNiCytCTXGC5rkNCOg+TOrMewT3Z2R/4tY7vcpTxmWnQFb7mAzmCn3PON4WSnUoBc9zFAeLtPL13Y1uTELdMnb6epiXUoXWHg7G8SBaV6GkQN9s3TKANQgWcADXx/VbGgVYFJwBeZfzS4pY1lcdtrw0b1GeUWL0Ob+KJIDP5oeoTjRvQ59g7S+oof38FJh+nTgPOV9sc4DKeD5bdVoFeyUs2c9JsFwq9oE3rS7N2CI0PVsjllx7FgXuw40ZkPPcWRN/EadXlfQJiniuKK7y2HBcyMfBxOos+xNmXYkUqLl8ekbQfP2kfwIKOgvc26c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(136003)(396003)(346002)(39860400002)(186003)(53546011)(52116002)(86362001)(8936002)(36756003)(83380400001)(31686004)(2906002)(66574015)(16526019)(66556008)(6666004)(2616005)(54906003)(8676002)(66946007)(478600001)(31696002)(6636002)(6486002)(7416002)(110136005)(4326008)(316002)(66476007)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MENCYkZNUjhKNzBxbm9vSU40RlJFa0V4QXZ2Z2dxRjcwK3o2NERBUEcyN1Nh?=
 =?utf-8?B?RnBiN1A2VXozMktHZWlhNXhPdEQ0bWlEVk1qOE5rSGZlUUUvR3paMzhzUUZM?=
 =?utf-8?B?eXE5QXVPQzlHQzU4UVVibE9rR201NEFmL2w3M2trdmFvbkpWcEQvOHFidkNW?=
 =?utf-8?B?R3VrT2h1TGg1UlNGYUZFUVB5WVF4TmZmWlk1RmdCcGNwNUR4bWRQYngraVR3?=
 =?utf-8?B?VlEraVdsblI2eTA1bmtuRXBuQkdsUzg1elZjK1BrRnR3Rm5NaWxBZDB0UTIy?=
 =?utf-8?B?bDlzM2RTVUZPZUJYRnlmQVQvWm1wV2JnM1FjcXNjMkwyN0EvL3ZkYlBldEkv?=
 =?utf-8?B?NmxQOTZKanYxL3JlQ2JhQkV3Kzg5VXBYZXpvM3BhTTQ4dnZ4T0ZoWmRKdU1a?=
 =?utf-8?B?L2xrVTh5UXdQYkNpWXVpZk1uR3liR21KeEhhZDBJWlRTRGFWV0FEcGJieFR2?=
 =?utf-8?B?Qm9FL2djQTVIZXIxTHdRSXk0YzBjWHhPTzQ3Wmk0R21xZUZlbUhOWnhiWU1i?=
 =?utf-8?B?d3docDFqNTRtNklPMVRIVmNmSCs3TllKUnM0OGdkUlR0QmRPSEVrM1Z2MkRr?=
 =?utf-8?B?RXA0VVJKeUdQM1IxeUNBdXM0bHNMNGhCeC9Ya2V5OFlPM1EwOE04NzZ1THpI?=
 =?utf-8?B?ZzJMTlFIbEdLUFhiMjI4dFllSGNUWXZLaXMwY1B4RjFUckU1NVhXbFVnd3Bq?=
 =?utf-8?B?OCtaeHdqdTBNdzdaa2l5ZU5ydWhZdDFYMGVVOWRVSUFQOUdVOGZUNDNTNm12?=
 =?utf-8?B?UFBod3FIbktFTVBDbnlMREhGbUxHNmVEdkZQSFRkVGdVMDgzY1h4emluRzJ3?=
 =?utf-8?B?M1YwZ1ZwQ1V3YitINXYyMk5MQkpXQVNPbmwrT2JXcWlsSEREMUNqakc4dkEr?=
 =?utf-8?B?RkdUVjF1ckNSazJ5d0h0U1U3WUJsd2xGTHg3U3NOUlBRWXl4eDBqL2ZveWpp?=
 =?utf-8?B?VS9NMk91TEFlOXZkNlkxYTFCb1QxRTd5cG9odnBSa0ZHUURNSllGakRVbDJG?=
 =?utf-8?B?VlczNWh1QVhDL1ZVUEhnUHlXbVJ2c2FRY0VsWEFhc2xudzczemwxMmttdzBE?=
 =?utf-8?B?U04rcnBLM0RNQlVqR2Y3UnhpbjMxR3NYL29xdzBIQUhRcGxvYjVoOHJEdk1R?=
 =?utf-8?B?RUdDN1NRSDc0VHYwUWVnY3QveTZZM3FGOHVRekNDZ2NaclFtcmVlbkpldEJ0?=
 =?utf-8?B?dUVhbExaazZPVlVmTDdScjU2SFQzWDZoQzdZQ3A0RUVaeFIxY3FDSC9vYlZ6?=
 =?utf-8?B?eHVwSFVQQ2IyQi9aVjBFS3g1MWZTMFZ5Y29yK0M0QUFMU0t6b1YzSmFwUFAw?=
 =?utf-8?B?WS9hSUk0UEFYajRBbDNKR2hKbnkxbzFSYWo0K2pKczJhU2RsL0VOWitMZUMx?=
 =?utf-8?B?VnA5aHgvUk1uRzVNdFhGSXdnYnZWKzdDNU5nY2NraGJ1RG9wRWwyeXpqZlFk?=
 =?utf-8?Q?S8FrzzPn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 08:12:46.4416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: bbee22bd-600f-4e10-816a-08d8b6d1d83f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Ucvj62ePvkqkyn45URDWMKsf7rnHqv8X8h4RbN7u9ViDO704xxJhTmmQKS97rBD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4126
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "yuq825@gmail.com" <yuq825@gmail.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTEuMDEuMjEgdW0gMTc6MTMgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIEZyaSwgSmFu
IDA4LCAyMDIxIGF0IDA0OjQ5OjU1UE0gKzAwMDAsIEdyb2R6b3Zza3ksIEFuZHJleSB3cm90ZToK
Pj4gT2sgdGhlbiwgSSBndWVzcyBJIHdpbGwgcHJvY2VlZCB3aXRoIHRoZSBkdW1teSBwYWdlcyBs
aXN0IGltcGxlbWVudGF0aW9uIHRoZW4uCj4+Cj4+IEFuZHJleQo+Pgo+PiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+PiBGcm9tOiBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFu
LktvZW5pZ0BhbWQuY29tPgo+PiBTZW50OiAwOCBKYW51YXJ5IDIwMjEgMDk6NTIKPj4gVG86IEdy
b2R6b3Zza3ksIEFuZHJleSA8QW5kcmV5Lkdyb2R6b3Zza3lAYW1kLmNvbT47IERhbmllbCBWZXR0
ZXIgPGRhbmllbEBmZndsbC5jaD4KPj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
IDxhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZz47IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcgPGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+OyBkYW5pZWwudmV0dGVy
QGZmd2xsLmNoIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPjsgcm9iaEBrZXJuZWwub3JnIDxyb2Jo
QGtlcm5lbC5vcmc+OyBsLnN0YWNoQHBlbmd1dHJvbml4LmRlIDxsLnN0YWNoQHBlbmd1dHJvbml4
LmRlPjsgeXVxODI1QGdtYWlsLmNvbSA8eXVxODI1QGdtYWlsLmNvbT47IGVyaWNAYW5ob2x0Lm5l
dCA8ZXJpY0BhbmhvbHQubmV0PjsgRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hl
ckBhbWQuY29tPjsgZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmcgPGdyZWdraEBsaW51eGZvdW5k
YXRpb24ub3JnPjsgcHBhYWxhbmVuQGdtYWlsLmNvbSA8cHBhYWxhbmVuQGdtYWlsLmNvbT47IFdl
bnRsYW5kLCBIYXJyeSA8SGFycnkuV2VudGxhbmRAYW1kLmNvbT4KPj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2MyAwMS8xMl0gZHJtOiBBZGQgZHVtbXkgcGFnZSBwZXIgZGV2aWNlIG9yIEdFTSBvYmpl
Y3QKPj4KPj4gTWhtLCBJJ20gbm90IGF3YXJlIG9mIGFueSBsZXQgb3ZlciBwb2ludGVyIGJldHdl
ZW4gVFRNIGFuZCBHRU0gYW5kIHdlCj4+IHdvcmtlZCBxdWl0ZSBoYXJkIG9uIHJlZHVjaW5nIHRo
ZSBzaXplIG9mIHRoZSBhbWRncHVfYm8sIHNvIGFub3RoZXIKPj4gZXh0cmEgcG9pbnRlciBqdXN0
IGZvciB0aGF0IGNvcm5lciBjYXNlIHdvdWxkIHN1Y2sgcXVpdGUgYSBiaXQuCj4gV2UgaGF2ZSBh
IHRvbiBvZiBvdGhlciBwb2ludGVycyBpbiBzdHJ1Y3QgYW1kZ3B1X2JvIChvciBhbnkgb2YgaXQn
cyBsb3dlcgo+IHRoaW5ncykgd2hpY2ggYXJlIGZhaXJseSBzaW5nbGUtdXNlLCBzbyBJJ20gcmVh
bGx5IG5vdCBtdWNoIHNlZWluZyB0aGUKPiBwb2ludCBpbiBtYWtpbmcgdGhpcyBhIHNwZWNpYWwg
Y2FzZS4gSXQgYWxzbyBtZWFucyB0aGUgbGlmZXRpbWUgbWFuYWdlbWVudAo+IGJlY29tZXMgYSBi
aXQgaWZmeSwgc2luY2Ugd2UgY2FuJ3QgdGhyb3cgYXdheSB0aGUgZHVtbXkgcGFnZSB0aGVuIHRo
ZSBsYXN0Cj4gcmVmZXJlbmNlIHRvIHRoZSBibyBpcyByZWxlYXNlZCAoc2luY2Ugd2UgZG9uJ3Qg
dHJhY2sgaXQgdGhlcmUpLCBidXQgb25seQo+IHdoZW4gdGhlIGxhc3QgcG9pbnRlciB0byB0aGUg
ZGV2aWNlIGlzIHJlbGVhc2VkLiBQb3RlbnRpYWxseSB0aGlzIG1lYW5zIGEKPiBwaWxlIG9mIGRh
bmdsaW5nIHBhZ2VzIGhhbmdpbmcgYXJvdW5kIGZvciB0b28gbG9uZy4KClllYWgsIGFsbCBvZiB0
aGVtIGFyZSBhbHJlYWR5IG9uIG15IFRPRE8gbGlzdCwgYnV0IHNlZSBiZWxvdy4KCj4gSWYgeW91
IG5lZWQgc29tZSBpZGVhcyBmb3IgcmVkdW5kYW50IHBvaW50ZXJzOgo+IC0gZGVzdHJveSBjYWxs
YmFjayAoa2luZGEgbm90IGNvb2wgdG8gbm90IGhhdmUgdGhpcyBjb25zdCBhbnl3YXkpLCB3ZQo+
ICAgIGNvdWxkIHJlZmNvdW50IGl0IGFsbCB3aXRoIHRoZSBvdmVyYWxsIGdlbSBiby4gUXVpdGUg
YSBiaXQgb2Ygd29yay4KClRoZSBiaWdnZXIgcHJvYmxlbXMgaXMgdGhhdCBUVE0gYmFzZWQgZHJp
dmVycyBhcmUgdXNpbmcgdGhlIGRlc3Ryb3kgCmNhbGxiYWNrIHBvaW50ZXIgdG8gZGlzdGluY3Qg
Z2hvc3Qgb2JqZWN0cyBmcm9tIHJlYWwgb25lcy4KCldlIGZpcnN0IG5lZWQgdG8gZ2V0IHJpZCBv
ZiB0aG9zZS4gSSBhbHJlYWR5IGhhdmUgYSBwbGFuIGZvciB0aGF0IGFuZCAKfjIwJSBvZiBpdCBp
bXBsZW1lbnRlZCwgYnV0IGl0IGlzIG1vcmUgY29tcGxpY2F0ZWQgYmVjYXVzZSBvZiB0aGUgZHJp
dmVyIApzcGVjaWZpYyBiYWNrZW5kcyBpbiBOb3V2ZWF1LCBBbWRncHUgYW5kIHZtd2dmeC4KCj4g
LSBiZGV2IHBvaW50ZXIsIGlmIHdlIG1vdmUgdGhlIGRldmljZSB0dG0gc3R1ZmYgaW50byBzdHJ1
Y3QgZHJtX2RldmljZSwgb3IKPiAgICBjcmVhdGUgYSBjb21tb24gc3RydWN0IHR0bV9kZXZpY2Us
IHdlIGNhbiBkaXRjaCB0aGF0CgpZZXMsIGV4YWN0bHkgdGhhdCdzIHdoYXQgbXkgZGV2aWNlIHN0
cnVjdHVyZSByZW5hbWUgcGF0Y2ggc2V0IGlzIGFpbWluZyAKZm9yIDopCgo+IC0gV2UgY291bGQg
cHJvYmFibHkgbWVyZ2UgYSBmZXcgb2YgdGhlIGZpZWxkcyBhbmQgZmluZCA4IGJ5dGVzIHNvbWV3
aGVyZQoKUGxlYXNlIHBvaW50IG91dCB3aGVyZS4KCj4gLSB3ZSBzdGlsbCBoYXZlIDIga3JlZnMs
IHdvdWxkIHByb2JhYmx5IG5lZWQgdG8gZml4IHRoYXQgYmVmb3JlIHdlIGNhbgo+ICAgIG1lcmdl
IHRoZSBkZXN0cm95IGNhbGxiYWNrcwoKWWVzLCBhbHJlYWR5IG9uIG15IFRPRE8gbGlzdCBhcyB3
ZWxsLiBCdXQgdGhlIGxhc3QgdGltZSBJIGxvb2tlZCBpbnRvIAp0aGlzIEkgd2FzIGJsb2NrZWQg
YnkgdGhlIHN0cnVjdF9tdXRleCBvbmNlIG1vcmUuCgo+IFNvIHRoZXJlJ3MgcGxlbnR5IG9mIHJv
b20gc3RpbGwsIGlmIHRoZSBzaXplIG9mIGEgYm8gc3RydWN0IGlzIHJlYWxseSB0aGF0Cj4gY3Jp
dGljYWwuIEltbyBpdCdzIG5vdC4KCkl0IGlzLiBTZWUgd2UgaGFkIGEgc2l6ZSBvZiBzdHJ1Y3Qg
YW1kZ3B1X2JvIG9mIG92ZXIgMTUwMCBieXRlcyBiZWNhdXNlIAp3ZSBzdG9wcGVkIGNhcmluZyBm
b3IgdGhhdCwgbm8gd2UgYXJlIGRvd24gdG8gODE2IGF0IHRoZSBtb21lbnQuCgpXZSByZWFsbHkg
bmVlZCB0byBnZXQgcmlkIG9mIHRoaXMgZHVwbGljYXRpb24gb2YgZnVuY3Rpb25hbGl0eSBhbmQg
CnN0cnVjdHVyZSBiZXR3ZWVuIFRUTSBhbmQgR0VNLgoKQ2hyaXN0aWFuLgoKPiAtRGFuaWVsCj4K
Pgo+PiBDaHJpc3RpYW4uCj4+Cj4+IEFtIDA4LjAxLjIxIHVtIDE1OjQ2IHNjaHJpZWIgQW5kcmV5
IEdyb2R6b3Zza3k6Cj4+PiBEYW5pZWwgaGFkIHNvbWUgb2JqZWN0aW9ucyB0byB0aGlzIChzZWUg
YmVsbG93KSBhbmQgc28gSSBndWVzcyBJIG5lZWQKPj4+IHlvdSBib3RoIHRvIGFncmVlIG9uIHRo
ZSBhcHByb2FjaCBiZWZvcmUgSSBwcm9jZWVkLgo+Pj4KPj4+IEFuZHJleQo+Pj4KPj4+IE9uIDEv
OC8yMSA5OjMzIEFNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+IEFtIDA4LjAxLjIxIHVt
IDE1OjI2IHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pj4+IEhleSBDaHJpc3RpYW4sIGp1
c3QgYSBwaW5nLgo+Pj4+IFdhcyB0aGVyZSBhbnkgcXVlc3Rpb24gZm9yIG1lIGhlcmU/Cj4+Pj4K
Pj4+PiBBcyBmYXIgYXMgSSBjYW4gc2VlIHRoZSBiZXN0IGFwcHJvYWNoIHdvdWxkIHN0aWxsIGJl
IHRvIGZpbGwgdGhlIFZNQQo+Pj4+IHdpdGggYSBzaW5nbGUgZHVtbXkgcGFnZSBhbmQgYXZvaWQg
cG9pbnRlcnMgaW4gdGhlIEdFTSBvYmplY3QuCj4+Pj4KPj4+PiBDaHJpc3RpYW4uCj4+Pj4KPj4+
Pj4gQW5kcmV5Cj4+Pj4+Cj4+Pj4+IE9uIDEvNy8yMSAxMTozNyBBTSwgQW5kcmV5IEdyb2R6b3Zz
a3kgd3JvdGU6Cj4+Pj4+PiBPbiAxLzcvMjEgMTE6MzAgQU0sIERhbmllbCBWZXR0ZXIgd3JvdGU6
Cj4+Pj4+Pj4gT24gVGh1LCBKYW4gMDcsIDIwMjEgYXQgMTE6MjY6NTJBTSAtMDUwMCwgQW5kcmV5
IEdyb2R6b3Zza3kgd3JvdGU6Cj4+Pj4+Pj4+IE9uIDEvNy8yMSAxMToyMSBBTSwgRGFuaWVsIFZl
dHRlciB3cm90ZToKPj4+Pj4+Pj4+IE9uIFR1ZSwgSmFuIDA1LCAyMDIxIGF0IDA0OjA0OjE2UE0g
LTA1MDAsIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOgo+Pj4+Pj4+Pj4+IE9uIDExLzIzLzIwIDM6
MDEgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+Pj4+Pj4+Pj4+IEFtIDIzLjExLjIwIHVt
IDA1OjU0IHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pj4+Pj4+Pj4+PiBPbiAxMS8yMS8y
MCA5OjE1IEFNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+Pj4+Pj4+Pj4+IEFtIDIxLjEx
LjIwIHVtIDA2OjIxIHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pj4+Pj4+Pj4+Pj4+IFdp
bGwgYmUgdXNlZCB0byByZXJvdXRlIENQVSBtYXBwZWQgQk8ncyBwYWdlIGZhdWx0cyBvbmNlCj4+
Pj4+Pj4+Pj4+Pj4+IGRldmljZSBpcyByZW1vdmVkLgo+Pj4+Pj4+Pj4+Pj4+IFVmZiwgb25lIHBh
Z2UgZm9yIGVhY2ggZXhwb3J0ZWQgRE1BLWJ1Zj8gVGhhdCdzIG5vdAo+Pj4+Pj4+Pj4+Pj4+IHNv
bWV0aGluZyB3ZSBjYW4gZG8uCj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+PiBXZSBuZWVkIHRv
IGZpbmQgYSBkaWZmZXJlbnQgYXBwcm9hY2ggaGVyZS4KPj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+
Pj4+IENhbid0IHdlIGNhbGwgYWxsb2NfcGFnZSgpIG9uIGVhY2ggZmF1bHQgYW5kIGxpbmsgdGhl
bSB0b2dldGhlcgo+Pj4+Pj4+Pj4+Pj4+IHNvIHRoZXkgYXJlIGZyZWVkIHdoZW4gdGhlIGRldmlj
ZSBpcyBmaW5hbGx5IHJlYXBlZD8KPj4+Pj4+Pj4+Pj4+IEZvciBzdXJlIGJldHRlciB0byBvcHRp
bWl6ZSBhbmQgYWxsb2NhdGUgb24gZGVtYW5kIHdoZW4gd2UgcmVhY2gKPj4+Pj4+Pj4+Pj4+IHRo
aXMgY29ybmVyIGNhc2UsIGJ1dCB3aHkgdGhlIGxpbmtpbmcgPwo+Pj4+Pj4+Pj4+Pj4gU2hvdWxk
bid0IGRybV9wcmltZV9nZW1fZGVzdHJveSBiZSBnb29kIGVub3VnaCBwbGFjZSB0byBmcmVlID8K
Pj4+Pj4+Pj4+Pj4gSSB3YW50IHRvIGF2b2lkIGtlZXBpbmcgdGhlIHBhZ2UgaW4gdGhlIEdFTSBv
YmplY3QuCj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IFdoYXQgd2UgY2FuIGRvIGlzIHRvIGFsbG9j
YXRlIGEgcGFnZSBvbiBkZW1hbmQgZm9yIGVhY2ggZmF1bHQKPj4+Pj4+Pj4+Pj4gYW5kIGxpbmsK
Pj4+Pj4+Pj4+Pj4gdGhlIHRvZ2V0aGVyIGluIHRoZSBiZGV2IGluc3RlYWQuCj4+Pj4+Pj4+Pj4+
Cj4+Pj4+Pj4+Pj4+IEFuZCB3aGVuIHRoZSBiZGV2IGlzIHRoZW4gZmluYWxseSBkZXN0cm95ZWQg
YWZ0ZXIgdGhlIGxhc3QKPj4+Pj4+Pj4+Pj4gYXBwbGljYXRpb24KPj4+Pj4+Pj4+Pj4gY2xvc2Vk
IHdlIGNhbiBmaW5hbGx5IHJlbGVhc2UgYWxsIG9mIHRoZW0uCj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+
Pj4+IENocmlzdGlhbi4KPj4+Pj4+Pj4+PiBIZXksIHN0YXJ0ZWQgdG8gaW1wbGVtZW50IHRoaXMg
YW5kIHRoZW4gcmVhbGl6ZWQgdGhhdCBieQo+Pj4+Pj4+Pj4+IGFsbG9jYXRpbmcgYSBwYWdlCj4+
Pj4+Pj4+Pj4gZm9yIGVhY2ggZmF1bHQgaW5kaXNjcmltaW5hdGVseQo+Pj4+Pj4+Pj4+IHdlIHdp
bGwgYmUgYWxsb2NhdGluZyBhIG5ldyBwYWdlIGZvciBlYWNoIGZhdWx0aW5nIHZpcnR1YWwKPj4+
Pj4+Pj4+PiBhZGRyZXNzIHdpdGhpbiBhCj4+Pj4+Pj4+Pj4gVkEgcmFuZ2UgYmVsb25naW5nIHRo
ZSBzYW1lIEJPCj4+Pj4+Pj4+Pj4gYW5kIHRoaXMgaXMgb2J2aW91c2x5IHRvbyBtdWNoIGFuZCBu
b3QgdGhlIGludGVudGlvbi4gU2hvdWxkIEkKPj4+Pj4+Pj4+PiBpbnN0ZWFkIHVzZQo+Pj4+Pj4+
Pj4+IGxldCdzIHNheSBhIGhhc2h0YWJsZSB3aXRoIHRoZSBoYXNoCj4+Pj4+Pj4+Pj4ga2V5IGJl
aW5nIGZhdWx0aW5nIEJPIGFkZHJlc3MgdG8gYWN0dWFsbHkga2VlcCBhbGxvY2F0aW5nIGFuZAo+
Pj4+Pj4+Pj4+IHJldXNpbmcgc2FtZQo+Pj4+Pj4+Pj4+IGR1bW15IHplcm8gcGFnZSBwZXIgR0VN
IEJPCj4+Pj4+Pj4+Pj4gKG9yIGZvciB0aGF0IG1hdHRlciBEUk0gZmlsZSBvYmplY3QgYWRkcmVz
cyBmb3Igbm9uIGltcG9ydGVkCj4+Pj4+Pj4+Pj4gQk9zKSA/Cj4+Pj4+Pj4+PiBXaHkgZG8gd2Ug
bmVlZCBhIGhhc2h0YWJsZT8gQWxsIHRoZSBzdyBzdHJ1Y3R1cmVzIHRvIHRyYWNrIHRoaXMKPj4+
Pj4+Pj4+IHNob3VsZAo+Pj4+Pj4+Pj4gc3RpbGwgYmUgYXJvdW5kOgo+Pj4+Pj4+Pj4gLSBpZiBn
ZW1fYm8tPmRtYV9idWYgaXMgc2V0IHRoZSBidWZmZXIgaXMgY3VycmVudGx5IGV4cG9ydGVkIGFz
Cj4+Pj4+Pj4+PiBhIGRtYS1idWYsCj4+Pj4+Pj4+PiAgICAgIHNvIGRlZmVuc2l2ZWx5IGFsbG9j
YXRlIGEgcGVyLWJvIHBhZ2UKPj4+Pj4+Pj4+IC0gb3RoZXJ3aXNlIGFsbG9jYXRlIGEgcGVyLWZp
bGUgcGFnZQo+Pj4+Pj4+PiBUaGF0IGV4YWN0bHkgd2hhdCB3ZSBoYXZlIGluIGN1cnJlbnQgaW1w
bGVtZW50YXRpb24KPj4+Pj4+Pj4KPj4+Pj4+Pj4KPj4+Pj4+Pj4+IE9yIGlzIHRoZSBpZGVhIHRv
IHNhdmUgdGhlIHN0cnVjdCBwYWdlICogcG9pbnRlcj8gVGhhdCBmZWVscyBhCj4+Pj4+Pj4+PiBi
aXQgbGlrZQo+Pj4+Pj4+Pj4gb3Zlci1vcHRpbWl6aW5nIHN0dWZmLiBCZXR0ZXIgdG8gaGF2ZSBh
IHNpbXBsZSBpbXBsZW1lbnRhdGlvbgo+Pj4+Pj4+Pj4gZmlyc3QgYW5kCj4+Pj4+Pj4+PiB0aGVu
IHR1bmUgaXQgaWYgKGFuZCBvbmx5IGlmKSBhbnkgcGFydCBvZiBpdCBiZWNvbWVzIGEgcHJvYmxl
bQo+Pj4+Pj4+Pj4gZm9yIG5vcm1hbAo+Pj4+Pj4+Pj4gdXNhZ2UuCj4+Pj4+Pj4+IEV4YWN0bHkg
LSB0aGUgaWRlYSBpcyB0byBhdm9pZCBhZGRpbmcgZXh0cmEgcG9pbnRlciB0bwo+Pj4+Pj4+PiBk
cm1fZ2VtX29iamVjdCwKPj4+Pj4+Pj4gQ2hyaXN0aWFuIHN1Z2dlc3RlZCB0byBpbnN0ZWFkIGtl
ZXAgYSBsaW5rZWQgbGlzdCBvZiBkdW1teSBwYWdlcwo+Pj4+Pj4+PiB0byBiZQo+Pj4+Pj4+PiBh
bGxvY2F0ZWQgb24gZGVtYW5kIG9uY2Ugd2UgaGl0IGEgdm1fZmF1bHQuIEkgd2lsbCB0aGVuIGFs
c28KPj4+Pj4+Pj4gcHJlZmF1bHQgdGhlIGVudGlyZQo+Pj4+Pj4+PiBWQSByYW5nZSBmcm9tIHZt
YS0+dm1fZW5kIC0gdm1hLT52bV9zdGFydCB0byB2bWEtPnZtX2VuZCBhbmQgbWFwCj4+Pj4+Pj4+
IHRoZW0KPj4+Pj4+Pj4gdG8gdGhhdCBzaW5nbGUgZHVtbXkgcGFnZS4KPj4+Pj4+PiBUaGlzIHN0
cm9uZ2x5IGZlZWxzIGxpa2UgcHJlbWF0dXJlIG9wdGltaXphdGlvbi4gSWYgeW91J3JlIHdvcnJp
ZWQKPj4+Pj4+PiBhYm91dAo+Pj4+Pj4+IHRoZSBvdmVyaGVhZCBvbiBhbWRncHUsIHBheSBkb3du
IHRoZSBkZWJ0IGJ5IHJlbW92aW5nIG9uZSBvZiB0aGUKPj4+Pj4+PiByZWR1bmRhbnQKPj4+Pj4+
PiBwb2ludGVycyBiZXR3ZWVuIGdlbSBhbmQgdHRtIGJvIHN0cnVjdHMgKEkgdGhpbmsgd2Ugc3Rp
bGwgaGF2ZQo+Pj4+Pj4+IHNvbWUpIDotKQo+Pj4+Pj4+Cj4+Pj4+Pj4gVW50aWwgd2UndmUgbnVr
ZWQgdGhlc2UgZWFzeSZvYnZpb3VzIG9uZXMgd2Ugc2hvdWxkbid0IHBsYXkgImF2b2lkIDEKPj4+
Pj4+PiBwb2ludGVyIGp1c3QgYmVjYXVzZSIgZ2FtZXMgd2l0aCBoYXNodGFibGVzLgo+Pj4+Pj4+
IC1EYW5pZWwKPj4+Pj4+Cj4+Pj4+PiBXZWxsLCBpZiB5b3UgYW5kIENocmlzdGlhbiBjYW4gYWdy
ZWUgb24gdGhpcyBhcHByb2FjaCBhbmQgc3VnZ2VzdAo+Pj4+Pj4gbWF5YmUgd2hhdCBwb2ludGVy
IGlzCj4+Pj4+PiByZWR1bmRhbnQgYW5kIGNhbiBiZSByZW1vdmVkIGZyb20gR0VNIHN0cnVjdCBz
byB3ZSBjYW4gdXNlIHRoZQo+Pj4+Pj4gJ2NyZWRpdCcgdG8gYWRkIHRoZSBkdW1teSBwYWdlCj4+
Pj4+PiB0byBHRU0gSSB3aWxsIGJlIGhhcHB5IHRvIGZvbGxvdyB0aHJvdWdoLgo+Pj4+Pj4KPj4+
Pj4+IFAuUyBIYXNoIHRhYmxlIGlzIG9mZiB0aGUgdGFibGUgYW55d2F5IGFuZCB3ZSBhcmUgdGFs
a2luZyBvbmx5Cj4+Pj4+PiBhYm91dCBsaW5rZWQgbGlzdCBoZXJlIHNpbmNlIGJ5IHByZWZhdWx0
aW5nCj4+Pj4+PiB0aGUgZW50aXJlIFZBIHJhbmdlIGZvciBhIHZtZi0+dm1hIGkgd2lsbCBiZSBh
dm9pZGluZyByZWR1bmRhbnQKPj4+Pj4+IHBhZ2UgZmF1bHRzIHRvIHNhbWUgVk1BIFZBIHJhbmdl
IGFuZCBzbwo+Pj4+Pj4gZG9uJ3QgbmVlZCB0byBzZWFyY2ggYW5kIHJldXNlIGFuIGV4aXN0aW5n
IGR1bW15IHBhZ2UgYnV0IHNpbXBseQo+Pj4+Pj4gY3JlYXRlIGEgbmV3IG9uZSBmb3IgZWFjaCBu
ZXh0IGZhdWx0Lgo+Pj4+Pj4KPj4+Pj4+IEFuZHJleQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
