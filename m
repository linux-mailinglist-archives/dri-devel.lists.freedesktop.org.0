Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAF83A24D5
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 08:56:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92C16E486;
	Thu, 10 Jun 2021 06:56:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F0026E486
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 06:55:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VdHOefeKFKlz5Iw9HX+OfLEDwkjDhITGJd/+t7mVAMl3O4G2HGXnUmUM+nMGsVNsGCE2D4iqkWOQqjU6mjKk4byDE2qbc/rvBrxarGnMhyF69ORdyYEdgjm3+V8vhSTfjbghgrOUnsIWOpo1eT83oRsbmsh7FeJGuJt7kKCAa8vAbHIrNaCopXg2aM7AZxCmPRqw+dLT63o8l/oIYebRZdOSj/hmMaYtETwAXwDCmmVHGUjqDHjbdbNyI/xKje2PVlYJlcDUWqSKsh6tt9cu4mM8YziyH5KCw8T3EuGBennjbck1TSWKyzbQUTUNHrxJuNAKpPkbYYwV3ou/2RcWrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tvx6C3S9rE6J4FOf6fWwcRj3saly2pUQCi4Ws03wCBw=;
 b=fw47+zw0CZvMKSMxZwF/aKbd6TTVFTceA3+EUW1iB9ay2RRICBF2A0O6wBQNz5RxAUviANoRf7zXMyLsY1U64ZzN/wLp+iZvb8gnNlXPSr5tj5/U5/HgxhdGDsUl1itzzcMkMO5wBsiVhlo1ghmd0XwOsyNT1zVSItwBJradvP9HDgyeOzZwFpOPwEtfqkyuJJqAB+gQdsp0ziUjOAHL40lFY1/m3q079VE1IZ8BF4gX7tJkK8p8pwttnFYHxmNXbCtAcqUXqDsTi7iGLnY232EYU0T9FtmtiXIhDLXEapfNoJnGF7h+/iN7+2eVP1lVBCUYPS5VFnQHYGiGERHIuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tvx6C3S9rE6J4FOf6fWwcRj3saly2pUQCi4Ws03wCBw=;
 b=D+tKp0m9YjceLmrdBcoEOO1qL/oeepX83AszX01X6SoHBg/cQC/fxTV+Lntx9x0s37WnRyNkWaMOLHpJ8IvA2Y8QypoFhJ7VRxAs+asD7ygT+9b+5eONg82Q5iYSl/oJRbhVZHU0AYH/qFYMf+waGPfYWCiAG0Hm/vlDN5nNcSM=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4047.namprd12.prod.outlook.com (2603:10b6:208:1de::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Thu, 10 Jun
 2021 06:55:57 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4219.022; Thu, 10 Jun 2021
 06:55:57 +0000
Subject: Re: [PATCH] drm/amdgpu: use correct rounding macro for 64-bit
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20210610030344.117897-1-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <6c62913b-5b3e-5a40-319d-e1ac069d14e9@amd.com>
Date: Thu, 10 Jun 2021 08:55:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210610030344.117897-1-airlied@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:c285:5f9a:99f5:633e]
X-ClientProxiedBy: PR3P251CA0015.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::23) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:c285:5f9a:99f5:633e]
 (2a02:908:1252:fb60:c285:5f9a:99f5:633e) by
 PR3P251CA0015.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.20 via Frontend Transport; Thu, 10 Jun 2021 06:55:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2c3a3ed-272e-49c6-9fa1-08d92bdccca9
