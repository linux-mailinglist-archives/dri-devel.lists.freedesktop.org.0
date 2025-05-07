Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4EFAAEF10
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 01:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B73E510E29C;
	Wed,  7 May 2025 23:11:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fvNzT5uk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3241810E1C2;
 Wed,  7 May 2025 23:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746659473; x=1778195473;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uJnmvIj7Nj53MaPDQ86Bo3DZX/eNCgRNwTQjh5yKRYM=;
 b=fvNzT5ukT87V0cK8On5BItfFrkH9Vyuz90Ac1hxD19nB+peSK8vI1Nz0
 KnRkpsOGT72v63UihYAy2TfaPbPdxuBqp7f3D2SbVlmEOoSO/tJnuqPQ/
 vQXIJ50Bky1mRQQkAkyn0ZDgqaQapWikPGpACBJHx39OwwI1vwF6D3anh
 oAE4Vu00HIQ+waPawlOm5jO2KZG1Nxy8mHweDiJ41CqhK1Y7xay4Yo7Wt
 vIZfBr/hRgESMYSsvK4hRQqqL9arR2BzTjYnPMiiUMf+4EkY3l3hreXtH
 yKLHqjmIjmIFAQS6hdT3FZOj7rFXdb+zgbsaWBl0LwTkW10fXA1lvyiU3 g==;
X-CSE-ConnectionGUID: nBKUnUN2T024QoKnxXHvnQ==
X-CSE-MsgGUID: 7/mg64p3TPaHyzOl/ukkxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="52230001"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="52230001"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 16:11:11 -0700
X-CSE-ConnectionGUID: e3N23ALgRJm5qrE+i26XAg==
X-CSE-MsgGUID: XLFvMOR+S0S5eUCkr/SMrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="167050343"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 16:11:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 16:11:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 16:11:09 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 16:11:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eNorj45ozGPasDSzXX0gzZ1ObNkUVVLe33QCYNTfH634zBWrmt7kSvHQZb3O8IoL3RZQRAvkjQ2TC2FcPOhbTG1kuNjawMhxN/FNB7bnFPtPoEJ1pbqFbH8IXT4xp+ZXkP4Ciw7vqJ6MYGkSEgnzOImmQG51/mTsVWixjg6+8zlMJ0oHiqo88iGFPyZRWFoKI+KSLNOmZ8GpPyguigQ91oQ0m8RpNqmrwfUNYejMNAeJbP/kxpqFBi7SA5Et1DkPACFNorYi6k3nlo+LnsiiMh4OgO6LBrJjn+tt4CM0g8IBV3Vn4pEkWHqtwt1euIpLRUUvdBg9zjr9Mp8CXGqtFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1HR46J25af28ygojXJb6Bq6jg2khn0oxq0o7MAtt6xc=;
 b=MbxCxdVM7zG5HX1BMjkuQR2PALYtJZavtV1yrJmhghcuNLbzVCFwhn6Hp1duceucGYjyUTvSgQnNFCW6WnnoOUTM6OilTL/C7I8kKU9l6xrj4mHaGKBrTMI+GgdA0fYBTxIJkKeERwh9lppN4ucqy4Lm6EYtBKr2mOEPmWjKUYzz9/75ukgjeK5enehYLme2sVaKaTLxkkH36OGuNlyVyzxyodjE5YuM+lWKN+WbkDgvCcerv/GYBDfmtqFLCbq+7OfbuV/te0rBccdMiQK3AOMTLrxFQU2s4Yy/em5nlGbwhihTsjayPoPrmnnR+XF56OskJsj/2f78xLlPy9z1gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH0PR11MB5061.namprd11.prod.outlook.com (2603:10b6:510:3c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 23:11:08 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%6]) with mapi id 15.20.8699.012; Wed, 7 May 2025
 23:11:07 +0000
