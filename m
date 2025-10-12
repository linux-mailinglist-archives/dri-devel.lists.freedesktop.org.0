Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2CDBD0AC6
	for <lists+dri-devel@lfdr.de>; Sun, 12 Oct 2025 21:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB76710E199;
	Sun, 12 Oct 2025 19:15:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VRD5yFv6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F27FA10E194;
 Sun, 12 Oct 2025 19:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760296535; x=1791832535;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=o6p/FQVRyk8txcNSt7UMelH3qPAxP/7+S8ziwL2ou1c=;
 b=VRD5yFv6Zq1719uOsS1o2JAFnbSrAfAk8YTCtxlBwWbNS9GtjQxxTdQx
 EsmbrDgMY6tkhkh+UXH6cJVm4tzIskUskAF9mSFvxdatx7mkoxmIjrEC3
 pu7Lq1hn4+rilOtb/4odC3jcg3CXictfP1T4lBY2hZD7+veIX8LiKhdV5
 aLLSItT6zNHyux6Eb5unyKIMhntOrB1rDWYTvLZmMcRVhEBSTTXyCkAmf
 pSX9XeILc8tZKM3taHRNetM2v2kJ7huyzuEeb8RuJE1jDX2Qckl4yLq6U
 KD+WxW6a+8E6D12DedzQuZ9wBnkYUT428nUL5tHjT2+JT/xy2HpmRHyW1 g==;
X-CSE-ConnectionGUID: kf7aPDiFRJCazjd01DW1qg==
X-CSE-MsgGUID: S8iq7AMYRGukaQO3/7NB6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="80081213"
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="80081213"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 12:15:34 -0700
X-CSE-ConnectionGUID: RPUlaIEBSbWvHM1Nps+5Gw==
X-CSE-MsgGUID: NPUq53dDQfq783c5eWam0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="180539776"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 12:15:34 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 12 Oct 2025 12:15:33 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 12 Oct 2025 12:15:33 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.11) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 12 Oct 2025 12:15:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lczx6W33N4IOrEr2pN17WlMFsVkq10CNqhLv1oUaHGMTndKlxphYX33rpvGlRYruUmPXTEyGhBW5jFiNkrgbAVWdhZI+1QG1VHK1aG2FDOBRwRg7K40EaBpVjDFb1NMw3WvXIKc0jA3VUdTMSDqWXY7asZxUz9SI8PeOzB4G6NttgVg9MkoHNlfWkHWyKb/7OgZBoF9ZkXMi4RQH1iw83h45ynJezhXrtCSu4EmsYyF7mL8+kH+VdAcGWoVSK6qOnxce/Mh3bushyoIxRnAMM2VqG1AHdBqqF3uv2htpaAfTnVE6/XzS6BS/XmjalSUjiRrgchqiBSWkfkR0j2ZxRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ohWbbTkfUGJwIEafwoLuPorWDhBjUGW5RKvlGWoDSIU=;
 b=WYjHoXGJlb9lJcHJBiY5WLQb4eZJxP8n6dqqc3K6I5AVir5LVcLTi5LuVEy4pI6L6AULAdYhgcOJLW9zUOl1KX6Rrx07exKHSZ3AZW+mdolkpdm9JXNFIgjn/6WNphU8QGmTtjaGuM8z1TSbpdq3RWEtUgGmpm/1VvKnTuwEjT8cEDhwWtMMK2OyOZoucUg6fk2/+FlotyHbdTD+PUL0oJ06owu3w1+sRMBWk7jgl3EbT2ILNe7kNIVG8TGQZZjdQT/CLTFOKT83Go4PeJE1XjvPgZ8uHpq/riez+7y7CzoxBT+yy/mO+vAAYILRm09WksY8t1PlB+BhGoChIa9Uyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW6PR11MB8390.namprd11.prod.outlook.com (2603:10b6:303:240::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Sun, 12 Oct
 2025 19:15:26 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9203.009; Sun, 12 Oct 2025
 19:15:26 +0000
Date: Sun, 12 Oct 2025 12:15:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
CC: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH 09/26] drm/xe/pf: Expose VF migration data size over
 debugfs
