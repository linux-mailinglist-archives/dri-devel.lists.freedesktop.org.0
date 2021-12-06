Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0427146AB39
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 23:09:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D2976E02B;
	Mon,  6 Dec 2021 22:09:28 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A65A6E02B;
 Mon,  6 Dec 2021 22:09:26 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="237228450"
X-IronPort-AV: E=Sophos;i="5.87,292,1631602800"; d="scan'208";a="237228450"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2021 14:09:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,292,1631602800"; d="scan'208";a="563002891"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 06 Dec 2021 14:09:25 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 6 Dec 2021 14:09:24 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 6 Dec 2021 14:09:24 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 6 Dec 2021 14:09:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k+6cvinKzzHhGvh0WgpMOtZCkwIdK7Z1yROiEpBRjib2B9KPbcslmv+X5gxGTd8C9zkuQKHj1BHnv/mB6r8YDIokV8bbJJ7xhls2RWD7ukdtgb1+TTIOCqBbsOmrwxsMFTGoAcT5zqsdX6XqWS236m7Xyi2FNHLa222jSLgdfKe6jZId7cCXQu+jChZB2PRLggpEp36Uh4ZTuTPiIWYgkSftfRWyv6sa3UNQrtKKTxgrKGB1NKCmnTn1MVfM7piIyhU72RI4UpYL1/auGGa3Er41bBAvhrFEA4jPFIWN89u+LHJUpGa+AL4QbwW/K6PskIvou0F3P5hij44hlib5Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rmt5bRKthPWpKFJm+Q+gTAYZA2oGXqn9OIIcaj9YrH8=;
 b=VlcoCgKcLGSx2cYuGcEVeZDyTenZC/KGcqG0mIZse3jO9KNBd375IvmSkBHEiIjYEGtzRS2Ltb9Tsp51qp3PP05d3tLcPBDlwTPQXgVGTpeMvWrqsPeKu/t73aw3zYfMBFzt0bzNkXh4jLcCub85o16xRMXzKd2+45mtgbuVPPdMKIEpVQoVN7PsfR3mwuJXWrgvVxT/VY9hpwIoM4x7d7RTY7yc7us5Wmk19d3YRHpz4113QJgZJuWMcPd/fs1ey2EqAS0bxuttus3EZKcHx45xNFk5BzDmFIXGOVvGyfuuxWfIYpgnwfYdjDIF9URKrBpR0JfAbJqtcXxgcue5hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rmt5bRKthPWpKFJm+Q+gTAYZA2oGXqn9OIIcaj9YrH8=;
 b=fDajVuMYuoKxNexUcJwQ8b4FuPErTCryEqfnbmatgA0Sn3GJxLAq6gXGjYD4NaCVJYJy3VRzfIOPvr8sdYu0XjjjxVQqqkRtBskA7BOarhxjLbvIbMVWaj72Ysw3mXbwJlQwGc5Sg3oRPF5dRJV2Dgpker/YMGXIaFEiaR+FtRM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM6PR11MB4577.namprd11.prod.outlook.com (2603:10b6:5:2a1::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11; Mon, 6 Dec 2021 22:09:23 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::d91a:c903:855e:5f24]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::d91a:c903:855e:5f24%4]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 22:09:23 +0000
Message-ID: <ca8617f6-390e-9cd8-587c-7d01638c089a@intel.com>
Date: Mon, 6 Dec 2021 14:09:20 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: [Intel-gfx] [PATCH 1/5] drm/i915/uc: Allow platforms to have GuC
 but not HuC
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20211203183339.3276250-1-John.C.Harrison@Intel.com>
 <20211203183339.3276250-2-John.C.Harrison@Intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20211203183339.3276250-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:a03:254::11) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
Received: from [192.168.1.65] (99.72.232.53) by
 BY3PR05CA0006.namprd05.prod.outlook.com (2603:10b6:a03:254::11) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Mon, 6 Dec 2021 22:09:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e16b1aa-a0ae-4402-47c6-08d9b9050f3c
