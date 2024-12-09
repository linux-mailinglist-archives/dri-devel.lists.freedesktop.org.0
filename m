Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 689D49E9825
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 15:03:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC6510E792;
	Mon,  9 Dec 2024 14:03:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="12tgRgE8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2053.outbound.protection.outlook.com [40.107.223.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28AE710E790;
 Mon,  9 Dec 2024 14:03:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oZle3MEkKYn9G/4n3mUMW6IXmyLiha9IKQes4RrZfmXxHhjQKAQQG+PAzfTpyvX2yC/L+nqml/x3pdPmH7duyCFp/D6yDNN5l1GV/9X42ZPO9id5xIYVAoXPpi9KjDvTNBDsEeqBZg4iJaI3rTDZZZqV9TrdD24Icf+POGV0VOrwb35/zYBfrk1VBzAE64A56dUcWpr/OHucwICQ/OGX974xchoS0ySge1+VdSto1azh0VSy12CJhXr6Hw1fwPo7QcjZ9bf7T6leQOuC0FtSymKfOBapsHrBKK5ug/NCKBl5xbTaPoC9/LE8zVvV7HuQFdfLjBC9m116wO8wD6DQsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7MzB99e4AZiPNhNsUWvlB+1qqpyn8d0woO22OCdVUtY=;
 b=EsL4w/DnzbDM5+9xrVL+29KA7SNNGrWt/CfWNyjZJCPVGnOzEHmLDENoOg+I+6KUgPocVKKAoYgTDo1LIJXCm0LtAErUJT5HGKI1GYIJEsiV2nkN6QqnIYSFbsNPyoCDtw9/tEQttLztppNc1Jd2UpXzFuUuG4wvzPkQKOCE4ewFbvri4zw0rgO35+AZZrRbz8tQbf8R0qjokrNbsvO0xY8eCsYqR1Xl8qD0icot79EXfACDVL1kBrjmijlk/hV66bKSIhzc5kud1xI7h3TEAjuZ5zZh9ImZO7Q3r8D9UusgwxC0XTOY3yCLPo83PM910/m5VemvvmiWiMElkdat7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7MzB99e4AZiPNhNsUWvlB+1qqpyn8d0woO22OCdVUtY=;
 b=12tgRgE8/5zmeqXiAPZoyascEnw+K8ev2JF32qrubxe9Mg2p6hEYFZxTnWHoxF6xGkbs5wc1Fo3xkgLB4YpjvxokZJpwPLhyyhE454wdivKtEhBz7u+/AqlF9OCCKpeHZ5KeGzjkfg3BRuRYB7FPlBE+eMS4cP/p7cY5HerG6ng=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BY5PR12MB4049.namprd12.prod.outlook.com (2603:10b6:a03:201::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 14:03:15 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8207.017; Mon, 9 Dec 2024
 14:03:14 +0000
Message-ID: <ec42fe8b-9be0-41cc-96f4-f1869c6bb7e6@amd.com>
Date: Mon, 9 Dec 2024 15:03:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/26] drm/xe/eudebug: implement userptr_vma access
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-xe@lists.freedesktop.org, lkml <linux-kernel@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
 <20241209133318.1806472-15-mika.kuoppala@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241209133318.1806472-15-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0176.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BY5PR12MB4049:EE_
