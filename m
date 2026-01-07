Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 440BECFDAC4
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 13:31:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C58510E5AC;
	Wed,  7 Jan 2026 12:31:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2Hzz4XGJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010015.outbound.protection.outlook.com [52.101.56.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD66A10E5AA;
 Wed,  7 Jan 2026 12:30:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yKqryjRBieSQ8HCfjOmByLRiRnd0By102cM+n49PPc3WOpAgqD/e7Ab2NmTIa2lIi68gFB8yKPrcbvS8KYR+bsCzg3NFnZ3K9IUhinqe4VXzFyH9uXoJAgyEJQtHFNSDbY9h8s17o82FT06bBrjY2x7t/T1478phFujg7OOgoeFvlrKvoDLho7MGpDRIT8mWdZ9l6kbo2ytMHJYiXQg7gY+ZS6p78zYGXqt1JNAffl8DabJOrbtLdojFGOWp0Uf7TY+1BmrvnyGmdcywHPeNXhJOhAuZ8GKNtmhh0w8Y1quBsOAmr9uSMy0fuhdofIJ30M2sjkThOWowJ9EvA3skuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fOkD9ul+Jiin5Y4zIBBFL0e7hvm0WADtHdC+/FflP4g=;
 b=ekvyexjydUVie1P5YA3yO7vtP6GFmwrkrC4zAhsnDArroBd9OF9A1bGa8HtjcyOXOEO3MrRsStri4GwujK19pNAHA2U9qSPWctb2v33N+JUBa+96395RuPCB6p+PYkieqxZiDWNWR2yGdR1t0ChQRTr7DfvgCQdxIJwbMZ01ggG81thkAHD7w3YF//Ln2xsZJUSwm2ubHOisEOLOn1Rv9FF/0gYS+VRJooDiqxJVtCPp9y4gLmvw6YTS5wlj9H1Hl0r9Rjn4sHJ1tPyAmWZBDgCjUzN9eaVTQDa3z1VHUJ0Kien3/Q6P3UGUc/GYhOnNTL4DlD1b9MQi6kd9QH6Bog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOkD9ul+Jiin5Y4zIBBFL0e7hvm0WADtHdC+/FflP4g=;
 b=2Hzz4XGJB6v2Sj/AWTqp6+LyHPyccfIJp7wGDch8RoP61o/RJNqxAnExk3Bq5rFbRcRE1S5Tq9GVCkK3UWCEu5M3CIvAK59B+0gdy9ynRrDR3Ss0+QD4Z55leoQUPL3IMaoedtIuuG6Lgzt7iB3xhGCNw8CfosCvuRkLeci2iIM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV3PR12MB9257.namprd12.prod.outlook.com (2603:10b6:408:1b7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 12:30:49 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 12:30:49 +0000
Message-ID: <49971777-ffd5-4a85-b08c-f0a417f26777@amd.com>
Date: Wed, 7 Jan 2026 13:30:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/radeon: convert UVD v1.0 logging to drm_* helpers
To: Mukesh Ogare <mukeshogare871@gmail.com>, alexander.deucher@amd.com,
 airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251220184755.1803625-1-mukeshogare871@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251220184755.1803625-1-mukeshogare871@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fe::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV3PR12MB9257:EE_
X-MS-Office365-Filtering-Correlation-Id: 93158cf5-0d8c-46b4-5a82-08de4de8969a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UkFqM0tPK1pGZnc2SnNLVUYvY2NsZlkrYU53RDBvWHhKcnozUFgvV294Qkxj?=
 =?utf-8?B?bGRjd2JKdWZXVkxhTFdDWCtBZWFDSWVZMTBQZVhqMkFYWkd1Q3hQSHc1QnJz?=
 =?utf-8?B?Z2gvczBwTCtLekhRS2FjeXJIZXUrWlE0eVlUeVBoaDloZzAyN1NYTTZBZHZF?=
 =?utf-8?B?S3ZyeEd0KzRHOHI3Y0hqZFNmaTRab0dtRUExZXdKMTVhZlZIWnhKSE9SWEdn?=
 =?utf-8?B?c0paaURwSnpoak5TMjlJOFQrV3pHTzYzNE40WXpyUllVT1oyOUhjREtoaG5i?=
 =?utf-8?B?eXpERVJqTVFRWkpWeSt2cmk5NG9wNEVMcXppVDVuUXlkQXl3cnN2c0x6NkdR?=
 =?utf-8?B?V3IrK2NCeWNOSnNjenYzdDNaZXFlQ3hGbEdZRVhhK2JxcmZEV1BCMUdMbEM4?=
 =?utf-8?B?bXl1UDVzY296SmIwUFBQRVkvajdJekpGYUtjY013bitZenUzU0dNdHM4UThQ?=
 =?utf-8?B?SmxYSWNmK2Q5RTdBUFQvZ0pGR1NrTVBZU0xXd282VDNUaUw4QXZrZW9zeFMr?=
 =?utf-8?B?NElIU3lOMmk3MTM1WW91djcwMG9EMUVWRC9MVURWUGpPbTYyZjFEVncvVUdL?=
 =?utf-8?B?NUFZaUQxUnFEb1EyamxMSStTcy8zT2Y4eXJEdlNhKzJWSGJJOWNlSG4xM0gv?=
 =?utf-8?B?N0pzdWFyQUZxWjd0K0RjN0dEYzlDU0NPTUJ2Z2c0RVRRY1FyL2ZtQzVXZUdI?=
 =?utf-8?B?aUVPSnFwM2hLYWZ1RHMzeTNqSDR4d2g1YUxUckUzZHZwYkp0d2M1Q1MwV1FY?=
 =?utf-8?B?Z09LVGZmMzJ1U0F2eVZmYlNrNkFCQUlnNG9NVUJwVlpoQURSNkszNFVPSUZX?=
 =?utf-8?B?NGpoR045R1VFbjN0cmtuaWRBc3FrbFJEOEJJeHFMNXNsS2JLZVZ5cVk4NWhI?=
 =?utf-8?B?QU13ajNXMThQMUk4NXJETGZwV1ZjYU9tZXFpK1Q1NlV0WTc2a2RsQmhJLzVI?=
 =?utf-8?B?N0ptYzM3dkx2bzcyUnZOQWxKTHFsUzNGM3VBenZIeVR0TmRJaE5xL09KYzcr?=
 =?utf-8?B?RzBIbmJyYjhsRWdvMWt5Ymc5WDJkRGQ0S2pEeGZrejBZZVhCRnBYT0ttNHEy?=
 =?utf-8?B?Z3A2RkovVEp2SVZ2T3hldnNqMGNWM1FJYitJT0orZSsvazdMeFVRR0F4b3Np?=
 =?utf-8?B?UU1uY2RrMG5RQm8zTFNlYm5DWUN3SFkzMGRUMHluWXRNUDBNenlYaFBwcGdl?=
 =?utf-8?B?Y1NXQmhhNFZaME8zMGthSmt2cUdaV3VFRnZDcFhkc0hOWTNZOE9SdUttRGU5?=
 =?utf-8?B?VnFzaHlVYVMrQmw5dTYwMVRSMXJoMWNvUjNUOFVmMVNhYlRCYlBlRDNQMVhp?=
 =?utf-8?B?RDE4QXhzcXNEemFkLzhjWUd1RnlVNU5mTGtEOTJGakpTUXhnbW5PZ1JGZkFm?=
 =?utf-8?B?UUFsNzJkdVYwbTUxallyd2pSUXNLb05QdXNxZEl0ajZVeWV5dVN0ZDQ4RU1q?=
 =?utf-8?B?RldxRE55aFZzb0J4U3cyWTlNQWlzbW9UWGtrdFVNMnNQRTVqSjd6ejFCZjBR?=
 =?utf-8?B?UkdqdEVCb3RLYTRmQXlaMzh0M0ZhTkczbXVGTWw5YnZjd2JkSVRLcjk1bUcv?=
 =?utf-8?B?R2ZKM0U4UmVjRHFzekRJSTRxNVQxU3p0QTl0YVl2VUhyVjV0ZTlxWnlpa2dz?=
 =?utf-8?B?S2VJRno2bENiVHNpRnpqOUkzRW1JeDBBVUhMbkJ6ZmRZaE9qZjNYeXV5RWtn?=
 =?utf-8?B?UGN4SG8zMk1CVTlwYTJWSEZXRzlFUWMxNWNVVTFOVHMwNWoyTG1tWWtjaWx4?=
 =?utf-8?B?VUVLT2U1L0RMbG4zZHk4anRNbGZHaDVoVUpJalprWTQvYmliUXZIUzJnekYy?=
 =?utf-8?B?QmV5dHV3OFIyU0tCZGZtT1Z0M0VXdUdpU2lUcDk4UHUwVFhmYUtwbDJpcHdp?=
 =?utf-8?B?QmNxSi9adFZvL1RQaUZOU25tYUF4TU80QUxvdC9FazJoYkIyWDgzQnZYaDl4?=
 =?utf-8?Q?6YYaapEam1rGzynarcfj+/qJeRJrRcUl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlYxL2U3MVBvdVNJa3lVdlphRlgxRVRpQU44RkdrNDhZQWNtMDhHbDJGYU1H?=
 =?utf-8?B?aFFOWXRMQ0t5WG15dTEwTHJjMTM4ck9jZGlWNHh0eSsybEx4dURYczMwZkt3?=
 =?utf-8?B?QW94UFIvRWNabDk5a0dzTHJ6QVFlZUVHRUpoTGZrUG1TTXZPYzVBT2lnTjRx?=
 =?utf-8?B?UCtYT0VFdDNKODFKSXdkUlYyY2RpaXM5YURwZUlrVXRuN2pPTlpHLzQ2RjJG?=
 =?utf-8?B?NHRMbE54K21LNTdobGhFaFdNUUdrMGZaZEtFV2l3ci9yWklweHp6dVZyWVdR?=
 =?utf-8?B?TmF2Z2JmY2ZFWWdMWHEvRTF1OTVqQ2VJenFZREdyRnIzc1BuUXc1MHdxcERX?=
 =?utf-8?B?SUUwaXBxVnhGZk95aWp1MWpiSWJEbFZoUWpWTktvT2srd1ltbE9rUzF1dHc5?=
 =?utf-8?B?dHgrLzF4WEdzK0VMcHF0TUw0b1RNQzUzd01aQng2dE96dTdjaExiOTY0WnJX?=
 =?utf-8?B?U2tsTG9pcmVxTjBSVlBLZTV3Q1NPcmZDVGdGKzhHOE9ZekhRaUhPWHdRNmtN?=
 =?utf-8?B?ZThDbCtKZ3g5RlZ5a2x5U2ZDeUlrZDBza0FRTWJMN0xsNjZjaFV1QnlsNWYy?=
 =?utf-8?B?bmRETUFYQjhBZkhqRkY0UHpNOW9wT3lSQUFWRDI2bTVZeDZGNUN0OTk5dU9y?=
 =?utf-8?B?SXkrSk5zTkFJeHAvb2dFOXl3QTVOWld3MEwvelp2aS84aWViaStwWDBFRzlv?=
 =?utf-8?B?TFdNbEVzTlNRVmJZTncrZXZpWXdiWkdmUFJDNlFUM2pEV0taQmwzRE9mSm9y?=
 =?utf-8?B?d1F3bU12Y3ZwN3o2eEE1TWkxaHE4a2pXVmRqQkVpemFMSGZQbzVVeFZhc3JC?=
 =?utf-8?B?OEI1STJYeEtnOGhrSk53Tlo3SFl3TWFkVkhCVTdZdy9vVDFJaVNMMjdVSlFk?=
 =?utf-8?B?SGFya1pMT1c1a0RQTS9SSWlET1FaVXoyRVhqaDJPWUM5d3JmaWJaSEwrK1FD?=
 =?utf-8?B?ZXdGVm93Vmh6Tmw3WisyNkFMY1UvQzhIZEUvZU1xb284Zkk5T3VCb2NxSjNX?=
 =?utf-8?B?NzQ0U2pSRk5hTmlBVzFLaU9sV0lSb0Y5NmhuYkZXKzRBY3hFUkFZNkErTDdt?=
 =?utf-8?B?WlNIaTJNK2kwL3VXeGt3ejNTQzZpMkNJeTRoY2xsTER2WXZwZHFaNFlNT2x3?=
 =?utf-8?B?cFBnc1cxOGtlK2ZIWmVJZnM4cFQ1cFk0TkcyaCs2V0hnRnQzRExJUTV6Q1Fm?=
 =?utf-8?B?V3N1SWcyKzVmbTRHRTNsdldsdS9odUwzMExMWG96dkFvTzY1ektIWU1CYlIx?=
 =?utf-8?B?RkRLNS8weVVSTHVzWjJCSDZDeVIvV1dhRUJUWGRVZVpRRWhtR2g2VjhQNXZK?=
 =?utf-8?B?cFIra1lEVmlZM2JQZW9EbXlFRnV3L3M2Z1BabGhXdTBsNjEyM0ZDOXNaOXh5?=
 =?utf-8?B?Q0c4U2w3RzdwSUZRNTc1RG8zRVhSUWxiVStRYktIZE5CVk9nNEEyb1N1L1pK?=
 =?utf-8?B?L2w2TDNQU1Y0SUdRU01IRUFEVFU0cCtPbm84UmtTakNaVFpkNjIvZCtYVVdV?=
 =?utf-8?B?d1hEQStVejE1NE8xMldsZHFtTzJDRjZVaDIvZFp6NkF2OUpndEZwZ291Y3hU?=
 =?utf-8?B?QThwYzF4V0w4VVJYZ25ZcWt2YWVPamRsU1Z2MUtaQXFyM0hNU0RLS2JlRVU3?=
 =?utf-8?B?QXNJUzRJT2l3cStiY2xDMUdqSTNSVnNlQ1h1L2EvM0dHd2luK0t4dXBYazJj?=
 =?utf-8?B?blRBeWVzaE9yNlFBMmkrY0VyYXhhOHlnc3dtUU9QWGVhSVo3ZEFJTnM1V2Zy?=
 =?utf-8?B?SGxsbkJUNXpwajlVelRVek9HVXAwcS9TTXB2clFEVHY5QWVTTmtEeTQ2b3Rk?=
 =?utf-8?B?YXZ2NVZqTFFtRjZxUVQ2TzdCMm5rUUIydFJaTW5nWVJha3ZQdFhTNEJVQ2xx?=
 =?utf-8?B?TkNQOFFnLzVPb3lJbGdqVnMwVSttb0l4d3dlLzduVmovRllKRHoxVWVxelI1?=
 =?utf-8?B?SDN0a3VNMFJOcHpUZElUbFd1dlNaNU5FTndBK0dnbVgwd3RaT0dxd05PZjds?=
 =?utf-8?B?ZGV3K0RONUwyWWFoc1NnQmlmN3lmOVNLQlNEeWVTWm53UjQ1NHR3a1JKUFFP?=
 =?utf-8?B?dlp2WjNaTU8xd2JFYWZZVUlOemtrTFhmMjNqaDdpQTRoOFhCVGNQaTJ0K3kr?=
 =?utf-8?B?ekx2M0dZYWFBc0xBRENSQlQ2YjlOc3JDUmtJaGc0K1A4WTFVL2Y1WlhyQ2o3?=
 =?utf-8?B?enE2akdJNnpyWTIxMU9iQUMwb2ZORWVjZkp4cE1qS2xCZTJ6VEZwVVVYZWVN?=
 =?utf-8?B?bzVOai9Yd3ZjbkZRYXhiWERqOGxJelJlWDMyNmJZc1kxK3J0YUh1VXR2Yytr?=
 =?utf-8?B?MUwrQ0ZyODJSTGc1dVhPWTVGdDdxaXhrVElUaXJZU3F1Q1lmcUdHZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93158cf5-0d8c-46b4-5a82-08de4de8969a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 12:30:48.9508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iCizj2OQlPFVNrkB9HK8IiqTEs9waeA8Rv7+gE0SGq0PS+x0ryiV1IrrTW2/Mr7y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9257
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

On 12/20/25 19:47, Mukesh Ogare wrote:
> Replace legacy DRM_ERROR()/DRM_INFO() logging in the UVD v1.0 code
> with drm_err() and drm_info() helpers that take a struct drm_device.
> 
> Using drm_* logging provides proper device context in dmesg, which is
> important for systems with multiple DRM devices, and aligns the radeon
> driver with current DRM logging practices.
> 
> No functional change intended.
> 
> Signed-off-by: Mukesh Ogare <mukeshogare871@gmail.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> 
> diff --git a/drivers/gpu/drm/radeon/uvd_v1_0.c b/drivers/gpu/drm/radeon/uvd_v1_0.c
> index 5684639d20a6..5e6607e16244 100644
> --- a/drivers/gpu/drm/radeon/uvd_v1_0.c
> +++ b/drivers/gpu/drm/radeon/uvd_v1_0.c
> @@ -179,7 +179,7 @@ int uvd_v1_0_init(struct radeon_device *rdev)
>  
>  	r = radeon_ring_lock(rdev, ring, 10);
>  	if (r) {
> -		DRM_ERROR("radeon: ring failed to lock UVD ring (%d).\n", r);
> +		drm_err(&rdev->ddev, "radeon: ring failed to lock UVD ring (%d).\n", r);
>  		goto done;
>  	}
>  
> @@ -232,7 +232,7 @@ int uvd_v1_0_init(struct radeon_device *rdev)
>  			break;
>  		}
>  
> -		DRM_INFO("UVD initialized successfully.\n");
> +		drm_info(&rdev->ddev, "UVD initialized successfully.\n");
>  	}
>  
>  	return r;
> @@ -338,7 +338,7 @@ int uvd_v1_0_start(struct radeon_device *rdev)
>  		if (status & 2)
>  			break;
>  
> -		DRM_ERROR("UVD not responding, trying to reset the VCPU!!!\n");
> +		drm_err(&rdev->ddev, "UVD not responding, trying to reset the VCPU!!!\n");
>  		WREG32_P(UVD_SOFT_RESET, VCPU_SOFT_RESET, ~VCPU_SOFT_RESET);
>  		mdelay(10);
>  		WREG32_P(UVD_SOFT_RESET, 0, ~VCPU_SOFT_RESET);
> @@ -347,7 +347,7 @@ int uvd_v1_0_start(struct radeon_device *rdev)
>  	}
>  
>  	if (r) {
> -		DRM_ERROR("UVD not responding, giving up!!!\n");
> +		drm_err(&rdev->ddev, "UVD not responding, giving up!!!\n");
>  		return r;
>  	}
>  
> @@ -427,7 +427,7 @@ int uvd_v1_0_ring_test(struct radeon_device *rdev, struct radeon_ring *ring)
>  	WREG32(UVD_CONTEXT_ID, 0xCAFEDEAD);
>  	r = radeon_ring_lock(rdev, ring, 3);
>  	if (r) {
> -		DRM_ERROR("radeon: cp failed to lock ring %d (%d).\n",
> +		drm_err(&rdev->ddev, "radeon: cp failed to lock ring %d (%d).\n",
>  			  ring->idx, r);
>  		return r;
>  	}
> @@ -442,10 +442,10 @@ int uvd_v1_0_ring_test(struct radeon_device *rdev, struct radeon_ring *ring)
>  	}
>  
>  	if (i < rdev->usec_timeout) {
> -		DRM_INFO("ring test on %d succeeded in %d usecs\n",
> +		drm_info(&rdev->ddev, "ring test on %d succeeded in %d usecs\n",
>  			 ring->idx, i);
>  	} else {
> -		DRM_ERROR("radeon: ring %d test failed (0x%08X)\n",
> +		drm_err(&rdev->ddev, "radeon: ring %d test failed (0x%08X)\n",
>  			  ring->idx, tmp);
>  		r = -EINVAL;
>  	}
> @@ -507,34 +507,34 @@ int uvd_v1_0_ib_test(struct radeon_device *rdev, struct radeon_ring *ring)
>  	else
>  		r = radeon_set_uvd_clocks(rdev, 53300, 40000);
>  	if (r) {
> -		DRM_ERROR("radeon: failed to raise UVD clocks (%d).\n", r);
> +		drm_err(&rdev->ddev, "radeon: failed to raise UVD clocks (%d).\n", r);
>  		return r;
>  	}
>  
>  	r = radeon_uvd_get_create_msg(rdev, ring->idx, 1, NULL);
>  	if (r) {
> -		DRM_ERROR("radeon: failed to get create msg (%d).\n", r);
> +		drm_err(&rdev->ddev, "radeon: failed to get create msg (%d).\n", r);
>  		goto error;
>  	}
>  
>  	r = radeon_uvd_get_destroy_msg(rdev, ring->idx, 1, &fence);
>  	if (r) {
> -		DRM_ERROR("radeon: failed to get destroy ib (%d).\n", r);
> +		drm_err(&rdev->ddev, "radeon: failed to get destroy ib (%d).\n", r);
>  		goto error;
>  	}
>  
>  	r = radeon_fence_wait_timeout(fence, false, usecs_to_jiffies(
>  		RADEON_USEC_IB_TEST_TIMEOUT));
>  	if (r < 0) {
> -		DRM_ERROR("radeon: fence wait failed (%d).\n", r);
> +		drm_err(&rdev->ddev, "radeon: fence wait failed (%d).\n", r);
>  		goto error;
>  	} else if (r == 0) {
> -		DRM_ERROR("radeon: fence wait timed out.\n");
> +		drm_err(&rdev->ddev, "radeon: fence wait timed out.\n");
>  		r = -ETIMEDOUT;
>  		goto error;
>  	}
>  	r = 0;
> -	DRM_INFO("ib test on ring %d succeeded\n",  ring->idx);
> +	drm_info(&rdev->ddev, "ib test on ring %d succeeded\n",  ring->idx);
>  error:
>  	radeon_fence_unref(&fence);
>  	radeon_set_uvd_clocks(rdev, 0, 0);

