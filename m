Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 171A5CCE2EF
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 02:48:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C13310EC57;
	Fri, 19 Dec 2025 01:48:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rUcBP/tH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010023.outbound.protection.outlook.com [52.101.85.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF2810EC57;
 Fri, 19 Dec 2025 01:48:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ONYiKKXYztekgTlrb/Uh7EfOtP0Gjt+pQLhdeNvQlXgQBqZZG+C15vk5Ziph2YlAVpJW7Scpd56xL2sGBq2xoFaZdsSvotTgQy7+0ZZjTLngxFRb7cwteMvXyxg02h/Jg7Oxb2bhN4XpkHw4/GO3mEMG0J+PlEE3IKIoRGTuoOwYLMj8yesXjRqSSV8dy8wqdr2y+5V2jgv08Qxt+8wqUv/GO+KSNr3tfxQhvIj6xN2rJ61UUp/Fqr3ihIb5UwfQfH39HEeS8RNXrW0FzpbrzdEhJ+o3bHqb7dsnY7LBJO1lPbc61ypVsQwuLHUGQ4Js4xCk4p/c6w1AvbFThh5yng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AxAkija4PwjxNcY4UtgJkvyRkYJoRAuVlLgFPZJ4Wi0=;
 b=Z9Snq51oSokCydTnSHeFau/vDfnaudHzZrbkdtmiCi/L3nlYQARfnNmaCmZcrOtkBh5Rllch5eEcJ0OfTCwXCesG5x2Xott+/A6JHHOZGL1YGCZWVlXYWhWhHoIKLlf6v19xLfGtXXwrjYyl36y1yWX3898RpbvIiWLk81GEocCsBWUkw+5kVt3JNAJnd/464VCqKvp6Q3uKCkLYAz9x8mAVl3fgtAuUO0GcCa372cHM1rbUPVIC139lFrZmiy+NtpulH2Rj1kwU6586HBDUl/MPHKHF6/cRh1Swkd+Kz+EnuE7SF5z3CKCXKR0SwKexyulquUWR3+RP9VRt1OYJ7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AxAkija4PwjxNcY4UtgJkvyRkYJoRAuVlLgFPZJ4Wi0=;
 b=rUcBP/tHXLWBZx6x4jBxupEmwuaoKVmMqONRs01L59EG5nyrSQ/bkTlt2Q0ubnFcRnHY8LfjGMv8lZm5XfwZYbcWM4rOllxnIosnj8tjnpTIKgNlt1VwThHTJig+gr8+jDIoyJAeYqc+Keg21T+xBTO9S7EAGz5cc08fqFkHulPfpt8lJiUR+OlmycRMnvlOsxLLFUoHF6asK7W/5MEQKuDh5RHkSC02Nn666p+/V3+U1tT5x0uxKfcL3kqlHH0yuOvLUZFRY4qFW+N2OdvYVtA1oblZUsPeKbDl/6AqrQI4VfAqBcH8noEdTUxujDDDunjTUPtuwn9O5y9rtvj0kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MW4PR12MB7189.namprd12.prod.outlook.com (2603:10b6:303:224::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 01:48:35 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 01:48:35 +0000
Message-ID: <0614d2ab-5e0b-4a0b-8347-9bb3339634c0@nvidia.com>
Date: Thu, 18 Dec 2025 20:48:33 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] gpu: nova-core: send UNLOADING_GUEST_DRIVER GSP
 command GSP upon unloading
From: Joel Fernandes <joelagnelf@nvidia.com>
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
 <7ef64473-cad7-4618-8f30-be3d5308443e@nvidia.com>
Content-Language: en-US
In-Reply-To: <7ef64473-cad7-4618-8f30-be3d5308443e@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:208:36e::9) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MW4PR12MB7189:EE_
X-MS-Office365-Filtering-Correlation-Id: 7527dd77-77f2-4b15-8240-08de3ea0b8c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0dwNlZrdkZJcmFVdFJxNWV6ek5WVis0ckVuUW9RLzBQVjFJWHltNEY3NmVB?=
 =?utf-8?B?RzNjSjNGeE5kUGMzUnZQL3IxdUlLM3AvL3BsSmJReHV5REJnbTZWU3FDMVc4?=
 =?utf-8?B?d0VNSXgzYVREdFplYy8vZ3NMeWJmLzdUVFU2MWFQSDM4cnFWUWtRYUJUbFly?=
 =?utf-8?B?YVJtYWwzNHV4Q2lSOTh6c09HZy9OWUxmTDN1SVBMcXN1a0FEQkpZQnZuUEFC?=
 =?utf-8?B?UVZ6dXR0UkUzcVFDMGpBcWIrY0FMRUtkU0RBY2RsNHFaczZ2TDFObmdxMjVR?=
 =?utf-8?B?eVVOMTVRbDJFRUVZejZxV3pueG8xc0xwL2lTT1dYbWJCdTQvV2FMNmpZV0tk?=
 =?utf-8?B?T2Q3VVdMdTBYQmErTjcvbngrREo5dFZkbGtWM2lqTkVzTkdFUDNsNWVxVnIz?=
 =?utf-8?B?ZzJmOFBZcmwzbUIrcFJLdERDbEQ4aUpDVm03ZWhYRnJ2ZndiWFVhUVpYUFQ0?=
 =?utf-8?B?aTB3Wk16Sm9aV3ZlWGZVdzFlRWs1V3lVVHV1M2ZNdks5RDdXckJEWHZpbmVt?=
 =?utf-8?B?cGZkc3duZ2tGNEVQWS9sUzY5dzFReXoyRTluZWNTaG9wU2R2aExuS1hGMWs1?=
 =?utf-8?B?elN4VjRNa1RpbGg5cHVPaUZKOGRsYi9zSUZuMXZMcnlaOU9BZDZ2bXhvcGhi?=
 =?utf-8?B?UzArUmsrbHVscDdmYWZxVFNwdVhHbUZlYTNsLytZWldNeWJXWmJ5QkM4WUNI?=
 =?utf-8?B?NGZLYms0Z1AxdHczT0c5cHhCWDRjZ1VNQTQra0tqYzMrY01IMVMxVUNhTU5a?=
 =?utf-8?B?eTN3QVdsOEdSaEFJUUQ2VkIrL0t1MDNiVi9pVWFkQ0UzcUlJRGdiVCtpYlh0?=
 =?utf-8?B?VFFlUDlpK3lQMU5VZWw1ZXErYkoyZ3I5MFY5NW1GR1ByMFNSbXFHUmFsSkc3?=
 =?utf-8?B?Nkk5RVhxUC9vV0hMaFU5SW43QWtDczdlN3J5dWxGVVBBRXZMUmVhQjh5QzVt?=
 =?utf-8?B?VWc3VTFHaUZWRWRKT1pMY2F6R0YxV1d0Q3VtMjAvRUVaeDFvYm1mZUNpdkNI?=
 =?utf-8?B?amJ5d0ZjSHJKVDVLL2F5cE1FTTM4MXlNMEpNU0kzKzR1cWk5Yjg1UWZzZkx6?=
 =?utf-8?B?Q3Fvd1ZRaGNIc2NhN1N1WEg3ekc0V05NeS9HeFlJTTZubFRZZG1IK1pmcGNW?=
 =?utf-8?B?YzVJb28zRnNaNmxXa2I2TERLdzNLLzRlZThWUytFd3ZmRzZzeEpvNWxJQ2FI?=
 =?utf-8?B?dG1hK2ZrVFZsQWRSc2N2Z3lhY3lTQnpnUFRFN0QzTW1OajVOSVNYQmpiTnA2?=
 =?utf-8?B?dlg3RnNhb1dzaTlGQXJEME5Va0hnV29KZUNVcEVUeEVRK1BCU2lSUTV1ZzdP?=
 =?utf-8?B?bUFZVkc0NGdVUTUvZ2ZCdFVHdW1QRk5FKzRRVncwa1AzeisxRThhNzVjaTVv?=
 =?utf-8?B?Uk9IUDBuU1ExeHE4RUFKV2o0NlRKY3RSKzVHcjR2RTVhenVLNm94RG9seFVL?=
 =?utf-8?B?WUlmVlhLL2wrK2tzTWRHeWFWSEE1OFZkQk01QXROY2lBS3g1V29yRnhOOEVX?=
 =?utf-8?B?TVpYZVBCaEtiSmovRzhnZlFUcng3UFdEaytnVmlqZ3VLU3VaUXhtT281QnV2?=
 =?utf-8?B?ZVVocmV2NHc5dFJ3czR5MU8xMW9NZFAwaUR0TkxzdjV5akJCODNWaU1JcWE3?=
 =?utf-8?B?WElnNkN4dE9MUzZkUjJrYVRYd0JDNlhoZEdZSHY0RmxnSFhaM3A3SzkzUzdq?=
 =?utf-8?B?dXFwQ3VVM3lDc1gwdGdLQ2dDcjRjZzE4TGlQMHYrakZvZk41aFpkcWxWWVk5?=
 =?utf-8?B?Mnc1V1FKdlR4M2Y4ejFsMmtKekdLbDB3QmVlYzhEcTZLL3FWQUgwUTVKUy9O?=
 =?utf-8?B?OHplNDRCQUtuazVrYXhLYWlZNnpmYWw1Y0pMZTB2NmlZMzZ6S0ZrUHQwN3RQ?=
 =?utf-8?B?bTRxVkFiQUJXOTBoVzBQWTR5YmZyZ2toUW9qeC9EOERsajJlaEoydGJYVWtO?=
 =?utf-8?Q?2ygU+YXjTBpMJaKfGVKVXYCDc1vTnqtA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDluWDlBZWlNZ2thcFdJVlAzYUVtWmdBaEdFSjZoUnp0NTBkZ0VxdjIrZ0d5?=
 =?utf-8?B?NmJrbDlvajFVTTVRVWVISFJ6Q3FmeHN3TDNyVnF4SVNRNGZlOUR5QXpWY2RY?=
 =?utf-8?B?SERqYXFrRGl1L1Naa2k1Z1pQKzhVa2FzWjFQcE0xU3gzdmE1WDBoelE2bXRH?=
 =?utf-8?B?YVJaMi9UL2JFRzJZbEhIcFBLZEtpNUNWOTJnbVVremsrc1BzOTVaYlhsRmtk?=
 =?utf-8?B?ZEpBbHMzYWR0Q2xrYnp0SzEwOFNpUDdQdldFbFpPelo0L3MzN2IzR2ptdHRC?=
 =?utf-8?B?U1RPdndZV28ycEU2aW1CMHJia0ZBTXBmUHBldVFIR29YNm95Ty81elEvUEQr?=
 =?utf-8?B?MURLUDIzYjNXUll6Rk0rRXBKQ3RlUFR4UkVOQ2dreVdYaTlENW1wR3BiTko0?=
 =?utf-8?B?QjgzdG1IcVZoOTNqQ2l2Ykdub0xkN1laZnAvQlVsMHovUjJDQnF3UjllbUNj?=
 =?utf-8?B?UzRXcmFHLzQ1ZXZaLzRJL3RidFE0VTdUZU5pTTRRY3psMzZCVW5rZ0Y3ek9I?=
 =?utf-8?B?QUtHdWRxY3NHZEpZVlhIZThlZFBlMmdoYWxHOFIxMFR4QjV0YkdzU3BJSVNW?=
 =?utf-8?B?QmRpMUlEK1ZBb3ptcGV0QUdKazNCT3E1dmVUeHQvUFFsNEtwTDczN0xxZTNo?=
 =?utf-8?B?bVFqNVJnOG1STTdCU2NpN3dJQVlkUFppS3lrYUp4TWlCcVEzWm0vTGNmbzBW?=
 =?utf-8?B?cWt3K0pzUFV6bXdEVUIyclhRQUlCYm5zRFhGOEd0M0tSR1hRMnhJbEZiRFVB?=
 =?utf-8?B?NGxlc1hpU21UVHo5R05IUmliZU1IRTFKczRBT1lJbGJldVNOU1V0azdEOTZi?=
 =?utf-8?B?dlpMdkVTdXNiR2EyckptNkNvblpvS1FNL01hVGc1VHBSM0s2aVlrSllTemx1?=
 =?utf-8?B?T2JGTkp1MG9UQmxjRkthV0toZ2VZeCtvWThTcTMxa0plTDA5ODBjN243ek5Y?=
 =?utf-8?B?ZEcwM0RhYjN1V0RzYWxuRlRYekJKSUhMRnZ3QXZrUDA0SzRhZmhEN0VDcVJz?=
 =?utf-8?B?Y1RFZHZZYVhvNndPYS9veXp1TlpmajUzMW9RTnpucVdUZWo5eVdHTDg4elRB?=
 =?utf-8?B?dUd2NWVWVWxKc283MmFJeW83bUdtRHFhQndmSE1odWNGRjZaN0ltK2xTQ0Js?=
 =?utf-8?B?Skw4WFFTR0hLN0ZSQUphdHAyVTBMeDBpd3lYalhLWTNFNmRCS096Wk0vNEh2?=
 =?utf-8?B?VFoyejVvaHIvcDZzMjJaWFNSeGdQbjVpZ0ZPRFNuTDFheXZhRnhhdjZsU2E1?=
 =?utf-8?B?a1kvNmNmUjJZTkU1L1RBZG05SFRoNmxyWUN4K0xMSS8yc0lUaDA4V080Tmc0?=
 =?utf-8?B?V0tLalBYL0JWSUM3Vk1jRW0zYWtLTVhYaTltb1l1K1IrWEpTN08vRHQva012?=
 =?utf-8?B?ZFlPMDBsTTB2cFBYK2l6T0czT1dtRm9EKzk4ZkQ0cWEvZFFoOUo4ak1WNk5l?=
 =?utf-8?B?dldNSE45UkkrVmc0M0tHRDFZVFh3dGhHeFh4aTRIVVUwSjNYbkNOZnpVblc5?=
 =?utf-8?B?SFNBTGlNdnhJbngzbWNNRmMwRzhBVjRQbVVwZ1dCS3U3Q3NlQU9yOC9YU3lo?=
 =?utf-8?B?bTd5aGFzcFRRNlZUSWdmRkZUN1c0alh0dUlEK3J2a0RxTW8ybTFaL0UyakUv?=
 =?utf-8?B?WmxhQWVzVmtTZGFZdXc5WVRyMkhTclErWUtyWTVtS1cvQnlWWU1lclY5N2h3?=
 =?utf-8?B?cVVDSTBYYlgxY2JSdnNnejVPcm4rU0h3Sy9acnFHaXZaWGFNMzV6OTZBQUtl?=
 =?utf-8?B?Y3pCQmdINW1vOVdVOEJ1VDdGeDZNMWlOMlZJOTExenFaTU12OXFBeEZBSXRZ?=
 =?utf-8?B?SlVycVJqclFqRUJNOXc4MGo2OFJSRE1lUXFJMjg3clRsc2MrRW5pdjJhdnNM?=
 =?utf-8?B?MEFYdm1QbEFGd2s4bDZjWFZrNHlKbDVoR0hGOEZXcFRSTkRKdEdGUkF4ZTU4?=
 =?utf-8?B?SHZ5Smx6cmNwaE1kanJkSXpiMWdld2N2eXVORUR3Yzd4elJJbVZRK3FPRloy?=
 =?utf-8?B?ckRSVW8zQVFiTlBRNFh1V3AyYU8yUm8vampnQ0tlRUtGSjl6SGppTXpRaXJn?=
 =?utf-8?B?M01sNmF0a1FCRmMwdFhlcnV1SE1oUllwNCtVd3BGcEZ3M25acVNLM1o5N2Fu?=
 =?utf-8?Q?/bTTReq6pgcYEP7GT2W9HR5mI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7527dd77-77f2-4b15-8240-08de3ea0b8c3
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 01:48:35.1851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yIEvganNLZFqSlEyTbPtwqLlDOrmpowQl4b8/NC5sOujB++jyJlkZqVr67oiBNo//C45pWB7B240vhZeBP7CNA==
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



