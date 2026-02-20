Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKO6I07smGkKOQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 00:20:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F286F16B5FA
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 00:20:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 799C210E0A3;
	Fri, 20 Feb 2026 23:20:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RdL+HQXb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CBEF10E05B;
 Fri, 20 Feb 2026 23:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771629642; x=1803165642;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=35guOvvMEBxxqkOXROpVm2Eeu0RJKYbOSpMaYShqRiw=;
 b=RdL+HQXbcuCef2+9J11vULWTpwCrRnGLAXLFpAcIf1eBgE1P+9dFSX9k
 PTkiYOgLW4qhJmq3PPpKsazz9KUodwxiNcekR/6Z1k2cywCR+7kWZ4HSa
 4KNLbsMQIXSCBRB6wxt+VHs6ZDPRntvMPf6trvQ/ib2EePZyV28WKQ00H
 ukDgbHUZRzoPxb8ZY6kSxXFokD4awKJTMxRcr0huzNM6LzjbSEv/V0XxR
 I9mw2+kuMdOcFT0Y1MOpwSTO6STnDVZqBweqAUJOEzvvzbqVdNUYPDscR
 KvuuS61f+1CbwihdML7yrGLki4oVNtIXVNdyEj+bVL+S7aLTT7ulRzcOn g==;
