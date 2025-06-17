Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50183ADD922
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 19:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C7410E3E6;
	Tue, 17 Jun 2025 17:03:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C+HG4mdC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AFC310E03B;
 Tue, 17 Jun 2025 17:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750179799; x=1781715799;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xPtBVrrEtKhwR5giuZHnQ/Ura7Q/qdlSvuwpqnVUplQ=;
 b=C+HG4mdC56u5LStHzNRjKpf61ZJRkgfRP4lwt5e/sHW4berNtl8bLUon
 LKeYWN6GDvZFya1gFhtkQbyIsKUSMogL1K3NB7+B+j3DRxbjzPrunq0T+
 hAA+efzVqERdXZU85NT1ikJAdqGkY/km4AH5Z6t8WjsQzx9c59PEdLs9r
 FprkqKFOa2zkWu5G7QExvuhOXTmum2tySa0FgiTQV5Gjk4UUUfdiopVJD
 1ichceh0IU7fRxEJnrVfu4C6KEKyW2ElA4ZyxYaSpO43l3jFBTPk2QZpl
 c1erzqf0j4HRqWliUfMF8HmoOyOXfhOVVo9PixxSgzvKpsOeCiC97vdRg Q==;
X-CSE-ConnectionGUID: adpdLDLZSPK8MZn6mA52Ng==
X-CSE-MsgGUID: vT3Y/mEbQhG4CuZbKHgpoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="56181274"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="56181274"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 10:03:17 -0700
X-CSE-ConnectionGUID: ZYyJ6OY6RPecmAJ3FFR1gg==
X-CSE-MsgGUID: Rpm8qdDLSya9+T4pvsfaGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="149214117"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 10:03:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 10:03:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 10:03:11 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.78)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 10:02:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFb/h8woMx9+9/PjISzQwD/aCCBDxygrqoS3hACm/uyz5FeaCo0bu6oaGW7Ry9iH2QwLx4x6ZaXx+AxEJPr1lZ1UMSe1rcYbxKuy7xaSUqrMvNaOUWFO0xXWxsKXHaAOzAuJxqLzFjOxmyht04e1yk2Rm/XUrkizRJ0RJjY00JeIHAMqvMrj3dK8/EA+maTiYeIJfdOWW3JO+1F4NGw5j/nHaUo1syLLTDuUzNyNP7qcznwGtiW41DW84kmyJ9Y378w6sOBbQYzEp8hoJPfVj6hfXV7zPgz5eNYvL/hbLvJTRbkPiTZ5nELCZEOEHTcaPpPoG4v9plX4Tb3fSx8uMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BeFCGOiw4kxX8OtX+1gMShPmmgZiDTKgKhxvrmcoSAI=;
 b=WnwUm+IEKt7Ft6sTijcAsLUV/CdTsl/2/uSl81PsL+zl6G6QXOP2Ive/gMsjNOnnslk4AOJl2shEIUeVKWOfFgKBdB3e2CU6HyNibNEyL6sQLW+LJmKT1TdvlswKfatNDlYpkcY3ms4RwMOdXZdA0pEG6ZyraVHwlBWpvqzky7/Px5EGxbe6zBaBGpCPy9inQ7DU52gn0pK/57usaVQHBhxuIfCcWSIO32tMtqwRU0LUSyZ2c9omsd2iXYgixnd+xIEPRiEhqPjVO2YCtYDsGCWSdiRt8QtNcOX3LMLIM9Lznp1EkR1Rl2e3rN41MuD4caA2+BlX8LFW58RY0wkBgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CY8PR11MB7685.namprd11.prod.outlook.com (2603:10b6:930:73::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 17:02:40 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%7]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 17:02:40 +0000
Date: Tue, 17 Jun 2025 10:04:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <apopple@nvidia.com>, <airlied@gmail.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, Felix =?iso-8859-1?Q?K=FChling?=
 <felix.kuehling@amd.com>, Philip Yang <philip.yang@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v3 1/3] drm/gpusvm, drm/pagemap: Move migration
 functionality to drm_pagemap
