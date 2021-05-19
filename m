Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F02388BE2
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 12:44:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B6A6E2DF;
	Wed, 19 May 2021 10:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2086.outbound.protection.outlook.com [40.107.92.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF0E96E2DF
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 10:43:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qj+VZeDrnolJ6VZ2ixpv3pDvJ10VohLOFr9Nnp//Bj6jcE1ghedC8B/CRm+9fhRNhYVEfx07qrFqbJT9dSW2QRP57J6mLRTpMII8dfor93aMEisMEZvar10kMuraTxDAxuZNYMgROy9gZtdnlkD54ktlnMnpVmj+sRTlF+5sXKNedj4V9z4PnCMRrcNdxxCBM0ohm6AHbTIptenvVDRf5ETBSQI8P+JR2Ac6hVpU4tR5Rlaul5DammkmjfrWJABe+lmYynuucex4pmOe8nlTBjTE8rjJEG4cg3zos8coVJFAOEaUnZpHjuOoH8RoeSI6K69UwkezBbuRv2q4nc6S5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6k2M18O6o4zrmwBHWxM91/wEq1S3ei1mbfj3gUmghPM=;
 b=YQe7HK0Ob3sFE9J7kygq0SW6po1r1OkWVbyaF0eo5xcn+VsXwNFDW+d2NtXOoodtebxTnC2ZJmbKP4NsXhptTQHIcnVz0MnkUOJpOpaTl48S59pbJI7BUZlYl8E/U6qFt28mLDL69Ht9Ug2WfrI3ON8K2dG3X6HntWtXzyFpaxgcM0wChVZmZ1wkB918ehsBw6OCw/ASM5QyudV/FeySVYu7iI1JkqMEd6LQuloSebY3Yq6WmlsniLRgRiEaEBRbQ0MNJWIN3dWJ/UouJONDNxWeK0AdMvIRAC9F4QtCeesWaPMI77b/sQVEkaC6HaeNZvKc1vPY9QCqC/TQQv7xAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6k2M18O6o4zrmwBHWxM91/wEq1S3ei1mbfj3gUmghPM=;
 b=fCgIGHqeq5fLRz+MhE6kv5YodBnu5QcY9Vv9oBO4HLWvL+iPmY0HeJ7VNZEM7g0mZ8B0SBEFitKUb34K2gkZXXfahSVONaSTaOXe/HcjVnjwhVwTD3xELEqU0Tni4xUwOo3GoQb4U9xxAyJ8k+i0VEXppU8jr75TOzvaONKsFhI=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4551.namprd12.prod.outlook.com (2603:10b6:208:263::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Wed, 19 May
 2021 10:43:55 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4129.032; Wed, 19 May 2021
 10:43:55 +0000
Subject: Re: [PATCH] drm/ttm: Explain why ttm_bo_add_move_fence uses a shared
 slot
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210519082409.672016-1-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ac723ad9-e2e3-38e7-e178-db0246cdffa0@amd.com>
Date: Wed, 19 May 2021 12:43:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210519082409.672016-1-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:8e28:1d3:41f3:e15a]
X-ClientProxiedBy: AM0PR01CA0108.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::49) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:8e28:1d3:41f3:e15a]
 (2a02:908:1252:fb60:8e28:1d3:41f3:e15a) by
 AM0PR01CA0108.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::49) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.33 via Frontend
 Transport; Wed, 19 May 2021 10:43:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3bde3a34-f22b-4e0d-188f-08d91ab30039
