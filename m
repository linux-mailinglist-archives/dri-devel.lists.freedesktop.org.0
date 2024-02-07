Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D903F84D3BC
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 22:23:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D23F610E02F;
	Wed,  7 Feb 2024 21:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H7+N/4Je";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Wed, 07 Feb 2024 21:23:50 UTC
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DEA610E02F;
 Wed,  7 Feb 2024 21:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707341031; x=1738877031;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=75fX/AZZ8bD2VgqOdXGmkWk6qKZG6trd0tn/JIIDHiA=;
 b=H7+N/4Je3xCfMOCVIoLjhsxRaiPeXKsuIe+WOsqMtY47HkjnULB8C/qL
 xR66jJm+wrZhBD+QhwqhPI2bBjzgFLQnTeiOMHBshCzYZaQneRcsUASq3
 GzjMvkM2z/QHh8/efpNplsdeVM6xAxrG+wf6Q2RuApvDtkdo6e4Qx3bQd
 VSa9AgNZqe2NFpd1LEkdnTWEqJcHqXZ2cnPLFx1uF1Y9zZ+kQnk5Sz2Z8
 eLdCMsvYKwMoDeQ5fIPp3ww5mUuFhKBab2WQqpWXx79/oNcdSvZp9mqXk
 uBxgClsRr0YqYZLL7S68iRKW3XxrITGW9I/EBsvGJyqqi3KIZIqe6GuXY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="1228626"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="1228626"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 13:16:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="6089870"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2024 13:16:13 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 13:16:12 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 13:16:12 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 7 Feb 2024 13:16:12 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 7 Feb 2024 13:16:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BuYcZUICxyi0O4bnx1bJboGfy80PFeook6f8TNpME/XQBVI66P2dd0w3ENr1UVvUYA+HxmlrhfsD+SDJhU61ISf94SfsacdUg1p0OcIiQgfgmlg/du6UrKV74rCfJNIB496XR2dBb9nB+ov1XYVYEOSsShQ+714GO9AK7Q+xxHhPhZb6sRm6m8Azk5SmOU2tdaS730LWFEJcpzL8t8Asf42vfiYc6lm0nPgEHodo1rQjyRLIqIgF5mW+TIPuZ8bbOjYWbBRaLX8d5Ve9YJNWb+8X9dyc/bxQTb48o4VkoWyHy3u3xtdedY8jeHzGo84DH18MBxWEJr96YyZsrEdyPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pLetwrf48xa9noyAgLqDmUCLi05Y5WkKsJowc8XshjU=;
 b=Eq6PzgkGp78oVC2BOMAJcrx44KhHqP+m4md7knUNx5a4bqZVZalvRE8vSWo3WXWK2KhczP2yhWfq2SwQwSFGn/SlZfCa+AejjN8g+IF7jxjBkrWDL47Q9FAHUQXEgCsxdxUsiCEuxkIUVIQRJLGrUiRaCLtleN7tFJ99qLmOdN5xoDu8ApMDVrW+Djhw9FRAO21K8T4ZEZ2al2rkec88MZcRZxmap/B52kinxEnRYM0mXVOXv7Wv6wO99wjgr3vum87Lb3fFhRJK6uw2L6e75AhPfFRNaMnRiETcr64NP4MhSW5eb8pUkiKryo1p067ZjRcItN0qqsuCWQuuvvWVCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by BN9PR11MB5403.namprd11.prod.outlook.com (2603:10b6:408:11c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.38; Wed, 7 Feb
 2024 21:16:09 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f%3]) with mapi id 15.20.7249.038; Wed, 7 Feb 2024
 21:16:09 +0000
Message-ID: <8ecdf2d4-0913-4f23-9a9e-d8f68099ca70@intel.com>
Date: Wed, 7 Feb 2024 13:16:05 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] drm/i915: Add GuC submission interface version query
Content-Language: en-GB
To: "Souza, Jose" <jose.souza@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "tvrtko.ursulin@linux.intel.com"
 <tvrtko.ursulin@linux.intel.com>, "Intel-gfx@lists.freedesktop.org"
 <Intel-gfx@lists.freedesktop.org>
