Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA259B03B00
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 11:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9721410E438;
	Mon, 14 Jul 2025 09:40:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k/PqFGp2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D0CB10E43E;
 Mon, 14 Jul 2025 09:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752486026; x=1784022026;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=y7LmAv9k9b8SseUCjaCzc4oMWwzRJUvQ4O7y4y4p51k=;
 b=k/PqFGp23b2p2LQtGqQ0a5wOcT81UeiiPTIc8FYZW8PdgF08kgvBzpMr
 N3JL7hHeuu/b7riSRCuhzckn617+eMDQzkUKwWojTsRl4LtIpINH0KR4k
 ga4GoM24nqe47P4r3vGC5wG8srOyT7L8nzezVwdPvza2yCm6OjZCoWM13
 HHVzk8wb2lIGST/tHrzS48ULDarUvqF5oDoP4SSMCJLhq/DaVIT6+pvCb
 Us2IsyuJ8RIhSeGKKJhj+G19AWYt40kF/R4dmBOrUY+mYX4anIbAOSMda
 yfTUE/9G4rgq8aaZeSyn9MxS/0TPay8noSciS9MeMWjrKl1i28mb219S3 Q==;
X-CSE-ConnectionGUID: hGp/FDIzQ+WJy/rB6Z+5dQ==
X-CSE-MsgGUID: sVPEIgsHShKcEo+rcTMJYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="66030736"
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; d="scan'208";a="66030736"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 02:40:26 -0700
X-CSE-ConnectionGUID: WVLl7qHLS5Svj0uhAHWKgA==
X-CSE-MsgGUID: dZk7S8QWTj2tp3IL4hcOug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; d="scan'208";a="161194356"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 02:40:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 02:40:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 14 Jul 2025 02:40:25 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.46)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 02:40:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CWRh2q4pP14G6ReGpdXjQZRUDF9W0nHPiSr+YqX2Ij51SbG94feXiQAbw2+QUmEJK+uKuSRoOeuODmdR4/4sWE1P3sC2Tvob92QWsu5GVDJsGsXL1wnyux4Z0AyliEayHxG3fSw8bHsPVSkbfSyvq1XFmBRPFdoalJZ9LFSsyDPxgtfgrIyph+OK0Bv/hnJwXhV6vWHaa57ELnSLRhc41LUxSi6taMRKt75g8r4qEsZ4hDOaldbdfpNLVmR4aXjKPfKOompA4QYhGWNemasHuzA6PQWIo7ceVRTtNwZ5CxzGTNRvP0fvFOVs+6BoYs53r0Rf+S6YZaUNQfki63oPEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7FhW/Q7O0QWBKGXGlM8KR6owU2RRthV8sogi/lLnO/M=;
 b=F6A+UP3FK4Uihs/K/lUlMvOylTXJN/oIHQDtWGg+bSavgzYJ4zO0Ni+Z9NKEGeG90iOcBU2TUrUQIZ6mZ7EsXW55r+wgqMfuOiq6aHedATBEi5dXvcCG806YiXSNAaNOBxEyNGnjVjuj3nxqJtuknwc4MegqbXRYpSX6YK9C1cLY26Z8HyGEGycW5Xk6hxSr4OyhnoLJpZ41CPTzG6+YE1t5hklgheQAEpJzT6IOHjB2zaFnZycYKQvt13RpDQ/nPGYGWK+NWTvvqOobFzzS0RZFMS8GcpR5zsq3TZJRTcpB/SjXkQZL9VM8623hIZNER/eT1mnrQsndNakMPFreAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM4PR11MB6262.namprd11.prod.outlook.com (2603:10b6:8:a7::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.29; Mon, 14 Jul 2025 09:39:42 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%6]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 09:39:42 +0000
Date: Mon, 14 Jul 2025 11:39:38 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>
CC: <linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Krzysztof
 =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?=
 <ilpo.jarvinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v10 0/5] PCI: VF resizable BAR
