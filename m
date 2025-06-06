Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B307AD036B
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 15:46:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADF7510EAA3;
	Fri,  6 Jun 2025 13:46:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n/qGgHWX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4123510EAA3;
 Fri,  6 Jun 2025 13:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749217572; x=1780753572;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=8AOYRxX0ls7DiE8W6Lp4+cIkJIL5LBvy05qSHGKynY4=;
 b=n/qGgHWXvdWs3nb8uLRX/a4QSG8/fkcXmCyRg5vBbB+SPrrMHdCxGX2F
 yOJB2bFjJdp2r3j+/ztenUK/yp3YCrXh0zPofLGwv3hw2HflCoe2L4ucy
 kaQuZ0nC63rMwRPIn3JKOZvsHNnBIvn0CvLblwJpLVt7uLFNM215ZwE4U
 ajISYqyaScu4X8f6tgb7JMuuYbJQ0/a7K1sCNAWVrZxQ0Gp+Xk5uMm6aU
 zLJ7Lb/NBafb92KtBjgLEmJAXp9UWrqpGpBXJpA+6a+oboYHYBiyoi5/c
 GehDoO0T3315fRbp8JjvK6cIFzl9WDt5VOUWSKKdS7XED3e5gZYJu+Bes A==;
X-CSE-ConnectionGUID: 8sow/6f5SIe+Xyen937MKQ==
X-CSE-MsgGUID: AeN//X81Sku2pnk7zImTpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="62763409"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208,217";a="62763409"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 06:46:12 -0700
X-CSE-ConnectionGUID: sPPx0FWHSqGvYY23v1kwOw==
X-CSE-MsgGUID: nHwrgjo2TUePKY9s0HCRQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
 d="scan'208,217";a="176702133"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 06:46:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 06:46:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 6 Jun 2025 06:46:10 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.68)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 6 Jun 2025 06:46:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P5XUviWZQPNz51/u/zY1S+mAaqg4P2pxbbTsr0QiqBg24E2t1ObebDo1pzxBUosH1PQ9WkW/5tV9LrerSc+r8BRmjpY47b5BfedbYBFSPJFYfTWnXXBPKDy3it8gCa2RQof+awgnmoaT4b4UrpL9tqmEE5a2hggJactlIwvqhokT3RDbvHC4Mc48NzTsbIpjGFVDK5rJdGl98sgMqYODHCQUKkf+ziOfAT6QHFcETg3xroQkg8QNOQsyqnBu6hlNDsF3yfWPTm4/52SKjgIUMyBxjNREa3C3Vj2QfqG/tNlCXA3uJyTHe901PieMXtG8AUa1l1HbCm9kjPxfOd2/9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=grw154wiw64cdSCXrAxrYrSzKjNn3ZmyXeLO+spaB3s=;
 b=JkXXmD/0B7YVUdM+RVqCtVOHiIgUrRO5ySB1CS8ISPyKJf5Fh8w7wFE8Z/RuykIau2sqbOWNt1ByaKQH+bxNjtUclyFFoSNIJyqBEODbJJt93It4CJKEsyDBXRrMMm9Pn7zKW9Z669Lz3OUilwn6ZNcIdO0NZ7q/ky4LI+IAJCycFEzxwnF8tis408/9yVbz4mDHG5j7UiM/PO3L2A5q650Io6ZNjP2OU8Y6YnqoBzN3cZKJOCLRGTfyNMmmcPZ1KuCp3qwGVmlTfAPrQaShRfkok8ct4LUehjTZj8Z+kEIE1UOL4UQfC+XOSly6CYeL/SNMW91XWjNYJaJHIiPCiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by IA1PR11MB6075.namprd11.prod.outlook.com (2603:10b6:208:3d5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Fri, 6 Jun
 2025 13:45:28 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%6]) with mapi id 15.20.8813.022; Fri, 6 Jun 2025
 13:45:28 +0000
Content-Type: multipart/alternative;
 boundary="------------Q2EDb8FJkTrDQszKpry1q0tJ"
