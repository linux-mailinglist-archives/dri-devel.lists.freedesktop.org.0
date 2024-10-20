Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6330F9A55AE
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2024 20:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D1410E09E;
	Sun, 20 Oct 2024 18:07:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OIS3WMGE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A546110E021;
 Sun, 20 Oct 2024 18:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729447638; x=1760983638;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7SqIw7CPUCxMFb+3BXeZ/OMzKF2NGzTD9qtljoK0KI0=;
 b=OIS3WMGEZt9cmr5zUnjxZPpAY7kGZwWwnQHkbfAHMH5QgWE+yhoDJwzL
 Xs4MM+CP23uMegPuwRcNMfVPx/owwlZA4zlJwO7QBCJUVAIDdycgd/eNw
 S/LN2oV/+3T0Lij3Bkb6WrlKTh72La9mG7+JoOYsxjfjpSuyM1xVuxGPS
 8Ho7kKAINJItYIkLeeLl2Ey9JF1uGgKvHkdUqliDZDdNrTyZP2m5/XJ7U
 UKLyOGtDuw1e75fhLccAihCl9GW22jK+JeG6CXEAgGKT4kBlYi+hcq+do
 JOix9h/FF2YjCPBR0QZ7lyBWoNohT9rew9zgaD5mQn6ZGAzMi03zw6Sao Q==;
X-CSE-ConnectionGUID: n7BNPXsLRFmdg97uQP5Opw==
X-CSE-MsgGUID: 4tjJUxPwTaWDMZ5YnE51Wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="40318335"
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; d="scan'208";a="40318335"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2024 11:07:17 -0700
X-CSE-ConnectionGUID: bVGpdpbSQt2x6XWLBsXDFA==
X-CSE-MsgGUID: aLFesmK/QHqDZN/ZBiEA2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; d="scan'208";a="84379188"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Oct 2024 11:07:17 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 20 Oct 2024 11:07:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 20 Oct 2024 11:07:16 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 20 Oct 2024 11:07:16 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 20 Oct 2024 11:07:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LWoKVF6VtnNcQmvoy1O6+26c4jeJf6MncM3zprEIgQW0cEtxM07TWnw0+9yfVJnez2uCuYRgscOg1mXvBpcRLog/E3zzOO4fZaCOqPyRzeUffhAQBhr57ApwEyAoAbJ/WdzfDyqQ7w12vpCTCKGCvdC65dwsTu4g2gu2eE7n2bS5+lkyWsZzh2suvKa13Mk+YX1ZvS1Txdoew1Pj4zyI0e9PjZGPfgEbaLiNE11a5xSqV8sEFYx8sQGkQV7zjfZWOE2KyYwAWVyaCGW900hnUIGut5l1/pZsI/up0LXh9oYIcdkmD86mwMZRTKoHD+V3so9wmSkQEzXHEILrbXaZwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QzNgioX76vULzRQf8YmUBtF2MnyVixhD15zkbg3zjJg=;
 b=h35W6O74bV4u55LU4BUhnL3UmwcvNLRI4pWrSD3xoXlGKv+uJDMTJGL2uUDE7KEGW6p0KEvtQgFbh6jPQ68OwtIgdnu8ZyHd84SsAjOcjmUmMv3BcWaFnybc44nUvGjA5b2k4RrDMlvrqR8m57WlfQ/c6lsKuDOXVYOz/cqkt8AsH0rkHelSJOn/mid22FNKchPjbns7IpV5SHACqzBXopVyU6mC88TCPLGTIajatpF9eqd0c5YP1vdJZmNLMtROqrcjT0EhvwGysSLGsfwvDTlpRYU2PzKEUZa9FOWZhqZVnBARxqEA85gGhYaIozYr3PrMioPw3qekQb7D0U124g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ0PR11MB5038.namprd11.prod.outlook.com (2603:10b6:a03:2d8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Sun, 20 Oct
 2024 18:07:13 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.8069.024; Sun, 20 Oct 2024
 18:07:12 +0000
Date: Sun, 20 Oct 2024 18:06:12 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v1 4/5] drm/xe/bo: Create a new sg for dmabuf BOs that
 are associated with a VF
