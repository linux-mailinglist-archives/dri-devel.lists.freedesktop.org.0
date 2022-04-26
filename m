Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B97351062B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 20:01:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5760510ED54;
	Tue, 26 Apr 2022 18:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E149410ED2D;
 Tue, 26 Apr 2022 18:01:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fYhiKPb/N4CxltojlrVpfG3uZi8gfitHMN00MKK/h7FYueMT7IGoHq3j5av3SV01gLR0/qLVG8I994dob13nLKYdAA9Od1GWZtizme9Q6EGsdTczwX09W6W9sby24WW5Jev57EmMHZBwQZE1Ct8VbY3bR4r3P7cguFReO/HOUjYqmufsYlXzmdqU1Wz6JQCUat/Pv+LCTkUOuPtUdOdPqq/hQsp/FkKepnLsmz53SI/gvZq8VSzD3et6hzyw0fGDmFNhgL6xzc36lPZqsscsQH6AvQKLLX9+Id21p8ElkXZxzfW15HVFL1w6fupvbrIMza3c/YHkdAKVGBtWC+SXdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LdNGRdEf7ZtftOEHc+h5HABoEcvEwxWEO2HnQq41D1c=;
 b=INgHpZ/cjrw/2qs0gaxkZYbwlhB/jzSXTMtn1BsrEYCCt+kWsumVtJBQLp7GTWfodBrS1OEBkISxGN/QxfCzegRTgi56+dbrHOUZp3KempqM0poGBgkAEk5LbA1MYIf7sh5bT3/EZa5GvY7zIakZPfI3BhyplBlOzmNeyjf9MCUkAKThcCbAzJ88Grg4EA7rUpGTKShqGUjVuVjK1bLLcY0EN+3H2PNfv0JmWzLEUwMEmGQz7ER8K6p28fmk5mJYdrOweGwSlnj/FMgOI2BWRGkYAUF4depVek1ys6bcBBT4EuUEzW8wW050CgBr/x7AA/wqogR4hthnrvWZ4iV8Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LdNGRdEf7ZtftOEHc+h5HABoEcvEwxWEO2HnQq41D1c=;
 b=TscK2ErXYw4Aio1+2s+lfAEPM/VY8xE1SogYeygrgOukrogbNRmULMi3Qf/hNcc9iXln2U/FMhTj5Pxg4saWIT7QzwrqmUFx0+iSZLrPV1TNysahi9Tl8DP+CEf+3psmFm/E+BEj932ExAzL2cT1pVSPOWRsBh0aMKDD0ocblYg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM4PR12MB5985.namprd12.prod.outlook.com (2603:10b6:8:68::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Tue, 26 Apr
 2022 18:01:47 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::6070:7681:db0e:7702]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::6070:7681:db0e:7702%9]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 18:01:47 +0000
