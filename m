Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A64BAE4D2
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 20:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D633E10E16D;
	Tue, 30 Sep 2025 18:25:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KgfyaP1m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A9A410E61E;
 Tue, 30 Sep 2025 18:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759256724; x=1790792724;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=gswEb61iGPOMtvGSjRYOuH1zMrK+u6w3b3JB5BdgFI8=;
 b=KgfyaP1mJYungZABeFlWPFi6ZwUDF2sCwFmSrRnXLukGDfoK1n888ht2
 oNuOWMfWI8tPkVAtNK7/WJk23124Q+86ImgQC3I9g2K9SRPHx3uDOdsTS
 Bvxz8ILikBgiTuXXta/13CN5OEALtMfWXk6p+aYa2+MXhnzFrNKqRBc4F
 tZ5ogxdQoWI/A+xZe1IE6wttQzUuCcZ4nHZKS4HunB7/s6M+QVu/0SDyf
 GARiKTHmRkMSXfky7PSlZDRjMCgFd2DnaTzRhllFSBqD10nU58MKXlTM/
 D01rImLQuX6zfypfUVZVJf+xvr7oJLTsrlbf6oKrGn+7rcG394jlmOEHs g==;
X-CSE-ConnectionGUID: 3hntfc8RSfC4jZ9MQqn07A==
X-CSE-MsgGUID: 59yED+/hRbGNkxntMZR6tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61634166"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="61634166"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 11:25:23 -0700
X-CSE-ConnectionGUID: 3TYkItfnTmCGSB+nx2eEwA==
X-CSE-MsgGUID: Y3jwhWCHS1uj1njOYCntUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="177863733"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 11:25:24 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 11:25:22 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 11:25:22 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.36) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 11:25:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QbEHMohZb0hbnET8PBVAcsmsNX6eQK/BlHOiqEeM9HlE02ksWv8Zeok5OBL2uTz9sfWJ7kqkOCiVLNG3nfVIWlhCYm45z6dF6C52a8BSouXHDqma69X1lLVinW0wv0kNlCcr/z2q+H499iU+jPfjADGVO+pxCDbFxVPNRdLTW7z6drm1Cs1rrFIPvuRD516ZCJabDOcRP4wehARxLxRMrk4Muod86+dtKUQqmFrMQ6kPpR8AtD4Wb9IwvM0WRRafZU75ISigtK/Awu8dI6hFU5CRVJqXWfpLKvXjTxkr0vt3+Sl/4PudA8AZN3YXpxmIxuhE75GwOlkOcGQYhlRLtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jmg5K9nIVwWBatAsCQPrsvpywb4m1mwyHr989G8dR5Q=;
 b=oeHFIage6QMMeafaZM5uJnLM/MDcetKrlV0fhDKz2XnAdbQIsDil1hnbKY25dcRd5rBtkPcT0kNyidyBkuZnlak/BhC/I65iMDyrLEp5W5/V+cQrFMQCJRRjHi63b2fwHwtFg0tcGudDbHameKtH9u88W4t9N2dpTfaRJ84ysADFNjBOo43DB4Y6EGTwE7kaXW9LAcKSa4CU8xHVZwsTmCNsSIJ1MdcbBrWYEXdVlZnpvQ6K7xJ4apkmTbwXOD52XjDqR8yy0OtGNcFbZgTaFGENifahDoDO77hK7qCTFIauwQlan9d9oLLHiI48s2/LLlt0nFBwkw7OD6M73oL4iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by BL1PR11MB6052.namprd11.prod.outlook.com (2603:10b6:208:394::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 18:25:16 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 18:25:16 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?=
 <ville.syrjala@linux.intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH v6 2/6] drm/dp: Add helpers to query the branch DSC max
 throughput/line-width
