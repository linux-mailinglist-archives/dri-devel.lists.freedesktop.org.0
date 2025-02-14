Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F77BA3590D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 09:38:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B6E410E120;
	Fri, 14 Feb 2025 08:38:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W7Of+Zlp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EBF310E013;
 Fri, 14 Feb 2025 08:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739522326; x=1771058326;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yRJwfinhoAiO+ThiMn8/AF9lwnbZDsnAfKegFh/P/fk=;
 b=W7Of+Zlp5tDlAetceBsZv+XMXNncT37mmcPbtkPU0xyfGrvjH0PkPOba
 SQu+WGXE1uHYcEqQlw2Cr9Jw1zbVZcIfneInTmrKJ0Oybd/HT0YWP2Qs7
 sb5ocS4IiLUVevKVz+CFJG2GT06i2xMN756EyNjwdD5pTTb2ik25qiBLO
 uTmVxcnAeRp55a63UTmjgzWFCj6Qvh/gqueQNQWyd3cx6cWWX8BRLckf+
 Dhlb6ZBXHPkZckouytS/hqM1lgETWu9J+KA1jyDle7zXHoWjlw/5lDdlF
 TpZ4Oi3/nQvUOLd73tbacOkgH6g2g/UcQb+GcVD8RL2uumNYoIq/DYiSu A==;
X-CSE-ConnectionGUID: AIz7DwSyQb6GHttaRRJEAg==
X-CSE-MsgGUID: NuW62suyS4i0B+HyZUuGPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40384495"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="40384495"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 00:38:46 -0800
X-CSE-ConnectionGUID: 2OBuU94tQ8Wcm7/5gJvarw==
X-CSE-MsgGUID: 9T0GT4EOS6+ShvYjRIZbag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113887048"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 00:38:46 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 14 Feb 2025 00:38:44 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Feb 2025 00:38:44 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 00:38:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FNVgFBmg+hAakUhbkfLJf6b2Z5QTqoZFAUiftnWvbN87EzTf1cWWtqzpnRSXwSwYhQG4VRWIhIzw+oy7R4D8d0FgMuRAQ2t8FctnjyiheDPvZ6ONVSKtC1AW5gq4EQjkHR/iqdbpFtHBAd1I4y/lscABgXZv0i2zddME6NXLeR8mcHmBWdC26etCokwsoyd1Ri9IkJZdlaGHUSW2fEIt4iOBJJsK9X3jz5b4zJ4EZ40y7kVGN5QVwcNgOu9Ysqyz6BBplP+iyK2+32v4uP+4m07qzAxjSW1MtOGW4QcnEpojtIHdOPHfWiuEJy3LBE83IpniEIY9/fFzXLreDu0iMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yRJwfinhoAiO+ThiMn8/AF9lwnbZDsnAfKegFh/P/fk=;
 b=F4Brir1k9Y8Kan5jW1Rcc9I5HVtZBMdG7YSCMhtQUpyoceJd8p5LSsO6seYEAlTBCTrOZibBD2wjR5HgsrJmojvI5RLe4vboK4t2vIPAfjl1b1CcShOrygVU/AycnMdE40GaeZDFZ5dHUptZJGOUO7ux33kbCgQcgZrRkTjY4lT+Ux4VVSrOY9nw8tq8927blO95Q3s/SkohkgKbH1DdmkZ9teCk/N4d1WbuertMnkBUZ1ijqpyIshpb+hJDAc1QJZfd7cR8f43UUVsUFal6rsh0LRo/ujcqDDQt7dirVhXZmZnSZROOOAdWyCsCVSnZlv/2SYtO0AEVNQfvKLI6vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by DM4PR11MB5247.namprd11.prod.outlook.com (2603:10b6:5:38a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Fri, 14 Feb
 2025 08:38:43 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%3]) with mapi id 15.20.8445.013; Fri, 14 Feb 2025
 08:38:43 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>
Subject: RE: [PATCH v8 01/14] drm: Define histogram structures exposed to user
Thread-Topic: [PATCH v8 01/14] drm: Define histogram structures exposed to user
Thread-Index: AQHbcZ6GaXhgZ7mp1kK5PNksT3xoN7NGcbKwgAAijqA=
Date: Fri, 14 Feb 2025 08:38:43 +0000
Message-ID: <SN7PR11MB67509C00B15F06758665AAEEE3FE2@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20250128-dpst-v8-0-871b94d777f8@intel.com>
 <20250128-dpst-v8-1-871b94d777f8@intel.com>
 <SN7PR11MB6750AEE4BC0324DC53217762E3FE2@SN7PR11MB6750.namprd11.prod.outlook.com>
