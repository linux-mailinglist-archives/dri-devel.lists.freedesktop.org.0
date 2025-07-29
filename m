Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AB2B1484B
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 08:34:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDDF510E5CF;
	Tue, 29 Jul 2025 06:34:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QeSWLH6P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC25310E1CE;
 Tue, 29 Jul 2025 06:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753770863; x=1785306863;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=V0Gt4o8Z+aEAXjED1BQDh0h6jzZhxbXCQOU7GTJTtEY=;
 b=QeSWLH6Pj+qYy8OePf4XbLw/1nEtB9caIAGaJQMlRjS061LqcUKOcD2i
 219fafMCnP5fW+esFe/A+3R/CUun3BdlicTikAiVGXJSg0BRD9Lj9e+Fq
 KB31IHEei2zHM2tQV5p6bzJc6ABp0bvrCAOl16siopCcq0+VujmF/7x8y
 6WEmGGwmMUsw73WGadoksVPEejezPnhhOuaG+Nusqb1TXkXR9bQhxAyMn
 Rs1wfcqbhiCiTCmcNrDC+Qu/Inf5782ieFm0NXCXL4aOsrWvNSPgIGMN0
 Byiu/SVZ1UIQk/uWc7Pa/qcPAMO89jWuYcz5N5dMmj5ilrFKMy3316vS1 A==;
X-CSE-ConnectionGUID: vlxilj0hTamaeXz3JNIxeg==
X-CSE-MsgGUID: wIr9NPUyRASiXe2jaiG4qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="73479837"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="73479837"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 23:34:22 -0700
X-CSE-ConnectionGUID: NYyfFeKoQsK39ugluBhtmA==
X-CSE-MsgGUID: 9xD0ZWICQbiuwTS++2q3Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="162658724"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 23:34:20 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 23:34:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 23:34:20 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.65)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 23:34:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hV2O+EcrOTZFu0pbK0XdRtLIZXu4Ni7KwJ1raBSmxMLF68XSaR2dt7CNoEOVxbo0FG+n5LVSd4sNyz93tuC/eq06ZMmK2zRMbuID2aMr/+PK3bT8kgnVwfc62gzUd+GIyK50wa5voC9618Rf3rAnQHnY8NhtxMlbGtQf8G3dFhuwUYvgo2ajhBJf2WL3Zq16crrAizbSX6OttPyvz1bBNbujKTEq/ybYK+iRoTUlDf4Rba1S7q0s4JXArq8MmnT3byeatj01wd0dK+JVz4lHl2LwTg/bcX6zNdP+CfKEf3x3Oyvz3W9yWXhi82omyzUmBNS5MhY/1PRLB+1thwc6Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V0Gt4o8Z+aEAXjED1BQDh0h6jzZhxbXCQOU7GTJTtEY=;
 b=cK0iwFAzJol4fb6kr2uJJSOOOEejRlWIfRy1VVTPiJp8wQAPm0DmPsya9TNXXhomGNPKxe4UMhOnqrONhOuMXwJK/wzkdM3CKO9X8u0DSBYU7yskLZoKHzXOoIbaEY/UCaTX5WY0z2xw50O1t2Ks5xy4geBuaUvYJmsTdqcRP0f9K40pAgJG5bAjRpQyy4VGgbt2O5JxDcS+8A4YKyFTczucDw8eAf0Cz7b2V2iMR/TFcmobmBe113UVSc4WxFoy5h/aUA3CXUVVyy6kqDDo5sxlIveHxRCtArMWtaogd+PhB6R00w0+ewhgAfGAJOVuexlMXh1Y6ZbhQqKZrk700A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by IA1PR11MB6347.namprd11.prod.outlook.com (2603:10b6:208:388::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 29 Jul
 2025 06:33:44 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%5]) with mapi id 15.20.8964.026; Tue, 29 Jul 2025
 06:33:44 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Alex Deucher <alexdeucher@gmail.com>, Xaver Hugl <xaver.hugl@kde.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "andrealmeid@igalia.com" <andrealmeid@igalia.com>, "chris@kode54.net"
 <chris@kode54.net>, "Kumar, Naveen1" <naveen1.kumar@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "mdaenzer@redhat.com" <mdaenzer@redhat.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm: don't run atomic_async_check for disabled planes
