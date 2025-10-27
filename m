Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0716C11979
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 22:59:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 847AD10E194;
	Mon, 27 Oct 2025 21:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ixdrY10b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA7310E194;
 Mon, 27 Oct 2025 21:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761602338; x=1793138338;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9TMacvMcSTpUT+XY6p6IgiK2HsJxbmK/CdKXNXK/jo0=;
 b=ixdrY10bdagBj+ikhv2Rk3gFPWRi2ePt4pJW6XyqYqVphiF4g7mKAUF8
 hqy0fR6i3j6OjIMVt0TZjMqNZATQGsnLwro1rZIJAP7UD2tR4p+R00whi
 9LvbE+4Fv2np7aD7VTJ+xbJT3CUuQwM6538OANAHk7w/OU8i13Sy7T6Gd
 a5GSsIDXhw0j3+8KH//P4MaZ5KQjrx5vTbKua7IHdem+ymFDJLs9bVqUS
 nCj8snGSSz4wFTJPF/idmf5S30O0G+yWRm8SoagZfcvnEczu8TxtAjQ5G
 C4ck0AggI2yeNCPvDxONGw46PMSKGTSM0PBII01FQbxjLdMUqYUNBvx3m Q==;
X-CSE-ConnectionGUID: dfwpjC/0Tg+/OvWzHrDVzQ==
X-CSE-MsgGUID: YWH3KYGLQMm1e3d4lcHg0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63732528"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="63732528"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 14:58:58 -0700
X-CSE-ConnectionGUID: nWNX065kTfavdWJN88nteQ==
X-CSE-MsgGUID: QEjxsLqzQUqn9b5s2n9b2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="184785235"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 14:58:58 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 14:58:57 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 14:58:57 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.50)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 14:58:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+eniq/glcLHpFUYooSBqUuTYx/R+LEj1L+4kVewXZxCD88xgaj5c7IiWm/BLiDIypFZ/xzm6zh/sZw7vNZhwqpv4pkCOwzZYK8QWguJ/YHjCOUQxUBWX4JVl/RP5eY7QoAcMSS+r+qZvLnl96XvvcMICWllCSI9bCTq2ixCPDTcHWTNlWuErOFIJxMCJJpas+ASXX3CWw2i7I5NO0I+tbzuKfblpxqjlMTWOoMCA1o6e7GDphQC0kv0nMz17lYUyyBacOjFuC0fBeEo5U4tjzSiOMIzpcEZZzWGkXUDqWQ3jRaDyE2kTC3M9VNUek5qfeQvrbd1gYZSdwF6GFVegA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qtxbrZJGQL45u9KJO02XRx83TuMfx3LTILtC5rlXZps=;
 b=GD+dTmAkvpFUYR1G3c3/EvSm9qphlwJssJq6Oqek8ysju95h8MyawJyWQDDC2JFWBbqfysk4LUAZNfmvynBRCBSUsb1RU+pDkgvopfzpXplsZJmjTPjVba7pvAjpx5QlTiJOcZehzPvfCpHVdSX/h4T1PMYsqCritnZZF9YWSE4ycpGSHT7TmqkigaahaoQeSC+qynlxWTx+krxtMv/aMTDDW3xO9t3fpTK62a+w5kRysDpQo38BFwNuVx6XGJTxQc0iD6XDLMaZuUftkcsY8rl2/RRsNzsvHJeVWKE9w699iAhtFS/+G8NzKabieHaZAKwH4uGZeLW0ltQ2ywcf3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6923.namprd11.prod.outlook.com (2603:10b6:806:2aa::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 21:58:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 21:58:55 +0000
Date: Mon, 27 Oct 2025 14:58:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tejun Heo <tj@kernel.org>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <jiangshanlai@gmail.com>,
 <simona.vetter@ffwll.ch>, <christian.koenig@amd.com>, <pstanner@redhat.com>,
 <dakr@kernel.org>
Subject: Re: [RFC PATCH 1/3] workqueue: Add an interface to taint workqueue
 lockdep with reclaim
Message-ID: <aP/rHN4Ei04Tj49n@lstrano-desk.jf.intel.com>
References: <20251021213952.746900-1-matthew.brost@intel.com>
 <20251021213952.746900-2-matthew.brost@intel.com>
 <aPgBjmIm6n9H-R_u@slm.duckdns.org>
 <aPgDXsQY5qAfU0Tv@lstrano-desk.jf.intel.com>
 <aPgXH_JjkmKO5_a_@slm.duckdns.org>
 <aPgxy3lIqW1rUGsx@lstrano-desk.jf.intel.com>
 <aPg4jKrlYajO7jd_@slm.duckdns.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aPg4jKrlYajO7jd_@slm.duckdns.org>
X-ClientProxiedBy: MW4PR04CA0174.namprd04.prod.outlook.com
 (2603:10b6:303:85::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6923:EE_
X-MS-Office365-Filtering-Correlation-Id: 8be39836-226a-478a-185e-08de15a4062d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aCtTTEVyOW0xS2RIZnF5QzV5bWtpVjAzd0kxMjY4aHNwcXViMHRFZG1TbTVw?=
 =?utf-8?B?VUJhRGh0U0tzb0lkejNybGhSVFZ4NWw0bzZTMGNTei9qcDFrZmN0cVBYdUJY?=
 =?utf-8?B?NlVlK05Lc3lmTlowcGpvbU44QlUwVWJSU0h4Tm9tY1dvUlJZRlpXaXErUS8z?=
 =?utf-8?B?U0N3VzkrcENWdUxBUi93NUJRS2J6dHN1SmJ4alhCN1pQNFRjUzNKeFhlalJi?=
 =?utf-8?B?SUs1MHpxL1pVWVJ3M2NnNW5jK1AzTzZRNkRkcmgwanREbmgyVTFOckE0Uzhq?=
 =?utf-8?B?aFF6RHd2QzMxRzlya3UwQWxQWkk5YTdnQ2luWnk3ZER3cFVrVTVUcDFFdGpz?=
 =?utf-8?B?OWhyelVuTEZOTTFjTERKa1RPbEptOWt2TmpzVzhnMWFEVWlNS1dVQ0NTcVdr?=
 =?utf-8?B?TjZ5OFg3K1pudjhEcVRkY0ZsOWQ3SmN5NEc3VXM5c2UvRmxyeGdoUWFwSDFM?=
 =?utf-8?B?VUdGMSs3TjA1em5WakZuMGNIc2pWTG9jYUFlTHMwK1JLaXNmUjVkTDZCd0ZQ?=
 =?utf-8?B?MXZKeGhMK3dlUk9WN3BadXV0aElWM2VCbVVoZzN5eTZvSkhhSWJkYml4enBY?=
 =?utf-8?B?eHVRRXdpWmtPc200akxndkgvREpoMWlybmhBTEhBeUM1dWliOWlpUllwcDJ2?=
 =?utf-8?B?KzdhUEYzM3loNEh1SnlGck0yMmpSV1JxRktGR3A2VDRHR2NDd2R2WjQzSUZu?=
 =?utf-8?B?MDJWV3dYWVZVMW14alVVNjIzdUE5Y3A2bityNjhQdytNQUcrZGE2UmVONlo5?=
 =?utf-8?B?U2FxVk5UQUR1U3U1UEtnazBtWXBvcG1pVTRKdld1RFhTZTFMSlR3N2NORzNi?=
 =?utf-8?B?Z3gyT0pFSHNlU1YvcWlQOFhaN2sxMVdkNVViaFlMSHRtWk5lcVlEUXlSQlFj?=
 =?utf-8?B?RmVQNGJoY3NkMkxFdHlxWENIMGF3Umw3elkyaDY1ZHNJcFE3UGhldklZMlJ3?=
 =?utf-8?B?cDd3WjhFc0N2NHdnVERWUnZFd0F0OWJTNzVaeDlEeGNrTFIvUWZzNHhPMm1m?=
 =?utf-8?B?SXFMb3FQQVZaMW53d016bm1YV21NdGZPT1JLVXczZVFGMEpYdUNuMTVkRG82?=
 =?utf-8?B?R01SSG5oZXl1cGNpR1hiK2dFT0ZkT1BDank5NEUxNENpbmlKTlI3bGVBb0hU?=
 =?utf-8?B?TCtVcVdNUTB1dTNjN3htNGhTZGpBZFhEcnZCZFJiOW5jL0xkRWVjVGhRb09J?=
 =?utf-8?B?Y01uYnpMNEluNGdaVnRRYjFnK1UxRVQ5QTdSM1FEZ29QWmFZcGJCSGlKUGJL?=
 =?utf-8?B?OWY5bGJ6Z2c0bFZEYmU5c1lqQTlxZFRtT0NvZFJ5cStKWlNoMWpXaCtValVS?=
 =?utf-8?B?dTBwR0NocWY4TzRQUTdqUWJJVXpvZEt4Z01xSTY4YXlXK2laTG9YY3pLZGx0?=
 =?utf-8?B?M0cvc21QdnR3dkJXN2M2RHZCdmtmUVhpcjhla0VQNjltU1QyR09pTk5JdEYw?=
 =?utf-8?B?MmFlTWFPZ2x6UTh0Q255bGI5eDRiMVh1Njh4Ky9GTk01QVBOTTBqUEREQVlm?=
 =?utf-8?B?TjRSdDA2MkJtT3RqdW5nZDUrcFhWa1U2ZzJLWGtaRHV1bVE4NkRGNVJhK3hu?=
 =?utf-8?B?dlRML3AyZ0Jqa2szelVwUkxCREZEUHoraFdqVEtvL052N2VQd0IyTysyZU5K?=
 =?utf-8?B?YW00YTNKei85c3NXV1llamlOUno4QmNSZW1LMUlsMitGSzZLODBVcEhSaGcx?=
 =?utf-8?B?UE1IamZIMlRnSGJRWFdhUmdaTDNDOXA0RlFZaXBrL1ZwSDI3QjNZdGtUSGlG?=
 =?utf-8?B?OGxCR3BXQlR4VDlvdnY3cW5rdDRFNy95bnR3VXRvWGw0VkFtSVRJbndRSldk?=
 =?utf-8?B?VUdGVW9CZmE3emdTbHBSRkNUQSt1Q3RNK1RCQ3RVMHI1S1daQlcwZk95NTlj?=
 =?utf-8?B?dlU2SEhKUWprUHNPSW1GUS81MFpxYlJhUkFrUmc0RDkzcGdDS1hOMjVMenFv?=
 =?utf-8?B?Z3dZR1ZveE1Nd1JldFdybFVIT2VLYmQ4dVVyN2gvZk1MamNDRWp2M0htRFpC?=
 =?utf-8?B?ZVo4SnUyNDBRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDBicThwUjJWTG1jRWcwWUF6eTBjUDNRUjFwTUhlTStMWkxIZHBTYzQ0U2Y4?=
 =?utf-8?B?VzN1Y1gzTis5VU12Qjgvd1VTZVNzb0lEWkU3NjNmRTJ4dzNxZlF4M3BIL21y?=
 =?utf-8?B?VVNMZVg2N0MwZUNUN0Nhbk9hcDVVRzEzcDFTdEFMdzd6Q1lwUDQxbXp6aFdY?=
 =?utf-8?B?Sno0bzFGVE4wM0FBZE8zL0dEc2FKN3RDdEV0NSs2ZG14YnpFS1ljR1BzbWZ1?=
 =?utf-8?B?SEZzeC9xcXd0b3E5R2JrTFhKanpIRVA4SHlYMXVJZjA1MGhtK1NSd25hOE5B?=
 =?utf-8?B?WlNZTGZhYURsK25WcGhYcUYwUEI0SWZtUTJLdUZXb2U2TUhNTG5KME1Kb0Ji?=
 =?utf-8?B?Ky8zcjVPOEl3L3NxTFdpaVh6bm1PMENTSHB5ajUzdDJsTGt4TGhBVUMvR3BQ?=
 =?utf-8?B?VjJTOE9xdUZaNC8vajZXS0prQWc1Tkh5M2RUc0NWbjRkM1Q1YmhpSEI4N1FF?=
 =?utf-8?B?UGkrbzFEdHBLODBaa0N4c3pnOXRVZ0VKZ2RLT3hZZUdzVDJOeEVTZWVyNTkz?=
 =?utf-8?B?R2ZIWHprQjFQU0dtZHViUnAvQ2xtK01Sc2grU1RIRDdVUkpsMzE4TG9ZQVNW?=
 =?utf-8?B?UlRLZWxSWEVFNDB0OW1MQkZidHMxWjNHdWxXUXdOV3M2ZkpTa29XM0ZJYStG?=
 =?utf-8?B?aUhpWndwbkx2ZDZkbDF6dnI1SUlieUx0Z3RHRjd2a0lXRmFCWDhJUVBhcWNR?=
 =?utf-8?B?cHZ4KzZ2QUdISUZOYzhPN0g0M3RaTG15T050UzIralVWNVM5bDJ6aHNmTW5v?=
 =?utf-8?B?YnBmLzJCSWhxZU10cFpwempxZ0ZyL2VKSUduNEIzOXY1UUNGMGlKWkRWSE8w?=
 =?utf-8?B?R1BUZlZSeDIvelhCV3JWZ0IvM3YvR3lSR2hFejBWL0VIMGdiWVRveXFXU2V1?=
 =?utf-8?B?cDBNbzN0am4vN0VPbTVkYTNzbFdIaVErQjhoY1QxYTdzSmZBMDVWR3hXbFVz?=
 =?utf-8?B?TWpLdXhjaXBjYnF6Q1pVblJvdTY0UklpdEVaS0RXcU0rbEhpbEI5WUFDelRu?=
 =?utf-8?B?Sy9PYko2WjdSbWRTK1ZyNWYxQ2lHNllNWE9McnhKRTh2b0FJS3J3T1Q2Wmdx?=
 =?utf-8?B?b3orNTM2ekJhMGV4TVJrWmpjTnFSRzRCVC9LNm5uSHNpYkZYN3BrYmZ0TTJP?=
 =?utf-8?B?b1NNMk5QTFcvSks3SUZ3QnhpUlYzdU9QRjEyVDhtU0JEY2ZhNkZGUkJjRlhr?=
 =?utf-8?B?OGdQVnhhVUYvMndrc3E0b25ZODg2My9abktseFhtTy9EYjR6Z1k3OUphWEJw?=
 =?utf-8?B?c3JSOEUybWpabmNPcUZkbWpBVTQ0TnNUenhIY3VhN0ZxVk04WE9JZlE1a0px?=
 =?utf-8?B?TUFaemVveWhGYjZ5enR6UDZseUVYL1ZQYVd0S0s5NXE2b0RISkhkSEtSUFBJ?=
 =?utf-8?B?b0FyTWl0NEphcGhPL0NUTWZxQTZPa2M3MC9BYUFaQjlkVUFkMVdyQjZrRUxy?=
 =?utf-8?B?WTJsWDdZNU9PeUpESVFKaWJxbDV6VkVXWEsvMjc1aVVwNkJ4OHY2T0U4WXV6?=
 =?utf-8?B?UmE3ampYcUV2VnRhYzhTWjc2VU9QVks0b1U5T1hUb2VVRWhXaEUzSnF4a1Bz?=
 =?utf-8?B?UHNjS3BGOUVjSlo5SUw4ZCs3SWtiajhZL0JxMmhORnhONlJDVTR2dDBITW10?=
 =?utf-8?B?dy95OE5TM0FDdzVZTDRmeHhkdjlBd3c0eldyQ011bmRZV21pTW5mejNqaVR5?=
 =?utf-8?B?TTIrUi9VUHUwMW05Qmt0Nzl0RThicFFYcEZ6RFNvb3RKdE9yTDJwL0J1MXZk?=
 =?utf-8?B?M0VSS05UMk0yL1ZXZzJudTNiaEVVQWtET1h3bWx6MFE5WUVxSW9Vb2NPeElB?=
 =?utf-8?B?YVJtUFdpZDN3cXUvOTVoVVpERG9uVG9EaUQwN0FhZ2dPamlPUzF0VUdtYW0y?=
 =?utf-8?B?d0JUU25YT2tGbytlTmMzOG14NUNJT2lHVnRsWmlrRHFna2pyMnBjNnh5bWFH?=
 =?utf-8?B?T1VDTVJ5T3Q0QmVKeVhodmVNcHFySDQvdFlwaHlVM3RaTkVUdk1lVml4a1JB?=
 =?utf-8?B?YUNaWjN6ZXdudW9DYlRCTlhjR2JPbFZKM2h2Q0ptM05PbWtFY2V5R1ViN2Vr?=
 =?utf-8?B?NmxvVTFFak9Eb2ttMXd6bkhYV3RLMXFHNDNHVU84c29TdVVMRmJ5T2l0MzVs?=
 =?utf-8?B?Y01zRy9PVEd6OXRtUDBERGlRZFB5c0NZeDgvREtpdzBKZnNJLzJaeGxveDVh?=
 =?utf-8?B?aWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8be39836-226a-478a-185e-08de15a4062d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 21:58:55.7076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eesvJsbPWRMfm9+UCZv5yFpQncNG07qhBGerR+cqcfMKgaclVrHOGb5JMoYxQsFxAHKU8L7ORd7ghES6PY2u4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6923
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

On Tue, Oct 21, 2025 at 03:51:08PM -1000, Tejun Heo wrote:
> On Tue, Oct 21, 2025 at 06:22:19PM -0700, Matthew Brost wrote:
> > > please update the patch so that WQ_MEM_RECLAIM implicitly enables the
> > > checking?
> > 
> > Sure, but a bunch of things immediately break—including a convoluted
> > case in my driver. I can fix the kernel to the extent that my CI catches
> > issues, and fix any obvious cases through manual inspection. However,
> > I suspect that if we merge this, we'll be dealing with fallout
> > throughout a kernel RC cycle.
> 
> Sure, we're still early in this cycle and can try to resolve as much as
> possible and if there's just too much, we can make it optional and so on.
> 

I’ve come to the conclusion that the entire kernel is going to explode
if all WQ_MEM_RECLAIM workqueues are annotated with lockdep. I made this
change and tried booting Linux, but quickly ran into five issues before
giving up. It seems that many parts of the kernel allocate memory with
GFP_KERNEL or take locks that allocate memory in workqueues marked with
WQ_MEM_RECLAIM.

There are literally hundreds of workqueues created with WQ_MEM_RECLAIM,
both directly [1] and via the create*workqueue helpers, which also set
this flag.

So, what’s your advice here? Personally, I don’t have the bandwidth to
drive fixing the entire kernel. Maybe we could add the annotation
helpers introduced in this series, so drivers that really want to
enforce this rule—like the DRM driver—can opt in? And perhaps we could
add a export Kconfig option that enables this for all WQ_MEM_RECLAIM
workqueues, and let the community gradually enable it and start fixing
their code?

Matt

[1] https://elixir.bootlin.com/linux/v6.17.5/C/ident/WQ_MEM_RECLAIM

> Thanks.
> 
> -- 
> tejun
