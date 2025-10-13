Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B391BD29A0
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 12:46:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C6410E1E4;
	Mon, 13 Oct 2025 10:46:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TAXrQ9bu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 516A910E0D2;
 Mon, 13 Oct 2025 10:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760352391; x=1791888391;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cm9PkPqWMbz0UEMMlZ+BIaMRLbwjmdc3DZaaltbWPnI=;
 b=TAXrQ9buSEv9MkAAFTIhEFw/DT6//vUUKVrgvEoM88JWkVxoXEGGyO5a
 Uq3FGysnTEunhXZIYBicxElJuibVMwJH9vIpS2PZE1QWI0qfkp6+vNxN1
 QatXguIlMg/K/eMI5UQU+gRadv0Um5nQ82e+QiKBnF2JKoH48EGgxuFPz
 QhLw9rngzhzLU7AHF5IlGqBImIz8tIekEqP/LR0PWeh0RKP+EWYMu1/6Z
 LMSmRie/UvukLzFw1RO9weXsByUHqLK57k4JZKq/TwhCWEfvPsdvYTv9x
 9Mf3IYKFYvLyB/ozQEsddGq+dHyMpl/NCWehEeLARdYKCl8EjJFw/QnW0 w==;
X-CSE-ConnectionGUID: enm7GNKmRhq/FtxX3AknIw==
X-CSE-MsgGUID: EVqlHSykTOaDMQM0NEsv2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="62375311"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="62375311"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 03:46:31 -0700
X-CSE-ConnectionGUID: oi2jkQt0Rd+bz85uTUmRdA==
X-CSE-MsgGUID: 2q2CrjriSx2Grh38o/Z+Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="185832377"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 03:46:30 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 03:46:29 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 03:46:29 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.14) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 03:46:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rusrlVZ5el6ddm5TQ6l1tZR8aaRh97ScDMpMvXZjJFDb5LH6erOvnfLJ3AMkhJ+UZjjYbBFG9gg6C/t3yfF2vUQ5xvd0xJeD7bhSWwnX1wfEBRNuRRUqsYVNyiZJKHaqDjC5uh8z6U24t2CIaln8VPl+RybKyl1kP+fQ9+oCni344tN1FWAMyefrP6FVQOspGgsF+BW435alTu57L2VzduqEWPoWJyiVv5i7ALWXewcV+L5Zf+CfEJ0Sl3+22eIguQyGabIWKuPwjqfe0ceDsdRCfZvxPtCFTOE19K5yDvwFgEYIUFs4ZryMxAJHw3wtmUJOgqtMyQpsuy9KeZkdrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hHoTW1PSt8ObQ3ckn4EoCM64PdusF0RZ57h7HHBmpR8=;
 b=saxw5fT74x5QICkRUfnMXIoaEPGfu0iH6FAdmgUpWkhbnUcNBd+jmKbLjgKZvO4jJFEgaP3sVkz2QQ0OT49E0YsCM7oPX8YqKzRv5FXNtzVuzGlTBiiL6BBdmIlNO5nK4WL8+s8KU9TN8goKs+eaZWMt+t9MF5sR38S/cRlJakQccnRJNFcygEBdptVW9WMcVlsRm9tYtcJXXVRMzEjjxzQtQSrWE4aqWGlE6NhtxA1IyM26doV6mIJpVEum9D5y+paI9UERs5Tk776P3fLp3ecJHI4XkFBJQ48mr/WZOwxTrs648C3n1pc5grhd2v3ERY3hP2ViRzOQJGF81fq29Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH7PR11MB8035.namprd11.prod.outlook.com (2603:10b6:510:245::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 10:46:25 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 10:46:25 +0000
Message-ID: <348503b5-0503-4da1-a93d-e55c81fd910b@intel.com>
Date: Mon, 13 Oct 2025 12:46:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/26] drm/xe/pf: Add support for encap/decap of bitstream
 to/from packet
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>
CC: <dri-devel@lists.freedesktop.org>, Matthew Brost
 <matthew.brost@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-8-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251011193847.1836454-8-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7b::13) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH7PR11MB8035:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bcf112c-f119-42cd-89b8-08de0a45c18a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SDRxVXN4WlovM2pKdHhFTVNyRFc1SVpjQW0yRjZ2eHN6VUU4MktJNUx3MTJ1?=
 =?utf-8?B?UDBXNWxBZ1ZXRW9UNTJMTnVFckZkN0NSVzFEemFGNzYvWGFQdXNsSENmWndM?=
 =?utf-8?B?ZnBzOGxSdWN3Rmc4bEx2ZWhZanBSYjEyTFNYM05PNkN6YVVYMDJYYTUyd1RP?=
 =?utf-8?B?cTFIZEwremJmZFpwZ25oeDliZGVLVmorQm9LU1N6MEVWMnhLZktkQk5MTnRu?=
 =?utf-8?B?SFZ2ckR5dVJyNlVSQkRGV21wMDhrOENqQWJPa2dZaExWUEdEY2g4Nk5Qdkd2?=
 =?utf-8?B?N1pPbTdySElZbkxpWGZXbm9IQ1d5bzZGbmlOMk9HbC9mNU8xc1JWd1QvcFcx?=
 =?utf-8?B?ajZndUQ4YjV6N29FVzd5bnFMc2xITjUzdUxkWXh0SkQvM3lycUhGZ0I4R29B?=
 =?utf-8?B?VUFCTkxOdnRIbXZLdW1JcTJzSzFvKy9nQWtiMkVZa21lQWV0RWFrVFN2bTl6?=
 =?utf-8?B?WVQyOEQzNnZreHRueSs1b2NqZGhnODFza1JIZE5md3RISlNDb01XenVubDI0?=
 =?utf-8?B?TTFxdDUwOXlrSFN0cWRIMitGYlFNUXhDYnhKZ2dsNWJOVm1uTDQ5VEd1Zm41?=
 =?utf-8?B?d0x5WEJ0YUNlR1RiYStPT2cvWkRxdlBOdUo0TmVZV00zQjRQNHFsdkhlbGZ0?=
 =?utf-8?B?MUd0WGVFQS8zcW1meHg3NHNlVW1WeHl5cmhmZ0JsQXcyVDhqb2R3eHFiYnZS?=
 =?utf-8?B?US9sTmI4OVMwTGcyUDM1Wjd3bndTMFNzbmY3R0ViclA1Nk9IMjdLL3dFNmNq?=
 =?utf-8?B?M2JCTUhoR3JsamNwVDhSakZ3QjhMN1BMQkhlMGwwYmMvZ3NtUk92a0diUERQ?=
 =?utf-8?B?b0VqanNOWVBsckp2ZU5EQlViUU44aDJ2QjBUUkNsb0pjUTJjM2toRnpMWGRX?=
 =?utf-8?B?WWlyS2Vpd0FnZjY5WlREdkQ4YXhldm1ibExKdWxkNCtkNmNrVnRtcG9YUTk4?=
 =?utf-8?B?TTRvdDNvdTdKSW5pRjJEdy9kcitzcFBKVExPWmY0NWRwbzhGZkhQMHg4VjZ0?=
 =?utf-8?B?RE5xN3BFUUNiUTNvK0E5UzlCSS85VEtKdEp1cllnNUZvdllheTh2Ymo4aFpy?=
 =?utf-8?B?dTBoc0NiM3BmejZWQmIvV0lWek5obVFPNzZGYmZ4QkFzWk5VNWVkVnZyTGRl?=
 =?utf-8?B?T0ZOZzBxVjJmNEtZdkNQS2N4RllSOEJiTWRyb1QzKzc3TW9uRExSa20xZ2pq?=
 =?utf-8?B?SW45T1Bvc3BWMU81ZGFxRjB6Sm9FNEdEaVhJZ1pTTnFxRGo4K2dHMWdqY0kx?=
 =?utf-8?B?NU1SWTBFbHFjREdrdFVVeFcxZXkrbXFUUCtESnZ1L0VJMTh0Rk1MNk1Yb1V1?=
 =?utf-8?B?SWR1R1lFOGFNR0xuRnZtWThDQ3Zua0tlOFBRUlp5THFURXdDUGdHNW9ZaDdW?=
 =?utf-8?B?WDNCOENEdHRDVFJ0SDV5QkFrWW9LRStwTXFMM2VBQlRGcWxtRWpvanc4ZkVk?=
 =?utf-8?B?clpFTTBGK1pJdWtkV3FRSmR4TU8xUEZjZ25PZ1IxTm1LYVU2eEVZcXpyMzJL?=
 =?utf-8?B?UmRoUEZ0dGpNQjdwSG9mQldydGd3OS9vS2JBTWhMZXdDV2h3L0tPbzZ5Uno5?=
 =?utf-8?B?U1h4dFdsNGN3engxU0wvaTNSOGJ0enVVRVB1eWFwa0pLL1NJY2MvQ24raWUx?=
 =?utf-8?B?Yk5paU9jOTVEemlRZlpyR3g4TjJoUTFXMUZJVDY1U2lRd3MyVlk1eUhrTW93?=
 =?utf-8?B?WHRjYmFidWJIU0dxclpvVSt6WHBQWEZoVUpjQ3BubEJsSmNZZFZybGxVT2tn?=
 =?utf-8?B?MWZkM2xINHFhUkxSOVl4TmdsNEczcFRsNjN0aDZnL0xMbUFhSmtLaXFpOHhm?=
 =?utf-8?B?S2JwOTJseHJiOTNQQjVUUktUUkNrMkU1TW9EdUd3RXcybktNN0ZUQ1g2YmJz?=
 =?utf-8?B?bk93cjZ1aWI0VUlXcGVwbFU1WGpvckcwUE82N1ZCOG5hdGFQV2hIK0lmYlBI?=
 =?utf-8?B?YnM1SkRUVFk4cW1ibXVwSi9zc0xoNlBiODRUL05la01rZjhNa0pRUi85ODJE?=
 =?utf-8?Q?nqzxQS4pu2BjVGuCBU86xleLt2BTFE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEJ4TWtyVXFyem9CMnd3ejhFM2VZbVhDK3RwUCtMdDEzMjhDQnhhdnMzbEhw?=
 =?utf-8?B?Q3l0ak5jZHNhcHVRSUxxdm5ZaGg3YkYzK2ozTHhUM2JnOUVVVTJzUWplR2RK?=
 =?utf-8?B?UmQvVUNyd3pPN3hIQWdYZFgxWHNOc1BjcVNIVGxGS2FtYlZiU3FIM3JUMHo4?=
 =?utf-8?B?ZmZpdDVDYWR4V2dKZXlOaTdtUm9XQzRJak5hNkxrNnBnWld2ZVplRmNuNUtD?=
 =?utf-8?B?WFdQUmVwVHIrNzBESXJjV2NvSWpiYjh2ZTFEVGtMRVVEZ1V3eG93TlFERzZY?=
 =?utf-8?B?bEJDUGhmTUk3dy91MTcrRFB2aHNNdy9RVmZVS2xsSW0zVFlkbmdWc1lvUHBG?=
 =?utf-8?B?dkc5blRiN3VOVHZUNlZyNktUOTRucVJXWmpUbjkwVzdhT1NUanZyTUs1b3RF?=
 =?utf-8?B?SGEvV0xGNEJodkE3TUs2Z1poNHZQaVRoWWdsRWU2KzV0UGdSUGRGV2oxVlJs?=
 =?utf-8?B?aGFNcEE4clZyVWZ5SkdGT2E5WHdLZ0JZSVROT3RINTExSndiMVIrWTdOVGlF?=
 =?utf-8?B?Uy9kL3VBaWdBa0lRUXQzMjdBUXRGVkp2MVZTSnNOYmVOQU52anZ4c0pIREhl?=
 =?utf-8?B?YjRZTWRIVUpELzJMUkZ4NUhUL0VkcDN3VkxyWDdPOUszL0JNa3NvN3VlVXFF?=
 =?utf-8?B?VkxrM3J6Y09DNnlJa2s3YUpRMTdTOHIrcjhVV2ZvUWtLampBMGRJMWtCYUNT?=
 =?utf-8?B?aTl6UjFPUllaUDR3dWVNeDJOWEpOc1RTRHlXeVhSYk1KNkY0RWhtU092RlE5?=
 =?utf-8?B?WVVRTnZiYTVxcllMRGxFNVIxSGlXcnExbWVFdmhzSGYycTJyT0NhMGJ5MXJn?=
 =?utf-8?B?dnBqL2FkZFNJY2dsQktqZ25VSUJJWEZ4OXYxdWJEZjdtR1lUeUJjWjFvSitC?=
 =?utf-8?B?ZEZObzhIVVRGT0lGb0E1RmJzSkxpMmJ2UmpWdGtNV3pRbzBHTlpqL3kvaStk?=
 =?utf-8?B?RkFGSENqYjlhTXltaEQyRG5HdXU4d2RBMGJHL1g3Y2gzNFl2Z3lCQWRqREpm?=
 =?utf-8?B?a1d3a1dIN2pHV1BIS2c4YUQ4ZzNIdDBUMDFmT05mNlc5b0x0c0N5ayttSmVQ?=
 =?utf-8?B?Zlg4RThSMFg3dXhaTXA2VGlCTEpEY2JKQ1JIOVBaTHBHTE0wa2NkRnZjMndJ?=
 =?utf-8?B?RG0zRG9pT2Vzejk1R3pJS1pvdjk5aTl1K1cwWWYwd1lzbUxMVkpBSlp3VzhC?=
 =?utf-8?B?Ry91VXlWcE5pUWJ4bVdJaWJxcHYwdVZUYUk5RDNJTW4wdHNDOW5DeTRUTVNl?=
 =?utf-8?B?bnphaXZ0Uk51eGI4TTBGSzVTT1cyRU5HN0ptU2Jpa2p4NEF3R3VQaWhQOWtZ?=
 =?utf-8?B?ODhpMXpDTm5Ic2I5SVlRd2tRMkE3U3E1bHRGSGxjVGtKSC81cVlHTzR1VXRJ?=
 =?utf-8?B?NGh1V0lpUGR5eVJEcUF2akprVXpDQ0VXR0tIN1V1UkZVV1BLeUt1b1hTLzEz?=
 =?utf-8?B?S0tadmxvOEJsWWp0dXVTN01WWnBQT2d0UTBuc3M3SEN2VUZ0ZGJBNzhLV2FE?=
 =?utf-8?B?bjJTUWxJUGlKQ1B0VHRqMnFXWnBTU1NXL0EzS3RkYWFJNDZZbERkS1J6aHFV?=
 =?utf-8?B?OEdwZzM5VWsvY1o0MGlleGZyamc0R0ZRLzJ1dFBjRVlTZnFPVVZzYjhnSmlP?=
 =?utf-8?B?YUFOanNmVTBLcDNsaG5Cb2h4SWlZQ2h6RWZMQkJma21Wb2NhUVpzaHJ6T2xy?=
 =?utf-8?B?WUtFcExtWUd3WVl3MDV3V2pjSVh1MGVJQ2FCenRCSnMxeFpGd1RMM3hQRG1l?=
 =?utf-8?B?NTZJbVBxRjk1WjVjM3BjMWNRdEdqUTRzVXI4bFBnUnU1UklPSndPWGMydlBn?=
 =?utf-8?B?Vnd0M08yWCtHTDB6ajBMTmo2V0poRTd4T0kxVmNoa1d5eGJGbDdqTzFTRHhY?=
 =?utf-8?B?Z3lYdWZJNWQ2QXBuZ0VMa0RPdWIvOUJxOC94SUhjajM4NnNQUXVXbzBUTnAy?=
 =?utf-8?B?eGtkemxpaHlZaVFMQy9FZUd1UXoyUzQ4NW4vRlJVdFp3ZUlNTEk4SlRUWGM4?=
 =?utf-8?B?Yjl0OWErWGViSkViMjZ1SFQyVTJHdkM0UFNrd1dpbEh5THp0MnZLaG5sd3NH?=
 =?utf-8?B?KzBheDZaMHlHQXA1d0gvMU9ucDEraEh3ODlUaGlpY211MC9OR2orYVA2SWtG?=
 =?utf-8?B?S0ppdXhTTk9UaVdkRWRLWkNCeHNEdXlrTHAwYzFWd0s1MHVRR2FwRXFWbXRz?=
 =?utf-8?B?YlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bcf112c-f119-42cd-89b8-08de0a45c18a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 10:46:25.1363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fWwkx00BBsUq7rlGYnfX4HQufBEsrLxwwA++9BP/fCMH00Rzl5KRSErzf3T7YNk2537kf5kanEypYN8Xm9He5wfGYckT1YnMgdPnFGrXzFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8035
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



