Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNewMVmae2nOGAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 18:35:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A41BB2F7C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 18:35:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A818A10E1F8;
	Thu, 29 Jan 2026 17:35:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kbp1nysx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E1510E1F8
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 17:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769708116; x=1801244116;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GkS317u+P/uDCdGYEKsyYgQgo9bYOdAAPHg1egCQLKU=;
 b=Kbp1nysxhhRuKWlFBGWeXerIU8k2IXq8zpqckeE1uH7oZ0MZiQa+l+sc
 mNLW5c73+y3W7roerZYarAfcOjKpq6PAKt1+gcKOZNO66jnF/on+kRl2m
 /sKLV7TZI5LyPDaeM7iyMAIXYPJJwKDM8LkNNhm0j7L4YQcbEcxIsD5rf
 9xMa5opEt1EV+bykOWyYy0DcCN2gwqY3PPEad/hL6yaIsxnVtnpJ+KRzn
 7+hiPd+tiCk8sDWM4dzX0YB1GF+SBQX0rbDiGuXKrT4DuRAkTWOuAuU4y
 WRcgi5k2OjFVTXM55KaU69sR+qX4urjk/lygrnSZTDX1JcyYQEgBfwxaZ Q==;
X-CSE-ConnectionGUID: BV1/2ChCS5idr+Jj7QJeCg==
X-CSE-MsgGUID: AM1epPZaQ025THLorwthdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="81688097"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="81688097"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 09:35:16 -0800
X-CSE-ConnectionGUID: 7W9ye0FgTyaEm9cEfalmoQ==
X-CSE-MsgGUID: 8iMt0VNdTWSUXr1S5rqhXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="213130565"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 09:35:16 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 09:35:15 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 09:35:15 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.21) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 09:35:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OAmJ+z02bOZPKix/BE40lJGDi/94dLh3DCWwnuX5BvFO0UWmCx8u1heBE29Cx1BZJw5mt6DD+SUglYAm6dPD9s0SSO5gj5ShwPdecEqXtNGIhH4BAeMpedMIr6Vh2TGaOmfJlqyk9FTMMAhj0H2KdFROwsXsjUX0psXAME5TUHJV0+zWSkok9xGxZ5lsu5dLXzGzpkfXM8tmP5QyuZaI9X3qPYsLeGL4tlHNPIC/w9gupOrGhVUnXCUIVfKCSe5BTNI+UAO0WKWzDwG7ofyf1GtBWthPNepA8f7CTzsblFdVt6qSaDsEqA8mKlXLCZFkrkeu8hzBQjp1EXF3rMA6wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T8peNjP+vBhuOhW/LYpaJx36pjULLQI03wybu68Hm2U=;
 b=QbRcdtXC1w7pOvu1l71Y2qGEbWhsaSk4mA5ZPcZqOkqu09lXu7xlzsjNYQKXr9MLdVdbXdwh52fGf6HhKq0ECjF22kwq5Ngj6rDIUeNTPkXtANFqIkBp4p0Ggb6JKeI/RCkAPyhPlNPLFdY/ZCxAlBj92o2NnGEoCYBYZ9pUVizE7sabJYzWLAkCWZ1jGg8JJTUSQ/TDu9tf1WgqP+E/6vMqaCVgJDjtQL8XzpEfPO+DzGLgxOr0aWLyqBbg/jzzGPOKet6mIlYEtaU4yJaWDyyebGZAQbHwn2e2J0HOrokdbWzkcQTW6L3UvrZ0tbBOCUi1ioORVjiGMJR/dYaxkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by BN9PR11MB5321.namprd11.prod.outlook.com (2603:10b6:408:136::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 29 Jan
 2026 17:35:11 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3%3]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 17:35:05 +0000
Message-ID: <88f33e4e-5d0e-4520-a399-5be2901a3281@intel.com>
Date: Thu, 29 Jan 2026 09:35:04 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mgag200: sleep instead of busy wait for BMC
To: Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>, 
 Jocelyn Falempe <jfalempe@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>
