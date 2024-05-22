Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5334A8CC219
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 15:28:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6662F10E2C8;
	Wed, 22 May 2024 13:28:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4ID9zinB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7016410E2C8;
 Wed, 22 May 2024 13:28:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IqFzTCfaKFXTYTYfXM4LW2tYOC+E0rzm8dGoeYdQXmMAcT2D7EWKXhVs/XQii6E26vMzHcKSXBYBhNGTrG4uNvBHrheoCkfiG/Ge1TMWhShgqZy5u1NPyd5avw4z6GaOMlcjoV1eaqISiPANsTDjF04Ipo4ONZiC3Y32mqiCy3F0MX1/qvD7v8yvjwzSvB+jNO1EUPmdvIz3ifyV9WyvFaSVoAxqFyV1etq+IaI1aGxpSJVoFDgnCpVntNIZwq5EtZO+3hliC/75ZDixstQGcRHYrRc8IIvLMhtB34f9Zh9lDLQI6mWAhg8bJmK89CLAqaZeCFpdjQeTAFTsK0fnLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UdTcaFyA/H8ED/KMaVQTYAJwfN9t3KtbyFMSQpDUMVE=;
 b=MwUduZJdlWOV+SwBE+G9vORNJTkiiIgCN1lW21JRKzKUN6YAr1WwFKbzixi7hexSjvnGY8DdejhLc9KJQ9MOr71EdzdxfAi5t3vfh9yH7qO4JSuWEW+uzzkuDz3wssfV2A5nxAbpqWPGXyrSKssFSXfF5yVGWGoy6Py6iTKlceKAYkkm+rJJEjihM3qcnJjASAgQnlU6RmK0t2xO7K2L17KDcq+VNhbB3Sjipp0TZ9Q0/HmRPh2H8UFY7rNzoy1MarV6VeWwp9OL2jNdD6aAdwmbxW+3zLDput+pO/rPADcvMeLzzoes0tXJvZVYmU8s6T/QLWubfgYnVBXwVKVS9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UdTcaFyA/H8ED/KMaVQTYAJwfN9t3KtbyFMSQpDUMVE=;
 b=4ID9zinBowhKEcR8oIPDCIolKI8x7ZysO4o5wgivqm/n7nkokXFKk9CKnIfJi6ZPKLBhIX9hxDxNq6liz4ojHwRwgSyxrDhweZ7masmIWI1nhAVqrzWE1ZqP2Ej/ulC4XfLUKIXLGA8/Q4bs+bj/qnHePk8tCXFv1ZSjxsUhH1c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH0PR12MB8150.namprd12.prod.outlook.com (2603:10b6:510:293::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Wed, 22 May
 2024 13:28:29 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7587.037; Wed, 22 May 2024
 13:28:29 +0000
Message-ID: <66a2e207-49f7-4435-ad2e-71c0608ab761@amd.com>
Date: Wed, 22 May 2024 15:28:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 16/21] drm/exec: Introduce an evict mode
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
References: <20240521071639.77614-1-thomas.hellstrom@linux.intel.com>
 <20240521071639.77614-17-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240521071639.77614-17-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH0PR12MB8150:EE_
