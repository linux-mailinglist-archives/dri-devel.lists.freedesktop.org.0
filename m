Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNhOMtrWoWlcwgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 18:39:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5691BB8C7
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 18:39:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CACC10EBDA;
	Fri, 27 Feb 2026 17:39:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CIU9H9rp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 424F010EBD8;
 Fri, 27 Feb 2026 17:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772213973; x=1803749973;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2Frf1tjV4CUbXJYZVrZXKPisveUXvgKxhPor+N+QR4M=;
 b=CIU9H9rpjvKjkWSp6TlhGLC3fa1xYFO5mOjBkurkLwmKWUJNbK9wM+LA
 LZznnfDqscld/9aXzjQSV8NWlIfESzZyPziAjZTB6OSWnntzHUJbNX5Lx
 821NtaA2Ah9s41JHWrfifNewUfXQVOOjJY/Kk3uy3x9eioFAL7eQPEc6X
 X7U5jCtxXNw8b3sNNTHa9OcT9vrRwqNRFO7tWzd3eYH9HLUeUcWRHtqS0
 fb4UZC6XbQm+/zCMmah31i9QqyafPhbea8I3j0JFOl+H+qRKRKz5JxzA5
 Td1uSCHTnlhjaGrfzXdtWEAeoXQcqS8FT+E64sHix+49c0Ypw2FysUeTM Q==;
