Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D3A94E5EE
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 07:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466B810E035;
	Mon, 12 Aug 2024 05:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EhWVh1tY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07FE110E035;
 Mon, 12 Aug 2024 05:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723438996; x=1754974996;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gmT0zVxHj1hHzWDzA8yRj8guKKlCaRigh2W//S8Q59E=;
 b=EhWVh1tYxxDdh84Tq3OgGQuGKaTfrRxmnnywnRV9rm87Y8nXCelg3kPd
 HsNSpHU8DWy1imK22scNYv3GrbY6zXJ+v6zBXtlmU6YVq/RRSQpCXUt1F
 OGf7AyVYcN8BnErnfvX3BUti80M7W0EHO68wkhUer+K1CLoGg0x4bcHAe
 q9l2yMCNmk/OQETmflH9Ho9KAsG6REcaEVD5NoVmyAslJ8UAczVw1MfNI
 9GoVihxK7fZjLYaHaHlSuaHMABVfFSDFyTbjGHCgZHOzbIvmSPhxcvbze
 ZeFpSdhIIP72AEXiuhq+7mLQE3nz/srlYngknjwROAKbJMD0XakfE3BTi Q==;
X-CSE-ConnectionGUID: umyC5mmSSie3Wg8eV5ZEUw==
X-CSE-MsgGUID: AS5TXD9XRZ6dUjo/5niyrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21504233"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="21504233"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2024 22:03:16 -0700
X-CSE-ConnectionGUID: XEzeNYOQQQe+pMf7p5pGLA==
X-CSE-MsgGUID: I3tBB9HIRx6G3PgjheAo1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="58704675"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Aug 2024 22:03:16 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 11 Aug 2024 22:03:14 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 11 Aug 2024 22:03:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 11 Aug 2024 22:03:14 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 11 Aug 2024 22:03:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QWw1GMjaTxk3lh4W8phqrFVmazeNPuwLjL1JCYJTc15ausqk3+Je7nBNMoO7cNgmI7K7IFc75pSqN5ArBaVKpupA/X25tVeb8EsWqglhX0uRAqjk3IZcQ5wXvFBYpcRLntLMDvesoXzF6Sax7ypl/KqhwtxXjTIOttZkBu7oYn4znLsl4hJeU6g4g1D7uTw/lJEdjljtg5arN/zQZBF7IlA6MmFvW/qiElAaJhrR9/2DEMRIjuKD1bkvue8OQHBX3cXjmBtcU6hWgaK7vRXmuoGjLstBFbYJV23yL3autDFEl9G5Y7RUqAmLmAP7aRxjta5yx9GaQO7ybeM/0GILaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2YxEcLRnblQqKaLqSaFAbWIH5YtT3CorkoebCKLagrs=;
 b=djx+b8p9jvC0KFusle4RGySR2EYcBhNMAcMK80PmNaWhJF6VSJqGsZhvW5fle04/yNnyw2xL2rxbRXJy9YQUZpity9Ds99H0IWHT3d5uhAmdm/6q7Af3Xl2ns/mVEQvXaIs2khwbQwwpWhuSMp2H/1Ovf4CnWrurp+xy2Pbt2yS9S2iafGu+qnN4MTQsGYA+Zpgz++OzEb9+QwSgIvsjxIv8wwLAajfCfwmIgXYFYiUp34NMldUiwGbmCiyAvMxZHpuyHb8BLkwSVaragmKUUtvPUt4vPeMC/l11N2DsQXrlUUatzmbll4KLjcKIvz+NSfcmDcg4hl0RRwb6Hfc/Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM4PR11MB6453.namprd11.prod.outlook.com (2603:10b6:8:b6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.29; Mon, 12 Aug
 2024 05:03:12 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%6]) with mapi id 15.20.7828.031; Mon, 12 Aug 2024
 05:03:12 +0000
Message-ID: <afcb3f75-5b72-4097-98b5-262a508160e7@intel.com>
Date: Mon, 12 Aug 2024 10:33:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] workqueue: Add interface for user-defined
 workqueue lockdep map
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <tj@kernel.org>, <jiangshanlai@gmail.com>, <christian.koenig@amd.com>,
 <ltuikov89@gmail.com>, <daniel@ffwll.ch>
References: <20240809222827.3211998-1-matthew.brost@intel.com>
 <20240809222827.3211998-4-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240809222827.3211998-4-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::16) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DM4PR11MB6453:EE_