Date: Tue, 30 Sep 2025 21:24:46 +0300
Message-ID: <20250930182450.563016-3-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250930182450.563016-1-imre.deak@intel.com>
References: <20250930182450.563016-1-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0005.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::13) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|BL1PR11MB6052:EE_
X-MS-Office365-Filtering-Correlation-Id: 8795cf52-e3cc-462e-f19f-08de004eb40c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OWxRa1ozaDZGb2J1bWtCOVRlYTZ2Mm1VTEkwNnRZRG03ZkQwZXZiS2thVWZi?=
 =?utf-8?B?a1lpbHdVZExDeTdaeWpXV3ZXSm1MVWFjc3BwNHh3SU5sVXg5SFZSRkFCSWNz?=
 =?utf-8?B?VzZvZTBsZW9FdzZySDhQWWdYQnNueFdtYzZJdTdQYzZObSsvcTVhTHNKbGdV?=
 =?utf-8?B?Z2VnTitJNEhnbURwclVLMzlvK3Y2MzlQV25xMHhJK0plTW51dW1MYkxpTnRJ?=
 =?utf-8?B?NDFGZy82My84UmVaSTFTdFFTYkpVWndFVHFEU3Z4andtdS9HalRIZ203MXBO?=
 =?utf-8?B?a3laZ1JTNjJ6d2dGdkxiN1kwSXVxckNieHl6Q2FGOTFaNStRSnpzZE40VkpV?=
 =?utf-8?B?dE1idkw1ZlFvNk12Sk9uR2NidWVINTQvSmh1M0dJZk1wZVB5TGVmYnJaeklm?=
 =?utf-8?B?SmtRSzhzdk9YTEFmWFhKOHFRTDN5SjVSSjVJS09xTktYWDE2bE9LazZ0Vk9M?=
 =?utf-8?B?d0NrWmduQjc4cVZFK2R3cnRuSDNFUXV5L2h0WUxxV0RWZHZMZUtqWWRtQWtC?=
 =?utf-8?B?bEpzOGIyTmduUW4xcnNuQkJZdnRkTTZOKzlzOVlWRThOc0hCTmtUcUJMVWpl?=
 =?utf-8?B?d3BtYm5nUG5rT1Vrc252bjUxMUhESnQ5WEhJdXE3UVQ4QzV4SUdCQW0ySHhQ?=
 =?utf-8?B?dWF2d2lVRUgyb01kS0YrbTI5L1NYVDZ5V05nODRqQUxQbG1ZZk85Y1dtTVdC?=
 =?utf-8?B?QiswTmFXMUhTNStTcFlKb3lHM3hzQUc4QjBiZ2NMd1pUaC90SU5yM2EwUTFq?=
 =?utf-8?B?NTd4dDBlZWdmMkRvRktESVc2cnIwaGNHalMyK21wSHo1ZTBXUkFiRGI1OXIw?=
 =?utf-8?B?b1kvUFBFVjVoK1k5ZjZJVlE2anVTSkhRRnV6MUF0cGtudXFnSTZpN0lvOXZH?=
 =?utf-8?B?TDMxNFQ3L1BXTVVVNGZESUY0ZHk5WWpqcjVOWCt6NWpNWWtkNUwyVUdoN2ov?=
 =?utf-8?B?ZGwxTjNKTDI5cWpHUlhyZVErV3BQbEFrWTdBalNnV21BcHFQM2srRUU2ZXQ3?=
 =?utf-8?B?bTN3YUlMaG9KVnBMbzRxTzdQcWtqd0QzYTRJZDdwbThwak14czdkVzVybjl0?=
 =?utf-8?B?NkpKQnpMZzFtclV1aVZSM3hieWFrS3B3d2dST3Q5cGJjZ3Q1U1Fnb05iKzFa?=
 =?utf-8?B?VjR0bjN0bFhWemNkK255bnVuSnFYNzh5RGtzSWdkWGs1SVlNcER6V2NHazNI?=
 =?utf-8?B?S0NKY21QV1ZZelpYSHVCaTFsRU5lSkZNc3lLc2lKY0l4NXoySWZ0L1l4UnNW?=
 =?utf-8?B?QjN3SWx1MUZwdHppd2ZhUDFrckgyaVNhb05VMCtmNmo0U2Y4MGVqVW9QMjBC?=
 =?utf-8?B?R1hzMExJWGRBYk1VUTZocVVYdkF0S3NPK3pObThCS1VtakhWMzNaMGxZSE0v?=
 =?utf-8?B?TlA0MW5uV1d0TDRONDlmRFpvQW9xSFljMW9LanNleXdYTTNLa2FUY01oRnRl?=
 =?utf-8?B?aEN2cEU3VDJIcVJqQjZKUkdUNlNaMGpveUZ4cmpwaGR4OEQyYjA5OU1LcUNm?=
 =?utf-8?B?Tm1Sblh5RXdWaXZYRytDYVoxYXU3dTVEZ2prN0J0OFJLcEpmWnJ1ckwzMUo0?=
 =?utf-8?B?NTYrT1Rad1dGQmIvdmsyZUwzak5NN2hUVC9MTlJMRmo5NEk0ZHg2c2F6T2lw?=
 =?utf-8?B?c0o3ZWF5Y3I5SFc0cFo3a2xjWEtZT2xBVGlXUHR2WUkremJ3YVlmVmVSckZr?=
 =?utf-8?B?eDNkMUVwY1JBdzRCTXBFeXhSODBDWElmVnVjMHplSGJnUnkxY0hydHpZd1FN?=
 =?utf-8?B?VlVFOVVWVWxNUmNaTFExYlk0cHRmaTlVU1R3K2tNK1JZNy9nWDBSSTRjbk5U?=
 =?utf-8?B?aGtTNUZhS0laZFNTbXl3UGlUWmdISmNzallodnF6NnFva3czV2ZxT3E3eVNy?=
 =?utf-8?B?WkdoeTdCY0JlbkJxdzdhazNOMHdlYTZpcEVwL3k0T3B4QUxlMHdKZ2VwY2J2?=
 =?utf-8?Q?3jHrdqhA25B8ZElmgRkjzMUrsFhpfRYy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXdMWDUvZFdxd1N0alZMZ3czUmVhOFhWcVBBbnZCRDd3SGxnLzVFb3g5bHFo?=
 =?utf-8?B?dzdadTM1WUZ1QXRGQ2xuMUZ5amhyaGo0UEM1RHlWbGJNMytwVXhtT0FFcXJk?=
 =?utf-8?B?Rk5kM0thMmp0OEN5aDdqaHFXLzh2UFhlcGVoYURUcGRoSFZReTdmMFZWNmZ6?=
 =?utf-8?B?d1hiYVNVdnRvd1lscWZJNHBNWksvdjVCVStOVG94THppcmcyU2NOK0piZ2Rj?=
 =?utf-8?B?eEg3SHVEbDVkWEljV1lhRnpSSG9RL1lYVU5MY2tpTnB5aUllV3k0aUdsQXln?=
 =?utf-8?B?Rm4xVGZYeWwySVY0M09Rd3pEZWFtQUpyakdhS3BMellxbzRyRG9RTGdTc0JV?=
 =?utf-8?B?S0kyOTZPTFZSUlhmQm14c1NFUDBqZXFEUEtVQ2ZzTHgyZ0duOTU5YVVjT2w1?=
 =?utf-8?B?Y3hnWTN6enlWUnVrbUhhR0UwZHhlVHRSOERjUGJYa28vOGUwaXhHUktjWDFw?=
 =?utf-8?B?QzZ1cjNuUGU5N3ZBOTNqMyt2cVp2QVBrRlg1V0tXYXlERHYvcWl3QTZ1aEFN?=
 =?utf-8?B?WWJhNFR0SWQrbTJaV2NvL09jci8ycDBjbFQzQUhIbUo2ay9hTE9wMWZydE9U?=
 =?utf-8?B?UnpEMTJueGN6a3FFWS9LckpMMjZqWHZiN3d2ZXV5cUNRdVB1cDlLMmp5dkdS?=
 =?utf-8?B?RnlkellvUTA3WTRCU2RsVWYxNm00Y2lvM2dJQjFKeWhMTW9DZFMvQUU4Q0hN?=
 =?utf-8?B?RGc3WUwxUy8va2I3eXA0TUZxbTZQelNxQ2FHazhOUkxCS2RvOG84MDlXWjVZ?=
 =?utf-8?B?WFE3U1E2MXRFLzR3RnpFUloyYm1Za1hEWlJUQi9OYWRXcTVoZmZtNnprK2ow?=
 =?utf-8?B?WjcweXcxQzk1UlNtd2FON1Jsa1RCbjVWQVlTKzBZanhMUXhHbm1lN2FPYTVo?=
 =?utf-8?B?VllGSWp2eE5PUXNDMEszdktjL3I5aTgvR013TjR6SUNJS1ZPQ0dRT0RyTmVB?=
 =?utf-8?B?VFdKNEduVy9CQkt0enpxSHZTMlp1ZDBsU2g4cUttU0lNM0RIYVljUVEvYkww?=
 =?utf-8?B?RXFtQlkvUk1NbGtxNFJYeDNkNXlxZk9QMEpteWVwMnBOanZPM2gyTjhBN05m?=
 =?utf-8?B?SFRLdFdXQWRMUTJOcGZRRWgydTdoUFlhR252bmdReGdEY3l3Vkx6NGFvYm9P?=
 =?utf-8?B?Sy9kMHJYVnV0MndjNS8vOFc4bGNJZVlMdmF2ZVBpT2tIOUo4ME5WalFwTE8z?=
 =?utf-8?B?R01Xd2s2VUhGUkRtQ1MyQVhoS0FNL1laSzQyYWg2b2R2eUpNZHZUUVUxUGNv?=
 =?utf-8?B?ZTNSYlRuZGFmanhNRU9yaHJCT3VZU0dQcUd3NUpMUDVLM0xWd1YrVDJlVUVx?=
 =?utf-8?B?cSsvc2J5SUlsMzV2b0hYME9JMTVaK1FXbEY2SzBxcUVLdFZrTXNwYTJ3dGdH?=
 =?utf-8?B?clg5WGxFMm80WXNrQXNaS0V3WGZ4SXdaQUhOc3l4ODBjYkhFMERtc1JWRjA5?=
 =?utf-8?B?bmFOMXpzaGRhbUxIYkVXY1M3RjBINWJwdDVBMzhKb3RKcE5wVGxLV1dDRkNM?=
 =?utf-8?B?U1R4cEdUN3hYcVVoVkhaZ2h1NmRSd1F2NEY0b1RJVy9PNVZOazdkK2dPNjRW?=
 =?utf-8?B?bDhzUHZ2VGx3NVB6THh4U2NhZFN2M3R5VTFSNGpwYnAzUVVQdWxvaEwwWVV3?=
 =?utf-8?B?VHFXMWFUelo3WjNESmsyUEJmMVlYM0R2bU83ZitIb3JWSlNQRFRJOXFObkUw?=
 =?utf-8?B?NTMyak40S1dFM0x3Zm85eWZQME9Na2hzMWFSUk1DN09IRjdmUGp3bFhNTVVV?=
 =?utf-8?B?UDFuQ0l0ZUtBWWcvOFI4ZU5McXlZU3drLzl5dUxiSWc3dzh3M0E2YmNabHd1?=
 =?utf-8?B?MWRXSUZuNitYWGtjZzVkVTBuNkxkY3oydXlZZlVkYTFmb3Uxa2YzQWYzSjlJ?=
 =?utf-8?B?MHBncjlHT2t1bS9GNXZWODJ4MmVtck50TnJFOFVBbG5NV1hkSGd0OEg0OFpn?=
 =?utf-8?B?MG9RUWFNcWM4RDRCT3RDTFpMbm1kM1V4eW9kWXBHd2NKRmxpMTJ6VlZQbWZt?=
 =?utf-8?B?ZnVEL1hMUUZmejZNWlltdlQvWEg1N3VzVW1IQTF0SFN4bUIxVHdRTXJWaVU2?=
 =?utf-8?B?K3dEZXhacjhVNDlmY0NaRUo4WEdJMzB1OHNoa0ZaU1k4OWxSZ1F5end1b1Yz?=
 =?utf-8?B?R0RTbjBjaGFPcFNub0hiQWhRWEdjMThSejZlbW1lbHpiam1rdnhxaFZueW1o?=
 =?utf-8?Q?nghsuT9E6IqH38Z0Ber8nFuVfVwGODW9OewGaWTMeTNC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8795cf52-e3cc-462e-f19f-08de004eb40c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 18:25:16.3351 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3AAMLmj0CelUwVqPF0XY7k/5qamGd6wOSnhMMqiGhm4Mfgd50ae94kLuly2KOTC2wswcCr/LzmZZj8mNJ1EEhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6052
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

