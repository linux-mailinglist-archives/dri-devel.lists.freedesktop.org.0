Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2EBC363DE
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 16:11:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B91D10E785;
	Wed,  5 Nov 2025 15:11:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DhMKU8RY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B8D10E78D;
 Wed,  5 Nov 2025 15:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762355494; x=1793891494;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=UYbyamX1/5Ip4MXH74m7zlm3HGrez08+gQD46Mv4Qr8=;
 b=DhMKU8RYWC/7eSt5MQ9VxFUzjRgLlDux4mBlo+82X8CdDOU3fyiYbLrM
 VwL1fGrUpZMwOnh75wSRiz5AAcmAIqoK6awlUnxLY5lUoKfbBMy9BDSMk
 yoR5IxyEr+kKkIaHU2+tGUH2kuG91eSrk/qWpcElBjTO4fTolr2kgpPFe
 kEgxG6Va2lyNNzm+8432lGw115uuVjmme+XOiNKl8kpc6GFE2TisBPqYp
 R4fKNFgJ3LpRuT0QEWQlV1k9ho0wqFbd8/R38iH3Bg2RyP6WmeO22pP55
 lxnq2POOWzvgnyC6Zsm+Fe2eg2O44aB2nkAb8lZzBQUvDLsTBzbadF8O3 w==;
