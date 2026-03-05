Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEDmL7fkqGkKygAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 03:04:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7D620A16D
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 03:04:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E053710EADF;
	Thu,  5 Mar 2026 02:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bsX7jPto";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE8D10E1D6;
 Thu,  5 Mar 2026 02:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772676274; x=1804212274;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=djU3LFFYH/Jk8x7XNoikYk9zkfgvMGaEEpVO2mTL+3M=;
 b=bsX7jPtoa8djSPqwvVoHUmXIntQabSeTdVHzgj1lGYfbLtLVPj8xxPoU
 2+xReRd4aW7iQESUXjGQjTbPK9z/BCUO/v4ZZ4Lv0rYiUfGDW7JkaAAqq
 7D9IXKVCk82j0ZKVv2mu2O+KdoiOLzaHwe6/lTd96YNuh8cj5YLuIVeHd
 juqVmt0O4sTAkxy12nc7gYYqdNtaRWvGWr+rYSIGe2X9K8Dp2kHdZFIIW
 nkhMPK3EFodKoSzF6SFl9LuIFX+81OWxwrkduZbBkDtkBfRXvRE/NkQNe
 AG19aQ4lbxOHq12bdlSuLiwU5wCGe2umokk2lWgOt66lkZK4xHTl40qXD g==;
