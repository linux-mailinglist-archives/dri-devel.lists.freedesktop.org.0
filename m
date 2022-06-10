Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A860545D3D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 09:24:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B37110EC54;
	Fri, 10 Jun 2022 07:24:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2049.outbound.protection.outlook.com [40.107.95.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E644810F305
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 07:24:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RzB0rCFsgQxp1C1X8oiPhA7i17vnSflGF30SSrUDzp3/Jgi8j2T+YcGY+nZvAgolSAgMUv4RE6NSjcY/ouT87/MHyf8qSJCD6cUa9EsJDrQ5X+TQpzzGIbwPkd4CY/Qb8/3/3BJGjIGmHTqAIqAtOnhc2HD7w4/fM1LtUVZYi+kLHFdNBqT3G82BIoqcQGMWhhQ/9sKWYq1GlfrsbHDMUV+UwGqNOHAvS1IE28HLdPfy/+0TU/L5+6DIcTGuOuZVyFXni6J5iahkHQsVNyFqynlD2GzagKf57NXi/Edf5uBxM6O/kb4KyjSnFm1a58uawnJ+H5plIGXfASxNhz8x6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/LxTsjea6D5Hp/AQRsBDnDWiiCJ4WxEoD8x8UqArK2Q=;
 b=GTJ3ujuBe952LQSnVKyfAA4SRaJRYMMbplZxEU5m/3w69NRGch17lyksqqmPGhuNN8XVjpIu/lSL4RBmU8OhHiKEQSWU2kI90pVS09WKEwWCDbR2qxIIgWYXijBoRhbZsepfwOgOoTJq0qC8PswqaFnq4u2qNaV0zSqOZ5PQ3lTBf+WHsceCpy/FpR6ghHwdbzI0bIQ7p9YxipsEhZE5fvEJxHFfQTryrDRt5T2Phmplb/pSmVAo9D7eFP0bviAswvS916liLcPV7TLrRWzL+3/sL18jfdWLIxlEQahnSTHljdZ7KDTZG9gFFLF+1V6iBxuQdKwQtgpohhoJfGp8EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/LxTsjea6D5Hp/AQRsBDnDWiiCJ4WxEoD8x8UqArK2Q=;
 b=hfLHMVXn8FfvKIJDj1GsxbnzGoYsirAALjTtGLNXtmxKR7aDJpZhTminqAKiUzFp6xqMby//gCzTNPqw0dfxNvpfNBj1N0uDj8Zw3gUTJwMnHdjd51VRRhax6lgz0w7pKdYK2OVF1Bjn9IVL6RZ4jvVroaYAOyDoFPjA9tarpmY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL1PR12MB5189.namprd12.prod.outlook.com (2603:10b6:208:308::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Fri, 10 Jun
 2022 07:24:26 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731%6]) with mapi id 15.20.5332.013; Fri, 10 Jun 2022
 07:24:25 +0000
Message-ID: <c079243c-9084-b565-2320-20453815c79a@amd.com>
Date: Fri, 10 Jun 2022 09:24:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] dma-buf: Don't use typeof in va_arg
Content-Language: en-US
To: Wan Jiabing <wanjiabing@vivo.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20220610072019.3075023-1-wanjiabing@vivo.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220610072019.3075023-1-wanjiabing@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0104.eurprd09.prod.outlook.com
 (2603:10a6:803:78::27) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09589f81-332b-47df-a058-08da4ab23f7b
