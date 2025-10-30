Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D56E6C2242C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 21:33:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1793010EA50;
	Thu, 30 Oct 2025 20:33:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YiDgZ/Id";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A64210EA4B;
 Thu, 30 Oct 2025 20:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761856382; x=1793392382;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=qE8Wxlbd4CYMSZq6n/GMcZapok2uaqyA74ey8wc6c/c=;
 b=YiDgZ/IdxOAru5Zv7OPa+0ZkiniF00i7CTTRUgsTC5dI7eLh7uxHS3iz
 cuECSNrTl6eSKtsF5XMd8stsYuCCruLBDFJibXDlwdPbSrbsXzShkstXR
 wZ2t2MuxhMX3oVIlsXP+O5Tq4YWeO5gmxP9EhF3a3eoeftnM2tv8TERfJ
 bmv2fJqHwjEw9lCJzSiQccJbXrz/kQhQulyzWO8sMJZnDncB1FOqoDG8V
 F8i9hLvHhkyDifsXYWGyrqeJ3hLxa3BGhiz5cBY4lbTf3wnWtAKqBnhcK
 6lm7oihX4ubtOBq7p17UrrhYlQdYTpTgr/8yEmD2SJOI2/R9WlPtH1hXl g==;
X-CSE-ConnectionGUID: zIOchA/XRWeTcsRghMbv1w==
X-CSE-MsgGUID: 0diYiEVFRXumy820mBM9QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="74611383"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="74611383"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:33:02 -0700
X-CSE-ConnectionGUID: GaDLfTOqR7eE+onWTY5uIw==
X-CSE-MsgGUID: ry55jCAsQ8mJ/C1Wcbnz+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185262601"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:32:55 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:32:48 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 13:32:48 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.27) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:32:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QIIRBwGqaQcnhJYpWXcQu9y9DEk5qt2YkehaDpPJ+vg2aSgZKTX2WW7KqZxCP2VQUTCz/Kkm4jCRKGuq1+tHfQwjgco2EdscNz11N5WXxfDh9yQKS2nR8s3S5wy8IG8t23OsWpAzUtuhiYsOoiTG0du3hZJozquE8cboaJ0m6nuzB5PrMGuSr5IqcVW2CLanwATC/O2iCvZvWHO0QEqLX02YcNtqmzKfmzylw2D3g1DGGBzBqQcyEsYjI8Cab9IqSaPOF8kQYAa/Ac7CG3YmJDcFrsyVSyjILGeQW781rA/eYsZpVZ1qs3e46vuUo8/azoZ0PV1kTcvKk84cqq7YYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DCyaJYpCFmczJ+mXdQLvbKz9mtUbHv3Dv2HhEp/mGxY=;
 b=CAmMpmpgwDTz6abz5NEA2ElCICFpOPDTmIKB1MzRpmDDFr/aQk2GID1vngbcFnUt98nup0jgMCfpCtnFBaetga3sqRDH2wYeGnrUCt8oq+MT23CgrPSXE0oshDkZ+kvrVIpUzbelC6fCoMUTEw97qZDysjX75xwntuMzEGj4UqzY+GyKMjK9lfLs+WHyFj2vzNv02CtaqYs6f2jqFegOHMq1jSguj/Ln9nRFWGjPK3dmXc4jthpYv/5RoHc8WpYHHTZ0A7EXy3f8maLeNilSW7hiJczKTHCRjjkQVDLnwauItCG30HpaZ/zX26Z6taroe4iQBHZmZEMnlDMjnjLdHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MW4PR11MB6960.namprd11.prod.outlook.com (2603:10b6:303:226::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Thu, 30 Oct
 2025 20:32:44 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 20:32:44 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v3 09/28] drm/xe/pf: Expose VF migration data size over debugfs