X-MS-Office365-Filtering-Correlation-Id: aa5370f1-e2a3-4232-018a-08dd185a3974
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y29xY2VLa3dlVDE4dWViYk93aXlBSnpCbWVzZmhCaWVDdVE0TmpDbGYwckor?=
 =?utf-8?B?UndWeHlPVmd1YUp3ZDBhZHBCajMrNDJrSXY2dFkzMXcyVzZwVDkya3dWSWNx?=
 =?utf-8?B?dWtFNHVMTmN4c2JFeHBRTTRqNVVPNDVwMzVBMEZxMEQ2b0NlT0kvRnA3Zjhu?=
 =?utf-8?B?Qk50NkZ4ck8wWGVhU2h1NzdBTDBPSTFUZ2hHM2pmRUwrTlBpSjhTMGV6bnlk?=
 =?utf-8?B?WGRmQnh6Unkwd09JK0c1V1krejRqSmcwMW4zRW9RUkkzOS96YVhtL0F3U0Zt?=
 =?utf-8?B?TEZrQXh2eUQwUzdaUzhhR1pYRkpEbnZOY3BWT2NwcjJnT09rLzFpVkRNSUUy?=
 =?utf-8?B?UUxtREFMVlRDTFUyUWRLVURWWnVrc0pIb2hnSGlBc2hFWFBLRUMra0t2Y2JL?=
 =?utf-8?B?NUNoby8yR21qWEJkOUN4MVplTTZ1WFUxeXVIZVBUMmhJZTNuNGtjY1pHeThR?=
 =?utf-8?B?SE1zTjE4TGRIYk0yb0pGZGF0Z0lxVkdybXdiako0blpWYjBCc0dFVnlTOGh0?=
 =?utf-8?B?WnF5ZWFrYTlxVmlqdlFWTURKYmhFK3o4c0tzVHVVbVB6RWkrdzFmNmZTZm5n?=
 =?utf-8?B?STBHVVFlWERwY2szRmF1L0djSHMvbzZKelhESkEyMU5FMzFBUDYySFNwbGti?=
 =?utf-8?B?QXhCU0lUSHZwSzdxS3p4eEZJalowQkpGTitYU0dCTlJpM1NWRHpCMVRUcFpK?=
 =?utf-8?B?Q3JRMUhxUlRWS3ZhTUdYWXR6bmJ4OWlKamxGbytvSlRoRWNLa2RXRW5nSnFa?=
 =?utf-8?B?KzhxeWM1STJGbGtWZlZyeWpqQkZwbHlJQVVXdzIwb0wyUUhsUEw1bFkwWHhU?=
 =?utf-8?B?b2dKL3BuaWczamh6c21aK09nZ3Ezc1AxWjYvT3JoM3BtRzhQS2UzM2c2WE5a?=
 =?utf-8?B?czl2TlRFdmgzQXdqME1TcG1Od0RKVHZQV0pCeGRCQWhjU1ptcW9YTFIvRTF5?=
 =?utf-8?B?WG1SdzBMU01UUzhwNHBxc2ZtL01obUJEV1lZaktySEkrMk9uRm1JNE1IVGJj?=
 =?utf-8?B?L3ZQbUpRdmNxUnlOdjdReE5TYzd0VTNMWjhKc29QcmlDVU50RHgwbmdFa0JC?=
 =?utf-8?B?WDhkUVllL3FGblFXRHpVMFprc3BSdE44T0pwWjN4bFpZY1l4RDc5NU53eitm?=
 =?utf-8?B?YVRNeFd2Vlk0eXhKT1YwcjZtZ1lGMzlFWmk0bERWY1dadEx2U01hNFNyck5L?=
 =?utf-8?B?eXRibVNzd2RyQkh6ZnhsL1NpaURCdkdmRTFQZFRLYTFjd0ZRMXIvaWhMdlF1?=
 =?utf-8?B?S1ZEc3BHZWlFd2F5K2FraEp4TzErZCtVNzNpanV3T0ZLN1VsazdnYVBPR0V1?=
 =?utf-8?B?NFgxb09JcXk4QXZCQ1orYythMHY5NWJRbUhvekRmWWZma3RLYStxVWZETUpX?=
 =?utf-8?B?ZE9DMGVYaU1LTklBN2ZPUVdvR0d5YThWUERPeGZ0K2k2RTNXeldrYkh4cG9D?=
 =?utf-8?B?anUyYkhkd2ZkaHBmTlUzYTc0MWhmbm5IRGh3cVZ4QlNkVkN4WE5JM1BkaVAz?=
 =?utf-8?B?c2xEY3M5SmJTaFhlbkk4U0xtWGFGN29ySU1JZVhMVWpZaHg5MWdzTVM1T0RC?=
 =?utf-8?B?c2ZUazRkbGxtU1g1MUFRb0dFUkVOL3ZvQm84MFE5NjJ5YnU5b29XQVVnU0xl?=
 =?utf-8?B?dzA3VnYzMG9tVEJZMTBRaFBtcThJN1JQNExuUlRqTk9Md09WZ3ptYm1qbGtK?=
 =?utf-8?B?azBGM3BRcklGb3E0UmZzNzBuc2dMQmVMdFpNVmY4MzNkc3pOYndVNSs3aFlq?=
 =?utf-8?B?NWQ5NFRBUlFWOGgrU2pjbDlrUjN5U2RaaXBWamNLdEl6d1FxNWs3UVNyMHk5?=
 =?utf-8?B?dDVQK1orOW9pc1ZLMURLdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFZDL1p0S05GRWJTOXpna0pVZEU3b1JYbmg0U0tZUkFEVk5zYWpWRHhBc2hQ?=
 =?utf-8?B?L1ZzaWVJZGgwbm5CeERrUVVjdkRrWU11cXJ1LzRvamhnTzlxbW1wcjVLcEli?=
 =?utf-8?B?REJGbGRpa2g0S1pWV05CMFVocndNK2dZQ3ErbXBHblViczByUW53UlRBeWox?=
 =?utf-8?B?bEQxYmdoVFkzRUJFRXJKQ2dmVERkVmtoOW95Sm1HYloxcGRlYzdqVFgwb3U4?=
 =?utf-8?B?bStjaUU4Ly9xcUMwcys2YnpPZHN1OFNPbytjdHhPdU5MWWF1T0R3Ymg5elZu?=
 =?utf-8?B?OFZudnBJZERySHo0dUN5b29CUm9xQm0xSFM0U2pPaSs2Mi8rckVQbVJwd0Rt?=
 =?utf-8?B?M0ljeDlmY2Rpd2F4QWExdHJKTzhNRXl5SkNBMktGdWtVR0VodytZdzVOakwv?=
 =?utf-8?B?N3NiQk52bEdNWFN2ZC8raWVnMmozeWtvcVptbktZSG5HWnVZWGJ5bVF5d0Va?=
 =?utf-8?B?Uzh4QmZXYjFvZXBMOWlxK3RXdk1CdHRBbFBRcUppaFRZOC9iSld6ODF6TWE3?=
 =?utf-8?B?bEFoWm5kdkRvZlBHZ1FyKy9TMC9OWGEvU2pJVnZaWHdtTHljNEt1R2QyS2FS?=
 =?utf-8?B?a1kvTjFPTjlrS2JLRTZSQnFjS2lGMXMzL3daZEN2TWJJeTlJZVoyanM2K3Jm?=
 =?utf-8?B?Q3BVL2FDT2xqY1gxWndodDFkVWxhSTlVR1hTNnp3NDJaeHN0b0oycUdDdlJ5?=
 =?utf-8?B?eDY5TkR2MjJ2UzlWVXlweTJZQUU1VUsyOUwvS0tPZlJidVlyRldXMFBBRVhK?=
 =?utf-8?B?NnZwdXA4c0R4dlBMeVhxTnJRWDE5QkhOb1ExSnpLeUI4ZFM5SFNYNFRKTnZS?=
 =?utf-8?B?VDJVa0svUjV6dFBwYnhoYTRQZHdCREdwTjk0UkI4TVhzclhKaS9IQ3FwSWhD?=
 =?utf-8?B?UkFtZ0xrMkF1cjVpTC9zNHhKa01PS1pUd0tZWUFtamhXTWp5TG9GTUtya3VZ?=
 =?utf-8?B?WjVBQnI2OW5RWGlLT1BWQXUyTXNHNmhmU3BhanBTaWVVTXFCNFZlbVlmdlcy?=
 =?utf-8?B?R28zUFIxNzhxdFFpUkxVRnh2aGcrN0d2RWV6VU92Qll1dUtGZWRiZThaMDhs?=
 =?utf-8?B?d293MUtRZEMvczFIOExSaGh0RFdNVm5rdDd4VGl6aFZZMnFYRzZwMi94MVVt?=
 =?utf-8?B?em1JZUlKNkFxVHQ4L0VzNG9rR3BuWU1GUHFXTXlwaTRMdXBVOFVBUyt1b0Nw?=
 =?utf-8?B?UEtOcGROakV1d3J2SVpGN09sdFJrN0FpbFdYem5lQlo0Nmo1Yit4VUZiaDhV?=
 =?utf-8?B?UXRYRUt4UEJWTXpWM0pZZUgrSElDcmVUMEw5Z2dmTTNZRENHaWNianFFeGhq?=
 =?utf-8?B?cmRqTGNCWEtSdFNoMzRaQlZEMzJQeEFSYjZYbVQ0NGlaWTAzR2ZTa1A5MWE0?=
 =?utf-8?B?SDJTTnQ4TndxMlFKSEZYY3QwMFcrcVRlVmxlbmErbStiQkd4WUNxYzBOenI3?=
 =?utf-8?B?ZU9OM1Bwd2l5clZnQm9UL0JOb1Q5LzN4NXJvSmVRNWI1cm82N1JZOFFZdHR4?=
 =?utf-8?B?VE9TbnNKczk3eWY1RldRNUFqK21uQVdQNmN5dVVqUEs3RzBzS3R0S2JxYW1a?=
 =?utf-8?B?cUczWEpGVGcrQ3FuNk9MOXErV1l3RG0xZHYvREFkOE1xYnE2dldUWHlHbmEx?=
 =?utf-8?B?NEFGc3JZaHhtY2JSZkxhRGVvZjJvQVJUWFBidStYNVFDVFltU25OSERvTEFJ?=
 =?utf-8?B?WWVjUExkL25OcGhGNFVBdVExc0RxRTJ3QXpmVlc0c2FXS05pamhzNzBjSVJp?=
 =?utf-8?B?WEVORHV4cWs2WllKVndwS0NNTUNTZDRtMVRCMXZGZnQrUkZObTF1WlZuellF?=
 =?utf-8?B?aVdMWnNzTmd2aklZdmo2cXBwK3phWUVUTWpieEUveCtjQ204SXc1ZnhDdzly?=
 =?utf-8?B?Vjd3L2w0SVVsYU00UGRGQTNKc1ZhMEdJajF0Z1Q4UzZweE1FRkROdVF1NGdh?=
 =?utf-8?B?aTc0MlZpMnhDTUNHcnNLVXRORDlJNlFsb2dBVWR5VGYrbE4vYXl2VHRHS0Fa?=
 =?utf-8?B?UW5yOXkwUURNenlsb2xjUG5JVVl5djFlcndyeDdhblFVcGJUMzkxQ053VGt0?=
 =?utf-8?B?UFYydGhBTlZiNFI0UXRPMVM2cHk4blNJbGFkUUxndnVnM1Bqa0tocnBrdHZM?=
 =?utf-8?Q?FjMQv6JEUoTuw/rVzsPY51NY+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa5370f1-e2a3-4232-018a-08dd185a3974
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 14:03:14.8090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b/n/xJ1clicue9TuvFS8a+nOzo2JHrPtxaOdJe9IZYgpCNX1bvddHEPjsnvcRGrY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4049
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

