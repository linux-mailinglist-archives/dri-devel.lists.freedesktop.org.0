Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D67896486D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 16:30:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B836210E6BE;
	Thu, 29 Aug 2024 14:30:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sAHtI5Fk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC7810E6BF;
 Thu, 29 Aug 2024 14:30:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IBUxAQTAK873Z2FJAFqXH1XBwTuk8crLLb9cV1fYMuMdnSmSnEZSSr6iuqBuoQhLCkLRmqlrjGCz3jT9aXokNfWBuokf+DfCQYdM2U1CYtxweztRp8ip1xTf3zhc7dgrXfu0ONsVESpHB88MGgKTcGE90C10VR+BSAmMLL6wbHN+28NOfYGTOiyjkmytqpHJYpvnmFXCK7Wz64ObgJJbwfwweATju6wgn9q/TDNRmoD9Z3/zadieCFy0XwdpwlEfKkIXkVi16C2UNDbZ51/3gjJMmqtlOT6EHVsSKVixlBW3IKY2gWHgJzkY0oPuZ0ixXoVJMYQIuJubfnkUt3EhJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cm9mcvAqS+WiUFN4pf56/HlVvtzUEkAtSl8NNfsjZXA=;
 b=uFS7jEItYTjomMo3SPPEUwjW0gMDRKu6LwpmNHMCBqnStPai8zhX5r1Xl9JH6Rk7k5KHzNYH0SWymVkeJjj6QpKTGBrQuRU9KeQuZLvJaAe54NA3ISEViP8eQiFvefNcH/fVknm8HhXjx2y78snLNpqp9GoCb4oMkyAg+68D4TLv+MUioMCjEq/nvpwmJHquFCOs8FS+Nn1OZiJuYArMRD3293N14Kc8+AjGPw0IC5Vm3mkTg94zDbf7FJ85u/xGwET0M5OZmzVp4LWvwQ7RGdHN98JHtPmWQTBNapkLBj12oMn9aGlMN/EzD3Vrf0Wz4N2y8LyRBHc5YHmWqoG5og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cm9mcvAqS+WiUFN4pf56/HlVvtzUEkAtSl8NNfsjZXA=;
 b=sAHtI5FknFk2FI6csuizpERhiPkbkBPJD9/9fOhOTdw5+qWL3xwFwiusLOzDVnvcPfmwOuUd7f1KnGh7bstgfySjOZ6RVvsspnsoSHP0oxRpAqe9XaWn7/6uHrdrNIHNIVTMMzg3aTNfm3uyMZ9lrokvE+YL6nkPmSSecU4m6I0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB8903.namprd12.prod.outlook.com (2603:10b6:610:17a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Thu, 29 Aug
 2024 14:30:17 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7918.019; Thu, 29 Aug 2024
 14:30:17 +0000
Message-ID: <c7c0aea0-cbf8-48cb-829e-a9c7b1766494@amd.com>
Date: Thu, 29 Aug 2024 16:30:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 23/28] drm/xe: Add SVM VRAM migration
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, matthew.auld@intel.com, daniel@ffwll.ch,
 "Paneer Selvam, Arunpravin" <Arunpravin.PaneerSelvam@amd.com>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-24-matthew.brost@intel.com>
 <Zs9LF-jnNrd9ZlxW@phenom.ffwll.local>
 <cbe8aebe-fcad-4ff0-8f56-146628183fd3@amd.com>
 <368ee71bd5e39d4e26947de9cc417f4abe8d1f3b.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <368ee71bd5e39d4e26947de9cc417f4abe8d1f3b.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB8903:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fe145de-526d-41cf-d338-08dcc8371a75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SjNIaHRyd3UwV2FVT2ZXM0pTY0k0NUExbVRmSlpuejBNMWx3c21UTmJENTlI?=
 =?utf-8?B?dXNKeTlSZzlBWHgyaEpJQXFxQmgyZ2FDMzRQR01zYXVmaWNFTDcvRkZBNTBz?=
 =?utf-8?B?blpyMTN5ODRrSGRYQmlBZGJmUGZ0b3A5NlZuRDZpQjNmWGlNdzI2eCtYVnR5?=
 =?utf-8?B?Y0prWWgxT1kvU0lFaWNrVkkwR3FuTHVQdlloRVZzMmVrd1ZSUjlxT2ZPOFQ2?=
 =?utf-8?B?TzdzYVFhRUxKSkhyRWdBNS9MV3JZUlN1c011eU5ydzJHQ1B1SkJmemI5SmFU?=
 =?utf-8?B?cStqMzM3THR5UFlrUzZGWVpSemQyR1M4bEN1bllDT1NXYXMwOUhkSCtWdWxa?=
 =?utf-8?B?cnNpQW5mVE5jeVBTNXVKYVQ0bktiakQ1cDhFMTlwUVBKVzQzQ3draU5SSlhV?=
 =?utf-8?B?V0U5amJGZWx2aWxtZGZsSGNSc0NCMTNaZnRSRXdhRE5WWG5hbEZOdjIwcU82?=
 =?utf-8?B?d3orSzZQZjFXUE94bU04VEJ3OTFOT1ZSMGtPQWNZaSsyWmdUVGxBb3lydWwy?=
 =?utf-8?B?c2ZxcitUR1FtNlhTbTZWbElqZFFuc2pZWncyVXR2ZmlzLzhrc0VSNFNUbXJP?=
 =?utf-8?B?N2JVazJ2ZHJ0VCtoSUZzTmg0NUE0YmwyR3FjVDZvanI4aXNuMDlhR3pkK2xL?=
 =?utf-8?B?NWIxMXFrVEFNd1VpWmVmZWRkK0ZGc2ZRQXlEK0xvNnF4NFNHeUMvbG1HM2FK?=
 =?utf-8?B?cVZjUzg1MjVXSzdILzlqVS9jS2JnQ0dKSTV1VzQ5UHpLZHREeGJrMzcySlE1?=
 =?utf-8?B?ZTc4MXpkbGNpRGNPZk5MZ09GcnBkcitWY3FPMkxXZHVDUjZFTGxLa0xrTWdX?=
 =?utf-8?B?L0dXaytxbkptMU5TOHRLRlFHc0NCRlVpZEx5amU1enZicFdhODZrNjlFRm51?=
 =?utf-8?B?VDhsT3pzaUZEL2JCOURNckRDeHczUGRjOE1sME9sSXFCMGN5VnpzWHZrSnhD?=
 =?utf-8?B?d2x5SkYxSC8ydC8vT1ZFbVA1WUlrMFJLZEU2TWZoWHdIZjdkWVBGKzFCdU5G?=
 =?utf-8?B?N1BHcFoxV3ZqVTluUTRZejlmSlVXVHNwYlJraDJybkd5cU1XbE5oOGFrVzVv?=
 =?utf-8?B?R0RVWjUxSmxzM2hOTlQzVlpUbUMwdEYzNXg1LzExREd2R3ZPVjY4bkMwKzFX?=
 =?utf-8?B?aEF0TW51Y2lkaC8yUlo4YzlOTGkxZzJBU05ET3JkWGRlV3hOWTdiWlc5RVRU?=
 =?utf-8?B?OVUva0hWNXArNzl3bU1HV3Foa0dCZGIrQU04azNzdzM1Ymp6djlsb0xjV1V1?=
 =?utf-8?B?ckpmMi9ZTkJDcGRXS2NiYlZmRE5PWmd5MDNuMzEyNVBlT2JydGZ4RWNHS08z?=
 =?utf-8?B?QUc4cGp3SHREWnVMMmxWb2p1S1ZLeDRQWE5PMm03SktXYnFqd3BZd0hOTDg3?=
 =?utf-8?B?M3lDYjRwYWljeEpmUUpHeURuMHkvKzRmcFBsU2V3K041cXlOUnlqSENNZGpD?=
 =?utf-8?B?TEJBT0hwbFR5QXpXcFdRQjdGMmp3VnFXZ0FURTdjQi9aaTZqaFJYdi9xMGxu?=
 =?utf-8?B?b2RIRjJlcVM5UjVQKzJyYWE4NXRVay8wcmEzcWh3eENSMnE4ckJWaE42T0ZV?=
 =?utf-8?B?RmJ4NVU0U2QzcVRhWlNoMDArRldUYWRhRnN4ejRJYmFxRlhueXVVSGV1cnlv?=
 =?utf-8?B?eU12TzQwQXlBL2ZYczBqQVZsaVNlbHJWN0Jyei9IQUQvd29YMlJTRHFRSmhM?=
 =?utf-8?B?TlhWSmNudmREa0NCdTVqdmtXOG5aaVo4M2pjWGtWWXpqK0FtVmUzSThHWmNz?=
 =?utf-8?Q?6MPZJMcqbgsG5ErodA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2JXWUtzV2JEUDVKSlFPNkpWZFdOT2d3YVc1bG9scDdhb0x5VGNnb3JkMUYr?=
 =?utf-8?B?OU1PRGRJaldCYlRGSUxmbGVVN3NBSHhNbUNRVWNNNDJBVEdiWCtSWmZXWFAy?=
 =?utf-8?B?d0FOZTRuTXhCUVE5YnpFaEI0Q3BTUXZjRnJNTm1qRDk1dDRNSzVYU0FEcWVG?=
 =?utf-8?B?cmJBcVFkRGg0L3Y1a3hDamQ0V0ExeU41TXF4Mm1hdER0dWliQ1hJN1RmQlpO?=
 =?utf-8?B?QksxSWk5OFFqNzFmd0ZDaCtDdXlHZUd5N3V6UjJqcHhZSVhtSTZPWCs4TXU2?=
 =?utf-8?B?aGdBTGYzR3NtVUNyNCtPcjZwc1dXUVJqVEZQaFR2b1JmSndvTTdGRlVvcnhK?=
 =?utf-8?B?OVBOSlJ1UnM2TDZlK1pOWlphd3pTRS91d21LdzErNHJvc044QVNNWTNPdDJv?=
 =?utf-8?B?NXlyZGVzVTRoNTgvYzMzTzJsRWZxTVZrdUE1WlBHcXl2ODRKQVFxN090YjRH?=
 =?utf-8?B?WjVIUTIvc3VvZ3JFMXlrOTVrVllWTlNFODVKOHBVNlcwVFNraW5RZTdxZmNh?=
 =?utf-8?B?aFJ1M0FENEZja0doSEk3eEFuRHBMOFZmaWVOVXcxNVUxSEl0aFc2NUhJMUdM?=
 =?utf-8?B?OTBIWmZuaE9GNXlSQmk4cmlXTjhKM01TUG1BK29ZRzk3TTZ1WVdUMFlEQ3RU?=
 =?utf-8?B?QVZxOTgydEs5T3hCN2QxQU9oTDZkdUZaazJLV2dmblIxa2FtVS9Dc0xmTllG?=
 =?utf-8?B?WFlSL2V1YndNa05tS1FoT0FEdjVNK0xyNjdHRUJLSFlUa2FNVVFFN3JYZ1hO?=
 =?utf-8?B?VmZkZEplU2Z4ZmdXek5VOWZxOWp3MnJMSDl0bUV0cUxZeWxlMnhaZ2QxOXNG?=
 =?utf-8?B?VUpaYnVxYnY5OHJLQTFjVisyaVdsc25DUzJYOGlFWEcvaEh2RGlNSTE3WFVW?=
 =?utf-8?B?dDEyNzhzZjJYRHVRV3dlRU1WeGVsY2ZPYnpNZE5zdFFXV0dMWWlPdno4WjNH?=
 =?utf-8?B?RVFxSXpjZEh0MENsb3R3MDhSSWM4YTJYT2Y4Zk00WGdhbnpXMW9mK2RJSi81?=
 =?utf-8?B?MHNqekFzck1FNTdYMlp4bkhKTkdYSGtjSFlETG5uMnVkOWZ1NDA5eXhSbzVo?=
 =?utf-8?B?ZlRicGhXaTBPbVZ6VUsxakRYbW41ZFJxS3JLY0ZYN3NBL0pVRTIrY3gvMVFV?=
 =?utf-8?B?b3FjNHVlWG1KcDRldThmeXpCT0hzWC9CRzNzZ0xXVkF1VFJBSWlIV1FoS1hD?=
 =?utf-8?B?bHRCNlpJdm9wSm95dW9DMEJpc2QvYitvWWJETzlrNjN0L1BJcWw4bzhQZVND?=
 =?utf-8?B?U0NTWjkwNEI0Q0I0SUFKOGZQbWtNemdCdEZjQ0hYSEEySWZkZDQvL3BWMldJ?=
 =?utf-8?B?QUVxUCtnb3BBODV6RUJzZU9kUHhyaUxVekpaQ3lrZ2RVeGNIUnp4eU1XakVx?=
 =?utf-8?B?RXNFVDNZa1BiTXZ0eUg2aU9YVkNPQ050eW1VZDhudEg2WVFZRDdzRU1mN3N2?=
 =?utf-8?B?emxBbEtjcFQyMFkyd3JyY1JmUmNCUlV5K0ZnVzg0SGt6NXJNbmN2QVYvNnlW?=
 =?utf-8?B?Vkl2S1ROTlZWZExmREhlUHRra2NjQVd3UTBidzlBc1QrMzhIclJIVCtOZFZO?=
 =?utf-8?B?eTlvb1BoekpjdkJPRnk2ajAvblRtMUdTQVFXWHZ5eVhYak9BYldZL21IbjBO?=
 =?utf-8?B?SnBIbElvZXZxUTl5bldDVHFqNmpLNXZsa1NBRGxrcmhBTStROGlVbGtFNzA3?=
 =?utf-8?B?V1hsRDlvKzJLb05mSW5pUjB4aXFORVRlQmkwRUt0RnNHdjd2a2ZVZnc5bzhp?=
 =?utf-8?B?TzlZeGorRngrbkdGSlFNSXU4Wi82VjRpeHJ6M2ZIREp0bk41MzlCMUlYWm1o?=
 =?utf-8?B?dmxtVE5xeGxaV2YzVm9oNlhnQXRJb2lZSzZOeGxQeTZWRFo1cTV6NnpjYjVy?=
 =?utf-8?B?M0xlMFdNTmdjeGZ5SkNmT3pJaGVyQ1hRekhGN3kvYkpkN1dDdW5zcUd2TnhD?=
 =?utf-8?B?akZOV0NhZytmRFBIYWFwS3h4VWI4MHFmNEorTzhkeHEybGhmVTd0NzR0R2JM?=
 =?utf-8?B?SExYMHlPTDhGYnN3dE5kOFc0Q2JZMHR1OS9XMFVlKzROdXE3SkxnNHJRU2g1?=
 =?utf-8?B?Qzk2dlhqSmhoak92YWdrWlppMW1YRkt3Z1pGWG5vL3l2Y1NKWHh1cGJsU3I0?=
 =?utf-8?Q?Cze5BJTifOruavQ3Mva4z77/x?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fe145de-526d-41cf-d338-08dcc8371a75
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 14:30:17.3683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DNGjRrO1KFKlzr2vOFwVLyb0oZ0Zs2EZKfQhPxrMLXIf5YJLDiO0EGF9EzIUO+WF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8903
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