Message-ID: <ZxVGlKBvC3eAzqRy@DUT025-TGLU.fm.intel.com>
References: <20241012024524.1377836-1-vivek.kasireddy@intel.com>
 <20241012024524.1377836-5-vivek.kasireddy@intel.com>
 <Zwn4WOBAzhAs9wIW@DUT025-TGLU.fm.intel.com>
 <IA0PR11MB71853C7F2EB0A6677892FC3FF8462@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <IA0PR11MB71853C7F2EB0A6677892FC3FF8462@IA0PR11MB7185.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0089.namprd03.prod.outlook.com
 (2603:10b6:a03:331::34) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ0PR11MB5038:EE_
X-MS-Office365-Filtering-Correlation-Id: cb38df6e-a677-446f-2339-08dcf132055e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFZJWHZQR091NCtHSnY1ZDZERS9raHh2eGoxYTdJTzZYa0J3cTh3cnpWbGpU?=
 =?utf-8?B?eGtEbUM4amIzK2pISzhidFhpR1d6dEZaQ0xiU0Q5RWJqM3pFVlZFclRDRjZN?=
 =?utf-8?B?OFFwb1dEa3c1UGZHaXdKODdwTDhrbmZmSnVJWWZXQ0MyYTRncUNHd0VKSVRi?=
 =?utf-8?B?WjFXaXp2NEt4RFhrREh5UUw2cG5qWDlvOGFqUEhGQVFudGdhdjhITnlleHIy?=
 =?utf-8?B?SXlxNVR6NTlzSjBKQWtFVFJsa0liQ1RVMVZ0b1lFaVRjaWdBdzhSVmRlR0ho?=
 =?utf-8?B?R2ZCNGJYNktab2hDYytYWitmQlBPTmxIeFN3ZElwK3pZZXRZOGI1cUNqZ2pV?=
 =?utf-8?B?OEZSbmhZZE5aWEtKRldYNXJMMnY1Vzc2V0xrVGVmT0hqYllETXlaODc1SDVL?=
 =?utf-8?B?am85R2JIMjlGQkRVMysxY2VtMnNCU3A3QzdJaVY4REhRRGJrWFlvb3F4dFhR?=
 =?utf-8?B?cDBwZzNaWlg0ME16T2xpdHdOcWRMSmpzZXZtRCtMTk5OYzhPQ2xKUzlwczJn?=
 =?utf-8?B?K1ErSkxpeHdHQzFrVjlVY1RYdVB2MThRckI3cEVMem1PeFV6Y2hUck1oSmcx?=
 =?utf-8?B?WlJvYW05M0ZzaDI3ZGw0ZGdUaDAybmkyRzFabjM0dUZnNXc1V1pZUm1JcGNX?=
 =?utf-8?B?NnVtZjROYmcvVVFabHQvRWwyckdzcXdLS20wRTlFazBCSy9GVnUxbDE1N3dP?=
 =?utf-8?B?OWc3SHdNK0tQUW9ERGhweW9xYnEvenhHQTJ6MGsxVHBseGJqTGsvN0IyWXFQ?=
 =?utf-8?B?TXE0bzNRT3c0WlR2b21xTDRTZFloSm1ROGVJaUlKRWJNaFVxOHJ1RXEvUnRI?=
 =?utf-8?B?Q2VtbW1vajRZR0x2THlDV2w1L0lpNXdFY2JLNXhtMDJ4dHJob3Q2SjFmMWx2?=
 =?utf-8?B?VzEvYmM5Z2JMYWRrd0N5K0Q2d25CNnNjbDdzYVltd2ZSN3NFZUJ5OGJrTGhW?=
 =?utf-8?B?NjkzVTFKK3RqVnN5VjZoWUtINUVZVDF5YUhCMk9mVGMwM1dJNG5DcVBoN3d5?=
 =?utf-8?B?dld5L3JocUU2RE5jZS9yQWJHUE82blBaNGZ3Um1LdXViejVycEFsVGhSWmJk?=
 =?utf-8?B?V1E5M09mRmFHK1pvODdrdUdUZnlZc0RXUmZxOFl3TitpTkkvRFRlVGRSWFJ2?=
 =?utf-8?B?UTRSaTI5SlRidEV5VFRuTjBOYk56a2NwajUvSUd0NFM3MUxrNTdhSmw0SnJa?=
 =?utf-8?B?K2NEWDZRUC9RcTRqNC9hYVduWmJqaUM3ZnozOElRV3RFeHpJbXRvTW5IR2ZM?=
 =?utf-8?B?azYrV1c2QVpnMHRVVWVBSU1XbDl6cjFpc0FJT2JSQW1zRzMwZkZ5cEV6eXFs?=
 =?utf-8?B?RG1yQlgrMkladUVCSVQ3WWZObnpxazE5M2tZcEtHUWs0VGl5cEx4Z0dkbXUv?=
 =?utf-8?B?M1BFNUZJT2lUWVlyeXE3ZWE0TXFvNmpJTDg2T2FkV1FhR3dqaU1kTDlqSDZB?=
 =?utf-8?B?dFJib3RyaTJJRlo1L3F0RHA4L1JZN1FodVVuUlMvcDZkaGRXMlNwOVgzS0VL?=
 =?utf-8?B?TGtkMmZmSDNKaUJTeEUwdU5TdGNtclF3TGttVHpzNU1ScmRjZktGOUJLcDZz?=
 =?utf-8?B?Wk9wWUpCcm9DSEdLUHZJWmRTem1neGRqU1FwOWZqSFRIVDU3M0VJdGVwR3Qy?=
 =?utf-8?B?RVVMN2NULzNSSzJURTNiK3pSWW45K1FWRytmOFZoa3AzbzhieDNaUFRadm9B?=
 =?utf-8?B?NFRJbEhpYnVxQ3M2YVRBOGJUeU8ralZMMXRzcTFRcFpiREUrcnMwTFZRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGc3UmY1U0hSU2MyOS9SaFYweU5VWDA4ZXczSTBwamVsSUNJQ2FKRUQ2ekta?=
 =?utf-8?B?SEtoUnpwWk9NbVVEWjFwbTdlRU5PZkh4eG03R3NPVFNPSWZJRnY1dENqN3Ir?=
 =?utf-8?B?ZnltL1Q3aTdBUXNjRTRYemxLZlF1ZVJHMmRQUUs3dnRZN25SYm5tazdnQjJU?=
 =?utf-8?B?dE83T0ZjTFNULzlORDVaVGRHRzdZR0crK01ZWTRQYTU5aFdJczRneGhMOEZY?=
 =?utf-8?B?aFFJY1NzMWlZOWRKTHlrZ0w3cTFpY0JrY3c3SXZ6dE02WWdNdDVrS2xOZFpD?=
 =?utf-8?B?QzhxcjJoSUJxQy9QY3gya0FzUUtkNnpvK1Z2RTI0MkhiL0RONnNEOHZjL1Vn?=
 =?utf-8?B?R0lpZXJWelBLYkt2OTdWU3lCTGNkS24vS3NkaVFwTFdxT2ZQS1FtQzlVbzJ0?=
 =?utf-8?B?SlJ6SDF0NnkxcDkxakFWcUhOcnZUQXhTeTdJa1FtUXNJR0pCcGQycURXd0s5?=
 =?utf-8?B?eVZKZ3M4KzQyV1BaS0tuOHBBM2FqV1gvWFhHcm5UcWJmQkpRN01rb29GNE5y?=
 =?utf-8?B?R1lxc3dJZDgzc1lRMGxiNlY1cjk5QzkxWk93c0M2dHBPYXN1TWVDa2hjT0Jq?=
 =?utf-8?B?TmJjOElmM1hyc2ZvUGdvaUpjdGs0bzFSUzFYaUxJd1YxVkpFSVdHNkM0MFFK?=
 =?utf-8?B?RWROVXdXMzFZQWtlZGNINzB2UTZlTHR2M2YzVEFaUDF5dnZpMlpDSVVibWw3?=
 =?utf-8?B?MUE1czNlMzFkODlESG1JdDh2bjcrZjRjaUtOQWI2ZXpCOTAwSVN3eGp5TG41?=
 =?utf-8?B?QUVwTS8xWEQycDdhZnRtTzBwNWRDQXprRUFnS0MyTlNXQzRZT0ZpN3hUWTc2?=
 =?utf-8?B?emZUL0RSaHFGMll6anBZaE8yL1RJVEVKaDN3TDRJNlE2VkJsNnY5bVpOUENp?=
 =?utf-8?B?clpabTVpenhXWlpuQlNkTVYvTm4vRjR3Y080SVRtR29SRGkzeWxSb0pxWWpr?=
 =?utf-8?B?cjJuZU9jMm1CQklRcGpzb3dES2d6L2RZcnVPNVJWY09wVGdSdHJiNGZPVTIw?=
 =?utf-8?B?THZFQ3ZDekRZMTVkZC9kb0hTUGVQcW83M21SSWYxTDhGSW9zQUVnOTY5bW9R?=
 =?utf-8?B?SWZSUmRMZ0tPdzIvZTZ3dGNyR2xJLzM5bmlwUE5MUHY1VFpBTU9SRWU4MFRp?=
 =?utf-8?B?ZHlYNEpIbWIzd2UwZXFWTXNQWmsvNHRwTXg3dHlnaUtyekxmT2c0SytvYlhv?=
 =?utf-8?B?bmxpTVVZWFQzU3JCV0Y2b1FlQWpxeDY4bC9TRFZSdkh1RHdPUkcySFJ2Rk5K?=
 =?utf-8?B?OUNBMHpkeko0UXdGYTk1UVJsS0xFVGkyWVp1ZGE0S05JbVpDbFdnWkM5NExQ?=
 =?utf-8?B?OWVsOXM2WVRGM0tKMWZJWjY4VFNKdkRncWN5eXVFd3c1dVhOcjdXWjBIRkdn?=
 =?utf-8?B?VnRzcDhIbEhPRTQ5TmNldVg4K0pRbUJrclhOWldKd0xBZWdOc21TQTVRWkxF?=
 =?utf-8?B?cjg3TVUzNnpWOFBINm05S0kwUUxPa3g5TU9kaFJpRFlXaU1ldFo2OVNONHlX?=
 =?utf-8?B?eWZabTNOQkVxam1OWmlZWFY4T2pYaHJRd3ZJVExTN3FIUjNLL2d1dTVUSlZR?=
 =?utf-8?B?V1hYaDI4aXdhR3dSb2lYdnpkaW5lL05OanBLT2VUdzVVQjZObUxLdk50U3lD?=
 =?utf-8?B?OUticXdpNVVBQ1psam56RFFmSnUxa1lVYkxjNkFIbjVsdFQyY2F3NTFjek9u?=
 =?utf-8?B?YmlZNExtS1VlNkZOY2xwRFZ4bnd3T2ZSdndoVC9ad2tqTytFNnJyeEdDL055?=
 =?utf-8?B?c3Mxd1V6UUhBejdyT2ZuWmJISTdjZTBXNXNDMkRuTC9wSnFqNGdIWkN4YTBZ?=
 =?utf-8?B?S0RwRUJsZlZIaStLUTRncWhWOEJmeTBrcUM3S1gvMlIxNjdIR29SL08waDhm?=
 =?utf-8?B?N0ozbmx1ekM2N1pvTXMxdzlTYUFHSllvbUQ3NS96bFFZLzFHV3FtTlYrVllZ?=
 =?utf-8?B?QjJrRVJPZFUyTTFzN0E1bW9qRUgyZDhhNmZYTlZHZFhxbURYd255U3FtdFBN?=
 =?utf-8?B?eXBjWmUvUnhFNlZ1cEFCQ3VEYVE2YWFwQWpEbnpJcXA4VGt6Y2dhdFNYWEcw?=
 =?utf-8?B?YlUxT0ltRmRGZ2RoRkMrZGYrVVk4TGVLNDhRbGZ3aEk1aHVOeUNlTUtIcnNj?=
 =?utf-8?B?bHpoY3pCL0JDQ25TblRIclFGU05oOVF0dHJFNG5XQXJ2ekdFMnBHeW1Pb3Q3?=
 =?utf-8?B?Q2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb38df6e-a677-446f-2339-08dcf132055e
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2024 18:07:12.2152 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hLkjNRP3qa7AldSPvmvi/O0ffwTYGRQhrthEzSstV1pIJrF8nJNFBK+MvlCUpTrOotCMz3GsxFJj2nvhiUwjgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5038
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

