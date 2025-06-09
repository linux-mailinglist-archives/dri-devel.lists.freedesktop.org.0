Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC925AD1E34
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 14:56:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 678FC10E2C5;
	Mon,  9 Jun 2025 12:56:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RUvWpQj9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 786D68902A;
 Mon,  9 Jun 2025 12:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749473766; x=1781009766;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=RwqqVeulglohGpkrOL8cxv8Rv3bhju6tAghF85Sb7rA=;
 b=RUvWpQj9O+9PmMgzrgatEI7LQaX0qkdMqqD0ROz6HO0H/1takZyrBqib
 O4dZnLXlN3248lV7kyDSu4N2e0O/kwHKVtl6H6861H2Nr5glY7S9OeNTQ
 nqPDYNhHYz8j5KSQLzWDcvaedM4+5SwHheiKqs0B7kSurqG02DfxlWtOh
 TKXO4k5m8Yu7ZXLnCS+t+ZifvC8FRICq+eQXgyRkNlzhJiqbuEKS403OB
 CVdrva1QRNiUAaUipqt5Jk+hOxVgDmVgKQXCA3P6zL3JK6uuClyb3c0nM
 RspHh5y2mQJFTH0NS2Mou+tg6D5xnfZyPw2fI75QyNGwnnOHX1PNXA3J2 w==;
X-CSE-ConnectionGUID: YqnecHk/Qwy3CVjMm1XgwA==
X-CSE-MsgGUID: uT9/b6EzTcKYXpd5yw5I7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51406728"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="51406728"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 05:56:06 -0700
X-CSE-ConnectionGUID: OPTpBRYLRni2SLk27eoRLg==
X-CSE-MsgGUID: rIuAeXcmQxm0ukkCLhiSeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="146435109"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 05:56:06 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 05:56:06 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 05:56:06 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.44) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 05:56:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S9/pQirttj658LUV7nqkCxGswicoFRCiJll/DgKOZhhrxePfBJAo7w55T94kUzKF/dNTnZcgWfGMpfcx1w9EqJaOYYFUjbZbhlxVxv39kYhSnud6YV4125guBowOu9b5GzTrpTGcZWkgwxLFisf1v/1ykQbVZGa5ziKKYZ8N3yQAunshFtedQQJUE0rTWNqZVtshS77AokEvJnKy8GCq8o8KC5vT7+bzincw/UJsbtAFg+A9CLEYbdi6lvmkn79EM0EzrnxgBVDkwCLSctYNwNV4LA/H9tZ5ebAy1OZmNrUkTMOmGHnmqZa+VQHMaZllgLcssQ8AMZKdwBjPOCNhiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6aaX3DwbpPeR/o5VOq9/42tWwQo1138tElE1h3drcE=;
 b=Xtj6uSAp0+3JKLmOv3JgsdJ/y0bJ1fLfah1yAF8GDt+lH36coJ0cfH8bv2spGTMSUOofOSNU/hQwEcVk6wYThzbbT30f6uTjLCWXRKpInVnxVYZoIE/TrF0TOkgucTiLhYdcIlfpkYiXd+dQvviXbsfu68p8Zjf7EKIW+Lyq9duzAwEhSswT96dU/s5tnVh6bJIdtHfxEsZFe5289z4MilXr/6nI6l+TV/NlggWFwjmqAgQRkIxWI+5875V/a19l/yX/eGLFyJmcmV+7nH0nQhK3wEjAjHgTkhUIB2j+UKwz1qxuVNNBvCUOoZ6afOvnK6NIEHIqs6spJzy3lk6JyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Mon, 9 Jun
 2025 12:56:03 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%2]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 12:56:03 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
CC: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH v4 5/5] drm/i915/dp: Disable the AUX DPCD probe quirk if it's
 not required
