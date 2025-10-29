Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7ADC1893D
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 08:02:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09BBD10E164;
	Wed, 29 Oct 2025 07:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PdZdRC72";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C64F10E129;
 Wed, 29 Oct 2025 07:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761721354; x=1793257354;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=almdYplRc3o36u8isg8O+Bt6BupqFajv9xciTkG3hmo=;
 b=PdZdRC72so2h+d+q5XlIYmq+pM+Mw2/IfS43cpqvE3Cc4e02hZAjH4+Y
 /VL8BVpYib8K9cQmnzavS50pIUWhO4XTxslu7uh5EztMwSkqqpdQIM02B
 GEzRe8udVrwNuGqKvzVAZGxlDwaLANtVEqUsuTPV4SmlsglldaxKa1fTp
 4CseDO524Mhg2OLadaNhikfHxdkhrQGBTu1DGXOQ6hA/V1ezzTQHzKHCT
 4DUHdKE3jySoQkeREt0jgwleYQOqGlidMbORtlvsrTqG5j4mmqbqJfhfz
 EHkgBIGoz3eb4o/45XNcwFDfzny4mRPM0IhytNCBGHzjCn3IvZvv82TRz w==;
X-CSE-ConnectionGUID: 8bVVXoNqQfShvft5X2bIiw==
X-CSE-MsgGUID: FpVlyOyyThqQYCW+fY8i4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66448978"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="66448978"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 00:02:34 -0700
X-CSE-ConnectionGUID: oym9jaCGTCyGkXCa7vkwog==
X-CSE-MsgGUID: nuJiZDzSSyWNcDS80gNOPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="189637090"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 00:02:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 00:02:33 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 00:02:33 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.26) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 00:02:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kkkdOBo2AEMfYF0+YW4/HdIH7LJmf+W4FrQsT0W+T+5AUZz63eCTHzVPYnz277kwOU6tp12oY5VnD1vp8u3JjhYgI0x/zn39TOXjg/eMn/LlEMhqIcRKFGyqT0X9wxDLDNWPiKNAz21SC1VLozz7aEWN3YjAQQ8wMfNa6lT5EERzIKGULwuPaAz2gd0a2BQ8uv1+pFd5bJFWxevn6F8KVLjuq08LYZ1LkxhcupnIFjwbhqtAlD1Kky1/PbLQZJ+VVdtYwnHrtgXhh5RSDG5cxWwIqYJiBEeeXEUJ4Aad82O+djyfTdzDBNyA5b9N/MdJl/O4G4Jey3uaKFLiO1wSqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=almdYplRc3o36u8isg8O+Bt6BupqFajv9xciTkG3hmo=;
 b=D/4A0+2hOOOfqzwJDc0m6lQHcnSVqthABf98EOdmYc9QieuKGgG1PTGBj+slWquqQE6yr1/9eYBUhwoCkAYg6rLssiUr6IFFOzhmNqQdO7Wl7V5QplFrqHr7b5IL4DOILgAgbhqfaiQk/QlvzNxFEzEShZdaHVDHu8BST7JiWqVcYKbCUg13RGKeQh7xHiPrfSTIwBBwILU9pjTP9h64mK9LO5vzhYQGFWyt4G6H8Fd+PSQt0OWCUGUVHRmRweFJPG61E/a4zLYMkd7qNcG+m5uZUWnnPoOsGuX6Ui5iJFcecGYtCMEFYA+02X5alcTg7HeB6H4IqYetIv9AKqW/VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by LV8PR11MB8510.namprd11.prod.outlook.com
 (2603:10b6:408:1e8::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 07:02:31 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%4]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 07:02:30 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 "xaver.hugl@kde.org" <xaver.hugl@kde.org>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "Shankar, Uma" <uma.shankar@intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Murthy,
 Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCH v6 1/5] drm: Define user readable error codes for atomic
 ioctl
Thread-Topic: [PATCH v6 1/5] drm: Define user readable error codes for atomic
 ioctl
Thread-Index: AQHcOP+1NZkDKWA5lEmUUXAHuuE9z7TYwzPQ
Date: Wed, 29 Oct 2025 07:02:30 +0000
Message-ID: <DM3PPF208195D8D40A2E899BB7D51A45B25E3FAA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251009-atomic-v6-0-d209709cc3ba@intel.com>
 <20251009-atomic-v6-1-d209709cc3ba@intel.com>
