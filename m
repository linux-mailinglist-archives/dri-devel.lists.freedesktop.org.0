Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E507ECD6B9C
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 17:56:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FFF810E6A2;
	Mon, 22 Dec 2025 16:56:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RZ1o7f24";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAAA110E08E;
 Mon, 22 Dec 2025 16:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766422612; x=1797958612;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=P3WsFE0jkfnMDDYWq3iqZW0l0CsDFpkAuX1OsjMg0XA=;
 b=RZ1o7f24SsSMU5l+Z6yFt9UI1oMm/STJfWdjb/CcAXbxCXmO4Hi4HP8j
 9/QSFmTYcDoZ50O/BVWRnalDuyRr4WqZb3/tiA1C3rOwUjDruj+Za06e2
 X4/dqQqTLOjnHL5FrGnWfLa0VTgdsYrigZGGeHQQsDY3niZD5kkeVDeUg
 Fqh8c8bYgEjxP8tyS27ic/MkMs/BYN2EEnwwrzfEPanXQB1ceIXE4epFp
 9VPgOVE+cOQRegyKqmjgC3PoCNM71AZeAj6PZH3t+uTWpfzuAsJk601AH
 1jLVT0TKSRQ/2/XMmi6GnigpIGNlIThpVDnLmHB0WVOeQcSOyiD2kyFCP Q==;
