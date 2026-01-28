Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oP6BEfuxeWkEygEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 07:51:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D619D87F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 07:51:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B47AA10E181;
	Wed, 28 Jan 2026 06:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h/xBFYR7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 040D410E181;
 Wed, 28 Jan 2026 06:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769583093; x=1801119093;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ql3brMkFWVr46w4/uReSgIRmkEqWVZc8WzZ5Hyi5Iqs=;
 b=h/xBFYR7gibcKz6RatyLfGWv2UbbxLvhWPgwmuLMObggPrbjjuLrAoF5
 8aP9umqt6CO1pHWU+Y4nD6mXBizFb291Wt15djwbinuBK3E1bQ+YzNeLO
 ID+80rtMwbcQDXcoy83cg2eMSoFTXaN59wpo06xY1kM9//GKZafzuaYDq
 77Ho3E09omI6gR1L2l2SXr4Mm6/VVL4IBqEaJGTjer/+NEXSnh4R3oIuf
 yk50b5saSrDw2iNKknYA7Gd+oQhO3Jiyoj+Gzz0h3Qq0m04IZPVcAYvyR
 EtRDzcIvCTx/OKDYp9Ab+K0kB8c7K1Rg1VhwiDp8G/LPL9sIfln+ju/03 w==;
X-CSE-ConnectionGUID: nK0LaTbXTiChmW7OAl/tNA==
X-CSE-MsgGUID: 8N9962o8SiSYmirnbAleoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70762234"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="70762234"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 22:51:31 -0800
X-CSE-ConnectionGUID: 9HEmPpX/Rz6O8xT80TxkQQ==
X-CSE-MsgGUID: 5MeYUlagTuOxnha/3yv8tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="212732512"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 22:51:32 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 22:51:31 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 22:51:31 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.37)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 22:51:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mk49sT0whtHd69TxYkgh7HZX3EJ61gbhvPmISrx61J2EhzzK4YRL1/1PF+9cAIcPwKPu59yKsmiekBbaT1GTm9BYFh4GQr3O7iMA6P9Lr0VhmAOhUNVrHO2kgNSUC/W7bTPMunVigRtsibvovOis82wUjWtmTbq/yzASOO5S6OZURnaY8S2Ro6yz66dpPbMGjl9zsgqU7TBbNO1p65HMxlpdmPIZnlPUkDxee7BJ4ypkypTR14UVsk+leUu+wpl8NrwvQ19RLuSTMP8VzKum2dAeyg12d3Cgo/JsX732tDyjN9FMxnOHEntkShmYs9hua1uYs6FxUntS/QnfZDPliQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8UpXm7n7NiQc9jX/LPH3QZFJhWFybedLJMURdZNVrko=;
 b=NTwqj7u89JDX2JFIY7y8QCDXBP8jG+vmoNgdkpTfmyFkWwoX3Pr7FUNmlV4KIUVv4m+zMenV9QqlzPNZn4nkks07aNDg47SuhsLiJbrKgqf++yDO3MtfrDjSfPLAXbneHNJb7uL8JMwNHYGadeBw5m7O26cu5hLkbqrTgJWOWN8ZUEQpleKrL8633AqlqVCI2gOnczoBfVinmlE9M+Tgu8sk7O4rs0K1V76C5yaGbuhf69vQp6/2oxmAxKASppg8r1uzwKeub4uRQvJeMMbIa4Y+vVribpxIV8mJobBswA3Ycv+GfT6UinIUjvtOoD2bCk3eRLF0ucwR2bOexHvcpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CY5PR11MB6317.namprd11.prod.outlook.com (2603:10b6:930:3f::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.11; Wed, 28 Jan 2026 06:51:28 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%3]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 06:51:28 +0000
Message-ID: <cddd882c-348c-416b-aeb2-f92d3b7f41c8@intel.com>
Date: Wed, 28 Jan 2026 12:21:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] drm/xe/xe_drm_ras: Add support for drm ras
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <aravind.iddamsetty@linux.intel.com>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <simona.vetter@ffwll.ch>, <airlied@gmail.com>, <pratik.bari@intel.com>,
 <joshua.santosh.ranjan@intel.com>, <ashwin.kumar.kulkarni@intel.com>,
 <shubham.kumar@intel.com>, <ravi.kishore.koppuravuri@intel.com>