In-Reply-To: <20251009-atomic-v6-1-d209709cc3ba@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|LV8PR11MB8510:EE_
x-ms-office365-filtering-correlation-id: b55e8444-116d-4eaf-a034-08de16b92095
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700021|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?NVRoSURmclhzRDUwUXFFcVBjRUdzbnlTWS9VbmF2aEFDL0wzQzdZTlJTakRk?=
 =?utf-8?B?MlFZMW9sWmdEUlpxT0t2SitlTGp1NmlkeHJpSDZMVmcrcmlaVTdNUS8wR1dr?=
 =?utf-8?B?RmxCRGRQK09lRDdTei9haURxOXAvSjJpelJMUFhHRlJyaVo2UTBNR3NVYkVQ?=
 =?utf-8?B?aWFUdU53ZHpDNFE2cXBXK2VJcFB5Tk9mSXcrclJGRk5sUmd1d295cE1tRW1R?=
 =?utf-8?B?eHRaSm4rYTJQK0VWZWpraHovTEYvQmVjaytXbDJXWkZqd0hUdkVrd3FJV3p3?=
 =?utf-8?B?a1ExUWZnZHRuelhyWFJpYkxpcmMwNGphRENyNSs3Y2tYWk52b0R0Y1BQc2dF?=
 =?utf-8?B?N3NZaHdQTWdzdVJIWlYxdmY3c3VJOGQ4SkRaR21velZFVTN0dkxHNDczVGZV?=
 =?utf-8?B?Tnd4bVI2cVFPTm56d3Q3V0Y5QVVCNVhxVlpGTFlmTmsxQ3A3c3JsY0N2YUoz?=
 =?utf-8?B?VWVIcUx3MHRsZEVFWm1wUGZ2UnNYVWRCZWRLcVNTcGw0MmVmUXBDbm5BZG12?=
 =?utf-8?B?QkxxbGJSSFRpWmMrSGJPc1BuRXdFUWVQdmswbXc0ajluYlR4T2ZETVRaQXRz?=
 =?utf-8?B?TkxuU3JJbXhESzdyNElUZnd6QnNyTkN6Yk9iY25MMUliTmYvWUxWckErcHNG?=
 =?utf-8?B?NXlWaCtSTWJObVFEY2lwM2FUNGJoMHhrem9EazIvMU5tSCszV0taZW1HTmxo?=
 =?utf-8?B?K0xMdTdYMEh1R2J2cFFXRjR0RU0wd1hDS3I2T2V5Uk9rRVU5emVJeEFtMmQz?=
 =?utf-8?B?d1U1WW5uSm5hRGorL2JlZysyaDlGeEVoZG1lYzFvSGg0dW16SE1OUUhGTjFL?=
 =?utf-8?B?V2pCazl3VWNyU3NLQyt5bkoyZVhaM1pnM3R3dVJvbHVJUzI4Y3lhMlFwR0J1?=
 =?utf-8?B?V1NUa1VYbFBOamJUTWtPQmg3RUJhTi9JTG13RGJ0L0JkbUVhRHRPc0d1UEFI?=
 =?utf-8?B?U2tiK1d2enBjMUhmMnpzdy9JcG9rMlFTb0N4aGlKMGNzZDFyWExpaVptL2dt?=
 =?utf-8?B?MnFONitYdk1MVmVONVdDclIvS200cTZ3cVFMOFcweWtYNmdUSXRPRHlzUjh6?=
 =?utf-8?B?OFE4QUtDeE1CbHN4MDVaenl4THNaTzExUE5mVEVhT3IzUm5GbFBRUXJoZU5O?=
 =?utf-8?B?dUVXd0ZQY1R3MlF2aDA2aGQ1c0JSMFE1bFNERDlTNGJjRU9QZ2NZc2huSk1L?=
 =?utf-8?B?aUVNRUEyK280OHhPWlI4TjdOOTZlczd2L0ZSMnpWbUlQZmVaclF4NlBlRTln?=
 =?utf-8?B?R1NKUExwdk5zQnlxNkFUci8xQUt4T3hLSVNWbGxDTWtuanJCdUI4Q3hMUmFl?=
 =?utf-8?B?aG53aWhvUHAzSkJaVHVoalYwMWhEamRNS2FTSVN3RXVyMUNMaGdSSXZkVVMx?=
 =?utf-8?B?TmVpSWxYUEY5OU5TeXQweCt0ZTFOZVliNzRIWm42QnBrUjlYWi9LdGhjTWo4?=
 =?utf-8?B?clNmclhCNks1ZEtwMkZ5VktYR1VGYkdnMEI2bm5tdDd6SFlDKzlUWTUwR2o0?=
 =?utf-8?B?VkFoMStxUzdqQ0doOU82TTB5dDFCRDY3Q2orVTkyRmJHeG1oalFIR2hsR3NQ?=
 =?utf-8?B?RFA5dkVvZE9qckZxODhCNWllRXBJZE1weE5VTzJCSllKYlg4RHpVbXJOYVZl?=
 =?utf-8?B?YWMxOC9tYi8xUnpSQmxTa2YrNEg5MDNPNnVZbkN6Y1Ird1h0K292MzlsWnNx?=
 =?utf-8?B?c09ac2thQmIrWE5mZjlXYkU4QlhHV0lOMHhHdVVrNjlrZEtodE1ydVNod1h5?=
 =?utf-8?B?SlVtSCtDVjUzNW4wWTBLYWwwQ0tJMDdvV0YrK2llVXQ5ZHU1QjVHSmVabC9X?=
 =?utf-8?B?cVVKMmw5MUswUnZ1R1NFaGFidnRiUWdsa0JoVjJpcHcxaCtWdXhBUUloSEd1?=
 =?utf-8?B?Vndpd0F0SmhmRkFnMjZnVzIyOVlGS2Y0Q1dnSkZHek51YXRnd1ZVQXNTZGcz?=
 =?utf-8?B?UkN6RG5NR1d1NmZwdzltL0VFbWphSDJ2YTBYdWQyazZ3Z3dTcWVTNmxuanlB?=
 =?utf-8?B?RnFxWnNiamZPY2MyTHNzTWRKM1ZxN0ZWcmxtc2h2dExRVkpXSmlaeG9WbjAv?=
 =?utf-8?B?Y2lQTFBhQW1KL0hFWmxqcmlDcm5UWVlLSkVmdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZFhYUUFuaGxjUnBiQjA1cDRiOGFiME9nRzRGZkpEK0VBVU5jK2FwaThhQWlk?=
 =?utf-8?B?Q1ptR205SDR1WWlIUW9iVERXSFl3NGNJYkxhZGZwQXFiK3UwanZJckV2eEV5?=
 =?utf-8?B?aVQ5bjN1c1IxTTlMWllXZzdRYmE4TkhxcnNRNERKZjRxaUt2OFRub1pWMmxI?=
 =?utf-8?B?K1c5WlFJdUliMkUwNGtMcWZZWVJpNmliL0NVWURIejBMbU1XSFpKVkNrT0FH?=
 =?utf-8?B?V0x6SkJpUXZnak5sSm5pdk9IU3BKc1ZpalNWSnZtY2I3aEVZWHlRUkVndHpq?=
 =?utf-8?B?TE92QVE5VnB5bUgxaDFpYk12REk1ODlMR3lCd3d0UlR5Ylc5K3d0U3pDZEJS?=
 =?utf-8?B?TXg3dWROSlR4eHNuSms4ZmtPMS9PdThtMys2MzhQc2Y4NWFTL3NkMlY4N09o?=
 =?utf-8?B?cnZGbmtBSTVDWFRlN0VPUFFhWmlrMTFTSCtuV1hrclZDdWRzVjFrU1YwaGQ1?=
 =?utf-8?B?SUxsT0pSaGdUdStmYVhZV3pYa1B5VzE0MW41Uml3TEFJL1I3b2ZTTFJQOTBt?=
 =?utf-8?B?ZjB6QVRsYk1OZFYwZk9TWGVocVFOa3VWUytiS0dqYXJkQVBrbkpOa0VROTFa?=
 =?utf-8?B?d1paWlRyTldrZUNSTFVaN3FmRmdmZFhZZFZ0Q0FybU1RN3IveTJ1L1JtOE8w?=
 =?utf-8?B?SzBPZ2pHQ1lBb3FQTXNFSEFPSldpQWp4ejl1cGRaaUpxajlLd093VGQ2NDdH?=
 =?utf-8?B?cjRaRkxYSWJqYStucVpkWmNUNXdlSUFuc0xheWpvS0FZSG55QW9kNTNpM1ZB?=
 =?utf-8?B?S1pISXBieVVRRzl1OVdKYlRDaTF6NFZzNTVHMzVvN0pVcUpLTG52T1R5QXRH?=
 =?utf-8?B?THhRbFdZVCtnbmNKc01XdDB2QmxXWFJYbFB1YytrSHVHSGhaYlpqUjE5Z3Vw?=
 =?utf-8?B?Ulg1Tyt6V0p4R2lxZ0xPY01NMDZPZ3E1Yk92cFZHM3JxTjd2WWdjN0IwVXFx?=
 =?utf-8?B?anM4NllWT2QwNWVWcHFtQk53WmUvM2VkU2F3Q1NvOXA5cnJDNHlTNDl6QzY4?=
 =?utf-8?B?ajVvS1dOcGRFWEZRNFB0SnhKY3NFekVJUitJUUxIRSs4dlNyYlNGRTdpS0p5?=
 =?utf-8?B?UnhoRERBNzhFRzd2eHFNaWQvQk9NQnY5NUwrai9ONTJiMmZPYjdhZnd2UDJ3?=
 =?utf-8?B?QlZEcTdUWlNSb3dHMzBWMkxrUHNOQmNNdDNITWlzNjVaZGhIdDROdFFjUUs1?=
 =?utf-8?B?cCtTQzF4OHRXN0JLK21mTFlKVXhBaEY2M0FTWUJ4U0ZMaUNSS3c0UElGdUNI?=
 =?utf-8?B?WnFNQ2hVNXJNV3BIakh3cHI1UWptWTF0RnVGYmlYZi9CdTUwWDVzSGFaTWVC?=
 =?utf-8?B?U0xrOUF2amNZVzRPOVhHYzhISmtSem9GY21jbnBxZk9LZWFWSGZoYnhVZElk?=
 =?utf-8?B?d0NCc1pPMTBPRmJaaVBDM2VqZGNGdTlwOVFrWVNZbHFqOTZaMklyeHY1SlJ1?=
 =?utf-8?B?eVdSSGdCdS80OExCak82V2VQaWNYck8vclVvZXpKRTFycEM2KzV5eDRiWU00?=
 =?utf-8?B?cXhJdTlVQ3FoUjM3OXFtVEcrMDdwdGtBemtJNHJIT1JTK2I5aWkvSVpoMGNx?=
 =?utf-8?B?aEw2SjlMZytNVmVCaGF2Q0pOeXAwazZsYnV0NFVSZk5KZlc0WHIyeGZaV09a?=
 =?utf-8?B?Y2xXbUZaOStOV0drVkpoWHpicTd0VWMzeUZERmkyaGJjVkpqb081LyttQzQ5?=
 =?utf-8?B?eER1NXNPNGJDbE15NjBwTERDd0Q1OEdKL3EyZDMwT0tPZ0ZMU09yTm9PZW5H?=
 =?utf-8?B?Vk1nUTdsOERDTXRNMGx5RFZNQWJZNkZjQmplQUpIc0ZkcFQ0clFNRXNIUldF?=
 =?utf-8?B?WWRYRG9MaEZaNUhSRmJsOFNHa1hFYjcyWWpKRVo4Q2w1SUtWaUQ1RjYrYXhP?=
 =?utf-8?B?YU43VHBwT1pMb3RSajhweVlTZnhrWDFFNis0cWZwWldpRW1TSkdHVlZlOVlt?=
 =?utf-8?B?V1BQYk9wajFPVlJIN1ZnU0crOFBBNE4yTExtKzZKV0szdDVjaTdsa1JSdGxr?=
 =?utf-8?B?czRmUWIzRURuaDA5Zm9BN0ZmQmMzTXFwK0wrYVRBSlBOUzVCcU1qREZYaU1S?=
 =?utf-8?B?MngyTXFHRWx6ZVJSeUg5NVhPRWU4SGNLSmtuY25PaThUVFZLNXF3OFdBZ2My?=
 =?utf-8?Q?AQhNFH4fMKwcMFCAc3BRz6A2Y?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b55e8444-116d-4eaf-a034-08de16b92095
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2025 07:02:30.4554 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UV5vozkEX/55gVipbm7LY8x5XKCw1J4bPDLqL0c0IRR5/twdaXRhZRmjR6e8fEZ2WpPO/spQURCIv/9Nff9sMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8510
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