Message-ID: <14268d5a-9a4a-2921-9961-d5d36fad47b2@amd.com>
Date: Tue, 26 Apr 2022 14:01:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] drm/amdkfd: Use bitmap_zalloc() when applicable
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <f12820f6c5fca9b10ac8f82b3689c50ccb6966aa.1638117878.git.christophe.jaillet@wanadoo.fr>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <f12820f6c5fca9b10ac8f82b3689c50ccb6966aa.1638117878.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0138.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::17) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41967673-0f1d-4a16-28dd-08da27aed463
X-MS-TrafficTypeDiagnostic: DM4PR12MB5985:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB59858C4D1A5F98C63AC4B16392FB9@DM4PR12MB5985.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3nZhHBjX8B8MfqjF6ThHHsD365vQndOzjD6ewqvOMly5fYvHrfe7RRq8fScvy8ffS8c28vJMk/kIE5QOt4k0oX58qfbqOKy8sijO3mQjY2pzXceyZPfGIKtzHHPGAfySpY+J2/doQ83xMo7x8dFPObMUqhjxjSaBxHnrNDpCVZx6BXc/RbTlLCsDBm/LcRgGUSzhEAYPRdh9VLyJHSuY9Jm+Kw06ErID9Z09OaC1BbiJjUKGUG0P9cyaBHk5fiPcZHUgONiYK1F5fE4ATVDF77SXyia4q4lE/JLRlZjyqvYnZg4FiuDiZysuKbqwGSxVWSJh7LGt4JNJBl4KmL4kBFX1ntyldT7A0nvBGconjEjhW7MAyEg3NwS2zzoW5gzjjSNO5kaupxGabfVrGejf61kxMsGmUUJeXgxYttUjryOaKu8HNU9lfEA9loKtynL5/5ZEyn4NeHz30+2gNYR2Dkz6MMkbDvExYuB3HCfpAhmlvI1WcY1nvnixc7nxuEc3VYQb4qbEp8Xfup0ZGKfPdNc4YOil0awadYXxl4bqje7ksF97truSGlNEHBHBltHxfyMoDa+h1wXKBsd7k5FKS3nlGV7Ei3KcGziCghNOPnogumKnYhPycE0EaoZa7Q80lYJbHUlR5DO6IqWwADQ1P5BlfTsr0PFRWAEf8oYMp4Bxpux0SRLeFNwM+a8YdsqHA8jnSIn5RfmiDG6OuR6Il/y+AjmQLNAis36j5XRLqxPOz7y3a89FFLhHxMrsSL8/cH9usZiJbRPrhm77dc3PxjAMWja9crrjWpKxufw+eOo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(8936002)(31686004)(36756003)(6506007)(6512007)(26005)(508600001)(6486002)(44832011)(4001150100001)(66556008)(66476007)(8676002)(83380400001)(86362001)(66946007)(31696002)(2616005)(186003)(316002)(2906002)(38100700002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkttMEJkRkcrcHY5TGlLODVNY1NBUm1OditQVyszU280a0hOek1zVUpYR1Qv?=
 =?utf-8?B?eWkxa0kvYTNUUFRHZEtadTdhbFdJTUU5dWdicWc1ZU5yMHBnUkNGODd1S1Ez?=
 =?utf-8?B?R3RDc2NnNUF4S0txbDB5N0ZENzJ2ZFAzSE9JdUk1K2ZyU1pDM3kwRW5YWlo3?=
 =?utf-8?B?TlhDOTVXL1B0SzlxTlp4K293Tkp4TlpJVjBTVW9FZmNiTWQ4dVFseFhnZzZM?=
 =?utf-8?B?ODc2MXl3MEI1cnZrZ1FIVHNoNW41ZWFNb1RML1hYa29Ha2xPZDJ6Tk5SV1ZX?=
 =?utf-8?B?R1laL0JLN091SmlZRm1XQUJIZmwwSHhFMkpFUXZ0OUI2MjZXcEZuL2Znblho?=
 =?utf-8?B?WExTTjlrdHhKOThQeGRVdVc1R2V1dVpXbnZLanVtSDB6cUlCSndxbU90R2t3?=
 =?utf-8?B?UlpPOWdOemQrTDJ4ZFRBVExxRUVYUlN0YWpqTWJ6cDUwcFQ0WUtxVVJ4ajAv?=
 =?utf-8?B?MzllbVFXcmVNZHBaaXNSQ080ek96dlV4WnFBdm1UbGYwaFdvY0xIR0RaRzhJ?=
 =?utf-8?B?aTVieTlCSm1yRzNxRjY3bE90THVCeFo4YnVNcWhIYjdTWUdiSWtKd29qejBu?=
 =?utf-8?B?TmpBTGZoVGN6a1RtRTk4RnpiUXhLL01FWllSUzdza0M1a2kyTzNoU1JHdVhD?=
 =?utf-8?B?bkNPWjUxR0ZLMWJTMkd3ZUNsTjNLOURPdEV2TlQwVmRiSTBLeUZwdTF4azF6?=
 =?utf-8?B?N1kzVjVwNFd6KzExUCs5bU9PM2txemwycFlXeFhtUjFpY0lhbk1lNWtHN0o2?=
 =?utf-8?B?STJLVktrYzJNKzB6N1BEZEFmNTJHZ1VCZENHeFlOeDJ1eElzdUtaYmdGRVZ3?=
 =?utf-8?B?cXRHQ2UzU0ZzdmJaNXRDcExaZmJFSzE1YlVzMFYwQnhQejQrT1lzYmFiVzRR?=
 =?utf-8?B?ZWNpV0pFZEordWFTQ3IyOHBhQlphR0VtcUkrczkzSExyeFF1dkthQVZCL0VM?=
 =?utf-8?B?TTJJWTJHU3NVN3ZKRFVqbVo2L0hTSmhRTnhCbGplNkNGMlJZK2ROQlB0dk1j?=
 =?utf-8?B?NHpOV1lCcFN2dWt3UUxXcGg1MmJDQUJ5dFpBZy9zbVdCTTBNSzdkSVJIOUNG?=
 =?utf-8?B?bEthLzExVlJ6bm01QUd3dUJndzQxYUIzeFJvTmlad3JzUE5PQ0Fpd0hnL1Fu?=
 =?utf-8?B?UE9aR1Ziajdlb0NOcHpWOHkrRXpxUmxsMmhuV1EwZ0FQdlN4Z3FMbTNUcEVM?=
 =?utf-8?B?TE5RTUJYRlRmOFVwa2x5ZHJ5UXdUbitkS2VsRDZtcUNzQ0ZQY0VRbmM3RUJ4?=
 =?utf-8?B?ZHB2NndLdU8vREZ1YUhlQmlnQnpnVWk2NGNZL0tETEcyU054d3pGc2haSE56?=
 =?utf-8?B?VjhLUURTOFlKVWtPdytRSEhUaHFXZDVHWlVFRHdjalowek5Mb1JYd1k0VTlV?=
 =?utf-8?B?OG5rYy9iaW9mZ3I5OWZBdWQ1MTZKb3RsekZEelRJeVlUNXk0NHJGdWR1MWcr?=
 =?utf-8?B?eEV5SHloTlN1Y1dvSDVOV004MWFZVjNhTE9WUEkvSStsd2EycC9mcXJrcjFo?=
 =?utf-8?B?bS84ZzFFN3czWndlZEFYb0s0WEJ3ZHQvdzlIOWRHL1NPSDE0eVdjMUJidWlN?=
 =?utf-8?B?TVFkdXVacTJxa3NNRWtuTkJCOXZYQmlkSmFlQVl3Q2M1cUk0UU9Ga3RBSWQ3?=
 =?utf-8?B?akVJNGxjV0RZS3hpVTFPS0FZMHYvOW1kdGlXUUU5QzFWQnBiRTFLS2dFd1l3?=
 =?utf-8?B?NlVnWENadHZsOEw3ZzVuT1pGdFBxTVlEK3VJVGxjM3E3SXAxa3F0cGNvekhw?=
 =?utf-8?B?UGxVWmphMEwyemZHcW5iWG9LWWpMQ0RESWk5SWhBMmJseGlVLzJlU1JDTDVT?=
 =?utf-8?B?YkVqSmU3bHlsbnBoZWp6VzRVYWphYkhXRGpWRlVXK09vTG1uMWpGTzBZL3or?=
 =?utf-8?B?MGZSNjJWd2hnY1pheUtsN2VZaXVpUEJPYVhyYmhUTURYaEF6K1Uvamk1RWdG?=
 =?utf-8?B?MG13ZFF0N044THdkd3g1c2Q3TVQvNFVTb1dYYlJXYUtOVHNudXRlVSs1SzNS?=
 =?utf-8?B?c3ZmYkh1YUZNNFFGbXBZdjVVZXVyTE5wQllIOTJ0bUxVOCtyZnZvVU9xQVVS?=
 =?utf-8?B?bHlPMjNnSU4yTXZSZGFRYjRCelJZYzJYY3Zlb2hQTlJjcDFiejdwblE0NGlH?=
 =?utf-8?B?Sk1RN090eXVzeWwvWWppT0drd3pWNlczZ1lvMWlZa1J4Y05vaUh5TnVkNTRD?=
 =?utf-8?B?elNOM1pleVpZOGVscEtkazBWUE51U3lSTURGdTFucHc4Z05la3U4TCtiSnVx?=
 =?utf-8?B?ckU1N2RxT3Y2ZklyK0NJR1NnYVlzWm0vMmI1bmUxZXdZZTdySllaaGRtU1lG?=
 =?utf-8?B?N0N6cVVOMUtmbjNzeDBoS1puSitBdTduRW9Bckp6WUI3TFl1ZVRQQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41967673-0f1d-4a16-28dd-08da27aed463
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 18:01:47.0700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ev+qUlpRzGclbdcPXS0LySdevGNavfp1juETA1daVSI3bRAXaRYE/oozMQPyO1Me5/awh21J/7nR2LXV4SFawQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5985
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
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christophe,

I just stumbled over this patch series while cleaning up my inbox. Sorry 
for dropping it back in November. I'm about to apply it but I noticed 
that patch 1 is missing a Signed-off-by. Is it OK to add that in your name?

Thanks,
   Felix


Am 2021-11-28 um 11:45 schrieb Christophe JAILLET:
> 'kfd->gtt_sa_bitmap' is a bitmap. So use 'bitmap_zalloc()' to simplify
> code, improve the semantic and avoid some open-coded arithmetic in
> allocator arguments.
>
> Also change the corresponding 'kfree()' into 'bitmap_free()' to keep
> consistency.
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_device.c | 12 +++---------
>   1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
> index e1294fba0c26..c5a0ce44a295 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
> @@ -1252,8 +1252,6 @@ int kgd2kfd_schedule_evict_and_restore_process(struct mm_struct *mm,
>   static int kfd_gtt_sa_init(struct kfd_dev *kfd, unsigned int buf_size,
>   				unsigned int chunk_size)
>   {
> -	unsigned int num_of_longs;
> -
>   	if (WARN_ON(buf_size < chunk_size))
>   		return -EINVAL;
>   	if (WARN_ON(buf_size == 0))
> @@ -1264,11 +1262,8 @@ static int kfd_gtt_sa_init(struct kfd_dev *kfd, unsigned int buf_size,
>   	kfd->gtt_sa_chunk_size = chunk_size;
>   	kfd->gtt_sa_num_of_chunks = buf_size / chunk_size;
>   
> -	num_of_longs = (kfd->gtt_sa_num_of_chunks + BITS_PER_LONG - 1) /
> -		BITS_PER_LONG;
> -
> -	kfd->gtt_sa_bitmap = kcalloc(num_of_longs, sizeof(long), GFP_KERNEL);
> -
> +	kfd->gtt_sa_bitmap = bitmap_zalloc(kfd->gtt_sa_num_of_chunks,
> +					   GFP_KERNEL);
>   	if (!kfd->gtt_sa_bitmap)
>   		return -ENOMEM;
>   
> @@ -1278,13 +1273,12 @@ static int kfd_gtt_sa_init(struct kfd_dev *kfd, unsigned int buf_size,
>   	mutex_init(&kfd->gtt_sa_lock);
>   
>   	return 0;
> -
>   }
>   
>   static void kfd_gtt_sa_fini(struct kfd_dev *kfd)
>   {
>   	mutex_destroy(&kfd->gtt_sa_lock);
> -	kfree(kfd->gtt_sa_bitmap);
> +	bitmap_free(kfd->gtt_sa_bitmap);
>   }
>   
>   static inline uint64_t kfd_gtt_sa_calc_gpu_addr(uint64_t start_addr,
