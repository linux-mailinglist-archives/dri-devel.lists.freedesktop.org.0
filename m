Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C56DF9D7C2B
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 08:53:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B0A10E389;
	Mon, 25 Nov 2024 07:53:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RGHDsDRx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0353010E389
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 07:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732521203; x=1764057203;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=A/rRGGRnoUQHM1VfR2EN9yQzLhSzqngGIg6lNySydBg=;
 b=RGHDsDRxXASj9fWO3RP+Udfqt+6cAHVmx8vXKuM+sVtuWX7PAwdtqpji
 GwAfFWO5rHcj6SJjU02mW4BHw+v3ju98bgU+5mCZGyD8wMYtFoiXMbf2U
 6W+VY4zAJY6vmQeavtT4TuwmP0r2J/Z45X+Xpm1tyoLuUeGfilZtvkAW5
 U3AJlBPkPvOeee/keZh8uF2GHbBeMcoaSLcBSigZrRova1iwG7gCIg2X9
 zxSRXIJyjXI2deS/Z+Co8peiTmkKa5VqFkNdLxH56w0ogGiBPxB8Z9AWO
 cJnBoG8LT1xAzIfNzEHBzrsIrxZUvVb3iHhwDDXu77EGPqoLtRPN4lOwt A==;
X-CSE-ConnectionGUID: nztB0jXaSXKk0/JLtKBRmA==
X-CSE-MsgGUID: FApotZ9HQymQ3n0rxSXNxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="44007934"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="44007934"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2024 23:53:22 -0800
X-CSE-ConnectionGUID: Qq3nYEj4S6e6ustwuGx9cw==
X-CSE-MsgGUID: 4ZE4IjFtQ8WlhdzCTVvSYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="95959505"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Nov 2024 23:52:51 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 24 Nov 2024 23:52:51 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 24 Nov 2024 23:52:51 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 24 Nov 2024 23:52:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NqC31Cr6n/Di8QJSrBPY90V3oi5qF0gF/pCWIb+wGirsnZxjI6YKJZM7vM82pQUYHRxm93APvE/u5GsdF3XbhGWIkwtM+LvUn/4VuFBsPT1Sna03sZzNp8eu/qzE2Mpfo0mZcjIbAYSgbERK2bd7L4NBI1R8ZtlnPafr3eFSpi/sjOmSV991Mlosm/eAscinN6JwD3M5/5pyr1/KcWTUIDWpgmz03V9S5Wd2Sb4npdLXOnKEyyAPQmV8fe5EANb/yGAo5umgFY+REy5VicT6vwQnqvE5DmRjMK2V9MwcbPYDvKN2n4wnT/pIpcVSObolKsoKUo/cBrdVH8xHT3x27g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/rRGGRnoUQHM1VfR2EN9yQzLhSzqngGIg6lNySydBg=;
 b=wSquWGATpgUdmRrQ0rE+Llw6icVSnjD4EhxU+4d9bCEOaQ0aFjANbSqPSstU4dmjYYNHsHMb3NCHTh+3F3V9gJY88CCPr2qdUZXQJFAcLlVkU7aGcFnwM8LhgVXDXqtRDcBaL+QCXvWjJQ0921yTi7/rXDF6XvZrtleSB1KnIwhBougMgF2yvtuDLb2Z1JCrvmuY4mvmV7297CL+YabJqv4/2zkmq4/Gxtrrq96pzMMIEsjrQw8hjjdwO0WWRl8qwJe0oIpY8ncs42VdAT0qLhSKrxLMtqjt6ibw2+eYKlf7pUljHMyzn3y4Du7N3M02QRsMLB2CwQbMKnWuZf6I8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by BL3PR11MB6481.namprd11.prod.outlook.com (2603:10b6:208:3bc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 07:52:48 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%6]) with mapi id 15.20.8158.024; Mon, 25 Nov 2024
 07:52:48 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: Gerd Hoffmann <kraxel@redhat.com>, Rob Clark <robdclark@gmail.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>
Subject: RE: [PATCH v2 2/5] drm/virtio: Add a helper to map and note the dma
 addrs and lengths
Thread-Topic: [PATCH v2 2/5] drm/virtio: Add a helper to map and note the dma
 addrs and lengths
