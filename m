Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FCBB138B1
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 12:16:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90DBA10E4BF;
	Mon, 28 Jul 2025 10:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KEtA9+LO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F153D10E4BF;
 Mon, 28 Jul 2025 10:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753697781; x=1785233781;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=aXaEkCgX+xa8W/BhJDkuEy19T5TQH4OX8iqw7rkYnxM=;
 b=KEtA9+LO/lSWpcjxCf3cJmVTH9IqLtwgnZvl30Y4vcITiLWa/kEf/sJa
 DeQda/cH28GMCQsbcZf91/IvNejlxCBPX7Bsa9Z3+LH8wKh1nB6aOft+2
 +NyhzoijNKV2TmDyIQD6Apd8ke+Y9iYWM+fAik2LFy7hRWLeb1Cl6pC2f
 RdiiLr0OJKvl1kwzizBoiMvuMakA0q1MWIH4qSgkGF7beTeSYopHVLmjk
 GUU03PB/EwtlJ7lpfCbQHDmZ+VU+dKmNAgWSiJdzZcrh/uc887UsJyiSn
 61/nm9csremVsQ9/qmr0pqpTtqY2ZIbNngDmGxnRVmYzuy33dgVIRDlAB A==;
X-CSE-ConnectionGUID: eJeIZ4VCQMy48O9Q6Ki71Q==
X-CSE-MsgGUID: 5MjN8k7+R661c6wxQmFIyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="56032180"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="56032180"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 03:16:21 -0700
X-CSE-ConnectionGUID: bEgx5aAeRe2MGtM/6LA+Dg==
X-CSE-MsgGUID: QDqJpAVoS8iSX+vGPrjSOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="162091229"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 03:16:20 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 03:16:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 03:16:20 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.70)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 03:16:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FpobisTPJ9+r0DgeTkiVfChzznwoLNgmHh6g9clykXtWcXU5K5KiUB9qmf2xYyz4mfl3VBO3Sh3XqKhaGUUIVHrX6iLj5h8JZSbX2Tnn/njXDVEoEt3fIgCuxKzz46g/3+ER5i46nSU32pClnrW5S/yuVuXAldzK9yIwGinhCgoJVAZu6C6cHZbZwIE9Xl8oNUMRqoL38xGWiW0dM8y5nS/zw4yjS+Uu5z1AYCjMzgjbb5KFe5EkCoENxsHMBcPei+f0rrVYc4BklQdoGWW18AYHbGdUoVG11xZPsnX4J3ja8JBKS9c2hsAuGnsXGMnWPnF6dHTFtN/8Goc+rghw2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9mQ4FHgao1f1hEln9MXNYxE4HqZ0lNkUef3oebBy4w=;
 b=c0jlUOX9Hy1+UpERMrGlVM+ozHOWekRSfNYqEjNcR841JstycbF7geaut9rLbMG+N8Yq5KWGbaoEp+khNN70PR5ApY8Usl3KU3UHAjH/5jbLXlD7cLS7bBevSwk+qjq/QcE432hnCjPfuEQ4HUeuaODiVfs8asrVq4tT7q/JneoLklIcZ2TVu69r1dWlfVdtIw1lEpB42m6/fnU/8vYMhXGdtXU+3j659GFd+NdQuuPJT6hOvEdoGTP68JuS4j6Ov9mZkz8to7J38hna4STtkZmd/CU+k0JPW/mM+r0E4lMlv2UAvEi8u8pZH43HVj5P26O6xX4gpGDUU+JejHjTLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by SJ2PR11MB7517.namprd11.prod.outlook.com (2603:10b6:a03:4cb::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 10:16:16 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%7]) with mapi id 15.20.8964.023; Mon, 28 Jul 2025
 10:16:16 +0000
From: Imre Deak <imre.deak@intel.com>
To: <dri-devel@lists.freedesktop.org>
CC: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Thomas Zimmermann <tzimmermann@suse.de>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/radeon: Pass along the format info from .fb_create()
 to drm_helper_mode_fill_fb_struct()
