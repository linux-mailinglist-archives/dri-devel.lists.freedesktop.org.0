Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B86CFCB8713
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 10:24:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B2E010E5C7;
	Fri, 12 Dec 2025 09:24:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D1BWpNmN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8DD310E5C7;
 Fri, 12 Dec 2025 09:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765531456; x=1797067456;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VCFCckKrmgnrbCWez/nkdR6JeQ4NSt9u18IIv9Qiua0=;
 b=D1BWpNmNHMjIyjMZ7MMCnXD9hZZ5Z736Fk5rYTpf/6BSn67XABWkQw9b
 2uHPVh3HKTCu6O6lQQtT8+ETm1kcZJ4OZXY0Pq/l/IKX0kI7+yFVpy0fg
 MlkeuiMgFcUK3L5GESWUi0pt8tAbPJBUv8PUEbXqnFq3CdTR7QM8iEgFT
 wMwkpWx48NBWASNTAC/xTF7pLXFB06oKh+sy2hOnMC+mQ5uHffc7LImuW
 Ug/f8x+xKpgyxpNukz1EXX8mjDlGA0+plcFU6Y3CH6ZPZve7ObrwzJins
 O7rpKzJOZGn8rXul9X0C6PE7P9adW4HORAuD0/6UEoXcgj15ds4oCuFFg g==;
X-CSE-ConnectionGUID: F6eC/VxVT5u5vPLiktNpmQ==
X-CSE-MsgGUID: IpRyWOS2TFuOPy7g0fXTQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67596541"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="67596541"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 01:24:15 -0800
X-CSE-ConnectionGUID: n4x7pWFSQyqc3ugXlwq/vw==
X-CSE-MsgGUID: g4USbmwCQ2SiH+yUpcjtlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="196121853"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 01:24:16 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 01:24:14 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 12 Dec 2025 01:24:14 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.42) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 01:24:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bgnbsLWYO8LjUe0n39XlJU6b+CM8VA63TaeNN2i1r6TZRYRaOK4fhZwEMNM6R7SA8lBU0a3El+57Bk9cTMXKjlcmpxJNxOz0PpO9peL18rErjgFcp9paSlQme+QOjHpwmX7C18Ko1CiswnDF+PPtfXtVdQBNq6o2oyHvRkIrpyYbJxuoR8500iGQrflfEnzaa1dBDAmCqMFchlcAld+swrz7V6mTronyMif69r3WmdCbiaISRvGLQOqlfJ1wy8w6yIAYoR8AtBYSioP70zmSedLWppV+NiJWabjtOTnFOdpFmEzoi743WUCktgM6FeBDFdiiXq+d1XN5MgxkG3+ffA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1M0vO3GsVmazLhAWtloAx3W8c8imzNooEmGgFgC8Cg4=;
 b=HWJ527xgtNP/HgOK8OVAQ8nsgqqViCdlZHI2zNnplr4uY3Oxl5/hTJJryQ8E61dSrT8hJ9L5PA5E9KUPPVq35bIlKseSEGz1XJ+c9hZP5+MMYdJiKOFTUhcQP2+fOvkhrgJCwrdMiRR/eqb+bD/LwEvMNlgLx34KgYtAoprPuuWjvRcFriw1WgaNWE6Sgye+klGCeL9gi2lxGoOKXpPa9RLcbwDMpq/MJdHqSVo9Hlf+uG6vbUwqbKVmV6NomxoN+vHjEvL+UAz9CZAh86xEghubMHAQ1kca4tXQtfiqClqLfUPbdJvJZNtaRWWx6/RwZ9EWB4ZEgfBE1Xo4+OX2WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by SA3PR11MB8021.namprd11.prod.outlook.com
 (2603:10b6:806:2fd::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 09:24:12 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::803d:39cb:d276:4ee5]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::803d:39cb:d276:4ee5%8]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 09:24:11 +0000
Message-ID: <a20bfe73-3713-46cf-b357-d5d49cf9ba5a@intel.com>
Date: Fri, 12 Dec 2025 14:54:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/22] drm/pagemap, drm/xe: Ensure that the devmem
 allocation is idle before use
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, <stable@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 <dakr@kernel.org>, "Mrozek, Michal" <michal.mrozek@intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>
References: <20251211165909.219710-1-thomas.hellstrom@linux.intel.com>
 <20251211165909.219710-3-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20251211165909.219710-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0160.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::30) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|SA3PR11MB8021:EE_