Thread-Index: AQHa7TgPrcbKIkB680CVAbY2s3+7ybKQ+qcAgAEiG4CAAgTjAIABpIUwgAK8GwCABQI3cIAeUOCAgAErI0CAAZMJwIAAapgAgAD9CrCAB+fpgIAASd/w
Date: Mon, 25 Nov 2024 07:52:48 +0000
Message-ID: <IA0PR11MB7185353982786498B779934AF82E2@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240813035509.3360760-1-vivek.kasireddy@intel.com>
 <20240813035509.3360760-3-vivek.kasireddy@intel.com>
 <45fbbd65-7e97-41c3-898a-49b6fa65e27e@collabora.com>
 <IA0PR11MB7185625CF2B9E7635A0CF164F84C2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <071a239f-50fd-44f3-9283-3dc928edb389@collabora.com>
 <IA0PR11MB718548F4F8971C91FCA456CCF84E2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <4feda09d-7a5e-4db4-83f8-f75eb0566b4a@collabora.com>
 <IA0PR11MB7185C176AF07732D39AA4F86F84B2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <e336b9ef-c8f3-44c8-904f-42736f6ac481@collabora.com>
 <IA0PR11MB7185A20AA84175C4D44D44E3F8272@IA0PR11MB7185.namprd11.prod.outlook.com>
 <IA0PR11MB7185671D43889B076086940CF8202@IA0PR11MB7185.namprd11.prod.outlook.com>
 <666c6ce3-d713-48a8-af17-e8bc28956e38@collabora.com>
 <IA0PR11MB718531B09D692B0BCEE6F81DF8212@IA0PR11MB7185.namprd11.prod.outlook.com>
 <868a7354-2286-42cf-87d6-9783f6547636@collabora.com>
