Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E32C616129
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 11:47:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1319310E482;
	Wed,  2 Nov 2022 10:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D336B10E473;
 Wed,  2 Nov 2022 10:46:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZxkZKEvT7AcVVKsnrf4LeSfGkkdIJWkGDdb5r63c3bKSGnelFr4hCrU4A6n3JbChASc1AS/vUjMKA5v+dfb+bPksbOinvN9+St4JkFRip7yrGILkVPZSEEl59A7TI7oMKpakVv05cA0S49j2Au82hJvECMmuF9uNlWGrXN6nFxbsdPhltnhGHUwvnGQYtEYodOaRMxtm9bv611gCXUr/KC4sbU2nZm57X+KEOeqyBBuolgLlr1AuptfdqtsqJUS5xru7va0Au2du/KkqjQBxFAXHdCfU+VnxRyBfBJ4bbOU1XTRdVkjUuyldN0PeZNWM/srMKP6YGIyrW8SaMBxNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CebwblwYi1iZ8kmmVbaslbOL/vZyMFHnlUC+fAqCq5o=;
 b=k0QilX9omTqxGFX6Fo5AzMKqI53gGFHM9qNJFICPEEfMod7jhVyfa8pyavynyhI831GrDh/HpiDCYD6IrsBJTodQykfsZ1nm/rISPP/938jRA02C7ZbTrotmfIJvL/pJRwHl8TltUOdhUed6OS8b852BOZl+ElgFN4V8yRYcc1UMB0xW6IvnPlptTeRs85og5tN9qwIGtGY9volmJUHNHyJwcIPmEjh8xBILzJzSn+z9TFJn2b3FkbhIdKR20fzSKifliZqMOtJkiEonDJgvXwTPVHREbToUGnXGy1EwRCnmd0N3MQEDexrTjij6XtA7Ryu/eIZ3I5j+v0TYjh4vRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CebwblwYi1iZ8kmmVbaslbOL/vZyMFHnlUC+fAqCq5o=;
 b=QAY8B2l7+YJcYg/NkHlvXwqNr9YUDmre01YzKpG9O+CP0ZfDEd9zonVEpB+BNW8qEa8SRFyT2QCrDkDIwZJ4Lj5z0MMsIaSEq9ZqlCJvOHvQQQiuby/SdLuav9L2cvgMKQP0BQZzkrSn1Sbk2smPaVXHzsuKsyioDFHRZqTEye0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by IA1PR12MB6330.namprd12.prod.outlook.com (2603:10b6:208:3e4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Wed, 2 Nov
 2022 10:46:45 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5791.020; Wed, 2 Nov 2022
 10:46:45 +0000
Message-ID: <044540cc-1d8b-45da-ac8b-ecc133b45dc1@amd.com>
Date: Wed, 2 Nov 2022 11:46:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] drm/msm: Remove exclusive-fence hack
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20221101214051.159988-1-robdclark@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20221101214051.159988-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P192CA0042.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|IA1PR12MB6330:EE_
X-MS-Office365-Filtering-Correlation-Id: d49319c1-5b36-436b-ff55-08dabcbf890a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: InK157GGcNfLeDdWFMPTcDOFn4D3+RrcduMatmivRqUl7Ub6Vo9FuJTpE9Xf3ORkM+h7kSi6L/SFRpu5ZD4+2RG5ueNNCR61CdZ1ADYpRKYvf+TE3Ib/10w+QBvepzvDoW+08NydnY365myJm3ljrRuZ/93vNx6oAcU7MnWZXab78i4Yj2HuvxowOl6ifuyRO7i141AkKRUJ9aQTzLe1UMaqgk0AyI6d3OufElcQA8tp1NiBMZzC2ZpMtMt+TuwVogCy2sJWJmDENSPzlOM3oM+suZx4E+bJ37IkWdaQHc/gpPeAD8zl96wwMYJQxyBvOyr8jg9432Zu3QHvF4SZbbft1vU60LApqZ30b1JuOVCK06+pJo3SWpIFcXMehsUcbvLGOniVnx/txSraKVXOYP2+wjQU3nT8pAuD8OLqh8lYZGcJ4De8UhPF8yDvo/5UocCljLR0urif00AM8m0ecJpLpnV1gPGqdc9OMmz5bfkFdKujTBT2Vka35/E4XMeqRSFsM5KxF0us5SbZMWFKtXVRaklEq+oT6JggQST+7+jpigkqvUmxdLB0UtyzETMf1y3ycgdAW+5TIIHssMtZym3V+yGaRIN7G98XV5Kmc5s3dEJcy2rRLqe5qEyy24EIoJD2xik4ZSF6tkLBwISu2lC8BvFd24QngFXQooSiMqGRcQH+S8x9d3ruF80AwPCCbuZi+78bQ3442PYAeaZjXvr5pPbCFVCvf7uQkFRNQ8EToX9xxrMsMgcGNC7XusvT0efKekk/apF9SfsS3UBDvtHb4gKQDq8S/bkGPooCaFA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(376002)(39860400002)(366004)(396003)(451199015)(478600001)(4326008)(8676002)(66476007)(66946007)(54906003)(5660300002)(66556008)(8936002)(316002)(2906002)(6486002)(41300700001)(83380400001)(7416002)(38100700002)(31696002)(6666004)(6506007)(86362001)(66574015)(2616005)(6512007)(186003)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OU8wQmJ0NjZuS0YwSHhDNHkyTTRocXNrdjFxSG1iSmhkWW1HM3h3WHR4Rm9R?=
 =?utf-8?B?T0hjWjlJakh2Y0pSZXE2Kzd5elVDMExFZm0wazdaOTJ3Q084UExwWWFXc3V5?=
 =?utf-8?B?ek5VOEhiOHZjOXVaK1NJL3YyWm00alExOFAySks1Vkx0bkd1WUtmNU41czNN?=
 =?utf-8?B?dFByUG9qdHdyVkpHbUpQTTg4ZWJadHhYa3k5Z1ZCM25wTy9zdDRPblA5WW0w?=
 =?utf-8?B?MGlIbGxrdHhGbWVIYzJwcXlRY2llV0RqU1VYZmtRYlQ0RjA3WWpRbVFCU2E4?=
 =?utf-8?B?WjNFVG51QWROSUdzTnJ0by9oVTVwQ1BZem5kTHo3SW1HeGtvbWsyVUxYMXJx?=
 =?utf-8?B?bnFxUDVaaHJjYXpoc1lRN0drRmJRQUxNRGpGK0VXd3kxbHF2aHVrV29naUpG?=
 =?utf-8?B?cUtZbHhDbGJVN282ckFpTS9ZSGlrdWwyZ2k3MjNBcFUwVW02RnJwa1hFL2Uw?=
 =?utf-8?B?Z3J0Yk5WZEFOeFZQTnJOdkZpblAwNm4vUnR0MW5xblI0Rmd3VmlaL2tjR0hY?=
 =?utf-8?B?YmpkREFBeHZyL2JjWWFvQUZzT0tTQzdkaE9NaFBHLzhuc1JzK2llcHlIUU1G?=
 =?utf-8?B?TkNjTFFqYmNjU2ZyZGY4WEtuQitPWlpVRFVzNmpLUkFpVDFPZkZGZTBDdXYz?=
 =?utf-8?B?T1JSbVN6Q1BhVzJpT0tZeFlRemRjdHJlQ1lVTUJBVmFSTG5zSGtUbVZNeUNl?=
 =?utf-8?B?WmFYZytxb0VxTldWNnY2K005alZxS2drVGkvRTFHSlB5cW1DRzRnOUU4VXJy?=
 =?utf-8?B?NmJHa2tPcVJ3SjhkVlg4OEVxUDdjWkFQblVLZWhOSExIeUhMV2dNMy8rY0Vj?=
 =?utf-8?B?WU1rMnlCQXVSWTVIY0RUNTJLN2NrVzgvUHpSZmVvQjFhdGVjR1RXR3g0RXZG?=
 =?utf-8?B?eXpaWExrbVRBZkU1TWladXNzbFVWcU9XcFNSTWVPT0xlQlYvREZrckVzdU5s?=
 =?utf-8?B?czNNWWdYZ3R1VWJOeDNVMDRveEFZQkpzdkRLb1B6MVVlSlMyVXNmUFNoR3ZQ?=
 =?utf-8?B?b2luRkMzZHhwQWRWbERHOFhSQzY0OHZ3NTBicGxnb3hxVGtoQlBnZFUxUkFG?=
 =?utf-8?B?QmI0UzVJU3VIMnk2ajVrREZ2V1l2YldPZVJ5UmdLaXkzRXJYWFRYVG9UR21N?=
 =?utf-8?B?NXdwVCs2c05yRTl1aHNJNHF5VzdaZDB1dU5KYjRBU0tUN250OEVBLzdZUUc5?=
 =?utf-8?B?NHpGTk14VUhCQnVLRjcrQ0VyYXFUeUY2c0k5dDFzME1KRGhTbHVUdlBnUkl5?=
 =?utf-8?B?TUladWUzUUNwR1lwSnV3UDhEQTZEakZma0JWMDMwMTVhTGdudzQ5a1RxT1JM?=
 =?utf-8?B?aTlyUTg5YkJLdlZKT2JOMVNGalhLVUxjYnZ0dkdvQ2pQNVpYWGxiL0JkQlBB?=
 =?utf-8?B?c1J1a3B2dFdacGtOVFFIWkpDcFN3TFFwNXlLbXRONjRUYjd6VDFsR0R6TDZM?=
 =?utf-8?B?eERFYnZXc2RBMjVNZXpBbUdTZlppYjNvbGNtbFdzMzIrUUdEQi9GRlVFRzRZ?=
 =?utf-8?B?ODNneUdXTGd0ZmtFWlhEaXJXMXVSK0FsR3ozY0dxN0g4RHNaai9MMHpud3gx?=
 =?utf-8?B?ZC9acUNJaUtZVm5LSHpPTUd0YnRybzRwZkVPTmJ1anlOelR1UkVUSityOGIz?=
 =?utf-8?B?M3BIMFlDNkJXZE8wOGpVYVpsVzVHcmtKUEUxNWpvQ09sdFM0QmdJa0x0cTFF?=
 =?utf-8?B?bTljRHc1MkRRTHlsYVNNNHh3TUVodnErUWthVFM3Qk1UTGxtVyttL05OS3VT?=
 =?utf-8?B?WUlVOGQrUXBUZGRBQTIxQTlsZXhROTA5dDFtckdMcVd1c1I1VWZreU9leVp5?=
 =?utf-8?B?RzkwUVQ4OTdUOUcyMzNISmlFbUFwaHp4ZmNkWGtrYVBRc0x5ZjhTbEtGYk1B?=
 =?utf-8?B?YjJQWHpzR0lRUS95SFB2TE1lV0RXVGo1L1p1MWVaaWtvY0RQWVpFVEZmQVl2?=
 =?utf-8?B?WnlOUDdISTJiOG9oeWg3UjJuckx4R2xIdWRNYkJNU2xxbm8rVTVJdi9iT2lG?=
 =?utf-8?B?cWM2amZaZ24yd3JrZndNK1ZvOXFnZmFQUERFSkJscDkxTjZPa3ViTFhac09D?=
 =?utf-8?B?WmczTnltZ0tiYUJXb2h6RzdRWDVSQWl4cmtLTzRLV2ZCWmlrWXpGS3ZzbHla?=
 =?utf-8?B?NklPT0ptTnJKRWlJTVhHSnpSZFV1K2x0Snc4dDJ3c01icVBvck9Bckd2Qkx6?=
 =?utf-8?Q?bwz2hLaP+6gyZeDCZ16/pk1kal9gIkPayroElts0thc0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d49319c1-5b36-436b-ff55-08dabcbf890a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 10:46:45.2821 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wos84bUjMosLAVG7sRUFJouZPYjyyF0cYSbLZBVSz+iowfnOxYXVDWt4DwwKgKTF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6330
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <sean@poorly.run>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 01.11.22 um 22:40 schrieb Rob Clark:
> From: Rob Clark <robdclark@chromium.org>
>
> The workaround was initially necessary due to dma_resv having only a
> single exclusive fence slot, yet whe don't necessarily know what order
> the gpu scheduler will schedule jobs.  Unfortunately this workaround
> also has the result of forcing implicit sync, even when userspace does
> not want it.
>
> However, since commit 047a1b877ed4 ("dma-buf & drm/amdgpu: remove
> dma_resv workaround") the workaround is no longer needed.  So remove
> it.  This effectively reverts commit f1b3f696a084 ("drm/msm: Don't
> break exclusive fence ordering")
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Oh, yes please. I had that on my todo list for after the initial patch 
had landed, but couldn't find the time to look into it once more.

There was another case with one of the other ARM drivers which could be 
cleaned up now, but I can't find it any more of hand.

Anyway this patch here is Acked-by: Christian König 
<christian.koenig@amd.com>.

Regards,
Christian.

> ---
>   drivers/gpu/drm/msm/msm_gem_submit.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 5599d93ec0d2..cc48f73adadf 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -334,8 +334,7 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
>   		if (ret)
>   			return ret;
>   
> -		/* exclusive fences must be ordered */
> -		if (no_implicit && !write)
> +		if (no_implicit)
>   			continue;
>   
>   		ret = drm_sched_job_add_implicit_dependencies(&submit->base,

