Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EvZD784cWnKfQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 21:36:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E15D15D5CF
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 21:36:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D4210E25A;
	Wed, 21 Jan 2026 20:36:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="RgCnEGoQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from LO2P265CU024.outbound.protection.outlook.com
 (mail-uksouthazon11021143.outbound.protection.outlook.com [52.101.95.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C5F10E054;
 Wed, 21 Jan 2026 20:36:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QNX3lApGVt4doWdtE2bRXZLCfrqVi3kUSwQVeHYizUfbVSM4t+pEX4IzQoOUFw+NDo3PgvRcIbtz8nT8yg5fsFN5P3PkyWMLBtnopWSPiZSDWdtwbFcTyuVXbzgLM7vhMQMnyhxtZjH1oKBIkOq+oVS/vfSmDt3oN87PQYOLAWPZuDpOmIlT5gEamhw3L+AQ6ktQD75CWuNrc5xC93XMfoF1nLrC9Ml+0oYp0LZbJfI5/4VPjA8KelLuz+kPn23rQIM39D2V0nrrimV/tk4v2xCKF2xcol48lZpdaTRdgCpyUtY+NVZa/Mj2AUyV+76vpOab+6Ek1bMKKdm2B/WIgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KeFWA8UzsxYRiiGGYmBTouK69ut0soHzPZN42ILQFbs=;
 b=Er4EZqpW4GEDLbL6eIgrkQjF4c+Bq856/zlWmF6oq1jbMkHjDCZBCk4qF1Ksdy69qH1ekXqbp8XwRNV0zHZDPTneJnscoqGwB4uD63zH+EIds9c1sJFTNi240RGKCwkZFkv0wjHuszVRvv44c1TsKQTpQCl+rUtVQFZDPTyJNiasGv8S+ijA/bx0seeJB5AK5QZ2Hrjg4M6DkTu7JTD7WSBqLIx9Vc5AhMLB30j1ym3dVt/uII2V+YYXe+m3Sax4b9Xr9BtKEjDWCHm2MrSh8+dRwOhS8p9BncyQ77MfKTyOhCp2v/HbZSBevhFhxQ8cmyHqw9eVzQc/7eHSD3gPTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KeFWA8UzsxYRiiGGYmBTouK69ut0soHzPZN42ILQFbs=;
 b=RgCnEGoQ9dv4imxNJxrfeaVcNXGKokwJlQz/heJjNP+u2uIWo8VLNgjS7ONL8RcpIIMo9IjcMpdz8Qo67G2pagjMuXFXjCh2EEghoSuASFv/2ttp7HOxRay7ZT7DT9oBZz0vn8VPRB4Eu30mO0qcgK9m2ihEzU2uFZFMZQrWUHM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB2133.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:85::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Wed, 21 Jan
 2026 20:36:06 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.009; Wed, 21 Jan 2026
 20:36:06 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 20:36:05 +0000
Message-Id: <DFUK089V1IEU.U83YQT72BO3@garyguo.net>
Subject: Re: [PATCH RFC v6 01/26] rust: clist: Add support to interface with
 C linked lists
From: "Gary Guo" <gary@garyguo.net>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, "Gary Guo" <gary@garyguo.net>,
 <linux-kernel@vger.kernel.org>
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Jonathan
 Corbet" <corbet@lwn.net>, "Alex Deucher" <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Jani Nikula"
 <jani.nikula@linux.intel.com>, "Joonas Lahtinen"
 <joonas.lahtinen@linux.intel.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 "Tvrtko Ursulin" <tursulin@ursulin.net>, "Huang Rui" <ray.huang@amd.com>,
 "Matthew Auld" <matthew.auld@intel.com>, "Matthew Brost"
 <matthew.brost@intel.com>, "Lucas De Marchi" <lucas.demarchi@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Helge Deller" <deller@gmx.de>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair
 Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, "Alexandre Courbot" <acourbot@nvidia.com>, "Andrea
 Righi" <arighi@nvidia.com>, "Andy Ritger" <aritger@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "Alexey Ivanov" <alexeyi@nvidia.com>, "Balbir Singh"
 <balbirs@nvidia.com>, "Philipp Stanner" <phasta@kernel.org>, "Elle Rhumsaa"
 <elle@weathered-steel.dev>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, <joel@joelfernandes.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
 <20260120204303.3229303-2-joelagnelf@nvidia.com>
 <DFTTGUYGY72V.3VLVSCB2OOXIB@garyguo.net>
 <01a981f1-64c7-4504-b309-45a024258fe9@nvidia.com>
In-Reply-To: <01a981f1-64c7-4504-b309-45a024258fe9@nvidia.com>
X-ClientProxiedBy: LNXP265CA0035.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::23) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB2133:EE_
X-MS-Office365-Filtering-Correlation-Id: ada4560e-c072-4095-3aab-08de592cb3c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bDhXRG9zRHdqUlhaZmFpbXNMcVd6V1RTUGVjay9BNGNzM0lQek9xaGZLU3Yr?=
 =?utf-8?B?MTl2dDFlZlFiZDZETnRDbHFETWVOeHlYWk5FY0pnOTNwdkZBcFdlTUxDSk9Y?=
 =?utf-8?B?U0Z3bFd4dndIOHJMcXFRTTl1ektFL0ZtdVhCSkxSY0ZQZzN5OWdhZE9VSUxF?=
 =?utf-8?B?ZkJIakU4T1JnV0xBRGNFNUxuZHBPQnJhVVk0K2NHNjZxY2x0MU53L05RQzd1?=
 =?utf-8?B?THYxOXRaV05LWEtjc2pzQ3NOc0FHNTAvVXA2V01xYmZFQ3M4ZlJzdExWV3hL?=
 =?utf-8?B?OVljeGdqdU1Jc1ByWno0V3o0eXRuSW1oV1UzOXNYMTUzMGU5NGxuNHlocHNu?=
 =?utf-8?B?OXp5OXFBZVBHVnM0UVNnRFc0NFMyOFdSbVRWVG1QOC9BY2x5MFYrZkNQMXJl?=
 =?utf-8?B?MWpQM0p1N0FsZ2liK0RBYnN6SFN5eXljR1VjdHpMV3h6ajdjKzVOYnc1MDFP?=
 =?utf-8?B?MTE2Q0pmR1c4VjRvK2xzaWRIZTJUNUNRamZzYVJZUGdjVnRPc1FEbmVmek5J?=
 =?utf-8?B?TlVJVjM3eStaRVZ3UjVMa2hWRjJmeElCc21DU3dLS3FML0dhbmNvdG8rbzFP?=
 =?utf-8?B?WG4vbG5kK0VQZEoxa0lmcGIyMXRuTVcvUHdPNXpRaHZWUFNOeDVHd2dwblly?=
 =?utf-8?B?Q0h2TDlLUkllOGY0WmdMdi9hU3ExZW1jblgzMVZnaVNERlg1b3ZPRUZsU1dY?=
 =?utf-8?B?ckdEbCtZa0FoeTk3NXZSUnUramg0Y3kzdUdNcDFuMEx3NFZEbHBmR2lwWXBF?=
 =?utf-8?B?MWoyQW5aR0VHNnloS1dQcUlpYkp5SENzS0VVc1F5YzZEamtzUW01SktzYlNw?=
 =?utf-8?B?OWlidWlGMmx0UXROVzF2WmNsTEpXeE96OFNYZjI1TmlZQ0FLYThyYlh3WGR6?=
 =?utf-8?B?RDZKM1FZYU9KNFFtdFNjd0RpYjVSWllzM3ZCZzJpVUhiaExZRWJ4RnE3VWFE?=
 =?utf-8?B?NFpEWDR1Mk9aUnYvbXZmN0RZQzZEdHhPMDlUQ3RWV0hsNDRTUmRSVDA2S3l4?=
 =?utf-8?B?M0hHRms0bU5aWTZqYktGNGdIWjhjWkhaWXVhR29FSk1oT3NWeHd6NjZLZUpV?=
 =?utf-8?B?UHY5U21xRXZHK0IwNWlaQTZBY1BhOVlNdFRtWXpGc1YwT2tYQzl0Y0orYUht?=
 =?utf-8?B?UDlWalVwcjNTMUdvUTJTMmRyS2xNUTdKN2VIblJLbTR0ZXdSUGFHdGZ2UGVE?=
 =?utf-8?B?QU50bkhwQTA1NFcwNHpWc3dXWS9xUnl4eDRBMkYxLzJqd1NlKy9adkxoNFhS?=
 =?utf-8?B?L2VScEJIbGMyNGFqUjdqd2xtU3Bib0xFUW5tS1VSUEsrdkI4d0prR3BhOGlX?=
 =?utf-8?B?RTZLdEpkYmI5ZjI0UjViVkcrWm5GZitSbVl6Ym11ZVJqeDRlV210ZEtHOFYy?=
 =?utf-8?B?cEFGUjFTdWU2QmM5dmV3WUU4QVlYeUhsZFVBSnNCSkZEMEUrbHdBUk55QXlo?=
 =?utf-8?B?SnNJNURRSjY2NWFaYlFJdjNhSFloMDV4SHJrY2xDS3VraFlYVEx1bGNrOG5p?=
 =?utf-8?B?ZFVHUjZBSTZDbUMwQkl5ek9kcW8raFdnUHVPSUtuaVZJRllYZ3Q2SXZUUzVC?=
 =?utf-8?B?azN0WTRrYVprQXloM0wra2Z5S05VUjYrdkt4T1dNYW81TXhrSTlIbWs0ODgz?=
 =?utf-8?B?SW4zcGRQaURKMWNIOG9UQ0ovZVVISHJpbGN2aEN4b21uTmJLY2k0VG5GcDFX?=
 =?utf-8?B?dGJucFF5OVJHd1k5MXNYaHM0L1RXSEFRb1IrbGh2Vk5ESkdrQ3lzZlNFVExZ?=
 =?utf-8?B?OTZFRzA5YUZqa3JWbkhHV1lRVjc5c0x2L1h1YXNHd3BGMzYyRFU4cHd4WDFG?=
 =?utf-8?B?SFNHSkVWV0pwSXBvM3VRZWxpUU4zSzdsZDdMSm5pdTg3c0RQVzVGazNFSUpB?=
 =?utf-8?B?VzljSWFyUkxpZWEzRTYrU3lobHRvVmMrU3UydlFMZWNoZmJVWGJ5K1FhdXZM?=
 =?utf-8?B?Vkc5SFhzZlQ0S2huczRGZDRBd3ArOW5EVVk2MGdyZmhaWGhYVG82eTFlaFRo?=
 =?utf-8?B?bGYvajBmT25ZajNyWmkxbmpqZ3ZPZ0RKNGZ3YXFldldlL054NVU5WDhVTDZ0?=
 =?utf-8?B?TnBFZ2pIbHVCVUhiQlJLazQyaGd5cmREME1ZZmlKY1YyVzVRSG90TmdackhV?=
 =?utf-8?Q?Feqg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1Bza2xISmMrVGtmbkYyaldFcm5uczl6YUdhakwvZE50YkYxdURVdmNkUE4v?=
 =?utf-8?B?S1llWDNvbVc4YW9JU2RiMVhyRERhc0I3bndVdm1HWkxOTGRUYVlVKy90cU10?=
 =?utf-8?B?S1BoQUNWYVNlR0FTRjIyeTRmTnZiTklVVm15eGI0RFAyeEREMlhtZXZwQWpy?=
 =?utf-8?B?TGg1N1R2TFVHaS9XZXJtQzlWc2hQemNQL0dJMHdJWjJBUHJ2U0JoZXRGRVdC?=
 =?utf-8?B?YU9mb1c3Y3JQQk5WTnNQbGUyRFNTalZFZGtuRExHSFBJYjhmUDl1eWxyVHgv?=
 =?utf-8?B?TXlkcGgxSDNsYTRvOWYvRG53TlBwQmhaL2JtWllpcWFsem5aQit2Qm9sa2Zi?=
 =?utf-8?B?MnRIUEM0YXZlMFFTMElkZGUxUG1KQUJRYjgvWEEzb1h2cWZZbjArMVFsNVVH?=
 =?utf-8?B?Y2RrSHpRRytqTHVjTzQxSGVCT0IxYVdUT3R6K1pyTUJTOS9ISXZ1anlCTE91?=
 =?utf-8?B?SFFUb2hoMzBiWkc3R3l1Z1NNS20rL1ZrWG9uM1Vjc2IzTWdYS1E1c2tzNXdj?=
 =?utf-8?B?ZmR1UkJWNWVrRUlyMUI0UklMeFJGUVBYa2htTWM1alFJWkNNbTIzMHNOQjJx?=
 =?utf-8?B?VG1wcnBsSG5iS3cramgwMkFIOVRKVjJWTXJ2ZVhtMFBLQlZSWlViY0xIMTRP?=
 =?utf-8?B?TzRIWXVDRzc1ZTNwWFFoUnR6TTlEK2JHbXEvZHJvWDBYKzloOU1TSE9ob2Nq?=
 =?utf-8?B?VkVqeGF5RWh0V24vOU43OWQ1NWt4aHJPRnZndTRuVjV2YnpBS1dCKzB2WldM?=
 =?utf-8?B?Vkt5WEtjVERJR1pubC9yNHl4V3p6dExHVHdyRXB2a2FOS2l5T0VXa3NQZmpn?=
 =?utf-8?B?V0N3cWxtRHRPNllFYWN2SVlVN0w3Znc3RFF5T0RaL0hXTG1VTGNmbjkrbVky?=
 =?utf-8?B?a1ZCcWNJUDZTK3V5dnIxeWRMcXNPbGUvT2hmZG9YRENLNGpncWorNUVBVkVQ?=
 =?utf-8?B?bXNCSG40Q2VFNUw3Mk81c2VadE1mWFFjYUVweHNYTGlrNDRUVldKbE53Vzdo?=
 =?utf-8?B?Vko3cTBLcHJwbFJEckNxQ2haN0lWN3Y1WmVOeU91L3MxK0loNXJES2RpKzZR?=
 =?utf-8?B?ZmZiQmVqNVhacUg0cGpJQlBvNytZMEpHKzdYdHhNZlJkaGpXUzN4enluMlJz?=
 =?utf-8?B?OFJSSFZkbmRwS1M3U2pPRFczeUovWDIvalRibkpMTDR2RnhRQS9UalBvV0lO?=
 =?utf-8?B?R0JZSDFKQ01qRk84WDZlOXVnbm9RRmVmditEalMxZnhoaVNRV2ZYNENDQ1lz?=
 =?utf-8?B?aWNiYndhUFU1YUl5Z2Z0NFJ0L1doUXY0UXBHYW9saTdaS1pHbHUzMWtBUUdR?=
 =?utf-8?B?cmhpWXlkY2dITzU1ejQzRlpGV09ZUWhvSUxBSFZLaW5zYktBeDVXcmVMQ3o2?=
 =?utf-8?B?Q3ZnZUw1eDBPajloNXFVNUZrYUoweTBTUmUvQys4RU1BcGN3NlR1bE9laEVQ?=
 =?utf-8?B?ZEFERzVWUDZCRWR5N3kwV2l3L2NzdldzSVpPTEg2b2ZzM3FMWHlMWlJ3R2FM?=
 =?utf-8?B?VmttQXJmejRreWNCNWVZcGJuUXJML2FybHV1dTdsSkVuWDdEMTFpSWkyOHRE?=
 =?utf-8?B?SWp2MlRKWkxBSG5FMk5YajBNYjI3YmpDbnZJeFZ6RzJhbkovZXU0aC9hRCt6?=
 =?utf-8?B?aUt3SzNSdk5OVUFQVjFXb2VjRGlqN2liME5RaUtNbHk5Tlh1K3F5ZkJSMk41?=
 =?utf-8?B?d0l0anpMWTdheGN3QVE5U1pMdy9FNjRXRzFkb1cyQmxWdVdhWHNxNDRWd0ZP?=
 =?utf-8?B?WHlsbDVXL3NKeC9hQVo5WGFKK051T3ljZVBVZWV3U3JIMkF4RUh2RHBDRkxr?=
 =?utf-8?B?VDJSM01jNGczNWt5dHdrWTJjZFZHc05lNFJzRnJrbHVGd25IN2tYbDZvcjVk?=
 =?utf-8?B?U1VQVHRKcjcxN0pkREpwejV4T042bUlSa3MycjRYeVo3bXk5eHZlZnV4RzZS?=
 =?utf-8?B?aVUrSkJURDVMVk1PZVpiQjZzTWp5VE1zSzYwNG1qdWVGbFgxenJuMklwQ25P?=
 =?utf-8?B?OEpvQk5CcTh2T1VJMytiMnhEODFGdFB4Ynd1ZkNVZXhoaEl0bUIxUTljR0lB?=
 =?utf-8?B?WHgrYjQ3T3dvYkIyeDZzK1hUTEwxQ1hTRjVEZUtPeElFcldlWmNWZGRTMHpw?=
 =?utf-8?B?ZTh2SFpxYldwRnF0ZTdBdGgxd1MvV2FiWGVNNVRFTGNoQ2cxUmNObzZuVkM0?=
 =?utf-8?B?aVRSUGlTVFgwUmI2K2hNREU5a2dWK25pWjhXbWpoMnBObjhTWHFkKzRncXBo?=
 =?utf-8?B?K1ZXQkNUcGttdjBENVNiYTVLWHZIY0ZWS0FMWkdQb2haMHg2NDU2RWthbmRo?=
 =?utf-8?B?bDk1ZjJkOGJRaDJyMkdyU0JqNEZ4MmpvOUhYZDVWYjB0ZUVCNWt5dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ada4560e-c072-4095-3aab-08de592cb3c9
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 20:36:06.3856 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IwzCpr2jRhWGGWv4HLcEw+2YDvpZnPu7I1UKzQsvi/wydrVNq3Datsbf9fYPSRi2dO0S3EFDubsxTl0yrEeR5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2133
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[52];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:mid,garyguo.net:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: E15D15D5CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Jan 21, 2026 at 7:50 PM GMT, Joel Fernandes wrote:
> Hello, Gary,
>
> On 1/20/2026 6:48 PM, Gary Guo wrote:
>> On Tue Jan 20, 2026 at 8:42 PM GMT, Joel Fernandes wrote:
>>> Add a new module `clist` for working with C's doubly circular linked
>>> lists. Provide low-level iteration over list nodes.
>>>
>>> Typed iteration over actual items is provided with a `clist_create`
>>> macro to assist in creation of the `Clist` type.
>>=20
>> This should read "CList".
>
> Sure, will fix.
>
>>=20
>> I was quite dubious about the patch just from the title (everybody knows=
 how
>> easy a linked list is in Rust), but it turns out it is not as concerning=
 as I
>> expected, mostly due to the read-only nature of the particular implement=
ation
>> (a lot of the safety comments would be much more difficult to justify, s=
ay, if
>> it's mutable). That said, still a lot of feedbacks below.
>
> Sure, the reason for requiring this is interfacing with lists coming from=
 C
> code. I'd see a future where we may want it mutable too (example, Rust co=
de
> adding elements to the existing). At which point, the invariants/safety
> reasoning may change.
>
>> I think something like is okay in the short term. However, there's an gr=
owing
>> interest in getting our Rust list API improved, so it could be ideal if
>> eventually the Rust list can be capable of handling FFI lists, too.
>
> Yeah we looked into that, if you see old threads, the conclusion was it i=
s not a
> good fit for existing rust list abstractions. TLDR; it does not fit into =
their
> ownership/borrowing model.

Definitely not with the existing one that we have, as it handles only `Arc`=
.
But the existing abstraction is also not good enough if you want to insert
`Box`...

>
> [...]
>>> +
>>> +/// Initialize a `list_head` object to point to itself.
>>> +///
>>> +/// # Safety
>>> +///
>>> +/// `list` must be a valid pointer to a `list_head` object.
>>> +#[inline]
>>> +pub unsafe fn init_list_head(list: *mut bindings::list_head) {
>>> +    // SAFETY: Caller guarantees `list` is a valid pointer to a `list_=
head`.
>>> +    unsafe {
>>> +        (*list).next =3D list;
>>> +        (*list).prev =3D list;
>>=20
>> This needs to be an atomic write or it'll depart from the C implementati=
on.
>
> I am curious what you mean by atomic write, can you define it?  Does rust
> compiler have load/store fusing, invented stores, etc, like C does? Sorry=
 I am
> only familiar with these concepts on C. Could you provide example of a ra=
ce
> condition in Rust that can happen?

Oh yes, this would definitely happen. It's down to LLVM to compile anyway. =
If
you create a reference, there'll be even more freedom to do these.

>
> Also I did this addition based on feedback from past review:
> https://lore.kernel.org/all/DEI89VUEYXAJ.1IQQPC3QRLITP@nvidia.com/
>
> There was some concerns around pointless function call overhead when the =
rust
> implementation is already quite intertwined with internals of the C linke=
d list
> implementation. I do agree with that point of view too.

Overall our practice is to not duplicate code. Even `ERR_PTR` is calling in=
to
helpers.

For performance, it's a valid concern. However Alice and I have series out =
there
that enable you to inline the helpers. I'd say unless there's an absolute n=
eed,
we should do the helpers. Especially with caveats like WRITE_ONCE in this c=
ase.

>
> Also see my other reply to Zhi on this helper topic, lets discuss there t=
oo, if
> that's Ok.
>
>>> +    }
>>> +}
>>=20
>> I don't think we want to publicly expose this! I've not found a user in =
the
>> subsequent patch, too.
>
> There are 2 users:
>
>     pub fn try_init<E>(
>
> and the self-tests:

This is not really a public user. It's hidden in the doc test too, you coul=
d
initialize using try_init too.

>
> //! # let head =3D head.as_mut_ptr();
> //! # // SAFETY: head and all the items are test objects allocated in [..=
]
> //! # unsafe { init_list_head(head) };
> //! #
>
>>=20
>>> +
>>> +/// Wraps a `list_head` object for use in intrusive linked lists.
>>> +///
>>> +/// # Invariants
>>> +///
>>> +/// - [`CListHead`] represents an allocated and valid `list_head` stru=
cture.
>>> +/// - Once a [`CListHead`] is created in Rust, it will not be modified=
 by non-Rust code.
>>> +/// - All `list_head` for individual items are not modified for the li=
fetime of [`CListHead`].
>>> +#[repr(transparent)]
>>> +pub struct CListHead(Opaque<bindings::list_head>);
>>> +
>>> +impl CListHead {
>>> +    /// Create a `&CListHead` reference from a raw `list_head` pointer=
.
>>> +    ///
>>> +    /// # Safety
>>> +    ///
>>> +    /// - `ptr` must be a valid pointer to an allocated and initialize=
d `list_head` structure.
>>> +    /// - `ptr` must remain valid and unmodified for the lifetime `'a`=
.
>>> +    #[inline]
>>> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -> &'a S=
elf {
>>> +        // SAFETY:
>>> +        // - [`CListHead`] has same layout as `list_head`.
>>> +        // - `ptr` is valid and unmodified for 'a.
>>> +        unsafe { &*ptr.cast() }
>>> +    }
>>> +
>>> +    /// Get the raw `list_head` pointer.
>>> +    #[inline]
>>> +    pub fn as_raw(&self) -> *mut bindings::list_head {
>>> +        self.0.get()
>>> +    }
>>> +
>>> +    /// Get the next [`CListHead`] in the list.
>>> +    #[inline]
>>> +    pub fn next(&self) -> &Self {
>>> +        let raw =3D self.as_raw();
>>> +        // SAFETY:
>>> +        // - `self.as_raw()` is valid per type invariants.
>>> +        // - The `next` pointer is guaranteed to be non-NULL.
>>> +        unsafe { Self::from_raw((*raw).next) }
>>> +    }
>>> +
>>> +    /// Get the previous [`CListHead`] in the list.
>>> +    #[inline]
>>> +    pub fn prev(&self) -> &Self {
>>> +        let raw =3D self.as_raw();
>>> +        // SAFETY:
>>> +        // - self.as_raw() is valid per type invariants.
>>> +        // - The `prev` pointer is guaranteed to be non-NULL.
>>> +        unsafe { Self::from_raw((*raw).prev) }
>>> +    }
>>> +
>>> +    /// Check if this node is linked in a list (not isolated).
>>> +    #[inline]
>>> +    pub fn is_linked(&self) -> bool {
>>> +        let raw =3D self.as_raw();
>>> +        // SAFETY: self.as_raw() is valid per type invariants.
>>> +        unsafe { (*raw).next !=3D raw && (*raw).prev !=3D raw }
>>=20
>> While is this checking both prev and next? `list_empty` is just
>> `READ_ONCE(head->next) =3D=3D head`.
>
> Sure, I can optimize to just check ->next, that makes sense. Will do.
>

The important part is to make sure we don't deviate from C implementation. =
A
copy is already not good, and difference is worse.

>>=20
>>> +    }
>>> +
>>> +    /// Fallible pin-initializer that initializes and then calls user =
closure.
>>> +    ///
>>> +    /// Initializes the list head first, then passes `&CListHead` to t=
he closure.
>>> +    /// This hides the raw FFI pointer from the user.
>>> +    pub fn try_init<E>(
>>> +        init_func: impl FnOnce(&CListHead) -> Result<(), E>,
>>> +    ) -> impl PinInit<Self, E> {
>>> +        // SAFETY: init_list_head initializes the list_head to point t=
o itself.
>>> +        // After initialization, we create a reference to pass to the =
closure.
>>> +        unsafe {
>>> +            pin_init::pin_init_from_closure(move |slot: *mut Self| {
>>> +                init_list_head(slot.cast());
>>> +                // SAFETY: slot is now initialized, safe to create ref=
erence.
>>> +                init_func(&*slot)
>>=20
>> Why is this callback necessary? The user can just create the list head a=
nd
>> then reference it later? I don't see what this specifically gains over j=
ust
>> doing
>>=20
>>     fn new() -> impl PinInit<Self>;
>>=20
>> and have user-side
>>=20
>>     list <- CListHead::new(),
>>     _: {
>>         do_want_ever(&list)
>>     }
>
> The list initialization can fail, see the GPU buddy patch:
>
>         // Create pin-initializer that initializes list and allocates blo=
cks.
>         let init =3D try_pin_init!(AllocatedBlocks {
>             list <- CListHead::try_init(|list| {
>                 // Lock while allocating to serialize with concurrent fre=
es.
>                 let guard =3D buddy_arc.lock();
>
>                 // SAFETY: guard provides exclusive access, list is initi=
alized.
>                 to_result(unsafe {
>                     bindings::gpu_buddy_alloc_blocks(
>                         guard.as_raw(),
>                         params.start_range_address,
>                         params.end_range_address,
>                         params.size_bytes,
>                         params.min_block_size_bytes,
>                         list.as_raw(),
>                         params.buddy_flags.as_raw(),
>                     )
>                 })
>             }),
>             buddy: Arc::clone(&buddy_arc),
>             flags: params.buddy_flags,
>         });

The list initialization doesn't fail? It's the subsequent action you did th=
at
failed.

You can put failing things in the `_: { ... }` block too.

>
>>=20
>>=20
>>> +            })
>>> +        }
>>> +    }
>>> +}
>>> +
>>> +// SAFETY: [`CListHead`] can be sent to any thread.
>>> +unsafe impl Send for CListHead {}
>>> +
>>> +// SAFETY: [`CListHead`] can be shared among threads as it is not modi=
fied
>>> +// by non-Rust code per type invariants.
>>> +unsafe impl Sync for CListHead {}
>>> +
>>> +impl PartialEq for CListHead {
>>> +    fn eq(&self, other: &Self) -> bool {
>>> +        self.as_raw() =3D=3D other.as_raw()
>>=20
>> Or just `core::ptr::eq(self, other)`
>
> Sure, will fix.
>
>>=20
>>> +    }
>>> +}
>>> +
>>> +impl Eq for CListHead {}
>>> +
>>> +/// Low-level iterator over `list_head` nodes.
>>> +///
>>> +/// An iterator used to iterate over a C intrusive linked list (`list_=
head`). Caller has to
>>> +/// perform conversion of returned [`CListHead`] to an item (using `co=
ntainer_of` macro or similar).
>>> +///
>>> +/// # Invariants
>>> +///
>>> +/// [`CListHeadIter`] is iterating over an allocated, initialized and =
valid list.
>>> +struct CListHeadIter<'a> {
>>> +    current_head: &'a CListHead,
>>> +    list_head: &'a CListHead,
>>> +}
>>> +
>>> +impl<'a> Iterator for CListHeadIter<'a> {
>>> +    type Item =3D &'a CListHead;
>>> +
>>> +    #[inline]
>>> +    fn next(&mut self) -> Option<Self::Item> {
>>> +        // Advance to next node.
>>> +        let next =3D self.current_head.next();
>>> +
>>> +        // Check if we've circled back to the sentinel head.
>>> +        if next =3D=3D self.list_head {
>>> +            None
>>> +        } else {
>>> +            self.current_head =3D next;
>>> +            Some(self.current_head)
>>> +        }
>>=20
>> I think this could match the C iterator behaviour. When the iterator is =
created,
>> a `next` is done first, and then subsequently you only need to check if
>> `current_head` is `list_head`.
>>=20
>> This is slightly better because the condition check does not need to der=
eference
>> a pointer.
>
> Sure, I can change it to that.
>>> +impl<'a> FusedIterator for CListHeadIter<'a> {}
>>> +
>>> +/// A typed C linked list with a sentinel head.
>>> +///
>>> +/// A sentinel head represents the entire linked list and can be used =
for
>>> +/// iteration over items of type `T`, it is not associated with a spec=
ific item.
>>> +///
>>> +/// The const generic `OFFSET` specifies the byte offset of the `list_=
head` field within
>>> +/// the struct that `T` wraps.
>>> +///
>>> +/// # Invariants
>>> +///
>>> +/// - `head` is an allocated and valid C `list_head` structure that is=
 the list's sentinel.
>>> +/// - `OFFSET` is the byte offset of the `list_head` field within the =
struct that `T` wraps.
>>> +/// - All the list's `list_head` nodes are allocated and have valid ne=
xt/prev pointers.
>>> +/// - The underlying `list_head` (and entire list) is not modified for=
 the lifetime `'a`.
>>> +pub struct CList<'a, T, const OFFSET: usize> {
>>> +    head: &'a CListHead,
>>> +    _phantom: PhantomData<&'a T>,
>>> +}
>>=20
>> Is there a reason that this is not
>>=20
>>     #[repr(transparent)]
>>     struct CList(CListHead)
>>=20
>> ? We typically want to avoid putting reference inside the struct if it c=
an be on
>> the outside. This allows `&self` to be a single level of reference, not =
too.
>>=20
>> It also means that you can just write `&CList<_>` in many cases, and doe=
sn't need
>> `CList<'_, T>` (plus all the benefits of a reference).
>
> Sure! Will change to this. I am guessing you mean the following, but plea=
se let
> me know if you meant something else:
>
>   pub struct CList<T, const OFFSET: usize>(
>       CListHead,
>       PhantomData<T>,
>   );
>
> I don't see any issues with my code using that, at the moment. Will let y=
ou know
> how it goes.

