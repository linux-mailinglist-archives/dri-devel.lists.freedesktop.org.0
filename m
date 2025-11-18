Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E16C66B05
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 01:45:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3578B10E407;
	Tue, 18 Nov 2025 00:44:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gaKgjcGJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F0A10E034;
 Tue, 18 Nov 2025 00:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763426680; x=1794962680;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qB5XE8Bj9i5PWDyP+36XdKTbAS9XuyOv1Ga8j1wpK3o=;
 b=gaKgjcGJxcYoKO748BD5e2CgKv9s661t0KGGrksh50VaZ77mLNE/7Jhj
 rcu/iw9Fr1QjWLddUrf4uy+yPCnXGlGt68PyCd3Wg+R7CB2NIvACihKBT
 Y6jDHQ9niKnEIhvdoLSN7b0jfoYHsHgn9qB5c2xO6Y55QozasqeV0KHVl
 IXORK/hWa8Sh8qawxmYFYLOeCuKntYSwUCUaCKwyCf7a/AolxM2plZHFJ
 jjymfSPAzj1nSxVH/QD5O0Z13iBNVugdULhNhKj1dh9Sq3eik6L4VwhQF
 o3mwgvxzf7AhVZ+gTCnak/RVltacDq09aCeoZKGN9JQ+Wfgk/80PWbC9K w==;
X-CSE-ConnectionGUID: hG/NvZLzQai/d6tqO8G6IQ==
X-CSE-MsgGUID: uWHFjcGZRXety1/b5iLP5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="75758779"
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; d="scan'208";a="75758779"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 16:44:39 -0800
X-CSE-ConnectionGUID: uq3sWI4yQSKZdQ4OBf6z/g==
X-CSE-MsgGUID: VNTRmx0cS/+JghmcTx1SQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; d="scan'208";a="190626191"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 16:44:39 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 16:44:39 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 16:44:39 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.15) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 16:44:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FtPqBxfVCZb/SL6XiJWxKgyZOR7hVFuMxyMh1Im5i04oe8zG/URISM5mD/OWmMsxk6Eoo6srrREFror+ZqojeTRI8EWE+7PE/0tOutAdi5OrEILPp3poJV6CpbM+DXUM2Xf+ql9x0l6WuXFzrbfHiJSrQao3ivGnXLmOJ9LoeXrR2FWwXwFxAnxiBOd+MlDSJHMiFuJy7vpK8BuMg/7hseksPdts1e7bANM+mzmF5BdwYo8JEZuYL7oVhQWKDUg6MjnW7T37q4rxDIGu3gknxwJVqoFYU4JCvDkWdx4RWeHg6t5DpdbxwwI3DRxfIr0p/rgAmPrGDez9Yg8/rBIvHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JiU0rhw/CR59M/AtQPqDM6cZX1FoCzq99ApWBg3C2u0=;
 b=niyx51riZtre6Ct5YdOJGGrKOvDpOdG02itamAT7PmCvYk26vOd2DS0/tyJfRUB9m3F//aaFDBWLFS6qgGHXinrqS72OxEfAEQYcQFX6nGnAdTczZcSqDVUnZKDSyuQTvIQvI+OweUJPoWCOXzsHsqlesPj15hDUh5SlmXmrRvSLlNKreS1c/hN50A9ytj7Dm4Kl+PvSe6PKBpT7LGp0ZT95j0tfmwpthwBupa21kbXrPfK98cK4rqs+X90YOICiAAkRhLXSFKJ9VpAAiuK/MKKLe3Yeei86RW0iQEoK4BD3hnZth05kz/RhgMKYIUHida3Bta+SDd4Gd/9JwcBYjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB7427.namprd11.prod.outlook.com (2603:10b6:a03:4c1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 00:44:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 00:44:36 +0000
Date: Mon, 17 Nov 2025 16:44:33 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v2 04/17] drm/pagemap, drm/xe: Manage drm_pagemap
 provider lifetimes
