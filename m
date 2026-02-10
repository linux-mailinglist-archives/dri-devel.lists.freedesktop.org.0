Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEvSKv+6imlmNQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 05:58:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BA3116EFE
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 05:58:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEAF110E4B5;
	Tue, 10 Feb 2026 04:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aZt3G7k4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC6010E4B0;
 Tue, 10 Feb 2026 04:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770699515; x=1802235515;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nYKlx9TXVB7n8pj08P7tC4TnPCc14SaQGBVhCEUGFm4=;
 b=aZt3G7k4hKez05As7Ac31+kvqgM9GJu36gt/Y22/Y9ZVMAIXQqV/Rmck
 WALxsfWb/o7fblENZYFy+IdCcdI0FGZKSNezp2r9Mo32r4bINKKRascwJ
 5d04j1e8Sq5fmSY23nxV4h/MCXvplkPVlNbRp5O0vyikm4DOLdl3Bebw0
 egGbwDajfKFOzSWeN3EwO5OphiayC3Vtm/Apds3zGRGlU8NmjQ907FQYC
 glFZcR1TkJ1/xagaAa2PUEb1Xk4Go/mr38pIpxQyd3KoFqOfZmp0KB2XU
 4FqCzFCeBAWXo+wEsLsWn4dOccmQB/FHaZgTS6nIYKd7y3pgatj65jSO/ w==;
X-CSE-ConnectionGUID: a/BapYb0Rk+nZT2sKsv5KA==
X-CSE-MsgGUID: K2bmas6kRsmKrkHvN8ztkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="70834658"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="70834658"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 20:58:34 -0800
X-CSE-ConnectionGUID: t/FZK6cwQFamxxZRRvyIaQ==
X-CSE-MsgGUID: xp4MDJChQfCpE6hhNt7N6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="234754784"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 20:58:34 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 20:58:33 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 20:58:33 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.55) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 20:58:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kU65EQHbnlU2Zc11NTRgrj7x20zDBgy/wQub7CL7kc8IBBIh1CPEh8bT5w786XoS5ivblc7n12toRApY7pMLbNsZfxueoNjR+xEDkKCjifVVVfWNo8IBft1wCOcsGNFjnzYTd44fGhmI1/tfPOqwWSl/7pk8ixT9W55wXfM6nlALQ5PIq/Kn7e/P4AK5PGBobB2xUPU13up+g3HSiIWijTS+RS2TTSRoLWTQ9Q4zn6yAp4pi5NrJ9UhtcJtpD8FV33gCrFpDtxyN67PbUkWZ2DhoW3KlXETgGsHL3ZwoDEbgZvSfIEyWwKTHsM1jVo8oxQ2LZfJ9S5eK9jyF6RcHyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2hzQ9HDKiZWrzcwIcAS/2WrZDJ0ZUrgH2U0EymSxsMY=;
 b=S+X6ey99rK7wdV3a0wSW7sqySyoQuVMuUtRKlZLdA85eg1IABF//lXxd5xJoVilJjMYYFb0pwm2+I6NW161KIptjVlGEpAJ3q0/gkL5pe8DQrDfMUMpZRa59vn2zHsgtL5aUOwcZQv9duF2jlJARW6J8bzxrAXaT4GBptgxIlFEYDqPN0hdprvHffU79JtIRSXamxU7qz1NbxcN9xy3/OMmFBKDGPJ8iGqMSR6IpMqWN3PGT7eRnVGMdinDaxxdRhKbGpPRmkIjdCSSvVGIz5aLqO+GtM7OLAz2llKkrxy252EmYWmTDWA0IK9Tkd6wVjv48DNC3ofncS/Yl7ip45Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH3PR11MB7345.namprd11.prod.outlook.com (2603:10b6:610:14a::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.18; Tue, 10 Feb 2026 04:58:31 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 04:58:31 +0000
Message-ID: <ce578a81-920d-4f5f-92aa-6f251aa3625f@intel.com>
Date: Tue, 10 Feb 2026 10:28:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] drm/xe/xe_hw_error: Integrate DRM RAS with
 hardware error handling
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <aravind.iddamsetty@linux.intel.com>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <simona.vetter@ffwll.ch>, <airlied@gmail.com>, <pratik.bari@intel.com>,
 <joshua.santosh.ranjan@intel.com>, <ashwin.kumar.kulkarni@intel.com>,
 <shubham.kumar@intel.com>, <ravi.kishore.koppuravuri@intel.com>
