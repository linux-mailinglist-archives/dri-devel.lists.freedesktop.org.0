Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDYREvjDeWl0zAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 09:08:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE3D9E0A6
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 09:08:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB0210E28C;
	Wed, 28 Jan 2026 08:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cc7Ezula";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012032.outbound.protection.outlook.com
 [40.107.200.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E4F10E28C;
 Wed, 28 Jan 2026 08:08:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M24MIAm+rRMz82Ju0dM6YtnRiWohp7hbraTpI6cEG6P6S1DWKYX008GNG1ZMidaolzNw1s0ou0UcCj1Z1mpEwUsKraKgoDfr3g7K9mfn0nnQotqQ0CfCR/Z8ctxxwmltR/7XW9jv+2oXi+FmVMnZBO6JU08la3eoP9HeC7rNs1rT+Y/VrJti2PORKGfgE7AF/fB+pNhL5BuBN+wBw78DyPDfNbr+metWLxjhaOc++Y2G9+VxM2bLgPs9iohexhWHzaoLsWxBGWPmIvk0kGNxGynFvOEVgsKk7ef3Jvh6i2kNVnkKc4zMEPM8TKuBahhNpAoluzGqf6KRdc+ATwzVgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Js4KTF1W87ZFWZRsw396SAlOLHXeCsOJHhyqHYvKWW0=;
 b=KLgeKz2YV8vPQR3lPEKgJgnfWkCZs5g97KMfRc30/DQlLNcG24Q6vm0lTjOlx2fifY7SVbR78j05qjGuS5tNmRY4im7wU4LMqxN5RxU9WcrSSxX6fig9iYUq1QJXix/tF6j6ZN0aN9zMM/TWR/r8io84JWb95WVNFOzHk4fc84RFfyToHTA7DYJgJh4OgSaEFZjw7I9U44IJmYgf0hKnUnMOFcbxMoUN4lMXN4dp4MtBMPzuQfcpsiE8p67n4ETRwakHFhFsLEYLoNtQEXRM9oM6BYKEWpW0LR5jyNk5FoE4tHPPH0AFGB5hv+MWPREczGKZuxCj/jrfBHa15qMd/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Js4KTF1W87ZFWZRsw396SAlOLHXeCsOJHhyqHYvKWW0=;
 b=cc7EzulaHwebbp7LxGTBg4bG/SZRtcPB5nuy7vHmdFmp8z7Z2qrgO69tPi+OFkgRRnI/IeTOG/mYRSKV+HWp57E+7pWDS6OZZKEyyyRhG74703WDNo5hJeL7hxvFvzomPXRAofplJ0d7LcjQr/SxsRz2ZZayLijmC574FNVmu3Lx0K/Pu9+0vwkeJUFwQ8bnnpOvbY1KqnTo1PcqlnrsgBrCPCaX7yUqt2HG/CHJlrdz9gyqYGqQGod//ogzZrER9kiV7uEZbQ0iWbkhCf8FlyHcUcWdboJ7Eda3W61ERFI1F30mgqkJNQ28bubR7TYcu6+jMU+d39ueD3Nb2X1IVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS5PPF8B1E59479.namprd12.prod.outlook.com (2603:10b6:f:fc00::659)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 08:08:14 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 08:08:14 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 17:08:10 +0900
Message-Id: <DG02HED94PLY.EZY2AUCW4LOL@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Alistair Popple" <apopple@nvidia.com>, "Zhi
 Wang" <zhiw@nvidia.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Dirk Behme"
 <dirk.behme@gmail.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 1/5] gpu: nova-core: use checked arithmetic in FWSEC
 firmware parsing
References: <20260126202305.2526618-1-joelagnelf@nvidia.com>
 <20260126202305.2526618-2-joelagnelf@nvidia.com>
 <DG02AC8I2XUA.2UM92327TQKAL@nvidia.com>
