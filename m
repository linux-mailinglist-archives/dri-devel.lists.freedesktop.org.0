Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9158B0D30
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 16:52:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5515C113BEB;
	Wed, 24 Apr 2024 14:52:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jnp6/Eqk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8D64113BEB;
 Wed, 24 Apr 2024 14:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713970325; x=1745506325;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wclyYNtwqSaEP8zDsZ3gDeEV1EO39Cy054Eh+hElDvs=;
 b=Jnp6/EqkUT1/gn2Y+GvYoLZbqy6siCEmpZbwQDIHtXK2wUR2OJXRaR1D
 oHd1zV8pM3t3qTaRat9qRcjE8pw0t+lzI/CXwTG0PpdrBvHigN7XbWSPj
 O4Yt0PGrqD5PHeGHxWLb56r+v43Q9+tOgl/E0BAO9EDEgrHbMQA9h6z60
 1zgtg50ZFoLEQMUIxgvGoVUAM4L/m61HLb9VkANq6M0FWmfFbKvXi+wfU
 TDRFs2K4mP8D/VaySI0iCspUt18RaEBQ/H7SZVVwLUigPyu0i6RQo5fR7
 a4HlJaO5GOrwlKQ+0BOkJv360TCJrn+90QJZNis7sr18W60XJ1fbkducC w==;
