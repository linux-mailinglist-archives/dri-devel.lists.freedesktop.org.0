Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C137B81FF
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 16:16:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB9310E388;
	Wed,  4 Oct 2023 14:16:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2041.outbound.protection.outlook.com [40.107.92.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C0310E387;
 Wed,  4 Oct 2023 14:16:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fVDv6xlqSfrJAP6BTbgirwpawL0xesglx5jp3anzc3XXS9ike5HljzBOZ9g5Xg9vJIailaRMhWgN/bibpY5SYgtUEAKZXlKfZX7nz0oAoxO1KkpE4ZfkOovlOCec1/C/N98clb+jXJBKD7dJxUkMk4Xiesneh2ybpf8gQDGW+NhFE+CQEj7E11MyT3rwjb4XDsHBEhJqFhcmd4HJfBQUPzq2N5LZvLPDXgXaxQFo9NC/Xp7G5SnNIo9dj5AYQ9fTRa79nuOFFLvt8jTuqV4GpGsv5m27RWEV1fxGmGhwVVp+P5ASEdK996NHaKnON8qTAHafn1Sf/T81MZ6JT0ZXiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/dal9xWaFEcatlaxNBRjf8ZViAfL7r+jpBt+JFxTaZI=;
 b=aR/Tzes5bJsNsR/PMCt9kH6jnl2Z2OFgO5HSVUEz4R13g/sVB06xqI/Hq3UAOhP9NMeOOacyxix2fyFN7X8cZb+a9ObXnmMfKaPY6htAZ+9ptjLTlvtMCpOebjK6FmWFLEnY+e6uOPtt/5q/RXZd37zwlh0LwyR2gLq/AfVwmbhpgzhTZmlgvt4YdUBPCdpdAs0CIccGbdB9xSyItGOj7QdciQv6bWZp0dzwrsLLwDFF/5A4TAV8dpoVXpsYh0GrK44+x4QhbMa3MavlvHrhm7Kdo2/dS3zTiLpJaf1Mby02U1cxlJkv2jU/q9ovrSnKA+zIade+pU6P1hwvPfna6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/dal9xWaFEcatlaxNBRjf8ZViAfL7r+jpBt+JFxTaZI=;
 b=WBHeEM1Yn6BS6+NSLlJaMgaddCR5mPkyWngAMUX24DYyZ0B6U3RenWoWM2ps+Mz+u+8ERY/lORr6nTcqb6okHvhEflMpwgxGggM1eQjuD1yz/EdDBByKsJvwtIG801anCUQW9gEE0DK/AAVOtSvmMPcoWh601YuAfgqLRUQEGKU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB7163.namprd12.prod.outlook.com (2603:10b6:510:202::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.35; Wed, 4 Oct
 2023 14:16:20 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d%4]) with mapi id 15.20.6838.027; Wed, 4 Oct 2023
 14:16:20 +0000
