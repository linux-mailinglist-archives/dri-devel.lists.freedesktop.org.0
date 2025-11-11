Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD0CC4A352
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 02:06:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 194FA10E4D3;
	Tue, 11 Nov 2025 01:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XdTf/fBb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C089C10E4D3;
 Tue, 11 Nov 2025 01:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762823207; x=1794359207;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=mbfInv4MkJk5M0Gg/gDdRXheK+KSHTo0IjgoNtHDIU8=;
 b=XdTf/fBbZApuPafaY1ZbLKWtWXBeAXdBeesnTnDz1GnDG8OAkVT2/4dL
 jTAA2ewuFxxi+mr8qevo36Zl1ORcupDOC9cT16ToQvZ3prHlcLmkXdVrg
 Rd2Rh4jVIfDJxD7uQ87gBJRiGVPKxwWCjMs+zxQyb1DlCQvLR43hLoszI
 RA0XDbY/gNZc1hVRpXeeKhAqdGzoDYok8/g2DtjihTpdPL4yM7qLBYtwS
 MylPevRL9aEuuo542DkoB34fwPHfcIH5wMAQKpcPpqwi2dAItVnI9RPMS
 ORP3EOgikXH431wr5LpUXioi76gOYWDQPx5SBET3KJ+T2UgxXXGPLBp20 w==;
X-CSE-ConnectionGUID: 294zPt3RS+21ZNvC+mQoDA==
X-CSE-MsgGUID: q5NtWSWYSPCBNDTlEzYGMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75985372"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="75985372"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:06:46 -0800
X-CSE-ConnectionGUID: dCFCUrwkT72TXlf1MbPSkA==
X-CSE-MsgGUID: nj7ao5scQzy+jtR7iTjHjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="193824747"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:06:46 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:06:45 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 17:06:45 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.38) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:06:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L5uaCwNil3enZxi1c4HKNyDBj9Eh1q2GvAvOCr5AfkdkP+WNaArIhkqxHMu5qRHH1fsTK644trMz/wDsQljiao0iPEBbReMC6w9+2QaNBk8b+nDZbjGhZ1XeEOYwkmTXEeStVeIzfRfZZx0iEy9HspjHW6Wac/nZugo09RyaYl6XVYtlifh7H2MrD+uO3KlfTKWvemzfHh3x0OYfFhhBjl+Y5bS4MuzbRkUEGt+JCeJ93/lTQ+D/qyc8iLsHOQTgFtKC8LZEiX8hnrXlzHVTAElkwhO/UgNANYu+LxWT1PhFU8KS8pcyj+gzBYA/KWcewG1Yr+2Tb71Jt7Pvy9Tw8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2lOHNlG7XUxIdI4w4Rx7YDO+HIGjpC4VkodDBoP2iy4=;
 b=LTcpOVixk5pmhk9vtpgFtHRDv6/KnljzVHTEr9pTc+e6WHIkR3G4e6DcGAFAr2ws5vvW4Yx+6TOstgL9nYG8QvMepwyFNTwiyDsiD/XrW7fkmWSUJQ86ev6XE046Fq8gxDqDkzk0HGz0/zAjv0zh+bJI7Q036IcPgHA5HaD36Ko2y2wiHZkenjZqHfi/+lR2Yi9+avuItYfTJDMdqeCJ89pDBoD8iQFsPMJF8gHbxV9AUrcHfYhatk4P3fULNuJ9srH81xjoPALqliWpE1qYzmGNHokp5+vqQf0s4soQc49yM4IlKsQECy0DNyK81vF7rmz4GC9rpVxjnfXWT26iIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CO1PR11MB4931.namprd11.prod.outlook.com (2603:10b6:303:9d::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Tue, 11 Nov 2025 01:06:43 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 01:06:43 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v5 23/28] drm/xe/pf: Add wait helper for VF FLR
