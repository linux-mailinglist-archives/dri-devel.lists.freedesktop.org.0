Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C061C337049
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 11:43:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFAEF6EB89;
	Thu, 11 Mar 2021 10:43:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2046.outbound.protection.outlook.com [40.107.223.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0071A6EB89;
 Thu, 11 Mar 2021 10:43:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Br3/y5XL+04ml1Jh94VIaBqQ13q24hYUJnj+HAFcRuDUKKxnOh95wB+fAdjngsL7XCSWnjy9usU4oUwJt4R+1ZMSjD6FxcZPVpVLN/hdKHz7pIuKRk2FBEQ3fhu/TrRYgePt5g/S1DJSFDppsf79ndsV0H5VJJQu3UuEWzjPaDwC1YYi9oTp8XZS1PCxhajFs76vi4u7hSB4EpgQ4JvBwZhzFetYpWvwIKKRIVHHUlRPzOOoX1PSucebrn+11OEBBDFlxh4yS5zhMs7Noi+3P5zh0da99otN23Vo2+JhRqLWji/wEL6xfOUl0D8dx2ogNt36hzwWAKfB0Uzq5RYAtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=anNMlcNBlhbYhqu4MuqtsSgpnte0Vvr82Cs9ZEBehrU=;
 b=dHbxz5SziN/7tjPSZsgSsAnWsMnDrGvKEVwloXf+QJOnkgz60QmcnIEeMUlWCrnRiEZwawueMm7hP8OF2zYD/U06eyH7DPLKDmIs/K2SS48j4Qs0hc62UVzzUJBQqpZJIVf0ttC3aMBk3H84lqFJEQEpWUUvmDb0QMJr2lxh1JCAhin0ZCUz5S30R7B40rfTtd74mrijBGDW8e6BYHUpcfHEx5mwEpG7zwaINYb7/Ew8vmmFtGzQI1wPINAcGmYncF5jOjIx6DcKf3RJGayytvu8dL7Agy59RO2R8F3kBnceBpfRwhb8NPSSzdyDj/Dsib/E3RL5F2lnbIY+6ICKmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=anNMlcNBlhbYhqu4MuqtsSgpnte0Vvr82Cs9ZEBehrU=;
 b=xSPaP58EsiA5+zhZmdOJRICcmM2B8fAXVe5Tq/8cbZHrX9N9iRuGY9+dxPjpNn9RPPCUaNA0kDvr42VTnhCmYo2CuvekDKhJhEosTNhD1iDX8Vg8B29IE5mYqOFZtzANA7ehRU6/MsMbj9hsA68M6Rml/d91pMr3tBK/Qwuy+Q8=
Authentication-Results: linutronix.de; dkim=none (message not signed)
 header.d=none;linutronix.de; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3999.namprd12.prod.outlook.com (2603:10b6:208:158::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.30; Thu, 11 Mar
 2021 10:42:59 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3933.031; Thu, 11 Mar 2021
 10:42:58 +0000
Subject: Re: [PATCH v2 0/3] drm/amdgpu: Remove in_interrupt() usage.
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
References: <20210209124439.408140-1-bigeasy@linutronix.de>
 <41d0f7db-c2b4-f618-42a7-da9f7cdb76b4@amd.com>
 <20210209165312.bq2yn73fqidt7hgl@linutronix.de>
 <02371b80-667b-81a0-b8d7-7fd085442b1b@amd.com>
 <20210310174734.hxzmmn5eo5bc5whb@linutronix.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <df66a184-fa04-bea0-9ba7-a8a93c43b06a@amd.com>
Date: Thu, 11 Mar 2021 11:42:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210310174734.hxzmmn5eo5bc5whb@linutronix.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:e21c:b1e1:cff0:2c70]
X-ClientProxiedBy: AM0PR08CA0033.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::46) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:e21c:b1e1:cff0:2c70]
 (2a02:908:1252:fb60:e21c:b1e1:cff0:2c70) by
 AM0PR08CA0033.eurprd08.prod.outlook.com (2603:10a6:208:d2::46) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Thu, 11 Mar 2021 10:42:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f3a42969-dc71-4db1-3696-08d8e47a6fe3