Date: Mon, 9 Jun 2025 15:55:56 +0300
Message-ID: <20250609125556.109538-2-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20250605082850.65136-6-imre.deak@intel.com>
References: <20250605082850.65136-6-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU7P191CA0026.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::6) To PH0PR11MB4840.namprd11.prod.outlook.com
 (2603:10b6:510:43::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|IA1PR11MB6467:EE_
X-MS-Office365-Filtering-Correlation-Id: 481bfbd6-5aec-4afc-8173-08dda754fdc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YytHenU0Y2t1RUI5QWtYNWswRGp3QXJmbERtN2ZxbFdYWWdxRk1BcjBsWGdj?=
 =?utf-8?B?bXRmYXV5RU1rbjFWYzZ2VU5lZTRxZ1lMTjZJem41eXdFUGJGRlpkR25GVDRa?=
 =?utf-8?B?QXR6LzBma2JmN21KaHp6NHFYSWpRZU02NWhNeDhyT0NnNzBuR25jT2MzWC84?=
 =?utf-8?B?QVBXOGFmQmFjcmhib3JpRGJwMWdSa0FVdFBVQU16Vm5KMG50bXZ6b21LWEVR?=
 =?utf-8?B?UU91ZzNUOWlEajF5a0FjRjYxb0N0YmlIaGtwZTdpaEdIUzZndUxQNHlEeitS?=
 =?utf-8?B?TUFlMnFEdUg1TDA1bVkwNDg1SEpESG9EcGRrZEVDZmNvVTRTVndZNSt5dHp4?=
 =?utf-8?B?YkV1TkswU0l6Y0QvTEc1QVUrbzRVMjFoTnRrMjNhOGZ6TzdoRzRyVXZhRkVW?=
 =?utf-8?B?b2dSWFpLcUFPWStvQ1VUTkhOcE10UW5oVUlSdjVUZVc0Z3FSYWNwL0QwT2U4?=
 =?utf-8?B?bURwVHRqcm1qc3p0eUFXc2JzYldzUHpFYm1rL0ZvWHJZTFRpbmh2TEVpc05X?=
 =?utf-8?B?U0V0cWo0WWNMSUxvYjVwUXo1R0ljbVp4UkRjZHB4QnN6V1VMWkxHOHVDSTNz?=
 =?utf-8?B?R2dFQjllbXZDU0hyUzJPRHUwZ2RBcUJlbDNlZ1BSeHZDNnBidEFtT3dVTzZE?=
 =?utf-8?B?MXp3aHRqb1F1TTBqbEdUOFl2MEIzN2cxWG9pODRrVnRlNEpadVdOQzhCM3k3?=
 =?utf-8?B?SmpYcUhNTXZKUDhBcUFzZ3pLcWpMMllVdTBHcTVQaHZqUmFBeWI0Q3pnVUxw?=
 =?utf-8?B?Y1VWK0R5amVYMjZJQnltcHE5YlJQeGd5dk52UEk2VUJHUk9DWlhvWGNCMXQv?=
 =?utf-8?B?b09Xc1c0WGdXZUFRQUcwZVk0WFdUbENHM1NubkhHcmFsNFVWRkh5bmVGOWVo?=
 =?utf-8?B?Mkp1bjJhZFFtblU3bzVpRXp4cnFXVmxQUW4rRE84UTU3UkJHa2xMMDh6a09G?=
 =?utf-8?B?RE1vQ295Y1hkVjc4cDNYbVNEQm1oTWJHVFRWZk96d0g5UlFYVHhSZlRSa2V3?=
 =?utf-8?B?TWlCTEFoOWNVcjBwb2E3c00xWHM5TVhaWVFXbGZaN2FjbkhOMEpDMkV5YjdT?=
 =?utf-8?B?T08rL04yOGdLY2pOeXd4YUZFbld2ZWkvSUN5R1FXcW45bVcrVllLQWZHOXZE?=
 =?utf-8?B?TVlrY3lvQUg2NnUrY2xNcG44QjRlMkdlQlBmdC9sektsTG9KSStCMy9LbFJV?=
 =?utf-8?B?dUlFVTFCTzAwZjgrZnUvUGRoSnVhTzc3d3JES1JQN2E0UEF0dmhYdW9tMVZy?=
 =?utf-8?B?Vk9vTllybHk4Rkxjcnc0ditKVU9jZGtod2ErTUVxMTRaa25EV2VycHpxcWlx?=
 =?utf-8?B?ZzF4d0FmZlZoaHdMVTk1OFAvKzVNN2FkdmFBOHF3SUZQa3BENzI4NkxzRERo?=
 =?utf-8?B?eVh6a0d1dEEzczFkcENwRUptcVNCRWZwTnd1KzJZRVMraC9PZkVLVE5TOTRi?=
 =?utf-8?B?SElReFNwVTVYNjE5Z1dTSU9zb2hrVUxJZlM3MFNpYTQ2RkhSMWJzZjZmb1lr?=
 =?utf-8?B?WngrTXFLSkQ4QnNuZTN6Q0RWOC9DVm0yNFBJY2p3aXNPR3VhWllzY0Vkcjkz?=
 =?utf-8?B?TWxnVzRFWk5GT0ppTHpIbkN4L2ViTDQvTzN0N0VUYmNKOFFEakJ2M1RsUUsw?=
 =?utf-8?B?Vk9FOVVqTngwMmFNVUVtOXNZdURaSlpDRk10MHpKYldveUtydUdoc3k5c3lh?=
 =?utf-8?B?dk96bEs3Zk1RQ1NXTjRhQkFxYlZhdjdMOHR3SGtsbUlhWW1QdXpiaW1VOUxM?=
 =?utf-8?B?RGpIS3RMdmowOGpPV1plTnRFM1BQMnFnNFJ6K3hqTHhqS21XTk5UWG9reUY5?=
 =?utf-8?B?clJyTG4wOVdWMEgwQUNCaWdSNE0vT3ZqRmN3OTB1cSs3Vm9zeVkyQk5ua2pZ?=
 =?utf-8?B?d0QvNlRCVmpYZ1BRbmRvaGpnVW1TZFBkVnZUdUc0d0E4UUQwV0d1MkZ3SXd2?=
 =?utf-8?Q?q9DZMxCEupg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjhISC96YmlNTjhFaVc2cUpUYU5tUnUrcmk4QmN2OXV1MDZNdmwwUnIxRVlR?=
 =?utf-8?B?L1ZJaFlna04yYk45THVxVHBoYW1vZVk2bVhmbGZpUVRhSjRQSFp4S0hsRjY1?=
 =?utf-8?B?UlJPdkNieTBYRXA0WmcvMHFkVzJlbFdnODJ5RnlOZGhnWDZ2S1VGVGNDVzl2?=
 =?utf-8?B?MURXQXRBc3l0SnJnUXJ6YWNoM1VwZUlkUFpoK3dITXA2VTEyWTVodlIyZU1h?=
 =?utf-8?B?Zks4bm05QkVsRGlyUHc0MEx3Y1JjL3p6Z01paXNqOU8vdFBlQi9ZL2hSQzFG?=
 =?utf-8?B?aHRBUUlxWjBHYjd2SFlqYXY0Ym5aRUhUSE5BUjBpa2pqcXlBZ0tJeHF1STlY?=
 =?utf-8?B?UVh0Yzc1d00wbEovQXhUMlRkT3owck1CalY1dGFWQldaaFVHbHlWYTlnRHdn?=
 =?utf-8?B?QUJ5b3dUS1R0b3hFMUc1NWNRSVpzL0c3TG9OZU1JYjZTWUkwbEpmQ0h4ZHNX?=
 =?utf-8?B?bVdJQlA1L2w2KzRmSWYxRkZDQzJQL3FydlhDUFd2bGhTOWhtMnR0bWY3L3ZB?=
 =?utf-8?B?K0UzWFIrZUdtZy9QQ2ZwSXZubDgvclRhNXRqU1RWNEtkVVZ0VmZyZDNveDFR?=
 =?utf-8?B?V2dJK2VDbERwdHNMekUzaG9xaDYrT1k4NzF4M24zMm54YXJqUmVWd2I4TFQz?=
 =?utf-8?B?and0U29uLzZ6c2NDbXI2YUJ4Y242Unl2cjViUnlJcm5sZlBDS3lGTzh5MWZn?=
 =?utf-8?B?WHdISHhGemg5bW5ucEdvOG9GdTBZclNESUFyblMvenRUMWZaT3B1cVVZNU9E?=
 =?utf-8?B?RXIwLzRNaFkxdDhWallZRVFvYjdqRENBUjNjK0VaK3VhZHVTRzdtTms4QTd4?=
 =?utf-8?B?aTVPZTdxZmpvRXJMNktTbnVlQzBwdkZpYTFsN3hMVmhKM1dDSDhyajZuUW9E?=
 =?utf-8?B?enhNdGk0UGFrL284M1phaWFKSGZwSjZxdnZ1WnZpdFJBUm9JMWQ5bCtyVVhK?=
 =?utf-8?B?bytTcWFTMFNMOGZ4bUJGbmJmdk1jOVJtejlzT0tYcW1obzYvZDcxK0tMM2pG?=
 =?utf-8?B?NTYybUNBeHZnVDV5OGtweWlaVUJOL2pzbEphdy9sRnQ2WjYrRnk4cWpxR0tN?=
 =?utf-8?B?VWEyZHJaOEFiSkx4dldJdFpITzVRc1RicGtNdHVlVDdPTVZmcnJta1ZaSzZ0?=
 =?utf-8?B?M0VFNlFWdnZtUjgrSUh5OUg4bDIrdTFEaDlnaXArdi8xcC9QYmptM3JvZTd2?=
 =?utf-8?B?Z0dMaE8vTWtvNlRDVmdkQURhclRnYUZ2VEVKcHhIUFBWTThPc3NSdU5TcHlr?=
 =?utf-8?B?dzZTZlo3UWdMWlNxUWRBbHhOY25RTHpaMzh6N2JQQm5xR2hzVFdIYnQwaG5o?=
 =?utf-8?B?WlN2OXpwb0dDUXF3NloxRHl3aVcySmRFV2JrMUI4QjVxcXh6NDEzMEE4V1U2?=
 =?utf-8?B?N2U1bEVWRC9GR0xlYSt2SUpVeHA5ZU42OWpva0NxcnNvcnJzUXlGWkVsMnZz?=
 =?utf-8?B?dGF4RndvYlZPVE9rRXE4Wk40d2RqRjh2YTg2OTVEc0lqUXJnTCsvdHQ0T1hz?=
 =?utf-8?B?SmVwTHNta3M5OVBPYmg5M3dUSjJXSXZQZ09ZVUdHY1N3YThvN1BmYXBVTHBB?=
 =?utf-8?B?QmFDQ2trYlBDYm5RRTBIUEpBU1U2b1FEQklabHgxZFpoaU5WWjBjdjRtTGVy?=
 =?utf-8?B?RUNSTFBOUWEyMk1VVXZ4bjNEejdxL1B6SFJPYUd1S1pHTy83c3NIMlVHODhI?=
 =?utf-8?B?ZUlZRmNHQWd0S0NPcFkvdDlCNG9HS2NaTXRqaVFyaVBDdGNxWVVZaGhEaVNj?=
 =?utf-8?B?THV3UDlWYithV1g5dmVmQVJDbUhpTnIvSDVkQXAyaHlMVnVQSk5Ba2pHV2sv?=
 =?utf-8?B?b01CUXF3cW1DSUJGMGNRd3RBTW9wVW9Hdy9zSjdPa0ZIVnhIVmNTU1MwdkJX?=
 =?utf-8?B?dzNudTczaUgwNVFOS1VQeFVzcWt3R2UyREdQMVUzNCtGUVhXWmlqTXFBWHdu?=
 =?utf-8?B?bmtQa2J2bVFFZld5VVNzbTZSK3gzS2tTMTUxYUVwbTVOM05XcUxydlFwZTBF?=
 =?utf-8?B?VmUzMnI5MVRMNTl5YzBRNCtIUXhzTGZqWDdpV0hDdG5lYVM0cy9XOVNSN0xU?=
 =?utf-8?B?OHM1bGs5NkVWQXM3aHlXSkxrTHBJcXdxVVhGck9OZU1YUUh4RU1aOWZSUW1N?=
 =?utf-8?Q?3cJ/EVED4RwNnn7Wt05S6DH7Y?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 481bfbd6-5aec-4afc-8173-08dda754fdc9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4840.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 12:56:03.7217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dXRfqwM/VKV+vHnMjhT5VNLz/60IvvD+Ct/8P5opM6D3ozDvF0U47HbxSfDcHfTKpokqvwq6WCdZvMVU7SW22w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6467
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

Reading DPCD registers has side-effects and some of these can cause a
problem for instance during link training. Based on this it's better to
avoid the probing quirk done before each DPCD register read, limiting
this to the monitor which requires it. The only known problematic
monitor is an external SST sink, so keep the quirk disabled always for
eDP and MST sinks. Reenable the quirk after a hotplug event and after
resuming from a power state without hotplug support, until the
subsequent EDID based detection.

v2: Add a helper for determining the need/setting the probing. (Jani)

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c      | 31 ++++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_dp.h      |  1 +
 drivers/gpu/drm/i915/display/intel_dp_aux.c  |  2 ++
 drivers/gpu/drm/i915/display/intel_hotplug.c |  6 ++++
 4 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 208a953b04a2f..c089036a745fd 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5791,6 +5791,28 @@ intel_dp_detect_sdp_caps(struct intel_dp *intel_dp)
 		drm_dp_as_sdp_supported(&intel_dp->aux, intel_dp->dpcd);
 }
 
