Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA2EABCF75
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 08:35:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD6610E0A9;
	Tue, 20 May 2025 06:35:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="O9drGnii";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3DEF10E0A9;
 Tue, 20 May 2025 06:35:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CWqumQ9JdRzhVgxfNEZUmLIG9nXJ2A2O/K8GhKTt9Qwr5LGdS7slSgTLwiFPlxuZDyS3ppkhOTXKhxDyUtXvZI02QolTKV5TmarvuCxRh41XSpd2EV+qiIjmTFNnSdZHUChQLDsPb9msuugoPfKTOYwvsEpLVQmQed80J68ZFlDEBoMxhcAk94v+KMiM7nr2DUFv/FxWpsljcdvqb4thlktWZHz9eW2V5CAgHn2Okr4ZfotDejW0XoSyPBvIIuZ7sTRAIM/0C1PU0Z64maVFPBpDF7sQazNjkFLvbOsMsjJH33GGPWMBAZPc1Ov1T7wNQlUfkQGwjuYuEvabBjcqmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jdkn+rFw79XdKHgeRQLP/uFjVsD8KDsW23RaKKDqpxQ=;
 b=pvrc0Jt4Zc2Fl5EB2plw85csPdtdv1aYzkeAZmRktIb49yRU+bVaeOONq/8FFC6AsJBXOLHvvo0BNJLChB8Boo2UDRUXzFdWfBpKDN69gxW41Kaxf9NZOkl2hHgvVCwQ2qkFYfdDeVOhVaPsnjfGiwUBo1No5v720xeZ2ZOoyk37myUf024WED1Lh7aVWgr6OAEHuiZXvagIGRBtY5H77d5IgxRGPXBY2Gg0+2LYp1jl5DwrRbRODx8NSN/IpMdpMDlOn4eAg9j9fdfTWxyWbZc4ryHxo9J34SOAyAx4RgS0WeDeDzUvpnhfOFBK6TbPh1vam8YK9Sd98J3sAxsHCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jdkn+rFw79XdKHgeRQLP/uFjVsD8KDsW23RaKKDqpxQ=;
 b=O9drGniiVR8/qptG358EM+rHHSA7l36t0XQXrPLh3gScK85/9MAaZS62VUqt4ilHn3dh1lFlMR1I1sr7KkT/85Q2C3TxCAQfINCP+aEiBgwKKGfFFwv+V9DvvuMTnvrTkafaeRqZcTYPO9zr0HWGldspWp6ma976gMUJ9Gm8Dmyl7FPG+QPiTV0TYv7O+hnNDwCIWp/eRc9rt8gAqk8bHGTwpz9jDZttRJ8dAgam0k8m65N+XmbbfASdOTMickKy3PfkLgujCMTqS9DQwz26I2cxFoQRIO5UPSjxMyo+4GTBxU7rOu7R9EqnfMHdANZbOvcNodB607yNSLbiP7yw/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB6447.namprd12.prod.outlook.com (2603:10b6:8:bf::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Tue, 20 May
 2025 06:35:33 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 06:35:33 +0000
Message-ID: <5ed3795e-283a-45ba-83c5-6d35622b56ba@nvidia.com>
Date: Tue, 20 May 2025 02:35:29 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/19] nova-core: Add support for VBIOS ucode
 extraction for boot
To: Timur Tabi <ttabi@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "corbet@lwn.net"
 <corbet@lwn.net>, "mripard@kernel.org" <mripard@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "benno.lossin@proton.me" <benno.lossin@proton.me>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, "gary@garyguo.net"
 <gary@garyguo.net>
Cc: Shirish Baskaran <sbaskaran@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ben Skeggs <bskeggs@nvidia.com>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
 <20250507-nova-frts-v3-16-fcb02749754d@nvidia.com>
 <3a32db1ee57f26ed59a69c9aa53f1cfff6f29176.camel@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <3a32db1ee57f26ed59a69c9aa53f1cfff6f29176.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR19CA0002.namprd19.prod.outlook.com
 (2603:10b6:208:178::15) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DM4PR12MB6447:EE_
