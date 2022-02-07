Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A9D4ABBCB
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 12:42:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF3DC10F90C;
	Mon,  7 Feb 2022 11:42:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2084.outbound.protection.outlook.com [40.107.92.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D771910F90A;
 Mon,  7 Feb 2022 11:42:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nZznOGzK/B/ikqhRIc5IJOHfz111DMYvIdAmh4YFYKKuWrCr9GvdGvbIQkXpi55dLgnbTFTmiFemfChgnBFdTsM5gh3L7DWUNEq9az3qUeDra2UCUNWScZGnnIx1vWP8b4SSI5DMMwSRpqwlQ5lKS1RvLXhu+h5rgW8jvu4DyFgYnF7A3VM6PBNTHG2MdXu+Ci4g9Kb1JXw95f538C+zWu1JVYVjjksa0cYivIeaob5lp7XTFUEo6xPuM6cni8St/IVepjXet2izVlnY6hYhIJTS4QVeQDx1sdFTXDOHal0JK2v6a1YvD4C/ZZFdrxTsLnG0NJv//z9GA8OuCIVIpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+G2fIjfz9mmkUPpiJOfLF956EL22/uz3VWnUjpmmPE=;
 b=TPzmUQH0xYFsOkKMMMFayN+/BulY3deM3GKQk05unuBxSuLY9axOT5Ns1lalXMFPmfKdg74Cd97r3chrl5CP+lWLcV5wgMrPGcWEVdUwN4syX5FAI6WRrLdFyZ7dsKLUt+3pc2UaEHHmkRKlSPmXqIFP6olntaqM44J0uooEKOchwRpEGEX8zOHhOVHL3d8iKWjiQ/87pMPVr66mH7GMz3c6gmemhCxSF1Fmh09QdtutIFou2rsqVcGINtpdF2zpafNgGc0GCudwTYNdc1m1LrdPYC0DiwJcJija8AVwuCkPvl0KjLMvjH+004tRBMaXoU1CT97LTHfXsgU9ceegVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+G2fIjfz9mmkUPpiJOfLF956EL22/uz3VWnUjpmmPE=;
 b=tgGf0kuAW6iehe/mnqXMFUArdnZZYFBfdBHiWeraQHl1p+y+n4iQw8vs7xA6YaSHLxLIAasvPb6mUd7hfLrsw4JtLL636zbSWOEdGfmMzQdTDbuzEFLgDMUZbwS86lNuVhehISZ2llpf5xJQ4W/393TuWojdaMNgi9KrtHE0DYc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BY5PR12MB5525.namprd12.prod.outlook.com (2603:10b6:a03:1df::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Mon, 7 Feb
 2022 11:42:05 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3%3]) with mapi id 15.20.4951.019; Mon, 7 Feb 2022
 11:42:05 +0000