On 10/11/2025 9:38 PM, Michał Winiarski wrote:
> Add debugfs handlers for migration state and handle bitstream
> .read()/.write() to convert from bitstream to/from migration data
> packets.
> As descriptor/trailer are handled at this layer - add handling for both
> save and restore side.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  18 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h   |   1 +
>  drivers/gpu/drm/xe/xe_sriov_pf.c              |   1 +
>  drivers/gpu/drm/xe/xe_sriov_pf_control.c      |   5 +
>  drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      |  45 +++
>  drivers/gpu/drm/xe/xe_sriov_pf_migration.c    |  56 +++
>  .../gpu/drm/xe/xe_sriov_pf_migration_data.c   | 353 ++++++++++++++++++
>  .../gpu/drm/xe/xe_sriov_pf_migration_data.h   |   5 +
>  .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |   9 +
>  9 files changed, 493 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> index 04a4e92133c2e..092d3d710bca1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> @@ -814,6 +814,23 @@ bool xe_gt_sriov_pf_control_check_vf_data_wip(struct xe_gt *gt, unsigned int vfi
>  	return pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_MIGRATION_DATA_WIP);
>  }
>  
> +/**
> + * xe_gt_sriov_pf_control_vf_data_eof() - indicate the end of SR-IOV VF migration data production
> + * @gt: the &struct xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + */
> +void xe_gt_sriov_pf_control_vf_data_eof(struct xe_gt *gt, unsigned int vfid)
> +{
> +	struct wait_queue_head *wq = xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid);
> +
> +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_MIGRATION_DATA_WIP))
> +		pf_enter_vf_state_machine_bug(gt, vfid);
> +
> +	wake_up_all(wq);
> +}
> +
>  static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
>  {
>  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP);
> @@ -840,6 +857,7 @@ static bool pf_handle_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
>  	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP))
>  		return false;
>  
> +	xe_gt_sriov_pf_control_vf_data_eof(gt, vfid);

