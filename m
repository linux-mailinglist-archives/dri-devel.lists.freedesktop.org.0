Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9342EF435
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 15:52:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B44A16E822;
	Fri,  8 Jan 2021 14:52:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C786E418;
 Fri,  8 Jan 2021 14:52:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EtBTMBCFR31EgQ0a3Hty4Eak3PYz9YKrCJk8sn59G08n/cYwa2JkCoVPdJqhIJnVUCBMu9HY2mz+ikboU23COYDeuBntnWndijMuRXOWcWan+EF5XasVx6ZJJA4SdndtGs9u82NF3QSpHFexPu4eW2xhCnmuFu6F08o6ElDQegKdVPRUhNNWsf+jYSabHdDtUkubyTrD/bGLzM/KgOCwgbxauMLAthcojgvXjHmyC/vhVS4AGgkju3cHh31eRjBE8mWMDQfAGODA1AtHpM7i0+SZLaDgNjz9uJWmkSzsnUIqZTYewm5+c0f4rRXt+wPupX3a6wVFuRSpqmLShVfr+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0xpFPbozzlV04IWDlwruRn1E7fwWETze970dk/NAFSo=;
 b=eRo5RYZGrXNFwzoPCV7cHvAJnd44aBX0dHZryuZHaO8IP6sOKTnbX0SomDyqCsjimaqoPkrKFKShsHc9s1te6dPBsJJMQvg4x4zmOa+uDco3oJ81kKhJSF3cp/lm9TeZSFwR3dXxaRokLgtjSbCYqQWxuqe7B4LXAMEETXClasfqfWJrZY1cOyWxEmmsTwbixH+4cxP74q71dnoCRpm9Y3eWuCBqJbqsZ1r7Q4lWJbPOzpE0zHQgP2hxXjWWBfQh0k8+TYrpZM1QMJ3PK+8X42cxKNWNwZ/aTVP65j6Q77/eUH3Y8SIqTtSmSywr+lN+rucE7SXAYQBz1cm9v6xcOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0xpFPbozzlV04IWDlwruRn1E7fwWETze970dk/NAFSo=;
 b=lMr8ds5JRG26QcsSgs+HUocoVSB7FwsxPfbKW1p5pm8OraTN4mZ9SLH0X2bc/YlToXxJhOJxwMSYh56dPZrXjBdEzYByYNyXaR438DAxQf9/g4v+bVdwc6+a2A7iTnEWJC6F3qPiRKUHktPDYnnrAJFdxNVXB/TIfBjgy/mjoVE=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4520.namprd12.prod.outlook.com (2603:10b6:208:26f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 14:52:43 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3742.006; Fri, 8 Jan 2021
 14:52:43 +0000
Subject: Re: [PATCH v3 01/12] drm: Add dummy page per device or GEM object
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
 <1605936082-3099-2-git-send-email-andrey.grodzovsky@amd.com>
 <a510b5c7-1898-f101-1cfd-a037e8fa445d@gmail.com>
 <e6bbd5fa-29b7-c74a-ea70-3979b573901b@amd.com>
 <5a61f76a-0b40-941f-8028-37202f296e74@gmail.com>
 <f374aaa4-4a30-e60c-cd4b-d463443c1137@amd.com>
 <X/c1IXX11chjHyl4@phenom.ffwll.local>
 <75c8a6f3-1e71-3242-6576-c0e661d6a62f@amd.com>
 <X/c3PKL70HXBt3Jk@phenom.ffwll.local>
 <589ece1f-2718-87ab-ec07-4044c3df1c58@amd.com>
 <a140ca34-9cfc-9c2f-39e2-1af156faabfe@amd.com>
 <b73319b2-1723-6650-8d03-d8f775119e53@amd.com>
 <29ef0c97-ac1b-a8e6-ee57-16727ff1803e@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <62645d03-704f-571e-bfe6-7d992b010a08@amd.com>
Date: Fri, 8 Jan 2021 15:52:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <29ef0c97-ac1b-a8e6-ee57-16727ff1803e@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR03CA0089.eurprd03.prod.outlook.com
 (2603:10a6:208:69::30) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR03CA0089.eurprd03.prod.outlook.com (2603:10a6:208:69::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 14:52:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 94c4f0f6-45cc-4158-2fb6-08d8b3e50e26
X-MS-TrafficTypeDiagnostic: MN2PR12MB4520:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4520BC14B26DE5A48501B77E83AE0@MN2PR12MB4520.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:580;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VjHRXDplgqhZUcGZZlbEP6vMYdEWA2fFGNIY913ykXVRUHzQUFCdFKfHLtSiLN0Ga7JPZCL0rehqmdoxTjwXsPS4NvIwlZj5LYPNveVaVleF5505SFRwthxQH/04AxC8/U3BRqjPmO9CJYml4KIHD2oDY3lALtxEeXteloSjCxtas197GZzZHc9wO7KnGH3/ZJhKt88pssySi2jFBnR6IDni/Hv95yTIUTU1h7865jkXsXsFBSgdAEjHBREWDbmOabcTII2ZY1V3uMm+G1SCH1dKOl+roGQkHPGt9dnpV9VYA+2kPa8Z0cCghbpbJngFwMQmi/RQS4QWm3FGRj3dsPqc+kC2VoZoj0Tab2WqnROUjA/u7tztXYBZM+GsblPRLYDqxsqli3d9pCguzCk/7ehMSyHdAT42idTtD3DFdgpWT6e6kw5koCOyZyZlewYe68C8VrZtgS6F34BkmKsk76pFMQi3Hyo96sTBTwgIK8Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(8676002)(52116002)(110136005)(8936002)(316002)(53546011)(6666004)(66476007)(6486002)(66946007)(36756003)(4326008)(5660300002)(66556008)(2906002)(7416002)(16526019)(186003)(2616005)(86362001)(31696002)(83380400001)(478600001)(66574015)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aEtwZlZkZGNPcER6dng4SmRTeDBqMy9FblVFZENpUTFlQ2h2bUFJQWkvYWwr?=
 =?utf-8?B?ZG00Yis1bGpGWGRQUy96dmEvaFZtdGZ1Qm1sRDdKeWpHVkJSUnRrOFZ3ekpa?=
 =?utf-8?B?RzgyV0x1Z0QwUksvc2JZZjRVSmVqZWhVL2hPTENRYXMrUFRHSGJaK2lNUnBP?=
 =?utf-8?B?emFjY3JrTDRldTEzbEJGcUFNdEVYWUpHODZFRFcxRFIyb2ZGUVFHTW52akpS?=
 =?utf-8?B?d2k4ODZiMVhZeUZFdUNuckRBVmRFdU1aUHdTRDY4YjZaQkZqTlU0aVA5VTNs?=
 =?utf-8?B?L1ZsTG51TlRBMnY5L1VnVkZ3anJpTi8ycTdXZW4zTWtxaUhDOXEvZGxHbExz?=
 =?utf-8?B?Q3dOeUxoWnd5Mm1FRVV1RGZOR1JaYTdQQkdjSm9BT3oyZUNtU0Z4ZWkyd1I3?=
 =?utf-8?B?aTdFVnZRUmNxN2RTRTZ0Q1dPb0ZFMGgvQy9acG41VkVMcDJWTm14Zm1PUldH?=
 =?utf-8?B?aXJBUzJBNFl0R2RoZjFpdGlkSU9ZZUFiRGtqQTArcHpkMkd6OW5QMlU5RFJl?=
 =?utf-8?B?U0ZWVFk4cW80eEd1dG9Hdi9oWk1LY09sRFRibUJrWFVPTFhnOHA3TVZ1a3Fw?=
 =?utf-8?B?SUEvYnBUYklVd01RMzA4SWQ3TC8rcFBKOERqemRRSXZONWRLbXBEZHN2VHNk?=
 =?utf-8?B?OWJmaXdCZzhyclhMZUhKbFlBUjJlMGNhWHdtQjBVRElOZ0VaS05VZTZjZkpB?=
 =?utf-8?B?ZVB0RjhBTlI5eGF5b3kzRllkWHNpV0VVN0Z4bzhBNUpTY25CT2RyQjJ2MDdX?=
 =?utf-8?B?a24zNjFxSTErVG1NdWt1QXAza2hkdTRnZjFNUTBVZGNpbXh2OURXZDh3amVH?=
 =?utf-8?B?ZkZIUWk1VlhGenU5VEFFbWd0RnRMbks3ZHA1ZVJ6WFVoSGc3WFA5NzVKTGI3?=
 =?utf-8?B?Z1krQ1djdDVFNUswRmVVRVNoOHZYYWg5YVptMDVBOUZEVlVoOEMrSVZNeTN2?=
 =?utf-8?B?bXlISzRMN2NOUmdxeUg0U3R6K0pNUEhRYWhNUVBEc0ltdFAvQy9mT0pLY282?=
 =?utf-8?B?SmxsNW8rMXZxVHdXT2J4UFZUNWdKUGFYMEQ5RzVVT1o3U2NZS3Q5T3JxZllR?=
 =?utf-8?B?UDZWOGpRQXZ4d2QvbEVrMDFBSlV5VW5Sa1VhL284S3dlT0o3TmIvK211YW1T?=
 =?utf-8?B?L2hNTUhRdkdIaEVORHJYRnhBVGYxMlZ3dk80NTdVekFBd2NCcndSUERiczM0?=
 =?utf-8?B?OG1FTW10V2l5RC9vRzZXUW9mei85UnE2VGF0ODN1L251TVNoVUthenl5SVBE?=
 =?utf-8?B?QjBRVktsb2hTQVRwbHVhVXZMdm91U2FxNHlSSys2d0FmTEV2RWk3ekU1eGJl?=
 =?utf-8?B?ckFkWklWdVFFZTlDQmxtMEE2WEJ5bzM3RnBNS05MWWNId0tUMzBzM0JyZkQw?=
 =?utf-8?B?ZWpDR1lPSUhFaXhSN2NZVVpub1RUTFdQN3JsbkR6OHNCZjBvOENka3E0VEUr?=
 =?utf-8?Q?xQx4l3Ef?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 14:52:43.7922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 94c4f0f6-45cc-4158-2fb6-08d8b3e50e26
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uou6ZqGObjqwch9eGJO/dDo5iyFcCgaIQiC52j6KLNbj206Yzn5/fquRPuZ8Wejk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4520
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
Cc: amd-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, yuq825@gmail.com, gregkh@linuxfoundation.org,
 Alexander.Deucher@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TWhtLCBJJ20gbm90IGF3YXJlIG9mIGFueSBsZXQgb3ZlciBwb2ludGVyIGJldHdlZW4gVFRNIGFu
ZCBHRU0gYW5kIHdlIAp3b3JrZWQgcXVpdGUgaGFyZCBvbiByZWR1Y2luZyB0aGUgc2l6ZSBvZiB0
aGUgYW1kZ3B1X2JvLCBzbyBhbm90aGVyIApleHRyYSBwb2ludGVyIGp1c3QgZm9yIHRoYXQgY29y
bmVyIGNhc2Ugd291bGQgc3VjayBxdWl0ZSBhIGJpdC4KCkNocmlzdGlhbi4KCkFtIDA4LjAxLjIx
IHVtIDE1OjQ2IHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4gRGFuaWVsIGhhZCBzb21lIG9i
amVjdGlvbnMgdG8gdGhpcyAoc2VlIGJlbGxvdykgYW5kIHNvIEkgZ3Vlc3MgSSBuZWVkIAo+IHlv
dSBib3RoIHRvIGFncmVlIG9uIHRoZSBhcHByb2FjaCBiZWZvcmUgSSBwcm9jZWVkLgo+Cj4gQW5k
cmV5Cj4KPiBPbiAxLzgvMjEgOTozMyBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4gQW0g
MDguMDEuMjEgdW0gMTU6MjYgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4+IEhleSBDaHJp
c3RpYW4sIGp1c3QgYSBwaW5nLgo+Pgo+PiBXYXMgdGhlcmUgYW55IHF1ZXN0aW9uIGZvciBtZSBo
ZXJlPwo+Pgo+PiBBcyBmYXIgYXMgSSBjYW4gc2VlIHRoZSBiZXN0IGFwcHJvYWNoIHdvdWxkIHN0
aWxsIGJlIHRvIGZpbGwgdGhlIFZNQSAKPj4gd2l0aCBhIHNpbmdsZSBkdW1teSBwYWdlIGFuZCBh
dm9pZCBwb2ludGVycyBpbiB0aGUgR0VNIG9iamVjdC4KPj4KPj4gQ2hyaXN0aWFuLgo+Pgo+Pj4K
Pj4+IEFuZHJleQo+Pj4KPj4+IE9uIDEvNy8yMSAxMTozNyBBTSwgQW5kcmV5IEdyb2R6b3Zza3kg
d3JvdGU6Cj4+Pj4KPj4+PiBPbiAxLzcvMjEgMTE6MzAgQU0sIERhbmllbCBWZXR0ZXIgd3JvdGU6
Cj4+Pj4+IE9uIFRodSwgSmFuIDA3LCAyMDIxIGF0IDExOjI2OjUyQU0gLTA1MDAsIEFuZHJleSBH
cm9kem92c2t5IHdyb3RlOgo+Pj4+Pj4gT24gMS83LzIxIDExOjIxIEFNLCBEYW5pZWwgVmV0dGVy
IHdyb3RlOgo+Pj4+Pj4+IE9uIFR1ZSwgSmFuIDA1LCAyMDIxIGF0IDA0OjA0OjE2UE0gLTA1MDAs
IEFuZHJleSBHcm9kem92c2t5IHdyb3RlOgo+Pj4+Pj4+PiBPbiAxMS8yMy8yMCAzOjAxIEFNLCBD
aHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+Pj4+Pj4gQW0gMjMuMTEuMjAgdW0gMDU6NTQgc2No
cmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4+Pj4+Pj4+PiBPbiAxMS8yMS8yMCA5OjE1IEFNLCBD
aHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+Pj4+Pj4+PiBBbSAyMS4xMS4yMCB1bSAwNjoyMSBz
Y2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pj4+Pj4+Pj4+Pj4gV2lsbCBiZSB1c2VkIHRvIHJl
cm91dGUgQ1BVIG1hcHBlZCBCTydzIHBhZ2UgZmF1bHRzIG9uY2UKPj4+Pj4+Pj4+Pj4+IGRldmlj
ZSBpcyByZW1vdmVkLgo+Pj4+Pj4+Pj4+PiBVZmYsIG9uZSBwYWdlIGZvciBlYWNoIGV4cG9ydGVk
IERNQS1idWY/IFRoYXQncyBub3QgCj4+Pj4+Pj4+Pj4+IHNvbWV0aGluZyB3ZSBjYW4gZG8uCj4+
Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IFdlIG5lZWQgdG8gZmluZCBhIGRpZmZlcmVudCBhcHByb2Fj
aCBoZXJlLgo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiBDYW4ndCB3ZSBjYWxsIGFsbG9jX3BhZ2Uo
KSBvbiBlYWNoIGZhdWx0IGFuZCBsaW5rIHRoZW0gdG9nZXRoZXIKPj4+Pj4+Pj4+Pj4gc28gdGhl
eSBhcmUgZnJlZWQgd2hlbiB0aGUgZGV2aWNlIGlzIGZpbmFsbHkgcmVhcGVkPwo+Pj4+Pj4+Pj4+
IEZvciBzdXJlIGJldHRlciB0byBvcHRpbWl6ZSBhbmQgYWxsb2NhdGUgb24gZGVtYW5kIHdoZW4g
d2UgcmVhY2gKPj4+Pj4+Pj4+PiB0aGlzIGNvcm5lciBjYXNlLCBidXQgd2h5IHRoZSBsaW5raW5n
ID8KPj4+Pj4+Pj4+PiBTaG91bGRuJ3QgZHJtX3ByaW1lX2dlbV9kZXN0cm95IGJlIGdvb2QgZW5v
dWdoIHBsYWNlIHRvIGZyZWUgPwo+Pj4+Pj4+Pj4gSSB3YW50IHRvIGF2b2lkIGtlZXBpbmcgdGhl
IHBhZ2UgaW4gdGhlIEdFTSBvYmplY3QuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gV2hhdCB3ZSBjYW4g
ZG8gaXMgdG8gYWxsb2NhdGUgYSBwYWdlIG9uIGRlbWFuZCBmb3IgZWFjaCBmYXVsdCAKPj4+Pj4+
Pj4+IGFuZCBsaW5rCj4+Pj4+Pj4+PiB0aGUgdG9nZXRoZXIgaW4gdGhlIGJkZXYgaW5zdGVhZC4K
Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBBbmQgd2hlbiB0aGUgYmRldiBpcyB0aGVuIGZpbmFsbHkgZGVz
dHJveWVkIGFmdGVyIHRoZSBsYXN0IAo+Pj4+Pj4+Pj4gYXBwbGljYXRpb24KPj4+Pj4+Pj4+IGNs
b3NlZCB3ZSBjYW4gZmluYWxseSByZWxlYXNlIGFsbCBvZiB0aGVtLgo+Pj4+Pj4+Pj4KPj4+Pj4+
Pj4+IENocmlzdGlhbi4KPj4+Pj4+Pj4gSGV5LCBzdGFydGVkIHRvIGltcGxlbWVudCB0aGlzIGFu
ZCB0aGVuIHJlYWxpemVkIHRoYXQgYnkgCj4+Pj4+Pj4+IGFsbG9jYXRpbmcgYSBwYWdlCj4+Pj4+
Pj4+IGZvciBlYWNoIGZhdWx0IGluZGlzY3JpbWluYXRlbHkKPj4+Pj4+Pj4gd2Ugd2lsbCBiZSBh
bGxvY2F0aW5nIGEgbmV3IHBhZ2UgZm9yIGVhY2ggZmF1bHRpbmcgdmlydHVhbCAKPj4+Pj4+Pj4g
YWRkcmVzcyB3aXRoaW4gYQo+Pj4+Pj4+PiBWQSByYW5nZSBiZWxvbmdpbmcgdGhlIHNhbWUgQk8K
Pj4+Pj4+Pj4gYW5kIHRoaXMgaXMgb2J2aW91c2x5IHRvbyBtdWNoIGFuZCBub3QgdGhlIGludGVu
dGlvbi4gU2hvdWxkIEkgCj4+Pj4+Pj4+IGluc3RlYWQgdXNlCj4+Pj4+Pj4+IGxldCdzIHNheSBh
IGhhc2h0YWJsZSB3aXRoIHRoZSBoYXNoCj4+Pj4+Pj4+IGtleSBiZWluZyBmYXVsdGluZyBCTyBh
ZGRyZXNzIHRvIGFjdHVhbGx5IGtlZXAgYWxsb2NhdGluZyBhbmQgCj4+Pj4+Pj4+IHJldXNpbmcg
c2FtZQo+Pj4+Pj4+PiBkdW1teSB6ZXJvIHBhZ2UgcGVyIEdFTSBCTwo+Pj4+Pj4+PiAob3IgZm9y
IHRoYXQgbWF0dGVyIERSTSBmaWxlIG9iamVjdCBhZGRyZXNzIGZvciBub24gaW1wb3J0ZWQgCj4+
Pj4+Pj4+IEJPcykgPwo+Pj4+Pj4+IFdoeSBkbyB3ZSBuZWVkIGEgaGFzaHRhYmxlPyBBbGwgdGhl
IHN3IHN0cnVjdHVyZXMgdG8gdHJhY2sgdGhpcyAKPj4+Pj4+PiBzaG91bGQKPj4+Pj4+PiBzdGls
bCBiZSBhcm91bmQ6Cj4+Pj4+Pj4gLSBpZiBnZW1fYm8tPmRtYV9idWYgaXMgc2V0IHRoZSBidWZm
ZXIgaXMgY3VycmVudGx5IGV4cG9ydGVkIGFzIAo+Pj4+Pj4+IGEgZG1hLWJ1ZiwKPj4+Pj4+PiDC
oMKgwqAgc28gZGVmZW5zaXZlbHkgYWxsb2NhdGUgYSBwZXItYm8gcGFnZQo+Pj4+Pj4+IC0gb3Ro
ZXJ3aXNlIGFsbG9jYXRlIGEgcGVyLWZpbGUgcGFnZQo+Pj4+Pj4KPj4+Pj4+IFRoYXQgZXhhY3Rs
eSB3aGF0IHdlIGhhdmUgaW4gY3VycmVudCBpbXBsZW1lbnRhdGlvbgo+Pj4+Pj4KPj4+Pj4+Cj4+
Pj4+Pj4gT3IgaXMgdGhlIGlkZWEgdG8gc2F2ZSB0aGUgc3RydWN0IHBhZ2UgKiBwb2ludGVyPyBU
aGF0IGZlZWxzIGEgCj4+Pj4+Pj4gYml0IGxpa2UKPj4+Pj4+PiBvdmVyLW9wdGltaXppbmcgc3R1
ZmYuIEJldHRlciB0byBoYXZlIGEgc2ltcGxlIGltcGxlbWVudGF0aW9uIAo+Pj4+Pj4+IGZpcnN0
IGFuZAo+Pj4+Pj4+IHRoZW4gdHVuZSBpdCBpZiAoYW5kIG9ubHkgaWYpIGFueSBwYXJ0IG9mIGl0
IGJlY29tZXMgYSBwcm9ibGVtIAo+Pj4+Pj4+IGZvciBub3JtYWwKPj4+Pj4+PiB1c2FnZS4KPj4+
Pj4+Cj4+Pj4+PiBFeGFjdGx5IC0gdGhlIGlkZWEgaXMgdG8gYXZvaWQgYWRkaW5nIGV4dHJhIHBv
aW50ZXIgdG8gCj4+Pj4+PiBkcm1fZ2VtX29iamVjdCwKPj4+Pj4+IENocmlzdGlhbiBzdWdnZXN0
ZWQgdG8gaW5zdGVhZCBrZWVwIGEgbGlua2VkIGxpc3Qgb2YgZHVtbXkgcGFnZXMgCj4+Pj4+PiB0
byBiZQo+Pj4+Pj4gYWxsb2NhdGVkIG9uIGRlbWFuZCBvbmNlIHdlIGhpdCBhIHZtX2ZhdWx0LiBJ
IHdpbGwgdGhlbiBhbHNvIAo+Pj4+Pj4gcHJlZmF1bHQgdGhlIGVudGlyZQo+Pj4+Pj4gVkEgcmFu
Z2UgZnJvbSB2bWEtPnZtX2VuZCAtIHZtYS0+dm1fc3RhcnQgdG8gdm1hLT52bV9lbmQgYW5kIG1h
cCAKPj4+Pj4+IHRoZW0KPj4+Pj4+IHRvIHRoYXQgc2luZ2xlIGR1bW15IHBhZ2UuCj4+Pj4+IFRo
aXMgc3Ryb25nbHkgZmVlbHMgbGlrZSBwcmVtYXR1cmUgb3B0aW1pemF0aW9uLiBJZiB5b3UncmUg
d29ycmllZCAKPj4+Pj4gYWJvdXQKPj4+Pj4gdGhlIG92ZXJoZWFkIG9uIGFtZGdwdSwgcGF5IGRv
d24gdGhlIGRlYnQgYnkgcmVtb3Zpbmcgb25lIG9mIHRoZSAKPj4+Pj4gcmVkdW5kYW50Cj4+Pj4+
IHBvaW50ZXJzIGJldHdlZW4gZ2VtIGFuZCB0dG0gYm8gc3RydWN0cyAoSSB0aGluayB3ZSBzdGls
bCBoYXZlIAo+Pj4+PiBzb21lKSA6LSkKPj4+Pj4KPj4+Pj4gVW50aWwgd2UndmUgbnVrZWQgdGhl
c2UgZWFzeSZvYnZpb3VzIG9uZXMgd2Ugc2hvdWxkbid0IHBsYXkgImF2b2lkIDEKPj4+Pj4gcG9p
bnRlciBqdXN0IGJlY2F1c2UiIGdhbWVzIHdpdGggaGFzaHRhYmxlcy4KPj4+Pj4gLURhbmllbAo+
Pj4+Cj4+Pj4KPj4+PiBXZWxsLCBpZiB5b3UgYW5kIENocmlzdGlhbiBjYW4gYWdyZWUgb24gdGhp
cyBhcHByb2FjaCBhbmQgc3VnZ2VzdCAKPj4+PiBtYXliZSB3aGF0IHBvaW50ZXIgaXMKPj4+PiBy
ZWR1bmRhbnQgYW5kIGNhbiBiZSByZW1vdmVkIGZyb20gR0VNIHN0cnVjdCBzbyB3ZSBjYW4gdXNl
IHRoZSAKPj4+PiAnY3JlZGl0JyB0byBhZGQgdGhlIGR1bW15IHBhZ2UKPj4+PiB0byBHRU0gSSB3
aWxsIGJlIGhhcHB5IHRvIGZvbGxvdyB0aHJvdWdoLgo+Pj4+Cj4+Pj4gUC5TIEhhc2ggdGFibGUg
aXMgb2ZmIHRoZSB0YWJsZSBhbnl3YXkgYW5kIHdlIGFyZSB0YWxraW5nIG9ubHkgCj4+Pj4gYWJv
dXQgbGlua2VkIGxpc3QgaGVyZSBzaW5jZSBieSBwcmVmYXVsdGluZwo+Pj4+IHRoZSBlbnRpcmUg
VkEgcmFuZ2UgZm9yIGEgdm1mLT52bWEgaSB3aWxsIGJlIGF2b2lkaW5nIHJlZHVuZGFudCAKPj4+
PiBwYWdlIGZhdWx0cyB0byBzYW1lIFZNQSBWQSByYW5nZSBhbmQgc28KPj4+PiBkb24ndCBuZWVk
IHRvIHNlYXJjaCBhbmQgcmV1c2UgYW4gZXhpc3RpbmcgZHVtbXkgcGFnZSBidXQgc2ltcGx5IAo+
Pj4+IGNyZWF0ZSBhIG5ldyBvbmUgZm9yIGVhY2ggbmV4dCBmYXVsdC4KPj4+Pgo+Pj4+IEFuZHJl
eQo+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