In-Reply-To: <SN7PR11MB6750AEE4BC0324DC53217762E3FE2@SN7PR11MB6750.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|DM4PR11MB5247:EE_
x-ms-office365-filtering-correlation-id: 488ec901-0a4b-40e1-d1a1-08dd4cd2fd2e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?RkVTY3FzTit2d0tnajZUdmFhYWZyelBzVWljbmZKeWdFWVFFb1dONThJU1Jm?=
 =?utf-8?B?TGNIQXhQZmpxUzQyd2pBZFltYVVROUJOS2c5bit2NVZLSFZrcFk4YTNJMC9l?=
 =?utf-8?B?SXFvb29jNE5NUHZOVGpEN0U2WDhZOUVVSGZoUUtvOEtMQ3VwWGw5N2lIeXZx?=
 =?utf-8?B?OUZ2dDdFdWZFdy9nakVxK2VneVFvbHZXbEdla3ZsT0VBTkNJaG4xR3JoVkxJ?=
 =?utf-8?B?ZmUwZnhSelVPTnJEYmhRcnlZbWZFdkU0Q3ZVbUY4MFVzL3EzWkdCeTVBUEhH?=
 =?utf-8?B?aWw2S3ptQmhPTExTOHNDZGxJTTFiUityT3NqRVRKWEJTeFhEUGI1YUN4N01Q?=
 =?utf-8?B?eC80RFRuVTBBSXh5bkxqMi8xeVU3dlZvS2ZDUWZSaVNpZlRZWkJ6dDRCRUJv?=
 =?utf-8?B?Si9lREN1NlpFWnd1L29uZGh2YXRhSHl3Nm1SUUh1aWxpQWZESjBoUmZzTEpK?=
 =?utf-8?B?cnRBY0FoTkZUdnlNZWtnZ3NnZXBscUJOY3BTOXdJVFpvWFpZODlsYXFZa1N3?=
 =?utf-8?B?N0F2UWN1MUdXOE1SUVQydS9iTzQ4WTNvZ0lQdW9oQWo4QVd0bG9VYldtOVA3?=
 =?utf-8?B?RkhPYXBnakF4aFlnenpiZUZubS9kZUlwZmcvNi9vY2pNY2xOTHpiMjh1ZE5s?=
 =?utf-8?B?ZW5iWDMzTFZDWHh6R0c1RERlY2JWdWlQTmZKdjlZaXl0cmtoclZCOHhjYmFT?=
 =?utf-8?B?RnR3eGNjU1ROTzEwZEV1Snp4UkZlNVpjS29uU1dEcXYvdDV2TnhYdlFPNGJO?=
 =?utf-8?B?WmNPb0d0S3RYWDYzbUhvTmJFMkpVcEtsS0JreE9NV2Ixa3N5WVh4UWxoOGJq?=
 =?utf-8?B?TW9GUSt4OVdPdERKSGR3eDB1MURmTVRrVHFSdGpPeEhVU1JXRGZOOXNNc1hs?=
 =?utf-8?B?bU1GOUpwS2tzTEQxQ0o1TnV0OEtYMEpneVFZM2pVbXM5SW9kcEgxSGw1OGhm?=
 =?utf-8?B?b2l4MjlaTk44UmhRc0RCUlZUWklucW9hZVo2YUR1QVRlckQ5WnM2bGxwL2ps?=
 =?utf-8?B?L2lCSVdKVVhDNlRkM2R0dGV6ZVQ4Wmh3U2lYVlVGWG8wWkIrYU0yQ3lNVEJ3?=
 =?utf-8?B?blRxOE9DcjYyeDVHbHdoYlYrMHZ1MEpmMjJodzNnc01ZVldPRFAwOHNDWUhT?=
 =?utf-8?B?N29kZU5qWTdqdjlOOTNCcFlTdVZXZk5qTjJtNURZRlhvcFE4Unk0Uiswb2Iw?=
 =?utf-8?B?dmNZaTlqaUwzZGxHeGZ5eWJXa0xzSnlSWTdLdVI1aUtiZzBuTmJxVzM0K0xz?=
 =?utf-8?B?ZHRpUi9Oc2NjaVprM2hWOGpYbHpITTRyaVpMZXRneHI5UmJHTENXalhUdUwv?=
 =?utf-8?B?dlUxbzlEMUFCTUZkVWxBRCs3eXBVK1lzc1c4cHkxaWNkNlE1NmZsZUkrTDda?=
 =?utf-8?B?ZHk2VkljWStKNEdqeDBLdURVOSsrZ0phYklwbTYyUGsyVUI2ZjlXQUJOUDh3?=
 =?utf-8?B?RzhmVXRvMTFlUnFYTGFFcE9xbUZVRXN5cGJhUkl3Q1oraUhtUzN4MkIvaTVF?=
 =?utf-8?B?TXRLUEUyRWhYbzdPOG1WMGxnd01nVzdPMmtPVW5UK0RxeDVOTjNCUzJoU1N2?=
 =?utf-8?B?U1FFMmV3MVVOb3R5dDdLdSs0ZmgrRUtWNDcyVDVzRTl2UTBPbDZteWk4MHh0?=
 =?utf-8?B?cXdwVWI2YmZaSEVUaHkwZktyWXZTN2FIRnBYS1BDdnRRay95L0NZMzVuaEhR?=
 =?utf-8?B?cVhKN2M5cXlXcUN5L0JMc2Q5Wldta0kvM3lpc240LzlGU1doVnhyMDU1QjFa?=
 =?utf-8?B?amswcFpNWmpRZ1dhWTAzeGFjaUgxb3VIZVdoRFFsOHBUK0tUSjk1ci9PQ3Qx?=
 =?utf-8?B?RUQ3NlMzY0JOdVB6YVZILzlXbUVYVVhLQWNHeExQOHZqNXZ6OFV1UkpndkxN?=
 =?utf-8?B?SkpuNmF5eWZTcHduUGYyQ3lZelFNeHpnbEJlRzJDV1VrcVFrUUNrdFNFanQ2?=
 =?utf-8?Q?PsX8raJ/rWN2De6OVc2GFs13VgKAfrsd?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UGxlWVFrNEFQOHZZRVEvajYycDBBU1lHK1dOWGxtNDlpajU3cUwycFhvaGdX?=
 =?utf-8?B?YXh6cjRaU1hvbHBUeTMyYUZ0VFdlTUltaVhIeXV0UkRBNXhuanFGNm9XbW1T?=
 =?utf-8?B?dUhmNElhV1RNSHZxVW1OeS9DaW9oaXhia01La2ZaRnVpRForTUtWNisxZFBh?=
 =?utf-8?B?RUhVSlFKUzY3aVNtWjVXdjQ2WnROL1huc0p4cUZRU2VyUXF3SWQzZFRhQlRQ?=
 =?utf-8?B?OEZCWWk3UjZtN0NGR1M2bGJEVVJCVTFMdjRSUDh0L1gxckdSZytyYkNYc2Nj?=
 =?utf-8?B?cDFsT1NXb0RuOXFKdjQ0cGVGQVIwQXhjUitERHMxelhZMlozR2FFTEtsaUEx?=
 =?utf-8?B?MlpsWlBqVVhHeEZoRFUvRlQ0cFkzR2JaVnhXa2hsc25pVUNyQlIwbXE4c3pJ?=
 =?utf-8?B?YXZCbE9PWERxd0ptYUVDZ1EzeHRCMmlBcnFydnpyZmZZZFBnZkREMHBXZEN1?=
 =?utf-8?B?dDhIeUc0R2cxL0RzQVV6UnFOcVlRWXJueGtzTXpTYmFSNWpFdXY5RW5GU0U2?=
 =?utf-8?B?NWszMUpyYVBIVG43NVFpeCswRVRHZC9BbFlZZ241blV6OE83R0pRT0hXdG9Y?=
 =?utf-8?B?QUJjY3ZxZisraGgrSWF2Z1dma3ltMkhndDEwZ3c4eWZHRVhTNndXQTdhLzZr?=
 =?utf-8?B?VG1CYXdzYyttS1Z5b1MzMXQyQUNiMlM3ZEd4d2NnaExOczFhZFlzaFZRNFli?=
 =?utf-8?B?RTBtTWtub2VNTkZ6NzltaEtESEM3WFYyaUxsdGo2T3VTYUEvOFRENHFITno0?=
 =?utf-8?B?ZFluMnhqL0c5cHZENjJJM1RtaE9DSjd6Z1VOdFVpNlM4VmVWREY4ZGtncjJa?=
 =?utf-8?B?ZGFRbHF6ZkRHSERCbXA5VHB2QjJQak9INThIOU1CZFNub2tUK2NHSlh6b0o2?=
 =?utf-8?B?Yy94SWpJTXdmZi95NzRERmFkSFRCWlg4MmJRSnFXd28yVGdUaUtsVXhwUm80?=
 =?utf-8?B?aG44OG5oR3BkNjdrRU5LT1Z4YnV2VEpmQXVkRkZxZ05ZT0tWNUtINktQYVJl?=
 =?utf-8?B?cHVpL2hacU82eXMydHpRMnFXSHVpMEhmcUU5NkhGbis2OFhLMHYxNkFnNlZn?=
 =?utf-8?B?S3lJZEh5eWRmZ3dsdHo5QURLek1jdHF5OUY5WnhTN3hOK0xEQzJXNEJERExG?=
 =?utf-8?B?MmZjUWxRbG5xK2xvUHlDYUNMOG9YUm5aY1A3c1BaYVdPbTRIWHRkNnZyLys4?=
 =?utf-8?B?SjFQQ3VrbUUyb0FVUlc2TytvQzRRVUM3UlBrWkNXOE1BSjJjcGo3cGtxY1NQ?=
 =?utf-8?B?dFAyVWZTcDArNGU1ckN6M3orS0lTNyswYWt6ckJTN2UzNDdtY0M3Y2dIMGFE?=
 =?utf-8?B?eldObWVoSkRKT0NuL2pwTHhhRFVCanZacG9PNDVXMmUzbHRXQzIrVkhhYkMz?=
 =?utf-8?B?WXF2K3B3Rmg0WEhKZ21EcFBsRlE1b0c4QUNkL2ZsNFBJa3ZpTWc3V0s4VS9u?=
 =?utf-8?B?cVF3aFNyazlFcGVwU2x5eUViK3BlY1dwYVdtWnpub0ZGS1RGT0ticWM5YWVP?=
 =?utf-8?B?VTJNTzAyN2JGZGJPdXY5QlRuckhtUTU1THdGaGxWZENaSzA5Y2VKNi92c3p2?=
 =?utf-8?B?SVNycFZFdTlaRGNadUk2dVE1V00rNlBUc2E1aEtCckUzYVRhRVVXYkd6RUR4?=
 =?utf-8?B?dWNlV2pCdkhoN0thUmtidDJPZndHZFQ3MXA2Tkw1TkdSYzVYVUY3eE43Qkpk?=
 =?utf-8?B?Wno2Tlo4MjFkeFBoRTJPTVJYclRQSFluVUFKNythbUJncTREWjg1U240dU8v?=
 =?utf-8?B?bVlvYnZEWksrNkliQllvcElIaEpVRVJFQUFRRWR1NzRjNTdBWTdMQ3hDY3N2?=
 =?utf-8?B?WkNzNkFJdkNmYVB6dWc0S3pibnRsbkJ4MldrMlpvV2svUFljaEVKMFdFMlhZ?=
 =?utf-8?B?bzRSb2FRTkQwSk9lUngvRXYwRy9haEtVS3JNcXVFNUhvcCt4dDlLVnVCS3FV?=
 =?utf-8?B?TU1IUGtNOFJYNFFmNmVUam5Za3ZZRXVvTHFNaGw4cXF4THNqSDAvbU90QnFy?=
 =?utf-8?B?UzR6SkFZL0x0QlBuMmc0OHZ1bFZ4MHI5RDJ6MlJNcFJOQzVNVUtEdGs2a0JN?=
 =?utf-8?B?TkNyVFIySkJHR2RKc0RmSmRzTkFXVXRoQjFaRlcyZEE1UVpmVzJHVUZHY3JD?=
 =?utf-8?Q?dBUPui5JURPI6oFQyl49mqfvg?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 488ec901-0a4b-40e1-d1a1-08dd4cd2fd2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 08:38:43.0530 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HN1DkZV1Ivup8/xjd/0NVxLqUkyJUJ3wLqMagV9318NDL+/AA51qaVPp9A1z8OoimkGB5exf2An6PMRe6gLZRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5247
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2FuZHBhbCwgU3VyYWoN
Cj4gU2VudDogRnJpZGF5LCBGZWJydWFyeSAxNCwgMjAyNSAxMjowOSBQTQ0KPiBUbzogTXVydGh5
LCBBcnVuIFIgPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPjsgaW50ZWwteGVAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnOw0KPiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBkbWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmcN
Cj4gU3ViamVjdDogUkU6IFtQQVRDSCB2OCAwMS8xNF0gZHJtOiBEZWZpbmUgaGlzdG9ncmFtIHN0
cnVjdHVyZXMgZXhwb3NlZCB0byB1c2VyDQo+IA0KPiANCj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBNdXJ0aHksIEFydW4gUiA8YXJ1bi5yLm11cnRoeUBpbnRl
bC5jb20+DQo+ID4gU2VudDogVHVlc2RheSwgSmFudWFyeSAyOCwgMjAyNSA5OjIxIFBNDQo+ID4g
VG86IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZzsNCj4gPiBkcmktIGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+IENj
OiBLYW5kcGFsLCBTdXJhaiA8c3VyYWoua2FuZHBhbEBpbnRlbC5jb20+Ow0KPiA+IGRtaXRyeS5i
YXJ5c2hrb3ZAbGluYXJvLm9yZzsgTXVydGh5LCBBcnVuIFIgPGFydW4uci5tdXJ0aHlAaW50ZWwu
Y29tPg0KPiA+IFN1YmplY3Q6IFtQQVRDSCB2OCAwMS8xNF0gZHJtOiBEZWZpbmUgaGlzdG9ncmFt
IHN0cnVjdHVyZXMgZXhwb3NlZCB0bw0KPiA+IHVzZXINCj4gPg0KPiA+IERpc3BsYXkgSGlzdG9n
cmFtIGlzIGFuIGFycmF5IG9mIGJpbnMgYW5kIGNhbiBiZSBnZW5lcmF0ZWQgaW4gbWFueQ0KPiA+
IHdheXMgcmVmZXJyZWQgdG8gYXMgbW9kZXMuDQo+ID4gRXg6IEhTViBtYXgoUkdCKSwgV2lnaHRl
ZCBSR0IgZXRjLg0KDQpPbmUgbW9yZSBUeXBvIEkgZm9yZ290IHRvIHBvaW50IG91dCAqV2VpZ2h0
ZWQNCg0KUmVnYXJkcywNClN1cmFqIEthbmRwYWwNCg0KPiA+DQo+ID4gVW5kZXJzdGFuZGluZyB0
aGUgaGlzdG9ncmFtIGRhdGEgZm9ybWF0KEV4OiBIU1YgbWF4KFJHQikpIEhpc3RvZ3JhbSBpcw0K
PiA+IGp1c3QgdGhlIHBpeGVsIGNvdW50Lg0KPiA+IEZvciBhIG1heGltdW0gcmVzb2x1dGlvbiBv
ZiAxMGsgKDEwMjQwIHggNDMyMCA9IDQ0MjM2ODAwKQ0KPiA+IDI1IGJpdHMgc2hvdWxkIGJlIHN1
ZmZpY2llbnQgdG8gcmVwcmVzZW50IHRoaXMgYWxvbmcgd2l0aCBhIGJ1ZmZlciBvZg0KPiA+IDcg
Yml0cyhmdXR1cmUNCj4gPiB1c2UpIHUzMiBpcyBiZWluZyBjb25zaWRlcmVkLg0KPiA+IG1heChS
R0IpIGNhbiBiZSAyNTUgaS5lIDB4RkYgOCBiaXQsIGNvbnNpZGVyaW5nIHRoZSBtb3N0IHNpZ25p
ZmljYW50IDUNCj4gPiBiaXRzLCBoZW5jZSAzMiBiaW5zLg0KPiA+IEJlbG93IG1lbnRpb25lZCBh
bGdvcml0aG0gaWxsdXN0cmF0ZXMgdGhlIGhpc3RvZ3JhbSBnZW5lcmF0aW9uIGluIGhhcmR3YXJl
Lg0KPiA+DQo+ID4gaGlzdFszMl0gPSB7MH07DQo+ID4gZm9yIChpID0gMDsgaSA8IHJlc29sdXRp
b247IGkrKykgew0KPiA+IAliaW4gPSBtYXgoUkdCW2ldKTsNCj4gPiAJYmluID0gYmluID4+IDM7
CS8qIGNvbnNpZGVyIHRoZSBtb3N0IHNpZ25pZmljYW50IGJpdHMgKi8NCj4gPiAJaGlzdFtiaW5d
Kys7DQo+ID4gfQ0KPiA+IElmIHRoZSBlbnRpcmUgaW1hZ2UgaXMgUmVkIGNvbG9yIHRoZW4gbWF4
KDI1NSwwLDApIGlzIDI1NSBzbyB0aGUgcGl4ZWwNCj4gPiBjb3VudCBvZiBlYWNoIHBpeGVscyB3
aWxsIGJlIHBsYWNlZCBpbiB0aGUgbGFzdCBiaW4uIEhlbmNlIGV4Y2VwdA0KPiA+IGhpc3RbMzFd
IGFsbCBvdGhlciBiaW5zIHdpbGwgaGF2ZSBhIHZhbHVlIHplcm8uDQo+ID4gR2VuZXJhdGVkIGhp
c3RvZ3JhbSBpbiB0aGlzIGNhc2Ugd291bGQgYmUgaGlzdFszMl0gPQ0KPiA+IHswLDAsLi4uLjQ0
MjM2ODAwfQ0KPiA+DQo+ID4gRGVzY3JpcHRpb24gb2YgdGhlIHN0cnVjdHVyZXMsIHByb3BlcnRp
ZXMgZGVmaW5lZCBhcmUgZG9jdW1lbnRlZCBpbg0KPiA+IHRoZSBoZWFkZXIgZmlsZSBpbmNsdWRl
L3VhcGkvZHJtL2RybV9tb2RlLmgNCj4gPg0KPiA+IHY4OiBBZGRlZCBkb2MgZm9yIEhEUiBwbGFu
ZXMsIHJlbW92ZWQgcmVzZXJ2ZWQgdmFyaWFibGVzIChEbWl0cnkpDQo+ID4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBBcnVuIFIgTXVydGh5IDxhcnVuLnIubXVydGh5QGludGVsLmNvbT4NCj4gPiAtLS0N
Cj4gPiAgaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oIHwgNjUNCj4gPiArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDY1
IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL2Ry
bV9tb2RlLmggYi9pbmNsdWRlL3VhcGkvZHJtL2RybV9tb2RlLmgNCj4gPiBpbmRleA0KPiA+DQo+
IGMwODI4MTBjMDhhOGIyMzRlZjI2NzJlY2Y1NGZjOGMwNWRkYzJiZDMuLmI4YjdiMTg4NDNhZTcy
MjQyNjNhOWM2MWINCj4gPiAyMGFjNmNiZjVkZjY5ZTkgMTAwNjQ0DQo+ID4gLS0tIGEvaW5jbHVk
ZS91YXBpL2RybS9kcm1fbW9kZS5oDQo+ID4gKysrIGIvaW5jbHVkZS91YXBpL2RybS9kcm1fbW9k
ZS5oDQo+ID4gQEAgLTEzNTUsNiArMTM1NSw3MSBAQCBzdHJ1Y3QgZHJtX21vZGVfY2xvc2VmYiB7
DQo+ID4gIAlfX3UzMiBwYWQ7DQo+ID4gIH07DQo+ID4NCj4gPiArLyoqDQo+ID4gKyAqIGVudW0g
ZHJtX21vZGVfaGlzdG9ncmFtDQo+ID4gKyAqDQo+ID4gKyAqIEBEUk1fTU9ERV9ISVNUT0dSQU1f
SFNWX01BWF9SR0I6DQo+ID4gKyAqIE1heGltdW0gcmVzb2x1dGlvbiBhdCBwcmVzZW50IDEwaywg
MTAyNDB4NDMyMCA9IDQ0MjM2ODAwDQo+ID4gKyAqIGNhbiBiZSBkZW5vdGVkIGluIDI1Yml0cy4g
V2l0aCBhbiBhZGRpdGlvbmFsIDcgYml0cyBpbiBidWZmZXIgZWFjaA0KPiA+ICtiaW4NCj4gPiAr
ICogY2FuIGJlIGEgdTMyIHZhbHVlLg0KPiA+ICsgKiBGb3IgU0RMLCBNYXhpbXVtIHZhbHVlIG9m
IG1heChSR0IpIGlzIDI1NSwgc28gbWF4IDI1NSBiaW5zLg0KPiANCj4gVHlwZTogU0RSDQo+IA0K
PiA+ICsgKiBJZiB0aGUgbW9zdCBzaWduaWZpY2FudCA1IGJpdHMgYXJlIGNvbnNpZGVyZWQsIHRo
ZW4gYmlucyA9IDJeNQ0KPiA+ICsgKiB3aWxsIGJlIDMyIGJpbnMuDQo+ID4gKyAqIEZvciBIRFIs
IG1heGltdW0gdmFsdWUgb2YgbWF4KFJHQikgaXMgNjU1MzUsIHNvIG1heCA2NTUzNSBiaW5zLg0K
PiA+ICsgKiBGb3IgaWxsdXN0cmF0aW9uIGNvbnNpZGVyIGEgZnVsbCBSRUQgaW1hZ2Ugb2YgMTBr
IHJlc29sdXRpb24NCj4gPiArY29uc2lkZXJpbmcgYWxsDQo+ID4gKyAqIDggYml0cyBoaXN0b2dy
YW0gd291bGQgbG9vayBsaWtlIGhpc3RbMjU1XSA9IHswLDAsLi4uLjQ0MjM2ODAwfQ0KPiA+ICt3
aXRoIFNEUg0KPiA+ICsgKiBwbGFuZSBzaW1pbGFybHkgd2l0aCBIRFIgdGhlIHNhbWUgd291bGQg
bG9vayBsaWtlIGhpc3RbNjU1MzVdID0NCj4gPiArICogezAsMCwwLC4uLi40NDIzNjgwMH0NCj4g
PiArICovDQo+ID4gK2VudW0gZHJtX21vZGVfaGlzdG9ncmFtIHsNCj4gPiArCURSTV9NT0RFX0hJ
U1RPR1JBTV9IU1ZfTUFYX1JHQiA9IDB4MDEsIH07DQo+ID4gKw0KPiA+ICsvKioNCj4gPiArICog
c3RydWN0IGRybV9oaXN0b2dyYW1fY2Fwcw0KPiA+ICsgKg0KPiA+ICsgKiBAaGlzdG9ncmFtX21v
ZGU6IGhpc3RvZ3JhbSBnZW5lcmF0aW9uIG1vZGVzLCBkZWZpbmVkIGluIHRoZQ0KPiA+ICsgKgkJ
ICAgIGVudW0gZHJtX21vZGVfaGlzdG9ncmFtDQo+ID4gKyAqIEBiaW5zX2NvdW50OiBudW1iZXIg
b2YgYmlucyBmb3IgYSBjaG9zZW4gaGlzdG9ncmFtIG1vZGUuIEZvcg0KPiBpbGx1c3RyYXRpb24N
Cj4gPiArICoJCXJlZmVyIHRoZSBhYm92ZSBkZWZpbmVkIGhpc3RvZ3JhbSBtb2RlLg0KPiA+ICsg
Ki8NCj4gPiArc3RydWN0IGRybV9oaXN0b2dyYW1fY2FwcyB7DQo+ID4gKwlfX3UzMiBoaXN0b2dy
YW1fbW9kZTsNCj4gDQo+IERvIHdlIHJlYWxseSBuZWVkIF9fdTMyIGZvciBoaXN0b2dyYW0gbW9k
ZSBkb24ndCB5b3UgdGhpbmsgYSBfX3UxNiBzaG91bGQNCj4gc3VmZmljZT8NCj4gDQo+IA0KPiA+
ICsJX191MzIgYmluc19jb3VudDsNCj4gDQo+IE5pdDogYmluX2NvdW50IHNvdW5kcyBiZXR0ZXIu
DQo+IA0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArLyoqDQo+ID4gKyAqIHN0cnVjdCBkcm1faGlzdG9n
cmFtX2NvbmZpZw0KPiA+ICsgKg0KPiA+ICsgKiBAaGlzdF9tb2RlX2RhdGE6IGFkZHJlc3MgdG8g
dGhlIGhpc3RvZ3JhbSBtb2RlIHNwZWNpZmljIGRhdGEgaWYNCj4gPiArYW55DQo+ID4gKyAqIEBu
cl9oaXN0X21vZGVfZGF0YTogbnVtYmVyIG9mIGVsZW1lbnRzIHBvaW50ZWQgYnkgdGhlIGFkZHJl
c3MgaW4NCj4gPiArICoJCSAgICAgICBoaXN0X21vZGVfZGF0YQ0KPiA+ICsgKiBAaGlzdF9tb2Rl
OiBoaXN0b2dyYW0gbW9kZShIU1YgbWF4KFJHQiksIFJHQiwgTFVNQSBldGMpDQo+ID4gKyAqIEBl
bmFibGU6IGZsYWcgdG8gZW5hYmxlL2Rpc2FibGUgaGlzdG9ncmFtICAqLyBzdHJ1Y3QNCj4gPiAr
ZHJtX2hpc3RvZ3JhbV9jb25maWcgew0KPiA+ICsJX191NjQgaGlzdF9tb2RlX2RhdGE7DQo+ID4g
KwlfX3UzMiBucl9oaXN0X21vZGVfZGF0YTsNCj4gPiArCWVudW0gZHJtX21vZGVfaGlzdG9ncmFt
IGhpc3RfbW9kZTsNCj4gPiArCWJvb2wgZW5hYmxlOw0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArLyoq
DQo+ID4gKyAqIHN0cnVjdCBkcm1faGlzdG9ncmFtDQo+ID4gKyAqDQo+ID4gKyAqIEBjb25maWc6
IGhpc3RvZ3JhbSBjb25maWd1cmF0aW9uIGRhdGEgcG9pbnRlZCBieSBzdHJ1Y3QNCj4gPiArZHJt
X2hpc3RvZ3JhbV9jb25maWcNCj4gPiArICogQGRhdGFfcHRyOiBwb2ludGVyIHRvIHRoZSBhcnJh
eSBvZiBoaXN0b2dyYW0uDQo+ID4gKyAqCSAgICAgIEhpc3RvZ3JhbSBpcyBhbiBhcnJheSBvZiBi
aW5zLiBEYXRhIGZvcm1hdCBmb3IgZWFjaCBiaW4gZGVwZW5kcw0KPiA+ICsgKgkgICAgICBvbiB0
aGUgaGlzdG9ncmFtIG1vZGUuIFJlZmVyIHRvIHRoZSBhYm92ZSBoaXN0b2dyYW0gbW9kZXMgZm9y
DQo+IA0KPiBJIHRoaW5rIHlvdSBjYW4gd3JpdGUgdGhlIGRybV9oaXN0b2dyYW1fbW9kZV9jYXBz
IGluc3RlYWQgb2Ygd3JpdGluZw0KPiBoaXN0b2dyYW0gbW9kZSBTbyBwZW9wbGUgY2FuIGRpcmVj
dGx5IGp1bXAgdG8gaXQNCj4gDQo+IFJlZ2FyZHMsDQo+IFN1cmFqIEthbmRwYWwNCj4gDQo+ID4g
KyAqCSAgICAgIG1vcmUgaW5mb3JtYXRpb24uDQo+ID4gKyAqIEBucl9lbGVtZW50czogbnVtYmVy
IG9mIGJpbnMgaW4gdGhlIGhpc3RvZ3JhbS4NCj4gPiArICovDQo+ID4gK3N0cnVjdCBkcm1faGlz
dG9ncmFtIHsNCj4gPiArCXN0cnVjdCBkcm1faGlzdG9ncmFtX2NvbmZpZyBjb25maWc7DQo+ID4g
KwlfX3U2NCBkYXRhX3B0cjsNCj4gPiArCV9fdTMyIG5yX2VsZW1lbnRzOw0KPiA+ICt9Ow0KPiA+
ICsNCj4gPiAgI2lmIGRlZmluZWQoX19jcGx1c3BsdXMpDQo+ID4gIH0NCj4gPiAgI2VuZGlmDQo+
ID4NCj4gPiAtLQ0KPiA+IDIuMjUuMQ0KDQo=
