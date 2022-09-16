Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0785BB2FC
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 21:45:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DEDF10E0DE;
	Fri, 16 Sep 2022 19:45:22 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD8710E0DE;
 Fri, 16 Sep 2022 19:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663357518; x=1694893518;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6XDdoMGSF0cJGEE3REWf5LZziKks7lrD59U1eCYf6Q0=;
 b=ZliYAJVLoizPsh8JxfLjxizjQpoV26EZm/seTLTm5F5a4E503pNd21bf
 9NW+NYPuYW/rGo+Qgxj3ctoyIKCry2ykhHaCzJoIhh9rn4u+xMnRHWwM9
 rlWfgw/vo6Vbay+HK9uqkCSjbwNGPIzFfzssHVQ34xVIQ5Yt3JxLAwPdv
 ibbE8s5cjJ6oap9cwUmCdpLs+l5FRggFXQbVUFjY5SA38Beizi1lrdkH2
 kSfAHP2qv5SEDK5IJJIRoyUpwh9tUU/296ktS+8OTlMzjK9UtWgqVzdLE
 CBRpwzxCqiRIbeE8TXS58ysUZ6FR8ORlmlUKq7brzlTzTx68KkiPNsFR6 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="363027398"
X-IronPort-AV: E=Sophos;i="5.93,321,1654585200"; d="scan'208";a="363027398"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 12:45:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,321,1654585200"; d="scan'208";a="721538657"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 16 Sep 2022 12:45:16 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 16 Sep 2022 12:45:15 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 16 Sep 2022 12:45:15 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 16 Sep 2022 12:45:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BY7oH4qdrTRqOBXIXxwTYpnEjQsABwipHGGbhxO+h6ADNoMW3NcikAizBBCu6xYD02dDUh120s1+3ocuRaQvXU2PQwXXVITNKq8c74MZiU7Z94tQhKFAnXBi8w5Ze9hapSB+he9l7I1QqkKrq/w8Vrkg7BNfHqbSr25QhvLPm6qx9PMJ5m0v13k7dAvmJyXrXShB+bfYPDHWtF2sGMEHLt+p+OAFgEZv2fNIIxWti4xrYHvU7/5eSWCZsTVikHnQCsCFaaTKXtvlbj+dIH8b3fEu7prkllEfVhixrBDlm7zD7RCYUDS89N6HN6c0eCSyau1zpCpuj1noAnUYRcV/QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xgXDLlmm0xYSgztgQJX+MgAjtUjgGG767Wc4KLNG7Go=;
 b=Xkiwm/S/GDA173ptbLzoxSqXu40vTztJC7GXqzZFCW5kMHi7nkfs0CuuhO0soV+ReKu7CBKcjDOcOEyg6AetTA8fVOc69hxR3Q/oy6HONN6BBHD3vzzbQVU2sE3mGI6ZEiz6CFNXHGuawjFKlmTd5afNbCvY6LLTbd2IlsHu1TfXv/4+tX6H1ypIT4btJ7c6/T4DWZaG6EinKN0Y0ThR9iqWG/LUiJSNDYjraqLcez/RBJ/3hLs28/Wkcd+EZfQ15KaduPSGqju+bWfT0zGmSS3LvEh9QrQ9rFGkhZhM2O3yXxCjJ806dtPxQmgb6/OiPaT5gz5KCdxBq7HW+7p92g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by IA1PR11MB7388.namprd11.prod.outlook.com (2603:10b6:208:420::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Fri, 16 Sep
 2022 19:45:06 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::fcdf:8f15:5eaf:b57]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::fcdf:8f15:5eaf:b57%6]) with mapi id 15.20.5632.017; Fri, 16 Sep 2022
 19:45:06 +0000