Date: Tue, 11 Nov 2025 02:04:34 +0100
Message-ID: <20251111010439.347045-24-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251111010439.347045-1-michal.winiarski@intel.com>
References: <20251111010439.347045-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0031.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::12) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CO1PR11MB4931:EE_
X-MS-Office365-Filtering-Correlation-Id: 93747ccb-8599-4173-0893-08de20be9414
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2R4eE9kbENLaHJtMVF0ZyszUUI3ak5LbkN0b0NTSC9vOE16NjJpQTJTdGdG?=
 =?utf-8?B?L05USE0zdENSRnR6MllrSEJGcmZGZkd3N1B6OG5WL1Q5dU4rWEN6eWhSR0pO?=
 =?utf-8?B?d2toU2tpUXBLR0pFVkJjdlJzWkE1enhpQmJtTUlpM1VMYlZYSS80Y2NheVNu?=
 =?utf-8?B?bkl6L3lIdVdaT3VqOUh2MGIyNTJ3dlFNblI4SENRTHM5cjc5dW41ZUsycDV3?=
 =?utf-8?B?ZHlFSXJKREpWWDZnNGxpWHFRL0N4RzZpRTJNUVNJaUZVcmFwVXNvRlBXV0E2?=
 =?utf-8?B?Q3habW1qb05VcTZWRDhiSXlPN0Fha045RnZIbGl2djVuaTl6ZFdqNVZKd0ZG?=
 =?utf-8?B?aDZ2RFFrWUdGR3NSVHJXeStWREcrb2JJbm11dTc1QUp2S1hzdEhQUy91RVFW?=
 =?utf-8?B?aWRyVzZNV2l1ZDRXRUt2V0J1N1hKSkE4Yzl6Y3EyT0t6NVg5eGtkaVZDbnNC?=
 =?utf-8?B?ZmxyQVBBK2VobEdPSmVwcTRLS0p5cjROTUdoQVBXa1ZIS1NDQTNQUDQ3QmRm?=
 =?utf-8?B?eVpmRXBSS21HbXRuY1JzTWRzRUtGNU5yM25lL3J2R1R6c1FXRHVGM0UzcDMx?=
 =?utf-8?B?V0xhS3RwR0xBZ00zM3BOMXkvcHRYZVUzczRYdWhDbFZzMk5EbGVOWE5TVFA1?=
 =?utf-8?B?ZzZPL21ERlFKaDg4ZTNhbUpYM29KNzNEZUUwaEpPdUsrV3ZCY1N1Ujdxd3N2?=
 =?utf-8?B?bCtvWHYvSlNvRXFFMS85ekY0NW5yTGdOTVhoR09WcnRWdXFBOGZyWDhpYjRJ?=
 =?utf-8?B?cktGUStkcGpQalZtc285K3JjdTVtTDcyaXRxemMwNG51dXJWczNaMWNYQ3Ju?=
 =?utf-8?B?OUNYQmpQZU50QnRwNXZTUm9ZcGJpWlFQSVRGdW1URTNHZVBNOXEwaDNEY0RF?=
 =?utf-8?B?cmRNajJYMHpGQ3p4U2ZkcGtmMGllVUdUcHRjUms3eFA2MTNKTVVBRjJvbVpW?=
 =?utf-8?B?RGI5VHFFODRERGQxbjdnMjhKYUJYTzY4KzNZWUNnSXJBTmtOR3RPK0lYRGRG?=
 =?utf-8?B?Y1dvZENrNmxKR1g3Z1hMamJZMWIvN3I5bUZKZ3NyTi9ycjZGRGswekNQZCtR?=
 =?utf-8?B?a2ZOUFQ5WXowWDBCUWI3Z3VlNGdqcjNDVDBsTUFBbXZNeGFHZjV5RGR0dS9W?=
 =?utf-8?B?NUhveTNNVFNIM2NvYzNBRHBJRVhHZEdtMDR5U0ljUVNaaUFHeEdaVjJhKzNx?=
 =?utf-8?B?YWZVTkxPejZXZmZ1MVNpNEtqKytpa0JDN0laN203bkp6TGJERjgvTy94NnNh?=
 =?utf-8?B?NG15dldlQldlWWgvOGNUS0IydjY1Ym9oQXJpQU9raHEzQ3JzQ1pUbm1qOW1P?=
 =?utf-8?B?dG12MUg1S2YzS2RLTkFEc09XV1BTMVBQMzhScFdPRmtPdkM4WEdtalZOQXow?=
 =?utf-8?B?UUIxM085djNQdUlhZkdpRHFuVlFlL2hZVy96aUYzY1VHZExzSzdBaFZGVmdS?=
 =?utf-8?B?QUNNOG0yUFpPVDUyN2U1TVdxSHdmLzh1MHFFOENreFpFV2hlN002MDFicmZ5?=
 =?utf-8?B?ZzNFRkFJRjJrVHQwc0R4RWt5eGJEa3pibngwRmJMbi83Q0J0SHoxOUtoL052?=
 =?utf-8?B?YTI5a2RBTlhxeFg5UmF5eWtrdjlneUpFUG93eEJXQzF1THZzbWRneldzamp3?=
 =?utf-8?B?NzNJd01ta093bUtTUjdaV0VTUytpNGIwTkpGY2VXY25VVGNBUTRXZjdoQUxH?=
 =?utf-8?B?c1VrOVpVRTBtYnpURmh4bHQ3Y0JsRVFtRkJJSHU0RU1FOXRteEhpNi9jZEJW?=
 =?utf-8?B?WDFZeEJJT25hRUNNWGFOMEd2R1QxMWZCZTVoQmZZaEZyY1E1UDZudEEzL0Qr?=
 =?utf-8?B?N1Y5UXViWnVNVCt6dHlxWDZnT0VBUlFIcmZkTzZTWlJSM0lpbU8vSTIreFdz?=
 =?utf-8?B?UmtjeTgvUTBsMElvYWhydnpWMVZkekxlTHlydGdWOE53bW4zb3lIQ2dOK3JU?=
 =?utf-8?B?bWFqdm9CQURTNjFUK2F3bWcwN21ybUk4THcwZEVHNFhmYSs4WXNQbWlGbmRL?=
 =?utf-8?Q?og19D4ZX9VMJ24DjWFHo2kJq2gYMKs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0c2Z1JMaisvUFFTWEw0V3VmMEJLRWpJaE5rVmRGaENWTW5IUkUweTRRZTUw?=
 =?utf-8?B?STFMcGRGazJ2M3NtVThiS3ROZUllVk8rdm11NzhXeU9jVHNEakhHWVNZNi9R?=
 =?utf-8?B?M0duSDBmTXlpUjBwcEhYbjNHVThraWRaQjM3R2haYXN6Y1dQUVNSSzNHZ2RR?=
 =?utf-8?B?WXdqV1FoNUZ4L1ZZU0c1VW9BTnUvQXFhZnNrYTdWa1FrWGl1T0pWMTRNWUIz?=
 =?utf-8?B?UXlBZnhIR2dWMUJVZk1uL254RDRxM0hRR1MxdXgxTTVYQzFjWCtVQTNDbmNs?=
 =?utf-8?B?a2dWMThCTEhUUjMrSHdDbXNaM3B5R1ZjNzFlOXpYVDNpWEl6UklQUS9XZGFC?=
 =?utf-8?B?djIrNUdaSnpiQmp1aVFmR3k2QnZjSzNvRDRHa3ZQdzhwdjI4NVl3RExva0Nh?=
 =?utf-8?B?akljR0cxUERaMmRuaXBseXJIdTZvcXQybDdSTHI5WTN5azFDRjRZZEF2aUFi?=
 =?utf-8?B?UjE5VFMwMWxpbGdmbE1FUHhyRjhvV0thRlJOYWt0RVd6bytkREdxN1ZUZDhJ?=
 =?utf-8?B?VUJQZ1pEK2FEcDRTZFAvTzRTM0RHYklLOGc4RzhBUnVHbG5vM2xOWmp5NGR1?=
 =?utf-8?B?Z0RVdE5VWWsrQ2llckcyTHNoUnllajliMnlKbFZnMnlYSGNkREhpQ1YyNmpr?=
 =?utf-8?B?L2NLUDhnekpTMUx5cC9CRGtYZjNsa2pPa0dIRXVCR2lhdVQwZXdKaUtoemVT?=
 =?utf-8?B?VE95TnE2UElMMDYzU1RDMmVZY1NVTldrL2FScWw5YzdkMWVLZWE0bk90WC9P?=
 =?utf-8?B?TUNaY2dpd3RBS2hoZFRvT0MvUjNyTTVtaUNyM3JnN2dGY1pBVVhLM2d1ZXhX?=
 =?utf-8?B?cU5vZGtUajNkc2lqYUt1bTM3SkpqYlltaE9rUCtuVkloaGRPMzR4dDVUdkZP?=
 =?utf-8?B?U2N1UFlIVW1RWWM0UHl2ZXZrL2xONmFJTXF5WHFxRnErVzVHaXBLeFVGaHFZ?=
 =?utf-8?B?Y0xTeGZuSWY4emtscmh5bTN0YXFTbmM4V1ErT2FZMGdxMFM4NUY5VWVvbVRy?=
 =?utf-8?B?ejlvZGY5b08wTjRqZ0hFTEkrb2JMN0hRTkE4OUorMVJzWGdjOE1RT1pNVjU4?=
 =?utf-8?B?SXF2ZVIxUkcvdE9QWkh6WUJIMDNKQVhXSm1nOVJmZnJtZlg2QVVxL3ZSZ2Nz?=
 =?utf-8?B?MTZuTitNVWxBaEtlLzZyb2hTQ1ZJOUhEMHlRVm1wRGFQeEVsR1poOVVwL3VO?=
 =?utf-8?B?Z0dLZjBpOENqY0hpSng0elI5ZlN2cDVQUE9kaGVJOG0xNVNGOXJBVklPWUlJ?=
 =?utf-8?B?b0hJeXpvMTdZKzZsQzd1VFF2ZFdPMW0vdk53TnE1a2hPMjBNajFoTzQ0R1Bs?=
 =?utf-8?B?UzZ4c3FZVGJOeVplRE0wYjVnVkFBaFF4T0ozWUFlcmNZemlyWW5jWW50ZHBw?=
 =?utf-8?B?Ylpva0FqQnZpdWcyM3hNMUIzd0ZLbzZlR3lIMEpkdUpyMGRmMHZJdkpoTE1Z?=
 =?utf-8?B?UGdJMGFGY1d5WmIxaGlRMEpVS0NTNmlxYTh3TmMwYnR0VXRHV0J1NW10MTA5?=
 =?utf-8?B?MlFHOE9ZS1pLQU9RTWdaSExxS2JqUDdTYnRtRmRaWFlVOWVqdXZZc2xvYk9U?=
 =?utf-8?B?azNoQVd5UE1TQ2VxU29kUktiS1VWUWl3Rk1xeDV2ekJFQkpvcjE3dUJsbWVD?=
 =?utf-8?B?K2FSdmlreU5JZmloOW1xczNLd0U5N2lBK2xoSzUrSkY2UFdHYXlLMVo5ZXAx?=
 =?utf-8?B?Mkd2RStJOXUrSWY3eTVQQTBISFZFSGhaaG5pNW1aUVZnNWFhbldiU282eEdz?=
 =?utf-8?B?NmxCVHB5SVVFcmE5Z3VMblRIR1ZIQkZPMEhKc2liMWE0VEdaS1pmS2oyU1Vh?=
 =?utf-8?B?aUJQT0ltU0JMRjM3cldtY0JyaTlGSHZwVFRQWTlaSjBldlFienVEZlQzcmpO?=
 =?utf-8?B?TFQycEpLZEd2ajY4bWZzaUpEdDl3a3BVbkpwYU4yZU9IdVdPWW5WSDFRT3B2?=
 =?utf-8?B?U3BjQkFjOVl1N0tiUVoveTd6OHZ2a04yZnhuMG0vcUg0ak1tZ0lhaE5JdUw3?=
 =?utf-8?B?RGRyTGFxU1AzUE91UWpTT0Y0UWM3REZFa2dVeldCcVB2dGhJN3BBV2haSzM5?=
 =?utf-8?B?OSthNlRmaHhBeXMvVDdRTjBha3Z3K1N4Z2xDc0F6RGhpSFdBUi9wSkZHcFY1?=
 =?utf-8?B?S1R5bUFybnBqTm02SDB3OGZDOXVZVnVrRGthUmE0VEgrc0YwbFRqbnhUbWQr?=
 =?utf-8?B?a3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93747ccb-8599-4173-0893-08de20be9414
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:06:43.4415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fL9AGUvv3aPERv6ZONIYZwK/bw6fhyEeizCiBo9Fn+LyxRL2ngeLKi5GSg9EDxMpV4eKvnwuv/7sYu5/FYQOvhLDItEEfZC22hK2SnKkTu8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4931
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

