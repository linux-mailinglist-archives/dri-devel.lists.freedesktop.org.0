Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51138BF9163
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 00:43:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D2410E65A;
	Tue, 21 Oct 2025 22:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cO4WI3pe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CB6E10E657;
 Tue, 21 Oct 2025 22:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761086592; x=1792622592;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=4FR5hdkf8mLI+JfOHm/AJ6RHShH6+nIJ3ePjD977uig=;
 b=cO4WI3peHDNc7E1fZYy/jPLv4Bl0KE/xjow11J8KyC6KeSmJHGM/D+Li
 ntSizZMQU6ASEYYa7htKCSMZKIdgVrMs8Ge5YSdLtFF77cB36QH+4+yG3
 yE0v/FGhC+r7+OOjQwGM37EP+l/Be9II1DTwwo0C0sACnAlqGc2zomXiN
 pF6GNJ5N4C/LvLtgI1DLhWFdZvNF7kWQRZEXm8FN9NxqrPH/vHSH71dUj
 Fh1HNpdxSaeo+KbpBljrBuKzwUi3lk6e/LpXECuo2GlxaXLHKB6AIUYit
 bXLd2UPXa9r2/Ir5NqXR/7b83BStqrGxwXv9V5MOU+tvwTXCSqLHudHxw A==;
X-CSE-ConnectionGUID: yHuzQk6ZT/C3MKo7SITcEg==
X-CSE-MsgGUID: LzjUiLm7QTGQdpGNwxBLfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62926664"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="62926664"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:43:11 -0700
X-CSE-ConnectionGUID: 3GeMg0XsQNmkKDaBDb3dvQ==
X-CSE-MsgGUID: 4nkzbrrtTCCGllDO9kdkEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="183644436"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:43:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:43:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 15:43:09 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.33) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:43:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=srjk8XQhzAyJLryO0WrDHyL8cpV7znOt8pX5eRu/C+ybMJNTH9+7zcKinYPN2SWIv8ov7HTShEP+ZXOa5+5smGw6GTk3YfE2vTdGw9lDokDKNONeKrUK4C9hXce3pzdHD8L3atXGCUnCKauJncOdHiHy9dZieO6pv8SAqlKgChZYk2pWc3z2bZ6BxW9Qq7W5i+X3M39t3Ne2w3NgQPy/kx51Ma+gxfmjZMLg0BYb7rZBAHE+Y9KlX5usVDP9BLd4/FUABumeWXKznsL2My1WwnLl90tvMwXN3ixiRl63DC1ZFxaecuhiZqgkLPGeq+ijbcjsXPR2LvxpWW4fq1XNzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gPIDXNHrvH0gQwsHq1u7nwWuceVbCx/rcMs3HdGxpC8=;
 b=Uu2JEGYmk36D3IVCPNJDlViLu7mIfijCY42RjLKZ5DxCuWeTbAQi3ptpicpZyl1mFtcCtGPI++w6sVtlKS4sb1udz0Gj8sIufbdoEYNuJmIzV4vTzEHYl6dOp4vULK3iscJSx0z9Ydiff7sMB47hAQDutsv/u41d86lZChvMD5KsiV3Y6Y3UXGEcWT9neC61K4Q2kR8UsJlhNcURveAeeGecIxMuyDkMoJXsKoqcXkl2+/Lg/wPdekzzOErG5jiG+KeBEcBimdY2mdhkIo+NAgyHew3NidC0YLbBrl5qtrxEssH2DVpyi0Gv//HPvFJjJ+wkwLEflFrCb66CmB2YVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 22:43:08 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 22:43:07 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v2 12/26] drm/xe/pf: Remove GuC migration data save/restore
 from GT debugfs
Date: Wed, 22 Oct 2025 00:41:19 +0200
Message-ID: <20251021224133.577765-13-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251021224133.577765-1-michal.winiarski@intel.com>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0134.eurprd07.prod.outlook.com
 (2603:10a6:802:16::21) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB6753:EE_
