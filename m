Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FFEC8775A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 00:29:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A04C10E073;
	Tue, 25 Nov 2025 23:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iTJKLit2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013048.outbound.protection.outlook.com
 [40.93.196.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3544C10E073;
 Tue, 25 Nov 2025 23:29:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hJ+F+VwYAvUBwMOTDRDMi6DPh3GYU92GHFOhiCGWDhJaYGuqIR18k5jQ4wzSuFB0B4FNRNDAruFUBHO/ThgHTHk/Is0ZGkdAWTWJ3ZmN3h+LJQLcFI1oXuzrF+L0iIi7g4fhCbAc2NYXlXogUzTArWex01BGouhi+2eWhrYNnCG5SP0uXWtk03oiA2vTF3F6ttaN1QVzMbdZKLOZAs2EQIbftb6KJazsKFVpNNT0++KM/9x4FKYZSsLacufwfzhVHu9yL6RaE4NJL0cTiWXQN4k2fMhPHLUi2EH6HjNLcIupKFK9tyoM/BDFd3k+RvuoUAl6/SIB1k+1HgWc8yvOGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZPhC7xWfMfr1sd8nqRsWf/2UMDBG6/QlOayCT4FguKQ=;
 b=AEq7aSLXOMZ0TiDrvquKq6ivkqGGE1CdjajRbbmCWbUdrKa6rNoUtEPUW0yulhdt0u00wRWHZquZvGN4dT3G7GWQBa54NfJo4UihCz3aXxrlBIH322eOHOQGgTsgwPiWJkLd4aMzzC9w7bR5Sn7ZGcR8l2oJWnWClSqj7ogVhb+kY5gYk2HQ2a5Vs6SNkBAnVo4YG2qzDl0FiNcbX9Fk1Jh1T1Sj3qFhVVyhd0UyfkhH6SmHGzkCfY7d8CFS7fJRdHI/na9pOOGO6FyYEFPR6wNKbyPCdPy9nCL0A3t5Gr6uB4v1SykdcWm/U0GTvDgebTv2YX29fD+EvkNZTbBgPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPhC7xWfMfr1sd8nqRsWf/2UMDBG6/QlOayCT4FguKQ=;
 b=iTJKLit28b9EdAHWnY4nywI3NugjjNSi/nOtjDd7ADrf4k//I2Vy71Vo/2796VLhzNJx0cs0+8z4dDoHpwOuS5ks/kFr65B9HCNzUjjeCsWIsn2Nc+wKUHXnUC9skO+62BBmFhH3UGUZ59Qt3DPeq+ShIbLaEeLyNxQVr7t3xpHhZP/jMALZOlVDrABcsagBt4CouJtwiriPk/ksaleRJAuH68Vw6a+2okpQwufbSi7Urm+fTChKsPk6Ck44xRYuLF7eP4tpOoAbOY0ixslflcteQAbfpVuLzwXK3veusD8Snl1+jEdW+C4eLEu+v8fur0HHQSv0QPWcmfkQnA9a5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS2PR12MB9661.namprd12.prod.outlook.com (2603:10b6:8:27b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 23:29:33 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 23:29:32 +0000
Message-ID: <04b9f849-94fc-4bfd-94d7-7337a8cffdf3@nvidia.com>
Date: Tue, 25 Nov 2025 18:29:28 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] rust: clist: Add typed iteration with FromListHead
 trait
To: Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, airlied@gmail.com
Cc: apopple@nvidia.com, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, jhubbard@nvidia.com,
 ttabi@nvidia.com, joel@joelfernandes.org, elle@weathered-steel.dev,
 daniel.almeida@collabora.com, arighi@nvidia.com, phasta@kernel.org,
 nouveau@lists.freedesktop.org,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251111171315.2196103-1-joelagnelf@nvidia.com>
 <20251111171315.2196103-3-joelagnelf@nvidia.com>
 <DEGQCMSX1SGZ.2NQDPG5KUNA9D@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DEGQCMSX1SGZ.2NQDPG5KUNA9D@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL6PEPF0001640E.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:15) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS2PR12MB9661:EE_
