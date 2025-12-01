Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBD6C99715
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 23:52:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F7CA10E4B5;
	Mon,  1 Dec 2025 22:52:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="l3zWYbVs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013030.outbound.protection.outlook.com
 [40.107.201.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17C4110E4B5;
 Mon,  1 Dec 2025 22:52:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N7qIFwzz4+1apsLBLweua2vh6FHaOk1n6eY7uEROSnMdwbA2e6yIaP1i/wBCbjfzkzOpDcQxw0JBUnmu4hWxxHMCaSvxq245K+N64FNFuQnVg70D4Vjg3yqm5qRQ78WeowiBOuqqVHZlfNlJxl9yd8htYHERkGfIw7YFVtZ0l0LfTXXuzQZgxkNixkZeK8X0PmHrSSeMh5jFKTSr4+P4j7hu95aJaMVOaKjq0sefTftSyXbpQ/KxLgeGpmpSfYZcuMN9rr4HLOUMfh0HZJCxhBv6JTYIcKk/ZOEmCMnUyNsqpAb1ppJvqW9mBMcHdzs2vzcA/nFJ1KtHwDe0hc74Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gkp2th9e9mDgrmJrqF7yx76mCr88q9mfZ4PsCWguzZQ=;
 b=ImLdiSIW7zdzsd+JnDF4+l9NrHqKRCTLjf6h3IlMC5DTUmOkLnYiDrK/9j+MiDkNz3PWlpyCya4YIOrSx28naJht1fJQRYHNi+2QjqjGibqVQnQwKf5Z2LMb/ELk2hqKcaTrpNMXVuZIhpW1IheG7KibNtt5UMq9CZzjZRyGdCrxOCR6chHRLnkJuMn52JcjI25PHOts9wAT/u3OUiOq7mJ5NY9CshBb338eQWc2rESp7CK5qY+SxtUdKhTcAvcjFSzLslPMKXkMYmjuEnuBmIX2vYQtGP0a7bejlEIGqDX15TJVQLAC0iT/NPl0hMytYuBqCrfdNciwMB4CrQqNbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkp2th9e9mDgrmJrqF7yx76mCr88q9mfZ4PsCWguzZQ=;
 b=l3zWYbVsShgCUAt6stGDqIxfD5NkP/YUGvhqcwwBv2PjOoZsAu3WqzoUCWqWiDTCs86Jg/94vPTSW8FSn4eqoXEYKQ07W2Zzb7mF6QesBpfkiPC7Ost3/ji2pagBBR3vH7w8QfL7WvjuAIw02ZMxwseqSxJr6dgdFZ88HJiZZNBQ/cwDYXfmKCYpCMtLMwu4KJ9K04P3UvJdmGuFDaIfFu87B/u7ZuuNwfThUdVwknvJKN5D8at1dDoOScXRRgUtWSWOUfKyPVxixcsRXuttGrxFL7VNnzrfIlsIbwB7fOMuYmc4suFmYK5KaCWQRjihblQUG1g5dY4XhyMe5jFHIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB6847.namprd12.prod.outlook.com (2603:10b6:806:25e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 22:52:39 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 22:52:39 +0000
Message-ID: <4224983e-7788-4c40-8046-a67e67c9d052@nvidia.com>
Date: Mon, 1 Dec 2025 14:52:34 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] rust: clist: Add support to interface with C linked
 lists
To: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
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
 <7a88da9f-c67b-4a68-b8d6-a66f9096bab4@nvidia.com>
 <497c91a2-ca6c-4e05-bc5e-7c3818302c7e@nvidia.com>
 <2700c827-d3af-403c-857a-30324e0d8502@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <2700c827-d3af-403c-857a-30324e0d8502@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0056.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::31) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB6847:EE_