Message-ID: <elpe4ocut5y6otilll2mhf5dwhumstr4z4wt2enetpsbauvcyv@362bhrjmztkm>
References: <20250702093522.518099-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250702093522.518099-1-michal.winiarski@intel.com>
X-ClientProxiedBy: VI1PR06CA0141.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::34) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM4PR11MB6262:EE_
X-MS-Office365-Filtering-Correlation-Id: 972f9e87-8f31-47bd-6a4f-08ddc2ba5be6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QUhzUmxRTkpzeXBqcmpTZUlqeW80VjRMZjZZemFRWTJuemtxOUZpL1k3blNJ?=
 =?utf-8?B?MWN4eGRwc1N1ZXVGL1gzTW5FN3lBNnhlRzI4cjBFZWZ5Z2xKN2JZVytuTzdt?=
 =?utf-8?B?WTZUVkxUazdGM2graXZTbDN2NUx5ZFkwLzRQODY5TkdwV0w1ck1kV3NwdEM5?=
 =?utf-8?B?OXpjL01zVUpmRjgyYllvUXR1aGtDcjh4ZXl0RENTVHlSckx4QXQvS2MzUTcx?=
 =?utf-8?B?U2dtMTFYRmNwZEZZRm0raFlpcWg3dmZsMWVXUllIbGlXeEl6YlBvTE9zMmtE?=
 =?utf-8?B?L2dqTzM2S3VJNjkzL2xNRlNOR01OTUg1ZG0vM25Icjcxcko0dUdUNk9HNkFS?=
 =?utf-8?B?L0J5Uy9ORWpxenZvMU9USzJBcWJEMktCL2s5eThvN05ydkJnUStzR3RMekxD?=
 =?utf-8?B?YjhCSkgvRDR5NDFuS3hlM1NwSnNkL1N0emVJNU1FTnRTaGRad2ZpTThNUkJu?=
 =?utf-8?B?d1NGNkZrK0w4UisydmVEbHZRYjllcG9KeEx3eitvaVVIVDZIQms3SHRQenlS?=
 =?utf-8?B?YXBSUEhScjN4WGlDU1ZpS0NiTnAzalIveFJhbGJiUndOaTVNbVltUDd0a0VO?=
 =?utf-8?B?TW1ad1o5akpFdEl1Nzg5K0lKc1hKUHVRTzZVb2JDSmhmZzlUREorSTdrQzhv?=
 =?utf-8?B?UVVTRTFvbWhFaDBDdW1TVk1abHJ2V3JKOFlQUG1nOWM0T0c2cHBmWWVIaDhI?=
 =?utf-8?B?eVp4WEtWWFJ3b3pXbC9YeWJoWm4ydWEwNTJ5ME5HZ2ExY083QVdTdkN4RUtJ?=
 =?utf-8?B?VHVpcWZGYUxTc0dFZXhENTF1Ukp3N0xmdURIaXYvZEdsU3BheEtiYXVtMjlN?=
 =?utf-8?B?dk5vUGxROHZkR1E3akJhb3lsdzZwU1doT1ZTRHBOeHdKNS9jdzJ0WXAzalBM?=
 =?utf-8?B?b2ptR1pjV1RWUmdzS3dmZmEvNDZDRVZ2NGJjeEJwLytXcUpiN3VTUTNWNEZp?=
 =?utf-8?B?OTdFMTJSWHR2MGZhcTB4NnJJTi9oVzBrYjJmYjhIK3RQNHVhSkliam0xWUxC?=
 =?utf-8?B?VzVvc3UzZ1pHNFg0N2M1NnFVMXQxaDRLWDFpWnJUTGZGc2g4MWdUdXEwUUdQ?=
 =?utf-8?B?Q280MjRNZVFDc09nbU1iWlNmdE1YZkFoRGpROFp5Mlk5OXNTbXV2aVFsRk1m?=
 =?utf-8?B?SjFnK0graUU2K0lxc3F2YnV6ZnNsd1F0TUZVVlQrYnkyVWl6ak4rbU1kMVlB?=
 =?utf-8?B?T01KSVJCa1E3alpKejhrMXNHdWlYTkgvd0N1SVViWGtJbUFxTzNmaUUxcUpY?=
 =?utf-8?B?WCt2a1gwL0tCSCtDWXpleHFOSm1HWjJYd2lETTdBYXFsUmkyeUFOVENjbHRM?=
 =?utf-8?B?T0NFT05PdDk4dDNKeWZJTzV4blZRNVZDNm9vQXVLWG8yN3NRMEFFS1RzVktR?=
 =?utf-8?B?c0Z2dlhJRjdDdHgrZ1AxRkdHMGhQenQyYmJYMS9oaVFCelFPbWV5dEJoWVI4?=
 =?utf-8?B?QzlkRW1xNXVYaytJTVFZZ042QlA5emp6M2dSN0pUWWFJNzlJa2NzZ0xOQ25l?=
 =?utf-8?B?Zm1wMTVUaG9veUxUVzVWSEo1RWJhMk1RWXBiZkFOU3FGQjR1OXl2UVV0bUxk?=
 =?utf-8?B?bGlmSVpIMzBmRTY0bGRlK3ZCMDloMVh3MVAxUGFTQjlIeHExMi9RSXc1NHI0?=
 =?utf-8?B?cUx1Tk5SNkFkUEVNdE1OSzdSd2p1Mnh4QUxVVW9La3J5ZjFmbFRYNlVSd1ow?=
 =?utf-8?B?RGh4TVVUZHgrb2xUalZGWXVrZTFuRGJnM1hJTFluWG5Cd0UzR1BnTjQ0VkpW?=
 =?utf-8?B?R0o2azBQTll0aWRoVUV2QndYKy81VU1OZ3RpOGR1cW1Dczh5WlpwT2NQbS9F?=
 =?utf-8?B?TFVOT1BxRkFkTUoxMWVMQXZlU2M4YUNxQ1lOZ0VMUklMT3FhdTY3MGJOaXJU?=
 =?utf-8?B?T0dTSmdTeVlscUZ1cmhDZE5kUGNIVFA4WVBRMFhmbERYWHlTUXpIQTd2SSt2?=
 =?utf-8?Q?62nhUY+ZYKg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXJ6YTVkRnVEUkFOU2NZU0x5ZzQ1UWsxZUxadGt6dWl0L2ZpRGU5YmliMTVi?=
 =?utf-8?B?czNQZU5reTc0QThYbDh0ZjUwUnh4ZCs0OHJFVDFKNWo2dDRLKzcxODJoZkxj?=
 =?utf-8?B?Y2lzSUJIZktFN01zakdPanpXV1J5dE9oNFJMSXJVa1VTMXREaVh1cm4vR2pP?=
 =?utf-8?B?dzlZMnZFSmVEeklNR3Z6UDZMVjduV054UXFzckIrNTFqWUZoN1NOSVBkOU1T?=
 =?utf-8?B?VEI2cFBISGEzRHdCdGE2YmMrMmF6YlRqR2hsSXRVY0VtWGZCS1E0VVh1ejBJ?=
 =?utf-8?B?ZmZJVllhWmhVbEJjZzZSL0RZaDByeVljb2N2UVFHTVlJdElqMkNQSVE0QzNw?=
 =?utf-8?B?ZGRiRE4wR3JzRG5pTlpIaUZONWZHaDNxWHhvV3RweW03SGhSazRyZWxvMmRp?=
 =?utf-8?B?MDJMTDFVd3liWkJPRGpybmwzbk81WmRaeGFTZm1OY24vNi9jZWJuVTZ3M2tm?=
 =?utf-8?B?dHJQd2UwQllJRTdYWnUzS0hpOVk1UjlTZ3kyUEo3aFE2K1FSa1RHTm1wOTc2?=
 =?utf-8?B?NWFCMlo2cWFGbXRLQUdkZFdKQlZqWFIzM2dRK1MzSWxVOW9UQ2NzeDhwbWVj?=
 =?utf-8?B?Q01FdG4yM1hDSnBYM1NQemlkV0VhWVZlamJVZzJ0Y2pDT1RSMGhWL2kvMVFV?=
 =?utf-8?B?TGc0cm96bzQ0L1pnS0ZyUjNyOHJTdHcvWVZhUi9uQ1N3aE4rSEdYQXZLQ013?=
 =?utf-8?B?d2FVMnRNRkZxV0czRDVEc083ajAwZHhvT1hNdGtUUGkyVENVZUVLZHRWNE40?=
 =?utf-8?B?NmtxZkdEMWJmWDZKcTMwcExEem1IQnBMWGhURjNscUU4RnpJOFVhcVRGNm9Y?=
 =?utf-8?B?SC84MTg1dFdyVXVrMGY1Y1VtQnd4bDhUVjZHbTFUS296bGpyQ0tpUzhWK2pR?=
 =?utf-8?B?NnM5SDU2TnFnYWtsTnd0SVV6eXh5cFZjeDNzcklkcDY1K3IxcnJZOWQ2MFFK?=
 =?utf-8?B?aWNDei8xemQxM0dUWURucHQ4NGNjTzViL1lxZEtDaTg4dE05eEJ3SUFKbEhY?=
 =?utf-8?B?NUlFZVhqMm5uTko2S25KQ3UvbHBSbVR4b3ZrVFYwRXdCQ0ZrRWtWQVNjdXFC?=
 =?utf-8?B?cWRDT2R3cWR6MmR5RTRnMkhWZG1HM1ZhVThBNG15RU8xdEx2TXBSSkorOU9S?=
 =?utf-8?B?aEJZMzZSekNEbTJVclcrSzdmWXZPbFp0NktPeFhhMEppdVFRS2k1MnppZTVU?=
 =?utf-8?B?ZnYvVGcySHlkclVlY08vRnA0c2VPQWFDRmJza3JmK05XZkt2YzdpQkRqTFVq?=
 =?utf-8?B?SW12ckE2Nys2bFRjWnBLeVpZM0JDRkk3VjFtVXU1dEtCc3FESkNhWEpoZmgv?=
 =?utf-8?B?YS8vS2taMWM0eGNxVWE1N2dPSXpzVG1YUktmcUsvUk0vVGJiNnZuenRVWDJX?=
 =?utf-8?B?YjZTbUdvQ1ZEenZrNjlGaDRabTk1OU84NjdHOEtnQTBteXVDbDBGWHQvWHJV?=
 =?utf-8?B?N2huUHltelM5OXdmQWwzY2Z2bE1weVR1Q1NsbWVJRXlzdFk5L1kxNE5ZMkVE?=
 =?utf-8?B?SjFZZHc3bnEwWFRCZm5qSjRONEo3blZyN25tbnI4b0tiM3ZiOXplWTloMHpF?=
 =?utf-8?B?UkpVakdyaDJaTVU4NUtMRmlmbVk3Vmh2SE1UWkVBSUZJSi9wMHpMdzYwK0ZV?=
 =?utf-8?B?Y2FtZkI5V1dJSmZWTXhZREZwQ04ybkZLbkpxS3hGSlZIcXl4VFFWVUpDZkNX?=
 =?utf-8?B?TXFqWEE3YjJMa2FlTUwvNkxEZkp0M0FQaXRzRGRTc2lNVWROZGFEditsTkRS?=
 =?utf-8?B?WlNETHNMRG5oWUd0ODJqVnQ0dkNNWEYrSGh1ck1tSERsN1k5SS9USTd5MjR4?=
 =?utf-8?B?U3NOenFYM0ZMVDlsS203a3NUakpZOHM2Q2JmZ3ozYlpWQWdlMExPOGdJenhs?=
 =?utf-8?B?ZzcrTS80MUZWSUJhTkhEVDJWeTNoWWxOcTZqYzYzL2pncXJBZUJMK2F3VDZl?=
 =?utf-8?B?V243Y21YV21TRUMvdkFZemRuS0k4R0dPR3d6MVNDNFpZTFNNR0k1R1FzcmxJ?=
 =?utf-8?B?ZTJpTDdBWDdENFVoZjkwZURoSVR0QmF4Y243YTI2RkRsak5LQmVYL3V1a3VP?=
 =?utf-8?B?NDVMYnB4VGZ5TDZKUXg1QmUrRStXQ0VSRTQ2cDNuRUUzR1ZSczZsVjNPb2Nr?=
 =?utf-8?B?NGc1YlRuVk9OcWNNejFZMEthY0RkeksybTlndW5qOUd1ZVE0QW1XZSt6dmpM?=
 =?utf-8?B?ZEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 972f9e87-8f31-47bd-6a4f-08ddc2ba5be6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 09:39:42.0366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nM1DY0k3WphJvZyAYSk6Huww3ZwbBGsdvp5zl3Y9iXDZe4b9pZ+6VnWf+pHYs686P02kBsH1aqD5VNtxldBv3yhkoSnt0AiKZEmLYjz1jOk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6262
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

