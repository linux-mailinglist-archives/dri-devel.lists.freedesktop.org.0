Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLchK3cFfGmsKAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 02:12:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9C9B6179
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 02:12:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 661BE10E26D;
	Fri, 30 Jan 2026 01:12:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IYaTdwGl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013029.outbound.protection.outlook.com
 [40.93.196.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C978210E22E;
 Fri, 30 Jan 2026 01:12:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MVgnusi+bz3+LD2S50Ocu0JX/Cbc9WO9hUWSYdc4svMjrMuY3NHiZ3MJAgBb6jQaK/LhQ/f+TRSXL2Ok5EYp0mp3HosZ26LnjAAtRrhersFI8+FMKtaTAXPjZB1wVrHwfaXpyvMTJHi04Zfb0zqiz8pAXIKOCshbBVYwAMpioJ8QkGS/c1IyRGBnZCh7IBUYu24B+GpkukVWh4VU+iMOdZiWj71CT1Kq7v1Hskq1CbFdF4k29+uev941JDoC4kf0XnYl0ZmyW+6u1QtKv2pHxM9ZVRd3w/FliWa5o1qJxIjK96yBpm9gGEiEdY69oR1pVPrVsxqFeT90gi3kfY/Npw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKebzuWN75PwnUNxOzXq/7hVDk03ExaLISWD/R01asc=;
 b=K5O9AsK1Enl8m4zr06z57v/X6CyCIiUt5U91r+rOg+ggQgM2CjwAxMQl81PQeJBIB8SRKy6LMLGnrueXYspzgrj8TGlb0yQ7SQIk3O9CW0+KR2ZIk7HydMsdMLdMEc9TiPErPl3ozHgryurYzKBWtRmcwuDQOT0Vz9GayVwe22AuT8ASRaAYc878h5HhXe7ybN32c3JY7Qvg4iBLBaVjfJdQjNdcyZcQR1Kum5US4feSdXx5IkDLgHknR+jYyIVHiiuEoKO029lISWmDf2oC31WtrU3qNicx3WnvT/dnVsw5W7c3wHF6FTx7Ik7VWJuFQUNb01OPVeCWBlV5IIL83Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKebzuWN75PwnUNxOzXq/7hVDk03ExaLISWD/R01asc=;
 b=IYaTdwGlBXFiASmKgv+5M/d+Z0NO2z2XTkQQhgtI3XTOXz5gkTnqKAc06NYkrCbwWIRnlR/ex9wbohFDdP9GGS+BfTwjrhUubE1mIasl1axcBQH3mqNqasZpxjEv5ktmOpYhqcxr5Qz1bVq4T/6Z9rkQoy418qL5V6iv4Ln+LZ0J7819z/xQEWZCaFkvpkCDRU58/sN9y0YbJht5ye3c9y67ZA/U90YeuBAFDvbbvuJb6NFImMwo2wLuhp/ZZfzYlX1OXAk4wI1l40eEu5C95ODJTlyt3bf8Uf4qcwuWYqWyID+ZgR2Cj666Kzxcm85dcbO4YRyk0ECmfoOvUi+CHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW4PR12MB5668.namprd12.prod.outlook.com (2603:10b6:303:16b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 01:12:12 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.007; Fri, 30 Jan 2026
 01:12:12 +0000
Message-ID: <97af2d85-a905-44d4-951f-e56a40f4312e@nvidia.com>
Date: Thu, 29 Jan 2026 17:11:49 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 05/26] nova-core: mm: Add support to use PRAMIN
 windows to write to VRAM
To: Joel Fernandes <joelagnelf@nvidia.com>, Danilo Krummrich <dakr@kernel.org>
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
 Trevor Gross <tmgross@umich.edu>, Alistair Popple <apopple@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Andy Ritger <aritger@nvidia.com>, Alexey Ivanov <alexeyi@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
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
 <20e04a3e-8d7d-47bc-9299-deadf8b9e992@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20e04a3e-8d7d-47bc-9299-deadf8b9e992@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0028.namprd08.prod.outlook.com
 (2603:10b6:a03:100::41) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW4PR12MB5668:EE_
X-MS-Office365-Filtering-Correlation-Id: a6814c9f-9f36-4d10-0e83-08de5f9c98fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eHBzVzBQVWpQd2k5SlJWdzlwTW8zNjhGTTgrVU5nZzRYZWhsMDUybmlZOUhy?=
 =?utf-8?B?REhDMi9sU1YwQkY5YWZ5elRWTW1RMHVVeGtYYTlRNGpHWGJZeWFSd0YzWldM?=
 =?utf-8?B?ZG5iVWxXVUc4T1FoTnd2WEFIV2FwVWxzWGRKZnpFMkJQeDVEQkkyQnlvVzNn?=
 =?utf-8?B?azJXdExlTHZzZzJEeFd2ODBCbnk5RXl1V2N6Ri9SanVURUZZNXJTSXVXUnRV?=
 =?utf-8?B?MWlFRTlHbkNaTzN2RmdCd0VoRERRVlVJTjJMbExaR3ZvNmJyWjRVSEp5OHhC?=
 =?utf-8?B?bk5YNFZxU2hSMGFobXpJb0htTzB5cE1wY1NOVk9jM3ZqMXMyZDYxd0hPMWw5?=
 =?utf-8?B?Q2lPVjVNd1R5RHpFY0F6TkZaQnU3NEJhR2F6Sk8ydnBueE01TTZXRWlSTlVx?=
 =?utf-8?B?T1hzeC82Rk0yTnRreSt3L0pTSnhaOGhXVGxIZVNQS3JjdWZJSWFPWWdpcnBu?=
 =?utf-8?B?dExFZlc0amZsVXdHdE1UbmxXQzg0M09TRS9kaHRoQnNIOTA3bmRXQmlZZlAz?=
 =?utf-8?B?WUtJVVY2RGJsZU5idFhadGsyNjFCb1RVMWlLV1RacVorRDJkd1NadzdaYVpm?=
 =?utf-8?B?cThvcEs0N3pYWkRCVDlwcWpyTlIyTThGd3IzcjNuN1ZPOTgrdlVaVkMrYmlH?=
 =?utf-8?B?S2tJU2pwVnQzLzZxMWphRXBiRXhYYnZjdmw2ZWFFYi94c21pejF0WkVydlJM?=
 =?utf-8?B?QTlWSlVTeU9aZzJId3djODh5bHFRamw2WXQwdXRkNFY3bHZnVDZ0cFd2aWpn?=
 =?utf-8?B?cFcxck1jM1FuL0Y0YS8zcXNDMzIxdzRYOUhHT09YSUhvTFgyemQ3dW9ubmlv?=
 =?utf-8?B?alNzTlZ5Um1LMjNUakZaK3NhbnhQWUY0NUVSdWpUajFRNnNoY0dHZDZlcVAx?=
 =?utf-8?B?SFVRanVKVnVnTFBsVVBjbWVReGxBNFQwdnRiL1hWdmZLUUNWcnZvM1AveThz?=
 =?utf-8?B?WUVxcytrRW1MOEN4ZFQvL2hxS0FTT0Y0dVN1ZzduUlFGREhpZllKZHY0YmZ3?=
 =?utf-8?B?emMxVnplMUw1WURxK2dJL2dTQ2lVZFdoc2xNYmZTakUxOTdsb3VKNEZWNURl?=
 =?utf-8?B?SERFd1UvU2E1SmdTUHNhNlRtbmdiRVVEb0IyOVJCOTIzbmlwUDdiSXBDc1R6?=
 =?utf-8?B?czd1eDhaM1J6Y0pEWXRzRllYRURBUERXamRVQ3o2Tk4vV2ZDM2VVTytqeFNC?=
 =?utf-8?B?WDNucVpvVXBVLzdmNWkwTDBFMjdnTFdHN0VtbFB6QlZ5bWE1Nm95amRGQVlD?=
 =?utf-8?B?eFdwdk1FT1pyeXc3OGZBdFV5OFpneExBWDdRcndKalJSNHZJd1dPajVhaTVZ?=
 =?utf-8?B?NnM4K2FiY0NxaFI4ZmMzbDdoK2FocFRRY2J1TnhoeDdWbG82Vno2NlFMSGNl?=
 =?utf-8?B?SWpUM3pUWG5BbmRKLzhBLytxVnY5dVh6dDl2MERkYkUxU2pGaW5CR3hES2g2?=
 =?utf-8?B?UmdQRExUemZFbVRnTXdEZFlhWXBTcVBGRENWT3d1cW14VjJDc3ZzUmtpSlFp?=
 =?utf-8?B?MU5jSEZIRmdTcE4reEhBV3VWV1g5dGZ2cWlmd2Vhb1dYVXBSd09jZTBUTEht?=
 =?utf-8?B?UXl1MndqWnlkaE5YRExTWE43T2M3OVYyQm93elNncHpnQ0VxdDJmUXFDYUJT?=
 =?utf-8?B?WUFQdnZDRGJZcVRWQ3pzZ1ZhR2JIQnVvRkFYR3Noelo2V1JyNGVrMkxpVU51?=
 =?utf-8?B?a2JHY3l1TnNkSXNMc2ErWEtmVTlKUCtRSkFrV09Ha3UvZUI5QXdWYXBUQkVN?=
 =?utf-8?B?YVlYcFhid3NGT2x6aEZYTDNmMllqcm14dEtEVmdXQXVpN0FDL0VCeU1oMXZt?=
 =?utf-8?B?VUJCMGxxL05mcllWd204L3dmM2p1aVRKS0pOMXM1b1llblhyK3JtZjg0MnJk?=
 =?utf-8?B?UXV1MjM0MGhRS0NZZkNhKzJQdWFBaHhiTkdOWnlqRHdLb2s3aVNoV1FTYllH?=
 =?utf-8?B?ck8zN1dxZ0w3U0g5NWtuWHBhbXNHRm54bFFyOWJaMXZXMW1tTzNjR2RwRmVz?=
 =?utf-8?B?SGNDL1NiaEg3Wit4QkZ6THVnRlN1YU13ZWJVb01ycFk1ZWYvSU5abzMvK3Qv?=
 =?utf-8?B?cXRaM29Kcy92WDRXQWRxM2MrOURVTHRlM3N0VDdveGZKcjZQYTlwKzZxY0ky?=
 =?utf-8?Q?CIco=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXF1ZmNUR0V0UGtKNUJReXdvL2RhNWhuMmlXMTFFemsrcHp3TDJoUWJWZDdX?=
 =?utf-8?B?SE5mZVZtMEpSMlBxYlR1SmxRRjF2WVRwU2hTQ085WUp6TzFUSHV5WTFpVUh0?=
 =?utf-8?B?SlY5blM2NnZGZ2N4cmRiLzJQbSs1T3NNVURtS2NTOFNYTkcrTWFDV3NhczhH?=
 =?utf-8?B?WHp5b0g5SFM5YzkxNWhrWi9xazVFV1EvMUx6N2RUWUZCbVJUMml0ZjlJd1Nj?=
 =?utf-8?B?VytuRHZWM0NRSUg2c0VDTmpNR1F5QWJCbEM1TTVhblhTcHNvbmZSUXQwTmhZ?=
 =?utf-8?B?M0FaUW14M1JvaTB1eDhGV2cvcUlSTkk1THoydURIR3M0ZFU1MW4vVGtQTkd3?=
 =?utf-8?B?Q1oxY3VwdFYxT0ZyeWM0cE1rY25LZi9mRi9VUitMc2xucVhPRzk3WnkyNHYy?=
 =?utf-8?B?NGZUTmE5UWFDSERZc0RqUkM4TEo3ajlvdnFKdGorYTRBYVJ6eWMvalV3SGpY?=
 =?utf-8?B?U2lhZjZRT1oxbW9vbjNLUmhBSWkrRkJyT2NLSGRJV1Z0UmttN3FFOEtlSnMy?=
 =?utf-8?B?bFozbjk4cThpbXMyTUJCZHA0QXo1U0hKdWd4Q3FQWXpGOWNQckxWU3daa3ls?=
 =?utf-8?B?K3hSalQzYlVvcGxhUWZlOFpoQnQ5eHB3VE9ReVJ1T3dMZzg2VGJaQ2dRRGEy?=
 =?utf-8?B?S1hmWklRSlNjcFE3cUZmbnZxWDA0UjNVYk1MZVM5YmhRTnI0a1EyZXBBSllJ?=
 =?utf-8?B?bWhuakdCR2VzREJlK1hkM1lvVDFxNFVFTnphb0xPUVl1Mjg4K09UNjEvMDRl?=
 =?utf-8?B?aTlvS0tiMVpvRW5GS05mekx6d0FlbG5jMm1XZlNNUmZEVUs5dlMvODZyWnFQ?=
 =?utf-8?B?d091YXZ1NW50TTV4QXhETjNYNlhXN3FaTGo5bWg1RkxxOHNtQjA5RUZGeTdW?=
 =?utf-8?B?dzZ0bDkxcnZpaExtOU1rVGJ4RS9xN3oxYUVyNi9pZlhrZW5yaS9zc3pkbCtS?=
 =?utf-8?B?eHU5M0E0VTJ4QldNSG9tVURDc0lxMk4yYTI2RlRPeGJaWHFPMmxpWFBJdGJQ?=
 =?utf-8?B?bGVMdHBXa2lOT3lya01iYmdjUXdXT0xkS1M5bXI4MDM2bURYNUxDVWoxL0RL?=
 =?utf-8?B?eU5oNnRzS2FXMEVIbFFnNXhCSlJrTzBTUGFMclEwWTVlMUZiRVlud1NnVWNL?=
 =?utf-8?B?b0szN2luaWxHdDBBN2VxbkZKZ0VVZ0JiUE0zVlFkM2JseHRPM2l6ZTVHOFM2?=
 =?utf-8?B?QVRBVVh3c3VXc0YrQzhZdHVSYU9xek5HbXY5Si9GT0VENXA5Q3BsbnV0OGFJ?=
 =?utf-8?B?dXNDcVB5QnlaWDJrYTJ1YlJSbHQ5aW1KTldTNUd5ZUpSUlVmTjkvKzgyMlBp?=
 =?utf-8?B?NGVzSXh5YnpYMHo1Wm16Ylpab0NnTlkyamlHeXNMUVh0K0ptTEswcG9lOTRw?=
 =?utf-8?B?QkVTWG45bW8wTmhQTXdyQVM4VnRyQzQ2R3JlMzhYclA3ZmI1Y1NFSVYyUGFV?=
 =?utf-8?B?ektjQTZVT1ZzMG1tSExXUWpUK2NxUENxMGpmWXFTTkRwQnhleTNUdlpqa014?=
 =?utf-8?B?cmJlMXNpakF0d0NqVVpXUDhXeUk3QWltTjJlNXRhczNsZlhqNTAyRjFYUnNt?=
 =?utf-8?B?YUJGR05EYmhRQitBSDNVTmt0bm0rUU9EbytHeEl0T0ZIYzJkZERtTTQwc1h6?=
 =?utf-8?B?VHhnSGx3THJ1NDFkSjFHOWErQ2dXTUQ2eVM4Y1NsYmRNRjdNSFZTWUtKUWtE?=
 =?utf-8?B?dzA4ODk5R3kxemZONWlzNWFOYVZVclAwS2pmT1Y5YUtmL0VKM1JLOEVaV3Zv?=
 =?utf-8?B?clUrOFhSNG95R0lsNVRJcjJITW9jdVB6Sk1JdC9FTGJQYVdpWXZBM0o4UWhS?=
 =?utf-8?B?Zy9xb3dGYVVsWk1CZUpKcUNWREZMaTFpenp2T1hFVnpGSXFpQ0h4NnJ4TUZp?=
 =?utf-8?B?NEV0L0V6bnpZT2NqbWtkK244SDVMQVNqVjNNNWNPUXZTVFlDTGdOWmJzb21W?=
 =?utf-8?B?bXNOY1IvdDNBQmdIVzRDUlcxMU4rWXp4Yk1GM0pCWkRRWnREVVhsMkVkZUpB?=
 =?utf-8?B?M0FLOEhzLzdlQ3gxdXVWZk01cTBKWXRZT2hMR25DQnIvb0ZoYnF1aG11ejQ0?=
 =?utf-8?B?N280WUozVm0vcXg2YkFwZ1ZpdWlVelM3K1IrMHhHNUs3QjNsUTcvVGpiRzZ5?=
 =?utf-8?B?bWFaUzQ5V1g5OFNNTWs2aHpLUjhYN0JXUjVqS2ExV2tCNEN4NTAwcVB3Sk8z?=
 =?utf-8?B?SWIyUnRkd2c3eXFFTXNKVGRhMkdnOEVKZUNvaEdXQkY2KzUzOWVwak1BSnNO?=
 =?utf-8?B?akR6akFteTRYQllCdzNyV01VVmdNRXJ0UDYvNnhHNkZUNTVUT3ZaNEQ2TVVT?=
 =?utf-8?B?bnpNV0RMTnZWeXUyK0VndHhVZURxQkZiWm44eTNLcWJFNyt3TWNRUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6814c9f-9f36-4d10-0e83-08de5f9c98fd
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 01:12:12.1956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v+O2IonnF1S4/N7lb0k+eznoXV8HR+N4N+etXspGz9COfW7aC74kdwewQC62O/dN0TbCrfIpAZkDMWSrhDOT/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5668
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
	FROM_NEQ_ENVFROM(0.00)[jhubbard@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid]
X-Rspamd-Queue-Id: 5A9C9B6179
X-Rspamd-Action: no action

On 1/29/26 4:26 PM, Joel Fernandes wrote:
> Hi, Danilo, all,
> 
> Based on the below discussion and research, I came up with some deadlock
> scenarios that we need to handle in the v6 series of these patches. Please let
> me know if I missed something below. At the moment, off the top I identified
> that we are doing GFP_KERNEL memory allocations inside GPU buddy allocator
> during map/unmap. I will work on solutions for that. Thanks.
> 
> All deadlock scenarios
> ----------------------
> The gist is, in the DMA fence signaling critical path we cannot acquire
> resources (locks or memory allocation etc) that are already acquired when a
> fence is being waited on to be signaled. So we have to careful which resources
> we acquire, and also we need to be careful which paths in the driver we do any
> memory allocations under locks that we need in the dma-fence signaling critical
> path (when doing the virtual memory map/unmap)

unmap? Are you seeing any allocations happening during unmap? I don't
immediately see any, but that sounds surprising.

thanks,
-- 
John Hubbard
