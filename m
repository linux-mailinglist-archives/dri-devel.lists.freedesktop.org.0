Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8015EC5024A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 01:46:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B690410E66E;
	Wed, 12 Nov 2025 00:46:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WEzJ91at";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010030.outbound.protection.outlook.com
 [40.93.198.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6605610E66E;
 Wed, 12 Nov 2025 00:46:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IlYXFv38KALA2ewnQRkE9IB7iqs573DiXAEJhFUNTynAfJriFHjjqH3f5mqSDnwuMxc8GuZw8nR18C+PFzmyNkS21CkVPpLcbDA12eN4xE93SGG9RfCbYWWAOJG154E7eQNDpRB9IpUywYB5Mz2mWibEGsB8tT+7SDnov8ROfSy1aJhuMeWXt1/ZFvqy2X6q2JtbPjPk0gQlVvOerf1zaQHVeawIceK+KJnS8ESNOkCIlUQShoic0ECptI8UHfIJQscc7FEKA2bPtjeKSja+J+HjNAIwO2SYKAWmymF+OgwBjV5rkXqIhh4PtEAsTWtczTZpK9E2ZWKBr/BBlnQmlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RxCQqiASrntNjsprSJY5pUP2LyOPqBopHGHHQ5XiPpM=;
 b=M5qSFNq1BKTWss9fzJicrvkvpXI0eo2asrmqeWBw40N/dI+fJdn6V58lyHZY6G8Mv3Z8gcn4cZ9ZyfOHmAn5iTLAqhYfobOxWibI14J4y4UfGXzNuDfdEudth2uPMt8oPdveI2yav6TzUEW/1Y1RDSibxstzF9ewTNbNIWLT+uk+a1X2ux/2BNgJAkKUnfvianQ6sFPl5/xYVu0zHeuW7CM1+uPoYYQtfJ5yAQ3JBGqn0IBtYvF907R/jXoKhWHt5ZHl1RGkNlJ8yZsxdM+g4nH3WBAJdoURcFXMmics5pImEbmtLMKyZLBWwoTeYSP8ivLMu0Zt5JIVrsLO6l8M1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RxCQqiASrntNjsprSJY5pUP2LyOPqBopHGHHQ5XiPpM=;
 b=WEzJ91atd/2f/2bwJIYoJbm2L5XS5AjEAp7YiUgknZMWj8otMPTdQcE12inWUnpaO+p4Igq5AwIOdXWC5VBn1/oKgCPrqVlT/Iy+vKGh0HgBLZhFdUPEni2APItsc6ycLoXZ8esWTmF47XZ1s8cbWh6Y84gu2cgGVgDo5lozrSIKlyFGElzmXUQ4Yo7kGpo95mUbljuiGE3JVZX4LaCTwZuIPOl8MZKBLvKvtRTUGbq6Ry8aBGJokHTbQeHZqOdhJBVGD+bgEfDM7hRiFIBv4TzfWQ20iT9Oix3ellmnIQ0bgCzY6n8V3wjU0dVXxGJbSi63fi1IVcFmSlrQbHXd8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB6069.namprd12.prod.outlook.com (2603:10b6:8:9f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 00:45:58 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.015; Wed, 12 Nov 2025
 00:45:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 12 Nov 2025 09:45:53 +0900
Message-Id: <DE6AUT1LYSFH.3W41BDSDPHCK9@nvidia.com>
To: "Lyude Paul" <lyude@redhat.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>
Cc: "dakr@kernel.org" <dakr@kernel.org>, "lossin@kernel.org"
 <lossin@kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, "a.hindborg@kernel.org"
 <a.hindborg@kernel.org>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "tmgross@umich.edu" <tmgross@umich.edu>, "alex.gaynor@gmail.com"
 <alex.gaynor@gmail.com>, "mripard@kernel.org" <mripard@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "gary@garyguo.net" <gary@garyguo.net>, "bjorn3_gh@protonmail.com"
 <bjorn3_gh@protonmail.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "aliceryhl@google.com"
 <aliceryhl@google.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>, "Alistair Popple"
 <apopple@nvidia.com>, "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 08/12] nova-core: sequencer: Add register opcodes
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251102235920.3784592-1-joelagnelf@nvidia.com>
 <20251102235920.3784592-9-joelagnelf@nvidia.com>
 <d6c9c7f2-098e-4b55-b754-4287b698fc1c@nvidia.com>
 <0FF9536C-8740-42C3-8EF1-5C8CD5520E49@nvidia.com>
 <93c758298250d2be9262256a698c243343b64ebc.camel@nvidia.com>
 <3c625930-348a-4c96-a63a-6a3e98e59734@nvidia.com>
 <acc56fbb56c3f40119e5a6abf9f13093d7f4c7e7.camel@nvidia.com>
 <ac85d8be-3cbd-4a51-a627-3a1a9926d801@nvidia.com>
 <80e57b47579df4cb603205935cc5e46fcb0eb409.camel@redhat.com>
In-Reply-To: <80e57b47579df4cb603205935cc5e46fcb0eb409.camel@redhat.com>
X-ClientProxiedBy: TY4PR01CA0118.jpnprd01.prod.outlook.com
 (2603:1096:405:379::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB6069:EE_
X-MS-Office365-Filtering-Correlation-Id: d2628ac1-cb42-4e8d-d745-08de2184d824
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|376014|7416014|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UkZ0WGRJZFkycksreHhKQTlxQlRLWGN5MUNqcTVQUkNYL3VtMStLT0IzYWN0?=
 =?utf-8?B?QTRyQlVkY2tUcFh6ZkxaQzQwOS8vdS9qQ3dJcDR1UUlHTjgxMEh5eFdTUDlX?=
 =?utf-8?B?aGZVcm5zK25uVkJCcXRGOGtSb3lVSFJKZGpBR29naFBFNkMwOWhqbjZVNWtI?=
 =?utf-8?B?cWhWRVgveVA4MTlsREpZZmp0ZGtJMndWVmZYUENUR3RkOVVpWThOU2djcExP?=
 =?utf-8?B?S0xscDNGSitZd2w4eHBKS1E2M2xRbHErd1dRdjJhU3lCWG5XQTdadlVqeUJY?=
 =?utf-8?B?dGl1UjR2TUxOMmdTREhuaUdqcXVZNUx1NVcwamhtYjdCWGJEZDk2VktVRlpw?=
 =?utf-8?B?Y3dpSHoyUlFtaFNBNUQ5S0VNSVFUNzdRajV2d1Q5MHhPZGxYVXBEZ3NOY0hn?=
 =?utf-8?B?YzVrLzZVc3NGdXBPTXNQY3pHalU3U2N3dHRTVzlPUmhvYWVlRmE5UmhURGY5?=
 =?utf-8?B?YXhFRWltaWpDR3ZUbDJRWU0rZi90c2hZRnJHb2kwVElZSXR1YjhTS1hhaVFF?=
 =?utf-8?B?MlpKUkVEV0krWUFHTTVuWnBRTWg5T251OU5uS2ZaQ204YlNQaU9abWNBbFNv?=
 =?utf-8?B?dHp1RXQva3BvdFdMN3I0S1cxNDJGaEF3ZkdOYU9aZkxKdVdEejhDbVdHdEZC?=
 =?utf-8?B?YTh2WGFucUR5RXg1SUJRS2RaOGl3RGQvcE5razhOK0FReTNzNGt4RGxZUWEr?=
 =?utf-8?B?dGRHSzZXaXhURDZ2YVZhT3kxM21neXF3Qk1FdU9TUWN0ZHIyanJuYVhZdHlQ?=
 =?utf-8?B?cXRDKytkYk8vS3B5a2h6ZGxoYmpjRnUrYkxQT1BGOWRBeGN4ZXV0V3loTHN3?=
 =?utf-8?B?TkM3SUpPRGRpRnNEcU9Nc0RIMTdES2hBa1FpVmp2OGxQUm9TVjg5ZSs4QWRo?=
 =?utf-8?B?dzcvcjNYenBMZEEzTGpBcDV6anJsZkFwQnd4aHEwTHBSR3IwVmNOSjBzaFEw?=
 =?utf-8?B?UXFCV1Yrd1BiTndCMC9ITjYzRU5uOFlwRmpLWmpQQStVQm1pYnRQT3g3VDFj?=
 =?utf-8?B?bmpHMnNSQ0M3UHJhZ0o5NHRMMTQrNW1jbWRjRTVjRDZGMTdLRVh6THZBY3E4?=
 =?utf-8?B?b0dRSi9CeGQ4Yk9KY09xckZ3YW1OQm1JbHMyeGhEV1Y1NUlIUmJqZlYrV3NG?=
 =?utf-8?B?clBMUFFpakhuL1EzVEtyTmhlUEh1djh4Rk94Z0FpRWJodUxINkNmQnNzdkdH?=
 =?utf-8?B?S0tmY0N4R01GZFBGSDNpUnlteko4YjN0MjVlV2Q1TUlXUlN6Tkh5KzdBNFpj?=
 =?utf-8?B?ZEdhU0dRbW1oQlFHRWk2SlY4b1dSN1gwTkM5Q016K21vZTd5RnRtZnFkVTNu?=
 =?utf-8?B?d2pzVDVxOVpPZjNrcjd1L2k4cUhmZXpNQWJGanJGVThJMU8wRWNDdzN3N0Uv?=
 =?utf-8?B?emJCeXJtUUl0eEs5TkZaNldXUlNqYTY2WmNEcHR4Q1N4Z2l0bjRkNjA2N0Fs?=
 =?utf-8?B?NHV3MFZpek5VRFQwRlZiUEl3VnNrWXVqN3JucEp2ZnMvQ0FVZ3o0WU0wUUZr?=
 =?utf-8?B?SGIyVTduMm1wRzVJTGVJbmZZeHJTdFljRFd6czJ4RTI4aTArK0FMcFdYTzF0?=
 =?utf-8?B?VkUxN2loRjlOeTVrWVV0S2lDdDNGUFVXeVFOUFJ1bW12eExLZnBBUVh2Zmd5?=
 =?utf-8?B?LzkvSnZOWEpmM0puQjJiaVRWaVVaZjlKSFlxZnJTd2dTdTYrcjR2TTdHdXlk?=
 =?utf-8?B?OEVVc2twemRqcVltWFptbGxkTDZqSC9ob2lSUmkzaDk3cXFpRVlZTGZxRmlN?=
 =?utf-8?B?UDVWWHpOVWovb1FRYzdORW9TQW9mNHZYVzlxUTF5YnBnN05ocnQvYTZZNVNt?=
 =?utf-8?B?UVA0N3JTQ2lSMDg4ZnFzdFhDSU4ydlZlaXFWOFhCUTRPNzhtZy9jOGZaTlFB?=
 =?utf-8?B?NXV3UVQ2cnRqZjI2OHdITElxeThPd0s3a2pjeTNVSVVDQkVwd2hyRTd5NWx1?=
 =?utf-8?Q?E47ho80h/OSgPuge3/VVfWQMKToAxDwI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnhmUGFiTnNKb2I0Lytla1RFVFMrcDFDUjZCbnVMNUtpSHJWRjN0bXpDSW1z?=
 =?utf-8?B?RHdUUTdNZVFTdWdSb0pFd09tdTRLY3BVaFhUdHZjWEhHNHhCQ2srWWlRbUU5?=
 =?utf-8?B?SWQ5M0NhZEtqdmx1T21NMFB0QmNDczZ6UWlYM281OFZ0OXlZV1N2Q2wvN0l4?=
 =?utf-8?B?OVdhQkJyb3lrTjNmdnp1K3hkZC9hVlpXMXRydTFBOTNIcE5idzdUOUVmd2ZL?=
 =?utf-8?B?UTNBTStsTE9teTJDc280THdyOG50Qksyamw5ZkVyMWJZSWpnbnNwTllyUStz?=
 =?utf-8?B?czFpOEJmbUZTMU1oNnc1ZEpheTJydG5uWUwzMFVGRGgrQitFcm9KdExLc0Qz?=
 =?utf-8?B?cGpxa09NU2ZXNnlCbGpLN0xWbnNZZjd1bFlxeHQvU01VTFZPUEVSdFRrVHBM?=
 =?utf-8?B?bDQ0OExiSGE5clg3MlMwUEVDUkIvWFJ1S2toN0EyR29aZE1QMXhTbzlGYW4v?=
 =?utf-8?B?dCtDQm83aHZuK3RvS2xwZmpiZzlsRGZ6K0tGdkQrY0ZLR3p5UzF4MnBkSXRM?=
 =?utf-8?B?VUxpby9Da3NYSVVMVnB2Rm4xRVpqYWx2eGhBdzhxRTRlM1d3VVVmRkpqSWFB?=
 =?utf-8?B?clloeWZzY2VhTG5EbjBBbjlKb1hmWkpDekpOUmNVN1o4Z0E1T041OXVhUGto?=
 =?utf-8?B?ZTBEaDFweDZmNzQrTU1ualdpV2lkMG9sNnJ3V3AwM0dwczlaTTBPeWhZMkxT?=
 =?utf-8?B?Qi93a1g3elhtNUVneWVtbVl0RkFwaUF3dW1GRnBKMGIzYS83UUdVU3p3REdn?=
 =?utf-8?B?aTJNUlMySmJ0M2k2d3dVTlZxU1Z3WXZPTVhxR05FODlhSDREWkNnSkhWNmpJ?=
 =?utf-8?B?SlphdjV1UE1WNHJiZFdpK3NkY0cxbHcyWmhRZjFPbG1mVVNhMkJqWXBzbFBL?=
 =?utf-8?B?b2Q1SnBBbmpXV2NqekpGNWp4ek9MSFdCTkxNRXMzZGwwVWF5NWhaUmJldU4r?=
 =?utf-8?B?N2NOUWpwek5vZ1lNRHM4aHlsUHpReUZ4a1lnQ3JxRkhocVhpWmhZUjY2N0ts?=
 =?utf-8?B?eEhtV0ZMMFhxUmVkTEtGSXQ3K1VUOGFReGtBSjQ1MzFmejNqNi9BREYvOVJL?=
 =?utf-8?B?SEk3MnFMR2ZDNVQ3bWh5azF1TEp1Tmh1TzQ0RjJIYXJxRnVibzVKVWdhOFJm?=
 =?utf-8?B?c0h6NWMrQ05lNWtQYi80RGZ2d2ovWWxRSytpSDZ3TzhEV0M0TmlxMkR3REx1?=
 =?utf-8?B?VFBaOEFreVg4S1NDTXo2V2k4eENIVnNvZHFpeUJZWmREL1B1U2IrWktFSVpW?=
 =?utf-8?B?RTBxdHBMMFowSndudE9rc2doWnhqbGU5aEpYWFhIZmp5L3pWZFU5MWFjUFdG?=
 =?utf-8?B?a29mM2UxQ2NZZnVXQ3g4c0VLblhtKzFOV00xSzhad2kzNjNDYjZlR0thTTQr?=
 =?utf-8?B?ZDdyVS9RanUxdVdFUHVHNlRYbTVCZkV0dU5NYmNHRWhHRmV5MEFoVnEzbzda?=
 =?utf-8?B?WERoSG1wZWIyNnQ5SGFrM1hta1RIWHQyZ1N3UmEwd1RDSFR1NnZrVjQzMXZl?=
 =?utf-8?B?UG8zUExJZWthMnZtQWZDNnk1NkRuZW5LRHZmWm15UUw1V1dlMjRFa3huUGNt?=
 =?utf-8?B?VFMxMkJtVHFySXoySVJaRXdXdkpyTEQ0UnFyRTJabVo4TlpLbGdYejZ1RU9a?=
 =?utf-8?B?b3hTME5qS1ZXTTR2VkVpM1BFRGt5SHVBY3RzVGEwN0pyU0NRQjEyY3YyYkRF?=
 =?utf-8?B?ZEhONDNCNGx4TFZyUkxOZlFGeUlObG5USnVaWEh2WjdzRHNob2JvY2dhSmZm?=
 =?utf-8?B?ZVEzTnR2bVdBUWpDdEV5MHBvUzVSckZ3cG5aYlA1ZzdPdkZDa3k0cktNRHFv?=
 =?utf-8?B?VW9FODVzNG9NTEM5dTlrRmtNUXowRzBpN285WUF2V0QvZjNFeDdGSzAvbEp3?=
 =?utf-8?B?clZoOUxHWjNUNUllVHM5MWE4d2tud0ZTcTZjQ204UXdhMHVGV1pVQTY0cVAv?=
 =?utf-8?B?VzJsMktScEZWa0lCQStXNVYvdCtiQ1dxNUdlVjd3TzFaV0dpZlFSSFlqeVM1?=
 =?utf-8?B?N1l0WjVaVFZXRUFIV2ZRd2E5T0tucWVaUHAwWW1Vb1NkdEx2ZFJ0UXVpWHFZ?=
 =?utf-8?B?Y2JvMk9DbmVLc25Nd2U2dW9kYi9rM1NmKzhCUVlwcnZ0TkE1WWxhRXU1QU9Z?=
 =?utf-8?B?R1djSGRLazZwSklRMld0cjNpSEJHcEdTeTZwV2hKTjlhQm9GYU5MK0pta25J?=
 =?utf-8?Q?d0n1X43tUdWWptr241D/IlZio4rtz8sHDCYnrNNmjMwo?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2628ac1-cb42-4e8d-d745-08de2184d824
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 00:45:58.1158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CP4t3Hw8jBnHnYWhUvJ9FplfVxpCnE1EXLnB5ftVoQZQyy9yhng9BuYbmEoMPNZN8dveEcsnM7IyzxShTaESQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6069
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

On Wed Nov 12, 2025 at 3:42 AM JST, Lyude Paul wrote:
> On Mon, 2025-11-10 at 10:16 -0500, Joel Fernandes wrote:
>> On 11/5/2025 6:19 PM, Timur Tabi wrote:
>> > On Wed, 2025-11-05 at 13:55 -0800, John Hubbard wrote:
>> > > > #define nvdev_trace(d,f,a...) nvdev_printk((d), TRACE,=C2=A0=C2=A0=
 info, f, ##a)
>> > > > #define nvdev_spam(d,f,a...)=C2=A0 nvdev_printk((d),=C2=A0 SPAM,=
=C2=A0=C2=A0=C2=A0 dbg, f, ##a)
>> > >=20
>> > > ...and those are unusable, unfortunately. I've tried.
>> >=20
>> > This works great for me:
>> >=20
>> > modprobe nouveau dyndbg=3D"+p" modeset=3D1 debug=3D"gsp=3Dspam" config=
=3DNvGspRm=3D1
>> >=20
>> > I get all sequencer messages when I boot with these options.
>> >=20
>> > > ftrace/bpftrace, maybe those are the real way to "trace"...or someth=
ing
>> > > other than this.
>> >=20
>> > You could say the same thing about most dev_dbg() statements.
>> >=20
>> > I agree that dev_dbg for sequencer commands is excessive, and that imp=
lementing new debug levels
>> > just to get sequencer prints is also excessive.  But Nouveau implement=
 nvkm_trace for a reason.  And
>> > we all know that because of ? in Rust, NovaCore does a terrible job at=
 telling us where an error
>> > actually occurred.  So there is a lot of room for improvement.
>>=20
>> IMO, the best way to do this is the tracing subsystem. It is the lowest =
overhead
>> runtime kernel logging system that I know off, lockless, independent of =
the
>> serial console etc, next to no runtime overhead when off, etc.
>>=20
>
> I agree. FWIW, it's worth noting that honestly avoiding logging is the wa=
y to
> go for anything spammy. I've seen quite a number of heisenbugs that only
> appear when trace logging isn't turned on in nouveau or vice-versa (igt t=
ests
> that fail because logging causes things to time out=E2=80=A6).

+1 for tracing, when debugging we are typically interested in a very
small subset of the debug logs and the ability to only enable what is
needed is essential.

Though I am not sure about the current state of tracing support in
Rust...
