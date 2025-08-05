Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAF6B1B9B6
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 19:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F52710E6E1;
	Tue,  5 Aug 2025 17:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ecyTMWn1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CDAF10E6E1;
 Tue,  5 Aug 2025 17:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754416709; x=1785952709;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=MLWCHYLdsmxKXbxj/Awlp4ugJgo6XGeGHkrpoMYLDFg=;
 b=ecyTMWn1V6n5t0WcF7qapKDhCaNw203TFOgjnAM93SkkhBPi0Zjy6EEt
 gUTdNshr1/lGSFxA1mNUHWyfOqpuFO34+du+RXcbPOHaX8UuSjGJnoTNi
 AVq+P68zeXiZmSeE/G43QMyJ8/jLeaQY5cYnW4L0pb3INHkIXrya2cnBJ
 tMjxmIVeK3yiaI9cca+mxZatx4cIEHsrGvtiZo2G2sdpz8JNG/KIlFtCZ
 khUq3nzGR8+chRrsbn7y/E6nvagaD2KjKKIipcV/7FwnEgzTQzHYMTQnM
 h4QWWuJw2MAIditCwJPXPvXqMCK+jqBhFCrWIWN1J4PDBdHXeoqJU3eZ3 Q==;
X-CSE-ConnectionGUID: yjddSGpHQFygJkmqoeTJFw==
X-CSE-MsgGUID: HaingFVpR/SKZS/ZZ68vFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56614835"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="56614835"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 10:58:26 -0700
X-CSE-ConnectionGUID: M0lTbhs8SjuJkkcn5xhzkA==
X-CSE-MsgGUID: t3upTrTaTkKGTQG1veiAZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="164977307"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 10:58:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 10:58:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 5 Aug 2025 10:58:25 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.62)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 10:58:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JXE1VmPAtAWD4TQiX4XqbQ70E5wmd2Ti5XwbRJE3WtLbgil859z7ZvIN5M3khnIfEBBkFviEUTqUzUL3dWq5Q1bLQ3KdbrXxLWMmY7d8RgOHvP5Y+Dik22zvR4Z4DpIKS2QozlaJlk0HRQrDEX/1+wCtMz9CCmLIo4IpLxoIhAIzQaxswtvJjXJccWqsNmlqe+O2nBVHF/buUDc/PUR3Hq/ItYvLWJoMIhcxR7anP3lpVVi8gPRR3gr99K87Ws7rc8PW/msI5vVNwL1+TKUXB1sUx6zeKM6kqjDfEOIhvVO+bXs+i1n8HD0l9eRe6tt/Py/5C5PPGcszs8Xxd8laog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5/5NMFo9u5CLxBdgBRZao2DcPOu/xdN0JezjvYiezA=;
 b=OBioNUekIrMlhCb7rQeHjEZy/23SnZUUDWvJkau6colgWKn+IlAlDgEZYLXA6NlGJKY2VfvvaEeBCamBJBd1TzduJy93WwCiR5T0mAfVm7pHizVXyVTM93rjXDPg8PbnP1yQEamP9Tc9WarQg8sj2lkd0s/oKQujhodjpOjHZBGFZpdDGkWuBPWkj27hrswAlb8curQ368TOC6g4YShYRsk7qrWuZyKGKzCS6G1RuE/113t8vk/I1AClonZpO7X4IPcLnNppGN/fi2VdD3yZ4nmIS0UP8T1Sz45FVrGmScKjmSfm8PqxmY5i7j0PTGHfLNhgRh06OpESxmLgzm+sLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by DS7PR11MB6152.namprd11.prod.outlook.com (2603:10b6:8:9b::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8989.18; Tue, 5 Aug 2025 17:58:08 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%5]) with mapi id 15.20.9009.013; Tue, 5 Aug 2025
 17:58:08 +0000
