Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41794C99090
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 21:32:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61FCF10E48D;
	Mon,  1 Dec 2025 20:32:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Sb1dJlHv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010061.outbound.protection.outlook.com [52.101.201.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E2D710E48D;
 Mon,  1 Dec 2025 20:32:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wtwe5L4DUvGOn3q0h4Cbvs/61dpZICt3V+8JQ3Sk55pnnvq+mGLykdjKUUEYGOj3Nyaem5svksEYwhTn1r1YiqKLS8+xAWHYHCiXASGXqEkvgLDXBO+timOo1PKpGgKPu5UhY0bpcA8Z9MWyS8zoyaktvYU7DKab7lLNJd3tz6LML+Fkfvq3Z+oQjhkb/CUbA+PmUg8HZWjX2KTtlirY+yJeeBvyrMsir9qwV1+Hn5qfiY2OpxiQ8udGMz5u2qB0ulYIeNZliUdbuoiFErZa2XHA1woIBOWfNptw5VSv59wW3M4kZTM3zx5MxVSs3WTFVIimP9yPPxjE/IxhPAPlOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A7SobvaneZAEkE4Fhf0V37ohhOeegmW1XU6s2xQ7fc0=;
 b=XkBvkcAgMlFT1OuK9Dkq664tN98wdKz7d6e0ZuGJ7qY0/5hEezo4vi6KUfwVrdvJh1wXEd2/LMqC7+zhDAoGUpkgNf2iz9kYcznKvzS7EL6BE23O1OPiDIObt9Z3RF1qyYISNcmkrcEtfiCEooYah45eMaC2J0DtWPfEhBJCC/n/WPM1WoWz0cWknpaDNx/1XgPirKoygU2rWofwMo31bDnyM7iDdNu+8t/TbRI9wVuhu7xhJEQZ4/Z2VgzFH7aUmLaiesv94rEzYyWcYPmkP0zV/9TEhXaAeR5fGJFZN2D0GJhEjTJCkmBssfm9Xtee+RHM6RWPMbgx1H8cV5FYDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A7SobvaneZAEkE4Fhf0V37ohhOeegmW1XU6s2xQ7fc0=;
 b=Sb1dJlHv4Ua628GQ+EQdyUDKVqcZxICusVk4HJ3mJpgqqWzuwt5rTwR4lQYlO+YugQUGbRiiPiC8W898RU8pEHJxuLTm0vYnct5Tl4nDXgdgM91IPlG75C03Kq5gjS+htYMtQCokFcl6qRb4VaXo/afEB0fLuRfY9GPC9tLPa8K5QJho3KQ78lzMkSeRIJu6xvNV2UUvUZKupOVy6FGz9gPwX51E7mneE4pmtwbtDxoZvWfgd488Uk+h71OloJs9Wjkx7BcJf1XUefUNzUOQk+LAYA9BHqwsi0Fyj546ABJYcRnjgUj9dGf10na6/h4ib1WA+U0m+CAC3+AijM4wzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SN7PR12MB6791.namprd12.prod.outlook.com (2603:10b6:806:268::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 20:32:07 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 20:32:07 +0000
Message-ID: <7a88da9f-c67b-4a68-b8d6-a66f9096bab4@nvidia.com>
Date: Mon, 1 Dec 2025 15:32:02 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] rust: clist: Add support to interface with C linked
 lists
To: John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Dave Airlie <airlied@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>, Joel Fernandes <joel@joelfernandes.org>,
 Lyude Paul <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>
References: <20251129213056.4021375-1-joelagnelf@nvidia.com>
 <2653abf6-5cd4-4385-b7c2-f377a9503160@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <2653abf6-5cd4-4385-b7c2-f377a9503160@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0112.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::27) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SN7PR12MB6791:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a66e40d-e66f-4712-4dee-08de3118b257
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SmRrVmk2akVJRTRnY1EvaUFCdVhFcWY0NUxEOVlkN21hYWk4NHpoNzUzZnB6?=
 =?utf-8?B?bUVoeFN2b09Pb2NUcC93UGpPT3MxYnBkRUVGVjkwSUlDbUplMzJaUnM2QnVt?=
 =?utf-8?B?T1hqRWp1VmtrdTJOZWYrczRubjBWU3ZLVkJkQVhWd0Z6L2dIT0craGxmc3VC?=
 =?utf-8?B?MXNwaTg0TXJmR0ovdGh1WG5GbDFLQ2trbU5CRjJOa2lFSm14M1IwN2V3cFlo?=
 =?utf-8?B?ZXlEbGdOUkFxa3ptS3phN0pRekVadjlGQS9YOXl2cGFCSTR3Zzhic1FxVWU3?=
 =?utf-8?B?U2NDWXZUTHc3QitidnVqbldmbmx2YzRkTi93RGpzWjFiV1hGMXFqMXl4aWE2?=
 =?utf-8?B?em03aThOMEZoU0RYeThqbFlNRk03TGxncE8zWUZjYXJaUGFKclZRM1NBcmNW?=
 =?utf-8?B?akZ6cmtiYUdxRVlCQW42OXF0T3JsOHJVNnRRQVVsWFJ3c3owTXF4bk93Y0J0?=
 =?utf-8?B?QTN3U1pNb3RQaVNCcXlabDlwbHNnMDB5T2ZydmpEUnY1ejYvbXZIMm5tZ0tn?=
 =?utf-8?B?YlVlRUFaVGF4RkNOYmZramVBRG9qSUthQWZWK2FEbjczK29oblRXQUFJWWtn?=
 =?utf-8?B?aGphTy9VK3pQbE5XeXpndkNLTXQrMDJLWitPNnhLdmxXZWhiQThkSnp1Umhv?=
 =?utf-8?B?Tm56SlozeFo0NEFCYWZzZjBvSndJMHZBT3ZSUEFBV08wUlAvMkxRcTd0ZkdV?=
 =?utf-8?B?a0k0dDkyMWFTbW1TYjRBeGNVQUhqcldnZkVCMkl1RTljakVKNFFoMnVmRkp2?=
 =?utf-8?B?WHQvQnVlRXJkNURFZTJ6UW9YNjNsU0Q0SGxzUktscEN1a1JUSms4dzJCL1k5?=
 =?utf-8?B?dW54OVpjQmhCZzFxQThZNUw5emhqNUd6Yk0zMlpIV1dZSXY0cTNaTDNmVjdD?=
 =?utf-8?B?YmpBSk56VVRHdHRNRGxWaWhzeWZ2VTJMV0ZqcW1yb0hUUXVidWpEUHNJZVNs?=
 =?utf-8?B?MlY3bU0vOTZFMHFybTRNWEdnNVhOUytTL3Z2cEVkVUF2NXVtZEl5cmdoK0Q4?=
 =?utf-8?B?ZFVTQXBQcjZOUWhhRGtMMUpUMlNZbmFYN3VuNk5tZmlHcDdSSHB1R1RmdGdY?=
 =?utf-8?B?dXZXem14cFlrdUNsWUthQVpCZWVZN3YzOXVpTExoeFZWdm1nVmI1ZVN6WDBG?=
 =?utf-8?B?ZDVkblllWmxaOXJUU0doYWdISGY2OExYbVNteUc1SWlnZlgyaUgvbnl1TVNa?=
 =?utf-8?B?akg1aW1PR3UvcVFYdUxOTytRSmFFendldEJibklWSVdKV1hmVGRwZ2NLbkZ2?=
 =?utf-8?B?UEZSN3VqdHc0VlYrQnBabVlMb3Z3VlQrVHEwcGcvRUFCS01qSlpyRVVxMHNS?=
 =?utf-8?B?QU5qaEU0M3phR05zcmVPTFQ4YWxBS0pDQ2ZqQ0xvYXpxN2xPMUxaNXUyMnkz?=
 =?utf-8?B?aFVKRlJic3k4M01ITHpCTkMrU2pSNDRKUS83OFptOUdhc0FxY2x1ZEhUVVVN?=
 =?utf-8?B?UFloV1cvVytQK2oya3I3bFIxODZLT2xZQ2FJZ0JPWUpqN3NZNmtLZ2NoT2xv?=
 =?utf-8?B?Y1NZakMwaXd4bGlLMGZKbTNLNnVLUjViRGtJek01bFExUU5saUxkRm1qcWF4?=
 =?utf-8?B?SVlOTHdnNkpQdWdpZG1NQm94RFlwZ3FSN21DSGJyWjFNZFJPQzBjVmUzQzdu?=
 =?utf-8?B?cmR3QzdaUlBjdG1XN1hSTXFPMW5VUHJaOXgrNjJyMWN2dmRZSGpDSXBFdkdC?=
 =?utf-8?B?S0V4VGRaYlM1N1AreHFpUWlVRW9ETXM3Sm5VVTIxY1BKeHBJK1EwSjYzVUJz?=
 =?utf-8?B?Uy9PS2w2L0RHYmhZNHJ4b2dhdGFia1F6bnl2TWdJNXUwMkVIdE9KVzh5WnNa?=
 =?utf-8?B?YkZxZnIyRkFKVU04TWhlWkd5am5Oa3JZT2hYOXZSa2lvZmhibkNiRCtZYXc1?=
 =?utf-8?B?b1hGT2htalJzdzZtMk03RlRyWFJjSUk2bXpETy8zZnloSUdITWh1OWY4c210?=
 =?utf-8?Q?hKxVPDsSTf8kdp8N/h4ohVvzUEA9AFoj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QW5ScnJOanRNbXRqV21EUlErYk85Ymcxd3dVdHVpNzN1NzBrL0o4M1JWUGRS?=
 =?utf-8?B?K3pBRm5mSDBjQURGdzZESEFFd1dGSTJVNW1PSVErTksyNytqZkZ4bVV0LzVN?=
 =?utf-8?B?ZkJsTTE1Kys0SVUraVU4Ykl6cHlmR1FMWDBNRzhPVUpCbVJkNkhiQmwrLzUv?=
 =?utf-8?B?UEhRRERMRTdQV2pTUk5yVjdORXJwd1lHNmxQTk81VTJsbkFPUitFQjhLTURr?=
 =?utf-8?B?UklWWGVKckFaRDdjVk5kRlEvVTZOMHVSZDZLd1IxTE0ycTc1OUh2eWpPWE1F?=
 =?utf-8?B?bW5WNU04TEJ1aVIvR3VMejZRNjJOYURQMkVUOCtBbGNINE44ZHlRWURuUmF0?=
 =?utf-8?B?cGtQVlE0MkJERGhZaGNvS3YwWXRDc2NFbnZyc2RoYkoxN0MvbFB5Z1lzMzg4?=
 =?utf-8?B?MjBESzhCSXRPNmliYXpTU0FVR2I2czJMWlVrU1YrbUhsVk9kUGlDQTlVbWc1?=
 =?utf-8?B?UEtqV2JySW1FTUxNMUowRGxTQkxneHRLbTlNbGFLTGRLalJuOEI0eHNVK1Ra?=
 =?utf-8?B?YzZycXRZNFZuMVRDTkJVbG9jajdxcTQrQllYVkpZZ0k0TWdydjZFYTFJVUZ3?=
 =?utf-8?B?NThHWWRYOVhFS2FlbEx6Unord2N4UVF3bnNBWXhaYmdDRkY4ZDZ6N3RSNzFQ?=
 =?utf-8?B?c0JlWS80Z1UyQ2V3QWdmV2tkSm56eFNWcnl6MGtTVGZWenFQeTdJQmlhRS9Q?=
 =?utf-8?B?VjZzK3E5V0g1WEpNV2ZqOXRZRmE5bVdpRTdFME1iVVdwSWxVVkF1aTRubG5u?=
 =?utf-8?B?dkdOMmgwWGJJakQrK1AwWks5ZjZOeWl1NkhNTi83Y2F4NEFhdkd5UGdkejlF?=
 =?utf-8?B?MVZkTCtqV0IxQmZEb0pMUzlxdUt6Z2ZuTXp4aWU0cnl5RldyTVhROUhXc2Ur?=
 =?utf-8?B?Wk43aXlBUE80dXZ4S2NibHZQV3lTdnVURGQzSGsxVmsvYzhrNWJnT3BWRjZr?=
 =?utf-8?B?WUtBU3YrNTEzSzJTTUNrUDV3VzBvVzUzSEpwUUZoZnZDeW9OTlFSSkl6cXpN?=
 =?utf-8?B?RmJ4ZWhIbzV0dkxsM2xYK21kR2ZtWXh6Q1IvUURkOUJPaHNlVTZLT3g3cXNT?=
 =?utf-8?B?V2VQb2FYNmtoeFhGSVAwYmF5YWc1a2NpbjA5ZkM4RytVdm5mZVpJZzIwWHNw?=
 =?utf-8?B?dGpRMUtqZmlaV3ZlNWoxZzQ0cEhPRjdlUlJyTDZPQ1l5VWZ5Vm54MUZJbHFM?=
 =?utf-8?B?ZEhVcmdtYWY5VzRsQkNqTi9wQ0F6VXdQUFkxOEpBTEJQLyttUFJHRUlGODZ5?=
 =?utf-8?B?clhIK3l5aEw4eTFzZGljT0k1Sm1pcjExT0dMZzhhcVhrU3IwY3RiUTBadzRN?=
 =?utf-8?B?TnNtYXNnVEpwak5lWkUvYXE1L3JJdWdlUnJWUjFnNWRCZXNzMGFGb1ZaTldM?=
 =?utf-8?B?ZmQ0aTBYcWZXSWtta3A0ZUpJV0pKaFZpNEszUHJ2Q21RODRTQnFYWTJucFkz?=
 =?utf-8?B?UDBtbENtNFNpVE9WWS9jT00yeG9HR3BaRU1qdjdCVXBaZ3VVVjBickMyYis4?=
 =?utf-8?B?dGR1RHY5Y1B3dFEvVFVhTTdCb1pvSFFXVUJSMGt1a1VzOGM0bWhpMWplbHBG?=
 =?utf-8?B?U2VUTHdIZUFNNWFtTXh3YjRxc2haSjF5S3lLck1NVXIyRUJkYXNBMlF3Q0Vk?=
 =?utf-8?B?R2VoNFAyM0d1bEJMVTQrcTlyNnJ3VzJBM1Q3RmtPV1RId29KekJjditPL3Bx?=
 =?utf-8?B?UFlyb1AvMFFkSEZmblUrSmdNOUV1K0ZNY0JEU0YrR1BPVzM1c204UXB4dmMy?=
 =?utf-8?B?U2pENjFZRmhYQmt2bm82WEJDRmh0cUJzOGs4R012ekhxRktuNjRjVTI2R1Jj?=
 =?utf-8?B?M0VMTHdzNS85SlJlTEFKdjZNa2wxK1VaTWlEYTJxbzMrTEhYOE1ENy9ldXVu?=
 =?utf-8?B?WDVjazRrVVBnREJweUZLd2FBWGM3eGRIZURBNVVaTlRRalcxVmFHOE9vaEU5?=
 =?utf-8?B?OTBvL1V2THorbU1kakpFUGFyV2dWclg2SWNMSDFoQ1NUemRneURDejcrTzc2?=
 =?utf-8?B?VnVLMWhwS001djhGdDNGcU9DZU5XOE0rMzRqN3B5T0tiTHNRRk02VG0wZjFT?=
 =?utf-8?B?ZVE2Q3lBUHJuZ0JYdlZ1RE9BbVdxK2FCR2VxbFFYTDJ1Mlo5L0NVc0VFMVpk?=
 =?utf-8?Q?5hzeZlLSRfs+NbI9HB/C+O2Ld?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a66e40d-e66f-4712-4dee-08de3118b257
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 20:32:07.6541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BtLuuRp58YiHPymoZg9TeIv2BPqac0MQUl1gQQB0MjhM4yegrXi/Ek1l1k5eLN6ODeCuR2EASFhZRtn5T1pAsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6791
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

