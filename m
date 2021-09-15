Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3134340C7EC
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 17:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1772C6E958;
	Wed, 15 Sep 2021 15:12:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A0346E957;
 Wed, 15 Sep 2021 15:12:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="220471425"
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="220471425"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 08:12:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="553336039"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 15 Sep 2021 08:12:07 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 15 Sep 2021 08:12:07 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 15 Sep 2021 08:12:07 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 15 Sep 2021 08:12:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gZScfA0+OIWDHxySCHNYFYZ79SUvGIJ0g72+SX8DGaWu20DybcHLaCYJbW08XdEo6b6bcXc5DY6RGDSLnWWWXS73Vz+TvgL38JGFLfVfza8siQhtDrYoRAP/rwsZDCOvoxlXcr5MXOyRFoJPxgcOauHr+zaJCOAc5Ci7nJw9f859ZiQf4+dtDnvKmFA5lTBVOhV0F0CdzV8WIBXIOZBZ6Sho/t6Ps8opQfFMbsav3OxNr/4sl9waEi1MuzENa6rpPP2CnS2/bIkwl4TYJAJTjS/coNRbjo1Qi93dSvuf4hcLjKPEOpzKTeSAngOHHiFnGp+LQb3sfmRejPCqFk2Ztw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=8Enwp+qbA60EBccow9XAlIHQojXaPLtLpFbCFqsnB/s=;
 b=kYgag1EjODTfFG4fuQE5TqP94Na9Zwrpb1UgsuDuWQncKLOEgBBuCPChzGYXs0v87Au50qfxWLlLfNF/DGludk4diWL3fGcf6uXA14xbkoceQ7pSftnVm9QenvTU4PsAtkXupTl/0ie+ZuK0Flvxr9n0Mac5y/6fA8BbSN9RirpG0u5g+QDBCZtyC3ZCOitGjpfikYpK9rG4aTw7YwKgyaH/kyLHewaN9mripgmQu0VdZsNgaOQcp8MtOI/rhKORwmJlW9MNrbxRplW/wZf7P3IAK4jtVmDkX0cF+v4Q+GS1P6INY/DEhNiTSJvb6mgCMAe7WAGlIggADmvjcEvG8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Enwp+qbA60EBccow9XAlIHQojXaPLtLpFbCFqsnB/s=;
 b=OU7IhOwvqA9tg6f/m3amzlocCddyLGqx/bzGMKTT7jwbSe4Qd3X9rmcy+BCGEMyI686+9Rhy0PkIW1B7so35QnqYRrVuWV0QzODzRZUqfSbDN1xtUkOx8rcecPuDGFBDKov0NDZXE1E5gypZGmuLlHezfIbUGafIC8/ka6sh07A=
Authentication-Results: chris-wilson.co.uk; dkim=none (message not signed)
 header.d=none;chris-wilson.co.uk; dmarc=none action=none
 header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM6PR11MB2890.namprd11.prod.outlook.com (2603:10b6:5:63::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14; Wed, 15 Sep 2021 15:12:00 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::450:6ab1:b0a:a165]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::450:6ab1:b0a:a165%8]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 15:12:00 +0000
Subject: Re: [PATCH v9 12/17] drm/i915/pxp: Enable PXP power management
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "Huang, Sean Z" <sean.z.huang@intel.com>, <Huang@freedesktop.org>, "Chris
 Wilson" <chris@chris-wilson.co.uk>
References: <20210910153627.1060858-1-daniele.ceraolospurio@intel.com>
 <20210910153627.1060858-13-daniele.ceraolospurio@intel.com>
 <YUD0Zo590QmMiHOS@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <c01fe2ab-2431-0767-7c55-6881e0a31aa1@intel.com>
Date: Wed, 15 Sep 2021 08:11:54 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <YUD0Zo590QmMiHOS@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: DB8PR06CA0029.eurprd06.prod.outlook.com
 (2603:10a6:10:100::42) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
