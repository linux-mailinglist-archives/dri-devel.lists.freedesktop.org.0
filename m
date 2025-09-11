Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D81B2B533A6
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 15:26:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 335AC10E371;
	Thu, 11 Sep 2025 13:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OAkzerm1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC6B310E0A4;
 Thu, 11 Sep 2025 13:26:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WvVTEdmiV2k6/MLFJPzRxRCAihIlYc8CaJ5OuYmGmSDFtiIGXLmhh3sCuUtTwzgENvk+zEpIXiQIbUjr6kqMB52a/6Zq4NBaqTaC5r987xIRFBUUXCcLYVhVhNI83Cpmx75FL+MrEdQtUUc8LNF+UHiszNKUTGWSJEqmuWLlkLC6aKyz44ZE+N0xlc45xCl+ympAITFAyAKNA/ix0Kfonh0v5ZsT2979g1mr1OOflZ1d5e0BaDjts4/d60EyhUjZ6oVBoAYTLQq4m+4D//NCulxO6R1bJYsjEmxuLJIWYzg+zg+aV6J8bx+sZeXglpWqakA5WnRN932Jhn++tRtjdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3RIiJJvODAxD+MJBU8qZiBd7OW7hWECT7g117iD6C0=;
 b=QwcohTerDTltMM8cJOxsdMSby0Zf2/m4uNNzmNcwPb+mrI20VxzUqgRHNWZzXPmbGmb2Uy0JJfNdh7wAQ4O46s4QVSlb0YpLgMydANC8IzIo677lCe2yLmLGqTG3xatCIjm7uIF9w817ujSPhhqe8ksq5BHVkSySShVBTuY32355WekspYzv0M+8ZJCiy0OJnBEUlb06zLiYWzMN2hJbx6adLM4MQCONtnhgudGBj0i1X2+d33pIHBPSrHtWnX2FDqY7fPIhkCDbCs/Uc9PftgxAyK0yzmYO3g/YHCdHnRiudqdawzBF2dZLveh7BR9hfxqJx6G1xn87W+HK2YvuZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3RIiJJvODAxD+MJBU8qZiBd7OW7hWECT7g117iD6C0=;
 b=OAkzerm1vYdgDOuoUl7xbiV8Udpjo27dW+W4q73ZltBVzEeL5090gtIJNZAEwPWcLkLx8XKJdHKoazgwU+UChnCYyc5gqeJv3m22B856uFYSa8awRAuYyNsT6Jj2NYUEQpkdYM0zo+9bQ9TKT7JJG+AWiTfQBBqa6oIdWgRQCg1PSxdPo/ZfDqpw09zWb3tZROAc51lo3dIglJIBO1eSIdP6khVhiHwI6RUZ8iPp2WyO+GhTmfWXLOr0WEWjy0R0qrn+kCiUxel71R36UrwoESJuTziAKleYBv142rXackNCGlICdXqEWyv8lXcWQM0ELksrmd3k6AOY1t83AsAvHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ5PPF0529573EF.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::987) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 13:26:12 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 13:26:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Sep 2025 22:26:08 +0900
Message-Id: <DCQ074EMFNIK.1OJLWJXWZLDXZ@nvidia.com>
Subject: Re: [PATCH v5 02/12] gpu: nova-core: move GSP boot code to a
 dedicated method
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
 <20250911-nova_firmware-v5-2-5a8a33bddca1@nvidia.com>
 <e1755470-587b-4a43-8171-3d031b7fb4f4@kernel.org>
 <DCPYQNZG1OJK.2EE4JWJAROK57@nvidia.com>
 <ce74db34-77bc-4207-94c8-6e0580189448@kernel.org>
