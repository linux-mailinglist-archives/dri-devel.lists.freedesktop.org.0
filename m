Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8FFBF0C90
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 13:18:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19FA410E418;
	Mon, 20 Oct 2025 11:18:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q7FhrEpc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51EE210E418
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 11:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760959092; x=1792495092;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tJlP/1SmtzGuxb3pn0TonGqBh6HeMmqe2bxSm8w60M4=;
 b=Q7FhrEpcvwBTbgv+7SMyL3iKPtVMJUXLDwdxfNkBXun3DWpO3+/2ccMX
 dhz9fVZERzGieQ1ZjFv/085nftfuzX088oSern1EOwcRSW2P2/Mmq+7s2
 bX1TOdlT2BRbkj5erUYkhbk4wiPZ4oeCVY1M3BxaIbNLWmKC3/acc9FxB
 F0CNWZPJ+IUcM+wCqNEhFwnquFzTp1sBQ4g44WRjjiC1l9mmPRYax1iq7
 SGhgdY8NGdUfrAJLO9U2oYwqiE9+u6UwzeK3+2j+NMjYxlmRQE1wjUZeR
 yYZfgz1Rudf3fcawRW0cYGS6/wCHRIX2ujmlzfotoEGFg4M6eQZUxglPN Q==;
X-CSE-ConnectionGUID: qz37WuH1STCymMseGGPzAw==
X-CSE-MsgGUID: CVhkSjmxS2Ch3J3CYP16Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63217916"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="63217916"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 04:18:12 -0700
X-CSE-ConnectionGUID: m/PNvKcKQYyg9skVd+wqVQ==
X-CSE-MsgGUID: pJqfwN+aTySYvMumsmAIkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="213921487"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 04:18:12 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 04:18:11 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 04:18:11 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.24)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 04:18:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ae3vpWLi+8wu6y/2zjKVjissynAOqPwE8UyxQVXH00oJBiK4JlStQDZGdpPxqucX6Y88222wBZhDQv1dVQVd2QWwkrUG82hTW3uiSzfjnGalWDHw/L8XTCPpSasH3VwiD2sZmfnQxremjdMEtSsGu0bzvjNDeX4H6wLm+zZY67Dhf0BYE4HPUtk6MgIqtpwhne0R52FhBUJ1cEbiWp0rNzdUMcH09ZuD3dNdwI08Ete5Q2rXM1N1QCSVbnb6v+bgwBPvdqB4G0bmXMV6PEn0ioZV8xf0C97OTU1vNqI+oWUskTNQ1SLjuWblBpAj9fyWaJtubC9VWuL8CzpC+v6PaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DH6R0/yM3PXZ4BTKkOSqTKbAdFE/cs7K8r44mtDzLCc=;
 b=Kt6AZNzjPlD3K4NbPSjKt8RtWZ/x8wzhSBjk4q308wM2Lyr2V0UAvWBtXjvdvzg+VHsaqMaGqYOORjQqk+vY2R0b6sq3ZP/EKDA1b7IT4V+jAqCrJjUt/hJFZ43cwuSDXHyYe4YtRz2jk+laIdTpSVmwZ52GdCVjROAyrj2SrNcU2i+NgOO8HFzKrMUaI9erw5/hKVomuDz3nLxMKmM4UkuAcc2tCm6cDhutCAalVxmaB2YEBVkCbK87J/q/Y7zWrdVb+cxdhD9AUnKQ9YDSIaWevMwDxoNevPJNyPNHGbdoJRDWeGLmp3Zmxa9hyVm3lLAbj452mMU8EG7mhRNQWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6368.namprd11.prod.outlook.com (2603:10b6:930:38::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 11:18:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.014; Mon, 20 Oct 2025
 11:18:09 +0000
Date: Mon, 20 Oct 2025 04:18:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <phasta@kernel.org>
CC: Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, <tursulin@ursulin.net>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] dma-fence: Remove 64-bit flag
Message-ID: <aPYabivOBSJ1UChg@lstrano-desk.jf.intel.com>
References: <20251017093146.169996-2-phasta@kernel.org>
 <aPK04r1E7IbAZ9QY@lstrano-desk.jf.intel.com>
 <7b53f502aa0eaee4ffe4350621ddbcbfaafcad06.camel@mailbox.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7b53f502aa0eaee4ffe4350621ddbcbfaafcad06.camel@mailbox.org>
