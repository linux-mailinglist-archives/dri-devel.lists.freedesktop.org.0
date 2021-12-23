Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF8E47E092
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 09:42:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED0410E2A9;
	Thu, 23 Dec 2021 08:42:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC01310E2A7;
 Thu, 23 Dec 2021 08:42:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QI8Ljrizbk73m6BYjLExIxNWRudx9coU2ni2YkHjsQk2AhPYKPnyifJ21APDY97oigTWo/PKX3WAoCsfj9mqwMt9sGxYzFyNaU7Qex29twZc1VSmhqGfQtY1aUyBQ/e06bxQt4MBBIqVtq2uMZwa/+tuC5RH2ICXaR/3Um/ZQr0VhtPXAYzC5RGXpdSNKxzN91negUUd5+ByuIt6PGnhvXfb6wOZWJ1xpv5sx7mktZ/w7dClN6AgBrDYjnpu51kPb74KHWz/XWMkYljqu8Jcn1XrNnarC8iDgyL3uM+4TgL/s5mFGHoWLtzODNVIrCOQzll3wr39NPID7xdPktjGNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=74PW3jGy+ZuIoh8x4fm1WADrO2LAUQL3aGeeBPrPkEU=;
 b=E1nKWPJolid/tduUMX1MK/T0cRZRyFnwQ/HesAPLI2jm+aLKI4J2XA1WKecPlSZhCSD+L3TS3a5PZ74M2IqYLF2/IJqkISXbAX9cI3ZpwanI1Qc0dTXtkF9fyHPx0KyTv88QQtnM8v+CY+KLUOZIAH7JS6MZ3NEnC15v0Tcch1xf9b3xwGPDFCbwxL+JQPowlNwCGzPdIsOORiBSwkOJkZ02LcUE0pXKYO+wJo20kATMQZB8kF740iSxKHaX0MQxRUSBCtrPfWfJ8CcO8i+1F2hbznzbR2Gzn+iSo1L1BodWeND8YO30o+qcYYeQbgZMZeAmQOSzMrZGf0JdqtMsHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74PW3jGy+ZuIoh8x4fm1WADrO2LAUQL3aGeeBPrPkEU=;
 b=KS85BB4FKkRjxajoaNZc99u7Qk98XgAAB5N99DwJh2/PTKnbZJYcxXS4V/6+WHcd273ZxlRtUQXFPSSe4wWBKbzIiugm2xCbLJ/SD18Ff6BUXz7PLP0uuRmjuxkcynHSalu6AUI9CtFTgymJrnEdeKhTgsx3ST4cvCZkGq3ekiI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW3PR12MB4458.namprd12.prod.outlook.com
 (2603:10b6:303:5d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Thu, 23 Dec
 2021 08:42:31 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4%12]) with mapi id 15.20.4823.019; Thu, 23 Dec
 2021 08:42:31 +0000
Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection
 for SRIOV
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
 <20211222221400.790842-1-andrey.grodzovsky@amd.com>
 <20211222221400.790842-4-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <9125ac3a-e578-6b34-1533-7622ec0274f1@amd.com>
Date: Thu, 23 Dec 2021 09:42:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211222221400.790842-4-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM5PR0601CA0034.eurprd06.prod.outlook.com
 (2603:10a6:203:68::20) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89568a9b-17b2-4390-bcb3-08d9c5f0285a
