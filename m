Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C75435F654
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 16:42:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EDB96E4A6;
	Wed, 14 Apr 2021 14:42:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2050.outbound.protection.outlook.com [40.107.93.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1A16E4A5;
 Wed, 14 Apr 2021 14:42:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e+fiq5QbMJTbO8rDdPE1Iev7gUGk7RVfIB9mrKTx7gltLqP3TATGxvmyJk6GrfdZridrBuEB0NcXXGUe3/g5PdiFUfBOvU76HtY8dm9+/rYtnfQWyKdQya+UY8Tmb+pxNZJUzNYP3TjdZuzDNoo1nyYVmXnLwg8eOpQZjCPkf5LHLcmIQPAbo3LEWIljpp13uXTWapQ0nAHAvOa9GC0u8Ya6gvj/HDod/OUDELiHJ/LTCAbmGHjZ9kWCi0UOc98W4QAaxl/EB2fHmCmmACgYRE7qcQFsc3I/iIAnSCiLaci2N5Wm03iBRfUSpYbImIeiqo5TlqDFUwoLas5d7pAfkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJ6CMnHmPodtB6pcSuG6Ybb+gwv391ENzYSkvQX2rJ0=;
 b=FoP7UvJwODUyFzUwAmOY2UUHerZrR0MdMcvrcj+ZxTAI2Qoux9WoUcxwhh3G9cDb9nMsqlUT+n07MPrOTnFcqSWrjJfD/9H/sB7IBMP1TnBbzZ8q0YbYb1Ssk8jQIGd9DL0wkFgXMSq5VliS/T/A6eW3fk8KEmEKMD7S2mXioleg+Bt5R2Gt6+RqI9vsTVDyhH+jW2GZorKRVyR3g/XiWofnvqHIRhnfB2vAgO24HHXzMc6Ue+pAYr/5IxK35J8oT5euAMIKNb+M38S4eDR9u6dGp2JAFBxGlnSUHU1gSGyl3AGQ0LxlA7I2FKt8hDUEUIACXojsEkHiT8Aeda9UQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJ6CMnHmPodtB6pcSuG6Ybb+gwv391ENzYSkvQX2rJ0=;
 b=bSH2w8oifWq4vvBkrDAUSXLuHAAJZoBVcKJqpVivQaePJ7YovzK/sWZeFNxiSEQv5c1zO2P2U5m98gPVGUZYfs6QXDYwpDPLSENgOIzvrpfrCOsrI3y6gByJy9nwiHaFxn8Q+HPjrJ5nVGguOn3zmqR1oafHoG7hCx+qD7vBZo0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4707.namprd12.prod.outlook.com (2603:10b6:208:8a::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Wed, 14 Apr
 2021 14:42:01 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Wed, 14 Apr 2021
 14:42:01 +0000
Subject: Re: [PATCH 8/9] drm/ttm: Don't count pages in SG BOs against
 pages_limit
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20210414064804.29356-1-Felix.Kuehling@amd.com>
 <20210414064804.29356-9-Felix.Kuehling@amd.com>
 <60d08770-e4f5-4e8f-0a93-2270ae02aa26@gmail.com>
 <YHayqD3IbupkY7b+@phenom.ffwll.local>
 <18a18e85-7b0d-649f-64a3-028376d8de15@amd.com>
 <YHbDQcr6Yl1Lljep@phenom.ffwll.local>
 <7ac3a5e9-abf6-6ea5-af21-25c04e984d57@gmail.com>
 <CAKMK7uFniPaRLpO9KmPe22xP69yahTwVomCE2FuMRG97_K_NVQ@mail.gmail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <651cb183-84fd-d116-88f1-b5ec876e8b0f@amd.com>
Date: Wed, 14 Apr 2021 10:41:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <CAKMK7uFniPaRLpO9KmPe22xP69yahTwVomCE2FuMRG97_K_NVQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [142.182.180.233]
X-ClientProxiedBy: YT2PR01CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::13) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.182.180.233) by
 YT2PR01CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.22 via Frontend Transport; Wed, 14 Apr 2021 14:42:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7336b39e-32b2-40f3-4c50-08d8ff5376c6
