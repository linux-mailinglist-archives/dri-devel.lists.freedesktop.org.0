Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBdxHqFchmlfMQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 22:26:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B4A10369B
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 22:26:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F7610E91E;
	Fri,  6 Feb 2026 21:26:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MIVt3OuO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012053.outbound.protection.outlook.com
 [40.107.200.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E28C10E918;
 Fri,  6 Feb 2026 21:26:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yp8dVxtCHh2qW8vh6kj0fckOxDxoEgN3Rq34vIjwbJ4a7qCLFkk/2e1b6LIl2OuIvEnlj0lZ12/v7tVSwPJBTgghB0Yw743xweOZxxGqEhsluTF3/V3qQUDAwh1ddVlFRG+Xu4mblG/pfK1VFoOEoJ/1ruRcThzjnVbgOX2Osp2EdkvQ2CHAZR6N6VNFSfZZtCVQW/X+suOZpXqLuPiLMvGLgX5O9raPfWI3X9a77hk7LQsx2PpbUld+KVVGxzxIGkLj2yg4UcbFnh6kbBkmAgq+yXjyh/fv/eYHGRzgTZrlthWrGsyLyIZfxJxBXnwRlLdvFHVb9Wki+0+z/wCAOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQlOFZ1lOnjsWio7lFuxaXpDB9hUyNZyxVjMTXEVl30=;
 b=KnsreE+05QT3gry0rW/Uh4RdQlFyRjLaRFNepOd+I71lWpnYHu9LuutXDHM6MNL/ku4ZYAotVOtzAuboxbVA88C7FLOC2MjG2q/dYW4tJNv+gkTpjOtR6/ieUTjg09J7Czzdbnryf4T53wsegrobg86gt1lY8GUxmMHRQ8GQT/ZqyvW0Bg5DsTCPZbdGeWMlG1w75W+ke6PwL7FN1pmCUdWlz/lg+70SvZfo1xKC9/VFuOBYjJuTYuRvZsGILX8BlRViiAImBqunSRcMgoDx3I92E4HZqsIscoEQC7ZR+JNeVX9NMDRkrjcBBVL+UMb6LoPgL5qGzDDkKm+CEz/qMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQlOFZ1lOnjsWio7lFuxaXpDB9hUyNZyxVjMTXEVl30=;
 b=MIVt3OuOomnt4gDPWLubHSKUuu0+Mr/XVA/1dXcMMTK7OAEChMAXRrqgcYPvqF3HLyJfMVh+4O61qxXwpSlNjWPw3KtWfvMZQEwpNKXSVtn1RbUKrHQEY+RNsfeXuCO28T0dv/e9Vy6+19aFiLKlbDD0FRzbSWB1vri4ZDDVSEwC2Ss3oMfGG4jpe6+IN82+KfvQTpzaocMvD3HmVmWjL0sdxDlSB6v1QiUY8CoXTQEzKz0bn7dpHozU61V7mVReXvjpYJPy70IfupqqOU4aDJ1Wd4Z7HALc3cYBAhg2v7ky0+/Ng9KWnw/C0h4i/1Wc3kVBe8s+JwvFu2XfV2/tRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 DS0PR12MB7826.namprd12.prod.outlook.com (2603:10b6:8:148::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.15; Fri, 6 Feb 2026 21:26:44 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 21:26:43 +0000
Message-ID: <983b7db3-b0e6-45d6-866e-f001b64abde1@nvidia.com>
Date: Fri, 6 Feb 2026 16:26:40 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v7 1/2] rust: clist: Add support to interface with C
 linked lists
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Andy Ritger <aritger@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20260206004110.1914814-1-joelagnelf@nvidia.com>
 <20260206004110.1914814-2-joelagnelf@nvidia.com>
 <73B64D35-6574-4776-962D-865465C40226@collabora.com>
 <7ed85eca-2a5e-4e8f-8356-e7fbbf7d3a8f@nvidia.com>
 <E846F3BB-DE64-4E6B-ACA3-00F965038478@collabora.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <E846F3BB-DE64-4E6B-ACA3-00F965038478@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:208:23a::24) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|DS0PR12MB7826:EE_
