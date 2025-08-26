Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF54B3527D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 06:07:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 662EE10E2C5;
	Tue, 26 Aug 2025 04:07:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="r6k0WYEm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16BFB10E145;
 Tue, 26 Aug 2025 04:07:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qZYH/BWKeW4vZ69qZ313LRDnVVbKN0bJB0wuCwyajQqQJ3oknWY3L83Tlxc8VCLtAU2vFbmLk9aodTe8PY1dGRAL2EJWwryy9HhFV+8lQIrJLj9Whvz0nxt8mO4DFL2jlv5QZ8ICmon2e02V8lo4/0dwe/KLEvBoKbeYYlBqGIoJMmPOhAseWOZreY+/8sQI6mj+7YK96Kfy4TKoLcN/2UwDwCFCHD4TeZDOXNJuJZu0neyISfIj/b0oZZ84BLLCnxkDGQPZVd09aCY9AYA5MrPGpmzbvR39iQVFbEgDMe71gA9AdE9eH1kD7UrMCO+CYvtwhX1cLbE5O38hhQe0pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IDrIY5nhQ6ucwrgmzwBdoj/JrhJ/FTN3FtcRNJi4/hE=;
 b=TixqQDGif4YzP2SMfTnC4xQEb5A5orvXUnm7V9e1egmWUkYa9k4m8rgfP7fYQOjQrp6m5HYHmZ4tniZ+meGRyotq/cJxXX8JeyN9m+pUiWvnLvHWRjvzCqJ+rnv5owmw0vVysEOud/6AGWEf8bELO2LuumWp8cSCJ1eNBvsEpYn6PFerLSt52tUNRiSI9u5ytBrncnDGuawt/i+idWCaT6aKevfbfMuaL3DkOGRpRPAoldsj7emhQFG9yT0NeG3oE02sLvE6UIQx3zLRxXJxo23TA3hUWf/KjtGdhGxRmog4+a7Fh8wdKfiWT1sWW/BAOZXSnZggFGqCvfITwyo1hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDrIY5nhQ6ucwrgmzwBdoj/JrhJ/FTN3FtcRNJi4/hE=;
 b=r6k0WYEm9hvG9h10fOb+do6Melp9UnEoaeW5ueMktHt4/aQPqzrNW5+WRqCxfzH97wdeLZ8FfNMCj3VfBE0szqRxLdgM+QauNBChMgJ6Z/FBtfbYVZtIPuJfjFfgKExtEEN+DaDSGIwEFZBY6+xFPpI9cD3d44vGlWMftpfbzhP6OCGLyNtJ6RSCA59v9LpJRJB+SjisvT5aW7WZk12YhrTb/HtW6jcPi9bas3Ep9jYS0I/j+0y6ubKhaYgV+OSthAKrlhor8yR3QbnquUVi29+SMMZdbIvqc06PCUqclw1YhMa9det7d2TGLJc+KjSOIKUOWuDFOFYkB+hKkCyVYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB7925.namprd12.prod.outlook.com (2603:10b6:8:14b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 04:07:47 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 04:07:47 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v2 0/8] gpu: nova-core: process and prepare more firmwares
 to boot GSP
Date: Tue, 26 Aug 2025 13:07:36 +0900
Message-Id: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAkzrWgC/5WRQW7DIBBFr2KxLhYzYGNbVZV7VFE1xpCgxLgFx
 20V5e7FTtVdFl1+pP9meHNlyUZvE+uKK4t28clPIQd8Kpg5UjhY7oecGQqsRIPIw7TQm/Nx/KR
 ouRXO9arFnmTFcuc9Wue/Nt7r/p6j/bhk7Hx/ZD0ly800jn7uCinBoLK1sQ0ockhOq55MrZoBy
 IAWTaOlbc2KHm1KtO3TFc+/6whQlZKqbJVWFQc+0CnuTjYGey6neHh51KtAYiXbEhAV4D+KCkF
 CHoha6Db3zDH6NHsKicI8pbMfCWF3GMmfy/zJjfPnMWtdKTUKHi4jb1WODRiBRneLYquvY6ZN8
 Xs7xwKbsAfmF+CCO1fVUta6VbXYhcUPntaxbH+73X4AjHrC2dsBAAA=