+static bool intel_dp_needs_dpcd_probe(struct intel_dp *intel_dp, bool force_on_external)
+{
+	struct intel_connector *connector = intel_dp->attached_connector;
+
+	if (intel_dp_is_edp(intel_dp))
+		return false;
+
+	if (force_on_external)
+		return true;
+
+	if (intel_dp->is_mst)
+		return false;
+
+	return drm_edid_has_quirk(&connector->base, DRM_EDID_QUIRK_DP_DPCD_PROBE);
+}
+
+void intel_dp_dpcd_set_probe(struct intel_dp *intel_dp, bool force_on_external)
+{
+	drm_dp_dpcd_set_probe(&intel_dp->aux,
+			      intel_dp_needs_dpcd_probe(intel_dp, force_on_external));
+}
+
 static int
 intel_dp_detect(struct drm_connector *_connector,
 		struct drm_modeset_acquire_ctx *ctx,
@@ -5919,6 +5941,8 @@ intel_dp_detect(struct drm_connector *_connector,
 	if (status != connector_status_connected && !intel_dp->is_mst)
 		intel_dp_unset_edid(intel_dp);
 
+	intel_dp_dpcd_set_probe(intel_dp, false);
+
 	if (!intel_dp_is_edp(intel_dp))
 		drm_dp_set_subconnector_property(&connector->base,
 						 status,
@@ -5949,6 +5973,8 @@ intel_dp_force(struct drm_connector *_connector)
 		return;
 
 	intel_dp_set_edid(intel_dp);
+
+	intel_dp_dpcd_set_probe(intel_dp, false);
 }
 
 static int intel_dp_get_modes(struct drm_connector *_connector)
@@ -6321,10 +6347,11 @@ intel_dp_hpd_pulse(struct intel_digital_port *dig_port, bool long_hpd)
 	 * complete the DP tunnel BW request for the latter connector/encoder
 	 * waiting for this encoder's DPRX read, perform a dummy read here.
 	 */
-	if (long_hpd)
+	if (long_hpd) {
+		intel_dp_dpcd_set_probe(intel_dp, true);
+
 		intel_dp_read_dprx_caps(intel_dp, dpcd);
 
-	if (long_hpd) {
 		intel_dp->reset_link_params = true;
 		intel_dp_invalidate_source_oui(intel_dp);
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index eff3414c05dbf..0657f56811966 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -213,5 +213,6 @@ int intel_dp_compute_min_hblank(struct intel_crtc_state *crtc_state,
 				const struct drm_connector_state *conn_state);
 
 int intel_dp_dsc_bpp_step_x16(const struct intel_connector *connector);
+void intel_dp_dpcd_set_probe(struct intel_dp *intel_dp, bool force_on_external);
 
 #endif /* __INTEL_DP_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
index bf8e8e0cc19c9..7bec964c0496f 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
@@ -835,6 +835,8 @@ void intel_dp_aux_init(struct intel_dp *intel_dp)
 
 	intel_dp->aux.transfer = intel_dp_aux_transfer;
 	cpu_latency_qos_add_request(&intel_dp->pm_qos, PM_QOS_DEFAULT_VALUE);
+
+	intel_dp_dpcd_set_probe(intel_dp, true);
 }
 
 static enum aux_ch default_aux_ch(struct intel_encoder *encoder)
diff --git a/drivers/gpu/drm/i915/display/intel_hotplug.c b/drivers/gpu/drm/i915/display/intel_hotplug.c
index 74fe398663d63..901fda434af12 100644
--- a/drivers/gpu/drm/i915/display/intel_hotplug.c
+++ b/drivers/gpu/drm/i915/display/intel_hotplug.c
@@ -33,6 +33,7 @@
 #include "intel_display_core.h"
 #include "intel_display_rpm.h"
 #include "intel_display_types.h"
+#include "intel_dp.h"
 #include "intel_hdcp.h"
 #include "intel_hotplug.h"
 #include "intel_hotplug_irq.h"
@@ -906,9 +907,14 @@ void intel_hpd_poll_enable(struct intel_display *display)
  */
 void intel_hpd_poll_disable(struct intel_display *display)
 {
+	struct intel_encoder *encoder;
+
 	if (!HAS_DISPLAY(display))
 		return;
 
+	for_each_intel_dp(display->drm, encoder)
+		intel_dp_dpcd_set_probe(enc_to_intel_dp(encoder), true);
+
 	WRITE_ONCE(display->hotplug.poll_enabled, false);
 
 	spin_lock_irq(&display->irq.lock);
-- 
2.44.2

