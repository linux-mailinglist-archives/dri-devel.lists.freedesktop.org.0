Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F6CC33C30
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 03:26:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 100AC10E6A2;
	Wed,  5 Nov 2025 02:26:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="aMiLjPSr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010071.outbound.protection.outlook.com
 [40.93.198.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A96B10E6A0;
 Wed,  5 Nov 2025 02:26:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D5oZqAbcyrgWyVXz7sNc2qmz9qtjaLrImGC8ZRvEkzojGuYpxOmJnDLcn6mCyBgfDJIFCYMAuXR+S/vNYTrFlJWWsIpzG5F0gyRR9YytCf9H9WezdQpqyKmeB0WUlS0yF9hQRBqH1xSQPu9IsrSxCP8g8cBu92cZnQ0wAHxbdNNh93Tj+t3tZQuUarH93eXLy+8ChXNY85rZRkklVK2dCA2ENiXuvs5KEWu+6X6n9swTt3TLj7Se3EzZG0PjIu/7ebtQw9iim1xtt/YwoqaXKdfjXzmWSVDHLJTtea/UuGOQ9BcfdRNXP5tA7MNzGuxi9b5MYz+smbEP684rtsmOZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jBH4Ogd4M9shLHmDEDq4nVRLWPr/bn7dhe31O5DLbw8=;
 b=bmznViT+HVmV3nKNETtZga/OsIj8gsFSG1NntHCQVpb43bvGD7wwtXOBEJH1QYMemRUm9b3Hwe6C+b0QbM+UJR06VRnDNlGEABdyuqvFFWLDkuxO+rxd0+Z9hSx1onoWPxdWs6NSR3EkYK4rdhpC6OZ9GdriE4tYRb3jvgoHyGESeN3ZQVLBLlERbChjAtsngVfxKj+WFGjJfC15tL3HSj0Uxen6x8UM8nSTZcS91DgYGLOvgQeuXVuwZXV1mcS5k+dMJOaK2llJIl7uwGY7zLgvpn1jdnf7Ou8WBqhsr3zASb7ei2Wk2TLXVtPv+dbUpleDXNms4tbQAIRTrkdyQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jBH4Ogd4M9shLHmDEDq4nVRLWPr/bn7dhe31O5DLbw8=;
 b=aMiLjPSrS32s6jkikVJlBuUPWUfU49t4XbIULYHyJTBLN2214m2lwwYxJCFuleAJAAif4hrXlSAIwgzkGW8xcUCNsN0CFOVzQnlfV+WEVxR/BLsczWW5+NMPQDjj+w/4PVLQqpep2N0VTsox9g2uRs/d5sj9yIP9Uw8sQYmodRVLh5ch/ILYR8klXn31qYeeQLvMSmQXTxo/YX7D95iFdijfw6jvcMJES+MmFCGfSEh6E4IJaLEoNLQPQ7fvfwmfmN1tLaRswli2OoXbdeh1t/Jbw1b6LA4u4xwYuR4zyjFHHVTvptJDREvXWro0h6kQuSAhsgW++OBr9OQ5UeYEcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by MW4PR12MB6876.namprd12.prod.outlook.com (2603:10b6:303:208::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 02:26:04 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9298.006; Wed, 5 Nov 2025
 02:26:04 +0000
Message-ID: <6c4d9e44-6ff4-43cc-a5a3-9b0cacf829b4@nvidia.com>
Date: Tue, 4 Nov 2025 18:25:50 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] nova-core: mm: Add data structures for page table
 management
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <20251020185539.49986-8-joelagnelf@nvidia.com>
 <CANiq72=SSQ5nSjt9yzX_A3Tgo2ByGM5CV0VqFnF1cTOzrZ-pbg@mail.gmail.com>
 <02d37e88-8bfe-45ab-86da-0afa98fa1ebe@nvidia.com>
 <CANiq72mR8jpsi4ekNWM3CZCtVYinjFjUhhnGtF+cNn+Q2qiTOw@mail.gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <CANiq72mR8jpsi4ekNWM3CZCtVYinjFjUhhnGtF+cNn+Q2qiTOw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::31) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|MW4PR12MB6876:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bf6c1b3-b11a-4df5-45c8-08de1c12ab5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aEFzQlk0MEw5d25zNHduR1p6V3lOUjRsMUEvM3ExOVFxRjBkODR2Q3E0NnVu?=
 =?utf-8?B?S1Qxb1A0SDN5alRzZkVhSCtSeUc4YlNSSUZlbkE4dGlUNi9RQUJlOGN0ZmFm?=
 =?utf-8?B?dVpJa2x4ZmtibGFMNzhvWm1vMzZYYURlMFAveTZrSEJZc0Ereit4RjFQblFO?=
 =?utf-8?B?Z3dsQTZVbTgva1FhYk9BRk9zdHlhaU5jZTlVMk5sSHdveWtNSVZUSWZYNVBs?=
 =?utf-8?B?VnZJUWc4U1EyWThEYWp4aW0yTVplZ0YzVjF1anorQjNwVFlWNm9IMHJ0ejFD?=
 =?utf-8?B?OGRUY2tkOXVUVE1xV1d1KzJYRjZIRTU0Q3NtNjhqSzhtTkl0TWRmWnJPVm0w?=
 =?utf-8?B?cHU2bmZReVRnOWJ4cjNoMG9qbHlxTk9tQ3hqZ1pqSW1SQmM0UFlFY0VuVnlj?=
 =?utf-8?B?ZXNydEN1VW9jeHgxLzRndVQ0VjRNNGRCRUFSYytBWXR1NDcrK1REamJQSFZL?=
 =?utf-8?B?TTg4RURsN2tONWJ6QnFUcEI0Rmg2MDMyUG81ZzJWWHczNXYxa1NBRlY4c2lx?=
 =?utf-8?B?SnE3SXJEM1VVRExxRjFRb0ZRUEZmc2RNTDBJSldKQ2laQlpMaGNVaUI2SnlI?=
 =?utf-8?B?ZzhBQ0lqbUZtTmlmbFpqRlVDaE1mcmhTaUplVzdiZDhheWdFQko0a3RRcGd3?=
 =?utf-8?B?ZEk2aThqL3JhTHBtL2ZMQjVSUzdycWVDQ2NFRi9JSWZ3SXd6NUFQdUpjMDFm?=
 =?utf-8?B?ZVhMN3hSemNreXpRNTlGclE1RnYrT1BxZjlMRzhSeXk2SEZpNE8xVFNDUHVG?=
 =?utf-8?B?bTJkZDhMUGVHUU9zS2EzcHBmRHZadUQ1OUNUUm1KNkdKMUs0bTY5Y1l4YkFs?=
 =?utf-8?B?V3ZvZk5mRlc1b3p3a0tNL2VuOEFBcHRWWERjTmlIc2xVWGlJTFNabldjQlBC?=
 =?utf-8?B?VmZtQThMYmNyWnV2SGV3RmExZTlxREJTdnliRE9sY3NUcmNHamZGT09WMEgz?=
 =?utf-8?B?S2YwTUlZLzVOWUR5NjlmckM0QmVET3BibUp5MVlLQ2gyZjM0NGl0bUNsZHNJ?=
 =?utf-8?B?STB4RjFqbnhHcmF6TzhpV1lnODN6Y3hvRzlrTGpFSkpNMm00dWlMNUhMeC81?=
 =?utf-8?B?Sm9pWVNHSHhMRDNsckJSOGhkeWpRTkw0NENUL0pHY2xORGpaZ21VdTZEL3ZY?=
 =?utf-8?B?V1NNa0YvMVZRUEhvNVRVUDBoMW1hYzh5N0ZvUU9NczNBVEVzUDk0bUgveUw5?=
 =?utf-8?B?N2svUTYwcXQvd1l1MzF0OGl1a3NwQkJEakk3cXM0N0JqSGkvbGNpdFcwNmJu?=
 =?utf-8?B?K2pNM09IOXJkYjREdUFhUmZVem53VjkrTzZxVnZBMW5PTDljRmw1Lys2V2ZQ?=
 =?utf-8?B?OHRGYnlLbExGUlhINzJweVFldjBhdUErT3pyeUNKLzFRcGxMbS92N1JYUFBO?=
 =?utf-8?B?V3BOWnV6WW9PM29XV1JaME5kc0hBU1dpVlFLR0U5L2xlcjA0V3JuYVFUVzRI?=
 =?utf-8?B?Y3VteldkTlhHQU9WYjUzRXE5U1gveDZic2lLRjU0QWdBZHF2SFU1Tk9XaHZF?=
 =?utf-8?B?YVJDcDVlYnlMbnBUMGFKbllvaWdnNU1vMjFseFd4VU5waDM0ZFhoY2JCV1Bk?=
 =?utf-8?B?eDFudjN4KzN5dE82TVBXMHpEOVV5ZDhZM2pCQkpYYVRyZlpEai94T000TnVO?=
 =?utf-8?B?RVhWRkdIOXo1dFc3SmJtc2FUN1UxSnBkUVZpWlBhZzhLN3ZEcFlmaFZSaXgr?=
 =?utf-8?B?a255QXdha3d4eTRlWVZKbktTU05mcWZrK2YxRHlscm1JMi9rRjNKOVBJU2cz?=
 =?utf-8?B?OXM3ZFk0VElhaitHVENpRGxoUEZBOFVHNDBHV0U1WFlORFdZZ3pka29Yd0NT?=
 =?utf-8?B?M29BNFZaSnA0V2ZQWk5iZW9uaC9OTmpTdUUrWm94VENHaUZlVlFKdUZJMkZK?=
 =?utf-8?B?V3V2NTJubGJmRmtEWlM3ZWpCQzNLWDBTT0VHQmVtZzZlYlVob2ZUM2RLazRV?=
 =?utf-8?B?TDlZUTZmSGhUMGhnY1ZTZU16ZER4ZGRLY0Y4anNJQzlrRnFDaERWbHd3a2VM?=
 =?utf-8?B?NVhVemVnb1hRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUFxc1lEVVBEaE1aSFRnSGZjSURyNStzblJ6UHExRGVjd3BtSlBDZDJQdW5W?=
 =?utf-8?B?bzlHdzBWckE1NTE4U3luZFYrR05ibnRjSk84NlhGZ215QU9sUnh1RWRaL3VU?=
 =?utf-8?B?dXJ2aTM2YmZ2T0lvMWEyeFlWSFh5Q3dmNFR1THBIZnkycVhSMlFsNTJiZlho?=
 =?utf-8?B?ck50am80NXhuT3MyVmh5VWlDa1ZSNEs4dkxmLzNhaXZpaENkSURNSFVCdUZM?=
 =?utf-8?B?SmFsc0Q4TTlOME1kWlR0OStSNzRXV0pLd0Y0UHBrL0VobmsvdWNqTDJ6MnJS?=
 =?utf-8?B?NHRjZlFkYW9VTkIyQis1UkU4dGh3VVdYd3Y1MnBieFRScXVQUkhHa2hBYlp4?=
 =?utf-8?B?MkNjTEFYMnFtY0RKOFNqV2lmQWRsbWMrUGVnaE1wSUkySVM4YllObHFXbjVt?=
 =?utf-8?B?Rm9BSlRFMUo0cUdSeVN0Z1RFTVJEdjYxZ1ZYN1JldEV4ZW1iQnVEZGQrWXZu?=
 =?utf-8?B?K09FVDRCMjFIbWlybGkxajNQcTltM3JXaUpNZVhFdFRYRDFyejFTOUNCRW9M?=
 =?utf-8?B?WS9GQnQ4bDlQbzU3SW80MVJRVVNaakNxbTFDYzNhdENJL21ib3ZhOWMwRm5s?=
 =?utf-8?B?T01yOTVjSGEzb3VkOCtJMUZoSEhEcGJmWXFMRzd2c2hoNnZ1blc5VVJ3WEF2?=
 =?utf-8?B?YmRhSHRabVN1d1RhcmlDOTArdWYxRnNRU1FMM2c3Y01wWFE0eXNHNzYyK0ls?=
 =?utf-8?B?ODFGNUQrSC9tZmptYm4rYy80cmMyVDN6Nm1tbnZtdmNjOWF1bmt4WUljMW9T?=
 =?utf-8?B?T2RWbWFjeHBCSDkvQmdhWEpJQlZKcy9MUk43akNYQVg0NEE2cGJXcW5sUm5v?=
 =?utf-8?B?YjFMdDE5WlVFY2VXWFhuN2Y2R01UUkYzTndFcWxZVjhBdks3anFWdVIrWVBL?=
 =?utf-8?B?WVRtMU54S2RIa090N0NGeUVhbldCSGkwZnZacUxydXhHSURJK09mMlEwaWhy?=
 =?utf-8?B?VzlRTEVPcjI4ZU1VNUw3dDVndnJWaThYTlllT0ROeWVWUnJ1L1Y3RjlkQ3BN?=
 =?utf-8?B?TGRObUxXblpwTHd3WFI4VG5XZGdwMjFFWEprY1ZWVHJtQXI2b3d1VUV0SmdG?=
 =?utf-8?B?SlZwTE1uYkgvTGcvcFZ1VWNDb1ZSYW44RTh4UTRTL2g2UGdMWXB1SzBaV0ZM?=
 =?utf-8?B?TWlUbWNKYU5COG1LOElnTm1vUTJJckxBdVJpRkI1ZWU3KzR5bHk5c3hpcHFG?=
 =?utf-8?B?eXRyamdvb3VNOFVzTmJCNC9lSEtnQ3VEcEdkaVRtYzJ2QnUvdEdBY2tzYVEx?=
 =?utf-8?B?SGhNT2Z0NFNXN0JiYjlJVHZjamFlSFl6NzF0VE9BM01pRERaT2JWcHN1R29O?=
 =?utf-8?B?b3RRUW9PM01sbUJsRnRBbGdSUE5xTEJwVGxYdTQ2R2RVVzBIdEdSU2NpZjM0?=
 =?utf-8?B?VG9Ocy90SzcyTjFqU3ZmeHBIS0VBNFkwREdOOXpPRjZkOHppdCsvMFZuQTg1?=
 =?utf-8?B?c1pUZTc2MjF6TzRIWEZ3emVpSk0yRW85Yndpb0d0am84eXZ6TDRzOG5hT21m?=
 =?utf-8?B?RG90aFI5NGU4aW85VHRXdGM4MHk3YjBwQVhWRTAyazArV0ZzL29mR2NCd0wz?=
 =?utf-8?B?OUxWRENqNWY2NTBFaHdTcjFtaGNPWUZjMHA5c3M5bGZnMFlZcHpNNnMvRTVZ?=
 =?utf-8?B?K1IvVzB1bFlZRTRpWWExWlJOTjJiT0lrMEM3T2c4MkE2MEl5K1RtVjFtNEVS?=
 =?utf-8?B?OVBxM050ODdPOXRRcnpiMlBiZG1TTWN4eUFqV2dTWXNudGx4cDZHT3ltVkNW?=
 =?utf-8?B?STVkVTB1RWg3bFpzdUptWUxkYS9BSlFuV3h3M2VPY1M2VDgzYm5hMkxBalA0?=
 =?utf-8?B?Njl2S2F3bk80KzVSR3dkV1B3NzRIQU9iam8ydG9BdjlCeXVyRk1weWF0c1FT?=
 =?utf-8?B?QTVrWCs3R0xIenoybzdrRFQwVWRveHFYOWVVSVgrLzN0SzZMajhva0J4V2JR?=
 =?utf-8?B?dkFxTTRaSjZSTm15WHNkbDU1bXlnWUVLbERZc2dObnB0MndFV0hyWlh0aGRk?=
 =?utf-8?B?TzZHaURLcDhvckVZSTBGZE92UXJVdU1IUUFlOVBPL1ZvS0dwdEpOTTRmNU91?=
 =?utf-8?B?WUZ3U0QyZFg1cXJyVTJBOUdqS0syeTZMZE5UNUxGODhFVS9iOFQ5SFBPTG0w?=
 =?utf-8?Q?SCspa+FKNteFQMP2H7cxOIjAD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bf6c1b3-b11a-4df5-45c8-08de1c12ab5d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 02:26:04.5541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n6gJW4//IcOZvqwJW8G0vR2GKYo7YRGQB3BDX9HebR59Y3aGgTGJ6fO/0/URb2XpEt2sZOUxGpfqA9cZJLi96Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6876
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

