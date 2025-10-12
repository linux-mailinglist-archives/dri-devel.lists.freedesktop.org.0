Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0C0BD092A
	for <lists+dri-devel@lfdr.de>; Sun, 12 Oct 2025 20:06:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA8F10E17D;
	Sun, 12 Oct 2025 18:06:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QRqGLt/r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA1E10E09C;
 Sun, 12 Oct 2025 18:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760292398; x=1791828398;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Hz2tqUuiL/xjxHNNnNGLR/v9SdFU9XpY4TbMAlmhcv4=;
 b=QRqGLt/riahRMzeezlyECX63qEMbI8PthDD3oLw34GQJ7nf2dF9i29AQ
 EOVEe1arsyAf9+zR0fd0sLok+MHCeI6l7jKAgxTjnZ+p7NaUsA5p+E4Ay
 E79jxwYJxorYz0KRKrn2NWIHQdUgmCQBOse4AmKHqG5Blhq2pPnKgFPS5
 dCZOQXZc0UAza/Q5IBki5pv3bSPFqzpjr10nQmRtzIyg5I+NG3qMGoIeC
 HZg2+sUsEEinA/NApLvreDGygKEwdSvq1Oph4f1DOHi9QgI7jg2GMSLv0
 Ua8kI7aEqiNfx1u87v2ymHvTD1+Jh3xP+l/S7znQfIzXGLjqHGZIV6jqY g==;
