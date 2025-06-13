Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CD7AD8F98
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 16:32:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B142010E002;
	Fri, 13 Jun 2025 14:32:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QJx/vffG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0925A10E030
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 14:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749825137; x=1781361137;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=QzG8Sm0278GvaaY/fVr+0eHzSq7XQ+vKlTFTOxpW+PY=;
 b=QJx/vffG9qPiD9XbNSTU5+en0xHXTsO7ngDcV3ukXKE4nPqLukkxbYka
 hmz/dWmI6enaolQREdhjN6XFH5awT/33xSXtDBy0g9+7CsKEGiqAcPt1r
 dzKY6ts1yDJz+S31iFo83NPhN8sUnxk2N7PrgKasNDNES7pNObFpzPlSP
 vMSGSX3bgeTFGRn2tKppNWqeGABQp3tjXLdmUMtaWU7wL/5vnSJLARTBj
 2C9VbVU6lPe+9cossB74xUhe7hXs3oUCNUooUMc5gLeukIF7ZG/zzTcUa
 rBv9EHPaLRvboc2BknqcSmed8ydrFqa3O2G5Y+AEIGGSzdzizo09wjWrB g==;
X-CSE-ConnectionGUID: qHRGozFjScGahjCXD5E2WQ==
X-CSE-MsgGUID: HJWX6wqzQ76+0W7OziMDgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="52136913"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="52136913"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 07:32:17 -0700
X-CSE-ConnectionGUID: yW5CwRp7RIuzfI0NrK/U3A==
X-CSE-MsgGUID: QxVfKVxlTe2SkyV9yY1cnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="153130840"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 07:32:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 07:32:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 13 Jun 2025 07:32:15 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.80)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 07:32:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UWqKIYeA690upfNhk8Tq8aWzy1oFgmDdyTksTJ57eDuwyAW4RjIq4lHGOV5U35OIUdJ9H3CQkhgMBtonXrRcaRBP2+r56R278lWnNOrggyPh38TSSUVgWFjJ6gNVldyF+LOfbc7WxpKjj0gtZq1F6PReKVtzfORoWbC2uXmXccIoc5oARqEBuCCv37un1+dWDGzqwIfwvA+Y7a0dBKD11BdZyjWWs8fOfzFtdfFMsBP/JhMGrdplAys2JWFZK8Q32z+4+cyvDROcw90CekUwYRb3g0lUBfCG5JEMmdvP8BIu9f6hVKhzkzR+67oL/2gQ/WoZph/BwuTRnRw1gp5twQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QzG8Sm0278GvaaY/fVr+0eHzSq7XQ+vKlTFTOxpW+PY=;
 b=pO7UXX+76nRKwnc+XktZl7e4Sf+Ef1s1VxC8P2CG83L+iksib1xgNrtWCMYsL1aVYfLBQxnKB2XNxDpTJcujY0Uq4P1V5ecOMNVbFzwbtEkbHAC2jvwwf6MBpWh9vll8qVrz1sJ2UJQswSh74TayYheiKC2Em8GbDu2O9ZVPrI3s1ZeM54ISDuabT8JZOZaxkTQ2z8zzru4AmXxXH4xrcfcFQkAbeYYnNcUSxbTMmv8I7bvT0zLC+NkPU0BK9m5g1KIFHCBXoVG3aFq6SbP1Zb5I5p+q0/FANphId+Mq8qMD23vRErKHQfqHFoBVRbfpzPgFkFQvKoLnfBw6DLV9DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5655.namprd11.prod.outlook.com (2603:10b6:8:28::10) by
 CYXPR11MB8756.namprd11.prod.outlook.com (2603:10b6:930:d6::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.24; Fri, 13 Jun 2025 14:32:08 +0000
Received: from DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::f6db:9044:ad81:33d9]) by DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::f6db:9044:ad81:33d9%5]) with mapi id 15.20.8835.019; Fri, 13 Jun 2025
 14:32:08 +0000
From: "Saarinen, Jani" <jani.saarinen@intel.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "tursulin@ursulin.net" <tursulin@ursulin.net>, "simona.vetter@ffwll.ch"
 <simona.vetter@ffwll.ch>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: Trying to fix drm/prime: remove drm_prime_lookup_buf_by_handle
