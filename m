Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 776E9AF1012
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 11:36:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED1E810E6B7;
	Wed,  2 Jul 2025 09:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JEPvpntc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 356D710E689;
 Wed,  2 Jul 2025 09:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751448977; x=1782984977;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ydOqX3hfpJpbxUVVN1f7RUdnXOtugFBb187uxZxy8EQ=;
 b=JEPvpntcjAZKAZjw+5bVJo/Ah7DxMU27DyYDqWgS8c1AKW/V7fzyBA7j
 Pdj9fWiuVzsGzgpLlzJm8S+XVDnKV3Am5FiLl9FwfmYN0rWXQQQP2iKxd
 q80Rq2o9ub2VyyNCeZXsynVecfxwn8mSIEMqa609vAreZaH5nh2qQWkQ4
 58W/jh6flJby4XoF5EeLYFpLGUEPz6jrwSJWt6hl+ko4/YneaC5TpMu1+
 2a/WcBib7A3j6I9nlxxju5XsCDM/prfbC7QKfX1RIvKTGPpIdkJrqZfBP
 COr7hHZAl04gvJllE39gKYFGntJl7Rl7u8jCN/sY4cSMGYT1hjAYVdUzn A==;
X-CSE-ConnectionGUID: jP8qVCseSj6zs6l8DE+3UQ==
X-CSE-MsgGUID: Qg6W/BtgQ5S+5/Ap9kuYow==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="79176907"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="79176907"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 02:36:12 -0700
X-CSE-ConnectionGUID: 0WL0Z3a+RY+NIED5djkOdg==
X-CSE-MsgGUID: aj0fTND6QQW4NZtHwlRv+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="153431712"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 02:36:12 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 02:36:11 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 02:36:11 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.77) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 02:36:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AUxxuv3yc1rMrcInz1qzgRb0AC6G+Ogadj6B9TVOSOvycgujHfxXzxtmietj0WQXAuD8TITwlBRvdRhE0yyIH1nOQHpP/MbnJ1BAHJOmjF0HN67yJvhdF3Yjac5NA1hdJ0Oj6DxUH8Xx2sYbYUlidEn/BR0SM1bWVubAaOds/5lkCZjaH1spjTRoMVvhhSu/3rMmL0OrRLVw6ILKbx8REVc5lfcv6pN7am91bOFPonD2bAjhJgJ81Bd/4MDm7OGDzy/DlY+VxZzj1dr7vIQk2UNzzVMaaw1XI/q6MaanBthHtebJycrUmZEkkdqi9sLo1HWegMrRA1b5gtpcJNeIag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qt7TLcPeTjE+pjP34kB3rI7Yt0YS/PVJIDD1+lw1lbA=;
 b=MwlnD0gSklFy8tC958igvGAQIbjJCCjChZtHpm81Cuzygs5mB5dkOYCuscJvvcKykxg5uA7lKKfY3tTwaYWucxi28oS3ddurlu8ZoJ/OMserXpshCo1ALHmdJgXSgao9dBQc744IDIPSR5gur25EbznwEMpLFsA3YHD11KZm63hVYRMX3C319UCiPGEmnK2apVAAV36V4CqhvnpR+UpgQakBc373aNRW8AMlmSCgXSN7LupS7NnCAZFSg/wIdPz6vlB3D8uZwUI9NRs3eAjU3VprGum+IJsIYc/Y90uoMbK/aG+6ynVLiw20quoXuaEtuXwzdUiUapxYq74PlIm0Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ0PR11MB4846.namprd11.prod.outlook.com (2603:10b6:a03:2d8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Wed, 2 Jul
 2025 09:35:54 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%6]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 09:35:54 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>, <linux-pci@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v10 3/5] PCI: Allow IOV resources to be resized in
 pci_resize_resource()