X-MS-Office365-Filtering-Correlation-Id: 81f2198e-a17d-44c7-570a-08dc7a631187
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1NzT3BMVFFaV2p6Smo4MnZQcTM5L3Q3T21kQmlyUUNXdnAvTnNoZHhxTHJi?=
 =?utf-8?B?Yjg3aUdmR1FBVVh5Z3dQZmhwYlpEd1UrMnpTS1B6VE4vdDBjNGNJMVVUQllH?=
 =?utf-8?B?eW4yUUlHMkJkWlBFQi94c1A3KzMyNFJ1d1NVbm5ob2ZyNXdDMzlRNjc3TjUy?=
 =?utf-8?B?dDY2c3JIUlBCL3N2Y1VORklDWVJzbW9LcFlldUtyanFDWXNCUnZiVGZYSXEy?=
 =?utf-8?B?TlVVYk5LL2FJaXh6eW1ZS1ZoQjZyMktVUHBjNi91WXMrRDZ2bmhHMWgwVCtt?=
 =?utf-8?B?M2pZKytVRVF5TVJ1RUJlN2h6UGpJVVBhUFhudlFLU3B5WUp2VDZ1Q01NMkFB?=
 =?utf-8?B?bEFvWngvYmNLa1RjOWNCN2lDMStrZzNTVjBvbXRqNlNDZytRbmZIejZEZzVj?=
 =?utf-8?B?S3NnZlBiOXNSUzlXNm9IbFBob3NtWUtjdVJtV3lnekFxTVZtSXkrNEtQZnBx?=
 =?utf-8?B?V2NpNGlSNC9BeHdwWllkLytDVkx4Y2cza3hRd0F3RloyQlBZUXNXZlZyTUdL?=
 =?utf-8?B?NHhCb012ak1UTDJiT05SNFhPSU5IS0dGdHQ3UFFDamVQcFNPaFpiZFJEb1Vy?=
 =?utf-8?B?a0RmN1o3RkpGVmlYTlhUek5BRG5pKzRlYWdyOWpkb1hqdStTVWgvSGFpUmN0?=
 =?utf-8?B?ZVBDd1dSdHJFOXFIOU1WNmZQMTJ4SjBRTVQ5ZGJSZG5IaWVOYm5IeGhDTlJR?=
 =?utf-8?B?WWh3aFZXNWRhY0YxRnptdk5mZGlYSDdWYU13WVlzTDdUZTBNZk5Zdnk5WTBW?=
 =?utf-8?B?MzgxOEdLYm4xbkFKWDVMRjRPTGVuaGVSZk1JbC9pYWlHM2lCMjVnY2xRWjRU?=
 =?utf-8?B?c3pNOWlRRnNGYWhHcDF0aVc5SnJ1TE9YOGRMNUdDV01zVTBxVWVkSy9ucThj?=
 =?utf-8?B?RElpNEdHa2NsaGJLQ0lOaXZueUtlaU1VYm5BZ1VOYkVublp6dE5wcGdWc0Jk?=
 =?utf-8?B?a2lSVHkzMHovOXZnMmF4SGozUFRuMm5TUG83Vi9PMFVDYlU2QUdFYUV4Nk9L?=
 =?utf-8?B?b3E3SHY1RVFWQmpEbzl4N0lsMXRUak9iUzMxRjFpcVlFRysxRDlUSTl1RU0y?=
 =?utf-8?B?QXRRS1N3Qld3S0FEL01uTzN6VFpUcHZINUdWRi9XMDR0TW8xeXdTSTBuYTE3?=
 =?utf-8?B?eHlaRzZmdUJlTHd0RmM3akJVYkUrZ1RwSlhuQ1pMOEg2Z0xmLzFvMFZsS1ZK?=
 =?utf-8?B?NnVFbW81Mm5kNTlQekNBeFVHR3poVitILzY0aDFGdlExWFZoVjVYMllHais5?=
 =?utf-8?B?UEhZTklPSFBmSytBUmcwQkRzaFlTQzhkNXpjU0owRGhmOGF3aS9jT3h6N3hs?=
 =?utf-8?B?YndRSitLdG9kVmRXelk0TlJ2OHk5Wk9BbU5PWVRRT1lhU2Fqa1RCUk9KRXRv?=
 =?utf-8?B?NDRaWUhxQ1hORVhhKy9vZG9jTWZvVmdLUC9WUVhMSVhHRFFkOTE0SEx1TjM3?=
 =?utf-8?B?QVJCTGVnV3NhVlR5OGNsSjVNaTdHVWp5ZGtGczFxNVpRUmdSNDk5RzJUU0cy?=
 =?utf-8?B?QVU5Q0pWYnVTRDRqYWdIVzhVV0FjZUVub3MrZUtjNGdCRDlKaDV1NDFUZlBW?=
 =?utf-8?B?NDFLTWJBdGRkamovenA2dmROT01XQ0wvQ05ScWViRzVrSzkxUFphYTFIeU1q?=
 =?utf-8?B?WWo0djlRbThBRmRhSWVIL0N5RnNQK0J0bjZLS0VJUTloRU1sTW9kRmJIUzgr?=
 =?utf-8?B?VWo3bkwzSWFXSXo2cVJsNDJyeEVRb3ZmSDJjYnJ1T0dqZGk5ZXhlY2J3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVBLZlM1LzhIUzdubmUyWGVVd0tjNG1oYWlDT2dua2xRbndiTnpyb0dWWGhr?=
 =?utf-8?B?WTVvYmVYQTlOV2tRTE9ZV2xVRDNWRi9tWmJyaVpKN2QrWk5ZaWc5RkZ2czlV?=
 =?utf-8?B?V1YvSnQyUlZzR3JqNTJmcUlvRXVpWVZ2bm13UmdSRHNQSTFBRlQ2WGg0TVor?=
 =?utf-8?B?cTVMZG1ueS9KKzI2cnlMMm05Snl2NkVtM3YyL2FQUHdwRmphbWJycnFZN2kx?=
 =?utf-8?B?TmVnN0RPTVJRU3M5N0h2eUhwSDg5S0t4ZXBRS2pmNHMvWGVIb2wrdW1QbTAx?=
 =?utf-8?B?Z0dtTEdmVkZQSHhCVXJCWFR3dGJFazlTK0MyZUdpazV0bk9wQ2hLdWNDWVFG?=
 =?utf-8?B?R01SNkkxRmJ0ZE9CZWcybUJZR1VwSmJJOXdOQnlib0Z5b0tFaVh6VlhPN20r?=
 =?utf-8?B?TjNCQm9KOGh1dk5RaEswNUtYWW9Ud2svOVFrQjF2cno0aE50dE9BdDBKSVdV?=
 =?utf-8?B?U21kY215M3hXQXNvSzkxbXJCRlQxMnhKamZKbTBjd2gvQVFndmhUdVQvRmpy?=
 =?utf-8?B?QlBRVnY3Q3o0V0lFNzcvQWhQOHd6KzhIeHpGYTRpODE2VHhSUXRKRzA5VWhN?=
 =?utf-8?B?eUNGM0N3V1AyQzZuUGw4UEJvVmxMVHJFaVFqUlZJMWpqTTE2UWJBTENBK0Ra?=
 =?utf-8?B?d2JIaCs1dTRhMWFHeG5YS1dybDh2WGdDb0hINWhRMVZJVTZkejByVEdrQUlW?=
 =?utf-8?B?QjZZazNEZVZ6UnUxdmlGaHdpNkdONmVlTDUvcWJzeXFhQnNYQnVxTFcwMngx?=
 =?utf-8?B?QlYwcHBRaTdtUG50NXIzL0syVXdyRC9LQi90ZXpFZVN4THI5djZWQmZWejJZ?=
 =?utf-8?B?Y3VxakJJQTVJT2VDa1dQTlBIemJsTUN3NGNLSVRuTk1pWDhXeU0vUmRKRzBs?=
 =?utf-8?B?Q2xpcTNWanNaS21sU3lvQnBQeUJmbzY5V3pJNkY3anhtalZuMVNIR0ZNZkZ5?=
 =?utf-8?B?WWUxd1Npak1zdXo5RHBQMTF2T2xDd2cxYTRYT3lISXZLZXVTcFhhWlRGbFJG?=
 =?utf-8?B?WGExeFNxOGk4UWx4Y1dhU1kxUFRCK3U5T0RKaXJWVGVOZmV0RzFyaFlFMnF3?=
 =?utf-8?B?VHJjczNTb1RicHFqRlNNRHRsQml3V3h3cWM5VXNGK0dtRlRzK2w1UFBIUXFk?=
 =?utf-8?B?WkZvVDg1U1kyalYvYktna0RGOElIK0Z5a2toOTdoQlZ6WHM3RElkRU9YOG5z?=
 =?utf-8?B?MHNqM2lTK3A3MWRxTFZNdGpmbVVncXR0NGFjYmRhNEg0UXZ4TXhQNExmSSt0?=
 =?utf-8?B?LzByeTlMWWoyb1ZNNWtQRmhTbGtBZmljb3NYbEhVdUNlUDVXN3dKallGSzdp?=
 =?utf-8?B?blE2WWtXS05rOWhLdFl2bzB4Q1VzRVJUM1V2NHY4d1lObml6OHlkL3N0ZDBs?=
 =?utf-8?B?RTBob21UZHdPZkZDLzRZTEJIWWI3VjRJY011YW9oUjRUMTBDU3p0UHNjTTlz?=
 =?utf-8?B?NEcyem9PRVd6RkFqcXJEZ0MvUDVPZFlQNHoxUmpUakYra3ExMGZyczJwNWEx?=
 =?utf-8?B?blRTQkF6MUVLM2ZPQ2VhbmJLcXNhalBKWmIxd1lCd2R1NkRDZ1B4dS9hVTYy?=
 =?utf-8?B?SnpybmUvcXhwYk9rZC9vcDEvdWVIdFNaOWdhYXpWYk45Y09ad1dTRVJsTlc1?=
 =?utf-8?B?ZmUwaktBK0FGN0RHQlQ4a1FadHRSMlBEM2tFNFhjOTVkY08vOHd6YnExZUR4?=
 =?utf-8?B?b016MUV0a3A4VFJYeXgwdWRuU21hQzVoYjhpNUlNWlNiUVRZSG5uNG5oN0hz?=
 =?utf-8?B?MEpWTDU4eS9WVDF3MVdpR1cxUXM5VXZ4SEVSenExUmdLS00yU25acnUwMFVX?=
 =?utf-8?B?NU5vUHJ5NThxZThXL3dlK2tMSVppYXJlbHVxeXZCNzdXUlF4NCtFR0JnNlJ6?=
 =?utf-8?B?MzBFb2ZkRlI2WGw2OUdNSG9qRUh4ZXQzMHZJckZ2WnBjcnd4VmNRaGxnUUJl?=
 =?utf-8?B?OG5Hb2RMY280ZDFJc3F6QTN1YUJJaFpyN1hWZE9VRTVmZEM0UjJxUXYrbjI2?=
 =?utf-8?B?aGx1NHJWR2F3WXhuVXIzenVIMVFjcTMxQkVTTFhWWGluY1RuNXlyQlVnbnlO?=
 =?utf-8?B?bGNsMjhSMG1YSmkzcTJIVGNIVEpZL2d4NlV1UmRFaFlJRVpmNXpvWGkySnl2?=
 =?utf-8?Q?8rDDKYdKWkd8dm08HVm+dy2pp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81f2198e-a17d-44c7-570a-08dc7a631187
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 13:28:29.5741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SNgaTdbnnqpn1myEbE4GpjmTnUUTqwz61cmW44qwP55egOZsLgbpAbVQHKstvZR4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8150
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

