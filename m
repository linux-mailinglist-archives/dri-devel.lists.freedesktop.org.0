Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB97B287F2
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 23:48:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5508610E9B6;
	Fri, 15 Aug 2025 21:48:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kAsr1Zwp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C115E10E0A1;
 Fri, 15 Aug 2025 21:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755294520; x=1786830520;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Ut6uOIxDDaGCjPJO1WtgUkIwTejQaPk8/1+Y6nxGb3U=;
 b=kAsr1ZwpJqxHW4M8GVPhGQ75dxSvQYN7CMYWSAy8Jq6a0mp6Xd89usjT
 X1y7Ye1y6BSxwDy52Mu12SXSgrfOrA7oFTXZ88Daxz2JSkqJxOqG0dT3x
 ADEPDXoXNTxLRFgJEstx6wml+/AIzzbkYBfj/qc9OC6y+JM+UNL6s7kEc
 KSiJXd1z8Urjf6S2MHhFlB8SZpnfKHs849nyYvfmqzvJwTSPiHfsHttqS
 SRthI7eS5gPkGWNDE/bMZhLlQpvEU6RZPl3MZUiOc4zxGXly/1yazlFST
 /pVn2YEt9K762otGsf4yn5/ivYxo8pZCd/qnsch3g/yfv9iR7rWl5eUVn Q==;
X-CSE-ConnectionGUID: g1dYAF11SCW7+hpvtSpNVg==
X-CSE-MsgGUID: To+I6ocKRQ2osL/Ywzaeog==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="68708310"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="68708310"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 14:48:39 -0700
X-CSE-ConnectionGUID: o75nRHjZTO6dZ51TW7ix1w==
X-CSE-MsgGUID: fSISIIpxTK201DfNvz0/+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="166321425"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 14:48:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 14:48:38 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 15 Aug 2025 14:48:38 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.79) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 14:48:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xTV4bsT75dLmid7IDITVrD+sZYlq+3D67nh7f07jqPzSH+86ZMpGM6a8F8xGv8FPnS8075xroi7BvyxiqgQKAk1UYVF0s4cKc3XLMhsQlI/ihxJL5mGsHQ72X6NVXT/FWULMpMRuvdsQNpuFZs539Z2Nr2XEhEl9PGzl5TrxZBCWyz03DXqr1hv8uxlQYqjL2xgeLQzpVieSapgj8yyqQy11v2I8iCQUDU7sHoVhdbn3FuqYhL9SdNiY1YhZLBTv66NP0C3V69OGjUEI3ibbYWREG7nYFculA/NeeHRUr+/pz/ZqCfX2L+5I9HkU+OVDRsh1A7Dwqhw3pOwXH7CA2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gNLUzq8/NymnzLHrpyLzthnHre226cb8kdi+t7Q5mHI=;
 b=QGEfvN1idBWccNG7WOoDro2HU8TQy32AzaHW+m3uRCQs0dj4KFI9BsGLXUK2KwIcmNrs1JwlXYRL7i7sL3WIIrrC3DCrO7LCXycsNSbDvdIuCtvxMTTm5Cex/IMlLvfj05wRyomvn8mxhl/bmkiQhcC8VROEGRmcH9DCJDMzODmLe7po2pt+ElsEdXYVTW3jO53NghGEWpSYcrPaeaZXybJYBo6TG9NC2LAPfce/Gg2HQqrQG1kjxyZPWPsvqKNiCmjcrfmo+D0IH8b6axQqDqqvAaYX4S5MtLwj3SjmsZSNIIz5Kkydl/ukBbGXz63ePPaRlJpVVIGGJzrsN2TjKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8427.namprd11.prod.outlook.com (2603:10b6:806:373::19)
 by CH2PR11MB8777.namprd11.prod.outlook.com (2603:10b6:610:283::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 21:48:36 +0000
Received: from SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781]) by SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781%6]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 21:48:36 +0000
Date: Fri, 15 Aug 2025 17:48:32 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Alex
 Deucher" <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, <Ruhl@freedesktop.org>, Michael J
 <michael.j.ruhl@intel.com>, Riana Tauro <riana.tauro@intel.com>, Anshuman
 Gupta <anshuman.gupta@intel.com>
