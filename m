Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEZqDx6hb2ntCgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 16:37:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B03463C3
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 16:37:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E14610E5ED;
	Tue, 20 Jan 2026 13:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MHjpHHf5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E237310E5ED;
 Tue, 20 Jan 2026 13:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768917510; x=1800453510;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=WmQRVWLhWQFzZsAZdPDem7pwKVr2x6vNyX6mbpiCKZM=;
 b=MHjpHHf5CdyFsAQGlHhhmxTEYIXHw1WQpvVzg+lV2yTkPyOOw4CsxedB
 Gb6ap0hvTEN64d8/V/ABsr2na1pLfbqkEcflssbznnt1UvalzYbQOw8L4
 q0huOM9yx42Ve6WupLrZT+zZUQPEBsxLKn2YXpCyz0TcEdykKn5BRMGBW
 x53Jtlol4nnpHwxbni1nWNf1UwFE9esfevDwd+uEsVTDF3o+n5Mu8KAPl
 N6ompuP12FTALk72rrIRCDW818j7leFEBGhqvxJ3krswSrIbGHVRQJQC3
 CjUgJn6beOSpl3nLJyyTrRy3xLsPJZ7MET2c4oLIL9I1DYglspCvqRJqp w==;
X-CSE-ConnectionGUID: J00orA+ZSXSsqyrMDuuHIg==
X-CSE-MsgGUID: CKHahLf6RNilbeQ3IKJDUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70097395"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="70097395"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 05:58:29 -0800
X-CSE-ConnectionGUID: dM9MVjOARFCjA4AcIKzOJg==
X-CSE-MsgGUID: zL9loC45QVeFM74/Cw3cxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="211132739"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 05:58:30 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 05:58:28 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 05:58:28 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.64) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 05:58:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mZGUin9766+Dh9JMB9CpnbFQBFkEJ1w59UVRUOC4YXzcx8nbrGJai267/wql/tj4xJi7w2z3i0j0waVtW4pyGdTgNmIx3WRYbrfcMbbb+8JriDGhR+OzVXcA7soaKq691HL/YyM64p9NnD8hH+61tj3PtFnPbdgStNyGmGUSPOxPavk4LTBrJsVM/MLXRbyXJzMqIObMA/oLNnTKuEukRNYBAMHoJL21NdOIMlAFQe/2r/1A3JgKGJ83OD0ujEUyhtbxQWM3OGhfJdUErVLAR/NMnnYS2p6cGtEXDzJddwmekdju9VPI5pfLLgzVAA8YzXQKye8HsIYyNOV8lNUNxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vwP90FLFzIMyqKEOqWNo1ICnxPzjO+EEZJayygeb8dg=;
 b=LN6NUGIKpN+vCTAlYQLwicbGnwYEkCWjd/vc2eL/ZSEwg2AF+d4F8pC9Vnnx2F71FkkhzOp4GnAOSZzeFvMjtSddAQdyoI213+2f5MI2ILYlKpUn8jCHkQOTa9LldCpKjtXZkU7o5/yIpQifqYJ/9wKEB1KR5PwQI+ZDDNiPljp3ugKrtSYH5KXapp081m2kO/xIqXbGy0Vx10BDrHiid2wJbC/uW4DlffLI/krSgHQar9rTwnkF+ncEL9pN8mK5xD5bxsMYd+pFwvEKpfQmtoKB6r/Wfh9HvrdhDDBB3Rzpxx2FaGwNfBsBchWPYRThOj+bRW8lDjP3Z9d4Ql+ZOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 13:58:26 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%3]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 13:58:26 +0000
Date: Tue, 20 Jan 2026 13:58:08 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, Andi Shyti
 <andi.shyti@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Krzysztof Karas
 <krzysztof.karas@intel.com>