From: Imre Deak <imre.deak@intel.com>
To: <dri-devel@lists.freedesktop.org>
CC: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Thomas Zimmermann <tzimmermann@suse.de>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, <amd-gfx@lists.freedesktop.org>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Linux Kernel Functional Testing
 <lkft@linaro.org>
Subject: [PATCH v2 3/3] drm/radeon: Pass along the format info from
 .fb_create() to drm_helper_mode_fill_fb_struct()
Date: Tue, 5 Aug 2025 20:57:52 +0300
Message-ID: <20250805175752.690504-4-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250805175752.690504-1-imre.deak@intel.com>
References: <20250805175752.690504-1-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0330.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::35) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|DS7PR11MB6152:EE_
X-MS-Office365-Filtering-Correlation-Id: fd2c0b51-1f07-4ff8-22a5-08ddd449a298
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmtHblFocFczR0ZYdTF0S3I4TGxqalFsWEFkd21tdUxoa1VKTFExb2haY0hk?=
 =?utf-8?B?U0VlZnVicytKMHVHMDJYMGp2cEZtcjVEWHMvUXdOYXIrcGxFZ1QxZVJMRlhT?=
 =?utf-8?B?M211MGNlREpKYUVlOE1lYVRDdlBFTldSdVZ5ZlZtbWhVcFNiZlZPZjgvQ3Zz?=
 =?utf-8?B?elA4UXR5Y3hwN0ZFM1RxUE1tTFBHN3IycnNaeGlRa3o2SUVKdHY3MVJ2TUsr?=
 =?utf-8?B?Mk4vYnVCSStrNmIyb1psRnhqMFo3UjVseGIzemVsVUtmV3JVRlh5ako4SVZB?=
 =?utf-8?B?ZE9ZaGhYdHh6cXVuSTRmaFB5T2xxMEFrL2ozYVFQWlhWWUJXS3Nac3FXZE54?=
 =?utf-8?B?VjZOWVhWaE5RWnZ0d1c5c21jMTFLVXJ6NmJEc2xSSGUyUmlhYzkwZTRtdGhL?=
 =?utf-8?B?VE4yRjdGUWZOYnN6d3ZmOFhXdXcwVEphcHR2MXVnVk1WYVBDUnRrVFYxVHZZ?=
 =?utf-8?B?WmtMY1ZmUzJwYnBKdnBRZXdkMWI4TVVxSVNtZjJoSFQ3TERPOHBRZVNzak9v?=
 =?utf-8?B?amJJaEF3QnRCZFlZM1pNdkN1LzU0WnBTYkVtK3N6WHpiM3NzZkRQQlB6RkV0?=
 =?utf-8?B?WUo5NHpUWER5RUZSY0hsUTJmZUI5WXI3RlZBTldoMFUxRFEvS296clBOcWp5?=
 =?utf-8?B?SkVuZzlNdGk1Mzl3bjdjRlpualQ2cUhhMVRVVkJ1eFdQa3Z6cGtqZjM2QU9W?=
 =?utf-8?B?Yy9LdWo0Ym1sU3ZLdGc2anpwTGhDYkxXdEhtMk5oODg5b3BYUllsZDVVZ1F5?=
 =?utf-8?B?Um9NVW50WTdXTk9uK2pPaFZxWm9ZMENDTGxBbGpsL2t4TVFpRUk1MnprTnlo?=
 =?utf-8?B?emFjNmVaR0NPaE1SdUxLNjgzeEwwV0lmeGM4eTFLOVdqazcxcGlzNVpTR1p3?=
 =?utf-8?B?UHIwNzRNYVhKV0Jwb29mSFZRaVlsV2tFOVRGU1FmV2crYWg0MHBWc3hpU1hV?=
 =?utf-8?B?VXB6ZHloM2M2cjh3NUh3RUovdmdWOW9PTTZ4Vjg3cEUvWlFSYXhzUXJQc1hF?=
 =?utf-8?B?Tk5NMFZPamNJRTdISEc5VStsbmVPM092MmtmbUt0TlcxWU9jZW0rcS9aNFZI?=
 =?utf-8?B?SzFFaDFZZVo5QWZYbnR4RmI4T0tjaUxUOUFnbHl0S05HNmMxVzMxQ3pmOXRl?=
 =?utf-8?B?RzEvc3JsOXdMekZRVkoyd0NUNHBvNGQ2OStBbmRWYThSYW81L2tXOE5DcmVa?=
 =?utf-8?B?OXBKWXlURWtoS3JIVlNSR21Hb3JXMjlISGgrVWMzSzVBUTlHSzgrL3pIUFJu?=
 =?utf-8?B?cS9RSWdiV1RSeDBWQUZMdlhmRk0ycWJyYTh0R2dhRzkzVUovbUZyOFNIZTR3?=
 =?utf-8?B?YU5ZWkVHUmZaRmRsWUVQRmt4MWpoRnhJcE1qWVJwRkZ1RU9kUkFWNittaVRZ?=
 =?utf-8?B?MjFmK25LS2VHelcrNVJOc2J0ZWdaWFlJTDVFSTlUcWJENzFFUG9uVnN6Zmdy?=
 =?utf-8?B?NW9FOGhTMFdYVUMzUU5iTkpNMFozOEFiMlRUcXR4MGpVbmFQVEN0ajdkSDJM?=
 =?utf-8?B?MTg1ZUNvalpQTXJ1T0VyNjNLWFBLUWZqZFIzc0tKdGVEZUZ4YUN6U1UrSTVy?=
 =?utf-8?B?aW84UUxlSGM2OFkvc0UyMnJkSy9GclZRZUxVRWthQXl0djFvWUdKSUoyWE15?=
 =?utf-8?B?RmQ4aFkvRWNPckRPdHhQN0Era3FQSjVoVWk5dlBLRzJnR1FkVDEvOGtNY1ZP?=
 =?utf-8?B?M292dU1jdWN4bFd4alc2ZDRvTGpvVkM5K1hGOHo1c2d5a0lnSmltbEVkdUUr?=
 =?utf-8?B?aERqTXFIQTlYcnNDUld0bDJKcjRPZFNRMVdmSVYwV3JjTGt0ZmlCOThhc3Fs?=
 =?utf-8?B?Z1VjanpSbEpoUklxTVNteXFjczBlN3dnOTRDdFozMGlxei9CRnV3ZFlHMnJz?=
 =?utf-8?B?MlE1U0JVb3k4QjZqd1dCK1Z2TnRJc3dRWXBEb3RqbzVMSlZTZG9zY2N2QnFT?=
 =?utf-8?Q?bbeQQJC/kH4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGZuTC8vTVJKbEVjb0JVL3BlNEp5OEl5YVZQc3VQdjl4eklQOFRibFZuVmVD?=
 =?utf-8?B?ekM4YjJ6dWk4djNVMUpCa0xuWm93SkEybXVCbmJKU1VJaVdsTm94YnRlVTVL?=
 =?utf-8?B?bVZPN3k1WlE2TDVvV0U2N0ppeHZzbC9BYlprM3ZYMlhtOXlqdkU2RFkzNUJ1?=
 =?utf-8?B?THp1TmIyd2NjMFo3ZGlnYmNNbW5veEpEZmRwM1JKTDNGbDJ0MFFXOHV3RFFQ?=
 =?utf-8?B?SlI1MHVHSWRLMGZPM0Q5dVhoVnREcXRLeXlXTXp0N0t4U1FIR00zWkU5TU45?=
 =?utf-8?B?U25MOVlhVERuM1BkSWRuOGlXTndwOFBJOFdOUG04cFBuK3c0SGxpY3R0bkhS?=
 =?utf-8?B?R0dxL2ozeUZrbHRsK3RNejI4eTRPZktOZGUxSWNLOUNaTVNGNGo4aTdzRzYv?=
 =?utf-8?B?VkdZNUxNa0ZqN3BNb1FPb1NPa0hsNWJwaWVBaXp1NjBDTWszMTcrU01kWm14?=
 =?utf-8?B?cTEvOU5ONG9TNWVUMmllWHlhS3BSWXRiZDlMMnlHUzRONnRSQkp4WU41QnpD?=
 =?utf-8?B?THQwdWIzVDRZbkpDVXBjTWlXRlZxM3JpcjMzWG9UZ2hNdC80UmJ3U0JHOUxL?=
 =?utf-8?B?Ylo1bkREL3JFNjRMK0RZczJrM3FYeitNQ2VwMG1Na05iRmtYMEYweHBRcEtQ?=
 =?utf-8?B?cVlwQjBLY2FKeUZjTUdpNTZHWHJsZ2QyTUpsNStFV0tVazFkYUpqb3RNakhm?=
 =?utf-8?B?NngwTk5FM1hsMk0rL2EyaXF5Mnd0NVVmRGFsbElwMnJKZ2Q4VXNkWkVucmNm?=
 =?utf-8?B?NVJsdFVZSnRwcGxob0pGb0gzYkl1d1YwUVU4R3N2T3NxNkU2VU45OE0reVpV?=
 =?utf-8?B?aGg0TlV0cW5oM0NLQ1pHak1oa3U4UjJRK1Z4TWM2M3N2cnlBc3YxMVpEaGtO?=
 =?utf-8?B?MVk2dTZGN1g2SWlZY1NBTU0zZUdNQTJZVkhOczRCbkZNNUpJSFZ2WHMwTE03?=
 =?utf-8?B?ejJlOFN5cGpaQUdXWTN4USs3NndoWnBWa3QveEVwVGJRd1E2NFFONzhWdXdU?=
 =?utf-8?B?V3laKzV4RHNjRXZBU1ljdjNqa2czbDJPMDFqTXVXLzViK2lXREFBbzdxS0cr?=
 =?utf-8?B?Smh3R3BvVkFMS25SVG90SUk0Y0JMVFVhU3FMYis1TTJHSklidHJqSThNTXE5?=
 =?utf-8?B?S3l2TTU0QUNXUllmNVk1UUFwOXNQUGR6VDQvaE5Cd1luZnMvQ0dybFJqdkNL?=
 =?utf-8?B?MmhaNGNkME0xa0ZDVGZKc09uOTNzMk13Vk56S21WLzRVTFgwMFd0RHhGRXcz?=
 =?utf-8?B?cW16ODQ1aTJwUEc4b2QzOXdMaHgvUjdXQXZkVHFmdjBIRTREV0Z2NHhQc3dz?=
 =?utf-8?B?Vk1Jd2ZYK1p0MlhYZVFnYzBRQmlWTzBNdnQ4M3BpTVJtS0g2T3FQUXpxWS9H?=
 =?utf-8?B?bmpSSXk5ZjZ3NlplZ0lQUHZOcmlYaXlaUzliNnRoWkZJeDR5UHRvaWYwQjU4?=
 =?utf-8?B?UXlXSUE1d054U2F5SDlXbEtXaHVSQlJwN3U0VHRwNEk3N1VHeERGZ2R5Witp?=
 =?utf-8?B?ZVFzV0g4VFFIeDd2dHlTWWxLbkpLK1ptbnhNSnN1cGpHczlZWk9YNXQ4OVdw?=
 =?utf-8?B?NWpXckt4Z09ZSzQvM0tOS0o0bkZvTWJ2K3JFM2FYQ1JzeUZFUHE1T0tWdlpD?=
 =?utf-8?B?V3BjSTZXYm1pQXd2QjVaVURJSVBSVW9NTzVXazUzNzhzcGwzeXpUclA2a2Rp?=
 =?utf-8?B?YTlRWjNMOGtjbnRzSjluZTkyZzFsRlBIZTBsN2hnT0Uyc2xKZllGcS9iVHlj?=
 =?utf-8?B?SVdCS1BpYVladlNwN1pvTzV5Yys4cGN4bzhRZk1razFFa2MyZldIbFZRT2Ra?=
 =?utf-8?B?bXhJRFRuU2FOTzVodjBxVEM0RHBCWVNCWGYvYTQrbFZ3NHdOWjNIVlhiZWFj?=
 =?utf-8?B?ejRXdE9zV0VRUG1IWGkxeUladW1FUjk4ZDZLRWlzckl4NFFIU2phRFFoNm1P?=
 =?utf-8?B?WFNtNjdSZENJY2dwSlQ3K1JLQW9rRzJSeFAvdEVyRTgvTXEyVkFLQkZhY1pk?=
 =?utf-8?B?TFN6UFFSSDQyZUNQUmNidjN5d0xRKytqVkxNSGdrQjJrRmM2bUNnUDdudldI?=
 =?utf-8?B?cE9iaWl3SU9GajB2RVVKZ0VPaXBvSW1jYmU4dHgzS0l0cjBVdkczblNOMi9p?=
 =?utf-8?B?cEVDNUt1S2hvT05qSkRHOWRGT2psMlNnbWd4QzFBOUxWY0NhNElWb3U1cUxh?=
 =?utf-8?Q?hAXZKpttq9PhlMKbfBRRM7yvTXAZ9K9Yd2WXr1RRmP0M?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd2c0b51-1f07-4ff8-22a5-08ddd449a298
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 17:58:08.3438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CeSA8XgEhpPDtZStWFEx7YXgg8QkndZXUeQJLWnB4X7W0ejvWZ8ybK2dZUKpnFYVamH2rBtQBLkxzN4ztu2YPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6152
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