Message-ID: <359f8288-480a-47f0-97e6-9bcda94cff30@intel.com>
Date: Wed, 7 May 2025 16:11:08 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 4/9] drm/xe/xe_late_bind_fw: Initialize late binding firmware
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>
References: <20250429160956.1014376-1-badal.nilawar@intel.com>
 <20250429160956.1014376-5-badal.nilawar@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250429160956.1014376-5-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0191.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::16) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH0PR11MB5061:EE_
X-MS-Office365-Filtering-Correlation-Id: 457b5335-deaf-43e3-71c8-08dd8dbc72e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dWhPN0x5RGNTNG5RU3VpbWVnVVRHaVpvNkFvVGg5UDhFcFFxS2RVV0hTZ0Vl?=
 =?utf-8?B?N2ZqdElXMUo4ZGx1TTJWcWg3V243VXRUbmY3SWkzM0U5RGR1bWhmS1JhY3JB?=
 =?utf-8?B?Y2E1NDFIS3l1MDYrL1pKaHZJQUNCNjUvdFJSU3lFWWNndjhDUzVPWnIrazF3?=
 =?utf-8?B?UUZ0RWhySDBVNTNpaHBJVTIyemVRT2R1T3E4YmhhQ0x3TFhYQzg5NDFHMmVQ?=
 =?utf-8?B?bVpkOW41VG5IbUw2dlNON1hjZ0psV3NCNVVZdkpOK0dQMVdoT2NReWFaVEFi?=
 =?utf-8?B?dklMU0dmUURZMDQ3akl2alF6MXBlbURlNC9JRWhJa3R3VHBXVU5Yb3pRY1No?=
 =?utf-8?B?NVQvb3BMQjJBSVdzaHphVVRkWkpVSnZVYkJ2VWlOTFdhbUhrTENkcy9ncTBG?=
 =?utf-8?B?UjVtQzN4MjFrQjE3eDlrbU1KNmErVHZvTlNLQ084TXBCVkU1dmtnOCtBYzgz?=
 =?utf-8?B?enU3Q2VPSjBuSmFad2ZlVEhJbnFHcmkvYkRoaHNabGhEV3RoNFdzcEpJVVQz?=
 =?utf-8?B?dlY0TzMrU2JMeVlYOHJrbUFxMkpBSlJmWDJaUE5Ua0NFU3ovdVp1TnBmR0ZN?=
 =?utf-8?B?R2RtM3dCOHBsNWlWWVlNMlpqZXpodXFXalVzUWh3TEQzV1QyWC9tSCtUbjkv?=
 =?utf-8?B?cDFIN0x4QXJ4Y1hwQU1vQ2tPL0JFM0FVY0c4dFNmeW42UUdjY2QraEliTWx4?=
 =?utf-8?B?TkJIZjJQdXBCbGlWa3dVMFRvQy9LVk91YVYrdnQxaGRSdUJpQktQRHUxMmlP?=
 =?utf-8?B?aHNpWmIyN2FYVEQzTEZjd0d0M2pzMDN5Z0pUOTVjUUsxYWNNOUxWWXQ0aXI4?=
 =?utf-8?B?dGEzSTl3TitNdnBHckdRT25UZG9uN3NLcXRUa0dlc0ZXUFZBRnNHUHZudGhG?=
 =?utf-8?B?aTVNS3NIeGZzUGlGOVhLL0Mra3JsUkliNU9hWjgzdFlaOXNodDBySUpURDVs?=
 =?utf-8?B?d01WQTNsUitOWG9IejhYaVRicmtVSUErTDJGLzk4bEVhU1hsQUZGWEZzNGIx?=
 =?utf-8?B?NndDclFyNGVMN21SQWxHVTQyUmtyTE13NS9hTjdYcnRLOXlrYUk5VFRIUW5r?=
 =?utf-8?B?bUhHWFdsOWN3N1Q0L0JmWGpSZUtHbDN3TUlMZ3ZDZU16RDZtNnNHenhXZjdZ?=
 =?utf-8?B?U1Z5bnRLZ2Vyd0dwK005MUdQdjFjMkswNVVDZytVUTVXVHR6dUQ2MXhhOFls?=
 =?utf-8?B?MEltOG5BRW54MTd3SGU1OHA0clV4QkRyRnVNUFBPUng5K2h0YVVWWGpjWWZh?=
 =?utf-8?B?djU2blMxQklYSU44YXBtQktKNjNsbUpRa0szdXBUTkFQRU9oQ0hmVVppaTln?=
 =?utf-8?B?blkyVlFXV0lEZTV5OGNDcDNpbEtSTDBORmJkNk9wRlhRZ0xtRTJGY3ZLS0hn?=
 =?utf-8?B?T1dwSzhXbWx5VitwZkdXdUlVc3pwZ1Q1L3RWdkJWeWcxV3BpS1ZtaUVaRWt2?=
 =?utf-8?B?ZS81UFl3cy9YcGQwMGtENzRRTTNRRUI5SE9kOUtKME0rWkVnc1ZCendRUTJM?=
 =?utf-8?B?blVoTHZFVjRsWmlyUkxnREM0SVJ1VW4wTFJKelNDYUFhZFh6SmNYL01OdTM1?=
 =?utf-8?B?dVlKWG1MSUVsNlNGTUpjL3dJNjIzUExBeFFJN24zeTRmWUN6ODQ5cnhLQU9M?=
 =?utf-8?B?My9XRVdVbnZFdzBnenhyUkZpSUR6cUNTRlZ2MVpORHlreUN5WHkxSVFZbmFC?=
 =?utf-8?B?OHJaQXk2VVIyK3NlQmNEOC95STJjMGQrb0xmQ3RoYU91Z09FbXExSGMrQzYy?=
 =?utf-8?B?bEl4ZE82dHNRWmpDNGVWQXJlbm5wTkZUN01wVUR0Rm5wMzRoYWgwQkVtQUhw?=
 =?utf-8?B?ZS9xM3d6N1VBTjNJQlowTVBZTWljMyttM3Z1NXByTW42YXlvOWwxYmNTdGJI?=
 =?utf-8?B?TnB2di9hUWxRWEwyVTB2S3VIeWUySXFpRldJUEJwcE44bmVXRk5nTEs4azZo?=
 =?utf-8?Q?QAOlnIPD3do=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UCswUFlHMkdIaFd4WXQ4Z24wNXQ2WlMvTTVhblI3L3IrV2NwTmd2bHJ6QWlE?=
 =?utf-8?B?cjZrRjgvYXFqSVU5cHFQTVpESUlaOFJUNlJOZ25XN3ZyUVRMV3oxNXlKWE16?=
 =?utf-8?B?MFY0cGR5RmtOeTJ4ZlhCTFdIZlAxK3JzUk0vSWw4RlRoeFJtM0d4dk5KOW1P?=
 =?utf-8?B?ZHl6b0g5SGFtYWxDa0h5VlBRMmZtMDJ4eU9XeGxTMFg5aE84c25saUxESkVv?=
 =?utf-8?B?bk1XODlneWFRNThyOEMxZEFIYmNPdDhLRUxhNVBmeTZIYXM1Tm15SnVsbjFo?=
 =?utf-8?B?MGVpczluM002VytaN1dsTzNKdGVSVWZURjdCUW9Vamc0VEJOUXZRQnZKbHRy?=
 =?utf-8?B?SWtLQ3ZXcmhuRmVrdy9rcDd4NWJHcWdRMUE3SEVDbGJwUExLNjRWUGhKZFVF?=
 =?utf-8?B?M0tBeFlpQkx3YlhXQnhiZllCVHpmL0lhVFNVNElKd3NZQVR0Q1hqbjR0VkhL?=
 =?utf-8?B?cW5EVGl4QUhLb3VZbDhkR0l4ZDVSYjVnSDFzOFF0Kzc1b0syellsMWlaSTJZ?=
 =?utf-8?B?cDBMRmV3aVlka1VaNHJIM2RZczNHTndNMGc1ZUl2SUdmVjRyRFZlNGl4WHYz?=
 =?utf-8?B?MiswTGh0TFBBRWtYZzl0R3crQmZWQ2Y0ZS9JQ2pDc0Zoa1BGZVpLOWNRSitU?=
 =?utf-8?B?RlZTNTRINW1rRCtldlRkQlVVTHBzbjc4Q2NhMVFpaVVDQ1UzSFlZdG5oMlA3?=
 =?utf-8?B?MkkyQWdudXZudTFFeElpOVBjQStlcVhja1dMdElwRytRd3c1cGo0dmx0MWVQ?=
 =?utf-8?B?dUtEMEtEcGVXOElpVWNLc2orbEQyd2RRUmU3OFhJRnBzY0l6RzFxUlgzcGhU?=
 =?utf-8?B?V1I3ek1LSlJ0KzNGcTl5dHdXVENmMTVJMS9NRTRGdUR0YUN2T3Q4V1I1MWpi?=
 =?utf-8?B?L0J2bzVUSlZtL3RlNFZpbk5DV0VHRktEKzNpM09ja1d5dnQyWEJaeWw3R0RU?=
 =?utf-8?B?MWRPT012R0dvT1ZxZEU5OWJqT21HZUw1RFNvaTlKQjdxRTl1SnY1ZytLdjFO?=
 =?utf-8?B?bXhPRStsVE8yRHBFY2xzSXkveVF3M3ZnRFdrMlpmTEtzdEQ1NjhjZ21qRGNl?=
 =?utf-8?B?Szc5RXdoWCtWeFZNeXIrQ0tTZStFaUJXZFdLaEN5Y0Z3dmNSWGR0U0R5WjBT?=
 =?utf-8?B?U2t5dzNhWWFrZjZwbnBMZ09VZTF0S3BGTW5QUHA0WHNZNTljeTBUaDBzWjFv?=
 =?utf-8?B?UDlVR2JEUndaL05FVFZqclBxOXZqa3RQRmQ4bWdyMGJiV1NXVEs1Ylc2a01n?=
 =?utf-8?B?NS9BRDY4b3M4RGhsbm5BaThVU1luR1BmdldpVlFzcnF2U2FtYmNnRjRxV1c0?=
 =?utf-8?B?NERmWVdtdVR0S3lIcUlFK3NYbSsveTdpMnZmQWVsTjdiUjB1a0F4c0svQnoy?=
 =?utf-8?B?T2JNQWlVK0NSSW5Wb0dCUVpZNzJNTWNLWnpibzQvRTc3bmI3WllhcFFHVWtP?=
 =?utf-8?B?cHl6SmFtVm5maEliZDcrVFljbDl0K3N1dU9WTFhnODBiWENJS2hOTjcrbjd0?=
 =?utf-8?B?WmRQemhzQUV1YTlqNjc2akZ0N3dCNS9XTDkrYko0dHZ1Y0M3YUI4UmpqejAr?=
 =?utf-8?B?MGU3TFdTKzFHTlFyWkZ0VDJFZndqNFZFaUhIcWNqak16UlN2dmEyNEJyQWhn?=
 =?utf-8?B?RlplRFJiTmphbGdGUDYvRFNDbHJKU1NtV3ZPSkZHaWNGNlUrczBIbTFWZll6?=
 =?utf-8?B?WDgwWUI4QXhYSGtENjVwS2RnQ2NyVGlXNTIyZDJSMmI3MDFSQUpwQzhOQlg2?=
 =?utf-8?B?NkMrd01PQVhYMGFzNGlzQ2NGdHRYZWxFVW51UGVEd0NxLzJ1WGpNUnRvZ216?=
 =?utf-8?B?cENCZkNsNFRHWjh6WGdEY01YNzdtYjUwM2JwVUpyZDlnSTdCS3VUVk9yK3hX?=
 =?utf-8?B?RFFvaU9FYlpiZXZOKzRqcjFHU2JFcUMwN3hmaDRiTE5odW9XVHdBb25MenIv?=
 =?utf-8?B?cStZZzY4ZVp6MkhuQXNCOXRPVTVKY1N2eWQrV3l6eWwzQlA5WVoxYnpFMGNO?=
 =?utf-8?B?VTYzU251c0FjVThyOStvVklUV0t6aHpJS1hlNVN6UzNXeW9XSjU4aXl0a1dH?=
 =?utf-8?B?c2ltOEE3c0ZHUGJibXUvZDhlWFVNVjJhay9reXgwUHo3WkZNemRXdnlhYU1J?=
 =?utf-8?B?TjlpVlN1KzhDZC9la0ZaaHlMWGlaZUZzOWtRR01NdmhRZTJmYWpZTVRxYzd0?=
 =?utf-8?Q?r6KvRa/9eSlqJ30KhoYl3qQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 457b5335-deaf-43e3-71c8-08dd8dbc72e8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 23:11:07.9211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jsOrtGGaToMSWgQF8GjLlJaBk9j+KYM88sQ5lz9VxP4u7tvoPlO7wqaxco/2gdY8s3hTxoA6BdRbuvMKRZhQT4AjbqBkaw9llO5lrQRhE+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5061
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