X-MS-Office365-Filtering-Correlation-Id: 87363117-eeaa-46e1-1e95-08de65c66cba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eklQckJ0Z0RzNndBZUh0anZ6OWV1TGdJa1hKZEdsVytYRHBIc0pPTWpHaFpK?=
 =?utf-8?B?blRxQWtVQzFwKzJQNjlrK3RUNlpXakIrVkhET3o2b0N4WmZ0OFk1T1l2ZWhY?=
 =?utf-8?B?elRRL0JSUkN6Mkc3M3Vqc3Z1SHBtb1Z2a1NRL1JIeCtTZiszcXRvZWhHQ2Jn?=
 =?utf-8?B?T01DeUtWT1pUOFpUTDFtNjZMVDB5dFNhWG1rWEdkNmZJYjJoby9YQ21pNUNB?=
 =?utf-8?B?UGNOZ0F3K2FpbktFUzRLejhiTE96MTVIZGFCei9HRXA4Q2k1TlNhbEF3UHc3?=
 =?utf-8?B?YW9Oci9CbVhYS2d3M2NJMEhJOXFYNlhoZDFwbTBZVjhCYVUzdDN3djAxalZy?=
 =?utf-8?B?ME1VODBJUXoxRTA0cDFaT0NlUmdkOEw4clovT0FqZ0dKdklBMlpNZVU1VkZW?=
 =?utf-8?B?azVtTmtMTE5xVnNJMHdFQ09mcnVURE5OV1o3T29YRndRV2xCclpDbHdkbWN5?=
 =?utf-8?B?eWJtODk1MFlObllCdGUvdE1rMThaQ0pTREx2RWNzbkZGd0VnUE5mNUZUbHh6?=
 =?utf-8?B?YmJGNFFmOXFzLzFTMTZVazZlREJVY25HVkZvQnJ6dzBwRTVOL2lTSXhOVldN?=
 =?utf-8?B?TllQTGx6UlJYdkEreGNMY2ovR1dDZTF5UUJWVHhwbkgyV081V2taZDBqeFNS?=
 =?utf-8?B?U2hLYzdvZVROVjNiUnhVMytqR0dkd2k0KzRJSEpSVnduMyt6QkhxeFBWZmxJ?=
 =?utf-8?B?NVVJT1Y4TDBUVjZ6b2ZZdHBpdHg2QU9JbWxpdURmcnZEQk5TTm9PRWVxcHlJ?=
 =?utf-8?B?eVVWbDQxNE13U3YyYzNUOGtyd3Q0SDNJU2RVNjlYckJhUTA5ZW5SODE1SXEx?=
 =?utf-8?B?UUhpbjNXaXpnWkQ2RHJxR0tBMGNHWlEyQnJjdC9vNGFnNlJMbTFxbmxtWUR2?=
 =?utf-8?B?TVQ1SnphblNKMW9EWUhFVXkyRHVUb0s4MDVaWTRqeEZpSUpDM0lYamV6Q09p?=
 =?utf-8?B?T3U3bVpyY2NUbzJCZ3oxZW5OSlltZ2QyaVJxdHMzRTN1ZkpWVWxNT2xVSExt?=
 =?utf-8?B?NFRWemxabVVwY0NPSC9GN1lrUzlDN0NNZVZRK0R3cWp2OTRtQXlyanpjZXBp?=
 =?utf-8?B?ZDJyVjhSOGR0TUpYSUJRdCtLbzhGQnkxaEdGTkRya01nWEYzbXFLUlZmWmZx?=
 =?utf-8?B?RThzYngvNjc1ZUI2aXJQTFpab0xNTEZTSEY1aThaMkc5ekNoeGxZYm5RQm9M?=
 =?utf-8?B?ZWJLeHphZjcvNDFaZVpBV01aLzdDTi9ldzFaK0l3dTlhbnl6RUY0emtjNjFI?=
 =?utf-8?B?K2NNd3lETnozaGI2VTNDYWREcy8yaTl3NlByY1kxaktKSUN0VjNUK1BMQ1Vw?=
 =?utf-8?B?eFdpeE5hdkEraFRMYnB2VDVlbXZ6SU1vTDlhMzJKL0ZYUWZsQitXOG4vbGQ2?=
 =?utf-8?B?VXNoM1A4QlZNN1JIZUpnR1RyVEc0cTdzNG95TUZ3bXQ4Q0RjTzVuRS9FMnI4?=
 =?utf-8?B?TGJaeEhLcGFBWFBoakdKWFRJRnZDY2JNc2ZTTDRHT2ZsRFFDQWtkM3RZQ3Fh?=
 =?utf-8?B?TjBxaG5DckM0VmI4bVpvdGx0M1FQSTNsa21rT0JwK3JzSVBaTzNsQ3FzN0Nl?=
 =?utf-8?B?dkdmOEVJcHBEQnBreWNoZDNFajVvTDNobjNEOGNPZlpQU0J2NFg0NDNBWWNP?=
 =?utf-8?B?cnBoMVlGMGVDcDZUMkFGTmJVNGVGWlJkVEJBY0JGbDdFMFFKMGJrTnZmYkg3?=
 =?utf-8?B?QlJCcWdSeHd5dGRrTlF5YmJYU1h0eFNBN21GTnljWDdXejY1YjJhZUovZUxC?=
 =?utf-8?B?dll4Z0ZMS0oxREo4bE91Snd6RHBXRTUzRjFoWGVhdk9hMXNjQ3Qrb1J4bHJV?=
 =?utf-8?B?WGZUcVdBRnRyNDdkeGJmUm8zM2VRVjUzUGNKUEswcHZPeURyMWpYekpUYVRV?=
 =?utf-8?B?NlBTcnBmZ1hmZHhzVzJNQTRVUFcrNSttWURNNDNnQ0ZSa1JQRXJrU2wwS3Za?=
 =?utf-8?B?d0w0RUhzSHN4c1o1bVpMQmtjbTN3U3FwSStSaC80UTZ4bzErS0FuQjUzZGV0?=
 =?utf-8?B?Rzd3eXVLeFg3MnJaWnk5UnVkSFhZcGtocFRqakRjTG1oWTgwazhMOEJSdjhT?=
 =?utf-8?B?cEFnSFhUM0s1ZGR6T3J5c1Bmd0pWb1JVTUkvL2FrNFA5dks5aEpNM0ZiemZZ?=
 =?utf-8?Q?gVgg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVhwb1hseXVHVThjMUN2TWlpYjVTem5lL0s2YkZkcUhJWHBLWnMwYzZxZzA2?=
 =?utf-8?B?MTRucm5YNyt1RWZFYzc3Q29PYncxYnErMTRwMytMb0l0dURxZ1ppQ2JBc0Ey?=
 =?utf-8?B?UjRlZGtQdklxOFJaMkNSR2wvSE9heDJDWUtwdEF4RmE3M3pobEFqMW0xQWE5?=
 =?utf-8?B?dWpCQURtbGFabU0zTVV6cnZpUEgvNlBmU3dDZ0M0TjllcnkyS2VndU50WWlu?=
 =?utf-8?B?WGdyYTQzclpBbXQ5MWNIT0xMQ0o4U2FIYVE5azZBbXdjYkdSc0ltWmhkTUdH?=
 =?utf-8?B?ZnAwbmQzbHNnSzA3OUtSMHlicUxpY0NXdUVTV3FsV25JYUdKeVUxa2tJWm85?=
 =?utf-8?B?d3FXNE5LUWoxQXN4ZzAwaC9TZ0pzdldKcGh3SldHcURFYjNIKytWTloycWRk?=
 =?utf-8?B?VW1UejdFdnc5TzhTSmUxdTN6RkpTTEsyakI4dHdteEF3a3VBem1RWm5sTE9r?=
 =?utf-8?B?VEhFSkl3cXYxZ0pkblhjc1puS2E4VXZHL1lGOFp2NXdPYjMzUHpCUlpPb2s2?=
 =?utf-8?B?TEhOUnNiRzlHRjlTRWFVR21VY1dORHdBdmdLbkxOQkVIR3dFUEFrSXZPak5I?=
 =?utf-8?B?akNCUk44eWhvNTlJL3ViT0hPWmZreGJQeHoydXNadEJGL05XVWdpQ01heWk1?=
 =?utf-8?B?MmU5a3g3RndSd3F4RTFBbWJpcGZlU3ZwOXM4NGZnbW1DTmZwWkpQYSs4bXlC?=
 =?utf-8?B?VXAza2szMC9LTkY3RzRqWWhNQU80b0FHMDNyRGhKYWdiSWM4THRnTFMvSDdY?=
 =?utf-8?B?dlRLZHAzM2VlY05Na2RLR1c5QWdWWGQ3N01aVGRYVk5wTHB0VjE4Ty9oTEJw?=
 =?utf-8?B?YkZ0Z2FuZVlPMGtpVzdIc0RoM25ZTkhVR0JqeHZPejdabGQyMW9EVU1ubS9a?=
 =?utf-8?B?SVdOSXBjU1NVWmYvMjBsbXZURm1JNk9OQTFBVVNLVjBUZkdYUlNsQVpOUTZU?=
 =?utf-8?B?VloyRHdYTm1KdXA4ci9ZUVU1U1c0YnBxSlZ2RDdiM09oKzNZd2F1VzVONU9Y?=
 =?utf-8?B?S2p6ZXBjckExOWp2T01yQXZ5VmxkYXRGcVlDcHFaRlJRRW52K1JId21OOFE0?=
 =?utf-8?B?U2tXSFVPTUlaZWxRSCtlRFdhVFY5SmxoUDRNQTFRQ0lNbTlkdUtiZlVEa3Nq?=
 =?utf-8?B?dVBSaXJUSm9Gdmt4alg2ODJIV0NHSTBaTWZmZndOemNhckVWSlFVblEvYmNs?=
 =?utf-8?B?MEduYUNUYm03L1lDVXg4U0xSZUxOREVCSUlCa0JRZEE2TThzQjIydHZIdkI5?=
 =?utf-8?B?NlNUTVNydVprY29rYjZoVlFmdU9laklURnpMczF2TjJCT0pUUzE3YlpQT1VW?=
 =?utf-8?B?aEU0Ulk1MDZHTFI3RERYaWt1aGVha2dOdVpSbFVNTndZNGZjTE5MNytteTlG?=
 =?utf-8?B?WWJVdUJvMjdESkRaT0xSeFQrUFl2Sm9LYVRIRm95YUpCTFJRK0RBWVlSL0g1?=
 =?utf-8?B?STVwL1psYVRvYVkyNEpwTnZKV0lOVHRmd1NheG1mSVNpKzUxV24xVGJQUmUy?=
 =?utf-8?B?Q2tkOWxXbnJGN1pDb0FyVURNcWFPdC9VS3lGcXI4ZG9SK09sVTY1bWpVTHRs?=
 =?utf-8?B?NjQxNHhKK3RrdnV2RnF4dW9iK1pTQ3FuUXhQdVNTN2FGUjVvNzEzcU5CYi9X?=
 =?utf-8?B?SjV5SFdPTk40RG9NYi81UmlrLzNlOXlSNTlkM2RYZFpYYlZXaEFqU1hid0tp?=
 =?utf-8?B?WERKdTNtZStVOFVVRmxmKzBIRmRZVzFoR2lPcmg3NXBaN2tvV3ZaQWJFS0FX?=
 =?utf-8?B?NFl4blkvT1lXWkJxQmdDTnE4eWNFOTAyZkpjSTZjaHZtMW5SN2VtbjlZaWNY?=
 =?utf-8?B?YXZjMWgrM3lrM1BzVGdaREViN1RZY1FUVTBFNnFyckZ1SGk5TVV5Sk1iaGx6?=
 =?utf-8?B?Wk11N2JpWFl0ZnNJK2ZxODk1WjdnVEtza0U2Q3pmdzR5UmZCck5GNys0cFdT?=
 =?utf-8?B?OExaZ2xDWTVIWnRodncvV0owb2pDVCtpNk05Y2grWEUxSGplalkrYnRWdXZ3?=
 =?utf-8?B?RzMvUDl1ZndWUFBxYkcvbjJLb05HTVAwN0tzdzdscHF1OEtxbjdBS3ZVdld6?=
 =?utf-8?B?WWgxa3RiY3V0Q2FFdUFXWUFkejJyOTBybEZRb1Y4SlRoU01Kb0g4bGhpbjBh?=
 =?utf-8?B?UTJvckdueW1CRUw3ek9TOE5rUnl0OXdsTW5RQzZWWlRyL3k5WHNVWndidUc2?=
 =?utf-8?B?VW5hMnE5K21QdFdlU3NLTUp5bUZJYWVWbmlWWmhyNlhPZWRqNjBKMDJCS0d6?=
 =?utf-8?B?MmxtUWdvVVk3MXBvMDRZMFh3VHU1MDhrYjAzTXZiLzZHSXRMQk1mVGxiZ2Zl?=
 =?utf-8?B?ZXU2QlA2OGp0dkEwM0U3V3JJU2hxT1dkL3lJdGpHZGtENEgrMWoxQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87363117-eeaa-46e1-1e95-08de65c66cba
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 21:26:43.7053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RXdr/0nSATeWuoOob73pFvJfGqmzo6ld8aSBB4okPPhwYWWpCPPt/bOK8Y/i3vcCV1wsg5ztXLEQw7K7DSQYog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7826
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,joelfernandes.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D1B4A10369B
X-Rspamd-Action: no action



