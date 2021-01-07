Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 109032ED43D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 17:27:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B506E4B5;
	Thu,  7 Jan 2021 16:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F7306E4B0;
 Thu,  7 Jan 2021 16:26:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bfrvPEX1ndrBBg02CNE+maC4MZgqZk45LDHRYDO66tmWhBV9OWoYDcKLKQvcazxXrqo3Bggp2N946suneT7hKQXSjig6IrkZItH69BBmhrg69O5AUMn3luXEO2Z2AiKSlElmaxeKr/8cF+byhVDDVysojVDq5ZgunLfOoCgcP1GaUHQL7JqL/6MkbaoytTjaetuJL1sGYTz5cdN2Xftkf8IwGHRw0ZBI/33o4ZtjKH+dOg1uFSubQkdE+hPz/xAxundjvYng0wMF8Z55YQARGidQOodtxvghIEC/jJN1oKKqys1npkz1VPZhesJIasEwgWu27tR+BxAUzAgMwZqNoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h0m1c/cPIBMwYtnieCXPjmL6KQfh0fS4s5gVIDl7BSs=;
 b=k7XerOPve6R2Am8/+QL0mieb5PmrI3jw4wzKTtzIVtuTFVvZuINHX/ZR7N8z0quVBFq7zK+j6I7YyDUE6+eDL1WAh3tqhmUgETKUp4hX4OJa4pXzlFv+8erdiUwaxGI6YvA0RuteA8L+T9PAo4pRhDZ4h7G0DDiPqgXADP7fsD+KVihqDpTa/cL2vpZJZsv/85vj9zAJ2os0QYY1tIDZ1NeoLDejjfUarK60ojRbFQjLRmYdPymAH17N+jeUrfMAz8RTUbTzxbxIoWIa7BMRwTew66DG6OmoN+82mwcIzD1MkY7d78NH1lWjTqBH19VcoLD+3BWhApBxsO1mHe7+Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h0m1c/cPIBMwYtnieCXPjmL6KQfh0fS4s5gVIDl7BSs=;
 b=kyEk/69YM9qvk4vDIFMwEz/oKR6NFysNvFNpX/fyTrzUUGq7Q2K2KYEsDP4JdmzIJPvctFOjYaSRo3gUR2QPAoOxZC5ucKJPjZNCUbJ6P0ihhkr6mHt1odKa7KDqaHO3eX4O7sb6hlwh8i1x3tKqAFanXK1YmWuDjjqwhcqeToQ=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN1PR12MB2494.namprd12.prod.outlook.com (2603:10b6:802:29::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 16:26:57 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::6d32:940b:f630:b37d]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::6d32:940b:f630:b37d%4]) with mapi id 15.20.3721.024; Thu, 7 Jan 2021
 16:26:57 +0000
Subject: Re: [PATCH v3 01/12] drm: Add dummy page per device or GEM object
To: Daniel Vetter <daniel@ffwll.ch>
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
 <1605936082-3099-2-git-send-email-andrey.grodzovsky@amd.com>
 <a510b5c7-1898-f101-1cfd-a037e8fa445d@gmail.com>
 <e6bbd5fa-29b7-c74a-ea70-3979b573901b@amd.com>
 <5a61f76a-0b40-941f-8028-37202f296e74@gmail.com>
 <f374aaa4-4a30-e60c-cd4b-d463443c1137@amd.com>
 <X/c1IXX11chjHyl4@phenom.ffwll.local>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <75c8a6f3-1e71-3242-6576-c0e661d6a62f@amd.com>
