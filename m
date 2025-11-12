Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE19C5413D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 20:11:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1707F10E1C8;
	Wed, 12 Nov 2025 19:11:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dv5eSyJc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0810D10E7A1;
 Wed, 12 Nov 2025 19:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762974713; x=1794510713;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=KnZSQjMZNAdAbDAOeRDDaTMgGZcJdIYNt+AFHJ7Szkg=;
 b=Dv5eSyJcaKv1XyILOhQ5eRbl6Jedb72f7J4ToPpg7cmLxG6G3Fj66dwE
 lfybxzfEA/7ElSGc4g2PuPvfBJ0eq7NPmWf3d8ilcbx0SKozjhvlOFi3k
 daBDfVNb6AWqeR9T/CNVwEHsHNH7+mUTkkERpte30sOmYXjF14+mTSYHX
 SoQQggpRA93p5rMBLjRAsncp7ks5eaDj4wDHbpldrcEwgBcXN3CrovtmX
 YkMEjf1SKroSqKm1GAuTLSitV9Ywil9EHnlNOSMerzdICm67GNjZOlVPl
 ocbA3/2WuC1M1hfCkA+69BkmgDEjkRfoywnUQ1Jec/6qRd9HoBrCj9WoZ g==;
X-CSE-ConnectionGUID: e4loCSVfTPS3ajBQFbLC0A==
X-CSE-MsgGUID: GolSKA/wQfWybQE81oGZLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="82678530"
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="82678530"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 11:11:52 -0800
X-CSE-ConnectionGUID: irKGBrP3RBuFfg7dGuNlPA==
X-CSE-MsgGUID: cjR/SmbgTw21xORst7SpnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="226594237"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 11:11:52 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 11:11:51 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 11:11:51 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.31) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 11:11:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oatgC6Fsr+o7kHamla7JQyPunlii6yvYraKZEUj8GAGXOHlcRJzPB8HzbfAAKmQZgyTfamojC8dFpQAoyi16FDTYWeYJR5ZNi39cWacfTZChq8sJj8OPdMucWTl74nH+uSLb2BYXVGUCKaEcw+HhJ/OeqoEU4FhcKlDJE5TocEUxBL/x+D3+qXlIGexEJaH5WRb8K0syVseTwUNzKdv3NmwlQYnF0o9IVKFfRSXl5bz20U9i+G78fdPm9LwVGrgItUhvW5tfuPnU8rLF5WTmrMEVT5L/sHPW8s7hFZuf/kBwZMuLhHt3wqWBZpQL2BLf6UBibHiYJVSBmx4YAgjKFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=amoibub71pr2zffcwkCSf+RFlOQ8vH+deOI7uGR+7tY=;
 b=kWbHLdRwTomIJQUPSryTjAuEwJ4NaJZiGufxsdmsBaiQVODhyfGxNr4y2oYAUfQKgC9rZ3721t2juTT9W5JTK+FXDArvtiY8rBfEJ7Dv24uc/7vWatXPQGqZ7kLjXBZ301gKTImNLyokWLEV9B0x8LsELH/ICCY1hrZuUyoHw84ZfPUVAzbSsks/4ZcAgB7URuLKOs+EIA8umaO/Zak+49ICUahKTpaG01pl8ZAKZFOr/kps19vfWd+QzzkmzMm8FaWkXn8N503Y9gfLhM2FWpYTu7Q7ZN2A7G82NxpypCLdR3gYnalioEvQOBmxTAc1pDrJb61fkdCHnX7chMSl2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by LV8PR11MB8512.namprd11.prod.outlook.com (2603:10b6:408:1e7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 19:11:48 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 19:11:48 +0000
Date: Wed, 12 Nov 2025 14:11:42 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH 13/24] drm/xe/pf: Remove GuC migration data save/restore
 from GT debugfs
Message-ID: <aRTb7nvT1jpd_k-h@intel.com>
References: <20251112132220.516975-1-michal.winiarski@intel.com>
 <20251112132220.516975-14-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251112132220.516975-14-michal.winiarski@intel.com>