References: <20260202064356.286243-7-riana.tauro@intel.com>
 <20260202064356.286243-10-riana.tauro@intel.com>
 <aYRVLYCqT9_SKX8k@black.igk.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aYRVLYCqT9_SKX8k@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0017.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::9) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH3PR11MB7345:EE_
X-MS-Office365-Filtering-Correlation-Id: bbb5d05b-9818-45c8-fa4e-08de68610952
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0FLam9hQlR5WlRtam13djV5RnBjc3d6amJ6d0FRTUpuK1ZyeS84eVFNdlZL?=
 =?utf-8?B?cyt0Mm5admE0OWlrdWdQcUsyVmZsdVMva2F0dWVlUGpsbkcxVUR2cCtmbDFZ?=
 =?utf-8?B?dHJ6ZnNPakdyK3BYUXVZajFSaG41c21ubTZINmdjeVBVRkwzR090L1ZpOWNE?=
 =?utf-8?B?WFl0ZnVlMDA4ejYzVnprb0twQ0o2UmRMTktVMThhSVZhbzAvZ2k4OVlPdFRV?=
 =?utf-8?B?NVhPeGhWZXFReXh6WC9hVXBFbEtGZjZGTFY1NkZrdFhMY3AvSldpamYzYUdl?=
 =?utf-8?B?UHFEeDRHdlprd2d5STlOVmswSzcxa2VmamVteDZKczl6dGYyRGZSSVNqd2h2?=
 =?utf-8?B?VmxDTG5SeUdoaHkyTU56U29hY0NOK3AzQlJzRU1VOXV2RmR2MW5JVEkvUmdW?=
 =?utf-8?B?bzd3SXl1Y0Z6K1Y0d2Z4bjZMcUJzQk5MRjlHbVVKYW5Yc01kTi9KM3JLUVlH?=
 =?utf-8?B?YVoya056VS9GSXlOcDIxekJ0eFhzUm04c2dUZEtrWjlzSDVjOE51bm56Sko5?=
 =?utf-8?B?VmVGaW9vbDNIVVZvMmo5Wmxsd0t5L0JKVERiMlloNUZTV2QwNFBvbTJxVzZZ?=
 =?utf-8?B?amNxcTZXRWQyN3FtZSt5RFRVZ1ZUUUVLVkVJRGEvOEZOcWlCSHd3MzcyZnRV?=
 =?utf-8?B?dVNRMkhjbzBjcnNwcU1VOUpYL1gzcVNEelVLWG5pV1hnUHA3THBuTG9RcWxQ?=
 =?utf-8?B?eURMOG10MGs4M2hxWHRhOC8yeUdZK1N0NDRrL21JSkxtcDRqeU80bjBpcUpT?=
 =?utf-8?B?SU9mSEg3UzNuSTBZSU9iSVhrYXFhUlp4Y0lWT0E3V3dwaHE5VU03eFFOaDRP?=
 =?utf-8?B?N3phejdpNEhZNkl1Sk0yMHB5V0xGQWpab2lialQzOXZWVW90L2ZNZWt3YUFM?=
 =?utf-8?B?dnlZWHdtWm5pMmt6dVc3VlJCd1I1K2xvZGdhakZOZHZRSlRvN1RPTXVud1hK?=
 =?utf-8?B?ekRTNXpTYXphaGJvZm1qMWFlbXVSNXdvSXdEQnlJbWxtRDdMWWJHdWxlM1Nh?=
 =?utf-8?B?aXhVYUJOVHkveDRPVWppZFlkL09yRHJYUHRHbVZqM21RcWM4clg4NWVnMjNn?=
 =?utf-8?B?RlI4WWQ3ajQvbXFYTUZscmVrS2VUR3JCalpDNGFqamM2bEJ6VW5KZXZ1cVJy?=
 =?utf-8?B?QUhVMTJSVHVPOUowMlZjQU1PM0Q4amRrUExJNENkN2xabmcySkZ0QWt2L0V0?=
 =?utf-8?B?VGthRzJ6K3lQZVdENTRPemZZeEJHaW5ZeTBRSXdHVDFycExOSnNBL0dRS3ls?=
 =?utf-8?B?MHNSb1lqSnBNSTA2RWxWelVKcTBRZFJ0dFJ0ai9uQU9CREcwTHA4NDQ5MEd0?=
 =?utf-8?B?QjRXWFpXZXRnOFlrbkRWbU1pK0s4UFpYNUEvT2VVNFAvMzdtMDJ3cE91TnJo?=
 =?utf-8?B?Y1NWU3RCeWtLZU5UaU9IcEJaUG10TXd6aVZHM2llQ1NwOHl4SXJqZ0pha0Rj?=
 =?utf-8?B?QUJ0KysyL0daaGF5NDJrK0FXWE81WU5PSG5wbTVZanQ0NC9UM21DeEUyc3ZT?=
 =?utf-8?B?clRDMkRTNXM2c29iNGl2QVZwZzBCQVdUVTZFaWsxMU5Pa2d1ZmpSZk9yNHhn?=
 =?utf-8?B?NTNuV28rbm1qYkc5TFloV3VUQWRBdHNnY2NJUjhxSS9ob1VTeWpnelR6RXVn?=
 =?utf-8?B?eWdybGpESHNNTXdpaXBVK1psUW01c1lFUWlWbjdMS1l6dVpBSEd4NVlIVXp2?=
 =?utf-8?B?amV4Q2hyM0JPU0RjUUhpdy8wYTdhc1hMbGU4eURNWVRKamFVM1BWNEN2bjFB?=
 =?utf-8?B?RitsSko2UzB4T3VadUdnZEhjTSs5UWJ3SHorbmNJV0tXWFlxVXdUeHh6Smgy?=
 =?utf-8?B?djVoVURvKzlVZ2lMaDFjaGJ2dDlaZmZ3cHBPN0w3bDlwbkJTL1JjK0JWQllH?=
 =?utf-8?B?V3FlNGdkOXkzNXVnQmJLRU0wZnJJWjVLNFhzM0s3WHRTQllQTTRNNW8rN055?=
 =?utf-8?B?cVdGeHF6cmVBaWxtamhMY05sQXNUQXNYbU52dVorc3B3T0N0d2VWU3I4K0RT?=
 =?utf-8?B?ZldkVUFhS0lUbDYzeHVZQ3FpeW8yMVRRa1Fzb1hzeElEc0JPOCtGa1psNVls?=
 =?utf-8?B?NUlDb2hhMzNldENWSEorTnpWNHkzYmRieEcrUGJyUjBuOEFWdWI4dGR4RTI1?=
 =?utf-8?Q?FXnk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFdDRXlORStPZzJlM1p2cjdDVWxKYm52T1U4MFJJcG1FR1EzR1NYSlFjclpE?=
 =?utf-8?B?YUZxRzNlZ2VGcGt0Sk91RHM5QlY3bS9KMjU0bGRNU2h1UUNkNExlc0RQYnoz?=
 =?utf-8?B?dlZwellQRW1xeUVMYnBhWGFXeXZXamQ1ckljSnhZUVIxbi9MSTZCeGRQcHo3?=
 =?utf-8?B?eUxnYnphdHc5c2oyTGVJVGxpZnVPV0x5cGRqaUtOb0J3ZzhQcXNUdVc1MVdz?=
 =?utf-8?B?QXl0eWZUL2M1ekN1SjUxeUhtWVVudXpISk55YVFiVWllZVZrOTVCbFVqWHVL?=
 =?utf-8?B?U0ZCTUdsSzRNcGFtaUwwUHdabkpxZ3ZkR05CWHV4VmxXdmp2WWlhTm42clZn?=
 =?utf-8?B?NHFxOWNTOVJBL2p3OCtKcDNTQS9aUnZWT0Qra1dvdkM3VTlGVWw4WmJEcXNj?=
 =?utf-8?B?ZHQwbEZWaHdKOWJUb2JCY3hIWFlMcEVObTM4ZlNsQ0IzeTVBL1lrK1AySU8y?=
 =?utf-8?B?ZG9BTC81WlRpUHNUQ0w5dW9yd1E2L3J1SGV3N1F4Tmh2L3NIbUcyL2k3a2NU?=
 =?utf-8?B?dU1zckM1Q21VbWxBeEE5OVlud0FpVjduTUxaS083N2lLR0F3aUcxeE82MWp3?=
 =?utf-8?B?L2w5TVp4ZzdKbDFKWW1ZTGFnNERNcWxpTDhpa3NBVnRscjUyUDlSVTEwZzMw?=
 =?utf-8?B?eHFsUzZFT3g1Zm1UQUhFckhyZFBSVkc5UTUvTzNGWDF0ZmF2SktWMG54TFls?=
 =?utf-8?B?UEdWTExtckxaYnBaMUh1Qm5Jbk1OeUVBejBKL29sUzFlSTNBcnFic2ZuWEdS?=
 =?utf-8?B?TUtqZmJ3NE5mM1lackRHUC8wTTIxSWlsb29HaTAycHpmYmh0dnFQUjV3U09N?=
 =?utf-8?B?RHFONDRCa1YzS2N5SkhtNU80dG1Rb3RQTGh3ZzJDeE5XYWw4WHVHalhGaEV2?=
 =?utf-8?B?bERzQU1TMkNZVnNzMmF5cVBnMWo2Y21rVmx5SjJPUzFZcjl0bjBvVGljcEFq?=
 =?utf-8?B?WmQra29nSXlMRmx0TCt3QndzSTVQYmtLYS9POHZSYW9ZbTBrRnNEOWNadnU2?=
 =?utf-8?B?UjY1OTNDWUx6bG15V3dyOFU4cFJvZnQxZDI1c2FjK0ZEcy8xZXN4UFdiL0t4?=
 =?utf-8?B?SE51V04xbzEwaWtaK1kxZ0JmWVhvSjlwWXV1cUFlNzhjejFNK3JWVFQ4aVFM?=
 =?utf-8?B?OW9ISUZkbFRIU284OWZ5WlhZa00yNWVHMGYrSjVjMFdzNWlGa2JINDdKVWVD?=
 =?utf-8?B?U3IrOFdVcXZ3cmxNenBCSVpXNk5HRG82MVlnMTVOUkVQa1M1V3RlbGUzTWR6?=
 =?utf-8?B?TTlpZm5iNmpnNmpzTUtyekkySFNubEIwNStFc2FtSVFpa0R0Z3RsblZWU3Vs?=
 =?utf-8?B?M1JzY0RzaWtocFpDTDhtdnJoNVA5UGtUMTZQMDE0UHZkTzNMRDRvQVNYd0xV?=
 =?utf-8?B?VGY4bDdwZXc5VVpxQjRyNE9nakc3cTNBVExtdE52WVVvTVd1bUsxUm5abWVr?=
 =?utf-8?B?amxnaHcramhZWXNKbEczaFVBOVFNd2k1MzV1a0xtUE81MGlDQXhtNjlXbXds?=
 =?utf-8?B?UjZSc2Uxcm5Wc1JNWnFaMS9mN1FPK3luTkl3MWxLaDRWUzFwQUhkNnhXdUJ4?=
 =?utf-8?B?N0xVcG5nN0FjT1FTUFk0UjRaV2pBalV5TjNxV1ByaDRaS2FaZGZIL3hzMG5D?=
 =?utf-8?B?REVvYi9RczgyK2NPeU9vYlZPWXMxazNaVlNWUDdmTWNxTTNQcFQxYW5TRXE1?=
 =?utf-8?B?MWo0OXhweEMxTHc3S0JnRmMyTmxEd3h1cjBoMnVobUNUcXBnRDNQSkFEQk1i?=
 =?utf-8?B?Wi9WSlZUc0R3SmFUS25renY3cnJOZk4yZmc5NlBnRE9oWC8rRnhpR1FGR25T?=
 =?utf-8?B?d1dMZWRCQVBlTmwvVkJPNjFjREtQU0xDckRBN0ZjZ2NMQ2NycVdWbzF6MnJh?=
 =?utf-8?B?TXozZGpmTG0rZzJZYTZtSTIxQ1Y1QWxERXZ1Z3A0WnNUUUFlYkNUZU5tY1pC?=
 =?utf-8?B?T2k1NGVFNm43WkkwNnE4S1NnajJ6TkJ2a2pkSmtJTHFEbTlhRGJHYlh0UFhm?=
 =?utf-8?B?WXdUZzF6YWFLSGNlMm92VGFPa3JSYTJqemhmck9keWt6NHRibDdnblpqNlFs?=
 =?utf-8?B?YkNtRjF3clFVM3pQOW54Vm9vQStCWndPMThIbjRCdWw3MWxKLzBaSk5zb3Zq?=
 =?utf-8?B?bUNRckpMd2NNVHRBd0pRak0zdzRSamRCZGFXbTBiQmcwTVZ2SXBVQTBtNU5V?=
 =?utf-8?B?NDNCTEUwTUhjQ2hyQ2JKWjFtcVk2QUtkNS9YdGdxMUdCbEovUzZFZDBsb0FF?=
 =?utf-8?B?TVgzY25qeHBVV1RuZHlJajZ2MGhFMG5Ta2hDbzJycCtWb0hYTUVSeCtZSHZj?=
 =?utf-8?B?Vm9kemY3SE5vVHNEK2c1SkJLY05yN3pocmlnU0NkSzhxaFF3Zk5vQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bbb5d05b-9818-45c8-fa4e-08de68610952
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 04:58:31.3898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N3R2bxdZqcGIuP+6AXBrhi9TuFObutpTbi6yuO/CFS++qHRwBKfoQthctCU/NjGl5bURdkg0f2UImzcviDfnZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7345
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[riana.tauro@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,linux.intel.com,intel.com,ffwll.ch,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 01BA3116EFE
X-Rspamd-Action: no action



On 2/5/2026 2:00 PM, Raag Jadav wrote:
> On Mon, Feb 02, 2026 at 12:13:59PM +0530, Riana Tauro wrote:
>> Initialize DRM RAS in hw error init. Map the UAPI error severities
>> with the hardware error severities and refactor file.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_drm_ras_types.h |  8 ++++
>>   drivers/gpu/drm/xe/xe_hw_error.c      | 68 ++++++++++++++++-----------
>>   2 files changed, 48 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_drm_ras_types.h b/drivers/gpu/drm/xe/xe_drm_ras_types.h
>> index 0ac4ae324f37..beed48811d6a 100644
>> --- a/drivers/gpu/drm/xe/xe_drm_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_drm_ras_types.h
>> @@ -11,6 +11,14 @@
>>   
>>   struct drm_ras_node;
>>   
>> +/* Error categories reported by hardware */
>> +enum hardware_error {
>> +	HARDWARE_ERROR_CORRECTABLE = 0,
>> +	HARDWARE_ERROR_NONFATAL = 1,
>> +	HARDWARE_ERROR_FATAL = 2,
> 
> I'd align "= x" using tabs for readability.

Will remove the values except the start

> 
>> +	HARDWARE_ERROR_MAX,
> 
> Guaranteed last member, so redundant comma.

Will fix it

> 
>> +};
> 
> Also, just curious. Are these expected to be reused anywhere?
> If not, they're probably better off in the .c file.
> 
> ...
> 
>> @@ -86,8 +78,8 @@ static void csc_hw_error_handler(struct xe_tile *tile, const enum hardware_error
>>   		fw_err = xe_mmio_read32(mmio, HEC_UNCORR_FW_ERR_DW0(base));
>>   		for_each_set_bit(err_bit, &fw_err, HEC_UNCORR_FW_ERR_BITS) {
>>   			drm_err_ratelimited(&xe->drm, HW_ERR
>> -					    "%s: HEC Uncorrected FW %s error reported, bit[%d] is set\n",
>> -					     hw_err_str, hec_uncorrected_fw_errors[err_bit],
>> +					    "HEC FW %s error reported, bit[%d] is set\n",
>> +					     hec_uncorrected_fw_errors[err_bit],
> 
> So we're dropping severity_str here? Did I miss something?

I removed it because uncorrected was mentioned in log. But removed that 
also by mistake

Will fix this. Thanks for catching this

> 
>>   					     err_bit);
> 
> ...
> 
>> +static int hw_error_info_init(struct xe_device *xe)
>> +{
>> +	int ret;
>> +
>> +	if (xe->info.platform != XE_PVC)
>> +		return 0;
>> +
>> +	ret = xe_drm_ras_allocate_nodes(xe);
> 
> Why not just
> 
> 	return xe_drm_ras_allocate_nodes();
> 
> Tidy? ;)

okay

> 
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>>   /*
>>    * Process hardware errors during boot
>>    */
>> @@ -172,11 +179,16 @@ static void process_hw_errors(struct xe_device *xe)
>>   void xe_hw_error_init(struct xe_device *xe)
>>   {
>>   	struct xe_tile *tile = xe_device_get_root_tile(xe);
>> +	int ret;
>>   
>>   	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>>   		return;
>>   
>>   	INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
>>   
>> +	ret = hw_error_info_init(xe);
>> +	if (ret)
>> +		drm_warn(&xe->drm, "Failed to allocate DRM RAS nodes\n");
> 
> This is less likely due to any hardware limitation, so I think
> drm_err() would be more appropriate here.

okay will fix it

Thanks
Riana

> 
> Raag
> 
>> +
>>   	process_hw_errors(xe);
>>   }
>> -- 
>> 2.47.1
>>

