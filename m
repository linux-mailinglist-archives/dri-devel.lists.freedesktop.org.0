Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 137697B721B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 21:54:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DCD310E07F;
	Tue,  3 Oct 2023 19:53:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062.outbound.protection.outlook.com [40.107.92.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFBE810E07F;
 Tue,  3 Oct 2023 19:53:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xqy1ezXsatT7LesDcUjqZRp9MzMCUrqreNPIAd3By2uMx3YX3laAjM/Kc/ElktjY9GY5XE420LBJNeRybVAu+gh78NrIVmYiy+tZuy7ay+gadF/JBg7tZtZPBk9FBSWpnPHr3kc2OnxHTyoO3kvo8jpKhAiJo6AQ10FDXYQlFL8voMfg5qCIpJl2QC7jK95hzscvvLxVMvarQnkMJltDR+OvVjeNR3fnAkQeeXsr0qdZlsmiYIftHGONwv+rgBHz+bpDoQAHzTgz82SGuNNd5kiT4YsRZyTJHFVEdB3K6+UAgTAJn9kcxtQ13GV0WMV3ysEpjfNo4Us28j0g86gDDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IWSuQsfaagX3px8lL7iL+qEahAdkprSdWnLqaE25TI=;
 b=jto4nwyv1YUGKWE7pkePCduf7h98z0ZaOdlQuIdY3tAnCje2P/kJE8JmMTTrcuCIgdZv5NfpGU0Xwg8HjeDdXbbfe+AW7yaz+zJp8yp1koOi/QAA7yAEjPC+ri5orexxbaa9I9pyCNv+nVuAr1xio/6tQfFbNN/WKT6rS7T0BlzpZxdSVEEkQf0cMCWJ8eepkK63ZPuOkVPvZEoJJU+PPXIH67KJX9ywxggUlC1tcTUr/YYgn1r2djvK+rYCq3kZyO762MR/LzLf4+1/RZKcA8Ra65XfV6OYSYAbUVG7u1MtdnFsEzwQhyKnkW5rIHv4BTST+P115Gj9DBTJuqIrvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8IWSuQsfaagX3px8lL7iL+qEahAdkprSdWnLqaE25TI=;
 b=Z2wCaZt1Cf+w7HYVyJwamxaf2ZCUVcBDOgPI0AEZ+BRiQhfsxDtdcHLZMqn8Vviu48fIdE19igC8QUDgdRaUe8kEjwkIwx9wL+TALAsh4k6eatDTHyFPbLBs1+KliDf40vJUoLvlgj3VRgQLPIei6+agQeLXz2wSDX2NxBxb+0I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BN9PR12MB5209.namprd12.prod.outlook.com (2603:10b6:408:11a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.31; Tue, 3 Oct
 2023 19:53:47 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6838.024; Tue, 3 Oct 2023
 19:53:47 +0000
Message-ID: <ad5179f7-d2f6-4306-b70e-f0ae5cefcff6@amd.com>
Date: Tue, 3 Oct 2023 15:53:41 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/amd/display: Remove migrate_en/dis from
 dc_fpu_begin().
Content-Language: en-US
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20230921141516.520471-1-bigeasy@linutronix.de>
 <20230921141516.520471-2-bigeasy@linutronix.de>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230921141516.520471-2-bigeasy@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0136.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:87::7) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|BN9PR12MB5209:EE_
X-MS-Office365-Filtering-Correlation-Id: 3968ea49-91e9-4af5-c060-08dbc44a7515
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WRtnqTG9ALoFZB56j9BmLgT2rZTcrIP8Z479FXYJX3eiW/6+1M/ShgOkj+E66RSZ6ActCCxr/JhDnbxUalThFmZhZkFBoT9KkdVt/vJsl0BcXDerQAEEBM9mnE8va/evb9P2IphzBueWK2RB8zwp4IIiXdPi8cFDIVg+NHwdpsaF/TVzvjpTTtXW5nxfKEe/XA5zDRWOOFgQREIx6wtQeT+bLQRVxvkZH+vrkinIMF1zDCsOOj1grFoJkEH7mcSIzkFFiULiQ+5LHxCwPNAoQt0lRGw+HFkCobqxNF/ZzfojY5whD8C1C7KMQWHmj0nDcxC/GBre7unIZlfNJa43UzbjS7i45LJ60sRdfc+RO8ffcMyvDsmvzfbWvVbroewia1CdtkVLNTeenQHJOIau+G80frElzDZZJwXoTkd6lJHngvx312SLAyFTWO1ryaBgKpQ2n2RfvENse7W5YywYhl2p8sWY+vyWCRxTLhZlcUrq+K8PznS7DcwDGUglPOfJlJ46lwsgAsNiliZz0A6+IrQYJlEJoNfX6K6+02YOpgGicojIkjcVPhX+tTq2GoMYSntY/VoAVuR0CBkVp4fMUIgeDJLdtm8YX7/8gC30+/DGIIKrpCKqLBEZ2fUvHPUsZZh1oVvmQp7V01qXTRszTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(366004)(136003)(346002)(396003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(2906002)(6506007)(38100700002)(83380400001)(4326008)(6486002)(53546011)(66946007)(66556008)(66476007)(6512007)(54906003)(6666004)(2616005)(5660300002)(8676002)(8936002)(26005)(44832011)(478600001)(316002)(41300700001)(36756003)(86362001)(31696002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnlWNTFvckora1Y0ZlhMUlI3MW9rT2lqQ2xMNzFLdERjNWlLQ3RlOXhucUI3?=
 =?utf-8?B?Nnl3Q0xVZ0phZWxNNWhKYTZEamw5S2FJRmY2TlFpeFJIWlg2aTJMcHd0anRu?=
 =?utf-8?B?VDV4SHQra0xoQnRIZGZvYzlwa2xJNWFXeTViWDl5R01rT3h4K1NiVlRVM3NS?=
 =?utf-8?B?NWF6TnBXcUJReWNuci9mOW1CM0ZLUFBhbjh3NkJUd1JQbHlZKzBBT2hYM0hm?=
 =?utf-8?B?M2NNb3JPZmplVUFMeHo1elF5amE5RTh5TXF0aXpDZlR5R24rQUgvV0NZR2dD?=
 =?utf-8?B?c2RRcG53bjN0enBaQmsrbW9tUFlpbUZLZDBCcEVjck1vQ2VaNHhXZ2w2Zk94?=
 =?utf-8?B?WmJicFNVNVJKNlRJV0dSYkNxcmZsZGlvNnIwR1ZhVk9PR0d3YUgvRzdabk5E?=
 =?utf-8?B?ZHR0SDdnZWhjUjEvazdCSmRqRHVJbUJSR05DTlVRUlQweVJvOWRqdmVROEdm?=
 =?utf-8?B?L3BiWHIvVWhQOVlmTVNYaWFVK3AzT2ZkVTVZbnVsOXZ0bVFyOEdBQkVXamtC?=
 =?utf-8?B?NEJpd1A3cEMyenZNVEx2RXZpdENvTDA0OTFGR3VIQU10SHVzZmNZdlhRVW9x?=
 =?utf-8?B?VWFIbUpVeXlhNnhObU5MVVR6RlhLRDg0TUNPRDI1b2QxcGduUmI4blc1QWIz?=
 =?utf-8?B?UFhMeFZBb2xUaGtwM0tLNkZGOWlQK2x6dzRsRnRJYVdaYVZrMzRxWEljcCt0?=
 =?utf-8?B?M1ByUlU2a2M3K2I5Y0pMeFF0QUZNRHFvMTJNRm9BTU9ITzc2eGg1RzNWUXNm?=
 =?utf-8?B?Z2diTW85ZHQ1ZU44OWo2bzNoLzR5bHQ4Qm96YkZLUWNLYm9ZVTNISWJINDJn?=
 =?utf-8?B?TDgwa3ZCaGE2cmMzOVJvS2FKT2daajljblJPclhRV0F4eDRrdmhqN1lpWEFq?=
 =?utf-8?B?OVFsL00xQUIxK2x6QTVveGVSWFFWa0MrM1FtaUphQko0YVJ0c25kTXBUK1M1?=
 =?utf-8?B?MzNNOVNjWG5DME8xaldtcDNZbW53UlRSWGpjMXRFbnNvQmx0endrRC9kTVhF?=
 =?utf-8?B?dnB2VS9VWld6TnJMcndZa3B5c0diWm9SUHJwYzRvampGeWx4Z3R1SkN0bVQ5?=
 =?utf-8?B?SHJaNTUwcUxFNXpLb0F4SGxncjh3UUt5VDlyNWFQTzRCQXpTdEFNdWs3Z3Fs?=
 =?utf-8?B?NExCYUh0ZlJsRDBlOE5IdWpYdFBDTkdEUWRQNUpHcm8zdng0alM1VHBFOXVo?=
 =?utf-8?B?UklUekRERU1KS2FEbWdQWU83Y0FwZmlLaUhLMjFwZVY4andkRXdYeVJFMjVt?=
 =?utf-8?B?ekdIT0RTTnZucnlqUklQMzZ6WFp0aTdSbWkzQndZSm54QmwveU9sK3BKc0Er?=
 =?utf-8?B?TUpDRlR2QzQrSmN1VFZxQWlURm9ZaWRUelJhZnQ0Yld0OW44WXkxZWloMnRt?=
 =?utf-8?B?Rnc1UXJ4ekhQNXgwTWFqZFJONTNVZ21lamdWSHNGaXphek1mUUQ4SnpaUjBo?=
 =?utf-8?B?ZHczbU9wZXVmWWhuTThuUlNwMTNhQlNkWWZzQTliVU82dlQ2RnBiMDdLYjZm?=
 =?utf-8?B?azBSU0FYbVBMUk1OQVgxbDZDT1IrUmgvSlVRb2V4eS94NXRiMUN1ZUNWMmFz?=
 =?utf-8?B?TG4rRVRkNU82Q2NObXVubUcvckdhc2dUbVlQbXdGTVZRUVJ3SVJMQUtXcDdU?=
 =?utf-8?B?b2xReVJCNEdIRjZpMWdickdLVzYxMDM4Y2FTNjJKUXJJY1lTU3RtTnNmZjFq?=
 =?utf-8?B?RHh5NXltWmVySjAvZEw4NmFjOFY3ZnFrcVZvZUM0RGNhS3NqN080SnFlS3FE?=
 =?utf-8?B?QUdRQ29JU3ZtMjdZekVOOHlEV0JnajhFbDdIWlR3b1l0cmpOV3FWQ2FrY2ZS?=
 =?utf-8?B?dXJlbUNLS012K0RGTU1KQWhSdGVJOW9tZ3dpcjh5VE42anZsRHNMT0V5bnhV?=
 =?utf-8?B?NUxLdkY4OVAzS3UvQWo2dXR5MWNYTEVuWk9CQjhBSW1sR0pVUnhMblpQR0lw?=
 =?utf-8?B?K0hSRloyQm40cjlMOTEzTFFJc25DWjkxUGNXY1ErYzgwYjB0bDlCd1NhS1Zr?=
 =?utf-8?B?V0RNUmQxU2dXTGh6QTIzTTVVY2tkNXNmZ2FjVktkU3ExWndaaThqckZZVWxl?=
 =?utf-8?B?K0JNUEVoc0l6eUVHZWtOcTR5UVZ3M3ZtTlNZcTBVMHZrU3p6OWYwYnl1NjQr?=
 =?utf-8?Q?n8PyjKALna6lJu8ndHAiG000C?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3968ea49-91e9-4af5-c060-08dbc44a7515
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 19:53:47.5976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Bs+2yuN2zMQHDznVY1xfLOpXnbae4PQXGa+771IJmxFkJTE8sd70mYJivbTvGZGIF6bZYUxzwe717VaiFmrbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5209
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
Cc: Tianci Yin <tianci.yin@amd.com>, Leo Li <sunpeng.li@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-09-21 10:15, Sebastian Andrzej Siewior wrote:
> This is a revert of the commit mentioned below while it is not wrong, as
> in the kernel will explode, having migrate_disable() here it is
> complete waste of resources.
> 
> Additionally commit message is plain wrong the review tag does not make

Not sure I follow what's unhelpful about the review tag with
0c316556d1249 ("drm/amd/display: Disable migration to ensure consistency of per-CPU variable")

I do wish the original patch showed the splat it's attempting
to fix. It apparently made a difference for something, whether
inadvertently or not. I wish I knew what that "something" was.

Harry

> it any better. The migrate_disable() interface has a fat comment
> describing it and it includes the word "undesired" in the headline which
> should tickle people to read it before using it.
> Initially I assumed it is worded too harsh but now I beg to differ.
> 
> The reviewer of the original commit, even not understanding what
> migrate_disable() does should ask the following:
> 
> - migrate_disable() is added only to the CONFIG_X86 block and it claims
>   to protect fpu_recursion_depth. Why are the other the architectures
>   excluded?
> 
> - migrate_disable() is added after fpu_recursion_depth was modified.
>   Shouldn't it be added before the modification or referencing takes
>   place?
> 
> Moving on.
> Disabling preemption DOES prevent CPU migration. A task, that can not be
> pushed away from the CPU by the scheduler (due to disabled preemption)
> can not be pushed or migrated to another CPU.
> 
> Disabling migration DOES NOT ensure consistency of per-CPU variables. It
> only ensures that the task acts always on the same per-CPU variable. The
> task remains preemptible meaning multiple tasks can access the same
> per-CPU variable. This in turn leads to inconsistency for the statement
> 
>                   *pcpu -= 1;
> 
> with two tasks on one CPU and a preemption point during the RMW
> operation:
> 
>      Task A                           Task B
>      read pcpu to reg  # 0
>      inc reg           # 0 -> 1
>                                       read pcpu to reg  # 0
>                                       inc reg           # 0 -> 1
>                                       write reg to pcpu # 1
>      write reg to pcpu # 1
> 
> At the end pcpu reads 1 but should read 2 instead. Boom.
> 
> get_cpu_ptr() already contains a preempt_disable() statement. That means
> that the per-CPU variable can only be referenced by a single task which
> is currently running. The only inconsistency that can occur if the
> variable is additionally accessed from an interrupt.
> 
> Remove migrate_disable/enable() from dc_fpu_begin/end().
> 
> Cc: Tianci Yin <tianci.yin@amd.com>
> Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
> Fixes: 0c316556d1249 ("drm/amd/display: Disable migration to ensure consistency of per-CPU variable")
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> index 172aa10a8800f..86f4c0e046548 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> @@ -91,7 +91,6 @@ void dc_fpu_begin(const char *function_name, const int line)
>  
>  	if (*pcpu == 1) {
>  #if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
> -		migrate_disable();
>  		kernel_fpu_begin();
>  #elif defined(CONFIG_PPC64)
>  		if (cpu_has_feature(CPU_FTR_VSX_COMP)) {
> @@ -132,7 +131,6 @@ void dc_fpu_end(const char *function_name, const int line)
>  	if (*pcpu <= 0) {
>  #if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
>  		kernel_fpu_end();
> -		migrate_enable();
>  #elif defined(CONFIG_PPC64)
>  		if (cpu_has_feature(CPU_FTR_VSX_COMP)) {
>  			disable_kernel_vsx();

