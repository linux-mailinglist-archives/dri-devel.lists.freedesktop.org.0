Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA89C4F9320
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 12:37:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A2710F0E7;
	Fri,  8 Apr 2022 10:36:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B7910F0A7;
 Fri,  8 Apr 2022 10:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649414217; x=1680950217;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ApBb5EdNznwaiATrrLwMNFyjIOJlmyKJUWFIF4fy8PQ=;
 b=bRNoHA4n3uIwqWg43tnyyeP2llUH7ssHF/r9GB7J6nUr1G2JWOQ+DicY
 T+Zcp4rFK5oxw3xbFPlwvQprX4pPraj8zYypq6MGVrS7Vxz2lo1ka3kNF
 ByUWnUFGAdtCx2Dlm/QhHWZj4rqRNJMvHKWB7IGposDv81ES3GYL5I6dY
 Vd8if6icMLKanvjrezFJUf83MtPwb4beeR91MIzx7V4G3lEtvv/9b/AmK
 iNh+EvEzi/miIRXPh2dO6N1XwFtiwggS0W4aTaCwSorGygp23Ld2mt7Vq
 Z2s1Af+I43wzvJBuZzD0xWgwDyiJsqiRrUZ2bm1MEEgBaCxf7RYCbLS2b g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="249093536"
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="249093536"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 03:36:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="794823139"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga006.fm.intel.com with ESMTP; 08 Apr 2022 03:36:56 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 8 Apr 2022 03:36:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 8 Apr 2022 03:36:55 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 8 Apr 2022 03:36:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h/a30O0+tMusq03mPTm6lmmqf37uf4UnpslfxGgGDToAyitfBIQJnmlZ2BAToDGV8G3mgIQJKoOlMGSe/oZcPhQnceee8i38bnDnYZ7iYYnjJM9Z2Cbm48b0uFoYmLjzESWaGcCS3HKFng/Q4dMMksx2jAmsPg0+0VQTkr0hwUkV6YEKj3/hvyLYJ9yoVJpcXvtt1ht+s6TyRKK2JGa74KDU45vqZxNIJlpEGcSqBErn5jIoltgVSP1lojGTHS92zyJyeCatQfMcIaUZ7kIwLvPgWAp+L1L+GOHvEfh9B8QgRp+5Uqr5i0QdNDAdjXI2/gRvQpeFiwPAnuEy9rpLGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1K6jOdbCttgLramIbqgCalXZS47s7C3/0zYJkSj6qZI=;
 b=OvLH3jEyioSIIhAGlZbJQv/U0UgSIqbeFkFb38j0IasUuTuNbdsl3lyNxv/AlLtSDLBuxSEsV/ZtEY0BQLAeEOPmcyfJDB/EAj2ur7qSaJWFiuRXbZsyF/TJsV1fU8X1HwjIHJe/c+4EP+Uwatumz7iCGSnZc/lB/DXqhtYhA4dv14j2BOXO0nPLd/kNSp6oKBPgYOWJLqrFDmeAa73+0oNL4PkSk1B3Ff7KjnoLEZLFGfxt/aZAu+UL9gruQeMthRS782aTtaRdATwSLK7nNgFSdvaLtNHyQUCZrfbjUbXKowC4z7KhSyy2vmdjIMQFC26M6a6o9vxRZzK65y+9Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5726.namprd11.prod.outlook.com (2603:10b6:408:161::19)
 by BN6PR11MB4083.namprd11.prod.outlook.com (2603:10b6:405:7a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 10:36:52 +0000
Received: from BN0PR11MB5726.namprd11.prod.outlook.com
 ([fe80::6005:d359:1ea5:9572]) by BN0PR11MB5726.namprd11.prod.outlook.com
 ([fe80::6005:d359:1ea5:9572%6]) with mapi id 15.20.5144.022; Fri, 8 Apr 2022
 10:36:52 +0000
Message-ID: <940698f4-d14e-9a7c-d1b4-e7849de0b42a@intel.com>
Date: Fri, 8 Apr 2022 16:06:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/display/debugfs: Add connector
 debugfs for "output_bpc"
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>
References: <20220328075020.708022-1-bhanuprakash.modem@intel.com>
 <20220329060731.785476-1-bhanuprakash.modem@intel.com>
 <877d897z90.fsf@intel.com> <b5041da6-9a2b-c687-5dc9-c587eb6230b4@intel.com>
 <87fsmt6s8w.fsf@intel.com> <YksRxORJDvfigbZG@phenom.ffwll.local>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Organization: Intel
In-Reply-To: <YksRxORJDvfigbZG@phenom.ffwll.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN0PR01CA0005.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::10) To BN0PR11MB5726.namprd11.prod.outlook.com
 (2603:10b6:408:161::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bdc3823c-a4b4-41b8-5fbf-08da194bb194
X-MS-TrafficTypeDiagnostic: BN6PR11MB4083:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BN6PR11MB4083D3496BE56FB526F7056E8DE99@BN6PR11MB4083.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ua7vIiULxVu/2bcgK/j1GUnPWSGixLexAJftZ+Ez3aDNO44JInuy5PikuosVJb4ZcOgoT4iAFUlncg4XXyN99JkjbBs7/QDqgeUAmPo7rB7Dn5PdeCebdmHbDzw+PS08hVJUp21ipK+VELHoU/4lyApc3tLVXpMENGqnEFBVmHhxm8ON1ArWEgRpjO1KYQchVxXL7LTVPF/dH/4YE0uvfUZJW6lh76sgKNvxC/GoCQ364sKKPCEgaL5UmGJwT0lNQq93jm122J1u+eC0brRVuLpsMgj4Hi9wFTASM7idEJNopBA9FopyYxDZ4QJYhcpRh8+N8t1mev9nfSgiiau6YFDUt2Ve4M/zJ+S54ZQG8Lc5oSfafvyY6+FbVJGoBIKo8/cD1ytBSaxFlvF27b91cPFs+17ePUcHra2wYl6FipbOVwSdMq3ewIc19m9M0pGCL4pjpbZgCmgBXasDkA3gaq1jJvV4wJXrQ88ONIOnG/VU3SP8XwT2oCES/IrUa7/qZEb5LsWxQH9OGH1pWbr7xB52fMlCxoyx99XeVqHxmIoB6hdQtywMwCUW+bxbJ2xy8BuPiL+joSHUO0vbpSqV/Rct8R1UQkxrrGXbFsQXpdATlZiMq1sA0s32qE7KPvA98O3GlsPzjT90tcJN7gRN1ZobdzuXo90HpvDTFd1FS5UKbfPwqSMoq4NcPgj5g5Nj6JlXIWZjH3t/bGN0737KtqXlvEJhfLRHtBdbLQQXzEw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5726.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8676002)(66946007)(66556008)(66476007)(4326008)(82960400001)(2616005)(316002)(186003)(8936002)(6506007)(26005)(31686004)(110136005)(36916002)(66574015)(5660300002)(54906003)(6666004)(36756003)(6486002)(508600001)(86362001)(31696002)(966005)(2906002)(6512007)(38100700002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0xXa0xJREM1ZHRTckZ6cnUzaDMydGdpUXY1U0h2Z1ZyZkZobjBUVHFISlZW?=
 =?utf-8?B?UFdUcnJrYXZHdlVOZzE4U2ZLb1UxU0JGSHR2dFlvYWo0Y3hOcVg5dkxCUEg3?=
 =?utf-8?B?bjZGajVLb0Zxa1dEK1d5UVAyNmpqMFdzb29CeUdodkFHaSt6T0NUVXlMQmxE?=
 =?utf-8?B?Nm9Lek8zWVdGa2s5UnBDMnZGMnFyaGFkeEJNd1BGd3VqWEd3NFJ4V3FBYVZN?=
 =?utf-8?B?blRlamlPWW5GMmViRWdYZjdEQW9LSTlaOFZwRjhucmE4K3RqR2hxMUROaVBG?=
 =?utf-8?B?SGhLcnhUa3MwSDUyZmp6ekdDbmo0b0Y5ZTZ6OE9zUjc4MEhJZ0orZTBpMktz?=
 =?utf-8?B?dHZNNVZ4VTh0Vzh4ZGVEQUwyVnF3SVFEZGlOd0hNQmlacFJRZUVxeTRyeVhw?=
 =?utf-8?B?VXN6Um54L2haSWRuQk1vRDJTRlpVYTltdFNLTE1Za3JGVEl4cmx2aU9UdmJO?=
 =?utf-8?B?ZzE2aVF1UXZvSmZpOUtLd2g2bFN3WXRTMEk4MmxKWWxuTFAxbEM2NkhWSXVl?=
 =?utf-8?B?UWxNRTFkNzZmWmZITnBPTFdadDRtM1Brb1lHcWlaQ2ZGT2xVci9xQWlNUzdx?=
 =?utf-8?B?RkFDdkc4QjM4UVY1SXVEMFdSajNxRkJ3RDJZTkEwYUtBSTA3dUl0S1Q0UUhI?=
 =?utf-8?B?eXBZZ1JVYXBjR3NSeE0xMU5DVjlVYm1NYTdIZnpFaEhwN1FjcGVUSkxobmpz?=
 =?utf-8?B?dVNHMm1yZUpEYlFpNGQvWnlSZTNEYkRnZnF1R0paOExNMzEzV2R0Rnl2SmhD?=
 =?utf-8?B?TkphZ3ZRelU3WmZSMHFiNWFmMVB0dTZ3MlRVSkZFbTRVejJUTVZHMTlUbktC?=
 =?utf-8?B?NDdPZHY1d0pkL2hvRFc4bXZ4NXVwMGYyMGhGc3Q3eks0VDd1SzVScnFJR09w?=
 =?utf-8?B?bVl3UldBa3MzbS9DWi9FaU40VnlDRG8xQWpMWERUS1o4MjQrWW1pN0g2MS9v?=
 =?utf-8?B?U0dVdWZHZUx4V2ZRazBtSUxoSDdCZ2VxSm8xTVRQR2hPdTlTODlJQncwR3dT?=
 =?utf-8?B?QzN5K2NlZmxmWSt2SGozWjhuaUVLS2NjaUprYlM0aDdDdVhLYzkwa1dCSGlj?=
 =?utf-8?B?cTBHdjNnZTM5WDl5aDZWVUJMZzUvWFJCOWorR2h4WWgraFVrMmV2TEpIOUZH?=
 =?utf-8?B?RWxhT05tbWNCQWx4bnJXVklEQWIrZXM5UEFwOVd3RW9oM2g3bHY2R29xWFli?=
 =?utf-8?B?ZEhmeW0rVDdyS0E3ZnlWclNQV3dGMDVMK2hxS1VzSnd6eFVINS9WUytwd2g2?=
 =?utf-8?B?YTBIZ2QycGVJdGNxR0tkTnEvN3RjTk9EL1NpeENKWTFVT2FoUVpMVDE5OTAz?=
 =?utf-8?B?LzVPc1lZK1lFWDJwT0NuTkR5VHZPS2xmdkNzZmQrUFd4bERpVzdJa25xM1VX?=
 =?utf-8?B?bmR1T3NTWGxzWHRWdmwvZHhRTm55YnJHWlZ4SGtyNVNzeFJJUzA4dUJmM3c4?=
 =?utf-8?B?ZVB0N0Q1a1NDNnlVcVljejlBTEczVG9VTEZOS2lKRTBEVDMyWG56YkIwR3Zi?=
 =?utf-8?B?dUZHanZuTlNOUUpaSnNCTWFLZ0VSTFN2cEVkN3FtSURKK2htZjVRT2ZLTGp2?=
 =?utf-8?B?elJUVktKblUyNjhCVU9DMHc1N0E5OW03N2l5a2RoOW9ZcmxQNHAydnJzR0Vt?=
 =?utf-8?B?VkZXNkZDNW9mRVllMG84TU9wQmR2L3hzYVVjTXFFZ09tbm94S1FoNG1hUG5N?=
 =?utf-8?B?eUNUbGpTd0lYSW00U2krNm5Db0ttSSs3L3ZXUzNLSmhrbDBZM3Vpc3ZFR1Fw?=
 =?utf-8?B?aFMyZGFXTlFubjdYdVVXeTk3VmxaQ2o1cWNITDVsNVNtS2xWSk5Dd1ZQNmJw?=
 =?utf-8?B?U1BSdjM2aE95b282b3RNN2liREVjdDY2eTYxNTQ3cEoycm1jNk1oUmczNk9h?=
 =?utf-8?B?M2ZpcjJHM0lYVVV4ZDhXSmJOdEo2aUdRN3BaVVJkSXg3TjFmMU1MODNsRmVX?=
 =?utf-8?B?S0FNckl6S3lBRjZPbitXNTFwcXljTTZKekl0UjN4VFErKzZKUXlwZjhZR21S?=
 =?utf-8?B?eFZzRDRjOVB2aFlBUmpHVXFXeG9JNzlWVTNmL0hYZDRsMnpITStrZGhaZTRj?=
 =?utf-8?B?MTRKcUQxcGxTNldFSXl2bzZBWlp4THRGYUdKVkFSODdYYmM1ekNEcGNhLy9p?=
 =?utf-8?B?RzVndVZYaXp3NFpGRkI5eTFndHFQOS9NY1ZybDE5RFhWaTJvQ3pTNlRuYVhh?=
 =?utf-8?B?SExEb0R3UGI2ZUptdWtIZ0xwZFkraURRdWdnR0V2RVFjZUFQWWlwNHFlbEI1?=
 =?utf-8?B?UmhWUTVRaktaekN2Y1FreE0veEVyOElXRHE4dFBVZUx4dlI0S29IU2JzbCt0?=
 =?utf-8?B?ODdUb3F2Qjd6azhVd0Q0NlM2ZVlNdlkwVFdEWVgycmJFZUJRWjlkNUlvSk5k?=
 =?utf-8?Q?zvDqoDsntNdj7enY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bdc3823c-a4b4-41b8-5fbf-08da194bb194
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5726.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 10:36:52.2316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p2sgsDbNvvQwyf1te6DiTwgA8NzbohYr+baOkZew8fXOojaS+C61cqS4n8Vm9SsZpIzxuIiOVZuWpE7rhD2G6PGRbY0dtkNpoeEivKZxLXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4083
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
Cc: Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arek@hiler.eu>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, airlied@linux.ie,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon-04-04-2022 09:11 pm, Daniel Vetter wrote:
> On Mon, Apr 04, 2022 at 01:46:23PM +0300, Jani Nikula wrote:
>> On Mon, 04 Apr 2022, "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com> wrote:
>>> On Fri-01-04-2022 06:10 pm, Jani Nikula wrote:
>>>> On Tue, 29 Mar 2022, Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:
>>>>> This new debugfs will expose the connector's max supported bpc
>>>>> and the bpc currently using. It is very useful for verifying
>>>>> whether we enter the correct output color depth from IGT.
>>>>>
>>>>> Example:
>>>>> cat /sys/kernel/debug/dri/0/DP-1/output_bpc
>>>>> Current: 8
>>>>> Maximum: 10
>>>>>
>>>>> V2: Add connector's max bpc to i915_display_info
>>>>>
>>>>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>>>> Cc: Uma Shankar <uma.shankar@intel.com>
>>>>> Cc: Swati Sharma <swati2.sharma@intel.com>
>>>>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>>>> ---
>>>>>    .../drm/i915/display/intel_display_debugfs.c  | 46 +++++++++++++++++++
>>>>>    1 file changed, 46 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
>>>>> index c1e74a13a0828..694d27f3b109c 100644
>>>>> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
>>>>> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
>>>>> @@ -663,6 +663,8 @@ static void intel_connector_info(struct seq_file *m,
>>>>>    	seq_puts(m, "\tHDCP version: ");
>>>>>    	intel_hdcp_info(m, intel_connector);
>>>>>    
>>>>> +	seq_printf(m, "\tmax bpc: %u\n", connector->display_info.bpc);
>>>>> +
>>>>>    	intel_panel_info(m, intel_connector);
>>>>>    
>>>>>    	seq_printf(m, "\tmodes:\n");
>>>>> @@ -2275,6 +2277,47 @@ static const struct file_operations i915_dsc_bpp_fops = {
>>>>>    	.write = i915_dsc_bpp_write
>>>>>    };
>>>>>    
>>>>> +/*
>>>>> + * Returns the maximum output bpc for the connector.
>>>>> + * Example usage: cat /sys/kernel/debug/dri/0/DP-1/output_bpc
>>>>> + */
>>>>> +static int output_bpc_show(struct seq_file *m, void *data)
>>>>> +{
>>>>> +	struct drm_connector *connector = m->private;
>>>>> +	struct drm_device *dev = connector->dev;
>>>>> +	struct drm_crtc *crtc;
>>>>> +	struct intel_crtc_state *crtc_state;
>>>>> +	struct intel_encoder *encoder = intel_attached_encoder(to_intel_connector(connector));
>>>>> +	int res;
>>>>> +
>>>>> +	if (!encoder)
>>>>> +		return -ENODEV;
>>>>> +
>>>>> +	res = drm_modeset_lock_single_interruptible(&dev->mode_config.connection_mutex);
>>>>> +	if (res)
>>>>> +		return res;
>>>>> +
>>>>> +	crtc = connector->state->crtc;
>>>>> +	if (connector->status != connector_status_connected || !crtc) {
>>>>> +		res = -ENODEV;
>>>>> +		goto unlock;
>>>>> +	}
>>>>> +
>>>>> +	crtc_state = to_intel_crtc_state(crtc->state);
>>>>> +	if (!crtc_state->hw.active)
>>>>> +		goto unlock;
>>>>> +
>>>>> +	seq_printf(m, "Current: %u\n", crtc_state->pipe_bpp / 3);
>>>>> +	seq_printf(m, "Maximum: %u\n", connector->display_info.bpc);
>>>>> +	res = 0;
>>>>> +
>>>>> +unlock:
>>>>> +	drm_modeset_unlock(&dev->mode_config.connection_mutex);
>>>>> +
>>>>> +	return res;
>>>>> +}
>>>>> +DEFINE_SHOW_ATTRIBUTE(output_bpc);
>>>>
>>>> Looks like an excessive amount of code for a single value.
>>>
>>> Yeah, but these values are very helpful in many IGT tests like
>>> kms_color, kms_hdr, kms_dither, kms_dsc etc..
>>>
>>> Otherwise IGT needs to request the kernel to get the EDID, and parse
>>> that EDID to get the "Maximum" value which is redundant (Kernel is
>>> already doing the same) and not recommended in IGT.
>>>
>>> And there is no way to get the "Current" value except reading it from
>>> i915_display_info which is again not recommended in IGT (As
>>> i915_display_info is Intel specific).
>>
>> Note how we have intel_connector_debugfs_add() for connector debugfs and
>> intel_crtc_debugfs_add() for crtc debugfs, and how this patch just mixes
>> up the two by looking up crtc and state from the connector debugfs.
>>
>>> This debugfs is already introduced & using by AMD:
>>> https://patchwork.freedesktop.org/patch/308586
>>
>> Wait, what?
>>
>> Both amd and i915 adding the name "output_bpc" is *not* the way to
>> roll. We only add i915_ prefixed debugfs files from i915.ko.
> 
> Yeah vendor prefix would be nice, but it's debugfs so we can always fix
> it.
> 
> Also would be really good to pull that output_bpc into drm core if it's
> something standard that igts need in general, so ideally we don't just
> standardize the drm side, but also the testcases that need this and make
> them generic to run on any kms driver.

I made the required changes in both IGT & Kernel and floated to ML, 
please help to review.

IGT: https://patchwork.freedesktop.org/series/102387/
Kernel: https://patchwork.freedesktop.org/series/102390/

- Bhanu

> -Daniel
> 
>>
>> If you need this to be a standard interface across drivers, IMO it
>> should be added in common drm code, not sprinkled around in drivers.
>>
>> I see that amd is already using this in what is basically drm core
>> debugfs namespace, and there's amd specific IGT built on top.
>>
>> Adding a bunch of Cc's to get some clarity on drm debugfs naming and
>> usage.
>>
>>
>> BR,
>> Jani.
>>
>>
>>>
>>> - Bhanu
>>>
>>>>
>>>> BR,
>>>> Jani.
>>>>
>>>>> +
>>>>>    /**
>>>>>     * intel_connector_debugfs_add - add i915 specific connector debugfs files
>>>>>     * @connector: pointer to a registered drm_connector
>>>>> @@ -2330,6 +2373,9 @@ void intel_connector_debugfs_add(struct intel_connector *intel_connector)
>>>>>    	    connector->connector_type == DRM_MODE_CONNECTOR_HDMIB)
>>>>>    		debugfs_create_file("i915_lpsp_capability", 0444, root,
>>>>>    				    connector, &i915_lpsp_capability_fops);
>>>>> +
>>>>> +	debugfs_create_file("output_bpc", 0444, root,
>>>>> +			    connector, &output_bpc_fops);
>>>>>    }
>>>>>    
>>>>>    /**
>>>>
>>>
>>
>> -- 
>> Jani Nikula, Intel Open Source Graphics Center
> 

