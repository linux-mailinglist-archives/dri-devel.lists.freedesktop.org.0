Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 777F1BAAA89
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 23:44:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D052710E122;
	Mon, 29 Sep 2025 21:44:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U90I54q9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1546C10E4B0;
 Mon, 29 Sep 2025 21:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759182282; x=1790718282;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=lOMoWw83yQsBm17eS0wOQsU6PlywC2s3sFToy1C4Syg=;
 b=U90I54q9b2P5Mcva1wFXmrxaXo7oeGmQYpYGhAOVjuIwZTpgrq0obeG+
 YZZuKx2jmjZZICF15Wv0clG4hYE9rXQgB7OeKtfQg4xol0AmbcBOVy+Y6
 UwjkiShUy8rUjo8ef2sCR/KBeioH/iyLPzzvKPPvkZotcpgCfgVoGQhVc
 /5U2ianQOYTX0q/s71s5esHaUrcJxL1x2vBm5W3HvhO4z8+q95o7X4I3R
 um50WJOb/yP2VE+57FMA/s6NS2mh3CrDAIT0rlis/gGuLa4gI/uDcZHXs
 WBjprSebsMVKHtkNtZEn/SV4g25RgkzCBSKSIwzYx2D5SReV84hZ4Nrgd g==;
X-CSE-ConnectionGUID: Jid36+UTQeuTUxc4OfUS0w==
X-CSE-MsgGUID: Vt92hmUHTXCV9Zr4mOy+xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="65068864"
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="65068864"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 14:44:41 -0700
X-CSE-ConnectionGUID: ILcYosx7TKSdLg9A28deeg==
X-CSE-MsgGUID: 82MoIgncT1e/1euOPvQODw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="183597516"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 14:44:41 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 14:44:39 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 14:44:39 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.42) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 14:44:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jFq78RaXdWPvov3Ru4R69a02LrUlk5WU50fC8r7Ul6TxAAtcqEFhb7W/HoFTO+wWcvtIsinT1RcD/yYW3lJeYvVDmyytdfMWDPbuLZYVPxU795vZjYXPt5xjkz+WXDUFuYxWlZdrUBRQUHCOgbFI/u+HUAOqqQwQv2U6I9khXWHixPkD8lqg/xZ1mVMunOSFkuD0OQGx2mO+Y96jm3IvekWlXfQ2wlwJqwPnXCwutgJxz0A5VCIYUDzAeRrDNhU6d6fJtxTshNdKRXtaiQEchxrB4dcs/nl+iwHH23M6DZLqsQ4iIlN9LrO9TXvhAsmk0En4EN173BsCjG4icQroFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Trbs5UQyDB9qHi0+H5R+UrCFWTp1374wg88OPYsQoQc=;
 b=Q07h22CZ2m+F3B+B2JwT7yKzoYjtC3NMDzHQM/CwxPdpZR5Zy1dBuNfE0MPHyjkO7JxqWKJh3Z9jYaKVAnjnN7OV/V+866xMYsZgNe+PBZbDgH6o2FUgwueF+4F1o6FxU/fzciW6ukWJ2bsqKZ5MXGZuYAgMSMk61WkRn88vuEE3Y80anORdgFpFjMmYzZMJL/Xsd20cGw/w3gQ1oqqgOl9NEPblT9MVVEIdLdTZDG+DcFxnYeCegBYb4EPJT8Lmxy9T0bh0wYd1e7C98z9w6imdtTnknVgoyruvS0JaSVyauuxlVOnAffa1513M8k0PGgJ2+cV7O68zPgusT3EL1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8427.namprd11.prod.outlook.com (2603:10b6:806:373::19)
 by LV2PR11MB6069.namprd11.prod.outlook.com (2603:10b6:408:17a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Mon, 29 Sep
 2025 21:44:36 +0000
Received: from SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781]) by SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781%4]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 21:44:36 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Zack McKevitt
 <zachary.mckevitt@oss.qualcomm.com>, Lukas Wunner <lukas@wunner.de>, "Lijo
 Lazar" <lijo.lazar@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>, "Aravind
 Iddamsetty" <aravind.iddamsetty@linux.intel.com>
Subject: [PATCH 1/2] drm/ras: Introduce the DRM RAS infrastructure over
 generic netlink
