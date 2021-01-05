Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8252EA89E
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 11:27:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C71266E0D4;
	Tue,  5 Jan 2021 10:27:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2044.outbound.protection.outlook.com [40.107.94.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB4596E0D2;
 Tue,  5 Jan 2021 10:27:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MglR6e6hJg89YKZ2CwKhARMfz96EUSJpU0uM5eWp5ajmXmcwU9l7DCqd3g8uSfjoqchFoBmRuKHFIzexAHSL07x9HXei8UTC6GXIrjA4zNI0iRZfAjhjwbJCml0xxa49Nr61H3nwbhY4Uxp+aTX0Zft2uv07cpUe/LdFc3Bsu0X03P5txZ/N8m9KRuo0x1F/vObpVrQ4YFmQfyPw+mmPxu3ROtBM3OCs3edAfVXSTUYJnJLX6w2l8aZPbYc99aHKtLeecuYW5joTBUZmA6E0GeeXvccJvYjZ3OU02HZnmnuhXGCmXKn6xtJTbMzQES9S118XDMduLRNZI7opiyt0lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Df/4GF+Pyrd4doSxXC2AtUplCDtBUVY3uTcEooSgyZ8=;
 b=WQawHe+gXrh4e+L3z59wn+ljWT/5O2J46VBTJ42taASnLPmPTQwclvCkMANfiEQkcJjywIlhuP5sDuO4JOSXN9qLBFRvov7NilRyLLFAsWH8H1wzTSlFrjhdtlRBHs55X0vAmU5PHYcfGHn3Ab0xNPHQnT1OjBHsL2gfmk5PCiWx3P5m9Y6OtpFkCzo3up7jel/0TbmgEX/tueGBwdNnVAG14VFX/kdJkHdKQkfPZiyfsFfqxgRhCXH8EC943Aqz/dU8F/Z0wYUXpul5bNrzkPDQlH6Nfd5XzpYr6xcwTZSoIWUm1nHs07TH3kBjqt/4W6xt/QZAA2pGPWh7VeWMIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Df/4GF+Pyrd4doSxXC2AtUplCDtBUVY3uTcEooSgyZ8=;
 b=tlLxChHURROGlboAtJnt0C5kjgbwEUh2c5t92bA1fvR58uonY9OEqoat2Ul3PS4tAFW72i1rV22uxllQbEw15gY+UobBpIZ7o20wxkeN9xxZUAiwHinhnctsXphMdsgYuMf3RPyJJJ3EFkG9NqNzMjsWxv01DeyKfO8qLu8ifaU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2451.namprd12.prod.outlook.com (2603:10b6:207:4e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19; Tue, 5 Jan
 2021 10:27:33 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3742.006; Tue, 5 Jan 2021
 10:27:32 +0000
Subject: Re: [PATCH v2] drm/amdgpu:fix IH overflow on Cz
To: Defang Bo <bodefang@126.com>, airlied@linux.ie, daniel@ffwll.ch,
 alexander.deucher@amd.com
References: <1609831941-2277695-1-git-send-email-bodefang@126.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f03d6316-4dfe-4409-8ea1-d1bca8a16360@amd.com>
Date: Tue, 5 Jan 2021 11:27:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <1609831941-2277695-1-git-send-email-bodefang@126.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM9P193CA0010.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::15) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM9P193CA0010.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.20 via Frontend Transport; Tue, 5 Jan 2021 10:27:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cfccc9a5-2765-4dba-6961-08d8b1648322
X-MS-TrafficTypeDiagnostic: BL0PR12MB2451:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB245157B4C07340EA59A3B71D83D10@BL0PR12MB2451.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RmJXzuMwFYe+BPRDpRFNrfjG7FfBuYtPLQ8P5sbHzoyepgMZjcBy3/foI3R5pcDvvwK4oLwtxdPZYSXeGoiPaEzLuWuAThxafzU+184QwdgafV1tcyQeflRclQ9eH1de98yDsF17Inf0/MQn1GcJ1Luy42KiFroirhT/eak87Y6do3srjHe/dUTl/bKdngsrbh2yEq+ZqArczbNNQL+SJKGd/URd2ANJvTMjTq/BacDi8KssyYsdKv4u8zjeqHrgfaijJBzbP5VN8GBh6jar3yVU7KXeyGuCOnV2nfxAEvX03lXbCI1qYGPJAoGMnuNHutqDvOjPmrfeiOk19OMSl6H/oNsc+/HdiHT/aaPUwwQ+oH9NGZrjfoR4PjLVRUTSq0M8CsvX1hPXCYvcP2QN36DrfeV7JCbx8D6GGFq5t7+UOdnW1CRVYuZjCdm14hycXtCwEp9z1GL2nrIFbXkVtXydjgj2OZ9aeVvNEqD/un9lqZw3lPv4koNWJ/4c8KWp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(39860400002)(346002)(396003)(136003)(8676002)(4326008)(6636002)(52116002)(316002)(6486002)(2616005)(8936002)(6666004)(31696002)(478600001)(5660300002)(36756003)(16526019)(186003)(83380400001)(66946007)(66556008)(66476007)(2906002)(31686004)(86362001)(525324002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?V1p3dzU5YzlBcEIveG55Z0VOa203N1lOWE9aaE96N21NbEtlbE9uejN5ZE5T?=
 =?utf-8?B?QTBoZnpsQ0dEMi9vQXBiMFZwdzdNN1NJMEt4emtYeUZtbTVxZzR6cStLQ2ll?=
 =?utf-8?B?bk5aSmJtalF1cURrTVlPbkFtWEF2b3AzY000ZkdDaUduN2djQjVnNzc0OERN?=
 =?utf-8?B?NGxSYkpFTGVLUGYzVjJvUFU2YVVvL3VERmhtRFEvMVd3bUoweEN5SUpjTndu?=
 =?utf-8?B?VGJrVU5YZWVCbG9VSWlOcUZSUDBmZmxSTVlUa1VCUjM3Q0kyRVREbHpiOGdZ?=
 =?utf-8?B?NTJOSHV2cUhnY3l5MVNOWmlIYkZjckZGSmhpV3VteTZYU0tuSkY2VWNkbVFF?=
 =?utf-8?B?OC8zcmxnN1B0dUY2SmpqWTBJeDlwdUMwUVVoY2M1R1FobmtrTDJlcEpQY3ZN?=
 =?utf-8?B?RVg4OGRLdkQ0QlVaQjArQk1lYlZ1NkYweG1TdmoybUZSc3BJQXJDbW0wZmdQ?=
 =?utf-8?B?R2x4YlI4WlVCS3gybXdualkvbjhRUlhQREN1SWh1a0doY3hJLzk0em85Sytm?=
 =?utf-8?B?VkNNdC96NG8zcUIxRGp1WDNrTjJyTFIwSkFWWkZmeFVxbzRTWTRHeFRWaVNV?=
 =?utf-8?B?MTcvd1k1R1gxdnJEU243dEhMVXZZMWFnOVY2Ykkza0xjaDRoN3dlOVd1OTFJ?=
 =?utf-8?B?QnU5UUFxTllLT2dqUkowcU56dnYxQmM3VGpRd2tVNEdSazNBTjE5TkY4VHRi?=
 =?utf-8?B?SHFYekIzcWNoY3JPWDBvTnc4RkliTWJiN1pQZmRQUlJ4Wm81NFZYemQ5VW91?=
 =?utf-8?B?T08xcyt3eTdRc1hhWUxvd21odzA2b09zcnhiY213a2dod0M0WGowQ09nMnhk?=
 =?utf-8?B?a2szN3JVVUlzbHk1b1NHOG55QWpPNytiSjdNaG5XVXFLREFoN1hjZEU4blc2?=
 =?utf-8?B?Y2ROYnBhU1FjTHhHY01tSjZ5eHpmREp2NFAvRTNQaUVqVzF1QTR4RU0rZnJl?=
 =?utf-8?B?WnVVeHFYOXp6bEZseTNvdWdLYUo1bk5ZeU1kY2NRZ3A2Ly9KKzF2Ull0c1BO?=
 =?utf-8?B?QW82aGp5TThPUjhkNjdTalpMVzNqVWxvV0hVcy9OaVVjSzNNT0ZPdnBBSkxk?=
 =?utf-8?B?RTE0SU84QWxMb3A3cWJlL0lUT1FxT2p6NXp0a09MazRmNVRZdXd0WnJUYm13?=
 =?utf-8?B?ei9XQUtFVCtTOUxBZFcrLzBkdUVvOHFRcElGanpPTjdZSWRuYzlWV24zeVFI?=
 =?utf-8?B?UlMxTWwzYjMyZHlCSVJ6MGxIeDloeTNaQzFuY0tpUHEwekp0b0k3ZUJnZWZG?=
 =?utf-8?B?TUx5M25ydE9RZUZJdk50aG03MlJSSXV1b3NCallYUTQraVJ0NVdTejRJQ3FE?=
 =?utf-8?B?eWJVVWZTTVpUZ2FlTTd6aGh1a1JEVkxMWEQ5cHRaYWZJeDRUZkVKZnRZSitV?=
 =?utf-8?B?NE5TSmpxbGdqeUVQMlFHYXFla3U2RkgvcUFSUkhMY3lQMUZwTFV2Z3I2bEFR?=
 =?utf-8?Q?EWQXSNoL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2021 10:27:32.5992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: cfccc9a5-2765-4dba-6961-08d8b1648322
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1RlCTqQAG4uYd9SQUczkScWVbsydbp8ny0eX6hmlNR21b2CPYnj+117HjkVN47FW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2451
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
Cc: amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 05.01.21 um 08:32 schrieb Defang Bo:
> Similar to commit <b82175750131>("drm/amdgpu: fix IH overflow on Vega10 v2").
> When an ring buffer overflow happens the appropriate bit is set in the WPTR
> register which is also written back to memory. But clearing the bit in the
> WPTR doesn't trigger another memory writeback.
>
> So what can happen is that we end up processing the buffer overflow over and
> over again because the bit is never cleared. Resulting in a random system
> lockup because of an infinite loop in an interrupt handler.

Really good point. I haven't had time to look into other generations 
since fixing this for Vega.

One major typo below which needs to be fixed.

>
> Signed-off-by: Defang Bo <bodefang@126.com>
> ---
> Changes since v1:
> - Modify the code and correct the wrong fix.
> ---
> ---
>   drivers/gpu/drm/amd/amdgpu/cz_ih.c | 38 ++++++++++++++++++++++++--------------
>   1 file changed, 24 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/cz_ih.c b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
> index 1dca0cabc326..45dd47f45fa2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/cz_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
> @@ -190,22 +190,32 @@ static u32 cz_ih_get_wptr(struct amdgpu_device *adev,
>   			  struct amdgpu_ih_ring *ih)
>   {
>   	u32 wptr, tmp;
> -
> +
>   	wptr = le32_to_cpu(*ih->wptr_cpu);
>   
> -	if (REG_GET_FIELD(wptr, IH_RB_WPTR, RB_OVERFLOW)) {
> -		wptr = REG_SET_FIELD(wptr, IH_RB_WPTR, RB_OVERFLOW, 0);
> -		/* When a ring buffer overflow happen start parsing interrupt
> -		 * from the last not overwritten vector (wptr + 16). Hopefully
> -		 * this should allow us to catchup.
> -		 */
> -		dev_warn(adev->dev, "IH ring buffer overflow (0x%08X, 0x%08X, 0x%08X)\n",
> -			wptr, ih->rptr, (wptr + 16) & ih->ptr_mask);
> -		ih->rptr = (wptr + 16) & ih->ptr_mask;
> -		tmp = RREG32(mmIH_RB_CNTL);
> -		tmp = REG_SET_FIELD(tmp, IH_RB_CNTL, WPTR_OVERFLOW_CLEAR, 1);
> -		WREG32(mmIH_RB_CNTL, tmp);
> -	}
> +	if (!REG_GET_FIELD(wptr, IH_RB_WPTR, RB_OVERFLOW))
> +		goto out;
> +
> +	wptr = RREG32(mmIH_RB_CNTL);

That's the wrong register, you need to read the write pointer and not 
the control register.

Same problem in all other patches.

Regards,
Christian.

> +
> +	if (!REG_GET_FIELD(wptr, IH_RB_WPTR, RB_OVERFLOW))
> +		goto out;
> +
> +	wptr = REG_SET_FIELD(wptr, IH_RB_WPTR, RB_OVERFLOW, 0);
> +
> +	/* When a ring buffer overflow happen start parsing interrupt
> +	 * from the last not overwritten vector (wptr + 16). Hopefully
> +	 * this should allow us to catchup.
> +	 */
> +	dev_warn(adev->dev, "IH ring buffer overflow (0x%08X, 0x%08X, 0x%08X)\n",
> +		wptr, ih->rptr, (wptr + 16) & ih->ptr_mask);
> +	ih->rptr = (wptr + 16) & ih->ptr_mask;
> +	tmp = RREG32(mmIH_RB_CNTL);
> +	tmp = REG_SET_FIELD(tmp, IH_RB_CNTL, WPTR_OVERFLOW_CLEAR, 1);
> +	WREG32(mmIH_RB_CNTL, tmp);
> +
> +
> +out:
>   	return (wptr & ih->ptr_mask);
>   }
>   

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
