Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E64EC4C621
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 09:26:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B928910E50C;
	Tue, 11 Nov 2025 08:25:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cz8+qqSP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76F6510E50A;
 Tue, 11 Nov 2025 08:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762849558; x=1794385558;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=r2me81pemsAVDT35XBmk1D6DGjlmX/KjjwEu/gkm4sE=;
 b=Cz8+qqSPUc5V6wpNSBRbrR78dY+USjHFUe0Fn1hmNVx6bnYYWES1y/ZK
 u9atnIuPXyFapaWoYTGNoktfCQONwHs16H87y1fGRGZvzubXraJXBZ4wU
 S6Afm9NDg69WXfV97oPWu1nKC7b7euhC774w1a+piY+UgMgwQLJpRfT34
 ArNb2h16EaIrMOO5hdWnvdkWDC2uGcik0AMQuZKDMRdmSKH814zzTSHbs
 wJ+LR1GFQ8zSknzKPXVjATtSk7bTiSws2+/H8LTpHc+k+SNMH5ciJjd9G
 Wu0NZeFUYZSXsOXBkmh8momolILe4gi8y7C5c4T12jxiXVWy9vwkl1hZQ w==;
X-CSE-ConnectionGUID: UYwCTb/mStClKFnkdNFxcw==
X-CSE-MsgGUID: XwKr4M9gTIq5qHMimgYNVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64611693"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="64611693"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 00:25:58 -0800
X-CSE-ConnectionGUID: Nkiq0seARyOu5SlgK9jsgQ==
X-CSE-MsgGUID: KfPcNro8SBCFwOGVcm9ReQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="188166339"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 00:25:58 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 00:25:57 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 11 Nov 2025 00:25:57 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.54) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 00:25:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SvxH1XWFwFWdOtauuudUu/X+9pQduv7khT/zD7aiRXYm5U1legVooFQ1ofBGphp4GXoMA//CI7wb4c+MfVKYMie7L4eCvyZcha4QqudBKl5fCn2Z8kfGnPmB/bkPm/VUfU+YrirMlqLxdT646I3ZHR8cPBoFphuBOI4XXLwB6F67O+5OnecnxaYraqo2aTCyHtSvWwaNfpxrUV8uj+hISKQcEtf9CwcRbzYxezwmqL3ttN59pb0FyBENjYvzywR+9zUuAonquGGvut3Ii3vUTh4EjG/0HwHOMJwjT/mCg8VWX+fWfOva4GoOSMReKOlxno09+AKCvsp89Yi2jQcF7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tj3F/EB6tWPTrQh//sI71Cr7hjHDrL4Dq14evpRvouQ=;
 b=JtcEaPtT6dQ6SLOLlS+J+Tao9R48UIWGqyU5wWm0T+ySm87ROsAXWMGoqETuJi1RsFGZoRB+AJqjDchcFtQVygHO4AkthHzitheFCJQJ9QpK/6PR10jwxugotCD9UvGho45P8xl2Fj7Z098wW1nSaRas+CgBEH47ephFCnEVoZmfpW9/JroBgQwxfil/mq+Ew6p19iT6QN9UOFcXDsKFnG4oJ9DcatvMm527L7WPJIS/NnQjEsuF32Ce2gh2YeRMkbbByJlyznK0HwgI8BY/bHeTbbBnBP0kKeQyoqVhKvkJm/lN1yPTe6gjPwsOnnukvaa+WxYD1l3u+xp6PdVkGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH0PR11MB5093.namprd11.prod.outlook.com (2603:10b6:510:3e::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.15; Tue, 11 Nov 2025 08:25:55 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 08:25:55 +0000
Date: Tue, 11 Nov 2025 09:25:51 +0100
From: "Winiarski, Michal" <michal.winiarski@intel.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
CC: Alex Williamson <alex@shazbot.org>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, "Shameer
 Kolothum" <skolothumtho@nvidia.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Brost, Matthew" <matthew.brost@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, "Laguna, Lukasz" <lukasz.laguna@intel.com>, "Christoph
 Hellwig" <hch@infradead.org>
Subject: Re: [PATCH v5 28/28] vfio/xe: Add device specific vfio_pci driver
 variant for Intel graphics
Message-ID: <7ig24norebemzdih64rcpvdj22xee23ha7bndiltkgjlpmoau2@25usxq7teedz>
References: <20251111010439.347045-1-michal.winiarski@intel.com>
 <20251111010439.347045-29-michal.winiarski@intel.com>
 <BN9PR11MB527638018267BA3AF8CD49678CCFA@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BN9PR11MB527638018267BA3AF8CD49678CCFA@BN9PR11MB5276.namprd11.prod.outlook.com>
X-ClientProxiedBy: WA0P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::22) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH0PR11MB5093:EE_
X-MS-Office365-Filtering-Correlation-Id: a9a1c389-d981-46ec-0ece-08de20fbeebd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?enlEaEoydDdCZnRjM1VrbEFUWCsxeVB3U1htcG1jaTJmOTNtaEN5K21tMk4y?=
 =?utf-8?B?ekVVN3FVWm1mNmhjMzlvbGJsUERnU0lkWU10N2FBbTF2bll3aUlZMVl5OGpY?=
 =?utf-8?B?dlJrYmY3Y3RONVZqak1kT1NBQWhCbVk0a25aQ2J4WHhuZTcrUDNoNWQ4a1Fj?=
 =?utf-8?B?U3dXbTJKejZqeis5V3B4U09maXR4eHQ5RHlRMFRLakQ5VEgyWUErbW5zZ2xX?=
 =?utf-8?B?N3hYUWlvVFhrQncwbDh3bmFHdzhNSUNuZkk0R3BRcHZCVCtSd2tvc0hZTTA2?=
 =?utf-8?B?bzNJTFFwT1QrQ3hYNFpFVTRjZUYxYU42QlUwN0tibUllMWdmOEJTQmJJeFRR?=
 =?utf-8?B?MENoOVpzZWY2aFA1aTdPWWUwNTA2WWtKYXk0aWVINU9FVFZMeHlVdkNyRUJO?=
 =?utf-8?B?VFRVUnUyeUkvVmNJcDB0NUxGVkNHNUNIVnFLL1Rpc0UyL05uQW15QnZ3eEpR?=
 =?utf-8?B?eldBTktCbGRjSWZYamhyTGtxRU55L3VhQlhVZllHdTQvemo1MXBPVE94QWIv?=
 =?utf-8?B?bXRJV2dYdWlqL1hHTENGRjdYYnJGMUV0QzNuRlZMMDZ0RDBHWlpaTmdNcmRT?=
 =?utf-8?B?YXlocnlrcldQTmZuNHkwOVVVL25lNTY5RTQ2WFdIbVFlY0twS2hUWTB2d3di?=
 =?utf-8?B?dFJycWovUU5uVlZDUzB0WktJYUVVZGw3Ym4wRmx5SkZBQjFnck5tbUpsbXo1?=
 =?utf-8?B?SVR0aEpFaENjbTh0VE9kLzlMSmFza05jbER5WGlKWGY0dTZ0UkJBSUpVSnpk?=
 =?utf-8?B?a2krVVpGQTFkdDZMeDJIY2kycHJTWmJDaW5uOG45ZWxJK2oyQitkbHdCUnM4?=
 =?utf-8?B?QkVDYWYwR1RzTmF3WStHd0NtZzVvdWlNaCtybzBuVUI4OTg3cndtZEwvQXNx?=
 =?utf-8?B?VjVkcjFUZkt5ZHhCL3dRM2UyVEs2TmY5MUpPOGdBSERicWlGTU55UlJQQk5v?=
 =?utf-8?B?WUxSYlNjbUZxNDgzeFhOOXdSMmQ5NFlWT1BsajhjbG9SQUkrNUIvYkc2Rkdm?=
 =?utf-8?B?c05vZERjbTByeXZTckU3b2pGd2dHQ2Y4TURxclAxV2tKemNNTmVnYVFsNXdt?=
 =?utf-8?B?QWloTmZrRGhHTTNLa25oL09HcFUzRVNMRm5Xa1hWNzVWWGpUdDhmeWR1RmJh?=
 =?utf-8?B?RWFBendvMmdwQ25PTExzRU02b2FoYURtcjlEcU43L0lQY2RobHF4SzBHVUwy?=
 =?utf-8?B?cWY0d2UyVFNWVnRtK3RGOGEyUlNoRDQrTmZYRFVSd1dIbU5pMjlPdHNkd1N3?=
 =?utf-8?B?bEZRSE11VE1FdlZLczVseEd6dTVNSlhIdW5KQWxWcWxIdW1UelJwSkUzVFg2?=
 =?utf-8?B?WHpYTjJhWC9uT1B6N1JLZFFkRVpMQVVzQi83RlhLc2ZncysxK2JzaWt6L2t4?=
 =?utf-8?B?ZEMyalYxa3dQMVhScGZCVGtSRElWSEd3M2lPQzV3d3pZZVRPNUVxUWNoOVlO?=
 =?utf-8?B?djJTQjhFZ3luZmxWckhGRmgzSmhKN1oyYmFVMUZPV0NQVnFXMnJ1NXdvMjEw?=
 =?utf-8?B?WDJZREVhcUl6WE9xalN4ay9Fb21kWkdET3R4N3RiZGFkWG9LQkhYSmFnNklP?=
 =?utf-8?B?UUpISnowZEpUbDJOeXJ0QldpMFljQWhxK01BcnI4bU1sWW51UGVmZDQ1eWVv?=
 =?utf-8?B?NGRJTnBZdkVYNHhYWXBFQlVveFRXMkdHaFFYRUNzTUZpbVZZcnZmZW9qaEk2?=
 =?utf-8?B?aVdjRGRNY1hFWVU1cVBxMDRsSVp1Rmo5RGMxQkRacHl0TG9YNTFIRWJZeHhj?=
 =?utf-8?B?NlFqZzg2Z09vTmwvL2x6OWV1Mll0ZmtiQ0k4TzVjRXFVVFFPTm0vR0U4emxE?=
 =?utf-8?B?SzhERWtZdW45RThrMmFaQ3Vzb3p3VzFYQ2sxbGE2c1EwMExxdEZFcFBQaVJV?=
 =?utf-8?B?WmpEMFFQMGtpT3QwaGZnNWpTbzVGajhSNUlaKzhzc3VRWHdZbkROTkdjdURm?=
 =?utf-8?B?alo3eWZ5SUdQQTliMVJnMUF5ZHkyUHJZMHpWZVo1MkZWUythTHZsaGg3c2t1?=
 =?utf-8?B?Y2lqZ3JPTjlBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXg5dWU0dDYyaEJudXBwdG1vckdHckNGTVg5S0o0TDBHN3lBZU56ekhqWlFE?=
 =?utf-8?B?eHlsaHoxQitWTWlJZmN1VHdEYmF1V1RDVUJxK2xOdW5aNjE5ZGRhSXdncXBO?=
 =?utf-8?B?T2VmOUZIaXJjRVFSSGhIU3NYM3JGVEM5eWYyQTdnWTlrdWhWMzJ6ZHJRVDVV?=
 =?utf-8?B?bHlJUjIvRTVnWU1zaFZjVCttbGtJWG9Sc2ZvOHhVeTd4S1pOM2dXY205V3k3?=
 =?utf-8?B?SDgwcHovVUFMZ2MzeU9nWU5Pb251TlZlcm1TcHhicXBzV1RnQjQ5bGtSY2Ny?=
 =?utf-8?B?dzlVYlhid0FRL2tpUnladHo2Wi9keUUrNlRVb0dzK1RHUTl1Qit5Z2YrQWFq?=
 =?utf-8?B?UjFWMWZOdWJrWmZwdWc2ZXMyZkg3ajhVWlkwL2N1UDlib3JJTC83bTQ5d2dI?=
 =?utf-8?B?ajMraEtIQVF5MjdEYm9HSDZCVmE1Y2JRdTVFY3lsV2hVS05NVWs3aW9xU1Aw?=
 =?utf-8?B?NXFKbnlJM0tzSVRreFM4d0R3Qm5mYnRQSnlMQW51aVBDK2pjdmNtcUJXc3Vh?=
 =?utf-8?B?SmVNNDhDb2xlNFYwZ0FqcTZqMlFCQzlZQ1hMbkVTM3N2Y3ltUnl5ZWdzSUtD?=
 =?utf-8?B?N3pNdk1SbXdYekVDMEVFY1B0SjBSUFRXa3VFVXRTVnpyOEZDN1BBZEsxNGdq?=
 =?utf-8?B?UnB4VDRvNVVtK0IvUmdBQSs4d1h1OGlmV1ZhSjlocFRwWUNSdW9yQkVXTTVv?=
 =?utf-8?B?d25Za1p4N2RqSU1QM2Y2dW9XdHZ4VmVOSEl6QXFkVWkzSksyTkxBRlJxN1k1?=
 =?utf-8?B?TFpwQnlWaUxiZWIrd3pnVFEwZWVHRHlmWDFoRUsxSW9aTE1PdEtBTk16Y2kr?=
 =?utf-8?B?MUtzcnJwSklCbjFRZ1hocmxaZ3ZwRWdWaUs5TGo4bGJuZGtnVEhuWXVFU3Jm?=
 =?utf-8?B?TWo1eEF6L2xvL0E1K0R1MFdHdlczdHhLQ3Y4b0ZzR3d3enV5b0xiQzFXSUFh?=
 =?utf-8?B?ZVphY0p5UEgzdWtrdFpnSWo4TXgrdzNPM00yUDhnZ0JJS0pDNS9YMmFPdXpO?=
 =?utf-8?B?SDhUVTMvMUd5MUVLODF5WXMwazhMb3RZemFoeGRJUEpRTmpPWXRYdVdQazFV?=
 =?utf-8?B?RWZ1QU9pSmFjZ2ZiMmV6NUZvcGVuZXN1TUdSZmo0SHpEUGwrS2pzYzJnNHVL?=
 =?utf-8?B?WVp1RFdHQjVvNi9XRHlMTmVRTWdicXBoSkFHUnlZRHBtZ3hMQTR4OGxUZkxO?=
 =?utf-8?B?RCtCSzA3K255ekdxVjVuaUk3dmpiRU5xZ1ZwV3ZLZmk5Y1ZpcVBmUXg0MWxo?=
 =?utf-8?B?QlN6VitVS1N6R2JUR0NUNXQwTzE0ZXhiVHExUGMwK1duK0c4cDI2UDhPNTQz?=
 =?utf-8?B?Ylp6VDQxVnA1ZnRpYXdSQzJPOStONUNodFNiSmpGZUoyVlBaQ2YwS1FpMjFP?=
 =?utf-8?B?UlZtQ1BTTmZRRjJLM21DVnlLd3hkckdmbUdscnQwdFBUMUpLbHBoR094N0wv?=
 =?utf-8?B?VVNZWmZleVRHdHJFVTNuTzRSNmMraGlkSG9xbVlTcUxDaDc4ZjV3MlBwM2FS?=
 =?utf-8?B?Mmk0MFNiOTJLdXIvN1RFeTdPTW5iTzhYRTBHRW5haHB4c0tVaGk1Skg5Zjdq?=
 =?utf-8?B?V0JXTHRHSDNFenZUZzJSMGNZTVVydm1SSlFWVms3SlNKL21oVEdCQjVxdU55?=
 =?utf-8?B?K1ByVnZVejRyLzlUSWxrV3FZeWF1TktPOWxUMkFaOWxRMDBrV2JFQ1F3YVhZ?=
 =?utf-8?B?enA5d0wvcXNqR3hFMkF1dm5PV0RVZG8wK0VIejJkNGdCTGRsNmRtcFE3eHlN?=
 =?utf-8?B?QzlnTG80WlV2WWt3UlBjMjBmWXlESzNrQlJXZ0lmazF1T2IyZUxtVXNmZndV?=
 =?utf-8?B?ODFzTUkrYjNRcmVaNm1VejJyNFE3Y3ArbEhqM1BQYTRONWtja2tLUC8zcEhm?=
 =?utf-8?B?a1ZOcnBUMXVNMGdMcjUyanlsUkpkbFI3ejY1eS9qZ0c3S2F2Y0xzSDRHN1lS?=
 =?utf-8?B?bmQwaWRETEdmT2dMUSt0UTlvZVczbGVqd215T20rSVIwQU9yU0xIN0owV0Q0?=
 =?utf-8?B?cVJNMjE2Ni9OQU45UGFvZTFFeDd4WEloWEhLeTZ2T0ozTGorb2N4WFpJYzFU?=
 =?utf-8?B?WTY5cGd1TGhXaG1oSWNhbmJDS3B3cEZoNGtNVHJDQnM5dHBZMzI4RTBKUzgx?=
 =?utf-8?B?MGJrek5SbUo1TkxnR08zOHZCOFdaT0hKcmJobFNmRUh0TVRnd1dzWHo3ZVZl?=
 =?utf-8?B?YVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9a1c389-d981-46ec-0ece-08de20fbeebd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 08:25:55.1513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3NM0Anne7A7kiUqL1NKdZ8BsIQWYnoRNw0tstzP/BBMPVwgpjE8Fd4G7C69KFkAX7w2a5YjSTDY+YmQ/cCeciXGkEX0mRRpnFi5ssj5qqgg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5093
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

