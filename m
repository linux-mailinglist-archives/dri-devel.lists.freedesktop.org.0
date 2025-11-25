Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CB4C85355
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 14:39:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC3E410E3FD;
	Tue, 25 Nov 2025 13:39:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kq9n42fc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C136110E3FD
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 13:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764077955; x=1795613955;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6FltfIgwpFvvzJwKB0Qlda05ly4T3eKo61rY1u1kGn4=;
 b=kq9n42fcFsQEcvTDbOyERvZvnmyoMAna9hxyaTpIINaFr3S2OEukoD6B
 r3DpQaETz/8jRvSHOUPuqrvpb4BFQ7wGDsUtzTrmH7PV2UYudfCTQ3Tlr
 HmS7idCLL1K3ngEUj/XLMxFFowbGCOiC7i30ojBnFPHwNduGFscY+Z26/
 vpFuh6JfgXdjLncWYi68SFzOChf3FkKqA3oJpPS4S3rvGqrVDRZWcqsCK
 UbRi18dL0b7Ozk41DoJaW2nzTzhCGHMgiHgwFrt66l0dKU2dgwSRCXBlu
 ja1yVIijsGj3WruMHBiU1kc8mMy2F5kOm1sFVPVZxkkfE68N5gqq00S/s g==;
X-CSE-ConnectionGUID: pY2kWzzsSEmZm+fwSyHGWw==
X-CSE-MsgGUID: 6ZNBX81iQSiSHRRhkDzN2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="68684435"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="68684435"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 05:39:14 -0800
X-CSE-ConnectionGUID: ySE0lgOtSgKv0pK0MqXCtg==
X-CSE-MsgGUID: 7g5W8f+9TlyccFGaENw+dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="191780576"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 05:39:14 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 05:39:13 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 05:39:13 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.59) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 05:39:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M3E9+j4P7eNzuu1ZLTuHwzvKscyZVuCHfxg1Jh9H7BliZR3aoRMNei2N7KUn96kx0OZQ/jKBdFKV49k3ETMRCrrljqI/fb7eY3I4KBU92ucd9pbgirwLyK85db4l4qaA7CjXbHiXLKiMoXK2phGOBaGyuA2LPwDij/kN25aVIIfnEbqULJJeoBex2nt5OUVm2sg1ErzTlSXT2Btzu93Iv0f2WcFBj7M79WxcktrOnDAuUKdtrHRrhcrSstOFP+wjZm7yX9ZwZe/v/dd+aZwB0G77j2hRzPvPYOEaIceqWceu3I30riACR8gG1MSloiEYd20sXGOmth+VwMpOXvtwxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FltfIgwpFvvzJwKB0Qlda05ly4T3eKo61rY1u1kGn4=;
 b=L6ulzEK6LERfVGT5mtxHCkmcPrzUYo04L+uSTY+idbGpQiOvIlPohSPHvjJOSPC/ut6upzq5FNH6iKzUyxb91E0M/jgX7zVvOg/ZXdXZHganR7GidliST1iOqIDbBIpcO5e6kEog7kF3Og0OrGn0D7ySaUofqU8j7MI+Y/WQ2TXk8CANiTdk4R9BtIZzVXBHz8Hq8OnCuYzylhY8OXVxH5/DiQCKIkCEkTh8/fkrTGTKE8qAOyGdLWE9BYFUbt3osLRpo5zfH0dLjgxhoZqLu+jOHyZBXxcOiirBsW4B6mL7+d8haSkpjRw3jzM9mIEAdEojwWZ1CXb0tAfgNpdL+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA4PR11MB9251.namprd11.prod.outlook.com (2603:10b6:208:56f::13)
 by SJ2PR11MB8403.namprd11.prod.outlook.com (2603:10b6:a03:53c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 13:39:10 +0000
Received: from IA4PR11MB9251.namprd11.prod.outlook.com
 ([fe80::6de6:5e54:b54d:8edc]) by IA4PR11MB9251.namprd11.prod.outlook.com
 ([fe80::6de6:5e54:b54d:8edc%7]) with mapi id 15.20.9343.011; Tue, 25 Nov 2025
 13:39:10 +0000
From: "Sokolowski, Jan" <jan.sokolowski@intel.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: David Francis <David.Francis@amd.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Felix Kuehling <felix.kuehling@amd.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH 1/1] drm: disallow setting 0 as new handle in
 DRM_IOCTL_GEM_CHANGE_HANDLE
