Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMYhLAcsl2nmvQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 16:28:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8C9160213
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 16:28:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 839B410E6F6;
	Thu, 19 Feb 2026 15:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Qr4dLE/W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010026.outbound.protection.outlook.com [52.101.85.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 252D010E6F6;
 Thu, 19 Feb 2026 15:28:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dtp8WRH5TV3i8SojjebElrcONX7reRLBG0ARqSW1Sd/PHAIwzXHIxIhQmCwzRlVUM4hZgp5iEwVTsisjeRNuXKq+yVpzFseLqHalz+7YTcJNOrjNnyw53JGG5vJUzoam0BQPx2hJhefREWcjNyrG1rAMvFWPUrg8aqgvPjVJn5LALFBpdhU8IkLJ32k7gxwfrqTAHvTYCw0IAr68NWAfLyAkJ672iUX3OkLwsXXkhnJGxc8TYec0zi03Lyw/1E5v72qc3Ocp8/oE59W87rymV1V0cUZJm934zyWSO/b3/VR1TgUn3/GX3MeMSTtl980Flh2Ux6e9LTcgMgQn+q9Yew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jk1WYruZM24KfzwQVhE9PkPh4iygIAyWlXeUp8L53o0=;
 b=PF/dGWuia9SXYitYEi3ykMxWOXHMroI8/YWE9oktusSyAawC8cp0TCwl14QPDxKt6EvIpoyet1i3aOcTI+/ht7sTW7PqBnsL2Jo9ETgRutogkcCOkVQmN1QgTmpq4vW4EYAeReHN0MYF2OsZEXiuXmdLtrMI/SFje+qR6S5PqzYPPOmZ+Bma6hhi9ezdSWxoL3Qv5iLG9r/PWSsln7ogh55k4m1m2aNw6yWyGynkH6Eb8i2H9dLhd53Y/fWk5qROGHnzbgxwfSxC67enVABLUWsqEnL4EupRsvG7zfQi0gi5Bj/3UjHTBJJ+tf9vOgk5hMVQVepuw5mudZ2OD09dQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jk1WYruZM24KfzwQVhE9PkPh4iygIAyWlXeUp8L53o0=;
 b=Qr4dLE/Wn1gpfUcaY67hRq4Lxs8RmqOa62O/TlmWMORC+Kj5JMfkx0SE2UBD3nt33lddLhZV4nrFCyTeDKipo8B3MovyJO5IwFsdG+UqYurKaB99O5mLUDnIOtUI3fkwH/vjJNxzZL0wH9cxlewxZ+kdmXb8+w1litOsIB8ylkpvRkb1nugLzCzPVhaCtOEtRZ8RTPZwAZ6uJlcr+JYdwhvrHhAbiF7gZz4ceky1qJ/TV0psqzFCRxUJ7JFncNUCAx+uQLMj7VpjNf+ZdFYhaFa3rB6ppNO66KlbmEFMpgl8kZcvEiKB9tHzue175nqK7f+zCmJxkgbIQCLbrXiKMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SJ0PR12MB6989.namprd12.prod.outlook.com (2603:10b6:a03:448::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 15:27:56 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 15:27:55 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, Björn Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>, Daniel Almeida <daniel.almeida@collabora.com>, Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, Nikola Djukic <ndjukic@nvidia.com>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
In-Reply-To: <DGINJVYFSYU0.115RA9K7O8KGN@nvidia.com>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com>
 <DGINJVYFSYU0.115RA9K7O8KGN@nvidia.com>
Message-ID: <3425af4d4fbb47a5089bb8a3c863f702@nvidia.com>
Date: Thu, 19 Feb 2026 10:27:54 -0500
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0440.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::25) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SJ0PR12MB6989:EE_
X-MS-Office365-Filtering-Correlation-Id: 411f9022-2361-4a99-11b9-08de6fcb7466
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bUJjN2IvSy9teU8rWkx1U01vWWtGTWV3MjlUU3F3cm1hOVl5Ynh3ZlFSbVFh?=
 =?utf-8?B?NVVBYi9XSFlsQlppRW16d2xudlQrWkptaW81eTVJSjdoUzFEWmVQaDhZU0RF?=
 =?utf-8?B?d3MrVXdMUzBUTVZyV0Y1Y0hHbVpMV2NkZUw2S0FJUjBLdzdUdjA0NHpSSUw4?=
 =?utf-8?B?VEdoQW9ibzZIOVpkSkdIQUlqa09YT1kzUkxpWjVMU21DUUQvQ21FYXozcWV3?=
 =?utf-8?B?ZG8zaE9ZTUdEQlpZL3JTSDZDUHlnYWtkM3RIc3VLbGJleXBlL3BZY2pqMWRs?=
 =?utf-8?B?SUFTbUpFR0xib2dEc0ZrMDNQWG1CTTZIbml1ajhuNnJXOWxRbHZTQXRRd29i?=
 =?utf-8?B?QXVJNTcrY3F4TzB1czZENkhzNG5OUWpjcU9NeUJnYmhmLzBUQ3FvcWorLzFK?=
 =?utf-8?B?eTQ1Q3ZFTE45bGhsV3dYbnNsOWpmU2xZa0ZDdVM4c1V5b1l0M2xzS0hOR1FJ?=
 =?utf-8?B?d3JvQURVR0NjTTBGRWFrcHFHWVFsNjA5S09YYXdvV0FNMEVlL2ZEenpxSTZx?=
 =?utf-8?B?bXAvSmxIeFVrd2VsOEtFY29QWjVnY2RSbFF3VFJJTFF5N2JCOGVUR1V0TDNH?=
 =?utf-8?B?ZW1jbFhGS2J0Nmxpd1BrVHByNVVHcVZJMXZwejVkbGk4YjFiMGlBMzZ2UWdT?=
 =?utf-8?B?QU90Z1RjZzFPVFEvOFM2d2l0QlhrOUo3dEZRV3FVSmJad216aTl6NmhHUEVk?=
 =?utf-8?B?eEJ3bnRwdUhVVE53Y0VjNm1jbXJxb2VibklnWDJvWGRBdDZwVnlZeWs4UDd4?=
 =?utf-8?B?SVk1TjUxWUFxM2ZURTZVa0h2Vm5VT1pRVGlVeCsrcnFTNCtDMzd5aFJpelN6?=
 =?utf-8?B?amlUWnBjM2NlaDB5bkRaSXJ1MXZORE5pMlYxSFZSSXdOdnNreXUvR1JacGZK?=
 =?utf-8?B?cTJMVCtKTXo3YUtFL1FFMFBZVExmVjV4QzRHVHZuYXRTNkRPSUxJMGMyZ0ty?=
 =?utf-8?B?UDdhdEVxYzYyelNTY0NMVWtEamU1cUk0TjJ1RVVJbXVva2xmSkQvUWJOclc5?=
 =?utf-8?B?UVRHWFJlb2pZSVlXWjBFaUxqVmptV05pY0xWRWthWFRQYjAxTmQ0SklmaUZw?=
 =?utf-8?B?Y0VtMzU2ekROamJtWXVmS3lLeUpOMHFZZVlzNUx6R0tKNi9xOHVhWFBpUkVE?=
 =?utf-8?B?VUJITUZFSmZ1c1owWHA3Qlk2cVBSdU1zdWtzcDljOHBmZFQrVitCTGtoZ1VJ?=
 =?utf-8?B?aDUyOTliUTFrOHQ3NXdlUFFodWhHc0J6K09ZNVBqV3hNajZGd1B3aTZpM3ZT?=
 =?utf-8?B?dVpXaHhOSGFTaDVWU3NtOE1NckREV0hSVjQvK0hEQUN0SFlCRWVTWFRCcjVO?=
 =?utf-8?B?dFQ5dWR0eHVjdTBDcUttYlRDMHlCYW1zc1pDdGRDVXhkK0tQcnMxc0h6NmNU?=
 =?utf-8?B?NlM2b1ZkUjZmWk8wWi94UVFDeTNNaE5sNzR0ZGlzcVcvSXc3Zkw0UDNkTWZr?=
 =?utf-8?B?T2Z3eGtpbG04S1RUTUhwOG1FNGlZTUZHNHpzUEdJZlhCc05iazZlTDBMK3c2?=
 =?utf-8?B?dUR6bWk0dFFnbExtWG5rVmtKcDFRakpKSG5SYmFEUGVJRStncXhiZDIyV2Zl?=
 =?utf-8?B?cEYxeVlwZDcvTEFOeHZtQkVyNEFRcDhrZ1dpS0hKaDVLK01TUm9Xc25KRU9y?=
 =?utf-8?B?UENuamdmM1N0eEJsYXFMYVk3Zzg2ZjlkR0VydGNRck5zbm9UTU9SRXFqYWw2?=
 =?utf-8?B?T29UMnowVExTSC9mMVUyN3NPZE1QeU5pUk10OWNScEJnUk9ZWnNWT2UvZmk0?=
 =?utf-8?B?eUl1RFBwdHl3VUt5RnMrSFdKSTBKdzRPSnVtQzFCT2dXVUVGMFBqVWVtY212?=
 =?utf-8?B?YmpRcUdIeUNRSkZGWmErQzZrU2p0OW5uOXQ3dGJKUTQ5Tmk3TjRQZ3JKZlJK?=
 =?utf-8?B?bitRZDZqbUcxclNhTFROSnlnWC82NzJwa3hSZW5pd0xlQStKKzJ3OFI0R05w?=
 =?utf-8?B?N0ZkaTFXTkRjSDFHazR1UFUzelkrM2djMFdiVStOYzdqb0E2cGJhK3psRjUz?=
 =?utf-8?B?bEg3QWdPSHRJcklhVTViMW1neExWS3UzMXZNOUxVYzVKQUN5c3ByeFlySHJG?=
 =?utf-8?B?OU51ODZxWXhpNVA0cTlsVHNva3djWXhDVVR6R2hDaWQ4VVJOVDgrZGMyVVIw?=
 =?utf-8?Q?2FwA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVRaTDR4MGlpd2hWSlhkbUlpQzl3dENPY1Q4QjgvMjZoOUlwVGR2K0dPUmcr?=
 =?utf-8?B?QUxnSTRWVy9LdiswbUZGZjdsc0pad3Q1M3lQQXhBNFdsa1FmUkljLzJFUkR4?=
 =?utf-8?B?VmlyK0pQVEltbXd2NDhlQlFlakhsbjVXcEUxd3pjemVtRHlnbXNMd0NZbnpP?=
 =?utf-8?B?ZG10a1RLQnQ0Ykl6TFRPNGNYWk5HQ2NyVzdmWmZTSXNyMTYxSDUxd2Z3MUt2?=
 =?utf-8?B?U294K1oyTWFydDhVQllJbFY5RDlNWk56cDRvcklOYnhmY3ZEU2RuRlozOXh4?=
 =?utf-8?B?Vm9wOXdObXJnRytaRmEydURiR1lLWHhCNmh4OW9BMkZOb0FjVzZQL1ZMMU9y?=
 =?utf-8?B?YVd5Ty9uQno1Wmc1cnpvS2xUOSsyUW1uTVdHM3JLalRQb3VaWGZHOGd6d05D?=
 =?utf-8?B?dGtveVVnRHJIVTAwbUoyNjkxQnZoZGUrRi9JdUFMMjRHejU0WVZTZ01HRGFl?=
 =?utf-8?B?alE3d1Q4QVkvTmRudXgzQks5UW1XcjJGS0kxTE0rVW9WeGtydW9QZFZEanBQ?=
 =?utf-8?B?OTFyOXpqNXFMQnRxVzloUmxJY2ZaYm1VZk5IN2k4ZnoxQW1XRHMvUlpaNWFu?=
 =?utf-8?B?S3o1cko2OVVxNFcvUzI4QXZSbElTK1I3TnhzaFpuR3hsWCtJL2N3SHVURXlv?=
 =?utf-8?B?MmlJY3NkRU5PZlo0MVR4N0k3N21oRFBSd3YvYnlaQ1QwZm8zMDZWS09YNDJl?=
 =?utf-8?B?VEROR1A1UEhGcU9GR0IrQjR4a29kYUt1Wm5jenllWlRsdkdOU0kvalJoYVdN?=
 =?utf-8?B?b2hTMXNObWE2TnNMbDR4L2VhcHEwMXJRamVJNS9wZlU2OTloRVdFTkRBMWVP?=
 =?utf-8?B?bFlkWkxMdXh3T1lzU1ZxWWc2TUh1ZVBmTHZQRnVRM0JiLzk2ZjlDRVRGU2ZC?=
 =?utf-8?B?Sm1XOFkwSndFeWU3aHdDcG11eEVDSUtYU3BnNERUZTJOcm41NGprZ011REZu?=
 =?utf-8?B?MFpvV0lMcmt2S0E2MnRUcmdjWmtHU1oyZk1ZYUgxZStVZVA4ZnBsMTNpUC9W?=
 =?utf-8?B?MGQ1WWh2YlJlMVJ4UGxWSlVEeHZSNU5GZXNQYWg4dytFcjJhR005THppSFhw?=
 =?utf-8?B?L21zTVM5MEtLQnhFS29vbHRaTjB3QkNuM1VEOUIwRWJpUFFadVNqZ0F6a3Vk?=
 =?utf-8?B?QkhVUmc1eUpqc3BPRUduZWlxNm5OTldpeEdDZjk5WFZJZzVrOE9Gc2NMU2J1?=
 =?utf-8?B?bm85K3l2TWMyaGZ3L2lOZDNpSXVZaHJzK282c09IMXFKUDZGbGQxVE1ubGg1?=
 =?utf-8?B?YTVoNXJTUXJuQ0dia1ZPNjVnNE5BdnlHVVRRQlNJQWZ5UlRMZUtRMFQwUHNi?=
 =?utf-8?B?K1ZWNjJQU0FYOTBzMmVEZXN5YnZKUjVsdUtZRzZwV0dpTnRaWmw3SlduM1JR?=
 =?utf-8?B?TlBrcy9RQWVUREpaNUtqb0ZSSndqZ1I5bDdrSzhCU1ZxeVN2dm9ESEl2VFov?=
 =?utf-8?B?Nm1xeEZOUFF6MVcvTWJlSGQvdHNEVnZiQmVhTG5QMUhOeVQzemhPL1BLR29k?=
 =?utf-8?B?WlNOb1FEN3ZyenRzclQxN1B0ays2RXZqcG03aDJCUUNZNlJxTGY4ZUppOU82?=
 =?utf-8?B?dzR2K0Z1TjNTWXV3Y05Gc1ZDWFJuZ2NGeE1ZTG5RdXlGZU43MDhBNTVJMU51?=
 =?utf-8?B?cjNKdWZTRlEwLzdvQ3lsNzFkYld0T2xBZ3RUalA1VmdXaGdBcy93ekV5ZXh4?=
 =?utf-8?B?MDEwT28zM2pINnF3SkFkdllDdG5ZRnBhV0tFWUlydWlKNk5hcnhIMW94MlJM?=
 =?utf-8?B?bmlrWEh5c1BVTkcvVzM2MllaQmJYR1lQUzhVZ2xGa3dBT0VLenJFd2xTUGlG?=
 =?utf-8?B?VExDMkZ6Q0RJdk1pUUVsOFB2SElNazl3YThOOHdhSy9NL0tISmVqN21seTIz?=
 =?utf-8?B?dEtYcFdoVnllWG9tRjl0cGVqT3BjUmYwcjFrSGg2WEorVDFGcnFEYVorTUZV?=
 =?utf-8?B?WEY0enpEc3FJUzJTZFM5WDBGUVpkYmxRTUVQYkxVQ0xkNzhjR1hvbTluOVkr?=
 =?utf-8?B?a1hUWWNyRWFsbkg2VnAzK1plU0l6L0FnQzYzTnIzam5wR3RLRk4xeUxUb2kr?=
 =?utf-8?B?aG1pSDlzSzBLUWJqaDZqVlRpSjhsck11TC8wK0xqd2pTTVJMc0JLbFZzcWxu?=
 =?utf-8?B?djBKaFZ4M1h4K2JhTy9pQTZPWTFoTVlWZ2U4QThSUWNHWllMQUZydFhXY2V3?=
 =?utf-8?B?cmE1TUE0d3haaGRRYmlFbytCaWF0R3YxS01pNXl2R052MDl1M0g0c2RWc09p?=
 =?utf-8?B?L1YremlyNVljRCs1Q0syQTRZbGtPV0gyZDhZMS9uVTZwUnVvTlZ1T0VMb2xa?=
 =?utf-8?B?TE00YUgvMmdXMnNUbWcyVC9ySW1zakhWZStlcHUzd2k3Q3drUDdYQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 411f9022-2361-4a99-11b9-08de6fcb7466
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 15:27:55.6357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i2Q6f4nXYTSSzvvjtEQkYvnQkvaOM5u38tB/fwyLLq3bZVPlS+rg9W/BqDjd5vF9RHFGdgSknmLU4nBdMhBoGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6989
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org,nvidia.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 3E8C9160213
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 01:26:48PM +0900, Alexandre Courbot wrote:
> > +    PinInit //
>
> `rustfmt` fixed this to
>
>     PinInit, //

Fixed, thanks.

> > +/// A sentinel head [`ClistHead`] represents the entire linked list and can be used
>
> Typo: `CListHead` (rustdoc complained about this).

Fixed, thanks.

Joel