X-ClientProxiedBy: SJ0PR13CA0068.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::13) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|LV8PR11MB8512:EE_
X-MS-Office365-Filtering-Correlation-Id: 73f68e14-8375-4c00-97fa-08de221f53f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dFJibUFzZnBvby95Wm0zSE5pVmoyTWxWcjFxZ2RlRWN6SjQ1RWNqQkVyTWU4?=
 =?utf-8?B?dTFOZk11WUJ2bVJjWGpuWk1Sc3luUGk3bkRVNjI4TFBmL1JyRkl6c1g1RzdR?=
 =?utf-8?B?V1dhQ25pTHpnYlB0SW9JczhjSTV5cWtLWXBWWlhzZEtRMWZHdlFZVjl4MnNn?=
 =?utf-8?B?Zk5vRFlJVnNCTitJUFg2Rm1qQStJRHhvZ0hmUkRzdXBzU0hlTFVtL0xlZ1BU?=
 =?utf-8?B?ZVZvQ0RPNzh5UUJNYndDMlhmY1VtYzdXS1lhSlFIRHJISE9jc3NkMHRONUpQ?=
 =?utf-8?B?aEQxamlQbVRBUnB2anYyVzBQN3BlVmZWWTdNd3F4Vjl4Sk9WSkNVUUpBV09m?=
 =?utf-8?B?bGZOWXIvNXZMSmZhalF6Zy9BdnVRb005Ujk0RmZ3bVlPVzBId0NkNjJ3V3I4?=
 =?utf-8?B?RUgvdnFEODMzSmRFdy9MOFVNMExvV2V2Y3pFOXlTM0x5YjNDdE9ESFZFbDJM?=
 =?utf-8?B?eUxaMEdpaDZDMmQzZ3VFOEJ0YjBLd2Q3a3QwUVRNOE5URU9CdzJVUU1rK0RF?=
 =?utf-8?B?VSsvcVlWa2x0Yk5nc2F3bHhmUmdQeU1SZkRoUExjdE4vOTJmaVY1aHRwRlV5?=
 =?utf-8?B?ZmJGNE44QmZpZDY1MnhEUVhqcXZ6L2EyRjZqbUM5cDdRSE50dTR6OG1BU01R?=
 =?utf-8?B?eU5neXYxclBrbmdPZUdFdmNnK2tnZ3dsQ0gveDRDZjl2S1lodUZmeVJQc2pB?=
 =?utf-8?B?bkdtNzlpSUtiYTRQZzdTUnJ1ZmNYeVFRRzBEa3NGbCs1U3dOMko3NTFtbDZF?=
 =?utf-8?B?a1BSOFlBMlVMR0xWdEZQb2FoVk1XZmVEUGJCMW03UktTb3ZBRU5nbGVQVC8z?=
 =?utf-8?B?N2szNmw5VHcvWncvaERGZ25Kc0xvS0E4N1VLZUMzZFNObVFEclh3Vk8xLzJV?=
 =?utf-8?B?WjdnTGE1b0NyRWZob2RwTTBKTGRaV2Y4L2RSZHVQaTlnUHRGQUtHT0JER0hT?=
 =?utf-8?B?NmJlU3pXRnZKWE1wTzliaC8zYVRPUVlDQjlvRjllMU9vVW85c3BmNmlZR1NG?=
 =?utf-8?B?VGgwSUVzRFhOdWoycHl2dndQYjZZREIvY0hVanpEZVpBL2NRdm1mZXkxTFli?=
 =?utf-8?B?dHRzaDBVbmE3dFVJRW40OUM5RDVCZjBVcmh0WWVWVWRrU0x2bUJjUGlLL3R5?=
 =?utf-8?B?bWlxK3RLUGdJYTk4SFdiYVNjN0ZYdzNMb3RpMjV5RzlEZmx1MXM3Nks4Z0Mz?=
 =?utf-8?B?K2RnVitQT29lTnFhUmRtbU55YlBQTzZqbml5aXVBMG1GS203MDVhQWRCU1Bz?=
 =?utf-8?B?c3poYlYvRG8zTFJ6WDh1amlsTzJEZEFoWWhoa1pZNUFKOCt4U2RZaHZuZjIz?=
 =?utf-8?B?VGd5OTVlZkZMK01lQ3RzZ3Y2QjhiUEF2RFBuT0tRMEl5WktpNStodHlZR2R0?=
 =?utf-8?B?MnRoYUErYWpiakUvKzhsRlhGV2FKVDFsMEFWV2huTW0yZE94dUxOUDgyWkln?=
 =?utf-8?B?eVhqTXBJTTBFTmpNaVVKMTlxZjhQYk94RmJhMXI3SExUSS8wUnJFa0VSTmlu?=
 =?utf-8?B?RzBRT3hxOUZ6N1AxeEdhOGRsY3BlZnd5d25vdHpFcmVGdlQ1eXVnbnRwWFhv?=
 =?utf-8?B?RmRWRllROExYZlJDdTFlTmdwQzFqZDZBQWFsTGZxUVpsMnBVOCs5M2xiWE4r?=
 =?utf-8?B?MHN0TUxrZjdVcG9uTWtJZW5adVl1bnFkeU82SWJnRElkQ0p0WTg4bFZ2RHIz?=
 =?utf-8?B?Tm8zMUtQZCs4NjFXd0dTL3VwaVc3azhGR0Z4Y0RUMi8rMStNRWU2SGtLU1hr?=
 =?utf-8?B?L3ExVWJ4dHNhTnBrVXhjeUNsbEhGQUwwckt2QzhvUS8wbkI3MjVVUzdRWDh2?=
 =?utf-8?B?bEg4alFlclZSYk5KZ0Q1eG5jek5FL0s3eUhscC9acklOeE5zWm1GZThuRkNq?=
 =?utf-8?B?NGoxc1lFK1k1Qi9oeFFpRk1Gc3FLOWhyZlJ4dkJ0ei81cnpTZ2ZXeGhWbjd3?=
 =?utf-8?Q?CcSMd5xrk4/di/hpdKPh5NGpVe/dRUzP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2pmWGlEeGppS1B4d2NzRjVmSU1pcG1wYm5OWWx6MG5XR1U4emd1Q04ySGdX?=
 =?utf-8?B?eWNzR2kzWTVLSUF6eTNTUU5nYitVOVMzZlBjV1JFSHkxYU5peFVURDFpa2x1?=
 =?utf-8?B?WDNXM0ZPdmswV0o4Z2w4bmYwV2c5WmZDcEk0dFJUbjY5QnR5OGhOVm9QeHZE?=
 =?utf-8?B?aWVZMElSczJHWXg3bjBWb3lRQ3JNU2QxeElGbFBwQlBsU0lEMXd6RzNhMFlt?=
 =?utf-8?B?a2hpOGF2SXg4VTl4Q3BuYVNJYzJqaUFqMmw2dE5EYitpSjRwZW04Z0FIdSt6?=
 =?utf-8?B?L0JoTFV6dGJ2bkpoQkM0c1ZLRGkvTDNnNkZFU2lqblF6Q0NYUWQzNHpwZHlF?=
 =?utf-8?B?ZzR3OEliaG5STTR2ckg4cjg3QjRwMVJLZDlHUG1FUTRMOUxscmdoTDdBV2Y0?=
 =?utf-8?B?Wkx2WWZsMkl1TlRXVVR4QjY0Z3U0U29DMEpTZTMxdXZvK09xTWxwU1ZYQ1ZJ?=
 =?utf-8?B?L29BUXM1QWJrTUY4bG1hcDlONzdhQ25lcEZsWlZKeDJUL0hZZjZtYmI3dmx4?=
 =?utf-8?B?c0FsY0dnRkJvRTlOSWgxTHJtcWlNVG9CVEluVmY1SVVMaVBBTnBSQVJKeEJt?=
 =?utf-8?B?N2FkaTdvdDdQbTZkZTU2b0JpRDY2dHNkSk1kMGE1aGxqR2JoQ2dJTWlyMHhN?=
 =?utf-8?B?WEF1b1lNZ01oUU1sTmZFMDFXbjJrUkEvNERVRk5oQzFMT0pabmhCYzZlSGc0?=
 =?utf-8?B?cEZBV1R0REZyejJqQUFWK0h1bWtZbnhMR3R4TFA4YW1QVWNTV2k2bUE5a01D?=
 =?utf-8?B?bUJwazJjbkVIa0gwT21Cc0FtNjlFQ3NoYVgraXFjZG10NVAxTHRDM0tMOGNs?=
 =?utf-8?B?Sy9wNTNObWlyWnR5NUFwYitLK1Nua3FVTlVUT2x4SUtVYktreWJCSE1hN1hS?=
 =?utf-8?B?VVJwaFJCS09XTTB5b05XNVZwNi9rQXhxekYxL1Z6UUNqREZqYnJHTDhiMTRr?=
 =?utf-8?B?dmIxTkdtc2RKMjVUVkZlRUIrYkpya2YvT2k2ZDFRWVVzdG5GZjVRV05QMFdJ?=
 =?utf-8?B?S0JkS2xZc3V1YVphUGZwbEtNWXBRWGRFWER6aVRKQ1F5c2NyUkRHaEdDZGZK?=
 =?utf-8?B?SzlUWkJWTDlDV2V5cnQvM0hnaUhGTDZPZnFGU0x4dUV3UWVyY0FLa1UzeHp2?=
 =?utf-8?B?Y2hCZjZLTC9aQVFaQ0ZWUlNRL0xXaXB1cG1KRXVUK0tnS3QwamdsVm9IY0FD?=
 =?utf-8?B?Yjg5allXQ2NUck53MkxkT1hQSnUzVVNXenlyMWt4QUs4VzQ1bHB3eDdQamtI?=
 =?utf-8?B?WjVYRDZ0dlEyMDN1eTNFcEEyVmRQamVvR0lVNDBXeXYvenZzN093emN5VEYx?=
 =?utf-8?B?YzFmb2VVd2lESklwbko5WnozanAxTkY2SzByQmQ4U2VOL2RJTTFYQVc1YlFC?=
 =?utf-8?B?TzNiWHpZQXhlZTNvY1d5cjMrcHIwcnE0aGJheHJtbGVsaHZPaWI0alVSYmZh?=
 =?utf-8?B?WkVERThIOW15TS9JOTV3ZzF3TDRsVE1sTElTQytTT1RPekozMXZiNTZHZkFi?=
 =?utf-8?B?NURSNlN5NUF6alFSa0Y2Q3R3MTVMclZDWHlVTnl4WElkakFhUTI2WE52SzhF?=
 =?utf-8?B?Wi9qWkdYUzhwQUU2SVF3YkxuMUtReC8rczFib3dMeUZKTTZ1UW1pQ0dhR1Bo?=
 =?utf-8?B?YTIzaVMreWNRYnZYQWltQkdBL1BnUFBCeW9oTTFIR2hnaWhtVGRkdXBiblM4?=
 =?utf-8?B?eHRsN28wbXlmQVJNZVpycThsTWo2TDVsWVhEYXZrZXR4a3lvRW5wMkRIcHlQ?=
 =?utf-8?B?WXJGV0NzRmJ6TlFrV1RNbXlUQUIyU1pUT2VuRHJsa2tuSjk2K09rVW8zakxL?=
 =?utf-8?B?R3k2TVhRUHhZUWc0N1BFZWxmb1FWSWpSTE0vY2JxM0I2bktxYWhxQmNmUW9H?=
 =?utf-8?B?Tmp3Z2wwOC8vRWk5RHgzQ3RZWFE2RzVkNTNyS1lnbzY3VmFWV1dTdWlGK0lH?=
 =?utf-8?B?K1RvSE40OTl6NTk0VmdyQ09sSFoydXpLQWdSODY4RHd1dzhZdmlHZ3IrT0lN?=
 =?utf-8?B?YVlxY2cxbUc3SjVQSmJ2OVRvenBGZUVUWW9SYk9wVUJKTC8zNWE0aHliU3RH?=
 =?utf-8?B?RUdzUTZxMCt4SmNFMm1nYjJBay9HUWloWTl5Vmc3TFlCSHJDUHJzOHVlU2V2?=
 =?utf-8?B?N2htcTZQeXBCM1lmTUlubHRLVlBxWmNJRHBNajBqZmkreUdIUFFzSXMxcjRL?=
 =?utf-8?B?VUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73f68e14-8375-4c00-97fa-08de221f53f6
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 19:11:48.4737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z8BpGwJyccoCcEfU2IuIEqO0QBtyGiPz7Nq2cRl3Pse+cJ2hEXHNoGMoBtxFPw46IpmeVF8/TEKzVWb6oCAFmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8512
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

