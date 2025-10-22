Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7E5BF9965
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 03:15:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E85A10E004;
	Wed, 22 Oct 2025 01:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KyrZAVcK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E45AD10E004;
 Wed, 22 Oct 2025 01:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761095727; x=1792631727;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MNrULRVNr8EO3UFTXHMPFcotbpweDwDzP5iGn4qvGbA=;
 b=KyrZAVcKcBTEvWuVD/ZZS+VI4+xrc2oFmqnEQtaky0uOM/kRQr5+2/IQ
 rcxLqdQxaQ68y7CBYVx2lWPoI8R0DBmc9ce6pIeqz60dfWoj0iS2sqDqC
 5R1Hof6OByrueJOkO1RVspj476yudY4Q8b2Z1TqwICHc9wWbcOZHSIebc
 BQjI0NbDaXjOXRj+rl9pKOAhvPoIaH9Gq7ehX0TbslFhpGIYhKpADq4px
 g+P7KCIXRcfek+ru2nitWraltGxP7ZUk9k1FDTbOVEZH1B+SnjBcpGZM7
 OvG7OOdDkyA2VjNQu1jl/QzRYCb3aau56tizu8rJjpnJCDedfgOBqzTZN A==;
X-CSE-ConnectionGUID: kIh9SrbkRUi6XDGYDE7A7A==
X-CSE-MsgGUID: SdyinAReTZ2msJp5HtfKhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62442273"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="62442273"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 18:15:26 -0700
X-CSE-ConnectionGUID: /Gxl5cTCRXOehjbnPUwSMA==
X-CSE-MsgGUID: g0SN6T0SSMyvh+5lsxipsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="189013312"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 18:15:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 18:15:25 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 18:15:25 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.51) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 18:15:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MQaFLa2m9HrPzSTDePAjn99URwhMtfCrpmz31QzidLuRyyc9LiBcYyMGLqk/oZ2XZKTXtailxfNCPi63Um1e9Q5LPUM73LbS8h1bULh6M1YKzmSQHo61XufQzwSkoPlJTwwscCvSO60DZHZul2DtR39iAPvjA0IR1uej1y4mhMh5U677+y4I0aedjNYMy3PjgAePjxhF5Ymik0CEz5I0lH/cHpZG8PsDNVV5KxHw0pVQFl7JjA80Mo3lf5PYL8b+iTK0+F8xmG9OVYy8ZRGAbr4WGI5H+qlRSx4wGT/rOcJKgbw/zHN/MOPZ8Mm++gqTha1SMTW4WfDgor5J2g7WRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mr0AKq07++c2IfNgnaCn3AWEGAGAklgZJwKICI+9Ohs=;
 b=oJ6HjYl7JrR2iERN+L7FJ6+UloK3+PlfyfIXWnGo/PULxFKaoqZ7EAf90cFR9HWLLO4fAnma6bL4LdlTy7v47maf4F3ScMCPszpDzlEcZj3BoWLT4mFmFkA0r8y1T8qKdwcxbSS7OIKQXUbhuZNrXWc+6OZJDQdzXHi8ZgzQRJEdYlDYstOM3uunIFh2RSANgRKp3XNMfsqT6Oqj3jAQ3Nq7De/bEv+rp2APY/DZ1IhBps0SXKoxxSQH7213LXBevGTEbXR0kFjLavwYZMbWAP8N4epRB1Gs3w9Q+J6Cno4Blh/0e8KBp18/R/ZMbMKXUZid+y+f8b7zghlu+9adUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB6445.namprd11.prod.outlook.com (2603:10b6:8:c6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 01:15:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.015; Wed, 22 Oct 2025
 01:15:23 +0000
Date: Tue, 21 Oct 2025 18:15:19 -0700
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
Message-ID: <aPgwJ8DHhqCfAdpk@lstrano-desk.jf.intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-27-michal.winiarski@intel.com>
 <20251021230328.GA21554@ziepe.ca>
 <aPgT1u1YO3C3YozC@lstrano-desk.jf.intel.com>
 <20251021233811.GB21554@ziepe.ca>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251021233811.GB21554@ziepe.ca>
X-ClientProxiedBy: MW4PR03CA0035.namprd03.prod.outlook.com
 (2603:10b6:303:8e::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB6445:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c0377e7-83ee-42f0-8720-08de11087970
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cS93RWcxNFA3enVGK21kVTVNMkx5ajF3R0Z2dHBmTHQ2QmV1UEphZG45Q3Fu?=
 =?utf-8?B?K0ZaR2lKWm5rMnFnbURjQmRVWXR3RlVkTHM1VXVDOEFrcjJHZjB0Y3QydDRG?=
 =?utf-8?B?OXRpNnBJMExORnY4VHl6U1ZzWjJ3NThIZW5rNW9oNmkvRk1mVWVwMUd6NnVt?=
 =?utf-8?B?Y00vRnlScVpoVzhJM3VQZit3RGlvVWluSjlodkozOGRRRXF6R1NLc0tiK1Z3?=
 =?utf-8?B?MlVrWjkxMml6OGc2aVFZY2h2UXFzekhMQWJ4dWRvVWUrNmdIV2l1aSsvaXZ3?=
 =?utf-8?B?dk5ybjBBRHZDcE5rRVJQM2Nma3FndVlJdUhSTjZ5TUpLTGx6TXFFaWRCWmM2?=
 =?utf-8?B?Nk5OZ2hTbTRiamVwSzNJTjRlLysycVVmTG52bm1ndWNDSXhROGZ6R0tlNlZU?=
 =?utf-8?B?b3l2R0VSOUF3TG9PeklxQXdlaGlwQkg4b0gwMzhqaC9La3JlcFEwOGRCdlk1?=
 =?utf-8?B?V3FoazhRc016NEM3NnB2NVVMMWtJYlB1ekM3R1M5WnA0Y3NFRWI5V2lINGZN?=
 =?utf-8?B?MGRUUTl2YU03NzYvRWViRTYrRlM2UUdmZzFhcE9tTEFiMHhDbndLbllURDNp?=
 =?utf-8?B?ZWdFUmFmT0ZjaHpTb3VObStQcjZzcytONDZhQ1B2NERGSG9rSmhVekV6dTIr?=
 =?utf-8?B?SHhPYk93U2tMRlFTN3NvSHQ5R1hRd3FOYXV5WExyK0FXRWpBd3hsRDJzcTRK?=
 =?utf-8?B?Z0dDVVRUNVZmVlJib0F1M08xcnAybUozeGNSTXFZK1Nac1RTY3R5MlF2Tlh4?=
 =?utf-8?B?NUx1N095dEtZL2RqOFlTS2c3anVIa3Rnak0rcVBmSllPanB6YWFUMWJaZHQx?=
 =?utf-8?B?bWplcWtuYUdDTlVjQm55Q2hsQ3pIYWNzeGxOcHQxaUFETnpkOEh1cEgxUmV1?=
 =?utf-8?B?QWYxOGpxR1dNZm1zYWxxZnZxN1BpbGdiLzViazFEZTRLWXYvSS9BdmFPV0RP?=
 =?utf-8?B?dFRYejBzU2pXV0J4TlIrTkFLbGpKNStJZzVhRnRBc2JQNU9kOGhTZ1h5WEds?=
 =?utf-8?B?azdKcTUzaDRIRGlhV0ZsUUtvSlJSOU9tUmRjdmZCUWt5bkFVU2RHbkhLVEQw?=
 =?utf-8?B?Z2RSaXRZWjcyMXljY0p6cGl6cGFiTTJiSXhWblE1K1pkdDB1QkxiSzloZXMy?=
 =?utf-8?B?ZW1ocWhNamI4Z3FCelBQR01qTlM4a3YraVNMeVZCUzI0VFd1UVFJbFNJL1hr?=
 =?utf-8?B?RmxxdkhQY09hOVRyek9Xa1IrQ2ovUHYwbEcyUk9WcTZXb2FsVHlXUDNZVTZ0?=
 =?utf-8?B?dmNhYWlYUlo2alpleC8yZGRSN0xkQXJsNkVQZzduOHNadTdnbW1IVUJhai9Y?=
 =?utf-8?B?T3BXd0xRaXZtRG5wbmkvZWhuRGYvY2NNYVRTbmJRUXIxQjJEYStDbVBQM1FJ?=
 =?utf-8?B?bkFSZWgxNEozZTNOMzJXR3JsTlV3UC91dWg2UGVZc3NDVi9ISXJhS2xKVHB1?=
 =?utf-8?B?cHNNbGR3SU1mejJqQ1cxNVRYWmhQM2FRSkJEZXVSRkJ1VjZKQUtTK2dzRFR1?=
 =?utf-8?B?UDlHaGFqN3NCaTRGRFZRMVRFRURoaStOQ2NVVzEyaFo0eCtEN1pKNXdMcjVU?=
 =?utf-8?B?VFlGaHY4U2NzYzVPKy9UYjgvK1czdWtZcGxGS1U0ZVhhOUUyRW5zQVM3S1RR?=
 =?utf-8?B?Wk8rUXdCWmxLaDdyd2lTMXREWll5WU9FQU8xc3FmelEyUE5WLzJCbkNjeUtB?=
 =?utf-8?B?MnNLOGJ5eWZBNlMyM0RDVlhhejNrai9ORHpWSFppTEw1ZHE3eEhWeTVSTm04?=
 =?utf-8?B?UGZBRTZrVkF5bnEvMVgvVTVWdzJ5QlVXRHpMekl3RWNQaHd0M3pKMDFKc215?=
 =?utf-8?B?RWIvNDBFRDd4cmdBYzc5dkRPOGVIWXdGZ1gvSlJZRCt5RTRUVkE2ejBvOUQz?=
 =?utf-8?B?cmtIcXZQbFdNQXkzdlJLemRkQ2JKYTlLYjhHNy85Vkx6UHhVck02VTlncHl6?=
 =?utf-8?Q?IO3SwOKujKP9IplP22odswAxbxF5v5CG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2loZEMyNmhoLytlbnJ0MVlSZkJ3eTl4TjBMUTBpNlliQzhTcWx4S3p0UW9R?=
 =?utf-8?B?eWk5Q0lsQyt5ZFBvTVBIMHhFb1B2OTBxcnBzanF1bjJWN084eEpHUWFnZTZu?=
 =?utf-8?B?eGk2Z2Z3WVdLcXJBU01icTV1a005TUh3NzdoVEF0dzVRTEQ3dUtjYUZocDVI?=
 =?utf-8?B?eDdFd0FmalJwZEs5SHJIWSt0YTlNbXZocW81MTlEUFh6cnRFSUtON2Jybjk0?=
 =?utf-8?B?QW1UcWlQTkRRYkVUclpra1lQVUZzQ0Q3ZnhNZnpPZlFnSmpveHVNaEtyVCtE?=
 =?utf-8?B?TVlaQzNtMVZUUkxxd1ZxcHpBYll6WDMxamE3NU03SkNRWTBCZ0o4SWMwT0Vh?=
 =?utf-8?B?bUl1eFpHOUozVmJjZ2RlV3dma1FGalZQMURxSVZ0MFR0K2NnR2RyVS9rZHF0?=
 =?utf-8?B?MllGQlMyRWlpNm0vTEdhbDZsdm55V1hlY2xQbnp3L0ZuYVp5SzhKTUkzVCtn?=
 =?utf-8?B?TXAydnVLNDFWRUdRTU5qck5XUW1yalM1VG9VVkVJbVNNMWRjSThqNlNCbkZO?=
 =?utf-8?B?QmlaeHBIL2Mxa3BydmlOSXZSakd5cUNxckl6Z0FlZE9xMlk4Rk1zTkJlanZt?=
 =?utf-8?B?Z0UwTExkSk5lSTUreU5jU1VyUUYwWmJJdWhDWmNJWkY3ZE0vUTZSQTNJK3BS?=
 =?utf-8?B?Q1V4V25SWnBFWHFNWlZFK0Vscy93a2tqSWxDenRIZGdoRWFsYUROMDgycjlv?=
 =?utf-8?B?cWhLWFA3VmNlR2tIT2tlclFYVVlSblFUYU5GSHdkakIxdHB0NlJUYTJ6TXRO?=
 =?utf-8?B?eFErTUVyNjRPbXBrTWRoUUthY3U2K3hmSHdGV3FkUjkwVGQ5TDhBN1ltU1Va?=
 =?utf-8?B?VFg0YmpqQkZrT1VuK3ExZlNsbnVzYkFidVBUL0V0YjVtNURsaVFxazJTNzBC?=
 =?utf-8?B?S3N1NnIyaENPTTNVZjBBcXZCNkNGM2hvUkJvWHA2eEF0dnZGNUl0a0NMZTVT?=
 =?utf-8?B?R0tkQVc1VjZHYUp2K3U2UFlhVjlJSnJBZU10Z3diQzN5VnRpZHVpR2pZckZQ?=
 =?utf-8?B?QStaOXdUT2EwT3lYOVovdzYvUDB6c1RxK3BHdE1GVHFxellHZ0pEZ2ZNN095?=
 =?utf-8?B?SEpOSHo4Z0xQS0wySWk1OGRETzZ3ck42K2I3OU8zTCtjdlUvWEZ3cG15dW5X?=
 =?utf-8?B?cjRyQVpLMUtHK01meFlJa0YxTFFQOEhmcnpzMW1hOG9DNTdLaFhiRnhxUVBE?=
 =?utf-8?B?RTBFY1hYbjRwY3BYQmpsUXVpZmx5ZkpYVkg2akJMaFpLdlhFS0JOVitWbkh4?=
 =?utf-8?B?N1o1d2M1OGwxM1NiK3k3WitDeFk0dnBvTkw5VmhwbVBnTi9kTXQxbXdqc0J6?=
 =?utf-8?B?OVFHYnJ2ZVpPTm9OMVd5WE1QUGtsRkhZWWdHQ0I4UXVIUTI3bnBVNFBaY09Z?=
 =?utf-8?B?WDlHcFB5MXlpVkFlNWViREZYU2lHVVpBVXVqdm1UMldSNXVnSEVmU3Z0aTJH?=
 =?utf-8?B?bDNPRHJ5WDVYMDg3Y2JrU1E5UERLRjFuNXlpQ1I4RWJsVm55R045RVp3RGVX?=
 =?utf-8?B?UW5VS2tha2ZEaVYyc2dzQ1UvVGRncnRidWU5eVhoT3RwMGRUR01uaEVnS2l0?=
 =?utf-8?B?bnlsQkpjOWw4Q2hHdVVSdHBtUVJjVVVxLy8wZS9DUEdySjZuRHQ5Qjdjem9T?=
 =?utf-8?B?Sk4yRGxLQnlRYmh3TE13SFE1VHVYcU5EMnNuT2pPOVNFVjhBajFDbzFUZy9B?=
 =?utf-8?B?M0VURHhvekhIbEZhRHYySkEvOFptamE4N1pYYTJlK28wLzZESEhpTUY4UFVk?=
 =?utf-8?B?U1psaVMvVFJleGRHUGJUY1RjMWk5WlM3ZGk4Y1B6enM1RmZyTzFlSGlmOEd0?=
 =?utf-8?B?ZVZOSXNid1RrQ2pkVHdqV2NBcGpVZ3B6Nm1ZYzVwczMxaUpiOGc2K01UUUx2?=
 =?utf-8?B?Q1ZGaE1Ld1A2SlA2S01Cakdpd0xoQTFxZXA3cEdhYVZCLzNObVhWS0xlekNk?=
 =?utf-8?B?Q0JEMkxaVUZCSnZCYmtBeS96TVZGSHBjNUt6RUpEUDJzNHVrTTU3VzZHdi9N?=
 =?utf-8?B?R1dtbTBlNThYT0JBaGhFbjYzY085R21GekpEVjBCMHJtOFVqUjc2MjN3MUFp?=
 =?utf-8?B?ZkkvcFY0WmJXUmJ4b3J0cVBXNVRKbWxCMTJzazRZaDc4VkNIOVhCcVFpNlJC?=
 =?utf-8?B?amRZaThhbEphTk1ZcUtLRXVBVTBySWtXRXdvK3RPNitPK3Z4bXBUVGhzeXFK?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c0377e7-83ee-42f0-8720-08de11087970
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 01:15:23.1521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Jt/B9Cx9yCRipbwETv4wfHTcbRoRuEwZkc1W53MDlyuOxQTGZ9E7CCKnbSc2ipSJZU06xUIG8URqDPnBhz8dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6445
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

On Tue, Oct 21, 2025 at 08:38:11PM -0300, Jason Gunthorpe wrote:
> On Tue, Oct 21, 2025 at 04:14:30PM -0700, Matthew Brost wrote:
> > On Tue, Oct 21, 2025 at 08:03:28PM -0300, Jason Gunthorpe wrote:
> > > On Sat, Oct 11, 2025 at 09:38:47PM +0200, Michał Winiarski wrote:
> > > > +	/*
> > > > +	 * "STOP" handling is reused for "RUNNING_P2P", as the device doesn't have the capability to
> > > > +	 * selectively block p2p DMA transfers.
> > > > +	 * The device is not processing new workload requests when the VF is stopped, and both
> > > > +	 * memory and MMIO communication channels are transferred to destination (where processing
> > > > +	 * will be resumed).
> > > > +	 */
> > > > +	if ((cur == VFIO_DEVICE_STATE_RUNNING && new == VFIO_DEVICE_STATE_STOP) ||
> > > > +	    (cur == VFIO_DEVICE_STATE_RUNNING && new == VFIO_DEVICE_STATE_RUNNING_P2P)) {
> > > > +		ret = xe_sriov_vfio_stop(xe_vdev->pf, xe_vdev->vfid);
> > > 
> > > This comment is not right, RUNNING_P2P means the device can still
> > > receive P2P activity on it's BAR. Eg a GPU will still allow read/write
> > > to its framebuffer.
> > > 
> > > But it is not initiating any new transactions.
> > > 
> > > > +static void xe_vfio_pci_migration_init(struct vfio_device *core_vdev)
> > > > +{
> > > > +	struct xe_vfio_pci_core_device *xe_vdev =
> > > > +		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
> > > > +	struct pci_dev *pdev = to_pci_dev(core_vdev->dev);
> > > > +
> > > > +	if (!xe_sriov_vfio_migration_supported(pdev->physfn))
> > > > +		return;
> > > > +
> > > > +	/* vfid starts from 1 for xe */
> > > > +	xe_vdev->vfid = pci_iov_vf_id(pdev) + 1;
> > > > +	xe_vdev->pf = pdev->physfn;
> > > 
> > > No, this has to use pci_iov_get_pf_drvdata, and this driver should
> > > never have a naked pf pointer flowing around.
> > > 
> > > The entire exported interface is wrongly formed:
> > > 
> > > +bool xe_sriov_vfio_migration_supported(struct pci_dev *pdev);
> > > +int xe_sriov_vfio_wait_flr_done(struct pci_dev *pdev, unsigned int vfid);
> > > +int xe_sriov_vfio_stop(struct pci_dev *pdev, unsigned int vfid);
> > > +int xe_sriov_vfio_run(struct pci_dev *pdev, unsigned int vfid);
> > > +int xe_sriov_vfio_stop_copy_enter(struct pci_dev *pdev, unsigned int vfid);
> > > 
> > > None of these should be taking in a naked pci_dev, it should all work
> > > on whatever type the drvdata is.
> > 
> > This seems entirely backwards. Why would the Xe module export its driver
> > structure to the VFIO module? 
> 
> Because that is how we designed this to work. You've completely
> ignored the safety protocols built into this method.
> 
> > That opens up potential vectors for abuse—for example, the VFIO
> > module accessing internal Xe device structures.
> 
> It does not, just use an opaque struct type.
> 
> > much cleaner to keep interfaces between modules as opaque / generic
> > as possible.
> 
> Nope, don't do that. They should be limited and locked down. Passing
> random pci_devs into these API is going to be bad.


Ok, I think I see what you're getting at. The idea is to call
dev_set_drvdata on the Xe side, then use pci_iov_get_pf_drvdata on the
VFIO side to retrieve that data. This allows passing whatever Xe sets
via dev_set_drvdata between the module interfaces, while only
forward-declaring the interface struct in the shared header.

Am I understanding this correctly?

Matt

> 
> Jason
