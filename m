Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EBE9505A0
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 14:54:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE4C10E337;
	Tue, 13 Aug 2024 12:54:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UJo9fla0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02DFC10E336;
 Tue, 13 Aug 2024 12:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723553666; x=1755089666;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=z8g/CtjIcyRQS1ai102YUMVYXxUghRQ19w6BaqVKdDQ=;
 b=UJo9fla0GN7bWHDACa2EDBLru3+/HIU3mJCTgfsLsHLPlY1GOXPua+6U
 oiEtRnqaw/EVm+kz2SFaYXFoklqsW85wGA+rEE7Z+JBiASiX/W2l5SaWF
 vnck4S/EQygEmCIerVn6zLxB9oGP3CwDj32kEhJu19q/f3heeIWdtrbmd
 6xI1YJpnaAJSjZd1yEEAEKeMyK68aNzcAG/Loj4FF1SZrNxjPpOkaBCK6
 0bAWbRyYyu8L5Ck7Xzg7SoggKLVwamflApvN0o02e2QQsk+nXlIbxOBfS
 Jsy95AJCVZcrUOdVDOAcg3+T3ET6+/TiWPJYZXe20JHfFyLR4H0kBEr5w A==;
X-CSE-ConnectionGUID: wmdGRzQgTkqdGcHpTHaMRQ==
X-CSE-MsgGUID: fKS3yX24TMiMlYDPIuIqOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="24623537"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="24623537"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 05:54:25 -0700
X-CSE-ConnectionGUID: QFD+G4BaQj2syy8nBAw1VQ==
X-CSE-MsgGUID: SvduvZuSTmOI88cprinuaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="63519451"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Aug 2024 05:54:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 05:54:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 05:54:24 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 13 Aug 2024 05:54:24 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 13 Aug 2024 05:54:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jFUmCrZscFzLZ2PayOw8B1cdxJTP4t8n598Ma+y3uNK0owfsVUFoXQVC5zTsqmScSIoMYD9Rq2G1SJjQxnybDdHGpMe85fzCns9QtlWKNoRuzwESreqfG7awSMDpT9JCcxuq9FGM+zJOMuX6JpRnR1c+Vkw78icOSJpi2E5qiKSNVavw4je66vc+13bVuo2t4pRoLoE9/4Q5+da63D8tfhWbymQYLpaXgjmnh2KC3V/GbyU3yokIYDKF7wf/S+2XZIUKMrhLmvm8JQWdjCh24sWiWkcV3PQ09mybV/9EHeWBSCxT7Z1aMoHEfgTK6d822nF4I/E27dZZ2zZSU3Ynhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TuiTdy7Q5h0SgLSYxSaQGnx+2zYqYVIYMfe6TGboMgQ=;
 b=Wl7mqJz9iU+mRf8x8ARsFKnymC8Wx1YroRFuHnDGzEIeee7NOGWFMySnjIxljep1JXF58b5N/lMnstXZa2jGRJvjrvfI4FezVkUFBuMsMoA/J2e13plUk4jK7ODoj5MZqBQw8frL6OTrLpXUToQfDwnHvZcktDjEhiayyferAi9xw9wPlCZCTN66xyIOsyGJJeYHATK5cNlp+RV41ZWZeD3z0QaRrAaNJMHvwGsMTydaPqdPPW0FCpdjIiwcaHJrGJswtdjC8gGMeYYV93cqUrlMxcxqBHltfwISady3znBdme6BqYk5Om2Zxh2Af0kDrwFrIQt6HJ71rWiLFw+3AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CO1PR11MB4833.namprd11.prod.outlook.com (2603:10b6:303:99::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Tue, 13 Aug
 2024 12:54:21 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%6]) with mapi id 15.20.7828.031; Tue, 13 Aug 2024
 12:54:19 +0000
Message-ID: <7af76e18-8cdd-4089-befe-944d01af90ea@intel.com>
Date: Tue, 13 Aug 2024 18:24:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/msm: clean up fault injection usage
To: Jani Nikula <jani.nikula@intel.com>, <linux-kernel@vger.kernel.org>
CC: <intel-xe@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <akinobu.mita@gmail.com>,
 <akpm@linux-foundation.org>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>,
 <dmitry.baryshkov@linaro.org>
References: <20240813121237.2382534-1-jani.nikula@intel.com>
 <20240813121237.2382534-2-jani.nikula@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240813121237.2382534-2-jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0012.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::11) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CO1PR11MB4833:EE_