On Tue, Oct 15, 2024 at 11:41:56PM -0600, Kasireddy, Vivek wrote:
> Hi Matt,
> 
> > 
> > On Fri, Oct 11, 2024 at 07:40:26PM -0700, Vivek Kasireddy wrote:
> > > For BOs of type ttm_bo_type_sg, that are backed by PCI BAR addresses
> > > associated with a VF, we need to adjust and translate these addresses
> > > to LMEM addresses to make the BOs usable by the PF. Otherwise, the BOs
> > > (i.e, PCI BAR addresses) are only accessible by the CPU and not by
> > > the GPU.
> > >
> > > In order to do the above, we first need to identify if the DMA addresses
> > > associated with an imported BO (type ttm_bo_type_sg) belong to System
> > > RAM or a VF or other PCI device. After we confirm that they belong to
> > > a VF, we convert the DMA addresses (IOVAs in this case) to DPAs and
> > > create a new sg and populate it with the new addresses.
> > 
> > I think using a SG list is a no-go. We have received pushback before [1]
> > about using a SG list as structure to hold DPA rather than dma-address.
> > The consensus was a SG list is not a generic structure to hold any
> > address [2], rather a specific structure for dma addressess.
> AFAIU, that would make sense if the SG list was exposed outside of the Xe
> driver but the SG list that is created by this patch is only used internally by
> the Xe driver. Would this still not be acceptable?
> 

