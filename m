Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C5EC52758
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 14:24:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D439010E73A;
	Wed, 12 Nov 2025 13:24:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eI8JXIyl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 695C410E73A;
 Wed, 12 Nov 2025 13:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762953846; x=1794489846;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=sizYxiw/i/8r8ogCd+7yLCBQm+gX0NcvXZIpcppOVmM=;
 b=eI8JXIylT9vBvoxkFplzwx8jZJr0YV2aE4LxykMqrXw+gLrczuNFbB+y
 +5enaC3c57+eBP3zCp6joy1fj9FQf89HXRr0stzdcw+wC+3lvtLo3cISc
 kEhkb5qSBGP7DDxn3XxbWl3B9MiRNDTotFaeLiJMermbR+fg4IMwuhpg7
 6Qvtxq5hu7FgiWxlP1FugC8i9G6qNdxqvXfiF5o1X4YZ+Am+RzOdt6ESf
 3EPTXIKZFC7juVlHxGSv8Nqzl6ErCMvVjMuE8FKyMKOi3LorOkOci/GbJ
 c97/OCsYs6VOqbIdT8yn4RIAhD/wzr7OePi1kCkwGSDZqTfWGCDACex/w Q==;
X-CSE-ConnectionGUID: KmrSSBlIQwWhPAVDprMsIg==
X-CSE-MsgGUID: wG7Mk4RuT+au/TWx2GgYWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="87656360"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="87656360"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:24:05 -0800
X-CSE-ConnectionGUID: 2HGBCxRySfWLUfzYQDEz3g==
X-CSE-MsgGUID: lnkGSakqRkeGNGUYw1wzCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="194199797"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:24:04 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:24:04 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 05:24:04 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.41) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:24:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kbwbUUJxCBGmoH5133UqglF6lUxZlOypDJ8ROZlv7D/jjfR9SWr3u9gPLQUDoL3M+mvUafJfGEQM2EIJXz+mhVsSKwRp8ULSKWAB0nqmT3v9bKpE5u/t/tGmT9SiQ8Pi6pYvqZ5DFcmz8OYRRZGqPexwXrtnNL4pM2bSqDfUZef4EMsOQvG/ODX5odH7cVqvRqAj7lXTw5DW5uc8fgHL1P+7ieyvCHhOhsyq0Cg1jAT1XPRGPL+J2n99duZQwXPw02neFciFarLI+md1hy4kov4+50aEhVI/dqMSx4UHHYKGQfBbCCWRht7sAMsH9rQnirDtfYPnwWmXUsGsnIbl1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ahmIcA3lX4ElQs52mznjIobMwPl8/sw9nldUTP0dIYU=;
 b=cdBdc8lgqLQaPMPy4NchONGE0RkR/q+1Vc/OI8A1LyAhW1X9tmYaCnTgpwtSdlIt2UOtIRJEURlk1ZKuYzAbpF/zZgXhftwasabfBCy4niftge8CPORuyne7W7tbdPXWv5SMcjxc+FbL/kYPziK/4J+/TbJd7zML1IoagEMdi7fiOeIlgfl/FGLUv3JPUrdKUtaWjBIJNarzidWgfctM7shBrHEHRoJspiNkOW2zvCpEx2t68tPk3sMMgneZNrx/mqZXmZ8MUmUIXF6AGBcjbLGPK5LFqu6QHJ1OMrNx1H8m0gl33JpiPPiUOvcGNjcWlSFDYSWUJqh7v4KfWBg13Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CY5PR11MB6534.namprd11.prod.outlook.com (2603:10b6:930:42::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.16; Wed, 12 Nov 2025 13:24:01 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:24:01 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH 17/24] drm/xe/pf: Add helpers for VF GGTT migration data
 handling
