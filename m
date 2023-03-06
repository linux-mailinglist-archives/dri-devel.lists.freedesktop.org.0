Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E8E6AD14A
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 23:16:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ABC210E345;
	Mon,  6 Mar 2023 22:16:43 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C641610E32E;
 Mon,  6 Mar 2023 22:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678141001; x=1709677001;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DB2u49YzKaS9sXpohyjA121a0QxN8+1VDwQjgPNrs2E=;
 b=A55OYaPgkaU3LezVP6CGJg1lvBXnp3TMlB7umOpSWX6OGbbJsTMcB+RH
 W7p2OxD/0nj4xRuR+LVb/yTO+PTDqcOL53N2nRxzdiAY45ix03BiUWYYr
 lE7bQUCTkNuPuHkNXlPKZqYR91A7MBQ15oVpYJRLXvTn/B5oXLDd9vszE
 NwDoz1iLG4COoyYYPjZfqMW4/xMV+toxaH7Xpr6h4Xe4h00QfUZ3HXdJE
 gF4gNebLKyJrvkPx08/S5orAE6inzo8+/HA6/JV4FTtoAU9A+K6ypNrUf
 1fYAmCywsea7AY+8HbgbZCtMgeRuDM2vyyo8SySGPKpOFLsKnWPulGjl8 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="316090887"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="316090887"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 14:16:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="786438253"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="786438253"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 06 Mar 2023 14:16:41 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 6 Mar 2023 14:16:40 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 6 Mar 2023 14:16:40 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 6 Mar 2023 14:16:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQcABJOJsBUZUleaDCOe4Rwv73ESyHN4qrHvZYUJne1QROKyD7fac+xhOd7Mc3rpT4+NlnOeJjmiitr1LzKC7wkhoSJmHWYxcxt7ibxbgR7ra0C5EhdXX/oZzbr1v2MOO3o52XrtIr76q4pdX/0YUG++ccR805tcopGBgONjLmTMbB15syrGWSjeFISBbRRUNeOh7bi6B4icDb394qgDMglLP8iZygG4FxzdfMJGYCMgd/E7DguIs3SiXkPmEq7tgDwmkoMBIHLFqvZy4fNOO10KAsH6swxH6vQx9/NLzHdGxM4g+OLsolpXXoMp6MYG5gyi63CDE+5OAnYyA3aiUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JxR6xuwtZE7gKB+CdMLZXvf+CqR1odUg74bp3ONCTRs=;
 b=NFYo/v8cj2QEMlWhILtGGc23KaO0Ks4NjGKv1hVS4geyr9RKeGw9dKH+3Cy0Zxmyen723yuind89O+AaQscRE46xBZiJISc9/2yju41AGQpww3ymvTam0LOU/A3gFAMrxUi3E5OOW7IN2U1p12G9FK/4Ay3ehXeqEtJPkNilTtQVGKUW8obdUwNzzhcikTqEd0XnFHtuZ1xKfGoMrCQIGTGAKnKpj0UTQJVwMdj4x9fk2UHAaSzGp+4kuGjmG0IR3Nr0UCRdjOL+FW5ofYdzu2wW2Lk7S1lCBhoj5/UC9BvWI7baupOiRgxB8iUx4Dtm3hVpVH+r6YRp/xjKUUe7Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 PH8PR11MB6878.namprd11.prod.outlook.com (2603:10b6:510:22a::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.28; Mon, 6 Mar 2023 22:16:39 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::218f:c449:80c8:7ad9]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::218f:c449:80c8:7ad9%6]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 22:16:39 +0000