I'd check with Thomas on this. I'm not hugely opposed, but if I remember
correctly, Thomas agrees with Jason in the links below that SG lists
shouldn't be used like this.

Certainly, making this internal to Xe makes it safer, though.

> > 
> > I'm pretty sure we will have define a new BO type (ttm_bo_type_devmem?)
> > and structure that can iterated on if we want to do something like this
> > unless we want to ignore the above feedback.
> Right, if using SG list is a no-go, then using some form of xe_res_cursor to
> iterate seems like the only other option.
>

Ah, yes. Since this is internal to Xe, it may be easy enough to use a
different cursor type here rather than touching TTM.
 
> > 
> > [1] https://patchwork.freedesktop.org/patch/574894/?series=128910&rev=1
> > [2]
> > https://patchwork.freedesktop.org/patch/574894/?series=128910&rev=1#co
> > mment_1070889
> > 
> > >
> > > Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_bo.c       | 108
> > ++++++++++++++++++++++++++++++-
> > >  drivers/gpu/drm/xe/xe_bo_types.h |   6 ++
> > >  2 files changed, 113 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > index c74c121ea7bb..64efe1b21f19 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -6,6 +6,7 @@
> > >  #include "xe_bo.h"
> > >
> > >  #include <linux/dma-buf.h>
> > > +#include <linux/iommu.h>
> > >
> > >  #include <drm/drm_drv.h>
> > >  #include <drm/drm_gem_ttm_helper.h>
> > > @@ -15,16 +16,19 @@
> > >  #include <drm/ttm/ttm_tt.h>
> > >  #include <uapi/drm/xe_drm.h>
> > >
> > > +#include "regs/xe_bars.h"
> > >  #include "xe_device.h"
> > >  #include "xe_dma_buf.h"
> > >  #include "xe_drm_client.h"
> > >  #include "xe_ggtt.h"
> > >  #include "xe_gt.h"
> > > +#include "xe_gt_sriov_pf_config.h"
> > >  #include "xe_map.h"
> > >  #include "xe_migrate.h"
> > >  #include "xe_pm.h"
> > >  #include "xe_preempt_fence.h"
> > >  #include "xe_res_cursor.h"
> > > +#include "xe_sriov_pf_helpers.h"
> > >  #include "xe_trace_bo.h"
> > >  #include "xe_ttm_stolen_mgr.h"
> > >  #include "xe_vm.h"
> > > @@ -543,6 +547,102 @@ static int xe_bo_trigger_rebind(struct xe_device
> > *xe, struct xe_bo *bo,
> > >  	return ret;
> > >  }
> > >
> > > +static struct pci_dev *xe_find_vf_dev(struct xe_device *xe,
> > > +				      phys_addr_t phys)
> > > +{
> > > +	struct pci_dev *pdev, *pf_pdev = to_pci_dev(xe->drm.dev);
> > > +	resource_size_t io_start, io_size;
> > > +
> > > +	list_for_each_entry(pdev, &pf_pdev->bus->devices, bus_list) {
> > > +		if (pdev->is_physfn)
> > > +			continue;
> > > +
> > > +		io_start = pci_resource_start(pdev, LMEM_BAR);
> > > +		io_size = pci_resource_len(pdev, LMEM_BAR);
> > > +
> > > +		if (phys >= io_start &&
> > > +		    phys < (io_start + io_size - PAGE_SIZE))
> > > +			return pdev;
> > > +	}
> > > +	return NULL;
> > > +}
> > > +
> > > +
> > > +static void xe_bo_translate_iova_to_dpa(struct xe_device *xe,
> > > +					struct sg_table *sg,
> > > +					struct sg_table *new_sg,
> > > +					struct pci_dev *pdev)
> > > +{
> > > +	resource_size_t io_start = pci_resource_start(pdev, LMEM_BAR);
> > > +	struct xe_gt *gt = xe_root_mmio_gt(xe);
> > > +	struct scatterlist *sgl, *new_sgl;
> > > +	int i, vfid = pci_iov_vf_id(pdev);
> > > +	dma_addr_t new_addr, bo_addr;
> > > +	struct iommu_domain *domain;
> > > +	phys_addr_t phys;
> > > +	u64 offset;
> > > +
> > > +	bo_addr = xe_gt_sriov_pf_config_get_lmem_addr(gt, ++vfid);
> > > +	domain = iommu_get_domain_for_dev(xe->drm.dev);
> > > +
> > > +	new_sgl = new_sg->sgl;
> > > +	for_each_sgtable_dma_sg(sg, sgl, i) {
> > 
> > I'm pretty sure this doesn't work if a single dma address of the input
> > 'sg' resolves to a non-contiguous physical DPA. In most cases this is
> > going to be contiguous though unless there is memory pressure or
> > unaligned allocations sizes. Assuming your testing didn't blow up, you
> > may not have hit a memory pressure situation where VRAM gets
> > fragmented.
> Yeah, I did not test exhaustively and also did not realize that that the BO
> (config->lmem_obj) backing the VF's lmem quota may not be contiguous.
> I'll try to figure out a way to test this scenario. However, for each SG entry,
> if I do something like:
> 
> offset = phys - io_start;
> new_addr = xe_bo_addr(config->lmem_obj, offset, sg_dma_len(sgl));
> 
> instead of
> 
> bo_addr = xe_bo_addr(config->lmem_obj, 0, PAGE_SIZE);
> offset = phys - io_start;
> new_addr = bo_addr + offset;
> 
> I believe this would probably work as expected even when lmem_obj is not
> contiguous (as it probes the buddy blocks) or if input SG has non-contiguous
> physical (DPA) ranges.
> 
> > 
> > I think only iommu_iova_to_phys is accurate for exactly 1 page unless
> > I'm missing something. See [3].
> IIUC, it seems to be valid for the segment of size sg_dma_len(sgl), for a given
> SG entry.
> 

So the SG list you are remapping here is set up in xe_dma_buf_map,
specifically for the VRAM case of xe_ttm_vram_mgr_alloc_sgt, right?

Yes, it appears each segment (sg_dma_len(sgl)) is a buddy block, so it
is contiguous. This does work, but it makes a lot of assumptions about
the lower layers, which is not ideal.

Each segment is still a DMA address, so it’s possible that
iommu_iova_to_phys is only accurate for exactly one page within the
segment. I'd prefer to code for that behavior, which will always work,
rather than making assumptions about a lower layer.

With all of the above, can we add a page-by-page DPA cursor? Thomas has
written one for SVM [4] [5]. That code will take a while to land, but I
think it can give you a template to build a cursor like this. Once that
lands, maybe we can combine these cursors.

Matt

[4] https://patchwork.freedesktop.org/patch/619812/?series=137870&rev=2
[5] https://patchwork.freedesktop.org/patch/619845/?series=137870&rev=2

> Thanks,
> Vivek
> 
> > 
> > [3]
> > https://elixir.bootlin.com/linux/v6.11.3/source/drivers/iommu/iommu.c#L2
> > 376
> > 
> > Matt
> > 
> > > +		phys = domain ? iommu_iova_to_phys(domain,
> > sg_dma_address(sgl)) :
> > > +			sg_dma_address(sgl);
> > > +		offset = phys - io_start;
> > > +		new_addr = bo_addr + offset;
> > > +
> > > +		sg_set_page(new_sgl, NULL, sg_dma_len(sgl), 0);
> > > +		sg_dma_address(new_sgl) = new_addr;
> > > +		sg_dma_len(new_sgl) = sg_dma_len(sgl);
> > > +
> > > +		new_sgl = sg_next(new_sgl);
> > > +	}
> > > +}
> > > +
> > > +static struct sg_table *xe_bo_create_new_sg(struct sg_table *sg,
> > > +					    struct xe_bo *bo)
> > > +{
> > > +	struct xe_device *xe = xe_bo_device(bo);
> > > +	struct iommu_domain *domain;
> > > +	struct sg_table *new_sg;
> > > +	struct pci_dev *pdev;
> > > +	phys_addr_t phys;
> > > +	int vfid;
> > > +
> > > +	if (!IS_SRIOV_PF(xe))
> > > +		return sg;
> > > +
> > > +	domain = iommu_get_domain_for_dev(xe->drm.dev);
> > > +	phys = domain ? iommu_iova_to_phys(domain, sg_dma_address(sg-
> > >sgl)) :
> > > +		sg_dma_address(sg->sgl);
> > > +
> > > +	if (page_is_ram(PFN_DOWN(phys)))
> > > +		return sg;
> > > +
> > > +	pdev = xe_find_vf_dev(xe, phys);
> > > +	if (!pdev)
> > > +		return sg;
> > > +
> > > +	vfid = pci_iov_vf_id(pdev);
> > > +	if (vfid < 0)
> > > +		return sg;
> > > +
> > > +	new_sg = kzalloc(sizeof(*new_sg), GFP_KERNEL);
> > > +	if (!new_sg)
> > > +		return sg;
> > > +
> > > +	if (sg_alloc_table(new_sg, sg->nents, GFP_KERNEL)) {
> > > +		kfree(new_sg);
> > > +		return sg;
> > > +	}
> > > +
> > > +	bo->is_devmem_external = true;
> > > +	xe_bo_translate_iova_to_dpa(xe, sg, new_sg, pdev);
> > > +
> > > +	return new_sg;
> > > +}
> > > +
> > >  /*
> > >   * The dma-buf map_attachment() / unmap_attachment() is hooked up
> > here.
> > >   * Note that unmapping the attachment is deferred to the next
> > > @@ -577,7 +677,7 @@ static int xe_bo_move_dmabuf(struct
> > ttm_buffer_object *ttm_bo,
> > >  		return PTR_ERR(sg);
> > >
> > >  	ttm_bo->sg = sg;
> > > -	xe_tt->sg = sg;
> > > +	xe_tt->sg = xe_bo_create_new_sg(sg, ttm_to_xe_bo(ttm_bo));
> > >
> > >  out:
> > >  	ttm_bo_move_null(ttm_bo, new_res);
> > > @@ -1066,6 +1166,8 @@ static void xe_ttm_bo_release_notify(struct
> > ttm_buffer_object *ttm_bo)
> > >
> > >  static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object
> > *ttm_bo)
> > >  {
> > > +	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
> > > +
> > >  	if (!xe_bo_is_xe_bo(ttm_bo))
> > >  		return;
> > >
> > > @@ -1079,6 +1181,10 @@ static void
> > xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
> > >
> > >  		dma_buf_unmap_attachment(ttm_bo->base.import_attach,
> > ttm_bo->sg,
> > >  					 DMA_BIDIRECTIONAL);
> > > +		if (bo->is_devmem_external && xe_tt->sg != ttm_bo->sg) {
> > > +			sg_free_table(xe_tt->sg);
> > > +			kfree(xe_tt->sg);
> > > +		}
> > >  		ttm_bo->sg = NULL;
> > >  		xe_tt->sg = NULL;
> > >  	}
> > > diff --git a/drivers/gpu/drm/xe/xe_bo_types.h
> > b/drivers/gpu/drm/xe/xe_bo_types.h
> > > index 8b9201775081..0fe619bc436d 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> > > @@ -67,6 +67,12 @@ struct xe_bo {
> > >  	/** @ccs_cleared */
> > >  	bool ccs_cleared;
> > >
> > > +	/**
> > > +	 * @is_devmem_external: Whether this BO is an imported dma-buf
> > that
> > > +	 * has a backing store in VRAM.
> > > +	 */
> > > +	bool is_devmem_external;
> > > +
> > >  	/**
> > >  	 * @cpu_caching: CPU caching mode. Currently only used for
> > userspace
> > >  	 * objects. Exceptions are system memory on DGFX, which is always
> > > --
> > > 2.45.1
> > >