X-MS-Office365-Filtering-Correlation-Id: 29e630fa-62e8-443f-5bf4-08de2c7a7cf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bVo1Wi8zOWk2eDF4VTdEZFJ3ME5iK29uQ2NwWmw5bjQ2QXMwTFBaMFdKRm1y?=
 =?utf-8?B?ZnlEL0RueFNJQkw4a3paZi9xdFYyREtlY2FFSmx2TVFLZnVtdEwrcjZsNHV1?=
 =?utf-8?B?cjhjL1FxSkRaVFgzdktoTHV1ZU1aRnFEbEVTZmlReTNRTTljM2oxNUhzMWpq?=
 =?utf-8?B?RW9DeUlNWUtrTUZ4cFBsdThpWGpYdHJqMXVBTmtlVWFENW96QllUTkwveGds?=
 =?utf-8?B?M09nam1QRlZFVlQ2d1IwMCtXVGpVR2lVVndyV1VjK00wV0pHZ1NpZmpXQXhu?=
 =?utf-8?B?M0craGlPKzVFbzh5bDdST1liOVFHUmkxSzFrUjdhM1JxalZhMXJvYTJ2RmZw?=
 =?utf-8?B?ZGF1c1NrSXptM2VERmZ1Ri90WTNIVHZkTzFCVlJHa0R2emluOHZmaDBxRDZu?=
 =?utf-8?B?Y2hwVHVISXhiRUs5eUJvbG55SjNKMmtJS2VkR3krYlk1cHNMZUNoWWhjU1JS?=
 =?utf-8?B?RG5jQVRpR0wzRmh2dkhDcHFTYVZza0lXY2ZTZHhiTGVXcDlBZStEaFc5eWlw?=
 =?utf-8?B?Vmg3NDNLT280VzBWQnVaalE3c3E1NG55SGk0MXQ0cXhxdUNvaXhsRy9wak9w?=
 =?utf-8?B?QTBTeHRzWStwSGdzVUtBa0pDYkllbE9aQXVUMWp5OUQzdHRsSGVXc1BONkVq?=
 =?utf-8?B?ZXNDM3JOVHFDR0lYWjluQUkxNmVMOU5Iby9TSUMwQ05TU3JGUkJ5cTBVYWZX?=
 =?utf-8?B?c3FTYjhmSTMzVXpGSElEYXd4b2ZTdmxNam1xUjcvem9vV1N1ZUFlNWNyb1Fv?=
 =?utf-8?B?NnlYUXVWc2ltem1TNk9qMUdlS1RqTkQzU1Y5ZEFEcHViZGtxUmsySFNaOFFa?=
 =?utf-8?B?RUlrT0xtNzNFTUhKaGYvSUxSVm9Gd2hzWHpkSy9UQm5WOTdmaFd1OEp4TG1K?=
 =?utf-8?B?b0dwYlJtbVBoZEVYZ2N4VHkzTlNxdkdwVi80dkFxM05LOS9RV2hTK2FZS1N6?=
 =?utf-8?B?dWdkK3VBTys4QnBhRmNCSVZSckZVY3M5eDA1SExVN3drZUg0RTJSWUxDblNW?=
 =?utf-8?B?S1QxcG1scHJLR0dsMDNpQnZzeE1WYWovdEx4ZThtS0ZmT0tOWjVWd2c0U0xu?=
 =?utf-8?B?a1cyRTRsU0VicTNsanlBZmFGc1R5aUVSRjhsOUxIWlJCOFNPRW1CS3poU05s?=
 =?utf-8?B?RXp0NkN6N3NPcGVPcmtnUVAyeU5KTUlBdlBIMFIxWGZQY0cwN0VxZDE1RnRo?=
 =?utf-8?B?Y3U4aGFsMjhDSi8xUm9icHRBYmVQTTl1S0RUaUZhelFPb0hXM29UZnVnUi9I?=
 =?utf-8?B?WDJubVVGemZsVHprOHNyNWRQd0pzSWdtbmRyWWZHbE1Wb0hjRHlwYkM4bjR6?=
 =?utf-8?B?VVA5Z2E5VDJiZXI1cVN5ZEhNK3hsazNOUGxkb0ZZV1NWMEFjN2xSZVh6YUJj?=
 =?utf-8?B?VEFJTTZJNHJuODc5U0ZhcjBqVXRMM2wzSUFJVHNEWDBzamxHMWliZDVpL1BM?=
 =?utf-8?B?cjcxSDBaZWY4cmNmdDlBV1ZuM2ZqQUtQTTBPZnRaZFUyMFRhWkhwUHd2Y1Bh?=
 =?utf-8?B?TFBEZnBMYmpoMlN2SWt3VFJzakxnUXBzekhUcnhkMmhoeGpQWGsrN2d0WnJ6?=
 =?utf-8?B?T0poYVNyQkp2OTRoZGE5VzYrUEo1RjRzVHllMzhURFcxanZvY2ZURE8rZEg1?=
 =?utf-8?B?SE9ObEh6Uy9IM0tmVU1vUEQwamZOQkE1T1l6TDROT3FsbXFGRXZjWDJnWHpw?=
 =?utf-8?B?S1FFbEJSTEs3anliQ29SSGx2WWlsaUVMQU1maDVLLzVIRFdQL0REaGV5L3My?=
 =?utf-8?B?S3J1ZVF5TWRHQmtVS3IzNmxCSWgzOE1OOXQ1V2Y3c1RteTV3UnVaMngwSXhr?=
 =?utf-8?B?ZUU1ODBSbUZTVDFCL3AyOXRLeGdZc2VJME42T1YxY2xyOXViRENWckJDOFlR?=
 =?utf-8?B?M09hYTYyR2dlUlR1VEtLTHNkSDNZM3YycGp5NGN6MEx5Vzdoczg4dkVkN1Fi?=
 =?utf-8?Q?J39FSeCnYpcUif/ksmaBetE7ZoHL2EpU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R01zZVovblpSSGowaVkzQzRHVndzSWZobk9jWWtURGtqLzFxdUlNTGhoVDlO?=
 =?utf-8?B?bnE1TWRGcStVSlB6S3d5UG9SWDYzQU1vZ0kzVEIxZkRicEliZDUrQ0RrQVEz?=
 =?utf-8?B?cmZDZE11WEZmeXVBUlZiVStnNTUyaDZwRU9Bakc1aUhhSDhob0VmZlAxVmFt?=
 =?utf-8?B?UjBJOGF2SWZJVk05NUdxQUN5OWhZa1lYVFNPL1lNaFRrd01ZSXJJK1dMWXRN?=
 =?utf-8?B?QVVqbW1GelljUWpaTFRLblJGTXMvWDVNcTV2UUM5OEFYc1laWnVDclc5QmVM?=
 =?utf-8?B?U0RJcjdjWGNTZmJaOVlFVEorUXdxOXVxcUdERlZxRkR3L1daSGo3TituZ0tQ?=
 =?utf-8?B?ZGFDTEZmUSsvOStJazVkMVE3SDZsTzdpQWJDRHpndFRENDlLZWVkMVNNYVYy?=
 =?utf-8?B?bFQzaVNBSEg5YXlDb2h6YVZxWWM0aFVrUnRQUm9GSkxDM25hbllTMFB3TUdq?=
 =?utf-8?B?TUFnMlYwZnJqNXVrTDk2MVhDQVdMNGZoNXkrNjBtOUFwdHQxUGJSTUwzTUJY?=
 =?utf-8?B?dUcwVUFrWUx2QUVPYzNuZ3lpN1JqbnlBK291M1I5V2NqRzVHYlNVYTZ3c3du?=
 =?utf-8?B?SlhldHpjbDVvRS9FSjF6aGljalErWWtQcnJUUStTUHlRTzJaOWpqdjd4K1Ja?=
 =?utf-8?B?aVg0dTF2Y1dYTkswY2JFbHlqbmZ3UDN2eGhZZGlYWlFZbnJwQWtVMXZ6YUM4?=
 =?utf-8?B?SW9XN1ZsdzdHNloycHdCU3E2T1I3cHlyd2dzUEpjbmNyUldBdWxBaGY4UkhM?=
 =?utf-8?B?MWlGMHEwaHNrYlNGVXVDNmJWQ08vd3lpajR2TVBPTHpzSk8zZ1BoZFI4WG15?=
 =?utf-8?B?OXM2TzJrOFhKY1NkVk10MlpSdzh0dUFhMHNubXo3c2FySjRraWF5ZU1ZM1hQ?=
 =?utf-8?B?akpnaGliQW9Sc3hSVVByTlExV0hXMWl1aExuaTk4UE9vc2lMOHBhVHhGbHVK?=
 =?utf-8?B?cVorM0pPb3RXenhxdXAwVFVrTUFFM29mc0F6VCtmcFloTG8zenVFZlYyeXZE?=
 =?utf-8?B?dnBnUzBpTVNHM29DK0hWVXUrWHlHOElrc3MvdGcxYlVET1huR2tvTlFLZ3I1?=
 =?utf-8?B?NlltcTkzdHVLcC9jUXgvd3dsSndzcDcrWHRSeFY3dVFHMnFQTDIvZUNOQUlZ?=
 =?utf-8?B?bm5HVjZCd2p4SlVCNkxSUVFMdUhuV2pycE5RaWl6R2xtM084R3JXRmhKOFhP?=
 =?utf-8?B?NnlrWUVWUXZ2NHhaM2p4Q3orSlFJdldqVlFieTNuNkFtTnM0Ly9TRjIrbEcz?=
 =?utf-8?B?WVBJcyt6UXN6UkE1dzV3RzZHRUlYYlZYTndLQUQ1UmQzWHQ4UWZlZEhjU3A3?=
 =?utf-8?B?QnVDd29HRlY3ZktJSTJjU0VhUnJqc1BUUkZINjQ2NWxkd2pwSjhSMXRSWXVl?=
 =?utf-8?B?M3BlRGdFc1VpV1c3RXEwUjhxVkhzYUdQM2RPN0tEa29xSXptWHhZMW9Xajly?=
 =?utf-8?B?eExzV2dwaDA3bHZya3dORloyRElDbFV1TEVrd2MxWXI2TUJERXZWSXBRN0Nk?=
 =?utf-8?B?UnJOVG8raFpXUW5EYXVkakZ3eTNJRGYzckJlWmZyRXhRbWhHTlBoNEFRcXAr?=
 =?utf-8?B?NWJEd0E4UHc5UE81MStsVVUyUTY2VDJoVlVFenpJVHJEVEg5cExpWUZ0c1Z3?=
 =?utf-8?B?SWRmQVJNbGtHYWl6VDR2UGJIQU5GWEt0WUFZNzVtS2NNUHh6YTVuUFZIVlZO?=
 =?utf-8?B?NXprcm5SMXVLWVBTZzRLWDdzTzBWWE5NS0xaUEFKbDdFZExzVWhqTE5KdDVB?=
 =?utf-8?B?VVpEcGxCSFNSVWZlUks0TjNsTFNzNDRnVG4wZGk4cks4YkNWUVFkNXhPYUdX?=
 =?utf-8?B?TjZlRmZiT3pmaTVVSVhwdkhOaWc3SmZJQzFPQ2hkNlNDOTNsQlhsMERTR1VJ?=
 =?utf-8?B?SUZVcVRaN2JRQ1dBczlrbEtBZU9YcWMxNFZtc2JrcW5iUDFqT05VdGFLMSt4?=
 =?utf-8?B?QVF0Q3YwLzNqT1ZyUzc1ZjQzclhSbTVObG5SMkFJYWlzS3dRcXJOVHd5cDds?=
 =?utf-8?B?b0tOM2xSY1UwcXVlOTdFbVlmakJiYjM2dGhKQ3FKSU1SQ1VJQ1F6aHdKNTgx?=
 =?utf-8?B?YSs4akQzdUV0Vi8rZ0FzaGwxY1MyYmozVTkzZS9hT3Byek1vejcrSUJLL2Mr?=
 =?utf-8?Q?dwoWf0sgBM3+IXqfASjDAc45Q?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29e630fa-62e8-443f-5bf4-08de2c7a7cf8
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 23:29:32.8497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KQgdpkQrlazq18wAqApTeNZd3s7Amz1mI4ghQUxu2oOcZ0OW6MSsIHQdc3c6zS9gz2Ij/MCWy/aZdVB2GOEegQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9661
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

