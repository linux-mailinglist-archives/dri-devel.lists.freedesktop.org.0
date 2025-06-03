Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D02ACC643
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 14:16:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FD3810E8F0;
	Tue,  3 Jun 2025 12:16:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PKaVHe5p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 973EF10E8FC;
 Tue,  3 Jun 2025 12:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748952971; x=1780488971;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=jK8RhY7561wzkYDmyP0/yVF2qnTYXAG/fa48clFn0yo=;
 b=PKaVHe5pVzDx7HJqaRuTjysDL+t9LH9N97kSk8VvTaj5LcTsNS3ey8nZ
 124wmq/sRDTsaehxn3BeJRTte3ARGFBSAscnewXfSVOAWVahgr1MTDu/u
 8md5jEyuzsBHuwF5kBhkDpC1GweaCJ/tX6HRIPDy0TkOk5OEC4Ytlj9xY
 HjJhh1wjG010z0yGTfq9TbduppiEYI5HWM8VvqaxW/q7Cf9w283GH5eC/
 dDT0Bf+lhO2WO1L3tjfZs+9uPz5s2L6e0W3Q3qzMWoEtFtzoY1P2SjJkY
 iOpFpMEkMqwz2SFMMJo9lF7SHu/u9PVPtuKjlYVEPfygPOArjfzSVxqJH Q==;
X-CSE-ConnectionGUID: hWHaXEucT6WT2JoiacYZ0Q==
X-CSE-MsgGUID: 7GbVdiy2TPSu/9+nMnbBsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="51131127"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="51131127"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 05:16:11 -0700
X-CSE-ConnectionGUID: wHfyHj0+QBe8A6V2lqkTXg==
X-CSE-MsgGUID: KbYU9hs/SVelQ7Wvh+vLVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="149613326"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 05:16:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 05:16:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 05:16:10 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.80)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 3 Jun 2025 05:16:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r0i/lf5/NAKPJ5aF/KlnhCIZHb+aEKkCivrToyr9WUbWdNDLCZTNGhoiBGljFvXzdJ5ap0SBPgZDstoJDAcys83/zKdJNxnvQQo0Bk6Yw38iaPYVjCoqeD8rXoxEpWa2LTAw6zS/IB41ETnrSaFOmeGuzqMMIvWliPifNw/zaA2seIuW9HI/dV4S21OUQJbbhJTz6ikRdTEa+YStnfIiTSL6BHYf8/cOIDToZkD76XrI6186ZLEllS47XTiuOY3PEa0kpTmwfalpjr9Rd5E46LDmSv/6aTswlHS0Z6H1uJRCo/vSBwbKrEi96ONyAl7QWyk+UQhriPPiAdVB7FJrTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OML+ed8U6ARENJRJaOhncajVD2yEeX85RoFtH3/Pbzo=;
 b=hPN/z7ZW8flLgIuCgfXoocyOduR72UpGoTDhLwvrlgnCVGCOCMnqFpSZ+c/Soup0II+m69dCcc5DMCen69RktnUG31Cz/nxCsme2xP8UAPFcHmk2TEWz8HdQNQhS9yVuDM7gMEdM1s/4kXuL7buvz6g8NxhSW1exnfihR1BpHijd7Q9f/yr74Xpp8BMleMxqnPI2+yqcZq6Ol7II5UIZLOtbIogToUi/4enNut4xBSGzhu1i79HUpIwqM0x97J0JEhKZQJ9snGzl31oS2ZZT6tTcdkqsDKrR4AcswDiXAe1qTGATORthsVEEaE5QOEieXY8Znuch1qm+q+fnchVsGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by BY1PR11MB8007.namprd11.prod.outlook.com (2603:10b6:a03:525::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Tue, 3 Jun
 2025 12:15:56 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%2]) with mapi id 15.20.8769.037; Tue, 3 Jun 2025
 12:15:56 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
CC: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH 2/4] drm/edid: Add support for quirks visible to DRM core and
 drivers