X-CSE-ConnectionGUID: XaIFTRGlTTaOzuZWRnFBXQ==
X-CSE-MsgGUID: s8/hs0P5QMaynkj7pmbeXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="52041795"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="52041795"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:11:33 -0800
X-CSE-ConnectionGUID: G5q6lcRwRECLToWEX8sdyA==
X-CSE-MsgGUID: H/oO9XCXRzmpAJzTM/oKmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="192649504"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:11:34 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:11:33 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 07:11:33 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.16) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:11:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XBj59cZqXLTO38XcPm4evUUpPJaRWWkzG5eAAkP5VApgxozlafuOukG2kamhdSze6lBYT0kzHmPOIrNXj3OCEicWhe6PvVC+ipATpnXJhxqNH9gWd3QHtjM4plNmQ7Iw3UHUy+VdJebIJAw/T7UUzvVa/x/PZNqGJFKtx/ev2WdR7k2rBxUzuNx/+Vage5o9F47ccSWYKe5Bcg7kYr4G7QzS4ii86r3sEEleddW/StBtvpNnhiyLT+paxZ7CCh5QJuthvq9gPwTqNQW5bliIV5aZSDk3n/G8OR3AHxUt2t6r2/pAMJ9qucr+M/L+22WwqY9NdqisGg9JjA7wRUXRWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ua+RU3HyqphpB8LuK+eSQg7ZIzp1WQa6oBVPzUomHpA=;
 b=mbp2N7/kXZC7jfYNKBI9qm11/SXGgraz+KtXQrl1vvS+KI4pTUdwgwHahnv30qdloXOO5q11kczJ3pDsutEb8IffuxN1ebGrIO0HnN4gUwGoQJp+NILBGQPrRFZwVvb58W0JSNjhHijxxJCHMZ5YAf/GA09ufrm0XxJDdqBHQ4X9TD16qQO9QxEzDOmTAH8TtHf1WT8RUBcV9lgnUksHWDxbkexFkFwo02HwmgFPRfhCPQjGArp1Gmx2BrgRuux+o170hLozHCHGBeLteUFdhE4ZtyCxV3/9gToIE2v+29JBD0FxO/jbiv63N0bg34/NoV537QU8B2tviiDYP1p1yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB8123.namprd11.prod.outlook.com (2603:10b6:510:236::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.8; Wed, 5 Nov 2025 15:11:31 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 15:11:31 +0000
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
Subject: [PATCH v4 09/28] drm/xe/pf: Expose VF migration data size over debugfs
Date: Wed, 5 Nov 2025 16:10:07 +0100
Message-ID: <20251105151027.540712-10-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251105151027.540712-1-michal.winiarski@intel.com>
References: <20251105151027.540712-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0278.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:84::13) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB8123:EE_
X-MS-Office365-Filtering-Correlation-Id: dd554d14-029c-44fc-2095-08de1c7d99ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3E1QWUvTDZkTDc4eXh4VkRJRE03UXpQT1pmdFNLM1Z3eUZwU3NwMk1jalli?=
 =?utf-8?B?b1EyUzRaQjFuQlhjc1VMc0p1TWZ5UUhPM0N1WTN4ZkdsT0NuN3B1c3ZGdDdy?=
 =?utf-8?B?ekhRdEZnelRhcWphZE9UWTJwcHA4MFhnYitVKzVzU2RXcENUWEtPMFVUSHRl?=
 =?utf-8?B?U0dFZWx2SWdnOEE0dGhIdFhXN3IzK21CY2VkcU96T1VpVmduQXo5NHl5QWlu?=
 =?utf-8?B?OXhKTllFcWpNS3VwV05XZEgvdW1sZEpiNVZ2eVMxUk02K1dPZHZNK3QzdlVH?=
 =?utf-8?B?bkdUWkVSbHpmbDRDRHRDbmUyVkk0NmVFUVg2enNSRWdQNjNwWXhRTnpGb0tK?=
 =?utf-8?B?NW5POU5pa0VlN0FERlVQYTUxRWxYQVptK3NhT2tvOU9Qelc5LzZvbmhUWGZh?=
 =?utf-8?B?YUJvZUNoVHNCazFzWS9XM3BrVVVOT3JNWGRTS1AxVkJPQmM0a3lkMThBYjVG?=
 =?utf-8?B?OWNOTHZqWnFzNWdrNG1vUHVxV3AvQjhLcGlqcGRpWDVNdGFFektDa2taVUZU?=
 =?utf-8?B?N2U3a2VuN2wwMWI4TTI5clBaNkQxZEZDanRqQ1NqT1d6Vzl1U1B4TVN6dEVp?=
 =?utf-8?B?RnZBMmQ0RDd6b25TeWgweE1La1FEK3R3aENLY05zVFFDMWRQTHpCL2FBSWo3?=
 =?utf-8?B?ZDE5Qi94RWU0ZEFya09DMFdRYnpYWDQ3bHo4dWZTMERKMWFOVUFSbENHTVBY?=
 =?utf-8?B?VHJDam9nUElJdzhpU1NWZGc2VE0xL1BtMHlXUUk4N2JkR01aYWJWWlZmaWJv?=
 =?utf-8?B?cm83VVM3aTIza1B2Tm9tWlA2SVhFSjR1THA1eTkxaGorekVVY1pnc1RqaEZs?=
 =?utf-8?B?ZmJGZnB5OGMxK2hwVkwyendYcW9QL01GK1pOZDEvcXltK2xnSnBkbzhDc1NE?=
 =?utf-8?B?QldXbTl3TXpET3dEejMrY3BRaFZhbCtmWHFxWk80ekJWeFB0SzhDRmNmQXJO?=
 =?utf-8?B?RVlLV2k4UnlVYlVSa1c5TndkU0hhNzZDb2RBK1kvOElQMzFOS2hqalhyaXVS?=
 =?utf-8?B?SThDeHN3N2RoTzFjRTRRVE9TZFhjdFlSUmV6OE83NEJWdDVZNlczdk1qUFlQ?=
 =?utf-8?B?UTI2VkZtYWMwZVNycEZoTGZBNFFPSGxXTlk4ZlRoZU5NajQrTVBqbi92WXFN?=
 =?utf-8?B?QU4xQkVtaVN4VDFFOXRPcHI1TWVBMStReFR1cGY3SzdSUjNIblRtektTQzh0?=
 =?utf-8?B?WUl3cjNVUTdBTTUyclVyN1JwcmVQN2VNcnBNbFBiK2x5UUxJUWM1TnRpc3Bj?=
 =?utf-8?B?MjBlYnBNQ1JEbkYwNDNuRW1TaC9mMXA4WitNS3AvZ2U1ZC9HWGhidEJ0dGxj?=
 =?utf-8?B?OVBia0NhTE9DSjNmdXhsSGlUZXlRcTh0dTR0YTFTVFkyS3NDOTFJMXp5WHpY?=
 =?utf-8?B?WjNMc3IvSHRhVmJCTWgxSm5mZk9mTHB2QjBhNHBkK2w0d3c2NjhQTlBjdXkr?=
 =?utf-8?B?enZQWWRKd1JqTkZhanoveFpKRHBCazQ4Nm1BdlArb0tXMy83T2hJWE1MQzFD?=
 =?utf-8?B?cVBrci9XY2lkcnRPUDBrSW9SNkRQL0pBeFYxL2h2WGxvQWJZVmk5dU53NVJk?=
 =?utf-8?B?Y3dMMW5mbXFaUUlqcHQrS29vN3R4OHhYYU5xYVAyTUZzblQvTHhWak03MEtp?=
 =?utf-8?B?YWRodnhrWmdSYXNCRkdoKzNZbm9KUXVTdkI5amlGNWhvREE3Q21JMCtJSUhn?=
 =?utf-8?B?ZjlyN3F3Um5reEhtbDVUY1ZHN3F5MnZ1anl6UDNFVWVpOVFsU2VteS9SNUE5?=
 =?utf-8?B?VzlsZlduZkFBNVpoeURYQ3NBTndkaFMxeTRRQkdRVWRYbGhLNEI5S1d6aWdz?=
 =?utf-8?B?OEZpTHhJZTMvc1R2R3F1bXlYQ3RJUHluUnBvVFp0a0MvV09QZ3N1ck9hSisz?=
 =?utf-8?B?YXh4aENQeU0zWGhtNjh3WU14ajVZMVJOVmJNb3ZxZVNMRzMxd0Jwc3V0TCts?=
 =?utf-8?B?Q1BhMDdIRmJGVFljMndTaktTeUxNdklTazk0QWE5cU1WQzNVMmFSbUw4U1Ju?=
 =?utf-8?Q?IA8OO66Et7BJowVb2yMtB415um/WNs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDk1S0Q4Z3J3YjhLZnBaVGFQSmxQQWY4ZElVKzYxdkY0UmY5aGdybW5nSUZP?=
 =?utf-8?B?UUVReEhjWmN0Y3NvTlY4YWVScks1YUZhMExIUk10YlhWaGRJdXFDVFFBVmM3?=
 =?utf-8?B?L0FUZjg3TE9Rd0l5dWNRaVRrdEIxRmQzdGRBVWg1dW0zeTl6NExGUW96SWNO?=
 =?utf-8?B?NWhxZHh3b2MzcVhqNDNUbStZNjdZdWRIRVM4V1crVDJCdjVVcWZWYmpHc1F3?=
 =?utf-8?B?eWdzUjlRbGdYcStNMEthVnEreGZmejl2VXlqUUVBVi9WZEdoenVleksvbURE?=
 =?utf-8?B?ZXFYUEFWZ1NkYy9xWFVhQk5tS0RCdEExbDFISVBkelVnYW1VSzdTVlIwT0dm?=
 =?utf-8?B?MXQ0WkZKdjZNVTE4RUV3Ujc0czhsRndObzBGZGtVZDNjdVd1UW9sd3RFSUpz?=
 =?utf-8?B?NXN6V0VweThNQ29LOUkySVhYOWJpRnlVamJBS1lObUdqUTZUbVlKaks0ODYw?=
 =?utf-8?B?UFpydDdJRFVyM2NMTTFNUVlNNFRHM3NJOGsxYWZqWm9nVzNYUmRDMUFkRzk4?=
 =?utf-8?B?dTZaaVNsVm5sc0FrVTd6MWxBTzJpMVNzQkJ3dXpXQkVocFhKSzFESGdobDBW?=
 =?utf-8?B?ZEhZdDUzTUhQZ1puWE0rb2tQUGt3eFJnS3p6bU5mLzhpaklDbzJDb213WVVj?=
 =?utf-8?B?cGpXQnBPNmpFd0pVSms4dUgxWEtKOU42ZFEwREp3bzBsaHpaREEyM05rekVP?=
 =?utf-8?B?Myt0RW5rdHB2Mk5DUDNQOUN3eFYyZnVvQndzTUZaVkdSeGg1QkkxeXNseXRv?=
 =?utf-8?B?WTZSaWZIM3hWQjlRMHRCSllBcHpETnpvSEsreFJFQjBUdlV6bjZOZDdsSDdh?=
 =?utf-8?B?aHdySEQvb2tuOFhUUXM1TVVzYWJHV240dkhUcmdRZXJROFpYMUpsNW9QeWJQ?=
 =?utf-8?B?MW16Lzd6b3hUZGpuR3NScVJUZWNCNExoYWIxRmR6TTNlVTY1bmlsbW1KbXVH?=
 =?utf-8?B?Yk1yMUVqMkNSVWt0RHNmc2x4a051WTA0UjFvaWhZWnJxZkdLbFpuNUl4dkhT?=
 =?utf-8?B?ZTJsMHM1OUdycmp0MnFMeWJFZXB5Y2RRcU1kV1BRTFVLakpHZ2FwMkVNQkhW?=
 =?utf-8?B?UGtoY3V3eU85K0pERDUvSGtyN1pIQzdvajRDVmJKYXh0cGJHYkV0eTM5VFVC?=
 =?utf-8?B?WG02YlNvNmIxQkJVeTlmMDNuM1NseHRxMmpCcEFtRVlTL1VEWG5yYnJEaDE1?=
 =?utf-8?B?K01SQ3l4cHN5NmJKK1l0ZW55dkVramQ4WndobWNKNFVWRC9RTWV5YktiWVpq?=
 =?utf-8?B?Y2VJNk9sdEtyWXo0aGQ3MlZZSXpRWWptZ211WXI3YkxYcTBZT2xta2J2RlFZ?=
 =?utf-8?B?WWtxeVo2NG96SW5HS2JHMTR0N3hvQ3JxUURNNGpTdkw0ZDhidFpidWJBelpD?=
 =?utf-8?B?Z3dUVVNYZXRCaGNLTk5jVXJZQ2R6UzROSDAwcHg2Z3BBNGFMcXlmcHFUSzhK?=
 =?utf-8?B?RlFldjFUYjRER29YQm9TQkNicEJmeEl2bGJGVWZKUHhXbmM4TS9xSk9MNldZ?=
 =?utf-8?B?Y0haYStMdDVja0RBVHgyNWh6RWRQUUpqQXJLWUR4ZGRQTnhmelJERlVJdWZK?=
 =?utf-8?B?bXJnNFNKTVdjTkhLS0JMRjZCM2wySEhXWHhCT1NmNktHcG5NdUh6ZTV2d2VX?=
 =?utf-8?B?Q3A1ZW9FNCtMTWRIYW5OcGNUZGN4ZlBZYWJXUkNFS2lxb3hQT3VnNEN6VEIr?=
 =?utf-8?B?U29WWEZFQ3Rvdk1RNUpxdDRIM2lxVDhpVXBHQ1FQMEphVThwTkx2K1J3bnZY?=
 =?utf-8?B?d3ByUUMvUU9hQit4S3UySm14d01PMVZteXE5MERhd0VZa0lKeEJQdFdGQkxL?=
 =?utf-8?B?R2FacGJsYnk3ZFV0Sk16RWxrOUc4UC9FNHhGcURuR3FHMTU0QXJGcmZ2cXh6?=
 =?utf-8?B?Q1NScUQrVjZERVhHSnh2UE5VZmdTaExhYmhVWFZ2enVmaE1SQ3hDNkNEUVNs?=
 =?utf-8?B?ZjljZmtpaUZYZEIwTzdseGN3Y2lUZVEyMUpFeVh6a281NExwWTJxSHo5RnNk?=
 =?utf-8?B?RHJUeEVra1BHQVlkYkh3RGMzaFgrYWN6SnlxNzdtVjRHVXpmT2hFVFhhRWtz?=
 =?utf-8?B?RFhRalNrV09WVVNTVjF3bmtLUEd6L3djMGo4emkwNzc0ZkZkRzJleExrK1Rh?=
 =?utf-8?B?ZEExNjkrNTYyc1F2Y2hCcGhlZnIwVzRWNDlSMVZrSkh2dEc3a0JqSTNLTmtN?=
 =?utf-8?B?dHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd554d14-029c-44fc-2095-08de1c7d99ae
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:11:30.9847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HWrSChdCCVYUopM5LB5KOZNlDDfD8XmhmEb3+1tkMZ902nRi7XN8X4XgTCjfIsAgdOqFZRrfFudCX6s0BPzZxckYxYSqJUVcgzDGLls84gc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8123
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