Am 09.12.24 um 14:33 schrieb Mika Kuoppala:
> From: Andrzej Hajda <andrzej.hajda@intel.com>
>
> Debugger needs to read/write program's vmas including userptr_vma.
> Since hmm_range_fault is used to pin userptr vmas, it is possible
> to map those vmas from debugger context.

Oh, this implementation is extremely questionable as well. Adding the 
LKML and the MM list as well.

First of all hmm_range_fault() does *not* pin anything!

In other words you don't have a page reference when the function 
returns, but rather just a sequence number you can check for modifications.

> v2: pin pages vs notifier, move to vm.c (Matthew)
> v3: - iterate over system pages instead of DMA, fixes iommu enabled
>      - s/xe_uvma_access/xe_vm_uvma_access/ (Matt)
>
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com> #v1
> ---
>   drivers/gpu/drm/xe/xe_eudebug.c |  3 ++-
>   drivers/gpu/drm/xe/xe_vm.c      | 47 +++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_vm.h      |  3 +++
>   3 files changed, 52 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
> index 9d87df75348b..e5949e4dcad8 100644
> --- a/drivers/gpu/drm/xe/xe_eudebug.c
> +++ b/drivers/gpu/drm/xe/xe_eudebug.c
> @@ -3076,7 +3076,8 @@ static int xe_eudebug_vma_access(struct xe_vma *vma, u64 offset_in_vma,
>   		return ret;
>   	}
>   
> -	return -EINVAL;
> +	return xe_vm_userptr_access(to_userptr_vma(vma), offset_in_vma,
> +				    buf, bytes, write);
>   }
>   
>   static int xe_eudebug_vm_access(struct xe_vm *vm, u64 offset,
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 0f17bc8b627b..224ff9e16941 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3414,3 +3414,50 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
>   	}
>   	kvfree(snap);
>   }
> +
> +int xe_vm_userptr_access(struct xe_userptr_vma *uvma, u64 offset,
> +			 void *buf, u64 len, bool write)
> +{
> +	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
> +	struct xe_userptr *up = &uvma->userptr;
> +	struct xe_res_cursor cur = {};
> +	int cur_len, ret = 0;
> +
> +	while (true) {
> +		down_read(&vm->userptr.notifier_lock);
> +		if (!xe_vma_userptr_check_repin(uvma))
> +			break;
> +
> +		spin_lock(&vm->userptr.invalidated_lock);
> +		list_del_init(&uvma->userptr.invalidate_link);
> +		spin_unlock(&vm->userptr.invalidated_lock);
> +
> +		up_read(&vm->userptr.notifier_lock);
> +		ret = xe_vma_userptr_pin_pages(uvma);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (!up->sg) {
> +		ret = -EINVAL;
> +		goto out_unlock_notifier;
> +	}
> +
> +	for (xe_res_first_sg_system(up->sg, offset, len, &cur); cur.remaining;
> +	     xe_res_next(&cur, cur_len)) {
> +		void *ptr = kmap_local_page(sg_page(cur.sgl)) + cur.start;

The interface basically creates a side channel to access userptrs in the 
way an userspace application would do without actually going through 
userspace.

That is generally not something a device driver should ever do as far as 
I can see.

> +
> +		cur_len = min(cur.size, cur.remaining);
> +		if (write)
> +			memcpy(ptr, buf, cur_len);
> +		else
> +			memcpy(buf, ptr, cur_len);
> +		kunmap_local(ptr);
> +		buf += cur_len;
> +	}
> +	ret = len;
> +
> +out_unlock_notifier:
> +	up_read(&vm->userptr.notifier_lock);

I just strongly hope that this will prevent the mapping from changing.

Regards,
Christian.

> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 23adb7442881..372ad40ad67f 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -280,3 +280,6 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm);
>   void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap);
>   void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p);
>   void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
> +
> +int xe_vm_userptr_access(struct xe_userptr_vma *uvma, u64 offset,
> +			 void *buf, u64 len, bool write);

