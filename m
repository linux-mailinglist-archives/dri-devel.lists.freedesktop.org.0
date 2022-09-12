Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86ED65B6453
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 01:47:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C63710E49A;
	Mon, 12 Sep 2022 23:46:59 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ABDE10E488;
 Mon, 12 Sep 2022 23:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663026416; x=1694562416;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uYubv7Php+2k+DVQl6gaGC1KWdyQjGmvpoiRp4U3GX4=;
 b=mcpXpLQp4SmN1fZdpVsXhFHVVVnXLovCK21pdHFXFfCW2IQoS/bLw5za
 3aOFrOCcyNdifScBJcoigtfO0NqFqKJVPxKfhY6iHDs2FF+RxHyfhIBEY
 jr8GR+A5vWPn62Q0oaiFUnEjvWD6Nf6a3v7Z93UCou7a7j0kddK70rKjH
 KSttOALF8nzzW0wRY1VRwAId5AK6udh50dXUFBdY7Og9o32gXDefmWmA3
 I6TU5HF38aiLPT1di/ovoHAl1JEHmb5iHfQMWZivXj0CQpSrMN+4s1T07
 YKUpc8Cs1MsxFvqGfBvzpZO5t7kItryYkdbqZS2HFwbyzF1Zx5iOtLdqn w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="281013828"
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200"; d="scan'208";a="281013828"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 16:46:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200"; d="scan'208";a="861336996"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 12 Sep 2022 16:46:54 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 12 Sep 2022 16:46:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 12 Sep 2022 16:46:53 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 12 Sep 2022 16:46:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BP5/SDh0JbRlvuZVW7WotpQWARgKjM9UXapAoF7BmrgGnHrUVcjoSeQu+R+AloXlbj+tU91hxpYCHsS8lXG5mfGfuO/xqgGuEPnhsq3/44grxXpmjjsluYJPH0mnSclZLzuRqVVSvhzHnpwdvMLJmPj/IGZhwXstboYRrt5O0Y/gdKVA3v33J2i7EE1Lls78687Q8wBbbXVHbJW3cYBEco9ir6z5sjQk8UlG0TjImpc/1xKSvix520dRR/05Ufo7BWrULp9DN5bWnb7cGI2pLGsWKb1lYvFjP3iz9Vr3gQ04pPnC17MiHHgnZ6JL63GdbbvePz33++hK/IwnVdpxGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4uzTjMySjGaPxK023gu//b4dM6/Z2xyrDwL+Ff/IRA=;
 b=TpZXbrwJHz/bd98kDiVpseNxcAjUmwCdoLAhrQylvn7MBpKnNZjIiGQZRx4G/6ggrAzuRPsak1eoLvTfq/U3kL8BfhPwzeh6sgonWRIKKs4sTiY4yamtqIF1FzbP9oMOs6+ue3OCX0gADTEHZRMVeWAUGeHRjbncVdRnD6cn/JuhVXZci35UWs2busbTZBranUgR0zuLDY7ARfWnPcF1cckYdetBzrahQ8eaLZr/uPap9IlPOOrJ2QZxIal4LeaqgG+yAf9BmulCfVR0Ntsvn/Bdm31TQT7MXNB0Ef+bcytbM/r6gDXPgLq7TDAItw5aw5sApTwsFj/JguSsOPlXkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by PH0PR11MB4952.namprd11.prod.outlook.com (2603:10b6:510:40::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Mon, 12 Sep
 2022 23:46:50 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::fcdf:8f15:5eaf:b57]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::fcdf:8f15:5eaf:b57%6]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 23:46:50 +0000
Message-ID: <39933311-3d29-a4ce-baaa-0d4bafbac90d@intel.com>
Date: Mon, 12 Sep 2022 16:46:48 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.13.0
Subject: Re: [Intel-gfx] [PATCH 6/7] drm/i915/guc: Make GuC log sizes runtime
 configurable