VF FLR requires additional processing done by PF driver.
The processing is done after FLR is already finished from PCIe
perspective.
In order to avoid a scenario where migration state transitions while
PF processing is still in progress, additional synchronization
point is needed.
Add a helper that will be used as part of VF driver struct
pci_error_handlers .reset_done() callback.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_pf_control.c | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_control.h |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
index 86668bd4213e0..ed4b9820b06e4 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
@@ -123,6 +123,30 @@ int xe_sriov_pf_control_reset_vf(struct xe_device *xe, unsigned int vfid)
 	return result;
 }
 
+/**
+ * xe_sriov_pf_control_wait_flr() - Wait for a VF reset (FLR) to complete.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_control_wait_flr(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int result = 0;
+	int err;
+
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_sriov_pf_control_wait_flr(gt, vfid);
+		result = result ? -EUCLEAN : err;
+	}
+
+	return result;
+}
+
 /**
  * xe_sriov_pf_control_sync_flr() - Synchronize a VF FLR between all GTs.
  * @xe: the &xe_device
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_sriov_pf_control.h
index 30318c1fba34e..ef9f219b21096 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_control.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.h
@@ -12,6 +12,7 @@ int xe_sriov_pf_control_pause_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_resume_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_stop_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_reset_vf(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_pf_control_wait_flr(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_sync_flr(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_trigger_save_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_finish_save_vf(struct xe_device *xe, unsigned int vfid);
-- 
2.51.2

