Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 388DBBAE4D8
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 20:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DFA10E634;
	Tue, 30 Sep 2025 18:25:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="knAcp0UX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D3A10E62D;
 Tue, 30 Sep 2025 18:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759256727; x=1790792727;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ZU7qF3S4Ix6N+I8r3gHUQZ/5unlTsrJX8ngtBS1cpSU=;
 b=knAcp0UXPSWf/KGN5yEo7j3bDaf4VpxFgZzqaLbmQrY7Cbm29SeKWMNY
 AlxSxwcjV7X68huSqxQA6ozWmNyHf5J/po/QtHeWrb+Sh04UeCz1LJ76J
 Sd/HpXgVDIvCqEk3W7fBwtvNHDRPoeqviV/pXd3uMQefIpZJBHMy9PCfe
 8AYhL3TiobpOZVuwJtJjPupgo2MrrrX9pErG31j2xJC6Q4Urbhw4496E8
 2EgBt6V9Omxm0A5HuqgQXf7/fP1qENcJKTJgKzAGMZSQiuCIUt+4GlFoA
 Sppob3XH2tNVtIZnYTmffbIbC0StRqEWnteRwFsqTZ1ktipxX9Y6TsM5j A==;
X-CSE-ConnectionGUID: wsWN8IP6TnCQnmFXLaPPKA==
X-CSE-MsgGUID: KCjIS8obSnGvklwOpfMAjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65162856"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="65162856"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 11:25:27 -0700
X-CSE-ConnectionGUID: VpnUdR1tSE6lVJa2YO+Mog==
X-CSE-MsgGUID: /3kEQbbeSluLldgNckzQVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="183781706"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 11:25:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 11:25:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 11:25:26 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.55) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 11:25:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QGyUKD41hW7eAAcyfvpOemqb/nXR9RZEH4OzXwDxoOEZc2rZBuMs0sazYN9A/3BOox9lVw8G3VJ9RUwBUIDc/aMVdxNLmiF0CGfn4lejlXEnwcOYSAM2fV2vFWP1/tWjfxwoV17oPkHn3FdOaL+HGObh7Dmf2Rsw0zvqLJS40OgCUs2CIXJ3fgo4Zd4yZHhhwUhV2DogxBUY4MMloybiMDV15blzumi0VGf2yWCDEpvaQTfAfInpgxPbToo/4Zoj3REWp5zJegxXRTgMiuAfxYXkRj2GM7bC5Di53FwfajIh0KgLNXV6SGFC+rBMdT63ElKgZrYm0JGhJ5cttZppkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y6+/g7EhZldp5BEVEmN4lcBYlu0Pgdv/n8hEzBOF5LI=;
 b=so2rd5LmdRdUhxo9jCZWjCIJnhepY5ZirCzwgBv+HnVs6sLDowXa5BJv/pM+HAGYRaPa1wk0+m66pxFQXiLDzBnFmFiGL68uGZgfaJgEhgfq3QEBKyVZcpxM0VnKSzJrz0xMs7sX5Ad2iaIbLvQLJ4aZHjioPTlm02DKzX8Xk1M8M/ufuHeXOQA4kT+ziIXs0rHzZ5il2x7aCL7EyOBdEU80i/kGMmVwdNQVCL/5+uTr+w1exKfV7yMjR5gT0IdvBZSuJHBmWfGQotFd8lAK0bVjYRL5XUEnrSsvh8VxafFGpLAXFGq4PSKu7Vq+D+njTq6ZX8uoSs61xx7EnJ2I3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by SA1PR11MB7700.namprd11.prod.outlook.com (2603:10b6:806:330::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 18:25:23 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 18:25:23 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?=
 <ville.syrjala@linux.intel.com>, Vidya Srinivas <vidya.srinivas@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH v6 6/6] drm/i915/dp: Handle Synaptics DSC throughput link-bpp
 quirk