In-Reply-To: <ce74db34-77bc-4207-94c8-6e0580189448@kernel.org>
X-ClientProxiedBy: TY4PR01CA0082.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ5PPF0529573EF:EE_
X-MS-Office365-Filtering-Correlation-Id: e21fe6ce-3a34-4848-a1ba-08ddf136c636
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZU9vc3VjSVRjRGxsSXVldXNubmZObFFxZDRqQnhOKzRVQWtJSDlEekVXaWQw?=
 =?utf-8?B?aTdNbHNPSERPNjJkZ09ldDJraDA4VlhQS2ZaVHFFZGkrbVZ3UzRMRmc0TVc3?=
 =?utf-8?B?Y3lyWmpWRkIzUVhmWWJZVjBaOXRwNmtwaGhxbHpGU2xVWkZOeHdOZjVpVHVM?=
 =?utf-8?B?YzBqdGFOakFxVHdFODc4QU9wRDFSbUlJSGFtbmhHWStSdlVCblQ0WmNyVDcz?=
 =?utf-8?B?V0dYVFhaciszOGMxSnM4WDAyU0ZheC9Icm5kbWVSaUtjbGhjM3ZjMFNpMklu?=
 =?utf-8?B?UmQ0d2VkOTNPaUVZOGxYUGQ1RmoxUFpVQUNMM3YwSHA5RjVobVh6L0podWJu?=
 =?utf-8?B?NWJmdzVIZzhWL0pMdXlrUEoxbk10UUtjeE84ZjJWS1FYZFdwbmR4ZlVBNkdw?=
 =?utf-8?B?b09NbXJWa2loaU5WZEM4OG5vblpqMnF2WXZMU2tWN0xWV1pjTFVUSFRjMGhV?=
 =?utf-8?B?Mk82bTdWeGFIUnB4dHBIVDgyRk5pOGFiL25JQ1J5dmhDZHQ0UVQvUExZQ1hJ?=
 =?utf-8?B?bjMyZE9VdVViZy9yNmFTSC9YaXgySGJPV3lXaFQyVnpZcDBKTkh3TTJuc2Fx?=
 =?utf-8?B?UXUzSTFNeTZQZ0FvaDQ4d1cwVDZ4amJZb01YNURKblZFa3hGc3pTTnM0aWpC?=
 =?utf-8?B?QTFZT0lsY1ptZmxTQWhTUUgrMXp6Z1JPd3RPQzBKYlJ2c09nOS8xODRGQXY3?=
 =?utf-8?B?VUVsVzVZQUhSaHo4ZG0xZkt0MjZBL1BjdTVaeTJVQ2hjT1dRZHhNTlkzT09m?=
 =?utf-8?B?OURBaW44UEo4VW9NaTdseHRlUnBwbUswNnMvUDVxVjFwWHhSZ2NrM2F6L1ZP?=
 =?utf-8?B?RGl1ZXZkMHZwZUVwOEVxcENXemloR2tJSXpXeDVpNkxaRDRwOGlpeURmeWZ5?=
 =?utf-8?B?ZHljSUY2M1VFcC9xM0htemVMSUNoenRvZnE2dklwZjVZWjAwbnRUOWZjMGNX?=
 =?utf-8?B?eU1lVHlFNG9aMktEYlExbjVCK2FMekg4RkorMmpKVWozNy9MUW1SbW5CajNC?=
 =?utf-8?B?YmlEdmUyWFpsam1Za1c5eEVrajhrWVBBcmRJdXhUUEVyZEdtbC9LSjVvbm5p?=
 =?utf-8?B?dDFsaFo0SC9sL2pIOUU5SHJkcHF3ZXZJR2pLZEV2RnhLaFV0bVZRalhUcVl2?=
 =?utf-8?B?S016RVJkODk0MDgyK2tldVdaekhnMXRPd2VTUkwyZmR0cHpYcHpLTjlaUFpE?=
 =?utf-8?B?cnhJZ29VTVZOa3F3eXVBenJHaWloT3NSalRjbTJyYnMvTndsRG5SaXZDdEU0?=
 =?utf-8?B?VTRyWkh2U05iQkYwV1phTlRXVjJRckQrYWh1Y0hiemNqYmFNWENEUk5CQzMy?=
 =?utf-8?B?SmNxWFZ3VFp3bjFScHRpYzlvOHh3VHpWYWpBNkNROVU1anFhZlRDNG05dUp5?=
 =?utf-8?B?SEh0Nkx3ZDdVSFJVZ0prMklQWEtJMzVuTDJzS3JnOWJsOHBmRDE4b3Q5MG83?=
 =?utf-8?B?blZHejloTksyTDQwVk9iQ09uZnJYeXJkTE1vbUc3UU50RGZSMEtWeDlZdHF5?=
 =?utf-8?B?djYyQUJ0M1pVYzZ1OXhXVGh4aTBXNUJuNlp1VUpWREMzM01wcnNIRHFvY1gz?=
 =?utf-8?B?dFpFTSt4em9ISEthQm5YYzBzWWRMWTN1VDZMSzNZcHZPMm4wQjdDYnV4YTda?=
 =?utf-8?B?NVk4RVpNQVROMVJMMmV0ZEZUeWdmWG5Ec2NpNDJidDZUWTFkUzNHUjcyTkY5?=
 =?utf-8?B?cFBMZXpRMnlzODRlaHFpZit3OTB4MlB6RDhBQzJBWUlLVGpTWjdhMTlLSEJD?=
 =?utf-8?B?V0tJT2tPa0UyekpVNnNtcVN6ZGVNV1IzdFNYRXhTeG02cWd3S3BraUdLN2RK?=
 =?utf-8?B?TTg0MURNUGM5NHFlTk1TMEQ5aW1QV1BjbkhOOUVhZXkzRU9kWkg4Z01peDJZ?=
 =?utf-8?B?SURjeDJ3d0cwR0svb3lUNTJMSUFwTU1McTFmN1g5L3M5blNidVE0dzl4aW9l?=
 =?utf-8?Q?hTqXJNe5b8E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXVwdmhzeU92VnhYNzUrYUxHRGhiTVQ3cW1aMER5Y1hVSVFmY1NicnVYdzNv?=
 =?utf-8?B?em1iRVNCU1UvVWpZNnJoR3pQT0dYb1Z2SVF6Z3c1OVFMKzBFWHpWTktXU3lI?=
 =?utf-8?B?dXBJR3RFbHVBWlEydlNxU0thNFdJZlUrV2dOaUFLcjZ3MU5sN1JBaHN2dlQv?=
 =?utf-8?B?M1NMNjhQMWpEUW5YOUpZOUxNNXhhZWxBdVEwRVcxdERPaDBWZmhpZVJsa1VX?=
 =?utf-8?B?ZUFWczk0ZnF6cnY5MmpWTHA2S0U3MGowRjRpcm4vNEtzL1AxM3RFUllGbGN1?=
 =?utf-8?B?OHZ0TE9RUVk3dFhvcDhGK2U4R3gzWFBWTmJSQktWUWZ4Vk1pT2hIbWRNeUVl?=
 =?utf-8?B?M0IrL0V2TjQ0OHgvMEJUUlZGeDZIMjN3cVp0Mjh2Uk5xSzlXRUNhVUxPQTh4?=
 =?utf-8?B?N2kxbEtCWVhDNHZ6UTFaalYyWHN1NEMySENNbHdVTGN6MHlXZUJTRlpzTTRp?=
 =?utf-8?B?UnVQMEZrMDRVVG9iWitGa2JNR3BDZm5mRHFDZCtXMFY4cEFPSHgvczdPaVd5?=
 =?utf-8?B?KzZvK05PcFlhZEN6V3phTk95Tm9FT01IVU52SWwvZGFzSlpGSzMzdlNoV2NI?=
 =?utf-8?B?WlVHV1AyeTRZTHhPYzZ5UExxcll3QWdBQWtBdVlnWTF3azR5N005d05WTmtt?=
 =?utf-8?B?R3FHOVZFbDVNSlRxY0FnSWgyQ3FKUzAzZzU3ZVpZZG5lcnpINzcyT2wwMHVy?=
 =?utf-8?B?eGwxS0J6ZmxTTHNITUk5SC8zNTIxVU13NEwxRDErV2hmVy9LQ3QxQmsxa0Fs?=
 =?utf-8?B?UDNIL0w0aWhkanYrSi9hN3N4cnlqMlVCbWxOaStOZVhFRTRJUFJwVWQxakJi?=
 =?utf-8?B?dlZaUmRoNTRKVVhqWjFZUzdmV2N4UUVROTZSSzY5aVcwYU5Uck1OcC81S0VZ?=
 =?utf-8?B?V2orcjhqcXhTQ0s0ejVSelhZa1NaeVhLdU03ZTZLekpUL25nNHFQbjJITFdp?=
 =?utf-8?B?MFZlbmhQNmZqeGdNdEhVT3RTdlFQZ2hMTWw3VElhZk9QSmRkRmQ3WThoVkJZ?=
 =?utf-8?B?dy9ZMlVGT3VQNWQxell4SEFMR25oYjJiVWhmaTN4L0RTY1o3WjdISHRiZVBT?=
 =?utf-8?B?bUxQWG1HRVdnalFvOVIxTkJ0aWR6T0FGc29vZVRCZHJWNFdQNmU1Yml2ZXNE?=
 =?utf-8?B?RG5relg1ako0SEZGWkpDMUdab2ErdlRtQnVOQmttYTVVYVFOR0dRWWFtR243?=
 =?utf-8?B?Q2VtanRpblBxM1lKdGVYNEs3d3lUL0pNc0RmZEJFeEdSd3F1bldoWTIvSTll?=
 =?utf-8?B?SlZlc1NZUmxWQXNicEs3aUpjQzF4N1JBUGhYeE84NFZxT2V5V1M1Z2JoR2p5?=
 =?utf-8?B?cUwvYWRiSlJwUEI1RXB1SHk1VWRCRjBQQWVJMXdyNjBkcm9pajVWb1k0ZFZJ?=
 =?utf-8?B?RDdOamVZUHdEN3BNeGp6bEJCc3F0QUw1a1dzMGQyQi9zNWJnMUdOOE1kUm1w?=
 =?utf-8?B?WW02Mjg1TGRVdjlTTHVSNVY1YkJlMXZjTC9zZ0dRQWZmTVpuTFZ5UzhJcDlT?=
 =?utf-8?B?R3BaTC84SmprRGhDcDNjTUhUYzJ6VW1HdjlONStield3UWpsTkgyWEhVa3Vz?=
 =?utf-8?B?RUZVd3A0Q21aRUIvNzZEVFM0ZWJzendwRmdJdUtkOHczOUdTcFpGVEhzTC9s?=
 =?utf-8?B?c1Z2R05BZi8rU1lqZExyQm8rQVNzdDJvY1gxbk1yZUlZK09wamNHTjd0YlBU?=
 =?utf-8?B?cHlDdVVOYlgvV0RiZmpWZ3E3TUgyaFFTZlY5WFRNWk5xWWlUYUNMejdEWmla?=
 =?utf-8?B?NER3NnNRYmluY3dwYVJxRUFJQ3EyN1hEd0ZoMHgydFd2RDN4YmsxK1NlSnZa?=
 =?utf-8?B?d1UwaUx5bm9Zc3NhOEVhTEM5Nk4zR2R1bFZwVm9VY09wYVRqYXVDK2RtaENE?=
 =?utf-8?B?WlNpc0VTT3B3Zk03UXFyYW1Od0VodUFTZ3NYSUhxVnpEVXNweHBMMW1xajBG?=
 =?utf-8?B?czdwK2c0QkJUZTlCdE9vTHhHVzlsejBiSHV5U1BLc0xUZjlQYzY2SzhFbG1C?=
 =?utf-8?B?SXlmUEtYUWswemVZeHlpc0c3Z0pVR3JtdG53NVdERmhJeFpWbEwwQ2hzMllw?=
 =?utf-8?B?UHhJcEpzRnNyM1NRaWlwTm94azU1dzJBSkZtbXRYckZtaUZ5MGdSLytpS3Ru?=
 =?utf-8?B?bUpwcjNTeDMrRjFhWkJZYXFWVCsxVVoxMHpQVmE2N1ZLcTZoSmpKQ1JuRVJB?=
 =?utf-8?Q?znWUy0XG+a3eJqcbB8bX2gQvDkqsg3wl+zDqwHZfW3Hd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e21fe6ce-3a34-4848-a1ba-08ddf136c636
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 13:26:11.6008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WQKMrxpLfqJQJL6xN4a0pLsN2I28hYr7PnfWA5SKBnvdsBC9pOPmyCHTF4+REOAbaNDTIcgB7RTECHL3B8SZYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0529573EF
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