Date: Thu, 7 Jan 2021 11:26:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <X/c1IXX11chjHyl4@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:3021:14a5:28d4:9466]
X-ClientProxiedBy: BN6PR16CA0027.namprd16.prod.outlook.com
 (2603:10b6:405:14::13) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:3021:14a5:28d4:9466]
 (2607:fea8:3edf:49b0:3021:14a5:28d4:9466) by
 BN6PR16CA0027.namprd16.prod.outlook.com (2603:10b6:405:14::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 16:26:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d188c26c-e7f7-484b-5638-08d8b3290d51
X-MS-TrafficTypeDiagnostic: SN1PR12MB2494:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB2494C02D30614558A2F54148EAAF0@SN1PR12MB2494.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AZXe3ms8kM5bfxDBw7Fx1YIAGcrq+WuvO2g04AAgP7rFa7W42w75ZFwyAss07mg5hHhtOBZN40cUo8Ww+iplAA7dV8rqChN5KmwQg9hufeC04iti+LnJ6pNK+ANKo83lIvbJeqVscLxjD/aniQ3E9rmwQ50L/j1bDe3ApUcsDOdd5YVAOU79tG+JX5vjLXUcDRTDG5DyWUlK4pBW+0h5zpCnzSJ884LRVTG7EQG2J0ga1T/ZuAM8w6zzCxDFPI19QhmDnEN4SpO22bKChGK7pV+IZjZCC4pm3xFnsnZ8qkU/wD54hIXBJO9Nkl4bVVKm4cYNbh53uIDqmWEqBZwhcOMkXxytcDGlA8hDLJvXwXxaEfn19dZayUal7dBEpDrQ9WcMngkF8Jpk20Z+3H7xhEO5WjaFA+X99kl413LwbaSaVz0+3JcA4HMn1j2XcEJcP1WLHL2SCjovSfu1SiGMVBf5UXFrTdaZGj1/xpOP3vZUIGkSX/TOk9GClN7EcQtoFwgIqRhvFo6tTlpU1lnMVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(136003)(39860400002)(346002)(396003)(36756003)(5660300002)(52116002)(8676002)(6486002)(4326008)(8936002)(31686004)(6916009)(2906002)(53546011)(31696002)(966005)(83380400001)(478600001)(316002)(6666004)(66946007)(66574015)(45080400002)(186003)(7416002)(2616005)(66556008)(16526019)(66476007)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NVBoWGJIb1l6TlJRZFRRZFdBenZhQ1Rlc1B1cVFGUllnd09qTDBnSnRaUFBH?=
 =?utf-8?B?VHlGZ1VLK2R2VHFaV1A5d1V1VEJMNVR3aFQxYmtySTl4SjQ4dUZ4R0l4emVo?=
 =?utf-8?B?ZmhSRGpMZ2ZFaUVmSVJBZmRXN0JaVmd4bWdBeXFvWTFnZGVuc0xsbXFwT1RC?=
 =?utf-8?B?MlJEZHQyTXRUbTdGTFI4WmJ6dFRmSU5JVzhyR1VvVGZPODRBWld1S1AzSGtF?=
 =?utf-8?B?d3BaaVErY0VRY3I1eVQwUHRxVzB4bUFKamcwZlJKdVY5cTk2bUxobGZlQ2J1?=
 =?utf-8?B?RXl4OVdFcmh6NjdEMW5EOHU4SHlVVGJ2bFgvenZaMlNlQnFpcnZrZi82dVNo?=
 =?utf-8?B?SDN3M2dwMWZUMUI4dFR3VDlVUUI5elp0Wi9YZWJDNE5zWTJyb0x3SkpkbXE0?=
 =?utf-8?B?eWU0VnBlRER1aWFqYmxBWGdQcFlxckRpa1ErRU1nL2U4em1LNHJjZHJ0WWEz?=
 =?utf-8?B?UTl4U0N3dnFjZ01hZlZrTjUyWWQzYVBVd2Y4WXJxTWVPRVBrRnV6RC9YeFNp?=
 =?utf-8?B?SlovTnhldXBFMTlxdmxoUlJlaXpPNXkvY09JNUF6Vy9malJsa2Z4a2VmTk5o?=
 =?utf-8?B?cmhZNEdDNjlGYWM4azJ3ako1aDh4SGhDbGc1QlRBODZHaDlBSWl2eTRYcEhN?=
 =?utf-8?B?UFdzMHBxOFNIWkZnS0l4N2IzWDlDM3NWV3pqbElqVXkwNEdVSzllL1oyL2Zo?=
 =?utf-8?B?SHp4dXpDUXpkQktjeW9jeTJWcHdvem85STFUeVdYZFJLc1JURXU5T3MzZVQx?=
 =?utf-8?B?M1BJZngvTXJBa1JSS2xpTURtSXAvRWY5Qk9wOTFudTlEaXdXRXFGSEZqSWta?=
 =?utf-8?B?SUREN3AzWlpRYlZGNUR3WXpGNGtJQ1lmZ0xLZVZFeUt1ZDB1NVFJQ25Rbldk?=
 =?utf-8?B?Qzk5TmJVN2I0WTM4OEZJTitWOGsybUQ1UEJhZjVMYUVMNFpUQUFqYnp2c0Zx?=
 =?utf-8?B?WGordkRvNS9scW5xd3Z0UWRhbzR0SnVHYWdZVmF2Ynd5clVSSk1FL3N0OVR3?=
 =?utf-8?B?R0F4dEUxeGM3VHBLa005aFArYitEc3lkN2I5Y1ZLUGI3L1lWczZYUUVWMzJM?=
 =?utf-8?B?bi95NEUyVE1oR2p5RXRPMGpMQVlMRi9ZRjRWWWh1c3VUQmhuWWh0ajdwZzVv?=
 =?utf-8?B?a21hYUxJTWVMa3Z2TFBDY0h4YlpPSjh0ZUxxSkplTjM5ODh2UE1rS2lOaVVR?=
 =?utf-8?B?SzBCK1dvdHpmenBHQjRTMzZBc2dWYWdQTVpnK1BabUVaTTNmbmo1cStJS1ho?=
 =?utf-8?B?dnUzanZtdWw3MWFvR29yWnM4MzljZVRVdTZ2MUlmVFQ2Skoyb3dtRXhDVXVs?=
 =?utf-8?B?UnBpc3JqRUE4bW9wYTROSUlFcm9CS09RSXJtZnVmb2VWLzVMdUZLVE5zK09G?=
 =?utf-8?B?eUxVWkZVa2pybFFVeHlyRUxjK3dOQTlkMEQ4VWJmT2dUWC9ZR0lmLy9FRWtE?=
 =?utf-8?Q?Oh95xz8g?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 16:26:57.0361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: d188c26c-e7f7-484b-5638-08d8b3290d51
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NAdA7Yrs0a7QiutkQZw1GpNF8FhUNLqyrVGPUcXzW+NsGw5IRrlASLXQKIErgxtedr2typuMPz/82Rtege/fpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2494
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, gregkh@linuxfoundation.org,
 Alexander.Deucher@amd.com, yuq825@gmail.com, christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDEvNy8yMSAxMToyMSBBTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBUdWUsIEphbiAw
NSwgMjAyMSBhdCAwNDowNDoxNlBNIC0wNTAwLCBBbmRyZXkgR3JvZHpvdnNreSB3cm90ZToKPj4g
T24gMTEvMjMvMjAgMzowMSBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+IEFtIDIzLjEx
LjIwIHVtIDA1OjU0IHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pj4gT24gMTEvMjEvMjAg
OToxNSBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+Pj4gQW0gMjEuMTEuMjAgdW0gMDY6
MjEgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4+Pj4+IFdpbGwgYmUgdXNlZCB0byByZXJv
dXRlIENQVSBtYXBwZWQgQk8ncyBwYWdlIGZhdWx0cyBvbmNlCj4+Pj4+PiBkZXZpY2UgaXMgcmVt
b3ZlZC4KPj4+Pj4gVWZmLCBvbmUgcGFnZSBmb3IgZWFjaCBleHBvcnRlZCBETUEtYnVmPyBUaGF0
J3Mgbm90IHNvbWV0aGluZyB3ZSBjYW4gZG8uCj4+Pj4+Cj4+Pj4+IFdlIG5lZWQgdG8gZmluZCBh
IGRpZmZlcmVudCBhcHByb2FjaCBoZXJlLgo+Pj4+Pgo+Pj4+PiBDYW4ndCB3ZSBjYWxsIGFsbG9j
X3BhZ2UoKSBvbiBlYWNoIGZhdWx0IGFuZCBsaW5rIHRoZW0gdG9nZXRoZXIKPj4+Pj4gc28gdGhl
eSBhcmUgZnJlZWQgd2hlbiB0aGUgZGV2aWNlIGlzIGZpbmFsbHkgcmVhcGVkPwo+Pj4+Cj4+Pj4g
Rm9yIHN1cmUgYmV0dGVyIHRvIG9wdGltaXplIGFuZCBhbGxvY2F0ZSBvbiBkZW1hbmQgd2hlbiB3
ZSByZWFjaAo+Pj4+IHRoaXMgY29ybmVyIGNhc2UsIGJ1dCB3aHkgdGhlIGxpbmtpbmcgPwo+Pj4+
IFNob3VsZG4ndCBkcm1fcHJpbWVfZ2VtX2Rlc3Ryb3kgYmUgZ29vZCBlbm91Z2ggcGxhY2UgdG8g
ZnJlZSA/Cj4+PiBJIHdhbnQgdG8gYXZvaWQga2VlcGluZyB0aGUgcGFnZSBpbiB0aGUgR0VNIG9i
amVjdC4KPj4+Cj4+PiBXaGF0IHdlIGNhbiBkbyBpcyB0byBhbGxvY2F0ZSBhIHBhZ2Ugb24gZGVt
YW5kIGZvciBlYWNoIGZhdWx0IGFuZCBsaW5rCj4+PiB0aGUgdG9nZXRoZXIgaW4gdGhlIGJkZXYg
aW5zdGVhZC4KPj4+Cj4+PiBBbmQgd2hlbiB0aGUgYmRldiBpcyB0aGVuIGZpbmFsbHkgZGVzdHJv
eWVkIGFmdGVyIHRoZSBsYXN0IGFwcGxpY2F0aW9uCj4+PiBjbG9zZWQgd2UgY2FuIGZpbmFsbHkg
cmVsZWFzZSBhbGwgb2YgdGhlbS4KPj4+Cj4+PiBDaHJpc3RpYW4uCj4+Cj4+IEhleSwgc3RhcnRl
ZCB0byBpbXBsZW1lbnQgdGhpcyBhbmQgdGhlbiByZWFsaXplZCB0aGF0IGJ5IGFsbG9jYXRpbmcg
YSBwYWdlCj4+IGZvciBlYWNoIGZhdWx0IGluZGlzY3JpbWluYXRlbHkKPj4gd2Ugd2lsbCBiZSBh
bGxvY2F0aW5nIGEgbmV3IHBhZ2UgZm9yIGVhY2ggZmF1bHRpbmcgdmlydHVhbCBhZGRyZXNzIHdp
dGhpbiBhCj4+IFZBIHJhbmdlIGJlbG9uZ2luZyB0aGUgc2FtZSBCTwo+PiBhbmQgdGhpcyBpcyBv
YnZpb3VzbHkgdG9vIG11Y2ggYW5kIG5vdCB0aGUgaW50ZW50aW9uLiBTaG91bGQgSSBpbnN0ZWFk
IHVzZQo+PiBsZXQncyBzYXkgYSBoYXNodGFibGUgd2l0aCB0aGUgaGFzaAo+PiBrZXkgYmVpbmcg
ZmF1bHRpbmcgQk8gYWRkcmVzcyB0byBhY3R1YWxseSBrZWVwIGFsbG9jYXRpbmcgYW5kIHJldXNp
bmcgc2FtZQo+PiBkdW1teSB6ZXJvIHBhZ2UgcGVyIEdFTSBCTwo+PiAob3IgZm9yIHRoYXQgbWF0
dGVyIERSTSBmaWxlIG9iamVjdCBhZGRyZXNzIGZvciBub24gaW1wb3J0ZWQgQk9zKSA/Cj4gV2h5
IGRvIHdlIG5lZWQgYSBoYXNodGFibGU/IEFsbCB0aGUgc3cgc3RydWN0dXJlcyB0byB0cmFjayB0
aGlzIHNob3VsZAo+IHN0aWxsIGJlIGFyb3VuZDoKPiAtIGlmIGdlbV9iby0+ZG1hX2J1ZiBpcyBz
ZXQgdGhlIGJ1ZmZlciBpcyBjdXJyZW50bHkgZXhwb3J0ZWQgYXMgYSBkbWEtYnVmLAo+ICAgIHNv
IGRlZmVuc2l2ZWx5IGFsbG9jYXRlIGEgcGVyLWJvIHBhZ2UKPiAtIG90aGVyd2lzZSBhbGxvY2F0
ZSBhIHBlci1maWxlIHBhZ2UKCgpUaGF0IGV4YWN0bHkgd2hhdCB3ZSBoYXZlIGluIGN1cnJlbnQg
aW1wbGVtZW50YXRpb24KCgo+Cj4gT3IgaXMgdGhlIGlkZWEgdG8gc2F2ZSB0aGUgc3RydWN0IHBh
Z2UgKiBwb2ludGVyPyBUaGF0IGZlZWxzIGEgYml0IGxpa2UKPiBvdmVyLW9wdGltaXppbmcgc3R1
ZmYuIEJldHRlciB0byBoYXZlIGEgc2ltcGxlIGltcGxlbWVudGF0aW9uIGZpcnN0IGFuZAo+IHRo
ZW4gdHVuZSBpdCBpZiAoYW5kIG9ubHkgaWYpIGFueSBwYXJ0IG9mIGl0IGJlY29tZXMgYSBwcm9i
bGVtIGZvciBub3JtYWwKPiB1c2FnZS4KCgpFeGFjdGx5IC0gdGhlIGlkZWEgaXMgdG8gYXZvaWQg
YWRkaW5nIGV4dHJhIHBvaW50ZXIgdG8gZHJtX2dlbV9vYmplY3QsCkNocmlzdGlhbiBzdWdnZXN0
ZWQgdG8gaW5zdGVhZCBrZWVwIGEgbGlua2VkIGxpc3Qgb2YgZHVtbXkgcGFnZXMgdG8gYmUKYWxs
b2NhdGVkIG9uIGRlbWFuZCBvbmNlIHdlIGhpdCBhIHZtX2ZhdWx0LiBJIHdpbGwgdGhlbiBhbHNv
IHByZWZhdWx0IHRoZSBlbnRpcmUKVkEgcmFuZ2UgZnJvbSB2bWEtPnZtX2VuZCAtIHZtYS0+dm1f
c3RhcnQgdG8gdm1hLT52bV9lbmQgYW5kIG1hcCB0aGVtCnRvIHRoYXQgc2luZ2xlIGR1bW15IHBh
Z2UuCgpBbmRyZXkKCgo+IC1EYW5pZWwKPgo+PiBBbmRyZXkKPj4KPj4KPj4+PiBBbmRyZXkKPj4+
Pgo+Pj4+Cj4+Pj4+IFJlZ2FyZHMsCj4+Pj4+IENocmlzdGlhbi4KPj4+Pj4KPj4+Pj4+IFNpZ25l
ZC1vZmYtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgo+
Pj4+Pj4gLS0tCj4+Pj4+PiAgwqAgZHJpdmVycy9ncHUvZHJtL2RybV9maWxlLmPCoCB8wqAgOCAr
KysrKysrKwo+Pj4+Pj4gIMKgIGRyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYyB8IDEwICsrKysr
KysrKysKPj4+Pj4+ICDCoCBpbmNsdWRlL2RybS9kcm1fZmlsZS5owqDCoMKgwqDCoCB8wqAgMiAr
Kwo+Pj4+Pj4gIMKgIGluY2x1ZGUvZHJtL2RybV9nZW0uaMKgwqDCoMKgwqDCoCB8wqAgMiArKwo+
Pj4+Pj4gIMKgIDQgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQo+Pj4+Pj4KPj4+Pj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZpbGUuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZmlsZS5jCj4+Pj4+PiBpbmRleCAwYWM0NTY2Li5mZjNkMzlmIDEwMDY0NAo+Pj4+Pj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9maWxlLmMKPj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZmlsZS5jCj4+Pj4+PiBAQCAtMTkzLDYgKzE5MywxMiBAQCBzdHJ1Y3QgZHJtX2Zp
bGUgKmRybV9maWxlX2FsbG9jKHN0cnVjdCBkcm1fbWlub3IgKm1pbm9yKQo+Pj4+Pj4gIMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gb3V0X3ByaW1lX2Rlc3Ryb3k7Cj4+Pj4+PiAgwqDC
oMKgwqDCoCB9Cj4+Pj4+PiAgwqAgK8KgwqDCoCBmaWxlLT5kdW1teV9wYWdlID0gYWxsb2NfcGFn
ZShHRlBfS0VSTkVMIHwgX19HRlBfWkVSTyk7Cj4+Pj4+PiArwqDCoMKgIGlmICghZmlsZS0+ZHVt
bXlfcGFnZSkgewo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldCA9IC1FTk9NRU07Cj4+Pj4+PiAr
wqDCoMKgwqDCoMKgwqAgZ290byBvdXRfcHJpbWVfZGVzdHJveTsKPj4+Pj4+ICvCoMKgwqAgfQo+
Pj4+Pj4gKwo+Pj4+Pj4gIMKgwqDCoMKgwqAgcmV0dXJuIGZpbGU7Cj4+Pj4+PiAgwqAgwqAgb3V0
X3ByaW1lX2Rlc3Ryb3k6Cj4+Pj4+PiBAQCAtMjg5LDYgKzI5NSw4IEBAIHZvaWQgZHJtX2ZpbGVf
ZnJlZShzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUpCj4+Pj4+PiAgwqDCoMKgwqDCoCBpZiAoZGV2LT5k
cml2ZXItPnBvc3RjbG9zZSkKPj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2LT5kcml2ZXIt
PnBvc3RjbG9zZShkZXYsIGZpbGUpOwo+Pj4+Pj4gIMKgICvCoMKgwqAgX19mcmVlX3BhZ2UoZmls
ZS0+ZHVtbXlfcGFnZSk7Cj4+Pj4+PiArCj4+Pj4+PiAgwqDCoMKgwqDCoCBkcm1fcHJpbWVfZGVz
dHJveV9maWxlX3ByaXZhdGUoJmZpbGUtPnByaW1lKTsKPj4+Pj4+ICDCoCDCoMKgwqDCoMKgIFdB
Uk5fT04oIWxpc3RfZW1wdHkoJmZpbGUtPmV2ZW50X2xpc3QpKTsKPj4+Pj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1l
LmMKPj4+Pj4+IGluZGV4IDE2OTNhYTcuLjk4N2I0NWMgMTAwNjQ0Cj4+Pj4+PiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMKPj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
cHJpbWUuYwo+Pj4+Pj4gQEAgLTMzNSw2ICszMzUsMTMgQEAgaW50IGRybV9nZW1fcHJpbWVfZmRf
dG9faGFuZGxlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4+Pj4+PiAgwqAgwqDCoMKgwqDCoCBy
ZXQgPSBkcm1fcHJpbWVfYWRkX2J1Zl9oYW5kbGUoJmZpbGVfcHJpdi0+cHJpbWUsCj4+Pj4+PiAg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZG1hX2J1ZiwgKmhhbmRsZSk7Cj4+Pj4+PiArCj4+
Pj4+PiArwqDCoMKgIGlmICghcmV0KSB7Cj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgb2JqLT5kdW1t
eV9wYWdlID0gYWxsb2NfcGFnZShHRlBfS0VSTkVMIHwgX19HRlBfWkVSTyk7Cj4+Pj4+PiArwqDC
oMKgwqDCoMKgwqAgaWYgKCFvYmotPmR1bW15X3BhZ2UpCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZXQgPSAtRU5PTUVNOwo+Pj4+Pj4gK8KgwqDCoCB9Cj4+Pj4+PiArCj4+Pj4+PiAg
wqDCoMKgwqDCoCBtdXRleF91bmxvY2soJmZpbGVfcHJpdi0+cHJpbWUubG9jayk7Cj4+Pj4+PiAg
wqDCoMKgwqDCoCBpZiAocmV0KQo+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGZhaWw7
Cj4+Pj4+PiBAQCAtMTAyMCw2ICsxMDI3LDkgQEAgdm9pZCBkcm1fcHJpbWVfZ2VtX2Rlc3Ryb3ko
c3RydWN0Cj4+Pj4+PiBkcm1fZ2VtX29iamVjdCAqb2JqLCBzdHJ1Y3Qgc2dfdGFibGUgKnNnKQo+
Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBkbWFfYnVmX3VubWFwX2F0dGFjaG1lbnQoYXR0YWNo
LCBzZywgRE1BX0JJRElSRUNUSU9OQUwpOwo+Pj4+Pj4gIMKgwqDCoMKgwqAgZG1hX2J1ZiA9IGF0
dGFjaC0+ZG1hYnVmOwo+Pj4+Pj4gIMKgwqDCoMKgwqAgZG1hX2J1Zl9kZXRhY2goYXR0YWNoLT5k
bWFidWYsIGF0dGFjaCk7Cj4+Pj4+PiArCj4+Pj4+PiArwqDCoMKgIF9fZnJlZV9wYWdlKG9iai0+
ZHVtbXlfcGFnZSk7Cj4+Pj4+PiArCj4+Pj4+PiAgwqDCoMKgwqDCoCAvKiByZW1vdmUgdGhlIHJl
ZmVyZW5jZSAqLwo+Pj4+Pj4gIMKgwqDCoMKgwqAgZG1hX2J1Zl9wdXQoZG1hX2J1Zik7Cj4+Pj4+
PiAgwqAgfQo+Pj4+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9maWxlLmggYi9pbmNs
dWRlL2RybS9kcm1fZmlsZS5oCj4+Pj4+PiBpbmRleCA3MTY5OTBiLi4yYTAxMWZjIDEwMDY0NAo+
Pj4+Pj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2ZpbGUuaAo+Pj4+Pj4gKysrIGIvaW5jbHVkZS9k
cm0vZHJtX2ZpbGUuaAo+Pj4+Pj4gQEAgLTM0Niw2ICszNDYsOCBAQCBzdHJ1Y3QgZHJtX2ZpbGUg
ewo+Pj4+Pj4gIMKgwqDCoMKgwqDCoCAqLwo+Pj4+Pj4gIMKgwqDCoMKgwqAgc3RydWN0IGRybV9w
cmltZV9maWxlX3ByaXZhdGUgcHJpbWU7Cj4+Pj4+PiAgwqAgK8KgwqDCoCBzdHJ1Y3QgcGFnZSAq
ZHVtbXlfcGFnZTsKPj4+Pj4+ICsKPj4+Pj4+ICDCoMKgwqDCoMKgIC8qIHByaXZhdGU6ICovCj4+
Pj4+PiAgwqAgI2lmIElTX0VOQUJMRUQoQ09ORklHX0RSTV9MRUdBQ1kpCj4+Pj4+PiAgwqDCoMKg
wqDCoCB1bnNpZ25lZCBsb25nIGxvY2tfY291bnQ7IC8qIERSSTEgbGVnYWN5IGxvY2sgY291bnQg
Ki8KPj4+Pj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZ2VtLmggYi9pbmNsdWRlL2Ry
bS9kcm1fZ2VtLmgKPj4+Pj4+IGluZGV4IDMzN2E0ODMuLjc2YTk3YTMgMTAwNjQ0Cj4+Pj4+PiAt
LS0gYS9pbmNsdWRlL2RybS9kcm1fZ2VtLmgKPj4+Pj4+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9n
ZW0uaAo+Pj4+Pj4gQEAgLTMxMSw2ICszMTEsOCBAQCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3Qgewo+
Pj4+Pj4gIMKgwqDCoMKgwqDCoCAqCj4+Pj4+PiAgwqDCoMKgwqDCoMKgICovCj4+Pj4+PiAgwqDC
oMKgwqDCoCBjb25zdCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3RfZnVuY3MgKmZ1bmNzOwo+Pj4+Pj4g
Kwo+Pj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgcGFnZSAqZHVtbXlfcGFnZTsKPj4+Pj4+ICDCoCB9Owo+
Pj4+Pj4gIMKgIMKgIC8qKgo+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4+Pj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPj4+PiBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+Pj4+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24u
b3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmxpc3RzLmZyZWVkZXNrdG9wLm9yZyUyRm1h
aWxtYW4lMkZsaXN0aW5mbyUyRmFtZC1nZngmYW1wO2RhdGE9MDQlN0MwMSU3Q0FuZHJleS5Hcm9k
em92c2t5JTQwYW1kLmNvbSU3QzM5OTdiMDZjNTVmNjRkYjk2MGVlMDhkOGIzMjg1YWQ0JTdDM2Rk
ODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzQ1NjMzMzIwOTEzOTI5
NCU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJs
dU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MxMDAwJmFtcDtzZGF0YT1Pcmcx
RDYyQzBHWHlWbjZyVzhTbkFraGhYOHh2SlhGQ3FBNXpxeWFSJTJCZVUlM0QmYW1wO3Jlc2VydmVk
PTAKPj4+Pgo+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPj4+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/
dXJsPWh0dHBzJTNBJTJGJTJGbGlzdHMuZnJlZWRlc2t0b3Aub3JnJTJGbWFpbG1hbiUyRmxpc3Rp
bmZvJTJGYW1kLWdmeCZhbXA7ZGF0YT0wNCU3QzAxJTdDQW5kcmV5Lkdyb2R6b3Zza3klNDBhbWQu
Y29tJTdDMzk5N2IwNmM1NWY2NGRiOTYwZWUwOGQ4YjMyODVhZDQlN0MzZGQ4OTYxZmU0ODg0ZTYw
OGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3NDU2MzMzMjA5MTQ5Mjg5JTdDVW5rbm93biU3
Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2
SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzEwMDAmYW1wO3NkYXRhPVdjbnVKR1pnJTJCOGp5c09r
Mm5UTjlqWGV5RmtoYXV4TXI0YWpRWWpQMzl6USUzRCZhbXA7cmVzZXJ2ZWQ9MAo+Pj4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
