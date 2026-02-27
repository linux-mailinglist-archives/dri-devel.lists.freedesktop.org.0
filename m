Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8P0xCOxPoWkfsAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 09:03:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAA81B4393
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 09:03:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E78810EA4F;
	Fri, 27 Feb 2026 08:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZSh3cXYa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E98710EA4E;
 Fri, 27 Feb 2026 08:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772179430; x=1803715430;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1aIttrS4oqqa/6FtUQDV7bBPsFimSM1IJXg8mBpCHgg=;
 b=ZSh3cXYaEl8n/gnbu+zjGHwm9tGpILA9Yv9ryKwhgehGqHKccUl4cITc
 kIuf4M7oUVhjrXnMAvUOA0k1E6szq6xEXfz8OZvDUg9H7F882hnxct/MC
 yZPJH/8PxMEwLkXxP9ukYfoo1cAimnSKXZ+IMPl04d/j25CmKzWHy1r9v
 pxL8+OYAF+F9lHxJ49mh7lEuGNFl61LCuDTg7I9/L2bxJUQdI6hm/vveg
 PnbE33xb0iSvglD1Ha1o2EW1k/XS9ixAccPOSNC+73kZBa3yb4ithso/7
 MiKEpL0hAJ2Mo/P8r9tT3hiG9QOzQgGtSx1gZuIbn/3FaRfcZNluy5x8G w==;
X-CSE-ConnectionGUID: MTQgkYngQ4e01CsYjH6sUg==
X-CSE-MsgGUID: MmYOiYUVSPyideL836hMrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73442976"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="73442976"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:03:49 -0800
X-CSE-ConnectionGUID: iJ8REfuvS8i1neSGtplflg==
X-CSE-MsgGUID: LtL9DMCJRqCCVF0ulp5UyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="214277705"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:03:50 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 00:03:49 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Feb 2026 00:03:49 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.5) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 00:03:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W50Sv++aEIyawzRQtWeia+Ow298bTEdcIYMgyToYZFfdN/hT4ym49pVxiAkP+CSOUDqwx8PqVC6JE9uAm5LEq7etyPQMn/HJoe4rOVof3+rv57L5HPlrM7sgvar4z8DFuTBN9K5Wbz/IEWjKZGgB5g+UwBAFiIGsUsF3ym0a2ZtOgS92tXIGBFJL5VMDIfpigQeXIAWzGuTeJgfquo1ckzcgJcAUNR6J+01mvHaM+Dk8nXY7OiQctASAl9Pj3S3UXK2A20SKEFNhvP5i47s0opPWHeMnYfF1EOZh+5wv1GxEwK+Tsw1FkjzVCCX7uiHV0OFzpPl/vOvPTwNW+wdmhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4avIhTtHSWcWLAhoRK0KAPktXnBs3epH9d9XDgU33U=;
 b=eF6OX9lCEXki6jdxXuwUdLn7njaSNXmI73p8/ozXJOCSC5/V4Nyaam8ncZwzV0OSXOiRXx2TuEzI5SjBxm+ujYIOEaIuFsPjFil2tW8TMKwFTQHj1A83nDdV/rnjhxsGgI1J5XGXfZjodXl0V42bhHLfHM5xubEcqCgvOuZsFX7g9smHLQhzI8XfjcXjq5udRZY01x6sDyIwopwRseIHdma8O/X5hCQekTwsfCUWzp6YUB1R3AKTlFNYG0aXfLwjQ8bFJkgdNUjC2YMArc5PRjTAoDPv5lBmFy89TDSSHjIMztxFv9V4ryi5bLtwKXiFVTGUI0WR6sAAZC5okZhDRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by IA4PR11MB9279.namprd11.prod.outlook.com (2603:10b6:208:561::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Fri, 27 Feb
 2026 08:03:47 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::804e:63d1:f2ce:7ce4]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::804e:63d1:f2ce:7ce4%6]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 08:03:46 +0000
Date: Fri, 27 Feb 2026 16:02:53 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: <phasta@kernel.org>
CC: Alex Deucher <alexander.deucher@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Kenneth Feng
 <kenneth.feng@amd.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Patrik Jakobsson
 <patrik.r.jakobsson@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Srinivasan
 Shanmugam" <srinivasan.shanmugam@amd.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Sunil Khatri <sunil.khatri@amd.com>, Lijo Lazar
 <lijo.lazar@amd.com>, Asad Kamal <asad.kamal@amd.com>, Yang Wang
 <kevinyang.wang@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>, Tao Zhou
 <tao.zhou1@amd.com>, Gangliang Xie <ganglxie@amd.com>, Candice Li
 <candice.li@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>, Matthew Auld
 <matthew.auld@intel.com>, Luben Tuikov <luben.tuikov@amd.com>, Ville
 =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/7] drm/scheduler: fix kernel-doc warning for
 drm_sched_job_done()