above call can lead to state_machine_bug but here you just continue as nothing happen and moving to SAVED state

maybe that logic of that function should moved to a helper that at least returns bool so you can make the right decision?

>  	pf_exit_vf_save_wip(gt, vfid);
>  	pf_enter_vf_saved(gt, vfid);
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> index 2e121e8132dcf..caf20dd063b1b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> @@ -15,6 +15,7 @@ int xe_gt_sriov_pf_control_init(struct xe_gt *gt);
>  void xe_gt_sriov_pf_control_restart(struct xe_gt *gt);
>  
>  bool xe_gt_sriov_pf_control_check_vf_data_wip(struct xe_gt *gt, unsigned int vfid);
> +void xe_gt_sriov_pf_control_vf_data_eof(struct xe_gt *gt, unsigned int vfid);
>  
>  int xe_gt_sriov_pf_control_pause_vf(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
> index 95743c7af8050..5d115627f3f2f 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
> @@ -16,6 +16,7 @@
>  #include "xe_sriov_pf.h"
>  #include "xe_sriov_pf_helpers.h"
>  #include "xe_sriov_pf_migration.h"
> +#include "xe_sriov_pf_migration_data.h"
>  #include "xe_sriov_pf_service.h"
>  #include "xe_sriov_printk.h"
>  
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> index e64c7b56172c6..10e1f18aa8b11 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> @@ -6,6 +6,7 @@
>  #include "xe_device.h"
>  #include "xe_gt_sriov_pf_control.h"
>  #include "xe_sriov_pf_control.h"
> +#include "xe_sriov_pf_migration_data.h"
>  #include "xe_sriov_printk.h"
>  
>  /**
> @@ -165,6 +166,10 @@ int xe_sriov_pf_control_save_vf(struct xe_device *xe, unsigned int vfid)
>  	unsigned int id;
>  	int ret;
>  
> +	ret = xe_sriov_pf_migration_data_save_init(xe, vfid);
> +	if (ret)
> +		return ret;
> +
>  	for_each_gt(gt, xe, id) {
>  		ret = xe_gt_sriov_pf_control_save_vf(gt, vfid);
>  		if (ret)
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> index 74eeabef91c57..ce780719760a6 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> @@ -13,6 +13,7 @@
>  #include "xe_sriov_pf_control.h"
>  #include "xe_sriov_pf_debugfs.h"
>  #include "xe_sriov_pf_helpers.h"
> +#include "xe_sriov_pf_migration_data.h"
>  #include "xe_sriov_pf_service.h"
>  #include "xe_sriov_printk.h"
>  #include "xe_tile_sriov_pf_debugfs.h"
> @@ -71,6 +72,7 @@ static void pf_populate_pf(struct xe_device *xe, struct dentry *pfdent)
>   *      /sys/kernel/debug/dri/BDF/
>   *      ├── sriov
>   *      │   ├── vf1
> + *      │   │   ├── migration_data
>   *      │   │   ├── pause
>   *      │   │   ├── reset
>   *      │   │   ├── resume
> @@ -159,6 +161,48 @@ DEFINE_VF_CONTROL_ATTRIBUTE(reset_vf);
>  DEFINE_VF_RW_CONTROL_ATTRIBUTE(save_vf);
>  DEFINE_VF_RW_CONTROL_ATTRIBUTE(restore_vf);
>  
> +static ssize_t data_write(struct file *file, const char __user *buf, size_t count, loff_t *pos)
> +{
> +	struct dentry *dent = file_dentry(file);
> +	struct dentry *vfdentry = dent->d_parent;
> +	struct dentry *migration_dentry = vfdentry->d_parent;
> +	unsigned int vfid = (uintptr_t)vfdentry->d_inode->i_private;
> +	struct xe_device *xe = migration_dentry->d_inode->i_private;

we have extract_xe() / extract_vfid() helpers for that

> +
> +	xe_assert(xe, vfid);
> +	xe_sriov_pf_assert_vfid(xe, vfid);
> +
> +	if (*pos)
> +		return -ESPIPE;
> +
> +	return xe_sriov_pf_migration_data_write(xe, vfid, buf, count);
> +}
> +
> +static ssize_t data_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
> +{
> +	struct dentry *dent = file_dentry(file);
> +	struct dentry *vfdentry = dent->d_parent;
> +	struct dentry *migration_dentry = vfdentry->d_parent;
> +	unsigned int vfid = (uintptr_t)vfdentry->d_inode->i_private;
> +	struct xe_device *xe = migration_dentry->d_inode->i_private;
> +
> +	xe_assert(xe, vfid);
> +	xe_sriov_pf_assert_vfid(xe, vfid);
> +
> +	if (*ppos)
> +		return -ESPIPE;
> +
> +	return xe_sriov_pf_migration_data_read(xe, vfid, buf, count);
> +}
> +
> +static const struct file_operations data_vf_fops = {
> +	.owner		= THIS_MODULE,
> +	.open		= simple_open,
> +	.write		= data_write,
> +	.read		= data_read,
> +	.llseek		= default_llseek,
> +};
> +
>  static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
>  {
>  	debugfs_create_file("pause", 0200, vfdent, xe, &pause_vf_fops);
> @@ -167,6 +211,7 @@ static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
>  	debugfs_create_file("reset", 0200, vfdent, xe, &reset_vf_fops);
>  	debugfs_create_file("save", 0600, vfdent, xe, &save_vf_fops);
>  	debugfs_create_file("restore", 0600, vfdent, xe, &restore_vf_fops);
> +	debugfs_create_file("migration_data", 0600, vfdent, xe, &data_vf_fops);
>  }
>  
>  static void pf_populate_with_tiles(struct xe_device *xe, struct dentry *dent, unsigned int vfid)
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> index d39cee66589b5..9cc178126cbdc 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> @@ -56,6 +56,18 @@ static bool pf_check_migration_support(struct xe_device *xe)
>  	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
>  }
>  
> +static void pf_migration_cleanup(struct drm_device *dev, void *arg)
> +{
> +	struct xe_sriov_pf_migration *migration = arg;
> +
> +	if (!IS_ERR_OR_NULL(migration->pending))
> +		xe_sriov_pf_migration_data_free(migration->pending);
> +	if (!IS_ERR_OR_NULL(migration->trailer))
> +		xe_sriov_pf_migration_data_free(migration->trailer);
> +	if (!IS_ERR_OR_NULL(migration->descriptor))
> +		xe_sriov_pf_migration_data_free(migration->descriptor);

maybe instead of checking IS_ERR_OR_NULL here, move the check to data_free() ?

> +}
> +
>  /**
>   * xe_sriov_pf_migration_init() - Initialize support for SR-IOV VF migration.
>   * @xe: the &struct xe_device
> @@ -65,6 +77,7 @@ static bool pf_check_migration_support(struct xe_device *xe)
>  int xe_sriov_pf_migration_init(struct xe_device *xe)
>  {
>  	unsigned int n, totalvfs;
> +	int err;
>  
>  	xe_assert(xe, IS_SRIOV_PF(xe));
>  
> @@ -76,7 +89,15 @@ int xe_sriov_pf_migration_init(struct xe_device *xe)
>  	for (n = 1; n <= totalvfs; n++) {
>  		struct xe_sriov_pf_migration *migration = pf_pick_migration(xe, n);
>  
> +		err = drmm_mutex_init(&xe->drm, &migration->lock);
> +		if (err)
> +			return err;
> +
>  		init_waitqueue_head(&migration->wq);
> +
> +		err = drmm_add_action_or_reset(&xe->drm, pf_migration_cleanup, migration);
> +		if (err)
> +			return err;
>  	}
>  
>  	return 0;
> @@ -162,6 +183,36 @@ xe_sriov_pf_migration_consume(struct xe_device *xe, unsigned int vfid)
>  	return data;
>  }
>  
> +static int pf_handle_descriptor(struct xe_device *xe, unsigned int vfid,
> +				struct xe_sriov_pf_migration_data *data)
> +{
> +	if (data->tile != 0 || data->gt != 0)
> +		return -EINVAL;
> +
> +	xe_sriov_pf_migration_data_free(data);
> +
> +	return 0;
> +}
> +
> +static int pf_handle_trailer(struct xe_device *xe, unsigned int vfid,
> +			     struct xe_sriov_pf_migration_data *data)
> +{
> +	struct xe_gt *gt;
> +	u8 gt_id;
> +
> +	if (data->tile != 0 || data->gt != 0)
> +		return -EINVAL;
> +	if (data->offset != 0 || data->size != 0 || data->buff || data->bo)
> +		return -EINVAL;

who will free the data packet if we return errors here?

> +
> +	xe_sriov_pf_migration_data_free(data);
> +
> +	for_each_gt(gt, xe, gt_id)
> +		xe_gt_sriov_pf_control_vf_data_eof(gt, vfid);
> +
> +	return 0;
> +}
> +
>  /**
>   * xe_sriov_pf_migration_produce() - Produce a SR-IOV VF migration data packet for device to process
>   * @xe: the &struct xe_device
> @@ -180,6 +231,11 @@ int xe_sriov_pf_migration_produce(struct xe_device *xe, unsigned int vfid,
>  	if (!IS_SRIOV_PF(xe))
>  		return -ENODEV;
>  
> +	if (data->type == XE_SRIOV_MIG_DATA_DESCRIPTOR)
> +		return pf_handle_descriptor(xe, vfid, data);
> +	else if (data->type == XE_SRIOV_MIG_DATA_TRAILER)
> +		return pf_handle_trailer(xe, vfid, data);
> +
>  	gt = xe_device_get_gt(xe, data->gt);
>  	if (!gt || data->tile != gt->tile->id) {
>  		xe_sriov_err_ratelimited(xe, "VF%d Unknown GT - tile_id:%d, gt_id:%d\n",
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c
> index cfc6b512c6674..9a2777dcf9a6b 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c
> @@ -5,7 +5,45 @@
>  
>  #include "xe_bo.h"
>  #include "xe_device.h"
> +#include "xe_sriov_pf_helpers.h"
> +#include "xe_sriov_pf_migration.h"
>  #include "xe_sriov_pf_migration_data.h"
> +#include "xe_sriov_printk.h"
> +
> +static struct mutex *pf_migration_mutex(struct xe_device *xe, unsigned int vfid)
> +{
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
> +	return &xe->sriov.pf.vfs[vfid].migration.lock;
> +}
> +
> +static struct xe_sriov_pf_migration_data **pf_pick_pending(struct xe_device *xe, unsigned int vfid)
> +{
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
> +	lockdep_assert_held(pf_migration_mutex(xe, vfid));
> +
> +	return &xe->sriov.pf.vfs[vfid].migration.pending;
> +}
> +
> +static struct xe_sriov_pf_migration_data **
> +pf_pick_descriptor(struct xe_device *xe, unsigned int vfid)
> +{
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
> +	lockdep_assert_held(pf_migration_mutex(xe, vfid));
> +
> +	return &xe->sriov.pf.vfs[vfid].migration.descriptor;
> +}
> +
> +static struct xe_sriov_pf_migration_data **pf_pick_trailer(struct xe_device *xe, unsigned int vfid)
> +{
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
> +	lockdep_assert_held(pf_migration_mutex(xe, vfid));
> +
> +	return &xe->sriov.pf.vfs[vfid].migration.trailer;
> +}
>  
>  static bool data_needs_bo(struct xe_sriov_pf_migration_data *data)
>  {
> @@ -133,3 +171,318 @@ int xe_sriov_pf_migration_data_init_from_hdr(struct xe_sriov_pf_migration_data *
>  
>  	return mig_data_init(data);
>  }
> +
> +static ssize_t vf_mig_data_hdr_read(struct xe_sriov_pf_migration_data *data,
> +				    char __user *buf, size_t len)
> +{
> +	loff_t offset = sizeof(data->hdr) - data->hdr_remaining;
> +
> +	if (!data->hdr_remaining)
> +		return -EINVAL;
> +
> +	if (len > data->hdr_remaining)
> +		len = data->hdr_remaining;
> +
> +	if (copy_to_user(buf, (void *)&data->hdr + offset, len))
> +		return -EFAULT;
> +
> +	data->hdr_remaining -= len;
> +
> +	return len;
> +}
> +
> +static ssize_t vf_mig_data_read(struct xe_sriov_pf_migration_data *data,
> +				char __user *buf, size_t len)
> +{
> +	if (len > data->remaining)
> +		len = data->remaining;
> +
> +	if (copy_to_user(buf, data->vaddr + (data->size - data->remaining), len))
> +		return -EFAULT;
> +
> +	data->remaining -= len;
> +
> +	return len;
> +}
> +
> +static ssize_t __vf_mig_data_read_single(struct xe_sriov_pf_migration_data **data,
> +					 unsigned int vfid, char __user *buf, size_t len)
> +{
> +	ssize_t copied = 0;
> +
> +	if ((*data)->hdr_remaining)
> +		copied = vf_mig_data_hdr_read(*data, buf, len);
> +	else
> +		copied = vf_mig_data_read(*data, buf, len);
> +
> +	if ((*data)->remaining == 0 && (*data)->hdr_remaining == 0) {
> +		xe_sriov_pf_migration_data_free(*data);
> +		*data = NULL;
> +	}
> +
> +	return copied;
> +}
> +
> +static struct xe_sriov_pf_migration_data **vf_mig_pick_data(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_sriov_pf_migration_data **data;
> +
> +	data = pf_pick_descriptor(xe, vfid);
> +	if (*data)
> +		return data;
> +
> +	data = pf_pick_pending(xe, vfid);
> +	if (*data == NULL)
> +		*data = xe_sriov_pf_migration_consume(xe, vfid);
> +	if (!IS_ERR_OR_NULL(*data))
> +		return data;
> +	else if (IS_ERR(*data) && PTR_ERR(*data) != -ENODATA)
> +		return data;
> +
> +	data = pf_pick_trailer(xe, vfid);
> +	if (*data)
> +		return data;
> +
> +	return ERR_PTR(-ENODATA);
> +}
> +
> +static ssize_t vf_mig_data_read_single(struct xe_device *xe, unsigned int vfid,
> +				       char __user *buf, size_t len)
> +{
> +	struct xe_sriov_pf_migration_data **data = vf_mig_pick_data(xe, vfid);
> +
> +	if (IS_ERR_OR_NULL(data))
> +		return PTR_ERR(data);
> +
> +	return __vf_mig_data_read_single(data, vfid, buf, len);
> +}
> +
> +/**
> + * xe_sriov_pf_migration_data_read() - Read migration data from the device
> + * @gt: the &struct xe_device

@xe

> + * @vfid: the VF identifier
> + * @buf: start address of userspace buffer
> + * @len: requested read size from userspace
> + *
> + * Return: number of bytes that has been successfully read
> + *	   0 if no more migration data is available
> + *	   -errno on failure

you likely need to add some punctuation here to properly render the doc

> + */
> +ssize_t xe_sriov_pf_migration_data_read(struct xe_device *xe, unsigned int vfid,
> +					char __user *buf, size_t len)
> +{
> +	ssize_t ret, consumed = 0;
> +
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +
> +	ret = mutex_lock_interruptible(pf_migration_mutex(xe, vfid));
> +	if (ret)
> +		return ret;
> +
> +	while (consumed < len) {
> +		ret = vf_mig_data_read_single(xe, vfid, buf, len - consumed);
> +		if (ret == -ENODATA)
> +			goto out;
> +		if (ret < 0) {
> +			mutex_unlock(pf_migration_mutex(xe, vfid));
> +			return ret;
> +		}
> +
> +		consumed += ret;
> +		buf += ret;
> +	}
> +
> +out:
> +	mutex_unlock(pf_migration_mutex(xe, vfid));
> +	return consumed;
> +}
> +
> +static ssize_t vf_mig_hdr_write(struct xe_sriov_pf_migration_data *data,
> +				const char __user *buf, size_t len)
> +{
> +	loff_t offset = sizeof(data->hdr) - data->hdr_remaining;
> +	int ret;
> +
> +	if (WARN_ON(!data->hdr_remaining))

xe_WARN_ON(xe, ... ) if having full WARN is really important

> +		return -EINVAL;
> +
> +	if (len > data->hdr_remaining)
> +		len = data->hdr_remaining;
> +
> +	if (copy_from_user((void *)&data->hdr + offset, buf, len))
> +		return -EFAULT;
> +
> +	data->hdr_remaining -= len;
> +
> +	if (!data->hdr_remaining) {
> +		ret = xe_sriov_pf_migration_data_init_from_hdr(data);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return len;
> +}
> +
> +static ssize_t vf_mig_data_write(struct xe_sriov_pf_migration_data *data,
> +				 const char __user *buf, size_t len)
> +{
> +	if (len > data->remaining)
> +		len = data->remaining;
> +
> +	if (copy_from_user(data->vaddr + (data->size - data->remaining), buf, len))
> +		return -EFAULT;
> +
> +	data->remaining -= len;
> +
> +	return len;
> +}
> +
> +static ssize_t vf_mig_data_write_single(struct xe_device *xe, unsigned int vfid,
> +					const char __user *buf, size_t len)
> +{
> +	struct xe_sriov_pf_migration_data **data = pf_pick_pending(xe, vfid);
> +	int ret;
> +	ssize_t copied;
> +
> +	if (IS_ERR_OR_NULL(*data)) {
> +		*data = xe_sriov_pf_migration_data_alloc(xe);
> +		if (*data == NULL)
> +			return -ENOMEM;
> +	}
> +
> +	if ((*data)->hdr_remaining)
> +		copied = vf_mig_hdr_write(*data, buf, len);
> +	else
> +		copied = vf_mig_data_write(*data, buf, len);
> +
> +	if ((*data)->hdr_remaining == 0 && (*data)->remaining == 0) {
> +		ret = xe_sriov_pf_migration_produce(xe, vfid, *data);
> +		if (ret) {
> +			xe_sriov_pf_migration_data_free(*data);
> +			return ret;
> +		}
> +
> +		*data = NULL;
> +	}
> +
> +	return copied;
> +}
> +
> +/**
> + * xe_sriov_pf_migration_data_write() - Write migration data to the device
> + * @gt: the &struct xe_device

@xe

> + * @vfid: the VF identifier
> + * @buf: start address of userspace buffer
> + * @len: requested write size from userspace
> + *
> + * Return: number of bytes that has been successfully written
> + *	   -errno on failure
> + */
> +ssize_t xe_sriov_pf_migration_data_write(struct xe_device *xe, unsigned int vfid,
> +					 const char __user *buf, size_t len)
> +{
> +	ssize_t ret, produced = 0;
> +
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +
> +	ret = mutex_lock_interruptible(pf_migration_mutex(xe, vfid));
> +	if (ret)
> +		return ret;

scoped_cond_guard(mutex_intr, return -EINTR, pf_migration_mutex(xe, vfid)) ?

> +
> +	while (produced < len) {
> +		ret = vf_mig_data_write_single(xe, vfid, buf, len - produced);
> +		if (ret < 0) {
> +			mutex_unlock(pf_migration_mutex(xe, vfid));
> +			return ret;
> +		}
> +
> +		produced += ret;
> +		buf += ret;
> +	}
> +
> +	mutex_unlock(pf_migration_mutex(xe, vfid));
> +	return produced;
> +}
> +
> +#define MIGRATION_DESC_SIZE 4
> +static size_t pf_desc_init(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_sriov_pf_migration_data **desc = pf_pick_descriptor(xe, vfid);
> +	struct xe_sriov_pf_migration_data *data;
> +	int ret;
> +
> +	data = xe_sriov_pf_migration_data_alloc(xe);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	ret = xe_sriov_pf_migration_data_init(data, 0, 0, XE_SRIOV_MIG_DATA_DESCRIPTOR,
> +					      0, MIGRATION_DESC_SIZE);
> +	if (ret) {
> +		xe_sriov_pf_migration_data_free(data);
> +		return ret;
> +	}
> +
> +	*desc = data;
> +
> +	return 0;
> +}
> +
> +static void pf_pending_init(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_sriov_pf_migration_data **data = pf_pick_pending(xe, vfid);
> +
> +	*data = NULL;
> +}
> +
> +#define MIGRATION_TRAILER_SIZE 0
> +static int pf_trailer_init(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_sriov_pf_migration_data **trailer = pf_pick_trailer(xe, vfid);
> +	struct xe_sriov_pf_migration_data *data;
> +	int ret;
> +
> +	data = xe_sriov_pf_migration_data_alloc(xe);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	ret = xe_sriov_pf_migration_data_init(data, 0, 0, XE_SRIOV_MIG_DATA_TRAILER,
> +					      0, MIGRATION_TRAILER_SIZE);
> +	if (ret) {
> +		xe_sriov_pf_migration_data_free(data);
> +		return ret;
> +	}
> +
> +	*trailer = data;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_sriov_pf_migration_data_save_init() - Initialize the pending save migration data.
> + * @gt: the &struct xe_device
> + * @vfid: the VF identifier
> + *
> + * Return: 0 on success, -errno on failure
> + */
> +int xe_sriov_pf_migration_data_save_init(struct xe_device *xe, unsigned int vfid)
> +{
> +	int ret;
> +
> +	ret = mutex_lock_interruptible(pf_migration_mutex(xe, vfid));
> +	if (ret)
> +		return ret;
> +
> +	ret = pf_desc_init(xe, vfid);
> +	if (ret)
> +		goto out;
> +
> +	ret = pf_trailer_init(xe, vfid);
> +	if (ret)
> +		goto out;
> +
> +	pf_pending_init(xe, vfid);
> +
> +out:
> +	mutex_unlock(pf_migration_mutex(xe, vfid));
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.h
> index 1dde4cfcdbc47..5b96c7f224002 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.h
> @@ -28,5 +28,10 @@ void xe_sriov_pf_migration_data_free(struct xe_sriov_pf_migration_data *snapshot
>  int xe_sriov_pf_migration_data_init(struct xe_sriov_pf_migration_data *data, u8 tile_id, u8 gt_id,
>  				    unsigned int type, loff_t offset, size_t size);
>  int xe_sriov_pf_migration_data_init_from_hdr(struct xe_sriov_pf_migration_data *snapshot);
> +ssize_t xe_sriov_pf_migration_data_read(struct xe_device *xe, unsigned int vfid,
> +					char __user *buf, size_t len);
> +ssize_t xe_sriov_pf_migration_data_write(struct xe_device *xe, unsigned int vfid,
> +					 const char __user *buf, size_t len);
> +int xe_sriov_pf_migration_data_save_init(struct xe_device *xe, unsigned int vfid);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> index 80fdea32b884a..c5d75bb7f39c0 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> @@ -7,6 +7,7 @@
>  #define _XE_SRIOV_PF_MIGRATION_TYPES_H_
>  
>  #include <linux/types.h>
> +#include <linux/mutex_types.h>
>  #include <linux/wait.h>
>  
>  struct xe_sriov_pf_migration_data {
> @@ -32,6 +33,14 @@ struct xe_sriov_pf_migration_data {
>  struct xe_sriov_pf_migration {
>  	/** @wq: waitqueue used to avoid busy-waiting for snapshot production/consumption */
>  	wait_queue_head_t wq;
> +	/** @lock: Mutex protecting the migration data */
> +	struct mutex lock;
> +	/** @pending: currently processed data packet of VF resource */
> +	struct xe_sriov_pf_migration_data *pending;
> +	/** @trailer: data packet used to indicate the end of stream */
> +	struct xe_sriov_pf_migration_data *trailer;
> +	/** @descriptor: data packet containing the metadata describing the device */
> +	struct xe_sriov_pf_migration_data *descriptor;
>  };
>  
>  #endif

