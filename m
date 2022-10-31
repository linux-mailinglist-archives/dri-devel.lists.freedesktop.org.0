Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A3D61388C
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 14:59:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9609410E2C5;
	Mon, 31 Oct 2022 13:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B22810E09D;
 Mon, 31 Oct 2022 13:58:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kKzXZTwuuycIM26K7Nvif9Hk+N512Lbq9NzjGNDHSqBveoT+68lKB4lK/ZHtjWpws64i8db+SKm5K/7xoHmdZjkEF448G9WHTgO9CHuOrsPyE5W2tQOrPsqz4K0INxjg4645y40ost6fSIAKs14MS2J/qmu0s4HPHjWK5NDA/LZJPC18p2PsnDNeygnH6CBBGEBq7oZaOV1zTFQzX8Aqhbue2NJtr0NU9OwchH2scaZxwzWquehFbPrHQudJOAxvWmybaVxhrktiQKq/053gYHm/MR1kXAW3WRpyIZWc1QlBXiVRntiz+azqpZQWjs5wDvn7Yq6JBXM1lStlZ3Gznw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EsJSfZR4FYilbgTiI+kfTF0oYo6lukTPFIIQq7F+1rw=;
 b=S0Zgl6vaC2i7+90KBwSIUXtLT+tXc4lt+kmOQKYxs7drH1rEIsPR6E06cs23OruYRvI1tMyS/dz7U7Oe4RrruUbCFydOKyZKHtTsC2HoC0GSdc80LHrDDvrdCHBAX1DvtII7G2HHKNQZB0pR8ViOeaXSwkTw4zNORLne7BZhV4iMmxKZMs7t/8fjLm0ibjO4LoJVbI/pSyH3Q8H/iXptSC//fpON7+QvrH1729A8luYrEpZo/6zgfwGQEWHc4XXZQ+h2BEdHLk88RNEa81IEX8/Xutu/Dr3mqURb/yW1JKyLttDlcEwD9vsC7/26ADbM/COHO5erHixZpimgUIbeHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EsJSfZR4FYilbgTiI+kfTF0oYo6lukTPFIIQq7F+1rw=;
 b=2wvAWJ+SwHzhSQNg5i0L6wPIZsEfvp5+1kC7qsxF83E/kggMrkT/KfLPOfgOz+HfiquoXYzn0S/b2O3sCPEmZ5bBYaRkCcqjbDBf0ILeHy+sI2Ujs+ATZecTL1Ub5Q2ppYG2F3UbfjU8FD6tQtbK1v8f8aQK7ORvr65/T2mozyA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH7PR12MB7308.namprd12.prod.outlook.com (2603:10b6:510:20c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Mon, 31 Oct
 2022 13:58:50 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::c741:a5f:2c1a:f8cd]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::c741:a5f:2c1a:f8cd%4]) with mapi id 15.20.5769.019; Mon, 31 Oct 2022
 13:58:50 +0000
