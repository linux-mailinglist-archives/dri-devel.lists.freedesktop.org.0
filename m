Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0946E75DB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 10:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92A4110E8D9;
	Wed, 19 Apr 2023 08:59:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::61f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43FE810E1AB;
 Wed, 19 Apr 2023 08:59:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZiBWOvSHQWxG8UPrJe5csHY0RWfeajI+7Qsh0E4Mlf4/pByJRmFqSC+wx2AUgpmhgIAIQWNq2GokemABnHlLrbSqPq8nPV5qHqIOAZ1FBML1paFH7eIp1jB+//QfYVNch0VI9pLsxxxIolkTbeL3oiJiV617dNjzSAPapmT8n+qNziPswQp+DsBYmjZqaGjQWZnhZG5bOcmfUbDtOnrcIH2GPZwFSyCO3xvcI8dUtHTf0WQaBc9i2pWuowR1gNJ0kzMwJuT8xQCzhqGNqhkHP7tCjGRY/ouwcpB0LaBxjG1hh6st08LCgI4/4c8ichXzdwQ/1rGdKSnO1knc1Ecdzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k4iQ74Rd+sLxA7sWzlqQrXYdIH3XXH402mx7jcQab6E=;
 b=m2TXpptw3OJvI6U8OPum/lQK0ofuqnR53X2F2YV0aTmjO4Jq17k5apxrSqS2fLsCl4Gz2G6LRv/ub3dgTiHBi4gEc/6/lYVRsgb6AcWS4VleRUSoJjtOuOauwoK9BZWNOo3BcISubmeuxTZwAp4AU/B6Q7q0WZOdsj7zebvfbIKV8hfMLfrhiroZRw+gRF1PpbpCH2z5ObnVBUSsArdZUyVXaLXh0QCgQx4/EkIyZUtAadBJG2IZdpqsaQo4en7174lRX8YLOA8pR+E4FoL+JWQX3wTJifjZJNi87Jmeim5+nncxe+3ywbriNsyl8aTikQB5nmYVmE5YI86zRIwiVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k4iQ74Rd+sLxA7sWzlqQrXYdIH3XXH402mx7jcQab6E=;
 b=kt6C86WcGGNIV9Y4t1PdV8FnGTHQLt3YzHgBvpyEouhQuO4ChbDJJkBp/byfgbpF1pVqHa/ODB/VvalS3TK2otfx37nhRqBpktNj//8Mv5si266pxgmjLlSvOFZc90OfIQa7SDurvHQ6gQzWMbqU91ppQ2cGOiFYr/xKYQ6Ro9o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB7844.namprd12.prod.outlook.com (2603:10b6:510:27b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 08:59:23 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed%3]) with mapi id 15.20.6319.020; Wed, 19 Apr 2023
 08:59:23 +0000
Message-ID: <655e2eb7-0cfa-a488-ddde-e2507073dced@amd.com>
Date: Wed, 19 Apr 2023 10:59:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/2] drm/radeon: Fix integer overflow in
 radeon_cs_parser_init