X-Change-ID: 20250822-nova_firmware-e0ffb492ba35
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
X-ClientProxiedBy: TY2PR06CA0036.apcprd06.prod.outlook.com
 (2603:1096:404:2e::24) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: f34bbd44-ff9e-4706-4931-08dde4561da0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RnJ4VW5yRHRsYkl3cStQb091WUswRFBPeldvWExhRjJiVFpobXN4MVFxUG9k?=
 =?utf-8?B?VTAyYVVHUyt5TWFwbEVMMG9WK1VhMFhWVmlyZTZuYURNNTQ5MG9LdnB4bkY5?=
 =?utf-8?B?d3BQMnU3WDB4WmtQcmVCaEtoazF6MSswOCs0UTRkcmJRZGpMMk1vS21PZG83?=
 =?utf-8?B?SmRsT3FhYUpvVGFuczJBZlBJYk5Bck5VY00rRVhTdkMyZ0FzSWxIRUFwZjhl?=
 =?utf-8?B?WnNwQVlTQ01IOEM5RUtiZlNvWG0yTE9lMkNDZjg4S1B2UlZUOCs2NHdsZzRx?=
 =?utf-8?B?dUFqVGZ0bU9RdHk3YkFvTG1CZjh2WE1UeGNuUUU4dVRxbk52eUxpaE52Zko1?=
 =?utf-8?B?SmxKM3llKzZNRTNDTlpZYXNJcVZPLzNjYUd4eXpzNGpKME9VM0NtK0xvMjJ2?=
 =?utf-8?B?bTNhdUVIMW96NUFnTGxJbHVUU002N2ttcU9xdTUybFhnTzR5QUJET0lvaWNJ?=
 =?utf-8?B?TmRTcFpIMm5ZaDl0TndGUk5ucXJMSWJHZkNLallpSFpVYm9TRU1CVnUrblJv?=
 =?utf-8?B?L3V1UWVJWUJkLzIyelVOTEdCYlBWL25VOUd4cDZ1S3hEWEFFRktocmZmem5q?=
 =?utf-8?B?cmt0UGZaK3QrTnhTWUNOeGF0Z1kreGtoeTlYcjRNVi8wTFdPWGhPWGZKK25y?=
 =?utf-8?B?RlJhRHQ3R1ZmdUNjR1dkVzVlMjdqUS9YUDBmWjFsZjZZRHQ5MFZnNDhpMGUw?=
 =?utf-8?B?ME8xa3BBb0NUcnJEdG9hZnF4WDhuYWh5UUZQS1MxbjdMaERIeUptbmhrVk9k?=
 =?utf-8?B?Z2VNSkJUdUI0WU5NZmxqbGZOUC9HZXEzS2gyNnJwZUtESjZjL09Dbi82MkdU?=
 =?utf-8?B?ZFBnREoycXByWDZnL0VBS3FKdDdNdllWSmtOZnlGWGJhWUpLUklTK2tXOHV3?=
 =?utf-8?B?VTMvNWV0dlN1b0YvR3N0S0N1cWc0eHJNTExyeWl3dE5PbmgvdWFoWW1ISURN?=
 =?utf-8?B?QjRoNHZ3VFoyaXVaSGVUVVFSTzB6Ump3VHBZY05SOElPekRtUFZnM2RzZEJ2?=
 =?utf-8?B?V0htZHUwb2pVMUZ3NjEyZXpjZllLTzAvaWRhc0UzdDhvYVlLaFJocGhGcFB3?=
 =?utf-8?B?bjNqV05FaXF6cjdRVi9TczZmcFZOUWFtTWJlUlFiYUpmQ3hhZU41R2JBZzZC?=
 =?utf-8?B?M1lNbjhzOGE5cjlCM1lON2FLSWpJMElvU0dLYndMTm95OENQVkR6M3I4cXU0?=
 =?utf-8?B?TDc1S2hzSWhiRG9JaGl1RGVmcjgvRVpXZWpnZnNGNmdqbkpMV1UvSmlFVTN6?=
 =?utf-8?B?SmFzRHdtcjdtNTlvZDh4c3M4Sm5UZDRZbE1hVmRGZGdhYWlaU2R6SUtucU1m?=
 =?utf-8?B?bHo3L3Q4OUJiTnIxSDRRNGVtOTQ0TFFoL1BrVk83MTdzOVl5LzQrSTYwQVB5?=
 =?utf-8?B?TzVDbGtoejlQRHN2ZStQWEdjYXZra3FnU1JHeUZCK1l1L25PeVdpOUZXWWVi?=
 =?utf-8?B?UVhlUmZBQlhYVEJCOHN4eTk1c0ZSTnJ0WXRNS3RKT1JQdGZBK3ZuWFlVZE5C?=
 =?utf-8?B?aWxuOGxBWjFPKzFtelh4Mml5anBRUFAxRHBDL0FFQm1DRW9qS2RFbXVBSkI2?=
 =?utf-8?B?ZUtpNWtveUFBZkl1Ykw2NmJNQjlnQVBrMTdqSWU4YUVhWFZCRmdnNXorTnND?=
 =?utf-8?B?aThYVUVPUW9jbnRUUGhDN0FlckczRkp4QnQ5MkZpVlE0ZnhPR3RYVGJrREw0?=
 =?utf-8?B?bmdkNE8vclNEWm1BZ2NnLzVoNmVocTZ2eTVKM3c1NFNFcXZqWDFyak8zQkly?=
 =?utf-8?B?OFdtR0RPWWE1Y0cvOCs2YzNmRFIrbTR3eFFSYzBMOWtueURBZCtvSWIwbUUw?=
 =?utf-8?B?Z3ZoOHo3WDNUazhOUkhHQU10ZTl0TnYzNnN3K0Z2cG1PMlk1bFlWVytuY0RG?=
 =?utf-8?B?bTZsVWlQcTV2UWVwWDJKMUxhcjdlS3RsU0s1WXpMQzRLcmJuSHlpQ2k0OTZv?=
 =?utf-8?B?T1FwbStMTHVXOVpGZjgzV1JPcmR1MWpwMklTVEQ5cmxHUXAyQm5iQ3RRb1g5?=
 =?utf-8?Q?l41dPgU9+GPL3lxkKVEN00tTeQxepI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXM1ZTRQWGQ5Z0Ixem14Mm1PZ2JBUGZTbXlub2xCYnFZd0tCYVFVanJYdW1j?=
 =?utf-8?B?TVpkYUx2Vi84d0hMeDR2RmFCcjJ2dEtvemtYN2JGNDNHaWpIci9PZ2NPVXJX?=
 =?utf-8?B?eEtyNjBQbzI2RDNVb2hlaFM0ZUU4RmN4VytXaVRDMzZobVBicWtmR0cvQ2dq?=
 =?utf-8?B?alpvcWVWRDVlRWtYRHdZRHRadWd1Uy9QSFJpR2Y1QzI5dm1uN1BlT2hGR0w0?=
 =?utf-8?B?VFFmelZXbDJ4QWxiSmJ5c2VnbVRyRlVURk5RYmJiOHN0a01QTlVJUnU2bkZy?=
 =?utf-8?B?Y1N6cTNuTVdDK1lZSVg1Nmc5MXdvSFZhZkJkWk42d1V0RHVndXVIaXEyMzlX?=
 =?utf-8?B?NTRZNEVEYitra1gvZ3ppY25VZFZKRTRsMGhnTTJyekRTaUNOQlVjRmd6Rzcw?=
 =?utf-8?B?TFI4a2cwZWYzRVFTaFp0elN1K2U3TWlBeVdFVjdXR0hwQ1k3MXpFT2Z2cEk4?=
 =?utf-8?B?UjM2RUxiN2xwRXM0SlczREdTWkpNbnhnS0dIc1c4b0VCMGY4cElVMWg5VGt1?=
 =?utf-8?B?cnBzTXVsbGl0dDJUMTNUaVUzY3V3VjJaNTg3bjFmRm5JL1ZCUDFDSHlOd1Jm?=
 =?utf-8?B?aTI5VDZiUWhBN0JPbFcyMjY3NzhqQkJBMlB1a0xJTlpKb2h1Z1JpWHBuTDVt?=
 =?utf-8?B?NzI0Yi9FWmZpWUNaaGtTOWNqaUp6QnhVaXJBMlJ1THI4cTd5TVMvYXFySElR?=
 =?utf-8?B?T1gyWmhCcjNzeVpJb3RJVDFQQWJ2SjZzb0ZRSEZKRnp3TjNkQkFZRDlTaFdm?=
 =?utf-8?B?TjBpbU5NY0l3MEtmUXd0K3lMVEpLSDJpcTFEYStaTFJxbWx3TFE1dUNDWXZQ?=
 =?utf-8?B?WVo2Slp2eFcvWXpFV3ROSkNtUjZmQUFKTGQxL1prbC9kUUtaNDAwL0NlUXFt?=
 =?utf-8?B?OFhzdXE2WHZZSk1tTGdlWmdaTlF4bExpRWpILzZXelQzRW1pbUhlODZOa3V4?=
 =?utf-8?B?UjJyMnJEd3pYcW1VYzd4amVKeHdNZ2QxRjZvL3NDTDlYSmkzZi9WZjgwN0dE?=
 =?utf-8?B?U0FXTzRselNRa3dWaWVDSnZNQ1NTZmRyeElLQVcyNGVTMlZHUkdHb1drVmtM?=
 =?utf-8?B?NURDOUxycXVhNkpUc0pNWkYzZUZvNDZ1QXk0Kyt3TUtoU00wVlp3Yk4zUElk?=
 =?utf-8?B?ejJ3OSsvcW9VYXdWbnY1KyszK05BZjg2dGw4VkNvTjdBYUVTRTFRZmhISUpO?=
 =?utf-8?B?YjhwZnFTVFVpTVhLTVFUZkJNM095QlloR0R2dGx0NHhtaE90M3J3TE52eFZE?=
 =?utf-8?B?MWVSRm9mUXYwcEdDMzNVQlJ4cWFRUThCL1ROczZ1MmtQQ3NSM3JoM1pmZFV0?=
 =?utf-8?B?YldpL3lpM1dla3lGVmNKZmxsUFljMmJKSklEMTRyWUdoeGdySUJoRmlxNGVT?=
 =?utf-8?B?Y2RQT0I4ZFlDekl6Q2xOVkxPMmM4cGJzYzZnS1ExVHFGTW5UTEpJZU8xbkM5?=
 =?utf-8?B?dk1KUnozMVZNaDdaby9zY3lnZFE0ejRVMzFmRnpPQnBCaUJxR2o2RDA5V3NO?=
 =?utf-8?B?MXlZdkVpZTNqVzdXZVJrK1ZSQjJ5Y2JtMlRtUVA0b2RqeXlCZ2NWMXZ2WFdN?=
 =?utf-8?B?UUNLR3kzUDI0V3ZBMFJlaGV0ZlZqaVJOQllFWGFmZTFDWXZ4bzNEYncyR0hO?=
 =?utf-8?B?NUhYazFBQW9aajhVZ09YVHQ0ZmxBKzNUbWQ3MkpuUFo1R2NOOUl1Qlk1Q0Fz?=
 =?utf-8?B?M3JPMVZXVUtsNGFNRE1nVUZ6c0cvcmJTYXNiRTU4c1NpRm9EQVp2MkVybkhE?=
 =?utf-8?B?QnlLL0FzMlN6ZU9BV3IzcmZiWDBSYXR1VlFHaVl3amUrZFBUNXN1MU9nSDBN?=
 =?utf-8?B?UzB6WjV5bCtYSkhMdUxJeEcvU2FSNjlqa3Z5bG5tZ0E1NVRJWGphNmF6RDM5?=
 =?utf-8?B?b0lqdFlMa2djZXFpZDRzbTh1ZW1yNHhKY3F6dnEzYmF3SEFzSkd1bFBLMkk0?=
 =?utf-8?B?TU1mOGpqclUyV1RlLzRFSkRIVzdOOFBDNzMraVZxU2pZWlJRSVFMOHF0cWlr?=
 =?utf-8?B?YlRzdjVQN0hJVDlOaEVnb29GbFZpbm5aZDNSN1FVUFUydCsvcjQ3OWhZVm8w?=
 =?utf-8?B?OW9VREtiZTNTTkZkZVk1akZoa3RPRFlMTCtkV082MlBnU09VRGlaMmh5YjRZ?=
 =?utf-8?B?WmIrb254S0pZWis1aTRPVHJMVFpUYzZVUzB5UWN3UC9lM0tsWlU4OG1yWHJJ?=
 =?utf-8?Q?Ae0/GkOTxo9ZdGwneYorjBM/uTozmoMsjq1C/73H/hg9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f34bbd44-ff9e-4706-4931-08dde4561da0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 04:07:47.4807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JxrtmxvLrlUD/xDkRTNja5pCyUeS7mxwujP0o9jVTqjLnHiSR5Md2sYOKZg9eDBJoK3NiGsP7LRCFzEdv4UnMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7925
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

