Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C12A6AFA68E
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jul 2025 18:35:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF6010E2CF;
	Sun,  6 Jul 2025 16:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hTRbBFik";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1499D10E2CF;
 Sun,  6 Jul 2025 16:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751819711; x=1783355711;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=EWBzEPNql17qJyHi/EJRCwaiSI36sKc5kT+wjGwE7dI=;
 b=hTRbBFik51atYm9TU5uUs7/SQQKmM8a+mjeHPbl/tbJ0YNM8mWJoGxKn
 VBbmKv6Ox3zy/QJVtW1SiaOOOdCPsVSVr3LgzMhwc+ia4jBvO0PHzs9Gl
 1R6m0iKVYKRtUHBi8B0flksLtkcoi1Xr1CZNiEnLhtFIGl5xxF4uiheiG
 Z8+k8sOyArmWnv9e2hORr6a+1HEzjrzytjfE+DeUeEkpQZotmhgBo9qAv
 tedMSEOAFq1ddXIc7/69vQPMk6sY6pt7vKNIasBlnHmZ8R2QARIJX2anP
 DRav7tBeK1vY4YPfEpZulPE/8Jvj84ewT0rMZ1g2W8CquT6UFdV6wN/rl w==;
X-CSE-ConnectionGUID: iYGJW4ypTFmOP76+uHkGTw==
X-CSE-MsgGUID: 0l2qKgB7Qa2s2kf+hCY3Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="53917675"
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; d="scan'208";a="53917675"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2025 09:35:11 -0700
X-CSE-ConnectionGUID: 31L82R6JQqudwbZf5XM89w==
X-CSE-MsgGUID: LIBCZoIwQqe9l1u05oShWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; d="scan'208";a="155506994"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2025 09:35:10 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 6 Jul 2025 09:35:09 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 6 Jul 2025 09:35:09 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.78)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 6 Jul 2025 09:35:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S1LauzGkypb+jRK6Vt/A5rxqPbmCSH6p0lwYScDUDYHO1TaJ4hqqNy+u0Gw4cg9FQ+wbHMR4A50xrq2X0iXYC15DDKbafgCAWJ/hkcBVpO+MslWw1cX3X5AVCAy+iDSM0Mf0r/ttEQOQe5CchdY/hUvlJJbFqiC1IOPe/lJ1dYL0nxYfl8ykooGe14+I13vVDtESg4YO1pk6hZnMmkMOqR5Ne31g2cxMml/sASBWYhuzCJfCPkZiQQor+p48jqRTXdPriZxIyo4dnm5TJsDRbl5bXJZGBBB0YQxH+yzsy469ZDP5DkbYbf1xqZ+Pyl5thyirEukHDtyOWPjyq32VzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gCjnB6xkgsDU2qB0+LuTzmR756HV5/E6rFEHzOOGVYs=;
 b=pvFVHPXl95ni+pyhCluVqEx+cZpryJaE/Uov3lLno82uCcn18c7jUeOfQz4ctlMwR5VBE+VF78V4HAairICdbHJaoQlU1U4pYkfH2WuEXAjeCcM7AVV9D4gkHtqF9WLPAm8e8GYP65louY4F9f7Fa7A9x+D9UeXLhYujEW10XPixS0FYTFlNUsSkt+1CWQDdTBWmns+JiAMqrOroKDIPZEsflmAF17RaPoyBCV7lWZ95chLICOQAfUOGrnqelvO/gptQcdxpNcvGXTP9JnWjJ3c1mNvockqs52/5tjgXB8hmLD9gVTpeH7YVHHzpkHYlGBYWzaXebnzB96wjuJIByA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by IA1PR11MB7856.namprd11.prod.outlook.com (2603:10b6:208:3f5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Sun, 6 Jul
 2025 16:35:08 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%3]) with mapi id 15.20.8901.023; Sun, 6 Jul 2025
 16:35:07 +0000