Hi John,

On 11/30/2025 7:34 PM, John Hubbard wrote:
> On 11/29/25 1:30 PM, Joel Fernandes wrote:
>> Add a new module `clist` for working with C's doubly circular linked
>> lists. Provide low-level iteration over list_head nodes and high-level
>> iteration over typed list items.
> ...
>>
>>  MAINTAINERS            |   7 +
>>  rust/helpers/helpers.c |   1 +
>>  rust/helpers/list.c    |  12 ++
>>  rust/kernel/clist.rs   | 349 +++++++++++++++++++++++++++++++++++++++++
>>  rust/kernel/lib.rs     |   1 +
>>  5 files changed, 370 insertions(+)
>>  create mode 100644 rust/helpers/list.c
>>  create mode 100644 rust/kernel/clist.rs
> 
> Hi Joel,
> 
> This is sufficiently tricky that I think it needs some code to exercise it.
> 
> Lately I'm not sure what to recommend, there are several choices, each with
> trade-offs: kunit, samples/rust, or even new DRM Rust code. Maybe the last
> one is especially nice, because it doesn't really have many downsides.
> 
> Rather than wait for any of that, I wrote a quick samples/rust/rust_clist.rs
> and used it to sanity check my review findings, which are below.

In v1, I had a samples/rust/ patch, but everyone's opinion almost unanimously
was this does not belong in a sample, but rather in doctests. What in the sample
is not supported by the current doctest? If something is missing, I think I can
add it in. Plus yes, DRM_BUDDY is going to be a consumer shortly.

