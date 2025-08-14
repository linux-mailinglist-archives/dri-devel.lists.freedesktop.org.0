Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3A0B26C54
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 18:17:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E725210E8B2;
	Thu, 14 Aug 2025 16:17:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e/AyrWVT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D8C10E8B2;
 Thu, 14 Aug 2025 16:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755188267; x=1786724267;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=EgZ0s9WBvu/elgo15YRZkcnJQRxEcYzhh1O3n5IU55w=;
 b=e/AyrWVTL7mlJPcVMp9/wZE84crA6Dq7mrTQR7ELKxpvHwT1LMvqzUPP
 4faAS6rUJCYumSyHkmsFHjxnj1suIjX0o82FhtF63NzMBqRFKjxID/WpY
 4AlpIqlY+RoSPF9p5oYwYIT9/lD6nAG+QaRYhnJTTP9xOHhU6UwGCW1TU
 prTAhQ12lBWeYbmQzwbctosJ4MbcAJx61+yENtHRqtuDmXmwtnSQq77PL
 LXQfla1MYZBJueRkDbgWOPzA4n4hB5hNNYRycMZur7dEIHJlJYyb63N2B
 PHgEZ+z9FyIcHqo+COwhTH6D8/AO29CM3TYlIQj1jNrLRd9zkXi4HqLfO w==;
