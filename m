Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJM6Adfgn2lLegQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 06:57:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8AC1A1296
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 06:57:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D4710E0F4;
	Thu, 26 Feb 2026 05:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KJqx9URA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2771B10E032;
 Thu, 26 Feb 2026 05:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772085457; x=1803621457;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AG4DLsUVjm5Ba/AFPdjuhsgh7WkFH+18h/QrXrUeYrg=;
 b=KJqx9URAE8Clh4G2QPn6NctNMKlxr5o9AC1echKKc2Dtt+TPvWJYxoNg
 n+mLT6IXtinpCJctz3C8+RbmUV+r6YXbepIKASdtFcFiba4d3j1pphdlP
 7B1IEd5cz+MJUVDg4fwny58aBZIsXwmGnPX1ouY7T4BqC4PptvFU3VWZw
 f288aRR4FOeTsrEuocza/0zQA0GHWW5gKB6TZSCG+TW2YA0jjZ98Tzrf4
 i59W/RcOxK3A+KbILq7M/J81AlXP10yeP5VJCmMZNEDZ5UQwIKf64Srwx
 hn7zJehtQLBZPuBnrvo38gPq7LYjq63LCXLDexxW8/JibQMQP1kt0S9t0 Q==;
X-CSE-ConnectionGUID: DWKk1ZxgTI2bj14PDACQxw==
X-CSE-MsgGUID: EMpv503WSoaq3HZP9spN6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73241370"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="73241370"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 21:57:37 -0800
X-CSE-ConnectionGUID: GqZ1BcCORnKuF78Y6860tQ==
X-CSE-MsgGUID: LlXu9ergQIWdb0hXbnk2Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="244098516"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 21:57:36 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Feb 2026 21:57:36 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Feb 2026 21:57:36 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.18) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 21:57:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y/di9tu64zzdreUEQHw+zh76RLzWxLVBplSAaAcXKNXP7M5FBEVgMbW4f9ISmI4YtqqGQMdKoejYSsqz/W0Qg+AMQulYbdPl2kkM5fRTaZ9cWcys/Wielli+5RaGHtNAbbQidaEHdKKbSCK4gUamX4ak8LrOwDe7ey4BJpEllGZCAomx6HNrMiyErZiyWYnGsuYsFLq5n33bizMYPbdmCDdZ8SabfVyTI+v6tOqKcOH8m0dwWNBaqxoeFbGCOWMYrZwgEDKOOXCt98DQXsXelazuakNDS/A50LfvLM4mT7d1izGfi4PJF72XgPm0AXGiFrfrS9OibDASs834yZF2Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=335XJj2QlKT/xKTFCoriOUBlbkYCmpiVq03n8pPP4ug=;
 b=x7S3f9JA+Ditr/YY7eeNV389+AXnG+P4U42/CJuZwgU+/ZQGrfdZYXA+mghq+ty4YMZroMJ55Q8/qyBkwhs24jlm4wV88MzwoY4E5L2BuyJg+AUDrxvKyumh3tob09MigVdPnA9lNHQGD01s1RvBEDhoMvO4ybhVQXZeXNMzEmJude0X1NWZbqDwSBf7dggzx/Zj2M6t2kk6yTrYpFQzz+hwu0KNM5YdX4HSXp6owTnJtvJla2i2qnapEfDq5IHCyjM4owjMc0VIjd32aQm2s0ni7Djexf/InFzc9sgEYze/E83GqZnLUTOepdxkhN/+DVgy8z27rtBa4iqqnrTaTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by CO1PR11MB5186.namprd11.prod.outlook.com (2603:10b6:303:9b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 05:57:34 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::804e:63d1:f2ce:7ce4]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::804e:63d1:f2ce:7ce4%6]) with mapi id 15.20.9654.007; Thu, 26 Feb 2026
 05:57:34 +0000
Date: Thu, 26 Feb 2026 13:56:30 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Alex Deucher <alexander.deucher@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Kenneth Feng
 <kenneth.feng@amd.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Patrik Jakobsson
 <patrik.r.jakobsson@gmail.com>, Danilo Krummrich <dakr@kernel.org>, "Philipp
 Stanner" <phasta@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
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
Subject: Re: [PATCH 1/7] drm/gpusvm: fix kernel-doc warning for
 drm_gpusvm_pages_valid_unlocked()
