Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F462387848
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 14:01:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92CB36EB45;
	Tue, 18 May 2021 12:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2047.outbound.protection.outlook.com [40.107.102.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C116B6EB40;
 Tue, 18 May 2021 12:01:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dILDNSVW1sEPpkpDXAn6mCo1ZIYsu4QPDuUvHMO9gAxup0Ux9yIfsVhOdjOSqxSArwwNQBaohX30+Q9WTo2DM/jbinrGxFGcZLb+tsxG7IIhKnMUscgeDYedfUXhCSnBq8brrEmQmJ3UTTjUpD8Af0KfNATuCEFp5G/I5ZmHFvTTPLLsfJzL/GOyz8BpmQRWAuwj754DZZfAL1Agxix7BJswYhjv6BtNdsFdQhdOCBNeySsWeDO0jslvdd1y1tTUYcsVXBKqcOHLXHTwU/V5GQOIRTV207v1gPDZBZKcnkEQSBlU/FVOyE7pIpT9TLorkJhZ3MRiqD1EnGrz/QRdpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sD3qpabjPuflSvVLVl+uedxDIEZEW/FBWqb41/tdDlM=;
 b=GdOnp6jFg1h3gi3tDejFZ3QatdzkJTfeF8dqFDwrx822GHBC0ngwWEsF6KU3MAxdrcIoCWbeTSF5d1PyACe6o4TVYwFcs+2gQan5KYHcLuIRJh66GF0SMKTGj3z2zZzl9UII0JCpZl8nOfBCEqwHiE41wfIZFIviofJKZ4jwY5gvPShS0M+aHlSaYeMM18aWXw9O8kBH6xeD5zJYlyjmaxgwQRpJDC0CWii6ZVeMA4fuohwXIhg0hIVbsrzFtsJC81OynVAxu5pKLZAHyQIk1rNaMIBO+DYbxdqvLd6U15YmHFE2VnJ/OHaK8m2tytJVv9ckirB1Wh5WlDifhiRGsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sD3qpabjPuflSvVLVl+uedxDIEZEW/FBWqb41/tdDlM=;
 b=orxK73kkzeJ/dgCxjN2qonVsU3FHyCsEvJ0E5mkKw4PmkRRri88Gst2QPYfTuVbkUyV+tA/B5//Kcz76n/MwqErVmJPZsrkaQXfSt7qmPWWJnXn91ITtWCQhB4d5uG+YzifL7n32pIBc2qky7aOQ78IMbGW7U5KFiVfer+2YZas=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4390.namprd12.prod.outlook.com (2603:10b6:208:26e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 12:01:48 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4129.032; Tue, 18 May 2021
 12:01:48 +0000
Subject: Re: [PATCH v2 07/15] drm/ttm: Export ttm_bo_tt_destroy()
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
 <20210518082701.997251-8-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <2f21cb3e-34a7-4689-43f4-269037211d95@amd.com>
Date: Tue, 18 May 2021 14:01:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210518082701.997251-8-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:8470:36a5:2010:f0c4]
X-ClientProxiedBy: PR0P264CA0222.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::18) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:8470:36a5:2010:f0c4]
 (2a02:908:1252:fb60:8470:36a5:2010:f0c4) by
 PR0P264CA0222.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Tue, 18 May 2021 12:01:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 811f22f9-7fb5-4ba5-986d-08d919f4b6b7
