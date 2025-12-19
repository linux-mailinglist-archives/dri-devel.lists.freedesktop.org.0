Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F859CCE2D9
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 02:47:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28CBA10EC2D;
	Fri, 19 Dec 2025 01:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="m1CgTTEO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011070.outbound.protection.outlook.com [40.107.208.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC9C110EB2A;
 Fri, 19 Dec 2025 01:47:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CSyPjTDT7TdspFdYWsEsMaoRzXDcwnN+VT6+fjCnk1wE5A5gEMjBTxvcIrFxSjsCik+54hxOUxB8hSIOwa7iIEa6ET0xBU8tfCMmQ5Yg1T42ho5+64ghrtPh90oqxx6nywsk2yd8sXXXx/CdEXrBQ/vhKjfla04ZJw5GygOy4I2nwt9KfiYImPaOYEtlUZd0yPPLgNeZee7HN59xaAjLdbuJbJVT+ywE4475wu0P06klWBYDc97U0QO27DokluXCa/Vlph2Sk41eU7dusE98cI5SWZfSRQhnsHtduHbxXMz20c58V2c2fP82ObdC8J2D0BHheKoK7PKuBT/92xmcWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8gC5nmYMM7gBiMt/Mbo+oY7Rs4npZiCrntYf5R8BErk=;
 b=tHaK/ccH2lVka3xTGX8TyzYS9iggsUBb9Qh+TW/ynEQm3JdoSmEudxPlJ7FwgY/auKE7hXrkuY3yItlQ+LopTkfSNjoZweYKy52R3rSEnljZmMGWysxPeSTPcW4sPegR+zFktZEpO86riBvxbLDLUhJUwH9C6GLaWfzqEyt668vo0gO6YGobxxUSVPqFMueoT3VIHBaP612sVBcnsQZFXix+QFZd5rqA4fpZL+kLJZaylHJr+Ogwrxm9RCJslf0tSMtKqxYq5uri9+B1hF93eqOvBUVEJXAvMRZM92/2zgYvHvV7mOT7vvC0B5hQY7tr0F4xx2nfyyb/OMnlt+Cj0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8gC5nmYMM7gBiMt/Mbo+oY7Rs4npZiCrntYf5R8BErk=;
 b=m1CgTTEOL0tmfGsvnN7p4fHBAu7YPnXQ+PtLy0Va3TnD/15S9tURJF0xU2odcD2dGsW1FX45XDX3nl7xGJ1NN/krAgpTEPyASVJCmQY2Bazr05mwGYGuItJVYAinYxgf0rSpJ+1Ho3Cd48yyJ55PjdpFUihciLAWKJp1L+N4P1vmfO69vrhxH0CxOL74MqgIA5wLKzD7vEMT+ejxzBbDtP/P35fzeaSRfgx6YBzeW+6OB1bIdTmCfYRzuD1QRXJOaii5Sxkln6MpQTokoe/0vpF9nLPJVWr9ukAqegU1YTO1RFn4a2blPxc5ZzzjygCVC8ko/rmzJG98op2etX/vYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MW4PR12MB7189.namprd12.prod.outlook.com (2603:10b6:303:224::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 01:46:56 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 01:46:56 +0000
Message-ID: <7ef64473-cad7-4618-8f30-be3d5308443e@nvidia.com>
Date: Thu, 18 Dec 2025 20:46:53 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] gpu: nova-core: send UNLOADING_GUEST_DRIVER GSP
 command GSP upon unloading
To: Timur Tabi <ttabi@nvidia.com>
Cc: "gary@garyguo.net" <gary@garyguo.net>,
 "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "tmgross@umich.edu" <tmgross@umich.edu>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Eliot Courtney <ecourtney@nvidia.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
 <dakr@kernel.org>, Alistair Popple <apopple@nvidia.com>
References: <20251216-nova-unload-v1-0-6a5d823be19d@nvidia.com>
 <20251216-nova-unload-v1-6-6a5d823be19d@nvidia.com>
 <C890CCBB-76C0-4E70-A7B8-846E34DABECE@nvidia.com>
 <DF1DLWE9OOR6.2P43ATQYNAU3A@nvidia.com>
 <1369611d0014a4e5b630462d66790939b0f564c0.camel@nvidia.com>
 <F72EBB64-BB07-4FFA-85C9-3EDE9AEE3C48@nvidia.com>
 <e3fcbf9b9165da51c05dd2837adaa0be2ae1f05d.camel@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <e3fcbf9b9165da51c05dd2837adaa0be2ae1f05d.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0148.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::33) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MW4PR12MB7189:EE_