Received: from [192.168.1.56] (2.236.112.29) by
 DB8PR06CA0029.eurprd06.prod.outlook.com (2603:10a6:10:100::42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 15:11:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba4f2647-68b5-4eeb-fd50-08d9785b2a5e
X-MS-TrafficTypeDiagnostic: DM6PR11MB2890:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR11MB2890CB2B77DF5C056AF0EE8AF4DB9@DM6PR11MB2890.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 22/JH+T4TjaGPcKdzUwHd3IQhTr7LhAsQoH0T6Scbr07sT8LM2LDgZGcqe6PSL+NEbHtT7vyEMr1OgORtNjo+ntP4u8qif//N6GuCmlhY4lv1laRKG82j2uAjpU/rWZJwbmQ+aaxdA5hrIFlPGDclG8iM/A3U+sIDD9fRWGr2zg1wXbRoX8LSvOTkwszjtBY3h/VONVvK3WxM/kE9YN/NxuxeAm00sfS3OoZqyftvHSeFbE4j5ChzrbmH3+Ox4QVHpLa/zR0o3GmJl30HBlGIzHxg4jtTLS4ad0otXQ0LiFs1Q/saFIjvraarTZCDkL8hntvozfPpQH6ebOBkF2JW3t3091iO531lMPhO4fwwCkZ4j3Ofas6M7BVCsADcSj3+/aBGUUZcSFOPySuKj3g/kiecAPB1Jl2jDTfkmf98/nSJVmpSzteRRzcFwrd2y9zJ6x+UvgzBas7pni47P8xJmYyxVTczMUrF8mB8DvzDPVruLIWgjkxPF9Pa870tdF+P1EDlPWi7DImVeVtQiK+7IXtlI+K+1NdoCsH+bhyJmzPjNgE4Oitk2eSwUidhocRlgLFjR6B1gebFWPYd+AyKGzLEqHHEBiimc3rnUFTZ4aHdvxHlybvh/RZLrvrcSXyr0wsvjvMBZNR7PA7fIiVfBn1f3W/qohKDpXXpZvK9sIzDp44O02BnMtaegSTFSElyDUzmm+cc49hzKxbQFQmQeB+/pcZQBFx84wT2a7KV9E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(38100700002)(6666004)(66946007)(66476007)(66556008)(30864003)(31696002)(8936002)(37006003)(26005)(956004)(53546011)(31686004)(6636002)(6862004)(2616005)(478600001)(54906003)(316002)(2906002)(186003)(83380400001)(5660300002)(4326008)(16576012)(86362001)(8676002)(6486002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWhZaGhZZTU0VHpSR1JNbGdtdGxZSXVIVjlya1NISkZLTEZTUkJCcktkdUty?=
 =?utf-8?B?VFJXRDdpRUFqeHN1aldhUzRnMSs0R2Z1UzI5NTArU1pqZUZqUkxMWlBUajU0?=
 =?utf-8?B?TU5GUWF4bEdiVWNMR1JJZlo1MjRPVkE3NlhtVzkzSTYxalI4UERlYmJ4dlhF?=
 =?utf-8?B?MHhzOEttWStFRS91M1NVUEYwVWo2S2NLWXpzNGUyTXBoaEI5eDZzaDloajF4?=
 =?utf-8?B?ZWVaTHgyOXBpTTMxMjJoMUozWGY4WW1oRWpkaDRvaGxmcnFLWEdiYVBNZzBW?=
 =?utf-8?B?K3J2ZlFWV2Q2YjQ3cHNYeStUVlpZLzRsZVZKQ3Z6SXZyZksvTUsvUzUzRjB1?=
 =?utf-8?B?MmxKTENPQ2p4eklwcG5TbXFteTNWdll6Z2NlcC92QzB2M2Y3SmNlR3MxUnBi?=
 =?utf-8?B?TXNqLzlROU4velZkeW80cHh0clFHeWtpcVJUS2dOYThWbmtPVmhkTHdUTlVm?=
 =?utf-8?B?bklzTExKbnlWQ1NNeG13YTBkTU5jQ2pCbk82bER2elhGZmhjOHZxV2M4SUNQ?=
 =?utf-8?B?NFNMYTZHS1R5QkVMb25uTkJzZkVhd3hqeU91UDZwY1FRSzd4WjU1OW1XWm9I?=
 =?utf-8?B?VHREN0E5TkZNbU1tbkpJWmNYWlMzczN3RWdFMGwwalNTVk1tM3dSS2FMSGN2?=
 =?utf-8?B?Sm5hRXRaU3FUc1d6cjMyVHI3Uk1abElGenRJUzZGM2ZUTm5hdGs4MXJWVmI5?=
 =?utf-8?B?V0NwSUpCSitqUVYxckVpZUtlWUcyQWZQcFdydS85Z1ZGdHk0NzdhYzgwWDIx?=
 =?utf-8?B?ZXBqcEIxODRnUm9aWVAzenEzYkhJOHZBVkxWbFZLQnNNQWJtN2dEN3p2M05I?=
 =?utf-8?B?enFlTHVXTmlEODRyY0tWRjdKTTFvclVrbm5NSWI3cjY1VlM2RkdyNjJMc1J0?=
 =?utf-8?B?dGFoWDZqK2ZnbkxieVpQZ1BubEovWlltQUlTY2FZODROWnB2S2FzQ3JyQnBJ?=
 =?utf-8?B?d1VkT0hmWVdSK1phb3owbXNxV2NUazRrb1U1R1psQWZKV1dMS0laeTZuMDBH?=
 =?utf-8?B?d3VadElMWkFsOGRKOEtUdzhHN3hCVzJSK0FDd1VCaEc3eXhTSGV6TXV3Z09R?=
 =?utf-8?B?SndXVk5UQkJ4SGtmQWlOU1VwYUUvOHRhcDIwSlFuS3dJSVVsMC9mc1M5dFJG?=
 =?utf-8?B?UlgzNFRmbjhTVUs1alUvTU5Bbml4N3FDajFRcm5WOU5FWHVMRGdzRXgrVnJF?=
 =?utf-8?B?d1o3c3NtRmNTWFkvNUwwbGcvMkJ5VTBIQTBJSDc4SlkvTzRLbU5OZTRlS2dx?=
 =?utf-8?B?UGhIcnZyMWM0UVIxczVVVmpKTmNhaDlWNGZBREZhTFhYbHBxVmNnRmtxZzJE?=
 =?utf-8?B?V2RsWFEvdHNFMmVKckNXem81b2VmV25uZ09KWlFkcWxoWTlIKzBvdnJHSHU1?=
 =?utf-8?B?RXhuOWZodVEyaW9kVXhiYjEra1lXWGk1Q1NKenNhc29IQWRlUVFmQXFyQ3BM?=
 =?utf-8?B?S3hVcHdxVnNneHJCakxzZEFyNFRoMjNpcnFZWGN2MndQQ29nOE5FOERsQk1P?=
 =?utf-8?B?UjNpb0VXUmpicThwbE0zeEdQRkVDVWtIb2RUdzhPRnNYak5jRElFelNsMElp?=
 =?utf-8?B?S0xDRWk3azNOMVd2elJyVE41L1AyQjV3Rm1TU1Z2YzdRazJabVp0dmRwUzM2?=
 =?utf-8?B?STkrcWw1bE5rZE8rWE1oR3RzRWFLMXFZcGhWclozT0t5TlNwM2ZhUEIxVUYw?=
 =?utf-8?B?Vi9aeS9zWmdyOWhmSi8xdnZ1MENWWnp5Nnp3SDdzd0NOKzNOMnZ1Wnp6ZmtT?=
 =?utf-8?Q?GIMgyU7R6Xvuw0c+KK1W/cxXAVzgO4MY43w8eMd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba4f2647-68b5-4eeb-fd50-08d9785b2a5e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 15:11:59.8986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vouuCJpBT3NIqQc9KH03rEZEiQSxHnOMBgeXPXvXNnYBZzRxrDN+KUfFyz5Diuk2EhPPmRt2GU/67W07XsdIkW8D7E2w72dCyhqaJQ180fk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2890
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/14/2021 12:13 PM, Rodrigo Vivi wrote:
> On Fri, Sep 10, 2021 at 08:36:22AM -0700, Daniele Ceraolo Spurio wrote:
>> From: "Huang, Sean Z" <sean.z.huang@intel.com>
>>
>> During the power event S3+ sleep/resume, hardware will lose all the
>> encryption keys for every hardware session, even though the
>> session state might still be marked as alive after resume. Therefore,
>> we should consider the session as dead on suspend and invalidate all the
>> objects. The session will be automatically restarted on the first
>> protected submission on resume.
>>
>> v2: runtime suspend also invalidates the keys
>> v3: fix return codes, simplify rpm ops (Chris), use the new worker func
>> v4: invalidate the objects on suspend, don't re-create the arb sesson on
>> resume (delayed to first submission).
>> v5: move irq changes back to irq patch (Rodrigo)
>> v6: drop invalidation in runtime suspend (Rodrigo)
>>
>> Signed-off-by: Huang, Sean Z <sean.z.huang@intel.com>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Chris Wilson <chris@chris-wilson.co.uk>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ops, I had missed this patch. Sorry
> and thanks Alan for the ping.
>
>> ---
>>   drivers/gpu/drm/i915/Makefile                |  1 +
>>   drivers/gpu/drm/i915/gt/intel_gt_pm.c        | 15 ++++++-
>>   drivers/gpu/drm/i915/i915_drv.c              |  2 +
>>   drivers/gpu/drm/i915/pxp/intel_pxp_irq.c     |  1 +
>>   drivers/gpu/drm/i915/pxp/intel_pxp_pm.c      | 46 ++++++++++++++++++++
>>   drivers/gpu/drm/i915/pxp/intel_pxp_pm.h      | 23 ++++++++++
>>   drivers/gpu/drm/i915/pxp/intel_pxp_session.c | 38 +++++++++++-----
>>   drivers/gpu/drm/i915/pxp/intel_pxp_tee.c     |  9 ++++
>>   8 files changed, 124 insertions(+), 11 deletions(-)
>>   create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
>>   create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_pm.h
>>
>> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
>> index b22b8c195bb8..366e82cec44d 100644
>> --- a/drivers/gpu/drm/i915/Makefile
>> +++ b/drivers/gpu/drm/i915/Makefile
>> @@ -286,6 +286,7 @@ i915-$(CONFIG_DRM_I915_PXP) += \
>>   	pxp/intel_pxp.o \
>>   	pxp/intel_pxp_cmd.o \
>>   	pxp/intel_pxp_irq.o \
>> +	pxp/intel_pxp_pm.o \
>>   	pxp/intel_pxp_session.o \
>>   	pxp/intel_pxp_tee.o
>>   
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
>> index dea8e2479897..b47a8d8f1bb5 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
>> @@ -18,6 +18,7 @@
>>   #include "intel_rc6.h"
>>   #include "intel_rps.h"
>>   #include "intel_wakeref.h"
>> +#include "pxp/intel_pxp_pm.h"
>>   
>>   static void user_forcewake(struct intel_gt *gt, bool suspend)
>>   {
>> @@ -262,6 +263,8 @@ int intel_gt_resume(struct intel_gt *gt)
>>   
>>   	intel_uc_resume(&gt->uc);
>>   
>> +	intel_pxp_resume(&gt->pxp);
>> +
>>   	user_forcewake(gt, false);
>>   
>>   out_fw:
>> @@ -296,6 +299,7 @@ void intel_gt_suspend_prepare(struct intel_gt *gt)
>>   	user_forcewake(gt, true);
>>   	wait_for_suspend(gt);
>>   
>> +	intel_pxp_suspend(&gt->pxp, false);
>>   	intel_uc_suspend(&gt->uc);
>>   }
>>   
>> @@ -346,6 +350,7 @@ void intel_gt_suspend_late(struct intel_gt *gt)
>>   
>>   void intel_gt_runtime_suspend(struct intel_gt *gt)
>>   {
>> +	intel_pxp_suspend(&gt->pxp, true);
> We should actually remove this from here

No we shouldn't. The PXP suspend does other things in addition to the 
invalidation (e.g. marking the ARB session as invalid) and those must be 
performed, otherwise the SW state won't match the HW. That's why I added 
a variable instead of dropping the call. Similar for the resume.

Daniele

>
>>   	intel_uc_runtime_suspend(&gt->uc);
>>   
>>   	GT_TRACE(gt, "\n");
>> @@ -353,11 +358,19 @@ void intel_gt_runtime_suspend(struct intel_gt *gt)
>>   
>>   int intel_gt_runtime_resume(struct intel_gt *gt)
>>   {
>> +	int ret;
>> +
>>   	GT_TRACE(gt, "\n");
>>   	intel_gt_init_swizzling(gt);
>>   	intel_ggtt_restore_fences(gt->ggtt);
>>   
>> -	return intel_uc_runtime_resume(&gt->uc);
>> +	ret = intel_uc_runtime_resume(&gt->uc);
>> +	if (ret)
>> +		return ret;
>> +
>> +	intel_pxp_resume(&gt->pxp);
> And from here...
>
>> +
>> +	return 0;
>>   }
>>   
>>   static ktime_t __intel_gt_get_awake_time(const struct intel_gt *gt)
>> diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
>> index 59fb4c710c8c..d5bcc70a22d4 100644
>> --- a/drivers/gpu/drm/i915/i915_drv.c
>> +++ b/drivers/gpu/drm/i915/i915_drv.c
>> @@ -67,6 +67,8 @@
>>   #include "gt/intel_gt_pm.h"
>>   #include "gt/intel_rc6.h"
>>   
>> +#include "pxp/intel_pxp_pm.h"
>> +
>>   #include "i915_debugfs.h"
>>   #include "i915_drv.h"
>>   #include "i915_ioc32.h"
>> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
>> index 340f20d130a8..9e5847c653f2 100644
>> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
>> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
>> @@ -9,6 +9,7 @@
>>   #include "gt/intel_gt_irq.h"
>>   #include "i915_irq.h"
>>   #include "i915_reg.h"
>> +#include "intel_runtime_pm.h"
>>   
>>   /**
>>    * intel_pxp_irq_handler - Handles PXP interrupts.
>> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
>> new file mode 100644
>> index 000000000000..23fd86de5a24
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
>> @@ -0,0 +1,46 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright(c) 2020 Intel Corporation.
>> + */
>> +
>> +#include "intel_pxp.h"
>> +#include "intel_pxp_irq.h"
>> +#include "intel_pxp_pm.h"
>> +#include "intel_pxp_session.h"
>> +
>> +void intel_pxp_suspend(struct intel_pxp *pxp, bool runtime)
>> +{
>> +	if (!intel_pxp_is_enabled(pxp))
>> +		return;
>> +
>> +	pxp->arb_is_valid = false;
>> +
>> +	/*
>> +	 * Contexts using protected objects keep a runtime PM reference, so we
>> +	 * can only runtime suspend when all of them have been either closed
>> +	 * or banned. Therefore, there is no need to invalidate in that
>> +	 * scenario.
>> +	 */
> and remove this comment
>
>> +	if (!runtime)
> and remove the runtime boolean entirely.
>
>> +		intel_pxp_invalidate(pxp);
>> +
>> +	intel_pxp_fini_hw(pxp);
>> +
>> +	pxp->hw_state_invalidated = false;
>> +}
>> +
>> +void intel_pxp_resume(struct intel_pxp *pxp)
>> +{
>> +	if (!intel_pxp_is_enabled(pxp))
>> +		return;
>> +
>> +	/*
>> +	 * The PXP component gets automatically unbound when we go into S3 and
>> +	 * re-bound after we come out, so in that scenario we can defer the
>> +	 * hw init to the bind call.
>> +	 */
>> +	if (!pxp->pxp_component)
>> +		return;
>> +
>> +	intel_pxp_init_hw(pxp);
>> +}
>> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.h b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.h
>> new file mode 100644
>> index 000000000000..e6a357996e19
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.h
>> @@ -0,0 +1,23 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright(c) 2020, Intel Corporation. All rights reserved.
>> + */
>> +
>> +#ifndef __INTEL_PXP_PM_H__
>> +#define __INTEL_PXP_PM_H__
>> +
>> +#include "i915_drv.h"
>> +
>> +#ifdef CONFIG_DRM_I915_PXP
>> +void intel_pxp_suspend(struct intel_pxp *pxp, bool runtime);
>> +void intel_pxp_resume(struct intel_pxp *pxp);
>> +#else
>> +static inline void intel_pxp_suspend(struct intel_pxp *pxp, bool runtime)
>> +{
>> +}
>> +static inline void intel_pxp_resume(struct intel_pxp *pxp)
>> +{
>> +}
>> +#endif
>> +
>> +#endif /* __INTEL_PXP_PM_H__ */
>> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
>> index a95cc443a48d..d02732f04757 100644
>> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
>> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
>> @@ -21,29 +21,36 @@
>>   
>>   static bool intel_pxp_session_is_in_play(struct intel_pxp *pxp, u32 id)
>>   {
>> -	struct intel_gt *gt = pxp_to_gt(pxp);
>> +	struct intel_uncore *uncore = pxp_to_gt(pxp)->uncore;
>>   	intel_wakeref_t wakeref;
>>   	u32 sip = 0;
>>   
>> -	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
>> -		sip = intel_uncore_read(gt->uncore, GEN12_KCR_SIP);
>> +	/* if we're suspended the session is considered off */
>> +	with_intel_runtime_pm_if_in_use(uncore->rpm, wakeref)
>> +		sip = intel_uncore_read(uncore, GEN12_KCR_SIP);
>>   
>>   	return sip & BIT(id);
>>   }
>>   
>>   static int pxp_wait_for_session_state(struct intel_pxp *pxp, u32 id, bool in_play)
>>   {
>> -	struct intel_gt *gt = pxp_to_gt(pxp);
>> +	struct intel_uncore *uncore = pxp_to_gt(pxp)->uncore;
>>   	intel_wakeref_t wakeref;
>>   	u32 mask = BIT(id);
>>   	int ret;
>>   
>> -	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
>> -		ret = intel_wait_for_register(gt->uncore,
>> -					      GEN12_KCR_SIP,
>> -					      mask,
>> -					      in_play ? mask : 0,
>> -					      100);
>> +	/* if we're suspended the session is considered off */
>> +	wakeref = intel_runtime_pm_get_if_in_use(uncore->rpm);
>> +	if (!wakeref)
>> +		return in_play ? -ENODEV : 0;
>> +
>> +	ret = intel_wait_for_register(uncore,
>> +				      GEN12_KCR_SIP,
>> +				      mask,
>> +				      in_play ? mask : 0,
>> +				      100);
>> +
>> +	intel_runtime_pm_put(uncore->rpm, wakeref);
>>   
>>   	return ret;
>>   }
>> @@ -135,6 +142,7 @@ void intel_pxp_session_work(struct work_struct *work)
>>   {
>>   	struct intel_pxp *pxp = container_of(work, typeof(*pxp), session_work);
>>   	struct intel_gt *gt = pxp_to_gt(pxp);
>> +	intel_wakeref_t wakeref;
>>   	u32 events = 0;
>>   
>>   	spin_lock_irq(&gt->irq_lock);
>> @@ -147,6 +155,14 @@ void intel_pxp_session_work(struct work_struct *work)
>>   	if (events & PXP_INVAL_REQUIRED)
>>   		intel_pxp_invalidate(pxp);
>>   
>> +	/*
>> +	 * If we're processing an event while suspending then don't bother,
>> +	 * we're going to re-init everything on resume anyway.
>> +	 */
>> +	wakeref = intel_runtime_pm_get_if_in_use(gt->uncore->rpm);
>> +	if (!wakeref)
>> +		return;
>> +
>>   	if (events & PXP_TERMINATION_REQUEST) {
>>   		events &= ~PXP_TERMINATION_COMPLETE;
>>   		pxp_terminate(pxp);
>> @@ -154,4 +170,6 @@ void intel_pxp_session_work(struct work_struct *work)
>>   
>>   	if (events & PXP_TERMINATION_COMPLETE)
>>   		pxp_terminate_complete(pxp);
>> +
>> +	intel_runtime_pm_put(gt->uncore->rpm, wakeref);
>>   }
>> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
>> index 3fc3ddfd02b3..49508f31dcb7 100644
>> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
>> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
>> @@ -78,16 +78,25 @@ static int intel_pxp_tee_io_message(struct intel_pxp *pxp,
>>   static int i915_pxp_tee_component_bind(struct device *i915_kdev,
>>   				       struct device *tee_kdev, void *data)
>>   {
>> +	struct drm_i915_private *i915 = kdev_to_i915(i915_kdev);
>>   	struct intel_pxp *pxp = i915_dev_to_pxp(i915_kdev);
>> +	intel_wakeref_t wakeref;
>>   
>>   	mutex_lock(&pxp->tee_mutex);
>>   	pxp->pxp_component = data;
>>   	pxp->pxp_component->tee_dev = tee_kdev;
>>   	mutex_unlock(&pxp->tee_mutex);
>>   
>> +	/* if we are suspended, the HW will be re-initialized on resume */
>> +	wakeref = intel_runtime_pm_get_if_in_use(&i915->runtime_pm);
>> +	if (!wakeref)
>> +		return 0;
>> +
>>   	/* the component is required to fully start the PXP HW */
>>   	intel_pxp_init_hw(pxp);
>>   
>> +	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
>> +
>>   	return 0;
>>   }
>>   
>> -- 
>> 2.25.1
>>