Message-ID: <aOv+SpcZvMQXWEc1@lstrano-desk.jf.intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-10-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251011193847.1836454-10-michal.winiarski@intel.com>
X-ClientProxiedBy: MW4PR03CA0077.namprd03.prod.outlook.com
 (2603:10b6:303:b6::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW6PR11MB8390:EE_
X-MS-Office365-Filtering-Correlation-Id: 55b41d7c-1975-49b8-a560-08de09c3b339
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXRKQndJdWlQUUZ2Mks3dGRpZE1aUE8rbko0SEVoZXlKTzk5aWQ3NWhMTFdH?=
 =?utf-8?B?aGhmUXlmRXpybUs3cWN6K2h2ZUNBVUVFRVFQdHU5c0Z4NjljQm5CSTh4cjIz?=
 =?utf-8?B?TUV5Rk54ZzlPc1FJNHY3UVNDUG8vc0tHeEM5V0xneVFrME1heTlUakE2L2do?=
 =?utf-8?B?NXpSRVFBeThkSFp2WjVxRVU2cEFDR2UzVFVuOE9kbVJrTDdzWnpLcE80Ukgw?=
 =?utf-8?B?Tm5Kc3U3TkU5QkNzTUtXMVczQmpBTlFnaC9tQnpMVEk3VEdLR1V4MTNVNEx6?=
 =?utf-8?B?ajM3NG9DaDRlcGFtR3gveHg4d0RNODFCQlA2ZnJKUTJiZWNZL2N5a0NxWkhF?=
 =?utf-8?B?Nldtdk1Yc0dLd3g0LzJNYXdKNzlMT09zUkJKelNiakRGZDFGODdnMXdLQ0Rn?=
 =?utf-8?B?ekZvQWwzaURRTW1FQiszcVIwZmVjeHovR1ZRd3Y4SGthSWNzUTZZekxscmR1?=
 =?utf-8?B?K2t4Z052QzlBUXl5VGhJNjljc1o2cS9WMzlWcHR4eEVVOWNyRmhJNVlNNEhq?=
 =?utf-8?B?WGhXZUNvaFJEZWJaNlhRSi9Sdk9UTEp2RW5UUWtsWTJ4TkNaWC83Y3daYVlS?=
 =?utf-8?B?akUyeWF1YkNudHVBV2c5U1YwaWNwSjRRVE5seGlmTEhseVRhalFHY3VHb1Mr?=
 =?utf-8?B?am5XMFU1OGZYb0xzSWdJUjBQR0h1QTRSL0l4VmF3anU5U2E0dTNGWXhwYy9o?=
 =?utf-8?B?MmhheEd1VDFUWXNBU1RiaFhJRGk0WEhucnNIUWlCUGlaTUkvVkpiT3dwaVpu?=
 =?utf-8?B?Rk1MbUVaS2hrcEFob1ozQXNobGZMOUxCbHlHSnpLWGRrR0w0R2xXUERSeHRm?=
 =?utf-8?B?bWt4a0I4U3FTWEQ1V2M1T1RaWHVaYmNnSVJiVEl0aU5rdGp5TmNsOXRETHNq?=
 =?utf-8?B?MTBxZ2FxRzFFQkdtNC8wVnVZbG1pbDExN0VyQVVuUnJUK21rUitKSTRQWUxo?=
 =?utf-8?B?U2dsK3YweHVxdXYxQlN1QStxTkpLbmNFbWtEcGlIQWdHOHBUYVNQYVBkSEdT?=
 =?utf-8?B?UlUyVzZYY1dOSVo1ck0ycU96Sm1YTGtxVFM0QWd6ZFc0ZEVtTG1GeEhwT0JP?=
 =?utf-8?B?QmpleDlITGwzemZvYWUvaEJhS3lsT0toclJpVmFuakUveHc5dytJa0FJK2E2?=
 =?utf-8?B?bGp2WmdTWXNuT3ZjLzMrTlBlMW8wSUIxckNDaURTVzVkeUtQeU5rYmxUM0Ro?=
 =?utf-8?B?Sk52WmJ4aXErSmpsWGoySEdKeG5ramQ1RjVnUWRHTkdlYlZjRUdMVEdHMTJP?=
 =?utf-8?B?Q3NuMlc5ek56d2dvUFFsVDZPSVZ3WjV1OUNiVEhtNUJlL3laMWY1emt1ZS83?=
 =?utf-8?B?NklrcEhtNVV4L0Nnc3VDY2xGVnN1dTFqTlNBNTlwczhJUTh6dk1raE5vRDBJ?=
 =?utf-8?B?WW5DTnNzN2xtN2thdnVta0pZR2VVcGdOSzliQTdoV0NYR1lpcHpUTTh4dHkw?=
 =?utf-8?B?VllYdFU4V1FaNWU5TzE4QTNXeWtrS3BLRzNxK3o0Zk02cmJYTmh6NVgzelNV?=
 =?utf-8?B?Uk8zVjhtaFIxQWlaMkNJYzlaa1NhNitrejZlckNuNlNYWnUyYTl1RnRxSnZp?=
 =?utf-8?B?UERwRnFhNTZwa1RoT3hiMmNmQ21nY2VvWVVpY2MwWDdienFWcVhJR0NtZEZ6?=
 =?utf-8?B?YzkzTGc5bFkvelFaYk45YkhDMWp3c0ZuM09XaEdvWFJFMENtY0Q3ZDE1Uml3?=
 =?utf-8?B?amdMaUdTeU9HRkpFb3JGZ2hvditKcmJKdTAvV1ZCc0V5YytsZ2g1UnhCbERk?=
 =?utf-8?B?cXBWUG1GWmRWd2FBUVo5Wm1Da3lPK1JMazQzaExWTWRkMXpveUhOR3R3djNq?=
 =?utf-8?B?alYwbTAvb1QyTWJ3T20yTlV1alRQc2plOHNTNmhPc1JVeFhmUGdjZTFqS2JN?=
 =?utf-8?B?SW81V3M2MFN3dWRpbmVoUlJwSmM4M1Qxbk5Udm9kdkozQVN0dHFCWmlxUFU1?=
 =?utf-8?Q?1MBkBdySp2IYQc0McMMiEAfHfokTzFXR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V21GRWNta0R1REtSWDBGSUozck1IUkZyS1Qwd3RrOWxTWHZzdFU3NnhNTlli?=
 =?utf-8?B?YUp2dm55L1ZGN25aL1k3bmZlak53N1J0c1JnUDJPVkZqV2FjUEVTNzFmbUpq?=
 =?utf-8?B?THpsNk1LcEpINTJyNzR1dkZmK3ZYaFAxbUJSa29Ta0lGQnY0QUM3allRZDYx?=
 =?utf-8?B?dUFRRmNNS1c0b3VSYnpCN1JMdzM3TGNzemxOY09FVSs0cG16NTh3Vmg2THNn?=
 =?utf-8?B?MlVwOFdxQ01qWUFCRjlDa043SzJDbDJSemoyNkFSVVgybElLMGlHMEw1WnJN?=
 =?utf-8?B?UmVod2xINkhrNFZkNWoxZksvL1VicjBDYnJuZHg2THZLdFZLejN4TERrU0tn?=
 =?utf-8?B?cjN5NHAvMllQbWNmd0paMk1mRU41RGp2VXhrd2Q0VXd6M2N4TGVzbzIvSDdQ?=
 =?utf-8?B?azk3UTk0VmhrM2hVZWZZU1A5dUVjQlkvMTJQeHB1UEowd3U3d3p1ZE1qcVVW?=
 =?utf-8?B?TE9KTVRpSFdlaGRoaHhlS2dvbXVNY2dtOENvRnF4ZVhnTklyTEd1VXBjWTdZ?=
 =?utf-8?B?dllMVENQRUE2amdpZFVPUzJGV01Odm93czUxWTEvRGxXK3oyWHVFa1NuRFlv?=
 =?utf-8?B?MCtIRHNVRm5TWExqaCt2VHpEaGJDaHN2M3RSaWJudi9EYU1pRFMvQXZqQmNW?=
 =?utf-8?B?dVJ6WS9PRG1qSXZoYzJ1ZCtxbXRTWWhMb25YeXVaL1RYQWpLQlJaSEVOemFR?=
 =?utf-8?B?YThtQU42RVRtU2hzM2M3V2loYk1SL3RaMU95VTVjZER1UHd0emFuMU9lOThV?=
 =?utf-8?B?UzByZG1FRFpybU5zUnYyZHRBRUU4K3Uwb001eGpkQk5XZkJvdklYall3cURu?=
 =?utf-8?B?WXo1VUdXNzByQ2xmOUJZQ08wcTQ2c0hydTA5c3hoenhOd1o4a2NGSVpWblpa?=
 =?utf-8?B?eVdwUytYYmJpZkZ6cjVxS1h4b0liY0N6dWhwb2JYRk9mT0ZPUEp1UExpNGx2?=
 =?utf-8?B?RjBUY2JOKzFSREtua3JDcGVMOTRVeTY1bjRVVk9QTFZUem14ZUFBWGxnNHlv?=
 =?utf-8?B?bEV6QzFBSTQvdFF1Q040ZTNzVk8yckp4UnJNWkgyWGhBcDVCdHoyWFl3SExp?=
 =?utf-8?B?V3dOTzFmQTdobW1BSklCcWExWHM3ZmdDSERtNE1Jb2VldklNZ0cxelo0YTNC?=
 =?utf-8?B?c0JzNW5UenZFb2xWdkk5dytZSlJZT2tMQXNSSkUzRjArZmRlTXFZYnBreHVI?=
 =?utf-8?B?NnVSUGQ0dEFlZ2RjeCt2UEZnS2JEU1R3bkdLenZNUElkUkxPOXFNeXIrOGIx?=
 =?utf-8?B?TkxJMkF6UDVuQVY0MnNmaDhGdEYwUmt5L1FZRWJNWkV3dTFIci9nM2hXNk4r?=
 =?utf-8?B?U2h6M0dwMkFOMkxTQ2plcUNHcGxEeWo4RkhiakpiZU41ejc4eHUyTWJhUmh0?=
 =?utf-8?B?Z09uSFZ1dnJFZHNMMERNcVdYYWllUW9rajRucmN6citGbHh0amMxTDlOWFd6?=
 =?utf-8?B?U1R2Zm9mcFJ2UmtrSWh5Mm5FSkg4OEsxTTZBaHlXaWNua1dnTUV2aVRrVkhQ?=
 =?utf-8?B?NzhDeGZzRzJnRHZwcE9WVVMxL2xsWWU2c1lEbUg1U2lXK3IxV2RFUmM5T1dv?=
 =?utf-8?B?ZTdzOS85TXY2dEdid2x3bWxxRHZ5QmUzUXJ1ZWpVTmlVVUYvdXVMQ1FNU3NH?=
 =?utf-8?B?WVZ5SDZjanRyblVHNzJiejVLN1N1Si80VVJqaWZpKy8wYVVvZWtvcnhUc3FP?=
 =?utf-8?B?WlBpcXdqaUhSRmw5eng5LzE4cGlULzEyM2RjdHBoV3hxOXNUc2pZckZSc1VB?=
 =?utf-8?B?YUw5aDU4ZEs0NkU4ZTU4ZWVsR3F5MlN0dTFrZXZOOWwzK21sNG4xK1hFclF2?=
 =?utf-8?B?UFI0UXBCSlNScEJlMjdFSnhGeFBhZStBMlB3eEZ3VGU5N3k4OUlTeHpjMUpq?=
 =?utf-8?B?RDEwa1BQemhaMXd2QzRKVkxBcXpuVGR1Z01qNSt2YUVQeDVvbDZ3T1RSY3Vl?=
 =?utf-8?B?MlB3YVhvcysvb2YzYStQYlF3OHkzVzNyd2p4TGlPZ2p0TEpWN3pDdDVMaU9Q?=
 =?utf-8?B?Ui9ZV1dPQ0ZqTGtkMVNhOHZEVDV2UGU0bGFEOGlybWM3UkFzVXhIM2w1Y2kr?=
 =?utf-8?B?R1l6MEQzQ1hLOWE3K0pWSHNUdWdnSUJKUmRRT1c4YXR5QmlucmFRK3lzL3Fi?=
 =?utf-8?B?a3VqaW5BZEhNQjdkSGtqL2hsTlpXaTU3VHNXMElkNTVXdytjM2R5L3hYZ2V1?=
 =?utf-8?B?enc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55b41d7c-1975-49b8-a560-08de09c3b339
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2025 19:15:26.4657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6a+11bSyrS+JZN1rcJbtR7z6Esg/C5QKokwJqDj0c5GuCuX+PYKiDfmUEv4mVdEEmS+4V4YWJNabNhE/3YQ1Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8390
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

On Sat, Oct 11, 2025 at 09:38:30PM +0200, Michał Winiarski wrote:
> The size is normally used to make a decision on when to stop the device
> (mainly when it's in a pre_copy state).
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 18 ++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  2 ++
>  drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      | 34 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 30 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf_migration.h    |  1 +
>  5 files changed, 85 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> index 582aaf062cbd4..50f09994e2854 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> @@ -395,6 +395,24 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
>  }
>  #endif /* CONFIG_DEBUG_FS */
>  
> +/**
> + * xe_gt_sriov_pf_migration_size() - Total size of migration data from all components within a GT
> + * @gt: the &struct xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: total migration data size in bytes or a negative error code on failure.
> + */
> +ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
> +{
> +	ssize_t total = 0;
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +
> +	return total;
> +}
> +
>  /**
>   * xe_gt_sriov_pf_migration_ring_empty() - Check if a migration ring is empty
>   * @gt: the &struct xe_gt
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> index 1e4dc46413823..e5298d35d7d7e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> @@ -15,6 +15,8 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
>  int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
>  
> +ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
> +
>  bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_migration_ring_produce(struct xe_gt *gt, unsigned int vfid,
>  					  struct xe_sriov_pf_migration_data *data);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> index ce780719760a6..b06e893fe54cf 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> @@ -13,6 +13,7 @@
>  #include "xe_sriov_pf_control.h"
>  #include "xe_sriov_pf_debugfs.h"
>  #include "xe_sriov_pf_helpers.h"
> +#include "xe_sriov_pf_migration.h"
>  #include "xe_sriov_pf_migration_data.h"
>  #include "xe_sriov_pf_service.h"
>  #include "xe_sriov_printk.h"
> @@ -203,6 +204,38 @@ static const struct file_operations data_vf_fops = {
>  	.llseek		= default_llseek,
>  };
>  
> +static ssize_t size_read(struct file *file, char __user *ubuf, size_t count, loff_t *ppos)
> +{
> +	struct dentry *dent = file_dentry(file);
> +	struct dentry *vfdentry = dent->d_parent;
> +	struct dentry *migration_dentry = vfdentry->d_parent;
> +	unsigned int vfid = (uintptr_t)vfdentry->d_inode->i_private;
> +	struct xe_device *xe = migration_dentry->d_inode->i_private;
> +	char buf[21];
> +	ssize_t ret;
> +	int len;
> +
> +	xe_assert(xe, vfid);
> +	xe_sriov_pf_assert_vfid(xe, vfid);
> +
> +	xe_pm_runtime_get(xe);

You don't need a PM ref here as this is purely software (i.e, the
hardware is not touched).

Matt

> +	ret = xe_sriov_pf_migration_size(xe, vfid);
> +	xe_pm_runtime_put(xe);
> +	if (ret < 0)
> +		return ret;
> +
> +	len = scnprintf(buf, sizeof(buf), "%zd\n", ret);
> +
> +	return simple_read_from_buffer(ubuf, count, ppos, buf, len);
> +}
> +
> +static const struct file_operations size_vf_fops = {
> +	.owner		= THIS_MODULE,
> +	.open		= simple_open,
> +	.read		= size_read,
> +	.llseek		= default_llseek,
> +};
> +
>  static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
>  {
>  	debugfs_create_file("pause", 0200, vfdent, xe, &pause_vf_fops);
> @@ -212,6 +245,7 @@ static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
>  	debugfs_create_file("save", 0600, vfdent, xe, &save_vf_fops);
>  	debugfs_create_file("restore", 0600, vfdent, xe, &restore_vf_fops);
>  	debugfs_create_file("migration_data", 0600, vfdent, xe, &data_vf_fops);
> +	debugfs_create_file("migration_size", 0400, vfdent, xe, &size_vf_fops);
>  }
>  
>  static void pf_populate_with_tiles(struct xe_device *xe, struct dentry *dent, unsigned int vfid)
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> index a0cfac456ba0b..6b247581dec65 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> @@ -249,3 +249,33 @@ int xe_sriov_pf_migration_produce(struct xe_device *xe, unsigned int vfid,
>  
>  	return xe_gt_sriov_pf_migration_ring_produce(gt, vfid, data);
>  }
> +
> +/**
> + * xe_sriov_pf_migration_size() - Total size of migration data from all components within a device
> + * @xe: the &struct xe_device
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: total migration data size in bytes or a negative error code on failure.
> + */
> +ssize_t xe_sriov_pf_migration_size(struct xe_device *xe, unsigned int vfid)
> +{
> +	size_t size = 0;
> +	struct xe_gt *gt;
> +	ssize_t ret;
> +	u8 gt_id;
> +
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +
> +	for_each_gt(gt, xe, gt_id) {
> +		ret = xe_gt_sriov_pf_migration_size(gt, vfid);
> +		if (ret < 0) {
> +			size = ret;
> +			break;
> +		}
> +		size += ret;
> +	}
> +
> +	return size;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> index f2020ba19c2da..887ea3e9632bd 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> @@ -14,6 +14,7 @@ struct xe_device;
>  #ifdef CONFIG_PCI_IOV
>  int xe_sriov_pf_migration_init(struct xe_device *xe);
>  bool xe_sriov_pf_migration_supported(struct xe_device *xe);
> +ssize_t xe_sriov_pf_migration_size(struct xe_device *xe, unsigned int vfid);
>  struct xe_sriov_pf_migration_data *
>  xe_sriov_pf_migration_consume(struct xe_device *xe, unsigned int vfid);
>  int xe_sriov_pf_migration_produce(struct xe_device *xe, unsigned int vfid,
> -- 
> 2.50.1
> 