X-MS-TrafficTypeDiagnostic: BL1PR12MB5189:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB5189D12321449B1FCB00048E83A69@BL1PR12MB5189.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dic+jkue90w0Lkvgw+GEhd5R3x2KGeOXyKvdSgE78Mb6YGTp8XDawBiKGlLQkl90x1UbijZ41P77sJnLELU1eiNke6UjMpTwDIAacrJQ+RmtgtWps09J5VJlAVh+P0Xfs/bmm+CMaQmqSAG+3xmaI0v15LMscIIVgCljY2qgkZ7PYEXhEj1vj33G/Q0OFBb77gtkjzPTXvBqb+Pvw6jEpMyhQqUzo3iWJ2H0yLb3TpPIWDNWTqRttTwrF4Y/NhRu2leRJQVcJbiYoI6azAHuHdJXhkOKv/TSJMMBlIEi1PSsgnh3n/E+JIaSu87uNMROS6MRhNWt1il7n5Tm5D264UWmC8B0Xm8PbYBIwSKhPL/DM/jp+f0YpxL+95afGL7WqLDYkU20rz3oshX9QJ7Kvxj54a8JxFIIWrvo4rsmDfZJzzkTrp75NICUw/PJ1mHofHYxuQ/7cWDj/v2gShfAOwmk/ROv9kA05tj7QuJq9wRlIxrn16qmrVfvKOLBn8MzGRt5JvmF+ib/MlO7Ngi75C8mWvQGLmRd4fmMRrrsMmh74MD/Tqz8V0Q5bOcZFTd/ppCVCSnmWTpNYbQFouAl3Kyw61IQtGJP0zFcaNKEQF2WehR703GJIeQvkjmlakhpwRd0vJeGRZ1I2rp82zYV8QysaMy3Htb6yb5D3nqkyKdsETjTiU98sFsWvBp6s+k7IjSSMzvmUj1Fb3KBqnylAtjkJ94qzI+muyjfpw/aPIJl5qogjRBl26e44Vdksbwn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(86362001)(83380400001)(31696002)(110136005)(6506007)(6486002)(36756003)(5660300002)(316002)(8936002)(31686004)(66946007)(6512007)(2906002)(508600001)(38100700002)(186003)(26005)(8676002)(66556008)(66476007)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2k1WGZSakM0aGRBQWRPY0x2MDlNdnp4M0NLUDVkNFV6YU1RN0pyTnJISDBv?=
 =?utf-8?B?aDYvYVB1S2pRTWZKQWI3N1ZPeFJ6aUcrWVh2UjBEYmsybU4zdDJWVitvZ2FT?=
 =?utf-8?B?STZnT1FHd0ZlVmY4YXRreVRrcUgxUTY4eG9EcFJIQ2thcHUxVnYvVTZBMTVj?=
 =?utf-8?B?WGVDdGhhK2U0Zm1DZ2lUM25wUXkyTnBtMWttL056K0NPb0FHMFRTbGx2TkhS?=
 =?utf-8?B?bVBCQzQ1WXMvd0JNRWRRbWJFdEFHL2Y3MDFFcEFJWVYyc0t1UGNjUHRHcGdn?=
 =?utf-8?B?dEx3R29XeTVnZXF4MGdFSGZHckpZQzFUdHJhckRIcHhpSENYWllkZ1ptbzlL?=
 =?utf-8?B?N3k0M3dwVTFSRVREQW8vOVc0QmlRem1vS3NDTVQ1YllEcjlETEtjWDgvd3VQ?=
 =?utf-8?B?bjk4UlRiNi84N3pDRWN5dzhueFJjMzFqc21ITy9yOFhzZUNxZTdGUktHZ3pj?=
 =?utf-8?B?SmZkaURveEJjVWh1V0JmeFlTcmVycGRDVzNEdlB1Z1puMzZwaDJQZFpsUmhO?=
 =?utf-8?B?VzdtRWV3d1lOcFlyM0xBNXlUUHVSeWw2a1pDNTkyZDVmWG9vdTF4WWtaclZn?=
 =?utf-8?B?a2xMV0x2SFl5d1RHWElWbnFTRTdCVVRWcFROYnNKMGlFOXY5V0pIRnBLUjc2?=
 =?utf-8?B?aW5GanYrUUtQM2tvSGRoNk9uYUovTnBrbjcvdDRHQzVaRHBRUGYvUDRSbkZ6?=
 =?utf-8?B?MXlHVlUrbmNJUE1WaS9LdmI2TnZQYVlHZjJNZFNPbG5YeU9MTHJxRVVKSnVa?=
 =?utf-8?B?ZXU5S2tMU1JIYXBtcE5zVWJGWUZNR1FqdWlyQzREN2YrN0ZIaWJXZlIxL2VG?=
 =?utf-8?B?Z3VqKzIxMThXTjFGV0hPYUcwMkxGUDFjU0htdldMaE80UzRGSTVkUWthUnRq?=
 =?utf-8?B?UkM3SlJFaTVHNUZPZzRmL0ZOelkzN1ZDN1pxQ0t0c3NscERlSUkzQ0xRenRn?=
 =?utf-8?B?RCt5UVdMc1RXM2FHQkdWamhPbWp6dHhEQmdNTzVHTkdXMkdJOTZqemdQeGkr?=
 =?utf-8?B?UlAyNDNxTGw0MFhTZ3JoMWIrSkRkYkhQZ1Q5VzJGbHlCaVlYUTEwcHJveW1R?=
 =?utf-8?B?OUxpUXI4ZU4rdUJOT3VFdEpYUXB4MExWSlhwRFhOL2x3UlFKdzB3VXVKU2hL?=
 =?utf-8?B?RG5HOFhFNkpTK1duSFQxaVUyZEZQRDhoYXpzVGRWSDFTVEZReVU5VnJzL2Ri?=
 =?utf-8?B?QjgyL29SRkE4NGJhY25NYmplZ3R6RWQyUmMwNWpENk9sUXZKVTR4bmRyNUhU?=
 =?utf-8?B?dkpFZXNXOHBNTkZKVlAyZEZMck9LdjNLd0h1akl6VWIxN29RZHhhMjlyeW02?=
 =?utf-8?B?VU8rTy91NldOKyt5eE1UQXpOL25NVklKRm1EaWRQOGdhcmFJc3hOZDZWK1RH?=
 =?utf-8?B?b1FGRzFCOTZUeXUyWHhoUUtaNWtGR1NKbzRKUFVWaERlTTBuYVBZbDY1QWhG?=
 =?utf-8?B?ejVXRmxidmV2dnRqeXNUZ1dIRTVtWm9jVE82MzkvdVpoV0ZjeHhOeUV0RSs0?=
 =?utf-8?B?MFlVQ3Y3c0J0ZWtuV3JhZHNHVmdLbnkvUkZramhNVy9NKzFZOE1CUDFnK1NO?=
 =?utf-8?B?MnNxK1NYZTJqaHU1NlpOUWdhTzBjeTEzbElYZGszc0NVaGdiU09XYUJOTTl3?=
 =?utf-8?B?VUkzZ3NxdklNelVoVDFRa0hvdDEycmc1eTZZMmFEaTZFdGpBaSs3aTFWclpU?=
 =?utf-8?B?RTVkNkVmeUZnVUVtc2ZOVjNuKzFCUHlNUktEdkcyL0FtUkF2OGFyRkxCSGNm?=
 =?utf-8?B?azcrUUY0NDNaVnhUNno2V2JIMHEwTlQwVGdNa2JuVElONmJuVmpxRGJOYnhB?=
 =?utf-8?B?cHB5REhud2p0N2lidWVnZVVYQUxsbnNEYzRicG0vL2hSUEMrTCsvT21CTUpu?=
 =?utf-8?B?SGlRakZydXIyY1BIaEhtRTBBYUR4Vm1ZVURwTmpHN3JPbjdESkQ1NXRkdU9i?=
 =?utf-8?B?cVJ1cW1kUDFBUDN3Q0VaKzNrRG5Rem9JbDI0b20rK0U1aE9MUkxtandiem9u?=
 =?utf-8?B?TVUvZnlXWGk5eU0rRHlJclkrQk96b1F2WTZ2RDhLZm50QzFFUzNaL1llczZD?=
 =?utf-8?B?MGMxNDZDRHI5akZTby9KVGxWOTd1am9ENHY4M0kyMzRVMkhQTm5RWDRIRURV?=
 =?utf-8?B?QnQ1RGxSdlJoMDRncXQzY1J0a1FmY1RVQmZ1R2Fha1VIaWoremJsaXZuSU1l?=
 =?utf-8?B?QkJ0YVVxZS9Da2VTN0h4clZlb1lNSkVWRGxZbEswRlZseHo0YkxuTUhCRUtj?=
 =?utf-8?B?WWdEYWtoaWt2ZG1mN2w5VzQwMXEzUDVnYzZHT1RuZjN6RmtGQUxack9DUzRH?=
 =?utf-8?B?OTlXdWZ6cDlQSDBHa0dWNEZodWNJbTdOWUhrbytGUWlsOGZqOFVzZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09589f81-332b-47df-a058-08da4ab23f7b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 07:24:25.8234 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PcooZvNhIYs3zT25cJ4Q9WkUGRuTsCGCjT3oOpnxi18eqrdvgXIuZAlX26iW/xgy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5189
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