Date: Tue, 30 Sep 2025 21:24:50 +0300
Message-ID: <20250930182450.563016-7-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250930182450.563016-1-imre.deak@intel.com>
References: <20250930182450.563016-1-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0005.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::13) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|SA1PR11MB7700:EE_
X-MS-Office365-Filtering-Correlation-Id: 25826eaf-e770-4abb-18d8-08de004eb873
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|376014|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TkM4aFoyQzNweDJmLzR2N3VTQmdNSUZqTlo5UUpkNjg4Q05BNFByeW9hSzFF?=
 =?utf-8?B?c3pLZzBYYnpjbXFLVkVBSDRzTkptZHFIb044Z1M3T1d5Z3ZqZzhERzVvV0F2?=
 =?utf-8?B?TWdJWmhQdkVSUHlyNzJidXFtVVpLZzQxaE5XeVdURTRvS2VXTE9pYjRienEx?=
 =?utf-8?B?QVdMMm1pM1VWcUJ5c1l4c1AvcFQxNHhLdjh1Ym9GU1dJeDVYWE5TQitrYmtw?=
 =?utf-8?B?R0FjQXRLT3dBaW5oZXFlWXFJeVZjSlFNOWdZVlpFTkVvVzR5c2xYS2JEUW1X?=
 =?utf-8?B?K3VMclRJWEJzanJYOVpMME9yMVN3M3RWdVN3cytXY3JMVTFkd3RQUGhxWW0y?=
 =?utf-8?B?Wm9rUkVxUERTZ0kzVVF4RUFzekozeFg2Q2NDSmI4SFdyL3ZOcGFmdjRYM1NB?=
 =?utf-8?B?ejRkUy9DYk04VjU3Uml3eElReUdrcE9pZVN5SDBNZFNzVm54ZkZuN3dRS3Z4?=
 =?utf-8?B?QnZpNTRFOWlRM0I2SFRLclJFNW1mSFVaT0ZMWHdiNlFaKzZ2YTR4VXc1Ynhl?=
 =?utf-8?B?Q1Z1Q1I1emRFTHEvL3BRZXBkR3U4SlFuVDZFWmp2aTQ1dENFWnNWN25ObmJP?=
 =?utf-8?B?bUdjNnNHWnpOWmlsTHpLL1pSUnQ5eDNLaHhGa2Y1SVBEWVptVjNsR1JyZXg2?=
 =?utf-8?B?cXFGc1pVKzJob3lrU2VabitVbSthU1RzUTMxS0lOK0V6VlNydzYzbFppOWkv?=
 =?utf-8?B?akhjajFyNXBTRkZLTkJRd00wOHZKK2ZaT2txc0JZRVNUQnpha2tXZHJ4Rnpr?=
 =?utf-8?B?NnA0WHpPS1BDdS9QdEJrZTJJcFo4WlZUWkU1U1RIQUN6NTBZVHFXbUVXSUdh?=
 =?utf-8?B?SVBKOVlBcmNCekYwVlUzeURhSUN2UHNJaGJtdVgzWXkrZFVnMUpCYlVPV1l4?=
 =?utf-8?B?Q0d6V2krNjQ3Ri9tL2g2ZDNCQXcwTUNFbHhkSDM4MFkrRXMvbXd4YTNiU1dh?=
 =?utf-8?B?WTJxVEp6WGdsRWdVWXhUM2NBT29KWHZvandtcCtlRGJpOGRlTnIzME9wQVNW?=
 =?utf-8?B?YzRXUWp5a2U4VlovUlJFaktnSjN3Tk9HWVQ2U1ltb213c0dNdFlqZWRBM3dB?=
 =?utf-8?B?MHF0MWJjMUJuSE16blptNlpVamRqMC9mYlEvV3hKaCtrdE5tTFVtMi9CL3M1?=
 =?utf-8?B?eVhMZ3h2WWQxUjk5THpTR3RyUkVDMkxDejYrTjVEYUNHRHVBT0Y5dDJaYlVK?=
 =?utf-8?B?N3lSbEdhQzRhNURqaWlJRjZ6WCtiUHN1WngrNzNyTnlPUlZucHVrSzh3ZDJD?=
 =?utf-8?B?QkpkV0RHbnNKQ3JUM0xybHI2WnFISXVEL01tbUdkWjZpbXpEcHh4SjdzNm1u?=
 =?utf-8?B?ZnVxUHNCTTNHanZScTVWeENSclBQRGdianVydjcweFkzR2ZtQW9uTWNFU0l5?=
 =?utf-8?B?QThsbmI2bzFTbjRKTG9seHEwOFFPYWVSUEQxeTZVNVR3K0swcFVVNXo4TDFB?=
 =?utf-8?B?OFZhWEhvR1lTL0luOFRtbEZUSVkydUZOMDNoalZ3NzVjR2tUVzdPN0VSeCsx?=
 =?utf-8?B?STFtUWozRE8xZmQrb3R4SjIyUXBrNmt1TElxWmRPRXlzT2FaeDBrTmVnbldX?=
 =?utf-8?B?YWl0YlB5NlZxNzRBUFZNeTlaKzJKT1kxZ3I0MXNiRmFKSFVRZEhnZE4wT0RN?=
 =?utf-8?B?cUxGTEg2Zi9iRjdvK21NYk1wbnNQbW8wQkt6RnhqeFdXQnNkUzBJUGRSQ1Bw?=
 =?utf-8?B?SHdPKzdFM0huYUhQVnN1dWdkdHgreEVFRlFwYWZ2UnpPcGJSRmdnMGFuZ202?=
 =?utf-8?B?YmI4YWU5TXNtcjZId2wwTXdhWnNDa0hXWUROZ2RzNFcyUEx2WU4vMHZ6Wi9a?=
 =?utf-8?B?TFJkOVZ4bVpnaDgxZDJjMUE0SUk1N2U1cDZKVkxxVnRlc1lPY0NnTnJ0UG5z?=
 =?utf-8?B?OGhPR1JXVWQyWDJjTGEwRzloY0JpRnlTTVd0SkZWa3JGejFhTzg1ZDYrODRv?=
 =?utf-8?Q?HGGXYu1Dg7kdOLj+4FOlJcOIaoK7jJK1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3lCMVpKWm9IT1JKQ2N2UG9rbDlVNWtYYmY5QzVoTXVvY2FoVCs2WjhLaHhZ?=
 =?utf-8?B?ZG9SSDV2V05pUWR2T2xrOE04ZENhR3g4R2VNWk0vbkw1WlRNK2wxdGhSUm9U?=
 =?utf-8?B?S09zdnJOc0dFVTVlZW9iai8yQjdFSlBlVmtJZExmOFdERXFhdHdqTkFCUXFI?=
 =?utf-8?B?bUp4aFNBZW5ia0ptd2tWVithSUVZbHY2bCsxVTV5NjBJQkY3NFJGa3V2M0d5?=
 =?utf-8?B?dk1PWE5IUnhtMW5Nazk1Y0R5MENOQ2sxUDFwT0d1MDNVNlNBcnV0NlZWQWIx?=
 =?utf-8?B?dEd1SG5Ec0xaZjlSOXlyNkJWUUFHY0M5NVFWMTBHaFF2N0I0S0NwVWdwNm53?=
 =?utf-8?B?Q3V0cUxmSHZCNW1YeUZiSnorZ3F5aXN0eVBWZUNSWlZrNmZQeTUxRU5nUTlz?=
 =?utf-8?B?emV2d2F0QktsQnkrYXJHSnJBM1Jad296cTRBUXAwUXdOR25JK2Q0MWg3Q3pp?=
 =?utf-8?B?OWhMODZDS1dOME5aQ3ZFa0tiVkl0eE9mazgweitucnZNUi8vdlByL3hxKzhk?=
 =?utf-8?B?d0M1OTVTSVJ3N1Uwbml2dG0xRnNyV2RPdTRKWjJSN1FkaW9RZVF1TTJQWktH?=
 =?utf-8?B?Unh3WXcrWTdRNG1lRDBoRHQraG9GZ055K1pza3hCay9GUWc1R29MZFhNOUI3?=
 =?utf-8?B?aStKdkpjQVVCT1BseFovZENXb1EzUGN6VVprRHUzS1RRYi9aejJibkwwc3RU?=
 =?utf-8?B?aXdZV0dkQkxCeW9ncTViTTVpbndnSno1bVRaSWVuQVd3LzQzUVlSakUrUkVH?=
 =?utf-8?B?TU1jNk1zNk4yTlBhck1SVlJWYzNDaStMNjVjVDBUVzA1VktSeU9wMzA2a2dO?=
 =?utf-8?B?QTc5YjZUSEE0R2dTVExMblBCcXVWMndSUmpaRDA1dlNrcjl4OThXMFRPV3gv?=
 =?utf-8?B?VkNNdVR1QzlpNnNGWGZ3REhkRTNNUkhlMmdKYzBEaFpWMU0rNnZXYmR5RnBT?=
 =?utf-8?B?QXFvL3hVZzE1dGYvZFJ6L1lndjlDclhPUHFtMUpUc1JEU3k1T0tuRkw4Tk1O?=
 =?utf-8?B?Y3FkM1h1bUJKNlZvZDcwd2ZnUEtNdkt4RVZFbG4yNXdDcW1oc2xvajRFSE5B?=
 =?utf-8?B?RmZSTlhjVlBLZVU5cy93U0ZqME5iM0trSkhGZVRaV2VpSnV3NXREMmdEZUxL?=
 =?utf-8?B?c0Q2aTlhK01nbC9LdFdheDM5NWY0NFNxNEp0YkViOEVWL0FBOHFyWjAyOE1Z?=
 =?utf-8?B?NWdoRlZYRmFYT1F6QUZoblJmN1pWV2E5cExtczJuLzQ4STFpSHlra3RvbHdM?=
 =?utf-8?B?Nkk4dVJFSFR0cml2UlhJMysxN3ZJR2dTUTB2MmRBUVVUeGg0U0R5RjVNekdo?=
 =?utf-8?B?Q0NsaTRVTWFpcCtnL3BUZ0FSbHBxOTNSU09GTHVqM3dpbDNlV21kODdTeVpl?=
 =?utf-8?B?RjJMQlJybUNhblM1S1VxTE5HUVF2a0hKcUJvZUNJcWZaa3FpQWVBdEVrMmlw?=
 =?utf-8?B?VHBvcFVTZkp5cVp6NVg5ZmlRci9GaU5oN3lGZkYvUTY0bXFwYXZ5N2FidTNi?=
 =?utf-8?B?L1FMS2xlaE5tek5JN2UxMWVFVm91QW1mczdSd0JhWlFqZ3p4eTZ3bi80aGp1?=
 =?utf-8?B?SnZOQ0xoeEJVakhDRzhXTHpIRC9yNUJoVDViSGlsRjF1aDVvaFcwcnVkeElw?=
 =?utf-8?B?NXpwUUp3TzB2Y0ZCWWRtSUNoZUlMM3pNTU9qQU91aXlRdm9GQXRUTzVKOHgv?=
 =?utf-8?B?cTRxaGI4RmtlRU1Gc3JXcTE5WmtCdFRRcUZrbFRBVVFIdS9Ya2p5bGsyZFZj?=
 =?utf-8?B?NHVsSnRJdUEvM3FDT1dkUG5YV1NmS2IwMlpCam5EMGxucUpna0RpZ0NiRmFw?=
 =?utf-8?B?MldIcjJHKzZFT0NZczRYS21tV29PbFV4enBYNyt4Q1FaUlpFSFRmZmZGU0xi?=
 =?utf-8?B?WXlnck5sck45UDNydEtJb21MUmY1NzZzRTBtQ2Y1UmlrZzVpekJKMHcxNFBn?=
 =?utf-8?B?NmJpMDgyb1RDZm5GQkljaEIrNDZ3VmdTMnVDdFNWQ05oUk1UYnhqZ1gvam00?=
 =?utf-8?B?NVlCOVpIUTNZdW1NUElscm9IQlJXK3ByZnBsTUkzU3h6ZUkxanE3Zi8xdko4?=
 =?utf-8?B?UjN1MFZoODBqSHBiQnRVdFo5dU1BcC9DNGE4UWkvVGNMbFpjZW1jWWRYMXVn?=
 =?utf-8?B?M3J6MHQ5R3NVMEJxVzRMaENDamhwdGJYcFZmQ2JmNWVOSmt3UXN0UmM0Rnp2?=
 =?utf-8?Q?ydpd+9cLd0/sguCAQsxiyizTQNu1NYO0NsppO6lLKKcW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25826eaf-e770-4abb-18d8-08de004eb873
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 18:25:23.8199 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /8mrRBPEnCCbY3oCbAUMgqEIKstsvnFHOw3p3IYBvWtiyiDPpEu4PDfN8oxbZWmC846pUed3QEko2E0KCI5n9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7700
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

