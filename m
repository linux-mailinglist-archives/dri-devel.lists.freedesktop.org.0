Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 314CE389E80
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 08:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A5CF6EEB3;
	Thu, 20 May 2021 06:58:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B668F6E17E;
 Thu, 20 May 2021 06:58:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e0HSxhsMgvOi09iSBcYqXunBAbjwYx/Kr99cre9Vwr2HdbhPvkcsgO0Z9saY7hlrKmBZcOUzOSfKwU6u9F0YJM4NDzInNih2SzQrJEDGLwlIA6TBpnhHMKtV+iV8oYG55PKeUUmu4kD0IZgqu22VUU6K439nMafh9jk12MIxFO9bwazWMBYzUHCw1AF+fyBfhFS8divJ2Q+D+JG+6vV7+hWXtpIdZ1A8vE6XgB/Kj6LLZq2hiu3NPG4Z8xI2e3WeURQUgZ3/j65BpaKPFH3I3k6JvWKwE5PlhpIZjMMGDYIWPlEHJaLElyOa20HVzUiTFQhrAjY3eU/4edT7guXMTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMFfcramYanWBsD/l70EV+vD3EmnXXSzdjsZY/ORews=;
 b=Vl5Uk1cQ2CWc7unieTRLTr07kwNBe1Mb9Vtg9BVqk2JH1n+pCWCytEQPY/q93ZhmDwcMyX1Q/mxKbBm6MD1iEHiSCLwACUCw1Yy3j+XVHekNrcp/U91swSEejqm7TR1FG4Gb70i1yyi0ZXghxSOHJyd0XE29l4wBM2CQucNf70oN8jO2y5VmH2UFBpsGPbFWpO/p0SUy3Pir39By1+WjOV4G80aQXxjK7u0N3rYNblVRWFpDV2wHdSKv82qk+i7EkgMNzclKSxd2ARUmEdVgKneMV4VuPwh3xxoLvMNt7EB+FNXIQP0BiyfxcXnOPQ7/b1m5/q2szYIDbk36O7LXWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMFfcramYanWBsD/l70EV+vD3EmnXXSzdjsZY/ORews=;
 b=v5cgmTi296tVd+ZKe3+pYn+CR9ocAK0/AKSf95UDb4adHad0vB4vdOSP/mzrNa1G+1Dx6tTxgrT9zGkwSQMna+GhmALNfRQttscmmfXqwivPXrF7/ABbB2b5EGOss3M6Hzz9ltmZ+7JiACTlkM/bPxCwFx2h0N1h/iUUlKhdVG4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3903.namprd12.prod.outlook.com (2603:10b6:208:15a::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Thu, 20 May
 2021 06:58:26 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4150.023; Thu, 20 May 2021
 06:58:26 +0000
Subject: Re: [PATCH] drm/amdgpu: Let userptr BO ttm have TTM_PAGE_FLAG_SG set
To: xinhui pan <xinhui.pan@amd.com>, amd-gfx@lists.freedesktop.org
References: <20210520031523.12834-1-xinhui.pan@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f85408e1-ef40-036c-4cc3-3a33fbe39559@amd.com>
Date: Thu, 20 May 2021 08:58:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210520031523.12834-1-xinhui.pan@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:4635:589e:67a4:e02a]
X-ClientProxiedBy: PR3P251CA0019.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::33) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:4635:589e:67a4:e02a]
 (2a02:908:1252:fb60:4635:589e:67a4:e02a) by
 PR3P251CA0019.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.33 via Frontend Transport; Thu, 20 May 2021 06:58:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d62c32ff-d51a-454f-07ee-08d91b5caa94
