Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iD/fJrBwnGmcGAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 16:22:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D494178A9E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 16:22:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1452E10E1E5;
	Mon, 23 Feb 2026 15:22:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UEtJwuS8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F76E89AC3;
 Mon, 23 Feb 2026 15:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771860139; x=1803396139;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=j7hbwX6LEqAXtvqlAm+hD0O6qwRI82EQFW3spkx+EmA=;
 b=UEtJwuS8GEXp/NyQ3nA8QmWDv+GBwslSNnYQLtfql7N0N97SPGMM7lWw
 764WMnEO9z19z7dn/RhMdvveA19n5OVgxC7Fl5Avb/bG+1KS6ErPsOPoe
 6oCR7R2g9yNW3zMc3UtZbr5bxNMBgZ3/pw5W1cArH3mvTiL8eoJSct1/p
 sPTtV+V+Y6YkVAJhCGTMdB5ueOzJyuHg0m0nhKsmk+G67LQVFiC+txcVQ
 3oFV6eF60MOySs2TwwS9mt3wH7H5brlj8UP0R6rN5R2eilHzFs1hEXBAI
 ugx4KnNAiUxmYnA283PQN2XGuMyN/Yx3EfZK+lXtvnSTK95ZyUq+i318P g==;
X-CSE-ConnectionGUID: NAv3eTkXQK2+JvTR8mVLdA==
X-CSE-MsgGUID: HZBmVfGEQBOkEplYFbMZLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="76721221"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="76721221"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 07:22:18 -0800
X-CSE-ConnectionGUID: oNciMhW7RTKx1XFkilYtbg==
X-CSE-MsgGUID: 3vtstH5kSWWUbfYQIcXi+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="220141888"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 07:22:18 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 07:22:17 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 07:22:17 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.40) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 07:22:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lb6NTnlMfNHAysLqtCEM+yUUBLBe9Iz1VWdIpgYkWjIVX4e/zfl6gW8FpH3y6zkpZgO2kX0SnTKXwIVTPYgYmsTI/DMfvYmF1uC2dJo/Dj3ruEtfIRUON66IsYj82QqmvQ4bfQ9gfIxXMThinN3cQy7FDGHYvKBPzabOObvgr/VTkVYzTnslvPYcQHX2eKCsGXPfDpytBk9WU0hI7k1i9YSH7Qds8m8CI4rPBvKNlskIsj8eHVafFpLQiFhoZA7p5Gd/lGVfOwjdnPFNhzIbOOVbQWIT+ij0BzAWrlaIEuEiOg3HOkgOipwQgUMZ+/734BBo6dhzQs6gCVQNyi5cZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rmg9PcuXlLmGWCUyq58s9rD/8bIzbIgJyq3fI9TtSeM=;
 b=DYz6bisuWTbAHr8HKyk+BBbAE5rMhEHMPYjk/dOAVID2JnycIXN3JNfWJP6JYcX5Llg+FKhkxfX1fhcMSBiYm1FXQS98JgtkXHo3XuQwy6fE+l8zK7OoiW6xn1ydi+PbjFxt/ZNKsgNtW3P2VyQ3brk0N6k5Wn6i7UP4ligWvRB5NxYZlXJf0c9bOKsPLzAPiHMJ25nh14qEtuWJFryLJdC4ratYOSTXf1EGdJPw2z+BkFMzevdeugmzs1j+6Xkcl9A/5eysQoFcJ8nZvyGZBNQVGlH6lggqltK5Z4z6Alm9AG4MSa/TJCY+2JKLmWtud4epo0VTXEpHqolwNgwlmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by DM4PR11MB8157.namprd11.prod.outlook.com (2603:10b6:8:187::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Mon, 23 Feb
 2026 15:22:01 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 15:22:01 +0000
Date: Mon, 23 Feb 2026 15:21:48 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [RFC v3] drm/i915/selftests: Prevent userspace mapping invalidation
Message-ID: <dnqbdeooikcsklr2xk2uzh6shqddneuah27oobtyohahhfzp4q@23vsrz5343ny>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
X-ClientProxiedBy: WA1P291CA0014.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::22) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|DM4PR11MB8157:EE_
X-MS-Office365-Filtering-Correlation-Id: 85555932-5f9d-4d45-e965-08de72ef49fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NEExN1dnWmZYRVoxQ21aVk1EaFJHQUxyeEVRSEhzc1ZKZTFSdlRPNWEwdzJ1?=
 =?utf-8?B?UGlmUUdLaUt1b0hOcnpBV2FCN1RydUNmWUR2Z1kxQWxmdG9VdkZsUDIyZ1N1?=
 =?utf-8?B?T2VVMDBIcjRPRk92TzYwQ1RCeUtNUThKc1BDWVZCcGxabkczajBVRGlUcVky?=
 =?utf-8?B?Nk9pTTJyVFB1Tk1YdUV4VDdvSjVQN0hsV2huNWNYbjFLQnFpN0U0bndjQW5p?=
 =?utf-8?B?VXpsdXJkcFIvcnI0SHMvL2NHTmRwY3pwalY4QWZTMndDMnVGY29XcGlsSTdj?=
 =?utf-8?B?QUV1M3ZPV1dNZGdRSXpncUQ3bjIyU2tEOVlCWlpnY3ZDM0tobVNwVUZ2a1hi?=
 =?utf-8?B?T2J0eXEyR2JZdUx4SzdUREFXeWlTTUFTWUJCQnJXMnA3eG5TSVE4b1p4cmJX?=
 =?utf-8?B?c3BsSWJCWVkyWjM0NVB2S1lwTXl5Qi9yRGRGV0FIS3NjaFl2UGxmVEkxR2ND?=
 =?utf-8?B?Qk5uRjZFcjN3cXZhN2pwVFdEb2grS0tTcTF0akNwVTRIcGpnSjNIbWMyWFpR?=
 =?utf-8?B?UTVpc01xZHRYTllFek1vNjFMUXNVam1Ea2tkdWRIOWJkSjY0OXVXeDE2RWlI?=
 =?utf-8?B?aDVuREJKcVBYRUdWV2VsYVlOcjFNVTNKZDJoUW1vU29qRGRFc1NnR2l5Y21o?=
 =?utf-8?B?Unh3TFprcDQ5ZVUwaFpvaUl0VUJiYnk5amx6NTlROTZZVXBCNEx6RTd5VTlS?=
 =?utf-8?B?UitZTGxLR1F0cjdsSXptREhsWWtRUlJ5c0Z4NGpQdnc2ZTNxZ2Znc3RROFVh?=
 =?utf-8?B?RWxtcW1yRFdWdTU0Rm9HNGNhVlRkN3hJMWk3QVhBTnVIdXozRVlVYk1zdUhH?=
 =?utf-8?B?UVR3azZTRGI3K2Z2ckJTN0I4dGM4ZTh0ZGl0N0Z4TXlCUFFQcDJRYVFRdGJ6?=
 =?utf-8?B?NGJjd21UUGVTb0Mvc0UwTUJlSjFVTkN3ZzVCNGcvNUpRVFZhYTk4a0FhbkY3?=
 =?utf-8?B?blZZb1ViWGVTb2kyM3A5d21mNElpUFltc3lvS3FBNFVidEpjL0RHT0NMeDAv?=
 =?utf-8?B?Sm1qcTFNeklJa01zaWZHZFNhcHFLdm03Qis3Q1EwKzF5ekF3UnBwK0VFcmQ4?=
 =?utf-8?B?ZkJJWUVzMWhpTDhRM0ovOUFGV1BLYVFmcERoMlhtK2hLM0Vsb0Yxckpudmw0?=
 =?utf-8?B?MWVpYXZQc2pLZUgzNldnYlp1WFczOUVyZnNOTy8zQWF3UUlNaklzaks4dS93?=
 =?utf-8?B?eXlsc3ZsYXJ0dUdVZ29zWThxdUpZcjYxa0xyL2dWZ202RWVlL3VaQ3FvTzRX?=
 =?utf-8?B?VHVJMm1wSXJZUkFsakpKSXl4UUZMcEZRZU9ZcldRMllOczE0bzE4Z1dIdThi?=
 =?utf-8?B?eXpuOU85dE0zK1BFQ1c1NWtBRFFTNFV2azNPK295YzhVSEVTNkxnVG03U3JC?=
 =?utf-8?B?ZDJBbXFKYjVZWkZSaDQ1YURRRi8xZUZuYmlXblU3dmMyaldISDNSTDNORkxw?=
 =?utf-8?B?SUVBSW5EUVRSR0VERkEwVEpNZXhqdUtjd0xRTUV2UmI5aFVmWTBJYUlpR1Bm?=
 =?utf-8?B?dDgzVHhpQUV2cEVnUldRZUhDMzZDUzg5MVF2Sk1xV2dsZU9VcG9uQ0oxdzVo?=
 =?utf-8?B?c2hSZ2I3UUU0VmdLd04yQnRUWG1lbnF3UXZEL01IRXZCOGdDaExOWWl1aFZQ?=
 =?utf-8?B?NDNnenRxbVpzSitkRGQzVU5hTEt4cmk3SUd0dkJKRW1yOHE0ZW9OQkZnOU12?=
 =?utf-8?B?anp3RkJZTW1tMTVML3FTYUlyQ1BtbktwMWVHVjhVM2s1VTNzOWhzRFZBdnJy?=
 =?utf-8?B?ZSt6cVV4Y2p5ZHY4UEg0QmppS290R29RNWFlRnpHVW1EU2VWS1JCUkNybkp4?=
 =?utf-8?B?Y3IzbzRTVGVLVFlBenczd3J6RGJEYVlkY1BnSFAwWEFLTUR1RkV3S1ZIaFpH?=
 =?utf-8?B?NkZJaFdqRGFHQ1M5blNpcEd1bUFlUCtGV1JNc1g0NW1EUEMvaGtWcjBaMzZk?=
 =?utf-8?B?WnJ3TlJ3MlMzWTJxQnF4UUpHQXFORlRkTjVEUXVXNDAxSlEzTm9MOXhLdVpB?=
 =?utf-8?B?NEZVa0pCbHlNRGxtNE5UeE0rdVpKYWRzd2FWbFBVK2hxMzlzWkFvU3RsSWxr?=
 =?utf-8?Q?ry6y0X?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUhqYkJaTytlRFdwWjZXR3BadndxT2MzczFyTGVhSGJUbXdKV1F0ZFZST0dt?=
 =?utf-8?B?a2RpTVZpK2x2YUI3a0QyNklJY0dYR3pnMmRDMWYwczZVOEJLK0hNZkRtK0FX?=
 =?utf-8?B?MmFsbUV2aDUvSmpwSWt5ZGJRT2xmbE96S0tud083VElGeFdLZStkcUQvZ1Ny?=
 =?utf-8?B?T214ZmduTnBaRFVGVnprRWJ4VC9Ta3g0SzhXTCt5a3VUVDdDclErNXlSQWVl?=
 =?utf-8?B?U3VqL1ZoUFBxa2tOMzB5OXZQcWx4K29lYWc3RFpGK0w4a0JvRU1LcWt3a3ov?=
 =?utf-8?B?THlMTFpSWTFSWENtM1Z6bjJVd3ErK3JNSitnWjJ0dURlS2ppVDZ3OENaMjhN?=
 =?utf-8?B?ai9mTEJDS2VuMEZlU2Z0SVVXdld3M3plWEUzTXkzNG1UbXJxZlNkRWtNcnBM?=
 =?utf-8?B?Z2h3aCtMckcyT0lpbzl6ZTlIWTIxczg4NUQzOTB4UVNoVS82Vy92VFNSSElY?=
 =?utf-8?B?azJqZTBPUVR0Vmw3U0FUc2llY2lSUWRjZjZnejRpOEZDZHdsM3QySkF6UnV3?=
 =?utf-8?B?M1ZvR3FDeThYeTkwZm55bGhSSUhGcy9CQTlZRVdENzBDQzZKcXYvQTRKZmVj?=
 =?utf-8?B?cFJSWXB5T1pjQUVTZmFzaTdTOW8yYjUzVjZFZHZrOWx5aG9LZ0V6RUJTL29S?=
 =?utf-8?B?eXB6aWU2aUJlWHlMdUVVYXUwUk1rSmNNOUhiL1pIeENQRDZuNWk4aGcxdFd1?=
 =?utf-8?B?cmJadWhMdUYvRWZtNDdzc25iRVpKbTkyUUovbHlQNXQ0dFRXWndQKzg3UDgv?=
 =?utf-8?B?dkVFT2VhWDNST3REeXI3eVRZK1VqbFNoVjQwWUdMb3Rsc1g5bjAwR1EzU0hF?=
 =?utf-8?B?SEd3YVhFSmZONGVtbEtvc2I3Sy9XazBPa1J3NXA3eHZXZ3dydURhT1VSTDNO?=
 =?utf-8?B?QU5iQzdPV25GRkVuelZsK2xPWHB4N0dWT25jKzgyVFBqQndWL1JRWnJWTG83?=
 =?utf-8?B?TTZ2R2N0RGFSRytoRkxpZGF0Ymx1L2lDdnBlOXpLZnh6Kzl1cjFPays2WEdx?=
 =?utf-8?B?NVl3WXpnYWFCNHpxN3BDTzBzMm1CR3FsM3JLZEk2em1zTTFWRTQ1bHExajNQ?=
 =?utf-8?B?anM3ZU05NlNpQ1FETWoveUgyZWptc1g2dVBYVXNleGlmeUZLNzJuRWpxVXZw?=
 =?utf-8?B?ZFJJcitUZmozVXlWNmxORllRUzBQMUpxb09VZVVqQzdQc3hSZVRjUUZIKzlo?=
 =?utf-8?B?dWQyMmNnNjNrVnFUVit2ZFg5TEM5d3h0Wjg5cWFDWGNPZXZPM2NnWUQvQ0RQ?=
 =?utf-8?B?S01iNmkrUUNaZmk4OHFDWk4zOHdxK01idENWcEJuT3dLcWpnZ1c3WnpScDNv?=
 =?utf-8?B?UWpHcFFZRFcrOElGZlB5emlYK0Z0ODhxdVcrczFORXBxaERhS3FLTlpidWE2?=
 =?utf-8?B?bHVmR0E3UHgwblpFM0cwYmNldXdrdUk4NU80aWdqeFBKbEwwRm9YL1I2RDdz?=
 =?utf-8?B?UVE5OEJZRGlxOHFQREZpdWVEN3BWZ0dhUmwzamNNSWZabWljbDI1LzVFaHZZ?=
 =?utf-8?B?cFZmK0ttaWhSVEMrSlpiU0Q0TEx4c24wL0c5MmpNRzBCc29lMFRUbTJCWlhB?=
 =?utf-8?B?Z0tjaDBFMW5hUjliODlRRWJkeisvdWlRaWpsWlZwRDBrSW53UWJ1VVdGcUlm?=
 =?utf-8?B?WFdtZTZPR2JRR2RiSDRETTZreDh2UEUzdmdhNk1aYWZWUFkxMC9aR3BRb2gx?=
 =?utf-8?B?OFZQak1FZzJsMW05dGRRRGhiUnR6OXk4WUZadE85cFVtWHM0MkxOR2ErQWJS?=
 =?utf-8?B?MlM5YkZJQ1dYbzRaUTdLbThiWVRVcndScVVDZTREWUVVeTBXUi9ESlBPMDZq?=
 =?utf-8?B?M0p2eDJoVll0b1lEdm84WVhUcjArQXp3ZWVWWU94eUhoSktYQVRPSWZmN3NX?=
 =?utf-8?B?dVR0ZFFWaGs0czluUFBRRzdEUXdiL3M0SzYxekszMjdyOVFOSkpVaUVLUzQr?=
 =?utf-8?B?Tm5MOXJ3d3VGU3hKSWhMV2Qzck5sdC9yalFGUkRJOFd5VDMwNWo1ZVp3Y1lQ?=
 =?utf-8?B?My94MUt4cmF6bWpkVkFyTmFsdGNQbXRpUnFESG1HQ1A2OTkvRXk1ZjV0Mm5q?=
 =?utf-8?B?OGR3UC94czNncFNwcStFOU9iWnE4Nk5Xclo1Y2VYR0t0ZU9lYktSVzM4Tzk0?=
 =?utf-8?B?azdzM3JNYzhvYzhUdG40blRXWno4OEtmUm53bVp5WGdqenp0TVZTZFA5RVQ5?=
 =?utf-8?B?OTNGQVRtL3ZTdDFTS0lnQktFY3NOTHRia2tRSjJTSnlEWFFJeDFmZUk0ZmN1?=
 =?utf-8?B?dUVKRm5MWWxEYlRUaGZLSTZvTzh0UzR4elR0UjlNNC9zd0NpOHpFUjJJU1F5?=
 =?utf-8?B?S0twRktINStZWkFqRDI3b1BIT082L0szZFZsZkU2MHQ3R2x5UFZ4dmxOV1Rs?=
 =?utf-8?Q?FbQUL9Eyeg/2GoXg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85555932-5f9d-4d45-e965-08de72ef49fe
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 15:22:00.9209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gWHxXJN14IRDkY8xBhzOy+AOoftqsPjNJWe/x8kIOaNV10Ts0OmO0TPy/ScgJ08uT6pgpY0JIJTKW8/RU58lUoRtd8p1VvwmxImoM0gPPtY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8157
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
X-Spamd-Result: default: False [0.19 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,intel.com:email,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.karas@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 4D494178A9E
X-Rspamd-Action: no action

Migration testing in i915 uses current task's address space to
allocate new userspace mapping, without registering real user
for that address space in mm_struct. Since PCI probe executes in
another process, "current" is unknown at the time the selftest
run [1].

It was observed that mm->mm_users would occasionally be 0
or drop to 0 during the test, which reaped userspace mappings,
further leading to failures upon reading from userland memory.

Prevent this by waiting for usable address space and
artificially increasing its mm_users counter for the duration
of the test.

[1]:
IGT makes use of selftest on module load mechanism in i915:
 1) IGT recognizes arguments and passes them to libkmod while in
  userspace;
 2) libkmod forms and executes a syscall simulating a
  modprobe command, thus moving to kernel context;
 3) PCI code puts local_pci_probe() call onto a workqueue via
  work_on_cpu() macro in pci_call_probe(). Below backtrace shows
  call order between syscall and work_on_cpu() call:

