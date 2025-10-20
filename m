Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E324BEF6A8
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 08:09:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1FA910E25A;
	Mon, 20 Oct 2025 06:09:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qJkO066B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011012.outbound.protection.outlook.com [52.101.57.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F061610E25A;
 Mon, 20 Oct 2025 06:09:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eK0lzIqmLrZ15CFh92sBEEIu0Zb8tn7QUi4Ydi4aVwKiEZOGpKGwulOX+0ZiKHGcuG5V3xVFPn5HwO4suOva5DB0OrGplr/w9G60TjaWWp+SYtGN0PlXWOMDt4/Zs7swkbBoDye8yYA1ipCzaBlQP0nGUMODUvw1BMiKDBIiya7MA+yp2CK5uD5i6elOx3+kRfL874ab1+ms87C8gruQr8F+36Sdyc/hm7/v07G2vsVwE+ul9tzZ3SfD9R63dXZiWRXxE7MxX4Hv8TGBYw0IDLham8bABH43OXHCtGSpE8He2Uo9c+rbn5442YKHzXxc/ySdShW6LtHIlPXBsFDOTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HU8zL3ZA9dbxldPP2sPQHRnSrt6XyB8e+TOrk0IyD5E=;
 b=PqMd/18mqZjeUa8G/adUy7Vwjpt4XdZ1OG06cAXpuWibsUEHv3E53GcQecI01j5ozD+6RZW6uqKDZbTulUtoW8GL4M3Sde+dc5UzyB9Y0BWQzRZ6wjGBUzvWTBHtCnhAKwiDvBDS9zFJrhpdDmIqAUwg+mjUxSSOjuw1wsILTy9dtPfs2ZzwZ0m1UByVc8GBOHRgN03gb2MtKAXUkXOQ7rZc7E6dBUm7rU7VeT1SEEdtqXmCDjCMLmoPsqi1E45stco1BGDt6CKLggJsyl/ihbNTbciH4NO4vvMlPb0+1QTtIP153IgozUcQuNbcYYGFNzb01ghGItEN3WxNFQA2gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HU8zL3ZA9dbxldPP2sPQHRnSrt6XyB8e+TOrk0IyD5E=;
 b=qJkO066BBMPP/PP/dbA4rYz95Hq2rhBTaGi5ShXVcsqXXhq4PowYcmTMhbxcQFh4XCppDOlNBjFlmo8KzlIvC3EBMUOp3fmoux7pULv5JkLC0ZePIgR3iAmnmxfLxREu+OyvrceTH4beOUv8ox6YTikvpa7n993DQK+YE+53+FaSKAYGOKb1xGCuVSluJouXsbVCMNHTVxC13FOPwNjMYxMXleVMNGTy+8+R7xF9HABiJsL7mAzlnbBeip+vPsDnrpxkrdV5JYMdgFWCG0+3+VgEPahX2nfnrt8++Qkli424txdAYfcOvQflBuAayX3RplTZ1qSFhne2z8DTZqUF0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6666.namprd12.prod.outlook.com (2603:10b6:510:1a8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 06:09:30 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 06:09:30 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 20 Oct 2025 15:09:25 +0900
Subject: [PATCH] gpu: nova-core: replace wait_on with kernel equivalents
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-nova_wait_on-v1-1-2eb87fb38d14@nvidia.com>
X-B4-Tracking: v=1; b=H4sIABTS9WgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAyMD3bz8ssT48sTMkvj8PN0k0yRLc1MLS5PEJBMloJaCotS0zAqwcdG
 xtbUAZimIc14AAAA=
X-Change-ID: 20251020-nova_wait_on-b5b975894ab4
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Alice Ryhl <aliceryhl@google.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: OSTP286CA0046.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:217::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6666:EE_
X-MS-Office365-Filtering-Correlation-Id: e7820d4a-f0bb-4a3d-42a5-08de0f9f3b75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|10070799003|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZUtqT1FhbmI0LzJiaitvL0x1SzZ0eFc1UXZZL2xYWTNoN0MxVGsvenNjMVZ0?=
 =?utf-8?B?SFJiZ0w4djVMTWIyY1dXUnR1c0wvcEUxU3doeFRaQmhGN0IrYW5HZDZmVFlV?=
 =?utf-8?B?Ullpa1JURVpvcU8vb2lJWGtiQWxoM2p0VlJsUDdaSlM2YjFpVUt5WVgydWU5?=
 =?utf-8?B?YWgvQzlCQWpvQW84ellCVlZNWnNnQ2k3RTh3U2tucGxZbUlhTzdiWUczM0Jv?=
 =?utf-8?B?MWRxZ01pa3NTN285VE9LWXRxdmUrWlZ5dWovR25zUHlJcVZjWFhqWEZ4WUFV?=
 =?utf-8?B?TDdHN2dxOU9OUmgyNnVzekNLWTBVMGVsVDgwaVZublg5bkJZZVlwOE9RVjVF?=
 =?utf-8?B?d0UwL2FnL3lrMXNQUEdBV3JvWnZycjBMSTFVSmg5UHNuUnpRMkY5YThPOUpS?=
 =?utf-8?B?aVJvUzNUS2JlWkdPLzBzb0xuTW9GS09FblBJMDBwekE3VzJnM1N0cmE5K05x?=
 =?utf-8?B?dWdHRnpnVzlVZWVhZHNFN3VWTldYZUlUbTBmWFFaYTQxQW9Wa0tSSmk4THRx?=
 =?utf-8?B?UmIrQUJxRnVlMUdPWkZseDVGVUI3UXh1dnRXNzZIWXZyWG5MRUxZQldiMG1t?=
 =?utf-8?B?bUhrbmpuVEVtaGxVK215K2xvTFUwdC9PbC92V3pJeURrTk1zdFpRTU5ialhB?=
 =?utf-8?B?NmRNcnltLytnZU5iaDRCUDg1TUxLWlhOUXhtOU4zaE13cWlFcm50SlEzalhu?=
 =?utf-8?B?RUlWejhiWDEzcDkrN3c3YUFzekxVcGRxenVUZUJCOHBPZlM5a0VVQzRXVFpj?=
 =?utf-8?B?T1k3N2NyaUpKa1dGa1BNcGIrdUEwWDBGN0Jla1VSN3hIK3JOVzVjWkxGR0kr?=
 =?utf-8?B?azNzUnBiakdpWXlhR05iaXBBUDNzMEY5MWJ0WXlLcVZCVHVXeFRwM253aGZR?=
 =?utf-8?B?NGFFcngwcys2bnZlaDZDTEpRYXBpUHVma1lNM3Q4TExCSnFWak5TRHlXTTBD?=
 =?utf-8?B?Z25VcW1wald2QmQ3bmttbG9ISDVVY3Z2YzBGOEJyNSs2aFo1MlpkSUZFcW8x?=
 =?utf-8?B?aFUxQXZYV1lid2Z3RGZYdXg3aDUwcllxVjNKYUg4Tm1NZFQyUEp0NFdHUjd0?=
 =?utf-8?B?NmZsUnJ6QTRxSUFkdGxXWFd3ckFhQXFXbnNqYWlRV203enJMaTVQZUNLYTFz?=
 =?utf-8?B?SE81a0hBOEJRcW1TZEErRTdlWFF2U0lzcTNIaWFiN0JHUHdaUjNZSG5RZU9U?=
 =?utf-8?B?YThXTTNYb2JTR0FmZ1duRmdpWU03NmxtdzdTR3dyQVArTDQ0T2FQVGpkUm4z?=
 =?utf-8?B?SUdrWFl6RjVNUlFPaksvNHk4QUs2WmRCSURFT0U1SGxQdTVuU09YRWQrdERs?=
 =?utf-8?B?dDEwUGlZMXFUL2xsekV4VitYS1BRKzM3ZG5xcVFEbzRsMEtpN0VWWGJoVHo5?=
 =?utf-8?B?MnNEYUZpVnBqR3Z3N2xzS1g4TEUwelhKdXpDRkY3QmNPWENhVXoyc29xY0R0?=
 =?utf-8?B?bExCK2d1dkJMMHZKT0pwYVpJelFsYnhIVE9SY295TmdHL1NLcEhPTlI3RllB?=
 =?utf-8?B?WEJ6WUxNY3VLWHlBN0JCYytkcUI0Nm9yWEtydi8rU2RXVDg4NVZ5V0RSL2Iz?=
 =?utf-8?B?YVgxdFJHVnFEZmFyVXVXRlR5Y3JndklDNitabXhuUHhUREhNNExLUEQwVjFT?=
 =?utf-8?B?K05OMHFVL0FoaWZRRnFyVmJXV3g4L3N1UWxGUlRtdFhnVVVMUGxhUzJNZm1s?=
 =?utf-8?B?QWpZUkNvay9sUVJiV3NFanZQb1duM29BaEUvaXdsS01hNW9OTkw4M04rR3dw?=
 =?utf-8?B?MGRxUlZLcldIeDZSamhIS3lDaVhYRWN2bmYrS2dldEVCUHhPeVZzL2N5NmZ3?=
 =?utf-8?B?WnBHK1hsTHdoZWp5VTlDM0lnNXUwUVhRZTZMQWhPL0ZDTy9jd0c0VThDUlBz?=
 =?utf-8?B?SE1WdW93N01UYlVsYmNLa2ZGNlNGc21qMkxYd1FjWnpub3J0MHEvaFgrYlcx?=
 =?utf-8?B?eERYd3ZsN3VGTWsveEVRQzMybFhMU1M5L21JdElqSndDWnZtVXhkS3c4REph?=
 =?utf-8?B?Vk1UemZXMzlLdVNEcTV1ZlA0dnRudnRUUzRtYUMveWszOU9KSTY4RU9uM0Vy?=
 =?utf-8?Q?Z3+ZE+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(10070799003)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFgvbHk3dGFteHJwSmM4SVFKbitva3luVkZ4d1ZNZTJLY1FRZnFFWGtNNFVt?=
 =?utf-8?B?Rko0YWZYWUI4Zm40QURTaGFPQjdpaEpFUkFkR1hHMVRkR1RTeEcyb09VWG1n?=
 =?utf-8?B?bEpKL2QyRDRXVkRCaEpBOW5GSUY3Wm9UM09NUjBwS0pSbXpqQWRrcEFTWmNQ?=
 =?utf-8?B?ajlGMGFJNFJRK0xqUU52QWNEYUppUTY3RW5TdGFiZml6NEQ3MVV6UWlPelRq?=
 =?utf-8?B?NkpINDFENHZrWXB3WEZ2Q0Z2S0NjZnhSVVI1S242UGNVaExLM3lpQlRoaC9Q?=
 =?utf-8?B?ekhwckJTQ0xWTERCVkRwdkZzNmpiSzJaTEtUVjdzNHIzU1IvRWJjbThRZFBj?=
 =?utf-8?B?VXNwYitEQ0d5c2c0Sk5SUGZ1RnZVNVFyOEpHVmJ4ekowNWc1bGU5UkI2ZUVw?=
 =?utf-8?B?NEpzVFRzOXlKVE9OemRRZExRUmY3dkJlOTFPc1FqUTJNLzRFMlFhSFRHTHdK?=
 =?utf-8?B?MGJFSTlleHArcGcveHFXUndUeFRmdElEeGpUeHNqRXBzdmRqSXhXa1A5aEQ4?=
 =?utf-8?B?VnZVaHdKamNydEpZU1YvQitNZWYvQmM3MThVZDJJeDZ5UlRoK0g4T1B6RVZH?=
 =?utf-8?B?bm9QbTJQd3B4UVM1MjJFMGhFb3ZMaFFGYkJyT1JrV2hpK0g3TjIySzQ5ZTVT?=
 =?utf-8?B?TlNCV3V6c3VXTHF2RVNDZHkwS0poWDJ0dUZQdUhhQXJ3ZzZoWmlVQ25FYUc3?=
 =?utf-8?B?eklQNDNseGZLM1dJeGFpQVZYaUJISGxDQ05zWUlISnRtRjhpVkVQTjRTUUhp?=
 =?utf-8?B?TStyK0JoZlFMWnU3QmZjbzR3WVZLeUNHTXM2UkJuTk04OXQ2OExJb1p1VWxw?=
 =?utf-8?B?bnlLQi90QUdKeWh2ellxMFFwckVlNzllelh3TmFXQ1NkZlZsTVlpY0xuSVBF?=
 =?utf-8?B?MjJGZ0NBbjRKODg2a1F3WXAxdU15eklaQjNRTGdWU0cvZmk0ZEtINGt3c3B3?=
 =?utf-8?B?aUppT3lTc3NYOWlWM3dIVVBIcU54VWtVakR4aThrVFA4N0pvaVZaQ0wxRDhM?=
 =?utf-8?B?VTdGUytMQ0w0RUpOL3RNU2lOREkrbEswZko0QXluZ0FHZXA4SUNwWFZuYkwr?=
 =?utf-8?B?bkhLdWsxdFExeTV0L3lVSDVXWjhEWTgrVWlyVldGcGQ2a3dlWmt3b3BYZThL?=
 =?utf-8?B?U2toTkxDNG5obTNLZFVLZ3JORmRON21YVUUvSnFyZXNsVnA4UnVmLy9NSTlD?=
 =?utf-8?B?UWR6N1UyeEcxK2x3NUlHU0FTTzh1V01MbXl6cUo2RncwcTErZWZDTVc3ZS8r?=
 =?utf-8?B?K0lFWjdJNDhWb3BJNUJrYlAxUlh5V3VJeXM1dU9QRlpOR3E0cEgrcXRTNm1C?=
 =?utf-8?B?YmRrREt3M1lWK0o1UHMvWEQ4UUZFUDJlWmE2Q0JKaVluejZDb3NlRDNBUDlB?=
 =?utf-8?B?QittYmJhMkNDZkZYWUZTTk00SkM1cXFvc3lMdXJmcGlKRmMzdEtFbzVSWFVl?=
 =?utf-8?B?S3U0OHovUzJ1K0VZU09MQmthbXF5Yzl3STVPcjd0MUVuaEJ6RVQxeGk1dDIy?=
 =?utf-8?B?QUxoQnBSZ2hEODB3eFlxc25FQnJBamk5dkJWZUc1eFlCazJCWGJsdVRpV2tr?=
 =?utf-8?B?ZElhUzJnaEl0VkVISTBwRmRtN29aS3ZpdjVhQm9pV0xFRzlKdEVhampJalo4?=
 =?utf-8?B?djRic0liTWRrdGFIdjhRclBHRGNvREZrSHk4SHg0bjdzQS80SUdQdW1GVFYz?=
 =?utf-8?B?OVZMWW1uR2lKZnY0L2hPajdFWWhVdFdlNjBJYWFvbDU2b25Pb21uYWhSUCtq?=
 =?utf-8?B?anNkSWNocDJXcXRTVm9lMURtSkdaYy9WK2I3RkVCOUFsd05kTFBLTjFscFNP?=
 =?utf-8?B?dlZEUVAybzQvdWdka1hTN2tzT2RMN2paL1hGWTVqVHEvUmk1aFlVdWtwZW5E?=
 =?utf-8?B?My9xSFdvdURaeno0YW9zcVJHVHBDeCttRVFuc3RCbStlU3hwVWtDTjE1U1pZ?=
 =?utf-8?B?VHRlVUU3ZVNhNHkxTmUwRGZTQnRaMVdQd1JHWDRmazFXQ2JJelZJcnpQbkxY?=
 =?utf-8?B?S0o2SmtPQ0k5RC84WWxqWHE2TnJaT284SGFLOVFqc1BwSXdVRzhJSmNRaTVP?=
 =?utf-8?B?Q1duZUZiWUJ1bkJUTCtwd3hnbWZpc2tNc2lCVS9ycDJ0d2FhYlZxZU4zNVZQ?=
 =?utf-8?B?aitKVUNJNmxWV3h0MXBRMDd6Q1pkQWMwbS9xcmU0bFU1NVNLMVJGRHZDa3VN?=
 =?utf-8?Q?0u/UWf+/WpJyuBi3lFL96gmEXZ5u6ONTMXGeLZO5F6K9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7820d4a-f0bb-4a3d-42a5-08de0f9f3b75
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 06:09:30.7111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X5vqE7UEGWPr/v0ZKp9WjeqTKpYdSBH1OMJAmRKRMb8hKVD1uE18UO+O/Ujkt7QeVssrcxCgYOhT972HhVsJ/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6666
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

wait_on was a temporary helper function waiting for a kernel crate
equivalent.

Now that read_poll_timeout and fsleep are available, use them and remove
wait_on.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 Documentation/gpu/nova/core/todo.rst      | 11 ------
 drivers/gpu/nova-core/falcon.rs           | 62 ++++++++++++++-----------------
 drivers/gpu/nova-core/falcon/hal/ga102.rs | 16 ++++----
 drivers/gpu/nova-core/gfw.rs              | 36 ++++++++----------
 drivers/gpu/nova-core/nova_core.rs        |  1 -
 drivers/gpu/nova-core/util.rs             | 27 --------------
 6 files changed, 51 insertions(+), 102 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index 0972cb905f7a..c55c7bedbfdf 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -153,17 +153,6 @@ A `num` core kernel module is being designed to provide these operations.
 | Complexity: Intermediate
 | Contact: Alexandre Courbot
 
-Delay / Sleep abstractions [DLAY]
----------------------------------
-
-Rust abstractions for the kernel's delay() and sleep() functions.
-
-FUJITA Tomonori plans to work on abstractions for read_poll_timeout_atomic()
-(and friends) [1].
-
-| Complexity: Beginner
-| Link: https://lore.kernel.org/netdev/20250228.080550.354359820929821928.fujita.tomonori@gmail.com/ [1]
-
 IRQ abstractions
 ----------------
 
diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 37e6298195e4..05856b43b51c 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -6,8 +6,10 @@
 use hal::FalconHal;
 use kernel::device;
 use kernel::dma::DmaAddress;
+use kernel::io::poll::read_poll_timeout;
 use kernel::prelude::*;
 use kernel::sync::aref::ARef;
+use kernel::time::delay::fsleep;
 use kernel::time::Delta;
 
 use crate::dma::DmaObject;
@@ -15,7 +17,6 @@
 use crate::gpu::Chipset;
 use crate::regs;
 use crate::regs::macros::RegisterBase;
-use crate::util;
 
 pub(crate) mod gsp;
 mod hal;
@@ -380,13 +381,13 @@ pub(crate) fn new(
     /// Wait for memory scrubbing to complete.
     fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result {
         // TIMEOUT: memory scrubbing should complete in less than 20ms.
-        util::wait_on(Delta::from_millis(20), || {
-            if regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID).mem_scrubbing_done() {
-                Some(())
-            } else {
-                None
-            }
-        })
+        read_poll_timeout(
+            || Ok(regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID)),
+            |r| r.mem_scrubbing_done(),
+            Delta::ZERO,
+            Delta::from_millis(20),
+        )
+        .map(|_| ())
     }
 
     /// Reset the falcon engine.
@@ -395,20 +396,17 @@ fn reset_eng(&self, bar: &Bar0) -> Result {
 
         // According to OpenRM's `kflcnPreResetWait_GA102` documentation, HW sometimes does not set
         // RESET_READY so a non-failing timeout is used.
-        let _ = util::wait_on(Delta::from_micros(150), || {
-            let r = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID);
-            if r.reset_ready() {
-                Some(())
-            } else {
-                None
-            }
-        });
+        let _ = read_poll_timeout(
+            || Ok(regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID)),
+            |r| r.reset_ready(),
+            Delta::ZERO,
+            Delta::from_micros(150),
+        );
 
         regs::NV_PFALCON_FALCON_ENGINE::alter(bar, &E::ID, |v| v.set_reset(true));
 
