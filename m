Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7FDC2E7BB
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 00:50:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C0710E226;
	Mon,  3 Nov 2025 23:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="D7lAsr7g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010012.outbound.protection.outlook.com
 [40.93.198.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C36C10E226;
 Mon,  3 Nov 2025 23:50:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f4SVbiShM9KhYNLFfPg/NfItib6Ls+z/wmPYEkuJKW0oowCFQJ7LWgru0y283etXUXqD4pQTarsIWxcy0LHNNCKELp7G0uZneXco8jwpyvRfMkCdGMH6odDDTGWOTM2DoAlTHLBIT5uYKQm2zwFTPwFqERLSbDXixMwO+VdHqJvSWHkAipo6Kyez1u45ZymAIFQWUDLfWt82m1ScMdTnHYepUMHcNMBubVQB++PrD8w0WbeGxjLXi1VJN9ZV653pzZLBvtpiZuUFm2+O+jLQKlyi89fFmWGlrvgLODv0r4LGjWOT5/GzUnpNUzagEJyZwwlO72u8xXaGoTZuHh08KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ewow2yVr0+iVEs7CaiICZtZnTxdJo/7AcX87ggY7w3k=;
 b=cG19hLhUSAib5xxi7pG+EpCtmcknDRbkYJ+3asMUBYJMAFTSWILiYEZJ3KZv8G8WSIXhLCxuZA8iTHKhGGStmiWXj8UiWB3en/7Xw+C0nfPtOGRt2TOQ6vHBuGcy8vIgEt0+/7S+kzRq5muO4uQ2omuZA3q3vHGuWowP0o/Qf+tShxQ6nv0nuQ5yZC8Tskoj7U6ViL6/awbtz1dPAW1A/mmHDT5nzxEqW46xmeue8v3u0r7Nv2s6mP5OiiZ6pnBoYf8XZKKNyj7LyzX3yoWOVcDT7e2bN4BtFNTGHXbe7HYsppJuDJ+8u0UDTFKwJctRXBYcP4jh0ZWMqaeIGJh5XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ewow2yVr0+iVEs7CaiICZtZnTxdJo/7AcX87ggY7w3k=;
 b=D7lAsr7gg5erGl/Yw5w/QMXQNmeL7m4RJlmavBzzk7UAMvjIUTCMdLYNZiXsPKvZFj3LE6A/kIgONS7gPlKWwpNIySMKtmAeLrVkGuT/NWQvi09QhFSlCVp78mzxVIV0fZlXJHCK2dQ3WdM3x7ePoa9zS7gI2DzSN8NOKbBR9JyvHmf3Zi6o5IjzvPHvN6Arzjnm29aoybNZikP/jR57B6osMLEOqBpt0pzhKdCSUua3vk3VSOR5xy+CdkPIE/FQH9OQD7YiP4IpTY2ZspaeN3jtP0k0c5AFE9UOHn0NytluBf2gwDUesE0QFXLeB/+sPsQ8uP2nwvay9ZYtZxPIbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB7898.namprd12.prod.outlook.com (2603:10b6:8:14c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 23:50:34 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 23:50:34 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Nov 2025 08:50:30 +0900
Message-Id: <DDZGO1JLDCCU.249NOQLOZBW6R@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 2/5] gpu: nova-core: vbios: use FromBytes for
 PmuLookupTable header
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251029-nova-vbios-frombytes-v1-0-ac441ebc1de3@nvidia.com>
 <20251029-nova-vbios-frombytes-v1-2-ac441ebc1de3@nvidia.com>
 <20251103200416.GA2097762@joelbox2>
In-Reply-To: <20251103200416.GA2097762@joelbox2>
X-ClientProxiedBy: TY4PR01CA0122.jpnprd01.prod.outlook.com
 (2603:1096:405:379::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB7898:EE_
X-MS-Office365-Filtering-Correlation-Id: e5a47d6c-a1cd-4d90-d24d-08de1b33c7c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|376014|7416014|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2pZQjB5T1J2ZGRPQmQ3R08xSDZWNXNHWmRUbjFtbFYvL254MGlZdk1KQTRk?=
 =?utf-8?B?ay9XbGVXYSthTWJyckZnaGk1d09TQVNZNHNLbERYS0ZaRjZGcHErUmx6TkpE?=
 =?utf-8?B?WDJGWDYwWlpKbGl5c2h4TGJlbGRyZXJKdlJOSms1ai8rNzFjSTZteklCTGFv?=
 =?utf-8?B?UTV6QlI1K3JyQ1NvWStSNzRJS0lCeStzL1lOdHBrTWNjUFAwYXhkcytRNFlG?=
 =?utf-8?B?S0MzaGczRWVtT1lWd0NCRytUNFZRMlFCMkQvb1V1Z3dFa2VhR3gxejZSMzBk?=
 =?utf-8?B?L3RoNHZNdlQzVkdhd3NyQ0ZJbWRjSHg4YzkxNlJySGcrZWdhS0NwdTFNU3VK?=
 =?utf-8?B?ek9jS1BHekFhakFzUUllWGdCZWtDckJ2OThLWFVXZ1oySFVXRGVFVnlXNFNL?=
 =?utf-8?B?SktOaU5SREZrVEdqeGM0US9JTHFReW5MRzEvM2RObVJ2YUZkYVg2NVlLVzQr?=
 =?utf-8?B?eTU2enpESGY3SEc1Q09vR0RuckNka1NxVU9MZ0grWmdkeFptSW5aZG9CWkhB?=
 =?utf-8?B?dlZRTUxUbjBYT29IblpkSDZseUhwSWJ5SU5sT0djRXJqQmZpUThqQWFrMFpw?=
 =?utf-8?B?czlvT2JKRDZNR3VtSkxENzBZMEFGVkZxQkVEalNnMG9FdVROdVQvK1NJcGdM?=
 =?utf-8?B?QlMwYTJxdHRROHVEWnJMd05oemlRM0dKbXY2d3FReDhjRlNqNjlRcjdTN1FC?=
 =?utf-8?B?Z0RBbUE4UDZIOGFZcERaVDhRR09hQzJ2ekhKOW9RYXB4MUhzbDB3WmJYRkdk?=
 =?utf-8?B?TUNtSzBFOUNvcUNzS0pRcHpXUnJHeUk3cWkzcGxPUCt2aThFYWs0NC81cm9O?=
 =?utf-8?B?cEp2dzRVb0xwVWhtck5mbUIyU3d2TjZrS0NGaU9Bek5OUWdtZmhpak5PY2tJ?=
 =?utf-8?B?YzliSTRUZ2E5U3BJbVprSXNoaERJdlJDMHZDcHlLZEFxN2RjZy9Ua0t0M1hw?=
 =?utf-8?B?Sm52S1ZmbXVlWlhIVzIxR252TTJUY1EzOTBVak13RkQ0Z1dWbGtlQWJ6Rysv?=
 =?utf-8?B?U3paOGJZa2o4VjV2SlcwVFFWK2grVGJ0bWhlS3JiU2gvQy9IdktGSGJsQTM1?=
 =?utf-8?B?ZzBxYVRQOWNtMGd3U3QzNjVxSStTVDcyd1BlMkNSb05uaWtkclhiMHg0YjEy?=
 =?utf-8?B?RVVXT1BYb2I0SFdKM2JBSkNWdnNaN2I1SjhmQjRFY1F4VkxNZmJVY2ZCMjlR?=
 =?utf-8?B?b3Flcm9Dcy9qV29pS2ZEakdtV29ER084TmhDV1V1MHdTdC9jWjdOK2dtY3Vz?=
 =?utf-8?B?VzlXZWRpZng4bGtJbFRQcFZFRVRibGFNcnRsN01vMXhZQ0JtRHl0ZnV2cUJs?=
 =?utf-8?B?eHMyY2QrNUtRTjZxYzVaYkZqT05yM2xQam1CSkdkaS9vbFBxcHJ1LzNKWFAy?=
 =?utf-8?B?NjVFN0o4ZllDTEZaYncxK1Q5VnhBdk9sQmhqMXFJaG5TNjFBa2UrUGdRelBC?=
 =?utf-8?B?bXVvV1p4WnVJRTdxa0pld0lLN21YZWpUeUhrTWhtc3B3MFp5c0gxSXlCRm90?=
 =?utf-8?B?dUZhcVQxbGNIUHEzSE51YnlYRlhyeURPZ3pSUG1CMHhTdGdpOUttd0ZOL3Jo?=
 =?utf-8?B?ZzBzMWpRcFlZN3R2OFhZZEZvM2RnNVVLTTIzNlBFZzI4MS9aaVNGdk14QWM5?=
 =?utf-8?B?VWQ4RldERlpVWjBjdkZCVlVzSW16U1BqaXlRK3MvVVlubm1PY1JzRGxBdVIx?=
 =?utf-8?B?SCtLM2dVQW54WityeFV1V3VsVWJFcGQwVStralN1K3BkaEQrQVIrZHhLalhM?=
 =?utf-8?B?Ti8wTmt4eFpCbU44R2R1T2p3bENKZDA3UW1hbHFKbmNEck1HYUN5UXY4R1NO?=
 =?utf-8?B?UkhaNi91MFdxTk1ac3RBSUtEOWtLRFZBOFliOHplK3hYQ2tpMGdWbE5GSndJ?=
 =?utf-8?B?ZGkrZ0ZpcE9PUlRBNkJDQ1QxcFpWRWVpWWJOQlFoYlNWcHNNOWpkTVBDM1c4?=
 =?utf-8?Q?2SqseYtpZwP9dQlE39ynVWftXQ7dA7JJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnZCOTVhd0EzSXh2anNydHpmN2VVdkZKUjhaaDZDM2FXZVJQRTJWRG04a21X?=
 =?utf-8?B?NVBhVDc0ODRaNEFZSXNzVXJranBocGgyakNvVGpmRzQxaGJMOGtpdWVVUkZY?=
 =?utf-8?B?M3htMXdFNm91eGNwa3V2UDg1NXpyL1p1TnJ2ekhTR0xVZEVXeFR3aDJpY3J3?=
 =?utf-8?B?UHRxVWtMMmowbkdHRHczRDBSTm0vK205bGRkeis3amx6NFdqUU9TS0J4RlZp?=
 =?utf-8?B?a3d6VE9NTFdUSy9JamRKVi9uc1NjUlVYS3dyS29aeUkxNmFFQVV4M0RhWGJD?=
 =?utf-8?B?cmlkYlJWNy9DTkJLU3JwQ25ORmZXdW40NkNyWWY5RlBHWWlwNjhsa2NLTE1z?=
 =?utf-8?B?eUtOSVhZQ3JFQ09kZkEyNlBGSnRTQy9RQVpHVlFmZmt1YTFSMUxTMGwySHN3?=
 =?utf-8?B?cFdVY05INHlydUVLSzlaT3ljNVB4dFlNV1RZOGNzdUN4bHUzdTlNOVltVVBB?=
 =?utf-8?B?N0R0THZmdk96UDhmTXF1SzNqSGVBSGNnUHVJRi9MTTd3UTY2L2k1bHpSUFg1?=
 =?utf-8?B?Q0V1R3JVbXhnTnhMUTVxdEtGN1QvZW16cFpIdmhSRWZBTzNVVEgvNHRseENp?=
 =?utf-8?B?ZWxmMXl1djc3ZDU1a3FHQTNhWjdkOFE0K0JPU0tydnQ5RURBZzViNUF2QXgx?=
 =?utf-8?B?UVk1Mmtqb3JSODMvblEybUViUEhMZXJ1ejJWQUUwV0NqUVJFMzM3Tmx3RDRv?=
 =?utf-8?B?ek9wanRCUUkvcnVWTFVGS2pzR3pKZVBmek1sODVPQ0pnSXlTS3ptSnlkak05?=
 =?utf-8?B?b1pXY0tKOUNpeUpQNTZ5N0Y1MzlpZXA3VlkzckloKzNYcDBtandkN1FyK1RC?=
 =?utf-8?B?em96cDlXMTRubzFhVlFiUVRmY3pxR0FYMHAweW80bXd0dE5PM29aaUExZlE1?=
 =?utf-8?B?SjVvZzJycHhPK3h1S1BDVVN6dStrL0RXV2cwSEpKbkVoLzZKRVJKeVNOTWxS?=
 =?utf-8?B?TXFIa3Y5cS9lQitaQXBKcTQ1ZE9QbE5xR2RiVzlNT1NHbXVSNURxRWdickl5?=
 =?utf-8?B?VDBYTHVEN1o5MnkySDV5clZzaTlDcG9XZGI1ekZ1Z1EvNUF1bDJEeVZlWEtr?=
 =?utf-8?B?SWxGZWNkczRGVU9uby91ZEtBRVNSOW1Ec3lCSGMyZHZURDNwWlBSaFQ4Z24y?=
 =?utf-8?B?S1NHR3ZGdEwvSnlDbitiWFl1V1NMMzI3TXF2bnB0NVRkR2ZZQWVRc085b2Zm?=
 =?utf-8?B?dVVNeklNek5JTFF6NnZUQWJNcEhGSE9BQ3ZxclRVRk5XSFdwN1h1aDFEWWts?=
 =?utf-8?B?WVNBWkpNN2xaWUFXdG1XaUE1MXFhRGZFUWxzV3dYUHVWUXJ2UXpJTm1QaXBJ?=
 =?utf-8?B?U29KeSt6SGswTVpxVFRjY1d2V0hzUXk2Z2FaVmhpQWVjbmhhNGkwc05wQ3NW?=
 =?utf-8?B?VktMUi8xRTlhMUhlY3FLR3h1dmRnRDIzREJsdS9KUmlFWXhlczBUWmRPUjQw?=
 =?utf-8?B?UzRTN2pqNkt1ZlhsTUhKRUJDNGVmSElIM0ZJNEFPRUN5eVVtVUNKWExBSW9r?=
 =?utf-8?B?azFKN0lpeDRBQ1d5TVhCbXMyTStrK2gyU3ZaeXlJOTNRN0dINzJTT0JJa1R2?=
 =?utf-8?B?WHdheE9ZY25iZWpPS1dueFRLRlNBRXdiMTVZYUJTNzdGWVZDNXd5MEhHbWp5?=
 =?utf-8?B?djB3NHJCNFdmaWlVMDh2a1I0alRRL0ZXV0l6OWN2N25hQXNUK2RCUVdWSkti?=
 =?utf-8?B?TnRqS0NtRDZzZjhsZm52eDMrZjFLcWxRaHcwVTkxb2QwSjU2TFEya2prb2Fp?=
 =?utf-8?B?RGQ2Zy9KMXV6QWtOMFZJejZGTEFydlRTRlhHL0k0anZmVllBYWxsZktiQVhr?=
 =?utf-8?B?azNuWDhxOEhRSFQzRFJRQUdwVlBTQzlZR2RnaSs0aklobHZZa0tZZ2p5STlP?=
 =?utf-8?B?N1drTkxPbXNGeWVoNlVNd0hyWUE4RkJTWU53VTFndU42TXUyVkI4eUswS2R4?=
 =?utf-8?B?U1luNnFFcmtBR1lhUEgrZmVyRkwzVmVIRllKckxxM2ljem1jTFJnT1Y5TDAv?=
 =?utf-8?B?L1V0bElIdzVCZStjeGNrZzdnNUMzRGl6Y3d3b3RyZXp2ZjNZaW82TGdWajlq?=
 =?utf-8?B?Nm5lVElBSDc5NXhCV0kzQnRKUU5VeklpMFZjZjdwdUNiRktGaGpQQ3BiQW9U?=
 =?utf-8?B?Mk01SzkzS0h1MnVWZkU5Z0cxanVVZGZRa0JwYkI4MHQyTzExNmI5VHpMY0o4?=
 =?utf-8?Q?Ol/s4unWjwtz2DrsHxhUABpkSTF4dS0Ohg5EW2YeQ/aA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5a47d6c-a1cd-4d90-d24d-08de1b33c7c5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 23:50:34.4411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fkBXIZIX/9oClsoCqdF+iOWhFf0kY7y9GKzYx3V7AIe/FcLHBWIl+zOYmf3XaIl8hS9gVI8cZxPFqVRUUQkBkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7898
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

On Tue Nov 4, 2025 at 5:04 AM JST, Joel Fernandes wrote:
> Hi Alex,
> Nice improvement, a nit:
>
> On Wed, Oct 29, 2025 at 12:07:37AM +0900, Alexandre Courbot wrote:
> [..]
>>  impl PmuLookupTable {
>>      fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
>> -        if data.len() < 4 {
>> -            return Err(EINVAL);
>> -        }
>> +        let header =3D PmuLookupTableHeader::from_bytes_copy_prefix(dat=
a)
>> +            .ok_or(EINVAL)?
>> +            .0;
>
> Can we change to the following, it is easier to read than using `.0` IMO.
>
>  let (header, _rest) =3D PmuLookupTableHeader::from_bytes_copy_prefix(dat=
a)
>       .ok_or(EINVAL)?;
>
> (and similarly in the other patches).

We can use `let (header, _) =3D` to make sure the unused remainder is not
bound to any variable. That also turns that statement into a one-liner.

Thanks!
