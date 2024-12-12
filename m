Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CD79EDD0F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 02:30:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8365610E2DF;
	Thu, 12 Dec 2024 01:30:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fNgrXURs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC43710E2DF
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 01:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733967002; x=1765503002;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Wb1XTVokhlvMGLoJNhL9bs3QwDflt3bPHlsgC1S/1pU=;
 b=fNgrXURsV6JDNDCjGf2+GEt7ldfXZ67wPdwPnxgPRomFddEO29EFDvzo
 M8nNnlM1vgHwWG602S+Pe0EYag+DmORCcUcOmnIg/6eZgyGsVg4OgNON7
 6UqfuOtC303rnmhhukMJAZ9vm/ydex0/Q38fKmjHcgyH4ddSR7pZLYNDV
 0o3fZxu4nABdvqnFIvZJhi6/IQOdBtyJbNNX628ZQEyOYCKdgGrWDDVbn
 EMD6NfACcrFC7Ad6r6SckEfgGn+MOycxZRbVR2hWwyRJrFV9MFsypNKyE
 ppc1uZu/t0Roauuux8y0XrUiIXy8yVW6Tyu/7QsQvRUeZSxI8m0Ro2BlQ w==;
X-CSE-ConnectionGUID: vx/vTQtgQjOToRTv9YNgAg==
X-CSE-MsgGUID: MTEYI1uFTl24fXIgU5vXoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="38055782"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="38055782"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 17:30:01 -0800
X-CSE-ConnectionGUID: udkCyhs+QweT58ZwtTJAQw==
X-CSE-MsgGUID: 6O2wdC6yS7G6Mjka+G2soQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="127013639"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 17:30:00 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 17:29:59 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 17:29:59 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 17:29:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mSGflRaeWLlYBq70KBiEkp/2oSR/tyVtuheYQNN6Fu6SfiLU8/o0JH7eZD/eNefk2rmq0OdkHv/jTxTMvf9ka0pnaNWtSVmexh9HHWQkFrv2MUzA55TZZXL0kEV6roJRGTA0FsNC0XvzKCDgayo7yeipANbtHJfa/ztJrIJY+EZkSADt9/SpuV1MjssqPzNJmDzInRY3xzuwERo1cyu8YJ+jvAL4Q9RKHIdWRJRBjyhVo6sh8g8JUBk3n3TcPLDEbMFdKNfAXta1Bv2EwV2rYb26VQHUelAujud2NnIlRV+0hH96LEEag4DeE1MJB4QDvX5tTGMro5TnMwt20S/0Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wb1XTVokhlvMGLoJNhL9bs3QwDflt3bPHlsgC1S/1pU=;
 b=e/5WwwRvgKQnrld8/hAd0zlb5toJ9O9c+cwsXQBOdHTuf1i4zuaXPR4Df0WUTXYWBLecWE1PqMa/udQBRSWv20hfsn7OGJIesRvlxvxi8xjV6LrezuE2mk1uFY+wuT5Sc3hr7m+bmHHGYX7vv60FFWVvWbHNz2BgeGIywtxecToigjYwWEFbfyrb5jYsj4wMJTlBKkN/bGPkfIiLThMFpDajjLO/dBEsy89Ebv6Ft6CCvMlSLb1anePxSiOyjCJtGN7sS//y5RV8LZqOs5Y1liSZlfdkCYzqoA/DvZ+HvyE6pXct2GWea2C/kc3jkpZIQON0JVWKqbycs3HuNROx1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB7177.namprd11.prod.outlook.com (2603:10b6:610:153::8)
 by PH0PR11MB7494.namprd11.prod.outlook.com (2603:10b6:510:283::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Thu, 12 Dec
 2024 01:29:14 +0000
Received: from CH3PR11MB7177.namprd11.prod.outlook.com
 ([fe80::271b:c621:d244:6105]) by CH3PR11MB7177.namprd11.prod.outlook.com
 ([fe80::271b:c621:d244:6105%4]) with mapi id 15.20.8230.016; Thu, 12 Dec 2024
 01:29:14 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Jann Horn <jannh@google.com>, Gerd Hoffmann <kraxel@redhat.com>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?=
 <christian.koenig@amd.com>, Simona Vetter <simona.vetter@ffwll.ch>, "John
 Stultz" <jstultz@google.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Joel Fernandes (Google)" <joel@joelfernandes.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Julian Orth
 <ju.orth@gmail.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH v2 0/3] fixes for udmabuf (memfd sealing checks and a leak)
