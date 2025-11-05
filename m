Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E010FC364A8
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 16:20:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A2010E788;
	Wed,  5 Nov 2025 15:20:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ONJfL7Tl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B90CF10E768;
 Wed,  5 Nov 2025 15:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762356039; x=1793892039;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/9mE9jWkROC9ZMVzZ72gdbZqIizhHHbxJRL1tgl7+6c=;
 b=ONJfL7TlKDVw4TPx1dfSjB5CAD7/RgBlntIQxUs73chHIoPzZpMAaD9v
 nqTfa+Xjml1kU4xB0f3leZ1dq+AKBFzzoZJ07eWKt0zPVwpQuk8ewuVEj
 ZZql0NSQRzqLYlmWYnkVnnP/FIz6Vt3WOqqNyUWeq9wUV4oe4vaP9gs8Q
 /QBwYMd/7k8IMfzCK2+oscflXnN6z+ByVGlq0PsqR+aqEk/MrFoIAVa4M
 uBz58EzQPOLh9WSNsLqFbvXThwEnXoKnhCHWuoJ3j4BD38O5o+A/f0ZE7
 ze8vyECHYNbeXMUIgARdzwcXlW3yDawendkXsCqOF+s5dMqpXE9kssfAJ w==;
X-CSE-ConnectionGUID: CuvV+Bw3TFSEbOSaPpQ6Kg==
X-CSE-MsgGUID: NlCghabqQc+zXDYKoFbIsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="89934861"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="89934861"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:20:39 -0800
X-CSE-ConnectionGUID: l6VKLMXPT7WK+wPhiPOYqw==
X-CSE-MsgGUID: siTbIQGpSEa+YkKNXFVnUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="210959639"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:20:39 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:20:38 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 07:20:38 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.41) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:20:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V7ViTjvF/nHQpGca51Cn5rGz3yb0rxpabpW3iB+0MurDa3tQuirm+iI8zx7g0JtCfFsDXZMHhrKbsYC80xaZi5tkcGtFLoWSOGNulEeWelZnjx3Gr2t9+CggpOxeBUJF2S4X6aaXe4crvInDmF/jZAC2NUaZ+EG1A89DzyUoKXxKSYdBBzmrhocp4jLC6w96RrEkTKQxnw6UpBZvWCeB6oOLh0n8/AT4Q2P95fRMZb02KAtSfTL4N70/EBIbraMDZLvpzBsUmPAZEwb6kzFrBCRmdVurei6MaVeZl30TRlkUm3nZDSyh77GBySX/rI8Vhks7NXPsITsG95aTQ/gKpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xaHjIC+0arQdpAxtukGPqiy8pVWapDqFCpnPBBPNoNg=;
 b=SMT7Ry2rpKrtFavkGGu+09abxWmhkKGaR698O+2choCLIaMmttPN7avHanoy4NDEIec7KirO28lSYU3X33313dch12AHhKnBlB2kuDt9ZbeWtBX1t9tRHGMlx8n8mS2Q24oSoeckBaFM6IUPuehIwZtelzgO0+qoedVd0nKvSCnhBgvYibIiebxPvKU+BAoqBiKwl1E4RFIqrun6FC+Jf9JgpiJ+Bi0TvOjDRpqN84IlFUQWimlMTfYYIovD/x4JKowotvaGt4vgphOjZinmfESwZlk1+GwSO3o9GImkQ24cb56cSNXZUxTiblCUb4UvWpQecAJsmtktyeB8JeTaOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM3PPF7C7D8332C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 15:20:37 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 15:20:36 +0000
Date: Wed, 5 Nov 2025 16:20:33 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Alex Williamson
 <alex@shazbot.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Kevin Tian <kevin.tian@intel.com>,
 "Shameer Kolothum" <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, Michal
 Wajdeczko <michal.wajdeczko@intel.com>, <dri-devel@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Lukasz
 Laguna <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v3 27/28] drm/intel/pciids: Add match with VFIO override
