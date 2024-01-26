Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E08B783DB0C
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 14:38:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 445E510FA88;
	Fri, 26 Jan 2024 13:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2088.outbound.protection.outlook.com [40.107.244.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B99F10FA80
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 13:38:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A3zYjlZZHWsBx/vN2uNYlU5enUTVJkeBi6j6R6pAxKEVpXkOLLQCroYwwM8fZKJQEYr2y3QBAraYRn5q/XsIjbGy6s3ZxberRYdNcm/Why8jeXb2VuXMWXZ3zCR/IAsbE4GJnnSW1Iun2ayXWSuAaTTl8oW0FxpQHfkOLqXnTuVYo2CliSAIbGBSFLb9yvdBEPC4tELZwTLCLg3uIFCA4NEFIlu77mLImXH7EB7BKhjmITzgv+uUAWIGsO7y8VX2EpMqabWYeZfzpzVTqVyYO7F8ICouDuUoCJYu+pzcUiGZvwKYUO0gdi1H/085ZUDh1CC/eOr18s3Qrw1xrhJ3cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+GUTtaKucFCq6vqq9rA+mKlwenh9lc75e2oNsZLSY4=;
 b=TH5Q00EYDiLg6P3TZEn0YklhiX7+h8YoZUqYZIj9Z1IRXuiqYf0n47xh6OCKFt7l5GN2VvJ8JpVoRRU8TT3JBSG57pbWjAufxggMGgTpDlwFaBrbKpzKQgotmxAz6bhwmAO7Pvsg+a5G1Eab0GWd18cmiSyuEMVc7wqiiFfQ9V2lma1rL3o86CehJ5hAaI9Uj4yvnRbFtAyz1HPxSFbMsOOf/m2DzhxwnjXZATGzNsNtKP7YGHboUHRKO7IbweE9Bbf9uALUb9vk/38V30vP3ZoVjk6OWAglP2S/tuC4AYp87fU2QGJ10SDFRm3J+9Dak37DWaRbGZ9WOYbt3mfWAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h+GUTtaKucFCq6vqq9rA+mKlwenh9lc75e2oNsZLSY4=;
 b=r0Waz5PvdANJYyDzy5TDig3v+irOABT7ScZmJzIrXNIChTMTNwuifE8vUl2NxnMPmT5vBJuwRVCZRo7xZzG33mLtbCCMt0JWLhaTQiGD+5hs8XpogC4BYKtZANpZbD2losUZek+ZisupLKyaXJykUXYoaXm+b3UGZItB6xQTVWQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB8162.namprd12.prod.outlook.com (2603:10b6:806:33a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.27; Fri, 26 Jan
 2024 13:38:22 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7228.026; Fri, 26 Jan 2024
 13:38:22 +0000
Message-ID: <f5fe17fc-2d5a-4f78-9315-9fd05f58142e@amd.com>
Date: Fri, 26 Jan 2024 14:38:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/ttm: Make sure the mapped tt pages are decrypted
 when needed
Content-Language: en-US
To: Zack Rusin <zack.rusin@broadcom.com>, dri-devel@lists.freedesktop.org
References: <2b5648aa-f83d-d8f7-b0fd-39c859f32f33@linux.intel.com>
 <20240105135105.1921947-1-zack.rusin@broadcom.com>
 <CABQX2QMg4L3oQe4pU4saBgopXw7CKyGrQa_LKE0xtSwyEKacnw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CABQX2QMg4L3oQe4pU4saBgopXw7CKyGrQa_LKE0xtSwyEKacnw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB8162:EE_
X-MS-Office365-Filtering-Correlation-Id: eb365a75-4acd-421b-87fa-08dc1e74108d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6CLbZwRuCd6hEYb7Dx6EoykDm8jRnbjrjJ//JlNQWLDmFlh1EyxYWLYhgD2Htioxe2iBFk5B87TYsRlP1rj69ro0B45vcPBymjMLB+pUJu0NXun6AgndktlSPJBsgkvNlB6SgaKOnfutC+SXNozz4qkofgaY5L8M8O7mnWO0JgSKSqJCZ19ByMFt5KvFKGJ0cWf/cCE2lyMWU0fvGk5dm/XdWIDZRYEGF1iznhXN6exBft99QPmgcqj2kSlJJuZwpj+0B5+LOTxOrRW0+ATe+vCKFULtStthxY3HIhD+NrS53Ic08A40dYLvbNC4Z5DO0z96fyi/uH8ie77vml/oRstlNWGELgwbANCJzBxOu9dwwr5gT9IqbSJjqW20zKxTBswI0VzpuMgUKJivZtVGVXP+R0hS/9fIYUsRyAT/glxdVrQgYWTumido7XoqM+xqzHY5cXhwqOriO+I/G2LIM8lpq4/y+Nc+/WUETZaI4NMg/1a4yjWUtqG7Xz5wA7snzqgO1WJ+RN1twsS5Xd77KdatNvJCWGxnrkgMAVJspkhczn9OIH6Z+D9o82oJG/JUY1lJtKzUTgrtb0EnIOO6zT+ton3qG8ruzhlmAlZrSbUteBgBglSl/rOnD71ZvxoX28zBz7ywke7xkzAKK3RCNA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(346002)(39860400002)(376002)(396003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(36756003)(38100700002)(31686004)(83380400001)(6506007)(2616005)(26005)(53546011)(6666004)(41300700001)(6512007)(2906002)(478600001)(5660300002)(31696002)(316002)(66556008)(66476007)(54906003)(66946007)(66899024)(86362001)(6486002)(8936002)(8676002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTN0R01yd2w5VzZ4SXFMekNrU0JRcUt5V25LV3VjOFRlaUpBckNPK1JYWHdU?=
 =?utf-8?B?N2pOQWtIZlpKWFVlTWMzY0pGMjZGZG9kcktGRlJhazBYL0xmVjgrTUNubGhT?=
 =?utf-8?B?V0xIQSthUFNacFY2NkdFYklTVHVMMmc1VVRXNUpiZ2QrOVg2T005MzRKeEVI?=
 =?utf-8?B?bUpGcDIwaVcvaXhySVpSQ1dEbkRKWTI5OThXaERVVkFsaEY0bTRGajgxVHZT?=
 =?utf-8?B?bTk2VVFOQ2lYaDh4RTZ1cjJvZVNvam1zWDBheGlMbUE5d3phVTlHbzdmd3RW?=
 =?utf-8?B?dWlpZ01xYlBtR3I3bWsxZ1l0M2hlT1UwcS9KalFqOWE4Uk5MNUZmZno2VDQy?=
 =?utf-8?B?Ykp0YWtoVit5TjdwVE1KcXhxNjZXNVlLUm1HbTYzcHBmblJRYVVYRXVoNmNQ?=
 =?utf-8?B?a0JvUm95VDBENVcyVW04RmRaMzhZams0RzI0akthVms5dU02N0lVWXMxU1Jm?=
 =?utf-8?B?WEdpQkZRTHJMMDdmL0JmZUpyd21yamYwR1NFUWJFY0xkNnk1SU1LdFRlWHpG?=
 =?utf-8?B?eFl3cGRRRlpMVU9IRER2WnJGTWZkM0ZGZjJpUWlJcWh3SkxYTTZXUlNiZjdN?=
 =?utf-8?B?dkcwazRJNXVyNVJUaGZTSVhRRUFNVjJRM2FkdW4yYzczOElCcEx0UCt0eHlF?=
 =?utf-8?B?MkFEVWVFQy9yZzRmRFFiTVdBQ3JPVnNVSEZScklOZEtGc3pVUk4zbXZyb3dm?=
 =?utf-8?B?Vis1VlpBVDZ3RlJTWXQyajdZVWVMUURncG1VbXdMc1VyaXBCc0VwOUh3YmVV?=
 =?utf-8?B?MG5TaVZ5K1FCOXpteU5RektoSklueE40OXdtdTNLTGF6VHRvMTdTUTNDTWRK?=
 =?utf-8?B?VVQ5U2NNazJnS2QrWlVjYXhHRUh2R2NMODM0N0FMOFRGUFAyZDZPZ0tVRjMx?=
 =?utf-8?B?Y1JxNDZPTjNTaXpLODZaMEVyUnpoemlnamFSVVJna0V5WHoxY2RoUC9oSGh4?=
 =?utf-8?B?VUhYN3ZnbktxaTNvdy9zdy8xaWkzaUJaVzI2eGZDZk1zMGNNb2w5cCs4NXkx?=
 =?utf-8?B?L2JXY20yMjFDUVhNQVJqVUVDWHZYektNdHZZenI1ZElPTkYrU1Z0TlY0S1VX?=
 =?utf-8?B?aWE0QlFVbW1GUkZ0SWhrY3R2Sk1XYWhubnM2Rkc0b2U4TVhnN2xrUFUvbjA1?=
 =?utf-8?B?Y3c5OUl4YW1HZ2xOclVjSGprcVlIL2p1aWJKRDFTTUhBTHg4SWpLcWx0YUM3?=
 =?utf-8?B?WW1nTk9qQnRnL05DVmQ2am1OYktHdDZSYlJQYjl4MjFkeE40TjcrNHZabjFV?=
 =?utf-8?B?WUtxNGJWcERnZ1FwVmQ3R25QbHZIZXBlZWl6WkRZR1V2SEdqaVB2cUttRDFF?=
 =?utf-8?B?MS9aMFp5R2liWEo2OHc1Ylkvc3duMWs0WG1rUG9Ld0dZM0MyaXl6bGwzWlQr?=
 =?utf-8?B?Z0J0QllMN2VnVFZudDBTanh2YTNUMDBpakNHSGxaZjRCamZEVW9mcUk0ekJU?=
 =?utf-8?B?TkVkZUUyNmxlSm5JRUtvTkRvT0lYMHdwN2Rsak8yVDZkcHdUZDNpQlJneWND?=
 =?utf-8?B?cUZLUkhhcXRlSHJsZHU3M0lodll5b1BrZmdiQjNWVGxiYndHV0kzVGQ4bVNi?=
 =?utf-8?B?Um1pQTVlRHlCN0xwN0w3MkhJUThoU25VOVR3ektneTFtR1RHVit5dmU3NXdF?=
 =?utf-8?B?ZmQxdXd3Z0FwUXhTY1pkZnVLQWVOQzUrVjRRZ3MrVm04TmpzV040ekwwVzlD?=
 =?utf-8?B?cWZielRtZ0hUbWQ3UUhBcmo1Lys5bDhUWllxQURwRng4cXJVTm5qSW41dGh3?=
 =?utf-8?B?OCtZVjFZY2tOcEFCYnVXUng5WG9ka3F4eGNHaFVFVTFwK04zSFNqdzViSlJZ?=
 =?utf-8?B?T1F6UEJXWXlHKzBRc1FuSDZ4dXhIdFN5dDRORWd0RnlNclA5OStnYVpCN1g3?=
 =?utf-8?B?bHlxZmJreXZiNHNKZndqS0tuMkJhcDg4YWsrdzNHWjBFUXFwSlBnMlZ3SnM1?=
 =?utf-8?B?VVc1b2t3dXZ4WGZhdGxiYnIyUStaUkk4ZTRiaXptRW84eHFoazFGZC9UdWV1?=
 =?utf-8?B?QU1ud0k0M29XSVYyeUNYcTNMdTE0NThUdlg4ZTAxblJLUjNGcmJNd2Z4dmV1?=
 =?utf-8?B?TGlvRzNwSzRFbU9vWHljeXFWcFBPZTFHaTZ1R1VTa3czZmFucFZFN1Q4dkp1?=
 =?utf-8?Q?1mjIxuCPg/nrra6eNjV+Bds6o?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb365a75-4acd-421b-87fa-08dc1e74108d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 13:38:22.3924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: //A68E9ohceVO8wyDRFzmzTI9zhCXdJfWMEPaAn4w5AjLDhUJAD51/LDfiKHIHSJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8162
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Huang Rui <ray.huang@amd.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 26.01.24 um 06:10 schrieb Zack Rusin:
> On Fri, Jan 5, 2024 at 8:51 AM Zack Rusin <zack.rusin@broadcom.com> wrote:
>> Some drivers require the mapped tt pages to be decrypted. In an ideal
>> world this would have been handled by the dma layer, but the TTM page
>> fault handling would have to be rewritten to able to do that.
>>
>> A side-effect of the TTM page fault handling is using a dma allocation
>> per order (via ttm_pool_alloc_page) which makes it impossible to just
>> trivially use dma_mmap_attrs. As a result ttm has to be very careful
>> about trying to make its pgprot for the mapped tt pages match what
>> the dma layer thinks it is. At the ttm layer it's possible to
>> deduce the requirement to have tt pages decrypted by checking
>> whether coherent dma allocations have been requested and the system
>> is running with confidential computing technologies.
>>
>> This approach isn't ideal but keeping TTM matching DMAs expectations
>> for the page properties is in general fragile, unfortunately proper
>> fix would require a rewrite of TTM's page fault handling.
>>
>> Fixes vmwgfx with SEV enabled.
>>
>> v2: Explicitly include cc_platform.h
>> v3: Use CC_ATTR_GUEST_MEM_ENCRYPT instead of CC_ATTR_MEM_ENCRYPT to
>> limit the scope to guests and log when memory decryption is enabled.
> Hi, Christian.
>
> Gentle ping on that one. This is probably the cleanest we can get this
> code. Can we land this or is there anything else you'd like to see?

Sorry for the delay.

I'm not too familiar with the technical background, so I can't 100% 
judge if this is correct or not.

But if it works for you I think we should give it a try, feel free to 
add my Acked-by and push upstream through whatever branch you like.

Regards,
Christian.

>
> z

