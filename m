Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4FAB445F4
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 20:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4882310E13D;
	Thu,  4 Sep 2025 18:58:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="syv7a1z9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 308FC10E118;
 Thu,  4 Sep 2025 18:58:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cmJWKXPxWyBSGU34cqMZaDF4gRy6Sr5HphvS+mekNUTV7QQMXFdsIb8A1dj6+whVQIZy9/Ftg9AcLcszIn04VC41NTwfNwuqDkvI9+XS2lDirg1rj+BtfbGkNPisHoPFtzqbnuTTVfnOTManOQpBvnvjsUuqGKVjoJSPl+dGLPqTpasoBRXCPDBOQwruqp/Mr4cj/tiLVWPwSN4ImTFlsdDdg60U9hoFol33AOgRtIXvVakNf7IXRa6QQehWGv1XJsmxH/cjpaKitqFwfVWtKP1TgVo4K85adjhBk8BrPnyrgKU3vMjnODcMu9Dao7bkffSxIWmcXSm9Edghom4ahg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0/PSrsqeUHk2om4Oeg0+fOsB4oyC5pPGSXwsWRyoC3I=;
 b=R5s8gYC4y/LtHuImIo+OdLynBqicNCDTNSXbH+ySIkActymAUgMsofMsfq/yvXgxuWe6a+H30wvfSFEi9stLExIVnDzabL6aDsavAOnMBwK6IQhU5+Aqh2HY+Pzt5gxbqiCr2Kc6HExkL94AkAKR8clEjb1otfp7s9BBSk7gWaG2M5wPlHENyKrzlPZQa2LNtzJ2gyGnsc0c57iS5Bd+BYty+wLkR6uyKPcNqW6HDmWkZ6TiUCQCA/E7ZJRUX9AZ7morFcmGghajLJbssSyJEtzn2eneyaBnS9SZZqVqhD6A5HmX2iWn2hs9KucvkxXkRiDHu8wFRserLJtTKdjOHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/PSrsqeUHk2om4Oeg0+fOsB4oyC5pPGSXwsWRyoC3I=;
 b=syv7a1z9Wuoj8ap1ujvP+WQypbrA79jjWFmg/a7D1ZL5/JLccyosK5I5MYsiWCjIJVGPjMhlJIu0WzayxRxfHAvT06yczp2KeEHntZwHUkJGpv0uB4oHoptmoy7fIrhfOETlxWJYim/DLUhpostj9r2KTKakdF4SPKyl9buLjpM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM4PR12MB6397.namprd12.prod.outlook.com (2603:10b6:8:b4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 18:58:48 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%4]) with mapi id 15.20.9052.027; Thu, 4 Sep 2025
 18:58:48 +0000
Message-ID: <3e705c13-4913-45ec-a32c-deed2f96a5ba@amd.com>
Date: Thu, 4 Sep 2025 14:58:46 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdkfd: Fix error code sign for EINVAL in svm_ioctl()
To: Alex Deucher <alexdeucher@gmail.com>, Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Philip Yang <Philip.Yang@amd.com>, Alex Sierra <alex.sierra@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250904123646.464028-1-rongqianfeng@vivo.com>
 <CADnq5_N=hQH9OGp2GfdPeOq7V2B_UX0VCDQ-XcTDroy-WHRmyQ@mail.gmail.com>
