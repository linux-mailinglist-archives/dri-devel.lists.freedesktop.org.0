Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1B8494960
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 09:27:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16C910E897;
	Thu, 20 Jan 2022 08:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846CE10E897
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 08:27:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j1wuLaJilpk/JTY8rUCCZd5s+1CXDnZb8CEhIjET7u9JTXkwPXz2REbcMp2c0A49IreXQyVc8qnVuzn6+7nT3kajLH3uM9/++d/Z2LZeDmiZ0MCZSkMfZEPd4ms6ex2f1YTrS5seAMTwp++J3WzFsRgHgFF/gYAxqpomW5vi81XOWuNmh7gNJ8E5Nc60EWuIR8AxpB3dP6SjBQddbhyuU/2iaxCdMOSiZypIdeg3HFEFarzD90nrlOooF9ye8JqY0vJx6YMoBXhxy3L2xhfJ5GNF8zQZQSdZ39NDOWPV+prSw30GaFlav9dAloR0/28ixO73HoUoylZHDngLURMgmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1rysZiG4UGhNNNvhAM3cux+5flXBDTqhEIgIn35uiOs=;
 b=S+asW6jkzsxbY7h2iSKuYKNttmWFISdxh/QzbDzlVpoFBJEbmYPL4Px1mk18ycMNCifB+4KVGF4Yy2ZiORQjz8awZqp9VSj/V29+x74OjgiEtkN4BXWvt+raEKdOvcEIdyXSDk683LL5iDBw3z+SwMzsbHXG4uZNoDV9AsCcS3nVS0DH2uTRHYYe/KfzPTER5H8sbeVnzg8NpqhFFF8fU/etGJTnJ4IhLt5/22rcTke1LuHkR1hn73GvpADd87XKXckNSzU4d1DBk6WijRFRBSvehPAD8UT6jLXsg+PB1WtRZk4ba5jlev51c7nz+SO2h47iMhyUL1jrBd0UURegbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1rysZiG4UGhNNNvhAM3cux+5flXBDTqhEIgIn35uiOs=;
 b=eDI70+aX0Bu6PEbe2dx8HQVHfUIHsvoSU03ug0j9q94dokcSuhw3OMA61ZN1eew7Yv3oWoui8twEOoNHeieZ4pYjRVn4e3nzj9jlN9Vf2WnHYfR3Oa+ASqqx0/F+HiEynHN8DXdVDnCbz/FjU3r63JLzbEGWGhH7miOCyR9uZRg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY4PR1201MB0166.namprd12.prod.outlook.com (2603:10b6:910:24::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Thu, 20 Jan
 2022 08:27:15 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::b03b:7df9:d733:13b2]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::b03b:7df9:d733:13b2%5]) with mapi id 15.20.4888.014; Thu, 20 Jan 2022
 08:27:15 +0000
Subject: Re: [PATCH v5] dma-buf: system_heap: Add a size check for allocation
To: guangming.cao@mediatek.com, john.stultz@linaro.org
References: <CALAqxLW5uEZCGHGk3rYoiOGzN5XMKb39JzoPB1iEX9k3UsiT-A@mail.gmail.com>
 <20220120070850.95495-1-guangming.cao@mediatek.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <4f2631d3-0845-cae6-6fc0-9c00ce6301ce@amd.com>