X-MS-TrafficTypeDiagnostic: DM6PR11MB4577:EE_
X-Microsoft-Antispam-PRVS: <DM6PR11MB4577D81CFB12C73009212EB7F46D9@DM6PR11MB4577.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fA6CPzXYrhgXbp9fce6ASYtLj/MAJc+9BdGJcYOleDG/uIGO6Y+BdelK164es9TT7Zn4b74eVKyAWYMqsvmrVZIn+e3wbKioPxhyfDeRUinPIhODUKE/cI3YyvD9uf9kxQjuy3R0DfX6JgR8BWjoLeE02zxk8lcXBU8TwXus24i2uJimRTYjVZChoF0P/2Ulh/kqgJS8ezh9Ji2D+S2IIESb0qvV5ghPm9zSb65iOFpX8USnPGtaArRPlZMqbI5MjcuwdeqV7fwsbVWiu5qiwmL+0SDZxrSDL2rB4iBwPbntHkGQltsrduOkQF87WYI40Mg3BkMSR8LxhaaJwG7W0T/08yuv1NpwalGCB11iw7LiohsRIOQnI5lFYnExHjlz1ab9mTOpjCpmASpGA/GqB8MAzhR6fX+IUUH1ePV0LmC4Ckbrv/cZR4y8ligpTjiQd2LANQTKBd2O9w8YLgPsi7FVJUiT/dh0Eq60cpL96H9OB8pQj1EW1oTqWV/b0F7wdRsZNGvR3EFg/b4EyTmNz3SAZYcBW2IX74tvvMMcI2LFM+wlMgtTfq0j+d5+f3+DM+rW/Cmx1ZBUOZYwOiPO0mqghIsy6CXayORRxn5fFbwUymwYy1TNMc/s7WQ9fxvFexLU8KZ0GFxxZ/Wc4lZSm+cfgqijP/Q6GOUG5dyDsIlqNlOJDr54YuV77J3mN4eN8nNE/MHOcqyza/r1g5u8sdxM80AdPb0jp8K4sWfQ6Cc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(8676002)(4326008)(2616005)(53546011)(450100002)(6486002)(5660300002)(2906002)(31696002)(66476007)(26005)(66946007)(31686004)(36756003)(508600001)(82960400001)(316002)(86362001)(8936002)(38100700002)(956004)(83380400001)(16576012)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1NwOUk2QlAwempzU1F5TDRaK2J0eloxL0hjaUhaT0hmL1VCNG5nSmllRnI3?=
 =?utf-8?B?TU5TYWdjVjhUL2NIeWxlVDZweFR3anR1UVpuMmNCc3VPTHR3bFJUSlhjdk9X?=
 =?utf-8?B?WHhFUGdoS1dJZGwrMC95VHArN282eTlNU2pqcm1hbmlLYW5qYlZlSVBuamlC?=
 =?utf-8?B?TXhYaWlTNm1UeWlGakJqWklUUHNFRS8rdU5NVHpubXFqNTJqVnEzUDJ3cVN1?=
 =?utf-8?B?Y2todjZKSUVnRDFaNjJlVU5mamxVMCtoSkN3WDJ2ZTVadHJaRVl5SS9Dclky?=
 =?utf-8?B?YnBWcncyS25CS2pOSFNzTlZZRndZdHB4bWMvaWJ3UzVWeVhUUVpzNU5qN1ZG?=
 =?utf-8?B?TG9YdmpuQjFPWENtaDcrQ0ZETzMxNlkwQitZL2VPdHczc1BJRWdrdWp3TmZ5?=
 =?utf-8?B?SzhGU0NycGlsOU9qY0Roay9QQVNVeEVROUtSNGU5N0hUeDZrNmUzRWxFU1c4?=
 =?utf-8?B?cm5UKzVIT2w4dEdSYnM0MHZLWmdLb3ZhSURWc2JFeWcxU21aODlaSW1uT3lP?=
 =?utf-8?B?K3dLeFJWN2I2NzJSUEhSVkNXdWptOVByTlBXUC9XTE1ndUhVUXc1VFhPUDhs?=
 =?utf-8?B?NzhLZVp3ZjllNFJrZ1NmcDFLVk54SXJRYWFZaEduK2U3S1dyRVlEcXplZW5U?=
 =?utf-8?B?NEsvcFlBRitGTzBTMlJWaWZLR1J0VU5mM2pjWXc3c3g2dEJmUWhyZTcwdWtD?=
 =?utf-8?B?VndJaVJBaXNQd2hnbmxNUFIrQUErTTBCSVJUMVIyOWRKczVkT2kwcWc2Ky9p?=
 =?utf-8?B?Q1JSL0s0K0FoUkVRejBodnRDVnU5QllsTEhpZjdwQ2d2cTFEWGdBOERDeHk3?=
 =?utf-8?B?UUMxdFV5Ty94N3JKT0dvK1NCZnV3NTlOQVBMazZQRFpSaTNDWkpaeU4vQTVT?=
 =?utf-8?B?M0xEWVcvdXJlU1kwUUM4ZFJ6NGFWeDFKK1RvQ3FBaXBwbGpsUkVoYmdhSGta?=
 =?utf-8?B?UHJoaVV6Z244dnpXZ0QrR1RFK3Qra1Zqd2FSOC91U3BWMWozODBqbFFJaGVa?=
 =?utf-8?B?RnArcTZsNDdGSm9wODR0UzNUZm5YZzVRandjYzFaTDFTTElNS1BKNnVMS3Jx?=
 =?utf-8?B?UkN2VTRUSkZkVzZRbTFLYzR2bGpmeWJ1WUNHQjRaV0EwMXNqbjR1d3I1amxa?=
 =?utf-8?B?TnhPSDRyUGt3T3Nnam5lRkQ5NzVlRHdqQnRsYTVZZnNjTU1RSnBIR0QwQUZL?=
 =?utf-8?B?U3ByN2R5WHhlNW5sSXpBT3J6YWVjNE9FNDN2M3Bya2pnRkdWMzRZalcyM0F0?=
 =?utf-8?B?K3VQMWpPVHBUYUN6VjNpWm0rLzVKVGdnUnkvYU5ubUczZU5DZlN2NXRIN0th?=
 =?utf-8?B?U0JSVXducC96cWRnZWZCL0lxczRiTXozTDR2TFczMmpTWG9aQlhFa0NCS0c3?=
 =?utf-8?B?K0xYVW9EclVRd1IxajA0c0xWZUF6R2tmajFMc3M4M0Vyejl2YVhBOU9XMWRz?=
 =?utf-8?B?Q2lhMFgvSUF1eCt4dUhKUytpMmZBbTRubjBkaUNIMHBDNjNrbUlET1RiY2RN?=
 =?utf-8?B?TUk5N28zeG1Rem9mYnMzR1p5NFAzMkM1WHhOLzNYdHAxWWFrdytCQy9yZTV3?=
 =?utf-8?B?UUdWTzlYOXZ6WFdPK3ptM3FvZkNIdnZQNnpZOEVQY3pwR1pBWXBTeHVFS1cz?=
 =?utf-8?B?YUcrUDJyYnN2alpidUxrMUhMYmFBZUNQVGU3elNVejR6TS9oMDJrdkR5TnRR?=
 =?utf-8?B?RnMzdnIvT1FWVldBNTNPbGl6dURtRmNPeVMyMkhJbE4wR3pKMkxwVVl3ZFJW?=
 =?utf-8?B?VHl5Nld1dmpQTHRSVEZ2SEl3dUlLUW9QbjJNUW8zNjlEVzZhSDlVeks3b1NZ?=
 =?utf-8?B?Nm5nSFNROHhOazdGQWFMVmErcG5tcDRZYys3U0MxaGJ4ZXErd3FQczVldjFr?=
 =?utf-8?B?RUFpSkRlcVlrSW5TMU43SEdjK29TTkZjVEtBVU04Z1ltWFBpOElueVQ2ZXhh?=
 =?utf-8?B?L2pXVi95TWVaN2tYcGdmSm9uNFhsWmhuTlZFbE9EYkNXN0EvZzcvR2tyZTBw?=
 =?utf-8?B?U0h2YzVkQnlzL0NHU2Y5NWpOV3B6Z3V2RzhiTXRjZjdNWFFJR1hPMXhrekQ4?=
 =?utf-8?B?Ti9uV29QMlk1VEV2K3hsa1VESnFMT2F4WEJKbDJoWGUyVEJGbTNxaytOYVNO?=
 =?utf-8?B?TWJwcW1qVGtiZE9CeVR2L2J6Mi8vVG5RcWpKYy93OG1qcDlrSlFMQzNKTCsr?=
 =?utf-8?B?OGFhL2xXVFpjVklVT2dEOTJLZ1pERjR2RVJVbVRmaWE2Njl0TVUzeE5OTkZE?=
 =?utf-8?B?ZXhaclMyd0tkeWRlc1cwRnJzRFZBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e16b1aa-a0ae-4402-47c6-08d9b9050f3c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 22:09:23.3875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9MUxF0QdqNvhZP/dfwaUHYzH/zngxOHndDSUNc/xuKBlMOR9740yXzcMO0fh31LVu7hqcSmsqLMGzrEyf+LGIRn+mPTuAO3n8u7Q4Zbwq2I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4577
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