Message-ID: <r5c2d7zcz2xemyo4mlwpzwhiix7vysznp335dqzhx3zumafrs4@62tmcvj4ccao>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
 <20251030203135.337696-28-michal.winiarski@intel.com>
 <cj3ohepcobrqmam5upr5nc6jbvb6wuhkv4akw2lm5g3rms7foo@4snkr5sui32w>
 <xewec63623hktutmcnmrvuuq4wsmd5nvih5ptm7ovdlcjcgii2@lruzhh5raltm>
 <3y2rsj2r27htdisspmulaoufy74w3rs7eramz4fezwcs6j5xuh@jzjrjasasryz>
 <20251104192714.GK1204670@ziepe.ca>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251104192714.GK1204670@ziepe.ca>
X-ClientProxiedBy: BE1P281CA0332.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7d::27) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM3PPF7C7D8332C:EE_
X-MS-Office365-Filtering-Correlation-Id: 697ec49b-cb50-4bec-f146-08de1c7edf02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajdmUVVrYm9kSEtScGxUWEhSUEl6cHN1SFZMS3pMenkzOElOOE9YZm8zTDND?=
 =?utf-8?B?dTB4RkRCRWhBbk9pSklIcGNabHUwQUZibStzeXJKbTVOeERBL2pFMEhINE1H?=
 =?utf-8?B?MThKdE9SdXBoTXI2ZVh0UjZnM3lpdmMwWjZPWWx3S0IwN2xhU0RGdEFyRGNt?=
 =?utf-8?B?VWtKTzdvNTZYYzNRSEJ0TnIreGRjS0tGWktnYXozdk83V3dUMTdNdVNoVVdr?=
 =?utf-8?B?S0lBQnZrT1hIQ09UckYzUzNWVkdQOWNJaG93U2NjeFhhcUUxdmpvSVRBV2wv?=
 =?utf-8?B?RXhLNEV3eEl3Z25VQmtPWmJ4TzRBR0RUQzg3ckFDaFNGVzRCbVVFQmx3TmpJ?=
 =?utf-8?B?QU83RHhFWlQ5MWdtNUoxK2MvSC9yS2QrbndpNHpieWE0c1JpT0pnVEg5OGQz?=
 =?utf-8?B?QnprQXhWZ2llVHJIZEx3NGdFTXJTa2pRZ0lRM3NqWlZ4c3E4SndQZ1lKM1Ji?=
 =?utf-8?B?UzdZVVd6MXorMkxVSzhENVFHcDBXL1BiNkh3QmhJdmhENXJtV3RCR3VjUTZE?=
 =?utf-8?B?NnZnMEtQZ3YwbWxaK2h2TWdWMk1kZ0hqb1I5SE0vaXcyakJ6d3FTY2JYMWdt?=
 =?utf-8?B?V0grYXpmOEd4Mk40djJXRWVJQldUM2FnUHZJczhZQVEvUVZiSGZmT08vQWph?=
 =?utf-8?B?WUlMNHFzZFVzUmFTZUNCdklOREVIc01scFAwSGNYVFphOXd6b3FBQ0JYalRr?=
 =?utf-8?B?ZjJTa3dtS04zV2llWXRqM1FKKzYxTVpFKzZwWEl3SVpNZldnQ2tkNGlHZ2lw?=
 =?utf-8?B?TVVWaWE3aGlZb250U0wzRWk5bG5yN3JUSXQ1YmVGRTFJWmNLRTBiWFY5VCtB?=
 =?utf-8?B?MFUyTUl6OEtuUllOdkR5UHFNbzZIanZRS0l0RitkVVBqVUJjSU1TaHE5U0tX?=
 =?utf-8?B?RXYzckZodmNrWCtpb3dGeEVWRDFBZDl1SWpNU3RiTXc5b3lOWVBtUDdqRXlC?=
 =?utf-8?B?MktNUVNGUS9RNFU0UzQrSTFRU2o1VXUxdTl4am9JOFBucE8relVqWWhWNk82?=
 =?utf-8?B?RHcvOEx3ZnZ3SU1wbG1Dc0syRmw3UXovZ29ZWXE2YU0renJxWFhwUThEODcy?=
 =?utf-8?B?NEJXbzN2Z3RzTlFYVjY5cFdoN05VYlhNcDVienB6UVRFaHVnY2I0Tm9HS2p6?=
 =?utf-8?B?MEk3clM1bDIyZDdmNWxhOWhJWFVsTzdtelJPRE5IOGNQa0FjdGF6QkdIbUov?=
 =?utf-8?B?UkZhTEFMdHZwbHRBTDEvT21lUG92bUgyM3hrM3Jjci9HM2hxN2NCZndoZkJ6?=
 =?utf-8?B?N2c4TVVrKzMxSTI2THdxWGgrUzdMQ21oY3JxQ243eTdRN1IwT29zWjJNaWMy?=
 =?utf-8?B?NTFJMGJkVFhPU3ppa1A1M3RIRUwwVXdwanE2NFlHNTZtSmRZVFF5MEFZbmJv?=
 =?utf-8?B?SVo2eXZERmRwS1dEYXpNcVRTaS9WOHcxZTdnRFEzZzk5aVBoSlNxM3ROVDNR?=
 =?utf-8?B?NklRdGtFaVVCNHRzMzlnUm1wd00zUU8yTXZIUXJoTnMyc2dlQVR2RGhhbnU3?=
 =?utf-8?B?bEpwVGVxZTZJckZJajIvOTYybU9yZkEveEo3eThSUkNYM0VOWGN1T24rM0E4?=
 =?utf-8?B?K3g3L05WMEhjdXF2eFNZeXFPdmpkcXZLT1k2Q254UTBQd1Q4Q0ZwblhtTXlX?=
 =?utf-8?B?enVleXllZHZzOC9XcUR3aE00aEo5K0NBQUxNRjhjMlJCcWpuQW9FY2tNR1Q3?=
 =?utf-8?B?T01PQzQvRWEraU81WGhMUGlhdWpHMk9KaTdJei95T3hEc1ZUeFRjcUtxUU5U?=
 =?utf-8?B?Mld1Ulk5Ymo2MDNsMmRQa3d4Q1VxMzB0SzlyM3ZTbjNKbWFZVlFhS2FvbEFY?=
 =?utf-8?B?c2RRQWxEY09ocFl2ZVFmakduZG9vTFg3aEZnZk5HMDNKMHhSWUNrV3ZWczN3?=
 =?utf-8?B?Ulp1M2R3NHFzait3djh4Tmp4ZkE3UWNsR3FuOGZyaHpjRzEyRXZLOW1WR0FF?=
 =?utf-8?Q?u6UAcK4IwShXb//fESsE32zLVFTcu5Bm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2lSR1FBeU9BZGZ5cTJqcTF3WU9jMjRaMXZ5RyszcHZ1WGQrck1qWDRPTjBU?=
 =?utf-8?B?R0orRm5rSXdYd0xxUVdVNVoxbnA3ZE15dXJUNzB0ZjlFMEFtREdOMnlac0k4?=
 =?utf-8?B?Z2w3cUhuTUJEeU94dE94UHM0TmJIZUoxYkoxTXJxTjBWTGNob0lOSEEyTnlk?=
 =?utf-8?B?V0pBdFZ2cVIyTVVUMXk2SFlURisybWJ1cHJsT1h1dmtwRTg5ZjQyRUdWVHNX?=
 =?utf-8?B?V2FuWjhYdmFYQWY1MlMwSnhRRmdlWklNNDVQNU10Q3orWFZzcFBVeDFMa1ZL?=
 =?utf-8?B?R1VVM0o5b3lvTnhJRGliajRybnYzWFo4anhxV3Q5Y1dDTFEzcWhRSGVQRnRt?=
 =?utf-8?B?MGVRVHYyb0ZsdmxLZDhZOHNrN2ZVMUQrQVg0MExhd05WWGE0aTZ0NkJsNjFv?=
 =?utf-8?B?Y0RWeWZJZXE2WlFFTjZ0OGFUUEtHMGxnT2JRNGpacGVyQ3BmMi9CMklyakpv?=
 =?utf-8?B?dnliK0JCSEp0a0cwMkxadEdNdVdTMTJrUHVuUUlVVXQxOCtSaVJvZTkrejNj?=
 =?utf-8?B?ZEcycC93ZVdha3RHRGo0c09qclM0NUZzanEwSnQyT1hHSmhBM01qNGJESTM2?=
 =?utf-8?B?OXN4WFBEdzFjOFhUSVlnZ3JRSkRRbUdyMVhzZzYwTHFRVGhDTnVPcTdNZVBD?=
 =?utf-8?B?a2RBNCtyK1dyTFN3R0Y2OVFMZEd5NHlxVklWOFhPTUtZUUFQTVhUTGh1SWlI?=
 =?utf-8?B?WjVuTzl5OE1OajBnOXVVMFdVY1hoNkRWbEJraHFrK1lvWC9qOSswa0w1TmJs?=
 =?utf-8?B?R0pXM1NBZzhNRWdoTk1kYnVwd3V5U1FoZlIzS1lxSTQ1ZGhFWXlvdmp1TlZm?=
 =?utf-8?B?MFNEU3pCMjZqNWJvVG0zYTlBTVFRaHdXRDBSUnF2Z3lCNFAvRzVrY3B3dG1t?=
 =?utf-8?B?SzFXSzkvQmt5Rkt5eGNaMWhQWkprQzB5MFQ3SitjZUU3U3A5NXVMdTFFaVNV?=
 =?utf-8?B?ZVdnbTZyTXJZUkQrZzlxSXVycitEU0pPVFZRVjA3ZTl6ZUs3T29ESUUzTm1u?=
 =?utf-8?B?YjJLUE9mVVozSHpid2dsejEwUTJDZkhDbGxwR2lRSUQ2MGxFamtNSTdkcm9X?=
 =?utf-8?B?Q1VqMHZuSjZsSUNtZTRzdjhWWTIyd1NwUFgvTWtTano3VGxZVEN5dEFKTDZ1?=
 =?utf-8?B?T3dKdkF0eFdGUU5YaHBFQmYrQTZMb0ZVS1F5MUxnaFVFMm9RUGZoN2QyZHVZ?=
 =?utf-8?B?elRGQjZkSGxVTWJaTjRicXFyRjZ4U3NDQmVqbElxVWdNSFYreWN0NjNlQXZP?=
 =?utf-8?B?MTRTVVBLRUJ1Q1BNM0pIRlFySlFQTXd5MU8zTW40SE5Td1Y3a21jSzM2cmhu?=
 =?utf-8?B?dWNDeDJoZ2hEUlpzYi9TZDI0Y2VqT01YTEtvblFGRzVDS3ltVEZaYTN6NG9Y?=
 =?utf-8?B?b0hkSFpwT0g3cFVKQ0JObnE1QzN3aUQ3T0VZbTZJS1EwbmozNXVXbmYyaWV2?=
 =?utf-8?B?Q2UvekZlZTJhaWwwTzFYVUVEdnY0ajNCeTdDeFdSOVlyd1RhcEpLdDRMMklr?=
 =?utf-8?B?SitjTmozd3FiTTd1T1Z2eXQ2M0o4OWV4dloxWXhHUnZ1cjlSc3Nzdk5sQlB1?=
 =?utf-8?B?V0l5STZRZElBNThRbjZUc29USVhMd2R2NjFLNEdVa1hRYVJTQmdtck5UMDds?=
 =?utf-8?B?b1RTOEZGcjMwZ3Z3d3JMQ2VDSml3ZC9nT1JQa21BMjhQRFhWLzRsZWtIWnBl?=
 =?utf-8?B?cWRoZC9MeEQzSFFEcEVCcTltS2d0RnpyemRNSHlCNVJiQW44b1BYTDB1SE0v?=
 =?utf-8?B?NEJoK1ZmSFRHVkQrK1AvSnlqa0pOenM3QkcyZUdZRHVqTFlOeDZsNThrRkJM?=
 =?utf-8?B?TEFQc3R6aVp4dmxndUZFMVQwOWdqQ2tFUnpYcW83cUp3RHVKRXRwSFZpN3Zo?=
 =?utf-8?B?M0p2WFRRVitmaXFUbmpteU1LdGlsTjRoTVVFQkFpOFpTeGZsVkJvZEt1SXc3?=
 =?utf-8?B?RlVJbnAzb21mTDdrRXdoSnNtRkhOVFVvcEhPRjA5OW5BOHJsZy9VemhUcjdB?=
 =?utf-8?B?QjRmV0wzaUh5aHUreG5MUXp0YTJXL1pEMHo5bzZVVVFZbVpPTXNNMVFVS1Yx?=
 =?utf-8?B?RW9oWENVT1Bwbkp0b0RIZEc4WEVjSTBQMHNKY0RLNGh1K1dqYy84VUY3Nms0?=
 =?utf-8?B?L1N1aUNmTkxFc1ZpUUwrOU5nbGZDU1lNQmxSQ2JGVjdKQ0Z2RVRDd0wzSngz?=
 =?utf-8?B?VFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 697ec49b-cb50-4bec-f146-08de1c7edf02
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:20:36.7993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2MW7+VHwvYtGKbjCMON/33AOg9EegPQZ6xA5cPmuKWgG9WnAo04O9Ka9Yi9VYcMLUYyM3mNSiTzGQYBkFFzU/EoMRf3U6aSqBnEZ348dQfw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF7C7D8332C
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

