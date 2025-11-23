Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C182C7DB95
	for <lists+dri-devel@lfdr.de>; Sun, 23 Nov 2025 06:13:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD1C10E105;
	Sun, 23 Nov 2025 05:13:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ntUmNH7V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011045.outbound.protection.outlook.com [40.107.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9453610E0D8;
 Sun, 23 Nov 2025 05:13:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aqykhsLj0UCY4yN3wp//a60R4ZX8GGa3HDa+87dicwOqTFDMUB+YsWoYkaFoQPyyMB2JTosgXq2Kd5KNtfVDc865FbGnQ9VjamPIK0zXn/OQGQeAU+O+6yhpLGatY1jGMRlrjjwNBYiQmHmrG5Js4WQd9Agd8wQMFhbMN0WYjrlYiraUOIhR5/1AWKKzLfl8ALYB/6P3b19fkskpVx7tn5TQ6P9vLX2/87hYR1LYRFxfudcfh+HgH6tkKuLXRP7guaM5Wli4yIN1JaBkMXMDN0rnaMD0aNdhLLWA3DoPOYOTRamfnSof6PYdeox7nIpN+aN7NpNAQ/Q464kwXJ+fFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JvlcMqrJv6TKpicCmzT6/F7B7otdjCBphDj3cYbqY+A=;
 b=OEf5sIpTVbN7bTMeysAAZ+dcuQoW0KwL5rs4HI2Ik/MAnLoeeLsv0AI8HPEouD9hAPo2n9k2MbyF4cOM6pA1RxZsXq74nc7i7UkTOtR0jC+zSd7cR8iCs2CU5tJzwVRzMW3pdOKKYvC9ouyFFvmTNn+7EhO4Ni0P8tigdVhWex83luQ5LlkXH1XephvheiIGF1zumRTAG/XwhlDeHkSCSBHDfWTzlkJfOzOr3S0MSRjKtqf0dP7zF7VwjoyDCnpiLjg/knm6kzHBTf49OnIER5yeO8ePOXrcTqOc+/+aM/fr2aCGrgkyNWOi/Q9rkPEOc3hZmuZ3aIZXm2LlxFao7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JvlcMqrJv6TKpicCmzT6/F7B7otdjCBphDj3cYbqY+A=;
 b=ntUmNH7VSJr8uDCricyvtJz5PIQDsLCENkwKrf67Ign+uRMop3jY0k0Oc99reTN7IgVrKwRvRJi74zLwkaHttXG+dLWguCvyIeBId1Mh638YHGFaq8cCN0KsDe8zeu8Hh2OKiwO3j53upViScsZryWvkZJshYSfT3p2OZhWfZuOegRYT/qjysqrH2uSVxXvpbkdYMAPNNwNbmwe8ZOSXqZ5zMrq22DVlVoP0ag76pOoNTrkWd9xVzFlA+3xeyTEX4pStODKYyJ///mmw0rYCLBazxBhITZjAAOnopTZ57wBbf6Kr82WdgQNq/mV7YZdhgle/ElPtrS7rpfqlHiO4qw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6162.namprd12.prod.outlook.com (2603:10b6:208:3ea::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Sun, 23 Nov
 2025 05:12:31 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.009; Sun, 23 Nov 2025
 05:12:31 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 23 Nov 2025 14:12:17 +0900
Subject: [PATCH v2 3/4] gpu: nova-core: bindings: Derive `MaybeZeroable`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251123-nova-fixes-v2-3-33d86092cf6a@nvidia.com>
References: <20251123-nova-fixes-v2-0-33d86092cf6a@nvidia.com>
In-Reply-To: <20251123-nova-fixes-v2-0-33d86092cf6a@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0116.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6162:EE_
X-MS-Office365-Filtering-Correlation-Id: b65bda3c-1e78-4d77-dea0-08de2a4ee78a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dEFFL3dKNTJUbVFEWTQ2bXVjcUw4YWE1ZmNNUDIxL25WWkRxRmVJMjZXZXJC?=
 =?utf-8?B?L2c5b2s1UU1Kbk1KUnEvQkVLZE45VFJZaTQxWnh5ZzFzL091bURzVGU0dmlT?=
 =?utf-8?B?dUdzUXU4U0dZRnl2d2tMSWxndFd2cFhDeklzK2hIeDJpdGNtNWY1dEVma3VI?=
 =?utf-8?B?VDgrdUZCRjVCYlJvRGNJODErM3NVZ1d5cUxzNitSVVAwMzBKKy8yc0xJLytL?=
 =?utf-8?B?eEFtZ0xkc3lDV2JXdTdva1U5ZDk0aVNXRlF3U2pFaHpzN1hLcGxkOXRvNVd1?=
 =?utf-8?B?Y2hJWmdObzFoQ3R2cHZITlczNW9qbkdMQlhCSUd5WGw5azczK1hNMGdFaTgr?=
 =?utf-8?B?azZnRFZlNE1vNzE3TlJybjJGMlh3eVhrSk02eHE5QUl5WCt2TlVOK2FNMUFB?=
 =?utf-8?B?YVgyYlJYMHdpWHI3ZFM5eUgzbHEyMW1qU21RbVc3dTdjSGNOYTNKVVk5eHov?=
 =?utf-8?B?TmJJby82NjgybExBZ082UWJsTkdwZE5ILzN3SDFrYndmeWJJQ3hBN1dGT2ox?=
 =?utf-8?B?NVVFMnh5UzJmdjFFQ2NqMWk2ZExrRjRNZGdIWmpzV3dDd1gvZ1BPdjBTRjhM?=
 =?utf-8?B?S0ltRStSN2tzTDlKeit0OU9BUzRUZ053MG1DWnBKSVB4UENWT0tmMDB4WExP?=
 =?utf-8?B?U0wzdE9DeFNrdW5ST3RYVkVxaFFqdUdOQ3l2eEd5UTkvNmJoUTNONmdYTzM4?=
 =?utf-8?B?OWJHRE50YjFXOFo5N1ZDTDVQVERhelQ2WjY3S1gzS09iV0dtT2lvcnE5NWg1?=
 =?utf-8?B?dmREeTI3a1BlOUNBUGYreDdma3FYdVJ1dFp5TUUvc1V5RlJOL1lmd0VXQTR1?=
 =?utf-8?B?YklRQVNlb0FKRk5JMXBCZlhSUFpoK1BSRUJuMjk2SThpTjZkZXN5UGtJMURj?=
 =?utf-8?B?VnMxZW93MWFrVDFwUFNmUVVsQ2xQR09iTlFlZW1sRWFQMFhrUjhVc2N2UUdy?=
 =?utf-8?B?djhRd01sSloxTXdEVit2Yk42L0E3NVRlT0c3TWEzRnM0WkhTdyt0M0g2b2xq?=
 =?utf-8?B?ci9hWEhyUkxwNlZjM0FvMnZ1eDUxSC9UVC9ZUHhqVVcyVWlVbGprMm85OUpL?=
 =?utf-8?B?ZDNxdVJiOVFMU0ZSMmhKU3N5OGZsVVpjMm0xSTkydU9nYnZ2VGplOVRrbWk4?=
 =?utf-8?B?MlJIY3ZVKzczYTUwSmFPR0NxZG9FZmc4R0NLMXhmRUFPVUc4cUt4NTFzYTVn?=
 =?utf-8?B?UUtWMDRrd2hVR1FDWFA5VUorYkNHbjNsaXJ4TlJXK2ZwTG1ZQnB2d2tJNXB5?=
 =?utf-8?B?TzJBWkx5amsxUG8rdktLWmFUNThLaHhOb0F4cmwwKzhwcVBUTFcrYjlZelV4?=
 =?utf-8?B?RmdlTzJIVTBWVVY4M3gvL0YreGxPVk9ETDFDazJmOFVobGxYb0tCU3o0cTA1?=
 =?utf-8?B?eWVSTk8wdmYzUTJsYXBuM2JucEpSZUc3UWRSdTczdlBJclkxby9pMUFlTFJl?=
 =?utf-8?B?eWdyYUFFWVUzVjZaNjBHWEhJbEhXL044WXVaVHZ4SWk2MXNDQlB0OVdFaGtL?=
 =?utf-8?B?RVBlUTZMQ21YNHdzQVBwK0prRGx4UFg1VDM3eGpURG40c3pyZFVRZmtKcHpB?=
 =?utf-8?B?MkZZYkpFckxjL1l1VGZ0NWdOT0dabXpKSzJ4V1ZGbnA3NjNDcTVDVEpSS1Qv?=
 =?utf-8?B?SWRnQVl6U1FNK3E4d0VoekpuVEcxZkJtMzVIOGFEZmtzWkZOYjE5YmZKbGEz?=
 =?utf-8?B?eGV1MGFBVm5iSk1UZXdtY24vb1hKcUdtcEpUdWFJWGF0aUo2NC8yWmFLT0RU?=
 =?utf-8?B?T3JGZjc0MHF2cWFPNFl6SmtTRXdCVDZ2MitLRzE0NnhBdFl2WmdBTnB6VFUr?=
 =?utf-8?B?WTFpaEJaQmVHUC82K1RWcXdHZ1pUMUVSTXMzVm0wMkJib3MyR0VTVHhiTldm?=
 =?utf-8?B?YUR1Tm5NdVpPY0s2TXo2dEFtZWpnaVBUZ28rYlJMaTlJSHNEbllZQ0MxRTh0?=
 =?utf-8?B?dlhQdHFkNzlkV1IvMEtwMlFldExoN3ZXTm9nQzBzZEg3OVFnWVVxVEhNV0VB?=
 =?utf-8?Q?ntsBxSQeZwjpaaAd4p0BpJvZ/RiiH8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NG5tZ1RYRmhuQURMNXkvWHNhVzZ0Q0Y1cXN0L1lwUjZXeC9QVjhaMWZJUkF0?=
 =?utf-8?B?Sm51THRsdDdueGJqQWZUeDd2NlBuazRXV3VFcXVwMlNlSnhuQkFiajdqRGJB?=
 =?utf-8?B?bk1zcEt6YWVPWFBpRmI3WVNpMXFDN1Nvb2t5MTlrb0dDKzhTK0JZS1lnSFI4?=
 =?utf-8?B?SjdzUVBoRG9lM1VkYUVMV1hmYmF5VWQrOFZtSkw5ZEhpbXBNWWdOQ2hlSWpt?=
 =?utf-8?B?YWJwNGpxaWs1SlNraENNdW0vMFR0Sm1ISzVETUtXd3ZDK0F5b2VBd1dqcnNq?=
 =?utf-8?B?ekh2dk1JV2JLYTI2ZmUvam1KTDFqVisxdXRYMkRVT2lFdHp3UU9lLzFGWVo5?=
 =?utf-8?B?OHFxRS9WSFByMUlQZnBKL2JIdUlqOGcrOUFYemUwT0UzTFJ4Q0d3OWMzN3dy?=
 =?utf-8?B?MlNjOE9yemV0a0ZrN2Y0YmxwcTQ4Q2hyTlhpYTQyNDZxZnptMEFJbUxoTGlK?=
 =?utf-8?B?aWJDOHpXZ3d2aEhlWVV5NXZKbFJzSzYwdVdEL1FJOUZib0doOFZTUitNaTNa?=
 =?utf-8?B?emlScENRUVViU0N2Z01FSS9rY2lYakVZQWFsWGtORHR0ZTRFUUVaSFVQMngr?=
 =?utf-8?B?TEZSYlVrRUJCUFFCKzlFcm9ya2EvSTBxQ09tWmZBZ08xbkl6S0RVMWtVMGZt?=
 =?utf-8?B?UExnNE9Ua2FJbEJjQU1IaTk4YnE5Y09sNjZsNHdycXdNcGJTV1RoVkZmZG5D?=
 =?utf-8?B?aUUwd0ZXSHBBbjV5RVlHdXA0NCtVMytidFp5a044QkpVYlFERnBOd1laM1lR?=
 =?utf-8?B?d1FKN1NsTTNOZkRPOHhmTDBkZjE0MUVVOWRPdFQ5SmRoMkx1WTlqQlZoSlZw?=
 =?utf-8?B?YUdiZjBDcDk0dHlQcVVSeWhhRHg3ZUx4Sk9PamoxdTBZR2xZVHAzK0RVY1lG?=
 =?utf-8?B?bS8yMU8rUkc2QWU2WG5jUlZiK0I0a0VvZTdvY282VjVsVTI0dlRQM1lxY3c2?=
 =?utf-8?B?TVFHWHp2dU04N0Mway9wS0V0dU5RVDhTQXhaNXVRVDdaNktRWTdyNXI3S1pH?=
 =?utf-8?B?SkdZWFY4M1BvSndqS0NwTHJaT3NCWUp3TWlMbmwwUitUTHhWeXFFS3V1NTMy?=
 =?utf-8?B?Rmp1Y2JFaHNwWVQ3b1JhaVY0M0hIbFk2MFlhZ0dFZVRab0hHeXpKNys0Q25J?=
 =?utf-8?B?RFZsYnF4MDhuVUF5VW9raGtWbmw0TWhVSTdmdUVxWlJPeWtjT1l6UmhWSTBU?=
 =?utf-8?B?SXFCenViT0lmdUk0TGFtYUpSd0xoOFVFK1RIOHRUSThvaytQY3pRM0RpT2NC?=
 =?utf-8?B?SDVYUDZIaWhOZEhJNG9wWjh4bFRGNXVnTlptVDMxSjU3QzBRajZlOTNBSnNn?=
 =?utf-8?B?QkR3U1RZRmRKc2tIQnJJNTAyMEZSVXo4RER5Y0M5Y2VYZ3dNVXlMS0NzbmNE?=
 =?utf-8?B?VURiVlA1OHBYYXNFZXltMEY5WEQzVjBQVnlFdURBY3B0eVJEZGFVcTNmakNY?=
 =?utf-8?B?OU8xSXZ1VXdOZ05NY1N5dFplTlNnRU9PSnpUa0p0VnZ3SkZxYUVqRGgzeVpO?=
 =?utf-8?B?TXMzS3V0cnRmZEVvUXp2Tk51anlEVUN1OFVGcnNCVW9ha0dRSzliZHp3RWRw?=
 =?utf-8?B?Q3F0NTJCRCtHZlRGSTNWT3BVRThGNGVKTXZGVWJtMVkrQ3NFYUIxemFmVjJq?=
 =?utf-8?B?WHF3MURsZHg1S0pkZHpPS3ZwZTR3YTM5c1Z3eFdoYitpTll6Q2RLZWxwNFhn?=
 =?utf-8?B?eG9EZEpRSzRlc3dpcnVlUmx2a2dtcFg0clVYUzFIUTFqWVh3ZVQzWHJaV3Bp?=
 =?utf-8?B?bWxZb3p2WUgyKzhCWExvUmoyK2xTZ2NoTlJmOVIzM1NvOHk2LzBHdEdtQmFn?=
 =?utf-8?B?ek1jUldwR1dpR0lWOHpURzVsY0ZCNysvbUVDUmV3YWNXSW5zOWUzWXY1c0ZD?=
 =?utf-8?B?OUUrQWhhTWdZOFNibEc3c2xUZktRclg2QkJBYllyL2crT0tRV2JoSXVvR0E3?=
 =?utf-8?B?MnhLV3ptNUJVMHJXa0xuSWtianM3Q2JWMTcyTVAya2FuZU8xd0lpVUYwa0Ex?=
 =?utf-8?B?UURxNUxJLzdiYWtPRytPYzJWd1VDVTR6RWVRYVllR043bTRxcTFtZGlQSXN4?=
 =?utf-8?B?S3R5SmIzajVyejJGYXRxRUozR1dPTUFVa2lHZ1hnb0RmQ2k4WjFOZHZGTDdj?=
 =?utf-8?B?TS9HcFNhOTZ0Y1FMLzc1VTdTSDRhVmJtVDhZSGhQWWVVNUhBSFowNm84V2F2?=
 =?utf-8?Q?WrKH5PIo5jlSAbmWzk/+93wgW2J0cOB/Dw9dqTO4EpcG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b65bda3c-1e78-4d77-dea0-08de2a4ee78a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2025 05:12:31.5650 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IHIti/xXv2VffxBBNlYM4VwVAZ7OXiJHSqJAcRO6n7l/d/g2JeyJd+R/rxNk2KdJMBfdZwr3XN7agR5Cg9mX0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6162
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

Commit 4846300ba8f9 ("rust: derive `Zeroable` for all structs & unions
generated by bindgen where possible") automatically derives
`MaybeZeroable` for all bindings. This is better than selectively
deriving `Zeroable` as it ensures all types that can implement
`Zeroable` do.

Regenerate the nova-core bindings so they benefit from this, and remove
a now unneeded implementation of `Zeroable`.

Fixes: 75f6b1de8133 ("gpu: nova-core: gsp: Add GSP command queue bindings and handling")
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs                   |  7 --
 drivers/gpu/nova-core/gsp/fw/r570_144.rs          | 11 ++-
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 93 ++++++++++++-----------
 3 files changed, 54 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 7fcba5afb0a3..252755dbb73c 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -797,13 +797,6 @@ fn init(cmd_size: usize, function: MsgFunction) -> impl Init<Self, Error> {
     }
 }
 
-// SAFETY: We can't derive the Zeroable trait for this binding because the
-// procedural macro doesn't support the syntax used by bindgen to create the
-// __IncompleteArrayField types. So instead we implement it here, which is safe
-// because these are explicitly padded structures only containing types for
-// which any bit pattern, including all zeros, is valid.
-unsafe impl Zeroable for bindings::rpc_message_header_v {}
-
 /// GSP Message Element.
 ///
 /// This is essentially a message header expected to be followed by the message data.
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144.rs b/drivers/gpu/nova-core/gsp/fw/r570_144.rs
index 048234d1a9d1..e99d315ae74c 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144.rs
@@ -24,8 +24,11 @@
     unreachable_pub,
     unsafe_op_in_unsafe_fn
 )]
