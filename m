Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F6895D37F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 18:32:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA1B310EC7B;
	Fri, 23 Aug 2024 16:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kkx7mb4h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0CC210EC78;
 Fri, 23 Aug 2024 16:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724430724; x=1755966724;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=7fTkgV+Z9TYh+yRqhtMM/C+eq/tJJb3CE1MQviaqBJU=;
 b=kkx7mb4hYsOBzp7zQArAYzaiklrs98eR53vlhjBX3iSteQPayn2inLxF
 Mi8G9Aq1IskTWhsMJV6cx2m71i79jSioEuEihvslcZ1HhyMDXQIKPETEp
 oLqwERkqr1Uqo1Bc7hZ1C4MBsZNofNC4W4oHlL/d1VfJMQoAOk+HJjMGo
 ROg+4YrmNwGInKzeZOu2Xp19fHaqyhoct0/WNhGxhvfzRfc4WcKVLqdaF
 xICCGpJ1zrVfgW+aL5Vk/tlGr5ChnbqYk/kRm8bXW+taUJcsrqHt/CkTc
 5bkSXgl7IvFg9AKJXdJ/+8QoN3NtygIAQzGgmDEAVpJCjZPEpBFw1bguA w==;
X-CSE-ConnectionGUID: 2XcqdtIxTaWUo8+qNCyBKA==
X-CSE-MsgGUID: o2YTN8EVT3Co20vCQZ7K2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33529982"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="33529982"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 09:32:03 -0700
X-CSE-ConnectionGUID: WTPl6goQQbOOMm4p0++i/A==
X-CSE-MsgGUID: a8QAjgt6TvmcZYat5G+yjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="62556883"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Aug 2024 09:32:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 09:32:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 09:32:01 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 23 Aug 2024 09:32:01 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 23 Aug 2024 09:32:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SDTYFfd3qldI7846GrPfYhBUjNLWS1Do1qk1W01DwyL2ZyuKWdi4jZjJMayWPAz2Jkiyy5vYxduepCFHvVJdphyrTVHbIq3XNlu9APSO6XGgyub/0bgHgYkY31cMJ8nhSLbnEkBXFFn0BnrBUXNLQ6Dk8rKJ64X6h3QF9oUQb0VX8aiKYzSNvMYQP5O5S6R7tSAfJhR/Mpv1BI5Rtdly/uJBqKN/CAsWj8BBQWQ757OPIp3ahehI5dmZJxFZr2NZy9bBiInoJilMRqZBcCWDNOdQCTwV9ZgCEdTkqLPtQcD8aUwFoK4QTyI2tHYZRf0B+k+pmEWQbsqBba2k1Q+Yaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ap+mBmSTQvDiL/lSL9o88sncBL3vR1DL+KqhJK3zag=;
 b=vET3anfr+yv5hwNvzKIUGyp1BaiXLEqyAxNq4+RWYeLtRUggB9HPn0bH5YnpbqsJREHeDGsOw5uggO6nY3mx65u0RHOcn72qlkAV9OyypUXDJKzYzLBGbjBNH3vFGTdbCiRaUIBPrY5IABrHSWfyQ58d3XyUGP59PuI5S6RhPQwXXQiQjgyzHRgszOJJgN++LKl14gDrVtdOuMj1CqX0PKcraNEgZf18WA2dcSeyuoIAj7/QRuCHxXvIavuZ77T4edvRymhh5RHV6ByatuCqF+23KFrcBRWSBj00inU94xtWP8xNNarnJkGEqHT/DyzRvd3AzUVt2kiGpH9HeMYYcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 BL1PR11MB6026.namprd11.prod.outlook.com (2603:10b6:208:391::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.19; Fri, 23 Aug 2024 16:31:59 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%4]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 16:31:59 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Simon Ser
 <contact@emersion.fr>, Matthew Wilcox <willy@infradead.org>, Oded Gabbay
 <ogabbay@kernel.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, James Zhu <James.Zhu@amd.com>, Pekka Paalanen
 <pekka.paalanen@collabora.com>, Emil Velikov <emil.l.velikov@gmail.com>, Alex
 Deucher <alexdeucher@gmail.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v7 2/3] accel: Use XArray instead of IDR for minors
