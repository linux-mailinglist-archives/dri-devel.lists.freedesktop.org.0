Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOgQF/15emkC7AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 22:05:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD2EA8ECB
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 22:05:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D50810E777;
	Wed, 28 Jan 2026 21:04:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kz8NYpUy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDED710E77A;
 Wed, 28 Jan 2026 21:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769634296; x=1801170296;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=DSnsZRKLW4WESEVJcdc3MhAif668SLcCwFanley7LRo=;
 b=kz8NYpUyo+jCczKmnOYTOYKwKAXaKhylFzsvI33PAPeMhtStYvH9xJSg
 k8U3ZeqsIcOOLyhXVeLoFsjk2ix301ZsHPv0uYAWM27tyifAu0WDvY5jl
 2yPoKXjSTZI+CYDCTjdZo9v2VX4pGha730lxZt7cLDABflnU6V8jldsGa
 O0WIHt89VJr8Zt50TH5DnK5f9dfrLkZQTaMXzTBgrTSRyZosHmhdLF2Z9
 yftd3wPaAur2lz1g6zpEp6GMQQ1SJNEmWqiN3dCvJexQ91BXtIC+SfkOk
 w+5AG1JqH1abu4VtyaJ3IiDbewqanijdveulmyJhz0pKUs8n+CwiVzShc Q==;