Message-ID: <cb9f90d1-344e-c329-178e-3662c76eee7d@amd.com>
Date: Mon, 31 Oct 2022 09:58:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] drm/amd/display (gcc13): fix enum mismatch
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
References: <20221031114247.10309-1-jirislaby@kernel.org>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20221031114247.10309-1-jirislaby@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0150.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::29) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH7PR12MB7308:EE_
X-MS-Office365-Filtering-Correlation-Id: c4dfc847-bb7b-48a9-b558-08dabb4809a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H/qqdQN9WctQ9HOOw8yzS+/vJiaNtos2zcDM6uVlheJKyqf4iiqg07EY52jfqDPTuJkA9aL+OgnoNklOD7Mnnw/xWForIa0eJWfgDCxOnmC68JEH49I+qBC5Me+sLvQCavf2BSW6ioAOjd+UtS4WskSI6UaOtLjIPcRmsn/3neJsZ7nBwrUTl9amTxotZqsQMjDhc6usXWEClvdy4AdTrAOzR8Q/mCvg8J/qPkq3XKrE41oa+DfuGjrLABaFOzb3SUqmoGGrs4p/wbd6P2m27uxczBPxOJjrC75PHJQKdXU1MFCa6DszQN4LgVqZzkiROXQaRugX/R9imoRsgqzRMvDD3GIMA3RgIPVcmoUwNARgLszfRl+JHdziEKQ328wfemiW9raOC/FbzgkbBdjUDLoaaO42XlYsCL9xhiiil/zN9G3Nboa/sblPX9xiJWx12LYv//YCDNSL2MNwJOYRYZ8ZiXCWDxbmyQZN1aBj5Xf6kycLtyf/Nda06TrpFH9MZbECCd7RM8+efq76oOlbeLfnyYx2QnPOtSdWplRhtj5C0/uVjV0g4Vbg0OZLm8YJuDgQWWEnTLi/PDwsFksGsKUR4jYM2SDu6kp1O/foVu7nstMLBzT+Updqe0VkAKykDCnWzQyEVIqrFsVPUsa0Bvr6Az/9zEHQoDiWRK1yGfB59kztG1FkHD878FeerO8x0ELEWaQauVrJp2k9sdrD7HzvRBKJ0GatizvPUs9loqIGzQ9ElGgINxo/8gbhOHQN6k3ryyVULLHvV7TRZTMFb8tPC2zbbtTkbMDs6m0sQeo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(451199015)(53546011)(478600001)(6486002)(6506007)(6916009)(316002)(36756003)(4326008)(54906003)(8676002)(6666004)(41300700001)(66946007)(66476007)(38100700002)(2616005)(31696002)(86362001)(26005)(6512007)(186003)(66574015)(83380400001)(66556008)(4001150100001)(2906002)(44832011)(8936002)(31686004)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHVnNGhPWjRwRzNXME1wdzdmbU1YaW5kbXhrYU1SNE1HWXdOS0NSQlFtUmhl?=
 =?utf-8?B?QmhuYU1kdm5mZzR1eVprM210QnRnYXF0RGlUMkJnUTlIclozQ2hWcXRzOXVQ?=
 =?utf-8?B?TXdJT09FYXJxVlFrREJtZXN4TVc5ZkFIeHJweGlJTEFHQktpZTJmRmlLbHl6?=
 =?utf-8?B?Sm8zSXRVL2JUdTN4ZGZUVHNjaFRRTmtlZzYyY2tkQXlsWDlDUXpKUkVkZ3Ez?=
 =?utf-8?B?Z0hsWTBNZ1dKS0ZoT04weDBlMWlyYkt2SFVoT294YXJKZVp4aGRHdjdpNUlh?=
 =?utf-8?B?Z3J4bUZoeFh3aEZ1Q09hTUlsVHpZaTRYeUt1czNhVFBCdVJxdDRmeWMrNkR6?=
 =?utf-8?B?N0lLM0lQS3ZWbnVrTjFmcjZManYyTDRZcHpESmQrNENXdlkyb0NQQW1udUk4?=
 =?utf-8?B?VGlGQWU1OEpxVERyYTc1TmhGUVFKbkovMXM5czFRTS9ZSFZEMkJKdE53REFX?=
 =?utf-8?B?c29tanFNeGNjTVVLbFhaYTB3T295YUpNRU1BSGRCakxxN2g5RkNlZERub3g5?=
 =?utf-8?B?K2RKQjIwR3prZHkzdkZtZ05hSVdhSlo3aDRrTEVlR0xZM201b3luUXNsdmJU?=
 =?utf-8?B?TXFES21NVXV5L01aaFB5bHUzS3hMalNNREtrQVZZRnh2RkdQb0I2NDRwRXQx?=
 =?utf-8?B?ZkdlNjlXNWw0VEx0Z3p5NjRWZVpJb0M2V0l4eUtiR1lHd25QSmNBSFJhbVBI?=
 =?utf-8?B?SnhKU0F5ZnhvdWJyb1VyaXlmRlRuQS9QZHJxeHkzdHF3VEcwY1FpVENqYWZN?=
 =?utf-8?B?OGVROHg5VUVmUzg3Qm9pcndlNzJ0Q0xUbW9hRFMzakRsc0JndUJmK0YrbVcz?=
 =?utf-8?B?cHFhTUhOTG9FZ0FTRXVsOThDTE5IRUhTQVgwWEdTbE91N3VRUjlKQ3YxUC9H?=
 =?utf-8?B?SktMbzh2NlBEa21GOXlzQVpGVmxWektKTTFleitPL0NPck9nR2dCUklpM2JV?=
 =?utf-8?B?bDF4NU80NVZlQ1M4UUpGVE1LZlNzaWFsVkY2enBVVlRmUThtazlkSCtSbjQv?=
 =?utf-8?B?ZEFUYXJuUGZGVVdKdCsvVEs1N1Fub0xINlJzZVQ1UWl0MWtTOHMyOE1RelJy?=
 =?utf-8?B?VnN3SUVBNElGK2ZtRGd1S2NPRWY1MzFnVFdkVmdDcDdjd2pSbXY4SGJ0ZUxy?=
 =?utf-8?B?R044cXQvcEExMDRqNThQTGk4MVVQTzRMcytLOVRRNExNeGhWL3dWY1RVc0tJ?=
 =?utf-8?B?VlJaMktoQTNYc1RQL3p4NHZoRnBqMDFHQXcvQ0hVYWZuZ1ozZHNVYmR6Mlc1?=
 =?utf-8?B?bUZFY1FwRFRMVjgwTHlHaTA5eUtxUTlXRm5LR04xaWFWcWdkRnhhQnB5NWUy?=
 =?utf-8?B?WnpxZVQ1blZNN0lCWEV3ZWhVbStlcmRsM2l6RXlMenlNS2Y1ODJGZ3ViMlJK?=
 =?utf-8?B?Y0k3dzJLamU3TnVvbzFod3Btd1JNMkNTaGEzcmxaRmZpUTRmRXJ0ZnQ0V3FZ?=
 =?utf-8?B?UG1VdXZTb0NLR3ZUdEMxZ21kbC9tYldKTVBHMHZ3S2NOZ3JZNS92TkVUbHI3?=
 =?utf-8?B?eFFPVGY3ZVhQOWJsblJQdGltaXZscmlqRndSdmx4MlhtWUVuMzRNdGtyRlFp?=
 =?utf-8?B?RHFtUTBZRi9kMjd4WC9Zd3hINkNEN2dLM2ZWWTFNTkplaHo1L2NKeklKNkZz?=
 =?utf-8?B?b2ZaU01Ea1JDZ1ZGQUN1aStqM0NoOGNCK1Q3bU1WcGxSVWdrYk1kTFpMbVds?=
 =?utf-8?B?K2V5bjhCZTJtZG4yOU4vNVFXaG1IcitUL1UzcWE5ZlVBVVJnZzBRTE51QkRm?=
 =?utf-8?B?NkRXVi9mTFZHVURhdEoyM1dTa0swWnJBMWEzSVR5MjA1K29abit3bXRnZHN4?=
 =?utf-8?B?SDJMd3NuZFpEMU50a3VUZ1VGT29Vc1k3MEFHeGg3bWZZanZYWEFjRC9nWGFG?=
 =?utf-8?B?dHoxNHA2VjNFVktxQSttRldSS0hhNlNXdG9ZR0ZPTVhnWS8xd0NlQm1KZzN6?=
 =?utf-8?B?RlZnZ0ZXK0hVZzVTTUhqT2hTcityN01YVkE2ZVBNYzc2dmNaa3pRNGlLbENp?=
 =?utf-8?B?WjBELzVLbklYZEt1MXY0cjRJQm9RMUQ3cytNOUZ4QnhsNlluVnNoYW9BSXZP?=
 =?utf-8?B?YVVSUEF1UGRGUDk1VWlaMlMyU04wckhVUnNnNmtGcFV5TnBkU2pFVFhMYjBI?=
 =?utf-8?Q?3bj5liZH9XbqF0XqLbtbN+Aux?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4dfc847-bb7b-48a9-b558-08dabb4809a8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 13:58:50.3093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UOJKUpax1wgWx75UkW59+2bois0ZD9xjrrMmHXwgDS/vKygG7tgZq5rV1eQZz74of65om7yW0XyXQFR9jEk3mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7308
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Martin Liska <mliska@suse.cz>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-10-31 07:42, Jiri Slaby (SUSE) wrote:
> rn_vbios_smu_set_dcn_low_power_state() produces a valid warning with
> gcc-13:
>   drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c:237:6: error: conflicting types for 'rn_vbios_smu_set_dcn_low_power_state' due to enum/integer mismatch; have 'void(struct clk_mgr_internal *, enum dcn_pwr_state)'
>   drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.h:36:6: note: previous declaration of 'rn_vbios_smu_set_dcn_low_power_state' with type 'void(struct clk_mgr_internal *, int)'
> 
> I.e. the type of the 2nd parameter of
> rn_vbios_smu_set_dcn_low_power_state() in the declaration is int, while
> the definition spells enum dcn_pwr_state. Synchronize them to the
> latter (and add a forward enum declaration).
> 
> Cc: Martin Liska <mliska@suse.cz>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.h   | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.h b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.h
> index 3e5df27aa96f..1ce19d875358 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.h
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.h
> @@ -26,6 +26,8 @@
>  #ifndef DAL_DC_RN_CLK_MGR_VBIOS_SMU_H_
>  #define DAL_DC_RN_CLK_MGR_VBIOS_SMU_H_
>  
> +enum dcn_pwr_state;
> +
>  int rn_vbios_smu_get_smu_version(struct clk_mgr_internal *clk_mgr);
>  int rn_vbios_smu_set_dispclk(struct clk_mgr_internal *clk_mgr, int requested_dispclk_khz);
>  int rn_vbios_smu_set_dprefclk(struct clk_mgr_internal *clk_mgr);
> @@ -33,7 +35,7 @@ int rn_vbios_smu_set_hard_min_dcfclk(struct clk_mgr_internal *clk_mgr, int reque
>  int rn_vbios_smu_set_min_deep_sleep_dcfclk(struct clk_mgr_internal *clk_mgr, int requested_min_ds_dcfclk_khz);
>  void rn_vbios_smu_set_phyclk(struct clk_mgr_internal *clk_mgr, int requested_phyclk_khz);
>  int rn_vbios_smu_set_dppclk(struct clk_mgr_internal *clk_mgr, int requested_dpp_khz);
> -void rn_vbios_smu_set_dcn_low_power_state(struct clk_mgr_internal *clk_mgr, int display_count);
> +void rn_vbios_smu_set_dcn_low_power_state(struct clk_mgr_internal *clk_mgr, enum dcn_pwr_state);
>  void rn_vbios_smu_enable_48mhz_tmdp_refclk_pwrdwn(struct clk_mgr_internal *clk_mgr, bool enable);
>  void rn_vbios_smu_enable_pme_wa(struct clk_mgr_internal *clk_mgr);
>  int rn_vbios_smu_is_periodic_retraining_disabled(struct clk_mgr_internal *clk_mgr);