X-MS-Office365-Filtering-Correlation-Id: e183fabc-1976-497d-a8f6-08dcbb970bcb
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGNtaTRTY3gybDQxenJYL1ZZRldYcWtJQjR5YzhIcWhSVXowOUVaVkRrODlr?=
 =?utf-8?B?cUVaVlVLZHczbjVmdEl0YzZrUXhob0JXeml4d29LSjNNem9vcDdCcHprTDZo?=
 =?utf-8?B?Z013cTNzM3Vod2xYTG8wYnM2Qy9MUWFucElGdDJXMXBaT3ozc1dFZFltR1h5?=
 =?utf-8?B?NmtuaWFIWUJVME5vQk55Qlh3RnhoZ1NTQTI4d2RRTFVNY0RmaktqUVVFVFBQ?=
 =?utf-8?B?cVJZcVdwd3pRSnhGN1JKY3VIemlEN1Y0clE5eTZqV0k0VXljdy9MQUFWN3hl?=
 =?utf-8?B?d2RUUlhvaFZPekg1RFR1N1VFVHFvVDdWOGx4M2ZQWXJvdzdYK1Z3OG9IUkUx?=
 =?utf-8?B?K2dzYjZmV0pYTDRVbER3Nm96VmZYSnRJODBneitUTHM5aDEvbkQ4K3lJRHVn?=
 =?utf-8?B?S0lGa1dqYWl1UnhHVXNjWlFQRWVLSy9FL1RpMThsTkJqdXJYK2hLV0NyTWJO?=
 =?utf-8?B?b2duN1RVYTd3Zi81S1pLOWRZMjh3dzhhQzFhbFIyRi9pQ0VLcGE1QS82dm51?=
 =?utf-8?B?UXRiNVU4UzhxR1hnQ3kzeWtyR2ZWVmpqRWI1M0dKS2JIakhsK3c4Sk9PNGpu?=
 =?utf-8?B?NGh5a1RmUlFHSDlHVkpyNjcvNEJ6OGhkL1l6bFJoRW9obSt4TDhQZ2JQM0Jy?=
 =?utf-8?B?RVZxNWQ4a21NdzRqMnR2WGhrM1czUEtUZlY3UzNZZWtYTm5Ndm1sM0wweDl4?=
 =?utf-8?B?YXByaVZlT3loNFFjMWZmOHFlSkNaRVRxQkpFS29hUEU3MDJwSmdaWklBQ3pm?=
 =?utf-8?B?cEZ3QzdvNVB0VHVIQ1AvZUxubm1RMmExbkpGWUExOUFTUjNaUFRrL0wrak9w?=
 =?utf-8?B?NmxRK3J4ZUsrUW01Y3RRdGk0Zmp3bkphV3dQZS9kdmY3c3Ryb0xETlg1cGlh?=
 =?utf-8?B?VUlYYU1scE1vRXhleGhuNWpCejlDamF6eHFrOUY1MnBrMXRKSDVwQ1NoaFdL?=
 =?utf-8?B?cFBZR3h5UGdxVHBQQ2hCNE9OUkxycGg1Tk1wczA3TVJhVUFLNncvVUZMQzNj?=
 =?utf-8?B?MzJqZEFhWVNRbGtCVXBqMjVhM0xxNSsvR2FsUFErU0NwYU55UjZoWGJhTzk4?=
 =?utf-8?B?bjRSUnJzYVBCL2FKcDFYWEZReWI5d2tZc2hYRG5FQUFPRkpTQWpmTENqYzZs?=
 =?utf-8?B?RG9KZUNFQTNRRmdJVVhmYytzb1JwWXdMVFBKRDRyY2hMMDRrUWVCK1NWaUFB?=
 =?utf-8?B?VjArM0xPVmpxNmxvNVNiYmhmZzRTNkdUL0gzTmNWT2QxUUMxMXBrU1lqT3lm?=
 =?utf-8?B?cWFZRHpKbVlrTjArQ2lLNXFUTG5WTDZVc0d4clpGM3Z2NEtYQlNCU0tabk03?=
 =?utf-8?B?WkUzMzM0M0Q4ZloxNXAwR2ZLWENtZ2hzaVdyTWNqb1lxeTFjdVZkYnRNcHZp?=
 =?utf-8?B?NWMyZ3pKZDlab3BtTFNFLzFsUDdnV1pkR3hxM3lUTVp6bmRoKzJ1bC9IZWRY?=
 =?utf-8?B?bGd0Y1AzdGFyaWlnd3NZNWM4RjZieUx2NlhhTXZlbjZZOHJ2WW5wdGY2cTF4?=
 =?utf-8?B?YW5nbktKdzBFeXFYVVlsamhyRkY5L1BLRVJ3cHpJbktKelJvUDU1QzdkSDVo?=
 =?utf-8?B?RjhQQ2NPVTdBUnhSazJWVWdUbmtrTitOOWV4UGxjTndsZWFWN1FteEh2KzA4?=
 =?utf-8?B?UnRCQXZuNlNuc1ErSVl6RUhtOTl6WlZRbm8yYlhlejdsdGk2R2pmU2ZNak5Z?=
 =?utf-8?B?Q1pRWjVJK2VCa3pZMzI1eDZuWDlNcEdySzVUUnZaYjlMT2NNNWRHZVpMNFFu?=
 =?utf-8?B?RGVnSkNxZ0xUWG9DdlJ2TFlhNXpJcG05b1NUOVNIUW9ZWGlJalA2OGVDVTdn?=
 =?utf-8?B?bzg0WnI3M1JGQ1RidldhQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2JuRDhZVkh4cmdERHhUYWwzSFZ4WGdvRGxUekl4SXRKVWI2dXBLT1FPYVpw?=
 =?utf-8?B?MHYxZGM4K3czOUZDcTJnbTVHcXVCZENlV3RHV3ZWZVhEYUljQThCNk01SUpn?=
 =?utf-8?B?SkVhRWtTRStoazFqTVBKb1U1UVV3Zi9MRW1HdDUxVWlpZVYxWE04QzMzZVVM?=
 =?utf-8?B?VHZsQVRqRkVqY01CV0FnZXlYNHlaV2pwRjVWbUQ1dXZNeUVubU1vdUF5K3VL?=
 =?utf-8?B?Nk13a095ZGJTeXNLOUI1b0xlWkNGOEZYVW5sZU9PVFpXSlh3c1FIOW1TUG5O?=
 =?utf-8?B?YnFac3NTQXVwSWIyS0VGNDNaN2ZJWE0xclBsbEx2bFB3c3NaY1QwZTV4QzFN?=
 =?utf-8?B?UGJ2R0o2RGZvTHJkNkljM09oOFgzOGJsSytNejQ3WkdFVnRTTEczYWVocmkx?=
 =?utf-8?B?aS83dFlKSnk2b093RUNGYnVvRi83alRkNmFnYll2cnZRMGVFVkk2djVIcmp5?=
 =?utf-8?B?SklhK2RCV0lwUjEyQWR5UUVLeTZVQU1EWHdyMXpWQnZKNkxyTE9XczBZUHBs?=
 =?utf-8?B?SEhIc0FsN00vVHBDMzRvZ2QyNlBHWEVvV1dianJ6M3FjSm1jVlh6YndvSHMw?=
 =?utf-8?B?M0VsZVIyMjZLUTZwZjIvOU9OemhZWGlwamtkcmgzZldNNURKNWk2bTZxSWh3?=
 =?utf-8?B?Wnl1bkduT1VBNHpUR2FZNERZYVEzOVpIU0JpY2YwOVZFbkpabVVTbmx4VnhC?=
 =?utf-8?B?Z3JIYUdHV2orbFVXdjRLZDZneXhwcjNaK3J3eXlORHAwQUtkWjNWT0FpS2Zi?=
 =?utf-8?B?UGxMbU1Zd1B3WGFnQ0MyMjB4cm1wSnBiMU56MURaVURJekl6ejJtcitSTnBu?=
 =?utf-8?B?TWljbVR1Z1RHV2dIdGxUd2k5OTkwNVhmUjlBUXpveFJjTi9SNDgzOG5vaFRG?=
 =?utf-8?B?c1JUSnF5QjcwNDVVNVd0dXpURHZRSElLQnRuYjNYL0tNTGxqYXlCT0VIZ1o1?=
 =?utf-8?B?K2ZaNmJWT1BaT2RUMk4rWTViaGhUTTlaZllRYk1UdGZ1UktNbnNod3VPcDBp?=
 =?utf-8?B?eE9Ba3FQN1pqQmJKU0pYMVJNQkVGWlExdnZyOWNQWVlEOXZHc3Y2MXdxSWUz?=
 =?utf-8?B?VVNiUmM5QldpWlZPTDFOTmtOUGs3dzQxTVhVVTFzZFdHQXBaNkxUTUNqRlFO?=
 =?utf-8?B?cXo4RDFFTXlmTXQvQ0NJNzE5YmpKb0VyWEtxUGRpbFFCNE1zWDlyT1I2N2VT?=
 =?utf-8?B?cGphYXVCdlVUYU9TY05mZGVpL0owWUxUYm9SZ2k5OUIyUWFyZDNJTktLOWxs?=
 =?utf-8?B?RDdnM3BFRHczWDBiN2xVbzZCanZzUU5rNkRhZjVPMUhNYWNjNVUxc3JrelhZ?=
 =?utf-8?B?cGxoZjlzRXErajIrT0g4SlphRHlwTzBzN3FiaWtTNktuR3ZXSG5mWUw3NnlM?=
 =?utf-8?B?TXpkYWF3cHZCWUF0MEpCMmM3VTZvRlpVc3hPYjE4em1nc284dkFDMTJtU2ZT?=
 =?utf-8?B?WUlyV2FSNCt1ck1GVUlyaWcvakgvRnBSMHdNUnFjK2paWnFFbUwzQVpIb2cv?=
 =?utf-8?B?MGp4U1hvcjdnWlVraWVhNEx0UE9Ec3BmUWxhRG8ya0laTklCaXI4NXVTbktT?=
 =?utf-8?B?Z3JpeGJ4RTNVd2N6NHhNUVNNb3BmS3VIeVFvamRxUE1vNHAzcjZvN0RIV3Bn?=
 =?utf-8?B?dTBFSlhDRFAxUk5sd3FUalNyc2dlQnU2SWplQ2doU0FwOFRNcUlTNUN3UXNo?=
 =?utf-8?B?cWp2TE82Vmh2YlBhZzc0SytBZm5GNjRYMWxtSDl5UjRva1QxZ1YxT1NMdzhs?=
 =?utf-8?B?WGllek9MZ1M2RXBnaWlzTnQzOG9Qd2pvSERxUENCSHJ1Sm13S2oxYkZnNkQv?=
 =?utf-8?B?UTlqWk54L2QvUDd1NXJ5RGd5K2ozUVE5Q0FSVjRZVytiSmgwTEl3RW05cFVF?=
 =?utf-8?B?YjVqeHYzNE9XWmJrell0STJFY3Bsb05zTUkwYllWNnVHYnMrWGh4SXNOZFNI?=
 =?utf-8?B?c3B4Q1ozMTlLY1R3SmtLSmdsa1QwRXZxZFkrNUVvSHFLalVhU0dLNGJaUjZ2?=
 =?utf-8?B?Y2I1QVg5RDljaURlbTBTaitaWndMVE1JMWdPTUdXck1VMFNhc1lMZFdCMHNE?=
 =?utf-8?B?Q3BmVVo1VHBQYzA5NVQ1dzJlTkwxSUtCdU1xRkhOMDFyV1NkNXpLSGloK2tr?=
 =?utf-8?B?ZWRTbVEyZVYzZkExYmpkQ3REY1kzQ0dOVE1zN0IwbnFSRGRYYXg1bVlSTzNm?=
 =?utf-8?Q?0Zu7l2RQZNw2IoCqx2yoDgw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e183fabc-1976-497d-a8f6-08dcbb970bcb
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 12:54:19.4937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nDJd/UjuKASsdaEbdd8j68YXZrkCYrSWsGe4ms27MFgzjfMSuAjX3cuo4s9/ZHN+IWDAqQLjsbGUG64hJM3LtoHOknCQ20F7uIEcJwfs5ug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4833
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



