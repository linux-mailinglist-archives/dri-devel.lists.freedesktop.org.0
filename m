Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD4597A721
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 20:04:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262B710E3C4;
	Mon, 16 Sep 2024 18:04:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SsT0tXtm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 702C810E11C;
 Mon, 16 Sep 2024 18:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726509871; x=1758045871;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SL+falVaOEkqNOBkjdJh7D+mt7H4jKoZ6pI0qo7jXkA=;
 b=SsT0tXtm3WUiz//dy3bmPj16Q6Zee+v8M9+QEEzMTZK8B4Rh/n7Q77pD
 /s9y9x4rPuXvGryg56FXImebnOe4hzzTvNI9/CWbsmVua0nUXnkDd7L7j
 V/dJW3lO4KbwV4hfO5mduDgEuipR1WYDuiQLrwzgML5tK/GVBaS1xyhIf
 cLx3JXRFu2qLuuOf4mdkeZhbLMFtNmKrGf5EmVcteCclvvopLhsq3tvll
 LFIIX9Aya+OwMWsmcD/SEdE4ITDMrBZlaRgTNSr/YiZ6//Q+PmpGYnKu6
 /TROTNsYjkKGgVemGo8g4ZOauKoQqqlGBSJPvPcHmut/JK6AhKcQfe8wV A==;
X-CSE-ConnectionGUID: N8+UngLHShGdX8B4FUMt1g==
X-CSE-MsgGUID: pPoDzr+CRrarhnw6V8uHYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="25444832"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="25444832"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 11:04:31 -0700
X-CSE-ConnectionGUID: KhBSEMwZT3SkaxBq+/VFxg==
X-CSE-MsgGUID: O1J/2bfgQT+8jDVFhGxqAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="68566716"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Sep 2024 11:04:23 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Sep 2024 11:04:23 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Sep 2024 11:04:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 16 Sep 2024 11:04:22 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 16 Sep 2024 11:04:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pULlPLqhkWNgps7l9h5USeQL52YpJelWAefGdhH7ZhmTfapMt2b2REwB4V/1Or99l3Dz1fIVDPBLpmpnE5VSd4MREpIjkcNKsfFy00+j+kMt0U9mONUjSshMaI8/PdaRnS+XQYjtBHYWmHQJfGcSDgqg0NizSTgx9YBcX7zXn0K5xmiI1aq41hZtHqKDvh9QrIjhNTp9BOcMAkW3Etxit/6WeVbSG7Xho0oUyIr+ElOSL+uba7FquzCfUn2I4vYVDDfWNBOv51ki2gXdz3tb2b99fqrrgA/nU8uoqxbXQZ4zmKE6fSvwQKJBExw40jaet2VgoLsFFMAk7flWf+NE0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1VP3pQC5Mbc7JVbV3BUkAW4w96sPjVoASCLQFtEa46Q=;
 b=G7TasSObzdSr1unOGOBDiZdzyIS6JbaSIwWF6dbtUjuTXjJzEXKqnvdt+wapzTihU3Q4KniGkKqQaJGA+5MCowUB1E9LSXbR6PutPpMFO7xD9FBHeWcWuyfvF0E2zk5YBHWCi4jg2xXJjn1ht1gSW3GUzkHu11TwuJzvkkLjlPi8oW5jfWu/NC2YSMaAV/awiIwEHyt0W1pGR6+O715YzssrmaKZk7DSutZf10gzAH9sgS6CxVtcstn5vXQPTpygNjlN5L/epNHA5IItQIgtUItrYPLUNxjHqoRaEsRqiyh5kdni0WqvLAlEO4NfH4cc00O9G87ftiEbYVFT0knGOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS7PR11MB6063.namprd11.prod.outlook.com (2603:10b6:8:76::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Mon, 16 Sep
 2024 18:04:18 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7962.022; Mon, 16 Sep 2024
 18:04:18 +0000
Date: Mon, 16 Sep 2024 14:04:11 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
CC: Mark Brown <broonie@kernel.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.org>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Tomas Winkler <tomas.winkler@intel.com>, Vitaly Lubart
 <vitaly.lubart@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-spi@vger.kernel.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v6 11/12] drm/xe/spi: add on-die spi device