On 11/4/25 9:56 AM, Miguel Ojeda wrote:
> On Mon, Nov 3, 2025 at 8:29 PM John Hubbard <jhubbard@nvidia.com> wrote:
>>
>> As Joel also was hinting at, is there any easy way to get this sort
>> of thing automatically checked? This is what scripts/checkpatch.pl
>> helps us out with on the C side, and maybe it is also the right
>> tool for Rust...?
> 
> We have a few patches for that script (including for at least one of
> the things above), but lately I have been thinking we may want to have
> a different script or tools, ideally written in Rust, to encourage
> contributions and reviews and tests and so on.
> 
> Moreover, for some of the cases above it is better to put it into
> other tooling like `rustdoc`, Clippy, `rustfmt` or even klint,

rustfmt sounds like a nice user experience: fixing things up
upon file save then becomes possible.

> depending on what it is -- over time I have opened quite a few
> suggestions and some were implemented and work great, see e.g.
> 
>     https://github.com/Rust-for-Linux/linux/issues/349
> 
> If someone wants to help with some of that, of course, please ping me!
> 
> I also had a bot I wrote back then when we used GitHub, with quite a
> few checks (especially around development process for newcomers to the
> kernel, e.g. using the right SoB and tags etc.) which people seemed to
> appreciate (to the point of someone mentioning it in a talk... :).
> 
> A long time ago I asked about making the bot send messages to the
> mailing list when we migrated, but it wasn't OK'd back then. I can try

I'm grateful for that. I think tooling provides a much happier
work environment: you can run the tools locally (and we can put
than in a submitters-checklist.rst), as opposed to getting an
email after posting.

> again, or perhaps it would make sense to make it send messages in
> private.
> 
> Finally, nowadays, I imagine an LLM could do a reasonable job for some
> of these as well, if there is available AI time somewhere (please see
> my reply to Joel on that too).

Very true. I saw that. Yes, once we know what the AI should be
reading for instructions, could help spot issues.


thanks,
-- 
John Hubbard

