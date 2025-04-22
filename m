Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8966A96D54
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 15:46:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E6C10E5B5;
	Tue, 22 Apr 2025 13:46:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MfhS2bfU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B77AC10E5B5;
 Tue, 22 Apr 2025 13:46:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WPGtYEB8d9p3RAm27HVl+Bp2rQWxcFe42CebL9/uVzPBPVqFq6nAWaQvR4nlnQFiXBOqcggL405ibXNOKd5f1XPyg+LK1UhRwdJUl/WgnhqVkCn5HmOR7LUAxdVivvRluPVF+yyWbvIgAbM2U28ArU72CndwoG+/W+M2KH141WGi7k8pSqS13RsrFanMAv6VmHDjC/5g6006L2nvH5PK1OqQ7dltpcSvEafnabQyCtwTc4XyLEEoCMcT4hEQAu58oaqzBTazpKJjE2u2PR68MOMyUR9zjmlEsUU4Ginoh5onCxLEGXufdk4PdTBvqUUHJri1yqRb7Hc3Z0IN/XYD9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8de03LeTQ+AHF0P1rB250RSTAbXeujfow3zEkl1vJ0=;
 b=blrHdyRfZON0U5TH9G9nsCrv4Ovl7IY1OVCY7ySzCDHpofbHUmCjnE1s4St2uoABmbW+J60V/t0QTj55Lk4sfFmrmI/S3wFz5pa60urN45n6gp3RgVQEkSuc0Hb8Gk/eOGF0rykhfpHVjx6ksX7teU3TGLGO5D3njYOivmrAIpm8MhTOecIXipbi7eVbX5UXMd7opdzCjL+uCKayAXz81th5KXdis7jvky6shP/Z7B0ik+tuf38VjQt5AISlNytkr0pt75izb5wKz58KQlO692LOhnVh2nGgrJpsofYQvbKlSfuFHlqR6DXhUfirE9nDpGYjYznCgm5l+czfbo5Z3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8de03LeTQ+AHF0P1rB250RSTAbXeujfow3zEkl1vJ0=;
 b=MfhS2bfU8yryuqjXkm++AJfPEprXl7/CBl7z5TjweB8cQ/7SCrrSYjsCk3VKFhxg6m5YD2HuzWFqTPg+m7dpXsz07mhEmMP3ZH886293DhM26q+whbCC1tIOwgW4avtNm9DGMxbzbkocgzwdtcwjTc9NL1j5D9oLpr57ypvXJ0CvNtcERUn9baCNHC4diSVM0q8Xpgiz/oH7nUV6I+uad1uOpZDi074KZEErRRRe9zXB/M9RLHJF0FVdOdOM/QJ8d0Fto8fkxvRjuWkAVU3yXC819bKGL/2xZ2K2aDbRkrOxjEyebt8hpKOsCTjqpVNmHNrtyLYtxxdlaKOUmdm8/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CY5PR12MB6552.namprd12.prod.outlook.com (2603:10b6:930:40::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 13:46:53 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%6]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 13:46:53 +0000
Message-ID: <108225ba-5d8c-459b-97aa-6b57affd5b87@nvidia.com>
Date: Tue, 22 Apr 2025 09:46:48 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/16] gpu: nova-core: wait for GFW_BOOT completion
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, John Hubbard <jhubbard@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
 <20250420-nova-frts-v1-8-ecd1cca23963@nvidia.com>
 <64d869aa-587f-49c6-8626-d2085441bb3b@nvidia.com>
 <aAd9ZlV5_qokiFYn@cassiopeiae> <D9D6UCL4PMJY.1MBEFIIHWT5F5@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <D9D6UCL4PMJY.1MBEFIIHWT5F5@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR15CA0035.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::48) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CY5PR12MB6552:EE_
