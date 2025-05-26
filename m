Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B25AC44EC
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 23:44:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DECEF10E40F;
	Mon, 26 May 2025 21:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CfRmKljj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 050EE10E401;
 Mon, 26 May 2025 21:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748295886; x=1779831886;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=yQvZm0Ga/hRwG31Kw3v5uaPPK1j+cEzIWVk6JP2lqn0=;
 b=CfRmKljj8F1OUTu5/Bkz1puRoETYm8DpSTH4PwLC3xde5UvwgaXxPhn/
 NPp7cOCVPumDTVxQAiHc7bBwZ76aHWvPNblsWPbfn7JJNvbawYZVySDwk
 7oLKzfpORcdny7k5YQ9vo0eI/6XMWgLhETqhaLWxX1ddQK+3k5iRsT+eA
 oN+NSg6wpd03Ei9eRBO2SSsSgrfQHbKtNMGbS12UC5ENt0p0kbOo8Mcr2
 oChfyamdpbmpGCIC9tPAXQGlz2cuX5iUhBNVzYXGn9XaD8ecymOgMF25L
 0wGv8gnTfoV80UX5svuHDzag/l3rjaZ6zBNB/3c19zc9o0WI6txLiYTtr A==;
X-CSE-ConnectionGUID: YQzi+TbUREGwUJlEJ0dyPA==
X-CSE-MsgGUID: HafZ1W/sSSqtsLVeK1qBuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="60903554"
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; d="scan'208";a="60903554"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 14:44:45 -0700
X-CSE-ConnectionGUID: eERxg4+qRjueKcD8qWGasA==
X-CSE-MsgGUID: Pvtru0SVTvKk4eFP7Peu6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; d="scan'208";a="143113947"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 14:44:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 26 May 2025 14:44:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 26 May 2025 14:44:44 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.72)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 26 May 2025 14:44:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T4CX//09scIxx+zUWbzd8dPj4eK86xODWkWZIOFZ1jl4jcl/DVsfsMm9NGtY/2xMznn4/4/D3nxuTXDS3GLZjN899pJ8QNjbTBfcnaGgtQZnNpsowhV7bh9geVhc6bcK+HYsS/quE2pivawFvgvQxfVE3kiZnWB0n5ZWkLuK05LcIcsJRfGoUFNPlBj6U+XNd2O5btL/XHPJC9eZmsk1tIovyqIR6xZRH9O1/jZfeIXNpJvKxyTK2S3oMm0QqHmNMR7qenXKZ/9OVbQCE8wWBbUFTh3AkZ8timLa0VTUzs+gJyppwk2XjDBE24iSeHLe0LJkS8h+DtxSd7QmI7csFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1plmEqMqpV8IgipC6AnDhVqIl4Yt7pMfRz3yMnlU1nM=;
 b=I1ol0BJbfmPztQ9a+gRbQykfQrMWfjgWy1a9C/k4Ds47jbAkegPbetr6I3KCH/aEjVDMChxfphXoHFhMOrcs76YCNMib+ym3bq6UjjdtVojVDpWrDwrxA4d28fpcJxQaAdYjnD1E3HaQyfCY2HxI38TaPg7+HvQh7h9/QajarM1FC9Ga8fb8z7utwJwBW0LPpUpcwMokOVvWHp1l4uXVV2P9PgZz99nM+zttUhV/kgYasicd1CUVQl0MDveo2DEPiawWiOm6AbJOT0egmuX4vJqs88ZFFZZREnlO5Ns+WjaqKtS1uUY7NlNqs7cwf6ILbLXmC0RO1sjH8ZbjXCE1Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM4PR11MB5279.namprd11.prod.outlook.com (2603:10b6:5:38a::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.24; Mon, 26 May 2025 21:44:36 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8769.025; Mon, 26 May 2025
 21:44:36 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
 <kw@linux.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v8 6/6] drm/xe/pf: Set VF LMEM BAR size
