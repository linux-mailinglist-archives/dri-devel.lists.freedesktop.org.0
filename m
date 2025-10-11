Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 594C4BCFB7E
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 21:40:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A6C10E116;
	Sat, 11 Oct 2025 19:40:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jFKV/mfx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46E010E116;
 Sat, 11 Oct 2025 19:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760211631; x=1791747631;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ucmEG+/ovo2oBrWH9bNE00IH/4WFDw2T+tbhhEVIgRo=;
 b=jFKV/mfxCAVswKL/fmGlqprKSc6qdhMejfhOdGg/US0+Zm0cB5RcrbdA
 JjVpoyhemDq3362+PwTqEsEaIednpwhyGmTmGiHxqI0OKxo627ZRH7qTl
 aL1KbnRekP+YbFYBCzOAxF9AEr18DLTSmYRjKDIH1DmSe8fX78YnRclwc
 41/jGEe8wpJZmYyp/LAn6JafG/zXbeSX7T7tcLjRqFeI/3kM1Nni3X+k9
 ZAgv2p3KylWvFxt4XsiBEvv5o7TM5bhbODxuRAjPtYEGFxiU4lWnd2eXw
 q0h0PvLqslEoDi4PYF2vNmM8qeFQNu0kbiWo/k/BYQu07O5iFQOGyYUY6 Q==;
X-CSE-ConnectionGUID: TmrwtkG8QrqW6jpu5foeCA==
X-CSE-MsgGUID: HnkPe7mKRRij+mlmFyKrsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="61607927"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="61607927"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:40:30 -0700
X-CSE-ConnectionGUID: 6Bj8AhVMQhqAMzvzCehD7g==
X-CSE-MsgGUID: rClkt9rjS2aFTUN/S/ryeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="181661583"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:40:30 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:40:29 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 11 Oct 2025 12:40:29 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.18) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:40:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jc4e9FBJ4ftEY/zI9kSCHfberjDtlnJ7GyStXYVYRp3QotC3TqpBB3uHmFn2g9QDPZRauDRLduzLvCvQC0sfK+mrI5VR0A6du+JVsuKore2ebL7vgyPz18RQRE5Cbg3ZPcd5asHf6mMTdqgERovjyeWrL0BfidwA/Xxa1TRA4PQAvGGRof7A/UCftywmECoqSlLIcBTtp9H5jiQbgkGIfoOPOxP2aZH1F62fTc/6w7p4TEv6D5SCYEEY8q+mpBkQhDRz/AC39d4A2vq0vkYoKFgH2iSaI68Sx0uhOx1ltgqPSLXQZ+S3D71JDz6hKYf13b9uU6HDKhciPkcTXWtHiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4aus0u39hFf7tv/RoY0SXmzfJxclmD/Rc8AMCYWJ1k=;
 b=BLlbkiz0quy2dPLzOe5+uXeAY1jkxYBOq2cYhIFhwmNg99LAnsmK7Y2NXzZhNprYqG6TBKoQXKjQCZQWRMmnBt/tgUK7C6YyZLFCkjQip2BJTKGCp2iI5mp+iQWOiIsF9qInCULL7T2XaXPM6ffUISA4A+qyXkd1Kfs8OHgXZhMbZzrLwUqjO1RkIZya9Z2HTkCBF4UJkP3fj/9neToRMjxo0bhmh2MElY5cW+cxtfFp0EZUO6dSmUe+cccQtdmsDiWRXD+40vD/LAixHrPz9wuqevCkvxtTqOlboOOm3RT4OdXatUhzmGKDpFxWf2RAy2OOHweW0vLLFzhIW2NwmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM3PPFF2E67D388.namprd11.prod.outlook.com (2603:10b6:f:fc00::f60)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Sat, 11 Oct
 2025 19:40:27 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9203.007; Sat, 11 Oct 2025
 19:40:27 +0000
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
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH 03/26] drm/xe/pf: Add save/restore control state stubs and
 connect to debugfs
