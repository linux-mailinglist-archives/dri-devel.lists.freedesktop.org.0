Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9D5BEC97E
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 09:42:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCDBA10E02E;
	Sat, 18 Oct 2025 07:42:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lvMuMg10";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7E010E02E
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 07:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760773363; x=1792309363;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GSkXwKJNGdNDgHUedHFVa1d2rI9aIwh98plwzqqDi0M=;
 b=lvMuMg10E09p5viFo9ywqsUrjfkCtOK+b5RLdoydaDM8mikPNowhlDtI
 Z2/qWnU5dwQSP2Uy8bfQ/fNFHX+gCsiyd1SYkIDUI37F6LtMnkmLAwDp8
 wZLCx4KPnxIp8XwdNTw+F6zKOwG32DfX6DCPHbf6gQAmfs/yXy2LT4odp
 yAa3ItuupRZj7ufFAokBDp3M/zRS/dtnS9qjANCHIH9aNl4zrWKWxvYPN
 tpMakZgf3sMP/Q5q+Hsg/uS8qBbNQJV294xi2ustXPd4t0YvyGEeTEE+g
 5KCWo3fMAS0gl5TYl1u6kVfkAGArJe26I37JiH8iX+6ovmaKSWHbQ9wjQ g==;
X-CSE-ConnectionGUID: RDOz3FXbRXeNULU1lKn40A==
X-CSE-MsgGUID: KflTaUduTjy/JebfQv0TYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="66849310"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; d="scan'208";a="66849310"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2025 00:42:42 -0700
X-CSE-ConnectionGUID: XxKQXqwnTm6VsLFovMfhgg==
X-CSE-MsgGUID: 84mu//zATMuSdRd0JgsqYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; d="scan'208";a="186925492"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2025 00:42:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 18 Oct 2025 00:42:41 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 18 Oct 2025 00:42:41 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.62) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 18 Oct 2025 00:42:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NNnB6xeU8btsoe/AfWSoXylSATAvnhkOnZ/S/83XW7oQWMktiPoGueApbcecfBU7hpM4T66hMv1SrQbfcwycvaxDV65X8o+nh/lkm865YvHcUt5nYVb4xBuPrALJSMxns+VMvUPrZ5X21HEfl/mPL8bqy0YpqsQ7LqoSPby8rIUIys9ORPFUVg+c8TOFWf+ADtbovB1ZvLJY7/8fmX/dMdtBubi4kqJJXBhCos1LmgLcDsX6r1E81SlSlx1av+kD8cGfxAW8WM6FRbudFmf4LHqdgu3vEKDSj1pERvJEyrQz7OMJyCQeFcgDAcL9mTY8uAovuJApNF9GHMEFXVTC6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dg4kaIdlF0iLMSxV6PK1NIp47Ya+5moFXAcGLpxUnkM=;
 b=MMYcYNuTkNFsp4O918S6lI/FIit8nJTK0HqTzG4EeRzmQDLiTDjUCvxfHnjqLM/swhRKr2gq6IeIR93ORo0xyWK9i8tKg9Y7EUXOTiWQjGtcjmGz97StASHNp3mcohE4ri9cSkN+p9Ee7BIujr+BmMnseiw7bI7T/4J5ouWKoBJHa9PpMm4eOlNOXiBVXLO7Vt27eT63d0OU/znzOXOjJinmZRrB7qzjbTJxwTCbZf5mOgRT5SEcM+9FOo3X6FAVJLavt3nImCh47IYw+qmS4BFlTM/Q3dfYLSksiZEjNKI0dyAV7Pp088C+lCfYVR7wocWgPDn3wfGQdI9YgQKrjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7195.namprd11.prod.outlook.com (2603:10b6:930:93::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Sat, 18 Oct
 2025 07:42:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.014; Sat, 18 Oct 2025
 07:42:33 +0000
Date: Sat, 18 Oct 2025 00:42:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Rob Herring <robh@kernel.org>
CC: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Oded Gabbay
 <ogabbay@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Robin Murphy <robin.murphy@arm.com>, Steven Price
 <steven.price@arm.com>, Daniel Stone <daniel@fooishbar.org>, Frank Li
 <Frank.li@nxp.com>, Sui Jingfeng <sui.jingfeng@linux.dev>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH v5 2/2] accel: Add Arm Ethos-U NPU driver
