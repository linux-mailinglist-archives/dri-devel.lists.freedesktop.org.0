Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 778D7592B51
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 12:05:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E088ED06;
	Mon, 15 Aug 2022 10:05:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2047.outbound.protection.outlook.com [40.107.101.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3763E11B8AA
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 10:05:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jvKUIBhcYs3cwj07ePQUrVgnZeMDygvgHT16W4zEiHvuIBG1OwI4RuQw+GruLnBE7Nigvzq6kwPo1TLhuM8clwfJR6AAL+mH8HMGy75YXUXx5i5lxQE9umFK5EOf8ivYTVCCYD5v20KkGQUzzZetCXfxxc5t+/r9WeTbuu7DkRjbCvU1mkwuPsUAIQDwVdNvlylQB8or+m/kzJamJAKY4uzS15b9wlmKPEU8EYhPmDI9WH1k4w15bdnzp2JbfMXrPeQqE+puG5RNUt4RtqQv8LdwcdJ3EWyP+opZaga/2CgehEIhwmwKkDlzRyr3QuxIan0x+ocpH6sZ/EX4SVs8jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=busVxPcjXjU9hp8tSTZVrMBu+u+r/efknOGGHNiBqzQ=;
 b=eIJkDc5qUgmWpuX8GQ/wkOwktSkRr6aoK2QtAwoRwpH/B3l/XDrcrUpxiP4DgfQDkKzsvFr2B6ZeS9153etDhXESBpqeiVgm/9g/YoRjzqdT/uE0bvF6Lj79KOBOro5dT1UG+wMlIPj8gqpOd69SqINWbkPrfaDPjdV4uVEMCNZX9wnsoeXbmBklEnsVNYtK+5ukWHZobzNkrrPfdispq+iHT9pzo3vayh2SArO85qiErL35j2umr2QLxdMmtAc0dABAAEXSfKg2iP6XMIUHhM09Q0JEZ4WuAd2se4kspmXZIxaggJ/SEVyRhMZq+FDaNz/FAZ99X6AVjWbmqESnuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=busVxPcjXjU9hp8tSTZVrMBu+u+r/efknOGGHNiBqzQ=;
 b=sw8LnHqjRnRdbltKu/pIkVHNiiflFDmaY60ZRZTt9W1/CX76bPvvpRYgmqpEXYBMEdDenFuVWGYClzgr7vRf4VRrOWRQG8xLwfN3WcdlBFRnMSHP7Xj7C7bLicaXGdibEWXYSrAUDk5QnGzcH9YYuth2WVM8FkwfUEOdp3cShMY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB5735.namprd12.prod.outlook.com (2603:10b6:510:1e2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Mon, 15 Aug
 2022 10:05:25 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Mon, 15 Aug 2022
 10:05:25 +0000
Message-ID: <8230a356-be38-f228-4a8e-95124e8e8db6@amd.com>
Date: Mon, 15 Aug 2022 12:05:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1] drm/ttm: Refcount allocated tail pages
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Huang Rui <ray.huang@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Trigger Huang <Trigger.Huang@gmail.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Antonio Caggiano <antonio.caggiano@collabora.com>
References: <20220815095423.11131-1-dmitry.osipenko@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220815095423.11131-1-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0067.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::44) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43f5057b-5ebd-49f9-e908-08da7ea5ac77
X-MS-TrafficTypeDiagnostic: PH7PR12MB5735:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QRnFXOo35VrhHrsU8m7Dapit6e57JzZ2elIV3z/ptjSPbBnjWiWiHvLIpCNn2S/E8JXXn9rxJCQ7ZQGee/fB/shC0nxeG/jnWqCZtTj85yy4Frkc3nlYmaUH5XTcz712yNek5CfJXdEjzdcQj5ucfC87k5ToEad+JkxnZhFood/aKIuUNeUVQai19Ru/I0+Ur96wtpYd6ijC7M8n2NZMdgz3JJucDuXPnH5XPk10D8oVUwigRBYuhg538sh04+YKK3xL/eU9c0t5uU0wxl4S8mlRPc5rTx8aIfEmBCIoO66a8DQhYuk0mIM4Y5i0DPiQLsL39HskKqcurq82tXhCTNtvBWFffyXtfs9cVjSBSKH4uLKmISaRAhbl2VI2G++6taZa8UdOuwYRtQHvWiAWR6UQfAQ41NZqs91Vv7qSaPJIz2nTAz3nPCPhUbu+QI45WzjJvpTIQTFxblytsTNqxNiRrg+uNp/q5o3n8iNIEERsKGI2G4enjsM+BHi9+V/9SXs6bDrLojqSxb8Dj0Sf+UwGq8nH54nxaBFUSgkRqaiBI8OKHXnPE81pqK73k6X5Ahf7hOD0YTkGsM+2nN8+5w2h9BEgcXiJswF6JZq2vfyAoAAdXs4/NWQajopHIk6Nl6KY+J9eOLV1ngT0pmABmL1IjCAu6K63A8mdgl9yGFXF8U8cAd5YdqMgZUwDL3ASx8fhnBeO6+0GfZzrqeh8xcJvPnoesjiiy1YbhGL0GSDN8D/v/mV9frD+3f2Ozq9D8MeYGEl9GsUTcNeSD890wWLYv6ZpemfFaOVLLb/eMDYCEkxiEZ/HnqPyYQ/+nL6vKTIEHDqsHzoNwuf6oPYBr0mAGaVFJf0CV+93smNcnS8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(6506007)(478600001)(41300700001)(6486002)(966005)(83380400001)(5660300002)(2616005)(6666004)(6512007)(7416002)(2906002)(110136005)(8936002)(4326008)(8676002)(66946007)(316002)(31686004)(66476007)(31696002)(36756003)(86362001)(38100700002)(186003)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmx0WWZRZk9lcWZGN3ZuNXJaczNTaE92N3loNklxM0RtNE1DU01oNUkyY2FS?=
 =?utf-8?B?cVNvWVB0bFh4TkptSWV4a2pYb0twcFFCYmFxT0hOb28zejJHYlhmOUpKSWNT?=
 =?utf-8?B?eUhuREhDKzQyRVpwYlJHTUtINTBKL3hrOUtWRnVBdjRIRS9XbEttRk5SMmFy?=
 =?utf-8?B?cmwyQTVPQkU5TVRsWUE5WTRtVHVLd0VqZzJ3TEMyRS9SZFV3NkJleG1mV0JR?=
 =?utf-8?B?a0kxZitjcUNzdlVtYU1UQmNkTGtIczFISlJsSmZNZGF5clhFYmhmZjBiUnpN?=
 =?utf-8?B?dlE0NU1KZndURnl2L2xjTGc3WFpVamFlSm9xOW5ISHBjbElMaXZOVnkvd21T?=
 =?utf-8?B?S3VTVk1WcTl5dUprSkRocVlRa1hhc05LM1ErY3BtL3lmQ0hwOGNjOWlDR3FR?=
 =?utf-8?B?UVFoZWM2NDZOZFRFRUNBVm41aUlPdGtwQWxRTDVCMTVaQkVwWVJMZ29EOS9W?=
 =?utf-8?B?aDdqcHFXV1RxMkdnVW5GeityUWJyK2p6L1VodFI1Z05mTUVUdThkUWVocVN1?=
 =?utf-8?B?UWpSVTdlZmlLYlhSSk5HeXI2TTBVMCtBSXl4SFRuSFBlZ3VobjVHTW5QdzFW?=
 =?utf-8?B?TUE4MThCMzRIVzJiZE8vWllEM216WWZqU2FWS1RWNFcydWh0c0MyVk5GQnR5?=
 =?utf-8?B?eVNoOVZ4MG9id0tXU21VdGFaWDJqMHY3UnFOM05zZnNLOU5POGl2dk1YVEli?=
 =?utf-8?B?MXhpL1NWZUZtVXh6SE1GbmZLZGFQcEgwNWVTODhIOG1NMVc5TnNlWk9xS3Fu?=
 =?utf-8?B?RjRYRXBmQWNJTXV1bEpKaDJEenRWMVl3eHpTbzFBV3RyR0oySXFOQTJBSi9p?=
 =?utf-8?B?R1hCb0RvS2M1S0dVUGtUb2sva2FxMWNMdWdUclN0YUpRbFZORnR2RE9iMU42?=
 =?utf-8?B?M0lnemZLalBVZzZQMmRlNnZ5ZFBNVU1yUjlHdFhZZGt5RzZBWUt3MFhOY2RR?=
 =?utf-8?B?WmVoRjVuaXpNdlEyT1UyaFd4TWhaSEZXZWpodjQxOVV5U0RaaS9OL0FNeGhX?=
 =?utf-8?B?dkI5RXpHWUNrK3NCb3dRYWJYWVptOGMrY3gwWlN2SVVWNnZiU2dIZWJyRDJk?=
 =?utf-8?B?ZjNobHA5UzV1cTVPeTExR2NySnNCc2VjNXlkYzFGaXZ3RmlsZ2I2dHgyWU1E?=
 =?utf-8?B?eG0zaUtMSlNIT3hZc0d1eGQ5Q0x2RGpwT2VZeXZUUHhPNnhhMkhiTTBnK1ph?=
 =?utf-8?B?N3UrMHFJQnNZZDZFMUpraWEvSjY5L3J1UFJKNWhWRXpLZ1FaUnR5eWRabkt0?=
 =?utf-8?B?a1N6YVUzaU5qc0VCbmJnSmh5bmFMWCtpOHN5ZmZZN2Y3VVczZTdDSjRKeUVt?=
 =?utf-8?B?QWk0emJ0M0pBSStXYW9OR3p2WmNKU3psS1cveHR0bXpIVENyaEVGSmNqb3U3?=
 =?utf-8?B?VWlEM1lORFBWVGxNZXJ1M3pCdlFvd2VCV3lzUVVtdHJnRE5qbmpsSUY0WFlo?=
 =?utf-8?B?UXVVOXU5eW1Wb0poY2FwK1dJb01ldDFKdXlOdjdZd0FVZURLeW8zMzNibTZl?=
 =?utf-8?B?eXdlcEhGTFZNVXhWSm9PMDNRK0doOFp2MWErMzU0bEN0VXpNR2tlR2VEclNm?=
 =?utf-8?B?Z0xnZFBQQ001cCtFbFJEM0dDTUdHeC9URTVuSFNlSy90a2JlTzRxa00xWktW?=
 =?utf-8?B?bzdPeFI3djBBSVB0MWFId2lOekE2aFRsbUQvUFpYMmcxbU41eDM0MUk5NkMw?=
 =?utf-8?B?YkxkbFowWEgrVEVhRkdJalpkUnFxVVl4djNBNnNtNVhGWGk0Vk5TRHY0RjBS?=
 =?utf-8?B?V0xoTkpRVG51UzM5WTBGalZJZDk5V1VqVyszVUZnZTNRV0xhSXN1NzloNy9n?=
 =?utf-8?B?U0xqWGVISFJrRFlIZjVmQ1Bpb2xETTRvc3A2MUdONkhCN2hzNndDcFFRekxY?=
 =?utf-8?B?WFRBS2o2N2dHajl2UTZkVUt1c29mOTJaUG5qa21xcmFGWldIQnNWZWV2T3F6?=
 =?utf-8?B?ZkhGeE15UEJqK1BYMFJLZkhLNmk3RnNIbkR1YVdUakVCMG1RODA1ZmhMZkMx?=
 =?utf-8?B?VFVkOVFFRmlMcW81bHB5SS9RODNEVHFEcFpZYTAzQnRHdkRwdFFQcXIzK2Jl?=
 =?utf-8?B?Y2hJRUFWY1BPaEs4aVNuRVNDRGpRQjFwbEQ4T20zN1JXbGlvakhlUy9nc0Y2?=
 =?utf-8?B?L05acDI5bTVhUk5hUVFzRmZIQmJRK2p4dG12VWdNR2tSdjZiZmUvNUl4czZ5?=
 =?utf-8?Q?YRulCpjWSN9gBvcXl37DYsB2haquMC4cR9kcVk4JhaId?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43f5057b-5ebd-49f9-e908-08da7ea5ac77
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 10:05:25.7558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /6VRfjQV4flZGWYcvu0D+TA48xXe33CXtvuInsmpz82IXHhCjx7m0d1VoFVZLNwl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5735
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.08.22 um 11:54 schrieb Dmitry Osipenko:
> Higher order pages allocated using alloc_pages() aren't refcounted and they
> need to be refcounted, otherwise it's impossible to map them by KVM. This
> patch sets the refcount of the tail pages and fixes the KVM memory mapping
> faults.
>
> Without this change guest virgl driver can't map host buffers into guest
> and can't provide OpenGL 4.5 profile support to the guest. The host
> mappings are also needed for enabling the Venus driver using host GPU
> drivers that are utilizing TTM.
>
> Based on a patch proposed by Trigger Huang.

