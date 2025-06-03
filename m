Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 098C7ACCAFF
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 18:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC0B10E90D;
	Tue,  3 Jun 2025 16:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GPdbwrB9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CFEA10E90A;
 Tue,  3 Jun 2025 16:10:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AAUG/Zqa6ZLEAfGiWbFKdhKpcL86D94o9Yfr67j9kZp+qT4BnMg5XmPt4aetzphyu4UBoV0LztiHGi3JBablPv2Bly9M2wfa1ZaspXZ7p1OADkocllTru6BVM2IA/WcF5Dzg3p/qtRdkPnt0biXayZ5Q2Gk7Lxd8NH7AAftqQaLnOZAneEAQsvQP5J+4n6KxrSbOmOxJCLX2ohyHoZZ+A9KetdhIFycsi+SNQJpwxYt9ptkF3uEcrixISoZ1AkbpQztPQ8d0pR7B+S37BakPIzqXV8xs1/AqQhM4u9oXbuoTjb6+dGGzuCSk15uusCrZciVprlG63bOn07npkjd/XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PHn8O3IhbyXFu2sN1maRcWVw6aE62t0K/mkmR2nGdWQ=;
 b=tusnzAn2owmdpd3uRPNwKwS/+aEOgEhBhPtIK/aAN2/i1wHhptDing+/Y7sT9fml5kIvJaNuO875PAPRJXTMu9CkZZCrrnGBhNa/546WDKf7RDnt2XKUQvYpRak7TGQ9Gqi0TV2U4sB1hapZJFUntlvqHcvqC6rfkqpMPIKKL/S/r/KoX8QyXnCIBy0pr61l59Luwi1peH6l1C5bl9akroAOQXm1gFnyLDl1TdQ6aQUKes9OHqOftYVUEuaPSy5Z9rDB4+oYKZeatHUrUaPTosF9uQjAdnVxUge5JQ96edcpbyy8wOPRpZZA7iRowQPZrPlCzRkuinekobAEK5aE4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PHn8O3IhbyXFu2sN1maRcWVw6aE62t0K/mkmR2nGdWQ=;
 b=GPdbwrB9B7AoXVmGJyRl0ib/RfTccNbywKFtw7xVYW/vsMBDHdQgoGUPnZU6NGrDHqZCU1Xy4sa2o+/qfutb0BVzpM1K0ETsEdUDI4HoJ6K8dXeClpLDQm5VFam2pLgqNTRBjttxrFgHEEvNqLKNuBB7DEGidhbFZFmxjVr8fB8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PPF89A593F05.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bd8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 3 Jun
 2025 16:10:46 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Tue, 3 Jun 2025
 16:10:46 +0000
Message-ID: <45240bbc-5b64-4e55-85c8-d8abb16abcfa@amd.com>
Date: Tue, 3 Jun 2025 18:10:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] dma-fence: Use a flag for 64-bit seqnos
To: Maxime Ripard <mripard@kernel.org>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 kernel-dev@igalia.com
References: <20250515095004.28318-1-tvrtko.ursulin@igalia.com>
 <20250515095004.28318-3-tvrtko.ursulin@igalia.com>
 <c93c05be-b2c8-42a2-84d1-32b90743eb82@amd.com>
 <b59cadff-da9a-409f-a5ed-96aafdfe3f0b@igalia.com>
 <13c5edf6-ccad-4a06-85d4-dccf2afd0c62@amd.com>
 <20250603-outrageous-kakapo-of-felicity-6dc41a@houat>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250603-outrageous-kakapo-of-felicity-6dc41a@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:208:23a::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PPF89A593F05:EE_