On 2/6/2026 4:21 PM, Daniel Almeida wrote:
> 
> 
>> On 6 Feb 2026, at 17:51, Joel Fernandes <joelagnelf@nvidia.com> wrote:
>>
>> Hi Daniel,
>> Hope you do not mind me replying piecemeal as I can reply more quickly. Thank
>> you for all the comments.
>>
>> On 2/6/2026 12:49 PM, Daniel Almeida wrote:
>>>> +use crate::{
>>>> +    bindings,
>>>> +    types::Opaque, //
>>>> +};
>>>> +
>>>> +use pin_init::PinInit;
>>>> +
>>>> +/// Wraps a `list_head` object for use in intrusive linked lists.
>>>> +///
>>>> +/// # Invariants
>>>> +///
>>>> +/// - [`CListHead`] represents an allocated and valid `list_head` structure.
>>>> +/// - Once a [`CListHead`] is created in Rust, it will not be modified by non-Rust code.
>>>> +/// - All `list_head` for individual items are not modified for the lifetime of [`CListHead`].
>>>
>>> Can you expand on the two points above?
>>
>> This is basically saying that a C `list_head` that is wrapped by a `CListHead`
>> is read-only for the lifetime of `ClistHead`. modifying the pointers anymore.
>> That is the invariant.
>>
>> Or did I miss something?
>>
>> -- 
>> Joel Fernandes
>>
>>
> 
> 
> Yeah, but my point being: is there a reason why the underlying list has to
> remain read-only? Is this a safety requirement or an invariant that is established
> by the code above?
I'm not fully sure if it's an invariant or a safety requirement, but anyone
creating a C list head on the rust side must guarantee that it is not modified.
Since rust has no visibility on the C side, I believe it is a Rust invariant
here that the existence of CListHead assumes that the list cannot be modified
once Rust has access over it.  That is up to the creator (user) of the CListHead
to guarantee. In the DRM buddy case, once the list is allocated and accessible
from Rust, C code will not modify it while the Rust object exists.

Does that make sense, or is there a better way to document this?

--
Joel Fernandes

