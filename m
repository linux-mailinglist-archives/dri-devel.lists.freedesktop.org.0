Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E28CAC47056
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 14:51:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6933F10E3C0;
	Mon, 10 Nov 2025 13:50:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XusxzQb5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010051.outbound.protection.outlook.com [52.101.46.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D11210E3BF;
 Mon, 10 Nov 2025 13:50:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t44IGI4tIev5C3QiWlQ6v+AtvUlLtwuhQOGg8Y0EddbcXJ9I61xBJTiV+XGRPV+mHiz3KWbWLXC0x5aBGs9cxrx/qXP7IglWNrqjnLC6Td9BoHMMD2ycGO5hvMEPDJ5BDD1zePg69Cqp17Hpref5WSWzm+/T5Zr9RKBr8FTYMUN2fk19fYBqXunJw7le7XtLJhpGIe/ABz1ZKC9VagYWdnCwShIzhymP6088FrU/1XBn73x0HbECDhfDHoXFqeBYL0ePBOwKEDzZrc6LpqJR7uYAreRcZqUvkYHuapazxh3RlTCWu899JGtUAH9T1R/2X/AcHSlA+OpHy3dYG3AiNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ovMUDQqSeHdh760JkrTKanAkv/mFk06JJe0zKOD3oao=;
 b=X4lalc24pRGvh+oOQRiB6jybA8fNuZMY3s9JdZFbAx2R1aT2v3WAkYdVM5aHLd5/bXngU8PYsMxYF9iaMFLVQRZvpx6q/PlpynuduHVjTXXR2x6WXM7qfwoTzUV9JZOPZU/egbdOUQEC5BCxTHmP6oJuEbSbIVgixofJr4pDpgn+a9l8R0web4Tjxy1+vtzoBX93LodGyGJPcGEm8STVQ+1N8zS3vUBSxy9pNpRjDmfE800/8r0Hj0Gyvlwyn2MI8BVxQPUK4PN9BUvptmxf6uY0+rWtkJuoxgi41hGiChF9zO3qMPh8iODG69meD+z8C6d1Lll6xLstmiaAY8BlWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ovMUDQqSeHdh760JkrTKanAkv/mFk06JJe0zKOD3oao=;
 b=XusxzQb5DcHRWs621Ue+/J8qXr2IXF+bvG23XNG6p6mxuKZDti662p0Tkesa6PasIgPSfyx+tc1JVlFn5Cyhc3fZOYOBgmrFmd1m/JUEsLYcU6wUZtHkiNCHBz1cQXCjKVoGqZjEwsXWaSgDHAkezAiIL73Iu1GyKBzDLk0WmkorY0Sj26G3d0ob3unTiswtJI1WmDMC8O4QYYymsW49awIeqsB+IZ0yuP4dSvbtULtJyzGnjqdP4NoNgTkUDRYV6KwU1wq+oQgfkeLfc/RQX/gkIhAciJq23n2nymb96vSDGCUToJfps197pj/WQWFwBAEJMlrga9RjybPlDel0Sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYXPR12MB9340.namprd12.prod.outlook.com (2603:10b6:930:e4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 13:50:53 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 13:50:53 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 10 Nov 2025 22:50:49 +0900
Message-Id: <DE52APJTD9NN.A41RA78NMNIE@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>, <acourbot@nvidia.com>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, <nouveau@lists.freedesktop.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 08/12] nova-core: sequencer: Add register opcodes
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251102235920.3784592-1-joelagnelf@nvidia.com>
 <20251102235920.3784592-9-joelagnelf@nvidia.com>
In-Reply-To: <20251102235920.3784592-9-joelagnelf@nvidia.com>
X-ClientProxiedBy: TYCP286CA0344.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYXPR12MB9340:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a40cb8d-b292-4cd1-0f6a-08de20602a69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eStOMnZqc1ZETUZDUVRudHYzT2ZXMU5DQ2I4R2U2bXBOV0Roc1h0STJ0TUtx?=
 =?utf-8?B?ellrdWFjMWNFUTZKazk5Z0RPR0o0aTdHejQ3YUFqM3RVRVBtbkM1S052VU50?=
 =?utf-8?B?L3JrVkFiWUw2cGhnZy96RnhnbWQzTkJSYXY4a0dFaDVXbzFleDF1cFdhandu?=
 =?utf-8?B?dzl5Qm04VEkzSVBqMlRTZjd5Nm5HTXUrVW5PVnhZU1ltOU83a1VNZmxZY1dn?=
 =?utf-8?B?OU1BYkxIS3oxNGRzRjRYT2xFcDduVko1QnQ5SVRGR2ZhTnhRSncrSHFEaVV5?=
 =?utf-8?B?R1dYTGQ4KzZkR0dTcXlrUXV3V3lXUXB4amVkWUh0Rkt2RHdzYlZFaWF3TVJ4?=
 =?utf-8?B?Rm1selFySzRlNmFidkY1MDNqZ0ZoNnJGMVRJaEUyeHlKNi9Bb0pMQ1QzZTNF?=
 =?utf-8?B?elFwMnc4MVBoRjBSQlNJeXhvZGtYaDQ5ZkUrTnFRSlJjRGprdkdZeW40eHBK?=
 =?utf-8?B?ZVh4K0tsQ0dQblBxNEhMQXA3VjJjR2pVOEJWcGVlQ0tVOVV2cW1EUnFMb3dE?=
 =?utf-8?B?bGI2MkJFTHdjdDVaZGM2cGd5YTUrSXNpZ1N1RGhLSWpMY2lJQ21XOXNIdzl0?=
 =?utf-8?B?citJTjRsbm4welJtZzhKbEk2UjQyZStzR2NKY2JVbjdGY2xIYjVvZWFoUkp3?=
 =?utf-8?B?WlVhRW9ZTGt5V3IwYVkzT1dlTE0vMnpleUp0aldWRVJHU2Q0RFJpcytERk05?=
 =?utf-8?B?ckdHYUVQVnBDQ2RPUW5XeGNJRWQ4NkU0OEpKZUZZMnJCTGdRZ3NZanl3eWdV?=
 =?utf-8?B?NzZtMnlBMXFaZ3hjSlQweW8wOGpoeHZ5UkQ3UjhvK2dTaFhFMzAveCt5SEhs?=
 =?utf-8?B?ZisyS1RRNzdLb3p6cU8yZjJVdWhOeXdMR3lqQnpUM2NaRWlqOGRTZ0s0V21H?=
 =?utf-8?B?REZ1d0VNd284eU9iQ3hZcnF1Wkc2dEJ6S1hnOG5uaTlGcnA2bXp5c2twVmQ0?=
 =?utf-8?B?QWF5alcxNWdBbHIvbkxlbWZDVnBtOFhTWC9INnpmcE9QT0d0elJKbytJUjJ3?=
 =?utf-8?B?b1dWL2NlUko3Nm1kVGNTOXNSY2s1ODE1T2xoRDdPeVdaU0RmczJ3TlpjUVJx?=
 =?utf-8?B?Z0p0UjhVVkhOZkxKOHByWkx4Y3orRXh2bnozWVRiT2QwSFZBWHZ5aUJoVDdJ?=
 =?utf-8?B?eUNoeVg2NHk0QWFRMWtOR2hMYXh3MGtmVnpLRUd2emx3SFovb1JFaEVoc3FZ?=
 =?utf-8?B?b21ldit4L0lRNldZWTJQejhkdVZwd1V6RVg2ckc1dVFNRGRuTmx1TzJCQXBE?=
 =?utf-8?B?RUh5SHBDQ29vMTRpRkV1ZGN6WngwUXFrRHA4L2hSWFpDVWw1NE41UWFWQ1hE?=
 =?utf-8?B?bGZ6T2tNWGNDUzBUNSt6L01iMXg1dytYZnBmLytCb3hQWEM2NTZtVU9ZbWpr?=
 =?utf-8?B?VVoxWWpuL1hpV09qV1dneVZOT2IyMUNyTlZlK3k1dk9SRU52aVhWbnNaV0ta?=
 =?utf-8?B?QnpJNW1GS09rSVJXZ0RBWjB3K1ZtMjJyeDM3ZnQ2bW5ocm8vZi8wV3BIcjFz?=
 =?utf-8?B?aGFxb0xkYlVCc3A0aWFQekloRVNvR2dTYmdyRTBWenI1MUpuWVljV2ZaMDVz?=
 =?utf-8?B?cXBsNi9zcitPYUNWM2FIWnBtMzRQUGVRLytaNlEzOWRLYitpanpPVmpONlp1?=
 =?utf-8?B?SVhhNUFuUzJONE5lNlVKZTVPd1pYL0RaanQzRitpTU1yaXpwV01qZ1JlZU42?=
 =?utf-8?B?WXRtdTZhbmZNM1VLYkdDQWl2OE4vQzlPaGE3VWU4L2wrWnRYQnkzcEdSSkhk?=
 =?utf-8?B?YW5YSFVUTnZUVUZsQmp1WmExNDNSRGRSYnhYcDVzQStycVR5bUg5UStXNU5C?=
 =?utf-8?B?T3NzMWRNamRQMnc2cThlSlNyQjQ1TzZ1d2h5SC9yYlhUTkZRUTZkQnBKelhP?=
 =?utf-8?B?RXFITFJaZVY1YzJacjFiY050dHg4N2hXV0xEUTBjZDdsTkFNWnpHZUNDZzdM?=
 =?utf-8?Q?/D82G5kU0UwLXxDIXn/YF1/Q9EVFAqmX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmNJUHk3OTR5UWNPQjJ4M242T2tIZ3ppMU53djM3aEtYT2l3MVVGOHdoTTBh?=
 =?utf-8?B?dXgrUkorVkF5WndhSGhEd2ErUXp3VkEvV3F6T2MxeUJ6QXNtb1VMcFc3ZndG?=
 =?utf-8?B?ZDNpTlRTeUlyUFMzUFdNdDFsK2RndmpZOVVtWG1VdTlMTEFjTEFsd0I3bHM3?=
 =?utf-8?B?MTA4dnA4MzBJamVwVURHdkVXS1RzeGtMZmtMQVcrR2ZqQWdYWkFIV1dYRUtq?=
 =?utf-8?B?OFRVcVZaWDhNaitub2RZWm9RM2RpZmVacjhFL1llTmN5MHRsaXVuOW40dTUw?=
 =?utf-8?B?NFNBVVZ4MVh5alVFM3BpL1hDVVVPUk5uVFVvSkJ4LzZya0JoMVlwQVcrNENV?=
 =?utf-8?B?TXpWSG93OE1PWDlSek5KWmpSSG1VZzBIbmlQSVBEbEkvdEUrRnUxeGN6RGR3?=
 =?utf-8?B?eThRU3N5SW1ONGl0d1J0bjl2QVBSeEJqR21GTTZXTlFQQkJHS0o4VG9tN2wv?=
 =?utf-8?B?bXEvZVJ6WTIyZkJyblZZZjFNUmJpSTdmRVlGOFVvcUd3S0xaTjc5MUU4QmhV?=
 =?utf-8?B?T254WGdqL0J3RFM2cXFWZDlQNUJVQS9ZbzVyWUJjdEpTVCswaEhGVUE0bGJq?=
 =?utf-8?B?ekJMbEY5WUNodXY4d1NTTm5xdWhqSHAxSGN3bGdkd2FsRWpIeWEwM3dEbE9Q?=
 =?utf-8?B?c0FBeHkvUnJ1dU44V2taWm5FaytJSEtBOXQ3eGJXdzBvVVlmY3dvdE5TZXlx?=
 =?utf-8?B?eWM5TVRoNXE3Wm13Sk16R3YveEwydmlsNExDUWZ2K1ZSRHVhUjZjbEdNdjBp?=
 =?utf-8?B?L3UrV292bGJXK2ZzK1lOWlBCeEVaQVhOZFNIemhNdHM2QlJSQlBXVGM1T2lv?=
 =?utf-8?B?dE9LNVhvbG5mZElPTEJMc0x2RVpmb2xmdnBNUXZqcG13bk9vRFlwd3kzTGJQ?=
 =?utf-8?B?OVV4RlplODlyT1RuTUFvRjhQUDBqY0ZMakJVQUN5bmNrbitjS1cxQ3pFVFdK?=
 =?utf-8?B?SEtjV0VQK1praStSQnJvT2pnOEdLMVpYZWVlKzJlMVY0OGJqNjFvZlFRQUlv?=
 =?utf-8?B?eGhEU3RNZjV2M0pEZXlxbGMwejA3K3B0dDhkLzNvWU5lcWdVRHJpY1N2VG5m?=
 =?utf-8?B?My9wMDB3WUs2QmJwK211d1c1MTl6Tk9CNjRKVzZZelU5RldGOUVIYmoybGdJ?=
 =?utf-8?B?cWxuMEFWMTBMUUlmbmZwcTdYN3lpeTVhT0w2T2w5ZWowQ3hYWWtaRW93SVlI?=
 =?utf-8?B?czhiQWxWMUdQblE5TjRIT3VOKzI1bk5Pa1NvcElSbFBXLzdpSTN3ZVhGaFNV?=
 =?utf-8?B?cFNRSWZuSGJRa3hKVmV5aXovekxtUkxJMHhZNS9lZllOVWRQNnJyVG9zNVJl?=
 =?utf-8?B?cE9FSnRjVEdMVmhmeDhkSGNLNU1DTzZaZGZUWlNCWUZLQ2Y5d0lzbjYxZjdT?=
 =?utf-8?B?UE9vN0pFNlNiLzRVTmozNll4UjF4RjllQ2MyaEd3VmlzOWJFaU1qOFBiUnEw?=
 =?utf-8?B?NkwyQUVKZktPSzFmbzVyOTZjMGIzR0xmZ2tBbzZBWVVzRFIzaXp5VG5NazFD?=
 =?utf-8?B?ejQ1RDY4UVdnay9BeGhzbFZ3eHlTcnVsZC9WMEFFZG43UkJJL1M5SmRCZlZo?=
 =?utf-8?B?V2taYitITjVlRG5vU0pSU1cyazdnYWtFckJkdlhicmlhZFdBUWp3cGZpcTdi?=
 =?utf-8?B?MnBQT2lNS3YrTzRIaUJkdjE5bjlMTk9laHY3dDk2K04vQVFsTGdlRmZ0MUdE?=
 =?utf-8?B?Y0swWlc5WXFhMGMwVkRjZC9mV2FIS3JFY1FWeSsvQzQwWnMxQUxtRUN1TnU5?=
 =?utf-8?B?RzkrcmRBSmQyVVFXaUdpQnNuaGJ1Mml2VEZtWDN2RzFpWURkdVFOSGNPRHRu?=
 =?utf-8?B?Vk1CeUk5TTk1T05NWEgwVDRKMEh4K1pNaW4rRGp0YVZDUGtyb1hFU2lYNXNr?=
 =?utf-8?B?RkEwVnB5SUdmQ3J5Qk1uU2p0aUhIaFZNMmxDeXJOeC9tODlIVmM5a29acjZv?=
 =?utf-8?B?YlkwZ3VZZHg5ek1nVnc2clZxbVZXb3NTbjRDbkF6VWVjODZ3Y0VlYkNiN0s4?=
 =?utf-8?B?QUNuQm5jV0xFd3pOazhXZWtVTFdqc043TzdwVU9NaVJrckE3NlF6c3oxMWpZ?=
 =?utf-8?B?Z1psd0EvUW40Wk9sZmVDQTYyendDbUwvMnBITHdpbHpvSFJxOUVjTmtUVk0w?=
 =?utf-8?B?V1dicWRENy9HS1YvZEloc2pBTk1rREpwTXVlSU1mZkhINjAvdjdGZy9waWg0?=
 =?utf-8?Q?V+0rz2/lSq0XQ38bH8fzmLTSsIPGW1+dZtVgndMfJ/dD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a40cb8d-b292-4cd1-0f6a-08de20602a69
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 13:50:53.5196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7w+EM+D2Q7Rh5cRduLv1H8PiIOg2/ga/wuGU1hnQLCqGXilMOhddrT1dQiLsn6frwxJBSqf+fnT4Jq0kjZdvbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9340
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

On Mon Nov 3, 2025 at 8:59 AM JST, Joel Fernandes wrote:
> These opcodes are used for register write, modify, poll and store (save)
> sequencer operations.
>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/sequencer.rs | 138 +++++++++++++++++++++++--
>  1 file changed, 131 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-co=
re/gsp/sequencer.rs
> index 48c40140876b..f429fee01f86 100644
> --- a/drivers/gpu/nova-core/gsp/sequencer.rs
> +++ b/drivers/gpu/nova-core/gsp/sequencer.rs
> @@ -5,6 +5,7 @@
>  use core::mem::size_of;
>  use kernel::alloc::flags::GFP_KERNEL;
>  use kernel::device;
> +use kernel::io::poll::read_poll_timeout;
>  use kernel::prelude::*;
>  use kernel::time::Delta;
>  use kernel::transmute::FromBytes;
> @@ -40,13 +41,36 @@ struct GspSequencerInfo<'a> {
> =20
>  /// GSP Sequencer Command types with payload data.
>  /// Commands have an opcode and a opcode-dependent struct.
> -#[allow(dead_code)]
> -pub(crate) enum GspSeqCmd {}
> +#[allow(clippy::enum_variant_names)]
> +pub(crate) enum GspSeqCmd {
> +    RegWrite(fw::GSP_SEQ_BUF_PAYLOAD_REG_WRITE),
> +    RegModify(fw::GSP_SEQ_BUF_PAYLOAD_REG_MODIFY),
> +    RegPoll(fw::GSP_SEQ_BUF_PAYLOAD_REG_POLL),
> +    RegStore(fw::GSP_SEQ_BUF_PAYLOAD_REG_STORE),
> +}
> =20
>  impl GspSeqCmd {
>      /// Creates a new GspSeqCmd from a firmware GSP_SEQUENCER_BUFFER_CMD=
.
> -    pub(crate) fn from_fw_cmd(_cmd: &fw::GSP_SEQUENCER_BUFFER_CMD) -> Re=
sult<Self> {
> -        Err(EINVAL)
> +    pub(crate) fn from_fw_cmd(cmd: &fw::GSP_SEQUENCER_BUFFER_CMD) -> Res=
ult<Self> {
> +        match cmd.opCode {
> +            fw::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_WRITE =3D> {
> +                // SAFETY: We're using the union field that corresponds =
to the opCode.
> +                Ok(GspSeqCmd::RegWrite(unsafe { cmd.payload.regWrite }))
> +            }
> +            fw::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_MODIFY =3D> {
> +                // SAFETY: We're using the union field that corresponds =
to the opCode.
> +                Ok(GspSeqCmd::RegModify(unsafe { cmd.payload.regModify }=
))
> +            }
> +            fw::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_POLL =3D> {
> +                // SAFETY: We're using the union field that corresponds =
to the opCode.
> +                Ok(GspSeqCmd::RegPoll(unsafe { cmd.payload.regPoll }))
> +            }
> +            fw::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_STORE =3D> {
> +                // SAFETY: We're using the union field that corresponds =
to the opCode.
> +                Ok(GspSeqCmd::RegStore(unsafe { cmd.payload.regStore }))
> +            }

I'd rather have these `unsafe` statements in the `fw` module - guess
that's all he more reason to add an abstraction layer there.

> +            _ =3D> Err(EINVAL),
> +        }
>      }
> =20
>      pub(crate) fn new(data: &[u8], dev: &device::Device<device::Bound>) =
-> Result<Self> {
> @@ -64,7 +88,16 @@ pub(crate) fn new(data: &[u8], dev: &device::Device<de=
vice::Bound>) -> Result<Se
>      /// Get the size of this command in bytes, the command consists of
>      /// a 4-byte opcode, and a variable-sized payload.
>      pub(crate) fn size_bytes(&self) -> usize {
> -        0
> +        let opcode_size =3D size_of::<fw::GSP_SEQ_BUF_OPCODE>();
> +        match self {
> +            // For commands with payloads, add the payload size in bytes=
.
> +            GspSeqCmd::RegWrite(_) =3D> opcode_size + size_of::<fw::GSP_=
SEQ_BUF_PAYLOAD_REG_WRITE>(),
> +            GspSeqCmd::RegModify(_) =3D> {
> +                opcode_size + size_of::<fw::GSP_SEQ_BUF_PAYLOAD_REG_MODI=
FY>()
> +            }
> +            GspSeqCmd::RegPoll(_) =3D> opcode_size + size_of::<fw::GSP_S=
EQ_BUF_PAYLOAD_REG_POLL>(),
> +            GspSeqCmd::RegStore(_) =3D> opcode_size + size_of::<fw::GSP_=
SEQ_BUF_PAYLOAD_REG_STORE>(),
> +        }
>      }
>  }
> =20
> @@ -83,12 +116,103 @@ pub(crate) trait GspSeqCmdRunner {
>      fn run(&self, sequencer: &GspSequencer<'_>) -> Result;
>  }
> =20
> -impl GspSeqCmdRunner for GspSeqCmd {
> -    fn run(&self, _seq: &GspSequencer<'_>) -> Result {
> +impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_WRITE {
> +    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
> +        dev_dbg!(
> +            sequencer.dev,
> +            "RegWrite: addr=3D0x{:x}, val=3D0x{:x}\n",
> +            self.addr,
> +            self.val
> +        );

Per the other feedback I believe you are going to remove these `dev_dbg`
anyway, but since the opcodes derive a `Debug` implementation, you could
have just printed that from the caller for a similar result and no extra
code.

> +        let addr =3D self.addr as usize;
> +        let val =3D self.val;
> +        let _ =3D sequencer.bar.try_write32(val, addr);
> +        Ok(())
> +    }
> +}
> +
> +impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_MODIFY {
> +    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
> +        dev_dbg!(
> +            sequencer.dev,
> +            "RegModify: addr=3D0x{:x}, mask=3D0x{:x}, val=3D0x{:x}\n",
> +            self.addr,
> +            self.mask,
> +            self.val
> +        );
> +
> +        let addr =3D self.addr as usize;
> +        if let Ok(temp) =3D sequencer.bar.try_read32(addr) {
> +            let _ =3D sequencer
> +                .bar
> +                .try_write32((temp & !self.mask) | self.val, addr);
> +        }
>          Ok(())
>      }
>  }
> =20
> +impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_POLL {
> +    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
> +        dev_dbg!(
> +            sequencer.dev,
> +            "RegPoll: addr=3D0x{:x}, mask=3D0x{:x}, val=3D0x{:x}, timeou=
t=3D0x{:x}, error=3D0x{:x}\n",
> +            self.addr,
> +            self.mask,
> +            self.val,
> +            self.timeout,
> +            self.error
> +        );
> +
> +        let addr =3D self.addr as usize;
> +        let mut timeout_us =3D i64::from(self.timeout);
> +
> +        // Default timeout to 4 seconds.
> +        timeout_us =3D if timeout_us =3D=3D 0 { 4000000 } else { timeout=
_us };

`let timeout_us =3D if self.timeout =3D=3D 0 { 4_000_000 } else {
i64::from(self.timeout)`

(removes the `mut` on `timeout_us`)

> +
> +        // First read.
> +        sequencer.bar.try_read32(addr)?;
> +
> +        // Poll the requested register with requested timeout.
> +        read_poll_timeout(
> +            || sequencer.bar.try_read32(addr),
> +            |current| (current & self.mask) =3D=3D self.val,
> +            Delta::ZERO,
> +            Delta::from_micros(timeout_us),
> +        )
> +        .map(|_| ())
> +    }
> +}
> +
> +impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_STORE {
> +    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
> +        let addr =3D self.addr as usize;
> +        let _index =3D self.index;
> +
> +        let val =3D sequencer.bar.try_read32(addr)?;
> +
> +        dev_dbg!(
> +            sequencer.dev,
> +            "RegStore: addr=3D0x{:x}, index=3D0x{:x}, value=3D{:?}\n",
> +            self.addr,
> +            self.index,
> +            val
> +        );
> +
> +        Ok(())
> +    }
> +}
> +
> +impl GspSeqCmdRunner for GspSeqCmd {
> +    fn run(&self, seq: &GspSequencer<'_>) -> Result {
> +        match self {
> +            GspSeqCmd::RegWrite(cmd) =3D> cmd.run(seq),
> +            GspSeqCmd::RegModify(cmd) =3D> cmd.run(seq),
> +            GspSeqCmd::RegPoll(cmd) =3D> cmd.run(seq),
> +            GspSeqCmd::RegStore(cmd) =3D> cmd.run(seq),
> +        }
> +    }
> +}

This makes me wonder: do we need to store the deserialized version of
these operands, and make a second `match` on them? How about passing the
`bar` to the deserialization command and have it run the operand
immediately?
