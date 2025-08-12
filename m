Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E4FB222D7
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 11:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8186210E5CF;
	Tue, 12 Aug 2025 09:21:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HD9T4A/I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D0010E5CB;
 Tue, 12 Aug 2025 09:21:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s0iozRlfoqyX/9ufYtnYnzWCfcuB0JgiDBY/GV8pAscMPwNDhpggridRqGn17Np1y70mjLAjmb5S3qHyDUS3Nm8tNXygZQi80PKm1oe0vT5LUmNByXjwbe092nOWkszUih0kLQgKw6NMr7p8q31VzaCvwMhusTdfZVK9RBlnt+/Co1ZLJQXA+BH5WIzpu7wl0iUJ98qkU4+PyTquCFkmETcm33V1SA8NV3UuosSqRSMu4rkaLvEnPfCMLTvHZ8tt/S4qZBYFEbOWs2S6uTBu8fNIA44oKs9bENB7ZasoD76GiCYvcuPygLNt7elIOHLc9ePEP6rOv8zNWH8M7N1Dqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPSPpQ8C4agcqstNSWiQ/X9ZnAamtTuSl8hPQ4SzXmw=;
 b=d5Tta/B+LIev7+PBOSvQc0U6qaoL5/5ET/CIWu3w+HqOC3QSzHfNn9wjIUCirBxYhSlLLFM1iJdKYcddd38W4ltibXZXNczCIunhKRfsjESR5zupF8WI3rZJgqgQa8FzLCAu9oShEfMzHs8K/v4H9PxnvCq/XbeOSW4kp0MMmBX+32IMgEH5t2J+zLlvgve9in9nt1Iw2Wn5cshlL/MxIIWyhy6ktBndI0QqlT3gzGrCLosHRCo4tlI0F4QARV/O6COH4obu506gWLYUx82SnGoMiZqwMy7hXan8iTAJANQFWuqTCeXRjpscE9iPBfV1Voqz8YL1rM91rwmBGoVkBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EPSPpQ8C4agcqstNSWiQ/X9ZnAamtTuSl8hPQ4SzXmw=;
 b=HD9T4A/I5BdJ/HE1wflIQfU+O4M/PywqbVavXcya+ZidCsr4HVEQGmJeDBZEBK5CANky5YeiXqDM6nJTc8lcEH0WlwxtGY/QicV9Vk3gv+X7XQiYgVhSVWW20v6lasxSBu6gdvCDUHbj5QqXqervCQSJCyis5ZvnG8ezG4YYXxs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB7343.namprd12.prod.outlook.com (2603:10b6:806:2b5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.20; Tue, 12 Aug
 2025 09:21:46 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 09:21:40 +0000
Message-ID: <ca5a8b2c-e980-46ac-8448-8a2daf0433b1@amd.com>
Date: Tue, 12 Aug 2025 11:21:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "drm/amdgpu: Use dma_buf from GEM object instance"
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexdeucher@gmail.com>
Cc: alexander.deucher@amd.com, airlied@gmail.com, simona@ffwll.ch,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250715082635.34974-1-tzimmermann@suse.de>
 <CADnq5_NRP8tokX7M9yKA=+sLrY0Owrg5gWyg-NH3qC1sNyZ8ww@mail.gmail.com>
 <914153f3-e250-41f5-bfd2-412def4e2fec@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <914153f3-e250-41f5-bfd2-412def4e2fec@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN0P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:52e::29) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB7343:EE_
