Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A29AD1E32
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 14:56:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD53F10E2DB;
	Mon,  9 Jun 2025 12:56:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ULe1llwC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190158902A;
 Mon,  9 Jun 2025 12:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749473765; x=1781009765;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=LOclCg6ohvinj+uruM8+4S4g4U8MnFjGLa81ANq19po=;
 b=ULe1llwCLf14CTjmVmt0OTBHSENtBhAYQonNfBD+ux2zOUXiHsMP+5PY
 l+XHQpAQ1UkPvk3o+QHVt8JEh7GN4X8dIA8vJ4r6kBEkIUXYwGBXSJ6sx
 PICNaVcPdDZ3p2zOfAIDDINL6F/qYjHWGp6ttd3BBLNonFBlsKESkpKMe
 sAskB9E6BcGs07qjp2swERXRCMJYhAUdptMz5BDf/sD0AYha+D9exKEJ5
 PhqjG+TANQU9P06nmOr+vNpJ60YK/HkMRlF6S9bOf2QJxbCnb4o43IwjM
 Gh0R/E9yyv3GUP8bJKZkpXfDIouRGFFNrZP+XCUP3x2NmxXsjk+QzXO5N A==;
X-CSE-ConnectionGUID: ATsT8f6YSSeF5yqQHYKGfg==
X-CSE-MsgGUID: KTorHvNBQQ+HgVj4Wx83cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51406726"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="51406726"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 05:56:04 -0700
X-CSE-ConnectionGUID: v5Sr626QT+2EDCqaM0C+0A==
X-CSE-MsgGUID: JWVZiQq4RbGrENALkiExGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="146435093"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 05:56:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 05:56:04 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 05:56:04 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.43) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 05:56:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kYe8Z2ICn1P3uxNJ7bxbDSi4fJ1WQS+M0QdL2ai4kH8uC19TsUSzd3fOte9sXWaIJZjo4oqnoHUoBFG+PQ47mR4VhzYfPo/QrLIkkdXXfJ2GbzGLww4HX4VlnIYWkKirEZd4uVDkMtEttEIBMb4atBeooMBDaYQizjvHq8q8cGbKq/bR551AHHZDlOrNJd2+xxmYkqM5XmkKAh+v5Xo4KnqGKpGWxW+CTx8lfmQ1EXGl373vUzSHU4pKYvACQDoJTDfiLorMk1kdfIvI13pbnarylyHlC7CQkjxtNjhQhVHrbpZ2oWGEd/lcwuwFN6wFRD7KiTwjh/20c0aQsqySOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zV+43160qEhHjCud8CspmKaRU2nbTAy6WiOubF6lX9E=;
 b=Vug1yd0kX+9M1CCiLT8dy1O7zEBrP0Nym9IuL+UPMDSvAHhkSrj+gNQNU46ygM6zgJWwYSmBvyQgtjdSZu/JlgwMhsssCm+rf7uzPKiah6UAVA0tPWAwXkDPraMAI5XJMYUQluNdUpr+FGUf6KhRKVJaz7YqIuHiJ7whmR3f7eVxJazvCFuEgzQpuAbUY5hPgJoJE2qcwkI+ObhnJgg5g+0TBKKGKb42yDT2zcw4DKzvytdBlG2Y2oTOzgJKyWAtHFWL4N5qGyIJJvkQg1zteVEKjv1XlMrpWVEeFFjKvPhxZaGUjGZE4ydHSyrAX8YloEBZl5UdUJ+I2DAvGNVedA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Mon, 9 Jun
 2025 12:56:01 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%2]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 12:56:01 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
CC: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Jani Nikula
 <jani.nikula@intel.com>
Subject: [PATCH v4 4/5] drm/dp: Add an EDID quirk for the DPCD register access
 probe
