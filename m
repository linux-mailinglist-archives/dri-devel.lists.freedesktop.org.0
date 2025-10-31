Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF3DC24D06
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 12:42:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0185810EB17;
	Fri, 31 Oct 2025 11:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YBy76lCL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E6C710E270;
 Fri, 31 Oct 2025 11:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761910942; x=1793446942;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0U5NmE79o9W3E3QGPoR+aKckL+6092mRjlCJ/hwOidU=;
 b=YBy76lCLXWpNudFovS/QrL1mU6jyZsaUr+RDuUsFwVRMdFwTim0nFFPQ
 G9kXgxzeOv77cUumZAgBoYlCpodHPdiaaKvxGcgHJzeHGW0GtWBoh/Bo9
 aJcKS6g9j376SayKRNlFKyjSev+I4aVwOzXdoj971cWVbYXjAN2yyIxDu
 A7cVJTvsbiIu4MTA/7pD/dBjtEkZSddwLYq2BGcEzi9xL0hyaFA/2X+/k
 aMCdrrSFlyauCeZbfTzSZKOX5BMS5V1FGdfK0q3UJnRSsQea025oFspIj
 g0R7/fDm6awdubmL9UkGl0YxFiSyfsSz3gQfj9isMBiMLy61U9bM69hWB A==;