Message-ID: <ZuhzG7fUYj7AjIT1@intel.com>
References: <20240916134928.3654054-1-alexander.usyskin@intel.com>
 <20240916134928.3654054-12-alexander.usyskin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240916134928.3654054-12-alexander.usyskin@intel.com>
X-ClientProxiedBy: MW4PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:303:8f::32) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS7PR11MB6063:EE_
X-MS-Office365-Filtering-Correlation-Id: 04311d1a-9b19-4649-c6d4-08dcd679fb66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?W5/gGBdmBSW8/XZy1C9dvyJ77evYHdFq8A2OdrdyW1D5UKUP6jGHH9NUNX2Y?=
 =?us-ascii?Q?DeCwaH4e/fmMjSvND2xT108hNIbNyu20QFAQ23uJ6fQxqsiBC2+hbT5ym9CN?=
 =?us-ascii?Q?ocelI9ftDO4fO/Gu508H9/iH1qaBoGKFdc8mccL71OW9jGCEQJsgZ/c7Gmg9?=
 =?us-ascii?Q?rbNjiYlz4FAsXO55VFwsUuIEaDEWqoiRmPId9LzWDVrpigrd4dOAzL/0cGLd?=
 =?us-ascii?Q?cptrirBVCXH3vhyvbRQF06E1GI9Od24Zz5oCW87R/X79fOGvEWzyM1kKHjrv?=
 =?us-ascii?Q?Vg+PK9nCnFNGKFk5pbfomwb66iqE+i5xfo+LFWT2Wl4DF4VoPx0zPpC9CJgF?=
 =?us-ascii?Q?G2KyoCRLMIodOvzBNd7C0Ffb2PevlToVfGTHfbAEgs52eKbFMNovA2Yi29Qo?=
 =?us-ascii?Q?47fJMM6Khnlj0h90TkTPy8P90wHlaKE5Etmi7KIYC78+K6n8Y/h+uV7b7hUG?=
 =?us-ascii?Q?ZNbzmo4f91+egkq0NJqNEiNUQ3ssrV9gwlHIE6Ud874avXvwXr7xMeu+AxP4?=
 =?us-ascii?Q?NfLPHh2Mt3ppMhoBLdE1bpQWtJXuRFXJlBtjT2RL1OIAH9r96HhkZEqNWhX9?=
 =?us-ascii?Q?b+24PhLJrRGBH1mA5ifZdmcPrUOXVNoPQ752cqSUoIQRm9WPgn2Xg7gvAWpD?=
 =?us-ascii?Q?Zv8vrkSe+ni71ixjigbTXXxGgM/t0xK/0/Yo1dJW7UgZEZXI7qioHkYR+Ogk?=
 =?us-ascii?Q?sKTh8rCLQPrpIPrJEf+NqMj+BTFcGfOpJEGipBkV7K5eWDYMTBEiydcUEdpI?=
 =?us-ascii?Q?y4+/l5vcC4Smlp5HHTacbb7EDiqX3dQyGKvb4rGnIkn3CIbUFuvh9f3xUPy2?=
 =?us-ascii?Q?eBu/GqpMMcNfZbp0Njk4PToy+9gz07DDQhBPzTEmNnmUs8HzNkd7KrHtDv/F?=
 =?us-ascii?Q?3BFhUhz9tLuO8LEAGOSGyym564IPokz+PpZvCxjUe87g1jtxbF4nHuHUmchw?=
 =?us-ascii?Q?nRG0CjrQcLAtXgozVnVnPwulcHv+1zVUc9vwSw+0T4+C3kVJI3p3a+DpKyAk?=
 =?us-ascii?Q?TLLZ+//aVUGg0P3EcX+HhhxXAbSOcW1daGM8DjjpqZIgoGLL942gdoxQjNmI?=
 =?us-ascii?Q?eYtiSEs7yVCBn+2q5zFBwaYS2IxB9KazCVAEtGopexbHVkwmwUGUu45/d/47?=
 =?us-ascii?Q?U2cSCOO3xHrwuGL4QiAomkSjj3mQ1nTFDgpq2SVpNJhI3yUkoLttjK0P7shO?=
 =?us-ascii?Q?lvuDif4OJ6XVB3tGhhpKlCKaNBeNh+fQmO4Tm4b8sHBwV4T2gyRWvpt6lB6N?=
 =?us-ascii?Q?vRsSfEsPBhSa6iJT6DeKj2bvflP1vA+QFnVunWCrgT+SZ75kg5KL+bgta+iu?=
 =?us-ascii?Q?WV+8ZHwZNebxJz2mHXtBE9g9+cfNxgkfxEbvlFYIr96AJA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?82BCblhinOYljtQ6y6dvNk199qZHfQb8fifeiTqYb4SjSnNC04YXHc95hRAL?=
 =?us-ascii?Q?dI81d8ZKNxwf60H6N5ba0dSkms6wdM1oXG8k0Z5FXRHp8pJ7DpLPwld88MxE?=
 =?us-ascii?Q?DGBs0LlTThdWo3MZCsgfV7o1oiL0LNB+IDqUL1L6+uQJPRPJ8S/7Z2mGMUaY?=
 =?us-ascii?Q?NeJoG40lieq7zdmxKJ8rhbCv0Iz/AI8KNDoJHzb6V0Wo6fHpaZ7OOyOZRIIk?=
 =?us-ascii?Q?RlOHrEm+baATaSYoraY9iLpHaNgR65o2vm/vmgCVnniJu2iL4YgUsyAFFS42?=
 =?us-ascii?Q?Nj1QKcIeFpTTTVFS+lgIOi1Xsf0gi/z/tBoLCL3h99Mg6yuoQdcMCQ7LMcgx?=
 =?us-ascii?Q?vXE7IgYuacC2aqxqK80nlcj7wr0Y8ZuzOujaZUTYDj33uIAz84YeakJxdoPZ?=
 =?us-ascii?Q?nZDec+YdvByY89ZVHLd4d8mzLWteck68AC1QRjLQJRCS/5n8V8UH7lCw9vBZ?=
 =?us-ascii?Q?5XukCEfLaOWaefsK3dFziUS1n/AFMM5w8be/2JmtEzfx45DuOY9R17k3/HeD?=
 =?us-ascii?Q?OTdaGL8MTsy6n+rDCRIn43XflBsD3QZADx7zzVE7SqtR9p8Tkc9/lWiS0ifr?=
 =?us-ascii?Q?X4UMIJxtVH1NI3VeJplX0eGnVh4rWwxzAUnJGmlLsrAGpXg6flkL87o5w/0O?=
 =?us-ascii?Q?nDjZ/+EOuKRQf1u5bVKLwg4fWi4j+NP1JoxoZqTINZ/Xwkg1tairkQC/CDxn?=
 =?us-ascii?Q?8b0hg3KYC5ktQPRhzER/CtuWKtAfmRPAT+HBoUJENE9mHUjXhWQgTTotVc37?=
 =?us-ascii?Q?fzZ7xJPeg4uB19ZY2XeE9Tmor6CfrBOin7/098dHlG+AhqHXUGGOem7ENdPq?=
 =?us-ascii?Q?jZCFtaRsdF8tNHIa0GK3WPHddlqV+8Nyu061jk+lr4bRe22PzjD4NYWYhbNe?=
 =?us-ascii?Q?+UpA0w/2vzg6FERdV86lfFUZOpqUbYCOlW12TxC0ulEWyAlV7BIqjTB56IJ4?=
 =?us-ascii?Q?Tu9h2tYVIWACVrycnQ5+ceq9bLmGTkayAnw/9xG2dUAXmoZNr6H8+tprSc7K?=
 =?us-ascii?Q?dvU0rMfHq0CoWZ7Vo2Y9jnCrJpRa9Mt9CkXOj/Tfdra6zDitSxM/tcrvCrkJ?=
 =?us-ascii?Q?hLSCvTGm/HyldT8MBJfuqSo3USzvnbomTSTTUkAgUM20GYxTb8f1hZ3jCwVZ?=
 =?us-ascii?Q?/Z8+m11L9N84X7M1lUPOdpnGq7MA6vVELuqjtr+QeNQzntp2MkJ34jNQELyV?=
 =?us-ascii?Q?TUXat4WlSPqPXRs9L9nM4fZM5LluJxerCrli7z7UZ3zcgCYGpsrJcaaKYXSz?=
 =?us-ascii?Q?WnT+pMpqGrBJii2xjSDap0y8CC92kUXQH6FbWozw56o4yZWaIBm5MRr0olMO?=
 =?us-ascii?Q?WDHIWArxdhQtHlpqsN97WeXGeSYeZJVBk8aT2h4GIh6VTzPuhvis8Q5XhZnY?=
 =?us-ascii?Q?DfKqG+ppuUUb4R0Z8aR7sarfhRm0kuzRIt3F6/vGwLyWnAo/ybMxE0t/b1e3?=
 =?us-ascii?Q?9jNDWUFYEcFWiCx7SN+INcSLqHw4aZ/1NyrVIXf40TCusOsVoDPwkoySKE0b?=
 =?us-ascii?Q?Nf6sPHo+h4HqRXy1zZ8QkJflkS3eih20IKwTD0hsKvlptVf+iOXehy1gqY4G?=
 =?us-ascii?Q?VotouWsoUWkYgDP/DUqiwgC2Y6gkM2hVsr6k2p5MOParlo0ODgumiEM2Ae5d?=
 =?us-ascii?Q?9g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04311d1a-9b19-4649-c6d4-08dcd679fb66
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 18:04:18.0684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jaOq9b+O46+7BLXTTY0GSGZ+fEZMJoXWQY/zcgDW0diocvHScDxwClyYeogIG0B3v0bgOeUpulMwtgGBJxqZrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6063
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