>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 5f7aa6a8a9a1..fb2ff877b6d1 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -22666,6 +22666,13 @@ F:	rust/kernel/init.rs
>>  F:	rust/pin-init/
>>  K:	\bpin-init\b|pin_init\b|PinInit
>>  
>> +RUST TO C LIST INTERFACES
>> +M:	Joel Fernandes <joelagnelf@nvidia.com>
>> +M:	Alexandre Courbot <acourbot@nvidia.com>
>> +L:	rust-for-linux@vger.kernel.org
>> +S:	Maintained
>> +F:	rust/kernel/clist.rs
>> +
>>  RXRPC SOCKETS (AF_RXRPC)
>>  M:	David Howells <dhowells@redhat.com>
>>  M:	Marc Dionne <marc.dionne@auristor.com>
>> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
>> index 79c72762ad9c..634fa2386bbb 100644
>> --- a/rust/helpers/helpers.c
>> +++ b/rust/helpers/helpers.c
>> @@ -32,6 +32,7 @@
>>  #include "io.c"
>>  #include "jump_label.c"
>>  #include "kunit.c"
>> +#include "list.c"
>>  #include "maple_tree.c"
>>  #include "mm.c"
>>  #include "mutex.c"
>> diff --git a/rust/helpers/list.c b/rust/helpers/list.c
>> new file mode 100644
>> index 000000000000..6044979c7a2e
>> --- /dev/null
>> +++ b/rust/helpers/list.c
>> @@ -0,0 +1,12 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +/*
>> + * Helpers for C Circular doubly linked list implementation.
> 
> s/Circular/circular/
> 
> ...but:
> 
>> + */
>> +
>> +#include <linux/list.h>
>> +
>> +void rust_helper_list_add_tail(struct list_head *new, struct list_head *head)
>> +{
>> +	list_add_tail(new, head);
>> +}
> 
> This is, so far, not used. Let's remove it, until/unless you have some
> code in this patch(set) to use it, please.