X-MS-TrafficTypeDiagnostic: BL0PR12MB4707:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB470779D486E173F7C8712D8B924E9@BL0PR12MB4707.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 29yNyiKe6lWKFE6/RwX2YkTQ9fvHxZKeQZJ62ULOlXvf0EHBcJJJDNbivoS1rNj78kwjPOY3rxlrr/nIJd5XNd4LJjIl3mhN1fxq4iQwP16L1P09YtwiPESSO1dYCwAPD0ejGkSCEv2XvZOZB3Iid7K9GNFhVTMzBdi1N/Yt81QeMXEDaRgG2R5YePs4MLnNsgKzECZWBtWZzVag7NFnRuwM3ZynYdRpfXOOafLoqr5L9cwDsk0pMjsZzOTTvVvbvClFFAcImi3nK+aCtaA2vOLmGg+W//lfLmZ6eq7a0u6pxk8zz04PpdY02cXwltnxY6QYOUP4Zw4nWY9DqftgJ3o6a4rkg6jWkO/pJF1j5h5P0CZfg0dkGOVoSO/iwe5iv8N8+QdrgCwg05pN5uLC5f8UYsTym/+GgiwS/tbpppjjy4zsmxeDgqtDnaYYV7TlPL2DZjQvJAI54FMQQCKQ6cr89yZzjk1oI8+j21kGYj/bPVlj6R5Kva8SQpqXeo47LEJ2qEA/RP6dv30FdeEQ8ugQOaLy1lkWj4/LkUDpuG0+F9YJ2RUjSI3RbQvZDk0ZycdLcE6t7/+cjL4d2+slhwS4Mgbv7gWmrhXhRyiOzC87VheRXHOnEwSeAmYwUqua7DrT/5A1Lw12SbB03LSYesgvVLH+F+eUezNjeqIpeD+Y88gdM6MUYNXOJiQW/0HP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(366004)(186003)(316002)(16526019)(4326008)(66946007)(5660300002)(31686004)(16576012)(66556008)(26005)(83380400001)(110136005)(6486002)(31696002)(956004)(44832011)(2616005)(8936002)(38100700002)(86362001)(8676002)(4744005)(66476007)(36756003)(2906002)(54906003)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Ni9hZkRpUVNtVHFIZ2dKanRoSDRmUDZGS21SSCtGWFk0eFFUdStPNEVTZUM0?=
 =?utf-8?B?VjVQejgrcWpFMHI5SHVhdW41TGhlTHZwUFdyanVVaG92V0xERUM3NnpOWU42?=
 =?utf-8?B?WGJScHpoaHJSRWpaZnhDS21yL25BRG80a0ptbHRsbUtWeTI3N3hSd1g2TVJL?=
 =?utf-8?B?MWJzVmNTYngrS1l1Zmo4M3Q0T2JJYTUxSVE4MWh0RUdtWkp2c0s2R3JEN1lH?=
 =?utf-8?B?NlptOU9jRm9kWGUyUjMwK0ZCQ1M4UmhkaStFSkUrd0p6RXJOWjA3d0kzRHo3?=
 =?utf-8?B?L1pOekNxQkFxdmNpcGFyZXNiWE94VzFtZkhTUVIrV1ltelVwbXF2N2FFRFdS?=
 =?utf-8?B?MEE0dndnZ3lVcG5KNm5uZjBWSnhLOXRZOHl2WlhiRFZxakZiaUkrZUJIWXBt?=
 =?utf-8?B?akdWb21JUmI2TC9JdGlQSVg2dytwb0ZDc01ESVZkcWZXd3R4bFhpMjIrYWpx?=
 =?utf-8?B?UE5YNFhpYzllMFYzSGQrTjN3d0VNYWxtUWVQVkRBMVV4UW9GNkNjaHdSaVRS?=
 =?utf-8?B?ZkRXWmRwTlI4VGhOYU14UGhPbU93cndiaE40TzNNS09aRUY0YjljM2JxbVRQ?=
 =?utf-8?B?U05vMVlwbnV2bmJkdFJudGEzVHpFVFRZLzNqTXhjUWVNRzdaRE8xMWwwTzlO?=
 =?utf-8?B?bkZBeGNUcXpqQW1DZnRDTlZBcnMvQkhOdStMYi9LODBXdlhDWEd0Z1MraWNE?=
 =?utf-8?B?a2o3THBDaXM2d2NzZlF1bnNxVEJuRzhSeUpPVTZBc1B0Z1JXRTNuc21veUw5?=
 =?utf-8?B?eWlkdTNNOVhJM1owdk55RjJCSWl4ejBFVEZ5c2svZGZrZi84cFRDVmdRd0da?=
 =?utf-8?B?ekREL3hoVkt2MEUxMndtdUhkK1o5VjE0V1dONXErZkl4WU94SVNwdEEyNzFo?=
 =?utf-8?B?U2pWU1RaUWtHcllhTXhENXVBbElvZVRUYXlZMzh1dXd3R2tUWWlsM0J2UmJv?=
 =?utf-8?B?aEFGN1JMZXl1b3FJUWFsT2N3YTQ0TjkyQVQ0YzlkOGJNMVlSWHM4T0Y3ZG9Y?=
 =?utf-8?B?WkxndExKQStJVEpTMi9zZHRLZncySDNGVEpCUktEYnFGOStaYW9WZ3RqZzJN?=
 =?utf-8?B?alNaZi8rbzhsc1NUUE5VSmFrRENybitVZGpQeER3b1ZUWGJwSk5vVFZnZzdK?=
 =?utf-8?B?WHhMWHBadUlIZjd0cXptR2diNUZkM2pKZjVNODV5UkNRTVYyeC96M3FRNE1H?=
 =?utf-8?B?SlM1NHl1SkVHWVgvdENZcENPVE1KRG1DMG9DUjJQR1NjcGRYdjF5OURtODls?=
 =?utf-8?B?R0hKenRyT3o3SjNMZWI5Yk1iUWlaaW9Xa1U3NmNpaEF5YXF4VlFUS3diQkhB?=
 =?utf-8?B?R0lseHhBUDMrQTVyY2o5WjNVYm1Jdml0cDJJVThjenAvUXRPSEsvTjFVbnk0?=
 =?utf-8?B?WEFPMDhPQ1JORlBFakppOVB5ZE1GUzJzZ1RhYUhVN0swbFNoNUNVZXRaUjY5?=
 =?utf-8?B?Y0VmQXF1OW5hS0wwRFVXMTdSSk9PYktGcTZCWjBOdXkvWWM0V1NJc3o0U3Rw?=
 =?utf-8?B?MWRCNjI1T3FmNzgwZ0JpYTZNUERHVVFlVVFVR1BqSmhIdU1Cd2FJR0wyU0J4?=
 =?utf-8?B?SGdEcHJXTmFUTEMzUHdqc3BiV01jSFlXa0piRnNPemJGZTlaVElLZ1YydTY3?=
 =?utf-8?B?dERqd0FhdkswRFl6VXpJcW9FVWFWN1VZYzMvdlV0SEZJbDRzRGFmWWZlK3U5?=
 =?utf-8?B?QlB5YUFFeWtGN3BJaEdtY3ZPQzAxenh1akZSZ3RCd3NKYXpZSEJJNVdNVGdS?=
 =?utf-8?B?UDE4L3Y4SXEvV01UNVhWbGo1N0NlYmQ0QXFhbkRmLzdHQlU3ekdha1VyaUhB?=
 =?utf-8?B?L01mTXN0N0hMcHRhSC82dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7336b39e-32b2-40f3-4c50-08d8ff5376c6
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 14:42:01.5868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b+3+SAI33bBo7tRVPZFV2NjCtvzkBxU21CU3x3/sbj6DC18yzhNB6bUG5d0fvGN9RUMYZ7AghDCxMkx15E7hKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4707
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAyMS0wNC0xNCB1bSA4OjI1IGEubS4gc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+PiBTb3Jy
eSBJIHRob3VnaCB0aGF0IHRoaXMgd291bGQgYmUgb2J2aW91cyA6KQo+Pgo+PiBJJ3ZlIGFscmVh
ZHkgcHVzaGVkIHRoZSBwYXRjaCBpbiB0aGUgbW9ybmluZywgYnV0IGdvaW5nIHRvIGtlZXAgdGhh
dCBpbgo+PiBtaW5kIGZvciB0aGUgbmV4dCB0aW1lLgo+IEknbGwga2VlcCByZW1pbmRpbmcgeW91
IHRvIHBscyBlbGFib3JhdGUgbW9yZSBpbiBjb21taXQgbWVzc2FnZXMsIGl0J3MKPiBjb21pbmcg
dXAgZXZlcnkgb25jZSBpbiBhIHdoaWxlIDotKQoKSXQgd2FzIGFjdHVhbGx5IG15IHBhdGNoIGFu
ZCBjb21taXQgbWVzc2FnZS4gSSB3YXMgbm90IGF3YXJlIG9mIHRoZQpoaXN0b3J5IG9mIHRoaXMg
YnVnIG9yIHRoZSBmYWN0IHRoYXQgaXQgd2FzIGEgcmVncmVzc2lvbi4gT3RoZXJ3aXNlIEkKd291
bGQgaGF2ZSBpbmNsdWRlZCBhICJGaXhlczoiIHRhZy4gRnJvbSBteSBwb2ludCBvZiB2aWV3IGl0
IHdhcyBqdXN0IGEKcHJldHR5IG9idmlvdXMgcHJvYmxlbSBleHBvc2VkIHdoZW4gdGVzdGluZyBt
eSBETUEgbWFwcGluZyBwYXRjaCBzZXJpZXMKZm9yIEtGRC4KClJlZ2FyZHMsCsKgIEZlbGl4CgoK
Pgo+IEFsc28gaW4gZ2VuZXJhbCBJIHRoaW5rIGEgZmV3IGRheXMgb2YgbGV0dGluZyBwYXRjaGVz
IHNvYWsgb3V0IHRoZXJlLAo+IGVzcGVjaWFsbHkgc2hhcmVkIGNvZGUsIGlzIGdvb2QgY3VydGVz
eS4gU29tZSBmb2xrcyBkZW1hbmQgMiB3ZWVrcywKPiB3aGljaCBJIHRoaW5rIGlzIHRvbyBtdWNo
LCBidXQgbGVzcyB0aGFuIDI0aCBqdXN0IG1lYW5zIHlvdSdyZQo+IGd1YXJhbnRlZWQgdG8gbGVh
dmUgb3V0IGhhbGYgdGhlIGdsb2JlIHdpdGggdGhlaXIgZmVlZGJhY2suIFdoaWNoCj4gaXNuJ3Qg
Z3JlYXQuCj4KPiBEcml2ZXIgY29kZSBJIGRvbid0IGNhcmUgc2luY2UgdGhlcmUgeW91IGtub3cg
YWxsIHRoZSBzdGFrZWhvbGRlcnMgb2ZjLgo+IC1EYW5pZWwKPgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
