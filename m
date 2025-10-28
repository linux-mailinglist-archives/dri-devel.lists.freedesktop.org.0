Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEA8C1353B
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 08:38:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43A910E00E;
	Tue, 28 Oct 2025 07:38:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P75qKGEk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B153610E00E;
 Tue, 28 Oct 2025 07:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761637113; x=1793173113;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=C+RrBm1CllPmppu5YodgpKlq2OIkF6vulEnRxuMvD3s=;
 b=P75qKGEkZLDry+D3pnqMJgZ6KD/R1RQSF0lnrmjOBVGQ5hy7wCO9crjM
 QL5k87aIHGdhjQtjH64XjeJbduOAqX3u/pDXJuPS9iuDWajyJxuk5V+4A
 AQc8TQKGyFNXi8u9BY/irfnbPhhCczBR5txynHg8oUNSGKpHq5hlT/eSE
 iPV+sL4zCDJdGtv7w1lTrXHMgV1OkdgioxEWUdM4oSA24iauXhD/BN2tb
 dqCq5eeBW24IbHDwaGLQMNp1fg7Zu1z0jLBuPmrcE3K6Vy7N00JqriVFf
 SSQfHFbA1mtK2jZ/SyE1+iM1yzwHMfiuxmrWLuJ9NFqUyjf/oXrt8JRkX A==;
X-CSE-ConnectionGUID: AUWEuFPhSTCHxIKfChQq6g==
X-CSE-MsgGUID: YWzZuA/aRQ6QlPuii3yRbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63637020"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="63637020"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 00:38:33 -0700
X-CSE-ConnectionGUID: nywYoaU/T46myWibllc4JQ==
X-CSE-MsgGUID: cQ8p20ZESbGBjh4erzmalA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="189329277"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 00:38:33 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 00:38:32 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 00:38:32 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.65) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 00:38:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X7zanxKN++uVLTvwYKp+cbo5q4OXiFBb1kjF5lc4rMUiOJiKEYV+3Jb5wcQXq//m74lC5Z6PBkaqz7/fFh7mxWzBrxMev9J2+ksa8yTP06n4b+VT0dmUnXRE8wjjKO2TL14yNJWpckO6p4Y2kLf9Isu1gm0m+65td/uFrMZeJg12D3DhhaSM0BFa01f3ep6kSX2bCoMX3ylq4RNMVKUq6Xq0EQt6T48IBoWKbwDepKilGnSY6fTpgobASF+LDLA9dNK+PK7kwd/I73Iy1f7i6QA5qCaodk+Kz9MuvozoxJVv/IfHuH36wS/h+u0ex2Og03G9a23ET51qtgYPL/dwMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ssdwRNpCqcuXVAhffbQsVYsPl259mT4DFw4kTfaif0c=;
 b=nrU7VkKNKppn2fYGzP4RX9gr0Y4h59XLzPYdPrMjcV1nZspGvrL3tUde7RLGsVLN7O+Xc7i9VkyUFjdxoLB9srL1iXmBb6MjmvvMrJj6jSLnq1BmwD+Zld+D6ykd8HGtrJXu+vlswu/ut5ov1a6noVMrDzgTkWPXbgIS6JdJwB1lpJyR6MEmf5hTtIJfp3XzBt6yg2elXs+hZ+5G9NoSPmNaTVNZofoz2PJfBX6bkYUT0G7oqekjPC7kah1OMpMb1OFr7Hr0QwBT3+z0Z6gIBgIEx8MSu4IggFOrCJ1AdL6+haDH36KFespilcMVN+YSqgv1F24IQoFeAefsuX+1JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW5PR11MB5812.namprd11.prod.outlook.com (2603:10b6:303:193::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 07:38:29 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 07:38:28 +0000
Message-ID: <8c52f6f4-9356-4511-958a-8c4d6e98f764@intel.com>
Date: Tue, 28 Oct 2025 08:38:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/26] drm/xe/pf: Add helpers for VF GGTT migration
 data handling