X-MS-Office365-Filtering-Correlation-Id: dfa1c334-e2da-4ed1-8382-08dd97688576
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWpiaDRxMkxKOE1xTFQ3a0VpMUw4aVJsS3BXUDFES0kwbW5UKytTczA1SDZi?=
 =?utf-8?B?bnhaYnY4SlRlSHNpWnFWMnJxOEVVZTB3cUlBbldpTE9QallhSmRmcXhyWXk0?=
 =?utf-8?B?aEFpMUdFTjM1V01salZzamVKQVoyeHhzdk9xRW55cVF1N3FQOFo4YXZzM0dx?=
 =?utf-8?B?M1ZTUzRvSzRzaDVoQWNKOU1vSDlQNThpWk0zdjcyKzhhL1VObENrQVJYd1dJ?=
 =?utf-8?B?bG9QeS9rZU5qelBrNlpmdHVPMmtvdUZrbTd1ZmxaUUZIMlZqRDZDNmZyWGw4?=
 =?utf-8?B?ekZXWFB1czlmdEl3TlhSSlZaOEppb2hyOUFIMUtMV0poQWF2bFN5WFE3dURP?=
 =?utf-8?B?eFdoZnFkemJyYUd3T00zSFZnN0NSUDRGb3BHdXF0TEUxRzZzOC9jaFlsSXN1?=
 =?utf-8?B?YUVjbDF6Zll4UXpGbDA2M1JIV2NTRmdqV0J1RUhqRVdlbDhkU3kyY0N6MTJF?=
 =?utf-8?B?SDlTWEkyNGNMRVVadklZRWZXRk5DVm1BeTJCRFpScWFsYUVaaWRub1d5MGlN?=
 =?utf-8?B?SkFoamEyVU5jYlhtT0J3TE5xU2FCZ1JmbW8waVJXZDZjREF6YTkrUUVab0tZ?=
 =?utf-8?B?RlBTMmI4cVJHN2ErZ0lCVHRneC95ckFraGY2WXEremVRRm5tNjFlMjFrOTVw?=
 =?utf-8?B?K3hzOEdGU1FsRDY1NU9aRzVhd3kvM1RhZmU4anFGaEdWZXlQTGZNTE5VTHBD?=
 =?utf-8?B?KzBWREhSQjA3QWFQdWRGWVhqU28vc2JWUlJwZjZCb3YwMU13SXF4UkNkd3Y4?=
 =?utf-8?B?dUk5K1BnalZzT0hJMUtyaFZTWkQwUmEyMUdKMHVZS0VCYVVvbVZCdXM5UDNn?=
 =?utf-8?B?Z3J1ZkZwMkNiLzFFY3NDREEwRFlpeXhqUUxjd3ZNdVU4SW5xdlczcnhwdlNI?=
 =?utf-8?B?d3VpdzUwZUVSYnlWWGNqbFlsN0RhaW1lVkZRc1RjQjBYYzBENWV0TG9PTDJJ?=
 =?utf-8?B?YVl4K3A3V1NMSUdmV0ZyK012eW5mQzJnOFBDUExYRXN1eWFXdEJqdm1uMVVo?=
 =?utf-8?B?aHZubUJFR1duQUZDK2JMclc3djkzaTN6amN0T28rKyt0QksxQ0FuSjZFZVQ4?=
 =?utf-8?B?bVVkVHBObEpBNE52dlNxQVdjelA1MDJ0NytZWitOYnRJa1ptQ1NFWWwwMFJM?=
 =?utf-8?B?SmRsWHFFZFJJaW1IdTF6TDVFcTRxby9UdXNsQWtLYlZxTVNmQ1dhK3o1bXlK?=
 =?utf-8?B?bWV6MGNQS0F5L3BqbGNkbG95Z0l4b0t5Tjc4TUFFQkFOeGorSDNyNW1EZlF0?=
 =?utf-8?B?RzAwS09UaHV4enBkWnB5VjJnTFZqYVc3MTcyYTNQVjdnQjVJOHdVWm0zMGVi?=
 =?utf-8?B?d3JqMk5WM2d4NUFoY1pLcHZoSXg5RnlyM1p6czhZQ2ZKeEZucThlblRFVDZ1?=
 =?utf-8?B?c3J5ZFQ1aWI2SXgzNlEzZFFCNEl6VHhGQktvMXl4RHVkK0xmdjRrT25wdkRK?=
 =?utf-8?B?MkZiWTU1aUlvVTJUZmtyNlQ2NzlpQzMvMnhmd1FsUFpQSmNsaUlVcDhXeGQ0?=
 =?utf-8?B?czYzK0RWR2RqcVZlNTM4dDVabnZtNWw5cFlCTDR6Kyt0OUlzcG5wSnVHMC9N?=
 =?utf-8?B?akJYR2d2K1lwRk9FVzVtYmJRNENvZ0h2ei9JTlZ6SFV4T0ZkYko4L3VlSDEy?=
 =?utf-8?B?YmRGeWxCVmdJdFo2N0pwT1l5T0IzaXVVQkdPUU1QdmkwNUFWZ1QxZTE0bnhS?=
 =?utf-8?B?ZmYyNEZia1R0OFd1QnVLQUJYcU5QMXFTYll1cDMyTzc5OHRtVkhqZkYya0VZ?=
 =?utf-8?B?SEh5czhQZTZtWklJRHZZcXc0QnN0a3NxUHREbnkyUGJaclBUQWhYd3VhMElC?=
 =?utf-8?B?N2hDYk9NaXNVWC9jdUIwai9zK0c3TXprVFVUTEdrREZDc1g4L290YkFnSXR2?=
 =?utf-8?B?U0dYTEVPbHI2eWx6NzZGWVloWGRTeW5QTFlKSzFPd2x5ZVlZU3E5N3pjUVp6?=
 =?utf-8?B?ZEtaWHpMTEJWcFIwdUlQVFVOaXozYWRrRkFSRkVKclUvZnh2aWVxV1Y4azFy?=
 =?utf-8?B?VkNsK2JrUVlBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEVzNWVPWEFQRkNVelFoQjdYT0R4ZGNPelNKemd4TU03THE0OWR5L084L1No?=
 =?utf-8?B?Z0RuWWd0TmVLUGtWMkdiNExQYnB6K3VPYk1jTXloQ2x3c2VzdjFjNTREQThN?=
 =?utf-8?B?UUZBeFRSdThRclcrem05cDk4RjYyamU1dkVSV3FCb3FKMDZRS3U0ZWlibXJ1?=
 =?utf-8?B?REVXdytXVVBuNm9XOWdRZHFid04rY3NjVWNjVEJFbTAzRHJlMmhHRm9wWXlT?=
 =?utf-8?B?NGdXVExkSDFPNEV4QnV1Y01xOEFCazZmSzFubE5IWXlHUUVsRWw2S2N2UjJZ?=
 =?utf-8?B?Ukg2ekkzWEZrRDhNVjhkZ0RYQjNhYzFxR2FLdC9UMWk5SlZnNnU3eGlaMDFJ?=
 =?utf-8?B?OThHK09TT1hvWDl4YVNYNkZIMEo5d2hwRC9iT0tuYno1WlFBQ3JTaE5EVmRM?=
 =?utf-8?B?UG5laGNoeXRrOGVSYVl6NVlYNmRWRy92ckdDZTRTNkdmWE9aTmw0NHBDTnBy?=
 =?utf-8?B?bFoxZ2JkdnZxU1VhbC80VlZhOGh3NWRtdWJHeWpWVE9hWmh0aUZ6Z0hBUy9y?=
 =?utf-8?B?VENacEFwTlA1UnlieXQ3bllLbG1tQUsrMnZQdG1FVm9SOEZmOHhLcy85dWZt?=
 =?utf-8?B?ZVFZSUNjZ2FEUUM1UWZxR1doUzFnYldTcDFNZWpzTEhINFBvUVdxK0d6VG9I?=
 =?utf-8?B?bi9rMkdid1RmUlc3dkRZYUxwSXlXVy9wcXJRTkUxb2JrVzQrZkx1Z0FGWWtJ?=
 =?utf-8?B?cEtFWENKelhTL3NkdmJTYm9ZbzJGdDlZMjNBSER3dysyTnNIMVVhTElaeUxM?=
 =?utf-8?B?VTEzMmZTckxyZVVYblNWOCszUC9BZzYvOFlyd2RYM1pNejhyQ2pnSkx0SENN?=
 =?utf-8?B?TkxKbjJPNXNPc3E5MnRYUlk0VE9yelRYVVdtT0JXSUkrMk9WdlorbG9odCtC?=
 =?utf-8?B?SGRzUm0zai8yWEdTTEREaEpBNDdmQVpvM0NJNWFHOTR3bHpNbVpKeVZLVkh3?=
 =?utf-8?B?cElTYUNXU0kzZkZ6dnNSejBRbjdmY2lmRlBLR244UlExRUNwS2hVOWZHUDBO?=
 =?utf-8?B?Tks5czUzaGt5bzkxVEsyOXZiZFJVOWFlaG1LaGlYdFZLVWNFYnlTS2NVLytX?=
 =?utf-8?B?bGtOSXhxNXgvQURjdkNRekQ5TCsvV0FuVkpMVmJzNVBFVU0wNjNKeFBma1JZ?=
 =?utf-8?B?OVBETTVzRTh1T2RadmhKd2wyWWlGcjBEaFk3cUdlUFR6ckErRFgzQ1doVENu?=
 =?utf-8?B?WkxCRjdlZTJtMUJJUWJWRENtN2pWSjI5S0Njbm1sQ0N1Zys5OGVOYkdncGRt?=
 =?utf-8?B?SnNQTS9EM2FZeUFzRjFuNnBGOFk2enRGMy9hWUFsSVU2T1hmdlJmVWVuTHNo?=
 =?utf-8?B?NXVXckszNG96YUJVRm5rdWFvZDZCWWNScWFXZ0J3enUrK0lTejlXZ203b1Bq?=
 =?utf-8?B?cm1YekJtdUUzQkY5dFBDWlZ1dDEwaVNoVVZBbEdJa291eWhvOEZFQ1F0eXFE?=
 =?utf-8?B?cG9RQlhmdkRKWEc2V3pXWSsvSE1iS1htZmNTQXJZam9VR01RbG56dnJKWEpV?=
 =?utf-8?B?Y25BSGRxbXZkS3crK0orNWNEMlVNM2FSV2lnWWtaMnluQkt0VlV5V3YwdFdH?=
 =?utf-8?B?QnhSNVJvalhrUFZ0SDJvaGwzci9ObStJdGdVbGlyNWhYYmRQUDNaRm9NbTRZ?=
 =?utf-8?B?b0oxK2FaU1dEeDk1T2lPZkNMMXpHOFRsWFFaa1VIUjExeTBabWNCWGtkc0N2?=
 =?utf-8?B?TVJWREFiTHBBZzVaTFZDbDBkUTAvTVVHb2VxbFVPV2IxTXIwNnRUWkFiNldT?=
 =?utf-8?B?cmNBdjJOZitnT0RHNVBtaWMrUGxiVjB0N2dxUFpLQlZOaEpjandGUEdWTXhL?=
 =?utf-8?B?eit3Qk55anpnSHVxQkk5Q3lpeEFjZkNkYUtiQk9DWVBObFRydmlLRVhqYWdp?=
 =?utf-8?B?d25QOXd0NWhFTTNYNEZQY05pNFJ1eXhBNFB2YWRBTWFhUW9yNjZaZHpIeExD?=
 =?utf-8?B?L1plYk94ZGFlUENKOXBjV2dZOE1BYzR5cVZRdStSK0cvZUJPeEk2ZUhVTTJp?=
 =?utf-8?B?SlNTTzN1NjRaNWoraHNNSERtQThnNWNuU3ZEeUp1NDc3K2pvN3B2UGFhU1pN?=
 =?utf-8?B?SFdJdlpDOWZydUtSSUpmQUZZdTJwTjI0UGt6dERLdTEvdmxqNzZuSmpQb0Zm?=
 =?utf-8?Q?/bwgIpE2621I5wAGiKnKc1+ad?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfa1c334-e2da-4ed1-8382-08dd97688576
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 06:35:32.9708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vPHOwIy1/jH18K/fQOZz3GRE15kI0fh9ePDkK0SO40f2QJ+awOrSPHqcO8syBpqcJIrnjDFSQI5dfjFvqSa2wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6447
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