This series makes more progress on the GSP boot process for Ampere GPUs.

At the end of the previous series [1], we were left with a WPR memory
region created by the FRTS firmware, but still far from the GSP running.
This series brings us closer to that goal by preparing 3 firmware
packages:

* The Booter firmware, which the driver loads and runs on the SEC2
  falcon;
* The GSP bootloader, which is loaded by Booter onto the GSP RISC-V
  core;
* The GSP firmware itself, which is verified and loaded by the GSP
  bootloader.

There 3 bundles are involved in a rather complex dance that is made
necessary by limitations related to the level of privilege required to
load code onto the GSP (doing so requires a Heavy Secured signed
firmware, which is the role fulfilled by Booter).

The first patch is an addition to `FromBytes` that makes it able to
process the unaligned headers contained in the firmware files by
performing a copy. Second patch adds support for a header commonly used
in NVIDIA firmware files. Both are relatively simple.

The third patch parses the Booter firmware file, queries the hardware
for the right signature to use, and patch it into the firmware blob.
This makes Booter ready to load and run.

Fourth patch takes care of preparing the GSP bootloader for execution
and fifth one does the same for the GSP firmware, which needs to come
with its own device-mapped page table.

Sixth and seventh patches switch to the 570.144 firmware and introduce
the layout for its bindings. The raw bindings are stored in a private
module, and abstracted/reexported by the parent module as needed. This
allows consumer modules to access a safer/nicer form of the bindings
than the raw one, and also makes it easier to switch to a different (and
potentially incompatible) firmware version in the future.