Date: Tue, 3 Jun 2025 15:15:41 +0300
Message-ID: <20250603121543.17842-3-imre.deak@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 07a19e64-0a2b-4789-3529-08dda2986464
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MmxBNC8xamlaRng5MDZoSzJhNzVRekg3ZURwSkhhL0JuLzNhOEp3NTNsV1l5?=
 =?utf-8?B?SGdlSnBMNmRJcGFQdTVaaDdPS2phTHdBRm5ra3YwUmpGYVY0bHFid08yc202?=
 =?utf-8?B?L3BnL0xWZVA2QjVtOGZ0WEE4QTh0cklmbUJOd2tpNHVQd1UrYVRGb1NDYTBH?=
 =?utf-8?B?emxockQ2akVaWXZreWtvZXBPYUI3bHZ3Rmk3Qk9CVGVMTmlWMk1LSFZWL3JO?=
 =?utf-8?B?RXpZalRQZWVtNklkL1lCTUNqTHUzQVNNVEdFQUd3amp4Ynp6clcyZDJwcDla?=
 =?utf-8?B?NG5OSTBsaE9sWUVKUGYya3lsMkYvcnhKdE1tN1JyT1N6d1loOG40bWN3Vkxj?=
 =?utf-8?B?UEpRVk8ySVZ6cEs0QWlsZUptRnhGa0NJeFpJV3FWR1VxQndwNnAwRHJmRjMr?=
 =?utf-8?B?ZTFmZlVYZzVhRFVKNkNWWmFqTFNyd0dWRnJ5WGxwV2w4REVaQWx2amNRbUJK?=
 =?utf-8?B?MnRNQkpnbTFhUWxrS0VJRkIyQkRSV1dPTWI5RHVsek5JTHlQUkFvOVlhc1ND?=
 =?utf-8?B?Vis4Mi9McnYwWXRuQytwR29RdW1QSG90Z1VMMG1BenFDUm1QVnJZUzdGM2VU?=
 =?utf-8?B?WDM3Uml0R2xUNEFjaXJNcURXNDlqT3QvVVBFSkR0RlZHbnVUUW5zdVZnRFdW?=
 =?utf-8?B?MmlLeEJzeStLT29WWEg3clA2TXA4N2lHajcwSDViMHhHZ2xFcFRjQ0FVUlNr?=
 =?utf-8?B?aTVOMGdsbFhJMkFsTVV2aVNmYjdEeklua1RPNHc1TUNXRUF6OTF4NE1iSEg4?=
 =?utf-8?B?ZGE2STJvbFRmOHlRUEhnVE9Fd3hGZVhDNlRad2tCRGJuVHdqQTZUc1ZLd1Fz?=
 =?utf-8?B?eWt2K2J6NGlvL3pZOEVKcUpZOUhyYWtpeWNSdDZVWkhaRTM2OWtLOHFjOGFt?=
 =?utf-8?B?SmdIMXV4SU1TNFlUS3k5aTZ2UTcyTml0empWTHREeEQyM1lIaXJ1V3NKeG1w?=
 =?utf-8?B?aExDcEx6TnR0bnFNdWFJUmFBcjdGcUkrRk8vNHZGSWJIeTIwM05iaHQ4UWNW?=
 =?utf-8?B?Z3RQaC9jK01CcTl6a2trVHpsblRNR0w1S0JnUzlvZjN1Qll0VWMwdy9YbC8r?=
 =?utf-8?B?K0lzYlZDNlA4M3RSRHg0Q2ZwZFoyQ2tKRzBCMU41UVBQQTVHWU1RVjVMU3FI?=
 =?utf-8?B?Q3VIcThNMTBhNmlkbVlVM2xVb0p6T3NmUDFSOTMxb015Z2w2TEttbk94R25q?=
 =?utf-8?B?MmRIbDAvMUxweDl1bmNhVFEyckdYSWZacUxYYjF3VTdUY2xibCsvMUZrckRk?=
 =?utf-8?B?ZXhlNVRqTkFJV3JRKysvRHBGbm1IeDRIL3Fpb2FmeFNPaDBlRDNQVG9LaTd5?=
 =?utf-8?B?MEE0dEdJVTh1MWh1QTRFTnBYSGxCNG5aM3NLeHhrV3FOd1JUU25xNlJSYUUz?=
 =?utf-8?B?RXkwcUpNSXV6aWY3TGZrQzVkbHRiZ2VZZU0vWFNBSUxNY3lsNG15cGg0T2NP?=
 =?utf-8?B?RkQzNlRnUGlGaDFHcmJTbHVhY2k0OFF6SnJpbWtTQmFhTlZQSzUrbXZYd2pk?=
 =?utf-8?B?endMWmV5elZRblZVT2dWRlplbFhyZUNlQld2YnJYcDIyUTB0bEdhTlpIb0NY?=
 =?utf-8?B?Y1MwT0hFS2FoTEpHTmJ6NEdYZWZhOUg2UjN2TFZVRFZTMUE3cjlJZ1BNeWJC?=
 =?utf-8?B?TWZvb01Pa3hFekMyeGpCMEUvZGtlVTJmWk5lSFkxenBPbVZjSXVrYTRXd2lr?=
 =?utf-8?B?cE85U1loQzJJaGRwREtGeWQwczFnQkw0cEZKSnFONUVSR2NDeTBVWUwwOFVm?=
 =?utf-8?B?NHJUWGFTdXVZSWxQNVAyc0FYRmhpazdiNHRvOEljOUZhcWpZV2tzQ0JzWjB2?=
 =?utf-8?B?QmljMFRWd0xXTGVIbktuU1VUMnQ1bXcwZGp2dW1LRHY2cmZHc0JDS3p5dW1V?=
 =?utf-8?B?OEptckpianB2b3BoNURBV1NZUEN1UVAvMFh6QnpnOHBLL1hEZmVpUk85Rzdp?=
 =?utf-8?Q?JU8B5JqiAwY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWVOMzk5YzUwdnRORmxHdlBoNVRZZFhUTVNYUlVvbUFpK0wyek0vTmhRZTdO?=
 =?utf-8?B?bUdXbVIvOVhFaXB2cmhPRldwRmlsWEdwVWFWN3lKMy9jeWh1Zld2OE1PWkhr?=
 =?utf-8?B?eTc4YU9aL2pNQ28xdmZZL3FLUE04c0hUOXdoRzl2dE5RbHo2U0pCYlhnclNH?=
 =?utf-8?B?RVA3bHovVGUwbzhscDdHb1htcDZheFc4VjZydEM1UVdMMGFPM2RzQ1lDL1BR?=
 =?utf-8?B?VHYzZ3J6S0k5aVNUUDJsc1lFSDUrZ3dyTjlDS1dHeERkK2FpcWVjK0RCNy9o?=
 =?utf-8?B?eUVEL0VBdGU2Zm1vTnJMOUxMcFFSSWMwNmIxbVZDVGxLSnIyYWUxZmlUbFV6?=
 =?utf-8?B?TFFBWmFnQ3o2aWpEbjh2Z3pBcTh4em1GNFJVcG9RWGxib0dBb1dMa2FIc2xQ?=
 =?utf-8?B?enlFMjAra25TeWROcGZEQ2hyRHdmUGZoNnVaaEpNWXdOblNJVzlJczdJMTlJ?=
 =?utf-8?B?ZCtaaExpSnQwOUVPYWVDcVB2RDNwakpVY1JCNmN3bUxVM3NKV0paQ2lTUlFS?=
 =?utf-8?B?T29LeXlPUE16eW5TWjlDenl2eDE3SDVzNU1NdjI2NmNubDAzUXVmNndsQjJY?=
 =?utf-8?B?bWN0bm5Lb0Zsb2ltTU9PR0NuRDNIQ2xrK0JXazFidnZvY3JQdnpPWXlYSUp5?=
 =?utf-8?B?Y0dmU1pUREJTdG04SFFHUUFWYjV1QjFFK2tVTlk1L09OSzZSbnBoSGh0aSto?=
 =?utf-8?B?TFZxQzE5WElvWGhBRklXbU1UOTRrekV1WS9UbVRqYlZ6VnA3N0lBZXYxaEtu?=
 =?utf-8?B?eDBsSmNmWkpMRlhPK1pQdGRkQ091eXRyb1FUQjFtNkFNOEdiKzBYMGgrRVhD?=
 =?utf-8?B?SHRDTGlTMjluRFdjOEg2WDN6b045Z09xeXp1NzIzMXJWM3RiNzJYcW8rOUdl?=
 =?utf-8?B?RWxzWlVFSFd2QXIwNU45VktmUUdiSWZSOEY2QzVJQkw2WXYzbGNTbzhZS05N?=
 =?utf-8?B?Ym91ZlE4ZThBQ2h1Qk9sdG1qcU9wTW9UNit3RjRMNGZOWC9Md2Jrbi9MOVVx?=
 =?utf-8?B?K2U5R3phUzVTL21pTExESVlySWV0cVpCeHZZZVN3RlJGZG9oS3N3OEllOVRE?=
 =?utf-8?B?MSsvcjJvTHc0SDBRUkduaDFqUkNJWEtkamJsKzhOWkxsNzdFRDdvaHRjai9z?=
 =?utf-8?B?MHpIMXAwZ0wwb1FQM2VWcHd4ZTRqdmJOUjIrdHh3RDBuTXNId3FCdDJQR09F?=
 =?utf-8?B?MXFGcDllYkJBdTcyRTVzdHVrcjBHc2dPVHByMVA0ekptS2xCc0psaTVDNFND?=
 =?utf-8?B?c21tUG5TU29nSTFZeHYwekFVdEplbFNQQTVEMGxSRkk5TkNaNmZRaW8yRmJH?=
 =?utf-8?B?K0M3dXRERU1reS9XQlJCbi9KajRLUU1Dcm85dTJKRGh3ZWJEdm5kYVFGaXJB?=
 =?utf-8?B?ODVML0NtdkVxOElEOGdRdEExMHZzakVJaVQ5Sml4QXM4b3Y2TkJIWXdsNzgz?=
 =?utf-8?B?MzFONVZsWnFFV09iNkFuRnlIM01uVDJmNG8zaytZN0VxTDc0TWFLZElhbFpr?=
 =?utf-8?B?c1d2SEFPMS9pamZ0bWRINkhXalZUbmJ1OTZQQ242S3RYSXh3WVhRcHY0MVpM?=
 =?utf-8?B?bVMwbjYyazNHZ0ZYRDdYZGQvaTI4djBjNDk3bTFIL1NaRU16SVNLc0MwYi9n?=
 =?utf-8?B?QnVrN0lhTkkvTjNXcXdWVHVOejlsLzhwQitEUHgwbGp1YkZvSVhhNEJVdE84?=
 =?utf-8?B?SDFzVVFnMlNMaTJiY1BlWkR1U25ZVmJXL3ZlOUNobXJoNU5rTWJGMHhHaTQw?=
 =?utf-8?B?S1dETDdRS0l4eXJxMTRZSllhNkNMa0xja1M0QmY0allwRDV2L0hhNmpEWmRN?=
 =?utf-8?B?ZWxMN3htbHdxcUV4L01TU2VBQWZXOWJ0WW9xOTZic01WajlaQnhtM3hPOFVU?=
 =?utf-8?B?MHp5WTJpMlJGZ0xDQjJkb2JuQ3FzU21XakVFUTNtY20xZm5VR3NvZ0xiTTBI?=
 =?utf-8?B?Q3luQ1lQeXVCL28vMVVhOHNOMmM2UkNNbXVkajdUS1ZFdlJDZGJ2NURybjJ6?=
 =?utf-8?B?ZzZYaGcxcjZKcjNiUEJXUEpYeVVqbEpSYllhVitLZmtBK0VVVm0wYkZGRFBD?=
 =?utf-8?B?QmIyTlJoMjdpNVRzMHJvaExiRkRKRWdPRWRHSFJRZEpxS2NzSmZtWCtzSG5h?=
 =?utf-8?Q?vwgLwFGqz1joBiP3b3Xf+UVoU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 07a19e64-0a2b-4789-3529-08dda2986464
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 12:15:56.1381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FhIsa+QSMD1VMpTdG3mnQFthGytra05DZzun5WSRsHDXeXyQCwBMzM7gze0iQyuk6fKIZqhriuZMAxtPoa9PKQ==
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