On 4/29/2025 9:09 AM, Badal Nilawar wrote:
> Search for late binding firmware binaries and populate the meta data of
> firmware structures.
>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c       |   2 +
>   drivers/gpu/drm/xe/xe_late_bind_fw.c | 101 ++++++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_late_bind_fw.h |   1 +
>   3 files changed, 101 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 86a7b7065122..d83864e7189c 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -892,6 +892,8 @@ int xe_device_probe(struct xe_device *xe)
>   
>   	xe_late_bind_init(&xe->late_bind);
>   
> +	xe_late_bind_fw_init(&xe->late_bind);

Maybe call this from inside xe_late_bind_init?

> +
>   	err = xe_oa_init(xe);
>   	if (err)
>   		return err;
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> index 7981fc500a78..297238fd3d16 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -5,6 +5,7 @@
>   
>   #include <linux/component.h>
>   #include <linux/delay.h>
> +#include <linux/firmware.h>
>   
>   #include <drm/drm_managed.h>
>   #include <drm/intel/i915_component.h>
> @@ -13,13 +14,108 @@
>   
>   #include "xe_device.h"
>   #include "xe_late_bind_fw.h"
> +#include "xe_pcode.h"
> +#include "xe_pcode_api.h"
>   
> -static struct xe_device *
> -late_bind_to_xe(struct xe_late_bind *late_bind)
> +static const char * const fw_id_to_name[] = {
> +		[FAN_CONTROL_ID] = "fan_control",
> +		[VOLTAGE_REGULATOR_ID] = "voltage_regulator",
> +	};
> +
> +static const u32 fw_id_to_type[] = {
> +		[FAN_CONTROL_ID] = CSC_LATE_BINDING_TYPE_FAN_CONTROL,
> +		[VOLTAGE_REGULATOR_ID] = CSC_LATE_BINDING_TYPE_VOLTAGE_REGULATOR
> +	};
> +
> +static struct xe_device *late_bind_to_xe(struct xe_late_bind *late_bind)
>   {
>   	return container_of(late_bind, struct xe_device, late_bind);
>   }
>   
> +static int late_bind_fw_num_fans(struct xe_late_bind *late_bind)
> +{
> +	struct xe_device *xe = late_bind_to_xe(late_bind);
> +	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> +	u32 uval;
> +
> +	if (!xe_pcode_read(root_tile,
> +			   PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_NUM_FANS, 0), &uval, NULL))
> +		return uval;
> +	else
> +		return 0;
> +}
> +
> +static int late_bind_fw_init(struct xe_late_bind *late_bind, u32 id)
> +{
> +	struct xe_device *xe = late_bind_to_xe(late_bind);
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	struct xe_late_bind_fw *lb_fw;
> +	const struct firmware *fw;
> +	u32 num_fans;
> +	int ret;
> +
> +	if (!late_bind->component_added)
> +		return 0;
> +
> +	if (id >= MAX_ID)
> +		return -EINVAL;
> +
> +	lb_fw = &late_bind->late_bind_fw[id];
> +
> +	lb_fw->id = id;
> +	lb_fw->type = fw_id_to_type[id];
> +
> +	if (lb_fw->type == CSC_LATE_BINDING_TYPE_FAN_CONTROL) {
> +		num_fans = late_bind_fw_num_fans(late_bind);
> +		drm_dbg(&xe->drm, "Number of Fans: %d\n", num_fans);
> +		if (!num_fans)
> +			return 0;
> +	}
> +
> +	lb_fw->flags = CSC_LATE_BINDING_FLAGS_IS_PERSISTENT;
> +
> +	snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path), "xe/%s_8086_%04x_%04x_%04x.bin",
> +		 fw_id_to_name[id], pdev->device,
> +		 pdev->subsystem_vendor, pdev->subsystem_device);
> +
> +	drm_dbg(&xe->drm, "Request late binding firmware %s\n", lb_fw->blob_path);
> +	ret = request_firmware(&fw, lb_fw->blob_path, xe->drm.dev);

