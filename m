Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14554AE5A4C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 04:57:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE53F10E4A8;
	Tue, 24 Jun 2025 02:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="We0Al2lq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F095810E4A6;
 Tue, 24 Jun 2025 02:57:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U/KpIjaPAs6NlXt54jTkSGoL4iF9Xf2ogHvK2klgPfcls5SMMyP5ERWgYYij8wW7Ws/vBqaA8IFgZG2mdvbwXmWhzeh2D8zYFAuKxC6efbk5QyQ/pzsT5yCBtuxhIErXntcUU2qUwXQxqUUTKwoEUtrzzCir94Iln/4WJnTpH08di6Hv4ieN81xEIsX2Jy5wYXr6Eu7tABoR8WD4947Dt7TtIxb1qaNp8i5R+w5AxVytBkFCjwuiS0V+4dSZBuoWNQiEVbUUkIlh1hIVefLBfh+MZw4U9wh3rdEv9LabCCe/XccYvuDkTfFRFnO0r3YqqgLsgQ0nST+VlrdGia3C6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cEzsp+t2u+47PwsRehIOGUEI/jcqGACnpobByNnLXIM=;
 b=IjtDkdeFJz/dgsZ3qs0KM51rLZqESDPhwUThOVzCoSQkJxgsjUjuLJcVZgERf51MRbXfMco1oD9ksaKOZKqDp2QwNpHQmgul4LI5w9lnqutMwnaZdoQfjl1CiZfLL4DKXAx0MCuA9DL1ie+FF5KNN1SpAN9wo/Vz82pRDDMdGrx0hJZ6GMwKfBpJsyappl5xUXS+OSVfkc47C4ceIC4W6c21G6vLFXT9756RlP/0LCBF4DXc+NSaEq8gmC0bM0BXFPMvOpHdbwIGdaMjZ53Jay9FnFL8mEE74IPi8BEzfFcNC9PNmSTiGhK5mVgDe8+yb6a5ZghhO0yq4iYMn0jGKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEzsp+t2u+47PwsRehIOGUEI/jcqGACnpobByNnLXIM=;
 b=We0Al2lq2MOe0DMhUiN67Flq2cPOUioMwjzNlOTyATeKRL74HRlcbpeUfE8j1Ogpeppj1D5jh/OgF2HhlUckcMa9wZiz/UAXHWm5+8I7/CoEI2m5+R/zaa3je+/eTm1AdCLUuD0HIkKTfJ86MEjXOlQtMba02c0oxLshGVwnoXJH6UqrmxU9ypFONT64PATYp1QKQXArIRNICiZ1O149w3GGfZEkJkFPDVzzz52JwNckYkYIKi3Jk2fod/tw4AVLLE2QRwcl/20pZfKOGYzX49RnOxSGHMaUVgmnnbVDnggRF0C8n+UlUexV0GC63kqkhXNEuDEu7WQ/7MsPQUI64g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH1PPF8423FDA82.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::617) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Tue, 24 Jun
 2025 02:56:53 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 02:56:53 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Jun 2025 11:56:49 +0900
Message-Id: <DAUFC932W5MR.Q13BFD3CYEKJ@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Benno
 Lossin" <lossin@kernel.org>, "John Hubbard" <jhubbard@nvidia.com>, "Ben
 Skeggs" <bskeggs@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Lyude
 Paul" <lyude@redhat.com>, "Shirish Baskaran" <sbaskaran@nvidia.com>
Subject: Re: [PATCH v6 00/24] nova-core: run FWSEC-FRTS to perform first
 stage of GSP initialization
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
 <aFnArVIFkHCUzNqe@pollux>