Subject: Re: [RFC v5 1/5] drm/netlink: Add netlink infrastructure
Message-ID: <aJ-rMORMxdhRwc4c@intel.com>
References: <20250730064956.1385855-1-aravind.iddamsetty@linux.intel.com>
 <20250730064956.1385855-2-aravind.iddamsetty@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250730064956.1385855-2-aravind.iddamsetty@linux.intel.com>
X-ClientProxiedBy: BY5PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:a03:180::17) To SA1PR11MB8427.namprd11.prod.outlook.com
 (2603:10b6:806:373::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8427:EE_|CH2PR11MB8777:EE_
X-MS-Office365-Filtering-Correlation-Id: 10597f1b-3bef-41a1-aaa9-08dddc457cf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?eC6BxtICnBigeyCiv22D4NC1ykmQe+9b0UIxXe8ls6IfxdxbH33HoXZ8rV?=
 =?iso-8859-1?Q?4fYFxzSZfcUWdmrJbiJPMpL//23LCIvkFV3XFqa3MkE+xNG9N2OUZNox6f?=
 =?iso-8859-1?Q?d0ZQHUeYiPhJYl/5IVIRM0rCaPA75rIY045Db3NJs5vBDMRah23QedDK+X?=
 =?iso-8859-1?Q?0zvIARZFGCHzqW8m3v2C+thOpArEX2UMe+ZKR8sgwcVVRhGNvYvtr6mYPk?=
 =?iso-8859-1?Q?diojx9/nywzBDIYlJ6cSvqtAXVkFmndnakcnvp4CyGlixRnbJSD8LfNK85?=
 =?iso-8859-1?Q?jwVIeEwfFtrn2WqEWTeHFCWvJgTiIg5NG/cchsTm1vsBZo/B/ifA3zSbHt?=
 =?iso-8859-1?Q?AuVFQzSnCYBmt+KDrxQ1eKeq58muLe7vC9Rbc/jX0jfFyzMnZHdqThMrhc?=
 =?iso-8859-1?Q?V1nwxgf9M2iLj2u2anHTe5uRIbfdian7Fc+SlVBdUq9358S2LxPdlI8jIf?=
 =?iso-8859-1?Q?R7pmJPqVABbPwFzwhNZydg/BnZDG70PtoXssRnDVmW3G4X9Gr70TP5Co+y?=
 =?iso-8859-1?Q?J0Ue9BalveiD4LEmHPmFzl/9rn/soJsMqGP3Cpj4Xk8AnAmErWODacrJ7c?=
 =?iso-8859-1?Q?rsqto7EH2tK6iTseVZxvZ58ClKQRAv/5cAlxgj6WTo5pWwbWg/FYAr5fK0?=
 =?iso-8859-1?Q?PXhjdjZbPHCRKfQCxpeRV2yEOiDT3FwG+tNodtxnm+Zgn1a4yEeWchCVx3?=
 =?iso-8859-1?Q?3lReWZcIGWSMMx5N/JcXKCosqdLinMq+TTFtXTF/QVvYo5NeZd0EyHQ2y0?=
 =?iso-8859-1?Q?fiG2xIId+F1cQwbZ6pLVva7CHjjZpolXrVEZNsXh9DrciwJ3NVZrr0MMMP?=
 =?iso-8859-1?Q?4rQBt3tq+yW+S7aRaapBBf+zsFYgku8vCgBSpLFyzYEotILf5SeZA+l6R3?=
 =?iso-8859-1?Q?ZaV8an103u0ZNZhwU5NVC5hf88xscX1z6Pvl/CMLShZlSWwUgo3agyoiGZ?=
 =?iso-8859-1?Q?zfE8qfmQRPjwElNNSjadIr3cpVTtOM/rP6SZG0kxJrJaIAz2PxlLHNtM7b?=
 =?iso-8859-1?Q?Z53MymLrQaLACbO6Bqew0aQAhluWLvowUTZexacQuqm0iMOPJFS8/u+1QB?=
 =?iso-8859-1?Q?VPn2khT38HgzeZliaedqwmiqLbW5YK//6RlFUN/aGih4dTtxlU/fV+gdpP?=
 =?iso-8859-1?Q?J+xy88KzXJOLdix1BgUF2e56lv26HxlTeiGOHzmxxgo5UosKrG7ZSnN7dp?=
 =?iso-8859-1?Q?up0VRfaeLVLVpMTB1engLZZDm0ls8GvwxF/jCqouSNfzXwmPVgjNEm9QBY?=
 =?iso-8859-1?Q?xt2ATVa1PNW67ujCfEMd6JVkic6BMydXGtUrb9ZsRGiLmDlysolivsERr/?=
 =?iso-8859-1?Q?+l39tn437xq32nrvrOfHR13gnYBUAQnU+WE8Mq99CdGd8NXgcfOW51uiYU?=
 =?iso-8859-1?Q?Hkv5r8MD92ArbMQkc9cmcePYgGXixjZo9EF7e/IPKB/ALdWyePWVxRHy8i?=
 =?iso-8859-1?Q?1JjCe7oSZ3WmhYPKvUuSN7+1FppTVYwnaEM6Asp8nKNQvHsC8q5ZLHdjHu?=
 =?iso-8859-1?Q?8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?FoA5VIUlGhBSxdQ6+i7bD0zM6vOmfk0fd8S/yhS8HINyNAmNMxQYmELkpf?=
 =?iso-8859-1?Q?kKuvFSp3SW3m9rGNCS1Ia1Yi7HfZOpL44hVdt2pFgdq9cXUTI2PpBMiJDE?=
 =?iso-8859-1?Q?UOBUzW6wwVHdiHmIURQYWSvfVQVBrvN4qx3693AWxvaGCuhjQZ+QuaosGw?=
 =?iso-8859-1?Q?lydy2FkqqacUyucwjjg5M52q2rdPw+9w5rV7Li0vyyIHWefyO+mKPRtnJN?=
 =?iso-8859-1?Q?MD4jikalM0s0+qLLGBcHpV3AAu7Iq61zq7Y8bkoP42XGRkN5aA/c5wOLpD?=
 =?iso-8859-1?Q?z0T0mFU3n7p/MHWnegjJhyQhN1yiue/30gZicUoJLcPZx6q2Jp2rRqJwV0?=
 =?iso-8859-1?Q?wYAlAmLT0WmOe3fLH/Ilkoa9pCcc/sfC65wxM2O04n2rhVUaDoKqj2zBBC?=
 =?iso-8859-1?Q?7QEBBOglsgwqMHA/I4bld8IkM4IvztZf1+qbN8oVst70+pRCcVjiKIOzB1?=
 =?iso-8859-1?Q?0VraA2xR6apVD1JUqJxGkeZyyoiTOnas/Zx4kglXSOPjOedWrzADOsnxfM?=
 =?iso-8859-1?Q?ha8netXcj/o6PMqV5zrZ2ZCa/tD3+wizSUTmxPDl+hEJgzm7LqQUxrnnMa?=
 =?iso-8859-1?Q?07Dj2q9sMnaRYQObKvQ40rChI3Oy5aDBzaRRMejqN3nQRsiOSDN1wQ8Nzq?=
 =?iso-8859-1?Q?UHn+qfjnmVlPQZetb8jIr6JTXw9cYLwzN58bGID8b38P/x9bKwJMiG0cEV?=
 =?iso-8859-1?Q?M5GbhAwQQCADQ6F5zfRVkWrgd9CersTdoCdbqU0ExANFgKFSm/PFviMVRR?=
 =?iso-8859-1?Q?xQO0GDZn9Cq7jGZPRwDAwe63jKsxOKvNXi0gokMzTLqSbngTYWRAWSngSm?=
 =?iso-8859-1?Q?hXXFxb3wpwJtv/nLIEwSKYWxPqeHSufWEJcfxulxiNmmbXUOGl1jco8Huc?=
 =?iso-8859-1?Q?oCflvv6jFLJZhJmTdQr1G0QXdVO/Tvc7cvDWe7byCIXqOFx1vNjefLMZtq?=
 =?iso-8859-1?Q?w63hWmm1iQS2dbyBvpFtCgIr1h8uKiiEPF4mdg/7LjweisW/3wNMnRxv2I?=
 =?iso-8859-1?Q?ILKpUXhMwd/xLzEC5E4CQGObK1bahgjrA0HmL8k5KDSuGSzpWZua2hHG/p?=
 =?iso-8859-1?Q?ZNSuI+ErS7LMzveYu0MTE1RLKNloWkBjrluiBEw5TAIwFDSvJXnB0GE5zY?=
 =?iso-8859-1?Q?CquSh8EldTgTl30NVa6OY0EG+ufGTczNDfweYYQapnwPAuOhoYIsr8bHeC?=
 =?iso-8859-1?Q?NOFQTnNSoW6xEhQK24X+a7TZcYl9cWT9cHtNXSXNijai9+ThGiwAD9jphT?=
 =?iso-8859-1?Q?GuWqOzXabFsyl70FawQoJKpHle+A3IfeT2DjFGL8od4u++TDmNzPJyhLU1?=
 =?iso-8859-1?Q?R6nZx2nkUnlOdH7gwc4+zXx5kDJ83vwedyPyCpKS5TXiSVRhK/BPSGFJhZ?=
 =?iso-8859-1?Q?j+GFD6BP2HYdBRF25p9fvw1cSp4jd9hjWEvEFzSarvKWb8d7gpnaeYxR5D?=
 =?iso-8859-1?Q?wGdk9yiJ6hhBIhtp/6XN75tk1T1FKUqJsSnKOaGK9BG4Yw8JEKaXXkzkCP?=
 =?iso-8859-1?Q?IqQnQqrLXaOmlhbtPdFmJnbvL5Tc0pLzI1Hg7gqVw6LW13y9+MHV6SW+/V?=
 =?iso-8859-1?Q?BP+bjZkQIHKXv40LP5YlgBIvU15x5xr6G48iqPA1Wq8n4BoGwRC1kih8bq?=
 =?iso-8859-1?Q?T5SXr9+vEYmavljpJNE/DhFJNWuRg955tF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10597f1b-3bef-41a1-aaa9-08dddc457cf9
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 21:48:36.6252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nt2dx1lrLZfcIKiIRUxkf97YNfqKpph7JIkjiD1izxa/72lr/Ez9Orc+2BC8uXysAOSzw+tCU7KmNnPtfQkYoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8777
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

On Wed, Jul 30, 2025 at 12:19:52PM +0530, Aravind Iddamsetty wrote:
> Define the netlink registration interface and commands, attributes that
> can be commonly used across by drm drivers. This patch intends to use
> the generic netlink family to expose various stats of device. At present
> it defines some commands that shall be used to expose RAS error counters.
> 
> v2:
> define common interfaces to genl netlink subsystem that all drm drivers
> can leverage.(Tomer Tayar)
> 
> v3: drop DRIVER_NETLINK flag and use the driver_genl_ops structure to
> register to netlink subsystem (Daniel Vetter)
> 
> v4:(Michael J. Ruhl)
> 1. rename drm_genl_send to drm_genl_reply
> 2. catch error from xa_store and handle appropriately
> 
> v5:
> 1. compile only if CONFIG_NET is enabled
> 
> V6: Add support for reading an IP block errors
> 
> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com> #v4
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> ---
>  drivers/gpu/drm/Makefile       |   1 +
>  drivers/gpu/drm/drm_drv.c      |   7 ++
>  drivers/gpu/drm/drm_netlink.c  | 212 +++++++++++++++++++++++++++++++++
>  include/drm/drm_device.h       |  10 ++
>  include/drm/drm_drv.h          |   7 ++
>  include/drm/drm_netlink.h      |  41 +++++++
>  include/uapi/drm/drm_netlink.h | 101 ++++++++++++++++
>  7 files changed, 379 insertions(+)
>  create mode 100644 drivers/gpu/drm/drm_netlink.c
>  create mode 100644 include/drm/drm_netlink.h
>  create mode 100644 include/uapi/drm/drm_netlink.h
> 
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 4dafbdc8f86a..39d5183ab35c 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -77,6 +77,7 @@ drm-$(CONFIG_DRM_CLIENT) += \
>  	drm_client.o \
>  	drm_client_event.o \
>  	drm_client_modeset.o
> +drm-$(CONFIG_NET) += drm_netlink.o
>  drm-$(CONFIG_DRM_LIB_RANDOM) += lib/drm_random.o
>  drm-$(CONFIG_COMPAT) += drm_ioc32.o
>  drm-$(CONFIG_DRM_PANEL) += drm_panel.o
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 02556363e918..cce55423141c 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -1088,6 +1088,12 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
>  	if (ret)
>  		goto err_minors;
>  
> +	if (driver->genl_ops) {
> +		ret = drm_genl_register(dev);
> +		if (ret)
> +			goto err_minors;
> +	}

Even if we don't go with multiple 'groups' I believe that the driver should
explicitly call the netlink registration.

> +
>  	ret = create_compat_control_link(dev);
>  	if (ret)
>  		goto err_minors;
> @@ -1229,6 +1235,7 @@ static void drm_core_exit(void)
>  	drm_privacy_screen_lookup_exit();
>  	drm_panic_exit();
>  	accel_core_exit();
> +	drm_genl_exit();
>  	unregister_chrdev(DRM_MAJOR, "drm");
>  	debugfs_remove(drm_debugfs_root);
>  	drm_sysfs_destroy();
> diff --git a/drivers/gpu/drm/drm_netlink.c b/drivers/gpu/drm/drm_netlink.c
> new file mode 100644
> index 000000000000..da4bfde32a22
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_netlink.c

drm_ras.c ?

> @@ -0,0 +1,212 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation

2025 here and in any other file

> + */
> +
> +#include <net/genetlink.h>
> +#include <uapi/drm/drm_netlink.h>

uapi/drm/drm_ras.h ?!

like we don't have a drm_ioctl.h but drm_mode.h

> +
> +#include <drm/drm_device.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_file.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_netlink.h>
> +#include <drm/drm_print.h>
> +
> +DEFINE_XARRAY(drm_dev_xarray);
> +
> +/**
> + * drm_genl_reply - response to a request
> + * @msg: socket buffer
> + * @info: receiver information
> + * @usrhdr: pointer to user specific header in the message buffer
> + *
> + * RETURNS:
> + * 0 on success and negative error code on failure
> + */
> +int drm_genl_reply(struct sk_buff *msg, struct genl_info *info, void *usrhdr)

drm_ras_reply so we standardize in a single namespace everywhere ?!

and same for all other functions and structs, except for things
that are declared outside drm

> +{
> +	int ret;
> +
> +	genlmsg_end(msg, usrhdr);
> +
> +	ret = genlmsg_reply(msg, info);
> +	if (ret)
> +		nlmsg_free(msg);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_genl_reply);
> +
> +/**
> + * drm_genl_alloc_msg - allocate genl message buffer
> + * @dev: drm_device for which the message is being allocated
> + * @info: receiver information
> + * @msg_size: size of the msg buffer that needs to be allocated
> + * @usrhdr: pointer to user specific header in the message buffer
> + *
> + * RETURNS:
> + * pointer to new allocated buffer on success, NULL on failure
> + */
> +struct sk_buff *
> +drm_genl_alloc_msg(struct drm_device *dev,
> +		   struct genl_info *info,
> +		   size_t msg_size, void **usrhdr)
> +{
> +	struct sk_buff *new_msg;
> +
> +	new_msg = genlmsg_new(msg_size, GFP_KERNEL);
> +	if (!new_msg)
> +		return new_msg;
> +
> +	*usrhdr = genlmsg_put_reply(new_msg, info, dev->drm_genl_family, 0, info->genlhdr->cmd);
> +	if (!*usrhdr) {
> +		nlmsg_free(new_msg);
> +		new_msg = NULL;
> +	}
> +
> +	return new_msg;
> +}
> +EXPORT_SYMBOL(drm_genl_alloc_msg);
> +
> +static struct drm_device *genl_to_dev(struct genl_info *info)
> +{
> +	return xa_load(&drm_dev_xarray, info->nlhdr->nlmsg_type);
> +}
> +
> +static int drm_genl_list_errors(struct sk_buff *msg, struct genl_info *info)
> +{
> +	struct drm_device *dev = genl_to_dev(info);
> +
> +	if (info->genlhdr->cmd == DRM_RAS_CMD_READ_ALL) {
> +		if (GENL_REQ_ATTR_CHECK(info, DRM_RAS_ATTR_READ_ALL))
> +			return -EINVAL;
> +	} else {
> +		if (GENL_REQ_ATTR_CHECK(info, DRM_RAS_ATTR_QUERY))
> +			return -EINVAL;
> +	}
> +
> +	if (WARN_ON(!dev->driver->genl_ops[info->genlhdr->cmd].doit))
> +		return -EOPNOTSUPP;
> +
> +	return dev->driver->genl_ops[info->genlhdr->cmd].doit(dev, msg, info);
> +}
> +
> +static int drm_genl_read_error(struct sk_buff *msg, struct genl_info *info)
> +{
> +	struct drm_device *dev = genl_to_dev(info);
> +
> +	if (GENL_REQ_ATTR_CHECK(info, DRM_RAS_ATTR_ERROR_ID))
> +		return -EINVAL;
> +
> +	if (WARN_ON(!dev->driver->genl_ops[info->genlhdr->cmd].doit))
> +		return -EOPNOTSUPP;
> +
> +	return dev->driver->genl_ops[info->genlhdr->cmd].doit(dev, msg, info);
> +}
> +
> +/* attribute policies */
> +static const struct nla_policy drm_attr_policy_query[DRM_ATTR_MAX + 1] = {
> +	[DRM_RAS_ATTR_QUERY] = { .type = NLA_U8 },
> +};
> +
> +static const struct nla_policy drm_attr_policy_read_one[DRM_ATTR_MAX + 1] = {
> +	[DRM_RAS_ATTR_ERROR_ID] = { .type = NLA_U64 },
> +};
> +
> +static const struct nla_policy drm_attr_policy_read_all[DRM_ATTR_MAX + 1] = {
> +	[DRM_RAS_ATTR_READ_ALL] = { .type = NLA_U8 },
> +};
> +
> +/* drm genl operations definition */
> +const struct genl_ops drm_genl_ops[] = {
> +	{
> +		.cmd = DRM_RAS_CMD_QUERY,
> +		.doit = drm_genl_list_errors,
> +		.policy = drm_attr_policy_query,
> +	},
> +	{
> +		.cmd = DRM_RAS_CMD_READ_ONE,
> +		.doit = drm_genl_read_error,
> +		.policy = drm_attr_policy_read_one,
> +	},
> +	{
> +		.cmd = DRM_RAS_CMD_READ_ALL,
> +		.doit = drm_genl_list_errors,
> +		.policy = drm_attr_policy_read_all,
> +	},
> +	{
> +		.cmd = DRM_RAS_CMD_READ_BLOCK,
> +		.doit = drm_genl_read_error,
> +		.policy = drm_attr_policy_read_one,
> +	},
> +
> +};
> +
> +static void drm_genl_family_init(struct drm_device *dev)
> +{
> +	dev->drm_genl_family = drmm_kzalloc(dev, sizeof(struct genl_family),
> +					    GFP_KERNEL);
> +
> +	/* Use drm primary node name eg: card0 to name the genl family */
> +	snprintf(dev->drm_genl_family->name, sizeof(dev->drm_genl_family->name),
> +		 "%s", dev->primary->kdev->kobj.name);

for the family name I believe we deserve the 'drmras', then
the card minor number, then the group name.

For instance, but not necessarily suggesting xe to do it:

drmras-0-gt
drmras-0-soc

.....

driver can select their own name...


> +	dev->drm_genl_family->version = DRM_GENL_VERSION;

I believe driver could control their own version so if something changes in
the group names for instance or supported commands they can change it.

> +	dev->drm_genl_family->parallel_ops = true;
> +	dev->drm_genl_family->ops = drm_genl_ops;
> +	dev->drm_genl_family->n_ops = ARRAY_SIZE(drm_genl_ops);
> +	dev->drm_genl_family->maxattr = DRM_ATTR_MAX;
> +	dev->drm_genl_family->module = dev->dev->driver->owner;
> +}
> +
> +static void drm_genl_deregister(struct drm_device *dev, void *arg)
> +{
> +	drm_dbg_driver(dev, "unregistering genl family %s\n", dev->drm_genl_family->name);
> +
> +	xa_erase(&drm_dev_xarray, dev->drm_genl_family->id);
> +
> +	genl_unregister_family(dev->drm_genl_family);
> +}
> +
> +/**
> + * drm_genl_register - Register genl family
> + * @dev: drm_device for which genl family needs to be registered
> + *
> + * RETURNS:
> + * 0 on success and negative error code on failure
> + */
> +int drm_genl_register(struct drm_device *dev)
> +{
> +	int ret;
> +
> +	drm_genl_family_init(dev);
> +
> +	ret = genl_register_family(dev->drm_genl_family);
> +	if (ret < 0) {
> +		drm_warn(dev, "genl family registration failed\n");
> +		return ret;
> +	}
> +
> +	drm_dbg_driver(dev, "genl family id %d and name %s\n", dev->drm_genl_family->id,
> +		       dev->drm_genl_family->name);
> +
> +	ret = xa_err(xa_store(&drm_dev_xarray, dev->drm_genl_family->id, dev, GFP_KERNEL));
> +	if (ret)
> +		goto genl_unregister;
> +
> +	ret = drmm_add_action_or_reset(dev, drm_genl_deregister, NULL);
> +
> +	return ret;
> +
> +genl_unregister:
> +	genl_unregister_family(dev->drm_genl_family);
> +	return ret;
> +}
> +
> +/**
> + * drm_genl_exit: destroy drm_dev_xarray
> + */
> +void drm_genl_exit(void)
> +{
> +	xa_destroy(&drm_dev_xarray);
> +}
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index 08b3b2467c4c..8b60a17e4156 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -8,6 +8,7 @@
>  #include <linux/sched.h>
>  
>  #include <drm/drm_mode_config.h>
> +#include <drm/drm_netlink.h>
>  
>  struct drm_driver;
>  struct drm_minor;
> @@ -22,6 +23,8 @@ struct inode;
>  struct pci_dev;
>  struct pci_controller;
>  
> +struct genl_family;
> +
>  /*
>   * Recovery methods for wedged device in order of less to more side-effects.
>   * To be used with drm_dev_wedged_event() as recovery @method. Callers can
> @@ -356,6 +359,13 @@ struct drm_device {
>  	 * Root directory for debugfs files.
>  	 */
>  	struct dentry *debugfs_root;
> +
> +	/**
> +	 * @drm_genl_family:
> +	 *
> +	 * Generic netlink family registration structure.
> +	 */
> +	struct genl_family *drm_genl_family;

we should probably have this inside a struct drm_ras and without the 1-1
tie here


>  };
>  
>  void drm_dev_set_dma_dev(struct drm_device *dev, struct device *dma_dev);
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 3f76a32d6b84..908888ac0db2 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -431,6 +431,13 @@ struct drm_driver {
>  	 * some examples.
>  	 */
>  	const struct file_operations *fops;
> +
> +	/**
> +	 * @genl_ops:
> +	 *
> +	 * Drivers private callback to genl commands
> +	 */
> +	const struct driver_genl_ops *genl_ops;

as well the ops should be encapsulated in the drm_ras struct

>  };
>  
>  void *__devm_drm_dev_alloc(struct device *parent,
> diff --git a/include/drm/drm_netlink.h b/include/drm/drm_netlink.h
> new file mode 100644
> index 000000000000..4a746222337a
> --- /dev/null
> +++ b/include/drm/drm_netlink.h
> @@ -0,0 +1,41 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef __DRM_NETLINK_H__
> +#define __DRM_NETLINK_H__
> +
> +#include <linux/types.h>
> +
> +struct drm_device;
> +struct genl_info;
> +struct sk_buff;
> +
> +struct driver_genl_ops {
> +	int		       (*doit)(struct drm_device *dev,

when I first saw the doit I was going to complain about it,
until I learned this is part of netlink definition :)

> +				       struct sk_buff *skb,
> +				       struct genl_info *info);
> +};
> +
> +#if IS_ENABLED(CONFIG_NET)
> +int drm_genl_register(struct drm_device *dev);
> +void drm_genl_exit(void);
> +int drm_genl_reply(struct sk_buff *msg, struct genl_info *info, void *usrhdr);
> +struct sk_buff *
> +drm_genl_alloc_msg(struct drm_device *dev,
> +		   struct genl_info *info,
> +		   size_t msg_size, void **usrhdr);
> +#else
> +static inline int drm_genl_register(struct drm_device *dev) { return 0; }
> +static inline void drm_genl_exit(void) {}
> +static inline int drm_genl_reply(struct sk_buff *msg,
> +				 struct genl_info *info,
> +				 void *usrhdr) { return 0; }
> +static inline struct skb_buff *
> +drm_genl_alloc_msg(struct drm_device *dev,
> +		   struct genl_info *info,
> +		   size_t msg_size, void **usrhdr) { return NULL; }
> +#endif
> +
> +#endif
> diff --git a/include/uapi/drm/drm_netlink.h b/include/uapi/drm/drm_netlink.h
> new file mode 100644
> index 000000000000..58afb6e8d84a
> --- /dev/null
> +++ b/include/uapi/drm/drm_netlink.h
> @@ -0,0 +1,101 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright 2023 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * VA LINUX SYSTEMS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.

