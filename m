Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C22349DB6F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 08:27:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26FA10E3DC;
	Thu, 27 Jan 2022 07:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2059.outbound.protection.outlook.com [40.107.96.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D1D210E3DC;
 Thu, 27 Jan 2022 07:27:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ewdATfFs8IjT/e+aGVdXQJXOwxtpHxevN4Wj0BzSUyE8rhI8QSW/m5T5Lkr2deG9xBD1o6ZVFR9b1ttgEqeC0QmUCUcUc/gjGjaW2D9eex3lG0NdfTUBlL5SKP7z9A9MOqa8TA5ulbkoolwWMTWRpV1+rjTUIhbTpMdh1C1lr7ZybV6JBKH0OUtzGLK7A2h2Z99zN9FIeOJ20q+kNochokDueIsbucbdQBsQz/+1WlKpjXbonZIwfTTR+pX2yQ0l9JdSR/5L+wXu9eVvs5HNMwma6NYKP5/RBZd7n+PAgjgS2zx5QwrELI40eLfI4TXS6Fsmdo4PpsKeLv/OFAQyww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WAyxq43yKpnPAdn+/QR3a/24qkATUY3MSXD/g0pPkSs=;
 b=oEP//wfdi3bTeTxj1wkCFhGPFT7LdyWx9TlDfoNXJpqp0dyK2hxUsiV1U/a2ZZdTGOrAy7E6pBGFyRDuaEFGff0hD3scKAYEwYDg61qtBeBhk8wV+x3/1N7UGK4Z7nwZGZAPVQQqm8xZcfXSUjBj8KyMjIosCTLlRD/59yQW62HKZ+wqtqz7RjxeTS4mt5Rgba1kYlve5O2DMEMeYc4TPwSruVJlSVR8uVx3DQ4rZUE976cv7h9hnI92pv8XhcwO7z8cSCrnFnjM10cOvBJxc7YIoc+sTrEhYWTIzaNmBm3LJZp8hJ5xXdqlzZ5PvyznKF9apYMhvdZZ2l0yXs0+QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WAyxq43yKpnPAdn+/QR3a/24qkATUY3MSXD/g0pPkSs=;
 b=cCNanOCYh2nA4oFcM4j6wyu3JyWaRkxf1nwubTxs3Mvo0NFC3NFPKmtkgL7BiFj/VzIGEKhvkE8rM45VIHRUu9e96ecL/w0KdUADqa5Wd+Nm6Fww6icVPd7r3CsdVOxClD4kWOx7HxLg0K9PpyoOjUo3fUT0LZr4UcdebLcHZDE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (20.178.210.205) by
 DM6PR12MB2603.namprd12.prod.outlook.com (20.176.116.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15; Thu, 27 Jan 2022 07:27:16 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d8e7:e6b0:d63c:4a21]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d8e7:e6b0:d63c:4a21%5]) with mapi id 15.20.4909.019; Thu, 27 Jan 2022
 07:27:16 +0000
Message-ID: <f0dbdcc0-13b5-c484-0bf3-a1f8c3e48954@amd.com>
Date: Thu, 27 Jan 2022 08:27:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 02/19] dma-buf-map: Add helper to initialize second map
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220126203702.1784589-1-lucas.demarchi@intel.com>
 <20220126203702.1784589-3-lucas.demarchi@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220126203702.1784589-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P191CA0100.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::41) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d481c12f-3a39-425a-5287-08d9e1667206
