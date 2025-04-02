Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F13CEA78C28
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 12:24:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D29E610E73B;
	Wed,  2 Apr 2025 10:24:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gRDeH8WX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C6610E73B;
 Wed,  2 Apr 2025 10:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743589480; x=1775125480;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8PoKoMUVaW1+MN7OHOkbPVoVx4Ar8ab1tfUQmELJcCk=;
 b=gRDeH8WXIoOimoSE96l9nRyK7irzWFm9MwlP6GTTpPwuTA1H93bQ8Rkn
 8lJRZ8a3CjFze4joGJMu4gaZ4AIWfHWM2QJMFCQMV221tw1zfbH9JeIBU
 CBKSImUWNPc4mVk2FUR9TS2QDU/bpm2XWV8caUu8+88wwJEZeh+zaTkfo
 8ezeKZ9fgnRsrOP6Q7zvV5Qob1zzfzP6d9b+8PMJQ3ZuGQpCQK97K4S76
 rH2jqzjB7aW5PXBKKUI/rijU9LDuA/n4R3b7wLVN6JnuG6wkpGTLXqKow
 fK2XpkW6salC9ckMfnu0S4ewMm/YueXB9xemO1g7KbG6joZ6cTsyR7fhi Q==;
X-CSE-ConnectionGUID: 4QHWOuNvQG2MCkrsaCdImg==
X-CSE-MsgGUID: YFdrTcqzTbiuiodfyLyhcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44093055"
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; d="scan'208";a="44093055"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 03:24:40 -0700
X-CSE-ConnectionGUID: 7USzRALGT9C6EuOKgFYfdA==
X-CSE-MsgGUID: 5Vh9X8AOTIKKJ16uQrDqhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; d="scan'208";a="127559766"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 03:24:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 2 Apr 2025 03:24:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 2 Apr 2025 03:24:39 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 2 Apr 2025 03:24:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qepz6JWTVxuLzZoXNoDatYKEQucnZXOZf338F+MvpQZO6nBfWQ4B3dhPyHpBe8N1/EsVCma85pzklJOXSDghTmnypdaUO7E3nCv//XxDWOo7j8jvsDMgDaEKDvpQeVMOz35Ftv8ebE03eOgut4r/7+GcIkEsvxyif9uy4SYzDRZTkuqzP/+KKyi/B6WJKInD0725WIhcvvZz5bNbBEChmiibCB+gekG9Ryy3Sm5IFKGbWm1KJS7/+U1MoBKwnBDGpqXn/ls9AcCZqaeumCVnDFvQhwtIkM7Gmfm1cA/TdGpaHQTKa2fEiKzZWcElXtwAsCgJuRoGEHKETPrZUA9w5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N7RSlSvgmOIgZdxHzSNSYslT7hwJoa7AsW7vb9C7wUA=;
 b=SAvDGlpVprlKFqKrCpEEsr8mmn+xgETIJbppvqmtUqQnaT7cL++E8J0LmMTGWin7YW00G/vj8lwBhwYHWymgFmEU1P0o5mmn28k0ppul2nt1s1hcLCD/RiHyz8AdbLB/WMQQADSlKVss5Iy1A3g9WRDgzXpd4R0nmtytaWdA/mknXnuSP7JSoe8F6mnhx6uytjqEpYG3BWmA1WCPkPdt7cZoV1MoI+ylR5WsvmPIF5pZ8mvKmau8tYilckJonmJVMG2P9TQSpzG1m8Jsw/AC3tFdAiaCMacLdcjfsLfYa4p2hQ8bWIf0YjOVcTuOCDHwoDADtFG5xnsS6MaUns+5Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH3PPF4E874A00C.namprd11.prod.outlook.com (2603:10b6:518:1::d1e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Wed, 2 Apr
 2025 10:23:56 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%4]) with mapi id 15.20.8583.041; Wed, 2 Apr 2025
 10:23:56 +0000
Date: Wed, 2 Apr 2025 12:23:53 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
CC: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>,
 "Bjorn Helgaas" <bhelgaas@google.com>, Christian =?utf-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kw@linux.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v6 2/6] PCI: Add a helper to convert between VF BAR
 number and IOV resource
