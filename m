Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7600BBC608E
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 18:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B30610E86D;
	Wed,  8 Oct 2025 16:35:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KRR3Tt5+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6AE110E86D;
 Wed,  8 Oct 2025 16:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759941321; x=1791477321;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dZjXo9VUSHlsloUh2r3Cxn0Xh5kkx7GhSvzjP2FKrBg=;
 b=KRR3Tt5+DSA5ir+oxeKPQjG/OqbDV5pMU9rIKGxpJC91TD42IUDc3ZWo
 fn3fAI2dJRiBOGm5qz04ZQ9gyqCFTtDwLucdr+Z/SteRDDz+XGTL9wj1H
 4XRPnwr9K1wgYwtqO2mZs1mQg/NwPkuaTUrGv4zb0lG4oqCSc+TNBm2jQ
 0Hy9hZT4OIa4fWQgss5uzQ7vMCK4fqDrcSdxt2m7mB5bCdUrJiJIl1lOR
 87Nxla+EEQQegHBCNEeLt6BE9OEhakEI/eS4ZxWgDBazSIclujT9OLOdC
 v7JCYkJ5Kir5CFxMHlNaarYjMOsuZHLLPsqbIV6zIn2T8pi0CU9ICzFxw w==;
X-CSE-ConnectionGUID: tc30IYXgTTGZ8c0+sFQqSg==
X-CSE-MsgGUID: 1V0RIHIOQuaHrlFomNx+Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="64757557"
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="64757557"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 09:35:21 -0700
X-CSE-ConnectionGUID: 0K1cOfLhTJ6M4ZL5WEyRBg==
X-CSE-MsgGUID: 7Iop5JzuT7ayXsvrzYi7qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="179741071"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 09:35:21 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 09:35:19 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 09:35:19 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.38) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 09:35:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RqcRIw7EA04kKMD4Je39U3sjC2NSjH/4rkDWyYvQYbdeJHavx6RDFXcl1Onn7nRqPdYmMJ7sPN+ocnfTwgDomWgVPsT7+S07Q1HqSdgJ+5cc26TMEDWY5EMQ+aInK8IfIkhOcz1+WeixVarqcDNFKQDIPZSQkl1glMZfsRt7eMytB+Ae4rnnAnahMHXHQ/OBSDXSZibwp77du5kQRIKU+1edvyQgq8R6hPXFi0y/jyKNieqdWiNHnTBEdQHLXFxlNLq8pfvWReeWve2p1HLlVRFhvUGxU6uqZxHp24jbkaPhOoTVq4recwVTdvNuklBHvRiEg2GwDLPjBO5ItIwMdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RTmMJ/GhoKrr+59q+NEl1Meu59h80wObCXJMAjeTxqU=;
 b=SQA5XEUVEKvmpFEo6N/Nl4hym/j29AdDcAbP89cGaHPKuqQZ2llqu9kp7KDVolI0jslfEZrT9zsfYzsj1ABJy1JPn57nFk0whEMRfQ1C3aJD+X2NHRIacnm6aeQD+3GWXH48PYBYamuVwjnhTkNhfnOuBhEiLk13nI7/OfXvAv8wnLcgDNgSwfdzNkGsxGqF3TY2oKFIDycoXNvbxgMQSO6lSHMzhRmC/aDrrZNkudi7Ukcepb1XQrFI033JcetxFqLvpuW+3kBNUJP23PBYKo8XBKuWudMZakCd6ijwGd9THrcEzoPjosopG6eKd59jJFYMjhheagzMJMPDbv8LaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB7277.namprd11.prod.outlook.com (2603:10b6:8:10b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 8 Oct
 2025 16:35:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 16:35:15 +0000
Date: Wed, 8 Oct 2025 09:35:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <phasta@kernel.org>
CC: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, "David
 Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] Revert "drm/nouveau: Remove waitque for sched teardown"
Message-ID: <aOaSwJOEk1DVrQUS@lstrano-desk.jf.intel.com>
References: <20250901083107.10206-2-phasta@kernel.org>
 <aOVKt1kQlBEYxctO@lstrano-desk.jf.intel.com>
 <6ecf62805e3d3bb6007d9bf645ed10006b599349.camel@mailbox.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6ecf62805e3d3bb6007d9bf645ed10006b599349.camel@mailbox.org>