On Thu Sep 11, 2025 at 9:46 PM JST, Danilo Krummrich wrote:
> On 9/11/25 2:17 PM, Alexandre Courbot wrote:
>> On Thu Sep 11, 2025 at 8:22 PM JST, Danilo Krummrich wrote:
>>> On 9/11/25 1:04 PM, Alexandre Courbot wrote:
>>>> +    /// Attempt to start the GSP.
>>>> +    ///
>>>> +    /// This is a GPU-dependent and complex procedure that involves l=
oading firmware files from
>>>> +    /// user-space, patching them with signatures, and building firmw=
are-specific intricate data
>>>> +    /// structures that the GSP will use at runtime.
>>>> +    ///
>>>> +    /// Upon return, the GSP is up and running, and its runtime objec=
t given as return value.
>>>> +    pub(crate) fn start_gsp(
>>>> +        pdev: &pci::Device<device::Bound>,
>>>> +        bar: &Bar0,
>>>> +        chipset: Chipset,
>>>> +        gsp_falcon: &Falcon<Gsp>,
>>>> +        _sec2_falcon: &Falcon<Sec2>,
>>>> +    ) -> Result<()> {> +        let dev =3D pdev.as_ref();
>>>> +
>>>> +        let bios =3D Vbios::new(dev, bar)?;
>>>> +
>>>> +        let fb_layout =3D FbLayout::new(chipset, bar)?;
>>>> +        dev_dbg!(dev, "{:#x?}\n", fb_layout);
>>>> +
>>>> +        Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)=
?;
>>>> +
>>>> +        // Return an empty placeholder for now, to be replaced with t=
he GSP runtime data.
>>>> +        Ok(())
>>>> +    }
>>>
>>> I'd rather create the Gsp structure already, move the code to Gsp::new(=
) and
>>> return an impl PinInit<Self, Error>. If you don't want to store any of =
the
>>> object instances you create above yet, you can just stuff all the code =
into an
>>> initializer code block, as you do in the next patch with
>>> gfw::wait_gfw_boot_completion().
>>=20
>> I don't think that would work, or be any better even if it did. The full
>> GSP initialization is pretty complex and all we need to return is one
>> object created at the beginning that doesn't need to be pinned.
>> Moreover, the process is also dependent on the GPU family and completely
>> different on Hopper/Blackwell.
>
> Why would it not work? There is no difference between the code above bein=
g
> executed from an initializer block or directly in Gsp::new().