Date: Sun, 6 Jul 2025 18:34:55 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Balbir Singh <balbirs@nvidia.com>
CC: Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
 <linux-mm@kvack.org>, <akpm@linux-foundation.org>,
 <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>, "Karol
 Herbst" <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, Danilo Krummrich
 <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Shuah Khan <shuah@kernel.org>, David Hildenbrand <david@redhat.com>, "Barry
 Song" <baohua@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, "Ryan
 Roberts" <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>, "Peter
 Xu" <peterx@redhat.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, Jane Chu
 <jane.chu@oracle.com>, Alistair Popple <apopple@nvidia.com>, Donet Tom
 <donettom@linux.ibm.com>
Subject: Re: [RFC 00/11] THP support for zone device pages
Message-ID: <aGqlr0snScSx3zV_@fdugast-desk>
References: <20250306044239.3874247-1-balbirs@nvidia.com>
 <Z8oq10LQBGnqpjQl@lstrano-desk.jf.intel.com>
 <6a8d6234-9d45-40b0-9038-e09f1084b229@nvidia.com>
 <aGfcrmyj5soCZCDx@fdugast-desk>
 <D84BBE29-5600-48A3-9900-1787C5B3C8BF@nvidia.com>
 <cc07f0f7-0b94-4b6e-ac5e-c83a31101f5b@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cc07f0f7-0b94-4b6e-ac5e-c83a31101f5b@nvidia.com>