In-Reply-To: <868a7354-2286-42cf-87d6-9783f6547636@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|BL3PR11MB6481:EE_
x-ms-office365-filtering-correlation-id: cd229ca4-72d9-46db-0a47-08dd0d26280c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UjJZcDRpSlM3djJDWGVlSEhuRFo0dmJIRDZjMkpGYUUxbGNSOEUvSldQNUE5?=
 =?utf-8?B?UDc3MGtxZVowUE16cWdFVWVSK3kzd01ZRTRXYUlWazRsd1lJMDlpRllOY1NY?=
 =?utf-8?B?N1JCV3JXbGtvcDNmN0ZUN0hadTk3VUxPWW5VckJkZnpXaWI3WjF6RExncjV4?=
 =?utf-8?B?RGNKMWtNbml2Mk1mMzBrMUJCdlk5dmxUV1lacFI1bHBscEZNVHJBSy84QzVi?=
 =?utf-8?B?dW5MS0JnNEtFYThqVDJNNStmZjIweXYweEo0NTR1ZUlDeW44UUpxRlBQdzQ1?=
 =?utf-8?B?bFRHVlc5aDRXT1hvMk1KTHVmUlllOTVsSUlDMkNTcnAxclFER2t3NzhReXRO?=
 =?utf-8?B?cUZzQlBGa3B5Z0hnUkpkZnlzOE5RUFhhNmovenVkQW9rNHJrV2pMMkM3RHNB?=
 =?utf-8?B?RWQ1M0FsWkJBYy94NUIwTHJJdlY0ZS9PdVRJeldleG5nME5OTWFQU09peGxO?=
 =?utf-8?B?aXE2ZTJWcmdKUlk2VlFqaDl2eW82cUlvRU9mS1U2MlNqMTJMa1hheDlXNzNr?=
 =?utf-8?B?blkwY2ZlTEZqL1huMGY0eTBST3I0VXNKNDJXenB6MFcvUjE0azY2ekg4VjdO?=
 =?utf-8?B?eFl3UFE1a1E2c2hZWjRwWFVRYTFsYXYwaUF0R0pWbFB5N25lWTFjeVdwV09t?=
 =?utf-8?B?bC94RW9vQUV3Nm1zZTRXUklmeXFHNG5JZ0tGUXRsQVZJTHoyajBTbGtZUkk0?=
 =?utf-8?B?dXFzZXdiOXRZVXoxL3Q4RXphVW1oUGV6OTNqMWIwaTFhSGZqTVJPUjhrVFN6?=
 =?utf-8?B?K2hGWlYrR29tSXVMRThrYzBVN3Z1aUFqbXdCTWlFVXBPanhuMDB1YmR5Y2Q3?=
 =?utf-8?B?MGJyS3JtV3hkbytDZ05VYko3M09UdHF4ZUlaenJYSVdZWnZ1cnJEMUtGdlZz?=
 =?utf-8?B?WmNTMXlteE5lQSs1bG4yZEl1c05YMHRNMEF3cUJ3WnhISGJNZE1FNTZabXFx?=
 =?utf-8?B?S2pTWVd0RlgxY2pBQUxjbFQvM0pkMWV3VGVqeGNaK0pJb2IzL28xMWRXWXFM?=
 =?utf-8?B?R2c5N21UZ1pXWld0bVV0VDJtMzBiaEFPUDkycHE1eHZvNFJQOXAxTzJiTHBh?=
 =?utf-8?B?bC9MaFNvUjI3RExVVWwrajFBdXRtWHpIaGtTeWFJbmxtdVRWUUVZNzAyckZK?=
 =?utf-8?B?NGNEUEZZRDd1OGEzMng2MjUzeEJ3WFZEMWZVRGZjMGd1N0U4SXpxM0xlZWVn?=
 =?utf-8?B?K3NsZzQ5MHJoZzk2TVhEa1o1RGl1cVZEczI3Y09sVmJWdG9QZEVQNWs3eVVn?=
 =?utf-8?B?UnFuQWVPWUpnL3h5Y2FYTXVLUnU3UkRQc1lVRHA4R29teURxbGIwQm5RZW5W?=
 =?utf-8?B?RUxPWCtIeTRZZjFRaHVrREhtUjF3U0JBZ2FIcExrTTh6VjRWa2t5aFkvYVEv?=
 =?utf-8?B?WndMNFVBdEl3UCs2RitRUTRJdnM3R1MxWUd5amxKYmtUa1lOdEwyZjNHeGF2?=
 =?utf-8?B?UjNkS05kNk1ueFBJam1wdUNDREFzL1FSUGNzdWE3R1VaeHRIOElpTm4rRXpG?=
 =?utf-8?B?c2cvcVl5UDQ0ZURxa0VQNEUxSURuTEFEYUVzdTdQZVdaVlBvNTFxN2FUNDdw?=
 =?utf-8?B?TSt4b21xMW02VFNlVHBUa0pCdFZ6MHFja0M0QWw3c1dpSkt4anVvZVZGUTBO?=
 =?utf-8?B?d0x1eDFQMjM5RkNiYk54SWlvaUtZQ3I0WFcraHN0SHZRNk90Tm83ZTZZWXVM?=
 =?utf-8?B?ZXl3Unh5c3dpalBRMG5UOHFhTElTb21heWpPekQ4aisybXYvYlBrLzZTVDJJ?=
 =?utf-8?B?bnZScGJHMlJFRFpmazRKNms2eXB0YWlMYmNlZ0hZWTdtOXBPVGVUbng2Y0pZ?=
 =?utf-8?B?S0tscmdUT253QUg5RFBlem5MbmFoRXpNdjZsUUxXL0RnclRSVjVxNDBMbG01?=
 =?utf-8?B?U2xwL052SGhuZ3RMb3NZM0RuVjRZZFR1S3Y1RDhERWkxd3c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y2lIN05OU0h5VlpQSEg4anlraDBlZ3lsdkRKeVFaY2xaZXVLcXV0S0cxckxq?=
 =?utf-8?B?WlQxRmpiaWZ6NFZCWEJENFp3U1F2VUgxZjZ0OVRZZ0N3YVNBMFNTZHh1M3pI?=
 =?utf-8?B?ckFhWmxpZ2cwMytNbDBqdm82eHlIZlNFR1NpWHE0aFVnRlNMdXJNaWhSRHhZ?=
 =?utf-8?B?SXRrSUs4T1ZnUnhpZGw0TldkMUM3YjFZQXlmYzhLbWNvWE9HaHUyWFowWk1u?=
 =?utf-8?B?QmtsaCtJYmUvVk9xWEV2c0JYWklyY0pRSVZWNnRhcnU2UkxFTUhycGxCUkF0?=
 =?utf-8?B?eCtVNFpiUHYwM0VzRE9WVGJVTG02VW16WUxmNFdMTUdUSGRqMTZqZVYwVWh5?=
 =?utf-8?B?OXkxVllRMkk3RnJPdzN5Wi94cCtKSWtoV2RCcVV3NW9RRTJWdkRkdG5QZS9u?=
 =?utf-8?B?eUJnbFprZi80SXJGTkc4MlhvZ29zZUV2Ykt6NGVCMmJySktCa3h4cEpiSHpY?=
 =?utf-8?B?MVhjVmFWRVIrbTBjRFFjRVdsci9RYjd1UVM1cjBNenhleUJzSFNabXpraG5h?=
 =?utf-8?B?QkVpTFRUeE8xYmpWS1NsY2QxQ3BBUFFjR2lRNnYreTM3anJWbERTVE9rUTBV?=
 =?utf-8?B?RENSZzUyY3FGanF2dDRxZHhwTldPUG9SeXFyalVoWUxSK29wcUMvTklMQmtN?=
 =?utf-8?B?RU5XWW1yK3lYQ1BWSlNQbUlDYUFLYU85SXRBbmVRT2lGYXoyWUV6aVZCZGhO?=
 =?utf-8?B?ZWNOa1YrVUZsZFdyWG5XMXdiYW1NY1E5ZGlUQnJUNEJpUURPRUVTakZMRHhj?=
 =?utf-8?B?YnlOMVoxWXRkc1h4NjMxVmR3ckFjTUx1YmwrT0V5NzFZdnpqZHpISlhQaFpF?=
 =?utf-8?B?QklvWm9HdFJUOE9wN1ZBOWhiZEdFV2dmQ291Z1h2NGkydityalgxMUdKREM4?=
 =?utf-8?B?QzZVVTNFaFhSWnhaZS83MTE4d2UzQncxS0d1Z2htWVpSSGg5RHBCVVB1L0dE?=
 =?utf-8?B?WGJXaG53dW1yTVZZcmlGN0pHTmNIbmpacS82TEIzTGY3V0dsYXJWbDNUVS9j?=
 =?utf-8?B?aDF1RDRCVVVvYTV3Qk81UlhvL3R6UUZrdnVJeVlWc0pYRGNpVS94aFFLRmsy?=
 =?utf-8?B?NXMxV2lZVWNnSzRqRm9mU0VRMjlpNzRLQSt6NnZodndVTlBzbUZKOWtHYTRF?=
 =?utf-8?B?WUNhUmhxNC9MZVRSVStaMlpWK29rK2p3WG13ZXRQN3h5L0xLd3VRcFIyWk1r?=
 =?utf-8?B?ejBKdkJvMjFLOW5XY0xDNlk4WGRBUEpmekdlRjN6MSt5OXE1ZlEwTlJKT25a?=
 =?utf-8?B?djRuTGdjcktuYmpzSXpRTFZqM3grQU13dVM1SFJnU2wzZENwWm5qS3hHVm51?=
 =?utf-8?B?bDRJcHlkcFpsOVlXdmpDVEtHYWQxVU5lQUdUZVluWG1tcXNqQmU3d0dJRElJ?=
 =?utf-8?B?VjBlM1EvRlI0clJtRUs3WkNob3NaMFBsYlYzQURrdlo1SVp2NWNMVXNOdG9Z?=
 =?utf-8?B?cDBDTFJ0SnhTaXVIWHZpazBUYi9yV3Z0SFZNRFJrZnJiL01Jd25PSEk1b1d6?=
 =?utf-8?B?bGtjSXRtRFh4UjNnYWl5WE9TSVdiZmdlTW5wZkpYTmhudHM1L3pQRGUxUVQ4?=
 =?utf-8?B?aHdpNmVMMDRFd2VJbVN0Mm9ZUjVwbDZlTU9iL2t0dnNMVU0zNytYQ3lGV0lE?=
 =?utf-8?B?VUxjZ0Q3cWV4OC9YbERxQm9BZ3lkeW5PZVdGaTRLS0xvYnltQmY5VU5zcHFE?=
 =?utf-8?B?cGd5ajRMcTAySzJuUUMrQUQ0K1ZvY2k3N2dPdGI4aDZJQ1hZb0VmcC80UkxX?=
 =?utf-8?B?TnhMc2dOM2tHbjVLbXJ4aVZzTWFNVXhhVHE1TUNWSGtNbGhPeGw0TCsyZDhi?=
 =?utf-8?B?R0FoMWd5dWRoMVgzMVo5WWdrQmxnaGtKSXJxekhXaWpOYTdsSnU2dEQzaW5B?=
 =?utf-8?B?bjlhSkloM00vZSt0dytqWktMbGo5TlFmSWJ6R01BQ25rNjIvSGY0RmVTU3d2?=
 =?utf-8?B?OTJEZzB4eHNYTzk2N1NjSXN3TEhXY0RSNzVRMG8rRzliUFdQeHkxWEJqZTVk?=
 =?utf-8?B?U3RVOStFNldHdkZQZUtwa3VQWlpDbmtmUDlvSFJNanF2UlpnWG1kR1p4MVpQ?=
 =?utf-8?B?UlZaMEtSeGVGMm1hWTFxSTJBcTBlYms5RHErdmRsZWNFMHJXUklYUFpQSXFW?=
 =?utf-8?Q?KZaLyfIOq6gv9zQik/AIWla+2?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd229ca4-72d9-46db-0a47-08dd0d26280c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2024 07:52:48.7925 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5PEEY8xNEZaDu+jvKGWSEUsEHmJVMWEDm7nhMfGdfr0JYH1rrGh1mq/mrBbBUm/DDavNdz753IBBuSz7nREiyKFY0WAL70KGMrO/6qpby7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6481
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

