Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7626B1059
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 18:42:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C5510E6BA;
	Wed,  8 Mar 2023 17:42:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::617])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2121C10E6BA;
 Wed,  8 Mar 2023 17:42:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dQDkPUG/9MHD+9EFu2aQCsn+PHPcItEviAO+rZT6LZ16A0VaoLc4EbGgR7tuwcee3DD3QrpMB/K0dgZM0tJgsze00C/PWHCK85S3dC8FfgxZYObUZ64ZrN5nUHXA388I1z2oLf1Hoe6tWpQRxI2hUdoiWiTA1RGMgUyYky0s8bGka97/AsEnD286v3SxUmmUNFxx5ohRuFcS8BK4V6+L9W0UXRUNwfxYsmHaoWX26svjEiBaZ+JIk9dtc6uPeL13xjuXOfNrROK/8zjgKMNWy54Ih+VV/voNHFuohg/xqTOAxjmUuQVh7Extji4Z6LV4oKikhp5athktlKH9dCljKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QUCxZlcBCbb1dOLI/WwZEKCUc3T/QMzOKBs+Jou2vL8=;
 b=OYyt65ASmD/I6FIPTfHLTy4VLhqMgjZiJMolxaTBhsBBqJyPBHO8r1nFrPdT5ctX6MAztha6sGzhRg8Bun7NkZ5MeI1D7/g4dNVnCHgC1EJikDX8/xYCRScikS2KkLcfPtOyZsOOlbyMGyUI3yq1ra+0qIALf03oSmsFiTJCBa8UrnvkivmX6LRw9RoJAzXflHffxtDzAf/B/7TqMoIRSIpjjxGFnEVw3+Wm9vg3LzlrOziMz4ZYJCB47bEq4hKfFVGEGVuwfZw3qHD5YUZ3zgJiks0FyI6KrLlDVdD7VfjMUzO6MD17m6OmwTFdPa7PPIjhJr2AUE+66aZXZINlsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QUCxZlcBCbb1dOLI/WwZEKCUc3T/QMzOKBs+Jou2vL8=;
 b=SIw8DyUjd1oDO/sdhnmx3w4s38zZ/rnAaPv4ZM4KF0UlSu5aJ9vrgfvtDprhQA+XEQnAji70H7TKJXt0l/8SQTFPqYYsfc8aiw4IXwc1SHJnJUgm76mMJ8w+beLCrrgN5hClcqnI4gbp8iu69onjhn3FaQYS7hFPRNXi+2wVYNg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DS0PR12MB8269.namprd12.prod.outlook.com (2603:10b6:8:fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Wed, 8 Mar
 2023 17:42:49 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e%4]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 17:42:49 +0000
Message-ID: <e644fa2a-8000-f83b-7480-efdfa3f4af00@amd.com>
Date: Wed, 8 Mar 2023 12:42:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] drm/amdkfd: fix a potential double free in
 pqm_create_queue