X-ClientProxiedBy: MW4PR04CA0367.namprd04.prod.outlook.com
 (2603:10b6:303:81::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6368:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c1eef38-019b-4cf4-c88b-08de0fca5972
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TDcxRlFvNUxIRStSL3VhOGRHejNETm13dy9FUVVwT0Q5OWJSV1dZYytNQ09H?=
 =?utf-8?B?UjlpejhGb3Evem8rd09mUFBlcDY0c3VGK0xUeGJHaWhrSzZQYm5mdjFzejdn?=
 =?utf-8?B?bGlOaHpPNCtqK1VxeGQ4bGJWOXdQdmU5ZktZc0M5Z3RvYnp2YnhTeHpDR29X?=
 =?utf-8?B?NVBVcnVkSWIwTG4ydlFYVE02SE1oOUVOcGpUc0FYYk1kYUFib3ZER20yRTlm?=
 =?utf-8?B?MDkveDZVbkRpN3RidVloZXVCYTJTMDhKYzZZYUg0UG9vQ3RQWW40SmZNaEtK?=
 =?utf-8?B?R3VFUXN5YXdreGx2ZGFZKzZlVjl0Ti9KbVRJd3d6VUVBa1M3Z3ZJalpnc1N6?=
 =?utf-8?B?bkF2c1lNV09QQ1IzMzhCcUNaMEJGNVZCaXE1TzNJSzF3K3ZTd3U4L2JmWllE?=
 =?utf-8?B?UVlnQlE2KzN5UzJWM3RRNXd6Vm1qdmhVbjdsZEI0NWxhVDluZmozL2QwNlB5?=
 =?utf-8?B?VzkyRERtdldyaWI3SDFkSjlPUnQ5cTArSVp5aUdVR2ozUlJLYWtFTXFubnMz?=
 =?utf-8?B?cHpmYUZsZ0U4NG5qVG40MDB2djFwQTdnOGpva2k3a2NBa0hzaVRRYllSUU51?=
 =?utf-8?B?QjVHS2J6YzZ2cnJQdmovTDdwbElkK0dzZ0pTNlZVS2p1SStCMGV6alFBMUJx?=
 =?utf-8?B?UUJHSzg4bGxRald5T2Vmd1Y3Yzc2K0ZXRDVZR1FIMkRWVW9JR0RLWXdNRVhK?=
 =?utf-8?B?a0cvWDRGZ1pMOVhnUFdpOEtTWit0YWc1RTRFbTBJY1ZoZTE3UGMxcW05Smd2?=
 =?utf-8?B?V1cydU96SDJyOGZLVlkvOEkxT0tDYnZXTG5Zb0VXR3NmRExkTkp1NU5IeEJP?=
 =?utf-8?B?WU9CQXhaY0NtMnZtR0tVVUtEVUl1WHNTa2w0QXdEalduaW9oYWU2UVFveUpG?=
 =?utf-8?B?bUxaZ2hmU0N4TkViTDZCU0c3Rlo2VklDYlo0V2R4T0l0eE0xY3o2ek1YNWpX?=
 =?utf-8?B?Q1lNRnhNZGRiVDE5d04yZTlVMHFsQ3JVd2hEUzQya0psbDJxZXlNbklxYUd1?=
 =?utf-8?B?cE9UeEZ1ay9FNzRqeW5LczRDTEU2cmdOTTdVbmNSU1owS3pTaW15Z2Jxc0pM?=
 =?utf-8?B?TU8xSlBJYXBERVhITGVCWEhYQkpQOTZXWWdpZEIwSWtYWnRhNldvUVlUUUlp?=
 =?utf-8?B?ZEs0YXBpTlhKbER1TVo0T3dRUkZsME9UN2xzZ0VRdHdWb3RKcCtqV2tPcXM5?=
 =?utf-8?B?UEhTWHM5Nk5DVDlYVWN5cy9JaE85YWpzUUVpbmQwMllObFh6MDFSY3NraXdO?=
 =?utf-8?B?NkRteVJ5NzYxNnMyZ2MzbW1iUWVPMWlUZkQzSkN5NmFsK2JJT2pEUGJ1U3A3?=
 =?utf-8?B?TGRVMDNRL0NuMUpJUUdoRlJxeEtWaW91clZ2akp6R2IvamsvQ2lpVU9mOXVS?=
 =?utf-8?B?eVJCcjlmaFZvT2ZMSUpGVHhacXFlaFBLbWNZZkk4QnpMWlNXbkZBZ05ZcXA5?=
 =?utf-8?B?VHhxNVpINmtTQ1NIeTN3TFJDL1IyZTFueS9YbFV0SFowcVEvc252NWdiZitj?=
 =?utf-8?B?NkI0b2FrWWZENURCMlZWbWpMNTFaVEIyTW9PTmZFVkV0WHZyU05GQWwyRnBK?=
 =?utf-8?B?c3REWjdLWGcwZHo1MGNsRWtpVlBhZkJ5Z0c4dG1VRWVLZ0U1cHFmbitrS1pk?=
 =?utf-8?B?ai9XQS9xUG1yRUtoL0g2WmUrN3pCcjFpU1Nnblg4a08xbGRETXRKcDQrQWFm?=
 =?utf-8?B?SU9VZkhOYW9reW0ySnFua2xvbUlORjllblBndStCclN3VVNPQ1NBTUJUT0lV?=
 =?utf-8?B?cXltdENnZjZxV2FaMVN5T2VLSmMrOTN6TDR0cjBsRFZhSUhCRHZLS1Bsb0t2?=
 =?utf-8?B?RVc4QTFLeHpteUJ0U1RmWXUzeXk3THR3b1FXSm5qUWxLRmVySWFwRkpvMGRy?=
 =?utf-8?B?MVBjRE81T25rSjlJc3VVb0txN2NjS1JtdXUyYTdEL1M4R3Z6aGUrQndudGI5?=
 =?utf-8?Q?NIsXnlfLFRQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmF1YXlSeWVoYUxHL2hDRktieXRWVzdrRUZCaWFHTS93SW5JVGVQZHF6VXlQ?=
 =?utf-8?B?NWFsZnhvU2NMVkVaMGQ4Z3Fxc0ZTdUtTOERDK25IaXlpOXFVckRsZ3FWMXZI?=
 =?utf-8?B?TVJxbThLSnFCVThtajh4c3JFdjdWY2JxVDc4SlFZNkxPZXNDcEVRZXRQdUNH?=
 =?utf-8?B?L1FjRlBHUVlRS2NGUHh5R3kyZXBGR1dXOExobDYvWHJta1FXMzRKZ0dQM1pW?=
 =?utf-8?B?RVlWVkQrSVMwc0ZUUlgwbkNrMmRud0s4SkpYWFEyRnNVdTl5N0psYzVJRUsr?=
 =?utf-8?B?MGJidG5jQkpVWVhFWDR2K0xFTWRTODJWQXJnbG94ZnRBbkZnKzNoZmRHdEY4?=
 =?utf-8?B?RmlOSDN6cUxaS1FNZWlJbjNFMUtGamsrV2k4cldJa0hjVnpHYUJ5Wk12OUR6?=
 =?utf-8?B?Q2lZYnVOWmJieXMzcVdIZXUvaFhMeTZQMCt5MDEyQ2FGMm9wYmJlZFBkVTNM?=
 =?utf-8?B?bjczTitUZVRBZTFWdG1rNkhuWllrT0lmK1VEdExGdzlsWHlvaXIvdGUzVXhK?=
 =?utf-8?B?WUZIYVpXWnNmTTNWVTI4YVNmalJDb2VKOHFnU3NnTUtQWGJCVWJGa0VtVGlU?=
 =?utf-8?B?OWl2dHk2bUNHSHNSK1pNWDNNcTRxaTVVNVpQMm9CMEFDZ2dJcXI1clZEK25Q?=
 =?utf-8?B?VGdHOE5OcXZsU0llaHBWV3NSUEUvYzVBQUJaV2laZFRwTVVKRVliOXdvcDg0?=
 =?utf-8?B?WUF0WWZrelJTenE0b2hUT2JmcDJaRkU4a1laVUlsRS8ySEFaTGxKR2xQYTZ3?=
 =?utf-8?B?TDVJTG0rVk5pUXNNQVI1SitDd2lFbFIxV09uc0owUWZTTWU1TDVvNTh5R3VU?=
 =?utf-8?B?WlJFdTZRNXVmaHEyM1FERG9TWFEvcVZnOU1wWmZ0SDdZSmhHVXJ5NzdQR3dH?=
 =?utf-8?B?bUpoU1VubzFDOVU0Wm13MkVOY3k5endRK2xUK2Z4M3BrTHM3LzN6b25UdU5j?=
 =?utf-8?B?amxkSVFJNG5RZTJucUNDcGVyem5nRldoQjFIL3hLcjFyOFlJM1lvK25zVlUr?=
 =?utf-8?B?SS8xb2syamQ5aE45UE5CVXE0Q2ZmR0hrZm1GY1pEa1pTSE9FMnUvRmNJcE5Z?=
 =?utf-8?B?MVZQQnFDS3poN3RPdDR0ODRSZjdTNjRHSmI5UzhMZXdrMGdDMXBhMDlyOVoy?=
 =?utf-8?B?VVRoTWJIU3pJNXZIU3ErZDhZWFB6M1U0ZktZZ29TMVN2R3l3aFUxRlVQWWh2?=
 =?utf-8?B?QmhCTGpPeEZNaGJNMlZxQVA0VHZPQW5FUmRNTm5iNStyUGdIeVlJQzM4VFlp?=
 =?utf-8?B?RkNZN2U4ZjVwWkJ5TnRiZk1yYm5ndHk3Y2xyMzZKRjJ3cWFCc3lXS0w1cXRl?=
 =?utf-8?B?OXJBSEd2SXZqZCt2Y1hwRGNNU1BWRHBQeWRZSEZ3ZEp6VWpZd1IrWXBOdEZF?=
 =?utf-8?B?Ync3b1NZaXRWMS9DVUl4MFdEd0RhdTFSejZPRldyWEcwb2pNM000Z3JROHUz?=
 =?utf-8?B?UDRSaW8wRTNjMlc4elJ0dnNrVnQ5dE1Zcnp1MVFGMzBYM2djOHVYa1R0NGk4?=
 =?utf-8?B?dTZaVFc4aDArUjQwNjI2RmorQnJqeFZMUXBJQUxkY3pCWEN4Nkd4TFIwYnR3?=
 =?utf-8?B?QllMRXVwbGlHd3hwUGptbkNaQ0t6azFHdjhlMHZCME95TzVnNGxPa0IxL2Rx?=
 =?utf-8?B?cDZCWW1NSTkreTR3bE9DTGd0T2JpL2xJN0E4dzVoNHU2Y24wMUw0Rmd2UlRh?=
 =?utf-8?B?VTNYVGF2SW54c1h4ZDJqZFlZMDhwaytQT3ZnSkh0OUVTYmtybndNYjRpNTVv?=
 =?utf-8?B?bUVqRmJQREthSGhSOXV3MDRqS3dqVjZ2L2F5bGJCQjFWbXdQRnh3bWhpOFRL?=
 =?utf-8?B?S0ZQbmpkMjEyK1FIdWY1V0wyMm0rY0NLSXVhaEZ1K0lqTUVpd1VoTSt6bDVv?=
 =?utf-8?B?RjU0SGRmbmNKMEdRMkFjM3U0bFZmS0NpNVNUaithSUhXbEt1S3AyeS9DdHRy?=
 =?utf-8?B?d0d2QjJzQ0FyZXpkdHpoNFc4c1kySGgrZFlSUHpPNXJpYmkxY3JGWVRyVlZa?=
 =?utf-8?B?eTliOE56K0Nib2ErdFkzRHlScmhvY0I5WFNRV2M2YVZPN3NVVmdRQkRaOWdz?=
 =?utf-8?B?S1VKMWJZZFFFVVFkQklTZlZ0aC9PUjVCcEhrc0hxVDRqTTUzRE5IVm94L3Rn?=
 =?utf-8?B?R0MzWDMybWJxWmdxZkNQTlFCSWk2VWUyaTBHVmxkeTdPNmVsRXNtbUN4Yncw?=
 =?utf-8?B?L0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c1eef38-019b-4cf4-c88b-08de0fca5972
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 11:18:09.2841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VKXAqV+TBQy2MtSDNjQBJSTRa7o6LJ9apafNQXIfk8DZWN8SIsezNKS0MZZk4g6Z0uGw3gKH0dkn8zfFDZAw/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6368
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

On Mon, Oct 20, 2025 at 10:16:23AM +0200, Philipp Stanner wrote:
> On Fri, 2025-10-17 at 14:28 -0700, Matthew Brost wrote:
> > On Fri, Oct 17, 2025 at 11:31:47AM +0200, Philipp Stanner wrote:
> > > It seems that DMA_FENCE_FLAG_SEQNO64_BIT has no real effects anymore,
> > > since seqno is a u64 everywhere.
> > > 
> > > Remove the unneeded flag.
> > > 
> > > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > > ---
> > > Seems to me that this flag doesn't really do anything anymore?
> > > 
> > > I *suspect* that it could be that some drivers pass a u32 to
> > > dma_fence_init()? I guess they could be ported, couldn't they.
> > > 
> > 
> > Xe uses 32-bit hardware fence sequence numbers—see [1] and [2]. We could
> > switch to 64-bit hardware fence sequence numbers, but that would require
> > changes on the driver side. If you sent this to our CI, I’m fairly
> > certain we’d see a bunch of failures. I suspect this would also break
> > several other drivers.
> 
> What exactly breaks? Help me out here; if you pass a u32 for a u64,

Seqno wraps.

> doesn't the C standard guarantee that the higher, unused 32 bits will
> be 0?

	return (int)(lower_32_bits(f1) - lower_32_bits(f2)) > 0;

Look at the above logic.

f1 = 0x0;
f2 = 0xffffffff; /* -1 */

The above statement will correctly return true.

Compared to the below statement which returns false.

	return f1 > f2;

We test seqno wraps in Xe by setting our initial seqno to -127, again if
you send this patch to our CI any test which sends more than 127 job on
queue will likely fail.

Matt

> 
> Because the only thing the flag still does is do this lower_32 check in
> fence_is_later.
> 
> P.
> 
> > 
> > As I mentioned, all Xe-supported platforms could be updated since their
> > rings support 64-bit store instructions. However, I suspect that very
> > old i915 platforms don’t support such instructions in the ring. I agree
> > this is a legacy issue, and we should probably use 64-bit sequence
> > numbers in Xe. But again, platforms and drivers that are decades old
> > might break as a result.
> > 
> > Matt
> > 
> > [1] https://elixir.bootlin.com/linux/v6.17.1/source/drivers/gpu/drm/xe/xe_hw_fence.c#L264
> > [2] https://elixir.bootlin.com/linux/v6.17.1/source/drivers/gpu/drm/xe/xe_hw_fence_types.h#L51
> > 
> > > P.
> > > ---
> > >  drivers/dma-buf/dma-fence.c |  3 +--
> > >  include/linux/dma-fence.h   | 10 +---------
> > >  2 files changed, 2 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> > > index 3f78c56b58dc..24794c027813 100644
> > > --- a/drivers/dma-buf/dma-fence.c
> > > +++ b/drivers/dma-buf/dma-fence.c
> > > @@ -1078,8 +1078,7 @@ void
> > >  dma_fence_init64(struct dma_fence *fence, const struct dma_fence_ops *ops,
> > >  		 spinlock_t *lock, u64 context, u64 seqno)
> > >  {
> > > -	__dma_fence_init(fence, ops, lock, context, seqno,
> > > -			 BIT(DMA_FENCE_FLAG_SEQNO64_BIT));
> > > +	__dma_fence_init(fence, ops, lock, context, seqno, 0);
> > >  }
> > >  EXPORT_SYMBOL(dma_fence_init64);
> > >  
> > > diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> > > index 64639e104110..4eca2db28625 100644
> > > --- a/include/linux/dma-fence.h
> > > +++ b/include/linux/dma-fence.h
> > > @@ -98,7 +98,6 @@ struct dma_fence {
> > >  };
> > >  
> > >  enum dma_fence_flag_bits {
> > > -	DMA_FENCE_FLAG_SEQNO64_BIT,
> > >  	DMA_FENCE_FLAG_SIGNALED_BIT,
> > >  	DMA_FENCE_FLAG_TIMESTAMP_BIT,
> > >  	DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
> > > @@ -470,14 +469,7 @@ dma_fence_is_signaled(struct dma_fence *fence)
> > >   */
> > >  static inline bool __dma_fence_is_later(struct dma_fence *fence, u64 f1, u64 f2)
> > >  {
> > > -	/* This is for backward compatibility with drivers which can only handle
> > > -	 * 32bit sequence numbers. Use a 64bit compare when the driver says to
> > > -	 * do so.
> > > -	 */
> > > -	if (test_bit(DMA_FENCE_FLAG_SEQNO64_BIT, &fence->flags))
> > > -		return f1 > f2;
> > > -
> > > -	return (int)(lower_32_bits(f1) - lower_32_bits(f2)) > 0;
> > > +	return f1 > f2;
> > >  }
> > >  
> > >  /**
> > > -- 
> > > 2.49.0
> > > 
> 