X-MS-TrafficTypeDiagnostic: MN2PR12MB4551:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4551EB53FCE6D95626D33919832B9@MN2PR12MB4551.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jf7QuSFtv7bBon8Pf5OzRBkqOg+q0BjXpGC5b+odp5XbIdOGTDhpxcS7WbfAC2mfjYPgVnZNJDZy59yNsMmWKuZHA7Y2PzjjgaIG/QWOfDlgxUIf8QgOtaBrR8Y0RVu5nmCRBf+EcfVp4pcnN3/ycOklbMWTXSQI0ckU5RkKGY0aouBXQnz5sPCAw71Jp9L3QD4AHrGycTY1j1gG3ero45PV01RgQ6dGX8szco+LoYr1QwrtixbGVE26wBqqbgRU74Q4oP/vYgTckFYosgO7rNNpSnlvP79TpAStVHfgrJoClVeNDNXp/V413PaRsOPdduURmfWMWve+gs0BiATMNPO6tRulqPI8+wPzcsXaeo3xVGlH12eKWyPCoheJzwB6BvsRsAs9YJxYJQO6sGkrt3kjnva2D5k/rqrp3QZYqOsyhPePqzA49hu0WXGMgtJ9PRsrXbTrKrH1Ld4OSeeP8RMVJJiPfUJlrwak+PcN3ZtOQANBkGGrE/FG6i1DNyO7KgsHq9nGE3WLFmK2duS2owGa14W5xZI81sfZ4dbmNHk4Un/Ma68Q6gaLsUKivokLufm7GBoIU7wXgPoK9BUhQPt3E9SY5QOkdSCQMiWoj8D4Ebjs0FUW/xv/6A2qAExYY6HzIsXgs4Bxu7uN1lgEheeJOFfor4iYcGUpcB0zsvs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(376002)(396003)(346002)(54906003)(186003)(8676002)(316002)(2616005)(16526019)(8936002)(2906002)(6486002)(36756003)(66556008)(38100700002)(110136005)(66476007)(5660300002)(66574015)(4326008)(31686004)(31696002)(6666004)(86362001)(52116002)(83380400001)(478600001)(66946007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?djRWL0xCZExMaHI4Rm12WWhSVmVLTytWYzVJcHpYaFptdjJQZ3BJcmdLbUw5?=
 =?utf-8?B?bDllWlAySDNheE9Cays2aHh0eFpYbkYxVTB4WEcrMGRoRlRMaWFKak5Wdkxx?=
 =?utf-8?B?R3hnWk9TK2h1aXFvbDg3QVZUaGlJUGlmK1lGVHB3SmhQeG9keWlOaHFUTWZR?=
 =?utf-8?B?ZCtLdlFlaDYvZGpmUEU3OEpXWHdRS1l0aGxDYkUydGt5NjFKK0hjUnVXU3dq?=
 =?utf-8?B?RDZZd2tEbDNzTHJYWWNIL3dkakpoTHZrdzEvamZxbzliM1hFSWNFR0JoOC9J?=
 =?utf-8?B?aFRVRDdCank2bDdEQnQzRk5KczMyZzBzNFNnb2NCc2dmYmRyM24yVGdjUyt0?=
 =?utf-8?B?Y1JoYlpkWWlIZXRlaW9YcHdqY01FRG0xcXdiZVNVWXI0ZkR1YUxCS3BBcWpE?=
 =?utf-8?B?Z29Dc3BKZ0loRS80dmZQUjlSNXV6TG9UVExMUmR0R29rWWhub2EySTVEOC8x?=
 =?utf-8?B?Tis3VDRIUjEyaEZ2QVNxb2pTaTArVEZTMGRGNFRVV3g5SWpKa21tR0wwTmVk?=
 =?utf-8?B?cVhzR091Wlg0TW5ZbEJ5cGNGMGVNWUQzd29TUkJqRmFRSFVQa2dyblFTbjVP?=
 =?utf-8?B?TWNLVlJ3c0x2WU5MMmNkK0J3M0plWVlIckMzaVRQcE55cG5UZUt1SWlWcjVr?=
 =?utf-8?B?bENpUVJjb01ybWlmL3NRais1bFlnRjRNN0Q1bkxLeFNXNllQRmM0MU10dUsr?=
 =?utf-8?B?SDFwMXVIR0VPVXR2U1U2NVBjYTJYSFZZZlVVcTFxeENlTGFIN0JuNEtqbWFk?=
 =?utf-8?B?dmVvREtYVGxUejQ5aWR4VkJkOER5cFVYNTdSdThyemVVaWlOcEx6Z0UrU3Qv?=
 =?utf-8?B?Rm0xejJUUVozVW5pV0RJNjFLbUJJUmhKMllGSC9wUGVpNEtqQ0lUTm5NL2dw?=
 =?utf-8?B?OXpxdDhJQ1JpMUFPMXhjYVpwajNIazN5NnZpSVJ6d1Zjdi9lMitKYlJCVEZG?=
 =?utf-8?B?UEQ5RG8reUt6a2pCbThLSWxJcmpCV09EQmExcDdCVnRCa1AyTnovR3M0dUxI?=
 =?utf-8?B?cWtoc0FSVTVGWitnRlhyTHBwQ2lPTWpGaGRqTTFYbnIrMmIwVUtBcFRzVzlN?=
 =?utf-8?B?eDZFU3hEaUppbVI3V2NvTUppSXVHU2JseTV6MUhnczRDTWN5UC9lT0pVT1lp?=
 =?utf-8?B?aXJXZVlRRFJSbVptNFkrRFdLYUx0SDJkTDJlZGdxVlE1Y2ZpZXM4Q09zK2pt?=
 =?utf-8?B?aml0TUJGL2tUTDZ2cEc3K3dLZC9tblVRVW1zS05jVjI0c3hKN3B1cTJkUVdx?=
 =?utf-8?B?MXgyUnhlZjQwUkJPdmhDYkU0VExta0tOazhWVXlMRWJhQ1ZaZVl1YUJmeHZv?=
 =?utf-8?B?NlNBYmlvSURSWVVHbitURDk0aTFORnN2TlVGL3Y2eU9xMVczeWRoS05ObE5E?=
 =?utf-8?B?cUZjN3lVQnBBSTdjVnBLRUR6YnM1NjFoNlI4blBNaUN3YUNkVkFaOUxiWHJq?=
 =?utf-8?B?aEQzVXR5VmdFWGkwUDZCWG9tWThqKzZ5aXAwdlVKSW01Z3ZoMkhKcXVucVFE?=
 =?utf-8?B?eWwxV08wZURPejdEWk9ISm9XTzBWd0ora1VJcVEzMkVNK1VlQ0s2S0w0MC80?=
 =?utf-8?B?M0VtNzVFSmhnSDlBRmdKNE5veXRQRzNLSmNQc0lxbzNxcG9EZDFmYXVCZFFH?=
 =?utf-8?B?SEx2dlB1WTY1dlFkQ2x0VDI1eUc0ejhkYmg5L012a05xT1ZBUU5TbEFMY3RT?=
 =?utf-8?B?bnlocUdaN1J2R0hOUmR1RG0xNGpOa1FIMkgxT2wwbWRLdEYwK0RIcEdvejA1?=
 =?utf-8?B?NWphTXNMYTRTelFIOFk3VXBRVHQvNWNyMnZqTkx4TTFRUi9XaFlwRVFDYVFt?=
 =?utf-8?B?bE1JNHlONFBzbFRyM0RrVVB3T1g5QzFXUDNzZWFUZFB5QlVrd211RFZNbXl4?=
 =?utf-8?Q?vl4DyKIrvtTtD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bde3a34-f22b-4e0d-188f-08d91ab30039
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 10:43:55.6005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CR9hepdoz8JKQLaWG1Rb+ffCKvzR/el24LR1Qw4iiQ6m61VnEEgY75ap+9MyDYsB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4551
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Huang Rui <ray.huang@amd.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 19.05.21 um 10:24 schrieb Daniel Vetter:
> Motivated because I got confused and Christian confirmed why this
> works. I think this is non-obvious enough that it merits a slightly
> longer comment.
>
> Cc: Christian König <ckoenig.leichtzumerken@gmail.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Huang Rui <ray.huang@amd.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index ca1b098b6a56..51a94fd63bd7 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -682,7 +682,9 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
>   }
>   
>   /*
> - * Add the last move fence to the BO and reserve a new shared slot.
> + * Add the last move fence to the BO and reserve a new shared slot. We only use
> + * a shared slot to avoid unecessary sync and rely on the subsequent bo move to
> + * either stall or use an exclusive fence respectively set bo->moving.
>    */
>   static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
>   				 struct ttm_resource_manager *man,