CC: "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>, "Ghuge, Sagar"
 <sagar.ghuge@intel.com>, "kenneth@whitecape.org" <kenneth@whitecape.org>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>,
 "Balasubrawmanian, Vivaik" <vivaik.balasubrawmanian@intel.com>
References: <20240207115612.1322778-1-tvrtko.ursulin@linux.intel.com>
 <32d9d60b-1cfc-4201-8817-d293abe1b39d@intel.com>
 <82ac1c74-5aa1-484d-9132-9b023c0e7a33@linux.intel.com>
 <1efb4711-80e7-4e22-a2e3-a7190bad69eb@intel.com>
 <cdf2554bdd2774d51bad89e415d4c46732d4fddb.camel@intel.com>
 <1e7161b0-5d42-4980-8a97-61083da15a69@intel.com>
 <3f3a8cab587e0f7c205f9170b0ba1feb23d315eb.camel@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <3f3a8cab587e0f7c205f9170b0ba1feb23d315eb.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0097.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::12) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|BN9PR11MB5403:EE_
X-MS-Office365-Filtering-Correlation-Id: 8197f13c-cc73-43cf-8a14-08dc28220151
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yX+27p53Gv/SL9HbtM03jDwihbjwvHqSytRyNLgVA/+rncZIPvc0fkX3lFUtY8XFl64NhtzuTPyZMXkS7+K4FoHpnsVRvztn1hol4LV841pzUOdwx9w0mmErRUqCk/CNI437mBr9IpleJ79SRNZZwQIi/fmC4lQr9SLR1GqFoete3wC6u24qAWG81fWgeWmrkuDigogzMr1kptrXD6PEwsD/Fv4I+0RH/nxuMTzNLn8u3Nn+Lj91euyoJ6VMovYeZYQtoRQAPpj1tZwFQybn5N1GR75pF975jT1EpsNoQBktJkWS61oFXEDwYA+UkoNEd7cIc2XXTmHPdhBqdJvSi9IE/zDyNP67cIOMqCqNI2lE8x0Shj2JXdH6iHHTi+rvdUWp+GJWG/Mxd/5Otjz9R9EjR9GwpbWTHbXjO277Xrylfw0+7vkwlD0dTdavsGKzmBw4TiO+s/j6mrEcFXV9yOzjKPe0VhDEcBW9jteB99w1qx4AGS26zs6LvzsqA10d6g2lIxbQLMIt6SUCB/lhgYqzKV2CUfdhnZOMc+fKw6FrDGWkg8vD6W3Q94Roq/Op
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(396003)(366004)(376002)(39860400002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(36756003)(41300700001)(31686004)(110136005)(66556008)(66476007)(66946007)(54906003)(316002)(5660300002)(86362001)(6486002)(478600001)(8936002)(82960400001)(31696002)(8676002)(38100700002)(4326008)(30864003)(2906002)(83380400001)(53546011)(26005)(6506007)(6666004)(2616005)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkl1OUdnVi85YVE0RjdEZlVudmNRK2lTU0JxTWs1ZCs0VlFBcTE1RjlWcXpy?=
 =?utf-8?B?NWhjd1NtVjkzaXhpK0svc0ZNenRxR0pFd0ZOZHByWVM3QndJSHJuUlk0SnQ1?=
 =?utf-8?B?VzVqeUtVZGlZNEQ0QitjNU4xaGVUUTJ1czdSdWNKRWxVSlh6cjlDVXFMNmQ2?=
 =?utf-8?B?WWc0OVVnWnViejBEYWtKekRGSjlMdVlCV2hoSXVtWDZ3bERHTTJRZlcrNHNp?=
 =?utf-8?B?blVqSEpmY0s1alM1dWtnQ2I3UUNQTTdlKzFhcHk1bjhOUnBxRmRGakRFTG5I?=
 =?utf-8?B?d3M4c1M0eXlnQWRXUWFNOGpsd3dtYTBESjU3Yk4yUldkTGYyZUhsK1FZYkln?=
 =?utf-8?B?Sm9nUmh4RUpwRW5yaUhMQU1nNlB5QlgvWG5ldmlock85WVBEdWQzZEd0ME5B?=
 =?utf-8?B?NXBZaDhNRWhnYXRNV2ppNWZMZzhPamo0cUQ0NGNiQkFUQXNmcmE0SHdRQVlx?=
 =?utf-8?B?RXVodlpXZEJkV3YxeTNyQnRMWnJqZ29HRDR4ZHlxcWlsRUVPMDhaQ1VYbytG?=
 =?utf-8?B?Zk5UM3J0clRlbVRuNytZN3Y3OUJsb0ZwUXRNQzhZcnpGc1h2TzRsWS81L29I?=
 =?utf-8?B?dnZJVVlCWXkrZkp6WEJpbUc4N3FZOENFOFRZaG1lSENwa1BRUTV2UXBZRTVD?=
 =?utf-8?B?NWRzMDNsdHM4VlhzWFJVZ1hXN1ArRkxneUNoNVB4Z0UxMHBGYmVmQ3IxclhQ?=
 =?utf-8?B?a1pDVWFNK2J4V2RwVWgxb0xuTy96bHV1SWUrbFI0Q1Q3QkxOU3ZKOGp4aDFS?=
 =?utf-8?B?dWczSU1HQmRGWXVTWXNCckVtRlFUb3E1MENHTkt1eVA2SkhwTllYYkViYXE2?=
 =?utf-8?B?aFlFZWF4VitYdHBjZHQwT0NzSjFpRDFGWG5DMGgrWVRCcWlQMUpaRy9iTFND?=
 =?utf-8?B?cm01UzhnbkxaOTdPNjNMRW5DQXhCOGlxSUY4Nk54S09QSlZlTTJKcGVWYnZ4?=
 =?utf-8?B?aytlaXNnZDkrZDB1UllaTzhMWWxFZjF4VWxjZ0c4ajA4aDk0R3ZsblREYWsy?=
 =?utf-8?B?K1BjMkJqOUx2QU0zNHdkYWRFeHBPU0dBVDZSdkZYMTlhei9HNHhnbHZNbUFC?=
 =?utf-8?B?OGcwYmVSVDFweFdKeklWYk1DemVQaVhzRWtTYlR2Vk9aZVFyeTA2N2RlWXFZ?=
 =?utf-8?B?VldLSG12b2orQndzY3BIRnpna2lRMGRGaitadmZockwvUGpVd2RQYUZ6MWht?=
 =?utf-8?B?YnNrZm5Qa3ZubGxJZklQemIvcUtjaC8zbVoyczExNEJKVlg2VTB5WGcyS3hw?=
 =?utf-8?B?U3hYR3QwaHB5UzRSL0NiU09RZnZhVUFhKzNnK05HZkZNT1p4cGQ3UGVYa1g1?=
 =?utf-8?B?QnFDdklMdjgxUXpDd0VvWlY4VTR3aEdkSzNyYzkvMXhZRkU4WmV1VnJZRUVN?=
 =?utf-8?B?Wnh4QURXWXJXZHo2TDRSelpYK0pHdTREOWhhUHk5amVTYnVKR1gzS3NqVzRL?=
 =?utf-8?B?NFpSV0ZteEJUaDJscW4xamNjbEM5ZEZDQUQ4enlOWFM2U04xdURyMjZtbW40?=
 =?utf-8?B?VkVJR2FNTDdhL2ZFaFhNbnN0VnJCMmlDS1E0ZTdnRldEeFFvN3loMXBkRU5r?=
 =?utf-8?B?TFlGVTRwYm5xOG5xa05rSjlQWllEY0FpTjZzL1c2UXdqdEJoQ0s0TUlBbkg4?=
 =?utf-8?B?SlJlbGFkZU1CYXRNdldTZDBNS3VrV0htSXlHMEwvNlg0S0V4UnlnTlRGdGF3?=
 =?utf-8?B?N0hkUFkxbFdWeXVTN0hLQkdxTHh3UUR2K1BjSitBRFE3amRiTm9pTGRpdDAr?=
 =?utf-8?B?c2JkNTJTOGtCQ2V5cjcrMUdjWWEvSEpRSitOVTFKQ1dLVjkranI4MnVXeHc4?=
 =?utf-8?B?ZHdocHBvK0Yxc2VodStFR0dQS1pOMW1nU0oxejNCSU44MTA4Z1JJVGlDNU1F?=
 =?utf-8?B?K0RXRWxGK2ljODBrVVcraERIUmlnendvdnVISHNOc2c5WVZxbzRLZFArVGZq?=
 =?utf-8?B?c1VZc0xtQ2h3ck5iU1FVUkk4T3RUbDhlWlRSSTNtU2NCanozTlVtU3pldTNl?=
 =?utf-8?B?dEZ5ckxCZDBaSFJqcGFqZmRacW5RMjBEb2NySlUreGpjQmRDMzFidDlHQUhJ?=
 =?utf-8?B?S2Q5TVZlRFpUSHdoeGxjV3QzUEowdnZGb3FERGdtM0xvUzNqeGJxYlZ4Mm9y?=
 =?utf-8?B?Z3gvQzlUWnlRZWNHdS8rSTAwZ3RBWHBhYitPaUtVM29GWlkxRWFsTzVEY2Nl?=
 =?utf-8?B?VWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8197f13c-cc73-43cf-8a14-08dc28220151
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 21:16:09.7531 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iqmk1OUM7HSciSnlHz82o/Zx4mpFWKUdHni51nw07GTV0LSjXAWbdNjKQavOJrUb6Nz5NM9TSAxyBUwy8ymNIYpmgVllU/lekobUbcjKKRg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5403
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

On 2/7/2024 12:47, Souza, Jose wrote:
> On Wed, 2024-02-07 at 11:52 -0800, John Harrison wrote:
>> On 2/7/2024 11:43, Souza, Jose wrote:
>>> On Wed, 2024-02-07 at 11:34 -0800, John Harrison wrote:
>>>> On 2/7/2024 10:49, Tvrtko Ursulin wrote:
>>>>> On 07/02/2024 18:12, John Harrison wrote:
>>>>>> On 2/7/2024 03:56, Tvrtko Ursulin wrote:
>>>>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>>>>
>>>>>>> Add a new query to the GuC submission interface version.
>>>>>>>
>>>>>>> Mesa intends to use this information to check for old firmware versions
>>>>>>> with a known bug where using the render and compute command streamers
>>>>>>> simultaneously can cause GPU hangs due issues in firmware scheduling.
>>>>>>>
>>>>>>> Based on patches from Vivaik and Joonas.
>>>>>>>
>>>>>>> There is a little bit of an open around the width required for
>>>>>>> versions.
>>>>>>> While the GuC FW iface tells they are u8, i915 GuC code uses u32:
>>>>>>>
>>>>>>>     #define CSS_SW_VERSION_UC_MAJOR               (0xFF << 16)
>>>>>>>     #define CSS_SW_VERSION_UC_MINOR               (0xFF << 8)
>>>>>>>     #define CSS_SW_VERSION_UC_PATCH               (0xFF << 0)
>>>>>>> ...
>>>>>>>     struct intel_uc_fw_ver {
>>>>>>>             u32 major;
>>>>>>>             u32 minor;
>>>>>>>             u32 patch;
>>>>>>>             u32 build;
>>>>>>>     };
>>>>>> This is copied from generic code which supports firmwares other than
>>>>>> GuC. Only GuC promises to use 8-bit version components. Other
>>>>>> firmwares very definitely do not. There is no open.
>>>>> Ack.
>>>>>
>>>>>>> So we could make the query u8, and refactor the struct intel_uc_fw_ver
>>>>>>> to use u8, or not. To avoid any doubts on why are we assigning u32 to
>>>>>>> u8 I simply opted to use u64. Which avoids the need to add any padding
>>>>>>> too.
>>>>>> I don't follow how potential 8 vs 32 confusion means jump to 64?!
>>>>> Suggestion was to use u8 in the uapi in order to align with GuC FW ABI
>>>>> (or however it's called), in which case there would be:
>>>>>
>>>>>      ver.major = guc->submission_version.major;
>>>>>
>>>>> which would be:
>>>>>
>>>>>      (u8) = (u32)
>>>>>
>>>>> And I was anticipating someone not liking that either. Using too wide
>>>>> u64 simply avoids the need to add a padding element to the uapi struct.
>>>>>
>>>>> If you are positive we need to include a branch number, even though it
>>>>> does not seem to be implemented in the code even(*) then I can make
>>>>> uapi 4x u32 and achieve the same.
>>>> It's not implemented in the code because we've never had to, and it is
>>>> yet another train wreck waiting to happen. There are a bunch of issues
>>>> at different levels that need to be resolved. But that is all in the
>>>> kernel and/or firmware and so can be added by a later kernel update when
>>>> necessary. However, if the UMDs are not already taking it into account
>>>> or its not even in the UAPI, then we can't back fill in the kernel
>>>> later, we are just broken.
>>> This sounds to me like a firmware version for internal testing or for pre-production HW, would any branched firmware be released to customers?
>> See comments below. Branching is about back porting critical fixes to
>> older releases. I.e. supporting LTS releases. There is absolutely
>> nothing internal only or testing related about branching.
>>
>> Just because we haven't had to do so yet doesn't mean we won't need to
>> do so tomorrow.
>>
>> John.
>>
>>>>> (*)
>>>>> static void uc_unpack_css_version(struct intel_uc_fw_ver *ver, u32
>>>>> css_value)
>>>>> {
>>>>>       /* Get version numbers from the CSS header */
>>>>>       ver->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, css_value);
>>>>>       ver->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, css_value);
>>>>>       ver->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css_value);
>>>>> }
>>>>>
>>>>> No branch field in the CSS header?
>>>> I think there is, it's just not officially implemented yet.
>>>>
>>>>> And Why is UMD supposed to reject a non-zero branch? Like how would
>>>>> 1.1.3.0 be fine and 1.1.3.1 be bad? I don't get it. But anyway, I can
>>>>> respin if you definitely confirm.
>>>> Because that is backwards. The branch number goes at the front.
>>>>
>>>> So, for example (using made up numbers, I don't recall offhand what
>>>> versions we have where) say we currently have 0.1.3.0 in tip and 0.1.1.0
>>>> in the last LTS. We then need to ship a critical security fix and back
>>>> port it to the LTS. Tip becomes 0.1.3.1 but the LTS can't become 0.1.1.1
>>>> because that version already exists in the history of tip and does not
>>>> contain the fix. So the LTS gets branched to 1.1.0.0. We then have both
>>>> branches potentially moving forwards with completely independent versioning.
>>>>
>>>> Exactly the same as 5.8.x, 5.9,y, 6.0.z, etc in the Linux kernel
>>>> versioning. You cannot make any assumptions about what might be in
>>>> 1.4.5.6 compared to 0.1.2.3. 1.4.5.6 could actually 0.1.0.3 with a stack
>>>> of security fixes but none of the features, workarounds or bug fixes
>>>> that are in 0.1.2.3.
>>>>
>>>> Hence, if the branch number changes then all bets are off. You have to
>>>> start over and reject anything you do not explicitly know about.
>>>>
>>>> This is why we were saying that exposing version numbers to UMDs breaks
>>>> down horribly as soon as we have to start branching. There is no clean
>>>> or simple way to do this.
> Odd versioning, would expect that fixes on LTS would increase patch version.
You can't. That would create multiple firmware entities with the same 
version number.

