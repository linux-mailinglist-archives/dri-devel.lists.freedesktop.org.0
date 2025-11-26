Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAA8C8B332
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 18:29:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 000E810E6BC;
	Wed, 26 Nov 2025 17:29:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nDYJXhVV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC36510E6B4;
 Wed, 26 Nov 2025 17:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764178152; x=1795714152;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=40eMEpWx/BMZMoikiZN6DyJC5n6FFFkeZnOYhg+7FDQ=;
 b=nDYJXhVV6gW/Of2qQxBB/ogO44/6Y1KWk2Ks6wsTXLIAOjVAnGoE/Z8k
 eiI/0pwabsHD/quCHj82xQT4UV08JzfyR/iHeT3pEX1MVL9crd0aA0pcB
 HKoF8HHvOWtaPTHkF+6qDztyb0hJ2aPfgo/RtjyM5Ef29tbzZiXqTAno/
 rrp2aK4Bj7D4YalDEgr1YMg5gfj7zLWExKHTQUuL4HSuo5+UJdGaQn6fe
 oS0cJOgP3kuXUtnBriffFCk5gfm0WQfmtsF3BvGr3KehSed74HWfL70bR
 gu21jHRBTey+iakGh2N9qH85rGa2KHJ4K5gTyv3cz9q1Zc+GprX1N0n/v g==;
X-CSE-ConnectionGUID: ZDbiDplkTXyLb1IUwRWmJw==
X-CSE-MsgGUID: ZU0Msj/+Tpaw/dNTVEdAQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="83830549"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="83830549"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 09:29:11 -0800
X-CSE-ConnectionGUID: R4Fpfh0PSgiYMG3lNP3+Pg==
X-CSE-MsgGUID: CVbkmEIiRzSA6s4/HblDGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="216346968"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 09:29:11 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 09:29:11 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 09:29:11 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.43) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 09:29:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uR7BvM7uoQLEaEnOCiAJ8cxoaERBhkhR7Ddg5wT7e+mlwpJJBrpB4G7rV1zfMdBB1C20bpC7SMBs1lRZcRmbnhqySdAvmX50xB1/vZLvFRPGEunnRIK6nv6Wal5we99VWdQSII/QmbJLxyos6kU5pITkaNQDW9EsEXrsmu+E1kI9o3rO4g07Vg+DuUoe0ZYyww0cUL3DaFKJVWKCi0MHjElpYZU76wtiYHybpTFycqOoAVFXP+MN77ZaOOvRug0Oy8c4DXxdXn8+uStSE8UFd7GstCFABDJ8IwxWTQ25dub8DcEteUxZL3ql+aPk1bGlW1Zj5Ku8R7B6Fk1idHr6Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDTFe9SgT2gV1l8wwgpWoMj2HBkTFab/BMUfjBKPvRw=;
 b=ZbPXdmYzsCS2caALzDFpw6V5Pt4syuKIWaLJUJu6vPdYVrChUI6HrJRptPXlCSLTPXrPXMO7X4047a7e78zy95NI6DrzZ9IkcI4tbL3X9Y6peUs/zbgFGZToNCfbfzUMcc5INkBR7oSfEnxTsXNQG6+nlo4SyJ7lKVFgfJfqG2UhG1ZMfTg+53pl5Ll8cD15KK7AA/wvZhewbqjllGqX8+noLWSZ2Vvaahghu16zThsoqjd7TWLuo4IIkWTmz2b4T8PMdwQ8H7tMruJjOfnhCifPp22d9Ljlumb7vFRgf21WklVtAyyfyh/hjZ3TZjj/2hFEzMIbIC9KU/ucJmpY/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by SA1PR11MB7015.namprd11.prod.outlook.com (2603:10b6:806:2b8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 17:29:07 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695%4]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 17:29:06 +0000
