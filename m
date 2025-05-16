Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5357EAB9BDA
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 14:19:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7661710EA90;
	Fri, 16 May 2025 12:19:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AesCEwX0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF51410EA90;
 Fri, 16 May 2025 12:19:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k3mdaeTYP2QZasTyiglo872PzGYH29tCvRTyuk36YGkewdjwRK/yro4pnqfvWhAcQf9pidTuUcVLZSsTGqLDxUAcl0xJ5UmLZR97LxgZSVU+ZaZF+nOrjjwe6UcF4A6iMhWIVhndYUBmAGS1n0lswaZcXTdZr23C5Px8qxHmtzPL328PaFSApjZ6oorT+THaqMi3ggMI0w0UV7c6IJPuzhpxpZh4Td+W3oLrREZ7L/zBnz5YajBr6wWlHU+DafHFfW1E+5bC93YdSkyr/FtLa60VrFxvy/f+pR2KdScmtJKlzjfggxEiiuLdNqhffiusEriHt729FgofsL3KjvyjNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1IsGr0g/aC+IpDHCMQ/C0qK2oUD5gpfgHqgQI7h5FiM=;
 b=pVmlM3NVjjkB4uJzSs7Xp4uxlNYmbxWmuWZJBlWymEiS4B4FxJyWzbfZtFO4NbzJMLr+UrhnFc8KmnxVJV+MttP32RB8CA9qR1py1SFilSJC56ulye66QSuO0f6STIAyfCp9lZJLYcCB4O0pVxKWIH9ipn6AJ6GoC6zaZ/tWFAGlhWxVg5Et0H45sHMdy2oBqRKtlrGQFgzX+fSfR8ZndHd4HZZVL20Jg9nApI4u1Kbjxtg3ef6YnpQT3oCAJQJpIned1ESgmPSRcLBJMDM5qvcfd1bsZT9NTulw8vo/p3msvekOMC8HKJWt5pFW6ttZ9qRKdvtQBnzmHk5cTT+UHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1IsGr0g/aC+IpDHCMQ/C0qK2oUD5gpfgHqgQI7h5FiM=;
 b=AesCEwX0kd8ggy1oc+Fotn659+S5V9gQqmWB08nAVAer35M8fFCXTB2WNrJiyFuyEq4Km1Ur1DFMQ5TdBGEindzHVDkOJ173BGIsAHNaaTDYV6CaBbpRSF3ZKtK2Vp7aPpFTYtfTyaSvnn8FO0Ds3/aez1I0Gi+6TN4quGSXYGul0bo4NfT1E41hFn0zDOtXewXUqA+V4Qg/DvGlwbcZ7umTcg3+f6reLZxtMUnPoELLNFboY4DerEF5hQa+XG/Rne8wIxostZcQVrNjB/BSUWX5e0ya4msZ7Qr0ouLqK5UlWGOmHcS1fDsFURPzBW7LrouLY3I7jLLbAwe1f1Wk2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB7592.namprd12.prod.outlook.com (2603:10b6:208:428::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Fri, 16 May
 2025 12:19:49 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 12:19:49 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 May 2025 21:19:45 +0900
Message-Id: <D9XKW0NFY922.5HTPCXGGUGQT@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Jonathan Corbet"
 <corbet@lwn.net>, "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs"
 <bskeggs@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 13/19] gpu: nova-core: add falcon register
 definitions and base code
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
 <20250507-nova-frts-v3-13-fcb02749754d@nvidia.com>
 <aCNxFc3Z3TMi5rYt@pollux>