X-CSE-ConnectionGUID: x0UOS5qIQY+zgchYJDjciA==
X-CSE-MsgGUID: TErKtIP8Sd26k11ZPvKw7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="75081116"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="75081116"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 09:17:46 -0700
X-CSE-ConnectionGUID: N44sSaDkQxeKVUKwFLxCqQ==
X-CSE-MsgGUID: 9XfPgHCrQYmpSGNnzrVpvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="203980581"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 09:17:46 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 09:17:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 14 Aug 2025 09:17:45 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.56)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 09:17:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TjJxyPSDR/YijNf4wIEEQlqRH3NneX4w0L1nXe4qUu+rmmz3tNddOo+6Ekbrxca88IicH3EE2YQU6PJHFD6y/tO49sPwjRWKV5i1ypbhK3crY9mxBCPPey8+1V1HUkcdJFFMTutMDP7Tmw/iYhxH1tFWfnIS4PpE5iM9cX2UHVZDoRxaUrS6swPGnd0mFcK0hZXPcvVeb7unEy2fO77Fq/aEeqdqn0tbazeIb7+CMDohvPpkwCuKhvrvJOE19kfGdpAYPb9kMBW9EDPNrW8q+otzA89Cz4ZEPsK6+PACqEcKzKPOeigix8GaDpoLCu7Ou0UoQPWm65PU5fk/h9WN6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=82V0cZ8KTLyfKAgOwPiEYE9OgV1TFFDvvWvS+vf03pQ=;
 b=Y2hKyZwY/8OqHjGX7vxR73bnHzCmrOhDAtgPTHS+OTxqV6n7sGfad71Bq8Y8Byx2c0MyBOgl38xJBfBomRyHx+aqpPkdvwA4mgO1GKcVYUeXadbZc8Q+cwNzRqOevhbS/yGmlr8XY+Um27pl8kRe4r/YHd7eF6XQeI/WmVksFkwi3eWv/d47qJRgDDMcA/ctsrdogBn7IL/dCH6OXHEa9bn3AoHpdFWMvcPKv0erLawSMvFGx6oExe/TMLcfumi6LmtbGnkqI1ZNU2aYd3NJb5bfSO21ToFbvepT2F5y7WJOKA0wJsgnrYUkxp8Xwj7I+xOeRNKnkYAKTGOJkZjn5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB8551.namprd11.prod.outlook.com (2603:10b6:510:30d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Thu, 14 Aug
 2025 16:17:43 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 16:17:43 +0000
Date: Thu, 14 Aug 2025 12:17:37 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-fixes
Message-ID: <aJ4MIZQurSo0uNxn@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0123.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::8) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB8551:EE_
X-MS-Office365-Filtering-Correlation-Id: 92d4a236-d50b-44ca-6d9e-08dddb4e1904
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUd2TU9SQm12SHV3Q2lKbkhRcm1sZUx4SytOdGxWNnJLRHBtS2F2dTZKdlZh?=
 =?utf-8?B?SThoTHZMQTF0aXlZVzA5MlhrZitPQW9HeUFhcUZWU0VXNFovSTBaeVZ1bEhT?=
 =?utf-8?B?allVWUhTTjc5TXppOW5DVkxLZXV4WnVaekVqem1Ha015cnJGdVdtTHpsWWYx?=
 =?utf-8?B?NDBPZDhiY0VZYTU5MCtDR3ZWcnlvdkZ0STdUV0tta0lyT3BsR3RWQmF0Z3J2?=
 =?utf-8?B?aFhQcFp5RTA0SlpKK3BMWmRtOXVFRFhhWjlWU1VJeDNWLytIUTZwS1hPcDlJ?=
 =?utf-8?B?MmNObmJTQytFaVhQVVdacFVXRzNORWtoQW1FTHJMSWw5cDN5cTBwZjhqUHJx?=
 =?utf-8?B?azNtN2FYSnRBUFMvbElTbmY3SnpEZWlJMEFhKzV6TjlCTEEwTkZKcTNZWU1H?=
 =?utf-8?B?MDN1Y2FJdWw1dm04UkhRSmoxeXZOWHAyeExMd0RNOWpXQkxIdzRvSEgyeWY1?=
 =?utf-8?B?REI5cjJRYjdGWmpUVHVkdzNxbnFBRzQxUk4xZlIvbVlLYWFselE2ckxTNkFr?=
 =?utf-8?B?QnFMVGpXL1VVOEVudTFJV3lVci8rS1QrUkhRM01RVWRETmFNT2dBWDZiYXQy?=
 =?utf-8?B?cHFsUk5yL1dubGkwNFNnWUd3d1Zyc281SFU1Q2FuRUd6Zk1yUjA0L0JCd2lI?=
 =?utf-8?B?MHpJcng3RjhZRGNGNVEvMTl6MmdSYnQxTTdQT0tudVBnSmg5QnhZR1o4T3dO?=
 =?utf-8?B?Ry9RWi92RGN0bTBIR3BuZUxwVHZ4VzlCc0tZVk1SS21ROGxJYVpZRVhVTCsz?=
 =?utf-8?B?WXlZVWdGWTlFMC81clVJSy9kUXlINnRwb2FBVm9KYm00NHVSdGgreWM2NEVU?=
 =?utf-8?B?R01PbER1bE1BSEZXU3UwaFhkTW5rS3lQOWJpblR4QXV0Y0QrQzJ5N04vOWZK?=
 =?utf-8?B?Q1hRTUJGbFAyUTlrcDJSeGM0bDBCSmNvb2JkS2llbEdId1pJUk9VdU9rQnkz?=
 =?utf-8?B?S3hKUjIybzVuaTcxMWwrZGhoMS9FeFJubTUyRTRoYVc2WFdxSk9URzZ2ZTFr?=
 =?utf-8?B?SFpsSUxTeWdGTVI3ei9rN2UwYmRuVk9xeVlnUnZlbkhKbUFPNUFQaVo3ZHk1?=
 =?utf-8?B?WjBvUUxENnZ2K3NvV1RILzJ2ZWxHUkQ4VVdRbUNTUGxtWGptMzZHcEJqSlBK?=
 =?utf-8?B?UHFsSXBZS25pMmxqNnE0d3hqVnZSRG5ZQWhEVGlMRmFOTEV6TmpFazZuNStG?=
 =?utf-8?B?dmVKYU5xZU91Z1hETXJpY0tvaWh0L09rdS9raUwwUlJKS2dDZjdBbW9vR2NE?=
 =?utf-8?B?Q1ZVc3dKYW0wT0hYdkswaTlNMWwwRUp4cGMrUlRxc2JwaTVBbm44OVM5MGZT?=
 =?utf-8?B?TjZmbVFsaXdFVWIxbzMyUTZUUE4zN3lVNE1pWjBjU05sZWFDV294b0QzWEZa?=
 =?utf-8?B?Z25aaEdYWTV2b09laHFxdzJhd3lUK1gwQUhrZURteVMwSEtzc0NFUnZ2SVBl?=
 =?utf-8?B?N29XRTE1TW9VNmlteTFGRFhQS24raENwUlVrM0hOTnpobjdRM3k3Z0dkL1Fo?=
 =?utf-8?B?Zy92OTdraVprSkgxVUxZejh5THlEbUVRbzlRT2REeTlLYnpkcVNZc0Q5Nkhq?=
 =?utf-8?B?Nk9zdU1hSEYwTzBJWCtmamp2RHJ1cExycWR3cU4raCtIUEpQMDFIL1FLTUpT?=
 =?utf-8?B?QzRPMUIzK3lxdTBubTl2YU5ZR2RtaTVqTzdlelFab3BOc3dpYUZQVDh3UW10?=
 =?utf-8?B?ZHUyY25ta1BIaTdUV1JoR2p3dGVSSWNaWThoY3hSTW03aVFBSVZLd0hFSUJh?=
 =?utf-8?B?dFRoNnNrUVpJVGdremRVL2d3eVZhcm9MMGlhb1hCVjhUVWFCUWVHQ1pEbFZC?=
 =?utf-8?Q?0cFKXHBrncQt0xgOjZbpFCAmYXOd6pOv4ogXM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVV6ZGIvUlpDcVNHZ0dhS2Y4WDgvYjZIN28yVStrZWhtSDlRQkE1bG83NnpM?=
 =?utf-8?B?VHJtNXNmQ1JrTUdERkZQZHZlakVldnFnZ0hPN1lnWjZyNXFYUUY4L096VEhS?=
 =?utf-8?B?aWJocVUvZnVoYjU0TFJTL2t5ZHNZaExLQzBpRXNFN0VUbkR2TjZFamNtbXdp?=
 =?utf-8?B?MXB3d3dnZGpveXdta1paYm1vVjBDY3c2cDluWEJTdElZeWp3alRjdk5rOFpp?=
 =?utf-8?B?MjhqSkhTVDU4cmFDOGFwZnJFbFdiZjBDbHpJak1NSHRSdXFRdGM1ZHB4STRv?=
 =?utf-8?B?ZUNuZ1VoNEpVRGlLK1BEVjdOZk9JQi94VHpYeWtuQTJIcEcrSEtiWU9YTDQr?=
 =?utf-8?B?Nkhyd01GTEhxejIvSW11K2NwZUtMYnQyVnhoVXhHQnY4MG9DTkNWOFV2dDRT?=
 =?utf-8?B?L0F0alo2cGlFNXBORXRTeFI5ZUkxZ1RFdHNjS0pTczlKVmtXUjZSSmZIYlZy?=
 =?utf-8?B?NzJQeXRWVUpzbmJMQ2VCam5IeURLY29pdDlxVVkyamh6Z3ErQ293V3YrUHdO?=
 =?utf-8?B?ckd1RjNESlREUDczQ214cjB2RlJQOXJENHpEUG9NeWtmSXRaL21WaTZFWVhp?=
 =?utf-8?B?elZ6NHpBR0hrVWFKY2JkMk5lMU5CR09jNGRUNStLRUR1a1JWTlJ0TGFzRG1H?=
 =?utf-8?B?cGkwM0E0bStob3R5VUFHT0dnWXJrRlRTRUxicmpSK1RyVFlyQ3V6VWFGbXcw?=
 =?utf-8?B?L1pQMTFsT0NrOWRpcHlZM0gxNDNWc2ZVK1lqNytuNklMdGRZdjlCZHQ4cmlS?=
 =?utf-8?B?dHZuck1VbE1pNGQ5dmFpMzJ2WVNYSGpkTlF3S1ArNzdZZmRudkUyLytNekhW?=
 =?utf-8?B?V0pGcnZ6aG9qRm1HUG1WQmRweENTMEpEOTFuSmV0Q29vVEtxMFZQcnUrRWhR?=
 =?utf-8?B?Q3ZxTko1TzU4Rk5kN2FLQU5XZ2I0N2JVbUFHMkFVMUJoWkFhRjBaSXhXOEZx?=
 =?utf-8?B?MnF6Q0xCYWZlelZ2QmlPYmpjQTBQemxleldvYkdMaFI0eXFuWjhaKzZmTk9p?=
 =?utf-8?B?RHo5bTEvY1RSUGpnSnVaSldra3QwQkppS3o2N2lWS2hCRU5TczhMWEp1UFVB?=
 =?utf-8?B?Q3ZEQi9NbGgzVnQxbUNIS2Q5a2xUZ3dyaEFKWDlEdW04YkxHRXdMQmJDRzFQ?=
 =?utf-8?B?QmE1MjRQVEpraUJQdFRGRTY5YUw1Z0JQSEs1S25aU1VCZXFtY0t6R0Y5SjZo?=
 =?utf-8?B?L00xYUVtdU9SUmVYbmUzcnp6NTBHYzQyZEE2UWhuSm45U21CNnNMd0EwZk12?=
 =?utf-8?B?bkV6QmNDRWovVkJzRnV5R2pCNDU3THF4d056eUx4bjIxY0hKWWZqVldxT0N3?=
 =?utf-8?B?Vlk1aXFqRGVwWjVBeHBCbHB1bXVIYnFuR2JwN1dPVkhSUzJJZ1ZMTlJtZHp4?=
 =?utf-8?B?eElJVVptT0daWlpsRUIwck96azlza0t5RjlnM2c4ZE91akZGMWxLLzkxZkFo?=
 =?utf-8?B?cGE0V3c4VFJyMEtqajlGUlJqcTBjSTZ1WVVoUUxGMTlVV0xDbmN6L1diUElL?=
 =?utf-8?B?VWtSQjZ3aXFtdDdjcXczOUpNRzVYbmtURjRtcURHUmFSZ3d6TGNUVFhZYkVa?=
 =?utf-8?B?K1FCa2dUYVV0TlNKL2RHejNXVlpDcUxYcUJxVWpmczZ6UTllZDlMZktCRjEy?=
 =?utf-8?B?ZmRETVdvd09yWS9VQ0VIMW1TSHJvT0xUa1FUOEVZQXJxOEExMVJSOFRSRnZq?=
 =?utf-8?B?SlIrczNmMlFzR2N4TEZndjFFVlAxZ0lPK0RzRUs3anBRL0tLYytlVFNwM2Na?=
 =?utf-8?B?anVGc21JaWlETytmS3JHM3U5a2I3dG1ZT3d0Wkh2RzhqUkpIZWl0T3c5UjJ5?=
 =?utf-8?B?RUdMNUppanNXSkRMZ2dxYXUwOVlqSEdVenZ0Y3JqMktqcElLUG50S3VVNVF2?=
 =?utf-8?B?M1Z0bmtIVEJNM0ZXVkhGUEZ6YTE4TWZpK0IrbU84ZkIxalNHVm9iczVyZmJI?=
 =?utf-8?B?VkRBcnlpdUUya2xnOFNMZUxUNEI3ZVJkNTFzdGdhbUZQQUc5M0l0ODdwbE50?=
 =?utf-8?B?RUNpOGw5K3V4U1Zkcm91RmNJZ1lWNHJhN2xCWVA3QjdCanprakZ6aStSeHMr?=
 =?utf-8?B?KzY3a2xBK2JmWEpEOXdLUzNzOTloM0w2Y1BmanVJZkJDbnlETjJrWHBhWURW?=
 =?utf-8?Q?W0Uy9SCSLZLySusSUScWhj7H3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d4a236-d50b-44ca-6d9e-08dddb4e1904
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 16:17:43.3408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d17lnXyu0ZYZwOQdbtEEhio9ZdlOB+9f7HqkhfeQIwfWqHM4eyhdnVTpkqyYv1Zdmvv0MsGmWrvNKpO6uMOeIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8551
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

