Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGpeK0g7cWnKfQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 21:47:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1CC5D8CA
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 21:47:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86DE810E883;
	Wed, 21 Jan 2026 20:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="P/mNolWD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010046.outbound.protection.outlook.com [52.101.85.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC3E10E265;
 Wed, 21 Jan 2026 20:47:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vqTn4mGpyGnnOl4QzRxJmpEx9EiJ6NZwL1QKGtRZYBuYl6qPLCz2VNQtRZntY0pw6gtdmIYEOKCoPWB21U069ZDZKV8lmMy4+GkchTcLaVN/1PLKXEWsbcaw2izWu9QG04cgjCfcyUcpYkq5+5+qgbrY+u4XJL9T68Q1Jrjd3EpNorUOIEU1rGk5orXuKqeSmWezlIrBVu2ANWie531hCxwX+CAFbglV5rnh3AhoZPLEH+HT6sZHDx884M0RrVK6x6LOnvsmGZV5ze8CT+46B8MRkAy5rftjyDScr5roxwVwm90Sb6+Cx326jSyiO3PbKMNvMWP4U+Yzm9RKonKGMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GOAlCHev6+aij/Td3ahneCpf0qfTy2+SIBQ00iuz+YE=;
 b=GeI4cppRjmWucHRSj6is+9KBzlxpynHhMVJ7LwaECqGeHcchZedEWq5vCmWDDDS1a1Fb47m8OEsdrDk67lLOfLMAV18P2gZieURcCs/6yCNb2i62j6nl4Zm5iKYK2nJkexAq19HI5JsvSAEM7g+nKsyX5FArSDdHHcLzApNmeEIZ0XgGsKMMbgtiXOIbQtA/1lnx1r1kuzlC+jAi+xOYkdXd0JtYxQsbm3CC1pwr72BTnz5Sh2pb2gHgN1uzohE7B2Bt1xXy7BI6QgXdq3VbMho/oiZWzND//WTNKfwJy8rPK72lKBDVGouj2o/h069RmVwD4w4QTW+oEHq1qA+2VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOAlCHev6+aij/Td3ahneCpf0qfTy2+SIBQ00iuz+YE=;
 b=P/mNolWDPDBQ/mabKCFxe/+bJf+k/YUfBinkcNIe+28wP+UdbMEuhTMPJlqUGzlVHFGC4KfacP6r86zncX6pt7NSVFlepV+CHiE/zAk6QzCmThldxy23egKJ8BISKKnqK3hZ0qShnAM94iYZW2pmVdRiZPINOeZizZ65WOBIrlAv7KOPuMKJrlicaBftWaGRT6SjyWFIIknpoj9fEkT7zJexhVhONcj9ohTvh3JWxB/EQ9wIAuvPt59eeoCzRuvwk/B0+9zUyNrEUY+iG+PSr8N+vsG1a6+7242R2TFyS4V+wcGmqbwgkmOvYXWXSCfiADCf7rTdyzyXg7P8s+xXTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH7PR12MB6417.namprd12.prod.outlook.com (2603:10b6:510:1ff::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 20:46:52 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 20:46:52 +0000
Message-ID: <9750dc9d-5aae-44a8-ba79-8277f78f7292@nvidia.com>
Date: Wed, 21 Jan 2026 15:46:48 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 01/26] rust: clist: Add support to interface with C
 linked lists