X-CSE-ConnectionGUID: fDWPHH0oQOa/J3eeu4NKRw==
X-CSE-MsgGUID: Bjxd7CmQRImH+T+dZyg1cQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9456773"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="9456773"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 07:52:04 -0700
X-CSE-ConnectionGUID: BbBsHomyS22uAqvBFgw6mg==
X-CSE-MsgGUID: QyqtPD8GQm+wTpSmiWDh0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="29199552"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Apr 2024 07:52:04 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 07:52:04 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Apr 2024 07:52:04 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Apr 2024 07:52:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tyz78a4wlmiYRrrlbQWgWmvxOQyVuFthBWrXoJ0dMibVp8BfdQMyqGwJAj5wvVLhmMHrklaWyWfqzN6fkZ4tY34otACslx65PCQibf/dWCteZCIiXN0vG8PQ9DG9HSAC8nZnyfW05TBsYyfz0GHMziA20S+beokAP/dYMaLd/ECkbMRWaTa0je9npzJg2/cazy/9O6PdR9FRl6SFHtpHSm/pKguu1aCLGI9ykgwV56DLQh1qd4eXIRYz9SqjHv1cERX6GRS5VNFNTyZaTtpRiOtoVKB7QITaHUBMzDLYiJpZVgp/RhMP7jJQ+r7kPet9+LA0t0TGitKg0EGQwj1DrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pPkj/Uyo833CZp9j706GtnoTQRKAiGRnMPjSz4orpA0=;
 b=Jif/KHBBLWHjf8tbKI4LJP4Kj1FYG4wulL6IegLiMnJc0ZMwStZPE6CFOjsW4F4Lbpnfp0FfgPZE7LQhk+xOnw7ntHIX7UKyfDqJ5kuRYys5eTKll+4tT4W/tFwuLvp36n9LOOeWxGNjqE1xd2Vke/aFJBIm3ww7S0m3lc1sebMxHHLNoA1par0et+5R9Ti7NXJgybln+6rpLvOAwVOhIJUKics8751HRhNw4yfdxQvFA9hfWKGD9RR1DWh8L/UXCdhyg/LNm/MOm/Q/Ahyu+wdqwj6ttNVcQfGXkituv9Vx52T078Nql6gw7FxvwsEL0dyKeYSsuT2Q2oD8esSjDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7882.namprd11.prod.outlook.com (2603:10b6:208:40f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Wed, 24 Apr
 2024 14:52:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7519.020; Wed, 24 Apr 2024
 14:52:01 +0000
Date: Wed, 24 Apr 2024 09:51:58 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>
Subject: Re: [PATCH v2 3/6] drm/xe: Add helper to accumulate exec queue runtime
Message-ID: <ji47qyldawgmoj4fmdmzaitupigutgqxgzcadfmx3owems4bsy@lwsoy6p5o5jx>
References: <20240423235652.1959945-1-lucas.demarchi@intel.com>
 <20240423235652.1959945-4-lucas.demarchi@intel.com>
 <ZiiFvZYWhpdi8ZKL@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZiiFvZYWhpdi8ZKL@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0P220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7882:EE_
X-MS-Office365-Filtering-Correlation-Id: e3acb501-a940-47f1-6386-08dc646e1949
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MMTfWLfqCrC7x8DXEKAwtVbDbmhnZaR8+at1thMRupBRpn/3Sn6WG0rDd9RX?=
 =?us-ascii?Q?Ctn5uav4WndY60SPUXZp3pRlBlW6T2huDO5uf23vUCz7yBgVoca7I1vKoPDM?=
 =?us-ascii?Q?TiF2mClwk2+MGz9pVkUUZ8ptTL4O3pocPpmMyne9/6gaAooNQbAGwocpll4k?=
 =?us-ascii?Q?S/qemgvW5vp6FSYqVk+HevxwoZ6dMj9gCYXHA272q5JkZdG36tjVrzgF+U6W?=
 =?us-ascii?Q?f+O1+6kkLVy7EXV4SfTmpPydeayNqGZVixRNgVCTwoF5yqpQKLFtQZfHuyba?=
 =?us-ascii?Q?QLtQVEguu63F3JlQ4UpXXbqGN/ehpSpBWUr33E3Z1uoq6gaTbR1IpdADS7P+?=
 =?us-ascii?Q?JAvJFHhLkwghpyu5xGAXtTSF4I92L2f9yAiMXkW7nqWkClVF3ddY659Iw9Cb?=
 =?us-ascii?Q?ibGDDhCA1tMIbL7PJrOyNoNDfr1VPidni5JARpsPBPEdgp/FmyPsKeY8KxfW?=
 =?us-ascii?Q?ZYmNPCzqQIL8WdaBqJPxDwDDe7ywNxbr2z3lRrbtyAidN7x6YnVtGADlRDr1?=
 =?us-ascii?Q?QDfbt8Kymbbf0rtQ24HYneGPnXvB3/w/A1MuFDZUOecFacv95BAdf0ohfG0c?=
 =?us-ascii?Q?X3Cp6f+q5M4VAtmFC3ktLM4gmWEKNMARQuReFk1eveETq9xty2jzyg6dexfK?=
 =?us-ascii?Q?cLcA3Sr9Lfwgw1C55jtlv8p4kX77ve5IFcjpaDej1ms4uoPJviAoTYgmcT+E?=
 =?us-ascii?Q?mWaSqhkeNLeFqQ6b6PYLskOQweoVxR8u4rU0fN1Kvs13QbxEnRu6EQicnvk3?=
 =?us-ascii?Q?hxGeYlCmvVwsTeP4Yw1YpZI67N6KkLvn0VmB9XeIp3Zg8rrebjgPKd+1ptsS?=
 =?us-ascii?Q?o1VkrmhWwrgw9CXhVJyS/f8zXPMdHTid/yb+iWXU88qeB0rR9EblBG69XvHL?=
 =?us-ascii?Q?4qU1QpT0iflllVLthmQpwNFWQ4MKGDKubKKAUGEIX3JWgLs1G/QYIGq/QdtT?=
 =?us-ascii?Q?i6ARYTM+7WbcUu4JIzjoItK8/o1XDGbUQesUPXLn2iAd6BebUdt+1zOmh1I8?=
 =?us-ascii?Q?MaTb9XKY+OckCBMmnJkHHA31MC0XmoKDnEZIB5y4NBICXkhTpifNIOAFDCx3?=
 =?us-ascii?Q?A0Q01dsY5C+bXavd6lagTTSXbZvhZxWu3jF05b5XCzAXD5mD8a193DnGJ0LA?=
 =?us-ascii?Q?dgQe+TqRRlsO07oW5nt89SFcZIC8NI9wvctMxwNB9GOBAuCPewzJ3h6gg0ND?=
 =?us-ascii?Q?owNbA1x+ts04GeRguzINfaPgAKEcFHy4Lhs6qVc73WezsapU9Oi4dV2wU+Jy?=
 =?us-ascii?Q?X0WEW4xDaq9pZpmsPLfXc39N4f956NI2rKI87Agsmw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sggi/5CaNKHqLkiWE8WhMiIV9t0DIl5jVUPt9hSBbe0ZgU1ASC1KEBd4zEZV?=
 =?us-ascii?Q?uHSQTmJHwufySrmiEyAUvu190DaeKJM7zE9Ex5PFNlsEMCyHgfas5Vl+KcLd?=
 =?us-ascii?Q?lLGAKG8LeYsSRQsRoQoi4C+hgXBw4mzqjrVqj8yBXsZvbtSjCb3axdWsKhjI?=
 =?us-ascii?Q?g5O9Hdci9hpJf62hkA1Ixgn5S8YRcayNNUl1+Rl5jyf0a1/vgg2NXaQ9Wsv0?=
 =?us-ascii?Q?VDG7J1coiEknePj+Vy0CwW9dd+3fSTfXPW8oQd5sBBrdFJ4O8R+sY2r1Pqsg?=
 =?us-ascii?Q?KDSonj4ijo1Ria2A0yC/oTUt1rj8jCjXc/1JWow6wqKJs/y7lPgtPzO0Yfuq?=
 =?us-ascii?Q?KLECVkTF8WzcwQjppWHZmaTgu95mBxoUPAAE+TZjVe5wtZ4ZTFZiMkpmGuOQ?=
 =?us-ascii?Q?lGqSKbFD5LCQNFjTf31sB7/BsPlhaTVt7nYeO1qADJHp6l/xfPYsaxh4CWKb?=
 =?us-ascii?Q?pfSnh3mSBaHPjQQCRj77nbnDQsUMb+Z4WsXs90O1ebxCSZIpTp/vwtkXQz3D?=
 =?us-ascii?Q?30QL41wohS/RXpQDhHPDqTq+u0lk6hhAoi1fTXZjgABbQK3MZg3Tmo325H2T?=
 =?us-ascii?Q?ZuiLnVUv/coEzPKsaPc3c6ADIuMm2kGpG8fT5XtsIirVDtE9/rPAA9uWdWEu?=
 =?us-ascii?Q?z86GDxLUxA9H5oLQvH4OzoJAW7dTxxR0jRsYw+Vk2cINxQDazMlqVf9g8Z9T?=
 =?us-ascii?Q?1g3NIMFuiECABBQu2L+wHEzVcR3FNggi3IbMo62BBGDZ70jDZMro0xR9ywEq?=
 =?us-ascii?Q?ZYXsBPyuFfObTEj7B9LYhTkMVRtILZTLS/HdXNK64Ziklpiyj4mjE6it+/sv?=
 =?us-ascii?Q?/BdUB5alHu1YGc7JHYiURv1+4SYkg1MOfeDdGATgrstUarGR0ciEsejSHV9i?=
 =?us-ascii?Q?jan6rYFeqUI0tlTThNEfdrN3lKMdBe6aB5UdP9B7gpnVgeemCpsUfPJQXGPx?=
 =?us-ascii?Q?PfYydLKpE5zjL/wXY58kobS8ckOatR++bGGr+CAWT9IE2S/fJ8rBtGoBD2qd?=
 =?us-ascii?Q?xHwgiDxg3LGR47LFjg94e5T/BfuSuvU6wvDqYX1KjBsjbJNBkHHLZ7f1UHdD?=
 =?us-ascii?Q?oZRDFgY7vDRXSf+w6zA2/wXncnbHblpGEDNzf5ToBKCAW+lRFUVlCuEEfhsu?=
 =?us-ascii?Q?7HbHOtrT5+541eAkU36V4jaueEw3vSWWNiZwPq8u5k18yIGle2YKIG1tYhPG?=
 =?us-ascii?Q?AYdeR0Z8nKFCgYsjk/rQlpDSwd4MHNZlsJCHYqgNMErYJ77FZY3nWU7W7L88?=
 =?us-ascii?Q?AWYJS7B0HiXkYzGaoEpWAHC7mV3149hf2HUkp+Kt5chv47DMvV/84xqwPkA5?=
 =?us-ascii?Q?pu2WMQYAt2o29okPAvgms86QDnwm9wRir2sAwHHESekEjaJqHi/Ub/h2hDNU?=
 =?us-ascii?Q?dBuVTdugc035u/rlCtkgY0tkNwGfMziX3UajIM3hQV1qlNO+Yvb+P5U0hX8Q?=
 =?us-ascii?Q?pRew00ofSNg+uZgmAagRcXMmCgx9+OcPgA9G7qBnRGUTG4CJhtSBl1uqdjne?=
 =?us-ascii?Q?unly6NcJVhA79GTbPAAtUw7W2MagjPGk5nMyfdGtNgHXNTu2LWv9UfiDoZW5?=
 =?us-ascii?Q?Z+v1lyUMaE+c76jX5zUTO3khKLJn5tL4WduUbSs+QVPWAY4XILoEWAx1Cc9j?=
 =?us-ascii?Q?pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3acb501-a940-47f1-6386-08dc646e1949
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 14:52:01.6067 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fJX/sqbBBM+E3pke5hGHIFEI8ygLp6xk/VlHIh0fnTA6lsfDh5q23krHEd8yzvYye+kn6lMkFjTteHT6I5vcP4Z9MMgWaJflkSIWqHCvMPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7882
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

On Wed, Apr 24, 2024 at 04:08:29AM GMT, Matthew Brost wrote:
>On Tue, Apr 23, 2024 at 04:56:48PM -0700, Lucas De Marchi wrote:
>> From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>
>> Add a helper to accumulate per-client runtime of all its
>> exec queues. Currently that is done in 2 places:
>>
>> 	1. when the exec_queue is destroyed
>> 	2. when the sched job is completed
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device_types.h |  9 +++++++
>>  drivers/gpu/drm/xe/xe_exec_queue.c   | 37 ++++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_exec_queue.h   |  1 +
>>  drivers/gpu/drm/xe/xe_sched_job.c    |  2 ++
>>  4 files changed, 49 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 2e62450d86e1..33d3bf93a2f1 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -547,6 +547,15 @@ struct xe_file {
>>  		struct mutex lock;
>>  	} exec_queue;
>>
>> +	/**
>> +	 * @runtime: hw engine class runtime in ticks for this drm client
>> +	 *
>> +	 * Only stats from xe_exec_queue->lrc[0] are accumulated. For multi-lrc
>> +	 * case, since all jobs run in parallel on the engines, only the stats
>> +	 * from lrc[0] are sufficient.
>> +	 */
>> +	u64 runtime[XE_ENGINE_CLASS_MAX];
>> +
>>  	/** @client: drm client */
>>  	struct xe_drm_client *client;
>>  };
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 395de93579fa..b7b6256cb96a 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -214,6 +214,8 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
>>  {
>>  	int i;
>>
>> +	xe_exec_queue_update_runtime(q);
>> +
>>  	for (i = 0; i < q->width; ++i)
>>  		xe_lrc_finish(q->lrc + i);
>>  	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
>> @@ -769,6 +771,41 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
>>  		q->lrc[0].fence_ctx.next_seqno - 1;
>>  }
>>
>> +/**
>> + * xe_exec_queue_update_runtime() - Update runtime for this exec queue from hw
>> + * @q: The exec queue
>> + *
>> + * Update the timestamp saved by HW for this exec queue and save runtime
>> + * calculated by using the delta from last update. On multi-lrc case, only the
>> + * first is considered.
>> + */
>> +void xe_exec_queue_update_runtime(struct xe_exec_queue *q)
>> +{
>> +	struct xe_file *xef;
>> +	struct xe_lrc *lrc;
>> +	u32 old_ts, new_ts;
>> +
>> +	/*
>> +	 * Jobs that are run during driver load may use an exec_queue, but are
>> +	 * not associated with a user xe file, so avoid accumulating busyness
>> +	 * for kernel specific work.
>> +	 */
>> +	if (!q->vm || !q->vm->xef)
>> +		return;
>> +
>> +	xef = q->vm->xef;
>> +	lrc = &q->lrc[0];
>> +
>> +	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
>> +
>> +	/*
>> +	 * Special case the very first timestamp: we don't want the
>> +	 * initial delta to be a huge value
>> +	 */
>> +	if (old_ts)
>> +		xef->runtime[q->class] += new_ts - old_ts;
>> +}
>> +
>>  void xe_exec_queue_kill(struct xe_exec_queue *q)
>>  {
>>  	struct xe_exec_queue *eq = q, *next;
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
>> index 02ce8d204622..45b72daa2db3 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
>> @@ -66,5 +66,6 @@ struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *e,
>>  					       struct xe_vm *vm);
>>  void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct xe_vm *vm,
>>  				  struct dma_fence *fence);
>> +void xe_exec_queue_update_runtime(struct xe_exec_queue *q);
>>
>>  #endif
>> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
>> index cd8a2fba5438..6a081a4fa190 100644
>> --- a/drivers/gpu/drm/xe/xe_sched_job.c
>> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
>> @@ -242,6 +242,8 @@ bool xe_sched_job_completed(struct xe_sched_job *job)
>>  {
>
>This seems like the wrong place. xe_sched_job_completed is a helper
>which determines *if* a job completed it *not* when it is completed. The

indeed, not the right place.


>DRM scheduler free_job callback is probably the right place
>(guc_exec_queue_free_job or execlist_job_free). So just call
>xe_exec_queue_update_runtime there?

yeah, I will add it there and do some tests.

thanks for catching this.

Lucas De Marchi

>
>Matt
>
>>  	struct xe_lrc *lrc = job->q->lrc;
>>
>> +	xe_exec_queue_update_runtime(job->q);
>> +
>>  	/*
>>  	 * Can safely check just LRC[0] seqno as that is last seqno written when
>>  	 * parallel handshake is done.
>> --
>> 2.43.0
>>