SGkgRG1pdHJ5LA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMi81XSBkcm0vdmlydGlvOiBB
ZGQgYSBoZWxwZXIgdG8gbWFwIGFuZCBub3RlIHRoZQ0KPiBkbWEgYWRkcnMgYW5kIGxlbmd0aHMN
Cj4gPj4gLi4uDQo+ID4+PiBBZnRlciByZWJhc2luZyB2MiBvZiB0aGlzIHBhdGNoIHNlcmllcyBv
biB0b3Agb2YgdGhlIGFib3ZlIHBhdGNoLCBJIHNlZSB0aGF0DQo+ID4+PiB0aGlzIHVzZS1jYXNl
IHdvcmtzIGFzIGV4cGVjdGVkIHdpdGggUWVtdSBtYXN0ZXIuIExldCBtZSBzZW5kIG91dCB2MywN
Cj4gPj4+IHdoaWNoIHdvdWxkIGJlIGEgcmViYXNlIG9mIHYyIG9uIHRvcCBvZiB0aGUgYWJvdmUg
cGF0Y2guDQo+ID4+IC4uLg0KPiA+Pj4+PiBBbSBJIGRvaW5nIGFueXRoaW5nIHdyb25nPyBTdWdn
ZXN0aW9ucyBhcmUgd2VsY29tZS4NCj4gPj4+PiBDb3VsZCB5b3UgcGxlYXNlIHNoYXJlIHlvdXIg
UWVtdSBsYXVuY2ggcGFyYW1ldGVycz8gSSdsbCB0cnkgdG8NCj4gcmVjcmVhdGUNCj4gPj4gdGhl
DQo+ID4+Pj4gaXNzdWUgeW91IGFyZSBzZWVpbmcuDQo+ID4+DQo+ID4+IFRoYW5rcyBhIGxvdCBm
b3Igc2hhcmluZyB5b3VyIFFlbXUgY29tbWFuZC4gSSBoYXZlbid0IHVzZWQgdGhlDQo+ID4+IGBo
b3N0LXBoeXMtYml0c2AgZmxhZ3MsIHdpbGwgdHJ5IGFnYWluIHNvb24gYW5kIHRoZW4gYWxzbyBj
aGVjayBob3N0DQo+ID4+IGVycm9ycyBpZiBpdCBzdGlsbCB3b24ndCB3b3JrLg0KPiA+IEFueSBj
aGFuY2UgeW91IHdvdWxkIGJlIGFibGUgdG8gZmluaXNoIHJldmlld2luZyB0aGlzIHBhdGNoIHNl
cmllcyBiZWZvcmUNCj4gPiB5b3VyIHVwY29taW5nIHZhY2F0aW9uPw0KPiANCj4gTGV0J3MgdHJ5
LCB3ZSBoYXZlIGEgd2Vlay4NCk9oLCBpdCBpcyBnb2luZyB0byBiZSB2ZXJ5IHRpZ2h0LCBnaXZl
biB0aGF0IGl0IGlzIGEgc2hvcnQgd29ya2luZyB3ZWVrIGluIHRoZQ0KVS5TIChUaGFua3NnaXZp
bmcgaG9saWRheXMgc3RhcnQgb24gV2VkL1RodSkuIEJ1dCwgeWVhaCwgbGV0IHVzIHRyeS4NCg0K
PiANCj4gR29vZCBuZXdzLCBJIGdvdCBpdCB0byB3b3JrIHdpdGggbGF0ZXN0IG1pc2MtbmV4dCt2
MyBvbiBndWVzdCBhbmQgYnkNCj4gdXNpbmcgcGFzc3Rocm91Z2hlZCBBTUQgUkROQTMgY2FyZCBp
bnN0ZWFkIG9mIERHMi4gSGF2ZW4ndCB5ZXQgY2hlY2tlZA0KPiB3aGV0aGVyIERHMiB3b3JrcyB3
aXRoIHRoaXMgZ3Vlc3Qga2VybmVsIGNvbWJpbmF0aW9uLCBtYXliZSBpdCB3aWxsLg0KWWVhaCwg
REcyIHNob3VsZCB3b3JrIGFzIHdlbGwgd2l0aCBsYXRlc3QgZHJtLXRpcCBhbmQgUWVtdSBtYXN0
ZXIuDQoNCj4gDQo+IEEgYml0IGJhZCBuZXdzIGlzIHRoYXQgZGlzcGxheSBmbGlja2VycyBvbiBl
YWNoIGZyYW1lYnVmZmVyIGZsaXAgKHNob3dzDQo+IGEgYmxhY2sgc2NyZWVuKSB1c2luZyBkeW5h
bWljIGRtYWJ1ZiBhdHRhY2htZW50LiBQaW5uaW5nIGltcG9ydGVkDQo+IGRtYS1idWYgcGVybWFu
ZW50bHkgZml4ZXMgdGhlIGZsaWNrZXIsIGkuZS4gZHluYW1pYyBkbWFidWYgYXR0YWNobWVudA0K
PiBkb2Vzbid0IHdvcmsgYXMgZXhwZWN0ZWQuIERpc2FibGluZyBDT05GSUdfRE1BQlVGX01PVkVf
Tk9USUZZIGhlbHBzLg0KSSdkIGxpa2UgdG8gZ2V0IHRoaXMgY2FzZSAoZHluYW1pYyBkbWFidWYg
YXR0YWNobWVudCkgdG8gd29yayBzdWNjZXNzZnVsbHkgYXMgd2VsbC4NCklmIGl0IGlzIG5vdCB0
b28gbXVjaCB0cm91YmxlLCBjb3VsZCB5b3UgcGxlYXNlIHRyeSB0byB0ZXN0IHdpdGggREcyIHRv
IHNlZSBpZiB0aGlzDQpmbGlja2VyaW5nIGlzc3VlIGhhcHBlbnMgdGhlcmUgYXMgd2VsbD8gU2lu
Y2UgSSBoYXZlIGFjY2VzcyB0byBhIERHMiBjYXJkLCBJJ2QgbGlrZQ0KdG8gcmVjcmVhdGUgdGhp
cyBmbGlja2VyaW5nIGlzc3VlIGluIG15IHRlc3QgZW52aXJvbm1lbnQgYW5kIHRyeSB0byBmaXgg
aXQuDQoNCj4gDQo+IFRoZXJlIGFyZSB0aGVzZSB2aXJ0aW8tZ3B1IGVycm9ycyBvbiBlYWNoIGZs
aWNrZXI6DQo+IA0KPiBbZHJtOnZpcnRpb19ncHVfZGVxdWV1ZV9jdHJsX2Z1bmNdICpFUlJPUiog
cmVzcG9uc2UgMHgxMjAwIChjb21tYW5kDQo+IDB4MTA2KQ0KPiANCj4gT3ZlcmFsbCwgcGF0Y2hl
cyBhcmUgZ29vZCB0byBtZS4gSSdsbCBsZWF2ZSBjb3VwbGUgY29tbWVudHMgb24gdGhlIHYzLg0K
PiBUaGUgZmxpY2tlcmluZyBpc3N1ZSBpc24ndCBhIGJsb2NrZXIgZ2l2ZW4gdGhhdCBNT1ZFX05P
VElGWSBpcw0KPiBjb25zaWRlcmVkIHRvIGJlIGV4cGVyaW1lbnRhbCB0b2RheSwgd2UgY2FuIGZp
eCBpdCBsYXRlci4NCk9rLCBJJ2xsIHRyeSB0byBhZGRyZXNzIHlvdXIgY29tbWVudHMgYW5kIHNl
bmQgb3V0IGEgdjQgc29vbi4NCg0KVGhhbmtzLA0KVml2ZWsNCg0KPiANCj4gLS0NCj4gQmVzdCBy
ZWdhcmRzLA0KPiBEbWl0cnkNCg==
