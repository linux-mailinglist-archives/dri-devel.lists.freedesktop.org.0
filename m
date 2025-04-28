Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F36A9F1ED
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 15:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6024B10E1C5;
	Mon, 28 Apr 2025 13:16:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PZ+7ueyL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38CF10E1C5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 13:16:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bGutCzuRppWyTebRFuir0W+FXfkmKMTCtuBGlJhzuWn7/YMxL+Ba/M0Vt0/viykozt3CTMIrNWI4qJ+WPyhaBRgy4OY78TgTOqXd340D9Y+jHAkAQXXJcyLGlr4Usytzi+FcZYsbiL0LKfmxVdlRq9av5JE+1eXOJQ8cN7sYRvPejNuiEF5Bw2o16ejjRKdBsil6KLZG1unQiGi9+goUz4h6ntvrYTrIm6oMdwvOSKBTDoBiXa0Tv8y2sfa1IDs/4gDhYtIwyWd9zvQN8+EMzy7/BhKV0wW5FQQC+CaAMG5kaQTSiyjG4iVeQkvd/mNv9wp0XECwYS7jI3iZwCNqZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTY2XzGtNaPzeMNYw5t7ibk2OZgzQSJna+jjunejNlc=;
 b=Cy/G8lTNyyzpIQXqISiAKVPFvuFHjtFKsjOKLjXEhCmsFB0xuxuTesv8zeEGRRookjgcT8uxSLW3TNlAajb4HJn+ajnBWymV3RE3V9XTy2d0vcs1ZIxqE9LliR/y97uX1EO9fd0icw2Ceafmy98dZmhzRd6FMWjwp7wPxERyuFem4dt5PesNM82X6sy27DwFsLmtdwK7nfF5Bm48wIswtdwE9WO8Sjc86BK+mrmvK/73v47AGsuBYXZcGDu99z2DQ0YXW9l6KlLgaSbJmeulGlACtLFTH3b+mrv2MBCnEfL+02U9wwDmXJ7WkwD2+vp/q//DCJ9ciBIvzzNtwTjkMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTY2XzGtNaPzeMNYw5t7ibk2OZgzQSJna+jjunejNlc=;
 b=PZ+7ueyLXfm9ROdvqZylFz/3s7wTrASHFvwtHT8FX1KUAjQ3bdquVVT08z/0QDRxbl+Y5eRWWZMaJGzSPT9wsFDN73ETqXRH0dorKflMpgPCWYYpsR+1bIIYTgXJ3vIYbmsil/4XPfXIrPdtCtd3mX1rBKVAJXxfZixjRe9MtjU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB6262.namprd12.prod.outlook.com (2603:10b6:8:96::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.29; Mon, 28 Apr 2025 13:16:06 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 13:16:06 +0000
Message-ID: <ff76a94e-97cd-4d19-a02b-cf2a1fc00ac8@amd.com>
Date: Mon, 28 Apr 2025 15:15:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/4] Some (drm_sched_|dma_)fence lifetime issues
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Philipp Stanner
 <phasta@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250418164246.72426-1-tvrtko.ursulin@igalia.com>
 <29b27ae3-de56-475d-ae85-fd593a011ea3@amd.com>
 <e4acf86d-ff22-423d-9769-80316fa96cb5@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <e4acf86d-ff22-423d-9769-80316fa96cb5@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN0PR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:208:52d::21) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB6262:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e180db7-0c22-4ac2-7dcb-08dd8656d536
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OTYxdXNsL3lpeCsreVBFY2VBTm1zZGxCZzlyaGtxSWZxR2tDaENFMmw5OWth?=
 =?utf-8?B?TVY4NnNYSUhZMDhnU2FFZE5GUFNrNkhDUDNpYXRyZ3B0aURjQnpwMmRoZlFW?=
 =?utf-8?B?TkRnWFltelFxS0xFclhhdnNwaElMRzRiOEd0TzREU21LRkQzcE5NSVpwRERT?=
 =?utf-8?B?YWhrcTh0OUUrNEdmWXlkaVpTZ2NHTXZXVkFVZnppVGNHTkhLM3JybnBCZThF?=
 =?utf-8?B?blVUMllVZ2hseDM5MXlaK1JIZlhpNEJIV3RRQzdiNk85c2Nsa0ZzZEdSeS80?=
 =?utf-8?B?RUYxMWNKN1MwMzczQzNqRnZrSFJaR1JRWlNJZHl0Vm85RHRVSFQ4MmVLSUtp?=
 =?utf-8?B?Y1c5WWw1L2xKWlJWWUkrU0xSNXlLcG4zNWFSYmZvZGFhSVBCZVpZQjNFZ1hB?=
 =?utf-8?B?cm4zMms3M2RBVzBFY3pzZ2xkUUN6bXM4dzBaaklZN2dBQ05rSVpPSEJzV1lF?=
 =?utf-8?B?MGswWXBJd2FteHJvTzN5SjFkbnVRYWhReFAwTWR2ZFNDKzFxeUZ6T0gyRXcz?=
 =?utf-8?B?L2R6Q0JVb25VVDJWU05oWS91V0RvNm1lSEkwUUZSVElEbklyc3ZUVjlhclE5?=
 =?utf-8?B?UnhnWkRBT1JGZFlPenkzTXlxRHg5TXpsak0razJOUG50Ty9iMHhyelNVOHJl?=
 =?utf-8?B?V0hzYTlHRUUwT3RvWWJzNXliVmdqU1JGRlU1NytwajJKQUJ0bmFLcmdKZ2ZU?=
 =?utf-8?B?QVV4d242ZUQwVU9lQnMrQkpuQTNDdUV3bjRGcTJFcmZxanJuVXB1eTJKRjhN?=
 =?utf-8?B?R0lKYzl2TkRJMWt0by9sMWtmdFd2RjVuMnhiYVJjSEl1UjB3MDBFSlhHNXBO?=
 =?utf-8?B?R0ZsK09HU21UcTVNdDU2aDJtN0NvN3EvcUh3aWdITmZXQkZPZFdIanNLOVdz?=
 =?utf-8?B?cis5RFdnWk9XUTlMQlQwMmxTUU5GUDBFbGF6OVl5U3I1NVVpZSsrMlVwdEZ6?=
 =?utf-8?B?Y2VoSGZxT3JrOU9vc25EZW5rYjNwc1BtYTRrR2dRUlpLTEFvWmM5VStQNVMx?=
 =?utf-8?B?czV4OWFZa2hVLzRtQlhuZ2dWTTduancxSEhzR3oraFRRS3k0Uk16dU90L0N2?=
 =?utf-8?B?M2RyMGxuR1kzUDRXNmQ1aEpQWWVaS2g1QVdoRlMxajc4SmRDaVVUUnMyTm1m?=
 =?utf-8?B?SFR0MHhuR295RzRIN1VzUlUraGlpWGViWGxXU0l0WVBMcTdOR2VVbWdQMmRF?=
 =?utf-8?B?eUZweXNqRTg5NUZ2R0RHTlVpZmwwU1o0N1F2eWNVK003ZFYwMVMyTlljWHA0?=
 =?utf-8?B?aGNqTE1mUWJwTGFocnBFR2szeG1LMFphbnlRQ3Zwd01jeXB3QnM2QWdWU2Nz?=
 =?utf-8?B?cmRoZGtWc2svRkxQQVFDZ1ZwM3NlcXAvSG15QXpTNVhPOHUycVNrOWRzS3Nn?=
 =?utf-8?B?REZKSEpiQk5Lc01OSERIRG13MEQxVkJKR29ISlk0Qm5nWkc2azFKalFxT0Yy?=
 =?utf-8?B?WXA1YWxuZml4NGlrTFQ5eTZEb2ZvaU5ocWptU2Zteld2akgrMXVoVFpYaXRE?=
 =?utf-8?B?VmovWUF3ekZMdjR5c1RpUXQ3S3R2bHIwSGZvZlFIQmNqbDEzNnhpbkpmNVBs?=
 =?utf-8?B?SlRTbXBCTklJanVaa0tqL2RoSTUrWFAvVlRCVzI4QWhEREJ1YXluUGNHRHd0?=
 =?utf-8?B?d2pHV2s4a1NsSWRUOWIxNXRqamxYSytpVGVSbFN5WUJzVkNHSFluYWpMVm01?=
 =?utf-8?B?TFYxZ2wzY2greXlqa3F5NWREOXo5bVBWNy9DSk1KY1VvQkllUFA0encyeGVQ?=
 =?utf-8?B?ajd0Q09PZ0JrN2hSUFU4RGVZNVV6bDM3cmVpK1kyY3E2aVBHcUk1Y3ZuOG5U?=
 =?utf-8?Q?kdY14mGc4rkJZfxRCzf+/ryubmO0LG7BcNikQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmUrTDJrNTZQaU1vQUpSYUtSSlZQYXBGcjFoQTdKTDVRSDdZM2dPZGJHU3oz?=
 =?utf-8?B?eHluOHc2YkFzeERFV1l0TEtxd0UxZDZWWUJVNENPdU1DbnF5ampZOE16MDlp?=
 =?utf-8?B?RVBBdk9HZ0Z6MExOTTBSWEIxVEVUUnF6WThHb0x0QlJEVXQ5UEVlYW1KWGJ5?=
 =?utf-8?B?Z3drYnIvMU56bEVCYW9rV3Q3NDd3eldFRUlIOVhXdndnQ3ZiVE5YUVQ1SFVk?=
 =?utf-8?B?UC9aUDdJcGNZTWxtZ0pqTVUxVWt5bjBGcStYYUJRbVM2SVFRMktqaFowMEYr?=
 =?utf-8?B?c2lTbEZrZDlMeDZYSGRmMXlselFKVmhPTGlHakdqRUVPd3V2cWloZXhtL1ZB?=
 =?utf-8?B?VkNRd1ZoRllWa1dpVmxPYlo4dXdLbXNxbnNybHZ1YWN0QlJrVnB3VjNlcTBG?=
 =?utf-8?B?bmwwdXNlV1FHU2ZUSWQ3YVlBazBvVDdhdkNYekg5QzJCc0lVM3hHNjMrMytW?=
 =?utf-8?B?TGhsOFdnZkNmdHhNN21VcEV1UWlKT0tlWU1GY2F3QkJkSTA0dXNBNkltak9G?=
 =?utf-8?B?OUJUMVlZMjdkTTg3a1JPVzc3bFJZQkRnMnFxdTArbjFuY2MxSnJUbzVHZGEv?=
 =?utf-8?B?VHJWRUk2Qk5KbC92T1Q5SVFkVTBzM25OMndleUtjN0h2WVV0dlh6dDdSc0ww?=
 =?utf-8?B?TnhpM0Y4eDU5WUlPTDJSUjRRb3VyUHlpZ2dtbWJ0aFhmd3NMVUhSTThySWNL?=
 =?utf-8?B?eUNmK3M0dE5NaEE4bEdJNXlkVmRhQ25RWGR0N21YUEFTZ3MvQ25qRWlRdnBJ?=
 =?utf-8?B?U1BWRjVidlRnczAwVG11b25EOVBWOVJ0UzhMdGc0RDhyZzE2clNGQTN5QURY?=
 =?utf-8?B?WDJsaitkSTlHQnJQQldWMUljTHhIQmQyYm5XSzRMM2QwNElpZ0dCUnh4NzRN?=
 =?utf-8?B?WCtPdnVrM3p5NXh4dWRUSjB0cXQyRWFjWm1iWVdoUEVXeTNJbEkwVk5vTUVT?=
 =?utf-8?B?cXpyNHAzeDFnZTYxRkJOZmcxQmpCT29KWU9NSDNZdm1rYTI1bnhRVVhKcDND?=
 =?utf-8?B?NTVTQTBwYmVCRlBiNWsraElOVm1EQm5HVTI0Mk5uemJ4dW9jRExSZVI3cUtM?=
 =?utf-8?B?WWw1UnlZWmVIeG1VeTFzV1UxUGVVNWtFTnI2V0JudUJOOFp5TEtqeDZienpM?=
 =?utf-8?B?K0plc01TNTJNbHJXYmJMaDRwcnBNSVNWdlBZZ3NqVGEzWkxpTEZFY21PdjI2?=
 =?utf-8?B?OEVlRW9QdEgzS2JnbHNVZDYwdlMvTnhpdXBqMU1KVzIxWTZzQm9vWGxPN3B3?=
 =?utf-8?B?U0ZIbUFaZUk3SncwNnRSU2ozRkZZakg5OUl1Y1N2dkttV002OHpnd1FhL0lS?=
 =?utf-8?B?Sm9MaDBwL2lZV0diK2w2NU9VdlZxbjJzSDVRUnFvRWFMWG9DUGtmVmw0aFZV?=
 =?utf-8?B?ZGFBL0tLRUoxcnE2ZHdPUnUyb1FUUUQ3Myt0KzVCeDNGNWNVQy9tSWRxMFhK?=
 =?utf-8?B?T1dFcTRoRWVWNm94Nkk4RjhnaXZyZW1JVi9lcVBodUNDbGFpZldpVTNEbTFG?=
 =?utf-8?B?dE1CMFM1TlN1VFhUcVBzSmlaTStLbkJtL2dreTdRTnJ1MEV5cVZHZ0VQc3pj?=
 =?utf-8?B?YkNUSHFNaTQrSHg0MWZQVzlWbkR6S0lyWDhtMGFWaTZZcWczSWtMWlZuMURt?=
 =?utf-8?B?UzB4cC9WNEdxK3RBL0RMc2tZYXFtTHp3aDFTREZVeXVEY1ZpTEdBUjduSTM2?=
 =?utf-8?B?YTZBRVdyTjdpU3RKMmNKTExFVUE2RGQ4d3pNQ2dBVktJMUhpVlpxUkwyQzVJ?=
 =?utf-8?B?eFR3SnpNUkFGNmhWWG5QS2lQYXhNWDEweDZPcWV1QXJrOFRNRGY0Tzc4VVNl?=
 =?utf-8?B?M1VKaFNIYUs2cXhkVFhpY2tHbEo4cERIU2RzWVJWc0JpK01tUVl4ZW5iSFZu?=
 =?utf-8?B?MlhwcHBPNlc1c1NYSTZaYTE4Y1ZiQ0tkUXplb3MxdXhna0E1dkltWFRkelZh?=
 =?utf-8?B?U1djL2NVbHFkWmZOZm1NSDRMNnRCazNQYkV3UlBraWZWakxMYWVVRGtkWkIr?=
 =?utf-8?B?TjVQK1pNTVc2clJFNjFmQUpqN1I2elplN0Qxd2dCRmNwOXN4Y1hyZGZyeWhy?=
 =?utf-8?B?eFdDeWFYK082TTJ4dTZhMVRrSXpiazRxL2NjQTZiMm1tWTFEUHlvdWJGblVI?=
 =?utf-8?Q?r/yU7jRSnyBUdcjKAAqfADOUZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e180db7-0c22-4ac2-7dcb-08dd8656d536
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 13:16:06.1488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JZD8tFGeh7f1iL7OtAAHWme5pJJJ/2clq0Y2kvgj/rcXQrCN4lZg024piwfExJzg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6262
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