Date: Wed, 12 Nov 2025 14:22:13 +0100
Message-ID: <20251112132220.516975-18-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112132220.516975-1-michal.winiarski@intel.com>
References: <20251112132220.516975-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0004.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::8) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CY5PR11MB6534:EE_
X-MS-Office365-Filtering-Correlation-Id: eb6ff8f3-fad5-4e46-fe97-08de21eebe5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MlJoVFdueGNwckw2ZkVFY3FOVzNDSHc3SVdmSGppL2djdkdJaURaY0hYNnQy?=
 =?utf-8?B?OVNGb05IUzdoMENPS1RNMUlDQkp0TDViV2xKTlNid2ZsUE9WQzdzaGZZNVNa?=
 =?utf-8?B?MlVGMXNhUHBjTThtSlF6U3d4ZG03NDRRYThsdHZ3TnVpVlNGZFM0aDYwZEtv?=
 =?utf-8?B?UzlsSmh1UzdjYUlMVVBSRlA3YXBpUW1YTzRoTnpiM0VyOEtPUnI4U01UUU96?=
 =?utf-8?B?ZFJUdkY3VFdlZU85RXc3Z0psb29HN253cG9nMjIrUC85V25MRHdhaTY4bEZy?=
 =?utf-8?B?V3dUOHd0bFlZZlFXM0FHNGo4c1JEcjBEZXg3VGRqbXRkSU9jenZaQXRBMS9X?=
 =?utf-8?B?eGR4eC84UXJHK3BLcDRaNzdYNUJ1cDRRZVR0VVhMRGdlMlpIbzAyaDdaTXFr?=
 =?utf-8?B?eGFhQXJjbERFQ0doQzNwV2hnNi8yTEk3M244SFd2U0ZJbWVvcUpEU3pMUGx5?=
 =?utf-8?B?V1VtanV3b1QxclloK0hwcEh4NmhWbmJyMmZscGhCYXNRYkpqM3YvcHJjRHZT?=
 =?utf-8?B?clpRQ1c1akF4azd5Ny9VWHQzRGwwQ20wQXNTM2xhRHJZbWsvQk4wZk5NcHV4?=
 =?utf-8?B?U1NNSnBDRVRVa2lsdVNLNlJRNFBkMFFPY3grOVNTRytaSGN5eEg1S2Nuamhw?=
 =?utf-8?B?S3QrK1lXcHdTL203eWgwb1NvUEZxdWc0ZWJ0T2YrTHlIWTIwc2ZVMnB2OHFp?=
 =?utf-8?B?U1VVM3RyYVYwUHYvcjdvUXFEZDl5VUJMakY5aW9KZ25JNUswSVJvcmd6ZmZa?=
 =?utf-8?B?TmkzOTFBZjh5MHNGTXlqUll0aTZXMDZyS1RQTG5TSjNPYjJpWUdKMjQzdkg3?=
 =?utf-8?B?R0ZkRmxlUWZ1OXA3eGltdVVDcEhYQ29oVHE5OHhDY1l1em1Lc2NiRFJtanpr?=
 =?utf-8?B?VmhzSGQ5SU1PNjFFOUNWUjg0RmJSMk9WRTlRZ0JlV2tOSlJxRW9IdEgrUGNF?=
 =?utf-8?B?OUNnQXBRM1RKV0x1ZC9kU3h0RUtFSjd5VE1BRUw0R3lWN3hGSmpKVVpyYVVw?=
 =?utf-8?B?L2RpcXdjVDVoWUZYVWowWlBZNVdBNXpjUzQ3RFQvajRqTmhaVWF6c0RqV3JY?=
 =?utf-8?B?N0dLVnZPZ1ZHM0pGbXNUN2orYjlwQU4wYnE0b2pJWFhvQU45ZFhyOEpZWG0z?=
 =?utf-8?B?NElNQWpYOWNIdVVnQ0pDaVQ1aW5tUnBJeUcwOHFtKzFZdGJIZjM3ajhwZjIr?=
 =?utf-8?B?bFoya1JKL2IrYmQ5T1hPR3dpbTFaQm0vbVh3dytWVm5PWUYzMThlL1hFOUJh?=
 =?utf-8?B?K1BLczE5MUtmS0xqaHBxd2lvNk5HM2pBWmdJT2swK2ptU1hkQ3JLWElNNVNk?=
 =?utf-8?B?QjMvQURZSDdROW12ZGFCSU5XVHlIeXJEeGlQWUJpS0JWWCtjQkg4T0E2dWg5?=
 =?utf-8?B?cG9EL1IzQjdYaldZM3RUQVROdG9MYkZkWFpaUndMcHFkK2paeVZiSXpYRTFQ?=
 =?utf-8?B?VkZCcm5IWmNTUXpuMmVDeHRiQVZGc0JabHN1RmxObjlCZzdmTHBPaWc1Sjd3?=
 =?utf-8?B?bFlLQVgxY1RyeE9rWWcxZUM4bUJYL0wxcUZnVWFNYWRpNFNXYW1talNOYnY1?=
 =?utf-8?B?UnZqNjE3VW0wMEZwQWxGUFY5RFpJZWl6S09MRjBpQUxSNm5VVWZKS0ZTbjNs?=
 =?utf-8?B?eERTZjVnUEJxY3h5cVZxTG4xMWxVWkxkTWVSNlE5U1VEZ2JDQkpkUzRPUUVr?=
 =?utf-8?B?K3k4SlVlWll1QXM1NEJQUGc1bThKRFpxRXdaUnByVk5KUnZhNFFLRCtIa3Nu?=
 =?utf-8?B?Rk1RT3F2UkE5UEZzYUFMcFJRb0ZCQktubk53dDJnS0xJSm5xMjdzRVNoNjhh?=
 =?utf-8?B?Rmt1S1pNekdJV2IwN2pxdmR2b2JpYU16c05xVzVaaDE2RW9Kc0M4TzNuUmo5?=
 =?utf-8?B?TnR6cGZEbGs5N3dhOFQzNk1kNjFBc2VyUE1XZlJZRmloeG9ZMWxmbEN3eVFG?=
 =?utf-8?Q?RjFR2Vn1gRq/gWsVRmNPTHrcoZYXa2h6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTkzRnQ2NEM2eU82dmJMTUVjQkptNlhoeEJ2bTUrRnZxb2hlenFRQzd4Rk9y?=
 =?utf-8?B?TXBLMTZzNklHZENtVGxtY21lS3R1WGphc294NU45aERaWE5sY05ncXc0NFVr?=
 =?utf-8?B?MWpIcjVlRHlKN21MdUgrZ3UrMUFWNERLaTgxRXVsZTBlYytOZnUrcmxTUkpN?=
 =?utf-8?B?ZGg5bFdKaXd4d1FoUlpQMHZ4aGRlc3l0STdRcWlPanlWWGkzbDdla1N5clFz?=
 =?utf-8?B?VTUzSW5QbDJpbkpFbUVZem11QXJCY1QxdmpZMHZ2bW1RenhQdzZ0OFNHcG85?=
 =?utf-8?B?U0g5c0hMS201VEJjSUVEZk9adjM3NjhyeEZacVNseDZ6bmpaN2xqVXczekZk?=
 =?utf-8?B?WjMwVERJL2t2RTEyTHVRWGdMcXhvYlZsWFRrUFNOT3NqYlBUMUFvb3p5dUZF?=
 =?utf-8?B?ekNoZ0o2T2dCTTN1c2ZGczcrYTlCZGVON0ZtSk9OR2NDYXl0OXFJRS9QMERD?=
 =?utf-8?B?UzNQTGJVMUEwdHlMUThrL2pVRGFvaWFZeGtwUnRZYzk1TmZTajA3Y21EUDJB?=
 =?utf-8?B?Zmh5eVNBK2N4WldVOURid1loellTVjBNVVRpN2pCSnpqR0l4OElENnRqOVIr?=
 =?utf-8?B?eWtmZHpBYW9jZElNSkhPYVNpUXhlNzdLcWhGRjhsV0hFeVNMQkMwL0tYV0hW?=
 =?utf-8?B?dTBtUUdYajNIQnd3azloNUpScnFsdmllZURsZDdTUm1oRUdoM2RkOHRGOXJv?=
 =?utf-8?B?YTB4UFRYMFBzR0NrSmlxUWJKVFdLdHZGNmFaTlpkTTRMei83YUdBcm43NU1z?=
 =?utf-8?B?U3VUNmQ5ZzVndTNHaDdmWmxHN3hnQW9WZzZrTE1wTEEySFhyUmpFbXFHWmJh?=
 =?utf-8?B?NnNrazNKMnlNY1BtYVVVampjMTJ0VUttSUkrU3RBQmFva3ZjVGN3QjdyQ3hr?=
 =?utf-8?B?SFliUEZ2QUlkVUJYeis5ZkxkTy8zMW52aG9jcm42a0pQN1FxLzJGam5xeEo0?=
 =?utf-8?B?NVFJOHBnMXdkVzUyT1hGemRCMTgvRXR4MmtxMXpzWUVncHNkaWFKaCtTcE5y?=
 =?utf-8?B?cTdNSFpGc3BhOUFIck9pRnVnMWV5RjY5bDRtN2dFbWRWSVNMdVE4TnlORmdD?=
 =?utf-8?B?bnhJNEFYRElQcElkWm5oUEJGOFpoMnQ4WFVNTTZmT0JSK0VRdm4yaE8zb3FZ?=
 =?utf-8?B?bjJVSCtyU21VZHViQmNCZWwxWSttYWFBS1EyRE53MS84MWNNYTJnT29xZm5l?=
 =?utf-8?B?eGxWSG5HVUNwTHlsWm9CRmVrSHM1L0xkbTlRQ0hmQm5UZzBIY0MxRC9UMGxk?=
 =?utf-8?B?b3Z6Z1AvMSt4M2dpL2Z4MTQySXBvcFNoS2RWZWNlQzJUTnBXdno0NUxjTkN4?=
 =?utf-8?B?Ri9wQUR4VHdJamEzM2hOSFo0a28xUzE2MUY0dGgydnR0YWc3Nkk0ZlBQaHZ3?=
 =?utf-8?B?WjNiaENMemthOHhabHJjNjV5T3V4L2FhZVlzdC9oVmtlWUxXZTIvSEdjOGpm?=
 =?utf-8?B?QkR6V2k1ajgrcDdMcytqMlVYYWRKSGM1VlpZZXNxRzE0SGliRXBMc1VMUmgz?=
 =?utf-8?B?SVVCdXdpa2hENFFrUTR1NStJSnNUa0plYURGZTdyTXhmUDljSFQ1eVpmNDRJ?=
 =?utf-8?B?Umh3NjBXeCs1bDc5d0xqYXI5akhFcTJLM01MQ3AzM1k5UlJUNmhUTEcvdnRB?=
 =?utf-8?B?YTJWQk1MbFdnSTlvRTY2UDZKQ082Q054VUVPZmYvcndBMm1rVlhYT1prVXRW?=
 =?utf-8?B?VnBlS3VtQS80L3NZRXNSa1YrVXdpaFZyMFFwaTh6bnZreldIelhwcEpCTmxB?=
 =?utf-8?B?aVQwWm4wNUxOYTBPeDJkQVk0L2QwSGEya0VkUkpFRnhYaUVrYU5FOVQ3alls?=
 =?utf-8?B?OE52MEJrVGp6U1o3RmVoaVgwWnVMN0xJR0U5OXNKOXpRMkdBUzhPMEc1U1RE?=
 =?utf-8?B?QjZCbkZnVDQzUzVkQmZuRStGYXpJYlJlVE1QTzdERGNHK1RxbmdodDZHcGE2?=
 =?utf-8?B?QWVPVDBFSFRCWC9vM3B0YXJtb2VFSEFwdEFNL0hlQ0h6a2N0VnNrOVEzcXYz?=
 =?utf-8?B?YUF4cGJPdzhSd2JMZHBPbTdsYWhjc2p1OEhFOXZHNlBQOW1QcVR6L2YvWG5x?=
 =?utf-8?B?aWRWWENhOVpUV29tcitGQy9QcklINmNBSnJXcVpqZTRKV2R2LzVFL3ozUFhw?=
 =?utf-8?B?T3JtbE1DUmtKUUIzOFd0U3Rzb1I0c1FLMzJnT0ZRN0hURkE0ZVJKbDhMektq?=
 =?utf-8?B?S0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb6ff8f3-fad5-4e46-fe97-08de21eebe5d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:24:01.5343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V59Tuxoxabk/ZfY8tCEdMirznPBQ3Mtvw2fcMI5vZNGA4AKuQs+TxH/rg8RxjuLZzgCnt7yV0a2XjOehydMJSf7+LTGbO2tXs/97OM+ecVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6534
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

