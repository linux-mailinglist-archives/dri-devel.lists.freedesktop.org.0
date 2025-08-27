Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2950AB376F7
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 03:34:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA3BD10E6E9;
	Wed, 27 Aug 2025 01:34:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rQ+HL9IS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2072.outbound.protection.outlook.com [40.107.102.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 703D610E307;
 Wed, 27 Aug 2025 01:34:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N+ejXUlo6gt/44PHdlqFuJ92qjgvpB2ZXKr73m78bjvFW600ynP7DwfnB9RIUXJQFc/BhkbX+8aZR9IzNRlks8TwgCoiWtJ9arByEVJEdD7mKx68xIFZct0tPuvy3gEGOcsZDjYgvmFmAsEtohm8kR1B12Xw2kERM/QPhVXtdEzSMkf0Fa5jyCF2an3v5jX6jG+CkisjdKvWpBgTVClo7VGWjCfk+J7AD1qzpvfdqlfJG+iJFAB76ZNtO/jVCfhEhN28F3HK3rZgwQrpk3KVX5lIlcAzEqMbxDuiCm9YKXjHIaKVQ9i2y+Nm1Lbz4VVKU680T9nFB6wtnO1WqgAAUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Zkb1n+AGZU1/djRmLQNf5xYqssYKVc9BvK1hgmnHUY=;
 b=mx7p5G/Wx4JdcgbBFVAfKdF9V1eoBtS8qcoq9QkIUR4FeNy5USPiaL3sL+2ibZ3+8becUd7lYCzTlyVg+qRwSxP65NZPo0uAPvFzizTu8M1WDPslFJUZ6he9aEFmRPfzCWbHpOIh7lkx04AChTvo2eZtnqRJ1e6waxVrrOL9yQuijzergKEkvK9ktsWlnPyWmjD9mNWP8zZXMrnPvSKA/V6F8y49uQCZ7aeB6MtMdWHW5f/HxvcPd+FWIQH62oBh/fMuDKdF47abIbkCSPZ4AA4bDDPI3yN7tikO2tmLNkVC/73INzonaYqNekAcxXEay7AVnjQOwpmuDeOUqOqk/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Zkb1n+AGZU1/djRmLQNf5xYqssYKVc9BvK1hgmnHUY=;
 b=rQ+HL9ISwOO55vvSPdqP6Ao9Agn5yfCIfgqJUicyaxBXbX0AQXK+XkE/Ip/sThAS/2ljtK/JR3XhwxE5sHSLWXFOTOG4bHWUDSjcWlhM0D3e7TtpMppzUtNSzwBdbUK9/Jnxu2AdxKTw0pWFXWUhG7wWzLgro7pD1fqZodEUkKh0P5IzPuZ6bPAOVCwHPbbxBYF932XJlKUv4myhDumbD/U95oZ3z3t2jlJqkfTg3uvDlyLjfht39lRim3yArKYW3ju0OPJZ+wibxOKs7XFhUhNaoksTeH/p2htnuu6OooP1QiBRMHb0/S1zo9OcVgqTmFCgrhW1LCMdhR9ctLxnhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by DM4PR12MB5986.namprd12.prod.outlook.com (2603:10b6:8:69::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 01:34:16 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%6]) with mapi id 15.20.9073.010; Wed, 27 Aug 2025
 01:34:16 +0000
Message-ID: <9adb92d4-6063-4032-bf76-f98dcfe2c824@nvidia.com>
Date: Tue, 26 Aug 2025 18:34:13 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] gpu: nova-core: firmware: add support for common
 firmware header
