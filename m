Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D56783711
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 02:33:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA1BF10E2D2;
	Tue, 22 Aug 2023 00:33:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A198610E2BA;
 Tue, 22 Aug 2023 00:33:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NDFvYS2IYI3truSqau8spx6+SLZ3CWWPaw0AizL9HFrbCB08Mp+rgyS5PGP8ALyDC5EyvLNGevJyG92CClYSRukOdi6npEMlivzOSpSbiOpC8yBi68i5WNKghVMpbVRds5vNBXsjKmKs6QP3ASgppbOId5uZGpyAsEtBtjkXwxuBqp5vOA0RyAlTLfatazNz7ykui4pkv0yiXJJf3nRS+6yu3BMAunzP0k8zfwuhsr5f7C3d0BvA1s8msrkWrDYBH8fcPgsRs53kq1yWv086ZGteS+GpoDAYEZnpyQn60cia1UDPNkMxfOLMFh2LkLw9n4785Iu5Otz5RqmqeTQK0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHH/6BAaEUWdneh+NwQu95coB/MGMdgvlzUwEWZgCsc=;
 b=AXt+wF9kEu0CGRXgpeC3Bj7/g4GEH2xwa7J5fBZxI3cauY5iTD/PiDfSxV991OnDVCNO03HWhr7+KcdzP2JZ5VSSNsZQv3c+B64MWkSH/76J+TeAH8a/VAndUapyb6/DJOkJUXnNfcvllSyieVD6EDuL6nfc8AgulaMOXPOc7Why5oO/FMjIRplcpiuSRmA0ZbzyqkZAtlvQRJ8sgZ92HF2WnoHe2DtfRD4pOZ0fz2e6ufN72ZplvdICaJE7CxroGYUN71l/AamxFB5oF7/TCJ5FTIgz8/zaGf6PWnMLxBU3gJzS4Pt5hbjHUtXrwWVA0WV++3SAf96h0QFfMtKZAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHH/6BAaEUWdneh+NwQu95coB/MGMdgvlzUwEWZgCsc=;
 b=ByYqdN5QTLv8ANIYltLYWSU0UXVwMNPyI8MXjlh0+420IgvXOYfBiwwkyiEOwAaKOXm8WNiJ2kk44bKHgE/iEZOBgOQ8nHLadDQ0rTmNnJvcWcxgVKk5PbcPpOE3Bcj/ewMCOMaA7A6m5h/px0j5HGKaItI9Z2m9MwH9TEyuqwo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by DM8PR12MB5463.namprd12.prod.outlook.com (2603:10b6:8:27::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 00:33:09 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::d44d:cf5:efcc:6681]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::d44d:cf5:efcc:6681%5]) with mapi id 15.20.6699.020; Tue, 22 Aug 2023
 00:33:08 +0000