Date: Mon, 26 May 2025 23:42:57 +0200
Message-ID: <20250526214257.3481760-7-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250526214257.3481760-1-michal.winiarski@intel.com>
References: <20250526214257.3481760-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VE1PR08CA0014.eurprd08.prod.outlook.com
 (2603:10a6:803:104::27) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM4PR11MB5279:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bec9ca0-b2b5-4b0c-e72a-08dd9c9e824d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SmVRTXJVSDltTFFreHFKbnhBd2hDMnQ2SmFCRk8xa215R01DdXgvMG1OTDhX?=
 =?utf-8?B?THhaVU5CTmVuTW01OGRWb2tMeEpZTjRpQ1UvS3ZITjhxUkRGTDNGdWc0MFZr?=
 =?utf-8?B?K1JhdUZ1WmdDT1V2MldWWFdWR015TTFRZ25aV3IxSTcxTjIwMGcwMThvUnls?=
 =?utf-8?B?V1diNUxxQmFCc3VjQ0tzUEJwL3VTbmZmSHlieFRtMFdFM0FqRlBTVStsZEZC?=
 =?utf-8?B?SkdTdGtkRmZsbktvUmdHUjFrdmJuRTgydklQNVV2a1JWTi9uK2JGRUtnRCtx?=
 =?utf-8?B?cjhjcFFZNHRabVI4QWY3WUhoZkFBUTlSdkVYak5YZ3NlRk5HSnhnMVM4b014?=
 =?utf-8?B?dGNWWFlyVWhYMU1iVkdub3dEMVp6ZGlSeVY1ZnZlbUZVUkdjTER5TVpOMWVU?=
 =?utf-8?B?ajV1Q0plVzRISGIremN0bDRHRTRUMlV4MDkzZU5zd0dYUzdkYXpUY1dtVVdi?=
 =?utf-8?B?anNOK3BhNStxNDM3RXNKOGJ6RHdidkc1WnlNOFh6Lzc4cEQ4NWpHdWpPelc1?=
 =?utf-8?B?amJzWVNrTWZiWmhGdGcyQ3dBazAreG5HMVlPVnZrbEdDVklZa25iUDRkYTVw?=
 =?utf-8?B?VTY4Vndxcmt5S25WdTdJRUpFNHhLdWMya1V1c0gyOHRBMVlmSC9lbjdNaVdL?=
 =?utf-8?B?Y3kvMUN4R3VpWjJEbmdFN00rdE8wSHRKYTJScVNITG5PSVZIa0F2bVNCN2NG?=
 =?utf-8?B?UTNRWnNidVBXQVZFejVWSDhaTDBvcU9yWmZWNlIxSm1qbEpmV2E4Uno2dTEr?=
 =?utf-8?B?b2c2YnZwMVBuQUNKY0x3Q3JhQ2RaRzRrTktqVVg3bkEzZm43SnFkcUFkU1E2?=
 =?utf-8?B?VHErL29lOVNaQmFpdEJtWmdIcVE3QVU0Q01qcmlRckprcHFmYy9DV09YRjNJ?=
 =?utf-8?B?Q2kxSjRzNnJ0TVBOWVVRQWIwY2tWTTNJUTUzaUw5cWNiSHRpTnF5ajNkY0Jy?=
 =?utf-8?B?VUovQlpONUpXTDhsUmVmTmltT01ERWc2eVFHMDFlank5U0FaNzl3cGNlUU81?=
 =?utf-8?B?aVFqOUFDU2gyZ1M0eHowczk1V3pyUDJLaWhpNkdSQnZnUVVaSkw1Sk90NlEz?=
 =?utf-8?B?anF5eW9QVENyd3lHdGJQWnhhWE1LREFQT2FBaTU0cUU3dzFlbHJ3dGo2YUFN?=
 =?utf-8?B?WVRaUktFOEZoYTd5UndoQmVOTnVMOGkyb1IrciswcGVDSEdnb0lxS0NNVEp1?=
 =?utf-8?B?VHZBVndZM294ZDZvdHVVRFYrdHhCajVjTUFYaVU2Mk83NGF0clNLZSszMHlM?=
 =?utf-8?B?TTZQZXJaVFEvUXVCYTVYT2dlMTZuNDNsZkFjczl2U1RINi9weERqN3l2eXlD?=
 =?utf-8?B?UlpPalRMYy9qRWZQMGVIQTJQSitTWUM1dk9TS29sVkNzR0xPL21KdWppVlp2?=
 =?utf-8?B?N2ZXMkxwNTFvejluRnFtWWJDaUlrZG1TUjFGa1I3VHEzVUcybXpuaTNMRm5T?=
 =?utf-8?B?ZVhHWWZnTU9rQ1F1VmNLZmRWZWZwbHhuaDBhcWxDcFdlbEt3eXlEcTJJNEx3?=
 =?utf-8?B?cTAyUnpIYWJ4c2NacHNUdE5wZzBoWGdOblNQRTlYM3U1czFWdmFmd0NuQkVY?=
 =?utf-8?B?ek4xRVhoT2IvaythUHk3S21rYWxzVThCbFkrZlZNcmx1WjJTb0l2RnhEaE1l?=
 =?utf-8?B?czhwQzVPTGdYR29iYmtBL1ZOTGZnZXJYV1dTZHFibnpSV3pHK05Lb1VrV2lU?=
 =?utf-8?B?eVBBd2dOMTRYdzRBamZaMHViVUZhV1RWQnZEd0FxSHdqM3AwWmxYbDI5QTlv?=
 =?utf-8?B?bExXNWFSWUpKelZtVHBlS1IrQlJ3enIyQlBMVmJWNlcrMmRYZHA3bGQrZlFX?=
 =?utf-8?B?VkVJdWVnRVE0T3BYNXRPWVhWWUx6R3BUTnhCTktnQkYwai9qTFVIWXBoakYr?=
 =?utf-8?B?NXJWWVlWYzduOE5UOE9SMVpuVnhxS2J3QUhlYXExbWJPVGEwYWJBdnBPMFda?=
 =?utf-8?Q?diMguesGy5s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tnl2UUgyekQ3TVM4ZHptOWJRVVVYdk1zcVhMdGdWdTZPYmZpd0ZYUXhCMGl4?=
 =?utf-8?B?b1ByOC9MZWlKUVB5cnFRcDQzYnRqdTZxUTlQMGs2djlqNnYwd2tiUGFmV0Nh?=
 =?utf-8?B?NGUxS3FWNjFXMU1HemRwVGZMUXFRQ1VPb2ptRWNFRG8vaXQ1TkNvaU1FblNX?=
 =?utf-8?B?a3RRMjBPa3V1Q2l3VGJkM1FvWnlXQUNFcW5SNGZzTFVERGs1cFljOEc4aW1a?=
 =?utf-8?B?N3hhUEJRR1BaSm15dGk0MEU2cVJrVGZseGpQM2E2cXNJb1RRbTFOMWFaWC9Q?=
 =?utf-8?B?cDg5ZUhCNWJDM0dNRzVPS1o5TkxYTHNESXdjRDRCU3hNMzhVOUllTng5enhQ?=
 =?utf-8?B?V0EvWXFWcWxkb0RvWThHSUdDdFAyckFudHNPK0V3SkdNdXZiMVpKR3lZU05J?=
 =?utf-8?B?enNZc0lmQmMxbUpwdnRpMjRXRWwxbGlvSVEzNkh3K040cmE2NXYwZ2cyd29F?=
 =?utf-8?B?UjVPZkdmbEpxVDUzOU1HbUVnVXRmOENxbGo2ZjlUMnhBcWl0MEh6ak5mV21C?=
 =?utf-8?B?blF1SHoydUpXcUtCbURuK0xDMHQ2cU92MklxeWRmK1JQWWhVNWhIaVNFRmhU?=
 =?utf-8?B?K2dmUlp3akR5WkJNdjRybndaeDh3U0tNbFo3c1JQTUpwMnFNUmJqSGt0UjNn?=
 =?utf-8?B?WUJsMmhjLzc2VDVBejUzN01DNFVicjFDR0Y5Zy9Qd0g5ZWdQOWdXOE9EaVI5?=
 =?utf-8?B?NlRoTm9CaUlQcTg1S1gxRE01OW5UY0YyTUhnT3YrV1I1YlJmMFJhbEI4YTcy?=
 =?utf-8?B?NWZkOE5ucUVTTjZjblJyLzQzekdibHlGd0NTdkpzeUI2aXVmM1d0YSs2VTJv?=
 =?utf-8?B?UmpzejlWQWdRSzAzZWtLaFhVeWdYcmdQaDlPVm0vQWtMUENZUTZaTUFic0dx?=
 =?utf-8?B?SWJTOFF5SkJiS0NnWjB2emRhSFNUQzNXdml4alpTdUl3Qnd0QnR4b21ldmpR?=
 =?utf-8?B?U3FKdmdRTnFwSmFDejIzWDFmRDFQSWlnQ0pMOWtjS2swQ2ZXeXFtU0VFNStv?=
 =?utf-8?B?aG1YL25HNUM2M1FKOE0reDBFZWJzSXVUaGdTMFRqQVZraUV1NjNGUmplL2VP?=
 =?utf-8?B?RmhQakYwL2NRRFBHMTBFZnNWQXBjamxPRTliNUpzKzlLYVN1aVBCUk9WYkhL?=
 =?utf-8?B?YmVCaTdEQjltK2tOMGZyVkFVV1EvcWFSbzZuelpRU2w0dHdIRjcyTVZpWFV3?=
 =?utf-8?B?ZDRkdVR3QXlHMWZoM20zeStpdDd2ajVxSEFEVllNOTlFT05IZUlYNVZjUzM3?=
 =?utf-8?B?QVk4OFpMWmY4V082c2F1UkhmZm54VHB2ZDlPZmFQVHNRT3pqMmtPZ1hXQitN?=
 =?utf-8?B?Yi9PUmtsbkRMU1A4VXJZK0x1cC9NMVBwaG5vdnVvOVBGODNFZk1QK1VuK0lJ?=
 =?utf-8?B?NXZtTTBjelVYbklXenRXbFUzZWRRZkxDbXhFQUFsdzA3ZklONzFrN2k2RGlo?=
 =?utf-8?B?QzVyelZPOVNjaDlVMkRaYzQ2NFpLQUNDd3ZQTS9xOGV3ZGh3UnJsZDNvRVN6?=
 =?utf-8?B?Si82NWpzeDF0N0pvRHVyWU9iZUkyNEFTTGVNS2Z1aytoZmN4dVpYVmhNbXNr?=
 =?utf-8?B?SGVFSk9QRjZpdDh4S1FBRC9KbjhpbWwrNlVCNmhiallWSG03REhHUEQ5V3dj?=
 =?utf-8?B?UXlmWWU1dXNValAza0tCcVdLU082SkRQTTFPbmJXTGxUNEpKekFUSytxNnhq?=
 =?utf-8?B?dHQ5WHpKTW9yM05YYW5YcktpbkJjSmx3US9GSXpsQWlONXNjUTlWRGNkUnRK?=
 =?utf-8?B?cEx5a2QyQW1FeGhNNlBJZG5GdEFjZTRNOTB5SWhBM3NwMm93ZmtoYk9GK0s4?=
 =?utf-8?B?UC9vOGd4cmdPUjhQVkdHSlVuUDZnbzNkU09Wa2EvT2JyTnhDQVZHL0VFdmsz?=
 =?utf-8?B?S2xUU1Q1RW5YWWUzS3BnSHJRdUZPNStmSlRBSHJsQzQ5RjAreE9EYUpxT3Bn?=
 =?utf-8?B?OEFRb1J2WjYwanBZUnRNWXJIQVhtYjJpRUsyb2RFd3pPZ1VFOUdTMDg3Y2lV?=
 =?utf-8?B?KzRhWVZBcVpGR1F6b3VLQzYxNVdDOWRJdHRzOUZ5VDBwZHdkQUZwUHcwLzRG?=
 =?utf-8?B?dCtadEJlT2cwb3AwdC9mVVl4UmFGaXI3Y3dUcW9tTlVzSDBWZERhYlFWUnRz?=
 =?utf-8?B?L1M4QXdUTmtZTDVLbzdmcGdhcVF2c1E0T2FnNlJhYkNYUmZxcGlLWUhlUnZL?=
 =?utf-8?B?aWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bec9ca0-b2b5-4b0c-e72a-08dd9c9e824d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 21:44:36.2588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2xP4ri1sdJGP52vyn2Akq5imj8G8jfn9OMto31k2MHHUbZc1JP5oS1spPBrecfmKOB2NfvXD3icLuA/0uZUe3nB63nagfwTsLTXix0ElNa0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5279
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