Message-ID: <aaFPrclndiWsW33h@X299>
References: <20260226030038.1182961-1-yujie.liu@intel.com>
 <20260226030038.1182961-3-yujie.liu@intel.com>
 <baa2d0b7c15687e153cac6d00c546a547feb2340.camel@mailbox.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <baa2d0b7c15687e153cac6d00c546a547feb2340.camel@mailbox.org>
X-ClientProxiedBy: KL1P15301CA0057.APCP153.PROD.OUTLOOK.COM
 (2603:1096:820:3d::19) To SA1PR11MB8393.namprd11.prod.outlook.com
 (2603:10b6:806:373::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8393:EE_|IA4PR11MB9279:EE_
X-MS-Office365-Filtering-Correlation-Id: d4b1dfa1-bf26-47a0-1efe-08de75d6bb99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: c7c+tCQPMWcTQYHUIPr3EmW2NtVx/aqd4wOQgUK+xfwHLQK0y2J1S6LOwW+P+i1W7lf/RLn8tE9QdNUvs12w2nDGCScM4unn6eHyOYXxCaR8uXf5gdmNoPPU0ew4X2D1JV+kfF0mquKMeYnnx9jwuFtTDP3MX8F1uC9I1tBsfVTYlQpOBFNQ0ckVkUunN2+Zewn6arYbcG53HxPDfpE0mEIb/ztNEUgN7fBviySumiVgLykL8CHgacaQ/tUGJTYJBMhWhw4ctDdmYTET0tepb7Yrzy0itXUxaWr7gSHcoVY2BvMS4gECYnzvl/ItjvuEgqBcTNhNnEWL3fetldiNEhyIbjPzv2E2XW5UM2O3bcA8l+VDprpthHRl5pQn2C58HiB+4SYsBdcjt3ePt8ZQ978wThNN6Bl4zy96oIn/pF+H0PquUlfYFXZcctIgEiPnLDxV7OrLTD1j6H2ZWyq2WTO5ayvG5LoV+K0d+D+YomGCSHvgSXGcHgVXy3+M4h7e5aoUKTHn8qR+DRGWqVgOBr4IPVz3ZJJWikJ2udo9wybVSBJ8Mbarf/fa+Q1hkeFMODcdAxEnq2aXUINdf9ykEqvTVwrx7BMd2F9U98rHeXRcKOYDJcWwg7lQFnmFk8TzQr6xZNPXfBHQgqWOXUfeSy1o54I3UCT7/mEPmCbkDCe9dFE5wMzqMayBUEXtZWQz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8393.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?735Qe0xfBNLVOrPyNf5MBIV9G1zK3tibA72wiCKLqT3Li5TlNxqBlxhCA0?=
 =?iso-8859-1?Q?frlU6RDUOxSZwVV/k1v5+iihUPen3BBGrhvhEOqof/yFfPRxbTPxaf96II?=
 =?iso-8859-1?Q?O1qdn2pCMppQzntyDaxhtcRMYjdhjkUXk+CnsOhF7hRma2yq414OMkz7Pm?=
 =?iso-8859-1?Q?ntjuk/Nx0VIj4iwx9P06E7ZDH/rJfDRZzhx/ChPMz5Mp8CtFh1XgfWOK7i?=
 =?iso-8859-1?Q?GjYQi+LoGOR9XEQRvDzY1VqmgT9mw5V2b1CX8j/wdIedROOB1ijvsR/y6Z?=
 =?iso-8859-1?Q?n3pBduKCijfDKPfikiW3vpLO7KtVRszFCarV9xX7SLpyv6I0gqakDLaCDQ?=
 =?iso-8859-1?Q?fmJAVXFqjchnKSfTZUih4SUFUBG93wbfV9jQo4y6idkhVXL/PsB99jkQqY?=
 =?iso-8859-1?Q?MwtfMfuiaIIwEvwQQ+bKzbk5wRG7uBtMpsmqpchNKqRFq9vbf2iwrP75kr?=
 =?iso-8859-1?Q?dUbiBTewHhsz/AOBNZMAyhp7nA+6p6TlrqwnafURRqY111i+JKfYrJi1l1?=
 =?iso-8859-1?Q?mlWDPY4Ape0pO7u+oejY6CEwXcIRfYhJVP9M/hqILkdRlF47Look+Cq3fF?=
 =?iso-8859-1?Q?rNOj+sO5TzjHy0M8eO8Ykpw1+F6U/b9SCmPDHJWQtnGiwgQJKnQuLrxxX8?=
 =?iso-8859-1?Q?e10XNKIwPOxCf4E7t8qBKqNEu07TBF0QSYDExZQEZQRoTRg5dKP9Q/8a59?=
 =?iso-8859-1?Q?4CKhAUer0pEPSl2kDvdGGxELA7wKyA8SP+WQyfcVFm8WPm19sXIIsWuqOo?=
 =?iso-8859-1?Q?5FXSyrY7tghgUaTPKqTGhcILTJkeAF4kV4jz/zGG05Uq/f/PyUY8Z4cho9?=
 =?iso-8859-1?Q?EJlzGFW4I/E/bJT5f9qkdfksP4JrbIsVpBdhjcw3sGQLL/3SFziip7lpwl?=
 =?iso-8859-1?Q?hmYWvZBm1FKKmVbIYEgVzk3APTVEo2ZfKAwDMJNCPgGdo6HrYuvVC8+uoF?=
 =?iso-8859-1?Q?urnn01vmjVI5h3XktTsDhM4xlfcJugaj5AnNPqTMwCXpMLab9dWzPgskAq?=
 =?iso-8859-1?Q?H8zDSE+lHfjzrBFdEqSTMA7QMq5sP6sL1aICEHyaDLZFhq0wDuq5vkM/mq?=
 =?iso-8859-1?Q?Mj5sIaNko8ZXaIwnLvDnCV1xvejBvn6pXxoJTbgUZGp5nJr8pAqeBUCjM+?=
 =?iso-8859-1?Q?SUfhexCb3zWiVPjlB9u9iqpL0ifJkZyEA3BaR2pK/t9HdfCAAWf8l/QC/F?=
 =?iso-8859-1?Q?0EJy2akaX+UwuK0eMGiEDpbQ8VhA5JJ7fqZ/VlCQeKv7l5YqPbgjyAyCCf?=
 =?iso-8859-1?Q?+PiGrqnFSFcZEOKucTtH3eb6UcVOeIJa2qIT0Hy1H3IQE9OxJIEZfgho+6?=
 =?iso-8859-1?Q?yIsixLiu1OtQBLpqcj+kSYUo9xY0OcMYlZjo1/EQofcfpX+F0tDukgaNdc?=
 =?iso-8859-1?Q?VmAY4RecRPnwF9eY9kNi4SeIXB4qJ0XNa++ylfkXcasbGHZLzI7yZ39PcX?=
 =?iso-8859-1?Q?1vq27c3S6Hx6CgJpKbIQntVti4osoU7DSvBRDyuMkUGDF/hObgIkpI4zRP?=
 =?iso-8859-1?Q?BYLvR8Hdox0DN4XGtJsyEjtHzAcVgdMm5NOKWSN1nYB/ySq6F9uvLp+2j2?=
 =?iso-8859-1?Q?KdRWCHC/b5vb+4gWvxuMU7fpaO40xM5MIcPNymnbWvbTZE57hHZP278Bxd?=
 =?iso-8859-1?Q?11+RdX8SrMeseq2XE8G1ZX8tjk8++uMTmF4TSpTbl0ZBommqy2hNhJovbt?=
 =?iso-8859-1?Q?WmnrwPDwo7hjocwtIieLDvp9AI0g6Z2TbH0KFUf906dwc8N3983Aj/pDQT?=
 =?iso-8859-1?Q?0nbOEnqvR1DjnNbS0efYL5kSbeGlrK8iubNbrEuT4lCa70t9mIbYXam0OG?=
 =?iso-8859-1?Q?sbeuyof0IA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4b1dfa1-bf26-47a0-1efe-08de75d6bb99
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 08:03:46.8074 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U4UMKWqmM+/vcnXEe3zVJ2TxWGibG5ImG0FddD4NthQ1/rt8KccdZ0jH5ranEMrfauux5ec34opPW7g7NzgkmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9279
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
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.975];
	FROM_NEQ_ENVFROM(0.00)[yujie.liu@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,igalia.com,lists.freedesktop.org,vger.kernel.org];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 7BAA81B4393
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 07:47:42AM +0100, Philipp Stanner wrote:
> On Thu, 2026-02-26 at 11:00 +0800, Yujie Liu wrote:
> > Warning: drivers/gpu/drm/scheduler/sched_main.c:367 function parameter 'result' not described in 'drm_sched_job_done'
> > 
> > Fixes: 539f9ee4b52a ("drm/scheduler: properly forward fence errors")
> > Signed-off-by: Yujie Liu <yujie.liu@intel.com>
> 
> Thanks for fixing this!
> 
> Acked-by: Philipp Stanner <phasta@kernel.org>

Hi Philipp,

Thanks for reviewing this.

Following Christian's suggestion to split this set into individual
patches for different subsystem branches, I've sent a v2 at [1] with
less audience. Sorry for bothering too many people on these minor
kernel-doc fixes.

[1] https://lore.kernel.org/all/20260227061052.1752354-1-yujie.liu@intel.com/

> 
> > ---
> >  drivers/gpu/drm/scheduler/sched_main.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index e6ee35406165..fe4c1017734b 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -361,6 +361,7 @@ static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
> >  /**
> >   * drm_sched_job_done - complete a job
> >   * @s_job: pointer to the job which is done
> > + * @result: 0 on success; -errno on failure
> 
> nit: shouldn't it be -ERRNO? But idk.

Thanks, indeed it should be capital letters. Will respin a v3 with you
CC'd.

> 
> >   *
> >   * Finish the job's fence and resubmit the work items.
> >   */
> 
