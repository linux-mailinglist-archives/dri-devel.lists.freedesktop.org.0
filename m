Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1068CAEA88E
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 23:06:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8561F10E2EB;
	Thu, 26 Jun 2025 21:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NiHH9Xf1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E65D510E0E7;
 Thu, 26 Jun 2025 21:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750971977; x=1782507977;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KuzNfHvxjYNrEUp5L6G2QXtFsm9Xfhg5R+dk1CdU1MQ=;
 b=NiHH9Xf1UkZvPJuI78WLDRC/BAc9akfDHMdOEcirGclI8qMUm3ira5w9
 BsmJ8IF/Z5Q1odCqJqZVdBcQPJdosDUefgCQTGTYwTJEbS611kjnDOq0W
 v1Tsd5iCdTwkxAWvDcUCTOj6lghUV7l9WxLnP2r64TZDB7OxbPx0LQi89
 VL8KJmk63bUrXUAFp+WuwD4mEpypj4cQ614FsheFZ+Ipff+Q5kjC7m5v6
 CUoMFHp8tW65/+wncwtPxEF/fNhtAcRXz14/J3kCtJeELJk5ZoO4Y4Fzv
 /H1M+NIoin/FolRlAFLf9wRUhyvWpSYjskwSl3+mTFuwDMHG+4vF1S8/9 Q==;
