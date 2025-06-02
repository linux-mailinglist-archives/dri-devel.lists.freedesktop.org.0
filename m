Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7668EACBABE
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 20:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4B4B10E572;
	Mon,  2 Jun 2025 18:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IrXSiFCx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2080.outbound.protection.outlook.com [40.107.236.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F3CA10E572
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 18:05:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kCsApB9WSRxg+PsH9BZ/jKJc0o9ybHglythsJjhp9eNfzTsp4zlkWcsKTWj9fgSdvNW6wyUCgekEajzMGlBTHaEwqx7KlT7rQ3gVnyoj670DkF6uIC4UT4YhY2uYTd0PZt8V28pc/02VP2FFVpevvtvwLxzOqyiOMOmjhICfiq/UGmsyK8zYwFYhnfNYWzK2c+lx/LJ1iIwLjZEtpaRFd2FXufyrjNvtE+P6kVF0t6Y5+UBaOw/2JAq1VxE2+yE0BqXV1l6rNVxjzSj2ZzK14tyC+n7+alBRjQQ4rrFdiKBIMLpPxJ9RVfiHg+yCHPjD1nmLR0cH8mg22eTzMX9teg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wuADxVtUFH6IajSq0kpN5AqnBas7dug6ZTJ5cktGgG0=;
 b=lsZuO+fGTFV03QYu2uA9+X4DkZF9ejwcbJfz3Tpak5Mh24GWIiYn0iY1HZhVZqj6DeJpnsCJfdImrpU3zL6dsHx0OXILPZg1XS+hOgKe3zIVzcrfnMI3AFF8PkvLm1oIqqHrob/ceymfP78+VO62GrkEZm7LvzstbFm0eYZbztOjEwtPoW8DoyEjdohpEOsxlAvoNEctNYo8H9TSpkrejSTZQXCr5sGoQBqASig/yPxqN5FzDP502cxpsI6pg8xZjQdoEABZD8WoccDeg8gF4p+KRDraNAEY7c4aZPgQZv9Lsm5bDdDgxAGjbqGjvxhGHa6i4/FIqZu2edHW9r4vEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wuADxVtUFH6IajSq0kpN5AqnBas7dug6ZTJ5cktGgG0=;
 b=IrXSiFCx829QoxpXDtNWJHG+ETo2k2iF2jcYh/yjyqqF6ohV3zz1fIhmc2Vw9mf3aBOHGnJPkgAKUBAHAbB7qgy0MK4XB9E3VFIigl9gc2CgV2c69V5O+xL/v8m72xq7PUtgtVjElg14CxZ8ewrpxBqLMYniC3idH8lQ5Fqi8K0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA3PR12MB7903.namprd12.prod.outlook.com (2603:10b6:806:307::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Mon, 2 Jun
 2025 18:05:43 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Mon, 2 Jun 2025
 18:05:37 +0000
Message-ID: <92d83a36-5701-4620-83d3-066e2342a3a7@amd.com>
Date: Mon, 2 Jun 2025 20:05:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/ttm: Respect the shrinker core free target
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20250602152929.18017-1-tvrtko.ursulin@igalia.com>
 <20250602152929.18017-2-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250602152929.18017-2-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN0P222CA0014.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:531::21) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA3PR12MB7903:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f1802c6-3826-4720-40f8-08dda20013f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFRVcEdWZThhazZiU3N2dnVKQ2hkdXRRTDZGaTJqS2RCQVpJeCt1QkpZNy8x?=
 =?utf-8?B?VEhyM2IzckN4T3FkOG05cDZZaWR4czBha2NDQ2hNVFhOdHRoTlorUDg2L1pN?=
 =?utf-8?B?R2paSUk3Um1iVzdRMlNBT3dWVThVcFF6SHlCL010RmFZeStpd0lnZktTanpI?=
 =?utf-8?B?UVJ4NlE3ZTk5aEJUM3ozMUxkOS9uM2N0c1ZNUGtKN2c2THMrKzNBRy9ZQVRy?=
 =?utf-8?B?T3daSEJGWDdtRzh1YTYxZ2ZyRm9hWDdJVGlMc0UzTGlrVnBHZEVtWFJUbHU1?=
 =?utf-8?B?S08zYjExTE9sSHJqVlVXbXQ5bHVDZU5YRHd5OVFKcG85Q0ovQ21LdHVhdjdq?=
 =?utf-8?B?cGc1T1R3VlJ5eVhtR3BPMzhjK0N0TW1yU0xUd3JyU1RBdmRqVE1hcmxzQkox?=
 =?utf-8?B?T2M0R3lYY3VURjQrZGVZM0gvMGhEdkFiTytSYUlYS25weWlvMURqbVhiQ2Vr?=
 =?utf-8?B?NWtNR21DSlpnZFQ4a0tDY080eEpaakp4TEJRL2lqbHNLWTBHQVFtdWlnN2ph?=
 =?utf-8?B?L2pDZ3I0clM4NTRTbitnMi9zUU5uOTRvY1BqRk1uUXJ2aloyZHRpdlZEMVRp?=
 =?utf-8?B?NWFIS3dUTzFpYTJSTUZNdi9kNis4Qk4wUkkyYlBiVmo5Rk9hWFRSV1k4akRM?=
 =?utf-8?B?aXVRRFdMNTFkclArZFdsMko3QUFaZit4Ti9uY3NpOThxUFh1RDR4a2w1bTY3?=
 =?utf-8?B?Q1d3OWlObzNKMDd0aXFPT0t5SFhLc0JsR3NtaG9aSkhxM0thdkZsZGVwemg1?=
 =?utf-8?B?NjlpVlI1SE5uZkk0OXZuTEJzQjc1c0ZOenN0anMwTW9tSWZEaWR5NnN3OVd4?=
 =?utf-8?B?SGFKaUFvSU9kRk8yVDNlVEVFeE5WTWI0RURjN2hnVFA5c2ExZkR5R2Fzc1VS?=
 =?utf-8?B?dlVkMG15djhidTVmVkZFSkQ3M2tWTFlGc3JFRjljZEZ3RVlsNjFtZEhSVlli?=
 =?utf-8?B?b0FCR0dQd0lMYkhkZXlzOWZ1bGxUMEo3TUNYWjVzd1VIczhnTXY0anpqL2VL?=
 =?utf-8?B?ay9maWhCdWNpZTJQWXJTRWRJa3lmSEpDVmhoSHNIRWVnVEF5WjdINXMrY0hq?=
 =?utf-8?B?ZHgwSHRkQ2ZnQjBvTU1Ea3g0ajUvRjV5bFpwNnZtd0FpcTZrajNlcVovcm1t?=
 =?utf-8?B?NHZ3ODQzZTJMYk9WNjF1N1hFbnJHOTVSN2lTUnR0Z1FiWXZKOTMxc3lEWmpL?=
 =?utf-8?B?dlFZWTZJeEFOUHA1OFZCMlVLQ2gxckdwTHJYMGxuenZJdzQvQ0VZOGRaK0Rz?=
 =?utf-8?B?OEozTDdQWlhSRk9rQzNCUEpXZFRWeGNqQ3dzUmdBNTZTZTZFeHFqeno3aWNn?=
 =?utf-8?B?VTlUdmVkT2FxRTU3cGwyMFVwU0tHc0xsVnhGY2huN3hLOUI4NDBpVjBpdUF4?=
 =?utf-8?B?bkNBWkczU3dQU3ZNbzVJUk4yNDlrdDVNQmxSR3FHRE1STlpwOW9WaXRlMmFp?=
 =?utf-8?B?UVgycVhOU2M5aWY1OFFWZEh1eXEzc1FIRTJicy9peGEyRTVlKzFNT3RDYlFn?=
 =?utf-8?B?VmFWWDhuaWk2SmhyT1ZOaFhQNkhQUzgvemRuWm04MEp6S0hmcm5DRDE1bndX?=
 =?utf-8?B?bmszTzQzcytHVW9NVFo4RTBKZkxsN3AxZW9Yenk4UEFwTDNsRHdxa3BRNUJ5?=
 =?utf-8?B?QWpxTEFUUGhLNVE4S2YyY2EreXhXZTdjU0xGdnozMTVTTXVDY2VTV2F3eFZ5?=
 =?utf-8?B?cjQrVDJ4bGdxUTBueHFWYTdNRmJock02QkpiTEVFSXkxMFAzZmpWYnJQUzF3?=
 =?utf-8?B?UVgxZHdMeGdPS0RnSHdIaTdtUnlBbTQvcjRhbjlBN042QUt3dG9QQXZ4TFEv?=
 =?utf-8?B?MGN2QzVNRXZ2aVZON2Zna09GUlVHeGsvZDMwZ0x6MWU5NzBSNE96WlJLZ1gv?=
 =?utf-8?B?NTRXR2cwMllabDFIYnE3ckkrRVRRK01pbUtFZUc2YzlXUk9nZG56a2VoQWE2?=
 =?utf-8?Q?lRB1/uIicgk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVFLZzJrZ1l0SU16TVA1eTB4L2paN1FMWWtnazVZbWhDQXFUQkZRZHZHY3lW?=
 =?utf-8?B?d1VGNTYyaUlVdkdpYUh3dXUvcXp2N2lDSHV4WGdEVlNjMDducWs5ak11SGt0?=
 =?utf-8?B?Z2t3OVBvejNYZEplSnRWQi9VQktjNVp4RWx4bmozVjlIM0U0ejFtcHhCby8z?=
 =?utf-8?B?VHR5R2s5WDBKRzBicXpaR1NLaHczU1pNMlVsdGlCbGl2VGlnNHlSZ0xOZ3Vh?=
 =?utf-8?B?UjFPcmQ3VFMzdkJaR2tQSHBIeld4aWhwaE50SEFvN3R3ejVwbWt6ejZPLzNM?=
 =?utf-8?B?cko4UVJ3ZDlpRXRUL0h5TzZFSG5ieFhGcmpkeTRadEtaeEpQcDRlbGJzRGVI?=
 =?utf-8?B?MlVoQis5WTM1VFdaV1F0RzcwUDBBYVZmSEZvMlUzbTgzWFpvSnBuZXY2eVA0?=
 =?utf-8?B?NDhkRjJqcW5HekRWNWtMR1AwTVMybFUrN0RKZmhUa05nQmVvMEc0ZFFZcmln?=
 =?utf-8?B?Uk42ekE3NFk5bDhFcjhkaEZrSXdqaFZ4bERVcW5zYVRCWGZSaGZNUG5ydGRp?=
 =?utf-8?B?NzljQ1N3Zk1jZlA1Qko0amRUTTlld1luZzFySlJ6ZDFsVXl2NVFKa0c1Ymwv?=
 =?utf-8?B?QWRvN0tJeU5sZDhFQkhXUDNqUE44VTNYcmIzRm43cDBuQUQ5ZWV3Zm9XL2Rx?=
 =?utf-8?B?YmJkR2E5TkpRdWN0b29DVVdKbGQ1RCtIREgvczJVL21GcTN4c3MxWVJVdlFO?=
 =?utf-8?B?eHdPaWF2MWxQSGNxazkvUUxFNUtFT05JZzBxcnk5cWJYQThGZEoyRUFGZTV0?=
 =?utf-8?B?b0RweXBWSGI0aGMySnQxSHhLR2xjT24zMmo1SjZScjRLdHdPamhBS2YvbCtV?=
 =?utf-8?B?SFl2ZkMzNjA5QnZ4cDlGcGYwN2JBWlRMaEVleTlqOC9La00ySzlQQVN3dW1j?=
 =?utf-8?B?VHlkOU5PaDM3LzVkMlYwMmduWHk5NWdsczh1d3FMQWw0d1MycXdLWkx0bm5n?=
 =?utf-8?B?WSszSjV1T3R0Qm9Yb0pGODRGT1VuK2FobVZWTzRxRktEZ2xUZ0hyYUdNR1Vs?=
 =?utf-8?B?ZWlkTno3TjNlN1pycU1hUWtWSi92UWtIZEJ3VGEzUHRBM1pQQU5xd2dnWWtj?=
 =?utf-8?B?d1FnQUp5Nll1WXUvR2NGQ3NNdFRsTkJJUTI4d2NXbms2WW1GZnlVdEtOSDJa?=
 =?utf-8?B?K1JhZmNtSTZBcGpqOWptQ1IzdVBrNkxkSUZ5Ym5qd09pZlZmLzhqNXhEK3Vv?=
 =?utf-8?B?OUdMbW0yN2ZpV1JGbW13Nkoxc1FBSHlzTlVxZTBpRDM0V1IrQ2QyNnlUY2Nq?=
 =?utf-8?B?SjhNdXM3YTBoai9iYXYvQkpucDVQdmlFV1FuU0tTWkZqU0l5OThodzlpbFZ5?=
 =?utf-8?B?dzIxcHAyblg4QTczWE54d05JZ2pveitKSS9zVUNYSkhGbG1UNnFVNkh0MGpI?=
 =?utf-8?B?QzVIVHVTSjRTL29OQVMvZE1PUlowbnVBVmZmVEpFTCtodEJ5em4rclVxKzhD?=
 =?utf-8?B?ZUNxczdXNzJqcnZiRytaNzlXdC94aGExa05palJWMFNSUEhyY1A0UEtscUFV?=
 =?utf-8?B?T050YmJnQy82eW9yT1QwS0pSWHlURHNNbHMyZlhqME5ZMUtLWFNEYkNZNUFs?=
 =?utf-8?B?MW5DTWlNNjgrb1kwTmI0TUs1MFFvalVsanZnOFlMT0FMR1pwcGR5RTlaRmNQ?=
 =?utf-8?B?OXlXTEhHYncwcXFpNy9aaEdBRVl1ZGlLZmlRUVNMekFFUVIzUjNxS0laZWtX?=
 =?utf-8?B?SElTWTc4dCs5Uk8reFJpME16dXkvUnVjUTFoaVRZckxKcHFuNXdYQkJGS0ty?=
 =?utf-8?B?eXRjWS9LRDREME1OMUlCTTloQzY4dkFtTzk0QjZOdkZ2K2FLQTNIWi96NDYx?=
 =?utf-8?B?UXZQeVFDRFhKNEZ6VzhDY2RwVXU5aUNIcUJzS0RpWmFmMklJWXBXSFNkZ0Vs?=
 =?utf-8?B?UjNrNmNWSWEzdTZBV2ZFZUZUazBFMUJVNVA1VWNDeE9vd1pwMVo5THF4VW91?=
 =?utf-8?B?M3Z0U05vMUdlaUN0NSsxYVFaQWNYcWR4dmVQUEZJN01zalEweDk0Q0FDMEk1?=
 =?utf-8?B?RmYraGMvM2VHdEhad0YvQ3Z6d2hTRk40azBocGhVeERad1pBeUQ2TXN6VnZ1?=
 =?utf-8?B?SWI2ZUR3NFRJc3g1ZEFHQVl4MFRscWVUelB5N3ZONGoxMWJqS0dodWxZa3kw?=
 =?utf-8?Q?rrne+mqdBWD+ylBdMUQy7EFKn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f1802c6-3826-4720-40f8-08dda20013f6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 18:05:37.6376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PXN3KDW6TMvjmfuC44t12Jv2qYVhQwrKkhpiNJYbpVC4byhAngf9BiYgBCvI53VY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7903
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

On 6/2/25 17:29, Tvrtko Ursulin wrote:
> Currently the TTM shrinker aborts shrinking as soon as it frees pages from
> any of the page order pools and by doing so it can fail to respect the
> freeing target which was configured by the shrinker core.
> 
> We use the wording "can fail" because the number of freed pages will
> depend on the presence of pages in the pools and the order of the pools on
> the LRU list. For example if there are no free pages in the high order
> pools the shrinker core may require multiple passes over the TTM shrinker
> before it will free the default target of 128 pages (assuming there are
> free pages in the low order pools). This inefficiency can be compounded by
> the pool LRU where multiple further calls into the TTM shrinker are
> required to end up looking at the pool with pages.
> 
> Improve this by never freeing less than the shrinker core has requested.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/ttm/ttm_pool.c | 25 +++++++++++++++++--------
>  1 file changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index c2ea865be657..a3247a82cadd 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -1132,17 +1132,24 @@ void ttm_pool_fini(struct ttm_pool *pool)
>  }
>  EXPORT_SYMBOL(ttm_pool_fini);
>  
> -/* As long as pages are available make sure to release at least one */
>  static unsigned long ttm_pool_shrinker_scan(struct shrinker *shrink,
>  					    struct shrink_control *sc)
>  {
> -	unsigned long num_freed = 0;
> +	unsigned long to_scan, freed = 0;
>  
> -	do
> -		num_freed += ttm_pool_shrink();
> -	while (!num_freed && atomic_long_read(&allocated_pages));

This can be massively simplified by changing this here to (num_freed < sc->nr_to_scan && atomic_long_read(&allocated_pages)).

Regards,
Christian.

> +	to_scan = min_t(unsigned long,
> +			sc->nr_to_scan,
> +			atomic_long_read(&allocated_pages));
> +	while (freed < to_scan) {
> +		freed += ttm_pool_shrink();
> +		to_scan = min_t(unsigned long,
> +				to_scan,
> +				atomic_long_read(&allocated_pages));
> +	}
>  
> -	return num_freed;
> +	sc->nr_scanned = freed;
> +
> +	return freed ?: SHRINK_STOP;
>  }
>  
>  /* Return the number of pages available or SHRINK_EMPTY if we have none */
> @@ -1266,8 +1273,10 @@ EXPORT_SYMBOL(ttm_pool_debugfs);
>  /* Test the shrinker functions and dump the result */
>  static int ttm_pool_debugfs_shrink_show(struct seq_file *m, void *data)
>  {
> -	struct shrink_control sc = { .gfp_mask = GFP_NOFS };
> -
> +	struct shrink_control sc = {
> +		.gfp_mask = GFP_NOFS,
> +		.nr_to_scan = 1,
> +	};
>  	fs_reclaim_acquire(GFP_KERNEL);
>  	seq_printf(m, "%lu/%lu\n", ttm_pool_shrinker_count(mm_shrinker, &sc),
>  		   ttm_pool_shrinker_scan(mm_shrinker, &sc));

