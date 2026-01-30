Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHh4JM/6e2n4JgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 01:26:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 418C2B5E50
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 01:26:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052E610E25D;
	Fri, 30 Jan 2026 00:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DRcsV/Dj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010053.outbound.protection.outlook.com [52.101.201.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC0AD10E0F6;
 Fri, 30 Jan 2026 00:26:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pvVE6YOT3SL6bvrMSe3KLJaemQP4lBXYTUbmdh6zeoA4nNeLUzKb339Qpj7fZIz7IZa15YTU+12AirmZiqvFMMB31lhlXGXzBNicw/44Gds9tyMUNvBlg3TnTQ2es8EIT8VzpDLLKYAPjFDBApzhqX50EKaVvXtarPmHwUAlK5aiYxDAYOh/2V8HCCaRQLEbQ35xk/z3aM1fRQgFse++9g/8JzMwkZ1IEx5BOGxaVmaTo4MhUfFNKwGsCfrSXDfhqD1qPSGbNspLZf5lKNoETvhmZ2xLWxXPiCqb+6axlznXyPH5IkecvXa0aRs75fkJ2W3zdqedXRQza9Zk/4EdFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a6jGXCts0qgKnC+4J5DExzqfoSpKl/7v1fZHBqVstCc=;
 b=is8oUbNX3pMd5PnTk2+7OEnqKB/incUCMQDufVoOZKwBIPeFGVw86/641g+dJsUQx/xIUKgWU0x3mYBGpQTqfvoYGALIz/WgvqwWVaMbcDxVk7j/8XOo+Lb6gfb5t9rN+ZSkX9lm4nR1HI8T+of4mXKwsNAPTHxt1Ay7CeJXlj4LC2F6c0ygQSbOGIOc2RGID/ZuNhFV+NzxJ9VyavQ8t5a689SBwAeftNzAhqBtHa37DO2TtHw9+/q7OTPqEYgrAILmGLQgyGXqa4x/WcEbrpKSN/4APzAnuhQ28txUSuZcFSUefJmizBjjfGi0/iUJz9VDhr88XadINK6Y8wmHmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a6jGXCts0qgKnC+4J5DExzqfoSpKl/7v1fZHBqVstCc=;
 b=DRcsV/DjHUGMmSZVG8D8asLPFbnW5KbKRFdn1UWoRT/4O5kSo5ZsVaI450mrAR1AJugBDNb7SGITADERYmcPXjkTKVJDd57fOnUROw+K6H0lkoEfm92IsIBrlS+LfRW6shwexNBCbbo2c1JWDuXuAJ61AVdsiSmJkokRnnGAIP2x1DmdvZtMXkkchr70vQ5x4oCElqi7RKUS/lCyQATmYIvIcOTGjTNe9lg+LNeePQiejQ4is+jpSSlbIu7kD6ZG8N8QRxqE8n84hvNYMb5LzAq78i0wh05D0DwNWf/QNxfVIJv5tLeJGPHujUoUBBl5Fqsn5ANyxouxVlJW5cP6Dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SA3PR12MB7973.namprd12.prod.outlook.com (2603:10b6:806:305::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 00:26:42 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9564.007; Fri, 30 Jan 2026
 00:26:42 +0000
Message-ID: <20e04a3e-8d7d-47bc-9299-deadf8b9e992@nvidia.com>
Date: Thu, 29 Jan 2026 19:26:35 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 05/26] nova-core: mm: Add support to use PRAMIN
 windows to write to VRAM
To: Danilo Krummrich <dakr@kernel.org>
Cc: Zhi Wang <zhiw@nvidia.com>, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>,
 Alexey Ivanov <alexeyi@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>, Elle Rhumsaa
 <elle@weathered-steel.dev>, Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
 <20260120204303.3229303-6-joelagnelf@nvidia.com>
 <20260121100745.2b5a58e5.zhiw@nvidia.com>
 <e186973c-ce31-405a-8bfa-dc647737a666@nvidia.com>
 <DS0PR12MB6486717785F6DD14EE1F1C46A397A@DS0PR12MB6486.namprd12.prod.outlook.com>
 <DG07HZN0PL87.X5MKDCVVYIRE@kernel.org>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DG07HZN0PL87.X5MKDCVVYIRE@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR12CA0012.namprd12.prod.outlook.com
 (2603:10b6:208:a8::25) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SA3PR12MB7973:EE_
X-MS-Office365-Filtering-Correlation-Id: ae51aa68-79fe-4f01-783c-08de5f963d94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YmF3SzBCaVIvb2NWN01QUDI4Nk9LVWp0QjBITndSOHE2ZWQrUE1TZUJpWmVO?=
 =?utf-8?B?YzZwNmVxL21xbFJKcFh6N2hXWENzWGxVZ0IvRkdTSk9mOXBYdFM5RGxwQnp3?=
 =?utf-8?B?WWRxK3dmNlZCUW5mY3V4Uno2Y2Jwdm8vWVRpQmU1RENMSHBCWjltc0FQMFVH?=
 =?utf-8?B?UzdValJEcFM5R0s0OFUxKzVvYlk4d2Z2Q01PYWo1WGNVVWJSRW1LZnpTM1p0?=
 =?utf-8?B?QTVMcHU3TE92ZjZwYy9LUXRyYTdGNW9Oa2xYSUI3NjhORzg3Tmk2RGxEVkh6?=
 =?utf-8?B?cGZKeE9BTFpYMGo0ZU94WDVFdmZadmZvVytUdDJ5MWEvUE8vMjRXMUFaVGpX?=
 =?utf-8?B?Wk1sbXdhd0lvV0xOZlpzZGt6amNXWWtSK0JpazdTOERKb0xWeGNVMElUZU1o?=
 =?utf-8?B?UnlSQlJra3VFVTlIVk5vMHNaZmVLbG1wdVUzLzJxMzBvMGkyQmF0Y053R25v?=
 =?utf-8?B?cnRiaXVUU3BOMjcwcHFFQTRpTlpRNWJTWXVuVG9MNUp3ajQ4ZDBSZmlMd21B?=
 =?utf-8?B?UGVZQXBjNDJRY3JSaFBXNEhwMllubGozRk82enJsNTFFSU80dVQ0Y2V1alFZ?=
 =?utf-8?B?Ti9nVXlwYlhNd0pWZS96OVdlQVhFcVgyWXU2NkRjaEFnS0tCT1g0WHNJbTR3?=
 =?utf-8?B?QmRHdjNrRkppRStsY2hGQlFLZXc4amkwNERUN2tqNG1KVFVwY3Y3TkpKbFpu?=
 =?utf-8?B?NXZ6VjYyeU5mR0UrQTRwMUpTbDkzVWN0S1lBUGcwMVR6MERvVm8wWi9DR250?=
 =?utf-8?B?dVNwM01pRGttWkFxWmxOQVVNREhFZWpWL0dKYlJ0VHNyTDdCdDhwMUhIUXMv?=
 =?utf-8?B?SldpWWFXcjNrQjNnUHJwZVFRVG1sRzVNNnNCRzlHamlxTmVIUzYwdjl6c0hZ?=
 =?utf-8?B?TlA1TW9XODNLZENYWSszWkErdDZxWlJWVzlNRll4bVNYRHRsQ1YrRzBLNktp?=
 =?utf-8?B?ODcydlBqWiswZ3ZMZ1hqRyt1Z2J3UVVmRldXU1hDWjU3SXY2VERPZm1GWE1n?=
 =?utf-8?B?Q2NjU2Y0bkxnQk5BS28rMXBZSGtQY1g2WFlJRDRJNjBEY1UzYUJBZGxQWk1J?=
 =?utf-8?B?RzdiM1gxTURZRWhsZXhVNXJxMG1KYTRIWk1pc25tL0FQWnVZclBlS09qdXVo?=
 =?utf-8?B?N3dGend2MGRTZ1FLaFVucC9PVFk2ZDlQU1UySVB3MnJLT1g4T3VDNWlPUUs2?=
 =?utf-8?B?bWNTNFJBbVRhRkJwYWFNNG1kdEpzVUxuREw5c2JubWFSM2VNY1VJVU9INjNR?=
 =?utf-8?B?Qm9mZXk5dDJKOGVzMTZlNXdYRjNRQTIyTm9TUVdTOHNVRVJYQnRNdVVmak1K?=
 =?utf-8?B?bkYxM1A5Z2RobDg0RzVyaUMwTWtMOGxNUFloY3RRaDVwdFRzMGlkcEV1c0w3?=
 =?utf-8?B?TFpJWXVrVHpJYkt4K2ZNcjBVWWlGZXpHMWxmODd2djVTRnYxV2tkTGRaTXdu?=
 =?utf-8?B?QlRBS0RmdThGM2FXVXZqc0JCb0ovQWJBU2ROenRhQW1GUi9JdDFoSzJRaEl6?=
 =?utf-8?B?eWxXQ3U1blRiR3lHcDVKaW9TUWhZdDlLWTJmdjFyN0JvZWk2L3d0OXJ1NDk3?=
 =?utf-8?B?UWYvcWZGSHcyVHE0aVZNZy9ab21SM1c1cHJmR2Z4ckRlVmNXVzBFdG53QXhK?=
 =?utf-8?B?MmlXbVV2emI4SGFwS2x2WHl1c0FEU1lnMTBoKzF3Z1I4bHdTMzV6L1hzZVNZ?=
 =?utf-8?B?d1crd25rRmdrT0FPc1FrbzFvb1l4SE9zT1J4cllybDhJc0w3K3JaTlc0NUYr?=
 =?utf-8?B?N2xtUGx6TWl2eE55RXk5VVZYSHFTQnlSZy9yYk5zOStwdDlyUUtIU0VqUmo3?=
 =?utf-8?B?TUMrQVlDMkxqaTMwTjhVU25FYy85VkVOQlp1dzV2ZjFHTmI1U1lmV3FIRm1o?=
 =?utf-8?B?c0w0TStsS3UrRzNIclpvN01DcU5UZUdINkIvdXlwb0x6blorYVU1dDMzMld2?=
 =?utf-8?B?bGxCcHFreVBtbC8vUFpaUEc0Uy82bDlMNC9PMXpRZEJNdWxSZVRMQTEvUGV4?=
 =?utf-8?B?NFl1Q1NGSE5PbFJWa1ZHM043V1I5b0Ftd01NeHRrSUtndzMxZTByc0JENVRL?=
 =?utf-8?B?dDRheEt4OSsyZVZGcDJBcDN2SURTTTRCRWtrRnE1TU9uVHpUM3pjUUVjTHM2?=
 =?utf-8?Q?IOHk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEtNcUN6aCtFZmx6UmtiejFQaHBVbmlEbGlRcGg5QWNxRDFRUUdLbVpIejNB?=
 =?utf-8?B?VXU5ZHVOWXEvQWxUdGJsOTBnTkpZN2dEeVYwQ0FLZDVub3dMT0tlTUh3c3Jo?=
 =?utf-8?B?VjdPZTVGWlFtYmNEUGFvTWE5dDFWYWYvVCtPR2xvbXZTd0RLWkhwcW1uN1dy?=
 =?utf-8?B?eEwzYmc1UkZlbXJWOWVZK3lRcDI1a1J5b0hIb1k1ZkxMcHMwcWhueUExbDA1?=
 =?utf-8?B?Q2JIang5STNTOXNmY2QvVzRoNHFnL25qZFNXYmNDWDRYYWdEQnA4Zk9CaStI?=
 =?utf-8?B?WXYzS3N5Sk1hRStWcUhGcGp1TVY4ZmxrOE9wczdUZk5yNkNtOFAxcWhEQXNO?=
 =?utf-8?B?ZUFXS0RkOUN1bk5pQ3hMMkd2SGtSM3BuL0J1Z0FGNTlEWThmMVpack1reDJO?=
 =?utf-8?B?bGgzdFZNd2pGUVAwR3lzSGJCeVdYeU45KzNLVGJnOVpMc2Q3b1NOb1Q4NHJM?=
 =?utf-8?B?LzdzWGwvRGszYktSOEw1dnA3YUowT2w0MU1KeXRCVUVQQnU1REhhc0dyY3c0?=
 =?utf-8?B?NUdNaHU5RDZHN05oQWhkR0h6eFZ0bmlQNDJmS1l3OVo5NHpNWUNTZzAzNm5j?=
 =?utf-8?B?cytMc3lhSysxbkJqLzh0M3BrOHRodVJCTHZYSXgrampST1QzSDNwUTZtT2xO?=
 =?utf-8?B?WGxPRFNGdXM2M2hlbzlwakZwYkUrQXFmV1VtZitRS1RSU0x1b2krMHJEcEV5?=
 =?utf-8?B?eVdJWmx5SmlxZ013SkJZWVRIYWlDQ2xDTU91b2E2dkJMT0kyUHhEbytjUnZ0?=
 =?utf-8?B?SW96NkRoQXJYYkdQUXM3UndjdTdtZ0RFQm1hVHF5b2l2N0hWajRFT2xseHVj?=
 =?utf-8?B?WFhWNWhsZzZaY1BkRTBBVldXTFRma2Jha041WnJIYUhrMlhBTFJ6T01FMzBK?=
 =?utf-8?B?dXh2a1dIN2hIYU9WQ05KaFpqS3ZMbUlxSWhlMytYM21KRDdJRnF4em5oMzN4?=
 =?utf-8?B?bC9aY3B1SHNjOVBjaHBCTXhZSGozQVd3cmJnVEpkRTJZQVhEelozdTU2RVRC?=
 =?utf-8?B?YTZYay9sVzNBbVJoZlI2c1dRUFNEVFZ5aVZVQ3lwNXBSOWxKWVRBUnNXcjk5?=
 =?utf-8?B?Mlo1cDRSUnZhMXl6Z3NTWStlQm96WG9GS0JOWEpiU0wwdldDckI0ZTNIVnRQ?=
 =?utf-8?B?N0pSSTM2TjdZQWlEcWZYclJnSkd6UkNaaGQ3QitleEp3T3lvWFpPQzlHejBj?=
 =?utf-8?B?cjRlUHlQQnZOQ3gvQXJLaC9ZazZyYnd4UU1TY0ZzUGh3Vnd5bS92LzFTRUlB?=
 =?utf-8?B?b3ZQMCtyZEkzMWxjNUQ5b0hhOXlTeGJKcmJHTmFzTW9pYXhqRUF6THd3VUJF?=
 =?utf-8?B?d3RETFZJQUMzZU5FNXMxVFdYNTJ1bFRJc1ZWaGhNYTBHdVlTd2tvZnhwUzNV?=
 =?utf-8?B?VDJMbU5WN0paWTh6eXRvSG9Tc1JJR2RpandiU0NLY1BDOW43bHhIYUcxaHBZ?=
 =?utf-8?B?elhTaXJqSE9KZ1E3cm5xSVJZQktLclVCcEtzVUsvQlpsTUNjeVVnQWJNcUgy?=
 =?utf-8?B?bFRVejFYUXRmdm1kNzFpMzZsVFF5c0xtTVYrY1VPSFhidTc3YkRkcWNWSEQr?=
 =?utf-8?B?bTd2WWhzU0ZWZTV2b2VjUE1jdTRtZjMvMVNwMDhmZEFXUGpMQWhpM0pjaWc5?=
 =?utf-8?B?bWNaYWVjR3krMTBIU096ZVdYNjlUVWZHN1dwWFRpdTRHY2RhMm5Mc3BkZU5R?=
 =?utf-8?B?Y2hUVnJDSU00WUM0MjZKL2I0SHVFSzZaaUpvOEI2a1E0TWc0TDFIQXU0ZGJV?=
 =?utf-8?B?cDlFTnZ4a0JQRW1MU1hBS29HdUcxdVM0RDBwem9yenZFdThrbWxFZjAyakhI?=
 =?utf-8?B?N3IwUW9hZk1LbDNVdllHc2krZkZORFVFdjIxYUpqSzYxRmdvbUNQUTZCMnFV?=
 =?utf-8?B?dGVtR0ZseXVXend5cWlSdjRvVFFzNGlucnRvMmoxR2lSQ2FOMTR1M3B1ajlq?=
 =?utf-8?B?UHFFVUJEZFlaZnM5SkpVQ0hJNlpNWXhieTdpeTN0cEFJMmFUYnN6a1d2RlUz?=
 =?utf-8?B?Ymdrc2M1VDdzQnVzRkJYQ05PTUx0bnM2VFU4ZjNoMll1SW9IbnlpaDJUZUtk?=
 =?utf-8?B?dFdPc0ZHVHozeHMvTHJrRWNpWVhPYTRadThkOTFhRGt2THJIMXpxQWlnTk8r?=
 =?utf-8?B?ZHJGcVRnQWh2cHRaVUw3blljdFBEZXM4bVFCMWJyNFlpN21FTUZhZXduczFi?=
 =?utf-8?B?N1pRRWlBNUY2NG9yVVNJamZ1VVQ2YmpqcVV1cWVTTzRySjR1LzZKVnhsWmJM?=
 =?utf-8?B?MDJuSTRLR2thUjRsaFRENmpyT2NjSVhoTE1xeHM0eWs3aDFBS253V0ZUWEpL?=
 =?utf-8?B?SFlRN2RoU1VTazVjWTZRWG5UaHRwZkVQdkhUWk1TWjVjVzRFY08xZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae51aa68-79fe-4f01-783c-08de5f963d94
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 00:26:41.8041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6t9uECP5UWsoymMFdUgQiQy7tLBfQ8N7ce80WpkLLJGQzj3m2FTdXKcwmSRZGfmIuGVOLS/qC4bCRo9WDNpuug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7973
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
	FREEMAIL_CC(0.00)[nvidia.com,vger.kernel.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,weathered-steel.dev,collabora.com,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid]
X-Rspamd-Queue-Id: 418C2B5E50
X-Rspamd-Action: no action

Hi, Danilo, all,

Based on the below discussion and research, I came up with some deadlock
scenarios that we need to handle in the v6 series of these patches. Please let
me know if I missed something below. At the moment, off the top I identified
that we are doing GFP_KERNEL memory allocations inside GPU buddy allocator
during map/unmap. I will work on solutions for that. Thanks.

All deadlock scenarios
----------------------
The gist is, in the DMA fence signaling critical path we cannot acquire
resources (locks or memory allocation etc) that are already acquired when a
fence is being waited on to be signaled. So we have to careful which resources
we acquire, and also we need to be careful which paths in the driver we do any
memory allocations under locks that we need in the dma-fence signaling critical
path (when doing the virtual memory map/unmap)

1. deadlock scenario 1: allocator deadlock (no locking needed to trigger it)

Fence Signal start (A) -> Alloc -> MMU notifier/Shrinker (B) -> Fence Wait (A)

ABA deadlock.

2. deadlock scenario 2: Same as 1, but ABBA scenario (2 CPUs).

CPU 0: Fence Signal start (A) -> Alloc (B)

CPU 1: Alloc -> MMU notifier or Shrinker (B) -> Fence Wait (A)

3. deadlock scenario 3: When locking: ABBA (and similarly) deadlock but locking.

CPU 0: Fence Signal start (A) -> Lock (B)

CPU 1: Lock (B) -> Fence Wait (A)

4. deadlock scenario 4: Same as scenario 3, but the fence wait comes from
allocation path.

rule: We cannot try to acquire locks in the DMA fence signaling critical path if
those locks were already acquire in paths that do reclaimable memory allocations.

CPU 0: Fence Signal (A) -> Lock (B)

CPU 1: Lock (B) -> Alloc -> Fence Wait (A)

5. deadlock scenario 5: Transitive locking:

rule: We cannot try to acquire locks in the DMA fence signaling critical path
that are transitively waiting on the same DMA fence.

Fence Signal (A) -> Lock (B)

Lock (B) -> Lock(C)

Lock (C) -> Alloc -> Fence Wait (A)

ABBCCA deadlock.


--
Joel Fernandes

On 1/28/2026 7:04 AM, Danilo Krummrich wrote:
> On Fri Jan 23, 2026 at 12:16 AM CET, Joel Fernandes wrote:
>> My plan is to make TLB and PRAMIN use immutable references in their function
>> calls and then implement internal locking. I've already done this for the GPU
>> buddy functions, so it should be doable, and we'll keep it consistent. As a
>> result, we will have finer-grain locking on the memory management objects
>> instead of requiring to globally lock a common GpuMm object. I'll plan on
>> doing this for v7.
>>
>> Also, the PTE allocation race you mentioned is already handled by PRAMIN
>> serialization. Since threads must hold the PRAMIN lock to write page table
>> entries, concurrent writers are not possible:
>>
>>   Thread A: acquire PRAMIN lock
>>   Thread A: read PDE (via PRAMIN) -> NULL
>>   Thread A: alloc PT page, write PDE
>>   Thread A: release PRAMIN lock
>>
>>   Thread B: acquire PRAMIN lock
>>   Thread B: read PDE (via PRAMIN) -> sees A's pointer
>>   Thread B: uses existing PT page, no allocation needed
> 
> This won't work unfortunately.
> 
> We have to separate allocations and modifications of the page tabe. Or in other
> words, we must not allocate new PDEs or PTEs while holding the lock protecting
> the page table from modifications.
> 
> Once we have VM_BIND in nova-drm, we will have the situation that userspace
> passes jobs to modify the GPUs virtual address space and hence the page tables.
> 
> Such a jobs has mainly three stages.
> 
>   (1) The submit stage.
> 
>       This is where the job is initialized, dependencies are set up and the
>       driver has to pre-allocate all kinds of structures that are required
>       throughout the subsequent stages of the job.
> 
>   (2) The run stage.
> 
>       This is the stage where the job is staged for execution and its DMA fence
>       has been made public (i.e. it is accessible by userspace).
> 
>       This is the stage where we are in the DMA fence signalling critical
>       section, hence we can't do any non-atomic allocations, since otherwise we
>       could deadlock in MMU notifier callbacks for instance.
> 
>       This is the stage where the page table is actually modified. Hence, we
>       can't acquire any locks that might be held elsewhere while doing
>       non-atomic allocations. Also note that this is transitive, e.g. if you
>       take lock A and somewhere else a lock B is taked while A is already held
>       and we do non-atomic allocations while holding B, then A can't be held in
>       the DMA fence signalling critical path either.
> 
>       It is also worth noting that this is the stage where we know the exact
>       operations we have to execute based on the VM_BIND request from userspace.
> 
>       For instance, in the submit stage we may only know that userspace wants
>       that we map a BO with a certain offset in the GPUs virtual address space
>       at [0x0, 0x1000000]. What we don't know is what exact operations this does
>       require, i.e. "What do we have to unmap first?", "Are there any
>       overlapping mappings that we have to truncate?", etc.
> 
>       So, we have to consider this when we pre-allocate in the submit stage.
> 
>   (3) The cleanup stage.
> 
>       This is where the job has been signaled and hence left the DMA fence
>       signalling critical section.
> 
>       In this stage the job is cleaned up, which includes freeing data that is
>       not required anymore, such as PTEs and PDEs.

-- 
Joel Fernandes

