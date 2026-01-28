Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JD/NIhmemmB5gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 20:42:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C18F9A839B
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 20:41:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD50010E756;
	Wed, 28 Jan 2026 19:41:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IBsw2yZV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400AF10E2E4;
 Wed, 28 Jan 2026 19:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769629316; x=1801165316;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=IC1kRKE+UMFxq/AqD1k8cZ+FV/3pMEnAPWunVj831wA=;
 b=IBsw2yZVKvMoZVMwaZCHi10lbV3288aelzQWKvV0u6uuXfA0w3zJS8Vr
 MOt4wneNO7uSZ4EZw2NJ+xAkRrlEH74/3A1hChpACJzlEcNGnxEq5dUPk
 W4BQgvILcHASUWyzZQB+tXfgW4hvT8tRO1NeFb2pm/Wsc7dz+fHd3xMc5
 vOX4ePssK8c3ZhsuCSOwtNScZ781oyP5IsdPTx+d6Srn/xVpOYDNiiuE+
 VMv1lkMJPgZ0+TvNQCZpwlxeeeqIYA1rLV+e8rMeJmEuSQWsIFmIuqDwy
 7n+Vkzz17ej0TafzyLXaGAnb27mr5OhMje/tz/e+oPygyfoNwZpS9PHom w==;