On Wed, Nov 12, 2025 at 02:22:09PM +0100, Michał Winiarski wrote:
> In upcoming changes, SR-IOV VF migration data will be extended beyond
> GuC data and exported to userspace using VFIO interface (with a
> vendor-specific variant driver) and a device-level debugfs interface.
> Remove the GT-level debugfs.

Perhaps this should be retained while we don't have the xe-vfio?

> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 47 ---------------------
>  1 file changed, 47 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> index 838beb7f6327f..5278ea4fd6552 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> @@ -327,9 +327,6 @@ static const struct {
>  	{ "stop", xe_gt_sriov_pf_control_stop_vf },
>  	{ "pause", xe_gt_sriov_pf_control_pause_vf },
>  	{ "resume", xe_gt_sriov_pf_control_resume_vf },
> -#ifdef CONFIG_DRM_XE_DEBUG_SRIOV
> -	{ "restore!", xe_gt_sriov_pf_migration_restore_guc_state },
> -#endif
>  };
>  
>  static ssize_t control_write(struct file *file, const char __user *buf, size_t count, loff_t *pos)
> @@ -393,47 +390,6 @@ static const struct file_operations control_ops = {
>  	.llseek		= default_llseek,
>  };
>  
> -/*
> - *      /sys/kernel/debug/dri/BDF/
> - *      ├── sriov
> - *      :   ├── vf1
> - *          :   ├── tile0
> - *              :   ├── gt0
> - *                  :   ├── guc_state
> - */
> -
> -static ssize_t guc_state_read(struct file *file, char __user *buf,
> -			      size_t count, loff_t *pos)
> -{
> -	struct dentry *dent = file_dentry(file);
> -	struct dentry *parent = dent->d_parent;
> -	struct xe_gt *gt = extract_gt(parent);
> -	unsigned int vfid = extract_vfid(parent);
> -
> -	return xe_gt_sriov_pf_migration_read_guc_state(gt, vfid, buf, count, pos);
> -}
> -
> -static ssize_t guc_state_write(struct file *file, const char __user *buf,
> -			       size_t count, loff_t *pos)
> -{
> -	struct dentry *dent = file_dentry(file);
> -	struct dentry *parent = dent->d_parent;
> -	struct xe_gt *gt = extract_gt(parent);
> -	unsigned int vfid = extract_vfid(parent);
> -
> -	if (*pos)
> -		return -EINVAL;
> -
> -	return xe_gt_sriov_pf_migration_write_guc_state(gt, vfid, buf, count);
> -}
> -
> -static const struct file_operations guc_state_ops = {
> -	.owner		= THIS_MODULE,
> -	.read		= guc_state_read,
> -	.write		= guc_state_write,
> -	.llseek		= default_llseek,
> -};
> -
>  /*
>   *      /sys/kernel/debug/dri/BDF/
>   *      ├── sriov
> @@ -568,9 +524,6 @@ static void pf_populate_gt(struct xe_gt *gt, struct dentry *dent, unsigned int v
>  
>  		/* for testing/debugging purposes only! */
>  		if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> -			debugfs_create_file("guc_state",
> -					    IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ? 0600 : 0400,
> -					    dent, NULL, &guc_state_ops);
>  			debugfs_create_file("config_blob",
>  					    IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ? 0600 : 0400,
>  					    dent, NULL, &config_blob_ops);
> -- 
> 2.51.2
> 
