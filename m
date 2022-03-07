Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E4E4D01A4
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 15:43:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F34B10E138;
	Mon,  7 Mar 2022 14:43:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754A510E138
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 14:43:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dwCE1jGsxluQ7IVa1sgH4XG64Q53mjWnJuns1kf5rIVKaodt68JjQ1eYvA1Bppn6dIPkvkfUKDi997pI/tD4agXRepHTG4Bfi5mKQ5OPAiG44JTZJIkayC5uY4ltQPYcsPde4OjRDVheJBcEwb+Vlukr87myh7kAgUGs7ZtApt2SjrS03edg8csxO/ZWFxZZRoTga+xTz+D9B2fDZBhHWYNbnSU3Fiv3qMbL1D7ScgSSb4zf7Wut6w+n14/XU/rgBlI6XdBh0FdNHjOVLNeRhbQIDGrHdSyWmQmKaLdE1yqewrOxy42Rlbkozb2FtPw5lzuoFw6UI8xzRMXIktYy5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xiyuFjV22lG1P+OUhOkLsDdEke+uiQ5Kbi18B8MPag4=;
 b=SZQzaLgTSqjeDgTyE8LCLgnd8dY8viMvxXbJmAVR4LYu8u4paqED8uhx90U7Ir1V795jmUo4Pslts09i6FeDBzvLtevE7QI9IlIKFX0B5UsdVjQ2f0cjrPLyvLVRF9NcVb03ICzv9dyfP4AwGsG2M0O8Q5gO0pn5dnkyGycNOW7TCeNEuTSO5FjLEpkBmdMf11mXH8AVy7ucuzp4NnDRR7C5YrLrgkPR+u7XSr63ZuolL22UqhC+HPQdDMWRAse9tj5sVNUQ0lHcYjjGGJ9N7aTyoYrNLVd+k7nF9OG7ANseH/PPCC0k9GHWQ7yqWU7y9Q02drIA9PqgcS3pt7GYXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xiyuFjV22lG1P+OUhOkLsDdEke+uiQ5Kbi18B8MPag4=;
 b=ZbenyBMDruaMYYvwRmVVlhBBN0jQri487GT7nZQC+n5ehbof5n+qdtYwK0GL7c6YRAPZWMj7No4HZuwy9OaxX5L2xNTck/+f4uEJ5o6DAgy1Y3qMW0CiMlBg53jvjqWR7np2Wn8KFoQA7THqPs+dnejiKjcBvzyWauz+1d1GjQ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by MWHPR12MB1390.namprd12.prod.outlook.com (2603:10b6:300:12::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Mon, 7 Mar
 2022 14:43:12 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::48e2:1306:25a3:5f14]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::48e2:1306:25a3:5f14%5]) with mapi id 15.20.5038.027; Mon, 7 Mar 2022
 14:43:12 +0000
Message-ID: <883bee2e-bca0-e0d1-613d-d744574ffde8@amd.com>
Date: Mon, 7 Mar 2022 20:24:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] drm/selftests: missing error code in
 igt_buddy_alloc_smoke()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>, David Airlie <airlied@linux.ie>
