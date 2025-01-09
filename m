Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DE5A0766C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 14:04:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C81E310E375;
	Thu,  9 Jan 2025 13:04:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="R8aAQAU4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::626])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC8D10E375
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 13:04:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qGlWuz+wlHJQzaYuiW0SGMv2NctuYxFSNxSq8YoLstYZ0PVlJG9kbq4qgalhxUibOucj3oJ4vHE6ELdrBfZCJjPoFpWTdRXQSMQ9/ZWXW3JgDIuF5LzL8XcsyKyCOEjc8Gs5qQSomG0ygEdRero5f12u5tpAarzs5bZzneytCpoC4vxooDpIrIqkqYnVEObGODUTm01p9SY3DwyUIudjgHpnHEWIe4VF1y6WEAWwCthjqkRuSp4Ha1Codu6yargyK9SY0ra7U7e7bOh6kAJP8YUWlqEZVPMfgqycKEdVzwV+XlDECwM4E1bz0C7yzIQdS/S1wbLLuxoWZ+Ah643Miw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WD6YghE2MRBdg5w8Da8u5CM5AuFh5fjHT0nqPnvQg/o=;
 b=XOPvfbZf8NtVj1og+Y0KxvFXqeIrB7x5wxp/BRM6R8oeIP32DqZOrWJQ55vsOH3kg4MMLrW8xPhgzVq0aH3HLbE+5EbIBqF7fJZPpJqrPJsVQ57NpKOZ+eVbnNywDkv9yedgA3hvebuz+k6XdRuu1kRNw8iE6x5HVVess24wOZHcvS2Dmwv/zm3+58/r0ORMAR5iH507WOBP9nbgguu3wDBfg90fOGYsnwiNjsrHeM43OH59gNny5v2ZPguuFiRRh8pcen/pqX4q66qBUNBKf0RGR5y7sbjUQxLvyZxxa34K9sJJnvoO3PA9/EkfmwwFYnTEXVCv7ol9N2XQIIapvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WD6YghE2MRBdg5w8Da8u5CM5AuFh5fjHT0nqPnvQg/o=;
 b=R8aAQAU4GW58FJ/oGJAomxWITP9LiN4rUGRpW0nuHL9WZQtpdevtNiAohuWMRii/Lx6No4CgSuFdwf/ZMEIoeTI0swcy8ZAAwDAuftubqTfHAVP+EKzM8AO5pFa6nMbRWE9LjFCENLh3x8Z/HbC626OwJbAUYEE8Hq+FTdcvhTw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB6457.namprd12.prod.outlook.com (2603:10b6:208:3ab::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 9 Jan
 2025 13:04:06 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 13:04:06 +0000
Message-ID: <90715245-eb89-4cd6-9848-1d46ba634bea@amd.com>
Date: Thu, 9 Jan 2025 14:04:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 14/18] drm/sched: Remove FIFO and RR and simplify to a
 single run queue
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
References: <20250108183528.41007-1-tvrtko.ursulin@igalia.com>
 <20250108183528.41007-15-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250108183528.41007-15-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB6457:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dbbce8f-b08f-483d-5d7e-08dd30ae193d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aTJ4RnJzck1kc2ZFb3BJMG95RjdvTG54OHg5N0t6Um5ZWnYyL1Z4TTRjdFBs?=
 =?utf-8?B?aWswVndLOHNBMmRnSWFQTXJWdlVSNFRlSUVWMER2eEZCaFlWd0JBYlcrUnR6?=
 =?utf-8?B?WUVmK1dvWXc5YlpsdGNWd3VKWE90THg3d3ZacVpnQmVKcWVteElUSTE2UWkv?=
 =?utf-8?B?R3UwQzU1Z3l5aWdPUWJZVlgwbWx3Y0VLMVJnRnp2MG9CNWNNMUFRUFQ2SWdP?=
 =?utf-8?B?VDJxMVRzaTM4OHlyd0pubVVJVXNVUlNpK2pqSUF1N09qbDMzSGxTUFRpMWN2?=
 =?utf-8?B?UVo5TVpnNE8vYVBHZUl2NENFQTFRRGs1cld0L21NZ2dYdzJSUWRGWnpRbEhl?=
 =?utf-8?B?TkxmdTdjSk5xMkFnd3MrR3hNMHZBU1hQLzJqSFZsalJOeW9Hc296dXA1OTlI?=
 =?utf-8?B?ZDdiT1lBbGZZOWlVTmJTbDVRa045Sm1hUFExa0grSlRDZlh3NXpCcmV4a08x?=
 =?utf-8?B?TEkrTTJjTExRRVpTa1pyQld6a1FqS2JzWGlUYlZGTDB3dXN3cWNIVmYrNkw4?=
 =?utf-8?B?TzJhcVlsZTVXOUhxMGV6QUphb3FSclphSDlyWWxHV1p6dG54U2pLaDd3NjZD?=
 =?utf-8?B?UElNcWtCdWxKZmJCdEsxNlh5NktqeXkyOEFhUWhTbWZuK016cnFNWElxT2RK?=
 =?utf-8?B?elJrbHlGTWoxRDZybGdsNmJJNWk5aGtsTHh3cDlyOTF0YkxMSFJmY2g3dGU5?=
 =?utf-8?B?WTlyTHlsUkRicGt4OUxmTm5PMllpOGhLVGIrSW13b2NBQ2wrTmZoRFFGM1Ri?=
 =?utf-8?B?blA5Z2hqanF1K2RvbFA2YmY0YVpOVjJUMGhBNU1YTG5tNVZxaTErMWFjOGV4?=
 =?utf-8?B?SlRFaytDckJraWRTUi9IL3BDaUhPNnplOFJRWjcrNXRlQjhFYkd3ZkF2VTZG?=
 =?utf-8?B?Y2R1dENwblBsaDhQSG1GS2tTMjlQSVRENmNXWTV6WUM0cm9ORk1NNzQrcytI?=
 =?utf-8?B?VUpZWlJKRkNSQlQzU3FVUzJpcW51eXIzTnl2UVpZNlBJOFFGMGY0VnBRZHFi?=
 =?utf-8?B?bkpEeWxNNFhqRFdXTWVYMlFiR0NCVncvZVUzdWFjSWRFVmdKM3hoRFNKdGVi?=
 =?utf-8?B?cTY2NUk3OWpTa0sxVzFEd2Y2UzNHQklWYnJ6ZFZRZTY1N1dMODJuVHRmWXpN?=
 =?utf-8?B?bUpWc2RqN0JmenRCckhEVlROMGsxQUtwSFQzYmZLcjlXbG93YzNLMTdWWW5D?=
 =?utf-8?B?NlFKRVF0eWYwS0tRd0NvV1IxZFFjejVoUDA4enlNdnJSdkpGZi9CbzY0S21o?=
 =?utf-8?B?d0kzYUk1RldzUkxhTHZuREwwOGk4K2ZTTW81NVVZUFZ6QzR5aUdZSHpBMHlZ?=
 =?utf-8?B?TVhpdi9HbW9PREFTOWh5dE1nYzg0Tkp2WXFOV0NVUUcrMmtpYS92VEpDY1gw?=
 =?utf-8?B?cTBqZmJaeFR5Mi9DR1FVRVpacWZIcHVSVXhkdWxEM2dkT3BIei9qZkR5NlpP?=
 =?utf-8?B?N3RpaVBzRnhKMHpLT0V3SXkydC9Bb3VjdVlHVDgwcVNkS2ZrNTBBR0Y2ZHVZ?=
 =?utf-8?B?QnlPUmU4T2ZIK1VKSmlFVWJyaUxueU01TGdrYmNxbmNTanNmNGtzeXQxdGUv?=
 =?utf-8?B?MWR5T2ZEZ0JxaU9sMFdCZStiWE95WUlmeXAxSE5hNC9KWHlQT0t1cElUUVBF?=
 =?utf-8?B?dThuK294ZXpjUnNSOXVIbHd6aDlHSEZDSFNWN3BNS0xUamF0MVVTUWhnaTZN?=
 =?utf-8?B?WVdNR2NITFVRSGt2QU1SZEpYYkZvZHRrYlg3eUNjMG50RFJxdzdsTllYRjZa?=
 =?utf-8?B?aU1aZlpURVdJRlRlUWtEekhwUC9iMjQ5THp2UUJlYVJNRVlldHN4ekQzWWZj?=
 =?utf-8?B?T2N4VXF0V1Jmb1U0UHhuYnBKT0cvdjNjWXpXaVRQTCtmQ2VHQ1Y2WHJ0RW4r?=
 =?utf-8?Q?dGLVKbsJjzoCs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkNGOTNQTU5XcWU4akJ0cHZoZThIT2gxb0hWeVJCNjJna3Z0MzMvUlgrRUdi?=
 =?utf-8?B?SzYrOVg0UDdyUkg4eVJUYm0vZmdFVis2YjRTakEwaGFCcy9GRVh3cmoyclhX?=
 =?utf-8?B?S0REcncyVllEZnkwZnJZa0JCZU1PYVlCSFo1STFic2o4Q2hPemlBb3RuMUpj?=
 =?utf-8?B?VkFJRStrRUlzR0VQZ2o1OWpLeEZBM01VYWlmLzBON3IvWWdzbkR4QXhIZzZX?=
 =?utf-8?B?MmJSdTJNTlpzaEV1ZnhKOUdFNGh4TjNycTNCaVRKK0hMVGszUHAyQzVSN2w2?=
 =?utf-8?B?bSsyLzJQOTZOL2tpMThPazFQTWhmOHBxbllPcThvcnc1dWJSbzBXSzZXNHcr?=
 =?utf-8?B?NitDU256QVNIN0xDbGh1TTdORVQzZ0lJdWhaLysvQU5IODh4bGRtUG5XKzc1?=
 =?utf-8?B?ellHMEdjMTBkUWluNlhEUXZWMW95NHYxYlYwTGFyc2hUbE5hNEVKUVJGaWJ1?=
 =?utf-8?B?NEJ1d3dBTUYrVmdWUVhBQjVaNUhOSmQ4Ym5BaU5tSG1BZ2kwODVXMkRDcldw?=
 =?utf-8?B?aGREMjNqZis3RCs3OXR6cENjSHVKaUJSU3pvWWVKNi8vR0p1YSt4Y3RCSVI0?=
 =?utf-8?B?clQzL0pCdmlqbHpXUXM0RjBkQVJIcUsrdHprcFFvZU9DYmJXRGQxc3NFcUFO?=
 =?utf-8?B?VTBMTHdFQTIzQVNhYVE5SmNmdXJzb1ZFVjVDb0l4RHZCeDhFaVVtYnh6MjJx?=
 =?utf-8?B?bDMvUXRuTjJ2aW5sUFVZeDFHaVVKakhXQlc4cmt6aDJNbVZSUHRZMU1kWnMy?=
 =?utf-8?B?Qm54enhISUhpSnVrZHpsV244TWNLZnN3MmYvTXdEZHUwb1lTVlZKc3dBYkds?=
 =?utf-8?B?dE5EdDNzK3JxV09pdFJnemFlZkE2NjF6M05PTjJrZDZOdnd1V2hNdFpUNVJ2?=
 =?utf-8?B?UGpCM21TZDZhMlVVNG1RUUYxVy84cUtnYzBBV3IyeTA4U3pGR01yTDVGaGVT?=
 =?utf-8?B?Q281NndBNFFJWFRlcjVJVk01NUEydUUrMlc4Sk5PVkZ1dUVaWmJ1Zm0wejlx?=
 =?utf-8?B?MDNyU1BRclgycGRWb1B6SGtqR0xpOVQza2VIT0FuVVN2UElxZ2FiVEFnVXZk?=
 =?utf-8?B?SlExL0dNT0tsMUlabUYrV0pqdFRlcFVOSjFKZ0hJV3FFRlQ3VDM1SXNEMTA4?=
 =?utf-8?B?TFhwQXl5VkJPSm1DQzI2ZzZhNGs5Qk5UcUNUTFNuMGxzcy9DZmlRVWNXSTd0?=
 =?utf-8?B?cGRTUWZjRGQ3TjkvUjhQQTJoZE8vSUJENUw2MGVGdjNCMys5TlBDajZvNERh?=
 =?utf-8?B?RmYvbzdrWU5jVlUxQkRVM3hLZDFnVmY1NWtUVlFaZXBDQmYzdXdmczYwV2p6?=
 =?utf-8?B?bkV2OGNudFhiUGwzYmJ6Ull0M2hLdGFzby9ndGVGTkp2WGwzb3pWSGZpNVgr?=
 =?utf-8?B?RVdTUHhXRzNFeXNLb3ZPRUsxYm03VjFjZ2UvR0NYdG8rMHBDNUxGSWZlanJu?=
 =?utf-8?B?cEFRKzhTUXpBcU5xUmIvWDJwWFBpTmtDVnhuUExCMmRvU2k0LzFROVJEeFdB?=
 =?utf-8?B?clJ2L0dHSEtJMk82OFB1UlhCWWpwT3RhSDNTdXM2aW5GelJwbE42cVJncXE4?=
 =?utf-8?B?SjJzR3l6MGJBNjZ1cVE5UmJWd1VIeTNBQzJLRUVNdHNIbC9xWXRyU3R3Wmh5?=
 =?utf-8?B?cVFNWUhOL1l4QVBlM3Y4Y2x6ektVa1ZxdGJVanYxQzNWQUNQVVk0dmRQaFgw?=
 =?utf-8?B?ZVBGMndxanU3MTNzamRDTzFQem1id2RHblpNTmNCSGl5bWJyTkFFRVBTdDJS?=
 =?utf-8?B?Y1F1MHZ0UTIrWGJaWG9CSlBzOTRzdkF1TWRiRGFYaHQrdUI4M0l2NUZPSGpS?=
 =?utf-8?B?OGF3NWpsL09GMlp1dFJubkU1cmZyUWZucmJpeG1HSm9vQ0RaSE4xbDlWV3hj?=
 =?utf-8?B?MnZuOFdCY3Y5dWNJYTFua0NRMGRxOFRCNFlzK3hSdGdSS0xTY3A0cFQ3ZEU5?=
 =?utf-8?B?NExYbmV2VEszTXpsRzh6KzJCVXI3K0tIR1lzYkcxcGVoSkRqSlA0bnRzTU9B?=
 =?utf-8?B?dkVNbVV2dTdETzZpcmwxRjB2NFFMb2dMTkRYL1dtbXlPall5WGdKQ2xsWHhs?=
 =?utf-8?B?UjNhRmJwVkt0K3AzUktMWjRacHhURkRpbVg1RHRENFlWSEQvdHhkQVEvRzhj?=
 =?utf-8?Q?vO6H6U/0zG9rnQhllhH3qLZMq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dbbce8f-b08f-483d-5d7e-08dd30ae193d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 13:04:06.3750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L6iUVgCv0/GI7XGIrru1MyISG+ZzkyMZS3Jrs8szNYwKpPHi5hmNxrh7au8iXZCP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6457
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