X-MS-Office365-Filtering-Correlation-Id: cc9fc006-4e73-4078-c7e0-08de396035ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UmVpcVRiSzJ0Ry9MdEVaN0o2eXdpRDNHZ2prUHJ0dzFXdHNLZXUxclVmVHNQ?=
 =?utf-8?B?eVBKK3NIQ2JrbW4wTkk0SVBjdmRZQ3N0SVo3R0hxUEJzdEdTWExnVkE0OFZH?=
 =?utf-8?B?MlpQZ0hFWEZLdWZiWWZnYVZXdm1ONnBjVHZqWFdxc3JodEJqd3hsdXpoTjBI?=
 =?utf-8?B?Q3VhRFkxWnhVU3pqc2MzdUE4Uk9uWkZReGZQNkFldzVhdWVtWXlaSVorK3ds?=
 =?utf-8?B?TVNmTWRac0EwNTFiRTBlQVB0dkFWYmgwbk0rc2xKdWdXN1BKR3lQWTlqQWxM?=
 =?utf-8?B?VndMOG1KTWc4VnNDbFBIN1ZGT0RQa1ZPN2NmSFF5U2NHRStWV2Q5ZUp3dTRv?=
 =?utf-8?B?NFIxdHhxcXlUekdJN1ZBWUNIWFNLdDdNZTNWV2h1TUgrRjE0aUZrME5SWnhP?=
 =?utf-8?B?NTl6RlNXUjNNRU5KbmxNWlZKWW1yNlhDSkttdDV2VjI4dmx4MHFvU1ZkV0VS?=
 =?utf-8?B?eEdTaGFWUmhBaDZNcTJDRkVSeHFFNXczUzI1a0E5aXEyeGRjSnpyZFh0NlVs?=
 =?utf-8?B?TUppKzNrNGxUaFFFNEVZSHhEblVkVzN4dHl6cW1waExxR1QwcVdmaUxheU8r?=
 =?utf-8?B?VDR2cEJGOHR2Q21EZEY0Z3Y5Ry96dlZaSXFNQlhYRnRBRys1aUh5MUlackxB?=
 =?utf-8?B?V2FVZWlGTHd6REJkSUduR054bU9kWmxoNER3REdTNjJkckcrNzVSa3VwSFB3?=
 =?utf-8?B?MTZ4WFU1M29NSlo2Z1NCazRuSHZMcDFhRmllZnpLUFNLalFNWS9QSkRHQkhB?=
 =?utf-8?B?OGZwY0RFQUZjQk80UVV5NjBHZUlEK3k4Tjd2NHlFT0hkejROdzFHL2RkdVRL?=
 =?utf-8?B?Mm53TFI2TUFROVdKWmdRKzB0enFSNVFreU5WN0Y4VlMyV2pFdTVuZmZzUHJH?=
 =?utf-8?B?bzRmdUlBRm9KaXFGTlV6aGRTelExMW0yNVZjVUxCZTJXWmpmc2VDeTJsNjI5?=
 =?utf-8?B?SGhVVm9vS2hmUElzNTlTd2dYNnZJOWM0aExjVzZXV3hmWjd3bCtYckFpM3Vq?=
 =?utf-8?B?OWNtQlU5dTFTZkUyYVYyR1ZBanBVSmdMZHJ2d052RFFTRTJjNDY3eE80RTNJ?=
 =?utf-8?B?MWJxS3VpOUFEazlhTUlvMm4wVC9qeFdGeXVuWnJxUmxzTHpIbUF3c1JuWmd5?=
 =?utf-8?B?RTRXVDlpVHVFaVFCMXJwT3Q0UWp3MzZyczFIbmhiTWZONFA5cUlJWTBXL0Ew?=
 =?utf-8?B?N2RQS0pPSjlpUDRpdFZRaFVLNmRFSU5FMVR3UzhCMlcxOVQ2Q0ZhdFV3bjdk?=
 =?utf-8?B?TFh3VGM4b3d2RXFOMXdGdVNHWmk2Vld6OXpXUndiUHE5aGhEbzBYV1puSFBT?=
 =?utf-8?B?ZHhrbkRDZ1VVZEpHdGhlSlVLaHZ5emNuSkJQZlFUZzZIWk1rTVFRZ3NKTG9C?=
 =?utf-8?B?UGNRTkZnQ2c5NEZBeVlCVTR1WVF1a01GTVpReERBc09QRkpBS2tkN0xhSXNt?=
 =?utf-8?B?aUMvYTJaSTFNa3FCUkMwYldWdUpMQU9nbDM4SEUxb1JZaW1EYUJoNFluK3Zv?=
 =?utf-8?B?UUxRM3J4dEZoMW9OWGtqUTBCbElQVTZtWElmN1l3cmNBRkY0QTNhdEErbWsz?=
 =?utf-8?B?dWJBWmQ3QnMyeUVkOUROOG1Ca2d4L25FZEEwSEo0c1BHT3ZGWk54QS8yS0xI?=
 =?utf-8?B?dUxxdkl2TVBUV1EzOEVXZ29SSjN4Z2pFclkzUHNDYjdEKytWZDdLaVBWL3l6?=
 =?utf-8?B?UG9lL0JYc3M1Ukswbm5FUFJjVHZBYkw5VjI4dC9mU0ZWaUw4U0pTOGFPUVU5?=
 =?utf-8?B?Yyt1dDdNV0dkd1piTDYraFpqWHRic1lwVWVNTEtYUXJDcnpGMkI4S2VZcWNL?=
 =?utf-8?B?VFZ3OGFjVGlsTnR0NVRFdUw3MzVyM1FIVGMyNThqWDlTYVg1SnpqdGY4aFFY?=
 =?utf-8?B?OG5IdlBuWTYzRzNQMFBIR1BNZnhHSGt5WUNVUUIwSmVnWDBYU0sxYnN0Mzlq?=
 =?utf-8?Q?85ZAEZYE+PKjY04tz6LPMLnOSRMxIOBs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWtIa0x1UlU0L3pxUFBacXlUaENObFU5bmdzeHJLQXpCU3QydjhYUmJLMUVq?=
 =?utf-8?B?eEJYOWI2T0o3MkkzTlB5cVB0b2k4VnpHdmFCRU9BKzNKSFp2alNZN3A0YitG?=
 =?utf-8?B?Qmt4UmJOSnI2aUJoeTY1VlBnKy9hZTVMTFd4WGxEVXZIUlk5OUxrWW50QmtC?=
 =?utf-8?B?OEpCTXk3VWZFRURrTTRod0NLaFdWUFluVGhNUjVpajFMYkpBMUZSUXM2N0Nw?=
 =?utf-8?B?ZStSVXVKNlNPWURDM040enlzbDVrbVZDV243WmFiTGlWZStkZDZOVWpoV2VQ?=
 =?utf-8?B?ZDhTZFRGcStVSWkzM2ZxWE9BT2RjT1pWOHYxc3R4dC9sdFNiT0J0Z3pycG1Z?=
 =?utf-8?B?WU1xRjkxRmFHWkhQV1FEREdVajBqQVprUXNsTHArbHdWNGRZeUxHQnRsSnlY?=
 =?utf-8?B?cFF6ekxITFRSYndEcXNucXhJdGR5cXNrMEo5WUxxVG1wZHdrNCtFai82eFkw?=
 =?utf-8?B?SjdYWmZCakFsdEgwMVZaY2xldFdTSkE2VHhoeHRSdE4wYzFHN09qc1ZyZ3Nh?=
 =?utf-8?B?SHA1ZXBsUmVoZTQxUlFtUGMvV1phK0lCY2gwNjFZdmpIVk91QmFvd0h1Mkk3?=
 =?utf-8?B?V3NieTRhaGpLamY0WUxFejBHSDBLZmRNTFNOZXJ5WEJGYlhVNTBNbUpEb0Ey?=
 =?utf-8?B?K1hxUW1xTUlaRjFqa2p2dWlPcWVkSm5FaEp3OTVVZnhBWWxsMlBmeGJmSUYr?=
 =?utf-8?B?V0dIRFZjbitMOWUvVnJxTzJzdFFmazBiL21DSHZsMjdQOWdQL0NxNUJrWjlS?=
 =?utf-8?B?SjF2Yy9BWTVJaWtKZjlqTGdoWnNnUjlkUXFGOGZMNHZ4T1UycmNFVy9PdytM?=
 =?utf-8?B?N1gvUnZ0MTdiMkV0WlUvNFVESFAyMjJHNzhrOGNMeTBvL1BscEdjN0lqVXQ4?=
 =?utf-8?B?R2tUQ0diYVk5RzdLQ0hZRXpFZVNrNUczelQzL0dSc25CZjI2MnUwWVp4UUxF?=
 =?utf-8?B?Q29KL3lOa01qalh6N0hHVDdaMUxaMjd6U2RrMk5HM1BjYjNsNndESUhVZzBU?=
 =?utf-8?B?UzlrZ05KTzBwdktzQ0thMEFidjFRbUkxZkY4Y3dxc1VCRHg1Wk9OYW5PTXRD?=
 =?utf-8?B?Wk83ektuU2Z6a3JXZDBwZUVzTTJjRFNFZDk0VHFrUy9EMy9JV3BYQ09lYkJ1?=
 =?utf-8?B?TnI1NG8rME1pbTZCZUtkNXVMaTExZGlPWG9ickttbC9kVHpkMHlvN1V0Vi80?=
 =?utf-8?B?TC93VldnZDVDTUQ1SjNWZmo3eU0xajVCZHJlNXNmWE5KM0dhNFNJcDdiNDFR?=
 =?utf-8?B?dkZ6SHIzWlM0L0JUeGZRUjVsY05HMjlhZXlOWjdkNTBZZmhtNCtadWlGY2Js?=
 =?utf-8?B?NStJNG56M0VTR1JkaE9kWVJRY0ZxWnNCSld1TXBYVUNsNWlCL3E3ZzZ6T3VS?=
 =?utf-8?B?dVJnUjhiKzg3eXZnRERSMVdmVUFpc21vRnFmWUEyKzVXOHUrWmtWNkJKZm4z?=
 =?utf-8?B?VTFFUVJKWHNWT1ZKSGtIdy9UVDE2NTFDYTRmMm05d0xvM0JIOWtJSzA1WUZJ?=
 =?utf-8?B?RVNGZkhCTTFXK2R0UUhOcGx6UVpnZlU4aEhZR0diV0FrVTJrV3poYjZGOUxX?=
 =?utf-8?B?aCtBbmlxcVhIMUswS1RheGhRR0xDZVljZ0dETk9YK29qTjhZQzFoRTFaQSs3?=
 =?utf-8?B?MVkxRXdMRW11amdSQzBIM2VmWk42UkFhL2FlMndCTHpCMXUxcGRoQmNSZmJz?=
 =?utf-8?B?ZWZjZEdobU9LaUdERWR4RklGZTMxay80L2I3S0RFcDV5Q1U3d0JJejBGTi9Z?=
 =?utf-8?B?SUxIMitZdDFZZ1d4MmRBbmRXcW5IeXF2bVFQQzFGMDVCTlppVzlRMTNkNUdr?=
 =?utf-8?B?T3VWNEVnWnplN0FEZXFPSkZ6UVFBNHVjQjhOa2NQRThPSjN2cG82aGJpZWJT?=
 =?utf-8?B?WUIyQ1l4RGNZcDhadGhCUVE1OWRLa0dLL2t3V01EUUFGZXkrejRGL1FDSGdn?=
 =?utf-8?B?TEJVMzRHR0d2c0h0c29MTFllY29QN09HbDNUa0hrak9KTjEzVENxVDc4WFJS?=
 =?utf-8?B?K0ZwaG80ay9KdXl0T3pLTnRYRFFyMXV0UTF2VjF5M2U5T1ErNnJ6T1hFTmRJ?=
 =?utf-8?B?b0owOURlOFZieHU5bFdSL0I1elBkd2I5WHN1SHdNVHVBK09vU29SNlNhVWVm?=
 =?utf-8?B?eGRnSzc5VWpTQ3BMOVh1ZHNTR0RRUmZUU01RZnc0SWFxMUhLeHQ1UWtJVkds?=
 =?utf-8?B?cVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc9fc006-4e73-4078-c7e0-08de396035ca
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 09:24:11.8748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IYRVSWF51OajTwylmepGH53X7FRY09Io7L2r3laH1DREFvWhD3E8NisqL9mF7niDs+kGJTdTqwqJjHGXS+Z3ce0yyTbqZedYrR8++ZLRKfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8021
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