Thread-Topic: Trying to fix drm/prime: remove drm_prime_lookup_buf_by_handle
Thread-Index: AQHb3GTKTd31fMVmnEumcasw7XVRy7QBJn8g
Date: Fri, 13 Jun 2025 14:32:08 +0000
Message-ID: <DM8PR11MB5655E96B440E770344D0BADCE077A@DM8PR11MB5655.namprd11.prod.outlook.com>
References: <20250613131201.2141-1-christian.koenig@amd.com>
In-Reply-To: <20250613131201.2141-1-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5655:EE_|CYXPR11MB8756:EE_
x-ms-office365-filtering-correlation-id: b1d16e94-b769-4b3a-6bb9-08ddaa8713cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?K2NvZC9jQkhaWkthekNXbXRLMUIrREhkQTZ1YUUvcEtHU0F1VkE5MzFYSUN2?=
 =?utf-8?B?OE03RnJqYWR2b1gyY1NlZ1BEVk8zeTI5MzNIM2RrRVUvNG43V3JPLzl1N3RE?=
 =?utf-8?B?ZkxIeWVHMWZQdlRwUXcwd1dXbFAzcEdOdXNFbDg3QjY0d2c0NmxZeFZFaUFV?=
 =?utf-8?B?NVVwYzlNekl2SkorWjBIT0w1UE41VnBwampFbGJsanVWK2hDdXJqTVA5Z1RF?=
 =?utf-8?B?K25mTDMvNGVQTEVVSStSUDQ5L0s0Rk0wVEZ1UEFqb3dyam9NbUU0TFUxdk91?=
 =?utf-8?B?WjJsdS9PYzBDU0lJU2Znb0RLL2hBTm4xdllnWVUzUkhkSWQ2dEJiOXhyRm1I?=
 =?utf-8?B?c1FqQk9KMk1hdUdFOTd0NHJzTzVBS0FSNFd4VlRPRlVjUVhPOTl5VmFLYjBs?=
 =?utf-8?B?VUk4ckhIVmxZQ3V0S2lFdVJhMzJRUnk3Q3BDNTBlNTNkUlB0SlZIb0oyR3lz?=
 =?utf-8?B?b2ZBcUphNHdoaWI1RkIvTUR6dkFUZnBNTmpPOGZ0N1ZWeTlndE1RSXFBWDJs?=
 =?utf-8?B?R3AwbHlhY2FuMG9ENnNvT1BVTGlyMTlsUzJXelVRdEFyQkxSUHFPY2d5bWp3?=
 =?utf-8?B?MnJlQWlSd1JaK3RjN0h0bGlMUHZ6YVpiTE80MGh0TUlQcEZvd2NNMCtWK0F1?=
 =?utf-8?B?NXFNSkdJeGMwaUxHTXdoRDJFdG9RWGNXS3ZkUEVzNDlJMk9ybzRJRUFaYTQ0?=
 =?utf-8?B?Y2Zpa1R4RE1mRlB4TGJ5R3VadUh1UUpESER3VU9sZS9DcmdLQkRiSnhHNUE1?=
 =?utf-8?B?ZzJDMWltSjdYbG1JMkg2cGlROFU0Z0FPNit4anQvTlhTb2ZhaVEvZzhOU2Nw?=
 =?utf-8?B?QTY1OVd4RUQ0SU16NjFva3ZXSlplbmorTUl6TXo4eSt5UzRYZEVROHZjMnJB?=
 =?utf-8?B?VTlDNGMydTlVU3NHUGcvNzhHV1hzRWVNajZvKzcxVUtGaFQzaEtTQ01BK08v?=
 =?utf-8?B?UENmcmpKNm9CZVdoRDczbUtJdUFWaGRWb24zYUFPS3ZEcHYyTjJpaTY5dzhv?=
 =?utf-8?B?NVRNNXNSaVFKTDJqQXc4TUIxZHA0ZzhtcGgzV0pFWTg4cGUzZkZuTkttRWRP?=
 =?utf-8?B?MzRYaHhMTGY3dmtpc0pmbG84NXF4MXpVL1BHVlU0Wk55OWZVQSsza0c0M1d0?=
 =?utf-8?B?RTRaU25NSmw5RyswN2MwdXd2cWVjZDViQWp3T3J0K0MxMDJzbU05ZkNEYnRH?=
 =?utf-8?B?NENJSm5SSVh2ekNIRGRPRDdXQ293VGNGbWVWSllkWjY2OWxOV2I3cGVoeHUx?=
 =?utf-8?B?UXhqQnFjNDJIc0ZLYVF4cDF4Z3NnNGliRnp4OXBHTkR3ZEhuMXNGZUxxdStI?=
 =?utf-8?B?ejR6NjR0M1Z0ZlNPbXRXbGJXeWFlUXRwSFdydjBJb3BnRkhnQi9rNEtCZmRR?=
 =?utf-8?B?TTE4Rm5BWEl2Nk5KdTIzdm1HQUI0Ny9UclJVUy9nN1IrbzM3UXN4WUVzMWFq?=
 =?utf-8?B?WjIzMVBObDZweU5hWWIwWHpOV2RhaGJ1aTVEZjk3NWxHeHZWSHJLK0Z5UWdC?=
 =?utf-8?B?V0lTRVRUZjRMcURXZjVRR1pEVHhYMEhkU1RzZGtEcGpWQTE0WS83emhzcnlB?=
 =?utf-8?B?aXYzeEM0K3lzalh6dXVNSnlpYzNuNlJCU0xvZmo1eVdLVjhjeXZNVzZEYVJx?=
 =?utf-8?B?Zm5tTlI3OENFQXY0Q3Fpd1R3SXg2cDJTT09OK0tlRnFlQVlGZU14YmFMNGht?=
 =?utf-8?B?WXQ4eWJBdDJ3WWdpdjBSMHJleVBxRkwxQXRMLzUrV0d4U1hnazZnUmx4aWdn?=
 =?utf-8?B?YlptWkZpa0ZubHd1eGdhbzFpRFdTeUhkbXoxcjg4TVBxVTQ1QUlOQkpjc245?=
 =?utf-8?B?T2k1LzlyMUU1bVVJY3lIbjJIV24vOUpRNGljaUVneURiN1V0N1Y1djVwelo4?=
 =?utf-8?B?Q28yWWdVZy9BZU0xTDkyb05WVVRPYVpjeUszZ2RzeHRuM2l5Rm8xbUNhd0da?=
 =?utf-8?B?Y3BKTWt4aVhpcmVUdDF5ZjNlaUp2SEZqWGpLbzdzaXdENW1SSFBUUzBhREdy?=
 =?utf-8?Q?Q+ZKhRjAGxK8oPwY5JitFR93ezG36w=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5655.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MExrQ1FHRUlxZzhFNVIxZG5QZC9IclZhejNkbVk5ekVCdE5VUmJJblo5THJT?=
 =?utf-8?B?anJUSEFDZ0xYaFlscmFacEdvSkVybG51Sk5TS1JkSkN3K2xJUENOdzYvdzBH?=
 =?utf-8?B?ajBKaXNTRHlzN3phdlluaTVoUUV3U1NoTlM5cC9JbWVRMFlQa05uZkRqcHZW?=
 =?utf-8?B?UkM2aDI2VTcwb3NxZG40ZkNBaVNMYndiWTk1U2pRS0JpNWx2M0FMbERoYlBQ?=
 =?utf-8?B?Yi95ZW9TdjFLbDBON2VmamZsUHE0ek5YaW5qR3Ywd3lhQ2lSM05EQjRudFVK?=
 =?utf-8?B?YXpZaDIvb0FDNU5jOGNJbkVVNllpTFE4UUNTeUQwVzVXa3JTcXpQTmVaOVpz?=
 =?utf-8?B?RnB2QmFCSGN3NHhTNE0zR0dQQ1EvOVVTVzhjQ1htM1Y2S29qSDZ2d0RVMG5j?=
 =?utf-8?B?T29aaVFNcWR0dzJtRHpwcWM2NW9lWEdLU1NZT1FtZGRldXUyZjFIZTVsS0xN?=
 =?utf-8?B?OGtVMGRkVHJ3L3RIUUpHbVVQSFliZ21FdGt0dkVrKzhhZ0R5VmI3RDM3N0xD?=
 =?utf-8?B?Mlg3SEtFcHcxMG82bUE3eGZtYm1JVmFLZURSLzZDd1VMamdGOTY0bVlJdFo5?=
 =?utf-8?B?WXlDcWdKSEx1NmNveHdqYm41T2JKL2ZIL0NUaG5zRVFFRVVtVTg4ZGRNbHNz?=
 =?utf-8?B?ZE9WOUJkYmNLTjVEc2pBUGdITjd6d2huVVB1Q045T2VzLytoaWVWUWhEOHpW?=
 =?utf-8?B?QzBiTm5pbFhuU2w3bHQ5RXFIVkxQU3R2NU1aaHl6WDNUeVV4Vjgyb2F4Rjds?=
 =?utf-8?B?UWdqZHZhZ09TbHNBTlRxcTVxdGgwZG9qcjBSdXdLWG8vZklNZUh6L3BpcTRn?=
 =?utf-8?B?T29wNEQxUGtlRVpsUlMwMUF6V1M3ZWhSaXgvQ3FuY3ZkVHVTR0ZGeGpONzYv?=
 =?utf-8?B?ZTk4VU1ZUGZ2cGZkTzlCR0hGYmQvbGI4K3AzenEya0hIWmtvaHZtZ0RZSUJn?=
 =?utf-8?B?Y1Y1VmV5TTlmbzgxa09UcDkzMzRiQTEwUzVRK29qcnBYWTJNdytlOWZObEpG?=
 =?utf-8?B?QklybVFVL09VQ1lYa1JBU1UwdVhuMEJHTklqcjNlRU1vZTRQVVZEL0xvS01v?=
 =?utf-8?B?Q0dEdDRHUi9mZDM1TFYzRUZ6OWEraU9jQXRIWUUweWZnUWZFeVh0QWNWNXdt?=
 =?utf-8?B?UFZNcDNmdS9KeXJxNkFSVDNQYWF0ek9ueTFaZ1FtU3MyNzFmL3JkNXJQUkIz?=
 =?utf-8?B?TWJHSmZQNS91WVQ0bnJBaHhxQXA3bXl6cmxTTzJlUWJ6aEJ2MHlmRG1ZaTY5?=
 =?utf-8?B?aDhKY3ZRUGNaVXlBOFFwc3hRYXhTTlRXZTZncjBuTGdVbkJnR1p1MkpwZEVh?=
 =?utf-8?B?MWVNc05aNTcwSHo1SkM3VzVnRSswZ1JBVThDcitOQzYyYlVOVWZkTkVwemtS?=
 =?utf-8?B?OHBEVmZDanhhMGNzc2Y2ZUZHZFpOK2ZFNG9CZ0RiMEVRTWRpTWZ1SHVZSEtz?=
 =?utf-8?B?aUh1RjhiUzdlVkxLdW5rZSthSUZrTnJDbmlvNU5ZVGlCMDNnanJqa3ptZjY2?=
 =?utf-8?B?M2hmSTRkcWFTTGZJNTUrNnRhRzU2aTA5MHBHVTVwbmNHVFZNejhIL0FwY3Iw?=
 =?utf-8?B?V3ZaWWRyblBFcWlFRW1tRlgzdFFMVDZudzQyRjlYYXVUak1sKzd6eklueVd2?=
 =?utf-8?B?d21Yc0xhRDczN0FLeGFWTDlNY0NSQzJnSHhwMGJ5eUd6QUFyL1JIc2x1ODJl?=
 =?utf-8?B?RU5POE9IUnhWSXF1T1VuaXI2ZGVWd0w3dU5JT1V5SkZ0cC9GcSt3RStBb0Rr?=
 =?utf-8?B?MjhjL0xTQWNIbjEyTFIrSlNpVVFuTkE4U3FteGw3cjQxNHVtMEhIL2hPU2Yz?=
 =?utf-8?B?Mkx2dkRQL25Ub0wwRXliNE03cnFQVWhCQzB3TkoxY3NsNTNuUnBNTUdUMncz?=
 =?utf-8?B?dndGQmJhUmpWcitFODBmTE9oUUJBZm9CbFZTKzlBWVBOclphK3lOdmQvNzc2?=
 =?utf-8?B?VUJyZHJxSjNzam5zbkwzQ2lBMEE4bmVrRjRkT3BhOTk2MjNxTUdmamVrczRm?=
 =?utf-8?B?ZTh1WlFKTnlwb3V2eUpKSk9VWlhaUXFDS002SHhwb0tCUFBwTnNqTWhQQnJN?=
 =?utf-8?B?ajBiT1hsNlBnN0J5RDhUcHdRWHlQMWxZMHFyV0hDTFBSaDdFNjRzdVRKTzda?=
 =?utf-8?Q?DZQPrar2CvhEvpOoxegR03AXX?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5655.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d16e94-b769-4b3a-6bb9-08ddaa8713cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2025 14:32:08.5622 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: huMvUUGLolmZzwsC2TY4V12BTH7IOnk+9Dx36IBawQFBhXDkTK0GpoC2Yyq4Wz8KJrehYGWr8xthpuPS4CfzKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8756
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

