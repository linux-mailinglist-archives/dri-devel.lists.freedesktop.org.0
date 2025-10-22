Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56ADFBFE512
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 23:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B796C10E1AC;
	Wed, 22 Oct 2025 21:30:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FWgtNXjy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012003.outbound.protection.outlook.com [52.101.48.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1BB310E1AC;
 Wed, 22 Oct 2025 21:30:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hrRFT8wM03jzkAX1XyDUXdzrREQwwXtZDXPiqlP3nl4QOuy5hnaK6TCdp/WKqeKZLqBXYSxfEWU3Ruqbr3po/mhGNZjEp0+Kj7LXtV19S6G8TVKAR40UnxGxcMlVzamfvO2mkqCCspCdGHvjZp9++zjKjVAeGzC79xaWnJqGV6hVjZ80EkhgcOyCoX/3goDC3HJU05u79o9j3sPtCykfsEDjOPxidRwBqTXrpxTwk64o+JZWCrb5lX2ttElDv6fKpeYCIk6HfRhqW44UtA+wdX3/58yUFM57gNNLwC6eS1AtwTeoj2iyZHDEs0qEDtn4mTyuCCjv3IcYfevQuV7xSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TVpgDSGpBQcLx/mB3oaXgio7edZVApYfQVVVJDXtf6M=;
 b=FJEvqdGoCl29gEqD7IgK0hSX84AXDaxuWFBI1/xDak56K0/nQ91AsRuRC1bewV05ZR+0IQzl87UXEL4AS1o8Qz1ltkEoibyNZpoy46nV4lmX0JNcJUEkp00whawXj7R2Y5XkeBQKnVyEFk1OT3ETUpqeMlyLMkBF5hoY03NeooZxtJWgXEkit5xobUJmcgU2GTdAWf4bqIywuQKXrUNzvO8nbT+JSqxpDYXtXRCnKTxMPSki3fcl01cccmoAdOQaxdgeL+uWHtbdOyTAPfpja0vjtT4vbuYlqKT/ffK2F9fII4H7uB+2RNdNzszaIsNA6DugGLGQQbnimtrQ9FoBCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TVpgDSGpBQcLx/mB3oaXgio7edZVApYfQVVVJDXtf6M=;
 b=FWgtNXjys/REJDFI97CwhcEpG0oU809JNwPJJEXkcztnqCrlu17gEagBqPF/xYuWhKCbEwVApZJVoq9EVBzuN2OaT2KMPYmSMGyJsuDPOGV2OiCd3ppfcBYLLROcFcJ4gVZMaclpohs4J0ST7V4ZNt/JcLsUoNX07ffmavFnphk9UhZ5mkPm9rmQLJhp9e5U32ETwB4/Wb7EQ9A/CsJ4CCoX98TNRlXGOILBvmLwZ++ifIICkv3+fHKfRa8ApcdJY6C13RqRtA5xt/lHg38pQ+Sy6zXaiLsTVLiPtkpzDTQnCT5BoR+7ybC+XtppxPtY0/Sd16Ze7Sd6gw25rnSJ0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS0PR12MB8561.namprd12.prod.outlook.com (2603:10b6:8:166::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 21:30:05 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.015; Wed, 22 Oct 2025
 21:30:05 +0000
Message-ID: <3cc835b1-d9e6-4d91-a398-7ea9c8f4332a@nvidia.com>
Date: Wed, 22 Oct 2025 17:30:02 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Pre-requisite patches for mm and irq in nova-core
To: Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <DDONM9Z1XF2T.32OBDFX7FONJY@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DDONM9Z1XF2T.32OBDFX7FONJY@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN0PR02CA0018.namprd02.prod.outlook.com
 (2603:10b6:208:530::13) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS0PR12MB8561:EE_
X-MS-Office365-Filtering-Correlation-Id: 85c1f8f3-c8c6-45da-07f2-08de11b22ada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dTZic09Zb1NrT094V0NKMDJXVDlPK0hzVGNpSTNvNGVaZURpSmRyTDAvS2kr?=
 =?utf-8?B?TzRuNlRqeEZwdXJ6aXFzT3EwWHNPWjVWVlJLMW9nMVlwWkZjNDlVNXhGdEty?=
 =?utf-8?B?b3hUdjh6TFM4WlZYK2ZvNHBFOGF2WjEyNlk4dGFoSHNtMEw0OU9zYldKZXVD?=
 =?utf-8?B?b3BjNDhnRzhqRHRya1NIdzdNN3Q4cm13YllsWEpiSXNyQnJKOE1MbUFSbkxK?=
 =?utf-8?B?bVJ3WEdNSzIvb2VmdU9lU1BFZ2lRQkFNNnU5Qm1DYy9PQnZtbHFIalhOYTBi?=
 =?utf-8?B?YmdKbWZyaFZiL0FIbWJ5bmFONHMreHFrV0RrSGJDeHh3aHZVY3Bsd2hhaEts?=
 =?utf-8?B?bFVraFBxOTQ5MWNXSlZraDREK1NUVnNRajNyWXhrOHR6d284N1RzREwzajNB?=
 =?utf-8?B?NjB3YUM4eFdzVFl5MlFiejNRM3hvaVVCUmJrRFdxaHd5cFFkc3V6TVlVVUdF?=
 =?utf-8?B?YXMwTXRONkJyVDF2dnFxc3kxdjllQm40Um8rY2NJY3ZhcE1pNE9nSDRNZzVX?=
 =?utf-8?B?bHBXc1ZNdkhpSDJhZUxlV1pEUGorYnRZaWUzZ2ZOWEEvd2VNYnJiN2s5S1RD?=
 =?utf-8?B?bzNMSnkyYUxPdy8vRGxUWmY1RzFUR2FrL1hyNGY2bnBIZXpCenFLOHhMaURy?=
 =?utf-8?B?WkNKSFRmaUc4QkNCYkFxNGhtNXBlTkFuYVEvWmVUWWw2YmZ0MzFSZmduakE5?=
 =?utf-8?B?SE1TMlRKOVg0ZEM5ZnkzOUhvTzVpcFlnQjJpLzJXWlVPb2FYbmdkWDRDdlM2?=
 =?utf-8?B?cHE3YlhpbGVpc0djSy9FY0IzYTN0dk1VSnhjdktwbTB5SC8yN1RUL2ZSUi8x?=
 =?utf-8?B?eUluNE5IQ053L2lPZnZKTGhFSnRCbEVXdmFDNDVubmhERW1qdGNVcll1YSsz?=
 =?utf-8?B?SXFyeTJGb0FrN1U5MDdFTmt0b0VjdElHOFhEZGczVm5tOTFjSGI3bW5TdW82?=
 =?utf-8?B?R29SV3B1UUZNQU80VHNxZ1RDZTgwM0U2aCtMTWQxTTVpamRWZEoxWWFZMW5E?=
 =?utf-8?B?bm12SU53aE94c1RDYUp1R25YK3NyVmRnSkhWNWNCelBYR0JMU3lFQzFPb3dj?=
 =?utf-8?B?V0hOcGpaUU5TS1RFb2gzbitjUWJEbXNqQlJMbU9BeThYMTc1UkZ2WjU0VmJz?=
 =?utf-8?B?UEJoYWo5RGI5OGZ0UVQ5dFFKOFhKNFlVb05OSlorSERKUmI3c0lNbTFNRTdr?=
 =?utf-8?B?OHZxNmVqM1IxVjJ4V24xSk9mSHg0NGdQbHNGMGZuYTdrWVY4VitpYTFBNE96?=
 =?utf-8?B?ZTJQTWw0eXZQMTNsRERtakt0TVdUazlkdys1elN1N0RwRXhsWHArL3ZlcmMx?=
 =?utf-8?B?aUtpYkRnWXd2dURBQVhtZXk0bWlYR3h3YWFveVVjMUF3RURkbVJ2SlpQZmV6?=
 =?utf-8?B?cTF1ZGluTlFUd0NzdmhkbWZMQVBzbHdFbnQxcXRBWUZaYUdKbDRtU0tpS3FP?=
 =?utf-8?B?eUZ5L1Y0cXBqREkwbFh1bERmODkrUlNONzRQUi9tdWVRUHEvazhGa2dGYVNh?=
 =?utf-8?B?c3IrRlZJcmFCRXBRT2hNU2dnSTNSNVRyOFVpalZHWVhtSW1scWtiV3loVVJ1?=
 =?utf-8?B?bHJnN0ZHUXJ3ZTZRK3VwU052WWdYc1NRWk9pOUxVaStteGFqV1Q5d2ZxeUFn?=
 =?utf-8?B?a2JaanZWQ1I1K05CL1BneTB4RGhuZVRrL2JtNzBPT2o0RUZSYndWdXZ3K0Ra?=
 =?utf-8?B?ZG42ZU45d25LYlZkQityb1pmR1V6ZG1pTklkKzF4TUk0YXYxQ3ZaVTVXemw0?=
 =?utf-8?B?QW9YcjN3UmQ3elRickxYQUFId1E5Q3RzanhMMjAvMCtlWVAwUVF6YUtIbnk5?=
 =?utf-8?B?THNEWjBOUEhMM1huSG5KSjM0YzA4NlJpd0V3bG9MUDl0TjVZUk9HOXRDM0xT?=
 =?utf-8?B?cFVIcDBtUTQya3NzcCtkQ2RKN0tTcVdDRktKYUdyZVFYVTJyN0VXbzdXaUkz?=
 =?utf-8?Q?bi67uyVvpSQ+PdyjjJINL5dfL9uZnIHQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3Z2RmZFYWM2K0g5cXBFcnlDMjBoRkFEcXRnSEJTSmZ5czRkdzdrTklMb2NQ?=
 =?utf-8?B?VmZ5RTFsQXdyTXA4dEV5QndNZzlsMEtSVStuejhNU2NRT1duWitUbWJGOHZi?=
 =?utf-8?B?N2VRRVdOSEJDTHMwUFhNQjdHN3ZIN01INDV0Sko1RUNqVzBwNDR3Y2lxdysz?=
 =?utf-8?B?VTJXajVaQ0JndkJZUUQzam5uc0J4bmplejdjN2VSL0lIVjUxVTl5SW1UNkdQ?=
 =?utf-8?B?NmJLUUQraWJGMXJTRmp5YzF2NTFqaXh1cUIrdnRHWVNwaXBlUFRSVlJpVTdt?=
 =?utf-8?B?SkdxeHFsWUZNdW1GK056M1Vhc3UybDcwSFRjT1FZYWZEa3VsVE9OczdFNWZJ?=
 =?utf-8?B?RmZvQXhsek94ZlI2cGU2NUJCZkozTnFUMW9LTW5sMUo3bmFIUGkzMXBMdDlG?=
 =?utf-8?B?cTFuQTFMU1hDc0lzaHJDc2lBSU9YUnRuK3JkaEtUQUc5NHdxbzd0SkwvU3RQ?=
 =?utf-8?B?aVgrZnpsY0lOdlhPUjB6cHJZbjRlT1dpcFpKOTdSYWNWRURzRTExVlJjS2h4?=
 =?utf-8?B?U1hRZTJiLzJ3QytCUFpvcmVWYnBVcWxhTWxTbmMzd2RnWTl5WEIyRmxlakpK?=
 =?utf-8?B?aDZiRi9DV1RnR1J2S1VkcHQrUnFDaVNYd0toMkhiV3JlcHIwZ2E5eU8wZ2dF?=
 =?utf-8?B?S25yQndYTldXTDhVZWhLU3JtUjlNUEZxZmllejJySFk2VEZpSVE3dlBvQVVQ?=
 =?utf-8?B?YVhVTjFjdDV3TkhsTzdLcHM1QzlBNE9tSy9RTEtRdmw0dy9OUUc4eG9tVlZV?=
 =?utf-8?B?bUJyMGc1T2Y4aEhEdXVIQVVESmJOaUFKcjJMaVhaeXFUMDRMMlJHaWZIbXh5?=
 =?utf-8?B?Y05SMXV1Y0FMenQ2TEVBa2VrUmYzMkhrLzJEK3VDdkFSMXl0aGFTbFU2SCtP?=
 =?utf-8?B?a3JUQ1VZcytQU1NWUHAyVVpaK2sydlFNSytNdnNEczNsbFF2RHZhb1pub3R2?=
 =?utf-8?B?bHVWSVhwZkh1MU1BZTM0aHRLSGZaUHc1TEF6b0tEckNXZ2szYlhPL0VUczdx?=
 =?utf-8?B?MldGdDlNR3p1bk1XaXY4dnYwNW8rSkIrT3ZaYUkvLytKSHhKUVpZbEx5MEYy?=
 =?utf-8?B?ZkRvdWF0aTlYdjBjSGpHZmZ4OEE3QnpnMlpob01VSEU1eXlhaURDS2oyMHBL?=
 =?utf-8?B?RXN6VFRpY3lTZE5HcWlzVmRra3hpSEZ0Zk1kQkoyZVZ1c0dHS1QvT2FhM0pT?=
 =?utf-8?B?cGY3Q1J0cWhwZVFwRy9IbzBJcFVlMWxUR2ZuR2E0QXNVVmtOQncvYWVrQSs1?=
 =?utf-8?B?aGp1UTR4dHNNL2hjYURuOTV3emZ5RkIrWjV5TjlmSTRDYWg3UHROSXNJWTFh?=
 =?utf-8?B?dHp4SGZhaXBrTGRLNEtkaE02aHdxamtid3BMb0R4WEQzL0xJZmprbkR4OTRh?=
 =?utf-8?B?MmltZXFxdkR3WmQ1cGIxcVc3K21Ub0RMeUs0Y0x5MnBZMldlWDNHcCtobEYz?=
 =?utf-8?B?aHIwdGFuclNvOVFaZkRqWk5FM1kyYUMyY1NQd1pidmlQZEs5cDJlWC85dEtw?=
 =?utf-8?B?MnFTR3JkMWg1d3FTei9KVGtya0IvbDhiejU4TSs0Mmw0bDJQSi91OGVaQ3lU?=
 =?utf-8?B?R1BPaEZreUx0THIxbnlrOG5aZjBrQU4xZ2poSXpocTBRMlJFVEFhTE1lWFVM?=
 =?utf-8?B?TlJ6dzF4RDk5aEZNQ2FXQ3I5WHdNUXRKSHVmQXdmZTNFbStyMDhwNk96M0l3?=
 =?utf-8?B?SWRQK1hlQ1JlZSswVW5obkhzVHloZnJqQU1BYmVuN3QzNjA1SlRxVjUxR084?=
 =?utf-8?B?SjZjR0NCemtCWk5oQ1BBVVVlQW1GTzVDZEI2OFhlL3BpTkIycGNIdFBuSXN2?=
 =?utf-8?B?SkIzdG9pVzFnN1lWK0FlR0hUYUErMksvWDZwTTJwQVV0dTJha1F1M0pnV3RP?=
 =?utf-8?B?WityTFRoczNZbE5yUGVseElaWXhZdmg3ZVNwSDVIa1dXcHpFek1PZWlJQjVP?=
 =?utf-8?B?K3NCSFZpYi9EL2VGNjFTbVMvQUhaU2g0N202OHErRHdTM1diaG1hNWtXVGpB?=
 =?utf-8?B?RG5GNW9mZHBLTzNkSXhNd0ZFbkhlMVJxWHV6Z05QM2wrTU5aMTJXK0JzaEZG?=
 =?utf-8?B?d0JqQm1OZDdjOStsbTRwMDdQZE5FazhBOHZDZUFRNkc5N3p2Z1BGeFRvTGdq?=
 =?utf-8?Q?/SpsBhFTKk5lu1YeZKSDKH2i9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85c1f8f3-c8c6-45da-07f2-08de11b22ada
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 21:30:05.5578 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0/qNoFlcdDIZ85EBSw1iUUDSGtlsWriBUqFFQQiqcPrs2lPzDJ22R2TaOqRwx3JgiI5+7Y+wpUcTUUN9x1Jtpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8561
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

Hi Alex,

On 10/22/2025 2:57 AM, Alexandre Courbot wrote:
> On Tue Oct 21, 2025 at 3:55 AM JST, Joel Fernandes wrote:
>> These patches have some prerequistes needed for nova-core as support is added
>> for memory management and interrupt handling. I rebased them on drm-rust-next
>> and would like them to be considered for the next merge window. I also included
>> a simple rust documentation patch fixing some issues I noticed while reading it :).
>>
>> The series adds support for the PRAMIN aperture mechanism, which is a
>> prerequisite for virtual memory as it is required to boot strap virtual memory
>> (we cannot write to VRAM using virtual memory because we need to write page
>> tables to VRAM in the first place).
>>
>> I also add page table related structures (mm/types.rs) using the bitfield
>> macro, which will be used for page table walking, memory mapping, etc. This is
>> currently unused code, because without physical memory allocation (using the
>> buddy allocator), we cannot use this code as page table pages need to be
>> allocated in the first place. However, I have included several examples in the
>> file about how these structures will be used. I have also simplified the code
>> keeping future additions to it for later.
>>
>> For interrupts, I only have added additional support for GSP's message queue
>> interrupt. I am working on adding support to the interrupt controller module
>> (VFN) which is the next thing for me to post after this series. I have it
>> prototyped and working, however I am currently making several changes to it
>> related to virtual functions. For now in this series, I just want to get the
>> GSP-specific patch out of the way, hence I am including it here.
>>
>> I also have added a patch for bitfield macro which constructs a bitfield struct
>> given its storage type. This is used in a later GSP interrupt patch in the
>> series to read from one register and write to another.
> 
> So IIUC, this series contains the following:
> 
> 1. Add PRAMIN support,
> 2. Add Page mapping support, albeit this is unexercised until we have a
>    user (e.g. buddy allocator),
> 3. Add Falcon interrupt support,
> 4. Add missing bitfield functionality, albeit not used yet,
> 5. Various documentation patches.
> 
> This is a bit confusing, as there is close to no logical relationship or
> dependency between these patches. I see potential for several different
> submissions here:
> 
> - The core documentation fix, as Miguel pointed out, since it should be
>   merged into the rust tree and not nova-core.
> - The bitfield patch is a useful addition and should be sent separately.
> - PRAMIN/Page mapping should come with code that exercices them, so
>   think they belong as the first patches of a series that ends with
>   basic memory allocation capabilities. But feel free to send a RFC if
>   you want early feedback.

Ah, so if we go with that - the mm patches here (Pramin and page structures
types) will then have to wait till we have DRM buddy bindings or a DRM buddy
written in rust (the latter of which I already have). That would be unfortunate
because it will take more time up in the future to rebase. But RFC is a good
idea too for just getting an advance review. I think we need to carefully choose
RFC versus merging small (even if unused) patches (more below).

> - The falcon interrupts patch does not seem to be used by the last two
>   patches? I guess it belongs to the series that will add support for
>   the interrupt controller.
No, it is independent. Yes this leads up to the interrupt handing feature, but
just to emphasize a bit, the motivation was to "get small patches" in so that we
don't need to do obvious things later (example, the VFN interrupt module is much
more complex than this GSP patch yet both are needed for interrupt handling, so
the GSP patch is a good candidate IMO for upstreaming in the next merge window).
Having small patches merged reduces future burden on both reviewers and the
developers. This is also not something new, for instance we don't have any users
of the PCI MSI IRQ allocation bindings in rust/, yet we merged those. I think
that is reasonable. RFC should be used too when it makes sense, but I think we
should also look into merging things in chunks to avoid future review/rebase
burden. There isn't one rule that fits all is my point, right? I mean just look
at the attempted bitfield move too, Nova is the only user yet we will move it
out. But one may ask why move it out until there are other users? It has to be
on a case-by-case basis..

> - Other documentation patches belong to the series that introduces the
>   feature they document.
Agreed with the splitting suggestions, I will split this series moving forward.
But I may still push for merging small patches where it makes sense, if that's
Ok with everyone.

(I do feel the PRAMIN and GSP patch both do fall under the 'small patch' category)

thanks,

 - Joel

