Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C64D539FE40
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 19:54:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9740E6E819;
	Tue,  8 Jun 2021 17:54:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D6276E819
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 17:54:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XzUyOkR+gIFFi4gCrULVnN/V6QbVeTd+InFMQfNWGbT7oJvSa1ziFg1E4uK3byHOKxi0qzjCQxK+VotKqus2Ec+eXeaE9tTZNVj7sz0NriCH9j+JLCRhRYhCEgaSWyr81Zg4yijANNJDC5Ef71nXnr8qm0BSbHnFB2Ch1V9ZSu1+sxg811a36ngSb7DoJ+K29sIThIhsFEV31ApUj0HpEdF5n0Jv9efS2uf0tEvPAP7XOIcMLAGk43sdFf0ceECxMSTJXRDkaUStA3C5MDlHFDjV9WBWih99ZvVmD93mDHoLMxeoBrcTyVi6M82V5TqTt9pT1x5g5URSVx7GEXp8ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nuvSR6nOohh7aQ5DZCtYzmkUlHY8BHE5AFESUh1ukEI=;
 b=gktbeai6kVi/YEGn1K/Ya40kXbZ3oxtFIiDh67yq2IZkPja3EBTCL4Tm6RcLjIQcZaeZkitl6f0/ORtf1OjrdF8BrjKtrzHs1TPFOatj3X5G+o2Yut49joRHueCgYTYI0H//nnbnHSw0Wp9j/hNlLtLwGwHmy3S31MsNpniEONyGBhRhfNIOOMWPoGO2xIpMgnfX0svcJzfABvW/Uhp46AWxc4AVbRWu9Pr00wSuE87NXSfeeqVgvKKCYXMBl7vlzeF7ygu7xDT6LJ5zfH0fZU5uh6D8nfHy04i/psyoD/FpMMGXhJvywJC0WMkfAVhkAKvS9bLn/WBTaYNuapjB+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nuvSR6nOohh7aQ5DZCtYzmkUlHY8BHE5AFESUh1ukEI=;
 b=2oKzOFLdRaS/bBTae+gKU5FqmNu6lZ0qCKkCr7Bx25jOiSdm1je4RWD0t1x2xsD0YpPXz6LZikeJkqrLRKVsu2Gg6BwLjXM1fMZk+ZRiSlA2R+wxKE48VZWQZy8PNwIQ97F1wYoVHNPVQGDT1XOJlkusSd9qellMLRV0yJm8qDU=
Authentication-Results: vmware.com; dkim=none (message not signed)
 header.d=none;vmware.com; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5136.namprd12.prod.outlook.com (2603:10b6:5:393::23)
 by DM4PR12MB5151.namprd12.prod.outlook.com (2603:10b6:5:392::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Tue, 8 Jun
 2021 17:54:14 +0000
Received: from DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::4074:4943:244:a5fa]) by DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::4074:4943:244:a5fa%6]) with mapi id 15.20.4173.037; Tue, 8 Jun 2021
 17:54:14 +0000
Subject: Re: [PATCH 1/1] drm/vmwgfx: free bo resource before assigning new one
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20210608150917.89346-1-nirmoy.das@amd.com>
 <da5e1e94-4283-c929-6540-9522b1757648@amd.com>
