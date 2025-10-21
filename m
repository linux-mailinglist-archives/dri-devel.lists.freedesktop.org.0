Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8715FBF9001
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 00:07:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A6010E349;
	Tue, 21 Oct 2025 22:07:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jPMTBpvg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC9A10E0EF;
 Tue, 21 Oct 2025 22:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761084426; x=1792620426;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=e1o03QrE/zs/bCpGVOuABRvoYRuQtuLUuvmUWsxtF0c=;
 b=jPMTBpvgK+RR5LxabbYRsyLjucWHUA1u18Xgjw5n04yRrMBp+OcO7MUa
 7fMzeoJxklS/lN/XDyy/S49Ph0gPoXR2wLOFwGfo03LFmkkGzGASef5Xq
 0xkkfx42UlNLjTVUye+JYF5MJ3VMnO64HDPsydBIvklT6COuI0prOAm5L
 MGFx7qzgktJ//WnytoaZLwlmxWyek5bGMkr6QNDF0TEQSQdRYNQTNNbl3
 2Fel7v8I9To+xLgNg2LYjV2HHeM5klUNtX5uGaGDhgLHiLSZ3IbTDTg0o
 GyT+2QSlo78+PsMoEynMHkA88pDXE+0WwKrJJPUwx1FIYhIUWWY8Hl+27 g==;