References: <20260119040023.2821518-6-riana.tauro@intel.com>
 <20260119040023.2821518-8-riana.tauro@intel.com>
 <aW-039yu1OXXSrdz@black.igk.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aW-039yu1OXXSrdz@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0129.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::14) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CY5PR11MB6317:EE_
X-MS-Office365-Filtering-Correlation-Id: bf8e3890-beb7-49ef-9d96-08de5e39a949
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VjMzc29mSysranE2Y2V5ZGhrdjVTRWdNZW13ZlU2M1NaaFNnWTJPak9LYnVV?=
 =?utf-8?B?ZUpQV1YzZTlyYnlxNVp0MUNneElxVUJ5Z01aTGxPL0hKVzBOZHNSaTgwcU54?=
 =?utf-8?B?bUtLSFU2UDdBN2ttMGJmYnpuNnRCa2t5YXNybTR6MWdKalBQUEFoM1ArODRs?=
 =?utf-8?B?QXVqa0VoU1JhdUtBNWhwMFFXUG1lZXZOZ0pXMjF4VmFZdHRjR3Ziczhrb2RS?=
 =?utf-8?B?M3paV01hMHFVUnczZmhIdUdLajZuU1VIWjBPTWtIVlRyQnRmV3NPamZicUJt?=
 =?utf-8?B?OUFoUDUvRjFBQmM2U1NmZzBMcVd1dWJIcUdFdGpncFh2T2NSSExpSEp4ekpE?=
 =?utf-8?B?NVBUejVGWW1sM3VpQmNJT0R6Mk5qSG44bGYzSHZEQUxyMzUydXkwMm43Z0R0?=
 =?utf-8?B?a0c5WEZOcjNMRkN4a0FWZjBiY2RCTERDajF0Mkw4Snc0cHVhNnpqUXFBZHlE?=
 =?utf-8?B?U0xRVXdYNDhKQWRtbzI5eG13YVZSNjJPQW5yYU5rNi9Pelh6dGdMUEJXem9k?=
 =?utf-8?B?NDRMWmI4aDJyVDhPYlZoRmVrb0NCOG1kaUI0Ly9sQ2ZxcDFMSWhVbGhxUW5k?=
 =?utf-8?B?UjVibVpGdkVkRVpIc3NRNTBldEczNy9IdFV5ZkVkY1dXVDQrQ2RtdDVUN040?=
 =?utf-8?B?bXg3TkVlcDFYRWprcnBnMlZZMTY0NFFKMVJoWmlJWWpVWTdsdUhCakdoemFs?=
 =?utf-8?B?Ym1OUGh5NzZBUDdJZXNudjd6SVRvL2w2c3daMFNlVy8zM2VKTTdwcCtsQWVt?=
 =?utf-8?B?TnhLNFZpYjJSVVJjMFZnRkJ4OHFBalhqVUd3b2RFVlpKZmN3b0E2SUpzb1ZF?=
 =?utf-8?B?USt2bHFkMDZ3ZmFLZzZvdjJJakZhWWNJdFV3RHpjY0h2bG9VdlVaNTh1UUgz?=
 =?utf-8?B?N004V1ZVblM0N2tPc3JZRWFpaFNsMFlCQVNReFBOY3B0WUpkNDI2dXZEeElj?=
 =?utf-8?B?L1paRFpkUkt6M3kvR2t2Yk0yWVZNMzBZdE1uQlBicW5yalpZVzlMc09IWFJj?=
 =?utf-8?B?aUI2SkNON3hCMGpFZ2VzLy9rQm82WThTdW5BZm96TjVTUXdsK3ZHWmdpWXN6?=
 =?utf-8?B?OTBBM0xzL0RaSW90V3NOTTh6R3h6THoyTW84R0RZT2lWODJpRGhEbWU4aXhI?=
 =?utf-8?B?QkR2TWFZZ0p3dEJ3UkNWb3d3Z3dKOHpXazRObnBQV1FSOWIxTUYzQWJYRnJw?=
 =?utf-8?B?NWI0Ny9wL1BPU3pxaUg0Uk16ZU5TWVgyMEpxTUlvWWJ4TnJHY2krZGNOMHZy?=
 =?utf-8?B?RXNXZ2w2QVZacENORnQ3Z0pYLzRwK1lUdlNvSlYxRGVxSGtFV0hxNTJWMXJG?=
 =?utf-8?B?eUVwUHNaVTU1U3JFSGNXVGZsL1JoSXR0dFdCZUtXOFQrL3VrMklOVURDSUp0?=
 =?utf-8?B?TDBsdVRKTkQ3RnlGcW1VRXQrVGkxWE1JdG5YUUtoK3RWZm9TUW9yZ0pOdVhp?=
 =?utf-8?B?cGgrSm9CRVU3RXFyS3NYUi90NENMZldFVzVoL3NsZVpHQXhRa3FBeEI5SXZx?=
 =?utf-8?B?aVVmMldvNXUwVlNvTWVqekY2dlhLWUl3Q0hnTi9maHdXb0hpWkdaWjNpYXlS?=
 =?utf-8?B?dWRnWEsvYzV1MXhFaG1jTlBQT2E5TlUxZnIwRzlXS0s3cnprdkZ0WmUyR2g0?=
 =?utf-8?B?RkpMc1RSWXJ0VC94SUVGNDM3bHltdlYzU0NUelZqMitYRm8rSzErN2dqWEZw?=
 =?utf-8?B?S0tlN254QlEwYkJnTGxzL2JYZ3dIVW5rQW9COUt0L0pEcG05MDhmV3VXQXV4?=
 =?utf-8?B?aG01WkUrQ1JyMUpQb0pQUWhBTzgvZjJlZXlHeERIL3VPZ0ZDVmhobkYxOTMx?=
 =?utf-8?B?QVlNYWgrZGkvQzk5VUhPNDRESUlOTjNydm1OQkh2T0RqRFVBcWU4YVJBM1F2?=
 =?utf-8?B?cmJCenp4WFM5MHh3WEE1WGo0dVJMUnZiN2xzV0pwSDNtWkE4R0F6LzdvR253?=
 =?utf-8?B?cjF2VzNYMTk0VGI0RnhGOU9EZGJzN0J3MXBJR3ArT0RpRHNtZkJlUXMyeEVu?=
 =?utf-8?B?QjJweDI0TWNoQ0RDZ3dVbFA1bU0zQXo1WnhPUkdIQ1FpaW94YWR1Ukk3Tk56?=
 =?utf-8?B?UjUrbG1DWUQrMi9ZT1dxUU11RlNwVmRBaCtaY2dCNnA4UXN4WjV1a05YNUtr?=
 =?utf-8?Q?2vB1SQ6igv2+vkrGi8cprxnDO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmV0N3BpenBxb1JmcGYwRVhWZ2VadndhMkRjY0t3Y3RLSUtic0ZhbmNyT0tB?=
 =?utf-8?B?QVFsVFdubFptUytqM0J4eE10eFdYcFExeWVYMXVOeElDbTcxQW9yc3YyNUg4?=
 =?utf-8?B?MEx1aWVzOGxKMzQ0NFRpN1ZZNjdpbkpZQ0pCVzhDdGdxaFVhSDIxNmdyWmo2?=
 =?utf-8?B?UmcrcGJzSW1ocE5OWlhrRk1KWitFYWd4cEdRUDVqT0I5N0VKanNCMGJ6Qmxh?=
 =?utf-8?B?VjhnZ2lyWExDM2ZRQy92ZHV0TDFTd1hBZ2szbWpBbXVBUVBsS0t0T3lCV1lI?=
 =?utf-8?B?TmV3MXFINnFIOG9aWXVqUWRhVWdJdHduM0w4S1V5UXAxcVhFMWdNL25wTy83?=
 =?utf-8?B?N0NNV045SFdRTi9JYjNTYk9lbmk0QThIK2diUytiZVFZbDdCYVE0YzZRdkx1?=
 =?utf-8?B?NmEvd29weGd3a3p2SU96bHNzVlpmV291aWZoakhpSUJycWhRMVBscVdBMkpZ?=
 =?utf-8?B?VzlRMGdGSkV5eUpaVkgrT3FwdmhhNi9vOHlTWFBEOWF3QU1DTDI4TnIvM2gz?=
 =?utf-8?B?ei84K3lQa0pyVHlkcmJRaWZWakFMRllEaVJKTzEwNmczVjlrQUQrVjJCUzJR?=
 =?utf-8?B?VGhhVTdoVzhTUVBjUlFET284d3hGeTlQamVIblRtdmcwQnZyU25xdWllRTlk?=
 =?utf-8?B?SkJsVy9zM09lYXhwLzNnK2FEaHJ3UnVtUGVpS3RPVDh6bTBnWFNlczZaWWFs?=
 =?utf-8?B?UUR3VC9GaE0zNFJONXdzWVdIN1BmMFZhY0l1VFpqYS8xcWR0aUp2TmZjZGxn?=
 =?utf-8?B?Nlk3NWs3c1ZtRkUwQ202TmpSNDFhNEVzMEVBMDFXN1k1R2YzZnVqMVc2OW0z?=
 =?utf-8?B?T1Zzb1FzamY1VFpZQzVpaGxlcFJvcnhxcnVDWkx6NXVtVE9kRlZxVlpONnFh?=
 =?utf-8?B?bUY0YkRhUFQ2dmlPOWZROTNqRHhJMlVxcHNHbmwyTUoxbThkN29GaVhmVlpx?=
 =?utf-8?B?OWY5UlMycDdQTVlURzdBSlNOSEpWQTNWNmgwZW9HNjU4ZHRmUnpmYmRLYVVW?=
 =?utf-8?B?bzdSbkNoVk5uT2V5ekg1Wm9qZXMzajI4ejFYa0I4V282T0dIekhFam1LTG9m?=
 =?utf-8?B?VlB3cDZTOU42NzVBU0JsNk5SRUlreDcxV1Q4MWhwaUl1R2VBTXRqaWhKWVVT?=
 =?utf-8?B?R1pzQ0JHY0JKRnlTOGcySHZuckJLWUlSSTRObUN3VldYbHoyY25tZWJsbEdN?=
 =?utf-8?B?WTBBQUtJUTM1Rk9YWkpCNEhVUzdoVDN6MVJJT0JYdU5vRzBmV3NiaG11eFU2?=
 =?utf-8?B?OHk0QjAvY2JYYWN2dXVYTVZkeHJjTXcrZTYrZFlQMWJMbWFlTHVQb0twOGlt?=
 =?utf-8?B?bzZ6Uk5IMzBZaXh2L3VqaExQSVpBTGRjdktoSG9PQ0hLYjRhd2hUQTIzOWJG?=
 =?utf-8?B?SjA0Q01VNjdYNmw0R1ZyeWI0VXBweEZPMmU4SkdnZnNQcUlvbGJIVWtCc1A1?=
 =?utf-8?B?NDVvY2RiS1ByS292MzdjS0dqVWF0WlcySnM3UVZnR0JHdkJ2cWUxRDIxL21G?=
 =?utf-8?B?NnRGb1grUnFRcXFaWmE4NTNteUhLTWkyNEwzRGZyS3U1TlhOSGVybmduQkt4?=
 =?utf-8?B?aitkNU1JbHVpT0R4d2krRVhJaFhkTTlMc2d0S3BUSnZTNHkzWUVMVjRvcVRu?=
 =?utf-8?B?a1p2OHNBcHVNTFp3aUVJdkZ4ZWtwZVk2RFNsMkJ2aWZsK0hXbVNpc2I4WWJQ?=
 =?utf-8?B?QVp3bmpsbzBJSERWelZZTHF1VHhaejNZRDNKbHczYVdZWFBLcmtVbXg1NzJR?=
 =?utf-8?B?cVlJTDBlTHRoUUdiRktUeDN5SDN6N1FHQVM4QjZCdHprV2hYenkzNkxraG9V?=
 =?utf-8?B?WEcwSVFXMEZtMjYyenI2cGcrK3A4RmpieFBacnFtWWFaQXF1TnFwR3JBQ2R6?=
 =?utf-8?B?QkdXa3dEb082eS9rUVA1cytlVDVDSEpiZUdOaVdSYVU0MUZCVDJUUU5hUGlt?=
 =?utf-8?B?aTU0clBCSkJ6NFZCa29xWFhBV0ZKNUM1UVFKcHBOQThpR2R3T3ZQSjFwbTNU?=
 =?utf-8?B?VHozenNoRzYxd1pvc2FsVGR6ZkJ5R0l5RUlMWm9zbW5zUElTcUlJN05DK0lx?=
 =?utf-8?B?Z0s5SjZ2YVBMQUYzcy9BbDlYZEtKR2hoUGxoOWhSTjVLNDNYMHBrSVBNMWlj?=
 =?utf-8?B?SVR5bGRxQ0J3ZVhqb2hDaHJGYTA2WExIWlM0ZzNaWDcwdndlSGFaa0lESmlV?=
 =?utf-8?B?RWVtcUk5L3pqc1RFb3dBbDAwc2hDUzRGbnJwZWttMzZTaHNvRmFvbVJCR1VD?=
 =?utf-8?B?TFZMRnVYTW95OGpGL0E2Ukh1ODN6bXBzNFNTdXE5c0hWeURPaGJCVW1TekRj?=
 =?utf-8?B?dDFBbUdGK3FXdkZPTEhFMUQ4Q3JUY0VsbldwZldacm0yampIMnlwZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf8e3890-beb7-49ef-9d96-08de5e39a949
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 06:51:28.3603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wc8bAuTVk+O0MaNNflXr5sGX2hcEyzqCNnVUF5yvMHzrTjXWuOcWcsKFPq3PG0mf8ksdocjn1FfJky0MbJVNzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6317
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[riana.tauro@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,linux.intel.com,intel.com,ffwll.ch,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 74D619D87F
X-Rspamd-Action: no action



On 1/20/2026 10:31 PM, Raag Jadav wrote:
> On Mon, Jan 19, 2026 at 09:30:24AM +0530, Riana Tauro wrote:
>> Allocate correctable, uncorrectable nodes for every xe device
>> Each node contains error classes, counters and respective
>> query counter functions.
> 
> ...
> 
>> +static int hw_query_error_counter(struct xe_drm_ras_counter *info,
>> +				  u32 error_id, const char **name, u32 *val)
>> +{
>> +	if (error_id < DRM_XE_RAS_ERROR_CLASS_GT || error_id >= DRM_XE_RAS_ERROR_CLASS_MAX)
> 
> This looks like it can be in_range().

in_range has start+len. Should again use count here.
This seems simpler

> 
>> +		return -EINVAL;
>> +
>> +	if (!info[error_id].name)
>> +		return -ENOENT;
>> +
>> +	*name = info[error_id].name;
>> +	*val = atomic64_read(&info[error_id].counter);
>> +
>> +	return 0;
>> +}
>> +
>> +static int query_uncorrectable_error_counters(struct drm_ras_node *ep,
> 
> This is named as 'counters' but I only see a single call here. What am
> I missing?

makes sense will fix it

> 
>> +					      u32 error_id, const char **name,
>> +					      u32 *val)
> 
> Can this be less lines?

will check

> 
>> +{
>> +	struct xe_device *xe = ep->priv;
>> +	struct xe_drm_ras *ras = &xe->ras;
>> +	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERROR_SEVERITY_UNCORRECTABLE];
>> +
>> +	return hw_query_error_counter(info, error_id, name, val);
>> +}
>> +
>> +static int query_correctable_error_counters(struct drm_ras_node *ep,
> 
> Same as above.
> 
>> +					    u32 error_id, const char **name,
>> +					    u32 *val)
> 
> Same as above.
> 
>> +{
>> +	struct xe_device *xe = ep->priv;
>> +	struct xe_drm_ras *ras = &xe->ras;
>> +	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERROR_SEVERITY_CORRECTABLE];
>> +
>> +	return hw_query_error_counter(info, error_id, name, val);
>> +}
>> +
>> +static struct xe_drm_ras_counter *allocate_and_copy_counters(struct xe_device *xe)
>> +{
>> +	struct xe_drm_ras_counter *counter;
>> +	int i;
>> +
>> +	counter = drmm_kcalloc(&xe->drm, DRM_XE_RAS_ERROR_CLASS_MAX,
>> +			       sizeof(struct xe_drm_ras_counter), GFP_KERNEL);
> 
> I'd make this robust against type changes, i.e. sizeof(*counter).
> 
>> +	if (!counter)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	for (i = 0; i < DRM_XE_RAS_ERROR_CLASS_MAX; i++) {
>> +		if (!errors[i])
>> +			continue;
>> +
>> +		counter[i].name = errors[i];
>> +		atomic64_set(&counter[i].counter, 0);
> 
> Doesn't drmm_kcalloc() already take care of this?
> 
>> +	}
>> +
>> +	return counter;
>> +}
>> +
>> +static int assign_node_params(struct xe_device *xe, struct drm_ras_node *node,
>> +			      const enum drm_xe_ras_error_severity severity)
>> +{
>> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> +	struct xe_drm_ras *ras = &xe->ras;
>> +	const char *device_name;
>> +
>> +	device_name = kasprintf(GFP_KERNEL, "%04x:%02x:%02x.%d",
>> +				pci_domain_nr(pdev->bus), pdev->bus->number,
>> +				PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
>> +
>> +	node->device_name = device_name;
>> +	node->node_name = error_severity[severity];
>> +	node->type = DRM_RAS_NODE_TYPE_ERROR_COUNTER;
>> +	node->error_counter_range.first = DRM_XE_RAS_ERROR_CLASS_GT;
>> +	node->error_counter_range.last = DRM_XE_RAS_ERROR_CLASS_MAX - 1;
>> +	node->priv = xe;
>> +
>> +	ras->info[severity] = allocate_and_copy_counters(xe);
>> +	if (IS_ERR(ras->info[severity]))
>> +		return PTR_ERR(ras->info[severity]);
>> +
>> +	if (severity == DRM_XE_RAS_ERROR_SEVERITY_CORRECTABLE)
>> +		node->query_error_counter = query_correctable_error_counters;
>> +	else
>> +		node->query_error_counter = query_uncorrectable_error_counters;
> 
> Shouldn't this have explicit severity check, atleast for future proofing?

there are only two severity types right now. incase there is anything 
else added else can be modified accordingly

> 
>> +
>> +	return 0;
>> +}
>> +
>> +static int register_nodes(struct xe_device *xe)
>> +{
>> +	struct xe_drm_ras *ras = &xe->ras;
>> +	int i;
>> +
>> +	for_each_error_severity(i) {
>> +		struct drm_ras_node *node = &ras->node[i];
>> +		int ret;
>> +
>> +		ret = assign_node_params(xe, node, i);
>> +		if (ret)
>> +			return ret;
>> +
>> +		ret = drm_ras_node_register(node);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void xe_drm_ras_unregister_nodes(void *arg)
>> +{
>> +	struct xe_device *xe = arg;
>> +	struct xe_drm_ras *ras = &xe->ras;
>> +	int i;
>> +
>> +	for_each_error_severity(i) {
>> +		struct drm_ras_node *node = &ras->node[i];
>> +
>> +		drm_ras_node_unregister(node);
>> +
>> +		if (i == 0)
>> +			kfree(node->device_name);
> 
> Aren't we allocating this for each node?

Thanks for catching this. The rev2 had this once per node.
I moved the entire node params to a different function.

Will fix this


> 
>> +	}
>> +}
>> +
>> +/**
>> + * xe_drm_ras_allocate_nodes - Allocate DRM RAS nodes
>> + * @xe: xe device instance
>> + *
>> + * Allocate and register DRM RAS nodes per device
>> + *
>> + * Return: 0 on success, error code on failure
>> + */
>> +int xe_drm_ras_allocate_nodes(struct xe_device *xe)
>> +{
>> +	struct xe_drm_ras *ras = &xe->ras;
>> +	struct drm_ras_node *node;
>> +	int err;
>> +
>> +	node = drmm_kcalloc(&xe->drm, DRM_XE_RAS_ERROR_SEVERITY_MAX, sizeof(struct drm_ras_node),
> 
> Ditto for robust against type changes.

okay

> 
>> +			    GFP_KERNEL);
>> +	if (!node)
>> +		return -ENOMEM;
>> +
>> +	ras->node = node;
>> +
>> +	err = register_nodes(xe);
>> +	if (err) {
>> +		drm_err(&xe->drm, "Failed to register drm ras node\n");
>> +		return err;
>> +	}
>> +
>> +	err = devm_add_action_or_reset(xe->drm.dev, xe_drm_ras_unregister_nodes, xe);
>> +	if (err) {
>> +		drm_err(&xe->drm, "Failed to add action for xe drm_ras\n");
>> +		return err;
>> +	}
>> +
>> +	return 0;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_drm_ras.h b/drivers/gpu/drm/xe/xe_drm_ras.h
>> new file mode 100644
>> index 000000000000..2d714342e4e5
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_drm_ras.h
>> @@ -0,0 +1,15 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +#ifndef XE_DRM_RAS_H_
>> +#define XE_DRM_RAS_H_
>> +
>> +struct xe_device;
>> +
>> +#define for_each_error_severity(i)	\
>> +	for (i = 0; i < DRM_XE_RAS_ERROR_SEVERITY_MAX; i++)
>> +
>> +int xe_drm_ras_allocate_nodes(struct xe_device *xe);
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_drm_ras_types.h b/drivers/gpu/drm/xe/xe_drm_ras_types.h
>> new file mode 100644
>> index 000000000000..528c708e57da
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_drm_ras_types.h
>> @@ -0,0 +1,49 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_DRM_RAS_TYPES_H_
>> +#define _XE_DRM_RAS_TYPES_H_
>> +
>> +#include <drm/xe_drm.h>
>> +#include <linux/atomic.h>
>> +
>> +struct drm_ras_node;
>> +
>> +/* Error categories reported by hardware */
>> +enum hardware_error {
>> +	HARDWARE_ERROR_CORRECTABLE = 0,
>> +	HARDWARE_ERROR_NONFATAL = 1,
>> +	HARDWARE_ERROR_FATAL = 2,
>> +	HARDWARE_ERROR_MAX,
>> +};
>> +
>> +/**
>> + * struct xe_drm_ras_counter - XE RAS counter
>> + *
>> + * This structure contains error class and counter information
>> + */
>> +struct xe_drm_ras_counter {
>> +	/** @name: error class name */
>> +	const char *name;
>> +
>> +	/** @counter: count of error */
>> +	atomic64_t counter;
>> +};
>> +
>> +/**
>> + * struct xe_drm_ras - XE DRM RAS structure
>> + *
>> + * This structure has details of error counters
>> + */
>> +struct xe_drm_ras {
>> +	/** @node: DRM RAS node */
>> +	struct drm_ras_node *node;
>> +
>> +	/** @info: info array for all types of errors */
>> +	struct xe_drm_ras_counter *info[DRM_XE_RAS_ERROR_SEVERITY_MAX];
>> +
> 
> Nit: Redundant blank line.
> 
>> +};
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
>> index 8c65291f36fc..b42495d3015a 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -10,20 +10,14 @@
>>   #include "regs/xe_irq_regs.h"
>>   
>>   #include "xe_device.h"
>> +#include "xe_drm_ras.h"
>>   #include "xe_hw_error.h"
>>   #include "xe_mmio.h"
>>   #include "xe_survivability_mode.h"
>>   
>>   #define  HEC_UNCORR_FW_ERR_BITS 4
>>   extern struct fault_attr inject_csc_hw_error;
>> -
>> -/* Error categories reported by hardware */
>> -enum hardware_error {
>> -	HARDWARE_ERROR_CORRECTABLE = 0,
>> -	HARDWARE_ERROR_NONFATAL = 1,
>> -	HARDWARE_ERROR_FATAL = 2,
>> -	HARDWARE_ERROR_MAX,
>> -};
>> +static const char * const error_severity[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;
> 
> This is unrelated to uapi changes, shouldn't we split this into a separate
> patch?

Let me check if i can split this

> 
> ...
> 
>> +/**
>> + * enum drm_xe_ras_error_severity - DRM RAS error severity.
>> + */
>> +enum drm_xe_ras_error_severity {
>> +	/** @DRM_XE_RAS_ERROR_SEVERITY_CORRECTABLE: Correctable Error */
>> +	DRM_XE_RAS_ERROR_SEVERITY_CORRECTABLE = 0,
> 
> DRM_XE_RAS_ERR_SEV_*? (and same for this entire file)

ERROR_SEVERITY is more verbose

> 
>> +	/** @DRM_XE_RAS_ERROR_UNCORRECTABLE: Uncorrectable Error */
> 
> Match with actual name.

will fix this.

> 
>> +	DRM_XE_RAS_ERROR_SEVERITY_UNCORRECTABLE,
>> +	/** @DRM_XE_RAS_ERROR_SEVERITY_MAX: Max severity */
>> +	DRM_XE_RAS_ERROR_SEVERITY_MAX /* non-ABI */
>> +};
>> +
>> +/**
>> + * enum drm_xe_ras_error_class - DRM RAS error classes.
>> + */
>> +enum drm_xe_ras_error_class {
>> +	/** @DRM_XE_RAS_ERROR_CLASS_GT: GT Error */
>> +	DRM_XE_RAS_ERROR_CLASS_GT = 1,
>> +	/** @DRM_XE_RAS_ERROR_CLASS_SOC: SoC Error */
>> +	DRM_XE_RAS_ERROR_CLASS_SOC,
>> +	/** @DRM_XE_RAS_ERROR_CLASS_MAX: Max Error */
>> +	DRM_XE_RAS_ERROR_CLASS_MAX	/* non-ABI */
> 
> I don't find 'CLASS' to be much translatable since it can inherently mean
> anything, but I'm not sure if this to match with spec naming.
> 
> PS: I've used 'COMP' for component in my series[1], but upto you.
> Also, please help review it in case I've missed anything.

It's an aggregated error class.

yeah component does match the spec. Also the rest of the errors will be 
renamed accordingly to.

core-compute and soc-internal

Thanks
Riana

> 
> [1] https://lore.kernel.org/intel-xe/20260116093432.914040-1-raag.jadav@intel.com/
> 
> Raag
> 
>> +};
>> +
>> +/*
>> + * Error severity to name mapping.
>> + */
>> +#define DRM_XE_RAS_ERROR_SEVERITY_NAMES {					\
>> +	[DRM_XE_RAS_ERROR_SEVERITY_CORRECTABLE] = "correctable-errors",		\
>> +	[DRM_XE_RAS_ERROR_SEVERITY_UNCORRECTABLE] = "uncorrectable-errors",	\
>> +}
>> +
>> +/*
>> + * Error class to name mapping.
>> + */
>> +#define DRM_XE_RAS_ERROR_CLASS_NAMES {					\
>> +	[DRM_XE_RAS_ERROR_CLASS_GT] = "GT",				\
>> +	[DRM_XE_RAS_ERROR_CLASS_SOC] = "SoC"				\
>> +}
>> +
>>   #if defined(__cplusplus)
>>   }
>>   #endif
>> -- 
>> 2.47.1
>>

