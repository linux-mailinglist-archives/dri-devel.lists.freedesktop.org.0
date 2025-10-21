Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A118BF92F8
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 01:14:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20A5810E0DE;
	Tue, 21 Oct 2025 23:14:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fgkRZBeh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B3AB10E058;
 Tue, 21 Oct 2025 23:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761088478; x=1792624478;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=p7t2sSSESIPPuf15wmG9DSEsA/KnR/uk1j7JrnqXq0A=;
 b=fgkRZBehcmzyy81u+CCcZGUnD1Y9f2egK4lCrSYrNxppBs5RtNNqAcrb
 IAyVgIku3sUlV61nTW+bAwc2VE+gTSTTLTm9mg0r2eZoOlddlXRxWc5WO
 O4AklWU2b7C/zzqec31S9snEM5o7hIaJumrrA7FKqqB8GeqnN61xI4XW5
 0E+r5J57b0TGDhFKoUVJUXxkRJyvirEudilCmjXerjc4EuCiZ9BDh1P63
 0aNMiQMdn4Z5hhlItcorvfah7CoPi8dM8WBf0kVtozjVzRb3Gk994yj/d
 pbAL3g5uUJUsfmi4g0/3YacnAOtO9rLM1hnJVL32KbUBKHfSdpyclIw98 Q==;
X-CSE-ConnectionGUID: SDX3+aRcQZuFhP6AgyKLzQ==
X-CSE-MsgGUID: dO8vEqDAQBSdAE3QoguUsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67090883"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="67090883"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 16:14:38 -0700
X-CSE-ConnectionGUID: u0Znijv/Qo2nVTuJj5OaKw==
X-CSE-MsgGUID: 0hQ3XyGnTGe9Oh8jE52i+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="214660729"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 16:14:38 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 16:14:37 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 16:14:37 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.25) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 16:14:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jQM4Ys8BfvvM1HwZ7B3Vz6vmFHQLOpV4eSz9TI5mZo2BYQm9IBrp6v6vOGUrPxBf4uaZZoOR7lQOK3tR+vB9h55un0DA9eF+66Xj7a546DfQJb8rxgPJU//RlaIqn7evqVn+nmamF5Y3DGaSi1wy1rYzIOk/lZ+a+WvhCQcyUT73/KR+waZaK67vZHccrwFh/Bu/6ZBN6d9c4HOadCNRVNkEgYnCEZBxDhJPKpFL0KG9vkL0vja3x96i49klmvHfH6x0wAMf4yXzTaHRy2q09rb/NX4SqAMqdx8Vwo+dxHe5TdSyhHHVdx9BW6Fa8/ZRn93c2d6onktTfOhL8k0ZzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gwal6d4rmDLJm1AmSMP1kqwfQrAv0+cVF5rxHwbkVAY=;
 b=KRbAlMIhlSCtBpUQO/uLxAPLzBlXMlNBdO+bFbNBOWuEoeUGIYl2ADQnJgaXQfcT4aXAxgUAx1k3E1H0iGc2v36Iwz7OIB8aJ6nHRJ5a/v5jg7UD2v14mCmpY17hf6zgVDDmUv+YEzw1GP5mYH/LIQkcKaoBbPPo4YPE7nb1ndmPItiezAILKv7ariD+akHHSu6qjjtwLpt0rmFlZUQ6PW2y4GpWc+TJdoTX/8vxKMUFY10LdMvLlrnCdQ0WYF3zUKV257R/SqNTyIo/Yc7DluE1FWED/LB3gDJuduOF9tCcU2PLgkGzmE/L/Y/oeqOHCJ2uNx2GWymHFx3A8eDAiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4931.namprd11.prod.outlook.com (2603:10b6:303:9d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Tue, 21 Oct
 2025 23:14:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.015; Tue, 21 Oct 2025
 23:14:33 +0000
Date: Tue, 21 Oct 2025 16:14:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
CC: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Kevin Tian <kevin.tian@intel.com>,
 "Shameer Kolothum" <shameerali.kolothum.thodi@huawei.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH 26/26] vfio/xe: Add vendor-specific vfio_pci driver for
 Intel graphics
Message-ID: <aPgT1u1YO3C3YozC@lstrano-desk.jf.intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-27-michal.winiarski@intel.com>
 <20251021230328.GA21554@ziepe.ca>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251021230328.GA21554@ziepe.ca>
