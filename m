Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A57BD83E50A
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 23:17:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8852F10FF33;
	Fri, 26 Jan 2024 22:17:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8274F10FF33;
 Fri, 26 Jan 2024 22:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706307445; x=1737843445;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=AMkdzyXW8h/vMTc+TpCY5sxBTB0mIVAIHsrg3NoddSw=;
 b=WbbPlNa2r0HRZOgaNEQPMuXpYWjqWpU32J7iZsf7oBMR58mDC58jxK/G
 Zh4yyVhmBSMOi2wVyvgJqNrQZ+j0hQF1gfn5DNr2gPELC+bUbxyoSyLhp
 w5h5KbFwo/96Z99DZ6C3bN9nTL7dhOYcZcZ9uedTj1d71h4gKGjtw1+T1
 b+nUmKP4ogUbOUDTn2PJ9chB+JDZIbx4ba3g2N/lceQ92pl2dpAnROxT6
 4hkZ68CCOIDpaCS1AChMWVR5xeC/b7Zh3w+iN5d0zN2AdEGH3AUsUKgz2
 AxzB7fALx6p+joUtXHEVixH41bPYTR1bIVjKT+xWrmwmGvi2QP5cnnWaQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="2463812"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="2463812"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 14:17:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; d="scan'208";a="21504146"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 14:17:06 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 14:17:05 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 14:17:05 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 14:17:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UBi8fVdeJEx6QRJmhELp6y1Pcbmexvky6mAPj9Hs7+tsvUnbYDupvk5W1Hp9yd7qAf4mqtcX3FBG/5AQxut0CFMjr3aZH0FCaR2xmqFSfdB2tc2HLGXQVgOfIChfJJT+PvkLBlcKYtlSrg9fjtv089B8U8t9624PRixTpg4NTYWtu2/Sgk9alvHJmUuwqzr7dlquzj+LlDCHqhivII0PLL9uej9ngKKTrxEY98GflSg0Ip+lL/h0dt2fNOVlZbchIeS0ejralSfMK5tRQIg3yQRhpOt8aHFaqD7jrvujr0iONDfWnSYcCEA6uVlDUs4pmiC2jXjG1KTY2WVUprq42Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQNwirHgS3873S7kLRPW6SCBpS6hHOcLZK38L35JaFQ=;
 b=RxaV8EdJrqpQ81YBpIcGwFidn1kKlfKIuMMXReGgQ5ASp5t1hBMlteiQSoqGtiUxOXwirchYZv9AmCngvMkLnuHU1L5ZONAACUoRha6snk2j0ZMjpgsXwlp0FswxC5SrLSkDZ9i8aqbBBZy2FTl+h1HA9d9EenfRvMJgF3SeEehw8oIBE1Cxh7T+p44NS3duIbOLDdoxFteluqR8i1kWp0FQAKTxt9m8Pg4lKO/8A0TGYzbvbwrR3+5044sLY3oF5dHy4pYEeX2pl0+nJJFbY75Yi1Yq2GzKz6pwy0oJu8SvmFxfKx0EipSW1XP1vX91SrsHzzU9ge5WNuU33o6lSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BN9PR11MB5369.namprd11.prod.outlook.com (2603:10b6:408:11a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.27; Fri, 26 Jan
 2024 22:17:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 22:17:02 +0000
Date: Fri, 26 Jan 2024 16:16:58 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: Re: [PATCH 3/5] drm/ttm: replace busy placement with flags v6
Message-ID: <4a2hta7mv3mu4eoobtqtv4kmmdbrlowzbbrwjht73bzb2aoziw@awfcv5vhhnly>
References: <20240112125158.2748-1-christian.koenig@amd.com>
 <20240112125158.2748-4-christian.koenig@amd.com>
 <0049f12e-ce96-4320-8158-c5a23164261f@linux.intel.com>
 <fe9875a1-1cd5-4b2d-bfbc-9d779e79823a@linux.intel.com>
 <835b15e7-a2c8-4c03-9789-13f78078a024@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <835b15e7-a2c8-4c03-9789-13f78078a024@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0167.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BN9PR11MB5369:EE_
X-MS-Office365-Filtering-Correlation-Id: 49993b33-02bb-4e62-6095-08dc1ebc8564
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XJDmQhw4U07/T5/MBgkTSIRbP2WQ4LyNc/G9X/Qf+dW2qSBtoJEwzJQXdKwLEPl8AA3n77JgHvcM9HjNPZlyr0odAKaxEFEe7V4puYAIR3vba47UJk9FbWMNVbzUy2zRqhapRGq+5+6IeouI3ZjuVQeqnZKFRkGw46W/o4ynxNAm+KB8OGzcxUpKGx9l+4a5jLZfyj6pTbLLXxouzr4E8UG9AqFAzfuQhgZjW4mlLcqcCSS7SgYEK3wd/44ZDQiV8qVrSzGdpqQWYbAohtYsFB1ZtbxnC/DNURu9jxeRCDFMr7w8/znhj4gE7IWJG4meF6a03+x4E2cl4XPAlIOmeEOFnjH7fdkpX2aIyM1uN9VEwGtIdGNpJcwr6g2RlQ22vOOvaXX3BX8lsJvYBKWzAdygcIgsiAp0bbDzVpz8ECAhFxHHpJfy56ZGhM9nNPj3J+QiWU/MAwL7IqVO6HqFbp71tmxd2d1jH1XsY0NrFtns02CU38pbSscsILnoYbjt0ijWiFQzu9DzCr+GrLAc6RNoM6noT82pPBtYUMdvk6Z99AZoKWVhfB0kpXKxRZJG4+jsyUwIaTtiJB/hvyuUZ3lMCN8mds0OGfVEKIAZ8dE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(366004)(136003)(39860400002)(376002)(346002)(230173577357003)(230922051799003)(230273577357003)(64100799003)(451199024)(186009)(1800799012)(83380400001)(33716001)(6486002)(6512007)(9686003)(26005)(38100700002)(66574015)(8676002)(4326008)(8936002)(7416002)(2906002)(478600001)(5660300002)(6916009)(41300700001)(6506007)(66556008)(30864003)(6666004)(66476007)(316002)(66946007)(82960400001)(86362001)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0VYeVQ1a2M2RllhYkJ4UmtNY2JGaVRsQnZ5R1Z1SXBhR25CL3hwRitwS3B1?=
 =?utf-8?B?UE9SSzFHMWVveEJBUkk3M2JwZDJ1c0poYmQ0eklCNU9nbVU1aWZNSlY5MEwz?=
 =?utf-8?B?RmV2SERhdjJGVGJuMndDS3l0czdqdXhyZU50RDJTUzM0REF2MGVwd0pUUk52?=
 =?utf-8?B?eC9CK3YxNlNEMEpsQStQWWUwQTkxcERIc2YvTkJLeWt2MTk5elRBNzlIWHhM?=
 =?utf-8?B?VUdsZHNmWVd6cEZrR2JkRHBtdTBwMzlYOXNtQWtuU0tjQ2hCc0dpcndRcitr?=
 =?utf-8?B?UDB1UnNLdExlTHdpRDJrU0NKMVlhMzlxbEY0RFRGa0lGSklRYUpCT0k3YlVo?=
 =?utf-8?B?b0l0aXQ3UUlhMFJqbWhQcThuWnVoMllRTVNUOElWdks0T2xydXdiVTBDR2VT?=
 =?utf-8?B?T0xFMURMSURLMkp6VCtpaHhrT2s1M05kUm1iMXZsSlFMSFdsZG9aMTVvS0pr?=
 =?utf-8?B?djcxUWZIR3FhRTZwZWNaZURiMStBN0ZxN3RxV0wyNWhqNGVZZ04zUmk5cmg5?=
 =?utf-8?B?eEZhRkd3MEROMTI3TkYvS1UxZkt2S3VpQ0RjWGxCQTZqUTJqOGZoSm5xdUdv?=
 =?utf-8?B?UDZIUUZrY2NGaFRvV0FTQnF6TWpCcCtMQURHK0VNRU9PNWNoSmFFaGU3em9O?=
 =?utf-8?B?RlFpR2w5emlBZWVRdjByVjBZZGNNNjFKTHJ3a0tEbWRaSy9mRGRDVTBqck9M?=
 =?utf-8?B?aDJvUmNlU09sRm9PaFE5ZDlNeVhNSE1UdFFJQkZkVElob2gzclhZT0pOWWda?=
 =?utf-8?B?cmhHdjBOTHhwZDE2RTcvSGVIOTlKSEVIaGxCZVNSWXF2WXljdEFoNWM4b3ND?=
 =?utf-8?B?RmlqZktwRXZKLy9lOEJ2WWhXS1RmUERQZjNQY0czSlRMTTJ5SXRUMElmVWpz?=
 =?utf-8?B?dHRpZjNMRU9ycTRuVnZGMWtuZmNJcGpJTmpjcGlYZmd6b2NCOUN4MWUra2Ra?=
 =?utf-8?B?aVRRaUhWcDFvL2R4SXorM1pGRjByOE80TzJaa3VmMjFYTkdoTTErU1EyR2lB?=
 =?utf-8?B?QlZ6ZW5hSldMa2t0MW9rcEI1dDBRZkZhM1dzQWNDK1RZV0ZvQlU4V1hSUGF6?=
 =?utf-8?B?R0dkTXdTeGI4ZDI3dmVrREpWcE9XSjk1QjZCVzZ5bUxVcnpiUnZhY3ZVNVNR?=
 =?utf-8?B?Vnd3cjQyODBka1VCbXFBVzdZNWNGNWVyTk1IRW1yNXVnTDZ1Z1B6a0phU3Bs?=
 =?utf-8?B?Q0JIbFZMaFJNM3FRZ29md1QrTkYzYVZxUUQ4WmNVNDNveGJFeGxsQXRvNGQ2?=
 =?utf-8?B?NzdFcHZPNnZXcVhYcGRNdlpKRW1pNUZjWEtsenNYRnYxK0R2cDdjTGpxUHpD?=
 =?utf-8?B?bXpjR3VZTU5ESW1PUUwzNmw4dzNXQXhoTmlteGpuTU4xRW5VMngyTldwVERL?=
 =?utf-8?B?cWRQbUFYanNVb092TzF2bzFkTjluSlI4QUNLNlEyR0VDbkJQNkFET3d1QUJu?=
 =?utf-8?B?TG9uMnZTcEt6a0RNRXZ4UkNod3NEcnBkdHFoMVp5OWxJdFhLSU9BK2RVNGxp?=
 =?utf-8?B?TXFnaVZZMXYzS0dMaVE2MFhrZUQ3THZpSXVDOVFYcUZSbkh2Uis1NW1TeTFE?=
 =?utf-8?B?QnJuWVdjUjhFM1VhT0tYU2IyU3pkbDlNY2NSazUxeUZzVGprTEp6MDgrb3A4?=
 =?utf-8?B?Mis4OVNxWDk0Z2g1VW8wWjhjTi9ua3Z1MHRsSnltZWQrUGhCcWE0RkYyQXJx?=
 =?utf-8?B?dGx3ejJDWkdIWHhyamVHOElzWWlRVXF2cEJZNzFPRWJSMXdjdmdsZUtWZ3F6?=
 =?utf-8?B?UXJrcmNOTmdqdEZ2Y1YwS1FWN2xGYjc0QzVBVGl0anlyMTVKZ1NzYkhtME00?=
 =?utf-8?B?U2NsajZaVlllMnVkeThGUE4wNTErYTdwSHdYUU1iSGh3dmtXVzIreUZiZXNK?=
 =?utf-8?B?cUp5YWFaLzJzOHNkNTJXcEZISk9OK2VDcEtvMnB5SWJuYkltSTJ2RFJwUGlv?=
 =?utf-8?B?V1NKcitoR04wL2d2djBTTlR0RU5qZE5uQTEyeWZ4V2NjVjBYSVFUT2JFMUVh?=
 =?utf-8?B?bUhOV25TbncyVElWUXU2Z0lkbHBjWXBkcCtHY3N4VDdQUDNVREJURzIreTl6?=
 =?utf-8?B?YzJCTkZiSDRzR0lFb2Y3VUg4a3BXUTNTUHdTSmk2emxSdjYvd09vWFhnVVhK?=
 =?utf-8?B?TWdFa0ExajVwZDlRVkRQVE11eHMzWXpLckxEaTlodmtmUGxsVFNlc3p4MXNU?=
 =?utf-8?B?aHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49993b33-02bb-4e62-6095-08dc1ebc8564
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 22:17:02.4131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YkY23Tk8WjDY5IX4JI3OgS2aInCD3ROCavd+M9kbdv8WwRuVjOZZDo6PsUqWFZi1/braPQPHr0f4Kg4zhVTpEMVx06cUBzxwmXj/ozAgRBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5369
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
Cc: kherbst@redhat.com, michel.daenzer@mailbox.org,
 Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, zackr@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 18, 2024 at 05:38:16PM +0100, Thomas Hellström wrote:
>
>On 1/17/24 13:27, Thomas Hellström wrote:
>>
>>On 1/17/24 11:47, Thomas Hellström wrote:
>>>Hi, Christian
>>>
>>>Xe changes look good. Will send the series to xe ci to check for 
>>>regressions.
>>
>>Hmm, there are some checkpatch warnings about author / SOB email 
>>mismatch,
>
>With those fixed, this patch is
>
>Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


it actually broke drm-tip now that this is merged:

../drivers/gpu/drm/xe/xe_bo.c:41:10: error: ‘struct ttm_placement’ has no member named ‘num_busy_placement’; did you mean ‘num_placement’
    41 |         .num_busy_placement = 1,
       |          ^~~~~~~~~~~~~~~~~~
       |          num_placement
../drivers/gpu/drm/xe/xe_bo.c:41:31: error: excess elements in struct initializer [-Werror]
    41 |         .num_busy_placement = 1,
       |                               ^


Apparently a conflict with another patch that got applied a few days
ago: a201c6ee37d6 ("drm/xe/bo: Evict VRAM to TT rather than to system")

Lucas De Marchi

>
>
>>
>>But worserthere are some regressions in the dma-buf ktest (it tests 
>>evicting of a dynamic dma-buf),
>>
>>https://patchwork.freedesktop.org/series/128873/
>>
>>I'll take a look later today or tomorrow.
>
>These are from the next patch. Will continue the discussion there.
>
>/Thomas
>
>
>>
>>/Thomas
>>
>>
>>
>>>
>>>/Thomas
>>>
>>>
>>>On 1/12/24 13:51, Christian König wrote:
>>>>From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
>>>>
>>>>Instead of a list of separate busy placement add flags which indicate
>>>>that a placement should only be used when there is room or if we 
>>>>need to
>>>>evict.
>>>>
>>>>v2: add missing TTM_PL_FLAG_IDLE for i915
>>>>v3: fix auto build test ERROR on drm-tip/drm-tip
>>>>v4: fix some typos pointed out by checkpatch
>>>>v5: cleanup some rebase problems with VMWGFX
>>>>v6: implement some missing VMWGFX functionality pointed out by Zack,
>>>>     rename the flags as suggested by Michel, rebase on drm-tip and
>>>>     adjust XE as well
>>>>
>>>>Signed-off-by: Christian König <christian.koenig@amd.com>
>>>>Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
>>>>---
>>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  6 +-
>>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 11 +---
>>>>  drivers/gpu/drm/drm_gem_vram_helper.c      |  2 -
>>>>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c    | 37 +++++------
>>>>  drivers/gpu/drm/loongson/lsdc_ttm.c        |  2 -
>>>>  drivers/gpu/drm/nouveau/nouveau_bo.c       | 59 +++++++----------
>>>>  drivers/gpu/drm/nouveau/nouveau_bo.h       |  1 -
>>>>  drivers/gpu/drm/qxl/qxl_object.c           |  2 -
>>>>  drivers/gpu/drm/qxl/qxl_ttm.c              |  2 -
>>>>  drivers/gpu/drm/radeon/radeon_object.c     |  2 -
>>>>  drivers/gpu/drm/radeon/radeon_ttm.c        |  8 +--
>>>>  drivers/gpu/drm/radeon/radeon_uvd.c        |  1 -
>>>>  drivers/gpu/drm/ttm/ttm_bo.c               | 21 ++++---
>>>>  drivers/gpu/drm/ttm/ttm_resource.c         | 73 
>>>>+++++-----------------
>>>>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c         | 33 +++++++---
>>>>  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |  4 --
>>>>  drivers/gpu/drm/xe/xe_bo.c                 | 33 +++++-----
>>>>  include/drm/ttm/ttm_placement.h            | 10 +--
>>>>  include/drm/ttm/ttm_resource.h             |  8 +--
>>>>  19 files changed, 118 insertions(+), 197 deletions(-)
>>>>
>>>>diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c 
>>>>b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>>>index 425cebcc5cbf..b671b0665492 100644
>>>>--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>>>+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>>>@@ -220,9 +220,6 @@ void amdgpu_bo_placement_from_domain(struct 
>>>>amdgpu_bo *abo, u32 domain)
>>>>        placement->num_placement = c;
>>>>      placement->placement = places;
>>>>-
>>>>-    placement->num_busy_placement = c;
>>>>-    placement->busy_placement = places;
>>>>  }
>>>>    /**
>>>>@@ -1397,8 +1394,7 @@ vm_fault_t 
>>>>amdgpu_bo_fault_reserve_notify(struct ttm_buffer_object *bo)
>>>>                      AMDGPU_GEM_DOMAIN_GTT);
>>>>        /* Avoid costly evictions; only set GTT as a busy placement */
>>>>-    abo->placement.num_busy_placement = 1;
>>>>-    abo->placement.busy_placement = &abo->placements[1];
>>>>+    abo->placements[0].flags |= TTM_PL_FLAG_DESIRED;
>>>>        r = ttm_bo_validate(bo, &abo->placement, &ctx);
>>>>      if (unlikely(r == -EBUSY || r == -ERESTARTSYS))
>>>>diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c 
>>>>b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>>index 75c9fd2c6c2a..8722beba494e 100644
>>>>--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>>+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>>@@ -102,23 +102,19 @@ static void amdgpu_evict_flags(struct 
>>>>ttm_buffer_object *bo,
>>>>      /* Don't handle scatter gather BOs */
>>>>      if (bo->type == ttm_bo_type_sg) {
>>>>          placement->num_placement = 0;
>>>>-        placement->num_busy_placement = 0;
>>>>          return;
>>>>      }
>>>>        /* Object isn't an AMDGPU object so ignore */
>>>>      if (!amdgpu_bo_is_amdgpu_bo(bo)) {
>>>>          placement->placement = &placements;
>>>>-        placement->busy_placement = &placements;
>>>>          placement->num_placement = 1;
>>>>-        placement->num_busy_placement = 1;
>>>>          return;
>>>>      }
>>>>        abo = ttm_to_amdgpu_bo(bo);
>>>>      if (abo->flags & AMDGPU_GEM_CREATE_DISCARDABLE) {
>>>>          placement->num_placement = 0;
>>>>-        placement->num_busy_placement = 0;
>>>>          return;
>>>>      }
>>>>  @@ -128,13 +124,13 @@ static void amdgpu_evict_flags(struct 
>>>>ttm_buffer_object *bo,
>>>>      case AMDGPU_PL_OA:
>>>>      case AMDGPU_PL_DOORBELL:
>>>>          placement->num_placement = 0;
>>>>-        placement->num_busy_placement = 0;
>>>>          return;
>>>>        case TTM_PL_VRAM:
>>>>          if (!adev->mman.buffer_funcs_enabled) {
>>>>              /* Move to system memory */
>>>>              amdgpu_bo_placement_from_domain(abo, 
>>>>AMDGPU_GEM_DOMAIN_CPU);
>>>>+
>>>>          } else if (!amdgpu_gmc_vram_full_visible(&adev->gmc) &&
>>>>                 !(abo->flags & 
>>>>AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED) &&
>>>>                 amdgpu_bo_in_cpu_visible_vram(abo)) {
>>>>@@ -149,8 +145,7 @@ static void amdgpu_evict_flags(struct 
>>>>ttm_buffer_object *bo,
>>>>                              AMDGPU_GEM_DOMAIN_CPU);
>>>>              abo->placements[0].fpfn = 
>>>>adev->gmc.visible_vram_size >> PAGE_SHIFT;
>>>>              abo->placements[0].lpfn = 0;
>>>>-            abo->placement.busy_placement = &abo->placements[1];
>>>>-            abo->placement.num_busy_placement = 1;
>>>>+            abo->placements[0].flags |= TTM_PL_FLAG_DESIRED;
>>>>          } else {
>>>>              /* Move to GTT memory */
>>>>              amdgpu_bo_placement_from_domain(abo, 
>>>>AMDGPU_GEM_DOMAIN_GTT |
>>>>@@ -966,8 +961,6 @@ int amdgpu_ttm_alloc_gart(struct 
>>>>ttm_buffer_object *bo)
>>>>      /* allocate GART space */
>>>>      placement.num_placement = 1;
>>>>      placement.placement = &placements;
>>>>-    placement.num_busy_placement = 1;
>>>>-    placement.busy_placement = &placements;
>>>>      placements.fpfn = 0;
>>>>      placements.lpfn = adev->gmc.gart_size >> PAGE_SHIFT;
>>>>      placements.mem_type = TTM_PL_TT;
>>>>diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c 
>>>>b/drivers/gpu/drm/drm_gem_vram_helper.c
>>>>index b67eafa55715..75f2eaf0d5b6 100644
>>>>--- a/drivers/gpu/drm/drm_gem_vram_helper.c
>>>>+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
>>>>@@ -147,7 +147,6 @@ static void drm_gem_vram_placement(struct 
>>>>drm_gem_vram_object *gbo,
>>>>          invariant_flags = TTM_PL_FLAG_TOPDOWN;
>>>>        gbo->placement.placement = gbo->placements;
>>>>-    gbo->placement.busy_placement = gbo->placements;
>>>>        if (pl_flag & DRM_GEM_VRAM_PL_FLAG_VRAM) {
>>>>          gbo->placements[c].mem_type = TTM_PL_VRAM;
>>>>@@ -160,7 +159,6 @@ static void drm_gem_vram_placement(struct 
>>>>drm_gem_vram_object *gbo,
>>>>      }
>>>>        gbo->placement.num_placement = c;
>>>>-    gbo->placement.num_busy_placement = c;
>>>>        for (i = 0; i < c; ++i) {
>>>>          gbo->placements[i].fpfn = 0;
>>>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c 
>>>>b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>>index 6b69ef0cdbb4..80c6cafc8887 100644
>>>>--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>>@@ -65,8 +65,6 @@ static const struct ttm_place sys_placement_flags = {
>>>>  static struct ttm_placement i915_sys_placement = {
>>>>      .num_placement = 1,
>>>>      .placement = &sys_placement_flags,
>>>>-    .num_busy_placement = 1,
>>>>-    .busy_placement = &sys_placement_flags,
>>>>  };
>>>>    /**
>>>>@@ -157,32 +155,28 @@ i915_ttm_place_from_region(const struct 
>>>>intel_memory_region *mr,
>>>>    static void
>>>>  i915_ttm_placement_from_obj(const struct drm_i915_gem_object *obj,
>>>>-                struct ttm_place *requested,
>>>>-                struct ttm_place *busy,
>>>>+                struct ttm_place *places,
>>>>                  struct ttm_placement *placement)
>>>>  {
>>>>      unsigned int num_allowed = obj->mm.n_placements;
>>>>      unsigned int flags = obj->flags;
>>>>      unsigned int i;
>>>>  -    placement->num_placement = 1;
>>>>+    places[0].flags |= TTM_PL_FLAG_DESIRED;
>>>>      i915_ttm_place_from_region(num_allowed ? obj->mm.placements[0] :
>>>>-                   obj->mm.region, requested, obj->bo_offset,
>>>>+                   obj->mm.region, &places[0], obj->bo_offset,
>>>>                     obj->base.size, flags);
>>>>        /* Cache this on object? */
>>>>-    placement->num_busy_placement = num_allowed;
>>>>-    for (i = 0; i < placement->num_busy_placement; ++i)
>>>>-        i915_ttm_place_from_region(obj->mm.placements[i], busy + i,
>>>>-                       obj->bo_offset, obj->base.size, flags);
>>>>-
>>>>-    if (num_allowed == 0) {
>>>>-        *busy = *requested;
>>>>-        placement->num_busy_placement = 1;
>>>>+    for (i = 0; i < num_allowed; ++i) {
>>>>+        i915_ttm_place_from_region(obj->mm.placements[i],
>>>>+                       &places[i + 1], obj->bo_offset,
>>>>+                       obj->base.size, flags);
>>>>+        places[i + 1].flags |= TTM_PL_FLAG_FALLBACK;
>>>>      }
>>>>  -    placement->placement = requested;
>>>>-    placement->busy_placement = busy;
>>>>+    placement->num_placement = num_allowed + 1;
>>>>+    placement->placement = places;
>>>>  }
>>>>    static int i915_ttm_tt_shmem_populate(struct ttm_device *bdev,
>>>>@@ -789,7 +783,8 @@ static int __i915_ttm_get_pages(struct 
>>>>drm_i915_gem_object *obj,
>>>>      int ret;
>>>>        /* First try only the requested placement. No eviction. */
>>>>-    real_num_busy = fetch_and_zero(&placement->num_busy_placement);
>>>>+    real_num_busy = placement->num_placement;
>>>>+    placement->num_placement = 1;
>>>>      ret = ttm_bo_validate(bo, placement, &ctx);
>>>>      if (ret) {
>>>>          ret = i915_ttm_err_to_gem(ret);
>>>>@@ -805,7 +800,7 @@ static int __i915_ttm_get_pages(struct 
>>>>drm_i915_gem_object *obj,
>>>>           * If the initial attempt fails, allow all accepted 
>>>>placements,
>>>>           * evicting if necessary.
>>>>           */
>>>>-        placement->num_busy_placement = real_num_busy;
>>>>+        placement->num_placement = real_num_busy;
>>>>          ret = ttm_bo_validate(bo, placement, &ctx);
>>>>          if (ret)
>>>>              return i915_ttm_err_to_gem(ret);
>>>>@@ -839,7 +834,7 @@ static int __i915_ttm_get_pages(struct 
>>>>drm_i915_gem_object *obj,
>>>>    static int i915_ttm_get_pages(struct drm_i915_gem_object *obj)
>>>>  {
>>>>-    struct ttm_place requested, busy[I915_TTM_MAX_PLACEMENTS];
>>>>+    struct ttm_place places[I915_TTM_MAX_PLACEMENTS + 1];
>>>>      struct ttm_placement placement;
>>>>        /* restricted by sg_alloc_table */
>>>>@@ -849,7 +844,7 @@ static int i915_ttm_get_pages(struct 
>>>>drm_i915_gem_object *obj)
>>>>      GEM_BUG_ON(obj->mm.n_placements > I915_TTM_MAX_PLACEMENTS);
>>>>        /* Move to the requested placement. */
>>>>-    i915_ttm_placement_from_obj(obj, &requested, busy, &placement);
>>>>+    i915_ttm_placement_from_obj(obj, places, &placement);
>>>>        return __i915_ttm_get_pages(obj, &placement);
>>>>  }
>>>>@@ -879,9 +874,7 @@ static int __i915_ttm_migrate(struct 
>>>>drm_i915_gem_object *obj,
>>>>      i915_ttm_place_from_region(mr, &requested, obj->bo_offset,
>>>>                     obj->base.size, flags);
>>>>      placement.num_placement = 1;
>>>>-    placement.num_busy_placement = 1;
>>>>      placement.placement = &requested;
>>>>-    placement.busy_placement = &requested;
>>>>        ret = __i915_ttm_get_pages(obj, &placement);
>>>>      if (ret)
>>>>diff --git a/drivers/gpu/drm/loongson/lsdc_ttm.c 
>>>>b/drivers/gpu/drm/loongson/lsdc_ttm.c
>>>>index bf79dc55afa4..465f622ac05d 100644
>>>>--- a/drivers/gpu/drm/loongson/lsdc_ttm.c
>>>>+++ b/drivers/gpu/drm/loongson/lsdc_ttm.c
>>>>@@ -54,7 +54,6 @@ static void lsdc_bo_set_placement(struct 
>>>>lsdc_bo *lbo, u32 domain)
>>>>          pflags |= TTM_PL_FLAG_TOPDOWN;
>>>>        lbo->placement.placement = lbo->placements;
>>>>-    lbo->placement.busy_placement = lbo->placements;
>>>>        if (domain & LSDC_GEM_DOMAIN_VRAM) {
>>>>          lbo->placements[c].mem_type = TTM_PL_VRAM;
>>>>@@ -77,7 +76,6 @@ static void lsdc_bo_set_placement(struct 
>>>>lsdc_bo *lbo, u32 domain)
>>>>      }
>>>>        lbo->placement.num_placement = c;
>>>>-    lbo->placement.num_busy_placement = c;
>>>>        for (i = 0; i < c; ++i) {
>>>>          lbo->placements[i].fpfn = 0;
>>>>diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c 
>>>>b/drivers/gpu/drm/nouveau/nouveau_bo.c
>>>>index 00cc7d1abaa3..56dcd25db1ce 100644
>>>>--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
>>>>+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
>>>>@@ -404,27 +404,6 @@ nouveau_bo_new(struct nouveau_cli *cli, u64 
>>>>size, int align,
>>>>      return 0;
>>>>  }
>>>>  -static void
>>>>-set_placement_list(struct ttm_place *pl, unsigned *n, uint32_t domain)
>>>>-{
>>>>-    *n = 0;
>>>>-
>>>>-    if (domain & NOUVEAU_GEM_DOMAIN_VRAM) {
>>>>-        pl[*n].mem_type = TTM_PL_VRAM;
>>>>-        pl[*n].flags = 0;
>>>>-        (*n)++;
>>>>-    }
>>>>-    if (domain & NOUVEAU_GEM_DOMAIN_GART) {
>>>>-        pl[*n].mem_type = TTM_PL_TT;
>>>>-        pl[*n].flags = 0;
>>>>-        (*n)++;
>>>>-    }
>>>>-    if (domain & NOUVEAU_GEM_DOMAIN_CPU) {
>>>>-        pl[*n].mem_type = TTM_PL_SYSTEM;
>>>>-        pl[(*n)++].flags = 0;
>>>>-    }
>>>>-}
>>>>-
>>>>  static void
>>>>  set_placement_range(struct nouveau_bo *nvbo, uint32_t domain)
>>>>  {
>>>>@@ -452,10 +431,6 @@ set_placement_range(struct nouveau_bo 
>>>>*nvbo, uint32_t domain)
>>>>              nvbo->placements[i].fpfn = fpfn;
>>>>              nvbo->placements[i].lpfn = lpfn;
>>>>          }
>>>>-        for (i = 0; i < nvbo->placement.num_busy_placement; ++i) {
>>>>-            nvbo->busy_placements[i].fpfn = fpfn;
>>>>-            nvbo->busy_placements[i].lpfn = lpfn;
>>>>-        }
>>>>      }
>>>>  }
>>>>  @@ -463,15 +438,32 @@ void
>>>>  nouveau_bo_placement_set(struct nouveau_bo *nvbo, uint32_t domain,
>>>>               uint32_t busy)
>>>>  {
>>>>-    struct ttm_placement *pl = &nvbo->placement;
>>>>+    unsigned int *n = &nvbo->placement.num_placement;
>>>>+    struct ttm_place *pl = nvbo->placements;
>>>>  -    pl->placement = nvbo->placements;
>>>>-    set_placement_list(nvbo->placements, &pl->num_placement, domain);
>>>>+    domain |= busy;
>>>>  -    pl->busy_placement = nvbo->busy_placements;
>>>>-    set_placement_list(nvbo->busy_placements, &pl->num_busy_placement,
>>>>-               domain | busy);
>>>>+    *n = 0;
>>>>+    if (domain & NOUVEAU_GEM_DOMAIN_VRAM) {
>>>>+        pl[*n].mem_type = TTM_PL_VRAM;
>>>>+        pl[*n].flags = busy & NOUVEAU_GEM_DOMAIN_VRAM ?
>>>>+            TTM_PL_FLAG_FALLBACK : 0;
>>>>+        (*n)++;
>>>>+    }
>>>>+    if (domain & NOUVEAU_GEM_DOMAIN_GART) {
>>>>+        pl[*n].mem_type = TTM_PL_TT;
>>>>+        pl[*n].flags = busy & NOUVEAU_GEM_DOMAIN_GART ?
>>>>+            TTM_PL_FLAG_FALLBACK : 0;
>>>>+        (*n)++;
>>>>+    }
>>>>+    if (domain & NOUVEAU_GEM_DOMAIN_CPU) {
>>>>+        pl[*n].mem_type = TTM_PL_SYSTEM;
>>>>+        pl[*n].flags = busy & NOUVEAU_GEM_DOMAIN_CPU ?
>>>>+            TTM_PL_FLAG_FALLBACK : 0;
>>>>+        (*n)++;
>>>>+    }
>>>>  +    nvbo->placement.placement = nvbo->placements;
>>>>      set_placement_range(nvbo, domain);
>>>>  }
>>>>  @@ -1314,11 +1306,6 @@ vm_fault_t 
>>>>nouveau_ttm_fault_reserve_notify(struct ttm_buffer_object *bo)
>>>>              nvbo->placements[i].lpfn = mappable;
>>>>          }
>>>>  -        for (i = 0; i < nvbo->placement.num_busy_placement; ++i) {
>>>>-            nvbo->busy_placements[i].fpfn = 0;
>>>>-            nvbo->busy_placements[i].lpfn = mappable;
>>>>-        }
>>>>-
>>>>          nouveau_bo_placement_set(nvbo, NOUVEAU_GEM_DOMAIN_VRAM, 0);
>>>>      }
>>>>  diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.h 
>>>>b/drivers/gpu/drm/nouveau/nouveau_bo.h
>>>>index 70c551921a9e..e9dfab6a8156 100644
>>>>--- a/drivers/gpu/drm/nouveau/nouveau_bo.h
>>>>+++ b/drivers/gpu/drm/nouveau/nouveau_bo.h
>>>>@@ -15,7 +15,6 @@ struct nouveau_bo {
>>>>      struct ttm_placement placement;
>>>>      u32 valid_domains;
>>>>      struct ttm_place placements[3];
>>>>-    struct ttm_place busy_placements[3];
>>>>      bool force_coherent;
>>>>      struct ttm_bo_kmap_obj kmap;
>>>>      struct list_head head;
>>>>diff --git a/drivers/gpu/drm/qxl/qxl_object.c 
>>>>b/drivers/gpu/drm/qxl/qxl_object.c
>>>>index 06a58dad5f5c..1e46b0a6e478 100644
>>>>--- a/drivers/gpu/drm/qxl/qxl_object.c
>>>>+++ b/drivers/gpu/drm/qxl/qxl_object.c
>>>>@@ -66,7 +66,6 @@ void qxl_ttm_placement_from_domain(struct 
>>>>qxl_bo *qbo, u32 domain)
>>>>          pflag |= TTM_PL_FLAG_TOPDOWN;
>>>>        qbo->placement.placement = qbo->placements;
>>>>-    qbo->placement.busy_placement = qbo->placements;
>>>>      if (domain == QXL_GEM_DOMAIN_VRAM) {
>>>>          qbo->placements[c].mem_type = TTM_PL_VRAM;
>>>>          qbo->placements[c++].flags = pflag;
>>>>@@ -86,7 +85,6 @@ void qxl_ttm_placement_from_domain(struct 
>>>>qxl_bo *qbo, u32 domain)
>>>>          qbo->placements[c++].flags = 0;
>>>>      }
>>>>      qbo->placement.num_placement = c;
>>>>-    qbo->placement.num_busy_placement = c;
>>>>      for (i = 0; i < c; ++i) {
>>>>          qbo->placements[i].fpfn = 0;
>>>>          qbo->placements[i].lpfn = 0;
>>>>diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c 
>>>>b/drivers/gpu/drm/qxl/qxl_ttm.c
>>>>index 1a82629bce3f..765a144cea14 100644
>>>>--- a/drivers/gpu/drm/qxl/qxl_ttm.c
>>>>+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
>>>>@@ -60,9 +60,7 @@ static void qxl_evict_flags(struct 
>>>>ttm_buffer_object *bo,
>>>>        if (!qxl_ttm_bo_is_qxl_bo(bo)) {
>>>>          placement->placement = &placements;
>>>>-        placement->busy_placement = &placements;
>>>>          placement->num_placement = 1;
>>>>-        placement->num_busy_placement = 1;
>>>>          return;
>>>>      }
>>>>      qbo = to_qxl_bo(bo);
>>>>diff --git a/drivers/gpu/drm/radeon/radeon_object.c 
>>>>b/drivers/gpu/drm/radeon/radeon_object.c
>>>>index 10c0fbd9d2b4..a955f8a2f7fe 100644
>>>>--- a/drivers/gpu/drm/radeon/radeon_object.c
>>>>+++ b/drivers/gpu/drm/radeon/radeon_object.c
>>>>@@ -78,7 +78,6 @@ void radeon_ttm_placement_from_domain(struct 
>>>>radeon_bo *rbo, u32 domain)
>>>>      u32 c = 0, i;
>>>>        rbo->placement.placement = rbo->placements;
>>>>-    rbo->placement.busy_placement = rbo->placements;
>>>>      if (domain & RADEON_GEM_DOMAIN_VRAM) {
>>>>          /* Try placing BOs which don't need CPU access outside of the
>>>>           * CPU accessible part of VRAM
>>>>@@ -114,7 +113,6 @@ void radeon_ttm_placement_from_domain(struct 
>>>>radeon_bo *rbo, u32 domain)
>>>>      }
>>>>        rbo->placement.num_placement = c;
>>>>-    rbo->placement.num_busy_placement = c;
>>>>        for (i = 0; i < c; ++i) {
>>>>          if ((rbo->flags & RADEON_GEM_CPU_ACCESS) &&
>>>>diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c 
>>>>b/drivers/gpu/drm/radeon/radeon_ttm.c
>>>>index de4e6d78f1e1..2078b0000e22 100644
>>>>--- a/drivers/gpu/drm/radeon/radeon_ttm.c
>>>>+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
>>>>@@ -92,9 +92,7 @@ static void radeon_evict_flags(struct 
>>>>ttm_buffer_object *bo,
>>>>        if (!radeon_ttm_bo_is_radeon_bo(bo)) {
>>>>          placement->placement = &placements;
>>>>-        placement->busy_placement = &placements;
>>>>          placement->num_placement = 1;
>>>>-        placement->num_busy_placement = 1;
>>>>          return;
>>>>      }
>>>>      rbo = container_of(bo, struct radeon_bo, tbo);
>>>>@@ -114,15 +112,11 @@ static void radeon_evict_flags(struct 
>>>>ttm_buffer_object *bo,
>>>>               */
>>>>              radeon_ttm_placement_from_domain(rbo, 
>>>>RADEON_GEM_DOMAIN_VRAM |
>>>>                               RADEON_GEM_DOMAIN_GTT);
>>>>-            rbo->placement.num_busy_placement = 0;
>>>>              for (i = 0; i < rbo->placement.num_placement; i++) {
>>>>                  if (rbo->placements[i].mem_type == TTM_PL_VRAM) {
>>>>                      if (rbo->placements[i].fpfn < fpfn)
>>>>                          rbo->placements[i].fpfn = fpfn;
>>>>-                } else {
>>>>-                    rbo->placement.busy_placement =
>>>>-                        &rbo->placements[i];
>>>>-                    rbo->placement.num_busy_placement = 1;
>>>>+                    rbo->placements[0].flags |= TTM_PL_FLAG_DESIRED;
>>>>                  }
>>>>              }
>>>>          } else
>>>>diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c 
>>>>b/drivers/gpu/drm/radeon/radeon_uvd.c
>>>>index a2cda184b2b2..058a1c8451b2 100644
>>>>--- a/drivers/gpu/drm/radeon/radeon_uvd.c
>>>>+++ b/drivers/gpu/drm/radeon/radeon_uvd.c
>>>>@@ -324,7 +324,6 @@ void 
>>>>radeon_uvd_force_into_uvd_segment(struct radeon_bo *rbo,
>>>>      rbo->placements[1].fpfn += (256 * 1024 * 1024) >> PAGE_SHIFT;
>>>>      rbo->placements[1].lpfn += (256 * 1024 * 1024) >> PAGE_SHIFT;
>>>>      rbo->placement.num_placement++;
>>>>-    rbo->placement.num_busy_placement++;
>>>>  }
>>>>    void radeon_uvd_free_handles(struct radeon_device *rdev, 
>>>>struct drm_file *filp)
>>>>diff --git a/drivers/gpu/drm/ttm/ttm_bo.c 
>>>>b/drivers/gpu/drm/ttm/ttm_bo.c
>>>>index 8c1eaa74fa21..a5e11a92e0b9 100644
>>>>--- a/drivers/gpu/drm/ttm/ttm_bo.c
>>>>+++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>>>@@ -410,8 +410,8 @@ static int ttm_bo_bounce_temp_buffer(struct 
>>>>ttm_buffer_object *bo,
>>>>      struct ttm_resource *hop_mem;
>>>>      int ret;
>>>>  -    hop_placement.num_placement = 
>>>>hop_placement.num_busy_placement = 1;
>>>>-    hop_placement.placement = hop_placement.busy_placement = hop;
>>>>+    hop_placement.num_placement = 1;
>>>>+    hop_placement.placement = hop;
>>>>        /* find space in the bounce domain */
>>>>      ret = ttm_bo_mem_space(bo, &hop_placement, &hop_mem, ctx);
>>>>@@ -440,10 +440,9 @@ static int ttm_bo_evict(struct 
>>>>ttm_buffer_object *bo,
>>>>      dma_resv_assert_held(bo->base.resv);
>>>>        placement.num_placement = 0;
>>>>-    placement.num_busy_placement = 0;
>>>>      bdev->funcs->evict_flags(bo, &placement);
>>>>  -    if (!placement.num_placement && !placement.num_busy_placement) {
>>>>+    if (!placement.num_placement) {
>>>>          ret = ttm_bo_wait_ctx(bo, ctx);
>>>>          if (ret)
>>>>              return ret;
>>>>@@ -791,6 +790,9 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
>>>>          const struct ttm_place *place = &placement->placement[i];
>>>>          struct ttm_resource_manager *man;
>>>>  +        if (place->flags & TTM_PL_FLAG_FALLBACK)
>>>>+            continue;
>>>>+
>>>>          man = ttm_manager_type(bdev, place->mem_type);
>>>>          if (!man || !ttm_resource_manager_used(man))
>>>>              continue;
>>>>@@ -813,10 +815,13 @@ int ttm_bo_mem_space(struct 
>>>>ttm_buffer_object *bo,
>>>>          return 0;
>>>>      }
>>>>  -    for (i = 0; i < placement->num_busy_placement; ++i) {
>>>>-        const struct ttm_place *place = &placement->busy_placement[i];
>>>>+    for (i = 0; i < placement->num_placement; ++i) {
>>>>+        const struct ttm_place *place = &placement->placement[i];
>>>>          struct ttm_resource_manager *man;
>>>>  +        if (place->flags & TTM_PL_FLAG_DESIRED)
>>>>+            continue;
>>>>+
>>>>          man = ttm_manager_type(bdev, place->mem_type);
>>>>          if (!man || !ttm_resource_manager_used(man))
>>>>              continue;
>>>>@@ -904,11 +909,11 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
>>>>      /*
>>>>       * Remove the backing store if no placement is given.
>>>>       */
>>>>-    if (!placement->num_placement && !placement->num_busy_placement)
>>>>+    if (!placement->num_placement)
>>>>          return ttm_bo_pipeline_gutting(bo);
>>>>        /* Check whether we need to move buffer. */
>>>>-    if (bo->resource && ttm_resource_compat(bo->resource, placement))
>>>>+    if (bo->resource && ttm_resource_compatible(bo->resource, 
>>>>placement))
>>>>          return 0;
>>>>        /* Moving of pinned BOs is forbidden */
>>>>diff --git a/drivers/gpu/drm/ttm/ttm_resource.c 
>>>>b/drivers/gpu/drm/ttm/ttm_resource.c
>>>>index 02b96d23fdb9..fb14f7716cf8 100644
>>>>--- a/drivers/gpu/drm/ttm/ttm_resource.c
>>>>+++ b/drivers/gpu/drm/ttm/ttm_resource.c
>>>>@@ -291,37 +291,15 @@ bool ttm_resource_intersects(struct 
>>>>ttm_device *bdev,
>>>>  }
>>>>    /**
>>>>- * ttm_resource_compatible - test for compatibility
>>>>+ * ttm_resource_compatible - check if resource is compatible 
>>>>with placement
>>>>   *
>>>>- * @bdev: TTM device structure
>>>>- * @res: The resource to test
>>>>- * @place: The placement to test
>>>>- * @size: How many bytes the new allocation needs.
>>>>- *
>>>>- * Test if @res compatible with @place and @size.
>>>>+ * @res: the resource to check
>>>>+ * @placement: the placement to check against
>>>>   *
>>>>- * Returns true if the res placement compatible with @place and @size.
>>>>+ * Returns true if the placement is compatible.
>>>>   */
>>>>-bool ttm_resource_compatible(struct ttm_device *bdev,
>>>>-                 struct ttm_resource *res,
>>>>-                 const struct ttm_place *place,
>>>>-                 size_t size)
>>>>-{
>>>>-    struct ttm_resource_manager *man;
>>>>-
>>>>-    if (!res || !place)
>>>>-        return false;
>>>>-
>>>>-    man = ttm_manager_type(bdev, res->mem_type);
>>>>-    if (!man->func->compatible)
>>>>-        return true;
>>>>-
>>>>-    return man->func->compatible(man, res, place, size);
>>>>-}
>>>>-
>>>>-static bool ttm_resource_places_compat(struct ttm_resource *res,
>>>>-                       const struct ttm_place *places,
>>>>-                       unsigned num_placement)
>>>>+bool ttm_resource_compatible(struct ttm_resource *res,
>>>>+                 struct ttm_placement *placement)
>>>>  {
>>>>      struct ttm_buffer_object *bo = res->bo;
>>>>      struct ttm_device *bdev = bo->bdev;
>>>>@@ -330,44 +308,25 @@ static bool 
>>>>ttm_resource_places_compat(struct ttm_resource *res,
>>>>      if (res->placement & TTM_PL_FLAG_TEMPORARY)
>>>>          return false;
>>>>  -    for (i = 0; i < num_placement; i++) {
>>>>-        const struct ttm_place *heap = &places[i];
>>>>+    for (i = 0; i < placement->num_placement; i++) {
>>>>+        const struct ttm_place *place = &placement->placement[i];
>>>>+        struct ttm_resource_manager *man;
>>>>  -        if (!ttm_resource_compatible(bdev, res, heap, 
>>>>bo->base.size))
>>>>+        if (res->mem_type != place->mem_type)
>>>>+            continue;
>>>>+
>>>>+        man = ttm_manager_type(bdev, res->mem_type);
>>>>+        if (man->func->compatible &&
>>>>+            !man->func->compatible(man, res, place, bo->base.size))
>>>>              continue;
>>>>  -        if ((res->mem_type == heap->mem_type) &&
>>>>-            (!(heap->flags & TTM_PL_FLAG_CONTIGUOUS) ||
>>>>+        if ((!(place->flags & TTM_PL_FLAG_CONTIGUOUS) ||
>>>>               (res->placement & TTM_PL_FLAG_CONTIGUOUS)))
>>>>              return true;
>>>>      }
>>>>      return false;
>>>>  }
>>>>  -/**
>>>>- * ttm_resource_compat - check if resource is compatible with 
>>>>placement
>>>>- *
>>>>- * @res: the resource to check
>>>>- * @placement: the placement to check against
>>>>- *
>>>>- * Returns true if the placement is compatible.
>>>>- */
>>>>-bool ttm_resource_compat(struct ttm_resource *res,
>>>>-             struct ttm_placement *placement)
>>>>-{
>>>>-    if (ttm_resource_places_compat(res, placement->placement,
>>>>-                       placement->num_placement))
>>>>-        return true;
>>>>-
>>>>-    if ((placement->busy_placement != placement->placement ||
>>>>-         placement->num_busy_placement > placement->num_placement) &&
>>>>-        ttm_resource_places_compat(res, placement->busy_placement,
>>>>-                       placement->num_busy_placement))
>>>>-        return true;
>>>>-
>>>>-    return false;
>>>>-}
>>>>-
>>>>  void ttm_resource_set_bo(struct ttm_resource *res,
>>>>               struct ttm_buffer_object *bo)
>>>>  {
>>>>diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c 
>>>>b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
>>>>index 2bfac3aad7b7..bfd41ce3c8f4 100644
>>>>--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
>>>>+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
>>>>@@ -742,9 +742,21 @@ void vmw_bo_move_notify(struct 
>>>>ttm_buffer_object *bo,
>>>>          vmw_resource_unbind_list(vbo);
>>>>  }
>>>>  +static u32 placement_flags(u32 domain, u32 desired, u32 fallback)
>>>>+{
>>>>+    if (desired & fallback & domain)
>>>>+        return 0;
>>>>+
>>>>+    if (desired & domain)
>>>>+        return TTM_PL_FLAG_DESIRED;
>>>>+
>>>>+    return TTM_PL_FLAG_FALLBACK;
>>>>+}
>>>>+
>>>>  static u32
>>>>-set_placement_list(struct ttm_place *pl, u32 domain)
>>>>+set_placement_list(struct ttm_place *pl, u32 desired, u32 fallback)
>>>>  {
>>>>+    u32 domain = desired | fallback;
>>>>      u32 n = 0;
>>>>        /*
>>>>@@ -752,35 +764,40 @@ set_placement_list(struct ttm_place *pl, 
>>>>u32 domain)
>>>>       */
>>>>      if (domain & VMW_BO_DOMAIN_MOB) {
>>>>          pl[n].mem_type = VMW_PL_MOB;
>>>>-        pl[n].flags = 0;
>>>>+        pl[n].flags = placement_flags(VMW_BO_DOMAIN_MOB, desired,
>>>>+                          fallback);
>>>>          pl[n].fpfn = 0;
>>>>          pl[n].lpfn = 0;
>>>>          n++;
>>>>      }
>>>>      if (domain & VMW_BO_DOMAIN_GMR) {
>>>>          pl[n].mem_type = VMW_PL_GMR;
>>>>-        pl[n].flags = 0;
>>>>+        pl[n].flags = placement_flags(VMW_BO_DOMAIN_GMR, desired,
>>>>+                          fallback);
>>>>          pl[n].fpfn = 0;
>>>>          pl[n].lpfn = 0;
>>>>          n++;
>>>>      }
>>>>      if (domain & VMW_BO_DOMAIN_VRAM) {
>>>>          pl[n].mem_type = TTM_PL_VRAM;
>>>>-        pl[n].flags = 0;
>>>>+        pl[n].flags = placement_flags(VMW_BO_DOMAIN_VRAM, desired,
>>>>+                          fallback);
>>>>          pl[n].fpfn = 0;
>>>>          pl[n].lpfn = 0;
>>>>          n++;
>>>>      }
>>>>      if (domain & VMW_BO_DOMAIN_WAITABLE_SYS) {
>>>>          pl[n].mem_type = VMW_PL_SYSTEM;
>>>>-        pl[n].flags = 0;
>>>>+        pl[n].flags = placement_flags(VMW_BO_DOMAIN_WAITABLE_SYS,
>>>>+                          desired, fallback);
>>>>          pl[n].fpfn = 0;
>>>>          pl[n].lpfn = 0;
>>>>          n++;
>>>>      }
>>>>      if (domain & VMW_BO_DOMAIN_SYS) {
>>>>          pl[n].mem_type = TTM_PL_SYSTEM;
>>>>-        pl[n].flags = 0;
>>>>+        pl[n].flags = placement_flags(VMW_BO_DOMAIN_SYS, desired,
>>>>+                          fallback);
>>>>          pl[n].fpfn = 0;
>>>>          pl[n].lpfn = 0;
>>>>          n++;
>>>>@@ -806,7 +823,7 @@ void vmw_bo_placement_set(struct vmw_bo *bo, 
>>>>u32 domain, u32 busy_domain)
>>>>      u32 i;
>>>>        pl->placement = bo->places;
>>>>-    pl->num_placement = set_placement_list(bo->places, domain);
>>>>+    pl->num_placement = set_placement_list(bo->places, domain, 
>>>>busy_domain);
>>>>        if (drm_debug_enabled(DRM_UT_DRIVER) && bo->tbo.resource) {
>>>>          for (i = 0; i < pl->num_placement; ++i) {
>>>>@@ -821,8 +838,6 @@ void vmw_bo_placement_set(struct vmw_bo *bo, 
>>>>u32 domain, u32 busy_domain)
>>>>                   __func__, bo->tbo.resource->mem_type, domain);
>>>>      }
>>>>  -    pl->busy_placement = bo->busy_places;
>>>>-    pl->num_busy_placement = 
>>>>set_placement_list(bo->busy_places, busy_domain);
>>>>  }
>>>>    void vmw_bo_placement_set_default_accelerated(struct vmw_bo *bo)
>>>>diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c 
>>>>b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
>>>>index a84fffcef8e1..4d23d0a70bcb 100644
>>>>--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
>>>>+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
>>>>@@ -46,15 +46,11 @@ static const struct ttm_place 
>>>>sys_placement_flags = {
>>>>  struct ttm_placement vmw_vram_placement = {
>>>>      .num_placement = 1,
>>>>      .placement = &vram_placement_flags,
>>>>-    .num_busy_placement = 1,
>>>>-    .busy_placement = &vram_placement_flags
>>>>  };
>>>>    struct ttm_placement vmw_sys_placement = {
>>>>      .num_placement = 1,
>>>>      .placement = &sys_placement_flags,
>>>>-    .num_busy_placement = 1,
>>>>-    .busy_placement = &sys_placement_flags
>>>>  };
>>>>    const size_t vmw_tt_size = sizeof(struct vmw_ttm_tt);
>>>>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>>>index 8e4a3b1f6b93..1e5edc7f0b85 100644
>>>>--- a/drivers/gpu/drm/xe/xe_bo.c
>>>>+++ b/drivers/gpu/drm/xe/xe_bo.c
>>>>@@ -38,22 +38,26 @@ static const struct ttm_place 
>>>>sys_placement_flags = {
>>>>  static struct ttm_placement sys_placement = {
>>>>      .num_placement = 1,
>>>>      .placement = &sys_placement_flags,
>>>>-    .num_busy_placement = 1,
>>>>-    .busy_placement = &sys_placement_flags,
>>>>  };
>>>>  -static const struct ttm_place tt_placement_flags = {
>>>>-    .fpfn = 0,
>>>>-    .lpfn = 0,
>>>>-    .mem_type = XE_PL_TT,
>>>>-    .flags = 0,
>>>>+static const struct ttm_place tt_placement_flags[] = {
>>>>+    {
>>>>+        .fpfn = 0,
>>>>+        .lpfn = 0,
>>>>+        .mem_type = XE_PL_TT,
>>>>+        .flags = TTM_PL_FLAG_DESIRED,
>>>>+    },
>>>>+    {
>>>>+        .fpfn = 0,
>>>>+        .lpfn = 0,
>>>>+        .mem_type = XE_PL_SYSTEM,
>>>>+        .flags = TTM_PL_FLAG_FALLBACK,
>>>>+    }
>>>>  };
>>>>    static struct ttm_placement tt_placement = {
>>>>-    .num_placement = 1,
>>>>-    .placement = &tt_placement_flags,
>>>>-    .num_busy_placement = 1,
>>>>-    .busy_placement = &sys_placement_flags,
>>>>+    .num_placement = 2,
>>>>+    .placement = tt_placement_flags,
>>>>  };
>>>>    bool mem_type_is_vram(u32 mem_type)
>>>>@@ -230,8 +234,6 @@ static int 
>>>>__xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo 
>>>>*bo,
>>>>      bo->placement = (struct ttm_placement) {
>>>>          .num_placement = c,
>>>>          .placement = bo->placements,
>>>>-        .num_busy_placement = c,
>>>>-        .busy_placement = bo->placements,
>>>>      };
>>>>        return 0;
>>>>@@ -251,7 +253,6 @@ static void xe_evict_flags(struct 
>>>>ttm_buffer_object *tbo,
>>>>          /* Don't handle scatter gather BOs */
>>>>          if (tbo->type == ttm_bo_type_sg) {
>>>>              placement->num_placement = 0;
>>>>-            placement->num_busy_placement = 0;
>>>>              return;
>>>>          }
>>>>  @@ -1353,8 +1354,6 @@ static int 
>>>>__xe_bo_fixed_placement(struct xe_device *xe,
>>>>      bo->placement = (struct ttm_placement) {
>>>>          .num_placement = 1,
>>>>          .placement = place,
>>>>-        .num_busy_placement = 1,
>>>>-        .busy_placement = place,
>>>>      };
>>>>        return 0;
>>>>@@ -2112,9 +2111,7 @@ int xe_bo_migrate(struct xe_bo *bo, u32 mem_type)
>>>>        xe_place_from_ttm_type(mem_type, &requested);
>>>>      placement.num_placement = 1;
>>>>-    placement.num_busy_placement = 1;
>>>>      placement.placement = &requested;
>>>>-    placement.busy_placement = &requested;
>>>>        /*
>>>>       * Stolen needs to be handled like below VRAM handling if 
>>>>we ever need
>>>>diff --git a/include/drm/ttm/ttm_placement.h 
>>>>b/include/drm/ttm/ttm_placement.h
>>>>index 8074d0f6cae5..b510a4812609 100644
>>>>--- a/include/drm/ttm/ttm_placement.h
>>>>+++ b/include/drm/ttm/ttm_placement.h
>>>>@@ -64,6 +64,12 @@
>>>>  /* For multihop handling */
>>>>  #define TTM_PL_FLAG_TEMPORARY   (1 << 2)
>>>>  +/* Placement is never used during eviction */
>>>>+#define TTM_PL_FLAG_DESIRED    (1 << 3)
>>>>+
>>>>+/* Placement is only used during eviction */
>>>>+#define TTM_PL_FLAG_FALLBACK    (1 << 4)
>>>>+
>>>>  /**
>>>>   * struct ttm_place
>>>>   *
>>>>@@ -86,16 +92,12 @@ struct ttm_place {
>>>>   *
>>>>   * @num_placement:    number of preferred placements
>>>>   * @placement:        preferred placements
>>>>- * @num_busy_placement:    number of preferred placements when 
>>>>need to evict buffer
>>>>- * @busy_placement:    preferred placements when need to evict buffer
>>>>   *
>>>>   * Structure indicating the placement you request for an object.
>>>>   */
>>>>  struct ttm_placement {
>>>>      unsigned        num_placement;
>>>>      const struct ttm_place    *placement;
>>>>-    unsigned        num_busy_placement;
>>>>-    const struct ttm_place    *busy_placement;
>>>>  };
>>>>    #endif
>>>>diff --git a/include/drm/ttm/ttm_resource.h 
>>>>b/include/drm/ttm/ttm_resource.h
>>>>index 78a226eba953..1afa13f0c22b 100644
>>>>--- a/include/drm/ttm/ttm_resource.h
>>>>+++ b/include/drm/ttm/ttm_resource.h
>>>>@@ -365,12 +365,8 @@ bool ttm_resource_intersects(struct 
>>>>ttm_device *bdev,
>>>>                   struct ttm_resource *res,
>>>>                   const struct ttm_place *place,
>>>>                   size_t size);
>>>>-bool ttm_resource_compatible(struct ttm_device *bdev,
>>>>-                 struct ttm_resource *res,
>>>>-                 const struct ttm_place *place,
>>>>-                 size_t size);
>>>>-bool ttm_resource_compat(struct ttm_resource *res,
>>>>-             struct ttm_placement *placement);
>>>>+bool ttm_resource_compatible(struct ttm_resource *res,
>>>>+                 struct ttm_placement *placement);
>>>>  void ttm_resource_set_bo(struct ttm_resource *res,
>>>>               struct ttm_buffer_object *bo);