X-CSE-ConnectionGUID: 4K1/oA/oQZyw50VBseFU4g==
X-CSE-MsgGUID: H2NCeIB8SpS9LLhWqBIt1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53361127"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="53361127"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 14:06:16 -0700
X-CSE-ConnectionGUID: s8pM54K0QUi5qdgODhYQoQ==
X-CSE-MsgGUID: OnnS0f6eTbOyoKYq1zuIXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="157004257"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 14:06:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 14:06:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 14:06:15 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.68) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 14:06:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I6Y+7+8uM8unE8bngsyG01KCEVFv0dFPN2EMJSiCI01kPmodFYcJZZpwPF+mTMLoXSBZ3wViPCSAhKfvXXhXg9DMeV+m3smwLrY3hOpwFVvRt4j/f5eIcJgeYRx7dk4BA4KBc4UNw7u6na9Pl7F+gRCPJsl/1hIuMDglJnDb/9Z4pnx9hS3F5xjReSTNBJDOlG5Z35Pw+cUTXtnctZJKNZfXtD6ZvKRaENZOK73vdw4WhU9LT0KDcTHQC0sMF0KdAl5uKmhqcFmzXmO5vpoKOGPRILjb92n3PVSEF3MVIOCVNud2auaGQ+hDNwXXLkE/1DFL7LQOFW4pw8jSuVmvog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=15OWYK4HH9AkbHmKrwM7FqKI+P2Cp68VdCGw3T2ax9E=;
 b=EEn0ejysYgbWqJRGr7noSwVMtISXCwmw37p94nVe5Cu+0CFe9akTYPQP5W7QLQLkmHQ9Ph30ab23a7iLbvzKQoRnHubBUA+A07NexzVtES1ac5psoawnVDdu62dEXjinWI01E4qhFu/HLuTB7s73ZPW4o/FZTAfc2DLaw+zZubt3biFwkySZj7x2aBzF40sX3heRo0wdAhHdfcFtrRuNBMtrZCZzFEDEJX9hVO+4G00ncMwVq49q/zMyC35dlA8tPbgxFILPOjCk5kTKgLYQnyEYmbk9ZJCKDZ6MJakeUqUf3PlsoVRzvGUAbaE5y1GyuBRSLHAz/Q09oS7nE2FcOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH0PR11MB7561.namprd11.prod.outlook.com (2603:10b6:510:282::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Thu, 26 Jun
 2025 21:06:12 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.8857.025; Thu, 26 Jun 2025
 21:06:12 +0000
Message-ID: <f1bfbdf6-8f66-477d-92e3-50612b4c4b71@intel.com>
Date: Thu, 26 Jun 2025 14:06:10 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/10] drm/xe/xe_late_bind_fw: Initialize late binding
 firmware
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>
References: <20250625170015.33912-1-badal.nilawar@intel.com>
 <20250625170015.33912-5-badal.nilawar@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250625170015.33912-5-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0217.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::12) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH0PR11MB7561:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e33c154-ccba-4d91-7993-08ddb4f547ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eHYyakNEVzF3M3JOcFFGNXJrR2xDbzZaSUNNbDBYRmJRVHRrdmdDMldZZnVF?=
 =?utf-8?B?Ti9YUUxiRVo1SXBrSXk5OElxcVByM2Z0WjErZWtqeGwybHlzTEc1T0l2TXBK?=
 =?utf-8?B?WTRxZ2J6QnowbnJkamVmMlgzZUdMcGtTY0k0aUptWjFEUjhQSGUybGRRZTB6?=
 =?utf-8?B?MW5RQUk4SEx5WnQ4SVEyd2lHdlltbFowMlBTWk5aWGIwQjBMcUZlU2E4bmJn?=
 =?utf-8?B?bXhMZWZ2bk9VbzJhNlpSQ2EwYWFpcVV6Q3RnRlZRcG5DY3hRblFZSjhCVHhH?=
 =?utf-8?B?WnUraHBIQTFWeXNsWjdzY3o1QmZPcmdqNjVkOTh4TjBnTXVxb0l2dmpyTFho?=
 =?utf-8?B?S3Q2TE4xa0dWbFB3cW1GTlVDenk0Q1JHZFl5dVY5SjIrcklxRVgvd1hQRmhK?=
 =?utf-8?B?R0FZT0FHYkxQL2MzZ2I5eGtMSUUxOEZnK2xZcFlIQzc5NktuN2hCdWxndUZz?=
 =?utf-8?B?Q1dFeEhPTW53bVZTS1U5RktXOGZHcDBVRlBicXlvWDR1dk1DOHpFRFJxekk4?=
 =?utf-8?B?NkpWNDAvKzJwMXFLeG9YcVVSTHkzT0haMitLb0dkMHJjdi9VOSsycVlRcDNv?=
 =?utf-8?B?YlAxYTUwMFBKN1djd0l4QVJOWkdtZlZ2RVptb2hKMDVnNHVnM3pqQjFOZTBG?=
 =?utf-8?B?NmZza1RQclQyZWlSZkhrOHVBbGt0MGRERGxlWnZzTW5ueStuMHAyZmJiNUVp?=
 =?utf-8?B?SUFnWWd0c1JxM0ZxMzhEMVpwLzJ0TWVoWDIvbFFKMEhvN0FNdWdKaEJaSlJx?=
 =?utf-8?B?UVRaakhJbXhVeTdOeHVrbGc2N3pteVdUYytRNVJtaTZuZVN2enIraFpVeERW?=
 =?utf-8?B?aGJxem1sK00yK3E4dGdBZ2ZvaVFuYnR2b1RDRm1aMG1OS2NTRllzOTlhMU9i?=
 =?utf-8?B?UUIyb2FyZXdkSXkzN0krcy9TYU1yK3I0cDJWSkhkMEZZMkVPRE9OREVienVi?=
 =?utf-8?B?TzJRczByUXNTQVZhNGFBdnFQK2d6Szl3c1dYS3VvYktBbGpsTFFDdEFGTnNW?=
 =?utf-8?B?L3ozZllPL2cyYU1DYVAvK2ZmMjlKSU9aMElRVEZUVk1lWHBsMGFrd1A5R1NO?=
 =?utf-8?B?SXk0Wk1wNDgrbzJteko4RHMxM09UM2tValE5bDdJalpiNWsyNFFWTXRaV1J1?=
 =?utf-8?B?aGYrMmlRZmFrR09KK0NadE54MElxMGt1NVZtdnNobXNjUkk2MExaQzBVYWVB?=
 =?utf-8?B?eGJoR2pMbERNZE9YTWRvR29JYWhPMDhMaDFWRmxpbkNLV0l1S2grSGlYRUxl?=
 =?utf-8?B?R09OQXY0MUpLREJkUEtBcFBmT2tFdFJ2SXZhNGIxbEY5TmNWZDk1dFMyeDMx?=
 =?utf-8?B?R3ZDLzdpWWlFNHlQY1hudG45OWMyYUQ4MjAvS083cWNBOFZDamNBUXE3Uk42?=
 =?utf-8?B?aEp3S1Uya3E2eE5taGJMMEtBM21JQWZQcFhoQW5NWDhjWFhpUy9kLzJrSHVB?=
 =?utf-8?B?TnNRWDNjRFFRcTdxZ2hSUzV0UUZyS0JIc1JOVDRiMnFodEZORGlIQ0R1Q1A4?=
 =?utf-8?B?RlEvS2FkMDlSVXFMWitYQSt1UHFxd042N3gweW4yZEp3WWkvQzdoZjVGTHlo?=
 =?utf-8?B?amJoMkxXTEV4d0tBbVlUeDVHemZrallLdXc0L3RVaTNQaHlnemNFQXRGRkc0?=
 =?utf-8?B?TVQ1L0dRL0htQVZEQXpxZzJwSnljTUlxWTJVSlhJcHM3M0hhZDc2TGtITWFS?=
 =?utf-8?B?RzJ6b1QzQkw3dmViRFdPcEJveEZ5OHNnNkhJM25QbjBwQzRWTlpsSmpqRGNU?=
 =?utf-8?B?Z0p6cDJjRGVnUnpZbWl3aTBKLzF3bWQySVYrOHE3S3dDdUEzZFdCa2F3TUVy?=
 =?utf-8?B?dndJZDJPcmppdDVTbTUvWFhtN3Y2R0N4VzVUZXpDM1NESXFsVnNTR2syTFdu?=
 =?utf-8?B?aC9kS0FhMEY2NllJRE1oL1I4ZFpBOFEyRjRSdFlsV2RTbnEzMVNOeEFrQnIv?=
 =?utf-8?Q?cRe8fQjbfxY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0ZZK0Y0VjJGUkVNdUROWU01SnJreWs2UDRNS0lEcUY1b3I4RUNrcnFQWHg0?=
 =?utf-8?B?OTU5Q1JEUWlLeGF6QnB6Y3IwUXUva2FCREJMWTJjODlrS0hqa05PeGY0dHJk?=
 =?utf-8?B?aHVsQ25DNm5JbzQ1V1UrVFloQWNwY1A0RTA4N2ZQVUVaN0dXVnJQSnBEZVZW?=
 =?utf-8?B?VmZvcEF4MXNRMnh1UVIxeXBDUVRhWkYwOUlULzNKZEgxdEhZMWZ1NG90QU1n?=
 =?utf-8?B?eVVPVVBPZ0tteXIxbUFZdjQ5YURtSmZxOVRKaVhHNlc4eVFQVVl5ekN2V1JK?=
 =?utf-8?B?NXl5UXBJSzQ3bGprODRWaDhXSXRaVUZsT0piRk9DdWlGbVhkbWt3QVNYSUM0?=
 =?utf-8?B?ZlM2T2UzN213a2pDK09OUWgzV25kdUtDai9FU3Y5dURWMFZyTTNxUncxZWEz?=
 =?utf-8?B?UGtwYnhzT3ZwRDNON0xKZHRIZ2xaVVc5ZFRtVEV0QVRkSlpDMU1weEZ0R2hK?=
 =?utf-8?B?U1BOalRNZTJYY2RzQkFTblVJSG5JLzVjVVhXbXdnTXRVVlV6S2hIMldyMlZE?=
 =?utf-8?B?U1VOem0yVEdBV21BRXBjZCt6STRLNmJwMUtWMUJGaW9QK2dQOHhXTFE3ZE1U?=
 =?utf-8?B?QUZQSUNIblhsYjNZUUU3SFJqTkVxNWRMVG5LVmNyVVJsa1ZFdkxFM1ZINldv?=
 =?utf-8?B?c1pVeFRFWFlSWURYYmYvOUF0VWFFamRvM25nbGJiMjVQU05MNzg3bDZXek81?=
 =?utf-8?B?dEpBd1RzM3M1VDJwTW5iK1BxMUhsQlJtMm1mYXZGbUFLZ3ovMmIyODhrN1Nt?=
 =?utf-8?B?NjBkTTdjMUNITnRnNGpIL01oaTlWZFYycmRPYUtDczFCS09nWjhJZ0k4TTZO?=
 =?utf-8?B?R3pITlZwQ0hOb3hKNDNnWVVmcE9yY0NyRFB4M1h0dnRoRlBlMlR4RlVzSW9M?=
 =?utf-8?B?cWFEZDFyZkVVSXJzTVRqclk3RU5TdG56N01ocmpRS280QXJQZGR5UmxPZnl5?=
 =?utf-8?B?OTBUNzN5SWN5S1d2TEhjVkJsQzlGVGJNeG15TVNaWDVsZDhjVDMzS2QrOWo4?=
 =?utf-8?B?cDB1QlZOZHYybFhqZU5uNUZSbHB1N1Z2MkNBdEZEamhlYlI1TVNZQTh6MXIx?=
 =?utf-8?B?RFNFQU15SHRSbnMwVzJ6cEFaRUkzVDE2cW10TGtWaWJXMmYyc1BTYjc1TERW?=
 =?utf-8?B?dUlML3NZSTRFM3ZkL2JMVENDOWVadFV3Njg0eDVhNXUvL05ESmVVL3JIS2oy?=
 =?utf-8?B?dDh4cForYjVkdnVLNlk0Z3dGSVpNc3BxMFI2Yy9DRk9keFVYb2xkRDdRWG05?=
 =?utf-8?B?eDQ5ZFVkb3p2ZjlWYnpZNU5zSXBsS01tWktoWGJUUzlIWG5CWTUwdmdvazY0?=
 =?utf-8?B?OXpZdHBTbGdDWDhMR1lBeW5oalVFWjZncWc5WWhOUUtTUDJDbzBrNm9WODJR?=
 =?utf-8?B?dTJCeS9pcS8zYmdLUGZOZk8rUmpKaExIZkhHK1k3d1VtMlNPbEd3T090cFJC?=
 =?utf-8?B?R2RLYmFQeUR5djRwaHlZU2pSN01TM0cydXZqZUVhYWdXYTlBb25YQXc0QXFo?=
 =?utf-8?B?cjdpc214Z3AvWDVHUERhdGZDREx6cGdoa1dEYnh4WHhoRDNtR1UxaVNFMlhr?=
 =?utf-8?B?VHV3MjQyckM0bVlJczlUSHNHR2o2SWR2ZUNxTy9URm9OWU01cGZmaldpTWNF?=
 =?utf-8?B?Z3k5NFdTY25GdnNhMWUvTkJuRGhwSnFralRBWHNCT2w4SklwbXQvM3RnZzBU?=
 =?utf-8?B?aWxvc0w2VkY2OXU5UTdnZlJVdG02RUQvZFYzV254cXRMM08xVnMwaitnZi9m?=
 =?utf-8?B?MjZzaGVzNDlkUU1UaVRBeU15VHM4dk9mTG5US2Vna1JxUmdqdGd1bi9qdGFX?=
 =?utf-8?B?MkVPREVRdUk1TTNpQ3pPRERySFN6YVBNejA5aXFmQ0E0YVpkM2VyUTIxM09W?=
 =?utf-8?B?SmV0d0Vtc1NINXVaR1RsUmozdDdWQS8xL0FENU5qTktHZWJxRmlBdmlpVEtJ?=
 =?utf-8?B?RGtjQ0JJYTdEcEZ4NXZyUVRrVU42S1VPMW9UVUpncHE5SWR0RUwxNmxJMGkz?=
 =?utf-8?B?aWZsSnUwdnlpUzJURDJBb0dvc3QzTDVtdnBNSzEzWFltSGhvcU81Q25TM0x6?=
 =?utf-8?B?OWRkWmhCWTBhaldxblNzYmVnajhDbEFncS9qSXBmS2U1L2pNa3YzNU9pMll6?=
 =?utf-8?B?UC9XRUFORG9OUHp3RVM3bkIwazVkZnNnTCt3cDF5OGR6KytWMTd1N0NkMlZq?=
 =?utf-8?Q?Z0Yz7XXQ9r+P/w+DDh6QyCc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e33c154-ccba-4d91-7993-08ddb4f547ff
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 21:06:12.5760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Imo3Qlh/uWS+aKQeHA64yc4qTbJxEJyftC5Ix61oOfa3BxzF3rYUVPqMR7Bzu/ma81l3XVlU+9mpwfiFW2eZPtXg8jvn1NlpoJL0y3+SQQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7561
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