Are we expecting late binding firmwares for all possible cards to always 
be available? because if not (and therefore if this fetch can fail) we 
should change this to firmware_request_nowarn to avoid throwing errors

> +	if (ret) {
> +		drm_err(&xe->drm, "Failed to request %s\n", lb_fw->blob_path);

Same as above, if not finding the blob is a valid scenario then this 
should be a drm_dbg. Maybe even reword to make it clear it's not a 
failure but just the fact that there is no FW for the card.

> +		lb_fw->valid = false;
> +		return 0;
> +	}
> +
> +	if (fw->size > MAX_PAYLOAD_SIZE)
> +		lb_fw->payload_size = MAX_PAYLOAD_SIZE;

Is this safe? It feels weird to send a truncated firmware for something 
like voltage regulators. IMO if the firmware is too big we should throw 
and error and bail out.

> +	else
> +		lb_fw->payload_size = fw->size;
> +
> +	memcpy(lb_fw->payload, fw->data, lb_fw->payload_size);
> +	release_firmware(fw);
> +	lb_fw->valid = true;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_mei_late_bind_fw_init() - Initialize late bind firmware
> + *
> + * Return: 0 if the initialization was successful, a negative errno otherwise.
> + */
> +int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
> +{
> +	int id;
> +	int ret;
> +
> +	for (id = 0; id < MAX_ID; id++) {
> +		ret = late_bind_fw_init(late_bind, id);
> +		if (ret)
> +			return ret;
> +	}
> +	return ret;
> +}
> +
>   static int xe_late_bind_component_bind(struct device *xe_kdev,
>   				       struct device *mei_kdev, void *data)
>   {
> @@ -83,7 +179,6 @@ int xe_late_bind_init(struct xe_late_bind *late_bind)
>   	}
>   
>   	late_bind->component_added = true;
> -

stray blank line removal

Daniele

>   	/* the component must be removed before unload, so can't use drmm for cleanup */
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h b/drivers/gpu/drm/xe/xe_late_bind_fw.h
> index 21299de54b47..e88c637b15a6 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.h
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
> @@ -12,5 +12,6 @@ struct xe_late_bind;
>   
>   int xe_late_bind_init(struct xe_late_bind *late_bind);
>   void xe_late_bind_remove(struct xe_late_bind *late_bind);
> +int xe_late_bind_fw_init(struct xe_late_bind *late_bind);
>   
>   #endif