X-CSE-ConnectionGUID: +eCSQaxpQfuz5m6vHEAhkA==
X-CSE-MsgGUID: 0hwflc4GQmGRkG88nrk17A==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="62138396"
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="62138396"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 11:06:37 -0700
X-CSE-ConnectionGUID: iMd3LzhzTPuSFkg0u9nsAQ==
X-CSE-MsgGUID: I2KpsrgkRUmYah7amR43XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="181427155"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 11:06:37 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 12 Oct 2025 11:06:35 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 12 Oct 2025 11:06:35 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.68) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 12 Oct 2025 11:06:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r4R2iI4RMCPIv88o/6e1S62lkixYjNrnpIuYNInqvaSfjnKNOXpDXQBe03AIdCAxM+qmd73bIQTXlnBzQ1235bdWMNQYL4oDGg8N1Y9jRQ1O1T7LE6CiGNyOd2EyE/Ti6nZDwHUhVO5xNf+MbgFqp31SRmOfbuNiVSAWWkdDJ67RF6x/d0grhgtZVXnAOCRCI93Vv+Z6xmGtM9dvMBq+8jE65FyiokD86QwsATEDW01lRe/l4C5CnhCzgMom13rRo4GRZMCAgbc6eXT8BuPTP2f066azNlWbPmcuH+LXlXJn3VVrWgcggto9aPrTL72meRs6zPlNlcbHA8uS8QOp4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RX1Ndz5n1mAYNNl8C62D3iCvaeqQMkfh9Db0Dt+y1X8=;
 b=mz9o0HQq2MgOFgfImsJssZ4GJT9bbpinBetzaN0g7Q9mkTuCOc0CAOWHoX9pXix5QQhUkI2STRv5h3kk5NDSDxGlr+svnvDt58IiuYZVLd0WRjxLqm2wLz7qLLLShww19cA29wij4sr01ih8I3BbpScnBwLrtZ7KMwoI3Nc8qz0OEKmlm6NqXXIcqYZzkIKPRBpx9dXViGsMLa3WaYT3/lCp0NvNA/1Q5/JfYJwb1DQyx+oI4PHw/feYbc0LPkrrSYTn/kuEQNIDJuVAqSshJBFu+P6d+CJE25CkWysS7j7DuM4pRUiAwXNqaU+kuRqfMCbHndgNstC8zY7F5g4/hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6706.namprd11.prod.outlook.com (2603:10b6:510:1c5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Sun, 12 Oct
 2025 18:06:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9203.009; Sun, 12 Oct 2025
 18:06:31 +0000
Date: Sun, 12 Oct 2025 11:06:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
CC: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH 10/26] drm/xe: Add sa/guc_buf_cache sync interface
Message-ID: <aOvuJI/BNJZKPRgL@lstrano-desk.jf.intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-11-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251011193847.1836454-11-michal.winiarski@intel.com>
X-ClientProxiedBy: MW4PR03CA0269.namprd03.prod.outlook.com
 (2603:10b6:303:b4::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6706:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bed3b44-1b52-4687-0580-08de09ba12c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWEveFJ4c0RCZmhwaGNKbEhZeHhTMWpSeUJyQWp5cFJiK0FKVnRxQVZsZ0Qy?=
 =?utf-8?B?TWNTenBuamJYczdXcGJNM3lxWmU0RGZQeEo0dElmS1ZmZGxRZjFJUGFmYXNC?=
 =?utf-8?B?cUJCL0szWlN1TThqWFo0Q1A2WnR3dTY2bEE4OEJFUFptQmdpKzd4MkFiZ2Rw?=
 =?utf-8?B?NmdSWEhxRmJPbXdVUjdpL1VHdU5OdFZFZlpTdURJZ2dYdjFzVlpWRHZXSnJx?=
 =?utf-8?B?Ris5aHFrTGRLYlB2UGl4QlJYY3M4aFhYdzBJWFJyNys2OTF3dUp5QzRqSDdl?=
 =?utf-8?B?RFpxZWhUM1lKUHdSUjBiVWxQS2FOcEVpZDA2bFVIdVE4MFo0TlJGVjBFWDdC?=
 =?utf-8?B?c21ISnQrWW5CZ3N6ajgxOHA5alo3VHJJVWNZTDg0OEtENFRyRi9Fci9PbzVX?=
 =?utf-8?B?NS9GOHg1bWgrKzB4QTFPRC9sbGZxRTRrSndETHZkUUhaY012VkhyVzdzZ2Fw?=
 =?utf-8?B?ODdJZmp3OGU3YitOMldXU0ZMMkQwNGdGWDUzWUk5RnVqcDZETVJSbysya1JP?=
 =?utf-8?B?MWhUTWhQcGdIZDFVWDNMVVdCN2daV0ZYcFRMWDFGQVh6dWRYOWhQcVFkZk1S?=
 =?utf-8?B?NVhDbWR1aFd5RWhqQStGbUxtdUZINUJZOUZxZ1pRRXcreVJoY2J2ZWxhNnZT?=
 =?utf-8?B?amdaa0FmendXRy9DMTI1eS9vN25IQk45T3NHTXVMWmo3eWVOT2tRa01OVFMr?=
 =?utf-8?B?Q2Z1ZXBZRUNzTGY0RFpOZkFqQ1FNVCtQdGMyYWhQcVI1TVRGK1Nvajd4dE5o?=
 =?utf-8?B?ZzY5M3grMkxpWjY0eVNoSVY0SlZlQXh2STNOYjJ6S0NJaTVJOFVhVG5NeFRN?=
 =?utf-8?B?alFPZk5Ndkl3MThNMTcyUVIwc3NGWDhNVFRHaVB1dWFXeFpQZi9IYUYzTloz?=
 =?utf-8?B?R3Mvd0N5ZkpwNStXa3N4Q2JLeFM1cGsyZXZNd21aK0phNXNpbGxtTElGbVJ3?=
 =?utf-8?B?S0kzUEYrMWpSZFBGWG9kRE1lZmp5akR0dTRMcmJuTDRxOGgxcXZ4OGJwNDNi?=
 =?utf-8?B?RU5NSTFwTzNpMHJER0cvb3BsODE0SnRpSUdwd210bC9ROUdFakVTR2FKK1Z5?=
 =?utf-8?B?UUVkaDliQ1ZLczZEUStxUHFGRy81R0xqVk4zS0tud3d2MDF6VTNEQkdDN0Jp?=
 =?utf-8?B?VEFQRG9WRDBhczFVa3duZ1FCUjRKUWdaajRQVHdUaXhJQzU2NHFraUZ4ejUr?=
 =?utf-8?B?eUExQXNPaVZiLzdpSUIwSmh0NG9ZY1BHSHp6MzJTdUJvL2Ruc240bmdBcUdC?=
 =?utf-8?B?ZnQvRTZVb3g3cHJRZjZIejZvaDFVL0tXTnY3R3pNR0V0cnVGcWJjM1htVUZP?=
 =?utf-8?B?eFVobkU3VWV4WTQyMTVzdUxjM3cwbXdmNmVhK1dWUldOOFMvVmp1S0xJR0Ux?=
 =?utf-8?B?ekFTMG5ta2UxUzJGaVRhTGhwaFBDck9DZmJRUjk2eUllZzlUM3FacGFBNm94?=
 =?utf-8?B?QmFTSlRtRUJxczMvRGV2TnZ0bXpyR2tla1AyTkkyZlBXYnJhaVB0dCtHS09t?=
 =?utf-8?B?L1NVaTRCNG9tMWVtUENiZHdHQXRpOWcraGdqUG1wRTFYZ3hSMkZhNkpLNnVy?=
 =?utf-8?B?NXVFRWdqYjNqWHFyZEFhSjQrdFM1bUVtZDZBOGZPUzFXZmt2KzlXNkxiODNh?=
 =?utf-8?B?WTVNQUNFVDl5QS95R28vZE1FdnpIUFd3V3Z6YWJ2NVY3RHJQbFFrV01tY3k5?=
 =?utf-8?B?NW5DV1NSYVBrWU5MaitmczdRcDVFM3ZQMU1CT3c4ZTZGRm9VaWJIditmbXFE?=
 =?utf-8?B?WmhYTnp1MThENy9nYmlyOVJsTU9CWjFRRXRIZG52QXNaem9iYU5lcldHY3pP?=
 =?utf-8?B?bjlheitia20wZkRzSG9HWTNUUmZiTTNxRE00Q0NYV0pxcisyK0Z5VXVNNU52?=
 =?utf-8?B?VVU4dUI4TVZIeWV5WU5YeWNhdGdtNDNBMW9DbEVjRVhtZERsRnQwMnJ4cHcw?=
 =?utf-8?Q?Ynf14bRNNQhrDCjxTkdyubeF66mjUeIX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vjc0MUFFcHRXZTNKKytVaDZ5Y2FZWUIrS0tRNUIxbE1ZS3lwcTJhczVxYjZJ?=
 =?utf-8?B?QnpQb1RjNUhBVElrSzR5K0FwMXlHbXFTdmRvZ0tSamNMN016YlJHRHNGYlJI?=
 =?utf-8?B?NUFNSVJUOFM0aFM1UjBFdFdmVjFVbUxRYUc5Wkl5cGR5dG1iSHkvb1VZNFlX?=
 =?utf-8?B?MlFUSU44aEZneEJXdjBjUnFJZTNyb25XbHVaSjZSWGdBNXRnNnIyeXJTSko0?=
 =?utf-8?B?NTUzQ0RKK2hSRWw1NzJLdnN3Mml6V2hVR0hKcDZreTY0TjFYeVdLdW1hdmFP?=
 =?utf-8?B?VmpjaFVRRW1qK0ZzZ3hLL0djQWZVTTZDTjlTeFdmVDFDdHdCKzZHVjFDam1Y?=
 =?utf-8?B?YTlhTzdKWkNxZFlCUlRuVDBjTWVHNTB1UUtUV1hYSzlzdFBlWXQzTWpSbzZ6?=
 =?utf-8?B?QUpvbm9IZTZhL050RUFOQllYRUQ0SHFGQ2dGbkFvNHNtZ3ljMSsvYm1qcUZL?=
 =?utf-8?B?c2FpUGk1Zm5NY2tqeXVmZ295Y3NCZmhvVTBuNHJxMGZTejNhTmx2TlBMMlp0?=
 =?utf-8?B?UzVneFA5cE8vLzdnV1ZXWjdwSis2SVRmUm9SanZSR1NzQktyOXRIVkd0VzZO?=
 =?utf-8?B?ZituK3dkR3RPS2FOU1BHU1AvYndPMkZjZHYxNXgzcitId0F0bU44VkpPRlBB?=
 =?utf-8?B?Z0E1dDQ4Q0tQRTVKYS9BQitVT0JWcHNxU05leTg4eTloTlI4eTh2SFNyRVVV?=
 =?utf-8?B?b1dBV3NnZkZFY01MODFiQTRnMXh4ME5sNWNHbmZ0TC80VVUvbXNkVzFlR1Ft?=
 =?utf-8?B?QldxcVNZRi80MVpNM1ZrVmJKeGVlUTM5ZjhiV1prY1JsaDJINmN1S0xtU3JL?=
 =?utf-8?B?SmJLV2h4N3A3TGJvdjRYbzZ0R0NmQllnUmtFZG5lTXdZdDVpRmRidlVYaXhN?=
 =?utf-8?B?Q0JtUzI3Y0RNUFdxWEgyVzB5SStNT3JtYTJBZStiNlpCcXVjdWZTRDdpTVRF?=
 =?utf-8?B?TjBlVzRGU2ZjQnBEMnlKMU9mM2ZrSC9ERUlVQUJRcjFOTWNzZXFvakZ0L0xH?=
 =?utf-8?B?c1N0OGRCUEY4U2dXQmtIUHRaT0tsZk1NZ0ZBTFFVdGdyRzdxTFhrc0diSU01?=
 =?utf-8?B?d1I1eWxiVS9hVERMSVZ1MTg3bFdQVVJWWGRtNG1xY2JFSktJSFc3VDd2QTZJ?=
 =?utf-8?B?ODRJTCtuRkhuSy9tYkRGemczdHB1QXFHN1dOc3kvQWpUVXA4bjFVQSt3RjRX?=
 =?utf-8?B?VGJoOWRlOUxTRW9DdlpWRW5uSkhNNVU1R0RSN0hHOVRkVzNmWDJnR1VEUVJU?=
 =?utf-8?B?WllzZkcwRFlOclNSTEhubEJZazV0K2E0ZVRIZS9CcUpxRlhyTTVqbFpKbGlT?=
 =?utf-8?B?cWNrc0JzUGdMWUpXeXlJV0YxcU4weGFPdTh0TllNVmNsMHBUNHRtZSsxOVpV?=
 =?utf-8?B?MWlUYlJ3UWswODlhVGpDNEpRN1BNQU1lMDdVZlEwYURFM1N3NzdCbnZlZThI?=
 =?utf-8?B?T2g5eW9zcm83Y0gxWDc3UU1BV21LODhTMHZmdWhpV29ITzJKVnphM3RLZFBa?=
 =?utf-8?B?ckJmTDhPT0VKc29raXh1dGVNWmtNVmhhNWxHdVNxWkZMNDJWTXZiZGVLNmlP?=
 =?utf-8?B?WU82SjJ4alZyb1M5ZHB1NnljUzZNMHNWL2lZVVVhZ2tZU3RGSGpQYVZnQkRh?=
 =?utf-8?B?ZHhqTFo4UnF6UVVPN21SWWV5ZC9kSlNLdm5ydWd5d3JEYzhFcEtWS0RRa1ZZ?=
 =?utf-8?B?bjF5WGZna09uOWgyNmUrb0pUb29mNTU0Q09PbHFIQ3BHU1BhUVNEL1A2YjNB?=
 =?utf-8?B?U2pZdVI2dmYyUWxCdkVuRVNxbFliM3RxRkQvV0lXV2xiQjgxMThJN1JwUlZS?=
 =?utf-8?B?eDd4YjM3aVRFb3k4bFBlSTNnQ0lHeENxazI4ZzYvYllCM2NNOWtJRjJiSHFk?=
 =?utf-8?B?bUJFVFp0QXYvaGRsYjkxZWNrTmpQeFRvYWxFV0xiTmFtbHBrd2NST1dFUE1s?=
 =?utf-8?B?TjNUZGhvNlk3eXJ5SEtEcWJrN01DT0xsc3hRNEJZa2s1RnIzQ2E5V1RhSklN?=
 =?utf-8?B?SEh3WmlVZnROelFUbGVFOW5aWTlxdktWY0d4RmNLUUFoZVB6eCszMTZMUURK?=
 =?utf-8?B?YWhlSkFRcDg1emZNZkxsLzZ4VnlJbVRPNld3S3J4MkxydTJjeVlOc2QrL1Zr?=
 =?utf-8?B?VjNrcEZOOVZDR3pWWkwwVWFialZKTFdrNGsvWjFQZmJtNTRhSGoxaDhUMTFB?=
 =?utf-8?B?RVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bed3b44-1b52-4687-0580-08de09ba12c3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2025 18:06:31.9010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 78F0JR/slw/wT1wmYlWOZDh2/Y5Z2LTUdM6uwGCecjwi4zKKI4R8oT0Glb3QE4M73epno84L/CUqIvwP3tLaUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6706
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

On Sat, Oct 11, 2025 at 09:38:31PM +0200, Michał Winiarski wrote:
> In upcoming changes the cached buffers are going to be used to read data
> produced by the GuC. Add a counterpart to flush, which synchronizes the
> CPU-side of suballocation with the GPU data and propagate the interface
> to GuC Buffer Cache.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_buf.c |  9 +++++++++
>  drivers/gpu/drm/xe/xe_guc_buf.h |  1 +
>  drivers/gpu/drm/xe/xe_sa.c      | 21 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sa.h      |  1 +
>  4 files changed, 32 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
> index 502ca3a4ee606..1be26145f0b98 100644
> --- a/drivers/gpu/drm/xe/xe_guc_buf.c
> +++ b/drivers/gpu/drm/xe/xe_guc_buf.c
> @@ -127,6 +127,15 @@ u64 xe_guc_buf_flush(const struct xe_guc_buf buf)
>  	return xe_sa_bo_gpu_addr(buf.sa);
>  }
>  
> +/**
> + * xe_guc_buf_sync() - Copy the data from the GPU memory to the sub-allocation.
> + * @buf: the &xe_guc_buf to sync
> + */
> +void xe_guc_buf_sync(const struct xe_guc_buf buf)

