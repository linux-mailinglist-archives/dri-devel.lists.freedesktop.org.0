Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E81B7AC8C90
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 13:03:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 401AC10E83B;
	Fri, 30 May 2025 11:03:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dAA/rYki";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B0D10E83E;
 Fri, 30 May 2025 11:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748603034; x=1780139034;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=awNWiDNxl4kze4TtfcKN89C5Y7yM+ZmIuxi23dFkH7Q=;
 b=dAA/rYkitr7i59CnzcP7y1VOvLAwjEEgdQVV+49oGRbxENnxpZ0KPb4U
 TwOnoRKz7jb4hYK9uAjkZeYPEULj64zVzYyUCnQ79wB200HBmeTmB7S7J
 cMCft3l4m6h4tGuoh5gZsOICXJF+K3x0m1SYAheSBfUfCqdQ0sj/u/ePr
 YWSiFTSZJs7wFl9ufU6M3+KpW4QXyktnT6SP2SLTqa55rALaUl8g5PzHm
 HwI+5nzaKZ0lwpjTpGu4oPJAqHw/cB4Sgb7/VAXEZpZz9Xut8p5rZGKjR
 Epoa9RXBUhzOHLc0ZVNFc24sKlWSzbBZfLt29mUchU4COtqRutng7ECk4 g==;
X-CSE-ConnectionGUID: 1h9OMRApSxidPDoMxVpF8w==
X-CSE-MsgGUID: dTulYL5mRzO/BlLConxJHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="68243885"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="68243885"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 04:03:53 -0700
X-CSE-ConnectionGUID: twHUmjjUR+ectsVM3fWIqA==
X-CSE-MsgGUID: s0o552bfRie3/17zQwVnog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="143762486"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 04:03:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 30 May 2025 04:03:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 30 May 2025 04:03:50 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.42)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 30 May 2025 04:03:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=idlPh6QVNBo3hvqaE8HXIjdG/q96MEIWpUPEElgHaOd7/g6Ilv5iRT03ugd2luiGxaNyl1p8N1/Nr2XbCISwP+kleuK6weCDM0oXowRUueJo7LpiTvgkROlLlWqI2s250vaUVn/LgurxkAHxgtRZCUYdbM36GxlHAuF1OPhe5ymyIBD6Z8cn3PBNDG8a7zAbBiOZbsZCBHvZQpsRyQzjX/xx4Zq5GkxBRagsgVl2W4L2ZwryUhiQOyoS6L9uzyKHv/AFY9Z2+crm0iBb3wMqoxYuh7Qg5Tfu09ki7tiKVKL/cBdy9lWuRdTlY7FmN8Y1c9ruXOnZkrTgMOTGAsJX6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A5/a33H8O0XAHn9X5UBAVhErlQc8KfrPqBTSOGrVgS8=;
 b=nijr24HIGdCRqxvv8RytepEcZlFjwsEv/GJyCc2ves7nFJl2J5pS5DvfNLU0FE7W8DEGJ0zn11ft0k0fUEI20N8gHytjgMq3fErMz9WIBOSVbvLAUqVXJ2YrOQPkGSodxm2h538O63DT3k2YX02EHc50c+AUlCNvMGmopq1Aw7YpulxHsunNpnHF3SiqbFJVTSS+34s/lE5Nbg7h7YbR5rNvA+2qWYQ0rkIiG+Rf/ezw7x1F/hhJv7E2tXk8rP5skW8uT8wsdE7LP5Wfgs6J605KGPzrAKNS32H64E4b8QNZDLr8WwtBr8rseTbM6OX/+2YNJXD4XUq6F0rpaKr1nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by IA1PR11MB6073.namprd11.prod.outlook.com (2603:10b6:208:3d7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Fri, 30 May
 2025 11:03:46 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%5]) with mapi id 15.20.8769.029; Fri, 30 May 2025
 11:03:46 +0000
Date: Fri, 30 May 2025 11:03:36 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Jeff Layton <jlayton@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Kuniyuki Iwashima <kuniyu@amazon.com>, 
 Qasim Ijaz <qasdev00@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <thomas.weissschuh@linutronix.de>
Subject: Re: [PATCH v12 02/10] ref_tracker: don't use %pK in pr_ostream()
 output
Message-ID: <vuz2jyho4awh6dhqjgwaqqc6a7zlsuhr3s7lw4nhpc6tuiuur6@pzuf3pbyup52>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250529-reftrack-dbgfs-v12-0-11b93c0c0b6e@kernel.org>
 <20250529-reftrack-dbgfs-v12-2-11b93c0c0b6e@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250529-reftrack-dbgfs-v12-2-11b93c0c0b6e@kernel.org>
