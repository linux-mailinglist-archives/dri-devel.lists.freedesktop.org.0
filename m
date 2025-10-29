Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21315C1937D
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 09:54:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5504F10E771;
	Wed, 29 Oct 2025 08:54:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UaI0WtB+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 212C510E76F;
 Wed, 29 Oct 2025 08:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761728058; x=1793264058;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=b6vDfxK12LAUl4S/W48+Ka0ivgQ7r/Z3xz1Yew6jiOQ=;
 b=UaI0WtB+yKsZkmuHAAW7ShBJufRT70T7zES/vULwuvfUuHTlsKls7owz
 P9eXuM+oooEpYqkliM28usP2nktBcuum07W5kbcLdTXlhPx6dx24+Wdxj
 MC4q7p2TohLFE8+uzaqRa84zQw30g5SW144L8l1G24v7Fs8sTVVWqIQFL
 P4F7FW4xLomTMbJjJig17ZRuoQKfPrbovVGXrpaUa2cvMwVQsRbKwVTso
 ULrs4mAXb4Ih5DP7K4uHNewdEMK6ZK9EN9IXwoA7XaZ+DSVVDYcDDWUy5
 4KxMupSIJXo6rTkB2QS2UIe6Nz8MfGGjDpZLPeylOytDuCiDlMqXdQ7PO Q==;
