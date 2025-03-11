Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED2AA5C02D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 13:07:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B623910E58B;
	Tue, 11 Mar 2025 12:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EAaBDmaw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA22910E58B;
 Tue, 11 Mar 2025 12:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741694857; x=1773230857;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=47sFcbsxFJEYbfFyryFEMmifMD6Wi+SnVdRNh1fR+c0=;
 b=EAaBDmawZeG5BUP8QijBYL0Wh6m5ELQGRaTq+A68/yfnWTJTPBBPhs/H
 aYjccY9JS5K43Sv/Zq5j0jP0UUYq4yw/4IVOAvZesYuBWhXbXYGyUhzea
 ZTsYZOHLx9AnFnoBtjDtvPq3mMB8tJ1BfGqTIgXAH1Z+I41QJn0Il7ksp
 M2eb4yZj0IFnL37oHVpD3P4BMtuGdyiUrPKEBoOZUuop3ueHixVv78pel
 cP4ePMUU+8ToyqNHVEkA+iO38I11ao++GmvzIkz8F8s2/+fVz0rvsix6o
 MJ76oHKo+b5ASA6garNwTzUq5Ac0erszcr69KrETwWBRGGb5fJy7AS6vU A==;
X-CSE-ConnectionGUID: X37xiUOkRpaFlrZptibIQw==
X-CSE-MsgGUID: gn9ebfo/QZG9dz71tiRpKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42764256"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="42764256"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 05:07:37 -0700
X-CSE-ConnectionGUID: odMvAg/ASl+VvYi0h4Os/A==
X-CSE-MsgGUID: EkucxHStRGmyKYU5jDzljQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="121207207"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 05:07:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 11 Mar 2025 05:07:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 11 Mar 2025 05:07:36 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Mar 2025 05:07:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bt041dl2Ch/7gqhXmbNfIZ6tGF9OhRhTGoApEA8BrD73Lm2Kga14tYfoRDlqq3SoakIk+6tSbKqKPtGbHNnvbO7v0Nu+7V5tg8MC3nm3Gu4jP8FZ+3SLnYpY/DZVHO5Jeiuhe2A9HdDqgOjLBaWzUYOSizkGXbc0s5NwTxOAxsnvqgJKYGkmPaIRkxbc2pQbWv7PeYIFat9ckgj2QqiC7mOUq30aI2m3Y0Fj0R6/fr4TBPpC51LSlG9BziE2fDSlgHMd+2oRkiRy9Wv25zs0vTEkmudnxocl9i/CYK31dJIp2ZO+Uti4cTdENHNqoWuZonqpPcK+Ot9JxUgU4aQU2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dWUbfZnxrgGqv+MwZcmTk+SJfRu4n+a/JSI50WC6/2k=;
 b=bnx6TX5IR0tYvfc8ba3RY9uYdmKc7LMQC0lcYvGDrC+L57aGUrjBmSRuKJ8VNTEPJdITUTJ+NwSXr/V7s47scRrr/5PeEI+L0mWhggEUV/IPmRxy/8/uUaE9NSHXzswlYmH1O7TeCjBtqrOLdgBp/BnZc1sxk6/2fzJvWhlMVEz/nVNbCMYsbyq4aeHGSBCyCRA6QwMUe7VT5tG+zxZVAOPp9pW6j+r3VrdJRMl8lzuf3bZcMs8qcAib5PFtr6CSeLKThaOsTAPRk7djQmUbixHt9w4AwncSFRvtolnq5DdCcx5sKhuz9r12+b3BHm51uHpPuwkTR/icpqu3HV26Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SA2PR11MB5033.namprd11.prod.outlook.com (2603:10b6:806:115::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 12:07:33 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8489.025; Tue, 11 Mar 2025
 12:07:33 +0000
Message-ID: <8d9f16f4-a93d-4a4b-abf9-2762741569bb@intel.com>
Date: Tue, 11 Mar 2025 17:37:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] drm/i915/display: Configure the second scaler for
 sharpness
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20250304102857.326544-1-nemesa.garg@intel.com>
 <20250304102857.326544-8-nemesa.garg@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250304102857.326544-8-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0106.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::24) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SA2PR11MB5033:EE_