X-MS-Office365-Filtering-Correlation-Id: d8722e7a-760c-48e9-d154-08de3ea07d88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bU5JY1Z4dERHWGZWWitqREtlV1RhOUs5Rzk4dWRlVUxyanZRYjlzSnRrMW52?=
 =?utf-8?B?bEI4dnBIYVFUYjk0cXVVaGZMd2JTeHoxb2lzTE4xcVNIQ3FhVndUZzlyU21r?=
 =?utf-8?B?ekI4Y29rVmN3aTliYVVBVjFlM0UxdnBYTTZyMWVPM3ZxOW9NVDMxd3NaYkU1?=
 =?utf-8?B?ZlZGOFVnR3NNSUdRMUIvUmRIUlV3UTBFcCtOeUg0bFdhdXZ0NkJhQ1MwaWJj?=
 =?utf-8?B?N001QlZLR0ZCWmluM01BQ29lRWcyQWsya1FqV1NvZ08xSkNOMjc5UTZxQkhW?=
 =?utf-8?B?UjNYcXlTREF6ZHZFdFlZRWtkbEJiNVpBVklLbWtoVFRETmNaWmUyMzE1NFF2?=
 =?utf-8?B?VGZENlFvdGNUdzI3d0lIUEFDUUhVYU1uMWRrZ0JKd1NPaWxBUUU0czdOdmxh?=
 =?utf-8?B?cUxlOXQ2NGVxdnZCeUVFaDFwWWFiRXVYZkhEKytwbjYwUU9temo0RnVZelli?=
 =?utf-8?B?NzNkOE10Ymd6NkdUV1FqTXBESFB2N2VjTXU2R0dDYWxIRjFlV0hUVEN0azR2?=
 =?utf-8?B?WER0bkhlczRGZ2U0MWtiUkZSQWFsOWVkbVlYTUtLZWh1NWNrWldlejlKcGN0?=
 =?utf-8?B?NjYyQ09qZE1wc2djWTZqOFZUMVRRNXhNNlBTU2JsUG5kQ0pNSVJmcnFXQzBH?=
 =?utf-8?B?WStrTWhRNEYzVW5CL3VJZnQ5VU9McVdmRHF4cTN2dU5SZTh1SmZ1bW1CZGRk?=
 =?utf-8?B?aG5XYXJ4NTFMYWdJZUwrajlwdkdWUU11c0VLaEVmaUpob2hXcE5WMXcxd0Ra?=
 =?utf-8?B?dnNvcHVsZXYvYWxrUVlVREZiVy9JZS9qL2tRRVpmWmkvL2dRQURxMjZBTFlr?=
 =?utf-8?B?UlVTcldOdWVlVlhDQ1NrNGx0NkhoYytqRUlDcjd0dHlkcDMyWlVRNzZQWGh3?=
 =?utf-8?B?Z3YwYmt4NmFLUzBkUHowTnlpYWh2WDdMN3JpSWI4eElaTVVpTDladlBWaksw?=
 =?utf-8?B?U3RuNDhtZEhaSkJzU0RIZHR6MnRGaDFlckdZalVLRGlPems3VE5MaG5oSTV6?=
 =?utf-8?B?RDVlQzdpcHpHM1h2N0pWRFhjanhGQWNieFRPRFJVTEhtQ1QwMWY0ZzQxbTUr?=
 =?utf-8?B?eWZHeHphbEU5Lzd5ZzJyd1huSkZwbTdNUUY5KzRLOUNZUTBnSjF1Vlh3RS9z?=
 =?utf-8?B?RWF6andGbkgzaFdySTZhM3JweTFqRnRTRzMydGdhM293TmhpbXZmMytHdUs1?=
 =?utf-8?B?ZVVNTDlreDNBUUlGWDBHYW8xZ1J2WW1LckVJT1JGMGxZR0lWaHRJMmwzNDBS?=
 =?utf-8?B?ME53clVmVnRUcmdxS3VteU1Qd3F0Mld2K0R4WFNTUmp1Y3kwdUxmUU82ekFr?=
 =?utf-8?B?Skc1bjRFSjRWZzEvUE83UzRCM0NXUko0SndzQjB1aGF0R3FHUUsyTHRQckhT?=
 =?utf-8?B?eUxBL3lRK1RXTFhmalg3bk11dkFKTHVzUXN6cXRxODhNcVd4UVgwNnVDU1hB?=
 =?utf-8?B?NzMydjJ1SHVaa2d5YXZhSmY0SlNEVGd4SStWK3VKMVBNSC9nNG54ek5jVVg1?=
 =?utf-8?B?ZU5NVDVjZHdFeU4xTjArMlZ3RGg2a0EzOTg1aUN5K2lBREFFMllnU3FqZDJz?=
 =?utf-8?B?QWpHQ0NOcG5kU283ejlBWjhRaDVGdXdtQStqcko3b0t6NVUvNHJNczVHMlNx?=
 =?utf-8?B?SFp5bmtpTCtsVytCSGZuZUJ5empnZmNSMmU5WTFsdXRUWWVPQkxtcTBJditF?=
 =?utf-8?B?TDRKWVpPaG10Sm9CWDNtbGV3bEwvL1UydGxSdSsxK1hQd2lTRFduMEVqM2VL?=
 =?utf-8?B?eDd6NmFUVExDb0FtY0ZwTUFHMkg4UjJraUVZSWdwV2p2N3RZczBkYzBYK2tB?=
 =?utf-8?B?Si9LVS8xSGZnY09FT3IvellCQzFsNEZlOWhIMG1BYXFBcExvWEQzNE5pZkEv?=
 =?utf-8?B?SWlodFd0dXlrb3VhYmpzZkNkSEhSZWFSaW5DQmViMWdlSldzQWRrVEtXY1JQ?=
 =?utf-8?Q?BxjxugexRauwuCMrV9j6gR7fkPGr5aie?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXNsY3RORXFESTBma0JKZzlpTitrSjdFT3RwcS9udnYrOWtZaE5DYy83bHlH?=
 =?utf-8?B?M3FvT05OOFkra2d5Nm5Gd3RmdmNKcXg4akpQS01yaWRaZ1pLeHdkRDcvcndh?=
 =?utf-8?B?SFhLVitWTWRqV011UXNNaWE0MjVGZEY0eEF1aWVTWUtGSkZxV3B2NmNibHN5?=
 =?utf-8?B?b0R4d2VvV3NiSlJGYUQyUVFzVlFaTTNjbFkrWlR0Y0xOTU85NVJCdERnZEhj?=
 =?utf-8?B?dW5jSHlSYzRteElQR1V1dHFuL3pHNFBFdHVjd2hNVkFTM1BLbUpOZkVHT1Bp?=
 =?utf-8?B?L1lMZFE3V2oxejkzaGtZYWRXdHRrbWpWRE4zQ3Fub2N6Mk9idzVnd2RCeWJj?=
 =?utf-8?B?N05PSFVQTTNGYk9rZEtEWWJUcVY0bHFGcWFnRWxDRS94aVpzdUJsZDBiSTdj?=
 =?utf-8?B?L1BSUy90MUJMRjVHR1FGZmV4akNOdUl0cHZGUzM2NTk2L090elkyYUtsUlZq?=
 =?utf-8?B?eVJ5SzVQUlQzNG56NCt4K3U4RkllOVZtSTdVRnk1UmgzcE5rb3FqOTRhY2RE?=
 =?utf-8?B?OTlvSWtkVC9CTEViMTE5eTFCbHJDZmZ5ei9TNTdEN1lGV25leEVoMDI2eEY1?=
 =?utf-8?B?dlpvNGFjMGZKaFZJMisvdjJrUmNkc3lHcmh4QnBDMDZGSWl5UmhIZ3pPeHp2?=
 =?utf-8?B?dG1idVpJT0d0Vkh4cmJQYkF6OEhRaGxzaUcxOE14V0xyYlJCUExSWkdPenhY?=
 =?utf-8?B?S3NZeFVHTXBuQUlJOSt3SG9mZkRtVU1GeW5vS0xmZU9NTUhicmtwbFlJT2VQ?=
 =?utf-8?B?TWszbURXK1VzQVR4eXhZNGFQZ1pOSUZIcFcwZHlYL3NVMXE1ejJndTdXbHZB?=
 =?utf-8?B?Z2M2dE1pR1JDQndDTHBDUDluWTdkVlhtZjc3azFvc3FGSXdkeThXK2J1NGZF?=
 =?utf-8?B?WFBHWGRndHJpelgyMDlDdGJvTjRwSmdEQklqeHNTZjJyV1QwbHpnQVRISE40?=
 =?utf-8?B?NVhFMmtZUzZrQU9YcGNWbzI5SjB4MVpWYTJLNEErSTUxWFpBa0dlamxFQ2dH?=
 =?utf-8?B?ZlFmalVHYVd5WFltcFNjck5OUVRiaGtRYWhwMklMUlZIbVJjMEQ4VGFHWTZ0?=
 =?utf-8?B?dWtqMmYrQytZMkh4VmFlWW50MnB6a1NIcHZ3TlpndmRWRjM2RUNDSVlFNWpC?=
 =?utf-8?B?c1lzUEVpbEkrMTdRTXlWUFJtajdsMUUrejdBbG9CRFlHN0VqMWErR1NyRmRa?=
 =?utf-8?B?N3ExMzErajZhRjVqL2d1RkU3VGkrVWVkRzBXUmZVbTdoREhLeEs4UFRET3p6?=
 =?utf-8?B?YTRNTE5yTndSMnZ6QXl2aVUrZGhNTm9QNnA3cERPb3ZGWXVTV3RNeWJXL0dR?=
 =?utf-8?B?M2p0U1lFcXJrZUh5L0JZNDd0TEFnRlNoRytzT3ZHcEptdkdEQlBENGZzQ0Rx?=
 =?utf-8?B?T2VLdDQyVER1UmZUTjFLZmVnb1FjVWt3Z2h0ekpDTG1mTWpFUjZvRjYvdDFK?=
 =?utf-8?B?YTU4OGUrQVIweXVzL2RFWnhBeFVrVFJ3VWs1SDBxWE90eE5tRlZNTm9GRldV?=
 =?utf-8?B?TTlHYkhoYlpuWHpZYUgrRlcwdkJBZDdNWFk1aU1EMGJqS2U2RUppYUZxN1Zw?=
 =?utf-8?B?Qi80SksrVCtDcVlZV0RIY2NwWjBmNmJNY0FQYjR0SUc3TElybEplakNMMHp4?=
 =?utf-8?B?eTQ3T01vTXlaY2pGOGxNeTdkNE9iMUJTYmtuMSs4bkRHeFJvVTh3clNvSUtx?=
 =?utf-8?B?UkN5Mnc0cVloWHVUSWdFZ1BDTUZMVjVvWmU5d3ZEcXBlVnR5Yjl2Ni9mcWVP?=
 =?utf-8?B?V0ZsQXRqV3JseEFFdFppdjBZQTRUUWpUZEg5bW5aUEJxL2VZdGlXRE1pL01G?=
 =?utf-8?B?K1E3VUozR0ZvOWEwSXFZdGF0bmhCTDUvSThYVEp5RGlCdXBETkRVVEx2Mzc1?=
 =?utf-8?B?bjROMjRaK2k4bkNyNUFYeFd5L3ByWERHWlliWFRwbThzRVZqc3Qyc3lSWERR?=
 =?utf-8?B?RTlqQ2FTMFpxcTZxKzhPZFc1ckdFWDg3bnVUY3ZHMVdFL1JNNk1RZmtGMjVV?=
 =?utf-8?B?T3M2RTRmSjNmYk56ZnBoeGxSQlFlRVdzWFFOYjRneUhESzNNL3dxNGNuN2xM?=
 =?utf-8?B?S1h3YUF6OW5ZR2crM1AvdHhYVzB3bTJJN0FVK01RandDTmVOa2F5aGc1c0Qy?=
 =?utf-8?Q?9T8tqgaksZdoPL2IWvI/HpbkU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8722e7a-760c-48e9-d154-08de3ea07d88
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 01:46:55.8104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dIb6L0es4fOtH17LcMharcHczOQ6O4nitTIEh1kXAiQwAuAmdMuALOSjbWftPsAS7LNm3zBJaI6z1VYMQmobCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7189
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



