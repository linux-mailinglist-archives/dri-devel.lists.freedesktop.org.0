Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D45A37B4D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 07:20:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B7A10E319;
	Mon, 17 Feb 2025 06:20:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iTHkvuWc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5200810E310;
 Mon, 17 Feb 2025 06:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739773213; x=1771309213;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+7Vk0sQEq/m9s/CERS9TUFIiEK+I0HIxsIljL6DQjMo=;
 b=iTHkvuWciRC+N9+s1waqiG3+99kbP5miAh40xBjYF77ZFm0ll4qD5gpg
 YSNzI93gzZGFE+Cg7z7xewe/aVbre/V0/H7brF0Yjhme964kUVpDn1YWf
 8WStQzyLAjJNhMxbIoL570qWnZ9snaaw9FNhb7N/8/RY1qUZdtefRDY8y
 HpOjM6cn1cAuzkcRxccDyRY+oXMLLk3J2jsTEQdQ97Uo2rbk3zJRnqIbm
 q9/4HfA4DzXr27CBFlQQXxGw8AVEY16KzXJwjzWdpOW8Vy7M3kl+D7H9z
 CIcpoedC+MSl/+IEbDCbM8pZdR1L61Jhzc+fTppD7YyHtkDP+Bmbky0im Q==;
X-CSE-ConnectionGUID: gXh6fB6nTGeFh5NLrUbqCw==
X-CSE-MsgGUID: 1/kY5qtbRCeZVPY4h4b5ZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="40311557"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="40311557"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2025 22:20:13 -0800
X-CSE-ConnectionGUID: yJIqNAE/RO2adtIeYasDCw==
X-CSE-MsgGUID: Tv1cIUP9RbCxNWs28vnSmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114922037"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2025 22:20:13 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Sun, 16 Feb 2025 22:20:12 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 16 Feb 2025 22:20:12 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 16 Feb 2025 22:20:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ow7St72XDevMZ4SPlcOxj0dWndfyvd55ve6LtoA3Ho3F/4UTmb0Vy+h5DCU3UoaFPh9ztnPCRrkLePNlvZZb+80eY2LL6ZWtLOktvuVAcCOKE7HYsvOBBT2OFgHxotiNk02zmHEErO7j4PIyrxosMfAS27CMhvOP3y4wOoOBAmqAfeY96dXrFMNvTWn2jhLoL7x7Lj2vMoTeJSdm2oC4aPMlQA7Qk9ZQC2ZvjtDzs3VLsaWoC3f57uffRNoq4Hu9G4zDKQWwi5vyui3zNQdqHxFkUtdekUfv9ZBt1LcNyhLLHuW7wuJ+bbqQw1qOr/VVGUBbzNJjAGALgUuqY1s+Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+7Vk0sQEq/m9s/CERS9TUFIiEK+I0HIxsIljL6DQjMo=;
 b=XlreNavJjGnGv/aZWZvd1NVkMqmNjo8xHmGJ2ED7G0EOCF2HbjTpJKdLYrNxMNFxtGB+GNsuF0K5Xx+yp9msezTTkSPIFnGRxVd1I51moBizZo8nuUrB/Usjon4PvbOD/JzusHcy26//pqAqJ1LujtZJ1JKNrFFduFfPOtxZgbQjTq0MFX0JFF6A10VnMLG/SxGMWw4SBc1sWha9fG9hxbfBmgp8m1cNpqlkEWEN/BkhKuEEER4E9VAtjDVtXx17QKTfyj9UQj6sZ21WljluXgQu39isg+6ZZ+DEO8PFwJz4EW45/U5wH0ntGv/MZtlfY4HnbccueNIdXNuvYGo+6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by SA0PR11MB4527.namprd11.prod.outlook.com (2603:10b6:806:72::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 06:20:04 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%3]) with mapi id 15.20.8445.013; Mon, 17 Feb 2025
 06:20:04 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>
Subject: RE: [PATCH v8 14/14] drm/i915/histogram: Enable pipe dithering
Thread-Topic: [PATCH v8 14/14] drm/i915/histogram: Enable pipe dithering
Thread-Index: AQHbcZ6iN2G2bQ1XTkyoL35lbXtEsbNLJFKw
Date: Mon, 17 Feb 2025 06:20:04 +0000
Message-ID: <SN7PR11MB6750E014E69E396B6786C6CCE3FB2@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20250128-dpst-v8-0-871b94d777f8@intel.com>
 <20250128-dpst-v8-14-871b94d777f8@intel.com>
