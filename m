Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 264AFBE0A47
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 22:34:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4362710E8E7;
	Wed, 15 Oct 2025 20:34:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tDHJWfvB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010003.outbound.protection.outlook.com [52.101.61.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1973910E8E3;
 Wed, 15 Oct 2025 20:34:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k83deDomFZomR0On7qREFojvlCvmP6Y/UUGX7xgD9rKfx4kVYZYkz466skSVdtWSINKlxSIgB2p9WyeWBfI0tQ/8meYVcZuuTpgPe4C/R9YQyIvTrYUUJUKNQrSxCyuZULLczcUyxfDisXC2dV8uraXiqjfhxhxsb9U7sOcELnUhpppRMGZEcUWXu/WWQRb4pw6qozPwveEvJnG+hW3s5URrPISbN13kV2iTwMcid1BqoY5Sq8Nhk/pZ0a1EMgpXiB8jJNcRQvSZMPQpNTDCm7J0YdSxjAq/Ba2XHN5uQFUhQVdJAu4KmdGLLMmWRIANRtn2H7ZLpDWi1FG+VWN0kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Crsihc+SQUKSCU1ZmGCysNWFSDFZls7ulkhtyisGPYA=;
 b=b0H68mr6rw/Nk2mAY7k/AMx8pfJTzOQVdvoxp8WXHTCNzCw41IdRFJ+aaJBGIvU4rAJwepNX0s0e13iqnyp0LTvPQjZjvoZGcGZs8FxyUyNerCziyjRZ4WbFcIAXDN8KtKo3bTVkCNSIFybHUbjR5/PlLAVmOrtc8kTobh/tDdDTIQia+bkf+9PityHHk74kYRjE5ROpbT7xFZABLrilUPtIGfBUN3atlwMAqhWPNqw1ZVpESpp1q2YdzD6Bk8Mv5UlIsp7dYo9bLbMKhqbXblf4hYHcr9QeaZ+wcXQGkpUMth3fjGr2gsIBf4FH2onFwqkgbT1KkjsMx96kGAXqLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Crsihc+SQUKSCU1ZmGCysNWFSDFZls7ulkhtyisGPYA=;
 b=tDHJWfvBbNcyfRqHq5sCouyqcd6w9voyCKa71dO3JgIpfTKSEQhCdF0/l4jUWugbjy42IsWjGY4yIzQqpYr1ZqyAVwSTjfL2XDLc4P5DGa9oZ2P80xLBqg31emEl74cklQ7by4zk5aH7kNRVwA7KpVUTuTkE8xDGnnmIvB34xbpBk9foZDa6xNc9ynnqJzsYh4gd4LBen1yxWfs7SBDONDD2/bkqThgM12+EEOYPAl4pcLpEaqJ0p9muB/marAsBRMBZulbWDX9nt3DyI3Jp8DekPo+/ZPaB792FffWcobvS5ohVRqV4LDsWgtCdVexzhE5uFSts9Q90J6crXy8XZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS7PR12MB8321.namprd12.prod.outlook.com (2603:10b6:8:ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Wed, 15 Oct
 2025 20:34:21 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 20:34:20 +0000
Message-ID: <dc510f8e-6c8a-4da4-bfb5-41727c30480f@nvidia.com>
Date: Wed, 15 Oct 2025 16:34:17 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] nova-core: mm: Add initial structures for page table
 management
To: John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, nouveau@lists.freedesktop.org
References: <20251006210956.3232421-1-joelagnelf@nvidia.com>
 <9da480a7-f8ff-4b58-b474-378485762c7c@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <9da480a7-f8ff-4b58-b474-378485762c7c@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN0PR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:208:52d::17) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS7PR12MB8321:EE_