On Tue, Nov 04, 2025 at 03:27:14PM -0400, Jason Gunthorpe wrote:
> On Tue, Nov 04, 2025 at 11:41:53AM -0600, Lucas De Marchi wrote:
> 
> > > > > +#define INTEL_VGA_VFIO_DEVICE(_id, _info) { \
> > > > > +	PCI_DEVICE(PCI_VENDOR_ID_INTEL, (_id)), \
> > > > > +	.class = PCI_BASE_CLASS_DISPLAY << 16, .class_mask = 0xff << 16, \
> > > > > +	.driver_data = (kernel_ulong_t)(_info), \
> > > > > +	.override_only = PCI_ID_F_VFIO_DRIVER_OVERRIDE, \
> > > > 
> > > > why do we need this and can't use PCI_DRIVER_OVERRIDE_DEVICE_VFIO()
> > > > directly? Note that there are GPUs that wouldn't match the display class
> > > > above.
> > > > 
> > > > 	edb660ad79ff ("drm/intel/pciids: Add match on vendor/id only")
> > > > 	5e0de2dfbc1b ("drm/xe/cri: Add CRI platform definition")
> > > > 
> > > > Lucas De Marchi
> > > > 
> > > 
> > > I'll define it on xe-vfio-pci side and use
> > 
> > but no matter where it's defined, why do you need it to match on the
> > class? The vid/devid should be sufficient.
> 
> +1
> 
> Jason

I don't need to match on class.

With PCI_DRIVER_OVERRIDE_DEVICE_VFIO it just becomes:
#define INTEL_PCI_VFIO_DEVICE(_id) { \
	PCI_DRIVER_OVERRIDE_DEVICE_VFIO(PCI_VENDOR_ID_INTEL, (_id)) \
}

static const struct pci_device_id xe_vfio_pci_table[] = {
	INTEL_PTL_IDS(INTEL_PCI_VFIO_DEVICE),
	INTEL_WCL_IDS(INTEL_PCI_VFIO_DEVICE),
	INTEL_BMG_IDS(INTEL_PCI_VFIO_DEVICE),
	{}
};

So, no matching on class, but I still do need a helper macro.

Thanks,
-Michał