Yes, with `#[repr(transparent)]`.

>>> +impl<'a, T, const OFFSET: usize> CList<'a, T, OFFSET> {
>>> +    /// Create a typed [`CList`] from a raw sentinel `list_head` point=
er.
>>> +    ///
>>> +    /// # Safety
>>> +    ///
>>> +    /// - `ptr` must be a valid pointer to an allocated and initialize=
d `list_head` structure
>>> +    ///   representing a list sentinel.
>>> +    /// - `ptr` must remain valid and unmodified for the lifetime `'a`=
.
>>> +    /// - The list must contain items where the `list_head` field is a=
t byte offset `OFFSET`.
>>> +    /// - `T` must be `#[repr(transparent)]` over the C struct.
>>> +    #[inline]
>>> +    pub unsafe fn from_raw(ptr: *mut bindings::list_head) -> Self {
>>> +        Self {
>>> +            // SAFETY: Caller guarantees `ptr` is a valid, sentinel `l=
ist_head` object.
>>> +            head: unsafe { CListHead::from_raw(ptr) },
>>> +            _phantom: PhantomData,
>>> +        }
>>> +    }
>>> +
>>> +    /// Get the raw sentinel `list_head` pointer.
>>> +    #[inline]
>>> +    pub fn as_raw(&self) -> *mut bindings::list_head {
>>> +        self.head.as_raw()
>>> +    }
>>> +
>>> +    /// Check if the list is empty.
>>> +    #[inline]
>>> +    pub fn is_empty(&self) -> bool {
>>> +        let raw =3D self.as_raw();
>>> +        // SAFETY: self.as_raw() is valid per type invariants.
>>> +        unsafe { (*raw).next =3D=3D raw }
>>=20
>> `self.head.is_linked()`?
>
> I'd considered `is_linked()` to be something that makes sense to call onl=
y on
> `ClistHead` objects that belong to a particular "item" node, not a sentin=
el
> node, so that was deliberate.
>
> Though, I am Ok with doing it the way you are suggesting too
> (`self.head.is_linked()`), since it is functionally equivalent.
>
>>> +    }
>>> +
>>> +    /// Create an iterator over typed items.
>>> +    #[inline]
>>> +    pub fn iter(&self) -> CListIter<'a, T, OFFSET> {
>>> +        CListIter {
>>> +            head_iter: CListHeadIter {
>>> +                current_head: self.head,
>>> +                list_head: self.head,
>>> +            },
>>> +            _phantom: PhantomData,
>>> +        }
>>> +    }
>>> +}
>>> +
>>> +/// High-level iterator over typed list items.
>>> +pub struct CListIter<'a, T, const OFFSET: usize> {
>>> +    head_iter: CListHeadIter<'a>,
>>> +    _phantom: PhantomData<&'a T>,
>>> +}
>>> +
>>> +impl<'a, T, const OFFSET: usize> Iterator for CListIter<'a, T, OFFSET>=
 {
>>> +    type Item =3D &'a T;
>>> +
>>> +    fn next(&mut self) -> Option<Self::Item> {
>>> +        let head =3D self.head_iter.next()?;
>>> +
>>> +        // Convert to item using OFFSET.
>>> +        // SAFETY: `item_ptr` calculation from `OFFSET` (calculated us=
ing offset_of!)
>>> +        // is valid per invariants.
>>> +        Some(unsafe { &*head.as_raw().byte_sub(OFFSET).cast::<T>() })
>>> +    }
>>> +}
>>> +
>>> +impl<'a, T, const OFFSET: usize> FusedIterator for CListIter<'a, T, OF=
FSET> {}
>>> +
>>> +/// Create a C doubly-circular linked list interface [`CList`] from a =
raw `list_head` pointer.
>>> +///
>>> +/// This macro creates a [`CList<T, OFFSET>`] that can iterate over it=
ems of type `$rust_type`
>>> +/// linked via the `$field` field in the underlying C struct `$c_type`=
.
>>> +///
>>> +/// # Arguments
>>> +///
>>> +/// - `$head`: Raw pointer to the sentinel `list_head` object (`*mut b=
indings::list_head`).
>>> +/// - `$rust_type`: Each item's rust wrapper type.
>>> +/// - `$c_type`: Each item's C struct type that contains the embedded =
`list_head`.
>>> +/// - `$field`: The name of the `list_head` field within the C struct.
>>> +///
>>> +/// # Safety
>>> +///
>>> +/// The caller must ensure:
>>> +/// - `$head` is a valid, initialized sentinel `list_head` pointing to=
 a list that remains
>>> +///   unmodified for the lifetime of the rust [`CList`].
>>> +/// - The list contains items of type `$c_type` linked via an embedded=
 `$field`.
>>> +/// - `$rust_type` is `#[repr(transparent)]` over `$c_type` or has com=
patible layout.
>>> +/// - The macro is called from an unsafe block.
>>=20
>> This is not a safe requirement, probably lift it up and say "This is an =
unsafe
>> macro.".
>
> Sure, so like this then:
>   /// This is an unsafe macro. The caller must ensure:
>   /// - `$head` is a valid, initialized sentinel `list_head`...

Yes.

Best,
Gary

>
>>> +///
>>> +/// # Examples
>>> +///
>>> +/// Refer to the examples in the [`crate::clist`] module documentation=
.
>>> +#[macro_export]
>>> +macro_rules! clist_create {
>>> +    ($head:expr, $rust_type:ty, $c_type:ty, $($field:tt).+) =3D> {{
>>> +        // Compile-time check that field path is a list_head.
>>> +        let _: fn(*const $c_type) -> *const $crate::bindings::list_hea=
d =3D
>>> +            |p| ::core::ptr::addr_of!((*p).$($field).+);
>>=20
>> `&raw const` is preferred now.
>
> Sure, will fix.
>
>>=20
>>> +
>>> +        // Calculate offset and create `CList`.
>>> +        const OFFSET: usize =3D ::core::mem::offset_of!($c_type, $($fi=
eld).+);
>>> +        $crate::clist::CList::<$rust_type, OFFSET>::from_raw($head)
>>> +    }};
>>> +}
>>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>>> index f812cf120042..cd7e6a1055b0 100644
>>> --- a/rust/kernel/lib.rs
>>> +++ b/rust/kernel/lib.rs
>>> @@ -75,6 +75,7 @@
>>>  pub mod bug;
>>>  #[doc(hidden)]
>>>  pub mod build_assert;
>>> +pub mod clist;
>>=20
>> Can we keep this pub(crate)?
>
> Yes, will do.