Message-ID: <aFGgD3BpT4yLwhGg@lstrano-desk.jf.intel.com>
References: <20250613140219.87479-1-thomas.hellstrom@linux.intel.com>
 <20250613140219.87479-2-thomas.hellstrom@linux.intel.com>
 <93e663cf-01e7-4241-89ea-3bdda3d19437@intel.com>
 <f08ed0c71c8f193bbf09888e14d0171802415dcf.camel@linux.intel.com>
 <e4d37eb0-ec91-47c5-b888-0b5bbb74db84@intel.com>
 <5da4b6f81517a6c091411a92e1c9d3fd5b902dba.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5da4b6f81517a6c091411a92e1c9d3fd5b902dba.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0206.namprd04.prod.outlook.com
 (2603:10b6:303:86::31) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CY8PR11MB7685:EE_
X-MS-Office365-Filtering-Correlation-Id: f26769cf-43c5-4f76-877b-08ddadc0c480
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Rqrebl2vnKnVxAj0Jh+3a1ai/TEB/dcsY4RTRaHOTHNGGsNtkjuFMurLhK?=
 =?iso-8859-1?Q?NyBcrq10A5VQJTXZHRz4NiUqdl2BC1QtHh6omOfvrnPe2fHf8bpq2kW5L/?=
 =?iso-8859-1?Q?yvy5rDPfl4u8P8OLTwkMU4z8Cv7FYTRYJ1fFrcznEThiTTshKtbjlZF+Hi?=
 =?iso-8859-1?Q?Swe4ys61gUYZEL34OAbAyKnYuhaJTrczUxbQlUx2arr3q9L6eJta0eU3W3?=
 =?iso-8859-1?Q?hExUSg/5vG8+V0AHGNS34YxUFHslvqaMiBYTjZeHVjWEFCbaudmZCFfMuu?=
 =?iso-8859-1?Q?4Z3AQc3aqvjFDsbinHvkZ6HUYZPM1WikfoOVfApNYdWBx7YO+oCpbyeQpF?=
 =?iso-8859-1?Q?S+Bk0wPnhEx4CbeRmNmpWs4xAeR+T/biqZUaYbulERfUFgQLel+sslcVM0?=
 =?iso-8859-1?Q?uSgUfdLbLeFyG9VTkdAT5pm8imbUfvfjBiXf2awtbvtV509nPb3dFxmW7P?=
 =?iso-8859-1?Q?CIzKOeRCADOcj7d+GHKsZ0QoooTM4Rvhv3dZnhtopyK5glsJ8Jltfp2yKa?=
 =?iso-8859-1?Q?9DYQ9jSyE9KrsxC1NdtYR/+vMe2qTsA5yakOtLEtrBN4Qjx4NdNLjks94b?=
 =?iso-8859-1?Q?Kz4a8A+sJvKbtGHZOdCQTexplrH51COCyGITRvHgYXrCLA9cMhArKYEW23?=
 =?iso-8859-1?Q?OA7KwAeiVFtPQGE4+M+QiSTHsUYQeSXuLmjahSPMpPboRWlX4NiDMFfYlC?=
 =?iso-8859-1?Q?GzJO5OFoRLNA8kls6WytCZ9kT7MjAgt31R1AjfrcACeLtTjQpmEImW30+l?=
 =?iso-8859-1?Q?JbgTCEjg4Hy1Ghg4zjP0WDyNQLMY4hNBMiJOtRsU7qhO2oCTHz2x9Ood6+?=
 =?iso-8859-1?Q?aTwYehgWADZt9mDaaf2UEx7b1y9J0mZ2p1suOrkWB1TuY6ifekfBE993eZ?=
 =?iso-8859-1?Q?EI77FaDHCD6RZkBVe7FP/QlQc5jbtk5a+gLyFZgGkbw/QnAM9im2NdeBeR?=
 =?iso-8859-1?Q?HhGnlqnyFVejcupGHl1VjHQZNqspXvysGXGFvnPZPtDncSsfhFIzNR3yTz?=
 =?iso-8859-1?Q?D/fDmBMjps/16Lg937k/wlQZqVDZ18u66shLxKZHUgrq/XAX/hAb4UuPl9?=
 =?iso-8859-1?Q?Zlb0EXGdGvulgQWYkKQw7fJjmqsLuPyiz/P8ARwFHGljYSZ4bCXUVeukuq?=
 =?iso-8859-1?Q?Suy2INUisNqCLoNj3TxoCdP3BtAIm/Fcv0j7neRv8H8U1++Uyfiy+ZA+Y2?=
 =?iso-8859-1?Q?SsyBOKeYHx7/qaL7IRtfJIrPKkt5Qaz8CHCngxHjZwj/3CkyfxGCcbULZP?=
 =?iso-8859-1?Q?SeNJGk+TAtnl6vouUYN7ddRwWFMGN6KRusw44hXiJFfk+H0UZrwcIcHl7N?=
 =?iso-8859-1?Q?SpO7O/Bc5zEOTRCnAFYDYAS1OjEdru7btWYcEJrIqoDODcylcD+pi3Nblq?=
 =?iso-8859-1?Q?4rrR149g2o/XquR8bV/GfQIwD/9fKgeRQ/cC3UhfqTqluvJwTaANkpgk8j?=
 =?iso-8859-1?Q?bFvY/m9+scTjAdWBJC5NOx4lZRg/ARu+jL4mfVwZpZh0B32df3eklT2b+4?=
 =?iso-8859-1?Q?M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?hpVnS3LjEpwnYWl5LJg3x9Xp/Bx52hf4iQc9LuZ3+1ZuiZZtshvXac/bKP?=
 =?iso-8859-1?Q?/TOPlWntGcG6ryJbp2Fbmm7sI5/+qXguhG0D9BrMn1eKpHcx5rNmcFGQW0?=
 =?iso-8859-1?Q?2zMHUJiIitH6ma9opTh92snLndGJAgdXYqZbT4gvvKBYVs6b4D5i6QAhZT?=
 =?iso-8859-1?Q?DG2+EYBhh9sM8gZR/jOIEBSjjijPMhlfJFDcng77+oLyq8IqHc9YH5miOL?=
 =?iso-8859-1?Q?Hy/1ZmVwmMwAHdZF9ASOVV63Rto4Fygb/4x7AZqgbHG9falQ4yRCGs/lDb?=
 =?iso-8859-1?Q?GpQyqVrCcLSQaMIO25vGLSGu8EsmyF6anA4alAO/MF0lHOLC4rtXlktPtT?=
 =?iso-8859-1?Q?Zp/OkQqdW622azjFepG/UuWZGleULuUVG4dCE2S5ParmccRu+pTWA++VMH?=
 =?iso-8859-1?Q?RljMnZjo5WiRlqlddIfhOa/oNWgDpi/FDShlYfECLyOa1IDnV19+ME4J4K?=
 =?iso-8859-1?Q?mFh/Xr7CO/83FXWB0LXBiKDnMV4VJOtyZAMVK4DTbIYICokq6mHoljiM6i?=
 =?iso-8859-1?Q?TSPMCqOycllAPCuOBbNAkWMGAjK0D5DoOzNnGtpdzGVkvNW/Ab7WXgbtYu?=
 =?iso-8859-1?Q?Zm/XdPWHhZtX1jLlSi5VXZB3Ym2imYyJi5oNx5fp7s7iY9iesSpR6rfOLY?=
 =?iso-8859-1?Q?fa4xCizqZBiW1yc27MMRN1OcYkvAtjZtdjnlLXJDQZdusIpYQPxuoO30wY?=
 =?iso-8859-1?Q?J39QHqkFEqbasJQ5SfRHdg/Hcy5Qx3BJ6DsxY8QMCSTYacGAeKvJIl73Ev?=
 =?iso-8859-1?Q?sFkwy8XjxQ6SfIITu80EpCdygGFErUp52GeKb0NrSoW876G55ci2XpjqGI?=
 =?iso-8859-1?Q?GGS1yZzFLOspAiMyfHhR/rhwdSN88JWCdnSFJv8jNN1jUAL1UZVj8Yrvlz?=
 =?iso-8859-1?Q?IOwTrJyWc/yxLWruNfan0zeTVgl1OM1eNB5Fp0Ke1hhrV75Y7JggAM5UCB?=
 =?iso-8859-1?Q?Ac82XIn6+bx8UM6Ustw+83jcX+SZ0TXmSK3VTgFbQKPxq38tiZWaJmJTGG?=
 =?iso-8859-1?Q?Jt7AooKimpbHgh6WfKugqlTbvKVAMmqEiVzI+4ATH6RO9aa0dPpOFsXQPn?=
 =?iso-8859-1?Q?pvmrId0PILa/knGMoOfw6G3c8XEFteQ8UjRjn/GU705/hsWW+fDGKMIdgx?=
 =?iso-8859-1?Q?hdG5ij7N9J9rG1dzF8TQ8/bt9Jsc3qIiDjNbFdZH1/WgjoRl6WJjcUQokd?=
 =?iso-8859-1?Q?GyR7U72IWV97ZxJYBuTL4Qfacl98Q5U0Gpiay3U9I8ah6FV0wl+6FykJ/w?=
 =?iso-8859-1?Q?oMbAfzyO5ASsYq2yjl3//L0hH9qLgucGsmo7LGUSq0TNuM6ZGizzRg8rnT?=
 =?iso-8859-1?Q?iSs+0gGVbUVSHFsuFijSo4eQxbcmNFL5qlJFkMgUXvcCrHtMiCtSfBHWiX?=
 =?iso-8859-1?Q?LE1rYQCfRoe2oufh6r5k7ik/pgHojceKA1LffnXZyBsj6DC80gHq475Ya/?=
 =?iso-8859-1?Q?obuMA1l087LGibIUZiCgDRH8+6V+Yr9VbdtNbQeha6AWgnGIqixDJAcInO?=
 =?iso-8859-1?Q?SCWgMCuEZqa0EDJnPMGnOFXmKwMgxziukOikUO3oxV9vdL0vqyX4ThUwgI?=
 =?iso-8859-1?Q?DW5bJgyADpWwJvdn4bxTJvfdqMMVc+M6yCyyk5KaQNMr/UHv2DPZ5VdIei?=
 =?iso-8859-1?Q?jJWN41c2uYnwvCH/0nqmGc6ITnYS7PvGPSqQaPIWRjIAKsyAqTBWbpsg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f26769cf-43c5-4f76-877b-08ddadc0c480
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 17:02:40.2682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5VwUkIdGJFBBmMIjW0cQwwnKUlKg/ACG43NcFq3l+sNSr72aQL47zt+XLbREbCHrZIjq9zuiCSgo6XSbc2RppA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7685
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