X-CSE-ConnectionGUID: yw3cwbmIS3yhfcWRQqFLEg==
X-CSE-MsgGUID: uzeBnvWwRmKxKfHaNocEFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68160660"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="68160660"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 08:56:51 -0800
X-CSE-ConnectionGUID: yGEpo2FvRQG8zUihx3Hb+w==
X-CSE-MsgGUID: huF3rpRASTWPbsKOUOCTjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="199596989"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 08:56:51 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 08:56:50 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 22 Dec 2025 08:56:50 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.58) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 08:56:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wGpk/q5Kjb+EPoRjd6asr8GU1de9BbPO7S4PvcLgRK2XJBNt+rQ60cKifJEIaBNtrvk9dQI0VPvx2jgi8SQLM+tGmsGySRwB6RKODWNy+HiPav4QRwTDknoB2W+4FOTb1mgKVxFhtfBFk+3VstBZ66HtjVT0dv00NGtcsISNduNirwdiLgYMbPxCeWGjeXgkqqO4I0xfu1G8VfzwV9wPwu1mQWhKp4wSKElzaZitKqDLRgzKU/hYpuhzCs5rq0VH36AKKV1+VvLVF3+yPzMaKpazhMS3Y5nOobZrTkl4dUpqTc5glxkVRXZuKNKahGkOzbNAfcHh5xxqO/ZdvwDvzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P3WsFE0jkfnMDDYWq3iqZW0l0CsDFpkAuX1OsjMg0XA=;
 b=yWVfzqBDk3rPuvEnXBFq9RCWVUaP5RaWwmtV1n2FTkleIh1A1l6AD4RNDaeyQ6B719bMelqmKnB5ZfDy2yB5cB/QHAtUBjRT0Zk7Fp53w6srGjhDkF6jou8cjWGnN5IH7E78C+ga0QEazXnPk/K72zRGJ5pbShknn5nqunz03gZ8waf32xdfW1ZyfT/cvTYoa1u3ImHlebRvamH0c6I9u6QyiWGIExfjoJMBR/p+AZSuqO16tWOuLJy1M/XZeRI/oenIVrXlk4T70Oc3iio/ATbQVo1Z7dZjkqNl0AftRz6giXLFyD3k51AQQCAXNc9wjpqCsrNmFKZ+Lw2sJaCS3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS0PR11MB7285.namprd11.prod.outlook.com (2603:10b6:8:13d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 16:56:47 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 16:56:47 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "calvin@wbinvd.org" <calvin@wbinvd.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "lucas.demarchi@intel.com"
 <lucas.demarchi@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "simona@ffwll.ch" <simona@ffwll.ch>
Subject: Re: [PATCH] drm/xe: Don't use absolute path in generated header
 comment
Thread-Topic: [PATCH] drm/xe: Don't use absolute path in generated header
 comment
Thread-Index: AQHcSnWHfrNN2CvjF0eYQOqcg61G2LUs0eiAgAFhFgA=
Date: Mon, 22 Dec 2025 16:56:47 +0000
Message-ID: <40b24664850c231b1a2fd80a084d4a7f32b8148e.camel@intel.com>
References: <7fa5ef0acc89a9d94c328f6651c1d405bcd833a4.1761920974.git.calvin@wbinvd.org>
 <aUhQHcgL4U-HgSv6@mozart.vkv.me>
In-Reply-To: <aUhQHcgL4U-HgSv6@mozart.vkv.me>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYYPR11MB8430:EE_|DS0PR11MB7285:EE_
x-ms-office365-filtering-correlation-id: 7f28440c-4913-432d-02a9-08de417b1850
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ajNWdnJyY2NEdFdOZWJqTjZPbXkyM3VudG1IRGx5S2VqZ1ZtblR6RGhEbGNv?=
 =?utf-8?B?TDZVK1hCYkYxa0k5YW1GU2g0bWxkU3h2bG9oMnU0TnJmM1VwQzRxaHJXYjBF?=
 =?utf-8?B?WWFjcGNTRlFmUjdQQzR2Z05LRCtqWEFzN2RObERQdk9mTHN6L1RVS25Wbmsz?=
 =?utf-8?B?UjdSbUk2MkZWU1VFV1MxV3pSMDBZU3RpS2QwbTNIVUNieGlNVHVLQXlNZy9M?=
 =?utf-8?B?WDlhbms5WC9HZGEwS2wzeVVqNjZxaXJqUU44MG9INmx2SVhOVkZ6WGJNeXpn?=
 =?utf-8?B?SlN5Z1BVVnpBdlc0RytjeDhSalFYUm54ZTJsUzZFQ0Z6UGJSSUwvUHh1VFFY?=
 =?utf-8?B?OTdrSnhXOVQvUFBhQ0ttUzI2UVdNN0dSWFEyaW1LOU9NRE5JWTRUQlFhOWZp?=
 =?utf-8?B?bThLRjVFVENoM29IYUxhM1lzUmxPV2tCV2RHMVJXdy8vbFhldGlZaDhvejNh?=
 =?utf-8?B?YTJsNU9BZU05VTUrUllZME5FRzF3U1lwSGNsaStrTktEclFzUnREelJZbGxr?=
 =?utf-8?B?UzhvYUNhSDJVUThZOVR6OVhCMFEvMHM0Yjk2MTFtMTNQUW9RemYzRTQ4cjB0?=
 =?utf-8?B?SC9zakJSNlEwZUlQRkhUN2N1bzJINUo5cFdoeUt3WVh1VWRGdWJxQi9ReWlx?=
 =?utf-8?B?TE5Obm9QOEFHMkl2TG5UcmxtZ3lScjgybkR4QjVtRzlUUFZST2JIK3hZUG9r?=
 =?utf-8?B?SUVtNVZHUEltbS93ZmF4cklGV3NhdUtmNHkyVG14cFVVQTFQOFR5QnF3RFFt?=
 =?utf-8?B?bWxld0ZsUW1Ua1dMZ1BGSGVTWXR0YjdDRXdmdE91OEFDanNxV0NpeFlEak12?=
 =?utf-8?B?Sm9wZC85djdwVjZDS1RCbWYwcGpVak4yR0ZxRlAzdkJqQVQwbkRidDY2RGVS?=
 =?utf-8?B?OUNtcG51b1haeXJHam9hTmUzQ2tLNks2SmQ2Y0h5VERKaHY2dm5GcUFIM0dE?=
 =?utf-8?B?dHBLOUJ3Wkl0bkVqckl6TmNiaGRxUFFod1ZFY0tWdEVQM2tLbks5dVIvM1kr?=
 =?utf-8?B?RmdHbDgxNldPc2xtWU9WS1EvY3NKVnNWYWRXcHYyNlM4cnArQ2VKRzhOSVAy?=
 =?utf-8?B?SHg3ZkZybzJhUFEyZi8wNjB1c0t1QTNtbzJHZndtSXovSmNpd3JDakhtNE9N?=
 =?utf-8?B?WUdmUld1dXJaVkw5NVJ6M3FzZ01pdEhQYkNjVi8wUEFab0xoeGtBM0xQVk9o?=
 =?utf-8?B?YWxLNFZBbVBBdkFnZzNtZ25GRkdsVmpWQk9aY1IyZHZkcjhFR1JqTHhVTURH?=
 =?utf-8?B?bjNWb0ltbWlvVER3RTNlaUNIZFZ0R3U4VEs1c25nN1pzOGRMZ2t3VEJtay9j?=
 =?utf-8?B?eVllTE1ueUZRT2hLcGNBNVZLVHByV3BBMEpRdkkySzhpZWlRbi82UEszcWFF?=
 =?utf-8?B?a054MmJMeG40dHVSei8zU0pIMjRDbmw1VG51WE04R1E3MCsxK1JwRllFbHcr?=
 =?utf-8?B?OUh6WmxuWTNHQUFGbFAvQVVMSThCbVlFbEM5SGZWYytmNG5iVHpIMDFOTkxn?=
 =?utf-8?B?eEVmdDljUTk3UlhZanMxbi9JM0FzU0dncmMzUWhZU0JwVkVxLzVKYnhQOWJQ?=
 =?utf-8?B?MFRKUXdyY1UwM1ZYZDJVREZQTEt2VE4wTlhuN0lJRVJOL2xwZmRSWHNCYUFi?=
 =?utf-8?B?RFluRDlwTXJ4TGRxN1RLZjZyUC9lN01VbGVIUzZxRktETlFUaGhySUNBTjVJ?=
 =?utf-8?B?a1BoSjlIdWsxbTNaaEl2TGlwdlBWU1YvN2hXMEFZU3NxNlJpSGVqRjE1c1RW?=
 =?utf-8?B?c0gwdEFaNjZVNWRVVm5ldHdjMUNCNnhMS29OY3Bjb09idVBqQTEwaS96bnZz?=
 =?utf-8?B?UjRWeGZTOEJVaHFSdG5CUWtvazlIZmwrUml2R0VpRThyYWtGY0g5UVFKUG5B?=
 =?utf-8?B?aUJ2ODc0RnZwVEFMSlo3UDcrbnF5bDh5R1dURlNJS01nR3gxem9XWEVXeGNG?=
 =?utf-8?B?eHpKcEYrS252a2Rxc2JVVjc5dWZTSC9xc3N6eVVZZ29SSUlLc2hMSVcyejRL?=
 =?utf-8?B?czNQRGErZjRFMTd6US9zWnB6T00xZStKMW4xRjU2aUZRQ1A5UFBmUFNsbzNk?=
 =?utf-8?Q?E7QKbd?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R2lubjA1TmxjM2Z4UW9iSENTbVFINlpFbUwzb1h6Nm1pOWRsd0F4WkI5MC9N?=
 =?utf-8?B?N1pOZXNNY1ZQdTlqRG00UU5QSkRCY2dqVnNGTEd3dGNzVno4ajEwVkFJY3Fu?=
 =?utf-8?B?UExvSnE5NVFGOXFRai9wa1ZJeHhtTWhiaVBsa2duc2wwZkt1UXlaYWtGdWtT?=
 =?utf-8?B?dFVSaitHQW4wdm1GQWY3dFZGWmRjU200ekFzK08vMVphb1JrZzlVdnNoc2sz?=
 =?utf-8?B?WmdaYVZYaklkUFhIeGQ4TS82RERrWDFmcHRFM2VneWozb29STjdrSiszMlh2?=
 =?utf-8?B?Z1ZvbDJnM29iditHZVoxdjFnQkNmUkV0VHN6OHgvNUphenRXYllBa2syOTFm?=
 =?utf-8?B?dnZuMTI4eXU4YitiV2xTKytSTVpxQkFmajFuUVhvZTFLQ0h1Q0lwL3o3dEVR?=
 =?utf-8?B?Qm14aUFlbWNIYTdzbm1HVEhyald6VlUxaWZZRGQ4cE94em5WNnZjL21hblM0?=
 =?utf-8?B?QnBTTldYSGhVUEpHMjlVTnQ5WEZWaGlzV0NFc0JOZkF5S2NnNVVYS3Iwa1RV?=
 =?utf-8?B?d0ZlM3pTWW9PaWJEdUprTm9DaVZTazFmSE1tWVNTSmI1Mkg0a0lPUjJOdnVJ?=
 =?utf-8?B?eXloVjZsbXh5V1kvdmZndUFXL2oyZW5HaEVrZkwyekV3MUEyZUVicGExL3VE?=
 =?utf-8?B?aCtpVkpsdThHRTdIWkNsN05lMzNUMjI2czVDQitRQWFVSUxYWVdnL3hKaXQy?=
 =?utf-8?B?SGQ5SzdPOCttS3NkOGFHU3lxRkV6Qll3ZlZ4OG10VFBVSlA5eVFHSUI2dXRJ?=
 =?utf-8?B?WCtFa3VjVmFZL1ROcWpIRGFYbkxZUDBUQ0YzUXI4dHkrNjk3eEp6ejNzSVE5?=
 =?utf-8?B?TXUxbWNDRGJOb29HUHNSZmR6NFYzbVhkWW1NR3ZlWlNqVlh6N25DbGJYWlpF?=
 =?utf-8?B?eVEwTmdzMk92OW5wY3ljeWsvbWI1eXhxTlVQZFFxdStScHBQYXorOW9mb2tl?=
 =?utf-8?B?VVV3NGlNR2NQSkJmTHlROUJ5WCtNV2R1QXdERnA4T0hJcGNVNjJUYS9JVkE5?=
 =?utf-8?B?UlNpdlpsNG9uSWVqY0VnZmpjWThkM25CTldGcFdNWnZhSThudlVaVG5mbStB?=
 =?utf-8?B?RkhONC9aTklFREg3WGt1c0t0ZUJpd2pKemdvVmN2OTYvMEVpUGxWR3V4VXcv?=
 =?utf-8?B?NFA1TUFZc0plV1VZTmVtemZMUCsyUXNJRlhsOVFCbWFIS0YyUE9wM1VidnFa?=
 =?utf-8?B?NkxXVlNSbkJlaCsvSm42L3grOU9LTHJGbjNRQ254dzNVRVdRU0Q0TFZHa1c2?=
 =?utf-8?B?bUJjWjVMMzNIMlg2U3dZOGFlZERqUHdSK3JJbTZtMmkwRHBxeDF4Q2EzTGMv?=
 =?utf-8?B?emVOajB6WTdnZTl4NFpJd0VpcHlLQnp2UXpBa2ZDdCtxM0ZhSWZWVDZWMi9v?=
 =?utf-8?B?UHFPU3FNbFZRN29sdEE2eTkvMzVkNkM4Y1l1NlNNZXRqWlNCeFd5RUF3bmFE?=
 =?utf-8?B?NytTL3MrdlZ5TUFraU5jem9icER2dEw1MHNwamtCV01lOEVEbkdUQkswRVNa?=
 =?utf-8?B?bXZ6a0VuSFZobTZMa2NlZ09VZml4bTZ0SzFKOGRaY3lwRjdNcFl3VGtaK2JI?=
 =?utf-8?B?d09XWWFPS1pkYzB3WFpwK1RXczhuVytuYUZIVEpWeUpPSVNaR1ZBUmR3SDJ3?=
 =?utf-8?B?SkJnKzNpRWs5ZTRSZW45REhlekI0VkFWeVppOUZwM20yT3EweForaHVYQU81?=
 =?utf-8?B?ZzRQZEFGWkNYTXFYSUxjS2U1Q1pWdW85cENSRGh5NDRzc0xhODV3WGtDMmhs?=
 =?utf-8?B?RjZ2cVFMaDcxNDJ1aTFkVHI5dTEzZWNyRVZidlFmWGVhMFp1TlRwczNDVDhE?=
 =?utf-8?B?cDM3cDB4Q1AySTRxU0pXbk81OVFRNXJzTUlTdDFLcGxJMWpESFdVNHJBVG9w?=
 =?utf-8?B?c29qL0Q5aC8wUExjalJpdHBQMmtkVlloUVRCYjBHVTNXSHg1WFR3cmMybmN3?=
 =?utf-8?B?aG1RbU1OczFNSnFMR3A5eUUzMGM1WmRFYm90WXlEckExcmxhakZSMWJRMElu?=
 =?utf-8?B?TStUUVZabElhS1ExTDNKTWxBcEpzaGx1bXF0WEpmMzdpSjJPcURqM1hBeFpn?=
 =?utf-8?B?U2lNclhER2VVelU4cGs4dzNIV3R4U3lHL1FWWEV4ZTM0YnR2dyswNSt2bXlE?=
 =?utf-8?B?NVdYcGhtYVd1bnNrWTlsVzFHdVZ0ODlib1ljRnEzTzA4eFJBaUozMVU5dUJZ?=
 =?utf-8?B?aVhhMElSUHl1c2hVd1pIa2tIdVVmTnlWbDlEdXJLclFVWm5sOUtCV0h1Q2t4?=
 =?utf-8?B?Nk1kNk9iVVpueVFNK3hCZGFnYU1IOFBKaXFRdDNGczB4ZFBsa3VwTlRzaHRs?=
 =?utf-8?B?Z1c2S1FrTzFTemREcFJnUEN4N2dPNnRoODFaWlliNm80QWVJT0RnSHFSSzVW?=
 =?utf-8?Q?h4224gWKYFPCxQtM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <19ABC0F3D14D7945A6A770D5370CFB6A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f28440c-4913-432d-02a9-08de417b1850
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2025 16:56:47.7499 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KZXuqp+fZTUNyV6WczaKH510eCjB86Hla5GgRZ3kVIVZLJng2VNCC3q9Kc4j9qQP6QWBYcivKDS/cshadeCLHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7285
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

T24gU3VuLCAyMDI1LTEyLTIxIGF0IDExOjUzIC0wODAwLCBDYWx2aW4gT3dlbnMgd3JvdGU6DQo+
IE9uIEZyaWRheSAxMC8zMSBhdCAwNzo0OCAtMDcwMCwgQ2FsdmluIE93ZW5zIHdyb3RlOg0KPiA+
IEJ1aWxkaW5nIHRoZSBYRSBkcml2ZXIgdGhyb3VnaCBZb2N0byB0aHJvd3MgdGhpcyBRQSB3YXJu
aW5nOg0KPiA+IA0KPiA+IMKgwqDCoCBXQVJOSU5HOiBtYzpob3VzZTpsaW51eC1zdGFibGUtNi4x
Ny1yMCBkb19wYWNrYWdlX3FhOiBRQSBJc3N1ZToNCj4gPiBGaWxlIC91c3Ivc3JjL2RlYnVnL2xp
bnV4LQ0KPiA+IHN0YWJsZS82LjE3L2RyaXZlcnMvZ3B1L2RybS94ZS9nZW5lcmF0ZWQveGVfZGV2
aWNlX3dhX29vYi5oIGluDQo+ID4gcGFja2FnZSBsaW51eC1zdGFibGUtc3JjIGNvbnRhaW5zIHJl
ZmVyZW5jZSB0byBUTVBESVIgW2J1aWxkcGF0aHNdDQo+ID4gwqDCoMKgIFdBUk5JTkc6IG1jOmhv
dXNlOmxpbnV4LXN0YWJsZS02LjE3LXIwIGRvX3BhY2thZ2VfcWE6IFFBIElzc3VlOg0KPiA+IEZp
bGUgL3Vzci9zcmMvZGVidWcvbGludXgtDQo+ID4gc3RhYmxlLzYuMTcvZHJpdmVycy9ncHUvZHJt
L3hlL2dlbmVyYXRlZC94ZV93YV9vb2IuaCBpbiBwYWNrYWdlDQo+ID4gbGludXgtc3RhYmxlLXNy
YyBjb250YWlucyByZWZlcmVuY2UgdG8gVE1QRElSIFtidWlsZHBhdGhzXQ0KPiA+IA0KPiA+IC4u
LmJlY2F1c2UgdGhlIGNvbW1lbnQgYXQgdGhlIHRvcCBvZiB0aGUgZ2VuZXJhdGVkIGhlYWRlciBj
b250YWlucw0KPiA+IHRoZQ0KPiA+IGFic29sdXRlIHBhdGggdG8gdGhlIHJ1bGVzIGZpbGUgYXQg
YnVpbGQgdGltZToNCj4gPiANCj4gPiDCoMKgwqAgKiBUaGlzIGZpbGUgd2FzIGdlbmVyYXRlZCBm
cm9tIHJ1bGVzOiAvaG9tZS9jYWx2aW5vdy9naXQvbWV0YS0NCj4gPiBob3VzZS9idWlsZC90bXAt
aG91c2Uvd29yay1zaGFyZWQvbnVjMTRydmh1Ny9rZXJuZWwtDQo+ID4gc291cmNlL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9kZXZpY2Vfd2Ffb29iLnJ1bGVzDQo+ID4gDQo+ID4gRml4IHRoaXMgbWlu
b3IgYW5ub3lhbmNlIGJ5IHB1dHRpbmcgdGhlIGJhc2VuYW1lIG9mIHRoZSBydWxlcyBmaWxlDQo+
ID4gaW4NCj4gPiB0aGUgZ2VuZXJhdGVkIGNvbW1lbnQgaW5zdGVhZCBvZiB0aGUgYWJzb2x1dGUg
cGF0aCwgc28gdGhlDQo+ID4gZ2VuZXJhdGVkDQo+ID4gaGVhZGVyIGNvbnRlbnRzIG5vIGxvbmdl
ciBkZXBlbmQgb24gdGhlIGxvY2F0aW9uIG9mIHRoZSBrZXJuZWwNCj4gPiBzb3VyY2UuDQo+IA0K
PiBIaSBhbGwsDQo+IA0KPiBUaGlzIGlzIGFib3V0IGFzIHRyaXZpYWwgYXMgaXQgZ2V0czogaXQn
cyBiZWVuIGEgY291cGxlIG1vbnRocywgY2FuIEkNCj4gZ2V0IHNvbWUgZXllcyBvbiB0aGlzIHBs
ZWFzZT8NCj4gDQo+IFRoaXMgaXMgdGhlIG9ubHkgcGxhY2UgaW4gdGhlIGVudGlyZSBrZXJuZWwg
c291cmNlIHdoZXJlIHRoZSBjb250ZW50DQo+IG9mDQo+IGEgZ2VuZXJhdGVkIGhlYWRlciBkZXBl
bmRzIG9uIHRoZSBhYnNvbHV0ZSBwYXRoIHRvIHRoZSBrZXJuZWwgdHJlZS4NCj4gSXQNCj4gbWFr
ZXMga2VybmVsIHNvdXJjZSBwYWNrYWdlcyBub24tcmVwcm9kdWNpYmxlLg0KDQpTb3JyeSBhYm91
dCB0aGF0IGFuZCBmb3IgdGhlIGRlbGF5Lg0KDQpJIGp1c3QgcmVzZW50IHRoZSBwYXRjaCBmb3Ig
Q0k6DQpodHRwczovL2xvcmUua2VybmVsLm9yZy9pbnRlbC14ZS8yMDI1MTIyMjE2NTQ0MS41MTYx
MDItMi1yb2RyaWdvLnZpdmlAaW50ZWwuY29tLw0KDQpXZSBjYW4gcHVzaCBhZnRlciBwYXNzaW5n
IGl0Lg0KVGhhbmtzLA0KUm9kcmlnby4NCg0KPiANCj4gVGhhbmtzDQo+IENhbHZpbg0KPiANCj4g
PiBTaWduZWQtb2ZmLWJ5OiBDYWx2aW4gT3dlbnMgPGNhbHZpbkB3YmludmQub3JnPg0KPiA+IC0t
LQ0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2dlbl93YV9vb2IuYyB8IDMgKystDQo+ID4g
wqAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gDQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9nZW5fd2Ffb29iLmMNCj4gPiBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9nZW5fd2Ffb29iLmMNCj4gPiBpbmRleCAyNDdlNDFjMWM0
OGQuLmU3YTUwYjEzNDhiNyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
Z2VuX3dhX29vYi5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2dlbl93YV9vb2Iu
Yw0KPiA+IEBAIC0xOTUsNyArMTk1LDggQEAgaW50IG1haW4oaW50IGFyZ2MsIGNvbnN0IGNoYXIg
KmFyZ3ZbXSkNCj4gPiDCoAkJfQ0KPiA+IMKgCX0NCj4gPiDCoA0KPiA+IC0JZnByaW50Zihhcmdz
W0FSR1NfQ0hFQURFUl0uZiwgSEVBREVSLCBhcmdzW0FSR1NfSU5QVVRdLmZuLA0KPiA+IHByZWZp
eCwgcHJlZml4KTsNCj4gPiArCWZwcmludGYoYXJnc1tBUkdTX0NIRUFERVJdLmYsIEhFQURFUiwN
Cj4gPiB4YmFzZW5hbWUoYXJnc1tBUkdTX0lOUFVUXS5mbiksDQo+ID4gKwkJcHJlZml4LCBwcmVm
aXgpOw0KPiA+IMKgDQo+ID4gwqAJcmV0ID0gcGFyc2UoYXJnc1tBUkdTX0lOUFVUXS5mLCBhcmdz
W0FSR1NfQ1NPVVJDRV0uZiwNCj4gPiDCoAkJwqDCoMKgIGFyZ3NbQVJHU19DSEVBREVSXS5mLCBw
cmVmaXgpOw0KPiA+IC0tIA0KPiA+IDIuNDcuMw0KPiA+IA0K