Message-ID: <6cvrmn5try63xuv2xf3eqhwugvwavibxu6hec5z3ab4ni3oava@kzkumf5xv5li>
References: <20250320110854.3866284-1-michal.winiarski@intel.com>
 <20250320110854.3866284-3-michal.winiarski@intel.com>
 <fd94c15d-7fcc-c9db-8af0-868c15bc34a3@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd94c15d-7fcc-c9db-8af0-868c15bc34a3@linux.intel.com>
X-ClientProxiedBy: WA2P291CA0048.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::10) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH3PPF4E874A00C:EE_
X-MS-Office365-Filtering-Correlation-Id: 151f7c02-7a35-494d-f045-08dd71d0798d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0pJSVExUjBFN0dybWdRWG1EMlk0Z01CVzRsZ0d1SGM3YnFLMWFhZEFTU2Uw?=
 =?utf-8?B?UitOVFVqWGhHZ0g1YXd1NUhvcWJuZmtOdkhLSnBsUFlLQTZJTmV5bTBEQ3Ni?=
 =?utf-8?B?SG1abTdqTmhyaUpZUXRkM2JnZndHbCsreHZGUUFoMkdhMldBYU9Fb0pHM2cw?=
 =?utf-8?B?N0JDL2c3RVJad1N5dGtidXoyVERtR0ZZajVndTFUNjNUanlBd3RjdGZzaEQy?=
 =?utf-8?B?VHRGb3RwazFnMEhBYTdOS0pPdXlteFhtU2t6MThkTXR6WlRDYlYyb0ZScVdv?=
 =?utf-8?B?TUh6M0UyMFBuL1d3eXFmSmwzNG04WE05ckVTYjBvNmFSVlc0SVkzRnlJc2tZ?=
 =?utf-8?B?QVNsby9ZTjZ2cWJCekRPL1dIcC9vd0plSUdWMTlmZmYyN3R2cTRKOGdVTzMy?=
 =?utf-8?B?aHZuSEtmNEs1ZlpuMUpzN3h2dmZjN3Z4Ym5TQmZoSmdJT0pYV1BvZjFLc1ZM?=
 =?utf-8?B?RzZtRVN2T094UDRQcFJqV2RUN1hFMnhHNEt6QXZMaW5qZXcxWlh3bTBPWTJ0?=
 =?utf-8?B?cmNvazJJZ2tjQlJwMzE4N1dSWFNtbDg3MHRxYmlqL1BGYmpGNm02NmwxRmhn?=
 =?utf-8?B?aDBBMGthSlpNVmlZVVcxQkFRaXQ0bTNXUlQ2K0hnNStxNnhORnk0dHRZYURT?=
 =?utf-8?B?cWNuaFMyb0VhUUl0Rmx6NWVOaGlrWm14TlF6UXB4V240WEs1eVNaak8zcm5J?=
 =?utf-8?B?SHFGSDU5ZFpsZjZVVm96RCsraGYyZndDOHZjcVhjWlJxVVdrMDBFM0pIU0J5?=
 =?utf-8?B?bFVsVXBoRi95VU1ZYk44cG53UXkvK25zYTNDaEw5ZFFzSWIvRW5ycGRkaXZX?=
 =?utf-8?B?dzVzZCs5YUxHYnVHakM5TXlEOGxTU1htTWxkK013RVIrOE9BdDc2NUpOVVc1?=
 =?utf-8?B?ZGt0RVljSlZlVThQL3lXdFhSU1FBUDBFYnhrM1lMTWpvbC8yZ3BnNEZqalFY?=
 =?utf-8?B?aXRqeTVoKzZVMlU5N1NLdGVyaFdVOFVFeG5oQzczOGRSUEV0OW0yWXB5Z0Np?=
 =?utf-8?B?OVprNms0Y0VPNWF5TzdxRnBZektxWDhGTEhSaVBDMEs5TWZEME82UlRPaHhv?=
 =?utf-8?B?Vy9aSkhuU01YVTlzQ204N3hHYXZNWmlxYXVDcDgycjBWcVg4MGVUaEhzZmtt?=
 =?utf-8?B?WWlXRlAwcjlUNCt2MzdZTVFKRTgrbXZCSXpFYURPOFRDWjVqODlOMDZLWjFu?=
 =?utf-8?B?M05vUjB1YXBBcFFabFVQMTRlQ2k1bEZZTUhYTFlPRWUyQnBhL2RhWVZ1ekxE?=
 =?utf-8?B?Q0NRUHNBWWNtRnVIblJQSHFYRXNFVXZ1N3J4UlFRRzNTTFZMRSsxK084L0d4?=
 =?utf-8?B?YTl1V3FrdzNjUXB6aHVBTkxkN0JwczVPOHlpb3pINFdoZVB3TmlEbG40ZEpl?=
 =?utf-8?B?UjMrYXpBRkxwenZWQkZWaHNiMENORzk2eHd4K3V6bkNLcW1ENUhVU2lhdC9l?=
 =?utf-8?B?VlRGaGI3WkNkL1NnRlU3OUFoeEtIODRlWFZYaE96bVZleCtwMlJjODVseEhx?=
 =?utf-8?B?M3JENENNQkNDZzRMamJ2N2tucC9nRHJ3K3Axd1NlTWJIMzBURkJaZXQ3U1Ba?=
 =?utf-8?B?T2pWeEZTQktSWFdyaVFFVzI0MlZkWFQ5QjQwK0xGVzZWTDU2WUdkZm9YYjdq?=
 =?utf-8?B?aGpkRWFDUHZSY3Y3UlgwVG5tdC95bGRyclk3K2ZpNExualAxWW5PT3h4WU9L?=
 =?utf-8?B?Y3dHUDgwWjBZY2tNaEtLQ1hXMmVCclRHTnNTYXh6N3hlNCtIMWw2UzFsbFNO?=
 =?utf-8?B?MUp5V2lmN0VHTnl2WHJ0TWlQTC84MVVhV3pQU3ZrakMzNWRGb2dEQjlZWGFn?=
 =?utf-8?B?WUtoQk1kV2NtbUxvekMrK3d4K3VVRXJXTDZ4eDZmSVNZOFpBTHRYY0UzVDRx?=
 =?utf-8?Q?nw0I6MUOlqsdU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MC9RNHBIbXAxd1o2ekZhdnNCYjhTUjFHVzgwRXZJQzZoSjhhL1ZaR1M5MFc3?=
 =?utf-8?B?UGVFSkltekxUaThpWi93cmUvdEFhS3YyWUhHNlBmcXZrU3ZYZnFTWmduQXFx?=
 =?utf-8?B?Y3hWa1pHRXUzZjk1WXR1dUEydUZWeDdBNVF3ZW0wR2hScVUrVHQwVnFNNkRS?=
 =?utf-8?B?Snlpc0FxK0FDVHhYaklxK1ZsUHB0MlBXUVJlV2xiSHJBWlZYdWdUcmIzZ2JQ?=
 =?utf-8?B?TCtOM21zOG15NkV0WGZNOUhqM2tERjlYQ0ZCWVhxSlpHbGRHVURHTHhEUUJG?=
 =?utf-8?B?RTczZjFVQTBmT1FIK0VnZDN5bGZUcTVNNXVIVm0zdUxZTnV1Yzl6d1QzNzFy?=
 =?utf-8?B?Q1grZ2FHRTY5VTVKZ2g5RUVsYWVtQWZpVTBiN2QwR0F0bFRXU1owNHZVV296?=
 =?utf-8?B?NGdSN1JacTdMYXY0MVdxUjBvUmY5MmgxRi9HV0prbWpMeE55MCtrVXhrdG54?=
 =?utf-8?B?NUkzZk9UY1lWanc2b1ZOU3JJdCs4LzhpbHAzcndtOXZCR1Fwc2xaZHNTTTFy?=
 =?utf-8?B?QjE3ZFZvVDdUUFhoNElvRm14TFl5eDU4UzM5UFRpc000cTIwMGFWV1QzL0d6?=
 =?utf-8?B?R1hVekhwZVFVS056QWprbDdwSytEdXNZV1JMbUgrZm1yOXNIRXhXbEdnQVll?=
 =?utf-8?B?b3FtUmw1dlhWNHNEWjI1VXp6TGtJN1RhRUVBdjhKNGpuL3Y5NUlleU5mSVRM?=
 =?utf-8?B?Tk1sY3kvN2FlTTIzMFBYVkhnenZHYVV3UDJkWXJBOG4raVpFUWFtd3RseXZS?=
 =?utf-8?B?dkFSQXJZMk1lTVVNQUZ5S0EzejUrTCtvNnpkSGFWSFhIRXU2M2NpY2lGT2Jv?=
 =?utf-8?B?NzdOaGpDdGt3THYxdHVPRGhCMVlUR3JwcmtmVU1lUEdzTXVPMWtFazc0N2RM?=
 =?utf-8?B?SzNvT2dDOW9yZUs4TFZUVG1kdGhlZmVvTm9ILzNtMndvaGJ1cEFyN2d1dXM1?=
 =?utf-8?B?VTdpK0U0VXI4QzlHV1Z4WHRiL2hTU3V1SVlFTkcxR3dueE1Vekd2YXFiVmdQ?=
 =?utf-8?B?M0Jxb3lGMGpTbkVnZDlsdHJUK1h6MFRqZndsT2hnQm1jcGdjYVBGazBnK0RP?=
 =?utf-8?B?QlhqU2h2Uk5JRGdTN2FNNWtleitSWGxYZ3YrYzMydi9ERmZ0Y3dBUmhsZnEx?=
 =?utf-8?B?RWIwaDRZUk45Z2xDbUZ2L29lWk5zUldKV0I2TUJnVGYzc2Z2SkxiZy9IYzRo?=
 =?utf-8?B?QXJSREV6V0JwdTFZZUUvcWJEcitnV3pXalg2VEJhUHVBVzFTYm1ZRjJHWHdC?=
 =?utf-8?B?Y2VLcXQ2ZHE5U3dnK0JJZnpXNEZOZWlVaUZBeERoYkV3bGZtb1IzTU9XY1ZF?=
 =?utf-8?B?TkRPbUJoRlFFWGtKSnFtNThadStHckE2dDlvNG5HNzdmZXA1QWZSdU5HZHVM?=
 =?utf-8?B?cGEvVUJOR3p1cHdtWFRoVXZEUisweThVa0h6cXZFbzlrbjc3OHlNRzU2S2FI?=
 =?utf-8?B?eGdWbzRSMmYxTXNyNVRqMVpsaTlYOEVjNmVJRlNCUFFva09QUzJMZmdZM0hz?=
 =?utf-8?B?aW80RnhrWFcxUkorQU05emJQMVo1Qk9KN3RKc09WV1RXc0Y4MDlhSXZyOHdr?=
 =?utf-8?B?b1ZhUGdFdGRuK1NzalMremdRdUJmeWM3ODg4ZnFVNFlTc3I4VENtWXFuVksr?=
 =?utf-8?B?RjBjQ210ZUd1SWZnbU1MUlErTUF3d3E0cjNWWTZjZ1V1TkVDR0Y1ZjRSenpq?=
 =?utf-8?B?QVV6b2N2WG45d0FnYU1XSVRsNjY5S2JYTXhORUFPNE5aaWFTY00vZXUwcElt?=
 =?utf-8?B?M3dOekdFZ05ZS2hHQlpWMjYrUkZvbWVXWlRhZWc4UzZ3d21yMDVRbUVmRG5q?=
 =?utf-8?B?NFNXMklxV21UblRTQzRObFlTN2c4ZjBCVWRXQ1dFM2FqVmQyM2ZuY2ZxRnhO?=
 =?utf-8?B?S2NiS1hVSlRxSitoQUV6ckdHMWxjd21NbkdiTWdDME9yNmNHdWNtUnlnWHA3?=
 =?utf-8?B?cUk5TVFkelJGS2tGd20zeDRXM1NnMU91Q0d4L281ZEkzUjIzUnBBcEdteUpV?=
 =?utf-8?B?QWxSeE9VQVpTaVZXVWU1VkxRK3lRYkhtTURZbjBEbld2KzRxR0VMT3JCQjdD?=
 =?utf-8?B?blNaOVl0dEpWWU56TGNUVExCaSt4QkFvcEw4SmZndElrYm40NndQNXk4amVC?=
 =?utf-8?B?T3FvMmlNZVdBMmlOUVVqMEpFcjNPZ3NoQ2ozZ3BmYlE5R1VUZXM3SzF2Q0JY?=
 =?utf-8?B?Wmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 151f7c02-7a35-494d-f045-08dd71d0798d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 10:23:56.5609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y2wJ9ShJtyVSZGxnnv4bFeVmaAxXARLsFNHwfRCUkwvdyuu1MxDB9svoNIgKN7L1dApBhD5n6LzMu2dh7mB8lG3BayLMDtyToQZX+X9rVyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF4E874A00C
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