In an upcoming change, the VF GGTT migration data will be handled as
part of VF control state machine. Add the necessary helpers to allow the
migration data transfer to/from the HW GGTT resource.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c               | 104 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.h               |   3 +
 drivers/gpu/drm/xe/xe_ggtt_types.h         |   2 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  57 +++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |   5 +
 5 files changed, 171 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 20d226d90c50f..ef481b334af45 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -151,6 +151,14 @@ static void xe_ggtt_set_pte_and_flush(struct xe_ggtt *ggtt, u64 addr, u64 pte)
 	ggtt_update_access_counter(ggtt);
 }
 
+static u64 xe_ggtt_get_pte(struct xe_ggtt *ggtt, u64 addr)
+{
+	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
+	xe_tile_assert(ggtt->tile, addr < ggtt->size);
+
+	return readq(&ggtt->gsm[addr >> XE_PTE_SHIFT]);
+}
+
 static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
 {
 	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[XE_CACHE_WB];
@@ -233,16 +241,19 @@ void xe_ggtt_might_lock(struct xe_ggtt *ggtt)
 static const struct xe_ggtt_pt_ops xelp_pt_ops = {
 	.pte_encode_flags = xelp_ggtt_pte_flags,
 	.ggtt_set_pte = xe_ggtt_set_pte,
+	.ggtt_get_pte = xe_ggtt_get_pte,
 };
 
 static const struct xe_ggtt_pt_ops xelpg_pt_ops = {
 	.pte_encode_flags = xelpg_ggtt_pte_flags,
 	.ggtt_set_pte = xe_ggtt_set_pte,
+	.ggtt_get_pte = xe_ggtt_get_pte,
 };
 
 static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
 	.pte_encode_flags = xelpg_ggtt_pte_flags,
 	.ggtt_set_pte = xe_ggtt_set_pte_and_flush,
+	.ggtt_get_pte = xe_ggtt_get_pte,
 };
 
 static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u32 reserved)