In-Reply-To: <DG02AC8I2XUA.2UM92327TQKAL@nvidia.com>
X-ClientProxiedBy: OSTPR01CA0053.jpnprd01.prod.outlook.com
 (2603:1096:604:222::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS5PPF8B1E59479:EE_
X-MS-Office365-Filtering-Correlation-Id: f5838c2c-87fd-471a-0bfa-08de5e4462d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|7416014|366016|376014|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bTh1S3RmWVNYdWNWRkh4UzJROU4vZ0JNelVCTm5FU1R5RzZQdmtkRENWTlJv?=
 =?utf-8?B?OWhNN1JxWjRkblAwRDVGR1VWZFNBd3N2T1FzMnpUdVBQT1l4bXJJeXh4bFUy?=
 =?utf-8?B?S2ZLdzZDNk5aWVhVVWNoMExuSkpWYkpNMVQ0dWpuUUp2OXFtdmFxMjFEajIz?=
 =?utf-8?B?dUlCQitBeVBLeGhPc2JtMG1WN2NxeHdFZUZCNFQxYVlqMEdVTjF0YWxscTZX?=
 =?utf-8?B?emNWaS9DNkEwZHNxMjRaZmIzZVh4dmtrTTRIbENCN2RVZUFXK29oVFBITllw?=
 =?utf-8?B?ZjBrREdsRm5SY3FFTWxJY3dHWjZRU2pFYmxub2FVSC81dVRPY1gyMmFGWTVQ?=
 =?utf-8?B?QWQ1ZXltUWYyQ0lpMlFFVVJScUY5WjhBQWtJeVNKMWd0MWlDZ1FsR0I4ZVNC?=
 =?utf-8?B?SUZWT2U3b0JPZ3k4NVFZQXVjN1VPZTNhY09nVzE0SzBOcHpMVW4rQk1KSTlB?=
 =?utf-8?B?WTY5bTZLU2RsdXFwRktlRnFWcU53dFBicjZPL24yWDJveEMxVXE5eTJ3bERy?=
 =?utf-8?B?bngzczVQS2ZRS1JyQUlZMGtqRy8wenBSSGhOWXI2UUJNNjR6eEFyeHE3S3Az?=
 =?utf-8?B?akVJV2h0VTRNSmw4MnNxV0lwZlY1TlA2Mk8wL2M5SGN3Z3gxdzNwb2Z4cGNN?=
 =?utf-8?B?Rk16aU5lemFJSGxZOFovRXRWckFqNnpiZWhrS3M0eCtib1lLZ2ZKMXJudTRl?=
 =?utf-8?B?UEQwVldmK0RBMGdlVndmZ21FaExTTHZtY0JVNXJJK2k3bG9GWXpST0ZwWFVw?=
 =?utf-8?B?TTcwdkJRSUR3bitoL1pyU21qMW0vdkZIWlFlMFZYWU8vVkVFWW0zd09sMU1Q?=
 =?utf-8?B?UDB6MEdxZ3hReVNEOU9ZZzlYQ1ZUWW1wNS96ZzlHVExkKzdRcVJNVG5NSnRG?=
 =?utf-8?B?bHB6NHA3UFhMNmZqTDBZZHJKSUQwZk1kUlYrbU5jVXdjdFNXc0p5MGFHYzlr?=
 =?utf-8?B?MUliUXkza05IR1R5L3ZlRmRPbDRzN2lxVVBleW14N0xicUJ1U2V1NkpMWjhR?=
 =?utf-8?B?QzF2Rkx3MTBLUnFNOHpzaWtxbjhlRFJsWW13SjRSeHFlZ3JrQXhmZkZSSE44?=
 =?utf-8?B?aUcydzVpVXZXMHlUVUhqUWdwaDh2TVljUVlqeTNZVS9iV05iN1ZSUXY5UzF1?=
 =?utf-8?B?a3RWbnQ2SHJSZmpsaVJtWUpaNDI4aDJLcTBGcXNFN1JGVklQQ1ZEWHBuMDR5?=
 =?utf-8?B?cTdFdTJZNEVPRlE3RDhDMFBRSFNnWVBaUExMQVpKL2NiWXU5RFFWMEVDZ0dY?=
 =?utf-8?B?MmxwMXp4NzNCWGVSeHJRcDhsMzlueGZGOGRXbUVDYk1sZ3BqeGVQL1NNeTYr?=
 =?utf-8?B?N3d2aVowN1MwQUUyb1R3Mk9Pb1h2TmVibGh0b3JrZk1mMlhVcVpBYVVmSmJL?=
 =?utf-8?B?bEswUThXTnYrdlp4eVhWckVzRGljdWpXenA3RE5aTHd1YU11TXNCdndJelYw?=
 =?utf-8?B?eFBGa2ZOQ1lJaWV2RElrdFUrMXM3K296enhYeHNlS09rdXhKZGNHVjA1NlUy?=
 =?utf-8?B?UmkzclRudUtMWTVPNjd1YWhZMFlYYmhOSFprS0E2ekVyY2p5MXR1MmRsaVA3?=
 =?utf-8?B?bDFrNjJtM0R0bHhrMk1HeXNEdE5jYnh6am1kZDBCOWt1dG53MFV0M3UvVStQ?=
 =?utf-8?B?ZXp1NkRlN3YwUUx6andqQ3c2Z2tzaGFFTVgvQjB6VnJJTGFsUTdHRVl3YTRo?=
 =?utf-8?B?Z3VLQ1R5RERMeFRwcXlXdDB2VS85U0E5Z2hWRnlFYTRTRDFOeVJJRE9BS2xD?=
 =?utf-8?B?ZTdiNlYyUXpzRVl2ZmpzY2ozRWxRdXY4WjhrV05tRUpRRG12b0MwVnpTbVNM?=
 =?utf-8?B?Nm9KVk55NURMWjNqVzNkWGxiblJyQkRXTVpLYzd1ejJFQnVPWGZmOUNqMWZy?=
 =?utf-8?B?WCtkTmlXRVcyUlVCN3N3WWV6L1pOZmJHS3kvVEMzTlFITWhDOVpsU1NDOHBV?=
 =?utf-8?B?a1FXM2JGYUZuUDkvVS8vUklWN1d0Rm83WGc2Slg5TlFlL1BqZVhqdEs3OEky?=
 =?utf-8?B?aldHYWpwYW90YnpIc2QzQVNQVWVrbmZwSHN4UTRldTFtVnN6WFpTK0d5Tkh2?=
 =?utf-8?B?Nm9zemtreHFxckQ3QXBCNHJKNDNheVoyeTh0bDZlN3MwUSttQThnTlV5QVdq?=
 =?utf-8?Q?C0rY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(366016)(376014)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUlyb3FwNDFFVUIzVmlKanRldDFlcXZxZjdCZ0F6KzNQM0hsOG02UTFwcEtM?=
 =?utf-8?B?OFluMFpmbmhZbVBJRjNZUGtQRGRRYjFZUlV3Y1kxbDZOejllem44QU92R1JB?=
 =?utf-8?B?TnBIenNUcDNFL2tzajIrSWtYN09HenJsKzlVZWs3VERad0ZvR2FRdkNPT0ln?=
 =?utf-8?B?RGR1NVdRMzRqQ2lENUkzYzJmRWxtK0xyaWpLRUYvMEx3SHVMQzJzTzhlcG1X?=
 =?utf-8?B?LzQwQ1ZlYmlSaFJHdzBxOE1raGtTTERjY2svMzEzRk5xbXlSR1JVYytBQVVq?=
 =?utf-8?B?UFlLNmFNUGhUREhUUGd4dUM3U2twQXF2dDV1bWVhNUVIdUQwMEN5WStZY3hu?=
 =?utf-8?B?TlQrK25XYjNiTHVvTWhHMHpqYkh0QkFHN3lQc2NkR09JaHc4azdrVERRMFhV?=
 =?utf-8?B?clRyNFFwRElDYVFxK0x1d2E1eGU3S3dHT2N2VnBRbDN2cUZIY3VlY1lVcDBa?=
 =?utf-8?B?Rzd0ekZxRFV2TS8xek9hWEhaR3A3UE12bGl0eFNIMmR3NXNLZy9lYVd2dVZI?=
 =?utf-8?B?T3VFNkFXUGRtTFV5Z3BCMFpZdzVsRzBEaU1VSlVHU1JDc1dHRE1zeUhubTFL?=
 =?utf-8?B?aktGdTkvN0FuR0R4U3N5V3JFNmlXVzlsNnhpWFBWcWd1L3FBQ2VwVlRlZTl2?=
 =?utf-8?B?ZGllVFYwS21neHpBbktyK3BZdlNtckpGalJZb2MyWHZWSUFXVVVpbDk5bVQ3?=
 =?utf-8?B?K2xVU0ppVER3Z2hrR2xtVnJES2dubUNXei95NEFqaldWejI5NjFSU2xNSlBm?=
 =?utf-8?B?RGJSRkl0eGVrd3pobWZnTjlHY2FWUEFqUGlpQUNDZ1BpOGhMa0c2QUtmR3Fp?=
 =?utf-8?B?c1NLbXBuTlJYUXlSQ1YrVUdQK29yVkJaQVowRmFydHZ2S2tyaXhlK040SDlU?=
 =?utf-8?B?OGxaZ0NBeVAvcHdvSGVicTVoOE94RWZ4ZGo5OXB0Wm44ZlF1UkFFTmtza2x5?=
 =?utf-8?B?U2NMTHlsdUtndWsvMjVEOE5VaGVYaFhlMVFjY05sOTV1eC91MFEvb0pJTE12?=
 =?utf-8?B?Z2tXYmxxYnkra28yZDNqTDhNZWU5L2c1QVJmYVlLWmdtOUV2eGhXNDF1cVVh?=
 =?utf-8?B?NHNKV3FCMThiZ1FSUHp6MndHRVZ2b0FCK1RKMy9EQUxXTjRXTk1YVERoeGov?=
 =?utf-8?B?UGVVdENuWndIVlVKdEpHRG51ak5kVVpVNFBxT2M2MGMrTmpLNFQ5azhOWE9s?=
 =?utf-8?B?L0J2NW8zcVMvdG5TN3JDbFFhekl4ZHRrbnYrejFhY1N4dHhVYzZyOGRmcEt6?=
 =?utf-8?B?T3F4ZDZBRGFoZTNFenppWUU1VHp2WjBoZnJDMDcxV1V6K3V4NjlueU95Ympw?=
 =?utf-8?B?R0g3MHdrTWx5WlorYmc4ZFdsaGQ2aXFWeFV2dmZEUSs3eE84OXI2dnhaVUQ1?=
 =?utf-8?B?bjZROGhGdVF6Z3Vqb0t3UWxybWpvMFdMUjhXM2JyOUJyWUhJRVZDdEFCamVE?=
 =?utf-8?B?K2tZZDlVVGNvL2ZXenlUdXVhMGwyeUJDUWdpUHpuRGt1Z2NkV0F3OHVoOTg3?=
 =?utf-8?B?V3g4bjhRVlMrb0QyRmJCU1VqNzc5VEtzZDBqQ3Q1eWQrSkZjUTRiMFZYYmNZ?=
 =?utf-8?B?a1NESndqR1UwMHNsNGM2dU05eU9DeTRsQzlNOUFleVRnbzAzVzdadmR3NXla?=
 =?utf-8?B?R1lnSlMvWGRzcmw4QXF6WExrV0owblFra2tjQ1NMS0tDdGJxNTlkbE1sL1E2?=
 =?utf-8?B?OGpWYVNid3pTZXNuMm4wS2gvQ1NiMGxFYjZCbGtTbC83ZVVZa2p3eGhPdVMx?=
 =?utf-8?B?VWY4by9yQ2UwWXZJUTFCbWJLczg5N2ZyRmFNeDFPRUs5Q29velU1UGR0M2Zj?=
 =?utf-8?B?TWZIeU1IMlR1M2JRUTlrZGNtSzVpOFBmd0JiSzNrUnlNWGhzSjR6ckF1ZUFl?=
 =?utf-8?B?Z2lpTGQ5aFdobmVMWThuaWF5UzVMa3J5a0FYYUlrV1pHZU02bWhEWGMwMlBu?=
 =?utf-8?B?Ung4MFhqU3dLNDZsanZyWHBSbWxrQ051YmlEYnNjN1UvMGdEMUlxdGNENWNC?=
 =?utf-8?B?T3RtekZPVzUvOVN6Ryt3ZFpuZ0FrckN6ZWJNRTVwdThOb1U3ZktpTy9SQUxN?=
 =?utf-8?B?U3RxZmFPMVNUZjc2VS9sUjhUU0RxWnBZZjdXb2NDY2JkWUZDZWMwWnV3Z3dU?=
 =?utf-8?B?Q1pIVEptbk5ONmV1eHpuNHZKeEJwSjZpUFJxMUFsVEdSVDJUbVJJOGIvTU83?=
 =?utf-8?B?T0dkZ2hYNllTZG91bGhSWERwNDRwNlhSc2hvZXhhWTJ1a3BMdzdFRjh0S3Fz?=
 =?utf-8?B?c0p5REZZWlpIdSttbGM4OHRjNEVIU3hLNGJaY29ycjBRTEtpQ20rUFYvV3RC?=
 =?utf-8?B?NXVCQVJZcHN2QXZTUWwzcWtwQlhraUs4ZUErNmN0VThJUHFGazBKaTZ6dVFQ?=
 =?utf-8?Q?05H1eavxtf2GB5m3XJXXHyGEDXtt4YvUm4DHjmCAjdhjJ?=
X-MS-Exchange-AntiSpam-MessageData-1: 18nPMhCJ05ThUg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5838c2c-87fd-471a-0bfa-08de5e4462d1
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 08:08:14.4799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K7LlKR8lXuq/bi6kCFDgBptJ3FBHaiSbc98qZbe8FXw6hgKVeTbvLUfsFeJ2/d2U/KnLjr/RJSZV80Ps5dmPZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF8B1E59479
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,nvidia.com,ffwll.ch,lists.freedesktop.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 9CE3D9E0A6
X-Rspamd-Action: no action

On Wed Jan 28, 2026 at 4:58 PM JST, Alexandre Courbot wrote:
> On Tue Jan 27, 2026 at 5:23 AM JST, Joel Fernandes wrote:
>> Use checked_add() and checked_mul() when computing offsets from
>> firmware-provided values in new_fwsec().
>>
>> Without checked arithmetic, corrupt firmware could cause integer overflo=
w. The
>> danger is not just wrapping to a huge value, but potentially wrapping to=
 a
>> small plausible offset that passes validation yet accesses entirely wron=
g data,
>> causing silent corruption or security issues.
>>
>> Reviewed-by: Zhi Wang <zhiw@nvidia.com>
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/firmware/fwsec.rs | 60 ++++++++++++++-----------
>>  1 file changed, 35 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-=
core/firmware/fwsec.rs
>> index a8ec08a500ac..71541b1f07d7 100644
>> --- a/drivers/gpu/nova-core/firmware/fwsec.rs
>> +++ b/drivers/gpu/nova-core/firmware/fwsec.rs
>> @@ -46,10 +46,7 @@
>>          Signed,
>>          Unsigned, //
>>      },
>> -    num::{
>> -        FromSafeCast,
>> -        IntoSafeCast, //
>> -    },
>> +    num::FromSafeCast,
>>      vbios::Vbios,
>>  };
>> =20
>> @@ -267,7 +264,12 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vb=
ios, cmd: FwsecCommand) -> Re
>>          let ucode =3D bios.fwsec_image().ucode(&desc)?;
>>          let mut dma_object =3D DmaObject::from_data(dev, ucode)?;
>> =20
>> -        let hdr_offset =3D usize::from_safe_cast(desc.imem_load_size() =
+ desc.interface_offset());
>> +        // Compute hdr_offset =3D imem_load_size + interface_offset.
>> +        let hdr_offset =3D desc
>> +            .imem_load_size()
>> +            .checked_add(desc.interface_offset())
>> +            .map(usize::from_safe_cast)
>> +            .ok_or(EINVAL)?;
>>          // SAFETY: we have exclusive access to `dma_object`.
>
> Missing empty line before the SAFETY comment (also in other places).
>
> I will fix when applying, no need to resend.

I also got this clippy warning when building:

		warning: unsafe block missing a safety comment
			--> ../drivers/gpu/nova-core/firmware/fwsec.rs:303:17
				|
		303 |                 unsafe { transmute_mut(&mut dma_object, dmem_mapper=
_offset) }?;
				|                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^
				|
				=3D help: consider adding a safety comment on the preceding line
				=3D help: for further information visit https://rust-lang.github.io/rus=
t-clippy/master/index.html#undocumented_unsafe_blocks
				=3D note: requested on the command line with `-W clippy::undocumented-u=
nsafe-blocks`

		warning: unsafe block missing a safety comment
			--> ../drivers/gpu/nova-core/firmware/fwsec.rs:319:17
				|
		319 |                 unsafe { transmute_mut(&mut dma_object, frts_cmd_of=
fset) }?;
				|                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^
				|
				=3D help: consider adding a safety comment on the preceding line
				=3D help: for further information visit https://rust-lang.github.io/rus=
t-clippy/master/index.html#undocumented_unsafe_blocks

		warning: 2 warnings emitted

Since the `unsafe` keyword has moved to a new line, its SAFETY comment need=
ed
to be moved right above it, despite it still being part of the same stateme=
nt.
I'll fix this as well.