Thread-Topic: [PATCH] drm: don't run atomic_async_check for disabled planes
Thread-Index: AQHb++OzBtPp41xtLkGAAwGtD2o9lbRH688AgACxXEA=
Date: Tue, 29 Jul 2025 06:33:44 +0000
Message-ID: <IA0PR11MB7307F428496EE1910DC531E0BA25A@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250723150413.18445-1-xaver.hugl@kde.org>
 <CADnq5_PPr0_1WRQyETishNFk1EAYWLxa3YAQb4iMukJeB6tdNw@mail.gmail.com>
In-Reply-To: <CADnq5_PPr0_1WRQyETishNFk1EAYWLxa3YAQb4iMukJeB6tdNw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|IA1PR11MB6347:EE_
x-ms-office365-filtering-correlation-id: 7c35f78d-d815-4d70-8833-08ddce69dde7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VUUwZlFpbk9ITHFpLzBaTmJESEpBMzZHM3dGME9iWjZkWDJMVVJXRFFmMUFy?=
 =?utf-8?B?UGlWNEpPemV2RENnS1RFd0lweU9MbUYyeEI3ZjR0RDQyNnFMd3RQd1AwOWVs?=
 =?utf-8?B?ZnZDdWJBczdvV3NkQThsdlVIOWJoVDJrUjVTSHZvV1BUZGluK3VzbDkvbnVY?=
 =?utf-8?B?Tm51bDlzc0ZObTJqcHB6U3BVd2srWmdnY1Z0bDZZM0ZmZXV2V3Z5TGZXQ2dO?=
 =?utf-8?B?aGR6bGZHai90dnI1Zk1IZG9BVzRlMXUzYjhSU1V2NUVFSlBoakxmSU1xSlNK?=
 =?utf-8?B?ZURBcFMvRlBHb1R5Y2tBZFRwakYrSVg4ZFIrVndJN0l5K1dvcWZya2lKcUF1?=
 =?utf-8?B?SGZTaUZTb3daYUNqNTR4YmNSV3JmcmtMQzhCOWJ6RnI4c1FaSU5CTHBuVTBa?=
 =?utf-8?B?Uy9KSElYRkl4RERjQ2gzbGs3eEQ3Y0JHb0x4bEVZSXhYT3Q0M0lHYjkzcS96?=
 =?utf-8?B?eXZTU3N2RDRqMWd3cXUyUFVDSFBocHo4cVllVi80RDlKTVd5MnFTUUxrZzlD?=
 =?utf-8?B?TVcvekhTMGx4cHdGelp3TU9vZGxyTE1VWjhWQW5NUFJFQXBDTnN2MGJQT1Ja?=
 =?utf-8?B?anI1bWVNZFZpb21reXFRd3JmYXA5ZHNiMGFxYnYybGV3Z3I5L2dwc0RySTJo?=
 =?utf-8?B?eFdaTWpqWXhDcWQvQ0VuY0xRTGNlSmJTc3k0SU8yRUJXUHFZY0NMRk1VanVG?=
 =?utf-8?B?U29teDZBemtxbXUweXhCazFpRkdnSlZJajJRUEl0ZkJsd05uZHhoL0hyalc5?=
 =?utf-8?B?YUEvbXNGTm5qMG9ySHkydXhtcTJqVWQ2clVBOWcwc3BhVFNjV2lpRFM5QmpM?=
 =?utf-8?B?MllibnJFZGJmVUxLdklWYSsvS0N6ZmdIa203N1cvd05QT1h4Z0wxdlRCU1RT?=
 =?utf-8?B?ek5NdGNQUm9zL1NVZVVINGtvaHdndFJsVWtoQlZkSVN1dUZ3NDE5MW1QQkpj?=
 =?utf-8?B?N3NUcFBvL2pFSDZQSkQvV090OEFGTjBNMVZBQldPMlRHM2NzRzFVLy9UU1h2?=
 =?utf-8?B?c3lzZ3gzRkdzcjd1RGEyZllMQjBLRWtQN3dOWFNhUW93Tk5xRlhFaTlPdUY3?=
 =?utf-8?B?bitjY2plV3pwNEZkajJxREdiTUpSRjUrRWppMFJkOGZwdEM2bEYyL3BRZGM0?=
 =?utf-8?B?Z3BmYzdCR0h6L0oxNk1XR1lnajVDY1ZzbEQ3MTdKaVRYRHN6bEc2QVdrY1k4?=
 =?utf-8?B?QWNjOXNXdHN1MGlReUdaV3F0TFBjdGI3aHl4QmhzeXVDK2pML1A3SldEMHBL?=
 =?utf-8?B?YTZyRENSTDJsYk1ueGFFRDFwbEJSWThqbnlUejFLenJGbUdVTEZWNnJMUFk4?=
 =?utf-8?B?eWdrNWkwUzZUK1B6RkdrM0M2cjhnNTlhVWk1N0w1bHRPMEdiYjM3Z25PajBO?=
 =?utf-8?B?WHdNenprNHgwYVdsUjNITVRvOHd4angrbGl3cVdwbEUxL3ZYSDNXMzU0TkhZ?=
 =?utf-8?B?VEtxVWJETlBGenVRYVRMVlJrZXBTNUFSbnJ4cENqb3Z0YzZzek1SWENFRlZ1?=
 =?utf-8?B?SGkyOGMzSkJWekRBSlVkVTVyd210cFJTMERWcUwwZ2VDNzVWNGt2YXdmeGhG?=
 =?utf-8?B?TjVrai84VHhZRlBZM25kL1pySVFoRkQ2YWxuU3RVL0JUV2s1T3h3L0xJbTNC?=
 =?utf-8?B?NWx2U3BPRnNyM3NBV1FpY3BkQmNTbE1TQktQVTRUTGNGcld4QWh6NWI2WWdG?=
 =?utf-8?B?SFY2ZHQ1aHkzVExNT1QzQkJ1aHJNUUVOenBscVRDeEE4bU8zbkZaZis3NjBL?=
 =?utf-8?B?NTVxNXlZc2JzZDdISmJ5U2lQelc5WjVkeGt1NzBzL1BMYzRtRUVZTmZPUlRV?=
 =?utf-8?B?MFd1c3FicU9YbmJvMlJvMDJ4SEhqMEdNZVBHYXlkMUJpbndjTTVtaktIbis5?=
 =?utf-8?B?eVFWZ2RTcnZGbDlNU2FWUHhpWHhjS2tidUxzUGpmTkxtb09qbGwrQjM1UEs2?=
 =?utf-8?Q?HYaL3bduLLg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UGZpZjZZbjAwL0pqb1NiU2JTTnE4UXhjYXZ0TjRWQXFRU0xoNmhZdmFVZkRq?=
 =?utf-8?B?dG1zQ2lGSXZyM2J6K3NUUktZUkRSS2IzMlJCWDJwTXR4WVd1aEc5UHhONWJ0?=
 =?utf-8?B?K05namNPOFo2TDM2bGxLYjFyeVZTMXo4bDlMaDhVeStoQlh4dnF4bHJSY1lw?=
 =?utf-8?B?clY2Y1piblVuaHBranI4M3F0VjB2VzUxR0J4eUpuUGl2SXVoVjVuSm9xaFkr?=
 =?utf-8?B?SDc4WHVjQlM3UXZvNlNteDhWL1dVVzM4elI0aUdQdzVqOEhTTVRPMFNDRUZq?=
 =?utf-8?B?UFFaMXprYUV1emV3YndybGYzVUp6NlJ0LzRnNUxtMHR3YlNPcUpUSTI4Tno4?=
 =?utf-8?B?VE92bUtlTGVKUmREMFY3VEJIMVdDaVZHMzBIYit1aThrdG54enN3ZVR3bjRR?=
 =?utf-8?B?aXdJNjB1MUFsbk5VY1NGcnVhL2RiWlhkdEU5Zys2VFZMU3ZDWTFBTXRpT3l6?=
 =?utf-8?B?QlUzTTA3ZjIzY3V3WnFDTU5ZTXN1QWF0cWpNS3ZoS1QvcXBLU0MrQUpkNFBQ?=
 =?utf-8?B?QzJaZTRLeGJmbUdpWldoS3NxZXcvc09OZW5ac0MvTVQ0T3NId01BWGJzelpG?=
 =?utf-8?B?RVQrVENOc01FRm9UL2N0SXlKUjdlVlhyZ1RFaGFON2JlNEs0eWxOYXhCcE9R?=
 =?utf-8?B?UnExL3FIRlc0eXRuanZ5RXk5QnZ4SGp5MllKdXBaOE5ZVHpYRFc3VFpEUEFl?=
 =?utf-8?B?MnZEVVBDQzM3RE1KdDVKT2YyVzdpZk45UXlLK25sU1VrS3hBRFFlVWQvcmRS?=
 =?utf-8?B?L1VTQjZFUUdYbVpqWFpoWTFyVEMvS0h0NEhjVHViNC96eVRKMEdSS2VkSXZq?=
 =?utf-8?B?MWdDd3dyNUZUNUEzcW5ZL2JERTdlR3hhT3BCZUhGUitiRVJhL21oYi9ESzE5?=
 =?utf-8?B?VVg2U1J1eFJqbW81a1RmZFpHNDZNQVRpRXlkakZYTDNjaGxtcEx2a3ZpZWtI?=
 =?utf-8?B?bFIweE5LcVQ0Nys3alVEWldycHRxYXNDL3M1MW9XUE9XRkFuWC9icVJtczB1?=
 =?utf-8?B?S2ZBckNucm1rTFhZanJEbyt3UnZXT1NiMm9yd0tSSXA1aDBtTnBhZUtPQlhT?=
 =?utf-8?B?UG5iOG8vOXh4TjZMRS9adjFXOERDQ1NjcFV5ZSsva2FFWmVBbXdhS2FMMWdV?=
 =?utf-8?B?enl6THRhdWR0S2haMVdhVHFjQ2ZiNExOQ05rSkJ0ejQvQzU5SUVnaHl1bHBQ?=
 =?utf-8?B?T1dHa202ZExwRlpkd24vU0lURHYzZEhHSk01M2hnMmZTMGR2aStUT2FVRlRM?=
 =?utf-8?B?aktrSHV4bEJsT1h1YnAvY2NFakdmam41SmZpbUJwc1ZpMklqcG80UEdDNk1x?=
 =?utf-8?B?MS9VKzlWc0o0bXBVZTE0b0QwRHRxWEJzdXNXdEYzWlZvNXNPNE92KzFvQlVR?=
 =?utf-8?B?bE00WGU3dUtXMHhuakpBb1FabUhMMkxtUENmc2NXVlNaOWtYZnJIcmJZRE1B?=
 =?utf-8?B?YjN4MnROclNPWjJaSGtjZW0rd0NmaS8vczhTeGZBZnRzT2tPcyt0aEptd094?=
 =?utf-8?B?NCt4UDVoenNSNXV2Z3FFVVhTSmc5cVdSUEs5ZTVEUnUxeHF4dnBFZzNGa21X?=
 =?utf-8?B?S2hmR2ZhTUxvUUsxVU9kejJOTjkxTjJoTmJ3VnlLamcxbm9NMDlubnlXQ2Nm?=
 =?utf-8?B?Y3pzQitQdzcvMjdxYys4NWl0enV5WjVBL2RmeWxMK2x4UEJwZXJqNnJ5T25E?=
 =?utf-8?B?YVVjSFdiWXloS2NvWVdPUmJlNTZpTVFqdHgxb3NtYzFCYjI3R0dLcFZ0Qzlm?=
 =?utf-8?B?eVRYbWNoZ3ZsbkM5bFpTK3NSV2tWa2NLQVRnY1R5MGg4cDlMZHNEYW9hdG9C?=
 =?utf-8?B?QjVFdEREb2FyMURNYU52cEs4Z2lYR3ZwcGVUUXVuRERyUUdaSGVKMjRJOUY3?=
 =?utf-8?B?bUxJc2JSczNpQXV1NkhoVGpKUjZlVTdjQ1JoM3R5YWlWMk9oY0JNVWtIVHJJ?=
 =?utf-8?B?WmlTRXBPY3J2dThSblozQUhPWVZvZElCVnU1RHFlRUZJUWl4ZW0yQkpjWHVH?=
 =?utf-8?B?MGxYTFlRS082K1BoVTdNVDIvb001UlNRNUJEeUlJZ3lGbk0wUlBLWTdEOCtV?=
 =?utf-8?B?OVM1UEV0UnZZNHZVUi8wWXgrRVdRemxxV25xU1VnVlJKRktmSStZR0UzckVE?=
 =?utf-8?Q?O7sk0aJfLxYUjAcMih48r7sm0?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c35f78d-d815-4d70-8833-08ddce69dde7
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2025 06:33:44.6014 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wB6OeRoXshy871P5PRKM4CjpPg629Pz0Sz9DOSOPjJU0WzGAO2hUHPmHpZkGtZrFBQzygn4zrMUcqQzIyyASKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6347
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

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEludGVsLWdmeCA8aW50ZWwt
Z2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgQWxleA0KPiBE
ZXVjaGVyDQo+IFNlbnQ6IFR1ZXNkYXksIEp1bHkgMjksIDIwMjUgMTI6MzAgQU0NCj4gVG86IFhh
dmVyIEh1Z2wgPHhhdmVyLmh1Z2xAa2RlLm9yZz4NCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmc7IGFuZHJlYWxtZWlkQGlnYWxpYS5jb207DQo+IGNocmlzQGtvZGU1NC5uZXQ7
IEt1bWFyLCBOYXZlZW4xIDxuYXZlZW4xLmt1bWFyQGludGVsLmNvbT47DQo+IHZpbGxlLnN5cmph
bGFAbGludXguaW50ZWwuY29tOyBtZGFlbnplckByZWRoYXQuY29tOyBpbnRlbC0NCj4gZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZzsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3Vi
amVjdDogUmU6IFtQQVRDSF0gZHJtOiBkb24ndCBydW4gYXRvbWljX2FzeW5jX2NoZWNrIGZvciBk
aXNhYmxlZCBwbGFuZXMNCj4gDQo+IE9uIFdlZCwgSnVsIDIzLCAyMDI1IGF0IDExOjA44oCvQU0g
WGF2ZXIgSHVnbCA8eGF2ZXIuaHVnbEBrZGUub3JnPiB3cm90ZToNCj4gPg0KPiA+IEl0J3MgZW50
aXJlbHkgdmFsaWQgYW5kIGNvcnJlY3QgZm9yIGNvbXBvc2l0b3JzIHRvIGluY2x1ZGUgZGlzYWJs
ZWQNCj4gPiBwbGFuZXMgaW4gdGhlIGF0b21pYyBjb21taXQsIGFuZCBkb2luZyB0aGF0IHNob3Vs
ZCBub3QgcHJldmVudCBhc3luYw0KPiA+IGZsaXBzIGZyb20gd29ya2luZy4gVG8gZml4IHRoYXQs
IHRoaXMgY29tbWl0IHNraXBzIHRoZSBhc3luYyBjaGVja3MgaWYNCj4gPiB0aGUgcGxhbmUgd2Fz
IGFuZCBzdGlsbCBpcyBub3QgdmlzaWJsZS4NCj4gPg0KPiA+IEZpeGVzOiBmZDQwYTYzYyBkcm0v
YXRvbWljOiBMZXQgZHJpdmVycyBkZWNpZGUgd2hpY2ggcGxhbmVzIHRvIGFzeW5jDQo+ID4gZmxp
cA0KPiANCj4gVGhpcyBzaG91bGQgYmU6DQo+IEZpeGVzOiBmZDQwYTYzYzYzYTEgKCJkcm0vYXRv
bWljOiBMZXQgZHJpdmVycyBkZWNpZGUgd2hpY2ggcGxhbmVzIHRvIGFzeW5jDQo+IGZsaXAiKQ0K
PiANCj4gPiBDbG9zZXM6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vYW1kLy0v
aXNzdWVzLzQyNjMNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFhhdmVyIEh1Z2wgPHhhdmVyLmh1
Z2xAa2RlLm9yZz4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfdWFw
aS5jIHwgMTAgKysrKysrKysrLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9hdG9taWNfdWFwaS5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY191YXBpLmMN
Cj4gPiBpbmRleCBjMjcyNmFmNjY5OGUuLjJlNjI1NjFmZDk0ZCAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY191YXBpLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2F0b21pY191YXBpLmMNCj4gPiBAQCAtMTA2Niw2ICsxMDY2LDcgQEAgaW50IGRybV9h
dG9taWNfc2V0X3Byb3BlcnR5KHN0cnVjdA0KPiBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSwNCj4g
PiAgICAgICAgIH0NCj4gPiAgICAgICAgIGNhc2UgRFJNX01PREVfT0JKRUNUX1BMQU5FOiB7DQo+
ID4gICAgICAgICAgICAgICAgIHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lID0gb2JqX3RvX3BsYW5l
KG9iaik7DQo+ID4gKyAgICAgICAgICAgICAgIHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKm9sZF9w
bGFuZV9zdGF0ZTsNCj4gPiAgICAgICAgICAgICAgICAgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAq
cGxhbmVfc3RhdGU7DQo+ID4gICAgICAgICAgICAgICAgIHN0cnVjdCBkcm1fbW9kZV9jb25maWcg
KmNvbmZpZyA9ICZwbGFuZS0+ZGV2LT5tb2RlX2NvbmZpZzsNCj4gPiAgICAgICAgICAgICAgICAg
Y29uc3Qgc3RydWN0IGRybV9wbGFuZV9oZWxwZXJfZnVuY3MgKnBsYW5lX2Z1bmNzID0NCj4gPiBw
bGFuZS0+aGVscGVyX3ByaXZhdGU7IEBAIC0xMDg2LDggKzEwODcsMTUgQEAgaW50DQo+IGRybV9h
dG9taWNfc2V0X3Byb3BlcnR5KHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSwNCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IGRybV9hdG9taWNfY2hlY2tfcHJv
cF9jaGFuZ2VzKHJldCwgb2xkX3ZhbCwNCj4gcHJvcF92YWx1ZSwgcHJvcCk7DQo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgfQ0KPiA+DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgb2xk
X3BsYW5lX3N0YXRlID0gZHJtX2F0b21pY19nZXRfb2xkX3BsYW5lX3N0YXRlKHN0YXRlLA0KPiBw
bGFuZSk7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKElTX0VSUihvbGRfcGxhbmVf
c3RhdGUpKSB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXQgPSBQVFJf
RVJSKHBsYW5lX3N0YXRlKTsNCg0KVGhpcyBzaG91bGQgYmUgUFRSX0VSUihvbGRfcGxhbmVfc3Rh
dGUpDQoNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIH0NCj4gPiArDQo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgLyogYXNrIHRoZSBkcml2ZXIgaWYgdGhpcyBub24tcHJpbWFyeSBwbGFuZSBpcyBzdXBwb3J0
ZWQgKi8NCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICBpZiAocGxhbmUtPnR5cGUgIT0gRFJN
X1BMQU5FX1RZUEVfUFJJTUFSWSkgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmIChw
bGFuZS0+dHlwZSAhPSBEUk1fUExBTkVfVFlQRV9QUklNQVJZICYmDQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIChwbGFuZV9zdGF0ZS0+dmlzaWJsZSB8fA0KPiA+
ICsgb2xkX3BsYW5lX3N0YXRlLT52aXNpYmxlKSkgew0KVGhlIHByZXNlbnQgcGxhbmVfc3RhdGUt
PnZpc2libGUgd2lsbCBiZSB1cGRhdGVkIGJhc2VkIG9uIHRoZSBjdXJyZW50IGxpc3Qgb2YgcHJv
cGVydGllcyBpbiBhdG9taWNfY2hlY2soKSB3aGljaCBpcyBjYWxsZWQgYWZ0ZXIgdGhpcyBzZXRf
cHJvcGVydHkoKS4NCkZvciBleCBpbiB0aGUgcHJlc2VudCBmbGlwIHRoZSBGQiBpcyBOVUxMIHRo
ZW4gd2UgZGlzYWJsZSB0aGUgcGxhbmUsIHRoZSBmbGFnIGZvciBkb2luZyB0aGlzIGlzIGRvbmUg
bGF0ZXIgaW4gYXRvbWljX2NoZWNrKCkuDQoNClRoYW5rcyBhbmQgUmVnYXJkcywNCkFydW4gUiBN
dXJ0aHkNCi0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHJldCA9IC1FSU5WQUw7DQo+ID4NCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGlmIChwbGFuZV9mdW5jcyAmJg0KPiA+IHBsYW5lX2Z1bmNzLT5hdG9taWNfYXN5bmNf
Y2hlY2spDQo+ID4gLS0NCj4gPiAyLjUwLjENCj4gPg0K
