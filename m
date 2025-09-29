Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9E3BAA281
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 19:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C23910E469;
	Mon, 29 Sep 2025 17:24:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DCZm8VXw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D9910E469
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 17:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759166639; x=1790702639;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=uee0fyrOtYrZe6UK2lxmUyAVzM+W5nbgNFecPaemj/I=;
 b=DCZm8VXwfoKxmpobnD5aMbsh8eslMpQKUQ4G7epvtpc44IPheu1nMOO1
 oqD6t86rewa+saxWi0aN4BhkwjPxEjdpewTew61gI7evIMzmZxUcQtmZm
 b34FIlCGcT85cBRvyfYKSAkpbfRMgMEVjXVWOBT5ITWTcnXVCLDHnkJoj
 QUqFPTdnth52WmDdpK3nNO9qCHM7kMr6jikIgsT2kTJwjbGXB8EKvuR+b
 o5AuHwKQgB/XR4Qf3iCcXj8Uh2UFPIafaA6H1SS26DNrhPP6k2jV+KBWi
 aBJ+kwKsLFJoMJpaeFE28ShSO0wbiSNg3nQ7Tduczh11b4qPEIbfLn5AI w==;
X-CSE-ConnectionGUID: +Je1WGWFS8mx50mfMoPDMg==
X-CSE-MsgGUID: kxYlVhjOSm2Q7oDoOY7/UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="71661931"
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="71661931"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 10:23:58 -0700
X-CSE-ConnectionGUID: 9HZbm0WdQei2gyAEaMgeXg==
X-CSE-MsgGUID: l6r78g/SSs2p1pqIF0jdtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="215455605"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 10:23:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 10:23:57 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 10:23:57 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 10:23:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z1dF6huzhYhM3OlOigHuO2as2Q+f0pNYdgGhL6PIapQmXVC+VnppOPl9sBUcckWkxPl7Tjn9v+WufsF7X9H1aVi8a7A+PilfYqvLdSnonfb5uFqKIejJZw2wsVeyoPD3Lc+yl/QTcfSbeb7lr1otr7God/NDydniyDEX6enG+usos34QC+F9deNG38bp4Qg7vgTy9jYKMUj5ze1KccDx+h+BDO9Bj3+s/QTQ6ocvr5pxhLFFBOx9h6wO6VfRdxfIY0JmyCzNIME6K59sAM64OmzHY1GIO0rQPbfxPiNtMgwDhOlvAO4Tn2Rt0WpJvMylUFvcETjMGTC4zxveZLgxXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=buuAIghsoDxhcnLR1GdIQLAPyerS6E2C6ccDN6RuXnc=;
 b=FpWrNbaJUq3Rd2xZazEI6Ee0de0tWL9LJcBK4QG+YHqHjHrofJ6VtpyhzGMPj7BjH+aXceXup+WPp25KvczwFMp918GZl0xnTU7MY9mJMSUqioH7rMT0DfC+chRXWYonzF1s5eSh4+TF+DsH/mZFN6l9Cje0n7opTQJGIwZcjKZSiWaneKjrTDzpSrv48OGW1JU0iSmf23c3adMO/IF/wG54S+62vM9JKaHlhuGJnts8jnIFCg0and9S8s4dU8TvCbuDPbGOiErxk22mfJx/Rxs4y3pB4weEPM9bz5UiI7UZkZz9ZzpWp8wZevrvOV/tjbFGVJ3ZLapAtWQ5GJZSCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 17:23:54 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9160.014; Mon, 29 Sep 2025
 17:23:53 +0000