Content-Language: en-GB
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220728022028.2190627-1-John.C.Harrison@Intel.com>
 <20220728022028.2190627-7-John.C.Harrison@Intel.com>
 <166133167788.14547.12249088266216764022@jlahtine-mobl.ger.corp.intel.com>
 <4bd7b51a-caf0-d987-c7df-6cfb24f36597@intel.com>
 <166141170600.5625.4355115277022948576@jlahtine-mobl.ger.corp.intel.com>
 <899bfc43-cc8e-1e26-a58d-eeb80ed74d06@intel.com>
 <166149498818.8619.15466495110393449610@jlahtine-mobl.ger.corp.intel.com>
 <166296674451.3878.1653374638638017690@jlahtine-mobl.ger.corp.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <166296674451.3878.1653374638638017690@jlahtine-mobl.ger.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::23) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|PH0PR11MB4952:EE_
X-MS-Office365-Filtering-Correlation-Id: f918e363-161d-489c-e7ed-08da9519103e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IpOx69l2fxqWCMsW6Rb2YsLG81plsQ4kopnXcieRr1hPhnmn0ZG9QbKEhd+cxNFOdveXHikk9pogQ0bR/5/qfUu7IDP96prqBpUmuy6L3Wt3No7DKWRi4nU8mmqrg76jGMJZp+gJ9YydybQXv6+wlPrBRNcajEpJH6uH2JJDKSlkqQ93uqpvEDoIH2uTSO53r23/8js8NkqsPiS7FXJLb1OqDTL1AjNMpcUxX1voL7sLu4/750usD0lcpiQbrSbSF5QazHSbBHOuelC1V2aluLr2XtAlrEjTWQhC4BDrUkkmTI6T38Yipw5XbivFsb5Pv03Qfw2Q7v/89gzna5jVUfSFUtcyuwkFzNKxJc6K/+vo3725QPUofRNugpqyX2Id6jdfcSER1pO0s1ohxJPDv5jTYQDheu3XOrDL9/wipTSc5FTS8UE+yso3AcGJABGQpElw8+jnJZ6e4FaveobyjSow21uMf50TBlnXp+1mEQHpXqyxA2e7pAWE1TZPkpuO0SrbC8u96IaJPxVOz8PJnJzQSbLb/venAedD2K/HdQISdqu0AbksQSYNtutFg9EPUB4EoIFR9LEUTsG9Fczvy31TaKG6ahHZvqn8PgOyL+mBQZx5q+1RXN5uWPegFFRUjcHhM/Km+XVO4w6KkVTlsm42/34axXRbfW9LxI36A0zw5x/unW6JC4Y2FMSgs9d8+XDZH9Fhtqp2+MSGAoDOgZiR7I7+2rS42DNL07tZOKVNMXd8QMKx1zd1fiUtrEWAht7RpFYeIe3H/SSZOO0uAJL9bYGQCk0AJkjXhG0pS/o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(136003)(396003)(39860400002)(366004)(376002)(451199015)(6486002)(6506007)(66476007)(53546011)(26005)(5660300002)(82960400001)(478600001)(38100700002)(66556008)(66946007)(316002)(41300700001)(4326008)(31686004)(31696002)(86362001)(2906002)(6512007)(186003)(36756003)(2616005)(8936002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXFjNjVSMDArZEZWT3pVY0U0RlBWc051elZ2bXluS3d2SXRvTXpmUU9wN1Vm?=
 =?utf-8?B?NTg4NFVkaCtpLy9ndHhWWm1aOWVXUmV0dnh3ZjZRRlBXY0JuWktnOXY0emxm?=
 =?utf-8?B?NmtJc2h6a1pEbm1vc1BoeTAyTXQ3Vy9COHNzWEt3VFloNjd1N2d4d0ZLYzhO?=
 =?utf-8?B?ZmRzemc5aEJNZ29TNFZNZC8wL29pZkZQUFdCRVZwazhKY1hqa0UvcGFZeSt3?=
 =?utf-8?B?eEVyNm8veUdFSFBYUGpmdXJBUnE0ZnpNak51Vmt3MDd2WmdmanJSWGtNTVVw?=
 =?utf-8?B?N1dSWFA5QTFqTlhhVTFpR2FOYVY1K0pEMmZLZG5zekFtakdQM2F2bVYvSVZT?=
 =?utf-8?B?S1o4QnBEaHVoeXRXNmtuU2VCTk42UGZLVXdaWHdiWjUxSXpVRUpUTkU5TlZJ?=
 =?utf-8?B?c1NBT2g3dlp1YlNCdHJnaHNjRUExR3BONjFvNGRaWkdmMDNTSVVOWlBMV2xa?=
 =?utf-8?B?TmVrYUFLb3ZhWlplY0pUck84UThleFI0L3JDWml1bFh2N0Y5a0s2c2ozRGFy?=
 =?utf-8?B?YksvbEEwZmVtOWFlbnFNRUsvR0NUQm85R2xjVjl6RE1DdC9Pbjd2UHVIdXF0?=
 =?utf-8?B?THVleUJqcXJQU1lObWpYamE0VSs5ZnZSZUlSWFc2bWxqTVFEbkxZVGQvSEkw?=
 =?utf-8?B?VjgxT09zblE1eU9jTVE3Q1g1N3dPTHFsWVd2bEp4YzJZUC9yN3JoM0gwSFkv?=
 =?utf-8?B?L1NjTUdBU2s5SXFzTHFBWkdCaVVsWHlCUFEwenQ3VmZKNWJNQXJBNU4vYlhp?=
 =?utf-8?B?cGhia09tYlV1d2NHRUhUV2tCOHBqcXF2b2RlbTlhZjdneEpqN3JWbG11azV5?=
 =?utf-8?B?TmMxZVVYVXA1cCt1U05KQnhtY05FVDFPdFRudjlVK2ZvZDhzbVNXOVVKWFlU?=
 =?utf-8?B?R0oza2hQOTh2UFFycm8rMytpWVdxTUN1NFFmUlZZbm94VUtYN09OcUx4bFlh?=
 =?utf-8?B?QVU3VFRkMEMrUGJSTkx2UTlvNmUvZ2E5YVBHOTZsWTVXNXo0WmptMUFZUlc0?=
 =?utf-8?B?N0djMWNRS2w3bVZoekFXTU52cVpFaVpYUXZSVWJRa29ESVZydFBEMjM4TjNx?=
 =?utf-8?B?MTlhNTMzVkkxU1ZYODZUWGtqKy9ZWkJhWHh6MkFSMDU0WURMYVNvYy9naXJT?=
 =?utf-8?B?U2dsUGR4dEk5NE85a1lYZDBlQURDSWt2Nm03ekhlK0U0QzNDcFl0c0pzZUtZ?=
 =?utf-8?B?eEdNenZXNnRRWFArQ3U3WTE2cnpla3RJUHdFNWViaGxuT1lweSsraXRHSkl1?=
 =?utf-8?B?RDZIbEYza1NlM214cHpEL0oyQW5ONzNraDNVb01GNlhjSDNBcU1SbGlxdnFO?=
 =?utf-8?B?cjB4TjhzTXVwdnR2K0V0OGN5ZHRCZnBPSmV3WEtsMkZpcHRQMGVVM1V2Y2RN?=
 =?utf-8?B?STFzZHpkeHc5VnNKaS92bzRkVEJNQTNoU2tqZmVwUU9DNGk5d0RSb2JpQmto?=
 =?utf-8?B?NkJvWSt2Q3ZyUjVLZFpsVUVQVnVaeWE3eUJUSE5pK1dwMkdpa3ZXaTVuNTVT?=
 =?utf-8?B?TVBpTTJ3WTFYQjJOTGFaYnZndG1wVmpSY0JtNEhnVWRjc2xpYjBDU2FpWmZn?=
 =?utf-8?B?WmE1aUdwVFkwVFlvRTRRemRxNE93YlB6d0JPTGV1bTRqcUJLdzI0bXc5U0Uw?=
 =?utf-8?B?ZDUzTXNBNURMVmhxem1uTThITmV0S0FEVU5IY0hjTkZScGt3Z2IwR1U5QWJ3?=
 =?utf-8?B?bnBYTy9ZKzdLbitzcGtZTC9qMmpyZlhQckpqSEQ1TnJwa05VUkZvelkrK0Nj?=
 =?utf-8?B?SlI4d3F6K1E1Vkk1dGFkbFVxaXBhQjNHZXp2aDBKWnZ2L3N3M0JFdmdVYjd3?=
 =?utf-8?B?MkpEOWRLRG5xbmZrYmFtTmpRU2xLU1NPcWZMY0hyRkc3NHZKSlJaUm94V1Rx?=
 =?utf-8?B?ajhqZVdUTDZTaWUyUVVNdnMrMFQyVEhtWHdIcXIwRmZENUYzTGtPNzdnb0lV?=
 =?utf-8?B?UlA2aUVFYVhPYTlsNmFLb01OQVNRY0RmSE1EZmhwdEFrK2ZDNTFsVE5ndTRr?=
 =?utf-8?B?WldUWHczL0xJLzV0bm5QQzJKTk95SlgzT1ZKclZOOHNnak5mZFBSR0oxakpP?=
 =?utf-8?B?bWV1LzBLK3prZ0F6a1BBVHQ2dEhhVyt1TGtheTB3TFVMek5LYkxrMUY4Qkxi?=
 =?utf-8?B?aVlPZm9PTWNMMGFrOEIycG5McjI3T20xMjZmSnFZRk9RT0hRYVR2ZlFIb3p2?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f918e363-161d-489c-e7ed-08da9519103e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 23:46:50.6563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BMWxca8i8oPNQkEcInAr6EKQ7SGBjekOvqLkiOK8cSEQ+/iyq9+wFeoWO0nAhIcfcQeE2m7tlbASIRrVzpqeXctzSVwXKTtbU8+T0CpQ6lw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4952
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

On 9/12/2022 00:12, Joonas Lahtinen wrote:
> Quoting Joonas Lahtinen (2022-08-26 09:23:08)
>> Quoting John Harrison (2022-08-25 19:31:39)
>>> On 8/25/2022 00:15, Joonas Lahtinen wrote:
>>>> Quoting John Harrison (2022-08-24 21:45:09)
>>>>> We also don't want to tie the GuC logging buffer size to the DRM
>>>>> debugging output. Enabling kernel debug output can change timings and
>>>>> prevent the issue that one is trying to capture in the GuC log. And it
>>>>> seems unlikely we could add an entire new top level DRM debug flag just
>>>>> for an internal i915 only log buffer size. Plus drm.debug is explicitly
>>>>> stated as being dynamically changeable via sysfs at any time. The GuC
>>>>> log buffer size cannot be changed without reloading the i915 driver. Or
>>>>> at least, not without reloading the GuC, but we definitely don't want to
>>>>> create a UAPI for arbitrarily reloading the GuC.
>>>>>
>>>>> We can make these parameters 'unsafe' so that they taint the kernel if
>>>>> used. But this is exactly what module parameters are for - configuration
>>>>> that we don't want to hardcode as CONFIG options but which must be set
>>>>> at module load time.
>>>> It's better to have sane defaults. And if somebody wants something
>>>> strange, they can have a Kconfig behind EXPERT option. But even then
>>>> there should really be need for it.
>>> Define sane.
>> I was hoping you would be the expert on that as you've suggested the
>> patch to begin with.
And as the 'expert' I suggested an approach that everyone was happy with 
except for yourself.

>>
>> Try to aim to cover >90% of the debug scenarios (that are only 0.001%) and
>> we're already only needing to recompile kernel in 1 per million cases.
>>
>> We can live with that.
This is not about how many instances of debug scenarios need a rebuild. 
It's about whether or not the person doing the repro has the ability to 
rebuild a custom kernel.

>>
>> I will push a fixup to remove the module parameters, please figure the
>> rest out in a timely manner.
Your fixup was evidently not tested because it broke non-debug builds.

> John, what is the status of the followup patch here to configure those
> reasonable defaults?
>
> We shouldn't be ignoring this and proceed to pile other GuC patches
> on top.
Being out of office is not ignoring.

And I don't see what other options we have. Setting a large default 
means that the vast majority of people who don't care about GuC will 
have their error capture logs filled with apparent gibberish in the form 
of a huge ASCII dump of the GuC log binary data. Which is something that 
people will surely complain about. Whereas setting a 'sensibly small' 
default means that we won't be able to use the GuC logs in many of the 
cases where we actually need to.

So right now, it seems the only choice we have is to fix up the broken 
driver caused by your incomplete removal and then re-add the module 
parameter to our internal tree so that our internal customers can at 
least use it.

John.


>
> Regards, Joonas

