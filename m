Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B63E9A55E4
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2024 20:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A4F310E0D9;
	Sun, 20 Oct 2024 18:39:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cGSD+gwk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D4910E06F;
 Sun, 20 Oct 2024 18:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729449558; x=1760985558;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LpA1BkjocngNyod+1u8E4Ty+vRKXGY/lIgZo3Kg9hPw=;
 b=cGSD+gwk896RxyHHXFxBobC9ULWRLb4ztpjZFu2eGJ4eYxoO4BL9c1xa
 T2I1RXLDdXXmeMmOuHbrCn/2HAWN4lMCX9qk6QM7X2GEQQXLltMaehDK1
 rmj22EK8MWZilHERdICdRawy2Wi4gh4NLDguiW7tOhEI8IU/B72QppsZP
 1VpI3QLFuDf28Yyoh3ipC6eDs2UEjG6JrTYwETGcCBJrqwAIac4z9uz/P
 anPFllD/F4NSc0M0jn05ZiH5qGhUOAd+ALrWq32FZ9wK0g9ZALVtHhL7x
 VO8tSwNXjp2KQkdZEA3JlAMFzFpmByXh7ThQMwfD5VcdMb8r3tzd+AKoO A==;
X-CSE-ConnectionGUID: tFb8uAVTSlKP91nMR1AFqA==
X-CSE-MsgGUID: g2EPtd7TSZaoNBMevxTxzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28878827"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28878827"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2024 11:39:18 -0700
X-CSE-ConnectionGUID: dAyK81uSRHmaYRmfmpctug==
X-CSE-MsgGUID: NibRgNUPQGO/Rz3nFTGmKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; d="scan'208";a="79257042"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Oct 2024 11:39:18 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 20 Oct 2024 11:39:17 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 20 Oct 2024 11:39:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 20 Oct 2024 11:39:16 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 20 Oct 2024 11:39:16 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 20 Oct 2024 11:39:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jQISitaAZ1rbxSUgmJ63U0vDMoqqqNhdMt/tbbSDr9IYRT7/poI1EQg/ayL8dfoOTBNGz4t3jPHQZkNlYJjkFiZr+LBIunwpxJAn3wMD/WrJjILjGJXdyVNXfVKi6I4WurHg9xo56ku+W5Skesc6n8IE/eE7JtwF2k21hfnQ08RaqDpDkmJQqiQDPCDOGrI3gJ8RmSL3V0Bkh5mWBYXIEU1rM286DqQmDBb/a4XZPZsWkTPpNulOM3BUEMWA8ZwOgOV25PntLO6S3ZbOYzIpud6JVbG1o+ibZ0Aut+eqq7qwzcStSVlzKnVnaQ+XLw/qo8/hE3HWYNEoPkfw5w1Eiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FaM3TosRnyqE78W+nIvlKOBMRcN7RK9xQmW5ji6XFjE=;
 b=AFIyuekaeO8anZ6SOv3S+1muSXrNyl+G7aRYlb557jPPxhmaA3yvpjhsCeXozbk7ygJbVCznQNw8z9r/TJOWsxGeMybQ2mjjNeZ2dposxF4pyMIPPv5vyLalyMMIlHDuw9yK/CPYdWsVshpg7vJO/esRxq/1Sy/2op3yJ0LT/5xfUAeTbGxTmNMoEVKK9WZjwQyGtHH+BU+xGw+1TFbkz7dMKX32RtREEYDn/C8wJbItpvmBYJpyVUPxOiU7WR2yATBWIXRyRqCwkNyxkHJvKfsWTZ3Xv18hBxR6oZd5UAzkgtSya9EKhbP/MjJ0FPxb8tyenjgsXETkYL81MSDEeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4646.namprd11.prod.outlook.com (2603:10b6:208:264::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Sun, 20 Oct
 2024 18:39:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8069.024; Sun, 20 Oct 2024
 18:39:09 +0000
Date: Sun, 20 Oct 2024 18:38:10 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, <dri-devel@lists.freedesktop.org>, "Paulo
 Zanoni" <paulo.r.zanoni@intel.com>, Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v11 3/8] drm/ttm/pool: Provide a helper to shrink pages
Message-ID: <ZxVOEu3p93t4GocY@DUT025-TGLU.fm.intel.com>
References: <20241016085559.11840-1-thomas.hellstrom@linux.intel.com>
 <20241016085559.11840-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241016085559.11840-4-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BY5PR16CA0005.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4646:EE_
X-MS-Office365-Filtering-Correlation-Id: 07229bd5-fc90-414c-1eb0-08dcf1367c23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?h7KsBYR9YGpnakyh5swq6UjtzhMbCW3tWJGmjPlwlWHBJpgiGi+ubMNlnK?=
 =?iso-8859-1?Q?fUv+PJ2qRfodL8O8sTaJc7HEKz1igPJzmHkqLXzodhrpvSpq32FBJLRdin?=
 =?iso-8859-1?Q?uwdYVw5mGsSM2xn4oVrhIy8bXhlAEFwDUIkJPkh+k3QCsDWpYuqpr6qqOZ?=
 =?iso-8859-1?Q?7Py+OPe9vy9tZEl8RYo4A6HKi6zO/pwFKJmnHf3d0L8WVpAnS8iph5izgU?=
 =?iso-8859-1?Q?cLlyNHClTyud02cip+mLk3gOKcUAszio/b2Y5f3GSu5aLZpOqOVcslhX+L?=
 =?iso-8859-1?Q?AxmPvXynf++HbPqj4fwqSsaSTjeHKTCF1jN0KaCuAOmTN9rsKhVBuM/DOP?=
 =?iso-8859-1?Q?4u3v0vs4X7gu3BY3ESEbwXCd3CFuX1dzN7rqoNZr2MQFTC/WF6LDURbzqN?=
 =?iso-8859-1?Q?2nByLRlnnyG0YVWn7jVm/1EyuOwnWtGjNWpBPFLwvlh4oQQxJi3dbuF1Pq?=
 =?iso-8859-1?Q?VPVJ70B6eX+siIyV/7KknLKAPxL5IaMcBv8TGK3/UvZ4Fc7rLyUtZa4Fwl?=
 =?iso-8859-1?Q?LJMv4vY8dmD2aBCP180o6dikIsK0EYkbBNjey1k4XTC5fhUm2fgoUp1I+2?=
 =?iso-8859-1?Q?JnluQKQv1NX+mIHHzNnd1qQH2Zk519ahGH99TbK0utMmuuqqA7AzaRaeE8?=
 =?iso-8859-1?Q?M1HZm2RrU8nJvW8WLYnpI1OzAG1EIJry5Mgj7M04BGokg6wZt2kEGOTYxu?=
 =?iso-8859-1?Q?FAyCCE5HDFZaNekkU+HxuTq+EhloI31ef7kQQmGbER8daJAJHqGmN3G0JZ?=
 =?iso-8859-1?Q?He968OCU0YXlSg9XoPEsTMCzxjfUkOCGB96gBKd/LXeeGTWKCcidwSZaaT?=
 =?iso-8859-1?Q?bb/hzyTeEX9xPG7eluKz8Aw/PkylwHZW8jb4nDp29IdbLILUxRqYapsaK4?=
 =?iso-8859-1?Q?wAPUkqryHOQK+wLt0bzppNNEigZ34g41DIFV5Cq/oIs0dhyQO0IH3koJP7?=
 =?iso-8859-1?Q?CRRJX0KHD771rL+iW1wH+aih0wIlAApsJBXLzAJIJ/sIuqV9/qdHdm9DvD?=
 =?iso-8859-1?Q?nh8MRUes79NUjtk+pDye/SwShdx5zV4YahsOkHP3lqiBM/8AlF4Oy2h8gf?=
 =?iso-8859-1?Q?nfsmVcdD/OsD2YAYE6eS5ysw4sO+BpG4+b1AcWzzdJgc/JB1zUhbQ7IOcx?=
 =?iso-8859-1?Q?50GIKEnrZObuzEgv+If5GDbAfd17GW5nRyaC9GQxcaedtvEuJb+nXvc0B9?=
 =?iso-8859-1?Q?o1W4SjPJguoWAtoPXsxDLLxZ39a8KY8F1Ny9z8Wj8R7zSKQ5KrsJigH+Bl?=
 =?iso-8859-1?Q?ZutIkffnDxhYlZY3jP0DaeMHMJcmYzkQD9rAjVWbqpMmH9dL0DoMsxRoXM?=
 =?iso-8859-1?Q?HWxgSm17rpZIoy9GY68ua9D+L/Uu1ROsq0bxVEymLwr5LbqUg0fwH53dgR?=
 =?iso-8859-1?Q?PdrK0V+PT6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Okx7Z8mO3+hRn3Apyq86HNpUzvNXo/JRC9ZF6UbvDLt3iJZusK3/73U5Ig?=
 =?iso-8859-1?Q?FBwkTGb73n/8NZE1Ylh6XzthJLCVI/F8kdt1Qt1jUvSdcBQKc5CEXkdU4E?=
 =?iso-8859-1?Q?YDPO88wKKNUtMq7ZJ6QZiutpufDzqSRNqayDdI35mWhr9V6Smyad1Ti3Q4?=
 =?iso-8859-1?Q?xlOH30yAb7tmvdxKrycv3kSuCR+W4glA3Zaqgj5Ynj/MRwYgrNX4v9/Oi1?=
 =?iso-8859-1?Q?xAGVaX4Dz8l6Qmk0XDg3eHoK3WvZNUm4gVzGKZf+O9weX1Bv6MMCSiK16X?=
 =?iso-8859-1?Q?4XmdHVxIaeaA13iIH+2lD/irwWsHrN7mdU2wFfwr8w+7s0WLIUl1yU3DZw?=
 =?iso-8859-1?Q?9gyTnVwkL8Vy37qwk7yuPL6Z5WmFecLnLtzuZceES1rueiH/ecK75r6xy+?=
 =?iso-8859-1?Q?oFd90jh9x7aTX4INLMMPgq5MC2HhAloNYfv3GYv5MTL7aC3ohgkDopZXIU?=
 =?iso-8859-1?Q?vEfm5MpE0TGmatltnIzqZZ0tEXewjkqYk3oXHgg+968qB3vxsBXj3vdMRU?=
 =?iso-8859-1?Q?jVllx88qBdtzq9nru3aCA1hoMTmjkqO2G4e4ilG8oV9JvvxAgVUgmOCOC0?=
 =?iso-8859-1?Q?Dt74Se9zpQKSJcoCaOWGoyM3HG0bPV6z57LDypZ46MYzB1ZpqkXBdCszjd?=
 =?iso-8859-1?Q?wS8iozEXCjPmPvpV6DP5PTtMOn7t/Rzr/228DHyqCqm9OAD7YTsCvK8s15?=
 =?iso-8859-1?Q?1PT1p5dINGZylBS20Z00mWKe2j1V3b7gy2eKm4SFrmhHf+lOnlhuVjCRVi?=
 =?iso-8859-1?Q?yRuK8hVYc/k5Sq4eQ5OveWSjbXvPkYJarN844qp4MwR3+hQvWK6LptmCgc?=
 =?iso-8859-1?Q?ruTbQpx/36+A7sufTw4yc+QRnYBQxtKBUyytZV0+o6AZtl/wYsh6/h2xnC?=
 =?iso-8859-1?Q?clwXP4DcDB2iW4+iYlrP70Tnr4+UZOYpBFmGVexLIJ5TaHSpua1c/aTyQy?=
 =?iso-8859-1?Q?ELUCVlDnHMEX4Dx6NPyJqNYbXeePtnrmOwVnBSY08KzC8qDkziG4Ur0172?=
 =?iso-8859-1?Q?wg2I8mlZ/PCiP5xVRyqNWoUXQEhBUrrZkBVoZt9dBhKZOaF/zSwZnr+BBp?=
 =?iso-8859-1?Q?WaWi6ON6Yr+H1IVMyivoS47C0n95rDPt7jzycZIezNfVaW+bh5H5NgqGLe?=
 =?iso-8859-1?Q?5weB0UuniB0Gsy92yDurhrCBcW1Rr2zkqV5EszDcTsRgqPiRsLfAjMNTfw?=
 =?iso-8859-1?Q?0tgP/S+PUjZpZDn38LLp4y2Z2MyxVnq6iB8snBsM/Y18v6Q7fKhfXHh9GB?=
 =?iso-8859-1?Q?JsSi4zzdOtDzanVXZ67FrIFzdTdQzdiPe94fHTBuMNhDNns/IynlgVPx0/?=
 =?iso-8859-1?Q?L/ivSWErp28PA9oo/cnVMre8BebzsTf+JYTjpC8o6K42jQgdDaKEuBXtXd?=
 =?iso-8859-1?Q?5LVOKFySQFMAUkH11Hvr9fqdseLSPTYsfUnFYpi3lfvjEMqEnSmfy512jf?=
 =?iso-8859-1?Q?sHUnhoqqyF1H9Tox8bwloO82eAJgXky0q758e/5BB6yi+M0QzsbcW1PfLL?=
 =?iso-8859-1?Q?SoTBOn+wfKRS8Wft6Gzp1LAlQfkAYdo1+ZMgWLiwBxKJt8z2vpBHFOw5XX?=
 =?iso-8859-1?Q?dkoCyM1ddI4QsH8AoCrNUJ8cX74F479ZugwbQHLXR8HNjV3F0Z25E7ZFT1?=
 =?iso-8859-1?Q?x5kueU6BZDjMHHD5z9WwRCr88eslNaU/5BmzttwZFHo/PIvCgLgemjng?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 07229bd5-fc90-414c-1eb0-08dcf1367c23
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2024 18:39:09.4580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JiYD5j/W/Z7emnL84DEE/tqhYbkrDF9zHQymGRCBkQpGya9s5k1IQBjjUw24+CSlYO5LsT8nzCsuFIBGL4jndA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4646
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

On Wed, Oct 16, 2024 at 10:55:54AM +0200, Thomas Hellström wrote:
> Provide a helper to shrink ttm_tt page-vectors on a per-page
> basis. A ttm_backup backend could then in theory get away with
> allocating a single temporary page for each struct ttm_tt.
> 
> This is accomplished by splitting larger pages before trying to
> back them up.
> 
> In the future we could allow ttm_backup to handle backing up
> large pages as well, but currently there's no benefit in
> doing that, since the shmem backup backend would have to
> split those anyway to avoid allocating too much temporary
> memory, and if the backend instead inserts pages into the
> swap-cache, those are split on reclaim by the core.
> 
> Due to potential backup- and recover errors, allow partially swapped
> out struct ttm_tt's, although mark them as swapped out stopping them
> from being swapped out a second time. More details in the ttm_pool.c
> DOC section.
> 
> v2:
> - A couple of cleanups and error fixes in ttm_pool_back_up_tt.
> - s/back_up/backup/
> - Add a writeback parameter to the exported interface.
> v8:
> - Use a struct for flags for readability (Matt Brost)
> - Address misc other review comments (Matt Brost)
> v9:
> - Update the kerneldoc for the ttm_tt::backup field.
> v10:
> - Rebase.
> 
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/ttm/ttm_pool.c | 394 +++++++++++++++++++++++++++++++--
>  drivers/gpu/drm/ttm/ttm_tt.c   |  37 ++++
>  include/drm/ttm/ttm_pool.h     |   6 +
>  include/drm/ttm/ttm_tt.h       |  30 +++
>  4 files changed, 454 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index 8504dbe19c1a..0d224cd9f8eb 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -41,6 +41,7 @@
>  #include <asm/set_memory.h>
>  #endif
>  
> +#include <drm/ttm/ttm_backup.h>
>  #include <drm/ttm/ttm_pool.h>
>  #include <drm/ttm/ttm_tt.h>
>  #include <drm/ttm/ttm_bo.h>
> @@ -58,6 +59,32 @@ struct ttm_pool_dma {
>  	unsigned long vaddr;
>  };
>  
> +/**
> + * struct ttm_pool_tt_restore - State representing restore from backup
> + * @alloced_pages: Total number of already allocated pages for the ttm_tt.
> + * @restored_pages: Number of (sub) pages restored from swap for this
> + *		     chunk of 1 << @order pages.
> + * @first_page: The ttm page ptr representing for @old_pages[0].
> + * @caching_divide: Page pointer where subsequent pages are cached.
> + * @old_pages: Backup copy of page pointers that were replaced by the new
> + *	       page allocation.
> + * @pool: The pool used for page allocation while restoring.
> + * @order: The order of the last page allocated while restoring.
> + *
> + * Recovery from backup might fail when we've recovered less than the
> + * full ttm_tt. In order not to loose any data (yet), keep information
> + * around that allows us to restart a failed ttm backup recovery.
> + */
> +struct ttm_pool_tt_restore {
> +	pgoff_t alloced_pages;
> +	pgoff_t restored_pages;
> +	struct page **first_page;
> +	struct page **caching_divide;
> +	struct ttm_pool *pool;
> +	unsigned int order;
> +	struct page *old_pages[];
> +};
> +
>  static unsigned long page_pool_size;
>  
>  MODULE_PARM_DESC(page_pool_size, "Number of pages in the WC/UC/DMA pool");
> @@ -354,11 +381,102 @@ static unsigned int ttm_pool_page_order(struct ttm_pool *pool, struct page *p)
>  	return p->private;
>  }
>  
> +/*
> + * To be able to insert single pages into backup directly,
> + * we need to split multi-order page allocations and make them look
> + * like single-page allocations.
> + */
> +static void ttm_pool_split_for_swap(struct ttm_pool *pool, struct page *p)
> +{
> +	unsigned int order = ttm_pool_page_order(pool, p);
> +	pgoff_t nr;
> +
> +	if (!order)
> +		return;
> +
> +	split_page(p, order);
> +	nr = 1UL << order;
> +	while (nr--)
> +		(p++)->private = 0;
> +}
> +
> +/**
> + * DOC: Partial backup and restoration of a struct ttm_tt.
> + *
> + * Swapout using ttm_backup::ops::backup_page() and swapin using
> + * ttm_backup::ops::copy_backed_up_page() may fail.
> + * The former most likely due to lack of swap-space or memory, the latter due
> + * to lack of memory or because of signal interruption during waits.
> + *
> + * Backupfailure is easily handled by using a ttm_tt pages vector that holds
> + * both swap entries and page pointers. This has to be taken into account when
> + * restoring such a ttm_tt from backup, and when freeing it while backed up.
> + * When restoring, for simplicity, new pages are actually allocated from the
> + * pool and the contents of any old pages are copied in and then the old pages
> + * are released.
> + *
> + * For restoration failures, the struct ttm_pool_tt_restore holds sufficient state
> + * to be able to resume an interrupted restore, and that structure is freed once
> + * the restoration is complete. If the struct ttm_tt is destroyed while there
> + * is a valid struct ttm_pool_tt_restore attached, that is also properly taken
> + * care of.
> + */
> +
> +static bool ttm_pool_restore_valid(const struct ttm_pool_tt_restore *restore)
> +{
> +	return restore && restore->restored_pages < (1 << restore->order);
> +}
> +
> +static int ttm_pool_restore_tt(struct ttm_pool_tt_restore *restore,
> +			       struct ttm_backup *backup,
> +			       struct ttm_operation_ctx *ctx)
> +{
> +	unsigned int i, nr = 1 << restore->order;
> +	int ret = 0;
> +
> +	if (!ttm_pool_restore_valid(restore))
> +		return 0;
> +
> +	for (i = restore->restored_pages; i < nr; ++i) {
> +		struct page *p = restore->old_pages[i];
> +
> +		if (ttm_backup_page_ptr_is_handle(p)) {
> +			unsigned long handle = ttm_backup_page_ptr_to_handle(p);
> +
> +			if (handle == 0)
> +				continue;
> +
> +			ret = backup->ops->copy_backed_up_page
> +				(backup, restore->first_page[i],
> +				 handle, ctx->interruptible);
> +			if (ret)
> +				break;
> +
> +			backup->ops->drop(backup, handle);
> +		} else if (p) {
> +			/*
> +			 * We could probably avoid splitting the old page
> +			 * using clever logic, but ATM we don't care.
> +			 */
> +			ttm_pool_split_for_swap(restore->pool, p);
> +			copy_highpage(restore->first_page[i], p);
> +			__free_pages(p, 0);
> +		}
> +
> +		restore->restored_pages++;
> +		restore->old_pages[i] = NULL;
> +		cond_resched();
> +	}
> +
> +	return ret;
> +}
> +
>  /* Called when we got a page, either from a pool or newly allocated */
>  static int ttm_pool_page_allocated(struct ttm_pool *pool, unsigned int order,
>  				   struct page *p, dma_addr_t **dma_addr,
>  				   unsigned long *num_pages,
> -				   struct page ***pages)
> +				   struct page ***pages,
> +				   struct ttm_pool_tt_restore *restore)
>  {
>  	unsigned int i;
>  	int r;
> @@ -369,6 +487,16 @@ static int ttm_pool_page_allocated(struct ttm_pool *pool, unsigned int order,
>  			return r;
>  	}
>  
> +	if (restore) {
> +		memcpy(restore->old_pages, *pages,
> +		       (1 << order) * sizeof(*restore->old_pages));
> +		memset(*pages, 0, (1 << order) * sizeof(**pages));
> +		restore->order = order;
> +		restore->restored_pages = 0;
> +		restore->first_page = *pages;
> +		restore->alloced_pages += 1UL << order;
> +	}
> +
>  	*num_pages -= 1 << order;
>  	for (i = 1 << order; i; --i, ++(*pages), ++p)
>  		**pages = p;
> @@ -394,22 +522,39 @@ static void ttm_pool_free_range(struct ttm_pool *pool, struct ttm_tt *tt,
>  				pgoff_t start_page, pgoff_t end_page)
>  {
>  	struct page **pages = &tt->pages[start_page];
> +	struct ttm_backup *backup = tt->backup;
>  	unsigned int order;
>  	pgoff_t i, nr;
>  
>  	for (i = start_page; i < end_page; i += nr, pages += nr) {
>  		struct ttm_pool_type *pt = NULL;
> +		struct page *p = *pages;
> +
> +		if (ttm_backup_page_ptr_is_handle(p)) {
> +			unsigned long handle = ttm_backup_page_ptr_to_handle(p);
> +
> +			nr = 1;
> +			if (handle != 0)
> +				backup->ops->drop(backup, handle);
> +			continue;
> +		}
> +
> +		if (pool) {
> +			order = ttm_pool_page_order(pool, p);
> +			nr = (1UL << order);
> +			if (tt->dma_address)
> +				ttm_pool_unmap(pool, tt->dma_address[i], nr);
>  
> -		order = ttm_pool_page_order(pool, *pages);
> -		nr = (1UL << order);
> -		if (tt->dma_address)
> -			ttm_pool_unmap(pool, tt->dma_address[i], nr);
> +			pt = ttm_pool_select_type(pool, caching, order);
> +		} else {
> +			order = p->private;
> +			nr = (1UL << order);
> +		}
>  
> -		pt = ttm_pool_select_type(pool, caching, order);
>  		if (pt)
> -			ttm_pool_type_give(pt, *pages);
> +			ttm_pool_type_give(pt, p);
>  		else
> -			ttm_pool_free_page(pool, caching, order, *pages);
> +			ttm_pool_free_page(pool, caching, order, p);
>  	}
>  }
>  
> @@ -453,9 +598,36 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>  	else
>  		gfp_flags |= GFP_HIGHUSER;
>  
> -	for (order = min_t(unsigned int, MAX_PAGE_ORDER, __fls(num_pages));
> -	     num_pages;
> -	     order = min_t(unsigned int, order, __fls(num_pages))) {
> +	order = min_t(unsigned int, MAX_PAGE_ORDER, __fls(num_pages));
> +
> +	if (tt->page_flags & TTM_TT_FLAG_PRIV_BACKED_UP) {
> +		if (!tt->restore) {
> +			gfp_t gfp = GFP_KERNEL | __GFP_NOWARN;
> +
> +			if (ctx->gfp_retry_mayfail)
> +				gfp |= __GFP_RETRY_MAYFAIL;
> +
> +			tt->restore =
> +				kvzalloc(struct_size(tt->restore, old_pages,
> +						     (size_t)1 << order), gfp);
> +			if (!tt->restore)
> +				return -ENOMEM;
> +		} else if (ttm_pool_restore_valid(tt->restore)) {
> +			struct ttm_pool_tt_restore *restore = tt->restore;
> +
> +			num_pages -= restore->alloced_pages;
> +			order = min_t(unsigned int, order, __fls(num_pages));
> +			pages += restore->alloced_pages;
> +			r = ttm_pool_restore_tt(restore, tt->backup, ctx);
> +			if (r)
> +				return r;
> +			caching = restore->caching_divide;
> +		}
> +
> +		tt->restore->pool = pool;
> +	}
> +
> +	for (; num_pages; order = min_t(unsigned int, order, __fls(num_pages))) {
>  		struct ttm_pool_type *pt;
>  
>  		page_caching = tt->caching;
> @@ -472,11 +644,19 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>  				r = ttm_pool_page_allocated(pool, order, p,
>  							    &dma_addr,
>  							    &num_pages,
> -							    &pages);
> +							    &pages,
> +							    tt->restore);
>  				if (r)
>  					goto error_free_page;
>  
>  				caching = pages;
> +				if (ttm_pool_restore_valid(tt->restore)) {
> +					r = ttm_pool_restore_tt(tt->restore, tt->backup,
> +								ctx);
> +					if (r)
> +						goto error_free_all;
> +				}
> +
>  				if (num_pages < (1 << order))
>  					break;
>  
> @@ -496,9 +676,17 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>  				caching = pages;
>  			}
>  			r = ttm_pool_page_allocated(pool, order, p, &dma_addr,
> -						    &num_pages, &pages);
> +						    &num_pages, &pages,
> +						    tt->restore);
>  			if (r)
>  				goto error_free_page;
> +
> +			if (ttm_pool_restore_valid(tt->restore)) {
> +				r = ttm_pool_restore_tt(tt->restore, tt->backup, ctx);
> +				if (r)
> +					goto error_free_all;
> +			}
> +
>  			if (PageHighMem(p))
>  				caching = pages;
>  		}
> @@ -517,12 +705,26 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>  	if (r)
>  		goto error_free_all;
>  
> +	if (tt->restore) {
> +		kvfree(tt->restore);
> +		tt->restore = NULL;
> +	}
> +
> +	if (tt->page_flags & TTM_TT_FLAG_PRIV_BACKED_UP)
> +		tt->page_flags &= ~(TTM_TT_FLAG_PRIV_BACKED_UP |
> +				    TTM_TT_FLAG_SWAPPED);
> +
>  	return 0;
>  
>  error_free_page:
>  	ttm_pool_free_page(pool, page_caching, order, p);
>  
>  error_free_all:
> +	if (tt->page_flags & TTM_TT_FLAG_PRIV_BACKED_UP) {
> +		tt->restore->caching_divide = caching;
> +		return r;
> +	}
> +
>  	num_pages = tt->num_pages - num_pages;
>  	caching_divide = caching - tt->pages;
>  	ttm_pool_free_range(pool, tt, tt->caching, 0, caching_divide);
> @@ -549,6 +751,172 @@ void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt)
>  }
>  EXPORT_SYMBOL(ttm_pool_free);
>  
> +/**
> + * ttm_pool_release_backed_up() - Release content of a swapped-out struct ttm_tt
> + * @tt: The struct ttm_tt.
> + *
> + * Release handles with associated content or any remaining pages of
> + * a backed-up struct ttm_tt.
> + */
> +void ttm_pool_release_backed_up(struct ttm_tt *tt)
> +{
> +	struct ttm_backup *backup = tt->backup;
> +	struct ttm_pool_tt_restore *restore;
> +	pgoff_t i, start_page = 0;
> +	unsigned long handle;
> +
> +	if (!(tt->page_flags & TTM_TT_FLAG_PRIV_BACKED_UP))
> +		return;
> +
> +	restore = tt->restore;
> +
> +	if (ttm_pool_restore_valid(restore)) {
> +		pgoff_t nr = 1UL << restore->order;
> +
> +		for (i = restore->restored_pages; i < nr; ++i) {
> +			struct page *p = restore->old_pages[i];
> +
> +			if (ttm_backup_page_ptr_is_handle(p)) {
> +				handle = ttm_backup_page_ptr_to_handle(p);
> +				if (handle == 0)
> +					continue;
> +
> +				backup->ops->drop(backup, handle);
> +			} else if (p) {
> +				ttm_pool_split_for_swap(restore->pool, p);
> +				__free_pages(p, 0);
> +			}
> +		}
> +	}
> +
> +	if (restore) {
> +		pgoff_t mid = restore->caching_divide - tt->pages;
> +
> +		start_page = restore->alloced_pages;
> +		/* Pages that might be dma-mapped and non-cached */
> +		ttm_pool_free_range(restore->pool, tt, tt->caching,
> +				    0, mid);
> +		/* Pages that might be dma-mapped but cached */
> +		ttm_pool_free_range(restore->pool, tt, ttm_cached,
> +				    mid, restore->alloced_pages);
> +	}
> +
> +	/* Shrunken pages. Cached and not dma-mapped. */
> +	ttm_pool_free_range(NULL, tt, ttm_cached, start_page, tt->num_pages);
> +
> +	if (restore) {
> +		kvfree(restore);
> +		tt->restore = NULL;
> +	}
> +
> +	tt->page_flags &= ~(TTM_TT_FLAG_PRIV_BACKED_UP | TTM_TT_FLAG_SWAPPED);
> +}
> +
> +/**
> + * ttm_pool_backup_tt() - Back up or purge a struct ttm_tt
> + * @pool: The pool used when allocating the struct ttm_tt.
> + * @ttm: The struct ttm_tt.
> + * @flags: Flags to govern the backup behaviour.
> + *
> + * Back up or purge a struct ttm_tt. If @purge is true, then
> + * all pages will be freed directly to the system rather than to the pool
> + * they were allocated from, making the function behave similarly to
> + * ttm_pool_free(). If @purge is false the pages will be backed up instead,
> + * exchanged for handles.
> + * A subsequent call to ttm_pool_alloc() will then read back the content and
> + * a subsequent call to ttm_pool_release_shrunken() will drop it.
> + * If backup of a page fails for whatever reason, @ttm will still be
> + * partially backed up, retaining those pages for which backup fails.
> + *
> + * Return: Number of pages actually backed up or freed, or negative
> + * error code on error.
> + */
> +long ttm_pool_backup_tt(struct ttm_pool *pool, struct ttm_tt *ttm,
> +			const struct ttm_backup_flags *flags)
> +{
> +	struct ttm_backup *backup = ttm->backup;
> +	struct page *page;
> +	unsigned long handle;
> +	gfp_t alloc_gfp;
> +	gfp_t gfp;
> +	int ret = 0;
> +	pgoff_t shrunken = 0;
> +	pgoff_t i, num_pages;
> +
> +	if ((!get_nr_swap_pages() && !flags->purge) ||
> +	    pool->use_dma_alloc ||
> +	    (ttm->page_flags & TTM_TT_FLAG_PRIV_BACKED_UP))
> +		return -EBUSY;
> +
> +#ifdef CONFIG_X86
> +	/* Anything returned to the system needs to be cached. */
> +	if (ttm->caching != ttm_cached)
> +		set_pages_array_wb(ttm->pages, ttm->num_pages);
> +#endif
> +
> +	if (ttm->dma_address || flags->purge) {
> +		for (i = 0; i < ttm->num_pages; i += num_pages) {
> +			unsigned int order;
> +
> +			page = ttm->pages[i];
> +			if (unlikely(!page)) {
> +				num_pages = 1;
> +				continue;
> +			}
> +
> +			order = ttm_pool_page_order(pool, page);
> +			num_pages = 1UL << order;
> +			if (ttm->dma_address)
> +				ttm_pool_unmap(pool, ttm->dma_address[i],
> +					       num_pages);
> +			if (flags->purge) {
> +				shrunken += num_pages;
> +				page->private = 0;
> +				__free_pages(page, order);
> +				memset(ttm->pages + i, 0,
> +				       num_pages * sizeof(*ttm->pages));
> +			}
> +		}
> +	}
> +
> +	if (flags->purge)
> +		return shrunken;
> +
> +	if (pool->use_dma32)
> +		gfp = GFP_DMA32;
> +	else
> +		gfp = GFP_HIGHUSER;
> +
> +	alloc_gfp = GFP_KERNEL | __GFP_HIGH | __GFP_NOWARN | __GFP_RETRY_MAYFAIL;
> +
> +	for (i = 0; i < ttm->num_pages; ++i) {
> +		page = ttm->pages[i];
> +		if (unlikely(!page))
> +			continue;
> +
> +		ttm_pool_split_for_swap(pool, page);
> +
> +		handle = backup->ops->backup_page(backup, page, flags->writeback, i,
> +						  gfp, alloc_gfp);
> +		if (handle) {
> +			ttm->pages[i] = ttm_backup_handle_to_page_ptr(handle);
> +			put_page(page);
> +			shrunken++;
> +		} else {
> +			/* We allow partially shrunken tts */
> +			ret = -ENOMEM;
> +			break;
> +		}
> +		cond_resched();
> +	}
> +
> +	if (shrunken)
> +		ttm->page_flags |= (TTM_TT_FLAG_PRIV_BACKED_UP |
> +				    TTM_TT_FLAG_SWAPPED);
> +
> +	return shrunken ? shrunken : ret;
> +}
> +
>  /**
>   * ttm_pool_init - Initialize a pool
>   *
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 3baf215eca23..9322fa5f1973 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -40,6 +40,7 @@
>  #include <drm/drm_cache.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_util.h>
> +#include <drm/ttm/ttm_backup.h>
>  #include <drm/ttm/ttm_bo.h>
>  #include <drm/ttm/ttm_tt.h>
>  
> @@ -158,6 +159,8 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
>  	ttm->swap_storage = NULL;
>  	ttm->sg = bo->sg;
>  	ttm->caching = caching;
> +	ttm->restore = NULL;
> +	ttm->backup = NULL;
>  }
>  
>  int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
> @@ -182,6 +185,12 @@ void ttm_tt_fini(struct ttm_tt *ttm)
>  		fput(ttm->swap_storage);
>  	ttm->swap_storage = NULL;
>  
> +	ttm_pool_release_backed_up(ttm);
> +	if (ttm->backup) {
> +		ttm->backup->ops->fini(ttm->backup);
> +		ttm->backup = NULL;
> +	}
> +
>  	if (ttm->pages)
>  		kvfree(ttm->pages);
>  	else
> @@ -253,6 +262,34 @@ int ttm_tt_swapin(struct ttm_tt *ttm)
>  }
>  EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_tt_swapin);
>  
> +/**
> + * ttm_tt_backup() - Helper to back up a struct ttm_tt.
> + * @bdev: The TTM device.
> + * @tt: The struct ttm_tt.
> + * @flags: Flags that govern the backup behaviour.
> + *
> + * Update the page accounting and call ttm_pool_shrink_tt to free pages
> + * or back them up.
> + *
> + * Return: Number of pages freed or swapped out, or negative error code on
> + * error.
> + */
> +long ttm_tt_backup(struct ttm_device *bdev, struct ttm_tt *tt,
> +		   const struct ttm_backup_flags flags)
> +{
> +	long ret;
> +
> +	if (WARN_ON(IS_ERR_OR_NULL(tt->backup)))
> +		return 0;
> +
> +	ret = ttm_pool_backup_tt(&bdev->pool, tt, &flags);
> +
> +	if (ret > 0)
> +		tt->page_flags &= ~TTM_TT_FLAG_PRIV_POPULATED;
> +
> +	return ret;
> +}
> +
>  /**
>   * ttm_tt_swapout - swap out tt object
>   *
> diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
> index 160d954a261e..3112a4be835c 100644
> --- a/include/drm/ttm/ttm_pool.h
> +++ b/include/drm/ttm/ttm_pool.h
> @@ -33,6 +33,7 @@
>  
>  struct device;
>  struct seq_file;
> +struct ttm_backup_flags;
>  struct ttm_operation_ctx;
>  struct ttm_pool;
>  struct ttm_tt;
> @@ -89,6 +90,11 @@ void ttm_pool_fini(struct ttm_pool *pool);
>  
>  int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m);
>  
> +void ttm_pool_release_backed_up(struct ttm_tt *tt);
> +
> +long ttm_pool_backup_tt(struct ttm_pool *pool, struct ttm_tt *ttm,
> +			const struct ttm_backup_flags *flags);
> +
>  int ttm_pool_mgr_init(unsigned long num_pages);
>  void ttm_pool_mgr_fini(void);
>  
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index 991edafdb2dd..7dc766fbce54 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -32,11 +32,13 @@
>  #include <drm/ttm/ttm_caching.h>
>  #include <drm/ttm/ttm_kmap_iter.h>
>  
> +struct ttm_backup;
>  struct ttm_device;
>  struct ttm_tt;
>  struct ttm_resource;
>  struct ttm_buffer_object;
>  struct ttm_operation_ctx;
> +struct ttm_pool_tt_restore;
>  
>  /**
>   * struct ttm_tt - This is a structure holding the pages, caching- and aperture
> @@ -88,6 +90,9 @@ struct ttm_tt {
>  	 * TTM_TT_FLAG_PRIV_POPULATED: TTM internal only. DO NOT USE. This is
>  	 * set by TTM after ttm_tt_populate() has successfully returned, and is
>  	 * then unset when TTM calls ttm_tt_unpopulate().
> +	 *
> +	 * TTM_TT_FLAG_PRIV_BACKED_UP: TTM internal only. This is set if the
> +	 * struct ttm_tt has been (possibly partially) backed up.
>  	 */
>  #define TTM_TT_FLAG_SWAPPED		BIT(0)
>  #define TTM_TT_FLAG_ZERO_ALLOC		BIT(1)
> @@ -96,6 +101,7 @@ struct ttm_tt {
>  #define TTM_TT_FLAG_DECRYPTED		BIT(4)
>  
>  #define TTM_TT_FLAG_PRIV_POPULATED	BIT(5)
> +#define TTM_TT_FLAG_PRIV_BACKED_UP	BIT(6)
>  	uint32_t page_flags;
>  	/** @num_pages: Number of pages in the page array. */
>  	uint32_t num_pages;
> @@ -105,11 +111,20 @@ struct ttm_tt {
>  	dma_addr_t *dma_address;
>  	/** @swap_storage: Pointer to shmem struct file for swap storage. */
>  	struct file *swap_storage;
> +	/**
> +	 * @backup: Pointer to backup struct for backed up tts.
> +	 * Could be unified with @swap_storage. Meanwhile, the driver's
> +	 * ttm_tt_create() callback is responsible for assigning
> +	 * this field.
> +	 */
> +	struct ttm_backup *backup;
>  	/**
>  	 * @caching: The current caching state of the pages, see enum
>  	 * ttm_caching.
>  	 */
>  	enum ttm_caching caching;
> +	/** @restore: Partial restoration from backup state. TTM private */
> +	struct ttm_pool_tt_restore *restore;
>  };
>  
>  /**
> @@ -235,6 +250,21 @@ void ttm_tt_mgr_init(unsigned long num_pages, unsigned long num_dma32_pages);
>  struct ttm_kmap_iter *ttm_kmap_iter_tt_init(struct ttm_kmap_iter_tt *iter_tt,
>  					    struct ttm_tt *tt);
>  unsigned long ttm_tt_pages_limit(void);
> +
> +/**
> + * struct ttm_backup_flags - Flags to govern backup behaviour.
> + * @purge: Free pages without backing up. Bypass pools.
> + * @writeback: Attempt to copy contents directly to swap space, even
> + * if that means blocking on writes to external memory.
> + */
> +struct ttm_backup_flags {
> +	u32 purge : 1;
> +	u32 writeback : 1;
> +};
> +
> +long ttm_tt_backup(struct ttm_device *bdev, struct ttm_tt *tt,
> +		   const struct ttm_backup_flags flags);
> +
>  #if IS_ENABLED(CONFIG_AGP)
>  #include <linux/agp_backend.h>
>  
> -- 
> 2.46.0
> 
