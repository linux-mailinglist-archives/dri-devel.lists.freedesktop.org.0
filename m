Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6877076AA
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 02:01:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D8D10E08C;
	Thu, 18 May 2023 00:01:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A644A10E035;
 Thu, 18 May 2023 00:01:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IqxXEWYgymFGQeTTdleCRqqlqKDaiLh2hrBzILHM9IHCqg20ZVmCEIZ51r6Fn/WVvWvDRaG7P7cYu3alc23NTaKAB0KB8itIZ/QPy+m/+MK63hdcHFYQxi3ytetaB++uX63bDu49En8nw2bfzBNxjhG8gHjrkQVADvE2sLpHaxJ5rWEATLmZc6BwlxpGeNHNytaZ/zPKfQIFiEkZZF91E8SN1M2Iuv7jRg10Kz2T3rnnL88SFm4LI2dXOZy3S9PuFnE2FGMcfNgqObLELYRCfcY6/pmSNC3LcX62HunUo+dg4xiFcnhqH6uBlm4IlWwegPbSzD/mPI2k1jDsk3hvkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fcGjjmDLENj8upWSQ4eMZMGK6vHVPw0zwfyRPWcp0RI=;
 b=MbRFXA19UUYV164YidlYR7gCqTb6E4xMCfDSdmiuUaSXt1Uiz6uvL8NzjvWloHX2lb6PJ3KUYqFD+lp4L/X0GmxRnHxzFUcDjvxA320j3Q6udjiaQ9oiRb5tK7xJbAC7WRAPw7G2dKu1ZeZPcajSkLkqcExpmybFnyVTlJg1GIjK+dLAh3ttvz955U5+GTnZfegiUsqVbQFQvDMd1j1V2jcCZ8V0B34W2jvbQXSp7kJtHCmP7u9F+GkokVWDFcAphSSM5OExB6lKANMQ1gztQEF86AkBzY2uH0rKflqKEp8oYf00iimD+UuFm/I9vlHBNVnx7yjle5sUUChnRTB5xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcGjjmDLENj8upWSQ4eMZMGK6vHVPw0zwfyRPWcp0RI=;
 b=QNV4PAIjML+MXMp20RMSBY+e65KnuNY5LJpoPNYBKfcGyUC/8ArMoCAf33LBiSxzSEW3myPFttBjDFKRqtQQyhjM0lcPLstOqlQvMx0vvSt/tWU1Sop+wyhNLs1pU8tl5JaOzdfqeuM/YYwrDBwFTf89V0/hNiOA9oq+e3F3QuU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by CH0PR12MB5236.namprd12.prod.outlook.com (2603:10b6:610:d3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Thu, 18 May
 2023 00:01:21 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::3d88:4b4e:e0aa:3c36]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::3d88:4b4e:e0aa:3c36%4]) with mapi id 15.20.6411.017; Thu, 18 May 2023
 00:01:21 +0000
