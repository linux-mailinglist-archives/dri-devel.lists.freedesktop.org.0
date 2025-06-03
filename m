Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B03ACC1A0
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 10:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A6B10E644;
	Tue,  3 Jun 2025 08:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Zr1QmhwF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062.outbound.protection.outlook.com [40.107.236.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 195C110E5F7;
 Tue,  3 Jun 2025 08:03:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kwyzaWv5RxhhMnSCAs6hqRfycOxCMF5hNiwCg+DSO0L0F/3X5SLgpQdPBxWizShRRTwGgjFy/lTfJML7oI9jus6zJ3PI0TkZ+ydiAvXh+2YxONTV/10FJmHTMsndZrolcdnBg6cF+vG3s4Jpx8JVLFkKVe/S2YbteKTlXeNPiapigGxaJrRq9/cjF1/+9uYpi/coASJNXD+waG2v84bKTqOTWal+DIx/CUqI4f2FYuNcCRjjJ4wMd2XAJnALXW04Vb4o5gLOJnTlRkCQDlCrul5cUrJ32a9U5Qz5JfPtHWupGqo3n6nBRpfEDsyOCQnr56v/K4eg3fCnKBUVvU50JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kg1HOH/bd1WdXoMm5yaaES4pWY5AU0KMIKrL/rWt0Vc=;
 b=MuyzR7hWyY3w1Yh8YbFUILvQJcbQLGVEaI4zmHS/0GJVG6RMWx/0ETvLpiMo1h29B0J5MgMgJZ90Ed//nAkUuooKWiPslxsL6uC/ZG+IXINX51cyE9huv8iDVvwLA6ztDtMLbEM8PWPPNsmTCYCimiApCEP6+wGEXdEL957YyJuJ0yJtVyUbzpUB5/FJk+f99OpLcLq7ouAMAXWtTj7hJcTvRlY9h094INdw+Qi0aAsAk3LW9jILI51qd615/UGVGm5bBpYtPekS39xwxGsdNyJ5Hyma6Q63zx78yBdJngGusySUFqLSuYqX9HWh4aRJmZq+nHy84QoY1JGF2udEZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kg1HOH/bd1WdXoMm5yaaES4pWY5AU0KMIKrL/rWt0Vc=;
 b=Zr1QmhwFMOLoC8WmFyICTzK6WXb+b6USOvqjVpV4ngs3hghlrM/DrflEt6CbynkIj7y+0odk5tzX37wGqiYSdxxMnKvUTUSPoQF8LtUEUoRaJb7tApTEo3nGzXSoJ8HNg/U8NSakg7Ra023TJETvWAQy+YT5VlNwhhlAfLqxAgfyock7ebXXEM8Q9bTJcOQ0q1jhLXVoZ7jtB/I0a2CB5GrYctCto5S7NeY3Lh1RTxRUeRMWXpZbPV51Ojg4pTiIBHDD+bJ7XmiUrevFglbL7C2iZTIJTYyDCn6IakXTlQQI13P+x4yV+ILWaYyHDFH7hwFPuMQ9AjrkidpNYp+hqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB6109.namprd12.prod.outlook.com (2603:10b6:8:ae::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Tue, 3 Jun
 2025 08:03:05 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8769.037; Tue, 3 Jun 2025
 08:03:05 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Jun 2025 17:03:02 +0900
Message-Id: <DACQP9IFQ89O.3HILG5TOLU8H6@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 14/20] gpu: nova-core: add falcon register
 definitions and base code
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Lyude Paul" <lyude@redhat.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-14-05dfd4f39479@nvidia.com>
 <bb140d63b2a2201bdd7bf3df8012ccca8e895e36.camel@redhat.com>
In-Reply-To: <bb140d63b2a2201bdd7bf3df8012ccca8e895e36.camel@redhat.com>
X-ClientProxiedBy: TYCP286CA0172.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB6109:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cc536f9-a45d-44e7-6575-08dda27511df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OUczOWFRbEZnS29aaFpsc2I3blVTZmcyVURJSk50RS9HUElXbVIyaDlFYXB5?=
 =?utf-8?B?ZmNVSGF6WWRhZHhYUUtKaURkalY5ZHo4ems3REtXM0IxSmNEM1hrVllLenhs?=
 =?utf-8?B?VHlDZ25qdkQ1NjR0NmJuODJZK2FXUk5FRENuekVkV0wrclRSdUhwTmMvdExM?=
 =?utf-8?B?cmVqMml6cCt3djQzUkZibmwrYWNCcFdZUnUyUGxhdmo2R0UxNHpDbWZieTV6?=
 =?utf-8?B?ZzhpaU5uc242WTZZd2JjYlR4aXpRMnRBcUtUbjQrQjg0a3ZQek00UHBPbUZY?=
 =?utf-8?B?Y3JtMVN6R2dMc0NHWGkrMWZXSGFZSSt2emI3Yi9XbHNxMGpaVlFhS0hTQkcv?=
 =?utf-8?B?d1U4Y2dwK3RZVC9WNjJuUlBSbUFTOTRiRkpielQ5WmpqOFVyUjVCRWtiZ1BW?=
 =?utf-8?B?UEY5RTNodU8rZVRVVjV5LzFUUUFKVnRlUFlVZWFIcXpKMExsOVBIZ2x1TVZO?=
 =?utf-8?B?WTM0OXV0NGlZZUprS3VZWkd0ZUZWN3ZybkN2ekpZNHNJeHdLTGVPQkdFUjJQ?=
 =?utf-8?B?QXJLVEVWQVFRSldJMXdkL0cyMm5YNDhqeXFTVHQrdEhCRHRnU3dWeTZmQXJ2?=
 =?utf-8?B?WTlMOVM5bXA1MUUwR0dVeHB1YTVrbUZpVnVXWmRXYm9Id3ZPbXpobUlnaWdI?=
 =?utf-8?B?S2xVSURSL2ZqM3R5U0NMRys0K083cEZXMjExSUtCOXhGUkJoODRmY2lUKzJZ?=
 =?utf-8?B?TzB1RXVESE5CbmZTcE5XcWlMOWVuOThXRkI5R0VMMWxmRTJ0SkpPait2dmt6?=
 =?utf-8?B?YmJaNk1YTFc1YXYzMXVEQnZqazRRNXl0ZmptYXIxc3k3a1dxWmZGSm1sWGZl?=
 =?utf-8?B?eFZ6dEkycGdCeS9Xa1lFT2craTFFcWhqZ3BUM3BxalVLL0NOVmhQRTZSSjI1?=
 =?utf-8?B?VDhVVy9GVHkzZnhySWlFSmpPMzVmbCtISnhxbk1ialk5dzNoU2loUkR4c21a?=
 =?utf-8?B?T3ZGUDBockw0Y2N5L3VNa0pzZ2JZS2dFbjZOMjF4MU9IOHg2cE9QSmhCWmx3?=
 =?utf-8?B?bjlyZStCSkxicjRpV0xtTFpQU2NMY1I2UFpsaWNRenYrT2t3dDk5Vk5HUHNO?=
 =?utf-8?B?NFZLd0V4ZlBZcWJ1aVRJT0swaVZTZFhyUSs3QmY1WTVTVFg1WmZ1bzhDSDJJ?=
 =?utf-8?B?SnRMWXA5SitiMzZPNytkRHpHZGticGY2SkRlNWVES1B5OXJQODBiRFprTW1p?=
 =?utf-8?B?SzJUOXdoOTQ0Y1VaRi9jUTVVUlhRM2FWOTRtTExqeGRiSWd2RnJYbmg2Nnd5?=
 =?utf-8?B?NVRZMmhxNDA5Rys4YWhnTVFYVU1XQUw4MWhuZ2R0NitxR3Q0eURPMUlrWENa?=
 =?utf-8?B?TFNvcno2ZFQxV3R6M1lHSm5NeSsvTGhSOVVCTVUrSFFUSVF6bkIza3dibGV5?=
 =?utf-8?B?eGNPTk9pZGw5dHMrdUNkdXZKSzFSanRlRnE5TCs2TTZjSmQzNENySjg0TlRn?=
 =?utf-8?B?UTJhMXhyb2ZQdXhZalc1SFR3cm13cVp0WDhuYU1wbzd6ZHdTNFZ4d0c1S1Z1?=
 =?utf-8?B?bWNwa2tSdXdBVmZ0N1RLUzh5SXlxZHJmOXUxdnplaGtYMENnUVB1cGlCaUtj?=
 =?utf-8?B?SzZnQXJCYnI0Q1BidjM0eEFhaTBxNXM3a09vNGhuNjZHdEpHd3hITlZTVWl5?=
 =?utf-8?B?NDNmTFp5WENsdVlrNW00NkZFRzhsZDJ0UURlanJvT1hMTHBRODVNeGVqUk5r?=
 =?utf-8?B?Z3hZM29hS3hnS1BZb2V4MmEyaE1rV0h0cENUK2ZvVW5DVUduYjlITGxiVHBs?=
 =?utf-8?B?ZzJnNGU1d2dTajVCMlpvcm1mQmNjNTBDOGlvUlNhcGVRMWx6WER3OHd1OVFP?=
 =?utf-8?B?NUVhRFlKTXNyQjNKamM5NFVweUxnTXc5ZkNONUt3aDdKR24yNTY4cmJuUkpX?=
 =?utf-8?B?alM0bWJxWmxET29ac3dTSnVjTGthb3YzTXFqU3g0ekdKZlBESVkrNkZpU1lO?=
 =?utf-8?B?dldyU096djA3MHBlWk5SdWdEc0doMzdSUnIwQWlqaGJxZXM4UUErQ3ZPNmFF?=
 =?utf-8?B?THRRTE0wdE5RPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkNEcnFJc1k4Wmh3ODNnV2VwZDlmbER2eURST2pwL0JZcFp3MU5ZQjlnb3l3?=
 =?utf-8?B?QVBnTy95dnNZdnRqcFNCbmZFY3QrWk92b1ZkaXZPY1pFbUxTcmpVZTZVZ3g1?=
 =?utf-8?B?ZVd2OUh0cGJQckFTcXNKK2F3YldJUUl4Y2V4akYzbnc0YVdFTkZzUjNjdHlE?=
 =?utf-8?B?dW5xM3FlNXIrZGEyNCtoNzlxM3p2SGFRSVlMWWQyaXRiaEx3VUQ3SXNZZExQ?=
 =?utf-8?B?YlFYaG9DcE1rS2JTWFVycWF3OCtQblQzdDlienEzc1BPVWxabXkvUWUwRk52?=
 =?utf-8?B?T09zU0xVNEk0bjEyY1ZidVN3OUx2YmJoaklob011YnFjUmlvZ2NJaFlRVjlj?=
 =?utf-8?B?TjVsOUZycFlyYkRzcmIyNVhvR3daZ2g0aG4wWjRJSWEwR0hWRWcxUjB4K3Bl?=
 =?utf-8?B?bGlRNWxJa0tRVGxPMUtyc2h3ZFpMMkpabjk0Mlh3YU5UcVJ5UTBpOG9teVhC?=
 =?utf-8?B?cWFlaWl0emo2bnlPaVJHUCtVN3ZyUXpFb0VGMXZSeDVOTUxMRGZyenZ5Rldz?=
 =?utf-8?B?UzNCZE1mQUZSa2FDcXV2cHBVQVo4ZnpjS1VQdEh3cmJiaXJRczhBeE0rRm9a?=
 =?utf-8?B?RFlBUXZKV2U2NEJDTHQ0bHpRci9YU2tyclNFUDZ4ZWpwdnk2ZmMrdG11cWhu?=
 =?utf-8?B?UGJNUDlYQUhkbG5pMnJBK2VoVE44WUQ0RkNtQTl0YkxSTGlpSzJ6L2xCUWRs?=
 =?utf-8?B?VlJnRW56cjNlRHpwY1ZwNFMybTltLzRra3Z3MGljSXZhMElDeTg4cFAzWTBR?=
 =?utf-8?B?Z0RPZnN4SDJORnRrQWJNbEdjaTE3eWlKNUJNUU9zZmgvK1o3QmxzK0d0VXZC?=
 =?utf-8?B?b0FoNk1sT1JlWnMwKzNPMFdsbWpPZkNuSFplWGlVMzIzdm9wRFJjU1hub0hM?=
 =?utf-8?B?VXA0SHd4dVl3K01jY0toekNjcTJSNkpuVDR5MG9wcG56UlBCOW4rZHJtdmls?=
 =?utf-8?B?UWt6MEpHMFRkRW1pWENkT2g2Q0NCc21KVk12NGRSMFJyRXJBbW5MZHdhL1Q2?=
 =?utf-8?B?bEh5V0taNHFWY3ZZUGtzQkFtbmxqRHRIc2wyODlPSitzSGk3dmZwc3JkWnZn?=
 =?utf-8?B?TXlRSXpyS0JxQ2M5emVjOHBLZjNNMFJaZG1HZm0xcHhLcjQxbU5BdHh5YmJZ?=
 =?utf-8?B?R3Y3SjhwMXl6cW1VMFpVYlpLTEFOM3NxSDlkaHlzcmJrc0NFUmNPTzUzYWY3?=
 =?utf-8?B?U2pCQWE0V1AyVnRmYU93aTFPUGZrbTBQclpFT0dXdkRvMHo3Q3NhZ3NralJo?=
 =?utf-8?B?YUxzUjZjUGVhaDN2ZEJVTVRYcU52Q256YTQvUGlYTlhpSnJtNXpaOEdLU0tE?=
 =?utf-8?B?cm4xNUc4NzA3eVRtM3EvSXh2VEVxL2N3eTZYZGRJTXVMVWNScmdINVMxN3Ns?=
 =?utf-8?B?WEdKRmswUUFCaGJob3JkRURIdEY5TVIrTHNhUVFtelhZNWljeThNSWN6alNS?=
 =?utf-8?B?bWtXMk9MSjRuQTAwdFc5VDRhWkZtdDdwRUFqb3JIclFReGlKdzloNjYrZ0F0?=
 =?utf-8?B?M04xR2JkYy9iTXd0OVMrdDg2RGo1NW92RFgxc2NJUEJUbFNUck05dngrSE5M?=
 =?utf-8?B?LzdILzVCWUJoRHU4Qkc3TStWTUo0cWdQNFp6Qkc2a1JyQzBUSFNpWnh5Q2tX?=
 =?utf-8?B?ZjF3Y05vQ0pNTGFpaGk1UkNTUlE2aHh2OVdMSDRZTWtWd0FuNFh0TTQ0Z0hs?=
 =?utf-8?B?RTZTVEtRcW5rVnlXK29mRDNJNHJUVkVSeGxwQ0JrZ3RWbmtYaTNJYUwxNUhO?=
 =?utf-8?B?L1B3ZzdXRW8wWlNQNU5YLzR4cDVzT3JVOGt5VFFBd1ltQXdXQkUrbHczUnJ4?=
 =?utf-8?B?dENNVHdDN1hzc2tKZ1lkdENNYjVvQWpyVUNiWU1tZVZPMmJ5UUFHVktDVE9v?=
 =?utf-8?B?azBzZEVTbjdNK0pZZXdxZGlSc0k0NTY3U3hOQ1Fha3g4VThJS3VwN2xvdnFo?=
 =?utf-8?B?d1VxS2p5MGlQek5jeHJ4VEhJNS9NSXUrOEVCR0FMbTFZN1FicEhzMHZJdWRY?=
 =?utf-8?B?TlBBSU1QWmtUc1BEWUR6eGw1RmM4MnFOMjJIcVZ4TmhIR083eVkzbVNhWGFX?=
 =?utf-8?B?U1VOK0FiMitlaG1Kdi9qWVFZbjNGam1yNHpyV2t3UWo0SkdDMzhGOTM3U2xE?=
 =?utf-8?B?TE9ncmNIdm1QcWhMK3NvVUFpTUl1UFRLYnFyV1o5NEg5OHE1TWplcDROUEZ4?=
 =?utf-8?Q?HEPyYx4UVTYT1N5ezwSg+yf5RrQcuhgwbHbAvyhjmSWC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cc536f9-a45d-44e7-6575-08dda27511df
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 08:03:05.2825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lIAM4dl79n6cE+phV2eaacvX3DYKcXL4dzNLLrlcej00khqAoBFIo9T493O7BMONapON6xcjR5FRX7ksWst5Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6109
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

Hi Lyude, thanks for the review!

On Sat May 31, 2025 at 7:22 AM JST, Lyude Paul wrote:
<snip>
>> +    /// `target_mem`.
>> +    ///
>> +    /// `sec` is set if the loaded firmware is expected to run in secur=
e mode.
>> +    fn dma_wr(
>> +        &self,
>> +        bar: &Bar0,
>> +        dma_handle: bindings::dma_addr_t,
>> +        target_mem: FalconMem,
>> +        load_offsets: FalconLoadTarget,
>> +        sec: bool,
>> +    ) -> Result {
>> +        const DMA_LEN: u32 =3D 256;
>> +
>> +        // For IMEM, we want to use the start offset as a virtual addre=
ss tag for each page, since
>> +        // code addresses in the firmware (and the boot vector) are vir=
tual.
>> +        //
>> +        // For DMEM we can fold the start offset into the DMA handle.
>> +        let (src_start, dma_start) =3D match target_mem {
>> +            FalconMem::Imem =3D> (load_offsets.src_start, dma_handle),
>> +            FalconMem::Dmem =3D> (
>> +                0,
>> +                dma_handle + load_offsets.src_start as bindings::dma_ad=
dr_t,
>
> I wonder if maybe we shouldn't use dma_addr_t directly from bindings and =
add a
> proper type alias for it somewhere?

I guess so, let me see if I can easily change CoherentAllocation to
support that (and address Danilo's related comment).

>> +pub(crate) trait FalconHal<E: FalconEngine>: Sync {
>> +    // Activates the Falcon core if the engine is a risvc/falcon dual e=
ngine.
>> +    fn select_core(&self, _falcon: &Falcon<E>, _bar: &Bar0) -> Result<(=
)> {
>
> Could just be Result
>
>> +        Ok(())
>> +    }
>> +
>> +    /// Returns the fused version of the signature to use in order to r=
un a HS firmware on this
>> +    /// falcon instance. `engine_id_mask` and `ucode_id` are obtained f=
rom the firmware header.
>> +    fn get_signature_reg_fuse_version(
>> +        &self,
>> +        falcon: &Falcon<E>,
>> +        bar: &Bar0,
>> +        engine_id_mask: u16,
>> +        ucode_id: u8,
>> +    ) -> Result<u32>;
>> +
>> +    // Program the boot ROM registers prior to starting a secure firmwa=
re.
>> +    fn program_brom(&self, falcon: &Falcon<E>, bar: &Bar0, params: &Fal=
conBromParams)
>> +        -> Result<()>;
>
> Same here

Urrk I've done this throughout the code. Fixed them all, thanks.