Am 21.05.24 um 09:16 schrieb Thomas Hellström:
> Locking for eviction is in some way different from locking for
> submission:
>
> 1) We can't lock objects that are already locked for submission,
> hence DRM_EXEC_IGNORE_DUPLICATES must be unset.
> 2) We must be able to re-lock objects locked for eviction,
> either for submission or for yet another eviction, in
> particular objects sharing a single resv must be considered.

Yeah, I was already thinking about that as well.

My idea so far was to have a separate function for locking eviction BOs. 
This function would then use trylock or blocking depending on some setting.

> 3) There is no point to keep a contending object after the
> transaction restart. We don't know whether we actually want to use
> it again.

Well that isn't true as far as I know.

If we don't use trylock we still need to lock the object after rollback 
to make sure that we waited for it to become available.

Regards,
Christian.

> So introduce a drm_exec evict mode, and for now instead of
> explicitly setting it using a function call or implement separate
> locking functions that use evict mode, assume evict mode if
> there is a snapshot registered. This can easily be changed later.
>
> To keep track of resvs locked for eviction, use a pointer set
> implemented by an xarray. This is probably not the most efficient
> data structure but used as an easy-to-implement first approach.
> If the set is empty (evict mode never used), the performance-
> and memory usage impact will be very small.
>
> TODO: Probably want to implement the set using an open addressing
> hash table.
>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/drm_exec.c | 77 ++++++++++++++++++++++++++++++++++----
>   include/drm/drm_exec.h     | 15 ++++++++
>   2 files changed, 85 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
> index 9eea5d0d3a98..ea79d96f5439 100644
> --- a/drivers/gpu/drm/drm_exec.c
> +++ b/drivers/gpu/drm/drm_exec.c
> @@ -65,6 +65,10 @@ static void drm_exec_unlock_all(struct drm_exec *exec)
>   
>   	drm_gem_object_put(exec->prelocked);
>   	exec->prelocked = NULL;
> +
> +	/* garbage collect */
> +	xa_destroy(&exec->resv_set);
> +	xa_init(&exec->resv_set);
>   }
>   
>   /**
> @@ -92,6 +96,8 @@ void drm_exec_init(struct drm_exec *exec, u32 flags, unsigned nr)
>   	exec->contended = DRM_EXEC_DUMMY;
>   	exec->prelocked = NULL;
>   	exec->snap = NULL;
> +	exec->drop_contended = false;
> +	xa_init(&exec->resv_set);
>   }
>   EXPORT_SYMBOL(drm_exec_init);
>   
> @@ -110,6 +116,7 @@ void drm_exec_fini(struct drm_exec *exec)
>   		drm_gem_object_put(exec->contended);
>   		ww_acquire_fini(&exec->ticket);
>   	}
> +	xa_destroy(&exec->resv_set);
>   }
>   EXPORT_SYMBOL(drm_exec_fini);
>   
> @@ -139,6 +146,30 @@ bool drm_exec_cleanup(struct drm_exec *exec)
>   }
>   EXPORT_SYMBOL(drm_exec_cleanup);
>   
> +static unsigned long drm_exec_resv_to_key(const struct dma_resv *resv)
> +{
> +	return (unsigned long)resv / __alignof__(typeof(*resv));
> +}
> +
> +static void
> +drm_exec_resv_set_erase(struct drm_exec *exec, unsigned long key)
> +{
> +	if (xa_load(&exec->resv_set, key))
> +		xa_erase(&exec->resv_set, key);
> +}
> +
> +static bool drm_exec_in_evict_mode(struct drm_exec *exec)
> +{
> +	return !!exec->snap;
> +}
> +
> +static void drm_exec_set_evict_mode(struct drm_exec *exec,
> +				    struct drm_exec_snapshot *snap)
> +{
> +	exec->snap = snap;
> +	exec->flags &= ~DRM_EXEC_IGNORE_DUPLICATES;
> +}
> +
>   /* Track the locked object in the array */
>   static int drm_exec_obj_locked(struct drm_exec *exec,
>   			       struct drm_gem_object *obj,
> @@ -161,6 +192,14 @@ static int drm_exec_obj_locked(struct drm_exec *exec,
>   	drm_gem_object_get(obj);
>   	exec->objects[exec->num_objects++] = obj;
>   
> +	/*
> +	 * Errors here are not fatal, It means the object we locked
> +	 * for eviction can't be locked again. If that is problematic
> +	 * we may need to reconsider this.
> +	 */
> +	if (drm_exec_in_evict_mode(exec))
> +		(void)xa_store(&exec->resv_set, drm_exec_resv_to_key(obj->resv),
> +			       obj->resv, gfp | __GFP_NOWARN);
>   	return 0;
>   }
>   
> @@ -184,6 +223,9 @@ static int drm_exec_lock_contended(struct drm_exec *exec)
>   		dma_resv_lock_slow(obj->resv, &exec->ticket);
>   	}
>   
> +	if (exec->drop_contended)
> +		goto error_unlock;
> +
>   	ret = drm_exec_obj_locked(exec, obj, GFP_KERNEL);
>   	if (unlikely(ret))
>   		goto error_unlock;
> @@ -245,10 +287,19 @@ int drm_exec_trylock_obj(struct drm_exec *exec, struct drm_gem_object *obj)
>   	}
>   
>   	if (!dma_resv_trylock_ctx(obj->resv, &exec->ticket)) {
> -		if (dma_resv_locking_ctx(obj->resv) == &exec->ticket)
> -			return (exec->flags & DRM_EXEC_IGNORE_DUPLICATES) ? 0 : -EALREADY;
> -		else
> +		if (dma_resv_locking_ctx(obj->resv) == &exec->ticket) {
> +			unsigned long key = drm_exec_resv_to_key(obj->resv);
> +
> +			if (exec->flags & DRM_EXEC_IGNORE_DUPLICATES ||
> +			    xa_load(&exec->resv_set, key)) {
> +				if (!drm_exec_in_evict_mode(exec))
> +					drm_exec_resv_set_erase(exec, key);
> +				return 0;
> +			}
> +			return -EALREADY;
> +		} else {
>   			return -EBUSY;
> +		}
>   	}
>   
>   	ret = drm_exec_obj_locked(exec, obj, GFP_ATOMIC | __GFP_NOWARN);
> @@ -288,12 +339,20 @@ int drm_exec_lock_obj(struct drm_exec *exec, struct drm_gem_object *obj)
>   	if (unlikely(ret == -EDEADLK)) {
>   		drm_gem_object_get(obj);
>   		exec->contended = obj;
> +		exec->drop_contended = drm_exec_in_evict_mode(exec);
>   		return -EDEADLK;
>   	}
>   
> -	if (unlikely(ret == -EALREADY) &&
> -	    exec->flags & DRM_EXEC_IGNORE_DUPLICATES)
> -		return 0;
> +	if (unlikely(ret == -EALREADY)) {
> +		unsigned long key = drm_exec_resv_to_key(obj->resv);
> +
> +		if (exec->flags & DRM_EXEC_IGNORE_DUPLICATES ||
> +		    xa_load(&exec->resv_set, key)) {
> +			if (!drm_exec_in_evict_mode(exec))
> +				drm_exec_resv_set_erase(exec, key);
> +			return 0;
> +		}
> +	}
>   
>   	if (unlikely(ret))
>   		return ret;
> @@ -324,6 +383,7 @@ void drm_exec_unlock_obj(struct drm_exec *exec, struct drm_gem_object *obj)
>   
>   	for (i = exec->num_objects; i--;) {
>   		if (exec->objects[i] == obj) {
> +			drm_exec_resv_set_erase(exec, drm_exec_resv_to_key(obj->resv));
>   			dma_resv_unlock(obj->resv);
>   			for (++i; i < exec->num_objects; ++i)
>   				exec->objects[i - 1] = exec->objects[i];
> @@ -415,12 +475,14 @@ void drm_exec_restore(struct drm_exec *exec, struct drm_exec_snapshot *snap)
>   		if (index + 1 == snap->num_locked)
>   			break;
>   
> +		xa_erase(&exec->resv_set, drm_exec_resv_to_key(obj->resv));
>   		dma_resv_unlock(obj->resv);
>   		drm_gem_object_put(obj);
>   		exec->objects[index] = NULL;
>   	}
>   
>   	exec->num_objects = snap->num_locked;
> +	exec->flags = snap->flags;
>   
>   	if (!exec->prelocked)
>   		exec->prelocked = snap->prelocked;
> @@ -443,8 +505,9 @@ void drm_exec_snapshot(struct drm_exec *exec, struct drm_exec_snapshot *snap)
>   	snap->prelocked = exec->prelocked;
>   	if (snap->prelocked)
>   		drm_gem_object_get(snap->prelocked);
> +	snap->flags = exec->flags;
>   	snap->saved_snap = exec->snap;
> -	exec->snap = snap;
> +	drm_exec_set_evict_mode(exec, snap);
>   }
>   EXPORT_SYMBOL(drm_exec_snapshot);
>   
> diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
> index 0ce4d749511b..0b6d5ac0c092 100644
> --- a/include/drm/drm_exec.h
> +++ b/include/drm/drm_exec.h
> @@ -5,6 +5,7 @@
>   
>   #include <linux/compiler.h>
>   #include <linux/ww_mutex.h>
> +#include <linux/xarray.h>
>   
>   #define DRM_EXEC_INTERRUPTIBLE_WAIT	BIT(0)
>   #define DRM_EXEC_IGNORE_DUPLICATES	BIT(1)
> @@ -53,6 +54,17 @@ struct drm_exec {
>   	 * @snap: Pointer to the last snapshot taken or NULL if none.
>   	 */
>   	struct drm_exec_snapshot *snap;
> +
> +	/**
> +	 * @resv_set: Set of pointers to locked objects in evict mode.
> +	 */
> +	struct xarray resv_set;
> +
> +	/**
> +	 * @drop_contended: Drop the contended object after WW transaction
> +	 * relaxation.
> +	 */
> +	bool drop_contended;
>   };
>   
>   /**
> @@ -67,6 +79,9 @@ struct drm_exec_snapshot {
>   
>   	/** @num_locked: Number of locked objects at snapshot time. */
>   	unsigned long num_locked;
> +
> +	/** @flags: The drm_exec flags at snapshot time. */
> +	u32 flags;
>   };
>   
>   int drm_exec_handle_contended(struct drm_exec *exec);