X-CSE-ConnectionGUID: 79S+KV8RRZabKDxbPsvw0g==
X-CSE-MsgGUID: FRHxBvOVTfuqFTos4cEZmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70754736"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="70754736"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 13:04:56 -0800
X-CSE-ConnectionGUID: xjtnx234QM6+SbmwAEOVqw==
X-CSE-MsgGUID: X+cgeW9MT8qp8qCyeFLZMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="231314796"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 13:04:55 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 13:04:54 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 13:04:54 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.34) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 13:04:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bVVNYF+5DdhbfuvZP6PdW6R/iEjfpUUHgML1AFjbgg01VqUddYJuitC2QehTy6FJyMYJmPNx6EHrokH0bsP7I+whjzZMXnHLoeBXtVfy/wlzVNXMAwrnr/c1sVUoF7IZ2qa5F58dJCl5zdt/eysXLHRsVN0Zp2nKTtvmRXmGWN4pNxP38+QsZlQK1pWRrFARBJ2vN8AnF2YTOf1DhoKPUj3sRLkmfeqeFnbBuAG+aNwugOZONPxzphteuM6bQaMP0dgNR5MIVaHzpxfCGBgG7+ZytiN/JPpkNkcL329P04/rzv67JvLrxxkvBHUY/VzxLdFakz8klO/0wnKT5l4PkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TjoJVV4nqJ6prq3y/8Uv4bt+fNZHwmIi9SSUQ/A/cg0=;
 b=IPARWQqxJ1ZKkXRK05V8jUeB1W1DBZ+Wbdy3NU12CCEywgYCj370yHIq5bKnmnAScN/Dajwcn2CZKpGn+0TxfoEjnr8lC2w+mzXMjh+d3OBm8Qv7oxZSXIXTYjXTGpa9EIe7y9b/WeN30Rh6p4yMLqhvHRLlQBJGB3UJGKSyxL+PS90ISiXGqCr1ulY5SBuKzjzXYd+9bw/P/VfDMoK42YEEaYJ+WmyaLzObmq8fwvGx8fWeoRtJj+GFqngrXii51XzdlKuFPplRQ4wDjO2OHORkN5m0zdq8u0B3pBA5M066NNM0mA4cIdikrA1seC0HpUMK/wqwpti3o4b9UOz9pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5081.namprd11.prod.outlook.com (2603:10b6:806:118::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 21:04:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 21:04:51 +0000
Date: Wed, 28 Jan 2026 13:04:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
CC: Jason Gunthorpe <jgg@ziepe.ca>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <francois.dugast@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [RFC PATCH v3 04/11] drm/pagemap: Use dma-map IOVA alloc, link,
 and sync API for DRM pagemap
Message-ID: <aXp58fqfeeDD6YI+@lstrano-desk.jf.intel.com>
References: <20260128004841.2436896-1-matthew.brost@intel.com>
 <20260128004841.2436896-5-matthew.brost@intel.com>
 <20260128142853.GH40916@unreal>
 <aXpLhN08jVbltQC0@lstrano-desk.jf.intel.com>
 <20260128175531.GR1641016@ziepe.ca>
 <aXpjk5sAgOzE3OcR@lstrano-desk.jf.intel.com>
 <20260128194540.GA10992@unreal>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260128194540.GA10992@unreal>
X-ClientProxiedBy: MW4PR03CA0062.namprd03.prod.outlook.com
 (2603:10b6:303:b6::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5081:EE_
X-MS-Office365-Filtering-Correlation-Id: 260d49af-89ed-43b8-d7a0-08de5eb0e114
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M3pZRWFFYXowOG52aHRjYWl5Zm5jem9ScjRqbmFZNVdxRzM2OVB6Q2tCSVRO?=
 =?utf-8?B?VUIybGswWUFPWWNlVzdVbCt3WnB1NWhkK2RTMFUrOW13SThoSmt4TEd4Q0Zs?=
 =?utf-8?B?MUlHREN6R0psdGM2YzFKekpuQ0hIYWNMZnJtaEdxSTBIclVoVjlYZDBwWWgw?=
 =?utf-8?B?SDNLMlBjS2tWdmlVbjJuTFA1NUZYQ3FjSEV3UHpzaWNacGlWQ3BuNHZsREJW?=
 =?utf-8?B?R1FEN005OXROVXVvbW1QUWE0L0liVVdwNFhNR3QyRmh6bTFpSTc3RkFKMFVP?=
 =?utf-8?B?OGk1dHVtanBMU2VWeTJUTmxMNWE1VmhYa3ZpaFhHTEYvQnpxYTFBTUpVeEZY?=
 =?utf-8?B?Sys2V3dyVUNyajZNcjRvczB6QWVjRzIzTy9rUThGaFk3c3Q3SjV4eDhOSjQr?=
 =?utf-8?B?eXgzenJXVzZtUVpieVhQQVdFc0k0aEt5MDdwWW5vemRMVGtPa1EzZ2hQN2lL?=
 =?utf-8?B?YTRieTEvZkEzK2FmRXpHRFhDaG9nSVRHeHVDdXlZQ1dPWE15OFErbGtXL0F1?=
 =?utf-8?B?M2E3ek5aSlJYZzl5VGhZSEVuSE5XcGVKME9SVjBXb1Z4emVkSDhyMEdDRldQ?=
 =?utf-8?B?N1I3NUx5WHVwWEFFTC9ud0RkbEVycFZzYnIvRU5rMjZ1d0tsTVVvSTF0alFM?=
 =?utf-8?B?YTJWMktJNklVU2FleTdVdGtoUW9NcEJSK1ZrWit4Qm9sYlpqcXRoUytQSzNO?=
 =?utf-8?B?VitRTDRDeTd5MFlWdnNuVU1ZK1drMzlwVVhTbVUvRGJIOVFRSXNwU0tUK2FD?=
 =?utf-8?B?ZXNCSlZXL24rMkY4eHRneE9uZ1RabThqUDRRZ3lJZS84SVh5Q3hwVVRzNGxh?=
 =?utf-8?B?MjdpTERseFZoUnNGY2JkSW5jaGE3eExpaEovV2hiYi90VFJGa3JGTXBVTVdZ?=
 =?utf-8?B?a1ZnR2VVdGc4TW9ORjdWMWhCejJaOFkzYURUYXN1ZjQ1Y2Z3SEVsekJmUVpU?=
 =?utf-8?B?OGl4RHFNSUNIN3JlSVc2N2VHMUw4SnRibzRCRllOVmt6djRiNi90SGxXOStp?=
 =?utf-8?B?UVBCNGFnTXd0L2QvMUtseXMxd05LKzhMUlYzTFRXUmp6MlhhOGxaZ281TTRw?=
 =?utf-8?B?RzRwcVp1ZlB4cEE3L0RNeXA2WmtpbFpZRWI5OGtrVGM4RkpaUXY3Ym5OVzE4?=
 =?utf-8?B?QWcwY3laZzhkMWE2a2ExUFZsZEg2K1hzRTNmSXhlRHhXMWtMVU5SUWhyMEIv?=
 =?utf-8?B?VmRHTE5oR3pjbXZBdnpGS2RSNEEwTXBTS2luNkQzSWJCMCs2SUxXOGRxTXF2?=
 =?utf-8?B?NnFJbUFIejZCZ3dRUGdaNTJPd29XdUNhS2krOUowckJlSWs3THdjWFlsc21L?=
 =?utf-8?B?WkQxbElEYUdjN1pLTmY2YTBNUTEwZFd3SHRiY3VaMU5mbUI2MDh3TWM1ZUtx?=
 =?utf-8?B?NmtGZ09Hd0tVQXJJeFduWWNRV3RrbjlGT3lCVmQvUFBMNGxoNUtLSDU0TkJ2?=
 =?utf-8?B?TFo4cUJjc20wUmpNd2Uva0tjRVc3c0dENUpSTkY2N0U3bERXd3FUTCtlQUFL?=
 =?utf-8?B?RUdteE1nVHc1cEEzZCs0YTZWQnRMQVVXNjRhaDNQdkcwNjFXblh4RGppZDZ5?=
 =?utf-8?B?TnB5dDA0M2FKMGo3YTkyK214Y2dHcjBCK05rbTNoOGZoNm04TDdnUlVZbThB?=
 =?utf-8?B?bncxcERQWDFkZVdzajQwdDhRdHdxQ1BsL0JsWGR4VFBES0NROEhEMFp5dFhF?=
 =?utf-8?B?V0g0ZjUvT3UxajRWa1BtMW51TGJ3b3hMalV6di91OW5jaWpGQ21UNm84NXdV?=
 =?utf-8?B?V3hWbDJNdjcwbHZyenc2Wk5ZKzlhWDNUMDZ3TG50Y2VPdm94cHFoRXJ6T01X?=
 =?utf-8?B?Z0xkYjBPWENjMGtGYWR2VXJnWXlBaXdNSlVFVXdoTWw3TTFpOER5Wm1WTTZm?=
 =?utf-8?B?amU5NkFlVjh1Tk9CRkk5NW1qVUtteHdlenV5VG1kaWVFRnY2OFdRRkh6UnpO?=
 =?utf-8?B?dmJzNnNZZmdsNDZwekRSVWlZMjB5bGF4N2JLSkZYOVl1RzJ4Wllna0xEK3FU?=
 =?utf-8?B?QVEyUXhmNHpzK2Q5SXhjNG01ZGloTXFoa0ZWekFUdDJUbE8xTjMwMFBNbFgw?=
 =?utf-8?Q?HTB70L?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFVCcnBFNkYxenNLMmpTY0Vpd0Uwb1dIV2V4S0hPQ3REeE9MZXFoV2ozL25W?=
 =?utf-8?B?TEdnbFBBUXA5QTFWS2VaTXlENUVwbGRMclp3Szc3cmEwejRhenVVVE1PWGdl?=
 =?utf-8?B?RzcxaklPMlN1ZTZUM044OUdWRTJkS3I5a1ErL0J3Ym5VVDJpOC9KV2ExT0Ur?=
 =?utf-8?B?NVJrbHRlV1RpNmdpcnBKKzlpdUhPZHdZRm5DUVZnL3RHVlNoZGZaZFRFU3Yr?=
 =?utf-8?B?MEhCSW1pT2JadnplWkdLdlBPMVF4eEQ1cldXbzRnYVBOMzJQbEJjQmxtcVQv?=
 =?utf-8?B?UXlGeXdmV2FDL0doL0RmbWlJUE9HSXgwa2crdDNmMnlWblRTbFJVcjVCS3Fh?=
 =?utf-8?B?ZzBCbU5OOFdRYXhyZmEwVVliT1NCcENlOFN5Z1RPZm0wZ3hVeklVRElWcVVY?=
 =?utf-8?B?NEJXK1BEQjllL1VXY1V1Sy94dWxUWnBFYTBQc1QxOVlnVWhSNm5abCt0d3hz?=
 =?utf-8?B?NGpqZ3ZMUjFlek1lWjNMYmUvK3BmUFlZbGRvbEJLRDFoclBJdm1XR3NHejRC?=
 =?utf-8?B?QmxrcnVVeFJLdlNVWVBiV2dUMEZsclNwcCtqOWF0MjR4dmZTTUYyUjhCWlE3?=
 =?utf-8?B?Q252WUJqQ1NOYmhjdE5RK0owWGpSVElGVEt6UzhkWHpFWGFNM2hBN09jN2ZV?=
 =?utf-8?B?QkhIb1NLTGpFdjFCSWtYTWNBdG5NaDA1KzRCZUZjd1dZVzlaMzU1ektMYlNC?=
 =?utf-8?B?REV3YmxFYnlWMVNvZ1E2ajIyZENCcFlWYlYxaU90ZlJ0VHpLZDBLSmJwNXBi?=
 =?utf-8?B?QngrYjFGdDNKT0YxY2oxTCtqWFp0UVYxelNaUjBKQzRNWDlqTERJUDlVMDls?=
 =?utf-8?B?ZDhtclczU1MzUFhWYzhpdVBnYmNYTXNSWTR3NXV6TlRCMHVLQmJiUmYxN1Rh?=
 =?utf-8?B?bXl2RFRGaW9wVnhwcEc2cCtFQU5wemxmU1NhTUN0eXQzVWJ0a0k4VUJSRVRz?=
 =?utf-8?B?RVNpblhKN0c1N0VlYkJ1eUlXL2pLQTh3QUV6WGhUU0tMY2l6NDlRQ3hkZXRH?=
 =?utf-8?B?YlpHd3pGWG1IbXpYSThiSU05K1lTTjByTnZERnMwMG9RRWVhSkJNNUlES25n?=
 =?utf-8?B?Y1pPUVlKbWtUbVRHcWZ4VmFzMGR3S0ZlMlBwWUR2VWxjN3dpdTJ6cHF4WlM4?=
 =?utf-8?B?eVRVemJXNUhFUTlpSjVxMjIrNDZ1Tk95V0RIZUlxam5vaXUyMkFXRWJhb1p4?=
 =?utf-8?B?NnAxSEdoWDJCZWM5NS9CZlBLRjhCL2l3MnN3eG1jSWpLZEdvdHFiY0J0cVVr?=
 =?utf-8?B?dUZpcUtHUjBQVGFtRE1JWm56ajIvaXNWS0tlbGNCNzloOE1FQnhsWnJmSzFk?=
 =?utf-8?B?d1JYS2VGRVFFbFUzR2RiZnpZdkw3MVQzdFExZ2hNcFVhRlFLOSt0QVdJbVZq?=
 =?utf-8?B?VVJoam1XcnhCYkZxVHdNRmVuYlRCc2R5THZUaHFDOWc0MHNYWFl6bFg3UEpp?=
 =?utf-8?B?WWdnSnQvQlEzU05XR3ZxZ3NWOE1NbU5OLzBTdGtuRXZrNTNSejVYVHBIckNQ?=
 =?utf-8?B?a29POGFWS2M0aDJYamdMb1hRdWwzRVZpb1NCUDhJWGhncTcvM0I0RytUUEF1?=
 =?utf-8?B?ckJuVTEvdnFkc0d2L29JdTZ6cGxJRUZGZ3BuMVlXOWVxMUttY1VaUldiR2VD?=
 =?utf-8?B?STRiRXVERjd6YmkxOGNWYm9sQjZxeS95K1czRUxId1Z6VHFUNGJocVVmM2I5?=
 =?utf-8?B?bjMzeFFzRWZBS2F3clhjRmYvNWdyWXFWS21ZVzR0VldHUy9hV3VETWpFL2gw?=
 =?utf-8?B?eks3ZTQxc3dWY0p3b1JYMTh6a0dYV2dBSW1OR2c1d2FHRkxSSzR5SWRLWFB6?=
 =?utf-8?B?emJzbHJTTklGd0xGT3NhRE84RnNNMHVCMUtVTHUwbFZzNzV5aW1BVGpUZllh?=
 =?utf-8?B?Vm16WEFHWU8wRnhEL090dU01RC9XeFVvclE5MllYVnhtR2kvMys2ZWFNL0J4?=
 =?utf-8?B?Q3lhSG1HaTFIUEtucXFGdFZIUkpKM1BuNURubHpKdzl0VzdTTWdnLzEvRUQz?=
 =?utf-8?B?ZytKdFM2NCswU2dudld3WUQyNlA5cXJtekEzdUlodm8xZDh3Y0NXQmRsY1d5?=
 =?utf-8?B?Nmd1MU4yaGZPb2pEb2xkdXl1cE0vRmIzNmYvTXdvdXNCZHd2YytwYnowZ0tr?=
 =?utf-8?B?d3VmazdzSGloVFJoTWZyWTR1bksvM0thbU53NHBWQkJPcld0Qjl4MytnNkdS?=
 =?utf-8?B?enk2VG9KQ3htRG1yZm5qNzRIRU5wdXBFcTFpelZmY2RjWVVQYUhnb29GN0VM?=
 =?utf-8?B?VXpmZlBmRldrZHR3VWN5eVR6cTdpck12NndRT0FQZEtkbHE1cjd4YXBWSlZi?=
 =?utf-8?B?ME5XN243ajV6M2s0aDlELzFaYmpDdGJxZHBzMSt2RXcvYUFaZWxNT0tsOXly?=
 =?utf-8?Q?NSdQIFHdjXpTtbHA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 260d49af-89ed-43b8-d7a0-08de5eb0e114
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 21:04:51.8074 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OwtaU+rfYK9Hk1gIiGXLSLRTDtmoLVj0YJaGbzln929nmdcsx/L3DNDbxclYbPVZyLrI5Tpjpczh4dvLW8o1GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5081
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bootlin.com:url,intel.com:dkim,lstrano-desk.jf.intel.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: BAD2EA8ECB
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 09:45:40PM +0200, Leon Romanovsky wrote:
> On Wed, Jan 28, 2026 at 11:29:23AM -0800, Matthew Brost wrote:
> > On Wed, Jan 28, 2026 at 01:55:31PM -0400, Jason Gunthorpe wrote:
> > > On Wed, Jan 28, 2026 at 09:46:44AM -0800, Matthew Brost wrote:
> > > 
> > > > It is intended to fill holes. The input pages come from the
> > > > migrate_vma_* functions, which can return a sparsely populated array of
> > > > pages for a region (e.g., it scans a 2M range but only finds several of
> > > > the 512 pages eligible for migration). As a result, if (!page) is true
> > > > for many entries.
> > > 
> > > This is migration?? So something is DMA'ing from A -> B - why put
> > > holes in the first place? Can you tightly pack the pages in the IOVA?
> > > 
> > 
> > This could probably could be made to work. I think it would be an
> > initial pass to figure out the IOVA size then tightly pack.
> > 
> > Let me look at this. Probably better too as installing dummy pages is a
> > non-zero cost as I assume dma_iova_link is a radix tree walk.
> > 
> > > If there is no iommu then the addresses are scattered all over anyhow
> > > so it can't be relying on some dma_addr_t relationship?
> > 
> > Scattered dma-addresses is already handled in the copy code, likewise
> > holes so non-issue.
> > 
> > > 
> > > You don't have to fully populate the allocated iova, you can link from
> > > A-B and then unlink from A-B even if B is less than the total size
> > > requested.
> > > 
> > > The hmm users have the holes because hmm is dynamically
> > > adding/removing pages as it runs and it can't do anything to pack the
> > > mapping.
> > > 
> > > > > IOVA space? If so, what necessitates those holes? You can have less mapped
> > > > > than IOVA and dma_iova_*() API can handle it.
> > > > 
> > > > I was actually going to ask you about this, so I’m glad you brought it
> > > > up here. Again, this is a hack to avoid holes — the holes are never
> > > > touched by our copy function, but rather skipped, so we just jam in a
> > > > dummy address so the entire IOVA range has valid IOMMU pages.
> > > 
> > > I would say what you are doing is trying to optimize unmap by
> > 
> > Yes and make the code simplish.
> > 
> > > unmapping everything in one shot instead of just the mapped areas, and
> > > the WARN_ON is telling you that it isn't allowed to unmap across a
> > > hole.
> > > 
> > > > at the moment I’m not sure whether this warning affects actual
> > > > functionality or if we could just delete it. 
> > > 
> > > It means the iommu page table stopped unmapping when it hit a hole and
> > > there is a bunch of left over maps in the page table that shouldn't be
> > > there. So yes, it is serious and cannot be deleted.
> > >
> > 
> > Cool, this explains the warning.
> >  
> > > This is a possible option to teach things to detect the holes and
> > > ignore them..
> > 
> > Another option — and IMO probably the best one — as it makes potential
> > usages with holes the simplest at the driver level. Let me look at this
> > too.
> 
> It would be ideal if we could code a more general solution. In HMM we
> release pages one by one, and it would be preferable to have a single-shot
> unmap routine instead. In similar to NVMe which release all IOVA space
> with one call to dma_iova_destroy().
> 
> HMM chain:
> 
> ib_umem_odp_unmap_dma_pages()
>  -> for (...)
>    -> hmm_dma_unmap_pfn()
> 
> After giving more thought to my earlier suggestion to use
> hmm_pfn_to_phys(), I began to wonder why did not you use the
> hmm_dma_*() API instead?
> 

That is ill-suited for high-speed fabrics, but so is our existing
implementation — we’re just in slightly better shape (?). It also seems
ill-suited [1][2][3] for variable page sizes (which are possible with
our API), as well as the way we currently program device PTEs in our
driver. We also receive PFNs from the migrate_vma_* layer, which must
also be mapped.

I also believe the hmm_dma_* code predates the DRM code being merged, or
was merged around the same time.

We could work to unify the HMM helpers and make them usable, but that
won’t happen overnight. The HMM layer needs quite a bit of work to
useable, and then we’d have to propagate everything upward through
DRM/Xe and any new users. Let me play around with this though a bit
though to get rough idea what would need to be done here.

[1] https://elixir.bootlin.com/linux/v6.18.6/source/drivers/infiniband/core/umem_odp.c#L255
[2] https://elixir.bootlin.com/linux/v6.18.6/source/drivers/infiniband/core/umem_odp.c#L193
[3] https://elixir.bootlin.com/linux/v6.18.6/source/drivers/infiniband/core/umem_odp.c#L104 

Also this is some odd stuff going... Why sync after every mapping [4].
Blindly doing BIDIRECTIONAL [5]... 

[4] https://elixir.bootlin.com/linux/v6.18.6/source/mm/hmm.c#L826
[5] https://elixir.bootlin.com/linux/v6.18.6/source/mm/hmm.c#L821

> > 
> > Do you think we need flag somewhere for 'ignore holes' or can I just
> > blindly skip them?
> 
> Better if we will have something like dma_iova_with_holes_destroy()
> function call to make sure that we don't hurt performance of existing
> dma_iova_destroy() users.
>

Yes, I think this is the best route for the time being. Let me look at
this.

Matt

> Thanks
> 
> > 
> > Matt
> > 
> > > 
> > > Jason