On 12/3/2021 10:33 AM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> It is possible for platforms to require GuC but not HuC firmware.
> Also, the firmware versions for GuC and HuC advance independently. So
> split the macros up to allow the lists to be maintained separately.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 93 ++++++++++++++++--------
>   1 file changed, 63 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index 3aa87be4f2e4..a7788ce50736 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -48,22 +48,39 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
>    * Note that RKL and ADL-S have the same GuC/HuC device ID's and use the same
>    * firmware as TGL.
>    */
> -#define INTEL_UC_FIRMWARE_DEFS(fw_def, guc_def, huc_def) \
> -	fw_def(ALDERLAKE_P, 0, guc_def(adlp, 62, 0, 3), huc_def(tgl, 7, 9, 3)) \
> -	fw_def(ALDERLAKE_S, 0, guc_def(tgl, 62, 0, 0), huc_def(tgl,  7, 9, 3)) \
> -	fw_def(DG1,         0, guc_def(dg1, 62, 0, 0), huc_def(dg1,  7, 9, 3)) \
> -	fw_def(ROCKETLAKE,  0, guc_def(tgl, 62, 0, 0), huc_def(tgl,  7, 9, 3)) \
> -	fw_def(TIGERLAKE,   0, guc_def(tgl, 62, 0, 0), huc_def(tgl,  7, 9, 3)) \
> -	fw_def(JASPERLAKE,  0, guc_def(ehl, 62, 0, 0), huc_def(ehl,  9, 0, 0)) \
> -	fw_def(ELKHARTLAKE, 0, guc_def(ehl, 62, 0, 0), huc_def(ehl,  9, 0, 0)) \
> -	fw_def(ICELAKE,     0, guc_def(icl, 62, 0, 0), huc_def(icl,  9, 0, 0)) \
> -	fw_def(COMETLAKE,   5, guc_def(cml, 62, 0, 0), huc_def(cml,  4, 0, 0)) \
> -	fw_def(COMETLAKE,   0, guc_def(kbl, 62, 0, 0), huc_def(kbl,  4, 0, 0)) \
> -	fw_def(COFFEELAKE,  0, guc_def(kbl, 62, 0, 0), huc_def(kbl,  4, 0, 0)) \
> -	fw_def(GEMINILAKE,  0, guc_def(glk, 62, 0, 0), huc_def(glk,  4, 0, 0)) \
> -	fw_def(KABYLAKE,    0, guc_def(kbl, 62, 0, 0), huc_def(kbl,  4, 0, 0)) \
> -	fw_def(BROXTON,     0, guc_def(bxt, 62, 0, 0), huc_def(bxt,  2, 0, 0)) \
> -	fw_def(SKYLAKE,     0, guc_def(skl, 62, 0, 0), huc_def(skl,  2, 0, 0))
> +#define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_def) \
> +	fw_def(ALDERLAKE_P,  0, guc_def(adlp, 62, 0, 3)) \
> +	fw_def(ALDERLAKE_S,  0, guc_def(tgl,  62, 0, 0)) \
> +	fw_def(DG1,          0, guc_def(dg1,  62, 0, 0)) \
> +	fw_def(ROCKETLAKE,   0, guc_def(tgl,  62, 0, 0)) \
> +	fw_def(TIGERLAKE,    0, guc_def(tgl,  62, 0, 0)) \
> +	fw_def(JASPERLAKE,   0, guc_def(ehl,  62, 0, 0)) \
> +	fw_def(ELKHARTLAKE,  0, guc_def(ehl,  62, 0, 0)) \
> +	fw_def(ICELAKE,      0, guc_def(icl,  62, 0, 0)) \
> +	fw_def(COMETLAKE,    5, guc_def(cml,  62, 0, 0)) \
> +	fw_def(COMETLAKE,    0, guc_def(kbl,  62, 0, 0)) \
> +	fw_def(COFFEELAKE,   0, guc_def(kbl,  62, 0, 0)) \
> +	fw_def(GEMINILAKE,   0, guc_def(glk,  62, 0, 0)) \
> +	fw_def(KABYLAKE,     0, guc_def(kbl,  62, 0, 0)) \
> +	fw_def(BROXTON,      0, guc_def(bxt,  62, 0, 0)) \
> +	fw_def(SKYLAKE,      0, guc_def(skl,  62, 0, 0))
> +
> +#define INTEL_HUC_FIRMWARE_DEFS(fw_def, huc_def) \
> +	fw_def(ALDERLAKE_P,  0, huc_def(tgl,  7, 9, 3)) \
> +	fw_def(ALDERLAKE_S,  0, huc_def(tgl,  7, 9, 3)) \
> +	fw_def(DG1,          0, huc_def(dg1,  7, 9, 3)) \
> +	fw_def(ROCKETLAKE,   0, huc_def(tgl,  7, 9, 3)) \
> +	fw_def(TIGERLAKE,    0, huc_def(tgl,  7, 9, 3)) \
> +	fw_def(JASPERLAKE,   0, huc_def(ehl,  9, 0, 0)) \
> +	fw_def(ELKHARTLAKE,  0, huc_def(ehl,  9, 0, 0)) \
> +	fw_def(ICELAKE,      0, huc_def(icl,  9, 0, 0)) \
> +	fw_def(COMETLAKE,    5, huc_def(cml,  4, 0, 0)) \
> +	fw_def(COMETLAKE,    0, huc_def(kbl,  4, 0, 0)) \
> +	fw_def(COFFEELAKE,   0, huc_def(kbl,  4, 0, 0)) \
> +	fw_def(GEMINILAKE,   0, huc_def(glk,  4, 0, 0)) \
> +	fw_def(KABYLAKE,     0, huc_def(kbl,  4, 0, 0)) \
> +	fw_def(BROXTON,      0, huc_def(bxt,  2, 0, 0)) \
> +	fw_def(SKYLAKE,      0, huc_def(skl,  2, 0, 0))
>   
>   #define __MAKE_UC_FW_PATH(prefix_, name_, major_, minor_, patch_) \
>   	"i915/" \
> @@ -79,11 +96,11 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
>   	__MAKE_UC_FW_PATH(prefix_, "_huc_", major_, minor_, bld_num_)
>   
>   /* All blobs need to be declared via MODULE_FIRMWARE() */
> -#define INTEL_UC_MODULE_FW(platform_, revid_, guc_, huc_) \
> -	MODULE_FIRMWARE(guc_); \
> -	MODULE_FIRMWARE(huc_);
> +#define INTEL_UC_MODULE_FW(platform_, revid_, uc_) \
> +	MODULE_FIRMWARE(uc_);
>   
> -INTEL_UC_FIRMWARE_DEFS(INTEL_UC_MODULE_FW, MAKE_GUC_FW_PATH, MAKE_HUC_FW_PATH)
> +INTEL_GUC_FIRMWARE_DEFS(INTEL_UC_MODULE_FW, MAKE_GUC_FW_PATH)
> +INTEL_HUC_FIRMWARE_DEFS(INTEL_UC_MODULE_FW, MAKE_HUC_FW_PATH)
>   
>   /* The below structs and macros are used to iterate across the list of blobs */
>   struct __packed uc_fw_blob {
> @@ -106,31 +123,47 @@ struct __packed uc_fw_blob {
>   struct __packed uc_fw_platform_requirement {
>   	enum intel_platform p;
>   	u8 rev; /* first platform rev using this FW */
> -	const struct uc_fw_blob blobs[INTEL_UC_FW_NUM_TYPES];
> +	const struct uc_fw_blob blob;
>   };
>   
> -#define MAKE_FW_LIST(platform_, revid_, guc_, huc_) \
> +#define MAKE_FW_LIST(platform_, revid_, uc_) \
>   { \
>   	.p = INTEL_##platform_, \
>   	.rev = revid_, \
> -	.blobs[INTEL_UC_FW_TYPE_GUC] = guc_, \
> -	.blobs[INTEL_UC_FW_TYPE_HUC] = huc_, \
> +	.blob = uc_, \
>   },
>   
> +struct fw_blobs_by_type {
> +	const struct uc_fw_platform_requirement *blobs;
> +	u32 count;
> +};
> +
>   static void
>   __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>   {
> -	static const struct uc_fw_platform_requirement fw_blobs[] = {
> -		INTEL_UC_FIRMWARE_DEFS(MAKE_FW_LIST, GUC_FW_BLOB, HUC_FW_BLOB)
> +	static const struct uc_fw_platform_requirement blobs_guc[] = {
> +		INTEL_GUC_FIRMWARE_DEFS(MAKE_FW_LIST, GUC_FW_BLOB)
> +	};
> +	static const struct uc_fw_platform_requirement blobs_huc[] = {
> +		INTEL_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB)
>   	};
> +	static const struct fw_blobs_by_type blobs_all[INTEL_UC_FW_NUM_TYPES] = {
> +		[INTEL_UC_FW_TYPE_GUC] = { blobs_guc, ARRAY_SIZE(blobs_guc) },
> +		[INTEL_UC_FW_TYPE_HUC] = { blobs_huc, ARRAY_SIZE(blobs_huc) },
> +	};
> +	static const struct uc_fw_platform_requirement *fw_blobs;
>   	enum intel_platform p = INTEL_INFO(i915)->platform;
> +	u32 fw_count;
>   	u8 rev = INTEL_REVID(i915);
>   	int i;
>   
> -	for (i = 0; i < ARRAY_SIZE(fw_blobs) && p <= fw_blobs[i].p; i++) {
> +	GEM_BUG_ON(uc_fw->type >= ARRAY_SIZE(blobs_all));
> +	fw_blobs = blobs_all[uc_fw->type].blobs;
> +	fw_count = blobs_all[uc_fw->type].count;
> +
> +	for (i = 0; i < fw_count && p <= fw_blobs[i].p; i++) {
>   		if (p == fw_blobs[i].p && rev >= fw_blobs[i].rev) {
> -			const struct uc_fw_blob *blob =
> -					&fw_blobs[i].blobs[uc_fw->type];
> +			const struct uc_fw_blob *blob = &fw_blobs[i].blob;
>   			uc_fw->path = blob->path;
>   			uc_fw->major_ver_wanted = blob->major;
>   			uc_fw->minor_ver_wanted = blob->minor;
> @@ -140,7 +173,7 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>   
>   	/* make sure the list is ordered as expected */
>   	if (IS_ENABLED(CONFIG_DRM_I915_SELFTEST)) {
> -		for (i = 1; i < ARRAY_SIZE(fw_blobs); i++) {
> +		for (i = 1; i < fw_count; i++) {
>   			if (fw_blobs[i].p < fw_blobs[i - 1].p)
>   				continue;
>   

