Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DA138AD83
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 14:04:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C8FA6F42A;
	Thu, 20 May 2021 12:04:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2083.outbound.protection.outlook.com [40.107.94.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF906F42A;
 Thu, 20 May 2021 12:04:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RfvPbF6fSJqQUG7+0xytBLkvndWGbHHVqaliuSRFx4fingXQnRmU0dHuwI+sI323+7b1hu3fzODNj5207d7XkdtWJK/o4EEVCqZZyUEPvwn+4hqprE+JnL4oOxNmEZu8YUc4snDs7zAUj2cuWhGcoqMr/5GTdquYMqIMDp0gn38jEQnXMxtD8Y8UL2QrfGxiMMWD+34PgLYidkZYUpIzlD+cECToIcYXr6625bVrDhidQ8I8xA9dsxIGSGIg08Gspvn5E8OaHTKpLCJdaiLd67GRn7Dkr/0FyJN7OCzZctjzio9Mq7oc5jwM1wtRdESxPSOTcEOk8JxBYby936cfxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Vvyzn5wZPDITNM0ewni5n886rYyEy+vTitBslTDJWA=;
 b=K4O0GhySqqN4tL1WTzVRtgdDxuBs1tZk3Pl6QCBLFMZc4boSZbgQ+2hn+1KMZ6qbk6na4ins0YEXU7sjQiOmbLcwrsaFZZWL8gOPBi/t6RPFjIh6BALoNW5hZm4no3U+rJvylaYzGxnZUnJBqa3bvK9uj86C+mmanblRTWVE11SWM8iCqQhwgAFSNYuP+GTgl8od3P+S8r9R42JmdakFf7HjySTC3wAHOYuvAN5by9/jkQDtnbROqPMdUKca68CSefY0rbm2tty6wbuQs+FkakcwmxFGTer0xHRmI2p18Sy5gSIj1OGgilbn2hkQA3cQrmZsWplODxkk4lkR42EmhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Vvyzn5wZPDITNM0ewni5n886rYyEy+vTitBslTDJWA=;
 b=QNnDmbVczOWFm+uRYq6RyK1OtJCa/XIwEAEAtp50fYNye97/QkqcA7c+Y9C4I/snjPfuKL8t+P7kzbq5rIdD6KqtIAtQNUxLQk7JV+3W5PajptYA6SITY2Nj5XYaxhLFRVlQCY+WEQf6L+dk+SIb8Pzy2lIocQH5qncyBKLuNto=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3838.namprd12.prod.outlook.com (2603:10b6:208:16c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Thu, 20 May
 2021 12:04:13 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4150.023; Thu, 20 May 2021
 12:04:12 +0000
Subject: Re: [PATCH 03/38] drm/radeon/radeon_cs: Fix incorrectly documented
 function 'radeon_cs_parser_fini'
To: Lee Jones <lee.jones@linaro.org>
References: <20210520120248.3464013-1-lee.jones@linaro.org>
 <20210520120248.3464013-4-lee.jones@linaro.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <16b0f3a3-92a8-074c-f926-fba832060a71@amd.com>
Date: Thu, 20 May 2021 14:04:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210520120248.3464013-4-lee.jones@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:4635:589e:67a4:e02a]
X-ClientProxiedBy: AM0PR10CA0090.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::43) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:4635:589e:67a4:e02a]
 (2a02:908:1252:fb60:4635:589e:67a4:e02a) by
 AM0PR10CA0090.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 12:04:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a88ba7ee-590e-47db-23c8-08d91b8761d3