Date: Fri, 23 Aug 2024 18:30:47 +0200
Message-ID: <20240823163048.2676257-3-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240823163048.2676257-1-michal.winiarski@intel.com>
References: <20240823163048.2676257-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::12) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|BL1PR11MB6026:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b78aa7c-4d30-4d61-7f83-08dcc3911c1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TG1BRWVEKzRCd3RQV2VRdG9CSldjOGVQaTBKUGpZQVVNUFgzOGFkNWQvMTAv?=
 =?utf-8?B?LzlSdVRlZmJJejRuQlZjRHlwUmdjRWE0L3A3dUdOeVM2ejhDd1Via3dSa21m?=
 =?utf-8?B?cnVhOFJTbGhzaS8zZkFtbEhESVRhS0l3VUQyRFUxZWd5ajV6RFhWclpXa2ls?=
 =?utf-8?B?TWxTYmNqS3ZlQ0lkOUh4SDZQUFVib3JmRkVhZTU3RmNiWmdhaWZjVjdmeWY5?=
 =?utf-8?B?dmZSR1l6VXJPLzhNM2hxYytOcDU5Y3p5MW96K3NLaERnWnlLKzFBVXZveC9G?=
 =?utf-8?B?OFZNRTJpWWlnVW8xWmRxNFNsUlNDY25VczY5dmd1SnEyeWc5VDZROHplVlJq?=
 =?utf-8?B?OFliVjU4R1Z5VU50L3VvVlNzVVFEQXRab3RDOHg1ZC9iVVJEUnUrd0lOQytz?=
 =?utf-8?B?c1BtVkxqNlJIcUlNTkZhdzQ2cjdmNGxNdy9TaDlBNDNCSUgyazJRRHIzVlps?=
 =?utf-8?B?STgvMFlHeWtPQThPSTNGZENsclg3WnBtc0t5MFh3NWt3K0pNa1owdmxtQnVQ?=
 =?utf-8?B?cWN5TUZrci9wazhCS1Rad1JwcG00V0JkbEgxSHFURWpKanErSVFqTzRLdjh5?=
 =?utf-8?B?dEZ2aGgxRzNNMC9kRGhzeHVtV3pzQVUyNGtIeHVaUjRnVGVWZzVIMytFUGd0?=
 =?utf-8?B?aEpnR2lBRHpseURoNVFaellNT2JuY0pmKy9ETFh1WlcrdTlCa3QrQ090YXZF?=
 =?utf-8?B?K2VWblk1c2JKRENPY2JoN0NsbzR3NDMrcFZjK2wrQzh4d2J6dGwxVjB5bSs2?=
 =?utf-8?B?K055QVA5ZEV6b1dXRXlvTlpsSk00a2VHcmdaeUhPek0ra3BDMHI2SFdKRGt0?=
 =?utf-8?B?dG91R0FoZTZ2blJ4VHRmRmxQUzBzVEVWS0VrV1QycU9DclJhbVVHSmhIdmxs?=
 =?utf-8?B?dW50UVB5UWdQMWZxR093azFtT3hNbjJBSW9wMEN4VWtna2NGbzBlWmZsZ0dq?=
 =?utf-8?B?ekNCcUd5VUpYSjdVUjE4QW53dzFuZi95b05qUVFESjZ5MGRyNTQ1ZG4rcVRC?=
 =?utf-8?B?c0Z4aThBbHQyU2g4TXAxRll6ZWlLQ0cwN1p1WlVoTVFINkhuYnNCQ1dwNlhX?=
 =?utf-8?B?OWg0d1ZrNWhlZXRqS0xJZ2gyNkwvdDhUV0Y3b0wwSjhKd0Myay9BbFlwTjJw?=
 =?utf-8?B?ZW84SW1BdDIrQkpDWW85ZHVBMkF4VWtTT1JDT05ldkt4NGNLMEM5OFdpRy9w?=
 =?utf-8?B?MlFrY0l0TTN2T3hEK0dsdTFiV3RmWnRMQzRMRyswSGdJekxBK3dkSXM0eXFh?=
 =?utf-8?B?MmJOR2p4Q3VRUzBOQ01DVTF6b3o2bEZtc0NuSWRENzMza3VmRGV6aDM3WFYz?=
 =?utf-8?B?RDdmRTJ6QjNhanJXbHJsZXRrOFRwUnEwY0tZUzhzSk1DTnlWRzE3RStic0JL?=
 =?utf-8?B?K0JDUmQ0UHIwZFByekI1WDZKY29oalRJUTJKeDFSaWVETHlqNWN5NnhMQStz?=
 =?utf-8?B?MlFuTTdNVWNPWlRtZVZ0TnBSTkhuYUZjWG03NEx3T0tRbFhJNmN0S2VUSlBS?=
 =?utf-8?B?ZXpqVk93dGpxcnlwb2VDQ1dtMDNWZGVrSmw1NjhtejZreTF5Q29UbHY0RDZq?=
 =?utf-8?B?bFhzWU1ObVhESHBNSHRCemxtYmMvYU5vQ3I3a2MxQzgrdHMyZlo1Ykk2MDUr?=
 =?utf-8?B?S3Axd3UzUnFLSWQwYVZqNVpVL05CRi92eUxEcXM2YjFtNFVYR2dXS20xS3Rq?=
 =?utf-8?B?dUJ1emJLYlpBSDhpUkdQUStuTkE0N3VvMVVFUjB5a3UzSWNoN2NDYUozRndB?=
 =?utf-8?B?Wk1MeXJNUjhoeEFmSFBXQmZCZW1hdHZIb014UDJQK0c1eUhxS3kzUTE4YVFI?=
 =?utf-8?B?WjNQb1dEMGxGTWQ0cXZJZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGlBdU5aR1Y5RDF4b3NRbnMwSVZYdmZkQnNqdFFJTDZLRzhRS051K0MzM2V3?=
 =?utf-8?B?OVlCeS91NUNSdk8wME1YOHpabkIyUk5pazFwREwxT2dsSExCR3ZOVjFwc2xs?=
 =?utf-8?B?SGRUeHdUQThKaVkxU3UxVmZpbW92cEtES1ViR1doMG9aNkxtT01qMnpkMDgw?=
 =?utf-8?B?Y0RTYlNrZGtqM0ovT1Y5clRZL2QrK0l6K0lVb25GK0lWVE9QdHAzM2o1bVNu?=
 =?utf-8?B?N1QyZVFReWhRS1Z2d1cwZjZnbHh5bnJHZmU2SjJaNVh0Tms3TlR3aWpYVStp?=
 =?utf-8?B?cHc2eXlIT1VPU3ZIdXBkdENWd0dXTjRKR2lXdlRvbFRJOTNZVEJBZTRvNWho?=
 =?utf-8?B?UStZTGwwTmx3SUw5ZkdUdDZuaEJHdkp3cnJ4WEg3dFNpU3hXcUp5TmRpSTUy?=
 =?utf-8?B?NnlmanE3TnNBN3pFQ0d4Q052bDV6MmdsNFIwb1dvdzZUMFZ4UjZIc0FPVkRZ?=
 =?utf-8?B?bk1hTWFsLzNENkFMZkI4Nk1qckhvZC82cnNTblgvSWo4elhtNUUxQUtBYzZ1?=
 =?utf-8?B?UGpDaUNDVVpjdS9TRTBoaHd2a2dRR2dlTVhkcFNBUDJmSDFGaEdINXBPcy9U?=
 =?utf-8?B?czgraE45bDIwYjNpb2JTTkI4ODk4cEhQU3ZRZFJpandEVzhxV0dEZVV3M25q?=
 =?utf-8?B?K21ITWp5S3NFbDFLcDNpTk1VTURNS3pRSmRWdFR2K25FMURvb3RKV21SSkQ0?=
 =?utf-8?B?VHhMU1BxM2dyY3RLT0lCQ0JxSXRwUy9CcGZOT0NMaGxBZHpKRGJySkpUemVF?=
 =?utf-8?B?ZnRxZS9ya1VsTDZZZDdMNkZ6VmloTVZCQ1VPMTdJQzJsdkp6TDEvZm9FeG9C?=
 =?utf-8?B?QUxvWExCQ2g2aUtlRHUzcUVmcE12NmdZajZtS21YY0o3SFpvajdNV1N6UnRs?=
 =?utf-8?B?S1BaUTBRWG9lU2xIR1VPOGVJbGJvR215VklTc2FQSnNjSnlPQ21Da3BLRHdj?=
 =?utf-8?B?L2QxdUVSaVJrTXQrU2NYQksxR2lUSExMSlRTdFdFVEJFYnJMcXZJVzI3dlNy?=
 =?utf-8?B?THo1NEFrSXZ6ZTlRQm1teDdlbkJEYmlOSmxIbG9TOVhYYmI0ekQrWHpBL2p5?=
 =?utf-8?B?S1lONnRscXpRZXQ0OXhNaFpkTDFIeUNUcFIxbUhraHNkbXNjSVdFTk1KWHlk?=
 =?utf-8?B?Yll5U3EyVGFiTy9EcEpXanBscmV6clJweFZ4bHBkajFVNDNBUWNscm9JVzV4?=
 =?utf-8?B?ckNwTnQzU1JQMlovbkRGR0c3cmtNeFBPMFV2bUlobGxjNU9WNE4zSUswaDhI?=
 =?utf-8?B?eFBRRExsWlVUc2tBb3YzMTVEbklMM2lIRlpZRHZuSHRxcDNmZ0lkeHJqKy94?=
 =?utf-8?B?ODY0WHdrQ0V6cEkwT3Z1ZEszQ0ZWYW45czBNSUhZWHZmR0x6M3BiM3N6NTJv?=
 =?utf-8?B?bEFDdVYvRXNLTHQ2OFlGWmI1Y1NOc2c3bEMxcXo3dGRxamlVQXBWZVBWSFkw?=
 =?utf-8?B?TVdLRXA4OHZ2WVhKc2FtL1UwY0FTR2RYaVFSMi8zYWtOdXMyQmZ1NkpUeHZ2?=
 =?utf-8?B?VW5MMWxqMGNxWStnYTJGa3FqNzBOY2Y5NVNidFZ0QUl5V3dpb0xzYUlmTTJL?=
 =?utf-8?B?SEVSU09kSXc1dFAyVE9SWFNzamZPcTNDVGJzRWl6MnFveCtmK3pzOWFUU0lJ?=
 =?utf-8?B?VndwL2JDRDlPNTVsajZZaSs2aTc5cE1lSktwK09XT0FRM3d3b2JjRVNDZk9r?=
 =?utf-8?B?Szk4MkEwcVJnR2xMdDlzN3preWhBT1lGOE42SWVVOWt0VjN2QVpweXpQQkdS?=
 =?utf-8?B?NTNSb0w0b3lMZERXNjFDcGl1cE02MFFKdDZSc2lFTGtqdHVSamNLanpaQnJx?=
 =?utf-8?B?d1B1aW9INzVVVm8yMkh0eGJFTWttNFQwZVVuL3Bka3FpMVE0ZHExQjNkaGVY?=
 =?utf-8?B?ZkV4ZUxmeHVMRW8zZVYxOE1CamxpS0tCL3VOL2NHSXB2QzZmMlp2ZUxpWG1C?=
 =?utf-8?B?Z1hoaFJ6blhtSW0vUWN6SFZ5SFJRYmcvMXU2QVBqbk04RmUyaUtONHo0T3Yv?=
 =?utf-8?B?aTI5WkEzRHJWS1pZS3Z0ZzkyS3p5MGk3Um5vUThjelRaUjdVenJ2UTBGSWl0?=
 =?utf-8?B?MWttV3JjNWs1dzhQb3pSSEsvUjJjZDZSd1ZCTlhlVzFwWU5Ndi9SNk03cDVq?=
 =?utf-8?B?czZSbjZyekxDR21FbWNpVUY5RndUSDBDN3BrQjJOYkZLTk01cDRad2tUT2ZH?=
 =?utf-8?B?aXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b78aa7c-4d30-4d61-7f83-08dcc3911c1c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 16:31:59.1501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5YJXRjQd6R4+KI5myZ5RYGTo0IgzIoDKqxbkKvMn8InqvonpKjBOjDeXE6nl+wkku70JhRnedXuF2kYhIdlcPNaW0AsRghvvsaDJlbGHNss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6026
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