Add support for EDID based quirks which can be queried outside of the
EDID parser iteself by DRM core and drivers. There at least two such
quirks applicable to all drivers: the DPCD register access probe quirk
and the 128b/132b DPRX Lane Count Conversion quirk (see 3.5.2.16.3 in
the v2.1a DP Standard). The latter quirk applies to panels with specific
EDID panel names, accordingly add support for defining quirks based on
the EDID panel name.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/drm_edid.c  | 33 ++++++++++++++++++++++++++-------
 include/drm/drm_connector.h |  5 +++++
 include/drm/drm_edid.h      |  5 +++++
 3 files changed, 36 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 74e77742b2bd4..e867315253493 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -114,15 +114,21 @@ struct drm_edid_match_closure {
 #define LEVEL_GTF2	2
 #define LEVEL_CVT	3
 
-#define EDID_QUIRK(vend_chr_0, vend_chr_1, vend_chr_2, product_id, _quirks) \
+#define PANEL_NAME_ANY	NULL
+
+#define DRM_EDID_QUIRK(_panel_id, _panel_name, _quirks) \
 { \
 	.ident = { \
-		.panel_id = drm_edid_encode_panel_id(vend_chr_0, vend_chr_1, \
-						     vend_chr_2, product_id), \
+		.panel_id = _panel_id, \
+		.name = _panel_name, \
 	}, \
 	.quirks = _quirks \
 }
 
+#define EDID_QUIRK(vend_chr_0, vend_chr_1, vend_chr_2, product_id, _quirks) \
+	DRM_EDID_QUIRK(drm_edid_encode_panel_id(vend_chr_0, vend_chr_1, vend_chr_2, product_id), \
+		       PANEL_NAME_ANY, _quirks)
+
 static const struct edid_quirk {
 	const struct drm_edid_ident ident;
 	u32 quirks;
@@ -248,6 +254,9 @@ static const struct edid_quirk {
 	EDID_QUIRK('A', 'U', 'O', 0x1111, EDID_QUIRK_NON_DESKTOP),
 };
 
+static const struct edid_quirk global_edid_quirk_list[] = {
+};
+
 /*
  * Autogenerated from the DMT spec.
  * This table is copied from xfree86/modes/xf86EdidModes.c.
@@ -2937,13 +2946,14 @@ EXPORT_SYMBOL(drm_edid_duplicate);
  *
  * Return: A u32 represents the quirks to apply.
  */
-static u32 edid_get_quirks(const struct drm_edid *drm_edid)
+static u32 edid_get_quirks(const struct drm_edid *drm_edid,
+			   const struct edid_quirk *quirk_list, int quirk_list_size)
 {
 	const struct edid_quirk *quirk;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(edid_quirk_list); i++) {
-		quirk = &edid_quirk_list[i];
+	for (i = 0; i < quirk_list_size; i++) {
+		quirk = &quirk_list[i];
 		if (drm_edid_match(drm_edid, &quirk->ident))
 			return quirk->quirks;
 	}
@@ -6660,7 +6670,10 @@ static void update_display_info(struct drm_connector *connector,
 
 	edid = drm_edid->edid;
 
-	info->quirks = edid_get_quirks(drm_edid);
+	info->quirks = edid_get_quirks(drm_edid, edid_quirk_list,
+				       ARRAY_SIZE(edid_quirk_list));
+	info->global_quirks = edid_get_quirks(drm_edid, global_edid_quirk_list,
+					      ARRAY_SIZE(global_edid_quirk_list));
 
 	info->width_mm = edid->width_cm * 10;
 	info->height_mm = edid->height_cm * 10;
@@ -7566,3 +7579,9 @@ bool drm_edid_is_digital(const struct drm_edid *drm_edid)
 		drm_edid->edid->input & DRM_EDID_INPUT_DIGITAL;
 }
 EXPORT_SYMBOL(drm_edid_is_digital);
+
+bool drm_edid_has_quirk(struct drm_connector *connector, enum drm_edid_quirk quirk)
+{
+	return connector->display_info.global_quirks & BIT(quirk);
+}
+EXPORT_SYMBOL(drm_edid_has_quirk);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 73903c3c842f3..996ecf229f8c7 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -847,6 +847,11 @@ struct drm_display_info {
 	 */
 	u32 quirks;
 
+	/**
+	 * @global_quirks: EDID based quirks. Can be queried by DRM core and drivers.
+	 */
+	u32 global_quirks;
+
 	/**
 	 * @source_physical_address: Source Physical Address from HDMI
 	 * Vendor-Specific Data Block, for CEC usage.
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index b38409670868d..3d8e168521c82 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -109,6 +109,10 @@ struct detailed_data_string {
 #define DRM_EDID_CVT_FLAGS_STANDARD_BLANKING (1 << 3)
 #define DRM_EDID_CVT_FLAGS_REDUCED_BLANKING  (1 << 4)
 
+enum drm_edid_quirk {
+	DRM_EDID_QUIRK_NONE,
+};
+
 struct detailed_data_monitor_range {
 	u8 min_vfreq;
 	u8 max_vfreq;
@@ -476,5 +480,6 @@ void drm_edid_print_product_id(struct drm_printer *p,
 u32 drm_edid_get_panel_id(const struct drm_edid *drm_edid);
 bool drm_edid_match(const struct drm_edid *drm_edid,
 		    const struct drm_edid_ident *ident);
+bool drm_edid_has_quirk(struct drm_connector *connector, enum drm_edid_quirk quirk);
 
 #endif /* __DRM_EDID_H__ */
-- 
2.44.2

