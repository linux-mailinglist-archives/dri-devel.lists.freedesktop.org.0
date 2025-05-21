Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0B0ABEC1F
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 08:45:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE9FB10E640;
	Wed, 21 May 2025 06:45:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fg2JWX46";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2064.outbound.protection.outlook.com [40.107.236.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E0110E63A;
 Wed, 21 May 2025 06:45:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xef+xj9FeMRxR+dFBrWNZ8Z2z3vDHeyHQTa+eQcscGTu6jO9DGwDtdVq376v1Ib2PSCLeXRzkYcDylOFFYMFRwfmZv9OoqtYL+XIf6jvLG6JFZWx3cZ4219lUUhfdlYBcNDSyhHFFGznwqHlqrJPcHeBfPIfJNv5YjU0bpBCiXAbucRJl2V0d10On9Hb587EqpGeu3x4dr9Qilr56FWK8YjP2E9qkBwYuOBttPyJI73JZDc23tiZLIz2YV1cEYA1HhEtnCtoRkqflrSNqTnziqk2G22sSSQQa88QGvxbIUryWyh2yG6fuaY+qXTN0AAeLr7zIwW9WGNoKi4xhXJICA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8H0kwlDAptQmtZ9BHhacwUNjx+UaIQggiGabq/Aibkw=;
 b=fDsKSPTVT6XJcihQOnXqvEbC1Fr2BfjdMkX2altf2PCY/0z5B806lX6MqkDSgQn7s+/uw+JC+FRO58x6b28OEoR8cRrmj8wH73ibClDasXCEdHCcKGtftHh3whKvy7P+2aJRmV/4i6fg4nAylxAXQRoV7YCwXJrBUM4Zhe29JNNmZVDdRyvP1rNfkBPw5cJmBzGGqOsvDg8aAGQ0OPbepcSEFregzSn0RF1b+baMUv+g2nnTBRR4D/mqUxeZPRLdC4UC8zM9mgeudWLu/3caEbipZv4RKNXo5dxBXuTZl/IYbiA8TYIXI39KR2P2CLqz9bIk5tV3ZNN6QMcfvdIC8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8H0kwlDAptQmtZ9BHhacwUNjx+UaIQggiGabq/Aibkw=;
 b=fg2JWX46+u4Hw2P+Nes4RdCDQinxBsZ6Q0RLqF4+qf0fdk92hi1OSGaa8VKoI8XbXmMBfEa7wt3g03qJhxN8AmiH9kNLcBIpPrF/ySCIXlxuvNKBSnF+lbpSJywvnZS7EOMkM4u0US20qgK/Q2xt2qxRZkarLfcd+B8kNjzjNSGvDRohRqP0JMgQjudnS+VucXtwlwZ5gWc0dW1M+j6HnoTq9LlEEdqmbVwI+Q2kuugqNijRsFh8LxNaOLCxrHHUDvQw67j8KKz/vl4F2iHBOPdeTrfSRz8xfukTzS99au+qOCyb9iflu1B6TWA+j7H1+h9h2OMflQB24PofiuBv6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6618.namprd12.prod.outlook.com (2603:10b6:208:38d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Wed, 21 May
 2025 06:45:18 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 06:45:18 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 21 May 2025 15:44:59 +0900
Subject: [PATCH v4 04/20] rust: add new `num` module with useful integer
 operations
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-nova-frts-v4-4-05dfd4f39479@nvidia.com>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
In-Reply-To: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYWPR01CA0045.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: eb2f3866-c847-4fa4-8ec0-08dd98330c69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Znhpc3NtdFM4Q2tycGR0M2xiZGcyaEY4SU1lVkpJMElqVm1UTDBXVkphN041?=
 =?utf-8?B?bnFSZVhLTHdFMU1aUDhEekhQcnBNNXJLczFtdWsxeFRLQTNacnhnU1g3Y1c5?=
 =?utf-8?B?WUJYWDFaSURWSnFod29rUzBwTS96eCtlMStxemNiMDIxS2Vza0RMNERQY0Yv?=
 =?utf-8?B?Y2k2WlYxdlM1d0NvQkFLWnBFUlNla3VxamF5V2UrcjBQQ2hVbjBJMUJQMnU0?=
 =?utf-8?B?dDY3YThiWStrVWpSSUxtVlZSemJhODI2czhaTDFNMHBRRjh0eno0V1NCTDBw?=
 =?utf-8?B?V0ltNWkxV1kxV2toK0VnMVhRMEtqQ28yY1NXcVhLVUlqYWJ5UFRHenR3bUNL?=
 =?utf-8?B?RUJiTWRKRXlmNWZKRVUzTi9EdW1pN3JIajZjd0lJaFZwQ1hMWUptL3ZsMTFn?=
 =?utf-8?B?Qy9KUy9TNkRlWnBySHdGQllIcW8wUHhMSG9HREw0NzdNcDYvQ3ZJa3lvWW5T?=
 =?utf-8?B?aEN3TUdtZEFQTTU0d1c5NFViWmFzZUdLVXJKNVcvMFp1OW0zUmszeVNjckZq?=
 =?utf-8?B?NHZsNUdFS2tZanFVRWVEWEhuQnFHcnd0UVorTnAwSytqVkFueW0wMEtDaDlJ?=
 =?utf-8?B?Rm9DdytvZWdOQS85ZFl0dEQySlpjSTNYNFR4eVFqVklSNVhkTXZHT3cweE5y?=
 =?utf-8?B?STl1ZVVzSFhyUUFmSktNNXZRc2VucDhLa3FsWG4xRy9hdVZGbE9ra3hNWVRh?=
 =?utf-8?B?dWIyVjRwN2Fkb0M3NnZNM2RkWFFxUG4xNkdaWk04WDNSWXlMR3d0Zko2dzZX?=
 =?utf-8?B?S1BxTnVlcEs3Tk4xcHpiVzZRcnBneWtoVE03YUgxMkVFWStSbG10dmh2cjVM?=
 =?utf-8?B?djhLYVVrWnJ6blo2V2gxVzFCeVJCSFNwOTF4REVrNWxTb3RwTDJYMjFvZFpo?=
 =?utf-8?B?SFdOTXcxcHg1bnhxd3BISURQVmI3U3NpcndXdERPOFVXTVNHVWQ5czJuTWwy?=
 =?utf-8?B?UVB2RFhhOHZQMEZZVERXVmcvRzNub2JCUkFFbUN1NFd0bmtJNFJnNmI1SFg2?=
 =?utf-8?B?ZitRTE5ycHQ1c2VEZFN4ZGdycno4ckZMaGk4bS9WT1RnT1lxK3R1a005TC9a?=
 =?utf-8?B?TllONGNuRFdnYlRSWUZvcEJENEVvQWNVTlBjYzFTL0tEdlZZelIvSTM2cnI4?=
 =?utf-8?B?ZUFBbHZGaFRXUk9wTXljdkcxMFEyc0VORitUY3d4NXFZcy92dmpuc2JsTENX?=
 =?utf-8?B?blZQcXd2TFUwdjdZTVV6OHJKYW9GSkh3eWpqSHVnb3lqYmU1c0EwbnBSemRE?=
 =?utf-8?B?TDZhZ3FpeGRqeWlOa0FCSWNiNmVGc1RlUldXakpuRGdFWml3SmRBMWhhbWdX?=
 =?utf-8?B?Z3lJLzhHM2ZvNldNaHU4VUtSQVBRQU9FUGtJSnAvYjNGeDNaWWJlY3hrMjkw?=
 =?utf-8?B?OEYxeGlNb3VGd1ZCQ1FuKzNQYkZDbHBEeGFHazlveUNJR2tsc3hEdko1KzRq?=
 =?utf-8?B?aFVOS1YwOXFVYldKRVp6UEYxNEZXd0VvSndaenhFRnFlcjkwR1VrekxUZ1Av?=
 =?utf-8?B?TVpzNk13eVNiQi9mUm9sdXJhNE9ueHpjc2NrbVB0UzMvb2hnRGd2WjhpeHYr?=
 =?utf-8?B?M1poMkhvSkRHN1hjMTFMYk1kYlFzMVlCVE0wQWNvWWovbk11MXhmR2NaZm9u?=
 =?utf-8?B?SkJVQTdIN1MrMXJSckFiUFZ1SUs4cWhmeXVhUHY4YU93TDh6aEVuVWJiOHN1?=
 =?utf-8?B?amNhRTFRTkhCSXhMNXdQTXV0NDljM3RGRzl4Z0paZGk1UWx0cFJ0ZjFnRksr?=
 =?utf-8?B?L3EyQUxmeklaN3dTa2NJd3QrcE5GTUdSMExiRWhWbzVpRTY4amZqUjdlbTVk?=
 =?utf-8?B?V1cyQlJKUGhvdVFWdDVuSGRYc1FWNG00aGFBT1dtc0Mwck9DNTl3NzA4UDlF?=
 =?utf-8?B?RDkzTXU4ODlkOFJSZWpobXZCY3RFQVdHTXV2TkhaYkQrTG9iRW91VEp2TDVq?=
 =?utf-8?B?dG80UWRBc2JUOHdNZGozOHh4VERibGlKa3RhQ2RnT0pIbDhTVlFPakptTkpM?=
 =?utf-8?B?MnJDZytQV0xBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVhzUVpQOVRzSW5WdEFZcEJpTVc5b2xvSjdrbHRpaTh0WlpZSWZJeWZ6Nkdx?=
 =?utf-8?B?L3B0YlZaeE8rb0RkcC9FMzBuSExRNDRGNFB3OEovOUp3WnVEQXpudWlPem9Q?=
 =?utf-8?B?TjFVbTRMTVplU1doajVLblJoeks2WHEvRy9vWU5nMStMbThESDFoSGdWTTB6?=
 =?utf-8?B?TnREMnZzSlhaTFI5bHBrMk9rUndwbHRzRExYTTdQT2VXTDJDVkN5aGN0VTNn?=
 =?utf-8?B?SFRabVVLWk9VaHVjYlZoNWpzVDM4Uy9qa0VGaW42WVZlQUFYUWZPNVgzbVlD?=
 =?utf-8?B?TWRZbHlqWVFXUXlldUVaTDJZREF2Q1ovYXp3N1VTa0F5VlRqK0tHL0I1RExZ?=
 =?utf-8?B?MFBsSHQvMUY5YlIreExMOGVHZkh4b3NBSUFnb2MxU2RKODM3THY2MnVEYWpw?=
 =?utf-8?B?QkxkSElLeExldVJBWHU4RHA0ZmhJUzY5TFd1TFRWNUMvTkFCb1lGSWp4RHEw?=
 =?utf-8?B?dGY3Z1RqUVFmVWc2UWtRVGp1aC9zR3FROVN5blFIcFNDbW9qNkdhelkzRkJL?=
 =?utf-8?B?Yy9HK1ZmUFBBdkZFc1RwTzdJMHAwMW15QVZ6Vk9ERlh5L1E3eFNSTGRQYzlh?=
 =?utf-8?B?bVU0Y0I4dmVWelMzeVJhR0FVcjRFVExRbFE4QWViYVltN0JENU4zcTBIRVRs?=
 =?utf-8?B?SlBlckRGWVp2a294Q3ZSMTF1aUlQb3lrOS9lWFJXbUREcUdwaXErRnlBYjVp?=
 =?utf-8?B?OSsydDVzM0orUUYvNVBmQXd4Nlo0SWRVY2Z3dUVnUmcwRDBXMTkrRHl1RHFR?=
 =?utf-8?B?bHlvb1F4aEhWOHhJOFE4SXNKRmcvblV3RzIzQTRMalJqdmlta3lKYzVRNi9E?=
 =?utf-8?B?cW9SMjF0TVRPUFlwVmtBWHVGNjJoZW1wbkttdFh0RVZsQ3V5RDlOZTRSZUF4?=
 =?utf-8?B?RjdHU0o4RzV1TDFibnJFTkNzZ1VsZzAwN1VFNnVKZExIZ0VmZWdBbXdoZVor?=
 =?utf-8?B?SWkyNDN5am9DZmljOFBCSmR2dWR2eUR4S3d0Yk9ha2JXRmlpeEZwM3JLRy9H?=
 =?utf-8?B?TkVsM3hDTCtEUTZERVBKOHU3Zlc2N3lad0tLd01nMDBqT0xsM3BNV2xPaTB3?=
 =?utf-8?B?KzVtNVQ3V2dWWnZWU3c4MHNCc2NvUWp0aEJTVHlHM3o0TUlzNDJScDR2Mytp?=
 =?utf-8?B?cFQvbS9FL2xmelU5bWdRRTB5NzRBTm5sbzlDZFJDaDZ3M01RQ05kTk1lYmVz?=
 =?utf-8?B?dllQR3pGRHQvekRHcHJpRlMxN2lHK2VJTU5rV1RHN1FUSjhXck5OQ0tleW84?=
 =?utf-8?B?UXJmeGdNejU2blZaeGIzVW1uTExmNlp4M25tZmRBWVdEeGYxdHh1WFVUVVdL?=
 =?utf-8?B?QklyTmFrV09yOUU4elpIbmRzUHZSWDdmVWRVNGdaeTVXd2ZrajJUQUhqOTd6?=
 =?utf-8?B?NWZkSEpMT01iU25MUEpGZUZ3QTNSNmdpWkY3d3NzdXpTalFhempGcHAzT3ll?=
 =?utf-8?B?SFc4R3NUMTdkWkQreGs1djMwOWU3bmtwQmNLMXBxcklCcHlFeHFzc0RSclE2?=
 =?utf-8?B?REVzTzBhNFJtY3Q2b0tKak9TMzBUSk80dVY1UGV3ODhySndrbUpQQVBoa25q?=
 =?utf-8?B?RGsySHdIeW1hTWZwTUl1RjFwOEhTMEpNV0JyRTFBTUY1SGViUFdVaGlxaHRD?=
 =?utf-8?B?TWVQcWMzUUFRbjY1cXdqOVQ0S1FoOWZnRWU1dEFqTVkxT01rcFltanJacGxK?=
 =?utf-8?B?Y0FFcUpVd2tEQU9yS1MzSnk1ZEQ5dEhldkZ6RmJPck14ajlZdkQ5NjE5alp0?=
 =?utf-8?B?YTRRSlZ5aFA0R3EvbThkMUtsRTBaV0Q2bW1Rd0lMaFRIWnh2cUJhSXVLaktP?=
 =?utf-8?B?MWRNeWhGYkZkMWJra0RRditiRVNPVHY4UVYyZFpmVWljT2QvUW82THdVdHNq?=
 =?utf-8?B?bXB5SW4rQzVtSm5sdjV5OUJUOTU2a3ZaOGFLR29MTml2UnBCMFdwaDZmN0E1?=
 =?utf-8?B?eWpVdWpXVjlQMlVKUnV6MVE5TDVMdXBjSTNzc3p5VGNWdURSd2VEc0V2RkJ6?=
 =?utf-8?B?UjRHM2tzdmtaR3dUUURlbnYvcWI5NnVTcHNRdkZ4dzVmT0d4cFAzcE1ZeGdt?=
 =?utf-8?B?bWxTQlJqUFc3Q0szL3JwU2hiOWFUdGtkNUxYS3Bob1VQQW9HYU9nZDlaeUc5?=
 =?utf-8?B?TXU3eVVlTVdONENyZm1TNmNySG1RMTFFTkZVdHJ3SldwbXhMaXFScGJDUHAr?=
 =?utf-8?Q?iw5HzSONGyEhJ9v5aqxgmY9eyvG4HLi6zdmuoa8NvrH1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb2f3866-c847-4fa4-8ec0-08dd98330c69
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 06:45:17.9390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SQl4dwrdskJ0UA8iKAKX1CBRuBg5P7sry08n5rjV+J/kOb9xhHByL/UZTcIoJaa0xJeqeTzSgN8MS2YlyxzETw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6618
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

Introduce the `num` module, featuring the `NumExt` extension trait
that expands unsigned integers with useful operations for the kernel.

These are to be used by the nova-core driver, but they are so ubiquitous
that other drivers should be able to take advantage of them as well.

The currently implemented operations are:

- align_down()
- align_up()
- fls()

But this trait is expected to be expanded further.

`NumExt` is on unsigned types using a macro. An approach using another
trait constrained by the operator traits that we need (`Add`, `Sub`,
etc) was also considered, but had to be dropped as we need to use
wrapping operations, which are not provided by any trait.

Co-developed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/lib.rs |  1 +
 rust/kernel/num.rs | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 83 insertions(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index ab0286857061d2de1be0279cbd2cd3490e5a48c3..be75b196aa7a29cf3eed7c902ed8fb98689bbb50 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -67,6 +67,7 @@
 pub mod miscdevice;
 #[cfg(CONFIG_NET)]
 pub mod net;
+pub mod num;
 pub mod of;
 pub mod page;
 #[cfg(CONFIG_PCI)]
diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
new file mode 100644
index 0000000000000000000000000000000000000000..05d45b59313d830876c1a7b452827689a6dd5400
--- /dev/null
+++ b/rust/kernel/num.rs
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Numerical and binary utilities for primitive types.
+
+/// Extension trait providing useful methods for the kernel on integers.
+pub trait NumExt {
+    /// Align `self` down to `alignment`.
+    ///
+    /// `alignment` must be a power of 2 for accurate results.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::num::NumExt;
+    ///
+    /// assert_eq!(0x4fffu32.align_down(0x1000), 0x4000);
+    /// assert_eq!(0x4fffu32.align_down(0x0), 0x0);
+    /// ```
+    fn align_down(self, alignment: Self) -> Self;
+
+    /// Align `self` up to `alignment`.
+    ///
+    /// `alignment` must be a power of 2 for accurate results.
+    ///
+    /// Wraps around to `0` if the requested alignment pushes the result above the type's limits.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::num::NumExt;
+    ///
+    /// assert_eq!(0x4fffu32.align_up(0x1000), 0x5000);
+    /// assert_eq!(0x4000u32.align_up(0x1000), 0x4000);
+    /// assert_eq!(0x0u32.align_up(0x1000), 0x0);
+    /// assert_eq!(0xffffu16.align_up(0x100), 0x0);
+    /// assert_eq!(0x4fffu32.align_up(0x0), 0x0);
+    /// ```
+    fn align_up(self, alignment: Self) -> Self;
+
+    /// Find Last Set Bit: return the 1-based index of the last (i.e. most significant) set bit in
+    /// `self`.
+    ///
+    /// Equivalent to the C `fls` function.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::num::NumExt;
+    ///
+    /// assert_eq!(0x0u32.fls(), 0);
+    /// assert_eq!(0x1u32.fls(), 1);
+    /// assert_eq!(0x10u32.fls(), 5);
+    /// assert_eq!(0xffffu32.fls(), 16);
+    /// assert_eq!(0x8000_0000u32.fls(), 32);
+    /// ```
+    fn fls(self) -> u32;
+}
+
+macro_rules! numext_impl {
+    ($($t:ty),+) => {
+        $(
+            impl NumExt for $t {
+                #[inline]
+                fn align_down(self, alignment: Self) -> Self {
+                    self & !alignment.wrapping_sub(1)
+                }
+
+                #[inline]
+                fn align_up(self, alignment: Self) -> Self {
+                    self.wrapping_add(alignment.wrapping_sub(1)).align_down(alignment)
+                }
+
+                #[inline]
+                fn fls(self) -> u32 {
+                    Self::BITS - self.leading_zeros()
+                }
+            }
+        )+
+    };
+}
+
+numext_impl!(usize, u8, u16, u32, u64, u128);

-- 
2.49.0