On Mon, Sep 16, 2024 at 04:49:27PM +0300, Alexander Usyskin wrote:
> Enable access to internal spi on DGFX with GSC/CSC devices
> via a child device.
> The spi child device is exposed via auxiliary bus.
> 
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile          |  1 +
>  drivers/gpu/drm/xe/xe_device.c       |  3 +
>  drivers/gpu/drm/xe/xe_device_types.h |  8 +++
>  drivers/gpu/drm/xe/xe_pci.c          |  5 ++
>  drivers/gpu/drm/xe/xe_spi.c          | 82 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_spi.h          | 15 +++++
>  6 files changed, 114 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_spi.c
>  create mode 100644 drivers/gpu/drm/xe/xe_spi.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index edfd812e0f41..90f995b04479 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -93,6 +93,7 @@ xe-y += xe_bb.o \
>  	xe_ring_ops.o \
>  	xe_sa.o \
>  	xe_sched_job.o \
> +	xe_spi.o \
>  	xe_step.o \
>  	xe_sync.o \
>  	xe_tile.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 4d3c794f134c..25ca0b53c5c1 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -48,6 +48,7 @@
>  #include "xe_pcode.h"
>  #include "xe_pm.h"
>  #include "xe_query.h"
> +#include "xe_spi.h"
>  #include "xe_sriov.h"
>  #include "xe_tile.h"
>  #include "xe_ttm_stolen_mgr.h"
> @@ -734,6 +735,7 @@ int xe_device_probe(struct xe_device *xe)
>  			goto err_fini_gt;
>  	}
>  
> +	xe_spi_init(xe);
>  	xe_heci_gsc_init(xe);
>  
>  	err = xe_oa_init(xe);
> @@ -802,6 +804,7 @@ void xe_device_remove(struct xe_device *xe)
>  	xe_oa_fini(xe);
>  
>  	xe_heci_gsc_fini(xe);
> +	xe_spi_fini(xe);
>  
>  	for_each_gt(gt, xe, id)
>  		xe_gt_remove(gt);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index c92df0a2423f..dfc0183cabe0 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -12,6 +12,8 @@
>  #include <drm/drm_file.h>
>  #include <drm/ttm/ttm_device.h>
>  
> +#include <linux/intel_dg_spi_aux.h>
> +
>  #include "xe_devcoredump_types.h"
>  #include "xe_heci_gsc.h"
>  #include "xe_lmtt_types.h"
> @@ -44,6 +46,7 @@ struct xe_pat_ops;
>  #define IS_DGFX(xe) ((xe)->info.is_dgfx)
>  #define HAS_HECI_GSCFI(xe) ((xe)->info.has_heci_gscfi)
>  #define HAS_HECI_CSCFI(xe) ((xe)->info.has_heci_cscfi)
> +#define HAS_GSC_SPI(xe) ((xe)->info.has_gsc_spi)
>  
>  #define XE_VRAM_FLAGS_NEED64K		BIT(0)
>  
> @@ -331,6 +334,8 @@ struct xe_device {
>  		u8 has_heci_gscfi:1;
>  		/** @info.has_heci_cscfi: device has heci cscfi */
>  		u8 has_heci_cscfi:1;
> +		/** @info.has_gsc_spi: device has gsc spi */
> +		u8 has_gsc_spi:1;
>  		/** @info.skip_guc_pc: Skip GuC based PM feature init */
>  		u8 skip_guc_pc:1;
>  		/** @info.has_atomic_enable_pte_bit: Device has atomic enable PTE bit */
> @@ -499,6 +504,9 @@ struct xe_device {
>  	/** @heci_gsc: graphics security controller */
>  	struct xe_heci_gsc heci_gsc;
>  
> +	/** @spi: discrete graphics spi */
> +	struct intel_dg_spi_dev spi;
> +
>  	/** @oa: oa observation subsystem */
>  	struct xe_oa oa;
>  
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index a1d08e20cd34..45be73ccf274 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -60,6 +60,7 @@ struct xe_device_desc {
>  	u8 has_display:1;
>  	u8 has_heci_gscfi:1;
>  	u8 has_heci_cscfi:1;
> +	u8 has_gsc_spi:1;
>  	u8 has_llc:1;
>  	u8 has_mmio_ext:1;
>  	u8 has_sriov:1;
> @@ -282,6 +283,7 @@ static const struct xe_device_desc dg1_desc = {
>  	PLATFORM(DG1),
>  	.has_display = true,
>  	.has_heci_gscfi = 1,
> +	.has_gsc_spi = 1,
>  	.require_force_probe = true,
>  };
>  
> @@ -293,6 +295,7 @@ static const u16 dg2_g12_ids[] = { XE_DG2_G12_IDS(NOP), 0 };
>  	DGFX_FEATURES, \
>  	PLATFORM(DG2), \
>  	.has_heci_gscfi = 1, \
> +	.has_gsc_spi = 1, \
>  	.subplatforms = (const struct xe_subplatform_desc[]) { \
>  		{ XE_SUBPLATFORM_DG2_G10, "G10", dg2_g10_ids }, \
>  		{ XE_SUBPLATFORM_DG2_G11, "G11", dg2_g11_ids }, \
> @@ -324,6 +327,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
>  	PLATFORM(PVC),
>  	.has_display = false,
>  	.has_heci_gscfi = 1,
> +	.has_gsc_spi = 1,
>  	.require_force_probe = true,
>  };
>  
> @@ -613,6 +617,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.is_dgfx = desc->is_dgfx;
>  	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
>  	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
> +	xe->info.has_gsc_spi = desc->has_gsc_spi;
>  	xe->info.has_llc = desc->has_llc;
>  	xe->info.has_mmio_ext = desc->has_mmio_ext;
>  	xe->info.has_sriov = desc->has_sriov;
> diff --git a/drivers/gpu/drm/xe/xe_spi.c b/drivers/gpu/drm/xe/xe_spi.c
> new file mode 100644
> index 000000000000..37080b82e9ae
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_spi.c
> @@ -0,0 +1,82 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright(c) 2019-2024, Intel Corporation. All rights reserved.

only 2024 on the new headers should be enough.

> + */
> +
> +#include <linux/intel_dg_spi_aux.h>
> +#include <linux/pci.h>
> +#include "xe_device_types.h"
> +#include "xe_spi.h"
> +#include "xe_sriov.h"
> +
> +#define GEN12_GUNIT_SPI_BASE 0x00102040
> +#define GEN12_GUNIT_SPI_SIZE 0x80
> +#define HECI_FW_STATUS_2_SPI_ACCESS_MODE BIT(3)
> +
> +static const struct intel_dg_spi_region regions[INTEL_DG_SPI_REGIONS] = {
> +	[0] = { .name = "DESCRIPTOR", },
> +	[2] = { .name = "GSC", },
> +	[11] = { .name = "OptionROM", },
> +	[12] = { .name = "DAM", },
> +};
> +
> +static void xe_spi_release_dev(struct device *dev)
> +{
> +}
> +
> +void xe_spi_init(struct xe_device *xe)
> +{
> +	struct intel_dg_spi_dev *spi = &xe->spi;
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	struct auxiliary_device *aux_dev = &spi->aux_dev;
> +	int ret;
> +
> +	if (!HAS_GSC_SPI(xe))
> +		return;
> +
> +	/* No access to internal SPI from VFs */
> +	if (IS_SRIOV_VF(xe))
> +		return;
> +
> +	spi->writeable_override = false;
> +	spi->bar.parent = &pdev->resource[0];
> +	spi->bar.start = GEN12_GUNIT_SPI_BASE + pdev->resource[0].start;
> +	spi->bar.end = spi->bar.start + GEN12_GUNIT_SPI_SIZE - 1;
> +	spi->bar.flags = IORESOURCE_MEM;
> +	spi->bar.desc = IORES_DESC_NONE;
> +	spi->regions = regions;
> +
> +	aux_dev->name = "spi";
> +	aux_dev->id = (pci_domain_nr(pdev->bus) << 16) |
> +		       PCI_DEVID(pdev->bus->number, pdev->devfn);
> +	aux_dev->dev.parent = &pdev->dev;
> +	aux_dev->dev.release = xe_spi_release_dev;
> +
> +	ret = auxiliary_device_init(aux_dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "xe-spi aux init failed %d\n", ret);

for both, this and i915 one. We have 'drm' pointer here,
so we should prefer the drm_err

> +		return;
> +	}
> +
> +	ret = auxiliary_device_add(aux_dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "xe-spi aux add failed %d\n", ret);
> +		auxiliary_device_uninit(aux_dev);
> +		return;
> +	}
> +}
> +
> +void xe_spi_fini(struct xe_device *xe)
> +{
> +	struct intel_dg_spi_dev *spi = &xe->spi;
> +
> +	if (!HAS_GSC_SPI(xe))
> +		return;
> +
> +	/* No access to internal SPI from VFs */
> +	if (IS_SRIOV_VF(xe))
> +		return;
> +
> +	auxiliary_device_delete(&spi->aux_dev);
> +	auxiliary_device_uninit(&spi->aux_dev);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_spi.h b/drivers/gpu/drm/xe/xe_spi.h
> new file mode 100644
> index 000000000000..aef79893a864
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_spi.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright(c) 2019-2024 Intel Corporation. All rights reserved.
> + */
> +
> +#ifndef __XE_SPI_H__
> +#define __XE_SPI_H__
> +
> +struct xe_device;
> +
> +void xe_spi_init(struct xe_device *xe);
> +
> +void xe_spi_fini(struct xe_device *xe);
> +
> +#endif /* __XE_SPI_H__ */
> -- 
> 2.34.1
> 