X-MS-Office365-Filtering-Correlation-Id: d768c574-a717-4fb7-36a6-08ddd981a534
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGhjbkt0MXNCUmpwUm9jZnFCSUhEZEdQTm5WSVRpV1dmYkxuVDZEUmQwdVJ5?=
 =?utf-8?B?L3hnRzh6UHdXU1ZYQTZHWnhEQmYvMWdBZHRTb2N1dTY2cHpYdnBQS0hjalk4?=
 =?utf-8?B?UDZadytNR0VUMWt5dnRybVdYeW1DMHVEeU5QaG9TZmJYdkZJSmJhdlJqa29w?=
 =?utf-8?B?ekFlTWtCdy9kbVQ0d29OTk41bUpZZFlrWUtydk1HSnQ1L045NXQ0b0VVOWpG?=
 =?utf-8?B?YTFRU01NVDVxeGlKUUp2YXJmS1ozUXpZTGUzb3dVKzlPczk0bUVnUFdjR0tv?=
 =?utf-8?B?VmpPZGxGY2N4aHU2YnRzcm1iS0NwSUYwa2Y0VTk4Qk9CU0xQa2VrQ3poSGR0?=
 =?utf-8?B?NVVEeEpQMWcyRmhrNWZXOFpxRWY5dm5MNVN6NkhWc2oxZURwS2w0aXgrYjY1?=
 =?utf-8?B?aGFyMWI5UFM3YWVzS2YwdmQrWXZSd0oyZVVtYncvZ0xxZHFSb2JieHEyNTVV?=
 =?utf-8?B?TzJFVHlORHE3ZTRGMElKL25rbUdFb1hSbGFrNnBVc2dzeTl5NnhWV3dMMmVy?=
 =?utf-8?B?QjRmcU1nSFR0Nlo1Vmxzek1BazNtZkxUWDZyWFFTWGZNUTl1R2Z2Q280WGt1?=
 =?utf-8?B?Y0t5NVptQlp0VmhLb0hNM0hPRWdibHdHbTBuayt6OGlvdDYzL21IRzNLUURF?=
 =?utf-8?B?WW9mVkZmdkxjRlFhb2h0cm9qeXpKZkk3ZExvQU12Sm9uY3ZuNXlHNVdyc2Q4?=
 =?utf-8?B?QklDb05zN2dnNU5oRENtNWUrNFhIYjJSam1ObDcvaHBCYklMclRiS3V1VnhT?=
 =?utf-8?B?aXdBMXNrZVEvQ0RRSjlzRWhXc2lKUVRnV2JwbXBJd2N3eGJIYlM2UHpuMkx3?=
 =?utf-8?B?Q3M0VjBQVFd0VUprb08wVFVGV1JrU21nMHkwVWQrKzhlMlFIRDIzSmw3NW54?=
 =?utf-8?B?TWpEeVJpb2syNWd6UlFQbk1TalJtMUI5ZjZXQlZjUm1rTm4xM21oMDAwSHQ3?=
 =?utf-8?B?ZmdZNEFNcURxUUorU25CRWtta0FZcmg5K2IwVkZPYXMydjVzeWFBeFdpQUNP?=
 =?utf-8?B?eWxnT1pZQ3dLby9HaTZwYWtnMnNQU0o2dW12QmY3ZzJyL3RoK0tVZ3I3NGpN?=
 =?utf-8?B?RTR2TXhUR2tMMDRqTFBTV2hoWkw2a1p2clIvR0U1a1E4ck1lT2oxTG5tK3Bn?=
 =?utf-8?B?dHBHVnBsWXVIYkFISWhIR09WUHFnNHBaYUIrVDZTalpSekppYzFSZDZobk9x?=
 =?utf-8?B?QUVGZVpyd0t0YlRhS1NZZHZWK0NuTU5ta1hUSFI1N3VYZDNFYTdOajM3RVl6?=
 =?utf-8?B?N2YveDBEcVBzczhNZ0JPWFgvWjNpT3FTNE1sVFRLa1FMVFRLek53cStDZndO?=
 =?utf-8?B?RWY0ekNZejIvWHVrNm9IcGlIaFNIby9PQ1U1UmNNa015UXFnbHBuZG52M1ky?=
 =?utf-8?B?TTZSZ21VWW1iaGNNV2pHdWFwMUlxYkR0WHQ3UHF6bEVUY3NOWTRFM3VUbm1Z?=
 =?utf-8?B?M2pkMThlUXhVYjJrc1Zhc2hLN2NvdDgzczl5a2RTOWEybVh3ZUFtL2hRWGI0?=
 =?utf-8?B?bk8zZ0U3VVNIaHRqTjRpWVRxaFdodGpmTGJvTFNQUHh1Ny9WdFdYYnlkNWJS?=
 =?utf-8?B?dDJJQm1RMXBad1ltS1ZNSXpEb3ZsakpCOG5yZmxyODd6ZUlEWkRoYWJZaFkr?=
 =?utf-8?B?NkxwSE5mNXhtUXBwZGlIUUJodXBJd2V4TWRKa1RJY0ZJemFqZWM0c2s5anJw?=
 =?utf-8?B?ZEdaN1hHNnRsUlhteWdkR2JpUFVtUE9hRTg4TThQbEN3Zmg1NnUzR0lXNGQv?=
 =?utf-8?B?L09zbFlubU15aHZPSlV0cFc3a0pXOE9mWUpNK3J2SC8vTEhxeklncWZVRUh3?=
 =?utf-8?B?SHNKTFExMmxZVWN3Zy9FOS8rUVdUblpyT3UzTUZiMVN0OWgzMndqWE1lWXJZ?=
 =?utf-8?B?RlNUSC8yZUZhelNCenJVTmtUK3hnNk52NmR1WUdnTGc4S25JTUgzYk96eVhp?=
 =?utf-8?Q?H4Wt1Efiifc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elI2c2dOUWhQK3RPbHUyVXpkRnpqenZ5bGFFNElyVnRhNDR4c2Z1Y3NqRlFU?=
 =?utf-8?B?eloyRks3QTRZUXZWY3RLVzhLa212Wm5xVENwTFZIa2t0cjFqclRrNitQa2ll?=
 =?utf-8?B?TXRQVHZZY1hNZEZaVVFRcXNZTTh0aUtHNm9LakxCb3I2aTZTell1T2U4OXhH?=
 =?utf-8?B?Z3pZTlUxbk4zSmRNamRXZXlBMjFSbWdrSDBSSUhGcjB4ek9abXdDYTV5a1l5?=
 =?utf-8?B?cVhpYjhmYnlSRjdwUVFCTWhQdlZOQWlSM043V3hxaWcxREI4ZGtFK2JDYVUx?=
 =?utf-8?B?ajhCc0lyVXpuU3JFbWhpdHliQ2M2emFXUkNnN1lXa3NzZEhoeERLMkJkN29t?=
 =?utf-8?B?S0psWGtvQURxSmkyb0doZy9FcGFLQ29vZVRxMTlCeCtuY2RoaWt6WG9WeWFi?=
 =?utf-8?B?eWp0SDdtcnRVWnB6ajFQNlBYeTJlcGJabGtvZE16VisxcndmTEVYL3o4RytL?=
 =?utf-8?B?TCtjOHJoaENtS1BOUU1tL1h5YjdDOUlxb0kvRjlEV2VOdDVGamxTZHlrY1RF?=
 =?utf-8?B?OXIzMWt0Ni9VRk9tQzZmZGdIVEw3OXNDdDJQdGpBQ1JZbUNmK011bWV6ZGla?=
 =?utf-8?B?a00vOHZrTEVwZUpEcnJzR1E2aVVGMVFjVklJTldzaE52bU8xR1VoRUZ0c2tz?=
 =?utf-8?B?c2M0dXJyYjZEdEp2ZElRekEyck5FNUl1QUkvQ2gvb0xpWGJtUkliRWdGWDI1?=
 =?utf-8?B?MW9rMElnTTcyQVlUN0pYYzFPR3l1blh1S1M2WTJXUzRkZ2p3b0FYdzVIeExz?=
 =?utf-8?B?T00rbWRucHNrZFFYbHNUQjF1OWJSY3ZhK3gxVXlVR2VVVXVXZ1M3aXFaRWhC?=
 =?utf-8?B?eEdCZVZ6TmtUNktpOXFaZmpKS1J6ZW11UUNrSjNzSUNXSFkyd3UwVCtLd0xB?=
 =?utf-8?B?VVNyaDhDRWZGWHhMc1VpanBwS1RsL2pobHR3K0dWejdpR0F0TXhaOG90Wlpw?=
 =?utf-8?B?WnRtOElLeWdoc1dqUUcveGIyNDA0bmgwK0pibmV1NUZuSFRZWk9nQ0RUMVNN?=
 =?utf-8?B?dHErVll0Qm81d0ZVd1BCdks4WVJKRDZCKzFza1RMUGZuNGFyVDFjdVJzZ2gv?=
 =?utf-8?B?RERiWHZOWERzR1ZXZW1VZ1c3bnlTRTZnTFE1RUtQMjFGSk9qTHdia0daSU96?=
 =?utf-8?B?SllPdHlIc2Q4UEVQSUxpaFpyZ29lZ0x0RmM3V3hVMi9aaWwyUzQ1TTg2ZTZx?=
 =?utf-8?B?UGsyQzI5YkczeFdZekVFclZpYmc1aUJmcE9TNllsTEpiOW9ldURWanVCYnBs?=
 =?utf-8?B?cENkTTFlNjBVWTdrWDRzNDNsMmw5TW1OKzIxdFNkdURVZkRiTXh5NnczSHpL?=
 =?utf-8?B?VWVWekcyZlo4bWROMlZPLzhXaGdPNldhZG9WME0yUi80anFEaE91YnkzbFQr?=
 =?utf-8?B?S01sZmJwTlhHTmo4NitLUUxSYXZMNHFFVHVqNnhDNzExczlNRXl5cGFuaGpR?=
 =?utf-8?B?RlRCNkkyUUNyWEJiWkY1UlN4dGV1MVJxL2duQ2tIckhJMitKWkEyK1JrS1RS?=
 =?utf-8?B?SlpOKzcybUZBTm5sdjJSZWxMWTRnMWlTL0M2ODQ3Zi9TalFCSWpwbGIrS0dE?=
 =?utf-8?B?aVdaWlJNbVB5dGJRbUtneVZUUlpXbzdmT1VIZVJpVWdObXhOU05SZklDcFhO?=
 =?utf-8?B?bkdkbTJHdUs0dnFmdWRLQU5zNkt3TVlXRWVlalFMN05YS25nMmZGQWVDK1du?=
 =?utf-8?B?ZXBYS2diL3prY2s4MnU5amR4bkVuL1A1SFRCcFdSWW03OGhLMFV2UENBVXpW?=
 =?utf-8?B?eWtuM1AwdGVvLy9IMHRrL1JlbkNVQ0ZoSno1VkRlOFRjOU5nYWh3R2FHWXpI?=
 =?utf-8?B?ajZlaWhIQWhWNE9xVHBNMWFLREFleGlBMk5CWWpWTFZ3Q1I4T09RNWJ2MVp1?=
 =?utf-8?B?TkNXT2w0SVhYNzFQWHVraEJTUFBXNWMwU0laanpBZTRNUDlkY0lnQ1pUbXRa?=
 =?utf-8?B?WW1SWmRrTEw3eTIxbjFiTWVhaDFmQmRsWmlBSUg5bWpSUmZ6azdMMFVXOUI1?=
 =?utf-8?B?QUF1aElocmc5VHZyWEI2Y01leVpnY2FYd3BOQWpXK29pRFFqcnJoa1hjVHNq?=
 =?utf-8?B?ME9CNzZaK0pEOWlVclpxbjgzWUwwdXlaYTh3UDU1ODdwWDNqOXFzOHFoZnEv?=
 =?utf-8?Q?zjhpLyIwMFsbkH9tqqkJPlGKG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d768c574-a717-4fb7-36a6-08ddd981a534
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 09:21:40.3602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sfwjn7rREwmuL/ZckgjlYTEruuqGuk8yUwquTSkhtN95Hn1Mfkzi7vyHB/DRrije
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7343
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

