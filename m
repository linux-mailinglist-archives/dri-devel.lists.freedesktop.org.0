Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9FDCF67D6
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 03:39:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C0D10E0CE;
	Tue,  6 Jan 2026 02:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f7Rwd9ZA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0368310E0CE;
 Tue,  6 Jan 2026 02:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767667157; x=1799203157;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=aAs6jcxSevug4DdScHUfgDeVbVJ7mbgEDJrW6ld9LiA=;
 b=f7Rwd9ZAytqjDC28h4EnGgHHbF+WN7buEUHfBQ02+CtZaOl291CcHalP
 tcCcw87BDAGJBEabrAaSuiw7cF9kPW17CkXVQZVXV5XP2pv7+kDHidPAK
 iacsamf2VsP0Uhy1B1vS60garw3Je3EsKKP+RFKWxeLu+eKT3U5XeGbp0
 Wi4Jo/09UeI+SXr2GtEpmPh3DEyk6/rfHf+9fzQU+S6F7P+AckNnVVsB+
 Chpcd0iRL+8VYmLXpEqrhwI9XuoBPil5EQteNE+yIeGO0hfbtClI+0Tw1
 2fjCjSFJJ+4zP1WTJX9e+elGBTdUhJhKiYEr5pklOBlNd9LtyKb53zvyg A==;
