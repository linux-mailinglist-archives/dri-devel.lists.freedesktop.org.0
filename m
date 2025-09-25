Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC05FBA07C3
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 17:55:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F40410E998;
	Thu, 25 Sep 2025 15:55:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DPK5+rv2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECBCF10E98D;
 Thu, 25 Sep 2025 15:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758815723; x=1790351723;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=E5dZNl5HwNBzZ5O9iYn5kHUsz9N1J3REBO6P6lg7n4A=;
 b=DPK5+rv2CUCDGOwv7BvpbRSQM7QRUeOzw8kTPE/GNufP9QTbgfPP1FYV
 RlHvi+C5gLU40XtV0i8v21MhIbtVJCwx5fNEZtbQmcAZllCqnnEkhNNac
 LlRCtw2Q7Yih9ztgd5T8Mj1Rt4a30zb5IeR2ZnUtgaO6B22ux50M0mawl
 HMvsawtSn14n1TW4mpDb7obaB7s5xE8mBxZ7AfJFT2+6Nyl6Q7miIqZVD
 pC+j7mCzBonIoYt1X9JiudQVDhuFmPzNB/kpdwH+9c718dPYAIuvGgvJt
 zfzzj2NCtghgzGaJACIsUi9cFg6m1oBzpZI3A/8NLcs2GLk6xelMn7JWN g==;
X-CSE-ConnectionGUID: j91uJTTdSxqqLa23j7IvIg==
X-CSE-MsgGUID: l3mjW+egQruX7wpObMgXgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="78781165"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="78781165"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 08:55:22 -0700
X-CSE-ConnectionGUID: Gcwm05PtRW6CczeapPyGyw==
X-CSE-MsgGUID: Q8f+P3f1R8O1OBPd155ncw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="181662550"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 08:55:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 08:55:21 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 25 Sep 2025 08:55:21 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.40) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 08:55:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DvuUDRWAGdxAtX+OIdkBcw5UdMANDd95U3SkA95B5BfzhwcmfIwKGzq5yuao4Xogz1dkqKTcTNMPmQz0QtZSS/yj0atK/9YoSZfBNnyMf9YDZtX7ripeSjZDCekjaS9vWTL+SojpC096pzvQymjlIEoMPZXWk0KR6/KIchUZIMOJEhc8pjnfhJRRKzmcVdmY/x5O4AkEwhG4BV7xPmrNWn3EEHUd7C6rG0N02vwq0Z8zIfTVmjzq35SPGy2qrgZeBx+txcy3aJdbD1f1IliTuX7KYcKL1OMgIvwfEl+oSkIiAaO0faG/oOh32SFyiNTC8MLY/Snjp5Z8YvY7lCTArQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RS5J4PttHNx6yiCwUPMG0QVoP3IwTS3NuFKYxvPWSmg=;
 b=kSc/imPsZf9j0cXWgHP8ZasgjefUULtecQLxxpvG7fzjesAB9uyU9Zu2eZezJuK4A99V08nY3N0mXcn8p01OzsNuW3K7yxmv5jkJNIOH4xdJb5LKLyI6LdUcbMUq31sP6zd/DQFs8VjOL6j005NQOF1N/WCqscOl1EFNjmeoAMjZXEZlRq+ipFfXhsAeQpsxdti4isSKFEvkSnk769pUY+XGYl0lVznMhkbajrurYeIy6KR+BAhBafk3q+DTp3Z8p7nd68lCakMqSz8JMna4LDiuB2aG4LEVridH35ny7tlI16ZsgXGnhUb0E5sFbNRaOboVdUacN+VSssw+IJDZRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by CO1PR11MB4802.namprd11.prod.outlook.com (2603:10b6:303:94::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 15:55:17 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%2]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 15:55:17 +0000
Message-ID: <83599443-dd90-4c89-acde-989c500e85ee@intel.com>
Date: Thu, 25 Sep 2025 08:55:15 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/i915/guc: Skip communication warning on reset in
 progress
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-gfx@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <michal.wajdeczko@intel.com>, <daniele.ceraolospurio@intel.com>
References: <20250916001618.2138901-1-zhanjun.dong@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20250916001618.2138901-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0091.namprd05.prod.outlook.com
 (2603:10b6:a03:334::6) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|CO1PR11MB4802:EE_