-use kernel::{
-    ffi,
-    prelude::Zeroable, //
-};
+use kernel::ffi;
+use pin_init::MaybeZeroable;
+
 include!("r570_144/bindings.rs");
+
+// SAFETY: This type has a size of zero, so its inclusion into another type should not affect their
+// ability to implement `Zeroable`.
+unsafe impl<T> kernel::prelude::Zeroable for __IncompleteArrayField<T> {}
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 5f0569dcc4a0..6d25fe0bffa9 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -320,7 +320,7 @@ fn fmt(&self, fmt: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
 pub const NV_VGPU_MSG_EVENT_NUM_EVENTS: _bindgen_ty_3 = 4131;
 pub type _bindgen_ty_3 = ffi::c_uint;
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct NV0080_CTRL_GPU_GET_SRIOV_CAPS_PARAMS {
     pub totalVFs: u32_,
     pub firstVfOffset: u32_,
@@ -344,7 +344,7 @@ pub struct NV0080_CTRL_GPU_GET_SRIOV_CAPS_PARAMS {
     pub __bindgen_padding_1: [u8; 7usize],
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct NV2080_CTRL_BIOS_GET_SKU_INFO_PARAMS {
     pub BoardID: u32_,
     pub chipSKU: [ffi::c_char; 9usize],
@@ -360,7 +360,7 @@ pub struct NV2080_CTRL_BIOS_GET_SKU_INFO_PARAMS {
 }
 pub type NV2080_CTRL_CMD_FB_GET_FB_REGION_SURFACE_MEM_TYPE_FLAG = [u8_; 17usize];
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO {
     pub base: u64_,
     pub limit: u64_,
@@ -372,14 +372,14 @@ pub struct NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO {
     pub blackList: NV2080_CTRL_CMD_FB_GET_FB_REGION_SURFACE_MEM_TYPE_FLAG,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS {
     pub numFBRegions: u32_,
     pub __bindgen_padding_0: [u8; 4usize],
     pub fbRegion: [NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO; 16usize],
 }
 #[repr(C)]
-#[derive(Debug, Copy, Clone)]
+#[derive(Debug, Copy, Clone, MaybeZeroable)]
 pub struct NV2080_CTRL_GPU_GET_GID_INFO_PARAMS {
     pub index: u32_,
     pub flags: u32_,
@@ -396,14 +396,14 @@ fn default() -> Self {
     }
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct DOD_METHOD_DATA {
     pub status: u32_,
     pub acpiIdListLen: u32_,
     pub acpiIdList: [u32_; 16usize],
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct JT_METHOD_DATA {
     pub status: u32_,
     pub jtCaps: u32_,
@@ -412,14 +412,14 @@ pub struct JT_METHOD_DATA {
     pub __bindgen_padding_0: u8,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct MUX_METHOD_DATA_ELEMENT {
     pub acpiId: u32_,
     pub mode: u32_,
     pub status: u32_,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct MUX_METHOD_DATA {
     pub tableLen: u32_,
     pub acpiIdMuxModeTable: [MUX_METHOD_DATA_ELEMENT; 16usize],
@@ -427,13 +427,13 @@ pub struct MUX_METHOD_DATA {
     pub acpiIdMuxStateTable: [MUX_METHOD_DATA_ELEMENT; 16usize],
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct CAPS_METHOD_DATA {
     pub status: u32_,
     pub optimusCaps: u32_,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct ACPI_METHOD_DATA {
     pub bValid: u8_,
     pub __bindgen_padding_0: [u8; 3usize],
@@ -443,20 +443,20 @@ pub struct ACPI_METHOD_DATA {
     pub capsMethodData: CAPS_METHOD_DATA,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct VIRTUAL_DISPLAY_GET_MAX_RESOLUTION_PARAMS {
     pub headIndex: u32_,
     pub maxHResolution: u32_,
     pub maxVResolution: u32_,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct VIRTUAL_DISPLAY_GET_NUM_HEADS_PARAMS {
     pub numHeads: u32_,
     pub maxNumHeads: u32_,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct BUSINFO {
     pub deviceID: u16_,
     pub vendorID: u16_,
@@ -466,7 +466,7 @@ pub struct BUSINFO {
     pub __bindgen_padding_0: u8,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct GSP_VF_INFO {
     pub totalVFs: u32_,
     pub firstVFOffset: u32_,
@@ -479,25 +479,25 @@ pub struct GSP_VF_INFO {
     pub __bindgen_padding_0: [u8; 5usize],
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct GSP_PCIE_CONFIG_REG {
     pub linkCap: u32_,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct EcidManufacturingInfo {
     pub ecidLow: u32_,
     pub ecidHigh: u32_,
     pub ecidExtended: u32_,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct FW_WPR_LAYOUT_OFFSET {
     pub nonWprHeapOffset: u64_,
     pub frtsOffset: u64_,
 }
 #[repr(C)]
-#[derive(Debug, Copy, Clone)]
+#[derive(Debug, Copy, Clone, MaybeZeroable)]
 pub struct GspStaticConfigInfo_t {
     pub grCapsBits: [u8_; 23usize],
     pub __bindgen_padding_0: u8,
@@ -570,7 +570,7 @@ fn default() -> Self {
     }
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct GspSystemInfo {
     pub gpuPhysAddr: u64_,
     pub gpuPhysFbAddr: u64_,
@@ -627,7 +627,7 @@ pub struct GspSystemInfo {
     pub hostPageSize: u64_,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct MESSAGE_QUEUE_INIT_ARGUMENTS {
     pub sharedMemPhysAddr: u64_,
     pub pageTableEntryCount: u32_,
@@ -636,7 +636,7 @@ pub struct MESSAGE_QUEUE_INIT_ARGUMENTS {
     pub statQueueOffset: u64_,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct GSP_SR_INIT_ARGUMENTS {
     pub oldLevel: u32_,
     pub flags: u32_,
@@ -644,7 +644,7 @@ pub struct GSP_SR_INIT_ARGUMENTS {
     pub __bindgen_padding_0: [u8; 3usize],
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct GSP_ARGUMENTS_CACHED {
     pub messageQueueInitArguments: MESSAGE_QUEUE_INIT_ARGUMENTS,
     pub srInitArguments: GSP_SR_INIT_ARGUMENTS,
@@ -654,13 +654,13 @@ pub struct GSP_ARGUMENTS_CACHED {
     pub profilerArgs: GSP_ARGUMENTS_CACHED__bindgen_ty_1,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct GSP_ARGUMENTS_CACHED__bindgen_ty_1 {
     pub pa: u64_,
     pub size: u64_,
 }
 #[repr(C)]
-#[derive(Copy, Clone, Zeroable)]
+#[derive(Copy, Clone, MaybeZeroable)]
 pub union rpc_message_rpc_union_field_v03_00 {
     pub spare: u32_,
     pub cpuRmGfid: u32_,
@@ -676,6 +676,7 @@ fn default() -> Self {
 }
 pub type rpc_message_rpc_union_field_v = rpc_message_rpc_union_field_v03_00;
 #[repr(C)]
+#[derive(MaybeZeroable)]
 pub struct rpc_message_header_v03_00 {
     pub header_version: u32_,
     pub signature: u32_,
@@ -698,7 +699,7 @@ fn default() -> Self {
 }
 pub type rpc_message_header_v = rpc_message_header_v03_00;
 #[repr(C)]
-#[derive(Copy, Clone, Zeroable)]
+#[derive(Copy, Clone, MaybeZeroable)]
 pub struct GspFwWprMeta {
     pub magic: u64_,
     pub revision: u64_,
@@ -733,19 +734,19 @@ pub struct GspFwWprMeta {
     pub verified: u64_,
 }
 #[repr(C)]
-#[derive(Copy, Clone, Zeroable)]
+#[derive(Copy, Clone, MaybeZeroable)]
 pub union GspFwWprMeta__bindgen_ty_1 {
     pub __bindgen_anon_1: GspFwWprMeta__bindgen_ty_1__bindgen_ty_1,
     pub __bindgen_anon_2: GspFwWprMeta__bindgen_ty_1__bindgen_ty_2,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct GspFwWprMeta__bindgen_ty_1__bindgen_ty_1 {
     pub sysmemAddrOfSignature: u64_,
     pub sizeOfSignature: u64_,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct GspFwWprMeta__bindgen_ty_1__bindgen_ty_2 {
     pub gspFwHeapFreeListWprOffset: u32_,
     pub unused0: u32_,
@@ -761,13 +762,13 @@ fn default() -> Self {
     }
 }
 #[repr(C)]
-#[derive(Copy, Clone, Zeroable)]
+#[derive(Copy, Clone, MaybeZeroable)]
 pub union GspFwWprMeta__bindgen_ty_2 {
     pub __bindgen_anon_1: GspFwWprMeta__bindgen_ty_2__bindgen_ty_1,
     pub __bindgen_anon_2: GspFwWprMeta__bindgen_ty_2__bindgen_ty_2,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct GspFwWprMeta__bindgen_ty_2__bindgen_ty_1 {
     pub partitionRpcAddr: u64_,
     pub partitionRpcRequestOffset: u16_,
@@ -779,7 +780,7 @@ pub struct GspFwWprMeta__bindgen_ty_2__bindgen_ty_1 {
     pub lsUcodeVersion: u32_,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct GspFwWprMeta__bindgen_ty_2__bindgen_ty_2 {
     pub partitionRpcPadding: [u32_; 4usize],
     pub sysmemAddrOfCrashReportQueue: u64_,
@@ -814,7 +815,7 @@ fn default() -> Self {
 pub const LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_FB: LibosMemoryRegionLoc = 2;
 pub type LibosMemoryRegionLoc = ffi::c_uint;
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct LibosMemoryRegionInitArgument {
     pub id8: LibosAddress,
     pub pa: LibosAddress,
@@ -824,7 +825,7 @@ pub struct LibosMemoryRegionInitArgument {
     pub __bindgen_padding_0: [u8; 6usize],
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct PACKED_REGISTRY_ENTRY {
     pub nameOffset: u32_,
     pub type_: u8_,
@@ -833,14 +834,14 @@ pub struct PACKED_REGISTRY_ENTRY {
     pub length: u32_,
 }
 #[repr(C)]
-#[derive(Debug, Default)]
+#[derive(Debug, Default, MaybeZeroable)]
 pub struct PACKED_REGISTRY_TABLE {
     pub size: u32_,
     pub numEntries: u32_,
     pub entries: __IncompleteArrayField<PACKED_REGISTRY_ENTRY>,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct msgqTxHeader {
     pub version: u32_,
     pub size: u32_,
@@ -852,13 +853,13 @@ pub struct msgqTxHeader {
     pub entryOff: u32_,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct msgqRxHeader {
     pub readPtr: u32_,
 }
 #[repr(C)]
 #[repr(align(8))]
-#[derive(Zeroable)]
+#[derive(MaybeZeroable)]
 pub struct GSP_MSG_QUEUE_ELEMENT {
     pub authTagBuffer: [u8_; 16usize],
     pub aadBuffer: [u8_; 16usize],
@@ -878,7 +879,7 @@ fn default() -> Self {
     }
 }
 #[repr(C)]
-#[derive(Debug, Default)]
+#[derive(Debug, Default, MaybeZeroable)]
 pub struct rpc_run_cpu_sequencer_v17_00 {
     pub bufferSizeDWord: u32_,
     pub cmdIndex: u32_,
@@ -896,20 +897,20 @@ pub struct rpc_run_cpu_sequencer_v17_00 {
 pub const GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESUME: GSP_SEQ_BUF_OPCODE = 8;
 pub type GSP_SEQ_BUF_OPCODE = ffi::c_uint;
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct GSP_SEQ_BUF_PAYLOAD_REG_WRITE {
     pub addr: u32_,
     pub val: u32_,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct GSP_SEQ_BUF_PAYLOAD_REG_MODIFY {
     pub addr: u32_,
     pub mask: u32_,
     pub val: u32_,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct GSP_SEQ_BUF_PAYLOAD_REG_POLL {
     pub addr: u32_,
     pub mask: u32_,
@@ -918,24 +919,24 @@ pub struct GSP_SEQ_BUF_PAYLOAD_REG_POLL {
     pub error: u32_,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct GSP_SEQ_BUF_PAYLOAD_DELAY_US {
     pub val: u32_,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct GSP_SEQ_BUF_PAYLOAD_REG_STORE {
     pub addr: u32_,
     pub index: u32_,
 }
 #[repr(C)]
-#[derive(Copy, Clone)]
+#[derive(Copy, Clone, MaybeZeroable)]
 pub struct GSP_SEQUENCER_BUFFER_CMD {
     pub opCode: GSP_SEQ_BUF_OPCODE,
     pub payload: GSP_SEQUENCER_BUFFER_CMD__bindgen_ty_1,
 }
 #[repr(C)]
-#[derive(Copy, Clone)]
+#[derive(Copy, Clone, MaybeZeroable)]
 pub union GSP_SEQUENCER_BUFFER_CMD__bindgen_ty_1 {
     pub regWrite: GSP_SEQ_BUF_PAYLOAD_REG_WRITE,
     pub regModify: GSP_SEQ_BUF_PAYLOAD_REG_MODIFY,

-- 
2.51.2