In-Reply-To: <20250128-dpst-v8-14-871b94d777f8@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|SA0PR11MB4527:EE_
x-ms-office365-filtering-correlation-id: 8df98240-a481-4fbb-3cde-08dd4f1b1e52
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?V2FMNkh6SlFDWWVlSm13T1lIc1EvNDRrNUxKemFRUTZLYnM4TXhrMlMwbklh?=
 =?utf-8?B?T3Y4WnBpY09TVFhzc1lnRG9WY0p1N0tySWZmd1NzNXZ5WGthbVR6QnBSMnM4?=
 =?utf-8?B?L2lpSTJIMDhtUW9pQjl0UU8ydFppN01xZHRSd1cyK2RPT2xMTEo0SXl6bnNp?=
 =?utf-8?B?ejdOUlk2K3FUaGZFbnk1T0szcUF5ZFR3aEVsRjEvWnpjLzFTMVNQYmNPYjVl?=
 =?utf-8?B?WTV1c00rNlVJYUZibXE1dHlPSm9kL3lPTmVCM0x5WFc0aGNZcnF5bU13VzRF?=
 =?utf-8?B?NXhQU0dmZkQxMVVnWjVjajRPdkcyUkxIcFgrWXBSRFJ4cjlvVGM1RmhnaE9j?=
 =?utf-8?B?TEVSdlFicHpOMEh4NWoyRGRjcnNnK2tucVYvZFZPMDRtSGJ4OUZxTk5CSjla?=
 =?utf-8?B?bU1GT2daS3pOV25IUzhsRkJjNEIzUGg5SUVsTzZJUk5XNVZERXY5dFBqa0FS?=
 =?utf-8?B?K0p6NThRbyszUUw0Zks3MHRlSzNabUJyQ2tJQWhIQXo4V25Kdk5aQk5LcCtY?=
 =?utf-8?B?Ym5mK0ZnOXpXVUVxdERVMVBTejVxLzBkV0NSTGJGV1NJbnJrQWFaaGwyRUFI?=
 =?utf-8?B?Y2lYakdYR2ljR2xsbC9BMjJUZG9RMHJpNEZvTm4zL0JKeTFPdFdDTUJiWkI4?=
 =?utf-8?B?NGxpN1VjTkhGRVZSZ3A5Nm9EWlVsdHZEUlJKWEdMK3M2ZmhmbTNuQXM0NUxm?=
 =?utf-8?B?ZTEwTmtuVjV3a2tGQzVJd2VuSlAvYkZIaWQxd1MzRllHaVBzOHUzOWNudm1R?=
 =?utf-8?B?Z0ZnQ2lwQnV6bzdsN21EU3hjb2FDZ3VKczNUWGpTbVYwbVpoNkFuUGJRTEYx?=
 =?utf-8?B?dUJvSkJ6aWF2M2g0a0YwU1VMVTg3Y2VLWGRWWXNvdW56R1MrdW1NMVVxbmpv?=
 =?utf-8?B?UmV6Zmg3Q0F5eE1sblVobEYvdk5nZjFKeU4wU1VKNlVLTDhMVUFqRlhTamR2?=
 =?utf-8?B?M2hSODgwZnU0Zy8xK1laS2pvMUJTZFdwTnhqRjZJMU1tbVEycysxSzhMOUI0?=
 =?utf-8?B?b2dQTUxUVVNBU2pISEdEejF4ZWVOMnFEMzF1bEZXNjNVQ2NWanIvMEM4YWhJ?=
 =?utf-8?B?YjRYYmdoSitzc3dJRU5NK2RYbyt5NG15Q09nQ0JqMHkwenp4dlphVEdNenY3?=
 =?utf-8?B?dmFCbHFuNW1tcWtVOG9DZWRnMnVVWENlV3BRZFZtdHRUY3JPNjdyYkdYSm5N?=
 =?utf-8?B?OWE1b3NkT1lzY3V0eWRzaXU0ZDlxem9Bb0pDdjhKNlcwd010YjZMT2RkVDFa?=
 =?utf-8?B?S2dJL1RoSHpiZkx2ZnFEOHFSbk1yY1BTbTI0WVJjeUtzY3hZRE1NZjRrODBD?=
 =?utf-8?B?MlRMNnNuNkxPUHVBbWFKL1RySzFIUFN0T2g5ZHRnang3NGRRNzJoVytIc0lR?=
 =?utf-8?B?M2R1MWFtakt5SDhFdnV2ekt2MFg3ZEdPUG9DaytxYm1tUU5Mb0ZNTVJrYWEy?=
 =?utf-8?B?VnVOcjJvbXkyVFRQaTJWTk5uT1o5N3ZHMXM2TGFoTGphYUo4K2VzY052Kzhy?=
 =?utf-8?B?KzhWcFJnV0hVd1dxN3N0ciswU3J5czZlVWJVcmgrTHQxRzY5S2VZY21NdFY1?=
 =?utf-8?B?NDZjY0tyUi9jZmFkWWNjQmtkNWVFVGtrTHRuY1RXN095dUc2Skc4L0MxMEhy?=
 =?utf-8?B?YjhOYk8zNTJwZVRPNnZxZFB5anlnVHV6OGpWTGI4b3FYaVl2eUlRcXVJaHJC?=
 =?utf-8?B?bUdWUnp0by9GMUVHMmkxS2I3MkRHUzhTWWdJR0J4RE5WVitSUVZnRXJWcnRj?=
 =?utf-8?B?SDJBNmdrVUx5Ykd1bWhwcWpOMlF2ZUJ2YWZmMlV4cDk1aGhkYkhncElDdllz?=
 =?utf-8?B?SWNjV0lwZTFsS0hpT2p3Z2N4TEZ1NlJaNHpjcjkrQ1YyYlI4THcvY0lPR0V6?=
 =?utf-8?B?Q1oxbjRML0F3aks1R1VsZSszWGkvWnZMdTBYdW9hd05kQU5ObThCcjFvTmUx?=
 =?utf-8?Q?ghxfrAA8uhSlqU+/i5asEc4Mjqy6oEQv?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bXdUMm9yZjJGMTFlT1pFdW5JWlh0Wm5WdFVOYlpRa3BwRk1TQW5lZlZSZkhB?=
 =?utf-8?B?ZElVYThRazNaR1VyWmROeit6alR3V0RLVGpHRnRsUk1qZi83Sk10NnlkNGho?=
 =?utf-8?B?ZGV5a0lDaWQyMUc0S0RXR0Z3Q3JEODdDRFFVbmVRZ2VpZVpiWDdTREMvWVB3?=
 =?utf-8?B?QTF4L081SXQreEI2OUpFUmNDK0w3Rzg3eE5UQW9KNVVpc1lncnhaM1dUNXVk?=
 =?utf-8?B?anMvemc1cWM5VzNNSkJMK0RLajlieXprb3V6YzVvb1RUWEZyRVF2ekpQeGZm?=
 =?utf-8?B?dnp3ZlVlUmcvOEZPN1pmUHduOHFuQnBRSHlVUVArTXhxZW5xbnh4RER5TzBi?=
 =?utf-8?B?VEQ0VGk1TS9JTEozbU5UNG5tWS9HVXkxN01jWE1wMitaYUtscXEvNHdoQWN1?=
 =?utf-8?B?c2V6eXBKSkhkZWM0bFMza1FaWU5DM2U0K3pXWm5oSU9lSS9MZThkODB4cnRY?=
 =?utf-8?B?dERUdGNPaUNiVUQ5QWNtbGMwSEpncUUvYU8xQmhmNWxjSGF5T1NFUTJ6OEZ2?=
 =?utf-8?B?NndUaExZSFdCRGdjNlpEdVVGQS8xQ25IMEhGcGZucXJvZXFJcng5Mnc3dlp4?=
 =?utf-8?B?MUtLUlZaMkJ2SC93aXpoRUgrYnlYYThzM2dMT01VQXNMSGJhQ1UyMEdDN0ZT?=
 =?utf-8?B?cUJGSlhFcXZCL1grMndvaGh1aXh2QmNsVGd6TnFYb1laNEVSdTdTM291aUJw?=
 =?utf-8?B?TVpzNytKaUVnOC90U0ZkSkE5WExqNDRWODQrekd6VjMvSGZwVTl1OXVTVWIw?=
 =?utf-8?B?bDlUQ0hoTE1IV1VLZXFvVTBYcHJQRlRxazV1eGZwb0pRZUYxU2lqMTZFSE1r?=
 =?utf-8?B?VTFDWmFmYVhhUnNrR1dJQWcwalBrbU5scWEraXVIYW5Dbk81bmxRZUJKclVN?=
 =?utf-8?B?S2gzdGtBdlJud0s3bFdCck9vcnQvdzdESGd0R2lxbjZxQTNRN3d5QkswR1cw?=
 =?utf-8?B?WWtCckY0d1N1ZFJtNGdoSnlEME5Ba2g5MTl5WDNkdEhEdm04aXh3Snd1dXJq?=
 =?utf-8?B?K0ZuK2ZxOFZkRXNyTDRyY01ZbDZtNnlCaks4eXNLdlFITkVuQzJ0MlRQbk9P?=
 =?utf-8?B?SzJNRXJtdFdpMWZDekhDYUUxQ1pzWUxsNG1jUjhtVkhUZHZ4N0EwRWdNNVFl?=
 =?utf-8?B?d0ErY1NyME8vN0wrK0pneHc1TFhkOHNNNTVDbTZldnJobmJ3Mmo3YnYva2h3?=
 =?utf-8?B?WTJuazdXS0NIN1Njd2x3MDl5MGpxN2dReU9KcnZtZk5vNzVSeExuTlhkUmFX?=
 =?utf-8?B?cVM4cmVjN2R2dW1qYUx0UysxaWx2aXVvQUk1UGRpdUhYZy94cnl6bTNuTkJZ?=
 =?utf-8?B?WVNmM0JtSFlFN2k5Rm5jdjY0Tnl2R2E3dDl4eHBxcG5IZ1MrVlV5cWhWanVs?=
 =?utf-8?B?VDRFZ0Nlc2gwNi8rNnhmMXNKWG9rMTNQVGI0aVlhWDV5VHJNaGZCRVR1TUV6?=
 =?utf-8?B?RGxmakpaVTdXSzZYVFRQd0FxRWkzMTZlVHdqUXBTY2theVA3ZzBJL3M0VjI4?=
 =?utf-8?B?cGdvNFFPQ0F1S1ZTTWMzSFNNT3YySE5qbG9CYkRNOUpTQTlFdDJ6Wml0N1Iw?=
 =?utf-8?B?cGltWGlXOFNVZER5Wlc4REI4dzBvSjBnKzRLVERZdngyQkd4YmdmU3FtdC9k?=
 =?utf-8?B?UG5hdW5qZURZU0FIdGxBS3g3K1RQa29WUzljMW4wSE1TY3RJaTZJSkc5RnRp?=
 =?utf-8?B?OFBEM2RNWGdpOHVqWjQvaFJlc01Eam94NFJldThYNDBleVcvVXE2UFdjN1d4?=
 =?utf-8?B?ZUUyRk1JZmFGRGxsU2dmTzI1eHFSR2IyQWdUcFR6TVdiM2NNK214d29sTTAz?=
 =?utf-8?B?TlArdkRsSWxaMm00RUY1WEIrRHQ2akx0aFd3UkJKeGlQb2RrQWlHaHI2UDJ6?=
 =?utf-8?B?N3gzVFdNMDJ6cC9Xd3J4VEU3TTBuNjRTUHBpRlNPUTZtQ09uQVpZdWtWMElq?=
 =?utf-8?B?a0twcEI2T3dEd1lybXpWU2M3S3FUMXRlK1VucTV5TjhGOUE1Y3VBWllDYjRM?=
 =?utf-8?B?OFNKNHcxVGlkQkVYZzlETnl4UDhWMDZmR2RpSVNobUx6cm1pTkI1cDZQMW5y?=
 =?utf-8?B?T09ic2ZOa3haU3hPc0RsaFVETFN1Y2xyZUVpKzd1aGRYai9RQlVhUjZhR2Uv?=
 =?utf-8?Q?Z98PmM63teJka7Kn3ulM8x7HZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8df98240-a481-4fbb-3cde-08dd4f1b1e52
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 06:20:04.7846 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qG7sn7eZkF1xkpbDl9koTA5rU8SiN7CXIUmkplkCnfIn5QWzQ+VvIorZk514p/6LO8Lshs2UZ51l8uHnzBS2YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4527
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTXVydGh5LCBBcnVuIFIg
PGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBKYW51YXJ5IDI4LCAy
MDI1IDk6MjEgUE0NCj4gVG86IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJpLQ0KPiBkZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcNCj4gQ2M6IEthbmRwYWwsIFN1cmFqIDxzdXJhai5rYW5kcGFsQGludGVsLmNvbT47IGRt
aXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZzsNCj4gTXVydGh5LCBBcnVuIFIgPGFydW4uci5tdXJ0
aHlAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjggMTQvMTRdIGRybS9pOTE1L2hpc3Rv
Z3JhbTogRW5hYmxlIHBpcGUgZGl0aGVyaW5nDQo+IA0KPiBFbmFibGUgcGlwZSBkaXRoZXJpbmcg
d2hpbGUgZW5hYmxpbmcgaGlzdG9ncmFtIHRvIG92ZXJjb21lIHNvbWUgYXRyaWZhY3RzDQoNClR5
cG86ICphcnRpZmFjdHMNCg0KPiBzZWVuIG9uIHRoZSBzY3JlZW4uDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBBcnVuIFIgTXVydGh5IDxhcnVuLnIubXVydGh5QGludGVsLmNvbT4NCj4gLS0tDQo+ICBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hpc3RvZ3JhbS5jIHwgMTEgKysrKysr
KysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oaXN0b2dyYW0uYw0KPiBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGlzdG9ncmFtLmMNCj4gaW5kZXgN
Cj4gZjY4NDQ0NDllNGJiNjE2NzExNmQyMjNhZjMxNmU1ZjNhNWU4NzA3Yy4uZWFkOWMyMzkxZDQ2
MGY0NTlkZmNhOGU5OQ0KPiBlYTQyM2EzNDQxOGU2N2QgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGlzdG9ncmFtLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oaXN0b2dyYW0uYw0KPiBAQCAtMjIsNiArMjIsMTMg
QEANCj4gICNkZWZpbmUgSElTVE9HUkFNX0JJTl9SRUFEX1JFVFJZX0NPVU5UIDUgICNkZWZpbmUN
Cj4gSUVUX1NBTVBMRV9GT1JNQVRfMV9JTlRfOV9GUkFDVCAweDEwMDAwMDkNCj4gDQo+ICtzdGF0
aWMgdm9pZCBpbnRlbF9oaXN0b2dyYW1fZW5hYmxlX2RpdGhlcmluZyhzdHJ1Y3QgaW50ZWxfZGlz
cGxheSAqZGlzcGxheSwNCj4gKwkJCQkJICAgICBlbnVtIHBpcGUgcGlwZSkNCg0KQWxpZ24gd2l0
aCBwYXJlbnRoZXNpcw0KDQpXaXRoIHRoZSBhYm92ZSBmaXhlZC4NCkxHVE0sDQpSZXZpZXdlZC1i
eTogU3VyYWogS2FuZHBhbCA8c3VyYWoua2FuZHBhbEBpbnRlbC5jb20+DQoNCj4gK3sNCj4gKwlp
bnRlbF9kZV9ybXcoZGlzcGxheSwgUElQRV9NSVNDKHBpcGUpLCBQSVBFX01JU0NfRElUSEVSX0VO
QUJMRSwNCj4gKwkJICAgICBQSVBFX01JU0NfRElUSEVSX0VOQUJMRSk7DQo+ICt9DQo+ICsNCj4g
IHN0YXRpYyB2b2lkIHNldF9iaW5faW5kZXhfMChzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxh
eSwgZW51bSBwaXBlIHBpcGUpICB7DQo+ICAJaWYgKERJU1BMQVlfVkVSKGRpc3BsYXkpID49IDIw
KQ0KPiBAQCAtMjAwLDYgKzIwNywxMCBAQCBzdGF0aWMgaW50IGludGVsX2hpc3RvZ3JhbV9lbmFi
bGUoc3RydWN0IGludGVsX2NydGMNCj4gKmludGVsX2NydGMsIHU4IG1vZGUpDQo+IA0KPiAgCWlm
IChoaXN0b2dyYW0tPmVuYWJsZSkNCj4gIAkJcmV0dXJuIDA7DQo+ICsNCj4gKwkvKiBQaXBlIERp
dGhlcmluZyBzaG91bGQgYmUgZW5hYmxlZCB3aXRoIGhpc3RvZ3JhbSAqLw0KPiArCWludGVsX2hp
c3RvZ3JhbV9lbmFibGVfZGl0aGVyaW5nKGRpc3BsYXksIHBpcGUpOw0KPiArDQo+ICAJIC8qIGVu
YWJsZSBoaXN0b2dyYW0sIGNsZWFyIERQU1RfQklOIHJlZyBhbmQgc2VsZWN0IFRDIGZ1bmN0aW9u
ICovDQo+ICAJaWYgKERJU1BMQVlfVkVSKGRpc3BsYXkpID49IDIwKQ0KPiAgCQlpbnRlbF9kZV9y
bXcoZGlzcGxheSwgRFBTVF9DVEwocGlwZSksDQo+IA0KPiAtLQ0KPiAyLjI1LjENCg0K
