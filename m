Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJqzDByynmlxWwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 09:26:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8333D1942A7
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 09:26:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A16E510E1ED;
	Wed, 25 Feb 2026 08:26:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FNBaPbJn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011071.outbound.protection.outlook.com [52.101.52.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2735D10E1D7;
 Wed, 25 Feb 2026 08:25:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J2m14Xz1+qqGfBZdxn1au/RUkaWxQypIymTh6OmshgwWZmLR52zmF9iYoW4jc8cmYD2fub7o5KRMQpJkZ/SNHxhOaOQO4vGYPSWw+UqcChjA2Xha25ooAB2VjHm6pZlJopjkxDb4gnXUcKciSJu4JGUW2MCoWsK9EeQBDXtPd0nuXTE9qfqwuIvSEAbEP0KtzfNITD9Dcxfey1ztHHzeBNDHgGiTgPFWLjv3gCr/NJNJvrzMihsGr9ygisjcmDFsWn8wFUVOLGuvlx2lsoOFleFoKrd+hbDAs1Sg6X2HjcxpZglMl9nDux2Eo6M/7Yxi8L/L2xUyZ4/I6uMSy5oopg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YRcjMLXC0t9WZamgf+LI+3uaAX4S+McarGJ69yEl3/s=;
 b=TkWyhkH8bTqDCtwdPPZPytqyt6SEqdMs2qM950NpcABW+46j6GfTD/b7q0BY0JoRwZmiJ3KxhtrfsQtDShMleUbgCx0UKfNtJyj7/bXHiOiX5A/XZMGQi55f5vGXG1AWE9hvjB2w1YaRR4ILGQ/U8gAjZsqqqAxSq/XUW3RHb80yn97s73b/UfUd/FWU4frjK9DFQwh0bhJPPWWD5BPRsu7Xt0dHrqvzmHUh8GX2u52XGzir0zZk7wK3O9zTtpKXKtxOB5iMfvnPDfOxG+5VARbdYfGfcpj8aDD/1qmV/uUnM+/TsnP+zpjxcuYT4c+yQZ6vKpl3KXWwG3MLSPM5Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YRcjMLXC0t9WZamgf+LI+3uaAX4S+McarGJ69yEl3/s=;
 b=FNBaPbJnRxOLFp0EzEBFtj48Iw86ZMJNn8mo9Ri5LNr+YUh9D6O5Zyy/ilOYUuHpb9wxUiFsZcjpohoccOF1efv0ZegYBzi0eRla690kIAhI48svSjj5+RDGsgToNA3z4xEd3zbHE1e7xZec/V5UWAi9hJE52vfPa8JeS+Idu1akcRG/Pg336TeKAvPmUIb7i1BqLlk6TLTgLTPN/T8Z8EQuQIGxtTyhuQvzFcQ+RdV1uEpYr/XR7EcKs5bcMxaze7SIfTvUBh/tjak8BQcuTdSfXWih1NOxJ3MxBG6TfEcV1J24CnOMLtN9bZzv7IW/z+PbCKVnGT6W3LpMWqe9fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH1PPFDA9B3771F.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::626) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Wed, 25 Feb
 2026 08:25:51 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 08:25:51 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Feb 2026 17:25:47 +0900
Message-Id: <DGNWE55D3GVN.1I8TOV5QKW6RT@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Dave Airlie" <airlied@redhat.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Simona Vetter" <simona@ffwll.ch>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Koen Koning"
 <koen.koning@linux.intel.com>, "Nikola Djukic" <ndjukic@nvidia.com>,
 "Philipp Stanner" <phasta@kernel.org>, "Elle Rhumsaa"
 <elle@weathered-steel.dev>, "Jonathan Corbet" <corbet@lwn.net>, "Alex
 Deucher" <alexander.deucher@amd.com>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Jani Nikula" <jani.nikula@linux.intel.com>,
 "Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>, "Rodrigo Vivi"
 <rodrigo.vivi@intel.com>, "Tvrtko Ursulin" <tursulin@ursulin.net>, "Huang
 Rui" <ray.huang@amd.com>, "Matthew Auld" <matthew.auld@intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>, "Lucas De Marchi"
 <lucas.demarchi@intel.com>, =?utf-8?q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Helge Deller" <deller@gmx.de>,
 "Alistair Popple" <apopple@nvidia.com>, "Andrea Righi" <arighi@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, <alexeyi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH v11 2/2] rust: clist: Add support to interface with C
 linked lists
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
References: <20260224222734.3153931-1-joelagnelf@nvidia.com>
 <20260224222734.3153931-3-joelagnelf@nvidia.com>
 <DGNW1KH6TCE1.3DIVLKYG6OURI@nvidia.com>