Organization: Intel Corporation
X-ClientProxiedBy: LO2P265CA0412.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::16) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|IA1PR11MB7856:EE_
X-MS-Office365-Filtering-Correlation-Id: 53b4ebcb-0bff-4481-6710-08ddbcab10c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXd3YmNyN0IvZmV6ZERTMU0yemR1K1R5cWs4TkJpOXdvbHZKVFdCajg2QW9B?=
 =?utf-8?B?QnI4ZVhFaEhkRTlmZFhjTms2RlM3YldBZ2ttZ0NLdW1makVrMGZxYTBkR2Mz?=
 =?utf-8?B?VWpiaEdpWEVCSnRzQ01FWXdDQ1U2VXlnOGRqUm81cHhrTGdnMHAreWdCeWFw?=
 =?utf-8?B?OFFNdlUwQmFqWTJKYmJDS0IvaVNvY08zU01NRnI1RG4vdnJUWUpVZm5vNlpT?=
 =?utf-8?B?Q1FpQlpybktkWEpZNDUya1Q0UVExVFFPM0l2YkFoQ3I5MTc4NHQyajdObW0w?=
 =?utf-8?B?djhSNHYvanZaaXh1V0dWSi9vQitURXBWRGxIZkRPSENwcithS0ZNUnR3U3Ev?=
 =?utf-8?B?dGNCM0EzaE9GMmdHcnJONWFPaUZ6Y3JQUVVDMTV5d0MzZ2lLeis4VWpvSlVh?=
 =?utf-8?B?UkxNYXhGYmVrZERNR2lqTFZsVlhWbkl0S0tJUVk2RmQxRmxDczFxQTBpQXdB?=
 =?utf-8?B?NEkzNFJadEsvVVhGY1FHY2NmT1YxeFFkT2hFN0FRNmpyTVhveW8zTnFTSjB3?=
 =?utf-8?B?VXJ3Q1R1UnBGTE5NZkh2bGZVK1psTXorc0ZiaXlCTEUraDRuSmhrZnUwR3VV?=
 =?utf-8?B?VGp4dTJudWYwMU1qdW01Wlp4WVRtYmpHSC9QOFZlY3IvVHFHcHJRTUovc1Yr?=
 =?utf-8?B?ZlpZRFFWdUxWTGxwRFVOK05uNnJHd1Y5M0cwYW1saTJzVDFNUGwwSW42cDBF?=
 =?utf-8?B?aDB1cytrRmJFekdEVWtOWHZ0QWlpQ2NKSUsxVUFOR3dSZGJpZEE2TytCTlp4?=
 =?utf-8?B?MU5hWTI4ZGRkTGdlM1FJK3VGWW84YlNBWk1zL3hLM01YTld4VDBEQlZudzJH?=
 =?utf-8?B?eWdhSkprSnF3T2I0STEwWEhMUzMyUTkvUnFwWXVnSDRQRU90bXdrb3AyQWFR?=
 =?utf-8?B?Nk5sd3MvN05Ga1RVOEdROHNCUUI2VTlIN1EzdWVUYThqKytCMHJwSXI2ZUpu?=
 =?utf-8?B?UWpmSWFYN3ZHVUJJUHc1OGcxK2xJR2tMMWpVTFVVK2xhRS9qWThoZlFUQWpG?=
 =?utf-8?B?ZW1XOGxHL3RFQ2QzMFpId1ZHRWhwQnVJMnlDZU9WQjljdmhPbk9MbkJ1Tjdv?=
 =?utf-8?B?YnUyQ1E1dFhpN2NKQllva2pvNWpLT1N0YWtiajliYTRkQ2c0MllKUkhabHhh?=
 =?utf-8?B?dWdiSkw4OW1hYWFEN2ROOThxRlB5bEs4WG5CRVpoMzY5TEdTQXVYWlI5QjJZ?=
 =?utf-8?B?eFYxQW9kcXZCUGxBNHZ6WmhRRG54RzJrZTdSZXM4NVF6RzVubi9ncmZOSUhX?=
 =?utf-8?B?b09xVkM2Ty9laUM1SVY2TDFTVFdvREg0d2kvbjNqOEhyYWoyOGlsYUlwRTR5?=
 =?utf-8?B?REJITnVvWHpuN25ZZXVHd1BOOENCNkRzQmkwNFVpaWtXR0svaEtGQ1cvSDVD?=
 =?utf-8?B?U1lFTGhFWlkwMS81U3NaWXRtWG5oUWFEdWVNNmFzSkZlbHNrYWgrUm5PbWMv?=
 =?utf-8?B?dkpLbXBRalFWUFhUVWpKeWpxM1BQSzRURlArMzJkelBjU2FGSDEzYUIrSUw0?=
 =?utf-8?B?QU5wT0VpU1BMVDFoTVIrSWhERmhCNmhzdndyWmFSVG84UUd0VUlseld1cGFm?=
 =?utf-8?B?MTl6ekJNNnVGTGh3YlNEbEJpdHQveDQ3aGFLSGpmMStEdjI5VUFxUWRpWW1m?=
 =?utf-8?B?RjZHV3ZZb1pNTCt4Q2dIaC9xZUVIV3hmTlJGWVAzTE5IZFgyNithNmc5QUtE?=
 =?utf-8?B?bklpb0RhczJkbW84Slh0VUV1aC9ZVkYwRDIvaDJBVkJxejkyMHFjR3NqcWFp?=
 =?utf-8?B?M0JySGxRSjN2RUVPWHJDSzNGZk5TZUVXZDh1eEdsc2NDM2UzTXdJT0FUN2p4?=
 =?utf-8?B?NUp5emFTY0xjVjlMcUdTL2pJVWVWeWNRaHpuam5WMjNjWmVTSmhaTHEzT3lT?=
 =?utf-8?B?dVk5NXN1cWt1RGpsTlEyODNubGhNVzhKN25jUGdxTUdWckFmYTBjNGFTRWxH?=
 =?utf-8?Q?o14bVL013a8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzFaTHZ4SG5TRm91bGpNV096WEVsSCs4citEZlJrRUVISnMxVUFYR0c5aHJQ?=
 =?utf-8?B?NHhQNUJBN0xvZXkxckIraWl6UVBWMHZ1RVVVeDZyWk1SSEp2Z0pDc3dUb0la?=
 =?utf-8?B?ZEh5cllpTUxJS0dNMDBWYXdzL3VxOVErL3JzUDd0OUJTYkxOMUVLOEZOQWV6?=
 =?utf-8?B?QnZSUXRGMWZnYUJjRnIybDZuR0Zjem56cnBOMDJpTmU2U1hVaGd4djduWjd2?=
 =?utf-8?B?VXNnK25qUGk2aFB5UUFhQzJaY2tLNFlYcHJGMzUxOWcrOXYvOUs1L1c5b29i?=
 =?utf-8?B?Y2d1am9FMnVZZjE3QXpBdm9wQTZyaWQvUWpMSTRTNGRFZnBYd0NGRDJ6VXF3?=
 =?utf-8?B?NEk1M211ZVRzRU80VTdjajBuakFhcUE4QmdaWDU2d0JrNmQzTkxwenNQZUd0?=
 =?utf-8?B?NmdXSkswT3RBSG5LVDd2NlNTZFBiTUpyRitUM2xqV2lIVWF6ZFdUU0VTOEJh?=
 =?utf-8?B?SDRHKzIwVERHc29LT1BQZDRjcytvc3ZaUUFIZjV6RTgzNFZoUEZCbFlVM0Z4?=
 =?utf-8?B?dDN4MnpYejEvUXhpWjZSTTQ5WWRoNkQ0NnRDRzZUVGtOYjdkczRnb1gyc1Q3?=
 =?utf-8?B?cTdRK1B2WFEwb0w0VlhDNktqSVBYOW5FNGZHU1ZnNEJjQW82NGxhZFF5QUZy?=
 =?utf-8?B?RURLWklrY0E0aWxCY2VyMVhXcldRclVaZTQ0Nm80R3VIcmMyeDJtV1hyYXAx?=
 =?utf-8?B?d0phSmp6eVAva2ZsYTFuaFRDVmZVOThtcTZYdzNIK1FQNTJPRTRxNGhkY1Zm?=
 =?utf-8?B?em42Y3J6dzFnUTk5OERCQkVadnhlQ2ZNMXcvcUFwdS9acmU5ajEwZkd2SDZM?=
 =?utf-8?B?QWdTYkU4Yjl3Njl0RXRaYU02d1djMElaL0szRzJYQUpXU0tZNWJpeU9zVm1W?=
 =?utf-8?B?eHZTWXVMRTcwMHo0eWQzYWtLVHY1WjRmMmRHcC9ySzlSRG91QXZtL2NOT2pY?=
 =?utf-8?B?NmNYakg1enpleTFQMnU4MTRkcm05OTVKVHJlQ3NueDVlSUtaejB2QlBwaStw?=
 =?utf-8?B?MXRxQ25hZE8vMUg3ZXVJTzE4cHNJQXJkWGlPRlplNjBqaU5EcmgzQURRQlR3?=
 =?utf-8?B?Rms0dU5LQmZQL1ZNeTlWS2twZVorZ2RvTUdKeEhuTy82bGNWbTh4SWpsRWJV?=
 =?utf-8?B?S0ZYemsvWElYeXdWY3VIa1VqaW5td3VwbGRKcm9RWU5Ud0FGSmNTZlRuY2xK?=
 =?utf-8?B?WThNcXE3RTlsbGxYOUh0WmZacnlUN1UzMTVZMVBacFEwVTJvS1p5Z3FQM1hF?=
 =?utf-8?B?ZEUzMFQ1cHRDdE40UFhxSkp2ckFSQ01EMU5HSHc2OU00V1ZBMjV4ZUN6L3BO?=
 =?utf-8?B?ZGdNbEQ1UUZtV2h3TzRmQ3pLd3BrZjBQVEMwUjV6Nk9FZnhCc0xBTmU3dSsr?=
 =?utf-8?B?MUVGblQ1Z2QzQ21kdFErTFhFTzlUbm9UTkptL25KU0RTUG9yaEhxZVZEU0xT?=
 =?utf-8?B?WWNrNUU2U2RzaXZTcVd0WHptU3RGUHF4VWNHampxemwxM2hTOG4yUHJWMUZa?=
 =?utf-8?B?VTkybXlaM1MxdE9IbTFoNGlua21tOXNTUk9jWloxdHlGMys2U1dWNGV5V2xI?=
 =?utf-8?B?MS8zWkplWENCZTJDdzlsaTFhbW1zYnBFQjA2RnltWEJGM2tmQ3ZsM2ltcVN2?=
 =?utf-8?B?UlV4VldFdHkrbnNPMXNwUGdjMUUzWkN1NXFtbXVIL1dJVWpkVDVUSyt2U0Rs?=
 =?utf-8?B?WDlqY1ZRY1NZc1hrU25nMTloQUU4ZUJZOThEbWsxcXI3dXJEc294NmU1OENw?=
 =?utf-8?B?UExtVkM2bFVHYlpyUWJ1cHlyWnpOYW1sSmk2emswSDRjMGM3ZHVHVmw5MC9K?=
 =?utf-8?B?SVczUU1udXJIa0FGZ2E3OWMvSTVvWEFvQTluT0Z6VmhqNGw3Rk5MZmc5MElN?=
 =?utf-8?B?TGVDUkxKb0R4ZzM2VnNmM1o1SEYzQXkzNUU0VUQ4TVYrTHdnMnFPMkNVVENK?=
 =?utf-8?B?SEh3WWpqV0F5SUxxWEtGUm9MSFJBU0hSd2o2OGE2YXZaSTVUUmFpNTk1Y0Zi?=
 =?utf-8?B?VDhuekFxc291SkkveTZYSnZZZlFvSEJlTGV6ZElQQW5zZXJJaUxTc2pvV0Fs?=
 =?utf-8?B?cmRiMGdaam9LN3BDT09wVkYyMU0yMzl6SDExNUYyeW1INVVOcW1PSUQ2dWsr?=
 =?utf-8?B?UjlvV0RYa3hFeURVZy9YR1Y3eFIvVVQ3ZzhURTlvbS9ibU9lb1BjTHNnTnNL?=
 =?utf-8?B?NUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53b4ebcb-0bff-4481-6710-08ddbcab10c9
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2025 16:35:07.1475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +cP4d0bQeYHs8VSgyX7byLElm2w4ggGx9OoLpWmOPI6CtudD9VCN5kJcod+vlWsmlkoK3OImnydk5oWlK26+wZlKFDh7NxyMD/8kzbPAU9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7856
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

