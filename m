Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 877DAACC645
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 14:16:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E2310E907;
	Tue,  3 Jun 2025 12:16:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lv7oPywD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5775510E8FC;
 Tue,  3 Jun 2025 12:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748952971; x=1780488971;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ZV0jzm4iwwLuXbutrebKouU82n5IPkMVjakyuneeKhc=;
 b=Lv7oPywDBfZka3SSPPEZ8Vh+bv5Lvh1R91iR75ZvLbs5aT5Y3D4+PgJb
 7nt6QclP1uGmWJzn3YEzbYeuReXv/ugxBm+znci0HH1Fxr1nl0LWFW5rY
 XWx+sHFes9YfU6UYpbTV5Fr6/8BDzkU5Qihj+ixg+G0Rj3lE305X45HEY
 8B+3vvzFHYESODzHqlfhuZyKbIUZHPHfity10n3Kr+vrkA0rTQqCubeC7
 gNeEbLi7eT3DLngwcJCgxGPhHFSu/5I/4traaMs4k8BkSn0cmG1ArbyCA
 LSpl/nD6jq46wMG98co6kD8LcaZvgr6lHKk1d5VtGM1vvF3IMkkZgf0Wq g==;
X-CSE-ConnectionGUID: L+4Bion9SHGXcULN4wO7Qg==
X-CSE-MsgGUID: oaXgeRHARL2Domo46SQR1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="51131125"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="51131125"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 05:16:10 -0700
X-CSE-ConnectionGUID: 8oD/qeo5R5+KXJgYscOKsg==
X-CSE-MsgGUID: yhJzdYx+RZikl0Cnd7dn0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="149613324"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 05:16:10 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 05:16:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 05:16:09 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.80)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 3 Jun 2025 05:16:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gueb1+91xo/bHqXXHfAYUyUPD26VNDMkNI168rQjEpDKRe9+snpVFGuUyNeqYHK+yq51wR7MKrcqKOGf7VF3fPeICELGU5VZ2i1avJk+vNjkPbSnlfwoUYxjKdiO1FBcqHa7lEePTU5zozA1HWGcOawzxSu8ta8sDsmk+VApVQAzr/sChXAOpre6qFXlqR69tRbZIHdga2GXQ0p3JMdTpg2xT4+HnvTZfXgcPwgmwnAF62O+j/caoPMCp+zYn1Oe2pmSqXRX8cV512cefHIsndUZWJsYoviVCNOJmPCRgTqQHrHXoY3ApqVVCl4+8CdlHW3vKL2A0SQpgs3vu7zaUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DmLq1IBtgCD2Jo2FnJ07LLowbucZszDzVjwIEV8BJpM=;
 b=XmJBkhlq1299w94wk4pzZk2P+sOCDDjdsDOPHYJFgFJAKzUTKaxYYu2yM3A2Cr9xd4/29D5Tr66jfmQDi2pST/EEXeT4Td/HCApcGlQEjOpogo0Vxm3Xh1jVcYcLjiX/oWZBm//H7zyy+XlkuDqvy6U5VtMECBKqQPGE3I+WQWK7dudNyXX4iT4WvWBT7tj0FLw3XobAmoHEeR7oiHDKPE9ggOmFcafuD4cLN2ugNYvCIdhDfnFRrhlr9Wm5ooiXIAsog5AnQOkeC1mJgIJFWL+reEO+A4lOXX/WxfcQWTfM3QLZ58lzyR0q4Fhe+qbE3gIq+sPzRaD3Yr6GWox6Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by BY1PR11MB8007.namprd11.prod.outlook.com (2603:10b6:a03:525::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Tue, 3 Jun
 2025 12:15:53 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%2]) with mapi id 15.20.8769.037; Tue, 3 Jun 2025
 12:15:53 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
CC: <stable@vger.kernel.org>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?=
 <ville.syrjala@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH 1/4] drm/dp: Change AUX DPCD probe address from DPCD_REV to
 LANE0_1_STATUS
Date: Tue, 3 Jun 2025 15:15:40 +0300
Message-ID: <20250603121543.17842-2-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20250603121543.17842-1-imre.deak@intel.com>
References: <20250603121543.17842-1-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0233.eurprd07.prod.outlook.com
 (2603:10a6:802:58::36) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|BY1PR11MB8007:EE_