Am 10.06.22 um 09:20 schrieb Wan Jiabing:
> Fix following coccicheck warning:
> ./drivers/dma-buf/st-dma-fence-unwrap.c:75:39-45: ERROR: reference preceded by free on line 70
>
> Use 'struct dma_fence *' instead of 'typeof(*fences)' to avoid this
> warning and also fix other 'typeof(*fences)' to make them consistent.

Well that doesn't looks correct to me.

*fence should be valid at this point, why does coccicheck things it is 
freed?

Regards,
Christian.

>
> Fixes: 0c5064fa8d5a ("dma-buf: cleanup dma_fence_unwrap selftest v2")
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> ---
>   drivers/dma-buf/st-dma-fence-unwrap.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
> index 4105d5ea8dde..1137a6d90b32 100644
> --- a/drivers/dma-buf/st-dma-fence-unwrap.c
> +++ b/drivers/dma-buf/st-dma-fence-unwrap.c
> @@ -56,7 +56,7 @@ static struct dma_fence *mock_array(unsigned int num_fences, ...)
>   
>   	va_start(valist, num_fences);
>   	for (i = 0; i < num_fences; ++i)
> -		fences[i] = va_arg(valist, typeof(*fences));
> +		fences[i] = va_arg(valist, struct dma_fence *);
>   	va_end(valist);
>   
>   	array = dma_fence_array_create(num_fences, fences,
> @@ -72,7 +72,7 @@ static struct dma_fence *mock_array(unsigned int num_fences, ...)
>   error_put:
>   	va_start(valist, num_fences);
>   	for (i = 0; i < num_fences; ++i)
> -		dma_fence_put(va_arg(valist, typeof(*fences)));
> +		dma_fence_put(va_arg(valist, struct dma_fence *));
>   	va_end(valist);
>   	return NULL;
>   }