X-MS-Office365-Filtering-Correlation-Id: af16e005-3e01-49ca-c4e7-08de0c2a37cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MmNjaWEwbUFBdEt6ZkJLRzlUMUF0emU1VDVVZ2ZiZUtsQVEwSGtIemhGT2J4?=
 =?utf-8?B?K0tFYXduU2xseVJiN2tuNUhnV3pZKzJlTlF6Y2pQa1E2b3h0a2ozSWhyS0E1?=
 =?utf-8?B?RFY4ZzRkYnhUWkdBRFhpQUlPQUJXL3hJT3l4QkxJckhoREIxbHlpVFl6S3lj?=
 =?utf-8?B?SnYyNUh0Wm55VEZsbmY5bkRVWmhWckFmenBFdXpFTmhZS1NzbWNOQmZGQVpP?=
 =?utf-8?B?Z016L0VuU3crbGdNeG41aHdSYi9Td0YySmFTdmg1eGdicUVWSE9oak93aVIx?=
 =?utf-8?B?cm5tZ1Z3SmdVeEROdTdnY1VCTVNQMEJWMjd1MTlnbzlXSzFzZVVOTGVjZC9W?=
 =?utf-8?B?aUxpVG1IeHZzTlNTM1NINWFIbktPVWx6TTFPL0hoYXU1MTBPdStzRWZlR21L?=
 =?utf-8?B?dy92dVExV0VOYUlma3FJaEY1STBSUzJEem5zOEtDemJKbHZZZmE1WXQwYjlT?=
 =?utf-8?B?US9Yc20yN3JhMHZmb1NmRkw0blZVb3Bhci82ZTFNLzZHNUUvejhDanhqMVAy?=
 =?utf-8?B?RlBJUG5vYzNGUTJmbDZSSURYTDJBVy9JMUQyeWYwdk9wUU1Dcnd5QVB4VHJl?=
 =?utf-8?B?Tjkvd1RPUjlOMXlyeWJUNEJWejNrN2RZWU9BOE16NENpTnZLRVRvcHhqTUxr?=
 =?utf-8?B?czFDMDFMNDkwRFQ5OG9EaDZPZ1o0NFBkc2pWanpXRmR6Z0FZZnVjSmFHQVc4?=
 =?utf-8?B?V041NThHWndlV3RTNXlGNFloUXRQUlBvWmVJU1RzbE5ncCtLM211NkMreVFB?=
 =?utf-8?B?YjBlYit2b3RKTTJpSVkya0t1V2E5cjdQZ2JnV1BrTXBhVFJjRjFZbi9MN0xm?=
 =?utf-8?B?YjN2b3l0dmNzNk9kNmEzTGYxZE1iZXVxY2VYSjdRbXdCa1BZdFVNa25NZlhP?=
 =?utf-8?B?WjBBbXdEcUVLMG1qRW80QzVDdE12V2tkUVV3RCsxWG5ML0cwZzUrQnV0UVpF?=
 =?utf-8?B?cFpXSlN3SEdzRFlCR1dWT0IySk9CNTJ5cGRMVFJsc2VFeitpcGJQNFlnQjJr?=
 =?utf-8?B?d1hnWVFGTlk2MUJNQ3BrYUVtNWVHdVppTTlKRTdNZVRWaklLRWc5ZzdvcnBH?=
 =?utf-8?B?bFQ2RDRvTzhUSm5vUFBrQWhrcUorT2txUzMzUmo3bGZNcVhCVXV2Ly9FL3N4?=
 =?utf-8?B?MC9EZXRQRGRQUWowZnZyWW1NaytVMEJwdzBRWjg2b1BhY3doZGh2RjJBU3Jr?=
 =?utf-8?B?dVlNZmN6TU01US9yQWlscXFyWm5hS2E4amdiRnhibVEvYnl6VWJZOWtYaVFo?=
 =?utf-8?B?YnlSVncyK0M5dGtKNXRmY0lWbWM4Nkw4bnZtTlROSUNUcFI5VitjZUpZVkEw?=
 =?utf-8?B?VDdUeVoxUGpxeE00MnRmWWxXY3B3NkRQNGlJQkFPbi83aWlZRTBSeDhnc3VJ?=
 =?utf-8?B?Z3hyZGRHeVBxaEhBWjUyVksra0QwNG9ydmtQZHI0L09hK3V2OGM4UndhazNw?=
 =?utf-8?B?UEVJb0xFVEpPQ3p2YzYyNWliME9rd2l6SzM1NllDcDRBdjNrSDdtSWQ0U2kr?=
 =?utf-8?B?eFRqdXNmSWpMcHBqblFWV3BTSEI2K0FxUXBITGt4c0hBTkx0MWFWanVQTXFl?=
 =?utf-8?B?NS9jS1poZE9LMmc0QW5qKys4ZktIU3JPN2dJeEFwajNyaDFwWHlSWmYxckFX?=
 =?utf-8?B?UDhIRGNGZzFzS3E1d1BoR1BHbjhKRVNSUlcra2JCZmVQWENLdXdnY0o5SWc3?=
 =?utf-8?B?aW9MZnFFZ08zWVN1Z0NNMWpBeVhqNEpQd3ZKRnpSSlZHaEJQZVU1eWtQaFdC?=
 =?utf-8?B?Z2hpbFJCNUY2dEE1THlZMWI2MXp4RjVpOTdRc2pPVkJCMHhpeDFSMkZRbVF4?=
 =?utf-8?B?cWxHSEZKTFQ5TkIrbG9jMmNHSWhRTVUrcGNuTlVoSm96bUFWcUg5Y1RyeUly?=
 =?utf-8?B?REsyYmJmWWpuSGF3SkFIQVNIN2U3bGtqVlpZbkRIbGVadWcrSG1TUW92YWxl?=
 =?utf-8?B?TktaWUNOUUF3L053MmM3alRWaHIrVytlKy9RZlZTQmo2dUNNSUxwNzh4eGRK?=
 =?utf-8?B?Vkptb2NDTzF3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0VBZzcwQldYZ2trc2dDMXJkeDVrbllLU1NuaWNUNEY4OFJ1eFBrQTUvM1Ra?=
 =?utf-8?B?bENhcy9jM04yeDU5Uk8rTlFMU3dFVGpOM0s0NDhGczh1VjZvaGtsaTVRekVi?=
 =?utf-8?B?UkZaMVBoTnMvWUxQSXZ1QnhUTXVJd2xlZXpsSDhZSjdINHNjZ3FHNlpkSDBV?=
 =?utf-8?B?MmtXVjNDOUhvdU9SY2dZbUZyTU5DV2E0cElYeEVxQWJhU0pxTE1PS1NtaXlR?=
 =?utf-8?B?NDZ2M3IrVDJMSDNtWDBLMHpYQ25tL0NvUlpTTGhZTEg0d3NFQVNMYXdISUsy?=
 =?utf-8?B?eFBsdWxUcnFSQ2E0cWxZSEZZZFNCSUJhS1NNcVE0UUFvZXVlSW9McXAwdFdo?=
 =?utf-8?B?cS9jbDQvTVdVT2lCQ0JHdlRFaldxYzFBeWZRMWhVS0s4RW5qb1h0MU5yOHFW?=
 =?utf-8?B?ZkRab3kxMFFWTEsvRnJobVJXYmhWcDRpU1R5NEVudzR1blFmM05vYVliVnFW?=
 =?utf-8?B?TkNQWmU5eDRya1lzODVnWjhvOG9FWFJzYmk4QldoOWh4WkxDRVhucmRrM2xw?=
 =?utf-8?B?QVgyVE1xUFNYdEM0WitFd1lXREQvS1lsZVVTTVRxaDVTQStEdXN6WG1mTUFh?=
 =?utf-8?B?bHcrVEhOcWN5bWE5czkzTHJ2QzdVZHUxNGdqNFloK2p4TUphVXU0SEVQKzJT?=
 =?utf-8?B?cmt4SXpUVTNJOVlEc3RUV3NnL3YwVnpZdjJvSEM3TFdmeE4vS1Q1V2pWeURQ?=
 =?utf-8?B?SFYrcmNvMXFpQkVGd3p5Ui96cXFJbWQ2Wk5ZSVhvaWxtMVVXNE53Y2tzVEZw?=
 =?utf-8?B?Q2FjVmlIaHZIL3FRK2NCVitLMmhmL01KcSttNGNBUXNMOS83QzFOTU5nTlBK?=
 =?utf-8?B?KzhJZU11RGVVYVI0S3RjWHk0d3JlUThKVXlTdDc2N0EzQkc2VVNYMlZiUldG?=
 =?utf-8?B?dER5Z2l2VHVMUzR4UnNNaTFJZGhvY3RhTWF0RGVnSzg3S3ZqSW5FVWtPSmZ0?=
 =?utf-8?B?em9Kd2VJbElCN0hSc3FkYjIrYjlBSjYvUVlEY1RCM21GRnk3bEpvTGNzZDUx?=
 =?utf-8?B?cmxjMm51cDFzSU1vc2ZxZEJVR1JRZSsxWVdraHZ5Y21hV3lQdGY5S2VqL3BV?=
 =?utf-8?B?R2J3cnU2OENNZEhoMVZISnU1Z0FUN3UyVnhyUElvRVJhWUwzSU81RCtrY0ov?=
 =?utf-8?B?N1VOWjQyKzFoUDFpT3NEaEk1T09TOVQwbStsb1E0RS9nSE5SemhqSmpsYVZu?=
 =?utf-8?B?V3VJMnZ4aEQxZWtEU0RuL3pCTXJRWnRvTHVsSCswcHpBQnhPTmtmRGJwTGFw?=
 =?utf-8?B?RmJkNmVKRGFValUrOC9Eek9xRnVBL3h6b01UUENtdFhaZnU2Zzl6MmQydnhs?=
 =?utf-8?B?Q3hOOGpCVTYvb0g4Nk0vT3JlRE9JUW4xeXZaQ2NSQXB3QUR3TGMxeVRpM0V5?=
 =?utf-8?B?SlNncWRoek8yZmNseDBYQ2h0Qm5jNE0rRzNrbi8zQ1RqRXFtQUtqd3FjUXRy?=
 =?utf-8?B?VSsrNTJsRjZQUzROYWo5M2dqaUtFemJVTXhhT2twZTBDZ2tlUmgrTVVOMXVx?=
 =?utf-8?B?RXhQQWF5MzBROURhZ2swdkZVQ3M5Z0JveSs0ZFhzaCtQTVpTOVA2cU9LNEdD?=
 =?utf-8?B?Qzl2Z3ZMR1M4YUwxVHI0U05obDBWVmM2WmdCenV1NnR2b1Q1Q2swSG9nQVdG?=
 =?utf-8?B?eDdlY2pwWWR5amU0c0lhV3hLSmEyaENpTUxLbS9JSmF4NWtCRW81NjJkQlhr?=
 =?utf-8?B?SnljUEMrNmVYQjIweTg3bE9NUUxsQjVVdFpsMk92WU5XbVVoMHVTcjQwL0Nq?=
 =?utf-8?B?K3ZXUkRGRDIwbUdsNm9xZ2xGeHVRb2pkL2h4VnJCL3dvNXlMUktBTnQyZEtE?=
 =?utf-8?B?ZEwrYjlHTzJKMWhlU29PQTlnZjcwcHZ6b0h0ck16M0ZjUW14WFZTbVhSc1d3?=
 =?utf-8?B?eVMySm1PbVRwS3FycGFSYkFHaW1YUFRINlNQS2doUzE0dW8wc1RoSHEzcE1p?=
 =?utf-8?B?cTVxQ3lUWDlqdlpQV0dvMWthdlkvSnI2WW9BMjJJWG1yeWM0NkZLenNHeGZp?=
 =?utf-8?B?L3FEMzhvVEdHQ2RVRjdSMmx5dEx0dUY0dmI1aHFMd1BXQnpKREhCU0E1eWdC?=
 =?utf-8?B?ajY2c0ZEaDUvSHJuSlFtQm1TcHdjWlJ1UmZjOEtNT1VpQWh1MjQ5bklteHUy?=
 =?utf-8?Q?3Io72StQyoAlBgv7ew88i0EfY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af16e005-3e01-49ca-c4e7-08de0c2a37cb
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 20:34:19.9098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9twyKTDXGrPSFzmf4aZkG5yK7zbgsj45xk1tfOViVdG7Wn5gSDQaSdVoXN8cBBZRq3fUSCKqsyzhT48b8FVoJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8321
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



