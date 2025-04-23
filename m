Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A786AA97E1D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 07:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8499910E3F8;
	Wed, 23 Apr 2025 05:37:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XQ6ziLwi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED6B310E3F8;
 Wed, 23 Apr 2025 05:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745386628; x=1776922628;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ywV0Mwynj/3R+V1kU6BaCVM8eB/lSOGUd9NDMY9C9F0=;
 b=XQ6ziLwiplPL+2PCTu3fQA/8vKMASH6/H/xGIROjMyufL8Theg+8vLuB
 UjTuEopR8Tm0h/3UxzbUxKpv4OxMKjoFcvdXzeDnSgQvDvFdINLerQKuh
 Fv0fM/RheIeWeicl58yAcJHHMLhfkXG9Yvh7j+RoqPm0PwxcWY85eJNA6
 qbgiqQlIIPhS62PWBith6QfF2y1QiDCzGy6o6xY5JChtwWS1PR3jwV1rs
 JZM7JhPYd8apPqcoc1v+LgEiu9YjXM2pPQZ5WgscCIyIrV8PTHbuxRj22
 NxZk8+ufDzuo6+gYIDPJuAEJCFXgy+BzzT2O0Xjqqsr9DfkJprIJJvCun Q==;
X-CSE-ConnectionGUID: bXBr4TiNTKWn8Pkw6DKYIg==
X-CSE-MsgGUID: MdxO9DeFTvm53081PxYsZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46843484"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="46843484"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 22:37:07 -0700
X-CSE-ConnectionGUID: bekMr9gUS3++ePPRpuJ5uA==
X-CSE-MsgGUID: yjNL9QbrTqWh6Dg637AJEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="133160073"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 22:37:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 22:37:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 22:37:06 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 22:37:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ONlpx1DFcTb/kvDymuPM/MXrt2P5NehrYLeSQ4WPp1dDi4nfnPypxgdSG05M9tLlUZC/t773+9lUq3iXy73ruHoDK9Idekpsx53ji2Hgnq9v83KuheKWbmyFyMR7PsG+23Vlb/ZY+eiRUXSgwcQnw0q3NgU44+/8L5cUu+mV5FS5UAZtCjI7RKMfT7Cj/XW+g2dL/cPaCqwcsg6wBoR1AA1a2YF7Ma1xSvwOj8f264aFPzKSzM/Hf/yrkk+r0n2J0E8/da3TRC0tc6+AU6zL1MPWL/yulFiZRrdesx505ilsKhd2TbcisB2swBdEGLDRc+Mf0ishZsak6ku+nmIFgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0qp2ceIPo4YXJ7x/c916IHeajzLRvcv++pH9fPsd/os=;
 b=vuZe+NnACDGQ3fplOvtkqeHnEv04w59wzSwx7uPBzQQO9RNPy4tp3r39FErWBWZH8FWi1VWCb9h87/Jgyt3fEL6l+PLFSKaHioRJOUuz4Nrhwn81O8HUlln9rZ/NWzxujYs83U6GYXV5Mgi19isLPCLFJOELvYJDAHstB//dyyHLYD9B3eoo7BoUOohrEVeT+ObPal6kqU5DYWz4fYfueNVnBvRTHd/Z9DxF46O2LrpgLlhBMWl5QyOUP9/AD4+0KnvVF2puIQMU5bG8iIz6bzMvCGZw82zZdVZVyRYVeLhfNns7hj2MusmClBxcfXQ7sVw8irCsqaIjZwBFauZQEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM4PR11MB8226.namprd11.prod.outlook.com (2603:10b6:8:182::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Wed, 23 Apr
 2025 05:37:04 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 05:37:03 +0000
