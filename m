Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 785C04AFE7F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 21:34:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E2010E1B8;
	Wed,  9 Feb 2022 20:34:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 459E410E1B8;
 Wed,  9 Feb 2022 20:34:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bc/XI/jYGPtevYOSACP3qjnshpxA7m4lSawjLecV+5bR+xtPO6ZoOQuhD57r+uujuV3/VaMbL0zQK8US53tcwnloohzL5Lb/Zrt2LVv9NWr4SFx7wEgHE/oBQuTlwojiSFTPrhNqJk8ly9M87DgJ7x1xGt9cVBRr9E7mF+JRyU3X6JmChhEC1lcUKN8JYgY6c+eMjQarR8W5ItYmVj9GTCNptkgAaW7YuT3Tmd19uWI3iVVMO1tV8vOEEI60QIENHB1HBx28QWfEfRNVy0IJ+2UkNdgFWNE8scUvBolH85dKMEINNBUuyDZPW9HLWqHzGAKbzeHswaCcKNA2Owwhog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8KaOPTq4bSwXae+FNdWcUsGMUGw+WIDiq7xGRWc37E=;
 b=SuZLfrpX4zNYh4FstP9OL6dHVF6fs58zT9uw6Bo2CZUOQK0RMxvq5FEBXoIp5sMO/1xqEXH8AalwkODOsZQPCBMhcW32rlbwMIRKpWOgapvVbiswsUgDJ7zwmLWiU9ebi3aEgT4sWIATD190vTnjfGnLRS0IkF6/HISR2EmLXqSvaD+P1/sduT95W40w2EdESFzVLMDNim8kqOBBN/9qK+czKzM7+2rUZA2zxcRgbARvRvjm5tqAz0VPQlBpWEU5+QRULp6HRxPrMqb0OJAiFz4vJL1Sl9opXRojdiHwINtCcmM2awzcEJtOs9SwugrQMkaVsEeWxPnl30ru902iRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8KaOPTq4bSwXae+FNdWcUsGMUGw+WIDiq7xGRWc37E=;
 b=BNn1tfKSEzbJ1tlr6TGlLNSAMi/f3DqtGH/a59ILaKLrylrwdIeR4ehZxsD3skl6TUA6K0d91FVZWGw7gXAKpHEhLjbSHCcqjLlPFzplLHagRyNkFXgIPhjF8926U/bnOIMKZJbhoZmEM0xtcI7aJytRHvlo6iszpQnSfJvullU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5112.namprd12.prod.outlook.com (2603:10b6:208:316::16)
 by SN1PR12MB2447.namprd12.prod.outlook.com (2603:10b6:802:27::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 9 Feb
 2022 20:34:10 +0000
Received: from BL1PR12MB5112.namprd12.prod.outlook.com
 ([fe80::f071:728c:3813:3376]) by BL1PR12MB5112.namprd12.prod.outlook.com
 ([fe80::f071:728c:3813:3376%9]) with mapi id 15.20.4975.011; Wed, 9 Feb 2022
 20:34:10 +0000
Message-ID: <8b59e237-9d0c-bccd-4b55-3000dc045061@amd.com>
Date: Wed, 9 Feb 2022 15:34:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/amdkfd: CRIU return -EFAULT for copy_to_user() failure
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
References: <20220209180958.GC18385@kili>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20220209180958.GC18385@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0411.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::26) To BL1PR12MB5112.namprd12.prod.outlook.com
 (2603:10b6:208:316::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a2d4fa1-d983-4672-e41f-08d9ec0b86b0
X-MS-TrafficTypeDiagnostic: SN1PR12MB2447:EE_
X-Microsoft-Antispam-PRVS: <SN1PR12MB24474A444FF2B0F56683F09F922E9@SN1PR12MB2447.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RlZw71GJCCu5zGjJukQFRX5gD6mYiPD+JpNwMFGle6xR1qs1CPa3S2D0WSRGNTfj9NDih/6GYCe7Jo+PQv2EnQRb+RCUocbjcEPdj3lvsjFnQ88+PA/UDngRDcVG2jSskllZwPM+Mw7uR9HdtT0Un4+3VAbPUryA7sEBKXF83hVr2r7j405T/+cwHiXg/ORd2I4uFFJ5nNZuOyZlp+mb3LKME+TXJ9y/TDoqNfiJMw8++gbW2A5A2tsJA1uQV9RU/XnYacpmu3u8yCEb/7/U2+ChDOL+8Py8dFyr5L1cBDqQthEJ7zz89CUYAvN404psQzK81ORChwicetiWMK/on7p/J1mUP/vKOL7CcayMWEe7GQ4B9wEnM8KFWmUY7i9y1idR12hCbJTRoh8mG1qMOV58YxQyaYpdf7IYS7f1GnWHNGzUTX5jd0vQeLll9ZjMNFgGqZ49ba0QNYNWQ5zeSy79Lp+7L2zyR38pwxX1MFGirhmfZgRMgI50sOQr4Cfcy461QdKE53DFdK01zfLwEP+ENJdk5o8tqzu1fcX5AGc/GhH9TEhhL/DZyVlHK0RY3bxQGvavhthsBsTqxS72h8b30TsYiYx2VRPpVBuNAkNA2Zt2/+4bKUb/knrFcOH8Nngpowm8Dr87FBqe5vVEbXGafx+WQrLGszVVOCaZzrDGfDBIZ8jylgEitcwsVHEvsAsSIQ0UG5Cr2VuHC0mqA3zRdx8VbBetR5uoECVoyTevc67+sPo805/Yx/bGHyBN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5112.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(4326008)(66946007)(8676002)(31686004)(44832011)(5660300002)(26005)(186003)(66476007)(8936002)(6512007)(2616005)(53546011)(54906003)(508600001)(86362001)(36756003)(31696002)(6636002)(66556008)(316002)(36916002)(6486002)(110136005)(2906002)(83380400001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R05JY1F5cE9IaFpBZ05Ed2JuYTEzRFkzRWNPa0VqajBYSXB0cWpDQXAvL3JF?=
 =?utf-8?B?bmhFbUt6Qm1ZZG1QTTJRRTRDZUxya21Ma25RWERmbVpSRUJHSWZUcTdRV3o5?=
 =?utf-8?B?cnJuWG5zNkJZOVp5VWZ6aVcxMTFQQVBCVlQ0MEQyQm9HK3JwbXI1WmdnZnp5?=
 =?utf-8?B?NjFINllpSXZuTUFZT1k4TjdVVmlmdU5ubi85ZzZZRFZURE92Y1NYUzJDdkYy?=
 =?utf-8?B?MW1iY0NjVU1BWkIyTHF0MEplS3ZIOEtHaGIxK2s5a0xmc1VVWVhuT29GWktn?=
 =?utf-8?B?Y3VXRm1WbHZFcmMyb2VKcU05R1A0K0NXdjJ4ZThEM2I1SEc4Q2liM1hNMDBS?=
 =?utf-8?B?LytqWm9uTzN4TENsYTl3SjFGU0pCT0ZlUW5wMDhrUDVCS0puNHludjg0UlFG?=
 =?utf-8?B?VnM3MU5hdnhDc2RWT1lBbEFicSsvQ1gvT1ZEZkpzcm1zQlRNK2N2bjk1eHBP?=
 =?utf-8?B?eXRPcnFZazdpQVhmNFJ5NFBxVkxXbWRIYnR6ZUZyUVN3YXNoOGF6RFk3cnA2?=
 =?utf-8?B?ZG9NVmgvcit3Q3NpMXR3anRMa0Z5bmFEYmphekpFZittN0xZcVlZMW1sUWx4?=
 =?utf-8?B?RmU0R2FXQ05HN01sM1FiWlpPZUI2RVJkUzdSdXk0QmFNdWxpVWcrNHRKRENq?=
 =?utf-8?B?b09GQVlWVDJTZzMxcDh0d0NJdnBZN0R3eEM3ZE44akRNZWpRVWpjSW9QOVBC?=
 =?utf-8?B?aHJYdWhzZzkvYlFJUy9IVkl5NmZYRjdJRmtwR2tURkJTNWUxbTB1dy9pa0Jq?=
 =?utf-8?B?TWdqamVabnhhUEJaNFBadmZnMTN5MGFpZHBJdDY4aHV1RFVVc2NqMTlBdXFx?=
 =?utf-8?B?OXVKV2twN0hRNEhSaG1LN2NzNWh5VFZQNzl6WjRwYTBub2Vwc2Uvb1hkWUFx?=
 =?utf-8?B?R2JuMlFKNmJRMjQwL2ZhWlQ5THZaUTloaThzTW1CMjlwTW13cnh0NXNLeHhn?=
 =?utf-8?B?VitlYzhXSzgvL2pFdTZkcStpYzFhWmJpUmRYdDBFOFJtMHVsV0xXNlBVT2c4?=
 =?utf-8?B?S0RLdTJZUGY2SmZRajJtNGhYcGNQa3hQVEZGanNYYlAyMStoWG15Z3grd0xq?=
 =?utf-8?B?dE1WWjJBWHUyYWZ5ZUoxd2U0UjdScmlwVEdWL3E1UnRqYm4rRlFqYUNycURt?=
 =?utf-8?B?eE5EMTBVeVZETjZIUkI0eE44SlFyajUrdEtnY2pmM1d3Zy9GS3phd0puYnhG?=
 =?utf-8?B?ajYwcUJpdEdrdE9pU1NTRmNlMkNKcWhtZ0pqTms5MVBqUHJXN3NId3NoQ2Z6?=
 =?utf-8?B?ZWwycnNLejZOUmJRNzM4eDYyV05jenZTZFcyZUVlVTh0dVBuWFRkZGZJN3l2?=
 =?utf-8?B?eFhKSXBuOStaWVZnakJtNC8rY0NBMG1kT2RuV2xNemdLM3pxaXRGOHZaM1ZX?=
 =?utf-8?B?QjFLb0V5Q1hNTlM0bytrd3gzVnpQZmNvSkZMWFVyT0dNZ1p6TzMwemdPWEZ5?=
 =?utf-8?B?U1pjNDVsaWtPczgyTlR4em5BSWtFM2FnUVJyU1J2L3FmZEc0V3RZUTRGUDhp?=
 =?utf-8?B?aXAzanhXRXVTdkRpaWxlT1hKNkd3bHZXeW1VTXpxTGZpN1BWOGY1b0JnbEMz?=
 =?utf-8?B?SFU1dDRGSzR4N2dHbDRmNWxwdGJKWWQxRjdNaGlQTjg1T2ROWGVVWVRRSG1P?=
 =?utf-8?B?NXNQZGUyeDZDL3FIYXZkTHRtVklvbVJ5ZEZyY1lodnhEMUkzczFCMit4YjhZ?=
 =?utf-8?B?RDlPSXJ1aFJnMkN2MVlQaXFtOE93cWd1WEhEWUhOSG1xRytyNVdIVm5sSGRQ?=
 =?utf-8?B?Rnc2cnB0QWJPajVza0ljT05GVUtGOFpVR2ZJMEdOTVd2RXBkbDRQWTBnOXh5?=
 =?utf-8?B?RHV2Zk9hTEZsSFdlNVhFQ3hrdFp6RUM5a0NhOC9CZWpxVWtJNW5FK0pKYTVt?=
 =?utf-8?B?b2FDVXpiYnZFVVRkV2hQZS9DSnJ5WHEveFhaTTZaZUZBdGpjenZ2alpML3dS?=
 =?utf-8?B?ZXVHanZiUHJrazJiYzFxdWx4eDVzYlVaRU80bWlVMUpyaWJJSldFSCt5dFpx?=
 =?utf-8?B?TnFHN1Qzb0wxQSt6aTRvalpLMWcrRjVWREE0TW9FbFNEb3ZlQXViejE2NmZn?=
 =?utf-8?B?d1JuMzRyYjVCS1FkWG43Z0x3UE94THNmSXcrRDhpRWtHOTJabjFPR2syRFRx?=
 =?utf-8?B?U01PdW8weG9PakdVUUdvQWFXODIrOU00cFlseWhJdjRCb0wwakFrYThHSHlV?=
 =?utf-8?Q?Ppthy8mlachtNvxpE++6Hzw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a2d4fa1-d983-4672-e41f-08d9ec0b86b0
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5112.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 20:34:10.0045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wE8hhzyDR02scQgVHSLUMLUKI9YSsdi/AZK3F1YeR1wHPo+ZCKEsdgA0hiiGhw5NO0r/rPOJVSA70VJQOTHtSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2447
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 kernel-janitors@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-02-09 13:09, Dan Carpenter wrote:
> If copy_to_user() fails, it returns the number of bytes remaining to
> be copied but we want to return a negative error code (-EFAULT) to the
> user.
>
> Fixes: 9d5dabfeff3c ("drm/amdkfd: CRIU Save Shared Virtual Memory ranges")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thank you Dan. I'm applying your two patches to amd-staging-drm-next.

Regards,
   Felix

> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> index 41f03d165bad..38a056fd0966 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> @@ -3775,10 +3775,10 @@ int kfd_criu_checkpoint_svm(struct kfd_process *p,
>   			goto exit_priv;
>   		}
>   
> -		ret = copy_to_user(user_priv_data + *priv_data_offset,
> -				   svm_priv, svm_priv_data_size);
> -		if (ret) {
> +		if (copy_to_user(user_priv_data + *priv_data_offset, svm_priv,
> +				 svm_priv_data_size)) {
>   			pr_err("Failed to copy svm priv to user\n");
> +			ret = -EFAULT;
>   			goto exit_priv;
>   		}
>   
