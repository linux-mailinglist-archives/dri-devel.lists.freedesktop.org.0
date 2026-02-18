Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6J59FFQolmnxbQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:00:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EB5159B31
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:00:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58CCA10E621;
	Wed, 18 Feb 2026 21:00:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="N5up36Xy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012014.outbound.protection.outlook.com [52.101.43.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C846D10E61B;
 Wed, 18 Feb 2026 20:59:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yWP4QneLQwATYX0z6ks1E6ePBj51QDaMr5GUXamc/wGo+ZTJuIDjtkn8/P57htU1KQXtDyFJ5ZbXI5EZ62k8Wg0bYM5WpwM2L4GpX45xJuTENYdGA8hDl8ghGPek0LIjYA5diaZHUsVGv93hDNfqXnJEthXIpv0+ZM+jpy6N6Ht0pWhPepNBIXNXBGwZWqChMPEjlETBtNLiRwr+/5QKQcazcI6YXPAoE9y5yzjqWVs80e3eNCKfjf6gYYRex7ezpWypMK2wlgI8O60H3Pn7iyIPEkgTGQFY8DifkNmeIflRYkHmXZ1Hl4vcE+cNv2jGAfnqMLOeNgkgn6uOWpLQug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYgsoYQyhBG2hCC3MQWegrjwSyjupOyn+HPDCIAAUa8=;
 b=okdUcYbVqdQ3Am1ojnJNH/17yXzkHsqwZhtNqnDX/bEnlxJ2v5MPvBkaXWIiqhAfP7Zz2HALWFpbPgeg/3VTBKaWbjP9dkXQHfXg8cb1BmmT9Z4D2HRr1CMNGAhOu5J+cx3SgtD1+v3hqZsf/OY9atn3OMAPTJM9oISdQmK+66xZCC2jnt39q04o31ykuP0sfA2IJfVSODlK3r7qOi5wES+KgBUGaW840adb0dfVEpxnwzv53rTuIZ1chjReggRYNJdMKD2/dPF0tpzdDy32wi65ymDOYC66nWUV6cBHQPpdTWubzgk5TIEaiQKiKqkX9Kf1COnElNlzHcYgEuIQ4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYgsoYQyhBG2hCC3MQWegrjwSyjupOyn+HPDCIAAUa8=;
 b=N5up36XySmyhIxhcUQhRvgQ7GjHctRGdLezK9Wtb9vjRx1B/op1bTndN8YVQUQXL86hnep8U2R3XgmhEYOTy67SMHaV4/2b9ZRRe6FYwuJeribH8K/sR5Zp1gCN4WnIvl44xP7jmuhf+8MCzpnwSJjO+Thgo899DRgKwa/6MZajjID/mGQjk1FwdgQBxTkLVKGDKQUcSGWAnK9L1SQR478MWMOJ3ijAhL6V4STZK+Jz8ptU4P/FofW8aDGdYpntDwU3g1zo4x18ZmSWzIKFRMgju/bIJw+LLn3Pi9I/zG2lmNRovfgYBxOqaA0sSVVGFSaz98c450eQ2Yt2dIRGYiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 IA1PR12MB7517.namprd12.prod.outlook.com (2603:10b6:208:41a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Wed, 18 Feb
 2026 20:59:53 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 20:59:53 +0000
Message-ID: <e7b74497-7cfb-4b8c-a73c-afa2acbc7b6e@nvidia.com>
Date: Wed, 18 Feb 2026 15:59:49 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/8] Preparatory patches for nova-core memory
 management