Date: Wed, 2 Jul 2025 11:35:20 +0200
Message-ID: <20250702093522.518099-4-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702093522.518099-1-michal.winiarski@intel.com>
References: <20250702093522.518099-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::24) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ0PR11MB4846:EE_
X-MS-Office365-Filtering-Correlation-Id: 1001b0e5-bd8b-40ff-942e-08ddb94bd74b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NGlVMXQwOFY4cVB3WWJOVGVxSVMwc2xTTW5MWHM5TGpVZUVhaXdONGFjcTBi?=
 =?utf-8?B?UDl0bWt3U2RIL0taUTRMenZ6K1E5N2h5RkxhTytpeHl4Zkx3MmUva0NLWmZz?=
 =?utf-8?B?blFZU3hJSUEvc0RvWkczdnVhSmZMd1paWG9QVmtkMmJnYnd0ZEd6RDZ6VEVH?=
 =?utf-8?B?Zm9tMnlWVXh3Y1NHYjFtU2hyZG1zUVZ6NjJLcExMdlFYeGhoNFJHNlBhZlpr?=
 =?utf-8?B?UDdwNDBVZGtFbkZVaUpmbi9ldjVqdkgrd1FwMmJybWcwY0dnUlBnUzRXb2Yx?=
 =?utf-8?B?L043bG1mOVJ1UUE1UlRyelFwT1dxalVuVzdZbTc0RElaQXVzVGkvQUtVOGQ0?=
 =?utf-8?B?MjU5M0VMcTI3VUtXclhTeU9NMVQzU21mS0FOR0J6Z2QyVEE2SXA1NCticDBZ?=
 =?utf-8?B?T1RmT2xxWEFhMVg2Ti9jOWw2VGVuZlUvb3lxU0h6TGdXS2ZtTzZjOW9LV3Y0?=
 =?utf-8?B?RGpZQnFick53Z2ZMYnB4TGZIb3pUalhQWmdIMEVhMzN6UWpvcUQvN09jdFlX?=
 =?utf-8?B?dHNlRzJYOVdqMWNXNmRVazcwWHdUeUU1QU1ZS2NvV1JzSUxjNGlyRzRTcGhj?=
 =?utf-8?B?U0xGUzB4KzdVVlZUYnRrekh0bStFdGcxK240alJaNTkrYXp5VDdrTFJBcngv?=
 =?utf-8?B?eDA1VWNlcnlJbEhUSnR3QzlDZGFqY1VEY2h0T1Q2RkNvZ053Qkp4N3RLVVVv?=
 =?utf-8?B?TkJ3ODhzWjFmTDE1bW1abGwrQXBsZUg3RC9SK1UycUcxL0ZLQmt4MkZkOVRG?=
 =?utf-8?B?WHhWeURsSEc4Yy85Z1FhU1RLeklSK2MrWTdhUy8rN1g5dmt1YjBaNmpaRUFB?=
 =?utf-8?B?dWJ4dWVzNnFXLzlsTFo5TGR2Uk42OGNIVm9EUS9Ic084T3h2YnJFQjU0NzMz?=
 =?utf-8?B?SlI2Z01BQnBkNmpkdW1aclJ4ZHcxUzVKTFpzK053NUU0dWRKaE5PTnVOSWt3?=
 =?utf-8?B?RTV2MkxjUnpoOFBhazVPVnpNUFlTL3ZBTVhTeit2U0dURWt4cC9ZT2JrVEVs?=
 =?utf-8?B?SWh6OXpodEo2UVlHSCsxTXJyZG52Rk4xc01YQUZRK2J1cy9LTDZKOHZYWnF6?=
 =?utf-8?B?K2orYjhyUWVZbDI4Z1pxSVJKQVZSMytReVhMTE5saGMvSzRwTDFBTkZzY0Zz?=
 =?utf-8?B?V1R3emNRTXVleHJ5S0tKU1p4VFdSQzJOU1JPZWo4Mmp1WENxL0M1eWFzTys2?=
 =?utf-8?B?cHR4REE4aHovWEZKcjFGbEViQmpqemVLd29HOGd3dzY2aWZyMktNVCtOM3FR?=
 =?utf-8?B?UkJWSGEzM043T2w4TUZrZldXVXpjNU1oaktnTkIyS25oZ1VYQXJmMU94S2Yw?=
 =?utf-8?B?OWpKSEZsc0NOVms1RlRoV1oxMHloVTZ4YW8zMjhUSzd2OVhXd1Uvb2VFRUV0?=
 =?utf-8?B?Z2hLWUo0d1FoNEVaS1Zud01KWEYySVJKcXFVdG84bVRkMDhoMlNnT3doWkNk?=
 =?utf-8?B?RGdLUkh3eVJLdzQyYUpBME9JQVNGRmdnbVg5ai8ySWtuenljTTQzdlp6ZUkr?=
 =?utf-8?B?elpKYUNUZXRBR05xN3FjM3dCbExIMzJDb1hnWFVrOGlOakwxdGdlYndFS2wr?=
 =?utf-8?B?M21KZ2ZiLy9vOStKMVlsdkZvR1MwVFp3bFcrM1Ivd3R1Z1lWZlpDT1VySXJq?=
 =?utf-8?B?bFN3UGxHWnBFRnBBZVBzazlUMnV0WnoxeThIVUczZ2k1WG5qd2dlZDVFVjgw?=
 =?utf-8?B?d28rZnVXK2FzVEx3Z053TmE3T0RSYk5tRHBuYWNqcDEwdjJKa09WNHEyS2NF?=
 =?utf-8?B?b0g1WlZkQzYyRXFDRjJvZVA4RkFvVmdETG1jMTFuQ3FvRlBwa0g2VE0vNFpU?=
 =?utf-8?B?UWVoT2I3VUZrWjdwdjNmOGlBeXNNMEorMExsZys5aEtxSzZMK05zM0M1Kzl4?=
 =?utf-8?B?R2ZBREtpdExaQWtPak1xYXVSUmpYbUtHLy9tejRMWXcwUHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SERHZm1Cbnd5TDlHZDFhMFZBaUtzWm05YjBiTGEwaW53ZlYxQVRXT2hWR1V6?=
 =?utf-8?B?L2tBTFBndEdROWk4MmFUeklCMEFhVng3UDFWNksxK3JHZ3liVUl3a0pTZnNn?=
 =?utf-8?B?c0pwT0dQaXFFcEg4L1lZaVhXK3UyYlE4ZE8xclQ3RjlqQnhoZ0JKR1JvRWFk?=
 =?utf-8?B?RTY4RnBmbGIwU2NHbzdJcXZpLzlBVnRIcnJFblZGVDdYV0JVMWoxcDdad21D?=
 =?utf-8?B?V3g2SUc5K1NGMHpsRSthRWRmZjN2NDNzTW9WQWgvdHNNWDMySnB3SGE1aWI4?=
 =?utf-8?B?dktBTy9LbjQ3NkZNVzFWanMzWDVZU0tRZ1RMWmpPNm1CSDBRNHYzSmZpZEE4?=
 =?utf-8?B?UmRvTndhOVNkclVGOWNJTVBaK01UR0o4VTFjSDRwWDkwTENqV3p4b3liOWd6?=
 =?utf-8?B?M25VVXhxU2x3OWRHSUtYZUkyRlBubFh5N05ZaXZ4cEVBa29qeVl0QTVnQ0x6?=
 =?utf-8?B?R3VkKzh6UXNjbmlZbVUra2h1emV4Y1pTOEpjUzU3TFRiZURVbTJyTDdONGg3?=
 =?utf-8?B?ZTRsRlljUUpVbGU5eUEyOVZQNDNGUDg2Snp4M0M3bk5rbkxWVyt4a1gxcHBh?=
 =?utf-8?B?YW1lT0UzN3pzcDJZNXNDSHIxTVlCTFJ4eGlYZGhiZGVDczZJRHJYWTk4dXhk?=
 =?utf-8?B?aGE2aFphRVJESHdodUxkWDhjT3o3VWRtRlhQT25aMHB2SjNoVmRVMW9DWmZz?=
 =?utf-8?B?NHVZR2JDVDExUXpWNENrVGlJdzlTQldGVmd1RWsraWFlTGxSYmszQlRaOEpJ?=
 =?utf-8?B?aXlINVUzQzl3eDVsM3RhVmVIeUs0ZmZtZCt3YUZnek5FR1hrMHQzTU1OQ3Rt?=
 =?utf-8?B?THQyVjdIdTdPc09EOE5lOEd3NG9TK1VXanJPeGF3bGN4S2lYQmNBVE8xbURZ?=
 =?utf-8?B?RllTbHMrbWM3cW0zVGxlYUh6U093Q1VKa0NQRVVoNnBVZ3Q3dEp4VzN3UzVm?=
 =?utf-8?B?OVZ0cmJ0S1AzblB1djhnVVZpWFFpUDlTczJCWFFzalJpMzFYQzk1RHF6WnJN?=
 =?utf-8?B?ZjZrdUh5S0dPWmhSU0pjRjc1RERlc1J2K1dLcmYraTZXU0dPd1NOb2FyVk12?=
 =?utf-8?B?dWdGb3kwbDg4NEsrSkZlcVNSUW5vcUJPbjRBcWJFUkdmQ2tJMVZjbW52cmsr?=
 =?utf-8?B?WGFuZVI1akhrOWpxbXhoNVBqRVQzUFNXdnJQb0pBTEtNNG1GMERaaENvTFcz?=
 =?utf-8?B?ZDJCc0t6Z09YZGVaL1JZalN1S01WKzRRbGVVN1V2d253UEY4MnI5blhMbzJU?=
 =?utf-8?B?ZjkyRTJGa0FaUm5PWUJMNEFLa1ozZXV6OXFvdjFibDAvN2liVUw4ejZlTndj?=
 =?utf-8?B?ZFlSVnJ2NjhLdmwrRWo5NFF3SlFoTk5yVldMRW9XVW5DNzhyVXg0akViRlNR?=
 =?utf-8?B?SW5oTGJVd3Fweit4WTBNMTZ0ZWQyNUo3UUJ0MVB5WDVWcVJodzdjQWhQUDht?=
 =?utf-8?B?SlZiQ1RRdmh0S01Sc2c5czhwKzlKei96RFVrcjlTRXpPT1ZhYnR4cStkOGFz?=
 =?utf-8?B?VlkvRFgyMmg3bGl3MTBIKzNpK21QcEQ2UVJBcE9sZHIwNjFUdVNvNFhxSm9Z?=
 =?utf-8?B?RlNQTzNNNmlxVGVVOEdZR1VuWmFGZUNNY2thZVRwcThyK0JsSXZPUDJORzdX?=
 =?utf-8?B?bkNGcmszUWJ1UnZmWDAwRUd5MWRGbFZwN25YRng0WitxR1NHVGVuN0NqSVpX?=
 =?utf-8?B?YnR1ZjVEZGJBNFZjVXl1U0JnSnQ4NDJZWlN2THdhazNOVWdkK21wdE04UUJX?=
 =?utf-8?B?L3cwaHI4T2RMMFZJQStwR0ExZUtVdm9zYVA4OTRZb2Z6c0N3czMvWHByU0o2?=
 =?utf-8?B?L3kzNUVoTFRXeC9vU2pxc05KdStEVk5EUlloOGtCUGdWUTBvcTF1eEdiaDI5?=
 =?utf-8?B?N1J0VmJJMTU2c0NqZndzZVRMcGJUaFlxeE9uaWxMaVFhTnNldGV4STFQamUz?=
 =?utf-8?B?UExVcGFsRHdDOVVESjJ6alh5L2huQWxtRHQvR016U0V1WkZwcW9YU0ltekJC?=
 =?utf-8?B?eWRRaVdWVG9kZlFXelV0azJOY21LN3RmeHZjYVJjaWtlVnhFTHV3MzI2Wk9p?=
 =?utf-8?B?WlN2Yk5MWWlzVG9RemtJZmh5WGhDNHR2SVhxM3BrNkpNZWEyUVN2M1A2RkR4?=
 =?utf-8?B?UmZyZENEZEpkOWhTS1ZwdjBlWTZWNzVMN1dmQVIyaUZFcXIyUmpqbnltT1NZ?=
 =?utf-8?B?d2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1001b0e5-bd8b-40ff-942e-08ddb94bd74b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 09:35:54.3608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WN6hTLCZBYJUfQelmGyWTctI06c88LiRaCyaNVF+KoyPyYrZ/m24gjPsU0P4Bjb10PQto7iILj4xnqXA7Of0eHmYuSv41eFZXXuNZkI9L08=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4846
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