Message-ID: <3c41ab4d-5148-4aa8-820e-b053a4a0f54f@intel.com>
Date: Fri, 6 Jun 2025 19:15:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 9/9] {fwctl,drm}/xe/pcode: Introduce xe_pcode_fwctl
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>,
 <daniele.ceraolospurio@intel.com>
References: <20250429160956.1014376-1-badal.nilawar@intel.com>
 <20250429160956.1014376-10-badal.nilawar@intel.com>
 <20250506181353.GA89958@nvidia.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20250506181353.GA89958@nvidia.com>
X-ClientProxiedBy: MA1PR01CA0160.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::30) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|IA1PR11MB6075:EE_
X-MS-Office365-Filtering-Correlation-Id: bb695b7b-6659-4906-d7df-08dda5006582
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bndVbGNPa3dMNzZFMkp2ZUlKakJXU0FEVE5xUmVFQnY5VE1SRU92NTJ3RlBi?=
 =?utf-8?B?Sm5xSkdxMWRHc0YvSHBIclU4L1JhLzhvODdYN0ZPVXVla1dxQ0FpOGVYZE5K?=
 =?utf-8?B?RnNHZGpGZmlNdkI1cHMvUzYyR1hlU1F1WVhtVmRuWWtKQ0h5cmJBRzRJWUJB?=
 =?utf-8?B?THordm5kRDZUNXFuaE9tbkxRUTl5ektaQ1JwRUQrUWh1RzNyZFp6Z1BOOFhO?=
 =?utf-8?B?UHIxMUU5aytZY05tcjRPN0hOV2NKb29PM0R4UFhaL1k3M000bXFZUm1zZkxw?=
 =?utf-8?B?b29PTDNrb3pVK3dFOXdkM2FwNnQxT2g4VDlwSTJQVXlLTGd4YU5MV0R4YTFR?=
 =?utf-8?B?NFlxNUI5VjljUVN5VDMzZHNKenNVMTE0MGRyeGhhSWlrWnR6TVJCZnUwTlEw?=
 =?utf-8?B?OElPUTdaTHFiWU4xaGt3a0xlOE1tMTVTMlFNRnQ5RG5PMFIrdlp6QitvQ2M5?=
 =?utf-8?B?RVJvQWlubVIrbXAzTHIzSWs2cFhhTzRQbDJKTDFDYkNua3dRalNpVWtDT1Jl?=
 =?utf-8?B?UU0xalhYY29QQ1d2RnFKRzluUmRMdkVMVjdXUnVVdkZ5aUJGWEJ4NjZXbGlT?=
 =?utf-8?B?by9Nd1Ywc05zNEEvQVRNUGZqc1FFY0Q2YnhzRnhpam1qSGQrTCtUbU5TOEk1?=
 =?utf-8?B?OWFBd0VQK1hXcTNPL3lRek0yTThVaHpDRjc2dnJ1d3Fmd2pHaDIyQ0ZWZWxK?=
 =?utf-8?B?SjVHVVB4TkYxQlVoRHY2MGxiYmNqWThSdHVwL1V4cDQrN3YzOGtYWjJ5emtZ?=
 =?utf-8?B?ZHFxbit2bUpDelhTTURxbVNXcG9HWHJYL0VLeWVOQVVxdVIyMlZaZ09iYjUw?=
 =?utf-8?B?dzZtSWZYQUsrWHlicDVmTHcrVkhjdmJ5RGQ3a0V3Sk1lZUxYK0lmZ2VCRFpI?=
 =?utf-8?B?bUZNeXpPb1dicWZVTGZQVnBLYWVzd1QwS1pjeEtvQ2ZXM2d6bHdlTDQzTjgx?=
 =?utf-8?B?NGNFWG9RN25wc2pCZlF0VE02VVhuMFNTSk5CYWppaFk0V0tURVRpVG5UTlIv?=
 =?utf-8?B?cFhDaGpCaFNESmx6b3MxNExONGhYRVlnWlBTU2VCYUI0eHdsc1dJcFlxeVlj?=
 =?utf-8?B?bnByQmRyQjFRM1REMk5XbFlQaXlzVmVwWXFLQVpHdlFGZ0Zkby9FRVNjaGlW?=
 =?utf-8?B?Y2hkWEZzUUtNSE9QTThEZnFHUEkrWTF6NGpBMzRWWHlaOENZWjlRTmoxZWdV?=
 =?utf-8?B?cnM3SDZSRHVjc1dMMkdpbXo3WDdsSk1NWmVTOE42RDAzSmZQTHhTTnhFcnY0?=
 =?utf-8?B?VFQ1V2tYeSs5WXkvZWFETTA5N0V1cG4vUUI5Q1lZQjdwdHlsVC8rN2llMVdQ?=
 =?utf-8?B?bW9Fcm5UVjMvMG5HcWt1T1JZMVBSQWlRdWYxUkhEaHN3OU4zWXp5WFIvdjlK?=
 =?utf-8?B?ZEVmUFhwTUhHNDRBYlJad01jdUdpaEFHOXVZQVU2dDhHaHhnZ29wcHQrNDE4?=
 =?utf-8?B?dHFSYzhwNjFXeFE0VXJKYmpCRVhjeG1tOFBEMDlpclFaTWUwaFZoOEMzeXJo?=
 =?utf-8?B?aXoyRGJqaWNpcG9uVFhZZTc4R0FRSHBqT2QyaEFQNWhvU3pRcG5KT0xhbzJW?=
 =?utf-8?B?TWI0cTQyUDd6cHhhQXpRbDZFSHVPL3VBSTlhcEc3NmZqSnk5K1dSYXNXTXFr?=
 =?utf-8?B?aHJqdytodTFUcVZqTnF6UWF4UGxTOTNkWUFDc0VMT2VMdUJwL1hTUzQvUzN6?=
 =?utf-8?B?M1B4WU8yODdrOENpMFgrWFQyWnZHZHk4Yk1IQUd5YitSaWcyUUhhWG52UExJ?=
 =?utf-8?B?Q3JwcTNpOFdQSmtNZHNsQSthZFlPa3phNE45RzU2MTBnanBIdE9vM2s1WFVE?=
 =?utf-8?B?RllEZjQweGdLVHBZVm5TcjJwTUtFRXo5WmpGZFRuSFBDdHBnUlExQUlDVEND?=
 =?utf-8?B?WVM5Ym5WY1BZYmJmekJMeTFPcGhDMmZkVEFqby9SV2szSlM4N2JFWG4vcFFJ?=
 =?utf-8?Q?7buTIsvCJoM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnNxN0pNeURYNHBWNmtZb3RhZ1ZQTmNPTXAxTDFRRE1sWGYzQTFwNzJ2bWdn?=
 =?utf-8?B?MTB1VGtqSnl5N09lQTBLcC93anQ1a3JGcHEzN2JXQmNJYjJ0RzYxMXgwcnBO?=
 =?utf-8?B?OFZ4a2Nlc3ZTUnFITGdCSzRCTGZsUWlMVC95dlV0RHprelE5SnQ1TEQwdTZz?=
 =?utf-8?B?LzI0UUpLa0loUTZHNVJ4TjY5eVR6NThTa1Rrc2t4bkFPR2JGci9CN2NjMmZt?=
 =?utf-8?B?Qld4dXJoenBYckswQ3FMVS9ja0R3aldpUkowRnY4MmUxcHJnSDVyM2Zibk1C?=
 =?utf-8?B?VmJNL0JvN2ZUU2N4VC9KZFpyMGpsZThGbEE4UjBFTUdzc0dqbHBqaTJxdDg2?=
 =?utf-8?B?ZWZ1cE5NLzJMOUhmdFl5bEJnNUJTTUY0WGFwSll1aDJVZW5RT0N0Q2dNN3NE?=
 =?utf-8?B?czNHeThqdklmclFIYWhGOVdzQ1pQTWdZTFpnREZGL3VBMThNeW1janFZVnRG?=
 =?utf-8?B?a0o5RDg4YXBrUzM4ZlJyNDdWOXBCRm1ibityOFFVanpDTnBYWXN0V0hVK3cz?=
 =?utf-8?B?NnNHbnAvVUljRElzQWhHK1lWUVVoLzJlZ1BGd09tbFRvZzNUZmxLZjdSN1l3?=
 =?utf-8?B?SWxiNVJtOTJzN2g2NFJxU2lXS3RNSUFRY3RwUUw5NzlxazcxMEEzaGs4NnFQ?=
 =?utf-8?B?WVg5UFJES2RxU1BKa2ZFa2JmbzRKRW5XRysrVDVEWUVDUTFneWhpdm5PQU1B?=
 =?utf-8?B?R3BMdUgwRmVuNi9RYTFpbDdJQ1M5bm53OHduMkRsd0d4T3AyUkZ2aktGVFlB?=
 =?utf-8?B?MW03elI1OTRtSlNkeTk0RFlZS3FYZGtCNmZzeTdaMTBRRzRzanR2R2NKTURM?=
 =?utf-8?B?b2hYbmRTcDZVWEo2aHpxMEViQmFvMlRhSWVnb3dvcWVpdm9iOUxwU2FOeGtS?=
 =?utf-8?B?bHhSUGVWWGJFS3pvb0MwYU10S0k0N3FOZ3Q5bkhFbzM2QWd1QjE0ZVphcEEz?=
 =?utf-8?B?VHM2OGM4emRhRk1SZVFGRjUxbGVtSkNHU0RUWTRRalF5L05HTHlZTHgrN0ht?=
 =?utf-8?B?aTBSdmpweE5mejRvMjZXNDd0bnBxTTA1b3NSR3dZZXZRR3NzNXMrOU8wTWxl?=
 =?utf-8?B?d0h4cUluT1d0aUxYQW9tMHN1MDZnck5wem1LL2tKYkpDR21MdnBsVW5aRnFS?=
 =?utf-8?B?SWdRUWN4dStsclVCdVJJUzNzUWtIa2g4emtiSmV1UFlMQzF5RkdWWmN1Ui9t?=
 =?utf-8?B?MjVmRGJ6TUdQSWI2aDlPV04rc2kwNmFUOGxFM0E5NGJKSjJPVGtHNExFSk9Y?=
 =?utf-8?B?S1NudVBuV3NiY3RLdWJZcXZPWkVqamJna08vU3UvVHlZQk5meXFDNDFDQkRD?=
 =?utf-8?B?TVlDSDgwd0hJZlE4VU9zdnhKMjBBZi9YcEVxeFk1eFcydmxKMitFUEFBZVdB?=
 =?utf-8?B?UElvbldEcmgvaENESnlwaHVVT0hkTnlwM2F3aEZpZU5mV0VXVEVwT2VWeVAw?=
 =?utf-8?B?QWxrN1U2T2FhZHR2UkJCeVhkR3RVMEpVeFNxSFlWemkvNE0zNmFqMHNRVTZT?=
 =?utf-8?B?SDh4KzhKZHNNUmdKa2JYNG83K05kN0IwSkRjS25qU3JibGNLVTh5U1VkamtS?=
 =?utf-8?B?K0R2T2FVSDk5aGJRMmpmVy9qM1Q0Zys5MFB2UVNlNlZ1WHVuMytXbFRuamVL?=
 =?utf-8?B?clA5UUo4UndzM2tnVWljci8rSHh1QWlyTDJrNWt0aGQ4WFFwRlRjbHJtZjZL?=
 =?utf-8?B?WjA0ZEMzVThuVzMxRmhEV1FNYS84bDRvenk5dldFanRTRmsycVZVdE1tdTdQ?=
 =?utf-8?B?TjRGRHlPL1gwTlNzZC9IMDBWLzhSQWwreEFPZWFXZWthZjVNaDhGbE1BaTVs?=
 =?utf-8?B?a0YxbnhqSFFyT2ZEdHBwRkEyQnRCK3hoT3F6RU5JL0IrVEh2bDlPeEdJUjFl?=
 =?utf-8?B?VU9nZGY3N29Uay8zRDc2V0VIODRaK0JlaWdHb1RORFkydGhJRnlvMVRYRGZP?=
 =?utf-8?B?SzNXVTNSakIwOGI1ejNOZjREdzlncC9RdEFLNnF1OENMYjJTNXBEME1oNWxW?=
 =?utf-8?B?NTVTb0lZMCs1OUVkSHZkL2dka3RvRHQrczhDdXcyYWVvcWJEM090ZjZBQjFF?=
 =?utf-8?B?S1pvcWE2UVUxclhXTDBLVkIya3dlR3FnUHRORnlRTnp5L1pxd0w0RUQ0Uzdz?=
 =?utf-8?B?T2gzNUw1aUcyVExHaWdNMGIrQ08vSXRqcEN4Y2NTWjNhUFpuWXloQTVRdktm?=
 =?utf-8?B?OFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb695b7b-6659-4906-d7df-08dda5006582
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 13:45:28.1964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: obzkpb/wDIJK472Ul6Y0V0Lcz53cF+1ZGjKPkaZhFDx9qAzhlAZrEJ4lZQzRc7M4mA1tSIRCdAbzOQITl1gYng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6075
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

