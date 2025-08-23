Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8FCB32867
	for <lists+dri-devel@lfdr.de>; Sat, 23 Aug 2025 13:56:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2CF10E1D2;
	Sat, 23 Aug 2025 11:56:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BN+P3sxR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6248110E0CB;
 Sat, 23 Aug 2025 11:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755950205; x=1787486205;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qaNXuQb0NiMMZXnVUqWekKKrER9mZmZHcTfu17FS0LM=;
 b=BN+P3sxRzYy/2NeE13wjrZqAi/wYcwppOeAMR2SsxtJ7uwmzYQlio8mb
 vLWmIjHckRgres+qiQwylaPJZH6zHNRwir2B0STr+TX3tRNV/e3JS5PWp
 j0P61BJt12rv5yhvcDORD1YPOQNSGdD1UqvRkUUDFBzmlwohMOkk+RKOE
 7hTnBc1HvBDemiapoZ6Zy4nOaxtedVzOe8Cnc9G5SGu8yT8KBw3f0QxQp
 hod2s52mPRlm86Cx0kRJs1L9Ctbnt15uy2n4IK91MHJtXaqxvSfan2hDz
 EKXDUdfpEoTDRy5MsTxQX+Xb2VYJgZoYLC4wbUPdvY+eqeJuRxlHJ2MvE w==;
