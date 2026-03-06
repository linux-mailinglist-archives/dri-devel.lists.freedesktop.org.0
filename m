Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPQ1CRqMqml0TQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 09:11:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F6921CE43
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 09:11:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E4910E3A5;
	Fri,  6 Mar 2026 08:11:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="H3yzg6D4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011006.outbound.protection.outlook.com [52.101.57.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E754C10E3A5
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 08:11:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZkeA2Nrk+6uik/PpDot4PPvvME1LQEEeCbGGpFeanDiuLl0xK8YgdC4q1glzO0YQGEUBxoZ92Q/GzbPZki+EmeVZIMII4ZnKfV79LC30+f83w9g/jndLZf4VOINPm/76CA7upr+e/QjjrHPPXYIY1pHyQ+FhvNxWp+3tyVHV5Z7sN4BFW4Cds0Tuodd6fEVe1DnYrF6TMobAryKI7VQ4NwhdBv9nrp+EFscbdbIbuXrEzG3qck0QbWQJG9UgfdrmylK7HEg/w19pT1WpaqFWiL1i/kZIbuitFYDhll7RzyubG5uUpc+vW3EuNalPc7qLas6H7kh0G11exO3dAJlfCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kqUjwYBs3cp6jvXGwaSvPs7sY2j8FHJdGKbIurunM4o=;
 b=hKutdybPAdlnJ/C8xei89xgUbf7ZItseFijI0XOA0dv/yj8FIEb9/cBp6nuuFOuRjDdYrQNai1H4EQXbA8FjGodSehoXYLBeBKvHarendPTN0l0HrGrIm9Z74bFCpAxBM38FIPUp2UxqImLg/YA2tNJUmMgLAbkPX/HfzwVipYUqTifajIBK7dTpLBJXuaGe5Blvu7bfH1OXd423AE5rGYkftb7UHSIa26oMkjk14+u+pf/PCy9WUdffQcRqXbx5uPWT2N1b8jy84Kw4fHZyaery3lJHAVOxMQkrd+kl12wt6iUd/QzgtAwiKWRnpT1QLEld2lnF9SQZwlkhJxa6ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqUjwYBs3cp6jvXGwaSvPs7sY2j8FHJdGKbIurunM4o=;
 b=H3yzg6D4tEKhf5u11+L5+3hNC/D8eR8aHE/rr3vtzuNoTCIhYZIZGLNGlqyhM4xIxYXncaz8riDa8wBVN1lDbI1XHBBaPwIPQU0c9z663SgyljCgIuV9bgWlNUFjKpI277Dz3ACcVZJIr2w2/3S9Zdm5fwbNnwYhfwiCf7XnP/o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB8138.namprd12.prod.outlook.com (2603:10b6:a03:4e0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 6 Mar
 2026 08:10:58 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 08:10:58 +0000
Message-ID: <e8b47e9f-f8cd-4be4-953a-931816e5f429@amd.com>
Date: Fri, 6 Mar 2026 09:10:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: dma_fence: force users to take the lock manually
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: phasta@kernel.org, dakr@kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <080395923c92ef758ca6062f1e01392186413015.camel@mailbox.org>
 <718ad034-8fc2-4b43-9b04-729c5befc3ca@amd.com>
 <20260305161212.7dfbadbd@fedora>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260305161212.7dfbadbd@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR08CA0001.namprd08.prod.outlook.com
 (2603:10b6:408:142::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB8138:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c883b63-3f22-4677-65cc-08de7b57e5c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: dpO+3XbgIDYTfXkXo7FvSrESj+YKTQ5apUkMnNcfj7EC3LCWq7m1PGEyqRXY9KlM3cqmkyk4ElV+vtokG7M/PN4fgO3Jjsk+7ZV4Z9Saac5oZtakwYggQmBZMcUzd2q6nVJMffjAjSOaGcPHfs7o7nSjVPn6NsUePIwfB4nC5GsjnQXAGgufi0d0cWUREqCsAR+H0oxc5PxDNAz4vLA7PzygrjGey3ydr0wdCEtikg1DjyFulFWmAVoTN6HxXNDXjG1CQ/WabYV9Vl+zV6bE4OXRaeNGOB2QjuoIFbywg/nMCQUhbahgLftclt21Qk0CQpPsjyYXqdAkodh4XQ+s9IEYv2/94Oa/jiPrlPOEROqUFVwEuOFn6c0UrSQOFTgYxbdEHqR3S9sTyUo3fj1SAW3fPC2zrCD802KBhbHD/2K8HizSO/d4NaU1DijQMhCCX8CskvoI611OM2XkrlwdxBplT6aR0ZDB3pDtps5vKnqx2LtkLs1Yr5LhcEG+ioe4nJbKBLZ/QGh877Stj9cK/lM9V9FN13RnYxZqKE+ZJXDdLboErq0Kfztps74WA9hUCVyaWlbCcC3BCLk42wVmYFyfPm8fK0kcqdTziA3ffUuFUm5Xjret+xwM7tHx3sIYmtB8Fx4Tmn27wy/wNfWtTM2568HVxQ93KCwQDCkXgq2sJnQLHLY+f3wUREDsFD8D
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnltMm0xbGxrdDc1cHRJUkhLQU84RlpLOTBLclA4ZkR3aUcrRi8wekx2aTBw?=
 =?utf-8?B?MDdkU3JpR1crMStRYkdhZ3YvTHhpSFZsUC8vMTkxVjNDdlJDbWFBNC9XWXlZ?=
 =?utf-8?B?VWg0aEliUG5jaDRpN2pwcjJBMldzSjdIcWtsZm5UWTA5NlBOTGVzWjJiSWpJ?=
 =?utf-8?B?UGNYTk5sWkJrYTBObkdIQ1c5RmtxYmI1c2paR2lYUUFLMWhqNVlyYThpN3ow?=
 =?utf-8?B?RlpsTy80bFhad0QwY0MyK2VDT1J5eW1VV0FxR0ZBaldpdmJ4TktVa0x6MDZn?=
 =?utf-8?B?NkYyeTdMTlJLNmtnRE9SM3Bsa3NWVFZCMjdhRHY3aDh3cndnUW8wc0RQVUxZ?=
 =?utf-8?B?UmhTTDFGQXZteURSeGZtWThya0dlU0R3bTBLYlA2U3RsbitwcHAvMlFYNUcw?=
 =?utf-8?B?RjdUY3gxdGt4N3VUMGRsRG53VXZFRjVzS01DWTJxS0lCWXhUd3A4U1VvdUdk?=
 =?utf-8?B?Z3JtUC9UbWpCNjhSZGJFWE8zQzQzZi9UK3l6UFp1NCtKTGxjWFFCVnloemVh?=
 =?utf-8?B?SzdJK1FXVTBnRVBSWnZ6ZnRVM2tTK09aTjQ0cXlueHFZYzFlN0xIVGsrcGRs?=
 =?utf-8?B?QzduZXZwMUxUNUZ0QWNUNEhCcG1sd0k1L3lFU3NPU0t0bnlYYUxMbXBTL1NQ?=
 =?utf-8?B?OXRjNnYzdGI1TTBiTVM0ejlMSHlrS1Bhc1RKR2VJWHpDN3FrWXVMeDZKMHgr?=
 =?utf-8?B?ei9jZnJadlhiak9ERXYxMXJKTkpvaTd0Q1hLS2dpeFJjaWE3YXNkWGpJNjVh?=
 =?utf-8?B?bjNQSUMwZVdkdUZVNVY4akhpMUtMZ2IxYWZjZmU0Sndmcnp1TTY1MzZ2ckN5?=
 =?utf-8?B?eElWS085bUVXSkF2ZTlkVVVsTm1BdU1RcjZjUHFiRE1ycGIzVzdZKzVHNHRF?=
 =?utf-8?B?ZUdReFdDbGUwditZMVQrU1F6WEozdGM0K0JkTWtobVlJNnJZdHJqc3hVUVp3?=
 =?utf-8?B?Y1YrQzhtWm90VTRFT2JQNWFNNFlVQzBOSDBGeTNoWVNaUlo1MGo1YmEyT0E3?=
 =?utf-8?B?Y3k4RWdVc2FGYTE0Z040bVlOOVhUQ2JldkpFTDZvbmpHREZGdGRteUhuNFdQ?=
 =?utf-8?B?ZE1Yd09IeUQ4MElUVVBrdXk4ejZ3MlVmWE5vWHhFLzBNcjh5cXRrU01YcWh4?=
 =?utf-8?B?Zm0xNkNwSDh1d3VPNURHQXJEbWpsVW40cTdKZTRzeTMzenRuR0N1TXhIbW5s?=
 =?utf-8?B?NXlOTWI1UnA0NWVYRHQ2YlhnL2NHbERsRHpTSUVjdStramp3VHBrYUN4ZXUr?=
 =?utf-8?B?QWFsMEVJUlNPR0xkMnZHczVCdEdnKzR3TTFZQzdnczNaREJQN0pqZ2xha3cr?=
 =?utf-8?B?SEpHbDl5dStoVW4zSk9oQmNUckdsLythM2NTbTFOS2ZQbytVQ1p5Q29MSzB2?=
 =?utf-8?B?RWM4YmdkNjd2cnVGQTZUeWJhMVA2WDlaSmNVK1ZnUnlqNmU3UUE3ZkJUVHhB?=
 =?utf-8?B?d0grUmloMmRjdFNJb2haWFRSTVVqRWJqbkJsQWMyZ2M1VWdHUzFQTWY3VEdy?=
 =?utf-8?B?MmtBUFlmanEvVGorMTZpbm1wdnNWRDljV1VtNFMxM0RCK0Eveld6alErSEJW?=
 =?utf-8?B?SUNpcWYyd0xCdk0xd0NadEpQbzFZRW92SWxKNmlCdFA1WGlTU25PQ1ltVXQ2?=
 =?utf-8?B?dUZwbUhzVzhDdzFWd2t2NEJzemdoV3dqcXEvbHp5Wkxma0V0NFh4NUNRR1pm?=
 =?utf-8?B?OUlQNUd0UjlNV2NqTXVCcU5pWDNXSEJJdVdaWXRFdGVoWTFSWkZ5dDJaNGZU?=
 =?utf-8?B?Y1VOSmJtU1FlaG50RFduZVc4TU0reHdtb0RlOW82bnNubzdQWnZUTTI5WEdr?=
 =?utf-8?B?TFVtcWdHQWJJMjl2OHhHbGVMdU4yRDV3TzAzbGxMRnhZYnNRWVhINS9sWGc4?=
 =?utf-8?B?dk1GZXFDRTl5WjM1ekRDWXUxaTM0NllLeTVFdjR4ZS9zVkJBSDVnYlFxVjNC?=
 =?utf-8?B?b2hpUnVWU014T0VlemRVU2dQZURUazJhTk0ra1ZTSUlwa1B3MmV3TDFHWTNQ?=
 =?utf-8?B?a2U4bVVieVIxSzJkMVdFa2ZIYXJKS0dBQmxLY0VERnRMdzdvQW9qSm03ZkNZ?=
 =?utf-8?B?SmE4anU3eDd3cnlVVlZuNG4rdmthUlV3Y2g2ckFBRFRHQ1BjcjR5TXkzQXhy?=
 =?utf-8?B?dHlqNVV4ZzA5NFNZam01SGJ3SWZHUjJuMGZ6cVQzT0g3bHhqTDJrbjRmRVlV?=
 =?utf-8?B?elJqcHVHSHdPV09CeGlraGdKOTV2RFdTRUlzWVNCd2lGNEp2azRIZHdrenZM?=
 =?utf-8?B?dFM4WFV1WHBwYXpYdHJNR0JYYzBHVDN0Nyt5MEM2QkRmNEFwTDRhcW9LWk15?=
 =?utf-8?Q?b9ho/yG/ehr1mB+OE/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c883b63-3f22-4677-65cc-08de7b57e5c6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 08:10:58.1853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8i9l7jnDQPR+ms/So+aTdS5BdgSch0XYYHyF61jRfKYY3WtHc899sKktPDO/JCam
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8138
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
X-Rspamd-Queue-Id: 89F6921CE43
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:phasta@kernel.org,m:dakr@kernel.org,m:tvrtko.ursulin@igalia.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On 3/5/26 16:12, Boris Brezillon wrote:
> Hi,
> 
> On Thu, 5 Mar 2026 14:59:02 +0100
> Christian König <christian.koenig@amd.com> wrote:
> 
>> On 3/5/26 14:54, Philipp Stanner wrote:
>>> Yo Christian,
>>>
>>> a while ago we were discussing this problem
>>>
>>> dma_fence_set_error(f, -ECANCELED);
> 
> If you really have two concurrent threads setting the error, this part
> is racy, though I can't think of any situation where concurrent
> signaling of a set of fences wouldn't be protected by another external
> lock.

This is actually massively problematic and the reason why we have the WARN_ON in dma_fence_set_error().

What drivers usually do is to disable the normal signaling path, e.g. turn off interrupts for example, and then set and error and signal the fence manually.

The problem is that this has a *huge* potential for being racy, for example when you tell the HW to not give you an interrupt any more it can always been than interrupt processing has already started but wasn't able yet to grab a lock or similar.

I think we should start enforcing correct handling and have a lockdep check in dma_fence_set_error() that the dma_fence lock is hold while calling it.

>>> dma_fence_signal(f); // racy!
> 
> This is not racy because dma_fence_signal() takes/releases the
> lock internally. Besides, calling dma_fence_signal() on an already
> signaled fence is considered an invalid pattern if I trust the -EINVAL
> returned here[1].

No, that is also something we want to remove. IIRC Philip proposed some patches to clean that up already.

>>>
>>>
>>> I think you mentioned that you are considering to redesign the
>>> dma_fence API so that users have to take the lock themselves to touch
>>> the fence:
>>>
>>> dma_fence_lock(f);
>>> dma_fence_set_error(f, -ECANCELED);
>>> dma_fence_signal(f);
> 
> I guess you mean dma_fence_signal_locked().
> 
>>> dme_fence_unlock(f);
>>>
>>>
>>> Is that still up to date? Is there work in progress about that?  
>>
>> It's on my "maybe if I ever have time for that" list, but yeah I think it would be really nice to have and a great cleanup.
>>
>> We have a bunch of different functions which provide both a _locked() and _unlocked() variant just because callers where to lazy to lock the fence.
>>
>> Especially the dma_fence_signal function is overloaded 4 (!) times with locked/unlocked and with and without timestamp functions.
>>
>>> I discovered that I might need / want that for the Rust abstractions.  
>>
>> Well my educated guess is for Rust you only want the locked function and never allow callers to be lazy.
> 
> I don't think we have an immediate need for manual locking in rust
> drivers (no signaling done under an already dma_fence-locked section
> that I can think of), especially after the inline_lock you've
> introduced. Now, I don't think it matters if only the _locked() variant
> is exposed and the rust code is expected to acquire/release the lock
> manually, all I'm saying is that we probably don't need that in drivers
> (might be different if we start implementing fence containers like
> arrays and chain in rust, but I don't think we have an immediate need
> for that).

Well as I wrote above you either have super reliable locking in your signaling path or you will need that for error handling.

Regards,
Christian.

> 
> Regards,
> 
> Boris
> 
> [1]https://elixir.bootlin.com/linux/v6.19.3/source/drivers/dma-buf/dma-fence.c#L375

