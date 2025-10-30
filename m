Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E25E1C22450
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 21:33:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA09D10EA6E;
	Thu, 30 Oct 2025 20:33:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G74izbUJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 061DE10EA5D;
 Thu, 30 Oct 2025 20:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761856411; x=1793392411;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=eRGAPhQoWm3OQhirVZuhpBHgeWjaBjIl3eFZ7zT44AY=;
 b=G74izbUJ71A0UWK8c6a6tmwayhiJdcFEd3Vt/gLlOyySL0xYMrIpcTM4
 tSrMcAWistzUrbNNRSwprKK5+tzU+GVJJ6LZO3itmQgyOGXm+xkS5Nl4C
 1jd58kI8iZ+VlzKgcBsVTml7smH31ILuDT2Ws5ZaQxP7LTkknykC43n92
 uT3Abxej/bhpSQyixyyOUuWtfoEyXU89h0IhZkwSPhVFZwuJpNKRiSFPK
 b0l/JgmLspY/KxAsozIbCmMLfbyAUwCQTE2J0I1AlK9TEF6JjA5CQRa0v
 yEO5H78k2Uwm/kyvPehJI+hguBOZsTGcsYSdmi1Zab3FZaRoGZKkHrZVH A==;
X-CSE-ConnectionGUID: cUPEBOlFTuiNXDnlYBWOOA==
X-CSE-MsgGUID: h9i1VcA0T+ylA607b97Mug==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="67664324"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="67664324"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:33:30 -0700
X-CSE-ConnectionGUID: dPxIUU22TvW14M2WQNUPww==
X-CSE-MsgGUID: 8kTnCoNFSoqz2DNpASKsXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185262666"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:33:25 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:33:20 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 13:33:20 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.67) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:33:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wCJ+o4gHIMyIGPnA1IeAhXHyeeFrcVb/TBB7czXr/asdJFJNWX3WS+2tBZBlWSGtuV0XU+o/wdAZk1Q+1RwAKiLhdb49H7mHAaeDfXWQgZyrLS1T79QiH+9WlJOBSiXPnlGlnqrJ0j7kEjwIiSgpKI7aEJuT3OL1gGvFKXW73/roGQkcj1LYurDHB1c1V+fphi4SXiZG1S+LfbxZHoO1qRPZ6FehkOkHCGawWyiVaUxPQa3CAu7WUNOuA18UZhanFuwzOAazLVRt3wrQD+pdoe+zHWIGDYgp16SQG0GQa3PXlL7UtKWPztxAMjsBILFkcUHQT7qygNppGXhFlJ8r3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rIOfiIi5TDjMWZw4zr/LGICxmdvKYDtmZZ+s1ULgmPI=;
 b=qrTCUfgtV0rBnpHVuLvILBm508WkNaRtF4SLCzFffG0TFQCkS7rUQt/TgEDI1Nz8UCrp97LwiU1AtE/jZsxGn8bUUETN8WAqIvZG495uqVokjV2BH/RPbHi/5hpNoC8GFaBkdmlgIdYkDlvoSzROKqeM+2iE59+EBP6TjZnwhgPcgu+M7ug3C7gkMBIdeuIS1JrfFOK+rwnwSco4q/A7J/uMDxv2UjdZbsySnKn0c1hCLsFJ+ka7l4dgDxzf4QbVjrXmNCZOsYIsG6o7pxFhJN01odzRao29vUQsPyC1nY6Vc6jzhyk0MJ6rD3+2PTJxMbnMgNSh02uoA718lNPUrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM6PR11MB4580.namprd11.prod.outlook.com (2603:10b6:5:2af::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.14; Thu, 30 Oct 2025 20:33:17 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 20:33:17 +0000
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
Subject: [PATCH v3 16/28] drm/xe/pf: Handle GuC migration data as part of PF
 control
Date: Thu, 30 Oct 2025 21:31:23 +0100
Message-ID: <20251030203135.337696-17-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251030203135.337696-1-michal.winiarski@intel.com>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0115.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::13) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM6PR11MB4580:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c2ea2fe-115c-4869-fc53-08de17f38e7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Yy82ZXBjbk5ITzJidXhmMm1mUDNXUmw1bmtrOXZNOE55Vk9IbnIzODdLZ2lD?=
 =?utf-8?B?UUxHcEtIUlh5bkt2bWxNZXhNVmhxUlY0MXBIMHgyQWhWODJWUW5WZnVUYVJG?=
 =?utf-8?B?YUJPYVRCZFI5c1M2MmJ2MG42R0pTNFl2S0pzWWxWeWh1VHF3cDk0MFNHODJZ?=
 =?utf-8?B?N1QyMTA0TStXcENIbWJKOVpkRnNHSVZZcnNsQkttUGdKVDgxYSs5VlJNd0Fo?=
 =?utf-8?B?c0ZtNTVSY0I1ekowVGRRWkpSV015Y2xQY1VWKzBkRkNEb3k0c2lSRDFQRHlM?=
 =?utf-8?B?S3RQM3RPRm1QSldBZy9EckQzWkFEeEl3TTQ5SlVlRk92bS9uUUcvV1VZaWd6?=
 =?utf-8?B?Nk1GR2UwZHowdGVqRVQ0Sk9weFAvcUF5b0NRSU1Fc282UUlEMWRBQXlqdGxZ?=
 =?utf-8?B?VVdrNUN0MmZ1TWZNYStoWEVqS2xzdkJUQytGSWJzaDhseVNzcVlJWVVUTUpU?=
 =?utf-8?B?V1V1S3B5Umsrb2xmZkdtOUJ2bXRURUNBQ3Y0OW80NlEvNmF1dFNQdjkxV2cx?=
 =?utf-8?B?NmpWM2FjQmkrUHQrSW5Wb2FyOWhTdVZwV3RIY3UvcWhDZm9DekMyWmlsVUJq?=
 =?utf-8?B?M0FkTDhMbzdHVmRwM0hTbGN0M0NyWldLSzE0RHUrWUt4YkpFS1ZyOVoveXEw?=
 =?utf-8?B?RTlkc2pPRisxeWdUZWt1WHRyZVhPbWxXK0pPN3VvNEt2UW1WaFhtOXFFamtZ?=
 =?utf-8?B?TEJHTk9pckx0SGdIYXo0Q2NyRDA1VStwWjdPUnBLOWR6VGpRRDhPTGpVcDBE?=
 =?utf-8?B?UTFSZFVoWDJwanpkTjFTQUZab1VNUWpUQk9sVFNrSFJ6UG1mb25nMTdoZXJS?=
 =?utf-8?B?d3RLaUUrb1pOeWNLZU1mK3NzNEN1MWRLNDZoL1d3WUtXT05JbDNtVm9BTFB0?=
 =?utf-8?B?Vng2UDYvRG8vKzZzTFlDeXNWaDlQR0xWcDE5QTZ3RTJqR2pHbklRZ3ZabDBU?=
 =?utf-8?B?VmhnS3ptdzFTMkxXWTNRMDhNRWNOcHdXalBabmV4djVYYW5EdTczVHF4eEts?=
 =?utf-8?B?OXlOSnpkUDduRGFaVHJlUm9IL1ZXQ1pUUS9qb0tNR0FyMmxRNlBla2tVUzFm?=
 =?utf-8?B?aFZZbjlyL3pXY0NRZ3FvQWM4bjlIeG5LU2hRNmRYaHR4WXR4MDNnem81Y3dQ?=
 =?utf-8?B?cGQrbXU4RGpGQ2ZBb3l1Ynl4aEVoaUFkdnFpdTNmRzU2d1o1Z0dtem10b09t?=
 =?utf-8?B?RlVNRjdhVjNsblJnZjN5TWxLaDFLQkxqU2RzOVE4MGY0VHBxYWw3WVFQUGJW?=
 =?utf-8?B?c0RDblMyMkFKUFptQ280SC9ZbmhYT1NySzFsWmJOSUdoTTFTRGNweEt6TXc3?=
 =?utf-8?B?MXU0Q1VCcDdhSmRWU1daa0t3WHpQc1FDVUs3aUtocjYwSXRwVmZ4WVJTdXo4?=
 =?utf-8?B?RFdkdzljSWZVaTRzN1ZrY2wvc0FHVGUxMFN4NnV3T3o1ZnJJbEpUTDBjenZX?=
 =?utf-8?B?QU1QVjB4T3VIOVgyV3ZBTVdVQ29US0prRUR6bm1kSC9rZHl2QTJ1R25ROEJW?=
 =?utf-8?B?c3JjNFVIVmgwVUNJRWphQWRoTSszZEw0S2s1ZThpczh4S210U2w0TU1YMkNa?=
 =?utf-8?B?UkFWemd0NExvZUVWQTJCa0pIdENoUG0ySTgzNWVJN0VMZEtFbDNNUVZwNitp?=
 =?utf-8?B?VUhCZk1IMnVoUThlSWFEMjF6Rks3Mlc4VVlVTmh0ay9lU0Z5cDZBc3dadHAr?=
 =?utf-8?B?U1FLeVFwTUFiU21ja3pHcjMvOXNiNmdDNFBLNGk4cW9UcGJqQnVBbUEwRW5G?=
 =?utf-8?B?R2xJVXlBUzNCWlk4NjBmNWR4aDFYMExSTWlKYlJWRFpPK1lNU1YxZmt4cm9v?=
 =?utf-8?B?MVozYWVEcFlmNmV3d0kxNllXT3RGYkdIQkxNRlJIVGVERzQ0aUZ3bGd6VHRL?=
 =?utf-8?B?WmJsV0FVcEMwdzdyR0NuYi92eXVrRnR6TjE2Zlp1TVZlU1NZRVhNd1lobmp0?=
 =?utf-8?B?VzQrZWFaY2hPK2ZzdklOUGNpTjdQYUJyU0dHTXAxbVNWYTJYZWNWU1Z6NHV2?=
 =?utf-8?Q?8UIszLrtIEnm4hXPUBZRLsyxYz10v0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzkzVGpNTTRxQXBCVkV4dU01MlRKajhvb1lOZWlFUS92bWE4U3VwQU5iNWF1?=
 =?utf-8?B?RzE2U21YR2NxUzZPS1VDenFYdGY3eXQrK0dhYVJVZktTWmhhbytIbjN6K0Vu?=
 =?utf-8?B?dVVOMUVhUm8rOFoxdWtRYTFPZEJOUi90ZjJiK0NwYVFiZHJBL2pYalljcGFY?=
 =?utf-8?B?bGM1SEFLeG9ZU29oZ2dyVnpub3dNUUc2czBaSTEvRE5TcDFCRytjOXJMMlor?=
 =?utf-8?B?VzEzSVJuMTJ1bzVLNG05Z1Jod05ZUGJYUzF0Z205SUFHQVJoSG5kU0xkK3g2?=
 =?utf-8?B?MWVzMlB5dzlUUUVBY0JRc0lubnNlTWxmZXdNUTJ1aTdvTEdpdUVqdHhsdzNG?=
 =?utf-8?B?dnlFNmRaSEhIMVd5bkJBTkMwYzZsdFBYZ1NGamw4V1NjTEt5MFFUOGN4RktV?=
 =?utf-8?B?UUt1K0ZNYjdzQXBHTU1WZzNBenlRRDVjZzRrOHlSTWVjcVlEa05jVm9xVmRY?=
 =?utf-8?B?ZGNxZkZZSzhpaDVWVkJPUTVKM09JR0JYQytlQ0ZVYWJoV0NYeGZBQnhPTTNL?=
 =?utf-8?B?Sm9JdVc3TG1RUWQyTG51TTRVVjZhMVkyVjZQM3RIYjVJdlZCSEpORHU5cHIv?=
 =?utf-8?B?bmxCcFd1bkZDZFBHS2RnNGZzaytLbmV4R09qZXNoZGlmNzJTaDZPT09rMjZy?=
 =?utf-8?B?NmZsUW16QUpUaWQrZnFWVDBNUDVFcXdLaG9LdWRBTUNFbDRvU3ZYQWxRYzMw?=
 =?utf-8?B?Y1BVVVh1M21FRUJhU0wrZjFFMVJzYktvVFJieFRZcXBGTE9CWldObDlTdnF4?=
 =?utf-8?B?SlVpQ1hhRlB6ODBITHVtNnBqL2JUZ0piY3lKdlpha2tKb01jamRqd2dMeTM2?=
 =?utf-8?B?TW0zWFk4NE9oU2h3N1NvS1JmMXJ6RngrN1dUVHh0aDgxNWpxRk1BbVMxbWt3?=
 =?utf-8?B?bmM1aldLQkh5V3YwRVNlTFZEVTdQM1pseFlxOVk1bUVPVjN2aWdFeFNNOVRH?=
 =?utf-8?B?RXF0Y0pGQ0FxbnIrOTFrcnZaaXVJM1RnODE5U1lJWlV1a2F4Y25jaTZIKzlk?=
 =?utf-8?B?aG5sTmhKekFCUkhwU1FBdEN3Z0s4bXl2V2QzZStjUEVLb3dNTTJjK2g1SWQy?=
 =?utf-8?B?M0RpY2lhSjB0NjRLU0J0Nk1kcWZnVlk3NVRubk56WnFUTnVsUUhtdjNjYyti?=
 =?utf-8?B?YzdPdmhDc29JQnk3Z0VZaEpYVUpNWUdXb2hvUDhUNEx1UFNhZnFFKzFMZUVZ?=
 =?utf-8?B?ci9GVE5UTjhPdUZkKzhJOHJrb3ZZbEhORmhRTHo3Wkc2YUZqb0QxcVVLcFRT?=
 =?utf-8?B?N0hDU0dUUWVDNVh3NDNZcDREOTRFUDlKQVF1TjVFeU5LRm9hMFhzcmJ0d2Jj?=
 =?utf-8?B?a0ExMzZrRlpmbWNidGFlVWNuQ2hnZG0ycE9FZEptRy93SXNFejFZUHVoOVdP?=
 =?utf-8?B?cm11djZ5bUN1Qk9BU1ptN2g2UG9UR0VXd3I2d3l1akxpclk2b3JqOTRvYWdH?=
 =?utf-8?B?bEJHL0tjdnNQTEFBVXd5dzlaMlZ2anNwaFYweUV0dkhwNFhBY0RIbmNHWWkx?=
 =?utf-8?B?ZDJLY21NL0hYYmVmK2E0QTh3ZThSazRVNUpWWGhSTG56N3Q2REZrN2VaSEEv?=
 =?utf-8?B?cEppaFNKL2Zja3dtT3hVNFJ2ZEl6a1BrY3NsN0tPVWNCeWNSK1k5c3U0K1ds?=
 =?utf-8?B?STlmRnpNeWhkS0FMUURTcjBMNjVLRnNkSFNIVUdwR0pmMHBKUXlZMy8xU3J5?=
 =?utf-8?B?enNZQVd0R1o3S3RXTDVDaUxwdmNIa2l5K2hxMzdLUnkxaGJuVzdrbW9Da25S?=
 =?utf-8?B?OVZtV094WExNSDZiUS9yU294V25NcnZOY2Q0aExsa21tdjBHSGZ5VDQ1TThN?=
 =?utf-8?B?RW5nQ2hMQmk1dXFNV1Z3QUJKSE5iQTdOVlNSbW5ubVhFcVNPay9CY3M1SHlG?=
 =?utf-8?B?S3h3MkdXMmprcitGL1hmaDVuQmpKMkxyOEp5TStwWFZESjNxNENEWDZLMU43?=
 =?utf-8?B?QjhqSVllSlJUbnN4b0pxZEhYZ0NUOVJLeHZCSFN4SjlrSEEvV1MySDk1ckky?=
 =?utf-8?B?RVdxbFJEVC80Y1N6dU1MM0JaNDNLVjZBZzc4WW9EQ296NW5teGRDdjM1YVF2?=
 =?utf-8?B?bWFUR3dhaE42eEVZM0hyRnhrT0xlYnZOQ08xT2pPcXkyL2RXZVZkdXl2N1V0?=
 =?utf-8?B?cnpKYlRXbUJLb015NGdFRU42ZjdwbVdtNitSWmp5U1dzcHpablBMUFRKeVp0?=
 =?utf-8?B?eEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c2ea2fe-115c-4869-fc53-08de17f38e7e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 20:33:16.9908 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eDIpF+Q9OBsIO/wfhYPUllmQuIo9ZQjLsNTIhOJ4jSdhWBcEBER0rZPI6RpZJx3gHqRrxEjt23WT960ViazYdheKJgBP/h2lQJAyrFAey3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4580
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