Date: Mon, 9 Jun 2025 15:55:55 +0300
Message-ID: <20250609125556.109538-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20250605082850.65136-5-imre.deak@intel.com>
References: <20250605082850.65136-5-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU7P191CA0026.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::6) To PH0PR11MB4840.namprd11.prod.outlook.com
 (2603:10b6:510:43::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|IA1PR11MB6467:EE_
X-MS-Office365-Filtering-Correlation-Id: edf1f8c4-a1b4-414d-db54-08dda754fc66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2FiRW4zbXgrSkMzejRUaDcydENnTXJvK3dlT0lPdTV2ZGVldmx0bXhYWGh2?=
 =?utf-8?B?ZFNldVZPRDlWbFRHdWVzSDJSWUdXSitEN0ZaRzMrUStPY3NJaVpIQTNTdGgw?=
 =?utf-8?B?WjYzWE1ZVngxYTRzMlFIejN6NlFtM1JiS1hBT3Rsc25yYjQ1bFdGcUxkVksy?=
 =?utf-8?B?MHd6dXUwWHhQVUo0bFAvdkg2NFlBU1RveVF5dUtyN0toT3pmZm5ydEk5QWk4?=
 =?utf-8?B?dllIUEFHTC9xZUJMZm5zT0hjdWNzdExuNWttMzJsV1dYejMxYzF2UHh0RjlD?=
 =?utf-8?B?WlhsemRleFVkWlMrVnZHMnNQYUw0NFc4NmNINTBoRDYzODMzQktRNGJxVWZa?=
 =?utf-8?B?TlVxQXZ3Q01GSGVMTGF5OXV0VFZZamVyYUhZVUFwb0xsSlBkTHo1MENmSEhp?=
 =?utf-8?B?a3V1a3BCczR5VG5TRDVFRnB0VWlyVjJVajNTTTVHbHFUOG4vWHU0eHVIeTdJ?=
 =?utf-8?B?eWtKNnc5djZ1UE14MGFpNXFsQ0lSbWJYR2huQ2E2T1VpenpyeHRRa1NMNnJ1?=
 =?utf-8?B?WnpDQ2FScmdsbkpzM1dGUWxzclhQREV3M242Q0FCM1dKUlNoYXZMeTFDeldJ?=
 =?utf-8?B?Mjd0cmMzQkVkeTNzS1pHY3R5K1h3dnhTQllrSTlsWHhmMVpyRnhSSkUwMFJn?=
 =?utf-8?B?OGhaSk1UL2NoSFE4V0ZPUEZmSzUvTVExcTMyUlVxTzAvc0huaGU2cHR4Lzlu?=
 =?utf-8?B?R0RSNDNpVGZqZU5rMjlCcm9ibDU4VSs0ZUtMdHVvbzJLb1J4UDF3WEVHQmRN?=
 =?utf-8?B?YXprdlhkM2t3dkVQYmZSQ3F4SzAvNThBV3RDUHQzaXZKNmdPd3d4WkZLVWhq?=
 =?utf-8?B?QVJqMWxJVEdRTnpZb04wTnZpcWNQU0tJUmlUS1FSUmFzZFhiRzlaUTlHdjNa?=
 =?utf-8?B?QWt3czVubFRLNUprWUFYUmdoN0k2V09MNnV2TVFtQmNYM0V3R1JWNThqVEwr?=
 =?utf-8?B?ZERuQ2xqY1daYk8zOEYzUnpHUll1NXBrTkNhOFZCenZ6MHRNVnp0ZndZVHBr?=
 =?utf-8?B?bHhTWlNHdHNmbDZ1a2NoOUxja3k3bStrTzlDeFRtYjk3YjVaVEdqMUZ2UzFw?=
 =?utf-8?B?bkc4bmwxUjlDdjVYNXg1UlZLZElRK3lVMEJoeW9RWFNzbmgzMXdhcUd1T20x?=
 =?utf-8?B?a1N6a29NUHdpczlYR1FFT3JnMmIxS1QyL09SRVJpUnA1U01ydEpFYWtiU2xu?=
 =?utf-8?B?Nnl4dDJCWVZJZy9HZlRwYlpEdC90emdUbFJkN2F4UGl2TnpiSkJJR1dFekFW?=
 =?utf-8?B?UzBBbDRPMm84T2x2WE9IOGVhaGxFMjFlVmthd2tpM3BlRmhVZnkrUEtSTVdy?=
 =?utf-8?B?QjRIL3g3VThqWWl5aXhhT0UwLzNOSTVaWGZ6UjJSSHNkMFFrTEJlaTB3azdH?=
 =?utf-8?B?bjhTREJWMVBWaWFMWnJ1RkVEaDJtd0NiWTIzUlRKRWRhWCtOVklLYUtwcmpu?=
 =?utf-8?B?VEZadERKMnpSbFB1V1VKSGp6bGlzK1ljdHJycUxHWkpETDl4VlpOeW5lUko3?=
 =?utf-8?B?cllhYkRQV2o0eGxrKy9nQWlNdTl4UnMwZ3p1WkpYKzNmbXdlVzAwQm4wTWdu?=
 =?utf-8?B?NkZXOFRidThyNFZSZmJjOU5iTkVkUVBVSnBxZm9nMlhmRi9GVFpnNkpndXgr?=
 =?utf-8?B?WFMxdFpuVndhQWxJczFOSkhwRnp0RE1JM29hRGdNSW4yTys0QkU5RWpiZnNk?=
 =?utf-8?B?TFZyZ1RRWTFHMjRqWW5rVkFSQ2NoY1J1SWt5T0VFY2dEeDVEN3Y0TGxqOHRN?=
 =?utf-8?B?bnhaeVdqMzBHTk8ybDhuY0ZWcUNJYVNndDdnY25VNTNZTXo2NE9oM2c5R1g2?=
 =?utf-8?B?dGhmQmd3aWNDbndMY3UzaE9xVXpJVGlhcTRoRGx6ODd2YUVYeGJUdGtXZERU?=
 =?utf-8?B?MFBhL1RrY2pJUjZRVWxjZzV5Y3JwUzVJK1VQUExoTDI4Q2NwRndTVUtDeDZQ?=
 =?utf-8?Q?jIegS10p2F4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmFYeFFkWUQxQUpxbUhGeU9kZ0ttUjFzNGJVZ3ZTZEZJdXFGQ2VtY2ZMQ01Q?=
 =?utf-8?B?eWcydmljMlo0eE52Qy9CamVGdk9KeERQSkJkWXlHdTRCYzhacUZrUUNjcE9F?=
 =?utf-8?B?SWxQMTExY3I4RkVkckdmSDFHcHE5ZGtjY2NKVlc2a3hqNk9IeGZ6Y1NFMk8x?=
 =?utf-8?B?ZmNtUmRCR3dFQ0FOUzZjbmp6eVZLdWpVeDFaNEl5d1hXSHlGR0RnL3gwSC8v?=
 =?utf-8?B?REUyNFZlV1pYejRvK20za2ZkM2dkOGVzN3ZsVzR5UTJkWXFqR1NGWGVjOElt?=
 =?utf-8?B?OEJqMmdPaXA2ZUxRaWFobHV1eDdEYkhyUElkMFNaQnBZQjlYNlI1K2JzSGIr?=
 =?utf-8?B?aFc0WnNmZ1ZMUWJQQ1ZJWXIzUmhCNmZObmlOQk44VHhTWit1MTZkbUFLb1lo?=
 =?utf-8?B?Qk1EUE0wdlhEb3A3N2Z4d3dhQjBjK211NEZwcEsrbUt0d1IwYnEyczREMkNt?=
 =?utf-8?B?R1NGTjRkT25tVG9rcTlJU0E4d1l5YzlSRFZqcTVHUTgvWXd2RUg5K05zd2Rh?=
 =?utf-8?B?Q2xVWmhqTThid21mbzUvZ0swSGpYb2lSKzZZZHlSZHppRHUyaWxwdlZTeXdt?=
 =?utf-8?B?blNXMXNrcjU2ZnJacmR5V1R1T3gvL2UwTmphK0YrWW9PeE1sUWJkbmlCTVpR?=
 =?utf-8?B?R2h3M2FIL3RvTkxBN2NFY3JXb1pVOHZMREdPcUxKWjlmT3JRTHY3RGNJQ2NZ?=
 =?utf-8?B?RkViNEZoVU1oWnJET3A4RXRiVDMvVXNTNkdhMC9ZNHVqZ0tiTWZXc2I4ODFs?=
 =?utf-8?B?VmpxRm1hb1Q1eUlpbGZZbE1xcmtvQmxqdW51MzhFaWVCeElCSlE3NThLcFlX?=
 =?utf-8?B?UFdlS0hQTG1lelcvMUxRSStJQVplZmRlZlp5TlhYMEZRRk1HWFhrN2Y5T3hI?=
 =?utf-8?B?VTlMSG5RMWpPanZVZGsrMnV2dElobGpWNmd5M1I2WWhrZnA1WXJtdFlwbHR1?=
 =?utf-8?B?WDhyZzM5OUdjb0h5eDhvQ0pieVNWQWtKSVRVSUwzQW1zZlZDcXJIbCtzYVMw?=
 =?utf-8?B?NWFWSE9qRDRVaUNxLzdKRnhTT2pjUkE0ejNWWjRsR1BEczV6VVVSYTByZDl2?=
 =?utf-8?B?NTRLYUVFQUVXRklhcDMybjJnZkxaVWhFQ04zTUNxbUNVRHhoZ0RjRHRGVnU5?=
 =?utf-8?B?TjViVTZBcGhBUkxTL0k4VGV3cnBKckRFeVhLZ3N6eHBMSDRPN2dtelRCZmIw?=
 =?utf-8?B?UHJNMEZNK2FuK25NOXIzcHVjRFFtcThsaWlKU1U5a0dqSjdOQ2ZyamxNTkpN?=
 =?utf-8?B?TThqVUpFUjgrbENQYVF4TGRNTGN4K3g5VUpVZVlYQm5SVUhDOFN1a0hkNjFF?=
 =?utf-8?B?dDQ5NDhCNklwNWdmRDhPTUpXeEVKcnlxRnlPWUkydXQ4bndoYk13L3cwbXFK?=
 =?utf-8?B?cjBYcGZxRmwwdUlHZHYzN2l0MlF6NE9ZRTlkMG1NWURVSmhxL3gvWjlSWnlE?=
 =?utf-8?B?dWp1RStNU25vQld6ZkZIY2ZIaE5zRG4raGRqVU5ocW5HSHNkNzh3R2hESkZl?=
 =?utf-8?B?VHgrRUlaMWoxREswU1R1WmZhcFc3OFNRZ2lIUnI5V29oOFBBSWhsalZnL2V6?=
 =?utf-8?B?Tk1TWkZsMGxJSkQ5Q0xzNmFJeGlZZmU5aEdsa0w5UHMyTEdIK0laRDY3ZGQy?=
 =?utf-8?B?QmovS0Mrd0RIMWVQQnRINklxQzlsRWI1clRxbkYyS2F0UGRuWFVFYjQzdGc1?=
 =?utf-8?B?T3IzUkhwbm1nLzZYTEgwMU9wZ2NDVmhjSlhBL3o0ZzRPd01DZFpNUlNzaVc4?=
 =?utf-8?B?U3k1NzdNVVcwSmVFYmdPenN3b01xK2tFQ3ZYN0Flckwxb0Z5M3VmQlU3aU14?=
 =?utf-8?B?MnpYcjFvNXVnbHdobmJKRXlyQUh3Vlh1WnhnRDNOc2hZMHVsRlVZQXJtM1FN?=
 =?utf-8?B?M2YrUzlodU5RcUU4ZlExNzZLbnV0ZUNzdzUvcHBRQSs2TFBVNklIdWt2ak1R?=
 =?utf-8?B?S1ozeUJBMUx1UmE3Ym96NjduZjVPb3dJb2xzL2hQSnZSMU96ek9YeGljU0NY?=
 =?utf-8?B?RysxaU1DTHhFU1BTWnNzMzVmY2hVTEdWNXY0YnNtdll6RVZENHFOWW51aFVB?=
 =?utf-8?B?ZnV5TDlXZUk1azJYa1lLVGwvMGNYUUphUXpMQUorZ29JL1JNeUhZQTk0aDhB?=
 =?utf-8?Q?mY8mEqdBQ6WrKLRQz5Q7jK2qd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: edf1f8c4-a1b4-414d-db54-08dda754fc66
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4840.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 12:56:01.5782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aF86mKgNM8Acvl+RggGFJL+QNf/l9WYbP66guECuvaMkrhoGOr3DEpUgWQGeM+uY3xfVAGHiXD5LnCYeUstWiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6467
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

Reading DPCD registers has side-effects and some of these can cause a
problem for instance during link training. Based on this it's better to
avoid the probing quirk done before each DPCD register read, limiting
this to the monitor which requires it. Add an EDID quirk for this. Leave
the quirk enabled by default, allowing it to be disabled after the
monitor is detected.

v2: Fix lockdep wrt. drm_dp_aux::hw_mutex when calling
    drm_dp_dpcd_set_probe_quirk() with a dependent lock already held.
v3: Add a helper for determining if DPCD probing is needed. (Jani)
v4:
- s/drm_dp_dpcd_set_probe_quirk/drm_dp_dpcd_set_probe (Jani)
- Fix documentation of drm_dp_dpcd_set_probe().
- Add comment at the end of internal quirk entries.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 42 +++++++++++++++++--------
 drivers/gpu/drm/drm_edid.c              |  8 +++++
 include/drm/display/drm_dp_helper.h     |  6 ++++
 include/drm/drm_edid.h                  |  3 ++
 4 files changed, 46 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index dc622c78db9d4..632358b23b333 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -691,6 +691,34 @@ void drm_dp_dpcd_set_powered(struct drm_dp_aux *aux, bool powered)
 }
 EXPORT_SYMBOL(drm_dp_dpcd_set_powered);
 