X-MS-Office365-Filtering-Correlation-Id: 572a4e1c-a496-4dd6-205b-08dd60954e34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MitXUXR1WjlBRWtFcE1wSVlDMW9OYVBwaEphWFZIc2R4RkExSkk2NTVRMDBo?=
 =?utf-8?B?bHhUVkYrN3NZbjhMZXEzcFFObHNwcXZZdUFoNTVvZEIycWFjNldFVW5HUk1o?=
 =?utf-8?B?TDg4R3JqcERSNEh6NHF0ZTE4cGRzK2FncWdCTnNHNFhZS2REWXVZdzhhUSt4?=
 =?utf-8?B?Vmd0MU1jT054Uld0NFhNOUNsTm41QXVzdEhGY1pYcnJKcGZXMms5UGovZXdy?=
 =?utf-8?B?c09JNEVRbjEwOGRRUWpqTEVqZEs2NlhXcVplVXpQM3M5SVhVNjhYYTlzRytD?=
 =?utf-8?B?VThSVlordnZrbk05cm02WlJ0MmdBdW9QTGtZVFNpdXRYQVpHYWpTL0ZzMmMy?=
 =?utf-8?B?Sjh2TDBGNEw4dEQxVEJqaklIWkNyd0d1MngwK2JHZkZGMmYrNlNWeEp0ZjJJ?=
 =?utf-8?B?Uyt6THZobDhQeFFxaGs0R0kvYkZvdENpcnl6MUd2ZDVjaDhCcGlZU0dSK0Vm?=
 =?utf-8?B?ZGhjVHR5UUw0OENsQVFNY0F0Y25rRUc5bkZhQjBSZndTdWdrR0tyZVdzdlMy?=
 =?utf-8?B?YVZrbzJmLzFmTUdwRWh2aFd1Z2NGRkFGNUJ1ZUgzSCt5SXp6SDJvTms3Vm53?=
 =?utf-8?B?UEFJTUN0dzJSMXliVy9HSlFuMjlYWVpteW96MTBqc0RSb1BVQ2p6M1BSQU9q?=
 =?utf-8?B?NXVVbVMwTzJMM0NLaEVVQmpJcFJYcSsrU0dYTFFvb2ZUWE1lWURicmFHNGZP?=
 =?utf-8?B?TDNscWozNGFmMXh6cWRSR2RMYkFObVpvRmpxcHh4N0U4OVozU1F6UVpkNVZm?=
 =?utf-8?B?UXRJeG1JOEdmQ2hlL2s5Wm1aMUcwUmhHT3RDWWpHTWJTditCRHlYczlwbnEz?=
 =?utf-8?B?NlB5K3FTem1FV0hrVlkxV0Y0TXZJY0l5QmowbGsvTHI1SzBFZ1c5OE9QYk9C?=
 =?utf-8?B?RGwwbGQ3UXBxNWxRUUszSVJHRFVGVlRpVjYydCt6alFnd1JRRjZ4UXB2RTlO?=
 =?utf-8?B?K0UzblRnUHFTUERwUXhqU3h1NjNFSDdKT1R4SVVablZoekJxL0FNTkl6NDF6?=
 =?utf-8?B?aDJjUFc1VVpBdzZoekVvaDhNMVMvT3JwOUVVYUVSR0JDeUM0VFNGLzdMWnA0?=
 =?utf-8?B?bzZ1RmpKbTF2S0lYekgvb0ZLMjI3N1p3bjA2TlZNWGQxVFpNb2xyRVgxbVlm?=
 =?utf-8?B?Ujl1cExrS0xkRkVyMlozVmZHd0E4c1NCS2FtRFRobXg1N3o4b2hWa0FJbStW?=
 =?utf-8?B?UEc1bUNvRWJIb2N6RXgxRWl2bm9ra2liR2xzemo0Y3BQTzJrTTFXZ2t0VFJJ?=
 =?utf-8?B?cElYVkZDRHdxVXlZVHRNZEF3NG84OXN5Q1ZTMjYvWCs2SklnT3F6VTVxRlZX?=
 =?utf-8?B?Z0s4Yi9DVndJMlVWcGxXNEtkdDl0Rk5ZSFQraWVob0JkZ3lLMmpXOThlUW1X?=
 =?utf-8?B?VnpBQUFaOEMrL21wM1hJOWFHTXNRWWxzQjBkRWV1NGVVNytlUk1KaXEwdXVP?=
 =?utf-8?B?RlRybVo5YURKSGtjNUdwQTBmOTE4SUE1U1RkUEkyOWJJNDRrRWVRaEVxUnly?=
 =?utf-8?B?SVkxM3dRaFNuckFDV3I0R0ZWVWxqemdxWWUzQ3hoVkNsNlZFU3FzeVNDZk01?=
 =?utf-8?B?MjBrc1RkWHhmaHRNU3Z4QitNOHJOdW5rM1pJbWJ4Vkt4bXVtaVNRZmdlbGRI?=
 =?utf-8?B?OHRrWFlEQ1M3bSt0elhEV251MDRwdHB6UFIwMk1tSTRPRDRvVzhwYUhPTng0?=
 =?utf-8?B?cG1XODdEd2t5YXR5ZGVmbVFqUHJ0Mis2emVqNmd0VkpwbkU3d0NtWWREUlMx?=
 =?utf-8?B?YXJVZkt2OGhsWXUxK1pkOGN3Kzl3a2JURFhDVHF3eE5SRnJXNVFqZVc4T0Vj?=
 =?utf-8?B?cHZXMjZiQXdEYVhYcFg4QjBra3RocTZpdmdGWVFKdVZZb240OEFyaENhbVg2?=
 =?utf-8?Q?b1D8b+ugTs7yZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3VYZlhOaWlDK0lWcUwzbmZoa2t4VHpVYlc4YzE3VVhvL1A5bHhiQWM2L0N0?=
 =?utf-8?B?dDJWVlFmclNibHJSQnJEcmJBUFdFNWJTQ3VWYXRFZFdlU1AvRW1sVGZXbXJp?=
 =?utf-8?B?ek95cWFpd2xkZFUzQ0ZleCtmbllVcnFCTHltUGtZRzdNazVqQkI5dXUyWTBq?=
 =?utf-8?B?cTNqQmowb0ROZTBhckJUVUpLc2lmYmQ2SjFYQVNZY2JBYUdIdnZCMlRIcHlF?=
 =?utf-8?B?VjVRZmh4dU5EUWdKemFwbGJnSVVaL3B0ZytvRXFDUXB1YlVlMEI5aUZPSGhP?=
 =?utf-8?B?c3dTazViSXNwdkY2TkY5U09jQjk4QnJQcmRFTEtZT01rd05zVllyYUVQNG9Y?=
 =?utf-8?B?di9qcm1ONmk0bzV0VHdkTzdlRjBCcTFEd0hEK0pIZEJzczR6Szh5VFBrUTQx?=
 =?utf-8?B?dDJNakpicCtJczd6Si80S2JINzFOZ09zSWV1dVJndlZ1ZXdHYmxZM2d1Vkxh?=
 =?utf-8?B?ZEx0WjhnNmZ4SG1GUmdrSXhURW80ZTBVdnZ0OE05bkhMc056N21GOEZKV3Y1?=
 =?utf-8?B?T0VIZzNNemZDNDg0VjNyYnppVHJ3Qkg2eW1rNWtGQkdtNlFBOEVvYnVKaEE1?=
 =?utf-8?B?Y3Ztd1F5b3E3VFh4Z2xGcC9jU3UyVmdvazVIVUZnVXpCeU5iT01rYjUvQVBS?=
 =?utf-8?B?WWtna0VoTG9pQlBURTZnVWM0UFN2R0RieWYxQndDVHcrVWxFQzlvaDkwakpJ?=
 =?utf-8?B?dmJCc05hdE92VURCajhWaDZMRlZJd1NJdldDS1NFVUFLait6TGcyQjMyd1ZZ?=
 =?utf-8?B?dFptYTRTUW41VnVUZzVtYVZxaE5MYld1Qmo5NWtZWGh5ZjJuNW1QbGc4cXh4?=
 =?utf-8?B?M3VzaG5HSnJnL0VybEtYR1FpTk94a05wQnoyeUlxaUI3NHhteXJXbExtSDEx?=
 =?utf-8?B?aGpIM1h0Z2x0STMxSXQ5Mzdod2w3OVF2aGxBUjJXZnljam1NdzRFQVJ4bDVq?=
 =?utf-8?B?Ym5YWU1SVCt5L3cvQnNxb3dTenlmU0k0MnpaMThIOG5Gek9BajBsTUlSQlJ6?=
 =?utf-8?B?anRGTHJNZTRUME5uSlF4OWNPNUEwNVp4SE4yVVNPOWdmREwyWE1LdFRNQlBQ?=
 =?utf-8?B?cUFieVVsd2dpZ3lYaGJDYUxVQ1J0THA2Qlhmd0hQbFc0bTJxejFCN2VRaEwx?=
 =?utf-8?B?UVNldTB3MDE4MjBCdmszbWZqa2YrWFNCejhDZHhkNWVscWZxMjk0R3YzNFBN?=
 =?utf-8?B?KzVCYWlHT2JIMnYzMkNncUtjSVc0YXJ3ZUVnV3lhUVdVOWNRQm55S1ZOQ0VF?=
 =?utf-8?B?RmFpQ0Z6alJnZVNKQXFXUklQUmk0bUdLZmxuTDVwNEpoMjRkZWV1alZJQ3dt?=
 =?utf-8?B?SHg4Qk83QmNCZTdxYm5IYTNoQjFmcnUrNStxZlk2WThRNHVXS0cwWFZ0NWhE?=
 =?utf-8?B?bjlGUGZCTEpOVkhtZk1QNzJNQXV2TnZzb242Zm1nTU9JemdzOFJIdk9FdEd6?=
 =?utf-8?B?eU8wU3kzTW5GWXhsZnB4OWNtM05mVDU0NUltSFh1Z3BUVWFwL0N3OHN0aXA1?=
 =?utf-8?B?RGVZZzE2cXBRK0VuRWhtU3d0RlNTWlVubVB5RlZnVm4vWTdnYk1aVjBpVGpy?=
 =?utf-8?B?Rkd5bHpxdlR3d1o4WGFFSGcyWW1GUWRBRlJiWVdQaVhneEhieHljN2RWVFRK?=
 =?utf-8?B?aEM4OWdmZU0yS1BJbXZhME5HUUY4WmpGUkdvd0R0OTQreG90c0kvbHpKL21B?=
 =?utf-8?B?U29QNUVBWUhzNFhMYUxWMEFrWlJ1S1k3S0ZXZGNxZk5aRUttUS9jaStFblkv?=
 =?utf-8?B?UkU2ckgxd1pzSEZtYjZHZTFVWSthYy9vbTlkbmd3ZzFlMDZMbjNhVk83K1Y4?=
 =?utf-8?B?SVI2SlRsYitXWUg1dE1HVWVjV2xTWjZiRVdZVXoxYm8raVp1UGFLRjdWbDVu?=
 =?utf-8?B?WjJzYURSM2FpemhwZlV2cnlLUDh2SWFpZC9WU05HN290dXNNaWw5eThlUmhk?=
 =?utf-8?B?RGdodFNsVzM3aS9oNTAzV20vOExWeFNBWTQyYWFkM0cxcHF3RUhza0h5dmVo?=
 =?utf-8?B?U1FKQU9Kem1IUisxNy9pNktwa213cUlwZkcvM3BVRCtLNDljM0IwU21Halpu?=
 =?utf-8?B?SjVYUEVPai9tYzdrSklZYm4rK3Y0amx5TVNsNlA4Sm40cC96ck9PR2JTUnAr?=
 =?utf-8?B?cHlkaGxQQ2oyQUZTTnR4bSs2cnR6UWFUdkZYRzk5c1hDVDlUbVY3MUxvRFJ0?=
 =?utf-8?B?cEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 572a4e1c-a496-4dd6-205b-08dd60954e34
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 12:07:33.8819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uJ7+HEESgg4jK8CPI8wbkMBR50SJ6bpkjn6gznAqfIFvhyPR/2AxIuF93mjlf4nz/32DOzlnNfFTR7NEBLRkMxEO5Qcoar3/kYeGGE21G98=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5033
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