Date: Sat, 11 Oct 2025 21:38:24 +0200
Message-ID: <20251011193847.1836454-4-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251011193847.1836454-1-michal.winiarski@intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0034.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::7) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM3PPFF2E67D388:EE_
X-MS-Office365-Filtering-Correlation-Id: 6861283f-93ed-4300-77a5-08de08fe074d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?elBzKzZhVHRSLzJ0c0x1MEp6eE1lWUY2QTRvS0NZWlgwdnZ6VS9aVnRkZ1Ur?=
 =?utf-8?B?U2JpcVNqWFVvcDRPMUhrTWpQUkpVN0tvejNHUGJuS0JQSVhLNEZiQVJFTmJM?=
 =?utf-8?B?YUVTTG0wQVF1Yk5zK0Y5SlY3dGxsUGxFUFV4ZnVjL0U2ZUk0VjZNZG1rQk9E?=
 =?utf-8?B?SjZVM2IyUlJVb2oxVnZUVkQvazFrc1dzNkV5cXdBOVA4R2JJMkk5bDRDQ2Qr?=
 =?utf-8?B?aHJmV2paeHZER3NTcW9ocEhIcG9aSkVWNmZPTS81dzJGOUowUkNBcHROeGdl?=
 =?utf-8?B?Ym91RVdhY01US0NYN0tJWnd4S0UxN3hBeWxTekxmZFdXTitBMXo0YnIzRlJ5?=
 =?utf-8?B?MndlajNPSEI3YXdqNHNsV2ptQVFUYUNxOEM2RVJ2UlIyTkFYb2tGeWtDeXNE?=
 =?utf-8?B?aEd1bGxDM2hBRFNLZXFUbUVoT3ZRTk9VeVRoRjJ4L24vakxFNzBpY1h1NlJY?=
 =?utf-8?B?MlhsM2g2QjBzaFc4SGxVRHZuU1l2ZHpuVGt1RXBxc0NKaDBRMWpSQnhCY2hv?=
 =?utf-8?B?ai9od01YeWRuUU1pZi9BN0twakU4YTFvVzduTC8vbTZ2OS9ncHB3U3gzZ3o5?=
 =?utf-8?B?RjhiS2IrUDdOSnpYd2NUMzFCTHhWRjc4UWt3YjdLQWxQZE8yMHRjQ1FCMU1P?=
 =?utf-8?B?WmUrMDR0UTFtcXgwdmpOaXlEdklteU01eDRPaGZKZWs3MmtXOHpvM1lNTEU4?=
 =?utf-8?B?bDM2a2hVd0YxRVZCNWU3a0ZuYmJZZ3d3SWZ1SjdjSFdQWjZBYzZ1SW0rTmdC?=
 =?utf-8?B?QVcyN3ROV0p0dTVZUjAvazBlVVRiUFNuWm5DWlp5ZzlXNC9WdlVweTFIY3dF?=
 =?utf-8?B?SGYzWWdzbW5qM2k2cG5sakJJQWpEL3BTSk9IWUNCZEpRTVBLLzhkUXIvTEZ0?=
 =?utf-8?B?RG9VTHB5QW54b0pnU2NhOGtyc2tIaGx3MWVYbzY0S1c2akllVTlaK3N0bnZZ?=
 =?utf-8?B?bGJtTm82enVKVEZhRW1JZ05mT3picHdPVVVSM0VOaW9wK01yTFhJTXhxWTAz?=
 =?utf-8?B?QktySnhhMVdwM0JqdmxxenpSdDhRUytPem03OWJoNFJ2NHVtb3dZK1laNXJ3?=
 =?utf-8?B?V05iUWtEd0dvS1Y1MkU0MjFrdmFKdjdMZXBCQ0llaW9NVDRSUE90MUhPSUY3?=
 =?utf-8?B?dEpua1k0ZmZ3a1RTRWJKNVVWM1dIVmJBTTVOdGdKcGkrR25MSTRRb2ZsTlJU?=
 =?utf-8?B?YTNYdGdLM2RDZXh4VVVrUVVTeWpCeWZwblY1dFJTc1piS1dFckVLeG54Sktl?=
 =?utf-8?B?ZHBweWVHbnozOFZMRnkvSTN6anNLa0lqTy9TNURCK3JuN3pOeThTWno4ZE9P?=
 =?utf-8?B?T1RGZnpDSDAzRVhmaUpuQVJjUlowV0J2NE1GaEpYamNtbUVnK0VQS0ZCdjdw?=
 =?utf-8?B?MURTZkNwS0daSDFmVG5adXhGOG01dUNPT0ZjbjF3S0QvR0N6ZGtCZCtKeWZr?=
 =?utf-8?B?V3VaSVA2Z01UcUQ4MDVCT3N0Y3JqRGF2SVFjeW8xd0pnVnJEV0l1YXdqNi9C?=
 =?utf-8?B?cTdqZlBkRTR2QysrTW1NVHU1VitSR2VTQnZlSDVUT0JkWlllSis5alNtYmxj?=
 =?utf-8?B?NmIvb3hBdk9OT0xBMXRtSXhOS0ViU3M5M1hDVzRzZ1dHS2F5Um9iK0dVTjlG?=
 =?utf-8?B?b2xueEd2eis2ejRvcXk4WWRRQTQxWkdkK2dHRjVLcVNld25kSUp6L1JIOGIr?=
 =?utf-8?B?bmlkT1kzT1RXODFmOVZmY2c2WkMzUlA4TEZxL3Q1MGVVSE10Y3pqMWZveXFM?=
 =?utf-8?B?bnVlOGlSb0RoQmR0RHl4T3ZKY0pJQVJUNlk1eVdNeDh3QzRFaWlWd3ZMMVNO?=
 =?utf-8?B?Z1BvWVVYVmRrdC9nbWhjN2VHQzh6dDhEMXQ2dUJHOW1yT3E2MDNUcGpQNzJv?=
 =?utf-8?B?VytWcW15TDRsSTNFNndxcGYvZkR2S3FQNTltSStJcHFZTndYWVhlbTNCZVJJ?=
 =?utf-8?B?bFc1YWNNMlg1M3RDU0VWU2VaVHFGL2h2R0dYaTJzT013VVFYZHB6c3Z3UEx0?=
 =?utf-8?Q?1/JdZSoDciA4PCdgLSqJ14e+jA5k0Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkE0WmRKeEdQL1lzaGVPTlVNQ1hzY2RyOXk5QXFXak9wWG9FVHV3TlE1Qjd6?=
 =?utf-8?B?cEMraGViVlhIeWhncnZPekZnWGIzQ3NwdjNCY1BDUmYwQzd5Zkp6WjNxNXdi?=
 =?utf-8?B?RXRvYWJJbGN5ajA1c2dvNXluY2ZaWGJ4aDZWaXVJV2JoYW1ZNU5TOXhoTkw1?=
 =?utf-8?B?MEllS3FjM2tEd3JQZnZZeHJoRG81ZzFoeHNPK3Y4Z0VMdHd2amU1cGk0Njhm?=
 =?utf-8?B?dit0MHRIRnRlbm5tcFlEWGtFMVRKM29UeFJMTThiS1FubTdjTnM1L0JudEJN?=
 =?utf-8?B?N0o3VHZKaXlHSEgwcFJYNytabGxWNDU3STRtNEd1NFVlV3o1V0UrRnMvRGJv?=
 =?utf-8?B?QmVRSnNCVVFwUjRLY1VERXp5WFh5dlg5bzZJY3dNUkJMK0hQaEUrV0RvRU44?=
 =?utf-8?B?WGRTWm5RbTBxZmZuRU1CTHJFeFQvZ0N0WldWZ083aG1xMU1ma0ZhSm1oYTF6?=
 =?utf-8?B?OGlzU3NITkdkdzRnOGVQdzI4K0s5K0FJL3MrbktHRFN5OW9IU0VhMTNZK3g0?=
 =?utf-8?B?MHFYaDY5ZEc3MTF4NjUvUmpVMzh3RHBBNlpEb0dRRXNkL2FHNmNJSmdqNm1D?=
 =?utf-8?B?R1pJLytXVVB1Y2FBQituVFFsRmo5akZnK293MDVTWFlpNlN3WllaVzVxUm5a?=
 =?utf-8?B?cmZEeXNUUkxVaUl5cUdXZEViaXlpKzNySFNNcklmZFk4Q3h4a1VHSDN2OFJ0?=
 =?utf-8?B?SEdEbDlSM3hQN2NhUDF0LzZQWW93UXNEK2xiSnZSeGJZY3NnL3laUVp4NWEy?=
 =?utf-8?B?TWEyT2xzbVlBRWI0UkhBVlRmVXJYZDIvV1drREdZMEh2dlEzeDRhc0pFN1M5?=
 =?utf-8?B?VXVuckVBT1dPVUlDaE15NnhzN1g5dWdmUStSTE8yRkYrVzExN3FyTmhJSndl?=
 =?utf-8?B?ekNIOUdBazQ1bVU4eHBVSU9WbEdyeVE1UXpoOWZibmNySmsxZXAvUHNKUHVX?=
 =?utf-8?B?S3pRblVNTkMxNTZuTzFOLzc2RWJpWkVGQlpMRks0WDVKZC9qQXBWSlZsL28z?=
 =?utf-8?B?aS9uQ3ZKWFRQcTRkY1IwSC9IdWZxb29qQlE3NFFkMm4zMmhNV21WWFZwdi85?=
 =?utf-8?B?K3FzRXNUUDJKNG9meVpMZ0JyWnBQNUFaMGNjbUlKbXZRcDcvY0RJNmluU0Zj?=
 =?utf-8?B?K2E5VEg5VXhsTHNrWXpVZ050TkIvT2g3Y3JBQ0s4REVlVFIzWGVDZmVQSGVZ?=
 =?utf-8?B?QTM4QloxODZHK1MxZ3c4a0NTSW5wbDRiRGVnaTMrdzdDNFVVVElwaUZ5NnZX?=
 =?utf-8?B?T21DcGJYYWFZY3ZvNGNDOGliWHYrMVNNTm53SWpOLzN4VE50VURUNTd0Z3BZ?=
 =?utf-8?B?SXI5S1hmN3Jndk4wTjlVRFJhdXRmdzRrWkVxekhXRys0WWtPaFpkRTh3S0VQ?=
 =?utf-8?B?TGVSN1AzMzNLZHZmTGdxMnNjR3lnT3NkM0tnNFRiUnNMeTl2Yk02cDFCbCs2?=
 =?utf-8?B?a0pEdHFNc3NvRWdOSi9UdEREN1ZRN05ZN1ZpNjJqUVJRMnBuT2VWUE1meU9K?=
 =?utf-8?B?YUluYzRvQTVFM0NmTFIvaU5NSFR5cHRBRTFrSWYzV29icDJRS3RxbzZWOWRM?=
 =?utf-8?B?Q1dtWlQ5MWVTRW42WW5WWncwWis5WVc2a2tSS2V0a3hscFhYelpQSUIxaUFT?=
 =?utf-8?B?K2dDejdIT3RrOEIvSVNDay9UNnFOWDhLTjlINHBuNTQrazFOWnlYZ00xdEl4?=
 =?utf-8?B?QmlGYkI3TFFjR3gydDBoUllqRDdTWmIvZmpCUTZJSUhMWjNpQ2tVazR1d2JF?=
 =?utf-8?B?ODY4M08reWZtSWdTM0FHUFAvNk9vTXRLVlVlOVdnSHVJdWp1V05lQ0NybGxY?=
 =?utf-8?B?ZktWRUJKTUY5TWFDZFM4MU5IQTlLc3BVZmQ3SFhkOHdCRS9xUE5pbFdndDRP?=
 =?utf-8?B?T1dXcG1BR1V3dy85NmIvdTVGdjZDQi9QWlo5SnFNTVJodHI2WlI0WGNEYm5h?=
 =?utf-8?B?N1dkZE5ocFNRMjZBZ3NIZktSa2d0SWVEdktBT0VBNVh5ZllER01PaUxUOWl6?=
 =?utf-8?B?MDluc2pZaktXTC91aUIrMXVhWmFCd2IrK3Q0dEpmaDJlVUJrOVV6TURTYjdx?=
 =?utf-8?B?RFhzSzlzTXRKSFRESG0ybDQrT0RnMWJ6TUplakU0TGV1T2s0amdTTnZkcmFZ?=
 =?utf-8?B?aGN6c1ZmR1ZqRVZkU05pK2xTWWNaZ2tvVC9ZelZtS01KTVU5UG1VdjFmUHZu?=
 =?utf-8?B?a2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6861283f-93ed-4300-77a5-08de08fe074d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2025 19:40:27.2363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F/mVJm+mRMF60Yc/UQsk+I8RB7fPqW7V0VvKM3wc2f4xSCqLOm2ijZRy+41VSwGgcFRpYQo6iod5KlqSOFzdZzeZOEkr1MUFsbaA+fy0mU0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFF2E67D388
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