+/**
+ * drm_dp_dpcd_set_probe() - Set whether a probing before DPCD access is done
+ * @aux: DisplayPort AUX channel
+ * @enable: Enable the probing if required
+ */
+void drm_dp_dpcd_set_probe(struct drm_dp_aux *aux, bool enable)
+{
+	WRITE_ONCE(aux->dpcd_probe_disabled, !enable);
+}
+EXPORT_SYMBOL(drm_dp_dpcd_set_probe);
+
+static bool dpcd_access_needs_probe(struct drm_dp_aux *aux)
+{
+	/*
+	 * HP ZR24w corrupts the first DPCD access after entering power save
+	 * mode. Eg. on a read, the entire buffer will be filled with the same
+	 * byte. Do a throw away read to avoid corrupting anything we care
+	 * about. Afterwards things will work correctly until the monitor
+	 * gets woken up and subsequently re-enters power save mode.
+	 *
+	 * The user pressing any button on the monitor is enough to wake it
+	 * up, so there is no particularly good place to do the workaround.
+	 * We just have to do it before any DPCD access and hope that the
+	 * monitor doesn't power down exactly after the throw away read.
+	 */
+	return !aux->is_remote && !READ_ONCE(aux->dpcd_probe_disabled);
+}
+
 /**
  * drm_dp_dpcd_read() - read a series of bytes from the DPCD
  * @aux: DisplayPort AUX channel (SST or MST)
@@ -712,19 +740,7 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
 {
 	int ret;
 
-	/*
-	 * HP ZR24w corrupts the first DPCD access after entering power save
-	 * mode. Eg. on a read, the entire buffer will be filled with the same
-	 * byte. Do a throw away read to avoid corrupting anything we care
-	 * about. Afterwards things will work correctly until the monitor
-	 * gets woken up and subsequently re-enters power save mode.
-	 *
-	 * The user pressing any button on the monitor is enough to wake it
-	 * up, so there is no particularly good place to do the workaround.
-	 * We just have to do it before any DPCD access and hope that the
-	 * monitor doesn't power down exactly after the throw away read.
-	 */
-	if (!aux->is_remote) {
+	if (dpcd_access_needs_probe(aux)) {
 		ret = drm_dp_dpcd_probe(aux, DP_LANE0_1_STATUS);
 		if (ret < 0)
 			return ret;
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 9cca1e6e4736c..9c8822b337e2e 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -248,6 +248,14 @@ static const struct edid_quirk {
 	/* OSVR HDK and HDK2 VR Headsets */
 	EDID_QUIRK('S', 'V', 'R', 0x1019, BIT(EDID_QUIRK_NON_DESKTOP)),
 	EDID_QUIRK('A', 'U', 'O', 0x1111, BIT(EDID_QUIRK_NON_DESKTOP)),
+
+	/*
+	 * @drm_edid_internal_quirk entries end here, following with the
+	 * @drm_edid_quirk entries.
+	 */
+
+	/* HP ZR24w DP AUX DPCD access requires probing to prevent corruption. */
+	EDID_QUIRK('H', 'W', 'P', 0x2869, BIT(DRM_EDID_QUIRK_DP_DPCD_PROBE)),
 };
 
 /*
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index e4ca35143ff96..3e35a68b2b412 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -523,10 +523,16 @@ struct drm_dp_aux {
 	 * @no_zero_sized: If the hw can't use zero sized transfers (NVIDIA)
 	 */
 	bool no_zero_sized;
+
+	/**
+	 * @dpcd_probe_disabled: If probing before a DPCD access is disabled.
+	 */
+	bool dpcd_probe_disabled;
 };
 
 int drm_dp_dpcd_probe(struct drm_dp_aux *aux, unsigned int offset);
 void drm_dp_dpcd_set_powered(struct drm_dp_aux *aux, bool powered);
+void drm_dp_dpcd_set_probe(struct drm_dp_aux *aux, bool enable);
 ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
 			 void *buffer, size_t size);
 ssize_t drm_dp_dpcd_write(struct drm_dp_aux *aux, unsigned int offset,
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 77fd42608e706..3d1aecfec9b2a 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -110,6 +110,9 @@ struct detailed_data_string {
 #define DRM_EDID_CVT_FLAGS_REDUCED_BLANKING  (1 << 4)
 
 enum drm_edid_quirk {
+	/* Do a dummy read before DPCD accesses, to prevent corruption. */
+	DRM_EDID_QUIRK_DP_DPCD_PROBE,
+
 	DRM_EDID_QUIRK_NUM,
 };
 
-- 
2.44.2