Message-ID: <aZ_gjpylcgG7PxPL@X299>
References: <20260226030038.1182961-1-yujie.liu@intel.com>
 <20260226030038.1182961-2-yujie.liu@intel.com>
 <aZ+4sZoTzX4C/P2T@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aZ+4sZoTzX4C/P2T@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: KUZPR04CA0004.apcprd04.prod.outlook.com
 (2603:1096:d10:32::6) To SA1PR11MB8393.namprd11.prod.outlook.com
 (2603:10b6:806:373::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8393:EE_|CO1PR11MB5186:EE_
X-MS-Office365-Filtering-Correlation-Id: a250cf06-362d-4f64-53cb-08de74fbef90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: gzbGz4GnSJT6JkOJtEzt9psiWkIUuGiQkzv5+rUTH/YU/I2DyOYb63fk6ihUBl28NFdtWD9bmGu0UZ+zW7RF/bJmAevILH4Hr/VHrQMTIyy0FIePGdco56PHwjSJFC4K3l71+zbVX7m/bpSq2kX2eEepxUTBAuGM0Gg//TEhHCQidlw2AQ9sY27CoE9KVccRYIKfFMX05qH5bh5R1IQMaUN9Jx6YFXWoc0hp1TR3FC4zyjQWnfKgj21XFUFTjCP6RGD5+MMcC6qkZg9XGQLLSUykuBuEZGBx2Ox633ei9vJfLMuYMjRzCzJSdAWrlVAVoG2rj1TQnYdva84DisyEhLMKXpoVEpSPQqKWI6zba8JxqRseUTxiY8YBQQE1AaKwLWFVcjNmY6uQ3k35jfuJr1+UByq1di9dqbXqHmMRl/+NIU8OBiZsN1RsEXA/Hmlyk02dQuWWzHngqCjLe3Y7edSSkDqXBgLIsqLVQepyc5R/2E0cI+4VPRrVbLnuD/pLLtKhFv4eHZmGogvRNVGVeuyF5yEUWjTXlTD/pENzJQ7htgqpL/8i7F+7ahSi9W1XCGsfKmkYht9xOrXyOX2Lbym2yPuRkEE4nXx6RV8J9euwqNGWLA4QMYo7MbjfL1f2lADA9Xc7iZ5LK6Mzes7qGr3+QCSOhpmdanm1hHdS8u7oqZx5ZNIw3RFz60JI02EDoyhCUCqWolq8RMJ86QPI41iGaiBbm3F7gU0/qSMVXG0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8393.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+QUcTZ9FJzhxZfaztWkMHRG5+NVAgVH9xNaEWdi4m0gA713olRslN5ePWyf0?=
 =?us-ascii?Q?/4mCy8NquYg3kO5ulRo/UyAEwKBCwjrxKkoBLge9Y/AtyVBvbkyP7HoloOLn?=
 =?us-ascii?Q?pnNWQ0mvC1vY3JlolPLqk+MTDwauYgTcmYVUgnaIC+iwIY4pXZQZ6eXxKCIF?=
 =?us-ascii?Q?qA02ICz78/3Q0UwKikhV8igKAQcJmCvtBzRUx+nSkFtlxN50G3lhCJlUNfdb?=
 =?us-ascii?Q?07VHfPVdOfnd3Fd6MGtr/bSYGKHzNz6sgJr3rSO5Ign8gyEVJw20NvBsVGlu?=
 =?us-ascii?Q?p/bnIqYDeUV3+XuxGTiy6mYckJz1/kQVpbrdF3ElugDH5oHXXE9Jg3VGrtMC?=
 =?us-ascii?Q?m0GEd9zXkRLy+GC9lhGEt1/en5NLFJ9mDfmaUZRhC+kdK3Z8QgnuK3GZUWxZ?=
 =?us-ascii?Q?iNXeCEU5K0/0jodNDUYz8WKvXkkictZOJit+MjdMm2QQXFN98wuH3hS4ewXJ?=
 =?us-ascii?Q?8zZSG5V0oxqMmvw0OG58zaUYMzp161vX4wz/+2gk+DQeXD21szk5l1mdT8ay?=
 =?us-ascii?Q?E92wEItRigYUeRFMar2AENWB/gvhGCZJlIMKqVKEX95u/jrNmqkBY2VvuPeF?=
 =?us-ascii?Q?HEpM0Y3GkMdFj+waBVItPrvdcNVl6c5fpnsqYexAkjLqJsF5Y4CY2D2q6uid?=
 =?us-ascii?Q?0l1HN2MrswsZNAizcw84WHndXeMg0nwAXBusMlBTxziVx1zyjizSBkMUrmey?=
 =?us-ascii?Q?ipwbqzqLnwY09AmJT10y71i9HtkSwaPbtgknoI5jSpcX5l1DZmtHEaqoijzC?=
 =?us-ascii?Q?XTnwVzVaXeFwQJxeKMSiDT1rinHQzg8P32opBpi3lcQnMWZpPe3PalTjzXgy?=
 =?us-ascii?Q?MnGP7JUC2R8SfOd+iyAuAUqA4S/8o26gxLvsJqQ1HKbqVY5RtmW582bWYQnJ?=
 =?us-ascii?Q?/JQxPYp2OFM/xTU0HUagh3P0vv1ryZq0SpNa6OOsTTXcXrrnhISwjkyl1KYX?=
 =?us-ascii?Q?3Dc9jpVIUcvS5B6RpxRu480yunM/ihd7o4OLxLAcge5my+ySVjs5gPui/Zlc?=
 =?us-ascii?Q?LzkI5u02XaMD6e3pOAGM0MZ/S9ADrxfuyN/pL5synLBhTHfbxNla+wkmu2mO?=
 =?us-ascii?Q?aN7ONE7un+Tj6aCXS1ToGRp0BvuGO0tNqVt7KOpcGz6SN82Rbb+r98h+DSyo?=
 =?us-ascii?Q?7Bwcn6x/DybBNC8SQxhT1oug22rp8Ozct5z2AI3S1h3fuSfsbPSQig/fKhJ+?=
 =?us-ascii?Q?ha87VGBlDZMDiCYdRzrGCCnObve64QwltWAIF57vH5WvMWiZun3RsCBrTUao?=
 =?us-ascii?Q?K342hg01mMomdSfzefOjp93hX0LtxIsELxqW+hDljaVhJPUa+a8HsbNTeBPx?=
 =?us-ascii?Q?rI3ei3YXjI8MdaGOwO/l26ilLSet24pG9iaDuhjjv8qmBpXXvD0GMg2qXxb6?=
 =?us-ascii?Q?R5n90Vr8iGaHEBTpBg2SPeLNO79+ZArZqXDVNNs97jDa785dbf9BPYk0hOxs?=
 =?us-ascii?Q?ukCyPJ8fIBSmNR1dGdekbFzVaH586Iy2c41nb7Q+3h5Ewo9bjE/Qr9lTKQEy?=
 =?us-ascii?Q?Hx2nRZ6Cam1lTxJFIQMOnVxonlOj5m1DYpi6OkoVmtjI/q6RLbU6QVBMqC/f?=
 =?us-ascii?Q?Yyo+Hjgm1eqfUM+vvOmF6IeyH1FcZLyRVzmBUxQOB5s+d0PQjXw3pH/WMBnJ?=
 =?us-ascii?Q?LjgGOEJ9PyxNp69iXwZ6kmpavSsp0gE4mYtPQv+DCQTz+QXe0QqEqGgYH/sz?=
 =?us-ascii?Q?02lHyxgmZ3rl47vphZwNhtbFX4thBMVHCfLVqRhIT+hPua2VgtmiH/oO4Sz+?=
 =?us-ascii?Q?tF2mFxSSzw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a250cf06-362d-4f64-53cb-08de74fbef90
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 05:57:33.9873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w6DX/J7Cf5BoImjoQRymGwXZqB9OH/lX1nVw8tu39u2mpzEaJvqpKN5pPae1OH0AVoTvAZWw9BD+UeTXN/4wpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5186
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	FROM_NEQ_ENVFROM(0.00)[yujie.liu@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,igalia.com,lists.freedesktop.org,vger.kernel.org];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 5D8AC1A1296
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 07:06:25PM -0800, Matthew Brost wrote:
> On Thu, Feb 26, 2026 at 11:00:32AM +0800, Yujie Liu wrote:
> > Warning: drivers/gpu/drm/drm_gpusvm.c:1351 function parameter 'svm_pages' not described in 'drm_gpusvm_pages_valid_unlocked'
> > Warning: drivers/gpu/drm/drm_gpusvm.c:1351 expecting prototype for drm_gpusvm_range_pages_valid_unlocked(). Prototype was for drm_gpusvm_pages_valid_unlocked() instead
> > 
> > Fixes: 6364afd532bc ("drm/gpusvm: refactor core API to use pages struct")
> 
> I fix this one already. Believe it merged yesterday.

Thanks. I will drop this patch and respin the series after waiting
briefly for possible comments on other patches.

Yujie

> 
> 74b6e83942dc drm/gpusvm: Fix drm_gpusvm_pages_valid_unlocked() kernel-doc
> 
> Matt
