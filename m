Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6390C930D29
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 06:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B7010E235;
	Mon, 15 Jul 2024 04:22:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R5Rk1pxI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD8C10E235;
 Mon, 15 Jul 2024 04:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721017338; x=1752553338;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=L6hPju02C1p/SJwHn1CdQWmPnybBcpnrg0/EOcxcIWo=;
 b=R5Rk1pxIqYZAM2iiBqsG/yZpeuN3x4n4NnCoDPJ5DhHWtqqYbRF9qUWW
 aTLw23xLR03Q+XLkfgnaQwP30BbRzCQZfOWW9zZ88vMl2kDrpcIVOqN8y
 pa2Sd37GsN1n1S6UDIMFk01R9z6UJXQFF+87UOUX8ZndPFTAiGrMt3tSv
 CM0l2e+8hk+opS5baTTd3peMuiiwKvvma9wYVxRS7CVGIwyDZ63JvE7c7
 xEDQeZ76EULZwWJB4c9wjVggb9+1JWt2Vz6xS78X99z7mZJPHYJvlw4ja
 hV9ZLntpt1ilR2qDMRKB0DzTGkYFu4CmEwUOdhW/4YR3kHopadk8H/doR w==;
X-CSE-ConnectionGUID: dcmK4D9GRjO7BkO3UHi2LQ==
X-CSE-MsgGUID: sTNMksKfSHKKCzgMfsQFZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="18091150"
X-IronPort-AV: E=Sophos;i="6.09,209,1716274800"; d="scan'208";a="18091150"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2024 21:22:17 -0700
X-CSE-ConnectionGUID: GOtTX23uSsKt1UAzE1YGJQ==
X-CSE-MsgGUID: KGPNksDiTCGu2RrwGEH/QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,209,1716274800"; d="scan'208";a="49575796"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jul 2024 21:22:16 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 14 Jul 2024 21:22:16 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 14 Jul 2024 21:22:15 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 14 Jul 2024 21:22:15 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 14 Jul 2024 21:22:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m/ZQqOIBHB9UoyF61kMFcpTOnV1D8dfFIFq9eQzQwRRx7S8veu+9j88IOrr6sG+0W2lutYUwv/q2LJx5R1tEHG/jmypTkcS2k05asDGSHakzOSCiaOEEt5nvhQRQNBjIY0+gPDnMDAZcbi9EGpmfQScn6AAzap+yiiBT+1ZnNqd/CuxaY35+6bSyH2h86Oma3c6ls7VMjEmA1BDzAgt2p+ntHHDxVeHUCGn/PSAM1cpz0/I6hs2SYEtdhfmBSXmm0vNV5169awKFfOdv9LjQvNtnJw2IYiyycRi2uuS6JLKECyeBPj8ch34CDL9cnMHGyxK20mdmAaDr070S+hRd8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYxoRpjhHt8PdVMBtz4n86DFscdcll34/ax1g7CrlWI=;
 b=pBu5AFpB/Wi0BpjU1C9T8XDppFkDpiuA9JpErFzCr2tgKnfVADrzLubHND9LXkrnC1F9hfAah1sfftE/V2MERaLYEWVQy0AITUVP9KhHcnvyhA+BZwVbRj0zk3anNZiGjWKEoV7aZcNUCOTFlCJhC3xHJIheHmZwMRzuj1ib26o8eQjiBpfDPB0Gd5+2+Farch1HP7WNqqk1w6W+bpZV1kjhdW+FXMyQqxCaydX+YYSnIbZns8Vx/ORMXOx+btmsdf8iBogZHD2Yku3FgDkgCdyICmLE1OMGjr1FLgmR8NyfnoI6coPae/F8LhuL27uAEbj4jb8DVwcVfBeDoQFneA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 by BL1PR11MB5286.namprd11.prod.outlook.com (2603:10b6:208:312::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Mon, 15 Jul
 2024 04:22:06 +0000
Received: from IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::4db5:b0d9:b6b3:bb52]) by IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::4db5:b0d9:b6b3:bb52%4]) with mapi id 15.20.7762.024; Mon, 15 Jul 2024
 04:22:06 +0000
Message-ID: <774fa28d-b196-0030-2fb2-5d5fb8a7d1cc@intel.com>
Date: Mon, 15 Jul 2024 09:51:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: linux-next: build warning after merge of the drm-intel tree
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@redhat.com>
CC: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Linux Next Mailing
 List" <linux-next@vger.kernel.org>, <maarten.lankhorst@intel.com>
