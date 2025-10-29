Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E31DC1C459
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 17:54:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3643010E205;
	Wed, 29 Oct 2025 16:54:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="flM6gME9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3588E10E205
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 16:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761756894; x=1793292894;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9HBfzwTj5S2x+97Td98EFyGXtvx5tt0OFIx+ahoCPog=;
 b=flM6gME9fA4EWvZqewPDgXTUj7iVANIU7TM0r3RzUvyq8zxJoOUQicy8
 570NEt1u25kWt1sZm+dttaMQVNFK35GxgVeWIJTmRBBHdmunSLbxpJLgf
 V/X2RNYHNDXRprGnnoWwIAJA/yKAvKtRcK5sW8sjTHSDhgIyYfLBdUzYG
 XA4ir71qRMpogeT0b9RlmVZGoki6UtFzY/AcYCAZg9PV0XRceEhBP1Gzm
 ELSNifz7cIziCy+Z8s+s7tkkbm0KbIn01OqMAXnTi3vIRIoSR+1nVELGo
 IvHKoiuZ5Bbg14LAwI2wbPZdPx++Eipy+YEoVhUL/m8ucT9I10mnWNOJ8 w==;
X-CSE-ConnectionGUID: /bZzSQixTmCerhrTb3oY/A==
X-CSE-MsgGUID: ilRX0U1XT/GIdLiWmvNGdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="81515493"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="81515493"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 09:54:53 -0700
X-CSE-ConnectionGUID: uGQkI/BXRyaz14aXI3shKg==
X-CSE-MsgGUID: PouqlG/5SXyl8f6AaSISVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="185364379"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 09:54:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 09:54:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 09:54:52 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.61) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 09:54:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QUaqbCvdnwiOHt8xcqS6vUt3zbs9wKPHo5mDxRACXu7zVwSiCSvissa8bvpELNnlJsJOdT6Rg0TSTh1kwoT+DWiRlXb297Q+zN9NQ0o6ECZ/xgHIgGLLYyHhh0cK+XQG84u6uCFGPpy/U3SkRZ9lDEHu7clzuFKW/sqP3UrF6QWi+lJqCb98FDywjFIKN3m2kWfR03o19YIm/JApfFAWzbXnwGPZde0bV5HFcSNGwwLwKne4tuFDuyR9XOjHihAsRQXc0bI1X5HrflZobqjdsw6h1jyMP8EtN+0jOhNtrHH6ZDd8Gfpsuw5307Rn5eX/QYCSBkoBeyNZPPmYa+SFsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+MCBLalVwbfgBaPYbzByNwenxRyWFVl4EYLdrLAEIM=;
 b=hS+KiR5BA6dqMs+M/Dy7BMpnvPXabUUzZ+nnjdh3pX7xoQcRzi+5fdxambi3KODskDrQA5h3/hrDjyi93wK0elYm7GRGkhtmrIQVxVrikoaJuYHS2glF1QoViXzyfAcce//77ZqHEb0BKrp7PKOzzWkcbyQMsnd3QUUbaRcNZxRGHssYCoe8cEN4TCdAND9vXQwV32rxrsPCdYlcEgAbv19oelTw5r2XvibYiCfjxRECWD9VdYCbtEskXNj8HzgP3RDA3BqEqQyUTGcbeQMiVOUYsdpWNyqv9f7W8GHAK/MmUynuBt66FBrmSo/TKdn5QGjy6RPnuD0ZFlEOrQNdqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA4PR11MB9249.namprd11.prod.outlook.com (2603:10b6:208:55f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Wed, 29 Oct
 2025 16:54:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Wed, 29 Oct 2025
 16:54:50 +0000
Date: Wed, 29 Oct 2025 09:54:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Philipp Stanner <phasta@kernel.org>
CC: Danilo Krummrich <dakr@kernel.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, <tursulin@ursulin.net>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] drm/sched: Fix comment in drm_sched_run_job_work()
Message-ID: <aQJG1/izCBbNnX0a@lstrano-desk.jf.intel.com>
References: <20251028134602.94125-2-phasta@kernel.org>
 <20251028134602.94125-3-phasta@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251028134602.94125-3-phasta@kernel.org>