On 4/24/25 09:07, Tvrtko Ursulin wrote:
> 
> On 23/04/2025 14:12, Christian König wrote:
>> On 4/18/25 18:42, Tvrtko Ursulin wrote:
>>> Hi all,
>>>
>>> Recently I mentioned to Danilo about some fence lifetime issues so here is a
>>> rough series, more than anything intended to start the discussion.
>>>
>>> Most of the problem statement can be found in the first patch but to briefly
>>> summarise - because sched fence can outlive the scheduler, we can trivially
>>> engineer an use after free with xe and possibly other drivers. All that is
>>> needed is to convert a syncobj into a sync file behind drivers back, and I don't
>>> see what the driver can do about it.
>>
>>
>> Yeah that topic again :) The problem here is that this is not a bug, it is a feature!
>>
>> IIRC it was Alex who pointed that issue out on the very first fence patch set, and we already discussed what to do back then.
>>
>> The problem with grabbing module references for fences is that you get trivially into circle references and so basically always preventing the module from unloading.
> 
> Where "always" is only "while there are active objects from that module", no?


The problem is that dma_fences stay around after they are signaled. And basically all drivers keep some dma_fence around for their resource management. E.g. amdgpu for the VMIDs.

This means that some dma_fence is referenced by the module and the module referenced by some dma_fence. E.g. you are never able to unload the module.