On Wed, Jul 02, 2025 at 11:35:17AM +0200, Michał Winiarski wrote:
> Hi,
> 
> The series is now reviewed, and it looks like there's no further
> feedback.
> To limit it to PCI subsystem, I removed the last patch in the series, as
> it contained changes in drm/xe driver (it can still be found in v9 for
> reference, and I expect that this single patch will go through DRM tree
> anyways).
> 
> v9 can be found here:
> https://lore.kernel.org/linux-pci/20250527120637.665506-1-michal.winiarski@intel.com/
> 
> For regular BAR, drivers can use pci_resize_resource to resize it to the
> desired size provided that it is supported by the hardware, which the
> driver can query using pci_rebar_get_possible_sizes.
> This series expands the API to work with IOV BAR as well.
> It also adds the additional API for drivers to change the VF BAR size
> without resizing the entire underlying reservation (within the original
> resource boundary).


Hi Bjorn,

Can you consider applying this series?
Or do you still have some comments?

Thanks,
-Michał

> 
> Thanks,
> -Michał
> 
> v9 -> v10:
> - Remove last patch with drm/xe changes
> 
> v8 -> v9:
> - Use u64 as do_div() dividend (LKP)
> - Introduce a helper to access cached vf_rebar_cap (LKP)
> 
> v7 -> v8:
> - Update variable ordering and missing includes (Ilpo)
> 
> v6 -> v7:
> - Eliminate the loop in pci_iov_vf_bar_get_sizes() (Ilpo)
> - Use helper variable for indexes (Ilpo)
> - Kerneldoc formatting (Ilpo)
> - Refer to latest PCI spec (Ilpo)
> - Commit message wording (Ilpo)
> 
> v5 -> v6:
> - Rebased on latest pci/next
> - Cache the VF resizable BAR capability position to avoid multiple
>   lookups (Ilpo)
> - Use pci_resource_n helper (Ilpo)
> 
> v4 -> v5:
> - Rename pci_resource_to/from_iov helpers and add WARN if called without
>   CONFIG_PCI_IOV (Ilpo)
> - Reword kerneldoc for pci_iov_vf_bar_get_sizes (Bjorn)
> - Reword commit message for VF BAR size check, extract the additional
>   size check to separate conditional (Bjorn)
> 
> v3 -> v4:
> - Change the approach to extending the BAR (Christian)
> - Tidy the commit messages, use 80 line limit where necessary (Bjorn)
> - Add kerneldocs to exported functions (Bjorn)
> - Add pci_resource_to_iov() / pci_resource_from_iov() helpers (Ilpo)
> - Use FIELD_GET(), tidy whitespace (Ilpo)
> 
> v2 -> v3:
> - Extract introducing pci_resource_is_iov to separate commit and
>   use it elsewhere in PCI subsystem (Christian)
> - Extract restoring VF rebar state to separate commit (Christian)
> - Reorganize memory decoding check (Christian)
> - Don't use dev_WARN (Ilpo)
> - Fix build without CONFIG_PCI_IOV (CI)
> 
> v1 -> v2:
> - Add pci_iov_resource_extend() and usage in Xe driver
> - Reduce the number of ifdefs (Christian)
> - Drop patch 2/2 from v1 (Christian)
> - Add a helper to avoid upsetting static analysis tools (Krzysztof)
> 
> Michał Winiarski (5):
>   PCI/IOV: Restore VF resizable BAR state after reset
>   PCI: Add a helper to convert between VF BAR number and IOV resource
>   PCI: Allow IOV resources to be resized in pci_resize_resource()
>   PCI/IOV: Check that VF BAR fits within the reservation
>   PCI: Allow drivers to control VF BAR size
> 
>  drivers/pci/iov.c             | 153 +++++++++++++++++++++++++++++++---
>  drivers/pci/pci.c             |   8 +-
>  drivers/pci/pci.h             |  39 +++++++++
>  drivers/pci/setup-bus.c       |   3 +-
>  drivers/pci/setup-res.c       |  35 ++++++--
>  include/linux/pci.h           |   6 ++
>  include/uapi/linux/pci_regs.h |   9 ++
>  7 files changed, 235 insertions(+), 18 deletions(-)
> 
> -- 
> 2.49.0
> 
