Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97848A4B0BA
	for <lists+dri-devel@lfdr.de>; Sun,  2 Mar 2025 09:48:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E53B010E0FB;
	Sun,  2 Mar 2025 08:48:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WVGtbztB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0128F10E0F2;
 Sun,  2 Mar 2025 08:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740905301; x=1772441301;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=c0KogNKTjQCN2M+xnTcF+G6/XIdz24wgkombiyI6Jho=;
 b=WVGtbztBWOm9HRO3vJUNO1UZVwFjd+l+OIJ8klwLc4qkCmvZCKMczeVz
 mautfgT6Twff5ngM51vIgEJDHnJCO06l9m1c4EklxJfyuLBShIC4MbQdx
 7tojezpo3OsFxg2kQjfLt9Hw8Zk+/6RCUyy2Q6lbN/hll1A2GlQDKwzK7
 BokcrDWzs5ujPrl5I5xrgCsNV/0RNicBCCDfvV+PcdB/NpKUFnLaZ2JX/
 pyf2Nup2Gch+SpgsNcwsOBn0tVe4uJfI4TaHrP/iozD4eqAd5zy0B2WBw
 S1TS6z+Iwu+pDDhK8DiSPSSmQb51orzx2pD+8mk95kcuMQFYC1/Q0wZFG Q==;
X-CSE-ConnectionGUID: JSl7RGPVQvCOnzXQkoZHww==
X-CSE-MsgGUID: DxzUEpjkTBOh2/Bv3TBW3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="41034091"
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; d="scan'208";a="41034091"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2025 00:48:20 -0800
X-CSE-ConnectionGUID: 5ldjm6cNR3+wm1B8AnZOyg==
X-CSE-MsgGUID: DiTI6RWSTEaZdvixMEXVww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117585279"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2025 00:48:21 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 2 Mar 2025 00:48:19 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 2 Mar 2025 00:48:19 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 2 Mar 2025 00:47:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MQENJzhLNJ2e4I4rnMSVe+1wKYJSa/8eCSYGi4nxq842E07zIVOFYGZBprYrC4moznYLHXK6owpFBIfX4QWZlRH3LRkJtcTdjHR0+1JgsiZAw4OdyqfUq0810+Fm58S+cY1fg+0abZ/9N/tYgEp0fCv3KiQ5ScDKEyAHr3Vx2Efod7wIWbDf8mrHLdrCekOkf37LNL6R0Henwh7uj4DwuPWyWpbjXnuC+IAs2lRG5IDMezngKzRexrU/6xJ7JtT3uYrI6fuGPej46EdmLiPG4F+Ai5av4mhA+7kcjoM7nGpkuD7sNnQuO9uU0gA8KzeMq7TmyCPcuLqofDesRRW5YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c0KogNKTjQCN2M+xnTcF+G6/XIdz24wgkombiyI6Jho=;
 b=xPyU0XRVfrN9w7EQqHvV62eloAyIgPRJkxQ7m+c+ZfLoBL+hizqSPrDQxmXV/HyV6Q6I8BbNxqSujAnODUtiyoWsMF4btiTfU06XImdtvLpQdCUsMYCbHREq6iiEyDLZwEWS0bTIowNELWC8HNsVQSps3rtGhAOCMTbG89SzBP0fmI800HnXjEm5WJGceMkMu3WVdFYlQW2jg0G3EaDRnQtTiohqyiywiIhMuDVWuV7dLKsZUKRyY5TVQMfGcFQTYExqhhdMz6Lb8UJgwyIw4cf8XFADirqOB3netTUBLJpfOX90Ara+d4FJgC0uX1Fwaz7+U85hZiLLuUxKwUNc3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by CH3PR11MB7763.namprd11.prod.outlook.com (2603:10b6:610:145::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.26; Sun, 2 Mar
 2025 08:47:32 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8%4]) with mapi id 15.20.8489.025; Sun, 2 Mar 2025
 08:47:32 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Saarinen, Jani" <jani.saarinen@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Nikula,
 Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v10 2/9] drm/damage-helper: add const qualifier in
 drm_atomic_helper_damage_merged()
Thread-Topic: [PATCH v10 2/9] drm/damage-helper: add const qualifier in
 drm_atomic_helper_damage_merged()
Thread-Index: AQHbicSItAMW3spChkWRyIg1NfGmOLNfi+qA
Date: Sun, 2 Mar 2025 08:47:32 +0000
Message-ID: <06cd451eaf2c8a2d3567d272b3ca75228ccc9988.camel@intel.com>
References: <20250228093802.27091-1-vinod.govindapillai@intel.com>
 <20250228093802.27091-3-vinod.govindapillai@intel.com>