Am 29.08.24 um 11:53 schrieb Thomas Hellström:
> Hi, Christian,
>
> On Thu, 2024-08-29 at 11:24 +0200, Christian König wrote:
> ...
>
>>>> - Unified eviction is required (SVM VRAM and TTM BOs need to be
>>>> able to
>>>>     evict each other).
>>> So core mm handles this by just roughly equally shrinking
>>> everything.
>>> Seems to work, and it has a pile of object shrinkers, and the page
>>> lru is
>>> also split into page cache and anon memory.
>>>
>>> I think you need to put in more justification that unified eviction
>>> is
>>> required than just stating it, because a look at mm/ gives a very
>>> well
>>> established counterexample.
>>>
>>>> - For exhaustive eviction [1], SVM VRAM allocations will almost
>>>> certainly
>>>>     require a dma-resv.
>>> So from the TTM side we need exhaustive eviction, or at least
>>> something a
>>> bit more exhaustive than what ttm currently has. Note that i915-gem
>>> also
>>> never really got to perfect exhaustive eviction, it's just a pile
>>> better
>>> than ttm right now.
>> Please define what exhaustive eviction should mean? I think I know
>> what
>> it is and I have been pushing TTM into the direction of solving this
>> for
>> years.
> We internally refer to exhaustive eviction being a client is always
> guaranteed to eventually make progress in obtaining non-pinned vram,
> typically by incrementally locking and keeping dma-resvs across a
> single validation including validations during buffer object
> allocations.
>
>> The last missing puzzle piece is to use drm_exec for TTM evictions,
> and IMO keeping the dma-resv locks grabbed during eviction until at
> least one unit of progress (one validation) has succeeded.

