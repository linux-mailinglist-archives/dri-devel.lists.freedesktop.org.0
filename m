Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0946D67B1CF
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 12:43:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A4EA10E7A3;
	Wed, 25 Jan 2023 11:43:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB5B710E7A3;
 Wed, 25 Jan 2023 11:43:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmuMjAubBihTmgv5JNyFVijSHJgEmddTpjPtjnUXaMirHCJ3FmMD09xorsqJEqx63UDX7IoteKg51/8KVIK6RmyBXNgBX5vTp7TTflK38tMtqmtEKOrsmGyCMutzLYsPoFwUczuMBidKe1TP1NLWV8hG8UqHt7a7vfb9wYzs2nclxI/NxfbnIiQur5vrPqgQpe7f66jLHYAML44w8yloRu9rr+Fe2OlQx7AqBNHAfMO/goZ2eL1aFWMFvaPvF0MLdjvy5NwBGHntLWR+z0SYmD8XHH7fIqw/B31UeQcEJ29M8XXMkXkmvVLOdpjQHLJesdzec4lDmOqv1wAlw3kazw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AhEN0qRLObsSSplZ5DEJ6c92wTzf3rHNFeCjgFgaaps=;
 b=D2tKqmjdCAtkX7EpLHjXR7AAlpUCQ7iNn4WNfj3FZPEozuqzx4zaCZfTHTeOuh/Inlq5aNYYcOlM8vBY6WSCCK8kUJ7BTGzu6lhb2D6MWRxRjMf8PeBeWkEWmddZKmawMuNJnePAGbFRdrJOjSvQ8IifFYtRYMdJgQ7a9Vswvh0jlmN9YiCIK+ZPxCZDtJHggEVx70aXMNDxGugFXcYxoI3dCnzsYTFpqMuCmFtZ2sxovib9U8rJ8OC8HuIzwzhO9Fh8D4CbbEijuyd2aMFZMZSRGbBoob/nDb/iEhqWqpL1EXBwlie0+IEbKwrTYp4za9o4l6uzRrrU98ooGsaD9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhEN0qRLObsSSplZ5DEJ6c92wTzf3rHNFeCjgFgaaps=;
 b=Usr1J480Co5daTu/8/8tOt1KAen5lDA14FPR5DuLJx8snnK9PCJVdy/PkZkNXUCzgPwi/sMtWEQTQw3viWDDW1CKWSqOt/WAXJ1iMmBIOoRh6sbJuYt9DfHD8lDxVBj6XwrRD2BnS7SladwoawcVJ+X59myExJq+v/Q77HZppmw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS0PR12MB8248.namprd12.prod.outlook.com (2603:10b6:8:f3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.20; Wed, 25 Jan
 2023 11:43:10 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6043.017; Wed, 25 Jan 2023
 11:43:10 +0000
Message-ID: <dde3bb8d-cae0-11e0-68ef-a9c1b9e283db@amd.com>
Date: Wed, 25 Jan 2023 12:43:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/4] drm/amdkfd: Use cursor start instead of ttm
 resource start