In-Reply-To: <aCNxFc3Z3TMi5rYt@pollux>
X-ClientProxiedBy: TYCP286CA0237.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB7592:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b3ba2b0-ceb0-42a1-f783-08dd9473f3b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dkU3NE51VU1URHFHTGo2OUpMYThZRUdvK0F1QWVja1RXODBYbHdnRlhwYnBr?=
 =?utf-8?B?aWdON21mU05yVDVFZWkxZDF2a2orWnBXK3VqVmZxL2N4WmpSSzhIaElTcDJP?=
 =?utf-8?B?bnIrNHlGWmN5VXZLWVA0NnlrTVpScU4zOG0vYjk4TjlWakhkNkZyakhwZ3hw?=
 =?utf-8?B?ejFDVkRHWTQrRVJBVnVGWXo3S0hIbm92UCtJSFU3aXlWTS9DQzF2QjhBcWQ3?=
 =?utf-8?B?YlJLamJmSVFkRzhQNkVkTlYraE5ZajZwaUc3WlltNnZxKy84K0FjQmFTaFRP?=
 =?utf-8?B?UkRNbW9oZTNRNklrNU42Qlh0NjZXUitSR0FhK3orVk4vL2txU1N3Sjd4aEhS?=
 =?utf-8?B?ZTdEWDU5c3lLSm5Wd3c4NUxtM3Zzb0xSSzVkeGdUWWNwTFU3Q3Rabzcrajc1?=
 =?utf-8?B?MUtqaGNsQ0FoQS93KzVnMzFFcDJULzJBdjltYW9HZ3BiUFVhUEQwRXFVb212?=
 =?utf-8?B?WmRzY0ZSdjV2QXcrQ3NvZk84SWNFTkQ5d3hTelViMlo5Sm5jb1JvSFQrM3M4?=
 =?utf-8?B?S1hBcERSekUrcHllSDUvbTducU9VeVlYVmY1ZWplaVA1dWJqRDlHZ04zU1Fm?=
 =?utf-8?B?MWd2NnU3SkcrOVRhVGJNSHFibFZjR3hiWUxnK05lV2M0czU4VTNsVEJ6dmhP?=
 =?utf-8?B?OGVVdkpZbElBb0owYys5TFVLdDF2aytKVnhKOWhKNnBNSHR4V1dpVno5QjBQ?=
 =?utf-8?B?Z1RudjExUWM0TkdhQ09lT3JzV1Bra2h5b3ZqOURCQWZPTGNyWWFzQlpYL0JT?=
 =?utf-8?B?TXBkYnMrR0VTdTJRc3cyUXZjVXl5QlZFM1AvRytnblNHcURhZlo5RXdNcjVF?=
 =?utf-8?B?cnNBdGVDNzJUTFczSlQ5RlYvc3AyUit3VFpNanBXYk1kV1plWUttQU1xUjI2?=
 =?utf-8?B?MldQZlRobGVWbzhIaUFMS3ZJeXVBUVZ3U29ncmNrMU1OMGdXcVc3TjBVL0ty?=
 =?utf-8?B?T295V00ySGFWbk5rVEVNelBMNnBQMVYybVR2N3M2Z1Q5YnpLWnRzVENvNEla?=
 =?utf-8?B?cStZOEoxY0V5Rm9ZT3ExSVRITU1semtXSENzb2phRTE1YlJWNE5WQTJmakZ4?=
 =?utf-8?B?S2FqNEQ1Z21EUXNFUzBmdUVzKzgrbk5TRGNyUk9nYktESGs0VHltNU9nd0Yw?=
 =?utf-8?B?ZmNkS1hoZE1POWxMUEU1UWFjanRnUDlMNXBPRmJHVGhiWkhpYUNnQmZxVFVV?=
 =?utf-8?B?WTFlTW55SVhFbnlVUG5yZ0lTbm8ybkpObGplOGF6OG8vU3RmcURZVWJjTmpF?=
 =?utf-8?B?dDNqRXVSd1dqaVBwSlJmbjFMUloxUXA4a0MyRGtSL1lWMlJlZFQ4clMwaW8r?=
 =?utf-8?B?dzl3YVNOM1RqR1NYeDJmNElWRkZ4SXF5a2M4U1F2SUJ4aFFmeFcwOFRxa3BQ?=
 =?utf-8?B?ci96YW5zZm0ydkZDWFpidVBVSGU2RjQwK1pMWTZmWXpmSWNDdWMwRExtbTZq?=
 =?utf-8?B?VjB3YnE0TTZMdnNPS2RReVM4b0JDdGFuTy9pYWhyMFltcjd4U003ZDZsbnhr?=
 =?utf-8?B?aHBPcUN1ZEhhaGhqZnBDcjV4bzB2Z1g2YVFZbUVwYXYyVjh3QjBMUXFkdDc4?=
 =?utf-8?B?WDl1bEVkM1ZBWGlscDYrQm11QVVCQ2R6bEVKNnI0RjBPdVptbnpydWJmalBU?=
 =?utf-8?B?VWliUEt0UXhwOHdhYThwS2JYdlRtTTFkVEZIbzRXajBpREpUREMvdy9nTFU1?=
 =?utf-8?B?SldnYnk3MEs2dVRrT3NDWW84SDdveEFTNmtEL1hzZ0F6NEc3SUMyb0g1UmxL?=
 =?utf-8?B?Yk80S0ZwajN5MWZHdzRGT2lFS1AzVjR5ZFBscTcwdmVsYk9LN29QeFVxN09J?=
 =?utf-8?B?SzJlMkN4MmtKVlBoL2tBandwMFUrVWF5dEt1ZFo5cjc0enpadWV1UGtwNVNS?=
 =?utf-8?B?amk0T1BDQUw2TFdNZ1hoQ3lVMmNUNmtlYk1yNnNsY2U3azB4QTZncGNWUTFi?=
 =?utf-8?Q?GqISm8ezzRU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmYzTnF1cWs2bE1vL24vK3VoSUxOM2pkbExIYTdwS2l0TXJxMXhxcGhINTY0?=
 =?utf-8?B?VG9EMlU3QjAyc3grczVSK2NjTVF1VG80QmxOYkNwNndRa0lpeFpZVjJxd1VD?=
 =?utf-8?B?bVg0KzRHKzQzSjQzVDlpcmJyTmVTSnJlS1ZIWGUxUEZnbUNjQVRNTHpHZTFY?=
 =?utf-8?B?MkpESmJOR3FHTnNIaDNwcG9RNTdOSkFKaDZRazlpS3NGbUJmT2dCZE9WNGd2?=
 =?utf-8?B?Ui9QVE9XMFBBNTJHMnFROUQyR1ZkYlFmQjFnNGJqMTF3VGlxanRDcGs5bk4y?=
 =?utf-8?B?MExZSEpualFKb01DMWIrd1RiVnF4RGs2NHNVaEFJUVVwY3NpUmtNUngrUzdG?=
 =?utf-8?B?dzhDY1BRZUhjcXo0dm9xNGFubnF2UnZwVFNJdElaR0YxTnMzbVhVTjI1bHZp?=
 =?utf-8?B?N2xPb3F5aXl0WTllbWR4RDdCQTczR0JMbUFkR1JDQ09oVU8vZEx2Q29FUzZt?=
 =?utf-8?B?amxBR25kbXJsazU4eEoxTWJRRjhNdlVPNFUzcG5OYVYvNUtOYVFRZFNlTHp2?=
 =?utf-8?B?TnpKWURsQnVza3p5UEc4UTVvdSttMXAvdmF1c0RCMXNJY1NlbVRWV0hPQ1Ey?=
 =?utf-8?B?eExub3ZVcVMvRWl1Y0tZQ1VqclkzM1ZoRi82T0VJTWlBQ2NrZVdOeUdwUW13?=
 =?utf-8?B?bFg4UTVPcWJlMXErZ2tCby9ZM3hEZ0Q2TzF5SHNWcVBiMWQ5aWZrZktCeUhU?=
 =?utf-8?B?K1BFbk5PMmxOR0R0d3dqTVBtanNCb0Y4ejBUdXBRVFc5bUZJZ1pZRmJUcjM0?=
 =?utf-8?B?citqbERKVklMOU5vSHNxZXE4amtCY2ZkN2lxMEtPVFlnYXFKcnhuRmQyQzdM?=
 =?utf-8?B?YWRmcmpXYUlqZU1vTzVTVHpCNzU2azZ4YkErM0JQZWxjRG9qWTNVNkhVUkFT?=
 =?utf-8?B?dWQ5SHJCUnNxbHR2ZXlhWTA3a3I4NGNNS0NFNlBtT1ZVc2dJRzRKc2QzRGY0?=
 =?utf-8?B?Q080WVU3eTU1Y1djL0RMRUtNcy9DRThMYWtoZzhpaWlBK0ZYbDJKTFlZOGJy?=
 =?utf-8?B?VG5UdE9BYlBhZ0dvN3Z0RnpCQzlGcjMvOGxGa2tva242MnNGTi9tUDBQWmZZ?=
 =?utf-8?B?WENrM05jN1pQM3B3UWlQYnpvaHBvWHBrOHEvajIrd0RTcFlYZEVwTDZXakhY?=
 =?utf-8?B?cVZ1TEt2M2tvdXV3blI1QUNoUW5WUWxhdGIzeGIvYWR4UFNGdXJiaU5hSy9L?=
 =?utf-8?B?bEhTSTA3SjhWRTFBRGJsMEF3Y1RFZDFGWkFuL054ZnNrZURoTUt6cHgybnhu?=
 =?utf-8?B?Nm8waHpHb2VHWGNRQjAyOUxwbTFoRVFWc2JtaWE0V0ZUK0txc3IwdjBnRXFD?=
 =?utf-8?B?WkNUTXVaOWpmODJYeDZEMnVHcm1BblhOdW1nMFFZbzUxblRKd2l0R1FTZi96?=
 =?utf-8?B?NkczK2YzNkpIVnlmVGZSUzUrRFF1ZS9tbThJTHRVbW8xcTArdGd6NTl5U0wz?=
 =?utf-8?B?NEVkdnFVbWJUT3dkZEhpODRnNSt2RVNEdU54Tm5odVBYc1U5Qm05TUtMNE8z?=
 =?utf-8?B?Vm9KcUJpWmRMMGhDcWJ2ME5nTUhiTWhyblNaUFhSUGdva1h2UWQzeEkvUUdR?=
 =?utf-8?B?Y2k3TVVTbm52aFFnWVpETCtXalpMb0swYXhpb2VRd1hBZU44bnZxaGdlT25S?=
 =?utf-8?B?OWpzdUZpR0FLNEdFUXRZcUxQaXV0MnFZQ2pwcWNER21MMWZocmdaR1RVSHM1?=
 =?utf-8?B?VnBUWG9oQUFnak0zVW1QeFBNbXlNVHVocncrYzBjN0dPa1BoNms3ZU4wZUdU?=
 =?utf-8?B?dURxVGYzczVIZTMvd3FlOEtXSWRaazlWQkx3NWJ5algvdEt1RW4waFlSVGN1?=
 =?utf-8?B?cnVWL3ErMmxDTFBYYU94S3lZMVE4eU5uU1hRUVJ6aUNNQi9iNnNKdFZ5YVpr?=
 =?utf-8?B?cEdGdVF3cGdQYXpxekZPMnhScGhTZHVGT01nVXJlM1lKSk5nMWlQYTdoaEZs?=
 =?utf-8?B?b2JrcTYwV3VFQzlpNXRvN1dtSXJkdWJEeEhGT0Vjd1FBaUMxeWdZWm1CL0Y1?=
 =?utf-8?B?bVBWUzVkTC80bjZ2ZXVpVDRXempmS1VQekM3QTl0Z0lDVnpYdTRsL2M4TTlk?=
 =?utf-8?B?VG52SysySE5nNFlTM0tLS2lCa1A3UTAxMTc4ZUJoMG9RZDg4NFBEQVRJdE5Z?=
 =?utf-8?B?OEpUZi9wQkpHNUI3UjNzcDNTOTl2dFFpNXYyVjNXZ0l1LzQyK09hYkt2ZEwy?=
 =?utf-8?Q?jtYpbsZhQZsuieoNahfkzwi4gQXGvjMdjdjamhu4ILH3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b3ba2b0-ceb0-42a1-f783-08dd9473f3b0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 12:19:48.8749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PKMKbuEmpHvHrl64HycSI8cUpMakjT09ytd/7aodw9ANG/9iSzBYVuGm+03bKBldwG3oDs4M/Y/zNDrbAYHmzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7592
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