Content-Language: en-US
To: hackyzh002 <hackyzh002@gmail.com>, alexander.deucher@amd.com
References: <20230419085747.4720-1-hackyzh002@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230419085747.4720-1-hackyzh002@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH7PR12MB7844:EE_
X-MS-Office365-Filtering-Correlation-Id: d1422192-4f3a-4493-12c4-08db40b45ed2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m107qqvEtTV2qi//9x4itw3Fy8FoqJTmpk/JiMKjQrDn+FM3QE1XGFVxfp3WoEs9AMZ/YKycfwdeyZia5G8OmHqDzodBM2XfGVr6P5MPvmeofKdZWnUAk62PzoBC3nVjI/vfuwmarhamRMo5So2AcCbOJczPHJ88xOFBsEbXr+V5aI3/3J25aNSP1qCFayDb7jk5LhHXgNU3F1LrVzgsrRf9szDIVsM4RnyVjZhBLUFCoUTEwyQc3QNl4+xY34zmCADbhzOWNhl8ojUZMIEBfHQpYn5fSJmuw8G4jzPYVRj+36nwJol0DKJz8ydNtvsZzBJw5IMmo4EJeLMCOa+phwRBMx/MkbWO/9svQFn3XD0kLQUqrJnTOj3F5MM04sr1UDpywho+smTzEmIAhRxcOlDuqa/BRUMRxPxAdNjVL532M7d30kAFa+QvqvKJaTwMCBGAkY5c7GBpk7ZGFiq2Utr0hE0qIhoB4iW3jiV+26eEVsBxwCBxRpFIVI3g6eV1bbwvshu9u58bBaef+qgqN87wj3SuDzCNRXXmsFU6olVse0G30Sc3hrG77JI8S+BFmP6Qh2ukTBcdNAN2SJRj5qtcdyPGPB315i/n1wX7nFWWF7PCZg72dEAfNDFoJNvFug31hwVLqUavMHeaGNSaNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(396003)(136003)(346002)(366004)(451199021)(66476007)(478600001)(6666004)(38100700002)(8936002)(8676002)(316002)(41300700001)(6636002)(4326008)(66946007)(66556008)(186003)(4744005)(2906002)(6512007)(36756003)(83380400001)(6506007)(86362001)(31696002)(2616005)(31686004)(5660300002)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUJ4dHNGOVV3VjZtM2pEUUhLRDM4OEtjcm9LWWpXUEFMb2g1cXBCVHlEMlU2?=
 =?utf-8?B?WHY3WGI0dVJYZXVQVCtrb2dKeThVeFM1ZmcyWk1XeG1jOURFeUM3UjNJanZ5?=
 =?utf-8?B?TjV5bHo5SEpiT2ZkamlIS2IwRFc3ejJFYlIzS0tKZ3NDUWxJK3lhOVlHQndu?=
 =?utf-8?B?VW9DWDNuQWZVS3BvamVpUTdqVnpUTkdCZTJ5S0RjeGZNQ0UvRk5oWnFaRDhm?=
 =?utf-8?B?VnZLMTZ2bzZ6aEZvS3hOc2tRYU44cmVSeDIydGMya1hyQ25rZ09ZYktGRHlR?=
 =?utf-8?B?K3FmMEVzVWxrZVRhQTlpNlMrQTYyUU02ZG9xNi8xV2tmTTNsd0ZnZi9KL1dZ?=
 =?utf-8?B?UC9uTVVjT3ZlMCtsVDAycFR6SjFQMy9mU3FLMDNvRkhyc2VnNVNNc0tTNndn?=
 =?utf-8?B?Qis5bWZIUlh6M29ta2JmMXIyOTByMk5nVVRxbDFUSEVMZXA0alBoRFFRaDUv?=
 =?utf-8?B?YzliN2JXMld4MnpUbGZTa251ZDFwR1BVOHh3OE5iYmdkazNiVmI2VFRUSmMy?=
 =?utf-8?B?eG4yTFh6TXYvaU1qWlhWOUhteTduempyWEc1K3lkaDlCYVI5YitsempNazRI?=
 =?utf-8?B?NE8zakp0cFNhNFVjQ3VvWTJua2xWeDUwaVA4bW9UcTU3bkZoYjkrd2Zrc01R?=
 =?utf-8?B?VExPVHlIWlRaMUkvOS8vZWt4UkNkOEptdlkwbHNsNTl4YkpDQjNVVGxuTW5W?=
 =?utf-8?B?Q1pOVVdsMHZ0U09obzVualdwZkxrZkswTkk4UkNVTy9OMGgyell3cmZZMEtp?=
 =?utf-8?B?bnpkMk5pdkxKRlB0dlNWeFhPNWxxTWRpMm5JV21XWUNURWcvWlVsS3R0UDNp?=
 =?utf-8?B?N01ZQ1YyMUszMVBoVWJIbjF0ZHdaM25XZWkxQlkrS1ZFQm1PRU5jclRackoy?=
 =?utf-8?B?bkdwQW5sc3k5d1RIajQyMy8xeUVQeFpsMm5TOExkYlh4TkNPaGNWcmZkUCtN?=
 =?utf-8?B?QU5QUzJ5RHpaMFFaSVA4YjBKNU9Qd1BIcXFHRmpyQmhseDRMa2dYU2tscVZI?=
 =?utf-8?B?V3B2eUY5YjhaZ0JiSHA4Z1hIWWMycm1QSHdlWlVEcktibUVILzZUei9RdlFB?=
 =?utf-8?B?ekRTbFBGZzJnWU5LL3ZDSU44QTlHWVdYaXc5bnBRMGo0ZEZWVUxUR0R6VnNx?=
 =?utf-8?B?dVZ2VXRvK1NiTFNsVWJZMmZJbVhaQUR5eUZoMUZoNzVaVzk4S2Z6OTBySDl4?=
 =?utf-8?B?SHZVMUhaaUNiamRkczY1Nng3L3RhVlRDOHV5RzRIZzNtcERZdG8wSXpkejJO?=
 =?utf-8?B?azJDWEhBV290MlE5eHZjRm45TjVQWG0rcXY4bk91VVhGVHpvM240aTRoUHB4?=
 =?utf-8?B?bXVBOHJvM3htN3ZodkNFOTEwcXR6NHN0bzhFT3lnMVI2OHBDRFNRWEF6T0FL?=
 =?utf-8?B?aFRxbStpQ3VFSDR2RzQ1TkZ6RW9FbW5FSFVidUJpR0ppV295aW5vakk1QlZl?=
 =?utf-8?B?NE1DNDRnMCtLa1RCWGlGa3lJMElWUFN4OFhQTTRBcE9FQm9LdXoyWmlDNnJV?=
 =?utf-8?B?S3Vab0YyaXlkcmVOMXROaFdMSUtLQjVXU0NnNHJ4V0lkZHlTQnMyTmNTZ3Ar?=
 =?utf-8?B?VnQxR3NjRFNrbDU1eGhmL3hDbVg3R1dxU3JiSDdWQ2xzTGFoVEVHeDZGZFYx?=
 =?utf-8?B?UjVHdmE4N0l2OHBRYlF2dFoza1dQeTIzeTUvbmprVEJBbnF6b0ZYU0JNRC9u?=
 =?utf-8?B?QTlyK3d1K1NBaUREai9KL3pjVGhuejM0ZWczaVhXT3ZpWXptMGxOdk83L01s?=
 =?utf-8?B?UnF2dzBiSEFiVytTK0VVN2xIelM4dU95d1BpYWI3ZnFhUHZQMTBHV254ZDM1?=
 =?utf-8?B?czhHYXAySDQ5ejE4SlJhR2YyMHpXRUl6Rk45eXBQTU5DMnd1SE5uMGhVZHhC?=
 =?utf-8?B?d0d5aHp0SlZCekhkNWk3clV1aUZ4YzhmOFBrZ3VOdjN1UWlIOFMzSWpoUzQ2?=
 =?utf-8?B?THlPSFp5YXM4akdoRFhMRzVKYlFmclkwTnYyT0ZURlRkMHFkZndVc2JLYXha?=
 =?utf-8?B?SFk4U2tMdHI1K0pkbUNWTDhqZGN2TUVyZmpRYS9GMTJENVZ0VWZvOVROTVVP?=
 =?utf-8?B?N3YrWWdFVnloYzRMQXR1SXNXV2JUZDlZNVE0K2xEamFFK2FZTlRxeVYrODJX?=
 =?utf-8?B?azdCVzZOMitPdmlZTTQrR3VKR2FrbHM2NjZzeWx3NFdWN094bWpqZnZESlRQ?=
 =?utf-8?Q?1kvv0UHXfJiKxN6NOjlYLp+5XVy+7JibGBxwLm7XPMr7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1422192-4f3a-4493-12c4-08db40b45ed2
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 08:59:23.4361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WYyLFSR2l+wfcEg6uabcP2T6qlu+ASwwplWqlhzDvscMmTVYK3Rov+3RaAR22lF4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7844
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
Cc: Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 19.04.23 um 10:57 schrieb hackyzh002:
> The type of size is unsigned, if size is 0x40000000, there will be an
> integer overflow, size will be zero after size *= sizeof(uint32_t),
> will cause uninitialized memory to be referenced later
>
> Signed-off-by: hackyzh002 <hackyzh002@gmail.com>
> ---
>   drivers/gpu/drm/radeon/radeon_cs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeon/radeon_cs.c
> index 46a27ebf4..8e12b406e 100644
> --- a/drivers/gpu/drm/radeon/radeon_cs.c
> +++ b/drivers/gpu/drm/radeon/radeon_cs.c
> @@ -270,7 +270,7 @@ int radeon_cs_parser_init(struct radeon_cs_parser *p, void *data)
>   {
>   	struct drm_radeon_cs *cs = data;
>   	uint64_t *chunk_array_ptr;
> -	unsigned size, i;
> +	u64 size, i;

Ok, once more: Please only change the type of the "size" variable" and 
not the type of "i".

Otherwise the patch looks good to me,
Christian.

>   	u32 ring = RADEON_CS_RING_GFX;
>   	s32 priority = 0;
>   