X-CSE-ConnectionGUID: SnotvJKoTcyO+z/3LtKN4g==
X-CSE-MsgGUID: vdF58JeUSfG4M7r+dddUTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="72950426"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="72950426"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 18:04:33 -0800
X-CSE-ConnectionGUID: g60yybrERSuYO6KaoWrbnQ==
X-CSE-MsgGUID: a1vLN7dkRO2TikVyuilEAQ==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 18:04:33 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 18:04:32 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 18:04:32 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.66) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 18:04:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N0jT2iC+sqjsvjBiIlsrNoTNslnIkCzulyKBMywgxQ6Fox5CjXIiF1Z9O3I3h7zlEuAJs+OuYLmNPxG15lj/q705y23dMVKAI8ogjKjjyXTBlpLw3q7ZIsfSbMmUA6c888Dk5x3g6oULwdjS+ucWYbGVpFC+g/TQWbuDJ9fPlgU/tRo5qZ3do12ibl2tHUC/rJtOEH2kvY0fnw2/HIiGOfXJvZmGeo6d4aWM4S06bH+XRtu9s60GBHHW4bDuj0LnVsFOxaVUtbTUYkGUgGqCBdDD7TP5jQmkzr91gpE+SahKBvc1KUsDYma0LMYbWVW+f8Pl+Xlg60obdZJr0hkIrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LMBzpy1wRVgyF4ooxfQOfjXv5GPNLXwDo/tFwE2w2hk=;
 b=Q680e0rUYPL1zxWswzxGxELSPyd9LynivXS49jJF88IreYKYUj6qfpUGM9j89EaJrdnalbQHBZ/EikOh7Nv010R6pJOQAM7ckUQA5Qa++O6y5weirgVeHnCmov6lF1gVsTKZEc6GOYIECNyeiI4llXWGUUanIbqARuMKVf/ywmoHvvaTGuZ7xPnintJ5IL10dqgNFbxtKWxfLT+bxpgFHP3VbprcEQqCoaIOlTg12205l21MQ3nKd17j852e8QFOorUrkqIwIm8XxZpMmj4+Tx4SUsy+JK7KuZwAOyIxSoh6hkpDVo79bRMjqIkkrHzuKjISp/9gnk55IkltXqqolg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SA3PR11MB7581.namprd11.prod.outlook.com (2603:10b6:806:31b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 02:04:30 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 02:04:29 +0000
Date: Wed, 4 Mar 2026 18:04:25 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Chia-I Wu <olvaffe@gmail.com>
CC: ML dri-devel <dri-devel@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, Boris Brezillon
 <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, "Liviu
 Dudau" <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>, "Philipp
 Stanner" <phasta@kernel.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 open list <linux-kernel@vger.kernel.org>, <tj@kernel.org>
Subject: Re: drm_sched run_job and scheduling latency
Message-ID: <aajkqXZDGUFPlq1o@lstrano-desk.jf.intel.com>
References: <CAPaKu7RbCtkz1BbX57+CebB2uepyCAi-3QzBy8BDGngCJ-Du0w@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPaKu7RbCtkz1BbX57+CebB2uepyCAi-3QzBy8BDGngCJ-Du0w@mail.gmail.com>
X-ClientProxiedBy: SJ0PR03CA0361.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::6) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SA3PR11MB7581:EE_
X-MS-Office365-Filtering-Correlation-Id: f15033bf-36bd-430f-7865-08de7a5b8935
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: AnmPTj9g9c7I0XtQ5Fa8cys2U6uPFNABvrXuFSM7qRuajq0a/Imp3cZ/jUMfBZLfKkBCqKqduCksPt8WNymFnTtbVrcpFp2/Q9WsE9Iz4hFr++Ige4ICxCZKQ9N7+BgNp2Ut+Us9Vo0VrPPOpju3htegqWZC3u8VY2v/AVLzQ/ze0NEH6XXrqP2URc7Wl0Q7vK4b5jhZtEWhAA8I3T1TVtOXrON9nbC0PQ0H5d0FFqmFoamNWDAOMVT+r4Dz0UW6Cju5Wv2QpQv2SPIMk71xl1Q8Aoxf5l6luoqzxG9uRQGAwEvxKextUlQccXHNR4oiOWjZ32TDeD7qEvBabC6XL6uxUsCy3Q53hOxe7bBKS8RPtA+YSqmNUMYw3785Q5mVjfhMMvkp9QdvX/aBll/6IF0g5HZa/otqJYKLJA8jgrcKGmOw7LjX02+Fnbj/7S8bfDLqaHujbldvHdScKYBPz7GOC4JV/ZndGUmV6F6MO/k3pWhmf1b41YAvONzlxJEHbBk5Ddsd63QekSGI7QqtbvcxL21clG6bpA5yF3jRBZAqAupSXn4sIBbvotowV0vpxFMXLJduCyLQHtYJ9+Sha5IFFfOz0F1Ry1/d0IcEwXpozRLcL35xmTldwzzg3hqc3QXljt8Gw945Q/GV2FJNxHfPA/iGJuPmXomRwYpjD73vutV06ehOZHrIs+1/6HXXhLN8tXv8DEU2MX8+IxJW/sLRbmdQ6qzvDtrucfmcxLY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGtFSDVDVVhYa1RSUGFnYkVORG1LZ0hWa1Q3K2luNXdpVnU0cE5TV0NLN1Zt?=
 =?utf-8?B?eFNnVmJXbzJYUEhubm96dWdQYi93VWFNZ2o0eXB3M0ZtQml5K3NVaG4xWHBm?=
 =?utf-8?B?M3RTMVhaVW5ZUTVZMkZrRFVvMjlNMWE1WDBHcm95OExUZXNyem5KeWY2bVF6?=
 =?utf-8?B?OEE1bU5BSk96Wm1PQ0RzMGtzNnZaZEx5ZHBSaUkrOGRMUDB1VEZ1am1QemY4?=
 =?utf-8?B?eFEyeGRPVHBMNWZjYU1EMkJyYjVhdUUrOU92cVlEWm9qQnJGMWdRY2dpOWo1?=
 =?utf-8?B?RHEwbS9FYkZ1amVickdoWm9mQUNJOVd0QXFnWWhHdWtNbG9PRnZWN1JLeXg3?=
 =?utf-8?B?NmJ4VGRLbEtaZzFaVUdyNlNGQ25vT0RZTzVzU1pJMFcrTWFhTklSQ1NDcm1L?=
 =?utf-8?B?OWRLNjI3cXlPWVE2b3g0VGUrQ1pmQlRrV01rK0JkazRxUEk3d3M2OHo4b1h1?=
 =?utf-8?B?dW5WTDFZVkNQbjFzZjJhUFI4RUdwVFZuN3dzUUZOZFV2blprQmI2V2d6Y1Uy?=
 =?utf-8?B?VkMrekhSU09BN2VHRDFaNk9aY3JCWlFDbi9aL0ljYUFSZlVNYzhSUHNyalQ2?=
 =?utf-8?B?T0k1Q1JUU09MMlpyNjBQK0RMRE9aeG00VFJXVWl2TThrVm9RYnQxZlg5VVBo?=
 =?utf-8?B?V2JPZDVoVExmb1h6ZHhseG1RK3JOS21SSUdGKytJREZ1MHh1aXg0eDVxVC9O?=
 =?utf-8?B?R3JmeUliZXliQVIzbklIWnRoaW5tdjJtMXV1bG1tQmtpTExTWDE5NTlGOHNt?=
 =?utf-8?B?R0QrdlcrdFhZNUg1eHgwVWJ0WHlselBkZmQvNnkvVUxoNVdkYklUVzRET3JE?=
 =?utf-8?B?L1YvdGcrdUFiTDdYc3UvZzJmek5VYnNhZXpvSzZHNEdxdTQrbU1LdHBOTFFW?=
 =?utf-8?B?THIyNXdHYnJKSDBSbGEyVzEreEdDOHZ4UkpFSmhDTXZMdlN1cHkxdEdCeFlU?=
 =?utf-8?B?WU5IbW8xUWl6TUxvSWdUOUYzUDIva282alBVY3d6dVBKWXMvb21VeW9aQlI2?=
 =?utf-8?B?WUtzYm5JaStFMlpTeG15cFRERGlpcHBoSGJuVXRJbFdNNHp0NU5GbmVpd3Np?=
 =?utf-8?B?czVzWDhHNFlxaHZIc0FVS2o4Z2EyUXNrSG5UQ01YdDhwQzgraDZmT3prdFBQ?=
 =?utf-8?B?dGZyVlc2NnhIN2lqbUh5d3JxWmpVT2VCbDRDdnBCdEtCZ1VCMUs2N3Jua1hY?=
 =?utf-8?B?VmtWWndNQUIyb2FXLytTK3ZtcmFiS0RNK2NmUE5SaExPMTlxbWNYL0Zkb0Zs?=
 =?utf-8?B?ajFEaHFTbWtIQ3pJaUNCZDdMalcyZ1NjUGtuSWpZZm4vRFpMZVo0R0dQcVdF?=
 =?utf-8?B?Tk1vVjh4bGkyM1RPQVJjaGgyVDdrWk5KTHdwOEFWODBzVlZCMHE0TlBSclVD?=
 =?utf-8?B?djRRQ296a1NmdHE2UzIzRURvZGhQK3ViS3lRQzVCejE3SGk4YUluRDF2WG1K?=
 =?utf-8?B?dG0xV2lnWkFhYUNhdjRBUk9qWWliSWxmQkJla0M0dFNSblZkYUNJc2VDVkFT?=
 =?utf-8?B?cU5OQ2xFTUk2eTZZSnNTVy9DL1lOOTZyY1FaRUE5Y3MxQUhULytUM0diaXRx?=
 =?utf-8?B?eVg0RXVNTUhzNUU1dm9ySGNuVFVuemZXaXR6d3Noa0s3cjVNeXMrYmtEdzVT?=
 =?utf-8?B?VFhyUzdKQmFlVnY1ejgwN0RZSmIyVXFUaXpuS1VDd0lSR2ZVVkw4ejNKWmxT?=
 =?utf-8?B?YlVhZnUzYnZzaUtwYVhGemVWT2RsSnhqUHM3UTJoV0tyU011T1dRYnB2c1ZL?=
 =?utf-8?B?WUxreE0yL3granhSb1lmcVB6Qit4R3Y5V283eXg3VXJleHNFVkQxdzJzcDBq?=
 =?utf-8?B?QW1TOFlRdWpRdFpEQmZyZUxFVDA2RFpCV2tRWUlpb2ZzeWs0TG5pYXJod0tI?=
 =?utf-8?B?RXJIR3QvaUpieWUzZGN6UFpZWlhmelJMVVVLM3pTYVlYUWtlbDBJNE95a2d1?=
 =?utf-8?B?amxYcS9wS2xzL3NxQWNKbnBqVVE0d24rRGgrRzhMOGtPU2NuUTNiM2JoRWpq?=
 =?utf-8?B?RjJLeE9Fd2FFUytqODZVT2F0aUl3OXc1UmdzK09LMlFsQ0JpbmdlRTFkeG9X?=
 =?utf-8?B?ZDRucmdlbFBMUDhRMEowUnFxTDRNeGVKOGdmVkUydi8xUTNnU3BmZDdEQ1VK?=
 =?utf-8?B?WUhtczZ0N0Q1UkR6OGxuSnlpWXJkSzBxc0dEVDFPeGFBaTlkd3FGbENBVG5Y?=
 =?utf-8?B?RnJLdzBESHBhMUhCZS9CQ01SczZUTkhlOFRNaG1WZk1rNE82aHlCOUVpbnFF?=
 =?utf-8?B?RURXU0FGUjVjZ3ZOd29qQTRQVFZKSEdaNDBZTHVTYXNiMWdTM2NNOCtVb2ZB?=
 =?utf-8?B?ZThlaEVXejQreENhTU8xajNmcE9hYUZqdkFEMFF1OHVDeWovVTNwK29OM1Av?=
 =?utf-8?Q?+fipt4sPM+wUcdvY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f15033bf-36bd-430f-7865-08de7a5b8935
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 02:04:29.8231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eVm3MzEd3BZiOfNLi5hiRoORC4LORXAdVLNJXP4TTNlDNVhOJC/pRfI6t9eyNkQQ5go9KzZMda5ETIaxGT066A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7581
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
X-Rspamd-Queue-Id: AB7D620A16D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:dkim,lstrano-desk.jf.intel.com:mid];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,collabora.com,arm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 02:51:39PM -0800, Chia-I Wu wrote:
> Hi,
> 
> Our system compositor (surfaceflinger on android) submits gpu jobs
> from a SCHED_FIFO thread to an RT gpu queue. However, because
> workqueue threads are SCHED_NORMAL, the scheduling latency from submit
> to run_job can sometimes cause frame misses. We are seeing this on
> panthor and xe, but the issue should be common to all drm_sched users.
> 