X-MS-Office365-Filtering-Correlation-Id: f3fb6a9a-669f-4871-2674-08dd81a42380
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1RDM1FPSy9IZFNtcjkyeHd5Z0k3UVV5aEtJZENCc21pMTFXUVhGNjExWmpv?=
 =?utf-8?B?RStrdW1oZHNiQkw3cTFqcFBPUU5QOEJtcE5nN2gyeFRuQ0k2TEQrNHZIaVEy?=
 =?utf-8?B?c29zWThUUVJaci9HaVY4MDFwZ1VsZllLSjNNZE9sRmFWQ0ZQNm5VZjdpMDFT?=
 =?utf-8?B?Mzc3YlpIUFlrRXU5MjVyWWVtZlNtMHBNdEJPemNjN2VPSS9jYW12RXNzUXY3?=
 =?utf-8?B?cmx4Zlo2TnJ5bFNnQTkvOUFwTFRRNXZBOXY2Wmw2N3BhTGFVMDhJUlkyclRZ?=
 =?utf-8?B?Q2dMeE5RV1FEVGhFSGIxZXRVVHJHcEl6YWpwK296dHZvNUlscVRjZjBFcG5N?=
 =?utf-8?B?c2t3dTc4eWNKbmRDeUZvWjhwd0M0VS94Wm9wSGlRSXR0Vzc2ekVYUTJVRzEx?=
 =?utf-8?B?UGVMK2Q3cmFOZUgwVnRaS1M5YXdUVW1TQzg5cXpVSWdoN0FabWR1MnJGNXNx?=
 =?utf-8?B?WWwySFhLekplZWtRM2RnWjltbnZaZlVycDFTbndEMGxSSnMzNlU5eVlyOHVY?=
 =?utf-8?B?VDdPQjhOb0t3VEFLbUNOREVEZlZUV2lpZndrYWVVaHpGUEVhMXhSbThpdTV1?=
 =?utf-8?B?RDYraGQrYk55ODhKRTFZRS9jSzFMc1NBMVc2WFdLVFNCcXdPcm1EdEhMRkRo?=
 =?utf-8?B?SEE0QTYyWmQ4UXlzTXVWRlhCcEVpeFlnbkFyc0pJMm5ZZFpDMUFvNGsrc0Fj?=
 =?utf-8?B?K216K01RSmtuazk5eHZXYktudTdHdFUrcXBhWG15ckpadXN4VDFaM2JlaFJp?=
 =?utf-8?B?RUJxWml6UGJ6c2VJME93S3QvNnZpNGhRdGFybjcrNWJ3VGNZZUhuNVM5ZDVx?=
 =?utf-8?B?ajhKWU1HUDNlZFhkZ0xLOGFMQUxkRG5XY0Q5L1dGbmJrVnZoazZNN2FhNjRX?=
 =?utf-8?B?WlV0Ni9VSHhTOERmeU4yOXNDTXF5bUI2eVcrRXFuWmdLSENxZUdlditYMk5E?=
 =?utf-8?B?SXRJQTRXUFdBaGVILzkyVFA4MUhwKzNEbVE1TDBNVzRwSDg1YldLdmNXeFp0?=
 =?utf-8?B?Z0orSjd5MlJiT1BTYzh5emNlYm5VTk5pQnRXTmJoc1JNM3NuamxDV2RqejNo?=
 =?utf-8?B?VTJsWHFUVk9pbXNOMUUvQ0JidDNWSEZBWGl5OEU0MUdDbnE2MG1WYTRScU8r?=
 =?utf-8?B?cmVpbWV1c1JNM3JGcm1uWmZGZm16S2FYNFYvREt1ZWlOZ3FBMGFLUDNEVUxX?=
 =?utf-8?B?ZFhFVDJrbWtLbHhKdDRxL2VQOVdrQnpQRExNSVphWmN5WjNMWkl1elNjWTFq?=
 =?utf-8?B?U3hoeFQrSVQrWkZDaTNZV0ZTV1p3MFo4Z2Y0UHdzNHZFY3BrdElZZHhURHR2?=
 =?utf-8?B?L21zRkZNSms5am95QWIzdVQrOUFuS2pmSWhISlNkZWVMNjZLL3J1VU04WUVE?=
 =?utf-8?B?M1lyZE1WKy80bEhGQmxvcENXLzMvS3JCNzNoTnBzUTNpZjVtakhOZ0ZGbHpo?=
 =?utf-8?B?NmQvRW1QQUxOYlZzbkFwcTlyek1GSGxIU1N4b0dMRWRoYzk1NTBHbmpaTFpB?=
 =?utf-8?B?RmdkQy9NdXlOdzNzL0RrdkE2V3JBalBkemFGbXNURDVVR2FvaGNCUDlOWXFD?=
 =?utf-8?B?OW9NYUxlcjVHZkowelp4OFozQWFnUEN2NnY0L203TWhhbUcvYlNMZC9hVVRR?=
 =?utf-8?B?aXM2OGVQY2tCRjVnZWx0SHpnODZ5b2t3eWt1UFdsdE01RFVvMEtpTnpqeFhX?=
 =?utf-8?B?NGJaSmpZQTg4V3cxbVhqVGZ4a09EcnZsY0V4V3dRTXh6bmpEQWhQYXlzeE9u?=
 =?utf-8?B?eG1PSDBJRGoyc1JtY2ZaN1NvTXY2alNtNGxOV3kwb29UZEJZRjZ1N1c5bVlz?=
 =?utf-8?B?QVFhU2hER3FyRGpJdjNyVUdFVlRScS9sbGw1S01CcjM3Z1U5WHptWFpkTzRV?=
 =?utf-8?B?RFRpaEF0UVpObXhWU25XY0hnMzhYZnAvbnhnY3o3Y3pQZGE2Rkt3ZEUwa2Rp?=
 =?utf-8?Q?c/xD1SHCV5A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjN3MzBVeHRMYThuZUs2T2pra1o1Zk1SL3FKL3BzU3ZjL25lbTFjOEVqdk8w?=
 =?utf-8?B?WUZkY2pNajFBbi9QNXVCbzA3YU1VZlBRQksyQitxb3Z2OVlvR1dTeWdHZWpt?=
 =?utf-8?B?RFVIc1BoNnBLdVN6TFlhclVCRFUzczZDMFoyeGRNNnI0Qm9QcDNsMFlnbFIz?=
 =?utf-8?B?Q3QyZU43eUZBRVI2Q1hOUmdUR0dTQVJjWkFCUDBvc0dNUGtUZHg5aU5QYkc4?=
 =?utf-8?B?MThJcy9NblY0elNubW1ZdnZJZW1sU2JqNVBXTTJnaFpRM0ZxWlZRVjZkdi8z?=
 =?utf-8?B?eVQvVk4wTUdibXVoL0huVFhiRThwS0MrWmhKZklWRDJCM2k2dzdVNDR0V1ZS?=
 =?utf-8?B?RnVVZHpibER1UmJwcFlINXM3NjFmZzAzdHNjd1NqNGZZUDZGV1dFSUdmRXRm?=
 =?utf-8?B?am1xL3JEVXp2Q3gvK3EwR04rUW1meTd3WExWNk1hSmwrM2JsOSthcmlNUlds?=
 =?utf-8?B?VXFiUitFT0cxTG9ac2RBV3hMSDdpYmVmclZmYkc5UTVvMEVYakNRK292QXJU?=
 =?utf-8?B?Y3poRkd4dVNVVngxQW1JMGZHeVk2Q0JBd3piNUM5bFNvcTBUeDlyWXB3QXlk?=
 =?utf-8?B?RGV0b2NWQjgxWXU2LzBvN1VXaDJGWG1VWGZJKzVPM1pHVWgxZW04amcxQlF4?=
 =?utf-8?B?YzVDWXJHNG5Od3ZDVUtRb1RNcjZ5dlJrTWwxMll6TTNXWFhVSHl5SURIZW41?=
 =?utf-8?B?dWVkd0J4aDkzVHRPQ2FEK1pUUnVRVFlhd0Vua3dBZDdEZ25Db2R6eExWNUZk?=
 =?utf-8?B?eE9DcTBOWm1mblUvK2tFNVRRK3FPZVV3NE5TMEp6U2FiazFIRUdFdXlrZ25Q?=
 =?utf-8?B?SkIvOEVGSENlV2QvRUxFYXRHUUhjakNnU25PQU1kNGNITEE1VURzdUN6Z0dl?=
 =?utf-8?B?c3RiYnI2V0sxV25hVXpjQXJzeHlSaFVOM0VaZ25SckRvc05UTzZXU1N5UW9H?=
 =?utf-8?B?ekZvOFVmOEl3Q3hWdFlKS1BDc01sNWpjY2tYdHFMNCs4SG9YWmc4NFFkbW5t?=
 =?utf-8?B?THJBT3ZNU2ZJVVdVQ0hzTElQWGtlQmdMOHRpNzhoYWF2VHpqK0NXdFMyak1P?=
 =?utf-8?B?Q1BodG9BY29nb0pzM2V3YXd5NzdUQXBPOWNyTUR6cXNQNWg2Q3UxaFhsVm9U?=
 =?utf-8?B?NFR4T0JtRytiTG1KRjVlODZDN2k2VmRtVTM2NXgvVmxNemNDRnhtVlNmbDNB?=
 =?utf-8?B?ZFhwa1N4QkV2RUN2T3dmQ09qYjZ2M1BhcmlOS241am0zYm9zNHYyUndvMGVi?=
 =?utf-8?B?bTBWSHJGUEVSckxxK1E4VWwyWHN2KzRhU2Ixd0prcm9PUjNLaEVRQ0hRZGNq?=
 =?utf-8?B?dCtlVW1iU0NMMnpYVXFEemVxRGlyUFE0MEUxK2cvd3Bnc2NiZ3doMUpOV1hh?=
 =?utf-8?B?UkdDUDZ5UGRTY2duRXM2REdlTVlyc09EdU1FYXpCamJMNTN6THlhVU02SXVT?=
 =?utf-8?B?NWUzVzVFdC9Tc3NpcnpSR1pHLzZuME9ndUt0bGdRazVrV0R3MmZBNmZVc1d2?=
 =?utf-8?B?TkJRS2dzOEFlcTJRQjMxTnY3SlhtWXJjZE9FOURSaU4reHZKVXBFSXBNMDRL?=
 =?utf-8?B?aVdVSGwwdWcwRWdNVXhjNHdJV0UydVgybnIveUFjcVBKZGtoNXJVc3ZFUEFN?=
 =?utf-8?B?aUJlbHN3b0s1bUNhaThTZEtvWjRFSndGTnVhUk9tOVp6VzhKcjhSRDR3SkFE?=
 =?utf-8?B?WUxJL1FlaFkvOE1qWDBpZTZ3MGhDbkFieVJUODJkL3U3UkJxTDhSd1E1V1p5?=
 =?utf-8?B?bWlEOGlhbUd5bFJSRmladndUUU5TRHJxMXIzNzVYbDZueUhzMnRZYVB3REt0?=
 =?utf-8?B?WnJnOUtEbllyVmNsbEpiaTMrWGp4SWYvVUtKZTFQVWZ6TW9NNis0MElZNXZ6?=
 =?utf-8?B?SkEyVERrQUdhTEwrZkRkRjMxT2xvbzRrbFd3c21OMGhUbEtwMitweEZ6M1JU?=
 =?utf-8?B?a3lla0N6OERnQkV3Ny95dXZLWS9WYVdsSXRDb0dxd2pFcFUwOFlXTG1OUWpi?=
 =?utf-8?B?SHBhS3RKamc4QUZUOENvU1kxMFRPNEYwS0loZlo4UnljZ2IvMmdJU05samJJ?=
 =?utf-8?B?c01yRWNPTEJ3dmdBR3QzbEtVWTlqYTF5ZW5TSHBmdmFHdno1MDB1WGhiYStY?=
 =?utf-8?Q?b0za1vm897LTwxQvMvVR3CfqG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3fb6a9a-669f-4871-2674-08dd81a42380
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 13:46:52.9326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aIsDnysBjOYxuyhCylbCzhthwBzmrJzIQZmn1gprJ6Nox0MkQPwKCAgsJ3MT5Q07lqvOrbLYqPbPK7VJyBhJiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6552
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