Date: Wed, 26 Nov 2025 18:28:55 +0100
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <stable@vger.kernel.org>, =?utf-8?B?6rmA6rCV66+8?= <km.kim1503@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH] drm/i915/gem: NULL-initialize the eb->vma[].vma pointers
 in gem_do_execbuffer
Message-ID: <qylrctylmtj6qzibfpbapwpb77ut7gzckgg2wpc3gv56kl46m2@hyio7hcsj6vy>
References: <20251125133337.26483-2-krzysztof.niemiec@intel.com>
 <4423188.Fh7cpCN91P@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <4423188.Fh7cpCN91P@jkrzyszt-mobl2.ger.corp.intel.com>
X-ClientProxiedBy: VIZP296CA0015.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a8::10) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|SA1PR11MB7015:EE_
X-MS-Office365-Filtering-Correlation-Id: 62a04e4c-24b8-4e76-03e4-08de2d114d4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bnE0bVVPSjZLNFFSUjE1RWk0U2JNV2J1azdZd2swTk1Sc0IvbzNsbXRaaUVV?=
 =?utf-8?B?d2tXRjBhb1Z4WjhmZ0tKbUNMRlI4RVJEVEJJVFRvWnB6RXhMUTdCWW1EdXMw?=
 =?utf-8?B?aDFLY0dlYTAzMHduOC9JZy9EYUtYRFR6QUpxVmFtdnV3ckExTHQ5TURPa1VR?=
 =?utf-8?B?eGJtZFIwei8vdExwV3VRTmtiTmkzSEU2eUhYVXhQWlJqTVlCcHp4aGIxVmVT?=
 =?utf-8?B?bnNDc2dTWHZUOElSRGRZMUFwTVVkWnBPZUpNTnc0eTd3RVVqWW5BdXBSeDNx?=
 =?utf-8?B?eE9xd2cvS0kxUStFSnBvVElKWE05V1hLSm02YVJPeURiaktidkdLOWwvc09j?=
 =?utf-8?B?VW1LamQ3T3JoczFCSnNTU2hnRUdzUVI4bmtDMkl3NTNzM3FDbVcvakxLNVZM?=
 =?utf-8?B?L1lEQVN6eWd0YWd3eHgxeDEvcVNxWkQ2bjZtNElZdHRkeWxzMUdtcmQ5aEpw?=
 =?utf-8?B?VjhQUlk4VHJaMEdtT0NCV2N0UjRBUkhRTE9xRk00MTVyT0hjeUpFUVlpOVpE?=
 =?utf-8?B?a1FtZVhwTmZSSDFnam1xSkw3MG9KaExtVjhSOGRjU1JVNUJyUlJHSW5IOFBu?=
 =?utf-8?B?UEZUUExaM2trV3BDM1B1U3MzSklnUFJwTlphbkU0ZmpneXFWS04wZnpiU0tK?=
 =?utf-8?B?bGFMMGt0SG9tN3ZsTlFoWWovVi9OZURvUk1PVDJlZitPRnZIUmhRdER2MWp5?=
 =?utf-8?B?YzcvNXhkQUxhS0hRMDc2SFAxdVdtNHBMazhkY2hxSGozblpKZ2Q2YktSazBn?=
 =?utf-8?B?Z2JCWGZzNjZTSndFVmQwSDFCSE9nVlIzTXFlVzltMWVIZVRmb1hvOUt2OUIy?=
 =?utf-8?B?Q09tS0RqMm1ad0xQS3VrOHdpMndzUmNvdS9XTk9LSkU3R2FaNzc2YkVhUi81?=
 =?utf-8?B?Ry9ibVhpOXljdEFHWVdCZ3MyakdYUHQ2SkpuNExiK05SZDQzdEh0ZHVreGt0?=
 =?utf-8?B?VlBNVTlLNE1tcFRhS2JWL05nVzlDUkFSM2o3VjRRdTRjNU5sc012NVdtamsx?=
 =?utf-8?B?OXRhalhqNHBnb0h1dFhsZzR5OWFNakFKTVRSYWtXLzJDSHdHYjNPSjNxeEJu?=
 =?utf-8?B?U1p3SVFFeTc3RXBZL29IQmV1WTRyYzl5VlVZRTV6bGRGQUdQR1pHZ3BnRnNy?=
 =?utf-8?B?TE53NzhXODRZUGVka24ycVRPMVZ1ZFlhUGRqb3RwbGI4Z3NsZVpibkk3MXl4?=
 =?utf-8?B?YmhWcENoN1Q3OElWSWNQWHVBTytXR1MwN2xMVnJsZEVhZ0FWYk1iYWg5ZHQ3?=
 =?utf-8?B?Ry9VVTgra29lSWlLOEUyL2dlT0w5LzVubWpqVG54RThmaUFJOHBPQUsvbThS?=
 =?utf-8?B?UlNFZjV0OWNqOEtOMSttR0ttOW03TGFmVkI0YjMxaUFuSjZRZmttV25qZ3Ba?=
 =?utf-8?B?eTYxNWpxMjYrK2NpRmJObzNzMXFoRUYvK1JscDdsUGVDaFZlN2lkNkhhUXoz?=
 =?utf-8?B?QThjNEtXZUpYNG42eDl5NGpQUFlMbTFBOTgyLzQ4aW1Renk0R0pLc0pueHpQ?=
 =?utf-8?B?OVVmS2pjOHJuQldVeTVBaHZ5SmUwcVRoUms4aHZta0ZTMVRWbW9yT0h1L05F?=
 =?utf-8?B?QVRSZlIxVzZXckFWZCtxSkx5QXUwUzB1UUFESWV0bllIMzc1d04rYkZIQ05y?=
 =?utf-8?B?a0FUcHhsQkt0QlRUbm5KZ0F1YTVOS2FRaU0vVVJQWGIyb1dzWUhtdXcvWGdN?=
 =?utf-8?B?RmhIRkxKbXN0VEMyTk1sSEdxQzBpU2xvNWNLNlN3eEVhallBZm1zVDVmREFG?=
 =?utf-8?B?TUY3Zlp5V0JtdXpGcXhsQ3B1a2JHdm4zSDYwSDNDckZJMUF1RFA3c0R2SXZG?=
 =?utf-8?B?MU9CN3BqdTEvZ3ZRbkZZeXBFOXExN2ZhdzlobXZITHk5Zkh4alVuN0w0OE1S?=
 =?utf-8?B?L0hvWUZIZUxlMUZoNmxBOW13VC9VMTRzL1ZaYlBoV0laSmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjRkb0E5OTNyaGxiTENTMGZkbGZ4eDNqUFdLTGo2b2IxNk4rN1pBTlJxeUx3?=
 =?utf-8?B?ODM5R1VERTFudmdpSThtRlFtNk8ydExRb0M4WkQzL3pJTEFQeVRwQTk0WjY2?=
 =?utf-8?B?eVVmbDdKUEk5cWJ0NXE3V2NwZURJNkw0MDUram1qWjJ0bWJIY1JEdXRPVjBS?=
 =?utf-8?B?ZVRFa0Q1Rkx6QUh2YVYyZHdBMlhkV05xUmY4djBuV2NGbVNua1JPcDh2Skhs?=
 =?utf-8?B?V2lic1d6bkxka25jR1BpTmFsLzRNKzM0eThGNEFNYXczazY1bk9nSFZVVDMv?=
 =?utf-8?B?UHdaVU54TVZGT0NWN0FSRWIySkJvcjdvV05YcEN6d3k4SXB4cVlwOVVWUGhZ?=
 =?utf-8?B?elJ0MFhhWXJHU00zeFpPRXlhMXBGWjVBT1hpZ1k2YTJDL0N1aENqbWdKYWh1?=
 =?utf-8?B?Y0oxUlZZTU1zYzlnbkwzYUIybWQ1NDlFUFcrbEhhVGkyeUdxRTY2dU5wcW5D?=
 =?utf-8?B?NXBjd1AxZ2NzbTh1MEMzNlEzWU9xc2ZTaDE1bkZpblNOZHFJSmpOWVk0VjVF?=
 =?utf-8?B?RTVPc0ZYTGdrejI2MnR3b3dQeXpEc3ZlZEw1ckZLdERDNklpaTdid1c2a1Rx?=
 =?utf-8?B?dUJ1cGVaaDY3MzNwdW9uNEthcWdyK2lkME5acEhEV3dKZ01nT3Y1QzFLZTFu?=
 =?utf-8?B?VU5LYlBQdUJkKzNzOGFjMTViR2ZEZC93Q0NLSURDYzAwSXdkeFRkRjU3M3ox?=
 =?utf-8?B?LzhyRzhsSHozUThpb1RJMlg5aENxZkNZdW5mUCs4emZIV1JUa0s4T1hVUU9p?=
 =?utf-8?B?Nkh6RmtPRFVJSVJQSFNkNEZKQjZVNC9xZXp0bGZCUWhmT211VGNQTjU0Nlkx?=
 =?utf-8?B?UE15c29pZU0rcThuckZPUTBKaDR0QkY3OFNKRTAyWXZ3ekNtcTgvMzJkYmVV?=
 =?utf-8?B?MkUvZHdpRDlPcFBTTUVZZUlTR0dubDJxTklwYVc3cDUzTVloa01FV3Q0NFZK?=
 =?utf-8?B?SWZ1QXhuMnFTUTRaOGNFZFNuV2xSYSt0SHhTekhoNmFFc2dWampqKzArNzR0?=
 =?utf-8?B?MnJ3N2N0d2h6Ly9QZVFNbXUvVDUyWUczZDdKYmRMMm9lYkxPWENrUWxxQTlS?=
 =?utf-8?B?dHpoRWxvcXNVK2RPL2xjalA4bFhBWmJJeG8rV2dvZk5sdTRqNGpHN0tkRHdo?=
 =?utf-8?B?dGVQeGRRbUtRRWhGTERkYWNkVy9ablFCYkZmblM2dXY2VTh3STJFWWVwWXR4?=
 =?utf-8?B?TXNac3JxTHZzL2dCM1FsanlDZ1N3SFpEVlRYR29kMEJPZ3g2Z09sMmRrcmdM?=
 =?utf-8?B?U0xPVklIUEVNamtGME5QMW1pOU4rdXZGRUNzZzhscXcwbEpYeHl3TlpWNnhv?=
 =?utf-8?B?ZFlibi9pbjNDNGttZDJ0YVprKzVncXdDeFNWN2xHTTVBWisvTzl5ak1vekQ3?=
 =?utf-8?B?OVZXUVIvNDdrUW1qYVZFVm4rQjJ4SHc0ak1aRGZQTGx5eEVIcmQ4LzhDeDBi?=
 =?utf-8?B?djZEN0RTcE02cHdKbkRzV1R0RUFBR1BqeVE4YUxWdnZvODVvZVdTTjhpeld3?=
 =?utf-8?B?RzhEMkJIM0Y0VXdDRCt4dXRnVkZVNFRNUVMzZmRsczc0Z2NaSWVTNUI3TlBR?=
 =?utf-8?B?YU52SjFEZ0NhQVhnZ2FsaS85bWFlZFZ4aWJjZTVwM0RSeHIvN3UrWndVcVlO?=
 =?utf-8?B?bXRKcHowUmJUdWxLMmIrdDVPZEhJdVQvSUMvaFN4S1NOTXBUQmFKT0pPSnBl?=
 =?utf-8?B?d3RZN0VDWXVsYzJKbVcwc1pVcklBNFp0UXpKb0xpZkQyYVBvRTRiOVFDNnho?=
 =?utf-8?B?di9CVUI5UHUvKzlWclJCcmlqTkgyNjNMTG1rNlNDZTVudTh6b0htT2taNEZN?=
 =?utf-8?B?ZTVqTU81bk1yQm90Qk5pV0ljQ01sZUlYRXNoeXdBRk1hamdwd2lxVkVsZVVp?=
 =?utf-8?B?UUhMRU5hZTVHT2thQXRFZzEzSmJUZjNCZE1Ba0pVT0dpalc2K1RDM2ZGSlU0?=
 =?utf-8?B?TktkNk4zeE1QSXpJRWdGQTFCdkhnYjFwZUVmMXl3RlVWY2tzc0RncmQ5ZDB1?=
 =?utf-8?B?N0I0QUtXK2tzU2tWL3pISkFGTGdwWWYyRFBSOWVHRHZLQnJyOWcwNGtnVUhn?=
 =?utf-8?B?L2R3K2JWQ3J0VU5uOUxJNnRyQzBGSEF2M2xTdXNrT1ovY0pHU3hNMGk2b0xa?=
 =?utf-8?B?T0ZWRy9mL05qdmJSYjFqTlRPWnUxbnVFaHRMcjRabEVrUkpnZHJYOEFUcjE3?=
 =?utf-8?B?UXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62a04e4c-24b8-4e76-03e4-08de2d114d4f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 17:29:06.9022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gRexkvmSEdNmq4OJOSmUZFhmf682jduuP+uM/cxe0TodP9wIZDrnaa7cdQKZS7FmJ3HpszpsHWISlfT6DHfJjOUhU0Sb0E+cnRhHE1gQ9IE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7015
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