In-Reply-To: <aFnArVIFkHCUzNqe@pollux>
X-ClientProxiedBy: TYWPR01CA0036.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::23) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH1PPF8423FDA82:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c3e0930-2bc2-4639-cf0b-08ddb2cac5f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cDhxNXRvY2ovQWZyOCsxMjN0K0tnOTdRaFdWemxIK2cySnNOUTd6RytHMlFB?=
 =?utf-8?B?bm9xcktPTFU3NWRNTytrMS9POFlhaUlXSEQ5bEpKeGVrbFVHS0l0aVZTOFJK?=
 =?utf-8?B?S0FLK0U1QXYrL0ZwNFZQSHM5TEF6TDB2TzVMQ0hXSU5Zb1MydnZMdHVRN0p3?=
 =?utf-8?B?c3l6UTJhRFBxejVEMXVnSFVSZ0tJYllVS1dnOWFTdVpWQk9rMnByUE1PeW5M?=
 =?utf-8?B?YWsyMThoV0luaHQ4QWhGSjIzMW5oNXB0TDFhVFZiUTJ2Q3FTWSs5L3hyYURa?=
 =?utf-8?B?VlNVclBiVzhCMmVnRDZxaWNFUjFITk05YmFTWWRBZDh1WG04QitNNzdBdDZy?=
 =?utf-8?B?N3d3ZTRCRTgybXpETFdkeTk0VmpHUXZyalUwU2h6OENtN3cxeG9GdlFtcVV5?=
 =?utf-8?B?VmJYaGQxY1d5cS85WHZ2ZXJzdTZ0cUlsZkdpNlgvek9pTE4vQTdmdG5XbXFT?=
 =?utf-8?B?RnRsRmVPWEVaQktjSkJmblhyUU16b3B4UXlXT3lJVXFxbDFrVVdPQ3FXUU9q?=
 =?utf-8?B?MjFVK2JxandMR0lES2pYVFJ6Q2pzUlNZd25jK0ZEOGh2UzQyeTBpeGY0TTJy?=
 =?utf-8?B?NE4rTFAwTWVDa3ZwM0djdmxqd3BqSGh2cGQ4a1JVRXlwNlZtZ2ZiNGc1ckVt?=
 =?utf-8?B?M2g1RmlxRkJWNEpLRWNPZXpQMHdIalh1em1MWWNJdlpMMXFsYTRxLzJFQ3hH?=
 =?utf-8?B?ZEhqeWRzVFAwRUQzTUJWVTRocHJKa1lwOU1NRytDbmxoWDdiM1JPMmVSUGox?=
 =?utf-8?B?QXpqa1luYVd2S0lrNUhMbk5Gd2hsVmR6U2EvNy83djgzdVRRQnBBWThLZjEw?=
 =?utf-8?B?emZMczMyeFRxZ21LYk1PUUxVdEFGVUJzdnIwa2FRWEFHS3hSU2NXb1hlb0Qr?=
 =?utf-8?B?aGJnQTNLd2RhWlhLTFlHTGVnOEx0RERldTdoSWhPL0MrbFJnbzlPUWR0YTE4?=
 =?utf-8?B?eFpiVHBMazhaZGF5eHFiY2dPYjYyMjhMTm5rZjJUWGtDakVmUFdTcWZZd3hD?=
 =?utf-8?B?Q1U3eHZiVUJuL05KVVBtbE9FSGV2K09MaWRpSlAzMEZ1aUljYS9lU0JoNU1n?=
 =?utf-8?B?YTBURmVNV3FobjhxQVY4Y0d6ek93QXRxTE9BcTZVU1llUFdHSTBXMm1QYmtm?=
 =?utf-8?B?UkRzcmhKWGs0d0xudnU1akQvcE54L2Q4SGJwSDVFK2lJcU9MQUlZb25YZ01O?=
 =?utf-8?B?a2hoL3h5WW92RHF5eWxseU80dkN5NU9lU2ExZ250YmswTnY0YzhRT0tXREhx?=
 =?utf-8?B?UXJseTU1TzNpN3UvRzVtN2V4bGtwVTl2UE44MVRpU2xUdUNDSUU0OFR5TjJo?=
 =?utf-8?B?dy8yem1nYXd6ekd3ekV0c3M4bE1oQ3ZlZE9yRXVzY3kybnpJK2dHN2o4UnlS?=
 =?utf-8?B?WDl5WlZIVWVGUWxKcERTZW0rNXp2TFRJNmdkSGVvSnNPUDAvaEw0VmhORXhu?=
 =?utf-8?B?NzJ4TmdaRzNxMTR0cDNLRXViQkhKeWtxVEhhYndwWXlXWWpuYmFXMWdsN3pY?=
 =?utf-8?B?bTRkMW55czdPajF3aGx4Z0F5LzkxOUtBSFpsTDlrcTQ2VVNPVWVxWHNkRzdq?=
 =?utf-8?B?TXU4SEhpeWdXOWJtamZVeGtNSWpyTVhsUTVaNE5xamY3UFJUT3F4cHY3Z1RO?=
 =?utf-8?B?UklqZEl5NVpERHpHaHVBM2VvN01XMndVaG5uZG5jbEFQS0JTQ3hmaFU1aDRU?=
 =?utf-8?B?dVhGbTlIS3ExK2NYeUVRQ0dLa1BtSkp4VjJ5N3R4N2puQzN3Qit0U0x1LzZk?=
 =?utf-8?B?UGxzWlNSV0pYM3JYRkQzMVplSVVHWVZTMWtzYzkrOWtuRzNtN0ZGNUlBcy9O?=
 =?utf-8?B?R3JtQndHd2FvUitTdW04QmFGRGFhRW9ZQnUvSWgzMEJ3ZitacFJHVWxEbkIv?=
 =?utf-8?B?NzdtRC9aeXNCRjMzSkNlc2ZiRmNKU1gyOWkyMGJXK0RTd2c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djdhMXJQVTBVWC95NS81QkZoV3VBWFRrcTJMK1JTcXlDOElSVVlad2FsSGdN?=
 =?utf-8?B?VlpBbnpjeWhJTm9idUxiNWIvTHRDU2U2U3FGT1JQZzNmdHF1eDRGL2wwRk96?=
 =?utf-8?B?WS9aN2VWZnRIL0g4MlFLQTUwZEx6N29UZ1AzZ21QTzVsdHAxM2dKeE9qTURS?=
 =?utf-8?B?aE9EalUvb01QclhCUjJZWmk2S1FVb29KOTg1eStqM2MybWoyK3A1VkIxTGU0?=
 =?utf-8?B?QStieU41b3h2aDNOZ1V0ZXhSTmlwRW9RMlhoandLbFVkQ1g5dDZocWZuTUJ4?=
 =?utf-8?B?UURkK1pzQnFtY1Fsdi9qTkh4MnVEYjRKblZvL1NrcTROWExTN1U2YmFaTzl4?=
 =?utf-8?B?R0U4NWVXVmtEY2FrYW0vbU1RK3NvM3hLcVg2OVFUVEpaZysrczRpRVlBd0NE?=
 =?utf-8?B?bU56aTB3L3RwaGJ1WENkSG5hVTJWT2p2WWo0Vm1jRHliajFJS1pFSjRZZUJo?=
 =?utf-8?B?ZXZYUjVuNWdsdkpGRFBNcCtzWXNlV0FUUXRER1lVRThKbGgrL2FYeWF5WThm?=
 =?utf-8?B?T1pIcm5GNTUrSG9tZ3pBVTRWUUM3b29TbUtOc21TT2gyUGRkSEVXc1JUWmor?=
 =?utf-8?B?TEtnem5BMXFyT0V2OG9EdkpCekJTM1NRTnJtQytrdCtRUWYzeGFpSEtBbGZy?=
 =?utf-8?B?UmpXazBPM2tHb1lFMFppdXE4Nk52bXoycmR6MTA5K0dpKzJja09LM0hncWxF?=
 =?utf-8?B?SzVteUcrWktoOE84RHI3dkM2MXNReEVOd1J5RHI4TWVORDBVSlNNc1JUR21Y?=
 =?utf-8?B?cFd4K2FibUJFSitBdjR2RndNNmNrdFNTRUFsNmlXZGllYVZMZ2pEL1NMUnZ0?=
 =?utf-8?B?ZnVvcGs4QlU5UWgwb25nbXI2b1l6Z3NpcVlSSkpGbWxwY3laeUh5aTd0dDFk?=
 =?utf-8?B?R1ZXZDNtN282bG9EYks3OVMvNy83SWpGOWJEeE1WMVNjSENxY25iMTJYYUEr?=
 =?utf-8?B?SGVtbmowQmIvREdLWkRzREIrZEJpVlZHQVVWQ0drcEhnQ21zMjVidWhMb3c3?=
 =?utf-8?B?T0VPbnJPeUN0aXJEL25oaDI5Q2duWEdSbUNwWDlRMDRRUTJTZkMzMjN2Smll?=
 =?utf-8?B?VzNPcVNEcmx4Wk9QVEdRN2s2UzNmTXF1VVY1MkdoRU9lSjlpTkhqRVhRTlJr?=
 =?utf-8?B?Nkk1NkdzQnM5TzZvdktuSTBkd1JoYkdTcDBuZC9Zb3RtRngvb0NPWUhCTGFz?=
 =?utf-8?B?Q244Qy9BU1BWSC9UeHUwTkt0ZVlSK2doSTVvVy9FYmhCbHN6QlFXaHNzTEt0?=
 =?utf-8?B?bElIVUdOTVFBTlo3d0NkRHIrdHBlZFJ1bjJNV2FDKzdMOThHY3RrM0dOdXZj?=
 =?utf-8?B?ZUxRckJlclY4T1IvMzE4OVdFM2VzQnduYlNtaEVDcXpxcWw2eVBjejQwcXJr?=
 =?utf-8?B?bzdIZk9EQitCMzYyR3Y2Q1pCdFlTY0JWQ2hLNUJ1R1p6NGRhQkFWRVhXUzVU?=
 =?utf-8?B?WG5obzR2Z1dYdEQ5QUMyYTVZK1RoaEl3cjZUV1ZMaVJJNlkyK3dUYVh5LzdK?=
 =?utf-8?B?M0ZyTG1QV2ZVZ3RwdkRnUTgvTWxYbGxoSSthaENwL1g3SjFpOXFDOHVwT1l6?=
 =?utf-8?B?UkZCS3ZVVnN5bkpremg5N3VxL0xjNjFOSWZ0aVJKU2pyUUExSEN4a09GYnJx?=
 =?utf-8?B?bVAyWmZDVGVWM3FJVUUyNmNsUmcxVjZIL1Y3SFlvSlNTZ215eGsrT3cyTmp4?=
 =?utf-8?B?WVFqQnNwVU1WRTFNNHNMTzlOMHJDaWFsWnhmTFY3S2YvMG14MWF0S0pJOFg1?=
 =?utf-8?B?L1JSTGc4K0lYZkNHczZaNFNIUTlBendTMjB2aWZkUjcyblVWaTRWdklXcGFu?=
 =?utf-8?B?UjErMHlDSXFSKzNoa0d2S3BwdGNWQ25JcFRrRDRzelp3SWFpemZldENMU2M2?=
 =?utf-8?B?clRPNVA3a3hzSlM5bWdjMFRHN3RDUllsekphWWtkVmVHYlpFL1dJa0dFWW11?=
 =?utf-8?B?SWErSnZKVEx6NFRJaWh3bUpLeGwxcFROVzRyOXV0cVV3U3VXQjJHSW4ycmJi?=
 =?utf-8?B?VjArSXJyUitxSmVlMXRhdjZCc1NEWjRpbGlkZTNXTWoxNThkWGVXTnBRSzBk?=
 =?utf-8?B?QVFGdUdYQWY0TnorVXdlaWdtMTdJOFlTVGZWTTN1YXpPa3NRVWRGZkozNXpX?=
 =?utf-8?B?MVlCMFVhdzN2TlRjZmxSYzFWQjFkeDUzdlBUayt4NEVzVmF1NHJqSzdvWExG?=
 =?utf-8?Q?H8odyj5QmnsnarZBuwydAkCfgGD7/b30XbCml9OwdSdU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c3e0930-2bc2-4639-cf0b-08ddb2cac5f9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 02:56:53.2962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qEijqXOWBgkKLE26eavw8WU3NWbfS6ESTYCjphqOMHjSsiWlit6NfXsxQzOsTDR2RLCU7cj8e6kcQcxhaBjnxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF8423FDA82
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

On Tue Jun 24, 2025 at 6:01 AM JST, Danilo Krummrich wrote:
> There's one thing that would be nice to fix subsequently, which is proper=
ly
> resetting the GPU. Currently, it needs a power cycle to be able to probe
> successfully after unbinding the driver.

Yes, what I usually do is the following after unloading Nova:

    echo 1 | sudo tee /sys/bus/pci/devices/0000:01:00.0/reset

and this allows it to probe again. Maybe we want to add some equivalent
programmatically in the driver probe function?
