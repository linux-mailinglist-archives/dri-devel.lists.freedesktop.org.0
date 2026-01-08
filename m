Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFE4D033E2
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 15:12:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3994810E356;
	Thu,  8 Jan 2026 14:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G+TAECvk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C4F10E1F0;
 Thu,  8 Jan 2026 14:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767881532; x=1799417532;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iicQIK2ds6NTY3zDNgJtIDdVmAp8QlNQ+lMpcThy3II=;
 b=G+TAECvkFjDl+SlmxBGfpGmsU2Pj00GaxQnuEdA31ycDdY7PIqO6sTwi
 CLocBxxQDErJ0SrgWSYozLskMEvzKjelpA2ZgFIXG7/Cg8nX8TtL9NTBs
 UuyTh9x6hQw3frtDrWC+vpoogs6ZI8Gv/iVcTTHP+CsRpkltd4tWeO3Zy
 MEe3lSl6+4Ml08OK0sJWEXvmYCLlFkiJvZjAE2TA4HiwFmF5wDbpqzK4I
 SyVWV6CuxsPHxekH0lTnan9qMaZx9xV+53L0jvSX6W8CbT21lnTUzLi0W
 ZBrvs2iPPY10b4e6XnSHnmmovUqgvKL6kljfeCHDerrqwLdbSn3Mgqw7m g==;
X-CSE-ConnectionGUID: iqufUShzQ5yG98TDaNHPDg==
X-CSE-MsgGUID: 3Vd9VJcLTnWvjARX6elzTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="94728166"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="94728166"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 06:12:11 -0800
X-CSE-ConnectionGUID: eq7iUD52SSKgge27ci8OBw==
X-CSE-MsgGUID: 2P9CPVFyRk6HrqR9za0eRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="203488918"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 06:12:11 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 06:12:11 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 8 Jan 2026 06:12:11 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.8) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 06:12:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vrMd+hx+mlBPZizzrDBL0l3Vy4Pfd6Vclfpjn/SZxEEYnCjf1USX5I1jcHrBaRQyaNTojb1jAE+QXgJjVUKKn7Odr0gP/xrYtiFSeBG6SBY6ZgVhHIJBDejOPzhvRfxzuKl/HvJKgqHeWMBHmm/XPm0SvHMYnKuPtESWJuk+gZ8YGPgkET+sn/KSAR7MiysT/rbzdLKgnMK2PbXAllWXUg94zqVG8cbyHLr/w+YCBKjU9RRNIAHVk9Sa5r2W6HTFysVmrvQXv7ApMVHYOx0yu4C81ILs7eU2uCAn8TqAqU8+fY8Bwtn+0aWpf/RQE06AnRfK9PYxGlOHNsZb2GKpIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IlvbEh2KuSFtKY09ycSkR5uTH2Bzo+Y42IQtCcMkaPk=;
 b=Tzl9m8th0hV6No0A+IDS4g9i65lATlKolULsmRbRWlbdBfleRRFz/+shaF6VNwFr5c8ASfK1u41DjuVvtoJCLDCY0ZV1Uex7dxn11EXQjb8WZoctdgvS5EkKotED3guo/kkqK/ePKTt8RJ4BYRe/RBzusQYCj1rkb6+LZs75kvxgV24QsVsQNygoJSyjDtP/gItYvB4bwAnz/LD9Yn4zxH0s4Gw9t56Vd3xKmYkCNN1wW/mUz4+czRzHEKWqd8aOloiXNhiQnK6rnXXcfMZyQOyte2sCBuZsFfB+6boMUdJJcagaEAaRmvlLRD7UjAlMUHaoQ6VMcqN0Rqs0Qh0QrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CY8PR11MB6914.namprd11.prod.outlook.com (2603:10b6:930:5a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 14:12:06 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b%3]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 14:12:04 +0000
Message-ID: <96fd9dee-20f1-4e1d-84b1-6243251a1e40@intel.com>
Date: Thu, 8 Jan 2026 19:41:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/13] drm: Allow driver-managed destruction of colorop
 objects
To: Alex Hung <alex.hung@amd.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
CC: <harry.wentland@amd.com>, <jani.nikula@linux.intel.com>,
 <louis.chauvet@bootlin.com>, <mwen@igalia.com>, <contact@emersion.fr>,
 <daniels@collabora.com>, <uma.shankar@intel.com>, <suraj.kandpal@intel.com>,
 <nfraprado@collabora.com>, <ville.syrjala@linux.intel.com>,
 <matthew.d.roper@intel.com>