--------------Q2EDb8FJkTrDQszKpry1q0tJ
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 06-05-2025 23:43, Jason Gunthorpe wrote:
>> +/**
>> + * struct fwctl_rpc_xe_pcode - FWCTL Remote Procedure Calls for Xe PCODE
>> + */
>> +struct fwctl_rpc_xe_pcode {
>> +	/** @command: The main Mailbox command */
>> +	__u8 command;
>> +	/** @param1: A subcommand or a parameter of the main command */
>> +	__u16 param1;
>> +	/** @param2: A parameter of a subcommand or a subsubcommand */
>> +	__u16 param2;
>> +	/** @data0: The first 32 bits of data. In general data-in as param */
>> +	__u32 data0;
>> +	/** @data1: The other 32 bits of data. In general data-out */
>> +	__u32 data1;
>> +	/** @pad: Padding the uAPI struct - Must be 0. Not sent to firmware */
>> +	__u8 pad[3];
>> +};
> This has implicit padding? Make the padding explicit or use packed..

Thanks for pointing this out, was miss at my end, will go with explicit 
padding in next version

Regards,
Badal


--------------Q2EDb8FJkTrDQszKpry1q0tJ
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 06-05-2025 23:43, Jason Gunthorpe
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250506181353.GA89958@nvidia.com">
      <pre class="moz-quote-pre" wrap=""><blockquote type="cite" style="color: #007cff;"><pre wrap="" class="moz-quote-pre">+/**
+ * struct fwctl_rpc_xe_pcode - FWCTL Remote Procedure Calls for Xe PCODE
+ */
+struct fwctl_rpc_xe_pcode {
+	/** @command: The main Mailbox command */
+	__u8 command;
+	/** @param1: A subcommand or a parameter of the main command */
+	__u16 param1;
+	/** @param2: A parameter of a subcommand or a subsubcommand */
+	__u16 param2;
+	/** @data0: The first 32 bits of data. In general data-in as param */
+	__u32 data0;
+	/** @data1: The other 32 bits of data. In general data-out */
+	__u32 data1;
+	/** @pad: Padding the uAPI struct - Must be 0. Not sent to firmware */
+	__u8 pad[3];
+};
</pre></blockquote><pre wrap="" class="moz-quote-pre">This has implicit padding? Make the padding explicit or use packed..</pre></pre>
    </blockquote>
    <p><span data-teams="true">Thanks for pointing this out, was miss at
        my end, will go with explicit padding in next version</span></p>
    <p><span data-teams="true">Regards,<br>
        Badal</span></p>
    <br>
  </body>
</html>

--------------Q2EDb8FJkTrDQszKpry1q0tJ--