X-MS-TrafficTypeDiagnostic: MN2PR12MB4390:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4390BC90D055AAC851AECCC4832C9@MN2PR12MB4390.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gODxmrgPxtz+rVueDm4aKiLPokMoCm+5pde3Q2sNQiHzGYwOxh36XtuZORFGWxmljQfFssDcdc1pYUI1V9ZdpuakMObvgLbo9ZtbpRVgvNli/gxmnemKKf34xCbbT4eaZ+dEdDyhAldJk1OtGOrSwq3AfWSWFYIAwnBAL6joFfMHXBM4k+bVQ51izty9K62MynG5bzovtZcEqUGXILwCYZ0lLph6JmnYmMgcpdePJNbKonMk9c5mr9vHrXuPU4SZHuSjDldLCucitihVSEOZe8ftyn7Dc2hciHFcbpJcMRnWo7D2IqbSA9HAi/RhRjJoyDqEsNxNA+QpzTUp2ZsP/zZjtWi4u5CAjoUAp2VPJerwM1qGi4If1mFfzhPCKY67cwZXRQhnwMAU/dYMIG9BEUeKAXmihYWlQ2L8M+n9YmGC+h4MJLtHMY2cY5ILCF+Wlz8FlDTFT/xJ+K4GzsTkbKpwLr1U2uIyACglKAxkH/IY/R1hc7T9KIw7zxUL8oTFDahCE4ly/5DqWlOm0HdgLnKD0TgQRSQTUKD5wFhSgIV4uY/6YBy9c0LhRTxZewic9JzUFQHd1UDaydFH8q5du22JVAmZA1MDKXUGDVRQQHo9lBi2qXKs3tIRk1D6nTXcnG1a+wc6g664exs33/4IbMAvX6awKVTmfPkUH/x8659Xh/H7b7y7p0l283rpv0lE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(39850400004)(396003)(366004)(66574015)(52116002)(5660300002)(186003)(66476007)(31686004)(38100700002)(6486002)(66946007)(2906002)(36756003)(478600001)(6666004)(86362001)(8936002)(2616005)(316002)(66556008)(31696002)(8676002)(16526019)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SkpCNFZ3UFhOSXNzMy8wUlo5RjM1emQvWUEzMTVJOTVBcEVINnYwd3I3d1dh?=
 =?utf-8?B?ZFAzWWxpeWF1enZFYmNwbmNEQ3dpZE5Ka2xVZUI5QjNvY3ZldmFSYnNCTXZm?=
 =?utf-8?B?QmxwK2U4cDhmc2xsdVVnRmM5NzhkTnljeHVtZWhqSnRrWklFUkU2UEtnVGp4?=
 =?utf-8?B?Z1RDMy82ZCtWWjFQSVlta2ZZV2g5Q2ZjSlJBTmVLaWh0RWJ6RHZmZFBwM21E?=
 =?utf-8?B?QnNwSzdtL0ZEdjRmRlBZL2NhTEJ3bGx0a0x3WWZIUXJHK1RSU2lDRnBKWUdl?=
 =?utf-8?B?b21jQXU5dU9KN0hQVWxMcGFtbEluUmdCd0c1aGM5RjNWbzZybDJYaVNvMlh1?=
 =?utf-8?B?eXRKWVo0VDBxV1ZGMUNvclFBYmZXdmV3U3psSzBRcGNwa3JjVXdXOVVhTFEw?=
 =?utf-8?B?UW5mNXpjenZNRVhOSlFWTE96d2t6WmE1RUlvK0c1cmZaL2RSdTR3dnZXMXVh?=
 =?utf-8?B?YTdXcnhRTEY5NDQvRFh1RE5jb0Z4VitYZUs5blZna2xsWE90a3FPOEwyMTMr?=
 =?utf-8?B?Y3JRY2ZvWnNxSUVJZWh6UHA1M1ZkTHZKS3lyMDZGcU41S1hKc0R0YkRaWVAy?=
 =?utf-8?B?Qmd3MGVCL1ZxOHZqdC91SEhrdHZ3ZmhUckNMOWZ2ZmNub1Z3YjhHRUc1aDUz?=
 =?utf-8?B?bi9IcHM5cUVnZ0I4R0NZcE9qdWxVUkJHc0lNcG9hWmE3TGJTWG5VWThLSTlk?=
 =?utf-8?B?NjlLaE9nSWxSWnp0NXFRR2gyMjMzOVI0aTQzQmd6ZWljQmRhUU9tY0tZaDJI?=
 =?utf-8?B?UTBHU3E3UUtDeDFtblkxMVJIbUVRY1RzWjhIaytXVXNvWSsweGRBOFIzV0Y5?=
 =?utf-8?B?bEhaSGN3bzdEWW5SVTE1TWlCUkxpcjNoK0pPV1lEVXZpQUZXNHpBaHZrQUh6?=
 =?utf-8?B?bERMUzBqZ1Z5WC9NNnYzdHIrL0tnOGJpTnZOajRkN05zQStTOW9qODl5NE9l?=
 =?utf-8?B?QTlXeEJUYTduODl6bHNTeFpmRXBPdGdNVk92ZjR2Y1BsTzlhZlNCVHJvNjBm?=
 =?utf-8?B?K1prWDBkMFlDTTJtVDNHSE5KSmdzOEZKQzNpYXNtcGZsM0ZBbkszR3E2MjhU?=
 =?utf-8?B?VWl2MWZvZVpvWU5NUVZwdG0rWEp3WmZpQ2J6R3Zta3RuaElFRFR0US84M1pC?=
 =?utf-8?B?bWM4aG9PQW9LY0ZuR0pHbGpvbnliQkFxS1hnSmNjcXA4Nk1jUTk5eThubmUr?=
 =?utf-8?B?Q2NYVUhrYmZ5NzVrY0NaR2ovNlZ2TFgydHFtZlZTWDV0ejlNeGV6Qko1SHJl?=
 =?utf-8?B?UnZRUW5TeWlrcEJ2Y0ZwaVZTcEpyTGVzM3VTTDg4SU83WFFHVHFJdVk3aHlJ?=
 =?utf-8?B?QW5ZdGpMUytDRWdGUFhMYnpodTVyUGZoNVZLamdLRlpRQmpaQ3Z3bmpsSG1N?=
 =?utf-8?B?c2JoNTRRNVBqaGhjOVBKZ2lNd3VhTVRQUllYTXVKTGpkNFc3S3NwUTdQSExV?=
 =?utf-8?B?ay9DYmJjSlpiUDFjME5yUGR3ZlZ5ZUI3NkJPa0dDYnhqdDhlNklrSGFHNUZN?=
 =?utf-8?B?TEhGTWVSbnhsL2xiVzU5YjRQbVhMS2xNeDFINHY3TWpiNnVXMWNSdXovVGdM?=
 =?utf-8?B?UTNFcnBTMXY2QXRFdjluWGZvTm5MWEYwNDkzNStzRWltbW4xK1V0WVY4eTBY?=
 =?utf-8?B?L1JkWGJzYk1NcTlKYjNSUmFoQWxoeElSaFprc3lqaGhwRS9kbU1naThGbDVs?=
 =?utf-8?B?cTZmanEwTkVjdFpUQlBxTHJsejRPd3VKRS9KVzhXczBYMDBmeGk1Y1liWVBy?=
 =?utf-8?B?QUV0ZkZyMjVwRXdIL0p6WnNVZk5pSG1US3N2TFBlTlgydVA5Rm9kaTVFMmpF?=
 =?utf-8?B?d1JyMUd1b0hmR3R6bFlVNUNEemZZcW5vQzlEb0VubENYZ3JVbDNPRmpWY1di?=
 =?utf-8?Q?pLzgBHhQ8IQpz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 811f22f9-7fb5-4ba5-986d-08d919f4b6b7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 12:01:47.8985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bGsxJo8Zd7rKowQcTUybphBN8B7wOgIgPv4vF26+wN+WXS/LLXgBhJAaNc1GxFMf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4390
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

Am 18.05.21 um 10:26 schrieb Thomas Hellström:
> For the upcoming kmapping i915 memcpy_move, export ttm_bo_tt_destroy().
> A future change might be to move the new memcpy_move into ttm, replacing
> the old ioremapping one.

Well this is an upfront NAK for that approach.

I've worked quite hard to not export those functions any more since this 
is not something drivers should be allowed to mess with.

If you need this we should probably move the functionality into TTM instead.

Regards,
Christian.

>
> Cc: Christian König <christian.koenig@amd.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index ca1b098b6a56..4479c55aaa1d 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1221,3 +1221,4 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
>   	ttm_tt_destroy(bo->bdev, bo->ttm);
>   	bo->ttm = NULL;
>   }
> +EXPORT_SYMBOL(ttm_bo_tt_destroy);