s/sync/sync_read ?

or

s/sync/flush_read ?

Patch itself LGTM.

Matt

> +{
> +	xe_sa_bo_sync(buf.sa);
> +}
> +
>  /**
>   * xe_guc_buf_cpu_ptr() - Obtain a CPU pointer to the sub-allocation.
>   * @buf: the &xe_guc_buf to query
> diff --git a/drivers/gpu/drm/xe/xe_guc_buf.h b/drivers/gpu/drm/xe/xe_guc_buf.h
> index 0d67604d96bdd..fe6b5ffe0d6eb 100644
> --- a/drivers/gpu/drm/xe/xe_guc_buf.h
> +++ b/drivers/gpu/drm/xe/xe_guc_buf.h
> @@ -31,6 +31,7 @@ static inline bool xe_guc_buf_is_valid(const struct xe_guc_buf buf)
>  
>  void *xe_guc_buf_cpu_ptr(const struct xe_guc_buf buf);
>  u64 xe_guc_buf_flush(const struct xe_guc_buf buf);
> +void xe_guc_buf_sync(const struct xe_guc_buf buf);
>  u64 xe_guc_buf_gpu_addr(const struct xe_guc_buf buf);
>  u64 xe_guc_cache_gpu_addr_from_ptr(struct xe_guc_buf_cache *cache, const void *ptr, u32 size);
>  
> diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
> index fedd017d6dd36..2115789c2bfb7 100644
> --- a/drivers/gpu/drm/xe/xe_sa.c
> +++ b/drivers/gpu/drm/xe/xe_sa.c
> @@ -110,6 +110,10 @@ struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size,
>  	return drm_suballoc_new(&sa_manager->base, size, gfp, true, 0);
>  }
>  
> +/**
> + * xe_sa_bo_flush_write() - Copy the data from the sub-allocation to the GPU memory.
> + * @sa_bo: the &drm_suballoc to flush
> + */
>  void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo)
>  {
>  	struct xe_sa_manager *sa_manager = to_xe_sa_manager(sa_bo->manager);
> @@ -123,6 +127,23 @@ void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo)
>  			 drm_suballoc_size(sa_bo));
>  }
>  
> +/**
> + * xe_sa_bo_sync() - Copy the data from GPU memory to the sub-allocation.
> + * @sa_bo: the &drm_suballoc to sync
> + */
> +void xe_sa_bo_sync(struct drm_suballoc *sa_bo)
> +{
> +	struct xe_sa_manager *sa_manager = to_xe_sa_manager(sa_bo->manager);
> +	struct xe_device *xe = tile_to_xe(sa_manager->bo->tile);
> +
> +	if (!sa_manager->bo->vmap.is_iomem)
> +		return;
> +
> +	xe_map_memcpy_from(xe, xe_sa_bo_cpu_addr(sa_bo), &sa_manager->bo->vmap,
> +			   drm_suballoc_soffset(sa_bo),
> +			   drm_suballoc_size(sa_bo));
> +}
> +
>  void xe_sa_bo_free(struct drm_suballoc *sa_bo,
>  		   struct dma_fence *fence)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
> index 99dbf0eea5402..28fd8bb6450c2 100644
> --- a/drivers/gpu/drm/xe/xe_sa.h
> +++ b/drivers/gpu/drm/xe/xe_sa.h
> @@ -37,6 +37,7 @@ static inline struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager
>  }
>  
>  void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo);
> +void xe_sa_bo_sync(struct drm_suballoc *sa_bo);
>  void xe_sa_bo_free(struct drm_suballoc *sa_bo, struct dma_fence *fence);
>  
>  static inline struct xe_sa_manager *
> -- 
> 2.50.1
> 
