Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F6843BB42
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 21:55:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E5789FFD;
	Tue, 26 Oct 2021 19:55:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A67489FD1;
 Tue, 26 Oct 2021 19:55:30 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="217172054"
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="217172054"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 12:55:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="578915085"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga002.fm.intel.com with ESMTP; 26 Oct 2021 12:55:29 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 26 Oct 2021 12:55:29 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 26 Oct 2021 12:55:28 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 26 Oct 2021 12:55:28 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 26 Oct 2021 12:55:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A9e8o7+PfOD7wtegwnWd9PN9yTbeFcbzARFFRl6sWgjhcJUbkHFY8JT+isgaZnGjuhe3NLRuHAPtKUjwridaagFO+jKrMIF8Scngbq+eq6tw5hkT6eng3qcr4iY84Ct5hPoA+OgiSsDmaps9E8GlhIvfEpWNAShoKmLh51misY6y/6HzmEjI1+v8g2R4HW43/vw1rJjLXliQxZHQvQDQ8v7nn4e/cWLy4bTyQKuyvAUUneoTfMSrwBPm3TKbBzt/62/YeCMRt7inTtSlQcmviEPSAKYCIi9U7nKVYr3n5JeM07PmZCh6myBTBTHxzSDRcL4K88JduCUffGVOrZ1y9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9qkvECuqOJX22YE3+bVvkSCKdFMNg0kUkgYXMvQDlvM=;
 b=QiN6FttH5V/r3atKI/RucyPlwRusNA+TFKL9EoXawRlXMSc8pyR4TRPbrpnqbS3m8ABZPwKF29l3Fn/LXvki1dqTtFSAMUZr7z5aYuBLf3cA+/JrNSLbXMaAwdHn9AOfvh8JTS+NLOyC+BwkyS7sHicq/JRKA6VE8Y9X9cfspK865Pf8ttC2f88qILTeHvRJS2RqDq+I7ylT1nCNbOJ5sKFlEwaGuyhoX7yUNJO5hcDWqphdkLyVkTltVKRMDHmOfMx87SIfHIpJXQEmsU4yKw8E85Gwg4i1vfNeDiVPF+TUzEdtNpXhEYmAucuyJ1Q6sHkJ6f9k3XFoYM2OLDLwbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9qkvECuqOJX22YE3+bVvkSCKdFMNg0kUkgYXMvQDlvM=;
 b=iF96Xjw+pJsSzcSWKoqlNhQBl5e1xcDF+4XqWjKeeQJR1Z70V8YlikIMnPrPhsavppUD/bA/4KGY9BYvTAgacdA3ANmzwfP9NCrhC8ZAL2gRxZgOXyS7xIZO6VJRH1o9yq3bHyoxICS1RtUbbnbkAnrcjdol86FDKZrLz2Yej2Y=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5610.namprd11.prod.outlook.com (2603:10b6:510:e9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Tue, 26 Oct
 2021 19:55:27 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%9]) with mapi id 15.20.4628.018; Tue, 26 Oct 2021
 19:55:27 +0000
Message-ID: <5deddbeb-328c-62b3-38e2-d855fc99668b@intel.com>
Date: Tue, 26 Oct 2021 12:55:24 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.2.1
Subject: Re: [PATCH] drm/i915/selftests: Allow engine reset failure to do a GT
 reset in hangcheck selftest