X-MS-TrafficTypeDiagnostic: DM6PR12MB2603:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB26031297356638C44CF5AEB183219@DM6PR12MB2603.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qdUT8mdwGgzFGIZkwxj2kvS+CFEhlpkHPxUWvprinf/Q+xGgqqEkcrp6Hlr35ZV65FZLKxN5mCNSTsdzYvdOeYvnt2Cxe8UvrGbl/E3FIGxZ84XkbU8TeqYukirFV/yXIgEk6jwX+BTTSs/3TQUYehm25Gb5Sb1hLOX4hwSubK08hs2kkkQhaH+zQy4lo9PVwDz5AjR74jxoA93h2gwS8+RR3ndWJ7z+u/0lq1yKruZiaFJTfd1j2VPqwdezzKimXQA3yvj0vdSXWmsFuWo1XGWuzvC2lh3Rkn94hXGG5oPtxRwbY7m5NtmjPOWEQp1ijVKWxvK/KLMvZwEjReY1DzdW51w9BuPxKpb0bFodsWAWtEUnJJ1TfGXwGTfnDmD5ZaqEjbr+emZFtZzrVx91Mm6BnsqAnfAA0kML3j/3hPXtr2Y/yBk/JJlbQdW3MAJXk8zfI3iBvqaKsiA+MDO/6QFNJRrfBb9Htwc5FWLyUlv1pw9AZrsD5KPGn2NJCSuooVMYXRoZd+IIbmH8w1SUjFckuwWdksNVWir0c0ffEAzBvNUGyU8iVtxNck9r1TKuXysNBAA8fUhyT6ch05qyP2yRTGQeeC5PG2PrXAlK3MqcTgD2rqLy6O5nVVG25XBsCP7gZRTKtAYYsvf6hNiDcFWvLUG9QUNM/XY5r68GN0cKpam50wA2qrurmGcRANp4fatdQxVciVWgTkf01+7/vXkxHMQ4YMNapCsmsejKSMTaW2kBy9dgJVvxPMPqU6wm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(38100700002)(5660300002)(66946007)(31696002)(2906002)(66476007)(8936002)(8676002)(316002)(66556008)(6666004)(31686004)(86362001)(4326008)(66574015)(508600001)(2616005)(83380400001)(6512007)(26005)(6506007)(6486002)(36756003)(186003)(45980500001)(43740500002)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1BNS0xoR2lDM0pLSUFhRkxWK0R6R0xKUGVnL0tvWU5OTndtQXNINVZVTm1D?=
 =?utf-8?B?QkM2MnUrdjVWaS9rVVJHbDIxV0ZaTUtJZnNUeDU5cVl3UGdTZjlYdEhhQlU3?=
 =?utf-8?B?TlhzZm1VSU94SXVUNm1UY0tKcU45V2k4amhINWVoUzVWaml5aHRudTJ0QW8r?=
 =?utf-8?B?dGFhSWhjcElUNXRPOUYzZEN6TndwTjJxTmFMMGcxN0gzQkRLeWxKSnBVNjBo?=
 =?utf-8?B?V24yNkpPbG9mMmJsaFBrL0phYWUwWW1EMkl2RThlbFI1TFYvZ1UzTGd6UXdE?=
 =?utf-8?B?QklOeGsrMWZ0ejRSVWE4WEtzb3JOejVZb25Ta2c1c0JpZCt6MHgwWjFMQU9I?=
 =?utf-8?B?M3M4Q1R2UXhKTFJkVDZqcE5hYWdOOFBYRW9FeWhOUkdMb0oxWHdBVnNXdlNr?=
 =?utf-8?B?Q3ZKR1JLK05JTDl2bitDL1JRWXAzNmJFODg1STY1SkVuYm9laVJOUzJ6MnNY?=
 =?utf-8?B?cmMwRFk4SklMVlVKM1VQRWlCd24rVVErLzN2ZWNxQ2V1U3pKUGRyeDZESjZm?=
 =?utf-8?B?OWMwVDJyVTlZNFY1VVJJWVlIOFdjVE0weXpiRGtZTS90QVIrQmQ5MHpUeS9C?=
 =?utf-8?B?Mk96eGovR0d0SjdnWldGVWxtUWdheDhQeURYMUJYbG94eUZmR1ZyVFJ1V3pG?=
 =?utf-8?B?Ui9VR1ZBa3hoS29vcEJicVRqOE5URzhzYWdVbWtIb2FyeTlGbS9VRnljZUgr?=
 =?utf-8?B?dXIwN0lxQlZCRVdsSlFGNHg3V0lPeGh0djVnaW5SUWJlNWtVNkpDYmZsYTZu?=
 =?utf-8?B?bHBUT2x6ekxFQXZNVTB1dDAxR1ZJaS95ZkZNT2pqZCtqTWlockhyYXpyMlZF?=
 =?utf-8?B?WVZVcGxPN2tRYXZ2N2R0MFFIaXhROERUa2dNZzQxL2NzdFVsRnpoZDJ4a1Mv?=
 =?utf-8?B?YUg3WlhpZjhzZGtKNXZvbVpyQTMwQmI5YUhwWnY1Tmp6eHlCYXlHWG8xQW55?=
 =?utf-8?B?NysvejlJZUwxZFF4ZlpSMEpOanRKUmttbWpxQnJJZVJJejJURys2L29wQmpv?=
 =?utf-8?B?S0c5MU9OZUJQbk5zek13VEtBcmZGY2U4UG9ON2xUNnBEUDVLNHlleE13c05j?=
 =?utf-8?B?NUNtVllmejJXZnc0SkRwMk8rbWhQZkI2VnhGRm5HVU5sTUdORVJjeXk5NjY2?=
 =?utf-8?B?Q0EwOTMyNmc5MXNiVUMwK0JXOXRqczEwbUkyUlJiOFQwc3VwU2dDWEF0VjRu?=
 =?utf-8?B?YnRtZ2kwWG1zRWR2QlZwNUJ3dERPWXdoMGZ0SUsza1A5ZGpnQ0JuaExjTnRG?=
 =?utf-8?B?VE5KWnhZVm02TGVHVzUwbys2aWlGZS83UHlnUzBsY1lwb2dyYlBrcGk3RjR0?=
 =?utf-8?B?L2I5ZFBSM2NGUzFNdGZPQm9PTjdHeFRzOVp0Wk5PY0ZaWmlST1lwM0hTWEds?=
 =?utf-8?B?ejlhQnpVUHdRaS8yNDY0QStlUTlUKy9Vd2xUYkZ1ZmtTL3h6b1lQSVZnMDNJ?=
 =?utf-8?B?OWwyWERXblZOUFV1a0d2SHgxZ0RwZGsyWXM0Njg2a0JUOW5CaEFGbTFkTDE0?=
 =?utf-8?B?MjQybzM4YkN2VXpUUU4rdnNhQUdXdDJKNUFGV3Y4MUlxN0VlSlZyWjZINkpU?=
 =?utf-8?B?WjE4ZnV3cmY2Uk5VVER5NnhyaGEwVGFkdHZwUmtIenZPdHlsNnhvMDlFUTZj?=
 =?utf-8?B?ck1MaFo5ay81REdkUlR2OXVuVm9BRFlrSW5NRjh1QlZBZUtvNER5NUFWak5E?=
 =?utf-8?B?STNJRE5mT3l1cFIrVlZRSTVsYXgvRWZLVThrRlNzaldsbVU1Y0ZYdTNSVWg3?=
 =?utf-8?B?MjBOZjFqbm5iS2gzWkZ6NTFoL21iT3hZdVFHaUtFTit0YlJmN3FTcnhvTi8r?=
 =?utf-8?B?V3Nrc1cxYWU4RkdKQnF2L0wzWkw4THR4OVJXdVVDMEh6aThvSXRaeXVTSTRi?=
 =?utf-8?B?aW42OSt6cldjVlpLck5zMXlJblpFVUNaRlgxb1VWVnhycjBrSExLRURVZ0FD?=
 =?utf-8?B?U3lrTDVYZEhicXZJNVdWUEVpdVlZQ1NZOTJXeU1DRzJDUzRaZ2lpUGl0ZlJG?=
 =?utf-8?B?Um1YK2Q4eGJGbzduNHpDOHM1VStrRHZmZ3BvTUVBZk9YZnRHYXc2NlEyU00v?=
 =?utf-8?B?eTVRTmlBMFRuejJRS3hjMW1zc2lRWjdTcWZRMVJLM1lVaTZzNWRDM1hMTjdW?=
 =?utf-8?Q?DcAI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d481c12f-3a39-425a-5287-08d9e1667206
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 07:27:16.7285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qTeNZA25bCsp6F6Bu4QZ6LPuOXo8IuwLb5ZyzhycE+6kwzYXhSwxy9ifbedTjLrC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2603
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 26.01.22 um 21:36 schrieb Lucas De Marchi:
> When dma_buf_map struct is passed around, it's useful to be able to
> initialize a second map that takes care of reading/writing to an offset
> of the original map.
>
> Add a helper that copies the struct and add the offset to the proper
> address.

