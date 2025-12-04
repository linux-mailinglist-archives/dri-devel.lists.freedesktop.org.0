Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2BECA592A
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 22:57:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 217A810E9C9;
	Thu,  4 Dec 2025 21:57:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rIp+aR6b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011019.outbound.protection.outlook.com [40.107.208.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9A910E042;
 Thu,  4 Dec 2025 21:57:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wh3gLDV+5MuP3TXKRzmRb0kHaO8droXSqUHI1tBE8DvRv9Zo8MIvPL4S/bNC/IesaZbgO7dSyAlw/qDlfaG34dbiyXwNWvA5NTAWwX1sj1M3oYvObm+Xt3U6on6qFglquOppymv9Ap3cwE0GGoO+76QTIe605vvT1wyu4RJJCrHDc5Hp7xvCR3o9nXWoGMao78/I8u3EwRYe934+IAYVS6TEkOmjsaBZGP9nqIUtfRRf2YQ6iUU0E5+G1JEmw53H5zfna1+g+Z0RsnZYq2pFIysItcunv2MEZT30kV3N/utDr4DqKsGK7EDK/ylBZuk8j8ss2fa7PBJDGPyoZ9K1+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3bzxfmBwLswagKFe6mnvufQUmh16VjsA0y74U/CIs4=;
 b=gWxAMUGsGqJLupElUlxFOUTJlKvBrrMIs8ZWnkfz4FDEQEsK+X+b96qrmEQ3hG3WbOOhcbZ29gsUJv1/DIYG2c1x4RvRu/c3SUGSSNd9oTgBbWP6+5DsR4NtRK4blf97oxLxaZ3xYnU1atOWBZ7UUezeJkG0xkheyBHUvl3vwOhvlzsDqE9SblnQ7zCAQOUudOMsX1uMq5q1BKwrGEHmBX2Y9xLPXrevcJixoDS8Vva+mJkBtdXJu9F6OChBRhFitcI2jSvuPUzdUGxvLxi7QYLXlX2MhUc8QGaForxWbJo2bsnWZ7qfGtejhOGz8/TVZ4qe1zqEjYioc+O7DJiUaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c3bzxfmBwLswagKFe6mnvufQUmh16VjsA0y74U/CIs4=;
 b=rIp+aR6b/erAdeaTajnMvet+jeeB4Q2YGn84cB3rYeJvCU7d1BapTqMh0EDjf8k6bjZ8o3M7KE3Sg12/Zu1vCXhfQuneR1QxKUefEzyyoGSwXFY6oLN/vSWB+RJ/uh4pF6P0TB+rZSYmdWBJN7VkMcxhhAe4Vjq/zN6fHPpwg72EDwdrxIt1SI0dr8q+ieH5vjMWWrZ3q1GWj++Z2aB+9M7r6F3omlIW3Z8eOcv6qxk0uGle/IqHnrZ4Q2njAhtp1yrTgpvX0TAtMKpIVBGZxCCnRqfkWCLVBxKR8FT+iQEl4dgs7ZsdfnpJtmjtxKbfY8l+XbVRR3vAmQOoa9nY4A==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by LV0PR12MB999094.namprd12.prod.outlook.com (2603:10b6:408:32e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 21:57:10 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 21:57:10 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Danilo
 Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>
CC: Alexandre Courbot <acourbot@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?utf-8?B?QmrDtnJuIFJveSBCYXJvbg==?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, "joel@joelfernandes.org"
 <joel@joelfernandes.org>, Elle Rhumsaa <elle@weathered-steel.dev>, Daniel
 Almeida <daniel.almeida@collabora.com>, Andrea Righi <arighi@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, Zhi Wang <zhiw@nvidia.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, Jonathan
 Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>, Jani
 Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Vivi Rodrigo <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rui Huang <ray.huang@amd.com>, Matthew
 Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>, Lucas
 De Marchi <lucas.demarchi@intel.com>, =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?=
 <thomas.hellstrom@linux.intel.com>, Helge Deller <deller@gmx.de>, Edwin Peer
 <epeer@nvidia.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH v4 0/3] Introduce support for C linked list interfacing
 and GPU Buddy bindings
Thread-Topic: [PATCH v4 0/3] Introduce support for C linked list interfacing
 and GPU Buddy bindings
Thread-Index: AQHcZWheDnTClXaKZEi+sH1lKpnNyLUSBxC9
Date: Thu, 4 Dec 2025 21:57:10 +0000
Message-ID: <548CC7F3-4685-431F-A42B-3D8E048379A1@nvidia.com>
References: <20251204215129.2357292-1-joelagnelf@nvidia.com>
In-Reply-To: <20251204215129.2357292-1-joelagnelf@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|LV0PR12MB999094:EE_
x-ms-office365-filtering-correlation-id: c12ee1e6-788d-443d-a6f2-08de33801336
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?alJVakVQYzhZUWZ4M2ZuaHRrakNaalZveUxmMU5rcVJYSmo3cVhWdzJ6eTRK?=
 =?utf-8?B?RWVGRnBxcXh0ZVc4VFdNTWlvZEVKNUYwRGtSS0hQN1g4ZXQyUjhpUlZ5UURj?=
 =?utf-8?B?Vy9Zc0UwdmljaGpXTVNqNFl1SE05d3NxTTlJWHFwRlAyRnNTYW1KbVgxYS9n?=
 =?utf-8?B?dkVRa0tEMzRIbTdKU0xLUENFWXI4c1BqVTE1NHVCZWJBR0oyRmNRT1BOZzZK?=
 =?utf-8?B?ancrSVNwZEZUTVo0ZmdGU0ZSc3N0cWVZYUpPZStWRFBkalE1OVBXVFRQd1BE?=
 =?utf-8?B?RUFTcmpBbHZRcEtnZ09PKzFlK2RFemVNeU9TVTdkMVg4MHFhdjcyQXhSSzhh?=
 =?utf-8?B?YlBNY2l6am9uU0ZzZUd3UWRSaW13M3R1c1Q1Y0xHNlhibkR3WndTUVBLbWVI?=
 =?utf-8?B?QWNDY3dWcEl6MW1UYTVtQzQzckdHc25LdmczZjM1bEY2TWRobnFrVURudWZB?=
 =?utf-8?B?dWRNMmxoeU1OTnZFMTFhT2hCeGR0aEoySnJqR2U1K2xtNjJUNnFwTkpoNVhT?=
 =?utf-8?B?amVzWW9zVzM3OUorUE1wZlVmaGpEK2V4eFBVWURmSE0xQmE2WXROTHY0aitE?=
 =?utf-8?B?aG43bThER1gwaTVUUHgzQ084NDBSeTNmcFpybjBabXVtR2Q2OFl0T0R3NVRx?=
 =?utf-8?B?K1ExN2VVZEdNdVF5Y0trYnlWVW9Tb0JERm9FUU10bGRjSTQyZDFzNEZrYXJJ?=
 =?utf-8?B?Q3VMazRrL05xUE1FN3orcENxTkR2WUJHZ2xXbnN6bXhjdHdKNkszVGUzSU14?=
 =?utf-8?B?c3ZGekJSVWFZZmRvcWpEMWRkR2pzUUt5WkRyN3lNUU8wWUVYdkRyNXN5akxh?=
 =?utf-8?B?bTVBWVR0MkhkSms4elJWWWtnd2s2a1JpQnQ3QmF1VUx6TmpXd3pZVkk0OTd1?=
 =?utf-8?B?V1E2TnRMR2NDeFJrWkxjT3dncTZYWXYwRTFOYWFuNjlTYmpKa3BuYjZzK1Fa?=
 =?utf-8?B?bzlRTFRCeWJhbDlmRXYzTXdIN0trK2llUURqcEFwSldsMkVldnBLMDYrWk5Y?=
 =?utf-8?B?V3F4MDFuV0duamZzbUpheFRuRnRyMktTV0JMeHhqR1MrcU1zY3BWYVBqM2pj?=
 =?utf-8?B?cWxwN0lvMmZiWmlOSkJIR1E4RWlZaG9NNHRlc0c5OHAzUllpSEJLS2s5dzhB?=
 =?utf-8?B?aElkQWpCODBaR0RPOElFN0N5Q3V1d3h1bTBNcStIcGRLdFREejNNakxZaEZo?=
 =?utf-8?B?Ry9pLzF6cWovZm1Md0pxR1N1WFVOb05vcEdEazRqUmlnY2lkRUtIRTFJdjE0?=
 =?utf-8?B?STdNS0FYWEZHVVlFT1JtVG5YUVc3dWIzRVhCZ1MzUk1EOXVQc09Wd1lOeHFD?=
 =?utf-8?B?K2xrR0RiUWc0YkdPc3VDZzNKNW9pbUs3YmowcGZmY0J5QzZTM1Z2ZCt3YWdv?=
 =?utf-8?B?Tk0yclgxbU9oVjJtcFFDbkZnMEJLSnVJQzNWcnkzTUpMMExETnh3ZFVzMDUw?=
 =?utf-8?B?WWFna3FtQnpPcTlkSUNrVXJEeEhpbHY4c2pGRm02clJiUDZmY1dQbmt4L0lw?=
 =?utf-8?B?VXhVekRzSVMwKzZjeVhpR1l6RUw3OEwxS1Y3QUtnZllrTXcyMkxYMzZERmVT?=
 =?utf-8?B?cjhRTHR1UWNsWFA2REtRU0VmZFB0WC9RQXQwbHRPcGI3VmhPcWRjYXVOeUJW?=
 =?utf-8?B?RW9vNms4VEx4WkhGaC9tVG51SS94bTU5cVZnMjFpK1lJaW9lVGRwQmhsSS9u?=
 =?utf-8?B?VXR0eC8yYUllVlliYnp1MVBLQ3M2MmhabHVMMEVuVzNKM3JuNnBHc3JINzBX?=
 =?utf-8?B?bnJsUGVBbFd6KzRRMk5VL0JsRWpnTnphbmxzVEMwZ1llRzVqZC8zYTNvTWlT?=
 =?utf-8?B?b0cxeWpEZ0FPVDU0N09ocjVvWjV3RjNzcXJDaXR5d2JOM3hBVlhUT0xQK0lZ?=
 =?utf-8?B?RzZHSFNsaE1QQnpob0xJTExIZkU2Z29KMHRZUStsSEU5cGJmQXJJaituUmxh?=
 =?utf-8?B?dmNrM1FETVd1WXZ2RGFxMDU4Zy9IWEhRaXBoaUY4TFU4a3E2T01kLzBueUJH?=
 =?utf-8?B?cHFiTmI3azZtbDVsemltZVRGWWtGYUx3V3R2QUE3b2xDTCtDemFFeG9yVDNz?=
 =?utf-8?B?K2JXMnFWY2JQYWsyL1kvWW9ZZDJyREYybkNTZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dkRNYnFDbFdRTm9Ka0dtSmV2TU15UHNZZHdMS2dya3hMR0g0U1MyVDNsM0dP?=
 =?utf-8?B?a2dkbXBPMkp6MUFMZHJRSVhPUW51Z2JCSm9CVlUxeU41SHpVWGNjRitWUWc5?=
 =?utf-8?B?RjlCVnhSemNkZUxEdDdHTGpIdG9XZkR0REdMcUtPRTdPNDBnL2hhQnNaRERK?=
 =?utf-8?B?ZXFtMnQvVE1IVUVQcnB1Z1ZBT0ltVEdmMGYwdmt2MDRJWlByWkVORUVyQXVR?=
 =?utf-8?B?RXNSNEJSYTBQcUtWTTRSRzR6Y2pMKy9WN1VISXd3Y3VMTjJpTlJFbTFpZjJj?=
 =?utf-8?B?VWJ5MVFQbE13WjQ0YzhlajBUR1FtS3NNS3c1NmMwcXpKbHVaT0RaOWVEQWh3?=
 =?utf-8?B?NXFUdHZUUUdPNGdOeSt3d2xnZHZ3SGlJTHBWcVArTXI4b2ppN2Y2NDlEQ2d4?=
 =?utf-8?B?bmhUb2ZTU0c2cEd4T3EzekpPL3VCWEV1eURyVXdZTHRRenF5aUdCZGRsc091?=
 =?utf-8?B?UTlKK3VIRzRrSUJGOG0vUDIyck1GQmxJNmtxNHJSaG5salJhaDdXVnc3TGFV?=
 =?utf-8?B?aysxNmNnNW5DRVh3TTZpckFHSmt5R1ZKS3J2dUhJNUVNK1ptSXFRdW5zQW5I?=
 =?utf-8?B?czNUTjVvc0F3Qmt5aXhpLytSa09DeHhhRGpmaFZmbEFpTTZ2NFkxY3hRQjND?=
 =?utf-8?B?aEgwWTh2a2tjV0ZlV2p0SENhcWVKTVlmcWdiZEg2WnpXYUVSeElEVm5jMG0r?=
 =?utf-8?B?OW5IV0luK1FTY3ZKRXJwT0FDVHZvNUVsNUEzM1VSam80SDNjbEx5NjNTdWJP?=
 =?utf-8?B?QjhrMjZlT2J0cWp3R29aRTQwd1ZvN3Rsd09JMm1kMFhRVWZiU2YyMTZJczlH?=
 =?utf-8?B?SVU2Tlk1UVN2TkJxYzBFVG5QN2JvcTNzbUI5dytlOFpiMTlFYVE5bGZwbnF1?=
 =?utf-8?B?NHB5WSs3QWlJWDA1YVBMMG5sR3JGZHFoTGhFRnBUOTBlVXk0a0ZXOXBpZ3Zm?=
 =?utf-8?B?VTRYRE5MR1dyaXVUdUxHUkZFdnNRckxnMmNmdEFZbFpLcWpTaGxOSnJPM05y?=
 =?utf-8?B?ZDNiV2pNWEZUTUhuSDFqakszNVJWOEJmMUdlUnZWYUI0L0h2V2JlNVUzV0xz?=
 =?utf-8?B?bHhDOVB3Q2x1a21SYzh3SEZTMm5NYXNSUW5wM2l2RGlOUXNzNzI0NFo0TUJO?=
 =?utf-8?B?N1pocWE5QkJpVTBlazRuRlFydXlZOVYxN2x2UmY0d2ZndFhpU3pmeHdtVS9G?=
 =?utf-8?B?cVFlQVJORExTQU9XNjk0OVNabjErSzJVaXB2bTNaWGZyN09QdzhTdlByUjJC?=
 =?utf-8?B?dytMVXZlVEZpUFl3L2RYSDZRV0NOWVI5UHJDcGp4SHMwQUtWOU1DOTVtZ2Q1?=
 =?utf-8?B?OW5hVksyaXJXSFAxWG16NGprSXRoWUE2R0RqTjllUXY3bTl6elMzK3VCc1hB?=
 =?utf-8?B?WjJNTnIxVWJZTFNJY0luRFRRMDdUeGpqVjZ1eHI5ZnA5ekR4QXJ4dWRsUS9Q?=
 =?utf-8?B?dUcwdVpRVGtyYUVrRGU0VG4xdHNYT014REhaM3VrSUpUKzYxTmFDVEhidTRm?=
 =?utf-8?B?QytKY3RMcFI5ZVZBVm5DVnBob09YM1J6VjU1eTI3YnVCNWRFRFZLQ0RvbHp3?=
 =?utf-8?B?aG90VHZFYXl2M2d2UHpvU1BwdklxdWZSdG9jOStsZGU2aFdMREZQa2tRamh4?=
 =?utf-8?B?T3B2WEEybHNXRmJrbFREVkkxNkxUMUhXSk9DN3p2Q0VEQVNqQS8wb0RDZytK?=
 =?utf-8?B?N2lIVE1uOUFjTGZVNVk1ellMemwrMno2dDhwQnBOOWlhQitZYU5zNmhNV2xE?=
 =?utf-8?B?L0V5cWl2dlJVZ1ZsNGdveHV2RUI1djVDM1BOWGRKbndoMXFZb0ZwU0xCaXJM?=
 =?utf-8?B?TzhCMkdibnRnUjhGeUppOGxHWXZITUtFRGVNd2VoQWlVeFRZUWxzZ29FZUpF?=
 =?utf-8?B?Uk9hdzhyUmorNFVUY0twTzR0MmNscVJiTjJBUE9LWTNFcmE0aksvdCtmblFJ?=
 =?utf-8?B?TXVTbkV5RENnZGJaQXJJTzUydnM4WlpWTE8vaVJVMFVubysvdW9HMDM0dmwv?=
 =?utf-8?B?ZkpmUkRxL1FiUGluNWVBbFdXbitEam1sS0NIQ1B5RSswWlFSRUFBZlNWV2tx?=
 =?utf-8?B?TG00VWN4S1k5WXNaVTBSUVpyeHVZL3VwaWZqZ2w1dDAvaGNRM09FekF6NWxH?=
 =?utf-8?Q?BShkhOh3bjpp8bcQLkm/figgi?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c12ee1e6-788d-443d-a6f2-08de33801336
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2025 21:57:10.3843 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GEusPXko5W/RhFF06CN5jR4xvR4PQ/vGUXFXPiaVQcY1R/+hJNFFSwV3GjKfB3gtj1sGYqklK/dhs4qaHUpvVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB999094
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

PiBPbiBEZWMgNCwgMjAyNSwgYXQgNDo1M+KAr1BNLCBKb2VsIEZlcm5hbmRlcyA8am9lbGFnbmVs
ZkBudmlkaWEuY29tPiB3cm90ZToNCj4gDQo+IO+7v1RoaXMgc2VyaWVzIGNvbWJpbmVzIGEgbnVt
YmVyIG9mIG90aGVyIHNlcmllcyB3aGljaCBidWlsZCB1cCB0byB0aGUgc2FtZSBnb2FsOg0KPiB0
byBtYWtlIGl0IHBvc3NpYmxlIHRvIHVzZSBEUk0gYnVkZHkgZnJvbSBub3ZhLWNvcmUgcnVzdCBj
b2RlLiBTZWUgbGlua3MgdG8gdGhlDQo+IGRpZmZlcmVudCBzZXJpZXMgYmVsb3cuDQo+IA0KPiBU
aGUgZ2l0IHRyZWUgd2l0aCBhbGwgcGF0Y2hlcyBjYW4gYmUgZm91bmQgYXQ6DQo+IGdpdDovL2dp
dC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9qZmVybi9saW51eC5naXQgKHRh
ZzogY2xpc3QtYnVkZHktdjQtMjAyNTEyMDQpDQoNCkZZSSAtIHRoaXMgc2VyaWVzIGlzIHJlYmFz
ZWQgb24gbGludXgtbmV4dCB0byByZWR1Y2UgY29uZmxpY3RzLCBidXQgSSBhbSBoYXBweSB0byBy
ZWJhc2Ugb24gYW5vdGhlciB0cmVlIGlmIG5lZWRlZC9yZXF1ZXN0ZWQuDQoNClRoYW5rcywNCg0K
IC0gSm9lbA0KDQoNCg0KDQoNCj4gDQo+IENoYW5nZXMgZm9yIHY0Og0KPiAtIENvbWJpbmVkIHRo
ZSBjbGlzdCBhbmQgZHJtIGJ1ZGR5IHNlcmllczoNCj4gIC0gQSBydXN0IG1vZHVsZSAoQ0xpc3Qp
IHRvIGFjY2VzcyBjaXJjdWxhciBsaW5rZWQgbGlzdHMgZnJvbSBydXN0IGNvZGUuDQo+ICAtIERS
TSBidWRkeSBhbGxvY2F0b3IgYmluZGluZ3MgdGhhdCB3ZXJlIG9yaWdpbmFsbHkgcGFydCBvZiBS
RkMuDQo+ICAtIERSTSBidWRkeSBhbGxvY2F0b3Igb25lIGxldmVsIHVwIHRvIGRyaXZlcnMvZ3B1
LyBzbyBpdCBjYW4gYmUgdXNlZCBieQ0KPiAgICAgR1BVIGRyaXZlcnMgKGV4YW1wbGUsIG5vdmEt
Y29yZSkgdGhhdCBoYXZlIHVzZWNhc2VzIG90aGVyIHRoYW4gRFJNLg0KPiAtIEFkZCBSdXN0IGJp
bmRpbmdzIGZvciB0aGUgR1BVIGJ1ZGR5IGFsbG9jYXRvci4NCj4gDQo+IE5vdGVzIGZyb20gcGFz
dCBjb3ZlciBsZXR0ZXJzIGFib3V0IENMaXN0Og0KPiANCj4gSW50cm9kdWN0aW9uDQo+ID09PT09
PT09PT09PQ0KPiBUaGlzIHBhdGNoc2V0IGludHJvZHVjZXMgYW4gaW50ZXJmYWNlIHRvIGl0ZXJh
dGUgb3ZlciBkb3VibHkgY2lyY3VsYXIgbGlua2VkDQo+IGxpc3RzIHVzZWQgaW4gdGhlIGtlcm5l
bCAoYWxsb2NhdGVkIGJ5IEMga2VybmVsIGNvZGUpLiBUaGUgbWFpbiB1c2VjYXNlIGlzDQo+IGl0
ZXJhdGluZyBvdmVyIHRoZSBsaXN0IG9mIGJsb2NrcyBwcm92aWRlZCBieSB0aGUgR1BVIGJ1ZGR5
IGFsbG9jYXRvci4NCj4gDQo+IFRoZSBzZXJpZXMgYWxzbyBtb3ZlcyB0aGUgRFJNIGJ1ZGR5IGFs
bG9jYXRvciBvbmUgbGV2ZWwgdXAgYW5kIGFkZHMgUnVzdA0KPiBiaW5kaW5ncyBmb3IgaXQsIGVu
YWJsaW5nIEdQVSBkcml2ZXJzIGxpa2Ugbm92YS1jb3JlIHRvIHVzZSBpdC4NCj4gDQo+IEEgcXVl
c3Rpb24gbWF5IGFyaXNlOiBXaHkgbm90IHVzZSBydXN0IGxpc3QucnMgZm9yIHRoaXM/DQo+ID09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0K
PiBSdXN0J3MgbGlzdC5ycyBpcyB1c2VkIHRvIHByb3ZpZGUgc2FmZSBpbnRydXNpdmUgbGlzdHMg
Zm9yIFJ1c3QtYWxsb2NhdGVkDQo+IGl0ZW1zLiBJbiBkb2luZyBzbywgaXQgdGFrZXMgb3duZXJz
aGlwIG9mIHRoZSBpdGVtcyBpbiB0aGUgbGlzdCBhbmQgdGhlIGxpbmtzDQo+IGJldHdlZW4gbGlz
dCBpdGVtcy4gSG93ZXZlciwgdGhlIHVzZWNhc2UgZm9yIEdQVSBidWRkeSBhbGxvY2F0b3IgYmlu
ZGluZ3MsIHRoZQ0KPiBDIHNpZGUgYWxsb2NhdGVzIHRoZSBpdGVtcyBpbiB0aGUgbGlzdCwgYW5k
IGFsc28gbGlua3MgdGhlIGxpc3QgdG9nZXRoZXIuIER1ZQ0KPiB0byB0aGlzLCB0aGVyZSBpcyBh
biBvd25lcnNoaXAgY29uZmxpY3QgbWFraW5nIGxpc3QucnMgbm90IHRoZSBiZXN0IGFic3RyYWN0
aW9uDQo+IGZvciB0aGlzIHVzZWNhc2UuIFdoYXQgd2UgbmVlZCBpcyBhIHZpZXcgb2YgdGhlIGxp
c3QsIG5vdCBvd25lcnNoaXAgb2YgaXQuDQo+IEZ1cnRoZXIsIHRoZSBsaXN0IGxpbmtzIGluIGEg
YmluZGluZ3MgdXNlY2FzZSBtYXkgY29tZSBmcm9tIEMgYWxsb2NhdGVkDQo+IG9iamVjdHMsIG5v
dCBmcm9tIHRoZSBSdXN0IHNpZGUuDQo+IA0KPiBMaW5rIHRvIHYyIChjbGlzdCBvbmx5KTogaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUxMTExMTcxMzE1LjIxOTYxMDMtNC1qb2VsYWdu
ZWxmQG52aWRpYS5jb20vDQo+IA0KPiBOb3RlcyBhbmQgcGF0Y2hlcyBhYm91dCBEUk0gYnVkZHkg
Y29kZSBtb3ZlbWVudCBhbmQgRFJNIGJ1ZGR5IGJpbmRpbmdzOg0KPiANCj4gTGluayB0byBSRkM6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MTAzMDE5MDYxMy4xMjI0Mjg3LTEtam9l
bGFnbmVsZkBudmlkaWEuY29tLw0KPiBMaW5rIHRvIERSTSBidWRkeSBtb3ZlIGRpc2N1c3Npb246
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MTEyNDIzNDQzMi4xOTg4NDc2LTEtam9l
bGFnbmVsZkBudmlkaWEuY29tLw0KPiANCj4gSm9lbCBGZXJuYW5kZXMgKDMpOg0KPiAgcnVzdDog
Y2xpc3Q6IEFkZCBzdXBwb3J0IHRvIGludGVyZmFjZSB3aXRoIEMgbGlua2VkIGxpc3RzDQo+ICBn
cHU6IE1vdmUgRFJNIGJ1ZGR5IGFsbG9jYXRvciBvbmUgbGV2ZWwgdXANCj4gIHJ1c3Q6IGdwdTog
QWRkIEdQVSBidWRkeSBhbGxvY2F0b3IgYmluZGluZ3MNCj4gDQo+IERvY3VtZW50YXRpb24vZ3B1
L2RybS1tbS5yc3QgICAgICAgICAgICAgICAgICB8ICAgMTAgKy0NCj4gTUFJTlRBSU5FUlMgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgNyArDQo+IGRyaXZlcnMvZ3B1L0tj
b25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMTMgKw0KPiBkcml2ZXJzL2dwdS9N
YWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAyICsNCj4gZHJpdmVycy9ncHUv
YnVkZHkuYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTMxMCArKysrKysrKysrKysrKysr
Kw0KPiBkcml2ZXJzL2dwdS9kcm0vS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgfCAgICAx
ICsNCj4gZHJpdmVycy9ncHUvZHJtL0tjb25maWcuZGVidWcgICAgICAgICAgICAgICAgIHwgICAg
NCArLQ0KPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9LY29uZmlnICAgICAgICAgICAgfCAg
ICAxICsNCj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jICAgICAgIHwg
ICAgMiArLQ0KPiAuLi4vZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yZXNfY3Vyc29yLmggICAg
fCAgIDEyICstDQo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5j
ICB8ICAgODAgKy0NCj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdy
LmggIHwgICAyMCArLQ0KPiBkcml2ZXJzL2dwdS9kcm0vZHJtX2J1ZGR5LmMgICAgICAgICAgICAg
ICAgICAgfCAxMjg3ICstLS0tLS0tLS0tLS0tLS0NCj4gZHJpdmVycy9ncHUvZHJtL2k5MTUvS2Nv
bmZpZyAgICAgICAgICAgICAgICAgIHwgICAgMSArDQo+IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5
MTVfc2NhdHRlcmxpc3QuYyAgICAgICB8ICAgMTAgKy0NCj4gZHJpdmVycy9ncHUvZHJtL2k5MTUv
aTkxNV90dG1fYnVkZHlfbWFuYWdlci5jIHwgICA1NSArLQ0KPiBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9pOTE1X3R0bV9idWRkeV9tYW5hZ2VyLmggfCAgICA2ICstDQo+IC4uLi9kcm0vaTkxNS9zZWxm
dGVzdHMvaW50ZWxfbWVtb3J5X3JlZ2lvbi5jICB8ICAgMjAgKy0NCj4gZHJpdmVycy9ncHUvZHJt
L3Rlc3RzL01ha2VmaWxlICAgICAgICAgICAgICAgIHwgICAgMSAtDQo+IC4uLi9ncHUvZHJtL3R0
bS90ZXN0cy90dG1fYm9fdmFsaWRhdGVfdGVzdC5jICB8ICAgIDUgKy0NCj4gZHJpdmVycy9ncHUv
ZHJtL3R0bS90ZXN0cy90dG1fbW9ja19tYW5hZ2VyLmMgIHwgICAxOCArLQ0KPiBkcml2ZXJzL2dw
dS9kcm0vdHRtL3Rlc3RzL3R0bV9tb2NrX21hbmFnZXIuaCAgfCAgICA0ICstDQo+IGRyaXZlcnMv
Z3B1L2RybS94ZS9LY29uZmlnICAgICAgICAgICAgICAgICAgICB8ICAgIDEgKw0KPiBkcml2ZXJz
L2dwdS9kcm0veGUveGVfcmVzX2N1cnNvci5oICAgICAgICAgICAgfCAgIDM0ICstDQo+IGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9zdm0uYyAgICAgICAgICAgICAgICAgICB8ICAgMTIgKy0NCj4gZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3R0bV92cmFtX21nci5jICAgICAgICAgIHwgICA3MyArLQ0KPiBk
cml2ZXJzL2dwdS9kcm0veGUveGVfdHRtX3ZyYW1fbWdyX3R5cGVzLmggICAgfCAgICA0ICstDQo+
IGRyaXZlcnMvZ3B1L3Rlc3RzL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICB8ICAgIDMgKw0K
PiAuLi4vZ3B1X2J1ZGR5X3Rlc3QuY30gICAgICAgICAgICAgICAgICAgICAgICAgfCAgMzkwICsr
LS0tDQo+IGRyaXZlcnMvZ3B1L3Rlc3RzL2dwdV9yYW5kb20uYyAgICAgICAgICAgICAgICB8ICAg
NDggKw0KPiBkcml2ZXJzL2dwdS90ZXN0cy9ncHVfcmFuZG9tLmggICAgICAgICAgICAgICAgfCAg
IDI4ICsNCj4gZHJpdmVycy92aWRlby9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgIHwg
ICAgMiArDQo+IGluY2x1ZGUvZHJtL2RybV9idWRkeS5oICAgICAgICAgICAgICAgICAgICAgICB8
ICAxNjMgKy0NCj4gaW5jbHVkZS9saW51eC9ncHVfYnVkZHkuaCAgICAgICAgICAgICAgICAgICAg
IHwgIDE3NyArKysNCj4gcnVzdC9iaW5kaW5ncy9iaW5kaW5nc19oZWxwZXIuaCAgICAgICAgICAg
ICAgIHwgICAxMSArDQo+IHJ1c3QvaGVscGVycy9ncHUuYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgMjMgKw0KPiBydXN0L2hlbHBlcnMvaGVscGVycy5jICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgICAyICsNCj4gcnVzdC9oZWxwZXJzL2xpc3QuYyAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgICAxMiArDQo+IHJ1c3Qva2VybmVsL2NsaXN0LnJzICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAzNTcgKysrKysNCj4gcnVzdC9rZXJuZWwvZ3B1L2J1ZGR5LnJzICAgICAgICAg
ICAgICAgICAgICAgIHwgIDUyNyArKysrKysrDQo+IHJ1c3Qva2VybmVsL2dwdS9tb2QucnMgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAgIDUgKw0KPiBydXN0L2tlcm5lbC9saWIucnMgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgICAzICsNCj4gNDIgZmlsZXMgY2hhbmdlZCwgMjk0NCBp
bnNlcnRpb25zKCspLCAxODAwIGRlbGV0aW9ucygtKQ0KPiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9ncHUvS2NvbmZpZw0KPiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvYnVkZHku
Yw0KPiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvdGVzdHMvTWFrZWZpbGUNCj4gcmVu
YW1lIGRyaXZlcnMvZ3B1L3tkcm0vdGVzdHMvZHJtX2J1ZGR5X3Rlc3QuYyA9PiB0ZXN0cy9ncHVf
YnVkZHlfdGVzdC5jfSAoNjglKQ0KPiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvdGVz
dHMvZ3B1X3JhbmRvbS5jDQo+IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS90ZXN0cy9n
cHVfcmFuZG9tLmgNCj4gY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvZ3B1X2J1ZGR5
LmgNCj4gY3JlYXRlIG1vZGUgMTAwNjQ0IHJ1c3QvaGVscGVycy9ncHUuYw0KPiBjcmVhdGUgbW9k
ZSAxMDA2NDQgcnVzdC9oZWxwZXJzL2xpc3QuYw0KPiBjcmVhdGUgbW9kZSAxMDA2NDQgcnVzdC9r
ZXJuZWwvY2xpc3QucnMNCj4gY3JlYXRlIG1vZGUgMTAwNjQ0IHJ1c3Qva2VybmVsL2dwdS9idWRk
eS5ycw0KPiBjcmVhdGUgbW9kZSAxMDA2NDQgcnVzdC9rZXJuZWwvZ3B1L21vZC5ycw0KPiANCj4g
LS0NCj4gMi4zNC4xDQo+IA0K