X-MS-Office365-Filtering-Correlation-Id: db19427e-4ab8-45ee-405f-08dcba8c10fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aStNZzB4TXpHUkNyMktLYkVxYXpUTVlabTd6R3cwQU1OTUhnY1M2UUg1azlJ?=
 =?utf-8?B?NHVaTDNqMG9nLzFSQyswU2V4V2ZXVHhDVWx4OFh6VU1nakY4LzZ0NjY5TU1E?=
 =?utf-8?B?K1ZiWjJwY3N4azFkakNRcGxHa2RxT1RiVnB0ME5nVU1PMUgxcWw5SUdRb3BF?=
 =?utf-8?B?ZzNwVTg5R21lT3ZiQzluWmtvdm9IMmFnclFnWWs4eld4RndwNTBJbGtzOW1V?=
 =?utf-8?B?SU8vK2dXYTlFK3kxL29mUXkzN05FRG9jdW4rb3J1WGRpWlhvOUduTk5XNlhp?=
 =?utf-8?B?b3Y2VXBLSTJPc0s4aFlSTWszZHVGSW5Fd0FmN3VlN1hjYWFmSTRiSEExTEF1?=
 =?utf-8?B?d1dGdlc2aGZHNmU3R3AwczlrQ1Bzd1U1bGozZ2dJNklNK2tTRjhrRTNGdEVi?=
 =?utf-8?B?V0NpOFo0d0V1Q3RDTzhJbXFNR3dvS0xYTmpxMkQ1VUJNZnBuaFl1VkloVzR1?=
 =?utf-8?B?S2JLV0JGWStreXFjeWdnUWJaS0l0bzFBMFNUeGs5RjZGbmNQdCtLZEpRM3pC?=
 =?utf-8?B?b1ZPNGVjbklodGpZVXo5VjAybnhIOW5DSjZxYlEyMDQ2b29XRFo5akF3Wnpw?=
 =?utf-8?B?TjEzS2E5a1kxdm9weFp1TjJNVFJJZEFNeWJTVzN6QnpuVzh4cFQ4RTJXTlYw?=
 =?utf-8?B?eWdVRXNnRWpTdDFzZXFuTVl3YVdOVlRoRi9FdTlTekRKUE1wZENGMHdVZUZN?=
 =?utf-8?B?UDRJUmFISFl4N3pTTmNzZDYvUVZPZnlvZjlWRmplMFZ3RGVLUVV2VVl1dGsw?=
 =?utf-8?B?cGswUEgxQ1R6KzNiaWZOR2FKSkNYL29iQi9BUHFmUXo1WXJKVms2dkpsbzJs?=
 =?utf-8?B?cnpubmpFWTkxQUFWTHR2UUFlQ0hmL3ZUSDVFMjkvcVc2dXlHQzZ1TitQODJS?=
 =?utf-8?B?Z0hvZmxuVmQzNkVpRVRyY0RQZk5uV0FvZ3lFaGYxdVRiYXUrTVMzeDZWbkFk?=
 =?utf-8?B?MTN3b3o1RzRncHg5RE5iM3JId0FGVVlUQS95Uk54K1VVYVdnaDkvQTdEYTBU?=
 =?utf-8?B?Vk5nK0txWmcyWTZ3cEUxTkIwbjJKQXF4cGZza2ZLREI2NEFFeTU3RzJTMkpD?=
 =?utf-8?B?NEx0b1o4TmVaTmdrWVArNHVFdkNkczRwWURjSXRNY1NZZmROUTcxQW9ScHhU?=
 =?utf-8?B?SVRzM0U2YkNXczFCQkVhU2JKNUtGQnc4am5GR3FtMFJGY0lKbmlaa3NOQnph?=
 =?utf-8?B?WVVhdXR4SlpYaWkxcW14RFVNMzNIWk9IbG9aajF4aEp0MklUSVljcm9nQTRF?=
 =?utf-8?B?Um03UlpLeHVJY0lyQmljc2Urb0s2UjdpeGNjNkFvNkJsaVhXSzhxMDA3TGto?=
 =?utf-8?B?M3VhaVkvMEd0amxiOThBMDNQKzY2V2RDSjdSdTZaQmNoeUhNd1lBK1Z3Qm5Z?=
 =?utf-8?B?OXphM0NCWUMzbndWWkpZNTZteXYxRW9vMm9KeUs0RU5sZWFQbmNoU3RCSkRt?=
 =?utf-8?B?OHhVbysxK1NjN2Y5L2hiVFVsY0ppSE5LbE5lM3NqQmVlTEJPK1c3NVo0c1oy?=
 =?utf-8?B?K1ErVzFsenowWU9vMmx3TEplcXNKa2NWSStJNUZpTmZFQnJ3SDdHQ2t5eG5z?=
 =?utf-8?B?a3UrdUxZMWZqeWVJd2xnOWEwY1YvOWVRbjY3NTUwU1BrRGZSOU8wVlMvK1ZY?=
 =?utf-8?B?R2dOWHZRYXBXZEZBVW5hTUk2L0JnM1ZEeEY5ekQzTEFTbFhwdm5mYkxnL2px?=
 =?utf-8?B?UEdHSjlBaGRFaGc1K0xiamFITlppT0dHR1laS3R2TDBvS09ySCt1U0hBeFJM?=
 =?utf-8?B?ZUV0THl0SHRzdlRrSTkzUHI3UTZWcUptalNUSVhKMDZUY29lMFV4R1NZN1pX?=
 =?utf-8?B?WGU0Q0JiQlA4NmRtWFdTQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDNaUUNYOVhnNFN1ckxtaHVRQzJLdU04SVgxcjJqcE1EaDZLQlBTZmhGUUFa?=
 =?utf-8?B?U0U4M09pb3dBazZxQXoydFBTWUF5cW1MVTZkS3llNmZJNFBnd3FtOWRmYWQx?=
 =?utf-8?B?dGlQRXhtNmZQM2wvY0E5RkN0K2hoY013eEVXNmpLaHQyQkt5SWlIOGhSWVpx?=
 =?utf-8?B?bHVicXlLdHU0VG54Nno5dExGK2dJaURpaFhEb0JFby9UUnZ4TUg1QU0rUlpw?=
 =?utf-8?B?dXNWMFNjc2FJTVlQZ0VIQ2haN0RsdTBSOHZhRFhtdythaW9XQ1JQTXpJMXdn?=
 =?utf-8?B?K01iM1NLS2ZjWXArY1h4NldKWkQ3TnZYeDFMRGpOMzJ3MUJKdlZLQ0RSUE9T?=
 =?utf-8?B?RWJBNG5oQ29XbzdUVEVDUmNtQkg3bThJNEpDZStLbFdXYzlLV29VZ1dFR0lY?=
 =?utf-8?B?VzBueHV0cEJ3SDkxcGhBZTlic0F2MjR3Y21kdlVPWmVTZXAvVCt5V0VwY0Fk?=
 =?utf-8?B?TG5zOUZDQ2Y2LzB4TGEzRnFVM1BBY2llWFNtWHpZRU9wS1pmdG9Ud29wR1Bu?=
 =?utf-8?B?dkMxcGMxb0p4aGxQNldSTHllYXBCVTNHODhNL0VRSGtNNEhPMExGNWhCc2ZL?=
 =?utf-8?B?S0hjeVlOS0cyQUxhZzZlbGZCUEZ2bHdHUzVjUm4zNXM2ZW1QWnVNVVUwMDNZ?=
 =?utf-8?B?TVQrMlIrTi95NEFEUVJaOFdlU1A5REs2R2hxRGk1dk5kMlFFRjNlbEJ1S2lU?=
 =?utf-8?B?R25yclNSWEcxRGt6ZVY1N1RydXJ6SUorR01oS3hYeGk1VHE2UkdYNG5DUkQv?=
 =?utf-8?B?MEVIc2hON2YyMVU5Wnk3RDlkeWJFNi9BR3pmQXRiZCtDR2libENEWXdoOU90?=
 =?utf-8?B?L2I4SnVlWG5GalR1eGp5eFRpU1BHdUdOQ2dVL2xIV3hCUXBMWnFNelVWRk9G?=
 =?utf-8?B?dmpoZjBNQ2VJMjJqQmhQajNXWlo3cDVGc2ljY0xjbk51b2dyNjc2Zkl0T3k0?=
 =?utf-8?B?R2tTREd6Z3FKTXI5bWZSMFZyUXhkTGgwQmIvUnkyQnkrcUlxOUJSOWZGMVVI?=
 =?utf-8?B?eXUvd0lHUHdXdEhTTHlHNDByZFltMUs3Y3dJbDVvMkEvY3M1RXZHYThIeWpI?=
 =?utf-8?B?bklxS0xhWGxQb1o1bGNQeStwNm11M1c2Z0psUEI3WDkxUmdOQ3V2VDh3NENV?=
 =?utf-8?B?SEZKNEh2Zzd4UUN0UXN0azBGTFRVNnlMSnVjK2hFUitOQzdOQmJIc3BEclFx?=
 =?utf-8?B?c1kwTldEcWNDeUZ2d3FFR20wL3BZWmFRc1RMVTFiVWllemxlckE5bkpQdnI2?=
 =?utf-8?B?SFg4eVJ3VXJjQ3VpZ25QazlNMTUrWVBNUk1ldW01cVhNVC9sOWlpMk0zMXpP?=
 =?utf-8?B?Q1lyRGNWTWs2K0RaUVowc3FqNW83TW1xTnB1TjUxOWh5YlA1cXJyRTUvSVBH?=
 =?utf-8?B?UnIzOS9IeTYxczduOWxaUmo4YXMvYXpJSm1Ubm81NzNIQm04SXgzc2o4MUpM?=
 =?utf-8?B?V21pR2NTMXc3emNpVkVGN3ZTS1BDdUMrRENPRlVPQmpJWTRUOG9BM3dlTEFK?=
 =?utf-8?B?MWhnR2VmdWNKNDJjUFpNcTJ5dW93ajRlc0FGeENiUUpzUmN6SWVSakZPUk1S?=
 =?utf-8?B?YXNpUXRJMnZNeDVmZVVsSFJWN2V0NmM5S0NhL0tVV1dpblRORlM5MEt5eGdC?=
 =?utf-8?B?UnEwODlNa2lGNFRyakxFaWRuQWNvdmd3SkhkNGc3cUdWZTV3RzMvSU5pTTFt?=
 =?utf-8?B?ZFFYY1dNd0dDTG5WcndYR1YzRitDdS8xQVFxUmhnVDhhclV1L0NMU0pLdGl5?=
 =?utf-8?B?cUh6Q2pma00yaGNUOEVuaXk0OWgzS2d5anhqT2VsN2JiMWY1R21vd3hXVVlF?=
 =?utf-8?B?OGQ2LzR3RCs5aWNOVEFpcmZ6YkdMQTFVMHpJeXc4a3YrMjM0dm5QM1dIRlcw?=
 =?utf-8?B?VE9aV2lyVWJwb0dsbDE4Lzh4VnB0TEUyQkx5Q3M1ZlZ0WTE4SnhQamRHY2cr?=
 =?utf-8?B?aTNtTjFacTU3REZRcGhEeXk0V21tK2xUNlZ2YTRzMzZTalBjL1FJM2l1eVNB?=
 =?utf-8?B?ZFF0Z0JMUWhvU2xtVG1XMldzeFBUSVkrMGt1dUJVVDVQOWxFUGZqdWdTVG5T?=
 =?utf-8?B?WitGeVlaTWVWekh5YUxkQXloSEtrYkxmK0o3Zm5ORE9OV2ZLeFY5bmtkZEp3?=
 =?utf-8?B?KzQ4TUJOWVFkSjZkTmJpSXc4YUUzeEhHMk8xS1B4OGQ2S0t3cnBVOEdyaURD?=
 =?utf-8?Q?ZnhTU9cgS1fxUxlSTv3A4p8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db19427e-4ab8-45ee-405f-08dcba8c10fb
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 05:03:12.5646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JORrtwWpNvRjWzghPzca2stcd53xMMgS0kBPhWXxOEA8J0v2aVHIuJka7ONQZSsesPTy/mU+zmSbXiNlLK60kxABtuwXxQezP8hWGJChbsY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6453
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