Date: Mon, 28 Jul 2025 13:16:03 +0300
Message-ID: <20250728101603.243788-4-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250728101603.243788-1-imre.deak@intel.com>
References: <20250728101603.243788-1-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO0P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::11) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|SJ2PR11MB7517:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e0c535d-9b7d-4160-954e-08ddcdbfc9b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SSsxMHhWeVNYZ0sxOUVSc3NqUHpGdmhBQ3pOSG96eXpKWCsrQnIvY01lTkgr?=
 =?utf-8?B?bXhxM3R6UnF3SU9URWwrSHh3NC9YcGRiSmtVcmZLSVNqSkpCMXJ3SklubS9q?=
 =?utf-8?B?UzNEdUdYbzdhOWFsWmZiTlA4UUtHUEZ1Vm50ajlIdmE3dzloU0dDRW5EaFJa?=
 =?utf-8?B?K3J3MllNT3RpcDBiM3NWUk9LN1pjMFBnbmI0S2ZMMzRIazdJaEZpTm1QTGZ3?=
 =?utf-8?B?aUxMQk9XNG1GMnFkc0tqTCsyZWlEQUp3bzliSkRiMi9hNE1kMzJCeHJWSzlK?=
 =?utf-8?B?Zm45eDhSUW8xWGhzQVRaUzNyalk4UVFreVdkQmtacGNuY3R5c0pmSWt6WVlU?=
 =?utf-8?B?cm1OQmRFcEJlM2YwMzRGSkw5bmgvRzVKTUJwUDAzZUpBK1ZxUUVwSDkydEY0?=
 =?utf-8?B?RVRVUC9lcWlodU4vZWE5dktmdTg1S0lzTW1PK0hFYkM1VG56WHNxQVRqZ2d6?=
 =?utf-8?B?RVhhOXphcXdhRksrekNkNXpTd2pSMlpQTzNmUVAvbkc1d09iQTJ5Vng4TGVi?=
 =?utf-8?B?a1hhU1BpZ2RVY1RONitCdUlBL3dZVVhodXBReDdiYkIwQ2pVZGlhbklmOFdn?=
 =?utf-8?B?V29abXNXMFV2K00vVVl6VXpJM1dOTWJWZXNZT2lrZ0hoN1VoM1dZVWd1blV6?=
 =?utf-8?B?TEZHN0Z1aUJDVGJlS1RTaGNSY3JpNjRWV2lHOEdZRjMzc1FURXpYbVpsc0d4?=
 =?utf-8?B?Q2huTk1zL3I0cm45dXJSUXNvdkpoTTBNUjBXcmk4VllJdSt6OENtN1dqMzRY?=
 =?utf-8?B?OERlTDRzTlFBc21ONTJaQzh6amZJa0JOVWhJc0syOXcxWWUrOVV3WFZVTGRC?=
 =?utf-8?B?Wk9LY2NDN211aWRuT2YxdGlXK2orRENyK3VzQlBPNmdRK2YxeFJvdlpmeWpY?=
 =?utf-8?B?UzNGbFVmUjl3WmxPckZFVHhUVTllamR0cUI3QnlxK3lxbTBna0RldktSemZD?=
 =?utf-8?B?d004UG1OTDRtY0c1TW9QWWw1SnV1R2Vjc0JubFpxUFNVb0doVzJuT2NmN3pF?=
 =?utf-8?B?ajhtdVAwV3dNbU51NXBRRGdvaThBZ3hpTWlzcytrQ3JmM1dLWTBDdXdtOWwv?=
 =?utf-8?B?UTdsdjVkYzlHWS9HNDlEazdLNXd6Q01mUlg1dnFOK2o0QndxZ1dRQ0pYanIx?=
 =?utf-8?B?WFpMbUxRNGhiYmVhOE9ERFpTTE1Gbnk5NzFDUDI0UkxnNVlkL1pqeXZhSW9D?=
 =?utf-8?B?VnU0bGJiWDBGR3JaQ3RWTEtKdEphV1UxYyt3QlpoV3VKTlQwaEtwdVBLRlRt?=
 =?utf-8?B?OWlJdzdVSFJzU1A5ajBPeFR2TWRUalpCeWt6Tko2ZzlpK3gyR1I1NnAwaVJT?=
 =?utf-8?B?YkxYejVBVzdnOGlrc2x6NmhVU0NSL21OcjFsbzd5ZnhnZE9JL0RLMzNDYWUw?=
 =?utf-8?B?ak55bjdtMFZrZGJsaGpxL2ZXK3RkOE81bGd1QzF6M0lzMS9LS2Y1VmhJdzh4?=
 =?utf-8?B?cnd1Q3lZY2lHdXFISHRwN2ZPUHROWXpmRjEwN1M2OGJOVDVwaTloZ3g3aGsy?=
 =?utf-8?B?YVlJbHRNWkdlNGErc2NtOFFuNVI1MDJ1NFJ4TEEyL3A2TFREQTV4VTN0a2Ew?=
 =?utf-8?B?b0hGMUMzUHZvRWpIREY0WUV1V05HaGFoc1FPWFJnQVJLQlFmU0s1c2VLRHpX?=
 =?utf-8?B?OXFUS3EvaXhZN1pVbmZIY2RGVmNENDUxN3phOTJRQ0NaYlMvVFZkS1huV25y?=
 =?utf-8?B?bzFKenRDRGJOYmQ4bFdaLzhIT1JtQ2EwS3hHTjJXTFlSYWN0VXJwd1JDMlZp?=
 =?utf-8?B?NCtMdTlWaDRJMjZUY2dzVVY5amlaOU9qWnhjMEtxSW4wRUpiUDhmb1VOeHpC?=
 =?utf-8?B?SUlRUEtzbG5vL1lrV2UxRnFYNWtJV2d5Nm1sZXAyNXVOV1FKdnhKTzd0anRK?=
 =?utf-8?B?c1FtcWNaTjIwcU0rdXI5VDNiVEY4WHdnaFl5WFJpVC9tZG9zbnF2MGhmYllZ?=
 =?utf-8?Q?yDMYqbkEZkw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkZRb2FRS2YrYjlrUUphaVMxdGxjaHk0NW1MVzJuYXpQaWliblEwK3lhY1lK?=
 =?utf-8?B?YWtaN2hyM1k3M0dnVXZSQ2MzNHpYc3JCRjJNWElsNzlzRmdEYlNyVTZKcUZJ?=
 =?utf-8?B?elBIcGF4SHdjQTR6c2RLL3dZM2l0TmRuOHFudFJGc09DNStRRVphTHhKQTJ1?=
 =?utf-8?B?empPSE9rcHA2VEFkL204QWpvUTA0TWV5eFBqZ1lFeHZMMnpoanZjTVh3U1Fn?=
 =?utf-8?B?WEVQN0Z1Yjk3TkFPeDVUWG1xUkk0NUF3NnZOVnp5OHM5aUt0d21YeFJiTitE?=
 =?utf-8?B?cDBiSXVMVDhzQVplZlRxQjZablMxbFhvalZ4cWhuWDVuQzNlaUw1cmwvWWhM?=
 =?utf-8?B?K0JVZDZkcHBsVEFIMmhOQTJJclBnbm9GNUV4MWRtTUNYVFpvVHpqNEIrSThQ?=
 =?utf-8?B?QkRadnRBaFFnTnRKdThKMWc4TER4SGs1dmQ2N01DaWpEVE9GMnJEZ0s2U1k4?=
 =?utf-8?B?LzhvcFhxR25USkEwL0hkNkYyNkluMkRmSGVQSm1vNmtMMG5laWtFZnhVUHdW?=
 =?utf-8?B?YU16aytHN0ZjZCtZOHR4QloxMWgxRzBIeFlYM0tGcDJma3BWcUxBTFFDQTc5?=
 =?utf-8?B?SitmS1JGVnlrWnZHVmVWZjkrMUNIQlVFdjZPZkxOcXRjUWtEcjltdDhla3V2?=
 =?utf-8?B?bTBsdE9ycEs4Mnc0VTI0RW9RNldnWFNKdVN2UjBEVjI2SDhRRW1Bcy8raXY1?=
 =?utf-8?B?OUdBSlV2ekVrczBDTkREdTJGakdhZTFodjJPUnlvcTlXY05ad1hNY0RMeUdw?=
 =?utf-8?B?Rkc1dmhKTWdabEhvRUoyT3hxcmdJL1lXdDJWL1h3SzQzajhWc2ZLWVIxelN1?=
 =?utf-8?B?RUM2K21mMFV4L01oOWs5akJrOWVrbVVXYm10Mk1VK0E5aUVkM2Q3NUdyd3JP?=
 =?utf-8?B?K3cvanJIYUZCK1p5Z0JwM0tYQzVYd1BKOGlWaVV1dmpnZm5wa2tWVFJweDMz?=
 =?utf-8?B?eGlZbkhwRnpjMGpaVjUzbVZCNjgxaThLcUcvVWp2U213YVF3VXloa1lEVUV0?=
 =?utf-8?B?U0FtblRscDU1bmZlejRNaG5KUGdwMXM2NjlSbG9rU08wQUpMeUNTVWxSK1I5?=
 =?utf-8?B?UGt4dHBwMGpMak56ZUVTN0pJcFlXWGhXaGhBMzgwWVV3S0UzYjh1MlB1SjUz?=
 =?utf-8?B?YnhkeGhOWXdXV3F2cTBCMnFhK2hiR2xoWElhQ3MrWUYzYnBaVVR6VEg5eWg1?=
 =?utf-8?B?T0lTUjlPc2kwSklrVENUa0c2YjhqL0xSdlFRKzhvaW80Y0hTT2tjSGhrb0tV?=
 =?utf-8?B?VGk4M1JhdVRkbDRvaWJrc0FyL1FyUnFHbGtNa3NUZ0ppd1l5ZmxQaHVXRGpR?=
 =?utf-8?B?RXFzU0llYWFVRS8xZ2JUUkt5ZlVsaGx4emRBem51cXR0S3lOUXdaQVFzeDUr?=
 =?utf-8?B?Q0ZzbFBUQWdVaW1xYWRGbkUvNHpPOUQzYy9WZE5xK091bDlZQmJHZkFydWow?=
 =?utf-8?B?aDZXR043ZjliZFd6NXFBeER4dFZHSkdhZkwyRG9Hc2M1NTFETEtQRjRUeTJj?=
 =?utf-8?B?ZEg3OU9QREFFbFhOcmlWb2Q2eUpUeGVyQVFFOUFSbVE3dFFMMW10YW9Kd2lY?=
 =?utf-8?B?bGpqcmFBbFRscGd4THJiYVljU25KSmVNclJNMExwUnc2blhuME9wTFVNZjVY?=
 =?utf-8?B?UFFyK1N3UzBqc0tEakNXSi8ybXh5RThkWEJSSlNQelgwdWVyQUZpUGcwSkZu?=
 =?utf-8?B?aktCYTh3Q3g5dVcwMWFwSWI4Z0ZBTW1QYVNibTByZkNDN245MWx4emlNMmVq?=
 =?utf-8?B?Q2hONmxUNEU3YlZTeWpCck9kcWc5bk1QYThqMFBCTjExdnhUcTdERjVreGZo?=
 =?utf-8?B?UnVINFBFemVlb1pmWG5FZjZEZm1JMUFvZlVUZ2l3OUp5ZG01TXBKQXg4RWJ2?=
 =?utf-8?B?V3FrSTI1OTRYWTZPNU80QjJTVnFYbDNwSDhPTUxTSkVFV01lcmh5NndDWXkw?=
 =?utf-8?B?c09tR1F1ejlQaytkajhoL1g1d1VlM25QcXgwSWZDeWFjWldoa050Rk5qbFZ0?=
 =?utf-8?B?TlhmRlowUjcvOHVEbldMTmlLaEZLNnRqWnk5MTlETDgrNVYwWnN5Y0JzcHdG?=
 =?utf-8?B?T1ptVS9aL1MwOTRlRndBVnl4WlgwbnlDaitzQzRlMVBOOWVySnA4dC9Cdkpx?=
 =?utf-8?B?ZW92MHRHbW5rdWcwNXhhdkowUDJzd0xRZ2REbWhzUkt3b01RNDllbzdLandu?=
 =?utf-8?Q?2l3IJN9FjqDe43wlWZQ7JhbS+6pjABIiquMrivUifcGx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e0c535d-9b7d-4160-954e-08ddcdbfc9b6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 10:16:16.5033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kYaUyb8V/rONyBGOznfiZ/VyfHO41oaMhEhGj+aIptt4RELFIUd+V+PBSMYNLfoWtjFdxOVZ2NthtKQJ/O2Weg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7517
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