In-Reply-To: <DGNW1KH6TCE1.3DIVLKYG6OURI@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0031.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH1PPFDA9B3771F:EE_
X-MS-Office365-Filtering-Correlation-Id: 4df4c193-afb8-4503-608d-08de74477c46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OXVjbGRhVVVwOVVlV3AxTHNGd0VpSzBPNnRhT1JsSDVTdkg0UURrc2dTdTdp?=
 =?utf-8?B?ckhwODJ3b3EvQUtBaE5iTzl0bkgzUDZlUUc0TEVyUElHSXN3MG5IRm5KdzJE?=
 =?utf-8?B?THhKWHF0eGpnZEVUZURqVUxuL3R3Z29zSzBzSmcwemc2VmhoUTNTSVZ2WHVW?=
 =?utf-8?B?Z1NTWG5nYkJTQm1IQVAxenVpMHUxMTUwa3RZZE5CMUp1L1UxTTVPbzBtMHZa?=
 =?utf-8?B?VXZPYkdxMXN2bVZaQTJaZ3dSQUZwYlY1TnNVakZoNWk2THZ4YTJ0M05ka3dq?=
 =?utf-8?B?OEE2ck9WZ3ZJYWRBMkxOZVh2azhmZnBqb0c1dFhzT1RIbER0bmZkYnB3Yjdm?=
 =?utf-8?B?Z3dnRUVtSW4yS1BweEZJQlhJSk5aNHU0L2U3cWxDOEsrZEpzQjJWTExiOTZu?=
 =?utf-8?B?SVoreGRod2xRSXFkQ0NzRmNLdDV6TjVVZzA1cU10QVJGQTFidHdXb2QvTlM4?=
 =?utf-8?B?em1vSVBsT1RCUmdveFNudmI5bmtxZnR2d1l2dkZxNzBTcFlYUkw3SzBuL1lG?=
 =?utf-8?B?NkNwd2pyclpWTUwvRTJyNEUxbS9Pd0JKcVdNaWFtMlFZNTBVU1Nzdk5TbjZh?=
 =?utf-8?B?cHJBdjJOZC9tcDVHcVNhV2ZWYmRKcDVTN3dJYnFTc2V1T2FrVmU0NFJHdjl2?=
 =?utf-8?B?WExxeENVREIzczdza09neVFuS0UrTXBMOW5rSVd1U3F6SFFYcFo0cW82Um5w?=
 =?utf-8?B?cEMwbmxKT2VaZGszeFRwY2RyOHVab09oZjZSL3Eva0t5SERrSFhXV1daSWNS?=
 =?utf-8?B?eGZWSlhMRnBCZGF3OU9FM21nNFExZXZ3bEtVbk1vMlN3ZVV5eE5hV3pVY3hj?=
 =?utf-8?B?clRDNmw2ZzZTUXJZbTFha1R4Vm1WSzBjTndqRExNdjBsVzFSTXo5ODRZT1k2?=
 =?utf-8?B?cHlBRXRPYVE3ZHFxTGhWMFN5cU1qQ1NIVEhXNUY0dnBuV0F6cEt3d3JmVk83?=
 =?utf-8?B?YWo3Y0FqVVRjS1lkNTM0Y1pmQ1JkVkhLRGFGWkJPc01LVkhhaitJQmVnak5O?=
 =?utf-8?B?Y08rMWlQRDRyMCsvcWVoN05UakdTS0NmeHZLTUJMeG9kQ0p5SDFFaG9sY0ND?=
 =?utf-8?B?MkhEUVpOUVdXL1ZyV21yYVhjSFkyNXFjb2psL2JUUS9PYWlZVFFHVGxtZCto?=
 =?utf-8?B?eHF1OTZ5dytYdDVJY2k0Z2hKTG94MWF1QmczakpZT21SKzgzclBPVG9CTTNk?=
 =?utf-8?B?a1FabmNSRGlQMkxZeDZvMkVHaFRKNVBKYVZnWTlwbWlYQ3JxVDZUMmY0Mzkr?=
 =?utf-8?B?ck05ZU5uVjBWNEZsZDBweUZJWjBmNGtrOXVqSStXNXhaUDd6TGQ2MXdqMWF0?=
 =?utf-8?B?dDZCM1dXL2ZBZHcrbHNnZ0E3a0FoLzIvUmJvaFQ4T3FDdm84amJuSktTdWw1?=
 =?utf-8?B?c1p1VnRrakM1UThYNFRnMThRenhFMzVwcjZsVnlBL3VXV2ZvcmNPZUpkNERZ?=
 =?utf-8?B?MEdKN3FZMTVVMG9nSXMvNVQrYWdubEczbHZZZFlEMjVkOUkvZ1h5ZWgzWFA3?=
 =?utf-8?B?aldCU0NwMkZIaUJvaFQ1RWJPcTUyNzhaREVGaml1ajc5MFFrelQ0SlN0Mkg5?=
 =?utf-8?B?VlovL3VFbVVNZ3ZwdDRSMkk0NTYwTzRyV09uNlpSdWpIVjBRN2ExSWp3RkhI?=
 =?utf-8?B?TWovSng2RjNhdlpranVTQWprb2lKZWxQa2JmMnRuak1mK1o4RXVRakJ5bE02?=
 =?utf-8?B?RlhOMldYVFFvbUIyY2Z4QmFYN3ZIQVVzOTBKUFpJdGhMRkdYb3k3U0lzbWw4?=
 =?utf-8?B?UFZuQXFpU285dG5wNFJSdm9UTVFYanFrOTlTZGZoNys0cGtsWFIvV2tLRG5I?=
 =?utf-8?B?ajZmN3ZTT2lYUGx4ZnRxSXcvSnlZUjJnVk42TUMwbGRmUFM3UHFCamYvODlw?=
 =?utf-8?B?S3p0REluWDVuekRzZmx0TFhrWkl2a2JlekozaDVUOHAwV2g1TW5CcjJpVDVJ?=
 =?utf-8?B?U0dDcjhUeUFqcUhZYmVvQWVyU1E5RnE4YnZJTDdMS0grNFczMG1EbGFpSU1N?=
 =?utf-8?B?aENZdXVOQzhMUXVzWVhTQm5HVnFWQ1hCckxpYVpVV1hmV2RVRXcydjVkODdj?=
 =?utf-8?B?ME51UkdxQ0JtcmFTOXY0dXI4Y0U2Z2Nid3JkcEE0V09BODV5THpOMTloSFNJ?=
 =?utf-8?Q?Dx/0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXRTOG52NTRCTWVMa08vQ0p2dG1kZHVxYzlCMGVDU2R0Z1c0Q1dXT1pKeVRM?=
 =?utf-8?B?Vjc1NC8xNXAyQ1dmWllQejFqcXFSOEg0SHVVcGdtTWJKLzd2c0sxMUI5V2Yz?=
 =?utf-8?B?UHcvVnRrZzF4Q0c1L0JZN0lwbit2azVneE9ORDdrZldMaExXd3pmbTdpZ3FU?=
 =?utf-8?B?UFlrMy9FRDNpR2QrVm5vQlo0T0ZjMndoamdaazN2SWN3ZjU1K0ErYnpObEYy?=
 =?utf-8?B?czVYK2hQdlo5TFg0aGtXY3lKZHYzMWxkVXV3WSttUHhIQkxodzN2NFVoTVE0?=
 =?utf-8?B?Zlc2YzlBVzgzRXVKczQ5VWhNUFFTV043NXoxZzRVbEdLcHFyV2NYK2d4NURu?=
 =?utf-8?B?MWFzSXdkakZGZWRWVW9YQW4wTTc4anY4dnV6a1dsZUE4SnExa3ZaUEhoM2J2?=
 =?utf-8?B?c1pINjNjL1RibGRHeHZIa3F2VHJYZ2hLUlFoNFdBbnBUenZZNVB3RVVDM0Ny?=
 =?utf-8?B?ZXU4ays4aVBza1FWa0NmM09PYkhwL2dYR200MDBNMWZaNnFUZEFkTlB2dU03?=
 =?utf-8?B?M2NuSW1LcUdsVlo0dUpUdlBPc3FRV3NOcWVrMWpyWGRpbVJhZFFNZ244b052?=
 =?utf-8?B?S0ZLVnFic1JTTG10MlZyNm80b0JvZ0pXUksrcWxlSkxOM21rMlpPcGdWdUlP?=
 =?utf-8?B?dm8xWHJ4V1Q1STdsV3hXemw4Q2dzbXdoZndhc3VNZ1FtT2xiRjdySkZEeUNC?=
 =?utf-8?B?TmRxZU9jczZKclpRYjNJc1ZiK0pxU2FQSHIxUWlOVGdtTng1dUk4UlNxUkt4?=
 =?utf-8?B?ZWQ2cXc3NTRLSXdQMkRRMWd0U1dIWDU5RlF0c3Z6bnJnU0ljSlIyUXhoQWtl?=
 =?utf-8?B?YjlCa2N4SzNpakNReENlbVhnM0ZLeXM4bk9hTTlMdlFxVDhRT1F0UlBjK283?=
 =?utf-8?B?cWV5T3ZjdnBUcmQwTmZLbjNhbFc2QUJ3V0haODRnTzNQY0tOb01LS3c3T3lw?=
 =?utf-8?B?VUs3YlVUcHR5b0RPQUFrb2RiVHBhNG1hM1NSY0VJS21tSWtGTGFkb0dlRzZU?=
 =?utf-8?B?b1VUVk9OYVZjUXhvaXc5ckdDL1Y0NnBwQVFwbzlTVVp6d2pjREhMMjNYNFhn?=
 =?utf-8?B?V1BjeGRmYU1rd2VWZEFtT2s2a1dTYlhFN284YkRqY3JJQ0hUM1RiWVRwalBm?=
 =?utf-8?B?U25KYzBBanpaMGZMRUFLSUVJUkJhQXlHK01UdVBaTldjeHJERGtKM1VrNWU1?=
 =?utf-8?B?RmdkanBiRGNMTXIwdFRWN3NFemxkMjB4WjdmVFo1YWZBTnVueE9xRVpuK1Y2?=
 =?utf-8?B?ZDVSWm9IdTZucVZDekJlamVnOGRqbzBsaldTbks1NjQ3Y096bzhDSXZZei9h?=
 =?utf-8?B?UytDWG5NZnFUanRqSnhRRVNoZCtrNFV4REdESTE0b1QvOVRLb3BUVmxxUU9U?=
 =?utf-8?B?SDJxYk9HV3AwTGhGT1BNYUF1dXhWWDJZQ1VUTndLblVkTnM4enBuTkxENzhE?=
 =?utf-8?B?YVc4M1RIT2tYZnd1SnJvbHczbjhEdmVwZUdqajdOTExuZU9mWXV0R2ZtanY5?=
 =?utf-8?B?NXhLVDdudEY5em5YVEcxOFIxMjg0U055UzIvcGs1d2N1NzVuWjVNcVJCTnYw?=
 =?utf-8?B?cUltc2l4VnpFSlhraTh1ck9oYTlONk5TbHJSR0FQdzRxZTJiVU0vSXQzZmhU?=
 =?utf-8?B?MzR3UHhBTkNxSWdwVGpDUU9US3UycUR0cG0yQnNsUWxZVmVuTUNIbEdUQnc3?=
 =?utf-8?B?Ym5ZUGZ1N1J6Y2REYVRtKzk3UlZIT0V2cTBLZnpocVhNNTR5VnVlbmYwTk9p?=
 =?utf-8?B?REpKWnRoSm5LOXFZT2FKd0pUUEpYTmFVK0Q0M2lNYWZuUDloMEltd1lQZTlK?=
 =?utf-8?B?eVk2c2liTkpkY2lqMnF6bll4VDU1YUlCbUpmVUpsMENacjlKZCswRDFUczdR?=
 =?utf-8?B?ZXZWTnJyVGJIOHZPWUo4b2h4cVM4bXRncjM5Y0Vvajlta3YxL1laaFIwU3hj?=
 =?utf-8?B?VHdCN0E5cGJOUWFlWnRaMDdINCtnTjhOR3NQK2lJVERZc3B0YXh1d3BOWlpM?=
 =?utf-8?B?bEpXSm9lUGtWSlg5WGI5VFJDb05KKzJpTGs3NUN3eCtVUlRLQUhJVlpOSnNt?=
 =?utf-8?B?MXFoSEpIWFFSa1Z2Q2MvWEkva05UeUZiZzVDQ3JoTWdMNGoxWXFGS2YrL1ZE?=
 =?utf-8?B?STlaQWlVYXNGM1RjL3U4MWVjSll1LzRuRDVHbkdPckJnb1g1YlFSRDRWdWZW?=
 =?utf-8?B?cVpZZ0t4MkxLc1Z2WlNCdUcxVStHdm4vb3pzR0ZQTGlkcWxyakN4ZzBpU2F1?=
 =?utf-8?B?akVVZzZ2NFRySVVSZG5FVFYwNWVub05wdnI3ejQ0bnZtMHo1bE45NlZZRU9u?=
 =?utf-8?B?WVhEbThHNW5OaS9nSElhb1RlWTdPOHNXN1pjUWhMbjYrYzVUOHo2TEFib1Bk?=
 =?utf-8?Q?yh990EFicZC7tyzs21eQiHButR4X/AHD2UvlAVanWhNCT?=