Am 08.01.25 um 19:35 schrieb Tvrtko Ursulin:
> If the new deadline policy is at least as good as FIFO and we can afford
> to remove round-robin, we can simplify the scheduler code by making the
> scheduler to run queue relationship always 1:1 and remove some code.
>
> Also, now that the FIFO policy is gone the tree of entities is not a FIFO
> tree any more so rename it to just the tree.

Yeah that's exactly what I mean with my comment on the other patch.

I'm totally in favor of that, feel free to add my acked by to this approach.

I will try to find some time to give it some in deep review.

Thanks,
Christian.

>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <pstanner@redhat.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  23 ++--
>   drivers/gpu/drm/scheduler/sched_entity.c |  30 +----
>   drivers/gpu/drm/scheduler/sched_main.c   | 136 ++++++-----------------
>   drivers/gpu/drm/scheduler/sched_rq.c     |  36 ++----
>   include/drm/gpu_scheduler.h              |  13 +--
>   5 files changed, 56 insertions(+), 182 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index b9d08bc96581..918b6d4919e1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -418,25 +418,22 @@ static struct dma_fence *amdgpu_job_run(struct drm_sched_job *sched_job)
>   
>   void amdgpu_job_stop_all_jobs_on_sched(struct drm_gpu_scheduler *sched)
>   {
> +	struct drm_sched_rq *rq = sched->rq;
> +	struct drm_sched_entity *s_entity;
>   	struct drm_sched_job *s_job;
> -	struct drm_sched_entity *s_entity = NULL;
> -	int i;
>   
>   	/* Signal all jobs not yet scheduled */
> -	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
> -		struct drm_sched_rq *rq = sched->sched_rq[i];
> -		spin_lock(&rq->lock);
> -		list_for_each_entry(s_entity, &rq->entities, list) {
> -			while ((s_job = to_drm_sched_job(spsc_queue_pop(&s_entity->job_queue)))) {
> -				struct drm_sched_fence *s_fence = s_job->s_fence;
> +	spin_lock(&rq->lock);
> +	list_for_each_entry(s_entity, &rq->entities, list) {
> +		while ((s_job = to_drm_sched_job(spsc_queue_pop(&s_entity->job_queue)))) {
> +			struct drm_sched_fence *s_fence = s_job->s_fence;
>   
> -				dma_fence_signal(&s_fence->scheduled);
> -				dma_fence_set_error(&s_fence->finished, -EHWPOISON);
> -				dma_fence_signal(&s_fence->finished);
> -			}
> +			dma_fence_signal(&s_fence->scheduled);
> +			dma_fence_set_error(&s_fence->finished, -EHWPOISON);
> +			dma_fence_signal(&s_fence->finished);
>   		}
> -		spin_unlock(&rq->lock);
>   	}
> +	spin_unlock(&rq->lock);
>   
>   	/* Signal all jobs already scheduled to HW */
>   	list_for_each_entry(s_job, &sched->pending_list, list) {
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index e3c875b0afe8..98c78d1373d8 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -71,8 +71,6 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>   	entity->guilty = guilty;
>   	entity->num_sched_list = num_sched_list;
>   	entity->priority = priority;
> -	entity->rq_priority = drm_sched_policy == DRM_SCHED_POLICY_DEADLINE ?
> -			      DRM_SCHED_PRIORITY_KERNEL : priority;
>   	/*
>   	 * It's perfectly valid to initialize an entity without having a valid
>   	 * scheduler attached. It's just not valid to use the scheduler before it
> @@ -82,30 +80,14 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>   	RCU_INIT_POINTER(entity->last_scheduled, NULL);
>   	RB_CLEAR_NODE(&entity->rb_tree_node);
>   
> -	if (num_sched_list && !sched_list[0]->sched_rq) {
> +	if (num_sched_list && !sched_list[0]->rq) {
>   		/* Since every entry covered by num_sched_list
>   		 * should be non-NULL and therefore we warn drivers
>   		 * not to do this and to fix their DRM calling order.
>   		 */
>   		pr_warn("%s: called with uninitialized scheduler\n", __func__);
>   	} else if (num_sched_list) {
> -		enum drm_sched_priority p = entity->priority;
> -
> -		/*
> -		 * The "priority" of an entity cannot exceed the number of
> -		 * run-queues of a scheduler. Protect against num_rqs being 0,
> -		 * by converting to signed. Choose the lowest priority
> -		 * available.
> -		 */
> -		if (p >= sched_list[0]->num_user_rqs) {
> -			drm_err(sched_list[0], "entity with out-of-bounds priority:%u num_user_rqs:%u\n",
> -				p, sched_list[0]->num_user_rqs);
> -			p = max_t(s32,
> -				 (s32)sched_list[0]->num_user_rqs - 1,
> -				 (s32)DRM_SCHED_PRIORITY_KERNEL);
> -			entity->priority = p;
> -		}
> -		entity->rq = sched_list[0]->sched_rq[entity->rq_priority];
> +		entity->rq = sched_list[0]->rq;
>   	}
>   
>   	init_completion(&entity->entity_idle);
> @@ -575,7 +557,7 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>   
>   	spin_lock(&entity->lock);
>   	sched = drm_sched_pick_best(entity->sched_list, entity->num_sched_list);
> -	rq = sched ? sched->sched_rq[entity->rq_priority] : NULL;
> +	rq = sched ? sched->rq : NULL;
>   	if (rq != entity->rq) {
>   		drm_sched_rq_remove_entity(entity->rq, entity);
>   		entity->rq = rq;
> @@ -617,10 +599,8 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>   	if (first) {
>   		struct drm_gpu_scheduler *sched;
>   
> -		if (drm_sched_policy == DRM_SCHED_POLICY_DEADLINE)
> -			submit_ts = __drm_sched_entity_get_job_deadline(entity,
> -									submit_ts);
> -
> +		submit_ts = __drm_sched_entity_get_job_deadline(entity,
> +								submit_ts);
>   		sched = drm_sched_rq_add_entity(entity->rq, entity, submit_ts);
>   		if (sched)
>   			drm_sched_wakeup(sched);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index e2a67c7fe2d8..f748dcd06774 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -87,15 +87,6 @@ static struct lockdep_map drm_sched_lockdep_map = {
>   };
>   #endif
>   
> -int drm_sched_policy = DRM_SCHED_POLICY_DEADLINE;
> -
> -/**
> - * DOC: sched_policy (int)
> - * Used to override default entities scheduling policy in a run queue.
> - */
> -MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO, " __stringify(DRM_SCHED_POLICY_DEADLINE) " = Virtual deadline (default).");
> -module_param_named(sched_policy, drm_sched_policy, int, 0444);
> -
>   static u32 drm_sched_available_credits(struct drm_gpu_scheduler *sched)
>   {
>   	u32 credits;
> @@ -822,34 +813,6 @@ void drm_sched_wakeup(struct drm_gpu_scheduler *sched)
>   	drm_sched_run_job_queue(sched);
>   }
>   
> -/**
> - * drm_sched_select_entity - Select next entity to process
> - *
> - * @sched: scheduler instance
> - *
> - * Return an entity to process or NULL if none are found.
> - *
> - * Note, that we break out of the for-loop when "entity" is non-null, which can
> - * also be an error-pointer--this assures we don't process lower priority
> - * run-queues. See comments in the respectively called functions.
> - */
> -static struct drm_sched_entity *
> -drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> -{
> -	struct drm_sched_entity *entity = NULL;
> -	int i;
> -
> -	/* Start with the highest priority.
> -	 */
> -	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
> -		entity = drm_sched_rq_select_entity(sched, sched->sched_rq[i]);
> -		if (entity)
> -			break;
> -	}
> -
> -	return IS_ERR(entity) ? NULL : entity;
> -}
> -
>   /**
>    * drm_sched_get_finished_job - fetch the next finished job to be destroyed
>    *
> @@ -971,8 +934,8 @@ static void drm_sched_run_job_work(struct work_struct *w)
>   	int r;
>   
>   	/* Find entity with a ready job */
> -	entity = drm_sched_select_entity(sched);
> -	if (!entity)
> +	entity = drm_sched_rq_select_entity(sched, sched->rq);
> +	if (IS_ERR_OR_NULL(entity))
>   		return;	/* No more work */
>   
>   	sched_job = drm_sched_entity_pop_job(entity);
> @@ -1016,7 +979,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
>    * @ops: backend operations for this scheduler
>    * @submit_wq: workqueue to use for submission. If NULL, an ordered wq is
>    *	       allocated and used
> - * @num_rqs: number of runqueues, one for each priority, up to DRM_SCHED_PRIORITY_COUNT
> + * @num_rqs: deprecated and ignored
>    * @credit_limit: the number of credits this scheduler can hold from all jobs
>    * @hang_limit: number of times to allow a job to hang before dropping it
>    * @timeout: timeout value in jiffies for the scheduler
> @@ -1035,8 +998,6 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   		   long timeout, struct workqueue_struct *timeout_wq,
>   		   atomic_t *score, const char *name, struct device *dev)
>   {
> -	int i;
> -
>   	sched->ops = ops;
>   	sched->credit_limit = credit_limit;
>   	sched->name = name;
> @@ -1046,13 +1007,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   	sched->score = score ? score : &sched->_score;
>   	sched->dev = dev;
>   
> -	if (num_rqs > DRM_SCHED_PRIORITY_COUNT) {
> -		/* This is a gross violation--tell drivers what the  problem is.
> -		 */
> -		drm_err(sched, "%s: num_rqs cannot be greater than DRM_SCHED_PRIORITY_COUNT\n",
> -			__func__);
> -		return -EINVAL;
> -	} else if (sched->sched_rq) {
> +	if (sched->rq) {
>   		/* Not an error, but warn anyway so drivers can
>   		 * fine-tune their DRM calling order, and return all
>   		 * is good.
> @@ -1078,21 +1033,11 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   		sched->own_submit_wq = true;
>   	}
>   
> -	sched->num_user_rqs = num_rqs;
> -	sched->num_rqs = drm_sched_policy != DRM_SCHED_POLICY_DEADLINE ?
> -			 num_rqs : 1;
> -	sched->sched_rq = kmalloc_array(sched->num_rqs,
> -					sizeof(*sched->sched_rq),
> -					GFP_KERNEL | __GFP_ZERO);
> -	if (!sched->sched_rq)
> +	sched->rq = kmalloc(sizeof(*sched->rq), GFP_KERNEL | __GFP_ZERO);
> +	if (!sched->rq)
>   		goto Out_check_own;
>   
> -	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
> -		sched->sched_rq[i] = kzalloc(sizeof(*sched->sched_rq[i]), GFP_KERNEL);
> -		if (!sched->sched_rq[i])
> -			goto Out_unroll;
> -		drm_sched_rq_init(sched, sched->sched_rq[i]);
> -	}
> +	drm_sched_rq_init(sched, sched->rq);
>   
>   	init_waitqueue_head(&sched->job_scheduled);
>   	INIT_LIST_HEAD(&sched->pending_list);
> @@ -1104,15 +1049,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   	atomic_set(&sched->_score, 0);
>   	atomic64_set(&sched->job_id_count, 0);
>   	sched->pause_submit = false;
> -
>   	sched->ready = true;
>   	return 0;
> -Out_unroll:
> -	for (--i ; i >= DRM_SCHED_PRIORITY_KERNEL; i--)
> -		kfree(sched->sched_rq[i]);
>   
> -	kfree(sched->sched_rq);
> -	sched->sched_rq = NULL;
>   Out_check_own:
>   	if (sched->own_submit_wq)
>   		destroy_workqueue(sched->submit_wq);
> @@ -1143,25 +1082,21 @@ EXPORT_SYMBOL(drm_sched_init);
>    */
>   void drm_sched_fini(struct drm_gpu_scheduler *sched)
>   {
> +
> +	struct drm_sched_rq *rq = sched->rq;
>   	struct drm_sched_entity *s_entity;
> -	int i;
>   
>   	drm_sched_wqueue_stop(sched);
>   
> -	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
> -		struct drm_sched_rq *rq = sched->sched_rq[i];
> -
> -		spin_lock(&rq->lock);
> -		list_for_each_entry(s_entity, &rq->entities, list)
> -			/*
> -			 * Prevents reinsertion and marks job_queue as idle,
> -			 * it will be removed from the rq in drm_sched_entity_fini()
> -			 * eventually
> -			 */
> -			s_entity->stopped = true;
> -		spin_unlock(&rq->lock);
> -		kfree(sched->sched_rq[i]);
> -	}
> +	spin_lock(&rq->lock);
> +	list_for_each_entry(s_entity, &rq->entities, list)
> +		/*
> +		 * Prevents reinsertion and marks job_queue as idle,
> +		 * it will be removed from the rq in drm_sched_entity_fini()
> +		 * eventually
> +		 */
> +		s_entity->stopped = true;
> +	spin_unlock(&rq->lock);
>   
>   	/* Wakeup everyone stuck in drm_sched_entity_flush for this scheduler */
>   	wake_up_all(&sched->job_scheduled);
> @@ -1172,8 +1107,8 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
>   	if (sched->own_submit_wq)
>   		destroy_workqueue(sched->submit_wq);
>   	sched->ready = false;
> -	kfree(sched->sched_rq);
> -	sched->sched_rq = NULL;
> +	kfree(sched->rq);
> +	sched->rq = NULL;
>   }
>   EXPORT_SYMBOL(drm_sched_fini);
>   
> @@ -1188,35 +1123,28 @@ EXPORT_SYMBOL(drm_sched_fini);
>    */
>   void drm_sched_increase_karma(struct drm_sched_job *bad)
>   {
> -	int i;
> -	struct drm_sched_entity *tmp;
> -	struct drm_sched_entity *entity;
>   	struct drm_gpu_scheduler *sched = bad->sched;
> +	struct drm_sched_entity *entity, *tmp;
> +	struct drm_sched_rq *rq = sched->rq;
>   
>   	/* don't change @bad's karma if it's from KERNEL RQ,
>   	 * because sometimes GPU hang would cause kernel jobs (like VM updating jobs)
>   	 * corrupt but keep in mind that kernel jobs always considered good.
>   	 */
> -	if (bad->s_priority != DRM_SCHED_PRIORITY_KERNEL) {
> -		atomic_inc(&bad->karma);
> +	if (bad->s_priority == DRM_SCHED_PRIORITY_KERNEL)
> +		return;
>   
> -		for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
> -			struct drm_sched_rq *rq = sched->sched_rq[i];
> +	atomic_inc(&bad->karma);
>   
> -			spin_lock(&rq->lock);
> -			list_for_each_entry_safe(entity, tmp, &rq->entities, list) {
> -				if (bad->s_fence->scheduled.context ==
> -				    entity->fence_context) {
> -					if (entity->guilty)
> -						atomic_set(entity->guilty, 1);
> -					break;
> -				}
> -			}
> -			spin_unlock(&rq->lock);
> -			if (&entity->list != &rq->entities)
> -				break;
> +	spin_lock(&rq->lock);
> +	list_for_each_entry_safe(entity, tmp, &rq->entities, list) {
> +		if (bad->s_fence->scheduled.context == entity->fence_context) {
> +			if (entity->guilty)
> +				atomic_set(entity->guilty, 1);
> +			break;
>   		}
>   	}
> +	spin_unlock(&rq->lock);
>   }
>   EXPORT_SYMBOL(drm_sched_increase_karma);
>   
> diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/scheduler/sched_rq.c
> index ac28e2877585..d9c854b2e495 100644
> --- a/drivers/gpu/drm/scheduler/sched_rq.c
> +++ b/drivers/gpu/drm/scheduler/sched_rq.c
> @@ -12,7 +12,7 @@ static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
>   	return ktime_before(ent_a->oldest_job_waiting, ent_b->oldest_job_waiting);
>   }
>   
> -static void __drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity,
> +static void __drm_sched_rq_remove_tree_locked(struct drm_sched_entity *entity,
>   					      struct drm_sched_rq *rq)
>   {
>   	lockdep_assert_held(&entity->lock);
> @@ -22,7 +22,7 @@ static void __drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity,
>   	RB_CLEAR_NODE(&entity->rb_tree_node);
>   }
>   
> -static void __drm_sched_rq_add_fifo_locked(struct drm_sched_entity *entity,
> +static void __drm_sched_rq_add_tree_locked(struct drm_sched_entity *entity,
>   					   struct drm_sched_rq *rq,
>   					   ktime_t ts)
>   {
> @@ -56,16 +56,6 @@ void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
>   	rq->sched = sched;
>   }
>   
> -static ktime_t
> -drm_sched_rq_get_rr_deadline(struct drm_sched_rq *rq)
> -{
> -	lockdep_assert_held(&rq->lock);
> -
> -	rq->rr_deadline = ktime_add_ns(rq->rr_deadline, 1);
> -
> -	return rq->rr_deadline;
> -}
> -
>   /**
>    * drm_sched_rq_add_entity - add an entity
>    *
> @@ -99,12 +89,9 @@ drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>   		list_add_tail(&entity->list, &rq->entities);
>   	}
>   
> -	if (drm_sched_policy == DRM_SCHED_POLICY_RR)
> -		ts = drm_sched_rq_get_rr_deadline(rq);
> -
>   	if (!RB_EMPTY_NODE(&entity->rb_tree_node))
> -		__drm_sched_rq_remove_fifo_locked(entity, rq);
> -	__drm_sched_rq_add_fifo_locked(entity, rq, ts);
> +		__drm_sched_rq_remove_tree_locked(entity, rq);
> +	__drm_sched_rq_add_tree_locked(entity, rq, ts);
>   
>   	spin_unlock(&rq->lock);
>   	spin_unlock(&entity->lock);
> @@ -134,7 +121,7 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>   	list_del_init(&entity->list);
>   
>   	if (!RB_EMPTY_NODE(&entity->rb_tree_node))
> -		__drm_sched_rq_remove_fifo_locked(entity, rq);
> +		__drm_sched_rq_remove_tree_locked(entity, rq);
>   
>   	spin_unlock(&rq->lock);
>   }
> @@ -146,20 +133,13 @@ void drm_sched_rq_pop_entity(struct drm_sched_rq *rq,
>   
>   	spin_lock(&entity->lock);
>   	spin_lock(&rq->lock);
> -	__drm_sched_rq_remove_fifo_locked(entity, rq);
> +	__drm_sched_rq_remove_tree_locked(entity, rq);
>   	next_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
>   	if (next_job) {
>   		ktime_t ts;
>   
> -		if (drm_sched_policy == DRM_SCHED_POLICY_DEADLINE)
> -			ts = drm_sched_entity_get_job_deadline(entity,
> -							       next_job);
> -		else if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> -			ts = next_job->submit_ts;
> -		else
> -			ts = drm_sched_rq_get_rr_deadline(rq);
> -
> -		__drm_sched_rq_add_fifo_locked(entity, rq, ts);
> +		ts = drm_sched_entity_get_job_deadline(entity, next_job);
> +		__drm_sched_rq_add_tree_locked(entity, rq, ts);
>   	}
>   	spin_unlock(&rq->lock);
>   	spin_unlock(&entity->lock);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index a722c5d6e5f9..9f952574efe2 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -71,13 +71,6 @@ enum drm_sched_priority {
>   	DRM_SCHED_PRIORITY_COUNT
>   };
>   
> -/* Used to choose between FIFO and RR job-scheduling */
> -extern int drm_sched_policy;
> -
> -#define DRM_SCHED_POLICY_RR	  0
> -#define DRM_SCHED_POLICY_FIFO	  1
> -#define DRM_SCHED_POLICY_DEADLINE 2
> -
>   /**
>    * struct drm_sched_entity - A wrapper around a job queue (typically
>    * attached to the DRM file_priv).
> @@ -154,8 +147,6 @@ struct drm_sched_entity {
>   	 */
>   	struct spsc_queue		job_queue;
>   
> -	enum drm_sched_priority         rq_priority;
> -
>   	/**
>   	 * @fence_seq:
>   	 *
> @@ -524,9 +515,7 @@ struct drm_gpu_scheduler {
>   	atomic_t			credit_count;
>   	long				timeout;
>   	const char			*name;
> -	u32                             num_rqs;
> -	u32                             num_user_rqs;
> -	struct drm_sched_rq             **sched_rq;
> +	struct drm_sched_rq             *rq;
>   	wait_queue_head_t		job_scheduled;
>   	atomic64_t			job_id_count;
>   	struct workqueue_struct		*submit_wq;