X-MS-Office365-Filtering-Correlation-Id: 961ccede-40ac-4b62-0e78-08dda2b932f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bGJtc0lDVTZOY21jMUF6YXVUZ0hqWVgzVVQ0NXkzeWt0cmxNbU50UnRmVjE4?=
 =?utf-8?B?ZDd1NlNBVlNYZUVrY0NPMm43QWpkMzJnTlBuM3Vnd1JKODVzZVZISWNzYnUr?=
 =?utf-8?B?UmR3Z2VBcHhvdWNaSnFCV3F1UzZraXRJaE1QRDh4aExxakY0R2JyZnJ1RUc1?=
 =?utf-8?B?UFRtN0RLYU5pc0RaZXhZc3p1bFI5b0pYK1JLdW5KZVp2S1VZVEtBMXV5dm5S?=
 =?utf-8?B?dEsrcXA5K0U2UmhmRVRiR0ZpaGhMYXpmNEdaOW12cG8rSUJzV2ZybGYySGlY?=
 =?utf-8?B?TzZ3SkNualNqb1lhWkt4QmZxdml1MmF4cmZ1Y2RFVkhsbENua2ZTM0VOV25W?=
 =?utf-8?B?bllMZ2M1YUhnN0dPeTF0d0R1cEpBY3JBMlZmYUVQRFdNNURBVVF3emRaUU14?=
 =?utf-8?B?Vk1abE9SNGlMdzc4SndkOGo0TFJTckhQbTVUVVZGbmc1eU5abnRzRU85VVBH?=
 =?utf-8?B?em1vRHlIQWZKVHdBMUxZWG1PRzRUQlhLZFVVZGJKSWRTZlhBN3ZlbWsxdVdY?=
 =?utf-8?B?QktlajBHenFNR0Y3a1Y1c1pGRkhNTFFyWkZpMDREMVVtbkszdm0rc3dqQjRZ?=
 =?utf-8?B?TkQ5bW9wRGoyT1Ftb1NGZlhXMEhFUXJwYUxjaTkzZjNFMmdKaEdrd2pKVW50?=
 =?utf-8?B?K0VVRlZNbFM3ckZRNlB3Nlc3M2gwb0c1c3FMc3pYTlJTU3NrRzJrZGRodmhy?=
 =?utf-8?B?WWNOY1d5SFVDc2hQNDh3Y1BwRW5EUHUxQS9oQjlUMGN3cWkwR2lwODZDK2Mx?=
 =?utf-8?B?bE5QdzhINkRUam1oWUlyNk5LeGJua0pNZmhMeEVJcHJCL3krTE8yb3NrMWhT?=
 =?utf-8?B?UlZiUTROVFNLbmZrT0hGYlhzUUtXc2k1L3lrM0h2UUo0Qm9lSWpOaTNZQlhj?=
 =?utf-8?B?VExodkxkUXNNL1pncnViVit0c0RUUXdTY0g3WjNta1poTmhBaUF4ZlZoRlND?=
 =?utf-8?B?ZSsvVCtyZ2puMGppQU9HM2Q3V2lyb1dmR3RIeDlVeGpzemh4YnBPaTFMMW1t?=
 =?utf-8?B?RXpISC84cFp2eTJVTmx3S0ZRQlZDYWVsRllGdjdPTGRVelU3UktHWERCZVc3?=
 =?utf-8?B?eGtTU2V4Vko3MEsvOVlTT1pVRFhjWjc1dG9MZVR2MW1Fb0Ywd2RiWTREY2dX?=
 =?utf-8?B?dkFkUEN2anA1d1QwNEh3SGI4Y2kzbFdsMFAvTVZDQ3BCV3VQYU5oL3Z5cm42?=
 =?utf-8?B?ODU2Qjhud2lIaFUzb3hubXB5WDlVRlN1RmtDQ3hSSXJOZFR5ODZBczNaNjJR?=
 =?utf-8?B?Zlp5OWlJb2FYdDhoN2hpcnpqVklEWUc5bzdFeW9rdkh2TnpFVEhHRUwxOU9Z?=
 =?utf-8?B?RWhzWnVkYndIaXFlZkhlb3NmK05jN1hRWDI0M0JRRDFZR1pwMUxQTWRiZ2hT?=
 =?utf-8?B?b0lRSXdYd0JrRmxabE5LY0RlV1luOXR6dWJ4WUFXaW5xK28vZ0xWTGVYek53?=
 =?utf-8?B?Q1RkUjcrcHBJaWtjaldyazcxMHBjWk15VTZjQVVsRk5PTk5JWnQ3d3lsdW96?=
 =?utf-8?B?UEY3MlN4bkkrcEJCK0JNREZDa00yQ1JIQmsxR1dVa1VOZXZ5YXU5eDBRRDM3?=
 =?utf-8?B?NVhXMVdNV2RvSWRKS09RTXRPSktOck9KQjRxbFN4aWh0bzNkWjd5dWpsK2x2?=
 =?utf-8?B?MlRySGhPY0IrSU9admlRcEF5dnpHRDJ4MW9USlJHUGlKTzEyMG1nTktOekJ6?=
 =?utf-8?B?QXRrcnFkYkhXWmNCYi9YTXRuUmpXYlFwMVFkMXE4ek5zbjVkTXNQN0JWZk5P?=
 =?utf-8?B?TUplcjhBNjMra3pMQ3Z6eTA1NnJ2MEJTV2ZRb3BYQnRkMGY4ZDE3Tm5OT0dY?=
 =?utf-8?B?VDQ0VnFGbHErd2lTdU9SRkU4aGhHaW1uRlR4cGFMM2tQTmZoMU9MSEFMZHhQ?=
 =?utf-8?B?OWh3YTA5SjlreC8xcmJtbmYyc2JKMEltMURXYUtUODNyMksrT0hrdGcrM2F4?=
 =?utf-8?Q?1fqHJ98sNNw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVFRcjFTQ1F0MmZhUVJldjFSMkRoOEdKZW5GSE1IdXJNQUE0NU9GYnhJNTAy?=
 =?utf-8?B?emlBLys3VFpKUHp2aW1rRnRUZHFWam5IRXFCNTlSbjZiWHA4SGJFVFJSdTU1?=
 =?utf-8?B?N2xCdzZ1R0sxenVyc0VZaXQ0R09mZ0JVWXlacTVwY0ErUWhFU25CNHdNRTE5?=
 =?utf-8?B?R3ZGWXVNN0dhWndCenRnY05oZW5na256WkJSNzFlcFUzNWFValQ0RGFFdTZs?=
 =?utf-8?B?bng4V0FaMmhxU3ZIeFlXOEJrSllUUWtkUlhsUWs0aGl6NE9hbk9ZVzZEMG1s?=
 =?utf-8?B?NXZKeUgzSTEySC9yK016US9seFl3RW5LS2Z1ZHpvUFhDU2NCR1pzemRnNWFV?=
 =?utf-8?B?SVozaTBQTnVvQjFRQVlHTjlMTkN4UjFwbDFocE5hQ0hiVDhzcW9RTEpSR1pG?=
 =?utf-8?B?UFJXMThjZ2FWSjRqaU9lVjhtajlMdkFwaEw3VnY5bFpCNnVGMVhzbVdEVzJN?=
 =?utf-8?B?S0ZMamFINXplOEhVeVhXaGtUOXpaSWxwdUFia1VHQVpuUFZJdnFaQlZ2N0ZX?=
 =?utf-8?B?bGw0S1F2RnluUS9SU24vbFdGZkpObmp3bFk4V3JIWTZieDN4TlV2RHVKSTh0?=
 =?utf-8?B?VXlSZkMxd2RxUjlNOG1qUjY1c3lPaitDTVgrcmtzV1hYRWVRcXRQUnpJZC81?=
 =?utf-8?B?K0NYK3BXY3AvZ3l5b3ZpUVg1KytBT2Q5ZE5haThSTVowa2c3cHdRWWdhZ1Jp?=
 =?utf-8?B?SjdxSE5kKzBwd0JhRzVpZldmVkVmblRML3paOEU0Rkx3OElpV0JWNDFtbERX?=
 =?utf-8?B?a1JTUEoyRU5oaUF0VXdnajF2by9wZWFVRjltZDNvYWdJTGgzTE9oeUYxbTJi?=
 =?utf-8?B?RlVyZjFXZGtHL1N0eDkrR05ZVlFHeE5ZblgxREhqMG5ieG1OazhuYzEwdjJC?=
 =?utf-8?B?cDY5U3A3VzJQVGlGUlRxakVuVU5VNDBjM1ZWek5hclJHTGVpWXZzU0RBc1lZ?=
 =?utf-8?B?czlCaWdVTUNGcm9XOU9NbGhTMDhzaTJ3WGM1QmpoblV5bjE5SUtyN0ZrUk5w?=
 =?utf-8?B?MzBlM2xCbTdDQnBTQ245RVlKWGFjTGdVS09kMDZMSlFVVTczeGU3R0FWU2lz?=
 =?utf-8?B?dkJtUFdMSTUyYXFUeEVFNzYzcGR2cGprcFVlZU1GMUNuT1NTQmVKUmV6emc0?=
 =?utf-8?B?citMcXZ3cFFSQ2pKckZIdjBHb3F5SFYrV3B0eEZNZTZyamo1azFNOURRYVoz?=
 =?utf-8?B?aUNIMzZ4QkZoazZjVnBieWpraERodEN0M0VrU0ROUzBXeVkyb0RrdFE2bURK?=
 =?utf-8?B?RXc0UEp5RFE4OG9hVFZtZ0Vib2RBem1xSm9KTkxja2Vnb0c2d0o3Und1eWM3?=
 =?utf-8?B?Yjl0MEpBUFFhbi9tNkNsVzhjdzBBS2xSdVBSd0p0UytoRGh4bHlDdUxVZGhu?=
 =?utf-8?B?R29jbEg3N2ZIdnI0WkkyNmhNMURhZjYzdGsxOHBva0U0QzRXV0dtbS9aSm00?=
 =?utf-8?B?QjRDcVV5aFBoeW80ZTNJM1AvWnA3ZFp1RTBUOXNNWkM5VVFhK29Jc1djcnNO?=
 =?utf-8?B?MVNaZlplUmRNUnlqYTl6YnBTR2VVZWlTQUZFQ25qb3NTM08rNXl3aUErdm5v?=
 =?utf-8?B?aDZwelRMbWxSTzJiZE4rTk5xWjNCNmx5RjFNWW1LMzZ4SkdSbXdvb0dNQk9q?=
 =?utf-8?B?MzBDanE0UjFJdkhWZ3JnUmJaM3BOVlgwZVRQS3dyK1ZZcXBqSWtjRUs0bWVK?=
 =?utf-8?B?YUZJNnlJSlJBaVZuUVBEVFVRNzNuQ1FrQkN5aGJ1RnRnY052N0lEdS84R241?=
 =?utf-8?B?U1NLbEcvQ2YyRFdyQ2VQcjVJekgyZE5HdkFxaTN6cDd0U2R3T05xbzBoN0t0?=
 =?utf-8?B?SjRkMW41bWZYVS9sNzczUkZNaE1yZ1BKNUROeGMwOWtHSkRpOVBGemNheXFE?=
 =?utf-8?B?OGRxVmNGNUdycTdtNjV2QTFncy8zTTFGZXM4VmZrSmp3aFVJZ1d2MThmS1Fw?=
 =?utf-8?B?dm5XblZUOTRJVHFaeTI1R0xJREdSSlZpdFJLY0Uyc2dINFFicHQ3RWQ3dVA0?=
 =?utf-8?B?Z1VQeVZyRTczTmR4NlNJMmVvNUQ2aDlieEJsSmpJT0hLSzZjTHdtS29BaFE2?=
 =?utf-8?B?UUpZYW84U2JuWDJRa0xSTGZ1RHJDV1ZNTXUrc28yZDNMWXFRMkF4NEVQQUhW?=
 =?utf-8?Q?L75W7YdH3LOalKdmhbpNeK+Q5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 961ccede-40ac-4b62-0e78-08dda2b932f3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 16:10:46.6332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WHOYQmpp7cRJftvJipcUuSd0mksJViY+PHxEQnsDSQTOveeoKE3aOHGVGDtvFYqa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF89A593F05
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

On 6/3/25 15:13, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Jun 02, 2025 at 04:42:27PM +0200, Christian König wrote:
>> On 6/2/25 15:05, Tvrtko Ursulin wrote:
>>> On 15/05/2025 14:15, Christian König wrote:
>>>> Hey drm-misc maintainers,
>>>>
>>>> can you guys please backmerge drm-next into drm-misc-next?
>>>>
>>>> I want to push this patch here but it depends on changes which are partially in drm-next and partially in drm-misc-next.
>>>
>>> Looks like the backmerge is still pending?
>>
>> Yes, @Maarten, @Maxime and @Thomas ping on this.
> 
> It's done

Thanks, I will start merge things tomorrow.

Regards,
Christian.

> 
> Maxime