To: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
 <20250826-nova_firmware-v2-2-93566252fe3a@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20250826-nova_firmware-v2-2-93566252fe3a@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0038.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::13) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|DM4PR12MB5986:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ee1be6c-96c3-41d0-de78-08dde509d5ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OE1oQmdYWU0vTmFITlZDenFydzZ5RWZoVGIrMzFTTDhHRnk1SU1EZjZ3TjNQ?=
 =?utf-8?B?WXc0cTNuc3plTHVIcjNZeThBRnZIME0xdUR4MjlUWEI3NTFsc21XaTRSMld0?=
 =?utf-8?B?Mk5heFR0S0IxNU51UFh0SFhVaDhGTnYzRmluUUs0TWhwdnQrNlFrMFJyRjVN?=
 =?utf-8?B?eE1PWFNhU2xqZXRKZzNYVkJVZzAzckIwcExIc0xhTUQ0U2wySGZNTDg3dmJx?=
 =?utf-8?B?RXpORmFaeEs5WlROWVhqdStjeW94TXdQaFdpZDBxWXptUE1vc2dUYjdmTUdm?=
 =?utf-8?B?eUxZRTdlMmttOHB2QmVvMGlGSURxTVdXVmhLbTU1dHBCbWNPMnhWYzhkWFdP?=
 =?utf-8?B?cVBBUlk1RTVBNmtyNUthdnFPOGg1cjZiK3ZSSTU1QXVXdU0wYmFpdkNIWk8v?=
 =?utf-8?B?S3dhZzZNNWhER25lOWFXSlJyVi9TNG1PbHhSRE9lTERKQnBBTjRlOTl6SEFQ?=
 =?utf-8?B?bmtva1ZGMHZFL3RNcS9mQjF2cm5XVVY0b1k0ZjgwMFFUazYySmp5bHZJZjNq?=
 =?utf-8?B?WlFDaVlmbHo1eDVBTlJ3NktVb0U1VGJmeUxXcks4QkoyWXVSK0pNdHFmYXcv?=
 =?utf-8?B?MzFVd0FvbXBGQ0FNWEZSOXZwcHhwdHF1OEdHVjkxYmdmdG5xWUYyZk9UUm42?=
 =?utf-8?B?cFIzMWNndW95a3hMR3BwWkp1NjRObWxIMXU2dGRNdmt4eXFodlZrL2hpTHhM?=
 =?utf-8?B?WjVuanZOMlEwQUZkQWprMUd6cGU1YUFrRTN6UVBIMVRvelRCRkFxSkN3R1BG?=
 =?utf-8?B?MTJhMElvQ2VweTI1ZmVWR2d1NW5yRU5kb2FpdERRZkNCTHJ4VkxlTjRMWkc5?=
 =?utf-8?B?Ti9CaDg4V1phMUxmL2tBVEU3RkZvUUNsUGNFVnQ2NzlISFRzY0F2RXI3dXND?=
 =?utf-8?B?Y255Z0g4Q3BFdVZRYldmMG9FTEtieG51aWpadzhIR2dvSmVoMUJYTktpZTZ1?=
 =?utf-8?B?SUxTWGZzWGpRQjBoL3BDMURZMXMzZFlYeXZVNWJGZmxTUExDVlIyblh0QndL?=
 =?utf-8?B?NHNtNHhGVGpaZ1NVU1VhaUMzbkRrTTluTzBmcGpES21RMEJlTUtHMUNldnNR?=
 =?utf-8?B?cTFyOUg0U0l6MXo3cXl0NkU2RzVHL2JqbzZYMDhJY1RRM0JvRjVrNy81MGVK?=
 =?utf-8?B?eTdpdFNPMmZzd05pNFpvd2xWRG1Ra2M1eTFZaW9PSS95YU1tWlBvbm45Vm10?=
 =?utf-8?B?M3dFM2VIZ3lxWmVxRGhuYVpRYkhSdDlZbDhsakoxRm9TZGtubGZHYytuUS9N?=
 =?utf-8?B?Zm9hcHNweS8vVTl1OGdpMHk3NkZWUXNBNWJqakVJdTdqQTRsRGUxeXk1Q05O?=
 =?utf-8?B?MjYwWWE2Q2hMc0kwVlQ2bld6VCt3V2hlV2hzZnpKa3J2ME5rNnFHNit5bXZU?=
 =?utf-8?B?cjF2NUJuZ3RBNURZTW8rbkpVb25kazdjRU1Cc2FtOXMxMkk4Sng1aHBHNjZE?=
 =?utf-8?B?Wndqa1ZZQmFSU014NU1XT09Nd3NsY3NYS0dmdFQycy84ZGlqZGlyS2Y2Tkp5?=
 =?utf-8?B?N0QzdVlyM0xOZUlTWmlLUVpHeDFLOTVWd1VMbzMvTVlWNjlzWHJndm5rMS9Q?=
 =?utf-8?B?OHlzei9HbWlKTC9LdW9NOXNSc1ovZTYvVDBZNEhSOGRrRmpObmFMbzVLbUtv?=
 =?utf-8?B?VjcwWDdKZEZ6UndTVEI5UVdWenV0TnJScjlzeUJLZmdMVitiR0pqNzNtMGhj?=
 =?utf-8?B?Y3k4N0hxdGs0RmozSGFGVWMrL0w4b1dlcFg3cmdWNEpMRno2Q3hwaXZ5NTYw?=
 =?utf-8?B?M1RFdjRsRW1xd2JOeTBSWVZGTEgza3lSMjhEbFdEODVzV1NQdmc2ZjFnbmJy?=
 =?utf-8?B?ZjdJa1c5UUVtOUJySU1BcDhMQ1k5SlROckdNWVB5SUloRit0Z2FmRTZvNlMv?=
 =?utf-8?B?NzY0YzF5NXlLa2NmMW5UZ25GVEMrcTFGSXRnVTlkZUFqbWUyWExkZ1lWRXpW?=
 =?utf-8?B?YWMyS245bHRMRy91VGdCdEJDL2RqOVdlS1RUYzlDa3NJZnlZSjF2TVpjbmFF?=
 =?utf-8?B?SVpTRm10SjJnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5968.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHFXeEJJamhNTXc0RWtuSnNpNmxuR2tIcW93RlZmcmtIWEZ5eDdhYTYwRnNj?=
 =?utf-8?B?RkJZUXF2bUJHNGJqMGZYcG1lbWtURUxaUVpLcnRNVEFxdXMyRFZPaEsydC9m?=
 =?utf-8?B?dGdLc3FQZzl4S1JKQ01vQ2JhODJVaUx3WVphWDMwendJZGNuS0FYWmE3OWFL?=
 =?utf-8?B?WmJvMXVpYkRmbDkzN2lNeE90Y1ZZZ1VvcVJVcVBWVUxDZlFYL1d2VmUyOTVt?=
 =?utf-8?B?cWRINCtsMXhiTUJkRjA5NzU0RkJTSFZ5dk50Y29aS1N2Vks3VVl6aUl3T1la?=
 =?utf-8?B?T1hLWE1pNEpxczFwL1crZWVXRTBqU2dUTFJBUE5TRXhhcW1GL2JXVncyaUkv?=
 =?utf-8?B?TFQvaEVKZExXc0JjU0VaYVdXZjJlMTNFQk9lellIZFhVT1ZsZDFET1o4VWsv?=
 =?utf-8?B?UzFaNWtCNTk0aGh1VERILzBqUXUzanZ3Vy92cVk2NWRmT2UxbHlrSFVTUmFk?=
 =?utf-8?B?Y2xaVVR4dHZ3ZUVNZndiTWFEMWl5ZW1WbndmVDVObmdzdUtpMVhtSGRQSUVw?=
 =?utf-8?B?R2pvOTBicWFXNUxWakw2bFo4ajBjbXgxZHNPeU13bERBTzZHVG5nMTFwVGVQ?=
 =?utf-8?B?ZVpJbHZOUlBST3BzdzRaVWdvZG51QmVwUXZUblVnOG1tM1hKUHdYMjZBZkQ4?=
 =?utf-8?B?RTk4dXVlQnZmYkxHTWxFd09raEQ1bzl2V21WQlVTZ0RwNlpEUDJJK0kyb0N1?=
 =?utf-8?B?UlRUZW5ER1pkK3ZGcENJeU12U1doeGl3SFJyQklUWWlNTVJDeEhCSEI4T2VK?=
 =?utf-8?B?NTBPMXcyaGRRQWU5RE5CR2hPTmZIbDlqNzlGRFZ2YmVRZll0STlWYzdZY1lw?=
 =?utf-8?B?dW9SWUpvRks5R2V5WHVLMjQwbmQ0RkJ6V2psL0RPZ3gyRG5NTFZId0xzN0pD?=
 =?utf-8?B?T2JGMnYrYXU4Wm9JTmcyUzBRWC9jcTBMemxOM3Z6bjU5eW41ZkRrdkU0NkJt?=
 =?utf-8?B?bTE2WWZKbEtRM04rTCtsVzl6ZjhoSUlUMmVXQTZjdmxhb3VWSDRJYnRUOW10?=
 =?utf-8?B?VEZPNmVsL0h2WkVjQnRBMzk5MXdGa3JpR0liSGxNdjNOZS9wQ0FVZFVPS24y?=
 =?utf-8?B?TnJNNTVMYkMrY21Lb2V4eDB5TUxvaHVjdUJ5ektHeFdGVUt3MnhKWUhsN1Ey?=
 =?utf-8?B?NlZ0WXMzL2hlNVp2TElYVEcwWncySnlZeFowbFJzOW5EdWQwYWs1OWorSFU5?=
 =?utf-8?B?ME8yUDRmWnRuTmIrMUFDQmZtWmxPTE00NkF0Vm02bTg4ZEpITmZlbzk5ODFL?=
 =?utf-8?B?eFlTS1drRUVBOXdqb1crWHZCZmd0TGpXcjdnRDRaeFBwa3dtL1pMUHl3K0tG?=
 =?utf-8?B?SGtvZDNtVG5KTitWUCszWERQT1JlRHZMaDB0c2JNODIwK2dJR2ZneVJubmR1?=
 =?utf-8?B?VUpMN3FPOWUxdXJYNmVMczBNY1haOXNHVHo1RG5GNmlPYnZ2NXU5bkZsSVZz?=
 =?utf-8?B?dFZZU3FCU01TQzQxVm5xQkp3UTFWMEtNREYwRXNoY2ZLK0svKzVMd1F2WEpq?=
 =?utf-8?B?ZUNQdDFVazkrK3Y4dHVDQWtOR2lmN2RiN0dyeUJmTzJCdnEzSzNsdDhWU3VF?=
 =?utf-8?B?K2lLOHpFWGVmdm92TVhaMFFqeTl5aUJteUYvbW9PY0dKUnBjcWJYSFBNaWJL?=
 =?utf-8?B?VVg5L1FNZmNTUjRqano0aWVkT1ZHMmN1S3JsMmY4aExoQXV1dm9rdWI5a04r?=
 =?utf-8?B?QjhzckFmMzVVRUl1OS8wa01PYXkzNDF1QmxHTnRpV3NUbzFXa29TTmw3MXlJ?=
 =?utf-8?B?T1FPeWxBOWJHb2YrOTR3b1JHQnRGVmd6MTJKQ3hCZlFuTjdDejZ6dGdKYThT?=
 =?utf-8?B?d1BvTnpzYUdmWEdsY0JBbTBrSlo0bk5jMyswR0FuRXBpT1BKNzhkY1NRMW5k?=
 =?utf-8?B?MnVLWkpPZ01hZlg2Zm9RZUJ6MEJxdGpOR2hsTGlYMm14RjE3Z0FIQndxTWRw?=
 =?utf-8?B?cTEzNXE0cVBpNUdGTGNLSjZhd1ZrbFg0ZmE0b0I0M0orNmIyUlBIWm5tbzg2?=
 =?utf-8?B?TFVUUm5jcGFHQUEwb29GZXVsc0xLUWIvcTdqbXZIMytXY3Q2dVlST3MzRjNK?=
 =?utf-8?B?QnJNTzd0L21jRWhqdy96djdtMHdpeVVmMkhDKzNWU3Y4UzVJYVNQSzVSOEdt?=
 =?utf-8?Q?maO0m2X70G1JJm8j15fibTlQK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ee1be6c-96c3-41d0-de78-08dde509d5ef
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 01:34:16.4984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WhJ70gXKaw5V7oDtUb+NXVAS8/0IZfwSpjQxqpf4WDoTFFBdVx8vRDVYxKL0cJp37SgX+IxA1jEV0xP2Ngm2nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5986
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