On Wed May 14, 2025 at 1:19 AM JST, Danilo Krummrich wrote:
<snip>
>> +        util::wait_on(Duration::from_millis(20), || {
>> +            let r =3D regs::NV_PFALCON_FALCON_HWCFG2::read(bar, E::BASE=
);
>> +            if r.mem_scrubbing() {
>> +                Some(())
>> +            } else {
>> +                None
>> +            }
>> +        })
>> +    }
>> +
>> +    /// Reset the falcon engine.
>> +    fn reset_eng(&self, bar: &Bar0) -> Result<()> {
>> +        let _ =3D regs::NV_PFALCON_FALCON_HWCFG2::read(bar, E::BASE);
>> +
>> +        // According to OpenRM's `kflcnPreResetWait_GA102` documentatio=
n, HW sometimes does not set
>> +        // RESET_READY so a non-failing timeout is used.
>
> Should we still warn about it?

OpenRM does not (as this is apparently a workaround to a HW bug?) so I
don't think we need to.

>
>> +        let _ =3D util::wait_on(Duration::from_micros(150), || {
>
> Do we know for sure that if RESET_READY is not set after 150us, it won't =
ever be
> set? If the answer to that is yes, and we also do not want to warn about
> RESET_READY not being set, why even bother trying to read it in the first=
 place?

My guess is because this would the expected behavior if the bug wasn't
there. My GPU (Ampere) does wait until the timeout, but we can expect
newer GPUs to not have this problem and return earlier.

>
>> +            let r =3D regs::NV_PFALCON_FALCON_HWCFG2::read(bar, E::BASE=
);
>> +            if r.reset_ready() {
>> +                Some(())
>> +            } else {
>> +                None
>> +            }
>> +        });
>> +
>> +        regs::NV_PFALCON_FALCON_ENGINE::alter(bar, E::BASE, |v| v.set_r=
eset(true));
>> +
>> +        let _: Result<()> =3D util::wait_on(Duration::from_micros(10), =
|| None);
>
> Can we please get an abstraction for udelay() for this?

Should it be local to nova-core, or be generally available? I refrained
from doing this because there is work going on regarding timer and I
thought it would cover things like udelay() as well. I'll add a TODO
item for now but please let me know if you have something different in
mind.

<snip>
>> +fn get_signature_reg_fuse_version_ga102(
>> +    dev: &device::Device,
>> +    bar: &Bar0,
>> +    engine_id_mask: u16,
>> +    ucode_id: u8,
>> +) -> Result<u32> {
>> +    // The ucode fuse versions are contained in the FUSE_OPT_FPF_<ENGIN=
E>_UCODE<X>_VERSION
>> +    // registers, which are an array. Our register definition macros do=
 not allow us to manage them
>> +    // properly, so we need to hardcode their addresses for now.
>> +
>> +    // Each engine has 16 ucode version registers numbered from 1 to 16=
.
>> +    if ucode_id =3D=3D 0 || ucode_id > 16 {
>> +        dev_warn!(dev, "invalid ucode id {:#x}", ucode_id);
>
> Given that this is an error condition, this should be dev_err!() I suppos=
e.
>
>> +        return Err(EINVAL);
>> +    }
>> +    let reg_fuse =3D if engine_id_mask & 0x0001 !=3D 0 {
>> +        // NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION
>> +        0x824140
>> +    } else if engine_id_mask & 0x0004 !=3D 0 {
>> +        // NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION
>> +        0x824100
>> +    } else if engine_id_mask & 0x0400 !=3D 0 {
>> +        // NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION
>> +        0x8241c0
>> +    } else {
>> +        dev_warn!(dev, "unexpected engine_id_mask {:#x}", engine_id_mas=
k);
>
> s/dev_warn/dev_err/
>
>> +        return Err(EINVAL);
>> +    } + ((ucode_id - 1) as usize * core::mem::size_of::<u32>());
>
> I feel like this calculation deserves a comment.

Agreed, added one. Also reorganized the code to make the calculation a
bit more obvious.

>
>> +
>> +    let reg_fuse_version =3D bar.read32(reg_fuse);
>
> I feel like the calculation of reg_fuse should be abstracted with a dedic=
ated
> type in regs.rs. that takes the magic number derived from the engine_id_m=
ask
> (which I assume is chip specific) and the ucode_id.

We would need proper support for register arrays to manage the ucode_id
offset, so I'm afraid this one will be hard to get rid of. What kind of
type did you have in mind?

One thing we can do though, is expose the offset of each register as a
register type constant, and use that instead of the hardcoded values
currently in this code - that part at least will be cleaner.

>
>> +
>> +    // Equivalent of Find Last Set bit.
>> +    Ok(u32::BITS - reg_fuse_version.leading_zeros())
>
> Maybe we should create a generic helper for that?

Good idea.

>
>> +}
>> +
>> +fn program_brom_ga102<E: FalconEngine>(bar: &Bar0, params: &FalconBromP=
arams) -> Result<()> {
>> +    regs::NV_PFALCON2_FALCON_BROM_PARAADDR::default()
>> +        .set_value(params.pkc_data_offset)
>> +        .write(bar, E::BASE);
>> +    regs::NV_PFALCON2_FALCON_BROM_ENGIDMASK::default()
>> +        .set_value(params.engine_id_mask as u32)
>> +        .write(bar, E::BASE);
>> +    regs::NV_PFALCON2_FALCON_BROM_CURR_UCODE_ID::default()
>> +        .set_ucode_id(params.ucode_id)
>> +        .write(bar, E::BASE);
>> +    regs::NV_PFALCON2_FALCON_MOD_SEL::default()
>> +        .set_algo(FalconModSelAlgo::Rsa3k)
>> +        .write(bar, E::BASE);
>> +
>> +    Ok(())
>> +}
>> +
>> +pub(super) struct Ga102<E: FalconEngine>(PhantomData<E>);
>> +
>> +impl<E: FalconEngine> Ga102<E> {
>> +    pub(super) fn new() -> Self {
>> +        Self(PhantomData)
>> +    }
>> +}
>> +
>> +impl<E: FalconEngine> FalconHal<E> for Ga102<E> {
>> +    fn select_core(&self, _falcon: &Falcon<E>, bar: &Bar0) -> Result<()=
> {
>> +        select_core_ga102::<E>(bar)
>> +    }
>> +
>> +    fn get_signature_reg_fuse_version(
>> +        &self,
>> +        falcon: &Falcon<E>,
>> +        bar: &Bar0,
>> +        engine_id_mask: u16,
>> +        ucode_id: u8,
>> +    ) -> Result<u32> {
>> +        get_signature_reg_fuse_version_ga102(&falcon.dev, bar, engine_i=
d_mask, ucode_id)
>> +    }
>> +
>> +    fn program_brom(
>> +        &self,
>> +        _falcon: &Falcon<E>,
>> +        bar: &Bar0,
>> +        params: &FalconBromParams,
>> +    ) -> Result<()> {
>> +        program_brom_ga102::<E>(bar, params)
>> +    }
>> +}
>> diff --git a/drivers/gpu/nova-core/falcon/sec2.rs b/drivers/gpu/nova-cor=
e/falcon/sec2.rs
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..c1efdaa7c4e1b8c04c4e041a=
ae3b61a8b65f656b
>> --- /dev/null
>> +++ b/drivers/gpu/nova-core/falcon/sec2.rs
>> @@ -0,0 +1,8 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +use crate::falcon::FalconEngine;
>> +
>> +pub(crate) struct Sec2;
>> +impl FalconEngine for Sec2 {
>> +    const BASE: usize =3D 0x00840000;
>> +}
>> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
>> index c338da69ecbc2200f1ef3061a4d62971b021e3eb..ece13594fba687f3f714e255=
b5436e72d80dece3 100644
>> --- a/drivers/gpu/nova-core/gpu.rs
>> +++ b/drivers/gpu/nova-core/gpu.rs
>> @@ -5,6 +5,7 @@
>>  use crate::devinit;
>>  use crate::dma::DmaObject;
>>  use crate::driver::Bar0;
>> +use crate::falcon::{gsp::Gsp, sec2::Sec2, Falcon};
>>  use crate::firmware::Firmware;
>>  use crate::regs;
>>  use crate::util;
>> @@ -227,6 +228,16 @@ pub(crate) fn new(
>>              page
>>          };
>> =20
>> +        let gsp_falcon =3D Falcon::<Gsp>::new(
>> +            pdev.as_ref(),
>> +            spec.chipset,
>> +            bar,
>> +            spec.chipset > Chipset::GA100,
>> +        )?;
>> +        gsp_falcon.clear_swgen0_intr(bar);
>> +
>> +        let _sec2_falcon =3D Falcon::<Sec2>::new(pdev.as_ref(), spec.ch=
ipset, bar, true)?;
>
> Just `_` instead? Also, please add a comment why it is important to creat=
e this
> instance even though it's never used.

It is not really important now, more a way to exercise the code until
we need to run Booter. The variable will be renamed to `sec2_falcon`
eventually, so I'd like to keep that name in the placeholder.