Plumb the format info from .fb_create() all the way to
drm_helper_mode_fill_fb_struct() to avoid the redundant
lookup.

For the fbdev case a manual drm_get_format_info() lookup
is needed.

The patch is based on the driver parts of the patchset at Link:
below, which missed converting the radeon driver.

Due to the absence of this change in the patchset at Link:, after the
Fixed: commit below, radeon_framebuffer_init() ->
drm_helper_mode_fill_fb_struct() set drm_framebuffer::format incorrectly
to NULL, which lead to the !fb->format WARN() in drm_framebuffer_init()
and causing framebuffer creation to fail. This patch fixes both of these
issues.

v2: Amend the commit log mentioning the functional issues the patch
    fixes. (Tomi)

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: amd-gfx@lists.freedesktop.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Fixes: 41ab92d35ccd ("drm: Make passing of format info to drm_helper_mode_fill_fb_struct() mandatory")
Link: https://lore.kernel.org/all/20250701090722.13645-1-ville.syrjala@linux.intel.com
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/radeon/radeon_display.c |  5 +++--
 drivers/gpu/drm/radeon/radeon_fbdev.c   | 11 ++++++-----
 drivers/gpu/drm/radeon/radeon_mode.h    |  2 ++
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index b4bf5dfeea2dc..4dc77c398617a 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -1297,12 +1297,13 @@ static const struct drm_framebuffer_funcs radeon_fb_funcs = {
 int
 radeon_framebuffer_init(struct drm_device *dev,
 			struct drm_framebuffer *fb,
+			const struct drm_format_info *info,
 			const struct drm_mode_fb_cmd2 *mode_cmd,
 			struct drm_gem_object *obj)
 {
 	int ret;
 	fb->obj[0] = obj;
-	drm_helper_mode_fill_fb_struct(dev, fb, NULL, mode_cmd);
+	drm_helper_mode_fill_fb_struct(dev, fb, info, mode_cmd);
 	ret = drm_framebuffer_init(dev, fb, &radeon_fb_funcs);
 	if (ret) {
 		fb->obj[0] = NULL;
@@ -1341,7 +1342,7 @@ radeon_user_framebuffer_create(struct drm_device *dev,
 		return ERR_PTR(-ENOMEM);
 	}
 
-	ret = radeon_framebuffer_init(dev, fb, mode_cmd, obj);
+	ret = radeon_framebuffer_init(dev, fb, info, mode_cmd, obj);
 	if (ret) {
 		kfree(fb);
 		drm_gem_object_put(obj);
diff --git a/drivers/gpu/drm/radeon/radeon_fbdev.c b/drivers/gpu/drm/radeon/radeon_fbdev.c
index e3a481bbee7b6..dc81b0c2dbff3 100644
--- a/drivers/gpu/drm/radeon/radeon_fbdev.c
+++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
@@ -53,10 +53,10 @@ static void radeon_fbdev_destroy_pinned_object(struct drm_gem_object *gobj)
 }
 
 static int radeon_fbdev_create_pinned_object(struct drm_fb_helper *fb_helper,
+					     const struct drm_format_info *info,
 					     struct drm_mode_fb_cmd2 *mode_cmd,
 					     struct drm_gem_object **gobj_p)
 {
-	const struct drm_format_info *info;
 	struct radeon_device *rdev = fb_helper->dev->dev_private;
 	struct drm_gem_object *gobj = NULL;
 	struct radeon_bo *rbo = NULL;
@@ -67,8 +67,6 @@ static int radeon_fbdev_create_pinned_object(struct drm_fb_helper *fb_helper,
 	int height = mode_cmd->height;
 	u32 cpp;
 
-	info = drm_get_format_info(rdev_to_drm(rdev), mode_cmd->pixel_format,
-				   mode_cmd->modifier[0]);
 	cpp = info->cpp[0];
 
 	/* need to align pitch with crtc limits */
@@ -206,6 +204,7 @@ int radeon_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 				    struct drm_fb_helper_surface_size *sizes)
 {
 	struct radeon_device *rdev = fb_helper->dev->dev_private;
+	const struct drm_format_info *format_info;
 	struct drm_mode_fb_cmd2 mode_cmd = { };
 	struct fb_info *info;
 	struct drm_gem_object *gobj;
@@ -224,7 +223,9 @@ int radeon_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 	mode_cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
 							  sizes->surface_depth);
 
-	ret = radeon_fbdev_create_pinned_object(fb_helper, &mode_cmd, &gobj);
+	format_info = drm_get_format_info(rdev_to_drm(rdev), mode_cmd.pixel_format,
+					  mode_cmd.modifier[0]);
+	ret = radeon_fbdev_create_pinned_object(fb_helper, format_info, &mode_cmd, &gobj);
 	if (ret) {
 		DRM_ERROR("failed to create fbcon object %d\n", ret);
 		return ret;
@@ -236,7 +237,7 @@ int radeon_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 		ret = -ENOMEM;
 		goto err_radeon_fbdev_destroy_pinned_object;
 	}
-	ret = radeon_framebuffer_init(rdev_to_drm(rdev), fb, &mode_cmd, gobj);
+	ret = radeon_framebuffer_init(rdev_to_drm(rdev), fb, format_info, &mode_cmd, gobj);
 	if (ret) {
 		DRM_ERROR("failed to initialize framebuffer %d\n", ret);
 		goto err_kfree;
diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeon/radeon_mode.h
index 3102f6c2d0556..9e34da2cacef6 100644
--- a/drivers/gpu/drm/radeon/radeon_mode.h
+++ b/drivers/gpu/drm/radeon/radeon_mode.h
@@ -40,6 +40,7 @@
 
 struct drm_fb_helper;
 struct drm_fb_helper_surface_size;
+struct drm_format_info;
 
 struct edid;
 struct drm_edid;
@@ -890,6 +891,7 @@ extern void
 radeon_combios_encoder_dpms_scratch_regs(struct drm_encoder *encoder, bool on);
 int radeon_framebuffer_init(struct drm_device *dev,
 			     struct drm_framebuffer *rfb,
+			     const struct drm_format_info *info,
 			     const struct drm_mode_fb_cmd2 *mode_cmd,
 			     struct drm_gem_object *obj);
 
-- 
2.49.1