Hi Dave and Sima,

Here goes our first round for 6.17 fixes.

The SRIOV setting for VF LMEM BAR size is critical and will cause
trouble for people using SRIOV if not there. But we couldn't send
it earlier because the dependency on PCI patches that just landed
in the  last merge-window:
https://lore.kernel.org/intel-xe/20250702093522.518099-1-michal.winiarski@intel.com/ 

I hope it is okay.

Other than that, there's a series of xe_migrate_access_memory fixes,
a xe_bo_validate slowness fix targeting stable (v6.15+) and an hwmon
max cap fix.

Thanks,
Rodrigo.

drm-xe-fixes-2025-08-14:
- Some more xe_migrate_access_memory fixes (Auld)
- Defer buffer object shrinker write-backs and GPU waits (Thomas)
- HWMON fix for clamping limits (Karthik)
- SRIOV-PF: Set VF LMEM BAR size (Michal)
The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2025-08-14

for you to fetch changes up to 94eae6ee4c2df2031bca586405e9ec36e0b9ccf8:

  drm/xe/pf: Set VF LMEM BAR size (2025-08-14 10:30:53 -0400)

----------------------------------------------------------------
- Some more xe_migrate_access_memory fixes (Auld)
- Defer buffer object shrinker write-backs and GPU waits (Thomas)
- HWMON fix for clamping limits (Karthik)
- SRIOV-PF: Set VF LMEM BAR size (Michal)

----------------------------------------------------------------
Karthik Poosa (1):
      drm/xe/hwmon: Add SW clamp for power limits writes

Matthew Auld (3):
      drm/xe/migrate: prevent infinite recursion
      drm/xe/migrate: don't overflow max copy size
      drm/xe/migrate: prevent potential UAF

Michał Winiarski (1):
      drm/xe/pf: Set VF LMEM BAR size

Thomas Hellström (1):
      drm/xe: Defer buffer object shrinker write-backs and GPU waits

 drivers/gpu/drm/xe/regs/xe_bars.h |  1 +
 drivers/gpu/drm/xe/xe_hwmon.c     | 29 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_migrate.c   | 42 ++++++++++++++++++++------------
 drivers/gpu/drm/xe/xe_pci_sriov.c | 22 +++++++++++++++++
 drivers/gpu/drm/xe/xe_shrinker.c  | 51 ++++++++++++++++++++++++++++++++++++---
 5 files changed, 126 insertions(+), 19 deletions(-)