Accel minor management is based on DRM (and is also using struct
drm_minor internally), since DRM is using XArray for minors, it makes
sense to also convert accel.
As the two implementations are identical (only difference being the
underlying xarray), move the accel_minor_* functionality to DRM.

Acked-by: James Zhu <James.Zhu@amd.com>
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/accel/drm_accel.c      | 110 +++------------------------------
 drivers/gpu/drm/drm_drv.c      |  66 ++++++++++----------
 drivers/gpu/drm/drm_file.c     |   2 +-
 drivers/gpu/drm/drm_internal.h |   4 --
 include/drm/drm_accel.h        |  18 +-----
 include/drm/drm_file.h         |   5 ++
 6 files changed, 47 insertions(+), 158 deletions(-)

diff --git a/drivers/accel/drm_accel.c b/drivers/accel/drm_accel.c
index 16c3edb8c46ee..aa826033b0ceb 100644
--- a/drivers/accel/drm_accel.c
+++ b/drivers/accel/drm_accel.c
@@ -8,7 +8,7 @@
 
 #include <linux/debugfs.h>
 #include <linux/device.h>
-#include <linux/idr.h>
+#include <linux/xarray.h>
 
 #include <drm/drm_accel.h>
 #include <drm/drm_auth.h>
@@ -18,8 +18,7 @@
 #include <drm/drm_ioctl.h>
 #include <drm/drm_print.h>
 