On 6/25/2025 10:00 AM, Badal Nilawar wrote:
> Search for late binding firmware binaries and populate the meta data of
> firmware structures.
>
> v2 (Daniele):
>   - drm_err if firmware size is more than max pay load size
>   - s/request_firmware/firmware_request_nowarn/ as firmware will
>     not be available for all possible cards
> v3 (Daniele):
>   - init firmware from within xe_late_bind_init, propagate error
>   - switch late_bind_fw to array to handle multiple firmware types
> v4 (Daniele):
>   - Alloc payload dynamically, fix nits
>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_late_bind_fw.c       | 103 ++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_late_bind_fw_types.h |  32 +++++++
>   2 files changed, 134 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> index eaf12cfec848..32d1436e7191 100644
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
> @@ -13,6 +14,16 @@
>   
>   #include "xe_device.h"
>   #include "xe_late_bind_fw.h"
> +#include "xe_pcode.h"
> +#include "xe_pcode_api.h"
> +
> +static const u32 fw_id_to_type[] = {
> +		[XE_LB_FW_FAN_CONTROL] = CSC_LATE_BINDING_TYPE_FAN_CONTROL,
> +	};
> +
> +static const char * const fw_id_to_name[] = {
> +		[XE_LB_FW_FAN_CONTROL] = "fan_control",
> +	};
>   
>   static struct xe_device *
>   late_bind_to_xe(struct xe_late_bind *late_bind)
> @@ -20,6 +31,92 @@ late_bind_to_xe(struct xe_late_bind *late_bind)
>   	return container_of(late_bind, struct xe_device, late_bind);
>   }
>   
> +static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind)
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
> +static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
> +{
> +	struct xe_device *xe = late_bind_to_xe(late_bind);
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	struct xe_late_bind_fw *lb_fw;
> +	const struct firmware *fw;
> +	u32 num_fans;
> +	int ret;
> +
> +	if (fw_id >= XE_LB_FW_MAX_ID)
> +		return -EINVAL;
> +
> +	lb_fw = &late_bind->late_bind_fw[fw_id];
> +
> +	lb_fw->valid = false;
> +	lb_fw->id = fw_id;
> +	lb_fw->type = fw_id_to_type[lb_fw->id];
> +	lb_fw->flags &= ~CSC_LATE_BINDING_FLAGS_IS_PERSISTENT;
> +
> +	if (lb_fw->type == CSC_LATE_BINDING_TYPE_FAN_CONTROL) {
> +		num_fans = xe_late_bind_fw_num_fans(late_bind);
> +		drm_dbg(&xe->drm, "Number of Fans: %d\n", num_fans);
> +		if (!num_fans)
> +			return 0;
> +	}
> +
> +	snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path), "xe/%s_8086_%04x_%04x_%04x.bin",
> +		 fw_id_to_name[lb_fw->id], pdev->device,
> +		 pdev->subsystem_vendor, pdev->subsystem_device);
> +
> +	drm_dbg(&xe->drm, "Request late binding firmware %s\n", lb_fw->blob_path);
> +	ret = firmware_request_nowarn(&fw, lb_fw->blob_path, xe->drm.dev);
> +	if (ret) {
> +		drm_dbg(&xe->drm, "%s late binding fw not available for current device",
> +			fw_id_to_name[lb_fw->id]);
> +		return 0;
> +	}
> +
> +	if (fw->size > MAX_PAYLOAD_SIZE) {
> +		drm_err(&xe->drm, "Firmware %s size %zu is larger than max pay load size %u\n",
> +			lb_fw->blob_path, fw->size, MAX_PAYLOAD_SIZE);
> +		release_firmware(fw);
> +		return -ENODATA;
> +	}
> +
> +	lb_fw->payload = drmm_kzalloc(&xe->drm, lb_fw->payload_size, GFP_KERNEL);

