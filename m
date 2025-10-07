Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD5DBC08EC
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 10:09:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F0510E5A3;
	Tue,  7 Oct 2025 08:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bctmcCCz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9093610E5A2;
 Tue,  7 Oct 2025 08:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759824593; x=1791360593;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=O72umQriXLetMVPUtxCbZhuXZf9aJF7zjNLF83X48e0=;
 b=bctmcCCz3CxAwNdAjdD2bWkf8AGKZ7k2t65Fm1iVxpu1PXWU6neHmOQS
 exG7QRcGssFxhis7NNqI9COV4TflbJPBNOxsET3jKg36qWdmwAoLrboal
 9YIczRZBHz5wgU6ZzsFgrwTF4+hn8/+eJxB0e6TQcpW9WUVlnkqQdil0U
 korigTBtgxyKupde5FkLr+3S0i58tyD55a8dDslJbvX0jRrAfnNvPjv65
 vtgC6OjYNxn7H0OTbzhXKuSYGzoB/OXmz8MnMV5VBkBH+2sxi4Eh4zjwD
 o6i7tzTGP8FhDiBgTp0r0A48dILnf0NOI2VK0r4AqiNl/nuGe2Sfaaa2N A==;
X-CSE-ConnectionGUID: ZmFCrnPNQva5O/3yYTWZJg==
X-CSE-MsgGUID: hjOrVliaQzCWDTVq3va1ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="73427668"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="73427668"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 01:09:52 -0700
X-CSE-ConnectionGUID: EVCXmk3EQNSasVPO7acAYA==
X-CSE-MsgGUID: 2ophaeViR2yQGwE/uxeQtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="217175366"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 01:09:52 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 01:09:51 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 01:09:51 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 01:09:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jm01jQpq6yCjhcJNkE4JVq2MoyQ2PKKpEJ9Q+blfEVK3fi0L2L8IXL3zt1r68rEBtbhhqH3OKyEG+3Kt2sI7gZ1xZD7q8b09piefNQeDhm9qMn5qIjejp3G2qc0SpFApAq0MT0/rRiCFXQzPnsvnadiNfZhK6O0vji0p8+f28cgdz28JfxzR87qWPhn0Jk0ZoFD1gTGLH0luQDIPigGVhaFuWrRa74clZM8OShilwOE9ABZE4c4f1Mz8jhXAQqr2dKQVHSkmzLH6nUYfyhfQxxGNDvy13aegeNp+T0HKxyWaFajPohJp1KC/Pzrgc6inzLp+IWEhubHpHc9NXgauLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZxQn/V3Lc1fWMIrvjTzKBzfCVFkua2uCLQsSPvO+G0=;
 b=ynwVsqhsImcT0ENpxgms3ZphxyIrZ/vi9fbfKYK7ObhJsw4o53h4zotcLCC30803nyIsbBLw24zRB1GJ1EZh2LYUZPB9iyPyqcfYvEwYbk8/9Iwbdc5+Qjd/8OL29Vntl13p6OH1AZfZC06iOaiPEpNRzm1WN9TK+KZsUI8e89qIWLH8+Dy/MA16IAH2dAaFsVxz4tlwpa+ZvI2DxqKklWhtmuLJBm0X0IPbgdpE82jNoEpfdm9qsli4eZoMMFzdr9snFZHj/GkNiwB2mUVPYQGhdqpW8JSL/bjC0wFSvBxaTw3ZWSr+hq0buX5deY2o7s6lnnzHHQJIAo/v05SLuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB7494.namprd11.prod.outlook.com (2603:10b6:510:283::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 08:09:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 08:09:38 +0000
Date: Tue, 7 Oct 2025 01:09:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <alexdeucher@gmail.com>, <dakr@kernel.org>, <pstanner@redhat.com>, "Philipp
 Stanner" <phasta@kernel.org>
Subject: Re: [RFC PATCH 1/4] drm/sched: Add pending job list iterator
Message-ID: <aOTKvgqYFk8kw6Tm@lstrano-desk.jf.intel.com>
References: <20251002051604.1865322-1-matthew.brost@intel.com>
 <20251002051604.1865322-2-matthew.brost@intel.com>
 <be806a5e-75c9-45da-962f-2c1db75b4a07@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be806a5e-75c9-45da-962f-2c1db75b4a07@amd.com>
X-ClientProxiedBy: SJ0PR03CA0254.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB7494:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aeae4f4-5d8b-4b00-43bc-08de0578dbb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SzdqeXdMVFlXSjBGaDcyMkFUYzEraDBUQSs5eDRKRUR2Z0JvYnEwU2hPOXUx?=
 =?utf-8?B?ZmprNXJYQmM3UXcxZGVaTkh5ck4zMlFCVXJHUTdMejUvUDZwR3lJNXVJSXNv?=
 =?utf-8?B?alpTbkczMjBlUzlsbHVOMVdIMEVYOXZtMVlubG84MXNPbE1idFA0ZVltYW9T?=
 =?utf-8?B?SWRvYjVKSmxFWHRRMkxueDlhbkdoYjhHUVp0QUtCMUx5TzRrMTJ0K3BxUElz?=
 =?utf-8?B?VHBGZlNxTzdCSW9tdmRybS9wcHlPcHhYZWd2YUo3amdrNDBhdHhRb3RVTVVE?=
 =?utf-8?B?b3NoWlA2ejBFRWk4U3NCbEprNC9mUFpmNUgyNDArVzdza05HYU5aWCtIeWhr?=
 =?utf-8?B?WkRVYVp4R1lXOXBtQmM4cFI5ZVNXTG9jQitBSEw1SHdld1M3QkwvRW9KZEw2?=
 =?utf-8?B?UUZhcWQreXQyNkRYVW5BUjVjdklxM3pNU3V5R21pVHRRWm5ObnhqQ2lNTU1N?=
 =?utf-8?B?YkFXZzB0OThEcUx2cTNETS9NTTlqM1pyWHVSWEIxdDllRVhyT25ha0RWRmNw?=
 =?utf-8?B?VS91TDBWWk9GQjl5MXhTTWd1cHArU0tYUzEycTBKNmx3WXpvSE5jWXJFb2ZE?=
 =?utf-8?B?U0xOUU1wVTVNbUhCSTdCMjBhTEpYWGUzZ2FCM1g2WjhBRmpQTTV5N0ROejlp?=
 =?utf-8?B?dUY3U3hFQjltbmhFNTdqcUxBMTVHOVoxYlNXNnlCUjkxTk5UblRuMS9VZXVY?=
 =?utf-8?B?TUJIK0JtRlpVek5oMWhsQUR0d0xKTnhhYTRJNjh6ZDJ5NytQMnMrMlRsNHdi?=
 =?utf-8?B?a3pMQkhLbWtFVThvSEtSVndaVjMwV2o0Nk96OE4rdTU4RVdSdWZldjJvdHRV?=
 =?utf-8?B?WUVUUlhMcXp1NFpRVmhad3R1V2s4eUE0SUoxN2NITEZOK1pNSFYyWHhjdk9n?=
 =?utf-8?B?WDZUOTdwREpGVjhmOW1CaExDREgzb1dOUW9XNmlFYllHZmNtMWJ1ZmFnNDRN?=
 =?utf-8?B?eW5lTjRzQU1sT3NFVWJXeGlBMDhRYVAwREk3N3B3b3FjMjR1MzVSN2Q1ZVZo?=
 =?utf-8?B?S0RqT0MySDVhczdwKzFvOEtqRVFCOFFOM0lKQkVtcDllS082YjFkZWVNSUJ0?=
 =?utf-8?B?a1hWZGh6TnNHVVF3NVhRYytvdHE2THhka1RwL0V1VjdYK0cyMFozTXRpZ3ZL?=
 =?utf-8?B?MUlOcGk2eTBtR1ZkRzgxYWpOaWcvRUJzcjRYT3Z4RmoyVWFnSGw4MHNrY1lm?=
 =?utf-8?B?TDZpZFNocTYrZDJkb1RNdGFiUDEyQ01XZ0REc29iaTZLaFhSTlcydmZ4Rmxw?=
 =?utf-8?B?VGVWU0FEalQvSXljdGxoZElNbURLTXVyWi9VMjhmNjNQWjRhU0Y5SG1jeVVk?=
 =?utf-8?B?amNtT09GZncrNDBMTkZlazkyTzY3d1BlWVo1RkhSSnplTmw3eFRxODBUR244?=
 =?utf-8?B?WHNNcDNlSUNJWXBCY0s4bjdYL1p0QXJKb3lkVTFmYW1hZ2MxWFZXb0JocjBC?=
 =?utf-8?B?Sk0yZkg4MnAwR0RYMU5pN1k5UXo4YkJOSHgyMGk5enkza2hCaUhIaHl0NHdq?=
 =?utf-8?B?NkZyWE9uRmtleURFcWxJUWlrVUcwYWR2SGpyVGN5WUJQUkNvc0Jka0lWcktC?=
 =?utf-8?B?eWI4cmJaUEh0VnZpZzRjZDI1dDN6RmtXR09QOVBUL3l1cDYvQ3ZPSFdkdElR?=
 =?utf-8?B?T0Y5MVZwcVdzbzBaSVBDMmlFZTFoMzRIMmVCMXRaVEF3VXdURUF0SnQyZWpW?=
 =?utf-8?B?Z2UxbXQ2bXJkYnRFMWMvOGF0aXNqVE52cmhEK0tqOTZuZ1ZQT0V2VnJ5SEFu?=
 =?utf-8?B?eVVSNjNSeTRjeXh5U2NSVHRLWjBYSGsxQXRGTUpoRVRZTXRjZHJYU25XR0Nv?=
 =?utf-8?B?U0hqb0UxQXlWbmsyditONEhEaUZwcUNWOHZEOFN3ZGRBelVCL1NzSGdXUHNr?=
 =?utf-8?B?b2FaRkpMaWRYVHl5akRUY2IrcmMzRVBlaFN0M1hVYllzUWtjRWdTeTA1bzdY?=
 =?utf-8?Q?BaPeHz1o7/iov2GgErDBuwpOiBwTHX4j?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWM3dWZ1UlVzR28yNGFLRm56bUFxZ21HSytFR2ZjYWVkMnZiR1lJV2IrN2Nx?=
 =?utf-8?B?c2Q0Zk9UWXlsakJYT2hIVW1YZVArQm9lWFM0d0Y4S3pUcTNlSWF2NDR4RW9I?=
 =?utf-8?B?OU1KemtMdGhFNWkwT3BDRkZYblJjdUo3NExWWit1Y0lUT2lJMUF5bU96SlB6?=
 =?utf-8?B?UEcxY0NXNXJHOG9tcGJEOHBjd3VHZ1B6TmhKajRlcmJtQ0IvMXByOHVEeFA2?=
 =?utf-8?B?cDFxNXN4QWVOdlJ1TFNTN0VaN1p1UTFHcGtzalNMU25Gb0FqamdNZFJXTVBa?=
 =?utf-8?B?QzN1WVEvV3dMeVFyMjU3SEVselAvVzVmamZGSm9kaTdyb3hKZ25HT2RVSHpU?=
 =?utf-8?B?SjNGck5DTDVFKzFNSVpoMHZnV092QWJ3WS9scm5UUDBWYUxDQm40OEx5YmNs?=
 =?utf-8?B?b3FETnZPV21pMnp1cXMzM2RQVG1oa29vSm1qZVBJQzNFRGhLd2oxNFdiQk5S?=
 =?utf-8?B?TEFnRm1ad2gySFV6bFBrZmI0WUhPNy8xZkF6MUdtRHdzZ09lK0FxTmVFRW44?=
 =?utf-8?B?djBHN1NHLzdzNVNDQUlSUDBRS2NJVGNCQklnOENsV1l5VWxnUXVUNjN3SEFT?=
 =?utf-8?B?K05JeDdpR240eHE2UUZLZTF1RVd1eWxjUk9xWGRqU0ZIMHpsdEpzeDFlVkN2?=
 =?utf-8?B?Q0NDNWE0cFZFWEpiTEpKaDI0elFENjBZbEJvaTIvVi9XM1oyYTV0VzlBSU5O?=
 =?utf-8?B?VXIyaEpYMEpxbzlaNXR4Z0s5Uk9vb2dNZzdvdms0ZmZtRitFMTFScVBKcXcy?=
 =?utf-8?B?b1k4dGRKMHlpMHZ3YjdqaGZzYktOSWRBcGdiTEhMdFRVcTd0WDJKVFBCbjlI?=
 =?utf-8?B?WGM2akxRTVFBdFY5OU5QZHRPVk1aazZaeSsrV0NWV0gyWXBOTk05NjNWZFRQ?=
 =?utf-8?B?S1FLdmVCK2w0bFZVbWVUamRBVmhRTVV5RFFMTkpoLzJJRVdJT1NOajJkUExj?=
 =?utf-8?B?L0ljSERQRXpxcDlzOWQ4SW9sclI2S2VvRk5lcnZUNFRQbmYyOXZMd2FTN1NR?=
 =?utf-8?B?czlqVWdDTmlMdnpsUUR5NnQ4aERmTXoyZEpsRlZFbkxFZ0JhVy9jUGhPREkr?=
 =?utf-8?B?S052VmFxM2RmODZvUEdNSHc0dnJMY1dRNmxOQWM1bjJ1VXR4MzRDOUU4ekh2?=
 =?utf-8?B?MzRpU2dvemJZWHUvZDRTN2NMaGpDVStmSUs4TmJObDFnSXM0cStTVUk2djIr?=
 =?utf-8?B?TlVOb210akV5aWZKSmt2cU9iZEl6d0ZTanJzM0diMTIxcWVzaWdob1BxM291?=
 =?utf-8?B?bys2eVNxTHBzN2s2OGYrZ1hZRkhPdS94MXdxTVNHbDBROHdLRzAzdkx2Rjkw?=
 =?utf-8?B?dEJleFVLZndGWnZoSjVEb0hUdGhUL0Nmdm1lWDN6enVPZFVRbTZVdFMyT0to?=
 =?utf-8?B?c3dVWXpNVjhWZTdEeWpTS2FVTFQ1SlZhdUlNWkVJNUpuNVpNam1vMG1mTXRo?=
 =?utf-8?B?NXNKNHcxNXJ4eWExNUlDNEl0TjAyYWRha1dwNGl5YVlvaFpUdzJtb09EQmtO?=
 =?utf-8?B?VVRpNCs3NTNlYStGdythZFFyWk9oREZDTko0UXZRN2lnSnpGK0s2NHdlNytV?=
 =?utf-8?B?dlNDREpWdWQ0bTl3eHJqZ3ozdmM4eXNRSWkyY1pGNnU4V1lGSDQ0NE9MSENl?=
 =?utf-8?B?b3g5dU5YS2VFOGMreTluLzhHei8wUWJNem15dXFKR3ZpcjBSSU9Sd2VvdFVR?=
 =?utf-8?B?bUdUOWhNbnBQQWIrUjhabTJFUmpxTEtrRE45VTJtbHFZclEyR0ZwT0xHWXdk?=
 =?utf-8?B?aSt2WHNEWDBPTkdROGpIL05EMjJKN3BYV3N4WXlZM3lNVXNBV1VqUjNjaWlr?=
 =?utf-8?B?REdtUU1nNHFMaEtIdXk5a0NUdWVMdHhZR1d4bUxYRDEzRGhiSzN0N0xRZmVN?=
 =?utf-8?B?b1JNK3RFNHRCTDg0MHBrM0xmeERXY1BOYzRGS21wbTNtenlMQkc5UWJSOTRE?=
 =?utf-8?B?ZFpoWFN4RHBWdVUyekhuTncxOFplWU12blBoeS9RQXRTeFZsYXpGTktLeGJB?=
 =?utf-8?B?ZjVaSFAxVURvdEQ4OWFGbEFCNU5EYkp6RGI1ajFTaUV3VVVULzlpMTZEWndL?=
 =?utf-8?B?SjNlT0huREJhaVhMK09jeEErMVc0b0tSK2NDSmNqMTE0Z0xmNnFRZVJJVm8w?=
 =?utf-8?B?Q0lxVER5MDlVTDVJUjBNMFF6UHQ2cGtRdzl6TmZSSFJvQ21PaWk5eFQvMEFE?=
 =?utf-8?B?REE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aeae4f4-5d8b-4b00-43bc-08de0578dbb2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 08:09:37.9799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TVlR6xrp/cLai/ix1ozJvpa5T+PU0Qr1ATFw3z6ql36JYae9W5kBYPIzp1nRg7nWua09zjVjIolRgb3xQABvXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7494
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

On Tue, Oct 07, 2025 at 09:28:56AM +0200, Christian König wrote:
> On 02.10.25 07:16, Matthew Brost wrote:
> > Stop open coding pending job list in drivers. Add pending job list
> > iterator which safely walks DRM scheduler list either locklessly
> > asserting DRM scheduler is stopped or takes pending job list lock.
> 
> Taking the job list lock and walking the pending list while the scheduler is not stopped is most likely a NO-GO.
> 

I agree. But this patch doesn’t do that — it actually does the opposite.

It ensures that if you need to walk the scheduler list locklessly, the
scheduler is stopped at both the beginning and end of the iterator, or
it correctly takes the pending list lock.

So, what’s the issue? Or is there just some confusion about what this
patch is actually doing?

> As far as I understand it that is exactly what Philip rejected as looking into scheduler internals during the discussion on XDC.
> 

I thought we agreed on having a well-defined iterator for walking the
pending list, ensuring correct usage, rather than having drivers walk
the pending list themselves. From my understanding, this is exactly what
we agreed upon.

> So why is that actually needed? For debugging or something functional?
> 

Drivers inevitably need to walk the pending list during recovery flows
(such as resets, resubmissions, VF migration, etc.). This ensures that a
driver knows what it’s doing when it does so, and avoids directly
touching scheduler internals. Instead, it should just call
drm_sched_for_each_pending_job.

This has actually been helpful in Xe already — when I was working on
scheduler backend changes, it helped catch cases where I accidentally
flipped the stopped flag while walking the job list. Without this, it
could have randomly blown up later if a perfectly timed race condition
occured (e.g., free_job fired).

Matt

> Regards,
> Christian.
> 
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  include/drm/gpu_scheduler.h | 64 +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 64 insertions(+)
> > 
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index fb88301b3c45..a2dcabab8284 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -698,4 +698,68 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
> >  				   struct drm_gpu_scheduler **sched_list,
> >  				   unsigned int num_sched_list);
> >  
> > +/* Inlines */
> > +
> > +/**
> > + * struct drm_sched_iter_pending_job - DRM scheduler pending job iterator state
> > + * @sched: DRM scheduler associated with pending job iterator
> > + * @stopped: DRM scheduler stopped state associated with pending job iterator
> > + */
> > +struct drm_sched_iter_pending_job {
> > +	struct drm_gpu_scheduler *sched;
> > +	bool stopped;
> > +};
> > +
> > +/* Drivers should never call this directly */
> > +static inline struct drm_sched_iter_pending_job
> > +__drm_sched_iter_pending_job_begin(struct drm_gpu_scheduler *sched, bool stopped)
> > +{
> > +	struct drm_sched_iter_pending_job iter = {
> > +		.sched = sched,
> > +		.stopped = stopped,
> > +	};
> > +
> > +	if (stopped)
> > +		WARN_ON(!READ_ONCE(sched->pause_submit));
> > +	else
> > +		spin_lock(&sched->job_list_lock);
> > +
> > +	return iter;
> > +}
> > +
> > +/* Drivers should never call this directly */
> > +static inline void
> > +__drm_sched_iter_pending_job_end(const struct drm_sched_iter_pending_job iter)
> > +{
> > +	if (iter.stopped)
> > +		WARN_ON(!READ_ONCE(iter.sched->pause_submit));
> > +	else
> > +		spin_unlock(&iter.sched->job_list_lock);
> > +}
> > +
> > +DEFINE_CLASS(drm_sched_iter_pending_job, struct drm_sched_iter_pending_job,
> > +	     __drm_sched_iter_pending_job_end(_T);,
> > +	     __drm_sched_iter_pending_job_begin(__sched, __stopped),
> > +	     struct drm_gpu_scheduler * __sched, bool __stopped);
> > +static inline void
> > +*class_drm_sched_iter_pending_job_lock_ptr(class_drm_sched_iter_pending_job_t *_T)
> > +{return _T; }
> > +#define class_drm_sched_iter_pending_job_is_conditional false
> > +
> > +/**
> > + * drm_sched_for_each_pending_job() - Iterator for each pending job in scheduler
> > + * @__job: Current pending job being iterated over
> > + * @__sched: DRM scheduler to iterate over pending jobs
> > + * @__entity: DRM scheduler entity to filter jobs, NULL indicates no filter
> > + * @__stopped: DRM scheduler stopped state
> > + *
> > + * Iterator for each pending job in scheduler, filtering on an entity, and
> > + * enforcing locking rules (either scheduler fully stoppped or correctly takes
> > + * job_list_lock).
> > + */
> > +#define drm_sched_for_each_pending_job(__job, __sched, __entitiy, __stopped)	\
> > +	scoped_guard(drm_sched_iter_pending_job, __sched, __stopped)		\
> > +	list_for_each_entry(__job, &(__sched)->pending_list, list)		\
> > +	for_each_if(!__entitiy || (__job)->entity == (__entitiy))
> > +
> >  #endif
> 