Yeah, that's pretty much my point. :) Why run it in an initializer if
the result doesn't need to be initialized in-place anyway?

>> You can see the whole process on [1]. `libos` is the object that is
>> returned (although its name and type will change). All the rest it
>> loading, preparing and running firmware, and that is done on the GPU. I
>> think it would be very out of place in the GSP module.
>>=20
>> It is also very step-by-step: run this firmware, wait for it to
>> complete, run another one, wait for a specific message from the GSP, run
>> the sequencer, etc. And most of this stuff is thrown away once the GSP
>> is running. That's where the limits of what we can do with `pin_init!`
>> are reached, and the GSP object doesn't need to be pinned anyway.
>
> I don't see that, in the code you linked you have a bunch of calls that d=
on't
> return anything that needs to survive, this can be in an initializer bloc=
k.
>
> And then you have
>
> let mut libos =3D gsp::GspMemObjects::new(pdev, bar)?;
>
> which only needs the device reference and the bar reference.
>
> So you can easily write this as:
>
> try_pin_init!(Self {
>    _: {
>       // all the throw-away stuff from above
>    },
>    libos <- gsp::GspMemObjects::new(pdev, bar),
>    _: {
>       libos.do_some_stuff_mutable()?;
>    }
> })

Can the second initializer block access variables created in the first?
I suspect we can also initialize `libos` first, and move everything in a
block, but then my question would be why do we need to jump through that
hoop.