References: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
 <20251219065614.190834-6-chaitanya.kumar.borah@intel.com>
 <4b71d7cd-72d4-4666-8f9e-81a30ce1817f@amd.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <4b71d7cd-72d4-4666-8f9e-81a30ce1817f@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0139.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::12) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|CY8PR11MB6914:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eb9c801-b954-4777-041f-08de4ebfe60c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVZiNS9Qdlo2S1JDNklDbjl6MWM2aml6cmZOclVjaFpoaS9FUGZma2QxaXh5?=
 =?utf-8?B?emlEekJFR2ZlNDlaMEtsV1R1VVVFc25XczJnT3BWMTUrK1NkdWEyNlh4bmh6?=
 =?utf-8?B?TzZOckY3cGoxdy9xZXZCbXJOUU9DdHkyaVdhVDR0ZnBPY1VkM1pubFdqckJC?=
 =?utf-8?B?S0pqeFVaUE1UaHNWcWVjdUIwWU0zditSYlNTQjRZa3lxV2locFg2elRGTlZx?=
 =?utf-8?B?ZlJNZDFES1hkK0lrbGRGZTV0MTZ2WVZNMVhmM0M0M1M0TG1NOXRqU2tXOHpm?=
 =?utf-8?B?YStuVHZTek03MFNCaDBibVNIOU9PTXd2bVNpeHVZN0plUW9KZkVBZFZnd2tB?=
 =?utf-8?B?T08ybzZxRWRWNnJ4V2l1b0svS0wydENxbkpMVk4yS1lqVGFodXM2TEpjd0tH?=
 =?utf-8?B?M3VzMjJQREQ4RXJSQWQzV1NWLzY2SlBmUExQQmt2TVZjYkkwbkplMjVIcEMz?=
 =?utf-8?B?eHo1NkZqQmswY1JIdHRHUzFpWDZSV3hSdmdtRVhrZ2lZbXZQMmVwTlNjUjlC?=
 =?utf-8?B?QjdCdGNIUXZEU1lYZE4ySmM1L2R3SjJUdnJ0dUlrQkxFUVA2Ykk5NkNrWVpz?=
 =?utf-8?B?eWxSWS9wM1V3a3RGc3N2Q2VXc01PcU5aRzhvZEpqdi9qWUwzL2xRSGFJOUFR?=
 =?utf-8?B?OHdCQ1A3a2Q1TXJ6S0JSSndXWnptcllBamdRR2RxbzE1NEtpMXhKa0NYTVpp?=
 =?utf-8?B?MXNYNHl2Vkk4T0phRHNyYVVZenVWVlEzSWY4RUF2KzM2SGdOQmRMVFcxQkRk?=
 =?utf-8?B?aUFPWlZQTXp3c3VGckdPRnNsd1JabVRxVTdLQUxLQzNQam44VFoweEhEd2VZ?=
 =?utf-8?B?RnhpNkRPSmNZZnJXMFZaK0dlMHRXYnBvUXVFYnIweGVhUzllektvWXllRStM?=
 =?utf-8?B?ekV6UEJxanEyVk91ejlzOTNsODNNY01KeXY3QTdDeXBOSUFRM0ZaUlZhajFO?=
 =?utf-8?B?dzJVZmIrbVNkOTQyTTY1L2RDeEFYZXBvTXJnNko5cnRQenlicnRkZUtSblZm?=
 =?utf-8?B?b0FaSzQ5SVVJajZIdlVoTmhzYUYvVms0R3pZa2RjR0ZSMUZIQmZwRHFpT1Nu?=
 =?utf-8?B?K2krdHd4dVZoZVF4K2dKanR6NFNOR2Z4a092WDJ1blVzSTd3M3d4cG50a0pP?=
 =?utf-8?B?WHljNU5LZ1lhdTJMZzUveFE3RXc0eEk3TnRQSWVNYzNwTnZselRxbWlhM21v?=
 =?utf-8?B?enFZNTIwWElhcEQzdUZ3OEIwM2ZIdWpIZ3V4dmh6VzYyQXVyS2FXNC9WRmhC?=
 =?utf-8?B?MGk2YTN6VWg3cW9JeWxSb0hWS1hPRnRYSTkzN1k5S1UyOURJam5VMFB4Wk1T?=
 =?utf-8?B?emVtZk54TFQ4eEd6MUcwMCszdXFhTVlaUmcvdDBLVjBOYlRSSmdKaG5RWUtr?=
 =?utf-8?B?MnhMRGkxWmVSYmxUcDR4U1o0SmZQN0JiQlRNam9qTFZ2cU1QbFM0bzhkazA5?=
 =?utf-8?B?QWs5Zi9hMWI2MlRHaTZNeXZySU9JY3IvY3o2TjdadEJtWS9kbUZkanp5ZDkv?=
 =?utf-8?B?WmVEeENtNGVvRUloUUZBRVpINmZjUXNlaStoTW8yMmdQK3BzS2xlT1JYYytY?=
 =?utf-8?B?QkQ0dmZJdVovVXJ6R1RsWHdIY3FBMGVUT3NqMEV0WHg2SzJuekdVUkNWY1JX?=
 =?utf-8?B?WmNZSDVHUEEvTUt6ekRLVWxIQmJFS1lFRUxIRm45Zkd4dUhObE1Fd2loM0ZI?=
 =?utf-8?B?TWw1WUZqWFNkaGVyN1dOUVUzVW9WY3hKMWY3NC9SWWlzRFhQSG1XZ1Z1RkNJ?=
 =?utf-8?B?VnI1dTczdkRqaXAxeUQwcmZmSVQzK1d5RVJ1QVVUS29FV1VwMGRVN3dKM2gy?=
 =?utf-8?B?YmdiS3NjaEJ0eTk0aWlwVG1FK1RDdmNUSHAzdU5zWDJPV1FRMDVsZ2s0YXh2?=
 =?utf-8?B?alo5NmZKVEkwTkR1djhjZVRvUzArYnBoNlZJcVhpSG1KS1hTKzVhY0hZRXE3?=
 =?utf-8?Q?2mgn1lbruiqL7Pvs/sIlKNVy3JXzsEEL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clRuUnFpRHUwK0dCcHA0SEt2bUErWUorRGhraWFRdFlYclhRbCtMYnVrQjg3?=
 =?utf-8?B?VWVsVXBzQ2ptSldhZGFHSlNQZUJJRk0rbnA3cGV4MTk4UjZNV3FpVDNLVDg3?=
 =?utf-8?B?Rzd6V29oT3pna0l4M0lsK2xZRUZ1Q1RSd0ZQOFRHMS9JQy82Q09MZGZjN0Qx?=
 =?utf-8?B?SlFvNmtZNUxMMTcyenpMSGlkSWhGZzcwdjRIYzd0cVFZMmRLVTI3eElXcEM2?=
 =?utf-8?B?cHA1YjdrUGdkc1FPQTd2MFhFajRMTWg3K0VhLzlZczJOeUc5eWFJK0dhdGU5?=
 =?utf-8?B?aFNQaG1VaC80QzVEcVlvR0J5aVp5eGZIT01veDUrS0VGTWd1Q1ZEYVBra2ZH?=
 =?utf-8?B?NjEwclJLZzdjUldTSEl5a2d5K1RxSkxBbFprYk92TXBkd2NLVHEvSjkxZlNC?=
 =?utf-8?B?TTZYcE53T3JvRk9mdW5paml6V2NLSVlVQUJRSnhDWG8vdzVHTVo2Zy9OTGYz?=
 =?utf-8?B?Y1g3MkJacTB5TDdqUnRQaFhidDhkQWxXb2JXTHpER1BCY0w0Y0VRNXNaZFBU?=
 =?utf-8?B?OWVCRy9pOWs1dE9CWUVKOXBpaWhlVmg3YXhmdyszdDJDeHFmb1FrSld2NEo4?=
 =?utf-8?B?RmZ0RE13R0U2bHZJQldhUFZ0aDFVYkFuQWxadFFHaDk0bGxCZWQzVGd1Tjhp?=
 =?utf-8?B?YkVtRzIwdWE2elROZlhCS0VnU2tNMDdCV3Nqc2VkT2tNakFtbXdFZFJJTHd4?=
 =?utf-8?B?RGY5VzFidGl4cVFCb2laaXNYWEdRRVRuV2thS2xMTE1Ubi9TaW9taGZLelBz?=
 =?utf-8?B?WkhEZ2xQWmY0b1Vsc1NxYVRwZ3gzdHNXRUlkU2ViUndtUW9EYXJKd3VGczIv?=
 =?utf-8?B?dzFUbmVVVFBaQlNHbksrN2loVEpKNEREbENESTA2Uy85Yi9iVU5FRmJuNmJQ?=
 =?utf-8?B?aWo1SzdjSExrb0VIaGZZTjBHWG56Wmc3dGkxWklSeGJKOThBNk1qNjlFOUNo?=
 =?utf-8?B?ZU42QlE4alkxM2ZWdkhERlZVZlk3ell0WG5DT3Ywa1FPUGhySC9tSVN6RE5u?=
 =?utf-8?B?cEVnckJRYjRKM1VTKy9rQXRzbXdQNkRLSGFTTGRUTlErcTVsZ1hmSEpFa1Ev?=
 =?utf-8?B?WnlGS2FxRW9JZG4zd2NMU0ZRRFg0R00vTmNXdTJpU3QzMnFHTmZ0dlozd2Nr?=
 =?utf-8?B?bThZTjZWLzVoNlBaTDVQSUh5cFBPaE45NHd0N1cydzRaQWFMWTd1ZlN6Q1dS?=
 =?utf-8?B?L21ZV0h3Ym5vd1dJcHo2K1JoYU1OT2RFS1J1bkl2aGV4VytvdmFiTTF1ckJP?=
 =?utf-8?B?YlE2TCtlaWdYZThadlppMG5lWkY1ZFJZL1ZBWlZWWG15ODM1YjVra1QxUS9z?=
 =?utf-8?B?YmhTdGx2UGFIQkFyS21oZGZyZU5EaHBEOEc4NXhHUVdMRElPTm0zSFZkSjd0?=
 =?utf-8?B?MVI4R0RvazJ4c2hmR3d1Q3MwcVBRM2dWdml0UGhsNmNyZW5SY2t1emJ2c3JP?=
 =?utf-8?B?NlFGaDVTZTNxbXl4Vm1KODZPak91Nnl4ZUFTekRTMlk2dDUwak0zM1RxNmJL?=
 =?utf-8?B?UWtISFV4WTB5S0JKb3BhUm9hMU9tSkdsMU5MZHRPUkF5MHM5VUJwaW5rSE1w?=
 =?utf-8?B?TEtqMkgxaklRalNkZ2hYVnA3WXhESkc4ZjhrY1BCQ05rQlBCYXRocWQ1OCtv?=
 =?utf-8?B?V0k5dGNRcnpxVXRTNEVSYXh2ejZNN2F6cklWeDZKdFUwOUZWd0xxZ3hVaWMw?=
 =?utf-8?B?anQ1eWpFd3hUWkwvYkRiRGNKR2JUNkx3RWo2YldmeGowZXptQk1RaVI3eXBP?=
 =?utf-8?B?aFBjUmtZRHhYbk1CY2VnN1d2YWlRWS83VWwrTFFRSlU3S1JEMFVPaktuamRM?=
 =?utf-8?B?Uk5WaEZkbVFtZWJMTVRRb3p5MXlZNDFmYW4xWkdyZmI1bVFmbXI2bkloSWpY?=
 =?utf-8?B?TEJ6ZjQ1VjA1RGlseDZTVWRwMnJFRC9yK0Y3TERaeHdQdXJoNktTRmhzb25q?=
 =?utf-8?B?RGhVdzY3VlgzOTV5WkRzbVVGQ3JjNFYyNlJ4cDRKeGlTa2dKbmphMjBHbVdu?=
 =?utf-8?B?dHhQdCtiUzB3ZWFIMnZueXp1OTFzQWpqMGJZenVJeFdLTWZaZllGVWd3MFRZ?=
 =?utf-8?B?ZWppb1hVaCtKSTdEcVh4WGxDTzRTTTV2ZUdqa1pNRm9saTRvNkR0bFo2RXh1?=
 =?utf-8?B?WFI0Um1Vdzd3b21kYlZXYXdPKzJJTVBnUFdVdnVmUHNiOUZka2YwWWJoTkFT?=
 =?utf-8?B?S2tpd1FNNjNWbG5BS0VCNFptSkdCaFFrNy9CRzYzdmttOWxCajQyUFBIQi9u?=
 =?utf-8?B?N255TXJ2OVo5c3hLYitLdWd6WWxtUnVVS2tJTUFDVm5md3MvRWVtNFpHUklL?=
 =?utf-8?B?elJlRDU3SjFZa2hTOEUxZ1FtVXM2Y29pTy9KaHgwUDR2SDdQbXR4QjEyLzV0?=
 =?utf-8?Q?cy2SabP8rQc8HqfQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eb9c801-b954-4777-041f-08de4ebfe60c
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 14:12:04.2635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iSgLDIedWx3NHGfFxnnVVnRKPhVvZZPnigDDKi6qdybznV2UBKEifxSUGIEw0o0BD+EoFgwTSkxUYzrqDNDUemBFt/gD6hFxSmTNDlX1LXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6914
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


