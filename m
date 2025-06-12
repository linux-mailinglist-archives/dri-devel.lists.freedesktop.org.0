Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AB5AD71C0
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 15:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB9D10E06B;
	Thu, 12 Jun 2025 13:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eYJPCmoV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A966310E06B;
 Thu, 12 Jun 2025 13:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749734764; x=1781270764;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=0zBWI8x8biRjpgqMpowrwouRX7HhLXRZIsyv1DDbZD8=;
 b=eYJPCmoVYqoGWWJJ8ujo2eEJSnEEbLYmt32GS5tHqFWP7sm0U3sP7dEh
 F+w7TDY3VqvzKvYnDNW0h3z0PQM8yfhh4P5Xxrwxum1GLaREekJMjdm+3
 3pmSDJPO13faXix7nxKlWaEzONpQuSN1u+x/MElBaNy09OQi7/5YZJcMq
 pyUe/0LoBp3E4FIyeTuxG6GZ8NayhLT7el4bbP5tnAnDerSyeP5hK156S
 KigB/xAWYRFYi2AgDsUNA4OxOjy/gJBxfAUA83KlOXA33YqZE3zvIUPU3
 /PBc1LFYEEfEyB8mX2NYVeKYRhEU7XuIru681mFcTb6T7I6ytXw5HfET5 Q==;