Thread-Topic: [PATCH v2 0/3] fixes for udmabuf (memfd sealing checks and a
 leak)
Thread-Index: AQHbRmlg0EJbHC8UKUaYctHWYxNhdbLh3NAg
Date: Thu, 12 Dec 2024 01:29:14 +0000
Message-ID: <CH3PR11MB71779129732429823ADF5298F83F2@CH3PR11MB7177.namprd11.prod.outlook.com>
References: <20241204-udmabuf-fixes-v2-0-23887289de1c@google.com>
In-Reply-To: <20241204-udmabuf-fixes-v2-0-23887289de1c@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB7177:EE_|PH0PR11MB7494:EE_
x-ms-office365-filtering-correlation-id: 46f86633-fae1-4413-998c-08dd1a4c6390
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?eWtVUWgzaitlSFkybk5GemNXeTdIU2RlZ0pPM3kwelZUQ0pSMzc0YmFzVTUw?=
 =?utf-8?B?NVc1WUFqUG9sK0xwdTRzRHlXUGd3ci9FOEFGejNsMFBXbjhxbGxtNGdsYkk4?=
 =?utf-8?B?OWVOZEFEU1ZKcmxhUlczWEg0TXcvSWlPaXdmMUxkcElLUVhFR2hJZ1F1VVMx?=
 =?utf-8?B?N3hyWlp2SFJIOEljZVZkeURuVml6K295WjZNUElEdFh1VkJXbVBvTFd3Z0ZY?=
 =?utf-8?B?OXEzQjIvekphWXJzWllweUdFemNUdkVHQUxDUnNMWVlObFM5bjlYYklKV1pI?=
 =?utf-8?B?MitGYmJIN2RCOWhYN3IvdmZnK0JaSmg2ZHpHTS9SZzdmeDZxZk4xN2tKUldy?=
 =?utf-8?B?a3FCeGdweUJFZ0tqZGlXaUdBMnNJWmthL0kvWmxuQkpRWmdxRUp2L0F1MHda?=
 =?utf-8?B?Sll6RmpXZDIyR3BINnpWMUNLVlp3a2ZUREVETUs5NDlCbFJvVTQrV1VSMFlY?=
 =?utf-8?B?QlBpSWxYRFRYcGRZN3djZ0tKOVlvSXVwTFdpV0Q2NHBFZTVmbmFPNjBTcFg3?=
 =?utf-8?B?ckpPSWNONXlBejVyTzlzRWFWR2pDM2JjcHVNbkNZTGxrWXRjYlVtNVJKc0M4?=
 =?utf-8?B?d1NzNC9CNVpicXhkM2Y3dnJhSUZJSkdIeFlkK0Rkbjlnc0pNN2x2RGVlblVT?=
 =?utf-8?B?K3VsVmVVT3hmYkgwaHN5ajZNUXFRRm5jRVBhRTFpd3BvK0hhVTlJeDR2dXhP?=
 =?utf-8?B?QnNaTkIvUnVtMDdaVXRXU05EM3JFaW81WUQyd293UTVxZ1ZaamN4VmkrU1ZE?=
 =?utf-8?B?a1Y4YjVvbGZyNjR0d2kzdXhuQWxVcVViQ1dPMTZubWtwcGFSaEw3R25aVmN1?=
 =?utf-8?B?SnErT25OcCsyNis3QjhyZ09NNHdMV2RVMzlJQXk3SU0vV2N4eGZvVENnZDc0?=
 =?utf-8?B?YnZid0JKOCtLcjM3SjhjWDU4Rmg0UWIwMjFnQkh0clBzM1R5bEl0SEl0N2hs?=
 =?utf-8?B?WjBnYlEzWTdObDhjbjJlVjJVVDVKSXI3Y0FzekUrdVdXWjdob3FHa3NxeHQr?=
 =?utf-8?B?RnBUTUdhays0Rm9LZGlQUVMyRTAvVEVvS3JKSXF4RDVUZ1J0aU1RaUowYlBN?=
 =?utf-8?B?bWJuSjJoS3BnV2xCc1hFTmlFUlNEaWFKRTJLOW1vcWxyc0hVczFFL0lWbU1P?=
 =?utf-8?B?V3VIMVkvUE9xa1RZQ3FWeFMwWFo4S0FhTWlROGRiVzNkditBUVZ3VEFQN3V5?=
 =?utf-8?B?UTN1K0hKK1JOK0wvdit6b05WVnFUK0pkV1oxUmlsY0V2RHRrc1o4WE5rMnNT?=
 =?utf-8?B?RFh2Ym5jUE5tamFWQ3UxNFBCQ3g1V1QxUHkxMVJ3QTZpZDYrN1pTR0p2L1Fa?=
 =?utf-8?B?bVdHZ0NTWlREYmJRZmovYlArQzVTbDdCbG9JUTZacUl0aVFDSDljRkM3VFli?=
 =?utf-8?B?TWhJVUExZHIySHNBOWlKUGZtSHl0bU0rWi9xLzgzSXFmUTFTQVFXS011Ymtn?=
 =?utf-8?B?MTI4d2sxUzBZOGppdnVYeVFidFUrQzNRU05MVnpqaWFUYjNBbG03SkFqaU94?=
 =?utf-8?B?S3cxS3VQUFE0bDR3L1NkbnN6cDlHMWRQQ25DWExUSGZIYVV5ek1abGJwek01?=
 =?utf-8?B?WUFtb25yanN6UmtKbi8wd0lQamUvQVZ3amVaZ0NMd3hZQUZIV2plSVNOaDRr?=
 =?utf-8?B?V1ZEV2R0UHFFa1F4b1p3cVQ5SmltQVhTaFNMUi9CVlZxc3UxdENEd1Z3S0tY?=
 =?utf-8?B?cWU1ekJUNTQ2NnpFL1ZVMGNHc3hYcTZ0bHpERmV6M21nZ01sUjNWV2U1aFFq?=
 =?utf-8?B?cXdjUzJWR0lxa0hFd09DOFJ6T3ZsYkZrdzhXMXBwVzJwSmw2K2VWVTU4V1ps?=
 =?utf-8?B?ZExHRTBNb0RWcjVHbTdOM1dKcVBhS0xkWWVEVXZkTTUyZ3V1bURWRGZUS1o3?=
 =?utf-8?B?Y3krUkF5RDRieUZLVDNDbjBMWlQ3eWRzNVNBUVhIc0xTb3c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UGRrVEpGZkt2TmpIb3pmR2Y1ekI4SWF2dG9HMTRyN2dGYjlPVWc4YWxpcWtt?=
 =?utf-8?B?Lzc5RDNma0I5WnNyUVdQU0RpZXFtaTF0OUxLNUxwR2MyOHBQSGxlUG5lV1Zj?=
 =?utf-8?B?N2pxUlYzc3VlWlBkZUw4Z1VtYXNpZnY1WmpkZU55Mnlvc3dOTTE2UEhCSnhp?=
 =?utf-8?B?dkVUV3UyaGV1dm9yTFM4V3JScG9SbEwyQXY3VU1ldDA4TnFtanJZaEFxOWNJ?=
 =?utf-8?B?QU92WUxHY2F5cjNjYjlhYmhkajE4a1RGcjhKY2xmYVRhaFArd25yZi8va2JI?=
 =?utf-8?B?YjFZZzkzS0VGNmM3SVNLaE93VmJETklJQnh6a3UwWWR4OTZyM0Y4NmVXbjdP?=
 =?utf-8?B?bkR6bnpiUmZKRDJGRFpYUEtSN2c0a2w4d2NiMVZmQVExTUhrak56K092UFVF?=
 =?utf-8?B?b09JVnE5N1F3K2kwK1VOanBob2RJTTB4NDNTSU9MNFhTc1d5VEpyMWdicmpR?=
 =?utf-8?B?ZUcvV0lyd0ZIeitZWWZIYUxJYmdvbVliWGVneG45R2FFYWRGVThXQndQbm9m?=
 =?utf-8?B?U0tRM0tDZGg1d21EVVp2ZkNrOWZubE1ZY0pKcTdFaEhRcGtwWlhsWjZMekU0?=
 =?utf-8?B?dDJQVlROUGNqbnhUN1UwUkY2aWFsMk9EQkM3RnhMdWpLbnlua2hkcW9IMGFV?=
 =?utf-8?B?Y2J0ZXA4WWNaYjJBeEhXVWwrVHJrZXgzUGtxTXE5Sm9WeEF2K0pkY2FUSkpq?=
 =?utf-8?B?N3kwK3dkVDNVWXdabXBSYjdFa1l4RjdIRm02N3FQZ28xWHkraTcvOWF5YStm?=
 =?utf-8?B?S2pKMVpJb2I4cDJUZHc1cXgrWDA3MFU0WmRZYlk3RU04RndPbUV0ZUw4OFlm?=
 =?utf-8?B?ZlR1RDRNREpKaDExNzRkdWNhR0dJMnhGUFVJY0t1bW9JZUJidlF3L24xdGtT?=
 =?utf-8?B?a3I2NUp4c2hLTWRVamJJeFJNUWdBYXZoKzc3eklUZnNqOVY5WUVoYXY1SnhK?=
 =?utf-8?B?R01kTUlxUmo5WWdRbnVmcW8vaGNVc3REempZd05qLzFkR2J2eEl1WW16b1o1?=
 =?utf-8?B?L2J4VzdnQ0tlY3BmUFhaK281bG55UkRVdW1aY0dWMGppS0VxWFFqQmwrWW5y?=
 =?utf-8?B?aE00ZnZWNEx4d0wzc1JzSFpMR3M0MHQ5d1dGeW5WdTBQeWhLMXBTSnBJTTdW?=
 =?utf-8?B?TGRRc3paOE95blpucU5BTktvMnozc2l5SXR5TWFScHZTaUh2Y2ZwTkRWdU9V?=
 =?utf-8?B?UnBLaE81MnFrTWF4d29FeEJtQmJRby9POG1nY2c1U1hYNjc4d3RNTERYWkxP?=
 =?utf-8?B?TG1UQVNIem8vdDQ4WGVOZ1Y5bkZsV2RmUUxQd2ZqS1FLN2RwV0NhQWRFYUtV?=
 =?utf-8?B?eTR1MmJoRVhTMVc4SjQ3VUR6TEpaa0s1cWkxenJTZmxGV1JwL1FXSFArKzhq?=
 =?utf-8?B?NStXSkhaNmVzRThidnphdlcvTGpTd0tpVC9CRFZIWUxTTHJXY3p2Y1gvdURG?=
 =?utf-8?B?dFBqbmhTMXhncHFiOS9JR2UwK2p1enNiRk1hZkdLeVkvd3drUW1pMTNzMUl6?=
 =?utf-8?B?cU5WQTNtTVpQOE5TS1pEUVJraDFpLzkycEJrVU12MlZnSkthdVVYMG9IRVhZ?=
 =?utf-8?B?VGRNaG9nNys4OUZQQTdNNDRlTlZWOXJ0MXdrSnNyTDNIenUzdXpZRXBFQlAz?=
 =?utf-8?B?WTZqWW85eUNNTTRjdDRHSVhRM1k4R2ptM2FXOTRZQUNCYXBNNnhlNTF1ZVJy?=
 =?utf-8?B?TFBTbzRQQ1dtYnI4ZjZzOHV3SWU5Y3dCeGNISE9Ra0FGVDVLRm5aOFZiQ1lh?=
 =?utf-8?B?YWw3d0hVVzdlV3RUc0FRc3NodG4rSmRRTUtIUFYvSHpDcG8wVEtVOHZpNkky?=
 =?utf-8?B?WXBaeEtGWjBGdEtJZ2grdmM4L0N4SnJCVi9OY0p5YndVNExGSWt1bndaR2Jq?=
 =?utf-8?B?SmJTbUxKUWJ0ejB1NDU0Y1lSYi9oa3NibDdZanJ2TmdGM2RhSVUwR2xKOExU?=
 =?utf-8?B?UHZYZlN4L1BmcDBIZ1I3b2RIcHFWRlNuaXYzWFA4ZDlIczRHNEtyQ2J3c1p4?=
 =?utf-8?B?VmR3cDU1eVNGelc0Q200MXNWUkJsdzB3elNCQkt1bmdIbC9TbDlSUzdiVzBt?=
 =?utf-8?B?ZnBVbmdoN3dLUzZhVnlsdkJLdGFLZVA2UjR3cGFTUXRiaWh0cDdzaWZHc3Nl?=
 =?utf-8?Q?FmhjP9W7w8WTqWJQ2H8Vwf0X4?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46f86633-fae1-4413-998c-08dd1a4c6390
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2024 01:29:14.6362 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iQQCa2/kiT2UE4kv5iFsqLEDppZGwjZIJmhv47bvXIqW1Es2NIidce/OKmc5t1iBPLu983ykGDCKz0sy5IWBkmSIf3vxEdLWx5oIydAmlvQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7494
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