-        // TODO[DLAY]: replace with udelay() or equivalent once available.
         // TIMEOUT: falcon engine should not take more than 10us to reset.
-        let _: Result = util::wait_on(Delta::from_micros(10), || None);
+        fsleep(Delta::from_micros(10));
 
         regs::NV_PFALCON_FALCON_ENGINE::alter(bar, &E::ID, |v| v.set_reset(false));
 
@@ -512,14 +510,12 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
             // Wait for the transfer to complete.
             // TIMEOUT: arbitrarily large value, no DMA transfer to the falcon's small memories
             // should ever take that long.
-            util::wait_on(Delta::from_secs(2), || {
-                let r = regs::NV_PFALCON_FALCON_DMATRFCMD::read(bar, &E::ID);
-                if r.idle() {
-                    Some(())
-                } else {
-                    None
-                }
-            })?;
+            read_poll_timeout(
+                || Ok(regs::NV_PFALCON_FALCON_DMATRFCMD::read(bar, &E::ID)),
+                |r| r.idle(),
+                Delta::ZERO,
+                Delta::from_secs(2),
+            )?;
         }
 
         Ok(())
@@ -582,14 +578,12 @@ pub(crate) fn boot(
         }
 
         // TIMEOUT: arbitrarily large value, firmwares should complete in less than 2 seconds.