On 12/18/2025 6:34 PM, Timur Tabi wrote:
> On Thu, 2025-12-18 at 22:44 +0000, Joel Fernandes wrote:
>>> Isn't the real problem that we are polling for a specific message, when all message should be
>>> handled asynchronously as events, like Nouveau does?
>>>
>>>           Err(ERANGE) => continue,
>>>
>>> This effectively throws out all other messages, including errors and anything else important.
>>>
>>
>> Indeed, for that we need Interrupts. For the rest of the patterns where we need the message
>> synchronously, we should bound this. Hanging in the driver is unacceptable.
> 
> It's going to be difficulty to have a running asynchronous message handler in the background *and*
> poll synchronously for a specific message on occasional.  I would say that even in this case, we
> should handle the message asynchronously.  So instead of polling on the message queue, we just wait
> on a semaphore, with a timeout.

I think we don't strictly need a semaphore for synchronous polling - the wait is
expected to be short AFAIK and if not we should just error out. What we need is
a registration mechanism that registers different event types and their
handlers, and if the message received is not an expected one, we simply call the
event handler registered while continuing to poll for the message we are
expecting until it is received: See how Nouveau does it in r535_gsp_msg_recv().
Anyway, the wait should be expected to be short and if not, we'd break out of
the loop { }.

Interestingly, Nouveau inserts 2 micro second sleeps while polling AFAICS. Where
as OpenRM simply spins without sleeps. I would even say that sleeping in the
loop is risky due to the dependency on atomic context, so we'd have to be
careful there (I am guessing all our usecases for these loops are non-atomic
context?).

We still need the interrupt handling for cases where we don't need synchronous
polling. During then, we will directly call the event handlers from
IRQ->workqueue path. The event handler registration/calling code in both cases
should be the same.

So in the loop { }, nova needs something like this:

  Err(ERANGE) => {
      // Dispatch to notification
      dispatch_async_message(msg); // Same ones called by Async handling.
      continue;
  }

 - Joel

