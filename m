Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6210AEE6B8
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 20:23:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76C210E054;
	Mon, 30 Jun 2025 18:23:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dUbMMh4Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CBE010E054;
 Mon, 30 Jun 2025 18:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751307818; x=1782843818;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KVF7JL78vZXif3N4Exa7i9fYhGCWKqtzV3iZLywCbb8=;
 b=dUbMMh4Y9oVlKmzg5zAEhbm/xxTHr3J2xGmxUdgqt5NQdSAJgiIlp1wm
 oA2l5nyOACtbzQzdE6yhJhcsJPTirdozAhplEA8VGDxHi+BqDXJGbE96k
 JKKhizzBzpvoOlC+aTvWQU0bvF3OufaRYriq3JOQTeTnb7UhdwBqNL7TF
 pCqXgda/Iy/3u52uiM6U8dxCC/ber8zKFeeX37keH3L8+hboovs+MA9rp
 0o6X+EQG5n2J9VWVojXZ6GpNLVsXv8RIwjctHtwTJXexAZpJSFn7X265f
 5jMFr4Ppwpllckgoz0ugqhJ1nr4zbyrY7vCWXgPBbC2zXgZCx1e//0FyX w==;
X-CSE-ConnectionGUID: YQ8on4PVQUyai8aNYEFD2A==
X-CSE-MsgGUID: 1FmxAEhPTUe4iMzNrx8BAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="63800573"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="63800573"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 11:23:37 -0700
X-CSE-ConnectionGUID: J+05gNtUTCi2sCAeRBQllg==
X-CSE-MsgGUID: rwDbNTxNRCifinL0QolrUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="154000587"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 11:23:38 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 11:23:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 30 Jun 2025 11:23:35 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.74)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 11:23:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GRKo8OsRwTwKQHtKE6g+49rgSANQfg1Wg1WU/Rk52wRNVR7vdvcI9FAe4vAvjxYlbewHdAK7NRWDMzxIZNrb1SuI7xJguWpcRnwbj8/9D/6zrm6yylfhoS38H53QxXN3GD0jbr2SpFupz2KYaK+0N8goJXr+0AFiqlq8d5G3KHnS1ppH6m/FhPJCRiUsMOEwFVP15V3y+nvbd6mU3M8wzFOIq9yISPMHnWI9pg270oeHHNVKUt9mB0fTlN39pdew1/HoNjBDrH041pQRm0ZspSYsIoVIiT2FxldHdfHJrRQDHdQ37CZdWtgTQTnlMPyVu3JzCStPevZq+T22QGO4xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hfSJ3E2dGdguEmkLv+7ubQpGGSG0FFIj07z1WJEBTUU=;
 b=vvCZo9wb+7Pba9EBxR68s4gdP2F1NvFf0ImvsswjN9VsSeUHanUlt/bYYCvubseZmuedjGNEp2oKu2Z73uxvOB9mZtlsNFC7wNPeQVycEL0Ozecc39MTSFenp48dT3wGUFW4LJM8Lx7v051dq7DvdCt4gLb3gUpTM100aGrIKqMvCErx0IzEG/bpOMOnKzyUDHiyD7cc/gGDA6TJAFEoDBl+lbBZnXqaqXWionfqmFZKFfLtnOs6JAuzMBVx5lXXjRVQulTRKDIAwGANBF1oPWRdPQbkWgDpGa1jWVF3N2L5b0fwyRm0QTSFdY17mEEroxeo0mnfBz14TRQmkrUtBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ0PR11MB4781.namprd11.prod.outlook.com (2603:10b6:a03:2d8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Mon, 30 Jun
 2025 18:22:51 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8880.015; Mon, 30 Jun 2025
 18:22:51 +0000
Date: Mon, 30 Jun 2025 14:22:45 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Junxiao Chang <junxiao.chang@intel.com>
CC: <tomas.winkler@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "Clark
 Williams" <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Vitaly Lubart
 <vitaly.lubart@intel.com>, Alexander Usyskin <alexander.usyskin@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-rt-devel@lists.linux.dev>,
 <furong.zhou@intel.com>
Subject: Re: [PATCH] drm/i915/gsc: mei interrupt top half should be in irq
 disabled context
Message-ID: <aGLV9YL3EWXuf_Kk@intel.com>
References: <20250424065609.624457-1-junxiao.chang@intel.com>
 <20250425151108.643649-1-junxiao.chang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250425151108.643649-1-junxiao.chang@intel.com>
X-ClientProxiedBy: BY3PR04CA0012.namprd04.prod.outlook.com
 (2603:10b6:a03:217::17) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ0PR11MB4781:EE_
X-MS-Office365-Filtering-Correlation-Id: d06cba6f-cc2f-429b-c389-08ddb8031f7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FRmgjxM+52aPczpV2lM8PsXRkGTyRWMS7YQ8OtzSuJJuBk7VA0izw0AFj04Q?=
 =?us-ascii?Q?Jj6SJbb9dSVqqPwBZawK1yUYYMydwaIxylHhi6F8EeoZM47Sr/hoYvNLleQ9?=
 =?us-ascii?Q?1y09rRUQr3QsnPfQN4+SCsLTwhD59ItL6h3KwHjlGD4OmraFAHvZZRrbI8nd?=
 =?us-ascii?Q?jxV4FqCm52rFfj30IY+CXEuXwU19eabaJctVOuzIlwp1vfXDxXUf1JmC62pb?=
 =?us-ascii?Q?PUlXeWTZ6f3bcxW28osiwHDW9VNcsLYrkSqG4MjKx94sVjyj3PUtY5oAs/hm?=
 =?us-ascii?Q?elSAok00zv/7c5Q8XjdqrJQMNt4qQw3JADLhVGlABBz5sQFozrA5qcZZXyDc?=
 =?us-ascii?Q?RIKeN2WAsk2h9nekQwb+BsKS98fyxziyFm0erkxwVk52KdxfLQECcv4Ezy1M?=
 =?us-ascii?Q?4Oiql9GzYAUu8CwpKGpeXsP9wy4ip+U94CsC5WMAj3HcnXYpBHcb2ZlfU4QM?=
 =?us-ascii?Q?uP8K7Ds/vVaKKAQECIZXsVrzwNExUI43owYPRtc+dIZdif5CvSPDbjmCW37O?=
 =?us-ascii?Q?QhSc2g4MszC2coGwWYhwxJL8aC6S3MtBt/XDwrrRRYSkB1e/0zIS0Rwkiq88?=
 =?us-ascii?Q?XlAuOyhOzrg5MtKIkiP6CwMwMZWS2V2ZIMEOJbzKnKEkBUl4qd5S5uch0DsC?=
 =?us-ascii?Q?1GjrenHOWZMMuDLNT/uR/057l5qkUubtlWih2nU0R5LnyW6nfGdNfP0m7m+x?=
 =?us-ascii?Q?FFBS1iJeU6HGY9QaHF/sgStoP+DN+GqaRoFMU9EWHR6esV6m9WvsjecS1ckK?=
 =?us-ascii?Q?WP8sb/AnUTp27LLY61kzLz4jv6SimDot0TBJXfMxwR3lbNY2wChOdwNZVwdI?=
 =?us-ascii?Q?vxcZhrL4YRkcw/HtWfv3PT0xUPUZuNnkyNQsCUc8I4mfr76PZlU8LmtD7WRb?=
 =?us-ascii?Q?niDEMvoV8d/wHIgtfj5SblJk+oagQk9iH2kJDvmCMs0rSEqqpN7M6ZMpO8OB?=
 =?us-ascii?Q?FGS4goTLY7JrKava2HUTRZTs8Rv65XbwOxl8ktZNWIeY7BqdojzISlAotZ7E?=
 =?us-ascii?Q?LQNaAQ12F9B5i9PMOZXSs/E4OGBclyPksQNHnZZieRg/5HR9ftNGCFjBPnf4?=
 =?us-ascii?Q?xtbdFmZBpbW+V+TRubP+YvZIErLhDCd5TMsuo8j6FGy8fPKC8mNLeLQv0NPk?=
 =?us-ascii?Q?FCLn8HVDAew5f68vA4Jl9cXiZMXIGWExDF8cS2Xg7pECF/Rdbp9opEdBV9Yk?=
 =?us-ascii?Q?TZiJm3oZoIRemHw0JANurl4N3Gr95lV2IY6FQPXXORqZgBDqyeMxNidvE6Mq?=
 =?us-ascii?Q?fPZWYEFTf1nNYC3POhoL9d7NIQIMLh7JgDyqqDHtnE6W2zuncYT/i/9xMu3Z?=
 =?us-ascii?Q?e8vVhWdXswELG0pCbhYXUACcyQogLReIQGXM9ZXr03w7sgFhZXP/l0vs4C2h?=
 =?us-ascii?Q?EQ8hHAZ0cUix2xihp5LAKpDmoPS8G1cyWynmAzwGvzx9L/MkYcL85LhgAeWg?=
 =?us-ascii?Q?FV+bYLFzvi0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aYTipS/BxUbxDxB4hM8jBxszmgecicDs22MillzWfaM7OmUFT3aEAdNBJbrn?=
 =?us-ascii?Q?hAT02hhKUmDj7N1RMfDMFiizCJ2WEt6i594PdJBXxnekvW2WNhjbXCGP+KFX?=
 =?us-ascii?Q?lHyC6N6kWSm4J7lwG9wezxxIQF7IFILDTeH/0nG4pQrSWppv7r8iTJzwZDW5?=
 =?us-ascii?Q?kIrEVsb8Di+pSzR8mVuqX7Bln5/u2m5c7CFbSFc2pQAyKUESXM6S1UWMKfkX?=
 =?us-ascii?Q?a5HfAHmsmeMBR6X4uE8XBBu3uSd8Lytk0ZP6MXJigosNcYCqpkGYTfacLpcb?=
 =?us-ascii?Q?8gthtkuO4VIXAGxy1i7Q64lmxs0VMFyxzw7pb0C16i+HSJbyHC91xY0yXOMg?=
 =?us-ascii?Q?OBZJcQchgLTNtmEyUTEZ6BEuVUTh+167OmlTiUfY/SyUAAE82QiENpCNMS9z?=
 =?us-ascii?Q?G5THfC4Dv3Et8ga5dtos7akFa0DZdenup7+av2OhAF1AqpDG2dB1RFx9cmht?=
 =?us-ascii?Q?mPOeTrxue34v8l7chW31R8J9y2Vz/WUr2RxH0S7XK8RC3GSEP5eGpMHKNBv5?=
 =?us-ascii?Q?Q4ASyVS2HUWfrvgodJoNurEdW/HQc/W7QvFqku73mYgDSPzt5LjvHMRbkAFT?=
 =?us-ascii?Q?qqWPX4r6ZB4SX30+nECy4L7Z8XOJI7DrUTO1ql2pzh10zog5nhry0TLyQF9a?=
 =?us-ascii?Q?jTRjWbZfMDeAsoCCGgP2mOnRmp0yqmwY7/HEPTIVAfOWJdwFqv1AxcUx8jrj?=
 =?us-ascii?Q?stkN5pp4cmxHBNx+iakyOn1dWKsaMtRJsdH1KqxTXYW2ewI2XHE7J9cKbMga?=
 =?us-ascii?Q?WPLyU8gmzdIyBRErfeYiI6hIkPwxM6vJsgnP/cw2ViBpCFQpbt5mhGV7mTul?=
 =?us-ascii?Q?BbpCyktl6ZXB+PXxwaHZR5qtAOV+BlTKqY+wer4pjbR3Zz3PyAMnKy0u5Abf?=
 =?us-ascii?Q?XdJesKUWx1zK2pHmkmqO2xPUXWCWiGzlZlTkwBVqcwwmOnXpRBHDGQ2EPL0o?=
 =?us-ascii?Q?/Nbm9vGITlOzf11BlixIq0QUCqgniGE0/9NWEunkfFwnE/Lb3+ckLO7Xi57b?=
 =?us-ascii?Q?yJf4y9gxYRqZagZlIi7tA8LpXiznaZgRsTBPWmLvt2STg1yJcwMqI3tBMW2V?=
 =?us-ascii?Q?wIRWPQi8SBZ8bdJabHgTD6mNzDUiVtthZO1JMxjzDBOJtLmLCyBbsvueCwM1?=
 =?us-ascii?Q?G4lURjCsDElI8SEfnEFxdDA5wnjGTXLOvMVnmD/Yp2so1c2FrazDinxWM6+/?=
 =?us-ascii?Q?6H1+OffA6JhcV9SP/QYdCq7ro7nm3dhLWxuukKy9wq6HpfugDPMNd5pZVGwA?=
 =?us-ascii?Q?qYHeRu2sj6GMbdtpHxKdqtnGpueVaRi9CGOORkdlUwXbusXRCthyoNwHA0eH?=
 =?us-ascii?Q?YtNVX4B6msMvMauUepMOFIgmMFS/tfDoCJKUCntzmCpXc/Q9YPuCmkU+9zbi?=
 =?us-ascii?Q?7u7cMJjIKNjgHFI+Y20x24jI4D71WtjNBkmBR7CMsl3vPLe+1UZl7Z0EZ48p?=
 =?us-ascii?Q?PzFqgG+EIhuEGWe0V9PJiRANAY4cbhXZyMwQqtJYPq9ylOiCj7H+KCFd6FBr?=
 =?us-ascii?Q?sjgtTanoH+a1e0laUGVZWiS191Gj+BXwH9tRNsd4qf8nwkQGBgBtuuGpiVnj?=
 =?us-ascii?Q?1yxEBt4g3RrlMeaivVFP4isPmDbXy6dfooFNLpM1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d06cba6f-cc2f-429b-c389-08ddb8031f7d
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 18:22:51.2151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yOk2MZojQwCQGQ7yHpZtbacIp1GdDu4g8tsc5IGcvpS1YfT3JMRfGzO2GqxuAp+EXbsD0F0YKRdSAqHVy1+UHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4781
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

On Fri, Apr 25, 2025 at 11:11:07PM +0800, Junxiao Chang wrote:
> MEI GSC interrupt comes from i915. It has top half and bottom half.
> Top half is called from i915 interrupt handler. It should be in
> irq disabled context.
> 
> With RT kernel, by default i915 IRQ handler is in threaded IRQ. MEI GSC
> top half might be in threaded IRQ context. generic_handle_irq_safe API
> could be called from either IRQ or process context, it disables local
> IRQ then calls MEI GSC interrupt top half.
> 
> This change fixes A380/A770 GPU boot hang issue with RT kernel.
> 
> Fixes: 1e3dc1d8622b ("drm/i915/gsc: add gsc as a mei auxiliary device")
> Tested-by: Furong Zhou <furong.zhou@intel.com>
> Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Junxiao Chang <junxiao.chang@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gsc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gsc.c b/drivers/gpu/drm/i915/gt/intel_gsc.c
> index 1e925c75fb080..c43febc862dc3 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gsc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gsc.c
> @@ -284,7 +284,7 @@ static void gsc_irq_handler(struct intel_gt *gt, unsigned int intf_id)
>  	if (gt->gsc.intf[intf_id].irq < 0)
>  		return;
>  
> -	ret = generic_handle_irq(gt->gsc.intf[intf_id].irq);
> +	ret = generic_handle_irq_safe(gt->gsc.intf[intf_id].irq);


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
and pushed to drm-intel-gt-next

>  	if (ret)
>  		gt_err_ratelimited(gt, "error handling GSC irq: %d\n", ret);
>  }
> -- 
> 2.34.1
> 