Did you try to remove it and build the doctest? :)

  CC      rust/doctests_kernel_generated_kunit.o
error[E0425]: cannot find function `list_add_tail` in crate `bindings`
     --> rust/doctests_kernel_generated.rs:3619:19
      |
3619  |         bindings::list_add_tail(&mut (*ptr).link, head);

>> diff --git a/rust/kernel/clist.rs b/rust/kernel/clist.rs
>> new file mode 100644
>> index 000000000000..361a6132299b
>> --- /dev/null
>> +++ b/rust/kernel/clist.rs
>> @@ -0,0 +1,349 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! A C doubly circular intrusive linked list interface for rust code.
>> +//!
>> +//! # Examples
>> +//!
>> +//! ```
>> +//! use kernel::{
>> +//!     bindings,
>> +//!     clist::init_list_head,
>> +//!     clist_create,
>> +//!     types::Opaque, //
>> +//! };
>> +//! # // Create test list with values (0, 10, 20) - normally done by C code but it is
>> +//! # // emulated here for doctests using the C bindings.
>> +//! # use core::mem::MaybeUninit;
>> +//! #
>> +//! # /// C struct with embedded `list_head` (typically will be allocated by C code).
>> +//! # #[repr(C)]
>> +//! # pub(crate) struct SampleItemC {
>> +//! #     pub value: i32,
>> +//! #     pub link: bindings::list_head,
>> +//! # }
>> +//! #
>> +//! # let mut head = MaybeUninit::<bindings::list_head>::uninit();
>> +//! #
>> +//! # // SAFETY: head and all the items are test objects allocated in this scope.
>> +//! # unsafe { init_list_head(head.as_mut_ptr()) };
>> +//! # // SAFETY: head is a test object allocated in this scope.
>> +//! # let mut head = unsafe { head.assume_init() };
> 
> This is a bug that leads to a corrupted list. I have the test code (and
> the kernel hang/crash) to prove it.

