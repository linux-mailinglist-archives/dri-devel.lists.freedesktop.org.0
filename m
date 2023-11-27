Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 275087FA066
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 14:13:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B4710E264;
	Mon, 27 Nov 2023 13:13:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 546FE10E264
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 13:13:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pm/wfceFBVEI9eHbwrjfWFxYHJlHR9REqM5uycV3TKPhVjb8O29wyidAQH7EappsZ61zkHIgGeWSuxXKTvArNqOie1gKmhDTgdG4aq9RK4hvkB/YiISfQZgxrYwM7W+ogrjs9EJ4K28dN0GJPLT1bs7GRS33ZoMGflZ+UIidO7v1bJqqTiLjNeB/wxTaVs8oiow/cL+VfHI6dKIgamV+MO9utOmoABm7OCSsfTdsLprYMLYb3clN2tclsHrBdyNaymmLBQ+vfU+JQA2s+B8930hlMDX7jBuA7kDaO5trz2zlNbJRyZHWnXMFWNzVcGH1dGOQTc5JPFiNQ9svIXz6aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVx/tN7qe08CK7OPPtdR/pqt6J8ywFDSqlW3RKARtG8=;
 b=Qkb5V/jnRHYnUX/bvzoRGeb70fuZD/QPp5Ux/g7XH9nKfZbDUnGSiJUaQJbc+4uYdRtbaIdMisGwv3vTnrPs1KHV4/quYHzoKGzFwAlLWq7LLufN3Mls5rH3cso7yrMaE5qFRvdO72fApaLWvqhneKVNiM1Bm/91acOdPVimhZM640ab4EXYmdzKJu7W4Fy1LsyXMSS3ls0+ZAVcMUI+ymPcF3Sv70NLaAAhhWuYFooWbp1arkbvJflZAVw2Uvdg0PW4gk0kf44lTrSa5zKZBY9KmSofC71NRQJSO8oIpF20nwyEm1OWggDOKULjlYs3i1srf3DajbQFRbi4bNV8Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KVx/tN7qe08CK7OPPtdR/pqt6J8ywFDSqlW3RKARtG8=;
 b=XpKEqaRMcnbHBnl4lRd/jW4RurgRhtYOTDP4B3MJZGg1L4MjML6XvWvN0WPClif7RFKqG/zYVVIBOHi4m29EzFzlpkfiSX6doXrM+CVUxhbs5XUIYKTLvexgc8KhT1LWQMg9V3CHEB67RGb+FhmTJloi9t0IHlL6XvbyejmHyzw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4287.namprd12.prod.outlook.com (2603:10b6:208:1dd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Mon, 27 Nov
 2023 13:13:01 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 13:13:01 +0000
Message-ID: <ac9aebe8-ebe7-439d-90c2-0fa2c0e630c5@amd.com>
Date: Mon, 27 Nov 2023 14:12:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Bug in the error handling in TTMs pool implementation
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>
References: <78a97668-a97d-4637-969c-e724a7423909@amd.com>
 <b6b1dd0d-f53e-4b65-acee-c55bd76572f5@intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <b6b1dd0d-f53e-4b65-acee-c55bd76572f5@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN2PR12MB4287:EE_
X-MS-Office365-Filtering-Correlation-Id: 330ec2e7-ff05-4e80-9bd3-08dbef4a94e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uP6VbHvodRz569wC8QZwbRfmcW2b0qohi623FMKNLvk/KmGO0t+Si+KTKAoGwm7AoTsAKEwcch8ppdVcA+tIl2hwMOKHoHfVtddo0UoH4gOAMh/IGVjgBhiShtEGcOpwBgRv/aAs6T0kQGHQlrkTQRUt42Su0chYcLDxfw3PmuPxA62T4tQlW3BgD1UhTX3SUt7GNPS3bRwxTWt4T+kBiBqN3/i8zodBZsQ+X33QobrJNzno6vfQFtt96UMaiNvHV4HncpR6liPmcUI4oMfEp+zxgmsrf8TZuaqBlnfbM+s9phVLUOrQvkk7RR6XkLV1DAXltjK20K29JKfb4y0AEFO23JuLc4ym40BVuCQ+u42nPz9OR/4J+lMGY85xNb1ou922X8OtrQTkOFm0nH9RQcgIBMtfArHjwfiLdzHOVpWBMp9cSRPj5mSFtP+xOSWB9dZ59gmitokAYUjen4eHHty/q60DRZ4dKQa+Xc21N4lxEjr98Lid0Cqtii7zlBteMQ5b5JTF2SNL8KvCeM3nR2lTmvnNUHuwBQdTTF1nZBoWLo0tojml2VgrZLj+Fo/Yzw+j9WJAKrCYzxYJlFm9FA1mgaYpq70BAdxFWfz2qxz2EWa+343ffTlh8Mz+0CEnVJBPePyhh7bB3r7xHGU/jQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39860400002)(366004)(376002)(346002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(31696002)(86362001)(38100700002)(36756003)(478600001)(6486002)(966005)(66556008)(66476007)(6916009)(316002)(54906003)(66946007)(66574015)(26005)(6506007)(6666004)(2616005)(53546011)(6512007)(5660300002)(2906002)(4326008)(41300700001)(8936002)(8676002)(31686004)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWx3aVR3bjZlc21JcFhDZ3FWalphcHdnSFVYK09CZ0g0dWsweFlkc2EwSENt?=
 =?utf-8?B?bXkya1orbmRQUlphYXBERzNkL0V3THlHYlRuSXdvU0hUamVlQ0RXaXhVaFFF?=
 =?utf-8?B?cFNmUjlUcG45bm9ZTXpYYVY1MFFjaGxTUlpqUUZBT0Q0U2Y0NjVqMDFsbkRs?=
 =?utf-8?B?anlzV2t4Z2pMcnVlSFVWRWJsZ3VLQ1cydkFCSGl3LzEvVEdTUExNK25oNnVq?=
 =?utf-8?B?bnc5ZVpUdXpaWi9Pa3dYT01WbFJzcll5NlhzSGlyU3IxdVBRenhlbjIxNFNR?=
 =?utf-8?B?bW1DTnlQdnFCbEhrYlBDMTR4dGkvUWI5Q0lmalBJNmJ1b04yQ0IwVVRiR0Q0?=
 =?utf-8?B?Rk9kcGNoaUFjOHIxbmo5Sk9oU1ozaXFIY1VZemV6TFJaWnh5bUhWV1FvUzBJ?=
 =?utf-8?B?dXlKdU93R2RKNzRuZ25vV3YxdVlkbFRKQkQramt2Sm5LNUlnRlRiNEJqcmcr?=
 =?utf-8?B?WjhxZHJ5eERWSkVTUFRERkwvZXRvb3lQSjY2RmIrRnlHOWVLaVRYTUV3R3BG?=
 =?utf-8?B?b3pjMUlHM0ZwQng3cmw1UVJSQURraFBjRlZWTmlNMXB6WkluN2Y3d0psb2Nw?=
 =?utf-8?B?aVFUcERHRTJjUHFxN2ZPTXJXSkxhbDZndW9KVEtFWU9tcnR1UHZ3aXd2emlk?=
 =?utf-8?B?NTVJVWVsc1ZGcFhkOUFaUFZwNXZHUXk0SCtmN1NEMkpsWjhXQmp4ZmJwVG9C?=
 =?utf-8?B?TWIvZHd6ZDdPNEl5L3p5bHM4NTZrZjViaTRKL2k5cEM0N3pNbGFNeWxOVklv?=
 =?utf-8?B?N2lzS3FqOEJkWXdGeUo1b2hxZVNlTWwwckUrVkFvVWpJdktLbElsWnVDWEtn?=
 =?utf-8?B?aWFSVmhVZDZ3QnkwQXdSSE1udnpOYlVXT2EvaWxGNmhTbExJK2tPWUFlUHBE?=
 =?utf-8?B?T3ErYzRiVlVGblFxaGNjZVFwb05jcVFpZWZUdE14Q1ROZWVqdkpCbDVCTmU0?=
 =?utf-8?B?QVBxbWZTRTBrNWdTYnppUURrb2I2Q3RuUGNuNjg1UlVOYk9HYUFnbmI0NXFT?=
 =?utf-8?B?MGU5UXhVb2szNGN1dFJucXBIQ3hiZHdtUEsrZjlUWkpDZlJON3BJRlpCTUQ5?=
 =?utf-8?B?eFhaNFJwditYa210RFdXa0NEZWJFbDlSSjNlaG9OU1JkSkw1T1pxalR0MzZN?=
 =?utf-8?B?Qm1KSlNSNW9vbDl4ZldYUmtRRG0xM1d2UkNENHZUdTV3YU8wZzdML2FiMk5p?=
 =?utf-8?B?M0tSNUpFVGJPSUZEQkZuM1BFLzhPMnpGWHVacC9MdlViVjdwY3NpUDZMWitD?=
 =?utf-8?B?YXJheVBrK0lCeEJROXpEZzVoazFoMGROdkpLUHhQYTVaQ1dabm1JMitkR1gv?=
 =?utf-8?B?TWR6NngrWDVrQjBIYTZseVJSelJyYktQYnFtdDl6dkNtNmVKdG44UTFUbGd3?=
 =?utf-8?B?bjlDSHlMS2tNR0dpWkRBWk5uSDJhRUlwYTNtcncrYldWdHFYTGJsY0hGRVhX?=
 =?utf-8?B?QjFWMHZRQ3R2dExlZnp4M3ZJMHpXc0J0aHB3K1hqVFFSMFhrQ2FxMFh3QnNR?=
 =?utf-8?B?NDhnb0lMalFuNFR6eXVuRFRqaEtnNVVOZ08wRm5UL3NyOWszZnVNTWRTT0FK?=
 =?utf-8?B?MWVpUEpyV2E1MXFjQTdMN0tuYWhoZW4ybXdNamZERlowNWZGS3U3Zml6T3lM?=
 =?utf-8?B?dU9YUVBkR21UYVN1cWlteEh4ZGk0L01QTUIwWGo4K1BhVWdGVXB6U2RnUmFJ?=
 =?utf-8?B?c0R0N0xOQk1ic1lWT0dNNW5EcFptVnNVazN0WjQyNkZwWkxxUzVKeXZYVzRl?=
 =?utf-8?B?WklJZzg1MEJ1bGZnQUZ4ZFNQZkhOVTNiWnlycXpjamZpamoxcHNtRDRPTW9E?=
 =?utf-8?B?V0lhZ3I5SjNkeXloY2lCQnFuN1F5L3FDK21BK0JWT3dQbWVER3RoNmt0NXBu?=
 =?utf-8?B?bDdTR09Qa0pNVGZtQlhQenlya24raCtZTFZtVFRtNXBvOEdNTmdkTFAwdEtT?=
 =?utf-8?B?QkJ4YWFISTFYV3hhdWFXOU5WMEhINEFUbWRNR3FGb0FiejN1Vm1aeTcvZ3hH?=
 =?utf-8?B?SlNXU1RLZFFpZ2U1M3dRek0zSkJiWGJMY05yYlViaGtsVjRXb3p5RVNSQW5v?=
 =?utf-8?B?a0FkZElKRTJ2WEY1MGQrc0tBZWQ3cTBJVEZNV3E4QXVPOC91MW1vQ3c4RXQ5?=
 =?utf-8?Q?dmbc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 330ec2e7-ff05-4e80-9bd3-08dbef4a94e0
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 13:13:00.9623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FlUiRzNmBiOVu6tLWCWogkY1vGoWfV3R5+U8H4RfI6E5wicB5JYoYQNpo00REMlK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4287
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Karol Herbst <kherbst@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.11.23 um 13:24 schrieb Karolina Stolarek:
>
> On 24.11.2023 16:53, Christian König wrote:
>> @Karolina do you of hand know a way how we could exercise this in a 
>> TTM unit test? Basically we would need to redirect the 
>> alloc_pages_node() symbol to an unit test internal function and let 
>> it return an error (or something like that).
>
> Do I understand correctly that you want to mock NULL from 
> alloc_pages_node() in ttm_pool_alloc_page()? I had a quick look at it, 
> and found a(n ugly) way to do it.
>
> KUnit provides an API to redirect calls using 
> KUNIT_STATIC_STUB_REDIRECT that can be registered in the original 
> function and then overridden in the test. You can read more about the 
> mechanism in [1].
>
> The problem is that we'd need to introduce a wrapper call for 
> alloc_pages_node() in TTM and expose it, so the function can be 
> substituted during the test. We can't directly modify 
> alloc_pages_node() due to cyclic dependencies caused by 
> kunit/static_stub.h.
>
> For example, in ttm_pool.c, we'd have:
>
> +struct page *ttm_alloc_pages_node(int nid, gfp_t gfp_mask,
> +                                 unsigned int order)
> +{
> +       KUNIT_STATIC_STUB_REDIRECT(ttm_alloc_pages_node, nid, gfp_mask,
> order);
> +       return alloc_pages_node(nid, gfp_mask, order);
> +}
> +EXPORT_SYMBOL(ttm_alloc_pages_node);
> +
>  /* Allocate pages of size 1 << order with the given gfp_flags */
>  static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t
> gfp_flags,
>                                         unsigned int order)
> (...)
>         if (!pool->use_dma_alloc) {
> -               p = alloc_pages_node(pool->nid, gfp_flags, order);
> +               p = ttm_alloc_pages_node(pool->nid, gfp_flags, order);
>                 if (p)
>                         p->private = order;
>                 return p;
>
> And in the test we would say:
>
> +static struct page *fake_ttm_alloc_pages_node(int nid, gfp_t gfp_mask,
> +                                             unsigned int order)
> +{
> +       return NULL;
> +}
> +
> +static void ttm_pool_alloc_failed(struct kunit *test)
> +{
> (...)
> +       kunit_activate_static_stub(test, ttm_alloc_pages_node,
> +                                  fake_ttm_alloc_pages_node);
> +       err = ttm_pool_alloc(pool, tt, &simple_ctx);
> +       kunit_deactivate_static_stub(test, ttm_alloc_pages_node);
>
> Christian, what do you think?

Yes, that was exactly what I was looking for.

And you are right that is indeed quite a bit ugly, I was hoping more 
like adding debugging hooks or something like that.

Need to look into that in more detail, thanks for the pointer.

Regards,
Christian.

>
> All the best,
> Karolina
>
> ---------------------------------------------------------
> [1] - 
> https://lore.kernel.org/all/20230128074918.1180523-1-davidgow@google.com/
>
>

