Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKHlLu/dqmlqXwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 15:00:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B01122236D
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 15:00:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7427F10ED49;
	Fri,  6 Mar 2026 14:00:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LHrUFePM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF4DD10ED49;
 Fri,  6 Mar 2026 14:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772805612; x=1804341612;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=uhVqu2x7ENvvIqhNgZqAaMfbLkFXwYk0dB7MIKUscV0=;
 b=LHrUFePMZJkgx5kZl0zQkB/64bpiPzkf3fhdblQPCZ9rXDZyaCAOYBTz
 mQMUUyQi3nzt8kn46PDlzvcYmoUEzI7vGcBAvBmpGRvqbGqRkc4XJ+R7M
 6DpNnm0H42XyCFCmAluLnsNwApNNlE3penisVEGcQgm7fTqxCYKCEoSoy
 k7qs5cKoeAf1VN1kXNFuAWq/ZVZGaI/dEb5yKIt8vetAv4Opl5yvKLLRd
 B2eUPqq7pyLunouCVVnxp/L0RnGStx0aaRUte7VJUKBH+jZl7g6ZeP3Vi
 UMGskWVAg4TLlvQlyP2NC/eSfC3+9tXJ59drv+GLRwNMrCA3GY1rhRGwB g==;
X-CSE-ConnectionGUID: 4gHziIPFSEK0sk/CXlzwnQ==
X-CSE-MsgGUID: iLIgtwk2QY+4O1BthkZhvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="73785824"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="73785824"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 06:00:11 -0800
X-CSE-ConnectionGUID: ThHt2N5wRta5qLSR/vvGlA==
X-CSE-MsgGUID: Bf1TSOfIQV+2EauKJgpY8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="216147813"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 06:00:11 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 6 Mar 2026 06:00:10 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 6 Mar 2026 06:00:10 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.30) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 6 Mar 2026 06:00:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RTR8CtvI/AHd2ERr2w26xX8ez97deBtOKGCjpaRHl49PlbVUS/zPgjyshoFwQW2/zQpr82t+WY5bc1OPoxvnbc7v/avjNDkmaG0fn1K4fVAjLyTmb0+4bZu1FhTzuW402+ZGefcn43Hsd8gg+Uauq7DZyf1WZt7kyFGKYUIRw97w3R5f+4kwT9Ibp4SsWTW5RYc+u54r6YQOSsX7b2153vyN43lz4rfyMdi5My9iiFPvN5LLQ/WRSFkl50+5gJslCFU2H0nXhWqfQsfz9icaAXB0LsSjFtVObHJ80Z1EAqm/Hjy9gCF8rkSySWR1eVw1NGqBtUZ66FSdMf3H+y8aiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fa7FxnyPmYggC86ojce5DCuDq06FqEbDMvS0P3uIkOY=;
 b=O6rwt1m9DFQuqC9imIJ74IE/bpuipAoXiydk/ce1suMlhXj71FvTRoHXJaAnqCIgRkpkpnK3eqHlNCnLkAiWzPeUiXCjhegEtNmtguQowawpw+E1aznT6WRYuEUFNED4rKe6AAFeXX74RKmbE9JBAWECTbkP3ARiy6Hro1+83znoYtcgYM6OVXEKIgI45JrHFJ3GlGWnn+cPeeMcTp5KHxdphB9sqczzSBwUJPMK7MO/QYhOZ6XWvm/8USqKB/efIvFCspI0LRFW3eYTMur7jvcYnDCI7cXW14jq9+YjJ4dEHFG3VRamixdCrEQ7JLK6WkLlA3fAmFBFEgiXS5teAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM6PR11MB4625.namprd11.prod.outlook.com (2603:10b6:5:2a8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Fri, 6 Mar
 2026 14:00:07 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 14:00:07 +0000
Date: Fri, 6 Mar 2026 09:00:02 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "K V P, 
 Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Winiarski, Michal"
 <michal.winiarski@intel.com>, "Piorkowski, Piotr"
 <piotr.piorkowski@intel.com>, "Dunajski, Bartosz"
 <bartosz.dunajski@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>
Subject: Re: [RFC v5 1/1] drm/xe/pf: Restrict device query responses in
 admin-only PF mode
Message-ID: <aard4hmG_HOhWDji@intel.com>
References: <20260227120702.3651913-3-satyanarayana.k.v.p@intel.com>
 <20260227120702.3651913-4-satyanarayana.k.v.p@intel.com>
 <c113e7d317a6ae275c49151ff8e3ecad6bb85e45.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c113e7d317a6ae275c49151ff8e3ecad6bb85e45.camel@intel.com>
X-ClientProxiedBy: SJ0PR05CA0051.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::26) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM6PR11MB4625:EE_
X-MS-Office365-Filtering-Correlation-Id: e147b07b-60e6-4b4d-4589-08de7b88ac79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 2L3Slz0xwJbIGmM/rCww3GfuqQBQpVxZg2F9SetYNFTsRiK2NAk9WGzXqEyHHKp6LNKeiLpz5yz1KcTDCUFSR2CHCv5968aSzEQhbDNSB854WQRUaR1RG9m+RDr7+OYf39SLUDFgKwEgiYymOJ/fAJl/PGz+t1eIgpsHc1pU99Bm4ZEJxDi9Hpd8Byt3BPYtwLNUI2jJqRiCJEZ75z8TXxpKndRXBJYD/BShR8sFxCvhy3qINyLeP2VVcBcZn0yGeH+muFQ3hfvQYhDTieEZdOkyE8SJAybcMLG6/GfLxG6pOxCqjZDgJiLCDV6HBQE23WZT94ZgUHyarntGFQcUQvICnu29UYmw+1sRFjtNwEsxohrd6qLf0Lj9ZOSapkvpsj+1iFN6qjv0SsP+0SdGysh/22kUfMYvEv+34Ofmnaftqbd/1dbcfbyAqr6/tQ0rsBq2y8tMEyM4nuFfYklKh5mtggNZ06zS8KTCCuIgR2g5g41w1fILGnuNej9CDvfXN+lHa4IcrYpdCa0eeJW0PYcmWUFrvRFTsPOING8Lf2LpHxN1c6GpS72itSLsefI/rkKcMr2TW3jjHZAcXnFE4aywx4YhI9J6NCpYy1ofPDzCM5Bec/B5HRLKDKnKNanXNmqX37H5JONMB+hLvKctqBRMliseAD/KhbaYcUBaEV62XxRo2SWvcWyspxzMAkBt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFYvMFFJYlA0d2F2aHdIWkVJdG9Hd3I4VzVuZnBQQ0phREkxQjVYRWxHVWk5?=
 =?utf-8?B?ejcxVTVwelBnaUJYa3o3a2lncCs5ZkdIay9UR0ZaUGtYOEhoRFpCYjJzdzky?=
 =?utf-8?B?dnRYN09QbkJabld3TmU1bEhHS1Z0cU9EcU5SUGtaZ3dFSS9JVVBBYVpvMFBX?=
 =?utf-8?B?VDM5WFM1TEp6QldxUXF2K3gzQnk3RklueWdWaVZwMnNMNWdkczBvS3ZoOG9Z?=
 =?utf-8?B?VUhvZk9NcGxJcExWT1lwWTBmN09FU2k3c3pDN1FXcU5GSkZzTlVNVkdUZTJy?=
 =?utf-8?B?SUhvVjh3UkFFTFY2SlY3akhRSjc0QjRHM04wR2sreFdBK1ZLeFkyYkZ3cU1N?=
 =?utf-8?B?SG51bHNsRk9FMXYrNU5ybFR0aEJ0Q0o0SDhhbWtvWFN3dGVqRWw4aDVPckRG?=
 =?utf-8?B?aUhIM2FaVUJjaDNPREo3OFl5S0REckt1MHQ0QzJmNjRPaTg3TVVycW1ERzND?=
 =?utf-8?B?dk9Xdk9QQVF1WDNwS2dWZDhrUjVCSkx0YUhNR3NydTdkWDJKNHpVaEliWXdl?=
 =?utf-8?B?V1FXWE1UZ1E2ODJRVzlkbUpULzZ3QStGc1BGNzFBaDJCUmlpRkNRSkUzTFJD?=
 =?utf-8?B?YTZNM0t1aUVlZTZIclpLcytacDE0OUFsQlM2dzBQQUMyRWFkNUltMmFObDV4?=
 =?utf-8?B?elFEMm1ZTEkxNUpoZG9WYitWVmI2Q1hvak9qSWtXWlVWVnliQm9xa0psL1Qx?=
 =?utf-8?B?cDd5TFFkZmRNb1lvRUxnRDJMc0xwaFE3Y21HMGQyOHZaMk5HMU1MT3BKYWcr?=
 =?utf-8?B?ZldDSzRuNnlJNFdianVnMzF2d09KUnRORVUyQXVnM21lUHZJVnBXTFZBTVdL?=
 =?utf-8?B?eFhhL3lNMmwvS2VvQlBQUDAzZHNnR2c2cGFtL1Z1QlhMTFVnY2lwZXZOLzha?=
 =?utf-8?B?M3hNYW50Q0Y4d3NqMW52OXExaGwrUHN0cnFzSkNCZHgzQXFkSE9JWTdlMjVE?=
 =?utf-8?B?YW0zMjl2cG55RzhQTzVCVFVhTXdoWVNrVnZmWFhwSDJGbys3Sm14WlMzOXQ0?=
 =?utf-8?B?WWpOOEdaMUxUcURNS1RhdmdidXNITjFmeEtaQ2kxRUZKb3JDQ3MvVyt4b3ZQ?=
 =?utf-8?B?MGFacGJBcTRZSHpKK0poUURhQ0ZVcFAxeFZBMlNlU2hQQmg2TWJFK3Z1MWFZ?=
 =?utf-8?B?aUsyTDV6Tlg5YzBkVVk2Y0NzNm9TRnNYYjVBN2Q4K2trQlVxcU5jcTV3OGgy?=
 =?utf-8?B?VHllaGxpaXd3aCtYbkRrcy9IaEZ3dHhnL3lKdXB4OUNPRTgzcFQ0WnVIZCtP?=
 =?utf-8?B?c2I5YnVTSWt0Z1c2ZDNnUktzVFRhVFRNRlNhZEJtQWc2WHNhTEtxc0xoQVpn?=
 =?utf-8?B?MWNRa3dxUXVqelVIeDl6NFNZVEtGUFA3UDdNYU9IbVRQVkZ1bE14VUx3V01Q?=
 =?utf-8?B?dUxuZ3FuMEJpRlVJNERkR0swajZjdmN2U25FTGUwVnBvMWZOMytpSDR6bTZJ?=
 =?utf-8?B?UmVpZ2t6c0V5eDZhVGI2b0w1anh6Zjh1aWJEOEJTN1J6S0hrcGltS3RkM2cr?=
 =?utf-8?B?b3BJMGRmblhDTGF3Q2FOTEJ0bzhVbnFGeithWDFkdWp5b1YzRmNHSy9VOUFE?=
 =?utf-8?B?OFp6cm5sZ1ljbkdnZEVaRTJZL0x5VWRhallLT3ZzVjNaRUI5cHZvVUFyc2p2?=
 =?utf-8?B?OUZaQnJEdDQ0clJseXhmbnpTclFPVnBLL2hqNTkxNkptbnYwb3h6UUN0SmVm?=
 =?utf-8?B?enRXQ0hJK3ZiZzZSbUtvQm1qMzg0VE5UNkVFeUNRLzdLRDVVc3VlN1F2RFhN?=
 =?utf-8?B?OTZ4ZkgxcmFYODVzb21UVjAvcmxTVWcrbHQ4RGxXemRmdVoyVUhzZTU4Y1Uz?=
 =?utf-8?B?UkhEekVrQnlWMXpBTGMybWpsMWh5dFZ6dHFtUG45N0FpdC90QnJHaHpjaDE5?=
 =?utf-8?B?QTRvblVCUnZxdkU3R3Y4ck9kMG1LTXU5M2V3bTkvZEhBMURUN0tnRS9odlIz?=
 =?utf-8?B?VWljZmZ2WUovYTc0OFFtTytEWWNjT2RkNTZtUUhQRFBCYXplN3F5SVF0RmZS?=
 =?utf-8?B?bzdVQVN4NVdUNHd2cUVIelpDek1xN3RaeXFjVnRLME5SZWVXLzlKRFJXc2wr?=
 =?utf-8?B?TU9LOUd1S0VKUVpzb3U3TE1rakF3cmpjVGJKUGZjcUFodXEyK05NalYvNldK?=
 =?utf-8?B?NzZHVG83Ym1rVUpVRjdIL1owSHNZbk1mczBYSVk1dWFXVjJoZkd1RnptcXhl?=
 =?utf-8?B?RDlHWFZjNGhhVmJWRGt3dWVFbDUwR3lVOE5haGpMbVFkTUdQUHBSSkpPRU1l?=
 =?utf-8?B?RGk4VGx3S1dQV2ViM3RJNnV4YkNTdlp5N1hGYi92VllFQjBDRGJOQVhGVW4v?=
 =?utf-8?B?Vmp4WDc0eXJCZnVDeDJ1K3QzUERMMnB4ZE9oMmhLYWVnZ0tLK29mQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e147b07b-60e6-4b4d-4589-08de7b88ac79
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 14:00:07.5952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pYlFFYmy9NB3LSCkUtZhxPfXCmq4EO3OqiK38EoKlZ7KnFsyHRuA79k5roTkzhSt+O3m92OQvgubzOPSIOw9BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4625
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
X-Rspamd-Queue-Id: 2B01122236D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:email,intel.com:dkim,intel.com:email,intel.com:mid,gitlab.freedesktop.org:url];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rodrigo.vivi@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 08:39:56PM +0000, Souza, Jose wrote:
> On Fri, 2026-02-27 at 12:07 +0000, Satyanarayana K V P wrote:
> > When a PF is configured in admin-only mode, it is intended for
> > management
> > only and must not expose workload-facing capabilities to userspace.
> > 
> > Limit the exposed ioctl set in admin-only PF mode to XE_DEVICE_QUERY,
> > and
> > suppress capability-bearing query payloads so userspace cannot
> > discover
> > execution-related device details in this mode.
> 
> Mesa MR:
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/40206