Connect the helpers to allow save and restore of GuC migration data in
stop_copy / resume device state.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 25 ++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 66 +++++++++++++++----
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  8 ++-
 .../drm/xe/xe_gt_sriov_pf_migration_types.h   |  5 ++
 4 files changed, 87 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index 203ba1fbeefcd..cb45e97f4c4d9 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -848,6 +848,18 @@ static void pf_enter_vf_save_failed(struct xe_gt *gt, unsigned int vfid)
 
 static int pf_handle_vf_save_data(struct xe_gt *gt, unsigned int vfid)
 {
+	int ret;
+
+	if (xe_gt_sriov_pf_migration_save_test(gt, vfid, XE_SRIOV_MIGRATION_DATA_TYPE_GUC)) {
+		ret = xe_gt_sriov_pf_migration_guc_save(gt, vfid);
+		if (ret)
+			return ret;
+
+		xe_gt_sriov_pf_migration_save_clear(gt, vfid, XE_SRIOV_MIGRATION_DATA_TYPE_GUC);
+
+		return -EAGAIN;
+	}
+
 	return 0;
 }
 
@@ -887,6 +899,7 @@ static void pf_exit_vf_save_wait_data(struct xe_gt *gt, unsigned int vfid)
 static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
 {
 	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
+		xe_gt_sriov_pf_migration_save_init(gt, vfid);
 		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
 		pf_enter_vf_wip(gt, vfid);
 		pf_queue_vf(gt, vfid);
@@ -1048,14 +1061,22 @@ static void pf_enter_vf_restore_failed(struct xe_gt *gt, unsigned int vfid)
 static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
 {
 	struct xe_sriov_migration_data *data = xe_gt_sriov_pf_migration_restore_consume(gt, vfid);
+	int ret = 0;
 
 	xe_gt_assert(gt, data);
 
-	xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n", vfid, data->type);
+	switch (data->type) {
+	case XE_SRIOV_MIGRATION_DATA_TYPE_GUC:
+		ret = xe_gt_sriov_pf_migration_guc_restore(gt, vfid, data);
+		break;
+	default:
+		xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n", vfid, data->type);
+		break;
+	}
 
 	xe_sriov_migration_data_free(data);
 
-	return 0;
+	return ret;
 }
 
 static bool pf_handle_vf_restore(struct xe_gt *gt, unsigned int vfid)
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 4a716e0a29fe4..fbb451767712a 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -174,22 +174,10 @@ static int pf_save_vf_guc_mig_data(struct xe_gt *gt, unsigned int vfid)
 	return ret;
 }
 
