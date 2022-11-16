Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E9D62B64B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 10:20:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F7D210E44A;
	Wed, 16 Nov 2022 09:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2041.outbound.protection.outlook.com [40.107.244.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6ED710E44A;
 Wed, 16 Nov 2022 09:20:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CbnkXRjgG6p9ioCf3uWzFAA+ppZDgZN2U9eWn9jVTFCa/+BF9zgVwveEQGlCniJDdnz5lm8ta+bo2I84hm8C2p+4GWI9T0N5QAJpxmKdml4d2m8FZ5C8n2xu58m/vIYPK2TuNSyICSJi02Z0Xw0z8nK1hcLEUQuyrW80hbT7jTc1e1NB/kOAH35JYlLKoMcBBlHGxO7PncuuyQK1LC9sT/fFLX2QCS5DDqSIZDltLTp4OK66/lGGdY2SCwzy8nTVDMMZbiXMQ3XSCYuv6W76JuTz5I0QpgsAEShNharVaWpf2VH4pJro8vGyPqmR34e3O5XnXiA7FY8ag9BqNza28g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rvS47Dk/EZ9Xtgexi+qmjUydjeAzHAc3P//gh5+Kyws=;
 b=WUxZehujsEdJzxNkIRX7jTaOf4AWY8762eBXJaVFvZQSqetd0Fh8qupenwMwF14GkVfUaYHPYztgdP7GRZz3rFmIR/SAzZ4FTv+VwIT/NCAfHBo7NoC0W+9pcBZIpV9NZ7aAgWC6CScWOuny39Grrz+qq/ywDlSPmJHqs7QYX/prcPo/tPl90X034XF+UhkBIdw7kxsZeyfPgYpF9UCfImyZ++dtvw7KGOKfbE3BvfXvVonOttV+Yc8vV1B67UZTHR4stbWf7Pub8SU8nYJoGFE6PX9r7KVu6pAR7LlDbfLvPR9PVZzj5Te4M+e0XMlaVzJovM9yCBfPS4Ihe2273Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rvS47Dk/EZ9Xtgexi+qmjUydjeAzHAc3P//gh5+Kyws=;
 b=Rz+vvSRXyi9Y/KqIIhpxo7GvPQA7nOBXT0s8hXt8mgVXLLj9yPt4Da/dzuVCXcLoAct3+6YyqsbRq1Q/9v5oX1h/GKcorgDUQql7XBCz4Z934fLz0WU7qxqTGhffnpOD/PuccubfLf1AkTaMOEgC+SYx9JixMyQDKLMXLaNJujQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by SA0PR12MB4591.namprd12.prod.outlook.com (2603:10b6:806:9d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Wed, 16 Nov
 2022 09:20:15 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6755:9455:2407:ea3e]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6755:9455:2407:ea3e%9]) with mapi id 15.20.5813.017; Wed, 16 Nov 2022
 09:20:15 +0000
Message-ID: <fa9ecb1f-17a9-c7ce-d25a-42c3860f1b8d@amd.com>
Date: Wed, 16 Nov 2022 14:50:04 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/2] drm/gem: Remove BUG_ON in drm_gem_private_object_init
Content-Language: en-US
To: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20221116085012.187756-1-Amaranath.Somalapuram@amd.com>
 <20221116085012.187756-2-Amaranath.Somalapuram@amd.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <20221116085012.187756-2-Amaranath.Somalapuram@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0217.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::15) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|SA0PR12MB4591:EE_