X-MS-Office365-Filtering-Correlation-Id: 3acd1710-8f5a-4fdb-22e7-08de10f3341f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TEZHZmhyZjNrTkM4WWwvN0R0QTBUS2VGdUVGVDFqSXl4eWJLTVhoQU1EaVE4?=
 =?utf-8?B?T29sQWlPWmlqdS9PL2VSdlcydzlCdnU2ZnVCM29wNEpKOTFJU3EyNzB5d09j?=
 =?utf-8?B?bzVBaVNjRGt2VnlpSWh3NCs2Qm16RjV2MG9VSlloeDhiVE5QS3hQYjl4RldB?=
 =?utf-8?B?N2l0S0FXNWZQeWZETzhEbFQxdVdtUHJ0MTN1dGpHZVFxeGZFQVRCcjhwbXJJ?=
 =?utf-8?B?M1loREhmMWN3WG16bS9KbU1PcHFCV0NyYkt1SmQxTGoySTVabzNpQUpTMzNK?=
 =?utf-8?B?ZWNaT0NkRGxnRVRQSkplT2o3QjJPWVhFK3phUHdINzNmSjZSQUdzRjRSblFh?=
 =?utf-8?B?MVpvVkhoaUVlMG1VRkp2bWt2Y2puM0hNeUF6S0hDT3ZJZkFObGFjS3VuRkFs?=
 =?utf-8?B?VFdsVmxJaHpFbHY3aDhkazRkVjZXa0VhcE12QVVUbmE3UnZ2cHN2dVR0R1d3?=
 =?utf-8?B?anhxbnpsUDMzMFphaU9WWWhjdnFTZkw4Q2toTklmRDNhZzJra1lSWWI2S01J?=
 =?utf-8?B?ejRzRmsrTGJuM0lSSi9MUmFwdmxuNzRKVHpvaEFkeDVCa1FVQ25tdStUd0hR?=
 =?utf-8?B?TFVtL2lJS2xCbVNQeDl6WW9EOHZ4aW04TXExV3FaSko3UnNjTDJ2Q1A0VVcw?=
 =?utf-8?B?eXgvL0dnU0FTQ21OSC9rTmZvQUN3VkcwZEJvdHlBbUZENmdvVTR6VmZzL3h1?=
 =?utf-8?B?aDIxdGVjYUtaNXM4bGJ4TW1iME1DZzQ4UkY2WEs3djRsMkJzN1FNT0lhSlRG?=
 =?utf-8?B?d0wxSjJuYmJWWUd5dGRVWjB1eVdyL2dXaDA1cmdxMkpqQTVDOWR2SzhmbzV4?=
 =?utf-8?B?M3JNa0psWlFxYXhRQWVLR243bUxiQUQxR2VacUVteGFHVUJBVng2NnRqbnV4?=
 =?utf-8?B?Q0U1aDVJUUlvaFJOUjZYWkZaQVhSeGt0N0lHanpPTGNZWFBsUVNQWGl1WGts?=
 =?utf-8?B?Y1hwdFVhbG1EOU1HelhkNTVjYnRZdVFwRTJzS0dzcENRMEljc0ZmQVJwbGtm?=
 =?utf-8?B?dGgwYzBvenFGSVFqNURiRUxXZXRZU1FJTVIzcG55eUtaV0ljeHR3dUJ0SzdW?=
 =?utf-8?B?L3Z4TmQ2dFJXU1laODgvdkkzNmJjSVkrZnl6bTRyWVFnNGp5Tlkra213MWpW?=
 =?utf-8?B?L1RMZGRZVFZLUFdGUHJsWGlHdzJMaVRSM2lyeTBqK1NPTzg2dkhMZE00RVlZ?=
 =?utf-8?B?Y3dvTStBTUFTSzRwL21qaWQzTFNNcGpzRytzUG43RkFtQWMzeWN2SStjWFZW?=
 =?utf-8?B?anhPeDNVd3lFR0E0cTFGNHFhMmNVYXY1VmhmbmpkOWZucHl4VGJ1TDdaam45?=
 =?utf-8?B?WTN5cXpTVnh3NkVlMU9YRWRhR2VEZHgxSFhTcTNybnpmSVpzaTN3amdFaTA1?=
 =?utf-8?B?bWNGa2dSTUs5RW01OFFwWEFRNXBFV3BHWk9GL3BpZWFrRnhyTUNkbGhadG1K?=
 =?utf-8?B?bkp6NW1YUVlNUlk3c2xJaFd5emF4TWpHZ25EVGlQUjF3ZDMzZnQ4Y0N5ZmxT?=
 =?utf-8?B?UFNBZ2p4ejNuTnFBSURZaGxGZW5HUVdyMzQ5S0FjREJsbEhCdFJpYjJCOW52?=
 =?utf-8?B?eDhEOXcwSWt3REpyZG41ZkxIaC9JdGs3TFp5bjFSNlIxbzdobEpYdVJNb2xD?=
 =?utf-8?B?aCtVMkJyOWwrZ013RkpwdVVDWHE3Q2xxYytDOUlheVFYNjZydWtYQjZxc0hl?=
 =?utf-8?B?Mkg3RDJSWGkvb1daRk1GemV2YnNYS2RwUXdtdFVBUExsYTd0cXczNXpjMWp2?=
 =?utf-8?B?eldRMTNqMkZSdkdJLzFMbUM3TndZNnozYkFSZXhqb0g3V0NhQkFzZ3hzWVY1?=
 =?utf-8?B?OE5ObEhZSmN3WlpXSFVFQVNRVTFwMzVqZ0JpczltWWRuc0x5TEFGMUgvbWtB?=
 =?utf-8?B?T1h1L0RCV2F6K3pNUC9CSnRmZmNONXN2bVNmWTE2RGpLYmd2enhZemVoMmZR?=
 =?utf-8?B?RjBLRFUzTEFQbzBxbmpPbWhXTENpVk5tMS9pTkpxb1VxWWszUmtLQjJIU1N2?=
 =?utf-8?Q?zPoU4l9gekMZ1UxK/BX8Xk3g/F0Nbw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0hrNHJMMTN5N0tuZEViS3V1azdicW13Y2RZTnBja0lOLzQrblNtSFpPdFhP?=
 =?utf-8?B?QzFvTlFLNnlyRU1vOXQ0NENsVUN0MW9Ua2JsNm9uWDlidllXYSsrSG1mQlJH?=
 =?utf-8?B?Qm1JVGM5eDdSVUVRdFlFY1kvdDVpdWRkZ241ZG5TSFdIeGR0ZzlzSmVFSU1U?=
 =?utf-8?B?WVRZYmFEdnVEb3I4bXl0UHI5WFo0aG9BVGw5VzR6cU0xWGMrOXAzUEc2THRI?=
 =?utf-8?B?ZzgrT0ZhM1BhV2RlSS9TcGdhUTEzblpGcGgzSko3bnJ1OTBhQTYvdHE4eG9h?=
 =?utf-8?B?RTRtdktxWUFLRjFGK3BRZFhraGVwaTkvQzMxR0tncWtOa0FwVnBwaXZXWTB5?=
 =?utf-8?B?amxjWE9yRFdyMXpZRlFocEhwSmhxcERrbllTY1ZhT0JwWk84M2g4NDREcnln?=
 =?utf-8?B?L084d0EvTTFMVGwzTkJCNW5lVzNwOXh5SWNIMGpXaTJybSs2Y1hEdC9pOWx4?=
 =?utf-8?B?RVNTQnlwMEFFcEJ5M0JUMWZySkVWL2dvUVV3N0FqUDY5TENBbVhwWEg2SFh1?=
 =?utf-8?B?OFVSU2RzMVFaSEdScWw4Q3JOT2owVy9Sa29YU0xxQjVZNUk4cExuUzRiemR4?=
 =?utf-8?B?U0c3aDhUeXhRSlNBY3BUeVVsNDRmOFVCQ2JTTFF6UmwwN3Erc2s3RkZERTRl?=
 =?utf-8?B?dlNOanpkem9VaUNDN3hrMjdKRE5hTk1Fa1pDcVplaG1xMUVVTWw3bSttcHdV?=
 =?utf-8?B?VDI1WSs3TVhuNTVjbHhsTnYrbXdqUU90elAzbjc1WkpKMit5a1dUVFUyQysw?=
 =?utf-8?B?aFZJcmg5QkpuVlZENDl3dG1IT2YzWjYvSkozZVdMa0xTUFpod3ByU0M1WEE1?=
 =?utf-8?B?eDY5cGtWQWluL3NkSUN3VDBEWGdRRVp3MnJXRENCTmNBQ0NZNmlrYmNuQWlF?=
 =?utf-8?B?UmRKTUpJMHloRXl4YThKZHRsWmF2VHdwbnI4cVBiYnhGOENnZEgxT0dpa3cy?=
 =?utf-8?B?VWIwL3I4SnRhcmdPQVRlRm5WWW5SZ3VKQm1FQ2NPWXk0OWROd01hYm9WNlR0?=
 =?utf-8?B?L3lSd0t2d0UxVkhuSUxFdnR6TCtNNEdsTTBpT29kZEQ5QWx1Q0VZRENHaWQ4?=
 =?utf-8?B?K2ZFMjlBRWExR3FtWVdYelpSM01rd0hIckx3aDk4SEpHUFJ1dkdtUDVTOW5w?=
 =?utf-8?B?NUdVSzQ2MFVXTm1CN1JoOXVWVXdTRzZ6QjJOWTVBRFVhWFRnSjNqaUdFdXBI?=
 =?utf-8?B?Z293a1RmYVllcU9tSEFkam9YV05KT2FDQWt0eEVUNGU3Ukc0NUUrd0QrUDNW?=
 =?utf-8?B?c1NId2Y0T0YyQTh5OTRHQ05RZ3hKSkN6MHBwZHRxdXVmM2V2eG9URUc5WWEy?=
 =?utf-8?B?YnZhNXcwemZFdXpLeVB0S3QyTDkxNDNHd1hHZ1JYNjdlTmFYeDY2Z08yL0FM?=
 =?utf-8?B?YTJZQkg1dDhFZW9HdFBxSzM0azJBd29kOEp0eEZkTW1GdU44dm5hU0lwckda?=
 =?utf-8?B?cW8ya1VUdHdYRHY5WFdBdG1Ra1BLd0NoblZuT3c1SncvUVZZUWhYWnQ1WHRs?=
 =?utf-8?B?aUs0VnlMTll5SlN2aHdLa2tETnB0cnJHdzhFUVBNVE9BRUtxQ1IrTkZxbUdU?=
 =?utf-8?B?WU9FemZhc0wwMDgyUnlVc2I0WmxsUEE2VVVlTkFuemNyV2ZMeW9TOFRLUkZZ?=
 =?utf-8?B?MDB1M1Yyd1FjN3NDcy9nMENaVGswb3ovcHkvOVVIU1lTaDRZSGxyektpZUVR?=
 =?utf-8?B?Z0x3ejNLVytXOS9LZm9hWCtUSjFIQkVsc2IwR2JBMmtmcDd3ajUxRUh6V0x4?=
 =?utf-8?B?MFZJamY5YnRKUDhUQmxnMG9vL1o4eGNxdVFkRDVEZ1o4QkRJLy8zdkFUbVdP?=
 =?utf-8?B?LytxU0RGZEVNbkJSUW9JVFVKY0Q3NE5hZG84SktUcW1XQ01wK1U2a1dyQmdl?=
 =?utf-8?B?UjFzRldNV1pSYTMrRlArc0s0ZU80RERqaHpFckJTRTVCamhlWW5ROUNMeU51?=
 =?utf-8?B?R25kK1UxM0JZelI1aHFDekppaEp4NjBzUmlpU2hGVTJrb0JUVVBnNDVsN0th?=
 =?utf-8?B?NjZJbDQyL2o5Wjl2eUlQbUxMRGxZV2FZUjgxZ2lWc1gwcHl1V21VbXFCWkpj?=
 =?utf-8?B?NnY3NzlCZzRBM09qaEZhWVkveElRc2VYNS9CaHlnMnQrY3pMeHNGZitmNXdl?=
 =?utf-8?B?bGFhYWFDZDhGdkFPSm1uSzVlUm96aUFuenp5QkJja3J6T0M2STlLR2plMERR?=
 =?utf-8?B?ZFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3acd1710-8f5a-4fdb-22e7-08de10f3341f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 22:43:07.2033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fORZhjos0qslurgZ4FBI6LvwvGuMMKWnBvVGMnBc+DMzPN85jqMc/AH9uCzsFx801kQxy9ey/z1xKbVMXWY0LXEUkoYvfa7fdllOWWJWAZ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6753
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

