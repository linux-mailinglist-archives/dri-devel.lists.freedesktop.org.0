Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83331C17485
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 00:12:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 142FD10E69F;
	Tue, 28 Oct 2025 23:12:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="b6VT34DR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012013.outbound.protection.outlook.com [52.101.53.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD7A10E69C;
 Tue, 28 Oct 2025 23:12:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TjlfwtbbIk1WN1zePbFqg81TSQTFobSAuCHFCL1ssntHnWNd6ngQtytCc6tsY7qAZH5uLiOgzfJIHhSYXqypdVhyFxzvnKR153YuOmMNiF+5YEv+pkt7UV1WkndUkr4ucFW0VldCZEz0jyuGjrGAU7GNosD5LQtvQKF8rxO5VJGYH8SNagEPU8zt2x2yeKDMp9ppGy9ZsAKr74/X9ph5iZ969BVMOgfmxO0PwRqQJKthqVVxnRoih1Ndx+deQRoYiXJmm3pDIkmPXrmgEK6ZAKrqzWDdYQgq0SSqvqYprDENGWOiSmsoKI6lYfG1Hwoa/KY9mBd6CA2dY9cN0R02VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXc2+lf4AqN3gtIrtFakB6fGnTyKM8yEEAQ0eYoJtp0=;
 b=dtGL21BfrHvdekrh7822Ak2zFLNzOLV8IgeIDMaseq6jfr+gKZv59Sl55S9aFSvyXRAXeVJ6YTuRtTo3Vl2PIxMnmhsdeb99X/73u0Golctdq7InutsPAkEWrsa+TaOkNywv499hagoLZxsVqx87ikQ+/WCXJVhUipdBqTaFlJOX0R4FkJLvw/LB6OTCn2+6o0tOEQ+olZRonEZiE/lp/daaWIg9xguAueN2bhLewbyq6NKCuwW6RAlfIfQtVvijXO0Enclx+DfH2z8QHJJm5RrdJsVHBbLrG9OK0RsxG4g5M6GPPvAI0+vYdkO78yRzm/8FJUFblNefgIWzx4UNTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXc2+lf4AqN3gtIrtFakB6fGnTyKM8yEEAQ0eYoJtp0=;
 b=b6VT34DRNpxUDRn9IYfYhKle4E1SPn4ty7aUuESDm7wQYn5zRdtJKnWJ9MvwojfhCfghuc3cbDAlYhLSZ7eM1PdM+0LpnzDoc2gHvoPzsSLAeLcbGGNl3uKjLvDVdg1PbFojYYQZtfQbo1dw9cHuDLvwqSF6HaCaXoJNSoh0KTfaDSRehcwRgqAz2d8qR0bghafudJOXHgtbMUpeY1ezX3S6AmYVN4Jf8/3754Zp1Ihtx0/tOslJQpa3nWrZUKegv+R3cCBrSKzBrhprnGE7Kc5x1VjJJ+5fIrthWkwIAp3tyHgCsOkzTqJY63tZHrPh3ZFAOLokKnsYDXUGv9x5Yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH1PR12MB9646.namprd12.prod.outlook.com (2603:10b6:610:2af::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.15; Tue, 28 Oct
 2025 23:12:17 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 23:12:17 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 29 Oct 2025 08:12:09 +0900
Subject: [PATCH v3 1/6] gpu: nova-core: replace `as` with `from`
 conversions where possible
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-nova-as-v3-1-6a30c7333ad9@nvidia.com>
References: <20251029-nova-as-v3-0-6a30c7333ad9@nvidia.com>
In-Reply-To: <20251029-nova-as-v3-0-6a30c7333ad9@nvidia.com>
To: Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P301CA0047.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH1PR12MB9646:EE_
X-MS-Office365-Filtering-Correlation-Id: d0fd25b6-4a1d-48c2-cebd-08de16777030
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OXk4aThlaW54UkhWTFJFSXJ1OHorTE4xMktYTEVrdUpnTGhKSjBVaW5Sblph?=
 =?utf-8?B?MnBMVW5uUEFmSWMzMzZaNmFreUVxeW91dzhQVmFPbGk0UEMvMDd2bHZweTRE?=
 =?utf-8?B?d1pNTDZOaHJjdEYxVWtOL1BpSUxDSFdORmt6ZzFNQmJ6L1IzdWVWb05qMUJ6?=
 =?utf-8?B?TnEzSkJscktJUGFWSkJzUTE4bG13dGtoOWpFSHdEeFlqUU5aUGpHd3lmRFB3?=
 =?utf-8?B?QVI5VVNpU0VpaWxJNTVxUFhpT2xNenJMdUQ2aDQzcW1LYW1CUVVWT0xFRjdz?=
 =?utf-8?B?K3RRZGNCMDJIVFFURi9CeXp6ZG9DaVY2OHRacDdFTjZCUnBWOSsrQmZYZDJi?=
 =?utf-8?B?UTVQVCtTSjJ1ZVk5aCtNeGZxMHozWVVvUXdVNFJJa2VKTUwzK3pVR25XZDBS?=
 =?utf-8?B?VWhnM28xZFlkeE9hZXpFOEZHMklSM3Nkck9iS2hORW80OVZsOFdkdUgyNDJP?=
 =?utf-8?B?Mk0yL0VQYVRaUWk2YWdveWdsYTRwWFJabWcraGNxS1pzaW1seGJ0SjYwWGZR?=
 =?utf-8?B?K1ZURnlvRENwVTVEVjUybEMyMElNdGRNYVhkdmxHK0FEWUxkclBuTzFKOWVB?=
 =?utf-8?B?NWcyby9jOUJlQmQzZWpOOE8vWDNZSGxGS2paZW82di9mT0VielVjSExteFRz?=
 =?utf-8?B?MlpLWTRodzdvS3BhNUI1VWFhNW0xb2F4Y1Z6UzQ0MGkwdHlwUGdvTXJiclJa?=
 =?utf-8?B?T05uYnBldzlSNjR4M0pObHAzaUhDZnpMVENEZzVmTy9kT09qUTBMSHpUanFp?=
 =?utf-8?B?WTNZUmRFZCs3bzZkTUcrZHI0bm1VdzM3OHl5Rk1pOGMwRjc4cUh0VmhKQzYz?=
 =?utf-8?B?QjAvUzBEREU2NVFXQ2pzbmhzUTRrUWVNWmxIOXF2Z3BOVDlFUWRqLzF5SGZa?=
 =?utf-8?B?SitnUkxlS0RtOEV6WjNPUzBoajc1Tkt0RmFvNkdiVHZyajc2ZFpYTytkT05s?=
 =?utf-8?B?dGZNNkNZbi9VZXk4TGFteElmSzhMRVpNSis2Nk1tTVBkVFBVbTBvMDlrNldM?=
 =?utf-8?B?Yk9vMTZJaDNDVWV1aHhKT0Q1THhFaDZwNnNIWGNzOXIrS1B3djI4SGtKaDcy?=
 =?utf-8?B?MVZsZVNGRklUUUplQTBXempYNzFVVnVhRjU4bEhjNDQ1YWt3enBHSjVxc0Vz?=
 =?utf-8?B?ZVNoMnlHL2N1elJ5UUFneDBiRXZhcjRSZlFON2Y4TGVqQ3RIUys3cFBraWZ2?=
 =?utf-8?B?RVdESWl3VnU3dlBFQTNzeEpjUXFER2tMMnVCZmp2b2JrZlRVMzR5WnVzMHlO?=
 =?utf-8?B?cUJuY015VGMyc1dJUGo0Q2RvcVZrTks0T25jSWR5cGNvNmRSbXk4MXdBWUdm?=
 =?utf-8?B?WlRXMHNrQlRMOWhJdktqcUkrMzYrS0hZRmd1NWZhdmVMWlorOHVkMU9QWlo5?=
 =?utf-8?B?ZndiVmNQTGtvaTk3a1dXenVVMGhMc21yTWJnTW8ycG1YUk9jMnphSVp4dEFi?=
 =?utf-8?B?aHdUM2J5elhjWllNSU1qQ2JDaHNNRmhhTVFOUmhOd014SkNrQVNGZGFTZC9l?=
 =?utf-8?B?OXROUEJkOEFvTlNuUTU0eldWMnhvVEVPc0tDK2JjeHIvZUl6cDNRSUtydUdk?=
 =?utf-8?B?Rm9laklmZ0dxK1ZWdDdhUVVWSkRRRUhCTm5IT1JGWi9uTG1KR2djeC9MRU1B?=
 =?utf-8?B?aFpqUTE4clRhVS81RE4vUDFFMzI0STc4ODdMK1FFeUExQXRremtHeC9Bb05n?=
 =?utf-8?B?RytQakVIOUdqaHRzY2VlcGhUWjJnOUk1bWt4aTIyS0gyY1d0RGs3eHd3NVdy?=
 =?utf-8?B?clhpUE9USVJ0OWN4Z2hrcGRNSGNUMmlHVmhiZldxdjdhRENuY1pkTDVtU2Vw?=
 =?utf-8?B?SE03TzF4V1V2aWdaTUpweXNUWTlXa052NzNnU2I4MmlpcWZKOXFGejM5OFdX?=
 =?utf-8?B?QjRHV2VVR0JDV3IzWmNvRWIxTmRmWnNVbVVHK08yMGZLOWhEQXBZSXhPUlo4?=
 =?utf-8?B?SlBzSU16QXdjMlZ6VFI5eE9nYWRNak40QmFzdU53MHV1UnI0NmdHSjVLWjFx?=
 =?utf-8?Q?J9Tqg7OyylpB3iceHszNbejFqKb57Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTBMeW9aSGZuZ254RFNyK0wzT0ttQmNSV2x6Q1ZQVHl0eU5ldFFlaVgvckNB?=
 =?utf-8?B?akpFY2ZaNEM3VVN0dGpPOUlnbkVlcVROdThuYWh4bTdqSWFOUVUxeUNTTWFl?=
 =?utf-8?B?ODRQb0t3OHpDeUdvOS9iYUFrT2RpV1pIamEzYzhXZnBuRnd6cWxpRVNCSnFq?=
 =?utf-8?B?YnZUR0UzU0lHQ2x3Q1FXQmRWUkNQRTNmSjFRRlRvYTMxNkFvNUwyRVpDdHBB?=
 =?utf-8?B?TC9aTGE3eFcxRm1XUEYrRmFTOFJQcXVRTjVGcDd4U296KzVxSHlVMi9VRGpj?=
 =?utf-8?B?QysrZXFWVDMrVHZlS25nRkRlVHJYTUlNSjZ0Wno5TU9HVW54NHhJWWVaUWRn?=
 =?utf-8?B?TzEzQ3FVYVd0L1BZalZYN2hqS3Bzb3BsSW0xVWZlY25xNHU5MDNON0wwZ01O?=
 =?utf-8?B?Si9TdjdiRGJreVFuTkZoU0doOHdLZXA4b2pRb091Z1BwWFRCSWtCV24vWHhL?=
 =?utf-8?B?eUhZemdJdm9PTjZXdm56U1lWakRxUGZ3YlJiNkVGcmRUa1M2TmV4bWRYWWRn?=
 =?utf-8?B?ODVCT2VzY0VOUHRab1hodUh5TFFGbkt1N2RmTGxRZDRnRmlXbWNCdmtYQ09t?=
 =?utf-8?B?MEEyYmFjejY1VTNwS20zNWEzYlZnK2poR2NwVjhNUnhmTy9iTlhDeWR3UHZW?=
 =?utf-8?B?SjdsVWlsbllBTzNzK1pIUk5lcXFySWhNVVlTYkJTSzNWN3p1dGVac1AyNGdh?=
 =?utf-8?B?SzNDWWNrblBPd2pSUW5PV2tmWExtMUVjQXVUUGJ4c0x2ZDByNkRlOTVieDVt?=
 =?utf-8?B?SkV3bmxQUHRrWXpJU0hrZ0M0b00zM3lJU2RLM21IOUk0SlNhSXBwR3d5Unl4?=
 =?utf-8?B?dEFCSjJxRC82ZmthbCs2LzhmYW9GU09teHJMSFEvci9uSXhmTHJ6VVRrdVUx?=
 =?utf-8?B?UnZIN0VTbkJUVjEwYUhvdFBsbDh5R1dlVGNEYUI4cWo0dVM0QmM2N012aFhi?=
 =?utf-8?B?MXE1WEkxOGJpbm1mSXNwL0Y5dlFiUnoxRG0wcnhFb3A0SDgwWnB4ZjlsRnZT?=
 =?utf-8?B?RVBpSTNIUnNyb25ZbEM3ZEZ1U3JXa1pSeE9DK1dwdGxxRTlRTGdxZ00xWWhW?=
 =?utf-8?B?ZnhVRUdJZEZkTVV0VHkvWmJuL0pSRkhLczJJc0hZRmhsU1lYd2xkU2Y4YVRr?=
 =?utf-8?B?VjZEQ2FXdDZFSUZ0NWhQeDdjZ2txaWVhUXh3U2w3cTJHT2VJTVFUODRFSDMr?=
 =?utf-8?B?SVNnaHdreUZtS2cybVh0S3Zra0oxSHhvQ2lxQ1MwR2E5bUFESWlDSloxVDVr?=
 =?utf-8?B?dUVBcUs4ZUQ1MlV0R1hjV0V3ZDVEWXdSODgrQkZHSmo3NUlZdFFDcE40c0ZZ?=
 =?utf-8?B?blZUd01ZVXIwdTcvMWdvZHB0c2VkTlNKaXBoWnZXV0VVUXhBL1dBTDVKbUJC?=
 =?utf-8?B?V01Qcnl4Nll5c2FWbmIvbFpTb3hjZFVNQW0rc0FPcTIrLzFvWVpHSDBoeHhn?=
 =?utf-8?B?YjZxZ3o1NW9ZdlRsREZiZklTNTQ2M09iWVJjVmlkazBJSXhQUHNnQjM3UXkw?=
 =?utf-8?B?cGVVSHJTaFFyaUo3aUFGTW9ZTzMxOGxUeHVtdHhRWVBiYXptZ2tmVFIxYzJv?=
 =?utf-8?B?bzNaZWxJN1FjM0xVU3QyemF0YWxoNllkdDhOcWozcnRBTUhsazRPU1kzVXFF?=
 =?utf-8?B?YWIzdnhNQWNxYlJnTnFwdkdhaXdTSHREOWFJSlBlNlNYZUVDM0hJOVk1aU9Y?=
 =?utf-8?B?UnNjUG9lRlc4M2Nzb0RUejRtbi9BdVdueFdqN2xjcEhqRGZzYXlydUhGTXFJ?=
 =?utf-8?B?cXI2TytibktydXB0R05TeFI0K2pCN1E3OXJPbXFUN1NBUjBVSmFXZ1dxQVdW?=
 =?utf-8?B?SVFGNGtmc0F1MTI5TFhTekwrWitDanpnSllLcjlqVWZFYS85aGQyZnFJZVhS?=
 =?utf-8?B?TDEzL3hkaDZyeXdhR1VIZkZqQncrWHFHdG5RME5vY3JjN0NrSWZ0aG1MeW9B?=
 =?utf-8?B?cnhkT3I3ZFFOajk5bGM0OUVwN1UwQjlhVWtqWkhDamdhTG1Nd25DTkxWemMr?=
 =?utf-8?B?OWFIb21rMmFqVmlkYmdmaSsyTlZWRG5BQ1pmKzRVRTMzaG5PUjVXVEFwVTJs?=
 =?utf-8?B?b1d6eUdWNnVzaUNQbU1kd3JNZFBWcFlHcDB3cy94Y1JIQTRqQXpFN2VGNFA2?=
 =?utf-8?B?cjBVTSt2Rkc4eC9pNDBrODRhc3FyNVlnSjdRd05VR2hEeFlTV2dCWUdpVlRT?=
 =?utf-8?Q?XePQ8xPgFYNyGdS0V42p2xcAJf5X88QQGSzBMTvVQENK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0fd25b6-4a1d-48c2-cebd-08de16777030
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 23:12:17.4296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mqJaBiA0LRqKq77T+IHWfQqhlClH+j6rd+Ape1snePLrdDJzYSsERbonifUjyXmIFTX82VgfBbP9LgjMSlOLmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9646
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

The `as` operator is best avoided as it silently drops bits if the
destination type is smaller that the source.

For data types where this is clearly not the case, use `from` to
unambiguously signal that these conversions are lossless.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal/ga102.rs |  6 ++---
 drivers/gpu/nova-core/firmware/fwsec.rs   |  4 +--
 drivers/gpu/nova-core/vbios.rs            | 42 +++++++++++++++----------------
 3 files changed, 25 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
index f2ae9537321d..afed353b24d2 100644
--- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -40,11 +40,9 @@ fn signature_reg_fuse_version_ga102(
     engine_id_mask: u16,
     ucode_id: u8,
 ) -> Result<u32> {
-    const NV_FUSE_OPT_FPF_SIZE: u8 = regs::NV_FUSE_OPT_FPF_SIZE as u8;
-
     // Each engine has 16 ucode version registers numbered from 1 to 16.
-    let ucode_idx = match ucode_id {
-        1..=NV_FUSE_OPT_FPF_SIZE => (ucode_id - 1) as usize,
+    let ucode_idx = match usize::from(ucode_id) {
+        ucode_id @ 1..=regs::NV_FUSE_OPT_FPF_SIZE => ucode_id - 1,
         _ => {
             dev_err!(dev, "invalid ucode id {:#x}", ucode_id);
             return Err(EINVAL);
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index 8edbb5c0572c..dd3420aaa2bf 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -259,13 +259,13 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
         }
 
         // Find the DMEM mapper section in the firmware.
-        for i in 0..hdr.entry_count as usize {
+        for i in 0..usize::from(hdr.entry_count) {
             let app: &FalconAppifV1 =
             // SAFETY: we have exclusive access to `dma_object`.
             unsafe {
                 transmute(
                     &dma_object,
-                    hdr_offset + hdr.header_size as usize + i * hdr.entry_size as usize
+                    hdr_offset + usize::from(hdr.header_size) + i * usize::from(hdr.entry_size)
                 )
             }?;
 
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index ad070a0420ca..74ed6d61e6cc 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -361,7 +361,7 @@ fn is_last(&self) -> bool {
 
     /// Calculate image size in bytes from 512-byte blocks.
     fn image_size_bytes(&self) -> usize {
-        self.image_len as usize * 512
+        usize::from(self.image_len) * 512
     }
 }
 
@@ -439,13 +439,13 @@ fn from_id(image: &PciAtBiosImage, token_id: u8) -> Result<Self> {
         let header = &image.bit_header;
 
         // Offset to the first token entry
-        let tokens_start = image.bit_offset + header.header_size as usize;
+        let tokens_start = image.bit_offset + usize::from(header.header_size);
 
-        for i in 0..header.token_entries as usize {
-            let entry_offset = tokens_start + (i * header.token_size as usize);
+        for i in 0..usize::from(header.token_entries) {
+            let entry_offset = tokens_start + (i * usize::from(header.token_size));
 
             // Make sure we don't go out of bounds
-            if entry_offset + header.token_size as usize > image.base.data.len() {
+            if entry_offset + usize::from(header.token_size) > image.base.data.len() {
                 return Err(EINVAL);
             }
 
@@ -601,7 +601,7 @@ fn is_last(&self) -> bool {
 
     /// Calculate image size in bytes from 512-byte blocks.
     fn image_size_bytes(&self) -> usize {
-        self.subimage_len as usize * 512
+        usize::from(self.subimage_len) * 512
     }
 
     /// Try to find NPDE in the data, the NPDE is right after the PCIR.
@@ -613,8 +613,8 @@ fn find_in_data(
     ) -> Option<Self> {
         // Calculate the offset where NPDE might be located
         // NPDE should be right after the PCIR structure, aligned to 16 bytes
-        let pcir_offset = rom_header.pci_data_struct_offset as usize;
-        let npde_start = (pcir_offset + pcir.pci_data_struct_len as usize + 0x0F) & !0x0F;
+        let pcir_offset = usize::from(rom_header.pci_data_struct_offset);
+        let npde_start = (pcir_offset + usize::from(pcir.pci_data_struct_len) + 0x0F) & !0x0F;
 
         // Check if we have enough data
         if npde_start + core::mem::size_of::<Self>() > data.len() {
@@ -737,7 +737,7 @@ fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
             .inspect_err(|e| dev_err!(dev, "Failed to create PciRomHeader: {:?}\n", e))?;
 
         // Get the PCI Data Structure using the pointer from the ROM header.
-        let pcir_offset = rom_header.pci_data_struct_offset as usize;
+        let pcir_offset = usize::from(rom_header.pci_data_struct_offset);
         let pcir_data = data
             .get(pcir_offset..pcir_offset + core::mem::size_of::<PcirStruct>())
             .ok_or(EINVAL)
@@ -805,12 +805,12 @@ fn falcon_data_ptr(&self) -> Result<u32> {
         let token = self.get_bit_token(BIT_TOKEN_ID_FALCON_DATA)?;
 
         // Make sure we don't go out of bounds
-        if token.data_offset as usize + 4 > self.base.data.len() {
+        if usize::from(token.data_offset) + 4 > self.base.data.len() {
             return Err(EINVAL);
         }
 
         // read the 4 bytes at the offset specified in the token
-        let offset = token.data_offset as usize;
+        let offset = usize::from(token.data_offset);
         let bytes: [u8; 4] = self.base.data[offset..offset + 4].try_into().map_err(|_| {
             dev_err!(self.base.dev, "Failed to convert data slice to array");
             EINVAL
@@ -886,9 +886,9 @@ fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
             return Err(EINVAL);
         }
 
-        let header_len = data[1] as usize;
-        let entry_len = data[2] as usize;
-        let entry_count = data[3] as usize;
+        let header_len = usize::from(data[1]);
+        let entry_len = usize::from(data[2]);
+        let entry_count = usize::from(data[3]);
 
         let required_bytes = header_len + (entry_count * entry_len);
 
@@ -911,9 +911,9 @@ fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
 
         Ok(PmuLookupTable {
             version: data[0],
-            header_len: header_len as u8,
-            entry_len: entry_len as u8,
-            entry_count: entry_count as u8,
+            header_len: data[1],
+            entry_len: data[2],
+            entry_count: data[3],
             table_data,
         })
     }
@@ -923,7 +923,7 @@ fn lookup_index(&self, idx: u8) -> Result<PmuLookupTableEntry> {
             return Err(EINVAL);
         }
 
-        let index = (idx as usize) * self.entry_len as usize;
+        let index = (usize::from(idx)) * usize::from(self.entry_len);
         PmuLookupTableEntry::new(&self.table_data[index..])
     }
 
@@ -1092,8 +1092,8 @@ pub(crate) fn ucode(&self, desc: &FalconUCodeDescV3) -> Result<&[u8]> {
     pub(crate) fn sigs(&self, desc: &FalconUCodeDescV3) -> Result<&[Bcrt30Rsa3kSignature]> {
         // The signatures data follows the descriptor.
         let sigs_data_offset = self.falcon_ucode_offset + core::mem::size_of::<FalconUCodeDescV3>();
-        let sigs_size =
-            desc.signature_count as usize * core::mem::size_of::<Bcrt30Rsa3kSignature>();
+        let sigs_count = usize::from(desc.signature_count);
+        let sigs_size = sigs_count * core::mem::size_of::<Bcrt30Rsa3kSignature>();
 
         // Make sure the data is within bounds.
         if sigs_data_offset + sigs_size > self.base.data.len() {
@@ -1113,7 +1113,7 @@ pub(crate) fn sigs(&self, desc: &FalconUCodeDescV3) -> Result<&[Bcrt30Rsa3kSigna
                     .as_ptr()
                     .add(sigs_data_offset)
                     .cast::<Bcrt30Rsa3kSignature>(),
-                desc.signature_count as usize,
+                sigs_count,
             )
         })
     }

-- 
2.51.0