> 
>> The decision was made to postpone this and live with the potential use after free on module unload until somebody has time to fix it. Well that was +10 years ago :)
>>
>> I discussed this with Sima again last year and we came to the conclusion that the easiest way forward would be to decouple the dma_fence implementation from the driver or component issuing the fence.
>>
>> I then came up with the following steps to allow this:
>> 1. Decouple the lock used for protecting the dma_fence callback list from the caller.
>> 2. Stop calling enable_signaling with the lock held.
>> 3. Nuke all those kmem_cache implementations and force drivers to always allocate fences using kvmalloc().
>> 4. Nuke the release callback (or maybe move it directly after signaling) and set fence->ops to NULL after signaling the fence.
>>
>> I already send patches out for #1 and #2, but don't have enough time to actually finish the work.
>>
>> If you want take a look at nuking all those kmem_cache implementations for allocating the fence memory. I think that can be completed completely separate to everything else.
> 
> So enabling dma fence "revoke" so to say.
> 
> Just to check we are on the same page, it is not just about the module references, but also use after frees which can happen even if module is still loaded but any memory reachable via dma fence entry points has been freed.


Yeah, that came much later when people started to use the scheduler dynamically. Basically the sched pointer in the drm_sched_fence implementation becomes invalid as soon as the fence signals.

