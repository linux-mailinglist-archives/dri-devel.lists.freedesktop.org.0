Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAk2GjI/gWl6FAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 01:20:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2DDD2E32
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 01:20:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F6B010E23F;
	Tue,  3 Feb 2026 00:19:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hrx6PxDj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FEB510E223;
 Tue,  3 Feb 2026 00:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770077997; x=1801613997;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7Esv5UwPB8O2xiQGC1MpQilJh3l6M9plxNg+mSAzH+o=;
 b=Hrx6PxDj9/k40pNzfluNVLLsneWAciiQfnHn2jRx7JofWm7NlxqLybyg
 YQ8tceZ9bfttjBK2P6Lz/8TNsq1TW8E19NOM5LXbOEZynznNwJZ55692p
 XkgSeEjIqm+2/+1acwVkOiH7GAPKKC/Owv+LaNtuutr39JGkO7wN+93l+
 rDOTjDWzQrXi3QRCgqM56Ggu2TzLgeq85Rl8utVcy4+aRlRsyetyPN6V/
 Gj7umJRloULEeL2tN04UkDiyWj3EF+R+dLpaDXGXN2iFjJSSrgSabfwx+
 afoWalD2u8/M2SEe4N2a3KnS8R5hHYFt8l9qsfcEYjro+/ISKY90AkZmb A==;