To: "Tian, Kevin" <kevin.tian@intel.com>, "Winiarski, Michal"
 <michal.winiarski@intel.com>, Alex Williamson <alex.williamson@redhat.com>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, "Yishai
 Hadas" <yishaih@nvidia.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Brost, Matthew" <matthew.brost@intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Laguna,
 Lukasz" <lukasz.laguna@intel.com>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
 <20251021224133.577765-17-michal.winiarski@intel.com>
 <BN9PR11MB5276E25C0636FAFDF1D4FDE48CFDA@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <BN9PR11MB5276E25C0636FAFDF1D4FDE48CFDA@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0028.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::23) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW5PR11MB5812:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a7f3953-0656-4e00-1e17-08de15f4fc96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0ZjR0NuZ3dMRDFnbjc1dU9QNFVJb0JQMVJsN3V0RUlNVHNnSlNGM0FHZjkw?=
 =?utf-8?B?YXlpbVFvS2pSMzJ2WUE1OU5yb1BjbjZod3dzeXRkdWQvZXJBUEQ1MVU0N1FN?=
 =?utf-8?B?MzBGcG55T3NzVERuakZpeFZLZGxQSkp5NDZoZlFFV0lidzA3V2NyS3FqSlo4?=
 =?utf-8?B?NFpHQUw1RlR3Q1BDZnNaOS9LaFVZT2tJc2hEbjVJRHdtdFNrcnlaV2l1Tmlo?=
 =?utf-8?B?dXQzdTFPdCtlRlVTT2IwZ09yN1NqV2U0ZllBa1VZYTFZSEUyN0I0M0dTNFlJ?=
 =?utf-8?B?S1ZOc2JOMUI1d2J2eHU2cjNQNkp0K1d0S0hMZDJiOFdreE5GS2ptcks2aHRB?=
 =?utf-8?B?eTFBWVl5ajY0bUR5V1dHL2hvZTRYWlEzQ29IQnVHNjRmamZmU0FneUdzK2R6?=
 =?utf-8?B?OWsvTFlYMk9WQkJ4dnlEVSt2YnEzSWtkekVLekZQdlh2Vjl0QmdDbFBGdzha?=
 =?utf-8?B?NjF1MjA1azJaOWZrUUcyM0NYOUFWd0JFQ2YwWkV2VURnSXh2N0trQndjM3U5?=
 =?utf-8?B?cGQrTFBPYXFEb0RoeG1LVTJTYkkvdUdnWmNWVERkclVwbHhLM1ZxYU9wbDZQ?=
 =?utf-8?B?WndFR2Qyd1hJLzdpaVBybjVMdEw0UWY0WmM1TlhZRDNNQjhqY05BY3F1Zm1v?=
 =?utf-8?B?bVZraU5DTUF4bVRoVjY2QXdzd3NUMjYrSUZlTVFaK0laQVhkcWtUeExKT1Uy?=
 =?utf-8?B?ZjJQOGwvRS93SlVFNmhqOHRTZ0xTb214QXhsRGFBWXN2V2hxMVcyeDMwcEdG?=
 =?utf-8?B?RE1VckhoaVZFaU9UUzFPSktBckE5KzhzeFl0ZXEvQWF1UmRaMytKamQ1a1Av?=
 =?utf-8?B?aE9wVlNkaGJzV2FoaFR2UkE5dzZkWENXNE0zWEV3RmVXcHBJSXpKRy9TVmVY?=
 =?utf-8?B?azRmL0J0TXhRUEgwV3NnWGxGR3Z2SW5BSmxmZ2VaVXlaS2U4dkFObytRWnc2?=
 =?utf-8?B?bFJhZjYrUmI4OTYvK2xXTjNFMERheWdYY2pGN2JkNHdOQnd4a0JFWG9vWUJm?=
 =?utf-8?B?WjFKVmwwVEFKWE0xWFAxeTlYREl2NWNoOXMwaklTSzRhNW0rNmFQaUdycE9X?=
 =?utf-8?B?eFh3ZzNEREtxMnhmRTBkbGt2SjJjd1BpNjdPN1NudHplS29NVTZGSkt0Mkcy?=
 =?utf-8?B?N3hJdGhBWXlKM0lCTHBvcktJOW10SExDTnZQcHd3Y29lYkY0SUhyZFpUdWZ4?=
 =?utf-8?B?MUw0d21UZ2kyS3oxc01iVmJFS25FdXJ4Z1lPdi9TeVJ2ZVRMOS8wQWZoRGM5?=
 =?utf-8?B?ZFpYUnpMS2YvRTNqT0xnc2NiVjVHVHZnUWhiTEFTZ0Ezd0lSTmpxMHpTZkt4?=
 =?utf-8?B?bXRpRW56S0pFYXAvVDhtaUtrRkpGUjc4ZDNVL3l6U0FLS0o0dzBKZWc1YUY1?=
 =?utf-8?B?bUFwdDN6K2ZIdGVHMzJaT2VHT1NXSWZCaTdMMHk2VFpnNlM4ME5UTzN1ZWhH?=
 =?utf-8?B?dEVyNm9ENkJjd05kbk9zbDRJb2tXS2JKOVNHZ2RJTW9veUFMSmh5MmNaL2R5?=
 =?utf-8?B?MytxUDJFemsvZ1o3VElnRUtNRWdmWE51TlFpS3BYZlVjK3Nra0Y5MmRrTTlL?=
 =?utf-8?B?ZUE4MlBLWHdSazJLQXlPSjUxRXgwUHJBK0dDWStUWDVqRWVEekdaWkZTQXps?=
 =?utf-8?B?RVQyL3dOOEI5TW1lNjN0VHNHbm9FZzNyR01LSjlIaStaN3FXU0ljRlU5alhI?=
 =?utf-8?B?WG5acCtOWUw0RVl2dktxb29iNktsWFRkYkc4Y3g0UXBXR0FPZEZGM1hEYnpZ?=
 =?utf-8?B?b1NLMUQ0Z0lmN1NIRjBHTklNcjcxcnRWNFJsZUcvcWJ5TVhwRUxmZGoyMU8w?=
 =?utf-8?B?a1NzOHhiQ00rQXZpamd3T3d4cUpvVEZWYW1IdU9LaXI4Z3JycDVtR0phNWEx?=
 =?utf-8?B?MlpnWEk2MStLTlBoRktydTA2MjJOQy9rc2RvZG9WcGNlMFlRWG1WRXJBR043?=
 =?utf-8?B?OUREaTZsdHNLZHV1NlBUbUxzUk5mREtBeWY3RitFRWF5RW5KQ2xESXprREo5?=
 =?utf-8?Q?ErNbcw+rwceu2qdKh3cE1EYhcmKHpc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0J5S2NTam5LY3J5Zmw0cjFvRitaYVN2ZDMxV0w4NFFkSTIvOFpPc3o2cDdy?=
 =?utf-8?B?VUVySE9tcVNTZk1ZZUtkM09ISGJNcWgyRkUxU2hnN1ZwQWdnclpVUDI3ZVhB?=
 =?utf-8?B?WEdQWHVrUFRmMmpmanhtOFJ2S1dyZzZMaDhlSU15Mk52aS9ibGEvTWVkcHNG?=
 =?utf-8?B?dmIyTWs2ZnNPNHdXSDNhS0R4dDhBaDN3eWt2bTFJR1o2SlQ2NXY0QlpaSjNy?=
 =?utf-8?B?SUR2QWFWSXhnUHkwUGMvT2l3MHNNbzlEdXFZNldVYjR3UVh4TGxXd3lzZEp4?=
 =?utf-8?B?ZXQ3cjl6eWhMT1hqTDJBZm9UMVg2RFYxZmJhSXRUNXdNN09scmhyc2JXSG9W?=
 =?utf-8?B?Ymt2b2NlOVEvbXdqek5oZHdrVWlsY0dBWmVVS2FKajY4NndqSmtCTXpWejBQ?=
 =?utf-8?B?L2dqU3l0T0xVb0FsaGs5bWpIaDdQWmUrczN6V0ZaeHJLUFE1UUd3M2JPd2cx?=
 =?utf-8?B?NjJVdGExRmlCckdIeXo1TjZGV2thOHJ2S0JlU0pHb1NWWGNBN1BRSUdialFG?=
 =?utf-8?B?NDFDTFoybmpjb1kwdS9XZ1JrajJFNGJDcy9oQW42MWpDWHgrYWoyOUp6dUg5?=
 =?utf-8?B?Sm9UNnI1UWpnMXd4MjFaZ092Zy8xWkpTVU1wY2IxR21LZVNvcVB2dGhBR3h3?=
 =?utf-8?B?dDhLTEYrcnZLTWxyVnZiR0h3dmxCMFM3bVh5VU93WloxQ3VEV3ZJUTZIOXlH?=
 =?utf-8?B?M016V1luYjhJbVZEZEQzNFRCOStoU0dKa1RSMWQ4VlQ5dDRWTVZiVUNpZW1V?=
 =?utf-8?B?SkRBNnRZNGVxQ0JKa29vNnVGaE5tQklES1hONUZic0x3V3hHZGxCTVdYNWM1?=
 =?utf-8?B?WGpOanVkMk0wcUxUS2tmeXBuY0ttZDlkYzcwa3kxN3ZmOUx4QndCTXZuQmxw?=
 =?utf-8?B?cTJ6a1hkcy9jTEdPb0NwTUhEdVJDWHpGeStQVVBKazBNanNtMEJaSmE4aU5D?=
 =?utf-8?B?Nklmd1pITlZWMGpvdHppOU9zUnk3eGEvdEtmamVXMm5XNForOFlZWTNFaTd3?=
 =?utf-8?B?OHVFeU4xL1VuVlkvU09EaFRleXlsUmlyZCttN1BSV2RKTUpsTHBwTHBuRldT?=
 =?utf-8?B?OVZjRnpBaXpRdDF0NENEQk5BRzZaamxiUGxhUGpWNUREaVczb0NQYSt5N3hL?=
 =?utf-8?B?Qi9MelhzaHdJV1Bxakl1ZGNiUUlYVUV1Y1IzRzV1bmFocmw3TndpUkF1Q0xB?=
 =?utf-8?B?Z1RlcjhNRnArb09BWkxjRXVZU0ZYTThVQ1ZIMFEvalNPUy9hYVVIeUVPUmxm?=
 =?utf-8?B?Q0ZBMFBOaUVEVjhXRHg0L0FxbzZtaHFCZmpqVHhvTDZJYWZNbmlqZXQ3blJv?=
 =?utf-8?B?MmF6UFNFZFFucitYenp6TmJQZUJEWTlhZU9WM1RoZW5wUGV2Z0JFT0NlTVhZ?=
 =?utf-8?B?eTh5WEt4dnMzcmF6Zi83YjhzNnhwTHRMZEN5SCtoVUxsR29TMk9YWEJZWnpG?=
 =?utf-8?B?MmV6U1pvenQ0a3hqTVBKUWluOTF1N1NmTlpLNXpvNlVZVGtpNFFvUDNEc20x?=
 =?utf-8?B?UUtlbG9ZdGVOOTdJUXJQWEk3KzBwZ2RHaDZoRXYrOWExQTgzNDJBdVB1RE1t?=
 =?utf-8?B?cGZodVc5WXJzREJ2OEkrSzRxUENpL0Rac252VG13SGlzUHlSWk9nTWdublgz?=
 =?utf-8?B?bzhaMG1rQzBvek15ZXd4N0dFelo0MVJzM092T3hHQ1RSUFhOUjZCakNZVVpT?=
 =?utf-8?B?SForTWxtdlNSalZVaE8rNVFZLy9vMmU4bk1ITS9zMGFNeCtkTmUrQlRxMzN2?=
 =?utf-8?B?VzZsK2txOHQ5dmhCMyt5NkZxUC9uRG1TdEQ0MXFaNzBEVFVHdGg4YVRJdFBy?=
 =?utf-8?B?TDhxZUxQaDBDRS9mdmNPc25XT0RNSzJZc3Yyb2JKWkRFaGtGSnJDQ3V0d2dE?=
 =?utf-8?B?TWFmbmEwU2VsS3FVYmZ1cWd3Qk9SbS9Vb0tQcmpsaU53TTVyVWUxL0tNMEJn?=
 =?utf-8?B?MUlrejViZFRMMjZlR2pmZUJaZ2ZyTVBSSUQyR2EwcEU5RW9RQ2NCZmhQTDdv?=
 =?utf-8?B?MmdlR3didEsvTWw3TTdxTVV0cWRjWTdMOVowQWROQ3dyRWZVOFNlUHRuR2tz?=
 =?utf-8?B?cExZQ3NZWGpXcHE0Z0hXakVKakhHdGo4QXd0SE53ZFoxcDMvekk2NHlBdTNT?=
 =?utf-8?B?NnFtcWQrUHJOZG9xdm1CYlR1U0VxM3l6UXgrYkxla013bW44a25WYm41bHB0?=
 =?utf-8?B?MVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a7f3953-0656-4e00-1e17-08de15f4fc96
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 07:38:28.9349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dvWyMfVNhjN/V4WuNZAItlEt9t6IY0/fLdbqH1wByw773V4pSWg35iIuxB0+5vmaTzgRJGNlgSInqRNg/afVYPoAP+tESvMqYo4F42X9IME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5812
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