570.144 has been picked because it is the latest firmware currently in
linux-firmware, but as development progresses the plan is to switch to a
newer one that is designed with the constraint of upstream in mind. So
support for 570.144 will be dropped in the future. Support for multiple
firmware versions is not considered at the moment: there is no immediate
need for it as the driver is still unstable, and we can think about this
point once we approach stability (and have better visibility about the
shape of the firmware at that point).

The last patch introduces the first bindings and uses them to compute
more framebuffer layout information needed for booting the GSP. A
separate patch series will pick up from there to use this information
and finally run these firmware blobs.

The base of this series is today's nova-next, but there a few more
unmerged dependencies required:

- BorrowedPage, AsPageIter and VmallocPageIter [2]
- Rust infrastructure for sg_table and scatterlist [3]
- FromBytes [4]
- The Alignment series [5]

[1] https://lore.kernel.org/rust-for-linux/20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com/
[2] https://lore.kernel.org/rust-for-linux/20250820145434.94745-1-dakr@kernel.org/
[3] https://lore.kernel.org/rust-for-linux/20250825132539.122412-1-dakr@kernel.org/
[4] https://lore.kernel.org/rust-for-linux/20250824213134.27079-1-christiansantoslima21@gmail.com/
[5] https://lore.kernel.org/rust-for-linux/20250821-num-v4-0-1f3a425d7244@nvidia.com/

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v2:
- Add some GSP bindings and use them to compute more FB layout info
  needed to boot GSP,