On 5/16/2025 4:38 PM, Timur Tabi wrote:
> n Wed, 2025-05-07 at 22:52 +0900, Alexandre Courbot wrote:
>> +impl FwSecBiosImage {
>> +    fn setup_falcon_data(
>> +        &mut self,
>> +        pdev: &pci::Device,
>> +        pci_at_image: &PciAtBiosImage,
>> +        first_fwsec_image: &FwSecBiosImage,
>> +    ) -> Result<()> {
>> +        let mut offset = pci_at_image.falcon_data_ptr(pdev)? as usize;
>> +
>> +        // The falcon data pointer assumes that the PciAt and FWSEC images
>> +        // are contiguous in memory. However, testing shows the EFI image sits in
>> +        // between them. So calculate the offset from the end of the PciAt image
>> +        // rather than the start of it. Compensate.
>> +        offset -= pci_at_image.base.data.len();
>> +
>> +        // The offset is now from the start of the first Fwsec image, however
>> +        // the offset points to a location in the second Fwsec image. Since
>> +        // the fwsec images are contiguous, subtract the length of the first Fwsec
>> +        // image from the offset to get the offset to the start of the second
>> +        // Fwsec image.
>> +        offset -= first_fwsec_image.base.data.len();
>> +
>> +        self.falcon_data_offset = Some(offset);
>> +
>> +        // The PmuLookupTable starts at the offset of the falcon data pointer
>> +        self.pmu_lookup_table = Some(PmuLookupTable::new(&self.base.data[offset..])?);
>> +
>> +        match self
>> +            .pmu_lookup_table
>> +            .as_ref()
>> +            .ok_or(EINVAL)?
>> +            .find_entry_by_type(FALCON_UCODE_ENTRY_APPID_FWSEC_PROD)
>> +        {
>> +            Ok(entry) => {
>> +                let mut ucode_offset = entry.data as usize;
>> +                ucode_offset -= pci_at_image.base.data.len();
>> +                ucode_offset -= first_fwsec_image.base.data.len();
>> +                self.falcon_ucode_offset = Some(ucode_offset);
>> +                if cfg!(debug_assertions) {
>> +                    // Print the v3_desc header for debugging
>> +                    let v3_desc = self.fwsec_header(pdev.as_ref())?;
>> +                    pr_info!("PmuLookupTableEntry v3_desc: {:#?}\n", v3_desc);
>> +                }
>> +            }
>> +            Err(e) => {
>> +                dev_err!(
>> +                    pdev.as_ref(),
>> +                    "PmuLookupTableEntry not found, error: {:?}\n",
>> +                    e
>> +                );
> Shouldn't you return an error here?
> 
> If not, then maybe this should probably be dev_warn.

Good catch, fixed! Thanks,

 - Joel