To: Gary Guo <gary@garyguo.net>, linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Alexey Ivanov <alexeyi@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
 <20260120204303.3229303-2-joelagnelf@nvidia.com>
 <DFTTGUYGY72V.3VLVSCB2OOXIB@garyguo.net>
 <01a981f1-64c7-4504-b309-45a024258fe9@nvidia.com>
 <DFUK089V1IEU.U83YQT72BO3@garyguo.net>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DFUK089V1IEU.U83YQT72BO3@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR0102CA0013.prod.exchangelabs.com
 (2603:10b6:207:18::26) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH7PR12MB6417:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c656d74-271e-4419-0a57-08de592e34a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YStJVHQrUFZObFhUSS8wUnNTY3N1Q3JoTTFuQTFTLy9idFpmOW9paitXVDky?=
 =?utf-8?B?VkNSNnl4Q0EwMjNoSlY0Mi9vYjR6UHlhbkFOc1BFWFowUEZMdVIxZTlXQktT?=
 =?utf-8?B?RlE1MUMrN1lCaTdZQlBjV0ZDUndZRnJCbHBDcW9MclljdktwM3d6emtqbDJa?=
 =?utf-8?B?Y3FrY1llRHk5NCtLVEtFUGhTa3ZkMlFKb25EbjJ3MGkrdmtzZ0w2SUV0WU95?=
 =?utf-8?B?Z1pKN094NzVnUC8rZWs2VEM0aXdUcXJoUTVPU0cyaWxjL2Z4WGNYNENLNG5X?=
 =?utf-8?B?bURmZTlpN0Y3eHRnczhabitvSC9VQjZRUThabGM1YVZPUXRicGVQd0RTZ0Zr?=
 =?utf-8?B?am5vdysrc2xzaENvaExUV0JHaUhaMURHREErK2YyKzN3alBGS0JucDltWFdh?=
 =?utf-8?B?YWZYMFEvaVpNbnlFMUs5N0FuUnhJR0hKWS9lWG91WFFYak5pcnVLWmZCdGxV?=
 =?utf-8?B?cW5QRm4wOFZSNU5ra20vVGdwdlM2ZklKRVVZeVVTdEpmT28xZVV1Z2hKUFVW?=
 =?utf-8?B?Smd2VGxncmhoaVJKOEdBNFpLcHhlWWxHeDdoSDZzV0FJN0lkdnhVeFhnNHZG?=
 =?utf-8?B?YjJqN0NCb01LbTI1V2Q3dStIdCsvb3NMdkNGSnB0Y1BLWVZSTmQya3IzWVJM?=
 =?utf-8?B?ZWZtcnpicWU2aDdqTmVIcThSOUdLcFZGdkM2NkV4ZW1oVkh1QXpQRzIvR0t4?=
 =?utf-8?B?OEtQY2RlalhXVHNRY3RaUTB3WEJiY0xNbGNOcFd0bCsvTVZuM3NIcUtWdUJC?=
 =?utf-8?B?NmFNMlJrb2VLRkxTSXhVVmpmeUNPYmFIbDZFNThBUjZ2UnRjTllVeTlMKzhJ?=
 =?utf-8?B?VDJVZmZ5enpVdTRlZ0FhVVhTRGxVMDEyVnNmbXFsaUtIWWlJNHJFM2Y3YnNY?=
 =?utf-8?B?OE9zVEg3MmVYcW1HWW5mUnBVNEJPMVdBSWpRcktuNmFzUWJWYXdzdWtwQzla?=
 =?utf-8?B?bHRMTFNPMUE2YktUY1ErZzRWSk1FSnRWMDFSbDNmRjJQV3JyWjM1T294NlNx?=
 =?utf-8?B?aWJjQjd3UW5RVitoTUpleStwWXBpVUZCb2t0dFNtRC9oSmFrYXNNSW1iTFB2?=
 =?utf-8?B?ZjVRcDBZaTlKMktxRFFKZFdKKy9tQng4Zlh4d1NuV3VSd0Y2SnpPTEZubzJE?=
 =?utf-8?B?OG8wSWtncTA2RDhOY2pqMFh1ejhIa0dLaE1RTU54dHRoSDMzR293VVcrOVpr?=
 =?utf-8?B?ZTdvR3RSQjIrR3NPRy9qZ3FvTHY1MlFrQVFQKysrNCtZTVJZRGhZUUsrNjhY?=
 =?utf-8?B?SGx2TlZwSjZLb2kyVTVpRnJwd1FhKzRMRnBYaFZVVFRhUEZ3N2Vtcyt5YVg5?=
 =?utf-8?B?Y1V2ejM2UDJkTWpjR2wxSWpvOFdtVlByeTZPaDNoTzh5WExnREZZbzZ4KzJo?=
 =?utf-8?B?cmJpYWw3Zm13K0dnMDE0RmNpcWVTaWllT3Q2RmkrNFZDZ0FibTB5ck84S3Ni?=
 =?utf-8?B?VkVxTEJBYzNZVmhyN2wxK1kvT3phZG5OLzZSNTRyck5od3ZibURrNkNzbnA5?=
 =?utf-8?B?NS9uR3ZsRkZZVEx5OGRRQUYya01jYloyUkZnZENQbmw4YTE2ZXVZZ3ZHbUli?=
 =?utf-8?B?L3h4NDhoZmNER1lvTUxKdHBrV0wxUWtTeTlQdVFlNTMxQURqeVJSZ2JzeDBm?=
 =?utf-8?B?UjBaMFc0NGhLcXJYRzA4N2NidW1YdlF6SERoMXVVUy9CWWhOeEJxbmthaUJB?=
 =?utf-8?B?UDYrYU1zQ0dnTWRORU5lWU4vRXIwN1J0YkloWnR6M1czbXA4WEZ2TmdZWGh6?=
 =?utf-8?B?MnJOb3NVZHRYK3kwN3dONk5kRzdmcGdZenZtZFR2MFlTQzhlMEVKU1ZWS1Jp?=
 =?utf-8?B?c2w2cUVqRkVFeE4ycG1FT0d0czVGWDBmRDRrNnVMeVIwbnRaZmpIemhMYlVm?=
 =?utf-8?B?ZkY1L1hxcjFkYnR3a1U0ZmgzRmp0czlOR1Brem9RbDJSZVVYa1JpOVZ5N0Fu?=
 =?utf-8?B?RFJmbzdsZW5sZVEwTUUreDA0NExzLy9ZejJyZkpvOWZ2ZDF0MGN5dXhkdjRS?=
 =?utf-8?B?SENVTjlLMSt5d1pZLzNrNGIwUmtPcEVQSC9IS3c2Zi9DZjkvSUNlMHF2Z3lw?=
 =?utf-8?B?WllpK3dDNzE4TFhRSytmNFphWXVFMVEvazVSRVdEM29YK2JzTmNJRmFXRVZH?=
 =?utf-8?Q?cKWM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTBtRDNRVFZxQXRBQ2dreXd1T2pvL3RSZk0yL0tsUUE0cHV2VUtPbTIwSi9N?=
 =?utf-8?B?MXZ5Mndoc3NDQldIWm5Ga2orbHo1di94N2dLamh0WFByakN5WUdSbmpxNlkx?=
 =?utf-8?B?RzZPR2FnVGZFS2V6Ti9FeEYvVEZpVUdXSU54enUzNHByL3MrWjFNVFJEYThB?=
 =?utf-8?B?U1duR296OFQ2VFFLRitrR0Z2SlVLNXc3cXM0c1JFNXE3elFlR3QwNTIzd1dC?=
 =?utf-8?B?aWxCYmY5U3NweVZJVnFicEpOd2hMUHcwRklFWkZrN1JObDZzS1EwVk15NkIw?=
 =?utf-8?B?cEhMMHNDa3ROejBpb3NuZCtkbTc0Vit0a09sWFB1KzJHWXpqUnpGcUlrRHJh?=
 =?utf-8?B?UzNhZWt2ZHhKcGR3SmczdWFldndmc3ZHNi9Udi9nZEpZaE5QZFd1eUF5S0lG?=
 =?utf-8?B?QzFhR2ZlQkcrRkN3ZmxsV2NHdFJtbGduVzZOZW1ZL0tSZGdLUnZBUDc2dG1r?=
 =?utf-8?B?Y01OOTdBMkJBZ2JEQWsyMTQvYUxOcW1zdVpubVlDTlpGUzVJQXllTWFwUUxZ?=
 =?utf-8?B?YXpmYnd2SlFMajk2eEhMQzZKd2lTaVFCbHE0ZUp0eEJ5UDZjWjJ6RzJiVHk2?=
 =?utf-8?B?VVVCWE9jUmp6bEcyQ256MytWdmsrYXJHaXU1cmcrNnVyK2l4WUc5NE9NT2lt?=
 =?utf-8?B?VXU4TDNEYktiSEdOaUJhRnh2cmlIeGYwMitOUTA5OVhMTHIvNDNTQk9QUE9v?=
 =?utf-8?B?eGF2N2ZacXJUZzdvOXZKTzlIVTJyeEtlTnhlMUdVdmhESE1UckpRUmY0UTYx?=
 =?utf-8?B?NVU1Z3JvYVJNdzdYRHJKYTNlYTFJVE1tV2RZQmR6cERVOHJyTUZCTGpjcWxV?=
 =?utf-8?B?Rm9MOU5Nd1hxMHd1RG5tTjlQS2VjQzdObzdmMlp3S2VRTEVLY1diUVl0eDhx?=
 =?utf-8?B?cWhBYkR4L1lGZFZoYXlHMEVhbGIwR2w2V2l6NWUwSXAxY0UzNHlHREh1bHRn?=
 =?utf-8?B?WmJqTlpiWGxKZEtFVEhzTDJ4eDVrZG90VW9XWktaY2NmdVN0d0IzU2ZQd3BV?=
 =?utf-8?B?M2FNOHUwTHMwWTdvaU1CeDhTUGo1TVFkc3NweXEwQVhRL0tMS21Bd1pVUE9n?=
 =?utf-8?B?aEIwOE5Fa0l1UE4zZlpqRjlLMWE0T1F6TlE5MU45dVBUZ0w3Sk56SkJDdllq?=
 =?utf-8?B?OGRxNU5za3FWTEFBU1JIdWdFbnE0aGVLam9Pa1VIWExKTHE3T1BVeVFuTVJG?=
 =?utf-8?B?SzlScVg5VEQwTmZrT3MzR0NZZG56aXNSS0xFdk5STFdCYXZxa3NSMEZtVjlk?=
 =?utf-8?B?cUp1cUZuY2ZUd1lSRW9OamVDa1c2Mnk3bjBobkRSUEtINWVHcmFzNGdjWkRq?=
 =?utf-8?B?K2NMUkNZelpBVDJ2YVZnVWVNaDJqMm9zb1plMHJVeHZMM2lHajVYUTJCSkhU?=
 =?utf-8?B?UTJHVEUxVlBGbGlvZTlITzFjaUc5UlczZ3hwS0tZOXJCRWxiOElleU9ZeTRi?=
 =?utf-8?B?akRHSldwMzhyay93aVRicFd5M1pnZE15RjNRZnBnSkNhNmtNUWU2Y3M3bHE0?=
 =?utf-8?B?UU9aVlpVZUowU1MwWmZQZ2oxSGxTam1sb29WNEdVV21Cc2lsczNNN3Z1S2pm?=
 =?utf-8?B?OWFqUUd5THFYK3RQMUFTTit4OFdlbmJVWUY0ZVNJaGJ4aE1mWnM4eWNmcmVG?=
 =?utf-8?B?a3ZzVHJYQ2dYOWxZY0ZMdXpxelpNMEtLQTBCMGtiSlViVXE4WG5PaW9CamE4?=
 =?utf-8?B?WS9jd3lVNnNTU09rRktDd3J3QzkyZ0oyb3ZiNTlaNk4ybnljdk53YlROTTBz?=
 =?utf-8?B?MUtheDM1emRZOFgrOWxEMWFWejNqeE84Q3VaTmRSV1hHTmJiL1ZzWDNBam1u?=
 =?utf-8?B?UVFmS2pEUm9DWS9WSU00Qk5HQ0dZa0pINWJpRGM2bGpWK0hHUGdtVE03MG5p?=
 =?utf-8?B?bG03ZDk2bGZoc1BLNEY0cFJnUUtQNG9iNXJHL3JySnVKOHQ4ak5qT2pzbVBS?=
 =?utf-8?B?bEwwdmhQWkYvNUVPdExGbm1aN1JCNnpEa2M5Q3J4MEJxYnJXcWRIcVQ2ZkxE?=
 =?utf-8?B?b3FoYnJDNkhDSmlOa1U2bWFYQzhRZ1Faa2RyUVdNN05odkpYalUxMlhhelkw?=
 =?utf-8?B?SWpnMnhUVE9OWW9BWmJKdFA2TjV3OWJUcVJpMTk3d2VyS2cwdWFKUnlyT0xu?=
 =?utf-8?B?R0hESm1laVNsSkF4eFRWL1NFazY4amNsemM2NnoyQ00zZXoyQ1I3dU9vTFZw?=
 =?utf-8?B?bnFQdHMzd0doQy8xRnI2blBmZ3JwTjRXSkYyUGlmR3pQV00yOS9OS2ZaZnM2?=
 =?utf-8?B?bkdWNjArdjhDSnRBTzdoMW1pSlBKODBrRndxdXRDYmNJVmoxNCt1VFZwNXRr?=
 =?utf-8?B?emd2UlhEeDg3bG44UC9iM0JVbEVjYXFmREFBdGRYbWFyTDNReVRuUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c656d74-271e-4419-0a57-08de592e34a9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 20:46:52.2219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mp5qrb21NQVVWtsvtBADTViiiCtnVGeYpqoosNEnV8BrkqxEC2ul1yl39dkLI2Q3Yj3yb6LZaJYqHIyop9NRuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6417
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
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
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
	RCPT_COUNT_GT_50(0.00)[51];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nvidia.com:mid]
