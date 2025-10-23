Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A26C038AC
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 23:27:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D8410E957;
	Thu, 23 Oct 2025 21:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IXs1BAiq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F20310E957
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 21:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761254843; x=1792790843;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=H5o2wgw/jgGuGSixX1ZBhLSuL2U2UskbNTz8u8IJbCQ=;
 b=IXs1BAiq2g6PgaLgqSu6G1Sf5Hc/kjEzM5S8hCSU65PcGeHo+2PfTikU
 sAEmOx5stgpk8sJMNucYp6ij2LZEGmIwlUih1dvq4p7t+5ecJaXKWfGeJ
 Uj9CgHSY2dccgh4GAgB0iHCr5nR57D3AtPKsqds35IL0a6dMMSFz+zubr
 DlH+a79ZNsOCiMCDKQX324XJ1cAmJNv9GDoxmn8IHlcdrx869x/8KRVGW
 RGHOlwjh57VGlJ9zlwJgCygBwuH0iOgZZzNgnl864ZbeanV96OUVF80bl
 ut71PIO18s+Z0l+ZI6vGXE4DsNTEiuyFNIXew7oiFONbhibOylZqfw7qn Q==;
X-CSE-ConnectionGUID: l/cE8fnKR+ilw64Zi3Jr/w==
X-CSE-MsgGUID: QAHTrQQFRB2FVHu72mC9oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63343369"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="63343369"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 14:27:22 -0700
X-CSE-ConnectionGUID: 7dS3sQaxQOujbXEA615BVA==
X-CSE-MsgGUID: FzzlSoIJQUq5gp/6eU15hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="188653672"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 14:27:22 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 14:27:21 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 14:27:21 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.23) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 14:27:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yUlzVzn92f5gbsLKLFcE3/OROypM+s5Jd3vD75GzHmLhjqRD+XPHgQXJGiFSc5V03sKPE2xlSNJ9DIf7+tKbsXUXHQITMD5TIxcjFtmat3n392Cm2C7ykhhyRrsrLL/g99R/+3IbPQo+NdlTUnIoyL2j+GQ5W6OC9wu484Anys/2EyzaFOoYpoa7l91WI+OePo96lzCdJ7tTopv65zkTBR4r0DItzsf+zT+p/E7mif+yLEhQHgJE9wkAqSEX9ZW3NNgBpQkHtrV5/2F9pJbjUI26Zllrz0rRO7EkyYybQS30H0mSSaa5QHn9v/93m5kdzHTYy9JGlGdQYfR11dfR0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bI6pHwFaRpszb8dwdC2H7iE59OJ/8kmKV6u3U3NkYzw=;
 b=u2YqE/skUtnJgOu+3dWwMTq1bYEq/avKF4MKf+TtCAp8cCt5pYrWigDGedpol9A9cDEo5SikQM67qvkf/7vDrEnlRU+qAsHaUj0g9mM1mb8jf5+5MOFV8lyq27m7k4m/Vcos9XO7dfL/AVnBh8dHOjxWHlky05THu/lwOcu9ElOjJb+4jmcgqUe6q+la86vLY4NTawUj0iz7t5R/j3wTkgkVDZengUrbgIwhadj9YmQ/4bdK2NVoA+34ydWulQT2qv537LmFNqQ3dF1bUHwA0h7RwYNEBmjA7EsDeGi+ByqMv+E73GbEsoxr7J3IGls9BY+M1GsoE0QdooRt5u4AUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4808.namprd11.prod.outlook.com (2603:10b6:510:39::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 21:27:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 21:27:13 +0000
Date: Thu, 23 Oct 2025 14:27:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Philipp Stanner <phasta@kernel.org>
CC: Danilo Krummrich <dakr@kernel.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, Philipp Stanner <pstanner@redhat.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v2] drm/sched: Extend and update documentation
Message-ID: <aPqdr98ANKN53GKm@lstrano-desk.jf.intel.com>
References: <20251023143803.150978-2-phasta@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251023143803.150978-2-phasta@kernel.org>
X-ClientProxiedBy: MW4PR03CA0298.namprd03.prod.outlook.com
 (2603:10b6:303:b5::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4808:EE_
X-MS-Office365-Filtering-Correlation-Id: 909e20d3-2992-4215-b8a9-08de127aeeee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WFJpTkRaaGp2RlhhNk1KajhTZHJtVXdTQ1Y4MFIzN3FyZ3RESWZXcld6TEhs?=
 =?utf-8?B?ZzJUalViTEcvckdFSW04MlMxVGNwZXJpSFNmdTVPRktyQTJQeW1ZYkF0N3BJ?=
 =?utf-8?B?UU42SVpUMVcwSU1aZUs5T2pDVXIvelJraGFlbDVkMFpDMittUUdNWWZnclJy?=
 =?utf-8?B?cmhpcElzSlQyY3plcm4wRlFTSUhZSWdSdGlzTHlkQkJrQ3pRNzAxZTNzU0cr?=
 =?utf-8?B?UjByeFBnZE5wdlVPNE9zSnFRSnhIaTNJbGhLeEdPYzNIeTZFaDRLdk1mbGRN?=
 =?utf-8?B?TnMyL29BUFYrV0tjMVhSK2t5cGQyME8rUlFKYWErMGd0MHQ3TnFyNEdzczNE?=
 =?utf-8?B?dUZCempZSHg4VEs3R2NiTGFpRzdESndYajVsMk5rYjE4Y3o4MTJqb0NVcEdE?=
 =?utf-8?B?bCtpNkNhL2drQVRGNUt6aktGdDZhVVppRGV6Zm9LVDBGc21RRFNUTkxIZTMz?=
 =?utf-8?B?anpFUzhrREh3VkhWYUs1dU1maFAycVFwYTBuZk9ZcUVvRENnMStuZS9NUmxN?=
 =?utf-8?B?aVhWTUUvUTNHaWlHaVFQaG9KazhSNGVBR2U3OFZhMklYR3ZUV2h2Q3BsNWtT?=
 =?utf-8?B?a0Jka1FiUElkd0lsK1k4RjRIL1J5RW85Z3pIeklwZDZVTFRxS3M3eXFncEhS?=
 =?utf-8?B?aSswYkVSZFVwNG9hbnIxZ0pkR1poNk1vY0ZCbUlTNGtwK3NXQ2Vnb0J2bnZj?=
 =?utf-8?B?eHFOLzNVb2lIckVlTWkra0c2VDZIa2dHcHh1NGhzSzdJTEJpWXE3TzgvNUo1?=
 =?utf-8?B?R3RsWjEydHlmTHptc1VtanAyREd1MkZHT2grOStrZEZaMWl4ZEdKOEVPelha?=
 =?utf-8?B?YXRpdkNmNStiU21LVi82d3pHVHYzRndEVHA1NkZhNzZRNzRsMXRERkRKTnVF?=
 =?utf-8?B?Q3dmWEZLZ1Rya0RmM2xEUXErakRSNTloVWw0UkwrbFZtdHZ1NWZMaGFkRndH?=
 =?utf-8?B?b2VDaVFNRUEzYjhHY3duUWJUNHlMWGQrcVhmQWRIVXZUZUNHV0ZzZm5KOFRI?=
 =?utf-8?B?a0pFRFRYZUVUcTBFZTRBMDkrSVM5K0x6Vlg4aWZHUW83bU9UNWNiZUdoQU1T?=
 =?utf-8?B?OFFQWEFnSDhzT0gvTWVWa1ZWTXBrck1oUHRyWUE3dXJqSHFFZDlEUmFmaXpw?=
 =?utf-8?B?WFErVm5LbEcwWnJjVTV6czhNcXJkazUwSW5zS214ZTI0MzJDaGg3bjFvVldq?=
 =?utf-8?B?WmliSEtFQkh2T0lLQWxYRjZwdWx5ZnUzS0tFM3ZWMExFakpnVWdjcG80aVF5?=
 =?utf-8?B?eE1IL3FlVG40N2k2dWZPU3hGTkQ0NGZHR2xHTHNqTzRIdGQvZnRjbUNaZk8z?=
 =?utf-8?B?RytOSkxpY3g1ZDI1MnhlWDMvVERlY3IrUmxCczhNNyt1RTlkd1hOcTM5MXls?=
 =?utf-8?B?NWNxU25rRUhIMTYyUnZhK3l2bmdKdmdjdjkvZFluRm9SSFpYWlArT0NIZ2Ni?=
 =?utf-8?B?bXoyTDFocWZtdzFRWjk1dEFRTHl0ak5XZW9CQUlQNVdieERweCtNSXBDSHFD?=
 =?utf-8?B?YzlTN3ZtdFZ1NXlLTDF4Unh1WVV5NWduUmRqRmdoanN5L1BDQ2JoVkg1VVpt?=
 =?utf-8?B?U2t6aW8yNHlUVmtyZ2xVRWorZjVzd2VRTU0zSThMVzBOR1RRdGVSSTFXWVZW?=
 =?utf-8?B?WG9NbGR1Y2JMTDdqb0JXMWZyeGdNeGx2L2UwQ0pKUXh0QzNrWEY4VjNVWXo4?=
 =?utf-8?B?NXl1SW1MNE15bmZMQjN1R3JjWXI2RTBEN1pTT0NZWmJleEdhWG54MWZuZkMx?=
 =?utf-8?B?cnJCWVMyajI4bmZ0aW5JQXJ6MEpnTTVRWHVEaGVYSTNmMWZZTVRnWElic0kw?=
 =?utf-8?B?ZERGOURYQUlKazQvRlY2U29YdkNHUi9FdHNQdFJYQ0hpVUVUNnprTnpwb2ZD?=
 =?utf-8?B?ODU0a3JEcGt6ZFovMDZySWl3a1FpcW1VSmdBRXNlVFlQSWc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzdaekVtTVRseXZDaXZpbHk2dFJ5NDQwYTBtb2ZuYzZ6dG9OVXZ4WW5UWFdR?=
 =?utf-8?B?Q0VPSHUyOERsTDc1NmRGZk0vY2JUancwZFAzTktZUU5VTHdIRmxONUZyVjBC?=
 =?utf-8?B?TzVXOGdhdDZNcE41TkZtR0JPLzAvNjRNenVNSHFFTENaV3lYNFFDb2ovRnlM?=
 =?utf-8?B?OHRPT0JQcTJDc0d1RHVCeDJKKytQaFlDL01GTy9MbXd1a2FyRDcwRUt3c1hV?=
 =?utf-8?B?UDlFc1lyUlJpOFpYODZWU1k2UGQrMG81bHpIcFJqUFQvQ3cxTGdYZWlZVFp5?=
 =?utf-8?B?MHBDZjVZYUpPaG1zTytYS1Fnci9kd2t0c2VseDE5aEdvZXdGZG9IQWJtVDNL?=
 =?utf-8?B?UG9vVlM1dTdxS3FXbC9yNHU4SHlDZS9DUUw5YlZHOFdsZnBiOS9TdDJxcHlz?=
 =?utf-8?B?RXFOcGYrQ0QvV1FSYWc0K0N0aDl3b0dSZWZEcmloTm8vRVhxQmRhaDJZRHFE?=
 =?utf-8?B?M1ppbjk1Q1hKRzd0K3FWZ3VyZWZ5ekhsSXdCWDZWR0IxRHl5cHNqR0lCcCtK?=
 =?utf-8?B?cGhXYXB4SFVxQXowTnNkM0RTK1NBRk4rUFdNMld5bWlPSXpmYnlkMWZGVklO?=
 =?utf-8?B?SzVsUlE2WUtxcXdGcjJLVE05TXVJV3BObS9pczBtMklwY2FwY3RKdkxKZER2?=
 =?utf-8?B?UWQ2NjRVT05yOGNPa2ZSb1VVVTFha25uZnNadTNjdUxlV2hBa0UzVzQ0NzZ4?=
 =?utf-8?B?Q3FlRjgyQWtCZXFDUTBLM3l2bnU2OWFTK2szT3VLb3lER0Jub3NSNXZuYTZ1?=
 =?utf-8?B?bG5ZKzdzbXNOQm5qWEdzNmI1MGlFRGVsbDNDUUU4NjR0eVRLOFhhUmRQck1K?=
 =?utf-8?B?UjQySmZQT3BpUy8yVUdzdyt4YkRoVjM2WVRQSXYwbDFrT0pmSzhvZ2llZ2dn?=
 =?utf-8?B?ZFdRL25HUDJHOVhGczFzNXlVdXVobjNYVDdlQnpiOHBSZk90NDEvUnBVK2pr?=
 =?utf-8?B?U2JyUHVNM2dHaGRXMzJVdFEyMEh6VmcxTUVZK25UYmQva09JRnVuM3UrZUlP?=
 =?utf-8?B?cUNBcURCSWxCczIrR2pXUzlpdXV1azQra29zbG1XMHl4UEp6ZzZiVkZ4RG0x?=
 =?utf-8?B?cDNkWGVablBHWFRERkVwaUZOQW5UZFJOOXBpTW9TMklYZ1R2VmQzNjhsNzJw?=
 =?utf-8?B?RmZrQTJDR3ZsbW5HZDVyRGwrWWVJbzdCVTJKNDVHS2FRRjFFbGIzUDUvTkxm?=
 =?utf-8?B?cG9VSDgzN01TYlJsVXpsSDZFL3Fva0FKOURrV3VENVZwWUNOZUhadkI1bGJw?=
 =?utf-8?B?SVVFajMvUG5kMDBzbGY0YUt3T05tUG9mVUt2d2xIczd0SkxCNW5UVFE3allD?=
 =?utf-8?B?Y00rd2Z1QVNwais3NjMwUkNPRHQ4bGNFR1hDdXNPQms5d1NGWWdsS1NlQlNO?=
 =?utf-8?B?amJ5TXF2SXN4ZkN0MHZVVVcwYVZESkMxWDc2anpVY1B0bkNNTmJtaitFU0JT?=
 =?utf-8?B?WWk0NDFlMTZRbFE1UDZMeHNFSlpXYmlseVBYSk5JRjdacEZ5RFNxNFk1SUta?=
 =?utf-8?B?WVZuaGRNUERMcTFMbG9vWEFiZVRZU0JKUy8xL3BuTE5hQTJlVjlUNm9DVng4?=
 =?utf-8?B?enZFMnY5blVwYkV2cFNkYU0wdDh1ZHpHOEtldUxHaG5GZ3A2bjNySGM4Ujh0?=
 =?utf-8?B?R0p5MTdkQlk0eGNqOERtTUtIZ3VIRFhzUzdjdnhhVTBnL01wbWJGOWd1M2dL?=
 =?utf-8?B?Q1ZJUkF0b1VQdTVob293aFlma2NVcjgwbmhzbGo0K2gzcDFKQjBNVWE3dS8z?=
 =?utf-8?B?MkNRTlYydjhKV3QxeVllVnQ4WWtMc3ZqZWFSaGdSelFNMGF1aCt0c0RMNm5q?=
 =?utf-8?B?OVAwa0Jyd2RGZkJDMmN4UGE1dkR5ODhSNFRSYm92d0d6UStPSElIOEN3MGNQ?=
 =?utf-8?B?K3kvSVk3YWc5RWlFeVFZMU5mdGNCR0xVMHdLRTN6UExuQ1N2dEVaWmk2MFBw?=
 =?utf-8?B?R0lJeHg1NHFQQUlaOWR5d1ZwbExMOE9rK3Fsb1JJS0E5TUNweE9SdmtXckhV?=
 =?utf-8?B?SjkvTDBBUVl6QTlGdW1xVmQxakRQRXZVS2tmZi9mQ0VONkVVSURFR1pLdDlT?=
 =?utf-8?B?Y2JwVmllNkMxSlJzUU1HQ1BPbllsbEFtRUtzS3VLbFFEVHB6ZVpkQzZuYzZK?=
 =?utf-8?B?eGorME1saE5GRm9EeTZ1REFudDdYVjBFWlRCU1BVT0RXUmNQWVlNWHpZY050?=
 =?utf-8?B?RWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 909e20d3-2992-4215-b8a9-08de127aeeee
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 21:27:13.8838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Es0GF6QOprJotzj5+5mytr3ig2jwozQADxsdP/z/TfHgSr+lvnXB3EL+RvpCHKkcX6Jegpj0SMZXK6155dZv1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4808
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

On Thu, Oct 23, 2025 at 04:38:04PM +0200, Philipp Stanner wrote:
> From: Philipp Stanner <pstanner@redhat.com>
> 
> The various objects and their memory lifetime used by the GPU scheduler
> are currently not fully documented.
> 
> Add documentation describing the scheduler's objects. Improve the
> general documentation at a few other places.
> 
> Co-developed-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>

This is great documentation—thanks for writing it up. It clarifies
several bugs I've noticed in multiple NPU drivers over the past year
related to reclaim, making it clear that these behaviors are not
allowed. Also, check out [1], which enforces some of the reclaim rules
outlined here.

A couple of minor nits below, but I'm inclined to RB.

[1] https://patchwork.freedesktop.org/series/156284/

> ---
> Changes in v2:
>   - Fix some typos. (Bagas Sanjava)
> ---
>  Documentation/gpu/drm-mm.rst           |  36 ++++
>  drivers/gpu/drm/scheduler/sched_main.c | 229 ++++++++++++++++++++++---
>  include/drm/gpu_scheduler.h            |   5 +-
>  3 files changed, 239 insertions(+), 31 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index d55751cad67c..95ee95fd987a 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -556,12 +556,48 @@ Overview
>  .. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>     :doc: Overview
>  
> +Job Object
> +----------
> +
> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> +   :doc: Job Object
> +
> +Entity Object
> +-------------
> +
> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> +   :doc: Entity Object
> +
> +Hardware Fence Object
> +---------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> +   :doc: Hardware Fence Object
> +
> +Scheduler Fence Object
> +----------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> +   :doc: Scheduler Fence Object
> +
> +Scheduler and Run Queue Objects
> +-------------------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> +   :doc: Scheduler and Run Queue Objects
> +
>  Flow Control
>  ------------
>  
>  .. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>     :doc: Flow Control
>  
> +Error and Timeout handling
> +--------------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> +   :doc: Error and Timeout handling
> +
>  Scheduler Function References
>  -----------------------------
>  
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 46119aacb809..4ade766b8f00 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -24,48 +24,221 @@
>  /**
>   * DOC: Overview
>   *
> - * The GPU scheduler provides entities which allow userspace to push jobs
> - * into software queues which are then scheduled on a hardware run queue.
> - * The software queues have a priority among them. The scheduler selects the entities
> - * from the run queue using a FIFO. The scheduler provides dependency handling
> - * features among jobs. The driver is supposed to provide callback functions for
> - * backend operations to the scheduler like submitting a job to hardware run queue,
> - * returning the dependencies of a job etc.
> + * The GPU scheduler is a shared infrastructure intended to help drivers
> + * managing command submission to their hardware.
>   *
> - * The organisation of the scheduler is the following:
> + * To do so, it offers a set of scheduling facilities that interact with the
> + * driver through callbacks which the latter can register.
>   *
> - * 1. Each hw run queue has one scheduler
> - * 2. Each scheduler has multiple run queues with different priorities
> - *    (e.g., HIGH_HW,HIGH_SW, KERNEL, NORMAL)
> - * 3. Each scheduler run queue has a queue of entities to schedule
> - * 4. Entities themselves maintain a queue of jobs that will be scheduled on
> - *    the hardware.
> + * In particular, the scheduler takes care of:
> + *   - Ordering command submissions
> + *   - Signalling dma_fences, e.g., for finished commands
> + *   - Taking dependencies between command submissions into account
> + *   - Handling timeouts for command submissions
>   *
> - * The jobs in an entity are always scheduled in the order in which they were pushed.
> + * All callbacks the driver needs to implement are restricted by dma_fence
> + * signaling rules to guarantee deadlock free forward progress. This especially
> + * means that for normal operation no memory can be allocated in a callback.
> + * All memory which is needed for pushing the job to the hardware must be
> + * allocated before arming a job. It also means that no locks can be taken
> + * under which memory might be allocated.
>   *
> - * Note that once a job was taken from the entities queue and pushed to the
> - * hardware, i.e. the pending queue, the entity must not be referenced anymore
> - * through the jobs entity pointer.
> + * Optional memory, for example for device core dumping or debugging, *must* be
> + * allocated with GFP_NOWAIT and appropriate error handling if that allocation
> + * fails. GFP_ATOMIC should only be used if absolutely necessary since dipping
> + * into the special atomic reserves is usually not justified for a GPU driver.
> + *
> + * Note especially the following about the scheduler's historic background that
> + * lead to sort of a double role it plays today:
> + *
> + * In classic setups N ("hardware scheduling") entities share one scheduler,
> + * and the scheduler decides which job to pick from which entity and move it to
> + * the hardware ring next (that is: "scheduling").
> + *
> + * Many (especially newer) GPUs, however, can have an almost arbitrary number
> + * of hardware rings and it's a firmware scheduler which actually decides which
> + * job will run next. In such setups, the GPU scheduler is still used (e.g., in
> + * Nouveau) but does not "schedule" jobs in the classical sense anymore. It
> + * merely serves to queue and dequeue jobs and resolve dependencies. In such a
> + * scenario, it is recommended to have one scheduler per entity.
> + */
> +
> +/**
> + * DOC: Job Object
> + *
> + * The base job object (&struct drm_sched_job) contains submission dependencies
> + * in the form of &struct dma_fence objects. Drivers can also implement an
> + * optional prepare_job callback which returns additional dependencies as
> + * dma_fence objects. It's important to note that this callback can't allocate
> + * memory or grab locks under which memory is allocated.
> + *
> + * Drivers should use this as base class for an object which contains the
> + * necessary state to push the command submission to the hardware.
> + *
> + * The lifetime of the job object needs to last at least from submitting it to
> + * the scheduler (through drm_sched_job_arm()) until the scheduler has invoked
> + * &struct drm_sched_backend_ops.free_job and, thereby, has indicated that it
> + * does not need the job anymore. Drivers can of course keep their job object
> + * alive for longer than that, but that's outside of the scope of the scheduler
> + * component.
> + *
> + * Job initialization is split into two stages:
> + *   1. drm_sched_job_init() which serves for basic preparation of a job.
> + *      Drivers don't have to be mindful of this function's consequences and
> + *      its effects can be reverted through drm_sched_job_cleanup().
> + *   2. drm_sched_job_arm() which irrevocably arms a job for execution. This
> + *      initializes the job's fences and the job has to be submitted with
> + *      drm_sched_entity_push_job(). Once drm_sched_job_arm() has been called,
> + *      the job structure has to be valid until the scheduler invoked
> + *      drm_sched_backend_ops.free_job().
> + *
> + * It's important to note that after arming a job drivers must follow the
> + * dma_fence rules and can't easily allocate memory or takes locks under which
> + * memory is allocated.
> + */
> +
> +/**
> + * DOC: Entity Object
> + *
> + * The entity object (&struct drm_sched_entity) is a container for jobs which
> + * should execute sequentially. Drivers should create an entity for each
> + * individual context they maintain for command submissions which can run in
> + * parallel.
> + *
> + * The lifetime of the entity *should not* exceed the lifetime of the
> + * userspace process it was created for and drivers should call the
> + * drm_sched_entity_flush() function from their file_operations.flush()
> + * callback. It is possible that an entity object is not alive anymore
> + * while jobs previously fetched from it are still running on the hardware.

This is not how Xe has implemented it. Instead, on FD close (or queue
close, for that matter), we trigger our entity through a GPU command and
immediately timeout all jobs, signaling them accordingly. Technically,
the object entity can outlive the FD, but the effects of the FD close
are externally visible. The complete teardown process can outlive the FD
as well, since it involves multiple ping-pong steps with our firmware. I
believe this approach is also valid.

> + *
> + * This is done because all results of a command submission should become
> + * visible externally even after a process exits. This is normal POSIX
> + * behavior for I/O operations.
> + *
> + * The problem with this approach is that GPU submissions contain executable
> + * shaders enabling processes to evade their termination by offloading work to
> + * the GPU. So when a process is terminated with a SIGKILL the entity object
> + * makes sure that jobs are freed without running them while still maintaining
> + * correct sequential order for signaling fences.
> + *
> + * All entities associated with a scheduler have to be torn down before that
> + * scheduler.
> + */
> +
> +/**
> + * DOC: Hardware Fence Object
> + *
> + * The hardware fence object is a dma_fence provided by the driver through
> + * &struct drm_sched_backend_ops.run_job. The driver signals this fence once the
> + * hardware has completed the associated job.
> + *
> + * Drivers need to make sure that the normal dma_fence semantics are followed
> + * for this object. It's important to note that the memory for this object can
> + * *not* be allocated in &struct drm_sched_backend_ops.run_job since that would
> + * violate the requirements for the dma_fence implementation. The scheduler
> + * maintains a timeout handler which triggers if this fence doesn't signal
> + * within a configurable amount of time.
> + *
> + * The lifetime of this object follows dma_fence refcounting rules. The
> + * scheduler takes ownership of the reference returned by the driver and
> + * drops it when it's not needed any more.
> + *
> + * See &struct drm_sched_backend_ops.run_job for precise refcounting rules.
> + */
> +
> +/**
> + * DOC: Scheduler Fence Object
> + *
> + * The scheduler fence object (&struct drm_sched_fence) encapsulates the whole
> + * time from pushing the job into the scheduler until the hardware has finished
> + * processing it. It is managed by the scheduler. The implementation provides
> + * dma_fence interfaces for signaling both scheduling of a command submission
> + * as well as finishing of processing. &struct drm_sched_fence.finished is the
> + * fence typically used to synchronize userspace, e.g., in a &struct drm_syncobj.

Is it ever not the finished fence? Early in Xe, I originally used the
hardware fence, and it caused all sorts of trouble. One reason the DRM
scheduler is a well-designed system is that the finished fence can be
installed universally.

I also suggest we add a wrapper to access the finished fence, so drivers
don’t need to dig deep into scheduler objects to retrieve it.

> + *
> + * The lifetime of this object also follows normal dma_fence refcounting rules.
> + */
> +
> +/**
> + * DOC: Scheduler and Run Queue Objects
> + *
> + * The scheduler object itself (&struct drm_gpu_scheduler) does the actual
> + * scheduling: it picks the next entity to run a job from and pushes that job
> + * onto the hardware. Both FIFO and RR selection algorithms are supported, with
> + * FIFO being the default and the recommended one.
> + *
> + * The lifetime of the scheduler is managed by the driver using it. Before
> + * destroying the scheduler the driver must ensure that all hardware processing
> + * involving this scheduler object has finished by calling for example
> + * disable_irq(). It is *not* sufficient to wait for the hardware fence here
> + * since this doesn't guarantee that all callback processing has finished.
> + *
> + * The run queue object (&struct drm_sched_rq) is a container for entities of a
> + * certain priority level. This object is internally managed by the scheduler
> + * and drivers must not touch it directly. The lifetime of a run queue is bound
> + * to the scheduler's lifetime.
> + *
> + * All entities associated with a scheduler must be torn down before it. Drivers
> + * should implement &struct drm_sched_backend_ops.cancel_job to avoid pending
> + * jobs (those that were pulled from an entity into the scheduler, but have not
> + * been completed by the hardware yet) from leaking.
>   */
>  
>  /**
>   * DOC: Flow Control
>   *
>   * The DRM GPU scheduler provides a flow control mechanism to regulate the rate
> - * in which the jobs fetched from scheduler entities are executed.
> + * at which jobs fetched from scheduler entities are executed.
>   *
> - * In this context the &drm_gpu_scheduler keeps track of a driver specified
> - * credit limit representing the capacity of this scheduler and a credit count;
> - * every &drm_sched_job carries a driver specified number of credits.
> + * In this context the &struct drm_gpu_scheduler keeps track of a driver
> + * specified credit limit representing the capacity of this scheduler and a
> + * credit count; every &struct drm_sched_job carries a driver-specified number
> + * of credits.
>   *
> - * Once a job is executed (but not yet finished), the job's credits contribute
> - * to the scheduler's credit count until the job is finished. If by executing
> - * one more job the scheduler's credit count would exceed the scheduler's
> - * credit limit, the job won't be executed. Instead, the scheduler will wait
> - * until the credit count has decreased enough to not overflow its credit limit.
> - * This implies waiting for previously executed jobs.
> + * Once a job is being executed, the job's credits contribute to the
> + * scheduler's credit count until the job is finished. If by executing one more
> + * job the scheduler's credit count would exceed the scheduler's credit limit,
> + * the job won't be executed. Instead, the scheduler will wait until the credit
> + * count has decreased enough to not overflow its credit limit. This implies
> + * waiting for previously executed jobs.
>   */
>  
> +/**
> + * DOC: Error and Timeout handling
> + *

Should this section mention DRM_GPU_SCHED_STAT_NO_HANG usage?

> + * Errors are signaled by using dma_fence_set_error() on the hardware fence
> + * object before signaling it with dma_fence_signal(). Errors are then bubbled
> + * up from the hardware fence to the scheduler fence.
> + *
> + * The entity allows querying errors on the last run submission using the
> + * drm_sched_entity_error() function which can be used to cancel queued
> + * submissions in &struct drm_sched_backend_ops.run_job as well as preventing
> + * pushing further ones into the entity in the driver's submission function.
> + *
> + * When the hardware fence doesn't signal within a configurable amount of time
> + * &struct drm_sched_backend_ops.timedout_job gets invoked. The driver should
> + * then follow the procedure described in that callback's documentation.
> + *
> + * (TODO: The timeout handler should probably switch to using the hardware
> + * fence as parameter instead of the job. Otherwise the handling will always
> + * race between timing out and signaling the fence).
> + *

This might be a bit invasive, and honestly, I'm not sure if the
subsystem can handle it. I'd leave out this TODO for now. We can't
predict the future, so it's probably best not to try in the
documentation.

Matt

> + * The scheduler also used to provided functionality for re-submitting jobs
> + * and, thereby, replaced the hardware fence during reset handling. This
> + * functionality is now deprecated. This has proven to be fundamentally racy
> + * and not compatible with dma_fence rules and shouldn't be used in new code.
> + *
> + * Additionally, there is the function drm_sched_increase_karma() which tries
> + * to find the entity which submitted a job and increases its 'karma' atomic
> + * variable to prevent resubmitting jobs from this entity. This has quite some
> + * overhead and resubmitting jobs is now marked as deprecated. Thus, using this
> + * function is discouraged.
> + *
> + * Drivers can still recreate the GPU state in case it should be lost during
> + * timeout handling *if* they can guarantee that forward progress will be made
> + * and this doesn't cause another timeout. But this is strongly hardware
> + * specific and out of the scope of the general GPU scheduler.
> + */
>  #include <linux/export.h>
>  #include <linux/wait.h>
>  #include <linux/sched.h>
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index fb88301b3c45..a97351435d9e 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -458,8 +458,8 @@ struct drm_sched_backend_ops {
>  	struct dma_fence *(*run_job)(struct drm_sched_job *sched_job);
>  
>  	/**
> -	 * @timedout_job: Called when a job has taken too long to execute,
> -	 * to trigger GPU recovery.
> +	 * @timedout_job: Called when a hardware fence didn't signal within a
> +	 * configurable amount of time. Triggers GPU recovery.
>  	 *
>  	 * @sched_job: The job that has timed out
>  	 *
> @@ -506,7 +506,6 @@ struct drm_sched_backend_ops {
>  	 * that timeout handlers are executed sequentially.
>  	 *
>  	 * Return: The scheduler's status, defined by &enum drm_gpu_sched_stat
> -	 *
>  	 */
>  	enum drm_gpu_sched_stat (*timedout_job)(struct drm_sched_job *sched_job);
>  
> -- 
> 2.49.0
> 
