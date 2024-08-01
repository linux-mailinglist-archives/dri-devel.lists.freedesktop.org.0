Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F5E9449D5
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 12:56:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8388910E903;
	Thu,  1 Aug 2024 10:56:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gLXunA1U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2070.outbound.protection.outlook.com [40.107.95.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7383C10E907
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 10:56:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CUmYD2KD2114ATCgwEZz7iwA9vD8c3s/8UVQc/mxeEP1/l2VBMT/YKA6EbyB7t+1ruzsazkFgfmeu8OxjWpWrLNUDZfAz3SnA+ekYV9WeuNNOpmSzf7Z4WgWtBy7f3VFnAwBxRAFD7IK1MqgI4YIBdzSX3Kbe4OmRhRXPX2JICn+b1CG1rgtTPJw696DN8kiJLHA3inrk3gtDZ4PXGmnnuM2YV/zsa/i8aGURpPhrDGaYAhG55dKBCyK/C5cTmPadlibQjZa3TjIjUsUqbUmsDwJI7e7ceZGteMLCS5t7dKPqzByP4So31+nhpFp9X2ih+C/JIdd+SuFRr4Eei4fBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lOWd3ffQOtezgxWdZWQebReRxDCzVCwiPLeEJx/ReQI=;
 b=R4s45cvCGcFjhlrc8sh9tnNKWs3jQ/eyqL2kLoW70X0RO48T2Qx8WWegzKf2ciS8NKzEgakLXXBUNvjE9B9MX48x4HWMm1dKrXw2MMT2OtxB5Z1GgVHUj1716Tv7EPKYitKhPZ9UOdAjsWFWDJ70NXcGPEdwYgHYLyfEnX/CsiKelhci0tl+UArevxionxrfDIP0WiYuTd6JvMleV8B6AgbymRXk0MGoGjhhlFZ63q1EfQ/H4JIIraLuwVe9kbz7QWpPmZfR7iBdxxD2K2PNxCDrlltYlBk20cGTL2F0jSFI/hZEl5LdGYhTVJAmYAuMsooWfMMtjDJq+Y92zFUn6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lOWd3ffQOtezgxWdZWQebReRxDCzVCwiPLeEJx/ReQI=;
 b=gLXunA1Ul4FG8E9++osxvRhVFiiypldBq2Z9eANdLwuiefqIOP5F4qaQyZT1jeyCw5cuGgiR6vxv6ghyVwH23jE0PaOS6hrnlQo9NB4Et20sD2+iBNMLwWOJLnG1IcmMvTYL5gE6RA6vcGut7H5gghupQGBfKA6LLORGzjGsV8A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB7028.namprd12.prod.outlook.com (2603:10b6:510:1bf::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Thu, 1 Aug
 2024 10:56:36 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7828.016; Thu, 1 Aug 2024
 10:56:36 +0000
Message-ID: <98122315-37d4-457a-9c71-14e4d2c70062@amd.com>
Date: Thu, 1 Aug 2024 12:56:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] udmabuf: add get_sg_table helper function
To: Huan Yang <link@vivo.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
References: <20240801104512.4056860-1-link@vivo.com>
 <20240801104512.4056860-5-link@vivo.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240801104512.4056860-5-link@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0249.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB7028:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dcae1c6-699e-44a5-fe30-08dcb2189cd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WnNHa2UwRUdhZ3JPTkNyWmZHVHQ0VzRxWGJRR0RGc25Cd2dnK0hqMyt1c1kz?=
 =?utf-8?B?Sy94cEUzYi9jVTd5SFhsK1NPU1V0ejROTUhtc2d3TUtrUzQzc1FXeFFvUEhl?=
 =?utf-8?B?MUpXenpNa0pUK05ieVhGN2FBT24yOVFrTTlkVkM0dXN3d2dCZGd0V0pIZjRy?=
 =?utf-8?B?OFBNZnd5RVl0bXBiT0tURStabWFFcVJqQ1Q1dW9nZExEYUgzd09WR2dxeXpi?=
 =?utf-8?B?NUFhb3lEcDVVVEF1V3BCTGJyY29QM21aT2FlekljWFlXSHFqKzBMaWdKTzJH?=
 =?utf-8?B?MUlZczBWVFpPWWhxRlFqWHg4QytWWFFTejFzKzRBRXJjZE90SXE3SW81eVEr?=
 =?utf-8?B?L3J0Y25udHNEZC95cG0wS0IvQ242cEY2L0FHZ290NmVaR2VaMHE3QTk2by9w?=
 =?utf-8?B?Y3ZDc3ordGg0Q3B3TE5HaUYvMkxlWm9JaTRaL2x4eXhENE0zUlJHZjNHOExa?=
 =?utf-8?B?dUV5KzVzZ1BVamJUeUIzdm8yS0hydVVwZXh2TnBuMjEvRWF2WU9rd3BpcE8z?=
 =?utf-8?B?RStEWi95akJLUmNXdXdzQ1o4YWswVGhxUGs4Rjd6d0tTM21CdDFub2xKVElV?=
 =?utf-8?B?MEliMFFJTGN6dnZkdHRhaUZ6ZEZBNVFlUUdJUjBNZUhpaFY0QWU0aVRNTm15?=
 =?utf-8?B?M05zVmVtR1NybWtIUlBPNnJyYUd0MjFlSVg5cFpiV3JMNStuQjJyUUVBZWJ2?=
 =?utf-8?B?NlE5TXJFL2IyMmM1QXRidm1rVkRBSWhLV3BuK1lOdWZYdXJiUXRvY0M2ZVZa?=
 =?utf-8?B?bFFLZHo0VU5UV3VIcmZWN2tBYWI2b29tcGpuSFgzcS9rRWdnS1ZsanVqcHZU?=
 =?utf-8?B?VEdwNFNOSXRWQ1BSM3hKcDJIUDU4UHVROW1rUGtaaWdhNUsvTEZFQzhobC8r?=
 =?utf-8?B?WkdyZXZzRDBDS3lyUjR2R25FdWprQXp1U3ozN0NkNkxFVHNXNWdITCsxRGls?=
 =?utf-8?B?MWZ3M1VqZ1RBNU9Eb3dQTnJZblZxWjR0U1kvUzlxaDVoVkZjMTJWZ25senRk?=
 =?utf-8?B?Z2JGd2FEUzgvWHhGd3JsOXNGdzVPejZmMWd2di9JYzRqMWVHZDFVZm9VYzR6?=
 =?utf-8?B?My9sVHNHV254Wi92NHcvODJSV3ZVQ2JmT21tUUlqbWYxUkpnck5jZExucHM2?=
 =?utf-8?B?ME81S1FDK1RrTnhxNXJIZDduSENvRjZONFN6UmUvbzVBRlZtdlByTSs1ei9O?=
 =?utf-8?B?VEZ3ZS9XMHZTc2J4ZFI4UjBwTTlyN2FPZlYxOFBoZWtnejBHUlFSOWZLSVFu?=
 =?utf-8?B?Q2hzVlc4bzBURU40QVk1UXFNTjhIUTZBYXI3RVZuWm1tczB1T1hueEtqdllx?=
 =?utf-8?B?RDNTMElEL0FlZkR3MWdpTWlCL0c1VDJIQzg4RG1SVlJXM05NblpBZmJMQUJB?=
 =?utf-8?B?UU4xS2h6Syt1L3E5T3R4anEyY3RweExrYnRiTWhJSlUzTTYyc1N1cjQ1cEVD?=
 =?utf-8?B?anBwQ0lWcmh5eVBvZzM4dFFhVklUenlRaWZodFhNTDlodS9qRmFMQUNwdm0y?=
 =?utf-8?B?Ry9IdFN0ejVQVGxIeEFnSDVQMU1YYUpsUnRwZEJtYkdvQlI5bUtqbDVaZkZi?=
 =?utf-8?B?WktoTEFvYzh4R0c2VDJNd1locC9MdS9HYlB3WjZCckdVN2djYlNic254eHQ5?=
 =?utf-8?B?aTZ0dnVVV2lNa0hCcnB6WmZlMTYwbXJJbGxLMGdDOHkvTU16VE1Ibmg5Y20w?=
 =?utf-8?B?UzdKcDdrWjYxVWxLVnoyZEhSK0YwNnphb2t4QjJXenN3aC9qbkEvZlhCR3pU?=
 =?utf-8?B?YWlxSmtWQmNyVXNDUVpGRXV0WkFMQlFFRXFRSkhOYTRTYSs1MUp0bW55eTZB?=
 =?utf-8?B?Tmo5R2FTSGM0a1lvWU1jZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFcrY0hCNG9zamVQUW5WSVY4cmM1S0llTkY5bnNRSWhRdVBpUXRPWFByUUZZ?=
 =?utf-8?B?R1JwdjZOd0tiK29IYTI1Y3NudUNpTUdYN3VnVlVZaHZxaEtmblFJTnhpMnFL?=
 =?utf-8?B?SVNHSFE4YUNLM3NtRCtlazlQTkM4bVErcGdLOW5GU1hVZndWZFBRbUVIbURT?=
 =?utf-8?B?bW9jTlMvblMwZ0hsbVArdXRUUWtqUGp3ZlNQOTJtcFV1SnB3S3NzcDdPVXdl?=
 =?utf-8?B?V2hLWXJhUzdxbkV3dEJldkNINHFITEo2RlloTTJ2WEFJemd2RmprMzB2UWEw?=
 =?utf-8?B?WDNsRk9nSitZcjFwVGJJdWppajRaZUpSaWh5d3hXckVyY216dmRoRlZOQ1Vo?=
 =?utf-8?B?b20xUFRIbHF2NUFualhPWHFPRGlSUGhORXMrd0xMV3JJMFFzZjB1aHNHbXhq?=
 =?utf-8?B?Ny9NNWxqaVd1M1hEakJDaGlIaVQ4dFlMb3ozL1VGeVIyYmp5cmVGOXVMMGhZ?=
 =?utf-8?B?cjU1SGZSclFOLyt1eENvOVVoVnBJUzRVeGR5MTFSVDdVdjZPSmU3RkkvUW9Y?=
 =?utf-8?B?NTBnNTNjczVFZjhSY1cvWG5hN3hRNVg5Q0p4Z3A0WDF0bnFIeUxmNE9kMUI3?=
 =?utf-8?B?enVDamlLQjAxaWxueWFPTGptWlNXT29TMVgzSzhKVURDcFhKaVpzbWJSSXJG?=
 =?utf-8?B?bG1PTXVqMEhMTFBCbG5aN0dSTEdiYmROVlJvcDRvU25UMGFzdkNYRUVaektQ?=
 =?utf-8?B?ZkRSUFRDRkR5U1dNT25DOFUySVdNZWdTZ1FqQmhxOU9wZjJGaHRiQkpOOWxP?=
 =?utf-8?B?bnJKOTNoSmsxMzR3NnhaQi91ZVF2bldjYUYxUndkckgrWnkwK3NkMkNrdkd3?=
 =?utf-8?B?UmFGSUQvNDN1ZDNiVzhtWmxabjNMQ0d4WHlhMmJ2YzUxTkFWYTl2Mi80QnN2?=
 =?utf-8?B?N251QVhCNHEvbEwvUGtKK2JLL1NGRjVmQzZpbFlLRi85YldDS2JzVFlXWlRs?=
 =?utf-8?B?OTE0NXBBZGlTMlUxclRKNDF0VzRNdFZjMlpQZjREbytGdkxMbmRCZVpuQjIz?=
 =?utf-8?B?eW9wdmZkVmt1MG1EbHpiUzlveVZHSlFYZ0lVYVpyN0hnR0xvWE1NRTFqSExZ?=
 =?utf-8?B?T2h6NWNwTDNubzBNZXhvT09lRmFLSmRTc0M1YVpXR0dWMHQyemI2WGhLL2lT?=
 =?utf-8?B?alJLK3licjBkOWtZRm1GcEVUMHlIVlhaWWY2bW1SYmY1YWlJbUN0UkNoK05V?=
 =?utf-8?B?eGxlVFROL1VTV3ZBUS8xNDN0cWRPM3hWckVucjRXVEJXUWlLMGxsSzRROHN5?=
 =?utf-8?B?d2xoUmJ6MEZ1UElRNnJNMWluM2YwTDlPeXpmbU43Q3NLWjZ4LzJ6b3RUMkZJ?=
 =?utf-8?B?WFk1YU5PbmppaDdnUlJOWmpMUWZMTTNIaUxJdmVXT0o3VTJvRExTNGoxSTll?=
 =?utf-8?B?VFZCSi9CMVF5ZzUwei9CcWxhWVIzWUtOdHVDZG9YUFRQdFlOWEFTaFRYc21G?=
 =?utf-8?B?bVdjNnlGZmk3NzhneHpaelJadmh1SHRhTGtsdkVvL3BEekx2dW9qZGZBUWN0?=
 =?utf-8?B?MjBCT1lESERmT2U2QURDcEpFMVR4aThSZE9EQjNmdzhKNXlSeHdaOTdObVp4?=
 =?utf-8?B?RUhtVDc4enJ1WS90OTBQclRFWkNpeGU2bUxVMjFCb3Uvci9IeEJUQWZlVjBK?=
 =?utf-8?B?R1FvbGFFaFNpR0o4cjNBakFFU0h6Mk05YjFFQWQ0NHVONGZBZ25aR2V3UUhV?=
 =?utf-8?B?UG85dkZZdjMzWkFsTDlIQnVmckw5Z1BVS20yWGZZWjBiYkpsVjFsM2ZlR3Vx?=
 =?utf-8?B?NjdIa0lDb21McWgydlJsdkRnaUdGazBwRk5XVFE0Yml0a3E1dG01aCtmeUVx?=
 =?utf-8?B?SFVBR1A0bmdTWTJqdUtZc0xXekM3dE9EZHZiNnlzT3ByejNtRDY1WlVTN2tX?=
 =?utf-8?B?L1BLZnZ5aFdMNUxGNm5hbG44c3FCY2IvQ2dqNWZnWnF4aVczTjhnVDB6SHg5?=
 =?utf-8?B?NnVlN2dWdTM4WFVwV1NZcXhFNXI2UUgxTVB3cjIwd1JKL0lDS1hDVDkxeC8z?=
 =?utf-8?B?M01rVG1zbTF5ZGMzRGFOREw1RnRpKzcxY0pvWVR6a0RSWjRUUGdlYjhTaFRh?=
 =?utf-8?B?OGltaW1oOFJpZVg0YWhjL3BSd2VWOVp1WXNQSDJDeWJjeE5vTmw1blJmRHlH?=
 =?utf-8?Q?/aREUacQKrw2YZGsGb4L4gsUG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dcae1c6-699e-44a5-fe30-08dcb2189cd1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 10:56:36.0470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OkEMqsxziFUoPY9ak7T8jHh48WCmqZpVCTYtlPmWRiIsJb/ZakBzmPNE1HrWRwZH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7028
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

Am 01.08.24 um 12:45 schrieb Huan Yang:
> Currently, there are three duplicate pieces of code that retrieve
> sg_table and update uduf->sg.
>
> Since the sgt is used to populate the page in both mmap and vmap.It is
> necessary to ensure that ubuf->sg is set correctly.

That is a really bad idea. Why are sg tables used to populated the page 
tables?

Regards,
Christian.


>
> This patch add a helper function, if ubuf->sg exist, just return it.
> Or else, try alloc a new sgt, and cmpxchg to set it.
>
> When the swap fails, it means that another process has set sg correctly.
> Therefore, we reuse the new sg. If trigger by device, need invoke map to
> sync it.
>
> Signed-off-by: Huan Yang <link@vivo.com>
> ---
>   drivers/dma-buf/udmabuf.c | 60 ++++++++++++++++++++++++++++-----------
>   1 file changed, 43 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 7ed532342d7f..677ebb2d462f 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -38,8 +38,9 @@ struct udmabuf_folio {
>   	struct list_head list;
>   };
>   
> -static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
> -				     enum dma_data_direction direction);
> +static struct sg_table *udmabuf_get_sg_table(struct device *dev,
> +					     struct dma_buf *buf,
> +					     enum dma_data_direction direction);
>   
>   static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct *vma)
>   {
> @@ -52,12 +53,9 @@ static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct *vma)
>   	if ((vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) == 0)
>   		return -EINVAL;
>   
> -	if (!table) {
> -		table = get_sg_table(NULL, buf, 0);
> -		if (IS_ERR(table))
> -			return PTR_ERR(table);
> -		ubuf->sg = table;
> -	}
> +	table = udmabuf_get_sg_table(NULL, buf, 0);
> +	if (IS_ERR(table))
> +		return PTR_ERR(table);
>   
>   	for_each_sgtable_page(table, &piter, vma->vm_pgoff) {
>   		struct page *page = sg_page_iter_page(&piter);
> @@ -84,12 +82,9 @@ static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
>   
>   	dma_resv_assert_held(buf->resv);
>   
> -	if (!sg) {
> -		sg = get_sg_table(NULL, buf, 0);
> -		if (IS_ERR(sg))
> -			return PTR_ERR(sg);
> -		ubuf->sg = sg;
> -	}
> +	sg = udmabuf_get_sg_table(NULL, buf, 0);
> +	if (IS_ERR(sg))
> +		return PTR_ERR(sg);
>   
>   	pages = kvmalloc_array(ubuf->pagecount, sizeof(*pages), GFP_KERNEL);
>   	if (!pages)
> @@ -154,6 +149,39 @@ static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
>   	return ERR_PTR(ret);
>   }
>   
> +static struct sg_table *udmabuf_get_sg_table(struct device *dev,
> +					     struct dma_buf *buf,
> +					     enum dma_data_direction direction)
> +{
> +	struct udmabuf *ubuf = buf->priv;
> +	struct sg_table *sg = READ_ONCE(ubuf->sg);
> +	int ret = 0;
> +
> +	if (sg)
> +		return sg;
> +
> +	sg = get_sg_table(dev, buf, direction);
> +	if (IS_ERR(sg))
> +		return sg;
> +
> +	// Success update ubuf's sg, just return.
> +	if (!cmpxchg(&ubuf->sg, NULL, sg))
> +		return sg;
> +
> +	// use the new sg table.
> +	sg_free_table(sg);
> +	kfree(sg);
> +	sg = READ_ONCE(ubuf->sg);
> +
> +	if (dev)
> +		ret = dma_map_sgtable(dev, sg, direction, 0);
> +
> +	if (ret < 0)
> +		return ERR_PTR(ret);
> +
> +	return sg;
> +}
> +
>   static void put_sg_table(struct device *dev, struct sg_table *sg,
>   			 enum dma_data_direction direction)
>   {
> @@ -230,12 +258,10 @@ static int begin_cpu_udmabuf(struct dma_buf *buf,
>   		return 0;
>   	}
>   
> -	sg = get_sg_table(dev, buf, direction);
> +	sg = udmabuf_get_sg_table(dev, buf, direction);
>   	if (IS_ERR(sg))
>   		return PTR_ERR(sg);
>   
> -	ubuf->sg = sg;
> -
>   	return 0;
>   }
>   