On Tue, Jun 17, 2025 at 04:55:26PM +0200, Thomas Hellström wrote:
> On Tue, 2025-06-17 at 20:17 +0530, Ghimiray, Himal Prasad wrote:
> > 
> > 
> > On 17-06-2025 18:41, Thomas Hellström wrote:
> > > On Tue, 2025-06-17 at 18:25 +0530, Ghimiray, Himal Prasad wrote:
> > > > 
> > > > 
> > > > On 13-06-2025 19:32, Thomas Hellström wrote:
> > > > > From: Matthew Brost <matthew.brost@intel.com>
> > > > > 
> > > > > The migration functionality and track-keeping of per-pagemap
> > > > > VRAM
> > > > > mapped to the CPU mm is not per GPU_vm, but rather per pagemap.
> > > > > This is also reflected by the functions not needing the
> > > > > drm_gpusvm
> > > > > structures. So move to drm_pagemap.
> > > > > 
> > > > > With this, drm_gpusvm shouldn't really access the page zone-
> > > > > device-
> > > > > data
> > > > > since its meaning is internal to drm_pagemap. Currently it's
> > > > > used
> > > > > to
> > > > > reject mapping ranges backed by multiple drm_pagemap
> > > > > allocations.
> > > > > For now, make the zone-device-data a void pointer.
> > > > > 
> > > > > Alter the interface of drm_gpusvm_migrate_to_devmem() to ensure
> > > > > we
> > > > > don't
> > > > > pass a gpusvm pointer.
> > > > > 
> > > > > Rename CONFIG_DRM_XE_DEVMEM_MIRROR to CONFIG_DRM_XE_PAGEMAP.
> > > > > 
> > > > > Matt is listed as author of this commit since he wrote most of
> > > > > the
> > > > > code,
> > > > > and it makes sense to retain his git authorship.
> > > > > Thomas mostly moved the code around.
> > > > 
> > > > > 
> > > > > v3:
> > > > > - Kerneldoc fixes (CI)
> > > > > - Don't update documentation about how the drm_pagemap
> > > > >     migration should be interpreted until upcoming
> > > > >     patches where the functionality is implemented.
> > > > >     (Matt Brost)
> > > > > 
> > > > > Co-developed-by: Thomas Hellström
> > > > > <thomas.hellstrom@linux.intel.com>
> > > > > Signed-off-by: Thomas Hellström
> > > > > <thomas.hellstrom@linux.intel.com>
> > > > > ---
> > > > >    Documentation/gpu/rfc/gpusvm.rst     |  12 +-
> > > > >    drivers/gpu/drm/Makefile             |   6 +-
> > > > >    drivers/gpu/drm/drm_gpusvm.c         | 759 +----------------
> > > > > -----
> > > > > ----
> > > > >    drivers/gpu/drm/drm_pagemap.c        | 788
> > > > > +++++++++++++++++++++++++++
> > > > >    drivers/gpu/drm/xe/Kconfig           |  10 +-
> > > > >    drivers/gpu/drm/xe/xe_bo_types.h     |   2 +-
> > > > >    drivers/gpu/drm/xe/xe_device_types.h |   2 +-
> > > > >    drivers/gpu/drm/xe/xe_svm.c          |  47 +-
> > > > >    include/drm/drm_gpusvm.h             |  96 ----
> > > > >    include/drm/drm_pagemap.h            | 101 ++++
> > > > >    10 files changed, 950 insertions(+), 873 deletions(-)
> > > > >    create mode 100644 drivers/gpu/drm/drm_pagemap.c
> > > > > 
> > > > > diff --git a/Documentation/gpu/rfc/gpusvm.rst
> > > > > b/Documentation/gpu/rfc/gpusvm.rst
> > > > > index bcf66a8137a6..469db1372f16 100644
> > > > > --- a/Documentation/gpu/rfc/gpusvm.rst
> > > > > +++ b/Documentation/gpu/rfc/gpusvm.rst
> > > > > @@ -73,15 +73,21 @@ Overview of baseline design
> > > > >    .. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
> > > > >       :doc: Locking
> > > > >    
> > > > > -.. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
> > > > > -   :doc: Migration
> > > > > -
> > > > >    .. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
> > > > >       :doc: Partial Unmapping of Ranges
> > > > >    
> > > > >    .. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
> > > > >       :doc: Examples
> > > > >    
> > > > > +Overview of drm_pagemap design
> > > > > +==============================
> > > > > +
> > > > > +.. kernel-doc:: drivers/gpu/drm/drm_pagemap.c
> > > > > +   :doc: Overview
> > > > > +
> > > > > +.. kernel-doc:: drivers/gpu/drm/drm_pagemap.c
> > > > > +   :doc: Migration
> > > > > +
> > > > >    Possible future design features
> > > > >    ===============================
> > > > >    
> > > > > diff --git a/drivers/gpu/drm/Makefile
> > > > > b/drivers/gpu/drm/Makefile
> > > > > index 5050ac32bba2..4dafbdc8f86a 100644
> > > > > --- a/drivers/gpu/drm/Makefile
> > > > > +++ b/drivers/gpu/drm/Makefile
> > > > > @@ -104,7 +104,11 @@ obj-$(CONFIG_DRM_PANEL_BACKLIGHT_QUIRKS)
> > > > > +=
> > > > > drm_panel_backlight_quirks.o
> > > > >    #
> > > > >    obj-$(CONFIG_DRM_EXEC) += drm_exec.o
> > > > >    obj-$(CONFIG_DRM_GPUVM) += drm_gpuvm.o
> > > > > -obj-$(CONFIG_DRM_GPUSVM) += drm_gpusvm.o
> > > > > +
> > > > > +drm_gpusvm_helper-y := \
> > > > > +	drm_gpusvm.o\
> > > > > +	drm_pagemap.o
> > > > > +obj-$(CONFIG_DRM_GPUSVM) += drm_gpusvm_helper.o
> > > > >    
> > > > >    obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
> > > > >    
> > > > > diff --git a/drivers/gpu/drm/drm_gpusvm.c
> > > > > b/drivers/gpu/drm/drm_gpusvm.c
> > > > > index 7ff81aa0a1ca..ef81381609de 100644
> > > > > --- a/drivers/gpu/drm/drm_gpusvm.c
> > > > > +++ b/drivers/gpu/drm/drm_gpusvm.c
> > > > > @@ -8,10 +8,9 @@
> > > > >    
> > > > >    #include <linux/dma-mapping.h>
> > > > >    #include <linux/hmm.h>
> > > > > +#include <linux/hugetlb_inline.h>
> > > > >    #include <linux/memremap.h>
> > > > > -#include <linux/migrate.h>
> > > > >    #include <linux/mm_types.h>
> > > > > -#include <linux/pagemap.h>
> > > > >    #include <linux/slab.h>
> > > > >    
> > > > >    #include <drm/drm_device.h>
> > > > > @@ -107,21 +106,6 @@
> > > > >     * to add annotations to GPU SVM.
> > > > >     */
> > > > >    
> > > > > -/**
> > > > > - * DOC: Migration
> > > > > - *
> > > > > - * The migration support is quite simple, allowing migration
> > > > > between RAM and
> > > > > - * device memory at the range granularity. For example, GPU
> > > > > SVM
> > > > > currently does
> > > > > - * not support mixing RAM and device memory pages within a
> > > > > range.
> > > > > This means
> > > > > - * that upon GPU fault, the entire range can be migrated to
> > > > > device
> > > > > memory, and
> > > > > - * upon CPU fault, the entire range is migrated to RAM. Mixed
> > > > > RAM
> > > > > and device
> > > > > - * memory storage within a range could be added in the future
> > > > > if
> > > > > required.
> > > > > - *
> > > > > - * The reasoning for only supporting range granularity is as
> > > > > follows: it
> > > > > - * simplifies the implementation, and range sizes are driver-
> > > > > defined and should
> > > > > - * be relatively small.
> > > > > - */
> > > > > -
> > > > >    /**
> > > > >     * DOC: Partial Unmapping of Ranges
> > > > >     *
> > > > > @@ -193,10 +177,9 @@
> > > > >     *		if (driver_migration_policy(range)) {
> > > > >     *			mmap_read_lock(mm);
> > > > >     *			devmem = driver_alloc_devmem();
> > > > > - *			err =
> > > > > drm_gpusvm_migrate_to_devmem(gpusvm,
> > > > > range,
> > > > > - *							
> > > > > devmem_allocation,
> > > > > - *							  
> > > > > &ctx);
> > > > > - *			mmap_read_unlock(mm);
> > > > > + *			err =
> > > > > drm_pagemap_migrate_to_devmem(devmem, gpusvm->mm, gpuva_start,
> > > > > + *
> > > > > gpuva_end, driver_pgmap_owner());
> > > > 
> > > > 
> > > > 
> > > > fix doc passing timeslice as parameter.
> > > 
> > > Will fix.
> > > 
> > > > 
> > > 
> > > 8<-----------------------------------------------------------------
> > > ----
> > > > > +/**
> > > > > + * drm_pagemap_migrate_to_devmem() - Migrate a struct
> > > > > mm_struct
> > > > > range to device memory
> > > > > + * @devmem_allocation: The device memory allocation to migrate
> > > > > to.
> > > > > + * The caller should hold a reference to the device memory
> > > > > allocation,
> > > > > + * and the reference is consumed by this function unless it
> > > > > returns with
> > > > > + * an error.
> > > > > + * @mm: Pointer to the struct mm_struct.
> > > > > + * @start: Start of the virtual address range to migrate.
> > > > > + * @end: End of the virtual address range to migrate.
> > > > > + * @timeslice_ms: The time requested for the migrated pages to
> > > > > + * be present in the cpu memory map before migrated back.

As Himal suggests and see below...

s/cpu/gpu

> > > > 
> > > > Shouldn't this be present in gpu or cpu memory map ? We are using
> > > > this
> > > > to ensure pagefault can be handled effectively by ensuring pages
> > > > remain
> > > > in vram here for prescribed time too.
> > > 
> > > So with this split, drm_pagemap is responsible for migrating memory
> > > and
> > > updating the CPU memory map only, whereas drm_gpusvm is responsible
> > > for
> > > setting up the GPU memory maps. So if it remains in the CPU memory
> > > map,
> > > then nothing will force the gpu vms to invalidate, unless the gpu
> > > driver decides to invalidate itself.
> > 
> > Thats true.
> > 
> > > 
> > > But looking at this i should probably rephrase "before migrated
> > > back"
> > > to "before being allowed to be migrated back".
> > 
> > The confusion for me is that timeslice_ms does not represent the time
> > pages are required to stay in the CPU memory map, but rather the time
> > they must remain in the GPU memory map. We defer migrate_to_smem
> > until 
> > this timeslice has expired.

Ideally, we'd want the timeslice to ensure CPU residency as well. The
issue arises because the timeslice is attached to the physical memory
(drm_gpusvm_devmem), which is not readily available on the GPU fault
handling side. UMD testing showed that ensuring CPU residency is not
required for atomics to work, so this part of the implementation was
left out. We can revisit and find a solution here if it turns out to be
required.

For now, I'd fix the kernel doc above (s/cpu/gpu) with my suggestion and
perhaps put in a comment why we don't wait on the GPU fault side.

Matt

> 
> Yeah, although drm_pagemap is not aware of any gpu memory map so it
> would be incorrect to bring that up in the api docs. Could add some
> discussion, though, that "this could be used to..." and give the
> typical gpu use-case?
> 
> Thanks,
> Thomas
> 
