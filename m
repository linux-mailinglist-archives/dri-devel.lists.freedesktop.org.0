Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA72BCFBD5
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 21:41:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2561510E35A;
	Sat, 11 Oct 2025 19:41:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RBHmijhq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7562E10E358;
 Sat, 11 Oct 2025 19:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760211714; x=1791747714;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=3I872Xoq9xO/OQs0bZRztfwBaVHQ85jAbFe2Vjl9Yuw=;
 b=RBHmijhqq//XFUM0OOfGr3bgz10yvNHLDvfDSnGYnAyRXLWuuxn9Gscy
 nuU/i6jnjffMAIkjbfkv2t+JNWK6bAfm342UsR3FPO5Hi9y9LiwYWrJCY
 n36cPFu9jd6oOZkOG9+2X8SGyYhPxdSeRie5KJx+v+rjgnveLetfyv8dv
 fF5i6ftdmBxJ1ZdcO3nhC/3ZIwBtRTPfXgHbpPdHo3HeZ8QM7i/o8CLsU
 9SjS7J1WZHsBdzhLaGBxkfou6ZaDbJgvUCYIDec7sR711PvyzTvIdAt2F
 XvrkfpjJDPLrEUumepJHql0CN7Otyyk2kkLvEzaLRta3VfJVOpcWK6fsj g==;