I'm going to assume that since this is a compositor, you do not pass
input dependencies to the page-flip job. Is that correct?

If so, I believe we could fairly easily build an opt-in DRM sched path
that directly calls run_job in the exec IOCTL context (I assume this is
SCHED_FIFO) if the job has no dependencies.

This would likely break some of Xe’s submission-backend assumptions
around mutual exclusion and ordering based on the workqueue, but that
seems workable. I don’t know how the Panthor code is structured or
whether they have similar issues.

I can try to hack together a quick PoC to see what this would look like
and give you something to test.

> Using a WQ_HIGHPRI workqueue helps, but it is still not RT (and won't
> meet future android requirements). It seems either workqueue needs to
> gain RT support, or drm_sched needs to support kthread_worker.

+Tejun to see if RT workqueue is in the plans.

> 
> I know drm_sched switched from kthread_worker to workqueue for better
> scaling when xe was introduced. But if drm_sched can support either
> workqueue or kthread_worker during drm_sched_init, drivers can
> selectively use kthread_worker only for RT gpu queues. And because
> drivers require CAP_SYS_NICE for RT gpu queues, this should not cause
> scaling issues.
> 

I don’t think having two paths will ever be acceptable, nor do I think
supporting a kthread would be all that easy. For example, in Xe we queue
additional work items outside of the scheduler on the queue for ordering
reasons — we’d have to move all of that code down into DRM sched or
completely redesign our submission model to avoid this. I’m not sure if
other drivers also do this, but it is allowed.

> Thoughts? Or perhaps this becomes less of an issue if all drm_sched
> users have concrete plans for userspace submissions..

Maybe some day....

Matt
