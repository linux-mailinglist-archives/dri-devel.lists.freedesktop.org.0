Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EB4AB2068
	for <lists+dri-devel@lfdr.de>; Sat, 10 May 2025 01:59:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051B710E0B6;
	Fri,  9 May 2025 23:59:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3ucfMYxP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2070.outbound.protection.outlook.com [40.107.220.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 674C310E0A9;
 Fri,  9 May 2025 23:59:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N3WsyzIuroibyQKQ01azg3mpR/maWufaptCdUopiqlofC8XJ7q+sqTR3Ma/8HZn86/s/wLezV1egxYXZOD2p5EQl3Z8q6KFYOfs9dbS6tiTr4M+zy6j8VLj5sHVvQ5XtrAhNDrwohWxlIHEJk2fjPCvVKHudLTLae0RcZpnITGNHgIhP5nuEASGgnCFD/Up5JcYH5aGJ7oG/y3jhfO7JS+Psoz2XsTyE5z1ReqE+vJ9Fis9GApdof2pQYUjcwxtrs628na7d149rhXqTSgWk3gmUhUwR1C9YHk3yQdcmW78YTdGpKCM3JgBYcpNE0xm52dlv+Muxlx40YD7qlih2BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lAOsZrhoCHldDGxvNpuscuHXw1nhw8Fxl1khpvhSz8w=;
 b=cl9T8vt2HWq93yji7/qXT24xaUobDG+lRJDUsCOBzG4VT3eKiVhG2WRiqZovOLLyiAkIHKD8xLlKrRLsRXmg7SUgfrHSXSLSLioFQe6aex0yIzlQ1TJwJUY7DXz3mnJ02Z4ODgBl+rtM2nMbxdMzIMfze9OTfIrONe3uVtwnQ1fBhL/3Ta30r7pig8Gq0pbFsh1zRAyl6enFJINq6sK7/Lb23oLFUH+UtLBbwQDaslADTA2E5goK07TmsZnDo6/dMBTS4OcvayVd3nfrIuo7XZ8d9awGcfkuG2BoONPasOUwlvIozNPMfVJd26K9Jg7ZjjesBL9v2Vw1AoDOf7PEKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lAOsZrhoCHldDGxvNpuscuHXw1nhw8Fxl1khpvhSz8w=;
 b=3ucfMYxPMiRx/QWdig5jpmbCrM2RjsO/emiXyDowwgFpf2ZuQAJcznWY6LjhCE8jt9xSe8VKkm+b9uog6e7xyFcgsjhlmtAJQqkCQ5keqN7esR2N+JqJ1BrTRwyChUGJJw5buJTA/0vSAnQe0lGixoYSFA7z4oXE57ifPKWbDs8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SA5PPFC3F406448.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8e0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Fri, 9 May
 2025 23:59:40 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 23:59:40 +0000
Message-ID: <f8299b44-1a11-431d-8c04-b0cb44b0b832@amd.com>
Date: Fri, 9 May 2025 17:59:36 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amd/display/dc/irq: Remove duplications of hpd_ack
 function from IRQ
From: Alex Hung <alex.hung@amd.com>
To: Sebastian Aguilera Novoa <saguileranbr@gmail.com>,
 harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: saguileran@ime.usp.br, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250503035949.11132-1-saguileran@ime.usp.br>
 <c75f63b2-b562-4396-8779-145e2642b8aa@amd.com>
Content-Language: en-US
In-Reply-To: <c75f63b2-b562-4396-8779-145e2642b8aa@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQXPR0101CA0054.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::31) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SA5PPFC3F406448:EE_
X-MS-Office365-Filtering-Correlation-Id: dc0f3a3c-89bb-4e3f-6e63-08dd8f558f45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cUREUjcvZ1lCWTFBamNVRC9Sa3JPOWVQb0NLNVlMaGZycUZWcnhUWG1wcUdx?=
 =?utf-8?B?R2hDMGNQZW5mYmxjUHdWRjlIWm5ub09wU3cxSWhHT3E1V1d0R0hiQm5DQ09R?=
 =?utf-8?B?Y0dHRG9FTndIR3FWQzc0WTI5dTdaTC9teVZ5RGdFQjVmUGFuSndidnNFajB4?=
 =?utf-8?B?cjdldmZwV1J4RDlhR2JhaXhFSUJFbW1uSTFDdGZnYUV6c1QxOUFkWW03ZE5G?=
 =?utf-8?B?blhmTGdFcFh6UThiOHB4TWQzNitGY3AzRVBLMkNuQWkzYkF1NEZVUllnTHZj?=
 =?utf-8?B?QVhIY1JsdjNWZWlROHpoYXBuUVp1YlIzcTA1WGRCa1VFNDVEK1IzWWtBaFNL?=
 =?utf-8?B?N3hoeEFFcVJaTkpuU1hTK2YxRlNJZ1JyL1Ercmc0OHMxd2ZlYjEreVVZdXlW?=
 =?utf-8?B?djFFQ0xjenBubXd2WXdXVHlYNXN2RzJoZW5FMzl1OUNadHJlVG1WenV5M3RE?=
 =?utf-8?B?MkFBUUFaWWJSMXR5bGExR3Bwa3k2dUQ1MjlVSDc0Q3hKd3Z1R0hkcjNnUmR4?=
 =?utf-8?B?N2RrSmpvUnRYS2N5QWZMQXBYOGNmRThGQU5MOUtBZTcrS3BaUzNoNjRmRUhN?=
 =?utf-8?B?M3k5ZHE4Q0tneXZqbDdDWWxVUVFYclR2eEpKNUN0UE1EdkNsdlV3SHVOQ2Q0?=
 =?utf-8?B?WHpiUVhLMXlHVzVHd1lEK3pJclFYNUNRM2F3N0FuRWNKWTBOUWFNWDlJZnB4?=
 =?utf-8?B?b0NWQ0xsNERVSHd5eXdrNlErQk5mWWRUQ2dGSkxkZjBsRXpNNTl4a2F3U1pY?=
 =?utf-8?B?THdmSzVCajc1VzRKTm5BcnlUVERNeGhKd0NSRU9jUGc3K1Z4a1BPb3dMWWM4?=
 =?utf-8?B?NjM3NWJsTUhjQTNkT01LcEZzM1g0VFNjMWxvSFoxRDh3WkJkVytyeXJGQTZY?=
 =?utf-8?B?anI1UTk2UzZHeUlRYStNL284YVJvbVlybXcvaGQ0U3h3ZHpacXM0MWcrRnls?=
 =?utf-8?B?blBwSDluazdaRWNLZTNtbG1IS2NrSEg2eTlwdDc2VVplY2E2dHlYNkVPZE1i?=
 =?utf-8?B?Q2JCcUFEYnhVT1I3REMrNW1PR0dtMnhhYWZIQ3A4TTFxbWZkTy9nV3NzUE8x?=
 =?utf-8?B?aFdBV2pNUGVlWXBSM2JGdmNoaU16OERsY1pzN0ZOZWxyclB0MmttVDhRUkxa?=
 =?utf-8?B?a3BacjZrc0QrOUNCZTlVcXVEZWJMckJ4NXRSWVBHZ0lQdGQrcHQvUXZmSXFS?=
 =?utf-8?B?Wk1LZFJWdHZjeW5jUWRPNW4yRlNkSDVOLzU2QXc5OVVveHpBS2h3STYyYnlM?=
 =?utf-8?B?a2VuZE4wUWJEb3lRK2V4WkJVQ0I0Vmpzb05TOXZ5RnVkTHhNWUdja1MvQjB3?=
 =?utf-8?B?MlBTN2JaV3VJS2Z1V2pCUDdMdEgxSnpjRTF1U0l0ZG5jdjQ5Vm9tZzdOa2Yv?=
 =?utf-8?B?RXg3ZjRTR1BDaElHeGNtNEhFODVRc0M0dnIrckNWMHJmeXRiaGxvdmZTbnhl?=
 =?utf-8?B?NE9jVkdNR1dPQkFLenkranBIaTdMcFVCY0ErZUdsdTNoN1ZiVTJDSzdDenpn?=
 =?utf-8?B?KzF0bGpGVldmdFF0cHhsU1RxVEY0bDlTZ0Y5b01kdmlxa09TUkNMUkZKRWZx?=
 =?utf-8?B?dXBKWWdLaE1MczJNQkd4WEMvb0pUc3kyY2orY1FHRXd3ZzZJOHo5Mi9tQTJa?=
 =?utf-8?B?Ti9qMWhFTkROZUFadC9uSDhHcnVzNDdaNmUyYVZYZFVub3pDeXRvMUtQU0ZV?=
 =?utf-8?B?T2ppdENFRlFLQk1yNnFRS0w0eFBacmhDUTBOanJKa1c2L1VDdjJvZ09iVzdO?=
 =?utf-8?B?clFpWEZEN0dhTklvTXlacFZuUDgxZEkwZTl2NGFlTEtaaENKRC9GSHhnaHZF?=
 =?utf-8?B?elEwZnRCUUJpNFJrazA5OStxaUFEVEhIenhFdVVSRkIrcVArNnZJdmdJTHp2?=
 =?utf-8?B?MnJ6SE8yQy9HQm8xZG1iYUcxQ3Z4QjQ2WEpiT3UvbUl6U0s5QjhWU3ArYVNP?=
 =?utf-8?Q?IQXFHAdewbM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnZJcTl0clhrOENDMnhhYVoySXQ0b01iTGpzUkhkZWthc1FGMGZRY240MjFm?=
 =?utf-8?B?K29sVWdGRWRST21YbDF0T2VrY3NLUDBhOGZRVXVXcmZERzJhT1hPUmFscDFK?=
 =?utf-8?B?Z200TG44dm90TmZpaDBkYXN2MWhLb0lzR0xQdjFyYmxSVGdNdjMzSzZRempK?=
 =?utf-8?B?TmYyb3lKWklLbWpMTHF2b2lVaWhzMW4zOWpBT3hySndoSk9KT1hnMTZCb1FN?=
 =?utf-8?B?TTQxOUJaSTR0RHIvMVhiZmRSNUd0UWtQVERhOS93WVpjWnc2Z2xwQWRVNzc2?=
 =?utf-8?B?VDJ3MHZteGdqMENjMmxldU1vNGZkMGVtQjNiSng5RjBlcTY1cXJncVdlazll?=
 =?utf-8?B?M1NiaU5kaVphWGVhbGIwR1hFU0VHTzN6TTVVaU9yT2xGcGxvNEx6WmxVL1pO?=
 =?utf-8?B?VHFaVEdUdk1yVnRFNkdReGhQZCs5NW05VTlHTklWRGVMWFllUkxhNVdkcEht?=
 =?utf-8?B?RlNkWi9sYXJZUENoTkRXa3cxMVFhbVlRRXhYVEYzYXlvWW1meHZYeWFvUWtC?=
 =?utf-8?B?Wkx5N2wwMXdZbWtHQkZEbC9heVhqVFp5M01mVE94OHl6L1FZVmVjUXhzaFg2?=
 =?utf-8?B?dkxCSFNzV1BkQmdxZTd3VUd2WnRLbTJ5amh6V0JFYnYyRUFuVFNmMWd5V20y?=
 =?utf-8?B?d2VhcjY2alh0TExrU0o2Z2hTN0xGQVNUdlVHcGNUb3FyOXIyMkVmZyswSkRz?=
 =?utf-8?B?WEg1MkVveENmb2RHTTE4UEp1dklxdXR2MWt1MGtGMjlIdy9qdE01RXhQVFpm?=
 =?utf-8?B?dEczWmdHK25IcDNEeHBhVDZHMDFVQWMyYUhDVytoMk9mZXBLWThFVTFHa213?=
 =?utf-8?B?TjBJMXhhWUU3dFFveXRwK1g2ZVE1cUxRTHNGSWJzdXcyUStQSTIveUFkQ1Jj?=
 =?utf-8?B?b0w0RFFMa05qUDM4djVFZGV2WEZkZWdQSGdUTE5GT2c2R0JqcmhyUm5VVVlt?=
 =?utf-8?B?ZVFWbkNJeVMwdUtMNHA0YVVBSlhvcHFBMXRvV0JmdzQ2dXZxM2xXQ3I1WGJj?=
 =?utf-8?B?QUk2YWtJaXMzRjJ4YmRPcGhFOWdPZDFkcXFIR0Q4a0RjemhSbzB1aDM1cXJi?=
 =?utf-8?B?b0J0L0szTFhqYXYrUjFqRUc5akMwb0syRkpudkUxcDNSMmR0Sy9keXgzSTE2?=
 =?utf-8?B?L1FZazcxSCtXRnNtME82L1ZJWVZla01wdW5hUTk5MmxEcnNZK0N3TmMrZy95?=
 =?utf-8?B?MEFyUUhDdjdYVkNJaEZjWSszNEFGT3BYcktBUGdSTTFhYWcxV25McVQ2bGs4?=
 =?utf-8?B?SWVvVTFSZldGd1JjRlgva1JqdkFEK1F3VjRxNjhxSTlTMEl5Q0hlcVc2NThK?=
 =?utf-8?B?aDBzdXBKcm1oZlVTcTZCQzVTMk9xU3V0QU5kcWVPNHVWbnY0QStzTy85cHNV?=
 =?utf-8?B?QUhvczRiQ01GSlJtYTkvUTB6b2xENnFTb2JHemJXajBMZTBxTmsxM2ZXUWI3?=
 =?utf-8?B?RTRmakhaR3BCSTdxdm4yWU5xRTZYWkRZenFGRGtDNGpIZVdSK2wyellSSzdr?=
 =?utf-8?B?bmNpdGtxODl2VzhJaVkxKzM2cmNmdGVScUYyTXBhSnNGTGY1UlFiajBZZjUz?=
 =?utf-8?B?MEh2cnNwMXlDTWROQ0IwOVpMeFJUTWhCUmJicjJCUDVwVkpCRkV1NHREeDI3?=
 =?utf-8?B?K3NFV3ZTRDY3by9KOXkzRVU3K0xLQWptenptYUxIZEpVenVONDd6eFVISGpR?=
 =?utf-8?B?UC8xNE5BWi9xNWFzWmlWWWtNZTRXR3hxenFiZ09GK05tODh2ekVYaGZRRTVv?=
 =?utf-8?B?L3lXano4eHdSS0RlcTlzSnRMdWpERkRDNFBQQi9SSngrQ2VwSEpsNks3Nm5H?=
 =?utf-8?B?ZTYwbE9hZCtrbDhKV2NaSVNzTEdZRGJWNTU0blprbDJ5TUpUVW5pV2cvdzkw?=
 =?utf-8?B?N0Q5a3AvM0p3Nml3SEtxYlJ4emM3ai9naWExdzRKSllMWEU4cmtxSFVQaVkr?=
 =?utf-8?B?WGxnRmFOTTYzOTVkYlVKNzMvZTY3RWZIRGt5UXNSQWQ3MGVmL3l0ckErWVFo?=
 =?utf-8?B?SHBES1kzZ2hGWk1idFY4VE9BaHlxZ0cwQTFXR3JzazJWaVV3bmxTU0o0dmdq?=
 =?utf-8?B?TlRwbTZqTzNmOWhlb2dLVDhBYmp6NWRxekhBOE9zbXlRbFdXQ2JxaVdLRHhX?=
 =?utf-8?Q?i031KgxlUCn0WDMx5NLOTSmcu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc0f3a3c-89bb-4e3f-6e63-08dd8f558f45
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 23:59:39.9210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pR5LZNSKZiDylqIHpxcS8Y3hbN6j1SVouSmx7qtMkb2vMT9Y0qncERlJQkjlRcnlo4W/ykTMqUx8YHXvJCyatw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFC3F406448
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

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 5/5/25 12:20, Alex Hung wrote:
> Thanks. I will send this patch for testing.
> 
> Note I still see a warning of mismatch of author and SOB as below, but 
> that can be fixed to "Sebastian Aguilera Novoa <saguileran@ime.usp.br>" 
> manually after testing and before merging.
> 
> $ ./scripts/checkpatch.pl v2-drm-amd-display-dc-irq-Remove-duplications- 
> of-hpd_ack-function-from-IRQ.patch.patch
> WARNING: From:/Signed-off-by: email address mismatch: 'From: Sebastian 
> Aguilera Novoa <saguileranbr@gmail.com>' != 'Signed-off-by: Sebastian 
> Aguilera Novoa <saguileran@ime.usp.br>'
> 
> total: 0 errors, 1 warnings, 740 lines checked
> 
> 
> On 5/2/25 21:59, Sebastian Aguilera Novoa wrote:
>> The major of dcn and dce irqs share a copy-pasted collection
>> of copy-pasted function, which is: hpd_ack.
>>
>> This patch removes the multiple copy-pasted by moving them to
>> the irq_service.c and make the irq_service's
>> calls the functions implemented by the irq_service.c
>> instead.
>>
>> The hpd_ack function is replaced by hpd0_ack and hpd1_ack, the
>> required constants are also added.
>>
>> The changes were not tested on actual hardware. I am only able
>> to verify that the changes keep the code compileable and do my
>> best to look repeatedly if I am not actually changing any code.
>>
>> Signed-off-by: Sebastian Aguilera Novoa <saguileran@ime.usp.br>
>> ---
>>   .../dc/irq/dce120/irq_service_dce120.c        | 29 +--------
>>   .../display/dc/irq/dce60/irq_service_dce60.c  | 31 +--------
>>   .../display/dc/irq/dce80/irq_service_dce80.c  | 31 +--------
>>   .../display/dc/irq/dcn10/irq_service_dcn10.c  | 29 +--------
>>   .../display/dc/irq/dcn20/irq_service_dcn20.c  | 29 +--------
>>   .../dc/irq/dcn201/irq_service_dcn201.c        | 29 +--------
>>   .../display/dc/irq/dcn21/irq_service_dcn21.c  | 29 +--------
>>   .../display/dc/irq/dcn30/irq_service_dcn30.c  | 30 +--------
>>   .../dc/irq/dcn302/irq_service_dcn302.c        | 19 +-----
>>   .../dc/irq/dcn303/irq_service_dcn303.c        | 19 +-----
>>   .../display/dc/irq/dcn31/irq_service_dcn31.c  | 29 +--------
>>   .../dc/irq/dcn314/irq_service_dcn314.c        | 29 +--------
>>   .../dc/irq/dcn315/irq_service_dcn315.c        | 29 +--------
>>   .../display/dc/irq/dcn32/irq_service_dcn32.c  | 29 +--------
>>   .../display/dc/irq/dcn35/irq_service_dcn35.c  | 29 +--------
>>   .../dc/irq/dcn351/irq_service_dcn351.c        | 29 +--------
>>   .../display/dc/irq/dcn36/irq_service_dcn36.c  | 29 +--------
>>   .../dc/irq/dcn401/irq_service_dcn401.c        | 29 +--------
>>   .../gpu/drm/amd/display/dc/irq/irq_service.c  | 64 +++++++++++++++++++
>>   .../gpu/drm/amd/display/dc/irq/irq_service.h  |  8 +++
>>   20 files changed, 90 insertions(+), 489 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dce120/ 
>> irq_service_dce120.c b/drivers/gpu/drm/amd/display/dc/irq/dce120/ 
>> irq_service_dce120.c
>> index 953f4a4dacad..33ce470e4c88 100644
>> --- a/drivers/gpu/drm/amd/display/dc/irq/dce120/irq_service_dce120.c
>> +++ b/drivers/gpu/drm/amd/display/dc/irq/dce120/irq_service_dce120.c
>> @@ -37,36 +37,9 @@
>>   #include "ivsrcid/ivsrcid_vislands30.h"
>> -static bool hpd_ack(
>> -    struct irq_service *irq_service,
>> -    const struct irq_source_info *info)
>> -{
>> -    uint32_t addr = info->status_reg;
>> -    uint32_t value = dm_read_reg(irq_service->ctx, addr);
>> -    uint32_t current_status =
>> -        get_reg_field_value(
>> -            value,
>> -            HPD0_DC_HPD_INT_STATUS,
>> -            DC_HPD_SENSE_DELAYED);
>> -
>> -    dal_irq_service_ack_generic(irq_service, info);
>> -
>> -    value = dm_read_reg(irq_service->ctx, info->enable_reg);
>> -
>> -    set_reg_field_value(
>> -        value,
>> -        current_status ? 0 : 1,
>> -        HPD0_DC_HPD_INT_CONTROL,
>> -        DC_HPD_INT_POLARITY);
>> -
>> -    dm_write_reg(irq_service->ctx, info->enable_reg, value);
>> -
>> -    return true;
>> -}
>> -
>>   static struct irq_source_info_funcs hpd_irq_info_funcs  = {
>>       .set = NULL,
>> -    .ack = hpd_ack
>> +    .ack = hpd0_ack
>>   };
>>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
>> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dce60/ 
>> irq_service_dce60.c b/drivers/gpu/drm/amd/display/dc/irq/dce60/ 
>> irq_service_dce60.c
>> index 2c72074310c7..d777b85e70da 100644
>> --- a/drivers/gpu/drm/amd/display/dc/irq/dce60/irq_service_dce60.c
>> +++ b/drivers/gpu/drm/amd/display/dc/irq/dce60/irq_service_dce60.c
>> @@ -46,36 +46,9 @@
>>   #include "dc_types.h"
>> -static bool hpd_ack(
>> -    struct irq_service *irq_service,
>> -    const struct irq_source_info *info)
>> -{
>> -    uint32_t addr = info->status_reg;
>> -    uint32_t value = dm_read_reg(irq_service->ctx, addr);
>> -    uint32_t current_status =
>> -        get_reg_field_value(
>> -            value,
>> -            DC_HPD1_INT_STATUS,
>> -            DC_HPD1_SENSE_DELAYED);
>> -
>> -    dal_irq_service_ack_generic(irq_service, info);
>> -
>> -    value = dm_read_reg(irq_service->ctx, info->enable_reg);
>> -
>> -    set_reg_field_value(
>> -        value,
>> -        current_status ? 0 : 1,
>> -        DC_HPD1_INT_CONTROL,
>> -        DC_HPD1_INT_POLARITY);
>> -
>> -    dm_write_reg(irq_service->ctx, info->enable_reg, value);
>> -
>> -    return true;
>> -}
>> -
>>   static struct irq_source_info_funcs hpd_irq_info_funcs  = {
>>       .set = NULL,
>> -    .ack = hpd_ack
>> +    .ack = hpd1_ack
>>   };
>>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
>> @@ -391,5 +364,3 @@ struct irq_service *dal_irq_service_dce60_create(
>>       dce60_irq_construct(irq_service, init_data);
>>       return irq_service;
>>   }
>> -
>> -
>> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dce80/ 
>> irq_service_dce80.c b/drivers/gpu/drm/amd/display/dc/irq/dce80/ 
>> irq_service_dce80.c
>> index 49317934ef4f..3a9163acb49b 100644
>> --- a/drivers/gpu/drm/amd/display/dc/irq/dce80/irq_service_dce80.c
>> +++ b/drivers/gpu/drm/amd/display/dc/irq/dce80/irq_service_dce80.c
>> @@ -37,36 +37,9 @@
>>   #include "dc_types.h"
>> -static bool hpd_ack(
>> -    struct irq_service *irq_service,
>> -    const struct irq_source_info *info)
>> -{
>> -    uint32_t addr = info->status_reg;
>> -    uint32_t value = dm_read_reg(irq_service->ctx, addr);
>> -    uint32_t current_status =
>> -        get_reg_field_value(
>> -            value,
>> -            DC_HPD1_INT_STATUS,
>> -            DC_HPD1_SENSE_DELAYED);
>> -
>> -    dal_irq_service_ack_generic(irq_service, info);
>> -
>> -    value = dm_read_reg(irq_service->ctx, info->enable_reg);
>> -
>> -    set_reg_field_value(
>> -        value,
>> -        current_status ? 0 : 1,
>> -        DC_HPD1_INT_CONTROL,
>> -        DC_HPD1_INT_POLARITY);
>> -
>> -    dm_write_reg(irq_service->ctx, info->enable_reg, value);
>> -
>> -    return true;
>> -}
>> -
>>   static struct irq_source_info_funcs hpd_irq_info_funcs  = {
>>       .set = NULL,
>> -    .ack = hpd_ack
>> +    .ack = hpd1_ack
>>   };
>>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
>> @@ -303,5 +276,3 @@ struct irq_service *dal_irq_service_dce80_create(
>>       dce80_irq_construct(irq_service, init_data);
>>       return irq_service;
>>   }
>> -
>> -
>> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn10/ 
>> irq_service_dcn10.c b/drivers/gpu/drm/amd/display/dc/irq/dcn10/ 
>> irq_service_dcn10.c
>> index 9ca28565a9d1..4ce9edd16344 100644
>> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn10/irq_service_dcn10.c
>> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn10/irq_service_dcn10.c
>> @@ -129,36 +129,9 @@ static enum dc_irq_source 
>> to_dal_irq_source_dcn10(struct irq_service *irq_servic
>>       }
>>   }
>> -static bool hpd_ack(
>> -    struct irq_service *irq_service,
>> -    const struct irq_source_info *info)
>> -{
>> -    uint32_t addr = info->status_reg;
>> -    uint32_t value = dm_read_reg(irq_service->ctx, addr);
>> -    uint32_t current_status =
>> -        get_reg_field_value(
>> -            value,
>> -            HPD0_DC_HPD_INT_STATUS,
>> -            DC_HPD_SENSE_DELAYED);
>> -
>> -    dal_irq_service_ack_generic(irq_service, info);
>> -
>> -    value = dm_read_reg(irq_service->ctx, info->enable_reg);
>> -
>> -    set_reg_field_value(
>> -        value,
>> -        current_status ? 0 : 1,
>> -        HPD0_DC_HPD_INT_CONTROL,
>> -        DC_HPD_INT_POLARITY);
>> -
>> -    dm_write_reg(irq_service->ctx, info->enable_reg, value);
>> -
>> -    return true;
>> -}
>> -
>>   static struct irq_source_info_funcs hpd_irq_info_funcs  = {
>>       .set = NULL,
>> -    .ack = hpd_ack
>> +    .ack = hpd0_ack
>>   };
>>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
>> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn20/ 
>> irq_service_dcn20.c b/drivers/gpu/drm/amd/display/dc/irq/dcn20/ 
>> irq_service_dcn20.c
>> index 916f0c974637..5847af0e66cb 100644
>> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn20/irq_service_dcn20.c
>> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn20/irq_service_dcn20.c
>> @@ -130,36 +130,9 @@ static enum dc_irq_source to_dal_irq_source_dcn20(
>>       }
>>   }
>> -static bool hpd_ack(
>> -    struct irq_service *irq_service,
>> -    const struct irq_source_info *info)
>> -{
>> -    uint32_t addr = info->status_reg;
>> -    uint32_t value = dm_read_reg(irq_service->ctx, addr);
>> -    uint32_t current_status =
>> -        get_reg_field_value(
>> -            value,
>> -            HPD0_DC_HPD_INT_STATUS,
>> -            DC_HPD_SENSE_DELAYED);
>> -
>> -    dal_irq_service_ack_generic(irq_service, info);
>> -
>> -    value = dm_read_reg(irq_service->ctx, info->enable_reg);
>> -
>> -    set_reg_field_value(
>> -        value,
>> -        current_status ? 0 : 1,
>> -        HPD0_DC_HPD_INT_CONTROL,
>> -        DC_HPD_INT_POLARITY);
>> -
>> -    dm_write_reg(irq_service->ctx, info->enable_reg, value);
>> -
>> -    return true;
>> -}
>> -
>>   static struct irq_source_info_funcs hpd_irq_info_funcs  = {
>>       .set = NULL,
>> -    .ack = hpd_ack
>> +    .ack = hpd0_ack
>>   };
>>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
>> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn201/ 
>> irq_service_dcn201.c b/drivers/gpu/drm/amd/display/dc/irq/dcn201/ 
>> irq_service_dcn201.c
>> index 1d61d475d36f..6417011d2246 100644
>> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c
>> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c
>> @@ -80,36 +80,9 @@ static enum dc_irq_source to_dal_irq_source_dcn201(
>>       }
>>   }
>> -static bool hpd_ack(
>> -    struct irq_service *irq_service,
>> -    const struct irq_source_info *info)
>> -{
>> -    uint32_t addr = info->status_reg;
>> -    uint32_t value = dm_read_reg(irq_service->ctx, addr);
>> -    uint32_t current_status =
>> -        get_reg_field_value(
>> -            value,
>> -            HPD0_DC_HPD_INT_STATUS,
>> -            DC_HPD_SENSE_DELAYED);
>> -
>> -    dal_irq_service_ack_generic(irq_service, info);
>> -
>> -    value = dm_read_reg(irq_service->ctx, info->enable_reg);
>> -
>> -    set_reg_field_value(
>> -        value,
>> -        current_status ? 0 : 1,
>> -        HPD0_DC_HPD_INT_CONTROL,
>> -        DC_HPD_INT_POLARITY);
>> -
>> -    dm_write_reg(irq_service->ctx, info->enable_reg, value);
>> -
>> -    return true;
>> -}
>> -
>>   static struct irq_source_info_funcs hpd_irq_info_funcs  = {
>>       .set = NULL,
>> -    .ack = hpd_ack
>> +    .ack = hpd0_ack
>>   };
>>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
>> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn21/ 
>> irq_service_dcn21.c b/drivers/gpu/drm/amd/display/dc/irq/dcn21/ 
>> irq_service_dcn21.c
>> index 42cdfe6c3538..71d2f065140b 100644
>> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn21/irq_service_dcn21.c
>> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn21/irq_service_dcn21.c
>> @@ -132,36 +132,9 @@ static enum dc_irq_source 
>> to_dal_irq_source_dcn21(struct irq_service *irq_servic
>>       return DC_IRQ_SOURCE_INVALID;
>>   }
>> -static bool hpd_ack(
>> -    struct irq_service *irq_service,
>> -    const struct irq_source_info *info)
>> -{
>> -    uint32_t addr = info->status_reg;
>> -    uint32_t value = dm_read_reg(irq_service->ctx, addr);
>> -    uint32_t current_status =
>> -        get_reg_field_value(
>> -            value,
>> -            HPD0_DC_HPD_INT_STATUS,
>> -            DC_HPD_SENSE_DELAYED);
>> -
>> -    dal_irq_service_ack_generic(irq_service, info);
>> -
>> -    value = dm_read_reg(irq_service->ctx, info->enable_reg);
>> -
>> -    set_reg_field_value(
>> -        value,
>> -        current_status ? 0 : 1,
>> -        HPD0_DC_HPD_INT_CONTROL,
>> -        DC_HPD_INT_POLARITY);
>> -
>> -    dm_write_reg(irq_service->ctx, info->enable_reg, value);
>> -
>> -    return true;
>> -}
>> -
>>   static struct irq_source_info_funcs hpd_irq_info_funcs  = {
>>       .set = NULL,
>> -    .ack = hpd_ack
>> +    .ack = hpd0_ack
>>   };
>>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
>> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn30/ 
>> irq_service_dcn30.c b/drivers/gpu/drm/amd/display/dc/irq/dcn30/ 
>> irq_service_dcn30.c
>> index a443a8abb1ea..2a4080bdcf6b 100644
>> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn30/irq_service_dcn30.c
>> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn30/irq_service_dcn30.c
>> @@ -139,36 +139,9 @@ static enum dc_irq_source to_dal_irq_source_dcn30(
>>       }
>>   }
>> -static bool hpd_ack(
>> -    struct irq_service *irq_service,
>> -    const struct irq_source_info *info)
>> -{
>> -    uint32_t addr = info->status_reg;
>> -    uint32_t value = dm_read_reg(irq_service->ctx, addr);
>> -    uint32_t current_status =
>> -        get_reg_field_value(
>> -            value,
>> -            HPD0_DC_HPD_INT_STATUS,
>> -            DC_HPD_SENSE_DELAYED);
>> -
>> -    dal_irq_service_ack_generic(irq_service, info);
>> -
>> -    value = dm_read_reg(irq_service->ctx, info->enable_reg);
>> -
>> -    set_reg_field_value(
>> -        value,
>> -        current_status ? 0 : 1,
>> -        HPD0_DC_HPD_INT_CONTROL,
>> -        DC_HPD_INT_POLARITY);
>> -
>> -    dm_write_reg(irq_service->ctx, info->enable_reg, value);
>> -
>> -    return true;
>> -}
>> -
>>   static struct irq_source_info_funcs hpd_irq_info_funcs  = {
>>       .set = NULL,
>> -    .ack = hpd_ack
>> +    .ack = hpd0_ack
>>   };
>>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
>> @@ -447,4 +420,3 @@ struct irq_service *dal_irq_service_dcn30_create(
>>       dcn30_irq_construct(irq_service, init_data);
>>       return irq_service;
>>   }
>> -
>> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn302/ 
>> irq_service_dcn302.c b/drivers/gpu/drm/amd/display/dc/irq/dcn302/ 
>> irq_service_dcn302.c
>> index 8ffc7e2c681a..624f1ac309f8 100644
>> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn302/irq_service_dcn302.c
>> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn302/irq_service_dcn302.c
>> @@ -126,26 +126,9 @@ static enum dc_irq_source 
>> to_dal_irq_source_dcn302(struct irq_service *irq_servi
>>       }
>>   }
>> -static bool hpd_ack(struct irq_service *irq_service, const struct 
>> irq_source_info *info)
>> -{
>> -    uint32_t addr = info->status_reg;
>> -    uint32_t value = dm_read_reg(irq_service->ctx, addr);
>> -    uint32_t current_status = get_reg_field_value(value, 
>> HPD0_DC_HPD_INT_STATUS, DC_HPD_SENSE_DELAYED);
>> -
>> -    dal_irq_service_ack_generic(irq_service, info);
>> -
>> -    value = dm_read_reg(irq_service->ctx, info->enable_reg);
>> -
>> -    set_reg_field_value(value, current_status ? 0 : 1, 
>> HPD0_DC_HPD_INT_CONTROL, DC_HPD_INT_POLARITY);
>> -
>> -    dm_write_reg(irq_service->ctx, info->enable_reg, value);
>> -
>> -    return true;
>> -}
>> -
>>   static struct irq_source_info_funcs hpd_irq_info_funcs  = {
>>           .set = NULL,
>> -        .ack = hpd_ack
>> +        .ack = hpd0_ack
>>   };
>>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
>> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn303/ 
>> irq_service_dcn303.c b/drivers/gpu/drm/amd/display/dc/irq/dcn303/ 
>> irq_service_dcn303.c
>> index 262bb8b74b15..137caffae916 100644
>> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn303/irq_service_dcn303.c
>> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn303/irq_service_dcn303.c
>> @@ -77,26 +77,9 @@ static enum dc_irq_source 
>> to_dal_irq_source_dcn303(struct irq_service *irq_servi
>>       }
>>   }
>> -static bool hpd_ack(struct irq_service *irq_service, const struct 
>> irq_source_info *info)
>> -{
>> -    uint32_t addr = info->status_reg;
>> -    uint32_t value = dm_read_reg(irq_service->ctx, addr);
>> -    uint32_t current_status = get_reg_field_value(value, 
>> HPD0_DC_HPD_INT_STATUS, DC_HPD_SENSE_DELAYED);
>> -
>> -    dal_irq_service_ack_generic(irq_service, info);
>> -
>> -    value = dm_read_reg(irq_service->ctx, info->enable_reg);
>> -
>> -    set_reg_field_value(value, current_status ? 0 : 1, 
>> HPD0_DC_HPD_INT_CONTROL, DC_HPD_INT_POLARITY);
>> -
>> -    dm_write_reg(irq_service->ctx, info->enable_reg, value);
>> -
>> -    return true;
>> -}
>> -
>>   static struct irq_source_info_funcs hpd_irq_info_funcs  = {
>>           .set = NULL,
>> -        .ack = hpd_ack
>> +        .ack = hpd0_ack
>>   };
>>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
>> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn31/ 
>> irq_service_dcn31.c b/drivers/gpu/drm/amd/display/dc/irq/dcn31/ 
>> irq_service_dcn31.c
>> index 53e78ae7eecf..921cb167d920 100644
>> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn31/irq_service_dcn31.c
>> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn31/irq_service_dcn31.c
>> @@ -128,36 +128,9 @@ static enum dc_irq_source 
>> to_dal_irq_source_dcn31(struct irq_service *irq_servic
>>       }
>>   }
>> -static bool hpd_ack(
>> -    struct irq_service *irq_service,
>> -    const struct irq_source_info *info)
>> -{
>> -    uint32_t addr = info->status_reg;
>> -    uint32_t value = dm_read_reg(irq_service->ctx, addr);
>> -    uint32_t current_status =
>> -        get_reg_field_value(
>> -            value,
>> -            HPD0_DC_HPD_INT_STATUS,
>> -            DC_HPD_SENSE_DELAYED);
>> -
>> -    dal_irq_service_ack_generic(irq_service, info);
>> -
>> -    value = dm_read_reg(irq_service->ctx, info->enable_reg);
>> -
>> -    set_reg_field_value(
>> -        value,
>> -        current_status ? 0 : 1,
>> -        HPD0_DC_HPD_INT_CONTROL,
>> -        DC_HPD_INT_POLARITY);
>> -
>> -    dm_write_reg(irq_service->ctx, info->enable_reg, value);
>> -
>> -    return true;
>> -}
>> -
>>   static struct irq_source_info_funcs hpd_irq_info_funcs  = {
>>       .set = NULL,
>> -    .ack = hpd_ack
>> +    .ack = hpd0_ack
>>   };
>>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
>> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn314/ 
>> irq_service_dcn314.c b/drivers/gpu/drm/amd/display/dc/irq/dcn314/ 
>> irq_service_dcn314.c
>> index e0563e880432..0118fd6e5db0 100644
>> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn314/irq_service_dcn314.c
>> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn314/irq_service_dcn314.c
>> @@ -130,36 +130,9 @@ static enum dc_irq_source 
>> to_dal_irq_source_dcn314(struct irq_service *irq_servi
>>       }
>>   }
>> -static bool hpd_ack(
>> -    struct irq_service *irq_service,
>> -    const struct irq_source_info *info)
>> -{
>> -    uint32_t addr = info->status_reg;
>> -    uint32_t value = dm_read_reg(irq_service->ctx, addr);
>> -    uint32_t current_status =
>> -        get_reg_field_value(
>> -            value,
>> -            HPD0_DC_HPD_INT_STATUS,
>> -            DC_HPD_SENSE_DELAYED);
>> -
>> -    dal_irq_service_ack_generic(irq_service, info);
>> -
>> -    value = dm_read_reg(irq_service->ctx, info->enable_reg);
>> -
>> -    set_reg_field_value(
>> -        value,
>> -        current_status ? 0 : 1,
>> -        HPD0_DC_HPD_INT_CONTROL,
>> -        DC_HPD_INT_POLARITY);
>> -
>> -    dm_write_reg(irq_service->ctx, info->enable_reg, value);
>> -
>> -    return true;
>> -}
>> -
>>   static struct irq_source_info_funcs hpd_irq_info_funcs  = {
>>       .set = NULL,
>> -    .ack = hpd_ack
>> +    .ack = hpd0_ack
>>   };
>>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
>> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn315/ 
>> irq_service_dcn315.c b/drivers/gpu/drm/amd/display/dc/irq/dcn315/ 
>> irq_service_dcn315.c
>> index 2ef22299101a..adebfc888618 100644
>> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn315/irq_service_dcn315.c
>> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn315/irq_service_dcn315.c
>> @@ -135,36 +135,9 @@ static enum dc_irq_source to_dal_irq_source_dcn315(
>>       }
>>   }
>> -static bool hpd_ack(
>> -    struct irq_service *irq_service,
>> -    const struct irq_source_info *info)
>> -{
>> -    uint32_t addr = info->status_reg;
>> -    uint32_t value = dm_read_reg(irq_service->ctx, addr);
>> -    uint32_t current_status =
>> -        get_reg_field_value(
>> -            value,
>> -            HPD0_DC_HPD_INT_STATUS,
>> -            DC_HPD_SENSE_DELAYED);
>> -
>> -    dal_irq_service_ack_generic(irq_service, info);
>> -
>> -    value = dm_read_reg(irq_service->ctx, info->enable_reg);
>> -
>> -    set_reg_field_value(
>> -        value,
>> -        current_status ? 0 : 1,
>> -        HPD0_DC_HPD_INT_CONTROL,
>> -        DC_HPD_INT_POLARITY);
>> -
>> -    dm_write_reg(irq_service->ctx, info->enable_reg, value);
>> -
>> -    return true;
>> -}
>> -
>>   static struct irq_source_info_funcs hpd_irq_info_funcs  = {
>>       .set = NULL,
>> -    .ack = hpd_ack
>> +    .ack = hpd0_ack
>>   };
>>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
>> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn32/ 
>> irq_service_dcn32.c b/drivers/gpu/drm/amd/display/dc/irq/dcn32/ 
>> irq_service_dcn32.c
>> index f839afacd5a5..e9e315c75d76 100644
>> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn32/irq_service_dcn32.c
>> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn32/irq_service_dcn32.c
>> @@ -129,36 +129,9 @@ static enum dc_irq_source to_dal_irq_source_dcn32(
>>       }
>>   }
>> -static bool hpd_ack(
>> -    struct irq_service *irq_service,
>> -    const struct irq_source_info *info)
>> -{
>> -    uint32_t addr = info->status_reg;
>> -    uint32_t value = dm_read_reg(irq_service->ctx, addr);
>> -    uint32_t current_status =
>> -        get_reg_field_value(
>> -            value,
>> -            HPD0_DC_HPD_INT_STATUS,
>> -            DC_HPD_SENSE_DELAYED);
>> -
>> -    dal_irq_service_ack_generic(irq_service, info);
>> -
>> -    value = dm_read_reg(irq_service->ctx, info->enable_reg);
>> -
>> -    set_reg_field_value(
>> -        value,
>> -        current_status ? 0 : 1,
>> -        HPD0_DC_HPD_INT_CONTROL,
>> -        DC_HPD_INT_POLARITY);
>> -
>> -    dm_write_reg(irq_service->ctx, info->enable_reg, value);
>> -
>> -    return true;
>> -}
>> -
>>   static struct irq_source_info_funcs hpd_irq_info_funcs  = {
>>       .set = NULL,
>> -    .ack = hpd_ack
>> +    .ack = hpd0_ack
>>   };
>>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
>> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn35/ 
>> irq_service_dcn35.c b/drivers/gpu/drm/amd/display/dc/irq/dcn35/ 
>> irq_service_dcn35.c
>> index ea8c271171bc..79e5e8c137ca 100644
>> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn35/irq_service_dcn35.c
>> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn35/irq_service_dcn35.c
>> @@ -127,36 +127,9 @@ static enum dc_irq_source to_dal_irq_source_dcn35(
>>       }
>>   }
>> -static bool hpd_ack(
>> -    struct irq_service *irq_service,
>> -    const struct irq_source_info *info)
>> -{
>> -    uint32_t addr = info->status_reg;
>> -    uint32_t value = dm_read_reg(irq_service->ctx, addr);
>> -    uint32_t current_status =
>> -        get_reg_field_value(
>> -            value,
>> -            HPD0_DC_HPD_INT_STATUS,
>> -            DC_HPD_SENSE_DELAYED);
>> -
>> -    dal_irq_service_ack_generic(irq_service, info);
>> -
>> -    value = dm_read_reg(irq_service->ctx, info->enable_reg);
>> -
>> -    set_reg_field_value(
>> -        value,
>> -        current_status ? 0 : 1,
>> -        HPD0_DC_HPD_INT_CONTROL,
>> -        DC_HPD_INT_POLARITY);
>> -
>> -    dm_write_reg(irq_service->ctx, info->enable_reg, value);
>> -
>> -    return true;
>> -}
>> -
>>   static struct irq_source_info_funcs hpd_irq_info_funcs = {
>>       .set = NULL,
>> -    .ack = hpd_ack
>> +    .ack = hpd0_ack
>>   };
>>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
>> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn351/ 
>> irq_service_dcn351.c b/drivers/gpu/drm/amd/display/dc/irq/dcn351/ 
>> irq_service_dcn351.c
>> index 7ec8e0de2f01..163b8ee9ebf7 100644
>> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn351/irq_service_dcn351.c
>> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn351/irq_service_dcn351.c
>> @@ -106,36 +106,9 @@ static enum dc_irq_source to_dal_irq_source_dcn351(
>>       }
>>   }
>> -static bool hpd_ack(
>> -    struct irq_service *irq_service,
>> -    const struct irq_source_info *info)
>> -{
>> -    uint32_t addr = info->status_reg;
>> -    uint32_t value = dm_read_reg(irq_service->ctx, addr);
>> -    uint32_t current_status =
>> -        get_reg_field_value(
>> -            value,
>> -            HPD0_DC_HPD_INT_STATUS,
>> -            DC_HPD_SENSE_DELAYED);
>> -
>> -    dal_irq_service_ack_generic(irq_service, info);
>> -
>> -    value = dm_read_reg(irq_service->ctx, info->enable_reg);
>> -
>> -    set_reg_field_value(
>> -        value,
>> -        current_status ? 0 : 1,
>> -        HPD0_DC_HPD_INT_CONTROL,
>> -        DC_HPD_INT_POLARITY);
>> -
>> -    dm_write_reg(irq_service->ctx, info->enable_reg, value);
>> -
>> -    return true;
>> -}
>> -
>>   static struct irq_source_info_funcs hpd_irq_info_funcs = {
>>       .set = NULL,
>> -    .ack = hpd_ack
>> +    .ack = hpd0_ack
>>   };
>>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
>> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn36/ 
>> irq_service_dcn36.c b/drivers/gpu/drm/amd/display/dc/irq/dcn36/ 
>> irq_service_dcn36.c
>> index ea958628f8b8..f716ab0fd30e 100644
>> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn36/irq_service_dcn36.c
>> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn36/irq_service_dcn36.c
>> @@ -105,36 +105,9 @@ static enum dc_irq_source to_dal_irq_source_dcn36(
>>       }
>>   }
>> -static bool hpd_ack(
>> -    struct irq_service *irq_service,
>> -    const struct irq_source_info *info)
>> -{
>> -    uint32_t addr = info->status_reg;
>> -    uint32_t value = dm_read_reg(irq_service->ctx, addr);
>> -    uint32_t current_status =
>> -        get_reg_field_value(
>> -            value,
>> -            HPD0_DC_HPD_INT_STATUS,
>> -            DC_HPD_SENSE_DELAYED);
>> -
>> -    dal_irq_service_ack_generic(irq_service, info);
>> -
>> -    value = dm_read_reg(irq_service->ctx, info->enable_reg);
>> -
>> -    set_reg_field_value(
>> -        value,
>> -        current_status ? 0 : 1,
>> -        HPD0_DC_HPD_INT_CONTROL,
>> -        DC_HPD_INT_POLARITY);
>> -
>> -    dm_write_reg(irq_service->ctx, info->enable_reg, value);
>> -
>> -    return true;
>> -}
>> -
>>   static struct irq_source_info_funcs hpd_irq_info_funcs = {
>>       .set = NULL,
>> -    .ack = hpd_ack
>> +    .ack = hpd0_ack
>>   };
>>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
>> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn401/ 
>> irq_service_dcn401.c b/drivers/gpu/drm/amd/display/dc/irq/dcn401/ 
>> irq_service_dcn401.c
>> index 8499e505cf3e..fd9bb1950c20 100644
>> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn401/irq_service_dcn401.c
>> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn401/irq_service_dcn401.c
>> @@ -109,36 +109,9 @@ static enum dc_irq_source to_dal_irq_source_dcn401(
>>       }
>>   }
>> -static bool hpd_ack(
>> -    struct irq_service *irq_service,
>> -    const struct irq_source_info *info)
>> -{
>> -    uint32_t addr = info->status_reg;
>> -    uint32_t value = dm_read_reg(irq_service->ctx, addr);
>> -    uint32_t current_status =
>> -        get_reg_field_value(
>> -            value,
>> -            HPD0_DC_HPD_INT_STATUS,
>> -            DC_HPD_SENSE_DELAYED);
>> -
>> -    dal_irq_service_ack_generic(irq_service, info);
>> -
>> -    value = dm_read_reg(irq_service->ctx, info->enable_reg);
>> -
>> -    set_reg_field_value(
>> -        value,
>> -        current_status ? 0 : 1,
>> -        HPD0_DC_HPD_INT_CONTROL,
>> -        DC_HPD_INT_POLARITY);
>> -
>> -    dm_write_reg(irq_service->ctx, info->enable_reg, value);
>> -
>> -    return true;
>> -}
>> -
>>   static struct irq_source_info_funcs hpd_irq_info_funcs = {
>>       .set = NULL,
>> -    .ack = hpd_ack
>> +    .ack = hpd0_ack
>>   };
>>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
>> diff --git a/drivers/gpu/drm/amd/display/dc/irq/irq_service.c b/ 
>> drivers/gpu/drm/amd/display/dc/irq/irq_service.c
>> index eca3d7ee7e4e..b595a11c5eaf 100644
>> --- a/drivers/gpu/drm/amd/display/dc/irq/irq_service.c
>> +++ b/drivers/gpu/drm/amd/display/dc/irq/irq_service.c
>> @@ -41,6 +41,16 @@
>>   #include "reg_helper.h"
>>   #include "irq_service.h"
>> +//HPD0_DC_HPD_INT_STATUS
>> +#define HPD0_DC_HPD_INT_STATUS__DC_HPD_SENSE_DELAYED_MASK        
>> 0x00000010L
>> +#define HPD0_DC_HPD_INT_CONTROL__DC_HPD_INT_POLARITY_MASK        
>> 0x00000100L
>> +#define HPD0_DC_HPD_INT_STATUS__DC_HPD_SENSE_DELAYED__SHIFT        0x4
>> +#define HPD0_DC_HPD_INT_CONTROL__DC_HPD_INT_POLARITY__SHIFT     0x8
>> +//HPD1_DC_HPD_INT_STATUS
>> +#define DC_HPD1_INT_STATUS__DC_HPD1_SENSE_DELAYED_MASK            0x10
>> +#define DC_HPD1_INT_STATUS__DC_HPD1_SENSE_DELAYED__SHIFT        0x4
>> +#define DC_HPD1_INT_CONTROL__DC_HPD1_INT_POLARITY_MASK            0x100
>> +#define DC_HPD1_INT_CONTROL__DC_HPD1_INT_POLARITY__SHIFT        0x8
>>   #define CTX \
>> @@ -177,3 +187,57 @@ enum dc_irq_source dal_irq_service_to_irq_source(
>>           src_id,
>>           ext_id);
>>   }
>> +
>> +bool hpd0_ack(
>> +    struct irq_service *irq_service,
>> +    const struct irq_source_info *info)
>> +{
>> +    uint32_t addr = info->status_reg;
>> +    uint32_t value = dm_read_reg(irq_service->ctx, addr);
>> +    uint32_t current_status =
>> +        get_reg_field_value(
>> +            value,
>> +            HPD0_DC_HPD_INT_STATUS,
>> +            DC_HPD_SENSE_DELAYED);
>> +
>> +    dal_irq_service_ack_generic(irq_service, info);
>> +
>> +    value = dm_read_reg(irq_service->ctx, info->enable_reg);
>> +
>> +    set_reg_field_value(
>> +        value,
>> +        current_status ? 0 : 1,
>> +        HPD0_DC_HPD_INT_CONTROL,
>> +        DC_HPD_INT_POLARITY);
>> +
>> +    dm_write_reg(irq_service->ctx, info->enable_reg, value);
>> +
>> +    return true;
>> +}
>> +
>> +bool hpd1_ack(
>> +    struct irq_service *irq_service,
>> +    const struct irq_source_info *info)
>> +{
>> +    uint32_t addr = info->status_reg;
>> +    uint32_t value = dm_read_reg(irq_service->ctx, addr);
>> +    uint32_t current_status =
>> +        get_reg_field_value(
>> +            value,
>> +            DC_HPD1_INT_STATUS,
>> +            DC_HPD1_SENSE_DELAYED);
>> +
>> +    dal_irq_service_ack_generic(irq_service, info);
>> +
>> +    value = dm_read_reg(irq_service->ctx, info->enable_reg);
>> +
>> +    set_reg_field_value(
>> +        value,
>> +        current_status ? 0 : 1,
>> +        DC_HPD1_INT_CONTROL,
>> +        DC_HPD1_INT_POLARITY);
>> +
>> +    dm_write_reg(irq_service->ctx, info->enable_reg, value);
>> +
>> +    return true;
>> +}
>> diff --git a/drivers/gpu/drm/amd/display/dc/irq/irq_service.h b/ 
>> drivers/gpu/drm/amd/display/dc/irq/irq_service.h
>> index b178f85944cd..bbcef3d2fe33 100644
>> --- a/drivers/gpu/drm/amd/display/dc/irq/irq_service.h
>> +++ b/drivers/gpu/drm/amd/display/dc/irq/irq_service.h
>> @@ -82,4 +82,12 @@ void dal_irq_service_set_generic(
>>       const struct irq_source_info *info,
>>       bool enable);
>> +bool hpd0_ack(
>> +    struct irq_service *irq_service,
>> +    const struct irq_source_info *info);
>> +
>> +bool hpd1_ack(
>> +    struct irq_service *irq_service,
>> +    const struct irq_source_info *info);
>> +
>>   #endif
> 