Looking to this patch I got myself wondering if query.size == 0 is
long-term proof...   I mean, if we need to get some OA/RAS/telemetry
kind of API that end up needing some kind of query information....

Michals, thoughts on this?

I know, I know, this solution is indeed much better than my
proposal of no ioctl exposed. But I mean, since we are taking
this path and allowing some ioctl. Shouldn't we prepare at least
the query for that and then only limiting the number of engines
and memory regions to zero?

> 
> Acked-by: José Roberto de Souza <jose.souza@intel.com>
> 
> > 
> > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Michał Winiarski <michal.winiarski@intel.com>
> > Cc: Dunajski Bartosz <bartosz.dunajski@intel.com>
> > Cc: dri-devel@lists.freedesktop.org
> > 
> > ---
> > V4 -> V5:
> > - Updated commit message (Matt B).
> > - Introduced new driver_admin_only_pf structure (Michal Wajdeczko).
> > - Updated all query configs (Michal Wajdeczko).
> > - Renamed xe_device_is_admin_only() to xe_device_is_admin_only_pf()
> > - Fixed other review comments (Michal Wajdeczko).
> > 
> > V3 -> V4:
> > - Suppressed device capabilities in admin-only PF mode. (Wajdeczko)
> > 
> > V2 -> V3:
> > - Introduced new helper function xe_debugfs_create_files() to create
> > debugfs entries based on admin_only_pf mode or normal mode.
> > 
> > V1 -> V2:
> > - Rebased to latest drm-tip.
> > - Update update_minor_dev() to debugfs_minor_dev().
> > ---
> >  drivers/gpu/drm/xe/xe_device.c | 47 +++++++++++++++++++++++++++--
> >  drivers/gpu/drm/xe/xe_query.c  | 55 ++++++++++++++++++++++++--------
> > --
> >  drivers/gpu/drm/xe/xe_sriov.h  | 11 +++++++
> >  3 files changed, 94 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > b/drivers/gpu/drm/xe/xe_device.c
> > index 3462645ca13c..76d534491e01 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -25,6 +25,7 @@
> >  #include "regs/xe_regs.h"
> >  #include "xe_bo.h"
> >  #include "xe_bo_evict.h"
> > +#include "xe_configfs.h"
> >  #include "xe_debugfs.h"
> >  #include "xe_defaults.h"
> >  #include "xe_devcoredump.h"
> > @@ -213,6 +214,10 @@ static const struct drm_ioctl_desc xe_ioctls[] =
> > {
> >  			  DRM_RENDER_ALLOW),
> >  };
> >  
> > +static const struct drm_ioctl_desc xe_ioctls_admin_only_pf[] = {
> > +	DRM_IOCTL_DEF_DRV(XE_DEVICE_QUERY, xe_query_ioctl,
> > DRM_RENDER_ALLOW),
> > +};
> > +
> >  static long xe_drm_ioctl(struct file *file, unsigned int cmd,
> > unsigned long arg)
> >  {
> >  	struct drm_file *file_priv = file->private_data;
> > @@ -415,6 +420,29 @@ static struct drm_driver driver = {
> >  	.patchlevel = DRIVER_PATCHLEVEL,
> >  };
> >  
> > +static struct drm_driver driver_admin_only_pf  = {
> > +	.driver_features =
> > +	    DRIVER_GEM | DRIVER_GEM_GPUVA,
> > +	.open = xe_file_open,
> > +	.postclose = xe_file_close,
> > +
> > +	.gem_prime_import = xe_gem_prime_import,
> > +
> > +	.dumb_create = xe_bo_dumb_create,
> > +	.dumb_map_offset = drm_gem_ttm_dumb_map_offset,
> > +#ifdef CONFIG_PROC_FS
> > +	.show_fdinfo = xe_drm_client_fdinfo,
> > +#endif
> > +	.ioctls = xe_ioctls_admin_only_pf,
> > +	.num_ioctls = ARRAY_SIZE(xe_ioctls_admin_only_pf),
> > +	.fops = &xe_driver_fops,
> > +	.name = DRIVER_NAME,
> > +	.desc = DRIVER_DESC,
> > +	.major = DRIVER_MAJOR,
> > +	.minor = DRIVER_MINOR,
> > +	.patchlevel = DRIVER_PATCHLEVEL,
> > +};
> > +
> >  static void xe_device_destroy(struct drm_device *dev, void *dummy)
> >  {
> >  	struct xe_device *xe = to_xe_device(dev);
> > @@ -439,16 +467,24 @@ static void xe_device_destroy(struct drm_device
> > *dev, void *dummy)
> >  struct xe_device *xe_device_create(struct pci_dev *pdev,
> >  				   const struct pci_device_id *ent)
> >  {
> > +	struct drm_driver *active_drm_driver = &driver;
> >  	struct xe_device *xe;
> >  	int err;
> >  
> > -	xe_display_driver_set_hooks(&driver);
> > +	/*
> > +	 * Since XE device is not initialized yet, read from
> > configfs
> > +	 * directly to decide whether we are in admin-only PF mode
> > or not.
> > +	 */
> > +	if (xe_configfs_admin_only_pf(pdev))
> > +		active_drm_driver = &driver_admin_only_pf;
> > +
> > +	xe_display_driver_set_hooks(active_drm_driver);
> >  
> > -	err = aperture_remove_conflicting_pci_devices(pdev,
> > driver.name);
> > +	err = aperture_remove_conflicting_pci_devices(pdev,
> > active_drm_driver->name);
> >  	if (err)
> >  		return ERR_PTR(err);
> >  
> > -	xe = devm_drm_dev_alloc(&pdev->dev, &driver, struct
> > xe_device, drm);
> > +	xe = devm_drm_dev_alloc(&pdev->dev, active_drm_driver,
> > struct xe_device, drm);
> >  	if (IS_ERR(xe))
> >  		return xe;
> >  
> > @@ -708,6 +744,11 @@ int xe_device_probe_early(struct xe_device *xe)
> >  
> >  	xe_sriov_probe_early(xe);
> >  
> > +	if (xe_configfs_admin_only_pf(to_pci_dev(xe->drm.dev)) &&
> > !IS_SRIOV_PF(xe)) {
> > +		drm_err(&xe->drm, "Admin-only PF mode is enabled in
> > non PF mode\n");
> > +		return -ENODEV;
> > +	}
> > +
> >  	if (IS_SRIOV_VF(xe))
> >  		vf_update_device_info(xe);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_query.c
> > b/drivers/gpu/drm/xe/xe_query.c
> > index 34db266b723f..f46e62797dd6 100644
> > --- a/drivers/gpu/drm/xe/xe_query.c
> > +++ b/drivers/gpu/drm/xe/xe_query.c
> > @@ -55,6 +55,9 @@ static size_t calc_hw_engine_info_size(struct
> > xe_device *xe)
> >  	u8 gt_id;
> >  	int i = 0;
> >  
> > +	if (xe_device_is_admin_only_pf(xe))
> > +		return 0;
> > +
> >  	for_each_gt(gt, xe, gt_id)
> >  		for_each_hw_engine(hwe, gt, id) {
> >  			if (xe_hw_engine_is_reserved(hwe))
> > @@ -126,7 +129,10 @@ query_engine_cycles(struct xe_device *xe,
> >  	if (IS_SRIOV_VF(xe))
> >  		return -EOPNOTSUPP;
> >  
> > -	if (query->size == 0) {
> > +	if (xe_device_is_admin_only_pf(xe))
> > +		size = 0;
> > +
> > +	if (query->size == 0 || !size) {
> >  		query->size = size;
> >  		return 0;
> >  	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
> > @@ -190,7 +196,7 @@ static int query_engines(struct xe_device *xe,
> >  	u8 gt_id;
> >  	int i = 0;
> >  
> > -	if (query->size == 0) {
> > +	if (query->size == 0 || !size) {
> >  		query->size = size;
> >  		return 0;
> >  	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
> > @@ -231,6 +237,9 @@ static size_t calc_mem_regions_size(struct
> > xe_device *xe)
> >  	u32 num_managers = 1;
> >  	int i;
> >  
> > +	if (xe_device_is_admin_only_pf(xe))
> > +		return 0;
> > +
> >  	for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1; ++i)
> >  		if (ttm_manager_type(&xe->ttm, i))
> >  			num_managers++;
> > @@ -248,7 +257,7 @@ static int query_mem_regions(struct xe_device
> > *xe,
> >  	struct ttm_resource_manager *man;
> >  	int ret, i;
> >  
> > -	if (query->size == 0) {
> > +	if (query->size == 0 || !size) {
> >  		query->size = size;
> >  		return 0;
> >  	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
> > @@ -309,13 +318,13 @@ static int query_mem_regions(struct xe_device
> > *xe,
> >  static int query_config(struct xe_device *xe, struct
> > drm_xe_device_query *query)
> >  {
> >  	const u32 num_params =
> > DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY + 1;
> > -	size_t size =
> > +	size_t size = xe_device_is_admin_only_pf(xe) ? 0 :
> >  		sizeof(struct drm_xe_query_config) + num_params *
> > sizeof(u64);
> >  	struct drm_xe_query_config __user *query_ptr =
> >  		u64_to_user_ptr(query->data);
> >  	struct drm_xe_query_config *config;
> >  
> > -	if (query->size == 0) {
> > +	if (query->size == 0 || !size) {
> >  		query->size = size;
> >  		return 0;
> >  	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
> > @@ -358,15 +367,15 @@ static int query_config(struct xe_device *xe,
> > struct drm_xe_device_query *query)
> >  static int query_gt_list(struct xe_device *xe, struct
> > drm_xe_device_query *query)
> >  {
> >  	struct xe_gt *gt;
> > -	size_t size = sizeof(struct drm_xe_query_gt_list) +
> > -		xe->info.gt_count * sizeof(struct drm_xe_gt);
> > +	size_t size = xe_device_is_admin_only_pf(xe) ? 0 :
> > +		sizeof(struct drm_xe_query_gt_list) + xe-
> > >info.gt_count * sizeof(struct drm_xe_gt);
> >  	struct drm_xe_query_gt_list __user *query_ptr =
> >  		u64_to_user_ptr(query->data);
> >  	struct drm_xe_query_gt_list *gt_list;
> >  	int iter = 0;
> >  	u8 id;
> >  
> > -	if (query->size == 0) {
> > +	if (query->size == 0 || !size) {
> >  		query->size = size;
> >  		return 0;
> >  	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
> > @@ -436,7 +445,10 @@ static int query_hwconfig(struct xe_device *xe,
> >  	void __user *query_ptr = u64_to_user_ptr(query->data);
> >  	void *hwconfig;
> >  
> > -	if (query->size == 0) {
> > +	if (xe_device_is_admin_only_pf(xe))
> > +		size = 0;
> > +
> > +	if (query->size == 0 || !size) {
> >  		query->size = size;
> >  		return 0;
> >  	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
> > @@ -464,6 +476,9 @@ static size_t calc_topo_query_size(struct
> > xe_device *xe)
> >  	size_t query_size = 0;
> >  	int id;
> >  
> > +	if (xe_device_is_admin_only_pf(xe))
> > +		return 0;
> > +
> >  	for_each_gt(gt, xe, id) {
> >  		query_size += 3 * sizeof(struct
> > drm_xe_query_topology_mask) +
> >  			sizeof_field(struct xe_gt,
> > fuse_topo.g_dss_mask) +
> > @@ -505,7 +520,7 @@ static int query_gt_topology(struct xe_device
> > *xe,
> >  	struct xe_gt *gt;
> >  	int id;
> >  
> > -	if (query->size == 0) {
> > +	if (query->size == 0 || !size) {
> >  		query->size = size;
> >  		return 0;
> >  	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
> > @@ -559,11 +574,12 @@ static int
> >  query_uc_fw_version(struct xe_device *xe, struct drm_xe_device_query
> > *query)
> >  {
> >  	struct drm_xe_query_uc_fw_version __user *query_ptr =
> > u64_to_user_ptr(query->data);
> > -	size_t size = sizeof(struct drm_xe_query_uc_fw_version);
> > +	size_t size = xe_device_is_admin_only_pf(xe) ? 0 :
> > +		sizeof(struct drm_xe_query_uc_fw_version);
> >  	struct drm_xe_query_uc_fw_version resp;
> >  	struct xe_uc_fw_version *version = NULL;
> >  
> > -	if (query->size == 0) {
> > +	if (query->size == 0 || !size) {
> >  		query->size = size;
> >  		return 0;
> >  	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
> > @@ -634,6 +650,9 @@ static size_t calc_oa_unit_query_size(struct
> > xe_device *xe)
> >  	struct xe_gt *gt;
> >  	int i, id;
> >  
> > +	if (xe_device_is_admin_only_pf(xe))
> > +		return 0;
> > +
> >  	for_each_gt(gt, xe, id) {
> >  		for (i = 0; i < gt->oa.num_oa_units; i++) {
> >  			size += sizeof(struct drm_xe_oa_unit);
> > @@ -659,7 +678,7 @@ static int query_oa_units(struct xe_device *xe,
> >  	struct xe_gt *gt;
> >  	u8 *pdu;
> >  
> > -	if (query->size == 0) {
> > +	if (query->size == 0 || !size) {
> >  		query->size = size;
> >  		return 0;
> >  	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
> > @@ -711,11 +730,12 @@ static int query_oa_units(struct xe_device *xe,
> >  static int query_pxp_status(struct xe_device *xe, struct
> > drm_xe_device_query *query)
> >  {
> >  	struct drm_xe_query_pxp_status __user *query_ptr =
> > u64_to_user_ptr(query->data);
> > -	size_t size = sizeof(struct drm_xe_query_pxp_status);
> > +	size_t size = xe_device_is_admin_only_pf(xe) ? 0 :
> > +		sizeof(struct drm_xe_query_pxp_status);
> >  	struct drm_xe_query_pxp_status resp = { 0 };
> >  	int ret;
> >  
> > -	if (query->size == 0) {
> > +	if (query->size == 0 || !size) {
> >  		query->size = size;
> >  		return 0;
> >  	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
> > @@ -751,7 +771,10 @@ static int query_eu_stall(struct xe_device *xe,
> >  	array_size = xe_eu_stall_get_sampling_rates(&num_rates,
> > &rates);
> >  	size = sizeof(struct drm_xe_query_eu_stall) + array_size;
> >  
> > -	if (query->size == 0) {
> > +	if (xe_device_is_admin_only_pf(xe))
> > +		size = 0;
> > +
> > +	if (query->size == 0 || !size) {
> >  		query->size = size;
> >  		return 0;
> >  	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
> > diff --git a/drivers/gpu/drm/xe/xe_sriov.h
> > b/drivers/gpu/drm/xe/xe_sriov.h
> > index 72e55543c30e..ee84978350aa 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov.h
> > @@ -37,6 +37,17 @@ static inline bool xe_device_is_sriov_vf(const
> > struct xe_device *xe)
> >  	return xe_device_sriov_mode(xe) == XE_SRIOV_MODE_VF;
> >  }
> >  
> > +/**
> > + * xe_device_is_admin_only_pf() - Check whether device is admin only
> > PF or not.
> > + * @xe: the &xe_device to check
> > + *
> > + * Return: true if the device is admin only PF, false otherwise.
> > + */
> > +static inline bool xe_device_is_admin_only_pf(const struct xe_device
> > *xe)
> > +{
> > +	return xe_device_is_sriov_pf(xe) && xe->sriov.pf.admin_only;
> > +}
> > +
> >  #define IS_SRIOV_PF(xe) xe_device_is_sriov_pf(xe)
> >  #define IS_SRIOV_VF(xe) xe_device_is_sriov_vf(xe)
> >  