X-CSE-ConnectionGUID: 990jkCTzQdSK4Wir/JIbTQ==
X-CSE-MsgGUID: wGkbiyRERC6C8MgkS32BwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63746357"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63746357"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 01:54:17 -0700
X-CSE-ConnectionGUID: 3pKFGcODSVu4elEpewvj8A==
X-CSE-MsgGUID: 9dUHleAcRJuVa7RHt/iEQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="185295351"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 01:54:17 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 01:54:17 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 01:54:17 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.19) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 01:54:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Deuf4XBBTKKWIrWH/kn7hOk/v3yu4/E8HYMVDDFlLVk+j+vQ+2g/myI8PDCPIAgBvim5aFUB3Sv7LMwtk+Ffl+91CMwQHxQmON8MFYSE1xY0wSJt2amQgECCoJq+vMWv9MQ4aXR91zcx/U+vnrByVDGC0tbm05ng0BA/1eg9Gl/SY9IwBH3VuMgbd6R8beOv7bUPRP75L7/0AxWXaOpOVtmvcF7va1XkniZgWFxZvcMbRHxWJvDCUc1unq8BAYmr7lQ4XEsWVHY/boCmnN+PpkMYuSF52vufREa1ZY3Ib0lPoucSLJRZd8p5rxyo0xFaF7z8OejYhKD34b/9hhfOYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ITLa6FvotgrVB1/bmNLWsCh6QhuSDIgnlc3QdUYzq0=;
 b=jIeSiUuRz5SZGLbjegVAwJgNuBwPhizWwYOtX0HoCyOHss0BmcHhuHGiOMxKbRhPt6dffy/uHMJDLo4IsF9Q+c916RFNTuCjM3aOWz5wtGN2vigXNqLA2qnuXCJalnkPKeFpSne+55etoAmuiH5RmhAZKF9sImep/J0pKAs+U68ZBov0IpIjsifOJmWJsywZRwkRCWZA2FKPYeCx1MvqzgbV0j4qiehaUYUtpI5pq3wx+/FbTz8MSrzigTAP9hrVDcYViDdlDsWug4pVeCNHcBvpsInncdJTCm7jDpSWGt9U2NkJAey2JQW5w/T1hGwd05+lfbaYI1hVkl2m/0JMqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SA1PR11MB8352.namprd11.prod.outlook.com (2603:10b6:806:377::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Wed, 29 Oct
 2025 08:54:14 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 08:54:14 +0000
Date: Wed, 29 Oct 2025 09:54:10 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>
Subject: Re: [PATCH v2 22/26] drm/xe/pf: Handle VRAM migration data as part
 of PF control
Message-ID: <ua6k5ndnc442zljibx3k5vx635t26xubbydbartsj7bk4mbjm4@3n64awzdcxnr>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
 <20251021224133.577765-23-michal.winiarski@intel.com>
 <ce1b236d-f2ba-4f5a-944b-219e1cae8bd6@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ce1b236d-f2ba-4f5a-944b-219e1cae8bd6@intel.com>
X-ClientProxiedBy: VI1PR10CA0115.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::44) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SA1PR11MB8352:EE_
X-MS-Office365-Filtering-Correlation-Id: 2849eb37-ac54-4c06-8e5e-08de16c8bc66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2dqa3JYMWlpVTFpOEVRNDd2c2praUo3dGQxZGRoZHdXTjZpUmxPRXdNQVg3?=
 =?utf-8?B?NHUxMHpFVWVldk5ZbWpPUjJyQkZ6ZFhWTUdjaGZ4dUxQRGNOeUc1dUJJRGFH?=
 =?utf-8?B?bjlXM1pOa3dwRFVGRzBnMENOdERqYkZyR1Btb3RyS3RPV3FRVUxrUW9OalQv?=
 =?utf-8?B?blI0UnBCVEJOU3NHTm41U3ZSckRyNVFIbEY1QWhmV3U5NVQ4UkZyejdVcnR5?=
 =?utf-8?B?cWpIV3JydGFaWVAvOFd6cm9nc0U1Wm9QWkFkQTFYRzA2T3VTMnZnMm5oTkZI?=
 =?utf-8?B?dHhyS3F2UmZoa0JZcGFlUy9hMW9TdjU3QWpvcG5CdjVNTnk2QWFLcFd1dEsy?=
 =?utf-8?B?OG9YWEJSWEkyZlllY012aTgyVTN0TVk3MitCUGgrOE53a1ZRSkZBRTVYekdJ?=
 =?utf-8?B?Yk1tbFhGMnpMRG1saFNpczFMdUxuNHZTRm9iRVg2aDNuZVl0VTdodFpiTWw3?=
 =?utf-8?B?RFFWQmg4dTlLSGluNndmeGF0OXpVaUErdnNEWHlSTHdqbHdKYWoyc1pKYWhq?=
 =?utf-8?B?ZFlBVzRsY1hud0sxaytySXdVYXVaUjQ1TU0weVJTYnRteHB0ZWFuVFp0akM2?=
 =?utf-8?B?RUdMczNsOUtWOHZiSkJPWUIyVG5RaVVNV0dHeWZsK1BDd3F6dU8wZktkOE16?=
 =?utf-8?B?UlBsT3Y4SWVJL2IxNDhFSWNVZUhCc2YvZ3ZDWkZRWUROcDl5bUJkaC9XbUN5?=
 =?utf-8?B?V3A5QW9wOFk5c3BETkFWdDZkRWFQMnptNjdNUlJFM3UwWjl6ODBRdk94UWhq?=
 =?utf-8?B?TlNjcDBxTms5TGMwbExyVkR2WnFHbytOSFIwekk1OVdJNytZSWNQTWVCeVRy?=
 =?utf-8?B?TUJRS2FGRnBrYk40bFQydG9WS1hKWWJ4cElJRlp4Snh4OStRRXlSSjc3eWpF?=
 =?utf-8?B?VlFtUDk0WVhaYkNEMlppeTFCdWNoZzZPMnFad2VmZWRWZUJyM0M1L2FyaUdm?=
 =?utf-8?B?MnFCR0NsSHVmQ0JzTFp1Sy9HSmFOYi9DVzNFWFVLY1FaSXBIck1weFJMOVBw?=
 =?utf-8?B?aGtQeHNvQUIwSWdtdnFpWWNKamhjL0lKa1FqVVhUNk9BNlhuTVNMVFZuQjhV?=
 =?utf-8?B?YWpIK1BSbVoyeDMxS2xsY2s5TWwwZERkelpkalFIUHhaWFE3U3FmQ0dPWDhz?=
 =?utf-8?B?NFpwWkF6Zk9oMmhhRS8rRitRMGJqMGFvTGJWSDFzVU8xYmxIQnc0eUk0T1ls?=
 =?utf-8?B?enBJcDFaUFU4dkl4Qk94c2JiOWNDcEcvdXExTFFrZFZFSnU4QjBwMUxLM3dG?=
 =?utf-8?B?bWRPMkw2L2pHcXg5QXkvN01UQzBhalVKTGhWWncrRHhzWjR6ajU0bU1qeDVF?=
 =?utf-8?B?MjJ6ajlIcExpUjZBVFJOZ1J1MXlFY29QaWJicTQ4QW03aktsUURoMS91VmY4?=
 =?utf-8?B?YmVZdzZYWVdWWnZnRkRyVkJTVHhZNEd4Uk1RUlRObzhhNlY1MDkxL3pCRzlT?=
 =?utf-8?B?Q1lXN2tSVzhLWVZxVVB0akIxYkdNU2dUd3d0MkJxNlZ0L2pYMitoV3ZINHZV?=
 =?utf-8?B?MFArczRiYWRqTk9FbDJGVnRYMS9YYWgxb0RNaUMzQ0toL3g2Nm5QNmVFUUt6?=
 =?utf-8?B?UmNYazM0VFZUcHpXKzV4eGFXZVNhQklVSnZ4TFdpWkhwV015UUNrZUlOd1NS?=
 =?utf-8?B?MVRMbE9qRklrUkR6YjVxU1dlY2I3VldFZzNRanYzZTBWVlUvSFFhRVc4QWcw?=
 =?utf-8?B?UTlKZGhzaElXWk9kZWQ2anFmanFtQ2VZNzRXc0RlbkZIQURYeHhzQmowQUdO?=
 =?utf-8?B?YWx2aUJOdm53VGFuNDh6dEdxanE5bDRZTjJHNldxSUd3ZHBobnNXVjA4Y2ph?=
 =?utf-8?B?MmxjZ2NiOWR0R1Nqc3lWUEdZSndBU2cvV1JLeFNKcVc1V1JmZUREN3BqQ3Mz?=
 =?utf-8?B?dzhqMEh5bkY4Yzg5cnZYNVpQaldNckhQVFNVckRUdEV3ZS9RTGcxWGtXTzZz?=
 =?utf-8?Q?RVyV35E/8tqF7RY3RlfKmEiDfJPH2sVF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHJFUkVyL1hxR2JHMzZIdzhhOG1rTy9VRnJKdkQzRjZWMmY1RSs5VWw5VFNm?=
 =?utf-8?B?TGZkcUdOb0ZzaFpkcTJuNDVVYmUzUW9kNFZDMDViSUU1dTZvSHhVWFlsVXNx?=
 =?utf-8?B?WkZ2enZrN3BRbnBqMjZwdU5jSHdXcTQ0cTRxM0dDN0hNRGJXelcrTUx4elQ2?=
 =?utf-8?B?Q1hYTjdBaVZ4bDZtZjVQbEVTMVpZZHBuVzRwYmE1b0ljWGhzN292eE9UUmFW?=
 =?utf-8?B?c0JLN2ViV3BCcGZIbHllRUNBUG00S3JUeGpjN2hUb3c1cGxWS0drcXYwNUtw?=
 =?utf-8?B?cDJsOVhDREpZaDh2RUhRVDR4emRYak9vSkRYNVFCNGlUR0lKSUpESzk1SUdL?=
 =?utf-8?B?ZXJaSVZvR2xyVC9VczE0OUhaWW8xSXB6RTc0OFY5b0tFM0tMaXlHTnY2dVF4?=
 =?utf-8?B?QUtCTUg2T05JOWN3bWFQQ044WDVwZDcwbWVQUWE1VStESWxhRVBDNTFrTnVE?=
 =?utf-8?B?d1FIaEhsb1lQZnhXZlZadVZCUlBJWERhNWdWdkVaK2ttTG5NRVppRldUaVBH?=
 =?utf-8?B?Lyt4SWVnVGdMbUFiSnFnbHp6Uzk3KzkyaXJPbzNBWHAzTEVPVlFqa2tRQ05S?=
 =?utf-8?B?UDBWTWlmNFFSRXZ5OG9LRHBWVXpLWE5aRVZJVTVrNzY5MU5tSzhSU3l3Qisy?=
 =?utf-8?B?bWJjb0VXYlEyUXZ0a1VRWHBYSGowb24wT2dQN3JseGVlWXBDS05hT3FsaTlj?=
 =?utf-8?B?M2hIRjVyWVB4YXpsUWxDTVhvdEVwMEZlSDhJemlzelN4aDZmaU5tdDR1ZTla?=
 =?utf-8?B?Y2tMZTF4djlubUNMQXJCbGlRbjdwWEdWM0ttdkJJSENXK2krdUkrYnJqb3Rt?=
 =?utf-8?B?aFdMOG1PdlQvTWk1YTA2UktSbGh2d3JFN3JReFJIdkJ1QXhjeHpnYVJ2K3Rj?=
 =?utf-8?B?d3cvRTQxbXpVWHNWUW9IUTB5N3pmVEgxdm1scmtSM2U3bWNlb2FHcVo0Uzlm?=
 =?utf-8?B?SUt3czM5eW1HeWRYbFV0VmZhdHBhbjZrR3drejY1cWtOTUJjYTd2L21aQnlO?=
 =?utf-8?B?M3R5U3RvRnBvWVRySGs3OHo5Zm5kRFFqTDVqaWlHTFFWYU1zR21ndlIyVGZQ?=
 =?utf-8?B?dzY3V0V0MDMvb0pkUnZ5N0V6Ym9rUDJlUHZTQk96cGdVZUk3MUtpaWIrOFdK?=
 =?utf-8?B?cmZwbmQrZGx5RFY0RTJoTzlkU3JZY2F1SllFd2lERVlNaXVCWXRPaE14dUV1?=
 =?utf-8?B?bHJlbUVvWTg1aFJRU3RjTWF6ZWFzaHR4YkZqTWxSTXJvRHplUW5hdzl4U2Nr?=
 =?utf-8?B?WWRySmRweW1GSlRGdldFVEtOMkRFbTJMZUdSZEpvaTBPdnFhVEEzQlIydGdp?=
 =?utf-8?B?Y05XVk9qSzNNQ2NhSlExa0VNYUl2OGtWeVlwK0duVU5ZNE91ejlpUGRiWERm?=
 =?utf-8?B?UUs1TnY4VlVFSVRaUnF2V3QyR1I3Z0Q4NFRMaTNudzNKUEhqZk1GTCt1VnpS?=
 =?utf-8?B?QUYxNmt1S0p3L0JBQndSOWpIMHZUMlpsUTUxZ1FhaW9HQ1h4MnMzMisvSzRQ?=
 =?utf-8?B?ZXpwWVY4S2Jyb3ZXYnlyOVRINnBiNVBLUHhWN3FXeGdSekVLZG1JcjlJQlQy?=
 =?utf-8?B?YjNQenVuczdtanU1YWx1ZXpsRm8xeTBnOVBjZ2wyenpuT1ZtdURaSHBKM1p0?=
 =?utf-8?B?VzcxSXpsLzJWZUhzYndXa1dlRVFqQVN0QkNUTkxxL0U0dE84YkRHd0ZNSm85?=
 =?utf-8?B?eDh5ZWgreFhHVVFaeGhKdWRkbW1HbjNnSStXaU1sd0tJK1lGN2NNR3ZBZldH?=
 =?utf-8?B?dnRSV0JtTmRkSmxZQ2VTazdQSzh6c2w0NjhnZTNZUzlJYzBBdVVadWcxMmhP?=
 =?utf-8?B?SG9tazVybjF6RzVvTmxyQ21xVXQ5MVoxYUs3dzJPMVFYZFU2a05LZ3ViaWFl?=
 =?utf-8?B?WStuZEdOTEltZjVzM0xlVTFlNk9NajlReXNjOS9TdndmR2VzYzI3WkorVzRS?=
 =?utf-8?B?dGtkak1yZDRobC81S1NHZHBkQ0U4dkc4Q2NqVzJhQWZ5bU0rUzdZVlNzall5?=
 =?utf-8?B?TXd1MTZmanRha0czdG5Fakl5TnZKZnZMSDMrZ3lBaHJjUXMwUkpjcmdNaXow?=
 =?utf-8?B?cXNEblBRRlhuMU82Y2JGbFcraTYxMkh0WWtRVHVreDNESVdOdFRsVjh0K2Fm?=
 =?utf-8?B?cVRYQUpkT0N4UWZHOXpuSVVnek0yS0swWmsySlRLOUdpUWttenpVamllK0dh?=
 =?utf-8?B?Y0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2849eb37-ac54-4c06-8e5e-08de16c8bc66
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 08:54:14.6652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YKC6d13GD2ye5ePIgUEJI8nU9xG6/uMgWFgvq3pfTRN75JETlRAcSKGatGM+lv2pdr4jbGj8thIAt4tWiMHn9ELyTMElJWt4uz3oKt2Ceiw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8352
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