From: "Das, Nirmoy" <nirmoy.das@amd.com>
Message-ID: <b604ad23-a6d6-eec1-015a-a1705b4113db@amd.com>
Date: Tue, 8 Jun 2021 19:54:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <da5e1e94-4283-c929-6540-9522b1757648@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [165.204.72.6]
X-ClientProxiedBy: AM0PR05CA0095.eurprd05.prod.outlook.com
 (2603:10a6:208:136::35) To DM4PR12MB5136.namprd12.prod.outlook.com
 (2603:10b6:5:393::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.54.68] (165.204.72.6) by
 AM0PR05CA0095.eurprd05.prod.outlook.com (2603:10a6:208:136::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend
 Transport; Tue, 8 Jun 2021 17:54:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aed95776-89bc-4b1e-925e-08d92aa66dac
X-MS-TrafficTypeDiagnostic: DM4PR12MB5151:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR12MB5151B0F6E97FD7B5EB1AFC408B379@DM4PR12MB5151.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U11R6QmACpbUmDYA6GifjFDAjW84VLp823XwnqN/am9EqVhfacMqf/ZSTgME4hr4SU4GHQqJ1y0+v64y01Pu63TNGP+zuGX3MZ6CLqUj3nJyLcVDIaQ2pn9FSWXqrmtBY3sI8Gnn8lgnduYx4nBQaI5SPwi/ZA26pYem3nQhUNgPTdinqsLMlT5v5ALxvWKrSJ560uUB7bP6SwU8oATXYMUzCPha1g6Aegj39KA9H8PxuECrickh16r8Sx3s+Bvjw/NVuKDJhkr8E5s3eUht/jwkbmOiR5WNVrpNy8HHZhUUhjkwgExmtDFLUYmpjBISMR9w+n7mR9R4U5G7poQaJBgMgTBcx/iPXepbI860GYMo0bpmPCN1wqe0vw6EIAUuf8TSyof8xZFMFCjL4NYQK+lNtFsrXe4cMf+MVQ652Ta2zRGI5kNbwu0apMnw5GzdSeiE+3bZRZAl28l3BUZGE7TDIWuqPrZ3RZEL16HslWsGfQ51I85HK09b+0cUq8QgIAJcjwuFOmdCwsSCm4pN5eZiFoXiS0lWk9ffD+VpDHn5bdJnCnFHc6jRDne1neTpPtebrkYPSBEsOy8MKU4RqsqkXXPO2pOoIkL7O3NRMD4oTAvgg2cRuFSCCVjIeGyOIXY5UgcBVC492+h20A7kPQb62nGe5AWbLPFiRKYDaMHtl/boOZ3ZXUqRlr7iAyqITnVNWtu/ix6FEPB/fVsNX68w5T+GPvCyURh2GjHScf+XFTsm9FyA4iGB9h+ToQRCg3s2DvA6yQBq3h+jOkt3XgiKwr4+ego1o1N5omxwkM6c75weUcScsRbTUQ00RDJ6tyt1hHDOPC1tjaolR4U6bg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(396003)(376002)(136003)(366004)(8936002)(8676002)(66556008)(16526019)(478600001)(2906002)(38100700002)(966005)(5660300002)(4326008)(6486002)(38350700002)(31686004)(16576012)(86362001)(36756003)(316002)(66476007)(31696002)(186003)(52116002)(66946007)(53546011)(26005)(956004)(6666004)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0EzZklyVkNldy9lNTFlRE5YRnljL1RkWXQ4RDVxMmU1am9Gem5XdE56OWVa?=
 =?utf-8?B?Z1ovRy9vWko5UVdmSDVNS3YzVC91V2d6TnVLYWNTY1phY1pzdGNHR1QwOE5p?=
 =?utf-8?B?TFU3V2dzWk5QNit3eWFKb0FJemZEbEcwemdUV1Z0blQyVlZDK0JraEFsNGlJ?=
 =?utf-8?B?YTBwbW9QLzR3WDNJZ3R1SUptWldCMy92MWdhTkFPazhXWG1qSk5QKytuaXZY?=
 =?utf-8?B?Q1U0aE9XTk40VHpVVUhmTWFXZTQwUWxraXF2dk1nMXU4LzZITzBGd0RNNFZl?=
 =?utf-8?B?SmRWM24rL29ib3RMRzl1T2VVOFluTlZSWTFnMU1iY1dBMHFvYkRiQUJyclIx?=
 =?utf-8?B?TnJTQkxyZmJEZ3lCbWQ4VldpbkhZRyttcDc3R1g0NFhZMXZaS2I2a2hYSEZW?=
 =?utf-8?B?dnFOYzc3NDFkZHpidUhYcjVzaHdZQlV1c3M2cE1NM1RLUGppcFFSMWpYVk9C?=
 =?utf-8?B?a1Z0L1hMejMrNHY0RE1kYmFXaDROUlFoQ3dWeG5rODJUaVcxbEJiMGNTZVht?=
 =?utf-8?B?S1QvMWJmVTIzVC9CaXlFSDJqRmx1RVd6TllXajRPT0wzT0xqR293RVhTRG9M?=
 =?utf-8?B?NVJnTzMzZTFtODM4RnVteTMveStsS2srRFBzQW5xSG1TdjE2bFFSZnFlWUxu?=
 =?utf-8?B?OGw3NlNFL2ZITno4c3Z4aW1FMkFxMDNvSTdHRjRMb2RPSzdvRWFhck5XVFR6?=
 =?utf-8?B?SWszRkxpOS9jbFg5OHZlMUE3T0FId0pjL3RMejQxenhJVXFycnRIM1FiUURi?=
 =?utf-8?B?ME84VThaYmJ4QWdZelBaeWRMa1N5bFpYUDBsVk5ZaUlHbnpVbWkzTjR5SGtu?=
 =?utf-8?B?SFJudHA1endCckFKdG5McURkWWJ0ZllueWZzeG51ZmxMa2NGVTlDSFRFOEFu?=
 =?utf-8?B?TUdXZVprU1hKejRlSUZKOVg2THdvdWdtc3R3djRiVk15dG9PbFBMUk0vK201?=
 =?utf-8?B?MG96Y3NzUG5kUVo1a3dOUDlyd3JNTGVqTFFtc3JUaDU0ejQ4OEJxWDV6SDJq?=
 =?utf-8?B?WWM3WVhEd3BaWVMwejBsTDdOb3NWM3JHWm1oZmNKclIyVWxrYUZDK29oUWJl?=
 =?utf-8?B?RTRDZnFDenFiR1psWnluSFBxdkpDMVdaWjc2RVZ4bDBjd0FOY2twRVkxMCs2?=
 =?utf-8?B?Qi8wZnA1cCs0K0h2eGU4SHhCMmN5M09BbW5EMThBWDlZQ20rcnRtK2IyYS9G?=
 =?utf-8?B?QXNkOVhncUJhWlV2dldTTERQRmhnTEdQdXJGQTQ5TXhVVXhxQmEwVGN0SW5q?=
 =?utf-8?B?ZnJ3eVZqYVRSWStiRW5xUlVLU2pZaDBrTzhSRG96aWc1R0RpRjRaL25uZ3lD?=
 =?utf-8?B?R1gzNmtrSUg1UzV0ZW5uQ0U4d0J5VDNXVHlMVjMvQ3dhNFNFb1lDTlQ4NTRQ?=
 =?utf-8?B?MjlNVnprUDZxSzNOZHJyV3k2SEVQSTR5bkJpaTdqcnlqajNDZUt2VW5rNkI4?=
 =?utf-8?B?cmZQc1lUTjhHdXBvNDQ4OXVZa0xVTmVMK2t5bjdjc3JTb3EzWno3eWVFbm5O?=
 =?utf-8?B?dUN0SXpVTUR1NXNwUjg3UHdpNkRTOENMVVZKL1Uwd3VCVDNWbFJDRTdFV08z?=
 =?utf-8?B?cHFkMmptYytVT0VpTkpIaGxQamhGYnZiRG1weXZSS1VDYnNicnNaU2hQTjcy?=
 =?utf-8?B?eDhKd3k4QURSMkNRQTgxMTQxSUdlTFFKbnVTYUJxNVVDVC8yRnplNzFuU1Mz?=
 =?utf-8?B?WUZRRlFPRkVOajFoMkorQ1g4NXV4UE83TmpENEJRTVpRdzhtaWtyNGJSTFVF?=
 =?utf-8?Q?J4G18sy6o7jvt3rtExouJDmMOO5Q5MxjPdVxNMX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aed95776-89bc-4b1e-925e-08d92aa66dac
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 17:54:14.5815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rGInaBlyTvMwdX5IVKQk6wwHjtWBfXapwur9eUeQK8qzkHFUJgDzgJEIfw9ObABYKWqD4C5JcZkyvZCriqiOSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5151
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
Cc: thomas_os@shipmail.org, linux-graphics-maintainer@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/8/2021 7:28 PM, Christian König wrote:
>
>
> Am 08.06.21 um 17:09 schrieb Nirmoy Das:
>> ttm_bo_assign_mem() expects bo->resource to be free.
>> Fixes: bfa3357ef9abc ("drm/ttm: allocate resource object instead of 
>> embedding it v2")
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
>> ---
>>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c 
>> b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
>> index bfcf31bf7e37..7281912436bb 100644
>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
>> @@ -733,6 +733,7 @@ static int vmw_move(struct ttm_buffer_object *bo,
>>         if (old_man->use_tt && new_man->use_tt) {
>>           if (bo->resource->mem_type == TTM_PL_SYSTEM) {
>> +            ttm_resource_free(bo, &bo->resource);
>>               ttm_bo_assign_mem(bo, new_mem);
>
> On second thought we should probably use ttm_bo_move_null() instead here.


That reminds of 
https://patchwork.kernel.org/project/dri-devel/patch/20210503190013.91732-1-nirmoy.das@amd.com/ 
:)


>
> Christian.
>
>>               return 0;
>>           }
>
