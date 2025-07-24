Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5D4B0FF7C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 06:15:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68CF910E875;
	Thu, 24 Jul 2025 04:15:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eypnFTXK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B728710E875
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 04:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753330546; x=1784866546;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=C9J3YqyDrbSAqKJubCXRu3PUXQqFWR1G5lBuw9GRTX4=;
 b=eypnFTXKIaUJF8XeywpwiAwXCaDQzo2FypcoQ4I+qtJbXMhQCKYu1FDZ
 YiLei6rASIZ7NtGlj5CseEeB3imsa0o3T39VM1ubRjkhge0LDEu1R4Kpm
 LSZGkj4zVsnLvFXZMzpzWpERwr+5mGr/riKMuMrkIoGUplL0Mlc/MHxhV
 N9aMU/+KN6qFNG+uC47A5oOKHhUT+ZxXoCQ4vXS8iIueeZ2y9+t2kRRLB
 sdiYPQWHi/gNkl494/FqGUyV62ed1d5z/sHkuOAod1Q8nKIK48htV5KVg
 FHyzi03A2c607yk6j7zRZISwAiyY9NgiXWpq3kgNlTSPuSSqEKxiZnHDi A==;
X-CSE-ConnectionGUID: cYmEEk8NTfu6uimvnYgQcw==
X-CSE-MsgGUID: KKeERyicRECFcwzg7YKRtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="78165490"
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; d="scan'208";a="78165490"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 21:15:45 -0700
X-CSE-ConnectionGUID: 5/aRY5BXS66pbKc0Q5gepA==
X-CSE-MsgGUID: nWAWaVn2TpS+wTKAPU3Nvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; d="scan'208";a="160336224"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 21:15:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 21:15:44 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 23 Jul 2025 21:15:44 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.75) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 21:15:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a6iiNO5dAXLsv7Y1qdyv1+auS4ViDxapZD1YjhSumqZ9HT/mUJbC2aP9kzMaS1AUY1IyTpUwiNWjzsfWFDDdmIZkYsSW+XaDQLrqOVEGhjxpg5bGRrB2mPbqnXndQP9MYMky92EOeboQ8i5stKFZBU0SSTb7wEAON5/4H8byb+eCKyom4gEieTvMg51WmMC81/mt/PyLR4CQs3iyQDVT8ooTc5ozXYstHVTbK5NYW0YUCbumbVOjGPwRg1cHhYRqHF6lIEucbUo5mRs35MTyCoo5kVhCw9btuywCQNGoGgXmY0+b22CSblkc9t9lweBQfLmQYJmhIGkrVxrS3k09+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3mRVnuaM2piMiF2eIE03xioDuFy6iK4s7D8D+gvFHwI=;
 b=wU0HaNgYv5hx/iphqPMXCNbDFwbM5k1tDiANVasqjEH9PtSvWU3wqK8UYU+aFwUDF7x2rjRx32CaGkYk4aFEjIJ4xY/zQjumYFZv8J9Qy8TuFkz+Wcrx8Ya3zDPpYmE8y3Jn2Xpo1alwGNJD4dByV1jBOsqnXhc7bZWrrSBPkBvCp66JcfP+BwFljBFsdLcoPTCgbyQ9hppLkJ/lYn+XWhohWMR/m3es4EVrXr3BCrawrtpYjcYRynLGTpME6lQJ0chfkHeiegyyibUjy+wSTsX7ciNljjDM8jv9Q66ACx3hAXfuAvvOq9vRAUzdF/fVhwkrrrL1bPH2Hsx9y/PBNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7340.namprd11.prod.outlook.com (2603:10b6:930:84::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 04:15:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.8964.019; Thu, 24 Jul 2025
 04:15:42 +0000
Date: Wed, 23 Jul 2025 21:17:29 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <phasta@kernel.org>
CC: Danilo Krummrich <dakr@kernel.org>, James Flowers
 <bold.zone2373@fastmail.com>, <ckoenig.leichtzumerken@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <skhan@linuxfoundation.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH] drm/sched: Prevent stopped entities from being added to
 the run queue.
