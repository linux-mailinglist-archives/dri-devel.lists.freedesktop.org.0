Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2413D3AAA5
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 14:46:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF9F10E467;
	Mon, 19 Jan 2026 13:46:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iCW/w1Z7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD0F10E467
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 13:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768830382; x=1800366382;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=HHE4JhhVtfuEVdqK0j1b35oF2Cw3B1tDI/69PSdWT7E=;
 b=iCW/w1Z7GJaoYw1J/HG75QqKsu2Ah0sQs25KPAU/80DlarZDAvSFgqYY
 iW+5EMOlu2s3WryY8lILzEcMaYfzV0Z+JNTIeGjxBn4MkuIOn2ujUZtQo
 5FtryBWG+Z0EEzqSlSso+FE90nMhfTk3XJUoUKZpQgno0Zb6lVrbPS5Xx
 LySX80m+s0L7Q5it8mMyb/Ak/9R4TCj0jLRj43nxIYCeiDnDuL6ktFign
 OKwU+iru7xUvpXSDeeXiGxzLBKyV3GilQVMOXwsWF+VEzNrvWGKF0tABZ
 QezjwElZhx5hLj4cYyXx7/ivw+zCeC/l7+Bj+jyu2xYLSyFFlIgwlSIZc w==;
X-CSE-ConnectionGUID: +6BLrt/NTmulQ56n9GA8aw==
X-CSE-MsgGUID: 3Hus1l2qSkiqVzpx1e1ePw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="87621356"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="87621356"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 05:46:22 -0800
X-CSE-ConnectionGUID: +NRtsPIpRS2TE9shnEfH/A==
X-CSE-MsgGUID: 9+Nl3DDYSy26b8aQ8p3GyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="236550931"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 05:46:22 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 05:46:21 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 19 Jan 2026 05:46:21 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.46) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 05:46:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nEZzLLbHPphruJKNF6dlwjOzP/+G+0/OQLMb5DOZb9UoYqudee6t91tUqaMoyPJimSxr6ifSlBd7ZtEEOCD0tL8mGZJxfUccfXZzTUjrxWB+Dx36s+u8ChNaY8wYdVoIA0yiAug4yDjdgs3OfVbBggcq/+USW9Oi1fOnK/vNfjtCa0xO/iPBneONP/LPPXHw66D1NonYDUcJAc0bvjqdGr/iax7lY7/qRRg5yL3JB3VU4LzRdf9rU6vwtzenRKgzUCdGUW43VS9ty0tJ+C5eMYBzko9rcbQf9h6iSP65ERuDvllABVRuDPpyqFKMd2T0sZAuzukjmCHXatqmGrCCGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d7dMlDVScvjdowB/78mAwxmANLM58+mAyECGTjermts=;
 b=mAGBjIgR3Yd7kfi4soHks41MBaquUn9N7GGbIx0x+WM4vJAvPmeZgdA2AQnoyhgIKUVwlwhBldn8OZls+9EnEuGGsLBtnCkOZ666xKziIsO2nOYsFIGdnBGwXxK8EVYl/0M6LswI4rqcvK16tsUSplkIjTgJTZwYAauCtM82YbKD0VWvTKV4hxaqHvZ/50N6q/BFSxXQtokIW0TBIVzJY5gjtIjrhy4+p8AikQD+jRsZ7edSVW34mFKHcjkZP6UACIP4eh/b/635VezkNuiuiG6WDeZpzIypnfAqUjg5YPAIaLAdi5M+CcKH36bdBnKxP2eK1/GaPRQdRYgH3ukX+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 by PH7PR11MB5861.namprd11.prod.outlook.com (2603:10b6:510:133::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 13:46:13 +0000
Received: from SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::9636:7375:2667:d563]) by SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::9636:7375:2667:d563%6]) with mapi id 15.20.9520.006; Mon, 19 Jan 2026
 13:46:12 +0000
