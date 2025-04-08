Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E20A80E33
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 16:35:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 585F010E6C7;
	Tue,  8 Apr 2025 14:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="euX8v3Il";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A4610E6C7
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 14:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744122911; x=1775658911;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pbEY1yRbhnYL/cAchSTSG1XQFbVFh/EJvvN2OVIy2QU=;
 b=euX8v3IleYqLeSN/Vx/+WvQgZ7d/U54JRmH4T6uCtf90s2NmpKhizxK0
 wFa6qRcGL2rrg041ZmuSDVLk5yArpoo37RC/on1cnhd6TyGXBgcVwVQhf
 /L7+7ZSsZUX5fua05wU2uhcond8zxnVq1NY1MMO1GhNIw11wjp793bgm4
 0HeqW/tv0WMHbRi2S8HAs06XL79zNTdt/G5tAX1L/9iiFV7OKTcSo2FqC
 Whe4Ak+D9XYlon4FKdFVEaGHPt5/40NziaRLNi3FlV4BfHjeP2uJL8hiq
 QrE57t9ff0kxOWLFjf2AQQ5RRtpOgBqbAYRLBCeXcH5ARb8cIZQTxvnwm g==;
X-CSE-ConnectionGUID: iIhFW5ktT/GoFX5mHCDPRg==
X-CSE-MsgGUID: SXVO6m7yTA2JwGru4poW4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49218388"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="49218388"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 07:35:10 -0700
X-CSE-ConnectionGUID: cSm9Q0H6RbmzAIP/YMkY2A==
X-CSE-MsgGUID: mUMCiJiTQ2eYiJFeD0anbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="133439414"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Apr 2025 07:35:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 8 Apr 2025 07:35:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 8 Apr 2025 07:35:09 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 8 Apr 2025 07:35:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xa9vHSf4IxvFKKxmtxpbadkzAudds4iNpUlBxC780kx2MpGFuxH7pqTtks6QUts2LByAdjPcTMDtSCrWt6wT2+k5Dh3mh5K9cb/n92+Z3l0/PkGyKFsrJZaPGOpUk+DsW5kL5v0JKZPVC7MiLYYv5ky1vYm0jfnTLNhtfbZi8em4I5R1L8Bdvw+k6Gnie/GrprJ1aYRttNSteDSUpk3GCtqCwL0Tf0jrKcFRrtbfiiScu21fPyGNjHjgcBkf4L6erU6X9v2rkgIGyBZVTmJXOAijT/hYQAYBno728rVkkdIggDqj7uZ3LGMWaOo8KHK5GHNaEiJR0bT8s6tihXMTAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OfkQyCOS1hGyJc0e7sr3JPKM0NAp7RHx1qIrwtxh0fE=;
 b=uXiY0d4qIWq7wfRXAtoJZlzIiWhVfUcYJse0gf/5DezU1BsqOwyuUh+XjOTIz1nCcUIRDd7f2d5V4oAkKgXP4Kv1ZAs2B6+mUi5o989z0P3Gfz97H0KldeE+qoUWbdXi8YZWk9ROQedwp6iaF29bXeginjm+PpBOpOxxGTZqs5KWweKZsO+agbO+2VEudO6bhxazwyHc9tc0/nEk/kBVolf+aDETMi3yxNPTlBSjcfeAy+uS0uAZ0m+IMb6FBlQKsts4VXzKiXragI+bU9T3B1zgTUbVAzv6g3cEyfhHlH/2P3kwBJitOtIFhEc/KktRJ557IZq1aLlqpjgDCqJfJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA3PR11MB9040.namprd11.prod.outlook.com (2603:10b6:208:576::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.20; Tue, 8 Apr
 2025 14:34:26 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 14:34:25 +0000
Date: Tue, 8 Apr 2025 09:34:22 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maxime Ripard <mripard@kernel.org>
CC: Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, <dri-devel@lists.freedesktop.org>, Anusha Srivatsa
 <asrivats@redhat.com>
Subject: Re: [PATCH 1/3] drm/panel: auo-a030jtn01: Fix compilation build
Message-ID: <nyrjnvctqnk6f3x5q7rlmy5nb7iopoti56pgh43zqknici5ms4@cibpldh7epra>
References: <20250408122008.1676235-1-mripard@kernel.org>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250408122008.1676235-1-mripard@kernel.org>
X-ClientProxiedBy: MW4PR03CA0198.namprd03.prod.outlook.com
 (2603:10b6:303:b8::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA3PR11MB9040:EE_
X-MS-Office365-Filtering-Correlation-Id: 230faca7-ee0a-4524-6d1f-08dd76aa75f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TlzHxeoIkQWWj4xN5P2KoEgzuf1v7odPFjGPDm5lUIrjviSHOBL2LxjWk9wF?=
 =?us-ascii?Q?RvgRKGUn/TNlGZ6TLhzGHJ0AjO2cKxD4Oth80ODj65MtH8+MFXHnK+7/C+Ch?=
 =?us-ascii?Q?9QVP+saGFnEqJQFFRnTURKzf+yvKloYMAAGxzNHyw83zKOb0llUCaV4uaXEK?=
 =?us-ascii?Q?1BJ9MNxNz22M7yhTKy3ikGv7X2cQtEU5C+1eDI0FeG+AjjpbGVEN6nPJBa0b?=
 =?us-ascii?Q?v0WZmRR7o3wE3+Kpuaatr9yLrnI6f1OM9Ji2ifccctjZ1gOaGpd8MYfKQ0GD?=
 =?us-ascii?Q?WOBj6l90BUNlfo25AdOiD7jIb0Pu8DoAr0TFJV+k9ahVmmiXhRVzGyvpO3S4?=
 =?us-ascii?Q?C+IxgoD/e2vH9SXwk34iYOqEPTTDluzhb/HcLGqs90gUJ7Mcx6fE1B8Jq1xL?=
 =?us-ascii?Q?T3zPvEboxyi4hhbFXH6vLPZggr9noBBR6OMiag6rXeoCkzB3TIIIN64sWQc9?=
 =?us-ascii?Q?+ICYQZrGkLSWJ7dizVuwY2PSw3dE5fZE4IQ2BngyBeHiiVetn8AC2+726QOD?=
 =?us-ascii?Q?PLEkZk29Z9+VelEvPAscGnl8/0UuZHF9KxEh9e1ahdlcN6q9J6xAz/sRN3oO?=
 =?us-ascii?Q?dJskT8PZA9lArog3mshVETWGRgd05J7oOIiA9j7Rd1lCW2OCGu5Qlt+sKNFS?=
 =?us-ascii?Q?a8G+IExR7mnlSfg0E4f65hdAtZqM9trcVMrW2J4QqNLaU3KEn/Ep7DtICcI2?=
 =?us-ascii?Q?6Thj44gZrC5qB6iMVdjWAYibdq5MUCxVcHY2flP1pZdvLwYxg3fWOtbez+g4?=
 =?us-ascii?Q?xr1rPNsCT+2UyZUM6qZQkZLSMQBol7qvZMEisPrWkt7JwX7fdKGjmrIuEYWn?=
 =?us-ascii?Q?9jFzZaYa/H9Ddo8ZzdAcJVbLhyb8wGq7r1dtuv8CRSCB1ll/9SI7hbr1lmH2?=
 =?us-ascii?Q?b1u0Jv+8wGf2N+5ENom4ktzjcXrbOtStEfne9Qqnzf+0FZ+/EusnLYJwhIRb?=
 =?us-ascii?Q?5Rt2MRlQNtQvBgcdqP/wifAawZG2HKIVJGk6kSBNhyk5PNvXA6r/byno6GvG?=
 =?us-ascii?Q?BoC7yo49TMkiesEv0mNNdnxcnAHg/ygapMDiBFDwx3T352gyXuIoV2GZCvEr?=
 =?us-ascii?Q?ujfQlEt8FCat0XMNoOPqA9/Bvp3pXDkbA2PmvYV54Oske01fnVgve2r9brnH?=
 =?us-ascii?Q?II7t4cOtSTCL5DQsflDb/KXOjnqBeLl9PoIx6ULT+HQlP5283SbWRBMzH/LP?=
 =?us-ascii?Q?6hgdvCrJDCWAQZJSHzV/zx5E1QpNhtw8uPEsQyg4F70BuwyCZeR33r03POln?=
 =?us-ascii?Q?CrBBeCUl4ID9pEeIldRhex9R00Uuimz5VyX/nlPczNe8Di24T8bu4kI06xAy?=
 =?us-ascii?Q?w/9lEcYTU6HSOPwxuE6/e0L0CAIf3FfQP682SK9HFOjEjG0NTlgbvYaKs32a?=
 =?us-ascii?Q?mjGIt7HusnG8aiQSZTHHVbYxIvAH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?34nyTxxGud4ZrK/B0o+07nL+udegO1Du+irVgUvpZP1gvra/SJlikvRba6xv?=
 =?us-ascii?Q?c/MAo7yyA2+x9HpkMdJqp9nuRMjKqBP4Z4cjKxEclKyZQmYRTe72Jv5fLxbi?=
 =?us-ascii?Q?1TO6uc/y9CYnScdUsTLk0Bo4DLPfxlDNWGHcvBAuhq+ud8cRuC9BdGp+MNb1?=
 =?us-ascii?Q?0TaE77TgLb5GiWHdr5DQx2nJo07l8idLapPGRyywxtkIj0ZQFATyNAVLbI5J?=
 =?us-ascii?Q?he7OsfWxlFDXhSYNys5kSxDl023CK1+NbV8rneKOfn7AAHuytRbLQtD9/86K?=
 =?us-ascii?Q?8Cm8gQVmRVumA3NiFw8nnHZnEugmiOh8KYB1nyOlXQnmHK4lO/ifTsGCci/T?=
 =?us-ascii?Q?BPJkNva2BBX2IoN0obNkNPEo6klmEtGXHbsaxk0QaECo97JAHEqkXOWhbRl/?=
 =?us-ascii?Q?tFE2TqBrGQP8LVeTaVWFvRrNjivTJ0SiA9n7rntRgoeHby+XExooewD2dMAI?=
 =?us-ascii?Q?bGukobSbRZzTbTS6KkNPht6CB9Fm0Xt/29e5aL2NzDBSPnQaECJtN9jCnj0V?=
 =?us-ascii?Q?aDnKf60bbboIbZOGfIop6vF4GkE+IW6MrXkVJ/+I64meDp5T05YI246WAxY1?=
 =?us-ascii?Q?tvlKqZAxzsq8js36XS3+XNVjFRDx1if4P7ABYh0ykksgaGKZBxddOPgTz4Cm?=
 =?us-ascii?Q?GZo+r4Tg8GkKO4WZVpzg/ShZkC8UOWWKfSAWIzsInAK9bsnX3EJmVbBfb6G+?=
 =?us-ascii?Q?n/ETVSXFuHvczirOzZNzMe2R+f9yRuiagjCApH/RqAMi5ZXK5DEGsWOkccMK?=
 =?us-ascii?Q?3WDfmZzBl9w+PeBue0qdZCBwzCH71mN8POuTxrAAoV1bpBOpwWSRJZAsK2Ma?=
 =?us-ascii?Q?PWKO1drObEkXJVRz6kmFBORm97oZVtVHBx8VstlICKYoS+sh5A+NkfJ2mWBs?=
 =?us-ascii?Q?7v2HAslopMC7HDHeTG+qSqEIZ2pJ9py8dr8CPF4ePpbBYM31e+mKBN1gYdeF?=
 =?us-ascii?Q?Xrb5LGqP4GTSFgCwDnLCI/NIGivrQeuz59w1K/zqRUpS8HiSkvIzNwJ8n8IJ?=
 =?us-ascii?Q?uDak98Y8hpbPTUUR0OikQ4OEfio5A6hUJtjZGxLQha3Qo/3SQej3Spj1cGgG?=
 =?us-ascii?Q?JbT/KQz0B+C7oyXPiqYXRz9iWozzeLg4/GIwEAAzJR0ZxLE49dCm+efc9Xfb?=
 =?us-ascii?Q?9+yZv+2i4MjVUIRtzHuYug/MWxfwsUJEFBjwYANg72tf18eMz6Y1PeaPlhwY?=
 =?us-ascii?Q?veCBmoi2a68tuTQIm6NgDyN4OefsoRVmQnptb5jlnpZOd//ofbWmHzT+nPxe?=
 =?us-ascii?Q?eCOyCCCEj0sz14DfrucewNm3/3587s2dHkcZHtvl1aywmgupUQMCZ5BJ9EA2?=
 =?us-ascii?Q?hqu0GkZCa9qYpiNzM7q1peAWscycCQh/Kukh9uK43N1uECrKFgnFleVq0sNZ?=
 =?us-ascii?Q?W0l28JcuhuzOmZrJKFs6zId1WOmE59ZP9HOF/0lVxSqZnc+RKceN+f8HwEPI?=
 =?us-ascii?Q?BQDM6xdm6+lxNCygsJWih8VlCylsZQ5H+8AC4ZynH3nZo0/tju9yTtl9yb6/?=
 =?us-ascii?Q?cY05SIUc7Q0X5Y9BDg7icZJdgVCVQDQWFAqzqAil1XZOVrVEHbTnAIGm3A1G?=
 =?us-ascii?Q?0GvMpOBNKWYPu0kq5nbXVfTMQ2qCD0aIaR9NFaqpsqByCcL89jQY8Z5o/+9V?=
 =?us-ascii?Q?uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 230faca7-ee0a-4524-6d1f-08dd76aa75f8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 14:34:25.5192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AVATVyf8mylfmgTd5Ii2/JhBkznySpyDPf2WFcIFwJZlwo6jG62T5T7LAqdiJMaCliBoTlo3X7uHbf5Fu4zM9dw0qEFGcK7EgZ27RTmDXPI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9040
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

On Tue, Apr 08, 2025 at 02:20:06PM +0200, Maxime Ripard wrote:
>Commit 9d7d7c3c9a19 ("panel/auo-a030jtn01: Use refcounted allocation in
>place of devm_kzalloc()") switched from a kmalloc + drm_panel_init call
>to a devm_drm_panel_alloc one.
>
>However, the variable it was storing the allocated pointer in doesn't
>exist, resulting in a compilation breakage.
>
>Fixes: 9d7d7c3c9a19 ("panel/auo-a030jtn01: Use refcounted allocation in place of devm_kzalloc()")
>Signed-off-by: Maxime Ripard <mripard@kernel.org>

I still get a failure in modpost:

	ERROR: modpost: "__devm_drm_panel_alloc" [drivers/gpu/drm/panel/panel-auo-a030jtn01.ko] undefined!

because that entire block is:

	#ifdef CONFIG_OF

Based on the header, I think the intention wasn't to add those functions
there, right? Moving it outside the ifdef at least fixes the build for
me.

Lucas De Marchi

-------8<------------
Subject: [PATCH] drm/panel: Fix build error on !CONFIG_OF

Move helpers outside of CONFIG_OF, so basic allocation also works
without it.

Fixes: ed9c594d495d ("drm/panel: Add new helpers for refcounted panel allocatons")
Fixes: dcba396f6907 ("drm/panel: Add refcount support")
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
  drivers/gpu/drm/drm_panel.c | 76 ++++++++++++++++++-------------------
  1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 870bf8d471ee9..99b348782ce31 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -318,44 +318,6 @@ int drm_panel_get_modes(struct drm_panel *panel,
  }
  EXPORT_SYMBOL(drm_panel_get_modes);
  
-#ifdef CONFIG_OF
-/**
- * of_drm_find_panel - look up a panel using a device tree node
- * @np: device tree node of the panel
- *
- * Searches the set of registered panels for one that matches the given device
- * tree node. If a matching panel is found, return a pointer to it.
- *
- * Return: A pointer to the panel registered for the specified device tree
- * node or an ERR_PTR() if no panel matching the device tree node can be found.
- *
- * Possible error codes returned by this function:
- *
- * - EPROBE_DEFER: the panel device has not been probed yet, and the caller
- *   should retry later
- * - ENODEV: the device is not available (status != "okay" or "ok")
- */
-struct drm_panel *of_drm_find_panel(const struct device_node *np)
-{
-	struct drm_panel *panel;
-
-	if (!of_device_is_available(np))
-		return ERR_PTR(-ENODEV);
-
-	mutex_lock(&panel_lock);
-
-	list_for_each_entry(panel, &panel_list, list) {
-		if (panel->dev->of_node == np) {
-			mutex_unlock(&panel_lock);
-			return panel;
-		}
-	}
-
-	mutex_unlock(&panel_lock);
-	return ERR_PTR(-EPROBE_DEFER);
-}
-EXPORT_SYMBOL(of_drm_find_panel);
-
  static void __drm_panel_free(struct kref *kref)
  {
  	struct drm_panel *panel = container_of(kref, struct drm_panel, refcount);
@@ -443,6 +405,44 @@ void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t offset,
  }
  EXPORT_SYMBOL(__devm_drm_panel_alloc);
  
+#ifdef CONFIG_OF
+/**
+ * of_drm_find_panel - look up a panel using a device tree node
+ * @np: device tree node of the panel
+ *
+ * Searches the set of registered panels for one that matches the given device
+ * tree node. If a matching panel is found, return a pointer to it.
+ *
+ * Return: A pointer to the panel registered for the specified device tree
+ * node or an ERR_PTR() if no panel matching the device tree node can be found.
+ *
+ * Possible error codes returned by this function:
+ *
+ * - EPROBE_DEFER: the panel device has not been probed yet, and the caller
+ *   should retry later
+ * - ENODEV: the device is not available (status != "okay" or "ok")
+ */
+struct drm_panel *of_drm_find_panel(const struct device_node *np)
+{
+	struct drm_panel *panel;
+
+	if (!of_device_is_available(np))
+		return ERR_PTR(-ENODEV);
+
+	mutex_lock(&panel_lock);
+
+	list_for_each_entry(panel, &panel_list, list) {
+		if (panel->dev->of_node == np) {
+			mutex_unlock(&panel_lock);
+			return panel;
+		}
+	}
+
+	mutex_unlock(&panel_lock);
+	return ERR_PTR(-EPROBE_DEFER);
+}
+EXPORT_SYMBOL(of_drm_find_panel);
+
  /**
   * of_drm_get_panel_orientation - look up the orientation of the panel through
   * the "rotation" binding from a device tree node
-- 
2.49.0