Message-ID: <e5a698d9-2c49-489a-b659-2a0e2e9730fd@intel.com>
Date: Wed, 23 Apr 2025 11:06:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] drm/xe: Timeslice GPU on atomic SVM fault
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250422170415.584662-1-matthew.brost@intel.com>
 <20250422170415.584662-5-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250422170415.584662-5-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::16) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DM4PR11MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: 48a3c50c-c9ad-4260-4770-08dd8228e09c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TFpxQTJkeUc0amV4ekZRTVB4NEZuV2ZES1orSlNlWXc4Y1Bhb1E0dEwyczVK?=
 =?utf-8?B?dWFFR0c2SXQvcG96TjlHNWtCUUVMYnJSMEgrTG1DeVJZaEFvaVc3eUlSVWd2?=
 =?utf-8?B?aEMrRjFEUXVMUnJRNXpjWkgxTSs1emZzQmcxQjJSSjkxbUZ2em1XQ0oraHJ2?=
 =?utf-8?B?NFRXWHQvT2RLM2s3VSs3YVdxU1A4TVhxWHE1S0I2dE4xc3ByMkttU2xKWWxx?=
 =?utf-8?B?UVhUSDFOeXlnRDhMQWFyejNGczNMMFdzWDJET1NWRktmNUtqNUpxWVRjREtF?=
 =?utf-8?B?TU1uUzdZL3d3RmNMWWhDRHoweUZRQlk4OFZFR0l3SUZyaE94YWhwL3QyM2Zy?=
 =?utf-8?B?RmVqUW9oZ1FGOWF1cnFTV3RVQmRuRExNakNPTm1OY0xVcnBMWFVhRmRjUFo3?=
 =?utf-8?B?Q2FWSnd6YnZkeE0wQllGTWNZS0JOVkdzeTUwWDZTNVBpMzgwVi9vTzl1YnlH?=
 =?utf-8?B?Qmp5WndLMThYcnpTZExIbTlIY0pPazBpSDZvQU43WEhZZFpiQ2lVaE9mVU9P?=
 =?utf-8?B?QytDK1h1TWRJY0J4ZDhSK2RTaWQxVjBPTTU1ZGVob092WlZpQlJnaWh3RWF4?=
 =?utf-8?B?dzJIOGh2TVIwTEF6VW5KZFpYM25NUWFwZEM5dm96d09qbmZ1OWxXTXBjcWhH?=
 =?utf-8?B?bVBHOTBCUWdCaFoydWU4RXQ1WHJLWFFDUXdHTXBkZ2dDQld4dWhjckRPQnpW?=
 =?utf-8?B?RkRzMFFzaEYxeUMyd1J5M2xPTVJob3VzZ1VONTQweGZ2VlhJM3ZWT1FxSW83?=
 =?utf-8?B?T3NaYkxYMjFhQVl0L1V3ZFF6QTBHUWU3N25sNGJkdWdkSldXT2lPUWhRY0Zt?=
 =?utf-8?B?MzNjMGQzMDNiSlJMSko2a1dhbXNINldoTVA3MUM5TG5aTWpwajcxVyt6UkhM?=
 =?utf-8?B?U3cvNG9TWDJwUGMxYjZjSFlqa0pJQWdENE4zWVViQUZGSHNVNXlWcVNiaUZj?=
 =?utf-8?B?L3laYTQ5NEs0VnZWM0V5SUVnWGhoUDFpWXhTMkI4T3hIMlo2R2VjZG9JYzk0?=
 =?utf-8?B?L0lGWXo3eTVHaDJZcFNxSmFqaE1MQ3RTdHlVdDJVNjhKc0J3VWFzTG01aTly?=
 =?utf-8?B?eVJISzBlSVdSRDFDZCtmdS9hYVNaSVgxaUdWZVJ1aVRUMS9CdkhEYlVjZTFW?=
 =?utf-8?B?UVUxZldiY3J6WFU2OEIxSnFkTjRyUnoxT2JVZ1ZnZkowSmtUYmpLQlBEeEM4?=
 =?utf-8?B?Ty9VSlFVVGVsNXcxZWdSRnRYM001NHpCcnpoZnFBOSt1SXdUZ1J0aXFENjBy?=
 =?utf-8?B?elBDVCtqSkJlbzVGazJzakRDTkdPWTBvMmw0YUdHNXdzNFVuSjRIR29XL0xT?=
 =?utf-8?B?UlZONzd0VXV0RmQwSlYwZXBRdEhxTGQzOUxuS29xWWVsUUNLbksyZ3BpcTlu?=
 =?utf-8?B?ZnRLdVZFTFBUZi9KZ2RuS3hkTTI2b2E1cVZEMnc1NGwreUFUVmpEZWE4VERs?=
 =?utf-8?B?NzlDZjVTbitwaUFuR0FDTUxFUTdYMlhiRVlEblNHb08zVkEzcWdDcEMxUlVs?=
 =?utf-8?B?TnU3WEJucnlpb2JDRjl1YXZySnZ4dFc5UnJUbnN3dDFGTFE0RVVCQkNtbndH?=
 =?utf-8?B?amFiT2o0NGpaOFR2eFdKQWY1bEFrdnJleG1QTUcxUjhFM1lCRk5heDNOTkk4?=
 =?utf-8?B?QjVMQ3JQNGFpcUJFQzd1TkhzOXppMzVmQ1NHMXAvVWh5aXhLR2pVRG9aZVh6?=
 =?utf-8?B?N3VmWmhkSDhzK25xUGZJaXRTMDRWcUlzb0s0QlkrUmZWRmxFd0I4dm51Ymov?=
 =?utf-8?B?ZnRocVlnUDlFWVpxZ3ZTOU9jeVJkbVhuYjN5Q2lSbFBHbHBBcitrSTNpOVNk?=
 =?utf-8?B?NWxIVWFEWElBRTB3YmlIYkNiUk9PUkFGQnpFVUpOZnM4TnRtb1V3azRlSk5z?=
 =?utf-8?B?MGl4N0dtL0xRNEdnR0xXL1NqQUVoVXFYaWNhL3h3cGlNRjdyYXhmVTdON2dL?=
 =?utf-8?Q?+zPJWiSdPL0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1JGMnV4RWdkUVhZWEdYbDQya2N0dmliZzhoSTBnaWl5QlNtcGQzR1JuUUFJ?=
 =?utf-8?B?anRYMUYxVmQ2ZWY5a0lqSlBiOC9ZaUxvbGRWY2UzOFZtenNpUkExbXRVRllm?=
 =?utf-8?B?Z2t6K3AvUjlLc0IyMlFYT3ZaQTJtUHVOQVdyM2ZMNEI4V0QrdHdXUnE0d3Nz?=
 =?utf-8?B?OGtlMzIyZW9zbFRHaTltU2lQOVdFSXcvWDg1MDhzTmovN0lGSFNaUHRQTUpu?=
 =?utf-8?B?UGhNNHRHcUtPVkF1YUdjbi9lTEdNbnBOR1M2R0FCVVQrMDJDTjZhc3NuOThw?=
 =?utf-8?B?Y3NlenN2SUpzNHI3VzFQUXBaSzNhR3J4NlROTTJHVXNLb09SazRoS2JYakJh?=
 =?utf-8?B?a0VDN1FMMHB2SkJsZUE2Qmg5U0E0cUNZT0F1L2NRd3h0bXlpOGxzT1pTNVdR?=
 =?utf-8?B?ZDB4dFZ5TThNNnVxNnN4YzZ0WjA0cE0xSmtrUmJOSjhKQ0kzQmhsUGtIc0dD?=
 =?utf-8?B?Wm14WklIZE1lM0c4KzRCMUFrbUJVTlI4S2ZkNnkyeWZUaWtlVUM1WngrMW84?=
 =?utf-8?B?TU9rY1orYjJZTGVNZytCVGVXYjVjSnZtRlIwNWlhbFRaejkvVWhFcm5oRi92?=
 =?utf-8?B?eGpZWngxcGlKOUZnVnNHMlBHWjJXR25XNzNLRmlWTEVoUmdwaHhQWjB6azYy?=
 =?utf-8?B?VXlZMG90Y3htdHE4QTF2bDkwSEE2UUNjMEZrSUk0c3lITDJtTlMzREpNekVI?=
 =?utf-8?B?NXdETXd0VDkycWFrMHhUQXkxWnJyVXVOa1JDL3QrbDJDRjBSa3U4RU1TZS83?=
 =?utf-8?B?T3orU0lBNzlqTVpuTjF3eTh3ZGtlbjZrZFFBSlEwVkNpT3NGMmJoYmFsUDJv?=
 =?utf-8?B?T3Q5SWVQRWs1N3pySFpqZlppeHBTRDVtcWVvZWFyZElIYWlpdUZva0lua2dV?=
 =?utf-8?B?SlcvaEdnZ0d6bi96MjVGdDBrSHRJYVRGRVFOYnNaWmMyUlVSd21haU9hNFNs?=
 =?utf-8?B?cjhkOFBidE1EU0JUekZrQUJCc1YwVlB6NkRHYWkwblEvVW1ma1dEalVCOFU4?=
 =?utf-8?B?NVVoL1NQMVk3M01aM3F2MU1xSzFxYkJrM04yZ0M2SmZHaVdNMWgva0p3bElM?=
 =?utf-8?B?b2NocUg2b0ExSEJsQkVPbFVxVnlldC9HZkJiaCtKaVJvMTdwUk9GNEFmOXcr?=
 =?utf-8?B?b2FnOExVVll5LzJyb1V1T2hVLzFUWjNCNHdoMk04emMvSmE5VU9jVnJaMS80?=
 =?utf-8?B?U1orWGxnYlFybW9BYjVyT1ZOdmwxZ2d4UllYMjA2UHVPNHRhbnBtSE9uWlcw?=
 =?utf-8?B?RlJZdGhvbXEvcnV2OGlaczBzWi9ZWUd0bVp5cWNqTUMrWk1wMkFqbjFwS3Rv?=
 =?utf-8?B?MTFRRERKNFVWNUh2UkM3M0hSaERVWElWQUJ6c2U1YU5TQUtZMzhLbW5ma2tC?=
 =?utf-8?B?YUdQZFJ4eEpOcmtLVjRpYmRvVkNzdWJIYjlJMjhzUkRMeUQrK2hUelJsTVNp?=
 =?utf-8?B?TTcvLzRWaHd5K2hFdXZPMGtaY3JJQmlGcjFDVDFnMlA3OWNlVUJFTkkwWk5W?=
 =?utf-8?B?TnRLTklkTmU2bUdLTjN5Vk4veEFLbUZKMDR0b253aU5YWFFiYUtJblRKNjdo?=
 =?utf-8?B?cGl2YzNHbUt5dlZqMzlsRFpiWGlpNUhldUdFYWZuWWlqT0N6WkJta3F2R0tL?=
 =?utf-8?B?YzhtRVBrVUxWQUFtZHlwVmFsQnFWT2RRYjNmWnh6UmZlc25UMFFKNG9ocUF3?=
 =?utf-8?B?TDk0WDVBUjdUenFYWmsxK2Qxa1loWjBWSUkzOVhJWllUVG4vbGlHL1VPZXhJ?=
 =?utf-8?B?RUQ5N3RmbTZSRmhFOEkwb0xiSUhyZ0FXSnhzVTRSeE1WMzgwZllDTENaK0g4?=
 =?utf-8?B?VjkwOUZDMnJjZUZTMmR4dFo4dHFxeWRFZk1rU085TmxsenRMRDYrclIwd1FS?=
 =?utf-8?B?d1hISmRpRXB5cU55OHRNNGhFYUQvNnBiM3Y1VlQ2SHFpUGlPLyt2aGpCbGV2?=
 =?utf-8?B?a1E2SkZQMnoyUmxZMktySFhjVDFURVIyc2lmT2JaRDZZZkRPMlM3c3djeTZX?=
 =?utf-8?B?Mk9qUkJheEo5Yis3cUo2eWdHaHFwNTMzQkIwNUcrdWFoZjhkN05LNjVXL25o?=
 =?utf-8?B?MEMvbHRobDJIQjlNU1dHaVdESGdmaUVhVXFaQ1A0Q1UwNkMzZjRVWVNybTZl?=
 =?utf-8?B?YU8xU1Nhc1FTY0ZaZU45SnlwWVorbGtZZUp2eVdoQ3o5K3ZXN0l0cFl6WW5y?=
 =?utf-8?Q?/WsZ1p73FfBx7oHzU6swa8g=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48a3c50c-c9ad-4260-4770-08dd8228e09c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 05:37:03.8824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gav/QJ+icuOOblMLP9SduZXrzFI0A3V0QYyjiyzbxKJLviiiaR5kUiHx3Rnm4RRwhYFtNUYtxVArss6Anb1m+EUuAY8gnLet2g5nFG/mcYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8226
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



On 22-04-2025 22:34, Matthew Brost wrote:
> Ensure GPU can make forward progress on an atomic SVM GPU fault by
> giving the GPU a timeslice of 5ms
> 
> v2:
>   - Reduce timeslice to 5ms
>   - Double timeslice on retry
>   - Split out GPU SVM changes into independent patch
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_svm.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index f749ae367a8f..d5376a76cdd1 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -783,6 +783,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
>   		.devmem_only = atomic && IS_DGFX(vm->xe) &&
>   			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> +		.timeslice_ms = atomic && IS_DGFX(vm->xe) &&
> +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? 5 : 0,
>   	};
>   	struct xe_svm_range *range;
>   	struct drm_gpusvm_range *r;
> @@ -819,6 +821,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   	if (--migrate_try_count >= 0 &&
>   	    xe_svm_range_needs_migrate_to_vram(range, vma)) {
>   		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
> +		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   		if (err) {
>   			if (migrate_try_count || !ctx.devmem_only) {
>   				drm_dbg(&vm->xe->drm,