X-MS-Office365-Filtering-Correlation-Id: 378eb57e-00d7-4293-a176-08de312c53f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZjZra0wrZFMyblNuVDQycUdOY0ZIZFBmdlZtNUtIVVp4WGM1TkZlNU8wdDlZ?=
 =?utf-8?B?dk5oam9UWmRmcGwrZGViR0NnOGVCRHZDUVJYK0g0U1lsZFltUFJGVnZXWUhx?=
 =?utf-8?B?Mmk3SDRaSjIwaVVkamk3RkVMeHQ5TGtTUU5SeVpwQXVVVENXemRPa0pPaklY?=
 =?utf-8?B?UEV3N0VqSmhyN0JUTlU2QXFLMjAva0VFQUQ1S3pSdkxQSlVpVjdycGt1RWxH?=
 =?utf-8?B?VmpOb0Z2bmJHdnh4bUl4YXFXMG5aU256NVUxUEYvTE12YWU5ckhqRGk5dVBW?=
 =?utf-8?B?aVkrWThHUWZPV2c0ZUZ1UjRXNStWY2s0QzNTWllCU3ZuTlQzbWhnMXBoRVZO?=
 =?utf-8?B?SkhlZXZMVC9STVVweTFwd3ZWUU5hbWVJN2xTcG11ckNwenJUUFZHZmFyTSth?=
 =?utf-8?B?bExNWEM1OThMQ2s3TXBFOXhnY1AyRnl3ZTRSVFVETjVoWkNmbS9ZR2xXZzhF?=
 =?utf-8?B?OHg0N3ptZlNFWU5MYTh6c0lOajN5a1FiTy9PaVpZQUxLVDI1OHFEQjJVWlc3?=
 =?utf-8?B?SXJyaFh5QVZaV242YUcxbG5CWHFUdTFDZ1FvY1lya2pnZVdnMVEyWldnaFV1?=
 =?utf-8?B?ZEg2cTE2aW53TlplZFlOVC9yWXVHYnFITG9rTmJya1h4dnYwMUdlaW50UFhv?=
 =?utf-8?B?YzRTZnp5a3BIQnZLYzNBb0RmTjQvSjlEVFhITUlwQTlIazdCRDFwTGc4NUxO?=
 =?utf-8?B?eno1dk1paS9wNFFhVlFRaHJQOWVTZWZPZGszY1RNVjZ0ZmYxZEd1YTZmY1N3?=
 =?utf-8?B?RDhabXhLRGxZTm1iTGZWMk9PamJIZjYzRjExRkJOc0FMZVRydE5zbFhSOStZ?=
 =?utf-8?B?WTJlb1NCZXcyWXd3UkNXTmR1b1RjK3k2UDc2UDFrRXU3Z2UyWVZiVGcvYTRt?=
 =?utf-8?B?NzBGMi9wYTUxR1ZDKy9sQyt1cnJMUExRZVhJMFdvZTNVUTRuVEU1Q1dBay9H?=
 =?utf-8?B?WGw0S095RThmZis1UWhWUTk4aHQ2cVVCTEduYVZkN3ZZYkdhT2diTHErZXBi?=
 =?utf-8?B?K3ZmeFN1Ukdrd2RUVE1IaE40VERRbmw3bWNBMDdLYjNhQnd0YVVZUXNZblZW?=
 =?utf-8?B?MnZhWEhYcGh0K2htaVBDVllac1BtUG1qb1Q2czgrZWNxMEU0K3JSWVQ0VmZS?=
 =?utf-8?B?M0I3ZjNDWEYyNHpRenRLd3hCYmV5dUV3RVFqZ3kzZVZOSjBzNWZwZUNheXR5?=
 =?utf-8?B?QWRsY3NXLzFKME96QlJ2ZEl2eGJZYnJaNk9yazhLdHVaVUt5Ujk5V2VXa25N?=
 =?utf-8?B?WlFZNit6Q1BHTzJlemx4RWRTMHoxNDladEVXS2QwZXlseUVRTlNCRzJhc2Zk?=
 =?utf-8?B?U3RJQkpYb1g3clROcXVSMmJQZVF4Y0VQN01XR2E4U0pqbXhUOC9WWTJyTnlI?=
 =?utf-8?B?U3lZRWFjQmNMQzcxeVpVUDNGNGlKS0x0WDFrMk5VOTlzYTgrd3QzaHBKd1J1?=
 =?utf-8?B?Y01IbU4wUEZJcHZWdHlnSFdiREkveUxac0lMK0lVNGpCL3lER3RiM2U1WG5y?=
 =?utf-8?B?THVva0JaNjE0TDU1NWx4TUxzTnNxRkh3QVlsNVdsOVBpajNxZkwvcWRFVEUw?=
 =?utf-8?B?cFAzMXdMRVJTZXpybHJ0b3JlZEpidzc3Z3J0ZHRWbmV1ODdhK1lpTkt5bVdN?=
 =?utf-8?B?bTY4MFpKem9JSVI4MFRpVXZndWRSYnNBWHBVUlpKbUR1bjVhZUZ3VE5vY0xt?=
 =?utf-8?B?UGd3NzZyNU85ek9XKzlzZ0c0MUpaRmJZRUQyZG5KKzRSOVNCeEZtOWczUjNI?=
 =?utf-8?B?S2lXMXBDWDI1QWt0OHhYQU00YTdxQlBtN3J1OEhZRmFDT1E0emZTMUt0eWRR?=
 =?utf-8?B?TXhvNjdwYzZYT0tZa2h1endOY3NjT2xLUk9kSFYxYnRVL0lEM1ZzOU8xRW54?=
 =?utf-8?B?Q0NxTXhnb0VzU2phdTlDS3ZrQ1A1WnR5VFR1SG1XblM0dVlrTG93YXJjM0lY?=
 =?utf-8?Q?ZjCkdGMIBDXIH2cT1lXudSndGTbtRNli?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXNOT3ZJdVQ5aUxwQW9jSkNDU2R0R2VuS3BsM3pXR2NVbUIxTWpwRVozM2J2?=
 =?utf-8?B?OUFNZ0xlekE1MWhyTGxkcW5EUDQxY05YZnd0bWxOSWlCc2REeEIrSHdJUVZX?=
 =?utf-8?B?WEpTV0NjeGhCeGdZT2lVUCt3U09Vc1lidERYaUpuVTFZeURNQzloU0txMzhu?=
 =?utf-8?B?eWErc2FZTzNGci9WaTY4OEZVSnNLQ2RmQ0hLK2I0VTVXdzJBeUhJcUR3REJw?=
 =?utf-8?B?NFl2bFFDdmRucmdHYVNuT2JxV3laU3hSTW5NSHVtcjdsVUxKbzBRUjdRSCtN?=
 =?utf-8?B?WGhuNUNhTjZ1ODloQy85dFdma05yMHZpck14ZmZOUTdpQkJkSmFGd3lFdmdJ?=
 =?utf-8?B?dWVRSDNPMGI5NUdaMWs2a2FLdm5OTEVGKzB0NW5kYnVZekFuRDd1SGRqa3A5?=
 =?utf-8?B?MTh3N3RqTC9QcWUvazRkeXJqVnRYNUs4T21VdGhpZlA5Z3NvS1J5M0QyeFJl?=
 =?utf-8?B?cmxEOTYvSVllNU9VQ3hoRy9oQ083YURIY1Z4bFhRWHk4eWtZcHhOWnhLMS84?=
 =?utf-8?B?dUQ3RU5PS3F0dVZseFBSdmVBVnpPa2ZNSS84UVR1RDE2KzRHRXd6Z3lKQ1ZE?=
 =?utf-8?B?dGdjQmVESFdWWld2WnpLTUpSbVU2dHdLUWxLM1lTdVpLNllGeHcxUi9OV05s?=
 =?utf-8?B?WXY3dGFTLzl4RlZrVTA5b0tnZkJzdU53bWVJUEw5Z1dJWnZWNHhreVhJbG5i?=
 =?utf-8?B?dVN3RUNVSkQxWmhvV211R1hVelFjQkcwWVZkMzVtYTJDWEVkOGE3Wm1aTDNO?=
 =?utf-8?B?aW9pOVNBMUt1NHo4SUNRbE1Xb05qYlF5SXF5djFBMzlpdTlsa21wZDVsYTU2?=
 =?utf-8?B?U2wyOXgrR3gvNWc4M0lFbkZ0WnA5YjdJemNNU216Qy9rd1c5Y1ZQZFBPWVU0?=
 =?utf-8?B?RXgzMFMxU2RWaEEwQmJEaGd4bHpON1FjVmdoNG54QVdySGgxY2JwQVBwOCt5?=
 =?utf-8?B?cVpmVmtvV0w1Uzl5QWU2TFhQSGZTUnRuWlR2Y2VmZkMzaCsxU3p4cXRmV3Vn?=
 =?utf-8?B?UkRFK2lmNTdJdlhzVDVvMUltd1hEZEt3YzJVTUZ1cWVWQXZ3Vit6S2JRMXpU?=
 =?utf-8?B?eTdZc1k5UTFjaEtUTWkwUHRlRWZyUVJyaEozaWdqL3BFMHdJclpXSExVZ3h6?=
 =?utf-8?B?L3J2MUVIL1dkZThScWFWZEZtS0dTSS8rUXl0VFkyaW1vR3AxTWxQWlFEbDhC?=
 =?utf-8?B?WUkrRENFT3EyK0F0b29aTFBEelJ0eFVXTC8rY2FwK01mVTJIVlNLWmh0c2JN?=
 =?utf-8?B?cUgzYi9JdTUzZGxrUHM4QjhTOVIwZ2taeHV0WnVURjR6UXlwWFNFR1hXWnFl?=
 =?utf-8?B?eFVZbXBvelVBRDN1RWpyZ092V3RUMytPR0ZOQ3kxZnFFZ0FITWg2OXgvdllD?=
 =?utf-8?B?QnhXZU9NNlpOOUtMR1RZc09mMXFFUEdVaThwWUgzNWY4VWZ4SHlEMWw5YmxG?=
 =?utf-8?B?MWtvRlloQzZ2ckdjMlphY1g0dkVHZU5lNUdMcUZ2cHZZak5PM1NtMkZTZVRK?=
 =?utf-8?B?WVVxTmxXWGdQQVlsSzRMdXVhTGowWkV5QjMrNy9aZk5hRC9uMWZsTkdwa1pj?=
 =?utf-8?B?dHE2NnJOd2doS0FRbGo1ZWxqNTljOE14RTBaRDZDTGtRcHJ2MHZMNmNPZ3h0?=
 =?utf-8?B?QWdiT2t1QVBDVGFON2F5ZFQ4OGU0RFpZemg3WFd0NndyR3BRRnBrakRPVDlV?=
 =?utf-8?B?U2Y0TlRoN1NBZHpRbm01VzdyV0RZL0M5NkIrK3hVYWFxUGVoMjgzanpva0hi?=
 =?utf-8?B?WUlvRnJSMlppek5tTWlIVGxJR3dRNlg1d0pPcFYyNkpsRkd3VGdVbktjQzlh?=
 =?utf-8?B?Z0VZeUYyVUk1UncrZ050dVNISUZYdnA5S21UY21NRDZ2STUvV1JZQ01PZnVQ?=
 =?utf-8?B?clEvT1ZGSkZxdlhlanVmTVdZcmdWMXB3SkhuV1RKRFBmTzA0NGNUbXRrZUpW?=
 =?utf-8?B?bVpIS1lhcXVrV3ZoUndBcGt1VXUyYzMvZ0pwcFh3K1VjWkkvempHL1BGOGJl?=
 =?utf-8?B?NVhpaVR6YVQ4QmlyTG1uYzM5R29YSVp3T0tiZithUE5rcjlKYlZUQTR4ZUhX?=
 =?utf-8?B?RkU2QTQ3Q3FseGJxMG1WUm9xZTVIcnJIa0NmWGVpSGtkdTJsOHNJU1V4cmdt?=
 =?utf-8?Q?1AoK2enElhNfVsi5I7B/zuNOs?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 378eb57e-00d7-4293-a176-08de312c53f8
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 22:52:39.2231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eERB5jjHWgkJ7FRhbM4OA3oKEhXOQrGpM/U4vF7B5p6DEplyKmjEV6hfwUlFBm+SywsOG1HkhyPEKcwb6f92kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6847
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