LMEM is partitioned between multiple VFs and we expect that the more
VFs we have, the less LMEM is assigned to each VF.
This means that we can achieve full LMEM BAR access without the need to
attempt full VF LMEM BAR resize via pci_resize_resource().

Always try to set the largest possible BAR size that allows to fit the
number of enabled VFs and inform the user in case the resize attempt is
not successful.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/gpu/drm/xe/regs/xe_bars.h |  1 +
 drivers/gpu/drm/xe/xe_pci_sriov.c | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_bars.h b/drivers/gpu/drm/xe/regs/xe_bars.h
index ce05b6ae832f1..880140d6ccdca 100644
--- a/drivers/gpu/drm/xe/regs/xe_bars.h
+++ b/drivers/gpu/drm/xe/regs/xe_bars.h
@@ -7,5 +7,6 @@
 
 #define GTTMMADR_BAR			0 /* MMIO + GTT */
 #define LMEM_BAR			2 /* VRAM */
+#define VF_LMEM_BAR			9 /* VF VRAM */
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index 09ee8a06fe2ed..4be566331ee15 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -3,6 +3,10 @@
  * Copyright © 2023-2024 Intel Corporation
  */
 
+#include <linux/bitops.h>
+#include <linux/pci.h>
+
+#include "regs/xe_bars.h"
 #include "xe_assert.h"
 #include "xe_device.h"
 #include "xe_gt_sriov_pf_config.h"
@@ -111,6 +115,18 @@ static void pf_link_vfs(struct xe_device *xe, int num_vfs)
 	}
 }
 
+static int resize_vf_vram_bar(struct xe_device *xe, int num_vfs)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	u32 sizes;
+
+	sizes = pci_iov_vf_bar_get_sizes(pdev, VF_LMEM_BAR, num_vfs);
+	if (!sizes)
+		return 0;
+
+	return pci_iov_vf_bar_set_size(pdev, VF_LMEM_BAR, __fls(sizes));
+}
+
 static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
@@ -137,6 +153,12 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 	if (err < 0)
 		goto failed;
 
+	if (IS_DGFX(xe)) {
+		err = resize_vf_vram_bar(xe, num_vfs);
+		if (err)
+			xe_sriov_info(xe, "Failed to set VF LMEM BAR size: %d\n", err);
+	}
+
 	err = pci_enable_sriov(pdev, num_vfs);
 	if (err < 0)
 		goto failed;
-- 
2.49.0