>> By keeping the initialization in the GPU, we can keep the GSP object
>> architecture-independent, and I think it makes sense from a design point
>> of view. That's not to say this code should be in `gpu.rs`, maybe we
>> want to move it to a GPU HAL, or if we really want this as part of the
>> GSP a `gsp/boot` module supporting all the different archs. But I'd
>> prefer to think about this when we start supporting several
>> architectures.
>
> Didn't we talk about a struct Gsp that will eventually be returned by
> Self::start_gsp(), or did I make this up in my head?
>
> The way I think about this is that we'll have a struct Gsp that represent=
s the
> entry point in the driver to mess with the GSP command queue.
>
> But either way, this throws up two questions, if Self::start_gsp() return=
 a
> struct GspMemObjects instead (which is probably the same thing with a dif=
ferent
> name), then:
>
> Are we sure this won't need any locks? If it will need locking (which I e=
xpect)
> then it needs pin-init.

Sorry, I have been imprecise: I should I said: "it can be moved" rather
than "it doesn't need to be pinned". In that case I don't think
`Gsp::new` needs to return an `impl PinInit`, right?

>
> If it never needs pinning why did you write it as
>
> gsp <- Self::start_gsp(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)?=
,
>
> in a patch 3?
>> [1] https://github.com/Gnurou/linux/blob/gsp_init_rebase/drivers/gpu/nov=
a-core/gpu.rs#L305

Ah, I blindly copied that part from your initial suggestion [1] and
forgot to double check that part. We can use `:` here for `gsp`, as the
returned value of `start_gsp` can be moved without any issue. So if we
put it behind a lock at the `Gpu` level, the current pattern should not
be a problem as it can be moved where needed by the `Gpu` initializer.

Now I don't have a precise idea of how we are going to do locking, and
you seem to have given it more thought than I have, so please let me
know if I am still missing something.

[1] https://lore.kernel.org/rust-for-linux/DCOCL398HXDH.3QH9U6UGGIUP1@kerne=
l.org/