X-CSE-ConnectionGUID: JrYloFwYSzmdq0gW5bHrQQ==
X-CSE-MsgGUID: SR65W2L1Q+GcE8VbmyMF2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="83632848"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="83632848"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 09:39:32 -0800
X-CSE-ConnectionGUID: vmW8/eMGSDuVtAVCjunINw==
X-CSE-MsgGUID: KNTnwHHkSAiKZYwqL3AIGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="221100374"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 09:39:32 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 09:39:32 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Feb 2026 09:39:32 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.5) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 09:39:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kvawQVdLjR3DeIt1a8Tf58qmnaYwEbhvgVt0ceawZ3H975lJOtP3zO2pS924gSsJA+Ro0ZSs9UaXTEU41evFvNU3dH/0DE+E+FuttYyMFiicb20IWd9FT+/rDY9JOUaIajTFaZCSQ5jHjVlatsa+FQvymQD4hO+Z0KCkCJB60JyEj0hmpViSqKZ2CkG17rkKJai6gp0bHUovEuFd+JwfLNln7PqYKxmKqbIiEpNAjsm8bhmatBy0HABfYbgVfs1rkByy99UAMs3VBq2PMYzlMrfZWyTtJDAXtPTW1awQtWmARoNU5Yj+vH/lo0UbXfHm6Z6ayoZvqmq0i6fHnYpQmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wXbuOHdsJ9JVpfKDIYlhP8JWVP7gjjdeEOc/irp0lxQ=;
 b=vt7Vo1MkBhahtzp4yAsoEjYBlH4klmOyRsqfrwLMItRCySsGUrMikbWtOAzWqm+puDrH3NIJ0NzUqdEoJAWTTyTGkib0u5HW2tv70ePND6qbKrvnYDn4ppf+tsBMoG3Hr39pvglvtf3GK9JorUC9glcbwG6zXqq2Gwp3mHUOLpagIKrVk0XEgNuycXwsMGYNLssOh2/LWaGHzp0ErbPEW6t3Sez3LwjVIINQ7xS/ndrueqwp1hs/5x9ldAtXi95EPRQX03eJjTQWIfk/znW9iyAQo4YOCztclkW4VqX+de9LM1uPtFbCHZ7ndE2Axx9+oJeGT4FxNFhXe+SDub0rRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6533.namprd11.prod.outlook.com (2603:10b6:930:43::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 17:39:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 17:39:28 +0000
Date: Fri, 27 Feb 2026 09:39:26 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Test for imported buffers with
 drm_gem_is_imported()
Message-ID: <aaHWzrRqkrcdzEpW@lstrano-desk.jf.intel.com>
References: <20260227133113.235940-13-tzimmermann@suse.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260227133113.235940-13-tzimmermann@suse.de>
X-ClientProxiedBy: BY3PR04CA0001.namprd04.prod.outlook.com
 (2603:10b6:a03:217::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6533:EE_
X-MS-Office365-Filtering-Correlation-Id: de8dd91d-5e91-4098-490d-08de76272840
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: oTy+28FQ+srLBJxh9vpKQ0UjDGelkW8n3t6viOR6vk3LetKz/nohbgr82o0Lb0V5AO6B2SCmFIypeo29KywU30+gQQZsRPVglhDBw8BfgCFrh+Fjt9aXsGdh/x/aftPyfzCmfITIxqvJdUAKIVk5M1Zh6IKOEf06jeYgJALN3DpuMn3YALpTutf6sVlio3ofgRHxeKozFI7DTN0qWqG67cIZjercq6zspgOtz+PlkjDytY2/TfOdzGEO5OA9aiM86FhSaLjsXfKzFjqK3SfDarlzrvaCC0gURf7TWoRX/NS965ZYmYprADukacfK6cUmeX3U++AvWrGLvepUr1lVerkEbG2eN9qF4VsXoCV5H+U5TxCuk7E+lElhLp+kA8yEIDXupj2Rd9k7J3RKdMeD/jFXzgQhN/JCT2kIZ5WcqamMG2rnkszdlNCaprFPKUyumtlYD13KqNiwiKyzUoeT3qFhD044HdQPjR50tMhN6LgiojccDwfvIY8/60C43fYgBwbXtc/nZkKOtpyy+Ss18H9Kpm6FGmTDLsINePqT7ZFoGSLbNcBkzBaTKeZObxmF2lV89ngas0BuXvfK1RDCU+vSgeVBrNOJtKhPJJzj1m7zRWvpDioRMXNv3nFwpmCH4TKDuq+eb6GckZ/K4/bwHDCJM+NFB81/wo2XU12rr3aqgKQDMIzCEN4ybziG9bfPmRYyN56Mha3aa3/KjzyjF1CN0RNM9RLc+AyrnBjWNnY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ZP1xSks5tF94hOfumT/erXKnEXz8/bvgIKfTf0UvlteH0WIRV2gH2eNbM7?=
 =?iso-8859-1?Q?zB6L7fdol9V3oP88LBWg99QzwLSr5NOUqYmqeqEMozJuO0063GNAfY0q9v?=
 =?iso-8859-1?Q?ekOitvdPfiiazqa7FQ/OVKChYOLQu0vfc28rOWLFHnF48EPKhiDPnHhCl7?=
 =?iso-8859-1?Q?P1I7ST22bJxzIbbGq24i2SF+DwBod35X0WD5b1ZEf0yGD4L8AcWGhzLOoW?=
 =?iso-8859-1?Q?ZfyWeJSwVis5qxZIq+2IEXBQ0zWMm8kv07s9AMxW4yw5z7nZxSLuhVfdNB?=
 =?iso-8859-1?Q?3aLEY8pTVvkQzIDK/6MiQJ71zegn0E3FsAqtFf5/Kxqteft/jtLYLXAO+i?=
 =?iso-8859-1?Q?9oLLDqQggfxSeKk4HBF5bHSoGY3bY5HVyWQ4GRGO3cN3Ace/rfQYQ6X5ow?=
 =?iso-8859-1?Q?K2ILqyOXOk01N+kI6+buVnix9AEtDiRtWvPzeUuehfScvIC2y32AJeABEJ?=
 =?iso-8859-1?Q?lOGclVAP1/B49fnDMPTsrmhCQF0HbnLRj9KB71SuU8n5FR5gG9WAM5VkH+?=
 =?iso-8859-1?Q?QbGh33SiUf1s0LqHDuFcuotCz3oOnLe/tCCAjp3TNIBk6W4ZdHzBKKLSmg?=
 =?iso-8859-1?Q?VbZqr44qtWgCx1JFH4AvhrZfCwbx3dG4cifiIXlCUGjahlw+246FCkG88M?=
 =?iso-8859-1?Q?jK87j5NqGveVIGGITIuz7juoib5ZTR4+GIfKycT5E3Am/2pdthzNUwIqn1?=
 =?iso-8859-1?Q?YnMPxgK1iA+6oBGReALC4S30Nb4ESWGMy1hL3ldV5BgO9794Sg3HGLNBr5?=
 =?iso-8859-1?Q?YO9PshquQh5nSy+KfXBhg2ip9C0tl5IFgBcMJhL061LFL9kgNPcWmDsVm5?=
 =?iso-8859-1?Q?Vk6Qy/RrB5c8bQy6Vqj2reO67OKI3YUlLbV3BYZQPlRhOPAARcMyEcW2gw?=
 =?iso-8859-1?Q?LFHllLzd7+txfml2Pc0nqUGEywvRU4icgmoUQ9x0urUkg+iFCS1g2ezpRq?=
 =?iso-8859-1?Q?v9RqFlsWt+X3GzZEVk+itSROJZO04oMLbjlni9/xjmwdnpVn90r1QrVy9k?=
 =?iso-8859-1?Q?6VJwWbxryJ6vsWYmnpSVm0NWAEyR5aPHSEgn3Yucc0IvBuF+IpVifMNLuu?=
 =?iso-8859-1?Q?6tpUB/GT385sndFlVkeXoH0wCTYYMpeUoHbahuaXVr/E8VOV8uYwCb3m+t?=
 =?iso-8859-1?Q?zL3OrhiOZxi3phuctkyhU0nOeqk8UCvuCAbDgaIHx+nScc0ICoSuPlTNL0?=
 =?iso-8859-1?Q?8zcIatXQyq5OF0QY97RJCXvTvYO7KEvFVs43z7kNIPoyy8efC9DvgNxiV2?=
 =?iso-8859-1?Q?OAXbHb0TYY2G02j5QMMPQhG6GmQKmR56iJS5N0yP4xMxpzwVj7otMWCG2g?=
 =?iso-8859-1?Q?XhC2m167MKp5/3t9n2g445Na3nFf5gZo+CJX62JwfQESVqtTN4RsodS2e6?=
 =?iso-8859-1?Q?Sltzm8g10TutitOWN088JF2FjXnn0vYARWklgkBG1iO73b/QJGDq18weF3?=
 =?iso-8859-1?Q?pcEaphVfBbCXsmqnYeL4tfjurM5ups4D/8NCu7s8Os0W2w7oQ5WNoXhv5v?=
 =?iso-8859-1?Q?FtjW6DS/uTkf1+8hWeY7/wXV/AqALoRdFZ7rNEaK//bI2fdzaT1YBR/YjZ?=
 =?iso-8859-1?Q?MX2Z9bWO4WPYcxU4TIAEEtiwt8HJMoRlRL+8zZXgvJBLQehLFHtxUFtnjC?=
 =?iso-8859-1?Q?q867KIPJUPMWqHslxCIqIk1V1rJ9ibZBHVM5UGVE2SNF3wYyc/+kcUGlKe?=
 =?iso-8859-1?Q?OWXKofSwZHdf1O71JuupXQI0i8gTqWPVE1Bz8y/cagUiU8Uwk3Z5snk95h?=
 =?iso-8859-1?Q?dgUi6r6Xfo6vRDh2jfRzQmfPXMWyDvPWoA52n1h5ku3cooM2Xc3QSIv11G?=
 =?iso-8859-1?Q?VI4THtsIzg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de8dd91d-5e91-4098-490d-08de76272840
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 17:39:28.5945 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BWGOQMRhe6N9TCs9iXPDAylA+s3K/euMa4V/MPNXJZfk5Are+cjVKFQecKeM7agwqnjxJwjyumivVR1vaFCdkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6533
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,intel.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,suse.de:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 0B5691BB8C7
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 02:31:12PM +0100, Thomas Zimmermann wrote:
> Instead of testing import_attach for imported GEM buffers, invoke
> drm_gem_is_imported() to do the test. The test itself does not change.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Matthew Brost <matthew.brost@intel.com>

This looks better - Thanks.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 8 ++++----
>  drivers/gpu/drm/xe/xe_vm.c | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 8ff193600443..b28ed3fa370e 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -817,7 +817,7 @@ static int xe_bo_move_notify(struct xe_bo *bo,
>  		return ret;
>  
>  	/* Don't call move_notify() for imported dma-bufs. */
> -	if (ttm_bo->base.dma_buf && !ttm_bo->base.import_attach)
> +	if (ttm_bo->base.dma_buf && !drm_gem_is_imported(&ttm_bo->base))
>  		dma_buf_invalidate_mappings(ttm_bo->base.dma_buf);
>  
>  	/*
> @@ -1707,7 +1707,7 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
>  	struct xe_tile *tile;
>  	u8 id;
>  
> -	if (bo->ttm.base.import_attach)
> +	if (drm_gem_is_imported(&bo->ttm.base))
>  		drm_prime_gem_destroy(&bo->ttm.base, NULL);
>  	drm_gem_object_release(&bo->ttm.base);
>  
> @@ -2829,7 +2829,7 @@ int xe_bo_pin(struct xe_bo *bo, struct drm_exec *exec)
>  	 * No reason we can't support pinning imported dma-bufs we just don't
>  	 * expect to pin an imported dma-buf.
>  	 */
> -	xe_assert(xe, !bo->ttm.base.import_attach);
> +	xe_assert(xe, !drm_gem_is_imported(&bo->ttm.base));
>  
>  	/* We only expect at most 1 pin */
>  	xe_assert(xe, !xe_bo_is_pinned(bo));
> @@ -2899,7 +2899,7 @@ void xe_bo_unpin(struct xe_bo *bo)
>  	struct ttm_place *place = &bo->placements[0];
>  	struct xe_device *xe = xe_bo_device(bo);
>  
> -	xe_assert(xe, !bo->ttm.base.import_attach);
> +	xe_assert(xe, !drm_gem_is_imported(&bo->ttm.base));
>  	xe_assert(xe, xe_bo_is_pinned(bo));
>  
>  	if (mem_type_is_vram(place->mem_type) || bo->flags & XE_BO_FLAG_GGTT) {
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 5adabfd5dc30..052ddb167dbf 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3604,7 +3604,7 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
>  	 * with a PAT index that enables compression.
>  	 */
>  	comp_en = xe_pat_index_get_comp_en(xe, pat_index);
> -	if (XE_IOCTL_DBG(xe, bo->ttm.base.import_attach && comp_en))
> +	if (XE_IOCTL_DBG(xe, drm_gem_is_imported(&bo->ttm.base) && comp_en))
>  		return -EINVAL;
>  
>  	/* If a BO is protected it can only be mapped if the key is still valid */
> -- 
> 2.52.0
> 
