Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 893A68D5A30
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 08:07:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E9AA10E1B5;
	Fri, 31 May 2024 06:07:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZmEHJHgN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E282710E1B5;
 Fri, 31 May 2024 06:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717135627; x=1748671627;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TktGQ2sXPzOGTwRAfejUWnXjQhXseDxz8IwEkS1IeiA=;
 b=ZmEHJHgNj+jOVyieTbkrdtpwJZy3Ys9oU4+7BNYBagV1+OvARL+90c4c
 B24vcHWO87dL1XW/yNkFhkTDOy9HgP/2OmBpE+g1Scq4geAR+XYDRsbQD
 SCz8SROBdUhjKNTjmWrY6hqi35WmpVByn3kgBGZ4pvMDU3ttVM9j9MCG2
 0Pz1w/8w8W10E8jAkAVkW+KxH6+rx396KlkQrPWb1mn7nPglbZPgguHRj
 pCQyNZ/nbr2LkyEEPDUjU+wZSdPN6NRFidsVomo8ATavxs5y2NylJ9/Os
 jPrQuusQMFC9jZmL/XCnizGxAybD2LgYAcNe63TB3bzuuYdJ5nhyKhKM/ w==;
X-CSE-ConnectionGUID: fHBmkQdCQYyigJHnI6bPlg==
X-CSE-MsgGUID: xKvATFczSVOavu1ZmPLCug==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="11834105"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="11834105"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 23:07:06 -0700
X-CSE-ConnectionGUID: 83IpLCf5TUycnXJTp4Y7CA==
X-CSE-MsgGUID: gTk0zFBNQgeGB55tewYqoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="36164789"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 May 2024 23:07:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 23:07:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 23:07:05 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 30 May 2024 23:07:05 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 30 May 2024 23:07:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GOlXUaEDWfC4HpPm0hN7xsAXRnHYF9M9JMhqFjVoxm5TiZjKj+DkKS6om9xzRXA3PXHDKvPd91mGCAaBft/uiL3sZppqVv2H3Flo0Wsacdk6OmaYqgxD5W8s8UlwF9D3Mj9Nw9qriFBrvIxkAHmg19BINZcqTJYUFvh1iRE/KkbV+fT4DWB3pckYdI11bzfqCiBYlupkzTy7RuT6zPz0ZG9+x+E4YauZGx+xzS+Key4+4AWP6ixenSUyaT3CgusbCSxPoDiAAEKivtpgNGpcPjRnbjb5OpOzXjpwR11NuKWYj/QqxUZBVndmwSx9j1Ur46swYw/QuVr+3SGn2i0X+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNnsCdcbiTLrM1wRGjtpoGye3plIhDOVvFZUSFRcAps=;
 b=JtPRtELfv/zNn1fCBgLb5xFnM+YI6HsQIHAVDyDuTiGgcJZO8I97iMzY0A2LkxjjBRGMIrfvym/rY8dbcssoGZx7xLxERb7zoFDqSH/7Fe2y4VJp3EveItmYvY8tPclXEPoZR+zkXp53IjXGoDjtokJJLykKwk4f8YaLdXVbgS3ICbBvxTcLuIuUBIIDvbnRANuZSNqlsF+0yiB+g07dCgV1w6qUzkkFkimSTd7jPmXcXRub3iD57+DMnto1H4zZadZ43LJ5bc758u4OTQKEqEsSO2vt7AKnZeWQzB0ktK/ZGlYXk2QUnmPC47m6qTAhGuoIyUewIz90/1UeWE1Gug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by PH7PR11MB7963.namprd11.prod.outlook.com (2603:10b6:510:246::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Fri, 31 May
 2024 06:07:02 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%6]) with mapi id 15.20.7633.021; Fri, 31 May 2024
 06:07:01 +0000