X-Rspamd-Queue-Id: 5F1CC5D8CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 1/21/2026 3:36 PM, Gary Guo wrote:
>> [...]
>>>> +
>>>> +/// Initialize a `list_head` object to point to itself.
>>>> +///
>>>> +/// # Safety
>>>> +///
>>>> +/// `list` must be a valid pointer to a `list_head` object.
>>>> +#[inline]
>>>> +pub unsafe fn init_list_head(list: *mut bindings::list_head) {
>>>> +    // SAFETY: Caller guarantees `list` is a valid pointer to a `list_head`.
>>>> +    unsafe {
>>>> +        (*list).next = list;
>>>> +        (*list).prev = list;
>>>
>>> This needs to be an atomic write or it'll depart from the C implementation.
>> I am curious what you mean by atomic write, can you define it?  Does rust
>> compiler have load/store fusing, invented stores, etc, like C does? Sorry I am
>> only familiar with these concepts on C. Could you provide example of a race
>> condition in Rust that can happen?
>
> Oh yes, this would definitely happen. It's down to LLVM to compile anyway. If
> you create a reference, there'll be even more freedom to do these.
>

Ok.

>> Also I did this addition based on feedback from past review:
>> https://lore.kernel.org/all/DEI89VUEYXAJ.1IQQPC3QRLITP@nvidia.com/
>>
>> There was some concerns around pointless function call overhead when the rust
>> implementation is already quite intertwined with internals of the C linked list
>> implementation. I do agree with that point of view too.
>
> Overall our practice is to not duplicate code. Even `ERR_PTR` is calling into
> helpers.
> 
> For performance, it's a valid concern. However Alice and I have series out there
> that enable you to inline the helpers. I'd say unless there's an absolute need,
> we should do the helpers. Especially with caveats like WRITE_ONCE in this case.

Sounds good, so I will then go back to adding a INIT_LIST_HEAD C helper for the
next spin. I agree with the suggestion and now that we are inlining helpers,
there seems little point in adding a separate rust function to do the same.

-- 
Joel Fernandes

