Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31495AC0664
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 09:59:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4909510E8B0;
	Thu, 22 May 2025 07:59:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PJnj+Lg/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 217B110E8B0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 07:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747900782; x=1779436782;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fldtoOXYZ8VK7WsO8erz+zHiuG62ULt84ZGqmsI60t0=;
 b=PJnj+Lg/oHzxqaEYU4zUhHZPiPjybIVm3GxHDRONywNHpJoElzHcPiM2
 LrdFPCErvs8MjK/MPE5+vZsUdcd1hOo7+rLqLcyEELQstkeGZqU+Bf6WN
 5h+fIj8m+IZ1Cd+SiQ3Bf7fUPBFC8DqP8QRBlsV4hzfTFojIASxnE3GBx
 v2TrQd9+1k/VGq/2CjjZ2fcsFlmWuUxLKmOhUXYR8BbOHPyNdBqDMOqmL
 16Tklmp8jo/0tXgCYizvuZ3M/NAxZ0DKt5dLZVcu8xaIQA1F+dLXBlC10
 9oQFJ9PiawOJpPHV+XowaNaGEV4ONaRX84UTJ4eOIS+OEE392tP24tFo3 Q==;
X-CSE-ConnectionGUID: EEkapu96QACliuPtM1I9lg==
X-CSE-MsgGUID: dkEQvwQ9SIaFck9gCk6Csg==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="52538231"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="52538231"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 00:59:41 -0700
X-CSE-ConnectionGUID: ZTyOr8ksTKWN9lbipqf3Lg==
X-CSE-MsgGUID: fVRw8YWNRvCgFRBnCHGkrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="140545432"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 00:59:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 00:59:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 00:59:40 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 00:59:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WT0ldNkdbLycT5znWOzow1BMNYZnSS3bJ6tlcYcfsi7DAta9FmYIbH0nro/oPhnA9pzaYplYDI6oluMgPr4s7KRLCin80MCzzfCsYS6yDJ2G+I2Z/rDHE0ggZNc6HR5qp7b/okOwMcCIuWqQ0+Q4XHZIyc7Xux9wCQP7pvnfXk9JqovXdCyZOJ+ziFjobB9AGyoxU4cdgW5bLqZ3M+B8yMkyVXYk+YMHwFjrlUQKqQGLPPb3HBrBisYcMFK4sPrSjLpZ5NVKjm1Dnu5rixbvME+lonvPZkZ0rEC5Xf0f0p/8aFPt+MYmbd5JxF85JUkAue8veryeKBIVzOyAoLqcYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fldtoOXYZ8VK7WsO8erz+zHiuG62ULt84ZGqmsI60t0=;
 b=vvrDDnnIcDDtwRp+HITp7PUemtcbm60nmmgQvBgIIypE158RiJfLMsgYcjMADfDORGnLsUNwT81fqlzGIFNbUcTsLmk2v6GETb85Rlib2N/o76WnoDVUvXr8I4HFPV7W1LP/lqeFdHeh6GUNybv5nyZkEx8j4DuOo1rM+bY1B91KBeuNfaQ/sWyxIe2zITlMBq2yldUx1Qp+7pnxnfz8b+xjs9AbICjxCHe1nKaIEExBp52LdXhfiO1loiJgvrUMaR+LBwgGPKcz2FT/BxyoTV51WdOhMvILJJoTxF22gC5IWwg27m6Viy/RgopRZvVqLBWdT+WWdenRRdL4K8JgDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by IA3PR11MB8965.namprd11.prod.outlook.com (2603:10b6:208:582::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 07:58:57 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 07:58:57 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, "Hajda, Andrzej"
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert
 Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Ville Syrjala <ville.syrjala@linux.intel.com>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm/bridge: fix build with CONFIG_OF=n
Thread-Topic: [PATCH] drm/bridge: fix build with CONFIG_OF=n
Thread-Index: AQHbyukDJsbOFQgEekWbReOafYH1SrPeR9Pw
Date: Thu, 22 May 2025 07:58:57 +0000
Message-ID: <SJ1PR11MB6129DAE64D41911F049AF98EB999A@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250522-devm_drm_put_bridge-fix-non-of-build-v1-1-a05234dea046@bootlin.com>
In-Reply-To: <20250522-devm_drm_put_bridge-fix-non-of-build-v1-1-a05234dea046@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|IA3PR11MB8965:EE_
x-ms-office365-filtering-correlation-id: cfb65816-73cf-4dfb-7b7b-08dd99068168
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?cklHTjFRc3U1NjFCeDdNalVhT2s5Yk1vT3d0WWdMV2xqMy9sbDhyV1pEaFlI?=
 =?utf-8?B?NWJIWEttTEtoelFOR0g3dGczV0JtTENiVm0wTytPU0hQdWVCVldEeEhtNVI0?=
 =?utf-8?B?enEvNnk0aGRlSUwrc3U0c0RpYjZrcisraDNBd2RsWkdHRmdWY0VpOXlJRnl2?=
 =?utf-8?B?Q1JUQUJwc3NIMzNzS0hldmkxYkhPVHFuU2N0bHJmYzhveG41Y1h3TTZaYkFv?=
 =?utf-8?B?eDBqMFhhendnSkFDaDVYT3lENjBhVnRHTm1TL0VHQ2E0VFplSUpoRXFIeW9I?=
 =?utf-8?B?clZjQjVWNzRBYkRYQlBxRWZCS2hXaVc0aG9zc1RFM29SWE9WRFFKMVFwcEVP?=
 =?utf-8?B?YzZyRjkwTGJWY1ptek5Wc2xmY3Z0VnZ0TFRwdUdGUFJtZWhpR29FbDhVakJU?=
 =?utf-8?B?b2Q3UU1zb3I5QWtDS2xkVXFlRDV5cTdOTG91UUNBOExXQThhWndSWnc1S1Fy?=
 =?utf-8?B?dmFQMlZYR05nL2NkQU0zV3RHWTFQdzFuK2NNczgrc3h3MFA3eVc4ZHRwakkz?=
 =?utf-8?B?RzlDZ1JVcnZReGppUW5EdGpJcHZDYkU5TWhRZDNTOHBBRFZtTzQ4dVJjbE1v?=
 =?utf-8?B?Z1pLRG9RWjJlTnFYalFWOUF3OCtjV1RPS2RTdEg2T0ZPcEFFcTgrQVpSZWta?=
 =?utf-8?B?emNkTTlXbk5IVjVMU1NkcnBxcTBBNkdWT3Z5L3cySk5NODVNT1h6Kzc2VTBs?=
 =?utf-8?B?U3FLc2hkREl3cFpadk1FcTdQRE9kVXVHRE9NaU9UV0VaZ0tOcDd5dk84eU5N?=
 =?utf-8?B?VHNQN1pWRmlWNUF3bHBrRHJoSTJuRUxMd3o4S0NFOTN3VlA2LzVVQXEwbWt2?=
 =?utf-8?B?UTlMdVV1RDhLK0ZZOXRQZlBlQkVNcldPTjN0MXFCV3pZQUtFRCtqTzBUU0Fo?=
 =?utf-8?B?Tk1lUGRaVGtRNk1BNDFtNlhHOVViaHh2TXRGY0tWTEhGVVBpc0Jpay94Zmph?=
 =?utf-8?B?NUdLM2JibFBwd3krVzB6K1FkaytsQy85QU16V0ZhR1dGNEJLNlpubzdQeUNI?=
 =?utf-8?B?R0RicGtNZXJRc0FzcTNyNmN4VUhFM1N0THFHNWIrTTdQcXY1Mkk2SnIwZTcv?=
 =?utf-8?B?QlFMSWk5d2lNUlM0WFl1WllSZTk5WHAvdGtaaVk3MGczKy9NcTkrcklKUDh1?=
 =?utf-8?B?NVI2dG5hUytHdW9rd2M1V3JqWThhL2tKVnJjdmtWeHZQWXhKWXNrcldaeTB3?=
 =?utf-8?B?Zm9CNVVrOWJZdFlJbnJhS3FKNlFpeU80OHVVdWJMYnBhWmhsOXdlRWZXWkZE?=
 =?utf-8?B?SHliWDc2eW1xYXpObUZyak9hbUoxdmRWSUU2QUFmSlh0Mk5rZjdjazdVRFZj?=
 =?utf-8?B?MjNiUUNIMHIzdktIaU8wbS92M01WcnYyZ2JoS1lVTkMxczZ0WmFIeDdLQnJx?=
 =?utf-8?B?MFo5Zlc5bjI3S21PRDQ0dWVHbE9GdGhnUUNBTE5Ob08rQVZIa1EyMDA5SmtC?=
 =?utf-8?B?RTYrandGZkY4b3FiOGFDTmlCeUxQQXBuT2poUEpmbU52emNwTG9GdDJ3LzYw?=
 =?utf-8?B?azV2R1RXcWt2Umo5L0k4TkFhYlVUR21rcG9yUGQ2V2U4Q2FzakpwZ2ZzTTQv?=
 =?utf-8?B?YUNINE1oQ2lSd2hiNGFDby96cWgzcHYxa1krTEwxWlRmMDQzd25GODdwSmxG?=
 =?utf-8?B?bTZHUnBuelBaK2p2V3hvWjRmeXB1NDBjbHlXR21kTWpIZ29IME8zcFhhMnZa?=
 =?utf-8?B?OXJSamdNSnhuWnVvMUdOSUo0cVJSZVRkUytBR1pzSEZHT241cjBXWVZJUDJv?=
 =?utf-8?B?UlNyRWQ2a1ZiQndZTzdhUGFtZ2F1RS90cjJYQjI0V3FnSldkL0t6RHlKYy9t?=
 =?utf-8?B?My9WU0pXMFh0emk4Yy9sWis2VmxpN1JyRWxNR3RjTFFnNG04OGJHalBlSkFw?=
 =?utf-8?B?aXRhZ1U4YnJwS3YvckZaQnovdTR1ejllZkhjNDMyWGNMditTbkRZOXNsUTRT?=
 =?utf-8?Q?VtdJTfyhxExWscqsayhLTpz2CyF6t41W?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UEErMjBJYTd3WVYyVEJpbkZ6UFZkalFDNGNIelVTdjdSdThXeS9tMjYzenVV?=
 =?utf-8?B?RmMvaXdhWFpyQ0tlaGFWYnBUWFRwRmtWV0NPTHdyKzlZV3Q5eFpheUszYlM1?=
 =?utf-8?B?Q1RYL2Z2akdrRk5lUUIreXh0VC9SOVlUOGFuVzJXOGVaeThkV2dtdSt0d29o?=
 =?utf-8?B?MlBON1F0Qkh0Z2VLenRlVWtmc0hZbnlGSTNIR21ENFlLc29OYzZFOHJTb1Av?=
 =?utf-8?B?Y1YzR3pFeTdZVkQzNnBKT2EzZ2NwazRya0pHbDhUUitQS2o0aFp6bkVIQk4w?=
 =?utf-8?B?aisrTHVHOWZndkd0YXplY2dTTWZ5c28xaFlZZWJ5Qm9JdTRQS09hNlczZndo?=
 =?utf-8?B?VUEyV0ZKd3RXZm1oSW9JZm5RSWlZRUdaUDFQcS92OGxSMmp6YXViVXdYUmV2?=
 =?utf-8?B?cTR0NE0zNXlCYkJHT1FKeGVQRHlRL250WGo2Y2pBMkpkbTBZYy8xUmZTdzlq?=
 =?utf-8?B?VitYTVNwODBYOFBVdkJkTVRuVU5uMlROVlFyMS9FOHVGUzVqWkZKVURjSUJL?=
 =?utf-8?B?UXU3ckxNK0F6YjFMSHQwMUZ2TUtSaVJvSXlxSVkwL3lDYjlocWtJajRSUUJ6?=
 =?utf-8?B?QlRweE90ajcvWHdxbEMwUWtpbUNsNDFYNWJsaDRoUzNaZmZ2ZG1NZ1FvU0Rt?=
 =?utf-8?B?aDIrVWtuUFB1TXdGN0hac0pBbWlHZXp5akF5a0hKYytER0Vub1krcXUrS0Mx?=
 =?utf-8?B?aWphUEUxcGNNMDRaSk8wY2VOemRIMmVhQnNQNUJuSGpYb3pPcUEzb0pjT3NO?=
 =?utf-8?B?TTFqd0ljMU9TK3ZTNU05am9YVDZTQlQ4Mk5BSTVCNmtzOURuVG5UWVFKaUxk?=
 =?utf-8?B?dmpHaDRZOG10ZER1Y20vMnhvNlpxdlYvdVJHemVsM3dua3pDSVJnWjZLUHdp?=
 =?utf-8?B?V3RUYjRpWnhINVFLdXlCRTlPUmk3Y21SZHZlRzlFTXNMSUk3KzZTOWtLUm90?=
 =?utf-8?B?bnZ3LzBpSC91Qlp2alVCTzBjWkw0UCtWZnVINFRVTEo5andHNTdYcVlhMUlW?=
 =?utf-8?B?NE1XVE5NUmIvTGtJN2p3QkFHajZSVDZlaWJ3K2lRT0lnSDI5blQzMGVZSmdI?=
 =?utf-8?B?dXhzV3YyOXpyTnRrT0doaDBXTXNnS3lKeDZpbzlWbnJwR0FYcGFBbGNGTCtN?=
 =?utf-8?B?K2pSMWw0NFBvQlo0TnNJaGozYjBDamxaMkhkUlZHNEwzM29DamFVV3RwU1Nm?=
 =?utf-8?B?K2hTcTJpNG8wbTFrakc0ejJXbHFBMmpBdzBwSHZKVmpWTWJBVXB3aWh4NDJB?=
 =?utf-8?B?c2NPeGk5cGY2RWQvWXF3eGZxMjAzMVcwYkdmQ3BjV3JwSElnY0xiZFZ2YTRy?=
 =?utf-8?B?U2pYaHcxZWZtS3drZTVES2h2TkJmMUh0S2VyVHpGMFZrNlJaS2FINzFTVmJk?=
 =?utf-8?B?ZGpSaHNBQmFid1RwcUcrYkI5ZGxhWFIrZmFWb2Jjb0lTZWNQNkhaZ2daZ1Nh?=
 =?utf-8?B?NXdzT0Yzd3lqRTVUM1hwNGk1eUUrNHNHV2VOUSs5SzZxaEJ0RXlqNFpLSDBY?=
 =?utf-8?B?Y2JFeVN5Um83VEk2Z0QwSTEvbDFiOUozdXdLM3lsMkRkQUdhckZvQUhTTXVR?=
 =?utf-8?B?MWpyWEZRUWRqajlKa0JaamhjeldUZjlGbGMwckxud1c5b2JaVm5qdHFRbElP?=
 =?utf-8?B?bnJTMGtFQ1BzRXRlZytaRmhvZlhzNjVnaEt0cnNvV0hTZnZ5T0hiNkZ6MkF5?=
 =?utf-8?B?Um81N2NqWXVqWG8xN2dNNkgzYjNUa3dlbldPakRmYUZsOWhSTVRyRGNDQnVa?=
 =?utf-8?B?MmxnZjNkdU5CQTBKdVEzUkFZT20zRlRuRVZJVXRmTVBubDAvL2xaU3B2VGJx?=
 =?utf-8?B?ZUhxWjY1aUVkalc5S2JzcVpiN2NlMWNIQk15K2VOSGE5cUhqeGVyMlFycncx?=
 =?utf-8?B?NGtjNHNWbUVLVlIyVksxSlpxVmxkbUZRdFcwdnlnYUNMSnREY0szeFFLZ3ZE?=
 =?utf-8?B?Y1BpV1lyUm90bFJJK0FCNURZUzdIbFhJVCtXdkNUaUhSWFhLUTAzcDNFL2Fv?=
 =?utf-8?B?UUI5T1dzQWRwN0I1SVRRNzN1ZGZHQUpCVS9Ccm5XY25rajEzZTZpTTVDOWR3?=
 =?utf-8?B?YlNYT1F3L0YxVSt6SXZiTjVkVE5OTEFKSG5jVWxIR2VoMjJ1NW9HVmZjZmM3?=
 =?utf-8?B?czhyZlNDaFY2K2ZKY2dwSE05NDUycFMyNnV5Qlc0VTNhVi9KaitPNWZ4WUMv?=
 =?utf-8?B?QUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfb65816-73cf-4dfb-7b7b-08dd99068168
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2025 07:58:57.5901 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: deKBe9zbcJbfNyMKcNIpRupKCdV07qYZCOoJ+PdYs2iREC05jNCwlnMV/J5NvbA1qs8FzY66O+vvhZ8YbA/oWuJGi+wPlJk3yrKdVQAHppo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8965
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogZHJpLWRldmVsIDxkcmkt
ZGV2ZWwtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBMdWNhDQo+
IENlcmVzb2xpDQo+IFNlbnQ6IFRodXJzZGF5LCBNYXkgMjIsIDIwMjUgMTI6NDMgUE0NCj4gVG86
IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+OyBN
YXhpbWUgUmlwYXJkDQo+IDxtcmlwYXJkQGtlcm5lbC5vcmc+OyBUaG9tYXMgWmltbWVybWFubiA8
dHppbW1lcm1hbm5Ac3VzZS5kZT47DQo+IEhhamRhLCBBbmRyemVqIDxhbmRyemVqLmhhamRhQGlu
dGVsLmNvbT47IE5laWwgQXJtc3Ryb25nDQo+IDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPjsg
Um9iZXJ0IEZvc3MgPHJmb3NzQGtlcm5lbC5vcmc+OyBMYXVyZW50DQo+IFBpbmNoYXJ0IDxMYXVy
ZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+OyBKb25hcyBLYXJsbWFuDQo+IDxqb25hc0Br
d2lib28uc2U+OyBKZXJuZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNAZ21haWwuY29tPjsgRGF2
aWQNCj4gQWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT47IFNpbW9uYSBWZXR0ZXIgPHNpbW9uYUBm
ZndsbC5jaD47IFZpbGxlIFN5cmphbGENCj4gPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29t
Pg0KPiBDYzogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT47
IGRyaS0NCj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC1rZXJuZWxAdmdlci5r
ZXJuZWwub3JnOyBMdWNhIENlcmVzb2xpDQo+IDxsdWNhLmNlcmVzb2xpQGJvb3RsaW4uY29tPg0K
PiBTdWJqZWN0OiBbUEFUQ0hdIGRybS9icmlkZ2U6IGZpeCBidWlsZCB3aXRoIENPTkZJR19PRj1u
DQo+IA0KPiBDb21taXQgNTE2NDU1M2Q3MzllICgiZHJtL2JyaWRnZTogYWRkIGRldm1fZHJtX3B1
dF9icmlkZ2UoKSIpIGFkZHMNCj4gdHdvIGRlY2xhcmF0aW9ucyBmb3IgZGV2bV9kcm1fcHV0X2Jy
aWRnZSgpOg0KPiANCj4gIDEpIGFuIGlubGluZSBkZWNsYXJhdGlvbiBpbiB0aGUgI2Vsc2UgYnJh
bmNoIG9mDQo+ICAgICAnI2lmIGRlZmluZWQoQ09ORklHX09GKS4uLicNCj4gIDIpIG9uZSBvdXRz
aWRlIG9mIHRoZSBzYW1lICNpZg0KPiANCj4gVGhpcyByZXN1bHRzIGluIGEgYnVpbGQgZmFpbHVy
ZSB3aXRoIENPTkZJR19PRj1uOg0KPiANCj4gICAuLi9kcml2ZXJzL2dwdS9kcm0vZHJtX2JyaWRn
ZS5jOjE0MDY6NjogZXJyb3I6IHJlZGVmaW5pdGlvbiBvZg0KPiDigJhkZXZtX2RybV9wdXRfYnJp
ZGdl4oCZDQo+IA0KPiBUaGUgZnVuY3Rpb24gaGFzIG5vdGhpbmcgdG8gZG8gd2l0aCBPRiwgdGh1
cyBmaXggYnkgcmVtb3ZpbmcgZGVjbGFyYXRpb24gMS4NCg0KTEdUTS4gRml4ZXMgdGhlIGJ1aWxk
IGVycm9yLg0KDQpUZXN0ZWQtYnk6IENoYWl0YW55YSBLdW1hciBCb3JhaCA8Y2hhaXRhbnlhLmt1
bWFyLmJvcmFoQGludGVsLmNvbT4NClJldmlld2VkLWJ5OiBDaGFpdGFueWEgS3VtYXIgQm9yYWgg
PGNoYWl0YW55YS5rdW1hci5ib3JhaEBpbnRlbC5jb20+DQoNCg0KPiANCj4gRml4ZXM6IDUxNjQ1
NTNkNzM5ZSAoImRybS9icmlkZ2U6IGFkZCBkZXZtX2RybV9wdXRfYnJpZGdlKCkiKQ0KPiBSZXBv
cnRlZC1ieTogVmlsbGUgU3lyamFsYSA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+DQo+
IENsb3NlczogaHR0cHM6Ly9vZnRjLmNhdGlyY2xvZ3Mub3JnL2RyaS1kZXZlbC8yMDI1LTA1LTIx
IzM0Mjg4MjY2Ow0KPiBTaWduZWQtb2ZmLWJ5OiBMdWNhIENlcmVzb2xpIDxsdWNhLmNlcmVzb2xp
QGJvb3RsaW4uY29tPg0KPiAtLS0NCj4gIGluY2x1ZGUvZHJtL2RybV9icmlkZ2UuaCB8IDIgLS0N
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvZHJtL2RybV9icmlkZ2UuaCBiL2luY2x1ZGUvZHJtL2RybV9icmlkZ2UuaCBpbmRleA0K
PiA0NjRkYTI4ZjkxMzRmMGZjZWNlNWM3MmE4YzVmZTdmM2U0MmM3ZTNkLi4wYWY1ZGIyNDRkYjg1
ODBlYTBjOWFmMWQ5YQ0KPiAzNzNiN2JmNjJlZTY5OSAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9k
cm0vZHJtX2JyaWRnZS5oDQo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9icmlkZ2UuaA0KPiBAQCAt
MTMxMSw4ICsxMzExLDYgQEAgc3RhdGljIGlubGluZSBzdHJ1Y3QgZHJtX2JyaWRnZQ0KPiAqZGV2
bV9kcm1fb2ZfZ2V0X2JyaWRnZShzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+ICAJcmV0dXJuIEVSUl9Q
VFIoLUVOT0RFVik7DQo+ICB9DQo+IA0KPiAtc3RhdGljIGlubGluZSB2b2lkIGRldm1fZHJtX3B1
dF9icmlkZ2Uoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QNCj4gZHJtX2JyaWRnZSAqYnJpZGdl
KSB7fQ0KPiAtDQo+ICBzdGF0aWMgaW5saW5lIHN0cnVjdCBkcm1fYnJpZGdlICpkcm1tX29mX2dl
dF9icmlkZ2Uoc3RydWN0IGRybV9kZXZpY2UNCj4gKmRybSwNCj4gIAkJCQkJCSAgICAgc3RydWN0
IGRldmljZV9ub2RlICpub2RlLA0KPiAgCQkJCQkJICAgICB1MzIgcG9ydCwNCj4gDQo+IC0tLQ0K
PiBiYXNlLWNvbW1pdDogYTM0MzZmNjNhYTRmOTNiMDQzYTk3MGNjNzJhMTk2YTUwMTE5MWVjYw0K
PiBjaGFuZ2UtaWQ6IDIwMjUwNTIyLWRldm1fZHJtX3B1dF9icmlkZ2UtZml4LW5vbi1vZi1idWls
ZC1mYmI2N2QyODQ5NGMNCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gLS0NCj4gTHVjYSBDZXJlc29s
aSA8bHVjYS5jZXJlc29saUBib290bGluLmNvbT4NCg0K