PiBTdWJqZWN0OiBbUEFUQ0ggdjYgMS81XSBkcm06IERlZmluZSB1c2VyIHJlYWRhYmxlIGVycm9y
IGNvZGVzIGZvciBhdG9taWMgaW9jdGwNCj4gDQo+IFRoZXJlIGNhbiBiZSBtdWx0aXBsZSByZWFz
b25zIGZvciBhIGZhaWx1cmUgaW4gYXRvbWljX2lvY3RsLiBNb3N0IG9mdGVuIGluIHRoZXNlDQo+
IGVycm9yIGNvbmRpdGlvbnMgLUVJTlZBTCBpcyByZXR1cm5lZC4gVXNlci9Db21wb3NpdG9yIHdv
dWxkIGhhdmUgdG8gYmxpbmRseQ0KPiB0YWtlIGEgY2FsbCBvbiBmYWlsdXJlIG9mIHRoaXMgaW9j
dGwgc28gYXMgdG8gdXNlIEFMTE9XX01PREVTRVQgb3IgYW55LiBJdCB3b3VsZA0KDQpPciBBbnkg
PyBJIHRoaW5rIHlvdSBuZWVkIHRvIHJlcGhyYXNlDQoNCj4gYmUgZ29vZCBpZiB1c2VyL2NvbXBv
c2l0b3IgZ2V0cyBhIHJlYWRhYmxlIGVycm9yIGNvZGUgb24gZmFpbHVyZSBzbyB0aGV5IGNhbg0K
PiB0YWtlIHByb3BlciBjb3JyZWN0aW9ucyBpbiB0aGUgbmV4dCBjb21taXQuDQo+IFRoZSBzdHJ1
Y3QgZHJtX21vZGVfYXRvbWljIGlzIGJlaW5nIHBhc3NlZCBieSB0aGUgdXNlci9jb21wb3NpdG9y
IHdoaWNoDQo+IGhvbGRzIHRoZSBwcm9wZXJ0aWVzIGZvciBtb2Rlc2V0L2ZsaXAuIFJldXNpbmcg
dGhlIHNhbWUgc3RydWN0IGZvciByZXR1cm5pbmcNCj4gdGhlIGVycm9yIGNvZGUgaW4gY2FzZSBv
ZiBmYWlsdXJlIGNhbiBzYXZlIGJ5IGNyZWF0aW5nIGEgbmV3IHVhcGkvaW50ZXJmYWNlIGZvcg0K
PiByZXR1cm5pbmcgdGhlIGVycm9yIGNvZGUuDQoNClRoaXMgc2VudGVuY2Ugc2VlbXMgYSBsaXR0
bGUgd2VpcmQgY2FuIHlvdSBjb3JyZWN0IHRoaXMuDQoNCj4gVGhlIGVsZW1lbnQgJ3Jlc2VydmVk
JyBpbiB0aGUgc3RydWN0IGRybV9tb2RlX2F0b21pYyBpcyB1c2VkIGZvciByZXR1cm5pbmcNCj4g
dGhlIHVzZXIgcmVhZGFibGUgZXJyb3IgY29kZS4gVGhpcyBwb2ludHMgdG8gdGhlIHN0cnVjdA0K
DQpJbiB0aGF0IGNhc2Ugd2h5IGxlYXZlIHRoZSBlbGVtZW50IG5hbWUgYXMgJ3Jlc2VydmVkJyBz
aG91bGQgdGhhdCBiZSBjaGFuZ2VkDQoNCj4gZHJtX21vZGVfYXRvbWljX2Vycl9jb2RlLiBGYWls
dXJlIHJlYXNvbnMgaGF2ZSBiZWVuIGluaXRpYWxpemVkIGluDQo+IERSTV9NT0RFX0FUT01JQ19G
QUlMVVJFX1JFQVNPTi4NCg0KSSBkb24ndCBzZWUgdGhlIGNvZGUgZm9yIHRoaXMgaGVyZS4NCg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogQXJ1biBSIE11cnRoeSA8YXJ1bi5yLm11cnRoeUBpbnRlbC5j
b20+DQo+IC0tLQ0KPiAgaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oIHwgNDENCj4gKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA0
MSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9kcm1f
bW9kZS5oIGIvaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oDQo+IGluZGV4DQo+IDFlMGUwMmE3
OWI1YzhkYjIwMGNmOWZkMzVlZGZlMTYzZDcwMWNiZDUuLjFlOWVlYWU0NzJlNzRiYmQxYjVlMGI2
ZjcNCj4gOWY5NzgyY2FmYWY1YjZlIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL2Ry
bV9tb2RlLmgNCj4gKysrIGIvaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oDQo+IEBAIC00NSw2
ICs0NSw3IEBAIGV4dGVybiAiQyIgew0KPiAgI2RlZmluZSBEUk1fQ09OTkVDVE9SX05BTUVfTEVO
CTMyDQo+ICAjZGVmaW5lIERSTV9ESVNQTEFZX01PREVfTEVOCTMyDQo+ICAjZGVmaW5lIERSTV9Q
Uk9QX05BTUVfTEVOCTMyDQo+ICsjZGVmaW5lIERSTV9NT0RFX0FUT01JQ19GQUlMVVJFX1NUUklO
R19MRU4JMTI4DQo+IA0KPiAgI2RlZmluZSBEUk1fTU9ERV9UWVBFX0JVSUxUSU4JKDE8PDApIC8q
IGRlcHJlY2F0ZWQgKi8NCj4gICNkZWZpbmUgRFJNX01PREVfVFlQRV9DTE9DS19DCSgoMTw8MSkg
fCBEUk1fTU9ERV9UWVBFX0JVSUxUSU4pDQo+IC8qIGRlcHJlY2F0ZWQgKi8NCj4gQEAgLTEyMDUs
NiArMTIwNiw0NiBAQCBzdHJ1Y3QgZHJtX21vZGVfZGVzdHJveV9kdW1iIHsNCj4gIAkJRFJNX01P
REVfQVRPTUlDX05PTkJMT0NLIHxcDQo+ICAJCURSTV9NT0RFX0FUT01JQ19BTExPV19NT0RFU0VU
KQ0KPiANCj4gKy8qKg0KPiArICogZW51bSBkcm1fbW9kZV9hdG9taWNfZXJyX2NvZGUgLSAgZXJy
b3IgY29kZXMgZm9yIGZhaWx1cmVzIGluDQo+ICthdG9taWNfaW9jdGwNCj4gKyAqIEBEUk1fTU9E
RV9BVE9NSUNfSU5WQUxJRF9BUElfVVNBR0U6IGludmFsbGlkIEFQSQ0KPiB1c2FnZShEUk1fQVRP
TUlDIG5vdA0KPiArICoJCQkJICAgICAgIGVuYWJsZWQsIGludmFsaWQgZmFsZywgcGFnZV9mbGlw
IGV2ZW50DQo+ICsgKgkJCQkgICAgICAgd2l0aCB0ZXN0LW9ubHksIGV0YykNCj4gKyAqIEBEUk1f
TU9ERV9BVE9NSUNfQ1JUQ19ORUVEX0ZVTExfTU9ERVNFVDogTmVlZCBmdWxsIG1vZGVzZXQNCg0K
U2hvdWxkIHRoaXMgYmUganVzdCBiZSBDUlRDX05FRURfTU9ERVNFVCB0byBtYWtlIGl0IGRpZmZl
ciBmcm9tIHRoZSBiZWxvdyBkZWZpbml0aW9uLg0KDQo+IG9uIHRoaXMNCj4gK2NydGMNCj4gKyAq
IEBEUk1fTU9ERV9BVE9NSUNfTkVFRF9GVUxMX01PREVTRVQ6IE5lZWQgZnVsbCBtb2Rlc2V0IG9u
IGFsbA0KPiArY29ubmVjdGVkIGNydGMncw0KPiArICogQERSTV9NT0RFX0FUT01JQ19BU1lOX05P
VFNVUFBfUExBTkU6IEF5bmMgZmxpcCBub3Qgc3VwcG9ydGVkDQoNClR5cG9zIGhlcmUNCiogRFJN
X01PREVfQVRPTUlDX0FTWU5DX05PVF9TVVBQX1BMQU5FDQoqIEFzeW5jDQoNClJlZ2FyZHMsDQpT
dXJhaiBLYW5kcGFsDQoNCj4gb24gdGhpcw0KPiArcGxhbmUNCj4gKyAqIERSTV9NT0RFX0FUT01J
Q19BU1lOQ19NT0RJRklFUl9OT1RfU1VQUDogTW9kaWZpZXIgbm90DQo+IHN1cHBvcnRlZCBieQ0K
PiArYXN5bmMgZmxpcA0KPiArICogQERSTV9NT0RFX0FUT01JQ19BU1lOQ19QUk9QX0NIQU5HRUQ6
IFByb3BlcnR5IGNoYW5nZWQgaW4NCj4gYXN5bmMgZmxpcA0KPiArKi8gZW51bSBkcm1fbW9kZV9h
dG9taWNfZmFpbHVyZV9jb2RlcyB7DQo+ICsJRFJNX01PREVfQVRPTUlDX0lOVkFMSURfQVBJX1VT
QUdFLA0KPiArCURSTV9NT0RFX0FUT01JQ19DUlRDX05FRURfRlVMTF9NT0RFU0VULA0KPiArCURS
TV9NT0RFX0FUT01JQ19ORUVEX0ZVTExfTU9ERVNFVCwNCj4gKwlEUk1fTU9ERV9BVE9NSUNfQVNZ
TkNfTk9UX1NVUFBfUExBTkUsDQo+ICsJRFJNX01PREVfQVRPTUlDX0FTWU5DX01PRElGSUVSX05P
VF9TVVBQLA0KPiArCURSTV9NT0RFX0FUT01JQ19BU1lOQ19QUk9QX0NIQU5HRUQsDQo+ICt9Ow0K
PiArDQo+ICsvKioNCj4gKyAqIGRybV9tb2RlX2F0b21pY19lcnJfY29kZSAtIHN0cnVjdCB0byBz
dG9yZSB0aGUgZXJyb3IgY29kZQ0KPiArICoNCj4gKyAqIHBvaW50ZXIgdG8gdGhpcyBzdHJ1Y3Qg
d2lsbCBiZSBzdG9yZWQgaW4gcmVzZXJ2ZWQgdmFyaWFibGUgb2YNCj4gKyAqIHN0cnVjdCBkcm1f
bW9kZV9hdG9taWMgdG8gcmVwb3J0IHRoZSBmYWlsdXJlIGNhdXNlIHRvIHRoZSB1c2VyLg0KPiAr
ICoNCj4gKyAqIEBmYWlsdXJlX2NvZGU6IGVycm9yIGNvZGVzIGRlZmluZWQgaW4gZW51bQ0KPiAr
ZHJtX21vaWRlX2F0b21pY19mYWlsdXJlX2NvZGUNCj4gKyAqIEBmYWlsdXJlX3N0cmluZ19wdHI6
IHBvaW50ZXIgdG8gdXNlciByZWFkYWJsZSBlcnJvciBtZXNzYWdlIHN0cmluZw0KPiArICogQGZh
aWx1cmVfb2JqX3B0cjogcG9pbnRlciB0byB0aGUgZHJtX29iamVjdCB0aGF0IGNhdXNlZCBlcnJv
cg0KPiArICogQHJlc2VydmVkOiByZXNlcnZlZCBmb3IgZnV0dXJlIHVzZQ0KPiArICogQGNvdW50
X29ianM6IGNvdW50IG9mIGRybV9vYmplY3RzIGlmIG11bHRpcGxlIGRybV9vYmplY3RzIGNhdXNl
ZA0KPiArZXJyb3IgICovIHN0cnVjdCBkcm1fbW9kZV9hdG9taWNfZXJyX2NvZGUgew0KPiArCV9f
dTY0IGZhaWx1cmVfY29kZTsNCj4gKwlfX3U2NCBmYWlsdXJlX29ianNfcHRyOw0KPiArCV9fdTY0
IHJlc2VydmVkOw0KPiArCV9fdTMyIGNvdW50X29ianM7DQo+ICsJY2hhciBmYWlsdXJlX3N0cmlu
Z1tEUk1fTU9ERV9BVE9NSUNfRkFJTFVSRV9TVFJJTkdfTEVOXTsNCj4gK307DQo+ICsNCj4gIHN0
cnVjdCBkcm1fbW9kZV9hdG9taWMgew0KPiAgCV9fdTMyIGZsYWdzOw0KPiAgCV9fdTMyIGNvdW50
X29ianM7DQo+IA0KPiAtLQ0KPiAyLjI1LjENCg0K