Good find, actually it is a bug only in the example (the list construction in
your sample should be coming from C code, not rust - this code here is just for
doctest setup). That said, see below for fix.

> The problem is that any move after init_list_head() invalidates the
> list: the next/prev pointers still point to the old address.
> 
> The fix requires two-step initialization, like this, for example:

It has nothing to do with 2-step initialization. The issue is only related to
the HEAD (and not the items) right? The issue is `assume_init()` should not be
used on self-referential structures, the fix just one line:

-//! # unsafe { init_list_head(head.as_mut_ptr()) };
-//! # let mut head = unsafe { head.assume_init() };

+//! # let head = head.as_mut_ptr();
+//! # unsafe { init_list_head(head) };

Does that fix the issue in your private sample test too?

Or did I miss what you're suggesting?

> 
> //! # // Two-step init: create uninit first (can be moved), then init after.
> //! # let mut head = MaybeUninit::<bindings::list_head>::uninit();
> //! # let mut items = [
> //! #     MaybeUninit::<SampleItemC>::uninit(),
> //! #     MaybeUninit::<SampleItemC>::uninit(),
> //! #     MaybeUninit::<SampleItemC>::uninit(),
> //! # ];
> //! #
> //! # // Step 2: Now init after they're in their final location
> //! # // SAFETY: head is in its final stack location.
> //! # unsafe { init_list_head(head.as_mut_ptr()) };