On 13-08-2024 17:42, Jani Nikula wrote:
> With the proper stubs in place in linux/fault-inject.h, we can remove a
> bunch of conditional compilation for CONFIG_FAULT_INJECTION=n.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Akinobu Mita <akinobu.mita@gmail.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/msm/msm_debugfs.c | 2 --
>   drivers/gpu/drm/msm/msm_drv.c     | 2 --
>   drivers/gpu/drm/msm/msm_drv.h     | 4 ----
>   3 files changed, 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
> index 4494f6d1c7cb..7ab607252d18 100644
> --- a/drivers/gpu/drm/msm/msm_debugfs.c
> +++ b/drivers/gpu/drm/msm/msm_debugfs.c
> @@ -357,12 +357,10 @@ void msm_debugfs_init(struct drm_minor *minor)
>   	if (priv->kms && priv->kms->funcs->debugfs_init)
>   		priv->kms->funcs->debugfs_init(priv->kms, minor);
>   
> -#ifdef CONFIG_FAULT_INJECTION
>   	fault_create_debugfs_attr("fail_gem_alloc", minor->debugfs_root,
>   				  &fail_gem_alloc);
>   	fault_create_debugfs_attr("fail_gem_iova", minor->debugfs_root,
>   				  &fail_gem_iova);
> -#endif
>   }
>   #endif
>   
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 9c33f4e3f822..6938410f4fc7 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -58,10 +58,8 @@ static bool modeset = true;
>   MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disable)");
>   module_param(modeset, bool, 0600);
>   
> -#ifdef CONFIG_FAULT_INJECTION
>   DECLARE_FAULT_ATTR(fail_gem_alloc);
>   DECLARE_FAULT_ATTR(fail_gem_iova);
> -#endif
>   
>   static int msm_drm_uninit(struct device *dev)
>   {
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index be016d7b4ef1..9b953860131b 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -33,12 +33,8 @@
>   #include <drm/msm_drm.h>
>   #include <drm/drm_gem.h>
>   
> -#ifdef CONFIG_FAULT_INJECTION
>   extern struct fault_attr fail_gem_alloc;
>   extern struct fault_attr fail_gem_iova;
> -#else
> -#  define should_fail(attr, size) 0
> -#endif

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   
>   struct msm_kms;
>   struct msm_gpu;
