Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 492283B6401
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 17:01:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 077A96E48E;
	Mon, 28 Jun 2021 15:01:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2069.outbound.protection.outlook.com [40.107.236.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE1A6E48E
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 15:01:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z1oYBz+G8w71S1IU6QTmUnc50zQG/WbuC8ILas5J6HTjqs7qbJcy83nonXsUTCMqhd2FOzLhJaG2GjQEBaoGMmfjTJO4133j+VMmLBIho3vv/cCaKC7NRHYio0r0dJ/eVcRZeo1joAe8BiYYfK97FvAdRZGdLo1ipTG+tgOxouSNoqxDkzy5XZQo8/gHUSFO9HnYIPKD5HY9t+P4BYanh2wYEHSmitLPs5jDqCmGQ13ck8FTptuHiAvDZLf9S4go5Hw+n9ujLhGtzrbdngfDXt593mxKNETJHlF1X31mvYskbFtsXGuXDV3Q441PZlO44XMSLnZXHh8WK4NLn31LNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91NK5ff95wsFDj4tefpy4gwHVIv404RZfvY9y/3DOeQ=;
 b=V6Tz5BmBwHVllVs39wmSxo9BuHV1l3E5QFBZNs3XR9/MSTvMmaqq54wV2cwZx2uLURPVuzpxvpvDBGdXerpvBvG6In8OZuIuLj9r0RpnBwV5WAJB08QXxtCnQ8eo6uFgE5IWSaHhvfV4HuoKS0x57jQ3GyckVK5TPxYuVUXwB5VcJLfEqiOmAiubhpzHkewtIDOmMMkBnvb2OWsn77kog+c6km8ySbhtKNDJJMArok0K+8rdrGpumZ8M2Yto3GrTgHcsvWIn51iGYq/CeunNIUNm5z8B/ZkKgGOmqIHB8hUbYd/x4M3g/iNK+V5eRPddBqKrvgtssfrPQ5AlUD6sMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91NK5ff95wsFDj4tefpy4gwHVIv404RZfvY9y/3DOeQ=;
 b=wBIhtAEWmQIkaTJ9hx2PCHQl8jDUFigvpXo+3j37HTIpS4Ng7jFPDuKnhOjiXG/eoe+Pg1NPLe8ACBI1nQniu5TKqYoFuhKVdaRVOgqXpCkS2uwtEm4ZNtWmU8ttEvUx1b5J5A3R/0vOzRyyFgw0GHu8Yg1ZDqSXF/5HhwvqzEA=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4144.namprd12.prod.outlook.com (2603:10b6:208:15f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Mon, 28 Jun
 2021 15:01:02 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 15:01:02 +0000
Subject: Re: [PATCH] drm/amdgpu: use kvcalloc for entry->entries
To: huqiqiao <huqiqiao@uniontech.com>, alexander.deucher@amd.com
References: <20210625020344.30979-1-huqiqiao@uniontech.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ffe07902-c0a3-4bb9-7abb-ae6020dc9d80@amd.com>
Date: Mon, 28 Jun 2021 17:00:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210625020344.30979-1-huqiqiao@uniontech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:9e19:5c9b:7f42:aee2]
X-ClientProxiedBy: PR1P264CA0017.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19e::22) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:9e19:5c9b:7f42:aee2]
 (2a02:908:1252:fb60:9e19:5c9b:7f42:aee2) by
 PR1P264CA0017.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Mon, 28 Jun 2021 15:01:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad686d92-781b-406f-44c3-08d93a458b6c