Date: Mon, 29 Sep 2025 17:44:13 -0400
Message-ID: <20250929214415.326414-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929214415.326414-4-rodrigo.vivi@intel.com>
References: <20250929214415.326414-4-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR13CA0036.namprd13.prod.outlook.com
 (2603:10b6:a03:180::49) To SA1PR11MB8427.namprd11.prod.outlook.com
 (2603:10b6:806:373::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8427:EE_|LV2PR11MB6069:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fbccc6c-ed3e-4afd-92c5-08ddffa16293
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0FXbDB5L3JYRWNhTjNQcXhwdEc4c2JCN0pHRTNGVW9CQWpHQXAybU9SUkFv?=
 =?utf-8?B?VHRLM1I3V3VYY2Y5RXpRWjdSdmRHM3h1UWZhZnNqWXlhSktlZWJGRnJZTEgr?=
 =?utf-8?B?Vm9CeDY1TTE2ZGpNM0VyVUZJNHpIVHowcWtlazBZYnBqZldiWVFVNWRGdlVi?=
 =?utf-8?B?cWYyNXpUU2VpUW8weGFMRVlIMy9pb3FOUW9VU1M5SmwxZ3lLbjJjaUhnY2Rr?=
 =?utf-8?B?MllsZzRTNis0aXhQdzgvVzVrYUpERmlEZmJKVXdIaWIzKy9URm03YVgvMm0x?=
 =?utf-8?B?VEFYRCsrRHByMDFFNVFkTDc0Z0Vpc0RsaTQ0emVpRjh5MEdSVUJvM2U1QnpX?=
 =?utf-8?B?ZHJDb2E4UmkvZFIyMkgrSWs0VDREY1hObUtlWFRFQzFHWkR0UzVQV1JFMmND?=
 =?utf-8?B?L0NXTDNVOGlaMmZoS0xJbGpFTDIzSG1ROUR0WlNqZ254aE9sSEpETjV3TTIv?=
 =?utf-8?B?bUN0ZE5hU1ZkVUp6aCs1cjVobmsxbXlhbW00Q1NiRVJ1Wm9EdU1sZGY5NldM?=
 =?utf-8?B?UW1pOFNxRTA5ZEdOTG1KU3RyaEVQcDNOaVN1VXVQZ3R5MW5WaWhmd2ZXVi9I?=
 =?utf-8?B?Z2VrRFVZWDdQTUZUbWJVbjNwL3hwblZBb2lXSDZKbWdrMmJsNUc3MDlWUjgv?=
 =?utf-8?B?aUFIQzBpMFdBa0x1WFpMdHZyMkNjalJUdDZYODBWMXVMRC9HTzdRTWtrSFVE?=
 =?utf-8?B?anRaaWVDWlFkd0lZYW03TXY0d3VEMlFnb2Z4V1lzUDJlUk1ETDNFZEJaazRy?=
 =?utf-8?B?UjhBL3BHb2Y5NGdhSStvclh3T0NNVlB6aHlKS0hLdXpIWjNlNTk5aGdjcE9O?=
 =?utf-8?B?Ukwra2tlaS9oR3R0Nm14L2dqRjlYcFpCL0lkZGhKdXhIWlNOM2xBL2ZSclFq?=
 =?utf-8?B?QlVTRmVScjBud1UxNzRQTld4MkhveWxUK3FRL2tjVTBoRXpyVGVyUHBYRlpR?=
 =?utf-8?B?a21RY2hmNjE4MitqZms4dUEwNCt0ZzJ1eklxQWsreThSOVhIb3Zwb2c2WkdT?=
 =?utf-8?B?ZHRmTWY5RXJIV2hkaHIwMmRjUE9rbkFSNUViL05udm9mMmdKb1czQXFnY3FZ?=
 =?utf-8?B?a2t1R3U5V21ManQySUlldWg1K1d5VU4wbUdOOHA5L2hSRWpYN0o0dGN4MDdk?=
 =?utf-8?B?ZWxpamtxeVdaNW4wSG1tRFZlbnZTd09ZcFFIalBVYmZBbWRUaWxsZnJVcjY0?=
 =?utf-8?B?andFU3dENSsvNjlCUXFyZ1UxTVFDak9Qd3pQSmpUa3RsWEg3emhCbUZVY25I?=
 =?utf-8?B?dEljRHIwbFY1aExEb2hMd280c2R3S2RPakIwVTl2RUtNbjBiNGl1YWdLY2xv?=
 =?utf-8?B?WWtsRFR3ZE1xV3BaeWtlM1l2SU1ZOExaMGlUSlg1eWJydTh5c1dUZm5nNUtL?=
 =?utf-8?B?MjJ6RzNHalFRR0RlNjVRN0o5c1hYdk55WXcxdEJ4bm5WV3c5RmNxWVdMSnV6?=
 =?utf-8?B?ZFAzZ2hFWGdWbWxBQVdjUTk4aXY0WEk5b2JhRTdEN1lmOGJQVkZCajhkbTRw?=
 =?utf-8?B?Q3AyQlhxQ3B3bzdFSE1tdU05YlpYS1VtUk41WHdXc1dKWVZ5bmtVZDB2MEk1?=
 =?utf-8?B?WWprODhGdE5mSkVGNTFIQVRXR2JIS2tSTC9ITzdvR1NtVktmSnRGbDM2RFo0?=
 =?utf-8?B?VFM2ZWJNcm5GOHF5UzMxbFZ3b1NjTnFBUlFHSGZSVzhySmQxWmZyc3Bsd05k?=
 =?utf-8?B?RUdrME1sTi90M0VSS2pQSWZJNFRtVnV0Q3A3RTI0bmRiVDRkdFpQcVN2SlNX?=
 =?utf-8?B?U25TOGY4Zk5GQ0FQeXBKM1JTZ1J4SnpDcWgvb2VsZDlxcGlKbTVKNTdtdXlL?=
 =?utf-8?B?SGlYd0FqcW9kbGJySGRTaTFBSXpHZE02enM0ZERGTjIyQ3dwNkMzZ2J5SEdu?=
 =?utf-8?B?SVVjakY4SHYyVi9UY2ZtSXMyZ2JudGRyMmpNcXQzNWNHQ2NJVGg3VXp2MVhN?=
 =?utf-8?Q?Gly14LUox5zkKit2U4Z8O6xP4SHik5/S?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enZzanVuaGlIbWQ2RFpiejNzL3hzZEkwbDdiYjJtWW9ONGh2cEFEb3c0Y0Fu?=
 =?utf-8?B?VVIwZUxucmhOOEhrcVFTTExnRkJuZlJYS1dHWHRhVGU4VytmY01GaDZsK1JK?=
 =?utf-8?B?Q2o5YWFBS3kwRHZiSnV2MUg5VEh5WGlzUTllUVB3MkhBZWhJMWxDbHVCSlFo?=
 =?utf-8?B?OTdUaVUybVhYTHpzdm8rZy9UeTR6eHVwYlY5TThPNXc4Ry92VHI1NmVHQ1N5?=
 =?utf-8?B?bVpUczJSa3ZmL2gvYXE5YVVjMjFWV1o3ZzRsTjJLcVpWNkZ2SEp0aTRCaWk3?=
 =?utf-8?B?aWZIVXE2QU5QZEhSMkdDSmNtd05DYS9tTWJwejV3Ui9LQWpXRGlpWW1IRXRU?=
 =?utf-8?B?L0xqTlFxMzIxK0hEMmZQRUYxQmNHcE5SVXUwWWQ3SGJIZE9JYnNFMmtJb1dw?=
 =?utf-8?B?bHpSbXlDRzhDa0FFb2NpR2NSYVpwR3VJZ1hROEJGdkxQWGtHUm5LeVJQQTN6?=
 =?utf-8?B?MGp6YW1rUnJTWU5waTlqemhkMkl0azZzUTNpbEtJMFZlVVg4R0VpRGFxR1NJ?=
 =?utf-8?B?NHE4OWQzUHYxV3VQZ1I4MEZkUENOYzZYQ0pCcGtORUF2VnZqb3Y3ajQ2d014?=
 =?utf-8?B?b2lPUVVPaHFNQWFERjZiL01KZDg3a0UyQ0xkTHV4WmEvVVF5cVl1d0pRRU9Z?=
 =?utf-8?B?bkZ4VStqN29Pc3o3VzZpRkwrKy9tSFpSbmRMMk1BNlIwS3hCZnBpK2tJMXZu?=
 =?utf-8?B?ZDJBTFlEVzU1ck41OHdvQWZaMHMvdDJBNWZKY0tYdk1UdDNXSWFuM1V1Sys1?=
 =?utf-8?B?N3c2WkRTc0JhUSt2MU1QKzMwSUxqR0Z1RGNONmNyNTBkWk9WK3I2WmlVc3Jy?=
 =?utf-8?B?Rjhxa204dWJFRVEwcFpnTkl5aFRjL1crNnhvbTc2VXozTFhFQ1J3VWRyRVRB?=
 =?utf-8?B?UVUxYVp3WEY5UkI4Q1pyeUdBL1FSV0hvNGI5OVNIV0tySmhJejd1cE12aHFP?=
 =?utf-8?B?NU9GREZCeHkzOXhoWWxZVmdYZUpyRVBoZ1JTWnkzc3FyNVBULy9HQXJGclBp?=
 =?utf-8?B?MW53V1B4ampPS2JDd3N4U2F1QXFYbjdhc0FMMFIzaWdVZ0l0MmFQaDNxR21Y?=
 =?utf-8?B?K0lhYk5VZXZtb1FtMUkxOTlBeE44cHhJMzVYQks4R00vVDU3RmJuZGJDb1VL?=
 =?utf-8?B?cnZNczd4TnRWUjc3eXJORHU3Y1diQUhNb0Q5dHZ0cWowNlM1L3ZtNzN3Qnk2?=
 =?utf-8?B?alVlSEJEMU5SYW13MTlaWEcvSjlPVldVc2xjVjIrOWhNRDZXYVkrSGNBMmdw?=
 =?utf-8?B?U2daVUVKUjIySmZkYjhZSHB4Sy9samdGL0RZQU9OTU9LN1Y1WVAveFhUeVRE?=
 =?utf-8?B?NTYxYW1yMTJMQllJckZhUnVxVFBBUmNsQ3VOYnRjMjBxem1oSGwyR0x4c1pF?=
 =?utf-8?B?RldYYUlWalJvYk5tWjdYcU9hMjhCNXZpN2x5aUxjU1ZKL0pqM1ZLN1JGK1Zi?=
 =?utf-8?B?eXFqTmc1b2s2eFZMKzRnM3FPMnpmQ1BjY29kSTV1Rk1nL1RyVkxBV1dYdG9O?=
 =?utf-8?B?Q2NCazB4OUVpSGVzZUpuT1NqTWtHcEdYQUhlNlkvOU5HaXBmdTJFRlVGLzBq?=
 =?utf-8?B?UlBDZ0w0WXJzRWF1ZzBFSWk5WHRwUGoxRHhySXJZUFN0a1R1VWptVnhNM3pp?=
 =?utf-8?B?OHllWmM0MUt4ZDNVN2VpZkJIRHF0cVc0Z2F5Ynk4SUFMYSswbGRTOWI2TTQx?=
 =?utf-8?B?TFNZMWJPcGtMQWUrSmFoK3RUMjV0UmtpeFNTeENxaUNsU1NBa1VsMXlsaVRo?=
 =?utf-8?B?UmlXUk9kYzJ1NmhVVU11VCtPTmVZSTg5Mno1L0c0R3JKNnlDOVJqbmsycVlI?=
 =?utf-8?B?MmpPdVN3M0xnL2J6NzZ3TDRXNnhEdHQ4L0o4ZHNZNkY0OFhGeXl1UmFJc3Q4?=
 =?utf-8?B?ZVdwT24rZE8yUTBuY004cFRuenBiWTg5YkhINW1sUGk3Ky9mR3gxZEZuSTdl?=
 =?utf-8?B?UXBWV2VKa1BzSnRVdDlPb2hwcUpYVHhrbkRUWnNnTWdBZ2kzcHMwL1g4a0Z0?=
 =?utf-8?B?akN2K0lZQmRKQ1pOelZMQThZVTh0OGpRYnpkU29reE05dkxqajZOZ1FYWkF5?=
 =?utf-8?B?TUMvWWo0YlM3TTFzM2lPWGJiVHRYdEFuWjZ5RENyWVVEd1djVk81YzB5S3pX?=
 =?utf-8?Q?YMBUhFAUgKWbqTFJK4hQzAtus?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fbccc6c-ed3e-4afd-92c5-08ddffa16293
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 21:44:36.8060 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tFNDQGewZrpxvQkDRAZ9czKd5hdADOGjvDDxzGCisibuWmQAcp5RwgcVmWdGQ5PptpprLdy2ysxRqmBFS1l+lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6069
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

Introduces the DRM RAS infrastructure over generic netlink.

The new interface allows drivers to expose RAS nodes and their
associated error counters to userspace in a structured and extensible
way. Each drm_ras node can register its own set of error counters, which
are then discoverable and queryable through netlink operations. This
lays the groundwork for reporting and managing hardware error states
in a unified manner across different DRM drivers.

Currently is only supports error-counter nodes. But it can be
extended later.

The registration is also no tied to any drm node, so it can be
used by accel devices as well.

It uses the new and mandatory YAML description format stored in
Documentation/netlink/specs/. This forces a single generic netlink
family namespace for the entire drm: "drm-ras".
But multiple-endpoints are supported within the single family.

Any modification to this API needs to be applied to
Documentation/netlink/specs/drm_ras.yaml before regenerating the
code:

$ tools/net/ynl/pyynl/ynl_gen_c.py --spec \
 Documentation/netlink/specs/drm_ras.yaml --mode uapi --header \
 > include/uapi/drm/drm_ras.h

$ tools/net/ynl/pyynl/ynl_gen_c.py --spec \
 Documentation/netlink/specs/drm_ras.yaml --mode kernel --header \
 > include/drm/drm_ras_nl.h

$ tools/net/ynl/pyynl/ynl_gen_c.py --spec \
 Documentation/netlink/specs/drm_ras.yaml --mode kernel --source \
 > drivers/gpu/drm/drm_ras_nl.c

Cc: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
Cc: Lukas Wunner <lukas@wunner.de>
Cc: Lijo Lazar <lijo.lazar@amd.com>
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Co-developed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 Documentation/gpu/drm-ras.rst            | 109 +++++++
 Documentation/netlink/specs/drm_ras.yaml | 130 +++++++++
 drivers/gpu/drm/Kconfig                  |   9 +
 drivers/gpu/drm/Makefile                 |   1 +
 drivers/gpu/drm/drm_drv.c                |   6 +
 drivers/gpu/drm/drm_ras.c                | 357 +++++++++++++++++++++++
 drivers/gpu/drm/drm_ras_genl_family.c    |  42 +++
 drivers/gpu/drm/drm_ras_nl.c             |  54 ++++
 include/drm/drm_ras.h                    |  76 +++++
 include/drm/drm_ras_genl_family.h        |  17 ++
 include/drm/drm_ras_nl.h                 |  24 ++
 include/uapi/drm/drm_ras.h               |  49 ++++
 12 files changed, 874 insertions(+)
 create mode 100644 Documentation/gpu/drm-ras.rst
 create mode 100644 Documentation/netlink/specs/drm_ras.yaml
 create mode 100644 drivers/gpu/drm/drm_ras.c
 create mode 100644 drivers/gpu/drm/drm_ras_genl_family.c
 create mode 100644 drivers/gpu/drm/drm_ras_nl.c
 create mode 100644 include/drm/drm_ras.h
 create mode 100644 include/drm/drm_ras_genl_family.h
 create mode 100644 include/drm/drm_ras_nl.h
 create mode 100644 include/uapi/drm/drm_ras.h

diff --git a/Documentation/gpu/drm-ras.rst b/Documentation/gpu/drm-ras.rst
new file mode 100644
index 000000000000..992c36dd4d8d
--- /dev/null
+++ b/Documentation/gpu/drm-ras.rst
@@ -0,0 +1,109 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+============================
+DRM RAS over Generic Netlink
+============================
+
+The DRM RAS (Reliability, Availability, Serviceability) interface provides a
+standardized way for GPU/accelerator drivers to expose error counters and
+other reliability nodes to user space via Generic Netlink. This allows
+diagnostic tools, monitoring daemons, or test infrastructure to query hardware
+health in a uniform way across different DRM drivers.
+
+Key Goals:
+
+* Provide a standardized RAS solution for GPU and accelerator drivers, enabling
+  data center monitoring and reliability operations.
+* Implement a single drm-ras Generic Netlink family to meet modern Netlink YAML
+  specifications and centralize all RAS-related communication in one namespace.
+* Support a basic error counter interface, addressing the immediate, essential
+  monitoring needs.
+* Offer a flexible, future-proof interface that can be extended to support
+  additional types of RAS data in the future.
+* Allow multiple nodes per driver, enabling drivers to register separate
+  nodes for different IP blocks, sub-blocks, or other logical subdivisions
+  as applicable.
+
+Nodes
+=====
+
+Nodes are logical abstractions representing an error source or block within
+the device. Currently, only error counter nodes is supported.
+
+Drivers are responsible for registering and unregistering nodes via the
+`drm_ras_node_register()` and `drm_ras_node_unregister()` APIs.
+
+Node Management
+-------------------
+
+.. kernel-doc:: drivers/gpu/drm/drm_ras.c
+   :doc: DRM RAS Node Management
+.. kernel-doc:: drivers/gpu/drm/drm_ras.c
+   :internal:
+
+Generic Netlink Usage
+=====================
+
+The interface is implemented as a Generic Netlink family named ``drm-ras``.
+User space tools can:
+
+* List registered nodes with the ``get-nodes`` command.
+* List all error counters in an node with the ``get-error-counters`` command.
+* Query error counters using the ``query-error-counter`` command.
+
+YAML-based Interface
+--------------------
+
+The interface is described in a YAML specification:
+
+:ref:`Documentation/netlink/specs/drm_ras.yaml`
+
+This YAML is used to auto-generate user space bindings via
+``tools/net/ynl/pyynl/ynl_gen_c.py``, and drives the structure of netlink
+attributes and operations.
+
+Usage Notes
+-----------
+
+* User space must first enumerate nodes to obtain their IDs.
+* Node IDs are then used for all further queries, such as error counters.
+* The interface supports future extension by adding new node types and
+  additional attributes.
+
+Example: List nodes using pyynl CLI tool
+
+.. code-block:: bash
+
+    ./tools/net/ynl/pyynl/cli.py --spec Documentation/netlink/specs/drm_ras.yaml --dump list-nodes
+    [{'device-name': '03:00.0',
+      'node-id': 0,
+      'node-name': 'tile0-gt0-correctable',
+      'node-type': 'error-counter'},
+     {'device-name': '03:00.0',
+      'node-id': 1,
+      'node-name': 'tile0-gt1-uncorrectable',
+      'node-type': 'error-counter'},
+     {'device-name': '03:00.0',
+     'node-id': 2,
+     'node-name': 'soc-uncorrectable',
+     'node-type': 'error-counter'}]
+
+Example: List all error counters using pyynl CLI tool
+
+.. code-block:: bash
+
+    ./tools/net/ynl/pyynl/cli.py --spec Documentation/netlink/specs/drm_ras.yaml --dump get-error-counters --json '{"node-id":0}'
+    [{'error-id': 0, 'error-name': 'correctable-l3', 'error-value': 0},
+     {'error-id': 3, 'error-name': 'correctable-sampler', 'error-value': 0}]
+
+    ./tools/net/ynl/pyynl/cli.py --spec Documentation/netlink/specs/drm_ras.yaml --dump get-error-counters --json '{"node-id":1}'
+    [{'error-id': 13, 'error-name': 'correctable-l3', 'error-value': 0},
+     {'error-id': 17, 'error-name': 'correctable-sampler', 'error-value': 0}]
+
+Example: Query an error counter for a given node
+
+.. code-block:: bash
+
+    ./tools/net/ynl/pyynl/cli.py --spec Documentation/netlink/specs/drm_ras.yaml --do query-error-counter --json '{"node-id": 0, "error-id": 0}'
+    {'error-id': 0, 'error-name': 'correctable-l3', 'error-value': 0}
+
diff --git a/Documentation/netlink/specs/drm_ras.yaml b/Documentation/netlink/specs/drm_ras.yaml
new file mode 100644
index 000000000000..be0e379c5bc9
--- /dev/null
+++ b/Documentation/netlink/specs/drm_ras.yaml
@@ -0,0 +1,130 @@
+# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
+---
+name: drm-ras
+protocol: genetlink
+uapi-header: drm/drm_ras.h
+
+doc: >-
+  DRM RAS (Reliability, Availability, Serviceability) over Generic Netlink.
+  Provides a standardized mechanism for DRM drivers to register "nodes"
+  representing hardware/software components capable of reporting error counters.
+  Userspace tools can query the list of nodes or individual error counters
+  via the Generic Netlink interface.
+
+definitions:
+  -
+    type: enum
+    name: node-type
+    value-start: 1
+    entries: [error-counter]
+    doc: >-
+         Type of the node. Currently, only error-counter nodes are
+         supported, which expose reliability counters for a hardware/software
+         component.
+
+attribute-sets:
+  -
+    name: node-attrs
+    attributes:
+      -
+        name: node-id
+        type: u32
+        doc: >-
+             Unique identifier for the node.
+             Assigned dynamically by the DRM RAS core upon registration.
+      -
+        name: device-name
+        type: string
+        doc: >-
+             Device name chosen by the driver at registration.
+             Can be a PCI BDF, UUID, or module name if unique.
+      -
+        name: node-name
+        type: string
+        doc: >-
+             Node name chosen by the driver at registration.
+             Can be an IP block name, or any name that identifies the
+             RAS node inside the device.
+      -
+        name: node-type
+        type: u32
+        doc: Type of this node, identifying its function.
+        enum: node-type
+  -
+    name: error-counter-attrs
+    attributes:
+      -
+        name: node-id
+        type: u32
+        doc:  Node ID targeted by this error counter operation.
+      -
+        name: error-id
+        type: u32
+        doc: Unique identifier for a specific error counter within an node.
+      -
+        name: error-name
+        type: string
+        doc: Name of the error.
+      -
+        name: error-value
+        type: u32
+        doc: Current value of the requested error counter.
+
+operations:
+  list:
+    -
+      name: list-nodes
+      doc: >-
+           Retrieve the full list of currently registered DRM RAS nodes.
+           Each node includes its dynamically assigned ID, name, and type.
+           **Important:** User space must call this operation first to obtain
+           the node IDs. These IDs are required for all subsequent
+           operations on nodes, such as querying error counters.
+      attribute-set: node-attrs
+      flags: [admin-perm]
+      dump:
+        reply:
+          attributes:
+            - node-id
+            - device-name
+            - node-name
+            - node-type
+    -
+      name: get-error-counters
+      doc: >-
+           Retrieve the full list of error counters for a given node.
+           The response include the id, the name, and even the current
+           value of each counter.
+      attribute-set: error-counter-attrs
+      flags: [admin-perm]
+      dump:
+        request:
+          attributes:
+            - node-id
+        reply:
+          attributes:
+            - error-id
+            - error-name
+            - error-value
+    -
+      name: query-error-counter
+      doc: >-
+           Query the information of a specific error counter for a given node.
+           Users must provide the node ID and the error counter ID.
+           The response contains the id, the name, and the current value
+           of the counter.
+      attribute-set: error-counter-attrs
+      flags: [admin-perm]
+      do:
+        request:
+          attributes:
+            - node-id
+            - error-id
+        reply:
+          attributes:
+            - error-id
+            - error-name
+            - error-value
+
+kernel-family:
+  headers: ["drm/drm_ras_nl.h"]
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index fda170730468..2043de78813d 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -130,6 +130,15 @@ config DRM_PANIC_SCREEN_QR_VERSION
 	  Smaller QR code are easier to read, but will contain less debugging
 	  data. Default is 40.
 
+config DRM_RAS
+	bool "DRM RAS support"
+	depends on DRM
+	help
+	  Enables the DRM RAS (Reliability, Availability and Serviceability)
+	  support for DRM drivers. This provides a Generic Netlink interface
+	  for error reporting and queries.
+	  If in doubt, say "N".
+
 config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
         bool "Enable refcount backtrace history in the DP MST helpers"
 	depends on STACKTRACE_SUPPORT
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 4b2f7d794275..31cdf98f09ce 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -93,6 +93,7 @@ drm-$(CONFIG_DRM_ACCEL) += ../../accel/drm_accel.o
 drm-$(CONFIG_DRM_PANIC) += drm_panic.o
 drm-$(CONFIG_DRM_DRAW) += drm_draw.o
 drm-$(CONFIG_DRM_PANIC_SCREEN_QR_CODE) += drm_panic_qr.o
+drm-$(CONFIG_DRM_RAS) += drm_ras.o drm_ras_nl.o drm_ras_genl_family.o
 obj-$(CONFIG_DRM)	+= drm.o
 
 obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 8e3cb08241c8..96841b5c0b9d 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -53,6 +53,7 @@
 #include <drm/drm_panic.h>
 #include <drm/drm_print.h>
 #include <drm/drm_privacy_screen_machine.h>
+#include <drm/drm_ras_genl_family.h>
 
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
@@ -1220,6 +1221,7 @@ static const struct file_operations drm_stub_fops = {
 
 static void drm_core_exit(void)
 {
+	drm_ras_genl_family_unregister();
 	drm_privacy_screen_lookup_exit();
 	drm_panic_exit();
 	accel_core_exit();
@@ -1258,6 +1260,10 @@ static int __init drm_core_init(void)
 
 	drm_privacy_screen_lookup_init();
 
+	ret = drm_ras_genl_family_register();
+	if (ret < 0)
+		goto error;
+
 	drm_core_init_complete = true;
 
 	DRM_DEBUG("Initialized\n");
diff --git a/drivers/gpu/drm/drm_ras.c b/drivers/gpu/drm/drm_ras.c
new file mode 100644
index 000000000000..975b3d197edc
--- /dev/null
+++ b/drivers/gpu/drm/drm_ras.c
@@ -0,0 +1,357 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/netdevice.h>
+#include <linux/xarray.h>
+#include <net/genetlink.h>
+
+#include <drm/drm_ras.h>
+
+/**
+ * DOC: DRM RAS Node Management
+ *
+ * This module provides the infrastructure to manage RAS (Reliability,
+ * Availability, and Serviceability) nodes for DRM drivers. Each
+ * DRM driver may register one or more RAS nodes, which represent
+ * logical components capable of reporting error counters and other
+ * reliability metrics.
+ *
+ * The nodes are stored in a global xarray `drm_ras_xa` to allow
+ * efficient lookup by ID. Nodes can be registered or unregistered
+ * dynamically at runtime.
+ *
+ * A Generic Netlink family `drm_ras` exposes two main operations to
+ * userspace:
+ *
+ * 1. LIST_NODES: Dump all currently registered RAS nodes.
+ *    The user receives an array of node IDs, names, and types.
+ *
+ * 2. GET_ERROR_COUNTERS: Dump all error counters of a given node.
+ *    The user receives an array of error IDs, names, and current value.
+ *
+ * 3. QUERY_ERROR_COUNTER: Query a specific error counter for a given node.
+ *    Userspace must provide the node ID and the counter ID, and
+ *    receives the ID, the error name, and its current value.
+ *
+ * Node registration:
+ * - drm_ras_node_register(): Registers a new node and assigns
+ *   it a unique ID in the xarray.
+ * - drm_ras_node_unregister(): Removes a previously registered
+ *   node from the xarray.
+ *
+ * Node type:
+ * - ERROR_COUNTER:
+ *     + Currently, only error counters are supported.
+ *     + The driver must implement the query_error_counter() callback to provide
+ *       the name and the value of the error counter.
+ *     + The driver must provide a error_counter_range.last value informing the
+ *       last valid error ID.
+ *     + The driver can provide a error_counter_range.first value informing the
+ *       frst valid error ID.
+ *     + The error counters in the driver doesn't need to be contiguous, but the
+ *       driver must return -ENOENT to the query_error_counter as an indication
+ *       that the ID should be skipped and not listed in the netlink API.
+ *
+ * Netlink handlers:
+ * - drm_ras_nl_list_nodes_dumpit(): Implements the LIST_NODES
+ *   operation, iterating over the xarray.
+ * - drm_ras_nl_get_error_counters_dumpit(): Implements the GET_ERROR_COUNTERS
+ *   operation, iterating over the know valid error_counter_range.
+ * - drm_ras_nl_query_error_counter_doit(): Implements the QUERY_ERROR_COUNTER
+ *   operation, fetching a counter value from a specific node.
+ */
+
+static DEFINE_XARRAY_ALLOC(drm_ras_xa);
+
+/*
+ * The netlink callback context carries dump state across multiple dumpit calls
+ */
+struct drm_ras_ctx {
+	/* Which xarray id to restart the dump from */
+	unsigned long restart;
+};
+
+/**
+ * drm_ras_nl_list_nodes_dumpit() - Dump all registered RAS nodes
+ * @skb: Netlink message buffer
+ * @cb: Callback context for multi-part dumps
+ *
+ * Iterates over all registered RAS nodes in the global xarray and appends
+ * their attributes (ID, name, type) to the given netlink message buffer.
+ * Uses @cb->ctx to track progress in case the message buffer fills up, allowing
+ * multi-part dump support. On buffer overflow, updates the context to resume
+ * from the last node on the next invocation.
+ *
+ * Return: 0 if all nodes fit in @skb, number of bytes added to @skb if
+ *          the buffer filled up (requires multi-part continuation), or
+ *          a negative error code on failure.
+ */
+int drm_ras_nl_list_nodes_dumpit(struct sk_buff *skb,
+				 struct netlink_callback *cb)
+{
+	struct drm_ras_ctx *ctx = (void *)cb->ctx;
+	struct drm_ras_node *node;
+	struct nlattr *hdr;
+	unsigned long id;
+	int ret;
+
+	xa_for_each(&drm_ras_xa, id, node) {
+		if (id < ctx->restart)
+			continue;
+
+		hdr = genlmsg_put(skb, NETLINK_CB(cb->skb).portid,
+				  cb->nlh->nlmsg_seq,
+				  &drm_ras_nl_family, NLM_F_MULTI,
+				  DRM_RAS_CMD_LIST_NODES);
+		if (!hdr) {
+			ret = -EMSGSIZE;
+			break;
+		}
+
+		ret = nla_put_u32(skb, DRM_RAS_A_NODE_ATTRS_NODE_ID, node->id);
+		if (ret) {
+			genlmsg_cancel(skb, hdr);
+			break;
+		}
+
+		ret = nla_put_string(skb, DRM_RAS_A_NODE_ATTRS_DEVICE_NAME,
+				     node->device_name);
+		if (ret) {
+			genlmsg_cancel(skb, hdr);
+			break;
+		}
+
+		ret = nla_put_string(skb, DRM_RAS_A_NODE_ATTRS_NODE_NAME,
+				     node->node_name);
+		if (ret) {
+			genlmsg_cancel(skb, hdr);
+			break;
+		}
+
+		ret = nla_put_u32(skb, DRM_RAS_A_NODE_ATTRS_NODE_TYPE,
+				  node->type);
+		if (ret) {
+			genlmsg_cancel(skb, hdr);
+			break;
+		}
+
+		genlmsg_end(skb, hdr);
+	}
+
+	if (ret == -EMSGSIZE) {
+		ctx->restart = id;
+		return skb->len;
+	}
+
+	return ret;
+}
+
+static int get_node_error_counter(u32 node_id, u32 error_id,
+				  const char **name, u32 *value)
+{
+	struct drm_ras_node *node;
+
+	node = xa_load(&drm_ras_xa, node_id);
+	if (!node || !node->query_error_counter)
+		return -ENOENT;
+
+	if (error_id < node->error_counter_range.first ||
+	    error_id > node->error_counter_range.last)
+		return -EINVAL;
+
+	return node->query_error_counter(node, error_id, name, value);
+}
+
+static int msg_reply_value(struct sk_buff *msg, u32 error_id,
+			   const char *error_name, u32 value)
+{
+	int ret;
+
+	ret = nla_put_u32(msg, DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID, error_id);
+	if (ret)
+		return ret;
+
+	ret = nla_put_string(msg, DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_NAME,
+			     error_name);
+	if (ret)
+		return ret;
+
+	return nla_put_u32(msg, DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE,
+			   value);
+}
+
+static int doit_reply_value(struct genl_info *info, u32 node_id,
+			    u32 error_id)
+{
+	struct sk_buff *msg;
+	struct nlattr *hdr;
+	const char *error_name;
+	u32 value;
+	int ret;
+
+	msg = genlmsg_new(NLMSG_GOODSIZE, GFP_KERNEL);
+	if (!msg)
+		return -ENOMEM;
+	hdr = genlmsg_put_reply(msg, info, &drm_ras_nl_family, 0,
+				DRM_RAS_CMD_QUERY_ERROR_COUNTER);
+	if (!hdr) {
+		nlmsg_free(msg);
+		return -EMSGSIZE;
+	}
+
+	ret = get_node_error_counter(node_id, error_id,
+				     &error_name, &value);
+	if (ret)
+		return ret;
+
+	ret = msg_reply_value(msg, error_id, error_name, value);
+	if (ret)
+		return ret;
+
+	genlmsg_end(msg, hdr);
+
+	return genlmsg_reply(msg, info);
+}
+
+/**
+ * drm_ras_nl_get_error_counters_dumpit() - Dump all Error Counters
+ * @skb: Netlink message buffer
+ * @cb: Callback context for multi-part dumps
+ *
+ * Iterates over all error counters in a given Node and appends
+ * their attributes (ID, name, value) to the given netlink message buffer.
+ * Uses @cb->ctx to track progress in case the message buffer fills up, allowing
+ * multi-part dump support. On buffer overflow, updates the context to resume
+ * from the last node on the next invocation.
+ *
+ * Return: 0 if all errors fit in @skb, number of bytes added to @skb if
+ *          the buffer filled up (requires multi-part continuation), or
+ *          a negative error code on failure.
+ */
+int drm_ras_nl_get_error_counters_dumpit(struct sk_buff *skb,
+					 struct netlink_callback *cb)
+{
+	const struct genl_info *info = genl_info_dump(cb);
+	struct drm_ras_ctx *ctx = (void *)cb->ctx;
+	struct drm_ras_node *node;
+	struct nlattr *hdr;
+	const char *error_name;
+	u32 node_id, error_id, value;
+	int ret;
+
+	if (!info->attrs || !info->attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID])
+		return -EINVAL;
+
+	node_id = nla_get_u32(info->attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID]);
+
+	node = xa_load(&drm_ras_xa, node_id);
+	if (!node)
+		return -ENOENT;
+
+	for (error_id = max(node->error_counter_range.first, ctx->restart);
+	     error_id <= node->error_counter_range.last;
+	     error_id++) {
+		ret = get_node_error_counter(node_id, error_id,
+					     &error_name, &value);
+		/*
+		 * For non-contiguous range, driver return -ENOENT as indication
+		 * to skip this ID when listing all errors.
+		 */
+		if (ret == -ENOENT)
+			continue;
+		if (ret)
+			return ret;
+
+		hdr = genlmsg_put(skb, NETLINK_CB(cb->skb).portid,
+				  cb->nlh->nlmsg_seq,
+				  &drm_ras_nl_family, NLM_F_MULTI,
+				  DRM_RAS_CMD_GET_ERROR_COUNTERS);
+		if (!hdr) {
+			ret = -EMSGSIZE;
+			break;
+		}
+
+		ret = msg_reply_value(skb, error_id, error_name, value);
+		if (ret)
+			break;
+
+		genlmsg_end(skb, hdr);
+	}
+
+	if (ret == -EMSGSIZE) {
+		ctx->restart = error_id;
+		return skb->len;
+	}
+
+	return ret;
+}
+
+/**
+ * drm_ras_nl_query_error_counter_doit() - Query an error counter of an node
+ * @skb: Netlink message buffer
+ * @info: Generic Netlink info containing attributes of the request
+ *
+ * Extracts the node ID and error ID from the netlink attributes and
+ * retrieves the current value of the corresponding error counter. Sends the
+ * result back to the requesting user via the standard Genl reply.
+ *
+ * Return: 0 on success, or negative errno on failure.
+ */
+int drm_ras_nl_query_error_counter_doit(struct sk_buff *skb,
+					struct genl_info *info)
+{
+	u32 node_id, error_id;
+
+	if (!info->attrs ||
+	    !info->attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID] ||
+	    !info->attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID])
+		return -EINVAL;
+
+	node_id = nla_get_u32(info->attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID]);
+	error_id = nla_get_u32(info->attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID]);
+
+	return doit_reply_value(info, node_id, error_id);
+}
+
+/**
+ * drm_ras_node_register() - Register a new RAS node
+ * @node: Node structure to register
+ *
+ * Adds the given RAS node to the global node xarray and assigns it
+ * a unique ID. Both @node->name and @node->type must be valid.
+ *
+ * Return: 0 on success, or negative errno on failure:
+ */
+int drm_ras_node_register(struct drm_ras_node *node)
+{
+	if (!node->device_name || !node->node_name)
+		return -EINVAL;
+
+	/* Currently, only Error Counter Endpoinnts are supported */
+	if (node->type != DRM_RAS_NODE_TYPE_ERROR_COUNTER)
+		return -EINVAL;
+
+	/* Mandatorty entries for Error Counter Node */
+	if (node->type == DRM_RAS_NODE_TYPE_ERROR_COUNTER &&
+	    (!node->error_counter_range.last || !node->query_error_counter))
+		return -EINVAL;
+
+	return xa_alloc(&drm_ras_xa, &node->id, node, xa_limit_32b, GFP_KERNEL);
+}
+EXPORT_SYMBOL(drm_ras_node_register);
+
+/**
+ * drm_ras_node_unregister() - Unregister a previously registered node
+ * @node: Node structure to unregister
+ *
+ * Removes the given node from the global node xarray using its ID.
+ */
+void drm_ras_node_unregister(struct drm_ras_node *node)
+{
+	xa_erase(&drm_ras_xa, node->id);
+}
+EXPORT_SYMBOL(drm_ras_node_unregister);
diff --git a/drivers/gpu/drm/drm_ras_genl_family.c b/drivers/gpu/drm/drm_ras_genl_family.c
new file mode 100644
index 000000000000..2d818b8c3808
--- /dev/null
+++ b/drivers/gpu/drm/drm_ras_genl_family.c
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <drm/drm_ras_genl_family.h>
+#include <drm/drm_ras_nl.h>
+
+/* Track family registration so the drm_exit can be called at any time */
+static bool registered;
+
+/**
+ * drm_ras_genl_family_register() - Register drm-ras genl family
+ *
+ * Only to be called one at drm_drv_init()
+ */
+int drm_ras_genl_family_register(void)
+{
+	int ret;
+
+	registered = false;
+
+	ret = genl_register_family(&drm_ras_nl_family);
+	if (ret)
+		return ret;
+
+	registered = true;
+	return 0;
+}
+
+/**
+ * drm_ras_genl_family_unregister() - Unregister drm-ras genl family
+ *
+ * To be called one at drm_drv_exit() at any moment, but only once.
+ */
+void drm_ras_genl_family_unregister(void)
+{
+	if (registered) {
+		genl_unregister_family(&drm_ras_nl_family);
+		registered = false;
+	}
+}
diff --git a/drivers/gpu/drm/drm_ras_nl.c b/drivers/gpu/drm/drm_ras_nl.c
new file mode 100644
index 000000000000..fcd1392410e4
--- /dev/null
+++ b/drivers/gpu/drm/drm_ras_nl.c
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
+/* Do not edit directly, auto-generated from: */
+/*	Documentation/netlink/specs/drm_ras.yaml */
+/* YNL-GEN kernel source */
+
+#include <net/netlink.h>
+#include <net/genetlink.h>
+
+#include <uapi/drm/drm_ras.h>
+#include <drm/drm_ras_nl.h>
+
+/* DRM_RAS_CMD_GET_ERROR_COUNTERS - dump */
+static const struct nla_policy drm_ras_get_error_counters_nl_policy[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID + 1] = {
+	[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID] = { .type = NLA_U32, },
+};
+
+/* DRM_RAS_CMD_QUERY_ERROR_COUNTER - do */
+static const struct nla_policy drm_ras_query_error_counter_nl_policy[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID + 1] = {
+	[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID] = { .type = NLA_U32, },
+	[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID] = { .type = NLA_U32, },
+};
+
+/* Ops table for drm_ras */
+static const struct genl_split_ops drm_ras_nl_ops[] = {
+	{
+		.cmd	= DRM_RAS_CMD_LIST_NODES,
+		.dumpit	= drm_ras_nl_list_nodes_dumpit,
+		.flags	= GENL_ADMIN_PERM | GENL_CMD_CAP_DUMP,
+	},
+	{
+		.cmd		= DRM_RAS_CMD_GET_ERROR_COUNTERS,
+		.dumpit		= drm_ras_nl_get_error_counters_dumpit,
+		.policy		= drm_ras_get_error_counters_nl_policy,
+		.maxattr	= DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID,
+		.flags		= GENL_ADMIN_PERM | GENL_CMD_CAP_DUMP,
+	},
+	{
+		.cmd		= DRM_RAS_CMD_QUERY_ERROR_COUNTER,
+		.doit		= drm_ras_nl_query_error_counter_doit,
+		.policy		= drm_ras_query_error_counter_nl_policy,
+		.maxattr	= DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
+		.flags		= GENL_ADMIN_PERM | GENL_CMD_CAP_DO,
+	},
+};
+
+struct genl_family drm_ras_nl_family __ro_after_init = {
+	.name		= DRM_RAS_FAMILY_NAME,
+	.version	= DRM_RAS_FAMILY_VERSION,
+	.netnsok	= true,
+	.parallel_ops	= true,
+	.module		= THIS_MODULE,
+	.split_ops	= drm_ras_nl_ops,
+	.n_split_ops	= ARRAY_SIZE(drm_ras_nl_ops),
+};
diff --git a/include/drm/drm_ras.h b/include/drm/drm_ras.h
new file mode 100644
index 000000000000..bba47a282ef8
--- /dev/null
+++ b/include/drm/drm_ras.h
@@ -0,0 +1,76 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef __DRM_RAS_H__
+#define __DRM_RAS_H__
+
+#include "drm_ras_nl.h"
+
+/**
+ * struct drm_ras_node - A DRM RAS Node
+ */
+struct drm_ras_node {
+	/** @id: Unique identifier for the node. Dynamically assigned. */
+	u32 id;
+	/**
+	 * @device_name: Human-readable name of the device. Given by the driver.
+	 */
+	const char *device_name;
+	/** @node_name: Human-readable name of the node. Given by the driver. */
+	const char *node_name;
+	/** @type: Type of the node (enum drm_ras_node_type). */
+	enum drm_ras_node_type type;
+
+	/* Error-Counter Related Callback and Variables */
+
+	/** @error_counter_range: Range of valid Error IDs for this node. */
+	struct {
+		/** @first: First valid Error ID. */
+		u32 first;
+		/** @last: Last valid Error ID. Mandatory entry. */
+		u32 last;
+	} error_counter_range;
+
+	/**
+	 * @query_error_counter:
+	 *
+	 * This callback is used by drm-ras to query a specific error counter.
+	 * counters supported by this node. Used for input check and to
+	 * iterate in all counters.
+	 *
+	 * Driver should expect query_error_counters() to be called with
+	 * error_id from `error_counter_range.first` to
+	 * `error_counter_range.last`.
+	 *
+	 * The @query_error_counter is a mandatory callback for
+	 * error_counter_node.
+	 *
+	 * Returns: 0 on success,
+	 *          -ENOENT when error_id is not supported as an indication that
+	 *                  drm_ras should silently skip this entry. Used for
+	 *                  supporting non-contiguous error ranges.
+	 *                  Driver is responsible for maintaining the list of
+	 *                  supported error IDs in the range of first to last.
+	 *          Other negative values on errors that should terminate the
+	 *          netlink query.
+	 */
+	int (*query_error_counter)(struct drm_ras_node *ep, u32 error_id,
+				   const char **name, u32 *val);
+
+	/** @priv: Driver private data */
+	void *priv;
+};
+
+struct drm_device;
+
+#if IS_ENABLED(CONFIG_DRM_RAS)
+int drm_ras_node_register(struct drm_ras_node *ep);
+void drm_ras_node_unregister(struct drm_ras_node *ep);
+#else
+static inline int drm_ras_node_register(struct drm_ras_node *ep) { return 0; }
+static inline void drm_ras_node_unregister(struct drm_ras_node *ep) { }
+#endif
+
+#endif
diff --git a/include/drm/drm_ras_genl_family.h b/include/drm/drm_ras_genl_family.h
new file mode 100644
index 000000000000..5931b53429f1
--- /dev/null
+++ b/include/drm/drm_ras_genl_family.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef __DRM_RAS_GENL_FAMILY_H__
+#define __DRM_RAS_GENL_FAMILY_H__
+
+#if IS_ENABLED(CONFIG_DRM_RAS)
+int drm_ras_genl_family_register(void);
+void drm_ras_genl_family_unregister(void);
+#else
+static inline int drm_ras_genl_family_register(void) { return 0; }
+static inline void drm_ras_genl_family_unregister(void) { }
+#endif
+
+#endif
diff --git a/include/drm/drm_ras_nl.h b/include/drm/drm_ras_nl.h
new file mode 100644
index 000000000000..9613b7d9ffdb
--- /dev/null
+++ b/include/drm/drm_ras_nl.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
+/* Do not edit directly, auto-generated from: */
+/*	Documentation/netlink/specs/drm_ras.yaml */
+/* YNL-GEN kernel header */
+
+#ifndef _LINUX_DRM_RAS_GEN_H
+#define _LINUX_DRM_RAS_GEN_H
+
+#include <net/netlink.h>
+#include <net/genetlink.h>
+
+#include <uapi/drm/drm_ras.h>
+#include <drm/drm_ras_nl.h>
+
+int drm_ras_nl_list_nodes_dumpit(struct sk_buff *skb,
+				 struct netlink_callback *cb);
+int drm_ras_nl_get_error_counters_dumpit(struct sk_buff *skb,
+					 struct netlink_callback *cb);
+int drm_ras_nl_query_error_counter_doit(struct sk_buff *skb,
+					struct genl_info *info);
+
+extern struct genl_family drm_ras_nl_family;
+
+#endif /* _LINUX_DRM_RAS_GEN_H */
diff --git a/include/uapi/drm/drm_ras.h b/include/uapi/drm/drm_ras.h
new file mode 100644
index 000000000000..3415ba345ac8
--- /dev/null
+++ b/include/uapi/drm/drm_ras.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
+/* Do not edit directly, auto-generated from: */
+/*	Documentation/netlink/specs/drm_ras.yaml */
+/* YNL-GEN uapi header */
+
+#ifndef _UAPI_LINUX_DRM_RAS_H
+#define _UAPI_LINUX_DRM_RAS_H
+
+#define DRM_RAS_FAMILY_NAME	"drm-ras"
+#define DRM_RAS_FAMILY_VERSION	1
+
+/*
+ * Type of the node. Currently, only error-counter nodes are supported, which
+ * expose reliability counters for a hardware/software component.
+ */
+enum drm_ras_node_type {
+	DRM_RAS_NODE_TYPE_ERROR_COUNTER = 1,
+};
+
+enum {
+	DRM_RAS_A_NODE_ATTRS_NODE_ID = 1,
+	DRM_RAS_A_NODE_ATTRS_DEVICE_NAME,
+	DRM_RAS_A_NODE_ATTRS_NODE_NAME,
+	DRM_RAS_A_NODE_ATTRS_NODE_TYPE,
+
+	__DRM_RAS_A_NODE_ATTRS_MAX,
+	DRM_RAS_A_NODE_ATTRS_MAX = (__DRM_RAS_A_NODE_ATTRS_MAX - 1)
+};
+
+enum {
+	DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID = 1,
+	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
+	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_NAME,
+	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE,
+
+	__DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX,
+	DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX = (__DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX - 1)
+};
+
+enum {
+	DRM_RAS_CMD_LIST_NODES = 1,
+	DRM_RAS_CMD_GET_ERROR_COUNTERS,
+	DRM_RAS_CMD_QUERY_ERROR_COUNTER,
+
+	__DRM_RAS_CMD_MAX,
+	DRM_RAS_CMD_MAX = (__DRM_RAS_CMD_MAX - 1)
+};
+
+#endif /* _UAPI_LINUX_DRM_RAS_H */
-- 
2.51.0

