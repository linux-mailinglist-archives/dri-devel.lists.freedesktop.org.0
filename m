Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF26BFB0DB
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 11:05:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB5210E712;
	Wed, 22 Oct 2025 09:05:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NQzSeECi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7DF310E712;
 Wed, 22 Oct 2025 09:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761123919; x=1792659919;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=BzFkDEh3vr4d3QHMh15MQIg1Y5d2pdzUeowBZCfx4/M=;
 b=NQzSeECiAWwChX36bI2wNc4KvcU4zodqpl0MuwpkHI1bxnv/IO5F94vl
 1bi0WVpsE/LIUcSxUs/ut+BqJDi3XuSmC2HXbJl9LmxE8sU7QtkjZ/Eh2
 itD2R69fe1K9/tED1HdrCA7wKH4qUSag7PzpKXk2UzDKLN4VcC4Aoxnzd
 nEdmHPqClhO3a6soh+lNv4WAhh9uJUgDazNATgUa5EGUpheQou/kOkCyh
 kC2PEAT0neKvRAAz6wZWS0/4Ur1kgEdwexzWdoHrEe38ZdxtP5hIVWafS
 ZY3JqnVa1FAH6KtzRoZgtiNsiVsIA2Iqh0NSMNu9Ta1FZx2HuBez5WQrv w==;