On 2025-11-25 at 19:06:32 GMT, Janusz Krzysztofik wrote:
> Re-sending because of my response unintentionally HTML formatted, with correct 
> email address of Tvrtko by the way.
> 
> 
> Hi Krzysztof,
> 
> On Tuesday, 25 November 2025 14:33:38 CET Krzysztof Niemiec wrote:
> > Initialize eb->vma[].vma pointers to NULL when the eb structure is first
> > set up.
> > 
> > During the execution of eb_lookup_vmas(), the eb->vma array is
> > successively filled up with struct eb_vma objects. This process includes
> > calling eb_add_vma(), which might fail; however, even in the event of
> > failure, eb->vma[i].vma is set for the currently processed buffer.
> > 
> > If eb_add_vma() fails, eb_lookup_vmas() returns with an error, which
> > prompts a call to eb_release_vmas() to clean up the mess. Since
> > eb_lookup_vmas() might fail during processing any (possibly not first)
> > buffer, eb_release_vmas() checks whether a buffer's vma is NULL to know
> > at what point did the lookup function fail.
> > 
> > In eb_lookup_vmas(), eb->vma[i].vma is set to NULL if either the helper
> > function eb_lookup_vma() or eb_validate_vma() fails. eb->vma[i+1].vma is
> > set to NULL in case i915_gem_object_userptr_submit_init() fails; the
> > current one needs to be cleaned up by eb_release_vmas() at this point,
> > so the next one is set. If eb_add_vma() fails, neither the current nor
> > the next vma is nullified, which is a source of a NULL deref bug
> > described in [1].
> > 
> > When entering eb_lookup_vmas(), the vma pointers are set to the slab
> > poison value, instead of NULL. 
> 
> 
> Your commit description still doesn't answer my question why the whole memory 
> area allocated to the table of VMAs is not initialized to 0 on allocation, 
> only left populated with poison values.
> 

Becuase kvmalloc_array() is used. [1]

I guess one could swap it to a call to kvcalloc() or something similar;
the thing is that the call actually handles both allocations of
exec_list2 and the eb_vma array, the former doesn't need to be
zero-initialized, the latter technically also doesn't but it simplifies
error paths (and fixes the linked bug). I'm not sure if a
zero-initializing *alloc() would be more readable or not here.

Thanks
Krzysztof

[1] https://elixir.bootlin.com/linux/v6.17.9/source/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c#L3586

> Thanks,
> Janusz