On Wed, Mar 26, 2025 at 04:46:19PM +0200, Ilpo Järvinen wrote:
> On Thu, 20 Mar 2025, Michał Winiarski wrote:
> 
> > There are multiple places where conversions between IOV resources and
> > corresponding VF BAR numbers are done.
> > 
> > Extract the logic to pci_resource_num_from_vf_bar() and
> > pci_resource_num_to_vf_bar() helpers.
> > 
> > Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > Acked-by: Christian König <christian.koenig@amd.com>
> > ---
> >  drivers/pci/iov.c       | 22 ++++++++++++----------
> >  drivers/pci/pci.h       | 19 +++++++++++++++++++
> >  drivers/pci/setup-bus.c |  3 ++-
> >  3 files changed, 33 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
> > index bf95387993cd5..985ea11339c45 100644
> > --- a/drivers/pci/iov.c
> > +++ b/drivers/pci/iov.c
> > @@ -151,7 +151,7 @@ resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno)
> >  	if (!dev->is_physfn)
> >  		return 0;
> >  
> > -	return dev->sriov->barsz[resno - PCI_IOV_RESOURCES];
> > +	return dev->sriov->barsz[pci_resource_num_to_vf_bar(resno)];
> >  }
> >  
> >  static void pci_read_vf_config_common(struct pci_dev *virtfn)
> > @@ -322,12 +322,13 @@ int pci_iov_add_virtfn(struct pci_dev *dev, int id)
> >  	virtfn->multifunction = 0;
> >  
> >  	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
> > -		res = &dev->resource[i + PCI_IOV_RESOURCES];
> > +		res = &dev->resource[pci_resource_num_from_vf_bar(i)];
> >  		if (!res->parent)
> >  			continue;
> >  		virtfn->resource[i].name = pci_name(virtfn);
> >  		virtfn->resource[i].flags = res->flags;
> > -		size = pci_iov_resource_size(dev, i + PCI_IOV_RESOURCES);
> > +		size = pci_iov_resource_size(dev,
> > +					     pci_resource_num_from_vf_bar(i));
> >  		resource_set_range(&virtfn->resource[i],
> >  				   res->start + size * id, size);
> >  		rc = request_resource(res, &virtfn->resource[i]);
> > @@ -624,8 +625,8 @@ static int sriov_enable(struct pci_dev *dev, int nr_virtfn)
> >  
> >  	nres = 0;
> >  	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
> > -		bars |= (1 << (i + PCI_IOV_RESOURCES));
> > -		res = &dev->resource[i + PCI_IOV_RESOURCES];
> > +		bars |= (1 << pci_resource_num_from_vf_bar(i));
> > +		res = &dev->resource[pci_resource_num_from_vf_bar(i)];
> >  		if (res->parent)
> >  			nres++;
> >  	}
> > @@ -791,8 +792,9 @@ static int sriov_init(struct pci_dev *dev, int pos)
> >  
> >  	nres = 0;
> >  	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
> > -		res = &dev->resource[i + PCI_IOV_RESOURCES];
> > -		res_name = pci_resource_name(dev, i + PCI_IOV_RESOURCES);
> > +		res = &dev->resource[pci_resource_num_from_vf_bar(i)];
> > +		res_name = pci_resource_name(dev,
> > +					     pci_resource_num_from_vf_bar(i));
> 
> All these get easier to read if you add (same comment for the cases 
> above):
> 
> 		int idx = pci_resource_num_from_vf_bar(i);