Handle the DSC pixel throughput quirk, limiting the compressed link-bpp
value for Synaptics Panamera branch devices, working around a
blank/unstable output issue observed on docking stations containing
these branch devices, when using a mode with a high pixel clock and a
high compressed link-bpp value.

For now use the same mode clock limit for RGB/YUV444 and YUV422/420
output modes. This may result in limiting the link-bpp value for a
YUV422/420 output mode already at a lower than required mode clock.

v2: Apply the quirk only when DSC is enabled.
v3 (Ville):
- Move adjustment of link-bpp within the already existing is_dsc
  if branch.
- Add TODO comment to move the HW revision check as well to the
  DRM core quirk table.
v4:
- Fix incorrect fxp_q4_from_int(INT_MAX) vs. INT_MAX return value
  from dsc_throughput_quirk_max_bpp_x16().

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reported-by: Vidya Srinivas <vidya.srinivas@intel.com>
Reported-and-tested-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 57 +++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 99d2c31236928..ca5a87772e93a 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -551,6 +551,7 @@ struct intel_connector {
 		u8 fec_capability;
 
 		u8 dsc_hblank_expansion_quirk:1;
+		u8 dsc_throughput_quirk:1;
 		u8 dsc_decompression_enabled:1;
 
 		struct {
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 9de9356302f97..8a2fc1fcb5d04 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2485,6 +2485,40 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 	return 0;
 }
 
+static int
+dsc_throughput_quirk_max_bpp_x16(const struct intel_connector *connector,
+				 const struct intel_crtc_state *crtc_state)
+{
+	const struct drm_display_mode *adjusted_mode =
+		&crtc_state->hw.adjusted_mode;
+
+	if (!connector->dp.dsc_throughput_quirk)
+		return INT_MAX;
+
+	/*
+	 * Synaptics Panamera branch devices have a problem decompressing a
+	 * stream with a compressed link-bpp higher than 12, if the pixel
+	 * clock is higher than ~50 % of the maximum overall throughput
+	 * reported by the branch device. Work around this by limiting the
+	 * maximum link bpp for such pixel clocks.
+	 *
+	 * TODO: Use the throughput value specific to the actual RGB/YUV
+	 * format of the output, after determining the pixel clock limit for
+	 * YUV modes. For now use the smaller of the throughput values, which
+	 * may result in limiting the link-bpp value already at a lower than
+	 * required mode clock in case of native YUV422/420 output formats.
+	 * The RGB/YUV444 throughput value should be always either equal or
+	 * smaller than the YUV422/420 value, but let's not depend on this
+	 * assumption.
+	 */
+	if (adjusted_mode->crtc_clock <
+	    min(connector->dp.dsc_branch_caps.overall_throughput.rgb_yuv444,
+		connector->dp.dsc_branch_caps.overall_throughput.yuv422_420) / 2)
+		return INT_MAX;
+
+	return fxp_q4_from_int(12);
+}
+
 /*
  * Calculate the output link min, max bpp values in limits based on the pipe bpp
  * range, crtc_state and dsc mode. Return true on success.
@@ -2516,6 +2550,7 @@ intel_dp_compute_config_link_bpp_limits(struct intel_dp *intel_dp,
 	} else {
 		int dsc_src_min_bpp, dsc_sink_min_bpp, dsc_min_bpp;
 		int dsc_src_max_bpp, dsc_sink_max_bpp, dsc_max_bpp;
+		int throughput_max_bpp_x16;
 
 		dsc_src_min_bpp = intel_dp_dsc_min_src_compressed_bpp();
 		dsc_sink_min_bpp = intel_dp_dsc_sink_min_compressed_bpp(crtc_state);
@@ -2530,6 +2565,19 @@ intel_dp_compute_config_link_bpp_limits(struct intel_dp *intel_dp,
 			      min(dsc_sink_max_bpp, dsc_src_max_bpp) : dsc_src_max_bpp;
 
 		max_link_bpp_x16 = min(max_link_bpp_x16, fxp_q4_from_int(dsc_max_bpp));
+
+		throughput_max_bpp_x16 = dsc_throughput_quirk_max_bpp_x16(connector, crtc_state);
+		throughput_max_bpp_x16 = clamp(throughput_max_bpp_x16,
+					       limits->link.min_bpp_x16, max_link_bpp_x16);
+		if (throughput_max_bpp_x16 < max_link_bpp_x16) {
+			max_link_bpp_x16 = throughput_max_bpp_x16;
+
+			drm_dbg_kms(display->drm,
+				    "[CRTC:%d:%s][CONNECTOR:%d:%s] Decreasing link max bpp to " FXP_Q4_FMT " due to DSC throughput quirk\n",
+				    crtc->base.base.id, crtc->base.name,
+				    connector->base.base.id, connector->base.name,
+				    FXP_Q4_ARGS(max_link_bpp_x16));
+		}
 	}
 
 	limits->link.max_bpp_x16 = max_link_bpp_x16;
@@ -4237,6 +4285,7 @@ void intel_dp_get_dsc_sink_cap(u8 dpcd_rev,
 	connector->dp.fec_capability = 0;
 
 	memset(&connector->dp.dsc_branch_caps, 0, sizeof(connector->dp.dsc_branch_caps));
+	connector->dp.dsc_throughput_quirk = false;
 
 	if (dpcd_rev < DP_DPCD_REV_14)
 		return;
@@ -4257,6 +4306,14 @@ void intel_dp_get_dsc_sink_cap(u8 dpcd_rev,
 		return;
 
 	init_dsc_overall_throughput_limits(connector, is_branch);
+
+	/*
+	 * TODO: Move the HW rev check as well to the DRM core quirk table if
+	 * that's required after clarifying the list of affected devices.
+	 */
+	if (drm_dp_has_quirk(desc, DP_DPCD_QUIRK_DSC_THROUGHPUT_BPP_LIMIT) &&
+	    desc->ident.hw_rev == 0x10)
+		connector->dp.dsc_throughput_quirk = true;
 }
 
 static void intel_edp_get_dsc_sink_cap(u8 edp_dpcd_rev, struct intel_connector *connector)
-- 
2.49.1