X-MS-TrafficTypeDiagnostic: MW3PR12MB4458:EE_
X-Microsoft-Antispam-PRVS: <MW3PR12MB44584ADF53124577E22112CF837E9@MW3PR12MB4458.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: butf3UDnlcDUCrEWzcIIq0lGE897wi4Slwe5vFNmlzreNcN3mJnJL4NCj7QVNQpNkBXHbcp5RuVIzWJ+wcjHSkMFtJgRFkgt1da1Wi0qtXwr07++n5zbDiOL8Ztdnfo9kU1KGJDS9t6SpuIhqUpr+5bLUAfxBjNGi4LQF7LCrY1x2aOo9h/q14etbmgI4yUkronldB9k84Uw1UQSOO1ti0gD5WwBB8OegxYAxwSYZuHnRtQgK+//WVkPQM68aVLJ8nlP9nBtG0ZxQttUVZxl5+NTej8cHHKcnR2DWDlfehf/88ZtxYx5UahkdSnkDuHYsj+RVBivYqPFwyskHWA39tRmhxbHG5HUfpXbhoAsZZztZQFfbmz4Nw+Q8Be2KLv4NScLNDoWRUklEbLMIiTnuJxrey9nBdfymqzaBGrcBrjZ7yZvOmgdAN2qnLW8+IRfRzRW6TEwBKJlAzF6aRTR8wr0fWumgnztqOq8jsSfetPOCcqmY4RrO9+uu973i72lJy/p7IlJUld8tPznnVE3wDKbCEBinuJxw9KH7auz5IYlXPd6jHpC+nKc0c9ekvFHXk2RpWs8bY1U9nQGn39FjjovZoxXGD9D6T3w4q2dOF7RbSwZWzZp77dQNdma9A1KUIsz5l7T3ED9F5d2d5mk35VPuTn9OtxkxvZU6k4WPEVJPgwW7zNaHb1Ju44l+4xnYJO6oDPWk///XLo5k0JqgfPJXQ0uA7+583Sggq8gtLLKIfAf6ZrDm65ZcI5mSa0h
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(6486002)(2616005)(4326008)(31686004)(5660300002)(66574015)(36756003)(8676002)(31696002)(8936002)(38100700002)(83380400001)(66476007)(6506007)(86362001)(508600001)(66556008)(26005)(66946007)(2906002)(6512007)(6666004)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0djU2FYMGpJeFdFT0ZCZHpoVUZtblp1aEN0aGRHQ2lWL2ZsTlo0NFVrdjFx?=
 =?utf-8?B?d0JGZ3RLWDRXUVlFNlQ1UjlRMEpqQXJsRW9JNi9wUTZaQ3NlNTFxaXU5SzZG?=
 =?utf-8?B?N0krSW93Q01QemFydzJQZGVUME9XMWc0K2NORXRsaUZGK29xUXR0d0JVOUxR?=
 =?utf-8?B?Y0R4Um9Meld2VTliSkJ0SjBzdEJMcUFYM2tPdjJsWTEyUm94MXpPbFVCdDl4?=
 =?utf-8?B?eE9adU5NamkwcHpCL0FucitXUjZLclBWYXZzYzNXVk9ac0thK1c1YS9aQThs?=
 =?utf-8?B?SUFsaGRxRHh5WXh5QzNWSjhoK0l6Y0daYU5lbHZ3MVhyLzlPTlR2WWU5dHBQ?=
 =?utf-8?B?dzdQK0VWVVlYM0dYUDgvRUJjN1VUNGpLTWlxbFRJSHNEQnd5aEVHVXFMMFEv?=
 =?utf-8?B?NkZDeGxFbXRtUHovcHVjdVlvSHBVQmtZT2pGU2E3emdNUTJNWXhDbkJTVlRZ?=
 =?utf-8?B?OStYUFNCenV3NmlycEZmTEJvVnRRdWhTeFBXZmJObjN6cHI5TENhTk40ZkVU?=
 =?utf-8?B?WnR2S2tsOTBBY3lCUFJDODdsaC9BY1ZXUHQ3SG9UMzJHV0JvUmdNM1J6R09u?=
 =?utf-8?B?bi8yeGdoWmJqUHZCN3FYbGlmcXFqcGpUY09icGtSZ0M3NUdRSUUwdWl5K1ZS?=
 =?utf-8?B?eHRUbDU3K1B6TjNtcWFZQ1dmZXZ4YmExU2szTG9IakkvOW9nWElpNkZiQUho?=
 =?utf-8?B?SXZacDlFM3FCMGZRc2w2Q0NIZG1YQ2t2cTU2bWJORG5VNTR5SFg2Y1k0SmtX?=
 =?utf-8?B?MjU2bU5MZ05wNUVUNUlJSzN3QXlZcGIwNnZWakZNKzFNSHM2Y09jSkk3NXRm?=
 =?utf-8?B?K245bFEwWkZ2Wk5PU0RSZ2p4SjZ6dko2SFBtc0pHYmYzMFdqb2MxaHRXL2JV?=
 =?utf-8?B?SDZUVnRuK0s0QURTY3lQaTdEYjY5YzQyUjhmY0xnSzhZOElMUHBMWS84c3k2?=
 =?utf-8?B?RTIyZGtRNm4zb0VmUlBVS0g2R3lXaERmMjBwMlFJQWJrR2ZzRTdiVGsvbXVC?=
 =?utf-8?B?TFYrQ0Rnb2owOXN6T0ZXWjc0NmYxVm03R3ZrK0YxT0xnREdscmpOLyt5eW1J?=
 =?utf-8?B?bTBVb0VsOVQ2NUtvVGt0VjNETjhYYzFVNlJ2djBuRjlvRnlaWmNIOUZwSzJp?=
 =?utf-8?B?dFR4aEFNdE15SFliUlBPQUFhZDVFRFBrK3I2WjE0U3FyWmpZeUdUMmdxR1li?=
 =?utf-8?B?VHFBcElUSVhqQWc0QUNTRVorUUJ5OFdhc3dqMkpxZEtLWWhiM3hSaVNjbGRC?=
 =?utf-8?B?VjNTZ0Z5dnI1YmlWczlpUGdnb1Nzc2pwT0dZdlQwNThLS2xzeGZKTXFPcVVO?=
 =?utf-8?B?ZWRiWUxJZDJLbURYTk13NUk5SFEwdk4xQWJEeWJqSlJFY2ZNUGxOeFhFKzRO?=
 =?utf-8?B?RitZVEFDSzFUVzZXd3RScnlSRmZzdWNLQVRrc0VKU2xFRnZZOXpMU1lqZklF?=
 =?utf-8?B?eVNUanhDTjZGamtLdHIwaSswL1JuZFd6aGdieElsaVVQZGYzOGlXS0tHMDlz?=
 =?utf-8?B?TWRxeVl3Z2JzM2Y5d3M2aFZGblo4ZnM2d214OWd1b0cvS1NTZ2t6UUdiTllj?=
 =?utf-8?B?ZEdhZVgxdU1OUS9QYnZXaTBra1JPVlNSVGN3d0F5Q2tHMDN4NlVXSHZxS3Vo?=
 =?utf-8?B?TzNveVhTTWxPeDc2THZiV25FQjJxVmZyL3hhRlBPL0N2bnJqZ3h1TTNrMHpm?=
 =?utf-8?B?cHlTMGJFVThkbEVBOXlKS0w0dzZiRWxuU0lkdEpGcjRuSkNKd291QWNFb2FI?=
 =?utf-8?B?cCtRRUkzQkJaUnhYQ3BTTU1pNFVlR09NQ0hUWnp3V3g0WFR2aWZnaHFBSEJ6?=
 =?utf-8?B?MnZwWmRxcjBEM0tMVGxOSW5BSjdhQ0pBUkkrTUF1S1AyVzZlbHlPM2FIK1FO?=
 =?utf-8?B?bSt3dW5MSGRQU1JyNVZLV3VDL2E3bzhySHlLSFI1VTVyOGRQUWJiM2JsYVlK?=
 =?utf-8?B?SENnWVlZRGdvV1pQZ2gwWXE2VzgveFRQVjArb21ydzB2a0pjL011SzJmYUhF?=
 =?utf-8?B?aUdVQjNZenNwNU5jTk5lOWphN0lGK00yN1FUWW10R0ZsQ01BcmQ3bHYwKzZw?=
 =?utf-8?B?YWpHNnhrd2hoL0tjcmFsNUJDR01GVEZtQ0xORDJYK3VJcTE0RTFCNjdRaU5q?=
 =?utf-8?Q?Z4Ps=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89568a9b-17b2-4390-bcb3-08d9c5f0285a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 08:42:31.2512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XOpMIShnJ2ekb77sptZQKx5XH0iDaTtOl4S/UEjL32rpAPjI3oe62zkGOsgnlFbO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4458
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
Cc: horace.chen@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.12.21 um 23:14 schrieb Andrey Grodzovsky:
> Since now flr work is serialized against  GPU resets
> there is no need for this.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c | 11 -----------
>   drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c | 11 -----------
>   2 files changed, 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
> index 487cd654b69e..7d59a66e3988 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
> @@ -248,15 +248,7 @@ static void xgpu_ai_mailbox_flr_work(struct work_struct *work)
>   	struct amdgpu_device *adev = container_of(virt, struct amdgpu_device, virt);
>   	int timeout = AI_MAILBOX_POLL_FLR_TIMEDOUT;
>   
> -	/* block amdgpu_gpu_recover till msg FLR COMPLETE received,
> -	 * otherwise the mailbox msg will be ruined/reseted by
> -	 * the VF FLR.
> -	 */
> -	if (!down_write_trylock(&adev->reset_sem))
> -		return;
> -
>   	amdgpu_virt_fini_data_exchange(adev);
> -	atomic_set(&adev->in_gpu_reset, 1);
>   
>   	xgpu_ai_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0, 0, 0);
>   
> @@ -269,9 +261,6 @@ static void xgpu_ai_mailbox_flr_work(struct work_struct *work)
>   	} while (timeout > 1);
>   
>   flr_done:
> -	atomic_set(&adev->in_gpu_reset, 0);
> -	up_write(&adev->reset_sem);
> -
>   	/* Trigger recovery for world switch failure if no TDR */
>   	if (amdgpu_device_should_recover_gpu(adev)
>   		&& (!amdgpu_device_has_job_running(adev) ||
> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
> index e3869067a31d..f82c066c8e8d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
> @@ -277,15 +277,7 @@ static void xgpu_nv_mailbox_flr_work(struct work_struct *work)
>   	struct amdgpu_device *adev = container_of(virt, struct amdgpu_device, virt);
>   	int timeout = NV_MAILBOX_POLL_FLR_TIMEDOUT;
>   
> -	/* block amdgpu_gpu_recover till msg FLR COMPLETE received,
> -	 * otherwise the mailbox msg will be ruined/reseted by
> -	 * the VF FLR.
> -	 */
> -	if (!down_write_trylock(&adev->reset_sem))
> -		return;
> -
>   	amdgpu_virt_fini_data_exchange(adev);
> -	atomic_set(&adev->in_gpu_reset, 1);
>   
>   	xgpu_nv_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0, 0, 0);
>   
> @@ -298,9 +290,6 @@ static void xgpu_nv_mailbox_flr_work(struct work_struct *work)
>   	} while (timeout > 1);
>   
>   flr_done:
> -	atomic_set(&adev->in_gpu_reset, 0);
> -	up_write(&adev->reset_sem);
> -
>   	/* Trigger recovery for world switch failure if no TDR */
>   	if (amdgpu_device_should_recover_gpu(adev)
>   		&& (!amdgpu_device_has_job_running(adev) ||