Date: Mon, 29 Sep 2025 10:23:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Philipp Stanner <phasta@kernel.org>
CC: Danilo Krummrich <dakr@kernel.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/sched: Mandate usage of drm_sched_job_cleanup()
Message-ID: <aNrAp4VxGVcwep/8@lstrano-desk.jf.intel.com>
References: <20250926123630.200920-2-phasta@kernel.org>
 <aNq9/6Ks2N3A1hDu@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aNq9/6Ks2N3A1hDu@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR04CA0344.namprd04.prod.outlook.com
 (2603:10b6:303:8a::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8562:EE_
X-MS-Office365-Filtering-Correlation-Id: 566601ed-0996-464e-563f-08ddff7cf6ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWlpaWY2WkY2cXorRDgyV1BJdzBpTlNKdHBQUGpNb292SjJuVTVvZGpxUU5C?=
 =?utf-8?B?TzNVNUY4MVZycUdSQ1poSjUzT2dKR1NQSS9nc1ljak5xRDBjNW1pYmxhZ3hD?=
 =?utf-8?B?NUE4MldQNjZtcVRvM3MzQVJ0Y24yRVk0WUdMSkxzTkJBc1VxR0xBUDhjdWJt?=
 =?utf-8?B?R1ZySnZ2MExkQXhHV1luRldpS0IycGtKY2VrSkRQUUVmSTBYZTlSbFMxY09o?=
 =?utf-8?B?WGpTVDdGVnBqR0FKVmFFV0FqemJsL29zVWVHL2xDKzc4bmF6ZVVjakdLSzVs?=
 =?utf-8?B?L2l2STZMdnVoM0lZNXB6bkFSdEVJNDdvSElOemI2aUI0WmthcjNzYUh6OC8z?=
 =?utf-8?B?S056SE82SFhrU2RJOGZGVWRCY0RKcVMxZ25FeGlhTHpHd2hvbjlXS3FRQjdW?=
 =?utf-8?B?bCt3OWtacFRXVzlQVW5MWk9Ubm1qZmFYWWtBbndnMkJWV1lQVjE5WHQrcFBY?=
 =?utf-8?B?dklTaThYT3M4S3NrcjNLSXk3eU1xVEFENFdSM3BHeHFNVEhMNlpVeVNHZWxE?=
 =?utf-8?B?eFVkYzVoYzBxN1NGcWdTbTA2aFNzalZJMGJuL21rQXlGcnlvM25LSDBUL2V3?=
 =?utf-8?B?MTFCdzZIUjRWVkVQYW5wRU9HV1JTWXdjaHZHbUN6dUo3Y0MvSUg4TmdoOTBF?=
 =?utf-8?B?SCtvYXJ6OHcrQWw0b3Z3TGx4bE9xc2JUSTA4UHEza2pWTCtmRXIySUxBd1k2?=
 =?utf-8?B?Y3M5RnNvM21WdW5UY1ZGNDhacm5XVHRZRjJXdFphaW1nbWFxMGF3Nzdmb1dK?=
 =?utf-8?B?U0FSVXRxdmIvUTJjSHpDUXBqYmV3cThQTlZnT1dFVmc3UEZuTXdDNmxvQU5Y?=
 =?utf-8?B?YlFjVk8waG5UaE5GcjFNajhSRTQ0a280UU5Xaitnb0tMaW5EZHBwV1cwMmdZ?=
 =?utf-8?B?d3NicXorTmg4Z295U1Q5SjdtaEFNdU1KQms5TVk3enQ2RDVFdnZ6a0hpc2lm?=
 =?utf-8?B?eVlCT25zTUM2ck9oWFhNaXNuczJTZmVHZlg5MC9LblpuWUcwOWVPMUVUcEJU?=
 =?utf-8?B?UllvSjRES25rMGpGWHZ1d2Y1Q3ljMEwxWStHM3JVQ2RxMnQydTNERm42YVdY?=
 =?utf-8?B?MGI4bllPVDA5cDYvYzdFWGNiV3UrVnlaYndWanFBSlhwUDM5Y0ZOODdNTWlM?=
 =?utf-8?B?c0xtUWRzQW4zM3IyTnRpU3l0b1p0SkxlSjI3QmV3OC9KK2JDL2dYbXA4MzNn?=
 =?utf-8?B?NmJ5ZC9sanRuaGlLZlVxSkljaWR0dFgvcGdRLzVoa3M0TGtyTjA5MEo0VndH?=
 =?utf-8?B?WW9rZXVvZ1NXV0FJS2tlc0F5QVVkNyttV2VZYjlFU28wblc2SlZ2VWwvb3F3?=
 =?utf-8?B?Rk1pR2RwRVRvTDhGRThjOFVRM3FWUW5KWVZIdHdkRmRyMWNBcE03aU9IcUVJ?=
 =?utf-8?B?bktIMmozVmwrelRwQ0VOSzRRb2twelJXcFhRS1dHS01WUUhhMlgrMXdUd3ZZ?=
 =?utf-8?B?aUphS2orNjl2TUYrbHNjQ0RmbDFmeGhGeHUyU2dxZE5ScHRzeXFReHRCZVEz?=
 =?utf-8?B?NUErRk95a093bldTUElNRFVhS3o3OTY3bU5ldmFWLzJyMGpJTFVTbmV2bHd5?=
 =?utf-8?B?bU5TbldIajc3SXhkT3Z4dGJEWld3SDRXQlNuK2xBK21FSWlZb3JKTEJzakxH?=
 =?utf-8?B?cUkvVUtqUktSaWpaNHFTTXNkR25wZG16aTA0K0NKZ1RndW4ra3lmZW1kSy92?=
 =?utf-8?B?cUU2VzV3ZCtPZVJNZmJYZjluNm8xejV4MXl2U2EwMGhBNGhJUDVKRVdRYmY3?=
 =?utf-8?B?YW5yQjJmeHBTMnhsMGhMQjRsb0tuOE8wZlIxTDZwUnNEejJtY3lZZ0tQUzRa?=
 =?utf-8?B?cjd3b0F6bFo1eWkxWW9lUTRPMFhmUzNSTmFCY1dVeTFOVEhmR0NyS3Z4TGx2?=
 =?utf-8?B?SGRTRHdVM1lGZ082SEFIb0pSd1JwVWZWQUIxeEVmSXNSZjZkOFVuT2dhYyt4?=
 =?utf-8?Q?u/mKdTj133ir924BPxyNOiKCidbB1bMp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REF1WlJJaUdwb2Z1WEEvRGlnWUplRlJVSWdmejVURStybTFBUWIzUFg1UmFN?=
 =?utf-8?B?cUdMSTZ5a253MmFtVWV5dmEzQ2ltb2YzV2hZWURDTkIwOCtaYmxBZW1xUjJG?=
 =?utf-8?B?ZGJwZmVhR1pINUtiVHlDcHFJWVJaQU4wcFJDc2MzVm1EUjdmRHBVK3F0dS9V?=
 =?utf-8?B?ZEtuLyt0cVZBRmx5ZE1TcWtmbXk4USttZ3hNMnNVL3BMNmZvYUZ6VWVCcU5N?=
 =?utf-8?B?SnJTc0ZEaTlKZGhlN0dIWUZGRkdWZGdFYnQwRDFwdnQvcnBvYnRIS21HNTh2?=
 =?utf-8?B?SnpzY0hqWG00b3JxNGRwYWxudU4rdDg3SVVTZUlQVStuQWhVRGNRQU5jQUF6?=
 =?utf-8?B?WmRlNkpmbXBxU0tCZjRtRzJhLzAvUU93djFQOVVZOU9HMWtMcmtZaS80SEJ0?=
 =?utf-8?B?L1JyUDBQdjFZa0srakpEUS9ZOEFHQzhhRlBpejZTMHRTL1I4aElpMHFyUyti?=
 =?utf-8?B?YWJ3UzhLWEQ3RlNhVDQzOEpDZjM1NUp1SVJBMk5nNW1NNzlaUXdzcFhaMG9F?=
 =?utf-8?B?eG9jWnFSQTFFQU1OTzRaTWNLMllPU1BJT2xkV2V3eTdQUU02Ty93NmdIc3NQ?=
 =?utf-8?B?dUN5OE56Q3k1YnRsV2dwVHc3bHliKzI2d0grdHl4UkhrMXJFYmNURGNEd0d2?=
 =?utf-8?B?VHpSS2pwTDFxZWRnYWRwYVFHUW1ZUUhqUm1FSS9zUllSd3BSM3hLRm9ZZk83?=
 =?utf-8?B?WE9SV3BqZHk4VVVZYmNuYXBrWlgrY1NqakhkcWZkQUdLaTNETXR3VERzcFVk?=
 =?utf-8?B?dysvclU2aGwyYVd6aVIrN1dlb1pSeXJYVityQTY2RFlSRTBMU3hINVQyUTIz?=
 =?utf-8?B?dFoxZElmMnhSM2xJajU0MElLZnZQSC85TzAydU5iVjl6VVNyQi9ub3E3cEQ1?=
 =?utf-8?B?YWJvMktjdkVIRDdCbGIvNzR6NFBDYVozczNSdnBFVnFIeXJWNDRqWHJIeERl?=
 =?utf-8?B?QUc3aE1aUDhxNFBtdEVHbk1mck1ZaUxkbEIwSW8wMFV0elhCdmFqYmlialU4?=
 =?utf-8?B?c1FFM3lJZlh1Ym5FYUlzQTF5alcvWnhmRWV0clp5elZCSkE2bVBPeDVIaGVM?=
 =?utf-8?B?bzNHZGNhb2dxWU5pckhUK3dzcDFhTFVzSnFkUi9WdDN6Rmw3YlYrMWlMMERx?=
 =?utf-8?B?UEIyaWZndm94MVpNWlBtc2pPNGtTT0NOaG1vNzBMMmlwNklUd1dncElHM20z?=
 =?utf-8?B?NXNFWDQzNGhBK0hJY0hBRnBMQkUydWplSW9Yc3JvWVdyaUc5OVdpUll0S25z?=
 =?utf-8?B?TE5haXVmaWc5SXF0Y1MzR0pOeGRYT0JYdEhacGUxY2ZMNlJzclplZTZmV0xN?=
 =?utf-8?B?NFgwMTVGRm83MW5LK1JYUisrcy9ESHBQd0pjNWw5RHU5TlhmdExacEZkYThj?=
 =?utf-8?B?SXhHTkpHaUtVVkxtbmNWQ0JGNi9CMlFSTHdRRGZvall2RmJkN0s0b3lQdjVG?=
 =?utf-8?B?dkU1RWNWaGxLOFJncGxVeXJEcE41ZXRmUjJvTTZIN01nVllZQW5QWk9kSmVT?=
 =?utf-8?B?cHpDR2ltSlIyWlFsdHNqdXgvU1h5dVRlcWdCdW42d2d0VzlKRlMxSkhSa09y?=
 =?utf-8?B?N3RXRWNUbHBvdGtMMDcyNTI0UlNxbFZvV1BjUzBpZ1FSMUYzV0dzUHRVRHMy?=
 =?utf-8?B?bzhRSXFDQTJjais4S2ZUVkxna20vSVR5eE9vS0ljNWZiVUl6L0oxOG1ZTXBS?=
 =?utf-8?B?cHFKZDB2d2U5VTZEZ2VCbnJGNEtqTGFiK3BnSXFDN0pFUVFoQnlKbFpTT3Bh?=
 =?utf-8?B?ejdIc0sxOTk3MVl5bjFYbTIxWGkyZzdkZlJWanZnNG5JU0N4V280ZUM3N2da?=
 =?utf-8?B?Vk9JRG1BT2Y4ak9TNDdVNDR3RzBWeGdDWUdXNzV2cXJBL1RBMWpyWjJNeU5o?=
 =?utf-8?B?SlJ3MVBTcnpTZ2pWWS8yWWlBNnNtbGV0SC9mclByUWo5bDVvWHVoaG53UjJK?=
 =?utf-8?B?OTJRMldNZWlPYlZpaHV5eGZra2JxSlFVekRLRlhBTzhqRzB6ODR6My84Uk1t?=
 =?utf-8?B?SmhpUktlVFk2dVhCd1NGdEpOWHZyUXVEbnZmZkdJNDRPWHRXcWp3TE9WK3dG?=
 =?utf-8?B?ZXFQZnNCQ0NlaWtJTy9ZSmJmMDhxNkFuUHNxQTlPVXBRU2tqYjhoRnFrZklJ?=
 =?utf-8?B?Q0ZIVC8wQk5tSXFnY29kRFBWc29Ub2RHanExWkJ1TXdacWhxUkJ0OEFJOStG?=
 =?utf-8?B?dHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 566601ed-0996-464e-563f-08ddff7cf6ba
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 17:23:53.7950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 66w9d2UkKihEyL0Qjoz/DeGREDpabPeYa9dHQYICSM+jGRKXIEhms4G/f1/DP8aArKJ+zAPjylan6jX0UT8b5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8562
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

On Mon, Sep 29, 2025 at 10:12:31AM -0700, Matthew Brost wrote:
> On Fri, Sep 26, 2025 at 02:36:31PM +0200, Philipp Stanner wrote:
> > drm_sched_job_cleanup()'s documentation so far uses relatively soft
> > language, only "recommending" usage of the function. To avoid memory
> > leaks and, potentiall, other bugs, however, the function has to be used.
> > 
> > Demand usage of the function explicitly.
> > 
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> >  drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index 46119aacb809..0a9df9e61963 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -1030,7 +1030,7 @@ EXPORT_SYMBOL(drm_sched_job_has_dependency);
> >   *
> >   * Cleans up the resources allocated with drm_sched_job_init().
> >   *
> > - * Drivers should call this from their error unwind code if @job is aborted
> > + * Drivers need to call this from their error unwind code if @job is aborted
> >   * before drm_sched_job_arm() is called.
> >   *
> >   * drm_sched_job_arm() is a point of no return since it initializes the fences
> > @@ -1038,7 +1038,7 @@ EXPORT_SYMBOL(drm_sched_job_has_dependency);
> >   * submit it with drm_sched_entity_push_job() and cannot simply abort it by
> >   * calling drm_sched_job_cleanup().
> >   *
> > - * This function should be called in the &drm_sched_backend_ops.free_job callback.
> > + * This function must be called in the &drm_sched_backend_ops.free_job callback.
> 
> I believe both the existing documentation and the new version are
> incorrect.
> 
> Also, the free_job callback is probably misnamed. This ties into a
> statement made during your XDC presentation today that confused me. The
> DRM scheduler only holds a reference to the driver-allocated job from
> the time run_job is called (i.e., once drm_sched_job_arm is invoked)
> until the job’s fence signals. It does not own the responsibility of
> freeing the job — the driver should manage the job’s reference count and
> free it as appropriate.
> 
> For most drivers, the only reference is the creation reference, which is
> transferred to the DRM scheduler after drm_sched_job_arm and released in
> free_job.
> 
> So, I think what really needs to be documented is this reference
> counting transfer. drm_sched_job_cleanup is actually associated with
> drm_sched_job_init — meaning drm_sched_job_cleanup must be called if
> drm_sched_job_init was called. This is typically handled by the driver
> through reference counting of the job.
> 
> Finally, I think free_job should probably be renamed to something like
> sched_job_put to better reflect its purpose.

Jetlagged - s/sched_job_put/put_job/

Matt

> 
> We can discuss this more in person on Wednesday at the workshop or grab
> in the hallway.
> 
> Matt
> 
> >   */
> >  void drm_sched_job_cleanup(struct drm_sched_job *job)
> >  {
> > -- 
> > 2.49.0
> > 
