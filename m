Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE2F49DB8C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 08:29:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF7D10E55C;
	Thu, 27 Jan 2022 07:29:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 629DA10E558;
 Thu, 27 Jan 2022 07:28:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EMEqVHbSCV+q2yGrw1K/LUpV52pUqBRajxDfRVj4cqfkCvk230TbXEkcWZzimJYKYUC1CjN1BBEtLJO1LGNMnTRp40LRk8tpTG5DAOs1W9lo6yG4IokaFLsInKq6GaIWp13vtkbfTIQEnxDkLeqsZ4gJY34rdNkFxOTcQy+dBLAUSeQwuIzGM2IC8pySKrF4H0ZN8aUSk0XK3v9T8SP47H1suTK3xq4atcbaswg+AkOp0DUdsVemqwtofNYZTqVcEgYaEXPuklPGWqv+Va/jziFxhPCGV2n1SismTXW6lgRYVl7US5VMTb/weQIw36R/dJtiLeJ6Se/5XU8Li3nK7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TntMRdGjYWPiqymQRjLf/DoDGgmnjiCSbSotezKpyVQ=;
 b=cSEUCH1jnhBrzyCsrSKFNHeLpdkAMQReX9TmCbbxty1wJjic51TJPb7Zh8e4e7Lxai6EA21zk+ab3skdC4TQcdBRavGijtmqE2EYP0Ppz5OQO1s3byELlou7Q9iWh0AhSXGbbYNq1V7XFPc0C9C9X5OzG6EToNoM9Jk1bzmvKHUS2k8/KVulbR5NtxTWbzBi3S8Auyi83UngTaEldUnWd+Pjp2oITynvxdurxH5QsyNqH4fTAqZQw1+DXZ9JDWcnvYmW0Kc9+1asTZWn0Lfbzu0I3lw03b6ep0v/SgyjxQyDwPcFbaIWueLpL85ruWVM4ZKUZ6P/OJVvUT38+gU00w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TntMRdGjYWPiqymQRjLf/DoDGgmnjiCSbSotezKpyVQ=;
 b=X7DxzkLTs12rTd4jFXmhTCmEYlbV2ORK+9gO38QG5ZXj0kPelCeltKH5zXcIhpAyyZjA8mW+Hj6WuAgDTNNhwErPO8f1vDiG/dbptJvBQ8zDkjibMnit6AOe2p0nWQ9KapRrzphfHL7AQngTQc72YwQyB3Bo1O3jXWCoZVf2iQA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (20.178.210.205) by
 DM6PR12MB2603.namprd12.prod.outlook.com (20.176.116.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15; Thu, 27 Jan 2022 07:28:57 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d8e7:e6b0:d63c:4a21]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d8e7:e6b0:d63c:4a21%5]) with mapi id 15.20.4909.019; Thu, 27 Jan 2022
 07:28:57 +0000
Message-ID: <a90a0817-07b0-dd11-1bd2-236ca046821d@amd.com>
Date: Thu, 27 Jan 2022 08:28:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 09/19] dma-buf-map: Add wrapper over memset
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220126203702.1784589-1-lucas.demarchi@intel.com>
 <20220126203702.1784589-10-lucas.demarchi@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220126203702.1784589-10-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P191CA0087.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::28) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5c42e0e-2ba6-49eb-659f-08d9e166ade0