In-Reply-To: <20250228093802.27091-3-vinod.govindapillai@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|CH3PR11MB7763:EE_
x-ms-office365-filtering-correlation-id: 33f1a8f7-6cb3-48e3-0a6e-08dd5966df16
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?M3lLWjZ3RWVWS2xYMXBFR1pLRVNHUWg2cE9lcStObXhQUUVzOThQWDQzajR6?=
 =?utf-8?B?ZVpvTXR1VGVFU3Q2d2c0d0VCejZBRm41MnlVa0RkYXJQY0JGQXJmMFJoR3pR?=
 =?utf-8?B?T09MSFJndFd1TkpDTFB2eXFqSFhsSmlncVVnQWNHbjlwMDhXU0pyUTd5YnlB?=
 =?utf-8?B?alRpa3lYVHpNa0x0RW1qaXhFUDVodWg5VFByckVad05odFBZVUFBdzkzRTFw?=
 =?utf-8?B?Nm5yakdrRjdTS3liNnRrQ0VyQjI3VGViUCs1TzdtdjJKUUttZzRQL3ljVEtV?=
 =?utf-8?B?NDgrdjZybDQ1WFBLWGxJRWlUWXZVaWdYT3RMMGRFOTRWeHdlTlRjSTUzN2d5?=
 =?utf-8?B?bVBGa3d2WHByT0ZhVDM3R3NwTFBpWTBoa0pNTTQwN3d3U2gwV2Nmd0d5WUsr?=
 =?utf-8?B?bmxvMEJjK2VWcFdycjNUejc0MG5oQTBwb0pnNkJlanpNOVBvNzJwOWlIM04z?=
 =?utf-8?B?aVR1ODY4Q2lUNjJjT3R4Y3FxYk9kU0plakxIMzRHZURWdEFTdUk0THFhNUV5?=
 =?utf-8?B?SUdiMlZ3L0oyWEh3L1RWQm11akpSOTFNNVU4ODV3am8rd0YxWUw1ckNlbmlw?=
 =?utf-8?B?ZTBFL1ZPTnQ5ZXZWbFVOQ3RoSzlNNlVBVk1mTFdlN0pZdTFZMURUbzcrUlB6?=
 =?utf-8?B?UDBXaUMxTlk3Q3dIWENrVnk1bTA2cElGZUoyaG5VTjJlTWVlNHdhUzFMZW53?=
 =?utf-8?B?RjZFNkExUmhaOG1iTXU5cnd2ZW1RN3FkeVdwR2hnOUpwbzFYcG9LYkdwcUFP?=
 =?utf-8?B?Ty9hRDhTMFNjaWFxbEhlclpQSzlYOVAxYzl5bzJrdHJlVUpYdDJXb29PRFZk?=
 =?utf-8?B?YnFNQlN0V25TRHFCQWoyMjgra2xJeFF2ODA5ODdsZ3ptVStXM1UyS2lPbFZP?=
 =?utf-8?B?cXJMeXJXampzSFU0dzNmRVIrM2l4MGdXdkw0eS9kSXNWOUowTUhYVTlyOHBq?=
 =?utf-8?B?blFxS0J2aWhhRXBFTXNXQ2xzY0pGZUZYTW91eVhaZDFaN3YvU2ZxR3cwMC9u?=
 =?utf-8?B?MnZiWG41dXpGVzRsOHlPRmw0ZU5GdGN2YVp4a2FEaVl1M0kyc3REZU5MK2hi?=
 =?utf-8?B?NVptSW85UFd0ZnVhOGxKS3lKN1MySHJRRGlWNEhtdVZKU2lrTWZlelJNdGNK?=
 =?utf-8?B?djJ2WmlPRXBRQ0JrUlRwYVh6SGRPTmxSdUFXU2U1VE9DVm5rZ0pkbU02U04v?=
 =?utf-8?B?SkRpSEpPaStkVHVJMFpHV0d5Mk42ZE9MeHJFaWVvV3pyMzZ1d2FXZ3QvOFVM?=
 =?utf-8?B?SHpmK0hVeUR0TDFTbGlsb3ozRmtaSmE5R2tYQlQzb3grem13eXRIS0JNYzEx?=
 =?utf-8?B?VEc5d0VPMXdNeE4yUXE2WnM2TVJGOUNRYm5ZTDJuUkZoblVDZTBmUGhJYlRX?=
 =?utf-8?B?WDFVdm8xN0p3NDdSQWQwYjA3bnhZUUlDVFhjWW00QmZ3bXZzb1hzQjkxajdB?=
 =?utf-8?B?OUxuZ0ltcXBkQmVDY2w4c3NxZXVSMVhJdklvdXk3ZUQzU2oxampZYkdsR0RF?=
 =?utf-8?B?NkdzMnk0Z3ZWZFZ6cmJvbGYvR3N4emFjcUZRRjdLdkpFczF3M2E2L05Jck5r?=
 =?utf-8?B?RjM3OWVldDRjWjN2QTFWNmZiRDJFMWFWUWdnZkVUcFlVWU1OTzlJdG9oNzdJ?=
 =?utf-8?B?U3hMWkNtcFl0Z1grbTdhUXpXdEdWSlJvb3ZQZXppNko2eitMRHdZV0pGc1ho?=
 =?utf-8?B?R3RrMDU4WTVLbG1EMWxlVGtqMndzckdPQ1NVd0xBa003cis0S1BWdEoyREJP?=
 =?utf-8?B?cnVYN2RGd3VRbEFlczRHUHZSd3orZFZmeUN2VFlIYXFBdHgzNENxdDlOd0VN?=
 =?utf-8?B?bW5KcHpGVlZlRnNCTThtckdPNldZT2lFUm1tQTJFeTlQWi9wTmRhaXBBNE5M?=
 =?utf-8?B?NnVYUzZoSUR4ZlpScnA1WktYL1Zxd2ZZdlZNcUJMTXFKSkE5bHhFQXA5WE9t?=
 =?utf-8?Q?dgFWyHCzjd8MPGqF05fkVCrUmYmZ5Tmu?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VGg3dzRuNjZkWGlEbVJ6aGFSb0t3cStldUg2SjVTcG56RUt2S2NpNTVGcGV3?=
 =?utf-8?B?aFN0SWhuTDN3WDh4dHllZlpoUTR2QjNJVDlVcGNQS08yeTIrK1pFQXhXaEcv?=
 =?utf-8?B?dTdGaTlCRW9XY0gvbzFVUHVxMWoraUtEbU9nOUNCRHBTQmhsamx5SWE2NThj?=
 =?utf-8?B?VEpmM3Z4dy9xclpUUXZWRFYyZGZHVkRZNlZraVJUdHp0QStoTDdxTTE4ejZO?=
 =?utf-8?B?SmNmY3h5NzcvaXdYR0NSREFSTEMzQkFvRU9OOUp6T3lYOUhtVVMwMm1Gd1Jr?=
 =?utf-8?B?S1VnWHp0bStXZjJaTzVvb3NjOFF0ZldlcjlGYmtOeWd6ai96SWVtbVZheDg5?=
 =?utf-8?B?TWJ3SUJ5VEs4cUNJYlBpNUE5a3ZvNnRhUG8vKzlzRm0yT21QK0ZnNEZlRmIy?=
 =?utf-8?B?eVhsMFhMSjQvbU9VWUZlTThGYmErNmFpdHoxREQrUHJQRDJNc1JLdVhpcnNT?=
 =?utf-8?B?QUVTNXFFNUtoZHhxUlJQYnorZk5LalVIclhqTlM2RERROHE4NWxBVmVuR2RB?=
 =?utf-8?B?TGZ2Q05CZlJyMUJGeVNWZmdMbWMvRzEveW9YTXhvT2NjSlFubG03S1FBYTBD?=
 =?utf-8?B?OUFZeEUvMFg2T1B2M01CQXZBVFdjVG9hSjVXR0NtUEtrQUZMS290QkpycnFC?=
 =?utf-8?B?b0dkL0hraEQrcWJId2hZTDJvQURTMEV3VUMzS1VZVWc2cDZjbkFObHNoNk4x?=
 =?utf-8?B?bGtuTmNlLzY0dGh1bEhYeW1NenZGQTliV3JjWm51bnd4SjlBYW0vSDdGa1Ru?=
 =?utf-8?B?dnBwbFNydDY5d2U1clczUjBUa284TlFGMUFaMGxxR0JlK3VIY3drVSs5RlBh?=
 =?utf-8?B?Y2h5NjZJNG9NRWFwcEdzbExjVmd0c2dTbkNxeHUwY3R3Uzlnc2dlRDVJOUMw?=
 =?utf-8?B?NFdKdjNzUXhQR3F0NE5IWE10bkMyVkQ5Rm55TTNPVEJ6bWQ2amJic05IWW5E?=
 =?utf-8?B?WTBUUUtqaWRRdisrTDhJV21SSHQrYTNzL3lrYm5TQlh2SzFxNkN1UjIxZ2Zo?=
 =?utf-8?B?bGRhdFJjY3I5Z2RGT09mVmk2dDhWWUc4TzFudEI1eHlBbXRpaDBxbXA2aGI4?=
 =?utf-8?B?TzZmWkgxbUxNTkh6c2dMa2t6YXV2emlmTnNXL0dZTzNVWHg5RFRQeloyY3Fu?=
 =?utf-8?B?VENDcDZnZXkyYjlna3hZNmVyR0NMMngvMEtRQTRONXNIdXFZdFZjQWNaYTRH?=
 =?utf-8?B?eXRZdm9YcmpqdFQzdW5JT2hFdnByTGFtK0JERm9TSm8vem5TTk4xcWxDd1lX?=
 =?utf-8?B?OExsR0h4QnpEeHhpRWkvbDhybGg2cHpYU093cjF2cXpkbnVpZFJFRVd6T2NT?=
 =?utf-8?B?ZTZyN2tjTjZjQTRidHFXRlB1Y3FWdmpqSTNkM3ZXWEZRdnFnUFZ5a25pS0gz?=
 =?utf-8?B?NDdjdTk5aVduUGhzelU1RkZNa3I0LzZIKzVscThOV0pydC8zaHZjZHFwS0Ra?=
 =?utf-8?B?TzZGVWpmZVRYY1QvYjlhYnpJY2NxL1E2MTY5OHN4SHNzaThCQyttUHlNTFp5?=
 =?utf-8?B?dDlTZEdlRG8yVEpNVFBUdEJmS3hiV1NCVVJKNVVEMURidFduSkprbUVvUVVu?=
 =?utf-8?B?aTh2WjloZnVhQlN3RzVGYW9Hd0dpT21IR2pKdGFBMlpzQ2FTZWxTNWk0K3Fx?=
 =?utf-8?B?b1NJNE1zOHdwV0Q3UjFxREdrTzhaeFBXK3p3UHVBVmsrR0l5UzZxdmxyeEVq?=
 =?utf-8?B?Y3RYbzZyM21PRDBTSWY1dHh3RUVNUW9ENWY0VnNFN1NRdXI3MThjdkwzNEMw?=
 =?utf-8?B?N1JzYUc5eUdyS1RuZVNONHE3c21kQmpKSFNxY3ZBWGQrUGUxSStDNDdlY3Jr?=
 =?utf-8?B?VlpjNGpvYnhTUXVaTGFyaGowZHRlc082L2thZU1xK0tVUSttUUtsZ2VOZ0Fp?=
 =?utf-8?B?WUNqcXZKekh1RG4wYUVienhnY2VDSzZaMys2blhnb1hSTGtYZkdkelVGampW?=
 =?utf-8?B?SFJaTXViQ0E4Q1ZBQjkva0lkWERNUndSL0RJSE9KVXN6cWJCQ1VYaStnRGZH?=
 =?utf-8?B?RTNvSU5XUENqN2hjQ2VTT1J6ZmYxc0hIQkdQcFlhdUNNazJ6QW1lbzhCb2NB?=
 =?utf-8?B?cTNGaFpPOU1jQUZlaGdaekJuYTlUYjZEQ0QzV2t0dThWbFFISzdUTGE1NUVI?=
 =?utf-8?B?Q09mNGtvMmcvTGJ4MVEzbjYxRkRtQ3RTemZIeWNnczl5V2NTVlBybldTVDJE?=
 =?utf-8?Q?CtlPTz8zckXj6ZsdoHxkB9c=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <155376EBFE14DD48BF0B6E56E1BE7C9E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33f1a8f7-6cb3-48e3-0a6e-08dd5966df16
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2025 08:47:32.0387 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JAewxQAGj44KCgJ35iSLUUgFjxEcmjAS+iEmqCSnm6Mgjn30GrPzKOlQ77g8FMATFpEIc1Uw6adVH3KevRpWLJZ+rYcO5BhIGHeiEbbcBB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7763
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