Message-ID: <aPNE5po45Umson5V@lstrano-desk.jf.intel.com>
References: <20251016-ethos-v5-0-ba0aece0a006@kernel.org>
 <20251016-ethos-v5-2-ba0aece0a006@kernel.org>
 <aPHhXl6qdU1mMCNt@lstrano-desk.jf.intel.com>
 <20251017153746.GA1579747-robh@kernel.org>
 <aPM3J2jZcct7ODIp@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aPM3J2jZcct7ODIp@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ0PR05CA0068.namprd05.prod.outlook.com
 (2603:10b6:a03:332::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7195:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f9af854-30ab-47b7-a431-08de0e19e641
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bG1mOU5nazJmS215YXB1NkRidVFLQWZVdXIvQkxmYVhYc1VhRHEwNFVZTFJX?=
 =?utf-8?B?WDFoc1MyWEhBVjNYUE9MWThDaUo5S0p3NVYvQXhkeEZLczN0NU5qMVhuRU9Y?=
 =?utf-8?B?ZkpURklNbTVFVS9ON20rbzM4aUVtYWFYcFFxMDI2SWxUcjdHbG1meFBMZ3pV?=
 =?utf-8?B?NGMzT3ZWbWlXcmYzQzhSS0crTUtjYkFGamxkZ1FsMXZFL3EyNGl6eVQ5d1RD?=
 =?utf-8?B?K1BNMzduNFJ2eGFVTk51L0Q1SHlRYXhkRjQxckIzOThIQzlLaExRTWd3U0xo?=
 =?utf-8?B?cHBNdHc4U2YvZllVYVpNOFFRRlNlZVRvd3FTWWZaZjZPdmJFWmZQQXBkeGth?=
 =?utf-8?B?dGxXV3hZbHg3d1NTU0lXUmtOdVpIWnNQQ25wcHBydzdOdFpndzAyeGRZQUZD?=
 =?utf-8?B?NUx2cVBmVGl4Sk5mNG9EVDdreklJT2NtYmNTaWVjY1JnMExOUDViNHlDVmFo?=
 =?utf-8?B?dXJacXpEZlUwM0tTYjBYUDJzSlNTNXlJZzM1djljVnVjZWxuVnRFK0VtQVFV?=
 =?utf-8?B?Rk4yRmliSDRCTk5tOFVTRnI5Zm1ycTg3NWRoQ2ZmZ24wNXNZSUJlRVJOaWdm?=
 =?utf-8?B?SUU2Q3BOZE5RVTZXSU5lbC9oRlFkd2d5T0VIRjlCNUc2TkF6S21IRzJFck51?=
 =?utf-8?B?OTgrd3dQVTNHNmtuK25DWHhnc0JoRDA3a3ZmS0R5c25RSmZWLzNrM1NwVHpU?=
 =?utf-8?B?KzQ2Nk40NitteGg1bER6N0FIUis1NWJPR0c0U2U3aTlQUGFpSk1PVWpLaVpt?=
 =?utf-8?B?eVFxa0FIcjI5V0RaYmVvWmF0b3RGSnhwWklaQzZrR0FveXRzU1JFZXhuNVEy?=
 =?utf-8?B?UWdHSmNyMVY1bnZRSjhRYUlhektsNExWWUplU0RLTzhIckJuTnhjY3BxamdH?=
 =?utf-8?B?Z0ltNlVoQzJOMTE2T1YrTjNVS2p6TnZhVUFvZ3o3a0VZLzVXdHppazJJd3lR?=
 =?utf-8?B?Z21qMFg1NUJnVkNMNVN4SEFCdUZ2MWM3RWxHUUR4QTJTMS8ydmk1bVZPYXp2?=
 =?utf-8?B?bDA4Yk94bEZvRFhmYVRkc1dOUnI5Y05LMmtuK3BGbUZ5eGlPK1p4akt0elI1?=
 =?utf-8?B?M0tDd2xiNzYxdjF4UEt1UFdLL2dXR0pSblYwMGRRWi9sSVBnRDJzc1VuM0NU?=
 =?utf-8?B?STlqUkZhMkxTbWE3M3NRcllGNnl1MXNKdnZHSzNVejFlWDRaa0JmaDE1ZmN4?=
 =?utf-8?B?ODV3TmFpOVU4QUdJMDg1QmcvdjhacU9ZaExaVmNNU2c0WGZzZnNtbkhoQmIx?=
 =?utf-8?B?eXlNdlVndjZ6aUVRYVFUSkcxUXJwRFBsQXJ3NVc0WVNtTW9jODhma09OODlM?=
 =?utf-8?B?R3k5QnRFUjhIUjJzN010MEdTZ0s4L3RNRHc0TGVaeThSdk14R3drL1pmbnpG?=
 =?utf-8?B?Y3pDWERBR0R6QXBsS2c4L2MwKzVhQTUzVVNMYks4R3Q0Tlh4ZW85Zi8xMGtp?=
 =?utf-8?B?TmhvYlZVZEkxK2RpR3dGS01JdUFpRnNCd2V0NGlFcjdwc3NRZFErb2wzSlM5?=
 =?utf-8?B?RmgveEN0d3IzbEduSU93eHlnSUYxamlzUFlHUVJiSk1DOGFGYXB2SkwwUzVK?=
 =?utf-8?B?M2JnTklkYzg5VG9aSlF0Y2RTRVlEOFU0VjNPelM3ZEFqZzNyYWpaeTFHcEh1?=
 =?utf-8?B?bUU5ekVvcTE4MTJmdTdXQ2NEZlkxZnp1M0VyU3pKL3dLWTY4MC8yNmVpTXRk?=
 =?utf-8?B?ZW00cmtENWFrTThYZC9rZXhVaGx6a2UzVi8wcGpMdXhzdS91dHlpU0laWmZL?=
 =?utf-8?B?VUVZbUU3ZDVZK3gvaVYyRkNGTnlaak1OdWhnS0FKdGQzTXJuMkJLcVBzQ3dL?=
 =?utf-8?B?V29HRngvNlgwdXhJcjRoNURZNEpBa2RSdFRmR3BIZHpEblF2eVVrOURWaFJl?=
 =?utf-8?B?ZUJLb3BYME9sdCtnRWJ6cmtVQzlWL0tvaEt4QmRnT1NSczZMNEp3ZWlzU1Vp?=
 =?utf-8?Q?Z/0S0AHkVXyaDP6ZqGFjqirzof49w32K?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGtqWWxVVmFid0lad0psVDZoL1crRlNtS0dvMk9rZFI1MnlNUXNMMmVCbjB1?=
 =?utf-8?B?TFZqS2ozQlU0a0RocGE4dkkzVldNbVROUVlrOE9yQnJEYUd2RE1IakY5MnBj?=
 =?utf-8?B?dXptbW4wRWtRU2k1dlJsNWVCeFpnM0NwdVhlaGRDaE5mRWtDeDNuTWdoR3k5?=
 =?utf-8?B?ZmJRKzlrR3dua3hiSnBzV0JReUJhMVhMOVMvWURRSzNTRWVXa2gyb3h5UGZx?=
 =?utf-8?B?U0Z4b0gzblVQZXJvZ1QwTWhlYnFCUlVYTWxEVmwzcXVzTFRvb2crV0M4L2Zs?=
 =?utf-8?B?ZUdSZTJxbE5VdVNwRXM0eFBPNldMQ0lRVjJxQ0pmU092anhqSXR5ai94Smpw?=
 =?utf-8?B?emtCZ2VNbFBBN2YwOW5VYVFTU21lVmErWER6T2VBcTVYcTNGWUhDUXFRMEpJ?=
 =?utf-8?B?S0h6TXdNanZISGhXQjhvTkdWSSsrclFnY2hUOHNyUGdWQ25SRjlia2VhSGdG?=
 =?utf-8?B?WWhnUFRDb2ZWMWFwL2o5d0tmVVZucmVySDRzNXZLNG1UUHhOMG00Y2xDdjBr?=
 =?utf-8?B?ajNRWWpFN004V08wYmd1R2VYSlQra3dYT0NLZy9OcldVcUR4NmlTalZLQW44?=
 =?utf-8?B?YkJ2NUdKVkZtZnpMYTJ4ZDEyeXdUMGhWTi9TZ1FneXY4eWJJMDR5YjBORjZI?=
 =?utf-8?B?SmRCOVR4NDNvTVhhSlNJRTRLN3k5WE5PajdMZDhpYWVLMnNnVnowTy81bmdy?=
 =?utf-8?B?NnczL2JsNW0zbWhCeUIwQXdXVXljUUpvbngzS3p0UlpOVmFKV1NQL2NCenkx?=
 =?utf-8?B?N1JRWTlTQi9DZTdjNDlRTW1PTkJ4ckh4QWNrY3NudVNwWjVjbGlCOGVucmZw?=
 =?utf-8?B?SmJ0cmx2RjVzUi9ZbzlwQ0dPUm9SWlFldHc0RitqdW1pMGtLTG94ZUVPN0c2?=
 =?utf-8?B?V1NjU1FrSGlubUdwajBnNkhmUmQ5dzV2Qk5qWWFPZWw3VGVrWHFzc3hscGp0?=
 =?utf-8?B?OHVncHlQTjFLb2RmSHlDVGk5SDBjekhJT0cyclM0LzRNczZFRmtXV3pIcVJi?=
 =?utf-8?B?TTViTGtiVVdTNTZKWk0zc3BCclFlN3lVK0dDMjNDNTIzaFZuMXZNT24rL2VR?=
 =?utf-8?B?TVdEN0pLbnVuK3I2ZUM5UGN1bHJlSVNjakFkT0UrRmNhcUZUeFhXdm5Yd1cw?=
 =?utf-8?B?SDhaN1QwVVVKMEdkaTk5Z3pkWSs0SE1PK2tKUFpyU2pTbGowdU5UR1lvOHV3?=
 =?utf-8?B?eVJZV1pmRzJCazVVWDVMVEtnQVRXY1RnN01remExWlNEZlFzS05GL2JZeFlu?=
 =?utf-8?B?MUt4cG9PWnNRTSs3cW8wZXFNMTZ4elFvdlZQcVZmaFd5Wk9qVm9Wd3Q0WG9L?=
 =?utf-8?B?MTR5NWtBR0wyeW1qQ0kxRlNIV2w4alVBZXNvWEk5U1RkRE1FRk0rdklBMmJl?=
 =?utf-8?B?Vk1YYnlJenhEVzgvL0ltTlhTSkVoUU9QQ2RUeC9GUWg3QmVQeVhXVDFncGZB?=
 =?utf-8?B?aUVLaWJtaUpPMG9CUmI0K0V1VWQyQ2JzNXpRR0wrRURwdERTMURPK2ErMXNT?=
 =?utf-8?B?Uy9TL3NhWUwxMnp5dzRCS2psM0N3WkFqMURhZVFIQlphQ2pjNUpzMGo2TGtP?=
 =?utf-8?B?ZlVLeUhqS2dqSlR1S0NmT0wwa2QzRjU3amFwMTVKbXNNZlAxTVB3aHZNUUxK?=
 =?utf-8?B?TjVxemVqSHFRQUdla1N0SXYzWGpITkdKejRtTjdkQmx3cTlETGpVRmxIam5M?=
 =?utf-8?B?UUJHVUlza09ZU1FwRkkxUndKYUdZT2NwT3N1eXlXVlBsQ0grZjJFbnJsbG5r?=
 =?utf-8?B?cFdVME42cjdrdkpHcEZOUzRsWlE3SzFZOUxraGU0UUdwdzg5NWt5S1hQcHE1?=
 =?utf-8?B?SmNFcDNqRnhkcitHYVl0aUc3bTdDV3VjcEZOWVJucHlCV2dLVjI1WmswdTdU?=
 =?utf-8?B?SlVEZmhhNDFRVGZ3bFB5cm9od1VDQnlMUEY2MlNpNkZlZ3dEOWYvWGZvVzRB?=
 =?utf-8?B?eTIwSkVYQ2NVZVFQNm42Q0VrVGVsUDdoZ0RsQ3B1RDRWQ1dyQVQ1b1ZCUTFr?=
 =?utf-8?B?OGJtY3g3VVVBaC8xWWtmT3hKZDE2WHU2Y2JIck5WTlVKNFdvSWY0VE1FU0RG?=
 =?utf-8?B?dlBVM1VFWFg2MC8vektiemFhbEJZTjJNL25pV0RNZEo1d1V4ak93cGdiWlli?=
 =?utf-8?B?NTFDTEtwbW1HaWdYRkJYUklxT1V4SFhsZEViaWtNYjcvRFJvVEp0d3RteHcx?=
 =?utf-8?B?bXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f9af854-30ab-47b7-a431-08de0e19e641
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2025 07:42:33.4980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s97/c+y6+ZVeHaFq4Qvqb+n7ZkZay+UQNVF9KN7cKJry9VvI/6OFHp/pmKE1nb/566sfU8zHY11ygRUEGDgRdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7195
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

On Fri, Oct 17, 2025 at 11:43:51PM -0700, Matthew Brost wrote:
> On Fri, Oct 17, 2025 at 10:37:46AM -0500, Rob Herring wrote:
> > On Thu, Oct 16, 2025 at 11:25:34PM -0700, Matthew Brost wrote:
> > > On Thu, Oct 16, 2025 at 04:06:05PM -0500, Rob Herring (Arm) wrote:
> > > > Add a driver for Arm Ethos-U65/U85 NPUs. The Ethos-U NPU has a
> > > > relatively simple interface with single command stream to describe
> > > > buffers, operation settings, and network operations. It supports up to 8
> > > > memory regions (though no h/w bounds on a region). The Ethos NPUs
> > > > are designed to use an SRAM for scratch memory. Region 2 is reserved
> > > > for SRAM (like the downstream driver stack and compiler). Userspace
> > > > doesn't need access to the SRAM.
> > 
> > Thanks for the review.
> > 
> > [...]
> > 
> > > > +static struct dma_fence *ethosu_job_run(struct drm_sched_job *sched_job)
> > > > +{
> > > > +	struct ethosu_job *job = to_ethosu_job(sched_job);
> > > > +	struct ethosu_device *dev = job->dev;
> > > > +	struct dma_fence *fence = NULL;
> > > > +	int ret;
> > > > +
> > > > +	if (unlikely(job->base.s_fence->finished.error))
> > > > +		return NULL;
> > > > +
> > > > +	fence = ethosu_fence_create(dev);
> > > 
> > > Another reclaim issue: ethosu_fence_create allocates memory using
> > > GFP_KERNEL. Since we're already in the DMA fence signaling path
> > > (reclaim), this can lead to a deadlock.
> > > 
> > > Without too much thought, you likely want to move this allocation to
> > > ethosu_job_do_push, but before taking dev->sched_lock or calling
> > > drm_sched_job_arm.
> > > 
> > > We really should fix the DRM scheduler work queue to be tainted with
> > > reclaim. If I recall correctly, we'd need to update the work queue
> > > layer. Let me look into that—I've seen this type of bug several times,
> > > and lockdep should be able to catch it.
> > 
> > Likely the rocket driver suffers from the same issues...
> > 
> 
> I am not surprised by this statement.
> 
> > > 
> > > > +	if (IS_ERR(fence))
> > > > +		return fence;
> > > > +
> > > > +	if (job->done_fence)
> > > > +		dma_fence_put(job->done_fence);
> > > > +	job->done_fence = dma_fence_get(fence);
> > > > +
> > > > +	ret = pm_runtime_get_sync(dev->base.dev);
> > > 
> > > I haven't looked at your PM design, but this generally looks quite
> > > dangerous with respect to reclaim. For example, if your PM resume paths
> > > allocate memory or take locks that allocate memory underneath, you're
> > > likely to run into issues.
> > > 
> > > A better approach would be to attach a PM reference to your job upon
> > > creation and release it upon job destruction. That would be safer and
> > > save you headaches in the long run.
> > 
> > Our PM is nothing more than clock enable/disable and register init. 
> > 
> > If the runtime PM API doesn't work and needs special driver wrappers, 
> > then I'm inclined to just not use it and manage clocks directly (as 
> > that's all it is doing).
> > 
> 
> Yes, then you’re probably fine. More complex drivers can do all sorts of
> things during a PM wake, which is why PM wakes should generally be the
> outermost layer. I still suggest, to future-proof your code, that you
> move the PM reference to an outer layer.
> 

Also, taking a PM reference in a function call — as opposed to tying it
to a object's lifetime — is risky. It can quickly lead to imbalances in
PM references if things go sideways or function calls become unbalanced.
Depending on how your driver uses the DRM scheduler, this seems like a
real possibility.

Matt

> > > 
> > > This is what we do in Xe [1] [2].
> > > 
> > > Also, in general, this driver has been reviewed (RB’d), but it's not
> > > great that I spotted numerous issues within just five minutes. I suggest
> > > taking a step back and thoroughly evaluating everything this driver is
> > > doing.
> > 
> > Well, if it is hard to get simple drivers right, then it's a problem 
> > with the subsystem APIs IMO.
> > 
> 
> Yes, agreed. We should have assertions and lockdep annotations in place
> to catch driver-side misuses. This is the second driver I’ve randomly
> looked at over the past year that has broken DMA fencing and reclaim
> rules. I’ll take an action item to fix this in the DRM scheduler, but
> I’m afraid I’ll likely break multiple drivers in the process as misuess
> / lockdep will complain. 
> 
> Matt
> 
> > Rob