To: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>
Cc: Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>,
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
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20260218205507.689429-1-joelagnelf@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1P223CA0008.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::13) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|IA1PR12MB7517:EE_
X-MS-Office365-Filtering-Correlation-Id: c3b285b5-6d1c-4e0a-f897-08de6f30a9bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2FmZHkzMXJrd2pra0RUVk44R1JTVklrQkFWd0VkWnpMTDZBaklKV0JaTXRt?=
 =?utf-8?B?WDNBODRXUzI3bGdkQnFWVlpVNHR4V3MzeHBPaU9UNFM4RllvL3l1dmNxQlp5?=
 =?utf-8?B?RVd1NHZUaDZzaTlHUjZGRnZmTk5EU3NhaUhxNFNaY1lpZC9adTlQR2RsNFdX?=
 =?utf-8?B?ZTBlSVpYRHRUa2dHU2RjTHZsVlJiZWovaGhpRGpySHlqWlZVMWg0YStZSFdB?=
 =?utf-8?B?a0l1dkVjay80OXBRR2ZOUHZ0RWErUTcvV0F3UCtpcGlZOElxcTg0TFRSRlBV?=
 =?utf-8?B?TThqQ1JFVWZlOTYyWGNWQmZpWGkzbDFhNm5qdUNmb29OQ3NiZzhqT1RoOWxr?=
 =?utf-8?B?OGZ0SWJQdUFYT2lZN1ZYd0sxZVVtUzAxbzdiT2RYaVdreFVkQ0c0dk1GQlpj?=
 =?utf-8?B?YVRETldzU0ZwOG11RDBNVnpKRnhGNkJwSDcva24xbE03N2g2bkhmcGVlYzEx?=
 =?utf-8?B?RDFOaFROV08rcklXT2VleWVRQVZRQzJ3VXQ4WEhWZnZ6VEJCalg2UE1YdTVW?=
 =?utf-8?B?VlNFeSsyMDBtVEJIVFJpbUx4T2U0d00wTEV4SlE3NDJYaGUwRmloVGNzTHZE?=
 =?utf-8?B?ckZuaEhzYzNYcW9ERG4vbC9YOTREeHFPNGI0WStKTElpb3YyUktZcjNhdlox?=
 =?utf-8?B?VTNEeTFTTVE0WjYwTktvNlE2Ui9aR3lXOG51K3hBdGxQcm11QVNnbzE1aW9E?=
 =?utf-8?B?bjlNME9ISXVJdTArMzg4ajJIZlo2TFZMUWFYSDg0REp2OVZRNGtZWHVyTU4w?=
 =?utf-8?B?WWd5Z1JlbnB4dklaNDJTZVdmcUF6Ykl5cmtzRlNVNENBdEVZUlEwQ1JWcHU1?=
 =?utf-8?B?T3ZpN3ZORTRQYis4WjBRUmQvazR0ZkdWZ1YyVFpndkVQdG1tSDRKOC9CM21J?=
 =?utf-8?B?SXV3L0djSzhZWEdoZzh6Z1hIam05V1h5UXJ5dHUrblZvdWZEM3lVQ0hMR3gy?=
 =?utf-8?B?UVVUdWhpbGRHUEhKdnB5Z0xPS0FFeG9kU0I2OWNxM09DaEhUdnVXazRoampi?=
 =?utf-8?B?ZlVVb1R4cEdLREk4RWZMT29VWk9YKzA1MVNoZXQwNjM4R3pnZ1dDNExHdE9K?=
 =?utf-8?B?dysyNnhuTkl2KzBIbGhqeWxlbHdyNVdsclpZUitaeDJIWjRjNitFTEFMTkJa?=
 =?utf-8?B?WUlYcmRBQWJpeFEvRG1IVTNGVDZBMERsMDBReEVHZzNjRys3OUJGb25LUFlz?=
 =?utf-8?B?ZTN3Z0l1TGFySER5YVU2SXRjc2svYlQzRzRZZ0JlUEFHYm0zMytneFJuZHR2?=
 =?utf-8?B?OE1ibmNnZXlSQUJuUno3V0hnVXVaMGhZcjRIOEJobjI4N29wcjZhN2MxYU4z?=
 =?utf-8?B?QzRmRkZndkVvY2lIeU1GR0F6UXQ5RHk2ZTBxanY4UDZ3WU1rQzJ2ei9RVmNl?=
 =?utf-8?B?OFBDV3FpSjVGelQ3dmV2MCtBWlYwWTd1eVV3L1lxRTREck82LzFoVlNXQnQw?=
 =?utf-8?B?SE9TR2NPSmZwM0NrY09XNjFCYndlZzk0WFFoOTQrcGt6NWpYUnhnVlhLWi95?=
 =?utf-8?B?K0RsRmpRcVMzY3BZTVpVMU96Q0p0SHlvaURwTXVUdmx0dUpYajdvUXE1ZFQv?=
 =?utf-8?B?cWN6RlBxclhxb2pUWUdEdjF0NUNaOXcwbk1tWVZQWFhBK0tEZ0l4ZE9ocXkv?=
 =?utf-8?B?YkVwdnFvWjJqYWRyaEZTRHBJb0diWjYvbVNZMHlaYitkam1tZlBOMW15V0g2?=
 =?utf-8?B?UzhpYW9KVHZjWitxYXI5TytMcnhuYVZQcU5VUjdSOHQ1dWF1VFJlaXhTOU1W?=
 =?utf-8?B?WGEvcFdLMXNtdzM0QzhmOWQ2MHhWYkJwMDZ0elVpWFRMRVBOTXV2SlRKaGFR?=
 =?utf-8?B?d1hGcjZ2UVk2VTlzWjZPb1BUMFBpRVNDNGtqKy8rQTZxSXRFZzRWWWFBWWhR?=
 =?utf-8?B?eWFwNEFyWk1tR2toR3EwL1c3TGdXWHdvMlRhc2Q2bHJoWFBjcmxlaHJVZWI0?=
 =?utf-8?B?UmwvY0dLUFlCakdmZlVGeFJ4WmNoL3Q0NzE1MnBHODFJdTZVaHR0ZlVNTkdr?=
 =?utf-8?B?eVkzcmVMcWlpTmw4WWd3V1orNnBmVmswbGQrbGErVldUUERyMFEzK0xYZnNU?=
 =?utf-8?B?dVBXUGU1TjlWdXRteVI1WHp6WU12OG1hMmZUWHhUNjBxRkhIUnZNYXhrQWt3?=
 =?utf-8?B?L2JjWGV3S2tiS2xnVHh1eDB0VDJDS2FCby9sQkVNVzk2dmxFT0hJSFlaRTB4?=
 =?utf-8?B?K2c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjdBQWxaR2kzUFV0STQybVN1SGIwd3lsK1l0UVVKN0IwTHpZRDgwLzVpVEpo?=
 =?utf-8?B?RUtFY3BRMldOMXQ5TEVBOXZuQjc3c1Jsbm9NM3NCYmNhalQwOU1oRGxhUnUy?=
 =?utf-8?B?SWI3YVhWR3kyUmdtSE5kVm80a3AxWXpxdGx5TTl0NStQYTdlSFhvYk5KUmZa?=
 =?utf-8?B?dFA1YXJ3TENOMWFpRkhzSDJ2ekJyTDBsQzlMMXdCakM1RGVoT1R2alJrcmlt?=
 =?utf-8?B?WEdDdW5BakhTZU9MQmYvYXhmUXJsZEF3V1dST3J2ekd2aTlTNGVzOEQ2bDFW?=
 =?utf-8?B?RS9uRVhZemRlbWxmZTVLa3ZBZnR1RWhyRkt2WTJWaE1xbG9BUUhyUVZQNzNm?=
 =?utf-8?B?SWtzRkFQRTNHUCsxa2Faa2ZlcXV3ZDk1bHhOWDVNUVZFdTBXWmhpRG9ad293?=
 =?utf-8?B?RzZ0QnI2ZEphQ0k4L2xIYjVNazU1VEYxaXFycGhTWElEcVVtbng4TVk3OVlI?=
 =?utf-8?B?ajhGOXRVcmZqTVBvdHAyYXJzb2ZCQ0J4OXVueW1KVm1xaldPdHR1T1cwbjdF?=
 =?utf-8?B?cHhZSWxlTU9VREFXQURwcHpoY29DY2RjQ3dOaXRxUkY4bGM3U0U2eDZCSWNG?=
 =?utf-8?B?TDdWOFlqblgyMG81MnozbHhKOFpLcTg4UXN6cUVwSDdqckhtZnhNQkFPcFVS?=
 =?utf-8?B?M285MHlsNHVhMnlNeFo4VkduOXk1RG5iSkYrL09LeUVDays0VGpJMG9jbElJ?=
 =?utf-8?B?ZFNIOXd1cUtzQ1pVNnI1QWJXQU55Q0lmcTdSQXEvdlJKb0hvNjhHVE5Gc1VT?=
 =?utf-8?B?STR4R2pVVzA1QjczcjBBVUJVekNKR2wvaFVmQm5oV1VwS0hKWkpYQ0lkWjhV?=
 =?utf-8?B?dkZQRmducUVmeTdBbE9OM2xDUFpZQkNyL0lnbS8rdXEzb080M3RpRWRtcnJs?=
 =?utf-8?B?R3YwVW1sdkltNUdqNWtNejdNWDEwK1ZqR2hMa25JT1NhUWdNSDZKZ1YrVEJw?=
 =?utf-8?B?ejVuQTk4T2orV3pZaGpFYVBOZTV3enA2TEdsVVMyT3haNjZhK2tyTDZSc3hU?=
 =?utf-8?B?STJkeGxQZ3ZBZDl3YmFHS3g0OVhvaGpicHk2ejN6aXp6bEUyclF6OHFub055?=
 =?utf-8?B?ME94dkFWeGxQQWZQQzU5UytiazE0aWZTcUplTEFzWlhLYWdIRDVrYm44OFhU?=
 =?utf-8?B?VXFVK2dhcllZT3R5eUhIODdWenl2Q29KakpjSzNWNkRnWWtMNFNnU2RCNnJU?=
 =?utf-8?B?V2QxanRjSlZhYXVnMEhWNERVMUhERVpnckVZZVBnUkFIZnRLaFFBUFF0TmdW?=
 =?utf-8?B?T0psKzFLREZTVDNMaHVJeVdkdTBhNXp5UUFmeEhucFJVVUpqbkRSV3pXQVZV?=
 =?utf-8?B?V21WSFpGQ2VWUG1IS09lTklaVm9hUEt3K29ld0k5OHdOVndFbEM5bXZrUjJV?=
 =?utf-8?B?Y1YwVHVnVVk3VW91ZnQ2OVIzcjBvYS8vaDJqRUk4eDJVYXE0NTFzTnoxbEE2?=
 =?utf-8?B?ZU8zZXE3QnozNVd3dEVWdi9kSWVmUkEvOGllbUljeVJXV3NqcGNndko2endR?=
 =?utf-8?B?eEtldDZLZmt2Y25hdlFXQlpLMGRvY0QwMnBYRzRJS2lGUHdmOTZLRmt1SGwx?=
 =?utf-8?B?N2hxZ2FNRHhVYTl0TWg4V1hIWWF0UlJpOTArVmhPenAxN002U1VTblQzM21M?=
 =?utf-8?B?QUpiWFVJM0d5aVFESmV6aS93ZmI1Z2hMZ1ZmSVRqVmttNFBLR0VURDZKMG5P?=
 =?utf-8?B?ZnJkNXdmWEFqcDBjUWxhMFRYSi9MNFl6SUlSQkdBNndRTy9MeGo0TnFxeWlV?=
 =?utf-8?B?aWx4Qnd1Y2ZUS2dyTjBYU3lSaFRtR3Z1RzVRaUl6NmhGb2pGVHBXSGl4SzBX?=
 =?utf-8?B?Q2JPSEJNc0M0ZFNkajUybTJVODRENitTWHhMTU9CdkFveHI2QVV3V3Arek0r?=
 =?utf-8?B?RllLYXZsSHpoRlhqSWZaRXZxRy9zL1RZeW1hdXYrNEptZmcvM0xHa0VmRGFQ?=
 =?utf-8?B?U1RCWXVyMGNwTnV3eHByTUl1T3RyZ3NHc2dwN3pUUVZHdnJ2OFp3Qm12dytn?=
 =?utf-8?B?d0hyRVBCenBlV1RILy9CaTZEOVhQZ2pVV2JzM2x3dzUzSWVleGg1Q05YSWtZ?=
 =?utf-8?B?dFQyUkJDUnJYNE1US0ZldlFick1LUFNyQzZWYTJQZlhVdTkybWZ6MzlVQnJH?=
 =?utf-8?B?a1BuelV6Sm53UVhOS0t4dkkxNXZLc3dqZCt3RjZKV0hLQlI2Snp5Z3ZkNmRS?=
 =?utf-8?B?N3JqSFdVTUxkandsRTR4azZmZ2pzTzBpVS9hT1pId0U1OVZHMFNxTGJoZmRz?=
 =?utf-8?B?N3B1bC82UjRnR3FaSGtWT0lNMFBySmZPWVF5ODRlRjBMUi9ML1EvUXY5NGxK?=
 =?utf-8?B?QUprWDRnQ3RJTTR4NnQrKy81M0FUUU9STXNOWDlmRCsyREpmVmMwdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3b285b5-6d1c-4e0a-f897-08de6f30a9bb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 20:59:53.1777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t5ZmQqLZ71C479WYFThQN+eGDTqUb5a8hc2cpELOxoVonv0TDNCOTye5rOmIPV0DRgomHPHodwRmTp6NEUeOvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7517
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
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org,vger.kernel.org,nvidia.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,weathered-steel.dev,joelfernandes.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[67];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 03EB5159B31
X-Rspamd-Action: no action