Date: Thu, 20 Jan 2022 09:27:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20220120070850.95495-1-guangming.cao@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM6P193CA0123.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::28) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cdcad070-091e-4af3-3ec8-08d9dbeeaa34
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0166:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1201MB01665B4EC85C1B28C20F9560835A9@CY4PR1201MB0166.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QZgypRwSv5fmwZzn3GRLr53Qxt+34q7AwKC/H967ngLLgBiWeiox5Usv9ctAubcx5rcAf923ZKro0NZFEUBxQ5uFyM40Kv8Ih5LH44k/2WaZG9FazQx+JAbREVjMC8vLaMPwRZkuPvIQzcnvHN/jaYamy4u+vRUJDpr8MCsnPCmaglKqX6PBKin+m+uS6KibWtlqz3C2JwKtHS6PFv/TnvgdzgU6g+8B962WLhPmF0AZSISCH3SAzCPzFQOj13L3Wp74Uvbv29MUsC68q5aeENYmcaZINCbDI9qw8gMMMdfGxZdgsEpl6GveI40pQZh+nBxk8BR4FUOdeQddg3rtFqxex5oXcn4UqMEl9awVtmFCLz/NAmnEiBLB9T9iLVWfYPgLpK4s7djtjq6QCAAuzabJZ2BXHIPT3G1abqg2Ww730wob4rWt9h7/J1o9CEv3K8JaI8qTvk1HBL7gA6+SUYCX73NdV/UPEQJpOSY6BcCTMmNtN0FEKc5gQIzvHM21aasn0o+sY2U145uAptcViOKDCepnDtirFtpc6oi8TZay+Rbm8FZdkdddWmkRUfJhNHD2bGsHjRsJfU1mhFDTQ9qZWYGktGvIFZ3Bwb4ss380twKLaJtoa1Rd+JC/SMfrvqaX0SPg1rBVr0LO0NvKflhxwO2ggNHfnIH1dO+cZoAnVWCGYK42aMuzk282lL5QjwCxDPn08pOpIw4www/FlcDyhQZ31vWddUUFcORWSJ0uykUOX3YhC2JywGmuTzv/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7416002)(31686004)(6666004)(38100700002)(508600001)(5660300002)(2906002)(8676002)(86362001)(316002)(66556008)(66476007)(66946007)(186003)(8936002)(26005)(6486002)(6506007)(6512007)(2616005)(36756003)(31696002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3JRMEdGYWhqcTR3dVpzRTBvM3ZZMk1SalpzMDZabUU0T01ZY09WTThQNkFT?=
 =?utf-8?B?OUo2SUtDMHl0Y2hSbmYvRkUvV1dHa2hvWFBBZEJmalVDMU5UaVlSSVVGbWZB?=
 =?utf-8?B?QVhwenBMd1gwaHpYeUN0STNCZk4xcjQvZDJwRzRyeSt1VE93a3BtdGhvVE5z?=
 =?utf-8?B?ZjVmK0Ivdnk3UmhUUGxBQndrRmR5UnZwcjhHU3NHRkU3eUFBV1dFN2lhanNs?=
 =?utf-8?B?ekYwdGlIdkdocFQ3M3Jsb0FlcVdIVURyV1MxWFRPa3BITG9zdFg0NG5hNVFx?=
 =?utf-8?B?MTlaTlFSVklkL2tDWXJCTGNwUG9memtJbG55K3JCTldWTFN6d3Vjd0xZVEtp?=
 =?utf-8?B?Z2JTejU3cnh4KzFaaDAzOVMvTlVhcUx1UGJkMFpjZWF4YU1pKzY1TXEzazNt?=
 =?utf-8?B?NmtFUWtzcXJkbTJTMHdrN1U0UVZNUUlvbW9vVG5CRFZ4cUdsNTQ1ay9iNHVN?=
 =?utf-8?B?d0o2Rkt5eUZXRUxxY2w3MVpYSjA3QjhMYU9FdUJCMHpUOGVwRy9NSzl3dlZJ?=
 =?utf-8?B?TnNzTWRLSTFSckhkdk02N3Nlc1N4OHNNNUVwcFY2S2Q4Y2pOL1RlN1JIRkZw?=
 =?utf-8?B?WXVZNFc0c2w5RkpVUm9JWm15b01iYmgzVVNYcllucU9zb0c0SkRIbGNESFNP?=
 =?utf-8?B?ZDRxVG45aWQrWmM4S0huOG5aTUFwTUI2UUtQdm1TQVJUVkNjRHBCQTFFVGxp?=
 =?utf-8?B?WENKSzdGQTRCc2VvV2VNTkdNaUl3UVFmOXJzd3lCRjVvZHdPTmtjU2djMHB0?=
 =?utf-8?B?SmNtd0dpL2NxUjBPYVlvYVpQM3dvMVpUVUc0ZWw0M0JlTTBUNTU5QjNZRHVu?=
 =?utf-8?B?bWZDUWlTRHgyazNlQjVwMHdEQXZDbDR5dG5hZ0s0VzlmOE5TUFgrcDlJNDFr?=
 =?utf-8?B?cU5OMTVkRjZNdXA2b0hIeHFtdnpXR3NvNTdyanNlN2ZySk5wSVo1YmlITlE3?=
 =?utf-8?B?SEFRVnJFajV1blNKbTBSTUFXZFhzZnRnc2VpS2c4eFExWXBSSHowbXE0L2N4?=
 =?utf-8?B?K09vRHBFUlg5WUhFc0xWVjFSTzludGJER0x3RmFzZ1N0NFQwdWptbDZpMEVo?=
 =?utf-8?B?WGYrbTkxM1ZCYjRDU3o4dnl3MHNxUjdjbHliVE5XR3daT3ZUeUpieDhZUkxr?=
 =?utf-8?B?QmtGSGNITjNlcTFFNkQydWdsamROT2xKMVBLRzBFd1VPZUQ1b2lBZVEzWHlT?=
 =?utf-8?B?TEJINDlCRm0wV01LMVppNWxCWCs1eG1UUmQxaUJ3V29FYllPT2JwYWpNdEta?=
 =?utf-8?B?U3c2dVVjZkZVMUtLY3hvaTRhTVhYQUZxM0UxVUMrandsNzNPZHVON2ZWY2VE?=
 =?utf-8?B?dWI3V0J4Ymg0bVlHcmxkRDV2aGhSSDVUMnVkYnp5TWJiUkpaNS9RRGlyd1NI?=
 =?utf-8?B?Mk1valdrR1FSSkpYTjRTYWdRMFNFRTJwTUtFdGl4dkZYVnpBODJWQVZZSDFH?=
 =?utf-8?B?K3JCRFcybkpYS1Q1V0w4L2UrMnZFb0d3MFlYM2lIbzhNRmlBTXdLaVZxVUM0?=
 =?utf-8?B?MEkrN2N1SmtIVzhhRlFYRnQ0cm91bjhxVmJpaXlacFBzNEpzbFdCWll2ZG95?=
 =?utf-8?B?cWkwWUY4TFgxTk4rR0pNcVZkT1JQTTlqdWhVSWliY0loZDdxK0ZvL21ucXF5?=
 =?utf-8?B?SEpMRkVsay9yU1dFa1hWRS9YYUl3OEZhVUJxa3crUUpXMjluVHlCc2hGdGVy?=
 =?utf-8?B?N0I4STRHZGlaSHNSTnVOMUtsdnZsTDJyT0QzbVdOcDREQTZLdHhJU01wMWc0?=
 =?utf-8?B?QndRYlNEaFNwLzg3SEs5b3lDOGc3NDYreTkrbHdmTXpxdGVaN00yVzhucGZo?=
 =?utf-8?B?QWh0Vml5NHc1dnhZRENCUGx6ZUhJUjJtNEN0KzJCOTFKYWl2bFd1eFZXR04z?=
 =?utf-8?B?WGdLamJab0oyREh4QlVkMnIxYTRMcXpkU21lOUZiQkl0c3BTU3lNMkN4QXdu?=
 =?utf-8?B?bndSVGJUeUZTUHA5ZmRodVVoS1MyYk16R2Y1ZWJTS2c5ZnViRGxrcXpVV0w0?=
 =?utf-8?B?dWdBTlBRYTQ0SjFmOWZXRjljNjZyZ0hJdWdyOE9melhBOGVBRTBPZWFCbG5x?=
 =?utf-8?B?MWNXL0hmM1J2czBtM3Byczl2UUVCdWJnSDJGcTJMQXFXaEUrVGF1VkV6MEVJ?=
 =?utf-8?Q?TFRQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdcad070-091e-4af3-3ec8-08d9dbeeaa34
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 08:27:15.5604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /o2k/W03+DevVZf7n8BPiWZHnvvDANPP8ZZTRp/KyTLOcYSAczgmR194EnU+v0u5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0166
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
Cc: linux-arm-kernel@lists.infradead.org, linaro-mm-sig@lists.linaro.org,
 lmark@codeaurora.org, wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, caoguangming34@gmail.com,
 michael.j.ruhl@intel.com, yf.wang@mediatek.com,
 linux-mediatek@lists.infradead.org, libo.kang@mediatek.com,
 benjamin.gaignard@linaro.org, bo.song@mediatek.com, matthias.bgg@gmail.com,
 labbott@redhat.com, mingyuan.ma@mediatek.com, jianjiao.zeng@mediatek.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 20.01.22 um 08:08 schrieb guangming.cao@mediatek.com:
> From: Guangming <Guangming.Cao@mediatek.com>
>
> Add a size check for allocation since the allocation size should be
> always less than the total DRAM size on system heap.
> Adding this check can prevent comsuming too much time for invalid allocations.
>
> Signed-off-by: Guangming <Guangming.Cao@mediatek.com>
> ---
>   drivers/dma-buf/heaps/system_heap.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> index 23a7e74ef966..459dc18bc4a2 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -347,6 +347,14 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
>   	struct page *page, *tmp_page;
>   	int i, ret = -ENOMEM;
>   
> +	/*
> +	 * Size check. The "len" should be less than totalram since system_heap
> +	 * memory is comes from system. Adding check here can prevent comsuming
> +	 * too much time for invalid allocations.
> +	 */
> +	if (len >> PAGE_SHIFT > totalram_pages())

Maybe use PFN_UP() or PFN_DOWN() here instead of open coding this.

Apart from that looks good to me.

Christian.

> +		return ERR_PTR(-EINVAL);
> +
>   	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
>   	if (!buffer)
>   		return ERR_PTR(-ENOMEM);

