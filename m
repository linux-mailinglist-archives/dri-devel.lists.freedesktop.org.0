Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CS3Nd9mnWlgPQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 09:52:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4683C18403C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 09:52:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB6310E514;
	Tue, 24 Feb 2026 08:52:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fdOawzJX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9313910E514
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 08:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771923163; x=1803459163;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NYxTKUzVZ8LPRP1dKXorMhzLR8qhVS8zsqvdvHnjdtg=;
 b=fdOawzJX/Q8ORm3h7BnRYrnaOmiKichUlvl9HBqUXexO1quLqlUt9ZQm
 Dv8L7DDxrKv7LpEds+qQoFF682zNRGzef5iNDRvWMD59nuyna8HtCrB/w
 tB0o6hi19bLczLcoG7LR+OgRMVDEm+R8Kz1r37uE+pfCZh49JyE/yZKM3
 wp1k0U4nhSn3j7M0q6ocmOQHButZ4+JZYQSTFfXJTqM4aUK7POncnHZZQ
 RyAss3N5ygGwoDNTWS6hQW6Ms7WEHZH7c8AM7dK4Ne84fBAK0q4bQpqqv
 6NhzVeDB/MLBOlalxQcXqWtsBQZ3kMqqTFvI2DLCj0jSDz+Xz7K+NHeK+ Q==;
