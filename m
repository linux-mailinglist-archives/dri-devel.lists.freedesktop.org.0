Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BA98D1808
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 12:04:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1189610E066;
	Tue, 28 May 2024 10:04:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BR6/+0tq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5CEA10E0AD;
 Tue, 28 May 2024 10:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716890661; x=1748426661;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QNTbK/OyDJx9y1+3yukggCXLlHlb4pQbkMbod24r+ec=;
 b=BR6/+0tqPHU/jJFAODffAJMNRbqWk/TEtFUW/BjN4T+0E3bAVphMq+c/
 Hlo8qiDmLA20eWnaMybaibAEvo9nF0IyrehyAUhN0fqnSreKHQc2YwcwG
 Wq7KguUqv/quLQBMIfA9TiZzvRvFMdaVFsSHGp1Isdm195xLNc6nrnkgA
 MBf5flo61zL8MZOR9C6SXRN+m6WEsM4H+FDGFkXnC51R+fTmrdq7XgDLU
 Omu7hlPSeWNYYlZeT4PHJUMQYuSwRFYt7lFtkJ1g6JaLLav6ibGnvKomc
 vPr4qwUti1yWdCKNmfNckmWpzVeyBKP5UbNuyQpBMWfpUZWHqAWfOy08D A==;
X-CSE-ConnectionGUID: l39T+KVrSOWGtLFqwwyJQQ==
X-CSE-MsgGUID: X+NaFZPKSyOIz6OPlXGR7Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13098963"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="13098963"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 03:04:20 -0700
X-CSE-ConnectionGUID: zISYwZ/BQlmkswaL+7frNQ==
X-CSE-MsgGUID: YLy8zjIUSFiXr+y393qZSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="34956481"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 May 2024 03:04:20 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 03:04:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 03:04:19 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 03:04:19 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 May 2024 03:04:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YQc6bYHyz0iBIqGq1z1lgTLRVKV+ylZYK9sl2PuQcMps8EVsf+E3yqOMc6rM9KjZLzP5bcuVjzIPu35Z9vJhs47dbImusvTrvopRrJpUPoWlJ7J0DLu+HUD6AObITCtsXT6oT/VO95hf3XncJxcJmthsbSLN27qizc+gg075X3t4a10oGrgnWOw5okRJ2qCTCAxHuXucBSe/jt4/c5Z0C9VKGbHIW0f2Ve6Qel4VrOW1RrGXkX0YqkgnYPANIjdgLl6T/qSHJFZEY22wXwLlSxbx5IlOwODVgz1JFy2Z4YrhqCDaMjTOIQtP0cvTPtfuRfBxvFf1OFsQ+u8CtIoppg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QNTbK/OyDJx9y1+3yukggCXLlHlb4pQbkMbod24r+ec=;
 b=gAO9RhIuH4S6sVlHo2la5wP2R7mQAOp6six0JGzfXSywEaK3yKqrHLn2LPVjaN4efOFq9uxd3hhBUowSnmc98pqY9p/H5WHo8omqn2jdv4TAT9crte6h+QVhTrMYzjg9Gw7ubhII5nX0ugak2OmEZr4fWR/xXvX7og6N514nfDYZbDsYtJEVmDFkNNxIk3wHqXlVEIpdjduUi5xy+c6Fs9cP5ZBGHh0r5HRoRAgZ6osuhJxUgnG0ebObYPNU4jG3kUN9PhVqNOnLpDBreRg2gQktJCcCKkk6MB1nSSAe2QKuH0Di8F8/4cIxIEZX7kzXJcTEBvVTSf3M2aL04cGrPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB5981.namprd11.prod.outlook.com (2603:10b6:510:1e0::15)
 by SN7PR11MB6656.namprd11.prod.outlook.com (2603:10b6:806:26e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 10:04:06 +0000
Received: from PH7PR11MB5981.namprd11.prod.outlook.com
 ([fe80::40e0:95a6:26e8:8de0]) by PH7PR11MB5981.namprd11.prod.outlook.com
 ([fe80::40e0:95a6:26e8:8de0%6]) with mapi id 15.20.7611.025; Tue, 28 May 2024
 10:04:06 +0000
From: "Manna, Animesh" <animesh.manna@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "Hogander, Jouni"
 <jouni.hogander@intel.com>, "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v6 3/6] drm/display: Add missing aux less alpm wake
 related bits
Thread-Topic: [PATCH v6 3/6] drm/display: Add missing aux less alpm wake
 related bits
Thread-Index: AQHasBIAPvGWwmTODEy6mHKh4F4oBrGsarxw
Date: Tue, 28 May 2024 10:04:06 +0000
Message-ID: <PH7PR11MB5981DB0A17046BFC9E5A6BE0F9F12@PH7PR11MB5981.namprd11.prod.outlook.com>
References: <20240527082636.1519057-1-animesh.manna@intel.com>
 <20240527082636.1519057-4-animesh.manna@intel.com>
In-Reply-To: <20240527082636.1519057-4-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5981:EE_|SN7PR11MB6656:EE_
x-ms-office365-filtering-correlation-id: f73bd3c1-a3b0-4dcf-362c-08dc7efd8292
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?YTZtclJNczhFNzJ0YU5oU3VjLzlYVFIwYjd1WTVOcWVNdlNSMGplQ1VCamFj?=
 =?utf-8?B?VzJiUmt3bXlaUUUwcjhYWnFaQzJxRGFmT2VXeitwU29HQzVaczZQWG1VVzI0?=
 =?utf-8?B?WU16RkdBeFhtenVaWFArclUxVHp4c1VLbGV1NTVlQ2JTZ21NeTkxVTQ4TjNo?=
 =?utf-8?B?N1o2STdvWkVUZ0xhWHdOM3hPUS9YUUFuRkkzellMVmhJZmViUDI5ZmVYMldR?=
 =?utf-8?B?VmNyUm83QmR3WlA1c0t5TTJGSURiU0d5bGJWUnJZbDhrWWNHaGtEYkkzbjA4?=
 =?utf-8?B?ZjBjczdnaDNWV1B5WDNJTE1WK2w5cFV3UmRsbDBtMTRoQWQzUDdES01YLytw?=
 =?utf-8?B?QnkwUnhoNE1ObUtzUVo2ZC9OTUxJVVZ1NUMwR2RsblVnbXljYWRTV0wzbWtt?=
 =?utf-8?B?MFlsT3Y2RkZJTkNKd1ZsT0c4UjB3SHkvUXVOVVdETnNPWDAvUW91WFQyUlZs?=
 =?utf-8?B?OFBuOVMvM1A1V0hZNzRZYmxBZ2wySFNFOXR2MktaK1FQajJ1VnM4TVAwMGNu?=
 =?utf-8?B?bUk4Z21ZOEJLdUxyM2FaSFFYKzIwejVOZGprWm5BMit4NWdQQ0tMUHRPUXRl?=
 =?utf-8?B?U3hITHExSmFMeWdVZG5JclByd2RJK0xibUxUOE9mOCtCQlhrbnJOU252NDVJ?=
 =?utf-8?B?aUUwcXJaaGVGeFpwUzFXelIyVWQ5eGdHZmtlUm4rdHZiQlk3SCs4WTVTZjZK?=
 =?utf-8?B?alhuemJ1Smcvc1VlRS9xQnhKVC8wNjlncTg4Z0l3Y2hiRHI2bFoxTWhySHZH?=
 =?utf-8?B?aExUd0ZUR0R2Z0ZYaVovMDFUSlJYdHFqbkV4TjVGRm9aNUpSalkreXJTclZF?=
 =?utf-8?B?cHhwRWRwbzU2VUdTK1RXdXZvZFNnV1B6MVQ5ZklCZ2dOeWQzMFVXbngwT0pm?=
 =?utf-8?B?cWMzRDBnSGxkSFNNN2RMZ29mKzVPaEdnVU1QR3UxWHVabHNnZVFWaU90eGNk?=
 =?utf-8?B?RE1lTW02REZCZWFBNi96endvcG0reTQxZkJuVENDVld0N2Z6Z2dBS09NSXdC?=
 =?utf-8?B?M3pqdjhiYXVPemJDdTFINTVPaEtiVFNwUG9hbUd3aDVHb1YrRjRmYkk3UUov?=
 =?utf-8?B?bGFyVktzSzRzUGZpdTZHaEZFVXFPRCtybTl5cWtMd2RYZ1hTbUtHSnZnOGtD?=
 =?utf-8?B?Y1l1UW5rS0N1VkNUWWFWQzdMWGV1ZFVlVmdBbXNScEJmT0I4TEpOODVEeFVN?=
 =?utf-8?B?MWJDczdVeE1UN3U1QkRHbXRmaXVULzlabHMvTzNaeENZdEZtQSthSFlpUUFU?=
 =?utf-8?B?U2VTM29qaUVTcEU1NGREdnB1aVpka1Rob3RNR0pYR1JxMnBOaHJXUzVReE40?=
 =?utf-8?B?dFNtYTNaaFJjcnlQWGEyQldjVXJGTG1yK1JTS2lUQzBabGVrM2VzcVVXakxC?=
 =?utf-8?B?WHFVbk1iSVhXVnduNTVSOWwxamsza2VURHMrbU1VQjhoMmZBdTFrZ1ovSEJu?=
 =?utf-8?B?dHg3WTBhaVY5RXU5NXpZeWw2RFEvdFhhVkp1OWgyQUVlU3JPWlhiWENlSzlY?=
 =?utf-8?B?Z2ZFSEprcURGcW00dVpEODkwaW5hczRkSDhOeC9MWGxuSjk4dHFvbDM5NE8r?=
 =?utf-8?B?T0VTdjJieEhkSmVnVlYrSDQ4QjVuL0lhNnliMWlRazZ3VmdralZ1OG4vc1d6?=
 =?utf-8?B?M0N6aTgwenRtZmRWRTNFS21XNi9OdlFMVVBiTWZVdFZlUXdIYkVTK2Z4czJm?=
 =?utf-8?B?QS9EalNoQ3ozZEZCRXM0Qm9rL0J4c1N0ZWltS0drc1hOVVhFOTJvWUg4NWpI?=
 =?utf-8?B?S1JHTGZTQkpnMVdhQUJNQndidXlYZXhTOHkxWkhlZzQ5VDA5OElLRFJ4QXkv?=
 =?utf-8?B?UWFtcmFhYmhZd1c4d0tzQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB5981.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VmI4OXFzRGs3SGxlWTI0YTlGRUdMNFJXbzhSNlpwMkRncTBjRE1YLzNIRGRm?=
 =?utf-8?B?WlpyK3lqSFdEdkMxK1FFVnVkMjlTWDlTQ1lJMWJhbi9CSThWYmJYU1Q4bk0w?=
 =?utf-8?B?ZVJzRVdBWEh2bVlNTXlMSDc4WlQ0ZVNGN3dyWURKL01aNytqSEIrMmZjdTJi?=
 =?utf-8?B?elFHemtsQlM2T2JUN2xKeEt1SCtpeHI2OGdPUVRxME5yK1E2K2JtT2F0b2VU?=
 =?utf-8?B?SWYzaXlVOTNHVUY5K3BzelNIbktTRUFmZzFNa3dEQ2h6SHRPT3dla2dpV2tk?=
 =?utf-8?B?dDExeWw5RWNNbkd3aG1RV3dZVGJYc1B4eHYzNlM0Zy9UTGJOOFY4OVJBc2Jt?=
 =?utf-8?B?eGxsRUNpRFB1ZExzR2pkZ09EUnBXSTdTL2JyMUxJWlB0RUUxUmR6VkJCamNI?=
 =?utf-8?B?d0g3S3RCY3JEOEFxcjFtaGJYUmw5ZlEralpYeGt2amZFVys0RTU3SUF4amJ2?=
 =?utf-8?B?QmhVSGFwcXVWUGdpenlnL2szbUdEKzROTzVRZ1QrdWFVOW1HRG5xdDUrdUNR?=
 =?utf-8?B?S2dGaWJKR1ZoamVhQm1DdmhkcnVLd2daUW90YThQbWp4aTdmaVJUMFBIcm5m?=
 =?utf-8?B?eE5CenRUZWxSUFd4WFRZWTR0QVUwTVBOc1ZDVHpuNVZoUTBFcEN1b0VHL1NC?=
 =?utf-8?B?cWpXeWNRSzRSYlRINGRYS0Y5ZzlRa0pvWTdaT2FLL2Z4VW5mdVA1cldmQlpW?=
 =?utf-8?B?ZWt3NW9wd1RhQTFLQ3lsMHcvdGY0bW1yNFZNdTlpeFNQR0prNDVNaG1HdVdQ?=
 =?utf-8?B?OVZMaU5uYkVyTWd0T3RmUTMrMktleWJFV3pjOFArNDBlWGoyMURXaXpWN2NW?=
 =?utf-8?B?dzRTek81cFVxZE5LVGF5RTJ3T1RXY3djNDYwdlU5NmxJNXBpSzB6eHQvY2ht?=
 =?utf-8?B?YUZsUkRiWHIvSDcySFNZV3lBUjZSYjQvRU4rVGpNK1FabHErcUZ3Z0JzSGJV?=
 =?utf-8?B?SEwyNFltcUtsL2RRT1Q5c2h6U2dxZXZ3Yldoak1hczBFTUN2ZzBrb0lmTm9l?=
 =?utf-8?B?RXNEek9jb080d21XRjlWVjRyN0t6ZU1SK0FyR2ZiSGx1cFJENkxITzhXOWk2?=
 =?utf-8?B?QU1GZkl4c2k2VTJWc1pUbmtFcUd2VktrNDE5WFh4ZkZ0OEw0cFgyT0x5UlNY?=
 =?utf-8?B?Vk8xU3BvTkRYdE1zdHEyNU1oU0h0bGFtU1QzanllWHFVUW1mT25NamVrRGtX?=
 =?utf-8?B?d3drWS9FK0pJNTU4MGhjYjRXei95bUUxeHkxa245Wm5hTUV6YzhaTHU0em1R?=
 =?utf-8?B?bS9RNWljeXFuT2Uyck5vQ0lLMXBuOWN1SEdxYVErYlVpb21CY2N1RWluWCtm?=
 =?utf-8?B?M0V3NXIwMHNJNWQwS3YxTVMzTy9McVd2M1lMZGtndVdyUlcxQkd2VHdMdlVl?=
 =?utf-8?B?Tk03Uy9VTDh4VVVvbnZoY0R1Yk9va1g5UGdKUWk1VWc3MEplRWE2U3hjcDF5?=
 =?utf-8?B?eW5PWUtXSUpkdjhnZ1c4enRwejhJQmYxdldueDFqSThRV3Nyb1NvR1U1bUQv?=
 =?utf-8?B?dDM0Mi9Ec21OOHFnS0ZpWjNJNEIwcktYem9LQ0krYzV1aDhzNVBQZGo0bjRB?=
 =?utf-8?B?eXlEUFU1UFRGWWUwaEtLdEY5VnpPdVJZUGlJMlR4OHBLMThhQmZQc0FWSXEx?=
 =?utf-8?B?UUhHV29TbGNCWTZBbi8vNklMajFKV3Z3bE9VNE5vaEpsbnA3SUt4NERYUE5J?=
 =?utf-8?B?eWtHV0ZSOGo2dWl4dXJ1eU9EVUQxNFJhNyt5VE5TMk5ZU1JoTGNhb2U0RUpY?=
 =?utf-8?B?dlo5dU9IYW1uaitjdmxWM2pSWVdBekthcTBhbHBwNGhtbmpQNC8xOWJlOFN3?=
 =?utf-8?B?QW5NM1ZpcFVLRGIzai93ZkhEbFUyYmRKVWxicWgzYjM0aWpQWlZlTHIvUnl1?=
 =?utf-8?B?OGtvYitwZ2V3VWs3QU1oN2xIeGRFQkl6di9uZ3EzbTJkVnUvc1VMckxCb0dS?=
 =?utf-8?B?SUJsVU5YK0MvQkJaRjdBSytEOVc4WnBlbHo0em9yaFVVZWpLRWVKVFdpQXZX?=
 =?utf-8?B?V1Rqbmx1bkptWVVWL20rN3lWdDRLWDFLZTdNME9Xc0x4QTEyTm1OdXl3MkZt?=
 =?utf-8?B?SGN5R3B3ZXB2TUxLRFpkMFF5a2RjQW9MOHg4QTRWTS96WkFRNlQwYkYrY3pv?=
 =?utf-8?Q?8Y5JrQkySCzzs9RHBOLqgkOV+?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5981.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f73bd3c1-a3b0-4dcf-362c-08dc7efd8292
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2024 10:04:06.1721 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dbr4S6UNRA9VoOlB+1QwwXIyFeIG1JI9WaXFd2EWx0zMxoAVIvdaObgH3G/0II9IsuSegwTskKskt6/ntxD1jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6656
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

KyBkcm0tY29yZSBtYWludGFpbmVyDQoNCkhpLA0KDQpDb3VsZCB5b3UgcGxlYXNlIGhhdmUgYSBs
b29rIGFuZCBhY2sgdGhpcyBwYXRjaC4NClJlY2VpdmVkIHItYiBmcm9tIEpvdW5pIG9uIDB0aCBw
YXRjaCBmb3IgdGhlIHdob2xlIHBhdGNoIHNlcmllcy4gIA0KDQpSZWdhcmRzLA0KQW5pbWVzaA0K
DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEludGVsLWdmeCA8aW50ZWwt
Z2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4gQW5pbWVz
aCBNYW5uYQ0KPiBTZW50OiBNb25kYXksIE1heSAyNywgMjAyNCAxOjU3IFBNDQo+IFRvOiBpbnRl
bC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQo+IENjOiBOaWt1bGEsIEphbmkgPGphbmkubmlrdWxhQGludGVsLmNvbT47IEhvZ2FuZGVy
LCBKb3VuaQ0KPiA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPjsgTXVydGh5LCBBcnVuIFIgPGFy
dW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjYgMy82XSBkcm0vZGlz
cGxheTogQWRkIG1pc3NpbmcgYXV4IGxlc3MgYWxwbSB3YWtlIHJlbGF0ZWQNCj4gYml0cw0KPiAN
Cj4gRnJvbTogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+IA0K
PiBlRFAxLjUgYWRkcyBzb21lIG1vcmUgYml0cyBpbnRvIERQX1JFQ0VJVkVSX0FMUE1fQ0FQIGFu
ZA0KPiBEUF9SRUNFSVZFUl9BTFBNX0NPTkZJRyByZWdpc3RlcnMuIEFkZCBkZWZpbml0aW9ucyBm
b3IgdGhlc2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhv
Z2FuZGVyQGludGVsLmNvbT4NCj4gLS0tDQo+ICBpbmNsdWRlL2RybS9kaXNwbGF5L2RybV9kcC5o
IHwgNSArKysrLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2Rpc3BsYXkvZHJtX2RwLmggYi9p
bmNsdWRlL2RybS9kaXNwbGF5L2RybV9kcC5oDQo+IGluZGV4IDkwNjk0OWNhM2NlZS4uMzMxN2Zm
ODhlZDU5IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2RybS9kaXNwbGF5L2RybV9kcC5oDQo+ICsr
KyBiL2luY2x1ZGUvZHJtL2Rpc3BsYXkvZHJtX2RwLmgNCj4gQEAgLTIzMiw2ICsyMzIsOCBAQA0K
PiANCj4gICNkZWZpbmUgRFBfUkVDRUlWRVJfQUxQTV9DQVAJCSAgICAweDAyZSAgIC8qIGVEUCAx
LjQgKi8NCj4gICMgZGVmaW5lIERQX0FMUE1fQ0FQCQkJICAgICgxIDw8IDApDQo+ICsjIGRlZmlu
ZSBEUF9BTFBNX1BNX1NUQVRFXzJBX1NVUFBPUlQJICAgICgxIDw8IDEpIC8qIGVEUCAxLjUgKi8N
Cj4gKyMgZGVmaW5lIERQX0FMUE1fQVVYX0xFU1NfQ0FQCQkgICAgKDEgPDwgMikgLyogZURQIDEu
NSAqLw0KPiANCj4gICNkZWZpbmUgRFBfU0lOS19ERVZJQ0VfQVVYX0ZSQU1FX1NZTkNfQ0FQICAg
MHgwMmYgICAvKiBlRFAgMS40ICovDQo+ICAjIGRlZmluZSBEUF9BVVhfRlJBTUVfU1lOQ19DQVAJ
CSAgICAoMSA8PCAwKQ0KPiBAQCAtNjgzLDcgKzY4NSw4IEBADQo+IA0KPiAgI2RlZmluZSBEUF9S
RUNFSVZFUl9BTFBNX0NPTkZJRwkJICAgIDB4MTE2ICAgLyogZURQIDEuNCAqLw0KPiAgIyBkZWZp
bmUgRFBfQUxQTV9FTkFCTEUJCQkgICAgKDEgPDwgMCkNCj4gLSMgZGVmaW5lIERQX0FMUE1fTE9D
S19FUlJPUl9JUlFfSFBEX0VOQUJMRSAgKDEgPDwgMSkNCj4gKyMgZGVmaW5lIERQX0FMUE1fTE9D
S19FUlJPUl9JUlFfSFBEX0VOQUJMRSAgKDEgPDwgMSkgLyogZURQIDEuNSAqLw0KPiArIyBkZWZp
bmUgRFBfQUxQTV9NT0RFX0FVWF9MRVNTCQkgICAgKDEgPDwgMikgLyogZURQIDEuNSAqLw0KPiAN
Cj4gICNkZWZpbmUgRFBfU0lOS19ERVZJQ0VfQVVYX0ZSQU1FX1NZTkNfQ09ORiAgMHgxMTcgICAv
KiBlRFAgMS40ICovDQo+ICAjIGRlZmluZSBEUF9BVVhfRlJBTUVfU1lOQ19FTkFCTEUJICAgICgx
IDw8IDApDQo+IC0tDQo+IDIuMjkuMA0KDQo=