Until the items are added, the items have nothing to do with the head. So I am
not sure why you have to order it this way.

> 
>> +//! # let mut items = [
>> +//! #     MaybeUninit::<SampleItemC>::uninit(),
>> +//! #     MaybeUninit::<SampleItemC>::uninit(),
>> +//! #     MaybeUninit::<SampleItemC>::uninit(),
>> +//! # ];
>> +//! #
>> +//! # for (i, item) in items.iter_mut().enumerate() {
>> +//! #     let ptr = item.as_mut_ptr();
>> +//! #     // SAFETY: pointers are to allocated test objects with a list_head field.
>> +//! #     unsafe {
>> +//! #         (*ptr).value = i as i32 * 10;
>> +//! #         // addr_of_mut!() computes address of link directly as link is uninitialized.
>> +//! #         init_list_head(core::ptr::addr_of_mut!((*ptr).link));
>> +//! #         bindings::list_add_tail(&mut (*ptr).link, &mut head);
>> +//! #     }
>> +//! # }
>> +//!
>> +//! // Rust wrapper for the C struct.
>> +//! // The list item struct in this example is defined in C code as:
>> +//! //   struct SampleItemC {
>> +//! //       int value;
>> +//! //       struct list_head link;
>> +//! //   };
>> +//! //
>> +//! #[repr(transparent)]
>> +//! pub(crate) struct Item(Opaque<SampleItemC>);
>> +//!
>> +//! impl Item {
>> +//!     pub(crate) fn value(&self) -> i32 {
>> +//!         // SAFETY: `Item` has same layout as `SampleItemC`.
>> +//!         unsafe { (*self.0.get()).value }
>> +//!     }
>> +//! }
>> +//!
>> +//! // Create typed Clist from sentinel head.
>> +//! // SAFETY: head is valid, items are `SampleItemC` with embedded `link` field.
>> +//! let list = unsafe { clist_create!(&mut head, Item, SampleItemC, link) };
>> +//!
>> +//! // Iterate directly over typed items.
>> +//! let mut found_0 = false;
>> +//! let mut found_10 = false;
>> +//! let mut found_20 = false;
>> +//!
>> +//! for item in list.iter() {
>> +//!     let val = item.value();
>> +//!     if val == 0 { found_0 = true; }
>> +//!     if val == 10 { found_10 = true; }
>> +//!     if val == 20 { found_20 = true; }
>> +//! }
>> +//!
>> +//! assert!(found_0 && found_10 && found_20);
>> +//! ```
>> +