On 12/1/25 2:43 PM, Joel Fernandes wrote:
> On 12/1/2025 5:17 PM, John Hubbard wrote:
>> On 12/1/25 12:32 PM, Joel Fernandes wrote:
>>> On 11/30/2025 7:34 PM, John Hubbard wrote:
>>>> On 11/29/25 1:30 PM, Joel Fernandes wrote:
>> ...
> You may want to read [1]. CONFIG_RUST_KERNEL_DOCTESTS are run at runtime. You
> enable it and boot the kernel. The documentation clearly says "doctests get
> compiled as Rust kernel objects, allowing them to run against a built kernel.".
> And this is how I have run it as well.
> 
> [1] https://docs.kernel.org/rust/testing.html
> 
> This also explains why you think list_add_tail() is a noop in my patch, which it
> is not.

Yes, I forgot that they are actually run, you are right.

> 
>>
>> I would humbly suggest that you build and *run* your own samples code, for
>> new code that has no users yet.
> 
> Yes, I already have an internal tree running it. :) I am not sure why the
> assume_init() triggered for you but not for me, I don't think has anything to do
> with doctests since the doctests is in fact just rust code compiled as KUNIT tests.

I think it's because I wrote separate code that was not a doctest, and
that code is naturally different from however the doctest exercised it.
But it is a good question.

> 
>> Because if you are skipping steps like this (posting the code before
>> there is an actual caller), then the documentation of how to use it
>> is not "just documentation" anymore--it really needs to run correctly.
> 
> No, that's the thing, these are run. You really are in the wrong here and appear
> to not understand how doctests work.

That's a reasonable statement. :)

> 
>> And actually, after writing the above...I still think it would be better
>> to post this with its first caller (DRM_BUDDY, or BUDDY_DRM_ALUMNI, or
>> however it ends up), so that we can see how it looks and behaves in
>> practice.
>>
>> What's the rush?
> 
> Who said anything about a rush? I am really confused by what you mean. It is
> useful to post patches even if there are external dependencies to get feedback.
> So this is also an invalid review comment unfortunately. There is no rush, this
> is v3 now, did you miss that?
> 

I mean, doctests are far weaker than actual code that uses the new API.
It feels rushed to propose merging code without a caller. And I don't
think doctests are a "real enough" caller.

thanks,
-- 
John Hubbard