On Thu, Oct 23, 2025 at 09:54:02PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 10/22/2025 12:41 AM, Michał Winiarski wrote:
> > Connect the helpers to allow save and restore of VRAM migration data in
> > stop_copy / resume device state.
> > 
> > Co-developed-by: Lukasz Laguna <lukasz.laguna@intel.com>
> > Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  18 ++
> >  .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |   2 +
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 222 ++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   6 +
> >  .../drm/xe/xe_gt_sriov_pf_migration_types.h   |   3 +
> >  drivers/gpu/drm/xe/xe_sriov_pf_control.c      |   3 +
> >  6 files changed, 254 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > index e7156ad3d1839..680f2de44144b 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > @@ -191,6 +191,7 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
> >  	CASE2STR(SAVE_DATA_GUC);
> >  	CASE2STR(SAVE_DATA_GGTT);
> >  	CASE2STR(SAVE_DATA_MMIO);
> > +	CASE2STR(SAVE_DATA_VRAM);
> >  	CASE2STR(SAVE_DATA_DONE);
> >  	CASE2STR(SAVE_FAILED);
> >  	CASE2STR(SAVED);
> > @@ -832,6 +833,7 @@ static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
> >  		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GGTT);
> >  		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_MMIO);
> >  		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
> > +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_VRAM);
> >  	}
> >  }
> >  
> > @@ -885,6 +887,19 @@ static int pf_handle_vf_save_data(struct xe_gt *gt, unsigned int vfid)
> >  		ret = xe_gt_sriov_pf_migration_mmio_save(gt, vfid);
> >  		if (ret)
> >  			return ret;
> > +
> > +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_VRAM);
> > +		return -EAGAIN;
> > +	}
> > +
> > +	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_VRAM)) {
> > +		if (xe_gt_sriov_pf_migration_vram_size(gt, vfid) > 0) {
> > +			ret = xe_gt_sriov_pf_migration_vram_save(gt, vfid);
> > +			if (ret == -EAGAIN)
> > +				pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_VRAM);
> > +			if (ret)
> > +				return ret;
> > +		}
> >  	}
> >  
> >  	return 0;
> > @@ -1100,6 +1115,9 @@ pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
> >  	case XE_SRIOV_MIGRATION_DATA_TYPE_GUC:
> >  		ret = xe_gt_sriov_pf_migration_guc_restore(gt, vfid, data);
> >  		break;
> > +	case XE_SRIOV_MIGRATION_DATA_TYPE_VRAM:
> > +		ret = xe_gt_sriov_pf_migration_vram_restore(gt, vfid, data);
> > +		break;
> >  	default:
> >  		xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n", vfid, data->type);
> >  		break;
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> > index 9dfcebd5078ac..fba10136f7cc7 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> > @@ -36,6 +36,7 @@
> >   * @XE_GT_SRIOV_STATE_SAVE_DATA_GUC: indicates PF needs to save VF GuC migration data.
> >   * @XE_GT_SRIOV_STATE_SAVE_DATA_GGTT: indicates PF needs to save VF GGTT migration data.
> >   * @XE_GT_SRIOV_STATE_SAVE_DATA_MMIO: indicates PF needs to save VF MMIO migration data.
> > + * @XE_GT_SRIOV_STATE_SAVE_DATA_VRAM: indicates PF needs to save VF VRAM migration data.
> >   * @XE_GT_SRIOV_STATE_SAVE_DATA_DONE: indicates that all migration data was produced by Xe.
> >   * @XE_GT_SRIOV_STATE_SAVE_FAILED: indicates that VF save operation has failed.
> >   * @XE_GT_SRIOV_STATE_SAVED: indicates that VF data is saved.
> > @@ -82,6 +83,7 @@ enum xe_gt_sriov_control_bits {
> >  	XE_GT_SRIOV_STATE_SAVE_DATA_GUC,
> >  	XE_GT_SRIOV_STATE_SAVE_DATA_GGTT,
> >  	XE_GT_SRIOV_STATE_SAVE_DATA_MMIO,
> > +	XE_GT_SRIOV_STATE_SAVE_DATA_VRAM,
> >  	XE_GT_SRIOV_STATE_SAVE_DATA_DONE,
> >  	XE_GT_SRIOV_STATE_SAVE_FAILED,
> >  	XE_GT_SRIOV_STATE_SAVED,
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > index 41335b15ffdbe..2c6a86d98ee31 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > @@ -17,6 +17,7 @@
> >  #include "xe_gt_sriov_printk.h"
> >  #include "xe_guc_buf.h"
> >  #include "xe_guc_ct.h"
> > +#include "xe_migrate.h"
> >  #include "xe_sriov.h"
> >  #include "xe_sriov_migration_data.h"
> >  #include "xe_sriov_pf_migration.h"
> > @@ -485,6 +486,220 @@ int xe_gt_sriov_pf_migration_mmio_restore(struct xe_gt *gt, unsigned int vfid,
> >  	return pf_restore_vf_mmio_mig_data(gt, vfid, data);
> >  }
> >  
> > +/**
> > + * xe_gt_sriov_pf_migration_vram_size() - Get the size of VF VRAM migration data.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier
> > + *
> > + * This function is for PF only.
> > + *
> > + * Return: size in bytes or a negative error code on failure.
> > + */
> > +ssize_t xe_gt_sriov_pf_migration_vram_size(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	if (gt != xe_root_mmio_gt(gt_to_xe(gt)))
> 
> probably you mean
> 
> 	if (!xe_gt_is_main_type(gt))

Yes - I'll use it.

> 
> > +		return 0;
> > +
> > +	return xe_gt_sriov_pf_config_get_lmem(gt, vfid);
> > +}
> > +
> > +static struct dma_fence *__pf_save_restore_vram(struct xe_gt *gt, unsigned int vfid,
> > +						struct xe_bo *vram, u64 vram_offset,
> > +						struct xe_bo *sysmem, u64 sysmem_offset,
> > +						size_t size, bool save)
> > +{
> > +	struct dma_fence *ret = NULL;
> > +	struct drm_exec exec;
> > +	int err;
> > +
> > +	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
> > +	drm_exec_until_all_locked(&exec) {
> > +		err = drm_exec_lock_obj(&exec, &vram->ttm.base);
> > +		drm_exec_retry_on_contention(&exec);
> > +		if (err) {
> > +			ret = ERR_PTR(err);
> > +			goto err;
> > +		}
> > +
> > +		err = drm_exec_lock_obj(&exec, &sysmem->ttm.base);
> > +		drm_exec_retry_on_contention(&exec);
> > +		if (err) {
> > +			ret = ERR_PTR(err);
> > +			goto err;
> > +		}
> > +	}
> > +
> > +	ret = xe_migrate_vram_copy_chunk(vram, vram_offset, sysmem, sysmem_offset, size,
> > +					 save ? XE_MIGRATE_COPY_TO_SRAM : XE_MIGRATE_COPY_TO_VRAM);
> > +
> > +err:
> > +	drm_exec_fini(&exec);
> > +
> > +	return ret;
> > +}
> > +
> > +static int pf_save_vram_chunk(struct xe_gt *gt, unsigned int vfid,
> > +			      struct xe_bo *src_vram, u64 src_vram_offset,
> > +			      size_t size)
> > +{
> > +	struct xe_sriov_migration_data *data;
> > +	struct dma_fence *fence;
> > +	int ret;
> > +
> > +	data = xe_sriov_migration_data_alloc(gt_to_xe(gt));
> > +	if (!data)
> > +		return -ENOMEM;
> > +
> > +	ret = xe_sriov_migration_data_init(data, gt->tile->id, gt->info.id,
> > +					   XE_SRIOV_MIGRATION_DATA_TYPE_VRAM,
> > +					   src_vram_offset, size);
> > +	if (ret)
> > +		goto fail;
> > +
> > +	fence = __pf_save_restore_vram(gt, vfid,
> > +				       src_vram, src_vram_offset,
> > +				       data->bo, 0, size, true);
> > +
> > +	ret = dma_fence_wait_timeout(fence, false, 5 * HZ);
> > +	dma_fence_put(fence);
> > +	if (!ret) {
> > +		ret = -ETIME;
> > +		goto fail;
> > +	}
> > +
> > +	pf_dump_mig_data(gt, vfid, data);
> > +
> > +	ret = xe_gt_sriov_pf_migration_save_produce(gt, vfid, data);
> > +	if (ret)
> > +		goto fail;
> > +
> > +	return 0;
> > +
> > +fail:
> > +	xe_sriov_migration_data_free(data);
> > +	return ret;
> > +}
> > +
> > +#define VF_VRAM_STATE_CHUNK_MAX_SIZE SZ_512M
> > +static int pf_save_vf_vram_mig_data(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
> > +	loff_t *offset = &migration->vram_save_offset;
> > +	struct xe_bo *vram;
> > +	size_t vram_size, chunk_size;
> > +	int ret;
> > +
> > +	vram = xe_gt_sriov_pf_config_get_lmem_obj(gt, vfid);
> > +	if (!vram)
> > +		return -ENXIO;
> 
> no error message ?

Well, this should be converted to assert after we block re-provisioning,
so I don't think it's needed (or know what to print out :) ).

> 
> > +
> > +	vram_size = xe_bo_size(vram);
> > +	chunk_size = min(vram_size - *offset, VF_VRAM_STATE_CHUNK_MAX_SIZE);
> 
> what if *offset > vram_size ?

We control the offset - I'll add an assert.

> 
> > +
> > +	ret = pf_save_vram_chunk(gt, vfid, vram, *offset, chunk_size);
> > +	if (ret)
> > +		goto fail;
> > +
> > +	*offset += chunk_size;
> > +
> > +	xe_bo_put(vram);
> > +
> > +	if (*offset < vram_size)
> > +		return -EAGAIN;
> > +
> > +	return 0;
> > +
> > +fail:
> > +	xe_bo_put(vram);
> > +	xe_gt_sriov_err(gt, "Failed to save VF%u VRAM data (%pe)\n", vfid, ERR_PTR(ret));
> > +	return ret;
> > +}
> > +
> > +static int pf_restore_vf_vram_mig_data(struct xe_gt *gt, unsigned int vfid,
> > +				       struct xe_sriov_migration_data *data)
> > +{
> > +	u64 end = data->hdr.offset + data->hdr.size;
> > +	struct dma_fence *fence;
> > +	struct xe_bo *vram;
> > +	size_t size;
> > +	int ret = 0;
> > +
> > +	vram = xe_gt_sriov_pf_config_get_lmem_obj(gt, vfid);
> > +	if (!vram)
> > +		return -ENXIO;
> 
> no error message ? other errors are reported

Same as above.

> 
> > +
> > +	size = xe_bo_size(vram);
> > +
> > +	if (end > size || end < data->hdr.size) {
> > +		ret = -EINVAL;
> > +		goto err;
> > +	}
> > +
> > +	pf_dump_mig_data(gt, vfid, data);
> > +
> > +	fence = __pf_save_restore_vram(gt, vfid, vram, data->hdr.offset,
> > +				       data->bo, 0, data->hdr.size, false);
> > +	ret = dma_fence_wait_timeout(fence, false, 5 * HZ);
> 
> define this timeout at least as macro (if not as helper function, as this might be platform/settings specific)

I'll use a macro for now.

> 
> > +	dma_fence_put(fence);
> > +	if (!ret) {
> > +		ret = -ETIME;
> > +		goto err;
> > +	}
> > +
> > +	return 0;
> > +err:
> > +	xe_bo_put(vram);
> > +	xe_gt_sriov_err(gt, "Failed to restore VF%u VRAM data (%pe)\n", vfid, ERR_PTR(ret));
> > +	return ret;
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_migration_vram_save() - Save VF VRAM migration data.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier (can't be 0)
> > + *
> > + * This function is for PF only.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_gt_sriov_pf_migration_vram_save(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> > +	xe_gt_assert(gt, vfid != PFID);
> > +	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
> > +
> > +	return pf_save_vf_vram_mig_data(gt, vfid);
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_migration_vram_restore() - Restore VF VRAM migration data.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier (can't be 0)
> > + *
> > + * This function is for PF only.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_gt_sriov_pf_migration_vram_restore(struct xe_gt *gt, unsigned int vfid,
> > +					  struct xe_sriov_migration_data *data)
> > +{
> > +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> > +	xe_gt_assert(gt, vfid != PFID);
> > +	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
> > +
> > +	return pf_restore_vf_vram_mig_data(gt, vfid, data);
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_migration_save_init() - Initialize per-GT migration related data.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier (can't be 0)
> > + */
> > +void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	pf_pick_gt_migration(gt, vfid)->vram_save_offset = 0;
> > +}
> > +
> >  /**
> >   * xe_gt_sriov_pf_migration_size() - Total size of migration data from all components within a GT.
> >   * @gt: the &xe_gt
> > @@ -522,6 +737,13 @@ ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
> >  		size += sizeof(struct xe_sriov_pf_migration_hdr);
> >  	total += size;
> >  
> > +	size = xe_gt_sriov_pf_migration_vram_size(gt, vfid);
> > +	if (size < 0)
> > +		return size;
> > +	else if (size > 0)
> 
> "else" not needed

Ok.

> 
> > +		size += sizeof(struct xe_sriov_pf_migration_hdr);
> > +	total += size;
> > +
> >  	return total;
> >  }
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> > index 24a233c4cd0bb..ca518eda5429f 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> > @@ -27,6 +27,12 @@ ssize_t xe_gt_sriov_pf_migration_mmio_size(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_migration_mmio_save(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_migration_mmio_restore(struct xe_gt *gt, unsigned int vfid,
> >  					  struct xe_sriov_migration_data *data);
> > +ssize_t xe_gt_sriov_pf_migration_vram_size(struct xe_gt *gt, unsigned int vfid);
> > +int xe_gt_sriov_pf_migration_vram_save(struct xe_gt *gt, unsigned int vfid);
> > +int xe_gt_sriov_pf_migration_vram_restore(struct xe_gt *gt, unsigned int vfid,
> > +					  struct xe_sriov_migration_data *data);
> > +
> > +void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid);
> >  
> >  ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> > index 75d8b94cbbefb..39a940c9b0a4b 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> > @@ -16,6 +16,9 @@
> >  struct xe_gt_sriov_migration_data {
> >  	/** @ring: queue containing VF save / restore migration data */
> >  	struct ptr_ring ring;
> > +
> > +	/** @vram_save_offset: offset within VRAM, used for chunked VRAM save */
> 
> "last saved offset" ?

Ok.

Thanks,
-Michał

> > +	loff_t vram_save_offset;
> >  };
> >  
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> > index c2768848daba1..aac8ecb861545 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> > @@ -5,6 +5,7 @@
> >  
> >  #include "xe_device.h"
> >  #include "xe_gt_sriov_pf_control.h"
> > +#include "xe_gt_sriov_pf_migration.h"
> >  #include "xe_sriov_migration_data.h"
> >  #include "xe_sriov_pf_control.h"
> >  #include "xe_sriov_printk.h"
> > @@ -171,6 +172,8 @@ int xe_sriov_pf_control_trigger_save_vf(struct xe_device *xe, unsigned int vfid)
> >  		return ret;
> >  
> >  	for_each_gt(gt, xe, id) {
> > +		xe_gt_sriov_pf_migration_save_init(gt, vfid);
> > +
> >  		ret = xe_gt_sriov_pf_control_trigger_save_vf(gt, vfid);
> >  		if (ret)
> >  			return ret;
> 