X-CSE-ConnectionGUID: FxF8YoDYTlCtwIwXBAcxoA==
X-CSE-MsgGUID: bHx10Ur8R6m0Spzm6YaIPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="70966878"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="70966878"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 16:19:47 -0800
X-CSE-ConnectionGUID: N72UO0zhQ0Sydjuw2NZk+A==
X-CSE-MsgGUID: q1dzJJqwRRSHF4QG0hXsrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="240351078"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 16:19:48 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 16:19:46 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 2 Feb 2026 16:19:46 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.63) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 16:19:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gaA7WYrn121AnJ7gaswN6RynD1x5e4BKxaU8FhUGRDhzeL5BWlsFk+y4He3XnSLXeZc1c17sglK3fpkj+qpUvAm60ElLWQV1TgoG6Aq4fqIP/2sIEyqfpwMcoAfNnMOvDiMnRmQWTPX+aG+VcTGZMGGuc7OD8xvRktOK/4P7pRo8CqkqROcl8RBAL9SaR2oWvIpYVrHhwEM6A1LRh0hNt+coSt7V8AA9islA1dZrjeQWxtYxcsHnQWRO6JfFAmEm1Uzur2a+iXufdiTSzZnvI/b5QM4tgldq1xtKKunTyx0tNgnCPq1Kofar2u6gzPi8m8K7Z7nFaGjDlIr+n+0L5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dRfWhQHnwZF5ThOojnwpP5e+3NLtLy44SebKGAfo82w=;
 b=fxSvYQ5nzB7I5osLDtNCpSSRAz7wuO0qO1SDI7peU1Es9MQuILUKCoPKF2MqRz5iufITf83RfATyoR6XUyGErv342p2WYpzRSWQE3EY00/0YjTuTS2uX/OR4lII0kpuaNcn+pda44Gaz5a426gEAE5FCZYd6NdSVwFNV6SkR5LEWsXkzRe3IPm/vV4OrVBNTzCVANiejbocIEbVh2XuTYKzliWghKUlcNY0rCZwAKffrhZ3tMD8ni499bNKxze1bcu9vLmormrNtSaTPoE1JyEIIWDcjLSXyoonJRDfFxjHDVJ6VI8Pl0fqqXeCL0NGLDrf7s8M3TPG8LuPDgUS0eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by LV3PR11MB8507.namprd11.prod.outlook.com (2603:10b6:408:1b0::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 00:19:39 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 00:19:39 +0000
Date: Mon, 2 Feb 2026 19:19:34 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Marco Crivellari <marco.crivellari@suse.com>
CC: <linux-kernel@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Tejun Heo <tj@kernel.org>, Lai Jiangshan
 <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko
 <mhocko@suse.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 "David Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v4 0/2] replace system_unbound_wq, add WQ_PERCPU to
 alloc_workqueue
Message-ID: <aYE_Fozju9PSesP_@intel.com>
References: <20260202103756.62138-1-marco.crivellari@suse.com>
 <aYDO53pNfjvVhoT6@intel.com>
 <CAAofZF4oC+9ohHupkvmkR-967QEpSVdQoD5yHfLPcKzF4TnnXw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAofZF4oC+9ohHupkvmkR-967QEpSVdQoD5yHfLPcKzF4TnnXw@mail.gmail.com>
X-ClientProxiedBy: SJ0PR03CA0104.namprd03.prod.outlook.com
 (2603:10b6:a03:333::19) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|LV3PR11MB8507:EE_
X-MS-Office365-Filtering-Correlation-Id: 066ccd0e-0a3b-4c4e-ed3a-08de62b9eb3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WnE4Q0Jra0lNKzZvY3JidkJVYTJuNVE5TllXTm1xOUo4cUhkbEZmcEhGT3hJ?=
 =?utf-8?B?MU1sdFIrNGpDSW9zay9wR1lvdXE3M0RUOUVwcHhNUXZMbEdqaUExbmp5RnVZ?=
 =?utf-8?B?MGlKR3hFcVVGbTJCTXlTRW83NVZFWjN6VjlzZEdlZkgwZS81bXhKQmF2NDJ0?=
 =?utf-8?B?eWg3NUZSN3dEZ0ZvRFE1VG5qbnZHOGFtN1RGQmp3T1oxL2l5MVF5MzVEdUpB?=
 =?utf-8?B?WVhjQ240aS9QVzB5Rkc5dk51NG02UlgxRnZ3NzRWRDhMaHc3ZWlDV0VYbGxB?=
 =?utf-8?B?VG11dDdxKzVQcjVFUEpaSE4xcWNpVFNTd1V0TkM0QUpQYmMxNWVpTkQyeDNN?=
 =?utf-8?B?SkNER2VQNHN1Q3dKODhvNm03NUZJWXlERHRjSEhJckxhd2lGUVBJSEtraHNH?=
 =?utf-8?B?NDVkc1J4bUhYdzQyc1pucVJmbmNQREpnK2RIWWRoeGp0ZWFtbmxDRURQZlRo?=
 =?utf-8?B?a0l1aC9mZko3OTI2VzJTYUJsWm5iODNNS1ZkdmlORGlabWJuUGtiWWwweHlK?=
 =?utf-8?B?Y1NzdnBYekJzZDNMU3NZdTdGQzVmM3BXZnN1czkvTUpBV1luWkxUZTROd3Ra?=
 =?utf-8?B?cTMxQko3RzN4KzRRenRnajBiTEhhNGd2QzZFcU1YVGZtOG5TOGlsbFZFelFo?=
 =?utf-8?B?MS91VU1IbndwNEtvSnBPMUREa3UxQkhsUi9zN2YvL3JyV3ExcnBZMmVRcXhk?=
 =?utf-8?B?UjkveEYwOXh0NnNOMWV2dk1tOE1xUHFvL2xST0wwWnE3aWlzaUkyTXFIWWFq?=
 =?utf-8?B?NzRDdGpIN29SV2RBUDcwNjlJNHZhZnU4a2JUUmpCSHBtVVlNYU9HRzZUZHpR?=
 =?utf-8?B?akk4WFpqaGZsWm1BZFdENktiekVlMEw3N3VOaUhzWUVRWE1mYjR2R3pyUTcr?=
 =?utf-8?B?VWtYYmNQdlhIaW5hUzFYUlNsc0RSaGRsMFpjVlNJNWFHU3JhbVVWRnlwSVF4?=
 =?utf-8?B?M3JybXpBcGx3cHBOVTZyb2pENUxXNEx1ZmI0LzhUT2FhenBXYjJaVkJudi9G?=
 =?utf-8?B?dktpR0Jod1ROVi9jQ2Q5OGZFdWhRWjl2VUdVaXV6ZlV3UG94SUpRdnZXRXAx?=
 =?utf-8?B?eWx2Y0Y4TkY5MmEzRDRvNUhmRXE3NW9yQW02ZnB6YmtJdjNuQUNUVVlLYXZB?=
 =?utf-8?B?c2NteGJINjBYeWxpclNoeTdDVEg1ZkRHSElMRDFKNUVsL1dmcGo5R0tMVmlO?=
 =?utf-8?B?M3FDWHhOSlVVdUNqMTRiRDJVZTVFdFhMS3lvdUlUV25CWVFnWmhrUWJKdkhP?=
 =?utf-8?B?QktqekNvZ3lubktJTjIxK21LVlVudkVQVFpxaVAzNkh0eDNIZ0lLTVczNjA3?=
 =?utf-8?B?bWdxTDlMVzA2UzdOWFh5NTFsbFErUUpBRmJ1ckZCUDk2K0NpMmZRMS9pNEd0?=
 =?utf-8?B?SE5KakpDMXptOUlvNnFoL3ZkVXdUUWptOUlmbnJJKzZjNTdTOWNTalRaaHRU?=
 =?utf-8?B?QVpxYkJZMlZieG83cmNUWGROdXo2ZmRReWJRbVZLN24weFFlSytZeFpHamFB?=
 =?utf-8?B?SzRsRENqYm5WM0xESWVueGVSeG5MRUR0VUdGTUd4WnhIWnozQ050UFg1VGdW?=
 =?utf-8?B?UFA3OXZ3ZENkMy9EL1FKdU13UFJBU3BHNENUWEF1d2ppSitEK0tmdnlHZzc1?=
 =?utf-8?B?WWduN3ZDR3ZpNDhiZWhLSjAxb2F2ZlZ2OVFVYjFVM3YvWnpJRitzcTI5SzQ2?=
 =?utf-8?B?N1hYR1RwS09wZkJtS3ROUm14aXRxOTdYeXBOZHc4U2ZaeGZmQmpQemQ0dS9J?=
 =?utf-8?B?cTJud2xwK0FiUFd1NldYVXlMNFg0Qlo3QUoyeXg0VXI4OHdBdE83ODVIalRy?=
 =?utf-8?B?andONG5HdVhLQjRjWVQ1ZENRYTMwdVF1N01ITmIyM055UUZLUG9ySXFIcEFU?=
 =?utf-8?B?a1dUYUpuK09yT20vZVhvZythMGR1alpPWUgvaUY1YVRac1hsam92ZWE3OENP?=
 =?utf-8?B?NUJ1V05oWHhsUlNvSVJOUlVjcVA2T0U5QVJsT2JqZWtXVzV1VjArTE9EMXhL?=
 =?utf-8?B?T0kzL25MUUxjNFVIbTdXYjlITXI0dGRZNWZtNXVab1UrcVZ5dTN1Y3MzT2R2?=
 =?utf-8?B?TnVyUVBuaFo2d3VCZGFQdXpvbVdxS20vQytQdWlHdmh6VXRGY21IaFEvcW96?=
 =?utf-8?Q?qOX4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2VaSmdOZGszeTMrS3hMWW5DNEg5eXc1RjRUZnFTbllRanprc1FiLzIzVFBi?=
 =?utf-8?B?R3FBNmdWUXhmZWVaam8xQ1hzODhiR3p4WUJ4MHYyS1NqMlpqTnFGZng1Z3p2?=
 =?utf-8?B?ZjNNQk5DblM1ZWQrbS9Wekxrcm5XQXNUMWc5bEhCTGVzZFlvU1lNQU9rWnZS?=
 =?utf-8?B?dnFEZFFlN2tJR3N0WWwxaVcyM0sxczAvUURwcHNHR0E3SGNab0VldCtPNjUv?=
 =?utf-8?B?QWI0VlJJSi8vbDF4N3lhZkJvTHZIMTExdUphSkhCdHk4QWRwRTZZcEp3YSs0?=
 =?utf-8?B?dkNFa2RTQm1NYm5RRDRqSVIyRDcwWVBMSHR6all6QzRRVlhKYkNQU1drcVk4?=
 =?utf-8?B?ZDkzZjdKYzJrUkNTZHJEZjlDZVRWVzZWUVJhSHFUSlhpdWlNNEpFTW1tTkdR?=
 =?utf-8?B?OERzWlQyVlFUNnhxaUVzR0pMdXNKYmJLTnI5bmZPZjlISkcwNWJSNTR0elQv?=
 =?utf-8?B?TndJZ2ZqbUd5WnpoMldxQmxHQ1hGZjIyQ0NGekJjODlkaUxlWlZKWHJBb0tB?=
 =?utf-8?B?WnQvY2lNN0oxOUN0Z3E4c0VIZHJDNHdwckNXbzBLVzFCWFgvWGpqTFR4bGRO?=
 =?utf-8?B?ZTNtMzB3QW15Y2Rzb1R0NWpBNS90amxzaTB0TFkwbEJtck1LcEl2aUV1VVdo?=
 =?utf-8?B?Q2xoUG1KOGIvNWllaU9SUDB6MGpyUzA4ZStBNUx4UGtwanF2MEUrS0xUWEJD?=
 =?utf-8?B?UjlGcmhQVVpqcHluRVFoaDhYcW5GVlZqU1JYbUI2TndFTk1xM2NHa2I0bkYx?=
 =?utf-8?B?S2M1ZlVWNVhyR0w3M3lGdGtGKy9xdkZacDY0U3U5M1JnVDdmUHk3QUpLV0pj?=
 =?utf-8?B?UkV1R1oyYnBOVkEzdWx5M016Y0ZOUG8xKyt5MnNpSDYvWHZXUjJRSU80ZUpq?=
 =?utf-8?B?bEtKQWNLOUpPKzdnT0xxeUpNZ2NGMUNLbnl5b3BSYWg0Z1JoSlJZSHpPY0tL?=
 =?utf-8?B?eUFZdmduV2Q4eTIvUjNRbFo3MGpuR2cyUVpiQ3BZZnBxSXNhN0k1UXVTcmt3?=
 =?utf-8?B?djNMazlvMTJuMzVtYVpwSmFONi9LOFhISWlPSDlZemVBbUFvYW9Qam5iTnBD?=
 =?utf-8?B?STg2L3VTVkNsUUF2dlFNUEhVS04vcnRJaERrcEEyZFQzN2wycDJqV2I5Y2J4?=
 =?utf-8?B?d0NPQklqdkowTkMycjVOdmRWZkZhbm9lOHZramE3bTlpejlIZUs2MzVoT2dh?=
 =?utf-8?B?RGd6ZzdwZ0F1cU54eW5CUVpTRmR0c29LK3ViRE5uZVZ2WnFtUzdJVm1NcW1h?=
 =?utf-8?B?Vk5KL2lzUVJKZVRCakVmNk1qcHhkTkZ5U0dOcFphbFlUaEtZb3V2R2QwcW43?=
 =?utf-8?B?NG1haEh3aXdzZStzRTlpYUN0RlZ1Y3BjTVZ0RXl5RTZWajBBQzVhSWpHODQr?=
 =?utf-8?B?VXN5Mk9icGdDaXhuWEQrazErL3M0NFpLUjlmMFhCUWVPRFFFK2JwVFRrTUlT?=
 =?utf-8?B?dUszWGM5dEsrR2ZXSlFBUmxvcDFadE9BSEZ0QU40dFYrQy9WVjJEQVkwUTM0?=
 =?utf-8?B?L0tqVzl1TlFseHZDSUd4dzBsNjlKdG1LSVIrM1JtaTcvUHNqMmFENDFRUk95?=
 =?utf-8?B?dmN1QVI1SEhBV0tza1VLVDhpei9wKzg4SXdhMmg2OS9PSGZvejdmVHNRQ1dj?=
 =?utf-8?B?VXk2RHIxRGIvNHBvZ2ZSbzJtZDhxekdydnJscmloVTFkOGxuMXNrN1phZDhh?=
 =?utf-8?B?MWdFZ25XTnZqR2k1VS9GWVJyRUl1UW1TeVpJbkhRZERxTWZjUWNoclRPTWxR?=
 =?utf-8?B?NFVSM05uQjlvNUxJL2R2cVJDQzB4YlFRalg0emhXcUFZZS9aS2g1YUhTcHNx?=
 =?utf-8?B?MmVrT2FKRk9zdWVJSVZWbW1BbVBtMUtMVmJTYlJaYU90RENSZEc4bHBYYlY2?=
 =?utf-8?B?bnRWV1FqWjA1WWhRLzkvTDdTMERLZDR1UGNmRE5nN1FGL2JmdU9CNmVTZitl?=
 =?utf-8?B?S2ZETDNxMUxFUlljbFdLSy9PZURwMXpDUnVKRnFwbnAveEtXenp5K3hFNjM4?=
 =?utf-8?B?VDcrQmZzSTRsb09ub2VFWEZNT09iYVpoMFdjOEhycGp1bUdGWE5oS3kydzgy?=
 =?utf-8?B?ZEEwUmpvOWNSNEx2NXNLVWZwdVloc0JpYzhsbHdlakFFSkRvb25FQ0RBbUtE?=
 =?utf-8?B?SGpCQ0ZWWGcxVW5PWjJMMVk2TXc2VUlia0s2R29CQlZjb2lPV01pNmJzRlpy?=
 =?utf-8?B?am5yU2hTamN6WmE2TFcxVGJpY29Nc050am5FWXhJcnU1QURzMDgvNnA2UXRE?=
 =?utf-8?B?dFBZV2lMODE1d1RVY2IwcGRZT2QrYVRVRytoMnl1bHUvV3d1L0tQUTZmblNK?=
 =?utf-8?B?SWdaUEhPMUVwYmluaUp5aDhRMUNoSlJKTG9XV0J6K2xxUTVjakZWQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 066ccd0e-0a3b-4c4e-ed3a-08de62b9eb3a
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 00:19:39.0144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 20spjQd1hOcMxeBT1TP4J2WO9mbGpGzp9Gg2YQ0HeUVzfbUaTN9SI2E2i3N24xUlk+wgI+7sKnaDaU+RxXb7vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8507
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,kernel.org,gmail.com,linutronix.de,suse.com,linux.intel.com,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[12];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[rodrigo.vivi@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 9B2DDD2E32
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 05:22:05PM +0100, Marco Crivellari wrote:
> On Mon, Feb 2, 2026 at 5:21 PM Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> > [...]
> > series is
> >
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >
> > I just resent it for CI and will push to drm-xe-next as soon as I get
> > the greenlight from CI.
> >
> 
> Many thanks Rodrigo!

Thank you. Pushed to drm-xe-next.

> 
> -- 
> 
> Marco Crivellari
> 
> L3 Support Engineer