Call Trace:
 <TASK>
 dump_stack_lvl+0xc1/0xf0
 dump_stack+0x10/0x20
 pci_device_probe+0x205/0x280
 really_probe+0xf1/0x410
 __driver_probe_device+0x8c/0x190
 driver_probe_device+0x24/0xd0
 __driver_attach+0x10f/0x240
 ? __pfx___driver_attach+0x10/0x10
 bus_for_each_dev+0x7f/0xe0
 driver_attach+0x1e/0x30
 bus_add_driver+0x163/0x2a0
 driver_register+0x5e/0x130
 __pci_register_driver+0x80/0xa0
 i915_pci_register_driver+0x23/0x30 [i915]
 i915_init+0x37/0x120 [i915]
 ? __pfx_i915_init+0x10/0x10 [i915]
 do_one_initcall+0x5e/0x3a0
 do_init_module+0x97/0x2b0
 load_module+0x2d89/0x2e90
 ? kernel_read_file+0x2b1/0x320
 init_module_from_file+0xf4/0x120
 ? init_module_from_file+0xf4/0x120
 idempotent_init_module+0x117/0x330
 __x64_sys_finit_module+0x73/0xf0
 x64_sys_call+0x1d68/0x26b0
 do_syscall_64+0x93/0x1470
 ? do_syscall_64+0x1e4/0x1470
 ? ksys_lseek+0x4f/0xd0
 ? do_syscall_64+0x1e4/0x1470
 ? clear_bhb_loop+0x50/0xa0
 ? clear_bhb_loop+0x50/0xa0
 entry_SYSCALL_64_after_hwframe+0x76/0x7e