Message-ID: <c311b4be-de6d-4855-b104-b797ef5df8e8@intel.com>
Date: Fri, 31 May 2024 11:36:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/8] drm/i915: Define and compute Transcoder CMRR
 registers
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <jani.nikula@intel.com>
References: <20240530060408.67027-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240530060408.67027-3-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240530060408.67027-3-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::7) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|PH7PR11MB7963:EE_
X-MS-Office365-Filtering-Correlation-Id: 64b5f6a5-4de8-498c-3bb8-08dc8137e320
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTl4U0RWM0ZuSUMvUWZWZVRQU2hLckMwTDBjRXFOSEljZ0FGeDBYNjZEZ0wz?=
 =?utf-8?B?WEZUUkYxVW50RzVtVmlrTjlpR2hUUmdvOWFvOThSbkJwVXhUZnZSbFB4UVBy?=
 =?utf-8?B?bTRHRXRSWUZ4R1ZhWjhPazhrS3hYWDRGM2FLV013aityY0pMTU9XMzJoeEdy?=
 =?utf-8?B?TU9JRGFrbVduUk5XdWNySHNZYTB0aWljLzF6YitGL2daWU1rMkxCZzVVRTVQ?=
 =?utf-8?B?SHZXa0RINTlCWVFBQTVRdno4SDk3bDhNQTcza21maktZUDRnNmNLWDlCczVW?=
 =?utf-8?B?QW9ISi9uTDloVEdwNlcrVTA0NkNGSGRMaU0wV3VIdGhwWFFIeXVpSktZZ1B6?=
 =?utf-8?B?anA4NUl1L1YyVytiQzRDRGlrWEQ5ZDhoaDMrY0pUZUNzY2NCMk4vQTh4ZFd0?=
 =?utf-8?B?bzQrOEphWkdadkVGU2NhTVdyaTF2ZUJzWVFqM1FWK0dqTCs3eWovSGRIOXFk?=
 =?utf-8?B?Q1ZIQy9YcHBMWGJuWXp5enFKa2R4MmdqaGg5ckRmNzFOZis0QXhVVFZEYkMz?=
 =?utf-8?B?eEZIY2M2OVFLNFhUVVFteEg5K0pHNEkvelVWaXF4bUxvTGI4ZFBiYVY2bERX?=
 =?utf-8?B?dXFSZ1ViSEFNY2pydXVTR2NFdzVTQ0F6QjRyVFJSKzQrUk4yV2Z5bVRiUWpi?=
 =?utf-8?B?U3FwVXgwM0tZcWxSM2dPQkttZXBuS25rTUNtazRoNWtaMEZVV0IvTXB5T01R?=
 =?utf-8?B?a1dZL1FubEhVeXhVWU5YMHBoRnUzbWhiZHVyUWl0eDBFRXNpamF5OVgweHZy?=
 =?utf-8?B?K1lxaC84am45dm04M00zRGUwNE4vcDlSRUhpblNwam1zSUdCSHVVVGpoUTRw?=
 =?utf-8?B?azBNVlMwY0h1Z3U4RFNDbkQveWNoQnBkWnlybFdiem9SODhZRzBIVEZmZ1Ro?=
 =?utf-8?B?WEl3dk81MFhsTmhoL0QwN0VmbjJPczFDS0RoSXdHNUVNYTJzNndpVkdSVnhJ?=
 =?utf-8?B?Yzdncm04MjNZdktJYlpaRzZnWU9yTkdZbXJndTNRaGx0aEIydUlNT2ZMZGZp?=
 =?utf-8?B?OUdWNC9BU3kzazdLdUF6ZVZYNTgxVGlVVnBaaXc1RU9ZL3lFQTdSVWRkVUlR?=
 =?utf-8?B?MmMwa29zSEFoS0JIWXpsbzJVNlErOWoxeThwNmxkK0hURHc0OW9Mcm4vTlU0?=
 =?utf-8?B?U2pkVm91aDFSbk1QMW91RjBYUkJWV0x2NlJsb1pNMmpTQmU1YXhrY2FrSGJv?=
 =?utf-8?B?RzdNMGRwTzJIWUJXZkRkOXZaM0lvQ3NsbGY0L2txQTBpTnZFYlg4MHpuRml1?=
 =?utf-8?B?S0tFYjd1UFBvVUdCVEJqWHFWN3dMc05vT2JOMisveXkxNGJMRXVKY25idFQ1?=
 =?utf-8?B?NXRQOFlSbEs1R25FWlUxZUM5M01NUzBvUnJXbVhiZ0R0d044eVVLc2VzRlF1?=
 =?utf-8?B?RVhlaUlScDJYcWJSRXRWSWRjUlB2bHZ4NUtFQUZja2NHNDlVTXkyY0JVTDMr?=
 =?utf-8?B?b2U4UVlBYkdWaEdmUUZEdld4MzUzb2pqcDRDZUtuY29LNHpEaVA5L3VpQkcr?=
 =?utf-8?B?cnI4dnRqbXdBRW1uTHNpaCtlTEdiSnhMTmZnK04wQUliTitnSGUzaEFXWDJO?=
 =?utf-8?B?MTJKNVkxWFhLTWFscHFsZFJsOHhUMk5yZ0EzbUhuQVRuVlh3bE9vZDVPcUxO?=
 =?utf-8?B?M29UQk16WGpsdEFIMW96VDlGRDNjRXJTcVVlWnU2aHloU3ZLd0VtZlNqMEgz?=
 =?utf-8?B?Y24wWUlILzJUQ2loU29kQi9Mdm1LN05VRHBGSjdUQUx6Z1pPZjlKdTBBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHMzT25lcVdnVGM3ZWgwYTF4cklmZmJCSzhpWkh3TUt3MVhSVzBWdUR4SlpN?=
 =?utf-8?B?M2pEUjMwYzRFcVdpWDBXUEEwa01PV05GMG01VnpMWTRQOEdyNGtTWkFWcHRZ?=
 =?utf-8?B?UTFqcTA3bHpPaXg1OTRyL0tjR3dvY01wVFhzWHpnRDkyandoRkNtdi8xYmxI?=
 =?utf-8?B?Q0VrcXEvQ0U1N21mNXoraWNnZFN0REdsRjhKd0RCdmFtTGE2RmY1ZVNvY1Vx?=
 =?utf-8?B?U0NON1BhSnNQcmVLd1lUT09tNnVkb3FaVGlyRnBEdnltOXhZa1RFK3pLbWpj?=
 =?utf-8?B?a0p1eXo4TTNCK3hIQ2JVbU1UU3ZET2JKNTRVazNFNkk4YXFpZzJINnZNejRH?=
 =?utf-8?B?UTlIbzYxeWp1VW9jem50YkZsY1k5Ync0RmhMbkhoek5vUlIwanVMV2pza2Vi?=
 =?utf-8?B?Q2JOK1ZpK2liZFhBcC8yRzlYcTFKUmVVWUs1c1h2UzRYUHh2VDlzMW9JbkV1?=
 =?utf-8?B?Q05ZMnZqV3lsRjRVZmVjbm1pQ2JHRmh5MVRmN25rdDhZU1FtUllqSW5uUS9B?=
 =?utf-8?B?QmVHQ0ZEQ2FuZzJnS245LzNYMmZrV1JlOUEwdGVmNUs0WVVKdlg5TmpHSm5x?=
 =?utf-8?B?dG5ocGswQXZXUU1PR3BoVVF6SHVqSzVIQ2s5QnRwZ1FiWmNGejRrTTZMVTdn?=
 =?utf-8?B?MnBKQmpSMEJBMmR3SEZ6R0RuUm5ndDZzTE5QZHdMWE1pcklQVm1YUWlEc3pM?=
 =?utf-8?B?N3Y1em1XOHpnZldsdDRFRFI2amo5ODBKT053djB6YUpuVCtEcFkvZ3pPTFY4?=
 =?utf-8?B?RXhBTTVIWWhCNTd2ZGQrZXZ5Qi83OGFCai9sY0x6Tkc2ZEZQRG15NWMyMWgx?=
 =?utf-8?B?OStZNHRPak1lcG5qUWlRemhYQVprWjBwUk1HV3Y4cTU4TGVIOUJmQ1gzY01S?=
 =?utf-8?B?RThncFgxMUdoUFlOY09UY0FtcFNwczhLYXFIem9xOVYrMnVyVVIyWDVtK1c2?=
 =?utf-8?B?UFpNM1NKL05uY3A1czNraXRGTXlQaElBQzJFVFFIKzZ6ZEY3dkJkWVF2UHZ1?=
 =?utf-8?B?RCtFaHh2cUlOTWFLallpdzlBdWFGclREdTM4NFRna1gxTGg2VW5PazdLblVD?=
 =?utf-8?B?SmNGV2VjUnJLd2FpY3RJNUtlVVZ2eXdNelRtSW1qeUJ2TXJvVCt1VWxHUTFZ?=
 =?utf-8?B?cWxHSU1oVENaWTRPdjFNS0dIS2piNXJCNkFyM21RSGZMV3gwYkJmVlYyZ1ZZ?=
 =?utf-8?B?RS9DdjJCZGlnMEM2REJJT0laOUJHRmJtT3c2NndvczZBU2gvYXZFY0c2aFJy?=
 =?utf-8?B?Qjg3N0hORjZtVXFEYlNISUJxSXFKcURodGxBajhYK0poV21iUi8wTG1aRCtP?=
 =?utf-8?B?dGVna1lOaEFiK00rdTh1TjJmM3VheVNVUGJvN1JzUTdYaXlsQ2x5UytrTUJE?=
 =?utf-8?B?V1RVTlMxNUFqRkRrdG9nM0R6TU9aRHovTjNNQXhtVklCUWNuMVVVdUNCTmxR?=
 =?utf-8?B?U1c5bE42SU5LT0x3RkdzMGgyanFzZHJISTJLeks5VFN0bVhIWUVjQVlYRUY2?=
 =?utf-8?B?ZlRRZ3BYTnJGVWp2RHVJdG9jU2creUgydlhRMFVWQmZtU3hxQ0xDRnJuamlu?=
 =?utf-8?B?MmhZUVE3STV6ekR5RXN4VHZRVXdHYXUwaDZzZFdadENXL2xkS2JsUmR6Tkoz?=
 =?utf-8?B?b1dTME54a0RhOHlsaVNYNmRsc2NqOWl2ZlhsbmloQ3FEaVJuZW0yQUZwNzR3?=
 =?utf-8?B?WFlxM21VQWdzYmNXSm5JbVNnRGRiQnA0eUw2NkI2MHAxRkdLaWJSNDZmU0Z4?=
 =?utf-8?B?Rm5qNXJLNlZmSXhEMnkrNTF0NFNyY0lQZ3czZmM0MXFDRWM2MVFsTjlCSXUx?=
 =?utf-8?B?Nk5nK2RReWQwZmorSXVBVTBsbmlBMFFMdEtXSkl4N2ExMFRndkZLZ2N4NlU1?=
 =?utf-8?B?dkJDWEQ2TDh6QmZQMUd1SHJCd1NQUlpwQVpqUzFzd01kY3V1VnE2OCsxVE93?=
 =?utf-8?B?ZmlZMFRaNzJqbmR1eWVxdlNRQTFHTzZPdHNlclhhb3FhUzMvbG9rSDRURzVk?=
 =?utf-8?B?aTI0ZzRTeWNtcEFkV3hOSmZrSjU5S2p3RHR1OGNMU0srOGNoUWptdTJJM1lv?=
 =?utf-8?B?K0o2WXMxV2FCTG5DMkNibXI2U2I3b2Rsd2IrUjlBODBJN0pXSzVyLzJNUW9X?=
 =?utf-8?B?TlpUaDVpTnUxMFErT0lIRWhaZWdLQ0ZlTGlDOVU5T1JraldxZXpoT2h0Z0dt?=
 =?utf-8?B?NVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64b5f6a5-4de8-498c-3bb8-08dc8137e320
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 06:07:01.4851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l0V4+9VWuo0OpOp9CRDfpD8Kj0KeHxCegtV9J0QlLjiGn6jqg3KeEbpnavjqMU0wX07bhMmXHcEqdJMtz0rFq75/IbnbV/zEB+uk87gBc2g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7963
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