Date: Thu, 30 Oct 2025 21:31:16 +0100
Message-ID: <20251030203135.337696-10-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251030203135.337696-1-michal.winiarski@intel.com>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P195CA0053.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::42) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MW4PR11MB6960:EE_
X-MS-Office365-Filtering-Correlation-Id: fc788d4a-8e83-475c-54d2-08de17f37b24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|1800799024|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkdubDFlcUkwUG9OYWczczYyTVltSFFWa0lCNWZETGdGU1dxTUZsYldhZVE0?=
 =?utf-8?B?ZGs4MEhMVUc1VnJJL2pJU0Q0ZTZ3TGRFM3FlL0I3amlpbnJwaDBnTXlvM0tR?=
 =?utf-8?B?Tzc1NWdDNXI5aUwzanhhOGtscmFudHVNNVhJdG5PVzc5Mjk4eUJuakVtVWdK?=
 =?utf-8?B?dEhXTUVCYXJURXBld2pydVFJeUh5VGY5eGZON0ZWNk14ZzlidEkyREZUd3hT?=
 =?utf-8?B?cVpEY2E5S1Jzcy9pbmZFSTFYSG0wbXY0RENZSWNvb05lbElpR0RPeXpGVE50?=
 =?utf-8?B?TzBmdUlHS2NYZG5jOUFCNGNXUTFGWVp2ZVBhTnpaQ1dXNlZXWGtEc1NZYk1V?=
 =?utf-8?B?eDhQQTF0dmd0ZFpjd2NlZTF0NDkzYkNwQUpHcCtRd3VSNHVHNjFlSndkMHAy?=
 =?utf-8?B?a0FSdWMxcTRtNHk5OTNGT0pvTXpqQlh3ZlpIMnQyTTg0c0QzRElUNy92Z21w?=
 =?utf-8?B?WjQ2emFEcUNnZkM1ZEg2eDkxMzg4aGZiZzY1djluUkJ6M09wMi9mSjRyVndz?=
 =?utf-8?B?SldKdHV6dXFJYUpGRVZUdCtoM2dWVFd3VXRCWjQzK3JFUVFRSUxsLzVSczRX?=
 =?utf-8?B?TWRpWGZpeFZoSmpXOGNBMHZwZTI5WVM1aEFLT3JWUDFaK0tFMWFURS8veU95?=
 =?utf-8?B?SzJVenYreWtKRXcySDZRdUU3OG5EQVQ0NEh6TisyTmppUkF1Tjlid2VENU4z?=
 =?utf-8?B?b0ZDQkJhWEVNYk9xSUxsa0hwWTZZQ2dlbWZRQTRkQjhFUURXR2t4aGhSNUw3?=
 =?utf-8?B?c0FqMXI5bWRSWmtnMzR0bEc2MWdlUi9vTkJQUjk4OUhhVUh2eWRUcGZXTzRL?=
 =?utf-8?B?Tm9BdEFoTlBFaU5YUHVhTFlkMnoreEd4Z1BpMEsvU0JpODB0cTcyMVhUMGFr?=
 =?utf-8?B?OTVCYkdTS1JSK0hhWDB6UnpFejRiZjdlajJyNHBrZHhHM2pOdmZBUXZWMEZQ?=
 =?utf-8?B?dXBQdkxPTjdhVnY3VWdDY3p6TTU3RlhiQ1pmVmFjY0R4RjZ5cXVOaWRoR1pp?=
 =?utf-8?B?dHJsUGswZzBGR0RMNExBMENTWk5lSGNieHgweGdnTkhsMEtQUkQ3bm11T0xX?=
 =?utf-8?B?aFlPZGVnMURac3ptWmNPbFNrMlZmeE5sRmJucU95dDdybFVKNEYrbjBkTWZQ?=
 =?utf-8?B?eVBjK0NlT1VvSDduVHZabGdRZi9icTZrakpJY3I0SWY3UWJZQ2p0VHdscENP?=
 =?utf-8?B?YmNIT25laW50TVVRcEFEb1FRYWJaYVRhRUZUdHlveEdGRDBsRlNGVFhYL1R6?=
 =?utf-8?B?YlN3ZStzMEtRRGZjRjVwOEdydHg3bEx5LzVvdnRub3JuZUdUdGNIU1Y5Z0pX?=
 =?utf-8?B?aEY0TXJ6blh5ZlZsbnhFdXlhNjZjQWljSjRsazJibEhDUG1ZT1lHQ1QxWFlT?=
 =?utf-8?B?Qk80VGFwTVl3WVRoUWJ2TDFLcFZSTTZNZnF5TVZPZnk3V0xqbjVSbmU1Wjgw?=
 =?utf-8?B?SzNjRkE1UngrbzEzWkxKUkpFWHlLdUM2SGVUK0JpVkZtQ05jWEdySzJubDZQ?=
 =?utf-8?B?QWVEemJPNnlHbUZ3TFhXZklPakFGb29NMm9JRzl2RlpBOUpoNG8rRlhBU3Z2?=
 =?utf-8?B?aWJwK0NaWXFyVkdpSWN6WG5TK3UrOEkxT1NrWUFBZkdHaHNJRjg4T2FUV2dO?=
 =?utf-8?B?K2lhb1owd29QTW9EVmV2RU16Wi8yWEpuQS9mSUc2MlpkdlNabUhTb2VpUXNN?=
 =?utf-8?B?L2x3R0ljbzlvMUI3eCt0TmoxUGh5ellmWURsNGt2T21ZSEVNekI4blV2ak00?=
 =?utf-8?B?S1Z4ZGdvK3UvRGdmNmRUcHczQUpaUTVybzMvZTVjQ1JTa1VBRjRNelFzTEZV?=
 =?utf-8?B?eTRBMlZXc1Znb3BBRzJrRW1Ya1dGc3RlbzNxcnp1U1k1T0plMUIrM3hVYXhv?=
 =?utf-8?B?YWx0Q3kyMHhSNml2bmlOYStsUm1pUmhYZ1k5RkhBNnVUeDFxOHdTWDdyZW5E?=
 =?utf-8?B?QnRSVHVLemI3K3psWXlYeThrK3RoZXVBSGRveVNKNGZjNEZMWDJ5RjRQNTY2?=
 =?utf-8?Q?9OvHEVNHM0ass/6Tak89PxwPyW1w6k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHRST1kwZ21OZnA5c2wxVU5EVnQ4R2kzbWYrL09hMjh5T3NzU0V2MTZRNWNB?=
 =?utf-8?B?UXVYcFFMcU9hTWZ2T1JFZ0lzcjdLdDgrUllXLzhYZUlGdkl0bjRyVTQ2LzYx?=
 =?utf-8?B?aUdueThCSFluNDlCeS9WU0J6TmNLT3RxaExFSnN0c2w2N2xQd2pBWWVtUTRK?=
 =?utf-8?B?UW1sMGlJN1hFdTBuZ2FhYkJzVEtwSU96dWNEMkFEeW9HckpyelNGYXluY3Z5?=
 =?utf-8?B?ckNsdFRMNjZTM0JUdnF5VW42WjhtS01XRE4vb3NGYkhOZWVFTkV6RnF4d3FR?=
 =?utf-8?B?Qy93blVyRzVMZmVydkdqQmNoQWpSZHhKRGpsaFUzODhwbmtTdXU0cEZxS2I5?=
 =?utf-8?B?cWhDVnU5b0dhQlBHcTdpajkvMFhSbms2dStRTnpYckRRWnhrNDJwd1lsaENP?=
 =?utf-8?B?ckhoL0xMYjJFR3RHbDNWMjFBZDcyQm9Gc0RkbExuU0hOVlN0REkwbmpiZDdV?=
 =?utf-8?B?RU84cHFvbWlMY05ZR0ZlR3FGS2tNNlpUUkY5TXd3dnpZNnNOWEhMa1ZKK0Nl?=
 =?utf-8?B?dVNyWGQxMGRuaWRmN2NyK0JzTFNucWtoajV4NGRpWG9tdndWQ1lDVTRRd2Vs?=
 =?utf-8?B?cjRXT0c4TTVRc2Vnd0ZhT3JOcnorQll2MzFqNzU3ZkVjalYvS0llTm5TMXc0?=
 =?utf-8?B?VXlpTzdsbUF3UXArS3lWczRxL05MNUtOZkkrT2tKWjdYSlJxN2JvZklyQ3FM?=
 =?utf-8?B?NnUxOTJlRThiUjNiQmJua0lWcU5SMkZrVHpCMWF2Nlc5Z0JDQitEZTF2UktN?=
 =?utf-8?B?U3c3T2RZVlVLUDBDK2R1d3M2WDVtWkFaMmZVMlpLS1UzdnZDTlQyZXF6eGpZ?=
 =?utf-8?B?VFI1NGFMQzl5WmxVb3JIdktydjNTaHFKbUFFYkZHZ0V5TEpneURRNVZaV0g4?=
 =?utf-8?B?djdWTjhtalhWYWRpdWZGMThxN1pUUnJyQzBMckF0WXpYcTFPeVR2Nlo4dWpp?=
 =?utf-8?B?aUwxYnp0Q2FMZHJCKzJSb01Ga2NtcExZeGpvMkZiZ1lIRDFVY0J2MmwvM3dH?=
 =?utf-8?B?dXJPM2J5UTVRa3htam4xTUFXbmxlWDVJRW1FUmxiSGlUcTAxQTFRNVBqZDNB?=
 =?utf-8?B?MGVvQnd3K25kM3pmVGpZaFZKSmx2Sm8rVkxXUHMrdVpramlCL3V3bHZZaHBr?=
 =?utf-8?B?bVprWkErb1RMd0lFb3FReVNnOTRMdHpqd2huUG9IUlU2VEZuWlZ0b3k3TWhY?=
 =?utf-8?B?ZTVEazUxdnNjK0Zxd2g4b2FJVytIYStqNGFlUWRreStVTWNpUVJLa2xLWExU?=
 =?utf-8?B?amdYSmVNbEhUVndSZ1FDc3VvMnh3aGh6QTFOWU9YSmE3RGFvWTJNRjdzb3Vz?=
 =?utf-8?B?bXhkRC9ib3oxK3FYV1lwbUN5WlBIak04TXdSK2QwM1VYTlNoZ1IraW9aR2hZ?=
 =?utf-8?B?MVVEN2FWaGV2ZmROQUJDaG9HOTFLS3M0OU1LZUVNa1NWQkNTOXRLb3hRL3By?=
 =?utf-8?B?b0tNeTlpOTRuSU5NWjg3bThrNEgvZmdTZEJCRlQyQit6MExkQlZLMUJ3bXBy?=
 =?utf-8?B?OG01OU5FYTFkaXBNaHFpMThtcGdaeFptU2x0SXYxNDcyTnNKUEMxVE1rckZT?=
 =?utf-8?B?R3UrbEVjUmY0d0puRnRXWnJ3RExHQ2dvSjJ6bEJZZDJJdW94eTBUaFM2bFdj?=
 =?utf-8?B?cXMrdTlBSFJYMzNDMS9CUlBhWHl0djF6S2JZSTM4WFNLQlFBV1pLR3lYbTlU?=
 =?utf-8?B?QytrYlpMVVREeHoxbjZtUzYxQml1ZEZ1YUpGNENVVTlZZTZGUG9VT3p4eGs5?=
 =?utf-8?B?ZENZUjErcTdMbXBiMzhXRmN0ekVidXRtdmI0SmQvb2dOYzFYMWYvQ29FdkJu?=
 =?utf-8?B?RUl4MzJnNktPL01MUEJScDdLald3KzBPTDBrWmUzdVZzeERyTXNlNTdIc3Vm?=
 =?utf-8?B?YjZWTFFmVndUNFJiZEZBVHdtMEJWalRhc2JUckVjN2ZlR1dLakFWZEo0aDF1?=
 =?utf-8?B?ZmJ0dG1yZUd6bi9OcnZYY0RWS1FvQXJLRktRU2FEcEpSQkpEeDlsMUk4SDMr?=
 =?utf-8?B?Q1gxRUdrSG1ETjFhamx6UnRacTZHUTcvdkRCN3dZVGdGUjhFSG1KTlV1LzVO?=
 =?utf-8?B?QVhmamxqVEtTRERURlRVUmgxeTNMRjNVOGg5UFkvZlpES3V3T0VmeFFJdC91?=
 =?utf-8?B?TytmenFGOU84WHNrT3RSdyt3dllONnY2Q0dBUy8yTmZHWHV5R0hhbDNaUUo0?=
 =?utf-8?B?T3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc788d4a-8e83-475c-54d2-08de17f37b24
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 20:32:44.6094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M1HM5jGyP50eoNCAFP8eFqw2OuxaoVnvotjZsAFwcPDIwwjTRxWdEPey3ViMWm0z20tugQlL3FypGJrbCP6OBj951PHMEVHmz7tMs1/GvPQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6960
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

