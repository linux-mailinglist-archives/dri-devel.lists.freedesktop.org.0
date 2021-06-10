Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C190D3A2641
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 10:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E378B6E47B;
	Thu, 10 Jun 2021 08:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A906E47B;
 Thu, 10 Jun 2021 08:08:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JC7MYWvfSONt3tEpUJWhDircga/gdkE+xosf5/mxph3LNz8Z43U3E40ZGBFr+S66VCTVi+grYL7M5SaE/6D97zVuJe5vEOFBIM6JWhK+VZrD47PUZws1bQtZHYFbwlvAu+eYDEXf8zaiN5RSaXLtThe+Holxgewvr8zvCSFqjoJwUFxDMZRNuV9iYMGKI6UU4xpf75VI25JhOdO7HdVga8N1f7bj8RPmId4T+fKceVqoanydQmtCEFvbC6aQ2o+GF3l/h8VrrLX82JnkOjyCI1zsRued0emSJyC6cNUpEdAg5yH7fdOQWRGWozcjn86RnLJlAuXXmuuRB9q7lQvHyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37TJ+Q+3aPJX6xjIMvINfbWrfrK9Rcrl/xMlRxREUOw=;
 b=jIgMvdYpZvde2k5Vh0efF/esgj4rztfX87MOdD47bvmw7Q8vQfZvcqcRhiyWsDg1sqePOL0hcZ0WxX4WTXoxZTnx/NEdGLkVR3XsJ7MwyhC5SRzO0Uyct9HuM+fLCCnzzTLZzy9T827DyO9Juu51vvBfAwFyFKc2dewoTbtgG6SF2/nIqaEzoCBqqTE5pXYOrF35L3eoENvXMCtx5Yo1ET8NbvGABYCrNWlqCiPCsa+ZSVPpRudw8K6SjJD5Jkg2UkhqL0cjxfopsVMauySajJi4PMjhoOP4J3AWLGyJeYO0d2dKj3p63+QhzEi9FBAlq8FJkQXyZ6BdI4UuxgOxJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37TJ+Q+3aPJX6xjIMvINfbWrfrK9Rcrl/xMlRxREUOw=;
 b=o1gzhltkygTFXSFIG/rwo2RIBUXCmLILVwANbdZiM4Axx0lu95YQO3HDb4+f/Xg323mD4prF0RlzEwasWC40tf/K2IQgNofpyBq4AchlPekvdkQEwTvDrjtTbk6YbYoTDTTtGhpL6/IQTVcbS8dWnPYYbzGxBt3lATiqG2xiyYk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4255.namprd12.prod.outlook.com (2603:10b6:208:198::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Thu, 10 Jun
 2021 08:08:47 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4219.022; Thu, 10 Jun 2021
 08:08:47 +0000
Subject: Re: [PATCH] drm/nouveau: init the base GEM fields for internal BOs
To: Mikko Perttunen <cyndis@kapsi.fi>, imirkin@alum.mit.edu,
 linux-tegra@vger.kernel.org, nouveau@lists.freedesktop.org,
 ray.huang@amd.com, matthew.auld@intel.com, dri-devel@lists.freedesktop.org
References: <20210609172902.1937-1-christian.koenig@amd.com>
 <899d773e-9a7d-062c-47fa-080161b22cd6@kapsi.fi>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b0a257a6-af87-c443-0eed-0f3081169482@amd.com>
Date: Thu, 10 Jun 2021 10:08:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <899d773e-9a7d-062c-47fa-080161b22cd6@kapsi.fi>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:c285:5f9a:99f5:633e]
X-ClientProxiedBy: FR3P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::8) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:c285:5f9a:99f5:633e]
 (2a02:908:1252:fb60:c285:5f9a:99f5:633e) by
 FR3P281CA0040.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.9 via Frontend Transport; Thu, 10 Jun 2021 08:08:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f6e169b-3751-4eb8-ef68-08d92be6f8c0