X-MS-Office365-Filtering-Correlation-Id: b81f5991-4057-4369-3b68-08ddfc4bec12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFhlZ1ZqS1VSdmFSN0cwL09wNVBicWFHV0NOVWlyemJ3ZWRha2NNakZodnNz?=
 =?utf-8?B?Q0tubm5EQmtWeWFIKzZNRG9IQlpEN1FVNmZpbjlLWGJBTjV0RmJOUlRRRk56?=
 =?utf-8?B?QUJJSE9BZnRYWVZGMThRWUEwSmlaU0xMZmF3N0hoSmhCUFBFK3BFU0xrVFBZ?=
 =?utf-8?B?ai9BeGxPVlBMZmQ2N2U2cG1CM2xvNXNmb1pwbVZQV3dKNWVCcWdmUDhxQkx6?=
 =?utf-8?B?ejlCVldwVWI5TVB2M2VKRStYRDZtYSs1VEJOZTR1KzRINEEzQVJVZUFXR2l1?=
 =?utf-8?B?YVYxa3VvaENLS0xkc0pIdFd6YnovUzdFc1hFNGt4N0RNSENvMFNWaDVvSFFO?=
 =?utf-8?B?UnI4WSs4akZnNjA4ajg5bk4yNTZYOFZjanlSang5UmhZV3BBa2RZUTAvdmRh?=
 =?utf-8?B?aWhSb0xyQkp0NjZLTDdhdng4OEFGeWFHQWVaM0pwbTlCRUlkSjAvREJCTWlu?=
 =?utf-8?B?YXAyU0xvWHVHcENTVWJYbERhcHhudGZUbktxWjZoOWpuZEJadmZaVFgyUnQ5?=
 =?utf-8?B?WnpVdXJoR0JrMzNwb1dnYm5FdUUrZ0R1NTlXRFpOSFR1NDIrV1dlSGIrY0Vy?=
 =?utf-8?B?ZWJVb2tGWC9zRnJ0SVdmN0l5WTZHZm5QR0JjdEtraUNkRzBSdk4zM2NadVJh?=
 =?utf-8?B?TUFpdHU4dFpCQkx5dFY1eUVHaDkweHlPK0kycnFNK01NV2xURFVqK2h1bXdj?=
 =?utf-8?B?SFlnNTJsMnRmRy96aXRacWtQWmVDQmNTWGFYbHllUkFNcXduYkhoUGhoSzlY?=
 =?utf-8?B?VmpJb1lYQ2xMQmNYMCtwOFhqVkk2cmVKVXJPUmhKOHN1bHkyWG8rYkxVNTh0?=
 =?utf-8?B?Y3FVQm1idGxwWloyMUtiLzEwTVlqWnhObU0wT3NoZTJmME80UWEzS0M0SWor?=
 =?utf-8?B?cUh3WE82ajBhOEQ3RzR6bHVFZlRKTWRNemRSZmZUR1VieHU2eGd2REdHTkll?=
 =?utf-8?B?bDUxVUliNHBmVExaeWhCbktkTGZtejlLeDNCT2s2YjVqbXRzSGtyYmJEVmpk?=
 =?utf-8?B?M0hidWZ5MnV4OXBmTjd4Z29ObmREU2UyRlFsVHoyQ3V3emhqL1FwMjhxUnZh?=
 =?utf-8?B?b002aFRGdzU4T1pLOXBWcXQ1Q1hhYS9od2FQZHZHaForbzZabUNxNkdxaG1j?=
 =?utf-8?B?c0ZQcDdzaUUzak1Qald3L1hMd1pjbEVXWU84VE5ReEUvaXIxeFNOTklaMXYy?=
 =?utf-8?B?bUUvRTVXcTFLTXVlSSs1L0lwV0RjRXF0ZGQyY0RhSXBWUXI2eE5say9wVE9O?=
 =?utf-8?B?NTdlb1Q2bDB0RFVlSDZVbU5xMUVLeHlrUE12aXE5UVlPdlhFQStiTTQzb2Z6?=
 =?utf-8?B?ZHp4TDBSZDladnVDVFBxWDV1NjlHKzR5VkIvWU9QamxEK1ludTFrVjRxNE9N?=
 =?utf-8?B?Y2pKUEtpWFllcGpNUnhJbWtxRXBOYmg2WDU0K05OOXpPWW4vdDV2UmdwNDlN?=
 =?utf-8?B?Vk11eEo1OU41aWw4ZFZZWDZQMTAyNlVWYVUva3JrZ1VaclYxSWQ0MVppTEpW?=
 =?utf-8?B?bUJxSW02M0piOWVWTVJTSWtDWTdPNU14dHJsLzRWZVhZQjZtczVwQlV1VGZ1?=
 =?utf-8?B?VDI4MnljcU4xeG5RRVdCdTRHWkU0UlRVT3diY3UwQ1dORThtRm4wMW5GNDJJ?=
 =?utf-8?B?d3NDSk82dytpTXEyZXZtRERQVDhqK0NWTWVBZE9rUzNlb3p6TEpOMGFQWUtz?=
 =?utf-8?B?bFphRmpLS254bkp5RllxUnJFS0lnTVVYTEV5NjVNV05BVHlhUlVNdTRpZTdz?=
 =?utf-8?B?UytmUkVVaHpIRG42akVhd2EzMVRNSjA5RWZrTlNxZDd3akZZTE9McUtqU2g5?=
 =?utf-8?Q?tpS1QUxD/cXQaHkEKIE/wa29iJGvTZ3ax5tUw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXA1Nm93c3R6cmRQVmhPMUpudjlJRUpIK0F6OXlnWlloaGR1TTk5cllVdHg3?=
 =?utf-8?B?SU8xcEI3M3F2bm82cUMzeVlYNGFvQko2aXJSdXJFUHVuMVcxUHRydWREdEE1?=
 =?utf-8?B?SEZBYUJZdTVUQ08vMEtpL2ZMU2VwdDhVQVVROHpjSEw2YURRckZULzg0WUEv?=
 =?utf-8?B?RmNFSGJhQ2dQK3I5WkNnS1BkN0ZsTmxEanBPN0Via01XWmx5UDUxdmhZekUx?=
 =?utf-8?B?TldBRmlMay9EQzV0NGVsVTQ2Qlc4aHVhckFQd29wTnpwSTYzcDY4bUt3dVVw?=
 =?utf-8?B?ZFRjQ0pDc20vNmNsRk1uQWNsLy96UG11dFFGT2Fvb3p0U0xEZCtmNHBITng4?=
 =?utf-8?B?QjQ4bm0vc0hvbWlmekRDSXhhRkdVZEo5THhZRHZybTJGTGMyTncxVEhxTGE4?=
 =?utf-8?B?R3BEV1p3TytTMWl2MlBMWEwzNnJ2YzFqTjUwU2ttbTV4NGpGd002Q0dCYk85?=
 =?utf-8?B?M2ZlZ1Rwdm5GWUF2U2luTFVNbzBIeG1GeVc1UHdiNCtZWkFGZjNvVzMrcUd5?=
 =?utf-8?B?V1AwSDRmM2s1QzB3SVBPeXpEOEtZUTRlYVAyNGk5RDhSc3hYUUREN1hBQ3FF?=
 =?utf-8?B?Sk9TdlZiSFJsQ25CZWYrRm5IWE5nTE90NHJjbVFERkJVZHpEbWtrQXJTbUp4?=
 =?utf-8?B?RHR3NFVla0dyeTIwTDBLelVlRnlaeEFrcEpKSmpEWExqZmJ6T0piU3o3dGY3?=
 =?utf-8?B?SE1xaFVxR2dpcXVmWGJjOXB5ZHFxT0xNWGZjQml4U1pnK1RhU01nUGIyL2Ez?=
 =?utf-8?B?enZ3UDRWcjdaMUNacmFPdUJVUzBENFJiNjFpSjJQVkFqenJvMW03cGQwdW9I?=
 =?utf-8?B?aEZBaDFwV2xkb28xdVd6ZE05dlpFV2Vjd3RCREZUaUp1a2JsYzJBRTFQTnBv?=
 =?utf-8?B?Y1lEekx1NEdWSUVwQ3kwMEFkZUtxUit5QTFFLzZnK2d2M2gzMC9JWE5VbEJ6?=
 =?utf-8?B?RWFVbEpXUmlDMEZjQlhPbVBtRmdvZ3RhelEzazJJbzdWNTlBMWlTTnRGLzV3?=
 =?utf-8?B?dHcwdTl5SmsyaEJCYXlURnM4cW9wQ2Mxd29wbUp2enNqREdZajFPUzdJa1RH?=
 =?utf-8?B?K0pvMENMZXFxSk9OVWRRZjJSZFJSdmY2WE5ER3U0WmZMN0lrMFRXbm9Kc3JK?=
 =?utf-8?B?dTZYVFNMWXlBaVpHbllXR25GcEY2NmszNU9zbVdzSlFFSjgzSWliYis1KzA2?=
 =?utf-8?B?TWxJeGhJMmt2R3BDa2JENDNrT2dyUmxrK0FuRzN0NDBpbThCYU4va053ck9t?=
 =?utf-8?B?VjNFUkpWaXVNd3RGUzgzeWl3YlNjSnN6WnJjOW1EV2ltZ0hPaG5lOFR5QWRQ?=
 =?utf-8?B?OEZic1U2WEd3Rkc1RFVWNTkvS0xpenhtQ1JZS3p1UUtVVld2SWZsaUtIU0pz?=
 =?utf-8?B?a05UYVZKamtLSnJBbDh2TU96NW8xS1RiOUJYZXdOc1RKMjlJTmZkb25Jamdl?=
 =?utf-8?B?Zkdlc0YrQm0ybWVyY0o1YTlpUTlxS3RYUWxQSW1OYTRRanQycStLQjlqT0c4?=
 =?utf-8?B?S3U5b0lvVlNLMExWVkVqcWhBVzA3OGY3NzQ2WkRHeTVaUzdBSStpUlBVRm9X?=
 =?utf-8?B?WTYrWGNRWW4ya2FoZjNuYVpQaWR3NlNmRVhrUXFpU1FtYUt3TFl5d1cxQWFS?=
 =?utf-8?B?M2VTZGROOWNPV0dpRDBwZGVZbW02UzU1ZGhGWnlOZk41dENqVG4yL2o4NERj?=
 =?utf-8?B?Y3FCYmdaNGRUT1VWbEZrb280ckRQWWpBYWxDRlNwSHdBVkpQeHV4bzVvNVFq?=
 =?utf-8?B?S3J6dzdWd2hnUk9keTR5SnQydnhqdFVEWHZ6dm42ZnUrb1JDS1VHelZ1dnFz?=
 =?utf-8?B?OERaUWd2RzErSE5tSjYveTBud3RXZHJka0kwNXU5L0M4dGh2TzNOWE1ZdWth?=
 =?utf-8?B?a0tqZU5kU3MzM3lWanp3MlRuS2RDSEVEL1FtSHlSQjZWRWhKTGwwS3JNWWJv?=
 =?utf-8?B?dUVIV2Rwa2NEeGdCRHl2WHZ4NG56SDJBazROWkRhN3VuUG9TTStLeW5odENR?=
 =?utf-8?B?NndzY1lySFFjck82MmZEUzNLR3htemNqSGRuS0Z5ZUNEUkE2elFLQW90VWJU?=
 =?utf-8?B?RExDay9xN3dNL21KTDRTYXBhcGFHNG5IUVNwWkFFUXJXNkowNUtjWTI1UWpN?=
 =?utf-8?B?REI2STRuQmFmSGtZMjN3WTRzT3B5djN1VnpJdllIWjVrQWNlT3NFWkYzY2Qw?=
 =?utf-8?B?MXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b81f5991-4057-4369-3b68-08ddfc4bec12
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 15:55:17.2590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yfWd1c57aQ3/to+zRSVA+Rcm/e50FIi8/pqI1vx8o1HphhFJPKAjCKXsnvUHAXtnWV24hlvL/YaNLv9qHft+6VqMySX11zFPkX2jHaSs1UM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4802
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