X-ClientProxiedBy: MI1P293CA0019.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::16) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|IA1PR11MB6073:EE_
X-MS-Office365-Filtering-Correlation-Id: f667fced-1174-45df-95c2-08dd9f69a61a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NitMRFZNQnBZMGVMRnpHT1E3S1JmQXBudDZpcFRCTlgzdVBINlZxQU1xS2Vj?=
 =?utf-8?B?ZjRhK2c0U1RzcWV5cnAxT3ZGTHQ2dDVnY3dYdnZWOVMrdHcwL0h0eDFMZWly?=
 =?utf-8?B?a3NieW9QaGNKaUVMbm9TT040dXhSODMwNFZvS1ArOUs3T0dWcytGQTNaU0RT?=
 =?utf-8?B?UlduNThGQnlMQis2VTlYTE9lN2NQQnNqbktZd0NBNi91WDJJWVZ6VkY4ck9T?=
 =?utf-8?B?cFBLWWNCaFRWdVhLYUNtRTkxbUlqUzF6cmFZMHdUekh4SmcxeUROMHRXTGFo?=
 =?utf-8?B?d0ZMR1JkZ3FXMVViWHByZWpaL2c0UGlkeHVncXJWMUd0ZXRieUNDQ0kvaE13?=
 =?utf-8?B?QVFkbWdxRGYzc1lDbDZicDF5c2U1RlJxK1MybGxpYW05YlNZeHBFK3FxVVFv?=
 =?utf-8?B?eGI4RFN1aHkvaU5OcUpGYU1KRTRkTG9DcW1rU2hNQkVVQ1ZoalpZYkNXRHFu?=
 =?utf-8?B?K1owUGFKQW9pV0VWU0pzMjY3Umwva0xMWDRZV2puc2xCUGhnREtQV1lEc01U?=
 =?utf-8?B?NDdmd0wzcDRuQUxsbFhvMVcyYXRha3NYVTVqU0lrekNpbGFNZVNMQzRmaFBH?=
 =?utf-8?B?ZExoNXZuVWlrazREMkpnYktWMTQ1WnNjc2RKTTN3OFl2TVZyYWh6a1ZLdnNK?=
 =?utf-8?B?UEVtVnQ3RVU4MEdvbXBDc1NWd0RtelQ5dFJVeFdJUGxRRGRBSVI4azI5SkFM?=
 =?utf-8?B?YkowbGhYY0hoMU5wTExqcm8xUDJ2ZmduNldjcVV2ZE9aa3FEWm43bDB3ZUtY?=
 =?utf-8?B?M0l5Nm1YZUNIWFU4T1d0d3pJSzNZYVo1OG9qVnlPdFBaQzd0ckNiZHlETlRN?=
 =?utf-8?B?aFNvdVE1Z21KVFRQbTN3Zm4yUFBGN0xYUEFOZGxhR1hzeWdra2ZuY3NjMUwv?=
 =?utf-8?B?YVhsQ28wdTBRcmovK2lmTWI2VWxkbG9JeDVQK014QmhWT3JIVzc1RHdIT0dj?=
 =?utf-8?B?WkVadDB1NjY3d05Ja3Y5Sk80UzJEbVlNUFdlbjVXRFlybUt2V1ZQdmpTcnl6?=
 =?utf-8?B?WldONm1RMUpMZ2IzdXJuU1UrNEllcXUyaXJGNHl3bmNpUEcyR2hVYmMzMWZq?=
 =?utf-8?B?eTJWZ3JUb3h3aklyN3FTT2x0N0hmUHZ6NjRiUTZUb1E0OXI1clpyUFA3OUUy?=
 =?utf-8?B?VFF1cThnMksrZEtRLzBmK3pYLzQzbE11Q3NuTTdVQXcwdjVNekdiV0U4WmUy?=
 =?utf-8?B?eTFzWEhrbEtiMk9JQkE1VUFiZi9abDNlZWtUaW9VVkFPVjVINDkxUjlrRXd3?=
 =?utf-8?B?Yjg1a1VmdFVIdGF0MjR2YWZ5eTB2anptK0hVWWtxU3RHQjdlMWhPbW54cTdR?=
 =?utf-8?B?S2E1RmFwUURsN0d2dFA5TVJJMFV2cWJzQzl5djd6cG5MRWhZZEIrcWg2KzdV?=
 =?utf-8?B?Z3NNYWlCVjBJUFdySStTUUM2OS9lY2c2djhIUU1mSVNLc1J2U2ltRHJ6RUVU?=
 =?utf-8?B?NEg2RnpxSVQ5VXp5SVo0ZlhmSklNWFF5alI4di95YlQ3cHBEZ2pYMDFPT3lH?=
 =?utf-8?B?UVB6QnRlSVdWeXYyODVtNzBnQ2JoalhNdUU1YkZJRmpEU0F2OUdlR1kzeVl0?=
 =?utf-8?B?VzhUKzBnR01GZnNUY3dDalJjRllVakpqTDJpWW1TZXJDaXFNRmVjUzEyRnhy?=
 =?utf-8?B?cXl0OEE1SmlnVTVzMFdXL0JYcDhIa2R6dGVvT0I5RGN4ekhraTRoc1JsMUVn?=
 =?utf-8?B?cW1sVG1XT3NHaGNoWmtaMFZVM1lvYmg0VUhoS255elpmRGtFZVVuMjZNbjQ0?=
 =?utf-8?B?cGdtRzMzTTIxRThRR1BSNXJyOVgvSlh5ZFpFSng1ZzBNR25QcVBxVlRvT3Nw?=
 =?utf-8?B?cElVUFBqa1k3dE9ZZkJLbE5TUVJzYUhFT3hxOEZ0TElxakpOa2RQS2hpSitF?=
 =?utf-8?B?YXYvTjY5V1N0MzBlUzFrRDRjNmVrUDdsdHk0SktzaERSdG13RTIrNUNxOXRZ?=
 =?utf-8?Q?1wobXd+5omY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmVIUUs1SVA1S1ZzK3AvYW5jZERpOG5KM2NlVzY5S2pxWDVlcTFUZVg5L2w5?=
 =?utf-8?B?aDVnUlM1aTVoUmIyRExUZmxFTGgraUMzay9lNVc5OXJiRjhUVDNpeTh6ZjZu?=
 =?utf-8?B?VU1xUUlsVEdoc2F3eHU1TnpNQ2RyTG96NHRaYXRzQnFsdDFxdThDUXRlVVYr?=
 =?utf-8?B?bGdoOFZkdlFWeDNPSkRXQUhaK2pFcCtLMEdHUnVCVmJQNlNaSzV5VEtnSjRu?=
 =?utf-8?B?Uk82UXEwRWJhQnJkUFB0ZnBUV3JZVEgxaDdNMDFIYWo3SWNIK2FBay85V2Yv?=
 =?utf-8?B?U1NGekozelNSdmlmWFhBWktuR0xJbU1jS3J4VEdKVGV5MWUyMVA5TmIyZHlL?=
 =?utf-8?B?bXFEWGNsMzBCL205dTBtRVZiM2FRRE04TDc5ampWeFJmak1hSHBiVGZTVk0v?=
 =?utf-8?B?WEpIaktodHRBNXJLYVFLbDAxZG1obEVMVTVSWGZLbStSMTBuTHlsTXdmelNl?=
 =?utf-8?B?SWpxU2UyeUxxbXZtc1REcHQ1YktBLzZSNDVzVUZIcFh4UGlST0FwVXU2K0FH?=
 =?utf-8?B?bDAzMFZCenlpcW1xWDA4Zk1NMXF2aGlKUFVLejNIdU9ZVDdFeDFvTXlaS2Za?=
 =?utf-8?B?ZDFia1ZjSWNlekJCZEhPclN6a3VEa3NlQTJ1OFVDWElxRytLSUg0MzBQM1lj?=
 =?utf-8?B?ZkZDcnN0NnN0Y255RmtCdDFpTUllR21PWExTZEt3NDFJdWhFMmprbkFLRU1z?=
 =?utf-8?B?djl5alcydmQxbEdsN0pPcUgxOTlHbnFxNy9ueXBGVVJhWURqMGl2VGJYNHV4?=
 =?utf-8?B?eVJ1OGVIdStqRTBTYXJMSTE5TEhyYzhiQThveEtOVU92VUxqMXFiQUQ0Qk1G?=
 =?utf-8?B?eXFHbzNsc01uK05HdGpzbFlzTi9sQkR4SmFrTEVyWVhkTzNZZ254WmVSMmh4?=
 =?utf-8?B?cVZtRnlHRFFna3JjaHQ4V28xdGg2TnlBdXJ5ZFBRUzhSK0dwaklxengyTlZR?=
 =?utf-8?B?RkJzd2tTSnQyOUJEWUlyTnFIUUlBS2x5TUJvcDE5Zko3akdFQ1pFWEpsNUxD?=
 =?utf-8?B?S3BRM1BVbWNyWWRKNW1BREtnZEhJSU95RDlPUVVZNWZJYmYxSnVFMmZYQjZj?=
 =?utf-8?B?R2R0V2JzeWoreTBydnp3RHJydC9seEVTanYvZSt1L0xzZW9nUmZaUlRDOWRW?=
 =?utf-8?B?Tm5aRDNKaVNXem02bll5dVM3alA1dTExSHA1K1JwakUxQno1WEQ2N2gvOWhv?=
 =?utf-8?B?eGN4VXoxbUo5a2ZYNk1lQzV1aUlWQTZUcWFTWTRuOTZnUG8xd1RqSmpnNCtI?=
 =?utf-8?B?emxtMGF6TThJa2ZVQ0dXNW0yczVLTmEyRlU4Q1RsdFNCQmNpbHpOUVVjRk4x?=
 =?utf-8?B?TjdyTVZKUkhhTjNaWnR2UW93T1JKcGhxaGtJK3E4QzhFV1ZyYnFkcUt1UjR6?=
 =?utf-8?B?MXh0am5VUERQSG5FRFJ5S3hvdnByK2hPcUdGNFdSR1NweFdrUGRkVHNtM3BH?=
 =?utf-8?B?bm03NzF2TEtpVFd2SmRHQ3lRd3BvSmE3Q0ZidHBVR1M1SS9YRmFHNmVoUlFI?=
 =?utf-8?B?T2l5YkZoU1FNcEFHZE9QbTkyYzBSQld2RHp5MjlXaERZVXRaNGtoOHY3NmQ2?=
 =?utf-8?B?eVpVbEVkaEw3bURNVFVuaTE4TjNNQ3h5YUJrcFRXcUdpUzdLcHdBZ3FNVzB0?=
 =?utf-8?B?ckFjMkxMcncrSWdXTnVEcS9TQ1ZNbjZIVGNMZnJRRUc3RFI1a3pCSVVvM3Fz?=
 =?utf-8?B?a1Q1WGtiMVhPV1g0dm9HRzQ1SlJTUUlWMXFTOVY5cU9MNVAvTDFRZ1pEUkda?=
 =?utf-8?B?TzZUbUMzUU9FYVF6ME0zaXYwQmlSWHkzRlJnYnM2OWFNWFl1azF0T0t3R24y?=
 =?utf-8?B?NkJuandHUVg5Y3VlMlpyNkFEV1R2bVQxd1pBaDVrbFU2NitsWjcvRHNzbVI3?=
 =?utf-8?B?bzBLQk8zNnFPUUhuY0tFdWI3NWwwL2lYbkFpMThhV1EvekZHdExpVk9NaFVs?=
 =?utf-8?B?LzFqMFA5NTZoY01vSU5JZm96QmY0eTRucUl0am9TQS9raUl4WUpxLzE2Vy9P?=
 =?utf-8?B?eC9sQ0gzWlM2RTROOFBGY1B1Zi9Mazk5QjRqVHJrU1JrYllXVENzYWdlKzZQ?=
 =?utf-8?B?M0JiUzBUR040TFgzN1JjRVc2SzlTTk4vaXFjRDJnMWk2VkJKVG9QL3JtSmtK?=
 =?utf-8?B?T2Q5N1pBOXQyUWZwVVY2d1pIWEt2cVhDSmw1UExGTmlwMG5GWFFVR2JlKzVn?=
 =?utf-8?B?bEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f667fced-1174-45df-95c2-08dd9f69a61a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 11:03:46.5033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: shkB820mAyLDjcNLmHuCDwVcpr/BoW0CsfRQGg/4/PKkKFweumiD+Xfbx5GEgmkGwfUKJWSIPKcAY0IaCjeJSYW+a25WgDrdiFW/XvwbhC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6073
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

Hi Jeff,

> As Thomas Weißschuh points out [1], it is now preferable to use %p
> instead of hashed pointers with printk(), since raw pointers should no
> longer be leaked into the kernel log. Change the ref_tracker
> infrastructure to use %p instead of %pK in its formats.
> 
> [1]: https://lore.kernel.org/netdev/20250414-restricted-pointers-net-v1-0-12af0ce46cdd@linutronix.de/
> 
> Cc: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> Reviewed-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

Best Regards,
Krzysztof