note that pci_device_probe() calls __pci_device_probe(), which
then calls pci_call_probe() and both are static functions;
 4) at last, the actual probe is called from kworker and the
 selftests execute:
Call Trace:
 <TASK>
 dump_stack_lvl+0xc1/0xf0
 dump_stack+0x10/0x20
 igt_mmap_migrate+0x302/0x7e0 [i915]
 __i915_subtests+0xb8/0x250 [i915]
 ? __pfx___i915_live_teardown+0x10/0x10 [i915]
 ? __pfx___i915_live_setup+0x10/0x10 [i915]
 i915_gem_mman_live_selftests+0x103/0x140 [i915]
 __run_selftests+0xc5/0x220 [i915]
 i915_live_selftests+0xaa/0x130 [i915]
 i915_pci_probe+0xee/0x1d0 [i915]
 local_pci_probe+0x47/0xb0
 work_for_cpu_fn+0x1a/0x30
 process_one_work+0x22e/0x6b0
 worker_thread+0x1e8/0x3d0
 ? __pfx_worker_thread+0x10/0x10
 kthread+0x11f/0x250
 ? __pfx_kthread+0x10/0x10
 ret_from_fork+0x344/0x3a0
 ? __pfx_kthread+0x10/0x10
 ret_from_fork_asm+0x1a/0x30