On 10/14/2025 10:08 PM, John Hubbard wrote:
> On 10/6/25 2:09 PM, Joel Fernandes wrote:
>> Add initial structures and helpers for page table management. Will
>> expand and build on this in later patches. Uses bitstruct for clean
>> code.
>>
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>> ---
>> Rebased on rust-drm-next + bitfield patches [1].
>>
>> [1] https://lore.kernel.org/all/20251003154748.1687160-1-joelagnelf@nvidia.com/
>>
>>  drivers/gpu/nova-core/falcon/gsp.rs |   2 +-
>>  drivers/gpu/nova-core/mm/mod.rs     |   3 +
>>  drivers/gpu/nova-core/mm/types.rs   | 382 ++++++++++++++++++++++++++++
>>  drivers/gpu/nova-core/nova_core.rs  |   1 +
>>  4 files changed, 387 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/gpu/nova-core/mm/mod.rs
>>  create mode 100644 drivers/gpu/nova-core/mm/types.rs
>>
>
> Hi Joel,
>
> This will be easier to provide a meaningful review for, once there are
> some callers to look at. Structures alone are very difficult to review,
> in the absence of behaviors (callers).

John, true. For next posting of this particular patch, I will post the page
table walker patches as well. There are still several prerequisites that PT
walking needs though (PRAMIN, bitfield, buddy allocator), which I will post in
advance before that. This patch was mainly to show how bitfield (formerly
bitstruct) will be used.

Thanks.