X-CSE-ConnectionGUID: 7y7K5A+uQJuNE79E7O3unQ==
X-CSE-MsgGUID: QLTz5VPETqCi6afIsH8sng==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80702736"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="80702736"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 02:05:18 -0700
X-CSE-ConnectionGUID: 1kklAvURRgCT09Hkz+/9Bg==
X-CSE-MsgGUID: qCOc9vK4Tpa0EtSMx38h1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="183709858"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 02:05:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 02:05:18 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 02:05:18 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.36) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 02:05:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GAU9pSfbUIQAMiS9TesVh4w2h1AbEZMx5lFHzz+BZXA5yb1E4URhd2ZrprDaO01RZY4GOMLYiIG2hF/3rjZHAQer5auMDkdQ1XRRM+00ffPLpOOMYFLghUW6XHMyZdmeiV/3FuPaop9/8chZ47mgTvqgbR1yEHyP2YBQcCZAAs1Ikdcy89theWJh6nDKjgtIaz1Ytx7Q+5ZP7KxX4AntGdk0GOyMejaCEERDdsA/vBx8Wgbc2CdV9Vvnk+DQtGcILi1sZC7+7i5nTqjMFEQr6n3fy/NWGvgncTyJMcyclriBCHmHFLoGI3TaYCdDKHhMEJpRnJEhMIN0Anwv9bkqUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vZRHAqWgog1b6G0hponSrNhnjNliloQMyK2EONGJHeM=;
 b=FegOzRjvHoQB0ZCfYlNMwMmlc85mY+27Gr5zZQ5XrKVnqRS5w1JrydO5WgEyaVEcIbhDdIzgWSnOnNCEI+vVmaBV6uC36PGskov43fmp7/vSBNN7wDw7m1prORqenzfsTzwVDHEGkPGMtthlg4iPQ3pPw4acR4PxK6T9WlVvJOEJeCp5WnBe4N27nu1RWGTjg08SyDCWJzCops1As/bBZv/HkX5Jh29sDndA/mvfpt4z4vgbS8CaatuyQGgpnz/Rg2RyoFeDtEc9Ub9NN+e9qgX8I9IVhFlALEZrSBJ3NLf/kCuA1mbHWeVr4NRpwLr3ZwGKmZ/7w2EUCRtIxupFxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM4PR11MB8203.namprd11.prod.outlook.com (2603:10b6:8:187::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.12; Wed, 22 Oct 2025 09:05:16 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 09:05:16 +0000
Date: Wed, 22 Oct 2025 11:05:12 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
CC: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Kevin Tian <kevin.tian@intel.com>,
 "Shameer Kolothum" <shameerali.kolothum.thodi@huawei.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>
Subject: Re: [PATCH 26/26] vfio/xe: Add vendor-specific vfio_pci driver for
 Intel graphics
Message-ID: <rqgewmv4g7xsoxfez6y5g6etl7s6o7vqcqmbbmjftebdtxssvj@2uao5kmhkow2>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-27-michal.winiarski@intel.com>
 <20251021230328.GA21554@ziepe.ca>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251021230328.GA21554@ziepe.ca>
X-ClientProxiedBy: WA2P291CA0028.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::23) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM4PR11MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: 9635434f-e661-453f-bca2-08de114a1dd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0JuQzdFT0w2enBUZk1rNU0yR0xSWFFnZmRIWWVaME4wYnd5QUZodjdFS1pV?=
 =?utf-8?B?SUpCQWxDOW9YUW9OU2kvK3drKzhyWUxzU0hYUWlZc2haQjI2NjVLUU5aS3gw?=
 =?utf-8?B?NW1YcVJveGFuODZYTW5KZzJaZllweHZ2TkhXZUU2VGJQVmxRcTJJMS9VSHpE?=
 =?utf-8?B?T0xpSmhGRForQnJJUkt1cDNWTE1kU016a2lTdyt4WnhFa2MxUEcvU1k1WFBV?=
 =?utf-8?B?QWtKWEVqWUsvZEJnUDcxeUxqRTZaVWNQTGh5dVVlSU5sS3BocDhmeWNJSTgr?=
 =?utf-8?B?dmNkb0Zub3VkbGFXZkZHTldTWmZ2YXc0amp0NUdjc2diQjBjVkFoOWpGck00?=
 =?utf-8?B?emc4WUF2QkN3UlVFNjZrQWptU01hV0FuSnFsZU0zTE03N3NwdmNhbTFHUDll?=
 =?utf-8?B?czF0NVZqMHB5TmFyQXF1MVhVOVRFYmw2WFJxWnN6ZWVMY2FCdFdFL3hWQWht?=
 =?utf-8?B?K0VTeVQzMHFBU0dTUmZxeXdXMFJuZEIzRmQvM2x5eVl2NlcwUk1ha1JtdWo3?=
 =?utf-8?B?UFBScUNVODR6V1FFenhVQ1czdENnZytUL1hGdW5iYmI0ckp3azhRS1RVTE55?=
 =?utf-8?B?OVhucHRyUFBZcDRTWnFEOTUzenF2UEtkUDRxUlA1ZTFWRmw0RW1LZkNJM0lo?=
 =?utf-8?B?ZFZxQjVoQW4rMlRkSy9NT1pSaUNhMDM4TkdrWHZLTVFOM3hENGpyeDAwdDZO?=
 =?utf-8?B?aGFnMHk2YkIzMThFSFFUVnJMV0dORS85clgwSFhkVzg1UG1VaGg2bDFmTUNY?=
 =?utf-8?B?ZGs5NEdqZ1p3WUNZNElwS0hDWEtlQVU3TDh4ZU53eWZVZm9LSU50UGdtcDZ6?=
 =?utf-8?B?RFcvQTRmVUw4YUR6Z0ZrUXBTbzBZOHdCN0poK281TnpUNU1MdStsaFRzakFC?=
 =?utf-8?B?alJ3c0N2dTY2dElVOTNWQ2h4MnpNZG01L3psTW9Vb09FUFBYWFlZcEdPUC9J?=
 =?utf-8?B?MEtBRFdRQlV5SU9naEZXRmE3RXFsNkpObHQrYXZwMHhvK0FQM1JvL2xaMkhF?=
 =?utf-8?B?QUxIa3dKNXc3b3c4NzhLK1hXRkhXcm1PMHdoMGxhSVRyand6dXNIcWw4UTlq?=
 =?utf-8?B?a1pUZ0NBaDRwSlQ5L29vVUxROStIZ0lWYjN3eW5HOUVSZERmODArRUk3cmgw?=
 =?utf-8?B?cVpqRU9WREFGamYrTmJGRnpnUXIwZnZnMEpQWWd2bEgxUXBxSTFtYWI5bjNa?=
 =?utf-8?B?TWozMWJEMmc5UGRTZllYSlRkRUVmbVRKTk9rUjBROTdQTnpXSHNJSWJyMysz?=
 =?utf-8?B?ajVHR2toOEJHT1M0MXlhbGxIVS8yR2pyWWtDckhpNnAzbWc1cmFncUR4MHhS?=
 =?utf-8?B?alB5dWdhbkcrN2pTeFVtL0pMZENRb25qVld6Nis1NDJGdGVzWDVBejgvc0wv?=
 =?utf-8?B?blptaEhZSUJzNEU1UTF1TFpxcnczUUhWWkJJaFlHUktUWitLL1ZZaGlHS29k?=
 =?utf-8?B?dS9lQ0txbUdtNkZvNDFRTTZQaG8rME5aeW80Q1g4a0M2ckRNQ2Z6ZlFDYmo5?=
 =?utf-8?B?SjloRDJCSjFVWGlQSVNqRXhEQXUyMVFabkwyS2VDelluUUFzcER4Zkwvc3VF?=
 =?utf-8?B?WVZvclB2dnRWSjBtQkEyQ1hKSWRnMWpjUHhQYWxIRjBmMHBGdHdoVUF2TlA5?=
 =?utf-8?B?VU81UUp5NTBQK2tsS1MySVFYSWNKRE5oUXFMSThJaWNCNCtZTzN5c1BtRjFC?=
 =?utf-8?B?MjhTMWVYRG9iY3c0L1dKY3RsajBBMFZMaS9LQ3oraWlicHRFSGVrTUtpVG84?=
 =?utf-8?B?VEJreUNBUHR5L3I2WDRRNm1lU1VJNTZuODdkOUVoamhVNk1vL1JsL0J5cDEz?=
 =?utf-8?B?Ni9ZWEVMU095Mm9lNk1xRCtJLzVwL2NiYlpTV2hmbGFsUDJpbWdVdW04bzNs?=
 =?utf-8?B?WDQ4QlJLRllxTlp2dlF6SGxlaENzUFpRZHJmdmRZU2ljcFgzN1VzcFRVS0xC?=
 =?utf-8?Q?u2T+r0taQGMokm/X+y3ipBt9ifMZzuoX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkdqOWwwYUc3VlA0bkgxWXhOY05pVTI0T1dHT2ZrSXV1VHpnMzB4UDdXa1ZS?=
 =?utf-8?B?UGZtUUQ5VGNrdUFVbEhvVUM5MEY3Z1dSSXNXR2puQ3dXZ1RGTzF1WDFpdHQv?=
 =?utf-8?B?NEs2a3FaUDJiYUx4N0cxYWk4ZnE1NXRNOUg2VTY3WUYyWjNJQ3NNa0tTYmFT?=
 =?utf-8?B?OWRkaW1adjN2YXVNak1JalhsU3pSN2VNTXh2M2NyYXl4VkdkekFpdWwzMVJs?=
 =?utf-8?B?dXVhbFF0b2lsemFxWW5WS1Z3aDFVRGlsd21RNFRONjQzTUszVEpNU2I1MFdu?=
 =?utf-8?B?OVM4bjMyc3pQNlgyVWYrVEZLY1Z4SzlFNnhXS0hBL2N3bzNYUGw0b1BqM1NY?=
 =?utf-8?B?ZFcxNURFWnVTRCtiQkpRVEk2UlQ2RE9sVytsYkNsUDFMbDh3SDVnRU5OZGQ2?=
 =?utf-8?B?K3lXdFE4N2MzQlBYUExpMDdHSXlsMWVob1R0ODk4TTFybWZYMCs3dThqNy9r?=
 =?utf-8?B?NmdPdkZ3TnlwR2pQaUtXc1BJd281bmduZ0VQWVgyT0hoM1dENkdRUUhEWXBw?=
 =?utf-8?B?UmY1NFc1Z2U1a25MM2RjaW9JdWJQbEExVkFkM1oxRnZiWkJ3R2trZHRxYThN?=
 =?utf-8?B?U0UyMmxhOHJQWGR3bjlrd1dNbjhyeXhFdVpYd2FtckhYa3M3d09YMVVpSTBa?=
 =?utf-8?B?Ulg3VjZ5RmZZeVk3d0tKdWhVSWtGQWRlcm1La2wyRHhCdWJsd1NvYXFlS1NX?=
 =?utf-8?B?YUF3V21LanBjOERiUGFrWVJjMmV5ZU4rYVVsM1pxM1lXSmRBa283Q2V4ZmJ6?=
 =?utf-8?B?TEZRVG85NjZJVzN6Q2JKUGFKSkp2Yi9lZ1JFV2dLUEkyNWNFMWRTcFRvV2pL?=
 =?utf-8?B?UE80amNsMWc1UkdKMGRwVUp1cGZ5NTVRZVBiQ3JzZlhVME1xVXV3RW1zU1Ry?=
 =?utf-8?B?cG5TM0NVZWsxQUkrSjY3ek5jQURiUFpnQ25BZjR1b0ZNRXk4ZFcyakxCSDNk?=
 =?utf-8?B?WkZEWWlDQnE5SnlOeFpzT2Jpbzd5bm1zcXh2VjFXU1J1bU1Jck9LamRDYlNt?=
 =?utf-8?B?UGJMOHZ6dFBIaDNsaWhrNGJrOGw3NUVDdU03Z1BweittNWloQUJLZWNxdTlQ?=
 =?utf-8?B?QzY0MzVraVV5VkJBb1hCRDlWWFFsbEpqdnNpeEM4YVJTekRGaUlkNWo2bWJ6?=
 =?utf-8?B?UDF1Zzg2MHZ4ZjAzK20vOXZ4OVk1QlR0QzhKRlNFeUFVMEYxWCtrV0d0cUkz?=
 =?utf-8?B?WjRGd1haY1lIcFJnRFhuaXZiMWpsdDN0Lys3bmtZK3BWemwydmtKTzZpM3VH?=
 =?utf-8?B?dE5WbG5NK21BbUFwRk5hbUx0WFFmSDhCajRwVU5wb3RzWGsrbUpYTUxCekdx?=
 =?utf-8?B?L0VpbURPWGhKWHBpUXFoUFVNQnJLTjJrNUFVd3pzK0lxRXcyUzRZamJld2Ix?=
 =?utf-8?B?bGVXdjkrV3VEV2VvUkFqNGh6UHlGdzNxMnRYRmJlZHF6ZzlPVFJORXFiYXVI?=
 =?utf-8?B?KzA1VDgxL29DVVpmVWxKSThaa0VoampwYVVlMWlFMXFrOFB1Zk5zU0VCT3NE?=
 =?utf-8?B?UUhJRnQ3QkcyakliTHNYeVpRRGNadmtrSnZ4NEI1dlJCT1FNenh5VXdKcE9O?=
 =?utf-8?B?YlhoNm03dlhkV0Foem1QN1RIUzBXWEdVMFBDY3NGUWRQWmxoN0JrNTEydVBR?=
 =?utf-8?B?N2ZCRXp6N2JyMEJGVVltK3RFUG9CQ0hCLzRISDBVVEIyUkozZStMeittUnNa?=
 =?utf-8?B?Y1VQbmM4M3o3L3lPelJpRmh0SXFxQTNpQ0pWYUhmalhlTTg0QXo0SXRqU0da?=
 =?utf-8?B?WHI3d3AvempTNGxxaUZqTjlvSGY3a0ZDaUNKdDAzTjBjeVNOSStwM1VwQnlq?=
 =?utf-8?B?LzltM3pHZ2huaGRTOVhNUktXSW9IOUJ3NlVRS2U4TGFOazJMSGZOeFhDcjZ5?=
 =?utf-8?B?eUYxaitMQm44WUdxaENGU3d1UTQrNlBOdkR2ZW4yakVTVm5mQkJsb3dXOGJz?=
 =?utf-8?B?NzlIOU05Qi8xVE5UdFh0cTJvdWFLeG1XSVBOd0RDdGNKeFBmREd3WUhqMUtT?=
 =?utf-8?B?NU9Id3NOT0FjMHhRRzJ5OWxnVCtCWUVDK3VOMnFwZkN1dkZlMDNYRlhKM0tj?=
 =?utf-8?B?bjUxL0NCWkUvMTZBdzFTZE52UTNXM0x2WkRMNEQzYk9KZThvTHBQeDNLM1Ay?=
 =?utf-8?B?NUNCaitlZis1UXhPMmRnRW5Kd0orK0I4bWdnQ0lvQUdkT2xBeExxRVFlS0Vn?=
 =?utf-8?B?UVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9635434f-e661-453f-bca2-08de114a1dd6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 09:05:16.0958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mp+VX8d9D1LnlphGuJ/eDQT+o+KqHCBVZHlJW0Vczj1D7JOdC3MgIKcJ6XWGnuZGpx7CpW8upzraUkblI3wnna+QHFONN9bRSmHHzeT62VA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8203
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