@@ -697,6 +708,20 @@ bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node)
 	return drm_mm_node_allocated(&node->base);
 }
 
+/**
+ * xe_ggtt_node_pt_size() - Get the size of page table entries needed to map a GGTT node.
+ * @node: the &xe_ggtt_node
+ *
+ * Return: GGTT node page table entries size in bytes.
+ */
+size_t xe_ggtt_node_pt_size(const struct xe_ggtt_node *node)
+{
+	if (!node)
+		return 0;
+
+	return node->base.size / XE_PAGE_SIZE * sizeof(u64);
+}
+
 /**
  * xe_ggtt_map_bo - Map the BO into GGTT
  * @ggtt: the &xe_ggtt where node will be mapped
@@ -930,6 +955,85 @@ void xe_ggtt_assign(const struct xe_ggtt_node *node, u16 vfid)
 	xe_ggtt_assign_locked(node->ggtt, &node->base, vfid);
 	mutex_unlock(&node->ggtt->lock);
 }
+
+/**
+ * xe_ggtt_node_save() - Save a &xe_ggtt_node to a buffer.
+ * @node: the &xe_ggtt_node to be saved
+ * @dst: destination buffer
+ * @size: destination buffer size in bytes
+ * @vfid: VF identifier
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_ggtt_node_save(struct xe_ggtt_node *node, void *dst, size_t size, u16 vfid)
+{
+	struct xe_ggtt *ggtt;
+	u64 start, end;
+	u64 *buf = dst;
+	u64 pte;
+
+	if (!node)
+		return -ENOENT;
+
+	guard(mutex)(&node->ggtt->lock);
+
+	if (xe_ggtt_node_pt_size(node) != size)
+		return -EINVAL;
+
+	ggtt = node->ggtt;
+	start = node->base.start;
+	end = start + node->base.size - 1;
+
+	while (start < end) {
+		pte = ggtt->pt_ops->ggtt_get_pte(ggtt, start);
+		if (vfid != u64_get_bits(pte, GGTT_PTE_VFID))
+			return -EPERM;
+
+		*buf++ = u64_replace_bits(pte, 0, GGTT_PTE_VFID);
+		start += XE_PAGE_SIZE;
+	}
+
+	return 0;
+}
+
+/**
+ * xe_ggtt_node_load() - Load a &xe_ggtt_node from a buffer.
+ * @node: the &xe_ggtt_node to be loaded
+ * @src: source buffer
+ * @size: source buffer size in bytes
+ * @vfid: VF identifier
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_ggtt_node_load(struct xe_ggtt_node *node, const void *src, size_t size, u16 vfid)
+{
+	u64 vfid_pte = xe_encode_vfid_pte(vfid);
+	const u64 *buf = src;
+	struct xe_ggtt *ggtt;
+	u64 start, end;
+
+	if (!node)
+		return -ENOENT;
+
+	guard(mutex)(&node->ggtt->lock);
+
+	if (xe_ggtt_node_pt_size(node) != size)
+		return -EINVAL;
+
+	ggtt = node->ggtt;
+	start = node->base.start;
+	end = start + node->base.size - 1;
+
+	while (start < end) {
+		vfid_pte = u64_replace_bits(*buf++, vfid, GGTT_PTE_VFID);
+		ggtt->pt_ops->ggtt_set_pte(ggtt, start, vfid_pte);
+		start += XE_PAGE_SIZE;
+	}
+	xe_ggtt_invalidate(ggtt);
+
+	return 0;
+}
+
 #endif
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 75fc7a1efea76..93fea4b6079ce 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -29,6 +29,7 @@ int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
 			       u32 size, u32 align, u32 mm_flags);
 void xe_ggtt_node_remove(struct xe_ggtt_node *node, bool invalidate);
 bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node);
+size_t xe_ggtt_node_pt_size(const struct xe_ggtt_node *node);
 void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 		    struct xe_bo *bo, u16 pat_index);
 void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo);
@@ -43,6 +44,8 @@ u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer
 
 #ifdef CONFIG_PCI_IOV
 void xe_ggtt_assign(const struct xe_ggtt_node *node, u16 vfid);
+int xe_ggtt_node_save(struct xe_ggtt_node *node, void *dst, size_t size, u16 vfid);
+int xe_ggtt_node_load(struct xe_ggtt_node *node, const void *src, size_t size, u16 vfid);
 #endif
 
 #ifndef CONFIG_LOCKDEP
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index c5e999d58ff2a..dacd796f81844 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -78,6 +78,8 @@ struct xe_ggtt_pt_ops {
 	u64 (*pte_encode_flags)(struct xe_bo *bo, u16 pat_index);
 	/** @ggtt_set_pte: Directly write into GGTT's PTE */
 	void (*ggtt_set_pte)(struct xe_ggtt *ggtt, u64 addr, u64 pte);