On 3/4/2025 3:58 PM, Nemesa Garg wrote:
> As only second scaler can be used for sharpness check if it
> is available and also check if panel fitting is also not enabled,
> then set the sharpness. Panel fitting will have the preference
> over sharpness property.
>
> v2: Add the panel fitting check before enabling sharpness
> v3: Reframe commit message[Arun]
> v4: Replace string based comparison with plane_state[Jani]
> v5: Rebase
> v6: Fix build issue
> v7: Remove scaler id from verify_crtc_state[Ankit]
> v8: Change the patch title. Add code comment.
>      Move the config part in patch#6. [Ankit]
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_casf.c    |  8 ++++++
>   drivers/gpu/drm/i915/display/intel_casf.h    |  1 +
>   drivers/gpu/drm/i915/display/intel_display.c |  6 +++--
>   drivers/gpu/drm/i915/display/skl_scaler.c    | 28 +++++++++++++++-----
>   4 files changed, 35 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
> index 15ae555e571e..1d9196c4d22f 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf.c
> +++ b/drivers/gpu/drm/i915/display/intel_casf.c
> @@ -115,6 +115,14 @@ int intel_casf_compute_config(struct intel_crtc_state *crtc_state)
>   	return 0;
>   }
>   
> +bool intel_casf_needs_scaler(const struct intel_crtc_state *crtc_state)
> +{
> +	if (crtc_state->hw.casf_params.casf_enable)
> +		return true;
> +
> +	return false;
> +}
> +
>   static int casf_coeff_tap(int i)
>   {
>   	return i % SCALER_FILTER_NUM_TAPS;
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.h b/drivers/gpu/drm/i915/display/intel_casf.h
> index 507a3fe49753..c75a4b2f3133 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf.h
> +++ b/drivers/gpu/drm/i915/display/intel_casf.h
> @@ -17,5 +17,6 @@ void intel_filter_lut_load(struct intel_crtc *crtc,
>   			   const struct intel_crtc_state *crtc_state);
>   void intel_casf_enable(struct intel_crtc_state *crtc_state);
>   void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state);
> +bool intel_casf_needs_scaler(const struct intel_crtc_state *crtc_state);
>   
>   #endif /* __INTEL_CASF_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index c4b0ec60fded..03acf01cac75 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -60,6 +60,7 @@
>   #include "intel_audio.h"
>   #include "intel_bo.h"
>   #include "intel_bw.h"
> +#include "intel_casf.h"
>   #include "intel_cdclk.h"
>   #include "intel_clock_gating.h"
>   #include "intel_color.h"
> @@ -1956,7 +1957,7 @@ static void get_crtc_power_domains(struct intel_crtc_state *crtc_state,
>   	set_bit(POWER_DOMAIN_PIPE(pipe), mask->bits);
>   	set_bit(POWER_DOMAIN_TRANSCODER(cpu_transcoder), mask->bits);
>   	if (crtc_state->pch_pfit.enabled ||
> -	    crtc_state->pch_pfit.force_thru)
> +	    crtc_state->pch_pfit.force_thru || intel_casf_needs_scaler(crtc_state))
>   		set_bit(POWER_DOMAIN_PIPE_PANEL_FITTER(pipe), mask->bits);

