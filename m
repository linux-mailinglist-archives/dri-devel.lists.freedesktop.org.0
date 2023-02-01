Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB119686E3B
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 19:38:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8256F10E11A;
	Wed,  1 Feb 2023 18:38:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CCC210E11A;
 Wed,  1 Feb 2023 18:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675276720; x=1706812720;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zgT9FnMUfb/PjYOEvSf1cIbrXFmtuOr6ATltZG2Vaq8=;
 b=R696I61UCd2Jr4WJ4yqm4g7Cbt6j6PKXbzMF8R/zFETgu+mIkDLZ24lb
 slhO11pmdPAFy1t62y+HVt+JSZJtCl1VozLyKIOdqaXSgZRQLPbpaUpbi
 CekSgbk4M18TRxIm/Ti4aY+ejRbBJY9Pr76+E1DHVM45mB6V9/XwfN3a3
 MOAFD5yG/y3rkwe4yYx059/N7HphabWQ27uSKyPlyU6yfjhCGpD2PvlFg
 us+pHBZn9gVmV1ev3rIsHTKpfdTCanxlEWapWDCTCMTQYFW1CbBllKIbl
 3sz36n7/8rN+xqODDthCMHiQqrNIZaOpJYoaBBhkwhXe5NvqGm1SFGzYV g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="330369856"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; d="scan'208";a="330369856"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 10:38:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="910408688"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; d="scan'208";a="910408688"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 01 Feb 2023 10:38:39 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 1 Feb 2023 10:38:38 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 1 Feb 2023 10:38:38 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 1 Feb 2023 10:38:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DjI4tb+8Sle/8KgXTcYjKqDN/uKfC24fsSq1C/mUp5jzQrKsaU3suDdeBUx8Ou04UPalLtvEMdDOeVe42lhZhYvN75VaJwd7tH0hpFBtK316EuqasveHQkOECOCXzj2LVBwhGcd9bfoYGlHtahejA7CbJA5tTsSC732Mb7+fMpF7hqRR5mRCWr3Baoz7mn1Ebwy0GfiA/Uq8wCb86JmAyQ8Tpwprez1PCNCqtHGoQnvrrOIFMYODruuxjdj9sTTjuolczlgiDPGmFOPLxMH6a4VUOKGRdkMtDK1gBbixdbaj5asy6mCFgkl3wACmJjwUZfQfrGHP006yN9r4805Cdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBqzeYM3pKC/o6hMyILoFvdzGU7q014vsvVzGqHpFFA=;
 b=k5GuzKMe+h/Yh5z/FnkWW3Nj39Y51X/wstQT/9uKIKtfvGJyudDFqpjXe9E+d2I5OTa3wDZVNzKlRIRVn1jxD/PH2qptKIUa85lhiOpv8bnYVl5zSmSjOZFgOekxW63etG5fGqhsqdiIqJxvN4zkRuYq9vVIGIjI9vHBqxijQsZmMa50dAwy0axb167zFiIrT5EhKdgCb+DgvzN3uqu4G6CSZ5QNdN4AEMJxJMKpDnQp/yo84yPrf9lNEb3XOvmz2kgAIJrZMnYoozPdKt0E0rHyZs79GItNWrtkM6ZLwv+qYPpAUbVkjTmubEnJkI+jlKGA9HVyFGBqoEbbehQIrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM8PR11MB5590.namprd11.prod.outlook.com (2603:10b6:8:32::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.33; Wed, 1 Feb 2023 18:38:35 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::e1a3:6ad3:9f43:5f25]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::e1a3:6ad3:9f43:5f25%4]) with mapi id 15.20.6043.036; Wed, 1 Feb 2023
 18:38:35 +0000
Message-ID: <7aeb8cf2-aa85-07e4-0636-79b16aa4a7db@intel.com>
Date: Wed, 1 Feb 2023 10:38:33 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/i915/guc: Improve debug message on context reset
 notification
Content-Language: en-GB
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230131214413.1879-1-michal.wajdeczko@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230131214413.1879-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0055.namprd08.prod.outlook.com
 (2603:10b6:a03:117::32) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|DM8PR11MB5590:EE_