On 12/18/2025 8:46 PM, Joel Fernandes wrote:
> 
> 
> On 12/18/2025 6:34 PM, Timur Tabi wrote:
>> On Thu, 2025-12-18 at 22:44 +0000, Joel Fernandes wrote:
>>>> Isn't the real problem that we are polling for a specific message, when all message should be
>>>> handled asynchronously as events, like Nouveau does?
>>>>
>>>>           Err(ERANGE) => continue,
>>>>
>>>> This effectively throws out all other messages, including errors and anything else important.
>>>>
>>>
>>> Indeed, for that we need Interrupts. For the rest of the patterns where we need the message
>>> synchronously, we should bound this. Hanging in the driver is unacceptable.
>>
>> It's going to be difficulty to have a running asynchronous message handler in the background *and*
>> poll synchronously for a specific message on occasional.  I would say that even in this case, we
>> should handle the message asynchronously.  So instead of polling on the message queue, we just wait
>> on a semaphore, with a timeout.
> 
> I think we don't strictly need a semaphore for synchronous polling - the wait is
> expected to be short AFAIK and if not we should just error out. What we need is
> a registration mechanism that registers different event types and their
> handlers, and if the message received is not an expected one, we simply call the
> event handler registered while continuing to poll for the message we are
> expecting until it is received: See how Nouveau does it in r535_gsp_msg_recv().
> Anyway, the wait should be expected to be short and if not, we'd break out of
> the loop { }.
> 
> Interestingly, Nouveau inserts 2 micro second sleeps while polling AFAICS. Where
> as OpenRM simply spins without sleeps. I would even say that sleeping in the
> loop is risky due to the dependency on atomic context, so we'd have to be
> careful there (I am guessing all our usecases for these loops are non-atomic
> context?).
> 
> We still need the interrupt handling for cases where we don't need synchronous
> polling. During then, we will directly call the event handlers from
> IRQ->workqueue path. The event handler registration/calling code in both cases
> should be the same.
> 
> So in the loop { }, nova needs something like this:
> 
>   Err(ERANGE) => {
>       // Dispatch to notification
>       dispatch_async_message(msg); // Same ones called by Async handling.
>       continue;
>   }
Btw, I can work on this tomorrow and send out some patches.

