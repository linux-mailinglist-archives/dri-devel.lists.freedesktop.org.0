Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8121E8D7BFD
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 08:56:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D5610E2C5;
	Mon,  3 Jun 2024 06:55:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZqkTFvBa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFAD810E2E4
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 06:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717397757; x=1748933757;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=m/67ci7iTz4LQRLnSxwm24leIupVMt42u+MqXAcMtrI=;
 b=ZqkTFvBalM/C3iAVApZhoqDlutbLq6n+Ch4nNdP7ulzJ9c0QszYZFPeO
 BxPaCvFMRRsXVZaWXmPM7MESgwX7WXwrq/d4I6UP6JC4p+Hat354tRAS8
 SsohA0kpXGbOgKrXuq4LyltarS2Eg9AMa9bii7a//QV+SocCxUUZ7cmS1
 91M3nVGcGR8l+4kDSKwPKCMf0YCqGC8YhYqnY2YctxyoFiTTBDwT0mhYm
 KUyoELGETKw/ejsG76ajR1V84OAG05sggrKMK5I6QfoMjk1zv3XQUKp+6
 QK4viZQIiYW/hzjCvr16JSvyem4EyVtUI5bqpLlIEEuBlN5aZB8BIbyH8 A==;
X-CSE-ConnectionGUID: 4bQoPEcbREadboALAnWTTA==
X-CSE-MsgGUID: tJHd+wMFT7+TV2JMYWWhXQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="11868817"
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; d="scan'208";a="11868817"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2024 23:55:57 -0700
X-CSE-ConnectionGUID: AGi7g+E8Sw64Bqc9bo/KFg==
X-CSE-MsgGUID: AsWjuwsjSoyJObB2B5St1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; d="scan'208";a="74270993"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jun 2024 23:55:57 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 2 Jun 2024 23:55:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 2 Jun 2024 23:55:55 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 2 Jun 2024 23:55:55 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 2 Jun 2024 23:55:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dPIx6gViLdwVsr1BTVmZRQXm6VST2Kw2Uow5oUzBvaGOrA2XGnQ5C1j1hOvrIwiS0afp0T7G1AeiNrCmkyVioexs9Xz0SVZWo1xeFkuoYZP8HdxhqyAxs7URsEB2qFt/U6/WAxVD0rWkNXrG5b5R3ry31B85UPASe/g8Fvyd5n/8i7CMUf7/LCvZXos0nJ1zLCwskPvwwuzVP4YWrYJoGm76pk0KEn5yRUMm3cqVP7wLDAi1JQRU0UyaUltmMZmLuQ3e9CFWF9Bjo31MQNwAYZh6i6zR36FDLmHd4zHxn8x1282Xv//283s03g9JUdBfdY0ywTnrCz8Lq9ASkzkBww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F0WWIRYQe0uNgnSZ8bDcUf50lUinj/Bw6BoSds1zLIw=;
 b=VvElwl/fI7V9r17jprqJnHTsvNKsIntsz9Tx91KVihIQBQl2NrJJJlQMMHO2M8xvH0CJBiSy46XcJTZIQk/zXRCj1MPGz8cC7cbShWBBY3W/SMnX2WNnjEb62r88Mw6DZIVkCJvIdEUStdrGH2TY5tiIBRk4V/45QHqirT3PfhkURpnxdpDYRSbnSFtLbneF6IQ6OtRpXwcNDM+QOb6N+eBU09GMFTWauAQv0iIFwQWY+kJSMGKszfTwA/TJ7wQcBMIcJDVfiIBKNdz03Yo0Bo1R0AQFEM9scu07guX5j2BGIdYrVEfVn+SpxrTJPTVXotEq+THLBbcsnEe1rOtP9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7388.namprd11.prod.outlook.com (2603:10b6:208:420::8)
 by MW4PR11MB7162.namprd11.prod.outlook.com (2603:10b6:303:212::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Mon, 3 Jun
 2024 06:55:48 +0000
Received: from IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::12e2:8615:27f6:95f5]) by IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::12e2:8615:27f6:95f5%3]) with mapi id 15.20.7633.018; Mon, 3 Jun 2024
 06:55:48 +0000
Message-ID: <5be44989-d259-4ede-90db-297046776cb8@intel.com>
Date: Mon, 3 Jun 2024 08:55:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 06/10] drm/ttm/tests: Add tests with mock resource
 managers
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Matthew Auld
 <matthew.auld@intel.com>, Amaranath Somalapuram <asomalap@amd.com>
References: <cover.1715767062.git.karolina.stolarek@intel.com>
 <fc62475ddc5ee32f9be197ee72b146209f31972e.1715767062.git.karolina.stolarek@intel.com>
 <43d9493358353fc40df56023e474ae827dbfd2ec.camel@linux.intel.com>