-        util::wait_on(Delta::from_secs(2), || {
-            let r = regs::NV_PFALCON_FALCON_CPUCTL::read(bar, &E::ID);
-            if r.halted() {
-                Some(())
-            } else {
-                None
-            }
-        })?;
+        read_poll_timeout(
+            || Ok(regs::NV_PFALCON_FALCON_CPUCTL::read(bar, &E::ID)),
+            |r| r.halted(),
+            Delta::ZERO,
+            Delta::from_secs(2),
+        )?;
 
         let (mbox0, mbox1) = (
             regs::NV_PFALCON_FALCON_MAILBOX0::read(bar, &E::ID).value(),
diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
index 0b1cbe7853b3..f2ae9537321d 100644
--- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -3,6 +3,7 @@
 use core::marker::PhantomData;
 
 use kernel::device;
+use kernel::io::poll::read_poll_timeout;
 use kernel::prelude::*;
 use kernel::time::Delta;
 
@@ -11,7 +12,6 @@
     Falcon, FalconBromParams, FalconEngine, FalconModSelAlgo, PeregrineCoreSelect,
 };
 use crate::regs;
-use crate::util;
 
 use super::FalconHal;
 
@@ -23,14 +23,12 @@ fn select_core_ga102<E: FalconEngine>(bar: &Bar0) -> Result {
             .write(bar, &E::ID);
 
         // TIMEOUT: falcon core should take less than 10ms to report being enabled.
-        util::wait_on(Delta::from_millis(10), || {
-            let r = regs::NV_PRISCV_RISCV_BCR_CTRL::read(bar, &E::ID);
-            if r.valid() {
-                Some(())
-            } else {
-                None
-            }
-        })?;
+        read_poll_timeout(
+            || Ok(regs::NV_PRISCV_RISCV_BCR_CTRL::read(bar, &E::ID)),
+            |r| r.valid(),
+            Delta::ZERO,
+            Delta::from_millis(10),
+        )?;
     }
 
     Ok(())