SGkgSmFubiwNCg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjIgMC8zXSBmaXhlcyBmb3IgdWRtYWJ1ZiAo
bWVtZmQgc2VhbGluZyBjaGVja3MgYW5kIGEgbGVhaykNCj4gDQo+IEkgaGF2ZSB0ZXN0ZWQgdGhh
dCBwYXRjaGVzIDIgYW5kIDMgd29yayB1c2luZyB0aGUgZm9sbG93aW5nIHJlcHJvZHVjZXJzLg0K
PiBJIGRpZCBub3Qgd3JpdGUgYSByZXByb2R1Y2VyIGZvciB0aGUgaXNzdWUgZGVzY3JpYmVkIGlu
IHBhdGNoIDEuDQo+IA0KPiBSZXByb2R1Y2VyIGZvciBGX1NFQUxfRlVUVVJFX1dSSVRFIG5vdCBi
ZWluZyByZXNwZWN0ZWQ6DQo+IGBgYA0KPiAjZGVmaW5lIF9HTlVfU09VUkNFDQo+ICNpbmNsdWRl
IDxlcnIuaD4NCj4gI2luY2x1ZGUgPGZjbnRsLmg+DQo+ICNpbmNsdWRlIDxzdGRpby5oPg0KPiAj
aW5jbHVkZSA8dW5pc3RkLmg+DQo+ICNpbmNsdWRlIDxzeXMvaW9jdGwuaD4NCj4gI2luY2x1ZGUg
PHN5cy9tbWFuLmg+DQo+ICNpbmNsdWRlIDxsaW51eC91ZG1hYnVmLmg+DQo+IA0KPiAjZGVmaW5l
IFNZU0NISyh4KSAoeyAgICAgICAgICBcDQo+ICAgdHlwZW9mKHgpIF9fcmVzID0gKHgpOyAgICAg
IFwNCj4gICBpZiAoX19yZXMgPT0gKHR5cGVvZih4KSktMSkgXA0KPiAgICAgZXJyKDEsICJTWVND
SEsoIiAjeCAiKSIpOyBcDQo+ICAgX19yZXM7ICAgICAgICAgICAgICAgICAgICAgIFwNCj4gfSkN
Cj4gDQo+IGludCBtYWluKHZvaWQpIHsNCj4gICBpbnQgbWVtZmQgPSBTWVNDSEsobWVtZmRfY3Jl
YXRlKCJ0ZXN0IiwgTUZEX0FMTE9XX1NFQUxJTkcpKTsNCj4gICBTWVNDSEsoZnRydW5jYXRlKG1l
bWZkLCAweDEwMDApKTsNCj4gICBTWVNDSEsoZmNudGwobWVtZmQsIEZfQUREX1NFQUxTLA0KPiBG
X1NFQUxfU0hSSU5LfEZfU0VBTF9GVVRVUkVfV1JJVEUpKTsNCj4gICBpbnQgdWRtYWJ1Zl9mZCA9
IFNZU0NISyhvcGVuKCIvZGV2L3VkbWFidWYiLCBPX1JEV1IpKTsNCj4gICBzdHJ1Y3QgdWRtYWJ1
Zl9jcmVhdGUgY3JlYXRlX2FyZyA9IHsNCj4gICAgIC5tZW1mZCA9IG1lbWZkLA0KPiAgICAgLmZs
YWdzID0gMCwNCj4gICAgIC5vZmZzZXQgPSAwLA0KPiAgICAgLnNpemUgPSAweDEwMDANCj4gICB9
Ow0KPiAgIGludCBidWZfZmQgPSBTWVNDSEsoaW9jdGwodWRtYWJ1Zl9mZCwgVURNQUJVRl9DUkVB
VEUsICZjcmVhdGVfYXJnKSk7DQo+ICAgcHJpbnRmKCJjcmVhdGVkIHVkbWFidWYgYnVmZmVyIGZk
ICVkXG4iLCBidWZfZmQpOw0KPiAgIGNoYXIgKm1hcCA9IFNZU0NISyhtbWFwKE5VTEwsIDB4MTAw
MCwgUFJPVF9SRUFEfFBST1RfV1JJVEUsDQo+IE1BUF9TSEFSRUQsIGJ1Zl9mZCwgMCkpOw0KPiAg
ICptYXAgPSAnYSc7DQo+IH0NCj4gYGBgDQo+IA0KPiBSZXByb2R1Y2VyIGZvciB0aGUgbWVtb3J5
IGxlYWsgKGlmIHlvdSBydW4gdGhpcyBmb3IgYSB3aGlsZSwgeW91ciBtZW1vcnkNCj4gdXNhZ2Ug
d2lsbCBzdGVhZGlseSBnbyB1cCwgYW5kIC9zeXMva2VybmVsL2RlYnVnL2RtYV9idWYvYnVmaW5m
byB3aWxsDQo+IGNvbnRhaW4gYSB0b24gb2YgZW50cmllcyk6DQo+IGBgYA0KPiAjZGVmaW5lIF9H
TlVfU09VUkNFDQo+ICNpbmNsdWRlIDxlcnIuaD4NCj4gI2luY2x1ZGUgPGVycm5vLmg+DQo+ICNp
bmNsdWRlIDxhc3NlcnQuaD4NCj4gI2luY2x1ZGUgPGZjbnRsLmg+DQo+ICNpbmNsdWRlIDxzdGRp
by5oPg0KPiAjaW5jbHVkZSA8dW5pc3RkLmg+DQo+ICNpbmNsdWRlIDxzeXMvaW9jdGwuaD4NCj4g
I2luY2x1ZGUgPHN5cy9tbWFuLmg+DQo+ICNpbmNsdWRlIDxzeXMvcmVzb3VyY2UuaD4NCj4gI2lu
Y2x1ZGUgPGxpbnV4L3VkbWFidWYuaD4NCj4gDQo+ICNkZWZpbmUgU1lTQ0hLKHgpICh7ICAgICAg
ICAgIFwNCj4gICB0eXBlb2YoeCkgX19yZXMgPSAoeCk7ICAgICAgXA0KPiAgIGlmIChfX3JlcyA9
PSAodHlwZW9mKHgpKS0xKSBcDQo+ICAgICBlcnIoMSwgIlNZU0NISygiICN4ICIpIik7IFwNCj4g
ICBfX3JlczsgICAgICAgICAgICAgICAgICAgICAgXA0KPiB9KQ0KPiANCj4gaW50IG1haW4odm9p
ZCkgew0KPiAgIGludCBtZW1mZCA9IFNZU0NISyhtZW1mZF9jcmVhdGUoInRlc3QiLCBNRkRfQUxM
T1dfU0VBTElORykpOw0KPiAgIFNZU0NISyhmdHJ1bmNhdGUobWVtZmQsIDB4MTAwMCkpOw0KPiAg
IFNZU0NISyhmY250bChtZW1mZCwgRl9BRERfU0VBTFMsIEZfU0VBTF9TSFJJTkspKTsNCj4gICBp
bnQgdWRtYWJ1Zl9mZCA9IFNZU0NISyhvcGVuKCIvZGV2L3VkbWFidWYiLCBPX1JEV1IpKTsNCj4g
DQo+ICAgLy8gcHJldmVudCBjcmVhdGluZyBuZXcgRkRzDQo+ICAgc3RydWN0IHJsaW1pdCBybGlt
ID0geyAucmxpbV9jdXIgPSAxLCAucmxpbV9tYXggPSAxIH07DQo+ICAgU1lTQ0hLKHNldHJsaW1p
dChSTElNSVRfTk9GSUxFLCAmcmxpbSkpOw0KPiANCj4gICB3aGlsZSAoMSkgew0KPiAgICAgc3Ry
dWN0IHVkbWFidWZfY3JlYXRlIGNyZWF0ZV9hcmcgPSB7DQo+ICAgICAgIC5tZW1mZCA9IG1lbWZk
LA0KPiAgICAgICAuZmxhZ3MgPSAwLA0KPiAgICAgICAub2Zmc2V0ID0gMCwNCj4gICAgICAgLnNp
emUgPSAweDEwMDANCj4gICAgIH07DQo+ICAgICBpbnQgYnVmX2ZkID0gaW9jdGwodWRtYWJ1Zl9m
ZCwgVURNQUJVRl9DUkVBVEUsICZjcmVhdGVfYXJnKTsNCj4gICAgIGFzc2VydChidWZfZmQgPT0g
LTEpOw0KPiAgICAgYXNzZXJ0KGVycm5vID09IEVNRklMRSk7DQo+ICAgfQ0KPiB9DQo+IGBgYA0K
PiANCj4gU2lnbmVkLW9mZi1ieTogSmFubiBIb3JuIDxqYW5uaEBnb29nbGUuY29tPg0KPiAtLS0N
Cj4gQ2hhbmdlcyBpbiB2MjoNCj4gLSBwYXRjaCAxLzM6IHVzZSBmaWxlX2lub2RlIGluc3RlYWQg
b2YgLT5mX2lub2RlIChWaXZlaykNCj4gLSBwYXRjaCAxLzM6IGFkZCBjb21tZW50IGV4cGxhaW5p
bmcgdGhlIGlub2RlX2xvY2tfc2hhcmVkKCkNCj4gLSBwYXRjaCAzLzM6IHJlbW92ZSB1bnVzZWQg
cGFyYW1ldGVyIChWaXZlaykNCj4gLSBwYXRjaCAzLzM6IGFkZCBjb21tZW50IG9uIGNsZWFudXAg
KFZpdmVrKQ0KPiAtIGNvbGxlY3QgQWNrcw0KPiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL3IvMjAyNDEyMDMtdWRtYWJ1Zi1maXhlcy12MS0wLQ0KPiBmOTkyODFjMzQ1YWFA
Z29vZ2xlLmNvbQ0KPiANCj4gLS0tDQo+IEphbm4gSG9ybiAoMyk6DQo+ICAgICAgIHVkbWFidWY6
IGZpeCByYWN5IG1lbWZkIHNlYWxpbmcgY2hlY2sNCj4gICAgICAgdWRtYWJ1ZjogYWxzbyBjaGVj
ayBmb3IgRl9TRUFMX0ZVVFVSRV9XUklURQ0KPiAgICAgICB1ZG1hYnVmOiBmaXggbWVtb3J5IGxl
YWsgb24gbGFzdCBleHBvcnRfdWRtYWJ1ZigpIGVycm9yIHBhdGgNClRoYW5rIHlvdSBmb3IgdGhl
IGZpeGVzOyBhbGwgcGF0Y2hlcyBwdXNoZWQgdG8gZHJtLW1pc2MtZml4ZXMuDQoNClRoYW5rcywN
ClZpdmVrDQo+IA0KPiAgZHJpdmVycy9kbWEtYnVmL3VkbWFidWYuYyB8IDQzICsrKysrKysrKysr
KysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0NCj4gLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwg
MjcgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pDQo+IC0tLQ0KPiBiYXNlLWNvbW1pdDog
Yjg2NTQ1ZTAyZThjMjJmYjg5MjE4ZjI5ZDM4MWZhOGU4YjkxZDgxNQ0KPiBjaGFuZ2UtaWQ6IDIw
MjQxMjAzLXVkbWFidWYtZml4ZXMtZDA0MzVlYmFiNjYzDQo+IA0KPiAtLQ0KPiBKYW5uIEhvcm4g
PGphbm5oQGdvb2dsZS5jb20+DQoNCg==