On Tue, Nov 11, 2025 at 02:38:19AM +0100, Tian, Kevin wrote:
> > From: Winiarski, Michal <michal.winiarski@intel.com>
> > Sent: Tuesday, November 11, 2025 9:05 AM
> > +
> > +	/*
> > +	 * As the higher VFIO layers are holding locks across reset and using
> > +	 * those same locks with the mm_lock we need to prevent ABBA
> > deadlock
> > +	 * with the state_mutex and mm_lock.
> > +	 * In case the state_mutex was taken already we defer the cleanup
> > work
> > +	 * to the unlock flow of the other running context.
> > +	 */
> > +	spin_lock(&xe_vdev->reset_lock);
> > +	xe_vdev->deferred_reset = true;
> > +	if (!mutex_trylock(&xe_vdev->state_mutex)) {
> > +		spin_unlock(&xe_vdev->reset_lock);
> > +		return;
> > +	}
> > +	spin_unlock(&xe_vdev->reset_lock);
> > +	xe_vfio_pci_state_mutex_unlock(xe_vdev);
> > +
> > +	xe_vfio_pci_reset(xe_vdev);
> > +}
> 
> Jason suggested to do this in the core given it's common [1].
> 
> If you disagree, then please raise it and get consensus in that thread
> instead of rushing to post a new version...
> 
> [1] https://lore.kernel.org/all/20251108004754.GD1859178@ziepe.ca/

Hi,

I agree that it should be done in the core eventually.
I didn't view it as something blocking next revision, as the discussion
was in the context of converting every driver, which is something that
probably shouldn't be done as part of this series.

Note that the v6.19 feature pull for Xe is likely going to happen
tomorrow, so that's part of the reason for "rushing" the next version.
I wanted to collect all the r-bs on Xe side to be prepared for that.
If any parts of this series need to go through Xe tree, it will need to
be merged there soon (or wait all the way until v6.20 / v7).

Thanks,
-Michał