X-MS-TrafficTypeDiagnostic: MN2PR12MB3999:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3999F3EDE821DF329C95AF9283909@MN2PR12MB3999.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tPJAhmzb+n/gilYcpOIRK0d2b2qNmhWMMXczp/7Le9eZnNNPimt4LpbHCdMogWl+Qv/rCv9RCh1zAiTCtlPv0XvumfVvvEkRc5HD2AttBatN0F7om+vVyVF2AywuDbfIMuIn20IONX0qBQtpeGwNkJTB6O1pqxXiOd8dC27o3Y11mhEOj7eFFK0NAeatpO3orp8gdS8/qA/c6v10DcQPZoHqUmItQE4t/ICGOBw1aRFF+LYUv/4ZBPUTnGyEq8rBYy+c075BPfTLjSdy3UADWXUCE9On3/VpSh7DS3pDu0HDtMpKMfm93nEnaakdH6Hot9tp1tIEX4mkwR91Rpq/ssEr0kdk5pHwCzbXubmmBKFdV1o8TfAIR8C1U2uQZ30Rn9hr8qjpwGmaPvAwDAaJ5gBOEt0Ft+eO2r4JjoYSbuyG7EI8UFWTd3T3svu1/Pg7GNia+U1SiytV4ee6DHQdJBE04p9OP6xy0pR6eVAYOomYYMi3bdYduGzNBKSoezirH/VQ1zCPfgK3P0iJ0bYP3KdxzexyEDGKhHzIfMmK8tnC6A263HCM94rXzFGoy4vMr3h0oNZWoWWll2LpQiygebhsQWkElhzAf2EftuIJnK8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(136003)(39860400002)(376002)(6486002)(53546011)(36756003)(16526019)(4326008)(31686004)(478600001)(2616005)(8936002)(66574015)(6666004)(83380400001)(86362001)(54906003)(316002)(66556008)(66946007)(66476007)(2906002)(8676002)(6916009)(5660300002)(52116002)(186003)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aGlrOVVYYmFRb244bUUvNHgzdHVFSjVmQ0xlTEdpUjNQOVBxSHM5Z1RER2p4?=
 =?utf-8?B?Q2Q0RUFxT01lLytwZzZkOHFWajBIa1pseTEwVVEwYlI4eUFqeGdCaVUrY0xZ?=
 =?utf-8?B?WnNKb0RVSDhZVEdoa2VCVjFaT242RmNjUzJSVHJxcnhFZlJRcDJIMVdtUyta?=
 =?utf-8?B?Zk4rZlR3WWh2V1ZuWFpJdU0zczhnbHAwOWh0Rm1GelUrUUVhSDVQNzJ1S2hs?=
 =?utf-8?B?QkZQU2NLYVRlZlVtSE9rN25hdGNScVpNZ3ZLRml4ZTczMnZtKzFJQUJwMEgx?=
 =?utf-8?B?bWR1amZpTXQ0NUUveFVVcEV2VnBwMnVKWWpwVk96V08rYytrdXV0VnY1aUg2?=
 =?utf-8?B?WEJCUW1RUEpqNVc0dkRJd3VMaU5WaG5LMlpKaG03Rkh0Z21FVkN6WjZnMEY4?=
 =?utf-8?B?UzljMUFLaGFHUE9PV1NnaENJTG1adW0rZExFWUVaTHR4SGhPN3hadHdSdEZG?=
 =?utf-8?B?U2dnM3p6TjZCZE9mZjFMZlhRQlZOTmdKRVZhM0xxSEQzNG9xNStGbGltTGYr?=
 =?utf-8?B?RHhEN05xTVBpaVpIQ0MzSXZ3YjJHSDNSaDNjOVRSWXVDNHVHN1B4NGNSREx1?=
 =?utf-8?B?NXg1SjJGWCs4b2xSeEtRTmJhTnhwM3dFV0JWYldXRlBUbXQrR2M0aU9jNU11?=
 =?utf-8?B?Y0JIZ2ZGVk95c2UxNjk3andrWm5xYyttR2RDdE5LRGRIMnB6ZnZpaVJ3N3c5?=
 =?utf-8?B?ZEhTemlkT3lUcUZZSDB3bEZSWXVoRDE0aGQ1NThQTXZ6Q3VSMmR2V0pVMXdV?=
 =?utf-8?B?QzY3TXM2Z3JjMWw4QlRHM1hoVkptdW4wZEU2alY2Qm1nanQwK29sL1NBMzVV?=
 =?utf-8?B?QlNPdnQ1OUlPeHQ2WHpwZkVtc215T0FnVHhhYksyZkkyWERiek0rQmJQY3RU?=
 =?utf-8?B?UTV3dTErbW9DL09NWmlxYUJYV1JjM0FzMjlIZis3SHl3c3dwVXA1dEhXOUg2?=
 =?utf-8?B?eVZ0dENMMjhKN08zOFhOYittbnFPOEE5L1JBc1dWblE1QzNpRWtEbnZYYkVD?=
 =?utf-8?B?dEZiaHRuUmZWRWNJcW8waDRGeVhEYzN4OExPZ3FhMnpOK0NxMWxlMjMwMThy?=
 =?utf-8?B?dWxFU0Jyck9yK2p5QzRSM0pLcGN2T204QVBwNmlrM3JoTDhzMldveHhFMG9r?=
 =?utf-8?B?cElOeDQ2SENjMzZQODVRclV5azA5QUt4RmNPNk14eVRRT3RYQk9BNFJET1N4?=
 =?utf-8?B?SnhzVExmSlJmQmJpSU0vRGcwRFE1a1piOGRadWdiSThKK1JnZzB4VnZwQmhG?=
 =?utf-8?B?TjNvcHlpOEgxRXh1QWQzOVdjRUFUUGk5cXk0TFh6NkF0djZ0ZE0xZnZ2dmVz?=
 =?utf-8?B?NEE0T01jbXhNRkpSdy9HSCthZ0xOd3F4S0RBTGFYRU1sMHF6Kzl5dEF3TjBi?=
 =?utf-8?B?ZG5WeVNVLzZGNTFOdmVJRWRnTVZ5dmd0djRiRllKSCtEZENvbFY5NkJpdWtn?=
 =?utf-8?B?N0JNeUhuTjF3UzBSVjZ6NjRwNmxEbHVac01YUjIxL1hMcGs4QzQvTGZBVmJH?=
 =?utf-8?B?MDJ6ZHBXMlJFTkxJdEN2TG5OOXFkOVJCUWdZSU8xcUc2cVFsd09YVGs4c2p0?=
 =?utf-8?B?ay9XMWdSeGVMN2hINUlkRUdnRmtDWEhJQzlwcmpSQlU3NXJsOVhxcS90b1Z5?=
 =?utf-8?B?VURTKzNRR1hoYWhuQ3VFV01hQ3ZqVGduWjJ1K1E1Rjl1dXhodC8rbHVOMXBR?=
 =?utf-8?B?cDhmR0FhUUlEQndYQ2dpV3RGYzQ3bUhUVzlHbjV1RW91VkliYUVLZ2J1TWFR?=
 =?utf-8?B?aGMyNmZ1R0RWcXhwQ2I3ZGEvQlovN1RIRkgzbUoraGxqdy9CdkhhWE9KTFpu?=
 =?utf-8?B?RTlHcGJkeGxZd0NiZFZGeDRSRzVGN245YVBrOWw2Sk03bXlpbk45V2QzUkRq?=
 =?utf-8?Q?dIOUjEmJEUNbc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3a42969-dc71-4db1-3696-08d8e47a6fe3
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 10:42:58.8549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rm+mB7elGeSEcggKYuFPRX506FI73WKkKOX36om0et0lGZsfIdSA4KCvfgsLuIwK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3999
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2ViYXN0aWFuLAoKQW0gMTAuMDMuMjEgdW0gMTg6NDcgc2NocmllYiBTZWJhc3RpYW4gQW5k
cnplaiBTaWV3aW9yOgo+IE9uIDIwMjEtMDItMDkgMTg6NDM6NTQgWyswMTAwXSwgQ2hyaXN0aWFu
IEvDtm5pZyB3cm90ZToKPj4gdG8gYmUgaG9uZXN0IEknbSB0aGlua2luZyBhYm91dCB0aGF0IGZv
ciBxdWl0ZSBzb21lIHRpbWUgbm93IGFuZCBJIGRvbid0Cj4+IHRoaW5rIHRoYXQgdGhpcyBpcyBw
b3NzaWJsZSB3aXRob3V0IGEgc2V2ZXJlIHJld3JpdGUgb2YgdGhlIGRyaXZlci4KPj4KPj4gVGhl
IHByb2JsZW0gaXMgc2ltcGx5IHRoYXQgd2UgaGF2ZSBhIGxvdCBvZiBmdW5jdGlvbnMgd2hpY2gg
ZGVhbCB3aXRoCj4+IGhhcmR3YXJlIGhhbmRsaW5nIGluZGVwZW5kZW50IG9mIHRoZSBjb250ZXh0
LiBCdXQgaG93IHJlZ2lzdGVycyBhcmUgYWNjZXNzZWQKPj4gbmVlZHMgdG8gYmUgZGlmZmVyZW50
IGRlcGVuZGluZyBpZiB5b3VyIGFyZSBpbiB0aGUgaW50ZXJydXB0IGhhbmRsZXIgb3Igbm90Lgo+
Pgo+PiBZb3Ugd291bGQgbmVlZCB0byBwdXNoIHRoZSBpbmZvcm1hdGlvbiBpZiB3ZSBhcmUgY29t
aW5nIGluIGZyb20gdGhlCj4+IGludGVycnVwdCBoYW5kbGVyIHRocm91Z2ggYSA+IDEwIGZ1bmN0
aW9uIGNhbGxzLgo+Pgo+PiBJIGRvbid0IHRoaW5rIHRoYXQgdGhpcyBpcyBmZWFzaWJsZSBub3Ig
Z29vZCBkZXNpZ24uCj4gWWVhaCwgdGhhdCBpcyB3aGF0IEkgc2F3IGFuZCBkaWRuJ3QgZXZlbiB0
cnkuCgpJIGFsc28gaGF2ZSBubyBpZGVhIHdoZXJlIHRvIHN0YXJ0LgoKPiBUaGUgcG9zc2libGUg
YmFja3RyYWNlIChhdCB0aGUgYm90dG9tIG9mIHRoaXMgZW1haWwpIGlzIHRoaXMgYSBjb3JyZWN0
Cj4gYXNzdW1wdGlvbj8KCkl0J3Mgb25lIG9mIG1hbnksIHllcy4gQnV0IHRoZSByZWFsIGNvbXBs
aWNhdGVkIG9uY2UgYXJlIGluIHRoZSBDUyBVQVBJIAphbmQgaW50ZXJydXB0IGhhbmRsaW5nLgoK
Pgo+IEFub3RoZXIgcXVpY2sgcXVlc3Rpb246IFlvdSBhY2tlZCBteSB0aHJlZS1wYXRjaCBzZXJp
ZXMuIEkgZG9uJ3Qgc2VlIGl0Cj4gaW4gdGhlIG5leHQgdHJlZSBhcyBvZiB0b2RheS4gSXMgdGhl
cmUgYW55dGhpbmcgZm9yIG1lIHRvIGRvPwoKQWxleCB1c3VhbGx5IHBpY2tzIHRoZW0gdXAgaW50
byBhbWQtc3RhZ2luZy1kcm0tbmV4dCB3aGljaCBpcyB0aGVuIAptZXJnZWQgaW50byBkcm0tbmV4
dC4KClJlZ2FyZHMsCkNocmlzdGlhbi4KCj4KPj4gUmVnYXJkcywKPj4gQ2hyaXN0aWFuLgo+Pgo+
PiBBbSAwOS4wMi4yMSB1bSAxNzo1MyBzY2hyaWViIFNlYmFzdGlhbiBBbmRyemVqIFNpZXdpb3I6
Cj4+PiBPbiAyMDIxLTAyLTA5IDEzOjUwOjMxIFsrMDEwMF0sIENocmlzdGlhbiBLw7ZuaWcgd3Jv
dGU6Cj4+Pj4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4gZm9yIHRoZSBzZXJpZXMuCj4+PiBUaGFuayB5b3UuCj4+PiBBbnkgY2hhbmNlIHlv
dSBjb3VsZCBnaXZlIG1lIGEgaGFuZCB3aXRoIHRoZSByZW1haW5pbmcgdGhyZWUgdXNlcnMKPj4+
IHdpdGhpbiB0aGUgYW1kZ3B1IGRyaXZlcj8gSSBkb24ndCBrbm93IGlmIHRoZSBpbl9pbnRlcnJ1
cHQoKSBjaGVjayBjYW4KPj4+IGJlIGxpbWl0ZWQgdG8gY2VydGFpbiBjYWxsZXJzLgo+Pj4gV2hh
dCBJIG5vdGljZWQgd2hpbGUgdHJhY2luZyB2NS4xMCBpcyB0aGlzOgo+Pj4KPj4+IHwgICAgICAg
ICAgICAgWG9yZy0yMjU3ICAgIFswMDddIGQuLi4gNTcyNjEuNjIwMDQzOiBhbWRncHVfZGV2aWNl
X3dyZWc6IDB4Njk5ZiwgMHgwMDAwMWJjZiwgMHgwMDAwMDEwMAo+Pj4gfCAgPT4gdHJhY2VfZXZl
bnRfcmF3X2V2ZW50X2FtZGdwdV9kZXZpY2Vfd3JlZwo+Pj4gfCAgPT4gYW1kZ3B1X2RldmljZV93
cmVnLnBhcnQuMAo+Pj4gfCAgPT4gZGNlMTEwX2FybV92ZXJ0X2ludHIKPj4+IHwgID0+IGRjZTEx
MF92Ymxhbmtfc2V0Cj4+PiB8ICA9PiBkbV9lbmFibGVfdmJsYW5rCj4+PiB8ICA9PiBkcm1fdmJs
YW5rX2VuYWJsZQo+Pj4gfCAgPT4gZHJtX3ZibGFua19nZXQKPj4+IHwgID0+IGRybV93YWl0X3Zi
bGFua19pb2N0bAo+Pj4gfCAgPT4gZHJtX2lvY3RsX2tlcm5lbAo+Pj4gfCAgPT4gZHJtX2lvY3Rs
Cj4+PiB8ICA9PiBhbWRncHVfZHJtX2lvY3RsCj4+PiB8ICA9PiBfX3g2NF9zeXNfaW9jdGwKPj4+
IHwgID0+IGRvX3N5c2NhbGxfNjQKPj4+IHwgID0+IGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdm
cmFtZQo+Pj4KPj4+IEkgdGhpbmsgdGhhdCBhbWRncHVfZGV2aWNlX3dyZWcoKSAtPiBhbWRncHVf
a2lxX3dyZWcoKSBjb3VsZCBiZSBpbnZva2VkLgo+Pj4gSXQgZG9lc24ndCBoZXJlIGJlY2F1c2Ug
YW1kZ3B1X3NyaW92X3J1bnRpbWUoKSBpcyBmYWxzZS4KPj4+IFRoZSB0cmFjZSBzYXlzIGBkJyB3
aGljaCBtZWFucyBpbnRlcnJ1cHRzIGFyZSBkaXNhYmxlZCBidXQKPj4+IGluX2ludGVycnVwdCgp
IHdpbGwgcmV0dXJuIGZhbHNlIGluIHRoaXMgY2FzZSAobm8gSVJRL3NvZnRpcnEpLgo+Pj4KPj4+
IFNlYmFzdGlhbgo+IFNlYmFzdGlhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