- Use PinInit in GspFirmware to avoid several heap allocations,
- Rename `bootloader` to `gsp_bootloader` in `Firmware` to avoid
  confusion with the future Turing falcon bootloader,
- Link to v1: https://lore.kernel.org/r/20250822-nova_firmware-v1-0-ff5633679460@nvidia.com

---
Alexandre Courbot (7):
      rust: transmute: add `from_bytes_copy` method to `FromBytes` trait
      gpu: nova-core: firmware: add support for common firmware header
      gpu: nova-core: firmware: process Booter and patch its signature
      gpu: nova-core: firmware: process the GSP bootloader
      gpu: nova-core: firmware: process and prepare the GSP firmware
      gpu: nova-core: firmware: use 570.144 firmware
      gpu: nova-core: compute layout of more framebuffer regions required for GSP

Alistair Popple (1):
      gpu: nova-core: Add base files for r570.144 firmware bindings

 Documentation/gpu/nova/core/todo.rst            |  17 --
 drivers/gpu/nova-core/falcon.rs                 |   4 +-
 drivers/gpu/nova-core/fb.rs                     | 112 +++++++-
 drivers/gpu/nova-core/fb/hal.rs                 |   4 +
 drivers/gpu/nova-core/fb/hal/ga100.rs           |   6 +-
 drivers/gpu/nova-core/fb/hal/ga102.rs           |  14 +-
 drivers/gpu/nova-core/fb/hal/tu102.rs           |  14 +
 drivers/gpu/nova-core/firmware.rs               | 204 +++++++++++++-
 drivers/gpu/nova-core/firmware/booter.rs        | 356 ++++++++++++++++++++++++
 drivers/gpu/nova-core/firmware/gsp.rs           | 117 ++++++++
 drivers/gpu/nova-core/firmware/riscv.rs         |  89 ++++++
 drivers/gpu/nova-core/gpu.rs                    |  13 +-
 drivers/gpu/nova-core/gsp.rs                    |   7 +
 drivers/gpu/nova-core/nova_core.rs              |   2 +
 drivers/gpu/nova-core/nvfw.rs                   |  42 +++
 drivers/gpu/nova-core/nvfw/r570_144.rs          |  28 ++
 drivers/gpu/nova-core/nvfw/r570_144_bindings.rs | 126 +++++++++
 rust/kernel/transmute.rs                        |  17 ++
 18 files changed, 1135 insertions(+), 37 deletions(-)