In upcoming changes, SR-IOV VF migration data will be extended beyond
GuC data and exported to userspace using VFIO interface (with a
vendor-specific variant driver) and a device-level debugfs interface.
Remove the GT-level debugfs.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 47 ---------------------
 1 file changed, 47 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index 838beb7f6327f..5278ea4fd6552 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -327,9 +327,6 @@ static const struct {
 	{ "stop", xe_gt_sriov_pf_control_stop_vf },
 	{ "pause", xe_gt_sriov_pf_control_pause_vf },
 	{ "resume", xe_gt_sriov_pf_control_resume_vf },
-#ifdef CONFIG_DRM_XE_DEBUG_SRIOV
-	{ "restore!", xe_gt_sriov_pf_migration_restore_guc_state },
-#endif
 };
 
 static ssize_t control_write(struct file *file, const char __user *buf, size_t count, loff_t *pos)
@@ -393,47 +390,6 @@ static const struct file_operations control_ops = {
 	.llseek		= default_llseek,
 };
 
-/*
- *      /sys/kernel/debug/dri/BDF/
- *      ├── sriov
- *      :   ├── vf1
- *          :   ├── tile0
- *              :   ├── gt0
- *                  :   ├── guc_state
- */
-
-static ssize_t guc_state_read(struct file *file, char __user *buf,
-			      size_t count, loff_t *pos)
-{
-	struct dentry *dent = file_dentry(file);
-	struct dentry *parent = dent->d_parent;
-	struct xe_gt *gt = extract_gt(parent);
-	unsigned int vfid = extract_vfid(parent);
-
-	return xe_gt_sriov_pf_migration_read_guc_state(gt, vfid, buf, count, pos);
-}
-
-static ssize_t guc_state_write(struct file *file, const char __user *buf,
-			       size_t count, loff_t *pos)
-{
-	struct dentry *dent = file_dentry(file);
-	struct dentry *parent = dent->d_parent;
-	struct xe_gt *gt = extract_gt(parent);
-	unsigned int vfid = extract_vfid(parent);
-
-	if (*pos)
-		return -EINVAL;
-
-	return xe_gt_sriov_pf_migration_write_guc_state(gt, vfid, buf, count);
-}
-
-static const struct file_operations guc_state_ops = {
-	.owner		= THIS_MODULE,
-	.read		= guc_state_read,
-	.write		= guc_state_write,
-	.llseek		= default_llseek,
-};
-
 /*
  *      /sys/kernel/debug/dri/BDF/
  *      ├── sriov
@@ -568,9 +524,6 @@ static void pf_populate_gt(struct xe_gt *gt, struct dentry *dent, unsigned int v
 
 		/* for testing/debugging purposes only! */
 		if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
-			debugfs_create_file("guc_state",
-					    IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ? 0600 : 0400,
-					    dent, NULL, &guc_state_ops);
 			debugfs_create_file("config_blob",
 					    IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ? 0600 : 0400,
 					    dent, NULL, &config_blob_ops);
-- 
2.50.1