X-MS-TrafficTypeDiagnostic: MN2PR12MB4255:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB42554BFE740647BC6BA0310783359@MN2PR12MB4255.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FTX3sa56pxDwHvZFQrrAI6lLQCW3Htv7HwYazymrkeTl4VmyZBr/Z1yu4168b21/1NJ5Lm5v1WkXlNer4FquCfXYvN7zMeGk5Kh3Ap/zeD6stme0SL+InjZZW2GWnvb0wz9OtFdu40ROtQ9WuhbaqsQUuOY/cyCJ3PX/GGbJa39/+iizgYAVX4+WszCRJ+VdvdaZsds95aZFJS6Wsbbj6nOT9oCAUePM1aSSbroRorgglI6WAXjIAdJbobDP2NDIY/jEDRb+Vh4EmV6vvBZ4kBlCzIk2W6Ii3Ykav650B+ceA1Vuobp9i+/ZND+5vdwtW0lWDUyfLbSwLXjGS31GF+osSGreuj8n0vSvgmZRPPROvO1bEue1fG6OwGhFrso2oTK0QK8VvRyQzwkB3bQGELLI0xQLyWEsJFhuizGAwn04hyEYBr7hJdo0DJJMzNdls5RR9CACB2kDhm0WPawIwCJIkRD/+RjHwy9onyJi81Szjpz73k5X9jHw52a8jKjlYgA2FLrqH0n/AtRuVLjm5HpCWfXanpQv5LtpSCGVgraWLK/T+gRw0TeN8fTtHg29GSSnWXGCXiQroqbZfuNvy1+gzBTokin3nIiFgRcJN5w+QS2XPYfg73WxA6GiHtnt8b/Y9eVFTT9+5e5f5mkDMAHn5us0lr95z2KoTB6zRiK8tvuLTlEg5jSL01Acxa+0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(6486002)(8676002)(2616005)(86362001)(5660300002)(66946007)(2906002)(31696002)(316002)(6666004)(38100700002)(8936002)(36756003)(186003)(16526019)(478600001)(66476007)(66556008)(53546011)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzRVQmFYL25nZnZ6cE5YMVdpYy9ydDIvQ1BDa2QyclVrc3ZFV1N5dkN5VEtr?=
 =?utf-8?B?VVFrU0xSNzNXdGhXd2w0eExJa1BRcG5CQTJ2L3llVFR0WDZqeG13dm5Id2JD?=
 =?utf-8?B?NkNQcSsyZlJObm5OcmhMTWJlNXY5R1NaOXA1bWFCeDFLQVBrL0k5dFE1S0M4?=
 =?utf-8?B?eUFMRHI1MS9FTTAyOG8vMWZiYnRORldBMWpTcTYrNnhZd1VLbEZaNVRCRGVm?=
 =?utf-8?B?di9TeWt0cHJjM1ltNjZCb1BYQkZ5K05ieVJzWXZTYlhaKzdVS1o5cDd0U3RX?=
 =?utf-8?B?WDVidEhPOG1FODdOclRyb1ZTV0U5d3ZjbHpsa0lhQW0zSWlaVGtXRkdlOGVX?=
 =?utf-8?B?T0ZlV2szNVlRT05VTmZxa0dmREpHaXdhQnlwbCs5RlNWNjZYd3ppc1J5dXVi?=
 =?utf-8?B?Z0FkcGxhR1A5a0V1MjFaK3JLSkpWR29EbitEUW1YcGtudXRqdE1QTkw3Qlh5?=
 =?utf-8?B?aThtbC93Z1R6Z3ROSm51NGNLcHNIVnJidEo1MERPcHMxc3B2QUNRb0pRU0pY?=
 =?utf-8?B?U0FuYW5YaHBhNlFvRnNVcU91NkZvbmgwL2ZUZHBsd09IalZRSVB5UTMzS09R?=
 =?utf-8?B?RFBIYlFhdkpTbC9qbWsxejBLd3QxSTdlZ01PS09LeHY3UmNGdktNL0RMa2ZW?=
 =?utf-8?B?b0ZiWHg0eFRrcUIrMlZvSXJoWmZqUVd5dmV2V09Zb2s3bms5cFNhOUtGTFZ5?=
 =?utf-8?B?NnkwZTdKdUp3NnZtQmFVN2s5dkQ3K085aVJWRGozUTJ1UFNRNGEvZHpMZVRW?=
 =?utf-8?B?SFVzNG9MTHphS3ZyaG1jdHB3Mm9la1JWb1RJZktLNnZXYVFWVkc2VXVmcXJZ?=
 =?utf-8?B?VkVsbnNXL0RrdVdSdFp4aFM2ZTE3dkhhVHhXNFdDcGhoYlc1OHVuRDVubXdB?=
 =?utf-8?B?enlzeWZoWWNrN0xKWVd4S01vUUhWRkRXZW1BOEZXL1RJeDYrWUpwalNYM2Q1?=
 =?utf-8?B?dTBtd1VERytXOEtCbG5GTDVFL3dLSis1V1VVc0RzWXQrYVBvNHBXVmd3aHJO?=
 =?utf-8?B?VUpnMGYxS3MzNHNZa3lwM1JIazhsQngraGo1YStEaHpvdUpjbUZSTXlmM1g2?=
 =?utf-8?B?U0lPWUtDemJMR25FdGNEeTN6NTh6eW5yaVRCWkVLVG5XNGNzcnc1ZG0vbStJ?=
 =?utf-8?B?bFFqVXlpeWlVL2VScUZWQ1VJRzRLcTluRHEwM1pEdjI4Wlo1UEs1a00ya3VP?=
 =?utf-8?B?aHZ6SFJSODBNbStpT3FSTllTYkhzMFJTcFlmdmRnN2JLUkxqMjRGc1c3eGww?=
 =?utf-8?B?bS9KZWtWUDBpMzJKWFVHb05BcngwTFhsaXRxaHpJcmZ5Y2hqbkxrMXIxWTFH?=
 =?utf-8?B?KzVvSGUzaHRRZk5HYXNxMldRbFlmUTMyc1h0di9TUU0yRFR0WGFuek0vNFUx?=
 =?utf-8?B?N21KUXFOOGwzeW5vUGI3NTAxUUZSZ2NwUjZ6KzlTOFgxbi9Tb2x0SkhZRnpq?=
 =?utf-8?B?djFDRE4rZFlYSllDTitRT2QvYkR1YUNFZTlMN3E5aVZFZ3NZeHQrKzF3cmVR?=
 =?utf-8?B?bk9xMWR3VWZrU2d5UHBSQ0N3N1lWbzdzUmFlQkN2aVhEcGtpSW1kZVhXRzBV?=
 =?utf-8?B?RlZJdk5FeWpzVER2QzJLUFB0eVhMVFV0bit0M3gyZ1FwZzVsNHZGNTQyWTNa?=
 =?utf-8?B?RXR0bnpDdTB5Y2RWZWh6SlBINVVaOFNiMUlyZkg4TUFXeXpweWp2QXJYTGx0?=
 =?utf-8?B?UURXT3ZrYjFoTmdaMTErbHZMTkpqQ2lkSlR3ZDJ6NEtlU2oxczRTZUZXRnFU?=
 =?utf-8?B?eUczcXBlNk40UUMvMnVvYzZvc2Q2QnJ0N2h3WWp1MS9xMC9QdTdlWTdSZ0M4?=
 =?utf-8?B?cmdXZGxnY2NNK2YreE83T3VyaDl0UElpNEV4YUVXRmtSeGljNlNYcVUyem9m?=
 =?utf-8?Q?122GNuvHqJPfg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f6e169b-3751-4eb8-ef68-08d92be6f8c0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 08:08:47.1518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ksOlWAixyHj998qeQeM1pJKRrwnV8tfW58QoQXnas4/b4cTAhmwtoMrWdqoOQzUU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4255
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 09.06.21 um 19:45 schrieb Mikko Perttunen:
> On 6/9/21 8:29 PM, Christian König wrote:
>> TTMs buffer objects are based on GEM objects for quite a while
>> and rely on initializing those fields before initializing the TTM BO.
>>
>> Noveau now doesn't init the GEM object for internally allocated BOs,
>
> Nouveau
>
>> so make sure that we at least initialize some necessary fields.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/nouveau/nouveau_bo.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c 
>> b/drivers/gpu/drm/nouveau/nouveau_bo.c
>> index 520b1ea9d16c..085023624fb0 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
>> @@ -149,6 +149,8 @@ nouveau_bo_del_ttm(struct ttm_buffer_object *bo)
>>        */
>>       if (bo->base.dev)
>>           drm_gem_object_release(&bo->base);
>> +    else
>> +        dma_resv_fini(&bo->base._resv);
>>         kfree(nvbo);
>>   }
>> @@ -330,6 +332,10 @@ nouveau_bo_new(struct nouveau_cli *cli, u64 
>> size, int align,
>>       if (IS_ERR(nvbo))
>>           return PTR_ERR(nvbo);
>>   +    nvbo->bo.base.size = size;
>> +    dma_resv_init(&nvbo->bo.base._resv);
>> +    drm_vma_node_reset(&nvbo->bo.base.vma_node);
>> +
>>       ret = nouveau_bo_init(nvbo, size, align, domain, sg, robj);
>>       if (ret)
>>           return ret;
>>
>
> That works, thanks for the fix!
>
> Tested-by: Mikko Perttunen <mperttunen@nvidia.com>

Thanks. Can anybody give me an rb that I can push this to drm-misc-next 
before the weekend?

Regards,
Christian.

>
> Mikko

