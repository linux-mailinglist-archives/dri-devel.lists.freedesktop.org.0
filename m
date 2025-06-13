Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD00AD94FE
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 21:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58F8C10E6E2;
	Fri, 13 Jun 2025 19:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dCSpyrb4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ED7C10E6E2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 19:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749841785; x=1781377785;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=KgQ5XhpeZnJ+DZJ2IvcXY2rFiYEXwSdhjjLu6CeZdk4=;
 b=dCSpyrb468qJ/TW7GCBDYoZujj14W8sS2297y89If1ARZaoflChFyVIb
 1NmpGIvcquFJiYOz1yCXLL4QIKAHQY+5SUUZMhdfe/f4FkQGcy0bU0lqr
 I4s7uAeQhgmiz5xDrtesUMwrQBMwNb75Y/K4qYFdrZDSUfxmF0/RztPTz
 dsoWjvoSZg1jmMCwVxIp+e83vWypBaMugmQVP4VlV4p1tIWL5IPZqnSR5
 uzt7su/6sW1faCoZHSLD8+0Y9Rf31D8WqXUfzZesBPolxge5VWZTTfSy/
 rknhR9T+GE7qUJ2cQ1UL9u+5VZjO+nNc8qjYColOKZjmXMdWoE1/RaN9j Q==;