Plumb the format info from .fb_create() all the way to
drm_helper_mode_fill_fb_struct() to avoid the redundant
lookup.

For the fbdev case a manual drm_get_format_info() lookup
is needed.

The patch is based on the driver parts of the patchset at Link:
below, which missed converting the radeon driver.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: amd-gfx@lists.freedesktop.org
Fixes: 41ab92d35ccd ("drm: Make passing of format info to drm_helper_mode_fill_fb_struct() mandatory")
Link: https://lore.kernel.org/all/20250701090722.13645-1-ville.syrjala@linux.intel.com
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/radeon/radeon_display.c |  5 +++--
 drivers/gpu/drm/radeon/radeon_fbdev.c   | 11 ++++++-----
 drivers/gpu/drm/radeon/radeon_mode.h    |  2 ++
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index b4bf5dfeea2dc..4dc77c398617a 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -1297,12 +1297,13 @@ static const struct drm_framebuffer_funcs radeon_fb_funcs = {
 int
 radeon_framebuffer_init(struct drm_device *dev,
 			struct drm_framebuffer *fb,
+			const struct drm_format_info *info,
 			const struct drm_mode_fb_cmd2 *mode_cmd,
 			struct drm_gem_object *obj)
 {
 	int ret;
 	fb->obj[0] = obj;
-	drm_helper_mode_fill_fb_struct(dev, fb, NULL, mode_cmd);
+	drm_helper_mode_fill_fb_struct(dev, fb, info, mode_cmd);
 	ret = drm_framebuffer_init(dev, fb, &radeon_fb_funcs);
 	if (ret) {
 		fb->obj[0] = NULL;
@@ -1341,7 +1342,7 @@ radeon_user_framebuffer_create(struct drm_device *dev,
 		return ERR_PTR(-ENOMEM);
 	}
 
-	ret = radeon_framebuffer_init(dev, fb, mode_cmd, obj);
+	ret = radeon_framebuffer_init(dev, fb, info, mode_cmd, obj);
 	if (ret) {
 		kfree(fb);
 		drm_gem_object_put(obj);
diff --git a/drivers/gpu/drm/radeon/radeon_fbdev.c b/drivers/gpu/drm/radeon/radeon_fbdev.c
index e3a481bbee7b6..dc81b0c2dbff3 100644
--- a/drivers/gpu/drm/radeon/radeon_fbdev.c
+++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
@@ -53,10 +53,10 @@ static void radeon_fbdev_destroy_pinned_object(struct drm_gem_object *gobj)
 }
 
 static int radeon_fbdev_create_pinned_object(struct drm_fb_helper *fb_helper,
+					     const struct drm_format_info *info,
 					     struct drm_mode_fb_cmd2 *mode_cmd,
 					     struct drm_gem_object **gobj_p)
 {
-	const struct drm_format_info *info;
 	struct radeon_device *rdev = fb_helper->dev->dev_private;
 	struct drm_gem_object *gobj = NULL;
 	struct radeon_bo *rbo = NULL;
@@ -67,8 +67,6 @@ static int radeon_fbdev_create_pinned_object(struct drm_fb_helper *fb_helper,
 	int height = mode_cmd->height;
 	u32 cpp;
 
-	info = drm_get_format_info(rdev_to_drm(rdev), mode_cmd->pixel_format,
-				   mode_cmd->modifier[0]);
 	cpp = info->cpp[0];
 
 	/* need to align pitch with crtc limits */
@@ -206,6 +204,7 @@ int radeon_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 				    struct drm_fb_helper_surface_size *sizes)
 {
 	struct radeon_device *rdev = fb_helper->dev->dev_private;
+	const struct drm_format_info *format_info;
 	struct drm_mode_fb_cmd2 mode_cmd = { };
 	struct fb_info *info;
 	struct drm_gem_object *gobj;
@@ -224,7 +223,9 @@ int radeon_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 	mode_cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
 							  sizes->surface_depth);
 
-	ret = radeon_fbdev_create_pinned_object(fb_helper, &mode_cmd, &gobj);
+	format_info = drm_get_format_info(rdev_to_drm(rdev), mode_cmd.pixel_format,
+					  mode_cmd.modifier[0]);
+	ret = radeon_fbdev_create_pinned_object(fb_helper, format_info, &mode_cmd, &gobj);
 	if (ret) {
 		DRM_ERROR("failed to create fbcon object %d\n", ret);
 		return ret;
@@ -236,7 +237,7 @@ int radeon_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 		ret = -ENOMEM;
 		goto err_radeon_fbdev_destroy_pinned_object;
 	}
-	ret = radeon_framebuffer_init(rdev_to_drm(rdev), fb, &mode_cmd, gobj);
+	ret = radeon_framebuffer_init(rdev_to_drm(rdev), fb, format_info, &mode_cmd, gobj);
 	if (ret) {
 		DRM_ERROR("failed to initialize framebuffer %d\n", ret);
 		goto err_kfree;
diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeon/radeon_mode.h
index 3102f6c2d0556..9e34da2cacef6 100644
--- a/drivers/gpu/drm/radeon/radeon_mode.h
+++ b/drivers/gpu/drm/radeon/radeon_mode.h
@@ -40,6 +40,7 @@
 
 struct drm_fb_helper;
 struct drm_fb_helper_surface_size;
+struct drm_format_info;
 
 struct edid;
 struct drm_edid;
@@ -890,6 +891,7 @@ extern void
 radeon_combios_encoder_dpms_scratch_regs(struct drm_encoder *encoder, bool on);
 int radeon_framebuffer_init(struct drm_device *dev,
 			     struct drm_framebuffer *rfb,
+			     const struct drm_format_info *info,
 			     const struct drm_mode_fb_cmd2 *mode_cmd,
 			     struct drm_gem_object *obj);
 
-- 
2.49.1