X-MS-TrafficTypeDiagnostic: MN2PR12MB3903:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3903272FC42920DE26AFADDB832A9@MN2PR12MB3903.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Si7R6ni4QxmQMt5gwaGY2CORmFt7TIg8bvBA4/eQCL6fwCjijsEJ9FtxoD8fo8h1fpUUCMvkoSPKnZio3rIb9YjQlGBVE7se2U/2k41VdB2Uc1e1g6YCI3/xsX6yabhTSZOmHD235SQ/739Q/pqXfBJsZqseqU7PGYdIRY+mEWd4yd6JnN5+IQKrQpn6Yp1RCMBJqXCTEjKCJG2RGyNt/p2OHJvJQABK9FvbH/eSgqJAbXxUfsAtfwlm81CUPlAPgCyKILYIyG93oCeIk5kGWxNUFzvk0ptmOKlLeR7b1rHIjW/XLE7HC/4uwsQHWQY9CT2JcDesh24/PChzjgBiIB61SZHyPwblb16py1Jd3W72QZTr4SN5eKHKmnVdtnvImPhscHSIbXfWxisA9bfjzD6woey+RWaGeyL38i2GG8160kjcBIdTWoCkv2mcAa3RYuKKe9O6vNl12STHuWBu8583wfEKC/ay0vyoqHq8gW1GOKRO4V4C3FKdFvqiqngqbHyjJZ68K3AxV316/1tkC/kXdb2LJWkayC0fvihL5m6calpMG04waYQ7bOhVQVVlBg2ERBlIIRNpak3LjiHp8g4JyA8FpnwYBtwJj+0gzbysA7ILyA0hTBNoyawoH+5DOyd8wzgcrCjCCzwax6qnbyaiV+Kj5K7L6ia6CfiNviHsMpTxsvHHz8/X3fFAFg5h
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(346002)(376002)(136003)(396003)(478600001)(31696002)(8676002)(316002)(86362001)(5660300002)(66556008)(4326008)(31686004)(38100700002)(66946007)(2616005)(66476007)(8936002)(450100002)(36756003)(2906002)(52116002)(83380400001)(6486002)(6666004)(186003)(16526019)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aTVjL29WS0VtekVCcE1oR0RLUUJxMGNFdjlQNFpFWDJMTlI5aUo5QnA5WFJp?=
 =?utf-8?B?VUtRTThwb21BRm16NHdNYUI2Y0JoTEtHdXdaS0w0RWdNeU94aTZpNDh6Mllu?=
 =?utf-8?B?bTZhL3daRks5Zjc0UG1qUTN5dGZhYjFMZmhtUXo3cTlPKzFCcGNTaGluR0Vu?=
 =?utf-8?B?cHBpdWx0aTRBWDFPKzBKWmFxblFrclZUYXdSNmxpSGIwNDdndldxTllJTk82?=
 =?utf-8?B?cklSWkIzbVBWL3NkRFlkdSs1SXJTc3ZlbFBRL2VYWG1heS9NSkxRNDZ4SHZZ?=
 =?utf-8?B?SCtMUEJ6TEhZeWJBb1JIZFUvWU9MalB4NVNoT2lXMGU3SU1FN1VSaEVDRU5w?=
 =?utf-8?B?YTJxMHdENHVSTlRHclVkbmplNXNxa0lLd2V2MTVtSFZXZklibEpnUkk1aGNy?=
 =?utf-8?B?ckhGWUR3b1ZINXJJOEh2KzNRbUEzWVJRNXlpUXdiN3BWVkNBTmJCb0c0MHQ1?=
 =?utf-8?B?U2NmWm9nbnZXRHZVd1luNkZSQ202eDVxcGg4Q0dMdTlSMlRONTlvMEJBZUV3?=
 =?utf-8?B?bmoyalV1MGJ3M2N6MnRsbk5wOXJ0K1lpZS9nOHpFNjFNZUs3L1E0NENIT0tj?=
 =?utf-8?B?L2pDK0x2STVkdzJ0dFdPeTNubW5EalVuZExRYTcxS0RGRmdjWFRQdU00TFRI?=
 =?utf-8?B?aUExZHhBcjJPaERCWnFBWDlnQkRtS25YUHR1QzZHUDhHTS9HZURZcm5PWDB6?=
 =?utf-8?B?WHRJdU9oejZjK2dKWnlwOXREQ3FPQkhnUzQyNlN0bmQ3WmdSQ3NKN1BsS3dB?=
 =?utf-8?B?Sy93dTduQ1Q2eGRyUjN2enZwRTkwN2NTOVhXSHgyTENqbmlzTER2VEV6RGEr?=
 =?utf-8?B?OVBOUFhsTEViUlIwWHJ1dldKeWFoNVd6ZkIxWk5XdGJKU1lmeXRYMFBxVW4w?=
 =?utf-8?B?U3BsdXJ2OTFlL3dEYlZ0dFlVeVRsOWhYSUpFb0NXWkkzeXNxK2RWWFNpMDVW?=
 =?utf-8?B?NG90OVdDTHRkaGFheTNjQjlwM0tUd20rajVBMTE5TG9ueExTd2FwRURzVEhP?=
 =?utf-8?B?SXFoY0p3UENHYm0zb2d0cmxUb1I4cTFjaGxCTVZNRDIwZVVoekEzbGJKOWZw?=
 =?utf-8?B?ZEtEZmdhTGM1OTBRLzVFYzNFY1o4QmIyUXVCa2V1Y1NiQVQvZVBDQXB1RStj?=
 =?utf-8?B?R1NEd1lIUHdVNjRwWUpPVFEvZ2FsRmM0NDdpRFZRMjMxUHhVak5JUnk5bHdn?=
 =?utf-8?B?cUZXUDlpNUxuT0NIT016cjBnVW1iS2o5L2dMMHN4dUJmZjhrRlpPUlJqU2FT?=
 =?utf-8?B?V256MGZtRW54Z00xNUxIa3N5bk5BS2M1Wkd1Y29aSWF1bEExNEpVdG8yMkl2?=
 =?utf-8?B?UU9nKzJlTnpFMDBxbHRZQ1M5bXFjZDBNRDc0ZW1kbXUvQ1F0OFdRckM5eUs0?=
 =?utf-8?B?eDR0Z3Q1NE0xdTVidDFEbjdPR25udTJGbUFoQi9sa0dYODVRaWRGa2kzenM5?=
 =?utf-8?B?eGJuUlJCKzhiV0RjSDZWNUtsUTR2OG5WeXVYSW8vc2N2TU5abVhVRkJoZFdC?=
 =?utf-8?B?TnBLLzA0UWl2bXdCUlQ2ZWloNnNJY0orV0EvV0h5NG42aDZkR1dLT3lDbDdE?=
 =?utf-8?B?a08yWDJCaVJJUXZTcmVPR3UxMVNBZ1NIWlJKOWRINWtmMGFTSmJ0Tkg1dGdp?=
 =?utf-8?B?U2xUWXl2ZG1kL1pHdjBlcFVtTG4xdkJoZUVyd0RULzFBRlVFd2lMdGpSekVI?=
 =?utf-8?B?S0NtZm1lcnNBOExURDIvLzJPbnVSUFljUjFGT2FpV1JlaE9SdlZOY0pCOTAv?=
 =?utf-8?B?V0hCV0JrYllObGZGUEcxdlVadllWR3dyYmladTVXb24wTXVGRHIwVDBtRE1L?=
 =?utf-8?B?eC9xTEFnSGd6SVBLbFYxSmprSHd2akpNVlNQaTR1ZldjTWVRaS9kKy94Sjlh?=
 =?utf-8?Q?a1W3jAUjdlKtG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d62c32ff-d51a-454f-07ee-08d91b5caa94
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 06:58:26.4493 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sRz/FepyzyWkbot9xTUoowlHDtPzXdfhfcxyIwqurnx7v3kv0oF+LdNSVAlqvYAQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3903
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
Cc: alexander.deucher@amd.com, Felix.Kuehling@amd.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.05.21 um 05:15 schrieb xinhui pan:
> We have met memory corruption due to unexcepted swapout/swapin.
>
> swapout function create one swap storage which is filled with zero. And
> set ttm->page_flags as TTM_PAGE_FLAG_SWAPPED. But because userptr BO ttm
> has no backend page at that time, no real data is swapout to swap
> storage.
>
> swapin function is called during userptr BO populate as
> TTM_PAGE_FLAG_SWAPPED is set. Now here is the problem, we swapin data to
> ttm bakend memory from swap storage. That just causes the memory been
> overwritten.
>
> CPU 1						CPU 2
> kfd alloc BO A(userptr)                         alloc BO B(GTT)
>      ->init -> validate(create ttm)		-> init -> validate -> populate
>      init_user_pages                               -> swapout BO A
>          -> get_user_pages (fill up ttm->pages)
>           -> validate -> populate
>            -> swapin BO A // memory overwritten
>
> To fix this issue, we can set TTM_PAGE_FLAG_SG when we create userptr BO
> ttm. Then swapout function would not swap it.