Content-Language: en-US
From: "Kuehling, Felix" <felix.kuehling@amd.com>
In-Reply-To: <CADnq5_N=hQH9OGp2GfdPeOq7V2B_UX0VCDQ-XcTDroy-WHRmyQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0107.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:83::19) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DM4PR12MB6397:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c524240-6aea-4f61-5f75-08ddebe51484
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVFHdDFuOVoyejQwaUQ5RVowQXBrNUl2dzVDazVxNFJveUJUOHpDaDlIc2xp?=
 =?utf-8?B?d1VWcngxVW5GZmIxSCtDbW1uaVJsT1BPck84dDh1YnN4K3lnaDVMSTVBcE5m?=
 =?utf-8?B?Y1ludzYycHgyVlNheEFoRExDbm5LSkpiQy9qcmg4Z1REV0FZcUF6ZG1VVUFm?=
 =?utf-8?B?Y2lQTHI3Q1NraEI5UHQzNkVWeG1FdFFLWkRDTVhnbWU4VjBQUjNkc0UzbUU2?=
 =?utf-8?B?b2FHYy9tM25Ic29wZGZldWFTelhjQXhVK3QzNzlSeU1jQ0lrNUY2K2lVdk9Q?=
 =?utf-8?B?aW1DdHFUam5UdkxaNEFnNXIrZXhhcnpFczk1d1FUSys3VE1ucTRhb05ybVQr?=
 =?utf-8?B?VXpFMmM0YmJEM3cxMERGaWdqRHJWVkhlZWhCcmFDTkZrOE53WS9ZeDhaaXVZ?=
 =?utf-8?B?bUg1R2d4Skg4cWxTKzBqM0pFem5ram9ONGZRQlJnVGhsSFVib2J2U1VnMkNL?=
 =?utf-8?B?dE1VYWJrT2IyMG5KQXhydUZlTkFyUkI2Rm9RNUNNb3diSU1ycGxuZ1RwcW8y?=
 =?utf-8?B?enFLRFVQRjlBSHh4M2lLeWwwbGZXMTN3Tk56ZndPdEF5YnZtK2xmdWZkbUFD?=
 =?utf-8?B?U0NsZkgvejZkTlBsSlRqN0lUVUg3Qlk4NWp0ZWtmYVhkTnc4NWpDVExFMFlW?=
 =?utf-8?B?QlRDc3R0M3dKaEtZN2Ivb083OTlUTk9oQktCWjFPOUNXb0E3NVdBS3ZnWTJl?=
 =?utf-8?B?TE0rcmZnTGtTMFhNV29GWHdKRittWkxEU1NONWFNZUJTT1hNVUk5V3ZPa0sz?=
 =?utf-8?B?eHZ2U0J4SXdqdkg2UGZuL29HaHpsbDBPSFFhZHpFTXFsY0o0b1VmelZvZ0RR?=
 =?utf-8?B?TkFnOEpGdzNPNWIrM1c0WTVlZ2JOU3d2UEZlUnlRNVE2M2JLc3RzQ3d0VTJK?=
 =?utf-8?B?eTFXZ0QxNEZzR2xmYTRkL3VJZnN0MDZTSVVnb3pnV0puMlFTYkY0dW9uZFd0?=
 =?utf-8?B?dk5PNmhCdStiOFVTQUQ5QjhxbHgyZGczL3pKMC9YYzNrU2JpRGJYc21QTjFt?=
 =?utf-8?B?NG01SFFYMk1nZXNrVkZHcjhIeFYyK3ZTbUVBdWdQQTRFbkFtQzBKYW1xRk9S?=
 =?utf-8?B?K2ZRTEN6V0ZxSk1ISXMyYjRJcDI4V2NpTUZCRzVKNEVBSWxPUUhDU1c2NHYy?=
 =?utf-8?B?UUVaTjdXWkRqT042ak5oN3VUd0kvWndBR2lBRGlXSU91UGZaK3ZRQlZqSGgr?=
 =?utf-8?B?RndhNU1BOFFGVEpLTE5XVlAzSnNtVjdPTnMxbjFQYTNxK2JlN1orQkdJYjBm?=
 =?utf-8?B?NmtaMUc5cFZUYnRTajJYR2lzL2NWckxGS01HdlJRTUFBNStyemVxVCtoZm85?=
 =?utf-8?B?MVJ2cm8xVC9lQjl0NHRaOXN4UTZwZVFBVGQzRHdwalo4QUw2RGtYbzJPZW9H?=
 =?utf-8?B?QW9lUG9Nem9qZTl6aTlubVVwdHE5L2ZSWkFhdlgrdlBOWnJHblk0VENzK1dV?=
 =?utf-8?B?YVAyR0RFaitpNklveGhkTHg3eGlNdUFOSUcyYmtKRnBqVlJiS3ZZYzhuVGFO?=
 =?utf-8?B?aVRvZnRtR2dMV1QxcHdzNFQzM1VoTjI2enNqakQwd2w2QXlidFdENGcySEFP?=
 =?utf-8?B?clkxN1R0c292NVBpYnZMVVVWMnU5M1pRbER0VVN2MEQzbXViNFFtQ0Jmbzd2?=
 =?utf-8?B?V052aDRQbXBvR0NaM2pTcUFva25kRUVtS0k3WlhheVd2MlY5TlJPcDl6Tm5h?=
 =?utf-8?B?TWtHOFp1NGRPNkZlSkxLQ2JRbHRIZ1dQMFI5ZXAvMnBvQ3NyU2E2bk9XMmhF?=
 =?utf-8?B?bEtpSnpydFpEdnF5UTdodG5uSnk5c2tTNERlMFI4SzlFTG9vNWpqRWlPaHQr?=
 =?utf-8?B?aXZVK2QxY2ZsU1B3bzVmanNic2VPTzRnT0lKTXJBeG80UDNMM0JCOFZQeDlk?=
 =?utf-8?B?QlcrMzhITGpUVU9pVHg0b0pubXhCclI0RFRoOHdQNE1IMmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHFSQ0NvWUxtVEtsd0dsTzBUbXRTUzFIVHZDRFdnNElvcXYyVDhkZCtxMThH?=
 =?utf-8?B?bE1NRjhBQzNUTVp1U0c0NUFRTkxkVjl2dU5NYmxxdkFZV2Yzb0tRUldIN0RR?=
 =?utf-8?B?ZWp1OEJzOEYzRjFTL082UWoyU1FFdGgrdGVNejRhQThrOUJmZ2o3VWdHa05v?=
 =?utf-8?B?MnVOYzJFS2liTVJwSWJEYmxZbCtEUndlc0xyZk45eitwT3VPelJNbGl3bk5n?=
 =?utf-8?B?S3JvSENwV1lScDB1Mzk3dkUwbTdGREN0Wk5nOVhMQ1lTRmo1QXZHbllmK2JB?=
 =?utf-8?B?N3R0THVrY3lKbjgyS0JzbU9qaHFUYkhBeWlmZlQ5U2k0VmNnQjZMRHFYckdP?=
 =?utf-8?B?cHZTcGo4TzYxME9RZEpQODlkM2VTY0tHTE5FZlZnWndDaW1ralB4NHlMMERE?=
 =?utf-8?B?ZFc0azl2U2V0TEJDWGl4V21FazRpUEQ1bUNqMEZWWWViQThMTnhaNzI2OUl6?=
 =?utf-8?B?N2dEZ25BTFdYcHRqcHdlMXZQMURtakZqR2VUbW5tMTh0Y0FkYU1tUk95S3Jn?=
 =?utf-8?B?eEU3RDZvd3Y0R2tiUE1wZDcwc09xL1B2UW1SRThsSTdRN2pCcDFtaGVJMllV?=
 =?utf-8?B?SENWU25JNGRpakUwaUFOOUc1Sk03azF1TE41aUdRcGMxMWpJZ1JYL1hyZzVo?=
 =?utf-8?B?YVBJeWdSa1c3aW5kMmtyS09nRmdQcTlzMDR1eG1zSnlaYjdzMktlZENnTi93?=
 =?utf-8?B?bmJyWlRrMnpqZytzWldjWlo5azVCc1BrcmtteHFwK044QkJtWS9lOTdIYXRo?=
 =?utf-8?B?TnNQWTZXNGM0VENRV29RTERGZU9sWUlLaDdjVzVTT2c2aGZ3ZDh5ZVk0WE8y?=
 =?utf-8?B?ZlY2ZW9BODdhNjdUT2w0U1JranhpMFFrT1VEUlMyY2o4aHRXck90ZnVYaWN2?=
 =?utf-8?B?Y0NHYkFVZE5JMFpFUWYrMWl1MUNIaXBmL29hQjRodllGM2U0WDErWEpaeTV3?=
 =?utf-8?B?dnFNTkFSK3dNYzNhSDlaOEgyaWRCcDY0UzJzTnpNVUVOQU4rcnFvUmJOSjVZ?=
 =?utf-8?B?UTRZV1VOdUNyOWNZNlpRMFIzUnM5ZWd3ZE1oUSsvTWZCQ1FWdDYzbzN1Z2hM?=
 =?utf-8?B?ZHhZWFF5ajBERHZTQ2w3bm5icmsrMFlQZEpwaHEzMVQyL3ZRWWtLM0pJYWtY?=
 =?utf-8?B?ZFNrSnJ3SE5ONU9hT0tPUHUrOU5xMm03ZHZjenVlOVZjbFE3dWIrUTQ3WFU0?=
 =?utf-8?B?elUwbTByRytVVFpqcWx0R0c3YmVRVThmQ1NLaUVHcTFzUmVUQjhPSFlielYz?=
 =?utf-8?B?TEJpWUxQUDdUYm5rNEt1ZnMvcUVGODA1Y2JQNnFzNHhiWVJPVllQY2JtVTBC?=
 =?utf-8?B?RmdsMFp0aXg4SFlXeVArYndKeERsamtBcy9WRTY0YmRjYXFvWkYrYkRESmN1?=
 =?utf-8?B?OVZHeDdHTFNhYW01bkgyaTVpdjJQRFh5em9takxncGoxUVgrZFlkTWVvbklQ?=
 =?utf-8?B?NTFzSGEwZnlENERqNW5ETWdpSEluWWgyN3lBS3RObjRVdGRvNEpqK3BDYVUy?=
 =?utf-8?B?U0xPNDBLbktUb2ZnOFhVOTRGL1VmUlY1a3luVzZmcG5IMDZ5aE13djE3cXFu?=
 =?utf-8?B?dXpOV0YrTmJ5THU1b0YxMTlCNnFJazlUZ1VjQkN6aDVrRXJaUnZkay9ma1Qx?=
 =?utf-8?B?OEFKRG9oVkUyZnJmbDZ3WWExZmJFazkxYzRRNG0vc1JxQ0lXZXdNYno0VUtI?=
 =?utf-8?B?YW9kNkdOL1JnR0luVTEyT1dFenM5TDAzcTQvQkIyVmI1NEZabm12dG15bm91?=
 =?utf-8?B?MytOY3JTV0ZjMGZOdXVsVEVVMUhzUDdyNnBiWUc1am0zMFRJV3QybFVlWHdF?=
 =?utf-8?B?SzdEUEVPdTNiWXBGLzZPU01ZdFpqbk9nOFQ5WjNPRFFIUStMV3ZubXZHL0RN?=
 =?utf-8?B?Qnk0YWFZKythUlp0QmNwak1HRVlYU2JhaENTV0pMTFFCaEs3dmdhQzFHWFph?=
 =?utf-8?B?MFZvWEs0THlrbjEzWms5SW9jZ3B4UHV1b1NLZWNlWllLb3VKdU9oUDBCeEVF?=
 =?utf-8?B?aVo3OW05OENwL1FxWGJLWlpvcGNkNnd0UzhTSFg2S0hOZ096UE4rVUVyamhJ?=
 =?utf-8?B?TWpXQnVCZjlNYVdvdUMwSk5waDFXM3hvN2svY2R4d0o3blZTU2xOYnFIOCtJ?=
 =?utf-8?Q?Rfjq2bk0Y7wxBNSroDtbA8UyV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c524240-6aea-4f61-5f75-08ddebe51484
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 18:58:48.3055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NA2dtM0AO2KEtxzQJaf1EWa45R33aoKCeUpZT1CFzgpiEPcZ/vul8SjFta747AhO4xT4F6YmiOS76Rm85SP0Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6397
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

On 2025-09-04 10:07, Alex Deucher wrote:
> Applied.  Thanks!

Thank you, Alex!


>
> Alex
>
> On Thu, Sep 4, 2025 at 8:54 AM Qianfeng Rong <rongqianfeng@vivo.com> wrote:
>> Use negative error code -EINVAL instead of positive EINVAL in the default
>> case of svm_ioctl() to conform to Linux kernel error code conventions.
>>
>> Fixes: 42de677f7999 ("drm/amdkfd: register svm range")
>> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
>> ---
>>   drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>> index 521c14c7a789..68ba239b2e5d 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>> @@ -4261,7 +4261,7 @@ svm_ioctl(struct kfd_process *p, enum kfd_ioctl_svm_op op, uint64_t start,
>>                  r = svm_range_get_attr(p, mm, start, size, nattrs, attrs);
>>                  break;
>>          default:
>> -               r = EINVAL;
>> +               r = -EINVAL;
>>                  break;
>>          }
>>
>> --
>> 2.34.1
>>