Message-ID: <1a195c03-d2a9-d35e-7b62-a8b70a5c21b3@amd.com>
Date: Mon, 7 Feb 2022 12:41:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC 0/2] drm/i915/ttm: Evict and store of compressed object
Content-Language: en-US
To: Ramalingam C <ramalingam.c@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
References: <20220207093743.14467-1-ramalingam.c@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220207093743.14467-1-ramalingam.c@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0068.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::45) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 328bd76e-334f-4971-68fe-08d9ea2edd26
X-MS-TrafficTypeDiagnostic: BY5PR12MB5525:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB5525BC90A3754049361AAD86832C9@BY5PR12MB5525.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kNSs4hF143axoZKYwmS+UiGCT1nZvkCEKcjWTpp7RBZwaHSXSUnRnugFSakvyksUCbiyjgvIyPWAkhI6Kn2UzJrHD32d+PPxK1PN7Lb/kq0INzH/v8Mh0GMptmVD6fcDlLBmbdRDpOcTzSRSDFP4wgkmGxGrDfUk3sb9bdALcg+HCv9HCWms1wLekPeiLVvhX15W5BMb5SrC9CGHiobnrqZ1do8krS/ecJBjQxTxu6rGlm2HiTUCcSOviMOfQ5+H/V0gykdc4wU+Qe6SWQk0EWx7rTfosdVldPTL46RS9ep7xFfrmgjQTdbN+hBZujrZe57HbxgxtEL6tIqThDoULlTEcmX+ZNyNvgpFttof2FUE9mQMIJWx3sIMIPGiPAjptCqCd6O8dHmnHZ8JZJpmF413eWMAC/HsOiNYCorkdQUMfGq8YVEqsMNuygbhXqllfIOQrvionxFUQ2E9tBOhcueSrF8YU0JEjhad22nt5L4n8mJA3KLuSgSZsIS36AW7YwT6zEpbWMxkPIk7i1h9LIIZ5FH0MmtFg2giAIh/2/9ZmmUJVwL0MjEPD1SgnNDC9s+UoTRJ8snEzuOC/N+bhRwcZ10uAMpfKyjfR4IhrIIlhjCrGmD279yW2EINcY63qxBl4O09O7g3s7/Gf+byztDAaEDdKJPVZOYKBovC7kpg/As+hJO3WhumYGZIev2h2HYISBFny7W/scNo5olTbkgvDOO9tioj1+m9zYiFTTt3T7A8esjr5Eu7RP4z0UIr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(6486002)(966005)(6512007)(186003)(38100700002)(5660300002)(2616005)(31686004)(36756003)(8936002)(4326008)(8676002)(6506007)(2906002)(6666004)(66476007)(66946007)(66556008)(110136005)(508600001)(316002)(31696002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0VxclhObG9PeTJwbkZGL1ZrbjdUYklkQ3JtbzBaQ3BLTDR6Q2FtSkV0RFhZ?=
 =?utf-8?B?Z2ZMMm1pc0FsRWxjSzRlWjZwK0VtYityaWs4QW8rcHdTUmRvaHg1UURNTE1C?=
 =?utf-8?B?c0RzRnZkbmJFUXlWOFlSM1h5bUI0WTVxZjl3cHE5NnZuTG1PU2t0cnAvNGdi?=
 =?utf-8?B?N25heHU4elZyejJkcFlEYmI3WTEwYnpTYlZFODIzeWpuOVg0TTUrbjRHMkNj?=
 =?utf-8?B?ZVhCS09aQ00zbGhya1JpRjIrWUp0M1k0TFZmL1J6YjM2NVhweGM2WHRlRklq?=
 =?utf-8?B?Mld6WmxZL3dPd0RzTWJGaWxUdWVWV2d2V3BqZTdoL2xaWndLZE93VFVzOXl3?=
 =?utf-8?B?djY5TjFMbTlnSkR2RFk5NmhQSjY3UjFIaUoxdWpZbERQR2FOSTJKMi9SUnFr?=
 =?utf-8?B?a3BOKzVBZElIU3dqdXdOcFhDWmJORVdSOFQvSG1tT0ZYNWIyRk1kcmtjTG9T?=
 =?utf-8?B?d0lzOFNiY3k1MDRaZU1lZ09VS21wdGJ0dUMxeHRQbVZaQlBJK3p5YUF1T1hr?=
 =?utf-8?B?M0dRY2Nrd2FPVk1GdzgyNXhKUmlibzRoWkpzWUltVHBYTTl5NG1LTjFobXl0?=
 =?utf-8?B?Tm9YS1FpTzFPNlJsV3NZbmNpNGNCRkEybWdPek40STdKdVhOemNYT3lKVFI0?=
 =?utf-8?B?VlJCdmV1NDIrVjNzdllzN2hxL3kybmVXbE1OamVEVjM3d2xrd01SSVgvbGwz?=
 =?utf-8?B?aUhmaFBpbW1qTTZjVVBCblFwdm1yUVJGTUxHMktrdGs4R25CK1YrMHZvQnFh?=
 =?utf-8?B?WTJsSEhvR1BIamJXVVpiVmNhMkx1c3VZZTBRTFpLWFNBQ2lYT2Z3OVplWS9E?=
 =?utf-8?B?dzNnZ0tYYlBMaFRXb1hLTlQ1N2Q0emZISzlxeHBkendBY0VlK2ZiN1RrZ09q?=
 =?utf-8?B?VU5aeGlOUDVXMFBJdjBQdW4vT1k4WTR5QWpFV1VlMmlydzlmeHd3cjFCWFZj?=
 =?utf-8?B?TUtJUkM5WWpUbzBEZFlTZTZpYUNZeWdUQy95YnNuWUhEVjg2c0ZGVWxiMkx3?=
 =?utf-8?B?dXJtZFJHYWFPRFBHTlBEbGdOTE5MaUlzVTZkcXdYSFVMWUc2NWNFMzJjbUNt?=
 =?utf-8?B?L1QxOFRBRU9qMDZNam9BRTI5S0JsZnMzN2dRMlRoNkh4TGllQ3p1RXJOMFdU?=
 =?utf-8?B?UysvSGNzZWx0QVd5SGxZcVBYWGUwd2t3cFdIUTJtWnRaQ3NUeG9DQWlESTRp?=
 =?utf-8?B?czE5aGJYNEZrczIzVit3U2tWaFI1RzNoYldLU1BEWHlMQkc4OTl6cmRhZXlB?=
 =?utf-8?B?UXh4d1l1bS8zRmU4YzF6RUI2YWdRanNhN1RkajNuWkRzTDRNSzlYL0xjWGZH?=
 =?utf-8?B?N3IrNUNaNWM1emsrMHJDYnIvVXc5MC9lT2RrNzFJVnZ2ZTN2ZFBrS0VUYUNT?=
 =?utf-8?B?RmRaWTJVbHpDTW5ySHl5MzVINWJreEYyb3JYeWJzUCsreTBkMVVMNGZQZUJh?=
 =?utf-8?B?YS92R1pJdTBXcGlrWWFsRXlCeTJDeGlGeEY4MTdtcnJhcWpVcTZLZWwxOWZB?=
 =?utf-8?B?MVFxMmQwMElBWWMwSzNBNU5nNTlHaGRhc1ROV21GWlF6aEZNaGVHTGJQR0Jt?=
 =?utf-8?B?YkxwdmdCZFVlNGtoUFZsTzQzNUtHcTdiMldWdVBQM0RRRmJrRlB3UmRUMm82?=
 =?utf-8?B?ejlZQUtHSXpQdnVDOTBYa1JMVlZnSVR2MW9lRE4yMXg1eXEvNGJkMFVDMWEx?=
 =?utf-8?B?MUtTbWJkWlpmaUpYSzRUQTFrMzFsUzNWSkVTR2FFYmxaanFEbEp0Snl5dHl6?=
 =?utf-8?B?NGtvWlFrSTZVQlB4UEZGNXc0Rml0c1lmN3gvdmdlRmp4dVMxeEtBZFgrRE02?=
 =?utf-8?B?VGtDQVpwaldRNXVDMVhGRXp6S3M2aDl0RCtpd1lOR2NQZUlEOUhwMG44ZGdt?=
 =?utf-8?B?Qzh3VitSczJyaEI2eFpubFA3dmNLazhNempHdm5kdzBhUTQ0NnAvSWJ3NDdl?=
 =?utf-8?B?c3FZcGlPTjZuMFMxa3lzWlZKS0hGRzVvT0F2c1N3dlRHRXFYYnc3R05yVU1r?=
 =?utf-8?B?SjBjaytsMm01QTU3dnRESHRmTUJBOUd3OHNCN0NiakcwUVluN29UV1M5SzhJ?=
 =?utf-8?B?WjF1R3dUUFk5djJIWUtHb0VyeGdzSHArcEJUSUhLbmg3NENoWngvbHZoR3l6?=
 =?utf-8?B?YkRzZWQyUng5djMwZkJjKzRaRjZ4d1QrWXdzdkhydHdhZjhkaG50UTUyNTZL?=
 =?utf-8?Q?DAjVD0SdfqNK6TFaWfmZ0fo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 328bd76e-334f-4971-68fe-08d9ea2edd26
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 11:42:05.4781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Qa9bZIH/ga4jJz1ze4KWg59LxnUwBzLS3SbRALuXM1iwdodlnrzUzlHyxG4CPzk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5525
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
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.02.22 um 10:37 schrieb Ramalingam C:
> On flat-ccs capable platform we need to evict and resore the ccs data
> along with the corresponding main memory.
>
> This ccs data can only be access through BLT engine through a special
> cmd ( )
>
> To support above requirement of flat-ccs enabled i915 platforms this
> series adds new param called ccs_pages_needed to the ttm_tt_init(),
> to increase the ttm_tt->num_pages of system memory when the obj has the
> lmem placement possibility.

Well question is why isn't the buffer object allocated with the extra 
space in the first place?

Regards,
Christian.

>
> This will be on top of the flat-ccs enabling series
> https://patchwork.freedesktop.org/series/95686/
>
> For more about flat-ccs feature please have a look at
> https://patchwork.freedesktop.org/patch/471777/?series=95686&rev=5
>
> Testing of the series is WIP and looking forward for the early review on
> the amendment to ttm_tt_init and the approach.
>
> Ramalingam C (2):
>    drm/i915/ttm: Add extra pages for handling ccs data
>    drm/i915/migrate: Evict and restore the ccs data
>
>   drivers/gpu/drm/drm_gem_vram_helper.c      |   2 +-
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c    |  23 +-
>   drivers/gpu/drm/i915/gt/intel_migrate.c    | 283 +++++++++++----------
>   drivers/gpu/drm/qxl/qxl_ttm.c              |   2 +-
>   drivers/gpu/drm/ttm/ttm_agp_backend.c      |   2 +-
>   drivers/gpu/drm/ttm/ttm_tt.c               |  12 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |   2 +-
>   include/drm/ttm/ttm_tt.h                   |   4 +-
>   8 files changed, 191 insertions(+), 139 deletions(-)
>