X-MS-TrafficTypeDiagnostic: DM6PR12MB2603:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB2603FDD17F5121F16B5AF90C83219@DM6PR12MB2603.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yngiQnHTPVYvyIZ7pcvxNjxOzGhoJCVPdPCTA09AeG5Q25Z6++MSiXQm3M22z+xJv7FlRuAqQN4zjmHDIEKoKUEeL3vCmcYPFze/b4sCyJ0v3DVLrCG7QlsvFztlj0m7oE30dnNgL8JWfH+BB7d+fx7mCFmswiXctDKp9d8IJKXmEn1XI40thLixW6nY20tborDao8AkGzk+WNKJVtda0VPOoGYnqHNWvOiy00IrdgD/uWRVsIKjplgvNSOHvLTTIhO4ygrDggKsMcLN35fLA517XDIxP/MVTvFZY6JmrTZkNhndVG0aa/MlBuzY2CUvvFWXdE3LpxgCPu4tsf/r0MK0TzXMDmzINvxMoC7DoUhGxezLnLBO6uneIuasOVnCRJT/UOxTNIvMQH24edAcDAmS0P80Vq2wMrgxrFVNCk5cBvtmfnIerlVu0YkL536lqv01AMzIWR7zGBcBXi2B+sDy+AvCBUm/qRo5U2s1fsGMmvqCA8k6iVjpOlAggyMg9PRjsIl7NK1N6aORUptbAViRo1DxrIeWxZHtKiazMLHCV6mIGseIHPKbpEdulJEhKhLZrHtQLWasQMlm7vpzqLoXVkECv/SKBWSPYzX22pCmKbLOHN9wl+agr/55YdjKwK0rGM6GY6MmVy9F2Cw4LJ24gvtWk1GK8H7zfUsl8QYLLP100nFD4epxaN1j2B/KD6bxuAji4G53ZtdlvzeleRaOC3n6dp2uNciOWZ19GUIcGEUHm6aNsPtZfb0lVM9f
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(38100700002)(5660300002)(66946007)(31696002)(2906002)(66476007)(8936002)(8676002)(316002)(66556008)(6666004)(31686004)(86362001)(4326008)(508600001)(2616005)(83380400001)(6512007)(26005)(6506007)(6486002)(36756003)(186003)(45980500001)(43740500002)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmtQSjRiYVRtY2s4Wk5wSGRqTXdudUEyZHVWYmlkWWVTQ2s3VXk2Qi8vdzRX?=
 =?utf-8?B?L1FRQW1JVU9ZU25Rc0RPSkFCeVBEclFOS1hsb0hiRSsxVFpCd0ZXZHB6RzQv?=
 =?utf-8?B?dHlMd0luYlJZUGRoaXgxOGF2WElqTi8yTTRseUc0b0ltMFNvd0FCbzUyRkZ3?=
 =?utf-8?B?NGEwNjJRajdQSGRGL20wZjNFWnRaZzRzVHZEbDFTdS82L0RMaSs2MUhCRFFI?=
 =?utf-8?B?a1U4dXpTSG9EdjV0cmxpL0QyRndSZEFONm5OWXE5SkxONTVoeVJEZWJIWFh4?=
 =?utf-8?B?UW9hREU2OWNEUEFuT1BZNEgydnZ5OTNQUjBCOEtwSkE2TTVlc3g2SWcxYkNF?=
 =?utf-8?B?UktDTnpwSktLZjBMQnVodldPM29BUi81Q0g0T25lZzhscStTdjVUS3pkMFlw?=
 =?utf-8?B?Z1hBcjREQVRrVEo3cFlTYnlYeU5IZGc1ZWxHWk5ZNnlvTHBqaW5WUDhkbmlX?=
 =?utf-8?B?Y3hFUkdrUDJjbkE5RHpSTCtyQ0hJNitVUlY0OFZNNlMwTlJuMy9RU3JZNzNs?=
 =?utf-8?B?QjRRN2xJOVJuTUsxVXpaQjBCZUt2TndhMmRJZUZCZWZ6VnJxTGhRcERwaUpv?=
 =?utf-8?B?OWNuYW12TVg2a3k5UjR0K050NEFBTW5zcDhHQ0F0WFR3N0xyRHhta1hPbjZm?=
 =?utf-8?B?d0UxRzBzSURNbjlMcUp1VE51MWZ4cDFrVHJTVXNNVXdIWU9Rb1FHd1BuUGpX?=
 =?utf-8?B?blpTMTNvYmJ6enNKdlUyT3NFUEY3VVVmQ3lnbW13S1VLSXd1RVpndVVUc3Rh?=
 =?utf-8?B?VHhhL2hYYVc0ZnJPYmhibU1iRytPNHh6Z2pWMmJIVlI0N05tOVhFTVR5ajBT?=
 =?utf-8?B?SGJQMFQ3aGZjeC90NVJCWFNZdSsvTTlneSsxdy9IK3puSmJhWTkrdERnalVl?=
 =?utf-8?B?L1V1MDhORmVwOW5rWUFtc3dtL2xHemt1RDRwWjVKcVZ6TXlqUk9zdkl4Nmtj?=
 =?utf-8?B?a2FseFZScVBWRFFWay9vQWg5OFM5cEs4eXFLNEFNMTYzeWZSYnd1Y0ZiMmZa?=
 =?utf-8?B?OHEwdzBBMGl5RVJIV0p4TWtTcGpPcWVmV2VpeHJoTm9tNmR0VGQ5VnMxY2JF?=
 =?utf-8?B?b3BHK041NXlaS293TEIrQ0JEeS9odWRvK1VuMDROSEI5M3VodUNoTEJWakRp?=
 =?utf-8?B?bXlzOXFONVRMYmZvTktYWE9yRlZyYU9QZzFwaC91aFFFTk5leFFiSDFtdkxu?=
 =?utf-8?B?ajJ2RTlrUUlnRFpyY0wwTVdNQjRpS1J0MXAwdktBcXlzSGxTUCtaMlZ4ZGZM?=
 =?utf-8?B?SzlONU1KQW9DQTJzN0JkcjVLU09tTVJ5dkxDYTRoSUJCZDBNM2x6ZmVRK3Ni?=
 =?utf-8?B?WGVkTHh1WkREYmFOWCtQYVhzSkNPZkJlOVlIZ2Fmb1Vwb2IvVWZjSFBmVlVU?=
 =?utf-8?B?WG02U0RhdFNsbWVPT1VKcExFWFpmM1hwRGdxbFAxc1F6d2hNRXBUUzRYVW5J?=
 =?utf-8?B?M3N6NEVsU1NwVVpyRmRqOFdFdFZHelFVRU1EdHNyTW5EQzF4VldGakdxNk1E?=
 =?utf-8?B?WVpMTkcyeklwU2JvTVJJc2pYb0NRbHJuS2gwSnZPNkNyN2dSeHBSbW8yby8z?=
 =?utf-8?B?SjhhZGRycGNLUnp4a2VOaG9RZGVvMFlRVUhsenJUYWoyM2VoRE1rS2ZzS1Bt?=
 =?utf-8?B?Y29uN1dGWlNFWkZMVDRxei9KZGpUSkd2MkJMNEV4YzY0ZGR1UmFVTHp4aFBy?=
 =?utf-8?B?eVhmY21mQjJtUGZsTExFcjdCSDRZbXNzTlh2dW1NNFV0eDZ1aG1VWG1NcjZP?=
 =?utf-8?B?VndGZGo5NmlWT2NyYmJNNHZtZUlUQzJyMysydHFncHpnM1VZQXVQZ0JlSjVa?=
 =?utf-8?B?dWU5b1pJL3JNdEsyY2hkYjhYb1ZzRlZNUU1KZEpIdGRldmhyelo1ODgzTU91?=
 =?utf-8?B?MC9QU28xSTBoWThQeHB4QkI0QUhselB3Nmh2a08zKzZEcmF5aHFHenhRZzA2?=
 =?utf-8?B?MEo0aS9KdTFES0FEV3MvWDh1ZC9tT2NhcEtpQmdRclF4RzhoeVFFekxOaFFm?=
 =?utf-8?B?eENhN2c5dGFMUWJvV2JXckh4bStrdkJ0YWlRZlBLZk1Vd3gxRkZ2YlpIYkQx?=
 =?utf-8?B?U1QzUS9ObGM5cFl5OWZjUThRdXljaHhtV2ltbjBuS1E3NkczcmNuenVmZnUr?=
 =?utf-8?Q?ri7U=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5c42e0e-2ba6-49eb-659f-08d9e166ade0
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 07:28:57.1588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fJtacokKJuWFriPYq1m5zRyYb3FVEheZa+6u7AVytTQcVHKfc72gQHKUlfYhhcHm
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
> Just like memcpy_toio(), there is also need to write a direct value to a
> memory block. Add dma_buf_map_memset() to abstract memset() vs memset_io()
>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   include/linux/dma-buf-map.h | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>
> diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
> index 3514a859f628..c9fb04264cd0 100644
> --- a/include/linux/dma-buf-map.h
> +++ b/include/linux/dma-buf-map.h
> @@ -317,6 +317,23 @@ static inline void dma_buf_map_memcpy_to(struct dma_buf_map *dst, const void *sr
>   		memcpy(dst->vaddr, src, len);
>   }
>   
> +/**
> + * dma_buf_map_memset - Memset into dma-buf mapping
> + * @dst:	The dma-buf mapping structure
> + * @value:	The value to set
> + * @len:	The number of bytes to set in dst
> + *
> + * Set value in dma-buf mapping. Depending on the buffer's location, the helper
> + * picks the correct method of accessing the memory.
> + */
> +static inline void dma_buf_map_memset(struct dma_buf_map *dst, int value, size_t len)
> +{
> +	if (dst->is_iomem)
> +		memset_io(dst->vaddr_iomem, value, len);
> +	else
> +		memset(dst->vaddr, value, len);
> +}
> +

Yeah, that's certainly a valid use case. But maybe directly add a 
dma_buf_map_memset_with_offset() variant as well when that helps to 
avoid patch #2.

Regards,
Christian.

>   /**
>    * dma_buf_map_incr - Increments the address stored in a dma-buf mapping
>    * @map:	The dma-buf mapping structure