-/**
- * xe_gt_sriov_pf_migration_guc_size() - Get the size of VF GuC migration data.
- * @gt: the &xe_gt
- * @vfid: the VF identifier
- *
- * This function is for PF only.
- *
- * Return: size in bytes or a negative error code on failure.
- */
-ssize_t xe_gt_sriov_pf_migration_guc_size(struct xe_gt *gt, unsigned int vfid)
+static ssize_t pf_migration_guc_size(struct xe_gt *gt, unsigned int vfid)
 {
 	ssize_t size;
 
-	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
-	xe_gt_assert(gt, vfid != PFID);
-	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
 
 	if (!pf_migration_supported(gt))
 		return -ENOPKG;
@@ -278,12 +266,19 @@ int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
 ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
 {
 	ssize_t total = 0;
+	ssize_t size;
 
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	xe_gt_assert(gt, vfid != PFID);
 	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
 
-	/* Nothing to query yet - will be updated once per-GT migration data types are added */
+	size = pf_migration_guc_size(gt, vfid);
+	if (size < 0)
+		return size;
+	if (size > 0)
+		size += sizeof(struct xe_sriov_pf_migration_hdr);
+	total += size;
+
 	return total;
 }
 
@@ -330,6 +325,49 @@ void xe_gt_sriov_pf_migration_ring_free(struct xe_gt *gt, unsigned int vfid)
 		xe_sriov_migration_data_free(data);
 }
 