On 12.08.25 11:12, Thomas Zimmermann wrote:
> Hi
> 
> Am 15.07.25 um 16:01 schrieb Alex Deucher:
>> On Tue, Jul 15, 2025 at 4:38 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>> This reverts commit 515986100d176663d0a03219a3056e4252f729e6.
>>>
>>> The dma_buf field in struct drm_gem_object is not stable over the
>>> object instance's lifetime. The field becomes NULL when user space
>>> releases the final GEM handle on the buffer object. This resulted
>>> in a NULL-pointer deref.
>>>
>>> Workarounds in commit 5307dce878d4 ("drm/gem: Acquire references on
>>> GEM handles for framebuffers") and commit f6bfc9afc751 ("drm/framebuffer:
>>> Acquire internal references on GEM handles") only solved the problem
>>> partially. They especially don't work for buffer objects without a DRM
>>> framebuffer associated.
>>>
>>> Hence, this revert to going back to using .import_attach->dmabuf.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> 
> Can I take this patch into drm-misc-fixes?

Yeah, sure. Go ahead.

Thanks,
Christian.

> 
> Best regards
> Thomas
> 
>>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 2 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     | 3 ++-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      | 2 +-
>>>   3 files changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>>> index ff98c87b2e0b..5743ebb2f1b7 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>>> @@ -514,7 +514,7 @@ bool amdgpu_dmabuf_is_xgmi_accessible(struct amdgpu_device *adev,
>>>                  return false;
>>>
>>>          if (drm_gem_is_imported(obj)) {
>>> -               struct dma_buf *dma_buf = obj->dma_buf;
>>> +               struct dma_buf *dma_buf = obj->import_attach->dmabuf;
>>>
>>>                  if (dma_buf->ops != &amdgpu_dmabuf_ops)
>>>                          /* No XGMI with non AMD GPUs */
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> index 6626a6e64ff5..d1ccbfcf21fa 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> @@ -317,7 +317,8 @@ static int amdgpu_gem_object_open(struct drm_gem_object *obj,
>>>           */
>>>          if (!vm->is_compute_context || !vm->process_info)
>>>                  return 0;
>>> -       if (!drm_gem_is_imported(obj) || !dma_buf_is_dynamic(obj->dma_buf))
>>> +       if (!drm_gem_is_imported(obj) ||
>>> +           !dma_buf_is_dynamic(obj->import_attach->dmabuf))
>>>                  return 0;
>>>          mutex_lock_nested(&vm->process_info->lock, 1);
>>>          if (!WARN_ON(!vm->process_info->eviction_fence)) {
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> index af0f655dfd5b..b9b4f7d9186e 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> @@ -1272,7 +1272,7 @@ int amdgpu_vm_bo_update(struct amdgpu_device *adev, struct amdgpu_bo_va *bo_va,
>>>                  struct drm_gem_object *obj = &bo->tbo.base;
>>>
>>>                  if (drm_gem_is_imported(obj) && bo_va->is_xgmi) {
>>> -                       struct dma_buf *dma_buf = obj->dma_buf;
>>> +                       struct dma_buf *dma_buf = obj->import_attach->dmabuf;
>>>                          struct drm_gem_object *gobj = dma_buf->priv;
>>>                          struct amdgpu_bo *abo = gem_to_amdgpu_bo(gobj);
>>>
>>> -- 
>>> 2.50.0
>>>
> 