X-MS-TrafficTypeDiagnostic: MN2PR12MB4144:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB41449F01E10547B7BAA61FE583039@MN2PR12MB4144.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k1K3PNVjy63RPys51Nrs6k63APuZ6WOfaIGtVJh9EKZBz8RgkFeEf/sx4QMuMNZ+vjQ2G6N+q6jIHHQ41P+f68Wa287T/9feJohXXELcLIf5UR2GeMnwzCt5vJ/ErqipSg6nMqUomkDVAS245lwcaKwRmE2kgntzf+e1eX6ICAbis/oVhxHJNKLENWC6TWZ2rB+JIk2JfkImHKIN8IcVJppaBCWySr+DABX7wkyn87R3Zk3DI6D3hTVUqxPx85LemYHvWKkWtAAYnR1mLT4AND3uDwpFF//Ckav8gIaCLdB4C0OfaiWOeALt+BLoAWqPZXhzeFX5m/AZFfVs4nQ93tNEGGzYHuN9NNuSPeGzTfZ2oPkaxHNRPmtsetpxK7bPiHf0Ox8JIIrk9Ho1zLcuyAM8z2FJcHFvzJ9F8sU/rjRmIKsFNbvbqNSL6U/LvK9h92Qby2hdZhFX3mG6+msNbCq5jD2EEVEMQHwQYg0w9UfLjYtwq9UEsja3xOD4OZGvtY2UNAl+siM9/kkUMkas9qUk8RqO84hdqnGWFt4VddjCbyzovb9jwJ6DogP+Pm66F/dkWJpO9DjUuN6LGKk67z4+KpQLtpmK+4wrysqqW2DPyokT0NMVWq1kPa+5VbjDvSiSF4uREpPg67ykWvr82tJPrCHPkxfikzXuVuwzCTEno53EeaTli9h/SP1XtDb9hMVAxZGqaa65UxDPt+AoStfzv5UR9DLy5GBeUHfDQl8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(396003)(346002)(136003)(478600001)(83380400001)(4744005)(6636002)(6486002)(38100700002)(2906002)(66556008)(5660300002)(66946007)(36756003)(66476007)(86362001)(8676002)(4326008)(31696002)(186003)(16526019)(8936002)(6666004)(316002)(31686004)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MitPZjViK0dyZDNNanVQNVhiM0R5elJMRTZBdnVlS2YxaC9lU3FWMnF4S3pG?=
 =?utf-8?B?TFRVNU1iMExaTWVTeWNWNnpHVDRpRVd6Vnc1WjVadFBLQWJnZXUvWlRTR1I1?=
 =?utf-8?B?cUx3ZXkrenJ2UGtJbEtLM081RE12Z0Y0MWxXN0pNYzZWU25pN3lsU1pJenl6?=
 =?utf-8?B?UzNUWEt0N2t2SnpuSG1ZdHgzMXBFemlheE9Rc3Q3dmJDRFdPUGVDN2t2QnpW?=
 =?utf-8?B?NXYzSno4TXRQMUhta1M0RDFKU0R1cE5xMU9xK1lQTU5hMTZXUEVndXBGWndw?=
 =?utf-8?B?Rm1CK3NyUmwyR3RDRXpBTE9xSmhnZ3lWSmhFNUZnQ3dDbHdPVDdpTmUrdlRE?=
 =?utf-8?B?SEx1T0VUc05BVlBkbk5maTkyd3dudk4xVDg4LzB3RmRVQ1JGQmF6L1E2cVFn?=
 =?utf-8?B?ZUtHK05oQTREdHpzS1ZRWHBLOFg0cEpSOEhiZGV2M0syTTVBdDRGVFRmMGcy?=
 =?utf-8?B?WlFGUWVvc1BQaW5OVjV1Rko2cU9lMXhpcWxFSkVrRWRQMmYwaWxSVjBBWmFm?=
 =?utf-8?B?VUdESFUwVHhIOEtZZFczT1ZnVlZ5NC9tVHo2SVozQUQ3Z3M2M3lHUDlaYXd5?=
 =?utf-8?B?cFg3djhmOGQ5b0QzODN4WTRRZ3NveDJkRU9mbGxGeGh0eTNnaTFtQVZHNXVv?=
 =?utf-8?B?ZE9EeWZnRFJCdVR1QTBEWlFmbzVPUm1QUCtDYU1PelVQRjg0ak9CaGx4bWpP?=
 =?utf-8?B?Sk0rZ1JKbjJsdmJtcVlabnB2aEt6azRsbk5RQmZQTmFTb3dNQTV5b3hyY1JC?=
 =?utf-8?B?V1g1MjVhb0pmaEROWUpPOERQUlZKMzJha2RqY0VSYkI3SCsvL3dmNmR0dXJ6?=
 =?utf-8?B?VFpLdDdCNi84VHptRmcxSXMwYzArT2JIUjdrYnhXaGl2TXJQMFdKR0U3amFG?=
 =?utf-8?B?MmFuSnZLMHk2WkQ4Mit6V2F5VUNSeDkrajhoRTgvQ2Nic2lVWFh3UGo0dzM3?=
 =?utf-8?B?MFZEN0pSZzFsQ1lBem03Q0dXTXpmalcxdTc0c3RBT1NyZXZCL0VSWjJTbU9B?=
 =?utf-8?B?VFZKeDNvNUZyanRhejZySUdOZ3JuTC9oeVVWRS9JelBBb2dTTG1VZ0hSMUZ1?=
 =?utf-8?B?S1NYZFhFTU1yWTJPWWszUVRJSnY0NHphdUZ2aVQ1ZWYxc1locGRPcWQvOStr?=
 =?utf-8?B?QjFVVXBJblNhaVB4azE1MnpySnhmblJ4UUFMaTlibmhCTFdlb3B4SWI0VHJP?=
 =?utf-8?B?Y09ObHo3N21qL1BVWXkrcFdyMzBrby9jekxIUzJtMFFZc1ZSMlg1Q0hTcFpP?=
 =?utf-8?B?SHZmRzMwZzRSMkppd0sxenpiTnRVN1Rwc1dVbXpWNHQxM0g0MVo2QmF4U2ls?=
 =?utf-8?B?SVM0bHlMY0c2T0h2aFlSRVIxSUNSOWR0WjFKdUtlMzVTZ2NOa3YwTm83aVRz?=
 =?utf-8?B?a3RMM3FjY25LdHJUalZDb2M4S1RZdmk0NzUzeXQ4em4wbGN4ODMwczBEekUx?=
 =?utf-8?B?eHllRFFoL0UyWWx4WmVWRFl1UGJxeGpiR1RvTGRreElMNUt3MTliQ1JvVHcr?=
 =?utf-8?B?SHUwSlhmNWwxUXh3KzJGcXgvZFBub3Z4MUVpcnQ2YlA1ZzlLTDdTcWU3ODRG?=
 =?utf-8?B?YmRNVmM5dyszYUZYbzFlSmh2LzNOR3RPelZQeGU2ejVHSm82WWp2Q2VWMWlm?=
 =?utf-8?B?aDRqQ3pPWlA5QkNwNzJKdlNpOUtQTlE0MVlKNStJSGtkZVByU3c4QWpSKzYv?=
 =?utf-8?B?b2FKY3dxUnhJR3VVKzErSGpBTlpYNVhqQVg4dEJici90dy81TXcyc1VHeWM2?=
 =?utf-8?B?OGVtTmwyOFNHNGRQcUZHbTYzOFdzZHh4Um56RGRyUGdHRGc3ZVZsQWI4dVdR?=
 =?utf-8?B?Ymp3ci9Fa1NEQUE2cGNPUkN0WDhUbHl6UHFSYkJvYXJtZjRxWFBWaDFlb0Zp?=
 =?utf-8?Q?yJPcFDqCIWvvg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad686d92-781b-406f-44c3-08d93a458b6c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 15:01:01.8307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ODmllZMgsBGXxsMATvwXHHz7N06F4D13LEPXgqcVWJBeDnhAV3Oz7DD+moE8uhE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4144
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 25.06.21 um 04:03 schrieb huqiqiao:
> malloc_array + __GFP_ZERO is the same with kvcalloc.
>
> Signed-off-by: huqiqiao <huqiqiao@uniontech.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index b8c31e3469c0..5cadfadc625f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -909,7 +909,7 @@ static int amdgpu_vm_alloc_pts(struct amdgpu_device *adev,
>   
>   		num_entries = amdgpu_vm_num_entries(adev, cursor->level);
>   		entry->entries = kvcalloc(num_entries,
> -					sizeof(*entry->entries), GFP_KERNEL);
> +			sizeof(*entry->entries), GFP_KERNEL);

All you seem to do here is to mess up the indentation?

Christian.

>   		if (!entry->entries)
>   			return -ENOMEM;
>   	}