X-CSE-ConnectionGUID: ispqjLVjTlu5c1JWR4iDOw==
X-CSE-MsgGUID: 3BpViQW7Sdy2upvVS/4zKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="80149968"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="80149968"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 18:39:17 -0800
X-CSE-ConnectionGUID: VU7hUMtITR6/yUp1wG/1sw==
X-CSE-MsgGUID: MjElBguLSiOtXaU8t9rpsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="207013476"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 18:39:16 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 18:39:16 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 18:39:16 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.19)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 18:39:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qBid8dpuN27E4Q2cnu66q2ozwunefYIXzEUym0lCZjbcZtaE57J6Yc8SwRNQ8OTMkmg/cAqMXbYLkTxU52iWMRJ9qTeTRaVJcgC5d2k52RuoNh5dOenjLYxI8x4hv1gd6g2Lh8bo3ixvlolNc4anHX9Qul/g0YMU73Ecd0f6PfoYHLOHNV6iMpcfBqcTSVcu67Ldc/4ZNhpN7iitBIGhKZRe6ygMdj9R4lSTDcGm6jO+9T76pP/cMbIkCmb2vZgHmpvX+++PceCtgeyyL/lMoQhT5IvBiKIoYPIsbBaDheAjgSdIBuAhL3cgteNBko9z+7WeqzYsFMqLYxFRdLHdUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5BrXm4y2GIn0nIrcB1n0g1K7fQTcg876/10DpD0H86I=;
 b=xPiRKaQ9dqcXFpfu0wXtHfHC/S7O/Z7sz0lRtpR1FYn7gb9nu+yXXYNBobpCDA7030DSYPQdL41VV/WJwado1SlA1IXyVPpitKdM8m8a0iwDNiBSQpRO3nLY/Tk7WjJJa+v7dMz6Dq86d0GYGkeMHqdXrR1dZWByEDuVxgtRG1R0ME7NQWe2u7HCRk37FwbKoxA/oqzYe9nBKCTUrBHdW9UQ8VMOFgRBprwac92Lpi3CWNDciZEfwH43tFrJOHGXwWp4j7c+FBvckIIUSeNHJy1acj8BcLRjBuwZly+MbO4FjIhMIBLQeRIGvHSRiur4u3lOZVLpOT1Hmy4aHGAHJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7530.namprd11.prod.outlook.com (2603:10b6:8:146::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 02:39:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 6 Jan 2026
 02:39:08 +0000
Date: Mon, 5 Jan 2026 18:39:06 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Wilcox <willy@infradead.org>
CC: Francois Dugast <francois.dugast@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Andrew
 Morton" <akpm@linux-foundation.org>, Balbir Singh <balbirs@nvidia.com>,
 <linux-mm@kvack.org>
Subject: Re: [PATCH 1/4] mm/migrate: Add migrate_device_split_page
Message-ID: <aVx1ylEmJOfsrh98@lstrano-desk.jf.intel.com>
References: <20251216201206.1660899-1-francois.dugast@intel.com>
 <20251216201206.1660899-2-francois.dugast@intel.com>
 <aUHCZpnTNqv8wfdc@casper.infradead.org>
 <aUHRpvsa80wg04r7@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aUHRpvsa80wg04r7@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BYAPR08CA0040.namprd08.prod.outlook.com
 (2603:10b6:a03:117::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7530:EE_
X-MS-Office365-Filtering-Correlation-Id: 92dfcd19-adde-41a0-c6ca-08de4cccc482
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Yk9wckx2R3lPVGhURHNIR29ReEZ0SUNJNWFYTkdrZ2ttSkxSMWZ3Tk9JSkpG?=
 =?utf-8?B?eVN6Qk5pRTNZWWVlWHRTK05HN3VhY21LTEJzQ0lJYTNFclJlQURTaUVaeEdD?=
 =?utf-8?B?NUdUbEFUc28rL05NVEh5NzVzUmpHZ2VIU0FTbjF2LzBLU09CUEhtUS9RRzNt?=
 =?utf-8?B?b1FKTVR6akFnVTJEM2FPRlFvN3duNHI2YlhXb0xnYjAwbU16UGZyNGlyQ0tU?=
 =?utf-8?B?Ui9UUzI2ZGJGV3krZzNpb2Y2TjlmZE9yRjV3U2UzRkVqYjVQNWtSS3NhWnpB?=
 =?utf-8?B?aXgzVjc3ZUxIckthdTdTUEJSelhhZTgzZFBsRzYyS3VoQk9QZjFCcHMxbWNL?=
 =?utf-8?B?azVZbWFMbmJ0YmgreW1Pa2pvbFJuZ3RLeGQ1RnBOOHlQZ000OTVmd1V0Ykp5?=
 =?utf-8?B?dHowa1dxRkpZempDemJsUkxIWEQ1RlFpRitUcmxkYkkvamZFaENUTFdGVzBR?=
 =?utf-8?B?M2ZYRHFOOHRnOHl0eitSMGlLK3R4bVFXUHBqWVo3cmo5eU9ZRFI0R0IyVTgw?=
 =?utf-8?B?UlhGNVRmOXNFU0xTK1BsOVI2Z0c1dXZiQkJTZFBZL1hhd3NWRmdsQS9qa1hk?=
 =?utf-8?B?SjdrcjhMdlNyOWVRU3E2bGNHTFZEL0czVmp0cVEwS2RDMW0wVFQzKzhRYlNF?=
 =?utf-8?B?a0VoekxzR2pzRWxDWGVQcXM2UVpYaGNlejdLeW5wZlhQOSthK25WdzlsRDNU?=
 =?utf-8?B?SWJ5SW9zUFZyOU9vUGdmNFZjMTVGSCtsVU5WbkREZEFIc3cvUi9jUFBxNFor?=
 =?utf-8?B?OU44T3NwM1g3N3pCQTZrWmluRzJKZHVlZDhFUXFVcDlJNzFkU3BZTFdaWTFw?=
 =?utf-8?B?ZWp1UWZ6SWROTFVHczNWK1VWWEhIVGdGMFJnc0hIMzl5RERhU3h5V2xTUjJ2?=
 =?utf-8?B?TU5ZbXhDdWRGZk4zZURlV1JTckZDaFFLdEZERnBrWnpYZ25maXZJbTk3blFJ?=
 =?utf-8?B?VWVSRVRIbXlnTnFpMmt6SXEyMHBWNEhwc21Sc2dudGZJQUg2R0dzaGI2U1pn?=
 =?utf-8?B?M0FMVE5BSUVEd3lrUWw0Y3VHU3gvUXN4YUNKOVVJL3gzdE1QUktyVlJTcGFH?=
 =?utf-8?B?NDNweFV0OGhnTDJzeGU3Y1ZWbmd6eWwzREJvTEZwSlV4RW9iL0lhVUloVFR6?=
 =?utf-8?B?SFJKZzZCUHVEdkloQ3hZdWtZWnQ3Y2toRFB6aVlCNEFjWG1qSzJBWlkrNGll?=
 =?utf-8?B?ci9Ya2t6eTEyd0ZSTjZEWnAxVkJOZHBVTVZCclBOckI3cGY1ZUIycW00Z2FG?=
 =?utf-8?B?L01vak5wREpMV0w2OUxUbXY5Rm5Kdk9VSzRmYWd3WkQwMlhkSUtCUmdONHhN?=
 =?utf-8?B?cUdTODU0NVU1UXhYL0gySHd3eDlob3lsN053VWo4ME1mMGJXb1FrK3BtUzFF?=
 =?utf-8?B?K3dUQi92eEVvYmtvZFdHc3g5dGFydVJHWHBHY3U1VFl4SWhweHkzRk1zVkVn?=
 =?utf-8?B?RG5ZdkxEd0h6bkxCMzJXQmFScTZJWjVRQmVoMVlBbGUzNCt5UnpsV1lleVFt?=
 =?utf-8?B?ajN4RkgwUmREcDlIQXd0OUdVTGE4aVpOaVFLcXloU2ZpODlGaHNUTjZnejR3?=
 =?utf-8?B?RkhkOVZHMGlBN2pUZFV0MVZFUjAxSitWUlVPN1R5RnJxeEJYSnlqUjVOTlZV?=
 =?utf-8?B?UWd0T0JpeElYNVp6VjFlZ0psN2M2RUFBN2ZzcVQxUVNqNEFZd29nNGZ3bW1X?=
 =?utf-8?B?OGZSSHJXZ1MyRlRUOVQyWXZhWEZ4eHVpWitkaDVoUklqdkFMSVc2bk41Rkt0?=
 =?utf-8?B?Z2hsNFJEZi9jT045bFVhSkE5a1k5R3BUdzhIOWlMenAxU21rMndPYVd6bE0x?=
 =?utf-8?B?bmZmN0cvRUhvQk5BNXBuT21uTzFsdG5idmFqamZWUDEwVy9GWHBlL00rZWJy?=
 =?utf-8?B?dkVGMExUdUFBQ0xycEhyY281MXBnYnF4QThFTWNEL2Q3MXhJa1JHRjVNc0Rk?=
 =?utf-8?Q?v3XlWwjgNR6IKY2HSXscuXkkmnsLeNHV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXNWdzdyWHkvOUJKSDhrWkFUdGF1Q0pPcHREcCtDcFVtUDhxSGNhYkJTSXpK?=
 =?utf-8?B?ZzI1am5DdVRFNnJNcDRLbGY1MDNOK1pqeHpCb3N4cDRmMUVLL3FiYzgvd1Y2?=
 =?utf-8?B?THBmcHNCRjZ5RzVoNU1nY0NROW9laEhlMDZTczBMTEs5VHRyN0g5d2hUUG5P?=
 =?utf-8?B?SlFtdVV3YWxVdExzTVliajA4dktvbS9IQWMwTG54MDdKdnhNQjR3TmRHVzdm?=
 =?utf-8?B?Qm00eE9lcmlIenh0TCtDOGlSRjlFV1pKd2JwWExxS2R3RWdncTV4UUtORHQy?=
 =?utf-8?B?K3ZvTlg3NC9xM0doZ05sT2I2VHBHNld4aGp1bWp1cDhZdU1OZ1pLWmVETVE2?=
 =?utf-8?B?ekFCVmxRMkhhZkxKQTJidnJSYTBGRXgrRStIM01YMFZ5bk96QXBiK2F4UEt1?=
 =?utf-8?B?azF2R2FtdzBIazJRbDd3N1h6dTlwM2tRTk9HM1d1b1BDaGt2dkJ4MzhkTktI?=
 =?utf-8?B?NzhLYzR0VGNMdWdnQlY5aE1YeXg5c3RWVHdGM2JxV0dtL3graE1lVXQyYWJE?=
 =?utf-8?B?d3ZBR01IaUwwc2JRM3UwampGNnIwcGloYzNwYTZXdWdIcmQvdHdaUjljNGla?=
 =?utf-8?B?RkJVK1k1aGlSRnhPR0lBWGphd3JTcTU5dUNxNHdlL3QvZEw1aTZBY3BDNHkx?=
 =?utf-8?B?bFBmL1ZnQmR5c3p2OEtvbG1VcWFnb21RcVNrLytzbEtQUnBia0IvcUl3cXVC?=
 =?utf-8?B?MG5xM3gvWStCR1loUEtTaE1FQ0hBZ1VGYlYrWG5xSzNSa0hwS2FGR2RsMlZW?=
 =?utf-8?B?OS9xajFiOW9Rb2Z3cDNUM0NKeG8zT2xzdEpSYjlveTRUNTlVM2FsN2FrQnhU?=
 =?utf-8?B?ajNQdWt0RTdNRXhWR2RFL0ljRnZaYnZlanh0UWVFTnlWM1JNTXZNUUlQRm1q?=
 =?utf-8?B?NFJ6Vm5xV0lOSGVOSTNqakwvckcrSXhJd0Z3Y1NvcS95YzNhRmZwUDZoZWg2?=
 =?utf-8?B?QksycWlzVGZHYVJycC9sZmlZZlgyWlIxampjbGtaSTFhNWNIQXNmdEhFQlp5?=
 =?utf-8?B?K2gvbm1Xam1TdnR1WEkvNFpQMDJhVnF6R1c2UHMraVZYb3VGU0ZoOFlDVVNs?=
 =?utf-8?B?ZGg1Nkg0dER5VnE2a091Q0pGMzVsNmVHS0ZyWXIyYkRsMUo5NWlGNTVmanBr?=
 =?utf-8?B?dW5CN0ErWXdwWHRmUGR0VDdITWxYOSt2Q2M3VDhEb2p2UjJhUWRxMXZyL3JQ?=
 =?utf-8?B?cStSZlR6Q2NmaTE1Q2RHaTZ1WTJDOVZXNkVGZkhHcG1rdThvb1RNaFAxZGFM?=
 =?utf-8?B?dWVFUmFLbStyUTh6ZHZwYURsV2tmL0Jrc3Bza01iNWZZdUZkNk1BNExLdWQy?=
 =?utf-8?B?UFZrMCs0VHFTalJqVUVsc0hybzcwcmF1aE1vbFY3NVkxUS9mVTRUQTUrcWh5?=
 =?utf-8?B?TzNLNmpzZGtWY1JsYWpNR2RrNlJzbG9ycXcyMUh5dzFHNlFzdDlpdGd1Q2Jl?=
 =?utf-8?B?VmJZUTEreXVXeEFZQ2luUXJ2RlRsS0R4cWp6OGhXZkxkaHNKc1JoUUwvQ2dz?=
 =?utf-8?B?NFBoeVppeGlmbFlzeEd2MWgwT0w3dUhYK1cxL2V2NExFMnlwSWhsNHpmeVBh?=
 =?utf-8?B?dVYwYkY3bGl6dktGdFMwUzJhMGpSMEdlMERTbmtNdS9xL3pUdmIwdHg5aFhY?=
 =?utf-8?B?Yy9xNm02OXBKTXZ5eU9OTC85cENxUHFGYTh1ck01V3FWN3RZQWRFclpPZ3NO?=
 =?utf-8?B?anN0NXNSMHo5aVFNOXNPazhEM2hDUit3aGtnVHluRFZ2VlIzMWNIanlkMVl6?=
 =?utf-8?B?V1poYW5FTTlGSzQxL0hSWHlTZDd3Q1JRdlYzOWd4VzRWMFlaM3VHc0ZwbnJO?=
 =?utf-8?B?Y242VmNYTzlTZEJSaXUxSy9Kck42aUxYa0FVN2hlc2lKTGI4TmExL2VUdmZ0?=
 =?utf-8?B?QzlCcnJkZ2xSeFVWai8xOFdoUVV5UHNGRm5uYzJ3eEFqRk5xV1Rka0M4UVp5?=
 =?utf-8?B?cnBzMjRyWkxwbDI5bzhOUTNoZUhGbEluRU1OM2hFZTZiblFtR2RzMEJTMW1P?=
 =?utf-8?B?eGxpc2FOZEZCVzRZaVVxYmFHOEEveUtoOVVJa1R1Vzgyd2RSRDg4U1NvVFY4?=
 =?utf-8?B?dWFKWXZyWmNEOHhoSFA0ZzdhZ1ZoZ3B0RWtpWVNXa2hyMk9nTFRFUEEzODNE?=
 =?utf-8?B?N2hHL2FPOFpuajlMbnUwVklsblYvTDNOajl6K0dHTGJWWkZmSEkybjdjODlP?=
 =?utf-8?B?OTZFdGFsY3A4d0ZrMCtjd0VqcjRoNDlVNlRmYnoxMEVDdEcvZUpVTlozUGIr?=
 =?utf-8?B?UXdBVnR0aDB2cStiRE4zYW92UmhaOVJvN05udDY0MEdFQTZ3ZmNkMklQNFM1?=
 =?utf-8?B?VjBrT2NtVjNvN3ZJRU5jMXNlV1lwcWN5bzhnMFVWUGsxTlVaVlh3L1JCZnMz?=
 =?utf-8?Q?gLaPhRhy/gPgUJuE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92dfcd19-adde-41a0-c6ca-08de4cccc482
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 02:39:08.8837 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ys5UKI+n+EY/fO/zDdYX0vOINJGaE0EMIdJXwdnMATFoeTbq6ephbfBWKCB1Ew/c9K2cBx6qjlBy36gmBLOcXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7530
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

On Tue, Dec 16, 2025 at 01:39:50PM -0800, Matthew Brost wrote:
> On Tue, Dec 16, 2025 at 08:34:46PM +0000, Matthew Wilcox wrote:
> > On Tue, Dec 16, 2025 at 09:10:11PM +0100, Francois Dugast wrote:
> > > +	ret = __split_unmapped_folio(folio, 0, page, NULL, NULL, SPLIT_TYPE_UNIFORM);
> > 
> > We're trying to get rid of uniform splits.  Why do you need this to be
> > uniform?

I looked into this bit more - we do want a uniform split here. What we
want is to split the THP into 512 4k pages here.

Per the doc for __split_unmapped_folio:

3590  * @split_at: in buddy allocator like split, the folio containing @split_at
3591  *            will be split until its order becomes @new_order.

I think this implies some of the pages may still be a higher order which
is not desired behavior for this usage.

Matt

> 
> It’s very possible we’re doing this incorrectly due to a lack of core MM
> experience. I believe Zi Yan suggested this approach (use
> __split_unmapped_folio) a while back.
> 
> Let me start by explaining what we’re trying to do and see if there’s a
> better suggestion for how to accomplish it.
> 
> Would SPLIT_TYPE_NON_UNIFORM split work here? Or do you have another
> suggestion on how to split the folio aside from __split_unmapped_folio?
> 
> This covers the case where a GPU device page was allocated as a THP
> (e.g., we call zone_device_folio_init with an order of 9). Later, this
> page is freed/unmapped and then reallocated for a CPU VMA that is
> smaller than a THP (e.g., we’d allocate either 4KB or 64KB based on
> CPU VMA size alignment). At this point, we need to split the device
> folio so we can migrate data into 4KB device pages.
> 
> Would SPLIT_TYPE_NON_UNIFORM work here? Or do you have another
> suggestion for splitting the folio aside from __split_unmapped_folio?
> 
> Matt