On 4/22/2025 9:06 AM, Alexandre Courbot wrote:
> On Tue Apr 22, 2025 at 8:28 PM JST, Danilo Krummrich wrote:
>> On Mon, Apr 21, 2025 at 05:45:33PM -0400, Joel Fernandes wrote:
>>> On 4/20/2025 8:19 AM, Alexandre Courbot wrote:
>>>> diff --git a/drivers/gpu/nova-core/devinit.rs b/drivers/gpu/nova-core/devinit.rs
>>>> new file mode 100644
>>>> index 0000000000000000000000000000000000000000..ee5685aff845aa97d6b0fbe9528df9a7ba274b2c
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/nova-core/devinit.rs
>>>> @@ -0,0 +1,40 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +
>>>> +//! Methods for device initialization.
>>>
>>> Let us clarify what devinit means.
>>>
>>> devinit is a sequence of register read/writes after reset that performs tasks
>>> such as:
>>> 1. Programming VRAM memory controller timings.
>>> 2. Power sequencing.
>>> 3. Clock and PLL configuration.
>>> 4. Thermal management.
>>> 5. Performs VRAM memory scrubbing (ECC initialization) - on some GPUs, it scrubs
>>> only part of memory and then kicks of 'async scrubbing'.
>>>
>>> devinit itself is a 'script' which is interpreted by the PMU microcontroller of
>>> of the GPU by an interpreter program.
>>>
>>> Note that devinit also needs to run during suspend/resume at runtime.
>>
>> Thanks for writing this up. I fully agree that those things have to be
>> documented.