Add helpers to query the DP DSC sink device's per-slice throughput as
well as a DSC branch device's overall throughput and line-width
capabilities.

v2 (Ville):
- Rename pixel_clock to peak_pixel_rate, document what the value means
  in case of MST tiled displays.
- Fix name of drm_dp_dsc_branch_max_slice_throughput() to
  drm_dp_dsc_sink_max_slice_throughput().
v3:
- Fix the DSC branch device minimum valid line width value from 2560
  to 5120 pixels.
- Fix drm_dp_dsc_sink_max_slice_throughput()'s pixel_clock parameter
  name to peak_pixel_rate in header file.
- Add handling for throughput mode 0 granular delta, defined by DP
  Standard v2.1a.
v4:
- Remove the default switch case in
  drm_dp_dsc_sink_max_slice_throughput(), which is unreachable in the
  current code. (Ville)

Cc: dri-devel@lists.freedesktop.org
Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reported-and-tested-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 152 ++++++++++++++++++++++++
 include/drm/display/drm_dp.h            |   3 +
 include/drm/display/drm_dp_helper.h     |   5 +
 3 files changed, 160 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 1c74fe9459ad9..3d2e9457d60a4 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2844,6 +2844,158 @@ int drm_dp_dsc_sink_supported_input_bpcs(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_S
 }
 EXPORT_SYMBOL(drm_dp_dsc_sink_supported_input_bpcs);
 