> 
> In that case, as Matt has already asked, if you could dig up your unfinished work it would be interesting to see.


This is what I already send out: https://gitlab.freedesktop.org/ckoenig/linux-drm/-/commits/dma-fence-rework-enable-signaling

A bunch of the cleanup patches in that branch have already been applied, only the last one is missing IIRC.

And here is a WIP patch to decouple the lock I wrote halve a year ago or so: https://gitlab.freedesktop.org/ckoenig/linux-drm/-/commits/dma-fence-rework-locking

Regards,
Christian.


> 
> Regards,
> 
> Tvrtko
> 
> 
>>> IGT that exploits the problem:
>>> https://patchwork.freedesktop.org/patch/642709/?series=146211&rev=2
>>>
>>> Different flavour of the problem space is if we had a close(drm_fd) in that test
>>> before the sleep. In that case we can even unload xe.ko and gpu-sched.ko for
>>> even more fun. Last two patches in the series close that gap.
>>>
>>> But first two patches are just shrinking the race window. They are not proper
>>> fixes. This is what I want to discuss since I understand reference counting all
>>> the involved objects has been rejected in the past. And since the problem
>>> probably expands to all dma fences it certainly isn't easy.
>>>
>>> To be clear once more - lets not focus on how this does not fix it fully - I am
>>> primarily trying to start the conversation.
>>>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Philipp Stanner <phasta@kernel.org>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>
>>> Tvrtko Ursulin (4):
>>>    sync_file: Weakly paper over one use-after-free resulting race
>>>    dma-fence: Slightly safer dma_fence_set_deadline
>>>    drm/sched: Keep module reference while there are active fences
>>>    drm/xe: Keep module reference while there are active fences
>>>
>>>   drivers/dma-buf/dma-fence.c             |  2 +-
>>>   drivers/dma-buf/sync_file.c             | 29 ++++++++++++++++++++-----
>>>   drivers/gpu/drm/scheduler/sched_fence.c | 12 ++++++++--
>>>   drivers/gpu/drm/xe/xe_hw_fence.c        | 13 ++++++++++-
>>>   4 files changed, 47 insertions(+), 9 deletions(-)
>>>
>>
> 