This operation of putting selftests into a forked process
creates a short delay in which another userspace process may be
handled by the scheduler, so IGT process is not the one from
which kernel borrows the address space.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204
Fixes: 34b1c1c71d37 ("i915/selftest/igt_mmap: let mmap tests run in kthread")
Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
This has previously been a regular patch, but after many
deliberations and discussions with i915 team members we decided
that this should be made into a RFC, as this may still be an
incomplete solution.

This change is best effort to increase reliability of the
selftest. There will still be instances, where there is no
suitable address space available, because we rely on operating
system to be in a certain state, which we probably should not
force by ourselves. In this case, it would be sufficient to have
this test pass most of the time and silently skip if it cannot
execute safely.

 .../drm/i915/gem/selftests/i915_gem_mman.c    | 44 ++++++++++++++++---
 1 file changed, 39 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
index 9d454d0b46f2..ccb00cd5e750 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -38,6 +38,8 @@ struct tile {
 	unsigned int swizzle;
 };
 
+bool skip_vma = true;
+
 static u64 swizzle_bit(unsigned int bit, u64 offset)
 {
 	return (offset & BIT_ULL(bit)) >> (bit - 6);
@@ -903,6 +905,9 @@ static int __igt_mmap(struct drm_i915_private *i915,
 	int err, i;
 	u64 offset;
 
+	if (skip_vma)
+		return 0;
+
 	if (!can_mmap(obj, type))
 		return 0;
 
@@ -1165,6 +1170,9 @@ static int __igt_mmap_migrate(struct intel_memory_region **placements,
 	u64 offset;
 	int err;
 
+	if (skip_vma)
+		return 0;
+
 	obj = __i915_gem_object_create_user(i915, PAGE_SIZE,
 					    placements,
 					    n_placements);
@@ -1847,7 +1855,6 @@ static int igt_mmap_revoke(void *arg)
 int i915_gem_mman_live_selftests(struct drm_i915_private *i915)
 {
 	int ret;
-	bool unuse_mm = false;
 	static const struct i915_subtest tests[] = {
 		SUBTEST(igt_partial_tiling),
 		SUBTEST(igt_smoke_tiling),
@@ -1860,14 +1867,41 @@ int i915_gem_mman_live_selftests(struct drm_i915_private *i915)
 	};
 
 	if (!current->mm) {
-		kthread_use_mm(current->active_mm);
-		unuse_mm = true;
+		int timeout = 10;
+		/**
+		 * We want to use current->active_mm, which corresponds to the
+		 * address space of a userspace process that was last handled by
+		 * scheduler. It is possible that this memory is in the middle
+		 * of cleanup indicated by mm_users == 0, in which case kernel
+		 * waits until the process is finished to release its mm_struct.
+		 * Borrowing that memory at that point is unsafe, because it may
+		 * be freed at any point and taking additional references to it
+		 * will not change the cleanup behavior.
+		 * Wait for a bit in hopes that another process is taken by
+		 * scheduler and has reliable memory for us to map into.
+		 */
+		while (timeout--) {
+			if (mmget_not_zero(current->active_mm)) {
+				kthread_use_mm(current->active_mm);
+				skip_vma = false;
+				break;
+			}
+
+			msleep(1000);
+		}
 	}
 
 	ret = i915_live_subtests(tests, i915);
 
-	if (unuse_mm)
-		kthread_unuse_mm(current->active_mm);
+	if (!skip_vma) {
+		/**
+		 * The scheduler was working while the test executed,
+		 * so current->active_mm might have changed. Use the old
+		 * reference to the address space stored in current->mm.
+		 */
+		mmput_async(current->mm);
+		kthread_unuse_mm(current->mm);
+	}
 
 	return ret;
 }
-- 
2.34.1


-- 
Best Regards,
Krzysztof