Well what you propose here can lead to all kind of problems and is 
rather bad design as far as I can see.

The struct dma_buf_map is only to be filled in by the exporter and 
should not be modified in this way by the importer.

If you need to copy only a certain subset of the mapping use the 
functions you added in patch #1.

Regards,
Christian.

>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   include/linux/dma-buf-map.h | 29 +++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
>
> diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
> index 65e927d9ce33..3514a859f628 100644
> --- a/include/linux/dma-buf-map.h
> +++ b/include/linux/dma-buf-map.h
> @@ -131,6 +131,35 @@ struct dma_buf_map {
>   		.is_iomem = false, \
>   	}
>   
> +/**
> + * DMA_BUF_MAP_INIT_OFFSET - Initializes struct dma_buf_map from another dma_buf_map
> + * @map_:	The dma-buf mapping structure to copy from
> + * @offset:	Offset to add to the other mapping
> + *
> + * Initializes a new dma_buf_struct based on another. This is the equivalent of doing:
> + *
> + * .. code-block: c
> + *
> + *	dma_buf_map map = other_map;
> + *	dma_buf_map_incr(&map, &offset);
> + *
> + * Example usage:
> + *
> + * .. code-block: c
> + *
> + *	void foo(struct device *dev, struct dma_buf_map *base_map)
> + *	{
> + *		...
> + *		struct dma_buf_map = DMA_BUF_MAP_INIT_OFFSET(base_map, FIELD_OFFSET);
> + *		...
> + *	}
> + */
> +#define DMA_BUF_MAP_INIT_OFFSET(map_, offset_)	(struct dma_buf_map)	\
> +	{								\
> +		.vaddr = (map_)->vaddr + (offset_),			\
> +		.is_iomem = (map_)->is_iomem,				\
> +	}
> +
>   /**
>    * dma_buf_map_set_vaddr - Sets a dma-buf mapping structure to an address in system memory
>    * @map:	The dma-buf mapping structure