X-CSE-ConnectionGUID: ihBQE/1hQp+29mVjkpTRcg==
X-CSE-MsgGUID: OI8IAeNxTu+rfwGtM6Yhrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="79840943"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="79840943"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:41:54 -0700
X-CSE-ConnectionGUID: WhTbUekISaOBvNqE82QGjw==
X-CSE-MsgGUID: KzUBeuXWTeqBSPf09WC1tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="218344777"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:41:54 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:41:53 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 11 Oct 2025 12:41:53 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.57) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:41:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HOGeO/mU2CyA2idTL2rN4waosWNvXPj2nR6JVZnw8HoLCTLlc9G9UG+JrjU586TZuBWg74ZTkDTA+yi1UaoVgPh8HV4b3ToNBRq3u9w+ypF2OVAalJgOl5tdMNAWZex5mJwi9tcm3AggnHfekjNfwfNdZ0SwuaHUleseEQ0iCl3XdhU9cKw9cOAXRmAYhWSpjjvDPKgwndb1keyIKeuYteTEWkvZ7HKJ5bKWy9HgAO5Mcs111AreeefQGtT7/JTs9AVP71kbCxlkPFAc+8UdZl1RQyHLG3AqMa8QLjfQqaYWtSyfgSF1/Z0m99Q4yRoRM9OVqJr4feE//9NmtaMQEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35W+J9WhmIccB1ZZkfv9rMlHzJ0YENa/0kt5F5eodbU=;
 b=wvsGrL77+Axx9ZMf3NfsM/4xSlIHpXoPPIjgRpaJTj0YfzMwU1rHj3/l+q9hY+ZwNHrlNt4EghtwIkPaFtZvzU7JQhPi2AJpB5gi5RNMxHXiizaQqW2kW0/KrGuUP+jwVUU6swKXGSs8nXMN5vHT6Q2z3Fb6XYmgBVVlHaGXUuDBWwV14IdZcmH0MBo8AK0V/490NF3KGKkSpHArEx3dSgB7ZIjiXV+VJ7Pn/RqPumiJBLCLvVlRB2ZRsP23KmmkRNr15t9ZiWpRTWSX61Mv+FLY3Phy6oCGgM0H6LV8Yv5HDXWTZxH6KqSNjGOWDSeOJ2jlCDLjAJ+DnHQWVPeF0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MW3PR11MB4681.namprd11.prod.outlook.com (2603:10b6:303:57::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.11; Sat, 11 Oct 2025 19:41:49 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9203.007; Sat, 11 Oct 2025
 19:41:49 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>
CC: <dri-devel@lists.freedesktop.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>
Subject: [PATCH 21/26] drm/xe/pf: Add helper to retrieve VF's LMEM object
Date: Sat, 11 Oct 2025 21:38:42 +0200
Message-ID: <20251011193847.1836454-22-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251011193847.1836454-1-michal.winiarski@intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA0P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::28) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MW3PR11MB4681:EE_
X-MS-Office365-Filtering-Correlation-Id: 470fb2ed-5f02-48a7-3fca-08de08fe3847
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vt+6AwC9f6W6QTkIal00AOHAT1Buf2rzEGy8frJ06V40cilmK1GqQFBG2Kg9?=
 =?us-ascii?Q?fWghNpTOW4E0y2k6VVPP3R35DU7UgC3/iebMuksd9aLrgoT+kUh7RYKFSBiP?=
 =?us-ascii?Q?EPkgW6Qe8XvfAmyXUNjaRSZZa+E2cbbEfvUFejTSvyqfyFJn5Su3NUCL2fr1?=
 =?us-ascii?Q?6ww73JO17ZqoaiMbwM9K2+b5KH/vppqyI+C/bmRUtjcYs3e5v7uiVS5jsUNY?=
 =?us-ascii?Q?eRFqjyQHSif/ofYYmGjleY4hLGIbmNSVU5sCydYhVsfF1ikMnocz/ZXNFHMR?=
 =?us-ascii?Q?PCGkUzhBUTsl/D8MinDdkuit2qWj7QceYJU22PJjjJghvB3mWLOXxU99EJrx?=
 =?us-ascii?Q?yv64g5y/2bNuUX8oKNMskG81u2eaV1Jw/KJ19YOg5mX+NYeeMK3DpHvMvfFa?=
 =?us-ascii?Q?T04dZm+t3fdGDjNz73IW5cGTt3XaD4R5rxNnGtF43gYqtXHVFOmYUdMtBHh0?=
 =?us-ascii?Q?+BnQPQCrGjikCq5OzGYL4bzfYj7cOper1/Rmu/K8a4+rV2ITU/dN6V1kVI2F?=
 =?us-ascii?Q?pISRVeyivu9JgQ4ZuzCWGOfrhmcz0JNhGZKFoiJVzZNIpULPPMB9tpfdKVCy?=
 =?us-ascii?Q?YJQbdoP3EivLGcRWOnmJHRebzIIZsbep0by+t/vdNYNo+7s7Z26Is7K3upBv?=
 =?us-ascii?Q?Imm2bsLk95iNXlLyTot+oYp/fxbFx1Y3IRwvTIrEfbBVoaOmB5BCy6Wczrp2?=
 =?us-ascii?Q?cNUb2aYO/pyhmMzWR8jg/HSGqyzH4agxKqXcoAbWck4uazdGu+0VdjjPFtxf?=
 =?us-ascii?Q?rWrwo/u0ciI0xeY6Vp1I8HWgUh42s4ZJXXWpj1Qzi9SlVL9c+lE3+fHMliEu?=
 =?us-ascii?Q?yrc9izEka7IykldAgUz4poPD5qDNKKrTwDJwVp6eMsWf4MgvwyUWJQii5Uy9?=
 =?us-ascii?Q?7FwNxo2yQCYntV/a+FgolQmwE3va36U9P/SPtpl7gG2wDmvOf2lGqEDuhBBu?=
 =?us-ascii?Q?VtkeYfl/l8ps9I78Fux/WkUG3A9aBZQEeBKaYP5Cods02cRknaEm3Jk0B3/o?=
 =?us-ascii?Q?SAtZ9F4uXeupndRY6RQwTPKbPWu2kCBR0DQkov759CFNoFWD2Td3jvNEsZcW?=
 =?us-ascii?Q?K7YWyNQZUSabW6FL9fVYTkk4wlWjZRPpO8iDbU1ybN8y3aIbxgYc9ENsO06a?=
 =?us-ascii?Q?Q3DJucsAev6wT2ngxylit9pAB1t1LbdtXFrfEeuqL8jFN0aE7f5N9q0CA2sq?=
 =?us-ascii?Q?zniQciZodUjolleXDAn1bobeScpHgviNPVhAdrm5wp1nKSm+7x5R+Il/pKy3?=
 =?us-ascii?Q?yo2mHZIAEydeM7FN6h3mNKBOu3Ix7+24wTvY1PPQAmS3OZxk+ChhpQ1s7nCw?=
 =?us-ascii?Q?szSWtgwtMMzGcGYiPZwI/PuKn45GNpvJ7ZDIEpzbIW18NTNh+D73eTYoH4EC?=
 =?us-ascii?Q?WG3lDFYmB5+H3flyXmIQRq5ew/3DtfyJer21w/KkpXa2VDlirVAfGCxBL4sa?=
 =?us-ascii?Q?+498ihyd41zd8NlnIz3HySMnncI8mJMtuIy+XhhAUHfG9mJajcT9Q/H/Xa99?=
 =?us-ascii?Q?KlgCV2KIhVxUcTg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kQG1ebY/wympmnugTYgoRVWqGN6ust1EkJhYugx+qjCPXyHiga66mWjX98vJ?=
 =?us-ascii?Q?SH3IKNDtG9LTy+uHsqx0UzN4+EMJ3aJvPenmP/PTTPGPrDfxHFjtC8wfmq6C?=
 =?us-ascii?Q?3XrbYvrNlhibHn5QALDXCAbF3ouDTmkO8AQ4rpICa/NTKzJlJF7hDkpMdi+g?=
 =?us-ascii?Q?G0q/OUEQHsw5+qLUPc3pKw4GLI0bHwISzO3EldfaUpU7ilyY6prPg+hlkw8H?=
 =?us-ascii?Q?QaOqKtMXwaARGzkhPn7/O/nrJrF/YMSMLrl3LyIXdy2yBs35+gxPcH3TRuqy?=
 =?us-ascii?Q?uigvy91tLnMtV7VsdlJIsRp94S3HVuw55hhMDYcqRG3V3qBCM/y4cWvrA5yv?=
 =?us-ascii?Q?kjtNhBJFhNbE3Ojja5qM3SyR7gYbnnJ8k3ytt1MY629DkcncM/ADgsIU9bHC?=
 =?us-ascii?Q?dw1qsoCTQ+4lHGi1d7P1iFnfjbemajB5YUdOSPhT3jMqItGV5FvFDj6MRRLa?=
 =?us-ascii?Q?OUVcD0BfEaKspW0WVUBSejIoNizkiLru7QhZz9ookDck7j671VBNhodtrgpE?=
 =?us-ascii?Q?V0nWrqzZ8Kr9HB4DF0UMkABgnyCxzdJTyv8WUs/Uvcl9FvuGOytUtNA+UYo9?=
 =?us-ascii?Q?E/uUbPPXVfQkD/Yvw1/d1uQLCmpF8j+sLlBfyInP7skeuEIchDExW8HKkHHf?=
 =?us-ascii?Q?1rxbP66cEkpcTNkG4XZMNbDeZnR8kDkf5r5Aud2SRAkv5FHxg43yy9p7767P?=
 =?us-ascii?Q?RwNsiY2C28KsVzFZbmdG8xvGBoByIJaRKtxWkdj7dTZaThUs3frECkByB08P?=
 =?us-ascii?Q?dqT5j9hGM2ptVA7HrA3hKgWjz+XQ8HTIIAd/5kGvYS/p0W9DaEdavrbWVwpt?=
 =?us-ascii?Q?oZxau324PGmBGXvthJzPUaIF/eDiT3TSupxv58b9HxL/gHkmDoBz1I6mTIP2?=
 =?us-ascii?Q?qczfSzveGfRvLxo00Mt7CrkoBxBgY0EykaLsm7FnNvhFDmHoZEgE/p/Aq5re?=
 =?us-ascii?Q?aCcwKZ9mXCLrXoXz+ao6af7S47sPNmU3eYwHPloeh/UmWVb8JWh2npdYO7oy?=
 =?us-ascii?Q?JGVylLb16klUp5SXYZdTDgQ4sJnSiJnWQmMVSvJDpZKasuclh3sAK8oVV/HL?=
 =?us-ascii?Q?Rhy1KbNT/Bfl/QwBnaP6NDZT3G6POk6I9Jc7+b45BYdKg74jLhHvlMP+X2Kd?=
 =?us-ascii?Q?Et8HWqM7QXaITZIRcqokN6oXsfTfOAeyHTBLcBDRud0LeKS/w3KDNylULlm6?=
 =?us-ascii?Q?oAvUMSBW65bbxxkLYN0XF5ZnYR6+NJ2/gruEOtxNmqOM1G/zB8HJBocdiEhX?=
 =?us-ascii?Q?gDlH1Vm81pFmhBO6icZiiugqT8uU3g3Rj8v5r1XXUKQu+lk8EP5aDgUGqHjA?=
 =?us-ascii?Q?Q8JvYID06fUatvBHa+rde3/xGzNKUiWXPGqo/jmykH1VcbPJhJ5wM2gR3mNy?=
 =?us-ascii?Q?WnME2KIj/vqj1aiP5mJWriE/ZRoDOLbk42VGBEqEwt33tp2/oRM6C/CyfsFq?=
 =?us-ascii?Q?j+3gNV/pLQjalcdoY4DqyLxV+00RArtxE1xQAAWCTZkbKV0EhEhW1sgSmBKM?=
 =?us-ascii?Q?I22xYbtetXTxbdv/EI1sGaELVLhv+DTgcTXTkb2fHkB/euGfpSvcWRt/jSKx?=
 =?us-ascii?Q?G71tv2fw8zxX+JNBUn4eDAyUJUWAbD0Fhx1gW5N1p0mhBUjHurrZ1Is9wr+/?=
 =?us-ascii?Q?cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 470fb2ed-5f02-48a7-3fca-08de08fe3847
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2025 19:41:49.3433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tc2g8AAvcfG1/eOcyebv4iRLGcjw8apdfklyRq4R6mocsCd8zm/8neKtdfGiHk3ae2xZGq3JTEVMESY2sY6+8Md+GPQJzu56RdhfHZmeDbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4681
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

