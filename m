Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B08C2DE75
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 20:29:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4228010E21B;
	Mon,  3 Nov 2025 19:29:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="C+74zJxj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012048.outbound.protection.outlook.com
 [40.93.195.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 530B210E21B;
 Mon,  3 Nov 2025 19:29:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lPjY7GvewxAWu5WzZBGS3wm0HhorCx92AQ6eVy135Khir7onqLua4CBxAzkToS/GjoYfC9nQoU+R0cOw7FtqTC26aBBobqPClHeeijSPaBGxAZhhAWnVajhgnW1hGCNHarvyWAlWkh6Ilnh4/4+/LfKZE7ck+qd5JAVGLLUSIKf2cQxfczo4b1CmLSWIch2zjWQYoZhURhs8beOCYHIFaj8DLAskI0c2WVG8Vi3KTK/doXWNodgHCfY1/pw2ROKihfLxZWQcQnJUBFRwzsXYJxv2KZ+IbWkNs6GgTTKctaTQi1GSVAlpCjDyONLU/bw7hZ41ZMGg5iPyrXuxPAgFTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QajWhrkTDE9/OUU/00qZKPdxsm2QS09vJeq57ChQLDo=;
 b=JgKuZCBFubtyUDYMOK+WTEWCFh6pjEAomIuzRzdibTJpcslhj6lBnp/2Iz59p8waiWxlJ26igLmmR+SG+9HzTlxF5Smp1r0leeALLsC2koWRyOFLPJ0PtTDWVOggB3yIYSy2KwHw/TDEqDkkgCXCDUglqpbigDdT2CHhAfQbr+Qc4F8S7QmI5h8C/izeyGCApZzVFC7XXxdIqw0cG8Sa6Gv7JDlhqaD1xtiI4wlMIjTfbnUAQ/vi/JOtFSqNzKygjGwzy5xHKyzF0KsLsyhvFvthdt924M90n5tqEFJDGZ/Pg/ysR5C8QkFGbz4VcEN2+81SoOulfnXkFUfPd9Jq4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QajWhrkTDE9/OUU/00qZKPdxsm2QS09vJeq57ChQLDo=;
 b=C+74zJxj6xKYCjE4ecYTQSAPs3/Qsiq83Pb5qFleSKcu7EtAKpvg3OYVWkYqV3zk6KcUbZx+dIYjy7bYaYfpn2Khk4WOVcDPy9s4dBAHzbGqHAIxoPCR00wL5muAbkNj0fv+HjM6k3mEaBodAORZrXV/0UmxRLrCeSCfHHgBmbcq26mvfGERSEG0O5NctM8ZXblAtjJaM0zcsCBZK9Q92YD8PMpP/ci54NAI54El7h1chOgJR89W9vVi4fi6sNoNhFnDfECchGZ1NGqCgHtu6pqTEt2IYkosnZZ5Iwk0EQ9+XnQ4CKFraJajyf8NXZkDYqCvXn2moOva9p0kLVMFPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by SJ5PPFE4FC9FAB3.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::9a7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 19:29:45 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 19:29:45 +0000
Message-ID: <02d37e88-8bfe-45ab-86da-0afa98fa1ebe@nvidia.com>
Date: Mon, 3 Nov 2025 11:29:33 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] nova-core: mm: Add data structures for page table
 management
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org, acourbot@nvidia.com,
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <20251020185539.49986-8-joelagnelf@nvidia.com>
 <CANiq72=SSQ5nSjt9yzX_A3Tgo2ByGM5CV0VqFnF1cTOzrZ-pbg@mail.gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <CANiq72=SSQ5nSjt9yzX_A3Tgo2ByGM5CV0VqFnF1cTOzrZ-pbg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0185.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::10) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|SJ5PPFE4FC9FAB3:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a5168ed-4a94-4a95-29c5-08de1b0f581c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFFiSzZxOGxMZXZVbWxlcmNsZS8zNGl5dk0vanltaTZtaGE2cUpMK3RNaVhU?=
 =?utf-8?B?WjB2NkRXVjFxcVlpNUtlU0x4U2hYNW1yTVR3NjVVcFNPaGk0QjhCTU5vLzFE?=
 =?utf-8?B?cnNGa29KdUVlMk9YTHY1NmthNytKb3p0WUkvMkhvV3YxeERzVDE5bDJWanFu?=
 =?utf-8?B?bDBGaHAwRnFYS3ZmZEkrVTlpUVZHQklka1R5c0hOR3BzQ3RQZFdyblFxbUI3?=
 =?utf-8?B?WHdCMjFsM3BHZ1JRaCtJOEVraHJ4V0tiaForOFJ0U2FBSjI3Z1EwV2xxZnBP?=
 =?utf-8?B?NlhmaGtTS0NSamZFZmtITnJQQk9aVXRCK2UrWnV3Lzc5L0VhaXJWTVR1V0FD?=
 =?utf-8?B?TFp4TW51WUlISEhvdlQySll1Zm9MZEhxTVJ4YjVtekdadTRXTEx6T1RCK1VY?=
 =?utf-8?B?U2JxMWNtYXJlR2I1UHZMckw1OXZiRjVIZmI3VXZjY1doWis5Y1FOVzlxNnY0?=
 =?utf-8?B?VjhZSUZuUGVvcGxrMExQUzdFUzA0MDRVcWJsakJIbjYrQ1RRTkRTanVlK0hF?=
 =?utf-8?B?ZXNVQVdtbHZ2eEtaWU5pYnJjMmRFNVZHcW1SSjBEMzdSK2RaUTc4djVrbko4?=
 =?utf-8?B?cktvb3luUDYxd0lTVHhOdHU5ZVM0WjgzN3UrZFlrQ1J0WVdpMXFmbFlUNmRQ?=
 =?utf-8?B?cWhUdXB5Z3FHSHI1Y3Z1KzlGQytGazNQcmFTcFFGQTRPbzdueGhJaDJhcFZJ?=
 =?utf-8?B?c2syY1RoZjdER0htTGtBL3cyMThCZHlseWFPNG9EYmlnQkVCeUM1dDB4d2Va?=
 =?utf-8?B?ckx5c3VGRlZmME1tc2NNYkszVENEOWc1bHE2blNDTXlKemQ0MVM4WkV6eVRr?=
 =?utf-8?B?NEh1TlphMWN2V29ISGJLSlZkRStEbFVMU3dHU0MvMjFhelJIaU5yWlF0aGRC?=
 =?utf-8?B?dVNQLytQUzNVNEZjY20ybGJhSk5ZbWtuSjYyTDZ1Q09kdDUwRHhwTjBlbk9M?=
 =?utf-8?B?SmN5bjY1RUdqNDAwVmowa3U2UGVseFcwNFU0QWt3SSt2OHF5R0M0Wmo3dE9T?=
 =?utf-8?B?dlBBRXkwbzhoQm9vU0FFc2hIWUhTOStzRjdyNXR2K3RZT0U0Y3ZtT1FjcWlC?=
 =?utf-8?B?SG5WaGhEUTlxZWhWZ1hNYmIreDJrQlBHMDJ0K2dKRjZ3Ymh1NnRyOXEwMlF3?=
 =?utf-8?B?cEhuaUZBdWcvTWgwTnNqZjJzbks3SFQyR083NlZKL2Z0d2d6RHdBNy9ESkMy?=
 =?utf-8?B?OVQ1Vk5DamI4a0pDWHlJTDZKclFXZVdZNU5yYUhIODc2WitSdFhJSHdpTm8v?=
 =?utf-8?B?M0RycjRKKzVudUR6KzVZSlFkYndBME0zM0RBN3NOYXdtK0xEZVBhVjJSck01?=
 =?utf-8?B?R1d4TFlTYytNT2xuOTUvWG5MSkhoQnkvM2xNVjNDUXJMejNtSUxtb1dqbzI1?=
 =?utf-8?B?N05PSTE2YWwrK3d5NzBhTHdvQzcrbjZKM2daSXRqciszelNKcGlWV3RUNWVI?=
 =?utf-8?B?RENTTDNrK2FJMGZ0TzQxZXNzSnZjQ05vTVhZa2VZUVNsUk9zZmNISmVFU25B?=
 =?utf-8?B?SXVQNzF1eDR5RGovS2tnYUZuWDdjTjVDRWM0UTdUTW5uM0FwS3VLUWNNcy9t?=
 =?utf-8?B?MUlmTGc3SG5WQysvQzB0ZDVabHFpZUV0dWJHUFRlb08zdWc5eDBYSTI5bFV0?=
 =?utf-8?B?YVBCbkJWSkVrU3Ird2ZPMlMrd2FocjBHdGVBaTdMTTYzNDV4RENCRm1HOFZv?=
 =?utf-8?B?Uk1JNmNsczBEKzNOa0RHOFpKamo4VkFBR0ZpQ21mdU9ra0E3eWh6MTBGeGpO?=
 =?utf-8?B?YmtwSkNUQzZWZmQ1NmFKSVBRZit5ZC9iSnd3Y0RFdnMrcGhySVBOWVZ6ckRr?=
 =?utf-8?B?d3IxVzFWa3p4YkhkN3NyUTBqWDJCSXZta1pvMVdjMnVnL2VZYktUV084Wjhi?=
 =?utf-8?B?akxZNU8xdjRkOE9BUDU1ZVdYYzJqbXpMbkkyUGd0M2JTdDNjM0krQlN5T1k2?=
 =?utf-8?Q?hhIslj5PKToB3pjJllJGQ1jpQWQQ25ml?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkdoczFsMmJOQUpMb0lZZ0tJTXE0ZnZCZ1NSTkYyNXJKV3UzRjdaMGZNNXd4?=
 =?utf-8?B?Q3p5UHg5QVBWWFFtZi9sL05iSnoxemNkZ2N5Y3hGcVhHaW43UTR6RW0zTUxz?=
 =?utf-8?B?aWpzSzBkK2F5Zi9NbEZrSDU5czk1dlFURUljdDZlby9uV0VIOWNFQjRXc1No?=
 =?utf-8?B?RlFUSG1Cd2tWR2tWc3lUaFVBQ3BmWndKQ0MzakxFRFNCYlVXbVcybEZmanlh?=
 =?utf-8?B?YkVQY0MzK0xtdzJRN1doVEVrK1ZGczNyYkFKclc0Q1VWRG8zek1jZU1VOEY4?=
 =?utf-8?B?Ukg4U1F4amwvMU5ZbkMyeXRWK1diRksyUzZGRmxVSmxVR1RJckVVQ2NwUml4?=
 =?utf-8?B?M09TQ2JPOE5nSHpLaHQ5cmtPQkxoUFAxSjJBYnhYMDdOMkE0d0YzaGE0RkFy?=
 =?utf-8?B?L0JlZGdQUjJzZ0h0NEZkUUd2YVp0V0htM21ZZ1VmNFpDb2Z6YUVwdjQvZVdi?=
 =?utf-8?B?NWYwQ0NZRTUxSkJsLzJxd0Njdk50VUlVbEQ2ZUlJSysybjlzWFNGdkVXQXpu?=
 =?utf-8?B?WWQ0bUhKWGFYN1VySEd0MlVmVk9DaUtrb2xCNFd6NHhGTmlDczFIMTZhQnlQ?=
 =?utf-8?B?bUdsUEg4Ylo4NVBZZnVYQlY1TDVNSjhyd2pCaWhVSlRDUHRWdysvTHhsME5m?=
 =?utf-8?B?ZWM1LzFCVnFBVHVCM1RGdDhRQ1pvd05EZXRvRXl1YkFGam81OUVWVjllS1VF?=
 =?utf-8?B?alFBQzNOSWJqaXk4R3FialI5bUNxZmR2YklZNE0xQ0NUWGI0TnhxS2dLZ1cw?=
 =?utf-8?B?MmJaTm1ORG83MlAwdTJzRWV0bUgybUt1K0Fsd2F3NmJYbzlrYzJLbXVEZFRq?=
 =?utf-8?B?VFp3RVlQNy9sNWV1d3BPVUVxQ1Bnb0Z4V0VDVWJmVmxhWkE4a2dxcnRMQStp?=
 =?utf-8?B?V2V3RU1PcW81dGRpcGRSQkpCczVQdjRhcGU1SE16c0E0YlVkTzBxK0ZOSnNr?=
 =?utf-8?B?VTBiMVZjeVhQbzViY3hBMWVrOWRJUjZ4dTVoV2NNbEk1ZTZPYy80VUx5QlJo?=
 =?utf-8?B?Q1h6MkE3akE1d3JEK1RKR244M3FyVFNTMzRkZE4zMEp0cktDckN6dTBSM2pj?=
 =?utf-8?B?UnpOUEI4cTA1ZU95eUdQUTJCRTM1Z251MmQwTHJiSmFsSTVwSkdKa3lWcml3?=
 =?utf-8?B?SzJDZzlKbWVlYVAyUHppOUUyUTU2dExFazVhU2diNkRhUzJpZDR0TlljeGpB?=
 =?utf-8?B?ZmtSeFE2OXJxdzZndjM1NENnNzcwZDdCK3AyVXR4VlBYWmpyTjk3NytJblRx?=
 =?utf-8?B?b1ZWTFVpSHBvck85dnlnL3ZlVkRPWGlVc3BrMkVBdjJkc1U5RENTM0VwMldj?=
 =?utf-8?B?TjNWOSt6bHB4NURWcU90SW5hTE9hM0tDUHdsNHRZTkdGWTJTcmtvRnZabHlU?=
 =?utf-8?B?TDlveFBSVkxkSzV6RGFiMHNlZnM1OUpoRys5bzVvRWFlSm5lQS9xWXBQdmk3?=
 =?utf-8?B?RDVZeEQxVExJVDhlTG8xd2VmRnJMVGZVK3g4L29QQ2JrbmxVb3BhUDZHM25M?=
 =?utf-8?B?cUFYZVBNejFnYlAvTklTRmJlcld5MHFJY0paY05MQU15UWNmSW1nNlFXU0tW?=
 =?utf-8?B?d3dZVHkvcm91aVpwV1J6ZzREZWMvUkk5SUcvb1ljUzlFL0xBUXlvb3RVcDZz?=
 =?utf-8?B?WjVhYVRqbGthNCt4SGxDK3BBdFJjNXNUS0hNN1pzaStpVXM3dGdZOWhTYzY1?=
 =?utf-8?B?VlRUUm94Y3JuVmUwQ3hFTjBsTm9SNTBacC9IcDVuWkxEenp0SENYUUFqV3do?=
 =?utf-8?B?cWs4OUNQU2xQNGdwZEFBMEpjekxYK3FXUXZBRFVld2VIaTNaU2NTUkdXTG1Z?=
 =?utf-8?B?aWlCQUVSQnFtWXcveDJCZGgwL2s1YkpDZnI1bnptYXhGQ0JLbFJjS1ZyZlQ5?=
 =?utf-8?B?NUw4eW5kOG5kSU1jUXFkMytBRTdRdlJUQVpycmlWMXN4QW9lOGFPOUxlM2Yv?=
 =?utf-8?B?S3l5bStIZTBUUWNQTHBiU2hEZ2VhSC8xSmhDUjlFYndFOHhHQWZHUDZUY3Ev?=
 =?utf-8?B?aVY4UDFjS3ljZDR3UCt1UVQ5NEcyZmtqSXhjQ0RPQ2pMUlk4eXVlZXpQSVpB?=
 =?utf-8?B?bXpBYlpkWjZDWTdRZGY4WmFkRHgyUlF1cm1vU2FMSzZSaTN0VG1kV2xUaVpL?=
 =?utf-8?Q?EOFHXofT8C0kEIZEHGqZzvEHt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a5168ed-4a94-4a95-29c5-08de1b0f581c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 19:29:45.2626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b9LdRTADQC1azAGnkuuai+CGoPdNk2sOiK3VbvGQCTv4H8KliE9eiozCjeWG/7URzLYV4Y0nZKQDEI1OCo5JSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFE4FC9FAB3
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

On 10/20/25 2:30 PM, Miguel Ojeda wrote:
> Hi Joel,
> 
> A few nits below (I do sometimes this kind of docs review to try to
> keep a consistent style across all Rust code).
> 
> On Mon, Oct 20, 2025 at 8:56 PM Joel Fernandes <joelagnelf@nvidia.com> wrote:
>>
>> +//!     .set_table_frame_number(new_table.frame_number());
>> +//! // Call a function to write PDE to VRAM address
> 
> Newline between these. Period ad the end.
> 

Hi Miguel,

As Joel also was hinting at, is there any easy way to get this sort
of thing automatically checked? This is what scripts/checkpatch.pl
helps us out with on the C side, and maybe it is also the right
tool for Rust...?

It's sad to have a patchset pass both checkpatch.pl, and CLIPPY=1 
builds, and yet still be full of typography and convention 
violations.


thanks,
-- 
John Hubbard

