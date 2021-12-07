Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B0646C4DC
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 21:46:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D34666F8D8;
	Tue,  7 Dec 2021 20:46:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD436E93F;
 Tue,  7 Dec 2021 20:46:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="235197357"
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; d="scan'208";a="235197357"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 12:46:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; d="scan'208";a="605865226"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP; 07 Dec 2021 12:46:24 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 7 Dec 2021 12:46:23 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 7 Dec 2021 12:46:23 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 7 Dec 2021 12:46:23 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 7 Dec 2021 12:46:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RYct9r6PcpyG085siSQFqeeDYB2ojcjqlsRdmevbDlott9LdEEGSrIHrZvQm/Vh2Mgp/iUJehct8NSYbBvtaMSxj7o7b8SgdAApeAYUVy9qszFr2J5rAzMQQ8vOBw/vq7aUvErc+jsG/spNOTY62IItcUhwiBsDBHoyqweyVADu2wkeLzqr7pjT7UbPs/aRirkoUtPInM6S71ytdJ75Os80OWEyba/fPhtRmXbwcIxjsCpNcUUm/ZwGzav6Xow7KP8I2RScjpQJ+Lj6cu7jugGyKTC4GIYi2mrWYYtlAGVyudx0LRSzsoMYMuVHKn0KTUt5FPdTUMO74Kpb4//Xhww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LSTBbogeYIOAm1E9qdYOmYg/HLxjmVq31NMTwK3nWb8=;
 b=E8ckRrEaLZbIjsWjoL06VQ8nk13cgDnrP7MIeZAa1PohRKygm628OXtxJKMZAVsSDCK3Z7UU+i1Wc0Our4VUhIxyuY2xTtzkf8UTJZ/PeyWKWyUX4lKdZUnk3DFtDmTuoK/Fo21P7x/S/pYs5b8ZHIWEykYaB96on/tKArvRlxxXJZpHTpst52VUpBCs/qM4z6ygpnyqIGwL5E5HxfTwFQYr5vUVpMIZaStoRDyQFFaT5/dvNbsnfaw2FZYEE26SN32WhzypYJEgud4FruRMcrl9uSA1ElQu8aRlgOgrO4441jwWD8syIaolSvmHYBVwIYnwUizbZfbxY7vyK7/3Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LSTBbogeYIOAm1E9qdYOmYg/HLxjmVq31NMTwK3nWb8=;
 b=XeVVNd4slMvAlK+vzZHBROWyLGw/uQD6lrQWMHmW4tVN5eTcrjbgQjIzfWrfHYK9tDl5lS1BUdZQPboZxNql+zV1Pk7Rr/OBfi1PYNF3oJDfPq8xrE3T4QuWy7hPJqNja58VFBnFpsuX9TYqH/cL1COQEekdZxMupo012JrFkQM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5675.namprd11.prod.outlook.com (2603:10b6:510:d4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Tue, 7 Dec
 2021 20:46:18 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::d8b9:b1c1:dd29:82e7]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::d8b9:b1c1:dd29:82e7%8]) with mapi id 15.20.4755.021; Tue, 7 Dec 2021
 20:46:18 +0000
Message-ID: <07fdf6b3-1b5b-de3d-7fce-c1a821a75e26@intel.com>
Date: Tue, 7 Dec 2021 12:46:15 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: [Intel-gfx] [PATCH v7] drm/i915: Update error capture code to
 avoid using the current vma state