The size is normally used to make a decision on when to stop the device
(mainly when it's in a pre_copy state).

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 21 +++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  2 ++
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      | 29 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 30 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.h    |  1 +
 5 files changed, 83 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 40b75b5fe9229..30f0e51da49ae 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -395,6 +395,27 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
 }
 #endif /* CONFIG_DEBUG_FS */
 
+/**
+ * xe_gt_sriov_pf_migration_size() - Total size of migration data from all components within a GT.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function is for PF only.
+ *
+ * Return: total migration data size in bytes or a negative error code on failure.
+ */
+ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
+{
+	ssize_t total = 0;
+
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	/* Nothing to query yet - will be updated once per-GT migration data types are added */
+	return total;
+}
+
 /**
  * xe_gt_sriov_pf_migration_ring_empty() - Check if a migration ring is empty.
  * @gt: the &xe_gt
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index 1ed2248f0a17e..e2d41750f863c 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -15,6 +15,8 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
 int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
 
+ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
+
 bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid);
 bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid);
 void xe_gt_sriov_pf_migration_ring_free(struct xe_gt *gt, unsigned int vfid);
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
index a9a28aec22421..bc2d0b0342f22 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
@@ -14,6 +14,7 @@
 #include "xe_sriov_pf_control.h"
 #include "xe_sriov_pf_debugfs.h"
 #include "xe_sriov_pf_helpers.h"
+#include "xe_sriov_pf_migration.h"
 #include "xe_sriov_pf_provision.h"
 #include "xe_sriov_pf_service.h"
 #include "xe_sriov_printk.h"
@@ -254,6 +255,33 @@ static const struct file_operations data_vf_fops = {
 	.llseek		= default_llseek,
 };
 
+static ssize_t size_read(struct file *file, char __user *ubuf, size_t count, loff_t *ppos)
+{
+	struct dentry *dent = file_dentry(file)->d_parent;
+	struct xe_device *xe = extract_xe(dent);
+	unsigned int vfid = extract_vfid(dent);
+	char buf[21];
+	ssize_t ret;
+	int len;
+
+	xe_pm_runtime_get(xe);
+	ret = xe_sriov_pf_migration_size(xe, vfid);
+	xe_pm_runtime_put(xe);
+	if (ret < 0)
+		return ret;
+
+	len = scnprintf(buf, sizeof(buf), "%zd\n", ret);
+
+	return simple_read_from_buffer(ubuf, count, ppos, buf, len);
+}
+
+static const struct file_operations size_vf_fops = {
+	.owner		= THIS_MODULE,
+	.open		= simple_open,
+	.read		= size_read,
+	.llseek		= default_llseek,
+};
+
 static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
 {
 	debugfs_create_file("pause", 0200, vfdent, xe, &pause_vf_fops);
@@ -263,6 +291,7 @@ static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
 	debugfs_create_file("save", 0600, vfdent, xe, &save_vf_fops);
 	debugfs_create_file("restore", 0600, vfdent, xe, &restore_vf_fops);
 	debugfs_create_file("migration_data", 0600, vfdent, xe, &data_vf_fops);
+	debugfs_create_file("migration_size", 0400, vfdent, xe, &size_vf_fops);
 }
 
 static void pf_populate_with_tiles(struct xe_device *xe, struct dentry *dent, unsigned int vfid)
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
index f0a0c2b027a20..6992c227e5a44 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
@@ -241,3 +241,33 @@ int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfi
 
 	return xe_gt_sriov_pf_migration_restore_produce(gt, vfid, data);
 }
+
+/**
+ * xe_sriov_pf_migration_size() - Total size of migration data from all components within a device
+ * @xe: the &xe_device
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function is for PF only.
+ *
+ * Return: total migration data size in bytes or a negative error code on failure.
+ */
+ssize_t xe_sriov_pf_migration_size(struct xe_device *xe, unsigned int vfid)
+{
+	size_t size = 0;
+	struct xe_gt *gt;
+	ssize_t ret;
+	u8 gt_id;
+
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, vfid);
+
+	for_each_gt(gt, xe, gt_id) {
+		ret = xe_gt_sriov_pf_migration_size(gt, vfid);
+		if (ret < 0)
+			return ret;
+
+		size += ret;
+	}
+
+	return size;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
index df81a540c246a..16cb444c36aa6 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
@@ -18,6 +18,7 @@ int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfi
 					  struct xe_sriov_migration_data *data);
 struct xe_sriov_migration_data *
 xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid);
+ssize_t xe_sriov_pf_migration_size(struct xe_device *xe, unsigned int vfid);
 wait_queue_head_t *xe_sriov_pf_migration_waitqueue(struct xe_device *xe, unsigned int vfid);
 
 #endif
-- 
2.50.1