Message-ID: <aRvBcT6rp9mn1jP1@lstrano-desk.jf.intel.com>
References: <20251111164408.113070-1-thomas.hellstrom@linux.intel.com>
 <20251111164408.113070-5-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251111164408.113070-5-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0302.namprd03.prod.outlook.com
 (2603:10b6:303:dd::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB7427:EE_
X-MS-Office365-Filtering-Correlation-Id: 678bdc32-7fb3-4e92-ccdc-08de263ba610
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?7x87QQkc0K2izUJivY10VdEoQmu+vJpjrD+mhi4LlnKrd28Lsllax/bwnN?=
 =?iso-8859-1?Q?GcYFaxE07oXeDF5xEFFUhaJTyA62LPdSywrAxUumwZ+tO0ZVRx4EBPK95B?=
 =?iso-8859-1?Q?yC6sWyQukJC/edyymNbv8oL0OhrRPDvOv4Eyz1vur+V4RNbJ0iIh1MY6Mf?=
 =?iso-8859-1?Q?h+z/O6h2/0xiUiZv8sYT/SjMGdrnysspBiKqAYZpAcAQEJPesFeTLsvdo0?=
 =?iso-8859-1?Q?yHEJ1oWyaDB5akseN5PvPupeTazdVerZqb/M8uU+QhDyWgLbg4evC6P4SS?=
 =?iso-8859-1?Q?OSmzc2lU8GkYJjx8bvbF1trtW/GpsawvpJ9bPDoY2saBVQUCJZMxhH7Erq?=
 =?iso-8859-1?Q?n/OvYTPqVvlzp3xSVbgcGOs8sircm22AZGcioGyqKpw0Oltxs3BS/wKwq9?=
 =?iso-8859-1?Q?OYP8vcrFE7Aq9UheCreWXhE0l6UMI44FpJMnkzHlK4xsaA5haLAsl9+5Db?=
 =?iso-8859-1?Q?RdqUdh1zN43KdLQqt8/jVOjuuJmBmKr8y21ov0+QSDMxe5PfFK59vVQxqh?=
 =?iso-8859-1?Q?/T8KyFOL1odEbWXi/IowsHkZwkuu3tt+YP97vILE69ZWl+mWk2zo7WBqZ+?=
 =?iso-8859-1?Q?H7pW53chCf/Fid+Ew3XjxJTFO05YneNLPSx0nkMr3aONBihZkB9ivoxokc?=
 =?iso-8859-1?Q?mQGwoeJIQPh0tte2a0YHr1UyjQb4xC4TowzfqKYxfen0/CSYrvaTI79fRe?=
 =?iso-8859-1?Q?5mUpK30uUb7dejJGQeLCLruG80zYkdw1DR1RciydWB8VNTmwozWLVbcMp8?=
 =?iso-8859-1?Q?dssfg38qH1vOhTkN0pYWGhADy7f26svHMHOPiyt92htEi7Msj3KEIZ80+s?=
 =?iso-8859-1?Q?XVdkroHR0+18PGjPDbZDBB1M1zZMH6NhgcyojDiezxyUbG5RRhO7qjwqZs?=
 =?iso-8859-1?Q?7v0Daxw3+yPK3Lu3V8+eRSvAoAcb9E2aDvd/043PWmYNmgnAPb/MQVxeco?=
 =?iso-8859-1?Q?AKV+Sag+swJ5XKeAHIEdgtj5mqIuJIdqvMXbQxKdDymwuNtUDgXmyAztg3?=
 =?iso-8859-1?Q?ZjVBMmVIFtylN6EnEwUq3R37w7YoPKOL8fubA1XOkZEO/7W8+jk4zM2LLh?=
 =?iso-8859-1?Q?/T01rZctdqg3A4yPtM4pVkPME8CQQxyir+Swl2HutuDf8q+NvQQPxU/yoc?=
 =?iso-8859-1?Q?YXkp4gwoP4/HkxCvcX7uTHxhWy5igLMsuJj+S6TIB/gI23DUWNhe7qveU/?=
 =?iso-8859-1?Q?g1xsJSYnLU0VvEwCi7Cwf3mb5cp05TSHZN2YpoewmWBjOceLe65x9oaqkH?=
 =?iso-8859-1?Q?qF+1pF/bTf5hYTWVu5v8tgKQFLXTR+mNlMTv8MNKeNUZnMtZ000hJUWyOq?=
 =?iso-8859-1?Q?TEwcSKtxPchlMYY0DPP1MQGZUixzVt5dNtRtERNQeH8J/Okx+zHbHWAQUt?=
 =?iso-8859-1?Q?FM82iWHpOfEm6xSTBgggubpd6WdwekbcPy+gqTuTtkRACuWysYGhbosVWR?=
 =?iso-8859-1?Q?KeigLusNezqzYFrg/t6eJKQnME76isV0GWkFIyS1cVqtp7lwulRB34YX6E?=
 =?iso-8859-1?Q?ccNi2FdMARi33t7EdwGSEO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?BAdH5Uma3A61v30R/Ty/P4TBLIGzjTUq8olS5o4zqMoM/Xdd0DQu76HVmX?=
 =?iso-8859-1?Q?BF86ETF8wAoQizm7e2YR/1Vzw7j/oih2R0QRKOFwPJSmmlOde1wxXBoYEy?=
 =?iso-8859-1?Q?KviZcW84HZRxxO2EX+fYPeq/qa7hFe1oD/nXNAOpZFKHOJ0rRWcikPGp+o?=
 =?iso-8859-1?Q?EytFheC7vd8s7RJ5ichjoaLih6thiMB+LK4N4EEHe8F5eUJHIHBEIPmnEB?=
 =?iso-8859-1?Q?3MZcKzydr9sRJVwtWKxEE2VU3q9snGa7RXwFBJiOzTBQzsUllBDGRMeEER?=
 =?iso-8859-1?Q?oB7q1SLd2wPsgkZ+uQgUNOMruekKQnQMYDnuGiBTXQbJUA41xXQOb0Ez6c?=
 =?iso-8859-1?Q?IJ5+TtY+ZyJ74KNNbGOZ1VfZY8dwWYwwd9WYNzYj/IsaQ8j2gCPISpYpNm?=
 =?iso-8859-1?Q?TtruTart2GV+7jH98AV1rfnvb4A/2cwFFZ/AemjPhReXPz32muodlU1wK3?=
 =?iso-8859-1?Q?0Q/O+GmOpzPzdweYrTTEh+cFeRmMPbJM+XZnulghXskRiWlVzPBsWOTVOP?=
 =?iso-8859-1?Q?pNqN/k6Kc2vk1y85B7pbWDDQT5n2Fhpbaufb64A4UyOEboxd6/8MGymnae?=
 =?iso-8859-1?Q?Nf/LPwPY/aQl/1IBS2bq7WhwHIafluFbltjztj2dn3MN/ffV02kfRga6ap?=
 =?iso-8859-1?Q?Ot/2CWYYc2N2FYczirfUGUPiXVMxzs7S3c/i/81ORp96Jz7nHi4mxMkreA?=
 =?iso-8859-1?Q?rJO5xQ/2o8ZkhJS/xEejwQRgY9LbpidU/0nNn5TnD5d19yB+t2p+8XVxTC?=
 =?iso-8859-1?Q?ha7gt39J1i9/5UOZ9Nc/IIltAU3ifhiz1FHHMbzJ9FKiQyipuaJl2yFMfL?=
 =?iso-8859-1?Q?bitZlENhYZf/xF8v71xxpujlBSVhsnpaB9c9ohoYWfzAC+UNLKPiANRZFI?=
 =?iso-8859-1?Q?KjBxYg472Alh3ORXE7C4BQN3vQRqLnucfzleaTNXQyJHArR5xldyGjIIyX?=
 =?iso-8859-1?Q?/WQUG0bzrCjJggtDw51Qgs1PTUomr3ktUyF8S/XMVg4nbQ6KMuE1VFHmhm?=
 =?iso-8859-1?Q?JQIMRKz3tMkbncqzIiGdNwVHTyhLecL6pBAeHb/QsUucdklOuQfdeXL2mf?=
 =?iso-8859-1?Q?KHIBwO/PNa1j58xOU5bfQ9lmEtGn+5Qb9/fNmomw5Xj4v353zI2mpgO05B?=
 =?iso-8859-1?Q?oRLJQR2YDE3tEsbG56ZnOXwoGgisYNCz+YDg+DBT5G4nhXEQTgl1Isrs51?=
 =?iso-8859-1?Q?SD+o44Bnvxt8rJ/ilPuAN4C6E+V/cLhjrwTqQlCJlR49Ka9xjmGcaxI/AV?=
 =?iso-8859-1?Q?D+BR+1+BzyLNXMQGmXS3SBTNcyjQaL5sSbOtuwBtl7lbdR76+wQ2zVkwA5?=
 =?iso-8859-1?Q?S0yrRG0pWMrdcy799AN47uYK9RnUwXBb6iB5MKsXVWIw+x/RTGeEWOtOVO?=
 =?iso-8859-1?Q?SsXWQztSL3ze1AktEWCDxmsAQbUJ/CRvoN8mpxn+B/8X0jOb/s8AVJlyM3?=
 =?iso-8859-1?Q?SviQ1plfnWnptw2LxxTWMhTWMKL3W96vtdOMHwXSFwz8KHSEj9sn26JU9Z?=
 =?iso-8859-1?Q?3XGBhk3XweWUaxboK05GTB9zBR6OIvLMhKQ4XUFzKipzUDtr1WQimOXSfi?=
 =?iso-8859-1?Q?hxH8WcDpdYCz2Tku5ngrCUeFBl+NYVaCwygKI6HxUrB3bNveo5YAvoa5EI?=
 =?iso-8859-1?Q?MrWmTCGIsXgkqoT9yPIcbs9zqPHxEsG9+OuzZLdPUwaeDY/lQmtgd4sg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 678bdc32-7fb3-4e92-ccdc-08de263ba610
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 00:44:36.6771 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5y1mbBVGn/ez5Q0zkPrHVE2R1LL8fa8gptdtNWZ4GQLVr20DJbE4tvthDd6h1jwrmy5fSvhcG0tQployA+WrZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7427
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

On Tue, Nov 11, 2025 at 05:43:54PM +0100, Thomas Hellström wrote:
> If a device holds a reference on a foregin device's drm_pagemap,
> and a device unbind is executed on the foreign device,
> Typically that foreign device would evict its device-private
> pages and then continue its device-managed cleanup eventually
> releasing its drm device and possibly allow for module unload.
> However, since we're still holding a reference on a drm_pagemap,
> when that reference is released and the provider module is
> unloaded we'd execute out of undefined memory.
> 
> Therefore keep a reference on the provider device and module until
> the last drm_pagemap reference is gone.
> 
> Note that in theory, the drm_gpusvm_helper module may be unloaded
> as soon as the final module_put() of the provider driver module is
> executed, so we need to add a module_exit() function that waits
> for the work item executing the module_put() has completed.
> 
> v2:
> - Better commit message (Matt Brost)
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/drm_pagemap.c | 101 ++++++++++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_svm.c   |  15 ++++-
>  include/drm/drm_pagemap.h     |  10 +++-
>  3 files changed, 117 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 173b3ecb07d5..fb18a80d6a1c 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -8,6 +8,7 @@
>  #include <linux/pagemap.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_pagemap.h>
> +#include <drm/drm_print.h>
>  
>  /**
>   * DOC: Overview
> @@ -544,16 +545,92 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
>  	return -ENOMEM;
>  }
>  
> +static void drm_pagemap_dev_unhold_work(struct work_struct *work);
> +static LLIST_HEAD(drm_pagemap_unhold_list);
> +static DECLARE_WORK(drm_pagemap_work, drm_pagemap_dev_unhold_work);
> +
> +/**
> + * struct drm_pagemap_dev_hold - Struct to aid in drm_device release.
> + * @link: Link into drm_pagemap_unhold_list for deferred reference releases.
> + * @drm: drm device to put.
> + *
> + * When a struct drm_pagemap is released, we also need to release the
> + * reference it holds on the drm device. However, typically that needs
> + * to be done separately from a system-wide workqueue.
> + * Each time a struct drm_pagemap is initialized
> + * (or re-initialized if cached) therefore allocate a separate
> + * drm_pagemap_dev_hold item, from which we put the drm device and
> + * associated module.
> + */
> +struct drm_pagemap_dev_hold {
> +	struct llist_node link;
> +	struct drm_device *drm;
> +};
> +
>  static void drm_pagemap_release(struct kref *ref)
>  {
>  	struct drm_pagemap *dpagemap = container_of(ref, typeof(*dpagemap), ref);
> -
> +	struct drm_pagemap_dev_hold *dev_hold = dpagemap->dev_hold;
> +
> +	/*
> +	 * We know the pagemap provider is alive at this point, since
> +	 * the struct drm_pagemap_dev_hold holds a reference to the
> +	 * pagemap provider drm_device and its module.
> +	 */
> +	dpagemap->dev_hold = NULL;
>  	kfree(dpagemap);
> +	llist_add(&dev_hold->link, &drm_pagemap_unhold_list);
> +	schedule_work(&drm_pagemap_work);
> +	/*
> +	 * Here, either the provider device is still alive, since if called from
> +	 * page_free(), the caller is holding a reference on the dev_pagemap,
> +	 * or if called from drm_pagemap_put(), the direct caller is still alive.
> +	 * This ensures we can't race with THIS module unload.
> +	 */
> +}
> +
> +static void drm_pagemap_dev_unhold_work(struct work_struct *work)
> +{
> +	struct llist_node *node = llist_del_all(&drm_pagemap_unhold_list);
> +	struct drm_pagemap_dev_hold *dev_hold, *next;
> +
> +	/*
> +	 * Deferred release of drm_pagemap provider device and module.
> +	 * THIS module is kept alive during the release by the
> +	 * flush_work() in the drm_pagemap_exit() function.
> +	 */
> +	llist_for_each_entry_safe(dev_hold, next, node, link) {
> +		struct drm_device *drm = dev_hold->drm;
> +		struct module *module = drm->driver->fops->owner;
> +
> +		drm_dbg(drm, "Releasing reference on provider device and module.\n");
> +		drm_dev_put(drm);
> +		module_put(module);
> +		kfree(dev_hold);
> +	}
> +}
> +
> +static struct drm_pagemap_dev_hold *
> +drm_pagemap_dev_hold(struct drm_pagemap *dpagemap)
> +{
> +	struct drm_pagemap_dev_hold *dev_hold;
> +	struct drm_device *drm = dpagemap->drm;
> +
> +	dev_hold = kzalloc(sizeof(*dev_hold), GFP_KERNEL);
> +	if (!dev_hold)
> +		return ERR_PTR(-ENOMEM);
> +
> +	init_llist_node(&dev_hold->link);
> +	dev_hold->drm = drm;
> +	(void)try_module_get(drm->driver->fops->owner);
> +	drm_dev_get(drm);
> +
> +	return dev_hold;
>  }
>  
>  /**
>   * drm_pagemap_create() - Create a struct drm_pagemap.
> - * @dev: Pointer to a struct device providing the device-private memory.
> + * @drm: Pointer to a struct drm_device providing the device-private memory.
>   * @pagemap: Pointer to a pre-setup struct dev_pagemap providing the struct pages.
>   * @ops: Pointer to the struct drm_pagemap_ops.
>   *
> @@ -563,20 +640,28 @@ static void drm_pagemap_release(struct kref *ref)
>   * Error pointer on error.
>   */
>  struct drm_pagemap *
> -drm_pagemap_create(struct device *dev,
> +drm_pagemap_create(struct drm_device *drm,
>  		   struct dev_pagemap *pagemap,
>  		   const struct drm_pagemap_ops *ops)
>  {
>  	struct drm_pagemap *dpagemap = kzalloc(sizeof(*dpagemap), GFP_KERNEL);
> +	struct drm_pagemap_dev_hold *dev_hold;
>  
>  	if (!dpagemap)
>  		return ERR_PTR(-ENOMEM);
>  
>  	kref_init(&dpagemap->ref);
> -	dpagemap->dev = dev;
> +	dpagemap->drm = drm;
>  	dpagemap->ops = ops;
>  	dpagemap->pagemap = pagemap;
>  
> +	dev_hold = drm_pagemap_dev_hold(dpagemap);
> +	if (IS_ERR(dev_hold)) {
> +		kfree(dpagemap);
> +		return ERR_CAST(dev_hold);
> +	}
> +	dpagemap->dev_hold = dev_hold;
> +
>  	return dpagemap;
>  }
>  EXPORT_SYMBOL(drm_pagemap_create);
> @@ -937,3 +1022,11 @@ int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  	return err;
>  }
>  EXPORT_SYMBOL(drm_pagemap_populate_mm);
> +
> +static void drm_pagemap_exit(void)
> +{
> +	flush_work(&drm_pagemap_work);
> +	if (WARN_ON(!llist_empty(&drm_pagemap_unhold_list)))
> +		disable_work_sync(&drm_pagemap_work);
> +}
> +module_exit(drm_pagemap_exit);
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index a3f97cf9c254..aab939fbcf80 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -1436,7 +1436,7 @@ xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
>  			  unsigned int order,
>  			  enum dma_data_direction dir)
>  {
> -	struct device *pgmap_dev = dpagemap->dev;
> +	struct device *pgmap_dev = dpagemap->drm->dev;
>  	enum drm_interconnect_protocol prot;
>  	dma_addr_t addr;
>  
> @@ -1456,6 +1456,14 @@ static const struct drm_pagemap_ops xe_drm_pagemap_ops = {
>  	.populate_mm = xe_drm_pagemap_populate_mm,
>  };
>  
> +static void xe_devm_release(void *data)
> +{
> +	struct xe_vram_region *vr = data;
> +
> +	drm_pagemap_put(vr->dpagemap);
> +	vr->dpagemap = NULL;
> +}
> +
>  /**
>   * xe_devm_add: Remap and provide memmap backing for device memory
>   * @tile: tile that the memory region belongs to
> @@ -1481,7 +1489,7 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
>  		return ret;
>  	}
>  
> -	vr->dpagemap = drm_pagemap_create(dev, &vr->pagemap,
> +	vr->dpagemap = drm_pagemap_create(&xe->drm, &vr->pagemap,
>  					  &xe_drm_pagemap_ops);
>  	if (IS_ERR(vr->dpagemap)) {
>  		drm_err(&xe->drm, "Failed to create drm_pagemap tile %d memory: %pe\n",
> @@ -1489,6 +1497,9 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
>  		ret = PTR_ERR(vr->dpagemap);
>  		goto out_no_dpagemap;
>  	}
> +	ret = devm_add_action_or_reset(dev, xe_devm_release, vr);
> +	if (ret)
> +		goto out_no_dpagemap;
>  
>  	vr->pagemap.type = MEMORY_DEVICE_PRIVATE;
>  	vr->pagemap.range.start = res->start;
> diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> index 2c7de928865b..5cfe54331ba7 100644
> --- a/include/drm/drm_pagemap.h
> +++ b/include/drm/drm_pagemap.h
> @@ -9,6 +9,7 @@
>  #define NR_PAGES(order) (1U << (order))
>  
>  struct drm_pagemap;
> +struct drm_pagemap_dev_hold;
>  struct drm_pagemap_zdd;
>  struct device;
>  
> @@ -130,14 +131,17 @@ struct drm_pagemap_ops {
>   * used for device p2p handshaking.
>   * @ops: The struct drm_pagemap_ops.
>   * @ref: Reference count.
> - * @dev: The struct drevice owning the device-private memory.
> + * @drm: The struct drm device owning the device-private memory.
>   * @pagemap: Pointer to the underlying dev_pagemap.
> + * @dev_hold: Pointer to a struct drm_pagemap_dev_hold for
> + * device referencing.
>   */
>  struct drm_pagemap {
>  	const struct drm_pagemap_ops *ops;
>  	struct kref ref;
> -	struct device *dev;
> +	struct drm_device *drm;
>  	struct dev_pagemap *pagemap;
> +	struct drm_pagemap_dev_hold *dev_hold;
>  };
>  
>  struct drm_pagemap_devmem;
> @@ -206,7 +210,7 @@ struct drm_pagemap_devmem_ops {
>  			   unsigned long npages);
>  };
>  
> -struct drm_pagemap *drm_pagemap_create(struct device *dev,
> +struct drm_pagemap *drm_pagemap_create(struct drm_device *drm,
>  				       struct dev_pagemap *pagemap,
>  				       const struct drm_pagemap_ops *ops);
>  
> -- 
> 2.51.1
> 