On 11/24/2025 2:01 AM, Alexandre Courbot wrote:
>>  ///
>>  /// # Invariants
>>  ///
>> @@ -69,6 +156,15 @@ pub fn iter_heads(&self) -> ClistHeadIter<'_> {
>>              head: &self.0,
>>          }
>>      }
>> +
>> +    /// Create a high-level iterator over typed items.
>> +    #[inline]
>> +    pub fn iter<L: ClistLink>(&self) -> ClistIter<'_, L> {
>> +        ClistIter {
>> +            head_iter: self.iter_heads(),
>> +            _phantom: PhantomData,
>> +        }
>> +    }
> This looks very dangerous, as it gives any caller the freedom to specify
> the type they want to upcast the `Clist` to, without using unsafe code.
> One could easily invoke this with the wrong type and get no build error
> or warning whatsoever.
> 
> A safer version would have the `Clist` generic over the kind of
> conversion that needs to be performed, using e.g. a closure:
> 
>   pub struct Clist<'a, T, C: Fn(*mut bindings::list_head) -> *mut T> {
>       head: &'a ClistHead,
>       conv: C,
>   }
> 
> `from_raw` would also take the closure as argument, which forces the
> creator of the list to both specify what that list is for, and use an
> `unsafe` statement for unsafe code. Here is a dummy example:
> 
>     let head: bindings::list_head = ...;
> 
>     // SAFETY: list_head always corresponds to the `list` member of
>     // `type_embedding_list_head`.
>     let conv = |head: *mut bindings::list_head| unsafe {
>         crate::container_of!(head, type_embedding_list_head, list)
>     };
> 
>     // SAFETY: ...
>     unsafe { Clist::from_raw(head, conv) }
> 
> Then `conv` would be passed down to the `ClistIter` so it can return
> references to the correct type.
> 
> By doing so you can remove the `ClinkList` and `FromListHead` traits,
> the `impl_from_list_head` and `clist_iterate` macros, as well as the
> hidden ad-hoc types these create. And importantly, all unsafe code must
> be explicitly specified in an `unsafe` block, nothing is hidden by
> macros.
> 
> This approach works better imho because each `list_head` is unique in
> how it has to be iterated: there is no benefit in implementing things
> using types and traits that will only ever be used in a single place
> anyway. And if there was, we could always create a newtype for that.

I agree with your safety concerns, indeed it is possible without any safety
comments to build iterators yielding objects of random type. I think the conv
function is a good idea and with the addition of unsafe blocks within the conv.

One thing I am concerned is with the user interface. I would like to keep the
user interface as simple as possible. I am hoping that with implementing your
idea here on this with the closure, we can still keep it simple, perhaps getting
the assistance of macros. I will give it a try.

> Also as I suspected in v1 `Clist` appears to do very little apart from
> providing an iterator, so I'm more convinced that the front type for
> this should be `ClistHead`.

This part I don't agree with. I prefer to keep it as `Clist` which wraps a
sentinel list head. A random `ClistHead` is not necessarily a sentinel.

thanks,

 - Joel