On Sun, Jul 06, 2025 at 11:25:32AM +1000, Balbir Singh wrote:
> On 7/5/25 02:17, Zi Yan wrote:
> > On 4 Jul 2025, at 9:52, Francois Dugast wrote:
> > 
> >> Hi,
> >>
> >> On Fri, Mar 07, 2025 at 10:20:30AM +1100, Balbir Singh wrote:
> >>> On 3/7/25 10:08, Matthew Brost wrote:
> >>>> On Thu, Mar 06, 2025 at 03:42:28PM +1100, Balbir Singh wrote:
> >>>>
> >>>> This is an exciting series to see. As of today, we have just merged this
> >>>> series into the DRM subsystem / Xe [2], which adds very basic SVM
> >>>> support. One of the performance bottlenecks we quickly identified was
> >>>> the lack of THP for device pages—I believe our profiling showed that 96%
> >>>> of the time spent on 2M page GPU faults was within the migrate_vma_*
> >>>> functions. Presumably, this will help significantly.
> >>>>
> >>>> We will likely attempt to pull this code into GPU SVM / Xe fairly soon.
> >>>> I believe we will encounter a conflict since [2] includes these patches
> >>>> [3] [4], but we should be able to resolve that. These patches might make
> >>>> it into the 6.15 PR — TBD but I can get back to you on that.
> >>>>
> >>>> I have one question—does this series contain all the required core MM
> >>>> changes for us to give it a try? That is, do I need to include any other
> >>>> code from the list to test this out?
> >>>>
> >>>
> >>> Thank you, the patches are built on top of mm-everything-2025-03-04-05-51, which
> >>> includes changes by Alistair to fix fs/dax reference counting and changes
> >>> By Zi Yan (folio split changes), the series builds on top of those, but the
> >>> patches are not dependent on the folio split changes, IIRC
> >>>
> >>> Please do report bugs/issues that you come across.
> >>>
> >>> Balbir
> >>>
> >>
> >> Thanks for sharing. We used your series to experimentally enable THP migration
> >> of zone device pages in DRM GPU SVM and Xe. Here is an early draft [1] rebased
> >> on 6.16-rc1. It is still hacky but I wanted to share some findings/questions:
> >> - Is there an updated version of your series?
> > 
> > Here is a new one: https://lore.kernel.org/linux-mm/20250703233511.2028395-1-balbirs@nvidia.com/.
> 
> Thanks Zi!
> 
> Could you please try out the latest patches Francois?

Sure! Let me rebase and share results.

Francois