X-MS-Office365-Filtering-Correlation-Id: 20ecfc1f-6256-453e-d84e-08db048386b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OLIdIJfkvIYlb/tTt9NCltoRxKI1WDyoIjFurGouZycMcpg/Oov/wTRiWPUgAwv9NB6sEgCriGW72sr4X4E2W2bnhde/Cyq4TC9XP/v73OwG4q55ZujJEulYpN0GQzRapGLJja3NJYLSysxJckmYpQ15gruImNDjln/EOFSi49hwx60US2t/UxOi1DVSHZZzIWhcrQcgM/gzMJEVtGeePyLGIvM9mS7KvoGEeEoWvklKpxXohFEs3lZGqS4PZ1jRnEQuCFXENa+jJ6fmr2EA9ZOFvTqBVACR/0n0G4QYPAfLlDpZJfO5iCuGzYCSRISudH6S1WXrsvntpIkoSA7Lq5JGuwV9mgKGPaCSVJfwVC10aMu7cXgPVUmOD8zm1yw35s6IFbqiHm8KN9nW+RaqETLa74aOYeM05APag9a3acxQuNKCAzqc+gOJH+evYunfo/QWco8b30/K38EwSjrQMsWbJGnn8dsXhvmeD531BDtsuEPbc2yLMPN3Rsu/+e6/tVWdWKh84Ndac1snSRePKChcdOxDgWa59fu9tPvkJRa5iGSzuSsISU56MBbJIbuIfSn4ncDHJdpid1bYG+cl1YPgDbTtk4tR51sBTZXFgZWtZhqyUNMUdd7XmXdLFpAMzJkZbKpfw75Tg5+o5Zji5k5EC4krE4vm3X2WayVgGOXqHGTygl7NqUWga3d/tnQt5/NBe9uOkCepU3y9bqgM9qC3PtGXUBRywXZLmZ5bkps=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(39860400002)(366004)(136003)(346002)(376002)(451199018)(186003)(66476007)(41300700001)(86362001)(2616005)(26005)(83380400001)(82960400001)(36756003)(53546011)(38100700002)(31696002)(316002)(450100002)(4326008)(6486002)(66946007)(6506007)(66556008)(8676002)(478600001)(6512007)(2906002)(15650500001)(8936002)(31686004)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGpRdG55UGpTUG9qT3lnSHF6c0pvL2pZSitoNStYOUdnTExwVGw5bGd1WWQy?=
 =?utf-8?B?QjhxNVpxWWw5UndWbExRUHBZT01Wbzh1NWhBdThTSk5PNitWN0RBV0Vpcytq?=
 =?utf-8?B?azREZjkyM3BOWG5RN1NuckEzaFNMM2Y3TGRqOHRwS0JvWTJUakx1Q3hDTndU?=
 =?utf-8?B?czdMa0RkWUxRUlQ5RWdxdWpHZ0FXYzQvc05VUFRyQnEwNmxVcGNXT215WkhC?=
 =?utf-8?B?RmlBbmxlOVZqNERWT1FxWjIxRkM3QmQxNEd5SG1pLzNPWTdkS3oyRUJIUzNL?=
 =?utf-8?B?aUdPRHpyc3RWMkkxN0o1dnpjUU9BeGNyZ2Jtc01yYUxRSTRJdlNvemhmUUsw?=
 =?utf-8?B?bGVxc2pHS0NjKzN2THhyQVBIZjZmRzJzZGt3blhIM29ZN051UFZ0VTFLbmFa?=
 =?utf-8?B?V01xT2IxcmhVZUQ2TERoQU1QaXJmd1V0M2J5eXhZcUFqVk9QQXVJMzR1S09z?=
 =?utf-8?B?ck1Ha0dUamYxNXRwSU4xQzB6NTFLU1BQNXhqaUVoZTRIRVFERWRGSytHSUtM?=
 =?utf-8?B?YjM3RjJWS05zSk56ejBuWjVGK3J6UVQrMVhiL0UzN3BxMmZyRVhyNGROMkpR?=
 =?utf-8?B?Zk1TcUxuS3N2Y1pQTG5KWjQvN3ZZS2J3UUozMnpDZmt0T2pWcllJSDVIazRG?=
 =?utf-8?B?RFgvYVl6TGhCTUxmY1A5YWtYSWFpRTFVT25ucHZTOUNvTHAydGZOWFZrY0NC?=
 =?utf-8?B?V1Q0VjRrT0MxaXNNZDVManVKWXdBdUFQd2VEckVSQ0hiVi9DaUlZcC9nOHIy?=
 =?utf-8?B?eE9OM1RkZ29wazEzOHVWV2t5K0lPYmxYdGtqL2hkeUZ5TUxCdVpjSTNNRTdx?=
 =?utf-8?B?M09SZEpUbEdydjQ0a1h4V25jbkFEdEhlQnFHZXpHZURIem45WVU0cGU2ZDQ2?=
 =?utf-8?B?dCtoUVpCOFhzVmRORXhiWElGYkxYTGMyR1A0dlZXb2lXRkUrRGVYUjlLNjUr?=
 =?utf-8?B?YzFER0Z4ZDh5dFlwQUhaTzFZSnVWY2paYTEyR0lTM1A4eUFLcUNrMXdtZWln?=
 =?utf-8?B?eUxQb3REbEVWRi92RnNkZ09manZGRlpFcFpacXJodTlBK3hJdTNxMHh4Q3Av?=
 =?utf-8?B?c01USHE3NkM5a2FLa01HK1pUU29UZmlDZWxNRjA1eE4zOWg0Mm45YU42OHlU?=
 =?utf-8?B?c0xXMHUyRUhpSDVMdjBZeUcwZmJjaUw4dDdySXRRcnZSdlc3RFp5Nk5XSzNt?=
 =?utf-8?B?TGp1VWtMY1JFdEVUYm91SWU1ZkJmUzF2cE4yRzQzTS9SaHZmQU9LNXBRcHdu?=
 =?utf-8?B?TktsVDdETE5hSTBzTm9DeGFwSElxL3k5cXA5ZytVMC9QNkR6T1FGUVR5S1R0?=
 =?utf-8?B?aUJlbERXdkNKWTFGT0l2N1RNQjAxN3BFaS9md0dsdExsRGxVUzVMdUVFSzZw?=
 =?utf-8?B?M3RKZ0pCcjY1L0xNeFplNWRFWFpRRkQ1andzS0pqYzVBNHhhYU0wMDlTbENm?=
 =?utf-8?B?bjA5QlFIYU52TnJwbHAwZ00zRGkzOGx4RkFhbm52b0syUEljREpKdm5FeVVY?=
 =?utf-8?B?ZHVScjA3SDNVZ3BwbmNid0xoalFTYnltdUNEeUliaHFmK2dlN3dCcEY5UDJz?=
 =?utf-8?B?L1FIR3o2cloyOXhUV0M2VjJBYVJ6UE1oU1FCQjRpVnBqUUlMOHAzNUpLaDd0?=
 =?utf-8?B?WDF5VldxOFp4QWJsdFc0TSs2bGtVSnhaaTFkek5zMTZBejZoQXVBOG9Jandv?=
 =?utf-8?B?TkZWZXRXaE45U3ZFcDRuRE1La1pROU45aGFlTUpVQTN4NzFOQzVyNmNSWFpW?=
 =?utf-8?B?ekpwMERzVnF0ZjdIUzVJalI5V205S2dUdzVZZVNoL3lsa2pzMVdIZ0JnWVNV?=
 =?utf-8?B?Z0N1emMxQVZJdWkyN1FkVFRDU3JTVmppT3N6QnlVekZsU240WUtpOUhoWG01?=
 =?utf-8?B?b1V5TXBVcVpFSmdXdVVqbjJZK2hBODJCUlZLQ2dWOFprU1BTV2pIcWl3aGxW?=
 =?utf-8?B?Nmgva2J3Z3NYTlQ3YnpsY2QzYkpuVUF5ME5RWXlGVmtQdUF0QkRhOXZwTWhm?=
 =?utf-8?B?MkQzaHdMOEpXcGphVEExQWprK3MzblY0TFZpUDFlbGVvVFZPRXFCK1NqUjdW?=
 =?utf-8?B?Ly9PenJVUmtoaWFtYk9UUlpMNTdFRHBmWENGL05UTjhDcUZmRDF1OHFnRFY5?=
 =?utf-8?B?Umd1YTVHSzFoRGpkQVF6NGpaUE90NVhRZU0vYlFIYlJuZUZ4Rmt4azNRWkFa?=
 =?utf-8?B?a0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20ecfc1f-6256-453e-d84e-08db048386b2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 18:38:35.2026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qm8CBF6cJzI3FJoy9oh/5Ebm8wh+BZLufSTEjUwdpikTc5DHgwFpDu34Qkb++APOJ6S5mMMh1/KTlE5rJNkyG4xa4V6f32MlmB6vGe8BNbQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5590
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/31/2023 13:44, Michal Wajdeczko wrote:
> Just recently we switched over to new GuC oriented log macros but in
> the meantime yet another message was added that we missed to update.
>
> While around improve that new message by adding engine name and use
> existing helpers to check for context state.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 53f3ed3244d5..be495e657d66 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -4660,9 +4660,10 @@ static void guc_handle_context_reset(struct intel_guc *guc,
>   {
>   	trace_intel_context_reset(ce);
>   
> -	drm_dbg(&guc_to_gt(guc)->i915->drm, "Got GuC reset of 0x%04X, exiting = %d, banned = %d\n",
> -		ce->guc_id.id, test_bit(CONTEXT_EXITING, &ce->flags),
> -		test_bit(CONTEXT_BANNED, &ce->flags));
> +	guc_dbg(guc, "Got context reset notification: 0x%04X on %s, exiting = %s, banned = %s\n",
> +		ce->guc_id.id, ce->engine->name,
> +		str_yes_no(intel_context_is_exiting(ce)),
> +		str_yes_no(intel_context_is_banned(ce)));
>   
>   	if (likely(intel_context_is_schedulable(ce))) {
>   		capture_error_state(guc, ce);