X-CSE-ConnectionGUID: MzxddxhJR4yLzoT+JA4EBQ==
X-CSE-MsgGUID: fzGcCc6CQTeEvbx04HTojQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70828490"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="70828490"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 11:41:55 -0800
X-CSE-ConnectionGUID: dsul814ISBCdDgkwCXb8PA==
X-CSE-MsgGUID: 0RJ9gWAXTMmJBWLoSU9YGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="208787154"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 11:41:54 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 11:41:53 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 11:41:53 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 11:41:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fEKeNwDNmEwHvnrtDTTHABpiSHTI9By0Gqkf/Xbvmg7dqrAMdocuNKxX3XY3J2YcBUNqzjJym/pHrbwq8U4Fn2Lh4mpV2aG7KB42knTa6XBduAHJcvJ2u3mZD37eN+uxSsqh5N9ofcLvvAkvzbXo+spx5Z+1/C7rFIvHM67PhqUOrnhJKu4f3Qp05XX3MLL2zt44q8W+M+POXiJy/9c6te0nkDPZPedC/MOpEO9HlFM4TXFyXfv+6krN3700dw1E4eHKZjZk91YQUjQpSkuI379FJ4+fHAxtF/We5pYyGEYZml7OomhtlpFzksPZ3zPISz/esCTnVV2ODD+UJmLwqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cZBE8rWNWaDwS7ngxSJPxZN5Qg6PJMboeqYlW2iEGkM=;
 b=WtmSonFPihYksjV9OCb+OcGT3N5fuuY635wug5okrsXzFaKq4f+3jn0xlZf+MsYdL37pN1mY+BGWIQ47Y2dbkMad9rwJq+3/4iG2x232LzofumBbPSZUlURz/su4HnE792xXOf1k82qThaDViqUDT+sDOKIpDlF6gzdde0uJ3XK270IABOq/USlX9if/SDG807H4wV8k3Efrm126Xtt42pqA7u5EOqWyN4JDC7GeqL7QDLu5SjBi/j/dmfWl8Gtz4e9grqaEVshEbZxObIlVc+FR4bedh226lW5KDrxl5jKAuGNvLRiIXEJa2VoIQIgqsTNuUpDQPn9oB5HHngts3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4970.namprd11.prod.outlook.com (2603:10b6:806:11f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Wed, 28 Jan
 2026 19:41:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 19:41:51 +0000
Date: Wed, 28 Jan 2026 11:41:48 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <leonro@nvidia.com>, <francois.dugast@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [RFC PATCH v3 06/11] drm/pagemap: Add IOVA interface to DRM
 pagemap
Message-ID: <aXpmfFFVVjhvY+Vx@lstrano-desk.jf.intel.com>
References: <20260128004841.2436896-1-matthew.brost@intel.com>
 <20260128004841.2436896-7-matthew.brost@intel.com>
 <20260128151458.GJ1641016@ziepe.ca>
 <aXpYrfUmEaaOsse8@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXpYrfUmEaaOsse8@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:303:8f::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4970:EE_
X-MS-Office365-Filtering-Correlation-Id: f1346cae-69db-4a46-37dd-08de5ea5487c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ak4rV2tIUkVXTmYvU296czN1ZGNkdjh6V3U0ZGZPa2psZ3krUGVscXM1TlVh?=
 =?utf-8?B?TGN3ejR4TGZCZTJ0WnpMd3dmVEtGbGg5MEhXUVg4U2dmcElBV1JmQ0E0OS9q?=
 =?utf-8?B?NTFaYXpRYWk0alVWZ3ZZWU5BL3I5Zml3MUk5YkpYTXRJZUM5SDliM0ltOSty?=
 =?utf-8?B?ZkdsWjdDK25BNSt4U0xXeTljSmwzVS9hWW9hZFlXeHVhdG1obldVZTUvMGhx?=
 =?utf-8?B?aUU2QmZhWUpRTGEyeklEdXFNRnNIcTdmQ3BrYXRaNlU0MW4zQ3B4U0llTnJD?=
 =?utf-8?B?WDIydzdDL0NkR1FiOG1xakxpQmNOSDBWYkgzeUJXQmlFQXBKSldrblQyOFdn?=
 =?utf-8?B?UTQvbE5CeGF1cy8rS0liL1dHSTkvaC94WGtOVUlTbnQ1c29lOUVscjZVTzdR?=
 =?utf-8?B?ZkJoSlBScUpEOHVpMmt3QktiWnQxVUVmWkkyeFIwMkR6UmNkdmdOUTNTMFVs?=
 =?utf-8?B?elNtNTZKRFRVck1CcjFCTjYzdzUvTDVzMzFtZExPWlFJU25DekMxWmtlekov?=
 =?utf-8?B?WS9hM0VnUDN6RzFZZSt5SVBMVzN1YjJrMjI4dmxYNjNBSnh2cU13S1hsNEFG?=
 =?utf-8?B?OVV5S0syaHVDd2Fsc2tUSk5qTHhLR0dSaXV3MDR4Tk00TityMWxFT1kvU1Iy?=
 =?utf-8?B?cGVidktObWFpeHJTdEVpMVlXWFFTZlBZNFdubGFpV2k0WFlwZnBzVDRjdEc5?=
 =?utf-8?B?RUtYdlRqTWs5ejZCSXJ1QXE0NGMvak5sVXA4SXVOTXFDbW9yK3A4cTl0YmJ6?=
 =?utf-8?B?SDlQT1RERmc1eTFxeDRPa3RBM0tEV1NRb1YwVkZQMTd3emliUDJOWWJXL3VB?=
 =?utf-8?B?UmJQazRUUlJITWdsZlhrNDIyUmorQWM0cU42bnJ1OFRySy85TEs5VTJDcnEr?=
 =?utf-8?B?SVdORGNhekNjUGgxcWxRVHhrcC9tNXBSaEdHZWVXL25iWnJ2dmlJdW1KVkpn?=
 =?utf-8?B?ZE4zVVdCYzRHWUdXOC9xeU1UZU92WE8vUlc2WE5FYjBQVjJUbHAzQ2s0bkhJ?=
 =?utf-8?B?Z1ZCbkJET0pobGhIcVlSdGRBVDBvSXd4OFlScDVERVVpcWRiQkpYUGt4QzJR?=
 =?utf-8?B?YnJFODQ3bDZxYUxuTTVJOWpBTGlGMm5HLzFWbmxxOXVkeXV1ejRPNUFaM3RN?=
 =?utf-8?B?L3lGd09mZGRUdzdYTE1sT0xtRDlWYVZjejA4YkV2Ly9tMHhNSGZudXNXMEE5?=
 =?utf-8?B?cVhsTUtyWGR2cXRFSDB2UStoNEFTUWt1TTRvOW1ybU5ueG1ZNUpVOUw4QWhU?=
 =?utf-8?B?L2E5MkdEQUZndXA5cUVxTVZpR1NqemlXaXc2WjFnR0NmQTFpSmU5V3pUa2Q5?=
 =?utf-8?B?eENqNEp6Q0xENHlkTWhOY0d5M2d1U2NTNWpyaDQzQWU5UHN2TlRPM2lydnZV?=
 =?utf-8?B?UHdJQnhWTVhsTnZvK2tRTDNkWVIvVFBWYW4wOUtPakxZQXcrVmpzbndwVk93?=
 =?utf-8?B?L213K0FuT1RzYUk5VjdpVExwS2VOMnhmcmV6TGlYWmdnbXFJMlF2RmFWTk53?=
 =?utf-8?B?MnNXTmNIRzJMNHJoRS9VaDlxd3d3aGFzRkk4ZHRhWUtkQ2FWa0hVdmRVZXJS?=
 =?utf-8?B?bG5RdlBrTm8xRzRhNlFqeSsrZnRjeHpuWDIxV1oxRlE1M04vRTBpMFVUU1M0?=
 =?utf-8?B?ZDFkTk11Z0ZvMDlUeWovdU1zMmxXYnhvVlhSa292V1M0aUhNeVRPWE5MWXl1?=
 =?utf-8?B?dXQ3TjBHMDMrZ1JnN3hGd0htbDUxZVJTbHU2dEowMGd6eGp1dStvZGU1a09i?=
 =?utf-8?B?RWlsejhJZnE5VmRaSnZYK0NTRDFKN2ViVGdUdnEvUk9jZ0R4dUkyekh2Sk9B?=
 =?utf-8?B?d3Q0b0gzWWsrOEU3QnA0bTd3bytaMmtzVEpTVjZWb3Fyd3hXMGdPc1QzSzE1?=
 =?utf-8?B?cGxzeUY1NHpJWG5uS293aUpvRGNWY0hFUnNNU2lyTVJPWCtqTkJrd2l4RUl1?=
 =?utf-8?B?RWNjL0ZiMUFDQXBnNUxCM0w4NEVSdC9YQ1FsUTlBNjNWUEh3QWhER0d0Sjc5?=
 =?utf-8?B?ajBYQzZGNkRCbHl1OUF0Z0NvRnJKeWkzelJGVzdvNWpzeXQzTDhaUUViVjlW?=
 =?utf-8?Q?/+IiPG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFhuMkQ1Qy8vSkN3cGpUaS96TnBGaTl1UW9sdHd5T3cvTzhVZlNBeEZScVMw?=
 =?utf-8?B?QmNqK0pwRUc2a3g1WWlENEZWYTZUK2ZhMjU0Ky81ejhOditwb015Z1pqejFN?=
 =?utf-8?B?L1kyVVlkY2pzeW40WElVc0U4eFQ4UEt6OXBzRm51MzhvVCt4MjlQTkxIRmtH?=
 =?utf-8?B?RU10Q0xlSnRwNUhYWjh2K1FySXowTXFiU2djVmtPOVptOWhrbGw5RjMxdm1v?=
 =?utf-8?B?eVA4V3pLcHBRUjdvWVFucG40TjBOQUxUL2Y2dE9SWlFRcFFQTDdxTnhNeU12?=
 =?utf-8?B?ODhwNWR2Sit0Z3JycllFS3FRaVJOM1A2eGN3MzBvSDBSYXJYT0VuZmNMWmJt?=
 =?utf-8?B?c3lidWlHYkdIT05nUGRhdTJtY1hSelhKT3RGWDdZRXlaV3R6bDJIVVNmUVY1?=
 =?utf-8?B?aUhIL3IySzUvZU44SHQ4aXpkYnkxVk8wUW1wbXFHNzlCUVRKbm43SGh0dmk4?=
 =?utf-8?B?RWtWbGxmZFExbEFLbzBVV3ZlQnoyZ2ZTT1BxeGJSRkpHOWk4b2lkNXdkWE5C?=
 =?utf-8?B?ZWhOSXhpVzdmS0pzNTh4NVFQL2c3cndEN1kvUElkNUl2amo2Um05T1pzdzNy?=
 =?utf-8?B?a1JTTFlQUmEyLzRURVJSQzk4cXA3d0swTkdhRmNDcWp4amhyR1JLOFhleWNi?=
 =?utf-8?B?SE8rS1gzWWRrU2ppNjZuZXZUd2E4MzhqWXNSMGxKb0w4S3dPSFlDYWRmQWh6?=
 =?utf-8?B?YWdnU0JoTjh4RG1WOENpU2Jqc1ZmQk5oT1hpbFFjNGU2T3V4Tk94MU5KaFJT?=
 =?utf-8?B?ajJzWk1GMmdQMWxvS1VaZzBXclFFUTdaekVzeC9EbklyRFpGSDR4OU9FMzlm?=
 =?utf-8?B?TmhDTGtYSW9sQi9qOUxqVkpHWGQ0KzFRREd5SmY3OWM0cFNiV01kZ3NYZEFz?=
 =?utf-8?B?UWR0bFZiTncyN085bi9IaG1DOW51cGx1UWplS1Y3M3Y0eEZhRXVPcFlRRlBz?=
 =?utf-8?B?K3IzaCtQazdjazhENTIxUmp3L2lBUTQ3K3RFWkFNT0ZackVqcGZFVEsyMzFM?=
 =?utf-8?B?VUNmYlpUYklaU3dmSkdoMjJjZnowK3Q0WEo2RTJ2aTJNT2FWdGxMRnpUMFp0?=
 =?utf-8?B?WnVPdTExeHBSS3ovYWdxRnpjaTI1U3BkcTBhVlBFRU1nbEVqYjk2V0pMTzQw?=
 =?utf-8?B?Q0QzdEZoaEsyUkwxMll3UVZIcnFESjBPVmRtQi92NlpjRVlmUFRkbm85cXR2?=
 =?utf-8?B?a2o1MzJzQ0FTRllTeHF5TXI0S0ZvZVU5TFpVcTBWWXNDWm1SZ00xc1IyVjRi?=
 =?utf-8?B?SWdKbXdzajloTGZ6aFRZODdEUzZmTUNxUElSOVJoKytRakdyUllHY2xEaFNQ?=
 =?utf-8?B?Uk5lTFI1NjQvUVFSK3lCOCtMcFVoK1lBaDNJWkJtMFlSZUlhZWo3SEMzK296?=
 =?utf-8?B?TTRzUTA1RkIrY3Y5ajJSNmVScmUrckZieHY0TXlGZ3FJbENTV3dvZVRidmRD?=
 =?utf-8?B?aXBuVUo4UHlEYWtCN2Vpd2RiMiswdjZDME9XejhROWVaZ1JoU1kydy9lRzJs?=
 =?utf-8?B?b3IwenNYMTdjZDVsUUdHVW9lWllQRVYvNU1UdjJ3eTh0TmlUK0hnS3VBeXNO?=
 =?utf-8?B?UjU1QWQzTHZhNllGelRyQTNvRzZpUTFrdHhJQlRRbzNJZDJBeEpQekFWcnV2?=
 =?utf-8?B?aXVlaHBTMFMzVmNFbStDNk5wZ0VZRThDTE5MQ0hXTi8wTitXNG1TN0N2N3Fs?=
 =?utf-8?B?bmV2T1BzVWprRi9nMUpBUG1TRExrOFhiWFMzS0YxRU9FSUsyL0cwRlRxOW1y?=
 =?utf-8?B?RVVsK1BOc3Q5K1p0cDI0N3h5cUFESkVJUlpBN0ZSRmhod0FBWEhyMGNvdGFK?=
 =?utf-8?B?QW9jM212S21aTnEwK1piOHp1eFJVWTUxMjUxTld3end4eHdBWm5Wd3RFZW1E?=
 =?utf-8?B?ZDBmNkNDeHdwOHI3U0FUYUl5Zko1eWdNbnNLY2RUcE1vbGE0NXhNYm9ZNWxv?=
 =?utf-8?B?c3hscFBDanR1N0tGNHI0NldkVzBVN09LcGVaZmFObkFCQU4xQ3JrdUkrblYr?=
 =?utf-8?B?azNmdEZhY3BGQzNaZG5ZVTVJQlFSVWRLeXpPZjZZVzl2cFBaR3NtQjdNWUlI?=
 =?utf-8?B?VWVUTU9yUDRFaDJqYjI2cys1Wkd6Y3ZNWGlRWEdTTUlTaHJ4ekJmQU5ZYk9l?=
 =?utf-8?B?cExHZ21Ta0xYSWhOQ0V1dmNmcG9NTVYzMWNlTWJoeEZ4SSs4eEFwWjJPQ2RI?=
 =?utf-8?B?UDFCTmYzZjB4Mk1BakthOXVXZ0JKZmNqMmdrM2kwdHhoWFNzOW94V0Z4bUdE?=
 =?utf-8?B?bWZtTjllZjFlc0M0ZVVFay80TmtKLzhzS0hXZ0d2YkMwbzBaWFN0WmtLLzcz?=
 =?utf-8?B?blU1cXYzN2JBNnBuTlB6Y0JJam9PTkNTQ0ZhWVlsajBXMngrT0xwTjVNNlBP?=
 =?utf-8?Q?RY+IjULBtCqGUzqw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1346cae-69db-4a46-37dd-08de5ea5487c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 19:41:51.3259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bGV3jXUEnpuRkNaL3EOtpf/9uODiHkNtAuTrBzKmMufYphrXApJND0S+RH4qZyckQ9dZ4+cXiojOq04H6QfUtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4970
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lstrano-desk.jf.intel.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: C18F9A839B
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 10:42:53AM -0800, Matthew Brost wrote:

Let me fix a couple typos...

> On Wed, Jan 28, 2026 at 11:14:58AM -0400, Jason Gunthorpe wrote:
> > On Tue, Jan 27, 2026 at 04:48:36PM -0800, Matthew Brost wrote:
> > > Add an IOVA interface to the DRM pagemap layer. This provides a semantic
> > > wrapper around the dma-map IOVA alloc/link/sync/unlink/free API while
> > > remaining flexible enough to support future high-speed interconnects
> > > between devices.
> > 
> > I don't think this is a very clear justification.
> > 
> > "IOVA" and dma_addr_t should be strictly reserved for communication
> > that flows through the interconnect that Linux struct device is aware
> > of (ie the PCIe fabric). It should not ever be used for "high speed
> > interconnects" implying some private and hidden things like
> > xgmi/nvlink/ualink type stuff.
> > 
> 
> Yes, the future is looking forward to xgmi/nvlink/ualink type stuff. I
> agree we (DRM pagemap, GPU SVM, Xe) need a refactor to avoid using
> dma_addr_t for any interfaces here once we unify this xgmi/nvlink/ualink
> as dma_addr_t doesn't make tons of sense. This is a PoC the code structure.
> s/IOVA/something else/ for interfaces may make sense too.
> 
> > I can't think of any reason why you'd want to delegate constructing
> > the IOVA to some other code. I can imagine you'd want to get a pfn
> > list from someplace else and turn that into a mapping.
> >
> 
> Yes, this is exactly what I envision here. First, let me explain the
> possible addressing modes on the UAL fabric:
> 
>  - Physical (akin to IOMMU passthrough)
>  - Virtual (akin to IOMMU enabled)
> 
> Physical mode is straightforward — resolve the PFN to a cross-device
> physical address, then install it into the initiator’s page tables along
> with a bit indicating routing over the network. In this mode, the vfuncs
> here are basically NOPs.
> 
> Virtual mode is the tricky one. There are addressing modes where a
> virtual address must be allocated at the target device (i.e., the
> address on the wire is translated at the target via a page-table walk).
> This is why the code is structured the way it is, and why I envision a
> UAL API that mirrors dma-map. At the initiator the initiator target

s/initiator target/target

> virtual addresss is installed the page tables along with a bit
> indicating routing over the network.
> 
> Let me give some examples of what this would look like in a few of the
> vfuncs — see [1] for the dma-map implementation. Also ignore dma_addr_t
> abuse for now.
> 
> [1] https://patchwork.freedesktop.org/patch/701149/?series=160587&rev=3
> 
> struct xe_svm_iova_cookie {
> 	struct dma_iova_state state;
> 	struct ual_iova_state ual_state;
> };
> 
> static void *xe_drm_pagemap_device_iova_alloc(struct drm_pagemap *dpagemap,
>  					      struct device *dev, size_t length,
>  					      enum dma_data_direction dir)
> {
> 	struct device *pgmap_dev = dpagemap->drm->dev;
> 	struct xe_svm_iova_cookie *cookie;
> 	static bool locking_proved = false;
> 
> 	xe_drm_pagemap_device_iova_prove_locking(&locking_proved);
> 
> 	if (pgmap_dev == dev)
> 		return NULL;
> 
> 	cookie = kzalloc(sizeof(*cookie), GFP_KERNEL);
> 	if (!cookie)
> 		return NULL;
> 
> 	if (ual_distance(pgmap_dev, dev) < 0) {
> 		dma_iova_try_alloc(dev, &cookie->state, length >= SZ_2M ? SZ_2M : 0,
> 				   length);
> 		if (dma_use_iova(&cookie->state))
> 			return cookie;
> 	} else {
> 		err = ual_iova_try_alloc(pgmap_dev, &cookie->ual_state,
> 					 length >= SZ_2M ? SZ_2M : 0,
> 					 length);
> 		if (err)
> 			return ERR_PTR(err);
> 
> 		if (ual_use_iova(&cookie->state))

s/ual_use_iova(&cookie->state)/ual_use_iova(&cookie->ual_state)

> 			return cookie;
> 	}
> 
> 	kfree(cookie);
>  	return NULL;
> }
> 
> So, here in physical mode - 'ual_use_iova' would return false, true in virtual.
> 
> This function is also interesting because ual_iova_try_alloc in virtual
> mode can allocate memory for PTEs on the target device. This is why the
> kernel doc explanation for Context, along with
> xe_drm_pagemap_device_iova_prove_locking, is important to ensure that
> all the locking is correct.
> 
> Now this function:
> 
> static struct drm_pagemap_addr
> xe_drm_pagemap_device_iova_link(struct drm_pagemap *dpagemap,
> 				struct device *dev, struct page *page,
> 				size_t length, size_t offset, void *cookie,
> 				enum dma_data_direction dir)
> {
> 	struct device *pgmap_dev = dpagemap->drm->dev;
> 	struct xe_svm_iova_cookie *__cookie = cookie;
> 	struct xe_device *xe = to_xe_device(dpagemap->drm);
> 	enum drm_interconnect_protocol prot;
> 	dma_addr_t addr;
> 	int err;
> 
> 	if (dma_use_iova(&__cookie->state) {
> 		addr = __cookie->state.addr + offset;
> 		proto = XE_INTERCONNECT_P2P;
> 		err = dma_iova_link(dev, &__cookie->state, xe_page_to_pcie(page),
> 				    offset, length, dir, DMA_ATTR_SKIP_CPU_SYNC |
> 				    DMA_ATTR_MMIO);
> 	} else {
> 		addr = __cookie->ual_state.addr + offset;
> 		proto = XE_INTERCONNECT_VRAM;	/* Also means over fabric */
> 		err = ual_iova_link(dev, &__cookie->ual_state, xe_page_to_pcie(page),

s/xe_page_to_pcie/xe_page_to_dpa

Matt

> 				    offset, length, dir);
> 	}
> 	if (err)
> 		addr = DMA_MAPPING_ERROR;
> 
> 	return drm_pagemap_addr_encode(addr, proto, ilog2(length), dir);
> }
> 
> Note that the above function can only be called in virtual mode (i.e.,
> the first function returns an IOVA cookie). Here we’d jam the target’s
> PTEs with physical page addresses (reclaim-safe) and return the network
> virtual address.
> 
> Lastly a physical UAL example (i.e., first function returns NULL).
> 
> static struct drm_pagemap_addr
> xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
>                           struct device *dev,
>                           struct page *page,
>                           unsigned int order,
>                           enum dma_data_direction dir)
> {
>         struct device *pgmap_dev = dpagemap->drm->dev;
>         enum drm_interconnect_protocol prot;
>         dma_addr_t addr;
> 
>         if (pgmap_dev == dev || ual_distance(pgmap_dev, dev) >= 0) {
>                 addr = xe_page_to_dpa(page);
>                 prot = XE_INTERCONNECT_VRAM;
>         } else {
>                 addr = dma_map_resource(dev,
>                                         xe_page_to_pcie(page),
>                                         PAGE_SIZE << order, dir,
>                                         DMA_ATTR_SKIP_CPU_SYNC);
>                 prot = XE_INTERCONNECT_P2P;
>         }
> 
>         return drm_pagemap_addr_encode(addr, prot, order, dir);
> }
> 
> So, if it isn’t clear — these vfuncs hide whether PCIe P2P is being used
> (IOMMU in passthrough or enabled) or UAL is being used (physical or
> virtual) for DRM common layer. They manage the resources for the
> connection and provide the information needed to program the initiator
> PTEs (address + “use interconnect” vs. “use PCIe P2P bit”).
> 
> This reasoning is why it would be nice if drivers were allowed to
> dma-map IOVA alloc/link/sync/unlink/free API for PCIe P2P directly.
> 
> > My understanding of all the private interconnects is you get an
> > interconnect address and program it directly into the device HW,
> > possibly with a "use interconnect" bit, and the device never touches
> > the PCIe fabric at all.
> > 
> 
> Yes, but see physical vs virtual explaination. The "use interconnect" is
> just one part of this.
> 
> Matt
> 
> > Jason