Subject: [PATCH] drm: Unwind drm device registration upon error
Message-ID: <svtvqbauaqamxyqc43s2lsj4cj7ql2dk45fzujh5sr5g7pi77a@vb2f5f7zixqr>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
X-ClientProxiedBy: TL2P290CA0025.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::20) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|CH3PR11MB7180:EE_
X-MS-Office365-Filtering-Correlation-Id: 9736a867-740e-41e4-1959-08de582bfb96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MmExbk8zT2VwQTRTVXpMdkx4YUtqTXR3SUhoTnA5WU9yWkpHSXYva3pTK0xT?=
 =?utf-8?B?NHJ3Yno4VVZMYW9TMXI0Snl1TnJJY1RJS0VFa24zZkRaLzZFbjEzSkJGSkpx?=
 =?utf-8?B?QnA0eFBTLzVGbllQWEt4ZWhTMW5xSzFFVDI1VGlqQkJydHVoOUs5SEVkNHMr?=
 =?utf-8?B?UFI4T0dWcEpORS8xV2FZOUI2b3lEWHJpWFYrR0dVWlUrazFScDZiSHdFSWsv?=
 =?utf-8?B?TTBmekJWMWVQQUhTQ24wK05Ob1lQRlFSRDNPalhnSytPY1d6UjVybTJCeVFj?=
 =?utf-8?B?bDY3UVZSQTdaeUdoZE96NFQ1SEtPMGZ0OVVsK2pPRDBPVUg1MUNVTDUzN3M2?=
 =?utf-8?B?ay9XaFdEaVNhRG1pWkNjelpDNUVQRjRTUENhWVFraGJ6enl1SUdEOWZMNUdq?=
 =?utf-8?B?UW8rV1FBUzI1ZWNiY0NaNzlrWEZpTlAxaUgvZVZqMi92NGdSeGIyNDVzdGUw?=
 =?utf-8?B?THZETmkxVmMzQkp4YVR5V1hiMnhla0VCRUxwSmZMWUFtVmR5THFTNzhDM05u?=
 =?utf-8?B?TlE2ZTA5RlYyNUtsTzdCeHQ0SmVSYXBwMFZjVzVMbTA2dFYzOHRYbWprZTd1?=
 =?utf-8?B?WGtBUHc3NTBucGloc1JkeHlDOVhpR2Evd011UGIvYk9zY3NRVlUzOXdYVFlw?=
 =?utf-8?B?TmVoYnhhYXZ3Umk5MGYwZldrZTVrTmhsU3MxdnBMNkRiSHJBWnZRS1NtM0Ez?=
 =?utf-8?B?c2g2RDJCalhHaHJiS2RyYWxneUNHNUNIakdYNVZ5TjV5RlpmS3A5Nm1FamU0?=
 =?utf-8?B?YUk5b2pXTE5KM3pGdUdhMUMycGtpdmMwSjEzZGJLTWtZV1BaaFF2bGwzTVYw?=
 =?utf-8?B?bUpGWGdySzRVK1haeXRWdDA3bU1wMkx1VFhKdnJjMVRkTWFWNUpUa052bFJx?=
 =?utf-8?B?RDNWUnVBd3JzVFZmRlhXRm1jZGNNR3RSTVhVNWNaU3hHZnNvN2F4UEcxd0oy?=
 =?utf-8?B?bzFSK0VpWVhGSS9QS2t0YVAyWnVCeVNQM1psaHlZSGdjOVNrR0xtVDFsckJX?=
 =?utf-8?B?SXI5WkdQSlNxdDkxR3hrOG1pQWllTmxqeUdOV3hlVTdoY2JBekRDRHNaT3lY?=
 =?utf-8?B?Wk1mT0tGVTQ2ek91RXlzZUllbGxMbFhsSkRjZEJ4L0thZU8zOWgwRDd3Y2Fi?=
 =?utf-8?B?bVhpYjhYSWMwNWJ6YmpmdGpRNGc0T1hSY2JxOEI4UjFDRVVaaHdWNFBqM1ht?=
 =?utf-8?B?M01TRlhnU09IcU1oSFpWNkFTSGI0UmZqbmxIbDd5YVBpbzNkQkcxb2NTUEZE?=
 =?utf-8?B?SFN4bkQxdGpLN3p2cVRjUDlJWi9sbVRKVDQrc2FEUWpBTzdQRTBZcHA3ZFlp?=
 =?utf-8?B?dVluV005OFZsOGZFSUdRb3hEc3ZwbitzbFp1MFZibFI5S3VxblVvS1FhZnVj?=
 =?utf-8?B?Z0grT015U01DT0pyUUZ3dGhReG5UOWFTaVRiYmFpUkFLZ2ZlTDlZS1VoK00z?=
 =?utf-8?B?eGFYL2Z6bWhXVDdkbWNueUZueFZDay9JSk1TYncwRVQ4cGRaN0VzTVZxVnhD?=
 =?utf-8?B?ZVYzcDkzYVR3THhOK2tYTC8vbWtMUHErSFMvK3RZSEk5TWl1VDF6V1dPdllE?=
 =?utf-8?B?YzVZNU1ldnJxaTYraWVVbDBTUnVrMmsybVhyNTZiR213ZitBRmgvdGMvZjky?=
 =?utf-8?B?eXM5K2JHVFpPMEx5Z1lqdUtmRk1rRXZGMVZxekIzZStTU3pBbGVRVk1sVG5u?=
 =?utf-8?B?Y0xxRlFPRkpkMXUxSGVnRlEydm5zYWNkTzY3ZW8yUWYxazl0K0NJT2N5eHhY?=
 =?utf-8?B?RDRXc3JPWDZJNHVwY3ZLYUZZNWxYL01CcEdtS2pDUlIwOGI4WVRmZlZSWDRY?=
 =?utf-8?B?bVlUVElkM044Q25DNnNSSEJLdlg4aG1xNjVqK01namwyb1U2dmN1R3IxRWxr?=
 =?utf-8?B?dGJQMkdrZmlkSkIxdWd6SGxXQ0dDY2c5elpnQ1BLSzNPTHFvMno0RlBxQ0ti?=
 =?utf-8?B?ZVFBSkJhaCs1OXROOWRyekZmTE5Hd3pxTURtWjdqdjRXdnlnR0lPTUkydjlX?=
 =?utf-8?B?ekRWTC9tQkdzQ0FZZXVIbm5SZE9DYmJyTkVtTTdEZmUrMW9EdnNnS2Qzb2o3?=
 =?utf-8?B?V0pNTzJZWWYwbWx3VEVuL0ZBN3FDa242TWlNOVh2bUVtOUgwUFQ4TEVCTXIx?=
 =?utf-8?Q?XXfo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnpRUmdZL0Z3RlkzTW1hck1jbXY1NDhUZ0s4Qk5hcENDd212K011WVdacjhz?=
 =?utf-8?B?UVRKektSRG9aemNXZmZuL05sSnBYTnNDMmNJdXlUSkV2MXRGSnNDWnVhS3Vn?=
 =?utf-8?B?bE1IYkxWNjNjdHdZODZjVXpvMUVOajgxem9PcHlKY25lczY0aU15c3dldWFW?=
 =?utf-8?B?YXhXckFjTUdGaVlOZUpZN1NwUFAveHBYV2w5R2FvUFY1eStuWGd0V1hCWDk5?=
 =?utf-8?B?amNuS1lJWXI2UmdIZlJ6akZ1WWgwNFVlN1NtNER3NXJ4eWhUNm5JbkNFRW00?=
 =?utf-8?B?cWFVSG8yUFNyR3lETVpYaUIxMEhsWlIvbVROengzNHNCcHQvZHN1L09NZHpk?=
 =?utf-8?B?M241V1M3NVR2eFlQaDd1Qk9RdnZ4TGtoRHllR1NFRDdEM3RzZ2wxMkh5RDE2?=
 =?utf-8?B?cVlKc1IycE55cEE4SWRRQ05sSzRNM2VPZjdvQ1NncUZPV1dYUU9PR24wRUxU?=
 =?utf-8?B?TEd1bitSVWpLN0pTdHJsQWNGVjRsQTBCVTN0WmZoWUJlekd2RVN0RUc0NVY3?=
 =?utf-8?B?WFdmaDNDa3ZTZndJUkRtbkFlMGxFQzkyODh4M1N0QlZpeWJMSnFSTlB6OHlr?=
 =?utf-8?B?Q1p2dWxoOXEvSWFpWWk3SnNWWUJGQ1dGVE5TUjBkVWtZbDlXRWZNWGd6SVVN?=
 =?utf-8?B?aS9vRDVrbmJmeC9lSXNqNWhsYVplUmRma0ZUREdDVStycG44Sjkxa2hHYzA4?=
 =?utf-8?B?MnZVc3F1bGIzWWQvOGxrbmF1QzRYZDNOb2U5SW1ZUGdDYXpMVkRaU29WQk5l?=
 =?utf-8?B?NmJqbkpNUzBOZnZZWDh1UHIvdXo1WGRlV0pOaE1rY0J5VUtvNTg1NVl4SzBO?=
 =?utf-8?B?ZWhJWXVMWWNJMDJKMXdqTVBBdWZocWpQa0xZcWpYdmlESnhtbGVFbVJ2VEhj?=
 =?utf-8?B?OUFrSXBvZEtxQ3kyKzNYclIrNzZUZFpOSkJaSGVkbXhUUWVpZWo1Uk1jM1NQ?=
 =?utf-8?B?WVY0NGFFQjJpVjg1NXM3bENza0Ird3Z2OHhKS0d2WmI4aVNVMGlOYVQwYXNv?=
 =?utf-8?B?c0ZoMHN2V2s3OFBhTlI4dmJCVWdWVWw5VnVhM3dyeEI0UTZsQ0NmZ3N6N3FH?=
 =?utf-8?B?RHFVODJpcS9mcFlNZnRBVXgveGhSRmcvV3k4K21pWVRpMnNQVkRkckpER2pZ?=
 =?utf-8?B?NDg0c3dMdFpYMVlTck5DQ0FnVFR4dThJUWNLRm5QWGp5Y2JCdWdPbU8xMkVx?=
 =?utf-8?B?b0RqZWRpQlJpYnZlWkwxL1dtNE43c0FXOGw4a2hZUU04VXh5ZnExT2ppdkxh?=
 =?utf-8?B?Ym9UZmZudlRPVlJGYXYzcThwS1orUTVVcUdscFFXUEdHK3pCTnh4YnZkZFVQ?=
 =?utf-8?B?dHU1OXdsZEVRajFkeENzcGQ2WjJBdFd2di85YnpRQ3ducm8xTlpIZkNVOE9R?=
 =?utf-8?B?Q25ncVF3alphUmN4YVcya2l4MlVqWDZFUmxGMGpFdEd0V3BDaGd4RW5VV0Zk?=
 =?utf-8?B?cUQrWTFKMmlvakpvak1GaGVOS2ZYL2RleWZDdGwxa1d6L25NaGMreDVFMGhZ?=
 =?utf-8?B?aUgrTjJGYTBtVHc4WTBTckpuaEFQSGZUdnNzM2VYY3F6RHppK2RZUlV5eDNx?=
 =?utf-8?B?K1k3NG91cnRTcVpSUkw3bWVEUWZoVW1Fb3YyTjAwdXJRRzgycmxpWTB6akk5?=
 =?utf-8?B?Z25LYVp1Qk9QUmI1RVJiMVBrUUgrVGRXaWRFME1pcXlEaCt2WHdWd2NPWHlp?=
 =?utf-8?B?TGptU0RlTThRTjVJVThtSFRvOHhxQ3k0QjJ3WUJxVjlGUkx6SEYzOHFGdXUv?=
 =?utf-8?B?bmYwVmtldlVxNEF0L2FYZmhYS2hJVytmYktNd1BTU1JTcFRFaTVEUHFucldR?=
 =?utf-8?B?MmZUZ0g1ajNGU0NUbVV4cG1tME5VaDdaWUhmUllxT0o5RXpFaEhDcG1Tb2FJ?=
 =?utf-8?B?TS9qMUtQUEpXTFp1UzNINFJDUkhUYXY1ZWtWbVM3Y3lqZmRpRktSRXNZbXJB?=
 =?utf-8?B?TmJQY044UW1iZ2dFaEQzWkNzQTE5eEt6RnQ1bkFHWE1VbHo5VVFySlczVitw?=
 =?utf-8?B?cnR5UGw4R1E0TmlVaVlOYS85NzgwVUxHVG4vbFd6NThqVExqYnRObXRNdDYv?=
 =?utf-8?B?akN6OUhQOENYKy9CZGQxUTNHZ2NCTDR4TStQbFdLc1pZSzFkT3hvOVlWWHY2?=
 =?utf-8?B?YkVRZWZoMFpYYXNmUU5EVnk0eFhtbUUrcmdFVGdQak1UMWsvZll5TUlaYTBH?=
 =?utf-8?B?SStwQmM5WVpsN3p5aTVlVGF0MWtQamtlRjBLN0ZrUmhwTnZGWEpuQjB0TERr?=
 =?utf-8?B?VWgrb0YzSGFHV0pXbEZ6TGVENGJmYzJOQ01EamVYMUFxV0JZaGdNMFpVOFZY?=
 =?utf-8?B?Qm40VmJqWmlySzBicGd1UWJKMTM1Vk1yeldLc25CWk5BTURNT1FpVGw3R29H?=
 =?utf-8?Q?0FrCLummWurgxJFI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9736a867-740e-41e4-1959-08de582bfb96
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 13:58:26.2360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LBKigPGpZnppHk8lkBFA+BOxx23Ca+Hq3z71aGdcW67cMKDOObZ24JkXu2U8Avf9I3FUOOtPxFYh6P3V+GvS+EUTCBKGT7bh3mdBiBaO/tU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7180
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
X-Spamd-Result: default: False [0.19 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_SEVEN(0.00)[9];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.karas@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 92B03463C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The drm device registration is done via drm_dev_register().
This function attempts to undo some of the initiatlization steps
under err_unload and err_minors labels, but this process is
incomplete - debugfs entries remain and the dev->registered flag
is still set to true.

On the other hand, drm_dev_unregister() tears down everything
that was initialized during registration step. This is confusing
when considering a failure in drm_dev_register(), because some
setup steps will be undone and some settings will remain, so it
is unclear whether a call to drm_dev_unregister() is a
requirement or not.

What is more, commit 6915190a50e8 ("drm/client: Support
emergency restore via sysrq for all clients") introduced a new
WARN_ON and added drm_client_sysrq_register/unregister() calls
to the drm device register/unregister paths. Client sysrqs are
registered only when drm_dev_register() is sure to complete
without failures, but drm_client_sysrq_unregister() gets called
every time during drm_dev_unregister() and prints warning
messages whenever the caller tries to clean up the mess with
immediate unregistration.

Amend the problem by removing debugfs entries and marking
registered flag as false upon error in drm_dev_register().

Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
I noticed that some drivers use drm_dev_unregister() whenever
a call to drm_dev_register() and many do not. It is also a bit
confusing to me why drm_dev_register() does not completely
unwind all the initialization steps it performs, which leaves
me wondering if drm_dev_unregister() is required on the error
path or not.

The WARN_ON introduced in 6915190a50e8f7cf13dcbe534b02845be533b60a
exposed this problem, as there were no notifications from these
functions, so I noticed this mismatch only thanks to the warning
messages.

RFC -> v1:
 * addedd title of commit 6915190a50e8 to commit message;
 * rebased;


 drivers/gpu/drm/drm_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 2915118436ce..a502110696a3 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -1119,6 +1119,8 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
 	drm_minor_unregister(dev, DRM_MINOR_ACCEL);
 	drm_minor_unregister(dev, DRM_MINOR_PRIMARY);
 	drm_minor_unregister(dev, DRM_MINOR_RENDER);
+	drm_debugfs_dev_fini(dev);
+	dev->registered = false;
 out_unlock:
 	if (drm_dev_needs_global_mutex(dev))
 		mutex_unlock(&drm_global_mutex);
-- 
2.43.0

-- 
Best Regards,
Krzysztof