Content-Language: en-GB
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20211011234705.30853-1-matthew.brost@intel.com>
 <f8f1ae021e8cabc2c6d76996b5e74912cb0913db.camel@linux.intel.com>
 <20211021203747.GA27209@jons-linux-dev-box>
 <ee989711-779e-874f-6737-ab9288557d1a@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ee989711-779e-874f-6737-ab9288557d1a@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MWHPR2201CA0044.namprd22.prod.outlook.com
 (2603:10b6:301:16::18) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MWHPR2201CA0044.namprd22.prod.outlook.com (2603:10b6:301:16::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend
 Transport; Tue, 26 Oct 2021 19:55:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e744321-01f7-48e9-c42c-08d998ba8e77
X-MS-TrafficTypeDiagnostic: PH0PR11MB5610:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <PH0PR11MB5610369311F2E6204A9937A8BD849@PH0PR11MB5610.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tiw/DxaxlxGf9+Wcm/ae+a65WZucplBEIjjq3OAFJWARUS7H+LWPTHXsFG/iCOIxEzu2znOgF5wsW5LZMoxyLRVtte0T3lT8eQ8dYThwxc0wFzPiyqq8LCzafpmb1riFK/Jn958hJrtLf201dOy3uvn2ybmaRI/2iX+bPHISv85MqaiWHHbTSpTNcF5KN72T7BAzZOTlzTCeYkLi2KS8U7VAe1hGF6y/kU5fm20oDGiw47muf4ieBML9eaUGGetBZcdaiowCjSm2H49ij4roAqY+AevLMbnp+PAAc4L+XZjomBF9aI64yRcF8RB7hZh2/wxSb6xQ5Fa1ol0CFavsnp2jtSLOx6IiHJwG+Uvg8Gm2Y3sMcnhS/rSmzJAGUsJyyPppStl6fPv/ogIpcX4K7efMiKHSjUD+ZlHbrvEkiI4rvLkBgD6oDs91lW/8ZcUe1iXCrdJPjf74C6xFHxPf8GaIka4Lzl7wB27zOITCIpBvX92IkB77Gk3rxwQ4hvAttheuN49+vH33vaARNRjDSMdgkHxu7OhlK1diXJVCta/N7Yh3WLSLRu4ot1UZ8dDP0GP7P2RIqQtSl8vfvNBXaTT/dcemVJH4Xbt53XoLU4aLZdEG6/xUx0ZySBiV3AO79i3nXA17c2d8dIG0S2Tp94GHFBv0elZ3ag9/K710xroD2CxlWw8uabVuTtQhD8Lop6oBBjjmxChuAZfuu6nh30KTaBKIZz87FsX492D9w1dA0O+g3GuZj72mel+OoM8Q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(31686004)(6636002)(4326008)(186003)(66946007)(16576012)(26005)(5660300002)(31696002)(86362001)(110136005)(66476007)(4001150100001)(316002)(8676002)(6486002)(66556008)(8936002)(66574015)(83380400001)(2906002)(36756003)(2616005)(508600001)(38100700002)(956004)(82960400001)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0ZBeHNEVXN0QnEvWGlDQndHaXFseXNIWlpwQjd0Y1NuM0JrSXl1bHNXY0NC?=
 =?utf-8?B?TS9zeitvN2MxRGpIT2g5VkVxaWwwengvaGt0ZkR1eThkT0hGTG5Xc2k2NW16?=
 =?utf-8?B?dyt0TC85MnBGTDZoL2dBNW5SeVQ5OUtGTDdKYldnN2V3ckFvODBPMEhnQzky?=
 =?utf-8?B?T3dIZVdjOExoV1UvQkN6VlpORkM4N0hhR0VQaGhZRDF6MjdydHQxSjhJV21Y?=
 =?utf-8?B?bHVVdnBEWW11OEptUUxZaFp2TTZjbk5SWGsvcy9xQjZBSWVES2pHNnNYZmFS?=
 =?utf-8?B?YXZFOTMzQkdWVHVQeHMwRHc4N05XRUlSY0tBeWs0bStndURZVVNBaGc2Wmlx?=
 =?utf-8?B?REdpU1p4a2NNTlRRUnVWWmR6K3JoR1JHRi9meC9YSWlwWUZnb3pZaEkrZkpt?=
 =?utf-8?B?eERZV2toMEFXRkJMYk9HQlRuMS9BRE50bXFzVStqbDRxWXYxTXliaGhlOHkv?=
 =?utf-8?B?MjQ5SDlJUWdZSjVXZ1B6b05Db0orcEowNEF1T3ppSExreFUzSEZqdE5HbGhD?=
 =?utf-8?B?QlJGa09BbUk0NDNDVkhPamlCTklxZkI5ak5YcG80eldYaTBSa3VKYWZBczlh?=
 =?utf-8?B?Rll3K3VoYTNUc21zTXVESWJxU2FhbHZiSGpqY3AxQmxJSHhwdE45UlRrblll?=
 =?utf-8?B?Yk5ubm1TMjRRV1NMd0RWUytNNE5oT0FWQnk5R3dwdUpwa2FpN0w5Z3Z2bi9k?=
 =?utf-8?B?WlgxYmc3bzJWYk8rN1Y5N2lSU0xNVUFodXAxM2xZN3RPdHpBcDU0Zll0ZVp0?=
 =?utf-8?B?Q29nMUZuclA1Z2k5VXNvcCs2NGNWTE53QjVnRWRHbVhTS2JHWk82NFpzdTlu?=
 =?utf-8?B?ZG1mOHZvbHBnajJyN29OWHo3OUxBelpJSG1qYktaK1V6ZFJhRlJzeFZodXBO?=
 =?utf-8?B?RXZjRHVOb1J4QWUyK2Z4dlVRL1BzOXJXbm83anQ4eGI1a3lRcitzTGdpckt2?=
 =?utf-8?B?czBycjFBZzFFVElXQWRvRWNsZUhCNnkvY2U3bGhBYjF1SWpWTkU2dEVMOVVV?=
 =?utf-8?B?VWprdVBINjBkb3h0VThsZ2Y4K1lrSHpGbHBaakdLdVJHY1dOVm5CSGg3QmpT?=
 =?utf-8?B?RzV6M250WTJNSlFFWXZaRHk1M1VKbjQ0OFh2b1BwV3V3c1ZNRVVZeGZ0MW40?=
 =?utf-8?B?OWM1U3QyU1pySTlWZ3pSVnJROWZCbkp1bE9FN3RTSVZJWjlnTEp2YVBPZ1NB?=
 =?utf-8?B?SDZieG1pampQRUJTRTFIOW83MHFIUGc2K0FKVUxWT25aQkhRSXcvazNob1k5?=
 =?utf-8?B?bTladERMMEVmS2lXK0RaYU4vdWpOUkJxNUVXdGlUN3QzbmtCVlVZelVnczgw?=
 =?utf-8?B?MWFMc1hXOW1LcnhPWDdyMzYxbE9nVVBEN1JVTWo0UnI4NFMrcW5jTzBPdFlr?=
 =?utf-8?B?K3ZhQjV2VWZhQ2RFcGE3ZXFUWjZWeHYxNk9BcExGcjVaaTZoYjdTTVV4YU56?=
 =?utf-8?B?Z2VybFpFb2o2VjUzQVJTcHFZbGhRa1JWNVo1NEhCc0hlcHlXc2REaW5ZdmhM?=
 =?utf-8?B?WjlabGlXQUhPWDd1L1VWR3R1eEh5S1ZTK0U5ZndqcnZaL2pUNHE2T3dHM3o2?=
 =?utf-8?B?V3kzN1FQTkJUNG1SUk54azg4Q0RGRFRrQ2FUb1ZQcm1jM2hFREJwZkJ0WTZB?=
 =?utf-8?B?WEdHdzl2ZTNuNGRTdGtsMnRHb1k3VnVjTDhWcFQvbFBBcVNUWGFxdlFFRXNi?=
 =?utf-8?B?TUYxUXpxTk1iVVB3anNjRlpNTGROdDVyczZDOEg5Y2w3dldWQUxKT2lTUUpF?=
 =?utf-8?B?TEd1NDNpNlJ6VDBWdkRlZXRkMUd5SXVFV0lPRmtuMFEwVEdrRVZTRnlCV0pK?=
 =?utf-8?B?Y1hpckFKQ0pBbHZudVNaVkJtWC8vUUhBS1JUcDAwVTZoT0JlSTlFV25qRmNk?=
 =?utf-8?B?a05ocHpMU3ZlbWVoUHVLN055V0t3OFd3b0p6UGtHaFhaMHhoSmkrdEZpQzBI?=
 =?utf-8?B?WUxIU0ROZHlKMWd6UFdFN2NRejIrTEFOTGF4TGo2aUZnUytOV1RVUzE0eGVq?=
 =?utf-8?B?ekltR2Y4Nkc2OVJDVUUzN20zbUdpNEJXRVRoQ3lhM2tLazJTdG9iUDlPdXln?=
 =?utf-8?B?Q1BPM3VQVExTSmZYbVQ3cHVaQjk4KzhvT2J1eStWb0VhTklENGtUcXdYSFB3?=
 =?utf-8?B?Y294VnJ3T0QrS3N4T2dodjkyVEMzbUd2ZVFJYkVST09UK0dMUFFWdkdsSEky?=
 =?utf-8?B?aGp6VGljaXh6Zm5BSlN6T1I4QUdMcGF4c0QvTnlaYnNMYzNtY0N4dFJxV0M5?=
 =?utf-8?Q?8xokgS9ukwCmpBhSlN93saf/vc7SomQPW8gk4lT+7U=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e744321-01f7-48e9-c42c-08d998ba8e77
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 19:55:27.2363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FzbU1lCoif2rBuMA80Myc+rDsDaSmq4he/s1jrfQS21UYaVJZviM/JsWdViQ/zlKoXRk6rRQS70Y3ydfJVN9nMa18q2D85tYIVvL99gT7i4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5610
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

On 10/21/2021 23:23, Thomas Hellström wrote:
> On 10/21/21 22:37, Matthew Brost wrote:
>> On Thu, Oct 21, 2021 at 08:15:49AM +0200, Thomas Hellström wrote:
>>> Hi, Matthew,
>>>
>>> On Mon, 2021-10-11 at 16:47 -0700, Matthew Brost wrote:
>>>> The hangcheck selftest blocks per engine resets by setting magic bits
>>>> in
>>>> the reset flags. This is incorrect for GuC submission because if the
>>>> GuC
>>>> fails to reset an engine we would like to do a full GT reset. Do no
>>>> set
>>>> these magic bits when using GuC submission.
>>>>
>>>> Side note this lockless algorithm with magic bits to block resets
>>>> really
>>>> should be ripped out.
>>>>
>>> Lockless algorithm aside, from a quick look at the code in
>>> intel_reset.c it appears to me like the interface that falls back to a
>>> full GT reset is intel_gt_handle_error() whereas intel_engine_reset()
>>> is explicitly intended to not do that, so is there a discrepancy
>>> between GuC and non-GuC here?
>>>
>> With GuC submission when an engine reset fails, we get an engine reset
>> failure notification which triggers a full GT reset
>> (intel_guc_engine_failure_process_msg in intel_guc_submission.c). That
>> reset is blocking by setting these magic bits. Clearing the bits in this
>> function doesn't seem to unblock that reset either, the driver tries to
>> unload with a worker blocked, and results in the blow up. Something with
>> this lockless algorithm could be wrong as clear of the bit should
>> unlblock the reset but it is doesn't. We can look into that but in the
>> meantime we need to fix this test to be able to fail gracefully and not
>> crash CI.
>
> Yeah, for that lockless algorithm if needed, we might want to use a 
> ww_mutex per engine or something,
> but point was that AFAICT at least one of the tests that set those 
> flags explicitly tested the functionality that no other engines than 
> the intended one was reset when the intel_engine_reset() function was 
> used, and then if GuC submission doesn't honor that, wouldn't a better 
> approach be to make a code comment around intel_engine_reset() to 
> explain the differences and disable that particular test for GuC?. 
> Also wouldn't we for example we see a duplicated full GT reset with 
> GuC if intel_engine_reset() fails as part of the 
> intel_gt_handle_error() function?
Re-reading this thread, I think there is a misunderstanding.

The selftests themselves have already been updated to support GuC based 
engine resets. That is done by submitting a hanging context and letting 
the GuC detect the hang and issue a reset. There is no mechanism 
available for i915 to directly issue or request an engine based reset 
(because i915 does not know what is running on any given engine at any 
given time, being disconnected from the scheduler).

So the tests are already correctly testing per engine resets and do not 
go anywhere near either intel_engine_reset() or intel_gt_handle_error() 
when GuC submission is used. The problem is what happens if the engine 
reset fails (which supposedly can only happen with broken hardware). In 
that scenario, there is an asynchronous message from GuC to i915 to 
notify us of the failure. The KMD receives that notification and then 
(eventually) calls intel_gt_handle_error() to issue a full GT reset. 
However, that is blocked because the selftest is not expecting it and 
has vetoed the possibility. A fix is required to allow that full GT 
reset to proceed and recover the hardware. At that point, the selftest 
should indeed fail because the reset was larger than expected. That 
should be handled by the fact the selftest issued work to other engines 
beside the target and expects those requests to complete successfully. 
In the case of the escalated GT reset, all those requests will be killed 
off as well. Thus the test will correctly fail.

John.


>
> I guess we could live with the hangcheck test being disabled for guc 
> submission until this is sorted out?
>
> /Thomas
>
>
>>
>> Matt
>>
>>> /Thomas
>>>
>>>
>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/i915/gt/selftest_hangcheck.c | 12 ++++++++----
>>>>   1 file changed, 8 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
>>>> b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
>>>> index 7e2d99dd012d..90a03c60c80c 100644
>>>> --- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
>>>> +++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
>>>> @@ -734,7 +734,8 @@ static int __igt_reset_engine(struct intel_gt
>>>> *gt, bool active)
>>>>                  reset_engine_count = i915_reset_engine_count(global,
>>>> engine);
>>>>                    st_engine_heartbeat_disable(engine);
>>>> -               set_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
>>>> +               if (!using_guc)
>>>> +                       set_bit(I915_RESET_ENGINE + id, &gt-
>>>>> reset.flags);
>>>>                  count = 0;
>>>>                  do {
>>>>                          struct i915_request *rq = NULL;
>>>> @@ -824,7 +825,8 @@ static int __igt_reset_engine(struct intel_gt
>>>> *gt, bool active)
>>>>                          if (err)
>>>>                                  break;
>>>>                  } while (time_before(jiffies, end_time));
>>>> -               clear_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
>>>> +               if (!using_guc)
>>>> +                       clear_bit(I915_RESET_ENGINE + id, &gt-
>>>>> reset.flags);
>>>>                  st_engine_heartbeat_enable(engine);
>>>>                  pr_info("%s: Completed %lu %s resets\n",
>>>>                          engine->name, count, active ? "active" :
>>>> "idle");
>>>> @@ -1042,7 +1044,8 @@ static int __igt_reset_engines(struct intel_gt
>>>> *gt,
>>>>                  yield(); /* start all threads before we begin */
>>>>                  st_engine_heartbeat_disable_no_pm(engine);
>>>> -               set_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
>>>> +               if (!using_guc)
>>>> +                       set_bit(I915_RESET_ENGINE + id, &gt-
>>>>> reset.flags);
>>>>                  do {
>>>>                          struct i915_request *rq = NULL;
>>>>                          struct intel_selftest_saved_policy saved;
>>>> @@ -1165,7 +1168,8 @@ static int __igt_reset_engines(struct intel_gt
>>>> *gt,
>>>>                          if (err)
>>>>                                  break;
>>>>                  } while (time_before(jiffies, end_time));
>>>> -               clear_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
>>>> +               if (!using_guc)
>>>> +                       clear_bit(I915_RESET_ENGINE + id, &gt-
>>>>> reset.flags);
>>>>                  st_engine_heartbeat_enable_no_pm(engine);
>>>>                    pr_info("i915_reset_engine(%s:%s): %lu resets\n",
>>>