The states will be used by upcoming changes to produce (in case of save)
or consume (in case of resume) the VF migration data.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 270 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h   |   6 +
 .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  17 ++
 drivers/gpu/drm/xe/xe_sriov_pf_control.c      |  96 +++++++
 drivers/gpu/drm/xe/xe_sriov_pf_control.h      |   4 +
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      |  38 +++
 6 files changed, 431 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index 2e6bd3d1fe1da..44df984278548 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -184,6 +184,13 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
 	CASE2STR(PAUSE_SAVE_GUC);
 	CASE2STR(PAUSE_FAILED);
 	CASE2STR(PAUSED);
+	CASE2STR(MIGRATION_DATA_WIP);
+	CASE2STR(SAVE_WIP);
+	CASE2STR(SAVE_FAILED);
+	CASE2STR(SAVED);
+	CASE2STR(RESTORE_WIP);
+	CASE2STR(RESTORE_FAILED);
+	CASE2STR(RESTORED);
 	CASE2STR(RESUME_WIP);
 	CASE2STR(RESUME_SEND_RESUME);
 	CASE2STR(RESUME_FAILED);
@@ -207,6 +214,8 @@ static unsigned long pf_get_default_timeout(enum xe_gt_sriov_control_bits bit)
 		return HZ / 2;
 	case XE_GT_SRIOV_STATE_FLR_WIP:
 	case XE_GT_SRIOV_STATE_FLR_RESET_CONFIG:
+	case XE_GT_SRIOV_STATE_SAVE_WIP:
+	case XE_GT_SRIOV_STATE_RESTORE_WIP:
 		return 5 * HZ;
 	default:
 		return HZ;
@@ -359,6 +368,10 @@ static void pf_queue_vf(struct xe_gt *gt, unsigned int vfid)
 
 static void pf_exit_vf_flr_wip(struct xe_gt *gt, unsigned int vfid);
 static void pf_exit_vf_stop_wip(struct xe_gt *gt, unsigned int vfid);
+static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid);
+static void pf_exit_vf_saved(struct xe_gt *gt, unsigned int vfid);
+static void pf_exit_vf_restore_wip(struct xe_gt *gt, unsigned int vfid);
+static void pf_exit_vf_restored(struct xe_gt *gt, unsigned int vfid);
 static void pf_exit_vf_pause_wip(struct xe_gt *gt, unsigned int vfid);
 static void pf_exit_vf_resume_wip(struct xe_gt *gt, unsigned int vfid);
 
@@ -380,6 +393,8 @@ static void pf_exit_vf_wip(struct xe_gt *gt, unsigned int vfid)
 
 		pf_exit_vf_flr_wip(gt, vfid);
 		pf_exit_vf_stop_wip(gt, vfid);