From: Lukasz Laguna <lukasz.laguna@intel.com>

Instead of accessing VF's lmem_obj directly, introduce a helper function
to make the access more convenient.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 30 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  1 +
 2 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 51027921b2988..94e434cac5cda 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1662,6 +1662,36 @@ int xe_gt_sriov_pf_config_bulk_set_lmem(struct xe_gt *gt, unsigned int vfid,
 					   "LMEM", n, err);
 }
 
+static struct xe_bo *pf_get_vf_config_lmem_obj(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
+
+	return config->lmem_obj;
+}
+
+/**
+ * xe_gt_sriov_pf_config_get_lmem_obj - Take a reference to &struct xe_bo backing VF LMEM.
+ * @gt: the &struct xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function can only be called on PF.
+ *
+ * Return: pointer to &struct xe_bo backing VF LMEM.
+ */
+struct xe_bo *xe_gt_sriov_pf_config_get_lmem_obj(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_bo *lmem_obj;
+
+	xe_gt_assert(gt, vfid);
+
+	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	lmem_obj = pf_get_vf_config_lmem_obj(gt, vfid);
+	xe_bo_get(lmem_obj);
+	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
+
+	return lmem_obj;
+}
+
 static u64 pf_query_free_lmem(struct xe_gt *gt)
 {
 	struct xe_tile *tile = gt->tile;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index 6916b8f58ebf2..03c5dc0cd5fef 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -36,6 +36,7 @@ int xe_gt_sriov_pf_config_set_lmem(struct xe_gt *gt, unsigned int vfid, u64 size
 int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
 int xe_gt_sriov_pf_config_bulk_set_lmem(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs,
 					u64 size);
+struct xe_bo *xe_gt_sriov_pf_config_get_lmem_obj(struct xe_gt *gt, unsigned int vfid);
 
 u32 xe_gt_sriov_pf_config_get_exec_quantum(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_config_set_exec_quantum(struct xe_gt *gt, unsigned int vfid, u32 exec_quantum);
-- 
2.50.1