-static DEFINE_SPINLOCK(accel_minor_lock);
-static struct idr accel_minors_idr;
+DEFINE_XARRAY_ALLOC(accel_minors_xa);
 
 static struct dentry *accel_debugfs_root;
 
@@ -117,99 +116,6 @@ void accel_set_device_instance_params(struct device *kdev, int index)
 	kdev->type = &accel_sysfs_device_minor;
 }
 
-/**
- * accel_minor_alloc() - Allocates a new accel minor
- *
- * This function access the accel minors idr and allocates from it
- * a new id to represent a new accel minor
- *
- * Return: A new id on success or error code in case idr_alloc failed
- */
-int accel_minor_alloc(void)
-{
-	unsigned long flags;
-	int r;
-
-	spin_lock_irqsave(&accel_minor_lock, flags);
-	r = idr_alloc(&accel_minors_idr, NULL, 0, ACCEL_MAX_MINORS, GFP_NOWAIT);
-	spin_unlock_irqrestore(&accel_minor_lock, flags);
-
-	return r;
-}
-
-/**
- * accel_minor_remove() - Remove an accel minor
- * @index: The minor id to remove.
- *
- * This function access the accel minors idr and removes from
- * it the member with the id that is passed to this function.
- */
-void accel_minor_remove(int index)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&accel_minor_lock, flags);
-	idr_remove(&accel_minors_idr, index);
-	spin_unlock_irqrestore(&accel_minor_lock, flags);
-}
-
-/**
- * accel_minor_replace() - Replace minor pointer in accel minors idr.
- * @minor: Pointer to the new minor.
- * @index: The minor id to replace.
- *
- * This function access the accel minors idr structure and replaces the pointer
- * that is associated with an existing id. Because the minor pointer can be
- * NULL, we need to explicitly pass the index.
- *
- * Return: 0 for success, negative value for error
- */
-void accel_minor_replace(struct drm_minor *minor, int index)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&accel_minor_lock, flags);
-	idr_replace(&accel_minors_idr, minor, index);
-	spin_unlock_irqrestore(&accel_minor_lock, flags);
-}
-
-/*
- * Looks up the given minor-ID and returns the respective DRM-minor object. The
- * refence-count of the underlying device is increased so you must release this
- * object with accel_minor_release().
- *
- * The object can be only a drm_minor that represents an accel device.
- *
- * As long as you hold this minor, it is guaranteed that the object and the
- * minor->dev pointer will stay valid! However, the device may get unplugged and
- * unregistered while you hold the minor.
- */
-static struct drm_minor *accel_minor_acquire(unsigned int minor_id)
-{
-	struct drm_minor *minor;
-	unsigned long flags;
-
-	spin_lock_irqsave(&accel_minor_lock, flags);
-	minor = idr_find(&accel_minors_idr, minor_id);
-	if (minor)
-		drm_dev_get(minor->dev);
-	spin_unlock_irqrestore(&accel_minor_lock, flags);
-
-	if (!minor) {
-		return ERR_PTR(-ENODEV);
-	} else if (drm_dev_is_unplugged(minor->dev)) {
-		drm_dev_put(minor->dev);
-		return ERR_PTR(-ENODEV);
-	}
-
-	return minor;
-}
-
-static void accel_minor_release(struct drm_minor *minor)
-{
-	drm_dev_put(minor->dev);
-}
-
 /**
  * accel_open - open method for ACCEL file
  * @inode: device inode
@@ -227,7 +133,7 @@ int accel_open(struct inode *inode, struct file *filp)
 	struct drm_minor *minor;
 	int retcode;
 
-	minor = accel_minor_acquire(iminor(inode));
+	minor = drm_minor_acquire(&accel_minors_xa, iminor(inode));
 	if (IS_ERR(minor))
 		return PTR_ERR(minor);
 
@@ -246,7 +152,7 @@ int accel_open(struct inode *inode, struct file *filp)
 
 err_undo:
 	atomic_dec(&dev->open_count);
-	accel_minor_release(minor);
+	drm_minor_release(minor);
 	return retcode;
 }
 EXPORT_SYMBOL_GPL(accel_open);
@@ -257,7 +163,7 @@ static int accel_stub_open(struct inode *inode, struct file *filp)
 	struct drm_minor *minor;
 	int err;
 
-	minor = accel_minor_acquire(iminor(inode));
+	minor = drm_minor_acquire(&accel_minors_xa, iminor(inode));
 	if (IS_ERR(minor))
 		return PTR_ERR(minor);
 
@@ -274,7 +180,7 @@ static int accel_stub_open(struct inode *inode, struct file *filp)
 		err = 0;
 
 out:
-	accel_minor_release(minor);
+	drm_minor_release(minor);
 
 	return err;
 }
@@ -290,15 +196,13 @@ void accel_core_exit(void)
 	unregister_chrdev(ACCEL_MAJOR, "accel");
 	debugfs_remove(accel_debugfs_root);
 	accel_sysfs_destroy();
-	idr_destroy(&accel_minors_idr);
+	WARN_ON(!xa_empty(&accel_minors_xa));
 }
 
 int __init accel_core_init(void)
 {
 	int ret;
 
-	idr_init(&accel_minors_idr);
-
 	ret = accel_sysfs_init();
 	if (ret < 0) {
 		DRM_ERROR("Cannot create ACCEL class: %d\n", ret);
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index ae675a588a1df..7e0fa5a2a3182 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -55,7 +55,7 @@ MODULE_AUTHOR("Gareth Hughes, Leif Delgass, José Fonseca, Jon Smirl");
 MODULE_DESCRIPTION("DRM shared core routines");
 MODULE_LICENSE("GPL and additional rights");
 
-static DEFINE_XARRAY_ALLOC(drm_minors_xa);
+DEFINE_XARRAY_ALLOC(drm_minors_xa);
 
 /*
  * If the drm core fails to init for whatever reason,
@@ -83,6 +83,18 @@ DEFINE_STATIC_SRCU(drm_unplug_srcu);
  * registered and unregistered dynamically according to device-state.
  */
 