Message-ID: <6a1fb965-8e56-4998-a865-245c49530f63@intel.com>
Date: Mon, 19 Jan 2026 15:46:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gem: add helper to detect self-imported PRIME dma-bufs
To: Farah Kassabri <farah.kassabri@intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20260118103502.5162-1-farah.kassabri@intel.com>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <20260118103502.5162-1-farah.kassabri@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TL0P290CA0002.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::10) To SA1PR11MB7014.namprd11.prod.outlook.com
 (2603:10b6:806:2b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7014:EE_|PH7PR11MB5861:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bab88da-96af-4b81-279a-08de57611be5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0R5N2NTbkpQRUliWUdoMVJxMzJzNXBwMHAxVkNqRnEwaERpTlpJc21GSHN5?=
 =?utf-8?B?QmVZRHV4eGxBdExYbjM4UThOVmpubEFSYW44WlkxTjRnVmJFVVl3a041UFFX?=
 =?utf-8?B?NVFRcGFRS2pmdkZYVnk0UXVUZnBRTGswMFZ0N2ZBTWZXSjRLQ040YlRCT2p1?=
 =?utf-8?B?Znpkc2svTlBpUSt1c05ZenNPSSswRWFKRDQ3ZW9PbDdVRmp5NmJrenZPTmVz?=
 =?utf-8?B?Z0RKSFhycUZmQk9YNktYSTVYWDJWL0VoLzZoTzRnL0pxTnB5VnA0b2dxOXcz?=
 =?utf-8?B?cGhHODlWeWJVaEc2TDNub0ZlTm52SDBwTVlwdENTV1cwZThGK2MyVXdBMk5o?=
 =?utf-8?B?cnRFVTExclhuZFl2azUwSTB2SnhxZnNFKzh4R01iVjd0bVRrbEFRM1ZpMXEv?=
 =?utf-8?B?eFJreUlqb0pHSlRBQTYxbVhUR3p5dnVWSHdPSHh6UW1jbitrbzIyOXZGOTFq?=
 =?utf-8?B?aC91bGpDTC91dWZXU0E4NnlmWnJRVEFWS3JrbS9aS1R6RHFDWms4UHUvMEtR?=
 =?utf-8?B?cHZGYlRWNDlKbU5BVzFZRzFnalg5VnFuQmU4ZVpabjJvd1dLOXNLY1VOeDMv?=
 =?utf-8?B?eXRsWkhySVF0Z1RJejcreFJSMjRKWVJ0OUpTTmtwMjlFU0p2dTY1OHM2RWM5?=
 =?utf-8?B?amY0Sjd1cDBVQ0dlN2ZKSG9nSy9aVWsrTWQ4M2lwUE1QeXY5LzNDODZjT1FM?=
 =?utf-8?B?THdzSFF5czVtWE1FNStpTVN0a1hSVUNYY1lRVmpZQWEwd2hiMHlZK0lacDBF?=
 =?utf-8?B?TWRCblJHWmNvNCt4UDErellaQ2hrWVl1WE05a0xPZzQ1V2JRVEgycU5HUjlU?=
 =?utf-8?B?S1JTUWpZVnY4aDNoUENtNGRGUnk5a282TTBTSXptUVBBYTNwNm1CWEUxZkJF?=
 =?utf-8?B?a2U1SkVoVXliemNLK2ZkS09FVE05VVpRTkFDa2trdGcyWjJiRTdnTkFtcnEr?=
 =?utf-8?B?dGZvVjZzN2h0MVNzTTNJd3ZpVjlQSUNjbWRabEMvbFBIWVlpR0QvVHZ5U04z?=
 =?utf-8?B?azlxUk12YTYra3BoQVVJNnl4MjcxU2IwenBodUpKd1l6aUNERUtmdkpxeHhU?=
 =?utf-8?B?L3hFc1U0OExhNVk0VFQ4dkxlSDVQcSs4VkMrcFBwYzZlbDNZZldkN3FYd3Z2?=
 =?utf-8?B?M3hHOWI5YjhqRXVUUHluM3F3WG95ZjNkeVMwNW1OTU9Vckh1SXE3eFBLTzU4?=
 =?utf-8?B?TXpnamFwUXNkbytlOHdLV09tb1M3TjlwTW5ZMmtMd0Z3SUZ0b2FXRVNjM25K?=
 =?utf-8?B?aUViSUpkaWh0RzZWc0JiWitwRFJYNGpIRVRBelUzTW5JNS9oU3JORTlyclRN?=
 =?utf-8?B?d3ExSGd6bTYyMEVWMTJaNTYvbkN0WWxQUkpjRUJWNHE2M1NNTi8rMXFXblIr?=
 =?utf-8?B?Y2tCL0JXTXI5VHZVSlo4RTNIMjEwRXl3bTNUZHRwd3BvSTd4K3JONHl0Ykor?=
 =?utf-8?B?alFYcXowdzM3MlF4dGxkNjFtcldwdDFXWmo4MzRBYzMxY2FlcWdFSVRESlV3?=
 =?utf-8?B?R1lRcHhZbXVzRFRzYm53cVk5SzhJVDhjbkg1Y1hxeFljUHJnakxkR2tESkhE?=
 =?utf-8?B?ZHptZ2daZUJGUXMrVXJ5YlA2S3lpdGlhczNhU1h1MktYK2w3NytHY2FHeWNl?=
 =?utf-8?B?UHlhQkNxY3RsdWg4Wk1TbkpPMXlyOGgvRStBdVhyeEd3RHNlZWZxUWVhcVZM?=
 =?utf-8?B?TlFWc2pyN1dVMVhRVEU1V0FSb1BZRzZZY2JNZ2lFRXg2Qjc2Wlk4VjB4RXNx?=
 =?utf-8?B?ZjVxajYvb3NRSDNWS3gxZnZ4amFFdjg1YjMrdlQ1RERCUlladWlucVNNSkFz?=
 =?utf-8?B?aytUamZPcGxVMm5nRFJGckdlN3V3aXhCRVE3WGtFYjVLUHVOU2hDdk5icHJ2?=
 =?utf-8?B?cjJtc2lVbWh6alVnRXpBVVE2WXBvRjd4NklpMUFNUDJ0TUxyNGtlRXdDOFhX?=
 =?utf-8?B?VGU5dktHRlNZYUJTa1ltWlJYV3poU0tQdFBGK0t3SFhrZ1hCQ1RsWXlpaENP?=
 =?utf-8?B?TnNpb1dyRWNJRkwrQ0tXaVBsY2lEcDlwb3NCcWRvb2dUN1JZZjhwYW1tZWQx?=
 =?utf-8?B?WG9RWTRKSktKUlJBMUVrb25tL1g3aEhlV2krRGNMdXNyaDFyNU1lZ0tGbm1V?=
 =?utf-8?Q?p/E4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHZKWmJ5YTJSZW5OSUl6aFdjN2hrcDhNUWFCYndNVy9CclNuWjRkZ3IwZzg3?=
 =?utf-8?B?T1VGdFNJY0tGR01pRTNyVG1NU1djc0JMSlVBNjJTQklhLzhkUVIwMTdrSExk?=
 =?utf-8?B?V3VvcVhsODN1WmgyTGlSTGVLckZWUzhCSkh2T0hLdTNMbm9ZTXBBaWVIUC9X?=
 =?utf-8?B?Tkp5eWRXVEx4TDVXUUF3d2VrMVpjNnNlNUZJVlNzYXh2KzdjTmxhaWZzYVJ5?=
 =?utf-8?B?bTA5NU1mSmI1L0ljajlFTlhzbmpvWEtUYnVYSUpHOTRQaDhDUzk5Zm4wK2o2?=
 =?utf-8?B?NXM3d3Y1c3lXZUtCcE9IU0MxSTFMZDdURTdXLzJhU0x0Z2V2YTBkV1kvSG5l?=
 =?utf-8?B?Rjk0SjRZZjhKb1RyOXlKK1VOUVNkRTdRcU93Mk9CYlhHYVlselNJdytNVVZK?=
 =?utf-8?B?T1RQNjdwK2NWMnJIcC81T01UWmcxZUFhNDJ3YXVFbHh3UDZLZU8zVHVEM08x?=
 =?utf-8?B?SGRtUHJOb3FuT3lIczNoRU14ejl0RVpDVUszcVVQekprNE1tS2ZRSm9leEZj?=
 =?utf-8?B?ZUpHVUtQbkJuRWNtazczSmxjZEVWMW1aTXNaUTRzM3F5MCs5ZmZIdEk2YUJT?=
 =?utf-8?B?RDhxOXRiWTVTYXN5Q2FnVlRBQU5qWkN6NDczWDVUY2ZJRjJma3JlU3JXMGVp?=
 =?utf-8?B?OEpDdHljaEE4dFJvSHNrVWlzWHFYT1U5OGhUTU10OFducXowUzNKWElvS2F1?=
 =?utf-8?B?b3Jrc0J3b2RQTWtYcWZyRzU3c3VaNTVwL3QxRlIweFdCY2I1SjBtcENoZTVQ?=
 =?utf-8?B?ZDlHNTV5emFXN3dQcVVnNjFUNGxvVG1HOHl2SGwxWnVMR2pjWVVEQlNxcFFO?=
 =?utf-8?B?d2ZSc3Z4cm5tdmVTRWlURzFWTzBEc3dvenh6QnEzRVY3a0hFVHphRXgwb2xs?=
 =?utf-8?B?TmVacDBkMFUwMnNYK0IyRXUzaVJzTG1zL1FreWV4cmRHZzRYOWhXc3hvN3Bp?=
 =?utf-8?B?YXJEdjE4UXhzOVdUN2JKb0gxUFc3eUl0ZzVUTHEzQ1picFpoYllCOEJuZkk1?=
 =?utf-8?B?ek9iclQ3eUpIbEF2MWFOa2R6djYzakxJTzMwbXZDR2tWSEdqZ3IwZnBmM3Bs?=
 =?utf-8?B?OUxsRDdpOUlITHZaWkxreGM3bG5vWlI4SlZ0VE5vaHV5MnRNWlpNNDZHdnNX?=
 =?utf-8?B?ZG5QcHNxQktqczFTZWdYQlJTbmpvRTdKcndJTlJLTmxFSU1yRlF4SERTckdO?=
 =?utf-8?B?ajdqZ25IRHNGbVJsTDMralp1ZFBWOGtDa29JZExkc2NpeWJaeVZ5SE9SdUNJ?=
 =?utf-8?B?VXI1QitkczVSZ0tzdWtCU1VCdWVnVnpoaTh0bkhsclhkL3duMUtMTmZSNXR1?=
 =?utf-8?B?Ujd6TStvL0hjVUxyRWkyNmlwb1NpVitBMFdmWTZEbVVTdmpqM0t0SzFJeUlW?=
 =?utf-8?B?QzVkMkFHNnY5MVFkQzNML0M5UktJYnlYUXpVNnZVejYvWlRuNS9JUUN6T0o3?=
 =?utf-8?B?aW9LZWZzV0FqZ0c5MmlzSVA5VWVLZUptN3Y2N25tNzc5ZTBUd2dJS283RCtZ?=
 =?utf-8?B?Y28yRVFINEk4TGszRGcxZEUwMEJyUHpYZ1E3VEE5SjJaMFhFQkJyZWdnS2Jx?=
 =?utf-8?B?cGVsbkIra2Q1RFlwUG5FRk1IUmF1LzdaWUJQTVRaWnhFNDBPRzhINDFUSkJO?=
 =?utf-8?B?OVd6VzBtdWNnRC83ODdYdUVjbklJQVkwSjZ0czNVOFBTQmNwd3BqNzdoTXZH?=
 =?utf-8?B?cDYzbU5yOVRoTUlPMnpZSnJrWUx1SjdsTWk4VTdtVEF1dG0rNkttRzlHZkxX?=
 =?utf-8?B?aFE4S0xIVDdFZExKRlNBVzFweFZBejYzYW82YUo5UWZFS0w1OGNFUDRWaDJo?=
 =?utf-8?B?S0ZmaVZ0K25YYkNTbmVycjFGN0tsbUdXVlJIY0tkNFY3dVRGUjJhWk9BMzNN?=
 =?utf-8?B?M3JuTTA1YjE2QUY0aVp5VUFRR0QxVnZVeVkyQXg0STJOUStrb0EwVGlFTUhk?=
 =?utf-8?B?T3Izb3NadGRhR0U3QnBXZ1NBeWs0cUhtdjNQeExwbllQVUFXdHA0azR3Ykh2?=
 =?utf-8?B?NWlvRXIrekN0TC9ESFJrbFBxUm1PS3JxUnkxUlpxZGJHOEh5U0NVL21iZlJl?=
 =?utf-8?B?ck9QUm5BZHg1WWd6Wmd4bVdCb1JNK2V1WVBjb3RNODRpbkhmcmFxekYwME5F?=
 =?utf-8?B?cjhHREhtQmdMcUE4dVVSUUtOVUJpV3RjSU9MR1JaTUQ0ODNwZWRzTndyaEFK?=
 =?utf-8?B?RWgxZDVLQzVVUEdRRjJBTmV4ZHQrRGpWZFB4L29MSU1NeTh5ditIa1pRMnZU?=
 =?utf-8?B?cnNvbHd1M3lLRG9CSTBZRVU4R2Q5SlQrWWRQUUtCS3BaS2VvQ3NPaG8yUkI0?=
 =?utf-8?B?NlJZM1RXazdOR2U4dHdpQ0RMUVRBcXlQanA2RVdlVmduMk5yU2ppdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bab88da-96af-4b81-279a-08de57611be5
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 13:46:12.7966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KO31rW8yPWZzXAaBnduaY2p/WBlI3wcGzPTd/pEmtZL9nJRSpZ0UhQTVPlNlYpNbU/bAy0CnAGkU7M+vSMXmJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5861
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

On 1/18/2026 12:35 PM, Farah Kassabri wrote:
> Add drm_gem_prime_self_import() to detect and handle the case where a
> PRIME dma-buf being imported was exported by the same DRM device.
>
> When the dma-buf originates from the importing device and uses the
> expected dma-buf ops, the helper returns the associated GEM object and
> takes an extra reference on it. This allows drivers to bypass the
> generic PRIME import path and avoid taking an additional reference on
> the dma-buf file.
>
> The helper simplifies self-import handling and avoids duplication of
> this pattern across DRM drivers.
>
> Signed-off-by: Farah Kassabri <farah.kassabri@intel.com>
> ---
>  drivers/gpu/drm/drm_prime.c | 48 ++++++++++++++++++++++++++++++-------
>  include/drm/drm_prime.h     |  5 +++-
>  2 files changed, 44 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 21809a82187b..6c9ad3957f42 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -974,15 +974,9 @@ struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
>  	struct drm_gem_object *obj;
>  	int ret;
>  
> -	if (drm_gem_is_prime_exported_dma_buf(dev, dma_buf)) {
> -		/*
> -		 * Importing dmabuf exported from our own gem increases
> -		 * refcount on gem itself instead of f_count of dmabuf.
> -		 */
> -		obj = dma_buf->priv;
> -		drm_gem_object_get(obj);
> +	obj = drm_gem_prime_self_import(dev, dma_buf, &drm_gem_prime_dmabuf_ops);
> +	if (obj)
>  		return obj;
> -	}
>  
>  	if (!dev->driver->gem_prime_import_sg_table)
>  		return ERR_PTR(-EINVAL);
> @@ -1116,3 +1110,41 @@ void drm_prime_gem_destroy(struct drm_gem_object *obj, struct sg_table *sg)
>  	dma_buf_put(dma_buf);
>  }
>  EXPORT_SYMBOL(drm_prime_gem_destroy);
> +
> +/**
> + * drm_gem_prime_self_import - Attempt to import a dma-buf exported by this DRM device
> + * @dev: DRM device performing the import
> + * @dma_buf: dma-buf to import
> + * @expected_ops: dma-buf ops used by this driver
> + *
> + * If @dma_buf was exported by this DRM device using @expected_ops, return the
> + * corresponding GEM object and take an extra reference on it. In this case,
> + * the import avoids taking a reference on the dma-buf file and instead bumps
> + * the GEM object's refcount directly.
> + *
> + * Returns:
> + * A referenced GEM object on success, or %NULL if the dma-buf was not exported
> + * by this device or does not match @expected_ops.
> + */
> +struct drm_gem_object *drm_gem_prime_self_import(struct drm_device *dev,
> +						 struct dma_buf *dma_buf,
> +						 const struct dma_buf_ops *expected_ops)
> +{
> +	struct drm_gem_object *obj;
> +
> +	if (dma_buf->ops != expected_ops)
> +		return NULL;
> +
> +	obj = dma_buf->priv;
> +	if (!obj || obj->dev != dev)

I think checking obj for NULL is redundant. struct dma_buf * is instantiated by dma_buf_export,
which assigns the priv member based on priv field in dma_buf_export_info and validates that it is not NULL.
All the drivers that implement this pattern (grep "Importing dmabuf exported") do not check it.

- Ilia


> +		return NULL;
> +
> +	/*
> +	 * Importing dmabuf exported from our own gem increases
> +	 * refcount on gem itself instead of f_count of dmabuf.
> +	 */
> +	drm_gem_object_get(obj);
> +
> +	return obj;
> +}
> +EXPORT_SYMBOL(drm_gem_prime_self_import);
> diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
> index f50f862f0d8b..4cdb543b9eb7 100644
> --- a/include/drm/drm_prime.h
> +++ b/include/drm/drm_prime.h
> @@ -54,6 +54,7 @@ struct device;
>  struct dma_buf_export_info;
>  struct dma_buf;
>  struct dma_buf_attachment;
> +struct dma_buf_ops;
>  struct iosys_map;
>  
>  enum dma_data_direction;
> @@ -108,6 +109,9 @@ struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
>  						struct device *attach_dev);
>  struct drm_gem_object *drm_gem_prime_import(struct drm_device *dev,
>  					    struct dma_buf *dma_buf);
> +struct drm_gem_object *drm_gem_prime_self_import(struct drm_device *dev,
> +						 struct dma_buf *dma_buf,
> +						 const struct dma_buf_ops *expected_ops);
>  
>  void drm_prime_gem_destroy(struct drm_gem_object *obj, struct sg_table *sg);
>  
> @@ -115,5 +119,4 @@ int drm_prime_sg_to_page_array(struct sg_table *sgt, struct page **pages,
>  			       int max_pages);
>  int drm_prime_sg_to_dma_addr_array(struct sg_table *sgt, dma_addr_t *addrs,
>  				   int max_pages);
> -
>  #endif /* __DRM_PRIME_H__ */


