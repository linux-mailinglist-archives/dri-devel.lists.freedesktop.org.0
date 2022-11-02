Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F9A615F65
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 10:17:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D93A10E454;
	Wed,  2 Nov 2022 09:17:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F2B510E454
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 09:17:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L9K7sVSfM9qefVWtA0mT+AdBtkeIEx/6o6PVNaDcG6WlD48X8q8+I/W0gO4C82Sa3AjLABZt4vmPs4Rumez7ANyM8b67XMbi+1v4KYMLBE29S8fvu34j2CcB8e2BIvymPjnlmgKgtlJlPJ2i9j+qlFfpHl4h0zODjfZveo5Xf2pbn8vxs17Q7IfvRYlH5JJ8MkJ5+EhLeZI8lAUHqQVwWf8F1HM/3QI+CdFxBN1h4c8LvKwNZ2h9X9vT6dbUOILSV4MVEtLuk6aPIt8nI0eyD92E2zEHXM1DiBnrmsnyXbX8e30mo6YwUsRy5+5SKXtZ/rp2+Cbg+b47G+JHGlPhjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vdv9AXqBs4RzzZUEsOE5eoiPxj4c1XeN/DH/JZ6fCzY=;
 b=mlN9j3n6K2oOsdya05DyoKIYuZ+v/d+mXz5e0UfdAPiYIUmRWXFa67HaV5x02hl3CXmHGE4XA2VNeTEhQLvy/O2lHZ9loNGNf1rN9aoeqK/n5B4+0f+VLwm9bKsVSWEaYqHsTP0BKh9lOqPD2cNzgQJ14YTs/MYzuqxlRT7KyoKA9J6UuSF8o3UMwyNog6VYAIdf7OE8VJGHI0fnn2zrdX6Zb8IjGOoA+IhtRZnTsyD4hI47BEY89DwWUsLg8xSU4i4+uHUvi7BtOpb+BmbGajpdrQSfCdXF3EutMi54OvmGC4DbCK2EzAquTDexUrMXwQ02A8vfJBecG4v74Wax8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vdv9AXqBs4RzzZUEsOE5eoiPxj4c1XeN/DH/JZ6fCzY=;
 b=IrxOollgD6k2tm4dUadNMA3nLuR2HaBC8zzEOo8KsgIoQL4f0z8oGjKvi9Ynh8y8DuDQoQEWOm+3QTPax8aAjnWAwRt3L78Jif64YtWaxm4Iea4Afq9lUQuRfPwj3L/rqo0EO/9gwBYDORctkwTynVPmQ6cdK73aWDMduLPHEyI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS0PR12MB7777.namprd12.prod.outlook.com (2603:10b6:8:153::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Wed, 2 Nov
 2022 09:17:37 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5791.020; Wed, 2 Nov 2022
 09:17:37 +0000
Message-ID: <9db29002-33a7-a54e-cbe6-727af757db44@amd.com>
Date: Wed, 2 Nov 2022 10:17:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] drm/ttm: fix undefined behavior in bit shift for
 TTM_TT_FLAG_PRIV_POPULATED