+		pf_exit_vf_save_wip(gt, vfid);
+		pf_exit_vf_restore_wip(gt, vfid);
 		pf_exit_vf_pause_wip(gt, vfid);
 		pf_exit_vf_resume_wip(gt, vfid);
 
@@ -399,6 +414,8 @@ static void pf_enter_vf_ready(struct xe_gt *gt, unsigned int vfid)
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOPPED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUMED);
+	pf_exit_vf_saved(gt, vfid);
+	pf_exit_vf_restored(gt, vfid);
 	pf_exit_vf_mismatch(gt, vfid);
 	pf_exit_vf_wip(gt, vfid);
 }
@@ -675,6 +692,8 @@ static void pf_enter_vf_resumed(struct xe_gt *gt, unsigned int vfid)
 {
 	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUMED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
+	pf_exit_vf_saved(gt, vfid);
+	pf_exit_vf_restored(gt, vfid);
 	pf_exit_vf_mismatch(gt, vfid);
 	pf_exit_vf_wip(gt, vfid);
 }
@@ -776,6 +795,249 @@ int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid)
 	return -ECANCELED;
 }
 
+/**
+ * xe_gt_sriov_pf_control_check_vf_data_wip - check if new SR-IOV VF migration data is expected
+ * @gt: the &struct xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: true when new migration data is expected to be produced, false otherwise
+ */
+bool xe_gt_sriov_pf_control_check_vf_data_wip(struct xe_gt *gt, unsigned int vfid)
+{
+	return pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_MIGRATION_DATA_WIP);
+}
+
+static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
+{
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP);
+}
+
+static void pf_enter_vf_saved(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED))
+		pf_enter_vf_state_machine_bug(gt, vfid);
+
+	xe_gt_sriov_info(gt, "VF%u saved!\n", vfid);
+
+	pf_exit_vf_mismatch(gt, vfid);
+	pf_exit_vf_wip(gt, vfid);
+}
+
+static void pf_exit_vf_saved(struct xe_gt *gt, unsigned int vfid)
+{
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED);
+}
+
+static bool pf_handle_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP))
+		return false;
+
+	pf_exit_vf_save_wip(gt, vfid);
+	pf_enter_vf_saved(gt, vfid);
+
+	return true;
+}
+
+static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
+{
+	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
+		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_MIGRATION_DATA_WIP);
+		pf_exit_vf_restored(gt, vfid);
+		pf_enter_vf_wip(gt, vfid);
+		pf_queue_vf(gt, vfid);
+		return true;
+	}
+
+	return false;
+}
+
+/**
+ * xe_gt_sriov_pf_control_save_vf - Save SR-IOV VF migration data.
+ * @gt: the &struct xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_control_save_vf(struct xe_gt *gt, unsigned int vfid)
+{
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOPPED)) {
+		xe_gt_sriov_dbg(gt, "VF%u is stopped!\n", vfid);
+		return -EPERM;
+	}
+
+	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED)) {
+		xe_gt_sriov_dbg(gt, "VF%u is not paused!\n", vfid);
+		return -EPERM;
+	}
+
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
+		xe_gt_sriov_dbg(gt, "VF%u restore is in progress!\n", vfid);
+		return -EPERM;
+	}
+
+	if (!pf_enter_vf_save_wip(gt, vfid)) {
+		xe_gt_sriov_dbg(gt, "VF%u save already in progress!\n", vfid);
+		return -EALREADY;
+	}
+
+	return 0;
+}
+
+static int pf_wait_vf_save_done(struct xe_gt *gt, unsigned int vfid)
+{
+	unsigned long timeout = pf_get_default_timeout(XE_GT_SRIOV_STATE_SAVE_WIP);
+	int err;
+
+	err = pf_wait_vf_wip_done(gt, vfid, timeout);
+	if (err) {
+		xe_gt_sriov_notice(gt, "VF%u SAVE didn't finish in %u ms (%pe)\n",
+				   vfid, jiffies_to_msecs(timeout), ERR_PTR(err));
+		return err;
+	}
+
+	if (!pf_expect_vf_not_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_FAILED))
+		return -EIO;
+
+	return 0;
+}
+
+/**
+ * xe_gt_sriov_pf_control_wait_save_done() - Wait for a VF Save to complete
+ * @gt: the &struct xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_control_wait_save_done(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP))
+		return 0;
+
+	return pf_wait_vf_save_done(gt, vfid);
+}
+
+static void pf_exit_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
+{
+	pf_expect_vf_not_state(gt, vfid, XE_GT_SRIOV_STATE_MIGRATION_DATA_WIP);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP);
+}
+
+static void pf_enter_vf_restored(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED))
+		pf_enter_vf_state_machine_bug(gt, vfid);
+
+	xe_gt_sriov_info(gt, "VF%u restored!\n", vfid);
+
+	pf_exit_vf_mismatch(gt, vfid);
+	pf_exit_vf_wip(gt, vfid);
+}
+
+static void pf_exit_vf_restored(struct xe_gt *gt, unsigned int vfid)
+{
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED);
+}
+
+static bool pf_handle_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP))
+		return false;
+
+	pf_exit_vf_restore_wip(gt, vfid);
+	pf_enter_vf_restored(gt, vfid);
+
+	return true;
+}
+
+static bool pf_enter_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
+{
+	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
+		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_MIGRATION_DATA_WIP);
+		pf_exit_vf_saved(gt, vfid);
+		pf_enter_vf_wip(gt, vfid);
+		pf_enter_vf_restored(gt, vfid);
+		return true;
+	}
+
+	return false;
+}
+
+/**
+ * xe_gt_sriov_pf_control_restore_vf - Restore SR-IOV VF migration data.
+ * @gt: the &struct xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_control_restore_vf(struct xe_gt *gt, unsigned int vfid)
+{
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOPPED)) {
+		xe_gt_sriov_dbg(gt, "VF%u is stopped!\n", vfid);
+		return -EPERM;
+	}
+
+	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED)) {
+		xe_gt_sriov_dbg(gt, "VF%u is not paused!\n", vfid);
+		return -EPERM;
+	}
+
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
+		xe_gt_sriov_dbg(gt, "VF%u save is in progress!\n", vfid);
+		return -EPERM;
+	}
+
+	if (!pf_enter_vf_restore_wip(gt, vfid)) {
+		xe_gt_sriov_dbg(gt, "VF%u restore already in progress!\n", vfid);
+		return -EALREADY;
+	}
+
+	return 0;
+}
+
+static int pf_wait_vf_restore_done(struct xe_gt *gt, unsigned int vfid)
+{
+	unsigned long timeout = pf_get_default_timeout(XE_GT_SRIOV_STATE_RESTORE_WIP);
+	int err;
+
+	err = pf_wait_vf_wip_done(gt, vfid, timeout);
+	if (err) {
+		xe_gt_sriov_notice(gt, "VF%u RESTORE didn't finish in %u ms (%pe)\n",
+				   vfid, jiffies_to_msecs(timeout), ERR_PTR(err));
+		return err;
+	}
+
+	if (!pf_expect_vf_not_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED))
+		return -EIO;
+
+	return 0;
+}
+
+/**
+ * xe_gt_sriov_pf_control_wait_restore_done() - Wait for a VF Restore to complete
+ * @gt: the &struct xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_control_wait_restore_done(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP))
+		return 0;
+
+	return pf_wait_vf_restore_done(gt, vfid);
+}
+
 /**
  * DOC: The VF STOP state machine
  *
@@ -817,6 +1079,8 @@ static void pf_enter_vf_stopped(struct xe_gt *gt, unsigned int vfid)
 
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUMED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
+	pf_exit_vf_saved(gt, vfid);
+	pf_exit_vf_restored(gt, vfid);
 	pf_exit_vf_mismatch(gt, vfid);
 	pf_exit_vf_wip(gt, vfid);
 }
@@ -1461,6 +1725,12 @@ static bool pf_process_vf_state_machine(struct xe_gt *gt, unsigned int vfid)
 	if (pf_exit_vf_pause_save_guc(gt, vfid))
 		return true;
 
+	if (pf_handle_vf_save_wip(gt, vfid))
+		return true;
+
+	if (pf_handle_vf_restore_wip(gt, vfid))
+		return true;
+
 	if (pf_exit_vf_resume_send_resume(gt, vfid))
 		return true;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
index 8a72ef3778d47..2e121e8132dcf 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
@@ -14,8 +14,14 @@ struct xe_gt;
 int xe_gt_sriov_pf_control_init(struct xe_gt *gt);
 void xe_gt_sriov_pf_control_restart(struct xe_gt *gt);
 
+bool xe_gt_sriov_pf_control_check_vf_data_wip(struct xe_gt *gt, unsigned int vfid);
+
 int xe_gt_sriov_pf_control_pause_vf(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_control_save_vf(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_control_wait_save_done(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_control_restore_vf(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_control_wait_restore_done(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_trigger_flr(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_sync_flr(struct xe_gt *gt, unsigned int vfid, bool sync);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
index c80b7e77f1ad2..02b517533ee8a 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
@@ -31,6 +31,13 @@
  * @XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC: indicates that the PF needs to save the VF GuC state.
  * @XE_GT_SRIOV_STATE_PAUSE_FAILED: indicates that a VF pause operation has failed.
  * @XE_GT_SRIOV_STATE_PAUSED: indicates that the VF is paused.
+ * @XE_GT_SRIOV_STATE_MIGRATION_DATA_WIP: indicates that the new data is expected in migration ring.
+ * @XE_GT_SRIOV_STATE_SAVE_WIP: indicates that VF save operation is in progress.
+ * @XE_GT_SRIOV_STATE_SAVE_FAILED: indicates that VF save operation has failed.
+ * @XE_GT_SRIOV_STATE_SAVED: indicates that VF is saved.
+ * @XE_GT_SRIOV_STATE_RESTORE_WIP: indicates that VF restore operation is in progress.
+ * @XE_GT_SRIOV_STATE_SAVE_FAILED: indicates that VF restore operation has failed.
+ * @XE_GT_SRIOV_STATE_SAVED: indicates that VF is restored.
  * @XE_GT_SRIOV_STATE_RESUME_WIP: indicates the a VF resume operation is in progress.
  * @XE_GT_SRIOV_STATE_RESUME_SEND_RESUME: indicates that the PF is about to send RESUME command.
  * @XE_GT_SRIOV_STATE_RESUME_FAILED: indicates that a VF resume operation has failed.
@@ -63,6 +70,16 @@ enum xe_gt_sriov_control_bits {
 	XE_GT_SRIOV_STATE_PAUSE_FAILED,
 	XE_GT_SRIOV_STATE_PAUSED,
 
+	XE_GT_SRIOV_STATE_MIGRATION_DATA_WIP,
+
+	XE_GT_SRIOV_STATE_SAVE_WIP,
+	XE_GT_SRIOV_STATE_SAVE_FAILED,
+	XE_GT_SRIOV_STATE_SAVED,
+
+	XE_GT_SRIOV_STATE_RESTORE_WIP,
+	XE_GT_SRIOV_STATE_RESTORE_FAILED,
+	XE_GT_SRIOV_STATE_RESTORED,
+
 	XE_GT_SRIOV_STATE_RESUME_WIP,
 	XE_GT_SRIOV_STATE_RESUME_SEND_RESUME,
 	XE_GT_SRIOV_STATE_RESUME_FAILED,
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
index 416d00a03fbb7..e64c7b56172c6 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
@@ -149,3 +149,99 @@ int xe_sriov_pf_control_sync_flr(struct xe_device *xe, unsigned int vfid)
 
 	return 0;
 }
+
+/**
+ * xe_sriov_pf_control_save_vf - Save VF migration data on all GTs.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_control_save_vf(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int ret;
+
+	for_each_gt(gt, xe, id) {
+		ret = xe_gt_sriov_pf_control_save_vf(gt, vfid);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * xe_sriov_pf_control_wait_save_vf - Wait until VF migration data was saved on all GTs
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_control_wait_save_vf(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_gt *gt;
+	u8 id;
+	int ret;
+
+	for_each_gt(gt, xe, id) {
+		ret = xe_gt_sriov_pf_control_wait_save_done(gt, vfid);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
+
+/**
+ * xe_sriov_pf_control_restore_vf - Restore VF migration data on all GTs.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_control_restore_vf(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_gt *gt;
+	u8 id;
+	int ret;
+
+	for_each_gt(gt, xe, id) {
+		ret = xe_gt_sriov_pf_control_restore_vf(gt, vfid);
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+
+/**
+ * xe_sriov_pf_control_wait_save_vf - Wait until VF migration data was restored on all GTs
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_control_wait_restore_vf(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_gt *gt;
+	u8 id;
+	int ret;
+
+	for_each_gt(gt, xe, id) {
+		ret = xe_gt_sriov_pf_control_wait_restore_done(gt, vfid);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_sriov_pf_control.h
index 2d52d0ac1b28f..512fd21d87c1e 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_control.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.h
@@ -13,5 +13,9 @@ int xe_sriov_pf_control_resume_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_stop_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_reset_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_sync_flr(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_pf_control_save_vf(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_pf_control_wait_save_vf(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_pf_control_restore_vf(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_pf_control_wait_restore_vf(struct xe_device *xe, unsigned int vfid);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
index 97636ed86fb8b..74eeabef91c57 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
@@ -75,11 +75,31 @@ static void pf_populate_pf(struct xe_device *xe, struct dentry *pfdent)
  *      │   │   ├── reset
  *      │   │   ├── resume
  *      │   │   ├── stop
+ *      │   │   ├── save
+ *      │   │   ├── restore
  *      │   │   :
  *      │   ├── vf2
  *      │   │   ├── ...
  */
 