On 5/30/2024 11:34 AM, Mitul Golani wrote:
> Add register definitions for Transcoder Fixed Average
> Vtotal mode/CMRR function, with the necessary bitfields.
> Compute these registers when CMRR is enabled, extending
> Adaptive refresh rate capabilities.
>
> --v2:
> - Use intel_de_read64_2x32 in intel_vrr_get_config. [Jani]
> - Fix indent and order based on register offset. [Jani]
>
> --v3:
> - Removing RFC tag.
>
> --v4:
> - Update place holder for CMRR register definition. (Jani)
>
> --v5:
> - Add CMRR register definitions to a separate file intel_vrr_reg.h.
>
> --v6:
> - Fixed indentation. (Jani)
> - Add dependency header intel_display_reg_defs.h. (Jani)
> - Rename file name to intel_vrr_regs.h instead of reg.h (Jani)
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_display.c  | 23 ++++++++++++++++++-
>   .../drm/i915/display/intel_display_types.h    |  6 +++++
>   drivers/gpu/drm/i915/display/intel_vrr.c      | 22 ++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_vrr_regs.h | 16 +++++++++++++
>   4 files changed, 66 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 071ba95a1472..5cbec4b19c3d 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -1004,6 +1004,13 @@ static bool vrr_params_changed(const struct intel_crtc_state *old_crtc_state,
>   		old_crtc_state->vrr.pipeline_full != new_crtc_state->vrr.pipeline_full;
>   }
>   
> +static bool cmrr_params_changed(const struct intel_crtc_state *old_crtc_state,
> +				const struct intel_crtc_state *new_crtc_state)
> +{
> +	return old_crtc_state->cmrr.cmrr_m != new_crtc_state->cmrr.cmrr_m ||
> +		old_crtc_state->cmrr.cmrr_n != new_crtc_state->cmrr.cmrr_n;
> +}
> +
>   static bool vrr_enabling(const struct intel_crtc_state *old_crtc_state,
>   			 const struct intel_crtc_state *new_crtc_state)
>   {
> @@ -5034,6 +5041,16 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
>   	} \
>   } while (0)
>   
> +#define PIPE_CONF_CHECK_LLI(name) do { \
> +	if (current_config->name != pipe_config->name) { \
> +		pipe_config_mismatch(&p, fastset, crtc, __stringify(name), \
> +				     "(expected %lli, found %lli)", \
> +				     current_config->name, \
> +				     pipe_config->name); \
> +		ret = false; \
> +	} \
> +} while (0)
> +
>   #define PIPE_CONF_CHECK_BOOL(name) do { \
>   	if (current_config->name != pipe_config->name) { \
>   		BUILD_BUG_ON_MSG(!__same_type(current_config->name, bool), \
> @@ -5398,10 +5415,13 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
>   		PIPE_CONF_CHECK_I(vrr.guardband);
>   		PIPE_CONF_CHECK_I(vrr.vsync_start);
>   		PIPE_CONF_CHECK_I(vrr.vsync_end);
> +		PIPE_CONF_CHECK_LLI(cmrr.cmrr_m);
> +		PIPE_CONF_CHECK_LLI(cmrr.cmrr_n);
>   	}
>   
>   #undef PIPE_CONF_CHECK_X
>   #undef PIPE_CONF_CHECK_I
> +#undef PIPE_CONF_CHECK_LLI
>   #undef PIPE_CONF_CHECK_BOOL
>   #undef PIPE_CONF_CHECK_P
>   #undef PIPE_CONF_CHECK_FLAGS
> @@ -6790,7 +6810,8 @@ static void intel_pre_update_crtc(struct intel_atomic_state *state,
>   		    intel_crtc_needs_fastset(new_crtc_state))
>   			icl_set_pipe_chicken(new_crtc_state);
>   
> -		if (vrr_params_changed(old_crtc_state, new_crtc_state))
> +		if (vrr_params_changed(old_crtc_state, new_crtc_state) ||
> +		    cmrr_params_changed(old_crtc_state, new_crtc_state))
>   			intel_vrr_set_transcoder_timings(new_crtc_state);
>   	}
>   
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 6fbfe8a18f45..51d10b7e1011 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1401,6 +1401,12 @@ struct intel_crtc_state {
>   		u32 vsync_end, vsync_start;
>   	} vrr;
>   
> +	/* Content Match Refresh Rate state */
> +	struct {
> +		bool enable;
> +		u64 cmrr_n, cmrr_m;
> +	} cmrr;
> +
>   	/* Stream Splitter for eDP MSO */
>   	struct {
>   		bool enable;
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index 871e6e6a184a..1f363e34495e 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -219,6 +219,19 @@ void intel_vrr_set_transcoder_timings(const struct intel_crtc_state *crtc_state)
>   		return;
>   	}
>   
> +	if (crtc_state->cmrr.enable) {
> +		intel_de_write(dev_priv, TRANS_VRR_CTL(dev_priv, cpu_transcoder),
> +			       VRR_CTL_CMRR_ENABLE | trans_vrr_ctl(crtc_state));

This is not required here. We enable CMRR bit in intel_vrr_enable along 
with VRR_ENABLE bit.

Regards,

Ankit

> +		intel_de_write(dev_priv, TRANS_CMRR_M_HI(dev_priv, cpu_transcoder),
> +			       upper_32_bits(crtc_state->cmrr.cmrr_m));
> +		intel_de_write(dev_priv, TRANS_CMRR_M_LO(dev_priv, cpu_transcoder),
> +			       lower_32_bits(crtc_state->cmrr.cmrr_m));
> +		intel_de_write(dev_priv, TRANS_CMRR_N_HI(dev_priv, cpu_transcoder),
> +			       upper_32_bits(crtc_state->cmrr.cmrr_n));
> +		intel_de_write(dev_priv, TRANS_CMRR_N_LO(dev_priv, cpu_transcoder),
> +			       lower_32_bits(crtc_state->cmrr.cmrr_n));
> +	}
> +
>   	intel_de_write(dev_priv, TRANS_VRR_VMIN(dev_priv, cpu_transcoder),
>   		       crtc_state->vrr.vmin - 1);
>   	intel_de_write(dev_priv, TRANS_VRR_VMAX(dev_priv, cpu_transcoder),
> @@ -307,6 +320,15 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
>   
>   	crtc_state->vrr.enable = trans_vrr_ctl & VRR_CTL_VRR_ENABLE;
>   
> +	if (crtc_state->cmrr.enable) {
> +		crtc_state->cmrr.cmrr_n =
> +			intel_de_read64_2x32(dev_priv, TRANS_CMRR_N_LO(dev_priv, cpu_transcoder),
> +					     TRANS_CMRR_N_HI(dev_priv, cpu_transcoder));
> +		crtc_state->cmrr.cmrr_m =
> +			intel_de_read64_2x32(dev_priv, TRANS_CMRR_M_LO(dev_priv, cpu_transcoder),
> +					     TRANS_CMRR_M_HI(dev_priv, cpu_transcoder));
> +	}
> +
>   	if (DISPLAY_VER(dev_priv) >= 13)
>   		crtc_state->vrr.guardband =
>   			REG_FIELD_GET(XELPD_VRR_CTL_VRR_GUARDBAND_MASK, trans_vrr_ctl);
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr_regs.h b/drivers/gpu/drm/i915/display/intel_vrr_regs.h
> index c6ad0a88cf88..5f93795e3191 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_vrr_regs.h
> @@ -113,5 +113,21 @@
>   #define TRANS_PUSH_EN				REG_BIT(31)
>   #define TRANS_PUSH_SEND			REG_BIT(30)
>   
> +/*CMRR Registers*/
> +
> +#define _TRANS_CMRR_M_LO_A			0x604F0
> +#define TRANS_CMRR_M_LO(dev_priv, trans)        _MMIO_TRANS2(dev_priv, trans, _TRANS_CMRR_M_LO_A)
> +
> +#define _TRANS_CMRR_M_HI_A			0x604F4
> +#define TRANS_CMRR_M_HI(dev_priv, trans)        _MMIO_TRANS2(dev_priv, trans, _TRANS_CMRR_M_HI_A)
> +
> +#define _TRANS_CMRR_N_LO_A			0x604F8
> +#define TRANS_CMRR_N_LO(dev_priv, trans)        _MMIO_TRANS2(dev_priv, trans, _TRANS_CMRR_N_LO_A)
> +
> +#define _TRANS_CMRR_N_HI_A			0x604FC
> +#define TRANS_CMRR_N_HI(dev_priv, trans)        _MMIO_TRANS2(dev_priv, trans, _TRANS_CMRR_N_HI_A)
> +
> +#define VRR_CTL_CMRR_ENABLE			REG_BIT(27)
> +
>   #endif /* __INTEL_VRR_REGS__ */
>   