+/*
+ * See DP Standard v2.1a 2.8.4 Minimum Slices/Display, Table 2-159 and
+ * Appendix L.1 Derivation of Slice Count Requirements.
+ */
+static int dsc_sink_min_slice_throughput(int peak_pixel_rate)
+{
+	if (peak_pixel_rate >= 4800000)
+		return 600000;
+	else if (peak_pixel_rate >= 2700000)
+		return 400000;
+	else
+		return 340000;
+}
+
+/**
+ * drm_dp_dsc_sink_max_slice_throughput() - Get a DSC sink's maximum pixel throughput per slice
+ * @dsc_dpcd: DSC sink's capabilities from DPCD
+ * @peak_pixel_rate: Cumulative peak pixel rate in kHz
+ * @is_rgb_yuv444: The mode is either RGB or YUV444
+ *
+ * Return the DSC sink device's maximum pixel throughput per slice, based on
+ * the device's @dsc_dpcd capabilities, the @peak_pixel_rate of the transferred
+ * stream(s) and whether the output format @is_rgb_yuv444 or yuv422/yuv420.
+ *
+ * Note that @peak_pixel_rate is the total pixel rate transferred to the same
+ * DSC/display sink. For instance to calculate a tile's slice count of an MST
+ * multi-tiled display sink (not considering here the required
+ * rounding/alignment of slice count)::
+ *
+ *   @peak_pixel_rate = tile_pixel_rate * tile_count
+ *   total_slice_count = @peak_pixel_rate / drm_dp_dsc_sink_max_slice_throughput(@peak_pixel_rate)
+ *   tile_slice_count = total_slice_count / tile_count
+ *
+ * Returns:
+ * The maximum pixel throughput per slice supported by the DSC sink device
+ * in kPixels/sec.
+ */
+int drm_dp_dsc_sink_max_slice_throughput(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
+					 int peak_pixel_rate, bool is_rgb_yuv444)
+{
+	int throughput;
+	int delta = 0;
+	int base;
+
+	throughput = dsc_dpcd[DP_DSC_PEAK_THROUGHPUT - DP_DSC_SUPPORT];
+
+	if (is_rgb_yuv444) {
+		throughput = (throughput & DP_DSC_THROUGHPUT_MODE_0_MASK) >>
+			     DP_DSC_THROUGHPUT_MODE_0_SHIFT;
+
+		delta = ((dsc_dpcd[DP_DSC_RC_BUF_BLK_SIZE - DP_DSC_SUPPORT]) &
+			 DP_DSC_THROUGHPUT_MODE_0_DELTA_MASK) >>
+			DP_DSC_THROUGHPUT_MODE_0_DELTA_SHIFT;	/* in units of 2 MPixels/sec */
+		delta *= 2000;
+	} else {
+		throughput = (throughput & DP_DSC_THROUGHPUT_MODE_1_MASK) >>
+			     DP_DSC_THROUGHPUT_MODE_1_SHIFT;
+	}
+
+	switch (throughput) {
+	case 0:
+		return dsc_sink_min_slice_throughput(peak_pixel_rate);
+	case 1:
+		base = 340000;
+		break;
+	case 2 ... 14:
+		base = 400000 + 50000 * (throughput - 2);
+		break;
+	case 15:
+		base = 170000;
+		break;
+	}
+
+	return base + delta;
+}
+EXPORT_SYMBOL(drm_dp_dsc_sink_max_slice_throughput);
+
+static u8 dsc_branch_dpcd_cap(const u8 dpcd[DP_DSC_BRANCH_CAP_SIZE], int reg)
+{
+	return dpcd[reg - DP_DSC_BRANCH_OVERALL_THROUGHPUT_0];
+}
+
+/**
+ * drm_dp_dsc_branch_max_overall_throughput() - Branch device's max overall DSC pixel throughput
+ * @dsc_branch_dpcd: DSC branch capabilities from DPCD
+ * @is_rgb_yuv444: The mode is either RGB or YUV444
+ *
+ * Return the branch device's maximum overall DSC pixel throughput, based on
+ * the device's DPCD DSC branch capabilities, and whether the output
+ * format @is_rgb_yuv444 or yuv422/yuv420.
+ *
+ * Returns:
+ * - 0:   The maximum overall throughput capability is not indicated by
+ *        the device separately and it must be determined from the per-slice
+ *        max throughput (see @drm_dp_dsc_branch_slice_max_throughput())
+ *        and the maximum slice count supported by the device.
+ * - > 0: The maximum overall DSC pixel throughput supported by the branch
+ *        device in kPixels/sec.
+ */
+int drm_dp_dsc_branch_max_overall_throughput(const u8 dsc_branch_dpcd[DP_DSC_BRANCH_CAP_SIZE],
+					     bool is_rgb_yuv444)
+{
+	int throughput;
+
+	if (is_rgb_yuv444)
+		throughput = dsc_branch_dpcd_cap(dsc_branch_dpcd,
+						 DP_DSC_BRANCH_OVERALL_THROUGHPUT_0);
+	else
+		throughput = dsc_branch_dpcd_cap(dsc_branch_dpcd,
+						 DP_DSC_BRANCH_OVERALL_THROUGHPUT_1);
+
+	switch (throughput) {
+	case 0:
+		return 0;
+	case 1:
+		return 680000;
+	default:
+		return 600000 + 50000 * throughput;
+	}
+}
+EXPORT_SYMBOL(drm_dp_dsc_branch_max_overall_throughput);
+
+/**
+ * drm_dp_dsc_branch_max_line_width() - Branch device's max DSC line width
+ * @dsc_branch_dpcd: DSC branch capabilities from DPCD
+ *
+ * Return the branch device's maximum overall DSC line width, based on
+ * the device's @dsc_branch_dpcd capabilities.
+ *
+ * Returns:
+ * - 0:        The maximum line width is not indicated by the device
+ *             separately and it must be determined from the maximum
+ *             slice count and slice-width supported by the device.
+ * - %-EINVAL: The device indicates an invalid maximum line width
+ *             (< 5120 pixels).
+ * - >= 5120:  The maximum line width in pixels.
+ */
+int drm_dp_dsc_branch_max_line_width(const u8 dsc_branch_dpcd[DP_DSC_BRANCH_CAP_SIZE])
+{
+	int line_width = dsc_branch_dpcd_cap(dsc_branch_dpcd, DP_DSC_BRANCH_MAX_LINE_WIDTH);
+
+	switch (line_width) {
+	case 0:
+		return 0;
+	case 1 ... 15:
+		return -EINVAL;
+	default:
+		return line_width * 320;
+	}
+}
+EXPORT_SYMBOL(drm_dp_dsc_branch_max_line_width);
+
 static int drm_dp_read_lttpr_regs(struct drm_dp_aux *aux,
 				  const u8 dpcd[DP_RECEIVER_CAP_SIZE], int address,
 				  u8 *buf, int buf_size)
diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index cf318e3ddb5c5..e4eebabab9759 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -258,6 +258,8 @@
 # define DP_DSC_RC_BUF_BLK_SIZE_4           0x1
 # define DP_DSC_RC_BUF_BLK_SIZE_16          0x2
 # define DP_DSC_RC_BUF_BLK_SIZE_64          0x3
+# define DP_DSC_THROUGHPUT_MODE_0_DELTA_SHIFT 3 /* DP 2.1a, in units of 2 MPixels/sec */
+# define DP_DSC_THROUGHPUT_MODE_0_DELTA_MASK  (0x1f << DP_DSC_THROUGHPUT_MODE_0_DELTA_SHIFT)
 
 #define DP_DSC_RC_BUF_SIZE                  0x063
 
@@ -1686,6 +1688,7 @@ enum drm_dp_phy {
 #define DP_BRANCH_OUI_HEADER_SIZE	0xc
 #define DP_RECEIVER_CAP_SIZE		0xf
 #define DP_DSC_RECEIVER_CAP_SIZE        0x10 /* DSC Capabilities 0x60 through 0x6F */
+#define DP_DSC_BRANCH_CAP_SIZE		3
 #define EDP_PSR_RECEIVER_CAP_SIZE	2
 #define EDP_DISPLAY_CTL_CAP_SIZE	5
 #define DP_LTTPR_COMMON_CAP_SIZE	8
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index e438c44409952..df2f24b950e4c 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -211,6 +211,11 @@ u8 drm_dp_dsc_sink_max_slice_count(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
 u8 drm_dp_dsc_sink_line_buf_depth(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE]);
 int drm_dp_dsc_sink_supported_input_bpcs(const u8 dsc_dpc[DP_DSC_RECEIVER_CAP_SIZE],
 					 u8 dsc_bpc[3]);
+int drm_dp_dsc_sink_max_slice_throughput(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
+					 int peak_pixel_rate, bool is_rgb_yuv444);
+int drm_dp_dsc_branch_max_overall_throughput(const u8 dsc_branch_dpcd[DP_DSC_BRANCH_CAP_SIZE],
+					     bool is_rgb_yuv444);
+int drm_dp_dsc_branch_max_line_width(const u8 dsc_branch_dpcd[DP_DSC_BRANCH_CAP_SIZE]);
 
 static inline bool
 drm_dp_sink_supports_dsc(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
-- 
2.49.1