SGksIA0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDaHJpc3RpYW4gS8O2
bmlnIDxja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4NCj4gU2VudDogRnJpZGF5LCAx
MyBKdW5lIDIwMjUgMTYuMTINCj4gVG86IFNhYXJpbmVuLCBKYW5pIDxqYW5pLnNhYXJpbmVuQGlu
dGVsLmNvbT47IGphbmkubmlrdWxhQGxpbnV4LmludGVsLmNvbTsNCj4gdHVyc3VsaW5AdXJzdWxp
bi5uZXQ7IHNpbW9uYS52ZXR0ZXJAZmZ3bGwuY2g7IHR6aW1tZXJtYW5uQHN1c2UuZGU7IGRyaS0N
Cj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFRyeWluZyB0byBmaXgg
ZHJtL3ByaW1lOiByZW1vdmUgZHJtX3ByaW1lX2xvb2t1cF9idWZfYnlfaGFuZGxlDQo+IA0KPiBU
aGUgcHJvYmxlbSB3aXRoIHRoaXMgcGF0Y2ggaXMgdGhhdCB3ZSBub3cgZG9uJ3QgY2hlY2sgaWYg
dGhlIGhhbmRsZSBhbHJlYWR5DQo+IGV4aXN0ZWQgYW55IG1vcmUsIGJ1dCBqdXN0IGJsaW5kbHkg
dHJ5IHRvIGFkZCBpdCBhZ2Fpbi4NCj4gDQo+IFRoaXMgb2J2aW91c2x5IGJyZWFrcyByZS1leHBv
cnRpbmcgRE1BLWJ1ZnMgYnV0IGFsc28gc3VyZmFjZXMgYW4gaXNzdWUgdGhhdA0KPiB3ZSBkb24n
dCBzZWVtIHRvIHRha2UgaW50byBhY2NvdW50IHRoYXQgbXVsdGlwbGUgaGFuZGxlcyBjYW4gcG9p
bnQgdG8gdGhlDQo+IHNhbWUgR0VNIG9iamVjdC4NCj4gDQo+IFRyeSB0byBmaXggdGhpcyBieSBq
dXN0IGlnbm9yaW5nIGFkZGluZyB0aGUgc2FtZSBETUEtYnVmIHRvIHRoZSByYiB0cmVlIG11bHRp
cGxlDQo+IHRpbWVzLiBOb3Qgc3VyZSBpZiB0aGF0IGlzIHRoZSBiZXN0IGFwcHJvYWNoLCBidXQg
aXQgc2hvdWxkIGZpeCB0aGUgaXNzdWUgYXQgaGFuZC4NCg0KUGxlYXNlIHNlbmQgYWxzbyB0byBp
bnRlbCBnZnggYW5kIHhlIG1haWxpbmcgbGlzdHMgdG8gc2VlIGhvdyB0aGF0IHdvcmtzIGFzIG5v
dyBib3RoIGFzIGFzIGRpc2N1c3NlZCBicm9rZW4gDQpJOTE1OiBodHRwczovL2ludGVsLWdmeC1j
aS4wMS5vcmcvdHJlZS9kcm0tdGlwL2luZGV4Lmh0bWw/dGVzdGZpbHRlcj1wcmltZSANClhlOiBo
dHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14ZS9pbmRleC5odG1sP3Rlc3Rm
aWx0ZXI9cHJpbWUNCg0KPiANCj4gUmVnYXJkcywNCj4gQ2hyaXN0aWFuLg0KPiANCg0K