E.g. everything is on 0.1.2.3. Tip moves on to 0.1.2.4, 0.1.2.5, 
0.1.3.0, 0.1.4.0 but LTS stays on 0.1.2.3. We then find a critical 
security issue that must be fixed. So tip moves on to 0.1.4.1 but LTS 
cannot move to 0.1.2.4 because that version already exists out in user's 
systems and does not have the fix. But LTS also can't move to 0.1.4.1 
because that includes a whole bunch of new features that we are not 
allowed to push to the LTS branch. So we need to branch and create 
1.1.0.0 which is 0.1.2.3 + security fix. LTS is now on 1.1.0.0 and tip 
is on 0.1.4.1. Both branches can continue incrementing as more patches / 
updates are added to each as appropriate. But the version numbers are 
now totally diverged and have no meaning when compared to each other.

> Anyways so unless UMDs needs to check for a bug fixed in branched release we could just check for major.minor.patch?
As above, you have to check for the branch. Just because m.m.p has a 
higher number than you desire doesn't mean your fix/feature is present 
because that m.m.p might be on a different branch.

>
> Just to make sure I understood it correctly, see my examples below using version format branch.major.minor.patch:
>
> - start
> tip 0.1.4.0
> LTS 0.1.0.0
>
> - secure fix needed in tip and LTS
> tip 0.1.5.0
> LTS 1.1.0.0
>
> - bug fix on tip
> tip 0.1.6.0
> LTS 1.1.0.0
>
> - another secure fix needed in tip and LTS
> tip 0.1.7.0
> LTS 2.1.0.0
>
> Is this how the version is supposed to work?
More or less. Bug fixes are generally only patch level rather than minor 
level bumps but you could potentially have a security fix that requires 
a new interface addition as well.