References: <20240612141110.3aebb166@canb.auug.org.au>
 <20240715091234.5e8b2701@canb.auug.org.au>
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20240715091234.5e8b2701@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0112.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::30) To IA1PR11MB6348.namprd11.prod.outlook.com
 (2603:10b6:208:3af::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6348:EE_|BL1PR11MB5286:EE_
X-MS-Office365-Filtering-Correlation-Id: 663f62a1-ba88-4b97-f196-08dca485af92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MkRMSThTYVVEcWpBWkFIR2htZjV3TG9SSEVPem5SRnRnQ1BBVFlDVmxFVy9m?=
 =?utf-8?B?RW1MbjNWcUI0YWptYVM5YnE0eWNtc2dhYkZoNFdpK1RvaWlhSjIwZ1hnTmVw?=
 =?utf-8?B?SVIzVjg5R1g4L212UExIOU1ITnlJNHpMV2RSSy9NcHZ6OXp4UVo4Q0hxbVdP?=
 =?utf-8?B?NExMWUpxUm00ZXVXNm9wYVZMOUdMZEpzdGxrMnkrdkhCUm1QVWZrbTNycFgr?=
 =?utf-8?B?OEY4VU9MTkFYcitvZDZJbkhkb09ySWZ2MENMZWNOZ0dkU2ZaZnRWNUhpVWlQ?=
 =?utf-8?B?RW44dnlKWTJKWFpXNkQ3ZXhrODVualZtM0wzZmRrcFNWcFdqS1Qzd3NHYkt3?=
 =?utf-8?B?R1FiMGxLVEJpR29hYWh4Kzg2a3hhRWRLSWtERkpBdjhaMGE4eG9hVjBoWVhn?=
 =?utf-8?B?N3BQWjJ0RVFZWkNST0lCUTdScTZZWGljNFV6K2tJOHZGY0R3TU9nQXJ6SnN4?=
 =?utf-8?B?enFYdDg0c01Ja1BhTWhRY3VTUG0rZTZGYm5vWUxPVkQ3SlQxY20raEhkb001?=
 =?utf-8?B?QWFTR200Y0RsVjVGZU1UQU9vOXRVMEFYYzluczBxNThLWlA2NkNBdGVWQTVG?=
 =?utf-8?B?cVpZd1NGSWwxTmlONkdWQ091SnNQemNOS3RZV3h3K0RjS0czd1lKME1uRzkx?=
 =?utf-8?B?a2NKTTFlRkpUUXBWaForYzZDUHh4c3RlaUNIRXVxL2ZGanpmYUZDS2V6YXFS?=
 =?utf-8?B?eFkyOXFnRHNrY05hR2ZjRVQ5OG5aUWhoWWg1VS92NzZzRlpFdGgwWjNacExo?=
 =?utf-8?B?TXZmZDE1UCt6K0JwWjJRTDJmUWJDem9uSTRoZ2ZpMmd5Tm40Vzk0TUlmSnZU?=
 =?utf-8?B?QTZxYTE5TDZjRStSZnprVEdrMlh1elBmbWxzTmkwekVGM3ZtellSeG1ELzRC?=
 =?utf-8?B?Q0Rma1JQT2xsRW1rZjl6dnFBOVNYdnJzOWNDWW9PbzMySHJwT2M5emFWeCtZ?=
 =?utf-8?B?ZnRtNDNaMVV6WjVKUE5TbXNvT084cGZtREZLaFE4THJuTk1mUkpBeklVTXY3?=
 =?utf-8?B?bk9jYjA3R1dxaDhEOEcrWGZwZ29zUkdVZmZJWVYyRm12M2djSjNmSFdmWUR0?=
 =?utf-8?B?OVprTXFYZGx1cXZJVzI4VURGM1gxNmY4T2ZFWTFtNTlDaTBETk1wUnBZa1BW?=
 =?utf-8?B?U210TFVtc045RXdtdGtQOG1JVTJDb3phd0hBQUNEbmZPOXByckxYYXMxMkRV?=
 =?utf-8?B?UUlUSU9DV2RZRnFQUE04aXRROXZKK1RLL09DVXI4WldLb1ZQMFpWbEt6TDBn?=
 =?utf-8?B?WFZzL1c1RkZxbjFPWDBNc1pXRW9JczIrWnM3RU1xS2t3dnlJTzFEbUh1YVUv?=
 =?utf-8?B?NFNDQmpmaTRpODFQSDRlRExNY0JaTzVSRVk5WjdjV3JvOGxRZi9PeTJrVWNW?=
 =?utf-8?B?UG5mYzJmSzhHTmIxNnovUWh5clQ4K3Q0bG9xVkVtWGg0VzdJOElCRE9Vbndi?=
 =?utf-8?B?WWxhZW94bjIrQjNCeTUvMlN0VXpORkozK1RKdFFPY1FkZkFkZVNYK3lEcC9P?=
 =?utf-8?B?bUk5UVQ1TmZRSU0zWTdKT1ZLZ2NDcUlsbytpTXcrSHRmS0xtZ0RjR0VIVHpi?=
 =?utf-8?B?TVR6WHZVR3FWdWtBK05NcGJialdLVmttRG95ekYwby8xc0pRcTNhemkyK25q?=
 =?utf-8?B?TzRJeU00c3hKa3BNNm1ZdzF4REwrZHZQczkxNng2UW1lUnd1NldGc3BybzRs?=
 =?utf-8?B?OHBoWFZCTzZDQTIrYk9KaDNWNi9pT0hRSmV4TVpvWmJQa3pvTWR2dGYyODh3?=
 =?utf-8?Q?sg0F6oGzufnfakJP1M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6348.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VE55bk1tY01uNDZXUDMvRnZGaEtXY2NjUGloWUVvdnpqR3k2WVVHdHVpTWg0?=
 =?utf-8?B?c0lySTlyZ2I3UExZM09yVlp6cm1pT291NFlsUE5DYjN4b0JncFNhU2c2MWxv?=
 =?utf-8?B?V1htM0Q5M0FGb3VhcXJCZEFJNE82ZWxQeXpmZDRrWi9iWVhnVE44Yy9UeFQ0?=
 =?utf-8?B?TnRMcFpnd1V3NVRCWU5wNEFGTEtJa0QrSFUyWHVCdmFwMkw5QW5YN0dTZjRz?=
 =?utf-8?B?cXNLVkYySDNpL1NyYmdqSnY1SVR5ZlFpZFhvL1A5V3RwVmRwUGhPam5Kazd1?=
 =?utf-8?B?L3g0Q1FHK2h0YUJta2JyQUtya1FMVU5OTGwwbkZveHdtMHI5TzhrKzVTZlQz?=
 =?utf-8?B?Z2ZjRHJwbDRNWnQ4aG10QTV0SkdGemExUDdiaWs1UjNxZ2NMNk54aGZ5OTdm?=
 =?utf-8?B?VmdjYWpIR3Mwc3R2aFJyakVjRE94V0F1SU5QMjlsU3UyKzVnM2h1TnJEVFhk?=
 =?utf-8?B?STZsT3ltQ0lKOUg3dE5ROVFiUjkvU2NXT21WMWN1L0ZERjIxOFJ2YnQ1MU5G?=
 =?utf-8?B?dUNOM21hUURxVGVyMSt1dHhwSFZIdlJ1Ty9ZcEE3cDJ1eVRITmVxVGcraUVS?=
 =?utf-8?B?UFBCU0JtbEVUZVVQZjA3K1dFL3FXUzJieXh3WWg2c0VMa2VjUWdQSHpiNG8z?=
 =?utf-8?B?RVo4dUNxVWNjSlZpNnk3cVkzb0NybG9lYTJqdDhRdDZlSjRNeGU5dC81Qmoy?=
 =?utf-8?B?a2xielc1VkJVOEp6dnl2NVlldzVvZVFpYmhSL2JpZUJMTDhSSVl5RXEyTFY0?=
 =?utf-8?B?bVJ0V0R5a1JkZXVQSWRYWld2TWRlaTE1cy9WN3l3b0JqTFdqOVFVVUpiZXo4?=
 =?utf-8?B?emFFK0dRNFVPSDNTTVpycUFmOTlXdHhJeVdPOXpPeDU5Y1UwVHkybWRBTmpt?=
 =?utf-8?B?b0RoUGRFckFHN2pVV2NEbVhqc0NlNTNWcmhBRnZ0R1NmdTJmQm1VYXZja09r?=
 =?utf-8?B?TFhyWE9PRDZDSEJFaGlxaHorMGZnQTY0UjBuVW1HQzdUT1JTVFR5Z1RBTUJR?=
 =?utf-8?B?c2tlWFU2KzlXNFQ4QjIrZVlETkorVitNcnoxdkJGV0pyamsyc2tibEQ3RnpC?=
 =?utf-8?B?YTFKaTdqb2U5K0x2QkdXUEJKc1ViOW02NWxlYUFNZ0FoenRuSjFZNEY0NTdK?=
 =?utf-8?B?a2xIcTd5MmlGZE1CaHVLam9kb3hBY2FmTnN1ekV0U0dPZnMrSXZIR2k5dGFm?=
 =?utf-8?B?UXA2eERTWndOVzFtVElUVjNiUFR5QzdFYUh3ZzNhR2srSmRSVElWSG1iNDFX?=
 =?utf-8?B?L01DK2U1bVpIYi9vQzFjd20vV3dxU2IzYnJoWGdwWko5RTg4RFVpdFBoY2NZ?=
 =?utf-8?B?cyt5ZjBmWjdDMHBhNDhtblJjalpBNHN4L2VSNm1jTndTTXJXdGlaMTBWVDll?=
 =?utf-8?B?dlRoUWllSml1MzVyRlJienBPTUVscnN4ZHFWbVBXUVNEaE8zYXRnaXlnN3Fn?=
 =?utf-8?B?SlBaWDVuNFhZWFQyVk9leitsQ1VaTlJSek5iUXMvaWJMTEdTQTVuT0ZrVGpy?=
 =?utf-8?B?YVZDbkNOWll6VU0xMzFoZnZCTEJDNFJYUEFuakpWd2dxR1d0Qm05QnhTdDBL?=
 =?utf-8?B?RkNHRk1TMXh2SzluMW9WRi9rbnNDQXRpazdWODhVdVAvc3E0Y1dtODRCdlZR?=
 =?utf-8?B?eEFoNVNkVnBIelZLd01waGdZUkZ3a2ZSRm9IMnFCL0RjTVVsTTBrY0JnQ24r?=
 =?utf-8?B?cUEvZHB4Tk40ZjZJVnl3cysrR2N0dU5UNytXNUVzcnBDOGVKMDNwRTlCV1dR?=
 =?utf-8?B?ZEFzMFllRlFSMkJ4K2QrM0JvSUVPTFNpZ0MyVW56ZjJ0M1U2VHZ6UTE1dVFW?=
 =?utf-8?B?S0JBVm5oaHFWUW1ESXg2dmVDdllGcXgxdFRjdWVPRWtlQ1NKQUIzNmZIVnZy?=
 =?utf-8?B?dkQ4dDZMT3VtampGVkhMN3lzUlJOd0VWSlR0Smc1OHE2R011aEczelhLbWk4?=
 =?utf-8?B?S0paOWVGMVVnTVlLekczMklZcTR1ZEFTMnZ3MVg1cjJid3REbG8vQ2h5bnBK?=
 =?utf-8?B?dlpmNXE0T1ZkSTFQYWFPOUUzSkswT08vUWp6aGFNQ2Nsc3o2Z3lhUTZWYmF6?=
 =?utf-8?B?L1UvdUxyOFdRT1NjL0crbU1FcmU1aG95L1RiZWJ3S2FqekpQNUpEL0orMzhy?=
 =?utf-8?B?SzU2aWZBTmxtbEh5SGZsZFpGTjhCVXdESW1QR3IxRktqUnNIb1ptbVhQZHND?=
 =?utf-8?Q?H8267crOTKUqRET8GMOqkKk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 663f62a1-ba88-4b97-f196-08dca485af92
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 04:22:06.6299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9vxM3Ro38glinu5Rvz6stP7DtYCgQsgE4nz4ONXu3sndwjsti81g+wvBH6bdCmLd2Tf4Fk0oQ+KGnLiN2XO7m+BoUcgY2UfOkk6NMRV6uxptl1HE0KcFZM62emtGYcjY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5286
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


On 15-07-2024 04:42, Stephen Rothwell wrote:
> Hi all,
>
> On Wed, 12 Jun 2024 14:11:10 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> After merging the drm-intel tree, today's linux-next build (htmldocs)
>> produced this warning:
>>
>> include/drm/display/drm_dp_helper.h:127: warning: Function parameter or struct member 'target_rr_divider' not described in 'drm_dp_as_sdp'
>>
>> Introduced by commit
>>
>>    a20c6d954d75 ("drm/dp: Add refresh rate divider to struct representing AS SDP")
> I am now seeing that warning after the merge of the drm tree.
Hi Stephen Rothwell,

I have already floated changes : 
https://patchwork.freedesktop.org/patch/604143/?series=136072&rev=1

Need help on Ack from drm-maintainers to merge.

Regards,
Mitul