Message-ID: <aIGz2fzBILVQnDW8@lstrano-desk.jf.intel.com>
References: <20250720235748.2798-1-bold.zone2373@fastmail.com>
 <66a14b005fa3dc874f4f3261b93901af1292bde9.camel@mailbox.org>
 <e7c0f63678a93261182b69aa526217821552a150.camel@mailbox.org>
 <DBHNK2XQHUIW.TQHV41LR5D8I@kernel.org>
 <aH6B7JruWCkReaLw@lstrano-desk.jf.intel.com>
 <80f569dd3c42f11927324ea80e7c14ac2d3352b5.camel@mailbox.org>
 <aH9GwaquE7OR0HFY@lstrano-desk.jf.intel.com>
 <aH9Pj+eIuIgNiL69@lstrano-desk.jf.intel.com>
 <3b4ef4687af55b2332fd128ff3f3f810f5681df0.camel@mailbox.org>
 <aIGy7uRuvYA0v8TO@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aIGy7uRuvYA0v8TO@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR04CA0183.namprd04.prod.outlook.com
 (2603:10b6:303:86::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7340:EE_
X-MS-Office365-Filtering-Correlation-Id: ab8a318e-7378-4716-07f7-08ddca68c108
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bFdaWFVlYndSUzdDTENTZWFLSm85dWlOamRZK3N2RmZGbmZaN2p5R1RDSmw5?=
 =?utf-8?B?eXJSblBGMTFXWVNVTXFMWTJ5Zm9xb1YvR1RoRzRaNnhBQVlickVsbUhyZksy?=
 =?utf-8?B?SlowNUpnbGZtWUZUSlZ5RDNKM0hWRE95NnJBaXZrYlVWTmF0UE5tT3NVWTBY?=
 =?utf-8?B?SElKMWZYN2t0ait2OG5weDZqNmZIMmg0cjd6enlQa3d4WnNRRk5NVDRYMlF2?=
 =?utf-8?B?Z1hMbk52eVVBQXdpdTV4MW5BeXM5NDJ6S3JTTzRXamNZRlRGNlpaMlhWTytC?=
 =?utf-8?B?U01VMlMxb05sUXV4NVBkWFhXbTkzSUYyL29yb3FXeXdqeUIwZXg3KytHZndS?=
 =?utf-8?B?VHJRd1pXeWdibWJqakVkTVdyeldhRG9HUE5aNWhkOGVSQWlxVnVHT3AyeitY?=
 =?utf-8?B?WjhNOFJrUkFReGpvdWpReFVPWGZvc0dvdCtOMVNEZ1dTekdZM1g2cDB6cm1Z?=
 =?utf-8?B?aFFSOVVocWh4ZjhENEIwUFhhWGZtc293aUFvY1ZBYkFWT09NVWRWRnIwWngw?=
 =?utf-8?B?SEFpb01XQzRSNGZibmlHNzFsVFFYbFdUUDhJQnE4UUt2eVdteFQvRlMwOGdr?=
 =?utf-8?B?dXNvcXpkeEM4cFdXTGx0TUd6NkJJKzErQ0crWWgxeXVoV3pCZ3VqMUlCL3c5?=
 =?utf-8?B?WVV4Zm8yWmtPcXk2M0swYnNVdnZVMlZzZWdCYWRCcFYzTmZZblRqeVE3bGl2?=
 =?utf-8?B?WDloV1NnYXR0dkJYenlvYW54MDZyT0ZuNWF3bjAySmFmZDF0Yk54eHk0L0Ry?=
 =?utf-8?B?SXFYNDduUndPK0ZIZ0lXcm9FK2pMenhsMDYreDdhUkRrN2lFRmZKN2svMzVh?=
 =?utf-8?B?Yk9zeHpTcHBZOVNTbUJ1L1ZCV0FzcldadS83am1VeDVZdS9IeVZNVVJiWjkx?=
 =?utf-8?B?WlVPMThocUg0K09IbjFHY0FrVmpLSHRDNkd1cTFScFVKaml2M05GWUtaM1B3?=
 =?utf-8?B?VEd6b1IvWXN0RE00bjNnYjNnUFVaQlBQUi8vOWlLYW5BTW9WL05JTE5JZkNG?=
 =?utf-8?B?U0RPKytWTElieW5VSllZMFNObHhPNUF3WHNkWVBBTThTTTFLZHhlbVRwNUE3?=
 =?utf-8?B?dDMzNFdJNE5NN1NuS3ZvbDVITVBkNExDM3VVRzIyeWNQaDFRNmh5WlV1Rlgw?=
 =?utf-8?B?S2wzSFBCVmdZaWhOOXpYb29FbmVjRzF2TGEydCtabVI4ejdTMFVJZE5RZFF6?=
 =?utf-8?B?Y0xXNlNyUlo5djA5YXlTMmVnemN6ZDRTeThMWHpGQ09RYlk4YUNRVWlYa0Vw?=
 =?utf-8?B?N0J2VXhUbnVzbGNhQWtUZmRycFZTNnJQUkFpUExaS2NRRzRrNTBCazFTY0dQ?=
 =?utf-8?B?VHBiNHpZc0JvMGNxbGt1VkRZR1NhNWlHRWRJUnlzamlSb08wdEZRcFRFR1Fr?=
 =?utf-8?B?OW5PbmFocWZ1TEd1NHkrWHlrOEdXZllybWlWYlM5L3hNQTczQ2hOSFJNRG9P?=
 =?utf-8?B?ak5yVVlTaHpzTlljZUwzM2RnRStBUU9rQ0ZYMTA0bnhOSnNKbzdYMDhrUS81?=
 =?utf-8?B?WWcxRnVNNUVRS1k2Z2ZJd3VFK0JQWEl2VGhjQjJESVJQQ2RIQ2loNlRJL2JP?=
 =?utf-8?B?dmlLa3JYNkRjbzg0TkgvSnJyWjFKY3VOcEEvb21kT3VVU1ozMW9XYmhTUW9G?=
 =?utf-8?B?dE5ORDl6YmQrbnpXWmY4OFZFSVcrMWhTYzlsSGJiQ2dERjBGeUNjdmtDalZX?=
 =?utf-8?B?MDRKbi83SW1nMW1iNmdRbFdNUzJOc2l4d0diUklTUDVYemRQdy9FOTNaaERF?=
 =?utf-8?B?UkhZenRnSjdCMzNybEREUzEzZFk3TlJ2RzR6MXphWGZCS1pWMEE2QXlOV2sx?=
 =?utf-8?B?NUM4cWI1WkN5T2kvYnpsMmdvMWlMcDNrSHRIWGVhL0lTMVU1SEpOME9naVlD?=
 =?utf-8?B?cUgwaDNCSURLeHYvRE5ULzk3czgxeE0xbkhWMzZmejNPYjB5M25tMW9mVVUy?=
 =?utf-8?Q?A9J6zJVmUiE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWVJVXRwcmMvTUJWbDRWeU4zSExkeHFtSStxaW5hUlNpY2paUmd6Mnh2RUh3?=
 =?utf-8?B?ejhUeUFKN1IvSDFhR3FlR1B4TGVMNG9NaWE3UnVLZGxkb0tPOG4zSVQ4L2hx?=
 =?utf-8?B?NGtRWW8vS3dkb2syRDF4cUZhMVVocWxrcXJ6N2dtdlp3dVBtSnJOLzMvZkZI?=
 =?utf-8?B?ZzJKRnNiN2hoZDQ3bEs4VnFoTWh3T3cxR0l5cEQvSlkvSG9uQkN6K2gwU2Zt?=
 =?utf-8?B?cTFXNXJSMUd1U3kwbk9Ba0JwdEJxQjVPN0hRQXVFQkVKV1dUVnFpYmJuSVJR?=
 =?utf-8?B?S21VWCticE10enBuU1JHMXd2Kys1QVdtSXJKOFMyQ2F5eXlIQUowekY4S01x?=
 =?utf-8?B?OFk1ZHpGYnRzKzh3SEh4TVpnVVJXU0JjRHBXS25rdE9HUFlJOER3ZjFzSkN1?=
 =?utf-8?B?NHdBaFhvUzNGdTV6UUpOamZRVUJnUkxzTEtqdTFrejhQdHFpTXN1NjJFQWl1?=
 =?utf-8?B?QTlwNUQwR21wc0l4cVFQYy9oTnNKMW44WTM0Q3F6MUpibWlQcTB4T2tjbVZr?=
 =?utf-8?B?ZUduQVMzejhxcG9BNWR0TnUrY0k0Vk04d01HYVh1cFgzM1lFcVArYzRuSWN5?=
 =?utf-8?B?MGRnMmRqUGZvSkRmcGVaZzRRamNSL1NrTE5UMXUzU1dDNTVSa1ArUFZrTFJw?=
 =?utf-8?B?bWFFQmJSUTNiZ2duaUI1NHRBVnZtM2pVUDNzUnlpVWp0dU9qNHE5TkdqbXU1?=
 =?utf-8?B?L1dlMFZuc3Fjem1tWktxSmVsQ21waUxKYk0rd2ttWE94aHlDb3RCUWpmM0hQ?=
 =?utf-8?B?UlY0WFVjV25XVERmUzg3dmN1VWVzK1JDVUEreUc0SnhqcnRpdXdaZTBraHFj?=
 =?utf-8?B?V2l0a0MvNmlwUEtra2RzZGwzVS9oQk9LZGliNGE4MnRQU2lNUWQ2a2pKOUI5?=
 =?utf-8?B?eUIyT0hGRnZSMm9TVDVRQ2V4bFMzMFhLVjQrSFk3VndtdlE1VE1OYTB1QnJT?=
 =?utf-8?B?Y1NOSS9qdlMxVExtSUtEUkQrRUpMT2VQRU96T3pmYzNtRFAvek95T1pKU2hj?=
 =?utf-8?B?YjkvTW1ia0ZVYUhJOUxLS3BkaXZBU2xWTUNDWjkzQXpCQzExMWpUdXFCaDdr?=
 =?utf-8?B?ckk0em5JejNjeEpqb0cwMlVLdXZnV0VoOU9oclpxdkt3YVFmUzVnVGRxUE9D?=
 =?utf-8?B?U1ZLaTc1NnNQU3BSbnpPckZtWTJ0S2ZPNisrT1NRcTdFdTFCN0RzbSs1cGtD?=
 =?utf-8?B?NjRMWnJjSFY5bnVnTTU1SzJOSHAvdlJwVlM3SjRFMzBPYkc3Q0crL0JlWE1x?=
 =?utf-8?B?K2VIdWZobkVJTEptTmpMNHh5OUFFZEFJVTRMb0IzN25PUXBrdGFQUWZZWTRo?=
 =?utf-8?B?QS9ZZUVXUXhPL2lYOHppU21BOG9GZTQ1dzZVeUY4Z2locHMzWWpZSW5IV3B5?=
 =?utf-8?B?WDVZQ2hibnJ6QjhFOGZISEZwdGZHSHVLc1VZeHpTUGw5R0N0aWFYSFFCbXAw?=
 =?utf-8?B?Rm1NQzN3amZPUEthRVVjOW95dVhMQUlPd1FFeXdRNEd3a0dIQXJUUGJvWjhs?=
 =?utf-8?B?am9JbDQrZllIUmpPWC9Za05wYmU4bUJTeW1aOG9TUzlobXRUY2NaNTlDQWIv?=
 =?utf-8?B?UWRIOWZOM2R5eU5BY0p0MWxmTGwvT0NPVXJaOVgwNWlUb1A1MzlDM001SStJ?=
 =?utf-8?B?bjIxbjFKQ1praUFUMnhaYWNxKzFUdXUvd2NabGVmUll4eUc3UFAxNVRjV09a?=
 =?utf-8?B?YUU5Z2ZYcnNUUEM4QWpCaGh0aHNRN01VcjRGd3g5NXJ0eVllWkcvTEcxU1Ni?=
 =?utf-8?B?RUphVUk4WlNFOHh6UlJkQ045TVpmQWN6U2F2L1lRcFB6aWxDWXhZSXlVQ2dT?=
 =?utf-8?B?QUc0azF1RWc5MmI0eVdzQlNCb1UyemtrL1NGZ2lJYzRZKzFTN0xEb0Z5UFJz?=
 =?utf-8?B?dnh0Ty9KaStSTWxaL1ZuR3BoM0JPRnlhVSsvYmMyczVPcmV0YXl2TStVOGtR?=
 =?utf-8?B?MVhhZlE0MmlIemQzcGpRbkh2cEsrcmZWYlhYOW9aSzBQUk85c0FCZGVSVit0?=
 =?utf-8?B?Z1VPR3A2VDR5bEdKVWxpZFN2U3JPa01CVGpBOGxMN2s1ZjNhT1RhejBya05q?=
 =?utf-8?B?cG9zZm5vMCtMQ2xDSVF4c3BGamt6VTNKYVpTQkkvMDN2bW9tMktpaHpJNW9v?=
 =?utf-8?B?TEpkWi9VOHV5ZE9jVklPbjJEMndCNGVjWUc3T2hMTXU0WDhZWW02L3VrU05j?=
 =?utf-8?B?Y0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab8a318e-7378-4716-07f7-08ddca68c108
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 04:15:42.1835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HLW8HVEoYXfqJ5Hwo/r10IXwvEKomdE/MPwjZL6OEhYkDxBPihK2u+Fqa3GoSrAl78ENYep2t2X/oxzSqKyW7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7340
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

On Wed, Jul 23, 2025 at 09:13:34PM -0700, Matthew Brost wrote:
> On Wed, Jul 23, 2025 at 08:56:01AM +0200, Philipp Stanner wrote:
> > On Tue, 2025-07-22 at 01:45 -0700, Matthew Brost wrote:
> > > On Tue, Jul 22, 2025 at 01:07:29AM -0700, Matthew Brost wrote:
> > > > On Tue, Jul 22, 2025 at 09:37:11AM +0200, Philipp Stanner wrote:
> > > > > On Mon, 2025-07-21 at 11:07 -0700, Matthew Brost wrote:
> > > > > > On Mon, Jul 21, 2025 at 12:14:31PM +0200, Danilo Krummrich wrote:
> > > > > > > On Mon Jul 21, 2025 at 10:16 AM CEST, Philipp Stanner wrote:
> > > > > > > > On Mon, 2025-07-21 at 09:52 +0200, Philipp Stanner wrote:
> > > > > > > > > On Sun, 2025-07-20 at 16:56 -0700, James Flowers wrote:
> > > > > > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > > index bfea608a7106..997a2cc1a635 100644
> > > > > > > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > > @@ -172,8 +172,10 @@ void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
> > > > > > > > > >  
> > > > > > > > > >  	entity->oldest_job_waiting = ts;
> > > > > > > > > >  
> > > > > > > > > > -	rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
> > > > > > > > > > -		      drm_sched_entity_compare_before);
> > > > > > > > > > +	if (!entity->stopped) {
> > > > > > > > > > +		rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
> > > > > > > > > > +			      drm_sched_entity_compare_before);
> > > > > > > > > > +	}
> > > > > > > > > 
> > > > > > > > > If this is a race, then this patch here is broken, too, because you're
> > > > > > > > > checking the 'stopped' boolean as the callers of that function do, too
> > > > > > > > > – just later. :O
> > > > > > > > > 
> > > > > > > > > Could still race, just less likely.
> > > > > > > > > 
> > > > > > > > > The proper way to fix it would then be to address the issue where the
> > > > > > > > > locking is supposed to happen. Let's look at, for example,
> > > > > > > > > drm_sched_entity_push_job():
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
> > > > > > > > > {
> > > > > > > > > 	(Bla bla bla)
> > > > > > > > > 
> > > > > > > > >  	…………
> > > > > > > > > 
> > > > > > > > > 	/* first job wakes up scheduler */
> > > > > > > > > 	if (first) {
> > > > > > > > > 		struct drm_gpu_scheduler *sched;
> > > > > > > > > 		struct drm_sched_rq *rq;
> > > > > > > > > 
> > > > > > > > > 		/* Add the entity to the run queue */
> > > > > > > > > 		spin_lock(&entity->lock);
> > > > > > > > > 		if (entity->stopped) {                  <---- Aha!
> > > > > > > > > 			spin_unlock(&entity->lock);
> > > > > > > > > 
> > > > > > > > > 			DRM_ERROR("Trying to push to a killed entity\n");
> > > > > > > > > 			return;
> > > > > > > > > 		}
> > > > > > > > > 
> > > > > > > > > 		rq = entity->rq;
> > > > > > > > > 		sched = rq->sched;
> > > > > > > > > 
> > > > > > > > > 		spin_lock(&rq->lock);
> > > > > > > > > 		drm_sched_rq_add_entity(rq, entity);
> > > > > > > > > 
> > > > > > > > > 		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> > > > > > > > > 			drm_sched_rq_update_fifo_locked(entity, rq, submit_ts); <---- bumm!
> > > > > > > > > 
> > > > > > > > > 		spin_unlock(&rq->lock);
> > > > > > > > > 		spin_unlock(&entity->lock);
> > > > > > > > > 
> > > > > > > > > But the locks are still being hold. So that "shouldn't be happening"(tm).
> > > > > > > > > 
> > > > > > > > > Interesting. AFAICS only drm_sched_entity_kill() and drm_sched_fini()
> > > > > > > > > stop entities. The former holds appropriate locks, but drm_sched_fini()
> > > > > > > > > doesn't. So that looks like a hot candidate to me. Opinions?
> > > > > > > > > 
> > > > > > > > > On the other hand, aren't drivers prohibited from calling
> > > > > > > > > drm_sched_entity_push_job() after calling drm_sched_fini()? If the
> > > > > > > > > fuzzer does that, then it's not the scheduler's fault.
> > > > > > > 
> > > > > > > Exactly, this is the first question to ask.
> > > > > > > 
> > > > > > > And I think it's even more restrictive:
> > > > > > > 
> > > > > > > In drm_sched_fini()
> > > > > > > 
> > > > > > > 	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
> > > > > > > 		struct drm_sched_rq *rq = sched->sched_rq[i];
> > > > > > > 
> > > > > > > 		spin_lock(&rq->lock);
> > > > > > > 		list_for_each_entry(s_entity, &rq->entities, list)
> > > > > > > 			/*
> > > > > > > 			 * Prevents reinsertion and marks job_queue as idle,
> > > > > > > 			 * it will be removed from the rq in drm_sched_entity_fini()
> > > > > > > 			 * eventually
> > > > > > > 			 */
> > > > > > > 			s_entity->stopped = true;
> > > > > > > 		spin_unlock(&rq->lock);
> > > > > > > 		kfree(sched->sched_rq[i]);
> > > > > > > 	}
> > > > > > > 
> > > > > > > In drm_sched_entity_kill()
> > > > > > > 
> > > > > > > 	static void drm_sched_entity_kill(struct drm_sched_entity *entity)
> > > > > > > 	{
> > > > > > > 		struct drm_sched_job *job;
> > > > > > > 		struct dma_fence *prev;
> > > > > > > 
> > > > > > > 		if (!entity->rq)
> > > > > > > 			return;
> > > > > > > 
> > > > > > > 		spin_lock(&entity->lock);
> > > > > > > 		entity->stopped = true;
> > > > > > > 		drm_sched_rq_remove_entity(entity->rq, entity);
> > > > > > > 		spin_unlock(&entity->lock);
> > > > > > > 
> > > > > > > 		[...]
> > > > > > > 	}
> > > > > > > 
> > > > > > > If this runs concurrently, this is a UAF as well.
> > > > > > > 
> > > > > > > Personally, I have always been working with the assupmtion that entites have to
> > > > > > > be torn down *before* the scheduler, but those lifetimes are not documented
> > > > > > > properly.
> > > > > > 
> > > > > > Yes, this is my assumption too. I would even take it further: an entity
> > > > > > shouldn't be torn down until all jobs associated with it are freed as
> > > > > > well. I think this would solve a lot of issues I've seen on the list
> > > > > > related to UAF, teardown, etc.
> > > > > 
> > > > > That's kind of impossible with the new tear down design, because
> > > > > drm_sched_fini() ensures that all jobs are freed on teardown. And
> > > > > drm_sched_fini() wouldn't be called before all jobs are gone,
> > > > > effectively resulting in a chicken-egg-problem, or rather: the driver
> > > > > implementing its own solution for teardown.
> > > > > 
> > > > 
> > > > I've read this four times and I'm still generally confused.
> > > > 
> > > > "drm_sched_fini ensures that all jobs are freed on teardown" — Yes,
> > > > that's how a refcounting-based solution works. drm_sched_fini would
> > > > never be called if there were pending jobs.
> > > > 
> > > > "drm_sched_fini() wouldn't be called before all jobs are gone" — See
> > > > above.
> > > > 
> > > > "effectively resulting in a chicken-and-egg problem" — A job is created
> > > > after the scheduler, and it holds a reference to the scheduler until
> > > > it's freed. I don't see how this idiom applies.
> > > > 
> > > > "the driver implementing its own solution for teardown" — It’s just
> > > > following the basic lifetime rules I outlined below. Perhaps Xe was
> > > > ahead of its time, but the number of DRM scheduler blowups we've had is
> > > > zero — maybe a strong indication that this design is correct.
> > > > 
> > > 
> > > Sorry—self-reply.
> > > 
> > > To expand on this: the reason Xe implemented a refcount-based teardown
> > > solution is because the internals of the DRM scheduler during teardown
> > > looked wildly scary. A lower layer should not impose its will on upper
> > > layers. I think that’s the root cause of all the problems I've listed.
> > > 
> > > In my opinion, we should document the lifetime rules I’ve outlined, fix
> > > all drivers accordingly, and assert these rules in the scheduler layer.
> > 
> > 
> > Everyone had a separate solution for that. Nouveau used a waitqueue.
> > That's what happens when there's no centralized mechanism for solving a
> > problem.
> > 
> 
> Right, this is essentially my point — I think refcounting on the driver
> side is what the long-term solution really needs to be.
> 
> To recap the basic rules:
> 
> - Entities should not be finalized or freed until all jobs associated
>   with them are freed.
> - Schedulers should not be finalized or freed until all associated
>   entities are finalized.
> - Jobs should hold a reference to the entity.
> - Entities should hold a reference to the scheduler.
> 
> I understand this won’t happen overnight — or perhaps ever — but
> adopting this model would solve a lot of problems across the subsystem
> and reduce a significant amount of complexity in the DRM scheduler. I’ll
> also acknowledge that part of this is my fault — years ago, I worked
> around problems (implemented above ref count model) in the scheduler
> related to teardown rather than proposing a common, unified solution,
> and clear lifetime rules.
> 
> For drivers with a 1:1 entity-to-scheduler relationship, teardown
> becomes fairly simple: set the TDR timeout to zero and naturally let the
> remaining jobs flush out via TDR + the timedout_job callback, which
> signals the job’s fence. Free job, is called after that.
> 
> For non-1:1 setups, we could introduce something like
> drm_sched_entity_kill, which would move all jobs on the pending list of
> a given entity to a kill list. A worker could then process that kill
> list — calling timedout_job and signaling the associated fences.
> Similarly, any jobs that had unresolved dependencies could be
> immediately added to the kill list. The kill list would have to be

s/added to the kill list/added to the kill list after calling run_job/

Matt

> checked in drm_sched_free_job_work too.
> 
> This would ensure that all jobs submitted would go through the full
> lifecycle:
> 
> - run_job is called
> - free_job is called
> - If the fence returned from run_job needs to be artificially signaled,
>   timedout_job is called
> 
> We can add the infrastructure for this and once all driver adhere this
> model, clean up ugliness in the scheduler related to teardown and all
> races here.
> 
> > Did you see the series we recently merged which repairs the memory
> > leaks of drm/sched? It had been around for quite some time.
> > 
> > https://lore.kernel.org/dri-devel/20250701132142.76899-3-phasta@kernel.org/
> >
> 
> I would say this is just hacking around the fundamental issues with the
> lifetime of these objects. Do you see anything in Nouveau that would
> prevent the approach I described above from working?
> 
> Also, what if jobs have dependencies that aren't even on the pending
> list yet? This further illustrates the problems with trying to finalize
> objects while child objects (entities, job) are still around.
> 
> Matt
> 
> > 
> > P.
> > 
> > > 
> > > Matt
> > > 
> > > > Matt
> > > > 
> > > > > P.
> > > > > 
> > > > > 
> > > > > > 
> > > > > > > 
> > > > > > > There are two solutions:
> > > > > > > 
> > > > > > >   (1) Strictly require all entities to be torn down before drm_sched_fini(),
> > > > > > >       i.e. stick to the natural ownership and lifetime rules here (see below).
> > > > > > > 
> > > > > > >   (2) Actually protect *any* changes of the relevent fields of the entity
> > > > > > >       structure with the entity lock.
> > > > > > > 
> > > > > > > While (2) seems rather obvious, we run into lock inversion with this approach,
> > > > > > > as you note below as well. And I think drm_sched_fini() should not mess with
> > > > > > > entities anyways.
> > > > > > > 
> > > > > > > The ownership here seems obvious:
> > > > > > > 
> > > > > > > The scheduler *owns* a resource that is used by entities. Consequently, entities
> > > > > > > are not allowed to out-live the scheduler.
> > > > > > > 
> > > > > > > Surely, the current implementation to just take the resource away from the
> > > > > > > entity under the hood can work as well with appropriate locking, but that's a
> > > > > > > mess.
> > > > > > > 
> > > > > > > If the resource *really* needs to be shared for some reason (which I don't see),
> > > > > > > shared ownership, i.e. reference counting, is much less error prone.
> > > > > > 
> > > > > > Yes, Xe solves all of this via reference counting (jobs refcount the
> > > > > > entity). It's a bit easier in Xe since the scheduler and entities are
> > > > > > the same object due to their 1:1 relationship. But even in non-1:1
> > > > > > relationships, an entity could refcount the scheduler. The teardown
> > > > > > sequence would then be: all jobs complete on the entity → teardown the
> > > > > > entity → all entities torn down → teardown the scheduler.
> > > > > > 
> > > > > > Matt
> > > > > 
> > 