Message-ID: <d69ec998-b540-46b3-bc0c-9030ddebfef2@amd.com>
Date: Wed, 4 Oct 2023 16:16:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: Deny copy-on-writes mmaps
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
References: <20231003230332.513051-1-andi.shyti@linux.intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20231003230332.513051-1-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH7PR12MB7163:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f3f0177-4566-46d0-087c-08dbc4e47b1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oS7+day9kYsFoQVXvvTD8Tj+57/sleV9u894e029Fc1R5FlnhHREe46p155agS5bynlF1YUVx/EAWafIMrHWvRjqnSJjNsqO6OcCQBGYsHfWJy00ZvgFTicaZGUAgqsQPtUGZrQoPb67EZHXGliOGcK//9UCtGmL/6d7nIOnWCAC+Q0S/+lIUo85AY0rpAsAQtjesWT89m6R07tifeMqXBujd/6J0fC9Fu7MPEhldoGVH8jm4oAgZg1R95MvTWh6GCJM/d+yndpXXr0bYUO4jelVzlDXYmlx3Hz57hiEybWR44r0g5I7UueDMcJO5FqTefmxrv96HaV4BZ7sUNnNruicsawWH/GcKgeh+WkYHC+AvTLaFkNFMJ5o9yyY9D+TmV0ofDSKUUsGOezB96kFaE1HMYIxGTuycYTkOm84DYUfw5ReRM0QmDlmwUHaXghCfFkP0F0AYhRqIDYFHedcbmBqddU6ttwnvndhQl7lLYhTv2y1PfA02bUqxIgwdqMBUzKlEUYV3kFWgCfyJ7V+3AlxQs1tAgNIdam1j616Df5Xn2VVOKsr5jbHPP0y9Y5RKKxBsxgYPoNYyVhy6piwmPnVgIxcmegOJoZDiAU/dPd8ZsmLB+/cP8PDmzSCitfw8WCaIuRjH5R00WoCroIeRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(39860400002)(346002)(136003)(366004)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(6512007)(6486002)(6506007)(6666004)(478600001)(83380400001)(26005)(2616005)(2906002)(316002)(54906003)(110136005)(8936002)(8676002)(66476007)(66556008)(66946007)(4326008)(5660300002)(41300700001)(36756003)(38100700002)(86362001)(31696002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bm5pRHJGbTJkdGZYaENhV2o5aVVsQmFINXpWOFdtR2pBRWNDMUZnWG9uUFNT?=
 =?utf-8?B?anBoNkMybXoySzFHUUx6UXQ4ZGJIWGxVaDM3T1RhMDNKRkJPZGZMNEFXNVRE?=
 =?utf-8?B?eFQ2RnNnVHpLRk1kSUIvWEpSTW41SWk2cUp4Z1c4c2NOUTUxZWNocWtkOVhh?=
 =?utf-8?B?aThIQWZROXl6cXlaZnQ2MWtDZm9ueC9rcUJFK1lIaDYvanpZZG02ems5YWU4?=
 =?utf-8?B?d1Ewd09jVjErMG96WUtxb3FETVhHRkFSbkFvNFRpNjN5SEViM3lnQ0s5bVlq?=
 =?utf-8?B?REE4eUlJNmg2akw3dG00d2JaTmI1WWFCSmJGajVxL2RGR2RUNldrRXhMU3dx?=
 =?utf-8?B?Yys2Q3pLdzhpbGZ4VWxtUHQ3S3lUSHJib3dRVzRxRFNBK0JyK2VUQjl6b3BH?=
 =?utf-8?B?Uk45VFRET3RrYXJMNjNxc1Z2WFZQU0wrcGYrdCtISXdiVE8yempHRHhEK1hm?=
 =?utf-8?B?RjRLYjdULzRWMVlpcTljVDBLWkpzNndBakNnbDRaVHZPa01rSTVncTlDU3JF?=
 =?utf-8?B?RTVXbGg2cHFTRFZ4TzZmSXo3eDJ0enBtMEpQbGlEM2pveTZySzM2c2MybWtq?=
 =?utf-8?B?ZHFuVFRFM2ovZXhyWEgrUkVqQU1FaDdXSXVWNWJRdXk0T3o4VlNNWW4zOVB5?=
 =?utf-8?B?T0tKL3Q4OFlzdk5qem8ybU1tc1NSelZ1RVU2YlU5N3RtMndFb0N3VHZlZFFr?=
 =?utf-8?B?QVI3eHBXWTZjMGZaK0FIVlpyZzhOdnkwKzVIZmVHTE1jOFZrNmVvdG01OXpw?=
 =?utf-8?B?Y1ZDTXNlSFNJQk5CRzlDbG1PNzBNRnhCSkRldDQ4WUF4WWRRZFNLalVwZDhX?=
 =?utf-8?B?K3RsSWt3WnBhNUtwR2libU00Yjc0L1VUYkxDMXNBVHdOUlZYaDdraWg4ejhS?=
 =?utf-8?B?TERnemQ5S0lITUVOaG5aZ2V2MzR5R0RDb2NqeTdaVllGTVRCOGJiR2MzODM0?=
 =?utf-8?B?dE96MWFHSVBQdlk1MVUrOWpIcjVveS9NZXFqOGtQN1A0clFUdGUwWDVWYzJF?=
 =?utf-8?B?N0VXWFlCWG5QVWwyRWtVb2xzSUZjUHdiOERoZUJNRERoMytTdG5aYS8yeVMv?=
 =?utf-8?B?ZW5XQkRwUGR6SmxlaU8ya0xUZXJkQkhkZ3FhaGJ1RG5ydEJXTE5HV3VNNGQ5?=
 =?utf-8?B?UEhzUHU5TkVMdFd2SEJ2S3JDbWRGQWgwbTh1NTBQMUJpOVVFb1ZlbStRQ3VJ?=
 =?utf-8?B?cUl4WVBuYkhid0lsUGd2dUZNeHNlaWFCaG9pdTFCMC8vSnJjY0Znek82TzRu?=
 =?utf-8?B?czhHdW5ndlFTelRsYXZpNW1vamV3NURGMnJEaVA5ejcxQm1ianV0WEpWU29h?=
 =?utf-8?B?b3JPWDY5dHpPeTExOHN6NlRTM3YwWVJDdVdXUjc5cWNLU1JPMnJ1bVZTVUpG?=
 =?utf-8?B?NU1jNjVTc1Q5eG1sSmVpTTk3WlNMTFNycnVVMXRDaWd6QVpweFc3cVYvNkM4?=
 =?utf-8?B?UTFZSGM5N3pwbXNUWkpzZlkwRy82YmNqMmZaaE5HY1ZoR1dCeEJSbG02YkQz?=
 =?utf-8?B?SDhwYnRNQnF4aVZiYWlQYktsd2ZIbUszMWxSQlpBSDV2NWRuK2JQcTc4SmlL?=
 =?utf-8?B?WmFIWGpNUXlZZWRkVk5TNmJlMndObzl6NUZLN21YTDBZajQ1ZERaUjZYLyt3?=
 =?utf-8?B?ZnZ5L1NXZXN5NFArQUttbUtZWHFqVWRtQ1NjclA4V1hhUEMvRW1qUHJaYVQ1?=
 =?utf-8?B?WVZ6SXNHZE1UY3M5Y29ORXlOSWFsTnk0NmJOWUpuTzF1VUppb1NEeTFGQnpL?=
 =?utf-8?B?L0Z5ZU5RQWRONU9OdU5SMmYwbEQwd1loVzhwc1g1eVR3cVpkMEdSY3UvblpJ?=
 =?utf-8?B?Qk9qK2xHS0hxUlhWMjc1eUZ4bFVOK045dk9UaU1YaUh4TWFvWnJOMjdBU1Ry?=
 =?utf-8?B?Yk5qdG9BTUw2V2UzYnJSeGdoOFZGTUlVclBIUXpVeUR5MVlVN280WFFCdDU1?=
 =?utf-8?B?cXFDc3c0N0JUQXMxb2NmSHJ1Y2ExWUxuUzY1bVBkK2FVK3NvQy9Nb1pzZUZX?=
 =?utf-8?B?dWg0YkxraFMwbXA1UmcxdVlVTUlOLzBDUFcyK2I2b25xQW9IcTM4alhsRi9z?=
 =?utf-8?B?WXkvdUhZNExwejBUQ3g3NXRSbk00ZUF6L0VlS2xCK24zMkNwdGdtRkx6L0RR?=
 =?utf-8?Q?3eMGWm2/y0dDvuk8ejuZ8W74F?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f3f0177-4566-46d0-087c-08dbc4e47b1e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 14:16:20.2220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HpX5jNr5bdjNBfVEhmUsshlHNeAjOYeHL05JYb3135aKmUrnGxisvfIOGYcB9LfO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7163
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.10.23 um 01:03 schrieb Andi Shyti:
> From: Chris Wilson <chris.p.wilson@linux.intel.com>
>
> Enforce that an mmap of a dmabuf is always using MAP_SHARED so that all
> access (both read and writes) using the device memory and not a local
> copy-on-write page in system memory.