X-ClientProxiedBy: MW4PR04CA0388.namprd04.prod.outlook.com
 (2603:10b6:303:81::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB7277:EE_
X-MS-Office365-Filtering-Correlation-Id: 41ec1c2a-e8df-46d1-7a33-08de0688a93c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?REhodThwK2dScjlNL2NmeEdiaThkV09kSE1WSURnTWducUVZcWJ4M1Rvajdy?=
 =?utf-8?B?UmpLbUZoK05sOS8vKzMwcmpNMjhsREVBZ3pkdTRZL21RMTY4VytFQWxyWFY4?=
 =?utf-8?B?NXFsTUxYY1NDd0xSZ3UwdnBOeFgrbE5rcXV5bFhFRzdQVUsxNGRpeHBONHV3?=
 =?utf-8?B?b0hOeHZyTTllRDkvdWNSNEFmVC9IZ0RtVisvNktvR1pYZ0dNU1dhNFpQRzhn?=
 =?utf-8?B?Wlg0SEJEVmQrY2w5V09keFJOc3ZHZUJhKytoY3RteVRzenZYUExtWUsvUTdu?=
 =?utf-8?B?OXY1OVNxN3JVOTc1QmEzZzIxOVQ5d25DZmE3RUdHczFlQ0VMa043ZDArdTh3?=
 =?utf-8?B?eWwzeXdGSGtDN1RPaW0yay9zd2g0NHQxV3ZBNFRySnZPSjgvTG1xSHpLL2tI?=
 =?utf-8?B?RzgvMGNVU1B0OXVCeU1NUGVaWXQ3d29uY3FFMVFOL2VXMVJYYjNDOHYzZU9K?=
 =?utf-8?B?TnQ5LzZHeU9nckEwekMvbHF3SWZUWnIzU1lFNlpWZXc5VzlIOGxVNDNyS0N1?=
 =?utf-8?B?Ykl2ZnpYblprODVXU2N0SWlrYVQ3R0pYTEUxTGxjSmZNeVovaXgwbXVQN0xv?=
 =?utf-8?B?OFR5RFkzZnh1UUl6U0ZaMDJHTU92WXg0RkVNMktueTd5bTQrbEIrQWZUekxi?=
 =?utf-8?B?bEV0dk9yUnRCdGpIeG5QVzVxSnAxYmw3NGJIM2xMQnBNK2Q1MTBJOXlEQzlx?=
 =?utf-8?B?bWd0aVp0TG9ET3J3T1RmV2gyUEpuTVZtMFNTZjdXQ2RDdUp3MW13QmtRNXpD?=
 =?utf-8?B?bWNjeG9Pd2NZdW95eGNIK0sybmtKeFlpNFBiNGlTZWltczBFUmtkUytNa2J5?=
 =?utf-8?B?RXF2emlnVDFzNnI4bzA1ZTkxeitHTkxDYzRSVnhpMWZmV2dRSEcrWk94ZGVG?=
 =?utf-8?B?dzJOeGo0SDIyMUdtL0VZaFVJMUNnLzROVzcxdHgxL2x2Z1RsbnRjeUJCNUlj?=
 =?utf-8?B?QVZZc0tCY3RORFBYNmZpK1c3Y09yeUlxR1JKaDRWbU9zS2VUai8yS2JrbnI1?=
 =?utf-8?B?cHVVeUV1aTltR0VsRnVxRmIrM2FnVmpWWURhbjZMODgwV0ZMMUdwSGFpUDMx?=
 =?utf-8?B?dVUxNGhMZmExcWIwZGxzUCtadGcxUW90TzhNWTVVWUw5TXdkNUJXREx2U3Jj?=
 =?utf-8?B?TDlXRGNsNW4vMGg3Y3JwT2ZETktUemxwUkRVOG16eExPc0lKTVpNZzZQZi96?=
 =?utf-8?B?M0JLVkhReFlhS3ZNMnoxYVM1TDFKeC94WFVJQTgvS1FIa3Nrb0trM3BBSWxO?=
 =?utf-8?B?VUdrSVFybGRSWHhCREFZSVJzMGhHWTAyNnU0NzhGN0poUGhTS2gxb0FFOHlM?=
 =?utf-8?B?dHRVU2xEb3U0cFA1TmpZU1BPNVRuMG9NYXdRLzdhRlJCMzZFRmhaRXl0MkF0?=
 =?utf-8?B?VlUrY1IvYUNHcGhWeVY3bVlXK1JKMTlOMHN6cDlHckR5SFl4bWQxNjZ3TGEv?=
 =?utf-8?B?WmF3eExQTVF4YkJ1YWs1by9KNC9PMUdEaFZoZnZKdGJ4Q2k0TmcxRXVENE81?=
 =?utf-8?B?OW9UbWtTWnk0Ny8yZ3JOWWN0R0JRdGFFSVdkTy94TDMvSXFqRW1wUW52YnBC?=
 =?utf-8?B?d3FmWTlDRU8xZ0ZHN29Xdng4TEsyaER3M1QyZ0NkR3JNMU5hT1dXTHFPTzhm?=
 =?utf-8?B?enhrWnpxY3RER3VKWktaL25nZDY4NzFCNlF2WGxyT3lLelZGTzQzcUh4U3pR?=
 =?utf-8?B?UDFxVm85RUFRcy90dEF0MGQzeklZS2N6RU9RNndrLzFTOWUydTEyQ1hwcjgv?=
 =?utf-8?B?Szl0dHFHdDhBd2ZaT1hNVEYwaXpuN0QwQmJpSTFGRk15S3ZZZ1VCSUcvWjdW?=
 =?utf-8?B?cEdTQjBCalIrWlppakNWWDJ4UGNSamEyUkxQNmZja0xrZndWeG1EQzRqTWFG?=
 =?utf-8?B?VmxmL0gwbTZKSzBid0dnM1VJaVZzc0JMSzcwa29FRVFSYnc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTh5NjJiSmxoKzY2SDZVa0Z2MUcycTkzbkZkMTh6V2loSkljVENCTzlIby9M?=
 =?utf-8?B?dGdNNnB0cXJ5OTBBejhTUnFHRTR5YkNEVkE4ZElGS3RwQXhZeHZxQnNTTEdM?=
 =?utf-8?B?c2FJZGZJTFF0SFdDamRRUk5WbXZrRXNoa1ZtVXZZczQyb2cvQTFpQnE3ZTN0?=
 =?utf-8?B?MDJtZkh4a3N4WTgzUThTNjg0anp1RDBOeWhaQVA2TjIrOUl2c1VibnJvYWsw?=
 =?utf-8?B?RFBkQ3M2cmlvVzNaRGY4a1hBc000SzBmc2VwVHVob0NBWUVXVHdFbXNTT2du?=
 =?utf-8?B?cFArSGR3QU1KMHcxQU0zNFV1c2N5OUhacldtNTJqdk9GamI2alkzeFoxUDZj?=
 =?utf-8?B?VFRZOHZjZEhQTnFqQlhpWTFzbWJtTmxPS3R6QjMzV3NaU2YrL1hKZHVyZ3Uw?=
 =?utf-8?B?cTJaVGphVy84b3FKWmxyTzNKUDBlb1EvSzFFQ2ZDaW1CV2Z6TS9iWUdXQUpu?=
 =?utf-8?B?WG10UTRvYk41dDR0d3Vja2xWWmxoVk0vTjZCREN2WU9NRXkvRlBYNVFTeXFv?=
 =?utf-8?B?YmpaeDZXUUN4bWRQa3JNUU9sYlBLdTR0MDBzSDlGU0FlRGo5d1o0YWVTS3o5?=
 =?utf-8?B?SkJidGp5bkZYL1diNndndGRqRE5pNmpUR08yTlNRdEJxTG1acVkrNFVTNVFs?=
 =?utf-8?B?NUhEdFVJQUV2VWtxYTYyQWRQc3VjVkpXVVVjMHJsbWRzYS9zWWFTTHdyb1Rr?=
 =?utf-8?B?QndoS0JoZGJsRXNsQjNqUmJYOVVyenBmL09xVlhpaWFVakYxbFphVjdINm1D?=
 =?utf-8?B?Q3VJMWV0MUtMM2VmOGZJdndtOWJVcURaek9XN04zVHV3ck1mY0JRRmRrZUJK?=
 =?utf-8?B?NkZJbkhjZFNXemhJZEg0TXY1NXVKeE94MkJlQlRiUmJYN2JocUNjSXF6T2Ro?=
 =?utf-8?B?YUhha3BvK2lxellhbldSLzIxbHI5YWNhQnJiQ01DVFBzemlYUEtzbFh0OXJO?=
 =?utf-8?B?VzVtYjZFeGtTaUs3dGFldVJtaGhpOG9VN2NlQUJ6eGdGOTIxRnYxTHZidk1G?=
 =?utf-8?B?NG5pMUk5c1ZsVmw5TG5iMlIrVmE1amxtaTJhbnB5ZkV3SE9GcW5md29mdzJV?=
 =?utf-8?B?L056cVlEMW15MjRmeDE1TmxQbm4zc3dSVU5JYkwrRjBxSkg1YXh1NEZmVS9w?=
 =?utf-8?B?ZGtEazRRZkdBMURJUDFxbEcyWlRxM1NqOWh4SWtKWDZvZ0V0ajZXUmFtbmNy?=
 =?utf-8?B?cGc4MDN0R2hObEFhRVgwbGRrcUxBeWpLTEtlYnArVU84bFZGUVZJeDRyT0Nq?=
 =?utf-8?B?aGdSMzArWGY0QlMwTW1DZGo3RXp3cFE1N2VwNXlxRGNLRlVLTStLMXdQMHd5?=
 =?utf-8?B?VGRjMGhwd05WRWw5Q1pYaXgvaHVXd1JIdlo2YXpTT1JCbHI2WWw0OVJ6Yk5V?=
 =?utf-8?B?QXh1VDZCZ3JzdHk0Z3dtMUF0dGtlT2wzTTI1bmlHd3JkU0tSdlA5TlJaNmpn?=
 =?utf-8?B?MjB6SFRSWHZkQmJwNUJZSlBFRlBJOXdVZVFidHg3YXFYV2psVjk4KzFFL2tR?=
 =?utf-8?B?bHVwQ3ZLVkRsUjlzWnZVUUd4SmE1TEV4UnFOaU9RaGJtSGQrZzhJOUZuRi95?=
 =?utf-8?B?THh5ejd6SU13Uk1rczBraitnb3RWdHNLZGhCRFZoN1NwTGRSQjhEa284SU5y?=
 =?utf-8?B?Q0RZY280SDRVcmt1V0pDQlpTMnpqWlhiOW41K3ZUYUdKakxmcVdiWVM0U0NG?=
 =?utf-8?B?VnM3Q0hIaVVmUlVBQ3pwNEdOUjlnWU1iR3Q3aitkR2ZSaytHaFlWZVoyaE5T?=
 =?utf-8?B?RUkvWnJQK2cwNWFqWUVLblhmTmdjSnYvdzIwWEp2VTdnMlBZOEJ3TXBGdjlp?=
 =?utf-8?B?ZzFnOEFjcjU1ZFNITEdDVUxkOFhLaUt6MnN2VmJoRE4wZytBaHRTNHlJVUps?=
 =?utf-8?B?S1BMcFBpNU8xbzJQMUdSVVRHVU4rU21qcG00c3V0SHpOV3JGVndWUWlmZGhQ?=
 =?utf-8?B?bHpsRXN0M2w1emFHazFQQ2RIZ3Q3a3hsZTM2OUcvcTBhdHpLeTZxS1FyTm9P?=
 =?utf-8?B?YmRkY0pFNTlLTFBnczhvVzJlT0d5VFp4UmNSWDgvYzUrVFpwWlhRRjBhcXh4?=
 =?utf-8?B?YzFLNVdVOWtNdHdEVTVFUnlOYU40d1NiNFBYbnRFYVdCQm1DR251QzR2aEhL?=
 =?utf-8?B?cVlVcFh3Q1lvR2xuKzJWcUJaZVU2SFRKRHNsTCtXRkp3Vm02L2pHYklNdXc1?=
 =?utf-8?B?ZHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41ec1c2a-e8df-46d1-7a33-08de0688a93c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 16:35:15.9473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mtxKxRwUdoE+R9W3Lwe/rQ9p+Cy0xzAVqFXD2QxaKe3S7LDOxMMJlZiqp4t0e0VVFSD1hX1UNYfA6B7owZBzQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7277
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

On Wed, Oct 08, 2025 at 09:34:22AM +0200, Philipp Stanner wrote:
> On Tue, 2025-10-07 at 10:15 -0700, Matthew Brost wrote:
> > On Mon, Sep 01, 2025 at 10:31:08AM +0200, Philipp Stanner wrote:
> > > This reverts:
> > > 
> > > commit bead88002227 ("drm/nouveau: Remove waitque for sched teardown")
> > > commit 5f46f5c7af8c ("drm/nouveau: Add new callback for scheduler teardown")
> > 
> > I've been scanning some recent DRM scheduler changes.
> > 
> > I think we should likely revert:
> > 
> > bf8bbaefaa6a drm/sched: Avoid memory leaks with cancel_job() callback
> > 
> > 5f46f5c7af8c was the only user of cancel_job. I'm not sure why we'd
> > carry dead code in DRM scheduler unless you have plans to make use of
> > this function soon.
> 
> That will be added back to Nouveau soon. The reason it was removed from
> Nouveau was not that cancel_job() is broken, but that removing the
> waitqueue is not possible for other reasons.
> 

Okay. In general, carrying dead code is less than ideal, but if this is
going to be merged soon...

> Implementing cancel_job() has the canonical way of handling the
> difficult life time issues and memory leaks associated with drm_sched
> has been discussed literally for about 8-9 months on the lists.
> 

Also, drm_sched_cancel_remaining_jobs appears to do something slightly
concerning.

It signals DMA fences out of order by walking the pending list in
reverse, which is generally not advisable. This behavior should probably
be reviewed.

Additionally, for jobs in the SPSC queue that are killed via
drm_sched_entity_kill_jobs_work, we don’t call cancel_job.

That might be intentional, but based on the cancel_job documentation,
the job’s fence may not get signaled. Depending on the driver’s fence
refcounting scheme (e.g., if it takes a reference to the job’s fence at
arm), the scheduler-side reference may or may not be released too. We
might want to investigate whether cancel_job should be invoked in that
path as well.

Also is the entity is killed after the drm_sched_fini, the same problem
with fencing signaling out-order mentioned above could occur too.

> If we can't get to a solution for a problem after 9 months of on-list
> discussions, then we are lost.
>

Par for the course upstream. Apoligize for not paying more attention
here.

Matt
 
> P.
> 
> > 
> > Matt
> > 
> > > 
> > > from the drm/sched teardown leak fix series:
> > > 
> > > https://lore.kernel.org/dri-devel/20250710125412.128476-2-phasta@kernel.org/
> > > 
> > > The aforementioned series removed a blocking waitqueue from
> > > nouveau_sched_fini(). It was mistakenly assumed that this waitqueue only
> > > prevents jobs from leaking, which the series fixed.
> > > 
> > > The waitqueue, however, also guarantees that all VM_BIND related jobs
> > > are finished in order, cleaning up mappings in the GPU's MMU. These jobs
> > > must be executed sequentially. Without the waitqueue, this is no longer
> > > guaranteed, because entity and scheduler teardown can race with each
> > > other.
> > > 
> > > Revert all patches related to the waitqueue removal.
> > > 
> > > Fixes: bead88002227 ("drm/nouveau: Remove waitque for sched teardown")
> > > Suggested-by: Danilo Krummrich <dakr@kernel.org>
> > > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > > ---
> > > Changes in v2:
> > >   - Don't revert commit 89b2675198ab ("drm/nouveau: Make fence container helper usable driver-wide")
> > >   - Add Fixes-tag
> > > ---
> > >  drivers/gpu/drm/nouveau/nouveau_fence.c | 15 -----------
> > >  drivers/gpu/drm/nouveau/nouveau_fence.h |  1 -
> > >  drivers/gpu/drm/nouveau/nouveau_sched.c | 35 ++++++++++---------------
> > >  drivers/gpu/drm/nouveau/nouveau_sched.h |  9 ++++---
> > >  drivers/gpu/drm/nouveau/nouveau_uvmm.c  |  8 +++---
> > >  5 files changed, 24 insertions(+), 44 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > > index 9f345a008717..869d4335c0f4 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > > @@ -240,21 +240,6 @@ nouveau_fence_emit(struct nouveau_fence *fence)
> > >  	return ret;
> > >  }
> > >  
> > > -void
> > > -nouveau_fence_cancel(struct nouveau_fence *fence)
> > > -{
> > > -	struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
> > > -	unsigned long flags;
> > > -
> > > -	spin_lock_irqsave(&fctx->lock, flags);
> > > -	if (!dma_fence_is_signaled_locked(&fence->base)) {
> > > -		dma_fence_set_error(&fence->base, -ECANCELED);
> > > -		if (nouveau_fence_signal(fence))
> > > -			nvif_event_block(&fctx->event);
> > > -	}
> > > -	spin_unlock_irqrestore(&fctx->lock, flags);
> > > -}
> > > -
> > >  bool
> > >  nouveau_fence_done(struct nouveau_fence *fence)
> > >  {
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/nouveau/nouveau_fence.h
> > > index 9957a919bd38..183dd43ecfff 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_fence.h
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
> > > @@ -29,7 +29,6 @@ void nouveau_fence_unref(struct nouveau_fence **);
> > >  
> > >  int  nouveau_fence_emit(struct nouveau_fence *);
> > >  bool nouveau_fence_done(struct nouveau_fence *);
> > > -void nouveau_fence_cancel(struct nouveau_fence *fence);
> > >  int  nouveau_fence_wait(struct nouveau_fence *, bool lazy, bool intr);
> > >  int  nouveau_fence_sync(struct nouveau_bo *, struct nouveau_channel *, bool exclusive, bool intr);
> > >  
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > index 0cc0bc9f9952..e60f7892f5ce 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > @@ -11,7 +11,6 @@
> > >  #include "nouveau_exec.h"
> > >  #include "nouveau_abi16.h"
> > >  #include "nouveau_sched.h"
> > > -#include "nouveau_chan.h"
> > >  
> > >  #define NOUVEAU_SCHED_JOB_TIMEOUT_MS		10000
> > >  
> > > @@ -122,9 +121,11 @@ nouveau_job_done(struct nouveau_job *job)
> > >  {
> > >  	struct nouveau_sched *sched = job->sched;
> > >  
> > > -	spin_lock(&sched->job_list.lock);
> > > +	spin_lock(&sched->job.list.lock);
> > >  	list_del(&job->entry);
> > > -	spin_unlock(&sched->job_list.lock);
> > > +	spin_unlock(&sched->job.list.lock);
> > > +
> > > +	wake_up(&sched->job.wq);
> > >  }
> > >  
> > >  void
> > > @@ -305,9 +306,9 @@ nouveau_job_submit(struct nouveau_job *job)
> > >  	}
> > >  
> > >  	/* Submit was successful; add the job to the schedulers job list. */
> > > -	spin_lock(&sched->job_list.lock);
> > > -	list_add(&job->entry, &sched->job_list.head);
> > > -	spin_unlock(&sched->job_list.lock);
> > > +	spin_lock(&sched->job.list.lock);
> > > +	list_add(&job->entry, &sched->job.list.head);
> > > +	spin_unlock(&sched->job.list.lock);
> > >  
> > >  	drm_sched_job_arm(&job->base);
> > >  	job->done_fence = dma_fence_get(&job->base.s_fence->finished);
> > > @@ -392,23 +393,10 @@ nouveau_sched_free_job(struct drm_sched_job *sched_job)
> > >  	nouveau_job_fini(job);
> > >  }
> > >  
> > > -static void
> > > -nouveau_sched_cancel_job(struct drm_sched_job *sched_job)
> > > -{
> > > -	struct nouveau_fence *fence;
> > > -	struct nouveau_job *job;
> > > -
> > > -	job = to_nouveau_job(sched_job);
> > > -	fence = to_nouveau_fence(job->done_fence);
> > > -
> > > -	nouveau_fence_cancel(fence);
> > > -}
> > > -
> > >  static const struct drm_sched_backend_ops nouveau_sched_ops = {
> > >  	.run_job = nouveau_sched_run_job,
> > >  	.timedout_job = nouveau_sched_timedout_job,
> > >  	.free_job = nouveau_sched_free_job,
> > > -	.cancel_job = nouveau_sched_cancel_job,
> > >  };
> > >  
> > >  static int
> > > @@ -458,8 +446,9 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
> > >  		goto fail_sched;
> > >  
> > >  	mutex_init(&sched->mutex);
> > > -	spin_lock_init(&sched->job_list.lock);
> > > -	INIT_LIST_HEAD(&sched->job_list.head);
> > > +	spin_lock_init(&sched->job.list.lock);
> > > +	INIT_LIST_HEAD(&sched->job.list.head);
> > > +	init_waitqueue_head(&sched->job.wq);
> > >  
> > >  	return 0;
> > >  
> > > @@ -493,12 +482,16 @@ nouveau_sched_create(struct nouveau_sched **psched, struct nouveau_drm *drm,
> > >  	return 0;
> > >  }
> > >  
> > > +
> > >  static void
> > >  nouveau_sched_fini(struct nouveau_sched *sched)
> > >  {
> > >  	struct drm_gpu_scheduler *drm_sched = &sched->base;
> > >  	struct drm_sched_entity *entity = &sched->entity;
> > >  
> > > +	rmb(); /* for list_empty to work without lock */
> > > +	wait_event(sched->job.wq, list_empty(&sched->job.list.head));
> > > +
> > >  	drm_sched_entity_fini(entity);
> > >  	drm_sched_fini(drm_sched);
> > >  
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.h b/drivers/gpu/drm/nouveau/nouveau_sched.h
> > > index b98c3f0bef30..20cd1da8db73 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_sched.h
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_sched.h
> > > @@ -103,9 +103,12 @@ struct nouveau_sched {
> > >  	struct mutex mutex;
> > >  
> > >  	struct {
> > > -		struct list_head head;
> > > -		spinlock_t lock;
> > > -	} job_list;
> > > +		struct {
> > > +			struct list_head head;
> > > +			spinlock_t lock;
> > > +		} list;
> > > +		struct wait_queue_head wq;
> > > +	} job;
> > >  };
> > >  
> > >  int nouveau_sched_create(struct nouveau_sched **psched, struct nouveau_drm *drm,
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > > index d94a85509176..79eefdfd08a2 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > > @@ -1019,8 +1019,8 @@ bind_validate_map_sparse(struct nouveau_job *job, u64 addr, u64 range)
> > >  	u64 end = addr + range;
> > >  
> > >  again:
> > > -	spin_lock(&sched->job_list.lock);
> > > -	list_for_each_entry(__job, &sched->job_list.head, entry) {
> > > +	spin_lock(&sched->job.list.lock);
> > > +	list_for_each_entry(__job, &sched->job.list.head, entry) {
> > >  		struct nouveau_uvmm_bind_job *bind_job = to_uvmm_bind_job(__job);
> > >  
> > >  		list_for_each_op(op, &bind_job->ops) {
> > > @@ -1030,7 +1030,7 @@ bind_validate_map_sparse(struct nouveau_job *job, u64 addr, u64 range)
> > >  
> > >  				if (!(end <= op_addr || addr >= op_end)) {
> > >  					nouveau_uvmm_bind_job_get(bind_job);
> > > -					spin_unlock(&sched->job_list.lock);
> > > +					spin_unlock(&sched->job.list.lock);
> > >  					wait_for_completion(&bind_job->complete);
> > >  					nouveau_uvmm_bind_job_put(bind_job);
> > >  					goto again;
> > > @@ -1038,7 +1038,7 @@ bind_validate_map_sparse(struct nouveau_job *job, u64 addr, u64 range)
> > >  			}
> > >  		}
> > >  	}
> > > -	spin_unlock(&sched->job_list.lock);
> > > +	spin_unlock(&sched->job.list.lock);
> > >  }
> > >  
> > >  static int
> > > -- 
> > > 2.49.0
> > > 
> 