Yes, exactly that. My guessed understanding was actually correct.

>
>> but
>> apart from that everything should work now.
>>
>>
>> Regards,
>> Christian.
> But as Sima pointed out in private communication, exhaustive eviction
> is not really needed for faulting to make (crawling) progress.
> Watermarks and VRAM trylock shrinking should suffice, since we're
> strictly only required to service a single gpu page granule at a time.

Yeah fault based memory management should be able to keep working as 
long as the page isn't re-migrated before you make any progress.

Since the number of VRAM or system memory pages is very high that should 
basically never happen.

> However, ordinary bo-based jobs would still like to be able to
> completely evict SVM vram. Whether that is important enough to strive
> for is ofc up for discussion.

Yes, exactly that. Felix, Alex, a bunch of other AMD folks and I came up 
with the same conclusion at AMD internally as well.

Regards,
Christian.

>
> /Thomas
>
>
>
>>> Now if there's also SVM VRAM managed on a page lru, TTM exhaustive
>>> eviction is going to win because the shrinkers can only trylock
>>> dma_resv.
>>> So this part works. It actually works so well on the system memory
>>> side
>>> that if we're not careful we can trigger oom, because we're too
>>> good at
>>> getting at all the memory.
>>>
>>> SVM VRAM allocations otoh do not need exhaustive evictions. Or at
>>> least I
>>> don't see why, because the idea is that thanks to gpu and cpu page
>>> faults,
>>> you can always get out of a pinch by just trashing everything for a
>>> while
>>> and migrating the handfull of available pages a lot.
>>>
>>>> - Likely allocation size is 2M which makes of size of BO (872)
>>>>     acceptable per allocation (872 / 2M == .0004158).
>>>>
>>>> With this, using TTM BO for VRAM backing store seems to be an
>>>> obvious
>>>> choice as it allows leveraging of the TTM eviction code.
>>> Except it requires that you hold dma_resv, which brings in all
>>> kinds of
>>> pain. And for eviction we really don't need a lot of
>>> synchronization, so a
>>> lot of that locking is not needed, unlike the case where we have a
>>> cpu
>>> fault, where we absolutely need mmap_lock and all that to make sure
>>> we
>>> fault in the right page.
>>>
>>> But for eviction we only need to throw out some pages, if we're not
>>> entirely precise with picking the right ones (or have no idea into
>>> which
>>> vma they're all currently mapped into) it doesn't matter. That's
>>> why
>>> migrate_device_pages doesn't care about any of that at all, it
>>> doesn't
>>> need to by design. But by bo backing memory you drag in all that
>>> stuff
>>> that's causing headacheds for eviction.
>>>
>>> The only thing migration tries to do is remove all pte, and if that
>>> succeeds, move the page. Specialized for the gpusvm case, looking
>>> at mm/
>>> code as cheat sheet, we need roughly:
>>>
>>> - reverse mapping structure like anon_vma. Except gpusvm can assume
>>> that
>>>     there's currently only one gpu side mapping, so we can just
>>> stuff the
>>>     gpusvm an va_address into the page, and protect it with the page
>>> lock.
>>>
>>> - we need pagetable locks, so that we can manipulate pagetables
>>> (well
>>>     specifically make ptes invalid) without taking any other locks.
>>>
>>> - everyone else inserting or removing ptes for svm mappings also
>>> needs to
>>>     lock the page, or we have races. This might be the
>>> hmm_range_fault races
>>>     you're seeing when allowing vram pages, since I don't think
>>> there's
>>>     anything else stopping the page lookup otherwise from
>>> succeeding.
>>>
>>> - we might also need to stuff migrate ptes into the gpu side, like
>>> the cpu
>>>     does, to hold up refaults before the migration has finished. But
>>> I think
>>>     those are only needed for anon memory in sram because there's no
>>> other
>>>     way to find the right page than swap pte entries, of which
>>> migration
>>>     entries are a special case.
>>>
>>> - core code also expects us to handle the page refcount correctly
>>> for svm
>>>     device memory, so we can't free the pages like normal bo pages
>>> either
>>>     directly to drm_buddy.
>>>
>>> Now typing this all up will look an awful lot like what you have,
>>> with the
>>> dma_resv lock serving as the page lock and the pagetable lock. The
>>> only
>>> reason is that these locks are much smaller and nest within all the
>>> other
>>> stuff going on and so avoid the inversion issues.
>>>
>>> So one annoying part is that this is a lot of pointlessly looking
>>> typing.
>>> The other is that it's full of races, because core mm really is
>>> yolo all
>>> the way down. So lots of ways you lock the wrong page and fun stuff
>>> like
>>> that, but the few cases that matter work:
>>>
>>> - svm fault handling with hmm_range fault retries with mmu
>>> notifiers. Note
>>>     that we need to have vram pages locked and the notifier retrie
>>> needs to
>>>     be under the pagetable lock, or there's room to escape. At least
>>> that's
>>>     what I came up with last time I thought it all through.
>>>
>>> - migrate_to_ram: it will hold a page reference which we know was
>>> the
>>>     valid vram page when the cpu pte was locked, but it might not be
>>> it
>>>     anymore. So we have to lock the page and check whether it's
>>> still gpu
>>>     mapped, and if not retry the entire fault since most likey
>>> another
>>>     migrate_to_ram has succeed meanwhile in parallel.
>>>
>>> - for eviction we don't care, we might actually be migrating a page
>>> no one
>>>     even wants anymore.
>>>
>>> Now I think you can get all this done with the dma_resv lock and
>>> maybe the
>>> bo refcount. But it does involve a tremendous amount of headaches
>>> and
>>> impendence mismatch, because that's not how page faults and
>>> migrations
>>> work in core mm.
>>>
>>> Cheers, Sima
>>>
>>>> Current migration policy is migrate any SVM range greater than or
>>>> equal
>>>> to 64k once.
>>>>
>>>> [1]https://patchwork.freedesktop.org/series/133643/
>>>>
>>>> Signed-off-by: Matthew Brostmatthew.brost@intel.com
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_svm.c | 81
>>>> ++++++++++++++++++++++++++++++++++++-
>>>>    drivers/gpu/drm/xe/xe_svm.h |  1 +
>>>>    2 files changed, 81 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_svm.c
>>>> b/drivers/gpu/drm/xe/xe_svm.c
>>>> index 4372c02a341f..fd8987e0a506 100644
>>>> --- a/drivers/gpu/drm/xe/xe_svm.c
>>>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>>>> @@ -217,8 +217,13 @@ static void xe_svm_invalidate(struct
>>>> drm_gpusvm *gpusvm,
>>>>    static int __xe_svm_garbage_collector(struct xe_vm *vm,
>>>>    				      struct xe_svm_range
>>>> *range)
>>>>    {
>>>> +	struct drm_gpusvm_ctx ctx = {};
>>>>    	struct dma_fence *fence;
>>>>    
>>>> +	/* Evict any pages holding references to vram allocation
>>>> */
>>>> +	if (range->base.flags.partial_unmap && IS_DGFX(vm->xe))
>>>> +		drm_gpusvm_migrate_to_sram(&vm->svm.gpusvm,
>>>> &range->base, &ctx);
>>>> +
>>>>    	xe_vm_lock(vm, false);
>>>>    	fence = xe_vm_range_unbind(vm, range);
>>>>    	xe_vm_unlock(vm);
>>>> @@ -504,21 +509,77 @@ static bool xe_svm_range_is_valid(struct
>>>> xe_svm_range *range,
>>>>    	return (range->tile_present & ~range->tile_invalidated)
>>>> & BIT(tile->id);
>>>>    }
>>>>    
>>>> +static struct xe_mem_region *tile_to_mr(struct xe_tile *tile)
>>>> +{
>>>> +	return &tile->mem.vram;
>>>> +}
>>>> +
>>>> +static struct xe_bo *xe_svm_alloc_vram(struct xe_vm *vm, struct
>>>> xe_tile *tile,
>>>> +				       struct xe_svm_range
>>>> *range,
>>>> +				       const struct
>>>> drm_gpusvm_ctx *ctx)
>>>> +{
>>>> +	struct xe_mem_region *mr = tile_to_mr(tile);
>>>> +	struct drm_buddy_block *block;
>>>> +	struct list_head *blocks;
>>>> +	struct xe_bo *bo;
>>>> +	ktime_t end = 0;
>>>> +	int err;
>>>> +
>>>> +retry:
>>>> +	xe_vm_lock(vm, false);
>>>> +	bo = xe_bo_create(tile_to_xe(tile), tile, vm, range-
>>>>> base.va.end -
>>>> +			  range->base.va.start,
>>>> ttm_bo_type_device,
>>>> +			  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>>>> +			  XE_BO_FLAG_SYSTEM_ALLOC |
>>>> XE_BO_FLAG_SKIP_CLEAR);
>>>> +	xe_vm_unlock(vm);
>>>> +	if (IS_ERR(bo)) {
>>>> +		err = PTR_ERR(bo);
>>>> +		if (xe_vm_validate_should_retry(NULL, err,
>>>> &end))
>>>> +			goto retry;
>>>> +		return bo;
>>>> +	}
>>>> +
>>>> +	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)-
>>>>> blocks;
>>>> +	list_for_each_entry(block, blocks, link)
>>>> +		block->private = mr;
>>>> +
>>>> +	/*
>>>> +	 * Take ref because as soon as
>>>> drm_gpusvm_migrate_to_vram succeeds the
>>>> +	 * creation ref can be dropped upon CPU fault or unmap.
>>>> +	 */
>>>> +	xe_bo_get(bo);
>>>> +
>>>> +	err = drm_gpusvm_migrate_to_vram(&vm->svm.gpusvm,
>>>> &range->base,
>>>> +					 bo, ctx);
>>>> +	if (err) {
>>>> +		xe_bo_put(bo);	/* Local ref */
>>>> +		xe_bo_put(bo);	/* Creation ref */
>>>> +		return ERR_PTR(err);
>>>> +	}
>>>> +
>>>> +	return bo;
>>>> +}
>>>> +
>>>>    int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma
>>>> *vma,
>>>>    			    struct xe_tile *tile, u64
>>>> fault_addr,
>>>>    			    bool atomic)
>>>>    {
>>>> -	struct drm_gpusvm_ctx ctx = { .read_only =
>>>> xe_vma_read_only(vma), };
>>>> +	struct drm_gpusvm_ctx ctx = { .read_only =
>>>> xe_vma_read_only(vma),
>>>> +		.vram_possible = IS_DGFX(vm->xe), };
>>>>    	struct xe_svm_range *range;
>>>>    	struct drm_gpusvm_range *r;
>>>>    	struct drm_exec exec;
>>>>    	struct dma_fence *fence;
>>>> +	struct xe_bo *bo = NULL;
>>>>    	ktime_t end = 0;
>>>>    	int err;
>>>>    
>>>>    	lockdep_assert_held_write(&vm->lock);
>>>>    
>>>>    retry:
>>>> +	xe_bo_put(bo);
>>>> +	bo = NULL;
>>>> +
>>>>    	/* Always process UNMAPs first so view SVM ranges is
>>>> current */
>>>>    	err = xe_svm_garbage_collector(vm);
>>>>    	if (err)
>>>> @@ -534,6 +595,22 @@ int xe_svm_handle_pagefault(struct xe_vm
>>>> *vm, struct xe_vma *vma,
>>>>    	if (xe_svm_range_is_valid(range, tile))
>>>>    		return 0;
>>>>    
>>>> +	/* XXX: Add migration policy, for now migrate range once
>>>> */
>>>> +	if (IS_DGFX(vm->xe) && !range->migrated &&
>>>> +	    range->base.flags.migrate_vram &&
>>>> +	    (range->base.va.end - range->base.va.start) >=
>>>> SZ_64K) {
>>>> +		range->migrated = true;
>>>> +
>>>> +		bo = xe_svm_alloc_vram(vm, tile, range, &ctx);
>>>> +		if (IS_ERR(bo)) {
>>>> +			drm_info(&vm->xe->drm,
>>>> +				 "VRAM allocation failed,
>>>> falling back to retrying, asid=%u, errno %ld\n",
>>>> +				 vm->usm.asid, PTR_ERR(bo));
>>>> +			bo = NULL;
>>>> +			goto retry;
>>>> +		}
>>>> +	}
>>>> +
>>>>    	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r,
>>>> &ctx);
>>>>    	if (err == -EFAULT || err == -EPERM)	/* Corner where
>>>> CPU mappings have change */
>>>>    	       goto retry;
>>>> @@ -567,6 +644,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
>>>> struct xe_vma *vma,
>>>>    	dma_fence_put(fence);
>>>>    
>>>>    err_out:
>>>> +	xe_bo_put(bo);
>>>> +
>>>>    	return err;
>>>>    }
>>>>    
>>>> diff --git a/drivers/gpu/drm/xe/xe_svm.h
>>>> b/drivers/gpu/drm/xe/xe_svm.h
>>>> index 8b72e91cc37d..3f432483a230 100644
>>>> --- a/drivers/gpu/drm/xe/xe_svm.h
>>>> +++ b/drivers/gpu/drm/xe/xe_svm.h
>>>> @@ -18,6 +18,7 @@ struct xe_svm_range {
>>>>    	struct list_head garbage_collector_link;
>>>>    	u8 tile_present;
>>>>    	u8 tile_invalidated;
>>>> +	u8 migrated	:1;
>>>>    };
>>>>    
>>>>    int xe_devm_add(struct xe_tile *tile, struct xe_mem_region
>>>> *mr);
>>>> -- 
>>>> 2.34.1
>>>>