On 9/15/2025 5:16 PM, Zhanjun Dong wrote:
> GuC IRQ and tasklet handler receive just single G2H message, and let other
> messages to be received from next tasklet. During this chained tasklet
> process, if reset process started, communication will be disabled.
> Skip warning for this condition.
>
> Fixes: 65dd4ed0f4e1 ("drm/i915/guc: Don't receive all G2H messages in irq handler")
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14834
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
> History:
> v3: Add skip on interrupt disabled case
> v2: Update subject text, removed fixup
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index 3e7e5badcc2b..78308ff00d68 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -1325,9 +1325,15 @@ static int ct_receive(struct intel_guc_ct *ct)
>   
>   static void ct_try_receive_message(struct intel_guc_ct *ct)
>   {
> +	struct intel_guc *guc = ct_to_guc(ct);
>   	int ret;
>   
> -	if (GEM_WARN_ON(!ct->enabled))
> +	if (!ct->enabled) {
> +		GEM_WARN_ON(!guc_to_gt(guc)->uc.reset_in_progress);
> +		return;
> +	}
> +
> +	if (!guc->interrupts.enabled)

Is it possible there are some messages in the CT buffer even though 
interrupts are disabled?

Thanks,

Vinay.

>   		return;
>   
>   	ret = ct_receive(ct);