X-CSE-ConnectionGUID: 5N86ZYZxSputkI+u3gqYMg==
X-CSE-MsgGUID: taC5doIjT1OleNp+cRcmvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58383733"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58383733"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2025 04:56:43 -0700
X-CSE-ConnectionGUID: pmzHQJmOTEmtiXlnGlXpKg==
X-CSE-MsgGUID: lRzSkJ+0SdWPfEhcloMNtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="168502172"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2025 04:56:38 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sat, 23 Aug 2025 04:56:37 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sat, 23 Aug 2025 04:56:37 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.41)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sat, 23 Aug 2025 04:56:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e7T7og/v/GKH0Gv7DN1un5tGn53fUKM+cAaRbg5Piwhu5VR/p/irXVWQog4+p6slepgjbqKqrTTcWvEDnaAevFx/6UHPTxs0tPby9bAtnVBt//XoSB5I+vB+ZrLU+FbhCELlUB3eWTpzc16h8cWctnXKfUYXhJrPjtmXbISZmRF5Bb00GkIuNE25PFh4pOraXOvi3iRXXg29F1gWUj6Rg4gIFyLtlhSWuUNfYE8n2iPS52IvMnBjdLzIJ0v0EAXEtXQJ1ZMveQxzxmb0mveG+PtBJsjlcdzXS25kVHE8I1AOdMol7j2si2uM6snWOTdgIKCdbvAMhzeW5e1PQTjxug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KedQAsjCoKGsAtGUB/g660lM9o3tiO5zlhCpqHzEzX0=;
 b=o6N49clPprezCKk2ISH1Q1/PIpTU1b3jCc1u451VVTvFj1eDtBh1Kg14fsorbV5QQrhbRcv+gSVNd40zRGu6aNIBo43wVaAiV3lzUu1usR7uQ4xPuk14neJtnAVtk7ppxCz8Ft/DPXBidPVw2+dCJiM+vMy5hRHqPGmiLAu9XcLK3Y9vJl2X+vmBuovd3x+rROmKH6oym5U8avrkh49vNXSS67Zwplt1wCtpnwFUd/V3pm0edvYQEg8Ge3rxX/KTG2n9GTpvftz9yPv+hj44u5P5l+TL6CUQ0eBwpys4IeY4tCT2oE8eZDRmBiTY9RQsztvmRaDqOfqBk/zousMpHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4690.namprd11.prod.outlook.com (2603:10b6:5:2ae::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Sat, 23 Aug
 2025 11:56:34 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9052.019; Sat, 23 Aug 2025
 11:56:33 +0000
Date: Sat, 23 Aug 2025 06:56:30 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Carlos Llamas <cmllamas@google.com>
CC: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matt Atwood <matthew.s.atwood@intel.com>,
 <kernel-team@android.com>, <linux-kernel@vger.kernel.org>, Tiffany Yang
 <ynaffit@google.com>, "open list:INTEL DRM XE DRIVER (Lunar Lake and newer)"
 <intel-xe@lists.freedesktop.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe: switch to local __basename() helper
Message-ID: <w4j3kzezrd4xqc4q4vkpbbxqvqxitam5htkex6rj6dguj5kbw5@27gqnp6veuu4>
References: <v5j6nxynzvvlcxu3m3mkeyjv5dlozzp7ixkgc6u6hdzh7en6jh@zvzqm5n7njfd>
 <20250821220054.3700783-1-cmllamas@google.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250821220054.3700783-1-cmllamas@google.com>
X-ClientProxiedBy: SJ0P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4690:EE_
X-MS-Office365-Filtering-Correlation-Id: ee789fa2-7f33-4c62-3e22-08dde23c1ae2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVZmSGg1bUJnWkIvWElFdExwVmZwYVcyUDNrT0Q3M2prL052ckJReTVFTVRK?=
 =?utf-8?B?UEpJVnFXZE15ZmhCRnp2OTBlb0xIb1VMM2JhcXE3UWI4NGNIckJLN2FWWjI5?=
 =?utf-8?B?N3RGQTFnT2crby9aL05qK1dMS0pRcFVLSUVtMEdzTU5CM3E4eWdTU0RRVC9E?=
 =?utf-8?B?L3pkam1OQkU4blRERG1YMWZWR2lqRUYxd2w0MGExSlZ5L0tjWDd5QlRveHdS?=
 =?utf-8?B?a29MdW5ZNWF6MmdscjBvRmdWVUl1Mk1raXBTbHRUYnNQaXhTekV4V0lhU3Fq?=
 =?utf-8?B?N0kyNUlhN2tVVDVJbHlKRkM2VkREOU1pRG5XelNlN0c0YkRtRG9Ha3E4eS9x?=
 =?utf-8?B?cFBWQ09oSTR0N3NDZjdDQ0F2cDF5elRWYzR6ZjFEcTROdXpBUXBxUjlZYVYv?=
 =?utf-8?B?OVpQeEs5OTFMMmRITm1TT2UxUXovejcrQkI1WEtIN0tjaFJjdDBKU1BHSm9q?=
 =?utf-8?B?MUIxSmFTaEVtcnZpZWF1eGpxam1iYVg1VkwycSt5YkxhL3NkQ1Z2c1ZvVlhB?=
 =?utf-8?B?MzZaR1hIR2k2bUhwNkpLeG96bUR5NHRoRHJtZGQvYjhUM0NTeWxzR3pabTJ3?=
 =?utf-8?B?S2tXbmhQcjl2aWxiNkFDRlNvT0Myc0FENCsvOXJQNFE1WWZXQXcwVXJ0bHI3?=
 =?utf-8?B?ajNaTmVsaDU2bE1mVzVPcjA2NE1nQXF0dG5rbldwVFVwWDVLNjVJb2RTMEZl?=
 =?utf-8?B?cXFEQzhnbUJQdTgwbExjNmxremtMK1k1SVNFVkZ1bWVIV3prdWd5L0VJeXE5?=
 =?utf-8?B?N0MvUjhSMVREV09Yd0dRWk8rcTRuVXRnaXk3cXJNS29kdmFwMTdoUVBvMllL?=
 =?utf-8?B?V3A4V05qVVg3WENUZXltb1BQR3ZoQjVhNkYrYXNWSUtYK3Q3ajBGRElDdXFz?=
 =?utf-8?B?bndIcVZteklkbklCanVTckc3dmtvTzMyVGlDNjZ5OGxIL29WV25IS0pMME1t?=
 =?utf-8?B?ZmVUb2R6S1c3cU9CVUhxUUpZVU5hcGNwWWordG5BenRwN3lNeE82aEVDRDFl?=
 =?utf-8?B?UVYxNythekZzY0x2T3M1MlQ2dE9kWDFzSVFrOFBHL0NybDV3L3E4ODRrVVJL?=
 =?utf-8?B?bWZoTksweDlQLzVwMmdGaFIxMU5XdThudjM3K0QxSVVFVktLZXhVT3libERG?=
 =?utf-8?B?L2h2SGtJaXhxVHRhR0FUcUZmR2Y2NjFTM2pDSnRTb0VSdjFHUjdlb1JjSkRB?=
 =?utf-8?B?QVk4dFpMTkdVaEVycExYYWJwbDI5K0VpQlBldVpXQ1lHUDFkRzVLYVNXd3Yv?=
 =?utf-8?B?Qlc0Mms5MWd2S3lPOHpmYkpyMmZsN0VyT0ZGUE1KTUV5bE9ONnpjcStMM093?=
 =?utf-8?B?RlNnZEY3N2FHT1lENW5Mc3RkZ05mSWd5bWs0WDhqdWtkdW8rOHBSVW1GeE42?=
 =?utf-8?B?cnM1STRlWjFZakVFNStCbzNpc01lSEREZmRvQUJQL1ZxUkdIb250SHJSRXVx?=
 =?utf-8?B?UC9FeE9rV2lxVm43bnNNUms1RXd4RmJuYm5oSThHRlEyRWFTWDZQSXcrTjBx?=
 =?utf-8?B?cGJkUmk0dEljQjVoM3poL3ZmUmt1TFZQTTVEQjl0TUtsRmMxbXN4NC9lNUJM?=
 =?utf-8?B?aWVieU5MMEdMREthVmdXdUxkYTBFeUNCRUVKS1NJU3crVVRpNUFNTTZuSjFt?=
 =?utf-8?B?WlpQaUtPMmQ3ZkgwdkJlM3ZJK0hZWWowa2VWcTRzNWRDcHVUeDMrQlZyQjFV?=
 =?utf-8?B?VmJkYnpuanEvVVBWOFBReFE5eUJOcUlvcXJpbjBISmFDUXdpT2p3R1lKbnJ1?=
 =?utf-8?B?OUdQY2VjN3JYSjhvYXJsV20vcDE3Q0dZMU9qcC9EK29vOFo4eEY4UTVKMDYx?=
 =?utf-8?B?c1VHUXkyak9rSEFCSE9pZmZEV3Y5K1NNUHd0VTdla2JOV3FFYW0wYUNjVGJp?=
 =?utf-8?B?NW9TN1F1QndHWTBqM1FMTFVKTnZRN3FEYkkwcG40dUU2MW9zMWVVNGtFSDg5?=
 =?utf-8?Q?/XJ6PkjZq9Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlFwdEZqUTIwR3dMUFhPMmxLeEZkTFdYV25BT0VrNWVVeHEySUF3bkhRWlF0?=
 =?utf-8?B?cndvUFNTU1pHMytaWnpld0JhZHVZc1hBZ2ZHMWwyYXY4UmpNWlR4S3ZLTndQ?=
 =?utf-8?B?OU53TGhuQjJhR0U1L3pHbVpFTmtZNmZXYUJ1bDFXVStyY1dWdHhUc0hTYllY?=
 =?utf-8?B?SlZKRDZHTzFYdmcvUUc0SVE1Q1BRcWcwOEw0TGhKQ3Y5TTE4QytnSEloZENw?=
 =?utf-8?B?dyt0SjFLeFB6bDZMQXJwbjdJVENpcXpQT095M3JtaXFJcDJsUVMwUDJBWmg5?=
 =?utf-8?B?eEVBZWExOTJMak9GMThvNVBMdXZlK2hES0xBNUpjQmVxODUyNVF5VHBhTUoy?=
 =?utf-8?B?a092Q1RUczdQNm83QjFDL0JWNGtEcjZEOTJwZ0FrZ1lhVWxmTm56b0JmVkVo?=
 =?utf-8?B?bDc5bkFPcThBbGlwVmlmV0V2M0kySUtoNWgwVUx0Sjl3YlRJOHBTVWR0a0NE?=
 =?utf-8?B?dk9wOEhhRVpURDhoaFRGWTdoYnFiK0Rua3hYYnlXRm13WS9RVnVtZ2xRNXZz?=
 =?utf-8?B?M1l2UVhPL0xOemRjQ3k3Y0paTWJXdXpnc2ljZjhzeDI4SzhyazdLZHh6bVZl?=
 =?utf-8?B?Wmt4Tzg2TW5XRW9lRlZtR09CdEJ6SU1YWlFHVytFYUdPR29IUnJsL2k1d3c4?=
 =?utf-8?B?S2l3Y0pZdFR5cEh2L3N2ajl2U1BzRkRtWkJJSXErWWdQMUtwWE52ZGRjblJU?=
 =?utf-8?B?NlFhSEJJVjVOdkFFd0gvdUh2RmFHQ1kwa0NnQkF6K3NRTGQ0TGhoWVJZUHU3?=
 =?utf-8?B?Z0xxSlI2OUQraHpaS1JMbFlmd21KTDhIUjNKUnVWMkhGU0p5L2xHSUNyUWZ2?=
 =?utf-8?B?UVgyT284dTVtTmhtbEY0S0VsbUFUNTJtT3g0MlVNYmo1djBGQ0FGNU9oUFZS?=
 =?utf-8?B?aGlPSFJUbEdobmhja0RaZFNYN0VNdmovcU5oK0ZndXphSU5NK1JKenJQdWRr?=
 =?utf-8?B?eHlwbUNpWTdOaVQrNmhPS3lQQ2kyYkpPTms0dndpZ0xBSTFNMGZZUlgxYjU3?=
 =?utf-8?B?ZlNsbGdnbzZsWVdBME5JVjFzRmRRbVp1T09xMW16OVE1b2QvVit1VXhPVVJ5?=
 =?utf-8?B?bE5WQXdJc2FPTTIxaXU1d1NHcDY0WUd3ZCtoK1l5NVlKRVN1VytEMkRWWVhL?=
 =?utf-8?B?azd6clloem1aUmJCMmdFUnhLYnUrc3drbFo1Vkw2ak1pKzBJdHFUYldJNWEx?=
 =?utf-8?B?Z0VjUzg5cEFEMXFaRHRUTUt0V3FmZHVQL0YwblhVVVl0NG9YcW5Xb3NmUHkv?=
 =?utf-8?B?RE1hT01XTUdXMWlaUEVoQzl5RmpyYVFMSGdlWmd3VFdhWUZQc0FITzJhQlRS?=
 =?utf-8?B?ZkdtNW1Jby84b000UHdBY1hpUTRodjJWSWJjZ0QvaVhCWlE0dDB3V2JDS21o?=
 =?utf-8?B?UDVmZDV3RmtZNTMyZzFWbnF4aEpOcWREQ2RxZk9ZKytGQVRMV1M1SEMvUEg3?=
 =?utf-8?B?Q0JuVW5SMTVlTlZoYWs2eHZHOGszaVZ6SlRVZ3dBTW4wUWN5QSs1YTlWZFB0?=
 =?utf-8?B?WG8vdW9INkNoY2cyWWo3RHRiVVpUWXh3d3FsVjR2SW5QVU1lcFN2V1lxZE81?=
 =?utf-8?B?NUpDQlh5QXNJUkYxVk83ajNkQkIxR291azd3enczd3JFckp0ZnZHOW5FSHhx?=
 =?utf-8?B?UWtVdm9GNGNlb2gwNjhoOCs0RDh1TzFVOEt1WTBwQlAwY1JVOE1ZOEJMeWU3?=
 =?utf-8?B?cTVleDhxcVhwMURDb09LWXVsY0RSTmxwaFNlWW1pTW5RV2RwR0VSNTRaTUhz?=
 =?utf-8?B?eFpBektXNEZlVHViWVVyZ041eGVSQ2o1aTVHR1A0RVhvUW5oczd6N2xMQ09t?=
 =?utf-8?B?WHpTdkxrT3B0YUFQTXFGT3VFK2RZVlExVnJOTDZCSU9RdGw0clRxQzd1QkQ3?=
 =?utf-8?B?eGgrZDcySUwrcENYVFhHVHZNUnNtRmtBZFNIb1Roc3FNbkRESzVuL2tJUitJ?=
 =?utf-8?B?ekVEdTlIQUdPY3V5MVR5UGFEV1hjV0FQWGJvdUNKeFBXWjZaVE92NnJORU9X?=
 =?utf-8?B?TU81NjVaNUhoUmdnNDFHZjZDcE05KzBqdkFiSGtaQ1l0aGd0SGtrcmZxOW1O?=
 =?utf-8?B?NEJ2Yy9YR2lMSlRleStCVmlVbTRwbHF5ZnorenR2a2pja3d0RjR5eGxSbFds?=
 =?utf-8?B?RllGVk9sdXBuTzlYWmNVd3dES2I4ckdmQWlOdUEvRXJwSHZGMEQxVUIyRXJo?=
 =?utf-8?B?R3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee789fa2-7f33-4c62-3e22-08dde23c1ae2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2025 11:56:33.5494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WZVCSTQ+rQ6RXfMjRcpeLKhttngXytPEWHowZNJsmJ7Tl+nOgxLCHKN4Z95mCRv2fLeXDTGIIaVk9B9OMJ5WUbVc8/FZozfUu+vdOIkXcdA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4690
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

On Thu, Aug 21, 2025 at 10:00:53PM +0000, Carlos Llamas wrote:
>Commit b0a2ee5567ab ("drm/xe: prepare xe_gen_wa_oob to be multi-use")
>introduced a call to basename(). The GNU version of this function is not
>portable and fails to build with alternative libc implementations like
>musl or bionic. This causes the following build error:
>
>  drivers/gpu/drm/xe/xe_gen_wa_oob.c:130:12: error: assignment to ‘const char *’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
>    130 |         fn = basename(fn);
>        |            ^
>
>While a POSIX version of basename() could be used, it would require a
>separate header plus the behavior differs from GNU version in that it
>might modify its argument. Not great.
>
>Instead, implement a local __basename() helper based on strrchr() that

double underscore is reserved for libc in userspace
(https://www.gnu.org/software/libc/manual/html_node/Reserved-Names.html):

	(...) all identifiers regardless of use that begin with either two
	underscores or an underscore followed by a capital letter are reserved
	names. This is so that the library and header files can define
	functions, variables, and macros for internal purposes without risk of
	conflict with names in user programs.

>provides the same functionality and avoids portability issues.

Unfortunately with that name it could created other portability issues.

Lucas De Marchi

>
>Fixes: b0a2ee5567ab ("drm/xe: prepare xe_gen_wa_oob to be multi-use")
>Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Reviewed-by: Tiffany Yang <ynaffit@google.com>
>Signed-off-by: Carlos Llamas <cmllamas@google.com>
>---
>v2:
> - Wrap changes in a helper function per Luca's feedback.
> - Fix typo in commit log: s/avoid/avoids/ per Tiffany.
> - Update commit log.
> - Collect tags.
>
>v1:
>https://lore.kernel.org/all/20250820201612.2549797-1-cmllamas@google.com/
>
> drivers/gpu/drm/xe/xe_gen_wa_oob.c | 10 +++++++++-
> 1 file changed, 9 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
>index 6581cb0f0e59..c18faccdeb90 100644
>--- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
>+++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
>@@ -123,11 +123,19 @@ static int parse(FILE *input, FILE *csource, FILE *cheader, char *prefix)
> 	return 0;
> }
>
>+/* Avoid GNU vs POSIX basename() discrepancy, just use our own */
>+static const char *__basename(const char *s)
>+{
>+	const char *p = strrchr(s, '/');
>+
>+	return p ? p + 1 : s;
>+}
>+
> static int fn_to_prefix(const char *fn, char *prefix, size_t size)
> {
> 	size_t len;
>
>-	fn = basename(fn);
>+	fn = __basename(fn);
> 	len = strlen(fn);
>
> 	if (len > size - 1)
>-- 
>2.51.0.rc2.233.g662b1ed5c5-goog
>