X-ClientProxiedBy: BYAPR01CA0062.prod.exchangelabs.com (2603:10b6:a03:94::39)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA4PR11MB9249:EE_
X-MS-Office365-Filtering-Correlation-Id: 7efd599a-db35-47d1-a9da-08de170bdf7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JhajLcR9kE2YLpADgbmvWkE2t9Bu/wsDGgnH2E+L6c+5DyOSGLGNz8qE0ufo?=
 =?us-ascii?Q?dqTnAGDsY16A+16Gl/v3rexEVNLEkDtTFLfBdmou4YFekJ04vztd3WryO+xH?=
 =?us-ascii?Q?TvAKxX++XFgAojjDtpe0ltWTIOROAz8XWnkpy8Gbqt1i9636XzMjtHVs30pv?=
 =?us-ascii?Q?QEi1S4ndXQKj55GIH5XWkn9ZmcUHKjnEmL0MukYvUEapg6xfyvCVNu2GckCz?=
 =?us-ascii?Q?J04IB9oouZB4zTH/TZZz8+JNTUPJvYAYS0oh3Uoh/l7Qzgkza3225rkdRH4S?=
 =?us-ascii?Q?z7sDeTcdAy/D2qyeLZabMQSti3/y9IRUQT5Etn0iAzeDsovhvzhhYslu+uyK?=
 =?us-ascii?Q?kX9i3Y9exzsfwqhir1jcbg2C4Dx2T92Gep7CheFlipd2WC6X5KKNZ74C1Jbo?=
 =?us-ascii?Q?3rhI/lFvgNA6ppcn0L2U5wuXGjimOdiGTbi3Psql6jwUuwI88AZslFh5+J0L?=
 =?us-ascii?Q?MeH62bAv0VsJRrtylGI3uFVUm6G9q22B10lUKK4GK3V5cNU0ZMG2cYV5w6G6?=
 =?us-ascii?Q?+3Qr+CllSvnORw0Pa7kuQqAlW+c2vyVHlKyFSrwjRt1Bi0/HmvRMJSOnGBkj?=
 =?us-ascii?Q?8JKteX9W+9vJuFZRjZ7A2n652XpmLP68C7kKhNTXv5X5ERYDMOus8nLyB0td?=
 =?us-ascii?Q?VOO9rGvH3jzIAquFHQ3wyX1lp0prnoQ6EybW8Y3wy1cEf1BkLBMhireyEsu9?=
 =?us-ascii?Q?5QQ/ejOwfHAvpQR24xcrfj8WFqKNIxCkPK7TGSFoYpLFt40PdlKKbwSEU85K?=
 =?us-ascii?Q?DcGOBkMPfDR8dzigykikd9hi7+fPEXscB4uTPmrDDlSq9FrLpiNVd6d6EHQQ?=
 =?us-ascii?Q?EszG47aBVT+j+YxIbsZmktm9R+dD7XrQA6RoSpKoEt7Zg3W0aoCbNifIQDhj?=
 =?us-ascii?Q?3yA1qXDuhmLwylYNZrqqabg7H32WiQjxqoFoarpdKJr+qvT9/cO2HKwlY1Mv?=
 =?us-ascii?Q?ReRvP0n7qHM75CBt7jr4QsPY0pKjWz8PHklf+pkp377PggdVqmj5MTacMcC4?=
 =?us-ascii?Q?EKfQ+HqaFKvge84eOH36xN9oIdwSKrj53xqKPKpfvfgEnWPMc7C78lKcvMG+?=
 =?us-ascii?Q?dDoho5zSCuGJYuTI2KL8CD/AYPNemTBIr/T7tTsR/TbKPdhpkxd9zx8fAqIE?=
 =?us-ascii?Q?SvBlJtMj+SJtXQu0GWctQ89plYBmnsFZXaACDFDbg8rkpAU5rW7PV2DICISu?=
 =?us-ascii?Q?DtAzesFo8O009QXtyqJnFl/Sav7UpMc1qhTGdEPxS6PHUZ8OW3IiLoBoD9vU?=
 =?us-ascii?Q?ZBRFJcuvAAcJBMw/5OsZ7WxUrLaakqc6g7ojBIYfQPY5I+HNYV4YfmqpPuAA?=
 =?us-ascii?Q?i/XkBkPHnXZyRy2/baaWgJ1mwQIJfdf20uqKC/XIrv7w8J/7LkAhzkgocl//?=
 =?us-ascii?Q?EGqgEVYChQewrzIOaiAVbA4TMGLgZ84CDe7Ty+LfGGaHwGFX3VqTiWbToh1x?=
 =?us-ascii?Q?nGiQknQ3GwwvyLb0cinrZTFKyK246kPe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pEldiWQiUDTwH7nMsAAbzV6fDCE6g8o5IhNnhe4XmMgZH2548lHQ8d9OvlHC?=
 =?us-ascii?Q?ROlGeIr1RJaMtIBCvel8uYhbQNA9ubLhHU2cPU+jnIrqdCclvLaegd4z5aRn?=
 =?us-ascii?Q?gmcU+fDMobvJvbNr5w+D3DnROW4PaX8vtyuZbXPDpeBYGrbjBdnN3VbsDpIM?=
 =?us-ascii?Q?RHiRRTC4Uv3TEOKccvpeRwZ8ki048+2SiOcyGDT74O5ldGQ2asLQCQEhNHU1?=
 =?us-ascii?Q?dKEg76pvjZjz6NMgkRIhIjjvZzc+O7DE02cyGU7gHSYBqRxBYUkT5vV2p6a/?=
 =?us-ascii?Q?he+9S5QMQ7VNPno2kpetumjJ0MsPYq+qemdJkIM8WyX3rey78V8KKxe9X0Ng?=
 =?us-ascii?Q?bl2GZFxGvZ4m49+a7/Rt0kUcoig0IYRaJcVDKJgpSi2uehTPw1iSIYmZ73r/?=
 =?us-ascii?Q?qLVbIoHC2E9tGZ9Bxi1uKwmsR1e59w43gW+l6hm0RLBUNfZNAmyc8yvh3yOD?=
 =?us-ascii?Q?X6Hk5vy3bf30FL0eArTOVhtG/qDhj7Xf1So/ryjZq2H55SCG9KgjZQPvZNIJ?=
 =?us-ascii?Q?jGThsv1tnZxEFOTmNa18dlyeie/euUdmbz+4Nfhnaq0TMB6aLfA1n32k39/Z?=
 =?us-ascii?Q?3PuV7HnJAVUw5ZA5uYUNKkomUJrcYykmgvK998otUeAjlJLoCa8IIvLPTYXs?=
 =?us-ascii?Q?lNMPaQaxkYE/xwy2n3VS++u6gXced9QyI1wWVHXi/nR4LMoR9EiLZJEug+MC?=
 =?us-ascii?Q?I/lId+E0GILvg6FrKvaa9VJe0SaDeyw2Wco8rcJxfH2xpGtWtZOxYzj8ec+7?=
 =?us-ascii?Q?FiE/KJ0vXrjEeyyqm6QJnIOewc5YuFlvmP0GV7lzb1qR6/kHqFKvXgr3dVKM?=
 =?us-ascii?Q?CU4sti2lHagyuk0QLlhbwQ/JYpVYv1nnk5pjcMz0OKXc+xLo5tOy7GwKYb9p?=
 =?us-ascii?Q?f3kotq6zESDWJf6q0NT3QhohFpCKT7qH3psZW5aWNe9QbnFvTJruZh9AZFeu?=
 =?us-ascii?Q?hNtMgr5BUgV6LNwZpBFmLLTIb0sZDHxEjkPO8MsXDrBkvD+lTAk8yOKAZV6t?=
 =?us-ascii?Q?mbuNA449b31J9Xp9K2Jgviqw63YLg+o+ose7nBSAyXkrztlOC1jb8UEaB/ek?=
 =?us-ascii?Q?hqf3S/eC4Jf20tWLnBtffHyQ7lFl8h+UwUHIrEEFgWUQEwtgO46AgYPYqtS6?=
 =?us-ascii?Q?CkZtnXgupIdXKmkOIbq6xepkU3KCjQGvDVk6z3N90oceDJK3fsaQOPtmml9D?=
 =?us-ascii?Q?3sQLd7WtBrhJbi27wiV1qKDTto228Kmi7Al19VUSGkYRr1exCcL8yoLRDsJ4?=
 =?us-ascii?Q?1tYpihpm4/yiEcMaeyulrhofgGjrc6/X1Kl5xzR+CdVgEZlwkAKx2y/DkN7a?=
 =?us-ascii?Q?pRoVtYhES4w6dqeDOtDWNF89nOJoS2+JEKdhtMPzbHr1FVwDuU9DDKZHQutO?=
 =?us-ascii?Q?1dcG1AelzDTEqCwXEeRBuO8b8K+EOGGYiDmNREBnSywp3JqmXU/4owIsamJt?=
 =?us-ascii?Q?J93SHyhjGdIwiPxeI2aFTbtgYIw0AidLnEMap7ycxz13YBg5l2ceanrfYzM6?=
 =?us-ascii?Q?Q3ELP9D/TETShbckASeEnrRJxit3eEHi1IjaeNyap9i3gTk0agyK2T0BWt4E?=
 =?us-ascii?Q?8Ct5FoHnqRbhC/FYIx1G4YjNgFEkveKHPcMxAaYVYHsDeKPEqLHcfpqL6JnX?=
 =?us-ascii?Q?Pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7efd599a-db35-47d1-a9da-08de170bdf7d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 16:54:50.2082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qj44+egbX+QJKZm/GoexmodJ2Ym7GpnkHKu67kt+npSY77mBWfl6emk+l9pF/Uew+4sX/EVGU4DgEf7YzhLrUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9249
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

On Tue, Oct 28, 2025 at 02:46:01PM +0100, Philipp Stanner wrote:
> drm_sched_run_job_work() contains a comment which explains that an
> entity being NULL means that there is no more work to do. It can,
> however, also mean that there is work, but the scheduler doesn't have
> enough credits to process the jobs right now.
> 
> Provide this detail in the comment.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index c39f0245e3a9..492e8af639db 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1237,8 +1237,13 @@ static void drm_sched_run_job_work(struct work_struct *w)
>  
>  	/* Find entity with a ready job */
>  	entity = drm_sched_select_entity(sched);
> -	if (!entity)
> -		return;	/* No more work */
> +	if (!entity) {
> +		/*
> +		 * Either no more work to do, or the next ready job needs more
> +		 * credits than the scheduler has currently available.
> +		 */
> +		return;
> +	}
>  
>  	sched_job = drm_sched_entity_pop_job(entity);
>  	if (!sched_job) {
> -- 
> 2.49.0
> 
