Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A4DC46ECA
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 14:34:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6518710E3A7;
	Mon, 10 Nov 2025 13:34:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EKTc8PHV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012004.outbound.protection.outlook.com [52.101.48.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7AFF10E3A9;
 Mon, 10 Nov 2025 13:34:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZvF4EpBzS4Muw15ViyALIzUuEZsfJ/b+Z9ffYErRnQYACmLBMsnns37zpwo39gDm9KJ+kNAFfMxtdgB/XEmID4T1kQniwsXUpaeh+8+Jr27juT8bqDeob8gGGPEpaCCK28uv+3bniJRycoFSl3Ov9Hx98GSM4+mU9mUs0MNiwFkkEIv0hDTCJeCawdVeGIqZ9aDSDrxip8QmS1q889O51KAKNYwiyVJ/H7hxr46bXC+pgDdtezLzVPxlem9TmhmiGd/VTVUXwBElvz/dN4O2/bpCYyCNqXvsth5AFIgw5K3odN4ztr0IQJzChWJM4TKCdgbKXgdnM/l8YmLdfbqd3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WenVN1/nbTI/ARz+nvwgYjpOH+aLAUncDQsLZRU6TY=;
 b=t/7N0C3iXwvvBbd2zEqFFOqHFpV4ZQCpHn0nZSIweGvZRDXxmd6T2XI2Fnwn02Hx9QChWv0fYK7dSFT8P8ec+1RDxMSmxQHPt4lZ2649wjWjKsO+0fXy7VI7KCHL9ByfWmz8kHsebm0lSbNauTKSHCdYfDuWm3ToxZQImLzWjO3xnNglV7wu/vRX4wbjcBx2bgKBbtQ0Vxe/36bWkpb2ILVJ5ifb35sWoXNPLfYQbHjOaRLxSe7KmHedLi7sa92x5CupLFxWYEjnc/mAC40TWLDJ0lP7LghnLk3ZIwwkDOU5JlyHQ9kDRoAmXQWJGoTdptf4ExCmMCw0gVkJUQE66g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WenVN1/nbTI/ARz+nvwgYjpOH+aLAUncDQsLZRU6TY=;
 b=EKTc8PHVaYdl+IrXc/jORA0q2BPJWiwFayr1iJx8+Rq44wxEkbVsNQuW7hQ15XqrddeFBQp3Qdk6dJxw5wQ1Sj7GAD91nwkzKL+LS2PcP7scaopxBFBGxA1LMZuf6yCvy0UbaxDf6Na+OvuZOc8bRnfkq5iAy/bRqKKmDRwcG3+WzARFd2/FqJenbQ755EjRwP0vMB6uk1aGZdL9MmMhGMZtC8R164dqY2T1JFepzCIXbqLBoeiUKFwoiAuYHkn2D9XfyPK/J0fiINUjoyLT3i01GcJHROR6JBA/e93YgNonsbUYq9s/8KXd+AQ16+wJOVGm6avUaTQoVhzl18u67w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH2PR12MB4055.namprd12.prod.outlook.com (2603:10b6:610:78::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 13:34:50 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 13:34:50 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 10 Nov 2025 22:34:16 +0900
Subject: [PATCH v9 08/15] rust: enable slice_flatten feature and provide it
 through an extension trait
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-gsp_boot-v9-8-8ae4058e3c0e@nvidia.com>
References: <20251110-gsp_boot-v9-0-8ae4058e3c0e@nvidia.com>
In-Reply-To: <20251110-gsp_boot-v9-0-8ae4058e3c0e@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4PR01CA0069.jpnprd01.prod.outlook.com
 (2603:1096:405:370::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH2PR12MB4055:EE_
X-MS-Office365-Filtering-Correlation-Id: b455d8e7-821b-4ed0-3c6d-08de205dec6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?enM2aDJWbnFiblZtK1dId3ZtMGtOZHFyOEp4QkJyZzRwajZtNEcxWlVJUUhN?=
 =?utf-8?B?a0IxNzloVnI5ZUlEUDJXOWowQW55aFJUZHVwMzY2UEFtdjd3V0tBWXFFT1dT?=
 =?utf-8?B?WDVERkZEUHFJY2ljUG5WeG9Ed0hxbGNDL3B6Z1FlYlNoY1Z0MmxjNXdQRjMw?=
 =?utf-8?B?RGJUOUczS0duRkhjUUlOazRUT0thQ21aUGh3dllhczlCTFdRSnRpWFR0OU5h?=
 =?utf-8?B?MVhFSmhPMUd6cUlJVGsveWtQMjloMUxmdXRSUTdXMTFoLzhVN1dLOHd2NURZ?=
 =?utf-8?B?SEUrWlhBKzFRU0c4UUFIcWM2NXVFUUNYWG1HWWhCdFZoSUtzREE5VDZzRjlT?=
 =?utf-8?B?bVNxYkJidWRhMld0blZkSkxNNVNYdHZBWGRRSW5tbWl6dVVWNXNRTjJ4UlVC?=
 =?utf-8?B?V0o0VE1EYUYreFFXemhZTXlnOHViblNKMFh1cmlVeURPYklGeUxlZFRGTTNi?=
 =?utf-8?B?MXZPR3BiSW05YXowTDdRSHFvMkh6YjZzSm5GWEltMkpDcEZoOXY4dXRGQkJl?=
 =?utf-8?B?dUp3dzh0MjhBRDdOTG5xZU4rUmVMVlhNNlVTVmIrV0p4NkJPWWVvOGhCYmVn?=
 =?utf-8?B?YnZTcW54MUlydGhIV3c3RWkyNG56Rk5PSEZ1VHJMc1dJTUVPVi9WZm83UGZW?=
 =?utf-8?B?VTVPTis5eHhsODdnMmcrcG1nZldZM01UMUowK2VZRllzZmZtakdqT1lZc1d4?=
 =?utf-8?B?SzNaaXltMUJoeGlPWFIzZEp4ZWtybmdzcVRWa3AvNVNKaVNVSlV0enRBNWJZ?=
 =?utf-8?B?S2xxNm90T24weFd3N29mK3VMVG4yYVcvWXpMZEUyQ2MwWmFBWHE5RTMyV1hQ?=
 =?utf-8?B?anFLbEQvQjczSEVDWDZYazNoamJmTnNkaTN0bjNBZnRFL3p5QitxTmswNGhi?=
 =?utf-8?B?NWxFTnJrNzRvOFA0Mkd5MFptd2I0NTlpMGh2N1ZtVWlVZGNpVGxRQzRiRlVp?=
 =?utf-8?B?bWVmVVdrZGs0SEFVbUhieUFISW1odDdWM09Odzd6N1Z4dkdneXR5WE9jSFpB?=
 =?utf-8?B?S1FQOWtEaW9oZWtpZ0FkMmFTVE0xQnZFTUFRYnE0YjFlODl3ckUyWnUwNDVI?=
 =?utf-8?B?N1BseDMrZEJCR1owZnBpQlJnRE9iVkE0TVVGZ2RhZlB6SFRVN0RVYktFekNz?=
 =?utf-8?B?dWc5SEJBNXdNbXZkbXMyTGo5TTRuSFZMQWo1MUk2Mkg2SlYxVW4rMGRFM2hT?=
 =?utf-8?B?aVZjTzc0WFhBNFBIdHRGRXluL21MOWo2cXV0MDJlVVYxeEMydFlPb1FHR0NH?=
 =?utf-8?B?SkNnM1YrNVNpeW1SZ0lkdWpQNWY0ak1TMWkzSlM4R3RyNjRRdlpkTUtGbzhN?=
 =?utf-8?B?K2NuOXVNc2dIWnYyU1VTZUtHWWdTV0E1QmRxWmJjN3U3RmkrdVM0TGNCTFJB?=
 =?utf-8?B?QUFQUy9EQkNTVldQejVieWE5blRkVzVtYjVuTWcvVVNCQk10Mkc4emExc1Rh?=
 =?utf-8?B?djdJQlZUT1dlU24xVWxzNGRKY3FQMHdCMEY0RHJoOHFrb0RtTHdPaXY4MXNC?=
 =?utf-8?B?eVBiZ1FCM0RSRG1tUldHSysvNHpVY2IrMFZ1NjdaNUEwYmhiRm9QWjFoM2xT?=
 =?utf-8?B?OTNuUVBXa0RNOXpJaWhQa1pJME9LdnhuZUltTEVzb2d5KzhuMDRNVTRnejlj?=
 =?utf-8?B?NDg0MFYwakt5aUFOQlNublM2TEJpT01OK2lPaUM0ZmlDRGhseVY3MGJJU2V4?=
 =?utf-8?B?Ry9ZTElpWUh4NGxnTlNuM01xczlubVl0WnlIbDFadlMranhjaXo0MzZGQVlh?=
 =?utf-8?B?cWVjN1UyWlQzdUFGdGZ3RzlQNk5DSmhkTEc0MVVRR0ZYZ3ZoTjV3SWNIVXlM?=
 =?utf-8?B?QWt4YklnaE9Selh2WWZudHVnSmZISUNZc2RGNnZJcUg0RjNUd09uRjE5L1hz?=
 =?utf-8?Q?V5uP1nlik48fn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjVGeTVRRWxVd1E3YllEN2Fwd25iYjFxODhKRFBYUVhPaXI0NmtwTG1UUXpu?=
 =?utf-8?B?RzlMWHkvSnZpV3lUdnVIanlrSWUyMmIrYVF2bm9ranpYTGsvYXVpZmJHazV4?=
 =?utf-8?B?STBVMGg1UDI1ZkpEeUg4ME43OXlUT2RkcXFidklpc1FVZEpuMThMNVVaRDgz?=
 =?utf-8?B?YUpjTWlhVG5kVytDT01JeUIvTU9NUTNsTDBrVTFHQllFeFZ1TDdYUXd1RkJk?=
 =?utf-8?B?SWVIWlVHT3cwWDR0TGNLUTZOK3NoMm9IRm9abEZPcjZzMm9ITm1YcHpVUHBp?=
 =?utf-8?B?M3YrU2MvOFp6MTU4VWpUM0NwL2cvdFVkcXh4SzJQWmhvWmpyZExPeGQ5VkxB?=
 =?utf-8?B?VmtQWEtDc1dpcGxmQW5oN0F3QWpjdnBFVnU5TFRnWW9USkREQ1crSkRBSmFF?=
 =?utf-8?B?TEoxdG50R3FYK1NQNDhBL0RZcHZJdE01aWxMOWdiYXlyeU1uUUFVSkNhSmZE?=
 =?utf-8?B?cXFWL3lIeVRDQXdsZm1CTVpCaXJVNjI0bnNFQ0ZQT1ZXRlRpZ21uelpVazdn?=
 =?utf-8?B?VlR6R3R6eGNBQ2FaYkNSVDVBV25ualVYNE5JZWpYdGI0ZTMxczJxeStOUjN0?=
 =?utf-8?B?QTZoQm1WVGU3bko4ZXlDU2RSYmc5OTJOMEdkaDNvc0YrV3BkVnRYUmpDRXU1?=
 =?utf-8?B?ckR6QzhKbWJtSmg5aFBYWkVFVzdkUUY4QTRjbVRnbGZoL3d1YWhWcFd2WmVW?=
 =?utf-8?B?STJwNE5LOVZNbFc3djVZRWJaZlpiRXg5anllSkdjNFJoa0s2U2dNa0JQbTBp?=
 =?utf-8?B?V0VMQnI2NWxmempCblY2STdkd0tLbmZORGRrNzB5Qld6K3NuakpXMG5Za3gw?=
 =?utf-8?B?SWJsUkNaQ0ZsczVWRjJneHZnNFhjT21jblM4SmhqLzJockExOHp1SGZVRlh6?=
 =?utf-8?B?Rmx5amYzbFBUQUJNb1B4Rk1BZjFJbWp3Yks3V2t0YkZjUG91dGlRZEltYmFq?=
 =?utf-8?B?QWI5V3dyOHBzdHk0bFBhbWNXRUhQampibnZwYk1LbEZ4dXlDdDhEZ0NBQ1Bh?=
 =?utf-8?B?Mk5NcnM2ay9EbXorTDRMNXIwZWRNQmhEdTVjbGVvak9XTjJZY2krVHJEVnFC?=
 =?utf-8?B?NjRuc0s2UWF3VEZDSVRvbStSbGNWay9Yd3o1WFZSRy9SMUxQUHF6MkFEdEhW?=
 =?utf-8?B?KzJ5eHVna1pmTm1uV2UxT0Nib1NXaW5xVnlCMFBvelVaRDZ5THNSMnpPU3JV?=
 =?utf-8?B?MGpRRU5PNElJdFZIS1ZtZEt5Q2xId0JvbE0wOFdGVUE4a0JKQ3JNbWwwbmlq?=
 =?utf-8?B?WnY4RVhIZ1FjTTdxaHdFOUZBUnBJSTdWNmcxR2RQUlgrMGs5N0JXTmxqY1Yz?=
 =?utf-8?B?eXRJbDlYTHpSa2hoQkhQUjd5Z2RHd1VObFJMYk9qWXhXekpXM0s3NHVZalFm?=
 =?utf-8?B?bWprZW1xZ1hZQnd6V0pNcnlMUW5GdTFyeU9DMURiams5eVZSNGxWY0pCMmYy?=
 =?utf-8?B?azAzc1RRTnNsQk5nVHlmd0JSSEFaT2lYU0E3ald2QnZZNDdnUFNuSWxLNkVZ?=
 =?utf-8?B?bHZuUGdNNUI3VmtvSk5DbHdGSGFDSHo2SC9zc21lRFRVeDkyUUlCZldpb1ZX?=
 =?utf-8?B?QVhGOXlDaXJOaEtkYUZiQzkyN2pRdDZqT0ZVN0RUNERNWW43bE91N3hNbEhi?=
 =?utf-8?B?MlFuOS9VZ2E0d2hZaEkyVERwTHpBQi9oZjhua1FndHdiczdVTkdmaXBWdkJu?=
 =?utf-8?B?QmgzSWlySHhjaWtJNSt4TjlFS0tveEVlTUpFQXovdXVlYmp4eXVyaWI1amdY?=
 =?utf-8?B?WDZ0S0I0UngyWlEyT1ZjcDN5SGdQOGovUGhUd25aTGV0WmVpNmFNMXVFQm02?=
 =?utf-8?B?Qk1uSENycXEzaXhTU0ZVc3pJbGVXc2E1TU11ZmFXMXVZbjFKNXhmSVZjajFI?=
 =?utf-8?B?ZmJuVjlRYmoxVWdpYWlNOVRDUUx4VHcrbDVLUHlJV2pmRWIzVmJkQkUyK2Ev?=
 =?utf-8?B?SUNQd1BmL1p2SUhjbW5WdHY1TVBHRTZjY1pPZ3ZQU1ZtMXJibGFIaGlSaUhE?=
 =?utf-8?B?emoydWZIN3VhYlBicHVWb3pvZmRhbi9wR0ZJVDdWSWVFS3M2WWhMdWFQR0k0?=
 =?utf-8?B?MmxFWFk5QTJYWmdzaG1WL1JoZUIxV0xRdkFTR3BsTzQ1cFEzSmk1Y3VxZ21V?=
 =?utf-8?B?K0pyeGdQek5LeXNXSFBUVVE1UC9hbDkvakxCZVlVY2NoUHltQlc4cjhUdU1F?=
 =?utf-8?Q?ZofU6M4EN3tz//sUvbjGC/Ud5pmQzCCSN1RmOCuEr7t+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b455d8e7-821b-4ed0-3c6d-08de205dec6e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 13:34:50.5952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Hx3iyWua0ElhHKWJtAWjFwUw97nzpbUOetXw4pfljpsvpQhTJWDD5DbbYGlG83fkGPeKN5/tl+J5C4BNfcUxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4055
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

In Rust 1.80, the previously unstable `slice::flatten` family of methods
have been stabilized and renamed to `slice::as_flattened`.

This creates an issue as we want to use `as_flattened`, but need to
support the MSRV (which at the moment is Rust 1.78) where it is named
`flatten`.

Solve this by enabling the `slice_flatten` feature, and providing an
`as_flattened` implementation through an extension trait for compiler
versions where it is not available.

The trait is then exported from the prelude, making the `as_flattened`
family of methods transparently available for all supported compiler
versions.

This extension trait can be removed once the MSRV passes 1.80.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://lore.kernel.org/all/CANiq72kK4pG=O35NwxPNoTO17oRcg1yfGcvr3==Fi4edr+sfmw@mail.gmail.com/
Acked-by: Danilo Krummrich <dakr@kernel.org>
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 init/Kconfig           |  3 +++
 rust/kernel/lib.rs     |  4 ++++
 rust/kernel/prelude.rs |  3 +++
 rust/kernel/slice.rs   | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 59 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index cab3ad28ca49..7da93c9cccc3 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -147,6 +147,9 @@ config LD_CAN_USE_KEEP_IN_OVERLAY
 	# https://github.com/llvm/llvm-project/pull/130661
 	def_bool LD_IS_BFD || LLD_VERSION >= 210000
 
+config RUSTC_HAS_SLICE_AS_FLATTENED
+	def_bool RUSTC_VERSION >= 108000
+
 config RUSTC_HAS_COERCE_POINTEE
 	def_bool RUSTC_VERSION >= 108400
 
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 3dd7bebe7888..2581a356d114 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -21,6 +21,9 @@
 #![feature(inline_const)]
 #![feature(pointer_is_aligned)]
 //
+// Stable since Rust 1.80.0.
+#![feature(slice_flatten)]
+//
 // Stable since Rust 1.81.0.
 #![feature(lint_reasons)]
 //
@@ -128,6 +131,7 @@
 pub mod security;
 pub mod seq_file;
 pub mod sizes;
+pub mod slice;
 mod static_assert;
 #[doc(hidden)]
 pub mod std_vendor;
diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index 198d09a31449..9ee8acc563de 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -51,3 +51,6 @@
 pub use super::current;
 
 pub use super::uaccess::UserPtr;
+
+#[cfg(not(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED))]
+pub use super::slice::AsFlattened;
diff --git a/rust/kernel/slice.rs b/rust/kernel/slice.rs
new file mode 100644
index 000000000000..6ca91a4fd1f2
--- /dev/null
+++ b/rust/kernel/slice.rs
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Additional (and temporary) slice helpers.
+
+/// Extension trait providing a portable version of [`as_flattened`] and
+/// [`as_flattened_mut`].
+///
+/// In Rust 1.80, the previously unstable `slice::flatten` family of methods
+/// have been stabilized and renamed from `flatten` to `as_flattened`.
+///
+/// This creates an issue for as long as the MSRV is < 1.80, as the same functionality is provided
+/// by different methods depending on the compiler version.
+///
+/// This extension trait solves this by abstracting `as_flatten` and calling the correct method
+/// depending on the Rust version.
+///
+/// This trait can be removed once the MSRV passes 1.80.
+///
+/// [`as_flattened`]: slice::as_flattened
+/// [`as_flattened_mut`]: slice::as_flattened_mut
+#[cfg(not(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED))]
+pub trait AsFlattened<T> {
+    /// Takes a `&[[T; N]]` and flattens it to a `&[T]`.
+    ///
+    /// This is an portable layer on top of [`as_flattened`]; see its documentation for details.
+    ///
+    /// [`as_flattened`]: slice::as_flattened
+    fn as_flattened(&self) -> &[T];
+
+    /// Takes a `&mut [[T; N]]` and flattens it to a `&mut [T]`.
+    ///
+    /// This is an portable layer on top of [`as_flattened_mut`]; see its documentation for details.
+    ///
+    /// [`as_flattened_mut`]: slice::as_flattened_mut
+    fn as_flattened_mut(&mut self) -> &mut [T];
+}
+
+#[cfg(not(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED))]
+impl<T, const N: usize> AsFlattened<T> for [[T; N]] {
+    #[allow(clippy::incompatible_msrv)]
+    fn as_flattened(&self) -> &[T] {
+        self.flatten()
+    }
+
+    #[allow(clippy::incompatible_msrv)]
+    fn as_flattened_mut(&mut self) -> &mut [T] {
+        self.flatten_mut()
+    }
+}

-- 
2.51.2

