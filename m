Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDA5B52F2B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 13:04:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A542E10EA88;
	Thu, 11 Sep 2025 11:04:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YRpWeyTr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2089.outbound.protection.outlook.com [40.107.96.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C83810EA7E;
 Thu, 11 Sep 2025 11:04:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GSjzHz12sixWSujRsDcFxfnpdz6cyR57C1TZp4KpVJZ8E1qgOJC81YZ58WnHnXpI9jhOZ1c9/5ManD7foLzAflQp3GszUHivtIwh69sp9+SAH6DjHZCcGqSaZMUwiGkos5pG+oxIyoU87482dCQFKWOBtLAfPgdgQvwPC78lpSct4KWT/1k0lWHRd+kuZO2SCNMMbEXdo9fozXjzg/04w8vfPaqr5pwKfdES2eji6FRCRj52PeU6RIRVCBSG9l9+sEQ8BfPw9mPwJALxmZdrLdtsXu6ggr2lWPhRI2H2WtBCoyPkk5DWTsupIkQMhgyLKHDpKDpeBJTiIy3m6DCqMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/oTkzzQkMQDEW8c6STwFRNckeRpx00U/OqHymbkgmI0=;
 b=rxZbUOT+HOg9LVLPNiUbvxBOOfMRnNdQ2Yx6uRUD57JbkAXI4b7JXV+9FtoJHnVvOYPF3CaMT7sTqNiQxSxjM/AtBpM8/OkMh7olaKEj6nMMqWRwQoUrVsDXUkjh8yXaVWTLjwzDT3ItvoIHrU/SI4AHOLWNMKx40HM04R975ORsDU6qBgHMLQAt1GAWYjsKLQqq3DCif6kHrKJVb6cAQObg9EdlbouyLLoY6YNEAlU8TpwWLufkzkbTVPiTU8MAdIAP3X4s9B3ZaMlHR1CBSwnMrZwmWv3rafdv+gwO8IagMktqewiTohDgthJd7Fcan2jDJtD8LqTCwYweU2pYmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/oTkzzQkMQDEW8c6STwFRNckeRpx00U/OqHymbkgmI0=;
 b=YRpWeyTrzi5FhDyJKL0SSlauA1v5qV8owEgg5AaIqOElHWsv2pyX5MR83slpY6VSWYtIcDro/lUCxOsmTJPLSY3UJvXMkoY1PbTRQmqblZYuIc58exojpbyyJmlgBFn0YT0TJ9XpB23G9K/x4lVFlhHd0sVOm494pCIr+T8E2hyflp2a52baSnb3Sn4pk7/02hMPItCai3twVaMUesHroU9KUsxTi9dCARKnoVIQiJ+9eUMi6Dk+I33XDTFaBjTTXsAySgh3vi6G7sX3rmv84D1s654yUts5oxyvFbH4y1OY4BhewN7hqxwo5K9rmiy0ObCTXCvMi8EdhGj98W7SNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH8PR12MB9840.namprd12.prod.outlook.com (2603:10b6:610:271::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 11:04:53 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 11:04:53 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 11 Sep 2025 20:04:31 +0900
Subject: [PATCH v5 06/12] gpu: nova-core: firmware: add support for common
 firmware header
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-nova_firmware-v5-6-5a8a33bddca1@nvidia.com>
References: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
In-Reply-To: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCPR01CA0175.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH8PR12MB9840:EE_
X-MS-Office365-Filtering-Correlation-Id: b5f41f28-5e44-4d9e-d2cb-08ddf12308ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cjdmN1A3OTNvT3ZpL3NFS3ZNdjMzR1VhR2pMUXQ2Q2NTV0JGc083RW9qVU4w?=
 =?utf-8?B?aFlJajlkT3ZJZU1MSWxGSUk0dzZteHVvR0l4TnkraGM5SHZDd25nRkQyeVdG?=
 =?utf-8?B?RVpUZ25kU0VIVFM1cUJKeFdId1g4Nm9Zakt3QlBhOUtrT2RPcEFCd0paQVZz?=
 =?utf-8?B?MW5Db2plbEJORDNoMHg3TXByM2EzSDNub0NaeVlSbVk5RHZJNW4yVlZRNWl3?=
 =?utf-8?B?Q1lqUzhsdjBzVFpNeG95NzNKZFdEYlNWbWNWKy9GU004YjgvY0V6MkhxK3Rn?=
 =?utf-8?B?RFlJRDB2N09WUGROTUlmTy9rVmNxOVo1NEc4MCt1YlE2UDVweE03VzhjQ3NW?=
 =?utf-8?B?Wml4Um1Bbk1yeEVpYzhBYkd3bGZNRkM0K2RFNVpVSDNXL3lnY2ZOalpFOFlR?=
 =?utf-8?B?SnJabU95KzgvcWhVNEZVbjBVcTV3YlVTdEhNdTlyNDF2SWFYSmJiMGpuZUZQ?=
 =?utf-8?B?RHh1TmJ1bmJSY2xJbkNFYngyaUo2SFB4M1dFOVNUTXJhMk83TWlKV2JoeHRn?=
 =?utf-8?B?enNYa2tOQ2k1M20xZWdVYlZpZGdGa3VTRWdlR1pKc3dPallsR1FWR21tS0do?=
 =?utf-8?B?eGtZRDA0REZQSnZSdUtaTk52QUtISUlnaWdYSGdLcGJZL3FrY3ZHUWxXanpM?=
 =?utf-8?B?V21FS0NSV3F4YWFnd0U3K3R0NStzNjJOQ1l0eWVOMUNXd2pkVitlRjFPR1dS?=
 =?utf-8?B?SSsrUDhJTndPeW1Vb1JleVNWZ3kydG15NkwwNE9UZW9TekkvMTdrdzV6UENP?=
 =?utf-8?B?MVBrNmQyYlFMNGxndmhGVEt2TGt4VVhCUmFFMStHcjdVZzdLb213dWF4MXZh?=
 =?utf-8?B?MlJETUF3U1FOempsQ0ZhdGFDc2hDRkQ5UzVLOG1pcG5McVZ3U0NBVk45dk94?=
 =?utf-8?B?ejZXZDVOZzYxeUxPUzNKTkxCSWlZd0F2U2c3M3MvbzVCbVhVQlJ3dHpyenc2?=
 =?utf-8?B?NTJkVG52SmxHY0xyYUErbHRsZTNGcVBnWmo4bDBidDBCb1ZKNkxwck9GWWN4?=
 =?utf-8?B?WWh1ZzRxQi9qeEh4Q09FcjJMcjFWNFJkZjdzUXpqNCtuMkZUaXdJclcxTmsz?=
 =?utf-8?B?eFJsb081QTh0WGZ6Z0J3QllOOVhVZi9NU3VpOUlIczJIbGpzTkpDNkh2OXJi?=
 =?utf-8?B?TCt5TzdwSE5ZMkZYK3RXRngvejNCTFVZaHAxcFZRZ2lseVZBZjh1YjM4MEhT?=
 =?utf-8?B?MjllNko1MGRFaW5PTVRnWFN2VmxpN09hd1NITWFtMmMvRmFOSXVhQ3V6UEJR?=
 =?utf-8?B?TTJmL1ZJWVVMYklnd0o2RjQ4RnN4aFZkaUJ5YUNISlVwUVhZb215ektxc0F6?=
 =?utf-8?B?MmJIVDBiUmxmZnplOU5NM0ROUi9wRC9rekdjWExiNklucnpaUXBGNGhkZ1I1?=
 =?utf-8?B?c0lVK1EyNXFvN05KUnRnZVZmVStweUZpbXMzNlJXWiswVndYdUEvZzNFZ3px?=
 =?utf-8?B?Qm5tRzA5bHRqVGl2SHVwOWdWRTVXQkR5QUZJQVp2U0ZXVnFhem1WRWNoQkh1?=
 =?utf-8?B?SkwwaTAxY3dXdmtLZ3N2QWtLS1UvcWVGeEZzUms2VmpWd0dJbHJSUXUyc29s?=
 =?utf-8?B?aVJmb1NMMU95NFNWck9ld1RXc280RTczWmZMUldjVFZPa3N6TEcxbi9zOE1o?=
 =?utf-8?B?VVNONG40WW1FaHFseTRPZWlSY2kxbkVRdFBoRGtxK3VOM2VBUnJTeXpkdU5v?=
 =?utf-8?B?VjUwOUFPTFBTR3VoWVBJWkF4NXdUSURHMmhISy9ySTNQU1FYV0RJYXNOeFNy?=
 =?utf-8?B?Z1JEL2dudWk2SDZ2WXJmNTNYZmtOZHM5aWhjZEVqUWdjVnQ5VG9OeWNIZjBz?=
 =?utf-8?B?YmJsait1TEd4MG42SDUzalN6eGtTcHdEWXoxRmQ3NzJLTUJTaUtITDlqREk4?=
 =?utf-8?B?NHZhcEpaaG40SVRvK0NSTThaOXhPOVkxYjVKRGY3dm8wWGh3ei9IZ2lxb2I4?=
 =?utf-8?B?czFKNUtQcjFYVXRwdkxHOHFjZXcyZ1lJYWxlY3dVaTROWjJzTGkyNjg4djdZ?=
 =?utf-8?B?S3o1SnM5bjV3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QW8xT1Z4OVJ2cHlmU1ZuOStuYUN4b3BHZTZRVUxVOU56dG10SGFkL2xsbStK?=
 =?utf-8?B?aTNFbWFJRW15RmFyTFVBRFJPc1gxSlRNTlNRTHlINkxDWjNpdmVsbTJqdFBV?=
 =?utf-8?B?MFRrb3dtRk1GTEZXdlZGWGJnVG03UW54WmdJRGlEZytiTHl6RFFaUXBBMGE0?=
 =?utf-8?B?NzdVcU1VM1hJaTk1T2tFSlBWRmtGdkdDUlJmUFIyRlFTc1Y1MHNDdDByTjl6?=
 =?utf-8?B?S21MMHVoNWlsREd3VFJkR2pHNTlmWC8yRUJHYlFOeTZpd0VnT3Zpc295bGM4?=
 =?utf-8?B?SDJYTGFIcFkySXIvT3ZJeDcrSDVrb2U0T1JkOGZNVlBvcmYzd3JjbVQyTlJz?=
 =?utf-8?B?dUJYNWZEeHBGT2FXM0RMUmVRSGwxaG9HcmtZWmR0M0lwQ0hQSUlwMUcwaW1H?=
 =?utf-8?B?UnFSS0NUSklGaENHNGNiOU9rd1ZBb2NCQmhaM1RSVnY4WlBuVWdNNVprV0ZM?=
 =?utf-8?B?bGpEY2tOQ0s0TVRqSXY4Z1FhZHFBQU9PcHRoSFhROU8rZHlsdjhrVmgzM1l3?=
 =?utf-8?B?cE51M2RJbTJWSnFsYXF0YUY4ZW1jSFNmRUUrcXpKTmNyV29NK1lwd00yTkhv?=
 =?utf-8?B?ZC92ZU1KQnNKM3dTdDc5K1Nzb0xRMTdFM2pxM2hubnhsejFJZ0JRK0hlbVhk?=
 =?utf-8?B?bDR6Qlkxa3NIQ3JWN0pZUjUxN1pQZXFHaTZaME5KSWlmVE02NFQzajlibnNH?=
 =?utf-8?B?K0JVMEl4Tmh1eEVzUGdDYUlpVnloaWtPY0xuUkM5VTVqOW0rQ2RIYmtSdjdl?=
 =?utf-8?B?bm0xVEQ5RithZjAyL1EybC9YNkkxOTh2ZnNhcTZ0c043OFpKaUk3RmZ5cVda?=
 =?utf-8?B?cWFnWmVxRnlIb0k1aFBqcjFtenkwaTZaQUJISFhrMC8yZ3d4aXJmaTRKd3hH?=
 =?utf-8?B?aFhLUU45MWc0bkg1UnhLdTVkcS9Vd2ZqVnRmU0hPUmVtMXRDUm5TL082WE5G?=
 =?utf-8?B?YTdCTkFYYmxwUU1Wek85aGd2Ty9Tc01xckhkZU94RXlDVUNRMUM2L01IVEdx?=
 =?utf-8?B?MVpxVEoyTGpJR3ZuWm42M21GSXQ4cUZ5Z3FPQnMrVDBvQlIrYUxMdzU0Nmla?=
 =?utf-8?B?c3orZlBPV3BQcnAyR0NQUUJwWGFaNmRKSURNbUpBK1RzT3g1RmVrSnFHY1Qv?=
 =?utf-8?B?cC9PWUVFZzlPR3lPdVY4SW1UYlBVS25KdDNUR2w5TzVCTnNzeUFPbkhlVnQx?=
 =?utf-8?B?eWx4ZS9Hby9mcWZCS2FuK2duL1pNditBVmFRNC9CNzJUeHh4UEZXaTg0bDFW?=
 =?utf-8?B?SzExbTMreW01d0FEaVJWSVAzTjVYWUJuQXhkeVMxcEkybzR4eUdOUmowbHRj?=
 =?utf-8?B?VzVENUMyTStEQVVoZGh3b3k3NHZMUFlMRkNDZi8xUGl1S2dZdENJbVFPYSsw?=
 =?utf-8?B?UzFRQlRXQlNoSHVEeUZYRTdFQnNDc1poNFFvZzBqS1ptOVZqWnhVeDB6WGUy?=
 =?utf-8?B?U1EvaklLVURUc2U1dThVUW1IQmtTci9iZ0VnUndqM1cxTEw4SDBkUTgra2Mz?=
 =?utf-8?B?ekx5RHV3anowRHpQbzQwWGh2dFFOTlNsR0Q2bkVjQ1VtR0VCR3JSdHpsaUVO?=
 =?utf-8?B?SzZlZ3oyRFpiT3daYXIzTXhPZ3E3ejc0Z1RjWndpTVpGOGlwa3h0UmVaUU5o?=
 =?utf-8?B?RnpiWm1XRGdlOFhpUEY0dzVicytKYnA1bnRXVS80Mi9qS2h2NE1GazY4Syt1?=
 =?utf-8?B?ZHFETHRVUzJlOC9iWHNUTTVmRFEyNlQwbmlQUWxiZ3VPSmwyTDFTUmlrWGFX?=
 =?utf-8?B?K3JpdTE3ck11ODdJSUJxZU4vNmNrRExmQXlHZWUyOXg3L3FmanZzam1NbTNp?=
 =?utf-8?B?UWw4MDRFQTFodDVOeTJmQmR6UUxXYkdaTlRwTGFBbDkxSElMbFhPZjM4ZHJw?=
 =?utf-8?B?SEFSVkpzNEkzZHV3dnZmZzlKc2NlOHMzRWYyem16cVNndTJzTUNzM29XelI5?=
 =?utf-8?B?UGMvSDZaS0toZFd5UDRNU1FBS2dXQ2czRXhtaE42U1ZDSUNoSUNybDZRcVJp?=
 =?utf-8?B?UUNYMDRwKzVrQTUrQy9Qc2JITWZkNkYwZ00yajN5QS9yZ3JLemM0cERxREU1?=
 =?utf-8?B?K0FDZFl5RGhrQ0tsTUIvdlNUQUwyS2dodGtwWDM0RHMwZWM2WUdtZC9lRTdR?=
 =?utf-8?B?NVZuaWNLQkpONmxFeFJFOWlmUlg4azN2QWV0WjBMeHNPTThuUVArZU1ObmFK?=
 =?utf-8?Q?kGTwgDhbpFqsKepd9y2ig5XbdZRjJBbpWGLKb2Su4PJB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5f41f28-5e44-4d9e-d2cb-08ddf12308ca
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 11:04:53.2580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 64EWhgLf8NSesErQLDku8rXG/ILzSKKZ+r1ab2EM9bcqyW/rIbogRRRgfrnjNafb5X3mbeUARwRHLtj1lAqYdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9840
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

Several firmware files loaded from userspace feature a common header
that describes their payload. Add basic support for it so subsequent
patches can leverage it.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 62 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 4e8654d294a2205ac6f0b05b6da8d959a415ced1..32b685c8757b1106084577c2cc7d5ef6056c1c64 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -4,11 +4,13 @@
 //! to be loaded into a given execution unit.
 
 use core::marker::PhantomData;
+use core::mem::size_of;
 
 use kernel::device;
 use kernel::firmware;
 use kernel::prelude::*;
 use kernel::str::CString;
+use kernel::transmute::FromBytes;
 
 use crate::dma::DmaObject;
 use crate::falcon::FalconFirmware;
@@ -156,6 +158,66 @@ fn no_patch_signature(self) -> FirmwareDmaObject<F, Signed> {
     }
 }
 
+/// Header common to most firmware files.
+#[repr(C)]
+#[derive(Debug, Clone)]
+struct BinHdr {
+    /// Magic number, must be `0x10de`.
+    bin_magic: u32,
+    /// Version of the header.
+    bin_ver: u32,
+    /// Size in bytes of the binary (to be ignored).
+    bin_size: u32,
+    /// Offset of the start of the application-specific header.
+    header_offset: u32,
+    /// Offset of the start of the data payload.
+    data_offset: u32,
+    /// Size in bytes of the data payload.
+    data_size: u32,
+}
+
+// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+unsafe impl FromBytes for BinHdr {}
+
+// A firmware blob starting with a `BinHdr`.
+struct BinFirmware<'a> {
+    hdr: BinHdr,
+    fw: &'a [u8],
+}
+
+#[expect(dead_code)]
+impl<'a> BinFirmware<'a> {
+    /// Interpret `fw` as a firmware image starting with a [`BinHdr`], and returns the
+    /// corresponding [`BinFirmware`] that can be used to extract its payload.
+    fn new(fw: &'a firmware::Firmware) -> Result<Self> {
+        const BIN_MAGIC: u32 = 0x10de;
+        let fw = fw.data();
+
+        fw.get(0..size_of::<BinHdr>())
+            // Extract header.
+            .and_then(BinHdr::from_bytes_copy)
+            // Validate header.
+            .and_then(|hdr| {
+                if hdr.bin_magic == BIN_MAGIC {
+                    Some(hdr)
+                } else {
+                    None
+                }
+            })
+            .map(|hdr| Self { hdr, fw })
+            .ok_or(EINVAL)
+    }
+
+    /// Returns the data payload of the firmware, or `None` if the data range is out of bounds of
+    /// the firmware image.
+    fn data(&self) -> Option<&[u8]> {
+        let fw_start = self.hdr.data_offset as usize;
+        let fw_size = self.hdr.data_size as usize;
+
+        self.fw.get(fw_start..fw_start + fw_size)
+    }
+}
+
 pub(crate) struct ModInfoBuilder<const N: usize>(firmware::ModInfoBuilder<N>);
 
 impl<const N: usize> ModInfoBuilder<N> {

-- 
2.51.0