On 11-12-2025 22:28, Thomas Hellström wrote:
> In situations where no system memory is migrated to devmem, and in
> upcoming patches where another GPU is performing the migration to
> the newly allocated devmem buffer, there is nothing to ensure any
> ongoing clear to the devmem allocation or async eviction from the
> devmem allocation is complete.
> 
> Address that by passing a struct dma_fence down to the copy
> functions, and ensure it is waited for before migration is marked
> complete.
> 
> v3:
> - New patch.
> v4:
> - Update the logic used for determining when to wait for the
>    pre_migrate_fence.
> - Update the logic used for determining when to warn for the
>    pre_migrate_fence since the scheduler fences apparently
>    can signal out-of-order.
> 
> Fixes: c5b3eb5a906c ("drm/xe: Add GPUSVM device memory copy vfunc functions")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <stable@vger.kernel.org> # v6.15+
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/drm_pagemap.c | 13 ++++---
>   drivers/gpu/drm/xe/xe_svm.c   | 67 ++++++++++++++++++++++++++++++-----
>   include/drm/drm_pagemap.h     | 17 +++++++--
>   3 files changed, 81 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 22c44807e3fe..864a73d019ed 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -408,7 +408,8 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>   		drm_pagemap_get_devmem_page(page, zdd);
>   	}
>   
> -	err = ops->copy_to_devmem(pages, pagemap_addr, npages);
> +	err = ops->copy_to_devmem(pages, pagemap_addr, npages,
> +				  devmem_allocation->pre_migrate_fence);
>   	if (err)
>   		goto err_finalize;
>   
> @@ -596,7 +597,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
>   	for (i = 0; i < npages; ++i)
>   		pages[i] = migrate_pfn_to_page(src[i]);
>   
> -	err = ops->copy_to_ram(pages, pagemap_addr, npages);
> +	err = ops->copy_to_ram(pages, pagemap_addr, npages, NULL);
>   	if (err)
>   		goto err_finalize;
>   
> @@ -732,7 +733,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>   	for (i = 0; i < npages; ++i)
>   		pages[i] = migrate_pfn_to_page(migrate.src[i]);
>   
> -	err = ops->copy_to_ram(pages, pagemap_addr, npages);
> +	err = ops->copy_to_ram(pages, pagemap_addr, npages, NULL);
>   	if (err)
>   		goto err_finalize;
>   
> @@ -813,11 +814,14 @@ EXPORT_SYMBOL_GPL(drm_pagemap_pagemap_ops_get);
>    * @ops: Pointer to the operations structure for GPU SVM device memory
>    * @dpagemap: The struct drm_pagemap we're allocating from.
>    * @size: Size of device memory allocation
> + * @pre_migrate_fence: Fence to wait for or pipeline behind before migration starts.
> + * (May be NULL).
>    */
>   void drm_pagemap_devmem_init(struct drm_pagemap_devmem *devmem_allocation,
>   			     struct device *dev, struct mm_struct *mm,
>   			     const struct drm_pagemap_devmem_ops *ops,
> -			     struct drm_pagemap *dpagemap, size_t size)
> +			     struct drm_pagemap *dpagemap, size_t size,
> +			     struct dma_fence *pre_migrate_fence)
>   {
>   	init_completion(&devmem_allocation->detached);
>   	devmem_allocation->dev = dev;
> @@ -825,6 +829,7 @@ void drm_pagemap_devmem_init(struct drm_pagemap_devmem *devmem_allocation,
>   	devmem_allocation->ops = ops;
>   	devmem_allocation->dpagemap = dpagemap;
>   	devmem_allocation->size = size;
> +	devmem_allocation->pre_migrate_fence = pre_migrate_fence;
>   }
>   EXPORT_SYMBOL_GPL(drm_pagemap_devmem_init);
>   
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 36634c84d148..2152d20049e4 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -483,11 +483,12 @@ static void xe_svm_copy_us_stats_incr(struct xe_gt *gt,
>   
>   static int xe_svm_copy(struct page **pages,
>   		       struct drm_pagemap_addr *pagemap_addr,
> -		       unsigned long npages, const enum xe_svm_copy_dir dir)
> +		       unsigned long npages, const enum xe_svm_copy_dir dir,
> +		       struct dma_fence *pre_migrate_fence)
>   {
>   	struct xe_vram_region *vr = NULL;
>   	struct xe_gt *gt = NULL;
> -	struct xe_device *xe;
> +	struct xe_device *xe = NULL;
>   	struct dma_fence *fence = NULL;
>   	unsigned long i;
>   #define XE_VRAM_ADDR_INVALID	~0x0ull
> @@ -496,6 +497,18 @@ static int xe_svm_copy(struct page **pages,
>   	bool sram = dir == XE_SVM_COPY_TO_SRAM;
>   	ktime_t start = xe_svm_stats_ktime_get();
>   
> +	if (pre_migrate_fence && (sram || dma_fence_is_container(pre_migrate_fence))) {

Patch LGTM. Nit, Moving sram check for p2p migration from source here 
makes better sense with [Patch 22] drm/pagemap: Support source migration 
over interconnect


> +		/*
> +		 * This would typically be a p2p migration from source, or
> +		 * a composite fence operation on the destination memory.
> +		 * Ensure that any other GPU operation on the destination
> +		 * is complete.
> +		 */
> +		err = dma_fence_wait(pre_migrate_fence, true);
> +		if (err)
> +			return err;
> +	}
> +
>   	/*
>   	 * This flow is complex: it locates physically contiguous device pages,
>   	 * derives the starting physical address, and performs a single GPU copy
> @@ -632,10 +645,28 @@ static int xe_svm_copy(struct page **pages,
>   
>   err_out:
>   	/* Wait for all copies to complete */
> -	if (fence) {
> +	if (fence)
>   		dma_fence_wait(fence, false);
> -		dma_fence_put(fence);
> +
> +	/*
> +	 * If migrating to devmem, we should have pipelined the migration behind
> +	 * the pre_migrate_fence. Verify that this is indeed likely. If we
> +	 * didn't perform any copying, just wait for the pre_migrate_fence.
> +	 */
> +	if (!sram && pre_migrate_fence && !dma_fence_is_signaled(pre_migrate_fence)) {
> +		if (xe && fence &&
> +		    (pre_migrate_fence->context != fence->context ||
> +		     dma_fence_is_later(pre_migrate_fence, fence))) {
> +			drm_WARN(&xe->drm, true, "Unsignaled pre-migrate fence");
> +			drm_warn(&xe->drm, "fence contexts: %llu %llu. container %d\n",
> +				 (unsigned long long)fence->context,
> +				 (unsigned long long)pre_migrate_fence->context,
> +				 dma_fence_is_container(pre_migrate_fence));
> +		}
> +
> +		dma_fence_wait(pre_migrate_fence, false);
>   	}
> +	dma_fence_put(fence);
>   
>   	/*
>   	 * XXX: We can't derive the GT here (or anywhere in this functions, but
> @@ -652,16 +683,20 @@ static int xe_svm_copy(struct page **pages,
>   
>   static int xe_svm_copy_to_devmem(struct page **pages,
>   				 struct drm_pagemap_addr *pagemap_addr,
> -				 unsigned long npages)
> +				 unsigned long npages,
> +				 struct dma_fence *pre_migrate_fence)
>   {
> -	return xe_svm_copy(pages, pagemap_addr, npages, XE_SVM_COPY_TO_VRAM);
> +	return xe_svm_copy(pages, pagemap_addr, npages, XE_SVM_COPY_TO_VRAM,
> +			   pre_migrate_fence);
>   }
>   
>   static int xe_svm_copy_to_ram(struct page **pages,
>   			      struct drm_pagemap_addr *pagemap_addr,
> -			      unsigned long npages)
> +			      unsigned long npages,
> +			      struct dma_fence *pre_migrate_fence)
>   {
> -	return xe_svm_copy(pages, pagemap_addr, npages, XE_SVM_COPY_TO_SRAM);
> +	return xe_svm_copy(pages, pagemap_addr, npages, XE_SVM_COPY_TO_SRAM,
> +			   pre_migrate_fence);
>   }
>   
>   static struct xe_bo *to_xe_bo(struct drm_pagemap_devmem *devmem_allocation)
> @@ -676,6 +711,7 @@ static void xe_svm_devmem_release(struct drm_pagemap_devmem *devmem_allocation)
>   
>   	xe_bo_put_async(bo);
>   	xe_pm_runtime_put(xe);
> +	dma_fence_put(devmem_allocation->pre_migrate_fence);
>   }
>   
>   static u64 block_offset_to_pfn(struct xe_vram_region *vr, u64 offset)
> @@ -868,6 +904,7 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>   				      unsigned long timeslice_ms)
>   {
>   	struct xe_vram_region *vr = container_of(dpagemap, typeof(*vr), dpagemap);
> +	struct dma_fence *pre_migrate_fence = NULL;
>   	struct xe_device *xe = vr->xe;
>   	struct device *dev = xe->drm.dev;
>   	struct drm_buddy_block *block;
> @@ -894,8 +931,20 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>   			break;
>   		}
>   
> +		/* Ensure that any clearing or async eviction will complete before migration. */
> +		if (!dma_resv_test_signaled(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL)) {
> +			err = dma_resv_get_singleton(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL,
> +						     &pre_migrate_fence);
> +			if (err)
> +				dma_resv_wait_timeout(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL,
> +						      false, MAX_SCHEDULE_TIMEOUT);
> +			else if (pre_migrate_fence)
> +				dma_fence_enable_sw_signaling(pre_migrate_fence);
> +		}
> +
>   		drm_pagemap_devmem_init(&bo->devmem_allocation, dev, mm,
> -					&dpagemap_devmem_ops, dpagemap, end - start);
> +					&dpagemap_devmem_ops, dpagemap, end - start,
> +					pre_migrate_fence);
>   
>   		blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
>   		list_for_each_entry(block, blocks, link)
> diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> index f6e7e234c089..70a7991f784f 100644
> --- a/include/drm/drm_pagemap.h
> +++ b/include/drm/drm_pagemap.h
> @@ -8,6 +8,7 @@
>   
>   #define NR_PAGES(order) (1U << (order))
>   
> +struct dma_fence;
>   struct drm_pagemap;
>   struct drm_pagemap_zdd;
>   struct device;
> @@ -174,6 +175,8 @@ struct drm_pagemap_devmem_ops {
>   	 * @pages: Pointer to array of device memory pages (destination)
>   	 * @pagemap_addr: Pointer to array of DMA information (source)
>   	 * @npages: Number of pages to copy
> +	 * @pre_migrate_fence: dma-fence to wait for before migration start.
> +	 * May be NULL.
>   	 *
>   	 * Copy pages to device memory. If the order of a @pagemap_addr entry
>   	 * is greater than 0, the entry is populated but subsequent entries
> @@ -183,13 +186,16 @@ struct drm_pagemap_devmem_ops {
>   	 */
>   	int (*copy_to_devmem)(struct page **pages,
>   			      struct drm_pagemap_addr *pagemap_addr,
> -			      unsigned long npages);
> +			      unsigned long npages,
> +			      struct dma_fence *pre_migrate_fence);
>   
>   	/**
>   	 * @copy_to_ram: Copy to system RAM (required for migration)
>   	 * @pages: Pointer to array of device memory pages (source)
>   	 * @pagemap_addr: Pointer to array of DMA information (destination)
>   	 * @npages: Number of pages to copy
> +	 * @pre_migrate_fence: dma-fence to wait for before migration start.
> +	 * May be NULL.
>   	 *
>   	 * Copy pages to system RAM. If the order of a @pagemap_addr entry
>   	 * is greater than 0, the entry is populated but subsequent entries
> @@ -199,7 +205,8 @@ struct drm_pagemap_devmem_ops {
>   	 */
>   	int (*copy_to_ram)(struct page **pages,
>   			   struct drm_pagemap_addr *pagemap_addr,
> -			   unsigned long npages);
> +			   unsigned long npages,
> +			   struct dma_fence *pre_migrate_fence);
>   };
>   
>   /**
> @@ -212,6 +219,8 @@ struct drm_pagemap_devmem_ops {
>    * @dpagemap: The struct drm_pagemap of the pages this allocation belongs to.
>    * @size: Size of device memory allocation
>    * @timeslice_expiration: Timeslice expiration in jiffies
> + * @pre_migrate_fence: Fence to wait for or pipeline behind before migration starts.
> + * (May be NULL).
>    */
>   struct drm_pagemap_devmem {
>   	struct device *dev;
> @@ -221,6 +230,7 @@ struct drm_pagemap_devmem {
>   	struct drm_pagemap *dpagemap;
>   	size_t size;
>   	u64 timeslice_expiration;
> +	struct dma_fence *pre_migrate_fence;
>   };
>   
>   int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
> @@ -238,7 +248,8 @@ struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page);
>   void drm_pagemap_devmem_init(struct drm_pagemap_devmem *devmem_allocation,
>   			     struct device *dev, struct mm_struct *mm,
>   			     const struct drm_pagemap_devmem_ops *ops,
> -			     struct drm_pagemap *dpagemap, size_t size);
> +			     struct drm_pagemap *dpagemap, size_t size,
> +			     struct dma_fence *pre_migrate_fence);
>   
>   int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>   			    unsigned long start, unsigned long end,