X-MS-TrafficTypeDiagnostic: MN2PR12MB3838:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB383818B1AE866C87B766662B832A9@MN2PR12MB3838.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hStCCGdKZZSrqUUJSmcCCzBSM4QYfF7FRcOqavFD2+GLfk5XpeYGNrDB84a8o6X1bGl15CJlu2fuJZzbzb48/1X+BtSYFT8PZS9ki9jyP0HV3PqrfQhxQygd9DHLnnN25vQmyVWH6o6Gecn630N6peteirCfjQTimdxWRcaEqwzh0ZQrVpdnpksFqU7tHp3kVcsOT/QWtyEsPLern4BOWBo607SrHGTZ7Qx/ltgIwXXAOmO9ROkDvzJipeK7BLVf++qCgLJj2427GGEjTq4cC+kA5Ys2siMJLCVjtLoZXUu/DLHDYeER7l4sYn6I2qMjpPcgcbhqxfbcl/1ml+Ghj6C19tFVSWOMxoUBspIStfG4XzhpMpMI8cGCR/rgMEOSanKpol58FI8+at4CphOQ4JGCuMqd5f/5mUukNb94wqHzhqynFBO9uIK1L9K3u8gCLbEOyqqDtLls2m/5RjhB4zgkfToquG873+L6EBMs50PhQSjzNAvSUZnrV+Ds96Co/K95lDI8XnxUDrHh32hc1wPV4TA/avRs2eG4Ij3/SosnUrIha3hhq0FzupLfP3hof/59WujWUj/o3aDbU1bMcZrZzpvyaKfui8KAnANjQnly4rgLt7+8hf+yGDJSk5yucTdyoMOeWK0wr+nxeI/y21/lz32FTOyu5QgntImRHa5s+x3Ly0rWcUtCvV1vqVDE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(346002)(396003)(376002)(31686004)(66574015)(83380400001)(316002)(54906003)(52116002)(2906002)(38100700002)(7416002)(6916009)(66946007)(66556008)(66476007)(2616005)(16526019)(186003)(4326008)(8676002)(6666004)(5660300002)(478600001)(36756003)(8936002)(31696002)(6486002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Ny9VTWxnN3Q4L3BPME1abzNKNUhaQjdERFJJVjU0YjJjQkhZbHhJVHlra3VI?=
 =?utf-8?B?N3l1ckRkRWJwYkhGbWNLcFNGd3lWbjlYcGNSUHc4Y1piR2hVUml4YldMMldT?=
 =?utf-8?B?NDlRTmRkNkhTUXpYN1FBVlRsWkdzcmdobFlNVnZCL3VqVStyejJqNTA2ZUVw?=
 =?utf-8?B?ZUFYRXZYZHFUblJ2NGpKYmc1RHhMTXdBelEwQUJIb2RlbnN6RFJWYVV4aC9a?=
 =?utf-8?B?ZnVDNDJ6dSt4YysyUHFTY0wvU21CeHhFVW1JMk1yN3lGYlEzSW5uaEsvWDY5?=
 =?utf-8?B?MjRYNFVDUWtQTzdyVkdLRGR4Y0xBTWZUVHBBUnpoRWFaQzJRa2hlZy9MSitE?=
 =?utf-8?B?UXlYSi9aQUFWUEhURC9YZ2hJU3pzQ0J4dzBFZ2RQb2lqZ05jWHlBNE5uTGhl?=
 =?utf-8?B?dEtCYzNXaFNBTy9NWjFKaC9vVkdIQjdlMFZjOXQzM2U1RmV5ZndJeEdPUXNR?=
 =?utf-8?B?OHpDZGhLOWlBMXZLNkhMV3ovODU5d2lGc2o5VFVaZkV5QXlORmlaNUZ4R2xl?=
 =?utf-8?B?TnVaQ2FoZTZVRmdXTVFIMmwzQzNvMW9laFRTdUhqejQvVEIwYUhpSVNpaC9u?=
 =?utf-8?B?cjBiUmhnQXlWckcxTlV4Yjh4UHNOK2JJcjVnR3d5dDdEMk1RaG9iaVI1OU1T?=
 =?utf-8?B?RE1lbktXd3MvYitHaFl5LytoaHRuMTJyYlF0Q2dMMElHVDhlMnlEcDNnSXRK?=
 =?utf-8?B?c1E0UGFmL3JKSDNKL2tLQ1hTbXRmaFZ3Mis0Vnpra2RxWDhxeGs2dS9CMXg0?=
 =?utf-8?B?eXpsV1AvTDdNWkZraHdIbjZiNUkyVnppaVlUaG82eXpuZUpPaC8wQWphMDY0?=
 =?utf-8?B?WTF5UWxFa3dEOHJ2TitNZ2JtTzk5MHJzM2EreGVMYjFsQTFFQTNLNWVlYUtZ?=
 =?utf-8?B?QkxoMWxDcittYXRVbmZ6VjY3Z2lKdUsrS1ZCWm5CaGJPeWtxQTJrNi9jcWhM?=
 =?utf-8?B?QUpwRkx5ZVVhdHRRZW8rNU9wQ3FpVzRqSjJraWhhcGV4R3NOUTB0eXFTV3hU?=
 =?utf-8?B?aVUzTGZhNzlpUmJnZVYvV3J0SEFUaFdmM2lyYTRPMjhBRW9jWDB2L1cwelE5?=
 =?utf-8?B?Wmc4ekFGU1NQaDVTR2lLcFFkUHVPL0c1VjdqaysrUXNIejNJeTRzelp0Ry8r?=
 =?utf-8?B?Q0tqUloyZmhjY1M4V0t4UnQrS25XdHk3eVZVQ2F4WVlXS1hHOXBVRC9ndFhO?=
 =?utf-8?B?aHJtOFBoSStFWVBLTGd6aFpJUnZiVFVwZ1hyS2dwaWs2bWN6QTI0RkYrNExG?=
 =?utf-8?B?NEFGaEh3ZTFQU3RqQ0tjVE92WXM0eHZXa2taODFtYmJQazJmcENpSkVkR0Jv?=
 =?utf-8?B?cVBoTUVST2NWbzhaYk1wTTBlNEVuY3lING56K25mNE1XRWlnR3phb3FHTWZ0?=
 =?utf-8?B?NGZVYU5DM2ZzVHMzU1Z2dE8wVnBNRU9DRm1YdTliNVd4NmpIMWtVMk94cDMy?=
 =?utf-8?B?a0RQUmx1dmZCNm9tSGJSYlpjaXVFTEJZZXdXRVhMbHg5Z2ZMRXNFdUQ5dVNx?=
 =?utf-8?B?dkFRb0puNFpmMzVta1k2NStHTkszUC9sR2RIYlQ1djRLVTdacU9tZ2h5UGR0?=
 =?utf-8?B?Z3R3YVdqQW1vOTVVVkxVSU1WbFNVRzB6bjlyRDBpOHR5dG9TRlZxUmNtYS9p?=
 =?utf-8?B?NmFnVVpLQ3YvMktjSzFxbndKTVduNUxUcGpBM0JYOUtLMTNRQXN0NGhhUEF2?=
 =?utf-8?B?Ynkvc2FhSDUyd0EvL0RqTWNtNS9sdnoyVXljQ29aR0RrSDNiamJZTXpOLytr?=
 =?utf-8?B?YVJuNFFQWXhxdnZhK2hMMU9OL21wbUt2YXV2UzdaRVdZL1kvb2JKUmo3Q3Fr?=
 =?utf-8?B?QVdXTm55OE9scUZIQ2pMZjZHVUR6YnIwOFlKRWJ3REMzZ2ZMNEk1NTVwM3c3?=
 =?utf-8?Q?fc3Lj9EzaBMlN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a88ba7ee-590e-47db-23c8-08d91b8761d3
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 12:04:12.7456 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LTMxhnDlFCS2nukhCjDfqaDgvgN1rRnKdrXOj0PEJcmsdjQRCefHsLvIryqStYoI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3838
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Jerome Glisse <glisse@freedesktop.org>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.05.21 um 14:02 schrieb Lee Jones:
> Fixes the following W=1 kernel build warning(s):
>
>   drivers/gpu/drm/radeon/radeon_cs.c:417: warning: expecting prototype for cs_parser_fini(). Prototype was for radeon_cs_parser_fini() instead
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Jerome Glisse <glisse@freedesktop.org>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/radeon/radeon_cs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeon/radeon_cs.c
> index 48162501c1ee6..80a3bee933d6d 100644
> --- a/drivers/gpu/drm/radeon/radeon_cs.c
> +++ b/drivers/gpu/drm/radeon/radeon_cs.c
> @@ -405,7 +405,7 @@ static int cmp_size_smaller_first(void *priv, const struct list_head *a,
>   }
>   
>   /**
> - * cs_parser_fini() - clean parser states
> + * radeon_cs_parser_fini() - clean parser states
>    * @parser:	parser structure holding parsing context.
>    * @error:	error number
>    * @backoff:	indicator to backoff the reservation