+	/** @ggtt_get_pte: Directly read from GGTT's PTE */
+	u64 (*ggtt_get_pte)(struct xe_ggtt *ggtt, u64 addr);
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 80cc3f2cd047d..5b4e1d2da5adc 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -726,6 +726,63 @@ int xe_gt_sriov_pf_config_set_fair_ggtt(struct xe_gt *gt, unsigned int vfid,
 	return xe_gt_sriov_pf_config_bulk_set_ggtt(gt, vfid, num_vfs, fair);
 }
 
+/**
+ * xe_gt_sriov_pf_config_ggtt_save() - Save a VF provisioned GGTT data into a buffer.
+ * @gt: the &xe_gt
+ * @vfid: VF identifier (can't be 0)
+ * @buf: the GGTT data destination buffer (or NULL to query the buf size)
+ * @size: the size of the buffer (or 0 to query the buf size)
+ *
+ * This function can only be called on PF.
+ *
+ * Return: size of the buffer needed to save GGTT data if querying,
+ *         0 on successful save or a negative error code on failure.
+ */
+ssize_t xe_gt_sriov_pf_config_ggtt_save(struct xe_gt *gt, unsigned int vfid,
+					void *buf, size_t size)
+{
+	struct xe_ggtt_node *node;
+
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid);
+	xe_gt_assert(gt, !(!buf ^ !size));
+
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+
+	node = pf_pick_vf_config(gt, vfid)->ggtt_region;
+
+	if (!buf)
+		return xe_ggtt_node_pt_size(node);
+
+	return xe_ggtt_node_save(node, buf, size, vfid);
+}
+
+/**
+ * xe_gt_sriov_pf_config_ggtt_restore() - Restore a VF provisioned GGTT data from a buffer.
+ * @gt: the &xe_gt
+ * @vfid: VF identifier (can't be 0)
+ * @buf: the GGTT data source buffer
+ * @size: the size of the buffer
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_config_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
+				       const void *buf, size_t size)
+{
+	struct xe_ggtt_node *node;
+
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid);
+
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+
+	node = pf_pick_vf_config(gt, vfid)->ggtt_region;
+
+	return xe_ggtt_node_load(node, buf, size, vfid);
+}
+
 static u32 pf_get_min_spare_ctxs(struct xe_gt *gt)
 {
 	/* XXX: preliminary */
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index 14d036790695d..66223c0e948db 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -71,6 +71,11 @@ ssize_t xe_gt_sriov_pf_config_save(struct xe_gt *gt, unsigned int vfid, void *bu
 int xe_gt_sriov_pf_config_restore(struct xe_gt *gt, unsigned int vfid,
 				  const void *buf, size_t size);
 
+ssize_t xe_gt_sriov_pf_config_ggtt_save(struct xe_gt *gt, unsigned int vfid,
+					void *buf, size_t size);
+int xe_gt_sriov_pf_config_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
+				       const void *buf, size_t size);
+
 bool xe_gt_sriov_pf_config_is_empty(struct xe_gt *gt, unsigned int vfid);
 
 int xe_gt_sriov_pf_config_init(struct xe_gt *gt);
-- 
2.51.2