+static struct xarray *drm_minor_get_xa(enum drm_minor_type type)
+{
+	if (type == DRM_MINOR_PRIMARY || type == DRM_MINOR_RENDER)
+		return &drm_minors_xa;
+#if IS_ENABLED(CONFIG_DRM_ACCEL)
+	else if (type == DRM_MINOR_ACCEL)
+		return &accel_minors_xa;
+#endif
+	else
+		return ERR_PTR(-EOPNOTSUPP);
+}
+
 static struct drm_minor **drm_minor_get_slot(struct drm_device *dev,
 					     enum drm_minor_type type)
 {
@@ -106,18 +118,18 @@ static void drm_minor_alloc_release(struct drm_device *dev, void *data)
 
 	put_device(minor->kdev);
 
-	if (minor->type == DRM_MINOR_ACCEL)
-		accel_minor_remove(minor->index);
-	else
-		xa_erase(&drm_minors_xa, minor->index);
+	xa_erase(drm_minor_get_xa(minor->type), minor->index);
 }
 
-#define DRM_MINOR_LIMIT(t) ({ typeof(t) _t = (t); XA_LIMIT(64 * _t, 64 * _t + 63); })
+#define DRM_MINOR_LIMIT(t) ({ \
+	typeof(t) _t = (t); \
+	_t == DRM_MINOR_ACCEL ? XA_LIMIT(0, ACCEL_MAX_MINORS) : XA_LIMIT(64 * _t, 64 * _t + 63); \
+})
 
 static int drm_minor_alloc(struct drm_device *dev, enum drm_minor_type type)
 {
 	struct drm_minor *minor;
-	int index, r;
+	int r;
 
 	minor = drmm_kzalloc(dev, sizeof(*minor), GFP_KERNEL);
 	if (!minor)
@@ -126,18 +138,11 @@ static int drm_minor_alloc(struct drm_device *dev, enum drm_minor_type type)
 	minor->type = type;
 	minor->dev = dev;
 
-	if (type == DRM_MINOR_ACCEL) {
-		r = accel_minor_alloc();
-		index = r;
-	} else {
-		r = xa_alloc(&drm_minors_xa, &index, NULL, DRM_MINOR_LIMIT(type), GFP_KERNEL);
-	}
-
+	r = xa_alloc(drm_minor_get_xa(type), &minor->index,
+		     NULL, DRM_MINOR_LIMIT(type), GFP_KERNEL);
 	if (r < 0)
 		return r;
 
-	minor->index = index;
-
 	r = drmm_add_action_or_reset(dev, drm_minor_alloc_release, minor);
 	if (r)
 		return r;
@@ -176,16 +181,12 @@ static int drm_minor_register(struct drm_device *dev, enum drm_minor_type type)
 		goto err_debugfs;
 
 	/* replace NULL with @minor so lookups will succeed from now on */
-	if (minor->type == DRM_MINOR_ACCEL) {
-		accel_minor_replace(minor, minor->index);
-	} else {
-		entry = xa_store(&drm_minors_xa, minor->index, minor, GFP_KERNEL);
-		if (xa_is_err(entry)) {
-			ret = xa_err(entry);
-			goto err_debugfs;
-		}
-		WARN_ON(entry);
+	entry = xa_store(drm_minor_get_xa(type), minor->index, minor, GFP_KERNEL);
+	if (xa_is_err(entry)) {
+		ret = xa_err(entry);
+		goto err_debugfs;
 	}
+	WARN_ON(entry);
 
 	DRM_DEBUG("new minor registered %d\n", minor->index);
 	return 0;
@@ -204,10 +205,7 @@ static void drm_minor_unregister(struct drm_device *dev, enum drm_minor_type typ
 		return;
 
 	/* replace @minor with NULL so lookups will fail from now on */
-	if (minor->type == DRM_MINOR_ACCEL)
-		accel_minor_replace(NULL, minor->index);
-	else
-		xa_store(&drm_minors_xa, minor->index, NULL, GFP_KERNEL);
+	xa_store(drm_minor_get_xa(type), minor->index, NULL, GFP_KERNEL);
 
 	device_del(minor->kdev);
 	dev_set_drvdata(minor->kdev, NULL); /* safety belt */
@@ -223,15 +221,15 @@ static void drm_minor_unregister(struct drm_device *dev, enum drm_minor_type typ
  * minor->dev pointer will stay valid! However, the device may get unplugged and
  * unregistered while you hold the minor.
  */
-struct drm_minor *drm_minor_acquire(unsigned int minor_id)
+struct drm_minor *drm_minor_acquire(struct xarray *minor_xa, unsigned int minor_id)
 {
 	struct drm_minor *minor;
 
-	xa_lock(&drm_minors_xa);
-	minor = xa_load(&drm_minors_xa, minor_id);
+	xa_lock(minor_xa);
+	minor = xa_load(minor_xa, minor_id);
 	if (minor)
 		drm_dev_get(minor->dev);
-	xa_unlock(&drm_minors_xa);
+	xa_unlock(minor_xa);
 
 	if (!minor) {
 		return ERR_PTR(-ENODEV);
@@ -1024,7 +1022,7 @@ static int drm_stub_open(struct inode *inode, struct file *filp)
 
 	DRM_DEBUG("\n");
 
-	minor = drm_minor_acquire(iminor(inode));
+	minor = drm_minor_acquire(&drm_minors_xa, iminor(inode));
 	if (IS_ERR(minor))
 		return PTR_ERR(minor);
 
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index e8a841e709342..dab8c8623eb07 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -356,7 +356,7 @@ int drm_open(struct inode *inode, struct file *filp)
 	struct drm_minor *minor;
 	int retcode;
 
-	minor = drm_minor_acquire(iminor(inode));
+	minor = drm_minor_acquire(&drm_minors_xa, iminor(inode));
 	if (IS_ERR(minor))
 		return PTR_ERR(minor);
 
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 23c99803af44c..1705bfc90b1e7 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -80,10 +80,6 @@ void drm_prime_destroy_file_private(struct drm_prime_file_private *prime_fpriv);
 void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
 				 uint32_t handle);
 
-/* drm_drv.c */
-struct drm_minor *drm_minor_acquire(unsigned int minor_id);
-void drm_minor_release(struct drm_minor *minor);
-
 /* drm_managed.c */
 void drm_managed_release(struct drm_device *dev);
 void drmm_add_final_kfree(struct drm_device *dev, void *container);
diff --git a/include/drm/drm_accel.h b/include/drm/drm_accel.h
index f4d3784b1dce0..8867ce0be94cd 100644
--- a/include/drm/drm_accel.h
+++ b/include/drm/drm_accel.h
@@ -51,11 +51,10 @@
 
 #if IS_ENABLED(CONFIG_DRM_ACCEL)
 
+extern struct xarray accel_minors_xa;
+
 void accel_core_exit(void);
 int accel_core_init(void);
-void accel_minor_remove(int index);
-int accel_minor_alloc(void);
-void accel_minor_replace(struct drm_minor *minor, int index);
 void accel_set_device_instance_params(struct device *kdev, int index);
 int accel_open(struct inode *inode, struct file *filp);
 void accel_debugfs_init(struct drm_device *dev);
@@ -73,19 +72,6 @@ static inline int __init accel_core_init(void)
 	return 0;
 }
 
-static inline void accel_minor_remove(int index)
-{
-}
-
-static inline int accel_minor_alloc(void)
-{
-	return -EOPNOTSUPP;
-}
-
-static inline void accel_minor_replace(struct drm_minor *minor, int index)
-{
-}
-
 static inline void accel_set_device_instance_params(struct device *kdev, int index)
 {
 }
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index ab230d3af138d..8c0030c773081 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -45,6 +45,8 @@ struct drm_printer;
 struct device;
 struct file;
 
+extern struct xarray drm_minors_xa;
+
 /*
  * FIXME: Not sure we want to have drm_minor here in the end, but to avoid
  * header include loops we need it here for now.
@@ -434,6 +436,9 @@ static inline bool drm_is_accel_client(const struct drm_file *file_priv)
 
 void drm_file_update_pid(struct drm_file *);
 
+struct drm_minor *drm_minor_acquire(struct xarray *minors_xa, unsigned int minor_id);
+void drm_minor_release(struct drm_minor *minor);
+
 int drm_open(struct inode *inode, struct file *filp);
 int drm_open_helper(struct file *filp, struct drm_minor *minor);
 ssize_t drm_read(struct file *filp, char __user *buffer,
-- 
2.46.0