Well I can't count how often I have repeated this: This is an absolutely 
clear NAK!

TTM pages are not reference counted in the first place and because of 
this giving them to virgl is illegal.

Please immediately stop this completely broken approach. We have 
discussed this multiple times now.

Regards,
Christian.

>
> Cc: stable@vger.kernel.org
> Cc: Trigger Huang <Trigger.Huang@gmail.com>
> Link: https://www.collabora.com/news-and-blog/blog/2021/11/26/venus-on-qemu-enabling-new-virtual-vulkan-driver/#qcom1343
> Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com> # AMDGPU (Qemu and crosvm)
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>   drivers/gpu/drm/ttm/ttm_pool.c | 25 ++++++++++++++++++++++++-
>   1 file changed, 24 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index 21b61631f73a..11e92bb149c9 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -81,6 +81,7 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
>   	unsigned long attr = DMA_ATTR_FORCE_CONTIGUOUS;
>   	struct ttm_pool_dma *dma;
>   	struct page *p;
> +	unsigned int i;
>   	void *vaddr;
>   
>   	/* Don't set the __GFP_COMP flag for higher order allocations.
> @@ -93,8 +94,10 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
>   
>   	if (!pool->use_dma_alloc) {
>   		p = alloc_pages(gfp_flags, order);
> -		if (p)
> +		if (p) {
>   			p->private = order;
> +			goto ref_tail_pages;
> +		}
>   		return p;
>   	}
>   
> @@ -120,6 +123,23 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
>   
>   	dma->vaddr = (unsigned long)vaddr | order;
>   	p->private = (unsigned long)dma;
> +
> +ref_tail_pages:
> +	/*
> +	 * KVM requires mapped tail pages to be refcounted because put_page()
> +	 * is invoked on them in the end of the page fault handling, and thus,
> +	 * tail pages need to be protected from the premature releasing.
> +	 * In fact, KVM page fault handler refuses to map tail pages to guest
> +	 * if they aren't refcounted because hva_to_pfn_remapped() checks the
> +	 * refcount specifically for this case.
> +	 *
> +	 * In particular, unreferenced tail pages result in a KVM "Bad address"
> +	 * failure for VMMs that use VirtIO-GPU when guest's Mesa VirGL driver
> +	 * accesses mapped host TTM buffer that contains tail pages.
> +	 */
> +	for (i = 1; i < 1 << order; i++)
> +		page_ref_inc(p + i);
> +
>   	return p;
>   
>   error_free:
> @@ -133,6 +153,7 @@ static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
>   {
>   	unsigned long attr = DMA_ATTR_FORCE_CONTIGUOUS;
>   	struct ttm_pool_dma *dma;
> +	unsigned int i;
>   	void *vaddr;
>   
>   #ifdef CONFIG_X86
> @@ -142,6 +163,8 @@ static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
>   	if (caching != ttm_cached && !PageHighMem(p))
>   		set_pages_wb(p, 1 << order);
>   #endif
> +	for (i = 1; i < 1 << order; i++)
> +		page_ref_dec(p + i);
>   
>   	if (!pool || !pool->use_dma_alloc) {
>   		__free_pages(p, order);