On 1/7/2026 5:32 AM, Alex Hung wrote:
> It is a nitpick, but is it better to have patch 6 first, and then 
> separate changes to drm to a single patch, and move the changes in 
> amdgpu, vkms and i915 in the following corresponding patches (7, 8 and 9)?
> 
> We can avoid passing NULL to struct drm_colorop_funcs *funcs.

Thank you very much, Alex, for the review.

I structured the patches this way to keep each patch buildable and to 
keep the existing behavior intact until all changes are in place.

Once the prototypes of the init functions are changed, all call sites 
need to be updated. I couldn’t find a way to keep the DRM changes 
isolated while also preserving per-patch buildability. If I am missing 
something here, please let me know. I can respin accordingly.

In any case, I can move patch 6 ahead of this one.

==
Chaitanya

> 
> Otherwise it looks good to me.
> 
> Reviewed-by: Alex Hung <alex.hung@amd.com>
> 
> On 12/18/25 23:56, Chaitanya Kumar Borah wrote:
>> Some drivers might want to embed struct drm_colorop inside
>> driver-specific objects, similar to planes or CRTCs. In such
>> cases, freeing only the drm_colorop is incorrect.
>>
>> Add a drm_colorop_funcs callback to allow drivers to provide a destroy
>> hook that cleans up the full enclosing object. Make changes in helper
>> functions to accept helper functions as argument. Pass NULL for now
>> to retain current behavior.
>>
>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>> ---
>>   .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 18 ++++++-----
>>   drivers/gpu/drm/drm_colorop.c                 | 31 +++++++++++++------
>>   .../drm/i915/display/intel_color_pipeline.c   |  8 ++---
>>   drivers/gpu/drm/vkms/vkms_colorop.c           | 10 +++---
>>   include/drm/drm_colorop.h                     | 30 +++++++++++++++---
>>   5 files changed, 66 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c 
>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
>> index a2de3bba8346..dfdb4fb4219f 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
>> @@ -72,7 +72,7 @@ int amdgpu_dm_initialize_default_pipeline(struct 
>> drm_plane *plane, struct drm_pr
>>           goto cleanup;
>>       }
>> -    ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
>> +    ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
>>                             amdgpu_dm_supported_degam_tfs,
>>                             DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>       if (ret)
>> @@ -89,7 +89,7 @@ int amdgpu_dm_initialize_default_pipeline(struct 
>> drm_plane *plane, struct drm_pr
>>           goto cleanup;
>>       }
>> -    ret = drm_plane_colorop_mult_init(dev, ops[i], plane, 
>> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>> +    ret = drm_plane_colorop_mult_init(dev, ops[i], plane, NULL, 
>> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>       if (ret)
>>           goto cleanup;
>> @@ -104,7 +104,8 @@ int amdgpu_dm_initialize_default_pipeline(struct 
>> drm_plane *plane, struct drm_pr
>>           goto cleanup;
>>       }
>> -    ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, 
>> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>> +    ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, NULL,
>> +                         DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>       if (ret)
>>           goto cleanup;
>> @@ -120,7 +121,7 @@ int amdgpu_dm_initialize_default_pipeline(struct 
>> drm_plane *plane, struct drm_pr
>>               goto cleanup;
>>           }
>> -        ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
>> +        ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
>>                           amdgpu_dm_supported_shaper_tfs,
>>                           DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>           if (ret)
>> @@ -137,7 +138,8 @@ int amdgpu_dm_initialize_default_pipeline(struct 
>> drm_plane *plane, struct drm_pr
>>               goto cleanup;
>>           }
>> -        ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, 
>> MAX_COLOR_LUT_ENTRIES,
>> +        ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, 
>> NULL,
>> +                            MAX_COLOR_LUT_ENTRIES,
>>                               DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>>                               DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>           if (ret)
>> @@ -154,7 +156,7 @@ int amdgpu_dm_initialize_default_pipeline(struct 
>> drm_plane *plane, struct drm_pr
>>               goto cleanup;
>>           }
>> -        ret = drm_plane_colorop_3dlut_init(dev, ops[i], plane, 
>> LUT3D_SIZE,
>> +        ret = drm_plane_colorop_3dlut_init(dev, ops[i], plane, NULL, 
>> LUT3D_SIZE,
>>                       DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
>>                       DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>           if (ret)
>> @@ -172,7 +174,7 @@ int amdgpu_dm_initialize_default_pipeline(struct 
>> drm_plane *plane, struct drm_pr
>>           goto cleanup;
>>       }
>> -    ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
>> +    ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
>>                             amdgpu_dm_supported_blnd_tfs,
>>                             DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>       if (ret)
>> @@ -189,7 +191,7 @@ int amdgpu_dm_initialize_default_pipeline(struct 
>> drm_plane *plane, struct drm_pr
>>           goto cleanup;
>>       }
>> -    ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, 
>> MAX_COLOR_LUT_ENTRIES,
>> +    ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, 
>> NULL, MAX_COLOR_LUT_ENTRIES,
>>                             DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>>                             DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>       if (ret)
>> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/ 
>> drm_colorop.c
>> index 44eb823585d2..efe61bdd9b24 100644
>> --- a/drivers/gpu/drm/drm_colorop.c
>> +++ b/drivers/gpu/drm/drm_colorop.c
>> @@ -93,7 +93,8 @@ static const struct drm_prop_enum_list 
>> drm_colorop_lut3d_interpolation_list[] =
>>   /* Init Helpers */
>>   static int drm_plane_colorop_init(struct drm_device *dev, struct 
>> drm_colorop *colorop,
>> -                  struct drm_plane *plane, enum drm_colorop_type type,
>> +                  struct drm_plane *plane, const struct 
>> drm_colorop_funcs *funcs,
>> +                  enum drm_colorop_type type,
>>                     uint32_t flags)
>>   {
>>       struct drm_mode_config *config = &dev->mode_config;
>> @@ -109,6 +110,7 @@ static int drm_plane_colorop_init(struct 
>> drm_device *dev, struct drm_colorop *co
>>       colorop->type = type;
>>       colorop->plane = plane;
>>       colorop->next = NULL;
>> +    colorop->funcs = funcs;
>>       list_add_tail(&colorop->head, &config->colorop_list);
>>       colorop->index = config->num_colorop++;
>> @@ -203,6 +205,7 @@ EXPORT_SYMBOL(drm_colorop_pipeline_destroy);
>>    * @dev: DRM device
>>    * @colorop: The drm_colorop object to initialize
>>    * @plane: The associated drm_plane
>> + * @funcs: control functions for the new colorop
>>    * @supported_tfs: A bitfield of supported 
>> drm_plane_colorop_curve_1d_init enum values,
>>    *                 created using BIT(curve_type) and combined with 
>> the OR '|'
>>    *                 operator.
>> @@ -210,7 +213,8 @@ EXPORT_SYMBOL(drm_colorop_pipeline_destroy);
>>    * @return zero on success, -E value on failure
>>    */
>>   int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct 
>> drm_colorop *colorop,
>> -                    struct drm_plane *plane, u64 supported_tfs, 
>> uint32_t flags)
>> +                    struct drm_plane *plane, const struct 
>> drm_colorop_funcs *funcs,
>> +                    u64 supported_tfs, uint32_t flags)
>>   {
>>       struct drm_prop_enum_list enum_list[DRM_COLOROP_1D_CURVE_COUNT];
>>       int i, len;
>> @@ -231,7 +235,7 @@ int drm_plane_colorop_curve_1d_init(struct 
>> drm_device *dev, struct drm_colorop *
>>           return -EINVAL;
>>       }
>> -    ret = drm_plane_colorop_init(dev, colorop, plane, 
>> DRM_COLOROP_1D_CURVE, flags);
>> +    ret = drm_plane_colorop_init(dev, colorop, plane, funcs, 
>> DRM_COLOROP_1D_CURVE, flags);
>>       if (ret)
>>           return ret;
>> @@ -288,20 +292,23 @@ static int drm_colorop_create_data_prop(struct 
>> drm_device *dev, struct drm_color
>>    * @dev: DRM device
>>    * @colorop: The drm_colorop object to initialize
>>    * @plane: The associated drm_plane
>> + * @funcs: control functions for new colorop
>>    * @lut_size: LUT size supported by driver
>>    * @interpolation: 1D LUT interpolation type
>>    * @flags: bitmask of misc, see DRM_COLOROP_FLAG_* defines.
>>    * @return zero on success, -E value on failure
>>    */
>>   int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, 
>> struct drm_colorop *colorop,
>> -                    struct drm_plane *plane, uint32_t lut_size,
>> +                    struct drm_plane *plane,
>> +                    const struct drm_colorop_funcs *funcs,
>> +                    uint32_t lut_size,
>>                       enum drm_colorop_lut1d_interpolation_type 
>> interpolation,
>>                       uint32_t flags)
>>   {
>>       struct drm_property *prop;
>>       int ret;
>> -    ret = drm_plane_colorop_init(dev, colorop, plane, 
>> DRM_COLOROP_1D_LUT, flags);
>> +    ret = drm_plane_colorop_init(dev, colorop, plane, funcs, 
>> DRM_COLOROP_1D_LUT, flags);
>>       if (ret)
>>           return ret;
>> @@ -339,11 +346,12 @@ int drm_plane_colorop_curve_1d_lut_init(struct 
>> drm_device *dev, struct drm_color
>>   EXPORT_SYMBOL(drm_plane_colorop_curve_1d_lut_init);
>>   int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct 
>> drm_colorop *colorop,
>> -                   struct drm_plane *plane, uint32_t flags)
>> +                   struct drm_plane *plane, const struct 
>> drm_colorop_funcs *funcs,
>> +                   uint32_t flags)
>>   {
>>       int ret;
>> -    ret = drm_plane_colorop_init(dev, colorop, plane, 
>> DRM_COLOROP_CTM_3X4, flags);
>> +    ret = drm_plane_colorop_init(dev, colorop, plane, funcs, 
>> DRM_COLOROP_CTM_3X4, flags);
>>       if (ret)
>>           return ret;
>> @@ -363,16 +371,18 @@ EXPORT_SYMBOL(drm_plane_colorop_ctm_3x4_init);
>>    * @dev: DRM device
>>    * @colorop: The drm_colorop object to initialize
>>    * @plane: The associated drm_plane
>> + * @funcs: control functions for the new colorop
>>    * @flags: bitmask of misc, see DRM_COLOROP_FLAG_* defines.
>>    * @return zero on success, -E value on failure
>>    */
>>   int drm_plane_colorop_mult_init(struct drm_device *dev, struct 
>> drm_colorop *colorop,
>> -                struct drm_plane *plane, uint32_t flags)
>> +                struct drm_plane *plane, const struct 
>> drm_colorop_funcs *funcs,
>> +                uint32_t flags)
>>   {
>>       struct drm_property *prop;
>>       int ret;
>> -    ret = drm_plane_colorop_init(dev, colorop, plane, 
>> DRM_COLOROP_MULTIPLIER, flags);
>> +    ret = drm_plane_colorop_init(dev, colorop, plane, funcs, 
>> DRM_COLOROP_MULTIPLIER, flags);
>>       if (ret)
>>           return ret;
>> @@ -391,6 +401,7 @@ EXPORT_SYMBOL(drm_plane_colorop_mult_init);
>>   int drm_plane_colorop_3dlut_init(struct drm_device *dev, struct 
>> drm_colorop *colorop,
>>                    struct drm_plane *plane,
>> +                 const struct drm_colorop_funcs *funcs,
>>                    uint32_t lut_size,
>>                    enum drm_colorop_lut3d_interpolation_type 
>> interpolation,
>>                    uint32_t flags)
>> @@ -398,7 +409,7 @@ int drm_plane_colorop_3dlut_init(struct drm_device 
>> *dev, struct drm_colorop *col
>>       struct drm_property *prop;
>>       int ret;
>> -    ret = drm_plane_colorop_init(dev, colorop, plane, 
>> DRM_COLOROP_3D_LUT, flags);
>> +    ret = drm_plane_colorop_init(dev, colorop, plane, funcs, 
>> DRM_COLOROP_3D_LUT, flags);
>>       if (ret)
>>           return ret;
>> diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c b/ 
>> drivers/gpu/drm/i915/display/intel_color_pipeline.c
>> index 04af552b3648..d3d73d60727c 100644
>> --- a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
>> +++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
>> @@ -25,7 +25,7 @@ int _intel_color_pipeline_plane_init(struct 
>> drm_plane *plane, struct drm_prop_en
>>       colorop = intel_colorop_create(INTEL_PLANE_CB_PRE_CSC_LUT);
>> -    ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, 
>> plane,
>> +    ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, 
>> plane, NULL,
>>                             PLANE_DEGAMMA_SIZE,
>>                             DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>>                             DRM_COLOROP_FLAG_ALLOW_BYPASS);
>> @@ -39,7 +39,7 @@ int _intel_color_pipeline_plane_init(struct 
>> drm_plane *plane, struct drm_prop_en
>>       prev_op = &colorop->base;
>>       colorop = intel_colorop_create(INTEL_PLANE_CB_CSC);
>> -    ret = drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane,
>> +    ret = drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane, 
>> NULL,
>>                            DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>       if (ret)
>>           return ret;
>> @@ -52,7 +52,7 @@ int _intel_color_pipeline_plane_init(struct 
>> drm_plane *plane, struct drm_prop_en
>>           plane->type == DRM_PLANE_TYPE_PRIMARY) {
>>           colorop = intel_colorop_create(INTEL_PLANE_CB_3DLUT);
>> -        ret = drm_plane_colorop_3dlut_init(dev, &colorop->base, 
>> plane, 17,
>> +        ret = drm_plane_colorop_3dlut_init(dev, &colorop->base, 
>> plane, NULL, 17,
>>                              DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
>>                              true);
>>           if (ret)
>> @@ -64,7 +64,7 @@ int _intel_color_pipeline_plane_init(struct 
>> drm_plane *plane, struct drm_prop_en
>>       }
>>       colorop = intel_colorop_create(INTEL_PLANE_CB_POST_CSC_LUT);
>> -    ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, 
>> plane,
>> +    ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, 
>> plane, NULL,
>>                             PLANE_GAMMA_SIZE,
>>                             DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>>                             DRM_COLOROP_FLAG_ALLOW_BYPASS);
>> diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/ 
>> vkms/vkms_colorop.c
>> index d03a1f2e9c41..9e9dd0494628 100644
>> --- a/drivers/gpu/drm/vkms/vkms_colorop.c
>> +++ b/drivers/gpu/drm/vkms/vkms_colorop.c
>> @@ -31,7 +31,7 @@ static int vkms_initialize_color_pipeline(struct 
>> drm_plane *plane, struct drm_pr
>>           goto cleanup;
>>       }
>> -    ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, 
>> supported_tfs,
>> +    ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL, 
>> supported_tfs,
>>                             DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>       if (ret)
>>           goto cleanup;
>> @@ -48,7 +48,8 @@ static int vkms_initialize_color_pipeline(struct 
>> drm_plane *plane, struct drm_pr
>>           goto cleanup;
>>       }
>> -    ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, 
>> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>> +    ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, NULL,
>> +                         DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>       if (ret)
>>           goto cleanup;
>> @@ -64,7 +65,8 @@ static int vkms_initialize_color_pipeline(struct 
>> drm_plane *plane, struct drm_pr
>>           goto cleanup;
>>       }
>> -    ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, 
>> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>> +    ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, NULL,
>> +                         DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>       if (ret)
>>           goto cleanup;
>> @@ -80,7 +82,7 @@ static int vkms_initialize_color_pipeline(struct 
>> drm_plane *plane, struct drm_pr
>>           goto cleanup;
>>       }
>> -    ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, 
>> supported_tfs,
>> +    ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL, 
>> supported_tfs,
>>                             DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>       if (ret)
>>           goto cleanup;
>> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
>> index a3a32f9f918c..45d1b1d3faf9 100644
>> --- a/include/drm/drm_colorop.h
>> +++ b/include/drm/drm_colorop.h
>> @@ -187,6 +187,19 @@ struct drm_colorop_state {
>>       struct drm_atomic_state *state;
>>   };
>> +/**
>> + * struct drm_colorop_funcs - driver colorop control functions
>> + */
>> +struct drm_colorop_funcs {
>> +    /**
>> +     * @destroy:
>> +     *
>> +     * Clean up colorop resources. This is called at driver unload time
>> +     * through drm_mode_config_cleanup()
>> +     */
>> +    void (*destroy)(struct drm_colorop *colorop);
>> +};
>> +
>>   /**
>>    * struct drm_colorop - DRM color operation control structure
>>    *
>> @@ -362,6 +375,8 @@ struct drm_colorop {
>>        */
>>       struct drm_property *next_property;
>> +    /** @funcs: colorop control functions */
>> +    const struct drm_colorop_funcs *funcs;
>>   };
>>   #define obj_to_colorop(x) container_of(x, struct drm_colorop, base)
>> @@ -390,17 +405,22 @@ void drm_colorop_pipeline_destroy(struct 
>> drm_device *dev);
>>   void drm_colorop_cleanup(struct drm_colorop *colorop);
>>   int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct 
>> drm_colorop *colorop,
>> -                    struct drm_plane *plane, u64 supported_tfs, 
>> uint32_t flags);
>> +                    struct drm_plane *plane, const struct 
>> drm_colorop_funcs *funcs,
>> +                    u64 supported_tfs, uint32_t flags);
>>   int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, 
>> struct drm_colorop *colorop,
>> -                    struct drm_plane *plane, uint32_t lut_size,
>> +                    struct drm_plane *plane,
>> +                    const struct drm_colorop_funcs *funcs,
>> +                    uint32_t lut_size,
>>                       enum drm_colorop_lut1d_interpolation_type 
>> interpolation,
>>                       uint32_t flags);
>>   int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct 
>> drm_colorop *colorop,
>> -                   struct drm_plane *plane, uint32_t flags);
>> +                   struct drm_plane *plane, const struct 
>> drm_colorop_funcs *funcs,
>> +                   uint32_t flags);
>>   int drm_plane_colorop_mult_init(struct drm_device *dev, struct 
>> drm_colorop *colorop,
>> -                struct drm_plane *plane, uint32_t flags);
>> +                struct drm_plane *plane, const struct 
>> drm_colorop_funcs *funcs,
>> +                uint32_t flags);
>>   int drm_plane_colorop_3dlut_init(struct drm_device *dev, struct 
>> drm_colorop *colorop,
>> -                 struct drm_plane *plane,
>> +                 struct drm_plane *plane, const struct 
>> drm_colorop_funcs *funcs,
>>                    uint32_t lut_size,
>>                    enum drm_colorop_lut3d_interpolation_type 
>> interpolation,
>>                    uint32_t flags);
> 