Thread-Topic: [PATCH 1/1] drm: disallow setting 0 as new handle in
 DRM_IOCTL_GEM_CHANGE_HANDLE
Thread-Index: AQHcXfXbiSxh9f6oD0iHeinWZoYJJrUDWR8AgAABmUCAAAagAIAAAi+Q
Date: Tue, 25 Nov 2025 13:39:09 +0000
Message-ID: <IA4PR11MB92511EB3B943B4F2BEB0A1D199D1A@IA4PR11MB9251.namprd11.prod.outlook.com>
References: <20251125102847.904357-1-jan.sokolowski@intel.com>
 <20251125102847.904357-2-jan.sokolowski@intel.com>
 <28441359-4625-4d3e-8c1a-852a1868bde8@amd.com>
 <IA4PR11MB9251D04B84D7129BB1DA449099D1A@IA4PR11MB9251.namprd11.prod.outlook.com>
 <10bd3353-c3cc-414b-8033-7f3b8edb5968@amd.com>
In-Reply-To: <10bd3353-c3cc-414b-8033-7f3b8edb5968@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR11MB9251:EE_|SJ2PR11MB8403:EE_
x-ms-office365-filtering-correlation-id: e0e385c6-0b6b-40a7-ee8d-08de2c280363
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?WHVEdXZ6ZHpzVnY3WStZRmtGTnBmVmJWSE51R0V1RTdPdGRnR3VYZU55b3dP?=
 =?utf-8?B?aUQxL1R5S1N5bUtxajRwN1pJdkpLd2d3OTVmakRnY0ZyaVo4SWgwb2lKQlBX?=
 =?utf-8?B?eWxxbTNpYzJobTFyZXMvSEE1cjhyaTJJSlovYzR5U3VYZkhLbkx3eHhhcjI5?=
 =?utf-8?B?YXhBR0EydnZIWnlGbEdrQ3JicVo3NVJ4Q2RkSHQ1UlJsVytyVlR0ZVhsekpy?=
 =?utf-8?B?U2dSVVYyNURUcG82L1pHcFkrTVNQdXo2YXB4UURKcFNoc0hmRFNKeFFyZC9E?=
 =?utf-8?B?R1FzR2Z6eTlvQzdmMWIyR0FZaWlJRGwxV2NhaGdMZUNIVGdMenp6SzV2aVpD?=
 =?utf-8?B?L3dNVEFnY2JQb0lYcXE4QzhNaUN0SUVYT3pMQTc1TjhKQ2gvSkNha21qWlBl?=
 =?utf-8?B?SDhtRVdWdTE3eVJYcHIyUkRscFNQUmhYRVNjbjQwSzNCdXNwM2RPY0cweTA4?=
 =?utf-8?B?UkgvanArYXJ2TmMzYWxYUXNhWTczdFNRNWttWnlYQlZOQ3NmNEFtZTRzWERJ?=
 =?utf-8?B?aldtUTA3ejRxY2hpOGtsZVZVVm0wQWl2U0RSbHpvZk9NUE1na3BCMmxJQm5v?=
 =?utf-8?B?eHFXZ1plWTc3SUFOOEo2Y2ZhVEZHZkIwQ1Jmd2NzaG05aEtTZmtHQktZTW5t?=
 =?utf-8?B?elBTTFprcTg5ck5vbEIrM0NRdFBTWFBLT3Y5WVF5WWV2N3dXWkJRYU12REJ6?=
 =?utf-8?B?Ry9nR3h4cmQ3bXVXNnRsTlR6MkN2dWpDem1jaUFTeHRGcDlxdzNMUVh3WGtU?=
 =?utf-8?B?akVycFhnMlNaYkpHSEQwWlp5VkhYMDFXMFo3c1FsNHIvem53QTM4eGpaUTdN?=
 =?utf-8?B?ZGhBTGdGNFRtUmVrUUlsMmowZFdjeEMvZWx6R0RnaXN5MDNyL0wzMWpWU3hV?=
 =?utf-8?B?Zy90U0l0dGVwNnN4OXoxbDg0L1l5Q0JYR2dDeElYNFNLYXRZRjBrOXlWTmxI?=
 =?utf-8?B?SldtMWp3T1I0MVQ2T29IL1U0SXlaU0hNSGJzVGM0WEZ4N0FyeEVzWUtlYjR0?=
 =?utf-8?B?TnRKZ2t6WmZRTDBKYnZKQmpsekhNVkZQQy9rZ2hSNThseXV4U3QzVTA1am9J?=
 =?utf-8?B?eHNsT3FnRFBtanJVczJPSDRrb2RyQTRtUU1KOWw0NkxQMjZWSHplZ3NabGhk?=
 =?utf-8?B?eWhDR2IyU3dHVzVTK1B1cUgwaCtXTHA1VDJROG5wcXc5bEJPWEpud3EzYVk5?=
 =?utf-8?B?Mm40Um95VEdpOTBncXJpYkpDRWoyblRqYmQ0UDR6RmZEdFZvUE9CdUFVaTdi?=
 =?utf-8?B?RGJ2ZDdnNnBRQUVENXpndUp5QnhZVWNHTHZOZnc0MlRmdStPb0NXdlF6OWNn?=
 =?utf-8?B?amNnTlZiRlNLcWs5L2xaSmt2anVOTHNZb0tXZ29scXdiQWROV1NOQUNBVHFa?=
 =?utf-8?B?ZnVFTkpOYmlHaG5TOXN5ZmdnaVVCazdsNXl3ek9ZejIzM3Z1U08yMmE2OVU2?=
 =?utf-8?B?dnVOeWltMVIxUlRNNGcxWC8rc2MyVW1PYkFVampnRHM4TFN5c2JkVzRtVUtD?=
 =?utf-8?B?bzd0b0dEWFhGRzdvMGZESklwWWkyOHB6S283ekUrQjFyM3cwOGJ4SkZBTFRI?=
 =?utf-8?B?N2psZHF4U1BMOUZqSnZrdUFSelNkSzgwT3pINEE2dklESlJuRmNRaG5PN0pa?=
 =?utf-8?B?SXloUis3L25UUFRSS1grS0lYeEE3OVkrZTdDZUlzSjJPVWNNQzVKMGlOMFhH?=
 =?utf-8?B?cC95V0MzRitPNHdGRWV0WEsrM1ZiMHpPZm5SVFV1aFNKeHBEZk9VNEtRcFZh?=
 =?utf-8?B?bDU4RXNDeEtGVHFkRVhVWGFzUGZSaTk0VWhzUEp6QXJRcDZDYzRqVVVxRzE2?=
 =?utf-8?B?YUY0Skp1QkQyZEEzQ2dXVy8yR3V2bUREVHlrNk43NmF0andJUklzMUsrMWQv?=
 =?utf-8?B?LzZRaTRUbjlTb3JKSGpSL0ZMN2ZnTWoxbkpSdmx1c3RtRXI5ZWthdnlITUJz?=
 =?utf-8?B?NFFQYmV0NHJwSTdXUlYxSzBIb0d0RXM5cTh6WFk4TG83UlVmS3hWcWh6b1F1?=
 =?utf-8?B?ZzBNYTl1VTRzdkZ4WndVQXZ1OENXSUs0Nm1WZkdWUmhCbjYxbURBcitOZTNz?=
 =?utf-8?Q?0CcO80?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA4PR11MB9251.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2NsdXBjMStEZmFGdkxGYzJNNjArR09GcnZoTXIwMmR0NFhjanBmR1FMTm54?=
 =?utf-8?B?MHYyR2RCWUNSQXNBN2RyQnJ2ekUxSVZkOWVxWXgvUFhjMnNXRHJSeHduWjll?=
 =?utf-8?B?VzBwM1J2VUhJQnd1dVdtcEJodTc2WTBudGlGMmlsdjdPTWdMcWh6cGxQUmR6?=
 =?utf-8?B?bUtnZmlrNnVlMDlvdTZHaE9mOEx0N1Vxc01kbE9CWmR5d2d3V3hsb1d2RW9a?=
 =?utf-8?B?cTNXTkZVL1A2VnVaUWgzc0J5eXorSzVzUEdpYnZxWEQ2dU9tS0R5dHhDNUpu?=
 =?utf-8?B?ZmxnbXdDYlNISFZZZWV2L0syYkdEcUlKZW1lc1hybnhHb21CMnpVRVJ5VWFR?=
 =?utf-8?B?OUd3N3FUUnF6dzYxeHlQSTVjTVhiZC9iOFZCR0crSEpNY1FUVXZRZXpyQTFq?=
 =?utf-8?B?Yi9adzEzekpleGl6ZWczNnRESUdMUWNWNGc1RCthTWl2K2pvdnNLbHNBTXZs?=
 =?utf-8?B?OHNkU1ptcVVoRU9NWHBtb0JyQ2VoOTRubTJHaGlWcHF5VGpDcExXZUE5WTd0?=
 =?utf-8?B?NU9rcHFNQVVIN1A5bHZvTjNwVjdnL1dxRVVZV2hoRmJZWnF6N3VHYktBYnpE?=
 =?utf-8?B?ZEIzcU9IOFo1Q3RpcVJHNnBJd1Z5U2Vwem84T1pnZjJGeUp5cUgxOUFBQ1I4?=
 =?utf-8?B?V2plRHVHVldvRjF6bTF5RE9vaWFCZnJSTHpjMVVVanJYVDJZbDc5Qjk5L0NK?=
 =?utf-8?B?YkRVejVwbEl1blRiaW9XNC9nQWRzeWtQa1o2Q002QjZGR2F6a1JCTVAxRzlq?=
 =?utf-8?B?alZoMEpGcHpSVi9UeGhQQkpQK2l0MERnUmFEOTZaN2plQzh6T3R4bVRFd2ZT?=
 =?utf-8?B?TmdhWVBJVHZYMVR6a3FycHhzWHpBTGRSc25FU2xwY2NvVnJ1OFJwdldSUVpj?=
 =?utf-8?B?OUNtR1NrcXlNcFNRb2pqYXZVMm85V2lERmgzUi9NYlo4UXh1R09oVTlJT0Vq?=
 =?utf-8?B?Y0xvTWdxN2tzK3FLNzkybmZhRWcvUFhIMnc4elZtdkFTZnFJc01MM1lSVGJk?=
 =?utf-8?B?MWQwVkx4dDVtS2Z6Y1dSUGlyL013OHVtdDhUTTZLaUZsTG8xeFNzQktYdjk4?=
 =?utf-8?B?emJSdnlNSVY5V0RHVUlORzUra0M5cWJkYUxlODUrVUZLMnRFSDBVOXNkVE9F?=
 =?utf-8?B?K2FiSU8zM3IzbGdRbG1VeDNxdzVxTFNpL0crSjVpc1RVSWZMUktETkpweEtZ?=
 =?utf-8?B?NElyWEJHTG04U3daWFlxdGtsUFYvUWMxenk3Y1NYbmdIc2FtR0JnZ0tESjNS?=
 =?utf-8?B?VS91TDZ4dVdENExlalVXNm5mVXJkRDdkMnE5Y3VYQzZoQjJncHFFVVhGdmpK?=
 =?utf-8?B?bXc2QTZ4TkZDbEFTVWU4eWlYWDRSVzVHdGtzRjNqbWtFMGY5a21nVDh3ZGtY?=
 =?utf-8?B?MkZNaExhdjJONGNzZ05jUGowUSttNTNHSnZ5R2hYVHVmQTFxS3FSd0pvWE5E?=
 =?utf-8?B?OGlYRFZaaWVlVzc3UFRHUktBTVpYdWg0VnNyOXpDY3c5MnJWT25rVTJCNDZ6?=
 =?utf-8?B?dHc2emx5NW5LT25ZWWtJcnZTTmNhZjZqeStlc1oyeE5UY3hwai9pbEJxNGl1?=
 =?utf-8?B?UjdxdzhGdlNwRjhFbURKeWV1S3pHNFZuME5ObEZLRnU2Mk4xZ2hDcVFWTzlv?=
 =?utf-8?B?eUw4NXU0SjNXY1hqWE5rWWNyWno0NXF4eVA0WmtOTm1ZT3dnblJlMlIvQnhL?=
 =?utf-8?B?akc3Z3V3Y2VSZXc3amE4TmFYdTl6cUtLcEJGanpwTXQrdVZOZEQxQmlWSnVN?=
 =?utf-8?B?WHhFTHZpUU91NUZkbUNDYkFWTjA2MWdsYXpRbWlEb3JTVWxwWU9mdmNDWENC?=
 =?utf-8?B?UzBuWGVsbTRYUXdUS1FxdDF3a3ZmVWNyc2xTdzdHbk9RNmdtQXlNenBQTWhD?=
 =?utf-8?B?WmhCU2VFOGVJY0FZdzZWck40MjNuRWNpNE03U0ovOUg4TFpCOU5zSkRDbDhq?=
 =?utf-8?B?Smkwc0JLRGVWbk43aXM0Uk1DMW1SclVnRXdQalZZa0JzbG5EUFZ0SHhIbXhn?=
 =?utf-8?B?cUtDRnVYTE5HZXVzQ2ZxOEhzY2NNQUV6dTJEVThGeUwrY0M0Nk5XcHY4SDd2?=
 =?utf-8?B?YTYyWG8zM2wrcW9zMHp5aEdqdzJhVzRvcDVVQktPT1pHdEZPMlh3RE90RVZP?=
 =?utf-8?Q?hLPzbOXSvbPMidMX2YE9rbXqj?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9251.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0e385c6-0b6b-40a7-ee8d-08de2c280363
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2025 13:39:10.0239 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SJA44xC/yZlfVxUQaka39TXz8R5m5DWvPQ+UGqXGsUiK+ZupEVaSvtzXXu/jXZx1IymLAZvrBqAdAI6Y/oXnsn3tVvKwteXZn3OacL/4M4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8403
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2hyaXN0aWFuIEvDtm5p
ZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBOb3ZlbWJlciAy
NSwgMjAyNSAyOjIzIFBNDQo+IFRvOiBTb2tvbG93c2tpLCBKYW4gPGphbi5zb2tvbG93c2tpQGlu
dGVsLmNvbT47IGRyaS0NCj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBEYXZp
ZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+OyBNYWFydGVuIExhbmtob3JzdA0KPiA8
bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPjsgTWF4aW1lIFJpcGFyZA0KPiA8bXJp
cGFyZEBrZXJuZWwub3JnPjsgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+
Ow0KPiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPjsgU2ltb25hIFZldHRlciA8c2lt
b25hQGZmd2xsLmNoPjsgRmVsaXgNCj4gS3VlaGxpbmcgPGZlbGl4Lmt1ZWhsaW5nQGFtZC5jb20+
OyBEZSBNYXJjaGksIEx1Y2FzDQo+IDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggMS8xXSBkcm06IGRpc2FsbG93IHNldHRpbmcgMCBhcyBuZXcgaGFuZGxl
IGluDQo+IERSTV9JT0NUTF9HRU1fQ0hBTkdFX0hBTkRMRQ0KPiANCj4gT24gMTEvMjUvMjUgMTQ6
MDIsIFNva29sb3dza2ksIEphbiB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gPj4gRnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
Pg0KPiA+PiBTZW50OiBUdWVzZGF5LCBOb3ZlbWJlciAyNSwgMjAyNSAxOjU0IFBNDQo+ID4+IFRv
OiBTb2tvbG93c2tpLCBKYW4gPGphbi5zb2tvbG93c2tpQGludGVsLmNvbT47IGRyaS0NCj4gPj4g
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4+IENjOiBEYXZpZCBGcmFuY2lzIDxEYXZp
ZC5GcmFuY2lzQGFtZC5jb20+OyBNYWFydGVuIExhbmtob3JzdA0KPiA+PiA8bWFhcnRlbi5sYW5r
aG9yc3RAbGludXguaW50ZWwuY29tPjsgTWF4aW1lIFJpcGFyZA0KPiA+PiA8bXJpcGFyZEBrZXJu
ZWwub3JnPjsgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Ow0KPiA+PiBE
YXZpZCBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPjsgU2ltb25hIFZldHRlciA8c2ltb25hQGZm
d2xsLmNoPjsgRmVsaXgNCj4gPj4gS3VlaGxpbmcgPGZlbGl4Lmt1ZWhsaW5nQGFtZC5jb20+OyBE
ZSBNYXJjaGksIEx1Y2FzDQo+ID4+IDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+ID4+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggMS8xXSBkcm06IGRpc2FsbG93IHNldHRpbmcgMCBhcyBuZXcgaGFu
ZGxlIGluDQo+ID4+IERSTV9JT0NUTF9HRU1fQ0hBTkdFX0hBTkRMRQ0KPiA+Pg0KPiA+PiBPbiAx
MS8yNS8yNSAxMToyOCwgSmFuIFNva29sb3dza2kgd3JvdGU6DQo+ID4+PiBkcm1fZmlsZSdzIG9i
amVjdF9pZHIgdXNlcyAxIGFzIGJhc2UgdmFsdWUsIHdoaWNoIGNhbiBjYXVzZSBpZA0KPiA+Pj4g
bWlzbWF0Y2ggd2hlbiB0cnlpbmcgdG8gdXNlIERSTV9JT0NUTF9HRU1fQ0hBTkdFX0hBTkRMRQ0K
PiA+Pj4gdG8gY2hhbmdlIGlkIGZyb20gMSB0byAwLg0KPiA+Pj4NCj4gPj4+IERpc2FsbG93IDAg
YXMgbmV3IGhhbmRsZSBpbiB0aGF0IGlvY3RsLg0KPiA+Pj4NCj4gPj4+IEZpeGVzOiA1MzA5Njcy
OGI4OTEgKCJkcm06IEFkZCBEUk0gcHJpbWUgaW50ZXJmYWNlIHRvIHJlYXNzaWduIEdFTQ0KPiA+
PiBoYW5kbGUiKQ0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogSmFuIFNva29sb3dza2kgPGphbi5zb2tv
bG93c2tpQGludGVsLmNvbT4NCj4gPj4+IENjOiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lz
QGFtZC5jb20+DQo+ID4+PiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0
QGxpbnV4LmludGVsLmNvbT4NCj4gPj4+IENjOiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5l
bC5vcmc+DQo+ID4+PiBDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+
DQo+ID4+PiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT4NCj4gPj4+IENjOiBT
aW1vbmEgVmV0dGVyIDxzaW1vbmFAZmZ3bGwuY2g+DQo+ID4+PiBDYzogIkNocmlzdGlhbiBLw7Zu
aWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+ID4+PiBDYzogRmVsaXggS3VlaGxpbmcg
PGZlbGl4Lmt1ZWhsaW5nQGFtZC5jb20+DQo+ID4+PiBDYzogTHVjYXMgRGUgTWFyY2hpIDxsdWNh
cy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+ID4+PiAtLS0NCj4gPj4+ICBkcml2ZXJzL2dwdS9kcm0v
ZHJtX2dlbS5jIHwgNCArKysrDQo+ID4+PiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KQ0KPiA+Pj4NCj4gPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYw0KPiA+Pj4gaW5kZXggNjgxNjhkNThhN2M4Li4yYTQ5
YThlMzk2ZmEgMTAwNjQ0DQo+ID4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jDQo+
ID4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jDQo+ID4+PiBAQCAtOTc1LDYgKzk3
NSwxMCBAQCBpbnQgZHJtX2dlbV9jaGFuZ2VfaGFuZGxlX2lvY3RsKHN0cnVjdA0KPiA+PiBkcm1f
ZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsDQo+ID4+PiAgCWlmIChhcmdzLT5oYW5kbGUgPT0gYXJn
cy0+bmV3X2hhbmRsZSkNCj4gPj4+ICAJCXJldHVybiAwOw0KPiA+Pj4NCj4gPj4+ICsJLyogQXMg
dGhlIGlkciBiYXNlIGlzIDEsIHRyeWluZyB0byBzZXQgaGFuZGxlIDAgd2lsbCBjcmVhdGUgaWQg
bWlzbWF0Y2gNCj4gPj4gKi8NCj4gPj4+ICsJaWYgKGFyZ3MtPm5ld19oYW5kbGUgPT0gMCkNCj4g
Pj4+ICsJCXJldHVybiAwOw0KPiA+Pg0KPiA+PiBUaGF0IHdvdWxkIG5lZWQgdG8gcmV0dXJuIC1F
SU5WQWwgb3Igc29tZSBvdGhlciBlcnJvciBjb2RlLg0KPiA+DQo+ID4gT2ssIHdpbGwgY2hhbmdl
IHRoYXQgaW4gbmV4dCB2ZXJzaW9uLg0KPiA+DQo+ID4+DQo+ID4+IEJ1dCBJJ20gd29uZGVyaW5n
IHdoeSB0aGF0IGlzIG5lY2Vzc2FyeSBhdCBhbGw/IERvZXNuJ3QgaWRyX2FsbG9jKCkgcmV0dXJu
DQo+IGFuDQo+ID4+IGVycm9yIHdoZW4geW91IHRyeSB0byBhbGxvY2F0ZSBoYW5kbGUgMD8NCj4g
Pg0KPiA+IEl0IGFwcGVhcnMgdGhhdCBpZHJfYWxsb2MgZG9lc24ndCByZXR1cm4gYW55IGVycm9y
cyBpbiB0aGlzIHNjZW5hcmlvLA0KPiBvdGhlcndpc2Ugd2UnZCBnb3RvIG91dF91bmxvY2sgc3Ry
YWlnaHQgYXdheS4NCj4gDQo+IE1obSwgdGhhdCBpcyBhIGJpdCBtaXNsZWFkaW5nLiBXZSBpbnRl
bnRpb25hbGx5IGluaXRpYWxpemVkIHRoZSBpZHIgc28gdGhhdCBpdA0KPiBzdGFydHMgYXQgMS4g
TWF5YmUgaWRyX2FsbG9jKCkgc2hvdWxkIGJlIGZpeGVkIGluc3RlYWQuDQoNCkkndmUgY2hlY2tl
ZCB3aGF0IGlkcl9hbGxvYyBkb2VzLCBhbmQgaXQgbG9va3MgbGlrZSBpdCdsbCByZXR1cm4gMiBp
biB0aGlzIGNhc2UsDQp3aGljaCBpcyB0aGUgbmV4dCByZXNlcnZlZCBpZCAoMCBpcyByZXNlcnZl
ZCwgc28gaXQgZ29lcyB0byAxKSArIGJhc2UgKDEpLg0KTWF5YmUgdGhlIHNvbHV0aW9uIHdvdWxk
IGJlLCBpZiBpZHJfYWxsb2MgcmV0dXJucyBhIHZhbHVlIG90aGVyIHRoYW4gYXJncy0+bmV3X2hh
bmRsZSwgdGhlbg0KYSkgYmFpbCBvdXQNCmIpIG5ld19oYW5kbGUgPSBpZHJfYWxsb2MsIGFuZCBp
bmZvcm0gdXNlciB0aGF0IHRoZSBhc3NpZ25tZW50IHdhcyBjaGFuZ2VkIHRvIGFub3RoZXIgaGFu
ZGxlLg0KDQpBcyBpZHIgaXMgdXNlZCBpbiBtYW55IG90aGVyIHBsYWNlcywgSSBkb24ndCB0aGlu
ayB0aGF0J3MgZmVhc2libGUgb3IgZWFzeSB0byBmaXggdGhhdC4NCg0KPiANCj4gQnV0IHRoYXQg
aXMgY2xlYXJseSBhIG11Y2ggbGFyZ2VyIGNoYW5nZSwgd2l0aCB0aGUgcmV0dXJuIGNvZGUgZml4
ZWQgZmVlbCBmcmVlDQo+IHRvIGFkZCBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPiB0byB0aGlzDQo+IHBhdGNoIGhlcmUuDQo+IA0KPiBBZGRp
bmcgYSBDQzogc3RhYmxlIHRhZyBzb3VuZCBhcHByb3ByaWF0ZSBhcyB3ZWxsLg0KPiANCj4gUmVn
YXJkcywNCj4gQ2hyaXN0aWFuLg0KPiANCj4gPg0KPiA+Pg0KPiA+PiBSZWdhcmRzLA0KPiA+PiBD
aHJpc3RpYW4uDQo+ID4+DQo+ID4+PiArDQo+ID4+PiAgCW11dGV4X2xvY2soJmZpbGVfcHJpdi0+
cHJpbWUubG9jayk7DQo+ID4+Pg0KPiA+Pj4gIAlzcGluX2xvY2soJmZpbGVfcHJpdi0+dGFibGVf
bG9jayk7DQo+ID4NCg0K