As much as I would like to do this I fear that this won't work.

First of all interesting approach to do this in .get_unmapped_area. The 
standard handling is to have the check like "if 
(is_cow_mapping(vma->vm_flags)) return -EINVAL;", see TTM for example.

Then IIRC we already tried this and had to revert it because it breaks 
the UAPI. Some broken applications actually use shared mappings (but not 
really cow) and we would like to keep them working.

Regards,
Christian.

>
> Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>   drivers/dma-buf/dma-buf.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 21916bba77d5..1ec297241842 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -25,6 +25,7 @@
>   #include <linux/poll.h>
>   #include <linux/dma-resv.h>
>   #include <linux/mm.h>
> +#include <linux/mman.h>
>   #include <linux/mount.h>
>   #include <linux/pseudo_fs.h>
>   
> @@ -128,6 +129,19 @@ static struct file_system_type dma_buf_fs_type = {
>   	.kill_sb = kill_anon_super,
>   };
>   
> +static unsigned long
> +dma_buf_get_unmapped_area(struct file *file,
> +			  unsigned long addr,
> +			  unsigned long len,
> +			  unsigned long pgoff,
> +			  unsigned long flags)
> +{
> +	if ((flags & MAP_TYPE) == MAP_PRIVATE)
> +		return -EINVAL;
> +
> +	return current->mm->get_unmapped_area(file, addr, len, pgoff, flags);
> +}
> +
>   static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
>   {
>   	struct dma_buf *dmabuf;
> @@ -508,6 +522,7 @@ static void dma_buf_show_fdinfo(struct seq_file *m, struct file *file)
>   
>   static const struct file_operations dma_buf_fops = {
>   	.release	= dma_buf_file_release,
> +	.get_unmapped_area = dma_buf_get_unmapped_area,
>   	.mmap		= dma_buf_mmap_internal,
>   	.llseek		= dma_buf_llseek,
>   	.poll		= dma_buf_poll,

