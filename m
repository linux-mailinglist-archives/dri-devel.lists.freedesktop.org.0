Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B0E394448
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 16:37:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DDB86F5CD;
	Fri, 28 May 2021 14:37:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF2C6E49F;
 Fri, 28 May 2021 14:37:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V1ICARNm+vKMtCQkEqrh7lqAp7gy9m3hKiof5OfqiAEqKY7cOHy0LXAFbM3hFuabqFQsCQ4tQjjgzokfsLSP7pwKXAtUWkWoCcObdG1JOSgXbEvPxWAZ3VOYsvQ14dUHfD1Bu2O89otGABIIHcny/UB7ZyeBgb3TiZUC00HXpJ3hMudQo0zR+LZKYUPHycl1dcrEDA3k/5tqxotN645um0JreQB81twsnnKPasimneJnozRJYkTEQGzC/PtZnsTRQr2IHBtaPS40KP1PuySGLZdGDJTUFsXAZjzH8BBKhGgw9F6uB0P5uYm0LKyB51SJCYo3Ku1ifmv1aUFw/RLjjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hvPJ3pxfOJfF5qq/496inhAX+UrNXiLHKCFWeGSPDFg=;
 b=goGo8No6et2sleYOcNas71uVMwuEaUkWWaHdYOTQYpmpmPs1A0KHTcQUqhfloU+eTfhRcv4XqMZxAAoRTa7fUiQiQIh+wygwIw8JBMxpA4++5IZ35wD0fREitPRXJZ2GcheQKyQxKOB64MNULtlxN4B+B5yGlO13I+BUqHqO8Zvn5qIE+K1VNIyb5YAM1ec5QPhDxUjoBWunqPNuJgC+dFqdeMoG0vQVbNe29MbRLZYd7HVxedxWGDiEQ+Y76CgA+Pih4mO1jH7cKwbBxtQRsagRXMvgkpJMVIRSS7YDfDntlg+WEsob/Pf7tz0FPevKg/TdzBSvZTaHgfM4/zFm5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hvPJ3pxfOJfF5qq/496inhAX+UrNXiLHKCFWeGSPDFg=;
 b=4XjGMpm2hneOeXQIL/Ym3B5BAIKbYzxa8vq3u4fFZy281+ji4/TgoW2N9Ej3jikhwQ+i79hS3CFYAl99KWv6K0ACDmELVK2cbqbRTWyseAWy0AeyD1xeB27UUH9vci1KUJcBmZxlworL6w6NowuzFup41nVYHm2zJ+CbgIcExoM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4112.namprd12.prod.outlook.com (2603:10b6:208:19a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Fri, 28 May
 2021 14:36:57 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4173.024; Fri, 28 May 2021
 14:36:57 +0000
Subject: Re: [PATCH 1/1] drm/amdgpu: make sure we unpin the UVD BO
To: Nirmoy Das <nirmoy.das@amd.com>
References: <20210420105013.6486-1-nirmoy.das@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <cc3630e3-aaa1-c190-8218-1a2ac1ed243d@amd.com>
Date: Fri, 28 May 2021 16:36:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210420105013.6486-1-nirmoy.das@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:a878:922a:f147:ebc]
X-ClientProxiedBy: AM3PR05CA0155.eurprd05.prod.outlook.com
 (2603:10a6:207:3::33) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:a878:922a:f147:ebc]
 (2a02:908:1252:fb60:a878:922a:f147:ebc) by
 AM3PR05CA0155.eurprd05.prod.outlook.com (2603:10a6:207:3::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Fri, 28 May 2021 14:36:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce2b245d-5af4-411d-c85a-08d921e60ba9
X-MS-TrafficTypeDiagnostic: MN2PR12MB4112:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB41120C3BBDC34E1DCDEDDEF883229@MN2PR12MB4112.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:608;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dmL84VGsY8O/g9ZqZJz1+8B3x/g7v/KlzeKo3iQ0Wn527FdUnE+99kd7Etm/JTTVxL2+jE6L6XwKS840D+kAmNrRJ27wToIjKvYt4REUvIw+X9N1l91jBhO/Lwkevgm/WMvbb5hZt//ZzJNcdbGunCCrqqLwxmaBKwpabsI68SJYYiHUqUmw+X3LmC/T3PLwhEvoJbytsv3QqSwkXImewp4m6bFgnoIAruynxXBYQ9LgNafbHlyABZz/8LKl43jjMOvLPd81bSrOKBmZ6NfyfxXXtH5nz18+YipmJM/XAjk/yqPj9ap8JrO9haEmkEiS5yUkfr5ea6TVu38717CNgCtomObZHRbckx2TZGkqSVaqaUsRK0W93rzgWa1ZZGmUpD4NeMDLEr+bNyLM+nayxTW1v9QS0glQhtMsp+UBuunB/DP84+azJJ8nNOel17/ZAtiFu5W7ty7W5+OmqBhD9ycdkMAZd+Wi228jVVOmad/G5waukPjDq9tY9M7MW9fMXs2g6CN75WZ4v8WZuX412J2QtuvfIU57v1DQUtBl3ThPLHPGxzJKhgLf84nFAfoQww4bc0W+KRXqy6/wRuapuJKF4vHa8p15pDQWjkpa8i0nknsHg7bMyb0Ok4dyzc6lhWWx/RssR7eNMWxccY3Dxw4PxyGp9d5+P36zqaToOgukAe4zjVYTmenesylvjdS7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(376002)(136003)(346002)(86362001)(8936002)(5660300002)(31696002)(478600001)(36756003)(38100700002)(6486002)(8676002)(66476007)(4326008)(66946007)(6862004)(66556008)(4744005)(2906002)(6666004)(450100002)(6636002)(31686004)(186003)(316002)(37006003)(16526019)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RkFtV2w1RGFoSlgxL3ZIOW83Qk5ORFVJVk9SUmh5VkhRbkQvTEViNzRsYkZB?=
 =?utf-8?B?TFRTbFhMcEpBL242b1RBeFE3YW9QR242TWlzT3J4eDI5c2RIZjgweVV4VkN0?=
 =?utf-8?B?L1JETXJjSjl6ODlNb2lPR1I2SUQwdUlQZWt3L28xQnBuRkRKMmp2N05qSVcx?=
 =?utf-8?B?bFJUZnY0OVdHL29hU3JLc2xnamgreWJkdTc5QmwrdFJOSFBlQUk5ckZjZEJ1?=
 =?utf-8?B?bUxUemtSc3hLMEhhbHFQTmkrRXVYeFVoWG9kYlJQS3lXZWJyL0JhdVd1akkw?=
 =?utf-8?B?V2xwWVZ3TDlFazI0a3lrODBvUTkvVWplZ0RSR3ZmanJERU91c1lsc1VkdzJv?=
 =?utf-8?B?a0Y2d3piRW1HRU1QL29RVHlZU2Z2Y3Rhb3A2Y29yQnRkWHhUNTNJeDYxb2lE?=
 =?utf-8?B?VUlpc20rOFBMbkY0MHFXeVBRazBYRVdqMTR5NHUycVFOS2NSbmdFTzhPbCtY?=
 =?utf-8?B?cGNwcGY1NnlHakJkMmh0aGxMeEthdFJiNGVuN1R4cWx3MDRCWjI0aUlING5o?=
 =?utf-8?B?U25uU0tERSsxcXNrNEcvZ0V0OC9OOGZYWGlZRXpHUFFCcUpRNHpzQ3NueTJz?=
 =?utf-8?B?NS95UU5pS3RnVEVDcW5LM2lSZEJQVmNIWjRza1pwNXJ4V1IzU0NTZUpvWXUv?=
 =?utf-8?B?YUdESHlMbW8zaXJlL2dNbmRpTTRtcTNsRjRCd1FISEVjN25VR3NUQXcwYkZr?=
 =?utf-8?B?NXRzNnZTZ0psZ0pHdzMyTExFMGlYSjVQVVl2NGdFZnhMVCtZdURSTjZIRG1N?=
 =?utf-8?B?bHJVd0t1RjBrUWlVSWdhQjBoN3hJam1EWGs2YkJpQW04ZG56UGswenBtWXRS?=
 =?utf-8?B?MXFnbXQveTBoczNpdmxVZ3VMc1pQTnJ3SmoraXV6SDVhOVlLT1dPYVM5Vlps?=
 =?utf-8?B?ZFE4TGE5T0g2MnFRMnB2QitrMTJGRXNwNzBpUDJZWTZpdXRNWitnWU9CVEFG?=
 =?utf-8?B?VGR3cTN2amR4U2dNbHBSUUdrM2NpVkg5UzRmTDVrTVhGVTdsZHpNOEZDZm1V?=
 =?utf-8?B?TWF2dHJLRXliY2hxOFlORGFmNTMzaDNseXVrK080cFBkSTlLd3RhWCtDeGZz?=
 =?utf-8?B?aDhlUXRzSDFpWU9mZ3FBajRYb3NUcGhmTEFQa1NTcGNydkRRVnFuZ0xBYVpP?=
 =?utf-8?B?TGQrMkxSc3ViaXBXaTZ2NytXYXUwTUNpQnU0MkVQSWpsaWdvT1EveGY0U0pB?=
 =?utf-8?B?NmVoMHpMWjFDVGUrUzZCU1hUalRoREhkL1ZQZzBCcnhseEdGenhEU0NNQTJq?=
 =?utf-8?B?TmlsMEc2R0k3N2VRclRRQ1BkNEdTK0U5WU52QnY4cXRkZ0trTW1Za1ZRR2Jw?=
 =?utf-8?B?Tm9QNi8xUDA0U04vcDRSOXZUNkJBSTFSRGVjQzdlbUZLcTJ1TTNrVUV3b3Fa?=
 =?utf-8?B?K2ZweklzSm9Ec1JPNlJrQm9Jbi82Rk12WHZTWmFidFdFbUFXOTJvZDR6bUlC?=
 =?utf-8?B?ZVFmUEFYWFhXRFE0c0greWJEVExSMFV2blI5ck5LbUYyalUxNGNIOXhuUC9P?=
 =?utf-8?B?THFRR2ttekdQWCtXMFFOQ0dkd1MyQ3A1M283U3UrYkVhdVMrekJGVGRFRHVo?=
 =?utf-8?B?L2ZzclMvczNsT2RNaWxwdDdDYm5xbkwrNnQ4amlYMzVja05IR0tYcVFKQnZN?=
 =?utf-8?B?aDlOdTJzZ3RmYTNnQndweWN4VkpCTWlBbXNxNmNieTVmRllBSEpESkhYTG5u?=
 =?utf-8?B?QzhidUZEd05QbCsxOTc0RnB4QXNFTjRIUmhTdytmM1RZcUJCUFA3UGlOYVRN?=
 =?utf-8?B?dWtKSVdCNnZOVWRaMTlCRUFRMk0yaDNpQ1VNcG50d2tvdDkrRGppNmg3R2VB?=
 =?utf-8?B?Y1doQzZiYytaRjNKKzRiUVZ1Y014K3VMcDF6MW95UUtUdTFOQlhoRXZ6T1Vq?=
 =?utf-8?Q?x4keVa2qaFqXl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce2b245d-5af4-411d-c85a-08d921e60ba9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 14:36:57.5704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mVayJXMjvlSMHPx93BGwO6Ocp7FFu26XfjfRONN7KGOcdHLLQHg4ejdIpsyhBkfF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4112
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.04.21 um 12:50 schrieb Nirmoy Das:
> Releasing pinned BOs is illegal now.
> UVD 6 was missing from:
> commit 2f40801dc553 ("drm/amdgpu: make sure we unpin the UVD BO")
>
> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

Maybe add a CC:stable tag as well.

Sorry I somehow overlooked this patch. Can you make sure that it lands 
in amd-staging-drm-next ASAP? We have an user complaining.

Thanks,
Christian.

> ---
>   drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
> index 760859880c1e..4eebf973a065 100644
> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
> @@ -357,6 +357,7 @@ static int uvd_v6_0_enc_ring_test_ib(struct amdgpu_ring *ring, long timeout)
>   
>   error:
>   	dma_fence_put(fence);
> +	amdgpu_bo_unpin(bo);
>   	amdgpu_bo_unreserve(bo);
>   	amdgpu_bo_unref(&bo);
>   	return r;