Message-ID: <960fb76a-496e-8283-09a4-4ce11caef7eb@intel.com>
Date: Mon, 6 Mar 2023 14:16:35 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [Intel-gfx] [PATCH v2 1/2] drm/i915/guc: Improve clean up of
 busyness stats worker
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230217223308.3449737-1-John.C.Harrison@Intel.com>
 <20230217223308.3449737-2-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230217223308.3449737-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0238.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::33) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|PH8PR11MB6878:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f4a6883-0060-455a-0939-08db1e907494
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U7Qt/9wCLsT6x+YifA0zUtdBBUwid4GywVzOfqSXES4LtP5Aq3hPzFVbWbdIySRDINHSoRdI9dp2shMd7M7ZsnUX0/JlS6+OHGd+uwKUf29b+Xhp2G+KVf6KisYukqmz/3k6Q1GRaVjjlMtb2x+Y2Hpm/tMdXeBPaCxZwkYcgcrmgrRzjCYaleJ1MarWWoT5hOjlN/8yVkZiT2R4447d/QJnK3ydL0DgQjVogrgqXLspo8CGNI+UlffH0eoh3DYMIVBq8yfIUxK1/qlqcQN9MW+ziXBGQg+wyMn6n2hHT1RMROv8jCWt6L9LBfGw9EjfnQTvesqe/B/v7vY/TPyEAFv63V3LqlfIaLmvMkqgPc/uhIPFu5JeOijFU1Nqi/K5/sN4xsGgpnaGXanis4wOFkS55rOnP6Q0XuJ+wElBWC2ZT448fgm8zanSRu/rdyfu3CE1nU5zAEWDHhVxBVEmoIL2Z1vI7Xri5UzQtQRgk0mYN42OW4QigocoAW9C6+uBhP8aXJSxLv+iVBchZ+KQQwJlozzGLNtOlVujosVtdwQkncz/db2WU0ccJ06HWFFkFL641C2kyB218vpsvJdnTO1q7iavLRQYFCLqrSZlUpmZTqh2ONtaUQ0xfg860Oo/8I4r69UhQ09GiO2xX0aCfPIFeRCL72LYIuI9BBu5YASaUpl/67i7GLJAoGjHt7PLy1Z02NoUIa7ls+SzyBarQVFmUiz/bigY81WMed477/E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(346002)(376002)(366004)(396003)(39860400002)(451199018)(82960400001)(86362001)(31696002)(38100700002)(66476007)(36756003)(66946007)(5660300002)(2906002)(4326008)(8936002)(8676002)(41300700001)(66556008)(186003)(2616005)(53546011)(83380400001)(6506007)(6512007)(450100002)(316002)(478600001)(26005)(6666004)(6486002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHM0UjFhZEhlci94STA2Ti9NS2xoTzRNZkdDaGpGZDN2Vnk5a0crKy9hb1p0?=
 =?utf-8?B?VVNWQ2pCaUJxRU5TQ0NNSW1rRGtsTnVnSzBkeHNKZFh6OUJacXdKWUJGTEZ0?=
 =?utf-8?B?eU9sTWpXVlI0N1g3ZkI0SmhOVFFFYVR6c25rMUx6NU1xU0dhMVU2NFQxUHFK?=
 =?utf-8?B?ZGVxQVVHbGFFN29pcEU1RU14U0dZT3R6WXRRZHhheGNZRGhLQWNoOStmYjlo?=
 =?utf-8?B?anhNUHlLZE9hZ0xLbmUzeG5JMlA3YlJVSzAzN3FpL0IySHZQYlE5Yy9ZTElF?=
 =?utf-8?B?YlBrcWpGOXhQZ3IyeGhvalNnVzVTbWh5R0NUMFQxOUhSTlpGVm1WQU93NFhU?=
 =?utf-8?B?cmZ3eHZrdDAwR0pLeG1KejlFVVRhSE9iZlZVeTcrOTIrWHc3RVhuT2grNkpY?=
 =?utf-8?B?L01zTzhDUi8yMmp0ZkRYTThWS09abllxQmtVRkc4bndPL2NIaDJUbGpvQ1VW?=
 =?utf-8?B?ZWlvUUdaZGRpTnN5VEFTdjJETTZWaU5IWStWOXhlY2hHbDlPU2NDN09YbXZX?=
 =?utf-8?B?UFhnM0psZmo1RWc3bE9ueUR1L0k2NWx6ZUJEK1o5UExaS3pyM3k2N29vY2tj?=
 =?utf-8?B?bkJrRGN3ZlJlT2RpeE9JbURIblRkNnV3a2NDSHNKd1ZtMWVGV2tJNWhDNjZy?=
 =?utf-8?B?bloreGNjNUdaUmFRUVJRdGJnSStwTTBqMGVPbWNZT2lLeGJ6d0pMVjczRTB0?=
 =?utf-8?B?bG9YTFgvT0tSY0h3T2xVZWNJMm8wKzFoOTd0WjBBT20wcFlJZlBoUGpyenIw?=
 =?utf-8?B?V2ExTGtuWUZINmdSWVR0WmZraGQzRjR5eDlEdXZUcVhlczFEVW4yWGcxaysy?=
 =?utf-8?B?bG51a0V2cVBRZElaNDBzRXBGZWRya1pIWTJrcDNHOHQ4Q0VpQnhOc1F3RkdP?=
 =?utf-8?B?WFZTdHZPSUhob0htYVg5bVJGQ3htdk03Qy9oczFyY1o1aU95eGtPSDNkMzZn?=
 =?utf-8?B?bHdFYUVLVmpaRnB6amdUUXdEK05ZVGV2dSs4QjVZbEQwSUJlZkxmNU5PdGhP?=
 =?utf-8?B?M2U1UWpxTWk4MERLZGZQZktxMG5pTVFFQXdENWRuUWlWV1lOZXNBeGpaSWh1?=
 =?utf-8?B?SUlpRGtUQWRBQm5KS3BaWWxNOVIwejRkTW1jWVBxVUYrS1YzYlliUVo3NUlH?=
 =?utf-8?B?WHhTeVhqTXgreUFXWVZDRDJ5ZGpYY0UzSmF3SlJHNWxlMC83WWt6ZE9yLzRU?=
 =?utf-8?B?T2V3MFlRZmhDdm16TjJwd08rYXdJRUVkeTB6Y29wZFFxcXRkdVdBTTQ3Wk5C?=
 =?utf-8?B?aC9VVHc0NzBqVU1pRmphVkh4OGFwaFpBTnl1Y1RseVJranRiV3dXUXJabHZ2?=
 =?utf-8?B?SUlrazBDVm1iVkxvblc3ZUxzYXQvZ3U1djc4VXoySWJ3NFJrUWZDY0V1WFNQ?=
 =?utf-8?B?N1NTNUZ5NnZTR0ZMaUF1c252TTUrRUlDL1J3djRUbDNXdTdsVGFBVTVTaE11?=
 =?utf-8?B?SkN3NXlsa2J1WUF5VlFlRlg5UmNwdElVRE5rZ1JDcDBDZzhCa2g4RjlHYWVh?=
 =?utf-8?B?ODN0NGRNTzUwTG9wMmZvMi9jRS9KUGdlNEpzWndreHp0VlJhaGxweTk2dlJH?=
 =?utf-8?B?WmdRYlB1ZnkreDVHam1jMlZwQjJTVlZHbXJFMVFWSkwxakkwZmViOFh2c1Vn?=
 =?utf-8?B?TkZFZWJsWG5oS2FpNXJGRmxQK0U0UnNqRDU4TE5xM3dLL0Z0QVVzNCsrT0xw?=
 =?utf-8?B?OE9JTkJISkRoUVN4WnJKaGpMWHFLUjRwUGFZMzloaHFES2ppaUhPcFN5MVJC?=
 =?utf-8?B?K3diK0RDRXNMdDkrVGVpek1CVnhxaGFDeGpIK21wZ2NMUG9na1RCeGo2eDd2?=
 =?utf-8?B?NVNOdE4xc2x3ZEIva05MUjEvOHdJblBzU3ZZZER3dnd5eHE5UlRxQTVPY1Bs?=
 =?utf-8?B?YnI4VkV5TlJEU3AyZCtCUUZQeXVCQzVNd21lRW1VdmQ1VE1Xb29EQVUzRUFO?=
 =?utf-8?B?eEFvSkR5Rm5oS25HU2JBYlFzNHFJaWFkSlU3Um14dHBvNE9KelFhY1hlVlFF?=
 =?utf-8?B?V1NYcXdZM3pOMzArUjhjb0tGeVllZDF2akdXMDV2TTY4c2VjZDRSOVQzS1R6?=
 =?utf-8?B?QkozTXI0QUlzcHd4VmlCVC9uYWZLSE1Ib3JWMHdpaXk3RzgrN2RZS1VoK3U1?=
 =?utf-8?B?cnFGWVgxYjl6UzQreFVKYlVnb0dqVTBZNVg3QlpIM0F3T1BkSDBqRENuMHJW?=
 =?utf-8?Q?cefcZo9WHfnictCj9K2IHRw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f4a6883-0060-455a-0939-08db1e907494
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 22:16:38.8833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kjFm6eqjEHc2D5jnJMKS7ZSGJHMtoScTBAZJjcWzZzvrqNmaxzRjIddXMSLgmlHc0D/4jS7kydhRhvCZx8XLnVVarkX5aBsKtnB4vEyqxtc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6878
X-OriginatorOrg: intel.com
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/17/2023 2:33 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> The stats worker thread management was mis-matched between
> enable/disable call sites. Fix those up. Also, abstract the
> cancel/enable code into a helper function rather than replicating in
> multiple places.
>
> v2: Rename the helpers and wrap the enable as well as the cancel
> (review feedback from Daniele).
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 38 +++++++++++--------
>   1 file changed, 23 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index be495e657d66b..a04d7049a2c2f 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1352,6 +1352,16 @@ static ktime_t guc_engine_busyness(struct intel_engine_cs *engine, ktime_t *now)
>   	return ns_to_ktime(total);
>   }
>   
> +static void guc_enable_busyness_worker(struct intel_guc *guc)
> +{
> +	mod_delayed_work(system_highpri_wq, &guc->timestamp.work, guc->timestamp.ping_delay);
> +}
> +
> +static void guc_cancel_busyness_worker(struct intel_guc *guc)
> +{
> +	cancel_delayed_work_sync(&guc->timestamp.work);
> +}
> +
>   static void __reset_guc_busyness_stats(struct intel_guc *guc)
>   {
>   	struct intel_gt *gt = guc_to_gt(guc);
> @@ -1360,7 +1370,7 @@ static void __reset_guc_busyness_stats(struct intel_guc *guc)
>   	unsigned long flags;
>   	ktime_t unused;
>   
> -	cancel_delayed_work_sync(&guc->timestamp.work);
> +	guc_cancel_busyness_worker(guc);
>   
>   	spin_lock_irqsave(&guc->timestamp.lock, flags);
>   
> @@ -1416,8 +1426,7 @@ static void guc_timestamp_ping(struct work_struct *wrk)
>   
>   	intel_gt_reset_unlock(gt, srcu);
>   
> -	mod_delayed_work(system_highpri_wq, &guc->timestamp.work,
> -			 guc->timestamp.ping_delay);
> +	guc_enable_busyness_worker(guc);
>   }
>   
>   static int guc_action_enable_usage_stats(struct intel_guc *guc)
> @@ -1436,16 +1445,15 @@ static void guc_init_engine_stats(struct intel_guc *guc)
>   {
>   	struct intel_gt *gt = guc_to_gt(guc);
>   	intel_wakeref_t wakeref;
> +	int ret;
>   
> -	mod_delayed_work(system_highpri_wq, &guc->timestamp.work,
> -			 guc->timestamp.ping_delay);
> -
> -	with_intel_runtime_pm(&gt->i915->runtime_pm, wakeref) {
> -		int ret = guc_action_enable_usage_stats(guc);
> +	with_intel_runtime_pm(&gt->i915->runtime_pm, wakeref)
> +		ret = guc_action_enable_usage_stats(guc);
>   
> -		if (ret)
> -			guc_err(guc, "Failed to enable usage stats: %pe\n", ERR_PTR(ret));
> -	}
> +	if (ret)
> +		guc_err(guc, "Failed to enable usage stats: %pe\n", ERR_PTR(ret));
> +	else
> +		guc_enable_busyness_worker(guc);
>   }
>   
>   void intel_guc_busyness_park(struct intel_gt *gt)
> @@ -1460,7 +1468,7 @@ void intel_guc_busyness_park(struct intel_gt *gt)
>   	 * and causes an unclaimed register access warning. Cancel the worker
>   	 * synchronously here.
>   	 */
> -	cancel_delayed_work_sync(&guc->timestamp.work);
> +	guc_cancel_busyness_worker(guc);
>   
>   	/*
>   	 * Before parking, we should sample engine busyness stats if we need to.
> @@ -1487,8 +1495,7 @@ void intel_guc_busyness_unpark(struct intel_gt *gt)
>   	spin_lock_irqsave(&guc->timestamp.lock, flags);
>   	guc_update_pm_timestamp(guc, &unused);
>   	spin_unlock_irqrestore(&guc->timestamp.lock, flags);
> -	mod_delayed_work(system_highpri_wq, &guc->timestamp.work,
> -			 guc->timestamp.ping_delay);
> +	guc_enable_busyness_worker(guc);
>   }
>   
>   static inline bool
> @@ -4408,11 +4415,12 @@ void intel_guc_submission_enable(struct intel_guc *guc)
>   	guc_init_global_schedule_policy(guc);
>   }
>   
> +/* Note: By the time we're here, GuC may have already been reset */
>   void intel_guc_submission_disable(struct intel_guc *guc)
>   {
>   	struct intel_gt *gt = guc_to_gt(guc);
>   
> -	/* Note: By the time we're here, GuC may have already been reset */
> +	guc_cancel_busyness_worker(guc);
>   
>   	/* Disable and route to host */
>   	if (GRAPHICS_VER(gt->i915) >= 12)

