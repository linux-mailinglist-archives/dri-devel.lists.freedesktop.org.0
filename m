Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1468C7DB9E
	for <lists+dri-devel@lfdr.de>; Sun, 23 Nov 2025 06:13:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD9510E11A;
	Sun, 23 Nov 2025 05:13:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uCTFCeQK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011045.outbound.protection.outlook.com [40.107.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608DC10E0D8;
 Sun, 23 Nov 2025 05:13:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IrJ7QMQA7/u7we4GNQM0bSPOTzZhicnrfS0cOZrF2UCFbhmiySarpWjLImfPY9rWngy7rL8iF3gVt+wFusLYqF3muL549mEInj/oES4aWZ1zhq9u7D/Frq2mNOM9XEY82V+1iEtcSNDW8BqVAntW5fD1OWV8eAL8cfrnemOfABM8CUfn88pFElHgZzu1RXS+rm6Lh3QhMzVKFL7+9ZL2C0uzDqIJo4bmV2i587qNOGx+PVt5VuneHT63f2eUjdVcC/8swhOcETXYXityiM/D7aG1fucQifZ9p44RHqyKovErth7Dt2jTHWOIGGgwt93fbsSORCVl3t6G+Fjd3SeMQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQQyZdDpg7g0TuIUMJRDvUFCEVBsaMZh3qn5ghNffLU=;
 b=nRfPtf/F38Qmg6SH/upjpo2a/CimA8KvDBeW5hhpKyu2jzFcW6p4nx/YxinrS7EXLfDmif4xABcXP4E7FWr5NSN5Dw8MS9MOk3mosPi2Z6dDoT6V3eH4s9vGRhnqQbvWnMdUjGWRexTILybKLl3A+tHFfXblh6yKoNgMNvHfInlgTX6S7hLUhCoy9Ht/NyipLE+gTXT8nlkl/I8B1cLPWcHbJuGdf4j4zAJPj/7FND0xBdpXY/e/WsKLSZYGqq+jwLqcnh7qP3SVv6hugA1juFhieTsuYKFmuMuuNBPT/L19Wn8z7US9dl87V69pW+rT9uGq1EBN6ZGTqbG5KlLh1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQQyZdDpg7g0TuIUMJRDvUFCEVBsaMZh3qn5ghNffLU=;
 b=uCTFCeQKHstzWO8sypimoPkDmOjgZ8BOj4tKJEOAQV1HL/JwvG4PPWVQRjz5cZsaJunyDz2UUTfJiwQGGJceBrXiQojym+csjmcRJlpGrMpSMvwxzcsQUMor0j8tjHj83gGWPwpzMbHeTGj5NgakXE1uFUZy5GrLIbtdd6pif5ckPGnlQak86m5V8j27D9RxVriK/gaMpdx2HV9TCl358owy6Gai86HYbiWavxdMfb0Y36PVX2hSHc+4AKNbG0QNFjD07pWuWrE4/lyBz7HSfZTeHISdWQSL9omI80JBXdhWb7PWh32JB0UTWzs4ixtxJx2h0E8pfHCvbX1sqOUZNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6162.namprd12.prod.outlook.com (2603:10b6:208:3ea::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Sun, 23 Nov
 2025 05:12:27 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.009; Sun, 23 Nov 2025
 05:12:27 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 23 Nov 2025 14:12:16 +0900
Subject: [PATCH v2 2/4] gpu: nova-core: gsp: Fix length of received
 messages
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251123-nova-fixes-v2-2-33d86092cf6a@nvidia.com>
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
X-ClientProxiedBy: TY4P301CA0103.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37b::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6162:EE_
X-MS-Office365-Filtering-Correlation-Id: 288faf7e-55b7-4ce7-09cf-08de2a4ee558
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjJnMzdDVTYxQnBVYVN0N1BGVTZHclYrWlByTXdMQW55bm1hMktMTkZXNUxx?=
 =?utf-8?B?d0xqYWVsY0VaWFRBNlF1aElwY2JuQ0RhNEtXTE5PelRnd1QvcjZnNFliZ3lN?=
 =?utf-8?B?NlF2dU1yU3dlM3JnZTlaZzZmTjA5MW5hNm1rSVZqOHRLZHllb3JsTTVySEFC?=
 =?utf-8?B?NE1jZURPeUUyTGh5TzhvckVSVlpOMzh2N2lKUTgySkJJbXl4MkpvYk9qNVRO?=
 =?utf-8?B?YXBqM2JaRmxKZjhhZ2pML1NnUlExTS91UnpTNzNFL3J2d09MOFVLMHBtbWo1?=
 =?utf-8?B?enU3b0ZZbUJiWWhPVXllZklEVjZHTkYvU1Y3WlFxa3FnRWUya3lUT1hib1dS?=
 =?utf-8?B?N1RmZFQzVzZ3VndIT0V0ZElUZ2FRV2xSMWs1R1VUYUhHaUJTT1NYV1pySlB2?=
 =?utf-8?B?ckhzSWQzWmluNldHK0JJb29JME5MNkpWdGpycW5TVXRQQXBTaG01eXJnMVpY?=
 =?utf-8?B?U1A4TnZJYWVUYk5hcDQ1UE1EajhkWUhwSVJnajdrdUFGZUdhM0xSSFEzbjdx?=
 =?utf-8?B?VmFreWlCbVlKVm9OY3VPYUNJK0d3UXFzNTMrZUdrQkZNaW1iUE9hekZzWXB3?=
 =?utf-8?B?RkYwalczZmFxMDN2L0RKV1dKaXc0cmhUd1JNakMxQlhta25MaDMwK0dqK28r?=
 =?utf-8?B?Uk55cmJiR0g4Q2JGQTNoakhFeTE3SE1hZHBXTFMyWXBoamtMZGU2d3JzUXVj?=
 =?utf-8?B?M29jdlZ6QUpLbmQwWFBhd1NJOExoRGdVNTYwVVJOb1oyREh3cUx4bkhvTnJR?=
 =?utf-8?B?MEJHRVlDdjdTWEJ6NEpKNEtpWnJ5QkNUaVI0OU1wNWk0QmRJQkQycVRPOTF4?=
 =?utf-8?B?eGJuZUZhUm9TQ3RDRy9mMlJYUUJDd1NnalFyOTNneGVWTTAyZ0ovRHBwZWpi?=
 =?utf-8?B?V3FtQS9iWXdmRDE2Rkt1VHJ0dmRYei9kZFdGOE45Qk5yaUxSbmVSVWFNTkJG?=
 =?utf-8?B?SWczL1h0WlBkL0FtRE1kVDBJTDE0U0xXSm1hRmVPMEFRRVUxek4vR0tzclQv?=
 =?utf-8?B?cCsyZmVXZTdBdUdWV1dFVmxjUHIyRGhvZmJORmtQTmd1NW5DLzdwTm9rdnkw?=
 =?utf-8?B?MTh1UWVXTE0ySGdYZWtKVkVvMm40MCtVallqOENFcXFKUWVpdTREeEg5b3Jk?=
 =?utf-8?B?eXpnU2MxYXIxWjZmbDU2bys5d2RRR0VvaGFBYnRIVUdDTWhnTlZ3NmUyZzFv?=
 =?utf-8?B?V2twMlZxaTZFTWpreTExMmVEa2dBUVJjaFVubVdycmZhYnpQKzFFMG1BK3dH?=
 =?utf-8?B?RUI4d1Z2UFdwMmd5YmxUSk1HTkd4eGd4Znpma3FtQ1V0Q2s2cVRqalh2NGRM?=
 =?utf-8?B?cm8wWElSdCtjVHlEcGNpRFRGMmhyRy9PbVYzYmRjaGw5VVJwMXRyZlJvaWNU?=
 =?utf-8?B?S1I2UU92bkV1WklZdUhycHZ4d25XKzZUb1JTTDBBRW1LNmZLbGk3MmYwNmRi?=
 =?utf-8?B?RUtvaFVQNjZMOW02aitHSVBaK2NvTzQvVTh2NUdWQ0pFTFVPeEtkWXFYVVBx?=
 =?utf-8?B?aDRtY1YxRmJBQ0pVR0hicUxvVVJKM0o4OWpJZ3Z6ejVKditoUnB2QnRJNlB0?=
 =?utf-8?B?V2VTTWFhRklHWWZVaWpmcWtCYndGbExXN1dFVnpiMlJSbnUxWUc2dDRjUDZ1?=
 =?utf-8?B?d1dKbTdGa1NGOE1UT1RQMFhGQ0dRUXROT1FoT1RMQVpsV2FmcnFMa2hHNk4r?=
 =?utf-8?B?eUZYNDZwR2tsRzZ1V3lSOXh1S296ZHZnLzVhenE0bkdOeSt5VmV0dlVGbWlK?=
 =?utf-8?B?NnRmSGJuV1gvV3hCWnJCNklQV09VajFsT2JxSHNJYkN4TklocFFWWXVVODhO?=
 =?utf-8?B?d0pLaU1SMWFGYkdYMTJFY1B6UndYaFRWdWJyKzJnbDRyck56Wmt2RDg3dlJi?=
 =?utf-8?B?bkZWZ3pNUEJVMlZwdFZyQytPeGFOVWhveXBjdXBMVXI5eFZ0VnlpMWVGc0ov?=
 =?utf-8?B?Z1lwMlhuYWhTMVJ5bEllbm1kWEFzZmNVemVwV2ZzWk1vdG55M09yUUNuUVhU?=
 =?utf-8?Q?yMRslAal5FnCPGO8B2zjNCJCEEoKXI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHIxdXlRQUdVUTUyY3NNbHF2Tmo4WjFGSjRjUlRzZk1yY0tNTTVPSWNZWjRl?=
 =?utf-8?B?SDNKcExvbXFLWDFEUko2c0V1Zm1Bc05sTjEwQi9VLzFTaHMwcWYxNHAzKzha?=
 =?utf-8?B?Vkl3K0FVS0FMTFpBVVNod0NDa0dOL05XMGNDeXJZZ2JNZGg1bGg3dFNrcjcw?=
 =?utf-8?B?c2U5SGg1MzZ3Q2h4SjNjRjJIZC9yVnNwSDBRQ2haQ2Vjc21Kc05WNEJ5MmJl?=
 =?utf-8?B?ZG0za000RC8yaTNSTEJnRS9raDRIUU1Iang2TVRvcG1hMVg3elY5emlyY1Zo?=
 =?utf-8?B?MS9LOGViMERnUEx4NFZrUjZmcFFwT0ZjS0JVV2tNbEtjWlp3K2dhcnR6Q2lO?=
 =?utf-8?B?TmJJSzZ5K3JEam93c2lqazlTU3lBTyt0WVJhZjFXb3o0TmdSbE1CaDNpSXlw?=
 =?utf-8?B?VEN4RHRpZnZNbytVTWcrSmdRc2djRllXenpoN285YUtET09UMDY5MnpKQmZN?=
 =?utf-8?B?dm1ORzMvcHU3amRZY0FLbTJ0c01Fd2l4dVpJbkE2VHl4bVh4eFVXZWJncnNN?=
 =?utf-8?B?Qll6VFVVSVBPdU10Z29BcE5zbkxyWnBhMWFLNXR5WHRldUl2WG41ZlhOQ2dz?=
 =?utf-8?B?aTM1MzBoTkdHa3BFVlJnKzJ0aXVIcHJVMUh5bWVhbThBcUVnb3lib1h0YVRs?=
 =?utf-8?B?elFiMHNQOW8xSFhwN2M5Si9PWkt0OVJienk5OWlxbmRxdEtvVHNCb1dyTERr?=
 =?utf-8?B?eU5BZWtBbmtzUFZKWkw3bGFaMjdZTlFpUEkyWGM5MmVwazlZTFQ0T0dsdHpC?=
 =?utf-8?B?Zjl0NGdURjVTNlRROTVYS0oxbm5XeHNlVTZYVlBHdFlWTmZLczZYRW85eVVk?=
 =?utf-8?B?KytJeGZJaitPNm9YU0tQUXhJbS9Ka0k5UTY2dkEyVVBGUC9YNFN0V2tvK3pi?=
 =?utf-8?B?NVBKVHcveVhOT1liVWY2SE9KY3hEbmt5bGpmVlVPTXRYNlMyS3NaREltR0ti?=
 =?utf-8?B?RE5kb1BTcUNUcDQ5UGJSY2ZWOW82STJ1d2hOWHBvK3ZTOWFJWnViN1dBVlhP?=
 =?utf-8?B?THMzQW5HdVlYMTVHdXNkS20rNVR4SHdCbVkrRHFOdGZsWm40Q0cwZDgwK0RL?=
 =?utf-8?B?dE1sZEE3elljbnJMb3gzZkhYWmhqUERzczMvYmoyOUlxVzgxMlVEaEdGVndu?=
 =?utf-8?B?QjNabzJIeXNMN3lpb2lYV0NsczlyUmdXM09HTlF4dDZ4dzlXKzMrc3ZsQ3VL?=
 =?utf-8?B?WGFSRGE1QW1PZ0RQbEhiT2Ribm54dzd4bllKV2NPYmFhbTV1L252Q3VZdmdC?=
 =?utf-8?B?ZWw3bHJHTnpmZWVCRmJuTGZEcVVHSmY3MThMNWhmcDZSdThoY0FmREUrVGJo?=
 =?utf-8?B?WTYwcUdMY2hmY3AxQzhJcitBbVBTOXozWTYrTW44cko1cithV20wOTBKeVI3?=
 =?utf-8?B?dWZpZmZ0SnB2L084Y2xJb0ZkOFY5aU1RMVo0bUdTKzk5aWJuUE16SWxhNFpL?=
 =?utf-8?B?NU5zYVUzTFhXZ1JUZTdIVE9uQlFzY0FTeGpUSCtjZE9ldlI5QlpmcTdFNnRU?=
 =?utf-8?B?Z2E5TC9lOGc5ajNKTEtDcG1HYUhCL3NRcSthMFpHOHlqZ2dSOHdIaFVuTVNT?=
 =?utf-8?B?ZkNSaVlRYjl6bDg2TWx2MDVsbWd6ZFpxanpIQmJKQ1UyOVg5WWlKcVJLQXJV?=
 =?utf-8?B?dnhiQkc2amJmT1NIZ1Y3a0EvOW1rZEpDWWNOeHhSZTYxUHB4YXVTS3JQY0I5?=
 =?utf-8?B?WTY3MUtvOWlSQm0xSlArUURHT01xNDUraVdHSHc2WFJhMm13c0JaSnFYeFdm?=
 =?utf-8?B?ZC93MW0wbWZxcUdUK3Z6dWxKU05BeFd3Z1dWd0dmbmFzL2sxRHh3dlVDa29J?=
 =?utf-8?B?Vi9jaWs4SWFRQVRIWWVmcVo3Wng0aWMyZUVhNGxJS2FMd1dJdlE5MlN4YnJ6?=
 =?utf-8?B?VTlRVU9EYWUvaW1qcWtkRFNDVDNJYnVuemsyY241dHdmdVJUbWVwNjd6SHc1?=
 =?utf-8?B?WnJtakgwNUtoY3AwTy9JeFdzbkcrcVFTODFrYWdTeTViZTMzbEF0elBiNjZo?=
 =?utf-8?B?dGM0VXp3a3ppelhOeXMzNnFMRDdoV1o1bGR0aHZ0TFBWTU9ZREFQUVJTM0VV?=
 =?utf-8?B?M2g1bUs5RjRjc1BlUHg0ZzdnWWc4MkR0WUhBODlJNWdYcjdNdVJiNHhCTk5Q?=
 =?utf-8?B?ZnZoUkpLenBBdWhWVUJUSmVRWDlPUEd0UlNFL0E4NjRkQ1prb2swaVRCTjlt?=
 =?utf-8?Q?KAofunFXwivqs8/AW4ZHoGbARMde9f75klpd5AoKM0ov?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 288faf7e-55b7-4ce7-09cf-08de2a4ee558
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2025 05:12:27.7869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z/tQjYaM9cQGMlnwdXm4dC42TJjihtEKbvQUxlA/OgSr64CeykIrGdtYzi8XNHKZDYdNMx+EyJC3cUZBCgHsTA==
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

The size of messages' payload is miscalculated, leading to extra data
passed to the message handler. While this is not a problem with our
current set of commands, others with a variable-length payload may
misbehave. Fix this.

Fixes: 75f6b1de8133 ("gpu: nova-core: gsp: Add GSP command queue bindings and handling")
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 11 +++++++----
 drivers/gpu/nova-core/gsp/fw.rs   |  2 +-
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 6f946d14868a..dab73377c526 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -588,21 +588,24 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
             header.length(),
         );
 
+        // The length of the message that follows the header.
+        let msg_length = header.length() - size_of::<GspMsgElement>();
+
         // Check that the driver read area is large enough for the message.
-        if slice_1.len() + slice_2.len() < header.length() {
+        if slice_1.len() + slice_2.len() < msg_length {
             return Err(EIO);
         }
 
         // Cut the message slices down to the actual length of the message.
-        let (slice_1, slice_2) = if slice_1.len() > header.length() {
+        let (slice_1, slice_2) = if slice_1.len() > msg_length {
             // PANIC: we checked above that `slice_1` is at least as long as `msg_header.length()`.
-            (slice_1.split_at(header.length()).0, &slice_2[0..0])
+            (slice_1.split_at(msg_length).0, &slice_2[0..0])
         } else {
             (
                 slice_1,
                 // PANIC: we checked above that `slice_1.len() + slice_2.len()` is at least as
                 // large as `msg_header.length()`.
-                slice_2.split_at(header.length() - slice_1.len()).0,
+                slice_2.split_at(msg_length - slice_1.len()).0,
             )
         };
 
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index abffd6beec65..7fcba5afb0a3 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -853,7 +853,7 @@ pub(crate) fn set_checksum(&mut self, checksum: u32) {
         self.inner.checkSum = checksum;
     }
 
-    /// Returns the total length of the message.
+    /// Returns the total length of the message, message and RPC headers included.
     pub(crate) fn length(&self) -> usize {
         // `rpc.length` includes the length of the GspRpcHeader but not the message header.
         size_of::<Self>() - size_of::<bindings::rpc_message_header_v>()

-- 
2.51.2