X-CSE-ConnectionGUID: h1EF9y4jQoeH8lDF8NNhUA==
X-CSE-MsgGUID: B9heRs7dR/uCXTA8F05SCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67086942"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="67086942"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:07:01 -0700
X-CSE-ConnectionGUID: DcaGwzWkQ92PfMQCbnkuqw==
X-CSE-MsgGUID: nCvxQyC6TZWkFHsOoI+ctA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="188983606"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:07:01 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:07:00 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 15:07:00 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.40)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:07:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gj5qTjubsDtRhnCmcRd/QiBgUwwPqtZU+YVaU2mUe6OnkjkneiSIbjPv6RdcuqIL7OP4/N7bhKX6RpyTZCwJJ6A9kjh60g1uq7UHLlYeE7VZdDdjSqOIdQ13v0Aa3MTd6UjWS1EBH9cavly1S1ZePa7tBshNnxvyJVo5VkoK3n8KJ1mmK2c4ya7ZMVZTuOtl5XL3ZB1wJUTsVXOiQwWZpqwlZv4xZuczLVWO+waAQFea+6/LYTxNEA6HWmBmTXubMi+iZDnp7ZL5Sw/0Ji664x6I6cQhdbbcuV1LlnLta/Ktoxlqou7jr49+AwK7FDfUvnQr74n8zB3+ziKItp3Ogg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fxGUxIfZZcroliACPgV6pH+0oi3EM7+wgiedeqZvPuE=;
 b=mCiqgEae6kzAW1lFufvfy/cAGq6wEj4O/0l0A5pSVHjcqBMW/k5qwaLy56QC0hs3gvyRPLql+SDC7d2/q8tJVZ1wIpfRItOoEBhEI8z4VDkQLGAKPuGbUkz+JRIEwsdbbDBqvhYPIibk3C7Q7LsgTqalis3U3usElpfOhqNv0c6SVkWJDxonZXxjWlvPIJ2bM1wKd05wc/vT5cLlj1x52io/ULGFRnauoQ1pYGUodFsuWw7d+mO4bc9vQvE+LEKwhNZaEOt4CS/2tyVzDAZajKMBl2iHoh7yGa3BSMLfsewoYIz94187zACS3fNYFLCfbwBUOudnIdEr1KQuw0ysVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5868.namprd11.prod.outlook.com (2603:10b6:a03:42b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 22:06:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.015; Tue, 21 Oct 2025
 22:06:58 +0000
Date: Tue, 21 Oct 2025 15:06:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tejun Heo <tj@kernel.org>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <jiangshanlai@gmail.com>,
 <simona.vetter@ffwll.ch>, <christian.koenig@amd.com>, <pstanner@redhat.com>,
 <dakr@kernel.org>
Subject: Re: [RFC PATCH 1/3] workqueue: Add an interface to taint workqueue
 lockdep with reclaim
Message-ID: <aPgD/3d7lJKoSzI8@lstrano-desk.jf.intel.com>
References: <20251021213952.746900-1-matthew.brost@intel.com>
 <20251021213952.746900-2-matthew.brost@intel.com>
 <aPgBjmIm6n9H-R_u@slm.duckdns.org>
 <aPgDXsQY5qAfU0Tv@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aPgDXsQY5qAfU0Tv@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR03CA0150.namprd03.prod.outlook.com
 (2603:10b6:303:8c::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5868:EE_
X-MS-Office365-Filtering-Correlation-Id: c7d18d8a-41ed-4b16-30d5-08de10ee278d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bmdXR0xqeG52TWVpOUFqRkFtQUs3Q2svUFIxL1A4S0JlZXNDaUNFeGZJbUJu?=
 =?utf-8?B?eE45Z0dyYk52MlA3S3dkT3RnYytyQkJpK2V6anRrNi9pN2ZxcUZidCtVU2JI?=
 =?utf-8?B?ek51b1pXbW1GKzhCbml5ZnNxbjdhYzMxYTl0VEk2ZTY4Y1Y3TXNpdC8yQmF0?=
 =?utf-8?B?OExDcDdpbVNpZXZtbmVydjBZRGlpRFRvc0J3eWlSbUNOamIzWmdVK3E0MDFC?=
 =?utf-8?B?WkRZSVZoWkswbnJpUFBFTVZscUpDd29mRy9TNytOanBDM3RZeW5MeTBBai9L?=
 =?utf-8?B?QVJ0Q2tlRmhiRS8xRDNjcUxMQldKWVNydEJRM0dQTmswd0J0MUpXaksveFlr?=
 =?utf-8?B?T3lFSXhGMVcyQ2tpc3kza1I0YnN6dzY2d29IbVMrbThrbmRpNHNSanQ0NXNa?=
 =?utf-8?B?NDV4MWdzbUl2ajh5b3NsMFJSSHhoS2xyaFpnNXNHcjljVVhZdC9HLzJaakJj?=
 =?utf-8?B?ZXhYS1hlRVhpY1NXT0ZLTXl6WGNMSGRtS21UQVAvaDNtYm0zUUQ1L1NXY2R2?=
 =?utf-8?B?akhGOHE5b1pld1JBZThZUHpYWWx5Lzg4dzdQSVRXakd6a1QrQTQrZmFtZ2JE?=
 =?utf-8?B?UUlJN0NJMXdjeHZMTWdkL3RZbDBqOSs5enJpU2Q0YTBTWmVuN1luT3RKaW9O?=
 =?utf-8?B?NEFTODVpdmhVZTVzaGZGQUNBV295YWFENDNRZTJNejFzbTg3cTBGT2dJNnQ2?=
 =?utf-8?B?SWZ3UzQ1NDlEMC9nWUpPUmVEbEFucVlLZmV3M2d3MFdPaTFBRXFJSDc2MnRs?=
 =?utf-8?B?eHk4WSt6Z21ibE13UlY5Tmo2RGMxVklUcjBVQXdCR2ZZMENpSXJzVHRYOVlt?=
 =?utf-8?B?VmU0ZUFkRE9SVEZzSXBZMnZtOXAwOUtRbjVEY0F3RG1YYXRiK3YxMHJQUUt1?=
 =?utf-8?B?alZGNDA1dWsxVStSTUgzNHNGSURqUnF1WmhtUFlTUnN1b3FCQnNUblAwdUha?=
 =?utf-8?B?cG1NVUE2ZGtaYzdEM0UzWDQyODZXZWdRazJsWklieGVoM1VLZFJsRmZZRURT?=
 =?utf-8?B?ejk5clRucUNPTGNrc1pzQmUreVJ5cTJ0Z2R2NGgzc0ZUNGs0dXhRUGs1Yk9F?=
 =?utf-8?B?cHlTS1pxNGphNlAyWldadzlWMGl5TStpTFNtdnJ1N2VXTnlmM0toRXA4M0hB?=
 =?utf-8?B?T2p2RXE3QlFNMU4zcTlWVlBUMnZnRkRsY21xVkFGcFNtbGJxaUpubGZKZno3?=
 =?utf-8?B?YkZiTk8yNXZtU3paSU9xamdzNkplUXdJSGJIci8xSjBPcUFrMkIxaDJBMHR3?=
 =?utf-8?B?M0tUUi85ZEMrSEhxMFRRRHUvMzZERjRPaXJqU2d3SGh1WmNxQWJKWEpLeThh?=
 =?utf-8?B?MjZXZStDL3RVdmw2ZjdoczVKbkRSemNIckFaWTdYNU9WbTh3REFOa0tEUllU?=
 =?utf-8?B?Q2djcmFlRDh5djdkS0JrSnNuSllFUWNBdzZJbkRjY2lqQ29XTDc5b2R5OExU?=
 =?utf-8?B?SnNkRzFlM2tVaEtJajNka0h3RGdMd0VvREh0UHh6ZFFkSmRQNFJXcUpCR0Vz?=
 =?utf-8?B?c2dZbVFqY1VsMXZtVlBmSVFkNnFBSk9TemhWd3BuUGNMYnczMjFTZUQrMmQr?=
 =?utf-8?B?WTl5TWhoTTZ1bWVNK1h4cEh4UHhzbkpXdHFPMW1HRVBNN0VkKzhKeWRWODd2?=
 =?utf-8?B?M2lnbC9MeTVCY0pOZnZKV2h2dHljcXdISlpEZkpQK2JSME1tNTFmM0JLQVlV?=
 =?utf-8?B?ektQTVVkRG5tM0tOWDdEWjRWaDkxV3hyV3ducXp5OTRwMmRnb0tXTXJZYkpM?=
 =?utf-8?B?R0NjM2FtRnlmTEtJaVNBcGI4Q2EzNVJGaWRmaHFoa2tIVmY5ZHZKN1U2cFE2?=
 =?utf-8?B?K3F6WmxnOFFkOXFMc1pzUXloNGo0QWRkM0Q4WVdwOTA5ckEyOGVlZXFPN3Vq?=
 =?utf-8?B?blM0U0dYTUd2Z0ZwL2ZaWjJYTnB5MG9CWDh2QW44WE9vTk5SNkZMRVZ0Q2hX?=
 =?utf-8?Q?XMLY6CPVy0Qd1cSHyt9eW99Q4s0XRnk/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1lYbzNnWnZWQzdpUWNEWS85UXpZTklocktuNjd1c29lVStCMXZTN3lVYlVi?=
 =?utf-8?B?OENEcmYwSGNYS01BU1VaT295K2h1MDZIb3hsV0xTdXNEUVd5eWZZYVJ2Ly9o?=
 =?utf-8?B?aVZUVjluMm5WVE5JYi8zdWkrald4NEdCN01UZDd4VWJNVTRkRlRscVNkSDBu?=
 =?utf-8?B?S0VWYStOcFJ4d1R0cEwzVERzSWEwSzMyQkVnNTMvT3pvLzJxL0p2bjdHQlVX?=
 =?utf-8?B?L0NVNDdlTlJYMlJnaVcrUE03T3B6NTViaHlEbDFSUlJsOUZCZThLS1JsdmJK?=
 =?utf-8?B?ditYYTRjYkdIdlliUUxlSys1Mjl1MlBoelBoUU5VdFdwcFIrd2JMTEpUWW5s?=
 =?utf-8?B?VHQ0OVBxdGU4WXZaV0xoaFlkbVZPUjZQb0oxb05LUFBzMThiRVUxcjVGZjRQ?=
 =?utf-8?B?dWhMRHdML2g5VUVzbnNLVGt3U0RieXF1VnNpaTI0L2dMK1BwcGFzZlhKWUJ3?=
 =?utf-8?B?Z0NwNmcyQndtSFc4VHhyVFRGcW5OU29FekhaUmo4c3VWakRSWG8rRUhxM3pJ?=
 =?utf-8?B?YmNtQmRQVmRaSndJVm05amRHb2JTVmJNVUdYd0MvSkJJc3EybnZQZ2xTaFZh?=
 =?utf-8?B?dGpYNGYrSDBicWFzVHBRQVdUUE1qbEx2bCtETlQ1YVkxbEJna2FzRVdRU3BF?=
 =?utf-8?B?SGlRaFVXalpuQ0VKMC9XZFpIbzdzQ2MyclJXNmFSMkNFNTlKbExmTFBaMHYx?=
 =?utf-8?B?UmpXNFF6NEw3cWFnTUFVTUJOdWJ1eFhXY01aUDJzV0hZQzhsQlRvWEprc0cy?=
 =?utf-8?B?K2pUU0lFSmhVVHBzKzFOLy9kREFkSEd0UE5xVWlvS2p6amkyd1V6RzRucFp5?=
 =?utf-8?B?WCswQ0xtTlJWT0NaODBwdnJHRHBzWjFzZW1YbTFWS0UzTVgxWWhvQURjVzJs?=
 =?utf-8?B?Y2MzZ1MzOWloemlrVXZoM3NHLzg4VzFGTStQckE1VS8wamY3UXd0WkZZckZQ?=
 =?utf-8?B?RWp5YkZpZGN2WHhJRUZyZUFFYkc3UTA2aGtDQitDbE5IRk55bFYxbUZFU05o?=
 =?utf-8?B?bmFxak9CY0h1N1l6MldLMkw3UzlEMGVQaEJEaUhVUWRicjRpVyt6TDBrNTFD?=
 =?utf-8?B?bjkxQXdKTm8xR3VPdFM2ZFF1bHI3ZjJGYUJpaGFCM01LMHR1VkVTUkw1WUhX?=
 =?utf-8?B?ZGMwRXFDRlROZGk4dzh5RTZtV0NocTBoak8xZjV5TFJzbWdGbnFQWWM5Yk15?=
 =?utf-8?B?RVZoZFovdkF0a2d4bGhmL0QyRlQvcmROYkRjUld0aTFTMDlPd1YxVHptbmZq?=
 =?utf-8?B?WnZFSDlNb252SlE4aDZZbnBzTzUvblZSeC9CZytJcjAzTFlxMS9EQjRZYUxt?=
 =?utf-8?B?cTd5SVFLSnMxL2lFS1dDZ2ticzgvdlZPY056S2dOUTFla3hOSkd6aHQzcURW?=
 =?utf-8?B?YU5TczQ3SHZMNXdoYmU4Zmx5S2szQ084YUROZTRQdmI3anFRNGVhbEo0SmpV?=
 =?utf-8?B?Nkhyb2dDZ3IvT0RHWDFwVDVhZVJEdzI0RHJvQks1dEZ1TUkvdUIybVdSOFB3?=
 =?utf-8?B?SGQrOEdtendFUG5tLzFDOGc1MTJacXlyRWszdGJYdXhSYVJTcXJyUGwxS3hL?=
 =?utf-8?B?ak9ZSWtJdjU2aTVUTmpkaW16RE9MSDJRQzEyK2JlNTZralh5aWdZK3BzQnpl?=
 =?utf-8?B?eDM4bTdkOFQ4UnpXem5naC9KQWFBZHl1YnZFVDJuQjRpWGpHdmNyNEFhMG81?=
 =?utf-8?B?bzMxbTI2Zkk2N1drYmxTeUx0TCtTcTlxeWlvejQwYkF6UGFianJwNHJKNU5C?=
 =?utf-8?B?dFZJVTFWOEhveEl1ZFNRMFd5cDNaRHc3eC94YjliWUU4eGZaSEwzSUFTcks1?=
 =?utf-8?B?L1YyOFllK1IwUHFsM0M3Zjd6YlM4UytOaW11c3Q1dUhGKzhEVHE2aWxpbkRO?=
 =?utf-8?B?NjdmbFdZYVd1L1lOZW5jMldLTHpHampGcWdGdXpUS2I3WDhBclU1WlZzdlk1?=
 =?utf-8?B?SXNpd1B2QThiZlBkd1lIa2ZYaGhNa0VFcWdRS1ZSK2hOaVFHOGowd1puOFVa?=
 =?utf-8?B?dDFZMTd6cDdmMkN5WlZyOXdqM1BoSjU5aW84Z2xIcWV5NzU5TVBWbjMxYUZT?=
 =?utf-8?B?bHZ4dSsyV2s0M1BWaHNLQTBnS0tqSzd4OHkwNU5ROGFDZTZJOUExUk8rcThU?=
 =?utf-8?B?Rm4rd0VwZHYycHRPOWc1VjlXbU9CMnNCdkI5SEZKb3E2WmdoNk5pWEtRU0hi?=
 =?utf-8?B?bGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7d18d8a-41ed-4b16-30d5-08de10ee278d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 22:06:58.6461 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m1QIH6wHubLpFKbr3dXYVS28MWnHnjNzi7WzVFsZJPOJrM+r+Go4FWEPSbVlIbRTYEN1oddKMKs+goGag8UJew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5868
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

On Tue, Oct 21, 2025 at 03:04:14PM -0700, Matthew Brost wrote:
> On Tue, Oct 21, 2025 at 11:56:30AM -1000, Tejun Heo wrote:
> > Hello,

Missed a comment.

> > 
> > On Tue, Oct 21, 2025 at 02:39:50PM -0700, Matthew Brost wrote:
> > > Drivers often use workqueues that are in the reclaim path (e.g., DRM
> > > scheduler workqueues). It is useful to teach lockdep that memory cannot
> > > be allocated on these workqueues. Add an interface to taint workqueue
> > > lockdep with reclaim.
> > 
> > Given that it's about reclaim, "memory cannot be allocated" may be a bit
> > misleading. Can you make the description more accurate? Also, it'd be great

Can fix the comment. The rule is memory cannot be allocated in the
context of reclaim (e.g., GFP_KERNEL).

> > if you can include an example lockdep splat for reference.

My driver (Xe) doesn't break anything but can hack to trigger a lockdep
warning and include it.

Matt

> > 
> > > Cc: Tejun Heo <tj@kernel.org>
> > > Cc: Lai Jiangshan <jiangshanlai@gmail.com>
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  include/linux/workqueue.h | 19 +++++++++++++++++++
> > >  kernel/workqueue.c        |  9 +++++++++
> > >  2 files changed, 28 insertions(+)
> > > 
> > > diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
> > > index dabc351cc127..954c7eb7e225 100644
> > > --- a/include/linux/workqueue.h
> > > +++ b/include/linux/workqueue.h
> > > @@ -553,6 +553,25 @@ alloc_workqueue_lockdep_map(const char *fmt, unsigned int flags, int max_active,
> > >  						1, lockdep_map, ##args))
> > >  #endif
> > >  
> > > +
> > > +#ifdef CONFIG_LOCKDEP
> > > +/**
> > > + * taint_reclaim_workqueue - taint workqueue lockdep map with reclaim
> > > + * @wq: workqueue to taint with reclaim
> > > + * gfp: gfp taint
> >       ^@
> > 
> > > + *
> > > + * Drivers often use workqueues that are in the reclaim path (e.g., DRM
> > > + * scheduler workqueues). It is useful to teach lockdep that memory cannot be
> > > + * allocated on these workqueues.
> > > + */
> > > +extern void taint_reclaim_workqueue(struct workqueue_struct *wq, gfp_t gfp);
> > > +#else
> > > +static inline void taint_reclaim_workqueue(struct workqueue_struct *wq,
> > > +					   gfp_t gfp)
> > 
> > Would a more direct name work better, maybe something like
> > workqueue_warn_on_reclaim()?
> > 
> 
> Can rename, but perhaps not needed depending on what we land on below.
> 
> > Hmm... would it make sense to tie this to WQ_MEM_RECLAIM - ie. enable it
> > implicitly on workqueues w/ the flag set?
> > 
> 
> I had considered this, and for a while I thought WQ_MEM_RECLAIM already
> did what I'm suggesting—especially since I’ve spotted bugs in drivers
> where I would have expected lockdep to catch them.
> 
> In my opinion, this approach is better, but it has a broader kernel-wide
> scope and could potentially break some things. My subsequent patches
> will likely break one or two DRM drivers, so it might not be a concern
> to fix everything that breaks across the kernel. It's up to you which
> route we want to take here.
> 
> Matt 
> 
> > Thanks.
> > 
> > -- 
> > tejun