Message-ID: <77868d83-c213-86ad-76ff-3949c075995a@amd.com>
Date: Wed, 17 May 2023 18:01:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/3] drm/amd/display: drop redundant memset() in
 get_available_dsc_slices()
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
References: <20230517183350.314082-1-hamza.mahfooz@amd.com>
Content-Language: en-US
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20230517183350.314082-1-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:208:335::11) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB2941:EE_|CH0PR12MB5236:EE_
X-MS-Office365-Filtering-Correlation-Id: 108934a3-fc93-4007-c980-08db573302ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F5/5PvG2OlvV5pLe+JO9R7jvIusslm8ApNSYSwxkXGNctA4CDwv4GeJ8v7MSphE73uZhZUOiUq6LUgwm3ai1IgrgLrQf51WtpZtvo8cTr9zMLRzjk7K4EoiZgn5tlHmtr4Jk7FLhjZm2fTiW4PGbLCzCW9z89VROvZoEQuwW9USrBYUHbJnCHuvV6apuKpLkpa1fSkv2SPXJcqjvmUdRDOBgSth6+RuaDxggdm2UgC6Uj/xfmVAOAEOcdbY35Msan8oYi8CngYVOyO8vwP0bIT8quBwVRENAXJvmsypb2WfDUGfHJUSPGrt/rjnV3k2IBBXuupQ0XaL/InFXNe76fK06ckjZKWhu5vxe5zYDWk87zy9zzJBqSfmqHI1TW5u6ldLkErsSB4tMTr4a1pVKyRuKyRJtKR5t7VxjyEGxHVHLNlC6+1XSS4LUF8R7YoEMn/odQVJKB9tp/1ieZNAeAL1pKnGBdlGJmJfyHII5w16yRJ35zeG6+Hp5IJ8y0bn3Acns2zvBy+xJNp/1USHUNquaPcXzl+tcbvNRU+W03b8psUcBc6qZ0wVfwzljyi9JRoEs4ogNyiZLJKCOj0w/Wm38WLU7ibbdw6tMTjYk7fqLFY4qJF84ZwWtM1sW2Bi3a6z4W8ZGDHLO7+yc7lYY7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(346002)(376002)(366004)(136003)(451199021)(6512007)(6506007)(31696002)(53546011)(186003)(2906002)(86362001)(83380400001)(2616005)(36756003)(38100700002)(6666004)(41300700001)(6486002)(66476007)(66946007)(66556008)(316002)(4326008)(54906003)(31686004)(478600001)(5660300002)(8936002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tmc1MzkvMmhYeGRmdEZxQzBWSU96b0NaK2pkanFKc3EzRWdBT3NZQXFsZ1pC?=
 =?utf-8?B?aWdKbGZ4Y0Rpa1VpcUdMckY5UWNiMTZya2xUN0hiRjRwc0xLY3prVTl2RVY1?=
 =?utf-8?B?YWhwRzY5THdPRjdlSUhRZXJvblFFcmtOZ2JpbXhXYm9ONU9OUjFTOXFHbE4z?=
 =?utf-8?B?NDVwbmY2eldSb2lmVElRQzJSNnJwOCtuMS9WVGdVY2xpTUlFeWg4eVljYTBa?=
 =?utf-8?B?RVVZN1M4Vk1QaFRKVndGblM3N1JaYjcxQUowN1V0V1dua29UUW1sQk9PR3Bq?=
 =?utf-8?B?M1RwME10OC9oSnJxTDlCYWd1cS9aVTdoS2FyVzl1a1UvNXdVa3VUVDNJMEJt?=
 =?utf-8?B?NVdMSUxsTzFTeVcvU3ZxZjlFVjlqTCtXU2loTFhQRVpmQ0RJT3o2SlpIbmxy?=
 =?utf-8?B?ZmpzY3RDc2lJWG1WSThhMXlhMFhKbU91Y3JWQlA0RDFzNVFldG1IS2Z6amVa?=
 =?utf-8?B?cVlocWszT2sxK25FVkxjNWl3YnJBbS91RjNyM2pzcTBIbmZadGdmUFNmMGxS?=
 =?utf-8?B?dzk5Y1hjS0dZOVFHeFRmcXdsYy84b1daOWpSc3BLbUF3Z1Z4SzNoMURGT1Bu?=
 =?utf-8?B?L2RqdVRsSXdNOGZpODRCQWd4a0h6VTJ5eThUVnV2Wk13Q2REdUFoSjZjb3ZU?=
 =?utf-8?B?NTBIMk96UDROeEZZUGRvMHdjc1RHeFBRWDUxK2RsVUI5NGFQM1BSNjNvSlZO?=
 =?utf-8?B?T1hUSXAxaTRlbktkbi94LzRaTG1zalg5UnpsemQyNGEreHBiVmthVUw3YnNN?=
 =?utf-8?B?dUw0WCtJUzNzRzBBK1NIcDlBTnE1N2NNVWJhOEdjT1hsTjcvL1FJRHFPb0kw?=
 =?utf-8?B?U25QdVdaNzJ2S3FCOEdySC9sZC9tckhoL0ZOdW1PdWIreWlJM0U2UXJ3VGFR?=
 =?utf-8?B?TmdteHptUUhubmxOamJwL1lhMXZWYkEwcTJSMW1GbXR1M28vaHRmWTREVHJo?=
 =?utf-8?B?V01HdUxRVkhjYkdNVHJGTkhCNTd0Z1BWb1ZJVzVYbEdnRmlRaktGR0Fuekdo?=
 =?utf-8?B?d25ReThwZi9tclJXaFMzcUsyR1hSeUNiTjhEc0YzSzRjOTZRNTd1bHBIUUg2?=
 =?utf-8?B?S20yclhKQmFzdWFpakcyVWdnNWV6WXhUQk9COUhoQmRVNS91WHV6NTdrMHN0?=
 =?utf-8?B?Q0NMc3RHV0h3YWN3SGcwTno3c1hoZmxFT1R2cU0vVDNjKzc1VnFkVzFZWWxW?=
 =?utf-8?B?aStzTGNLWTErWGZ4S3R5Sm4ydWZvbkx0NlBBRU9zVEhqek8rUGFoYUpvOStp?=
 =?utf-8?B?Z0xoT2dkV1k0SnhYQVN2Y3ljRDlNV0JFTHdhQmEyYzNOZmVFSEEyd3BTV29O?=
 =?utf-8?B?Y25tOFhxY2Y1Y3IwRW1Ncy8vb1g1bkFibW03NG5JeEFIQmZoeVdmdDhaVWlU?=
 =?utf-8?B?dW1PZVRqZmt3T3RhVUhNYmQ5aXIrYTNlZGxXeVBJam5vV3k3ZldOTXZ4RVoy?=
 =?utf-8?B?b3pnb1Q3S3BycnNMTGk4QTZNMEoxcGpLdURqbjdSdnBEdEVGaHhwQXhwTytr?=
 =?utf-8?B?VlNJQlFLRXJmakNuUloyNFdhcWhiNG8wQVhtVzBQakhPMklxZW5xUUM2U2NM?=
 =?utf-8?B?ZnE5ODY4RE1YUXBpdEVtYUV3a2ZFYk1ocmZIa3hTbDdFMHNFeUo4ZHJwUG1F?=
 =?utf-8?B?MkllU1c5MHBwVy8vem9SR2tsR0k0Z2NmQnRSVGcvU3NqQXVHMDNUU01SczRE?=
 =?utf-8?B?SkdQb04xWnVXSzZQb3J1Qk1tcXNUVVJ1d0taUi9MenFpR0ptbWl3Uy80ZGh0?=
 =?utf-8?B?a0NoV3h3NXM5WVdZbXFtU01FaWxGaEJCM1NOa1FBbk5ucEVhSDFFaXdNeHd4?=
 =?utf-8?B?RFFJY3crSWVGUHIwMDBsaEEwYSs1blZQL2w2aDBBeWo3V2pCV2Z5TDdua1d1?=
 =?utf-8?B?V3FaalNzY2h4bGxlQmdUK2pEVjc1V0I4Yk03amlFTWV6OUE1MG4xd2NEbDMz?=
 =?utf-8?B?dWwrcFkxY3JMbXBicjg4eHZmSExXOVZSbkIrMlRhVFBEUjI0TnhGb2dhSW5Y?=
 =?utf-8?B?Z0JTNDJKT2phYjNLeGhOVkxUZXVObnI1dzlQdXpzbmt5QkZNWGN3K1NzaWh3?=
 =?utf-8?B?VU9QVFJsdmV3dDZrM1QxWlR3YW9kd3dlU0V5Zk1WVjZDYjFOa3hJalRseTJh?=
 =?utf-8?B?cjNGNEljQ3RySGV2bDhmYkFVNGd4WWR4d0xUT1c4aDJSWTREVWhqR2RlUFNx?=
 =?utf-8?Q?IOA/mqE4NCFwjFn4z/qJ4v5Cu2xQeYgx4KIbKWDKRCIT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 108934a3-fc93-4007-c980-08db573302ab
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 00:01:20.6654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RWsrnucVlk0JudvdPUtg3WPRvPc7Png/EmeVtOg5x1hNnJHBbIOG1AfQynDSvaCWyT7l+kaz9keLOeLdn410vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5236
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
Cc: dri-devel@lists.freedesktop.org, Jun Lei <Jun.Lei@amd.com>,
 Nasir Osman <nasir.osman@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Stylon Wang <stylon.wang@amd.com>,
 Leo Li <sunpeng.li@amd.com>, pengfuyuan <pengfuyuan@kylinos.cn>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Cruise Hung <Cruise.Hung@amd.com>, Mike Hsieh <Mike.Hsieh@amd.com>,
 Hans de Goede <hdegoede@redhat.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Leon Huang <Leon.Huang1@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/17/23 12:33, Hamza Mahfooz wrote:
> get_available_dsc_slices() returns the number of indices set, and all of
> the users of get_available_dsc_slices() don't cross the returned bound
> when iterating over available_slices[]. So, the memset() in
> get_available_dsc_slices() is redundant and can be dropped.
> 
> Fixes: 97bda0322b8a ("drm/amd/display: Add DSC support for Navi (v2)")
> Reported-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
>   drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
> index b9a05bb025db..58dd62cce4bb 100644
> --- a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
> +++ b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
> @@ -645,8 +645,6 @@ static int get_available_dsc_slices(union dsc_enc_slice_caps slice_caps, int *av
>   {
>   	int idx = 0;
>   
> -	memset(available_slices, -1, MIN_AVAILABLE_SLICES_SIZE);
> -
>   	if (slice_caps.bits.NUM_SLICES_1)
>   		available_slices[idx++] = 1;
>   

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