Message-ID: <46208b55-1d8b-3280-f5e1-98138a809b6f@amd.com>
Date: Mon, 21 Aug 2023 20:33:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/4] drm/amdgpu: Explicitly add a flexible array at the
 end of 'struct amdgpu_bo_list' and simplify amdgpu_bo_list_create()
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Arunpravin.PaneerSelvam@amd.com, "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "Sharma, Shashank" <Shashank.Sharma@amd.com>
References: <cover.1692524665.git.christophe.jaillet@wanadoo.fr>
 <5d52550a-92a1-55e7-69ad-92f18330ff48@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <5d52550a-92a1-55e7-69ad-92f18330ff48@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0041.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::13) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|DM8PR12MB5463:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f74a816-0ca8-402b-2af3-08dba2a75bbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wP3qhL6uQQTgttkO1eE6LtUuJ2lrLmdjyrx8bjbQCIoPWG8cZFOYs93J797nULtN4DrWAyJ9xwEslugVRAwliAIP9revxEJB2e1nfcZXQ/5RIXaMu80NwjnlC5hZGi1X+gvKpDvOM3YZOxc5NcZqIu+k/JbFomf44kquvmMdVAVbh+9lBiNxxdfBdPp20KuN2Q05jjqffYdYQFSIrnyB3fb5/f1JcVKMDh3dpufrQ2z4qGUupUmUqbFp202ixmmzPAS2d2+PSosC4o+ubPggGa/TVwq8APSFJco69uCkzRLZAtVSOG/kAX0GLmRJFIvz0YyPTFhWzmIzAmQEa9WxjCeaWUjegvj36BzrqeWY4VWxHRskanFHgDSMvYvvSOHIV5FoHkbeGLAHGJ36MKITb+UFi2GNyCbyEYc8/DeOHS+gVEeWZcISUNhuxZaj0LaY2CH0YGLTP4pvbwQN06pmzNpT5K/Tm43SdSHgV45ZKYPsKzbi+tYr9kxHclxbMOMPaCxMEZTOGtvm3+utdFgMFgebc/zAku1Sn+9a2KEGaZRK7oINZ1mza/d+CimELmr49XyO0Lt9hGSPzFvcT1WUJ1Dn2SghbojOcUx5YcAhAD4UHc1oW8Lhe9lD7KH22BHA7U676c3LgKW6JdTpPvGVJA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(346002)(39860400002)(366004)(186009)(1800799009)(451199024)(6636002)(66476007)(66556008)(316002)(6512007)(66946007)(110136005)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(478600001)(6666004)(38100700002)(53546011)(6506007)(6486002)(83380400001)(2906002)(31686004)(31696002)(5660300002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkhLdHR4bk82R0F5SjIxclFDM3dVK0pXRzdwenljT05qTDZCMWF2REo0aUpK?=
 =?utf-8?B?dzNUSGV0VUFsRzQvZUlRUDh3NE11dmNlMjZvbmlma093aDBqOVUvRFU3ZVlh?=
 =?utf-8?B?bkZrZUsvMVZoazVKSEo1WDIwZjg2ZDZDQWl0TlFKODJadU1NZnlYVTYvVWs2?=
 =?utf-8?B?L2FvNnV2T25ISHBaQXdsUFFMbDB4Q2dXd3hYalBvQnpOU2lWWGlIVzJjaVhv?=
 =?utf-8?B?ZWl3K1lNMzVidlFNSTQ3WDZPTHZLUlU4RlhvZ2pCSU9hTGNCSWsrSEJEemZ6?=
 =?utf-8?B?aVlJeS91VG9Ta1pNVkxkUXpNNExkY0FTOUNtcS9aTzVuV2MrQnJ0dElmb1dz?=
 =?utf-8?B?Y3o5cXgzMFFjTkhINEhxa0J0Qjk3N2NkWmQ3Q2poN0dHcXpMdnh0Q1NuQ1hP?=
 =?utf-8?B?bUdhYUlEZE1XSkNsNGV1SEJhd0FueHd6Rk42aUQxaFJZeWYzNXZLMlpxMFBn?=
 =?utf-8?B?dG4vcFhNbm41WjZCbmsyNkhmOUJxdHNIQU8vcFliMXU4eHJxTENJZ3ZHL1hD?=
 =?utf-8?B?QWsxeHdJaXhsQ2NUZ2FqY25ucGI1TTFUVTRFcG5zTURLWjI4cXk3WitZWCtZ?=
 =?utf-8?B?dzRneUN2M3JWTjlVNzhta3hTbGkzZmJKV2dBK3BKRCtENlBUMGFjelhHelVm?=
 =?utf-8?B?U3FtVng3c2NtTVVPVmJOcWtqb05BWEErTXB6VFFWbk52b2c0NzFicG5lcUgv?=
 =?utf-8?B?enRTNUZ4Si9LN0V2OStnZDRvWkRmc1JxUTZNVm12ajhpL2c1UVV5ZVU4aEo5?=
 =?utf-8?B?eE82YkxXL21Fc29rQUF5elRUclFXSUpTUkxaZ2wrOExzMkc5b0JycENaelhs?=
 =?utf-8?B?elZJVHo4MjlwTjIwalpGaVV1V1o2UnpRdnJPS2RaZ1Iva2Z4d0svSmRrV25z?=
 =?utf-8?B?TnVlcDJXdUZxRmFRNCs0NFZiN0xQaUtSM21sQklqaXIrQzVtWmVQVW1mL0Jh?=
 =?utf-8?B?UjQvWGhuaUhCOU9NOHBWSE9OdW9GL0VXalhHYjBNSys4eUFJUGVDQnZiTC96?=
 =?utf-8?B?MlhkcWJPTVl4dFFqek9iZEdPNVJFZHZsTGtFZXJwcFNUVWxhTmhvMGlCa0Na?=
 =?utf-8?B?YmdZbkdpNUVhUDBwQ0tKYXAyMmpzN084MkoyV0U2eFRnaWZzYUFIS3ZWWHFt?=
 =?utf-8?B?eE5XZ0xuYmJGN2JuNFNnaXJuSG44VVpFcVJVUVZyOXNtcDNKamdnOHZycm5Q?=
 =?utf-8?B?bllDS3FRNXMxSVVCazRDUEM1aGpHMHVVWUpPVkZCQnZhM2RIRTZpYTgvcmtD?=
 =?utf-8?B?UFNnNndiT09CalIrdnkzeXI4eWhyeWNrNENxVGl3cEdmTUFmUzY4YWlyKy95?=
 =?utf-8?B?TnZTaXBMUk5VUlR0NTJYOW5rN3VtYUtWY0VQOW9VRjA3cjduKzNjTGc4YjZa?=
 =?utf-8?B?YUs0SHcyQmpVZE1OLzNRaGhsbjFvcCtzTmNyczRHU1JoVW80UXlQK1ozdUtB?=
 =?utf-8?B?ZkNMSVNYbmtBUk1WUmRNZ0xUVTlBMXJOU1AyblNxMXBPZjFyMEpIem02Zjlr?=
 =?utf-8?B?am85cVhvaFlQQ3lKUDlvMlI5anZUcXEwcVJOdUQ5dEl0SWl5b0N0ZS9sTmJS?=
 =?utf-8?B?N1FuSFE1dmlxSXQ2TklQa1NRUGRTcXdDak9wbUFXcXZNVGpQTjJQTFBOM2pa?=
 =?utf-8?B?NVAxOGp3bnNHMittTVBGT291RkVZMXFXbVZZenBsZDhacEJXVTJubWVQUTdr?=
 =?utf-8?B?WS9JNzhKOHJBYXA1aWxPQUJxMXVrL3B2YitCV1ZsZHJKc3dhN3VhQlhaejM3?=
 =?utf-8?B?cmdVMWVxb2E4QVhabTE0OTZ0RWhrWWpmVFdGc1g4SFpvbjVHTUhJSE0zTlo1?=
 =?utf-8?B?WVhISHdjSmZETUczbjV4dDNnUmx2RVNNam0vMUNSTlNBWGhPQytBcVh2bzlG?=
 =?utf-8?B?aktMbldJUWdZNTAxMHZYelkvSDc1UXA1dmRxaDdIQVRPc0JYZWRjRWpScyts?=
 =?utf-8?B?aEtJd0lHeCsrS3hBR2VUMHYxS0pad3REZzErdFN6bk9INFYyL0dMVnMxYVFw?=
 =?utf-8?B?TE5hNnc2eTZPQTd0RURuWCtvNTArdDlBTlpRenlzUkNNZDFXZGdoZE80eUdm?=
 =?utf-8?B?dmFCT1dtamkwZVNlQ2phM01FUjhua3hvNWhsbXFKckQrTHUrY3FwSjBvR1hh?=
 =?utf-8?Q?r8R+WPYkPpYzbqGh++lEeDcIc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f74a816-0ca8-402b-2af3-08dba2a75bbc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 00:33:08.8183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: har8OUFA79h9S3T6ccTRSMLCR37YdiX7yEl+SQwzqbOCEgJC8jq9QVrsKnowgVFENs9//cK3TgVjrT3TUBo/QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5463
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
Cc: Felix.Kuehling@amd.com, Xinhui.Pan@amd.com, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,


On 2023-08-21 07:03, Christian König wrote:
> Am 20.08.23 um 11:51 schrieb Christophe JAILLET:
>> This serie simplifies amdgpu_bo_list_create() and usage of the 'struct
>> amdgpu_bo_list'.
> Oh, yes please. That's something I always wanted to cleanup as well.
>
>> It is compile tested only.
> That bothers me a bit. Arun, Vitaly, Shashank can anybody with time run 
> a quick test on this? Preferable the IGT tests,

I applied the following 4 patches :

0001-drm-amdgpu-WIP-Explicitly-add-a-flexible-array-at-th.patch
0002-drm-amdgpu-WIP-Remove-a-redundant-sanity-check.patch
0003-drm-amdgpu-WIP-Use-kvzalloc-to-simplify-code.patch
0004-drm-amdgpu-WIP-Remove-amdgpu_bo_list_array_entry.patch

and all IGT tests were successful.

>  but this just some game 
> should probably do as well.
>
> Apart from that looks good to me,
> Christian.
>
>> Christophe JAILLET (4):
>>    drm/amdgpu: Explicitly add a flexible array at the end of 'struct
>>      amdgpu_bo_list'
>>    drm/amdgpu: Remove a redundant sanity check
>>    drm/amdgpu: Remove amdgpu_bo_list_array_entry()
>>    drm/amdgpu: Use kvzalloc() to simplify code
>>
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c | 15 ++-------------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h | 18 ++++++------------
>>   2 files changed, 8 insertions(+), 25 deletions(-)
>>
> Thanks, Vitaly