This header kind of conflicts/overlaps the MIT SPDX above. We should remove it
and go only with the SPDX imho, unless I'm missing something

> + */
> +
> +#ifndef _DRM_NETLINK_H_
> +#define _DRM_NETLINK_H_
> +
> +#define DRM_GENL_VERSION 1
> +
> +#if defined(__cplusplus)
> +extern "C" {
> +#endif
> +
> +/**
> + * enum drm_genl_error_cmds - Supported error commands
> + *
> + */
> +enum drm_genl_error_cmds {
> +	DRM_CMD_UNSPEC,
> +	/**
> +	 * @DRM_RAS_CMD_QUERY: Command to list all errors names with config-id in verbose mode.
> +	 * In normal mode will list IP blocks, total instances available and error types supported
> +	 */
> +	DRM_RAS_CMD_QUERY,

here is the part where naming inconsistency is more visible, file has one
namespacing, struct has another, and command has even a third one.

drm_ras everywhere to solve this please.

> +	/** @DRM_RAS_CMD_READ_ONE: Command to get a counter for a specific error */
> +	DRM_RAS_CMD_READ_ONE,
> +	/** @DRM_RAS_CMD_READ_BLOCK: Command to get a counter of specific error type from an IP
> +	 * block
> +	 */
> +	DRM_RAS_CMD_READ_BLOCK,

here is the part that I believe this API already shows how it is not
expansible. you had to create an argument to filter the type of errors
instead of declaring the errors per ip block like AMD folks had asked for.

> +	/** @DRM_RAS_CMD_READ_ALL: Command to get counters of all errors */
> +	DRM_RAS_CMD_READ_ALL,
> +
> +	__DRM_CMD_MAX,
> +	DRM_CMD_MAX = __DRM_CMD_MAX - 1,
> +};
> +
> +enum drm_cmd_request_type {
> +	DRM_RAS_CMD_QUERY_VERBOSE = 1,
> +	DRM_RAS_CMD_QUERY_NORMAL = 2,
> +};

I don't understand why we need verbose vs normal. Perhaps this should
be a separate path or explain with examples?

it took me a while to realize that the drm_ras igt tool would only
list my available errors if I was using --verbose, otherwise we would
return in the begin of the list_error functions in xe...

> +
> +/**
> + * enum drm_error_attr - Attributes to use with drm_genl_error_cmds
> + *
> + */
> +enum drm_error_attr {
> +	DRM_ATTR_UNSPEC,
> +	DRM_ATTR_PAD = DRM_ATTR_UNSPEC,
> +	/**
> +	 * @DRM_RAS_ATTR_QUERY: Should be used with DRM_RAS_CMD_QUERY,
> +	 * DRM_RAS_CMD_READ_ALL
> +	 */
> +	DRM_RAS_ATTR_QUERY, /* NLA_U8 */
> +	/**
> +	 * @DRM_RAS_ATTR_READ_ALL: Should be used with DRM_RAS_CMD_READ_ALL
> +	 */
> +	DRM_RAS_ATTR_READ_ALL, /* NLA_U8 */
> +	/**
> +	 * @DRM_RAS_ATTR_QUERY_REPLY: First Nested attributed sent as a
> +	 * response to DRM_RAS_CMD_QUERY, DRM_RAS_CMD_READ_ALL commands.
> +	 */
> +	DRM_RAS_ATTR_QUERY_REPLY, /* NLA_NESTED */
> +	/** @DRM_RAS_ATTR_ERROR_NAME: Used to pass error name */
> +	DRM_RAS_ATTR_ERROR_NAME, /* NLA_NUL_STRING */
> +	/** @DRM_RAS_ATTR_ERROR_ID: Used to pass error id, should be used with
> +	 * DRM_RAS_CMD_READ_ONE, DRM_RAS_CMD_READ_BLOCK
> +	 */
> +	DRM_RAS_ATTR_ERROR_ID, /* NLA_U64 */
> +	/** @DRM_RAS_ATTR_ERROR_VALUE: Used to pass error value */
> +	DRM_RAS_ATTR_ERROR_VALUE, /* NLA_U64 */


I'm also confused on all of the errors here and why we would need them
and it also looks not expansible...

> +
> +	__DRM_ATTR_MAX,
> +	DRM_ATTR_MAX = __DRM_ATTR_MAX - 1,
> +};
> +
> +#if defined(__cplusplus)
> +}
> +#endif
> +
> +#endif
> -- 
> 2.25.1
> 