On 10/28/2025 4:22 AM, Tian, Kevin wrote:
>> From: Winiarski, Michal <michal.winiarski@intel.com>
>> Sent: Wednesday, October 22, 2025 6:41 AM
>>
>> +int xe_ggtt_node_load(struct xe_ggtt_node *node, const void *src, size_t
>> size, u16 vfid)
>> +{
>> +	u64 vfid_pte = xe_encode_vfid_pte(vfid);
>> +	const u64 *buf = src;
>> +	struct xe_ggtt *ggtt;
>> +	u64 start, end;
>> +
>> +	if (!node)
>> +		return -ENOENT;
>> +
>> +	guard(mutex)(&node->ggtt->lock);
>> +
>> +	ggtt = node->ggtt;
>> +	start = node->base.start;
>> +	end = start + size - 1;
>> +
>> +	if (xe_ggtt_pte_size(ggtt, node->base.size) != size)
>> +		return -EINVAL;
>> +
>> +	while (start < end) {
>> +		ggtt->pt_ops->ggtt_set_pte(ggtt, start, (*buf &
>> ~GGTT_PTE_VFID) | vfid_pte);
>> +		start += XE_PAGE_SIZE;
>> +		buf++;
>> +	}
> 
> static u64 xe_encode_vfid_pte(u16 vfid)
> {
>         return FIELD_PREP(GGTT_PTE_VFID, vfid) | XE_PAGE_PRESENT;
> }
> 
> so above loop blindly set every GGTT entry to valid. Isn't the right
> thing to carry the present bit from the src buffer?

VFs can't modify VALID/PRESENT(0) bit so it must be always set by PF

Bspec: 52395