+static int from_file_read_to_vf_call(struct seq_file *s,
+				     int (*call)(struct xe_device *, unsigned int))
+{
+	struct dentry *dent = file_dentry(s->file)->d_parent;
+	struct xe_device *xe = extract_xe(dent);
+	unsigned int vfid = extract_vfid(dent);
+	int ret;
+
+	xe_pm_runtime_get(xe);
+	ret = call(xe, vfid);
+	xe_pm_runtime_put(xe);
+
+	if (ret < 0)
+		return ret;
+
+	return s->count;
+}
+
 static ssize_t from_file_write_to_vf_call(struct file *file, const char __user *userbuf,
 					  size_t count, loff_t *ppos,
 					  int (*call)(struct xe_device *, unsigned int))
@@ -118,10 +138,26 @@ static ssize_t OP##_write(struct file *file, const char __user *userbuf,	\
 }										\
 DEFINE_SHOW_STORE_ATTRIBUTE(OP)
 
+#define DEFINE_VF_RW_CONTROL_ATTRIBUTE(OP)					\
+static int OP##_show(struct seq_file *s, void *unused)				\
+{										\
+	return from_file_read_to_vf_call(s,					\
+					 xe_sriov_pf_control_wait_##OP);	\
+}										\
+static ssize_t OP##_write(struct file *file, const char __user *userbuf,	\
+			  size_t count, loff_t *ppos)				\
+{										\
+	return from_file_write_to_vf_call(file, userbuf, count, ppos,		\
+					  xe_sriov_pf_control_##OP);		\
+}										\
+DEFINE_SHOW_STORE_ATTRIBUTE(OP)
+
 DEFINE_VF_CONTROL_ATTRIBUTE(pause_vf);
 DEFINE_VF_CONTROL_ATTRIBUTE(resume_vf);
 DEFINE_VF_CONTROL_ATTRIBUTE(stop_vf);
 DEFINE_VF_CONTROL_ATTRIBUTE(reset_vf);
+DEFINE_VF_RW_CONTROL_ATTRIBUTE(save_vf);
+DEFINE_VF_RW_CONTROL_ATTRIBUTE(restore_vf);
 
 static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
 {
@@ -129,6 +165,8 @@ static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
 	debugfs_create_file("resume", 0200, vfdent, xe, &resume_vf_fops);
 	debugfs_create_file("stop", 0200, vfdent, xe, &stop_vf_fops);
 	debugfs_create_file("reset", 0200, vfdent, xe, &reset_vf_fops);
+	debugfs_create_file("save", 0600, vfdent, xe, &save_vf_fops);
+	debugfs_create_file("restore", 0600, vfdent, xe, &restore_vf_fops);
 }
 
 static void pf_populate_with_tiles(struct xe_device *xe, struct dentry *dent, unsigned int vfid)
-- 
2.50.1