SGVsbG8gZHJtIG1haW50YWluZXJzLA0KDQpDb3VsZCB5b3UgcGxlYXNlIEFjayB0aGlzIHBhdGNo
IHRvIGdldCB0aGlzIG1lcmdlZCB0aHJvdWdoIGRybS1pbnRlbC1uZXh0Li4NCg0KVGhhbmtzDQpW
aW5vZA0KDQpPbiBGcmksIDIwMjUtMDItMjggYXQgMTE6MzcgKzAyMDAsIFZpbm9kIEdvdmluZGFw
aWxsYWkgd3JvdGU6DQo+IEFkZCBhIGNvbnN0IHF1YWxpZmllciBmb3IgdGhlICJzdGF0ZSIgcGFy
YW1ldGVyIGFzIHdlbGwgYXMgd2UgY291bGQNCj4gdXNlIHRoaXMgaGVscGVyIHRvIGdldCB0aGUg
Y29tYmluZWQgZGFtYWdlIGluIGNhc2VzIG9mIGNvbnN0DQo+IGRybV9wbGFuZV9zdGF0ZSBhcyB3
ZWxsLiBOZWVkZWQgbWFpbmx5IGZvciB4ZSBkcml2ZXIgYmlnIGpvaW5lciBjYXNlcw0KPiB3aGVy
ZSB3ZSBuZWVkIHRvIHRyYWNrIHRoZSBkYW1hZ2UgZnJvbSBpbW11dGFibGUgcGxhbmUgc3RhdGUu
DQo+IA0KPiBSZXZpZXdlZC1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4
LmludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogVmlub2QgR292aW5kYXBpbGxhaSA8dmlub2Qu
Z292aW5kYXBpbGxhaUBpbnRlbC5jb20+DQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9kcm1f
ZGFtYWdlX2hlbHBlci5jIHwgMiArLQ0KPiDCoGluY2x1ZGUvZHJtL2RybV9kYW1hZ2VfaGVscGVy
LmjCoMKgwqDCoCB8IDIgKy0NCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rh
bWFnZV9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGFtYWdlX2hlbHBlci5jDQo+IGlu
ZGV4IGFmYjAyYWFlNzA3Yi4uNDRhNWEzNjgwNmUzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2RhbWFnZV9oZWxwZXIuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rh
bWFnZV9oZWxwZXIuYw0KPiBAQCAtMzA4LDcgKzMwOCw3IEBAIEVYUE9SVF9TWU1CT0woZHJtX2F0
b21pY19oZWxwZXJfZGFtYWdlX2l0ZXJfbmV4dCk7DQo+IMKgICogVHJ1ZSBpZiB0aGVyZSBpcyB2
YWxpZCBwbGFuZSBkYW1hZ2Ugb3RoZXJ3aXNlIGZhbHNlLg0KPiDCoCAqLw0KPiDCoGJvb2wgZHJt
X2F0b21pY19oZWxwZXJfZGFtYWdlX21lcmdlZChjb25zdCBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRl
ICpvbGRfc3RhdGUsDQo+IC0gwqDCoMKgwqAgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqc3RhdGUs
DQo+ICsgwqDCoMKgwqAgY29uc3Qgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqc3RhdGUsDQo+IMKg
IMKgwqDCoMKgIHN0cnVjdCBkcm1fcmVjdCAqcmVjdCkNCj4gwqB7DQo+IMKgIHN0cnVjdCBkcm1f
YXRvbWljX2hlbHBlcl9kYW1hZ2VfaXRlciBpdGVyOw0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9k
cm0vZHJtX2RhbWFnZV9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9kYW1hZ2VfaGVscGVyLmgN
Cj4gaW5kZXggZWZmZGE0MmNjZTMxLi5hNThjYmNkMTEyNzYgMTAwNjQ0DQo+IC0tLSBhL2luY2x1
ZGUvZHJtL2RybV9kYW1hZ2VfaGVscGVyLmgNCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2RhbWFn
ZV9oZWxwZXIuaA0KPiBAQCAtNzgsNyArNzgsNyBAQCBib29sDQo+IMKgZHJtX2F0b21pY19oZWxw
ZXJfZGFtYWdlX2l0ZXJfbmV4dChzdHJ1Y3QgZHJtX2F0b21pY19oZWxwZXJfZGFtYWdlX2l0ZXIg
Kml0ZXIsDQo+IMKgIMKgwqAgc3RydWN0IGRybV9yZWN0ICpyZWN0KTsNCj4gwqBib29sIGRybV9h
dG9taWNfaGVscGVyX2RhbWFnZV9tZXJnZWQoY29uc3Qgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAq
b2xkX3N0YXRlLA0KPiAtIMKgwqDCoMKgIHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKnN0YXRlLA0K
PiArIMKgwqDCoMKgIGNvbnN0IHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKnN0YXRlLA0KPiDCoCDC
oMKgwqDCoCBzdHJ1Y3QgZHJtX3JlY3QgKnJlY3QpOw0KPiDCoA0KPiDCoCNlbmRpZg0KDQo=