Message-ID: <160e5542-9260-7e54-aa84-01310807037c@intel.com>
Date: Fri, 16 Sep 2022 12:45:04 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.13.0
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915/uc: Update to latest GuC and use
 new-format GuC/HuC names
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220914234605.622342-1-John.C.Harrison@Intel.com>
 <20220914234605.622342-2-John.C.Harrison@Intel.com>
 <2bf26f8f-7f5f-4cfb-5117-a9119bf708fe@linux.intel.com>
 <722b1da6-459b-dd35-8a3c-3056a75ee8a1@intel.com>
 <aeedcce3-ff03-b8d4-54b1-13ea7d482258@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <aeedcce3-ff03-b8d4-54b1-13ea7d482258@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::38) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|IA1PR11MB7388:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a959771-191e-4863-ea30-08da981bf4b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DtGyYqK75MaQ0LHmmLIkqYzu4dx4tC5m/Hg4z8VotRIkhZqt2vEvKhAKe7qy0YOXbCBRONRqIXsmr+R3mEXh1sPUAmBZt+zEhQKmPuJY03roqI86vlLmiK8L43gJGlzVBnunBAVvVfALIFGoJF9ChtKJLaSZ7IVZBGqz/Kxl8JEXpnqZWo/BQ4m5DMO4Uk2svhZJhp/Flev82/gTJ0PgCve/8UkJRAzUZmSlnW3z0XOd7jPzCXGHIp4eHjAK5GimDrQbnNYDmyUcsw7XuOyuI2sjRIUWLGG1Ni9bAQeXhrQoSOVx0dJkgMZfmyDvp50g9wEePYCsBzv4UZ643hEmiYWip6oHxKzFOYiu9/K6OsxSZgfmJf1a/gy8v+bYL1XGv3gl8b5LlJI7+r6A7O3ehZudiKlmiBAimgGrJZDzooS4n+oxso+hSWylJiQZvYxt5Llpqj72OVWVYFnpsTbb1740I0xRptDSOhKhCThyXgYMXOHkQDjpAo/2eGTHd6bJyu6y6dmUDtiqkiNkQ/fAgqRD452Rrf54APx0+TjoU1AmAu5xJP0k9I08RlRPtMhiKsvQ9GHVHzqneNs3E3XAloKB7YIDCgKEMNWFGY9I3n4ICXd2r9qZfZuPvp6ouoV8Bz4AZgcy6N5ebp3tNehaDbzRCBXf9xC1tJSsx0/xWUIwygKiU/NIB1oneyc+y6VRUhDALBNWy9v1iEnCCIRJQ1shTUKpRaof50kAlkFyGYLJg66ZIHjgt51+XwTS8TSPFbp6a0xjV8xd7GuJeX/+/ZF3LtHX3O85858x2WtJOvw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(346002)(39860400002)(376002)(136003)(451199015)(31686004)(6506007)(53546011)(41300700001)(86362001)(186003)(6512007)(2906002)(36756003)(2616005)(478600001)(316002)(26005)(5660300002)(15650500001)(31696002)(83380400001)(8936002)(6486002)(82960400001)(38100700002)(66946007)(4326008)(8676002)(66476007)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUR6eDg2SmwxbjVBS2wyTkUrOFFQMUMvQWxTZ2gyTjAzNVR6ZndMRXF1S1JU?=
 =?utf-8?B?L0tkTEx3ZExHbVhnWnBrVHVPT0d0aWdTQ1p1dktHUHVLRFlhNHBiNExDUkxv?=
 =?utf-8?B?T1NPTUoybEZqMVpUcWlKbHhORFYzVm9aUXBLTUVlNE5iendicXFMeDM3Rnkz?=
 =?utf-8?B?eThnVElkWXdNRzlJRmlBOVZHSWVjdlAvNURONUJvUjF2RzNiLzN4YnFXUWJV?=
 =?utf-8?B?ZndUb2NyWmJPcWFzQXhDZzZCUFBSYnZiekowNnp1MGpmcDhvT1lqYmpTeWNO?=
 =?utf-8?B?WmVyVHhoeXBha2NmcVl1aEdsT2ZKenpXL05qTXIxMkcvaG10ZTU5WUV0Nlp3?=
 =?utf-8?B?UnlTNUthWDVLOVdzSFZQdjJpUWxkM1VwU2VKNWNFclVpbFRTNkhCZEV3WWxq?=
 =?utf-8?B?bGtqYWxxUnc5WTdIb3RidmlZQ0tRYXhOSFFWZExsMXZpZG4yOXZmRHIrZzBJ?=
 =?utf-8?B?RVNXVko4UVBxZUdubHRIaGZiaW1JVThUZk9FN1lSRnFPVFpETG5rMVY3YnFI?=
 =?utf-8?B?RlBaVWJUS3BHSk90dnQzMDIwdXpCUTVJalJFSFVBbWJJVDdhOUNydkViazJr?=
 =?utf-8?B?T25jRWwxeXVuOWFieDNNUjd0ZVd6b3hUN2VOSDVnRU94WDdFSHV6SDAwM2sw?=
 =?utf-8?B?TldCMGxvYm1GZllWRWFodGF0NVVTN3NGWWE0aWkzTDA2MWFmWUZydVVWTzBM?=
 =?utf-8?B?QmdicU52WDg1c3BtMTdpRjBpSG42ajE0dEJvSkdNeGY4S3lSdWJvOVRPRk1r?=
 =?utf-8?B?T1dUNks1TVRpMnBpV2FlUTlIUFk4aU1KZkJsbkpDWnFscUNMRUVMaGJKeEJG?=
 =?utf-8?B?ekZ2dnJJeDVQb2NFazhlS3BQQU1wTHFLZXpRa2JrRVJpRkx4OWtGU1liQ3Jt?=
 =?utf-8?B?bVo4Vmdhc0svYjI0TjFGZEs2U1FVWS9qbUhPMXBibDk4TVZNTzFrS1RHTGlM?=
 =?utf-8?B?a0wrejRmWXVmcml6RThFN0xVTklBcjU4L0ZKdTI0S1hQeStwdkVydjBtYzY5?=
 =?utf-8?B?dFlibEtMRTZoblVHbFBjelA4WmRRZkd5Zzl0WkF5aHQvdTRWdGpSQ2FmZVMw?=
 =?utf-8?B?Z21aUnRrTHZaUDZ4MVJMUGwvSFZWeGdocFlCQk1leE1PSWpxYWJTdGp1UXZv?=
 =?utf-8?B?VEsyalA2UFA5c0pFb3hsaEFQL04rK2EvMFFUclNRRy92bkRJVklkVEMwQ09G?=
 =?utf-8?B?U1JTMk84M0Y4ZlBDR3BFSVlwUTVjdTdkdXJBL3E5aXlPWVdPMC82Y2dzREEv?=
 =?utf-8?B?bW9DNXZMSFlnNWpSTHVHL2E4a1VoRjZvM0ttVUs2a0phc2xYRWV6dW5VTEty?=
 =?utf-8?B?ekFqVEFUelcxdi9YSHhXeVRZYlJyNGp5ZEI1aVB0VndGNVVtNGF1VHdmRENp?=
 =?utf-8?B?KzFwdHBJN0NvU2lndGlHNS92U2ZldjJ3clRUUUZzN2dtQWRFNjd4RWxITUFh?=
 =?utf-8?B?MnlaMW9ManJ6S2FwL3VxSEdWYUNOelJHcThRMFBTTnpmbS91eENtY0RQVUFR?=
 =?utf-8?B?dkkrY3BmZUdZeGNlNUtORWtqMTMzUmgwdzR3VTNTcEVzZFYwWHZ3Z3VPTHVZ?=
 =?utf-8?B?bEoyZlNOSHdpbHo2RThwV3BHcWNwMGl5SjlMOVJDUlFIeUJXM3krRzJYSWs0?=
 =?utf-8?B?SFp3WUI2SCt5WkROby82RzJCdHBMald5aXg2VFRGbWhYdmtvVnBzeGVpV0Rr?=
 =?utf-8?B?SE96MVJ4OFNHcjhrVDQvWEdzMFMyVU1nbkxsNEppZVNhT2lWSlJYYStjQi9R?=
 =?utf-8?B?a215TEhLeXQ0bHNJcyt2ZE55NzhXcnRoNVFJMDMxZDN2Y2JJTmZpNDhTb0d6?=
 =?utf-8?B?dVRncExSTUg2dXBiWEQrRTNYd0NvNnNjZHNaNC93S24zZ0IrQ1YvdWhTMEpU?=
 =?utf-8?B?blN2bFBEdEtRRVhOWVR3b2FWcEY0bGtsejZjazZhR2Z3M2tFMnhSNTcvandi?=
 =?utf-8?B?R09BR0JKbW5heVBlbHhYcVJOUXVKL0ZuRGpCa3hZS3JLVXpqK0JPa2xGTXQ2?=
 =?utf-8?B?Sm9zbDZLVlVLbWY5SmthTG4reVN1a1hKNExNVm04aUdwcTJtQ0kwM2RrbnFR?=
 =?utf-8?B?ai9WNzY3TlI2YzJmclN5ckpqWlhldmh1TXhaMDlUOHp1TWdnM01BeWkyWXVZ?=
 =?utf-8?B?bEVJVnVncWl4bzJvcHR5OW93MGdESEFwMlUvbzR3Ulp1UDlFd2d5eml0aE1S?=
 =?utf-8?B?aXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a959771-191e-4863-ea30-08da981bf4b7
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 19:45:06.4672 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h79VGIDmXzTgIenJMussyLB7zISnpXCXV6YcqQ6AskjDKjOyKFN4YXYSCk5+pwoJ6IA/uHAgSZGtt5FUJ7TVPVCBR2H6fLJUBfUz3BckjgA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7388
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
Cc: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/16/2022 02:10, Tvrtko Ursulin wrote:
> On 15/09/2022 21:03, John Harrison wrote:
>> On 9/15/2022 01:59, Tvrtko Ursulin wrote:
>>>
>>> Hi,
>>>
>>> On 15/09/2022 00:46, John.C.Harrison@Intel.com wrote:
>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>
>>>> Going forwards, the intention is for GuC firmware files to be named
>>>> for their major version only and HuC firmware files to have no version
>>>> number in the name at all. This patch adds those entries for all
>>>> platforms that are officially GuC/HuC enabled.
>>>>
>>>> Also, update the expected GuC version numbers to the latest firmware
>>>> release for those platforms.
>>>>
>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>> ---
>>>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 10 +++++++---
>>>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c 
>>>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>>> index 1169e2a09da24..b91ad4aede1f7 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>>> @@ -72,12 +72,14 @@ void intel_uc_fw_change_status(struct 
>>>> intel_uc_fw *uc_fw,
>>>>    * security fixes, etc. to be enabled.
>>>>    */
>>>>   #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_maj, guc_mmp) \
>>>> -    fw_def(DG2,          0, guc_mmp(dg2,  70, 4, 1)) \
>>>> +    fw_def(DG2,          0, guc_maj(dg2,  70, 5)) \
>>>
>>> Just glancing over out of curiosity. Part which confused me is that 
>>> if only major is supposed to be used then what is the '5' in 
>>> guc_maj(dg2, 70, 5) ?
>> See the earlier patch that added support for version reduced 
>> filenames. The minor number is still specified because want to be 
>> able to warn the user if their firmware is out of date and causing 
>> them to miss features, security fixes, etc. The driver will still 
>> load any old firmware with the right name and work with it, but 
>> user's need to know that there are updates available.
>
> Got it. Release is deemed not important enough to warn about? no 
> actually, it's different, I guess we never expect to bump only the 
> release with a source level change - so in practice kernel could not 
> warn that there is a newer release version since it would never know. 
> In other words those ones would only be hitting linux-firmware, while 
> minor changes would be kernel patches as well.
By "release" you mean patch level?  As in <MAJOR.MINOR.PATCH>. Yeah, I'm 
in two minds about being explicit on the patch level. It is possible 
that a particular feature might be added in 70.6.0 but then we find a 
bug, so it's only usable in 70.6.1. In which case, we want the KMD to 
notify users that an update is required. But in that case, we would also 
want to patch the kernel to disable that feature unless 70.6.1 or later 
is actually found.

Or, there is just a straight up bug that affects everything and is fixed 
in 70.5.2. Again, we would want to notify that an update is available. 
But we can't exactly patch the kernel to not load i915 if 70.5.2 is not 
available.

Having said that, updating the 'requested' version is a KMD change 
regardless of whether it is a bump of the major, minor or patch level 
version number. In which case, we have the opportunity to add in patch 
level reporting at that point if required.

But the counter argument is that, as you say, a firmware bug fix does 
not generally require an actual KMD code change. The i915 patch would 
purely be to bump the version number. So is it worth the churn? For 
major/minor changes there are corresponding i915 changes - either a 
re-write of existing code (major) or a new feature being added (minor). 
So bumping the number is 'free' given that a patch is required regardless.

And is the code churn to provide a warning really useful? Would an end 
user ever notice the line in dmesg? Isn't it up to the distros to 
provide important bug fixes via package updates when necessary?

So yeah, not sure. Unnecessary code churn versus warning about 
potentially important bug fixes. Pick your evil.


>
>>> I also couldn't find guc_maj with grep so I guess it's some sort of 
>>> a magic concatenation macro or what?
>> 'guc_maj' is a macro parameter as per the definition of the macro 
>> three lines above. According to where INTEL_GUC_FIRMWARE_DEFS is 
>> used, it becomes either a mechanism for creating just a 
>> 'MODULE_FIRMWARE' definition for the firmware file or a table entry 
>> giving all the version information as well as the filename.
>
> Doh thanks, macro magic was apparently impenetrable to me yesterday.
Yeah, this particular set of macro magic is impressively complex. It 
took me quite a while to properly understand exactly what is happening 
and how when I did the actual versionless filename updates in the first 
place!

John.

>
> Regards,
>
> Tvrtko