That's a possible solution, but I would rather like to have the 
underlying problem in TTM fixed.

Christian.

>
> Signed-off-by: xinhui pan <xinhui.pan@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 4 +---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c          | 4 ++++
>   2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 928e8d57cd08..9a6ea966ddb2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -1410,7 +1410,7 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
>   	} else if (flags & KFD_IOC_ALLOC_MEM_FLAGS_USERPTR) {
>   		domain = AMDGPU_GEM_DOMAIN_GTT;
>   		alloc_domain = AMDGPU_GEM_DOMAIN_CPU;
> -		alloc_flags = 0;
> +		alloc_flags = AMDGPU_AMDKFD_CREATE_USERPTR_BO;
>   		if (!offset || !*offset)
>   			return -EINVAL;
>   		user_addr = untagged_addr(*offset);
> @@ -1477,8 +1477,6 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
>   	}
>   	bo->kfd_bo = *mem;
>   	(*mem)->bo = bo;
> -	if (user_addr)
> -		bo->flags |= AMDGPU_AMDKFD_CREATE_USERPTR_BO;
>   
>   	(*mem)->va = va;
>   	(*mem)->domain = domain;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index c7f5cc503601..5b3f45637fb5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1119,6 +1119,10 @@ static struct ttm_tt *amdgpu_ttm_tt_create(struct ttm_buffer_object *bo,
>   		kfree(gtt);
>   		return NULL;
>   	}
> +
> +	if (abo->flags & AMDGPU_AMDKFD_CREATE_USERPTR_BO)
> +		gtt->ttm.page_flags |= TTM_PAGE_FLAG_SG;
> +
>   	return &gtt->ttm;
>   }
>   