X-CSE-ConnectionGUID: gqb3X80OTzGAAiLUvjUMFQ==
X-CSE-MsgGUID: BBHYsBiKSgm5gORwRmMi0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51023578"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="51023578"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 06:26:02 -0700
X-CSE-ConnectionGUID: LfNf2cLISuSclF5zSstC0A==
X-CSE-MsgGUID: 4m/L8koZTb2em8TivtmJYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="147390199"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 06:26:01 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 06:26:00 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 06:26:00 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.61) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 06:25:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q0KtjMoomsqZeQdLA/RDec7QSpY76SzTWbSvOzvVSwdHyJBpzqRaupryYF0KXlpc29GNUVWoQRKjtRHRCIKovWsLylZgdV0s9RjX8P63q3WZkh2HCmNmgKkbagNsRdatAui7DVj3lSottjR1PPyPq0xLGeLq7Db0c4tX8A+8lh9A6lsN9k4JVNzVM3gyQQc/prmONIppK58XtwdU5UeDpDC0d5OedlE2oWwUoBpGe1/7OpkbM/Hb4rR3x4DvbeT3qe1Fyzt0mXoVGu0fBh0AA+9OsnxLatw7ZCOD+4iO+pAzZrXMRjWLYTWnCK3B52Jsda6Cg1wv06by5Vyb8+lCvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Advl0gUldDZ+PdTSR9mOaIxQFhApWtdfDJf9oSyvT/0=;
 b=ELrjCABdza7gXFUpz5mJKK/X/f6LrgDkABXfMk84SvzUOulwzhgkPIyIFNW/uG4rzuqhdxPgSG4/y5Bngdbcc0q5lIQTaYziWoHW2ljTjrCVQuCu46ATTP16dQczhXQlgwqBHEoJeI2zzxhC5phKOtJuM39ogsms0tFQWKp81VDlhDmd6M6lte/hYclQ1kedWU6oMGeoLEKxGQRCiOuDSnzlUQyYgdmTHZCHgoKFvlmPjAO8AQihqlH3cPcNwIj3TIMccLUvLlwOJ/uYftjOTeuGzxpIQ+z0s09n1o59Eq4WdmK8nYKfa/QTeTH1MD3zKeVBTebRNXu9aQDn9M7iKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CY8PR11MB7170.namprd11.prod.outlook.com (2603:10b6:930:91::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Thu, 12 Jun
 2025 13:25:56 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.8813.024; Thu, 12 Jun 2025
 13:25:55 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250612124617.626958-1-jani.nikula@intel.com>
References: <20250612124617.626958-1-jani.nikula@intel.com>
Subject: Re: [PATCH] drm/i915/panel: make panel funcs static
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <jani.nikula@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
Date: Thu, 12 Jun 2025 10:25:49 -0300
Message-ID: <174973474918.14553.5194064664827391011@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR04CA0255.namprd04.prod.outlook.com
 (2603:10b6:303:88::20) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CY8PR11MB7170:EE_
X-MS-Office365-Filtering-Correlation-Id: 88091013-9f8f-4230-1c8d-08dda9b4a938
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|16122699012;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWFzbW5ZSmEyQlVYQlF4eFgzMlhVR1h5cmdUVy90TEs0S2R6TGNwS2JyMk45?=
 =?utf-8?B?aVY4NHh5dlhxV3NKYWNZM0tOdHh0M25SZnJVNnZaZmJxUm8xZzFsTDB2aHI1?=
 =?utf-8?B?TGRGVjlxVVdnRkxNM1RZb3FsY2prTkgzN3hwTFZZU2t0SHA1WDZwVE5XZ0k1?=
 =?utf-8?B?V1Vhbm1nODJnYUhJb2tZMktxd29uSTlsSWNESDRoOE5KelpwVHIzVDV4cXQz?=
 =?utf-8?B?MGphRm5XRG50dVVnb1dKa0ZkUFVabkdPWE9lTFYyd3RnRnExOHJDbWl2ZTBF?=
 =?utf-8?B?K1Zib2I0ZmFpR0g2VzdyMEdYWHNHS1JmN2lwRjRsemRlU0UrZ1dWRWZ4RkJH?=
 =?utf-8?B?TnZPN0FORHZZdzBrY1VjVzNxV2FNTXFONHBwdGlnakF1UWVJRzVZUVRVZ1Mv?=
 =?utf-8?B?UVdWY1JHSTczSG9ENmlFcEJHSlRRMmFsWm96SzA0bFhnLzhycHhEZWpmRktB?=
 =?utf-8?B?T2o3UnFvTjY3YlRHNk1TanRLRy91OE15WHdDcG0yQUQyV2pONTVGaG9Qbkhy?=
 =?utf-8?B?TzlRY0ZJWGYySlR6ZkZNK0dXQUZnMGxubThUNjZ3dVVOQmRPU0xzOGsyM05N?=
 =?utf-8?B?aTZYM2kwU1M2czRFQWdxS2FJUUg3bk03a0pzT1pEYjM2TGhidXB2MmdhKzVT?=
 =?utf-8?B?ZFgxVCtzdEIzMlJJSlBuZGZvZWIxQXFJdFRXeUlGR0FvK1NCdFpZeTZYVnZ4?=
 =?utf-8?B?TklNaS9WQjgxVm01TGhZYktPb0x5QXJHRmFJQ2hoUWpzaXBXbDlmL2dKdFpB?=
 =?utf-8?B?T0d4MC9OMkJpaWthQ3h2dGxVZThUNVM2U2t1UTFrTmYvZ29NRUVFbmhuZ2w5?=
 =?utf-8?B?UGtITHdVTUZoalRlWUR2NUhIbWlIQWxkSHB3QTkrdEhzMmpLRDdTMjdFUFdh?=
 =?utf-8?B?eldMVFdrQU1EVmNPQXlpL1pFa1dFQXA0TGJ3OVRieXVmYjZxdU9UekVPYWdD?=
 =?utf-8?B?Q1g5bkxuZ200MDc2dnBhNWZFVVUwLzEzNDR0TVVZNnRtTENUTGJaUVhyYlMv?=
 =?utf-8?B?aHBreHRVNkZET2djdmtFLzFudDZVbjdvT1VuQUFtNFRpUyt2R09kOFM5MEtt?=
 =?utf-8?B?c1pCaW9uM2xKZ2QzZ0RLbEFKT0E1M1RuTzBGNTdxZnNLY1BVMnFVdWtSUHN5?=
 =?utf-8?B?ZW5KRnN5bHU0ZWFxTUIrT2J1YSs3S0YxcS9Rek5vbXhWTncyODVYRGFlUW5m?=
 =?utf-8?B?TmlnUkVnendsRkNnZjNickN5NmN2ZW9oWkRhcS9NUmxSeCs4enp1d2pqTHQ2?=
 =?utf-8?B?SU1jM3c2ckM1aURQaWlkWUJ0emY1SHJLVXp2ajltSWxkVjY1TFl2RzhzQXY2?=
 =?utf-8?B?T1N1N1FGTEN1S2VFOUxkN2NpdTdtV3hDT3hHbTNxQmJjM3A0dGtUN000bkZz?=
 =?utf-8?B?WDl3Mk5mUlozRXpHaUU5ZFpqbkhyVUhPYm84RWt4RG5NbFB2emtlNWp1aHFz?=
 =?utf-8?B?K0pRY2w3aE5lRHREb2NLQTVobFRLblltWndHR3lzMWpzblZTdGN2aDljeTV1?=
 =?utf-8?B?Tkk5Yy9hVWliQ1E3YTE5SDJycUoyVGUvUWFWek9iUEJzVG1nNkIzQWdSWGRQ?=
 =?utf-8?B?QzQ4OVlVRFJUTm5VL1NlTjB3cHhTNkZra0w1U0JDWUNBU0U2R2xmYXo2L0Q3?=
 =?utf-8?B?TVZrenk0QkEwRHMrZVU0QW1ueUIxOXB0OUY4eWZSYnNZWjd1dDdsY1YxZWZU?=
 =?utf-8?B?RmZoaFZlcnVzaytGakZJOUtqcnF2OEdKZE4yVVdiNUtNdlNLUzBkQjlobFQ3?=
 =?utf-8?B?MzI0MjRROXhDR0I0eDJLZnoxVEpnVEN2M2l6ejIxYXpiTUZHa1dMelNFaWNY?=
 =?utf-8?B?TlIxTHhqZEhLQlh4NnVJTUpvUnFnQUVGVGdVaHVkbTdOSE5WOTk4blU0T2d3?=
 =?utf-8?B?aW9JRnVWYk0yMlo1eGlzWmd0ZHIwRjZOZzNpYlM4ZXlOUnFENW1nK1I0ZFhI?=
 =?utf-8?B?cDlqSi9EWWp3THFmY3Vhd05tTEhUazdvdHppNENGdVhuWjdnSGcxSHVZSmhw?=
 =?utf-8?B?czE3Yk50UjdnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(16122699012); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTBPbFV2OUpFU0VaQzRadGluOHcydWRyOWNRdVJsaXBPODFVOFNKMjFrNFVZ?=
 =?utf-8?B?b0lpaEhNV01lZ3Nqb2xRWHBpRlFJZU9WbC9qdHlha1IzRTBVU0ZzZEZGcmNj?=
 =?utf-8?B?aUc3dTNrV1M5cnJnenhrR2kwcVdreHpWYnI0eDBPZTlVMVNPZnByYk5sSkZ2?=
 =?utf-8?B?cGthQzV4VmwyVlhIWm85dzRScmx6bnJTSDkyWHZ3WEpqZ25Jc3hVc3J3Z2pX?=
 =?utf-8?B?a09qd2FyTVVEbkU5Znl4NmxvMnluMVlCRFB2cUoxb0Y0TmFBQ1pXZDErcWVs?=
 =?utf-8?B?cW1kY2NMOGxGelRKcXorTTkwYWRqZTl5L0VBdGVwUG9SS1J2aHUvdFU5V1Vt?=
 =?utf-8?B?RTEwMTE0RmtTSVFsa2lwZXBzbFBNRzBTYWhkTVZwU2VXTTF6N1lrVU5Lay93?=
 =?utf-8?B?Q2xNOEhmWGwwU3FWSENCNVF2SVpWNU9mdE81UDFKc3Fqb2pzOXpvTVZHclJH?=
 =?utf-8?B?KzZoWW91cS9LWHgzZGhHUm9mRkRUU25JNGVXalVtc0FKZzJabkZDbU5vQ0Iv?=
 =?utf-8?B?d2JVTkgrckpFVG5uM0QxUGNUQWxLR05NeGNjalFFM3J4V3J0V1czK2xNWktp?=
 =?utf-8?B?L3RLbjN4a1dpMTBSZGlEOFhaR1VpQkNRU1o5ams1YXFQSmRoYUVObXpzc3cv?=
 =?utf-8?B?OVo2WXVrOXVoSDZnR0wrbktUOWhzRTJGRkdnZnBBQzB5WXQ1ckUzVlgvTnpz?=
 =?utf-8?B?WjRwRjUweVd6MU9CRW83WDVLT1BrWmE4MVRwS3lmNjE4SmlobGt0NFlEREtL?=
 =?utf-8?B?a0ZoMkRua3BLVSt0bCt5UXg3QWVlRXBPL1dqNy9qQVR4MnJ6RGR6a2xhSU5w?=
 =?utf-8?B?dHZOaWhCbC8xcDgxdHZOclBrWHpzV0UrbmR5dlNJYVZDV1FtNDEwVWREN2RF?=
 =?utf-8?B?dkxLWkhxOGRiNnFIKzFZMFY0Y0lVc2JWWGY5c2NKeG5kQjRUVnJuWWt5WGNV?=
 =?utf-8?B?b1hkTDYzdkVoeEpMVXpIZW5ISUVMd3U4enRyeThURXJVVkpBS1ZGNWdaUXYv?=
 =?utf-8?B?WDJHZThzKzhrMzhneXlCTWFKQ1NMcmVvUkhzRU9oY093YUQ4eDVvYyt4MTBp?=
 =?utf-8?B?R0NBQklDajUxVE9iWlo5ekdoLzlCSnBxdS9nb0UvT3RNbFJMU251OGxuNEtN?=
 =?utf-8?B?bjNtcWFlS1U1LzFPRThsNkdmSUppWkhIanh6YUVNQitQbEpTczE0M0RtbklT?=
 =?utf-8?B?ZzBzdWs0dDNtM3BuUUhRR09nMHAzS1FrTEpPYlJNeldPOXZRemVMc0ZKQ1Y2?=
 =?utf-8?B?YUtpM081MzJKRHlFT1lHQ1VMZXZpVS9BYTE4OHlxVzRZMGdBajZxODlkbHVj?=
 =?utf-8?B?NHJ1WVpLeFpQdU1iTmZuNEs3U0IrRVF4d3dTeEd5dGVoUVZBK3Z3YmNoMDBw?=
 =?utf-8?B?UHRxYll6Ulc5NkRLTzF4Ym1CNFEyOU5SYUgyMm5WUmUwdXJ6QmNrNCtSMFAv?=
 =?utf-8?B?MVN0QjhQM2srdkdSbGFMY2k1TE5tVlFZYkpQekZHZG9nRmtpV1oxQjUzUlZ0?=
 =?utf-8?B?cDBPbDJLcjRHb0xqT2RUTlFYTlhST0dmNks4TWduekVrWXNaVVFoZ0ZTTmhK?=
 =?utf-8?B?T1lBbFo3eENUOU44TjM4K3FJU3hBbHE3UUdoSUtpU1BGQmpsbmdQWUxIM2dE?=
 =?utf-8?B?Y2pPTmFTdmVRQ2xRYnNDR2ZWWnYyUTBUSm5mcnM1WVdicUxUU29admtkeHFo?=
 =?utf-8?B?Sk9LT2d2K0xGVmhKQnJmQmxlRHpmcmNsNXNFbGZMUlNvc1ZCMW5OZGMvVFJD?=
 =?utf-8?B?ZmdRWWpJT0RySVZTTHduSWN6RERmemdSMktqWEo4UmUvZnhFS2JURDRHY1lr?=
 =?utf-8?B?TGFOb3VuUVNubVp2dGdvL0FnUlNvdFlQdEFNTnhuY0RLUTdkUGl5ZGJ3bTZD?=
 =?utf-8?B?SnNnemZmblpXUDlMenpRd2JZa3B3d1YzRmdicTdtTy9Ja0loL3BqWXgzNEtm?=
 =?utf-8?B?VEp0QjZ3ekIrWm1WeXlwWHIzblp4WUNzekxjVWJnUkxPSGVxd05EdlIyR1U4?=
 =?utf-8?B?bElqUjdtbG9lKzlic1I0dDB0OStaTVhQaXdFSm1rMTNia1QrWVZEOTZvUzdZ?=
 =?utf-8?B?SjEwdkEzL3dXcE9MV2phSnA1VUUwQTVyQzJ4YmJuV1ZyN3RJYXllZXRJQnlu?=
 =?utf-8?B?dE9oNmlMYTFlRkZJRVNQNVZoV2VzZzR3ejd1MzBSWVNvWmJDL0p5SUhFVCtV?=
 =?utf-8?B?dmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88091013-9f8f-4230-1c8d-08dda9b4a938
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 13:25:55.6193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J027czULfSt9E7ImGzy8hNCZgjFo7nkLVkizZCbw26YZFURbCrVLHOcQlXQYIyYwDPGOVZTKwVrjNXj15IvmHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7170
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

Quoting Jani Nikula (2025-06-12 09:46:17-03:00)
>The drm panel funcs should be static, fix it.
>
>Fixes: 3fdd5bfbd638 ("drm/i915/panel: register drm_panel and call prepare/=
unprepare for ICL+ DSI")
>Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/i915/display/intel_panel.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/=
i915/display/intel_panel.c
>index f956919dc648..e28ad72c4f2b 100644
>--- a/drivers/gpu/drm/i915/display/intel_panel.c
>+++ b/drivers/gpu/drm/i915/display/intel_panel.c
>@@ -502,7 +502,7 @@ static void intel_panel_sync_state(struct intel_connec=
tor *connector)
>         drm_modeset_unlock(&display->drm->mode_config.connection_mutex);
> }
>=20
>-const struct drm_panel_funcs dummy_panel_funcs =3D {
>+static const struct drm_panel_funcs dummy_panel_funcs =3D {
> };
>=20
> int intel_panel_register(struct intel_connector *connector)
>--=20
>2.39.5
>