X-ClientProxiedBy: MW4PR03CA0268.namprd03.prod.outlook.com
 (2603:10b6:303:b4::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4931:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d85c455-6755-41de-4c04-08de10f7986b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NWJ5bkR2N1ppa2F6dlE1ZXdIaUg1QUxwS0NHZlVtU2pIVkxUZjJRa0RCUmZU?=
 =?utf-8?B?NXJuSHNKZkdOK1Vhd2VyTzRoNkJVd2Y1WU9hSmsvS1BKTE8yeTUyM2hnLy9w?=
 =?utf-8?B?aFV0eElLaElHUmN5VCtnR093QnRSWFR3eXRlSTRwU1FTc2hmaEVzSWNEY3Q5?=
 =?utf-8?B?ZWdqdnhLTEg3UGdFUDdONDFFc3l4UWFXcmJrL3Y0VzVMWm1teVl4ZVJTOTJB?=
 =?utf-8?B?dmhRSWtMVVpDSFM4M1lDUGxRbDF1K0l1MXBEQnZGNkZUYzB5c3IyQVptZjlv?=
 =?utf-8?B?QkFyT3Q2bXFWcU1xK3BINHlnazllWXRQbEdVWU14RS9USE94WUowZ2xZN1d2?=
 =?utf-8?B?RElld3hkNzJaT3A3ZzhlRERFSjh6cGFYN0V0aEpNcEg2ZzllWWNZUHJ4cCtu?=
 =?utf-8?B?Tmo5QW9VTjUwZTR2NEEyV1VMWG9aRjB5S1BMOW9vbXhyR1dGMms3MjZvS216?=
 =?utf-8?B?eHQxUGJoQ1NQeHptc1VYVEtNZ2lvWXdyL0dIbDRqT1hYNTFRdVJXNS9rWW1N?=
 =?utf-8?B?QXZIMktqTXJ2a09kaWlpUmlLVWlNaEdYTkQxdXpJR2ViWXlRNVRhWTR4SVdK?=
 =?utf-8?B?UkJMSlR2YmdaK3dSOEFLYWlQWjhhY3lIbjNYZjJzUjRwdDdLdmsvRWtsNy8z?=
 =?utf-8?B?MExZOTZyd0V3dW52c1NRQ0dkNW9rZ0NHQ2dvZWpLdytXMTZJZ245SWFJUHFI?=
 =?utf-8?B?eUFQVFc0TU9oYTQ2WXZUcGhHSEZiR01oS2hKQjh2NFhIdXhYY05aazkyMDBx?=
 =?utf-8?B?YjdmR2VjMjRxQ2NMb2xEMjVFSFI4N2txcTRWc1dQVU52ODR0c2hBazh0dXFt?=
 =?utf-8?B?UStmeUlXZVhRdEk4TjZkeVpHMm42enFRbG1kRzdwSWxMS3czWVlXdElVc0ND?=
 =?utf-8?B?bVBmVUNaUEwzNVlaWWJDMDFsYTFFOU01Um1BbE5JSEJNMWFnek9kTnYvc3Jq?=
 =?utf-8?B?Z2pYL0ZYVHFGQUg2V0JoaERxSEhoUzU2R1BOTGpFeEcrbDVzWk15S0t3OUNT?=
 =?utf-8?B?RlZjbEJZK3VTUTFHc1hKY0xoUHFqTUNvVDhKT2lGeUVwVTZiS0xFU05WRVQ1?=
 =?utf-8?B?WXpGN3ZQSjBRZE9DcG44ZC9BT3l1RzE3dE5OTStFVkRYV3RxY09SU2IzWEdW?=
 =?utf-8?B?bU5XeWo4SGRScW5FNVUzWnZBK3d4NkU0NHZhU1gxKzZnaTZFRnM5QTEyZFN5?=
 =?utf-8?B?eVc2VjFLV1h2ODl3NGtuZVhGQ1B1dFNiZDhFOUdyTHlVQXJSM0pQdGk1WVRT?=
 =?utf-8?B?ZGJuWmgxWDlrZnlTNUwwbVI3ZnFIODIwMzAyVVhKbE1mRmJLK1d3ZlNpUGd6?=
 =?utf-8?B?aG9lSEM4SE9nWlRqWWFFNXREU2hzQ2tqT2FDaTJ2QWErOU1jaHpyN21NUENk?=
 =?utf-8?B?WEo3eEZHb0xMWmg1REd3aGZnZUR3dFBuNDFaN3JtelBaU2xjMmE5cGRZN0Vj?=
 =?utf-8?B?WHE4L3N5U25JcXlxQkZpRE1BRnBsYWgxc1h5ZHBNSWd4YkxvWVFyZFlNRDQ4?=
 =?utf-8?B?OEE2UTJzL3dQYjQ4YUtqcUNQcEFpN0hIVEVjY2lUQzhCVXUzQlk0S21xdXdH?=
 =?utf-8?B?eFlzS1h0MGI1bkc0MnhKaSt1c2lvWnRrUjlkREVCVzFlR0dsZVpJRkRlK3lq?=
 =?utf-8?B?dXRhUmZNNzlSTllaVXRVbnlWY0VncUplbi9KMkNHSHZPTXdid0RxYW1TRURv?=
 =?utf-8?B?OVJhY1NZRThNM0o1T1VEbG1qWk01cTVpUTUrQXhTeVhiS1RFaDJYdGlacFRZ?=
 =?utf-8?B?cmNwNEQ1UGMxYTUrbmRpUFpKZHdBbmZMcnlmRHZDSTdGbzZpekRWZjZKcXhj?=
 =?utf-8?B?dnhpRXZLcXRxdElKVFN2MkoyRkxNWlFwWDlYL3dWelRxaGFGSTh2L2pYeEhC?=
 =?utf-8?B?ekZvcWtDcy91a3NGOUoyTElLT01nTnVNcnE5cmdPVFJLMjdzcHNPbTZlUHln?=
 =?utf-8?Q?POdf0BIHvocyg4LB0vWpldz8TMwpX6N5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0tTNVpJSWZtVTZyYjQzNmNldXplNy92RjlZYWpUUkdvOXlXVEM0ZUdpQWZN?=
 =?utf-8?B?cGg4NzBENFVSY0xyanFQdFBRQWpnZXpPazB2NldubUtqYzRYaTR1bklPOGJT?=
 =?utf-8?B?ZTdSRXIveHJxMXhpbHBxMk9QZzgrL0lmZEp1UTE5TFJzbGIvZGVmV2hVOFlp?=
 =?utf-8?B?SnRFb0o0QzU5b1loNVZIRVUwWUxkMkRxN25acWZyWVA0WlVGbURsL3RBZklO?=
 =?utf-8?B?VUFsc3hwWU1mZkhmVVFqUE83VW1naHZqUVNiMjZsdmNNNUhuSjhzaGUrTHA0?=
 =?utf-8?B?VzlseW1hL29XbkI1aitoTkNZVnRHYkxKcnJGV3Y0dWdhd0RZRCtyMHMrN2dP?=
 =?utf-8?B?Uk55b0VUVUtRZzljbGFRUDZXNXc1VW1BNFQ0RDlucS90OUhyTnZXWVJNb1dN?=
 =?utf-8?B?M1BGVnROckpGMVh3M09RaFJCRUJ0R1FTeVluVmsvekFJV0dHdjZNN3pzZTB4?=
 =?utf-8?B?cE9JWmlGTUNxK2l1S1N5SHhSVXQ2SnhyWlNnb0pNT2lRT1JteklwNElaK0lI?=
 =?utf-8?B?eDhzYjhEYjk0TkFqVTNqOUtxdzBGdFF2YzFJYlFjYUJCamF6OTZVQkxTYTYr?=
 =?utf-8?B?WGRieGhKbS9mc0g3a1dvQUM3UDVINytZRk1oOFJ4SEZaNGFoSndnVXZhNmx2?=
 =?utf-8?B?bVR2NFdHUnlIaFFmWFp5Ti84ZUxCSzRNelcrKzQ4cjFBemVKZUpvSEdVdFlH?=
 =?utf-8?B?UE9jbGlkWDlmZTFRblJ6RytIYVl3dXM5NmhlZUMxU0NoYkloTENWZVpXaUl3?=
 =?utf-8?B?N0FYK3gzREJneDlhKzVpaDl0T2tVN1I4Tzh6YWtzSDliQUY1TC9aMUFSbjRw?=
 =?utf-8?B?Rm92cUFhTUZva3BhNnZCY2lzWkQ5NGpWNlREN3NDT0FIRHdwRER3SEw5LytT?=
 =?utf-8?B?R0xydWc2d2Iva3gzZENNNVNYU0hzMCtHUXZqK2syUmJXNUJ3ODFZell3VHBk?=
 =?utf-8?B?MkRmRDlrZy9uS2kzM1VmN2MxVm1BY1VaUlFUS245YkY5dEwzejBSaWNvU1N5?=
 =?utf-8?B?UXFDSlFZNWkyRjN0L1VRYld1ZDNnK3BHLzlYb3FPU21YajcvNUlzZURFSXhB?=
 =?utf-8?B?akVGa2N1ZEZ4cG1wRG1YaUppUnk0dy9BWTZ3RGlaUHpzcFI4OEI2WjN4U0Rk?=
 =?utf-8?B?VG1SZHhDMk51Mks4WWE5OHJ3L0cvWEdHamN2NVJpKy9aeWFvVjlkWEp6UkRl?=
 =?utf-8?B?dXcwa1ljL05kN0grK0JGcGw0QW1ST1VWclIwaVFvRXFFbk92RGJZVmhpOSsy?=
 =?utf-8?B?STZmWW8vOGhjdkxIYWNFUmFpZHlFS3pRb3lHZmxsVWM0SHZYQ1pZMHRubkdl?=
 =?utf-8?B?R2ZOQVJxOUVLeGJKUWxOcUx5UVc4dC9QMTRXTVhqY25WK1VwWlhFeERoVFVn?=
 =?utf-8?B?eldUYlo1aDR4ano1dnpKYzFNZkRoUEUvWndFZSt1b2dBaWxyeTQ1TkRsQUtw?=
 =?utf-8?B?VTNWbUdjbkF1SWdpSyttdVBBVU9kS2svb2hmWW1jQ1FYUzdTWjlqdkZlWkhw?=
 =?utf-8?B?bEMxbmRudmtUbXpia203dkpESmVibC8zUjNNRmRLVFVpMU9IUFFWTVU3OEVG?=
 =?utf-8?B?QUwyZjYyVVJwNmxwYmUzYmFUVHZET3JTd25NSkJlRkxqeDRMYUR0RGZUREtl?=
 =?utf-8?B?TUI1TnE2Q2M0OGxVR25tamtLWXNOY1ZyUmk5Y1RWcU9paGVrREdrS1c1MTRW?=
 =?utf-8?B?cVBvY3QyUHJwWnpDOTlabGxoenlhZGtRTXpETHNSMHlBR1VPZWRWQllleFhy?=
 =?utf-8?B?SFBubXZ5RWQ4MHVqN3p4a3BxRVA2T0F0Z1JGKzVaUUQxd3g0VVRrSklSNy90?=
 =?utf-8?B?bXJ4TkNGdWVNU0RMZDNIRTdyb0FSQUxURkZyYVRTaEIxWnZHbWJtOWlYSEFv?=
 =?utf-8?B?OWE1bVpWdmxIY2tjaEx4K1UrWkJNZGxiL0dhdmVBbFlETlROVjA2eXZSQVFZ?=
 =?utf-8?B?eWhDZUN3amt0UHNYL2lKSjk4V1ZlWjZyRlNadmNTSEFWeW16TUU2THVaQVV4?=
 =?utf-8?B?YUlUbldrbnNhMHlEZlZnQXBGQ3ppZy8ydVoxSHJxeEJoTEs4WFFjMjdIdHhF?=
 =?utf-8?B?RmlMRkI1MXNsMS92c1NCRUNSeWVQcTk4WGVQL3dpL0RzbWI0RlZLZlA2d1Bk?=
 =?utf-8?B?STVWSWxIQXVmUlFHT2N1b1pwM3RPUjlEeDJGbVhKNWJoR1NodTExTVJYNDlD?=
 =?utf-8?B?QlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d85c455-6755-41de-4c04-08de10f7986b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 23:14:33.4900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BcD5+1x67MhmensEA2Rk/WOC3+/+gp0Lemq62LHrpFKeQ1Eypp164sXPfXYReZ2RtcSWokTPusv5Kv0U/LTkzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4931
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

This seems entirely backwards. Why would the Xe module export its driver
structure to the VFIO module? That opens up potential vectors for
abuse—for example, the VFIO module accessing internal Xe device
structures. In my opinion, it's much cleaner to keep interfaces between
modules as opaque / generic as possible.

Matt 

> 
> And this gross thing needs to go away too:
> 
> > +       if (pdev->is_virtfn && strcmp(pdev->physfn->dev.driver->name, "xe") == 0)
> > +               xe_vfio_pci_migration_init(core_vdev);
> 
> Jason
