Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCFE5383C6
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 16:55:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E89910ED7C;
	Mon, 30 May 2022 14:55:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2047.outbound.protection.outlook.com [40.107.244.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9013C10ED7C
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 14:55:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cXLPxIMSl5ySEMVDsgdhGcW55LyLmAuwckKlpBLYb8CU94ycKLfgCUYY0pm11pc0FjFhVfrLxOpgBBvUpPt/jhrG7BAk6st5kFXkrFslsGIn17m7yjB8wXwwWyxdlRGjDbdLgWeh64kkiGEqTknKPZXV2IYKJWB43LjQubZOUzqSZ8L+lI8jFAcNcdKUxdCq6R3c8HWsp1aWRGiHRFgH2WpCes7N5nEIDxy6cT/NPqY9KqfcKfbq3cQArGmFZauMdQM0XjC1aErtF+Z61mmJT2DX2Mcld1kTPcx9Lmi5HKQKLom1LAazVbSJS3D7bfCc3UbCKR4Rm39AZYfPSYs7rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQ547yExcWveY4uDKq0gq0V5eKy4q8PAPpUqrTBxYpo=;
 b=OhMbnlh7LryyYazQ57ona46Cv7r5zVJA3DExykcAAQLE5qciIhXFU79IWkAOGB/k6aWc9rK+xY20HRXBkzVpIB0L0abpKYQSzH9/cvAN0sBapUiVMbOctrrYdOi1rVs9JDZcbfQJQR+7g2+LE3WEVB1kdp+qPKT0iiHL5iDCiGCiOkkdUQvQHO62XDgwqyDjznYDP2HnNp2L4N7TWLtFotYIhCGBjNROFSYPqUMUHt9hBZBSg3FGk/ik0biRqOf0l/ERa4NLHOsL5/oS58CXxysQYFXiBu7nLLSDsGSjWZa3XW1Jizt6zcxa2+jb7Tnu3kHHFkFCAGYcgwGxCs58qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQ547yExcWveY4uDKq0gq0V5eKy4q8PAPpUqrTBxYpo=;
 b=X2XLvkNn4/cEoJIyb8y2AF6wWMLre53/IdqLXUagX5iWR8PGfXabAqYigeb0OKvW6mssdDuHqBn/BOmFwZHhMRGewEBBYC3OKcpEXJYkcBz6Q7eHJxzMnl7ybs7LGR4qHyhmwXwOGO4JLAi9b/AqJ7OjomWiNIW/dEjiX1X3xag=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4283.namprd12.prod.outlook.com (2603:10b6:5:211::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Mon, 30 May
 2022 14:55:47 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03%4]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 14:55:47 +0000
Message-ID: <7eee4274-bd69-df8d-9067-771366217804@amd.com>
Date: Mon, 30 May 2022 16:55:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] dma-fence: allow dma fence to have their own lock
Content-Language: en-US
To: Sergey Senozhatsky <senozhatsky@chromium.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan <gustavo@padovan.org>
References: <20220530142232.2871634-1-senozhatsky@chromium.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220530142232.2871634-1-senozhatsky@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0061.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::38) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e6f0579-0610-4f44-77c1-08da424c7ac1
X-MS-TrafficTypeDiagnostic: DM6PR12MB4283:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB42832B3807D1AF4D81F19EDC83DD9@DM6PR12MB4283.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xOs1+qmegwsbgdnvGkbk5uLZBt6U4RywQ8mRyMO4osSrE+JjfwHsJLPdpREgpygJfXWMwO6ZRBJ/JCBuQcrd05XWMzF+nZcDFiWdP0CATQRbl1EasGbjLsgg2J8HldduGva1ZcMQB5rlcBKYXaqApVwuu7xlmGnYwmkEZEU3CZ8pdXAA25pY1Yqofac9p9FLTp0af5RxRwDe09+n/Is1tKRrD8M89T5PnPqk06kaDF4I3sBoLQHRpfG9Bpkd7z7rxVZWRm81E29ccln2+9zIuD8Bhns8FLPqHdWzbfwMVYGEXpKFeYNNVSnHytsMbeLrEzX+Vn9x2H1J3H6akVspNTocHLdf4DUhOjjdPYa6TpkgL2IJpMGpra6BuGc89MaP/qCfrHfwO7YrEPcXY0/31k+8JqXn3FAVElenMidK5d8VtMqB0eSiOxrfPExYcXEFQo80J/siokUGJaqiApOXIjoo0wRGvUUYymjiHr0dsswLED8GKwrWn9E99KMx/VbzY7ZuOPqr8eMy8WuoOxurXdnOz9oRrMzeiflKa0jyLuT1cQLQ1omDEfEW8CvH1FPuqwXrC9/G5iR7NATQAEz7zN8ItsnVhBu9lBYnZ1qTFl5dtysWAznJlV3+Qi0MTy7n7w3m8vko4jkY2aiGp+AGA/5O+BVLgAUrTl98owhrVFHjnI4qRV/fOciYZgxdQZfxpULGegVJDTGx6+L5i4Bc5wM2otjf7HhabWnQotZuCkOYENf36eoRC9f/INgC+eOpZvKztgF54JE2cCY5Fp27pXNfbozSAgrH1ydVo7zQE6e3+I7BJxaamQEdM99Z8yrz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(83380400001)(4744005)(8676002)(508600001)(7416002)(6506007)(38100700002)(66556008)(66476007)(4326008)(31686004)(66946007)(36756003)(2616005)(8936002)(6666004)(31696002)(2906002)(186003)(316002)(86362001)(6486002)(54906003)(6512007)(110136005)(966005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q09WcmY4LzFnbzAyN3hXZkNhQkkvc2lwOGJXRFkzNmk2VEQxeHIvS3N3Umtz?=
 =?utf-8?B?NXpreVR3ZGczeVlTajl5Y2wvT2s1bmd1c3NrM2FSb3RjYWZMdmdDRGh1VWsx?=
 =?utf-8?B?ZnphOU5TZUVndk9uL1FFYXpDdmgvTUVLd2liTmxXU0cvb0lEUWU2WC96VDlV?=
 =?utf-8?B?bzQ5OU9YOG5NazNncHdDUzE1WXdVTnlWa0llVGRaaVlmSGpUQVFKQkNmZm92?=
 =?utf-8?B?NEFIMjJDMm1WWjB2aXlmcjNEYUV4VkRCZ1g1L0dsVVJSY0s5alJ0TVF0S1hv?=
 =?utf-8?B?TWdxQUhqenZFZkpBYzF5VjdlR2ZJVE8ydUkvQ041aVpqcEFlWSttYnBMOEo4?=
 =?utf-8?B?bFpCNXVGazZZZERLR0ZwdXIvNC95RnB2VXczVnFTVnZTSDNweU9EL0tpMEtI?=
 =?utf-8?B?UllWRnV6bHNNVWE1REVFNy9MZlZGVy8xTmJSODhNanlVL05EZzNZZUJvNXlC?=
 =?utf-8?B?SDN1alVOZDJGR0IzS0FlWXBmOHQ0YjVWTmVWVGg1QWdkUEpBRmJaaERZOExJ?=
 =?utf-8?B?bTdiSUJaNzM1cHIxVzYxRzJTYWJJbEhVQlNWV0lMM09lK1Z4OVhRUjRta2ll?=
 =?utf-8?B?ZHUwKzlxaHlnTFBRbHZucGUxbUFEbmRYbXZGcDN5RDROQVd0UE84YkNQaVo2?=
 =?utf-8?B?OWpWSVhoUjFkcGhDT3l3T2g0WGNtaWhDQXpJa1dFR2ZZMit6Q3QwclZEYmsv?=
 =?utf-8?B?b21FYVR4K0M1cHF4V20rZnlTcUhESVNwVkFyaWROMDdDbTN4WmtMVlI0S0FC?=
 =?utf-8?B?eE41M251bUlBLzFocmNPc0tUMjVaTXR4dW8yL1JDd1JkZTdDRzRKWko5akNG?=
 =?utf-8?B?N0ViZXR6V1oxU2RBU1JKTlRrRVRiSFR6MitJeDVCWndvWkZjT2FyejdldWxm?=
 =?utf-8?B?NzVJb3pyOEJlNTBxSXJlb0lWRWlaUTQzNEZNbFBOVW8veWhDRm1FamdvRk5x?=
 =?utf-8?B?SmZrL2Zya050cUxjeCtmbVhxclNKQm51ckorcXR1UVUzOFN0TytmYnROYngr?=
 =?utf-8?B?dkxHbHJNMEtxK3JHbC9GY2xrckxhZlg5NmxtMFpTVjRtS05Ubjh3Y0tsZUFo?=
 =?utf-8?B?aE1Odjh0R3JXWWVoL09EOWtDZjZSNnRjWU9nVzlRZ1F2cXRnVUY5cFBRNHdr?=
 =?utf-8?B?Q1ZQeFRmVGZ0Z1NHQUtlelVrN3pWUU9HQWJIMytUUzFZZGthTCtNZytKazZr?=
 =?utf-8?B?cDAzRUZiVzl5ZmlnemFKU0dZZVQrMWNiRm5aVzNDdHEyenovcmcwRUEzMWNl?=
 =?utf-8?B?SUM1dXAzbWVGRmNvQ3pCbTlIVU1LamtteFBVMk03bWllc2V5alN1SVBoaDBn?=
 =?utf-8?B?TjFFdlZvUUJKSElXc0dnOVBjQW40akYwQTUrazg4VmN1M2tTTW1hTDVJb1Nu?=
 =?utf-8?B?RVc4V3VoOU5YQ3ZNL0tTMmNNTG9xa3YxNGozSCtyRnNKbTZGWmlFdG1BYXdu?=
 =?utf-8?B?SG9vcFF2N0UwT2lPb2lGR0pxWk80ZWxiV1MrSC9ub2RwSkVUNDFuVjgvNmMz?=
 =?utf-8?B?b3VHM1ZteTRHU0dDS0tuS0h6ZjFtUlNZb0JjTzRFNTBGYm14d0ZMMFozNHh1?=
 =?utf-8?B?VElIdnpYN2RhbW5CTng4YkNSRlF1TTV2ODhrNk91TWlvVFlMMVVMOUpqbFp0?=
 =?utf-8?B?dFB1d0pRUkFzYVB5M1N1ZlczU1FsTWZXUFEzUjM2eXFNWjdEbDlVK3FFcG9w?=
 =?utf-8?B?MzNuemtQQlpZcG8rUHpHb01na3RRWVFZWmxOWDVVWmg2ZDZVc2JRUnNFRHAx?=
 =?utf-8?B?UC9ZS3BZd0JERUVSeXhKU0VTMk9oNzZlTE5wN2EwTzgzakl4TEZzeEtkVWIv?=
 =?utf-8?B?amVFanJLcnlxNGZTS01HeEtycXpVbFRVQXBxSllpVHNtc0dkaE1RQlR4OGYx?=
 =?utf-8?B?WTlHQVZiYktLZjNnUVhDV3Z4YWNvTjlmdzdsaUZId2tIMHJaTHpHc3JMNngy?=
 =?utf-8?B?cHpxbWtaR1lKYkh4blRZNzRRQVpkQjVzbGk4WTJnSThRa055S0hNWm5peG1x?=
 =?utf-8?B?R3hNUU1Ka2cxTkxsTEJzTS82SlVyc2lORXhxblVyZ05jTGYxMWRSaW5VdjFw?=
 =?utf-8?B?OWYrWmhVWUN2b1JlQit0U25EVTg1YXVGK2QzbExXdDRsMkVmTGUrZC8rZk9J?=
 =?utf-8?B?STRQM3JtUkZEdUxieFBIaGhETXQvK1JwRTNVTzg1Z2dSV0doMDFlZkUvdWZM?=
 =?utf-8?B?VWN6dDREQ2g2NHhPeGRkZHM1d205bDZkaElNYlNrMy93ZFRzMGs2SWN4VjQv?=
 =?utf-8?B?R2lMMmplSGQweTgzT0Y3L3NzMmRZVWw4Ry9FeFFDZXBnYm40NSs5ak16c1E3?=
 =?utf-8?B?L1djTjdOTGthcVBNTHlzdSswTnAwTjBSWHNzT1p0M3dwZ3ZIdFA1di9jZzFl?=
 =?utf-8?Q?f916PgOtzC4prBkJWHHr9yA34lYtUjZbESo6FoddK+Ycu?=
X-MS-Exchange-AntiSpam-MessageData-1: eAh4gLw0V7Ps2Q==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e6f0579-0610-4f44-77c1-08da424c7ac1
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 14:55:47.2668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CsdN08+hlHz028LxbjO1/hmdzUR3NBII2JRNfo7f9Pk+X8DRIydMHQZvOA20H59s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4283
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
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tomasz Figa <tfiga@chromium.org>,
 Christoph Hellwig <hch@infradead.org>, Ricardo Ribalda <ribalda@chromium.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sergey,

I'm removing most of the mail because you have a very fundamental 
misunderstanding about what this dma_fence lock is all about.

Am 30.05.22 um 16:22 schrieb Sergey Senozhatsky:
> [SNIP]
> So the `lock` should have at least same lifespan as the DMA fence
> that borrows it, which is impossible to guarantee in our case.

Nope, that's not correct. The lock should have at least same lifespan as 
the context of the DMA fence.

The idea here is that DMA fence signaling and callback calling 
serializes. E.g. when you have fence a,b,c,d... they must signal in the 
order a,b,c,d... and that's what this lock is good for.

If you just want to create a single dma_fence which is also only bound 
to a single context you can embed the lock into the fence without much 
problem.

See how the dma_fence_array does that for example: 
https://elixir.bootlin.com/linux/latest/source/include/linux/dma-fence-array.h#L37

Regards,
Christian.