And simply adding a new bug fix patch to the LTS does not necessarily 
require a branch bump. Assuming that you are talking about the same LTS 
Linux release, the second fix would go in to the same LTS firmware 
branch. I.e., as 1.1.0.1 not 2.1.0.0.

>
> So yeah I think KMD needs to provide branch version in the uAPI even for i915.
And the UMD needs to check it and reject any branch it does not 
explicitly recognise.

John.

>
>>>> John.
>>>>
>>>>
>>>>> Regards,
>>>>>
>>>>> Tvrtko
>>>>>
>>>>>>> Compile tested only.
>>>>>>>
>>>>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>>>> Cc: Kenneth Graunke <kenneth@whitecape.org>
>>>>>>> Cc: Jose Souza <jose.souza@intel.com>
>>>>>>> Cc: Sagar Ghuge <sagar.ghuge@intel.com>
>>>>>>> Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
>>>>>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>>> Cc: Jani Nikula <jani.nikula@intel.com>
>>>>>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>>>> Cc: Vivaik Balasubrawmanian <vivaik.balasubrawmanian@intel.com>
>>>>>>> ---
>>>>>>>     drivers/gpu/drm/i915/i915_query.c | 32
>>>>>>> +++++++++++++++++++++++++++++++
>>>>>>>     include/uapi/drm/i915_drm.h       | 11 +++++++++++
>>>>>>>     2 files changed, 43 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/i915/i915_query.c
>>>>>>> b/drivers/gpu/drm/i915/i915_query.c
>>>>>>> index 00871ef99792..999687f6a3d4 100644
>>>>>>> --- a/drivers/gpu/drm/i915/i915_query.c
>>>>>>> +++ b/drivers/gpu/drm/i915/i915_query.c
>>>>>>> @@ -551,6 +551,37 @@ static int query_hwconfig_blob(struct
>>>>>>> drm_i915_private *i915,
>>>>>>>         return hwconfig->size;
>>>>>>>     }
>>>>>>> +static int
>>>>>>> +query_guc_submission_version(struct drm_i915_private *i915,
>>>>>>> +                 struct drm_i915_query_item *query)
>>>>>>> +{
>>>>>>> +    struct drm_i915_query_guc_submission_version __user *query_ptr =
>>>>>>> +                        u64_to_user_ptr(query->data_ptr);
>>>>>>> +    struct drm_i915_query_guc_submission_version ver;
>>>>>>> +    struct intel_guc *guc = &to_gt(i915)->uc.guc;
>>>>>>> +    const size_t size = sizeof(ver);
>>>>>>> +    int ret;
>>>>>>> +
>>>>>>> +    if (!intel_uc_uses_guc_submission(&to_gt(i915)->uc))
>>>>>>> +        return -ENODEV;
>>>>>>> +
>>>>>>> +    ret = copy_query_item(&ver, size, size, query);
>>>>>>> +    if (ret != 0)
>>>>>>> +        return ret;
>>>>>>> +
>>>>>>> +    if (ver.major || ver.minor || ver.patch)
>>>>>>> +        return -EINVAL;
>>>>>>> +
>>>>>>> +    ver.major = guc->submission_version.major;
>>>>>>> +    ver.minor = guc->submission_version.minor;
>>>>>>> +    ver.patch = guc->submission_version.patch;
>>>>>> This needs to include the branch version (currently set to zero) in
>>>>>> the definition. And the UMD needs to barf if branch comes back as
>>>>>> non-zero. I.e. there is no guarantee that a branched version will
>>>>>> have the w/a + fix that they are wanting.
>>>>>>
>>>>>> John.
>>>>>>
>>>>>>
>>>>>>> +
>>>>>>> +    if (copy_to_user(query_ptr, &ver, size))
>>>>>>> +        return -EFAULT;
>>>>>>> +
>>>>>>> +    return 0;
>>>>>>> +}
>>>>>>> +
>>>>>>>     static int (* const i915_query_funcs[])(struct drm_i915_private
>>>>>>> *dev_priv,
>>>>>>>                         struct drm_i915_query_item *query_item) = {
>>>>>>>         query_topology_info,
>>>>>>> @@ -559,6 +590,7 @@ static int (* const i915_query_funcs[])(struct
>>>>>>> drm_i915_private *dev_priv,
>>>>>>>         query_memregion_info,
>>>>>>>         query_hwconfig_blob,
>>>>>>>         query_geometry_subslices,
>>>>>>> +    query_guc_submission_version,
>>>>>>>     };
>>>>>>>     int i915_query_ioctl(struct drm_device *dev, void *data, struct
>>>>>>> drm_file *file)
>>>>>>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>>>>>>> index 550c496ce76d..d80d9b5e1eda 100644
>>>>>>> --- a/include/uapi/drm/i915_drm.h
>>>>>>> +++ b/include/uapi/drm/i915_drm.h
>>>>>>> @@ -3038,6 +3038,7 @@ struct drm_i915_query_item {
>>>>>>>          *  - %DRM_I915_QUERY_MEMORY_REGIONS (see struct
>>>>>>> drm_i915_query_memory_regions)
>>>>>>>          *  - %DRM_I915_QUERY_HWCONFIG_BLOB (see `GuC HWCONFIG blob
>>>>>>> uAPI`)
>>>>>>>          *  - %DRM_I915_QUERY_GEOMETRY_SUBSLICES (see struct
>>>>>>> drm_i915_query_topology_info)
>>>>>>> +     *  - %DRM_I915_QUERY_GUC_SUBMISSION_VERSION (see struct
>>>>>>> drm_i915_query_guc_submission_version)
>>>>>>>          */
>>>>>>>         __u64 query_id;
>>>>>>>     #define DRM_I915_QUERY_TOPOLOGY_INFO        1
>>>>>>> @@ -3046,6 +3047,7 @@ struct drm_i915_query_item {
>>>>>>>     #define DRM_I915_QUERY_MEMORY_REGIONS        4
>>>>>>>     #define DRM_I915_QUERY_HWCONFIG_BLOB        5
>>>>>>>     #define DRM_I915_QUERY_GEOMETRY_SUBSLICES    6
>>>>>>> +#define DRM_I915_QUERY_GUC_SUBMISSION_VERSION    7
>>>>>>>     /* Must be kept compact -- no holes and well documented */
>>>>>>>         /**
>>>>>>> @@ -3591,6 +3593,15 @@ struct drm_i915_query_memory_regions {
>>>>>>>         struct drm_i915_memory_region_info regions[];
>>>>>>>     };
>>>>>>> +/**
>>>>>>> +* struct drm_i915_query_guc_submission_version - query GuC
>>>>>>> submission interface version
>>>>>>> +*/
>>>>>>> +struct drm_i915_query_guc_submission_version {
>>>>>>> +    __u64 major;
>>>>>>> +    __u64 minor;
>>>>>>> +    __u64 patch;
>>>>>>> +};
>>>>>>> +
>>>>>>>     /**
>>>>>>>      * DOC: GuC HWCONFIG blob uAPI
>>>>>>>      *