On 8/25/25 9:07 PM, Alexandre Courbot wrote:
> Several firmware files loaded from userspace feature a common header
> that describes their payload. Add basic support for it so subsequent
> patches can leverage it.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware.rs | 62 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
> index 2931912ddba0ea1fe6d027ccec70b39cdb40344a..ccb4d19f8fa76b0e844252dede5f50b37c590571 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -4,11 +4,13 @@
>  //! to be loaded into a given execution unit.
>  
>  use core::marker::PhantomData;
> +use core::mem::size_of;
>  
>  use kernel::device;
>  use kernel::firmware;
>  use kernel::prelude::*;
>  use kernel::str::CString;
> +use kernel::transmute::FromBytes;
>  
>  use crate::dma::DmaObject;
>  use crate::falcon::FalconFirmware;
> @@ -150,6 +152,66 @@ fn no_patch_signature(self) -> FirmwareDmaObject<F, Signed> {
>      }
>  }
>  
> +/// Header common to most firmware files.
> +#[repr(C)]
> +#[derive(Debug, Clone)]
> +struct BinHdr {
> +    /// Magic number, must be `0x10de`.

How about:

       /// Magic number, required to be equal to BIN_MAGIC

...and see below.

> +    bin_magic: u32,
> +    /// Version of the header.
> +    bin_ver: u32,
> +    /// Size in bytes of the binary (to be ignored).
> +    bin_size: u32,
> +    /// Offset of the start of the application-specific header.
> +    header_offset: u32,
> +    /// Offset of the start of the data payload.
> +    data_offset: u32,
> +    /// Size in bytes of the data payload.
> +    data_size: u32,
> +}
> +
> +// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
> +unsafe impl FromBytes for BinHdr {}
> +
> +// A firmware blob starting with a `BinHdr`.
> +struct BinFirmware<'a> {
> +    hdr: BinHdr,
> +    fw: &'a [u8],
> +}
> +
> +#[expect(dead_code)]
> +impl<'a> BinFirmware<'a> {
> +    /// Interpret `fw` as a firmware image starting with a [`BinHdr`], and returns the
> +    /// corresponding [`BinFirmware`] that can be used to extract its payload.
> +    fn new(fw: &'a firmware::Firmware) -> Result<Self> {
> +        const BIN_MAGIC: u32 = 0x10de;

Let's promote this to approximately file scope and put it just
above the BinHdr definition. Then we end up with one definition
at the ideal scope, and the comment docs take better care of 
themselves.

> +        let fw = fw.data();
> +
> +        fw.get(0..size_of::<BinHdr>())
> +            // Extract header.
> +            .and_then(BinHdr::from_bytes_copy)
> +            // Validate header.
> +            .and_then(|hdr| {
> +                if hdr.bin_magic == BIN_MAGIC {
> +                    Some(hdr)
> +                } else {
> +                    None
> +                }
> +            })
> +            .map(|hdr| Self { hdr, fw })
> +            .ok_or(EINVAL)
> +    }
> +
> +    /// Returns the data payload of the firmware, or `None` if the data range is out of bounds of
> +    /// the firmware image.
> +    fn data(&self) -> Option<&[u8]> {
> +        let fw_start = self.hdr.data_offset as usize;
> +        let fw_size = self.hdr.data_size as usize;
> +
> +        self.fw.get(fw_start..fw_start + fw_size)

This worries me a bit, because we never checked that these bounds
are reasonable: within the range of the firmware, and not overflowing
(.checked_add() for example), that sort of thing.

Thoughts?

> +    }
> +}
> +
>  pub(crate) struct ModInfoBuilder<const N: usize>(firmware::ModInfoBuilder<N>);
>  
>  impl<const N: usize> ModInfoBuilder<N> {
> 

thanks,
-- 
John Hubbard