The size is normally used to make a decision on when to stop the device
(mainly when it's in a pre_copy state).

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 21 +++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  2 ++
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      | 28 +++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 30 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.h    |  1 +
 5 files changed, 82 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index c492677db28d9..0f56dbc04865d 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -395,6 +395,27 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
 }
 #endif /* CONFIG_DEBUG_FS */
 
+/**
+ * xe_gt_sriov_pf_migration_size() - Total size of migration data from all components within a GT.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function is for PF only.
+ *
+ * Return: total migration data size in bytes or a negative error code on failure.
+ */
+ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
+{
+	ssize_t total = 0;
+
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	/* Nothing to query yet - will be updated once per-GT migration data types are added */
+	return total;
+}
+
 /**
  * xe_gt_sriov_pf_migration_ring_empty() - Check if a migration ring is empty.
  * @gt: the &xe_gt
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index b4c7b5dc9e914..3ad3c3609b415 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -15,6 +15,8 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
 int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
 
+ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
+
 bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid);
 bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid);
 void xe_gt_sriov_pf_migration_ring_free(struct xe_gt *gt, unsigned int vfid);
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
index 4ca86ff4b7dae..00fe73bd86dfe 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
@@ -254,6 +254,33 @@ static const struct file_operations data_vf_fops = {
 	.llseek		= default_llseek,
 };
 
+static ssize_t size_read(struct file *file, char __user *ubuf, size_t count, loff_t *ppos)
+{
+	struct dentry *dent = file_dentry(file)->d_parent;
+	struct xe_device *xe = extract_xe(dent);
+	unsigned int vfid = extract_vfid(dent);
+	char buf[21];
+	ssize_t ret;
+	int len;
+
+	xe_pm_runtime_get(xe);
+	ret = xe_sriov_pf_migration_size(xe, vfid);
+	xe_pm_runtime_put(xe);
+	if (ret < 0)
+		return ret;
+
+	len = scnprintf(buf, sizeof(buf), "%zd\n", ret);
+
+	return simple_read_from_buffer(ubuf, count, ppos, buf, len);
+}
+
+static const struct file_operations size_vf_fops = {
+	.owner		= THIS_MODULE,
+	.open		= simple_open,
+	.read		= size_read,
+	.llseek		= default_llseek,
+};
+
 static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
 {
 	debugfs_create_file("pause", 0200, vfdent, xe, &pause_vf_fops);
@@ -263,6 +290,7 @@ static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
 	debugfs_create_file("save", 0600, vfdent, xe, &save_vf_fops);
 	debugfs_create_file("restore", 0600, vfdent, xe, &restore_vf_fops);
 	debugfs_create_file("migration_data", 0600, vfdent, xe, &data_vf_fops);
+	debugfs_create_file("migration_size", 0400, vfdent, xe, &size_vf_fops);
 }
 
 static void pf_populate_with_tiles(struct xe_device *xe, struct dentry *dent, unsigned int vfid)
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
index 54a2c0f9d5933..30bda27b0b2ab 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
@@ -309,3 +309,33 @@ ssize_t xe_sriov_pf_migration_write(struct xe_device *xe, unsigned int vfid,
 
 	return produced;
 }
+
+/**
+ * xe_sriov_pf_migration_size() - Total size of migration data from all components within a device
+ * @xe: the &xe_device
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function is for PF only.
+ *
+ * Return: total migration data size in bytes or a negative error code on failure.
+ */
+ssize_t xe_sriov_pf_migration_size(struct xe_device *xe, unsigned int vfid)
+{
+	size_t size = 0;
+	struct xe_gt *gt;
+	ssize_t ret;
+	u8 gt_id;
+
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, vfid);
+
+	for_each_gt(gt, xe, gt_id) {
+		ret = xe_gt_sriov_pf_migration_size(gt, vfid);
+		if (ret < 0)
+			return ret;
+
+		size += ret;
+	}
+
+	return size;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
index dbf8094900df8..b806298a0bb62 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
@@ -18,6 +18,7 @@ int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfi
 					  struct xe_sriov_packet *data);
 struct xe_sriov_packet *
 xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid);
+ssize_t xe_sriov_pf_migration_size(struct xe_device *xe, unsigned int vfid);
 wait_queue_head_t *xe_sriov_pf_migration_waitqueue(struct xe_device *xe, unsigned int vfid);
 
 ssize_t xe_sriov_pf_migration_read(struct xe_device *xe, unsigned int vfid,
-- 
2.51.2

