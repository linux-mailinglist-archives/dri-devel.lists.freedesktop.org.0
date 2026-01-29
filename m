Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id B4IkNauremmv9AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 01:36:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27619AA429
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 01:36:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B16910E78E;
	Thu, 29 Jan 2026 00:36:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SYxtPmGe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010008.outbound.protection.outlook.com [52.101.61.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C8210E78E;
 Thu, 29 Jan 2026 00:36:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KeJKS5Lak5sX1fnzdoK79RIggtB1oxKe1/YTID6am78Im2bdyq/UPIlggb3Sgewi5IMz2yyBLKhMhJhFy3jyx783rvaPXpFPKrCz+KTe0nx3BNtRtkBgqVV3BMk+jyEmoK1R+mJfz3k7u1b2ZCBGjK91kBsRfclXoMX3tjoLCMFwygr49GcgU+yPn1+iHdELb18KxAmTLcEUiW9d7MQdL2XrslFnVl25wzxGzMkQiLGaFovdYqnkQCrtN5RmWkKfAgxKam3DT+33MLh1VQlOMzUtScRaWf1+zm3dSdApG7DWsho3WAqq9NdzU/h8tFZcSB9empEIgq9DGThPsjFImQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTs5YK7i7+S5OwbMEyIn2Hub9HbDk27W6Aauxamxy3I=;
 b=b0XjIHLzRIDhWd1LjQkgJz6u36QVs4/EkOlgsyXCoJruoppP/SC9M0HTjIyOhkNq6LP5Wdo1Q2C/+Jkm+EI6Fje0TuitrdVlkI/qO97Oj0GzJSbprq4O6N7FlizcoIOl0ZFML06TSGrt2oYXSf1CdYhhCzE9yWuLF7P9kns/p6SKn6NGX/ZpYarjePkRNYNqJKkf4ypGRz47/SMm+3i0N4OqKW5aqCDEifTR+qssUhAv76WWD44FtBUOA/KAYCITaNopSzXA9QbaupWw1kfvgAKVvl6CO4tUVyusy/NNdooygZz9W3bDBuMUXB2nK7FpDynWgGemoiU4AC5AN3buOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTs5YK7i7+S5OwbMEyIn2Hub9HbDk27W6Aauxamxy3I=;
 b=SYxtPmGemx+Rp5fHKLKvUiM4aI/nDJmFtEwIOdD04edcrCB9Rd2Q/kmNpdKHHkm+XWPb7lJAyufXMhi/jLlDL4nO6/XKZnK0dQwSa7l4AjjIR7N8uRZ6azY4fc2vJba3LKPWzESAhIHZNurDtfpams5k5R8Ey6yEj19FQ2zWPB4k1plMbfUmrOx+p8w7pXPXKyx71KnBhg8zVYNHbMmQKY+pMTA8uIJ4/fln8QVE+YwJeCl9frZF2Ps9RE+v6iiMDHSmfLowNWIzjSY3ZfPe62Fl7dIj+ORakV/M8MGzMwqKDJfoMCUaBu+vXr4InlHDXiUY9skU1LYImPvAEVx+Kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB6654.namprd12.prod.outlook.com (2603:10b6:8:d1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 00:36:45 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 00:36:45 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Jan 2026 09:36:38 +0900
Message-Id: <DG0NI832K0H5.25HYXTD205X7B@nvidia.com>
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Alistair
 Popple" <apopple@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Dirk Behme" <dirk.behme@gmail.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 1/5] gpu: nova-core: use checked arithmetic in FWSEC
 firmware parsing
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
References: <20260126202305.2526618-1-joelagnelf@nvidia.com>
 <20260126202305.2526618-2-joelagnelf@nvidia.com>
 <DG0607SU943F.1FDOPYPN38FCS@kernel.org>
 <259bdacf-d16e-4fff-9f6b-f860feb40aa8@nvidia.com>
 <DG0N5PNS1ZQ0.13WMT4XYDXNUS@kernel.org>
In-Reply-To: <DG0N5PNS1ZQ0.13WMT4XYDXNUS@kernel.org>
X-ClientProxiedBy: TYCP286CA0029.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB6654:EE_
X-MS-Office365-Filtering-Correlation-Id: ac89471c-fcbc-47d7-b695-08de5ece7adf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MllHUy9FZ1UwRGFkRDVHRmZtbitGaVB5YmFKNGF4VmxmZDZtNSs2MDB3OFhG?=
 =?utf-8?B?ZmVzSE5JWWxpbXkzdWg0cGZWYkl5ZDFmenF5Z0xzT1htZzlSV0R1aG05bFZ2?=
 =?utf-8?B?ZXpnYmQxUVo1YjV6WWNhL2d2VS9Eb1ZxNDFmbFNLVGhBWldDWVJ1MzdBLzY2?=
 =?utf-8?B?c3NaRXp3WWVocjNnajhFdktaSzJmUG9pUE1vZ2xtS2hwdHo2M3RkZWRFRDRS?=
 =?utf-8?B?cENMN0JCZ2FiOTlhWHNRU0NuREJYdHhGLzN4U0RFSStzdkxDY0NSZFJWb1dZ?=
 =?utf-8?B?ZDR4ajlpRWpWaXBONEQ1S3NkM1NybHdGVzdzWVVqY25JR2VFbzJZYkdJcnpq?=
 =?utf-8?B?cllUbDQ4NW5UR3d1REt1eHE3eWdLQU9YSEhsS2dpanluRk1tZlYxZFJSbDU2?=
 =?utf-8?B?KzV2eG5MS3NrRXdybU1MWlpmNXhpbjA5dnVBUnVtVTgxdmFjM09tRkdYTFl6?=
 =?utf-8?B?RGttV3pEcCtXZUY4ZlZCYzdtbmUrZFNuRm1mVVpDSHNnVGJneUxYbzRqWit4?=
 =?utf-8?B?eTBzZEMwcGs4N3pGZ3crcTgvb3Q0bmhIaXVRd0hEbmRqUFJ5SGZMeGpVcENF?=
 =?utf-8?B?Nm1NTUhTb1lZMDgzTVBRbWErOEszcVhmcDNzc3ZXSU9Ha01oVnFWaEpWTndR?=
 =?utf-8?B?dFFPUDkvdG10WFpHNisybnlBb3R0ZkVWSThOYWJxLzFsSmlIQk5VelBLUmN0?=
 =?utf-8?B?OFplcDFxWHhJUTI0NTBiVFVYMUxWbFNFNlQ1OEoxQ0NHRUp0eTQzZDljMzU4?=
 =?utf-8?B?Q3BDNXN4SFdQSU14S0ZqUDdhS1NNdkZSL3YvZ21VWmFFUm5XV2xGdTRzQW0r?=
 =?utf-8?B?dlk4L3F1L2krdFJXRkZ5bGFsQUlpRjJMUCt6aldqUkxCWnlDdEJWb0tHUEh3?=
 =?utf-8?B?Qis2S3NJalo3YmlVU2hSaDRPV2dsb3NZZWJyTS9YZ0d0b1h3enU4d0Q0N1hG?=
 =?utf-8?B?V2NOOENMYnBIRTVrWXVlay9ndW1GY0YxL2xGQnRxQnhXODROV3BBR3pqanZH?=
 =?utf-8?B?amw3eEZING5LMXp6WW9TL0pzcSt3a3ZVK1JpWkdFSENjazBnek1JODhJaEt0?=
 =?utf-8?B?TVRnUjdQL3B1WUVNOFE3Ulp5TzVxeS91cHdBcmZlOTh1UDZyNnlZRFIyVm1i?=
 =?utf-8?B?eXUyVjM1T2d3ZlQzbjJyamZOLzBmd1hXcllUZGtnT054d2traWxPZ2EveUor?=
 =?utf-8?B?SGsvaXd3ckJlNGtuWmxmSmhnT2Ntd1JEZ3NXOFBYdmxHZndjUkdyTGdtQWh0?=
 =?utf-8?B?Vkxrc0Rxd1Y2Nk1maWVHYlFJSk4yOE5lTU8rYW9zWnh1M1hpYmk3Yk0vZnNN?=
 =?utf-8?B?WFM5eUxIamQvYUdlYVdQTGZXcFBramhTZTFGS1c4dHJ4cElqNG1CbHJObGxm?=
 =?utf-8?B?dlA0S3c0djJkMWJTRFlHRUZwdmZGOU5RWitWeFVxWUdsRVE3bVh2UEhHeWs4?=
 =?utf-8?B?dEZ4a1FXK3lGOENqSGpXMkRZTmlBV2VGNHFtdHBzd2NzTWtJOWxJVzNDeUtj?=
 =?utf-8?B?NzUyZE5ZR25oQ1doWVVUSmloQnUzZGwxdXBhSXdtbElIMlFqMEp6S24zSUpp?=
 =?utf-8?B?TmRRWWMreVMvTStQOXMxa3FrK0hScUVXVmtINTNjNkhtaktKenhBRm5JSEJZ?=
 =?utf-8?B?dlBSK3Z5QnkvOFVmWlE5S3Q1anNxTTJqeXdPT3JkTkpZaVd5L0tyTEMzUUVF?=
 =?utf-8?B?OXZodit1cmRVbTVrTitpaUVUZ1liN3NEUVJ5ZjBVSGRGMlA4aCtZM0N1YkZN?=
 =?utf-8?B?S0ZEend2NmkvS3NRZDJoU010YW8yUE5nRXc5RGpDUWs4bjFVTzVCSDF5YnZL?=
 =?utf-8?B?WEE5Y0hhMnoxMzQ5R0lmdGF5d0NQK1JENmpBWU55WmtVWlQ3Zk5xZ0R5RUJJ?=
 =?utf-8?B?OFJPTzNSaUhaNUQxWmFLMEdIeVUzUGVDMmJaT0REa2VPditTTlFMV3RrUTB1?=
 =?utf-8?B?WGNOYnZUelJJdzJ0MDJVNXd0OEtBU1BwcTF3NytrSVY2bWlva0FiVWtCUlF6?=
 =?utf-8?B?VGhoVTJaZzQ4ajRMWndYeGxMWXQvMVM2OFYyL3pFMzhzZTh0UFkwOVpVdW1z?=
 =?utf-8?B?WjE4TmxpVjBsNzRZWjRvQ0oycG1RbFVLaG5zclVvcHViUk5aeGhHVGFDQWxG?=
 =?utf-8?Q?LZjQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3FCMkcvOFlWSHRMTVErK3J3K1lTMWJHdTNUUmV6TTFtd1I4Q0lzWWRES09w?=
 =?utf-8?B?SlhrZkYyeFZUM1FjbXBMU2pqa1c2c1JTdXZpenErWVczamk4eFFmSk4yS3NQ?=
 =?utf-8?B?UzRvMkJ1VWFXSjVobW1kWHhIcmVpTjdDWVBpYTZuVllwVVVHcTJ4bUV2T2NN?=
 =?utf-8?B?cC90Zkp6TnBIMDJ5MHdWazlpUE83Wmc5MWJ0Z2orLzNaV0hJVW9XMjBhbEJX?=
 =?utf-8?B?eHNLRWlyNmdFK2lYUCtTZzJxRmlueFZVanF5anluOUEwWHFHVDdBQUlqeVoz?=
 =?utf-8?B?d2p2RzdMelUwNmFibDlWdGVudE1td3VWMStjUjVHOUVhQitrR2R1OHU0ODNF?=
 =?utf-8?B?Z1hJQ25IVVhaRzRCYk5jS3Y1dmpzQjdMODF3YVlxc1NHN2Rjc01ad3FGWFZC?=
 =?utf-8?B?bXhiWFJTZFZ0MUNJTVRVOFdmS1o3K3MzU3poNnplci9uSXRua1dTUzdzZVRL?=
 =?utf-8?B?TFNKZXRqNUl3TkloU2cwMXJvbmlqSVN6cG12VlJKVXZ5Z0REdjYvSEs5T0lO?=
 =?utf-8?B?bHVRRGxuY0hVRFhqNkQ4eVdPUXNlQ3E3KzM5YWJxYWgvU3NwSm9aRFEwRlJq?=
 =?utf-8?B?VlRoZ0QrTEJWbnhScUpxcXYya2VKVVA4WFRlUXgveW9oOFZJRGpvZ0ZaZVdq?=
 =?utf-8?B?UWNiY3VXTDM2MnJqbklVb05iNTNxcE4zLzJ2Yzc1YURwY1ViWG9YcVdTc1FN?=
 =?utf-8?B?M2VIZUhmOUhscHF5RisrN0pweUxaaStReHQ2TWJUWHdRU3ZMMCtqbEpXMk5u?=
 =?utf-8?B?NXRvL1d2YjVSNWpRem96RExVaHl5OUpCN3RqTzBldERvQ0JacXFXeDA5b2xN?=
 =?utf-8?B?RkdTVGlVZW10YkxFd2NkSnRqZEtUYXBHSnhkcENCaHpFN3dla2JZZzVaQ0Rs?=
 =?utf-8?B?cWhSRnFlVVFMYWc4UDR2V01kMTR6dHh5TFdnRjJxYmprTGtwdWwrU2UxYXB6?=
 =?utf-8?B?QnFnNEIyQTVobFV0Qnl3S1RSUmhtYklsMXdqQ1NFaFBEdzBjRFpraVd1ZU13?=
 =?utf-8?B?WjJ1ZHRxVU80UnBDRTdFZjVFamRudG5OR2pwME1BQ3pHb2d0TzZXc3RjQjIr?=
 =?utf-8?B?STIyMEpaWmxMNmVWWW9HemFrR2VINVlEcGh3bmJlZ2dLaGFDcGJyWi9ZL0li?=
 =?utf-8?B?SWdhQWR5NWJzTkRCWWNCQzB4Wi9tcGpaQUI3ZlVkWEdrQ0tIQ01UZWs2Qm1D?=
 =?utf-8?B?dUs1ZXZKYTlyVmRyUTRUMzNGc0YyclZuN1lPd1RscVVXaml5d04zTW5hQlNu?=
 =?utf-8?B?UzZvdmhFUi9ZNnlaVU1nbFoyR0tOMFl6RmYwWVdqMDR3VzVLTm1TcWlpZGN1?=
 =?utf-8?B?ckV6MlMvcGFVK2FPVTVDWUE3OHhBemFwdWE5anlkNmtwZEtvMlgvV1VjdjQw?=
 =?utf-8?B?aFJhQTdFemFwajBYOHdnNFRtV1hyNUZBNmR3TVhKVHFSM3FIWDlzaHF3T2lD?=
 =?utf-8?B?TjdqRTJ6NjNGMVBWNDMrU1BQRGcySjhXek9uV1RrYmhrL2pidS9yMEZ1dVR5?=
 =?utf-8?B?ZFY1QmVpbk9iV2VnYVNpa1p6K2VocFBYbjZrNjF5K1gvWDhZeXNvQ2tDL055?=
 =?utf-8?B?VS9ud1k3SC9EVDUzbndoSXJIN1JxR3kybWUzTjArVWtwSlNGUWRaRlJGOVJu?=
 =?utf-8?B?cFd2QmNCVG9TTkU3RTJ3aVpyOUNaSG82eUJxOGpaN0Z0S24wY3ljczFWRXla?=
 =?utf-8?B?Z0NuV1pZQTh2VU9WZmh1THFrZDJYZ2YvQm5JWEMyR005WXBhUEF4SEl3eVNJ?=
 =?utf-8?B?eWcvT2pEMjBvQ0djZ2tVNHFhM1RVRWxBWFBPM2ZlSWJzVDRHaVhjejJHdjIw?=
 =?utf-8?B?WDY0SWJDN2dRM1RHVE1QR0RrQU5sN2tuUUJVclVManVQcWxHWGI0MUxvUEVa?=
 =?utf-8?B?eUREbklyYWdJLzV4RGtGZXJtYlkyRWRDSnp2QlF3RXFta1djbk9UNVVPYmVr?=
 =?utf-8?B?aVFpaytCS2xHRGxUTHkxbjJ6YlhYVk5jVERTKzRDb21vc29uQmJ6V2JrMkk0?=
 =?utf-8?B?WGd4R1pDd3liTEZ1Q0lET3lLTmlvWmlMaUtZK21WTFVNWGRFS2t4L1o4SmtS?=
 =?utf-8?B?SHpGTnlyT0NYR1hBdVRSNHlLS0NxcGpGN2x1ZGE2Q09jS294RVllQ3NDQlNi?=
 =?utf-8?B?eDUraEowek5xeFhPV0dvM2JjYTEwZXBMeTVTWjdNbUoxMmNORDBodWppN0Ft?=
 =?utf-8?B?TlRRNWIrWWFJVDhJTEd4MC9Ha2Z0SWVBQ3lMRkVnWElpUHBhQWZFQzNLSXdB?=
 =?utf-8?B?ZVdBUndEa0pGY3VnRzl1Y2RQYmhRaWplYUp4am0zbm8zNWQxbUV0K3FBWEto?=
 =?utf-8?B?VnIrSWZyNVFHWlJ4R1VkbWIxcXQ5aWFPQjNEbC93Tm5TWjdJNnZiUnYvTURS?=
 =?utf-8?Q?CJ/XxfqRsqn/L9jyqpfGoY4+IgatR+Vn9pbhCMKRTFUMA?=
X-MS-Exchange-AntiSpam-MessageData-1: uhQswrrjeJwEBw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac89471c-fcbc-47d7-b695-08de5ece7adf
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 00:36:45.2996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A5YzYJWvcfd2sgraMATlm83n5+kCBE2LZ5DzIdDFJU9+JvaGg3TujSgXfQoqFpS+IWCfMZoc6N77Ar5QcNcmQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6654
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_CC(0.00)[nvidia.com,vger.kernel.org,kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,ffwll.ch,lists.freedesktop.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 27619AA429
X-Rspamd-Action: no action

On Thu Jan 29, 2026 at 9:20 AM JST, Danilo Krummrich wrote:
> On Wed Jan 28, 2026 at 4:14 PM CET, Joel Fernandes wrote:
>> On 1/28/2026 5:53 AM, Danilo Krummrich wrote:
>>> On Mon Jan 26, 2026 at 9:23 PM CET, Joel Fernandes wrote:
>>>> @@ -267,7 +264,12 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &=
Vbios, cmd: FwsecCommand) -> Re
>>>>           let ucode =3D bios.fwsec_image().ucode(&desc)?;
>>>>           let mut dma_object =3D DmaObject::from_data(dev, ucode)?;
>>>>  =20
>>>> -        let hdr_offset =3D usize::from_safe_cast(desc.imem_load_size(=
) + desc.interface_offset());
>>>> +        // Compute hdr_offset =3D imem_load_size + interface_offset.
>>>=20
>>> I do get the idea behind those comments, but are we sure that's really =
a good
>>> idea? How do we ensure to keep them up to date in case we have to chang=
e the
>>> code?
>>>=20
>>> If we really want this, I'd at least chose a common syntax, e.g.
>>>=20
>>> 	// CALC: `imem_load_size + interface_offset`
>>>=20
>>> without the variable name the resulting value is assigned to.
>>>=20
>>> But I'd rather prefer to just drop those comments.
>> The idea of adding these comments was to improve readability. However, I=
=20
>> can drop them in the v3, that's fine with me.
>
> Yeah, that's why I wrote "I get the idea". :) But as I write above, I'm
> concerned about the comments getting outdated or inconsistent over time.
>
> Besides that, it more seems like something your favorite editor should he=
lp with
> instead.
>
>> Do you want me to wait for additional comments on this series, or should=
=20
>> I make the update and repost it?  Thanks,
>
> As mentioned, I tend to think we should just drop them, but I'm happy to =
hear
> some more opinions on this if any.

For safety I would keep something like the=20

  // CALC: `imem_load_size + interface_offset`

you suggested. From simple operations yes, the code would be obvious,
but there are also more involved computations where order matters and it
is good to have a reference. These shouldn't change often anyway, and
the `CALC:` header catches the attention of anyone who would update
them, similarly to a `SAFETY:` comment.

If Joel agrees, I will amend the comments accordingly in my staging
branch.