CC: Pasi Vaananen <pvaanane@redhat.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
References: <20260128-jk-mgag200-fix-bad-udelay-v1-1-db02e04c343d@intel.com>
 <338ff7cf-1c7d-48da-b1b8-37aac440fed0@suse.de>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <338ff7cf-1c7d-48da-b1b8-37aac440fed0@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0252.namprd03.prod.outlook.com
 (2603:10b6:303:b4::17) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|BN9PR11MB5321:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ced7b56-9c68-45fb-d4f6-08de5f5cbd6a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NXJsbXBySmFLaWNWams0UW5NNVBRbnVLQnRYQng2eU1CMTVpekNSYS8wTWlY?=
 =?utf-8?B?NTFsdzhTL0NMcjluVVhVdHpHUDlBdEpVVnJnR01BVUZEY0lYeEFleXBTNncr?=
 =?utf-8?B?ZDdlSDNyK21KUE5rcWl2WjdoRWREdTE0eUY4YWlleFRIT1R4ejRwTVIvU3p2?=
 =?utf-8?B?a1VPRHQ3R1h5bzNXL0Evd0tCa1MrK3BrU294bnN3UmlwbExUaGhoRkdEMzVQ?=
 =?utf-8?B?WU1lMHdDTDgwZml6ZXBOTlRpNXhNc0N0RURrM2VobjF3Zkg1UGpJZ1ZYS2FF?=
 =?utf-8?B?bTJnTzBtQnpqdzJ3WCt6T3VRVXhvV09weFJueExIRHNPWW9pend3NEh5V04y?=
 =?utf-8?B?eHZJbnNSRnBibTZXaWF1Ky9ySWhEUlUxRmRqWTlROVgxRFVOT2ZjVDFJd2oz?=
 =?utf-8?B?blpycE40QzNkcE5Qdm5ralNWbmJ3RVF0NWFtdmtkS0dSUW9VZ2hqdFc2bk9x?=
 =?utf-8?B?T0FGQmJUT3l0TmR0Zm9Na0ZUVTJXSTlmSUs0dFBaZXF5T25zaFdDRUpVcm9p?=
 =?utf-8?B?RlpVZUpSSUlLNm5pZjY4Yjl6d2pXZlJTWFlxVVNqeldvZFU5M0F2RUNGSmtH?=
 =?utf-8?B?bWdHVDNSZTB5dFNMdlZKMDJ3TWJCT1VFSFpDcGNTZkQ1MFd5Q3hURW1IZ2Rl?=
 =?utf-8?B?SGp5SWdxcGhsaVZaeEZ1ZjhyT0tjb2RxTXJVQmtkYXowc1pXRk5hcFlVTHoy?=
 =?utf-8?B?V0dMZklVOUNFQ2xsWEFPRVU3VmZoUHBnclVMZjY1Q2hTL0N0ZlRCRkEyR3NN?=
 =?utf-8?B?TlpKRVhlbitlMm53STNUdjlYZFJ0bzVEaEN2UzQyYUhkVVh3N0tnREg2djVI?=
 =?utf-8?B?NnlHNVk1REcwOUdYUU9zblpvTnBBNEJ4TEZSdTVjQk1aZDM5U1lSSkdza3VZ?=
 =?utf-8?B?NVduQTdxcXRkTDlrajBwZ042b3JVZVIxVXdMVERTc3dXSlJPMHBvdnlvUDhJ?=
 =?utf-8?B?RFpEVkRncEcvdkd3cTgyaFc5ZW9kZU14K29yb05mTE11NEtrd054c2lEUVdX?=
 =?utf-8?B?b21Ya2dMR28zNC9TOGRDNXNWWmtJYm1pS0MxRUpQaFh5dHdZVG1TRlRKUzlm?=
 =?utf-8?B?eTN6TWRQTTR2SHhvYkdSOWlpK0htZHdSSmxYbnFRN1RpK1ZVNm53bk5raDBh?=
 =?utf-8?B?MVo2UTBkSStCQkhzY29vaW84OHZVTXN2eDB4Z01NNDhZVGs3eC9CdGdINjVY?=
 =?utf-8?B?ckJKVTQxWUFrNVpyOTAyYlVweE5aYUtmazI1bVB4K1J1RGJFTWJ2TC9JbGlH?=
 =?utf-8?B?RDdPSVlCblpMdDhEZTlUU2VQUFcycFdnbU1zenhUZXFjNXhUcTJzRDYxb1pr?=
 =?utf-8?B?QXdVTmdMdFIyc01UZlA3bVVhRklDU2l5ekx5QUxaczJrdmNtUWJoYkpKRDFa?=
 =?utf-8?B?WTA4SmdianRlRnZMenlKRFRKQWJZVTN0MjJsWGdGU3JraStDb29ZbmV5OFQy?=
 =?utf-8?B?WUE4dFl2cVg4VmpnRjFDTkhyRi9NbzNzSWlIU3MzSCt5VDFFcjZ2OW9mcVlo?=
 =?utf-8?B?bFRrRG5mTi93djRDSVNRdlkvMnRSK0x2cVlnTzBLbTV5dTBHSE1xMFhPMVdR?=
 =?utf-8?B?b2t1OGF0QStrN0FiV21vZGFHY1RGL1ZVZzdxWE9Xd2JJSFBFTW5UMEtUbDVp?=
 =?utf-8?B?ajc4b2tQZVVORktYSmlJOXdzenZ4bTIrMms4dWc5K1h2eTREZFZhZFpxUHlZ?=
 =?utf-8?B?Z1pRRW1oN0JxVll3M2QyQlZBL2NYSjBrcDNRa0J0ejdmeHpCTERWa3ZIbDRY?=
 =?utf-8?B?aFNMMFZJLyt1SXI3UlhSYWJscmJqT1N5Q2duRk1SeCtINGpHeWFsMVlOS05M?=
 =?utf-8?B?aisrbGZxMms0aUpLeHJCOERYT0lFWi9nbzV1d2tCMHU1NFhRU2dPMkNtbWMv?=
 =?utf-8?B?OXBqN1pLT1hCNHp5SW5tZ0JZRGdQLzB2cVptQjYzUTFsRjg2OXBLeFlrYjli?=
 =?utf-8?B?c3hSWlV6WmZGOVRBRXZLd003bXVkSTUxN0JtYWxjS05mSXNvWG5Gdjd6bDJ0?=
 =?utf-8?B?QnhEc25JUzM1dXRhcWRvSUlxSi93WTVnV3NGRS8rdE8zOTBSQkgyRlVxMnNw?=
 =?utf-8?B?TDQwMWVLTThHYWpYOTVDaHFiNlgyWDNVbGpsU2FwNXh5OE9FdVQ0bkFoaGE4?=
 =?utf-8?Q?6GNM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5089.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjZpVVE3c2RITGdXZkptZ3FRWkc5bVkySjNjbW5PRDg5VFZBdGZidVpLd3RR?=
 =?utf-8?B?NzFUN3kxL3lxenVBZVRUU0tDOW5zT2JzcXZYTnFOS3BIZlZrZSs3TUJkZkN2?=
 =?utf-8?B?NkZUTzV2Y1lXNkN0YTJPNm1lZjNKd2tLMXpMUXFyM0VxZVA5Y2hXdlVqR1Rt?=
 =?utf-8?B?d3JHdkg2cU9rT1puMEJRdmgvU2Jqek1DT0pmMU42Ry83TGpIZkFGUmJJNmdK?=
 =?utf-8?B?ZHRpNFJBSHkvVG1YcXh3MHd2Wk94OHNWRGhjRlJVdjJJeVd2YTY3YjN2V1Fm?=
 =?utf-8?B?RGVvL2hiMTJMc3FnTmJ6RTQ1bThkeHJ2Z0dXK0VUUUpybDBhVzVhSUlRUklL?=
 =?utf-8?B?OHQ5em5wSHlXSmVIdndYckkxaFVwY1kyZ1ZJMnFuek45T2d3WWwrOG5nVVJC?=
 =?utf-8?B?RmNCelZvYUY5L3RNbU9wT1BJMzBRdkphenBveFo5VER2dXdVSFEvYmZtRXAr?=
 =?utf-8?B?K3ZuWE1wZ01rMEZhbEFCTjBKQXltTzJFMFVWcG5sU09rM0RLc3MrYWM0ZXdH?=
 =?utf-8?B?c0ZWSG0rc2sxTkZiMkJObTFFcXdoU1NJbDQ3M3BOa1NXZnEzeTNmMGFJemRW?=
 =?utf-8?B?V0lHK1pkR1EvTjN5T2V1RmhMK1EzUkV4Szhsb0p0R1BzRGhxenhSd3QvUGcy?=
 =?utf-8?B?R01kY0NJaXd1NDVGeFpSS1RhQWhxQytnNWl6UUNVeldhbmpuNXE4b1FiSS9m?=
 =?utf-8?B?dmN3YTRXd1NJUVZzamtvK0FhWmwrL3lJZmNrZExrMG9WK3ZTOUJ1ZG53cjE2?=
 =?utf-8?B?Ty9yQnJjcmxBbjUyNjNrbDhFT3lXS3lVbVBhWDRwTE1ERlNSUmNFUmZBK1Uv?=
 =?utf-8?B?T21BakNxMy9GdjB5ZmhtZXcvU01rbmgxTEJ4QmsrWm5wUFFvS25YQTVFSmtQ?=
 =?utf-8?B?dmJFT3dFYjVWQ3VvN29vY2VjNFRDTjhtUnMzYVZBNWVwdmJQRC9lUmdCM05h?=
 =?utf-8?B?WW56cHpmOWtzZ1lsOFJuSmtFTkpCNFRodkFrVmpOMlk3ZjYyYlBGSWU5eHc1?=
 =?utf-8?B?OXA0UDJ2M0pQRExlVk5wZ3lMbnNxd0g1NzM0Q3VUSVc2YmlDUnlCSlg4ZC8y?=
 =?utf-8?B?RmozV1RHTmErVmFBN21YT0ZCemJ3QXZRMlY0cHZKRjdUQ0hwZ0VjRStHeGRh?=
 =?utf-8?B?U2JYMUZwYmlZS2ZuNStaYWlUTXRVRStVb1RJejB0dm9tYW9sc0lsSStDaE91?=
 =?utf-8?B?TkJSdzIxSGpJdngwQXVwQVFKd3JYeGVRNnVuZytqZ0w0NjhGNy9pemVjNG1C?=
 =?utf-8?B?elRWK3prY1p4UC9qZTg2Z2dVbnF4K0Zpd2lJekl1eURvMllsMTFiNGRNeW9O?=
 =?utf-8?B?NDA0WkVjRmJXVG5wSkhzUmo5YXkvY1NrUUR6NmdLSTI0K2J1L0lEbGZuQkxJ?=
 =?utf-8?B?dVZLSzFZbWpzM0hSWnc0SldNQ09VMVkvL0lmNDFFemRFaXkwNURkMitPQlZv?=
 =?utf-8?B?d2hiMzdLbVRmVnJFZDlvOVp6YzdUL0s2WUZBUHVHRXR1YUlCUHdiWSsrY0ZS?=
 =?utf-8?B?b3phVUF3QnVrSWtQWk04ZS92QWh0TVM3dG9rS0lUeGU2YzI4RTA4dWIrZ1V2?=
 =?utf-8?B?Uk54bUprWVlzT29zSVNIbk9YdW9lSk8xdWFzeW5qTENGK0tZZk1XckFQTTBH?=
 =?utf-8?B?Q1g0UDhhdVNxT0pCbzhGblMyZnBxRnFTU1hlMU5MUWRyL3NRRUVGVFJqc05O?=
 =?utf-8?B?Q0lVY1REZjlyY2QvVE4wQjBxamtzTndZUkVpb1pCbEVKZ2RkS0RlR3RPeDd3?=
 =?utf-8?B?cXRHa3RicVU0QmhjSkk4bWtXdG4zNjJybGpCZWkvSDFZdXdLNTdnYnVoQU9V?=
 =?utf-8?B?QkVyaHJZMEVjSjRDOGtsWTExK3dKTjRzdzF4Qy9EVHFWVndOSDJDQjNYN2ZB?=
 =?utf-8?B?ZmRQRjBrTEh3TmsyKzNiaVNVL284bDF2a0t6WHdXamZUNVQwY2RaZkVRZEtj?=
 =?utf-8?B?ZEwvM1RZTFIrWmxaN2FQMTdXeDVwZnhGRUovOE1GcXZ6dkVPQzdWZ2FaOGNM?=
 =?utf-8?B?WUpmaUVFRHpLakdDVDBUM0RXYWxxeU9LT01YaURhTkRmRHNjRU5UeU5mSTNm?=
 =?utf-8?B?VGlYUXBNUjFBSlAzQnRHanBvMGcxWFN0OW11N3Z4ZlU4OXl6ODdCbTN6MmMr?=
 =?utf-8?B?Z00xUER3VkRWUmxLNG9MOVh6UXFRa0lUbWVSbks1Yk9ENm5KY2RIalowMWVS?=
 =?utf-8?B?cG14VjBRVFNDMk1HajNDUnZ6Z3dEbUhMaGZjZVJCdTFLcTl2ejAvN1hoRlB1?=
 =?utf-8?B?cmFXMWtHNldJTkVEdFIwNkZGUVFzMTRkcTJ0MjJNTHcrU0hwOUlTQkE0aEsz?=
 =?utf-8?B?RG14RUdCcDZ5bFBuRjViNmhSTUNsbytvVTc3b2hGd3Nra1BjWk8vTTNLWjlZ?=
 =?utf-8?Q?X7ndsb+xcaAPZ3Qc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ced7b56-9c68-45fb-d4f6-08de5f5cbd6a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 17:35:05.3623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h1hdZs6+5QbninYeZEZ392+ZPJ7s0wpmJ0HusbHiERIBSIPgyRDbYDW60ZYJzneWhXK1xK46C74i5CJNRWcCvTfJhjJJMzdqTmKbjfeHMr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5321
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
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:airlied@redhat.com,m:jfalempe@redhat.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:simona@ffwll.ch,m:pvaanane@redhat.com,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:mid,intel.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jacob.e.keller@intel.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[jacob.e.keller@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 2A41BB2F7C
X-Rspamd-Action: no action

On 1/29/2026 12:15 AM, Thomas Zimmermann wrote:
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_bmc.c b/drivers/gpu/drm/ 
>> mgag200/mgag200_bmc.c
>> index a689c71ff165..599b710bab9b 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_bmc.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_bmc.c
>> @@ -1,6 +1,7 @@
>>   // SPDX-License-Identifier: GPL-2.0-only
>>   #include <linux/delay.h>
>> +#include <linux/iopoll.h>
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_edid.h>
>> @@ -12,7 +13,7 @@
>>   void mgag200_bmc_stop_scanout(struct mga_device *mdev)
>>   {
>>       u8 tmp;
>> -    int iter_max;
>> +    int ret;
>>       /*
>>        * 1 - The first step is to inform the BMC of an upcoming mode
>> @@ -44,28 +45,20 @@ void mgag200_bmc_stop_scanout(struct mga_device 
>> *mdev)
>>        * 3a- The third step is to verify if there is an active scan.
>>        * We are waiting for a 0 on remhsyncsts <XSPAREREG<0>).
>>        */
> 
> Either these comments or the original test seems incorrect.
> 
> The test below is supposed to detect whether the BMC is scanning out 
> from the framebuffer. While it reads a horizontal scanline the bit 
> should be 0. That's what the test is for, but it gets the condition wrong.
> 
>> -    iter_max = 300;
>> -    while (!(tmp & 0x1) && iter_max) {
>> -        WREG8(DAC_INDEX, MGA1064_SPAREREG);
>> -        tmp = RREG8(DAC_DATA);
>> -        udelay(1000);
>> -        iter_max--;
>> -    }
>> +    ret = read_poll_timeout(RREG_DAC, tmp, !(tmp & 0x1),
>> +                1000, 300000, false,
>> +                MGA1064_SPAREREG);
> 
> The original while loop ran as long as "!(tmp & 0x1)".  And now the test 
> stops if "!(tmp & 0x1)" AFAICT.  This (accidentally?) fixes the test and 
> makes the comment correct.
> 
> 
>> +    if (ret == -ETIMEDOUT)
>> +        return;
>>       /*
>>        * 3b- This step occurs only if the remove is actually
> 
> Since you're at it, maybe fix this comment to say
> 
> '... only if the remote BMC is ...'
> 
>>        * scanning. We are waiting for the end of the frame which is
>>        * a 1 on remvsyncsts (XSPAREREG<1>)
>>        */
>> -    if (iter_max) {
>> -        iter_max = 300;
>> -        while ((tmp & 0x2) && iter_max) {
>> -            WREG8(DAC_INDEX, MGA1064_SPAREREG);
>> -            tmp = RREG8(DAC_DATA);
>> -            udelay(1000);
>> -            iter_max--;
>> -        }
>> -    }
>> +    (void)read_poll_timeout(RREG_DAC, tmp, (tmp & 0x2),
>> +                1000, 300000, false,
>> +                MGA1064_SPAREREG);
> 
> Again, the comment and original code disagree and the original test 
> condition appears to be inverted. It whats to test of the BMC has 
> finished scanning out the final frame. The bit should turn 1. Instead it 
> tests if the bit is already 1, which is likely true. Hence that's 
> probably where your 300 msec delays comes from.
> 
> Best regards
> Thomas
> 
@Dave or @Jocelyn, any chance one of you could help me figure out 
whether Thomas is correct here? It does seem likely that the conditions 
were originally inverted and thus forcing a wait for 300msec every time 
regardless. That does match my experience... But I don't have (and web 
searches failed to find) any relevant datasheets...

I guess I can switch the conditions back such that we match the original 
code and sleep.. but it does seem likely that we really don't need to 
wait for the 300msec, but actually just that the scanout is done and the 
conditions were wrong..

Obviously we need a v2 with either the conditions matched to the 
original code or I'll need to re-write the commit message.

Thanks,
Jake