[...]

>> +impl<'a> Iterator for ClistHeadIter<'a> {
>> +    type Item = &'a ClistHead;
>> +
>> +    #[inline]
>> +    fn next(&mut self) -> Option<Self::Item> {
>> +        if self.exhausted {
>> +            return None;
>> +        }
>> +
>> +        // Advance to next node.
>> +        self.current_head = self.current_head.next();
>> +
>> +        // Check if we've circled back to the sentinel head.
>> +        if self.current_head == self.list_head {
>> +            self.exhausted = true;
>> +            return None;
>> +        }
>> +
>> +        Some(self.current_head)
>> +    }
>> +}
>> +
>> +impl<'a> FusedIterator for ClistHeadIter<'a> {}
>> +
>> +/// A typed C linked list with a sentinel head.
>> +///
>> +/// A sentinel head represents the entire linked list and can be used for
>> +/// iteration over items of type `T`, it is not associated with a specific item.
>> +///
>> +/// # Invariants
>> +///
>> +/// - `head` is an allocated and valid C `list_head` structure that is the list's sentinel.
>> +/// - `offset` is the byte offset of the `list_head` field within the C struct that `T` wraps.
>> +///
>> +/// # Safety
>> +///
>> +/// - All the list's `list_head` nodes must be allocated and have valid next/prev pointers.
>> +/// - The underlying `list_head` (and entire list) must not be modified by C for the
>> +///   lifetime 'a of `Clist`.
>> +pub struct Clist<'a, T> {
>> +    head: &'a ClistHead,
>> +    offset: usize,
>> +    _phantom: PhantomData<&'a T>,
>> +}
> 
> This discards build-time (const generic) information, and demotes it to 
> runtime (.offset), without any real benefit. I believe it's better to keep
> it as a const generic, like this:
> 
> pub struct Clist<'a, T, const OFFSET: usize> {
>     head: &'a ClistHead,
>     _phantom: PhantomData<&'a T>,
> }
> 
>> +
>> +impl<'a, T> Clist<'a, T> {
> 
> And here, the above becomes:
> 
> impl<'a, T, const OFFSET: usize> Clist<'a, T, OFFSET> {
> 
> ...etc.

It is not ignored, the const-generic part only applies to the constructor method
in my patch. I didn't want to add another argument to the diamond brackets, the
type name looks really ugly then.

The only advantage I think of doing this (inspite of the obvious aesthetic
disadvantage) is that a mutable `Clist` cannot have its offset modified. Let me
see if I can get Alice's suggestion to make it a const in the struct work to
solve that.

[..]
>> +impl<'a, T> FusedIterator for ClistIter<'a, T> {}
>> +
>> +/// Create a C doubly-circular linked list interface `Clist` from a raw `list_head` pointer.
>> +///
>> +/// This macro creates a `Clist<T>` that can iterate over items of type `$rust_type` linked
>> +/// via the `$field` field in the underlying C struct `$c_type`.
>> +///
>> +/// # Arguments
>> +///
>> +/// - `$head`: Raw pointer to the sentinel `list_head` object (`*mut bindings::list_head`).
>> +/// - `$rust_type`: Each item's rust wrapper type.
>> +/// - `$c_type`: Each item's C struct type that contains the embedded `list_head`.
>> +/// - `$field`: The name of the `list_head` field within the C struct.
>> +///
>> +/// # Safety
>> +///
>> +/// The caller must ensure:
>> +/// - `$head` is a valid, initialized sentinel `list_head` pointing to a list that remains
>> +///   unmodified for the lifetime of the rust `Clist`.
>> +/// - The list contains items of type `$c_type` linked via an embedded `$field`.
>> +/// - `$rust_type` is `#[repr(transparent)]` over `$c_type` or has compatible layout.
>> +/// - The macro is called from an unsafe block.
>> +///
>> +/// # Examples
>> +///
>> +/// Refer to the examples in the [crate::clist] module documentation.
>> +#[macro_export]
>> +macro_rules! clist_create {
>> +    ($head:expr, $rust_type:ty, $c_type:ty, $field:ident) => {
>> +        $crate::clist::Clist::<$rust_type>::from_raw_and_offset::<
>> +            { ::core::mem::offset_of!($c_type, $field) },
>> +        >($head)
>> +    };
>> +}
> 
> Unlike the corresponding C container_of() macro, this one here has no
> compile-time verification that the field is actually a list_head.
> 
> How about this, to add that check:
> 
> --- a/rust/kernel/clist.rs
> +++ b/rust/kernel/clist.rs
>  macro_rules! clist_create {
> -    ($head:expr, $rust_type:ty, $c_type:ty, $field:ident) => {
> -        $crate::clist::Clist::<$rust_type>::from_raw_and_offset::<
> +    ($head:expr, $rust_type:ty, $c_type:ty, $field:ident) => {{
> +        // Compile-time check: $field must be a list_head.
> +        const _: () = {
> +            let _check: fn(*const $c_type) -> *const $crate::bindings::list_head =
> +                |p| unsafe { ::core::ptr::addr_of!((*p).$field) };
> +        };
> +        $crate::clist::Clist::<$rust_type, { ::core::mem::offset_of!($c_type, $field) }>::from_raw(
>              $head,
>          )
> -    };
> +    }};
Sure I will play with your suggested snippet and add that, thanks.

 - Joel

