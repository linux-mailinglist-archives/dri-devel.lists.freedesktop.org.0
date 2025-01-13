Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 041D3A0B4E1
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 11:55:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8545610E63D;
	Mon, 13 Jan 2025 10:55:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IGW8Uv6W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB76C10E63D;
 Mon, 13 Jan 2025 10:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736765718; x=1768301718;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=93sk2xHw/Q7aibFbQ1cWG5CO/1yufiYItPCEbLhyPdk=;
 b=IGW8Uv6W4ZSoREZLwMCLFhQrrEqD3DUKZalluWZj2M2tpoA+9sWilV6N
 6VZ+QE3fJ4fk7yjwJGRt+gPY2cTMbVbg3/thiq1puOHZQV3kzYoHF58Sg
 ax4+efgMwmaZCV4RuEGNZx6WLal39KNpP1MW0be1mN9gAd3bhtC4AJfi6
 rQeW96eRaBMa7JCQn0du1RLaIg8YBfgIlKRmxk8g6gt4vcg/53/mDMFKr
 np9xQHTYRn9p36gH/fA+4/q5IksvIqF8R8gd5NNlaFt75/WPwMtQ/Utla
 eVO+OGexZLe3mZj5QWT67/DAwkqwFi56/+s/Qc4J6dwEfeHME0fp4AWJ9 w==;