+/**
+ * xe_gt_sriov_pf_migration_save_init() - Initialize per-GT migration related data.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
+
+	migration->save.data_remaining = 0;
+
+	xe_gt_assert(gt, pf_migration_guc_size(gt, vfid) > 0);
+	set_bit(XE_SRIOV_MIGRATION_DATA_TYPE_GUC, &migration->save.data_remaining);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_save_test() - Test if migration data type needs to be saved.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ * @type: the &xe_sriov_migration_data_type of data to be saved
+ *
+ * Return: true if the data needs saving, otherwise false.
+ */
+bool xe_gt_sriov_pf_migration_save_test(struct xe_gt *gt, unsigned int vfid,
+					enum xe_sriov_migration_data_type type)
+{
+	return test_bit(type, &pf_pick_gt_migration(gt, vfid)->save.data_remaining);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_save_clear() - Clear migration data type from saving.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ * @type: the &xe_sriov_migration_data_type of data to be cleared
+ */
+void xe_gt_sriov_pf_migration_save_clear(struct xe_gt *gt, unsigned int vfid,
+					 enum xe_sriov_migration_data_type type)
+{
+	clear_bit(type, &pf_pick_gt_migration(gt, vfid)->save.data_remaining);
+}
+
 /**
  * xe_gt_sriov_pf_migration_save_produce() - Add VF save data packet to migration ring.
  * @gt: the &xe_gt
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index b3c18e369df79..66a45d6234245 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -10,12 +10,12 @@
 
 struct xe_gt;
 struct xe_sriov_migration_data;
+enum xe_sriov_migration_data_type;
 
 /* TODO: get this information by querying GuC in the future */
 #define XE_GT_SRIOV_PF_MIGRATION_GUC_DATA_MAX_SIZE SZ_8M
 
 int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
-ssize_t xe_gt_sriov_pf_migration_guc_size(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_guc_save(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
 					 struct xe_sriov_migration_data *data);
@@ -26,6 +26,12 @@ bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid);
 bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid);
 void xe_gt_sriov_pf_migration_ring_free(struct xe_gt *gt, unsigned int vfid);
 
+void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid);
+bool xe_gt_sriov_pf_migration_save_test(struct xe_gt *gt, unsigned int vfid,
+					enum xe_sriov_migration_data_type type);
+void xe_gt_sriov_pf_migration_save_clear(struct xe_gt *gt, unsigned int vfid,
+					 enum xe_sriov_migration_data_type type);
+
 int xe_gt_sriov_pf_migration_save_produce(struct xe_gt *gt, unsigned int vfid,
 					  struct xe_sriov_migration_data *data);
 struct xe_sriov_migration_data *
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
index 75d8b94cbbefb..9f24878690d9c 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
@@ -16,6 +16,11 @@
 struct xe_gt_sriov_migration_data {
 	/** @ring: queue containing VF save / restore migration data */
 	struct ptr_ring ring;
+	/** @save: structure for currently processed save migration data */
+	struct {
+		/** @save.data_remaining: bitmap of migration types that need to be saved */
+		unsigned long data_remaining;
+	} save;
 };
 
 #endif
-- 
2.50.1