Content-Language: en-GB
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20211129202245.472043-1-thomas.hellstrom@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20211129202245.472043-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MWHPR10CA0021.namprd10.prod.outlook.com (2603:10b6:301::31)
 To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MWHPR10CA0021.namprd10.prod.outlook.com (2603:10b6:301::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.17 via Frontend Transport; Tue, 7 Dec 2021 20:46:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e5c69fe-b859-413b-666e-08d9b9c29ea3
X-MS-TrafficTypeDiagnostic: PH0PR11MB5675:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <PH0PR11MB56753F44F18C9AA74954DF2FBD6E9@PH0PR11MB5675.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:305;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DUd0CHNxhNWBHL2y6w9KraiBHE1xkyTMGw5Wm1g4UZct+te2mtIe+J9C75uC9NxkDAcp4UhAdUtTsMbCsKaks4AMkEiaJNhGt2VHM6091QWdl8lBRab9Le8C+8aCOIMR2EOThLOsiZEJDErbiq6PV+IYOX4khz8voXNHONHd15wZNDsUm0EUNw6acCt/1pVltfTnm8hYQUAagew2cKP/wOqfUZBF1zSss8NIWrM81EgNrGXfOhE1kflBDvLQ6nIuNfiYV/U9yaomXylLSR7Dm++/Fs910fQQKdsnTZFqlqPoQ/CxoSc5JFH1exlaxJbhU1o4DuH2YPFVrp4L/oHJw12Ob4aQCj0myZcHbXir3QecQcibvjtw5or9fY4/1uPeDEqoezPwDvQSGlkcT47o1Eh6aIP1qvMDOtxFfKB95zNzAge4J1rRU26ktG12E/y+PMVWFyGFJS4q8Rk6FaISl9o5SSQu3gGYfpQNaxgsZoui5bJNe4HXg6BpQlbusivXpSNbxO9j5Fs/DbtfjjtL+HPA0YQO7fOpsQ2EgkCXxXHWeGIoIxxfu4aYzUkao1Z0KxG4Yb/jX8JbtAL/j6avPkw+VivCVbZxmRv9l1+XBBzpy/HShHmIloGnqMaRjbDvED8lGSQLKZqOvcnHfZmGCD1zcU0S9T8su1ucddmcju2qti99RXout+o5aFeXfx5GJyIaM+SODxL8uDSIUFujE00aSO08BWqOrGkz7chaHHYCkeTDpZHgrlQK7zc2E6CJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(15650500001)(66476007)(2616005)(36756003)(316002)(26005)(66946007)(16576012)(38100700002)(956004)(31696002)(66556008)(186003)(31686004)(8676002)(8936002)(30864003)(83380400001)(5660300002)(4326008)(86362001)(508600001)(2906002)(82960400001)(6486002)(53546011)(66574015)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEJsMHVOQXNYTmUrSWhOMDBxb1ErbXJvRDE4K3lhN25ybytSaE4wZFVvNGZ2?=
 =?utf-8?B?aHRmc01QK0JiS2l2RkdEQ0NVTU9aTmpWU01kUnF4eHl5eUthMlRkSlZHSjhy?=
 =?utf-8?B?VUsvLzNWaGhQcUdQWmlGV0ZEK2k0azhQZXdWaWlBdTdQSUs1VlZqcDd4WUtq?=
 =?utf-8?B?YVJQR2tOV0ZheXUraFJlU05hSWdBald5ZmV5NEh4M0l1S0NRa3hwc0VvVFFp?=
 =?utf-8?B?eExOdGg3M1VMRVVuenpoOWxHd0xNQkdTUm44UHNnQmFNblo4dURtSVFVRVFn?=
 =?utf-8?B?VmNyd2trSjRhUFdsdm4yRmpSQjlGMkZpL0ZqQjhENjdkVHF4Ni9GYlMrdXJs?=
 =?utf-8?B?Uk12R1ljYTFNOTliMERlZUpyb1JzRDZSN0hjaUJKVHdKNEZmTXdmYkkvTlgw?=
 =?utf-8?B?WXY3MWdFYWVubzNLci9rUEFJMldvMktGWHg5Vmd3WHJIaWVpbHladlZESlAx?=
 =?utf-8?B?RTUyYnJQdWM3TmNXZDBQenllaHRVT0ZlZHAwYldzOUpOSnIrQ21RcmVzeG9y?=
 =?utf-8?B?Wi9VVWV0dXZHNjd3c0hUSVNZS0NiQUhiNG1MU01yNnRVSFJoV0IxWmxKYTlz?=
 =?utf-8?B?a21zYUdBQlZlMnpQWFNSeGZTNnFONXZBcnVTQzRuL1pkOW1BaDNLNFo5VEZW?=
 =?utf-8?B?ZzFjLytOaHpMYVBldEoxZFpBZU0wREtlV1U3S3hMYm43eWREb1NuZnJMaDl6?=
 =?utf-8?B?MzJ5QlZVcUp1cWM0d0g0RGJmRWFMNkd0RTJOYWw2Sk42TWdZcGFWRjhsUk9m?=
 =?utf-8?B?b1R5VXNJSi9zeEVMamZPNk5kWHgyL3piYnlFcldUVXExK0JNYnVGTGtMcmh6?=
 =?utf-8?B?OXBrTzIrTitGTDU1N1NHdHRqTHVuRi9MNktIdldScDJ5RVBFTnFNbUtlbEh4?=
 =?utf-8?B?a2RKUWVBeWt1NWRqMXNzeTQ2bks1d09reHF1MHd5eU0vR1h4NmEwUkxYaUdV?=
 =?utf-8?B?L1hSQ0g0NDZ4bFpST1ZDL1F2ZFY2TmQ1T1NDYXlndVFuNnBLQVVOMmwxcm9D?=
 =?utf-8?B?MWMvSHNwZERDeEswd2JOZURiMjlkcEIxdDIyOUlLNFovM0ZrR2lDOVp5cmZm?=
 =?utf-8?B?T2J6M0pjRU1HN3lETytrVExwTGp2bGRlNDBMdHhnUXhkNnlmaTJ1aFZVSURz?=
 =?utf-8?B?ZFR1VG12OEtMdm9jUlZ5WWI3cTRmSU1DZy9OMmRVSzRpd1YzZkNQSzVqenlC?=
 =?utf-8?B?K0xSY0pvbTlOTE1wanI2eHkrOHRneGI4MHpnVTRibXFtaVBWRzZ3UU05K3BW?=
 =?utf-8?B?bXRNb245TjMwUVNaWm9oTE94UjRNaENBc2UrRVFnSWI5VnJCODUxQ09zdVE1?=
 =?utf-8?B?YjJIaVVFTEJEYnFncXdzblVsekFmRHVOKzF1TkN1R292anllaXRDRWdRQTZK?=
 =?utf-8?B?d2crN2NzQjZHT09yaW5hM1prbWEyMjJtaUdOUzl2TWlZMlpCbGdneTlkVFlz?=
 =?utf-8?B?eVN5RnFxd0x5amxVWUtNa1FubFBidENldVdJeDBiZjN4MVpvdHQrMDdsQ1g0?=
 =?utf-8?B?MTZvSnRIaHVoWUN1OVM0aVNtMEhSbG1Ia0g4S3hNYTRkcW11TWxzRjZPcm1o?=
 =?utf-8?B?RHpKZFFwR2hGTVdzL1RxK25ubmZ4eUxBbnF4M1k5a0pEeGtJcnljaTZXMW5q?=
 =?utf-8?B?MGFNc05NeDB3SHY2bGlNRDVuYmRNekJpamFrZW1STXRSWVlMYnV1TFp3L09q?=
 =?utf-8?B?dnpQSWQyNUN4Sjhxam0xMUJTWXFmcUN5L21zYW9pdGY1OG5lcHVXYkFBUXVO?=
 =?utf-8?B?MWJoc08wbDZuK0tISmlVYUIyRE5ERlVDRTR4ZGJPQkNmYkRFNzI2ZVBKT2NX?=
 =?utf-8?B?NFR2UVp1RUJaU3B4ZzEweW5hTWt2ektXbW1FRE83VlE5YkY1OG83REFpaGE1?=
 =?utf-8?B?QTNkcXhnUERUN1QydUgxWjQ1WXFZMkVOTUwzZ0J3V0tUMDZaa0kxNHY4RjN2?=
 =?utf-8?B?RG1mZFVtNXA1Z0pRbEF1Y1ZqNXAxVDFya1lwY2pxUEdUUXpWN2FKeWpVN2Ji?=
 =?utf-8?B?b1BkWGdDMVdnZXphK1NTWHpWbmRqWDA2UzF4TjR3UEZDV0RUZU9tdjJyeEJr?=
 =?utf-8?B?dnl3dlhlRmE4NVRxcTBVSHUvZnNaTFc0aDZrZkY3ci95YXJOVlFzK3cwQWtX?=
 =?utf-8?B?QitXTUYzRGE5M2o2MmJHb05GbUpHMFlwUUJCT3g5R2dzYUMvaFRyQUYzUjE0?=
 =?utf-8?B?enlnN0ZocWczUWt4RlNydmdXM0IzM1UwcER0M3VrSzJEKzdxS2VDL2IxVDN4?=
 =?utf-8?Q?ui6E529gHbE6ySH8lYMyebeMn3prd6bPDdOdsv22zc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e5c69fe-b859-413b-666e-08d9b9c29ea3
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2021 20:46:18.7750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BffOj1z+JtmPGOaeoPP9CbYWotYP79rvF5ac1k7QJvSwF+Q150lrSPaaH/UeytXvQivv3QHBWM/BCsWsLGdoIRoO6NiboaZB/QH2NJlFyEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5675
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
Cc: matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/29/2021 12:22, Thomas Hellström wrote:
> With asynchronous migrations, the vma state may be several migrations
> ahead of the state that matches the request we're capturing.
> Address that by introducing an i915_vma_snapshot structure that
> can be used to snapshot relevant state at request submission.
> In order to make sure we access the correct memory, the snapshots take
> references on relevant sg-tables and memory regions.
>
> Also move the capture list allocation out of the fence signaling
> critical path and use the CONFIG_DRM_I915_CAPTURE_ERROR define to
> avoid compiling in members and functions used for error capture
> when they're not used.
>
> Finally, Introduce lockdep annotation.
>
> v4:
> - Break out the capture allocation mode change to a separate patch.
> v5:
> - Fix compilation error in the !CONFIG_DRM_I915_CAPTURE_ERROR case
>    (kernel test robot)
> v6:
> - Use #if IS_ENABLED() instead of #ifdef to match driver style.
> - Move yet another change of allocation mode to the separate patch.
> - Commit message rework due to patch reordering.
> v7:
> - Adjust for removal of region refcounting.
>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
> ---
>   drivers/gpu/drm/i915/Makefile                 |   1 +
>   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 135 +++++++++++---
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c     |   8 +-
>   drivers/gpu/drm/i915/i915_gpu_error.c         | 176 +++++++++++++-----
>   drivers/gpu/drm/i915/i915_request.c           |  63 +++++--
>   drivers/gpu/drm/i915/i915_request.h           |  20 +-
>   drivers/gpu/drm/i915/i915_vma_snapshot.c      | 134 +++++++++++++
>   drivers/gpu/drm/i915/i915_vma_snapshot.h      | 112 +++++++++++
>   8 files changed, 554 insertions(+), 95 deletions(-)
>   create mode 100644 drivers/gpu/drm/i915/i915_vma_snapshot.c
>   create mode 100644 drivers/gpu/drm/i915/i915_vma_snapshot.h
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 3f57e85d4846..3b5857da4123 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -173,6 +173,7 @@ i915-y += \
>   	  i915_trace_points.o \
>   	  i915_ttm_buddy_manager.o \
>   	  i915_vma.o \
> +	  i915_vma_snapshot.o \
>   	  intel_wopcm.o
>   
>   # general-purpose microcontroller (GuC) support
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 9f7c6ecadb90..6a0ed537c199 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -29,6 +29,7 @@
>   #include "i915_gem_ioctls.h"
>   #include "i915_trace.h"
>   #include "i915_user_extensions.h"
> +#include "i915_vma_snapshot.h"
>   
>   struct eb_vma {
>   	struct i915_vma *vma;
> @@ -307,11 +308,15 @@ struct i915_execbuffer {
>   
>   	struct eb_fence *fences;
>   	unsigned long num_fences;
> +#if IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR)
> +	struct i915_capture_list *capture_lists[MAX_ENGINE_INSTANCE + 1];
> +#endif
>   };
>   
>   static int eb_parse(struct i915_execbuffer *eb);
>   static int eb_pin_engine(struct i915_execbuffer *eb, bool throttle);
>   static void eb_unpin_engine(struct i915_execbuffer *eb);
> +static void eb_capture_release(struct i915_execbuffer *eb);
>   
>   static inline bool eb_use_cmdparser(const struct i915_execbuffer *eb)
>   {
> @@ -1054,6 +1059,7 @@ static void eb_release_vmas(struct i915_execbuffer *eb, bool final)
>   			i915_vma_put(vma);
>   	}
>   
> +	eb_capture_release(eb);
>   	eb_unpin_engine(eb);
>   }
>   
> @@ -1891,36 +1897,113 @@ eb_find_first_request_added(struct i915_execbuffer *eb)
>   	return NULL;
>   }
>   
> -static int eb_move_to_gpu(struct i915_execbuffer *eb)
> +#if IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR)
> +
> +/* Stage with GFP_KERNEL allocations before we enter the signaling critical path */
> +static void eb_capture_stage(struct i915_execbuffer *eb)
>   {
>   	const unsigned int count = eb->buffer_count;
> -	unsigned int i = count;
> -	int err = 0, j;
> +	unsigned int i = count, j;
> +	struct i915_vma_snapshot *vsnap;
>   
>   	while (i--) {
>   		struct eb_vma *ev = &eb->vma[i];
>   		struct i915_vma *vma = ev->vma;
>   		unsigned int flags = ev->flags;
> -		struct drm_i915_gem_object *obj = vma->obj;
>   
> -		assert_vma_held(vma);
> +		if (!(flags & EXEC_OBJECT_CAPTURE))
> +			continue;
>   
> -		if (flags & EXEC_OBJECT_CAPTURE) {
> +		vsnap = i915_vma_snapshot_alloc(GFP_KERNEL);
> +		if (!vsnap)
> +			continue;
> +
> +		i915_vma_snapshot_init(vsnap, vma, "user");
> +		for_each_batch_create_order(eb, j) {
>   			struct i915_capture_list *capture;
>   
> -			for_each_batch_create_order(eb, j) {
> -				if (!eb->requests[j])
> -					break;
> +			capture = kmalloc(sizeof(*capture), GFP_KERNEL);
> +			if (!capture)
> +				continue;
>   
> -				capture = kmalloc(sizeof(*capture), GFP_KERNEL);
> -				if (capture) {
> -					capture->next =
> -						eb->requests[j]->capture_list;
> -					capture->vma = vma;
> -					eb->requests[j]->capture_list = capture;
> -				}
> -			}
> +			capture->next = eb->capture_lists[j];
> +			capture->vma_snapshot = i915_vma_snapshot_get(vsnap);
> +			eb->capture_lists[j] = capture;
> +		}
> +		i915_vma_snapshot_put(vsnap);
> +	}
> +}
> +
> +/* Commit once we're in the critical path */
> +static void eb_capture_commit(struct i915_execbuffer *eb)
> +{
> +	unsigned int j;
> +
> +	for_each_batch_create_order(eb, j) {
> +		struct i915_request *rq = eb->requests[j];
> +
> +		if (!rq)
> +			break;
> +
> +		rq->capture_list = eb->capture_lists[j];
> +		eb->capture_lists[j] = NULL;
> +	}
> +}
> +
> +/*
> + * Release anything that didn't get committed due to errors.
> + * The capture_list will otherwise be freed at request retire.
> + */
> +static void eb_capture_release(struct i915_execbuffer *eb)
> +{
> +	unsigned int j;
> +
> +	for_each_batch_create_order(eb, j) {
> +		if (eb->capture_lists[j]) {
> +			i915_request_free_capture_list(eb->capture_lists[j]);
> +			eb->capture_lists[j] = NULL;
>   		}
> +	}
> +}
> +
> +static void eb_capture_list_clear(struct i915_execbuffer *eb)
> +{
> +	memset(eb->capture_lists, 0, sizeof(eb->capture_lists));
> +}
> +
> +#else
> +
> +static void eb_capture_stage(struct i915_execbuffer *eb)
> +{
> +}
> +
> +static void eb_capture_commit(struct i915_execbuffer *eb)
> +{
> +}
> +
> +static void eb_capture_release(struct i915_execbuffer *eb)
> +{
> +}
> +
> +static void eb_capture_list_clear(struct i915_execbuffer *eb)
> +{
> +}
> +
> +#endif
> +
> +static int eb_move_to_gpu(struct i915_execbuffer *eb)
> +{
> +	const unsigned int count = eb->buffer_count;
> +	unsigned int i = count;
> +	int err = 0, j;
> +
> +	while (i--) {
> +		struct eb_vma *ev = &eb->vma[i];
> +		struct i915_vma *vma = ev->vma;
> +		unsigned int flags = ev->flags;
> +		struct drm_i915_gem_object *obj = vma->obj;
> +
> +		assert_vma_held(vma);
>   
>   		/*
>   		 * If the GPU is not _reading_ through the CPU cache, we need
> @@ -2001,6 +2084,8 @@ static int eb_move_to_gpu(struct i915_execbuffer *eb)
>   
>   	/* Unconditionally flush any chipset caches (for streaming writes). */
>   	intel_gt_chipset_flush(eb->gt);
> +	eb_capture_commit(eb);
> +
>   	return 0;
>   
>   err_skip:
> @@ -3143,13 +3228,14 @@ eb_requests_create(struct i915_execbuffer *eb, struct dma_fence *in_fence,
>   		}
>   
>   		/*
> -		 * Whilst this request exists, batch_obj will be on the
> -		 * active_list, and so will hold the active reference. Only when
> -		 * this request is retired will the batch_obj be moved onto
> -		 * the inactive_list and lose its active reference. Hence we do
> -		 * not need to explicitly hold another reference here.
> +		 * Not really on stack, but we don't want to call
> +		 * kfree on the batch_snapshot when we put it, so use the
> +		 * _onstack interface.
>   		 */
> -		eb->requests[i]->batch = eb->batches[i]->vma;
> +		if (eb->batches[i]->vma)
> +			i915_vma_snapshot_init_onstack(&eb->requests[i]->batch_snapshot,
> +						       eb->batches[i]->vma,
> +						       "batch");
>   		if (eb->batch_pool) {
>   			GEM_BUG_ON(intel_context_is_parallel(eb->context));
>   			intel_gt_buffer_pool_mark_active(eb->batch_pool,
> @@ -3198,6 +3284,8 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>   	eb.fences = NULL;
>   	eb.num_fences = 0;
>   
> +	eb_capture_list_clear(&eb);
> +
>   	memset(eb.requests, 0, sizeof(struct i915_request *) *
>   	       ARRAY_SIZE(eb.requests));
>   	eb.composite_fence = NULL;
> @@ -3284,6 +3372,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>   	}
>   
>   	ww_acquire_done(&eb.ww.ctx);
> +	eb_capture_stage(&eb);
>   
>   	out_fence = eb_requests_create(&eb, in_fence, out_fence_fd);
>   	if (IS_ERR(out_fence)) {
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 332756036007..f2ccd5b53d42 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -1676,14 +1676,18 @@ static void intel_engine_print_registers(struct intel_engine_cs *engine,
>   
>   static void print_request_ring(struct drm_printer *m, struct i915_request *rq)
>   {
> +	struct i915_vma_snapshot *vsnap = &rq->batch_snapshot;
>   	void *ring;
>   	int size;
>   
> +	if (!i915_vma_snapshot_present(vsnap))
> +		vsnap = NULL;
> +
>   	drm_printf(m,
>   		   "[head %04x, postfix %04x, tail %04x, batch 0x%08x_%08x]:\n",
>   		   rq->head, rq->postfix, rq->tail,
> -		   rq->batch ? upper_32_bits(rq->batch->node.start) : ~0u,
> -		   rq->batch ? lower_32_bits(rq->batch->node.start) : ~0u);
> +		   vsnap ? upper_32_bits(vsnap->gtt_offset) : ~0u,
> +		   vsnap ? lower_32_bits(vsnap->gtt_offset) : ~0u);
>   
>   	size = rq->tail - rq->head;
>   	if (rq->tail < rq->head)
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index b1e4ce0f798f..c61f9aaa40f9 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -48,6 +48,7 @@
>   #include "i915_gpu_error.h"
>   #include "i915_memcpy.h"
>   #include "i915_scatterlist.h"
> +#include "i915_vma_snapshot.h"
>   
>   #define ALLOW_FAIL (__GFP_KSWAPD_RECLAIM | __GFP_RETRY_MAYFAIL | __GFP_NOWARN)
>   #define ATOMIC_MAYFAIL (GFP_ATOMIC | __GFP_NOWARN)
> @@ -1012,8 +1013,7 @@ void __i915_gpu_coredump_free(struct kref *error_ref)
>   
>   static struct i915_vma_coredump *
>   i915_vma_coredump_create(const struct intel_gt *gt,
> -			 const struct i915_vma *vma,
> -			 const char *name,
> +			 const struct i915_vma_snapshot *vsnap,
>   			 struct i915_vma_compress *compress)
>   {
>   	struct i915_ggtt *ggtt = gt->ggtt;
> @@ -1024,7 +1024,7 @@ i915_vma_coredump_create(const struct intel_gt *gt,
>   
>   	might_sleep();
>   
> -	if (!vma || !vma->pages || !compress)
> +	if (!vsnap || !vsnap->pages || !compress)
>   		return NULL;
>   
>   	dst = kmalloc(sizeof(*dst), ALLOW_FAIL);
> @@ -1037,12 +1037,12 @@ i915_vma_coredump_create(const struct intel_gt *gt,
>   	}
>   
>   	INIT_LIST_HEAD(&dst->page_list);
> -	strcpy(dst->name, name);
> +	strcpy(dst->name, vsnap->name);
>   	dst->next = NULL;
>   
> -	dst->gtt_offset = vma->node.start;
> -	dst->gtt_size = vma->node.size;
> -	dst->gtt_page_sizes = vma->page_sizes.gtt;
> +	dst->gtt_offset = vsnap->gtt_offset;
> +	dst->gtt_size = vsnap->gtt_size;
> +	dst->gtt_page_sizes = vsnap->page_sizes;
>   	dst->unused = 0;
>   
>   	ret = -EINVAL;
> @@ -1050,7 +1050,7 @@ i915_vma_coredump_create(const struct intel_gt *gt,
>   		void __iomem *s;
>   		dma_addr_t dma;
>   
> -		for_each_sgt_daddr(dma, iter, vma->pages) {
> +		for_each_sgt_daddr(dma, iter, vsnap->pages) {
>   			mutex_lock(&ggtt->error_mutex);
>   			ggtt->vm.insert_page(&ggtt->vm, dma, slot,
>   					     I915_CACHE_NONE, 0);
> @@ -1068,11 +1068,11 @@ i915_vma_coredump_create(const struct intel_gt *gt,
>   			if (ret)
>   				break;
>   		}
> -	} else if (__i915_gem_object_is_lmem(vma->obj)) {
> -		struct intel_memory_region *mem = vma->obj->mm.region;
> +	} else if (vsnap->mr && vsnap->mr->type != INTEL_MEMORY_SYSTEM) {
> +		struct intel_memory_region *mem = vsnap->mr;
>   		dma_addr_t dma;
>   
> -		for_each_sgt_daddr(dma, iter, vma->pages) {
> +		for_each_sgt_daddr(dma, iter, vsnap->pages) {
>   			void __iomem *s;
>   
>   			s = io_mapping_map_wc(&mem->iomap,
> @@ -1088,7 +1088,7 @@ i915_vma_coredump_create(const struct intel_gt *gt,
>   	} else {
>   		struct page *page;
>   
> -		for_each_sgt_page(page, iter, vma->pages) {
> +		for_each_sgt_page(page, iter, vsnap->pages) {
>   			void *s;
>   
>   			drm_clflush_pages(&page, 1);
> @@ -1324,37 +1324,71 @@ static bool record_context(struct i915_gem_context_coredump *e,
>   
>   struct intel_engine_capture_vma {
>   	struct intel_engine_capture_vma *next;
> -	struct i915_vma *vma;
> +	struct i915_vma_snapshot *vsnap;
>   	char name[16];
> +	bool lockdep_cookie;
>   };
>   
>   static struct intel_engine_capture_vma *
> -capture_vma(struct intel_engine_capture_vma *next,
> -	    struct i915_vma *vma,
> -	    const char *name,
> -	    gfp_t gfp)
> +capture_vma_snapshot(struct intel_engine_capture_vma *next,
> +		     struct i915_vma_snapshot *vsnap,
> +		     gfp_t gfp)
>   {
>   	struct intel_engine_capture_vma *c;
>   
> -	if (!vma)
> +	if (!i915_vma_snapshot_present(vsnap))
>   		return next;
>   
>   	c = kmalloc(sizeof(*c), gfp);
>   	if (!c)
>   		return next;
>   
> -	if (!i915_active_acquire_if_busy(&vma->active)) {
> +	if (!i915_vma_snapshot_resource_pin(vsnap, &c->lockdep_cookie)) {
>   		kfree(c);
>   		return next;
>   	}
>   
> -	strcpy(c->name, name);
> -	c->vma = vma; /* reference held while active */
> +	strcpy(c->name, vsnap->name);
> +	c->vsnap = vsnap;
> +	i915_vma_snapshot_get(vsnap);
>   
>   	c->next = next;
>   	return c;
>   }
>   
> +static struct intel_engine_capture_vma *
> +capture_vma(struct intel_engine_capture_vma *next,
> +	    struct i915_vma *vma,
> +	    const char *name,
> +	    gfp_t gfp)
> +{
> +	struct i915_vma_snapshot *vsnap;
> +
> +	if (!vma)
> +		return next;
> +
> +	/*
> +	 * If the vma isn't pinned, then the vma should be snapshotted
> +	 * to a struct i915_vma_snapshot at command submission time.
> +	 * Not here.
> +	 */
> +	GEM_WARN_ON(!i915_vma_is_pinned(vma));
> +	if (!i915_vma_is_pinned(vma))
> +		return next;
> +
> +	vsnap = i915_vma_snapshot_alloc(gfp);
> +	if (!vsnap)
> +		return next;
> +
> +	i915_vma_snapshot_init(vsnap, vma, name);
> +	next = capture_vma_snapshot(next, vsnap, gfp);
> +
> +	/* FIXME: Replace on async unbind. */
> +	i915_vma_snapshot_put(vsnap);
> +
> +	return next;
> +}
> +
>   static struct intel_engine_capture_vma *
>   capture_user(struct intel_engine_capture_vma *capture,
>   	     const struct i915_request *rq,
> @@ -1363,7 +1397,7 @@ capture_user(struct intel_engine_capture_vma *capture,
>   	struct i915_capture_list *c;
>   
>   	for (c = rq->capture_list; c; c = c->next)
> -		capture = capture_vma(capture, c->vma, "user", gfp);
> +		capture = capture_vma_snapshot(capture, c->vma_snapshot, gfp);
>   
>   	return capture;
>   }
> @@ -1377,6 +1411,36 @@ static void add_vma(struct intel_engine_coredump *ee,
>   	}
>   }
>   
> +static struct i915_vma_coredump *
> +create_vma_coredump(const struct intel_gt *gt, struct i915_vma *vma,
> +		    const char *name, struct i915_vma_compress *compress)
> +{
> +	struct i915_vma_coredump *ret = NULL;
> +	struct i915_vma_snapshot tmp;
> +	bool lockdep_cookie;
> +
> +	if (!vma)
> +		return NULL;
> +
> +	i915_vma_snapshot_init_onstack(&tmp, vma, name);
> +	if (i915_vma_snapshot_resource_pin(&tmp, &lockdep_cookie)) {
> +		ret = i915_vma_coredump_create(gt, &tmp, compress);
> +		i915_vma_snapshot_resource_unpin(&tmp, lockdep_cookie);
> +	}
> +	i915_vma_snapshot_put_onstack(&tmp);
> +
> +	return ret;
> +}
<snip>

> @@ -1554,10 +1620,8 @@ gt_record_uc(struct intel_gt_coredump *gt,
>   	 */
>   	error_uc->guc_fw.path = kstrdup(uc->guc.fw.path, ALLOW_FAIL);
>   	error_uc->huc_fw.path = kstrdup(uc->huc.fw.path, ALLOW_FAIL);
> -	error_uc->guc_log =
> -		i915_vma_coredump_create(gt->_gt,
> -					 uc->guc.log.vma, "GuC log buffer",
> -					 compress);
> +	error_uc->guc_log = create_vma_coredump(gt->_gt, uc->guc.log.vma,
> +						"GuC log buffer", compress);
<snip>

> +bool i915_vma_snapshot_resource_pin(struct i915_vma_snapshot *vsnap,
> +				    bool *lockdep_cookie)
> +{
> +	bool pinned = i915_active_acquire_if_busy(vsnap->vma_resource);
> +
> +	if (pinned)
> +		*lockdep_cookie = dma_fence_begin_signalling();
> +
> +	return pinned;
> +}
>

This change has broken the capture of GuC logs. The snapshot wrapper 
requires the vma to be in the active list. The GuC log is never in the 
active list as it has nothing to do with requests. Thus 
create_cma_coredump() always returns a null pointer and there is no log 
in the crash dump.

John.

