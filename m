Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFFBAFDEDD
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 06:44:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4932C10E709;
	Wed,  9 Jul 2025 04:43:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cS068e3W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B02C210E1EF;
 Wed,  9 Jul 2025 04:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752036238; x=1783572238;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=nXaPbOKSf6sUuAyMMu1eXqLlGDTO1kwpdV4oTZz3Wkg=;
 b=cS068e3Wfus6MCqP0/VjTCn6qQKF10IqcJHZu2S97lzTfruS/wCkmnlQ
 POBt9ZTInApIeUwAQ2/01VHpU+rERhd/c1FENT+geYy07IEPOmNNJHf59
 +DgB6IxX8NEnOQxM4EeXvXPAA7VKNIAxtNvrAYc7stIDib5m8gwQLwUS9
 jk49j2XAVm7oDqSkY++BJu9VuaPhcw3yayzv49YtQNfbfBz6QaoCrRc2C
 M8uISrlBvNsZ6n9jhnzWlyRwvq0b4+Kg/qjQA9K4dreJ8EYxV/udrvmAt
 NzTk35qQvmu0s72ElOn/lbGEc6LXUKs409OOZMepcjKrM1dLfos7EVQI3 w==;
X-CSE-ConnectionGUID: qFGHH7jGSWazKtTWYTDkxw==
X-CSE-MsgGUID: N66Ya2owT7OpPWNzzfG3mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="76833571"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="76833571"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 21:43:58 -0700
X-CSE-ConnectionGUID: 0s7lxRwmQDODQDj2ZD+iQQ==
X-CSE-MsgGUID: YmTVo7LZRI+L9L+zwXJtLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="156149542"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 21:43:57 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 21:43:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 21:43:56 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.49)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 21:43:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YNgbKiMTzTl7+AMZNfTZsdmWN3NagweA+zhfUy6JndrB+CZ1A41k2rXQ6Rr+kNtWtQQRrNWANuF6+TAGFV/3OfyKSKuwidA8VpHEK6bFe/5cSqdVx8Ewq0QFWlktdrH8kIfBW4JBJhyS1xfCwsevbmdkI1tjmRAA1mECZkmWY7y0eeF4BX/Ao0VbGjWfZhhXYRdaw0Vd0R1FkTOuKlU2urY5S208F8WVYWVLL9qQeUrpeqWrJ15iEkTfHuIwlRsB5Eba8G1Sqlp5srvvAShO50pFdBtPMjgSKvctXQTfYuOmikYZlXr3AI+bQVx3dzbHrzPa5Zdzf+M1wbbAZncktA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXg9uAw83MZObSPlT9GShz/Yrie/NooUYdrcmdYDfLE=;
 b=qMSvQwrcfrMMkd4smK8EfFOObyL4Yb+3Pexs1XLzusG34OzSobzHJyWOunYkJRj/dS5hHum8/aI7X79rVw8jG0ktQmPpYzxaiFfQ3X7ZIPeSxujgVKHbS2aj5dbwlK15BQzChqhVrhxUvcdMgH4HOTyy6dVmvGupP3o74cfLvifaobkW/Nn9eYotS8tezSjbNPRTkcK+c+1dSUz3PI8VKuZGNfL5lvTMw+DF+GfQ+ulvycZHuUyBaaa6LGq2H7wPcs+QtodKwhne7IAn3cO4y3PoT6DHyyctOO1SGOhvkLQmmrvTG+GsN2gNYkYyZg+3K4MAPX6fumiqVrOZsfTCLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB9456.namprd11.prod.outlook.com (2603:10b6:8:290::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Wed, 9 Jul
 2025 04:43:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 04:43:36 +0000
Date: Tue, 8 Jul 2025 21:45:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>, <kernel-dev@igalia.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Danilo Krummrich
 <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>
Subject: Re: [PATCH] drm/sched: Avoid double re-lock on the job free path
Message-ID: <aG3z38CePTKpvjfE@lstrano-desk.jf.intel.com>
References: <20250708122032.75668-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250708122032.75668-1-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: MW4PR04CA0390.namprd04.prod.outlook.com
 (2603:10b6:303:81::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB9456:EE_
X-MS-Office365-Filtering-Correlation-Id: e5dec15d-096e-4cf0-64e2-08ddbea32ad2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?KxvGWhGOrP7FS7YHaxQtJ57rshbDT38ro1knZ3tBFq0H/bUEca8nxVgMWJ?=
 =?iso-8859-1?Q?ouAQR1PrVV6lNugqWB4+LXRv/ocit3ZLaFfjUyuwwok+PFCZ91nRD0uzKx?=
 =?iso-8859-1?Q?bvvSR8FpyXhx79Y+ZwhASJPZmPQYuZFbz8G1S09RFm8LrX71HbFKz8Hz50?=
 =?iso-8859-1?Q?tXzhWyS/DfC8AXHNFpNAK2FnuVKsKHrTpDT6bQxciV9TIKrphksEAxH7Bz?=
 =?iso-8859-1?Q?69zLxF++3Rj5UHuqPQjGAfYnr+M9vSpB1ADsJ+nOanR0EDdZ9X5XDFj115?=
 =?iso-8859-1?Q?D2qGgDxyXH1a0TsTNjb2d94uyYAHsuAZ3R5W3LFDaXq5cTe8N4E4O8a2eg?=
 =?iso-8859-1?Q?CTkdh1a/DS799ZOVwKWanuHPRF2G192PQ/kbuJdL8HgDVm6hfD+NtJwydn?=
 =?iso-8859-1?Q?nmv+lIwhtxSJHkqT5X0DHslkSCwEcVCVRftWDa9nvCa6kknENLX8tArmR8?=
 =?iso-8859-1?Q?G2JhDpDH9sumsDEHYuE5wgIdajZpGSyYsi3R81aNs0n3msvTJY4GiwqyPp?=
 =?iso-8859-1?Q?pC2sYC07zmu6Vu8soXvvCoGqC6hLpKFau4CsjIKqiFgjv6jakHUQA8IB7D?=
 =?iso-8859-1?Q?gUXVBgM5WPHNSaj8apLGNZT8kWS4Qy3QzdAT8n8RdfV6wbkRuDr/SOHiH9?=
 =?iso-8859-1?Q?1quHL77yecvXf4nesxeb+M218e0Gn6XXKL9yxKunpPTBfFF8Kw4jTObz5Z?=
 =?iso-8859-1?Q?PL/IpLtt76JYcAWYezaB8KMMjsAGtT2XonXsLi4BmaLVqA+GS6J3HegoNW?=
 =?iso-8859-1?Q?zZqWPl/GT0O7zc7HA3isS1wPlQgMZIKRsGBC7U3/qld+eMZ+rOvo9Qty0X?=
 =?iso-8859-1?Q?goFPOah57pKP804IOl961FJ387KUnL3P62VvlKL//ht0RWUmH4AIzO199Z?=
 =?iso-8859-1?Q?GXsP/M7s5TjNfmLwlGjrHyPfLbdMUcjje7V8XBSLi6o6u79Y6FIEUUq47P?=
 =?iso-8859-1?Q?rGpSJ1WlsuiaymYBlsKolbEz1YhDTk2+vz5+mSpxLchb0n6/CiO+CdRRz4?=
 =?iso-8859-1?Q?R+lOJXThYoduyA3SKC1qztyfOtY5R39vJfiuRkjeKIoh/8aB+VEtVJKkYQ?=
 =?iso-8859-1?Q?fGbKOcC3MsI9AoEVAtQZgm4ynjDmHMl9gyRBS3++i4RiYaeZoorE03EaBY?=
 =?iso-8859-1?Q?4kgni7ELAuJzwcWGwoJyG6s9VQHgKxEM9XMwX+QoZz/5m0V23SRt4HKTDH?=
 =?iso-8859-1?Q?qfuUag+Whv464Fw2ruG6T0bs/H/vi/oOF4doWSYrKGC39WpNvKJ54vu2du?=
 =?iso-8859-1?Q?lzIc1RiIS3qphOIpkNIJshjvbfaHJoVA0TC+AKlNvv1qR84qCkA9FZ5s8+?=
 =?iso-8859-1?Q?0egGsAoQAVrWhTWnnoChIHYe5Y76QELN2YYwh1bjp4Q85L3SXzZvkxoy1Y?=
 =?iso-8859-1?Q?Il6+urTDm4J+sxMKsjEHIL+HpjiYxqcpDLQwEf9EkppcbhPplPes4ZTccT?=
 =?iso-8859-1?Q?aGlBEkgONlIkfS/5VEdN70rjzKRYCEk0uKY+uTcTjU4rpgEBsuKiCvkKA0?=
 =?iso-8859-1?Q?E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?JRJ3JnUTvEwgOvhLI5992ufut9zPn2WJACRUd/PulWoUPSQU0fPEJQYTMa?=
 =?iso-8859-1?Q?Ey1548NDGAjmd1cPZ5jeJxNX4Xw9wK2w1vr/LQgXq+xVScx3K3AlZB1V/Q?=
 =?iso-8859-1?Q?YzeQvui7s0VCUybQgZnXe33y1IwPe+jODCI/MDVsbCMPQJhUM5Elg1UnMv?=
 =?iso-8859-1?Q?uBvnHU9KT+2YIdvkHgvOIaUG0Qpi+kbDnGVf0Y048VnAwwiLdR/B/mgWTE?=
 =?iso-8859-1?Q?1hMoSNz3Nm27lY9ZLj94jRth2uIVY5VXNDhpp3m8v4CZz1dmZHwKdmnPTl?=
 =?iso-8859-1?Q?ZyG4N5nw9b/hc/UQEgk9DVgH06enk69S2Id97W1UU/0wMpJzSiQWs3sVin?=
 =?iso-8859-1?Q?QTA9GtbIYMedDecbdPBaguLhNxb2/BkJWDqSIiAtzb/eSD+DNRuH+JVpTS?=
 =?iso-8859-1?Q?BApIKaiFI8ItClqNB6ph6jYLHpv235XXlW3YuASYZmbW9JZ9o1wk1cr3Ky?=
 =?iso-8859-1?Q?TtxSgkVJEa8GUaUJf8j56/wa36YApJe8y+iYon9omG3Uf9EiXndZ6BgIQw?=
 =?iso-8859-1?Q?4J3ny7DEeLSqX1RLoVhp54TnPZy5SXSRkZauM7O6ALEGiKs93fFD1NiTVV?=
 =?iso-8859-1?Q?WoUIBrvGvg7peZVm+AVyBjPxu9DDA4+x/IatxVP4Cqn8FaFhpCqg8aQkWx?=
 =?iso-8859-1?Q?wnEiI/hczK8dWePzn6r337uKD3n5FqfY/BC1SEH90Ym8rlv0TRsceOwf97?=
 =?iso-8859-1?Q?SdynzpubKpqKF4RW4kab80dgDcdV8HJ+RI3RGtKbLdfHyykotSwWUDUCOw?=
 =?iso-8859-1?Q?LTCkgNcihf0ZKSX2UySyZ5w4zK/gcb1t/pcPoG74rsfHlmqzk87NA6MrXO?=
 =?iso-8859-1?Q?CxOCYq90hQ9IdRQJmb3CqOs9rt/rx/W3EOharyLAWl7xwAA+pd2mOcXOo+?=
 =?iso-8859-1?Q?uhIFrfD9OoCFBl96vfNuqRjxVeMizV8Jxz0KfFQiDPiyzVI4UL6JTdTtT/?=
 =?iso-8859-1?Q?1+w+WQvWjEHRsGVgmo4/0ow1k+xZnJIz0ac5dwl4DdBVNrpwJ/xss+I/Jn?=
 =?iso-8859-1?Q?tegERmgYXxVNFKuWXygbMHuc0RoTOhnfBomkn9p9FiMNl8cfnJwl8lOyr1?=
 =?iso-8859-1?Q?6WBueiYMRpHPcfG1hgO6smRWssyqhRLU0PTspmKUqyBMVwtXQq5g5/u823?=
 =?iso-8859-1?Q?/aK0u3OmVslxZKc0E50zWNPcH65wFzL3jW3fO13dnzQLIkkxhsd9yMEGJH?=
 =?iso-8859-1?Q?/ribe44DsGlwiJ4mONpmAJa+ZxH1K15YHNPlmmmYMJ8cg/LbyJ3sPbWHxc?=
 =?iso-8859-1?Q?k3DZGDxecFa3lcfOgjJkw5rz967lnE1YbBOFoA4YAckb2EETLgy47zUXhO?=
 =?iso-8859-1?Q?ujDlRhdKjZJqXIUo0QkwYz2CGNOf6voAguQFVGbOVjlrjg8PblFbEw8Fpf?=
 =?iso-8859-1?Q?+zAE4LlG9JtFYMCYYamU5LvKg57gBYIBj73HVaboDnt5Ie22PoKk+/lADR?=
 =?iso-8859-1?Q?Q9jM0kU8d7dwxD9ZERCxX+FxJFaNBkLx7vcbBsQLvApFAhpTfbdmw9rkGj?=
 =?iso-8859-1?Q?y//MXLzniY6k66E9mvegY64IzNbGkve4Q7v5jy2uqVxAhKSkELRGWPVZNw?=
 =?iso-8859-1?Q?En3ANEAI8j/InUX2xeXp+OfTrTzg6zSG6ALIDb9Qbuku8ah+DBUr80R45f?=
 =?iso-8859-1?Q?p6LaRBbvm4sYBOI0IkZXEmGA8RzNlusiXHS9Bc+tqq4BMc9vaagMNWZQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5dec15d-096e-4cf0-64e2-08ddbea32ad2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 04:43:36.5117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HmSG3prlW6Rh1IJeIEgiDpueDN9+KvUxXF1DzoR7xwuPRsTZ98zfI0DGECJ9Jbp8Kgs2u7IfSYF5ZQh2pdCVIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9456
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

On Tue, Jul 08, 2025 at 01:20:32PM +0100, Tvrtko Ursulin wrote:
> Currently the job free work item will lock sched->job_list_lock first time
> to see if there are any jobs, free a single job, and then lock again to
> decide whether to re-queue itself if there are more finished jobs.
> 
> Since drm_sched_get_finished_job() already looks at the second job in the
> queue we can simply add the signaled check and have it return the presence
> of more jobs to free to the caller. That way the work item does not have
> to lock the list again and repeat the signaled check.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>

The patch looks correct, we do have CI failure in a section which
stresses scheduling though. Probably noise though. Do you have Intel
hardware? I suggest running xe_exec_threads in a loop on either LNL or
BMG and see if the CI failure pops. If you don't have hardware, let me
know and I can do this.

With a bit of investigation in the CI failure:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Philipp Stanner <phasta@kernel.org>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 37 ++++++++++----------------
>  1 file changed, 14 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 1f077782ec12..1bce0b66f89c 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -366,22 +366,6 @@ static void __drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
>  		queue_work(sched->submit_wq, &sched->work_free_job);
>  }
>  
> -/**
> - * drm_sched_run_free_queue - enqueue free-job work if ready
> - * @sched: scheduler instance
> - */
> -static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
> -{
> -	struct drm_sched_job *job;
> -
> -	spin_lock(&sched->job_list_lock);
> -	job = list_first_entry_or_null(&sched->pending_list,
> -				       struct drm_sched_job, list);
> -	if (job && dma_fence_is_signaled(&job->s_fence->finished))
> -		__drm_sched_run_free_queue(sched);
> -	spin_unlock(&sched->job_list_lock);
> -}
> -
>  /**
>   * drm_sched_job_done - complete a job
>   * @s_job: pointer to the job which is done
> @@ -1102,12 +1086,13 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>   * drm_sched_get_finished_job - fetch the next finished job to be destroyed
>   *
>   * @sched: scheduler instance
> + * @have_more: are there more finished jobs on the list
>   *
>   * Returns the next finished job from the pending list (if there is one)
>   * ready for it to be destroyed.
>   */
>  static struct drm_sched_job *
> -drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
> +drm_sched_get_finished_job(struct drm_gpu_scheduler *sched, bool *have_more)
>  {
>  	struct drm_sched_job *job, *next;
>  
> @@ -1115,22 +1100,25 @@ drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
>  
>  	job = list_first_entry_or_null(&sched->pending_list,
>  				       struct drm_sched_job, list);
> -
>  	if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
>  		/* remove job from pending_list */
>  		list_del_init(&job->list);
>  
>  		/* cancel this job's TO timer */
>  		cancel_delayed_work(&sched->work_tdr);
> -		/* make the scheduled timestamp more accurate */
> +
> +		*have_more = false;
>  		next = list_first_entry_or_null(&sched->pending_list,
>  						typeof(*next), list);
> -
>  		if (next) {
> +			/* make the scheduled timestamp more accurate */
>  			if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
>  				     &next->s_fence->scheduled.flags))
>  				next->s_fence->scheduled.timestamp =
>  					dma_fence_timestamp(&job->s_fence->finished);
> +
> +			*have_more = dma_fence_is_signaled(&next->s_fence->finished);
> +
>  			/* start TO timer for next job */
>  			drm_sched_start_timeout(sched);
>  		}
> @@ -1189,12 +1177,15 @@ static void drm_sched_free_job_work(struct work_struct *w)
>  	struct drm_gpu_scheduler *sched =
>  		container_of(w, struct drm_gpu_scheduler, work_free_job);
>  	struct drm_sched_job *job;
> +	bool have_more;
>  
> -	job = drm_sched_get_finished_job(sched);
> -	if (job)
> +	job = drm_sched_get_finished_job(sched, &have_more);
> +	if (job) {
>  		sched->ops->free_job(job);
> +		if (have_more)
> +			__drm_sched_run_free_queue(sched);
> +	}
>  
> -	drm_sched_run_free_queue(sched);
>  	drm_sched_run_job_queue(sched);
>  }
>  
> -- 
> 2.48.0
> 