X-MS-Office365-Filtering-Correlation-Id: 59364dff-8cbc-48de-8803-08dac7b3c472
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pgDXAP1d67XTrG3vTy8kIP0a1WrVG5N0Vqz1MUTwLcfBAc1uxeDI5CLxvsAzJczlFtXvyjxtt4G8F9BIoeJ4rFVkv8t7/NnLsvjnzG6bEuFCt7d5NI9JvEOeyBkDfP+P5+hWUifNjdCN/FfG/gT8S7YHeEvrWnP19+rQl47cfFkCUjt/+uJ2EDSikcDUNqwjxQYfvWB5hm/OugUmr2Q2WlgptDt9QHgdlZq+PcUgyWA5jAeRlV5kikWvYpWoOjza7hX4AlMzk3qCuilVQKZoSOsPerNtaB0jDQYOORZIRcX9Dz11vmMxAPWPapt6w6zKvq79QhLSGgWEwO0O1gDlXDrQmEEPnVcJOtC7IeZVX7dPmFI5xq6hF/OAJE4X75CU/6YnkRrEUuq6M6TWr5u+wdNT4hId3v+qnE+g3FElWHLOd3nA2f9chQ7tdeA4FArpCP/G4LhiY922/eqO3ZWmmaVotfIbmiZYYitqVWBqTq7DLz60418ofZgEEKoqzpWDgguQnyWlGm6tQQ4u+wdkGusnaSuPKVro61s4nBpLXqNeqptgbvvsYMwFeZB5ZU2aFDP5twGYnBotXJkPcx9buOQT9Q/NdbfpIUOAv4Kd+i7QnA+AUo/VQNfyv1O/b7+e6jnyM0R/enRFJXD5R8+do/Zi2xF5fcOKe17J8+Sje4HqQPw09ntSWFXwAgsJeCFq/uvwE/iWqj/003E7RYCaOefDQI0WShLGpz/IbmIealeuegbjSBYsEeisp6BRp3Z74JrAq15AQXkPhy6ip+JbWHZ6hF9QQBx0LdQG+vIBCFk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(396003)(366004)(39860400002)(451199015)(38100700002)(26005)(6512007)(2616005)(186003)(53546011)(6506007)(4744005)(5660300002)(2906002)(83380400001)(66476007)(6666004)(41300700001)(478600001)(316002)(4326008)(8936002)(8676002)(6486002)(66946007)(450100002)(66556008)(86362001)(31696002)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWxXblB3MUhBM0hxUTNTVndBbWhRVncvYWYxR055ZFNWYWQ4bmRoYmtWTDBs?=
 =?utf-8?B?VnpkSlROTVpFZVVTV1F6NExpcW1lcUdFUGIrblJIbEh6cHVMdTdjc0oyK2dr?=
 =?utf-8?B?djVvN1BUOW1aRWhzOHY5dEFOSThNMjBSdmltOGZNUDRSZGJYWlNXSTRrR2Jh?=
 =?utf-8?B?VjlJQTA1a2VQVTVqa0ZLaWtGN2lld0VoV2YvWk5hbGRKWHE4OWZuOTlnOVVq?=
 =?utf-8?B?QUt0dk43c1pwTVRNOUFuNEpIVUJBMWFPdkRYT3BHRVZFak9mQVZpbkRjcVp1?=
 =?utf-8?B?OFh4YytGSFRZK1NSc3F6R3VtYlJyanpVcUlNODB1T0J2TGtxK3d5aWtzMmRD?=
 =?utf-8?B?RjQzWll5VDh4QldWSjRRZHJTMFpidEVzUGtRRFlqUTJMay9wMHJvZXNiclJt?=
 =?utf-8?B?N3Z6MFpNWXNzQ1ZGWDZHdjVoenJuYUYvWlMrNGRjNnVvSENLdlQ2ckxPUzNH?=
 =?utf-8?B?VVI4aUZUMXc4TFpkQVhwd1RHWWp1U2lSYzk5eFZwVmF1YVZ2YmZXeEsza0po?=
 =?utf-8?B?L0laZFRPOHNIbWJ5VW9MeC9oZmtFUFUrOFQraVNLNzhhSmJYQ0IxdmVRb0pj?=
 =?utf-8?B?ODdCeVFTUzliQlB4SDFFTFo0NER0Y002RG9CQkZ2Yk5TR0xsVTlGdzhDNTRz?=
 =?utf-8?B?L3VPOGs5L1k4dFI1MmhNSDVVRjhrZGlDaFZpYm5rUE1zbTNxUE9GbFZQMDhj?=
 =?utf-8?B?ZmhVcGhOTUhLa3F0MVNxQVNXcXdXbnF0QXlTVFFrT1lOcHJvQkVTaDdrYjVX?=
 =?utf-8?B?MzhkWm9JbUdIN0pGNi9taEloRW9hUjFBa1ZJdnpoRG1yeUZZek9sN0ZkTGlY?=
 =?utf-8?B?dzMxelc4cjB2Q2RRNnByNjR4QW1paVY5c0h5eW00bXpoUmh4eFJTQ3gwaU1K?=
 =?utf-8?B?WjFsRUROWkNFOWZFUnBZOXJhcXlYVGl1Ukl4a0FOUVp1UXJJSE9DdDNHak15?=
 =?utf-8?B?ODNlNE1Edit5ZFhiZmg0bDB0aGZ5M0Z0TzR5Z1l0NHZYNWkxcVZEakdXQXFw?=
 =?utf-8?B?aWFEcUkrRlNlQ0k0N1NmWVQ1ZUpPMnpNNjhGQnRZUHhDNmcvZVl3SCtSMmJh?=
 =?utf-8?B?bE54K0VaR2gvaUZOakJYdHg5M0JkTTBMMklvNXdaMm1QeTU1ZUxoclZNMlRE?=
 =?utf-8?B?QnVWVzh1eTQrZ2N2dXlMN1Axbkl5OWdHNVlTdnNaSVgvMXBIRXBLYkxrWWlt?=
 =?utf-8?B?aWpXUmNIRFZEQlVCZUdsTUs4TXFoTXRML0liTXlUaU1uRUhlSjFBNmVoVi9C?=
 =?utf-8?B?WU0zbkNZUlFmanZtRkRFYzNPbXJ3cE5WRVhCMEI1a0lCY0JIaC9IYjgvZ040?=
 =?utf-8?B?ZlJSZnJHU0pjQ0JiSUtqcC9XSzBQZlZRQXhhbm9jWnJRTDFtL2FQRUc5bDVG?=
 =?utf-8?B?NGNGVHROZ3d0TXVxQnRlU044R0ltZGhUSjYrTlVZZmZFSVZFOEZsVWJ0cE1X?=
 =?utf-8?B?Vk5VUmJFelJVbDNqWjB1RCt3cUF4TW5HblBYZ2daV2FBVFVZT0RVY0JLOVh1?=
 =?utf-8?B?b0hzUFRqNmFBMmlEc29MLzRZUEFNdkJpb3ZBTzZGRnpLQ25SYWNwajltcXBh?=
 =?utf-8?B?U0ZZVm0rMUQ1Mnd5emFibUZFYVNrWUVBcndBV3VRblZvZDJVMzNkUG4zVlA1?=
 =?utf-8?B?OXRxYlVPSVZrYjE5MnBXaGdoTzBFMkFMTlRyZWVJQXlQWExwZVg4V280NG5j?=
 =?utf-8?B?cUdLYkNEMGNnMXZHRkhVV2NSclM1Ympoa3B4U2U3OVAveVJ3TGlHdWlXaHl4?=
 =?utf-8?B?ZVp4RXBmeG1PVzRmN2MwYmdNdG9OWEJvMWdNWW1XYUJtUVQwTjM2ZGU4SWxY?=
 =?utf-8?B?Wk5UTzFNOGNwY3ZsWFhzcEpPdkpYZ0hsVnRNc3hsNUc5U09hUFY5ZkpVSjVW?=
 =?utf-8?B?enJ4SUY3NmNacmtuTVNmNWVBY25sdnRlKzFreElGS2dna0VvcXp2MCtuVDlS?=
 =?utf-8?B?eTV4Rm9lMlkyVWdKUHRaOUlVU3pYMmlwcGpNdG4yaUJhSjNUWlk5bVJnd3pK?=
 =?utf-8?B?dzVMRVRISEoyeHZIYW5BNXVxZkViWVcrU3BGQ2I2bXJuTVRzdEdMaHFtelh5?=
 =?utf-8?B?Qk1xMlduay9ISEVYN1lvcmpYZ0drMzR4cERyd0FUai9FaVpBQmRwSmhBYTFa?=
 =?utf-8?Q?mumAO67N0npcfcBHalUs131gO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59364dff-8cbc-48de-8803-08dac7b3c472
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 09:20:15.0885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n8LvZ2UsQicauMCOFfl6nJMqAPzxqM9iLzKjcMw3890DHLV/HnwCE0+NBVjnu1ve28zG0NOYSEWwirBTJyzfuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4591
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
Cc: alexander.deucher@amd.com, christian.koenig@amd.com,
 shashank.sharma@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Amar,

On 11/16/2022 2:20 PM, Somalapuram Amaranath wrote:
> ttm_resource allocate size in bytes i.e less than page size.
>
> Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> ---
>   drivers/gpu/drm/drm_gem.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index b8db675e7fb5..a346e3b7f9a8 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -152,7 +152,7 @@ EXPORT_SYMBOL(drm_gem_object_init);
>   void drm_gem_private_object_init(struct drm_device *dev,
>   				 struct drm_gem_object *obj, size_t size)
>   {
> -	BUG_ON((size & (PAGE_SIZE - 1)) != 0);
> +	//BUG_ON((size & (PAGE_SIZE - 1)) != 0);
This line is added by mistake?

Regards,
Arun
>   
>   	obj->dev = dev;
>   	obj->filp = NULL;