X-MS-TrafficTypeDiagnostic: MN2PR12MB4047:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB40475FF2A7F44D4C2DA7858E83359@MN2PR12MB4047.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UtWEmzT5x5iaVzI+owdyWHj0opV/wTbbNy9/mZNbwa8NqxAwUtx6LsLFKHUYwpNSiQciv24ottRk6jvabZHPT6PEqdX6vHgBthB4RfOxWjGtGhaJcCA3bYqT6KkyQ5aJJM4eeQA+nL8dICD+8Y2Z/k0Y5F31DvbSQEtJZ/RUgl1y17nI4dfMoJR2ITz41hWhm0QhDsGC+kijY7zsyc8GtHC5yOKtC5wesw5xqkGcvm6eUf70PmFmT3qm3nTQ3+8sKV3wIdP79BGhooyul91uRzbleFFVuCw08HcMP3Pu5gLgqmHftGcovKe1JxrcJORuKkFSHY6Zj8wBHmD/b9Zyw/U+L8pcvl2vKu7QfN8VP+cm63A1QAPErl7+8sJIywy+Q9/4FdTP5epkLG8uFbLnfEcFALxO9/prAlx8oy9YXfV/3h0ijDXjU8kFd0+JB8vzropLphL+weKI9gpzRHr9NYXL8Dz0Ca983RxUN0SEA7z38ZZY8SGX134JBmN2TLGwqTLmXacGvN0rSLY6hjPbKQpZxsViopnbq8h7zXnvsS0THbWg6JVy48PiAiQ7jxQsFhAi1lQHs7iJLRBToHrJ7oMDy/94/eYt0LpgQ9WvPpfHmDFSFrBLNtUOvW6L8Zk/YgzFKxFyjiyyqKOTAjVMO5XlTV6cRgmegssbKS1KtA8Lw6EIUuIqk7HdX/Sj4wYG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(2906002)(8676002)(6666004)(66556008)(38100700002)(66476007)(36756003)(66946007)(83380400001)(16526019)(186003)(86362001)(8936002)(66574015)(31696002)(2616005)(478600001)(316002)(6486002)(5660300002)(4326008)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3lneDRvaGo5QmhVemFBTGErcnd2bnltR1hjcVdreWRaV0V3UzN6WVNoMmtY?=
 =?utf-8?B?eUl2dHR6T2gzRUlUbUFLeHJTaVdva3cxcUsxT1c4enNzenJnQWNGZWNZNUFa?=
 =?utf-8?B?VmV2aTJDc2hQTFhMcHduZlp6ZEVMS01CUytJWmlNVHlOZlJUdVB6WGg4aUdG?=
 =?utf-8?B?TUlaNFl3T09hcjc4ZUhic2NiYllURUlxYXZZeHVpRWRRSVIwVHdGU2FWbUFT?=
 =?utf-8?B?STloZCs1NGllUG5WSDBJRUNiZkRja2hwYmtzalNJV2pDeHMrT2ppTnlFY1h2?=
 =?utf-8?B?Z0NreFJVY254MHZ5QWJVdlUvZ1Jmd0VJVEFqellPVUROZlhPUnprUmJ0OVpl?=
 =?utf-8?B?VE9RdlBTRzJPenBMUnk3NkpNQk9uSTFpUlRBUnlNQ1U0VWxmL1drbVJOTWtv?=
 =?utf-8?B?dVVaKzJYT1BLMk5IQkxSNk95NllmRVJseVptUTVTRUg1WDdvRmMxR3dGOURh?=
 =?utf-8?B?WC8vZkhpTkROTlMxeDJHTkYrb0JXMlRpenI0ZnVRNGhzVVhPUUVrT21ISHp6?=
 =?utf-8?B?L041SDhrUmRGQW5mZHVlOWZRUWhpTkJsanFFMm1tSUpjTXRUL2gwaFZzVGRR?=
 =?utf-8?B?TmNWWHY3eU56WlVmVGtOL2RCVkNRN0ZxSEF3WjFQWlVjV2pnVXNLbllTenBI?=
 =?utf-8?B?QUV6QTVkaGNiRkxJbWx3WDhJNERVejZoVC9haE1DQjBQcGVwd090aWh1MXhl?=
 =?utf-8?B?K3BrZGJQY3ZEWFBXMGJkNzAva3NJSXVYRDFYR1dCUWxaenl2ZDIwdU9QVUZY?=
 =?utf-8?B?dSswZGp0SFcxTWNSM2xDa28wTTJDYlNJSHUrMW5uWHRHdnp6ckpZQys3TXZi?=
 =?utf-8?B?dWxjT3JJOGdiVXo5dkhnYThMd3JOOTR5eGhUU2FJTzFNaVJLQ3AreXVJNXJp?=
 =?utf-8?B?NkhCb0lxbWNiU0taVTFZeXM1ajBsaUdrekNpMmkvNWxNaTBJbEFFWnhlU1hH?=
 =?utf-8?B?QS9GRVllTHUwMnJJaVhFVmtuS3A4TXA3U1doUVVvamdaN1g4T3ZNNnVSYzFs?=
 =?utf-8?B?UzRWNkFUT0ZyTVdnbEk2YlBqNjNqQzNGTncwbW9ZMjBSNGdaNm5zZ29ZNFN4?=
 =?utf-8?B?UmRsc2t3a1Z5MTNJQ1FyR293RlVMQkhiSkQrZDFmUU5SR2ZaMDBLWk5STkRn?=
 =?utf-8?B?R01IRkd1SUoyVGp4T2hiWVBGR015ZHpVSjJWdExodEpYeHZtYTNQQVpzMElp?=
 =?utf-8?B?aUZHQ0c4b1R6QWg4K0VIWGZDSE44UytuR21HWDBJUk9jYVUrVFI0VkJtTUVS?=
 =?utf-8?B?SWw0ZnB2NUxwSE1Ba2sya2d6K2pJS3hKZ0hBQ0RsL1J3S1ZqOEl6cVNoUmlI?=
 =?utf-8?B?WDM4bG1YRkJPZWFwajM5Q3Y0ckZPR01zeXd3UjZiTVNFbE41TDhxYzhwUHJu?=
 =?utf-8?B?dzRYT3EzZUpUcW5sckxXdnVWNVVBeEgxS2dQc1BYOVNGS2hhOEZNWWxlWVBv?=
 =?utf-8?B?SWxWaWhEdVV5WGdScFpZLzdvZE5qSlBWRktXUW1JVVFqTWJZTWhLdmlVNkR5?=
 =?utf-8?B?UmpRb1Frc1BIYzgxSGM3ZzVVaGNTOUZDcTdET2pNdHlLV1doQWxaRTFUQmpE?=
 =?utf-8?B?ek8wb3BKSmJYbkQ3QitNaG4veUhjZDgxajVWaFZOVmFyRjlmNHdYSjZ0MDdD?=
 =?utf-8?B?WDdkcEJCYmhJZHh1WEJTdU1pS0pQdURaaVpSM1c3YWdEWlVsMnNnb1hjSVN3?=
 =?utf-8?B?cHJmU0ZseE0wTDU5RnRlRzJvc2Y5VUh4SG1xd29WOUh3QXNQOG1uQnZ2ZGRT?=
 =?utf-8?B?R3NSRSt0U1NlcU9rZEg0U2pWbXU1dE9Fbnhjai9jOEMyVC9MUVhUcnhuZVNR?=
 =?utf-8?B?bTUyTGE3NHhCblg2UXM1ZVFTVUdPY2NIRFpJRTJER1FhRm5XNkx6a3NPSFUz?=
 =?utf-8?Q?YjAHHv3Fh8QWk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2c3a3ed-272e-49c6-9fa1-08d92bdccca9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 06:55:57.8042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r1xAwUlUfNK6y0d7l9oIAp4DBPJmJZSYQpIe4lZ+Uht76nn/1iwjadKUqwFmuHtY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4047
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
Cc: alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.06.21 um 05:03 schrieb Dave Airlie:
> From: Dave Airlie <airlied@redhat.com>
>
> This fixes 32-bit arm build due to lack of 64-bit divides.
>
> Fixes: cb1c81467af3 ("drm/ttm: flip the switch for driver allocated resources v2")
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

I was already wondering why we suddenly have a 64bit division here, but 
couldn't see it of hand.

Should I push that to drm-misc-next?

Thanks,
Christian.

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index 9a6df02477ce..436ec246a7da 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -407,7 +407,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   #endif
>   		pages_per_node = max_t(uint32_t, pages_per_node,
>   				       tbo->page_alignment);
> -		num_nodes = DIV_ROUND_UP(PFN_UP(mem_bytes), pages_per_node);
> +		num_nodes = DIV_ROUND_UP_ULL(PFN_UP(mem_bytes), pages_per_node);
>   	}
>   
>   	node = kvmalloc(struct_size(node, mm_nodes, num_nodes),

