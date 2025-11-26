Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0547C8BC89
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 21:14:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 043C010E6AB;
	Wed, 26 Nov 2025 20:14:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gfLRP5NI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011071.outbound.protection.outlook.com [52.101.52.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D302110E037;
 Wed, 26 Nov 2025 20:14:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pGh9DgbOc6xtAdjEB7AGmKMnHj+s+wkptFAIMzioihRvcnLNSzfRv3y/2NMhof0nZ/Ov2exg/m1JeOwUPbZgyAVDnyKMvx7xI7Id41hjuFT9kDrGBNEo+48A+DlEL+KOkDRBuTEDhUrGDRUwvDOKSIOmxSNygEpNI8b2bdp6F3FvJ5PrDThdMHmyXFNYHuSWdZ6BHRw+G7aH+hu8xBVwGFAYQuIYrq8M9dZTJfE6I76u3iYmGhY5LTf+Tasw1Qvnc15dYHNbFghKa4UhoRL50/PALuDFz4OPY5zkUQx31Q5vuFm2/c6bACyM6yPK4Vjp5nDKETWhVKuCmj+aUtu2cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=meZ6VCbvrH74xPrkdUDFfdtum957H9IbiS7il30oMMU=;
 b=VKi9y1GpKaZOHXuK+zJavAQU8owltMaEvSRZ9K7x5aSSYlc/FRV7kozeztBLhQyRCniCztllGjs9EhLTET3z88ohQUP2Y9HAMd3Y5eCnhYsq8qk7yd9i9n1vg8INqoAWfSL2oDyawlZ6wYfM+lCTyYQjlPM963ndObt54StMwoNd00ONzyLTLuf2x1qa9nwk8WqG2fgvsVHlFYRQGT4DKm1a+gbDBdTyFFrrLy2FB+ZeO9PlERYrzelKAkFSyKkXntoEWPZxGKE41csqG7fPxcI7NQE9h8wSbVTyOiPZ7RMrUS3YNax6klCwIAPwAvB7cYqXT/1YjCZtAHyK0FOqkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=meZ6VCbvrH74xPrkdUDFfdtum957H9IbiS7il30oMMU=;
 b=gfLRP5NI0Ew6Uq50+qN0HTcT4KdRkRXYFDL5YafheyTYjnhJjwwO+XBtCZQ78LF6aji1CkvGoRF5Er4uK6edTVL2KMSsRsINcBMQx9nGoOY4T6tEcSxaCIQOloLoUFaTzv/H3uDWp1BGd21zYkhupQz2FrGyuwq6AILF2eIw+UlgcdT5Rqwc0RlKW5HeoyclsE1X2b0d5NX0yv6Oz9nWy5sT7wnMOjYYqvNKG+ZVqOXm8eNhLA8cRB3wBJcWZCMdrglziAjCWMpN2KJjrQKayFOs1O/pQAZgOZwZxL21LfvrIhnobA75o2nEnRPR5LnqVMIp83FkdyxN09ASju64fA==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM6PR12MB4105.namprd12.prod.outlook.com (2603:10b6:5:217::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 20:14:16 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 20:14:16 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>, 
 Alistair Popple <apopple@nvidia.com>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, "boqun.feng@gmail.com"
 <boqun.feng@gmail.com>, "gary@garyguo.net" <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, "lossin@kernel.org"
 <lossin@kernel.org>, "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "aliceryhl@google.com" <aliceryhl@google.com>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>, Timur Tabi
 <ttabi@nvidia.com>, "joel@joelfernandes.org" <joel@joelfernandes.org>,
 "elle@weathered-steel.dev" <elle@weathered-steel.dev>,
 "daniel.almeida@collabora.com" <daniel.almeida@collabora.com>, Andrea Righi
 <arighi@nvidia.com>, "phasta@kernel.org" <phasta@kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Nouveau
 <nouveau-bounces@lists.freedesktop.org>, Alexandre Courbot
 <acourbot@nvidia.com>
Subject: Re: [PATCH v2 3/3] rust: clist: Add typed iteration with FromListHead
 trait
Thread-Topic: [PATCH v2 3/3] rust: clist: Add typed iteration with
 FromListHead trait
Thread-Index: AQHcUy5+JLQ7iTVgXUWlsFW7X3kHl7UBedgAgAKmegCAABpBAIABQYr6
Date: Wed, 26 Nov 2025 20:14:16 +0000
Message-ID: <352A2D64-C98F-4457-908F-4BB7AF12D858@nvidia.com>
References: <20251111171315.2196103-1-joelagnelf@nvidia.com>
 <20251111171315.2196103-3-joelagnelf@nvidia.com>
 <DEGQCMSX1SGZ.2NQDPG5KUNA9D@nvidia.com>
 <04b9f849-94fc-4bfd-94d7-7337a8cffdf3@nvidia.com>
 <DEI7ZVKG4JLA.FH1MEMUQLNUK@nvidia.com>
In-Reply-To: <DEI7ZVKG4JLA.FH1MEMUQLNUK@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|DM6PR12MB4105:EE_
x-ms-office365-filtering-correlation-id: c136b14c-7344-40cd-6573-08de2d285fc3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?MEFLSC9HNkF0Z3JlUjJKZ2ZhcUgvQS9SRVRVckFYemtuSEl0Y1RUUTIzMFVp?=
 =?utf-8?B?VEhGd3d2RHhZT2N4d25mc1c4YS9aZ1lhblRpQTc2ZTIvNGdmSU1vOEorcFg5?=
 =?utf-8?B?MzhGY1lPMk5NbUgzcjY4bFY0V2xZaHozUG8vNm1MNm1VK2ROSXFUa3AvcEJr?=
 =?utf-8?B?VUNDdldSTVJZelpTYllTbVpiOVhZZDhSaHR0cC82UytvYm9JRS9yOHFmNzQ1?=
 =?utf-8?B?VzZ4NytaMHVPeDJDb1FMelRKUlFoUWNqR0R0NlRRR01LQ2xmbnFIbnhrcCtQ?=
 =?utf-8?B?bDNoanQvenJwc2x0QzZhdFcvY1VPQUxHUS9OdXBmNThYa0FEYzdFQUxXVUtu?=
 =?utf-8?B?b01mT2lGYU5iWlpvODVoTmx4UlM4bU5nSWd1bitCVmJ3eXRwalY5VEZFNUpn?=
 =?utf-8?B?WmRZSGF0V1A5Vlg0QmRYSE0vamp1dUtwVENldEJhNDRLajhQelRjVzk0Ujds?=
 =?utf-8?B?UHQ0U1Fja0JldFFaVEU0dGNaeXNlK2RlQjdNTkpoeW9uUkVDMG9QdGh0cHZx?=
 =?utf-8?B?cmEvVjhOMDhiY1FkTW9DdTgvZUJCYWxyNnBTc1VRd1kwWVVBdTluSUF1U1NC?=
 =?utf-8?B?elp4cGYyNEJ0K1ZqNkNuU3ZyMzNXdmROOXo3Y1Nmd013ZWhjelQyMW1NWHg4?=
 =?utf-8?B?K1h1cU1NVkhNcjJsc2V3Rjdidk1BZzJ5UjJJZ1lJMy84cldzc3Y2S0F6NUc2?=
 =?utf-8?B?ZnFzUmdqNW01SWN4bFcrZkpuVGs0VFdLbGFmL0xYb0Y5a2pYMnRCaVBrSjZR?=
 =?utf-8?B?YzJnam5EUmVZaXZiTEFtbFJzbSt0bEZFbi9zR2tGNkxtdUxUeTVnT1pkYWtx?=
 =?utf-8?B?TTl6RHIxR3AxTWdUeGkyZHNKLzd1cUtsbHFYb3E2YURKZWo4L1c2b1k5K2Iz?=
 =?utf-8?B?eHBQNytreXRZdzZZaXQrWDRnL2NMcExBdm91MVVUNzF6UVQvMXNwY3M2Nktv?=
 =?utf-8?B?K0RXVlBNMXN4MmlISStkQzdIOEdzVFM0Y0JOb1JqYjJCU1RWSDJxbG9DNUFl?=
 =?utf-8?B?MS81UkZzbHBjak52YnhlbEpWNlhpeDRienI0TitXUmsxTmZQWEtZaUJWOFZC?=
 =?utf-8?B?RFpPZGJIM0tSSUY1QUdnT1ZrdEF3WVlJaUs2WTk1YTNoQU5VczJ0OGNvWlA1?=
 =?utf-8?B?OTc2Ym5jM1gxRHZXZVJkbHVoMFB3bHhNZ21OTXJSdThpNXM4SmVCY211TWpP?=
 =?utf-8?B?T2lLV0JJMUlING84QzlxdzlHdDZvamxsWFBmbU1BdVpTOVBITzVUQ2tOVUdw?=
 =?utf-8?B?OU5wM2JCK1J2aXlQRi96bWRvT2FoK0Z3ZEF4Nm5uNkd6YUZSL0FHcnNhM0ZX?=
 =?utf-8?B?WGhOYmpDTmExS2ZJZVBrVnhxWEdBdlNEL3V2NlpZRVN6NmFvcXkrbGJ1ZXI1?=
 =?utf-8?B?QllmZlROZXNVNSs0NjNCdStnam5HZjg3NWpOZC9GMUFDUFJnanRyODRvZjF4?=
 =?utf-8?B?ZDJxNHl5aE1uSGc4UHI0SzVRc2Q2a0ZBZ2h1dHlwYmlqbUgwcktld3p1eGwy?=
 =?utf-8?B?WlE5dGpPZkZYWnlndjQ3M1pZQVhXcWlHY1NuMHdtL2VKWEo3SkhoSGxHOGww?=
 =?utf-8?B?SFJ0Z3dwWFZFcTZadDR4YUgvTHdEQ0g1NVB1bklhSzlRL1JscWJvMnArdWI1?=
 =?utf-8?B?WlhiR1FGS2F1WUxtYXhZL05ZRTdyeWFlNzZzRW12TmxvVWw2Mk5zQmZCZEpj?=
 =?utf-8?B?c1kxNzNTYkE0VWw5Q2tiejF6bElvbGQrQUxYV1hXVi9XWFBpZE1wK2lMOEI5?=
 =?utf-8?B?ZnhWN0xGMzJ6UDFTNjV5T1N4eE1pWUg2TDdNd0FwWW5yQkZtNnd2ZWwyZDhN?=
 =?utf-8?B?NmYvS0pzSDJnUk42ek1yY09wTUx4cE81RFc5bld3NVZtY1BKLy9rcTIwRUtm?=
 =?utf-8?B?YStqdUVxdkdQdXNlTFNKUW1wRlREdEVQaXJDMDhieFJocTVNWUMwM2lldEEw?=
 =?utf-8?B?MHJpN04vTTZhV1pVZVV2VGVhNi9Ic1F0NHQ1NTFEdStHKy9IeU9oTjEyWXlW?=
 =?utf-8?B?bm4vSVVrMlpIV2gzYjZCNG5VSi9UZkRiL2VxQlF5UURJaUt0NXlwRTMrUmlz?=
 =?utf-8?Q?9NEBgo?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WWRpZTNVQURORnlpUkFhRDA5aGs1V1J4NnNWUGgvcTBmVVM5VE91T0l0Q1NP?=
 =?utf-8?B?ZHU3V0hISFRoMzNseC9tVDBZNGJzWHhQUk1vSTRsbU1tRllPNzE2ZjEwMmx4?=
 =?utf-8?B?UzgrUGlpTmVkVU55U0pZVHo3SlNVR1hSVlQ3M1JOTnloV2V1ellmaTVqaUN6?=
 =?utf-8?B?T3dhWCtYZzgxOFFuTjVpNUdwd1JvdGVTRVhXb2xOdHEyU1JTWkljU1g3QmpS?=
 =?utf-8?B?c3VOVnl6MzR4bXM1eHBEZzg2VXRWMzhlWERKNUw3cmdUUkpvK0xDTEt6NkJC?=
 =?utf-8?B?M2dnMkxDQ0JmRDNvanJCUVgvQ1dqUlVpMUNjS0dHK1JXZ2t4bE0vM1EyM09j?=
 =?utf-8?B?b2Ura2Jrc3hjZjlrMzFuMXlkWUl1TDF0WUhnS1pKckZvbTRzTTlOeXVZVWYy?=
 =?utf-8?B?bDRvaWRPUWRobDhveHFiUC9lZ01BOHRHLzNSQ0JjaTdFa3ZuRDVjM1dqLzhv?=
 =?utf-8?B?ak1ZZHVGRWE5WFc3K0V5NnRBNU5lT3Zia2wxcG1nWmxVZWhJM0lWZnd5UDVh?=
 =?utf-8?B?OUYrNnh1bVVjbE9wZkFWLzZ2V3pYTmVuQXMwckg0b0t0a01KRGhNVlg2cWVG?=
 =?utf-8?B?cjJLaGN5NEFMb3dzUHZMQ01QY3NuNWxUOUhRbWpWVVJvNUpxWnBGbjZEV3Q5?=
 =?utf-8?B?WnFJTS9YcDdIMmEwZU80L1VQaFg4ckFvdjg5VUs4MEh0QTNYMFlCdTVxbE9X?=
 =?utf-8?B?M2hFZzY0dUsvR1VjQ2lJd1psTmZaMVBzZjFWa1J1M1hkV2tidmgzb1RJR1Iv?=
 =?utf-8?B?Ym95ZHJWOExXMG5WbHdVUHMxdnpLQzArMytwRUhvZFVBZHpXL2ErSjhySkp5?=
 =?utf-8?B?RzZ2YmhsdlNUZlY1M1U3Qk5NR0lXQWF4cGR1aXB6emFOYXVCR0k5NmZSQ21P?=
 =?utf-8?B?RTZRdUEyNmlTRCt6UTRyTkNjUlA0eDJ2UmVXS1pGMnZSRnRzYnNadVJvcCtW?=
 =?utf-8?B?VXJNd1FPK1gwWVNhQmZGNU9PSlZ0YUtMUE1xb1JiM3pUUmFhTFV0ODkzZllC?=
 =?utf-8?B?OExHYms4djAvMkpBalJuS081ZGI4ZmZZNndGOW1QUWxCMDVmSTlWdm1hcEdD?=
 =?utf-8?B?dEZsUmFRVy84U1B3Zmt0L0VqSGloMU9SaHRtT0ZiTnplTFJIZjNjYnVndXBR?=
 =?utf-8?B?ZHVGVWV1NEtkemgrMzVHZzhQbWdYYS8zcmpzQmhWSzZaK3hGQmlWZXZrVDBX?=
 =?utf-8?B?Nzdwa3BTdDVzOFFMb2E2N2lFbjFad2J3R3F0SlA1OW5lR3JkWmlsZ05kWHFn?=
 =?utf-8?B?VzBodmgvbEFadEZCUWZRNE1IR2NyZUM3SVp5aGJQWmx3YnB6WG43b2VmRXc2?=
 =?utf-8?B?NFdoYlZ4VWFOMFVOc2hmeW9hT2hEUlFvbDhRd3VLWGV4ZmZDVmRXbVFMLzY2?=
 =?utf-8?B?UHBCazBFajV2OVdLV0ZCK2JYY21wcE9BcnJDTWltY3FBSkljUmxDYnlHZi9v?=
 =?utf-8?B?d1JuWG5HSEJqM3Zkbk1wL0dLdjhML2NTWnNlckF3MVpjMzZCUExPSmJRM2h1?=
 =?utf-8?B?OWNBMGRMekpSekdzR2VQMDVKenRINWdZQkx4N0dBdzFMOXdGUFN1bjNDMXdX?=
 =?utf-8?B?QzduVGtKa0YycEpKUWhqY2xxUmtYWVhub0t0U1NNQzhpMXNKMTVCeGg0bFpI?=
 =?utf-8?B?ZkxaMkVxODFCVW55c2ZkOExaWW5ZY29uNDVEUmZPVCtjS1FWWDdEdFdMS3hZ?=
 =?utf-8?B?NEVCUng4Y1lpaDRBa1REcGxyalY3dGx5eWFBUVQxM2UxLzIvZHJYT09LOHN4?=
 =?utf-8?B?VzZIUGo5bkVRS1JVOEx1NWZMQklWOW9KdU1SRVFXdTBxYXlwSTN4ZTN2alJE?=
 =?utf-8?B?VisxTVB1SWx4eXRIazEvVFcrR1BJazNDVWNxTnZEOXllNEw3MWI4MUcwL2JR?=
 =?utf-8?B?a1QwajNvaldhUXAyOG5vbEZqcHJ4eTZHajB4MXozb3l6Y0g4K1VWWGVvcS9H?=
 =?utf-8?B?NjhxRmxpa2xMT1JxekdHNndtUTg4L2R1L1dNNDVyLys0SEkwTkkxRTlMZm1N?=
 =?utf-8?B?anRYQzhEMVF6cjUzS1BxM2lXNmxZYXlOVWJuV2o5WHo1alpaQ0g0VSt3OWVu?=
 =?utf-8?B?d2tjWVdscEFmdXNaWVFjUmZzNERNczdidnduajZCZ1FDVXh2R0ZrWTI5UWJM?=
 =?utf-8?Q?ghUJQGXx/rJK4Wb8wFWcktDQ0?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c136b14c-7344-40cd-6573-08de2d285fc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2025 20:14:16.1539 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lzDJJ/WOtJtALAWxM53/H5st8k/zqC3KILmjiDgtV2y8PhZvSgIkXsVziwMqG6VdmozkqZLe1rpnHY1EWgKZHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4105
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

DQoNCj4gT24gTm92IDI1LCAyMDI1LCBhdCA4OjAz4oCvUE0sIEFsZXhhbmRyZSBDb3VyYm90IDxh
Y291cmJvdEBudmlkaWEuY29tPiB3cm90ZToNCj4gDQo+IO+7v09uIFdlZCBOb3YgMjYsIDIwMjUg
YXQgODoyOSBBTSBKU1QsIEpvZWwgRmVybmFuZGVzIHdyb3RlOg0KPj4gSGkgQWxleCwNCj4+IA0K
Pj4gT24gMTEvMjQvMjAyNSAyOjAxIEFNLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90ZToNCj4+Pj4g
Ly8vDQo+Pj4+IC8vLyAjIEludmFyaWFudHMNCj4+Pj4gLy8vDQo+Pj4+IEBAIC02OSw2ICsxNTYs
MTUgQEAgcHViIGZuIGl0ZXJfaGVhZHMoJnNlbGYpIC0+IENsaXN0SGVhZEl0ZXI8J18+IHsNCj4+
Pj4gICAgICAgICAgICAgaGVhZDogJnNlbGYuMCwNCj4+Pj4gICAgICAgICB9DQo+Pj4+ICAgICB9
DQo+Pj4+ICsNCj4+Pj4gKyAgICAvLy8gQ3JlYXRlIGEgaGlnaC1sZXZlbCBpdGVyYXRvciBvdmVy
IHR5cGVkIGl0ZW1zLg0KPj4+PiArICAgICNbaW5saW5lXQ0KPj4+PiArICAgIHB1YiBmbiBpdGVy
PEw6IENsaXN0TGluaz4oJnNlbGYpIC0+IENsaXN0SXRlcjwnXywgTD4gew0KPj4+PiArICAgICAg
ICBDbGlzdEl0ZXIgew0KPj4+PiArICAgICAgICAgICAgaGVhZF9pdGVyOiBzZWxmLml0ZXJfaGVh
ZHMoKSwNCj4+Pj4gKyAgICAgICAgICAgIF9waGFudG9tOiBQaGFudG9tRGF0YSwNCj4+Pj4gKyAg
ICAgICAgfQ0KPj4+PiArICAgIH0NCj4+PiBUaGlzIGxvb2tzIHZlcnkgZGFuZ2Vyb3VzLCBhcyBp
dCBnaXZlcyBhbnkgY2FsbGVyIHRoZSBmcmVlZG9tIHRvIHNwZWNpZnkNCj4+PiB0aGUgdHlwZSB0
aGV5IHdhbnQgdG8gdXBjYXN0IHRoZSBgQ2xpc3RgIHRvLCB3aXRob3V0IHVzaW5nIHVuc2FmZSBj
b2RlLg0KPj4+IE9uZSBjb3VsZCBlYXNpbHkgaW52b2tlIHRoaXMgd2l0aCB0aGUgd3JvbmcgdHlw
ZSBhbmQgZ2V0IG5vIGJ1aWxkIGVycm9yDQo+Pj4gb3Igd2FybmluZyB3aGF0c29ldmVyLg0KPj4+
IA0KPj4+IEEgc2FmZXIgdmVyc2lvbiB3b3VsZCBoYXZlIHRoZSBgQ2xpc3RgIGdlbmVyaWMgb3Zl
ciB0aGUga2luZCBvZg0KPj4+IGNvbnZlcnNpb24gdGhhdCBuZWVkcyB0byBiZSBwZXJmb3JtZWQs
IHVzaW5nIGUuZy4gYSBjbG9zdXJlOg0KPj4+IA0KPj4+ICBwdWIgc3RydWN0IENsaXN0PCdhLCBU
LCBDOiBGbigqbXV0IGJpbmRpbmdzOjpsaXN0X2hlYWQpIC0+ICptdXQgVD4gew0KPj4+ICAgICAg
aGVhZDogJidhIENsaXN0SGVhZCwNCj4+PiAgICAgIGNvbnY6IEMsDQo+Pj4gIH0NCj4+PiANCj4+
PiBgZnJvbV9yYXdgIHdvdWxkIGFsc28gdGFrZSB0aGUgY2xvc3VyZSBhcyBhcmd1bWVudCwgd2hp
Y2ggZm9yY2VzIHRoZQ0KPj4+IGNyZWF0b3Igb2YgdGhlIGxpc3QgdG8gYm90aCBzcGVjaWZ5IHdo
YXQgdGhhdCBsaXN0IGlzIGZvciwgYW5kIHVzZSBhbg0KPj4+IGB1bnNhZmVgIHN0YXRlbWVudCBm
b3IgdW5zYWZlIGNvZGUuIEhlcmUgaXMgYSBkdW1teSBleGFtcGxlOg0KPj4+IA0KPj4+ICAgIGxl
dCBoZWFkOiBiaW5kaW5nczo6bGlzdF9oZWFkID0gLi4uOw0KPj4+IA0KPj4+ICAgIC8vIFNBRkVU
WTogbGlzdF9oZWFkIGFsd2F5cyBjb3JyZXNwb25kcyB0byB0aGUgYGxpc3RgIG1lbWJlciBvZg0K
Pj4+ICAgIC8vIGB0eXBlX2VtYmVkZGluZ19saXN0X2hlYWRgLg0KPj4+ICAgIGxldCBjb252ID0g
fGhlYWQ6ICptdXQgYmluZGluZ3M6Omxpc3RfaGVhZHwgdW5zYWZlIHsNCj4+PiAgICAgICAgY3Jh
dGU6OmNvbnRhaW5lcl9vZiEoaGVhZCwgdHlwZV9lbWJlZGRpbmdfbGlzdF9oZWFkLCBsaXN0KQ0K
Pj4+ICAgIH07DQo+Pj4gDQo+Pj4gICAgLy8gU0FGRVRZOiAuLi4NCj4+PiAgICB1bnNhZmUgeyBD
bGlzdDo6ZnJvbV9yYXcoaGVhZCwgY29udikgfQ0KPj4+IA0KPj4+IFRoZW4gYGNvbnZgIHdvdWxk
IGJlIHBhc3NlZCBkb3duIHRvIHRoZSBgQ2xpc3RJdGVyYCBzbyBpdCBjYW4gcmV0dXJuDQo+Pj4g
cmVmZXJlbmNlcyB0byB0aGUgY29ycmVjdCB0eXBlLg0KPj4+IA0KPj4+IEJ5IGRvaW5nIHNvIHlv
dSBjYW4gcmVtb3ZlIHRoZSBgQ2xpbmtMaXN0YCBhbmQgYEZyb21MaXN0SGVhZGAgdHJhaXRzLA0K
Pj4+IHRoZSBgaW1wbF9mcm9tX2xpc3RfaGVhZGAgYW5kIGBjbGlzdF9pdGVyYXRlYCBtYWNyb3Ms
IGFzIHdlbGwgYXMgdGhlDQo+Pj4gaGlkZGVuIGFkLWhvYyB0eXBlcyB0aGVzZSBjcmVhdGUuIEFu
ZCBpbXBvcnRhbnRseSwgYWxsIHVuc2FmZSBjb2RlIG11c3QNCj4+PiBiZSBleHBsaWNpdGx5IHNw
ZWNpZmllZCBpbiBhbiBgdW5zYWZlYCBibG9jaywgbm90aGluZyBpcyBoaWRkZW4gYnkNCj4+PiBt
YWNyb3MuDQo+Pj4gDQo+Pj4gVGhpcyBhcHByb2FjaCB3b3JrcyBiZXR0ZXIgaW1obyBiZWNhdXNl
IGVhY2ggYGxpc3RfaGVhZGAgaXMgdW5pcXVlIGluDQo+Pj4gaG93IGl0IGhhcyB0byBiZSBpdGVy
YXRlZDogdGhlcmUgaXMgbm8gYmVuZWZpdCBpbiBpbXBsZW1lbnRpbmcgdGhpbmdzDQo+Pj4gdXNp
bmcgdHlwZXMgYW5kIHRyYWl0cyB0aGF0IHdpbGwgb25seSBldmVyIGJlIHVzZWQgaW4gYSBzaW5n
bGUgcGxhY2UNCj4+PiBhbnl3YXkuIEFuZCBpZiB0aGVyZSB3YXMsIHdlIGNvdWxkIGFsd2F5cyBj
cmVhdGUgYSBuZXd0eXBlIGZvciB0aGF0Lg0KPj4gDQo+PiBJIGFncmVlIHdpdGggeW91ciBzYWZl
dHkgY29uY2VybnMsIGluZGVlZCBpdCBpcyBwb3NzaWJsZSB3aXRob3V0IGFueSBzYWZldHkNCj4+
IGNvbW1lbnRzIHRvIGJ1aWxkIGl0ZXJhdG9ycyB5aWVsZGluZyBvYmplY3RzIG9mIHJhbmRvbSB0
eXBlLiBJIHRoaW5rIHRoZSBjb252DQo+PiBmdW5jdGlvbiBpcyBhIGdvb2QgaWRlYSBhbmQgd2l0
aCB0aGUgYWRkaXRpb24gb2YgdW5zYWZlIGJsb2NrcyB3aXRoaW4gdGhlIGNvbnYuDQo+PiANCj4+
IE9uZSB0aGluZyBJIGFtIGNvbmNlcm5lZCBpcyB3aXRoIHRoZSB1c2VyIGludGVyZmFjZS4gSSB3
b3VsZCBsaWtlIHRvIGtlZXAgdGhlDQo+PiB1c2VyIGludGVyZmFjZSBhcyBzaW1wbGUgYXMgcG9z
c2libGUuIEkgYW0gaG9waW5nIHRoYXQgd2l0aCBpbXBsZW1lbnRpbmcgeW91cg0KPj4gaWRlYSBo
ZXJlIG9uIHRoaXMgd2l0aCB0aGUgY2xvc3VyZSwgd2UgY2FuIHN0aWxsIGtlZXAgaXQgc2ltcGxl
LCBwZXJoYXBzIGdldHRpbmcNCj4+IHRoZSBhc3Npc3RhbmNlIG9mIG1hY3Jvcy4gSSB3aWxsIGdp
dmUgaXQgYSB0cnkuDQo+IA0KPiBXZSBzaG91bGQgYmUgYWJsZSB0byBidWlsZCBtb3JlIGNvbnZl
bmllbnQgaW50ZXJmYWNlcyBvbiB0b3Agb2YgdGhpcw0KPiBjbG9zdXJlLWJhc2VkIGRlc2lnbiAo
aG9wZWZ1bGx5IHdpdGhvdXQgdGhlIGhlbHAgb2YgbWFjcm9zKS4NCj4gDQo+IEJ1dCBmaXJzdCwg
b25lIG5lZWRzIHRvIHJlY29nbml6ZSB0aGF0IHRoaXMgQ2xpc3QgaW50ZXJmYWNlIGlzIG5vdCB5
b3VyDQo+IHJlZ3VsYXIsIGVhc3ktdG8tdXNlIFJ1c3QgaW50ZXJmYWNlIC0gaXQgaXMgZGVzaWdu
ZWQgZm9yIHNwZWNpZmljIGNhc2VzDQo+IHdoZXJlIHdlIG5lZWQgdG8gaW50ZXJhY3Qgd2l0aCBD
IGNvZGUgYW5kIGRvIHVuc2FmZSB0aGluZ3MgYW55d2F5Lg0KPiANCj4gU3RpbGwsIHRoZSBtb3N0
IGNvbW1vbiAobWF5YmUgZXZlbiB0aGUgb25seT8pIGNvbnZlcnNpb24gcGF0dGVybiB3aWxsIGJl
DQo+ICJzdWJzdHJhY3QgYW4gb2Zmc2V0IGZyb20gdGhlIGFkZHJlc3Mgb2YgdGhpcyBsaXN0X2hl
YWQgYW5kIGNhc3QgdG8gdGhpcw0KPiB0eXBlIi4gSW5zdGVhZCBvZiBleHByZXNzaW5nIHRoaXMg
dGhyb3VnaCBhIGNsb3N1cmUgdXNpbmcNCj4gYGNvbnRhaW5lcl9vZmAsIG1heWJlIHdlIGNhbiBo
YXZlIGEgZGVkaWNhdGVkIGNvbnN0cnVjdG9yIGZvciB0aGVzZQ0KPiBjYXNlczoNCj4gDQo+ICBw
dWIgdW5zYWZlIGZyb21fcmF3X2FuZF9vZmZzZXQ8Y29uc3QgTElTVF9PRkZTRVQ6IHVzaXplPihw
dHI6ICptdXQgYmluZGluZ3M6Omxpc3RfaGVhZCkgLT4gIENsaXN0PCdhLCBULCAuLi4+DQo+IA0K
PiBgTElTVF9PRkZTRVRgIGNvdWxkIGJlIHNwZWNpZmllZCBieSBjYWxsZXJzIHVzaW5nIHRoZSBg
b2Zmc2V0X29mYCBtYWNyby4NCj4gVGhpcyBtZXRob2Qgd291bGQgdGhlbiBjYWxsIHRoZSBtb3Jl
IGdlbmVyaWMgYGZyb21fcmF3YCBjb25zdHJ1Y3RvciwNCj4gcGFzc2luZyB0aGUgcmlnaHQgY2xv
c3VyZS4gQW5kIHdpdGggdGhhdCB5b3UgaGF2ZSBhIG1vcmUgY29udmVuaWVudA0KPiBpbnRlcmZh
Y2UuIDopDQoNCkdyZWF0ISBUaGlzIG1ha2VzIGl0IGVhc3kgdG8gdXNlLiBJIHdpbGwgZG8gaXQg
dGhpcyB3YXkgdGhlbiAtIEkgYW0gYXNzdW1pbmcgZXZlcnlvbmUgaXMgb2sgYmFraW5nIGluIHRo
aXMga2luZCBvZiB1c2VjYXNlIGFzc3VtZWQgKHN1YnRyYWN0aW9uIG9mIG9mZnNldCkuIElmIGFu
eW9uZSBpcyBub3QsIHBsZWFzZSByYWlzZSB5b3VyIGNvbmNlcm4uIA0KDQo+IA0KPj4gDQo+Pj4g
QWxzbyBhcyBJIHN1c3BlY3RlZCBpbiB2MSBgQ2xpc3RgIGFwcGVhcnMgdG8gZG8gdmVyeSBsaXR0
bGUgYXBhcnQgZnJvbQ0KPj4+IHByb3ZpZGluZyBhbiBpdGVyYXRvciwgc28gSSdtIG1vcmUgY29u
dmluY2VkIHRoYXQgdGhlIGZyb250IHR5cGUgZm9yDQo+Pj4gdGhpcyBzaG91bGQgYmUgYENsaXN0
SGVhZGAuDQo+PiANCj4+IFRoaXMgcGFydCBJIGRvbid0IGFncmVlIHdpdGguIEkgcHJlZmVyIHRv
IGtlZXAgaXQgYXMgYENsaXN0YCB3aGljaCB3cmFwcyBhDQo+PiBzZW50aW5lbCBsaXN0IGhlYWQu
IEEgcmFuZG9tIGBDbGlzdEhlYWRgIGlzIG5vdCBuZWNlc3NhcmlseSBhIHNlbnRpbmVsLg0KPiAN
Cj4gSSBleHByZXNzZWQgbXlzZWxmIHBvb3JseSAtIHdoYXQgSSBtZWFudCBvZiB0aGF0IGBDbGlz
dEhlYWRgIHNob3VsZCBiZQ0KPiB0aGUgb25seSB0eXBlIHlvdSBuZWVkIGZvciB0aGUgbG93LWxl
dmVsIGl0ZXJhdGlvbiAod2hpY2ggc2hvdWxkIG5vdCBiZQ0KPiBwdWJsaWMpLg0KDQpGb3IgbG93
IGxldmVsIGl0ZXJhdGlvbiBpdCBpcyBhbHJlYWR5IHZpYSB0aGF0IHR5cGUuIFRoZXJlIGFyZSAy
IGl0ZXJhdG9ycy4gVGhlIGhpZ2hlciBsZXZlbCB1c2VzIHRoZSBsb3dlciBsZXZlbCBvbmUuIEkg
Y291bGQgbWFrZSBpdCBldmVuIHNpbXBsZXIgYW5kIGNvbGxhcHNlIGJvdGhlciBpdGVyYXRvcnMg
aW50byBvbmUgLSB0aGF0IHlpZWxkcyB0aGUgZmluYWwgdHlwZSBULiANCg0KPiANCj4gQW5kIGlm
IENsaXN0IGVuZHMgdXAganVzdCBiZWluZyBhIHByb3ZpZGVyIGZvciBhIENsaXN0SXRlcmF0b3Is
IHlvdQ0KPiBtaWdodCBqdXN0IGFzIHdlbGwgcmV0dXJuIGEgQ2xpc3RJdGVyYXRvciBmcm9tIHRo
ZSBiZWdpbm5pbmcuIEFueXdheSwNCj4gY29sbGFwc2luZyB0aGUgdHdvIHR5cGVzIGludG8gb25l
IGNhbiBiZSBkb25lIGFmdGVyIHRoZSBkZXNpZ24gbWF0dXJlcw0KPiBpZiBpdCB0dXJucyBvdXQg
dG8gYmUgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvLCBzbyBmZWVsIGZyZWUgdG8ga2VlcCBib3RoDQo+
IGZvciBub3cuDQoNCkkgcHJlZmVyIHRvIGdlbmVyYXRlIHRoZSBpdGVyYXRvciBzZXBhcmF0ZWx5
IGFzIGEgc2Vjb25kIHN0ZXAgIGluIGNhc2Ugd2UgaGF2ZSB0byBleHRlbmQgaXQgdG8gZG8gc29t
ZXRoaW5nIG90aGVyIHRoYW4gaXRlcmF0aW9uIGxhdGVyLCBtYWtlcyBpdCBtb3JlIGZ1dHVyZSBy
ZWFkeSBhbmQgYmV0dGVyIHNlcGFyYXRpb24gb2YgY29uY2VybnMgSU1PLCBhIGxpc3QgY2FuIGJl
IG1vcmUgdGhhbiBqdXN0IGl0ZXJhdGluZywgYW5kIGFzIHlvdSBzYWlkLCB3ZSBjYW4gY29sbGFw
c2UgaXQgbGF0ZXIgaWYgbmVlZGVkLg0KDQpUaGFua3Mu