X-CSE-ConnectionGUID: r5xFfxTlSaqqAAXEIr/SXg==
X-CSE-MsgGUID: fuL0MUXfRg6TZ2CB8dt3og==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="63101572"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="63101572"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 12:09:39 -0700
X-CSE-ConnectionGUID: Wfi/upbXQ7yYp4J/SW3sUQ==
X-CSE-MsgGUID: zWnIlDUQR9SnEeVAMCizAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="152797406"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 12:09:39 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 12:09:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 13 Jun 2025 12:09:37 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.81)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 12:09:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z5n0QiXgh7jsQqYkaeuY2vyIyMP5IInI/J7IC9NmXPohm5loZC1sYTK/Nk7e5Gy12XiNm0E75LWcYFVBHRk/qpAT5sd20JVqcKvMI/J6lcPOZmkVbSgifiIoHcFWD9bbSgZ8Xht1LQZtQubDvQ5umyuvJRh0ptH9vSWNZkVEWDXdSF4GBi1a74lhXbAQV/eemOmyQk9tvLABEBVIFQpJhPUFV7KLoM8nPRT1yHF/qXAoE+tbzQube381XcCkzytjQ+0+0MFI5LWYKExUQedYP9U64DMGSRI64bd2FbbthBFMGKF3b5fMA2wa3DkEZ+V7cmCC4pJ8x97vpN8YiB0ymA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dzYOoJkBGicBbteQkJN56JFSmUKA1HlokTr7fZjO8JM=;
 b=AkUrSUQ90XHrlsWDBVvMU4L2EZlU83+3oQ2miQLlD18HhP7ND4iNzmnlQkpYutXSUddM22ivA9nhU5BK/gCUBXADvBEePKdnXL+QEOccodVXOFUNNpYvMbwdPGcVan6tymbfmeI21oa3kRor1+HcaBrano4Xa9G/to26DltMdImRbqimMRQZVl7pc5PjN2UdbV0FTe9rOI2VsLDh8LVOxTZbXRVpnk+xbT4V5d2f0FO0GZjMmjKyyAmvV1ih4zL38BL0PnWT9p1u1vG6mi0N9YvoeEYCk+lR+Z4prZ9dazejfSnuuACE+8fAUu41diqId/wfrc27j/UthmHtA83cHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7011.namprd11.prod.outlook.com (2603:10b6:930:55::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Fri, 13 Jun
 2025 19:09:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 19:09:35 +0000
Date: Fri, 13 Jun 2025 12:11:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: <dakr@kernel.org>, <pstanner@redhat.com>, <simona.vetter@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: DRM scheduler issue with spsc_queue
Message-ID: <aEx3zmQ4T1n5wdKO@lstrano-desk.jf.intel.com>
References: <aExZdkcnBVvX1DCa@lstrano-desk.jf.intel.com>
 <0b0b8367-abd4-4982-aeec-08f8b95a286a@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0b0b8367-abd4-4982-aeec-08f8b95a286a@amd.com>
X-ClientProxiedBy: MW4PR04CA0167.namprd04.prod.outlook.com
 (2603:10b6:303:85::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7011:EE_
X-MS-Office365-Filtering-Correlation-Id: 6075351b-bbeb-467a-4049-08ddaaadd5bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?LzI1aWQxdk9xakRBNUJPZk5QcmlWcHJHaUIzMFdFSnJsN1NUVStZZnJkd2hU?=
 =?utf-8?B?SXBEbjZvVndpenJNWXlmTGtxRW9wZ2VDVzhTYXhFaC9ZeTdISGYxR2dzcjJx?=
 =?utf-8?B?Z1dlM0tCK3lQdi8wclY2dTBrSEZiTDRiTEZyMlltK0c5ZkR1OFZ5TGM5bmwz?=
 =?utf-8?B?WUZuNzcydlBteG9xekRXZHRkV1JQWXdlT0MyWEtoVG85bWlvOUNoQ0d2MlRR?=
 =?utf-8?B?QlhwY0NEVTlpN00ySkNwVzE4UDhhWUhrek8rNHpPTGRCZUt2Z3RFM0RVTWhV?=
 =?utf-8?B?d1NkYitUQW9DVUg3ajBPUzNKNXFOMk9McTVPaERNQ1ZobUlBSTQxek1kdVdK?=
 =?utf-8?B?T1FYSWdycXJvVmpCZEpPRWNyaTk1d0dUS09rRTFPNXROZlIvYzVRaE9xejVr?=
 =?utf-8?B?QW5acTlYVzA4ZzVQdlFUTmY4THJoSU9zaWkvV1FyRzBLMXEvRlhNOUxib0Fr?=
 =?utf-8?B?YXAvRWl1eHhMTWV6RDdGaDA5MSs4eElWc2NDZ1ZKdjJXMDFHeHVuNFh3Smhi?=
 =?utf-8?B?QlB1ZUxHczFkU1JvUFExZFdST0UxT3FqQ1RjSk1GZkpDZ1VieGZHM1MvajBt?=
 =?utf-8?B?MnUycjkvSStBVmVUTmd3VW1NY1ZOOUJVb2VCLzRrY0dNckd2REw5clhHRUhP?=
 =?utf-8?B?L1p2djNZSlFEWVIxMXpHL0NQeVF2UjJjSzVqdHVTWlg0UGtBZDdxWlFuWmVK?=
 =?utf-8?B?dnJQYU9hTkRZKzJWQ3MrSC90eUpuNHUrdU91Yko4OExxZUIrcWNicHoxREFw?=
 =?utf-8?B?TzYxaXR0TGJ6WUNDUk1TdHVWMFYyOUhwRVFDYStLV0tENm5QQXZRK25rTUpZ?=
 =?utf-8?B?ZVRWWXFtU3EyQldPdXJqU0NUUHdoQmkwL21SaXV5MXBDenVWdmtydStncXJB?=
 =?utf-8?B?ZWVqdDdLTys3VXNFM1JJd083WUFIMVh1dDRkc0lYSVpCdUZ0NS92RnVyQ3dQ?=
 =?utf-8?B?YzM5M0FUQlhJcjVWc2tjN05mNGxYRTZxQUErcUg1Vy9kZk5rNzA2TG1zWFha?=
 =?utf-8?B?QnFNdkpnZXBENzBmdTUzVmgxN2wzcUtqeVczb0ZjNDVyalNLNkRFaUNwTTlG?=
 =?utf-8?B?b0tOK1JQUDErV1ZsQ2F2Zm9RQXVnY1B4T2dHQXBSZFcxZkp3Y0NLcU5xMVgz?=
 =?utf-8?B?N1FxZDhWTHMwWExWd0k4ZXBDNEVJbE9XUnJJZjV0bTlzdjBGdm9DVVJLTlFm?=
 =?utf-8?B?eldLMnhlamI5bVp4SnFEMG82cDV4TVhtR3AzVFVlS0N2SWV2SXBiTWsxbFVF?=
 =?utf-8?B?UzdvK1dLazFzZEU0cXpkVDAxNDBpWVQwUkRpSzFJeDRTNjNKZEtEaEV5RzhX?=
 =?utf-8?B?clJ5NWt6UVp1bUpKSDI4RmlFY1dWZThabXVoejhVNjlUZGtZLytNOXJiQmRF?=
 =?utf-8?B?QS91UVRYV3JsMVNGVE00TERNdkoxaGFSY1NYUC9LZXpPY0Rnd3NMZ1Z1MVA1?=
 =?utf-8?B?TGJURnQwMTRQdTVOMGJJYk9nR3U5RzZvQ0xiRGNmRjJIa0dMbUtGUnNDc3li?=
 =?utf-8?B?ZTFlYzl6UTZJZlBXRDRDZ2x3cHliUHBVczhuRGdjdjBxQ2FWdzRyMVdlOEpK?=
 =?utf-8?B?OXVMdTlKemtyZUl1YUN5anA4MXlsdW9yR240T2NiZ3N1VVFtUjRqL0NjWjA2?=
 =?utf-8?B?bWFuT2ovMm9nU1B2d0VndnJ4YU9XdkUrZXR6VTN6Skw3MG11T0VpVXlQaXZ6?=
 =?utf-8?B?U3ZSY0RMMDRrUUlsUjhtMnc4NFNGWmJaMjFjaDB6MFhSYXhUeUIxVVI2MFow?=
 =?utf-8?B?OTJsaUtPWFZzbThKVnBLcFh0QjNydmRJcURzWDdxMGVFWnNERkxxSzhlU1Va?=
 =?utf-8?B?MElpQ1JGNktIdGM2YXVEaG1FbVBRNUlkOWpiWFF0MHlCYXZmUTl3Q2N2Rlpq?=
 =?utf-8?B?NnJEQkY1SER5NktWbWFoRHdRVXNmNUtrU0plMUlTNHMza0RUQ2Nwc2JNK0Zw?=
 =?utf-8?Q?7OfeFNZOr6M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFNMK1dyUmVMMktQVDh6c1FqSUFyWU81d1lLY2pVRzBSdXVnVEJUTlhwYzRo?=
 =?utf-8?B?bWhrSkxLY3ZTZzltYVNNWlFaL1JDbjRsZHI4QStsWnBCSE1Sc1lTN2tpWmdU?=
 =?utf-8?B?am5JZVl1N096ZXNReDQzQlBJMkFvT2dCN3pwamtHa0lvakw3MmMyU2w3ODZ2?=
 =?utf-8?B?bTJLdWtPY1lESHEwSEVxNFFXaU0xMGZac3YxdmtVa1djTGJvN1E2N3RBd0ZV?=
 =?utf-8?B?SERzY1JUQ3JPWm1WcFF2OW5IeTlWbXUyRW5ySGZCNDN4SlhMOTFhMVFZTExH?=
 =?utf-8?B?blozMEZOMVlJTHFYTDVhVzNXT3R5V1BnMERLeUU3SHQ4K2lTR1BVY2JWTjh6?=
 =?utf-8?B?ME1uQlI4WWFOcC9UdUVlZmsvWmZ6OFJTT014dUt6NGMrZit0L2JCcFgycldG?=
 =?utf-8?B?T2FMRGp6YS8vWXFjZytHUDkrMStnaGcrWGNkRWpzL1E3WURUNUptMExGaEZt?=
 =?utf-8?B?eXdBNm1wU25nSjBQTjFjeXYrck14aFI0L3hXQ0FRTnJ4OHRQWmdnWUxYY1BG?=
 =?utf-8?B?SGF3WjRpOHJNWnlxNGdTZVp2amgxSTV6YmlkV1k5Y1Jzc0tmbXdTbk1KSlpj?=
 =?utf-8?B?NzgzUStIaTdwSFNmbU5KdXQ0UDlnU0FHRzgyL21GVXEvTElBMkEwUWxudURV?=
 =?utf-8?B?MDN5NTg2eFFjVDlEajlxRFFOWk1TdmxiR2I2VVo3TTdpZ0RBYVc3R0t1MW9I?=
 =?utf-8?B?aUUzWU5IeDA4TDMrclZEQVZyVW9YK0QwOUFqdU9ROWVFc0JVd0FVZTBuUWN2?=
 =?utf-8?B?MWFHQjNkZVhPV240Ym1mSTlqNjdjTXBYVEhseUJrSncrNkxVbFVxTjlLT2la?=
 =?utf-8?B?amtzUi9odThidW1XTWUzVHNmVUdUazdPSjNyRE4yODBkUjJZWGFCZjV3blkr?=
 =?utf-8?B?OTZCYnp5Z0tLNGNvcENrWjNSS1lJVzhNTkRLOXNPQlRucTFPSmtTU0NIMXVE?=
 =?utf-8?B?WFpONTdSVm9XYTBnS3pyVnNlakFNRmZ4Z0Jvcm81b3VjcWlneHlha0VKMjNT?=
 =?utf-8?B?UUFkK2RndXVOTm9MeW1ZT0V3RHpYc3I1cFBTVHlJKzRic1hQZ1Y5N3NiRVpy?=
 =?utf-8?B?QnZPK1F3aWc2UWdkcCtzTk40bFNOTmJhNUs0NVA0MDZjQ1F0SzdkNjcrbjJL?=
 =?utf-8?B?eHRhaVJaQ2x3UGpReXRSRzlrSndlWFN2VG1mTDlpYjVlVHVaTmhpQ29JZFA0?=
 =?utf-8?B?UW9WdDNjVjVMaVNpM1ZyU05GUXdUajc2WFVXa3p5NlF3ZVArVWxTdW0yUDg4?=
 =?utf-8?B?V2ZVK2FiTVovSU94Yks0Umc3Z3M4Mm5aQys4NHJybzd4U24rYVZUNmxObEEy?=
 =?utf-8?B?M283K3MwenVQR3hGTTlML1EyU05NOUdCenp1TzduRWp5ZTk2UzdqZUZuWi9X?=
 =?utf-8?B?Q2FSb1cwVWpqVDdEMTBad3k1NTFBK3JoL2k3Z3Z4L3N3dk5QQzhrMDNTMy9R?=
 =?utf-8?B?Q1oyTlhiQ1h1YWtXNmhjWU0xY1JSZGkyQ2JJdlFqL1FCSlQ4aU04WHRzeVNl?=
 =?utf-8?B?anFCaTdoRSs4Vkd3ZVlMZ0dBcHRTSDNtYy9hOThYN2tQMFBYZTBNL2lKdWgz?=
 =?utf-8?B?TE9xczJvR1JQREZlQnR3ZllqTHN6aytGRmJMNkNaU0JGWVlQa0ZJTHRoZUV1?=
 =?utf-8?B?V2owckFrT05SdEVpb2JWOEZoRWh5cmZCcXhTZ2w0czRYdWIwRUxta1ovM2Ur?=
 =?utf-8?B?QVFWbVM3YTQrMFFCcVpWZEFyUldYdENzV29hWm1YYmpaclR6RzFLeDQ0bk5l?=
 =?utf-8?B?Q0pydHBzbkxMalpHUUpHTS9nVkpnSEtoell3b3NqdW1GTGk2QjFpOGZXVlNE?=
 =?utf-8?B?d3NwTHZvTmtya3J1bTdmdW5aZkEyZG5waXo4Tnl4ZzdpcUI1NWR4bEFYZzBK?=
 =?utf-8?B?cnlvNEt1cGUxdU1LYVY1KzkydytVUjRaK3N2TW5rQ3pxWEwxbVNraG8wUXNz?=
 =?utf-8?B?dHY2WWZFeDJDYVQ2ZlVPYXNZdW5IdnhRcDFEa2hqd2RBZlk1TWFGU24yaC83?=
 =?utf-8?B?UmhzY1JDaUFUUWpiYWdPY0QreUVUTlFkTGpBSEZBNVgrOGNwY0U5bDZOVW1r?=
 =?utf-8?B?K3FicFdmbC9CRnc0Z2xoR0xFTWxZblZ3bWREWHVsS1hLZmc2SGtNN251UHY5?=
 =?utf-8?B?c2F2WnJWM0x1M1BneTNDdUowQ3l1VDIrU1hqMFM3U0grdzVIRG03TmwwVnl5?=
 =?utf-8?B?UFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6075351b-bbeb-467a-4049-08ddaaadd5bb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 19:09:35.0135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F2VGE1UlRnRrCYJxmUo/9KEtB+8UMBcr1Mb0R9RUMhrVSItyxPZTs8GQaChTmSNpedZD2xUkRrdGR4GerX3NPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7011
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

On Fri, Jun 13, 2025 at 07:26:22PM +0200, Christian König wrote:
> On 6/13/25 19:01, Matthew Brost wrote:
> > All,
> > 
> > After about six hours of debugging, I found an issue in a fairly
> > aggressive test case involving the DRM scheduler function
> > drm_sched_entity_push_job. The problem is that spsc_queue_push does not
> > correctly return first on a job push, causing the queue to fail to run
> > even though it is ready.
> > 
> > I know this sounds a bit insane, but I assure you it’s happening and is
> > quite reproducible. I'm working off a pull of drm-tip from a few days
> > ago + some local change to Xe's memory management, with a Kconfig that
> > has no debug options enabled. I’m not sure if there’s a bug somewhere in
> > the kernel related to barriers or atomics in the recent drm-tip. That
> > seems unlikely—but just as unlikely is that this bug has existed for a
> > while without being triggered until now.
> > 
> > I've verified the hang in several ways: using printks, adding a debugfs
> > entry to manually kick the DRM scheduler queue when it's stuck (which
> > gets it unstuck), and replacing the SPSC queue with one guarded by a
> > spinlock (which completely fixes the issue).
> > 
> > That last point raises a big question: why are we using a convoluted
> > lockless algorithm here instead of a simple spinlock? This isn't a
> > critical path—and even if it were, how much performance benefit are we
> > actually getting from the lockless design? Probably very little.
> > 
> > Any objections to me rewriting this around a spinlock-based design? My
> > head hurts from chasing this bug, and I feel like this is the best way
> > forward rather than wasting more time here.
> 
> Well the spsc queue is some standard code I used in previous projects and we have never experienced any issue with that.
> 

I can quite clearly see this not working on my test setup. I can (kinda)
explain it a bit more.

Look at this code:

 65 static inline bool spsc_queue_push(struct spsc_queue *queue, struct spsc_node *node)
 66 {
 67         struct spsc_node **tail;
 68
 69         node->next = NULL;
 70
 71         preempt_disable();
 72
 73         tail = (struct spsc_node **)atomic_long_xchg(&queue->tail, (long)&node->next);
 74         WRITE_ONCE(*tail, node);
 75         atomic_inc(&queue->job_count);
 76
 77         /*
 78          * In case of first element verify new node will be visible to the consumer
 79          * thread when we ping the kernel thread that there is new work to do.
 80          */
 81         smp_wmb();
 82
 83         preempt_enable();
 84
 85         return tail == &queue->head;
 86 }

Between the execution of atomic_long_xchg and atomic_inc, the submission
worker could dequeue the previous last job, reducing job_count to zero,
run the job, observe that job_count == 0 (drm_sched_entity_is_ready),
and then go to sleep. This function has swapped for the previous tail,
so it returns false (i.e., not the first, and does not requeue the
submit worker at caller).

The race window here is tiny, and I would think preempt_disable would
make it impossible (or preempt_disable is broken drm-tip a few days
ago), so I’m still a bit perplexed by it. But again, I assure you this
is, in fact, happening on my test setup. My test case is an SVM one,
which involves all sorts of CPU/GPU faults, migrations, etc. Not sure if
that contributes. I can show this race occurring in dmesg if you need
proof.

The change below fixes the problem. I'm going to post it to unblock
myself.

diff --git a/include/drm/spsc_queue.h b/include/drm/spsc_queue.h
index 125f096c88cb..ee9df8cc67b7 100644
--- a/include/drm/spsc_queue.h
+++ b/include/drm/spsc_queue.h
@@ -70,9 +70,11 @@ static inline bool spsc_queue_push(struct spsc_queue
*queue, struct spsc_node *n

        preempt_disable();

+       atomic_inc(&queue->job_count);
+       smp_mb__after_atomic();
+
        tail = (struct spsc_node **)atomic_long_xchg(&queue->tail,
(long)&node->next);
        WRITE_ONCE(*tail, node);
-       atomic_inc(&queue->job_count);

        /*
         * In case of first element verify new node will be visible to
         * the consumer

> This is a massively performance critical code path and we need to make sure that we move as few cache lines as possible between the producer and consumer side.
> 

Well, I can't say I buy this argument. If you can show me any real
workload where using a spinlock here vs. going lockless makes a
measurable impact, I'd eat my hat. Also, FWIW, this code seemingly
violates the DRM locking guidelines we're all supposed to follow… But
anyway, I'll go ahead with the fix above.

Matt

> That was the reason why we replaced the spinlock with the spsc queue before.
> 
> Regards,
> Christian.
> 
> > 
> > Matt
> 