On Tue, Oct 21, 2025 at 08:03:28PM -0300, Jason Gunthorpe wrote:
> On Sat, Oct 11, 2025 at 09:38:47PM +0200, Michał Winiarski wrote:
> > +	/*
> > +	 * "STOP" handling is reused for "RUNNING_P2P", as the device doesn't have the capability to
> > +	 * selectively block p2p DMA transfers.
> > +	 * The device is not processing new workload requests when the VF is stopped, and both
> > +	 * memory and MMIO communication channels are transferred to destination (where processing
> > +	 * will be resumed).
> > +	 */
> > +	if ((cur == VFIO_DEVICE_STATE_RUNNING && new == VFIO_DEVICE_STATE_STOP) ||
> > +	    (cur == VFIO_DEVICE_STATE_RUNNING && new == VFIO_DEVICE_STATE_RUNNING_P2P)) {
> > +		ret = xe_sriov_vfio_stop(xe_vdev->pf, xe_vdev->vfid);
> 
> This comment is not right, RUNNING_P2P means the device can still
> receive P2P activity on it's BAR. Eg a GPU will still allow read/write
> to its framebuffer.
> 
> But it is not initiating any new transactions.

/*
 * "STOP" handling is reused for "RUNNING_P2P", as the device doesn't
 * have the capability to selectively block outgoing p2p DMA transfers.
 * While the device is allowing BAR accesses when the VF is stopped, it
 * is not processing any new workload requests, effectively stopping
 * any outgoing DMA transfers (not just p2p).
 * Both memory and MMIO communication channels with the workload
 * scheduling firmware are transferred to destination (where processing
 * will be resumed).
 */

Does this work better?

> 
> > +static void xe_vfio_pci_migration_init(struct vfio_device *core_vdev)
> > +{
> > +	struct xe_vfio_pci_core_device *xe_vdev =
> > +		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
> > +	struct pci_dev *pdev = to_pci_dev(core_vdev->dev);
> > +
> > +	if (!xe_sriov_vfio_migration_supported(pdev->physfn))
> > +		return;
> > +
> > +	/* vfid starts from 1 for xe */
> > +	xe_vdev->vfid = pci_iov_vf_id(pdev) + 1;
> > +	xe_vdev->pf = pdev->physfn;
> 
> No, this has to use pci_iov_get_pf_drvdata, and this driver should
> never have a naked pf pointer flowing around.
> 
> The entire exported interface is wrongly formed:
> 
> +bool xe_sriov_vfio_migration_supported(struct pci_dev *pdev);
> +int xe_sriov_vfio_wait_flr_done(struct pci_dev *pdev, unsigned int vfid);
> +int xe_sriov_vfio_stop(struct pci_dev *pdev, unsigned int vfid);
> +int xe_sriov_vfio_run(struct pci_dev *pdev, unsigned int vfid);
> +int xe_sriov_vfio_stop_copy_enter(struct pci_dev *pdev, unsigned int vfid);
> 
> None of these should be taking in a naked pci_dev, it should all work
> on whatever type the drvdata is.

I'll change it to:

struct xe_device *xe_sriov_vfio_get_xe_device(struct pci_dev *pdev);
bool xe_sriov_vfio_migration_supported(struct xe_device *xe);
int xe_sriov_vfio_wait_flr_done(struct xe_device *xe, unsigned int vfid);
int xe_sriov_vfio_stop(struct xe_device *xe, unsigned int vfid);
int xe_sriov_vfio_run(struct xe_device *xe, unsigned int vfid);
int xe_sriov_vfio_stop_copy_enter(struct xe_device *xe, unsigned int vfid);
(...)

> 
> And this gross thing needs to go away too:
> 
> > +       if (pdev->is_virtfn && strcmp(pdev->physfn->dev.driver->name, "xe") == 0)
> > +               xe_vfio_pci_migration_init(core_vdev);

Right. With using pci_iov_get_pf_drvdata() it just goes away
automatically.

Thanks,
-Michał

> 
> Jason