Content-Language: en-US
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <43d9493358353fc40df56023e474ae827dbfd2ec.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0013.eurprd04.prod.outlook.com
 (2603:10a6:10:3b::18) To IA1PR11MB7388.namprd11.prod.outlook.com
 (2603:10b6:208:420::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7388:EE_|MW4PR11MB7162:EE_
X-MS-Office365-Filtering-Correlation-Id: fd112558-af81-4527-f114-08dc839a32a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3dyUlpoNHBnSkRxREdnOWc1elJBdVpybThZSFM1bDBjY09XMndCTER2bTBV?=
 =?utf-8?B?Zm0yOU5rbkZ5dG1GM1c0RWQ1bG90S2VqQ0hHQ001NnFidXZyWlFCQlRMRGNi?=
 =?utf-8?B?dmFGSEx4WGVIbmloQW5HWVptZHdtdHVyblMrWjcvdzEvMkl2SUtQUHI3UDQy?=
 =?utf-8?B?T01KRmkwTThUOURsMW0yRXRtWEcyc0gxRWlBWmJDZ05xenZBM1R3L3pJRE9Z?=
 =?utf-8?B?OGtnbWY0Y3hGQ0Z2RzFqVW85bDg5aWNrUWpGdGJLYUJ4dzQyM2VmN0Z3Ynpq?=
 =?utf-8?B?cytzRzMxOXlrNjZERm9XK0d5ZW9iR1RpOVdRSDhpMDNqQXRDaEhqUTZkYkt6?=
 =?utf-8?B?RXd0WHUvNm93NllQamJWMnhBbm1LcnlkbStUSGNMM0pNWGxKZkNOdDgycGxH?=
 =?utf-8?B?Y2piMTFpS3ZmSGhDNFlnOW9mNXFMVWxsSTVHMko2YkRyRTBXaGprb1ZyM0Qw?=
 =?utf-8?B?eGRMV25CMDlUZmNGbFpLQmpmWW81VEVsbm9CVGUzejJmKzUvN3oyQXdhOFRF?=
 =?utf-8?B?N1BRcG9leC9RZHg3QUFmOG1rVGFmc2xxV1lBS3hYQktVYjhYS3VlYmU4UHc3?=
 =?utf-8?B?VkJzekxjYlMvcUsrZjhEbkttYUdsSmNTb01sRWJTVWdlRUQ4a2hQZlZrSXYz?=
 =?utf-8?B?TVBYZzVLeUpyNm5TaDJKRDlSVGllM2RLN3ZLVXprUktRa0lMQXM2aUlkb2tz?=
 =?utf-8?B?K0tUeVNSTWNMeDZoekpnTHBiYXpnN2RjNk0za1FpU2xRd3IvZEwrMmxuS1Zk?=
 =?utf-8?B?enRxbE9TcGhCU3k2NmtDWUZQdjA1azBRTjUyNjBOM2U0QTl2ZlgvM0w0cWVQ?=
 =?utf-8?B?K2FmMUdJQm02LzByT1dqR09tU2Q5SFFkam82TTBvZU55NU00clZHOUlWZEl4?=
 =?utf-8?B?ZTFtdGpZYnBaQnJNMlRzNXBTY2wxMHF4Zk12RVdobG10bWFPUUV2YXc2eG8x?=
 =?utf-8?B?NmNXTm15ZmNtNUlpK3ZjeENwd2JDU3BEM2ptTXdyb3U0TW1wbnNzNU9ya1hL?=
 =?utf-8?B?eGlFSWpVS1A3Wi85c2xVdEVxNFM1N3ZrWnRacFI0OGp4U3VQa0NYRUJpN2JS?=
 =?utf-8?B?MHBxZjVXSHZ1SXRCY1BVWnFYeCtLQlE0bXlibko1WTV0RE1zM1Q1QktGbWZ0?=
 =?utf-8?B?bG5PS0pLNW5zVWR5V3NYT2dpSEh5TXdKQ1NUa1I5L0ZqNC9WTUhVSHVad3lq?=
 =?utf-8?B?U05tQjYrZ0YrWS9yb0MxV0hFRVMrMW04UlZhNi9vRmRFOC9IcnBIcStYZ0t5?=
 =?utf-8?B?aDFLYkRTdUwxYzc0WmhrZjk4dkNvVEJFdk1Kekh1RktodEc0b3BsU1FGU1RG?=
 =?utf-8?B?Wk0rejR1VTZsYldHNlpWcWdpSCtTWGR6djN0ME1TaGpvTmRvaFJJVjI2L1I3?=
 =?utf-8?B?Nk10YWw3c0U0SFlZZnpvZ3pwUi9JaEtMdFBXc3dkaHl2cFVFUFc4WmxrS3Av?=
 =?utf-8?B?SVV0UGZwQ1o4dytaNDFUU2N3bkdHVG52RFhWYmYrWWRDYktKZk1IOGZnMVZL?=
 =?utf-8?B?bDl5NGZ6R3lKZWt5NHpSMG5UdG9COThnTENub2xDYUh3eGkxKy9lWGtkVkZo?=
 =?utf-8?B?VlNCaUhxQkxhRUw2SkNVZFBDUzlHYkNvZFB0THVrMkRnOXVJSGJzY3dzWWNV?=
 =?utf-8?B?MEp2Z3h5RmM3eStsSHFoMVhBcmdaWkFPQ0daUVBoSGNiVGRMenRIeVhlb3pM?=
 =?utf-8?B?M1ZpRmo5cjl1eTZLQWZFTkpKY3dvVG1HajlDTG5PaHBYY2FCS1pXTXdBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7388.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STU4VzdIMmp2NEJsWEtVbUlwYlVWVnB4UUJtV2M3SDdiOUU3dkgvazNVZWVN?=
 =?utf-8?B?aHVhbTNnS1k3cXduQndVclRuTGY4cGJmbFk1b1hmZnN5Nm1rT3dOMWFyaFNi?=
 =?utf-8?B?ZTR2SEJGSURHcWJkejFJemU4YnlicEJ2aWxjVFFSRk52QTlTVFlhdjJzOVRw?=
 =?utf-8?B?NzlXTHZDcHlYcDZNTENEOEhQOS9FWUV2ZTNET1k2VEkzREJFRFdDNXh0TVd6?=
 =?utf-8?B?bXdCaWsrQjNLbjg2eTBDUjIzZkVCMUNWbkNDNlJLM05rL01TMk5TTjF2ZnRi?=
 =?utf-8?B?TWg2UzJhUTZRcUsrSkdYSWlNNXRUK2dwSVI0WFRSeUo2bE1adjFBblZPU2Js?=
 =?utf-8?B?RTVZZUV4Q3ROZW1rNHFlRjdKVVY2V3NDd0FKZ0NrY1BJa24yTmNISVpPQStR?=
 =?utf-8?B?SnZPSzM5S2VENmFNa3hDdTdtQ0FlRVQ3WjFNbSttb3lmSjV4Y1h5WExnWW1C?=
 =?utf-8?B?QXpTWHREektCVFlzK2tNZDVIRDU3YjRJWFJBRmo0ZWxob3NOTHQ5WnZyVHN0?=
 =?utf-8?B?RjFMenJzZ2pqZjB0a2hYejJ4MDVYbzVRb0loRy93NnlvNFpqUWFEQmdSWDRi?=
 =?utf-8?B?a0Z0VjJwSVc4ZHJaSE5tVWhBQzVHUmFyRWQ3M1lGQ3M5MmpobTk1L0tjc25I?=
 =?utf-8?B?S3RBWldRVis2YWx3M05GRzYybTh1SUQ4VjFERW1YSDJYbjM5TFQxWG9nR0Zo?=
 =?utf-8?B?d3N6YW9tSGhQWWl3dzB6SmxjYlZSVGxuTW5xaGRJelZRWHBjOWpqL0tITElH?=
 =?utf-8?B?UHloL242UkQ5OTc0eG4zWUJUZkZnOEJ6TzV2c2xNenl3V1pYdlNZZ09mMXBY?=
 =?utf-8?B?aGtNYUhUMm9iSXA3M2lpSnF5N1NhdWVrYXZKT1RTampkbGZuVjB5WHNDcnVr?=
 =?utf-8?B?aGI0OHQ5eGd4cWtWajJuM240Y2NjS01wNmpOTzdFYXo1cCsxYUdieDQ3QTZC?=
 =?utf-8?B?a3BlRUVwL0ljeEdLbHNBRk9UQUVwbWl3TVBWY1dvZENiaTRGVU5aNzBieVQ2?=
 =?utf-8?B?b0FFazM4U2E4RnJPRzFvOGRjbmtLZkxGRWcvSmxaSkJ5bG14aDFobWZwS1dk?=
 =?utf-8?B?ZDdxTHp6YWhMQXp4UGMwNGoxU0cxMFNrRERFT29mVFprdmxYNlQ5NmEzSkty?=
 =?utf-8?B?aG93djZ6MFZuR0FHZUw0WnA2ODJLTHRtZlBpS0lJdjlJd1A1SVgxMm1FMnFy?=
 =?utf-8?B?ZnNxaDMrUmN6UXlWNWRpaHdLNWw1eVNHU2RSVzFlaVhlR2UrN2lDU0FadmUv?=
 =?utf-8?B?SkdxTkM1SC9YbGlHUzhWb3ZTbjM0SEsxNzdZeGV4MEJEUUU2NjFUTzJzcFZs?=
 =?utf-8?B?Kzk0aGl6Zkh1YUJxZW1keTE3RWlPNnJadjBiQlcrbVZRblVhWm54cWY1WGJ5?=
 =?utf-8?B?eFRRMUNiNGxhYWZ1TUNpN0dxSlc1eCsyaUl3K2t3SlgyTzZsbzdCcllNOSti?=
 =?utf-8?B?NFRUVXpRakxBZkxWeTdJc3VUYjYxbmdDZjh1ejB1bHFtNm1iMFM4aWxONE5n?=
 =?utf-8?B?UFZQQ24vYW14YS9JUERibnlPbThtODZheFVNaWhUOFlCamQ5Y2pCdTUwTkE4?=
 =?utf-8?B?YnhCY01tMnpCVzMwU2oyTVBld2lkWmNucUpHd2ZmTVVMWlNEQ1pmVjBKZ0R6?=
 =?utf-8?B?T3YzN2dpbG9iU2o0RHpyZ2lqdWk2RVhFQVBHQ1pkMmFJNCtwSEY4UWVNWWVF?=
 =?utf-8?B?QjIyYzR5emdnT1dtMVFjckhqZjBSd0c3UktTN1ZkQUJMVUhTcFhnSFBQZ2lS?=
 =?utf-8?B?ajMyTmdQQXdNSVBYMllWaUFWa2xpOWs1WkU5U3FVd3Qxdko2dkxRL2NES0Zi?=
 =?utf-8?B?NmlERTVHdzdqRWx5Smo5RUZPdzdESlJpd1NyT3BScHUzZjd3aUZKWCtSU2lx?=
 =?utf-8?B?dnBNalVrM3o3Yk5Mek5zT1pySGdOTlB0OTg4V0s2US9xREZac1FmTUxZVGJo?=
 =?utf-8?B?QWFpaTQ3ZWgrbGlMUzVTczNHSTh6aTRoaWJZa1BIQUQ5QVZxVklUUnl5dGpx?=
 =?utf-8?B?VERycDh2SXhtdUpzUFFqNjBuZElUNmYwZkI0QTZJbnljTlE2Z3EwYWZtbjNU?=
 =?utf-8?B?ZlplRlIwSnFpUVpoSGVpSUt4Znh2R1ZwTTg2b1FlNDBxc0hObmNKcXA4eVFG?=
 =?utf-8?B?YWxuY0VuRGZlaThlQUoxZkVTNDNjV3c2SFJZRk8vNExhbC9FY3pWZWw2bmxa?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd112558-af81-4527-f114-08dc839a32a2
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7388.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 06:55:47.9332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L3zzYXweAZFO+tBG6ytlwK7l1FGLpbtqWzGWYgp7hgmnEPRnRm/QN/VZ6auDnO52bnvjwv5fwVZXS2/salpTSkQlbaAMB/EtqBEMIGaOt7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7162
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

Hi Thomas,

On 29.05.2024 14:58, Thomas Hellström wrote:
> On Wed, 2024-05-15 at 13:24 +0200, Karolina Stolarek wrote:
>> Add mock resource manager to test ttm_bo_validate() with non-system
>> placements. Update KConfig entry to enable DRM Buddy allocator, used
>> by the mock manager. Update move function to do more than just assign
>> a resource.
>>
>> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
>> Tested-by: Somalapuram, Amaranath <asomalap@amd.com>
>> ---
>>   drivers/gpu/drm/Kconfig                       |   1 +
>>   drivers/gpu/drm/ttm/tests/.kunitconfig        |   1 +
>>   drivers/gpu/drm/ttm/tests/Makefile            |   1 +
>>   .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  | 274
>> ++++++++++++++++++
>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  38 ++-
>>   drivers/gpu/drm/ttm/tests/ttm_mock_manager.c  | 207 +++++++++++++
>>   drivers/gpu/drm/ttm/tests/ttm_mock_manager.h  |  31 ++
>>   7 files changed, 551 insertions(+), 2 deletions(-)
>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_manager.h
>>
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index 026444eeb5c6..4ba16501dbf7 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -234,6 +234,7 @@ config DRM_TTM_KUNIT_TEST
>>           default n
>>           depends on DRM && KUNIT && MMU && (UML || COMPILE_TEST)
>>           select DRM_TTM
>> +        select DRM_BUDDY
>>           select DRM_EXPORT_FOR_TESTS if m
>>           select DRM_KUNIT_TEST_HELPERS
>>           default KUNIT_ALL_TESTS
>> diff --git a/drivers/gpu/drm/ttm/tests/.kunitconfig
>> b/drivers/gpu/drm/ttm/tests/.kunitconfig
>> index 1ae1ffabd51e..772f0e1f4103 100644
>> --- a/drivers/gpu/drm/ttm/tests/.kunitconfig
>> +++ b/drivers/gpu/drm/ttm/tests/.kunitconfig
>> @@ -1,3 +1,4 @@
>>   CONFIG_KUNIT=y
>>   CONFIG_DRM=y
>>   CONFIG_DRM_TTM_KUNIT_TEST=y
>> +CONFIG_DRM_BUDDY=y
> 
> Is this strictly needed when CONFIG_DRM_TTM_KUNIT_TEST is selected?
> Wouldn't that be enabled implicitly?

Ah, yes, that should get selected implicitly. I'll check and remove if 
that works, thanks.

> 
>> diff --git a/drivers/gpu/drm/ttm/tests/Makefile
>> b/drivers/gpu/drm/ttm/tests/Makefile
>> index 2e5ed63fb414..f3149de77541 100644
>> --- a/drivers/gpu/drm/ttm/tests/Makefile
>> +++ b/drivers/gpu/drm/ttm/tests/Makefile
>> @@ -7,4 +7,5 @@ obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += \
>>           ttm_tt_test.o \
>>           ttm_bo_test.o \
>>           ttm_bo_validate_test.o \
>> +        ttm_mock_manager.o \
>>           ttm_kunit_helpers.o
>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
>> b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
>> index a5520b0631a3..8b62d95b8ab8 100644
>> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
>> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
>> @@ -8,12 +8,15 @@
>>   #include <drm/ttm/ttm_tt.h>
>>   
>>   #include "ttm_kunit_helpers.h"
>> +#include "ttm_mock_manager.h"
>>   
>>   #define BO_SIZE		SZ_4K
>> +#define MANAGER_SIZE	SZ_1M
>>   
>>   struct ttm_bo_validate_test_case {
>>   	const char *description;
>>   	enum ttm_bo_type bo_type;
>> +	uint32_t mem_type;
> 
> Please use u32 instead of unit32_t in new code. The unit32_t usage in
> TTM is a remnant from when much of the drm- and ttm code was shared
> with *bsd. Same in a couple of places below.

I see. So, the question is what should I about other test code that is 
already merged? Submit a separate patch to change uint32_t --> u32?

> 
>>   	bool with_ttm;
>>   };
>>   
>> @@ -102,6 +105,49 @@ static void ttm_bo_init_reserved_sys_man(struct
>> kunit *test)
>>   	ttm_bo_put(bo);
>>   }
>>   
>> +static void ttm_bo_init_reserved_mock_man(struct kunit *test)
>> +{
>> +	const struct ttm_bo_validate_test_case *params = test-
>>> param_value;
>> +	enum ttm_bo_type bo_type = params->bo_type;
>> +	struct ttm_test_devices *priv = test->priv;
>> +	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
>> +	struct ttm_operation_ctx ctx = { };
>> +	struct ttm_placement *placement;
>> +	uint32_t mem_type = TTM_PL_VRAM;
>> +	struct ttm_buffer_object *bo;
>> +	struct ttm_place *place;
>> +	int err;
>> +
>> +	ttm_mock_manager_init(priv->ttm_dev, mem_type,
>> MANAGER_SIZE);
>> +
>> +	bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
>> +	KUNIT_ASSERT_NOT_NULL(test, bo);
>> +
>> +	place = ttm_place_kunit_init(test, mem_type, 0);
>> +	placement = ttm_placement_kunit_init(test, place, 1);
>> +
>> +	drm_gem_private_object_init(priv->drm, &bo->base, size);
>> +
>> +	err = ttm_bo_init_reserved(priv->ttm_dev, bo, bo_type,
>> placement,
>> +				   PAGE_SIZE, &ctx, NULL, NULL,
>> +				   &dummy_ttm_bo_destroy);
>> +	dma_resv_unlock(bo->base.resv);
>> +
>> +	KUNIT_EXPECT_EQ(test, err, 0);
>> +	KUNIT_EXPECT_EQ(test, kref_read(&bo->kref), 1);
>> +	KUNIT_EXPECT_PTR_EQ(test, bo->bdev, priv->ttm_dev);
>> +	KUNIT_EXPECT_EQ(test, bo->type, bo_type);
>> +	KUNIT_EXPECT_EQ(test, ctx.bytes_moved, size);
>> +
>> +	if (bo_type != ttm_bo_type_kernel)
>> +		KUNIT_EXPECT_TRUE(test,
>> +				  drm_mm_node_allocated(&bo-
>>> base.vma_node.vm_node));
>> +
>> +	ttm_resource_free(bo, &bo->resource);
>> +	ttm_bo_put(bo);
>> +	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
>> +}
>> +
>>   static void ttm_bo_init_reserved_resv(struct kunit *test)
>>   {
>>   	enum ttm_bo_type bo_type = ttm_bo_type_device;
>> @@ -136,6 +182,51 @@ static void ttm_bo_init_reserved_resv(struct
>> kunit *test)
>>   	ttm_bo_put(bo);
>>   }
>>   
>> +static void ttm_bo_validate_basic(struct kunit *test)
>> +{
>> +	const struct ttm_bo_validate_test_case *params = test-
>>> param_value;
>> +	uint32_t fst_mem = TTM_PL_SYSTEM, snd_mem = TTM_PL_VRAM;
>> +	struct ttm_operation_ctx ctx_init = { }, ctx_val = { };
>> +	struct ttm_placement *fst_placement, *snd_placement;
>> +	struct ttm_test_devices *priv = test->priv;
>> +	struct ttm_place *fst_place, *snd_place;
>> +	uint32_t size = ALIGN(SZ_8K, PAGE_SIZE);
>> +	struct ttm_buffer_object *bo;
>> +	int err;
>> +
>> +	ttm_mock_manager_init(priv->ttm_dev, snd_mem, MANAGER_SIZE);
>> +
>> +	fst_place = ttm_place_kunit_init(test, fst_mem, 0);
>> +	fst_placement = ttm_placement_kunit_init(test, fst_place,
>> 1);
>> +
>> +	bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
>> +	KUNIT_ASSERT_NOT_NULL(test, bo);
>> +
>> +	drm_gem_private_object_init(priv->drm, &bo->base, size);
>> +
>> +	err = ttm_bo_init_reserved(priv->ttm_dev, bo, params-
>>> bo_type,
>> +				   fst_placement, PAGE_SIZE,
>> &ctx_init, NULL,
>> +				   NULL, &dummy_ttm_bo_destroy);
>> +	KUNIT_EXPECT_EQ(test, err, 0);
>> +
>> +	snd_place = ttm_place_kunit_init(test, snd_mem,
>> DRM_BUDDY_TOPDOWN_ALLOCATION);
>> +	snd_placement = ttm_placement_kunit_init(test, snd_place,
>> 1);
>> +
>> +	err = ttm_bo_validate(bo, snd_placement, &ctx_val);
>> +	dma_resv_unlock(bo->base.resv);
>> +
>> +	KUNIT_EXPECT_EQ(test, err, 0);
>> +	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, bo->base.size);
>> +	KUNIT_EXPECT_NOT_NULL(test, bo->ttm);
>> +	KUNIT_EXPECT_TRUE(test, ttm_tt_is_populated(bo->ttm));
>> +	KUNIT_EXPECT_EQ(test, bo->resource->mem_type, snd_mem);
>> +	KUNIT_EXPECT_EQ(test, bo->resource->placement,
>> +			DRM_BUDDY_TOPDOWN_ALLOCATION);
>> +
>> +	ttm_bo_put(bo);
>> +	ttm_mock_manager_fini(priv->ttm_dev, snd_mem);
>> +}
>> +
>>   static void ttm_bo_validate_invalid_placement(struct kunit *test)
>>   {
>>   	enum ttm_bo_type bo_type = ttm_bo_type_device;
>> @@ -162,6 +253,36 @@ static void
>> ttm_bo_validate_invalid_placement(struct kunit *test)
>>   	ttm_bo_put(bo);
>>   }
>>   
>> +static void ttm_bo_validate_failed_alloc(struct kunit *test)
>> +{
>> +	enum ttm_bo_type bo_type = ttm_bo_type_device;
>> +	struct ttm_test_devices *priv = test->priv;
>> +	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
>> +	struct ttm_operation_ctx ctx = { };
>> +	struct ttm_placement *placement;
>> +	uint32_t mem_type = TTM_PL_VRAM;
>> +	struct ttm_buffer_object *bo;
>> +	struct ttm_place *place;
>> +	int err;
>> +
>> +	bo = ttm_bo_kunit_init(test, test->priv, size, NULL);
>> +	bo->type = bo_type;
>> +
>> +	ttm_bad_manager_init(priv->ttm_dev, mem_type, MANAGER_SIZE);
>> +
>> +	place = ttm_place_kunit_init(test, mem_type, 0);
>> +	placement = ttm_placement_kunit_init(test, place, 1);
>> +
>> +	ttm_bo_reserve(bo, false, false, NULL);
>> +	err = ttm_bo_validate(bo, placement, &ctx);
>> +	dma_resv_unlock(bo->base.resv);
>> +
>> +	KUNIT_EXPECT_EQ(test, err, -ENOMEM);
>> +
>> +	ttm_bo_put(bo);
>> +	ttm_bad_manager_fini(priv->ttm_dev, mem_type);
>> +}
>> +
>>   static void ttm_bo_validate_pinned(struct kunit *test)
>>   {
>>   	enum ttm_bo_type bo_type = ttm_bo_type_device;
>> @@ -193,11 +314,164 @@ static void ttm_bo_validate_pinned(struct
>> kunit *test)
>>   	ttm_bo_put(bo);
>>   }
>>   
>> +static const struct ttm_bo_validate_test_case ttm_mem_type_cases[] =
>> {
>> +	{
>> +		.description = "System manager",
>> +		.mem_type = TTM_PL_SYSTEM,
>> +	},
>> +	{
>> +		.description = "VRAM manager",
>> +		.mem_type = TTM_PL_VRAM,
>> +	},
>> +};
>> +
>> +KUNIT_ARRAY_PARAM(ttm_bo_validate_mem, ttm_mem_type_cases,
>> +		  ttm_bo_validate_case_desc);
>> +
>> +static void ttm_bo_validate_same_placement(struct kunit *test)
>> +{
>> +	const struct ttm_bo_validate_test_case *params = test-
>>> param_value;
>> +	struct ttm_operation_ctx ctx_init = { }, ctx_val = { };
>> +	struct ttm_test_devices *priv = test->priv;
>> +	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
>> +	struct ttm_placement *placement;
>> +	struct ttm_buffer_object *bo;
>> +	struct ttm_place *place;
>> +	int err;
>> +
>> +	place = ttm_place_kunit_init(test, params->mem_type, 0);
>> +	placement = ttm_placement_kunit_init(test, place, 1);
>> +
>> +	if (params->mem_type != TTM_PL_SYSTEM)
>> +		ttm_mock_manager_init(priv->ttm_dev, params-
>>> mem_type, MANAGER_SIZE);
>> +
>> +	bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
>> +	KUNIT_ASSERT_NOT_NULL(test, bo);
>> +
>> +	drm_gem_private_object_init(priv->drm, &bo->base, size);
>> +
>> +	err = ttm_bo_init_reserved(priv->ttm_dev, bo, params-
>>> bo_type,
>> +				   placement, PAGE_SIZE, &ctx_init,
>> NULL,
>> +				   NULL, &dummy_ttm_bo_destroy);
>> +	KUNIT_EXPECT_EQ(test, err, 0);
>> +
>> +	err = ttm_bo_validate(bo, placement, &ctx_val);
>> +	dma_resv_unlock(bo->base.resv);
>> +
>> +	KUNIT_EXPECT_EQ(test, err, 0);
>> +	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, 0);
>> +
>> +	ttm_bo_put(bo);
>> +
>> +	if (params->mem_type != TTM_PL_SYSTEM)
>> +		ttm_mock_manager_fini(priv->ttm_dev, params-
>>> mem_type);
>> +}
>> +
>> +static void ttm_bo_validate_busy_placement(struct kunit *test)
>> +{
>> +	uint32_t fst_mem = TTM_PL_VRAM, snd_mem = TTM_PL_VRAM + 1;
>> +	struct ttm_operation_ctx ctx_init = { }, ctx_val = { };
>> +	struct ttm_placement *placement_init, *placement_val;
>> +	enum ttm_bo_type bo_type = ttm_bo_type_device;
>> +	struct ttm_test_devices *priv = test->priv;
>> +	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
>> +	struct ttm_place *init_place, places[2];
>> +	struct ttm_resource_manager *man;
>> +	struct ttm_buffer_object *bo;
>> +	int err;
>> +
>> +	ttm_bad_manager_init(priv->ttm_dev, fst_mem, MANAGER_SIZE);
>> +	ttm_mock_manager_init(priv->ttm_dev, snd_mem, MANAGER_SIZE);
>> +
>> +	init_place = ttm_place_kunit_init(test, TTM_PL_SYSTEM, 0);
>> +	placement_init = ttm_placement_kunit_init(test, init_place,
>> 1);
>> +
>> +	bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
>> +	KUNIT_ASSERT_NOT_NULL(test, bo);
>> +
>> +	drm_gem_private_object_init(priv->drm, &bo->base, size);
>> +
>> +	err = ttm_bo_init_reserved(priv->ttm_dev, bo, bo_type,
>> placement_init,
>> +				   PAGE_SIZE, &ctx_init, NULL, NULL,
>> +				   &dummy_ttm_bo_destroy);
>> +	KUNIT_EXPECT_EQ(test, err, 0);
>> +
>> +	places[0] = (struct ttm_place){ .mem_type = fst_mem, .flags
>> = TTM_PL_FLAG_DESIRED };
>> +	places[1] = (struct ttm_place){ .mem_type = snd_mem, .flags
>> = TTM_PL_FLAG_FALLBACK };
>> +	placement_val = ttm_placement_kunit_init(test, places, 2);
>> +
>> +	err = ttm_bo_validate(bo, placement_val, &ctx_val);
>> +	dma_resv_unlock(bo->base.resv);
>> +
>> +	man = ttm_manager_type(priv->ttm_dev, snd_mem);
>> +
>> +	KUNIT_EXPECT_EQ(test, err, 0);
>> +	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, bo->base.size);
>> +	KUNIT_EXPECT_EQ(test, bo->resource->mem_type, snd_mem);
>> +	KUNIT_ASSERT_TRUE(test, list_is_singular(&man->lru[bo-
>>> priority]));
>> +
>> +	ttm_bo_put(bo);
>> +	ttm_bad_manager_fini(priv->ttm_dev, fst_mem);
>> +	ttm_mock_manager_fini(priv->ttm_dev, snd_mem);
>> +}
>> +
>> +static void ttm_bo_validate_multihop(struct kunit *test)
>> +{
>> +	const struct ttm_bo_validate_test_case *params = test-
>>> param_value;
>> +	struct ttm_operation_ctx ctx_init = { }, ctx_val = { };
>> +	struct ttm_placement *placement_init, *placement_val;
>> +	uint32_t fst_mem = TTM_PL_VRAM, tmp_mem = TTM_PL_TT,
>> +		 final_mem = TTM_PL_SYSTEM;
>> +	struct ttm_test_devices *priv = test->priv;
>> +	struct ttm_place *fst_place, *final_place;
>> +	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
>> +	struct ttm_buffer_object *bo;
>> +	int err;
>> +
>> +	ttm_mock_manager_init(priv->ttm_dev, fst_mem, MANAGER_SIZE);
>> +	ttm_mock_manager_init(priv->ttm_dev, tmp_mem, MANAGER_SIZE);
>> +
>> +	fst_place = ttm_place_kunit_init(test, fst_mem, 0);
>> +	placement_init = ttm_placement_kunit_init(test, fst_place,
>> 1);
>> +
>> +	bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
>> +	KUNIT_ASSERT_NOT_NULL(test, bo);
>> +
>> +	drm_gem_private_object_init(priv->drm, &bo->base, size);
>> +
>> +	err = ttm_bo_init_reserved(priv->ttm_dev, bo, params-
>>> bo_type,
>> +				   placement_init, PAGE_SIZE,
>> &ctx_init, NULL,
>> +				   NULL, &dummy_ttm_bo_destroy);
>> +	KUNIT_EXPECT_EQ(test, err, 0);
>> +
>> +	final_place = ttm_place_kunit_init(test, final_mem, 0);
>> +	placement_val = ttm_placement_kunit_init(test, final_place,
>> 1);
>> +
>> +	err = ttm_bo_validate(bo, placement_val, &ctx_val);
>> +	dma_resv_unlock(bo->base.resv);
>> +
>> +	KUNIT_EXPECT_EQ(test, err, 0);
>> +	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, size * 2);
>> +	KUNIT_EXPECT_EQ(test, bo->resource->mem_type, final_mem);
>> +
>> +	ttm_bo_put(bo);
>> +
>> +	ttm_mock_manager_fini(priv->ttm_dev, fst_mem);
>> +	ttm_mock_manager_fini(priv->ttm_dev, tmp_mem);
>> +}
>> +
>>   static struct kunit_case ttm_bo_validate_test_cases[] = {
>>   	KUNIT_CASE_PARAM(ttm_bo_init_reserved_sys_man,
>> ttm_bo_types_gen_params),
>> +	KUNIT_CASE_PARAM(ttm_bo_init_reserved_mock_man,
>> ttm_bo_types_gen_params),
>>   	KUNIT_CASE(ttm_bo_init_reserved_resv),
>> +	KUNIT_CASE_PARAM(ttm_bo_validate_basic,
>> ttm_bo_types_gen_params),
>>   	KUNIT_CASE(ttm_bo_validate_invalid_placement),
>> +	KUNIT_CASE_PARAM(ttm_bo_validate_same_placement,
>> +			 ttm_bo_validate_mem_gen_params),
>> +	KUNIT_CASE(ttm_bo_validate_failed_alloc),
>>   	KUNIT_CASE(ttm_bo_validate_pinned),
>> +	KUNIT_CASE(ttm_bo_validate_busy_placement),
>> +	KUNIT_CASE_PARAM(ttm_bo_validate_multihop,
>> ttm_bo_types_gen_params),
>>   	{}
>>   };
>>   
>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>> b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>> index 2f590bae53f8..2a2585b37118 100644
>> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>> @@ -27,8 +27,42 @@ static int mock_move(struct ttm_buffer_object *bo,
>> bool evict,
>>   		     struct ttm_resource *new_mem,
>>   		     struct ttm_place *hop)
>>   {
>> -	bo->resource = new_mem;
>> -	return 0;
>> +	struct ttm_resource *old_mem = bo->resource;
>> +	int ret;
>> +
>> +	if (!old_mem || (old_mem->mem_type == TTM_PL_SYSTEM && !bo-
>>> ttm)) {
>> +		ttm_bo_move_null(bo, new_mem);
>> +		return 0;
>> +	}
>> +
>> +	if (bo->resource->mem_type == TTM_PL_VRAM &&
>> +	    new_mem->mem_type == TTM_PL_SYSTEM) {
>> +		hop->mem_type = TTM_PL_TT;
>> +		hop->flags = TTM_PL_FLAG_TEMPORARY;
>> +		hop->fpfn = 0;
>> +		hop->lpfn = 0;
>> +		return -EMULTIHOP;
>> +	}
>> +
>> +	if (old_mem->mem_type == TTM_PL_SYSTEM &&
>> +	    new_mem->mem_type == TTM_PL_TT) {
>> +		ttm_bo_move_null(bo, new_mem);
>> +		return 0;
>> +	}
>> +
>> +	if (old_mem->mem_type == TTM_PL_TT &&
>> +	    new_mem->mem_type == TTM_PL_SYSTEM) {
>> +		ret = ttm_bo_wait_ctx(bo, ctx);
> 
> We're not doing any accelerated move here, so ttm_bo_move_null() should
> be sufficient also in this case?

I'll remove that, thanks.

> 
>> +
>> +		if (ret)
>> +			return ret;
>> +
>> +		ttm_resource_free(bo, &bo->resource);
>> +		ttm_bo_assign_mem(bo, new_mem);
>> +		return 0;
>> +	}
>> +
>> +	return ttm_bo_move_memcpy(bo, ctx, new_mem);
> 
> Do we hit this move_memcpy()? Since the mock manager doesn't actually
> reserve any memory to manager, I'd expect this to run into problems?

We do. The mock manager has use_tt=true, so on move, we'd use 
ttm_kmap_iter_tt_init() for src and dest and copy the pages. I'm not 
sure if that's the right approach, but it enables me to test if 
ttm_operation_ctx's bytes_moved is correctly updated.

> 
> 
> 
>>   }
>>   
>>   struct ttm_device_funcs ttm_dev_funcs = {
>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
>> b/drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
>> new file mode 100644
>> index 000000000000..eb9dca1de1a2
>> --- /dev/null
>> +++ b/drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
>> @@ -0,0 +1,207 @@
>> +// SPDX-License-Identifier: GPL-2.0 AND MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +#include <drm/ttm/ttm_resource.h>
>> +#include <drm/ttm/ttm_device.h>
>> +#include <drm/ttm/ttm_placement.h>
>> +
>> +#include "ttm_mock_manager.h"
>> +
>> +static inline struct ttm_mock_manager *
>> +to_mock_mgr(struct ttm_resource_manager *man)
>> +{
>> +	return container_of(man, struct ttm_mock_manager, man);
>> +}
>> +
>> +static inline struct ttm_mock_resource *
>> +to_mock_mgr_resource(struct ttm_resource *res)
>> +{
>> +	return container_of(res, struct ttm_mock_resource, base);
>> +}
>> +
>> +static int ttm_mock_manager_alloc(struct ttm_resource_manager *man,
>> +				  struct ttm_buffer_object *bo,
>> +				  const struct ttm_place *place,
>> +				  struct ttm_resource **res)
>> +{
>> +	struct ttm_mock_manager *manager = to_mock_mgr(man);
>> +	struct ttm_mock_resource *mock_res;
>> +	struct drm_buddy *mm = &manager->mm;
>> +	uint64_t lpfn, fpfn, alloc_size;
>> +	int err;
>> +
>> +	mock_res = kzalloc(sizeof(*mock_res), GFP_KERNEL);
>> +
>> +	if (!mock_res)
>> +		return -ENOMEM;
>> +
>> +	fpfn = 0;
>> +	lpfn = man->size;
>> +
>> +	ttm_resource_init(bo, place, &mock_res->base);
>> +	INIT_LIST_HEAD(&mock_res->blocks);
>> +
>> +	if (place->flags & TTM_PL_FLAG_TOPDOWN)
>> +		mock_res->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
>> +
>> +	if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
>> +		mock_res->flags |= DRM_BUDDY_CONTIGUOUS_ALLOCATION;
>> +
>> +	alloc_size = (uint64_t)mock_res->base.size;
>> +	mutex_lock(&manager->lock);
>> +	err = drm_buddy_alloc_blocks(mm, fpfn, lpfn, alloc_size,
>> +				     manager->default_page_size,
>> +				     &mock_res->blocks,
>> +				     mock_res->flags);
>> +
>> +	if (err)
>> +		goto error_free_blocks;
>> +	mutex_unlock(&manager->lock);
>> +
>> +	*res = &mock_res->base;
>> +	return 0;
>> +
>> +error_free_blocks:
>> +	drm_buddy_free_list(mm, &mock_res->blocks, 0);
>> +	ttm_resource_fini(man, &mock_res->base);
>> +	mutex_unlock(&manager->lock);
>> +
>> +	return err;
>> +}
>> +
>> +static void ttm_mock_manager_free(struct ttm_resource_manager *man,
>> +				  struct ttm_resource *res)
>> +{
>> +	struct ttm_mock_manager *manager = to_mock_mgr(man);
>> +	struct ttm_mock_resource *mock_res =
>> to_mock_mgr_resource(res);
>> +	struct drm_buddy *mm = &manager->mm;
>> +
>> +	mutex_lock(&manager->lock);
>> +	drm_buddy_free_list(mm, &mock_res->blocks, 0);
>> +	mutex_unlock(&manager->lock);
>> +
>> +	ttm_resource_fini(man, res);
>> +	kfree(mock_res);
>> +}
>> +
>> +static const struct ttm_resource_manager_func ttm_mock_manager_funcs
>> = {
>> +	.alloc = ttm_mock_manager_alloc,
>> +	.free = ttm_mock_manager_free,
>> +};
>> +
>> +int ttm_mock_manager_init(struct ttm_device *bdev, uint32_t
>> mem_type, uint32_t size)
>> +{
>> +	struct ttm_mock_manager *manager;
>> +	struct ttm_resource_manager *base;
>> +	int err;
>> +
>> +	manager = kzalloc(sizeof(*manager), GFP_KERNEL);
>> +	if (!manager)
>> +		return -ENOMEM;
>> +
>> +	mutex_init(&manager->lock);
>> +
>> +	err = drm_buddy_init(&manager->mm, size, PAGE_SIZE);
>> +
>> +	if (err) {
>> +		kfree(manager);
>> +		return err;
>> +	}
>> +
>> +	manager->default_page_size = PAGE_SIZE;
>> +	base = &manager->man;
>> +	base->func = &ttm_mock_manager_funcs;
>> +	base->use_tt = true;
>> +
>> +	ttm_resource_manager_init(base, bdev, size);
>> +	ttm_set_driver_manager(bdev, mem_type, base);
>> +	ttm_resource_manager_set_used(base, true);
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(ttm_mock_manager_init);
>> +
>> +void ttm_mock_manager_fini(struct ttm_device *bdev, uint32_t
>> mem_type)
>> +{
>> +	struct ttm_resource_manager *man;
>> +	struct ttm_mock_manager *mock_man;
>> +	int err;
>> +
>> +	man = ttm_manager_type(bdev, mem_type);
>> +	mock_man = to_mock_mgr(man);
>> +
>> +	err = ttm_resource_manager_evict_all(bdev, man);
>> +	if (err)
>> +		return;
>> +
>> +	ttm_resource_manager_set_used(man, false);
>> +
>> +	mutex_lock(&mock_man->lock);
>> +	drm_buddy_fini(&mock_man->mm);
>> +	mutex_unlock(&mock_man->lock);
>> +
>> +	ttm_set_driver_manager(bdev, mem_type, NULL);
>> +}
>> +EXPORT_SYMBOL_GPL(ttm_mock_manager_fini);
>> +
>> +static int ttm_bad_manager_alloc(struct ttm_resource_manager *man,
>> +				 struct ttm_buffer_object *bo,
>> +				 const struct ttm_place *place,
>> +				 struct ttm_resource **res)
>> +{
>> +	return -ENOSPC;
>> +}
>> +
>> +static void ttm_bad_manager_free(struct ttm_resource_manager *man,
>> +				 struct ttm_resource *res)
>> +{
>> +}
>> +
>> +static bool ttm_bad_manager_compatible(struct ttm_resource_manager
>> *man,
>> +				       struct ttm_resource *res,
>> +				       const struct ttm_place
>> *place,
>> +				       size_t size)
>> +{
>> +	return true;
>> +}
>> +
>> +static const struct ttm_resource_manager_func ttm_bad_manager_funcs
>> = {
>> +	.alloc = ttm_bad_manager_alloc,
>> +	.free = ttm_bad_manager_free,
>> +	.compatible = ttm_bad_manager_compatible
>> +};
>> +
>> +int ttm_bad_manager_init(struct ttm_device *bdev, uint32_t mem_type,
>> +			 uint32_t size)
>> +{
>> +	struct ttm_resource_manager *man;
>> +
>> +	man = kzalloc(sizeof(*man), GFP_KERNEL);
>> +	if (!man)
>> +		return -ENOMEM;
>> +
>> +	man->func = &ttm_bad_manager_funcs;
>> +
>> +	ttm_resource_manager_init(man, bdev, size);
>> +	ttm_set_driver_manager(bdev, mem_type, man);
>> +	ttm_resource_manager_set_used(man, true);
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(ttm_bad_manager_init);
>> +
>> +void ttm_bad_manager_fini(struct ttm_device *bdev, uint32_t
>> mem_type)
>> +{
>> +	struct ttm_resource_manager *man;
>> +
>> +	man = ttm_manager_type(bdev, mem_type);
>> +
>> +	ttm_resource_manager_set_used(man, false);
>> +	ttm_set_driver_manager(bdev, mem_type, NULL);
>> +
>> +	kfree(man);
>> +}
>> +EXPORT_SYMBOL_GPL(ttm_bad_manager_fini);
>> +
>> +MODULE_LICENSE("GPL");
> 
> When the module is dual-licensed IIRC the correct option to use here is
> "GPL and additional rights"

I took that module license from DRM KUnit tests, but I'll update it, thanks.

All the best,
Karolina