X-CSE-ConnectionGUID: 0CWma5ZhQSChetbktDcEyQ==
X-CSE-MsgGUID: 3MtMzLgRRiWSNhBHU4D8JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="36706755"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="36706755"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 02:55:18 -0800
X-CSE-ConnectionGUID: NmO1Lb8/SiqP51RDMBtBIA==
X-CSE-MsgGUID: FGe4pB/XSQyZIAjnWOsURQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="109470884"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jan 2025 02:55:18 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 13 Jan 2025 02:55:17 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 13 Jan 2025 02:55:17 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 13 Jan 2025 02:55:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kclcyQNhwtbsN6Fn8TsDfPej6fSg8sC94KJUrc2M5qgmtIh+ewMwzfoDF0FxZN7uOTkFCh+0+3Cy9oHFL5DH9KZYt34I5qDI7xnO8nfhQzmkL21Og1O9CkV+JY+3HF2KsFcC8sh23vTWxpjNrbiPy2v5QRd6B5fkhVkxcYAKDWiLO+KPgkRe+XefOO5ajJnWjaQlDxmlL50eQkmEC1dvIjyWzzFXOX9NuZ7JZqd0oMKxKX9qht+MI2+tV9EiJuUkEkKk6t+5l9VoHDvSqoOMwxH051zPq978t7H29QmIlVZY0pH/bO7PEwBLFYH3jpIJRjb8++p/Y8frLzBGDeKDDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93sk2xHw/Q7aibFbQ1cWG5CO/1yufiYItPCEbLhyPdk=;
 b=YVHPzOeSddqkqP6O22/N4yC4z24Vt7SzKmvSRk1tDZp8Rk2qjYExbs72fSqswUGB9QdCPq30CU/8TTMxy/yBrBEcwni46BS8R9Dm1xr9cfDczV3/SPqZ/EqerHSU+N0pJs/H2ujrfAr1Mwo+wYljcuxRcaaFimgUfP5bLaiOP5Av8dEgstxfYHEk1tAGEXgZ9tPMdSe/yS6VDC7Pc8QIAWcgCVc6adz+vFM0oME30O5Hu65LWnaQn3zWpKTju7Ur0IeD5TgJ9Xrejy6qKyxOAjx2+ioKGhcob1KJIe4UO44ef+KqK6Kc78T8cohWuwMnsiuK0su8HpVwsZZrw/4qzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5867.namprd11.prod.outlook.com (2603:10b6:a03:42a::13)
 by CO1PR11MB4770.namprd11.prod.outlook.com (2603:10b6:303:94::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 10:55:15 +0000
Received: from SJ0PR11MB5867.namprd11.prod.outlook.com
 ([fe80::dc4d:b84:3424:b7e0]) by SJ0PR11MB5867.namprd11.prod.outlook.com
 ([fe80::dc4d:b84:3424:b7e0%5]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 10:55:15 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "Karas, Krzysztof" <krzysztof.karas@intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/gt: Replace kmap with its safer kmap_local_page
 counterpart
Thread-Topic: [PATCH] drm/i915/gt: Replace kmap with its safer kmap_local_page
 counterpart
Thread-Index: AQHbY0bHGIrCC+LbKEe9rtwLpO5Zs7MUe7QAgAAFY+A=
Date: Mon, 13 Jan 2025 10:55:15 +0000
Message-ID: <SJ0PR11MB5867409CB608A7DA488FA84FD01F2@SJ0PR11MB5867.namprd11.prod.outlook.com>
References: <20250110100155.506796-1-andi.shyti@linux.intel.com>
 <5u3wlllxlvu6hddynpsee76f6pap7mwuys5axravyr5aqf6abq@genmarmlntv3>
In-Reply-To: <5u3wlllxlvu6hddynpsee76f6pap7mwuys5axravyr5aqf6abq@genmarmlntv3>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5867:EE_|CO1PR11MB4770:EE_
x-ms-office365-filtering-correlation-id: 3994203f-e990-4f4f-c4a1-08dd33c0c2f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VHlTOXB3SWw3ZWFOZmR2a3pNRG5NTTlPb2JyaXBVR0FVWXRXQkxrdFJkY2E0?=
 =?utf-8?B?WDE1RzlCa2tYcFYyRTNNU3lIQ2xKTStJQ2FYZ25CdG9hKzI4SzUxVSttU3Fl?=
 =?utf-8?B?MTFYamRBNWk1RWZNRTZ1QlRWQWVjMmZ1VmhiRXRaZ3ZuQlA2TEpFREFqSVN0?=
 =?utf-8?B?WU5EVmdwbk5MRnBuMUJsUFZYeDE3a1ovS3V0RHVrdTd3dFNYamxOdk9jeVlG?=
 =?utf-8?B?Q1dCZTVEQkdibTlXbnVQdDhpR08vQnM4WlNpQmlBbHZpckRiTWl1WjRaMGxV?=
 =?utf-8?B?OGJVTXo0ZWJGQzR4ckJOZi9MRE1BUUxRdDE3MldiakpBNmxXTndIUXVzd01G?=
 =?utf-8?B?RlpPa3lLZVZxRlUwR0NUS1BzNXAxd1d4L3hqVEQ3Y2lSbEovWTkwVStCTTZR?=
 =?utf-8?B?RXJkaTNlVlNPZmhQOUo2N28rRVU3RG5wZTllTGo1c1VIem44MFNHMmZyekxV?=
 =?utf-8?B?S3ZkZEt0ZEY2UHd5dzNEejJGRWkvSzE1YmNjcWkxSTJabE4xNnRRUm8ySXZw?=
 =?utf-8?B?ajZOZ29DOHB1NVBkQU4yZ2hjOHc3WUJnMWo0RXEvUkZ5TnhwVjk4NXpBemF1?=
 =?utf-8?B?RThGM2RDNHJLTjVOMnlKTjhKSHU1dWJkeVhMVUR2K2lOajJIZDhNR25FdnVa?=
 =?utf-8?B?ZDhvRS9OZWV6MFdGNnEySXFPYkd5N2UrejR3Yi9VUnAvZVVCYjRGSUVCSTRK?=
 =?utf-8?B?b255QWdJcjdFUmZUN1JSaS9kUUloQlNqdmkvVjdNdHVsQVp4b050YzcrcmZY?=
 =?utf-8?B?cy9PeVVod3BlenJPVTg4QWZWVGdFdVRzQWZQejFVaWtGdjRPdFpVMXlxTFMv?=
 =?utf-8?B?QWtOL0FaOENtdkdjZjBvd3RDa0FZY2ZGTEtCOVFNT0xVcDRocStZWkdCcmVp?=
 =?utf-8?B?UW5WaFlVa2xhNnVEbXVMWUpMbTd6a1I5TnRraUF4YjZOOVVkdVFVUmRodHVj?=
 =?utf-8?B?ZDRYa084RW1RbHZYYkNNYi9HU0lFcmtYN1BseFUvY1VtUGNJR3o1VmJKSmJN?=
 =?utf-8?B?WlpSUWxpbXo1Q3g0RG5RQk84MlJuSmpFdUdKbE42anhlYXE4bUs5WnJnQk1o?=
 =?utf-8?B?QXl3M1dHNzFxeis4cVo4VU5vaVQvSnZkeTMvdmZpdHpVQUwzNFMyTUQyRkNB?=
 =?utf-8?B?OGdrZzVXZENMbjhkeXphOFVEemVZL2NtOE9MQTZ5YjI2VnE1OGd1NDlyQ0Iz?=
 =?utf-8?B?QSs1aGZ1ZzZYU2lvdVh5N0VxVWlRZEhnQ3UrYVFJVzJkNzVVS3I1WHl1bmRi?=
 =?utf-8?B?OVE3eU5TUVEvSVZKL1k5RG9QemZiSVNaUUxUMkJSL3JKQ1NiUnNmZk92cUVu?=
 =?utf-8?B?dW9Rb2ZRZm04NG8wVCsvOUpFS3pvM3VBS0VjVDdrb1Q2bHkxM1VLZ3Mza2xp?=
 =?utf-8?B?emxKMmNoRHNZQVFwbXZ0cUpuR1M5b2g3TmQ2M0xnKzM1MFprUm84NWhMODRF?=
 =?utf-8?B?UENMVkM1bitVSm41b0J2Rlh5QTgxSHh2a0hGYUFKM0Q4L1lHVHUvZjk0YWRI?=
 =?utf-8?B?U1ZYM3lSZEl0U3dXYnZTeUs1cC9odUlDVG9JcitHMERkUUd5czlvb3ZJNTJp?=
 =?utf-8?B?TU1JUC9jc3BZMkszdUlqbElPT0hhVzRKb3FGZVp2M1pxN283dHhzZU9Tb0Jt?=
 =?utf-8?B?c0phVEFWNEZqT1RIUU5JaDZrUUFoRlFuUEVkaE1XYW9QM2xCRTZKT3pHWnp4?=
 =?utf-8?B?TllGZmJ0N0Zyamc3TWZHZVB3dDBZaC9jVDJ0RGc5bDE1Z21qV1NTVld0cnRD?=
 =?utf-8?B?Yk9XcGpSY3JVS2lVK3E0b1BMd0orKzlzeXVGR3ZwYWhQalFrSW1JSzJ2N3VT?=
 =?utf-8?B?dFZlSHJuSW9hemxvdUlkSVBXN3VsRkR2MGRpNDh5K0VNNSt4YjhKeWU0NWla?=
 =?utf-8?B?WjNwOUM2YWtJaHF2R3JTcHVqdnlJUU92SVFCaUJsTlQ5aFowRmFjb3lzNlBn?=
 =?utf-8?Q?AEQxfLRrYzRGBMdXlHJoAKaxkaHR5Av8?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5867.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aDRYQnQ1a0lGejJxdG0zWWQ0N3NUeWFYWDZSamdsNXlqUnJrcWx3UklRZElB?=
 =?utf-8?B?UWtadU5IY3RGWk9xbmNMcTBVR3dxazI1MkhoRktZYTFOVzBWbnNENjNYem1L?=
 =?utf-8?B?RkZqTTZhYTlyblJBS0hoejdrU0M3Z2wybm9Wem5PRjR3R2NvWTdrWEhoOFhx?=
 =?utf-8?B?enIwN0duVDFRd0ZSeHpPMXl5TEdkWU9RcjFVc0lwNXBFblE5akJiRHcvWktG?=
 =?utf-8?B?T0pEMElMNFhCVUJnb1UzWlUzSWZzNXpWUnJCVTZHN2Yzd1RzN0QzTHJtelRF?=
 =?utf-8?B?UzlLWWl4SFJ2c3BBSVduT05WVzVKNlFhbmJaRW5ucHpOdlN4QWVIa2FnZk1o?=
 =?utf-8?B?ZmorVFVVUGljT29xSFZjZG5tS1RSUnpISmVZaS9zRnZLYitoM1pDWUgvalVT?=
 =?utf-8?B?R20wTjczNVBuUi9KbUlwWVVJZnRDaE56ckQrVTBuRHFrOTRTb2xUa2Raditp?=
 =?utf-8?B?TWNrVWl0U3NQVGVOK0tWWFR4czVZSy92R01rdDRNOGJreHBEQ2p2TlBYdE1C?=
 =?utf-8?B?UGpETTl2eDQ2MVVYQlVYTXZacWlrVzBtVmdVVGhBeTFzNEE1TllNTFFTa21s?=
 =?utf-8?B?QSsyMFNyY1BMTmhwdlIwSG5rVXlHV0hid3VVSDlRQWFPaWhKR3MvTHlhL3Bt?=
 =?utf-8?B?S2N3c3hvUGphMmRWNGhPTWtMTit1emdUb2JackIxM21CdW44M0VHclVnUmhO?=
 =?utf-8?B?RnNEMG0xWmp5NHlrS3BzZkU1Zm5Dam5tTFdLY3hHa0JDMVlkdngwbktIVWIx?=
 =?utf-8?B?YnRaaytIb0ZTNU80S093ZjZpaDZIMFZvRENFeDBhRXBVYUcrZzhQMVJlUEsx?=
 =?utf-8?B?M2tEUW13ZmUrU1FaY0lTaVFrWjFFejMxRFFPdVJTL2RqM283OU8zRDlQSlVl?=
 =?utf-8?B?djV6QXZ6dk5HMXdTWGF1S3ltV0xKSkVGWGVYUFpLakVyVWR6UWQwMmZBWGFL?=
 =?utf-8?B?czQwMlozc2JkRUhOOUU1Q0pGSW5IcGlFeWdNSjhwaHdHUDg2bVZDNnNwZUll?=
 =?utf-8?B?eWNYOFJ6WTYyZGQ5RWEyOFdSVU9saTgwU1ZrVDNQVFJMSmROeG1sVktYQmhs?=
 =?utf-8?B?anM4SUJucjM2TmREM2NuT1BuKzdlUk1JaUhDa2JCa2JESGxzQm5USDBIcm9T?=
 =?utf-8?B?VXN0YTA1MUVYbDAzaHMwL0RGUGg0SWNldVBlTnh2Q3RJNnE1WTBDZ0tibzNl?=
 =?utf-8?B?U00zelJremx2dy9UWnJuWmlUS0FtZitOT2gzc1BKbDFLbzA2Y1Z1eUZmcVBD?=
 =?utf-8?B?TGt0Zkk1UDFNL28wTXhrek12S0EwOFFlNFpvc2k2Qjkvc2NNM2d1RzdwZlJz?=
 =?utf-8?B?L2JsQ1N6N1hObWx3dzUxQ1RwOTl6d2dVT2JhZUp5YUhZWjhhZUdYdlA2MTdv?=
 =?utf-8?B?OHAvZTQrOGdJN1BGYXNaVlY3dmtJUlNuV2czYjRUSTM2NFlwcGxHRmZKSnlM?=
 =?utf-8?B?V2xUYTd3RXZsREJkQ3NuVXdySnFCbytxVnJCcnZUbEQ5amtCRDZMcm5kclBi?=
 =?utf-8?B?SlRUczhWdEFGMERMTi8yKytON1dYcS81SzFCZExjakovYnFYM0VaSjFZbVpJ?=
 =?utf-8?B?NlFOdkI5UXBOT3I2OUFVZVdjK0EwUDc4b2J0TGNwMTNaWS96V3QvN2RIU3By?=
 =?utf-8?B?R3g5UUZNdGhPMnQybWNCYXNLSjJsNFhZZlU3Mm0vMDUzL2w5S25iMUdvOEVi?=
 =?utf-8?B?WDc5UkdvT1dFSTRjb3lHSEpSSjNzb3UwT1hVTUF4R2duSnFBT3pkWGliUkli?=
 =?utf-8?B?OTJHdkZ1SGVkdGtMVDBIbjB6YVRabnVmK0pvN2w4bmU5am1TNlNNZktGbExU?=
 =?utf-8?B?aGRzTDJqcFk2YkFHcHNSV1lpQmEvOCtRV1hyNmlqSGFPSEo3TW5NbHVmZE90?=
 =?utf-8?B?VEtBbzRManRQMEtmVE0xWVliS0ZHRWdHL09ibzJUV0FRK2ZrWDhDVHZaek1a?=
 =?utf-8?B?ZmhLNkE0NTFTcFQ2ZElJYWh5Yk9NOEFNcGcybTlXK0xnaVY5Q3Jua3lyS3Ir?=
 =?utf-8?B?ZWFjeGlrQ3NNMDhaSzdJZEQxU1hvQ0pmcGZvbFFHSk1DSFRrNWFWZSsrZ0dk?=
 =?utf-8?B?M2NEY2ZqNWZDdy9jSkFRWWlWcS8vcEgxbGEwUGJKVitlNVF6Unh0QnNOUjYv?=
 =?utf-8?Q?6MP9EoK74VyEf4YClf4ci7Zx7?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3994203f-e990-4f4f-c4a1-08dd33c0c2f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2025 10:55:15.3862 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /WIMEvgY9ar3au7XbWtZcD7d/es5Pns8N12/+5TgZeby/SDoCNf2W7W9KxtegSYXAivL6jkRlPhxTetOVP1NrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4770
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

SGkgQW5kaSwNCg0KPiBPbiAyMDI1LTAxLTEwIGF0IDExOjAxOjU1ICswMTAwLCBBbmRpIFNoeXRp
IHdyb3RlOg0KPiA+IGttYXBfbG9jYWxfcGFnZSgpLCB1bmxpa2Uga21hcCgpLCBwZXJmb3JtcyBh
IGNvbnRleHR1YWxpemVkIG1hcHBpbmcgb2YNCj4gPiBwYWdlcy4gVGhpcyBtZWFucyB0aGUgcGFn
ZXMgYXJlIG1hcHBlZCBsb2NhbGx5IHRvIHRoZSB0aHJlYWQgdGhhdA0KPiA+IGNyZWF0ZWQgdGhl
bSwgbWFraW5nIHRoZW0gaW52aXNpYmxlIG91dHNpZGUgdGhlIHRocmVhZCBhbmQgc2FmZXIgdG8N
Cj4gPiB1c2UuDQo+ID4NCj4gPiBSZXBsYWNlIGttYXAoKSBhbmQga3VubWFwKCkgd2l0aCBrbWFw
X2xvY2FsX3BhZ2UoKSBhbmQNCj4gPiBrdW5tYXBfbG9jYWwoKSBjb3VudGVycGFydHMgZm9yIGlt
cHJvdmVkIHNhZmV0eS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEFuZGkgU2h5dGkgPGFuZGku
c2h5dGlAbGludXguaW50ZWwuY29tPg0KDQpVbmRlciBndCwga21hcCgpIGFuZCBrdW5tYXAoKSBp
cyBhbHNvIHVzZWQgaW5zaWRlIHN3aXp6bGVfcGFnZSgpIG9mICBpbnRlbF9nZ3R0X2ZlbmNpbmcu
Yw0KQ2FuIHlvdSBhbHNvIHJlcGxhY2UgaXQ/DQoNClRoYW5rcywNCk5pdGluDQoNCj4gPiAtLS0N
Cj4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qvc2htZW1fdXRpbHMuYyB8IDggKysrKy0tLS0N
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4g
Pg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9zaG1lbV91dGlscy5j
DQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9zaG1lbV91dGlscy5jDQo+ID4gaW5kZXgg
YmI2OTZiMjllZTJjLi4zNjVjNGI4YjA0ZjQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Qvc2htZW1fdXRpbHMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2d0L3NobWVtX3V0aWxzLmMNCj4gPiBAQCAtMTA4LDcgKzEwOCw3IEBAIHN0YXRpYyBpbnQgX19z
aG1lbV9ydyhzdHJ1Y3QgZmlsZSAqZmlsZSwgbG9mZl90IG9mZiwNCj4gPiAgCQlpZiAoSVNfRVJS
KHBhZ2UpKQ0KPiA+ICAJCQlyZXR1cm4gUFRSX0VSUihwYWdlKTsNCj4gPg0KPiA+IC0JCXZhZGRy
ID0ga21hcChwYWdlKTsNCj4gPiArCQl2YWRkciA9IGttYXBfbG9jYWxfcGFnZShwYWdlKTsNCj4g
PiAgCQlpZiAod3JpdGUpIHsNCj4gPiAgCQkJbWVtY3B5KHZhZGRyICsgb2Zmc2V0X2luX3BhZ2Uo
b2ZmKSwgcHRyLCB0aGlzKTsNCj4gPiAgCQkJc2V0X3BhZ2VfZGlydHkocGFnZSk7DQo+ID4gQEAg
LTExNiw3ICsxMTYsNyBAQCBzdGF0aWMgaW50IF9fc2htZW1fcncoc3RydWN0IGZpbGUgKmZpbGUs
IGxvZmZfdCBvZmYsDQo+ID4gIAkJCW1lbWNweShwdHIsIHZhZGRyICsgb2Zmc2V0X2luX3BhZ2Uo
b2ZmKSwgdGhpcyk7DQo+ID4gIAkJfQ0KPiA+ICAJCW1hcmtfcGFnZV9hY2Nlc3NlZChwYWdlKTsN
Cj4gPiAtCQlrdW5tYXAocGFnZSk7DQo+ID4gKwkJa3VubWFwX2xvY2FsKHZhZGRyKTsNCj4gPiAg
CQlwdXRfcGFnZShwYWdlKTsNCj4gPg0KPiA+ICAJCWxlbiAtPSB0aGlzOw0KPiA+IEBAIC0xNDMs
MTEgKzE0MywxMSBAQCBpbnQgc2htZW1fcmVhZF90b19pb3N5c19tYXAoc3RydWN0IGZpbGUgKmZp
bGUsDQo+IGxvZmZfdCBvZmYsDQo+ID4gIAkJaWYgKElTX0VSUihwYWdlKSkNCj4gPiAgCQkJcmV0
dXJuIFBUUl9FUlIocGFnZSk7DQo+ID4NCj4gPiAtCQl2YWRkciA9IGttYXAocGFnZSk7DQo+ID4g
KwkJdmFkZHIgPSBrbWFwX2xvY2FsX3BhZ2UocGFnZSk7DQo+ID4gIAkJaW9zeXNfbWFwX21lbWNw
eV90byhtYXAsIG1hcF9vZmYsIHZhZGRyICsNCj4gb2Zmc2V0X2luX3BhZ2Uob2ZmKSwNCj4gPiAg
CQkJCSAgICB0aGlzKTsNCj4gPiAgCQltYXJrX3BhZ2VfYWNjZXNzZWQocGFnZSk7DQo+ID4gLQkJ
a3VubWFwKHBhZ2UpOw0KPiA+ICsJCWt1bm1hcF9sb2NhbCh2YWRkcik7DQo+ID4gIAkJcHV0X3Bh
Z2UocGFnZSk7DQo+ID4NCj4gPiAgCQlsZW4gLT0gdGhpczsNCj4gPiAtLQ0KPiANCj4gUmV2aWV3
ZWQtYnk6IEtyenlzenRvZiBLYXJhcyA8a3J6eXN6dG9mLmthcmFzQGludGVsLmNvbT4NCj4gDQo+
IEtyenlzenRvZg0KPiA+DQo=