diff --git a/drivers/gpu/nova-core/gfw.rs b/drivers/gpu/nova-core/gfw.rs
index 8ac1ed187199..23c28c2a3793 100644
--- a/drivers/gpu/nova-core/gfw.rs
+++ b/drivers/gpu/nova-core/gfw.rs
@@ -18,13 +18,12 @@
 //!
 //! Note that the devinit sequence also needs to run during suspend/resume.
 
-use kernel::bindings;
+use kernel::io::poll::read_poll_timeout;
 use kernel::prelude::*;
 use kernel::time::Delta;
 
 use crate::driver::Bar0;
 use crate::regs;
-use crate::util;
 
 /// Wait for the `GFW` (GPU firmware) boot completion signal (`GFW_BOOT`), or a 4 seconds timeout.
 ///
@@ -50,22 +49,19 @@ pub(crate) fn wait_gfw_boot_completion(bar: &Bar0) -> Result {
     //
     // TIMEOUT: arbitrarily large value. GFW starts running immediately after the GPU is put out of
     // reset, and should complete in less time than that.
-    util::wait_on(Delta::from_secs(4), || {
-        // Check that FWSEC has lowered its protection level before reading the GFW_BOOT status.
-        let gfw_booted = regs::NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK::read(bar)
-            .read_protection_level0()
-            && regs::NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_0_GFW_BOOT::read(bar).completed();
-
-        if gfw_booted {
-            Some(())
-        } else {
-            // TODO[DLAY]: replace with [1] once it merges.
-            // [1] https://lore.kernel.org/rust-for-linux/20250423192857.199712-6-fujita.tomonori@gmail.com/
-            //
-            // SAFETY: `msleep()` is safe to call with any parameter.
-            unsafe { bindings::msleep(1) };
-
-            None
-        }
-    })
+    read_poll_timeout(
+        || {
+            Ok(
+                // Check that FWSEC has lowered its protection level before reading the GFW_BOOT
+                // status.
+                regs::NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK::read(bar)
+                    .read_protection_level0()
+                    && regs::NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_0_GFW_BOOT::read(bar).completed(),
+            )
+        },
+        |&gfw_booted| gfw_booted,
+        Delta::from_millis(1),
+        Delta::from_secs(4),
+    )
+    .map(|_| ())
 }
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index fffcaee2249f..db062e31a5e2 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -11,7 +11,6 @@
 mod gpu;
 mod gsp;
 mod regs;
