Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AE9ADDF10
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 00:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D673410E112;
	Tue, 17 Jun 2025 22:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RABOswIk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D495910E112
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 22:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750200071; x=1781736071;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pY7D76TW/uYU66A0XjR3IvTI8f2T2ZY3ZZv7YqlThO8=;
 b=RABOswIkxwxeoOO3693hToXPOT+RukHNGJUcwYM9QODcPo11MTK0liWb
 wCWvS+953C78PG+WQQC+BTp9S6fhwDaU+4smBY90lHziFPsTL7mdncENm
 Mqr+vVqCfY0lOVS74cn9+at+DNJJKtV8r6U03IjBoC76WNf2Sa9Bj9IB4
 KOPvCyKzvssd7EIU/SWNXu+Z9/CF5B6IK+f8Wr1m6kGflORYnfSW7yXUL
 IpJG401PULEnIOFeKW1hVFw16SkFiu9EH5+/pBrfNwKjDBg0iFiix0Ud8
 CDbqz5XX79k7xoqP9OklQG7/J0B3e1q9Fl5PZaFkgO+GTPM/82VaBDvJO Q==;
X-CSE-ConnectionGUID: uTR2T1n/R+ujZ4K14UENvQ==
X-CSE-MsgGUID: fZcDi+baQ/WP7kDgtHwlCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52311964"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; d="scan'208";a="52311964"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 15:41:11 -0700
X-CSE-ConnectionGUID: ZAsk0QLdS2CAAPHKjiuq+Q==
X-CSE-MsgGUID: Zi4p8H9US16fB7U23/D8EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; d="scan'208";a="154363392"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 15:41:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 15:41:05 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 15:41:05 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.44)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 15:41:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vR6lTVsBZ4a8A//TkQkhF8uC2HaISG3wCA1aSuC0LZeWRmOMCLc5blrgkhx1IGr8gIV8ljlnt0IOzCjsOuN28yIH2auIiIqSzAl7fGqAZ5oj60VyK6hQ5kzCD6TlYwIHxNJ9vYawIfZPv+ECQmnbhP0Gt7b4WdTsbPaAtg/frF6V7vNDl1XdTZgiqT3lJgPS/Jncudv9YaeZNWmf9BnYadLSjLMjk0rEBvijFrvT/1ojBb/wkIEeYhl/KCCYwOvyB8Rdx0uCVwRoS/vejV3urmqbCihnibQZiN7nWBhAFkHvVIP54HhrkWnmseE1nFrm7W2nBo/ni42uqBKL4QP6ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pY7D76TW/uYU66A0XjR3IvTI8f2T2ZY3ZZv7YqlThO8=;
 b=PCA9WPPeqFWxvbQp4I4SbOBT4ZB+LjIvZHazvvjWIoS270NCT42e0vsmrpQW5+797ieJOzNiDP276j7sRWt6MzJDqojWndYM+YwNg7jeRzcleBaqhje6WwyiqsnDn+R8DUVTQLM2IMZV+N0v6rEGGxvDy2DtMT6VsoO7ytYxtEeUG1TBu39ezj6VPnKM6s8OBNbb5nClA02ZhZXwCjLV/2JCP7lsZVzEQ5SIspxaLIlgNYbXoCjnDrwOE4iQu66pOZzFqRM8m+63w1K/YviUHyjZzx5IrFkkcfCxWI1p0IHDhiOybc0uoA5b2eIIJQeHWyuXNmt9RWuVPTaAavT3dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6879.namprd11.prod.outlook.com (2603:10b6:510:229::22)
 by SJ0PR11MB5167.namprd11.prod.outlook.com (2603:10b6:a03:2d9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 22:41:02 +0000
Received: from PH8PR11MB6879.namprd11.prod.outlook.com
 ([fe80::bd3d:59f2:9d29:346]) by PH8PR11MB6879.namprd11.prod.outlook.com
 ([fe80::bd3d:59f2:9d29:346%5]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 22:41:01 +0000
From: "Kim, Dongwon" <dongwon.kim@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: RE: [RFC PATCH v2 0/2] Virtio-GPU suspend and resume
Thread-Topic: [RFC PATCH v2 0/2] Virtio-GPU suspend and resume
Thread-Index: AQHb3XtpnfRporDVBUu1lRYCf++0mbQH88JQ
Date: Tue, 17 Jun 2025 22:41:01 +0000
Message-ID: <PH8PR11MB68791BB9A9F720E820C57D14FA73A@PH8PR11MB6879.namprd11.prod.outlook.com>
References: <20250523220015.994716-1-dongwon.kim@intel.com>
 <23e2560e-276f-42d3-a525-0c0405c8641c@collabora.com>
In-Reply-To: <23e2560e-276f-42d3-a525-0c0405c8641c@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6879:EE_|SJ0PR11MB5167:EE_
x-ms-office365-filtering-correlation-id: fae0ae7d-da24-4ac0-722e-08ddadf0097d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OWV2cGt5S2FKVmR1MzB3bGNxVlR4aEJUeGh6dnFEQXlBa1BMaGJROVJQam92?=
 =?utf-8?B?d1BBTzk4L3FuTmltam96ZkRFc0Y0dkdpbm9JM0FXU1hSbnlvSWk3aDZ5NC90?=
 =?utf-8?B?R2plaUpha2F0aHNOUGxnYXNXR2FZVlN1OWM3WElxMEtFd2t0bmF5aXBHUEVu?=
 =?utf-8?B?cjMyYVdQTlMvc001a2dhcTY5MDAyOVM2ZFpEUXJCR0YzK1ArRjY4SXk1L1Rw?=
 =?utf-8?B?ckk0SkZkQXE1MFcyQTN3ZHJlemNlTUROTVdkc0dualJvWjB4RnNZTjJwWVFi?=
 =?utf-8?B?L3JWTU5UaDdtU2t0U1QyQ3p2OVpENnc2QWt0bnpuSFFGTzB0RHRndUJoYXJ2?=
 =?utf-8?B?Zis0bysxNStvcEZIdDBUWTFqOEVhMktEbXExcFY2QkhPVVdEUTVjYWRseUZr?=
 =?utf-8?B?ZlFCTUd5Qm9yQTdKaU00YndLS0QwT0tvUWZPQzVVbVgzR3hJR2krK04zTWs1?=
 =?utf-8?B?YkoyUjN0VGpSV0hXVDR6TnM3bXpmWi9vcEl2VXgwM3M5MXkvMURDMHBSdXNO?=
 =?utf-8?B?L2hGQzZ4UVBocEJvNmVja1MzMkxsdkpmdWN6ZzZNZUJJdS9YeHIvTWN1WDh2?=
 =?utf-8?B?MGdmSkhodDRXdFppTGxJMVVuaFJ2QWdlcUFPK0Y1MEM0amRkZXdGcFBGMjRk?=
 =?utf-8?B?Nk01TW96Q0VPM0ZyeXNpVHBWZFc3WEpJbGd0eHl4ZFZPMmt2dVdxV2NXd081?=
 =?utf-8?B?M21OTGxOeFA0RnZUY200ZTNUN0toZ0JoWnFGOERDak0yeXUxQVVlL3drUGZ6?=
 =?utf-8?B?elRSSVM5UHAxWHhJVXc0QUdMdEU4ZCszdmhoMTJHSnl0L0ZLOGpQRTc0VE4z?=
 =?utf-8?B?ZUdYQmFnZTluenRXWUhZR2s1OUpoSWh2UXBDN1hDdTRTV1lhUnYyQXc0THV2?=
 =?utf-8?B?UWlzeUx3WmF6UFBKV0pBaWpxdTVIbzdqV2tUdnBkZ2IyUHVTeHNjeGhZaHN3?=
 =?utf-8?B?K0NqRThLMVRPTDF5cElKLzErOWlUcWF1NTdXc1BrZUFNeHp6bFBZTjVKT3lG?=
 =?utf-8?B?cDdYM0ZxUE8wWFBYR214YmNSS3JncjZBSE9RdXlDYVUxZzFtWlRuMFZ5Y0xG?=
 =?utf-8?B?TUdpdGdoN3VKWmIvbXNHMjNEQjlxSG1Rdno5Z3RiQUNzQ0k2UTBjc0NIenFP?=
 =?utf-8?B?clR6V2hhNVU5UmxBc3gxSS9vV3FXWlYwUW5McldmRXJoSkU2Wk53TkR4QTVL?=
 =?utf-8?B?UzUvVWZibGVFTXpROUFiMjB0ZkFvU3VFWVVxbXExeDlGOTNZcWF6b2JWK1Y3?=
 =?utf-8?B?bkJMaUZubVJHNFJaUHFiWm9Pb1dvRGJSeW9SWk1uN01mWHZCUlNJRERTSldZ?=
 =?utf-8?B?S1Q2bXF5QTBjY3hPcFRJZnk4RWh4bElRTXd1QWMrU2FpaWkzSnpSZGJmRmt4?=
 =?utf-8?B?MlFVZENpQkwyamkyLzJGN05saHVUVmRMd1hXbFRienFWYjFCMjdkTmpCUlBP?=
 =?utf-8?B?azJvT2YyaG9mLys2Y2U4NCtKQTQvRXB4WmFZRUpQcXBHalVNcnoraFVSbkxv?=
 =?utf-8?B?Mm1kWXdwcVNzRGpuVFU1NEltVXp0L1Q0VS9wWHEvWlMyV2daTkYrV0dEcVBt?=
 =?utf-8?B?NW8zY3F4QlIvZU80WHhXcklubGVxNGQ3MUVnUTY1Zll4RmlQQWI0c21uWkZE?=
 =?utf-8?B?KzZ0QWNkMzRLemJPYkswcVF0TUUwSlpzS08ydTJMRUZnNlhrWkZ3cmd1MHVh?=
 =?utf-8?B?anNIWTZtVzRQMmt4Q0dRMWQwMjdBVEovb2NQYzM4NDJ2bDQrTThsQWYxRG5l?=
 =?utf-8?B?L25CT1VoU0xWd21JaXh3eHVIVC9ZN0R6NUdOUzdXZXpEQk8xczU1YTZMeVBG?=
 =?utf-8?B?dGk2QWlGRjJhMFk3cHM4ZHE0OXB5ZlN2WWd4MkV5d0I3Q2VMZmVtTC9vVkNy?=
 =?utf-8?B?T2xFeklTam9PK1FVcklkMzdoVS8xaVZUVGVOSW9lQnZ0dzBhenZFQ29ZcktH?=
 =?utf-8?B?NkxLZ01GVlZ0YTNJL3lhWVEwU0VNb3I4SG9MM2lhU1hEMnlvV2p5UHdTNStr?=
 =?utf-8?B?NDJsd3ZMK3p3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6879.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N0FZRzRJNnBnUFNselJjMmlrd05UeStvK2RCU21wemdKa21Ja3RoQ2szM3hT?=
 =?utf-8?B?STJCdHBGSWdTRTF5ZmcwQlI4bU96bDdRVjJtT3FJMVNOVm1KOE40N05qQ24x?=
 =?utf-8?B?YkJLb1V0YytOUUxudUFQa0tQZTd1Vlkzd2w4aWMvWTcrQ2JkYmRqK2pyOHNm?=
 =?utf-8?B?SFBhRm1MN1d5SXhUbklGUmUyOHNwelpsVnBmRUxuVkhTTnE3Q2gxSHlSakti?=
 =?utf-8?B?SGJRMTBDS2YrL1hLd2xZcEFzd0cxM3MzeHdreWduUGViRERHamxxVHZ6S2Q2?=
 =?utf-8?B?bFp6WHFxR295alJCVk5FQ2ErWENyaXphWkpjMUtOMTI5eWViRm9EVE44K3pL?=
 =?utf-8?B?UTgySU1SWHMvbFpLdHdWNzNwcjlxeXVsR3RPWk1qcWlGUkp0TFhrNmZ3em0w?=
 =?utf-8?B?bUd1dkhzcHJ2SGl3RDExcnZNMnZzZEhpNCsxZmgycEIxU0QrQkdZaW5vMHR4?=
 =?utf-8?B?Z2ZQK1krNHF0VTB1SUwxRFllY0ZnNHZqRWxPcEhJRmV0amplQk41R25WdzJn?=
 =?utf-8?B?S0VOR1MrWDlLeVgrZkhrYkJMZnhVTy9PajBxUEJ0VFoxUTFFSEY0QmVzZXdL?=
 =?utf-8?B?d01zYXAzMnRjZFVTK1d6ZEVQME9tQXArSy9TNUFGNWdyWmo4V0VTL2RXeVBU?=
 =?utf-8?B?VDQzbDBMcFZYVlJxQ3VsR3ExdUMvRFFYc2k1RTFSVXhpVWczUlU4S1hBSkg5?=
 =?utf-8?B?Q0IxbDEzUXJlSjU1RzBaMmxUUUZTcXhYamRaeldqeHh2NzNKMGJBVGV1VEMr?=
 =?utf-8?B?djRmN1c5MG9PNExiUnNsQjc0aTJCdG5wTURDY21LQzhwWWFma0FaN056NDdI?=
 =?utf-8?B?VjZOOTlTS1l2aUlLUUZQbDd6Vll1VkZGbkV3WmE4STVmNCtSdkt6T1NndXFl?=
 =?utf-8?B?alhQMS9xc001bWtWaWFNdWgrWU1MT2NUQmx0SS9JR2orUks2L0FJWHhoSzVI?=
 =?utf-8?B?MDFZanBtajQ4bDZrZEtnNXVYSVNkd1JtWE8xNWJVSGYxOXhtcmZ1S3RhVEFK?=
 =?utf-8?B?RjNkTVcyODdMYXlKb1RFNWk4eFo1OFBEYllCQ0xHYlk3M01ZL2RoZlhVMnpw?=
 =?utf-8?B?OG50ZVQ4ZWQ5a1pXOWlvMXZ6T0FPeUk3Q0JKbENSRE9EMUdyNW9Ma2ZDbENv?=
 =?utf-8?B?VWZzaGZlU1FPSEdjZFNWUzkzSGdHc1J6V2xtV2JlYXpXeURZeTBXRVQ2ZC90?=
 =?utf-8?B?Mld6d1EwMmM1clpnTmx6dTBuemV4allqTjI4RHA2UFc1V1pFSnh6VjFVZXJU?=
 =?utf-8?B?RFdRN3YzbU1ndVlDUjN4Q08yVjYvOE5WdS8yQkxaWnZ4eFNOaDVwWU5ETUZ3?=
 =?utf-8?B?dGFtdW1ib0M3KzI0a3QyYWJEUWM2S3BoM1cwejJET0xLVkMzRlQ0cU5PU0VQ?=
 =?utf-8?B?N1ZpeFR3RmR2VTJIeWtWTTI1c0ZTenh0cFdyUUkvNWlnNHk3VnFIQjh6bVQx?=
 =?utf-8?B?c0Rpd3FraE9BZmhwNnViMlFBcUhxRE5rNTR4eUZxWS9qSzl4U1VUaDVxVGo4?=
 =?utf-8?B?a0VYKy93NWdhUSt3SjJURmhuakpwRGJqdVlpQlBZSmxFYXU2SXE4TDdnRmNn?=
 =?utf-8?B?bkRrTlJjR1RlMnZ3WTdaUXdPY3pycU8rNmRKR09SeHBHQTlhT043Q2FsVmZE?=
 =?utf-8?B?RzhQN1lISTJIclQ2bzhQOUdWNmoxclgwZStMVW9GTGZPWkdzdjFqNXFtMWhy?=
 =?utf-8?B?ZUcvMHNPMFZpdllCUmhMaFJXaytiVXVPc2VLeTgyUGc5aEF0Q3JvbnN5N1cz?=
 =?utf-8?B?cE9Qc0UxUmh1bUJPd2hyRUxIRnlpTFV2SG4zTmEyMythbUlWVTBBUWU2UWVP?=
 =?utf-8?B?VWVzVXg1aG02TEoxcHRaVUwrOHJaSnJ1YzBUdzUvbXNocitxSkV4b0pZT3VI?=
 =?utf-8?B?eUZ1ZGZMcTZrOGp0ajlGakF1T29XZVRJUVBCZUlLZkdpdDlXczdjTFJQMFpK?=
 =?utf-8?B?enZLTEZ4bmszdFNNRHBaa3RuUzNJVHpid1hkQklxQWc0bGdwM3RRSlRLR2Nt?=
 =?utf-8?B?eE1sM3V2L3lDZjR3c1pDY3BnOVRIQ0Nwak5Cc0l0UFJpV085K2NYaEg2a0tQ?=
 =?utf-8?B?OVc5THFCUkJwS1p0bjU0U1FvKzZDWlpuQUxSWVdHa3lkeERWWGNwUTVmSlBR?=
 =?utf-8?Q?G9l9H6ifw7ufWgKheAJ0e9TY8?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6879.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fae0ae7d-da24-4ac0-722e-08ddadf0097d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2025 22:41:01.9373 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MwRC9bBqovd0vVt3UzZyacwTPVdAKn418Rl5dFdi5oWfPALgTzNcG42BsM6HPNlADOhvzDoSgw1ohoNoM+INqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5167
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

SGkgRG1pdHJ5LA0KDQo+IFN1YmplY3Q6IFJlOiBbUkZDIFBBVENIIHYyIDAvMl0gVmlydGlvLUdQ
VSBzdXNwZW5kIGFuZCByZXN1bWUNCj4gDQo+IEhpLA0KPiANCj4gT24gNS8yNC8yNSAwMTowMCwg
ZG9uZ3dvbi5raW1AaW50ZWwuY29tIHdyb3RlOg0KPiA+IEZyb206IERvbmd3b24gS2ltIDxkb25n
d29uLmtpbUBpbnRlbC5jb20+DQo+ID4NCj4gPiBUaGlzIHBhdGNoIHNlcmllcyBpbnRyb2R1Y2Vz
IGEgZnJlZXplIGFuZCByZXN0b3JlIG1lY2hhbmlzbSBmb3IgdGhlDQo+ID4gdmlydGlvLWdwdSBk
cml2ZXI6DQo+ID4NCj4gPiBGaXJzdCBwYXRjaCBhZGRzIGB2aXJ0Z3B1X2ZyZWV6ZWAgYW5kIGB2
aXJ0Z3B1X3Jlc3RvcmVgIGZ1bmN0aW9ucy4NCj4gPiBUaGVzZSBmdW5jdGlvbnMgaGFuZGxlIHRo
ZSBkZWxldGlvbiBvZiB2aXJ0aW8gcXVldWVzIGJlZm9yZSBzdXNwZW5zaW9uDQo+ID4gYW5kIHRo
ZWlyIHJlY3JlYXRpb24gZHVyaW5nIHRoZSByZXN0b3JhdGlvbiBwcm9jZXNzLg0KPiA+DQo+ID4g
U2Vjb25kIHBhdGNoIGltcGxlbWVudHMgYSBtZWNoYW5pc20gZm9yIHJlc3RvcmluZyBgdmlydGlv
X2dwdV9vYmplY3RgDQo+IGluc3RhbmNlcy4NCj4gPiBUaGlzIGlzIG5lY2Vzc2FyeSBiZWNhdXNl
IHRoZSBob3N0IChRRU1VKSBkZWxldGVzIGFsbCBhc3NvY2lhdGVkDQo+ID4gcmVzb3VyY2VzIGR1
cmluZyB0aGUgdmlydGlvLWdwdSByZXNldCwgd2hpY2ggb2NjdXJzIGFzIHBhcnQgb2YgdGhlDQo+
IHJlc3RvcmF0aW9uIHByb2Nlc3MuDQo+ID4NCj4gPiBUaGVzZSBjaGFuZ2VzIGVuc3VyZSB0aGF0
IHRoZSB2aXJ0aW8tZ3B1IGRyaXZlciBjYW4gcHJvcGVybHkgaGFuZGxlDQo+ID4gc3VzcGVuZCBh
bmQgcmVzdW1lIHNjZW5hcmlvcyB3aXRob3V0IHJlc291cmNlIGxvc3MuDQo+ID4NCj4gPiBEb25n
d29uIEtpbSAoMik6DQo+ID4gICBkcm0vdmlydGlvOiBGcmVlemUgYW5kIHJlc3RvcmUgaG9va3Mg
dG8gc3VwcG9ydCBzdXNwZW5kIGFuZCByZXN1bWUNCj4gPiAgIGRybS92aXJ0aW86IEltcGxlbWVu
dCBzYXZlIGFuZCByZXN0b3JlIGZvciB2aXJ0aW9fZ3B1X29iamVjdHMNCj4gPg0KPiA+ICBkcml2
ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmMgICAgfCA2NSArKysrKysrKysrKysrKysr
KysrKystDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaCAgICB8IDEx
ICsrKysNCj4gPiAgZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2ttcy5jICAgIHwgMjQg
KysrKysrLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9vYmplY3QuYyB8
IDcyDQo+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICA0IGZpbGVzIGNoYW5nZWQs
IDE2NSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiANCj4gVGVzdGVkIHRoZSBwYXRj
aGVzLCBhcHBsaWVkIHRvIHY2LjE1LjIuIFN1c3BlbmQtcmVzdW1lIHdvcmtzIHdpdGggdjIsDQo+
IGRpc3BsYXkgd29ya3Mgb24gcmVzdW1lLg0KPiANCj4gSGF2ZSB5b3UgZmlndXJlZCBvdXQgd2h5
IDEwbXMgd29ya2Fyb3VuZCBpcyBuZWVkZWQ/DQoNCltLaW0sIERvbmd3b25dIFVuZm9ydHVuYXRl
bHksIEkgZG9uJ3Qga25vdyB3aHkgaXQgZmFpbHMgd2l0aG91dCB0aGUgZGVsYXkuIEkgd2FudGVk
IHRvIG5hcnJvdyBkb3duIGZ1cnRoZXINCnNvIGVuYWJsZWQgcHJpbnRrIGR1cmluZyBzdXNwZW5k
IGFuZCByZXN1bWUgYnV0IGhhbmcgZGlkbid0IG9jY3VyIHdpdGggdGhlIHRpbWluZyBjaGFuZ2Vz
DQpjYXVzZWQgYnkgcHJpbnRrcy4gIEkndmUgYWxzbyB0cmllZCBtb3JlIGRldGVybWluaXN0aWMg
bWV0aG9kcyB0aGF0IG1ha2UgaXQgd2FpdCBiYXNlZCBvbiBzb21lDQpraW5kcyBvZiAic3RhdHVz
IiBidXQgbm9uZSBvZiB0aGVtIGhhdmUgd29ya2VkIHNvIGZhci4gSWYgeW91IGhhdmUgYW55IHN1
Z2dlc3Rpb25zIG9uIHBvc3NpYmxlDQpjb25kaXRpb24gd2UgY2FuIGNoZWNrIGluc3RlYWQgb2Yg
anVzdCBzbGVlcGluZywgcGxlYXNlIGxldCBtZSBrbm93Lg0KMTBtcyBzZWVtcyB0byBiZSBjbG9z
ZSB0byBtaW5pbXVtIHRvIG1ha2UgaXQgd29yayAxMDAlIGZvciBzZXZlcmFsIGRheXMgKHJ0Y3dh
a2Ugc2xlZXAgYW5kDQp3YWtlIHVwIGV2ZXJ5IDUgc2VjKS4NCg0KPiANCj4gLS0NCj4gQmVzdCBy
ZWdhcmRzLA0KPiBEbWl0cnkNCg==