X-CSE-ConnectionGUID: H2sph/B7QFaswTcE0dYDdQ==
X-CSE-MsgGUID: LN9cF0jaRjqrdmnrB39hqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="98187653"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="98187653"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 15:20:42 -0800
X-CSE-ConnectionGUID: R63BhpghT1qAKGY9Ar0SzA==
X-CSE-MsgGUID: MUz5CaHORsiD1q4T6p6ZNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214217598"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 15:20:42 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 15:20:41 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 20 Feb 2026 15:20:41 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.13) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 15:20:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cGXadfk8WrW71UC/2jyf0AhDmme23f6UUjio3AxYhs+FnrGMJ3kk4Q6z3IYOSc3fI1/Rsmc84oA3UgumivinaQ2e+NPfjrpF6G58+L7Ifq7ubQxaSbJB9LJjhIrv315pWuemw2+P+R9oaTUhVV1gsTJeCOv04ElhZ3pRHeWqEGTZGhc4tXYYPYEgPHmpRhwIGYpIZiFYaaFM1/ljtOp+XMgTFlaKf1+6kqA/qZ2scta+NS5AuUUKFSfDWzKvOrQSTsLMknD29SLm8EuI0l7qAPp1BvJbzbQb7hOUC0UaCAUGktAu5GoIlbj/0ly+S585SPysp9HAWdVW7LU+CW1mzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjiMJ8yqIP/5WIukyN+UD+KfLpxJ8S65+KpHnCVk5Go=;
 b=ih3C1tyL1Ff0R3bgamMVFDAAZO+xZWBdkq7RLLJiZi+0mM1Anw/KtLRAZe2H2DBz5qSH7QhzIVqeP50pitSogO0eJXDEFt0pGSsXr+KWuXAKcHy7PZH+1OqgMOjoZFdnOENPNrME1RlIeyHfdaOoHlk3tp4tWLoE/t6hjpgNadskOQo5oxkF8ejFv2d17l+puJfrDM8iQjEz1HZEkNYt6pdJxmY5Vw2DtcRc1XZBF/2vswp0xOU+QU5GEy1U4Zgrv029TwjNrHt/VDCtC04Q4skAOUVf68brJEQNr21skQUQYq6icDYH1r/36M3BpL7jTco/ZK2tnspCowfBYUnk/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH3PPF97652A3E1.namprd11.prod.outlook.com (2603:10b6:518:1::d3a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Fri, 20 Feb
 2026 23:20:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 23:20:39 +0000
Date: Fri, 20 Feb 2026 15:20:35 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <jianxun.zhang@intel.com>, <shuicheng.lin@intel.com>,
 <dri-devel@lists.freedesktop.org>, <Michal.Wajdeczko@intel.com>,
 <michal.mrozek@intel.com>, <raag.jadav@intel.com>, <ivan.briano@intel.com>,
 <matthew.auld@intel.com>, <dafna.hirschfeld@intel.com>
Subject: Re: [PATCH v34 3/6] drm/xe/xe_pagefault: Track address precision per
 pagefault
Message-ID: <aZjsQ8Cvgzm69l40@lstrano-desk.jf.intel.com>
References: <20260213223410.99613-8-jonathan.cavitt@intel.com>
 <20260213223410.99613-11-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260213223410.99613-11-jonathan.cavitt@intel.com>
X-ClientProxiedBy: MW4PR04CA0070.namprd04.prod.outlook.com
 (2603:10b6:303:6b::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH3PPF97652A3E1:EE_
X-MS-Office365-Filtering-Correlation-Id: 10e3d5f7-a4ea-4d5f-a19d-08de70d6a8a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?h4XhIgm/P5dgmUHGWUSakfayhhd6g+imDI0xNEUdJcI9NrbSYAeg6/9aplLU?=
 =?us-ascii?Q?SlE5U2uviqZj1ZFujq6zpc+UVAc4JgKA7b/zL1cJRAaGevcf8rc+/u4Ad3++?=
 =?us-ascii?Q?FsDYemOmJpidj9+dVDMLnJ1zOd3GAWCZAimwYGlnQn0JP1b1iqpCeLsd7mh8?=
 =?us-ascii?Q?A6FLZS2LsEdFEXYePu5d/oANSniG5xVEtn51g5tzGf1COyU+1XRLrC2fbkAm?=
 =?us-ascii?Q?qQfqhl3DhQm18axlmhZSqkHOmhr33XuQw8+jhxcv2zqEStcuYRzWBnHN//C0?=
 =?us-ascii?Q?7DlhQiGlJRWW5W4T6C65fXeOXJ5dcWuBmbU2ecGS0IKcBZPiOiGuP005bU9A?=
 =?us-ascii?Q?6bMtKgSs63tI/fIJjjFRx3ZGDJY+BrVLWrHbewqespq0Y9nbLfF+b4XUbwFo?=
 =?us-ascii?Q?Hf7H39vD66AS/gnZ+sKXUg1umE0gW3mxrW1SHqEdvdpQ90NDdr2+matRdHix?=
 =?us-ascii?Q?3xX/uljblcxPP30xoTLWzqeLWpfy1qUuQ0W4c5hlJHKwCNtxoD8Ub92TlZcb?=
 =?us-ascii?Q?g2tPklJcem4K50muaVHC9ahDqrsmFKqXDTuGWoQMEsAng4DgDUQDpZL46vtl?=
 =?us-ascii?Q?EhbMyV8zQJK+Cj+e5+dVQ27V4GNx2e6/NC10kzdKdfiHXuIqqgzu1kG3r7qj?=
 =?us-ascii?Q?IVyOzGUGkh0Udp5omjJEjDyYSYhKHXSaCtv7OHxqEvOJ/fwsrkhEZRW/biLo?=
 =?us-ascii?Q?fa3B5+TRrxaOqtbIp286AkYtn9oPA1KDSf9CqEjPQeSUbwADNIFd8SeVfdsk?=
 =?us-ascii?Q?VvVaOClu+/TGswlo6LeTcWCaU022zWCdiBeFYl/ZM29NmvtlMjUyYPStIvA6?=
 =?us-ascii?Q?6rMATgIUg8WQPE7D8QPLUyYu2Wz3KS2tUZWEX2/zzhCbSjQGPnHZRbaZGD34?=
 =?us-ascii?Q?Gui307/f6AtIVzGFp1GX9X+mOjybwYYanxSDvs9c7+d5kiQAF54hwspSy94m?=
 =?us-ascii?Q?G4ZLIeqpZ+UgbZWed4OOePRTf4AZZMaJAQF4rCi4XTP0VnNDXDDKmk3lif3i?=
 =?us-ascii?Q?ghmo6ws3ak85jD5YGDPSdSQaWvwhG5aqnLMyFPvbnYaDUB6A1T7gAqkcttGy?=
 =?us-ascii?Q?THIl6kQYh93S7a2AM/TZzivBYoIbZ6lg8ipEFxq3gv0LPasunyArbnd/m9Ih?=
 =?us-ascii?Q?zt8Ph289eBZalUCfZBNuL1ofJioRX6z6pisdyc2uFux1XQUIQaT3AuYpSbWB?=
 =?us-ascii?Q?f5VJF7RMgHTtkPfGp2aaMBx06l+wvjuPmsnirX7j6UZTqrlbmNM8/pUAv7ht?=
 =?us-ascii?Q?HOcvzPZN4mEyeYOkKZ/iaddw3fGoyTP8OF5JV5gVAlbQkjcmYHGTvhUxCXZf?=
 =?us-ascii?Q?3NmQg14Xr709cHzNOPHi2dtoYmDtsW0JNKxG6JbOA6vjjdjFKw56p48agHdG?=
 =?us-ascii?Q?7t23ERoBCdx7iB1a0ahtzMnFH56afEEv9ppQjrjTeVzohjBRzJd7D98tYqnu?=
 =?us-ascii?Q?JT+jDyeoyhROKuqdrbqKdL5vhPQWDv1cbXeREg4DlnNXjIU7Pitl9oT5/xsM?=
 =?us-ascii?Q?71IQ+5fS1N+PkaZo3wRDQt0m7Jsa6kX4VQtUeWDHgt24ivmytA4m7Oqexzb1?=
 =?us-ascii?Q?rEtiCt6j70axilgKOEw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kR3wVQtsZjwVlZ5B8Ov+EkYtysAyK2zebAvDtUjwgjnNDaGq38cpT7SmRANK?=
 =?us-ascii?Q?FQd7fSGZWcdRvvce71aRI+Tf/F3HNjLPBBA6FFSVPD29p3ZpMQaCkUR7/GY6?=
 =?us-ascii?Q?2G61+Wy8KRSPGFFMIjfALYlsX2OboaJ50XtnmYleGqG+9omnO65IolIGYjBr?=
 =?us-ascii?Q?jeerDl9/2kZJG7rLdZSiejSZDF3ejqjq4STSqwru1tnXo6FKrZtWkuYN76xw?=
 =?us-ascii?Q?O0uLE/BH7FR4TpKsNM4/KEF5NQsx8LrRoOAHj2HVfa2l/QXS/9lwd+XAWms/?=
 =?us-ascii?Q?UZ7WOChuh55jMugQgw4OiUn7dzIL3/qiCZRBsbo2/hYF0X0PHymtF1A0ibwX?=
 =?us-ascii?Q?PUdVhF8oVT2/QZN6pMRIq42zihbTj1BZmZQQW9HJXXKDDS3PnwTTBl7fJooC?=
 =?us-ascii?Q?wLQTxhmua9y1lnFrMo486TM6xEV/JeWVMVVF5svgyrfvRDDyQK5JSkmOByTo?=
 =?us-ascii?Q?iXIzoDVpaWpCS1k9MxQzTjUCJCIbHddy6Ce4OY4emq/6J57O18TAIe//36fj?=
 =?us-ascii?Q?8Gw0xxXfY+n/sDl6XnQfvwNaIqDZHX7PuXv6QaThZzKYX4jc8eeV4Ud1QtE9?=
 =?us-ascii?Q?02/fatlf7BF++Si8kI7h9tUOsBfu7HMl9DxIzYYwd86DdMYwPmbHm5Um1wj7?=
 =?us-ascii?Q?yOS1aRZl38eo7a8xpkBs5oc4Q06VHrEekAEQD+8qrLfDkFRp/MDlkiPo/r/a?=
 =?us-ascii?Q?lGDIBngWRg79//I+p/QSK31YQOlVFxcCXjGN0RNXCnWURUwR9uGSxpMqqQjB?=
 =?us-ascii?Q?ARvcmK9p3HhNUsBZHxivTGSZdsfPdop93TKmREeH2AOh1aXauO3F9taYxILb?=
 =?us-ascii?Q?IVVncd8MMPe/M35d+TT00TBffnQhftNAL2NOlu6vYHPkopEJ3jY5EZD9SOle?=
 =?us-ascii?Q?qNl1vF11WOLu2HjHBUuC3w8yWdUVyIkkAsQQ7D/fOIsUoVKtPpD4RBuQKYIe?=
 =?us-ascii?Q?y8iZ/PzHhhjbngSb/8JntnkltocFIzNp7Hg8nyXg17sC6Ano33WEziesdboP?=
 =?us-ascii?Q?DA92my6N/Zmk/xOQ4HD7NICrkjq8vSVqu/SRmKuXEOeAI2dDmD+hfWCOdEIR?=
 =?us-ascii?Q?4KudWjWV/T+U5ZMPGzvL2YGORnky2SsKBsG/03vfwnzTjR0kXU4FBKAouvum?=
 =?us-ascii?Q?JYM4JQ7H6eh69vaMSRXzUImWlEvb2ataTSRyEt58Rm7sL6BS9t9BV280UGO/?=
 =?us-ascii?Q?Xc1+UWCn/M9+dRohnZAVwa1YxPJgKTakWmXxxyihzwJV0Khjn3c/OMi53WOI?=
 =?us-ascii?Q?f0VCUOpgIkqGlEpJhodDTomrICw4xO9UI1ke4fRphZaMzl4hQCe1c0BUJjr2?=
 =?us-ascii?Q?uHWw61MQNh0bPnDeofsy9AAbuLC0J0DN/SDKJRvN3PG8MBjw3e/kCjjEQhxX?=
 =?us-ascii?Q?7dBq9cBQaLlXIlCk9rrquyM9Kp1jEkzc98XlGFu+wfbytM8EyhDCGfu/iERV?=
 =?us-ascii?Q?kOzm/9Koh9sf6BGc3JivWQN7eHbuLSDS3Qn8+8he/JLmXTWIjs5qcaUeIbXr?=
 =?us-ascii?Q?Mz87FLFNsV2U4Y4N+1qm7jKMKOqfji/R/XSRexuqmlRz28A+n0wYmpwLUdZN?=
 =?us-ascii?Q?2WlrfLl2rfhMfBkLsLs1e95JMZ9uwX8FQOxrRvp/wpNiAYFg4HPMm6AOkJDK?=
 =?us-ascii?Q?p8Z1KVlYLDo17nD0Ka93AtkuGBp4mOI+v1uPvHELcpZ9qai1S0zpqPPhJs2f?=
 =?us-ascii?Q?6uEJGcx62qfX8evGkVyM1oa2IbqmXqKX0oma/S8vbN2qvnpqKTFnN6eJRZKC?=
 =?us-ascii?Q?oOjGj4FtBjr8pLkJZihfnOF7sB3BX68=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10e3d5f7-a4ea-4d5f-a19d-08de70d6a8a9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 23:20:38.9019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nTq0W6Pd7bZukEf9zj248lUcIzVRkEpEc01f6mypcUomubUE0PpG6oMFx3roGxKo12XdThAGib17DU2viveiFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF97652A3E1
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,intel.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: F286F16B5FA
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 10:34:14PM +0000, Jonathan Cavitt wrote:
> Add an address precision field to the pagefault consumer.  This captures
> the fact that pagefaults are reported on a SZ_4K granularity by GuC,
> meaning the reported pagefault address is only the address of the page
> where the faulting access occurred rather than the exact address of the
> fault.  This field is necessary in case more reporters are added where
> the granularity can be different.
> 
> v2:
> - Keep u8 values together (Matt Brost)
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_pagefault.c   |  1 +
>  drivers/gpu/drm/xe/xe_pagefault.c       |  2 ++
>  drivers/gpu/drm/xe/xe_pagefault_types.h | 11 ++++++-----
>  3 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> index 8eaa1dfc1e66..ba6f8e8dbe4e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> @@ -75,6 +75,7 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  				      << PFD_VIRTUAL_ADDR_HI_SHIFT) |
>  		(FIELD_GET(PFD_VIRTUAL_ADDR_LO, msg[2]) <<
>  		 PFD_VIRTUAL_ADDR_LO_SHIFT);
> +	pf.consumer.addr_precision = 12;
>  	pf.consumer.asid = FIELD_GET(PFD_ASID, msg[1]);
>  	pf.consumer.access_type = FIELD_GET(PFD_ACCESS_TYPE, msg[2]);
>  	if (FIELD_GET(XE2_PFD_TRVA_FAULT, msg[0]))
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index 47b6a7628dc1..c2ab183ded29 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -233,6 +233,7 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
>  					       pf->consumer.engine_class_instance);
>  	xe_gt_info(pf->gt, "\n\tASID: %d\n"
>  		   "\tFaulted Address: 0x%08x%08x\n"
> +		   "\tAddress Precision: %lu\n"
>  		   "\tFaultType: %lu\n"
>  		   "\tAccessType: %d\n"
>  		   "\tFaultLevel: %lu\n"
> @@ -241,6 +242,7 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
>  		   pf->consumer.asid,
>  		   upper_32_bits(pf->consumer.page_addr),
>  		   lower_32_bits(pf->consumer.page_addr),
> +		   BIT(pf->consumer.addr_precision),
>  		   FIELD_GET(XE_PAGEFAULT_TYPE_MASK,
>  			     pf->consumer.fault_type_level),
>  		   pf->consumer.access_type,
> diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
> index a14725a02f39..ce15fd8f46b5 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault_types.h
> +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> @@ -67,6 +67,12 @@ struct xe_pagefault {
>  		u64 page_addr;
>  		/** @consumer.asid: address space ID */
>  		u32 asid;
> +		/**
> +		 * @consumer.addr_precision: precision of the page fault address.
> +		 * u8 rather than u32 to keep compact - actual precision is
> +		 * BIT(consumer.addr_precision).  Currently only 12
> +		 */
> +		u8 addr_precision;

Do we even need this field in the xe_pagefault in if the value is fixed?
I'd lean toward no until we have producer which can set this to anything
else.

Matt

>  		/**
>  		 * @consumer.access_type: access type, u8 rather than enum to
>  		 * keep size compact
> @@ -87,11 +93,6 @@ struct xe_pagefault {
>  		u8 engine_class_instance;
>  #define XE_PAGEFAULT_ENGINE_CLASS_MASK		GENMASK(3, 0)
>  #define XE_PAGEFAULT_ENGINE_INSTANCE_MASK	GENMASK(7, 4)
> -		/**
> -		 * consumer.align: buffer u8 to keep struct aligned to u64.
> -		 * Will be used later to store data.
> -		 */
> -		u8 align;
>  		/** consumer.reserved: reserved bits for future expansion */
>  		u64 reserved;
>  	} consumer;
> -- 
> 2.43.0
> 