---
base-commit: 331c24e6ce814af2af74bac648d1ac1708873e9c
change-id: 20250822-nova_firmware-e0ffb492ba35
prerequisite-message-id: <20250820145434.94745-1-dakr@kernel.org>
prerequisite-patch-id: 0e1b1f9a665317ff569a37df6ff49cd1880b04f8
prerequisite-patch-id: 178b864e6d1b88ee299dcc05d1a7a4c89ec7ed51
prerequisite-patch-id: 7f72c4bfd0e5f50b6d2f8ce96751782894a3ba81
prerequisite-patch-id: 62fa6de7d3ae99dc54c092087bd716e6749545fd
prerequisite-patch-id: 3d14d56ca93b0831837aa26b802100a250adeac6
prerequisite-patch-id: 7a12f4b0e7588874ce589b41b70671dc261b9468
prerequisite-patch-id: c44763ec35c4e4431e769df088b98424cbddf7df
prerequisite-message-id: <20250825132539.122412-1-dakr@kernel.org>
prerequisite-patch-id: a9e008c179b1c2fbe76654a191e5018880383d49
prerequisite-patch-id: 363279599349e5efc7069a63b3f0574639e25418
prerequisite-patch-id: 4dd34d858514b7b982f4ebc85103a756205c3219
prerequisite-patch-id: a747e05834cdb8b8f727e1f7c8b110c636cadab8
prerequisite-patch-id: 24833689bdecd3fc7a604e13bfe203ccd2fca6f0
prerequisite-message-id: <20250824213134.27079-1-christiansantoslima21@gmail.com>
prerequisite-patch-id: 3ddaa5300963f6c069411c6431965a7a48107a8b
prerequisite-change-id: 20250620-num-9420281c02c7:v4
prerequisite-patch-id: 50077433250cad1cf60eb8f85c78e532ac91852e
prerequisite-patch-id: 021a41cd35f09790ec383521ecc9b4c167868732
prerequisite-patch-id: a1ec5698a198d4aad45432b50d42f401e3db6452
prerequisite-patch-id: 8565b054c432bcc9a3a0d0121a934c74ef36d535
prerequisite-patch-id: 19d008deabb88beb441d2398f120ecb426fbdb43
prerequisite-patch-id: 3bc0d2be065a900d224ff8c1bc4450abfe9eb2cc
prerequisite-patch-id: 5b4eb0f71fa2ccf662594819fa79fd932f4f164f
prerequisite-patch-id: 9058ca08cd149444b5f910e4bb4494a890d1a733
prerequisite-patch-id: 8804806f7cc605feddded0804eec8b8362d7b965
prerequisite-patch-id: f999cabde51824432a1bf60817518d1ce189eb76
prerequisite-patch-id: 49e15538e142f2e7dd4f1ba0cf2fd891bd265d36
prerequisite-patch-id: 2ecf9b1e26b5203065bfac4ccf74301b3bb4fbe6
prerequisite-patch-id: 1af6ec7c2ce8503fe476985f59949dcd150ee6bf
prerequisite-patch-id: ac72e72b3affece504bff76b60b88769ff200a2f
prerequisite-patch-id: 7dc0a6da8c9727d27250cf730f8aaf6dd8b3d8c7
prerequisite-patch-id: 31a0a2469de9ac965186098072753dcc749b40fe
prerequisite-patch-id: 7e6d1fc7cf910decf481d135a19b0add38da2b2a
prerequisite-patch-id: c72ab11e9346de71eabfe0e6466636d5ab15a5ba
prerequisite-patch-id: 3f236fdea8c4b33620d0f863fea573b46ab0ded6
prerequisite-patch-id: a8ab42d0c9c3c837bb4cacb02cef585ef163a27e
prerequisite-patch-id: 930a1f26364ed67e0d6b85c96251028fda43c80a
prerequisite-patch-id: f1bc1fd46145a66235ab7475463584e1803882a3
prerequisite-patch-id: 4a2fd7bd8d13dc2feaf68e0dc681546ce2ab3e40
prerequisite-patch-id: dd0df8d299dc0615a88cc0019f38bc09cee31ed7
prerequisite-patch-id: 56a45978f7b956c94ec66eecd4b438706d5174ce
prerequisite-patch-id: e9bceff31bbf653d2641194b97eb1c4e5d8b93ee

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