Content-Language: en-US
To: Chia-I Wu <olvaffe@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230308001903.2841087-1-olvaffe@gmail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20230308001903.2841087-1-olvaffe@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0118.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::18) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DS0PR12MB8269:EE_
X-MS-Office365-Filtering-Correlation-Id: b4ea1461-bfcd-4ee4-9a34-08db1ffc88dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bRRCKADvAwsx2FR0THJoefF7KXVLmTKks+M7UCQ91jMiogeNITO8Rr8P3cjze6C4W44zTqD9foXRRCIaP+4N5dPBErUVSwaxTFbMQzNFMenzwDyIAq+KJwHMGK0oCdKOjzWDeA/f7vVd43RH0LtrlzzlPUFLYAYhMwadh1U8/OxsiJ7Q3ml+KYzH+5WoJFp/bHByWfPHdUc25++0oYIq3gLO0HIhlY7aJIhS1gLLA3ZSBsmLxFU01DunJhrhWuEoT7rk8z+sPnakow6Lgnz6dLRJFOX1NtCzAhna01js+75l5UCcYVTblZPQ0De3pW0zbpza42twrsoDOnDbHZk720VK+7l1fFMsL3wc1+Z27doYegp9mCUn9tvGDmLVm8EtQ1Ah2hbUFJOC8qapYK7ahGNI/9O8X7oPpCrojbGATj/op0AqyiUu11remP/nb1xzcrUBjB4kkhae65VQl3zTKVTdh6C4CVlHMFklh9U38H0Xcyf2LfRj+xwlRoJ434euIb5sm6t0OhIgDVPpgnqOhUBbUVIYgAu7gD0LgTIBzdtfMG50e+C+34EqG0Z7F4xVlOvEwMr/sEfXQDGGH3ZnwM0QQOFNG6RCZhvJjopzG7+C98ki/TMXWL9xThvqo6NcTbFh6dSM4S+E+SDoOdPU1aTimmbCj2HDOufWw25WELDG7OaPFpcfHcuZ3e02DmJhcaYpSzZRrsrh+ptMIucHKQ2g+AmHA0BwV/lGsXCC/QE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(376002)(136003)(346002)(39860400002)(366004)(451199018)(41300700001)(26005)(186003)(2616005)(6506007)(53546011)(6512007)(83380400001)(38100700002)(478600001)(54906003)(66556008)(66476007)(6486002)(86362001)(4326008)(66946007)(36756003)(316002)(6666004)(36916002)(8676002)(31696002)(4744005)(2906002)(44832011)(31686004)(8936002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFY5MkY5Z3dmRW84K05sNE03NElxU3k3Tm43ZEFlbTNoVGJ5bjZTN21NK2dO?=
 =?utf-8?B?YnZTTCtpS0ZadXJIMTBGblNHUWdGakJISjZZSERUUVR1cm4vTmlvRlg0Rk5j?=
 =?utf-8?B?TG92S2JKL2FKYVlIUGh2cFNhVmpsbGYrY1J1ZGVGSVlaNDlVYTlOcVJRRGFm?=
 =?utf-8?B?VmF2T0dodU9FbElhV1RWUWZYVTdEOXRUazFieHRpQXFXbk4vMWJ1TmkwRWo3?=
 =?utf-8?B?WSt5UmpvdHVTT1J2Zm5RaThWRlhmankxamY1TWh3anJybXI5SkJGUXVKdnRq?=
 =?utf-8?B?VTJKWUJNVy96TGxxNHlvZGV6YTk0bEpoNk5VczlaQUNtVUxmdXlIaGNEdm53?=
 =?utf-8?B?WWl4WjM5SnFTV1RYc1I5Sy9OT3JNa1FGekJpVjZYaktZd05YcmpCVUlRdm5S?=
 =?utf-8?B?M3FOTnFIQmhoZE01N0lyaTJHSUw3My9UWFRXdllmaTI1dGQ5R1d5NGdnV1VP?=
 =?utf-8?B?dGpKZmdxdldHK2x0KzhKWGwzTm9weWRlcWZsalUzRmplOWQ3ajdZREpWR2RD?=
 =?utf-8?B?eGovS2hTbmNTb3g3eXcvMFpjYllXYVdUcHpWMTBNeGRMRHFlejV5YTNpK0xJ?=
 =?utf-8?B?VHlLeDg1NGV0SStTamVkYUJtL2FZNEpUeXhhc2xleUJsaFNkalkwSngyWVpJ?=
 =?utf-8?B?WlRaK3dDYkNMVlc3SXpVYUJ2bXA4aUl0UmNxRUUvUW1acUhNQ09aMDRPVnlK?=
 =?utf-8?B?TTZONHVpMVJpeXJEMmI2SHhic1RXZUZuZmd0MzM1SHBqWmJjWVdEUFRzcGE3?=
 =?utf-8?B?Yk10UVRuRjkvRC8xN0lzaVlLeHVnQkZ1Zmw0QWhaSUhHQVZOSFF0QzFtUHoz?=
 =?utf-8?B?Vm1qamZTR2ZKQ2xCTDF3c2pSMDRjUTVHZHpLUGRYblE0amdiVkVrVVhGZVMv?=
 =?utf-8?B?ZC9QZXZsQ3gzOGEwT3hVZXZ4Q2VJMHlmelM4ZWdlS3ZYczdFaHJqaDlNZGNU?=
 =?utf-8?B?ZVhFMlA2Q0FWRWNmYjNFNGJTNWMvQXZsbDQ5a2dHcEdrWHcrTks4Ylc5Y3Vi?=
 =?utf-8?B?eVdQSlp4SUJIeEs1cW1wdm9rc0RnRnlDa202Ni85VlEya2ljOGJLQXZyWUtM?=
 =?utf-8?B?Ri9oUTBUbllDcGJ6L0ZNeUtzUEJnTEhpeG9NN25zbFo1MkJYSTlHbWp4UjZm?=
 =?utf-8?B?eE43dXBMRXp4MjJaQW5ZeXoxN0p6NzI4Nm5TQ1JUaFFqRzVYL1JVbVB4ZVdJ?=
 =?utf-8?B?V21IN25UZ3ZucEVWM0ZDd21HNldNZW1PdmRtMklvZDZIM1czWWt3VlN1aXIy?=
 =?utf-8?B?cUl3aXNFTVJBdytjNXBoY3dYbDF4Q2U5ZUlmN1dFTFRZVS9HNkRra0YyU0tq?=
 =?utf-8?B?TVFIb0IwTXRxOWtpSzVLcnBwZnZYS2I1N3hTd1c4djZiZVQvMDVueEp3RHNy?=
 =?utf-8?B?bXNmT2pzdllPT21mN2Q4SWxhUW9DWFlRWEhFODNxTjdoaU5TM1F3WTJ0TGI1?=
 =?utf-8?B?cU1YQXhDSWdLYnoxU2JFcU4xYTBrOXkxYjc0L2NldEpPUEU4YUFSU01nYmlv?=
 =?utf-8?B?ZGhuU2JvUzFLMDdCRVpLYkRkRnpxMm5kcjBRQytWZ3FoeEo1cG9uNFEyT00w?=
 =?utf-8?B?UzJzUUpwNWl1aDVXeVV3Q1NPOTZlWmQ5ekhuZWJhNVVPNXp5SG9JTkIzcFhU?=
 =?utf-8?B?bWlib2xkRXZyeERuUlM5dGo2a0pjK2VXcXFudjF5b1UvMVJSbjAzeG9iQjVY?=
 =?utf-8?B?Y0tOaUFuYno3TGNmYW4yNE01TGxNbFJiTEZ5bExrQ0g5WmhzckliT2llT05m?=
 =?utf-8?B?cGQ4QWNwTWxKQmtzZHk1OE4rZ3lUb2NQZ0NuYzR5am13SldjTTNuWmIybXlr?=
 =?utf-8?B?NHFBTDFyTzEzT1VxUTJ3ZVFGUXQ0N0Q3UEhFREdtSHhzR3NnTmwxWjdnU0hv?=
 =?utf-8?B?RUFHbzVFTCtiYnVXN3ROWGFVekVyTzFRcnI1N0NBZTJjNm15d1poZGNFejFM?=
 =?utf-8?B?Wkh4YU5IL0JxdnQ4VVNKcWhIWTBxaGxabHh6QjExSmt0NnQ0c1hnVUN4bXhE?=
 =?utf-8?B?bGJsWDd3b01LcGFQbjVyMGZxVklmbisrUEVSN2NTaGVOK1NnVDVZT1BCZDdR?=
 =?utf-8?B?U0pJRTA1TTFTOWplbFdRQk1iWGd4RmthOVBNZ0FIS1lDV2JWSnpHclpHdHpE?=
 =?utf-8?Q?8ku75tm3KtRIZTRKtjglPwayF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4ea1461-bfcd-4ee4-9a34-08db1ffc88dd
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 17:42:49.3063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: no3bL7MYUVhgO1BNlHVujFNazceIA0MAb52shxXgkwAskWWzGY1hE5zIiB/Zn9vUeZjwtnIS65jzB1oAYK9NOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8269
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-03-07 19:19, Chia-I Wu wrote:
> Set *q to NULL on errors, otherwise pqm_create_queue would free it
> again.
>
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>

Thank you! I'm applying this patch to amd-staging-drm-next.

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> index 5137476ec18e6..4236539d9f932 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> @@ -218,8 +218,8 @@ static int init_user_queue(struct process_queue_manager *pqm,
>   	return 0;
>   
>   cleanup:
> -	if (dev->shared_resources.enable_mes)
> -		uninit_queue(*q);
> +	uninit_queue(*q);
> +	*q = NULL;
>   	return retval;
>   }
>   