Content-Language: en-US
To: Gaosheng Cui <cuigaosheng1@huawei.com>, ray.huang@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, airlied@redhat.com
References: <20221031113350.4180975-1-cuigaosheng1@huawei.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20221031113350.4180975-1-cuigaosheng1@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0356.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::23) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS0PR12MB7777:EE_
X-MS-Office365-Filtering-Correlation-Id: bbe44cd0-ac68-4b58-0681-08dabcb315aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jWWTpfMReX7h9jTk/URoiiOme16csewlFT+lMtng11LbU2sc+6trhR3/iYXTpXBCatZ7BOkLM8e3tH2jaMy+3ydC9sc7EqRASWt5hRxY3qLuJ5B8HpCPWWDqE102caHH9uAQYfTfxv8K73FRLWaUXdbmh/jdANmf4PXFHJxS0CEMvveVCPyTcovfsrp74M1BBqB+MpcgRHmySeyyCaCEYRY8Xsh/LLvwqgyuK8pkjVep5sOyxmH71P4oMpJ3ZWWnw2/7f1qzlNhRCzT0cWrSfwfTh7v6uAeC4X2B1uTGNzGUgD5r+10DYEgAESYvSL5ZbDrOuOtpTH2xTFx+GVpm9QabqE8RumHasJf2uebO9I0QTHaQm0C2LNbhGNIMkiFNANNdMTMqyqZ3UR7TUipduNGchy+wXHs+OG17RUgvu5nAbuecwZJN+GETq2qRQN4me8PgTCbVVGdCVF1SXfFx1K/7uiBnkhCJgCLvdNwp6Qn1LlBAjxU0Nwu9+8+3TXj9GaPnmNf/Z4D3t2DRTQhvpnjea6L24ayb1UH4Qgr3QlxYh4aMsbGgdJFsigYngqzALKVTYHEiBszOCJUmKTc4EgudQSZVeuCocaik/FsWX0+Zf1FqWTC0InfZN6h9cQhsMsNndlE+7Hp68VIzTJ+aP6w9mH7GIsYSbSEiMVdUAlRtypANG/Oj/Jmh9KkFtImbzqh1qqpXBlmvSN0uy5birT1GOAEG0bmmR5X5dljKDp5Nj5ocNaZy86a/2BDMslcrnrtM4UHpEXKtGsBzztXbflFCCZRKxwfLcnButWM9mgI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(396003)(366004)(39860400002)(376002)(451199015)(478600001)(8676002)(66556008)(4326008)(66946007)(2906002)(5660300002)(66476007)(316002)(8936002)(41300700001)(83380400001)(31696002)(6666004)(6506007)(86362001)(66574015)(6512007)(186003)(2616005)(31686004)(38100700002)(6486002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmMrUVFHZTJ4eUJnWGdyTlU0U0ppSzBCd1laMktCN1R2a0tjKzk0Qll6Qm8x?=
 =?utf-8?B?eG1yK3Bubi81SzhZc1A2YUZUVUxsWjE3VVpRZFFhcmQ1Y1gxb2hqbTJ2RnUv?=
 =?utf-8?B?Q3ZuUjF6bjlEcUtHZUNUTThIVDE0eEp5eSt6blAxSUx4QTY4OGcxeXY2VU92?=
 =?utf-8?B?Zllwai9JQnZjcWNydVo2dlZzT1ROVno0TnJxR1FhQnZIY3lOZG15d3Zicmd1?=
 =?utf-8?B?R1VwcTlLaHdVRituTFlmNWJXNjFDRVJUTHdtekZ4Vmx6bG5JZHBFWUQyekl2?=
 =?utf-8?B?VUtLcXFiUkRnN25qWENFUlBUUjVwUngvNG5QUDR3bk5VcUViay96OTdLU1Qy?=
 =?utf-8?B?a0R6cllkdGYrWnU0L1pNU2pMY0JONm5PS2djSmU4NXpaZWdzQkxUZytPcEww?=
 =?utf-8?B?RGhEenA3aWQ2aVZBN2JaSEVvVWRndWY3TDh2eUtkbjdVb2tzZ3FEemhvMHpJ?=
 =?utf-8?B?aHl1RzVISkR0NExZRjRiSm5mNUE5cmNYRVBwOWFDV1MzRDNwZ2p3WDMvRDJ3?=
 =?utf-8?B?RWNzV0dNTjBadlIxZWo2cXFIUHJSL2dleEh3WVRCbUg2RmROL283NlFPc2RP?=
 =?utf-8?B?VnNLTk9GU2dxZmlSV2RhSzh1Y1VtS1ZyQlhrb3dJOTRNSXRRcWx1bjdRTTdV?=
 =?utf-8?B?b3VOOWRraUxsUEh1UE1CaTQvZHptb21rSXdGUm5IUUhwZytXOXcrMzcxYTVK?=
 =?utf-8?B?NW4vNXlBNGN2eElCSVVxenU0aDNuZ0tNVTJ6VVJ2RHB5bUVETkFZeW1LY3J5?=
 =?utf-8?B?RlFRWjVGZTdNZVhFNDVaWkxNR04wWHpuYjBhRnRuOWxvQkxvNnFRcUN5ZFZ4?=
 =?utf-8?B?elY4NXh3cTUxa3h1SDEzSTdmTlNVMVU2YVhvYlpPaVBITUdnbnlXMVkyZk1M?=
 =?utf-8?B?bXB3aXdUd2pRWFVJQjBpa2ppSnFDUVN6NXJsaU9JbVJDSXV0NmtVemNOcWx2?=
 =?utf-8?B?VnVMZEg3SFp2K3pRZ1Z5MlZyT3ltV2xpSVhkU0VQbkdKNGpHekUwd2JuMWpw?=
 =?utf-8?B?dTlZOTB2eDdMWlIvYmNYR1ZXZC9xNGxrTGRBb2lGVjl3bEE5WkI0M3loRXRJ?=
 =?utf-8?B?dFZxcFB0amE4M3ZQRVBRYXppbDFJOUJLOURSNGFpbTJqVzhEa0Y4alZ0MytB?=
 =?utf-8?B?QzhRWnZmLzBOYVRKQXMrVnpHZVRFOTVKV2JjRlE4UmpGdnpUZU5TTVN6ampD?=
 =?utf-8?B?OTMxaGYyK2ZnSWZ0ajA2RkRJdWlwNFVtSXhCY3VmT1JSL0pPZDRRL1RYT055?=
 =?utf-8?B?eFJPU2lBSTFhQVJaem9XbHhBQi9zZ0hNUlVHeWlXY1VnQ0ZSVWZXeVRyVnBY?=
 =?utf-8?B?UjVOQThNWXNBMCtTRHRheUNEeVd4SUMyZHV2d3FaYklmbTlrOGowMEgyV0N3?=
 =?utf-8?B?eWFmUWpHMktZbks1cHZOVGNjd1RucWxFeEhUMWhaL1JLWjlvTEppL3ZNUjhz?=
 =?utf-8?B?SVJaWHJLNzBqR0MwMEdkN3pZbmppUmFUZVBmd29SR08vakdkY0xkYk42dGJP?=
 =?utf-8?B?Q1llM0VXN1RhM0V2eGZ2V0dISzl4YWhDTU9wYVNOcHV4d1RsdEtOcjNTMVRL?=
 =?utf-8?B?QkVURHYyZFJrbnFpS2EyaHp2ZE9MSC9EUFJUbmk3eVJCODRRZkgrckxEeG8v?=
 =?utf-8?B?VWZUdEtNUnBJYmo1ZGFMQWZncHRpKy92cUFvd2hTUWh3dG13QmdiL1ZRZmZ6?=
 =?utf-8?B?UzVDcXU1eFJvRkF0a3RDTUZMdjY1bkZORzF1ZUZNWTJjeE9YYUtPMXcxelg1?=
 =?utf-8?B?M05xTnlCcCtKMXpIMEFhVVRmMUNLTVU2ZkR5R2ZKeTg2cWtHRWJGemhvZkJj?=
 =?utf-8?B?Q2xqc1J6TFVVclVOWVBuY2dreVlFL1JaQ1d3aXpQTlNpOGVXQXJGWHllZWlF?=
 =?utf-8?B?d05kWUQ1Z21ydWl2R1NSTTBmT0JxdjZjbmNvSFZHdkdvVE5SN2ZQTitPNGRO?=
 =?utf-8?B?Tkh2aVVSR2V3Rkhpd1RFUk5uVm1JRjFEaUpqUjFsSDZuek1NRTJNRFRjM0Vw?=
 =?utf-8?B?dkR0Y1pzUGNoRUVTd1Q4S014RzhpcjAvM1NHY2xQSzd1cmYvN1JNbEo2OEFq?=
 =?utf-8?B?NFE0dWNPUGF2MitJenB4Nnl6Mk1BZkhPRzdoZDZ4ZEJ3eU0yR3luM0NFYzBl?=
 =?utf-8?B?VGNTQ2xsZS9OZ0JoNlBYSVBRQkRuTXFBYVE5ZGZyUlV1OWdPZCtJTDBVUXlY?=
 =?utf-8?Q?V4n9G6+M1gZJ1lVBrpKFqutsYa28u8nH+rbUbjDD93mX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbe44cd0-ac68-4b58-0681-08dabcb315aa
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 09:17:37.7947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tD9GVewvu1R9ZfduSuUdvP0tYmu95bO0J+LqxsFoPnAt11KGlUXnedT+YPOk2zlt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7777
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 31.10.22 um 12:33 schrieb Gaosheng Cui:
> Shifting signed 32-bit value by 31 bits is undefined, so changing
> significant bit to unsigned. The UBSAN warning calltrace like below:
>
> UBSAN: shift-out-of-bounds in ./include/drm/ttm/ttm_tt.h:122:26
> left shift of 1 by 31 places cannot be represented in type 'int'
> Call Trace:
>   <TASK>
>   dump_stack_lvl+0x7d/0xa5
>   dump_stack+0x15/0x1b
>   ubsan_epilogue+0xe/0x4e
>   __ubsan_handle_shift_out_of_bounds+0x1e7/0x20c
>   ttm_bo_move_memcpy+0x3b4/0x460 [ttm]
>   bo_driver_move+0x32/0x40 [drm_vram_helper]
>   ttm_bo_handle_move_mem+0x118/0x200 [ttm]
>   ttm_bo_validate+0xfa/0x220 [ttm]
>   drm_gem_vram_pin_locked+0x70/0x1b0 [drm_vram_helper]
>   drm_gem_vram_pin+0x48/0xb0 [drm_vram_helper]
>   drm_gem_vram_plane_helper_prepare_fb+0x53/0xe0 [drm_vram_helper]
>   drm_gem_vram_simple_display_pipe_prepare_fb+0x26/0x30 [drm_vram_helper]
>   drm_simple_kms_plane_prepare_fb+0x4d/0xe0 [drm_kms_helper]
>   drm_atomic_helper_prepare_planes+0xda/0x210 [drm_kms_helper]
>   drm_atomic_helper_commit+0xc3/0x1e0 [drm_kms_helper]
>   drm_atomic_commit+0x9c/0x160 [drm]
>   drm_client_modeset_commit_atomic+0x33a/0x380 [drm]
>   drm_client_modeset_commit_locked+0x77/0x220 [drm]
>   drm_client_modeset_commit+0x31/0x60 [drm]
>   __drm_fb_helper_restore_fbdev_mode_unlocked+0xa7/0x170 [drm_kms_helper]
>   drm_fb_helper_set_par+0x51/0x90 [drm_kms_helper]
>   fbcon_init+0x316/0x790
>   visual_init+0x113/0x1d0
>   do_bind_con_driver+0x2a3/0x5c0
>   do_take_over_console+0xa9/0x270
>   do_fbcon_takeover+0xa1/0x170
>   do_fb_registered+0x2a8/0x340
>   fbcon_fb_registered+0x47/0xe0
>   register_framebuffer+0x294/0x4a0
>   __drm_fb_helper_initial_config_and_unlock+0x43c/0x880 [drm_kms_helper]
>   drm_fb_helper_initial_config+0x52/0x80 [drm_kms_helper]
>   drm_fbdev_client_hotplug+0x156/0x1b0 [drm_kms_helper]
>   drm_fbdev_generic_setup+0xfc/0x290 [drm_kms_helper]
>   bochs_pci_probe+0x6ca/0x772 [bochs]
>   local_pci_probe+0x4d/0xb0
>   pci_device_probe+0x119/0x320
>   really_probe+0x181/0x550
>   __driver_probe_device+0xc6/0x220
>   driver_probe_device+0x32/0x100
>   __driver_attach+0x195/0x200
>   bus_for_each_dev+0xbb/0x120
>   driver_attach+0x27/0x30
>   bus_add_driver+0x22e/0x2f0
>   driver_register+0xa9/0x190
>   __pci_register_driver+0x90/0xa0
>   bochs_pci_driver_init+0x52/0x1000 [bochs]
>   do_one_initcall+0x76/0x430
>   do_init_module+0x61/0x28a
>   load_module+0x1f82/0x2e50
>   __do_sys_finit_module+0xf8/0x190
>   __x64_sys_finit_module+0x23/0x30
>   do_syscall_64+0x58/0x80
>   entry_SYSCALL_64_after_hwframe+0x63/0xcd
>   </TASK>
>
> Fixes: 3312be8f6fc8 ("drm/ttm: move populated state into page flags")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

Going to push this to drm-misc-next.

Thanks,
Christian.

> ---
>   include/drm/ttm/ttm_tt.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index 17a0310e8aaa..b7d3f3843f1e 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -88,7 +88,7 @@ struct ttm_tt {
>   #define TTM_TT_FLAG_EXTERNAL		(1 << 2)
>   #define TTM_TT_FLAG_EXTERNAL_MAPPABLE	(1 << 3)
>   
> -#define TTM_TT_FLAG_PRIV_POPULATED  (1 << 31)
> +#define TTM_TT_FLAG_PRIV_POPULATED  (1U << 31)
>   	uint32_t page_flags;
>   	/** @num_pages: Number of pages in the page array. */
>   	uint32_t num_pages;