On 10-08-2024 03:58, Matthew Brost wrote:
> Add an interface for a user-defined workqueue lockdep map, which is
> helpful when multiple workqueues are created for the same purpose. This
> also helps avoid leaking lockdep maps on each workqueue creation.
> 
> v2:
>   - Add alloc_workqueue_lockdep_map (Tejun)
> v3:
>   - Drop __WQ_USER_OWNED_LOCKDEP (Tejun)
>   - static inline alloc_ordered_workqueue_lockdep_map (Tejun)
> 
> Cc: Tejun Heo <tj@kernel.org>
> Cc: Lai Jiangshan <jiangshanlai@gmail.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   include/linux/workqueue.h | 52 +++++++++++++++++++++++++++++++++++++++
>   kernel/workqueue.c        | 28 +++++++++++++++++++++
>   2 files changed, 80 insertions(+)
> 
> diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
> index 4eb8f9563136..8ccbf510880b 100644
> --- a/include/linux/workqueue.h
> +++ b/include/linux/workqueue.h
> @@ -507,6 +507,58 @@ void workqueue_softirq_dead(unsigned int cpu);
>   __printf(1, 4) struct workqueue_struct *
>   alloc_workqueue(const char *fmt, unsigned int flags, int max_active, ...);
>   
> +#ifdef CONFIG_LOCKDEP
> +/**
> + * alloc_workqueue_lockdep_map - allocate a workqueue with user-defined lockdep_map
> + * @fmt: printf format for the name of the workqueue
> + * @flags: WQ_* flags
> + * @max_active: max in-flight work items, 0 for default
> + * @lockdep_map: user-defined lockdep_map
> + * @...: args for @fmt
> + *
> + * Same as alloc_workqueue but with the a user-define lockdep_map. Useful for
> + * workqueues created with the same purpose and to avoid leaking a lockdep_map
> + * on each workqueue creation.
> + *
> + * RETURNS:
> + * Pointer to the allocated workqueue on success, %NULL on failure.
> + */
> +__printf(1, 5) struct workqueue_struct *
> +alloc_workqueue_lockdep_map(const char *fmt, unsigned int flags, int max_active,
> +			    struct lockdep_map *lockdep_map, ...);
> +
> +/**
> + * alloc_ordered_workqueue_lockdep_map - allocate an ordered workqueue with
> + * user-defined lockdep_map
> + *
> + * @fmt: printf format for the name of the workqueue
> + * @flags: WQ_* flags (only WQ_FREEZABLE and WQ_MEM_RECLAIM are meaningful)
> + * @lockdep_map: user-defined lockdep_map
> + * @args: args for @fmt
> + *
> + * Same as alloc_ordered_workqueue but with the a user-define lockdep_map.
> + * Useful for workqueues created with the same purpose and to avoid leaking a
> + * lockdep_map on each workqueue creation.
> + *
> + * RETURNS:
> + * Pointer to the allocated workqueue on success, %NULL on failure.
> + */
> +__printf(1, 4) static inline struct workqueue_struct *
> +alloc_ordered_workqueue_lockdep_map(const char *fmt, unsigned int flags,
> +				    struct lockdep_map *lockdep_map, ...)
> +{
> +	struct workqueue_struct *wq;
> +	va_list args;
> +
> +	va_start(args, lockdep_map);
> +	wq = alloc_workqueue_lockdep_map(fmt, WQ_UNBOUND | __WQ_ORDERED | flags,
> +					 1, lockdep_map, args);
> +	va_end(args);
> +
> +	return wq;
> +}
> +#endif
> +
>   /**
>    * alloc_ordered_workqueue - allocate an ordered workqueue
>    * @fmt: printf format for the name of the workqueue
> diff --git a/kernel/workqueue.c b/kernel/workqueue.c
> index 24df85589dc0..f4b50a995e99 100644
> --- a/kernel/workqueue.c
> +++ b/kernel/workqueue.c
> @@ -4775,11 +4775,17 @@ static void wq_init_lockdep(struct workqueue_struct *wq)
>   
>   static void wq_unregister_lockdep(struct workqueue_struct *wq)
>   {
> +	if (wq->lockdep_map != &wq->__lockdep_map)
> +		return;
> +
>   	lockdep_unregister_key(&wq->key);
>   }
>   
>   static void wq_free_lockdep(struct workqueue_struct *wq)
>   {
> +	if (wq->lockdep_map != &wq->__lockdep_map)
> +		return;
> +
>   	if (wq->lock_name != wq->name)
>   		kfree(wq->lock_name);
>   }
> @@ -5756,6 +5762,28 @@ struct workqueue_struct *alloc_workqueue(const char *fmt,
>   }
>   EXPORT_SYMBOL_GPL(alloc_workqueue);
>   
> +#ifdef CONFIG_LOCKDEP
> +__printf(1, 5)
> +struct workqueue_struct *
> +alloc_workqueue_lockdep_map(const char *fmt, unsigned int flags,
> +			    int max_active, struct lockdep_map *lockdep_map, ...)
> +{
> +	struct workqueue_struct *wq;
> +	va_list args;
> +
> +	va_start(args, lockdep_map);
> +	wq = __alloc_workqueue(fmt, flags, max_active, args);
> +	va_end(args);
> +	if (!wq)
> +		return NULL;
> +
> +	wq->lockdep_map = lockdep_map;

How about NULL check and fallback to dynamic allocation, just to be safe   ?

> +
> +	return wq;
> +}
> +EXPORT_SYMBOL_GPL(alloc_workqueue_lockdep_map);
> +#endif
> +
>   static bool pwq_busy(struct pool_workqueue *pwq)
>   {
>   	int i;