here you're using lb_fw->payload_size before assigning it.

> +	if (!lb_fw->payload) {
> +		release_firmware(fw);
> +		return -ENOMEM;
> +	}
> +
> +	lb_fw->payload_size = fw->size;
> +
> +	memcpy(lb_fw->payload, fw->data, lb_fw->payload_size);
> +	release_firmware(fw);
> +	lb_fw->valid = true;

You can now use lb_fw->payload to check if the FW is valid, no need for 
a separate variable. not a blocker.

> +
> +	return 0;
> +}
> +
> +static int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
> +{
> +	int ret;
> +	int fw_id;
> +
> +	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
> +		ret = __xe_late_bind_fw_init(late_bind, fw_id);
> +		if (ret)
> +			return ret;
> +	}
> +	return 0;
> +}
> +
>   static int xe_late_bind_component_bind(struct device *xe_kdev,
>   				       struct device *mei_kdev, void *data)
>   {
> @@ -86,5 +183,9 @@ int xe_late_bind_init(struct xe_late_bind *late_bind)
>   		return err;
>   	}
>   
> -	return devm_add_action_or_reset(xe->drm.dev, xe_late_bind_remove, late_bind);
> +	err = devm_add_action_or_reset(xe->drm.dev, xe_late_bind_remove, late_bind);
> +	if (err)
> +		return err;
> +
> +	return xe_late_bind_fw_init(late_bind);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> index 1156ef94f0d5..93abf4c51789 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> @@ -10,6 +10,36 @@
>   #include <linux/mutex.h>
>   #include <linux/types.h>
>   
> +#define MAX_PAYLOAD_SIZE SZ_4K
> +
> +/**
> + * xe_late_bind_fw_id - enum to determine late binding fw index
> + */
> +enum xe_late_bind_fw_id {
> +	XE_LB_FW_FAN_CONTROL = 0,
> +	XE_LB_FW_MAX_ID
> +};
> +
> +/**
> + * struct xe_late_bind_fw
> + */
> +struct xe_late_bind_fw {
> +	/** @late_bind_fw.valid: to check if fw is valid */
> +	bool valid;
> +	/** @late_bind_fw.id: firmware index */
> +	u32 id;
> +	/** @late_bind_fw.blob_path: firmware binary path */
> +	char blob_path[PATH_MAX];
> +	/** @late_bind_fw.type: firmware type */
> +	u32  type;
> +	/** @late_bind_fw.flags: firmware flags */
> +	u32  flags;
> +	/** @late_bind_fw.payload: to store the late binding blob */
> +	u8  *payload;

Why a u8 pointer and not a void one?

Daniele

> +	/** @late_bind_fw.payload_size: late binding blob payload_size */
> +	size_t payload_size;
> +};
> +
>   /**
>    * struct xe_late_bind_component - Late Binding services component
>    * @mei_dev: device that provide Late Binding service.
> @@ -32,6 +62,8 @@ struct xe_late_bind {
>   	struct xe_late_bind_component component;
>   	/** @late_bind.mutex: protects the component binding and usage */
>   	struct mutex mutex;
> +	/** @late_bind.late_bind_fw: late binding firmware array */
> +	struct xe_late_bind_fw late_bind_fw[XE_LB_FW_MAX_ID];
>   };
>   
>   #endif

