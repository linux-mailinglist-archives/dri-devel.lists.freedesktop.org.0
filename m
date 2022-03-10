Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B484D530E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 21:24:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C43E10EA25;
	Thu, 10 Mar 2022 20:24:47 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33F710EA12;
 Thu, 10 Mar 2022 20:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646943885; x=1678479885;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=idkF7O/X2TEIdyw86a2DpLDh/3oUPTSfTJ87STeCa5I=;
 b=PZuqqYuWnkqR16BSxxIC7bmO2MXnF79AFuqytyEkn+SdDkCc+u1EVw+E
 5Eb6bfwMVtyrlQXEM/foRk57qKmeUftS/ySINLFwHkbSenkGqPrm2bKgp
 oz7qsLgm2DafxV4mjIhqFS9vYpsDWBx8tzsHg5XjW8KUa3GnTMDrAs28i
 sRFgCYOL6V1YGqgc21j6wa191ICZfnG/w1PpTeVjY+Wct2k6s/ksRgCQy
 Ukky9aRExfQkSAKf23J3HYo6asK4Gt1nElRkWgFJ4sb0L3ds5qrQ6acII
 BZFF1gnWB+FZNgHxGBwV6ZY6iCwnoGRsF4L06Sp+pX1OeMIQRbD2asApt Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="252936932"
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; d="scan'208";a="252936932"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 12:24:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; d="scan'208";a="688801793"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 10 Mar 2022 12:24:44 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 10 Mar 2022 12:24:44 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Thu, 10 Mar 2022 12:24:44 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Thu, 10 Mar 2022 12:24:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I2Ae6XyJ856bq9rwj2PMUVRQlUnEzcRkSg4LoR3D/KECf0zpElBWmOOlp+JRv0/CeBcEtpC/F4RRBxXla3YdUZccPIyJjiiHkZCDgNsHRhoYHdZpsKObyp8kHDTpp78DsRK8igfMrku9oud0W1kEHfnHLgkDgY3/tO3YwHyQu8hI+KGr/DOetWpqnQeZ9kwC6/gCF87Ek6uPjo0YHCo0gzikDwPjdM/IJ0YRHB5wq38yYPWtdlRnfzfa5KKqsVVm9zr28ajGyjnbKy4b5jfISlMt/PlMfDjtGl3sgH31346VzbE0Ey+/13xUE91JSdWeY7Tnqq3x5od0hM1UMZsW/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kLuXGOarSEyPFARFgdUD/gDCsjvTJ3iXUX6+T1OHpeI=;
 b=OEk3FnlvWnWngspbS8ZMWt3r8HhEfrLuNzLHmUgfqThiXazlFpFFiJSxZXEsGNJ+luD4VQr0QrOdyGS/RQCViUk8wJTlZ92Nv69uICxc5UhtCWTF794y+p4AI1BymMY3+O2xQSUAG5+M3rBkHMjwPKWy0u1H/ngI2B9xFgIcG5a3Qil1X5M6nfp5xTjhCVUAc5svV6E6BXkpE4be5HkPqvn34H7KOkFZmDia6fs82iFJtm2sJIHJiJkO4FZlZk2Jr4kxyjM2QCs9RnjTRPgnzJ+veUPMaj87/WUI85F5jvfy6WFbsrfhAlBOPbBOdYWQWiDupz1uP7nZXl/gnrykcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BYAPR11MB3608.namprd11.prod.outlook.com (2603:10b6:a03:b1::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Thu, 10 Mar
 2022 20:24:36 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::21e6:3fe8:e859:75b5]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::21e6:3fe8:e859:75b5%7]) with mapi id 15.20.5061.022; Thu, 10 Mar 2022
 20:24:36 +0000
Message-ID: <98d7ab11-e47d-e642-96b7-b7643d19611a@intel.com>
Date: Thu, 10 Mar 2022 12:24:33 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.2
Subject: Re: [Intel-gfx] [PATCH v3 4/4] drm/i915: Improve long running OCL w/a
 for GuC submission
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220303223737.708659-1-John.C.Harrison@Intel.com>
 <20220303223737.708659-5-John.C.Harrison@Intel.com>
 <71a0f9af-7473-ece9-dae8-bcc1c3b55cf5@linux.intel.com>
 <991c5d38-7904-dff8-e610-c4030e526e2e@intel.com>
 <6f61e906-8149-6b39-c1ec-1b44f1bb3ca5@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <6f61e906-8149-6b39-c1ec-1b44f1bb3ca5@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CO2PR18CA0053.namprd18.prod.outlook.com
 (2603:10b6:104:2::21) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d2137fa-0cf3-4dd9-cd68-08da02d3fec2