This should be a separate patch.
This patch should be about how casf uses 2nd scaler as pipe scaler and 
the changes and checks required for intel_allocate_scaler.


>   
>   	drm_for_each_encoder_mask(encoder, &dev_priv->drm,
> @@ -2194,7 +2195,7 @@ static u32 ilk_pipe_pixel_rate(const struct intel_crtc_state *crtc_state)
>   	 * PF-ID we'll need to adjust the pixel_rate here.
>   	 */
>   
> -	if (!crtc_state->pch_pfit.enabled)
> +	if (!crtc_state->pch_pfit.enabled || intel_casf_needs_scaler(crtc_state))

Is this really needed?  I am not very sure about this.


>   		return pixel_rate;
>   
>   	drm_rect_init(&src, 0, 0,
> @@ -5299,6 +5300,7 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
>   
>   		PIPE_CONF_CHECK_I(scaler_state.scaler_id);
>   		PIPE_CONF_CHECK_I(pixel_rate);
> +		PIPE_CONF_CHECK_BOOL(hw.casf_params.casf_enable);

Again not part of this patch.


>   
>   		PIPE_CONF_CHECK_X(gamma_mode);
>   		if (IS_CHERRYVIEW(dev_priv))
> diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
> index 39fc537e54f0..93a847c05535 100644
> --- a/drivers/gpu/drm/i915/display/skl_scaler.c
> +++ b/drivers/gpu/drm/i915/display/skl_scaler.c
> @@ -5,6 +5,7 @@
>   
>   #include "i915_drv.h"
>   #include "i915_reg.h"
> +#include "intel_casf.h"
>   #include "intel_casf_regs.h"
>   #include "intel_de.h"
>   #include "intel_display_trace.h"
> @@ -272,7 +273,8 @@ int skl_update_scaler_crtc(struct intel_crtc_state *crtc_state)
>   				 drm_rect_width(&crtc_state->pipe_src),
>   				 drm_rect_height(&crtc_state->pipe_src),
>   				 width, height, NULL, 0,
> -				 crtc_state->pch_pfit.enabled);
> +				 crtc_state->pch_pfit.enabled ||
> +				 intel_casf_needs_scaler(crtc_state));
>   }
>   
>   /**
> @@ -311,7 +313,9 @@ int skl_update_scaler_plane(struct intel_crtc_state *crtc_state,
>   }
>   
>   static int intel_allocate_scaler(struct intel_crtc_scaler_state *scaler_state,
> -				 struct intel_crtc *crtc)
> +				 struct intel_crtc *crtc,
> +				 struct intel_plane_state *plane_state,
> +				 bool casf_scaler)
>   {
>   	int i;
>   
> @@ -319,6 +323,10 @@ static int intel_allocate_scaler(struct intel_crtc_scaler_state *scaler_state,
>   		if (scaler_state->scalers[i].in_use)
>   			continue;
>   
> +		/* CASF needs second scaler */
> +		if (!plane_state && casf_scaler && i != 1)
> +			continue;
> +
>   		scaler_state->scalers[i].in_use = true;
>   
>   		return i;
> @@ -369,7 +377,7 @@ static int intel_atomic_setup_scaler(struct intel_crtc_state *crtc_state,
>   				     int num_scalers_need, struct intel_crtc *crtc,
>   				     const char *name, int idx,
>   				     struct intel_plane_state *plane_state,
> -				     int *scaler_id)
> +				     int *scaler_id, bool casf_scaler)
>   {
>   	struct intel_display *display = to_intel_display(crtc);
>   	struct intel_crtc_scaler_state *scaler_state = &crtc_state->scaler_state;
> @@ -378,12 +386,15 @@ static int intel_atomic_setup_scaler(struct intel_crtc_state *crtc_state,
>   	int vscale = 0;
>   
>   	if (*scaler_id < 0)
> -		*scaler_id = intel_allocate_scaler(scaler_state, crtc);
> +		*scaler_id = intel_allocate_scaler(scaler_state, crtc, plane_state, casf_scaler);
>   
>   	if (drm_WARN(display->drm, *scaler_id < 0,
>   		     "Cannot find scaler for %s:%d\n", name, idx))
>   		return -EINVAL;
>   
> +	if (casf_scaler)
> +		mode = SKL_PS_SCALER_MODE_HQ;

This change also should be a separate patch.


Regards,

Ankit

> +
>   	/* set scaler mode */
>   	if (plane_state && plane_state->hw.fb &&
>   	    plane_state->hw.fb->format->is_yuv &&
> @@ -510,10 +521,14 @@ static int setup_crtc_scaler(struct intel_atomic_state *state,
>   	struct intel_crtc_scaler_state *scaler_state =
>   		&crtc_state->scaler_state;
>   
> +	if (intel_casf_needs_scaler(crtc_state) && crtc_state->pch_pfit.enabled)
> +		return -EINVAL;
> +
>   	return intel_atomic_setup_scaler(crtc_state,
>   					 hweight32(scaler_state->scaler_users),
>   					 crtc, "CRTC", crtc->base.base.id,
> -					 NULL, &scaler_state->scaler_id);
> +					 NULL, &scaler_state->scaler_id,
> +					 intel_casf_needs_scaler(crtc_state));
>   }
>   
>   static int setup_plane_scaler(struct intel_atomic_state *state,
> @@ -548,7 +563,8 @@ static int setup_plane_scaler(struct intel_atomic_state *state,
>   	return intel_atomic_setup_scaler(crtc_state,
>   					 hweight32(scaler_state->scaler_users),
>   					 crtc, "PLANE", plane->base.base.id,
> -					 plane_state, &plane_state->scaler_id);
> +					 plane_state, &plane_state->scaler_id,
> +					 false);
>   }
>   
>   /**