My CC list missed a lot of folks, sorry about that. Adding more CC's to this
email to make people aware of the posting. Thankfully it got posted to the
archives so for those on rust-for-linux, dri-devel and nouveau lore lists, they
would get it.

Thanks,

--
Joel Fernandes

On 2/18/2026 3:54 PM, Joel Fernandes wrote:
> These are initial preparatory patches needed for nova-core memory management
> support. The series moves the DRM buddy allocator one level up so it can be
> shared across GPU subsystems, adds Rust FFI and clist bindings, and creates
> Rust GPU buddy allocator bindings.
> 
> The clist/ffi patches are ready, reviewed by Gary and Danilo. Miguel, can you
> pull those via the rust tree?
> 
> The non-Rust DRM buddy related patches are already being pulled into upstream
> by Dave Airlie but I have included them here as they are needed for the rest of
> the patches (thanks to Dave for reworking them so they applied).
> 
> I will post the nova-core memory management patches as a separate follow-up
> series just after this one.
> 
> The git tree with all these patches can be found at:
> git://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git (tag: nova/mm)
> 
> Joel Fernandes (7):
>   gpu: Move DRM buddy allocator one level up (part one)
>   gpu: Move DRM buddy allocator one level up (part two)
>   rust: ffi: Convert pub use to pub mod and create ffi module
>   rust: clist: Add support to interface with C linked lists
>   rust: gpu: Add GPU buddy allocator bindings
>   nova-core: mm: Select GPU_BUDDY for VRAM allocation
>   nova-core: Kconfig: Sort select statements alphabetically
> 
> Koen Koning (1):
>   gpu: Fix uninitialized buddy for built-in drivers
> 
>  Documentation/gpu/drm-mm.rst                  |   10 +-
>  MAINTAINERS                                   |   15 +-
>  drivers/gpu/Kconfig                           |   13 +
>  drivers/gpu/Makefile                          |    3 +-
>  drivers/gpu/buddy.c                           | 1322 +++++++++++++++++
>  drivers/gpu/drm/Kconfig                       |    5 +-
>  drivers/gpu/drm/Kconfig.debug                 |    1 -
>  drivers/gpu/drm/Makefile                      |    1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c       |    2 +-
>  .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    |   12 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |   79 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h  |   20 +-
>  drivers/gpu/drm/drm_buddy.c                   | 1277 +---------------
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |    2 +-
>  drivers/gpu/drm/i915/i915_scatterlist.c       |   10 +-
>  drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |   55 +-
>  drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |    4 +-
>  .../drm/i915/selftests/intel_memory_region.c  |   20 +-
>  drivers/gpu/drm/tests/Makefile                |    1 -
>  drivers/gpu/drm/tests/drm_exec_test.c         |    2 -
>  drivers/gpu/drm/tests/drm_mm_test.c           |    2 -
>  .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  |    4 +-
>  drivers/gpu/drm/ttm/tests/ttm_mock_manager.c  |   18 +-
>  drivers/gpu/drm/ttm/tests/ttm_mock_manager.h  |    4 +-
>  drivers/gpu/drm/xe/xe_res_cursor.h            |   34 +-
>  drivers/gpu/drm/xe/xe_svm.c                   |   12 +-
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |   71 +-
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h    |    4 +-
>  drivers/gpu/nova-core/Kconfig                 |    3 +-
>  drivers/gpu/tests/Makefile                    |    4 +
>  .../gpu_buddy_test.c}                         |  416 +++---
>  .../lib/drm_random.c => tests/gpu_random.c}   |   18 +-
>  .../lib/drm_random.h => tests/gpu_random.h}   |   18 +-
>  drivers/video/Kconfig                         |    1 +
>  include/drm/drm_buddy.h                       |  163 +-
>  include/linux/gpu_buddy.h                     |  177 +++
>  rust/bindings/bindings_helper.h               |   11 +
>  rust/helpers/gpu.c                            |   23 +
>  rust/helpers/helpers.c                        |    2 +
>  rust/helpers/list.c                           |   17 +
>  rust/kernel/ffi/clist.rs                      |  327 ++++
>  rust/kernel/ffi/mod.rs                        |    9 +
>  rust/kernel/gpu/buddy.rs                      |  537 +++++++
>  rust/kernel/gpu/mod.rs                        |    5 +
>  rust/kernel/lib.rs                            |    5 +-
>  45 files changed, 2893 insertions(+), 1846 deletions(-)
>  create mode 100644 drivers/gpu/Kconfig
>  create mode 100644 drivers/gpu/buddy.c
>  create mode 100644 drivers/gpu/tests/Makefile
>  rename drivers/gpu/{drm/tests/drm_buddy_test.c => tests/gpu_buddy_test.c} (67%)
>  rename drivers/gpu/{drm/lib/drm_random.c => tests/gpu_random.c} (59%)
>  rename drivers/gpu/{drm/lib/drm_random.h => tests/gpu_random.h} (53%)
>  create mode 100644 include/linux/gpu_buddy.h
>  create mode 100644 rust/helpers/gpu.c
>  create mode 100644 rust/helpers/list.c
>  create mode 100644 rust/kernel/ffi/clist.rs
>  create mode 100644 rust/kernel/ffi/mod.rs
>  create mode 100644 rust/kernel/gpu/buddy.rs
>  create mode 100644 rust/kernel/gpu/mod.rs
> 
> Cc: Nikola Djukic <ndjukic@nvidia.com>
> base-commit: 2961f841b025fb234860bac26dfb7fa7cb0fb122

-- 
Joel Fernandes