X-MS-Office365-Filtering-Correlation-Id: c3115707-ef77-4aa2-4c1b-08dda2986301
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXZPNkZueUt2RTdhem9XZXRQK2xVUE1ORE0raC9VUnpRaTlTbzFjQUw3MUZ4?=
 =?utf-8?B?YlhaREFxZ1BGclJpTWVQcUY3U29kYXlDMHZBbWorSm5MUXpPUnJRbld1YW9o?=
 =?utf-8?B?M1R6a0xrSEVCeHhPWGpJVE9obWVteU1LbUh0RWRSNElBWjVHRE1mbFZlemo4?=
 =?utf-8?B?aDlCMVQ2STFGUjJoNW1VVkQyYk4zWTVGU1BxV1lwWE9xU09nRmhMNGdpcy9G?=
 =?utf-8?B?d0VKa1c4SHV3MElXemEwQVhod0tnamZSelEwclE3VGdOeGJMUHpPZFArV1BM?=
 =?utf-8?B?bVVwL3hCbXBmWkI1NEhPeWQ4Y0xYaE5lTjNoQWZoOXdqRzZmb09zUXNtL25U?=
 =?utf-8?B?NUhoYjJRc3E3WG5Vb1BMS0F3RHVlWmtqcDlHOWk1QTBzYzVDNHdKT3lSZDRM?=
 =?utf-8?B?dGNLNHV3dTRUNmVUZHg2SkUwYWhEaTBaWGNDLy9YVVVmQmFJajI0ZjFJU2xv?=
 =?utf-8?B?S1R6RGZua3RYY0pMTnN6QU9DQzhSbXkvS3dyTm1yYzNKVG0ySGl2dStJTDNR?=
 =?utf-8?B?aG54d2NkNkdNbEFWNDc4My9jaTcraFNXVWYzRW8wMDJNbE5PN3drNUUxR1hi?=
 =?utf-8?B?NnQ1cElTeGE1TGxnT0lkNUJFbXVnb0gxREFpYTRMd1N6NUsvR1FvRWw0WlVq?=
 =?utf-8?B?ZitzQmZFVXlOK3U2RncvTm1zS3JIR1lKMzZlZEE1Qzc2WDV4dUpLckJvZWM3?=
 =?utf-8?B?bXhOaGdiM0NXVTFOTDlHa09TSWIvQ2F0N1BNRHhkMDhUTXFINS9Hc1BmRGtw?=
 =?utf-8?B?WUgyWXdIby9Xd2xURy92R2FYTHRFVVJpci9qaWVRZzVnV2NCT3BISjdpNHV3?=
 =?utf-8?B?eTVTTG5HMkNkMFNLSi9HaXY1endvazJ6RGdxSjdQZzh6YkgzaVhLOU5vRnEw?=
 =?utf-8?B?NC8zSlk0VStLcldERHZKSCt3ZWlUb2V1NS9Kc1c2bWNHVDFoUUZSa1Ewa3Ba?=
 =?utf-8?B?d1V5VUtMVndzUTA0VFZiZlRuSTE5OEhiNkkyaWNlR21MSU0wVXRTUE1vdkds?=
 =?utf-8?B?b1ZLZFZPZTdidWFDTUNwSHVvREVYd1E5T0lGWGV2M0VMcjk1aEVaTGl0MFJ0?=
 =?utf-8?B?eGx2RXYxMEJoRWN6dnpneEhrdkFWZGp6bWYzQ1BaMjZkV2ZFUlMxYzd4T2NM?=
 =?utf-8?B?ZCtQaUs0cHc1QUN2bFZNd0lqejFHZ2JidWpxNkNlY291VElDQkpRMUlxeDBW?=
 =?utf-8?B?TzlEWEJ6UFVlZlVwSm5jbTF2dmZLSFZEcm9hZDBLN2FRS3NUOEV5V240Mjg4?=
 =?utf-8?B?dCtUYkg4L3kwOStiblQ3SFJuV3UvQWo0cXVmaytkcVhlYzJPMlRNUExXWGtY?=
 =?utf-8?B?dERHb0dXNXZ3WVdzTkZWT3JxeVExTzNuRHJuQWY2SW5uTWZYSjFWVnBjNFNV?=
 =?utf-8?B?dEdxZlhkWUc0eit4K1VyREdza2ZmaW1ITGpZeUdPRHgzMk5ZRjZENU5WZmNi?=
 =?utf-8?B?VmMzSHVGeHJoWEZCRjA5bzFsSTBydTlwaURkK1JKc0xuOUZndnR6eGJ4Mld4?=
 =?utf-8?B?d2V0cUNPZWtDWkozUXE4VVJFajQ0L09FcytKRlAxU1cyck96MHBRNFg0dUxh?=
 =?utf-8?B?OXh2U1NMN3ljSEZFcCtmU1pyejZkOUo0NE5xcHU4cGwwbkpPU3VWMDVvdnhP?=
 =?utf-8?B?KzFLek9qdmQwd0RsN0E0L1hPai9iNHdtb2p1N1NXRHJuZWFkZHVFZmdTL2pL?=
 =?utf-8?B?N1ZjUHUrcE15d1ZnaVNMVXVHb2hZT3hFOWJpNnZXdFptQndBZGVSbks0RGI4?=
 =?utf-8?B?emRvcUVES3RyUVVSWjVjekQ2TXJjMVZOM284T2VRajJxZHlTMWcySGNqaWFK?=
 =?utf-8?B?REVGV09wMlk4NlFPZEVHTVF2QS96cWFBNzR2NXZPczlYNENqUXM1NmhoZGVC?=
 =?utf-8?B?UWhUbkJtenNVZkk0WWdwZUdEamU5Qkt0ajdzTGNhNzV3eStsNHdQVG1NU2tM?=
 =?utf-8?Q?mHrHZfLCiik=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VG9UbDhDNFRnUUJzemQ4SDJyOVVXZ21JeE45VWxwNW1UR1VGeVEwcExqT0wz?=
 =?utf-8?B?U2thRkNKUy85R2k2QkFQaDYySXFmT3c3bW9GNEF0aCs5dGtmcFhWWE5abmJp?=
 =?utf-8?B?clovcFFIcXYyclIzODE1UW80OGhVZ1o2dkticzB6TFY0SURTR3lYbHU5aDRv?=
 =?utf-8?B?dzZJaGdjN1lsRmdDTWd1Rld5Tk5URDJRZ2F5M3NaRER2OTdELzg5TE4wRW5n?=
 =?utf-8?B?enlCQVhEZzVqTXRad2cxYXpGcG1mUFBuTVdWYzgwdENuZ08yWkRHVEIwNTBS?=
 =?utf-8?B?MlNST0EvOUhHOUlnNnpoenBJdmtNaXpXaEFHQjRndlVFZHJWRGMzeTBEUk5n?=
 =?utf-8?B?ZkI2a2lmRGNqQnlTU3gySXJPd3o1QTJPSGZYRUV0VUp6UkZRRGtBTndqOVdu?=
 =?utf-8?B?dWpvU1YzTmpXcXh4SkVvM3A2N2dRRmFmWkpxQnpzMllHU0VNNlZoakIrV1NK?=
 =?utf-8?B?blRVUXpLYzBETnZ3ZjJiNTRDd3cyUHEwTWtGRFRQYkU3cTFmSzFrZ29BRmV1?=
 =?utf-8?B?VEpSUG5EMEhYSzE1R2xtNXBaNXpZczRvaG1mQS9Lc2JKKzM4MHA5OVE1R3hL?=
 =?utf-8?B?eHM0VG9ESjVwZFFCY3ZqUDR3TXJUNTVVZ29MRkhiVitPSmlQcHUwMGVOS1RV?=
 =?utf-8?B?R1lQbjhVWHNWbVlJajdvNlAyL0Z6RUswZ0xKbm1yNjVPbDF3ajBtaWdQMlB0?=
 =?utf-8?B?bXlZMThpR280RUQyUnM4NW5KWXlmdnUvOXlTQWpTTVVsZlV0d0RrVVJLMS9U?=
 =?utf-8?B?aXZjcWZTenFSdGxjcWk5bTVGQXNsSFpMUFRUWHN0YUowVVBEeDNRMUh4TWxJ?=
 =?utf-8?B?WGJUb09kQTVST1dYMExNdlBRS0VjSWVRM3ZyblIrbThuclhjVWVhQjFiK1pw?=
 =?utf-8?B?MmdnRXltZFZKeTlHajJDdEJBQTVXWlpxN0VOSkpsWmJLK2ZYK3owL3B2d0pR?=
 =?utf-8?B?S1Zid1pTUGF5Nm5MRnJkaWVUWnU2NWV4Zzk0SVpuQ3hGbytlOFpHMGsraEdi?=
 =?utf-8?B?eUpHSVZIVnpyTS9rM2tRblVOUHdyLzFDeWFjK0FrWjczRFl3eGRaVjZuOU1M?=
 =?utf-8?B?UEd5YUJSdklvY01IRjBraHkvWnpEY3NpcDA1T2l0MDhGMk9iVG1iSDNCNXZ0?=
 =?utf-8?B?WkNvMllEVS9zR0RnMlBpcGhmQ0tqRWFNTWQ5cHUrcGllbU93ZDFRTy81d1BJ?=
 =?utf-8?B?TkJjc0VFc1k3K3ZSL1U0ZTl2N0Mzb2o5TCt4cjRCMUZOYjFKcS85UEwxRFlJ?=
 =?utf-8?B?ekl4YTRDWFdXSTNDdmpMWnZjeHRNL21mNlh6R05YWjBWN0JsWFlzRFBOWnJE?=
 =?utf-8?B?eFFXWTFqQlJINjZLZ1ZnSUUzV3BGMFZrRjhnL2kxaWkrWkJrNXZqalBFQ3JO?=
 =?utf-8?B?NjVFaE1PSTRPMUwvSmViZlpKMHY5T3Mvb0FxZmI2cUxRRVBwajJsazlTb25m?=
 =?utf-8?B?NGphcGdTV0RJOWZ0ZzNKQ0NvUFVYNm5UeGw3WnJrT2dwL21qQzlKVVZ2czB3?=
 =?utf-8?B?aGllbDBhSExxQS9BQmM5bnUxWWh1UDVpR1hDWDBWT1AwYVFjaHN5YWZZdkln?=
 =?utf-8?B?aytTQmdRSy9ERkRzTlB5RDVzUUd1bjZ5VFE0QkZvVWJDYnBXU0dOMy9SSlpL?=
 =?utf-8?B?RzM5NFB4V0liVkJiN0RYSXBVY1h1WXk5WnZkdzB1RmR0bXdjUHNqSThwemhp?=
 =?utf-8?B?MlFNTDQvcWFLUTQ1YjllMDBwSEl2N0hwditnUGNyajBJMTlDdGNpbFZVWHBm?=
 =?utf-8?B?cDlFcGw4WWJKZWpnVWtGbTdIeEJHWkxqTzRmVlQyTkRKcE8zZ1MrajhlNlVH?=
 =?utf-8?B?MGVtTzl3R0dFUzlmankwSy9IUnh6WUw2b0cwa3U3ZTZzK016OERpeHNvbnpE?=
 =?utf-8?B?V2NCS1RqUkRHRmEzME1mdzhEb2dDRk1SWDE2WndIblFiV0NjRnpPa1ptekUr?=
 =?utf-8?B?YmtCNldxQ2tYYnJIMFFRZDltc05XL0pnMVFodUFzZ3hwMEtDMXlUMkNjVnhL?=
 =?utf-8?B?N3FQRm1RbHd5TDEzNWFxU3BqaGVhWFlrb0N5bWN3MHgxSjVzV2ptL3NFcU5r?=
 =?utf-8?B?b3dLSVpOOWNXRGh0ZXFlUUdGTnJzcnBzNWp5Zk9tendSTDFmMnhWN0hZdGJl?=
 =?utf-8?Q?wpkqdLiCwT0VKbYIbX8vREzux?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3115707-ef77-4aa2-4c1b-08dda2986301
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 12:15:53.8053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zx7dCXRhIFhITlRf3unnVPJSLwQPliMbOgS9zaKu4rnTBDkGAmKRGkKGbsfLQNAypNpV21Ypa9MUMs0N+c5JEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8007
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

Reading DPCD registers has side-effects in general. In particular
accessing registers outside of the link training register range
(0x102-0x106, 0x202-0x207, 0x200c-0x200f, 0x2216) is explicitly
forbidden by the DP v2.1 Standard, see

3.6.5.1 DPTX AUX Transaction Handling Mandates
3.6.7.4 128b/132b DP Link Layer LTTPR Link Training Mandates

Based on my tests, accessing the DPCD_REV register during the link
training of an UHBR TBT DP tunnel sink leads to link training failures.

Solve the above by using the DP_LANE0_1_STATUS (0x202) register for the
DPCD register access quirk.

Cc: <stable@vger.kernel.org>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index f2a6559a27100..dc622c78db9d4 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -725,7 +725,7 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
 	 * monitor doesn't power down exactly after the throw away read.
 	 */
 	if (!aux->is_remote) {
-		ret = drm_dp_dpcd_probe(aux, DP_DPCD_REV);
+		ret = drm_dp_dpcd_probe(aux, DP_LANE0_1_STATUS);
 		if (ret < 0)
 			return ret;
 	}
-- 
2.44.2