X-CSE-ConnectionGUID: AGMcOe9IRxmKUUfJ3Xo2Pg==
X-CSE-MsgGUID: WVcPJVQQS1Sb0pYxn5Q/rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="83554316"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="83554316"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 00:52:43 -0800
X-CSE-ConnectionGUID: lnh5jzPJTjOfO5ihLDwU4Q==
X-CSE-MsgGUID: o+Q4TVZuRzmLMY1orrRsBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="246419257"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 00:52:42 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 00:52:42 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 00:52:42 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.10)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 00:52:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eXdUqzyDNb8gDyODwVTOM2WWug/wpvNQgZyYRGKdt5n7xIFcE8YjAew9cu4ILUDqKn2i6vKfODc0c0Be+vvJYfVi/KgLiQAKws7qKFH/DxSlEFdWDbGA/+AK0ZJfHaBUt/CFvXYdarAEEU4WF5h50dZZH30V1hBX+PxN53w7zQbe1a8oW/VqGQfsN3sTIiqN9Ea8Zr2W73N6QEgV2+PviL3uqx3ACjjli9uyOFfbDCtXsVUrFFywQIlzlurR46b9FnV9MAIV2kzwDix6otrSwTxs5VDWQypiTPqY6ObuJKyE16J4Q3qZdfd6Hx+SMbo2RgnewG5GRoIetrNeKXwYIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sRMrWmK8FhZNeYYi10Wz22FlKUeCwkuAtmjLq4CMJMM=;
 b=hSyiAr8i32X9bxExx3TOpmPoTdOz/tSzAcx/79NFRhDFCT4GYkJ6SCuDLawubr8daJ9l6SRpk2XDGKPJi+6O9uMuYUPc8RCMJF1ACLinLFS5nCdFyQ4xqqjjQGeCRRFMUiQMEB4TWZtbOqxBdiP2b1as+OoZXFfmmBllFp/r2jwRtoopi50u480ql7aw5MH5U08oZx5Y0hzoMxRkR7xxxrElgxav62pNpKNq8mS3/38fjzWwE1rOqTzxLRwn3nkXm6zGND7B8k/P5sBe7zKsdF998xFfk0cusIEsr7lSeqnqPNuxoVL2a4BLTNS6pKW+2kpua9sfLcJlY3Mfs7v98A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH3PPF2B89F77E0.namprd11.prod.outlook.com (2603:10b6:518:1::d11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Tue, 24 Feb
 2026 08:52:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 08:52:39 +0000
Date: Tue, 24 Feb 2026 00:52:35 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
CC: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, "Shuah
 Khan" <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>, Will
 Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <iommu@lists.linux.dev>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>, Srinivas
 Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Bharath Kumar <quic_bkumar@quicinc.com>, 
 Chenna Kesava Raju <quic_chennak@quicinc.com>
Subject: Re: [PATCH RFC 12/18] accel/qda: Add PRIME dma-buf import support
Message-ID: <aZ1m0wOA9EBbJr+x@lstrano-desk.jf.intel.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-12-fe46a9c1a046@oss.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260224-qda-firstpost-v1-12-fe46a9c1a046@oss.qualcomm.com>
X-ClientProxiedBy: MW4PR04CA0334.namprd04.prod.outlook.com
 (2603:10b6:303:8a::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH3PPF2B89F77E0:EE_
X-MS-Office365-Filtering-Correlation-Id: ef746286-481b-441d-3729-08de73821058
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|1800799024|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zk1nRzRYTHZvdlo3OGkydXlUMWRLOUxLYm80a0JwQWJiV0FVMXFWd08zbHNW?=
 =?utf-8?B?VjdJMTNGWDNWQkwwWHVNeFVUUFJUbVo0NDVwQzdwQXdlWi9vYXc0UGhHNito?=
 =?utf-8?B?UFlMdTB6bVRTQ2RBZy9YSExwNytvNy95SER0Zzd5V0xxRnZ4VEhKN1RXRmhW?=
 =?utf-8?B?SGxsL1NhZGVSenhoNkR2QktDN3cxOUN3WFpuZUFuZ3hNd00veUNhVzZCME1S?=
 =?utf-8?B?ejluWHZUVnorUEo4SzFLM1lJZkNzS0VYZkczK0NXZUF1aTZ2T0d2QkdlMC9H?=
 =?utf-8?B?QjFQb0l4MTZHNHFSenVqRyt2SVZDZWVuN3hBWkRuR213a0Rvcjk5QW9YaXpV?=
 =?utf-8?B?Q1MwWFdYeGg0UTYySUtvbUZqQXJISHpWMmxSaFp5OVkwQzhlNzYxOVZhdTRG?=
 =?utf-8?B?MXJIYkMvVUdmQmc3UytTNTRnYUNwVjQ5QUhxN21jUUJ4MlRheStYT3pKc3hj?=
 =?utf-8?B?MGd1dGRmLzM4bXFTV1JINForTXh1eWxlbzNUL3JYaTlaNVdYSWV0K25POStt?=
 =?utf-8?B?TDNtSDUvUkQ3dWdraHQ2dHM1UU9qTkhKS0RTbVJYMHQ2eUZNQ05UYjk5aHM4?=
 =?utf-8?B?RXplam5icUZpaVBNMW1nSGs2NWFLSndkK3pVSWhBYkVlc0Z2dVdSSlkzNGI0?=
 =?utf-8?B?Y2x3clN6aUZFWWdVSlY1a1BrOWd3akl3QmM4OHNvRjBRcmF3TklhdXZHbFo3?=
 =?utf-8?B?Z2tVMmJjdWI0NVMwRXRZa1FmSmJiL0hmWWNVN09UeU4zRFZYZ3lQVERubnJD?=
 =?utf-8?B?WUJTMXBPNlBZelluK0pYYTB1bVE3cktiNmxGVnA1RUVuTUZzdCtoWXpIZ0FV?=
 =?utf-8?B?c2ZadlNFQjY5VFI0NEVZTWtUMExTckg4MCtPZnZ0d0xKOUdUNU1aeWlCRGNT?=
 =?utf-8?B?eWJxVFlvSFVyRnN3OU45SldWVUNyV2ZCTVl1dkhtV1JkQldZQ1JBT1kzTCt2?=
 =?utf-8?B?bGZEU2xHQWNkeEtud2Z1ZWZKL1VvYnRxTzl0c2U0ck1wZ1h6aVBId3FYVi9r?=
 =?utf-8?B?YThJRkxWdlpNb0lTRzRRZDJyUitEUXJlMXdUcG1rWDhyNVUxcURxMjF3anl3?=
 =?utf-8?B?Z2VoUlZJSHN2bHhxUEw1dmtldGUwNEtkbHVyNEZsK2ZqazZaME90MGZCVWI0?=
 =?utf-8?B?NyszUE1lRlN0dEtIcjZjT24xWGlrOTFCY0R3UkZoeGN3UHJZbDJoL3R6dVBR?=
 =?utf-8?B?bTd2SFkwR2E0ODRpaHc1ZXZCdlRMSHFpTjBocURKampLVGRrWVdYa1hLOVBF?=
 =?utf-8?B?bTZCelJwV2tuVExlMDZpTnlqVEF0Z1ByUVF0Vm1lSTBJYkxkaFJGTlI4ZEp1?=
 =?utf-8?B?dk1hajhORFR2VWdXd1BRVWljZUlVOWN3S3NDTXg3eEpRT041U0hPdTVrOGFp?=
 =?utf-8?B?VFkzZGRueDE2RFM4OUVyZm8yanNqbmhtWjBIMms1cUh4ZUNjMHNYenYvTHhx?=
 =?utf-8?B?VGMwd2dCQ3hTaWhrdUFlSmNGNkhzM1UvbldHUXFZS20xZXNxOEVWQjhGZ2ZS?=
 =?utf-8?B?MDdBcXJ6TUY2MVd0WVgwZDlKZ0x1cEc0SFpHTzRyUGpkYTRJUGVhTVBmaU84?=
 =?utf-8?B?K0FVWmNlVEZvczRDcFJ0ZndvOFhqZGdHckRpSXNPa0pvbGg5NnV3a1ZkVW91?=
 =?utf-8?B?b3dpNE5Tb3QvUTJxd0hldE9DN3F2NjUxV1NXNHVoMTFNVm5ESTJYcGJUV0hC?=
 =?utf-8?B?THZQYU5SOEU2TWtTSHdRV1o0cjB0djVXN1h2R0RPNGRpbjZIeXIvTSsyN29S?=
 =?utf-8?B?eXBhTnkzN1JNNDZpR3QzcEMvbTF4bTZ6ZUNSVWNDR0FWcnBoRWNLVzBGcVhu?=
 =?utf-8?B?VCsrc3ZtVTdmVVJBTHZNNWczaHE0MnFUT2NsTmpGdHVwbFZ0S2tLYzUzeHAw?=
 =?utf-8?B?K0N6bVJEOEMwdy8waWQ0bFlzUjNXSEtjTi82QlIrSUxialZlak04VEdHdU92?=
 =?utf-8?B?Rk05RUtzQU1HS1JuMVBuUmR1S3BKYk5ET1RheGp1TVByOU9ZTXNzeW0wQzJ6?=
 =?utf-8?B?aE1vZHhiOEsxSlNPbERpQWVERGQ2Q0NXeXpBYnI1NHkvanlCb1pUaWtoM0V3?=
 =?utf-8?B?clF3OC8rTzdsYlJUQS9UL3gxdGE4NTVabUs0Y3FFZlR1NUQzQmtLdnZFRHA1?=
 =?utf-8?Q?tnso=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEdmTG1XSzRYM1g4RVA3cDR4L2xCSW55UEx3SURwOHlSV2xYSTFuZkk0MjdS?=
 =?utf-8?B?RU1nL0NHb093amF1NUJMMnRzUExrRTVNRDVnaHozN1I0VGxLL1hNV1ExZCs2?=
 =?utf-8?B?QXh2a2pSY2hxZ0YxenJtTUdEYzlnZ1p2NUpGczR3SHAwR2tQR010eVpWUjc5?=
 =?utf-8?B?QW5SYnpaOGZCT1pKcGpUNXZvbE1qd2ZSeUJnYlhza0NqTkhxSWlRek1EVmR2?=
 =?utf-8?B?V29EUmlmVSt6NGdoTzBnVmZ2T0N0QlliMURPMmpHbVJTNksvUDFXWnhnVlFT?=
 =?utf-8?B?VURNNFBFSVBmajJTWStOdVVzaTZ6aVNIYitIdGRTajlidlVJZEtuRmZZY0lJ?=
 =?utf-8?B?ZnZGVFVLNzJ6ZG94bjVOY0NRTktLclFORjFiRVB0TDB2d3dESkoxZzRNSjF0?=
 =?utf-8?B?ZWtIY3FucTZYZjhBMDdVYmFZeWZZNDhyRUUyRlcxcXgyTG5JeHQwRUdLRkFi?=
 =?utf-8?B?ODl5RkZOMnpxWVZXZFVNeTNDMVVIbFpaeDZjNXAxeVV0Sy9MS0NYTkpDSk1u?=
 =?utf-8?B?OTQrNWMwMjB3L0RyL1MxMGlDVzRKVUk4TGNWc1lwRllHMWV5SnFrVmhqUHhn?=
 =?utf-8?B?c3dXdWlHOFJUaThqT1pQSzB0dXRUY0dDb0ZyVHE4d3BwQVpFUlhBL0FxeTRW?=
 =?utf-8?B?T0UvRjBUaU9yb2FlaTczUnlGZnNRblhzWUMwSEE5LzA3NlJiWVJWdkl0Tm1x?=
 =?utf-8?B?cTZDeGRDU0FmN0RMSDhCU0I1bG50SldwNmh0TytodENENWljY1pHQ3N3L2xC?=
 =?utf-8?B?am5LWTNRRm05a2FheHJOYzBob003NS9qQzlWaDQrQTVBblZUVlJyak4rLzV2?=
 =?utf-8?B?b1NFMzl6anVRWVhlWXJQRWtEM0N5KzZoVGVWeHkzNlBtZ1R4bkFFU0cvYlFt?=
 =?utf-8?B?YVdLMkIvMlpZMEpUdG9uaHpLUmsyUEs4dlZJUzVQUXpmVFRYcVBTaHQ1dktF?=
 =?utf-8?B?QlFidmdydkVsNHM3SGVMNnp4SS9LTTcwQ3hzODJBTkN3NDNlRU1tVHFKMmtk?=
 =?utf-8?B?VUNJTkRZZ2dEdENTbWRjTDljQ2IzYlBGOWxnYWFpRk84NVZuZ2JKaytydHBj?=
 =?utf-8?B?Zm85V0Vma3RnRnYydkdqeDR0TWxXYS9YZHcxVmx6K2paTDM5eTQ5RFBDaXFQ?=
 =?utf-8?B?WjBzYTJqdnNEVmcvcENyOGNQN2NwUWRScnBzcWo2Zm9seWN0R2FiNEZ5bGNk?=
 =?utf-8?B?dGVqZ2FMdXRJeUI4Y2xvVmFadEo2WlhMMVBlZ2V6OEc5U013MW5PWmFYVmhn?=
 =?utf-8?B?Vy9QcjYveVFicUVHaSthZERUOFROazg4WTEyVzJKL3pGdUxZamNRU0J4ZkpB?=
 =?utf-8?B?R0toNzB6SDIvWm9Iekx1YjhUaHYzVUo3MnNvRHVNWXo5S3F0eTRPRlFzK3Bv?=
 =?utf-8?B?b1EybjNrRytlbFgzZnZTVHViYWNjYjFlT0ppV20wbWJkTXVtb3FJLzd2Z2Q0?=
 =?utf-8?B?K2IyVTBwaHptMHY5dGhyeFdvMmdWQ3I4VlJoWjBleUFVbVAvOEhCY0VNUGlo?=
 =?utf-8?B?T2N0SzFVSFEyQU5QNzVhWWQrY1NtVllJeXFwOEh4RE5aWHBaUG9nUjJhc3M2?=
 =?utf-8?B?bFdidm85ZVBOWWw4NHQxVlFrK05xbUIxcWV2cTZVRC8yL0RqblE4VDV2dmd5?=
 =?utf-8?B?M0ZmRENCejUrTjh4R1l2NGprN0h3b1N5cXIzUTgrV0VkK3JjWkcvb3FQeS9v?=
 =?utf-8?B?R2g3V3U2WHErK25EMTNLOXkxVnBJTTJnekZZS1JpZGNZZVBmaWU5TkVQNWc3?=
 =?utf-8?B?QkZZWDRlM0ZVZWJQV1lGUFV3MFArd0cvOWtKQnBpN3RuSUFRNFhPNitzOTNw?=
 =?utf-8?B?TEJwd21jWndqd1RCUk1JUXh2VWRmdW56bHZNSHovaG1CWW1GYitoZnpoeE1H?=
 =?utf-8?B?cHhtbkpTMTVFV0Z0RXdsMkFQdm5OZEFkZTIzMmtleW41WlV6V0YvcmNoSkl6?=
 =?utf-8?B?QS9tQUMxTU9ZVHRIcXhHUHU2bTFidEpjM1YwVENpbS9tUkxEVWw1R2dNUmZT?=
 =?utf-8?B?SVd2SnE4T1Urb2lyL1NOUXY3bGxvamQrK0Nlb1dYWURPMWorVVlGOXBKQnAr?=
 =?utf-8?B?VUdpT3pET0VzNWRkYTkvbUw0aExjL2VLZnRySWVjM1V3d0gxMFBqdElBeXJa?=
 =?utf-8?B?NzFlZUdMenlVWktlcTVhS2NrTXJxdnJ0akJnUUFFZHZaRXFtYW5CdzFYKy9M?=
 =?utf-8?B?U0xVdTgyZTh0bzV5anpQZGVqMitJTkIyOHFrRjNXa2ZHNVMxQTlSbjRjWS9H?=
 =?utf-8?B?QksxcEt1ZUhKc0p6MWNKV1NqK0x4cFh2NGVDK2tjWndaOTdka1U5bFRxazRk?=
 =?utf-8?B?L2l1TktwMDZndW5sTy9lVlpyYmdlU1dFLzJ2ckJVY0xHM050YWVlREpPRzFi?=
 =?utf-8?Q?RAmbYCM/Bd54jXfg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef746286-481b-441d-3729-08de73821058
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 08:52:39.1976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FLGot6+AyZ33Oc69GX1vAr5NOETz8m2MXI19vfpLEN7GHzEHLSB1DanKE6LBNo3geJarOVxb55E+0gyUKCoTnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF2B89F77E0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ekansh.gupta@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 4683C18403C
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 12:39:06AM +0530, Ekansh Gupta wrote:
> Add PRIME dma-buf import support for QDA GEM buffer objects and integrate
> it with the existing per-process memory manager and IOMMU device model.
> 
> The implementation extends qda_gem_obj to represent imported dma-bufs,
> including dma_buf references, attachment state, scatter-gather tables
> and an imported DMA address used for DSP-facing book-keeping. The
> qda_gem_prime_import() path handles reimports of buffers originally
> exported by QDA as well as imports of external dma-bufs, attaching them
> to the assigned IOMMU device and mapping them through the memory manager
> for DSP access. The GEM free path is updated to unmap and detach
> imported buffers while preserving the existing behaviour for locally
> allocated memory.
> 
> The PRIME fd-to-handle path is implemented in qda_prime_fd_to_handle(),
> which records the calling drm_file in a driver-private import context
> before invoking the core DRM helpers. The GEM import callback retrieves
> this context to ensure that an IOMMU device is assigned to the process
> and that imported buffers follow the same per-process IOMMU selection
> rules as natively allocated GEM objects.
> 
> This patch prepares the driver for interoperable buffer sharing between
> QDA and other dma-buf capable subsystems while keeping IOMMU mapping and
> lifetime handling consistent with the existing GEM allocation flow.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/accel/qda/Makefile             |   1 +
>  drivers/accel/qda/qda_drv.c            |   8 ++
>  drivers/accel/qda/qda_drv.h            |   4 +
>  drivers/accel/qda/qda_gem.c            |  60 +++++++---
>  drivers/accel/qda/qda_gem.h            |  10 ++
>  drivers/accel/qda/qda_ioctl.c          |   7 ++
>  drivers/accel/qda/qda_ioctl.h          |  15 +++
>  drivers/accel/qda/qda_memory_manager.c |  42 ++++++-
>  drivers/accel/qda/qda_memory_manager.h |  14 +++
>  drivers/accel/qda/qda_prime.c          | 194 +++++++++++++++++++++++++++++++++
>  drivers/accel/qda/qda_prime.h          |  43 ++++++++
>  11 files changed, 377 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
> index 88c324fa382c..8286f5279748 100644
> --- a/drivers/accel/qda/Makefile
> +++ b/drivers/accel/qda/Makefile
> @@ -13,5 +13,6 @@ qda-y := \
>  	qda_ioctl.o \
>  	qda_gem.o \
>  	qda_memory_dma.o \
> +	qda_prime.o \
>  
>  obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda_compute_bus.o
> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
> index 0dd0e2bb2c0f..4adee00b1f2c 100644
> --- a/drivers/accel/qda/qda_drv.c
> +++ b/drivers/accel/qda/qda_drv.c
> @@ -10,9 +10,11 @@
>  #include <drm/drm_gem.h>
>  #include <drm/drm_ioctl.h>
>  #include <drm/qda_accel.h>
> +#include <drm/drm_prime.h>
>  
>  #include "qda_drv.h"
>  #include "qda_gem.h"
> +#include "qda_prime.h"
>  #include "qda_ioctl.h"
>  #include "qda_rpmsg.h"
>  
> @@ -166,6 +168,8 @@ static struct drm_driver qda_drm_driver = {
>  	.postclose		= qda_postclose,
>  	.ioctls = qda_ioctls,
>  	.num_ioctls = ARRAY_SIZE(qda_ioctls),
> +	.gem_prime_import = qda_gem_prime_import,
> +	.prime_fd_to_handle = qda_ioctl_prime_fd_to_handle,
>  	.name = DRIVER_NAME,
>  	.desc = "Qualcomm DSP Accelerator Driver",
>  };
> @@ -174,6 +178,7 @@ static void cleanup_drm_private(struct qda_dev *qdev)
>  {
>  	if (qdev->drm_priv) {
>  		qda_dbg(qdev, "Cleaning up DRM private data\n");
> +		mutex_destroy(&qdev->drm_priv->import_lock);
>  		kfree(qdev->drm_priv);
>  	}
>  }
> @@ -240,6 +245,9 @@ static int init_drm_private(struct qda_dev *qdev)
>  	if (!qdev->drm_priv)
>  		return -ENOMEM;
>  
> +	mutex_init(&qdev->drm_priv->import_lock);
> +	qdev->drm_priv->current_import_file_priv = NULL;
> +
>  	qda_dbg(qdev, "DRM private data initialized successfully\n");
>  	return 0;
>  }
> diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
> index 8a2cd474958b..bb0dd7e284c6 100644
> --- a/drivers/accel/qda/qda_drv.h
> +++ b/drivers/accel/qda/qda_drv.h
> @@ -64,6 +64,10 @@ struct qda_drm_priv {
>  	struct qda_memory_manager *iommu_mgr;
>  	/* Back-pointer to qda_dev */
>  	struct qda_dev *qdev;
> +	/* Lock protecting import context */
> +	struct mutex import_lock;
> +	/* Current file_priv during prime import */
> +	struct drm_file *current_import_file_priv;
>  };
>  
>  /* struct qda_dev - Main device structure for QDA driver */
> diff --git a/drivers/accel/qda/qda_gem.c b/drivers/accel/qda/qda_gem.c
> index bbd54e2502d3..37279e8b46fe 100644
> --- a/drivers/accel/qda/qda_gem.c
> +++ b/drivers/accel/qda/qda_gem.c
> @@ -8,6 +8,7 @@
>  #include "qda_gem.h"
>  #include "qda_memory_manager.h"
>  #include "qda_memory_dma.h"
> +#include "qda_prime.h"
>  
>  static int validate_gem_obj_for_mmap(struct qda_gem_obj *qda_gem_obj)
>  {
> @@ -15,23 +16,29 @@ static int validate_gem_obj_for_mmap(struct qda_gem_obj *qda_gem_obj)
>  		qda_err(NULL, "Invalid GEM object size\n");
>  		return -EINVAL;
>  	}
> -	if (!qda_gem_obj->iommu_dev || !qda_gem_obj->iommu_dev->dev) {
> -		qda_err(NULL, "Allocated buffer missing IOMMU device\n");
> -		return -EINVAL;
> -	}
> -	if (!qda_gem_obj->iommu_dev->dev) {
> -		qda_err(NULL, "Allocated buffer missing IOMMU device\n");
> -		return -EINVAL;
> -	}
> -	if (!qda_gem_obj->virt) {
> -		qda_err(NULL, "Allocated buffer missing virtual address\n");
> -		return -EINVAL;
> -	}
> -	if (qda_gem_obj->dma_addr == 0) {
> -		qda_err(NULL, "Allocated buffer missing DMA address\n");
> -		return -EINVAL;
> +	if (qda_gem_obj->is_imported) {
> +		if (!qda_gem_obj->sgt) {
> +			qda_err(NULL, "Imported buffer missing sgt\n");
> +			return -EINVAL;
> +		}
> +		if (!qda_gem_obj->iommu_dev || !qda_gem_obj->iommu_dev->dev) {
> +			qda_err(NULL, "Imported buffer missing IOMMU device\n");
> +			return -EINVAL;
> +		}
> +	} else {
> +		if (!qda_gem_obj->iommu_dev || !qda_gem_obj->iommu_dev->dev) {
> +			qda_err(NULL, "Allocated buffer missing IOMMU device\n");
> +			return -EINVAL;
> +		}
> +		if (!qda_gem_obj->virt) {
> +			qda_err(NULL, "Allocated buffer missing virtual address\n");
> +			return -EINVAL;
> +		}
> +		if (qda_gem_obj->dma_addr == 0) {
> +			qda_err(NULL, "Allocated buffer missing DMA address\n");
> +			return -EINVAL;
> +		}
>  	}
> -
>  	return 0;
>  }
>  
> @@ -60,9 +67,21 @@ void qda_gem_free_object(struct drm_gem_object *gem_obj)
>  	struct qda_gem_obj *qda_gem_obj = to_qda_gem_obj(gem_obj);
>  	struct qda_drm_priv *drm_priv = get_drm_priv_from_device(gem_obj->dev);
>  
> -	if (qda_gem_obj->virt) {
> -		if (drm_priv && drm_priv->iommu_mgr)
> +	if (qda_gem_obj->is_imported) {
> +		if (qda_gem_obj->attachment && qda_gem_obj->sgt)
> +			dma_buf_unmap_attachment_unlocked(qda_gem_obj->attachment,
> +							  qda_gem_obj->sgt, DMA_BIDIRECTIONAL);
> +		if (qda_gem_obj->attachment)
> +			dma_buf_detach(qda_gem_obj->dma_buf, qda_gem_obj->attachment);
> +		if (qda_gem_obj->dma_buf)
> +			dma_buf_put(qda_gem_obj->dma_buf);
> +		if (qda_gem_obj->iommu_dev && drm_priv && drm_priv->iommu_mgr)
>  			qda_memory_manager_free(drm_priv->iommu_mgr, qda_gem_obj);
> +	} else {
> +		if (qda_gem_obj->virt) {
> +			if (drm_priv && drm_priv->iommu_mgr)
> +				qda_memory_manager_free(drm_priv->iommu_mgr, qda_gem_obj);
> +		}
>  	}
>  
>  	drm_gem_object_release(gem_obj);
> @@ -174,6 +193,11 @@ struct drm_gem_object *qda_gem_create_object(struct drm_device *drm_dev,
>  	qda_gem_obj = qda_gem_alloc_object(drm_dev, aligned_size);
>  	if (IS_ERR(qda_gem_obj))
>  		return (struct drm_gem_object *)qda_gem_obj;
> +	qda_gem_obj->is_imported = false;
> +	qda_gem_obj->dma_buf = NULL;
> +	qda_gem_obj->attachment = NULL;
> +	qda_gem_obj->sgt = NULL;
> +	qda_gem_obj->imported_dma_addr = 0;
>  
>  	ret = qda_memory_manager_alloc(iommu_mgr, qda_gem_obj, file_priv);
>  	if (ret) {
> diff --git a/drivers/accel/qda/qda_gem.h b/drivers/accel/qda/qda_gem.h
> index cbd5d0a58fa4..3566c5b2ad88 100644
> --- a/drivers/accel/qda/qda_gem.h
> +++ b/drivers/accel/qda/qda_gem.h
> @@ -31,6 +31,16 @@ struct qda_gem_obj {
>  	size_t size;
>  	/* IOMMU device that performed the allocation */
>  	struct qda_iommu_device *iommu_dev;
> +	/* True if buffer is imported, false if allocated */
> +	bool is_imported;
> +	/* Reference to imported dma_buf */
> +	struct dma_buf *dma_buf;
> +	/* DMA buf attachment */
> +	struct dma_buf_attachment *attachment;
> +	/* Scatter-gather table */
> +	struct sg_table *sgt;
> +	/* DMA address of imported buffer */
> +	dma_addr_t imported_dma_addr;
>  };
>  
>  /*
> diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
> index ef3c9c691cb7..d91983048d6c 100644
> --- a/drivers/accel/qda/qda_ioctl.c
> +++ b/drivers/accel/qda/qda_ioctl.c
> @@ -5,6 +5,7 @@
>  #include <drm/qda_accel.h>
>  #include "qda_drv.h"
>  #include "qda_ioctl.h"
> +#include "qda_prime.h"
>  
>  static int qda_validate_and_get_context(struct drm_device *dev, struct drm_file *file_priv,
>  					struct qda_dev **qdev, struct qda_user **qda_user)
> @@ -78,3 +79,9 @@ int qda_ioctl_gem_mmap_offset(struct drm_device *dev, void *data, struct drm_fil
>  	drm_gem_object_put(gem_obj);
>  	return ret;
>  }
> +
> +int qda_ioctl_prime_fd_to_handle(struct drm_device *dev, struct drm_file *file_priv, int prime_fd,
> +				 u32 *handle)
> +{
> +	return qda_prime_fd_to_handle(dev, file_priv, prime_fd, handle);
> +}
> diff --git a/drivers/accel/qda/qda_ioctl.h b/drivers/accel/qda/qda_ioctl.h
> index 6bf3bcd28c0e..d454256f5fc5 100644
> --- a/drivers/accel/qda/qda_ioctl.h
> +++ b/drivers/accel/qda/qda_ioctl.h
> @@ -23,4 +23,19 @@
>   */
>  int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_priv);
>  
> +/**
> + * qda_ioctl_prime_fd_to_handle - IOCTL handler for PRIME FD to handle conversion
> + * @dev: DRM device structure
> + * @file_priv: DRM file private data
> + * @prime_fd: File descriptor of the PRIME buffer
> + * @handle: Output parameter for the GEM handle
> + *
> + * This IOCTL handler converts a PRIME file descriptor to a GEM handle.
> + * It serves as both the DRM driver callback and can be used directly.
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +int qda_ioctl_prime_fd_to_handle(struct drm_device *dev, struct drm_file *file_priv,
> +				 int prime_fd, u32 *handle);
> +
>  #endif /* _QDA_IOCTL_H */
> diff --git a/drivers/accel/qda/qda_memory_manager.c b/drivers/accel/qda/qda_memory_manager.c
> index e225667557ee..3fd20f17c57b 100644
> --- a/drivers/accel/qda/qda_memory_manager.c
> +++ b/drivers/accel/qda/qda_memory_manager.c
> @@ -154,8 +154,8 @@ static struct qda_iommu_device *get_process_iommu_device(struct qda_memory_manag
>  	return qda_priv->assigned_iommu_dev;
>  }
>  
> -static int qda_memory_manager_assign_device(struct qda_memory_manager *mem_mgr,
> -					    struct drm_file *file_priv)
> +int qda_memory_manager_assign_device(struct qda_memory_manager *mem_mgr,
> +				     struct drm_file *file_priv)
>  {
>  	struct qda_file_priv *qda_priv;
>  	struct qda_iommu_device *selected_dev = NULL;
> @@ -223,6 +223,35 @@ static struct qda_iommu_device *get_or_assign_iommu_device(struct qda_memory_man
>  	return NULL;
>  }
>  
> +static int qda_memory_manager_map_imported(struct qda_memory_manager *mem_mgr,
> +					   struct qda_gem_obj *gem_obj,
> +					   struct qda_iommu_device *iommu_dev)
> +{
> +	struct scatterlist *sg;
> +	dma_addr_t dma_addr;
> +	int ret = 0;
> +
> +	if (!gem_obj->is_imported || !gem_obj->sgt || !iommu_dev) {
> +		qda_err(NULL, "Invalid parameters for imported buffer mapping\n");
> +		return -EINVAL;
> +	}
> +
> +	gem_obj->iommu_dev = iommu_dev;
> +
> +	sg = gem_obj->sgt->sgl;
> +	if (sg) {
> +		dma_addr = sg_dma_address(sg);
> +		dma_addr += ((u64)iommu_dev->sid << 32);
> +
> +		gem_obj->imported_dma_addr = dma_addr;
> +	} else {
> +		qda_err(NULL, "Invalid scatter-gather list for imported buffer\n");
> +		ret = -EINVAL;
> +	}
> +
> +	return ret;
> +}
> +
>  int qda_memory_manager_alloc(struct qda_memory_manager *mem_mgr, struct qda_gem_obj *gem_obj,
>  			     struct drm_file *file_priv)
>  {
> @@ -248,7 +277,10 @@ int qda_memory_manager_alloc(struct qda_memory_manager *mem_mgr, struct qda_gem_
>  		return -ENOMEM;
>  	}
>  
> -	ret = qda_dma_alloc(selected_dev, gem_obj, size);
> +	if (gem_obj->is_imported)
> +		ret = qda_memory_manager_map_imported(mem_mgr, gem_obj, selected_dev);
> +	else
> +		ret = qda_dma_alloc(selected_dev, gem_obj, size);
>  
>  	if (ret) {
>  		qda_err(NULL, "Allocation failed: size=%zu, device_id=%u, ret=%d\n",
> @@ -268,6 +300,10 @@ void qda_memory_manager_free(struct qda_memory_manager *mem_mgr, struct qda_gem_
>  		return;
>  	}
>  
> +	if (gem_obj->is_imported) {
> +		qda_dbg(NULL, "Freed imported buffer tracking (no DMA free needed)\n");
> +		return;
> +	}
>  	qda_dma_free(gem_obj);
>  }
>  
> diff --git a/drivers/accel/qda/qda_memory_manager.h b/drivers/accel/qda/qda_memory_manager.h
> index bac44284ef98..f6c7963cec42 100644
> --- a/drivers/accel/qda/qda_memory_manager.h
> +++ b/drivers/accel/qda/qda_memory_manager.h
> @@ -106,6 +106,20 @@ int qda_memory_manager_register_device(struct qda_memory_manager *mem_mgr,
>  void qda_memory_manager_unregister_device(struct qda_memory_manager *mem_mgr,
>  					  struct qda_iommu_device *iommu_dev);
>  
> +/**
> + * qda_memory_manager_assign_device() - Assign an IOMMU device to a process
> + * @mem_mgr: Pointer to memory manager
> + * @file_priv: DRM file private data for process association
> + *
> + * Assigns an IOMMU device to the calling process. If the process already has
> + * a device assigned, returns success. If another file descriptor from the same
> + * PID has a device, reuses it. Otherwise, finds an available device and assigns it.
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +int qda_memory_manager_assign_device(struct qda_memory_manager *mem_mgr,
> +				     struct drm_file *file_priv);
> +
>  /**
>   * qda_memory_manager_alloc() - Allocate memory for a GEM object
>   * @mem_mgr: Pointer to memory manager
> diff --git a/drivers/accel/qda/qda_prime.c b/drivers/accel/qda/qda_prime.c
> new file mode 100644
> index 000000000000..3d23842e48bb
> --- /dev/null
> +++ b/drivers/accel/qda/qda_prime.c
> @@ -0,0 +1,194 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> +#include <drm/drm_gem.h>
> +#include <drm/drm_prime.h>
> +#include <linux/slab.h>
> +#include <linux/dma-mapping.h>
> +#include "qda_drv.h"
> +#include "qda_gem.h"
> +#include "qda_prime.h"
> +#include "qda_memory_manager.h"
> +
> +static struct drm_gem_object *check_own_buffer(struct drm_device *dev, struct dma_buf *dma_buf)
> +{
> +	if (dma_buf->priv) {
> +		struct drm_gem_object *existing_gem = dma_buf->priv;

Randomly looking at your driver — you’ve broken the dma-buf cross-driver
contract here. How do you know dma_buf->priv is a struct drm_gem_object?
You don’t, because that is assigned by the exporter, and userspace could
pass in a dma-buf from another device and blow up your driver.

I think you just want to call drm_gem_is_prime_exported_dma_buf() here
before doing anything.

The rest of this dma-buf code also looks highly questionable. I’d study
how other drivers implement their dma-buf paths and use those as a
reference to improve yours.

Matt

> +
> +		if (existing_gem->dev == dev) {
> +			struct qda_gem_obj *existing_qda_gem = to_qda_gem_obj(existing_gem);
> +
> +			if (!existing_qda_gem->is_imported) {
> +				drm_gem_object_get(existing_gem);
> +				return existing_gem;
> +			}
> +		}
> +	}
> +	return NULL;
> +}
> +
> +static struct qda_iommu_device *get_iommu_device_for_import(struct qda_drm_priv *drm_priv,
> +							    struct drm_file **file_priv_out,
> +							    struct qda_dev *qdev)
> +{
> +	struct drm_file *file_priv;
> +	struct qda_file_priv *qda_file_priv;
> +	struct qda_iommu_device *iommu_dev = NULL;
> +	int ret;
> +
> +	file_priv = drm_priv->current_import_file_priv;
> +	*file_priv_out = file_priv;
> +
> +	if (!file_priv || !file_priv->driver_priv)
> +		return NULL;
> +
> +	qda_file_priv = (struct qda_file_priv *)file_priv->driver_priv;
> +	iommu_dev = qda_file_priv->assigned_iommu_dev;
> +
> +	if (!iommu_dev) {
> +		ret = qda_memory_manager_assign_device(drm_priv->iommu_mgr, file_priv);
> +		if (ret) {
> +			qda_err(qdev, "Failed to assign IOMMU device: %d\n", ret);
> +			return NULL;
> +		}
> +
> +		iommu_dev = qda_file_priv->assigned_iommu_dev;
> +	}
> +
> +	return iommu_dev;
> +}
> +
> +static int setup_dma_buf_mapping(struct qda_gem_obj *qda_gem_obj, struct dma_buf *dma_buf,
> +				 struct device *attach_dev, struct qda_dev *qdev)
> +{
> +	struct dma_buf_attachment *attachment;
> +	struct sg_table *sgt;
> +	int ret;
> +
> +	attachment = dma_buf_attach(dma_buf, attach_dev);
> +	if (IS_ERR(attachment)) {
> +		ret = PTR_ERR(attachment);
> +		qda_err(qdev, "Failed to attach dma_buf: %d\n", ret);
> +		return ret;
> +	}
> +	qda_gem_obj->attachment = attachment;
> +
> +	sgt = dma_buf_map_attachment_unlocked(attachment, DMA_BIDIRECTIONAL);
> +	if (IS_ERR(sgt)) {
> +		ret = PTR_ERR(sgt);
> +		qda_err(qdev, "Failed to map dma_buf attachment: %d\n", ret);
> +		dma_buf_detach(dma_buf, attachment);
> +		return ret;
> +	}
> +	qda_gem_obj->sgt = sgt;
> +
> +	return 0;
> +}
> +
> +struct drm_gem_object *qda_gem_prime_import(struct drm_device *dev, struct dma_buf *dma_buf)
> +{
> +	struct qda_drm_priv *drm_priv;
> +	struct qda_gem_obj *qda_gem_obj;
> +	struct drm_file *file_priv;
> +	struct qda_iommu_device *iommu_dev;
> +	struct qda_dev *qdev;
> +	struct drm_gem_object *existing_gem;
> +	size_t aligned_size;
> +	int ret;
> +
> +	drm_priv = get_drm_priv_from_device(dev);
> +	if (!drm_priv || !drm_priv->iommu_mgr) {
> +		qda_err(NULL, "Invalid drm_priv or iommu_mgr\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	qdev = drm_priv->qdev;
> +
> +	existing_gem = check_own_buffer(dev, dma_buf);
> +	if (existing_gem)
> +		return existing_gem;
> +
> +	iommu_dev = get_iommu_device_for_import(drm_priv, &file_priv, qdev);
> +	if (!iommu_dev || !iommu_dev->dev) {
> +		qda_err(qdev, "No IOMMU device assigned for prime import\n");
> +		return ERR_PTR(-ENODEV);
> +	}
> +
> +	qda_dbg(qdev, "Using IOMMU device %u for prime import\n", iommu_dev->id);
> +
> +	aligned_size = PAGE_ALIGN(dma_buf->size);
> +	qda_gem_obj = qda_gem_alloc_object(dev, aligned_size);
> +	if (IS_ERR(qda_gem_obj))
> +		return (struct drm_gem_object *)qda_gem_obj;
> +
> +	qda_gem_obj->is_imported = true;
> +	qda_gem_obj->dma_buf = dma_buf;
> +	qda_gem_obj->virt = NULL;
> +	qda_gem_obj->dma_addr = 0;
> +	qda_gem_obj->imported_dma_addr = 0;
> +	qda_gem_obj->iommu_dev = iommu_dev;
> +
> +	get_dma_buf(dma_buf);
> +
> +	ret = setup_dma_buf_mapping(qda_gem_obj, dma_buf, iommu_dev->dev, qdev);
> +	if (ret)
> +		goto err_put_dma_buf;
> +
> +	ret = qda_memory_manager_alloc(drm_priv->iommu_mgr, qda_gem_obj, file_priv);
> +	if (ret) {
> +		qda_err(qdev, "Failed to allocate IOMMU mapping: %d\n", ret);
> +		goto err_unmap;
> +	}
> +
> +	qda_dbg(qdev, "Prime import completed successfully size=%zu\n", aligned_size);
> +	return &qda_gem_obj->base;
> +
> +err_unmap:
> +	dma_buf_unmap_attachment_unlocked(qda_gem_obj->attachment,
> +					  qda_gem_obj->sgt, DMA_BIDIRECTIONAL);
> +	dma_buf_detach(dma_buf, qda_gem_obj->attachment);
> +err_put_dma_buf:
> +	dma_buf_put(dma_buf);
> +	qda_gem_cleanup_object(qda_gem_obj);
> +	return ERR_PTR(ret);
> +}
> +
> +int qda_prime_fd_to_handle(struct drm_device *dev, struct drm_file *file_priv,
> +			   int prime_fd, u32 *handle)
> +{
> +	struct qda_drm_priv *drm_priv;
> +	struct qda_dev *qdev;
> +	int ret;
> +
> +	drm_priv = get_drm_priv_from_device(dev);
> +	if (!drm_priv) {
> +		qda_dbg(NULL, "Failed to get drm_priv from device\n");
> +		return -EINVAL;
> +	}
> +
> +	qdev = drm_priv->qdev;
> +
> +	if (file_priv && file_priv->driver_priv) {
> +		struct qda_file_priv *qda_file_priv;
> +
> +		qda_file_priv = (struct qda_file_priv *)file_priv->driver_priv;
> +	} else {
> +		qda_dbg(qdev, "Called with NULL file_priv or driver_priv\n");
> +	}
> +
> +	mutex_lock(&drm_priv->import_lock);
> +	drm_priv->current_import_file_priv = file_priv;
> +
> +	ret = drm_gem_prime_fd_to_handle(dev, file_priv, prime_fd, handle);
> +
> +	drm_priv->current_import_file_priv = NULL;
> +	mutex_unlock(&drm_priv->import_lock);
> +
> +	if (!ret)
> +		qda_dbg(qdev, "Completed with ret=%d, handle=%u\n", ret, *handle);
> +	else
> +		qda_dbg(qdev, "Completed with ret=%d\n", ret);
> +
> +	return ret;
> +}
> +
> +MODULE_IMPORT_NS("DMA_BUF");
> diff --git a/drivers/accel/qda/qda_prime.h b/drivers/accel/qda/qda_prime.h
> new file mode 100644
> index 000000000000..939902454dcd
> --- /dev/null
> +++ b/drivers/accel/qda/qda_prime.h
> @@ -0,0 +1,43 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _QDA_PRIME_H
> +#define _QDA_PRIME_H
> +
> +#include <drm/drm_device.h>
> +#include <drm/drm_file.h>
> +#include <drm/drm_gem.h>
> +#include <linux/dma-buf.h>
> +
> +/**
> + * qda_gem_prime_import - Import a DMA-BUF as a GEM object
> + * @dev: DRM device structure
> + * @dma_buf: DMA-BUF to import
> + *
> + * This function imports an external DMA-BUF into the QDA driver as a GEM
> + * object. It handles both re-imports of buffers originally from this driver
> + * and imports of external buffers from other drivers.
> + *
> + * Return: Pointer to the imported GEM object on success, ERR_PTR on failure
> + */
> +struct drm_gem_object *qda_gem_prime_import(struct drm_device *dev, struct dma_buf *dma_buf);
> +
> +/**
> + * qda_prime_fd_to_handle - Core implementation for PRIME FD to GEM handle conversion
> + * @dev: DRM device structure
> + * @file_priv: DRM file private data
> + * @prime_fd: File descriptor of the PRIME buffer
> + * @handle: Output parameter for the GEM handle
> + *
> + * This core function sets up the necessary context before calling the
> + * DRM framework's prime FD to handle conversion. It ensures proper IOMMU
> + * device assignment and tracking for the import operation.
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +int qda_prime_fd_to_handle(struct drm_device *dev, struct drm_file *file_priv,
> +			   int prime_fd, u32 *handle);
> +
> +#endif /* _QDA_PRIME_H */
> 
> -- 
> 2.34.1
> 
