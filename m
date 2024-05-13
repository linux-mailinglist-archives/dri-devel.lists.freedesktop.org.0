Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 774858C45B4
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 19:09:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66CF810E8B2;
	Mon, 13 May 2024 17:09:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rzXBer8C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2066.outbound.protection.outlook.com [40.107.237.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BEC210E8B2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 17:09:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UkxC2MMTm2CKzi7v9sk36VGqUCfethS0sarZ5vM55kV4VAtVrzbZscBmLdUNtW2jsujB/sIM6X492nmbrEXR/ZDtbzaTlVcuaieAJbIZW/U8RymgvMXSC0RsOV4ePepbH5FgXi+br1lMcvozoK2q56r+d5BKoDIdqBXOUoDNQLjju01Za6tgYn3hgxslwfAWXwkoCu+/Jt1jnbWwp6TvwPS8sGiz0Ai1qFc4NQBTVeHNwq3rQ4BLLOx/Bb1+c6YHHS0dGe/x/2THHzS9QBbQAyydKP2rjNuw7YdF5922RQK3XmjKeOZ9Bye9HTcw0GlyVNP2L+SM/ZNfqamJi+21DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O2MbSic0tp13u58coPM2/B6glt56v62i6SRkXXidDpg=;
 b=Wz/9CFgqBz9d6MNhvcVxGtY7T4gKxtu5OF3cNoL3K/C9C1xdmZ08KcEwmVZcGu+3K4+x+v7LzwVE9dK/Z4j132BQt3D8pZZCGbd+TdwcjAXG26tTyeDGOwFOvv3+t+zwuY0OFuKoAELQjsTyg8PtZR/LMFqA1OpavB3AyBz+VQqu/cMY/4Yfsx+xCShVAoGD47Cs2MoGJbItod8illg5tpTqYTpFiUc9X9yMt3Wc7q4nIS+x4gag32S4G9Yslq3tfCwkjQQjG5fjmKL7C/x4jTEWOgwahhg9+Vps8vX8ZhPEl0hiC04p6REgRMJ3i0VynmTCMUlGJLoimLtRx70NmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O2MbSic0tp13u58coPM2/B6glt56v62i6SRkXXidDpg=;
 b=rzXBer8Cq69pcK71CN5o14BK3BPHoJldchBHyiq4JtLWtfBZpM4SGYloU8b9gej1oF2OMon/txWPBfQjuXHtMvbgMf81QtKsAsAEj9cRryuOUSSc8HWh+3rlBVFQkAiwWpoJMYgw27AkSSGeJAFftVrFvrnv+ETRhlEmlgiy/58=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB6066.namprd12.prod.outlook.com (2603:10b6:208:3ee::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 17:09:28 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 17:09:28 +0000
Message-ID: <973b5119-0fca-4420-b5d2-b5b4862c77cc@amd.com>
Date: Mon, 13 May 2024 19:09:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: dma-buf sg mangling
To: Zack Rusin <zack.rusin@broadcom.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
References: <CABQX2QMVfsZZrHLktZ=MhJ5gG1ATRuSGa+E-CKfXATgU5BwMwQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CABQX2QMVfsZZrHLktZ=MhJ5gG1ATRuSGa+E-CKfXATgU5BwMwQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB6066:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f2b7a22-5420-4b2a-8edc-08dc736f72bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzRyWmgycnJVR3ZjVG43dGxTVTB4TXBLUWE2eVBHYW5MSkdGTnRyeFBUczdZ?=
 =?utf-8?B?Z1JNdU5FbUJlb0NYaFN5a2VYSG9HbkRvZE14K3hUTEozRDNVRHlSL0lFWHM1?=
 =?utf-8?B?anp4dWxxbExJU0dFZVIrblFmOXUvdkQyeWk2RkpKd3lkQkJuOHk2ejBPdDdl?=
 =?utf-8?B?OWc2OUlkSThrbFBaQkJUME8yYzJsMkJMY0MzWU9zcWNPZGtaZE5qK0pDM2lp?=
 =?utf-8?B?L3IyeE1qWThYTU1nWTdFSXZzYm5DeHk3aTVCZXh1dWZpR25aaHBPSzZ4NmVk?=
 =?utf-8?B?VkJFVXZOQkxuSjd3OUxEUURqVXJMVGVEanptQ2picWRpMkVHMDNValhNaTg5?=
 =?utf-8?B?N0ZuN3p3NVpyempxQmxoT3VmQTZKRyttMWlqR3IvZ0d4U3B6S0FqOW1PVTNO?=
 =?utf-8?B?RmkwclFOUWJQdmFUT2ZBUnF4UVhGbVBZeWM5Rnc3YzRxTzhXUnk5ZWR4TTZW?=
 =?utf-8?B?aHdQZ1E4SCtjZjRWRGN6Nmd6TjY2L1JWc09FUzJjaVlqOUlrMHBxYXVSVDA2?=
 =?utf-8?B?SXFIT3BOazl2R1RwZ3BsYml3VnhDL0RrOUFFTytxLy9hZXJkYTNUcGx3QzlJ?=
 =?utf-8?B?bmdOTzNhZmxiTk1VVXluYUNnb2czYTJGdHNCZk1sMVlyeXhsS3hVdXYxd3lh?=
 =?utf-8?B?bmtGMHB2T0ttelovUFN4S1ZFbVRXaHB0WFVvUlNUVHVZSnN1UFJjRDloUzg0?=
 =?utf-8?B?bXQ4SS85VDNYbS9SVkJtUjdtM2tDa1R2VTNKQURYK0pCdXZFQXFrL3E0MGpl?=
 =?utf-8?B?VTYwMWhzb3IxREJIaFhPS2FsM0Qyck5iTkZ4UFhpR212UHRCN1F5UVlXZXRB?=
 =?utf-8?B?dW1zSSszenMzd2FCOTJ6Y25RTVJXdmkyODBmWGFna1VTYlN0NXdRajF1ek52?=
 =?utf-8?B?Uk56YVNFVkpNYmN0R0VTcWtBNk1YZ1FIWDVGb2R5Z0J4SzAvQVBuZERhbDZw?=
 =?utf-8?B?ZE8zUTFrMkcveHJRb1hDdEszRE8zVUFhbHVEcngyaElFckwvUEl1YVE1anpF?=
 =?utf-8?B?L0N4bnVEMlJhUy9ZdG5mMHhWTkxIZmhJa1krcUhUZWxMZmZBQmZkRk5BdWlw?=
 =?utf-8?B?UjdiY0ZOYVgrVmhvN1RpaVR1M01RVzVUSWZTNzBQMVR6YU8rNGQ1VlJHbmNr?=
 =?utf-8?B?NW45QWRISXQrU2NNSVhqK2t0QTlGM1Q1NG9oMnNnRUtPUU1IN0V0a3lBZWI0?=
 =?utf-8?B?d0lIMmNuZ0ZaZGJwM29UelVzM0w1Z3lubFNDbk1wdDhsSkc3ZDRBNGtIeEJq?=
 =?utf-8?B?TXNCWE5UUnl6eTViTkpoZlBPaStRdGdmakRmck9qS3ZzR21lY0U1M2NvbzdI?=
 =?utf-8?B?VVVkd1liWmRjaXJQTVVUZjNrOWd1R09VbHBQUUJObHR3S0lyUytGYmhqbU85?=
 =?utf-8?B?MnpYaUFRcFhwZUlkVXBIVXhnQmVLbEc4eWZmTjBuZ3FqazdEUG5pTFN6eE5R?=
 =?utf-8?B?a1NPL0hGZk5ucnZRSVc4ZXUrU3duQmdQVi8zT0FndysyVzVuLzZyRWIyNWJi?=
 =?utf-8?B?cWVQbTB5MlRxZzVZR21mVWFQTUZCMVdwRldiRDA3VjUwK0lhVHdQenl0dE5V?=
 =?utf-8?B?RGRSd1ZxbGpRa3ZESW5lRVhlb1pZYTNzdUZKTmIvenFSWVpMSzgvZ044VDhk?=
 =?utf-8?B?cktTUGFVNVUwTlpERS9Vdndmdzg4Z3FDcTUvNHo4ZXdiR0FCTkVKRXdBMGFD?=
 =?utf-8?B?Y05sek1DZFd5L1B5bllKMStlODc2ZC9OZ00rOWxZY0RVd0cyZ0p5Z1FRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2tybGNZMUJQVzBHcTVWOFBZVXUrdjNCSkw2bFl1clQ1YkNEYTZqNUMvOGtO?=
 =?utf-8?B?QXBYUWtJMHg4NGlVaGxnNnlQbTRkdTNIVEh2UjJ1ekY2akNQcW44OHVycDYr?=
 =?utf-8?B?Z3M1d0o0dHRYWlpMMVJFbFd6blRINW4rV3VLUHpETi9NZi95TWFUZmFBNG9w?=
 =?utf-8?B?K0IrbFBuUFZvMitscy8wZG9FNHpId2lRZDJ6R04xaVdxM2pORFgzc2hrN1FH?=
 =?utf-8?B?M2UvNHhTQk0yY2l6UEt2T2ZONXdlOFc4VHB0bzBWOWVUdkJJd1puVU5FeThK?=
 =?utf-8?B?aUZOQzdzLzFmVkhXWVlQek5aeCtidTRCNEhQYktscHF2WVFFUm1rcGdiaVJP?=
 =?utf-8?B?UVU3TVRUOVovbms2cXNYM2ZhZ2VSeVB2Q0l6TmNWZlFVN0VjQm1lMCtUZDhQ?=
 =?utf-8?B?cUU5TDNNRFZYZ2ptZTBqcGRhZU9peXJEZTJIRnZ0U29WSTFCQzRHdEFnbTIx?=
 =?utf-8?B?ZURwVzdMaUNJeHhqOEVTc3BHUmlwWW16WWlZK0xkTkdCNmdUUVcvbUdLN0s1?=
 =?utf-8?B?MXBWY2tFWGRBVzIzaVpzRTU3MUtnS3FMRXJQUkRIc2VFNUUzQk5IQXRqdUx6?=
 =?utf-8?B?ZVprMDZGYzdIV0t0VmJNMnBXZWJnUUFOK1dFRURINWNwNURiVy9Rc21vRS9I?=
 =?utf-8?B?QTN3bi9NVWJIRG9EdXFYbkdNWFcrTW9IdVdqUThSSWIyc3VKZzhLTlhMYThI?=
 =?utf-8?B?d0RQZXhmbHQ1UldZUXJJT0RiNUhpcjhTVEN6cWVTSitLODlDczRoTGpsQVQ2?=
 =?utf-8?B?cEpZZ3VDQVRSV0ZBVTdKYXZRRVNORGdoNEpZT3A1ZnRJQUtLM0trcmVDMS9u?=
 =?utf-8?B?QzFHYjdhR3ZSWE16d0lkVjRYUnl2em45S2FkYWJEZnJ5RUg1aVM1MFZJYVEv?=
 =?utf-8?B?Zm5aUkswSXUvYTdlYVE4WUlnckVNZXl4YWlZZWRpWUd3OFRMZ0dQN20rdWJ4?=
 =?utf-8?B?YnFBQXVNL2tWSTdGR29sVFlWN0FjckltaDdoL2hrMjNvTG1tUGF3YWNtcTdS?=
 =?utf-8?B?bXpESXdvMjV4VXR2Wjk2RGFmcVF3d1MvTmc1SlE3TWVkTllkM25FSVdWVlF1?=
 =?utf-8?B?MExZOXNubHI0L0xXa2FHdWMrQmxRMHl2endaWkd0bHg5bEdITjkrR0p3emtF?=
 =?utf-8?B?N096NXh1UEdSTGh1aFFQZ1hWdDhNbTdnaElzMmhqVTIzQ1hIY3B3aUVVelhq?=
 =?utf-8?B?SWpScklGZ1F2b2tldkN6UUE3TUdoVlMrSWtIZk5wYnBKOGxKNzczdnVCMElu?=
 =?utf-8?B?aVA1RkN4aUs0b1pLSnMyd3JGTzZKb3lJdmw1cjFUZnhZUzBhVFlCSENZQ2x3?=
 =?utf-8?B?Mkh4THFwUlREcTRlQUhXbE5NQTF2QVgyd0E2b3p0M0NsZVJsdytWbzFoUWFh?=
 =?utf-8?B?N0MvdTFiY2V4VDRuRUhWcG4xSlZYZFY1cjY5OW10ZFVvc25VSGk4VHNld0Zz?=
 =?utf-8?B?Y1dYMy9SNjdndWhoZkpnb2VKN0dCdXdUWk9kbjFWbDJEcnJuSFRGeVA0TXBT?=
 =?utf-8?B?LzNnTEhBS2QwNGxoWWg3T2l0bnBlMDRsclFwUG84dlo1M0xOOTFDK2xRK3VN?=
 =?utf-8?B?cnJtc1YvOFpPeDc0M1c5NXM5bUxUNjl1TDIxVFRlQnFqMGE1VjZzRGlySjFO?=
 =?utf-8?B?eGVvODRET1lnQWt1a0ZFaVVjTkNSV09YY09GRjNTRCtBSHVtcmcyeG1KNmRw?=
 =?utf-8?B?UnN3QnNMdDd4MDRSdFl6NVorTjVuQ2JoaGN3YWNvVEV5Y2laYnhuSndDa0hJ?=
 =?utf-8?B?VGxtM1lvQWVEcEZyMjFsS2VWckM1REpSQVZYM3BFTUZEL2F1alhReUgzNmJD?=
 =?utf-8?B?MEJsWWUwWmU5UGdoYjNBVXBBSUtuUTBvTThDczZsY3ZmdmtIVGFuZ0FmM29y?=
 =?utf-8?B?ZmtuT3dFUi9TOHVNbDJRdGNWWXo5c2NzZEhmMTJHN2N4cGNxVTlRSk5jejU2?=
 =?utf-8?B?QTVKQmJFS29GYUtJQjk1aUJ0S1FGV2FicWQzaXlKTlRKVzFUME5rUFRxaEpv?=
 =?utf-8?B?TGdZY3l3YkdOa2JNQkZJVzFZYjQxZUpzN2ZSVXBWUTVKcGhTWnBiWk9IYVdi?=
 =?utf-8?B?UmF5ekZ5KzVUOTV5eU1KTUdDZkFJMTAwclZNOVVJcDRVa2VKbHJlaWNRU2Zq?=
 =?utf-8?Q?PV4EfiWw3jnj+OWRpEy2mOApw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f2b7a22-5420-4b2a-8edc-08dc736f72bb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 17:09:28.4391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cKOaZMzDAufPkGa6EJcO/x7i9IvFklR2/jPpLIZige6stAdlWQRMC8BQdJ0RYFu0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6066
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

Am 10.05.24 um 18:34 schrieb Zack Rusin:
> Hey,
>
> so this is a bit of a silly problem but I'd still like to solve it
> properly. The tldr is that virtualized drivers abuse
> drm_driver::gem_prime_import_sg_table (at least vmwgfx and xen do,
> virtgpu and xen punt on it) because there doesn't seem to be a
> universally supported way of converting the sg_table back to a list of
> pages without some form of gart to do it.

Well the whole point is that you should never touch the pages in the 
sg_table in the first place.

The long term plan is actually to completely remove the pages from that 
interface.

> drm_prime_sg_to_page_array is deprecated (for all the right reasons on
> actual hardware) but in our cooky virtualized world we don't have
> gart's so what are we supposed to do with the dma_addr_t from the
> imported sg_table? What makes it worse (and definitely breaks xen) is
> that with CONFIG_DMABUF_DEBUG the sg page_link is mangled via
> mangle_sg_table so drm_prime_sg_to_page_array won't even work.

XEN and KVM were actually adjusted to not touch the struct pages any more.

I'm not sure if that work is already upstream or not but I had to 
explain it over and over again why their approach doesn't work.

> The reason why I'm saying it's a bit of a silly problem is that afaik
> currently it only affects IGT testing with vgem (because the rest of
> external gem objects will be from the virtualized gpu itself which is
> different). But do you have any ideas on what we'd like to do with
> this long term? i.e. we have a virtualized gpus without iommu, we have
> sg_table with some memory and we'd like to import it. Do we just
> assume that the sg_table on those configs will always reference cpu
> accessible memory (i.e. if it's external it only comes through
> drm_gem_shmem_object) and just do some horrific abomination like:
> for (i = 0; i < bo->ttm->num_pages; ++i) {
>      phys_addr_t pa = dma_to_phys(vmw->drm.dev, bo->ttm->dma_address[i]);
>      pages[i] = pfn_to_page(PHYS_PFN(pa));
> }
> or add a "i know this is cpu accessible, please demangle" flag to
> drm_prime_sg_to_page_array or try to have some kind of more permanent
> solution?

Well there is no solution for that. Accessing the underlying struct page 
through the sg_table is illegal in the first place.

So the question is not how to access the struct page, but rather why do 
you want to do this?

Regards,
Christian.

>
> z