-mod util;
 mod vbios;
 
 pub(crate) const MODULE_NAME: &kernel::str::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.rs
deleted file mode 100644
index bf35f00cb732..000000000000
--- a/drivers/gpu/nova-core/util.rs
+++ /dev/null
@@ -1,27 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-use kernel::prelude::*;
-use kernel::time::{Delta, Instant, Monotonic};
-
-/// Wait until `cond` is true or `timeout` elapsed.
-///
-/// When `cond` evaluates to `Some`, its return value is returned.
-///
-/// `Err(ETIMEDOUT)` is returned if `timeout` has been reached without `cond` evaluating to
-/// `Some`.
-///
-/// TODO[DLAY]: replace with `read_poll_timeout` once it is available.
-/// (https://lore.kernel.org/lkml/20250220070611.214262-8-fujita.tomonori@gmail.com/)
-pub(crate) fn wait_on<R, F: Fn() -> Option<R>>(timeout: Delta, cond: F) -> Result<R> {
-    let start_time = Instant::<Monotonic>::now();
-
-    loop {
-        if let Some(ret) = cond() {
-            return Ok(ret);
-        }
-
-        if start_time.elapsed().as_nanos() > timeout.as_nanos() {
-            return Err(ETIMEDOUT);
-        }
-    }
-}

---
base-commit: 1d5cffebd930d61588c32198f85fbe541ab97b8f
change-id: 20251020-nova_wait_on-b5b975894ab4

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