X-MS-Exchange-AntiSpam-MessageData-1: TadmO1ELXXz9Lg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df4c193-afb8-4503-608d-08de74477c46
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 08:25:51.1787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fI38HCxrthEVec0dRb3ZrxbZhGR+A12ceuhIs+oxtrOVNmGnZzfChuNdsH7KRxHM39loZ7PkPBgAUol6zn0x0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFDA9B3771F
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[47];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,redhat.com,linux.intel.com,ffwll.ch,collabora.com,nvidia.com,weathered-steel.dev,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.963];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,garyguo.net:email,nvidia.com:mid,nvidia.com:email,collabora.com:email]
X-Rspamd-Queue-Id: 8333D1942A7
X-Rspamd-Action: no action

On Wed Feb 25, 2026 at 5:09 PM JST, Alexandre Courbot wrote:
> On Wed Feb 25, 2026 at 7:27 AM JST, Joel Fernandes wrote:
>> Add a new module `clist` for working with C's doubly circular linked
>> lists. Provide low-level iteration over list nodes.
>>
>> Typed iteration over actual items is provided with a `clist_create`
>> macro to assist in creation of the `CList` type.
>>
>> Cc: Nikola Djukic <ndjukic@nvidia.com>
>> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
>> Acked-by: Gary Guo <gary@garyguo.net>
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
>
> (with one small comment below)

Actually, one more. When trying to build the GPU buddy series on top of
this, I got this warning:

warning: this macro expands metavariables in an unsafe block
   --> ../rust/kernel/ffi/clist.rs:336:9
    |
336 |         unsafe { $crate::ffi::clist::CList::<$rust_type, OFFSET>::fro=
m_raw($head) }
    |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^
    |
    =3D note: this allows the user of the macro to write unsafe code outsid=
e of an unsafe block
    =3D help: consider expanding any metavariables outside of this block, e=
.g. by storing them in a variable
    =3D help: ... or also expand referenced metavariables in a safe context=
 to require an unsafe block at callsite
    =3D help: for further information visit https://rust-lang.github.io/rus=
t-clippy/rust-1.93.0/index.html#macro_metavars_in_unsafe
    =3D note: `-W clippy::macro-metavars-in-unsafe` implied by `-W clippy::=
all`
    =3D help: to override `-W clippy::all` add `#[allow(clippy::macro_metav=
ars_in_unsafe)]`

The fix should be easy and as prescribed.

Btw, your `nova/mm` branch has not been built with `CLIPPY=3D1` before
submission - there are still a few of few.