Similar to regular resizable BAR, VF BAR can also be resized.

The capability layout is the same as PCI_EXT_CAP_ID_REBAR, which means
we can reuse most of the implementation, the only difference being
resource size calculation (which is multiplied by total VFs) and memory
decoding (which is controlled by a separate VF MSE field in SR-IOV cap).

Extend the pci_resize_resource() function to accept IOV resources.

See PCIe r6.2, sec 7.8.7.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/iov.c       | 21 +++++++++++++++++++++
 drivers/pci/pci.c       |  8 +++++++-
 drivers/pci/pci.h       |  9 +++++++++
 drivers/pci/setup-res.c | 35 ++++++++++++++++++++++++++++++-----
 4 files changed, 67 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index bdac078045525..852424cf2ae15 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -154,6 +154,27 @@ resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno)
 	return dev->sriov->barsz[pci_resource_num_to_vf_bar(resno)];
 }
 
+void pci_iov_resource_set_size(struct pci_dev *dev, int resno,
+			       resource_size_t size)
+{
+	if (!pci_resource_is_iov(resno)) {
+		pci_warn(dev, "%s is not an IOV resource\n",
+			 pci_resource_name(dev, resno));
+		return;
+	}
+
+	dev->sriov->barsz[pci_resource_num_to_vf_bar(resno)] = size;
+}
+
+bool pci_iov_is_memory_decoding_enabled(struct pci_dev *dev)
+{
+	u16 cmd;
+
+	pci_read_config_word(dev, dev->sriov->pos + PCI_SRIOV_CTRL, &cmd);
+
+	return cmd & PCI_SRIOV_CTRL_MSE;
+}
+
 static void pci_read_vf_config_common(struct pci_dev *virtfn)
 {
 	struct pci_dev *physfn = virtfn->physfn;
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index e9448d55113bd..55695852975b4 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -3752,7 +3752,13 @@ static int pci_rebar_find_pos(struct pci_dev *pdev, int bar)
 	unsigned int pos, nbars, i;
 	u32 ctrl;
 
-	pos = pdev->rebar_cap;
+	if (pci_resource_is_iov(bar)) {
+		pos = pci_iov_vf_rebar_cap(pdev);
+		bar = pci_resource_num_to_vf_bar(bar);
+	} else {
+		pos = pdev->rebar_cap;
+	}
+
 	if (!pos)
 		return -ENOTSUPP;
 
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 6f6db4afcc200..c233601532711 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -719,6 +719,9 @@ void pci_iov_update_resource(struct pci_dev *dev, int resno);
 resource_size_t pci_sriov_resource_alignment(struct pci_dev *dev, int resno);
 void pci_restore_iov_state(struct pci_dev *dev);
 int pci_iov_bus_range(struct pci_bus *bus);
+void pci_iov_resource_set_size(struct pci_dev *dev, int resno,
+			       resource_size_t size);
+bool pci_iov_is_memory_decoding_enabled(struct pci_dev *dev);
 static inline u16 pci_iov_vf_rebar_cap(struct pci_dev *dev)
 {
 	if (!dev->is_physfn)
@@ -758,6 +761,12 @@ static inline int pci_iov_bus_range(struct pci_bus *bus)
 {
 	return 0;
 }
+static inline void pci_iov_resource_set_size(struct pci_dev *dev, int resno,
+					     resource_size_t size) { }
+static inline bool pci_iov_is_memory_decoding_enabled(struct pci_dev *dev)
+{
+	return false;
+}
 static inline u16 pci_iov_vf_rebar_cap(struct pci_dev *dev)
 {
 	return 0;
diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
index c6657cdd06f67..d2b3ed51e8804 100644
--- a/drivers/pci/setup-res.c
+++ b/drivers/pci/setup-res.c
@@ -423,13 +423,39 @@ void pci_release_resource(struct pci_dev *dev, int resno)
 }
 EXPORT_SYMBOL(pci_release_resource);
 
+static bool pci_resize_is_memory_decoding_enabled(struct pci_dev *dev,
+						  int resno)
+{
+	u16 cmd;
+
+	if (pci_resource_is_iov(resno))
+		return pci_iov_is_memory_decoding_enabled(dev);
+
+	pci_read_config_word(dev, PCI_COMMAND, &cmd);
+
+	return cmd & PCI_COMMAND_MEMORY;
+}
+
+static void pci_resize_resource_set_size(struct pci_dev *dev, int resno,
+					 int size)
+{
+	resource_size_t res_size = pci_rebar_size_to_bytes(size);
+	struct resource *res = pci_resource_n(dev, resno);
+
+	if (!pci_resource_is_iov(resno)) {
+		resource_set_size(res, res_size);
+	} else {
+		resource_set_size(res, res_size * pci_sriov_get_totalvfs(dev));
+		pci_iov_resource_set_size(dev, resno, res_size);
+	}
+}
+
 int pci_resize_resource(struct pci_dev *dev, int resno, int size)
 {
 	struct resource *res = pci_resource_n(dev, resno);
 	struct pci_host_bridge *host;
 	int old, ret;
 	u32 sizes;
-	u16 cmd;
 
 	/* Check if we must preserve the firmware's resource assignment */
 	host = pci_find_host_bridge(dev->bus);
@@ -440,8 +466,7 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
 	if (!(res->flags & IORESOURCE_UNSET))
 		return -EBUSY;
 
-	pci_read_config_word(dev, PCI_COMMAND, &cmd);
-	if (cmd & PCI_COMMAND_MEMORY)
+	if (pci_resize_is_memory_decoding_enabled(dev, resno))
 		return -EBUSY;
 
 	sizes = pci_rebar_get_possible_sizes(dev, resno);
@@ -459,7 +484,7 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
 	if (ret)
 		return ret;
 
-	resource_set_size(res, pci_rebar_size_to_bytes(size));
+	pci_resize_resource_set_size(dev, resno, size);
 
 	/* Check if the new config works by trying to assign everything. */
 	if (dev->bus->self) {
@@ -471,7 +496,7 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
 
 error_resize:
 	pci_rebar_set_size(dev, resno, old);
-	resource_set_size(res, pci_rebar_size_to_bytes(old));
+	pci_resize_resource_set_size(dev, resno, old);
 	return ret;
 }
 EXPORT_SYMBOL(pci_resize_resource);
-- 
2.49.0