Content-Language: en-US
To: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20230125104838.23596-1-Amaranath.Somalapuram@amd.com>
 <20230125104838.23596-2-Amaranath.Somalapuram@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230125104838.23596-2-Amaranath.Somalapuram@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS0PR12MB8248:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ea99bf2-9f96-425c-8e62-08dafec955a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t9RQJSfh68UwyHi3RuyYTlYIeEQmOa2uv6DVCbTAEaHRXzgVF3DHdNjLr0C3szKNlTI1vPvipBm+msOa3M+voG8lRtZUiW8fUD6PCjRYaOemleFuyzjlRky+hpZ9yfCawXJuSkZY+aPB+RY+5vXJRVlFdpj3tfJdBhpazpr0CeiPYSeGFQ6NulyVE1MjH8Um3XTZH6J7Tn2iulBocUbzLlokdSztPLsnhHRrbM/NfxUAWXDZfPkjlmjnUESm1TlUZNNtKFwI7eRrbFPMhx5rvud2oI2Eht3glUPPFvNcs+QIC/Mfpai82u1g+xGuoiWBGcZb0hZ8IvbNqfg30lXt/4qSJUWCymN8sheT2A6qDYWv3/ky2UCdKm+doKNASrQl8Pwx7TGF1U4TKtQJEqNHr5LFZ8+3C2hceZZrvttdF+8BeyitIRHNLrynoMVXdymCHk21bPE/xUgjJnFZHuBl3+7D4nkIq65S46/dsL2nuguCnJKmQX+fmVB7HrFryH6VZ7BIvHsxf+6iIaq0zzjhOeziCJtGGefjI2HoT3uLJvGeM9Meb89xoKLWd+Yx8T9yTDshIYbyCG41pV6ROh9hURN4/INc31uuabDUNMRmSwioxH8HCfvQLLcQ/k7I0bB9D/M7ejWrT3wnjhDBd20u0Y10KXk813JpfwkqK1cxI/mkStPuqkt95fgFlmiPIoD4WW2+ovuVgOhyrUEYoIF2Cz3Syn7OWeEtncVo+xoKQZg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(366004)(346002)(376002)(136003)(39860400002)(451199018)(5660300002)(8936002)(2906002)(66476007)(66946007)(4326008)(66556008)(450100002)(8676002)(41300700001)(31686004)(478600001)(6486002)(6666004)(6506007)(186003)(6512007)(2616005)(83380400001)(38100700002)(66574015)(316002)(31696002)(86362001)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bldzc3BtZy9NZDd0eFU3ekVJTWQvWFRPa085OFZ5Skp3dDQxMW5CdDArS2Jj?=
 =?utf-8?B?SzJvMDl4NDdycmxmSU5Na0IzVGcrd0xGZXJIMFlmVWsvektaQndWeGFGZngy?=
 =?utf-8?B?U1l5a2ZUUVdsNlBadFhQVG8zWDY4enZrUlFQZ2wrWHpJQytzZ1FoZTRmZFE4?=
 =?utf-8?B?MDJvNmIwQW9tTWdTNUV5SmhxRXJUVm84Ykp5bTV1NTdORXZwdE1ITzlNam9F?=
 =?utf-8?B?UTQ4U1NXcUZtYlJjbVZwS2xRVkV5Y2FkN2FEeXJQMXNwV1g5K2VqT1A1S1Z3?=
 =?utf-8?B?SXFqbTdmSTI2VVZDTjhyV0thNmQ0MHNQb1dQNHFRNi9QVklLOWRyK3ZjRnBB?=
 =?utf-8?B?NFo3M3FUTlNodnBaNSt2TitqaFpvY3VsekIwSFowS2U4NW53WnN3bUVTNzAv?=
 =?utf-8?B?Z1BvemU5WjJkR0liUEw3VUN5TGUwZzJpdFAycHlpRmVTKzdCSTFwTVpzMngv?=
 =?utf-8?B?eWxZZHd3bjRhanl0S0NZRjlUVkpGTkdsakltL3dYSGcrU2ROcHYrVXZIVHJw?=
 =?utf-8?B?VzJDK3RBNS9EbnpqMFJCZnZ1TWlnQmo1NWN4bitnVEpJQWtUQWxiYisyd1dQ?=
 =?utf-8?B?L0xWYzkrN3B5eE5ZMnV0WHBYVFJhTC9Cdk5zcmV5d2t3a2VmVzlBd05VNFlq?=
 =?utf-8?B?TW1qOU5IUFFQZUNpSFRmTk41L0RmbHhxNWJTVGduZnBmQnFYY29xYzhJZVlr?=
 =?utf-8?B?OHYxbUZReGsvQ1dHZDlPRHBqcUtlUW5INFgrSGxFSGV5VnJObVd6eG82MlpD?=
 =?utf-8?B?M2NmNW1zUkhBYXlURXNsWHFRZkw4MGNEZnRRNEovNks2dmFuVGZVS29Ib2NW?=
 =?utf-8?B?OU5keWI5TGhpUHRIY0tLVGNiQnc4NEd5dTJIWEd2NVcvS3p1M0U0TEdGeDNo?=
 =?utf-8?B?UVlXL2l3d2czam1QajI5RitmWll0RStsTHFDdU1qNGNremdVQ1ZQVm93Qmxo?=
 =?utf-8?B?M1J1eFk5anRZazhVNDFiVVJyRWpzNzJ3VnlKbWRwSVk0UVJZQXU5WE5wZUFT?=
 =?utf-8?B?L1g4RXRTdDlxaGgwN0ZERjQrZWtna1RKVnJOYWVTSTdDWFpOcDhuWnN4TTNF?=
 =?utf-8?B?aWxjK0VRNVZxY0xTc3hPcjl1QjYvbi81UmZia2ZLMTcxOFVIdnhMVjdrWDE2?=
 =?utf-8?B?a3ltZ2RxMGIweFA1bHVZOTBWMzMwdGdTYWs3c25zOWRDL0IwT3c1WHNreVJE?=
 =?utf-8?B?QmNxcUl1VlFjdFo3RVA2QnFpYlBNSW96ZmR0cHM4YzVGTW5WN1JaMjdrMW9q?=
 =?utf-8?B?VzdZeHJGNTR1cGZYVmFjMWw0eDNJUjM3dDlkbWNJZEdLanBVdHA2bEc2cXBZ?=
 =?utf-8?B?MlA1ZFY5RndkSlo0OUZpRVlrYjh6NU5IVEF3NkFiV2trNS9Sd3BJTCsyaTVN?=
 =?utf-8?B?UjlrRkhGMHBlUE14RUcrYU01clZkMk9kaUxHT3dtZEs4alhxdUhGZjBJNnpZ?=
 =?utf-8?B?am5Dd2wvV0V4RTh5MUdURmJabXNBSjhHRTNYWFRSOHhtWjBVdUE3cDhiUHl5?=
 =?utf-8?B?cjZPZ1BNV0JRR3YrcVA5U1NHOEFzdHpYc0J3TFh0SktUcWx2ZG1DMjFJVFRh?=
 =?utf-8?B?eER4WVVsTjJxU1RqcXBvK0ZPU1UzR2tRZHoxc043b1NIR3RHU3lSTHhiWVNS?=
 =?utf-8?B?QU9KR2R3Z2NLT2pBVmdXdGpKVkJUS3EvV3B6UnlRWmFFZ3ZBRkFRMERBM3cy?=
 =?utf-8?B?YmVRcnZtUCt2c290Y01DZGw3SjUrZFEyMm0zbHhTZ2U4KzZ2VHE0eStvQmpH?=
 =?utf-8?B?enlQai9qUXpTbEpsVlpWcTVpRlltckFMWkpZUzNZQVFadWlHNEdTMUpkMGtH?=
 =?utf-8?B?S2lWLzZSSjFMNm1JOG5BQWRxYUs2eWVsS09SMGlvWUJ6cUFvWGRETW1FUmZi?=
 =?utf-8?B?K3BVMnpSODBSV1BJbWNKR3g0M0dTWXhhZnYvRSthczBkNXhWcTBPV1NMMFli?=
 =?utf-8?B?bnhyNjRWeStoRFhwRC9HQ1JpTGljbEpacmo2UEUwUTZiaWlWSW05bnc0eVMr?=
 =?utf-8?B?Rm9QSlprbVJMNjdtclFxYWhzRjIraGM2ek9oOHVMVDVXOFE5UWMxVUE5eHpV?=
 =?utf-8?B?WFlwMXd2MXUwWW9mc0V4U0xocTExVGFYS25SYlE5UXlZME1PS21Eb2xDbGlX?=
 =?utf-8?B?N3RzODQ3ZjBlR2Y3Z0hFeUtDTGJ3SnROdHdNNlY1RWxrbEFicWROTXJReFVs?=
 =?utf-8?Q?hIrllQQ+FyQ1xEdk/ZM7s+fe/8exAJClWPzKf9CRfZKS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ea99bf2-9f96-425c-8e62-08dafec955a3
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 11:43:10.7666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SEPuKTuVUgMwx58Taci4m0LfEWDK5XVHG0f5HjAuRvlcbyokU3Pq3++iw5XIqZme
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8248
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
Cc: alexander.deucher@amd.com, arunpravin.paneerselvam@amd.com,
 arvind.yadav@amd.com, shashank.sharma@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 25.01.23 um 11:48 schrieb Somalapuram Amaranath:
> cleanup PAGE_SHIFT operation and replacing
> ttm_resource resource->start with cursor start
> using amdgpu_res_first API
> v1 -> v2: reorder patch sequence
>
> Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> index c06ada0844ba..f87ce4f1cb93 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> @@ -200,8 +200,11 @@ static int add_queue_mes(struct device_queue_manager *dqm, struct queue *q,
>   	queue_input.wptr_addr = (uint64_t)q->properties.write_ptr;
>   
>   	if (q->wptr_bo) {
> +		struct amdgpu_res_cursor cursor;
>   		wptr_addr_off = (uint64_t)q->properties.write_ptr & (PAGE_SIZE - 1);

Add an empty line between declaration and code or otherwise the 
automated checkers will complain.

Apart from this nit pick the patch is Reviewed-by: Christian König 
<christian.koenig@amd.com>

Regards,
Christian.

> -		queue_input.wptr_mc_addr = ((uint64_t)q->wptr_bo->tbo.resource->start << PAGE_SHIFT) + wptr_addr_off;
> +		amdgpu_res_first(q->wptr_bo->tbo.resource, 0,
> +				 q->wptr_bo->tbo.resource->size, &cursor);
> +		queue_input.wptr_mc_addr = cursor.start + wptr_addr_off;
>   	}
>   
>   	queue_input.is_kfd_process = 1;