X-CSE-ConnectionGUID: fOdHcyULTJGPqqQhD9lgfA==
X-CSE-MsgGUID: 8q6NrDByTD6UNhjaPXf1HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63975316"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63975316"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 04:42:22 -0700
X-CSE-ConnectionGUID: Okipr+Z9Qwehytcm+Jrjgg==
X-CSE-MsgGUID: F3BIgdwmR76Rxzt3ZMQi3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="216871985"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 04:42:21 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 04:42:20 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 04:42:20 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.30) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 04:42:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lvV51rq/I7KXAsjmipSfdaQYF6BWX3O4aBpMtxHxAidmV2ntewysXtdLxMQ1H9gqEUcTmr9sIF3mtWDl7zLHKJiWuowTbBNO0qtAAXiokOC8GyMvMZrEQsoZ1uyySlUTkHtxZcQZkU3v3G5p18goaVFpuPrh58HDbjUUbcRZpTplLNBR82n/+1oewI/v+9oxGG0Qp6hIYKoyBeQcKhB1g/WqnrrnMnyfXLSGi7dNIc3GHpST2YbI246gSuu0uq15QaD5bnKwx+V7i/yjaDne7rNSCxy+8di7szZD3kXORt1ej40CFSZtf3qRgOT7XGvwvfsZSHxz2YT3oJNPdTH3mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KRRwsjZI11Z9bgpZsZ2tSx94xFixRQJRX9c52ELnuFk=;
 b=a1WbaPU5LeNB8pDZ4u/yE5XKawfLEfyTednBvZbhgRPv/4R5ez7kfP6j0MXUnPftg+yMgSdYQYxXrDzzMqDJBvjA/Xh8vCpWkGPB0SlvvZD8oQEzyQ35Ghi9LtD1X6KFmFiK62G12nQzt/6wp4w68B3SVg701pnRKzJI/+EpfApNeRq6bqXyzerUeElREGJj7KzpYefLFOT8bN/OWcOMf0a7D/XdSe0f0P12odZnkzp8rRDfok8SdOtuiicT95BCTBxtrSsnKqQ9nUJ1vpK/kjewS846pAp/Xus1tnu9dqG4yZaA2WRATWUW870YdLnAVNZvqNAh5LMBQR0/ie7cTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5064.namprd11.prod.outlook.com (2603:10b6:510:3b::15)
 by IA3PR11MB9014.namprd11.prod.outlook.com (2603:10b6:208:583::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 11:42:18 +0000
Received: from PH0PR11MB5064.namprd11.prod.outlook.com
 ([fe80::33e9:2b0b:5259:ff9e]) by PH0PR11MB5064.namprd11.prod.outlook.com
 ([fe80::33e9:2b0b:5259:ff9e%5]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 11:42:18 +0000
Date: Fri, 31 Oct 2025 11:42:03 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 =?utf-8?B?6rmA6rCV66+8?= <km.kim1503@gmail.com>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH] drm/i915/gem: Fix NULL pointer dereference in
 eb_release_vmas()
Message-ID: <z4o2gk3i6zeocib4geu3swv2elxdmrgmvqvbgxmu5l2uhsb35r@nqnlnndzozvi>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20251031105259.72927-2-krzysztof.niemiec@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251031105259.72927-2-krzysztof.niemiec@intel.com>
X-ClientProxiedBy: WA0P291CA0003.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::6)
 To PH0PR11MB5064.namprd11.prod.outlook.com
 (2603:10b6:510:3b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5064:EE_|IA3PR11MB9014:EE_
X-MS-Office365-Filtering-Correlation-Id: 569edaad-8d9a-4adc-7af5-08de18728b5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|27256017;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0RGOVJyRjhhUDFzdjIrdTJ6d0xxVTdSYXI1U1FHN0RJdzhTek1hT3BYZFJr?=
 =?utf-8?B?NWlKUkJzRExvZE5YQXNFNnJBbHA5eVZEeFpHK1JKSTdQblRFR3Fub3B3UjQx?=
 =?utf-8?B?MnAyVW9VSTh3SzZyNnNKKytiYnYzeHI2NnJMS2tNZ2N6TmNQMXM0d1hqS2Vm?=
 =?utf-8?B?UFZoYUxUT3NaWFBqaGxQSlhCL3c3eGNqZm4vc2lJMXF4MjJHbDRTbGFYTStv?=
 =?utf-8?B?STdWaFdHV0RKOUxiU3QyaGJqQm5aM284bE8vNnhYTXVQUlJuOVR4WmtwVmFh?=
 =?utf-8?B?QXF6S1Vlb1RXU3BQZHJnMzNTK1NvRmlRd2Uwb1p5QjZVejVBREVCRGcvN0d2?=
 =?utf-8?B?R3JqQ3dUS2dScTRJK0tQUkVEL1NtUHlZMFFnQ25zdU9aVUFTZS93bDVQTVU4?=
 =?utf-8?B?NGRyMHZWbExFdm9xblhPNUd5Q2lJTTE2dVVKSDBZdm1RUGFOTnluQ2V4YTg2?=
 =?utf-8?B?TmtFbzFPRkVyMWdVWlFUYlVrcDhBRnZLUDg4M0kwRjZFSlp4b2E1NWd1dTR5?=
 =?utf-8?B?dlV5Q2g3SER5TnhuUzRydnRmTHgrRzFIQVNFaGJIeit4RFZNVG1WbVN1clMz?=
 =?utf-8?B?bHl2eks0M3VpZzUwRU54Wnh5TE05c2VRT0h4SFFLT0dLWHE4SDJzZmF6U3VE?=
 =?utf-8?B?dk5Xb21HT2RxVTJFdnNTa1pkcGFrdUo4eEhLZmNPN1h0TWxQVE5mVGJGcUdB?=
 =?utf-8?B?bVBKM1c0ZGhRSyt3MmY0dnVuYXROWThmL0w3dkkxZUhNVlZzcytaQnp2bkVE?=
 =?utf-8?B?a1Ntbk1EcVY2ZVlaOUtzc0NtWWtaY05LMGtjUC9rL2ZRaW1uTVd6dThnbUNt?=
 =?utf-8?B?djhiOVlOREJoMHMvK0FNVkNBazdxYytHdHFzTEpRcVQ4UW1BRDRkc1JBQVpq?=
 =?utf-8?B?Q2E0Z3k5VUZ1Nkx0VW1rNWEzM3RhWHM0Y0tSL01UdnFpZWNWSXRVQkRtMXo0?=
 =?utf-8?B?ZzArKzlVc05DTWJqUS9oY1dZR2V6Y09IME9HTExPSTh4RXltN3ptbGgyUm1w?=
 =?utf-8?B?SGY5bEUrZ1AzcVlXWDJaVVdVZy9DbFp1MkxRR1d4dmtBQms2WHZ2bGlIbGZI?=
 =?utf-8?B?TlVXYVV0UVdxSzg4ZFR5alo2SHFPWDcyMHEzdDcyeGt3NkVlaUh4WjRRc2JC?=
 =?utf-8?B?elNYZE50N3pyck1NV3F2YXZVbS9zU2RLWkxDM2RGUnNYTVZWWnV6NCtKT3BH?=
 =?utf-8?B?Z2VYUzJpSFlFNzZ6Wkh1STlsd21STzgvc21nNWh3TUQ1cFl2QjM2Ly9kR1Y4?=
 =?utf-8?B?RHR4aEVhMUVaTUxHaXoyNFQ2a01CcktxQ2hCVzU4STlIOEZ2aWt1VWljbEF0?=
 =?utf-8?B?NncydzdJMVBFUEt2d2t3VElQdit6NWtlcFd6Z3FEWDFNa1VuMUN5N0JGV3I3?=
 =?utf-8?B?UDdoT0t4Qlhmak96eThoY2pFTURONWx2aG1LeVk3WlBhdmdSSXFqNmx3YXVI?=
 =?utf-8?B?ODR0bVRscWp2V3U5R1NtWVNHMStWUGtLcks5YTZwZVZJdDRIY294b05hRXlu?=
 =?utf-8?B?NUJVb0RJN1MrRmp2RytULzFqMVA1OWZGakJoVzFITDY2dENWU1h1QkxTMUV6?=
 =?utf-8?B?MGI0V2lMZmg0VllrSkRQYkRtM2Q3WlpZU2x3Z2RjcEIzc2IvTm96d3JtSlcr?=
 =?utf-8?B?OHgyd2dDT3dpNzg4Q0xjNTRzeWNmbTdZdTdHZnI4TzdjRG5lYWtxU2Fsb1Vy?=
 =?utf-8?B?eW1IdmhlWWhzTU54Z1pZbUdUU3RnUnJMUnBLWE9jTCtZM25aZmFZc3FnK3h1?=
 =?utf-8?B?WDd1VGk0ajlPVnBBS0p5Ky9OekNIQTJaN3ZySU9PcTk4cStSOXdwUlZEREpP?=
 =?utf-8?B?b1lCRHdkMkJteWR3UG1RaWRUYzlKRTVMOEpvZmI4RWdyeGhtV3llZXNCZHM4?=
 =?utf-8?B?dklMRjVGNEJqSi9jTWsyejg2RDFQSURrRnF4dzczQW5ubXhIVXlERi9ON0Qx?=
 =?utf-8?Q?FMecJnk4RJgyyXPnx3olaSrufnyHJ4+Z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5064.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R29WLyttRkFBeFVMeEo3VXR0MDFCSlRBQklGelVXOHNTaGkwMVFmbnpzTWRw?=
 =?utf-8?B?a2tadEpBZEJqWVB2VzhjZ2JIbVRvcVkrcXUzMmx6dXFBZ2tmQ1gxTm4vK0pm?=
 =?utf-8?B?eU1oczYzaTVYWHdFclpmVk93TTA1Tkd6R291R3pkcENMUEw0NXk0Ym9Ob041?=
 =?utf-8?B?Y3lTY2h1dDZhMHV2cThZRnVidFZON0JjcVpqZ0hMazlSZ1hoNnlMMXk4WVZW?=
 =?utf-8?B?NXZuRSsxM3pMQXl1ekk4UGxhM2x3YVdMeVVSU2Rka3QzelQreENrY01TdnBu?=
 =?utf-8?B?aHc3b05jS1MycGRMa3Vvd0NGdFVyd1gvY1lBcnBoVWxxTmFiY3lJaXE5VWw3?=
 =?utf-8?B?N015Q0FZdml6eHZONlBiZ0dzVThGeTJtK2lKREVHTzF4UmI2QlBzRS8xQ2RX?=
 =?utf-8?B?bGE4ckZOYzA2RlowQUx0aUd3U3VsUHV0OWZsdlhmVHpOMkE4UVZLNEpqRllz?=
 =?utf-8?B?TGVlVWJaR1RvR1Q2YXJMRnZTeFdTa3Q1OWZNTExtQ0tVTkhLMXNaNFVEYTNY?=
 =?utf-8?B?SklhRWgwaHhaQStKT1RFR2QyaTZDYWxmekJ6ek5SaThZeUY2b0VFWTZVSmNF?=
 =?utf-8?B?NERDUUs3TkNmcWcxZTVIN1BaU1IwMURrN1RJc1ZEYXFWaVlyQzB0VjQ4VWlM?=
 =?utf-8?B?SGZ1VHJGcHV4S3RvUlZadjZMb3owQWx0WVI5M0Jqbzl5M3Q3dHdFVmhRdjYv?=
 =?utf-8?B?T3V1cTJpR0RQWklSM2FHQ2Q0S24xQmZSdEI2OHZsYy9XUEdZTXBiSUdiSzI5?=
 =?utf-8?B?aUZQaUhIais0V1hKaDFDZmRsWGJiTC8wQ2tqemVlbXBTWU9neFN5VFlhUmg4?=
 =?utf-8?B?bFVqOEdHam50NFR5aXA1QlBjV2lZeEFYUkRyeUdaZmc5N0NLTjVDczZQcGU5?=
 =?utf-8?B?OSs2dktrT0RjUmVrTkc0OERlNGtxc3VSR2xuSVpSRWM3Q3dHSHUzZXUwRVUx?=
 =?utf-8?B?djZveUVFZXJydFZjZ2laOHdPZ0IwVGN3Q29RRWdwY2pYUDFtOW94dE1Gc1hQ?=
 =?utf-8?B?bXlPUVdRT1Z1TmtielR6dDFBc1owU1JxYWRQc2QvRlhSY0wzMnQxOUd4STUz?=
 =?utf-8?B?L3oyZHZLZzdRWUpFTXNMTDU5d0RrTWt2TTR0bnV4eDBVQ3h3aTNSeGtsYi9G?=
 =?utf-8?B?QzdpZjBwdSt0S2s0UVVVQ1Y1OTk2TWxaaExSOW9MRFlMbytXSzZ1V21iMlpl?=
 =?utf-8?B?UFljY1dhL0pxWjhhVHBmMnlxQzNiMExaV2ZrZGF3YUlnSmR3cW1VaXdyam84?=
 =?utf-8?B?cktkeWtLM0EzREVQZXlIT3BhL0JPdXBzenZNS2d6MzByMGlLUnJuREdOWGVX?=
 =?utf-8?B?R1VUNlh0RHZodFM4VGh5dHdlK2JDdE9lTG5LT1B3UnR0Y2dpZm9wRmh0WnRh?=
 =?utf-8?B?bFJ3VkJMQ0pVQ2tkb0dJbHVOeXgwbkJYQ2cwcWZydWRCQnNwQmtXdjFvc2wx?=
 =?utf-8?B?YmEwckxsQ0FtYzF4NkhoaTVQQ0FyWUEwUUFWK0VZSk5NNlBLV3J6R1JBTzNL?=
 =?utf-8?B?NisxVEVRMXRZemFWYVlXUTNzUERkTlhhMmFmZzBaUEwzRjRzOU5mZU9sNTN4?=
 =?utf-8?B?V3p3cmxFSzBtZDBGZzh1eThhTTRTWXREcFMxNktKNERwTnpHNWx0QTViUW5W?=
 =?utf-8?B?N0RMNFVFTytxUkNnSWFBU3ZNLzlvWVpQTEUrcDZKcDNZclJNenNBZWZxNXpv?=
 =?utf-8?B?MDd1YnZreHJKbXQ3VUs5ZmQzK1BkOHIwRUVHSjgxcC84aHNnM203dzZFazdJ?=
 =?utf-8?B?ci9tZUdwNlJoTFJuZWZrbGtQNnhyTExLMURPWVNDd1dNeGdhNzhUR2N5Zk12?=
 =?utf-8?B?Vy9RRDVmbENXTEFoWlZNU1kvMHVPNU1XUUdUOXZPT09YUzlHQXNRdXNLR1ZB?=
 =?utf-8?B?RWcydlQ0cHJYQm5BK3dxYzJ1L3QyalIyaDNOUkxtbStlay9yVWsvZmMzejFi?=
 =?utf-8?B?U3QrV1UvdjRXRUJuWk1TQXdlZXFzNjM2eTlQeld5dkFkSmNCS004UndMWEda?=
 =?utf-8?B?Ry9oZHVlUXpPZHlmb05kejVOTXU3TVZuSzRhODB5czlNR2owVjNxWW9yL1k4?=
 =?utf-8?B?b3YrS3FWYzRzWWdZSndaNGxmcjZvT0R3THgyR3BFZXhkOEQrNGFNenV1aHN6?=
 =?utf-8?B?K25lTHdENytWTkp3d2Y5RVhaNTlqTHpOUFRhMCszUkNEL3Jxc1RsZkFKVU5S?=
 =?utf-8?B?c3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 569edaad-8d9a-4adc-7af5-08de18728b5f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 11:42:18.1001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JWhNYUuOm3/jl1GNLwjRDcGZbCakR1J2QCuszRLLUm41AXXN0hjZRGyGSF53faTk0L4+VjIows4bOwEPAElFp5hVprSMGOUTa1dc25FgDM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9014
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

Hi Krzysztof,

> Set eb->vma[i+1].vma to NULL to prevent eb_release_vmas() from
> processing unitialized data, leading to a potential NULL dereference.
> 
> During the execution of eb_lookup_vmas(), the eb->vma array is
> successively filled up with struct eb_vma objects. This process includes
> calling eb_add_vma(), which might fail; however, even in the event of
> failure, eb->vma[i].vma is set for the currently processes buffer.
processes -> processed

> 
> If eb_add_vma() fails, eb_lookup_vmas() returns with an error, which
> prompts a call to eb_release_vmas() to clean up the mess. Since
> eb_lookup_vmas() might fail during processing any (possibly not first)
> buffer, eb_release_vmas() checks whether a buffer's vma is NULL to know
> which one has failed first. The NULL is set if the vma cannot be set or
> is invalid in some way, but during and after the eb_add_vma() call, it
> is set to a valid pointer for the currently processed eb_vma.
> 
> This means that during the check in eb_release_vmas(), the buffer that
> failed eb_add_vma() (say, eb->vma[i]) is processed (and rightfully so,
> since the vma associated with it still needs cleanup), but eb->vma[i+1]
> is left completely uninitialized (since the loop was broken prematurely
> after failing on eb_add_vma() for eb->vma[i]). Therefore
> eb->vma[i+1].vma has junk in it, and if that junk is not NULL, that vma
> will be processed by eb_release_vmas(), leading to memory corruption.
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15062
> 
> Reported-by: 김강민 <km.kim1503@gmail.com>
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 39c7c32e1e74..0f8f02e22c03 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -960,18 +960,27 @@ static int eb_lookup_vmas(struct i915_execbuffer *eb)
>  		}
>  
>  		err = eb_add_vma(eb, &current_batch, i, vma);
> -		if (err)
> +		if (err) {
> +			if (i + 1 < eb->buffer_count) {
> +				/*
> +				 * Execbuffer code expects last vma entry to be NULL,
> +				 * since we already initialized this entry,
> +				 * set the next value to NULL or we mess up
> +				 * cleanup handling.
> +				 */
> +				eb->vma[i + 1].vma = NULL;
> +			}
> +
>  			return err;
> +		}
>  
>  		if (i915_gem_object_is_userptr(vma->obj)) {
>  			err = i915_gem_object_userptr_submit_init(vma->obj);
>  			if (err) {
>  				if (i + 1 < eb->buffer_count) {
>  					/*
> -					 * Execbuffer code expects last vma entry to be NULL,
> -					 * since we already initialized this entry,
> -					 * set the next value to NULL or we mess up
> -					 * cleanup handling.
> +					 * Set the next vma to null, for the same
null -> NULL to be more explicit and to match the previous
comment.

> +					 * reason as above.
>  					 */
>  					eb->vma[i + 1].vma = NULL;
>  				}

After above are addressed (maybe during merge, to avoid
re-sending?):
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