Ok.

> 
> >  
> >  		/*
> >  		 * If it is already FIXED, don't change it, something
> > @@ -851,7 +853,7 @@ static int sriov_init(struct pci_dev *dev, int pos)
> >  	dev->is_physfn = 0;
> >  failed:
> >  	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
> > -		res = &dev->resource[i + PCI_IOV_RESOURCES];
> > +		res = &dev->resource[pci_resource_num_from_vf_bar(i)];
> >  		res->flags = 0;
> >  	}
> >  
> > @@ -913,7 +915,7 @@ static void sriov_restore_state(struct pci_dev *dev)
> >  	pci_write_config_word(dev, iov->pos + PCI_SRIOV_CTRL, ctrl);
> >  
> >  	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++)
> > -		pci_update_resource(dev, i + PCI_IOV_RESOURCES);
> > +		pci_update_resource(dev, pci_resource_num_from_vf_bar(i));
> >  
> >  	pci_write_config_dword(dev, iov->pos + PCI_SRIOV_SYS_PGSIZE, iov->pgsz);
> >  	pci_iov_set_numvfs(dev, iov->num_VFs);
> > @@ -979,7 +981,7 @@ void pci_iov_update_resource(struct pci_dev *dev, int resno)
> >  {
> >  	struct pci_sriov *iov = dev->is_physfn ? dev->sriov : NULL;
> >  	struct resource *res = pci_resource_n(dev, resno);
> > -	int vf_bar = resno - PCI_IOV_RESOURCES;
> > +	int vf_bar = pci_resource_num_to_vf_bar(resno);
> >  	struct pci_bus_region region;
> >  	u16 cmd;
> >  	u32 new;
> > diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> > index adc54bb2c8b34..f44840ee3c327 100644
> > --- a/drivers/pci/pci.h
> > +++ b/drivers/pci/pci.h
> > @@ -693,6 +693,15 @@ static inline bool pci_resource_is_iov(int resno)
> >  {
> >  	return resno >= PCI_IOV_RESOURCES && resno <= PCI_IOV_RESOURCE_END;
> >  }
> > +static inline int pci_resource_num_from_vf_bar(int resno)
> > +{
> > +	return resno + PCI_IOV_RESOURCES;
> > +}
> > +
> > +static inline int pci_resource_num_to_vf_bar(int resno)
> > +{
> > +	return resno - PCI_IOV_RESOURCES;
> > +}
> >  extern const struct attribute_group sriov_pf_dev_attr_group;
> >  extern const struct attribute_group sriov_vf_dev_attr_group;
> >  #else
> > @@ -717,6 +726,16 @@ static inline bool pci_resource_is_iov(int resno)
> >  {
> >  	return false;
> >  }
> > +static inline int pci_resource_num_from_vf_bar(int resno)
> > +{
> > +	WARN_ON_ONCE(1);
> > +	return -ENODEV;
> > +}
> > +static inline int pci_resource_num_to_vf_bar(int resno)
> > +{
> > +	WARN_ON_ONCE(1);
> > +	return -ENODEV;
> > +}
> >  #endif /* CONFIG_PCI_IOV */
> >  
> >  #ifdef CONFIG_PCIE_TPH
> > diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
> > index 54d6f4fa3ce16..55e91ba1e74a2 100644
> > --- a/drivers/pci/setup-bus.c
> > +++ b/drivers/pci/setup-bus.c
> > @@ -1885,7 +1885,8 @@ static int iov_resources_unassigned(struct pci_dev *dev, void *data)
> >  	bool *unassigned = data;
> >  
> >  	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
> > -		struct resource *r = &dev->resource[i + PCI_IOV_RESOURCES];
> > +		struct resource *r =
> > +			&dev->resource[pci_resource_num_from_vf_bar(i)];
> 
> I'd add int idx here as well.

Ok, makes sense, I'll use the similar approach in the following patches
as well.

Thanks,
-Michał

> 
> >  		struct pci_bus_region region;
> >  
> >  		/* Not assigned or rejected by kernel? */
> > 
> 
> -- 
>  i.