Thanks.

>>> I talked with Alex and I could add a new patch on top of this patch to add these
>>> clarifying 'doc' comments as well. I will commit them to my git branch and send
>>> on top of this as needed, but Alex can feel free to decide to squash them as well.
>>
>> Fine with both, whatever you guys prefer.
> 
> If that works with you, I will put Joel's patches improving the
> documentation right after mines adding the code in the next revision. I
> know this ideally should be a single patch, but researching this stuff
> (and producing a proper writeup) is quite involved and a separate kind
> of task from the quickly-translate-code-while-peeking-at-OpenRM work
> that I did. 

From my side, this makes sense to me.

>>>> +
>>>> +use kernel::bindings;
>>>> +use kernel::devres::Devres;
>>>> +use kernel::prelude::*;
>>>> +
>>>> +use crate::driver::Bar0;
>>>> +use crate::regs;
>>>> +
>>>> +/// Wait for devinit FW completion.
>>>> +///
>>>> +/// Upon reset, the GPU runs some firmware code to setup its core parameters. Most of the GPU is
>>>> +/// considered unusable until this step is completed, so it must be waited on very early during
>>>> +/// driver initialization.
>>>> +pub(crate) fn wait_gfw_boot_completion(bar: &Devres<Bar0>) -> Result<()> {
>>>
>>> To reduce acronym soup, we can clarify gfw means 'GPU firmware', it is a broad
>>> term used for VBIOS ROM components several of which execute before the driver
>>> loads. Perhaps that part of comment can be 'the GPU firmware (gfw) code'.
>>
>> Yes, we should absolutely explain acronyms as well as use consistent and defined
>> terminology when referring to things.
>>
>> I think we should put both into Documentation/gpu/nova/ and add the
>> corresponding pointers in the code.
> 
> SGTM.

Ack.

>>> I find this Rust convention for camel casing long constants very unreadable and
>>> troubling: Pgc6AonSecureScratchGroup05. I think we should relax this requirement
>>> for sake of readability. Could the Rust community / maintainers provide some input?
>>>
>>> Apart from readability, it also makes searching for the same register name a
>>> nightmare with other code bases written in C.
>>>
>>> Couple of ideas discussed:
>>>
>>> 1. May be have a macro that converts
>>> REG(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK) ->
>>> regs::Pgc6AonSecureScratchGroup05 ?
>>> But not sure what it takes on the rust side to implement a macro like that.
>>>
>>> 2. Adding doc comments both in regs.rs during defining the register, and
>>> possibly at the caller site. This still does address the issue fully.
>>
>> If that addresses your concern, it sounds totally reasonable to me.
> 
> Sorry, I'm having trouble understanding what you guys are agreeing on.
> :)
> 
> The most radical option would be to define the registers directly as
> capital snake-case (NV_PGC6_...), basically a 1:1 match with OpenRM.
> This would be the easiest way to cross-reference, but goes against the
> Rust naming conventions. If we go all the way, this also means the field
> accessors would be capital snake-case, unless we figure out a smart
> macro to work this around...

I think the accessors can still be lower case, because we can do something like:

pgc6_reg = NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK;

pgc6_reg.field_accessor();

?

Since rust convention already allows capital snake-case for statics and
constants, I think we should aim for this exception for Nova register defs
before discussing other options (i.e. directly replacing the definition of the
register from camel case to capital snake case) as is consistent with Nouveau,
Open RM etc. I think it will make things so much easier (and probably less
error-prone and maintainable) such as translation of GSP headers to Rust, string
search across Nouveau, Open RM repositories etc.

Thoughts?

thanks,

 - Joel