X-MS-TrafficTypeDiagnostic: BYAPR11MB3608:EE_
X-Microsoft-Antispam-PRVS: <BYAPR11MB3608451A046CA961A33CB98ABD0B9@BYAPR11MB3608.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NhHdAUG3+MozNoVqDp09wTTX88tqs0kswm0Kmj5jo+8/cQOHQ5/vsWj97Qj7osB4LVvg5hCr2Fvbc/KlbJG65qWoZilo1OMAnivDF79S/fkV/+8gdlCmOKyezQQEmhVySe+Uf5G2H1SWmSCkX5PnmQalrSd+oo4gPpEVu4xgN65seZoTG8rAuuiEId83BQYLr6J7bX0QXaIYy0/CEe4I1k2Eyz0NZwwIRfZbrkkS5xP1L2bVNdFvXAo7uYAEUBEhfr3R1emYqPL/uysWpB5bV2WhTqmUPnwyNiT1bTW/dngI/yEP67aG/d1bbz+5iPhrmp413KHj73s+dfTUnyi/Ziu2MU9JfIYq1j3zLKQgjNZSxXk1mdzP22xoMdrQ5w9V4DtVmIQdkHNKYwAPKbUUharbg3qCdClK1gZAJMmZF/d1DHhkuG63aobqyHUIVg5UzHsjzmSPqVg3GFOqJxybPMM5sCLINxVFg/gzi48JJYl0UV/2GA9ASiMeMJIUMW6lyGU17Ud3jm2X2Z+f+LgY05SpWSVfVBnFLXMg6HGUkst4FFhfB7vbu48/xHZBFxRlbd+9aTCODMBeWj0uJMeUeDPOfy9mAkg9lCvhHG4vTCPFOZd008H4bkvUYWA7CN6Da3a2sTyw7C+Dh03RwnTiwUJnzgvHkzLZ1m2uF6nMI/G3osmTjyV32YLlX40gwo6MxWdEzZiLq+T+rBfwR8PrVKju0WmqdMpYI1Oo1+yC9icJtFbLqZzanD1Kv4hSigbL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8676002)(186003)(316002)(83380400001)(31686004)(4326008)(36756003)(31696002)(86362001)(82960400001)(2616005)(5660300002)(66946007)(53546011)(6506007)(6512007)(26005)(38100700002)(6666004)(6486002)(8936002)(508600001)(66476007)(66556008)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTNQSDZTeHhHbEJCVXR0dklMRzY4QkJxZVhLZlA5T2xYalQvOEdkaUdDcmJ4?=
 =?utf-8?B?ZzQ1Q1QwbXE4VnBtd0kycE5KWEM5TmtTdVlXRWxqNlRycy9rN0ExK3MrMDMx?=
 =?utf-8?B?UFVyb3NMd3I3aThqejFHZ1lGT2pzc3RTYWtKQlQ0eHlwbU9pa2EwOHlrcVZw?=
 =?utf-8?B?YjdBM0VPUkx2NjNGci9nekZYcllLMFRqVG8xWURaTTNRa2s1Z0VGei9lVDhW?=
 =?utf-8?B?THVlcWI1VU9PbDMxSmFqWUE1VjZ0ajFGZklMMXZxanlxNnZ1Y1Rvdll0dEJh?=
 =?utf-8?B?RFRGY0NrSEtYRDVNVnRmVDdRS014VGJCQ3NKV2Q1ZzZFV2UzUVlWcmRDRUI3?=
 =?utf-8?B?UkdPTE52dXJ5YzlFRVFGQnB1OGRZTEdmaU0wSmplaXhyS1dBQWJWbVJYbkRa?=
 =?utf-8?B?aFR5amt1M1FwV1g5a3NiRkhGa1lUTXpnVEZMY3hkaTlCSmZnTDVLU1BPbTE0?=
 =?utf-8?B?RFFDQlpZUlcyeVZ6WDYrVS94d1FoNTBwV0JqdGUwcXpHa2pNV0JoYmgzVlRK?=
 =?utf-8?B?TnZtSXZ1NmdVM0FiWHAreVhnRXp4alg4ZUpsbHdBTGs2eFBJTjRWV21FQW9U?=
 =?utf-8?B?SjM0UDVvdjFFVkpBcG13cS9aOFR6eVQ0MkdmOWpocnJ4eWtmak1seTdvKzRL?=
 =?utf-8?B?VHVSZlcyZ1RUOG1jYW8ya1BLUmNjME1hZmlDRlYzb1FJRkZlekJLOXN4amhC?=
 =?utf-8?B?UHR1bnRnZHp1UjM3SU43c1dYUWdRaGRVVVZ6bUJCMlR0WE5nbHZIc0pmY3dB?=
 =?utf-8?B?RHo4cDQxbE5Zb05lRlpWYWU2TXprYmJRbUVaS2lJOTd2SE9CTWNSZm5NQ1FH?=
 =?utf-8?B?RXd6cTlXSWZXRlN4cWxuZWVjNXNROWxKbGduVHEwcTFZdGoybURxaExONDk2?=
 =?utf-8?B?WHo0RU1iYkMydFE1aGJ6ZWgxOEltOHltNFNteXZDaW5HaEpSNm1XVHdaS2VV?=
 =?utf-8?B?R0RmbDJ0M1VPZnh5ZE9oY3lpUTFFYzVMR1dBTmRZd2lleW5IVHAyWmFLTkVr?=
 =?utf-8?B?djZZMS9uZHNjRUtkM24xdjV0V2VwQnM1S3RuSkVaOUozRXA1aHpiMVZmbTlm?=
 =?utf-8?B?bFpYN2Y1dGE0TlFXTk9aVnNQWFpoRjcvVXFEbndZdzh5QkhmUytlTGphc0VY?=
 =?utf-8?B?dExOWm1wWGwyM3JLZFFyWFVUNGtISmFXT0FmMnRyRkd1YUl6U1BDMTNlTUJX?=
 =?utf-8?B?S3pxUEEzZUpHSmJyVUVBTjYzLzBiT0NIa3A1cWFFUEdHRFZXdnVQbHk4bXVY?=
 =?utf-8?B?VHc3UTJoMTBpQkRzTHIwbHNmUjFlYnUreFhPbzdPY0ZxZmtOZ1RuY2g2REdN?=
 =?utf-8?B?cFlpMm94V25CbXVxNWdQVThxa1RwYUtMNGpKMVpuWWg4RWVkNFBSanBrekVZ?=
 =?utf-8?B?M0k5bFVQVGUyREZoOW5HRmt4aFRRNk0wSkdibjBNMWlIRWZNZjdBMllkVWtS?=
 =?utf-8?B?cXQyNUV5YVlVcFdGMkxCNFRMSUhVTmg2Nm1qRitGWkhSRkNsckJ2Y3loVlhJ?=
 =?utf-8?B?Ynk5bUpveG1JMzJ6T3AwSzdSSmd2Yk4zaHA0VTNvNWJadnVTdG9halozT2E0?=
 =?utf-8?B?RUxFbmxJNHJqWDBIaWdITndwNUVFYnR1RUpBT1d1OG5ZdC81N0FQRk1Sbnc1?=
 =?utf-8?B?L2ZOQ2RYaVBhcWphNStOemNSN0l2WEZTaXJRTDNRdnJiK05SN0hBaHpKcElk?=
 =?utf-8?B?YVJpUGhieml2RVBTWlR3S241VXROeE5PaWh3TmpYdWoweExDazZldjQ3VTI2?=
 =?utf-8?B?c0FIMDAzeTY5RG8xcnBKSnRCeXFpczM0b293ZlJFQVZQUzBiTlFtZkc5aGt3?=
 =?utf-8?B?aGxIV0xLVkhxVHVrMEJKNGMyRno1TkFPUnJ4SjNDRCtrdHRIbjR2aG1zbVl3?=
 =?utf-8?B?SGQ4UVNlcmU4aE9CK2IxUGdSK2ZsNmxEVHJOVnppZk55WGg4U0c4R1BYc0cx?=
 =?utf-8?B?NUNWVkRjRFE3MjFtUTNxU1gxMWQ2Z00rSkx5WE9HNGFFMnlIMzNqQ3YxYjFJ?=
 =?utf-8?B?amJwNVBFU3BLdXlBd29neHQ5R3FuZjltT2hvMDArNnZiMHc2ZG5iTmZhcEUz?=
 =?utf-8?B?SmwrT0k1TnM4Rk9mVFBacTFPSG9EOGxiOGVVSWxZZWNwa0JTTTdmVWFVb0F0?=
 =?utf-8?B?QUw4UnlvcElQYVExVHErWHE1WmF2QTRpNEdtUldGRzZtUW1vNFg3cGtuQjBH?=
 =?utf-8?B?dTIzT1ZoeHVyS1QxUXZZb0I4dWdOVEYwRk9FUHRYRjA4cms0UVBBbkh5Q1Fi?=
 =?utf-8?Q?XyxaBIKSGWJ2CnyeDUSq3z+UPpWokVvu2cuuFF3eWE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d2137fa-0cf3-4dd9-cd68-08da02d3fec2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 20:24:36.3287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y+pEBxgbZIGVLOJaDLZTUJH4dS7SGz0bHfF0J0hwUAjx6YTlfSK26rJU1l1mwxMTkNs+mZ2JHf51mS8J8I1DsMeOjPNTTc/T30cyY3sGn+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3608
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