References: <20220307125458.GA16710@kili>
From: Arunpravin <arunpravin.paneerselvam@amd.com>
In-Reply-To: <20220307125458.GA16710@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR0101CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:18::24) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7900dfe2-31c7-41dd-cfcc-08da0048cdd4
X-MS-TrafficTypeDiagnostic: MWHPR12MB1390:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1390A2654941EDC8F8D7BB6EE4089@MWHPR12MB1390.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mFLMizwFQWlf+gaF6XGyBdw2OAkSOHKIZJVe1T5P3q//9pnBNOqDiOYjIk3MjywuPhCttG02u160vyV2FAI0UkBw/M9U0mR6L2xXBTe9AET5g2xV/nRReyciDA9HoMY4csE9SB92GYIhMu7qj2ZtWtCTBNk6OsRCkt35eSOE8f1w4amEdWUuS0gBwSgjXSBRCBl3NJohCstpKn10LuPZwLBr42MVzwFHv0ctnRST5hLXL8fQKblLB640ZJe5GGqfgFiN4Hgm/XgHbWfX/AhkckWJ+yUGUENNOBe7uvLGInA7JSIzQjDtsNRehftrIOUsVc1jWXn2xkfoBLuLeQfB+WerxXCmQHef1OUs6meGly36zxP88eTAhBpJknAeUIeK/qwSiPfyD4LmGclLnOhxA8n8yYyv6a4T5Q4EFVMeLbC4FaNs/Hxpiq1IziIsmXKJbj4vUJRjDaJfz/OgAoxtRuYWJmftosTogi5jwfODTjIO3IOOymkjVpUKx/dXRcL+eG1COUkm/e8n9SKt6AfpvnPp1qNbcJ8PbrGoGwnavRIIJLnFhhKtVqPGjbwIfVbBYyDjbVV8Jm2FO8KgFGL9zxbnTU2UZNWtBw1OBjz996lAb04CDMvCNekZvxl4yIBFw+fAPr1vR2gxyElbafNDnVbujrCm1ttxejydyNVN8wAGEtgo0q+V6YDPhKKBAKofK693KewunVRSFDD5dmIeuuYkA2XPhGUC4Cqp3CGqmoeJ7SwvnYnYhQTLBB8JoXJp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(6512007)(2906002)(4744005)(86362001)(26005)(316002)(110136005)(54906003)(2616005)(38100700002)(6486002)(83380400001)(31696002)(66556008)(66476007)(8676002)(4326008)(66946007)(508600001)(53546011)(36756003)(31686004)(5660300002)(8936002)(6666004)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0VoWDlpaFFwekVRN3MzcUhCcVFJZjlVbktrbExBZHZOcU1IcTkyRlAyb1dG?=
 =?utf-8?B?OFc3Rk1hMUZSYzZiRVB1dzF0STJweFgybVRFTHU3YmtkL0hnWHU3a1U2WWlT?=
 =?utf-8?B?VWxjQllLSEZhSjBNSWhVSGRyRCs1UGJ2TlllM1M5YjRJVVdPTUZRczFsZzNi?=
 =?utf-8?B?V3VFK2FBOG9LLy80VkVDQmNsWWpJOUd2Y3pjSG5RN3RTcHRSa253dzlhRmdv?=
 =?utf-8?B?cFQzK1hrMFY1aXlmUUEydVhMVUVRVEwxajdPUnZBakhWdlRranhKdW9aandp?=
 =?utf-8?B?MnFJVzZuUmNDcFl5aGlTTGMxR3VQTy84SDNaWko3OW5FdzJWVlB1cGJZMDEx?=
 =?utf-8?B?eHkwTjRDdXJURFN5TGlnZDdhWnc3QXJLTlJCZU4vRTQxLzFDaElWVFZUSXRE?=
 =?utf-8?B?RjJjaU4raTl6cHkvcGtKUURWWUpWcGNtaGdTTFM1RENaTm9nT0xXQlFTdklU?=
 =?utf-8?B?N3JIRVAwNTVnUTRzTk9ZdzVmZHZlWE9iZWNhbUpYanRkMEx1eWJJWG9ybU4z?=
 =?utf-8?B?N2s4c21hUkw3QUNLWDdBbHl1ckFPSU8vRWk3YWpWU1FFMEFHckNkUnRmSmVa?=
 =?utf-8?B?NzFRY3h4YkRaNnNWb09ZNjdhczVrYU84UzQzdndJMlpXYnVqVmdZc2dpMk9M?=
 =?utf-8?B?KysyUk1ZbFNDZzdKelVoM2Fid1dQcHhGNHhRbUFobHR2SUdneENTcCt1ZUpI?=
 =?utf-8?B?Y0JaY2FyMU1lT0tWNFVZcWEyVmNEUGFkTHpITE1tT2ZaOTBIZWo3WCs2ck5u?=
 =?utf-8?B?OXNzWmd4a3E0d3VWNTRlTkpSVnJraDEzNHJ1RWgyTGk1MXpHczhXbTJNQWJy?=
 =?utf-8?B?Nk1IS0ZySFVGamNrV3RXMVQzZEQycEZEU0E0TWk0bmcyOTNxQ0E2eXFVSjdG?=
 =?utf-8?B?MWQyeTdXZ1dnRTJ4eVNuQWN2SVVoUnM5Z1RaZURhRFZST1BkQThkNi9NZit5?=
 =?utf-8?B?UUxSSFErT2ZLV3pjNmgzTjNlbFY5em1Zc1pBcWdMRi9GUUgwNTJUMlE4YkFO?=
 =?utf-8?B?K2ptNGdGc2RkeDBaMXZiR2xXMnVZcTVRQUd6RkNVUkpEcSszbWQyMFp3dnd3?=
 =?utf-8?B?Ky9HS0RBY2M3eHJCa0s0aFppdEJDTit5Z3k0VVJWYXBwZHVETlBTSUlrbmJF?=
 =?utf-8?B?R2o2TjFKM2xxcXhJYVc5VXRjeG9YdUlyZU5HUFZpcGRxcERxSmN5aXhFR1lv?=
 =?utf-8?B?SXRCaTFzMmJIV3VSMWpPczVjSUNvekIrVjBaRlVSelVhZFhJSjhDWDlGd3Uv?=
 =?utf-8?B?eWZBeEJ3Qm4xT080K28vTjFsWWdaR0dkNWRYdVc0UEZUam5KVitwRHpCaVJG?=
 =?utf-8?B?SS81STR5T0pENjg1NjFUTSt4WTN1WktlOWdOZWtKWTFMWlljMVZxbWRGdVR6?=
 =?utf-8?B?R1lvN0xoQnNUVktnUC85YTB2c1UzWDkrc0dzdTNIbEg3a1FFNlpkQVpHMng0?=
 =?utf-8?B?S01RdTJwOVoreDAzS3JTRkcydWlUZXhkeXEvSFF1dGdJcTl5VUpRWTJoZFRp?=
 =?utf-8?B?WkdncGlWaFdvcUJjcmErcFlsTngyNFRjUDltdWFPdm14Zmt0dk9TY3paWita?=
 =?utf-8?B?SEhOVUg3OTlydmlSdEE1UWFEbGgzUzloNTh5SUV5NDY5dEJxSmpUeVU3dXpS?=
 =?utf-8?B?c1FSYnVpUXI1Y0JUbWxON0ZKU1lLVkpKNmxvMjZBZEl5MCtCL2YybmZua2xa?=
 =?utf-8?B?cHp6cDU0Q2tKN2c3RGR1ajAybGlQNnRIUHlkcmNlL3lvZHVoMmZVTWhFNVlR?=
 =?utf-8?B?ZmxTclk5VzZ2K1o1eW0yQkIrNHhSa3ZtRmNQSjlzZy80Z2FkWUxGNXVkQjVB?=
 =?utf-8?B?Ky9EeVkzNmxUQng4ODdFb2VTYUJVVFY1c08yb0tVaDg0dXljVlA2NjViWlhF?=
 =?utf-8?B?cTBFZEtwTmxJSHdJVnRaSk4xd1FVWGFxY09YU3o3VllQNnM5OXRMcy9aSUZK?=
 =?utf-8?B?NktWVGxkck9oZXU4ejlsckFHQklPZU5xL0Y4SXM5aThzczhsbDlWT3YwNXlm?=
 =?utf-8?B?VW92Y0x1Znl6TGY3d0ZFeEt6RGZwaTltT0lGU2ZDbXFGQmFBMXM4dUk3bXVZ?=
 =?utf-8?B?WUZydUJpQU9pdHRyS04rbytXTWxJUUh0Z3VpZzFoZ1Avak05RXRaUmJrOVZh?=
 =?utf-8?B?cWgwTEtyVzlYbDB6bTZTMndqSkxyamRCS0hnZGpXanlNbHRQYzhLODdlZU1W?=
 =?utf-8?Q?b9GlB8eHwjRl4SSJ8ynBj2s=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7900dfe2-31c7-41dd-cfcc-08da0048cdd4
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 14:43:12.2749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L18QHL9bxY21UYNSE4i4CrSuD6X7gtSW+2rdFG9RnrBuoSuTH85VIPgY6vkFM6NFPT0NuT9XlGHbhZFy48qRQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1390
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
Cc: dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by:Arunpravin <Arunpravin.PaneerSelvam@amd.com>

On 07/03/22 6:24 pm, Dan Carpenter wrote:
> Set the error code to -ENOMEM if drm_random_order() fails.
> 
> Fixes: e6ff5ef81170 ("drm/selftests: add drm buddy smoke testcase")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/selftests/test-drm_buddy.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/selftests/test-drm_buddy.c b/drivers/gpu/drm/selftests/test-drm_buddy.c
> index fa997f89522b..6eba590afa9b 100644
> --- a/drivers/gpu/drm/selftests/test-drm_buddy.c
> +++ b/drivers/gpu/drm/selftests/test-drm_buddy.c
> @@ -488,8 +488,10 @@ static int igt_buddy_alloc_smoke(void *arg)
>  	}
>  
>  	order = drm_random_order(mm.max_order + 1, &prng);
> -	if (!order)
> +	if (!order) {
> +		err = -ENOMEM;
>  		goto out_fini;
> +	}
>  
>  	for (i = 0; i <= mm.max_order; ++i) {
>  		struct drm_buddy_block *block;
> 