On 3/10/2022 01:27, Tvrtko Ursulin wrote:
> On 09/03/2022 21:16, John Harrison wrote:
>> On 3/8/2022 01:41, Tvrtko Ursulin wrote:
>>> On 03/03/2022 22:37, John.C.Harrison@Intel.com wrote:
>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>
>>>> A workaround was added to the driver to allow OpenCL workloads to run
>>>> 'forever' by disabling pre-emption on the RCS engine for Gen12.
>>>> It is not totally unbound as the heartbeat will kick in eventually
>>>> and cause a reset of the hung engine.
>>>>
>>>> However, this does not work well in GuC submission mode. In GuC mode,
>>>> the pre-emption timeout is how GuC detects hung contexts and triggers
>>>> a per engine reset. Thus, disabling the timeout means also losing all
>>>> per engine reset ability. A full GT reset will still occur when the
>>>> heartbeat finally expires, but that is a much more destructive and
>>>> undesirable mechanism.
>>>>
>>>> The purpose of the workaround is actually to give OpenCL tasks longer
>>>> to reach a pre-emption point after a pre-emption request has been
>>>> issued. This is necessary because Gen12 does not support mid-thread
>>>> pre-emption and OpenCL can have long running threads.
>>>>
>>>> So, rather than disabling the timeout completely, just set it to a
>>>> 'long' value.
>>>>
>>>> v2: Review feedback from Tvrtko - must hard code the 'long' value
>>>> instead of determining it algorithmically. So make it an extra CONFIG
>>>> definition. Also, remove the execlist centric comment from the
>>>> existing pre-emption timeout CONFIG option given that it applies to
>>>> more than just execlists.
>>>>
>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>> Reviewed-by: Daniele Ceraolo Spurio 
>>>> <daniele.ceraolospurio@intel.com> (v1)
>>>> Acked-by: Michal Mrozek <michal.mrozek@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/i915/Kconfig.profile      | 26 
>>>> +++++++++++++++++++----
>>>>   drivers/gpu/drm/i915/gt/intel_engine_cs.c |  9 ++++++--
>>>>   2 files changed, 29 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/Kconfig.profile 
>>>> b/drivers/gpu/drm/i915/Kconfig.profile
>>>> index 39328567c200..7cc38d25ee5c 100644
>>>> --- a/drivers/gpu/drm/i915/Kconfig.profile
>>>> +++ b/drivers/gpu/drm/i915/Kconfig.profile
>>>> @@ -57,10 +57,28 @@ config DRM_I915_PREEMPT_TIMEOUT
>>>>       default 640 # milliseconds
>>>>       help
>>>>         How long to wait (in milliseconds) for a preemption event 
>>>> to occur
>>>> -      when submitting a new context via execlists. If the current 
>>>> context
>>>> -      does not hit an arbitration point and yield to HW before the 
>>>> timer
>>>> -      expires, the HW will be reset to allow the more important 
>>>> context
>>>> -      to execute.
>>>> +      when submitting a new context. If the current context does 
>>>> not hit
>>>> +      an arbitration point and yield to HW before the timer 
>>>> expires, the
>>>> +      HW will be reset to allow the more important context to 
>>>> execute.
>>>> +
>>>> +      This is adjustable via
>>>> +      /sys/class/drm/card?/engine/*/preempt_timeout_ms
>>>> +
>>>> +      May be 0 to disable the timeout.
>>>> +
>>>> +      The compiled in default may get overridden at driver probe 
>>>> time on
>>>> +      certain platforms and certain engines which will be 
>>>> reflected in the
>>>> +      sysfs control.
>>>> +
>>>> +config DRM_I915_PREEMPT_TIMEOUT_COMPUTE
>>>> +    int "Preempt timeout for compute engines (ms, jiffy granularity)"
>>>> +    default 7500 # milliseconds
>>>> +    help
>>>> +      How long to wait (in milliseconds) for a preemption event to 
>>>> occur
>>>> +      when submitting a new context to a compute capable engine. 
>>>> If the
>>>> +      current context does not hit an arbitration point and yield 
>>>> to HW
>>>> +      before the timer expires, the HW will be reset to allow the 
>>>> more
>>>> +      important context to execute.
>>>>           This is adjustable via
>>>>         /sys/class/drm/card?/engine/*/preempt_timeout_ms
>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c 
>>>> b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>>> index 4185c7338581..cc0954ad836a 100644
>>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>>> @@ -438,9 +438,14 @@ static int intel_engine_setup(struct intel_gt 
>>>> *gt, enum intel_engine_id id,
>>>>       engine->props.timeslice_duration_ms =
>>>>           CONFIG_DRM_I915_TIMESLICE_DURATION;
>>>>   -    /* Override to uninterruptible for OpenCL workloads. */
>>>> +    /*
>>>> +     * Mid-thread pre-emption is not available in Gen12. 
>>>> Unfortunately,
>>>> +     * some OpenCL workloads run quite long threads. That means 
>>>> they get
>>>> +     * reset due to not pre-empting in a timely manner. So, bump the
>>>> +     * pre-emption timeout value to be much higher for compute 
>>>> engines.
>>>> +     */
>>>>       if (GRAPHICS_VER(i915) == 12 && (engine->flags & 
>>>> I915_ENGINE_HAS_RCS_REG_STATE))
>>>> -        engine->props.preempt_timeout_ms = 0;
>>>> +        engine->props.preempt_timeout_ms = 
>>>> CONFIG_DRM_I915_PREEMPT_TIMEOUT_COMPUTE;
>>>
>>> I wouldn't go as far as adding a config option since as it is it 
>>> only applies to Gen12 but Kconfig text says nothing about that. And 
>>> I am not saying you should add a Gen12 specific config option, that 
>>> would be weird. So IMO just drop it.
>>>
>> You were the one arguing that the driver was illegally overriding the 
>> user's explicitly chosen settings, including the compile time config 
>
> This is a bit out of context and illegally don't think used, so 
> misrepresents the earlier discussion. And I certainly did not suggest 
> a kconfig option.
My recollection is that you clearly stated the i915 driver should not be 
overriding the user's settings. To me, that makes any override an 
illegal operation.

You did not suggest a Kconfig option but the settings in question are 
all coming from existing Kconfig options. Putting an explicit "timeout = 
7500;" in the code is the worst of all worlds. It is an override of a 
user setting and it is an unmodifiable magic number. The first you have 
stated is not allowed and the second is one of the biggest no-no's of 
any code review. Magic number randomly splatted in the code? Nack, do it 
properly.

So in this case, I don't see that there is much choice except to add a 
new Kconfig option for the override.

>
>> options. Just having a hardcoded magic number in the driver is the 
>> absolute worst kind of override there is.
> >
>> And technically, the config option is not Gen12 specific. It is 
>> actually compute specific, hence the name. It just so happens that 
>> only Gen12 onwards has compute engines. I can add an extra line to 
>> the Kconfig description if you want "NB: compute engines only exist 
>> on Gen12 but do include the RCS engine on Gen12".
>
> I am not unconditionally against it but it feels it creates more 
> problems than gives solutions.
>
> In kconfig help you say "compute *capable* engine". Here you say only 
> Gen12 has compute engines. Well before Gen12 render is compute 
> capable, but then how implemented it does not apply which is not good.
Sorry, yes. For some reason I was thinking compute came in with Gen12.

>
> Given the runtime override has the only purpose of working around 
> broken hardware then I'd still say to drop it. But if you can come up 
> with help text which won't be misleading and still not overly 
> complicated I am not opposing it.
So "when submitting a new context to a compute capable engine on Gen12 
and later platforms"? And maybe add a _GEN12 suffix to the config name 
itself?

John.


>
> Regards,
>
> Tvrtko

