Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFEEAE66FC
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 15:49:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 946C210E5B2;
	Tue, 24 Jun 2025 13:49:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SnqTJwZ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B61710E50F;
 Tue, 24 Jun 2025 13:49:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TROW9EPalu77rIWeI6hq3mao8xKNcYa+WnmFmphmtD6vCAdWohrQt4mMG3JoJGBWIv9uCrF4JYeR+7avTQEFTHPhz7ry4o2cIkx45Mkd3wsu8m81AIK7HBFxypXtcUOOMhxD6sqorzsnGlr2z2Cl48MtBc0dyb0AS2YB6TcU2YFl5iQBVXTOttVtUxbZPDKLJdlDYDkup1UoLg146YGTxeJj2gsvPNPRBnHW4kZIwhzUUIYvDBpYw8+YGrPi8rqMtbFW6TzaShBYZ5rIORAU4bR1G6IpICFGAHW7gF9IhZQhpc+gaazrvSQ97p5Xn881hpunj86jLLyYD0TMPCvlTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xYhgAc0EVHANZ3tApWVVT4pp0MV3RJvTRE6THcSEjR0=;
 b=dkgIhSaLSKfXhz1q2wwrr9Q0dgFZXZCKPQI8D71LCnIYODYLmJxOpR9M23RQ7tbmq420i3nK9VhcFi67ZRK7nqTMMT8is2DE3tzmZDcsOaEVz/+AiMxBmU000cDDz11iESJwrA/9C1vVIr09V6OOKUC1vMsqeQtCjgR7TS10TTH4NxujumbB5vnpvelkR/kU99Y/u2SKzsm0wnGk4KSJB0jM7sa+sXkb9UMsZZtcpiHFB84DgJe5BvZ9nxWIrlqpelUj3zepG1H00FPwl2/APIKTEIQeEvP9KKApJDQHWbnHra5Hrz5TzaqnFdKxy0x5SmFnk52eg0cGxTmyYZm+Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xYhgAc0EVHANZ3tApWVVT4pp0MV3RJvTRE6THcSEjR0=;
 b=SnqTJwZ37X2U0Kyj/jChJ0wBrp/4C1uN4yKgOgrE19awSI9AohB4TAp58yQfmTqB1WdyqUdgA7OpInJLQGRQ4tdZwIdQ4BThbfm8vGHg7xUgk9n8CE4bEA7oGpdpPAAYTYOswUlXr9JFc5VG5dhTyzewUKT4mp8U30SyJ+W9NOCS33M1bi4hKIAiUnaLdyKClGf+0Zkyfq1DERz3CDYVN0mSDvfX417mIZ4jOp6/nEllhHZ3ocwqqbx2hKBknf3yMK1KuFc/6COl3oce+C8/WYrx2ylM3117+/CXWbinWqkTV4oBCw86Tge4MVNoycTDs+vo0eRMJbwqN4VSiN0VRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB6270.namprd12.prod.outlook.com (2603:10b6:208:3c2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.23; Tue, 24 Jun
 2025 13:49:01 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 13:49:00 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Jun 2025 22:48:57 +0900
Message-Id: <DAUT7K6AFAXI.I6R4SBSYLRKP@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>
Subject: Re: [PATCH 1/2] gpu: nova-core: impl From for u32 for enums used
 from register!
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250624132337.2242-1-dakr@kernel.org>
In-Reply-To: <20250624132337.2242-1-dakr@kernel.org>
X-ClientProxiedBy: TYAPR01CA0049.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB6270:EE_
X-MS-Office365-Filtering-Correlation-Id: 705b917b-7d94-40f2-48a8-08ddb325dfc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|10070799003|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OGdXekVnckl1TDdUK0lOR0ZZK0g3Nk9OQThzMmNRazJNaHljRG95alFwSUhN?=
 =?utf-8?B?TVMyL0NFcXN6L2pkaTZuRGFWa2krQXhGRXR0SWRLRUYvbWxlNmR4U0Zickg4?=
 =?utf-8?B?ZldCZ0VnZTVwZFZTb2xlRGZiM2xEN2swMVJ1RHROZHkySHRCZVpKN3YrM2pa?=
 =?utf-8?B?enlKakkxUWN0MGlXcjhBUlpPaDNzTFlQclc1R0I1VzFFUnFoSWlFK0VQYVZQ?=
 =?utf-8?B?Q1l5VXFjd1V3eklvSVg0S091eFMvaW1QZnp3N1QvUGpIQ1hVQ3JVQkcwbkJa?=
 =?utf-8?B?eFF5c1Jpb21DR0VoLy82VUZPdGU0WFIvZXJ3azVackhxWHdjck5mTitIQnph?=
 =?utf-8?B?cFBENjZ2N1VCZkJBNDFpTEYrOS8zQnhvbHZFalZjanF0blRSRlFVRVNKbVU5?=
 =?utf-8?B?bGFhMUEwOExjOWhsUExMWjNJbGU3dW9WaFdyNDUraXRkTEpZYU9wVE5ZbG9Z?=
 =?utf-8?B?bEhvaTlYbGZ5K1crZkQrVDBCUUxZeGxza3lHZW5PVTA3S0g4VGxDQ0hXYzlC?=
 =?utf-8?B?UzRRRU1qYlJtZWJsNDZHKzNvV1A3TEdtYy9NRTcvNWRnNGJaT1RwVUU1OGJ6?=
 =?utf-8?B?OVFjU1lRL21RUmFkR3V3TXRNTmpwMktaVU1PUWsrV0FyN2tYNG9veFVTTSti?=
 =?utf-8?B?aTZFK1YwTlJYM2xJQklkSTczMkRCSHkrMXlBQXpoQ21oM0ZQWHl1R3NZeitx?=
 =?utf-8?B?Q1g2elUwbWxQTENxMk41TTc2QXNPY1BCRW9Fb2pUbzUwV2pWK3NtUnowTkpy?=
 =?utf-8?B?S0h1UGJLRVJmbzMwaGM0WFF4dDNMbk5hTm1kbDVZdFdKM3l0ZmJ1NXcvakc3?=
 =?utf-8?B?Wm5haEFFcFBBRjVSb1RicnIwa3ZnNVVkNnB5cURWVnQ3WTI3YWRVRkZWeDZR?=
 =?utf-8?B?SlhhMjRYdzNxczVhNjduQi9vM1RYYmNGZFBBRkVhQU40cVZnUjkrdEM0N0d2?=
 =?utf-8?B?QXFTaDZXTmtacnFpa3AwSXRQRlpTWWE1MWJJZ3VrSk5BOEZhQVN4S2FlSGsv?=
 =?utf-8?B?WGhMcTJrK1A3aXlQd0kwWUIyZzJ4MWNZZU5CVGdWN29kTWcvZjJVYlBuT0dC?=
 =?utf-8?B?TE4ybkFiamtYelJSL1hGaXY4dGpFYVZLOU1wS01DdlMwWkFVY2lka1RNMjIz?=
 =?utf-8?B?dWc5TVRDY1dWOXcyMlF3VHNaTE5JamdqenlCbysrTVlYelVvekpOMEFIazNt?=
 =?utf-8?B?R01MMVNtL2l5ZDVKNStUTEhmRDczZ2tFcHJxVkUvTWliY3lKUVVpUisrczNZ?=
 =?utf-8?B?MUh1b1dSaVNFc21sa3hNdXNuZUVMdTFYY1I4QldxbHJVOTkvMW9nZ3ZsTlpM?=
 =?utf-8?B?S1N4ZXFMeDJ4NWc3SU9SYU5LaysxY2lLNmZXYTFYaHFLRGtFNm5LYmdXTXZr?=
 =?utf-8?B?SmVTNlk5L0FJdk80QjdxK1dDRnR5dElMbSsvV2RtMC9NbHg4U0R5R0NSUEV1?=
 =?utf-8?B?MGp3ZlA3R2hLcXI1clgyQUF5dGc5aEVvUWlzZEE0NTg0VjRSek43TXVEUTZo?=
 =?utf-8?B?MmJBcnYwVm5mMEhrbnVNT3pDcEJSL0R1MnFCRTl4VHBvVjhTYVdnNW9aUVox?=
 =?utf-8?B?YmhTZ2k4ait6SUthQzlQcXhTWFkwSDMzZ2k2c2Z5U0UzR085cmhxcUh4cDlR?=
 =?utf-8?B?bjlOajk5cTNacDVKVDNpMW5PVDVUVDNMbEFBVjdraXlFa2hzUHNEaWQ4MTBX?=
 =?utf-8?B?ZDZBZDdxZXpsNFB3NzRLUzZQd0JFZkhTY3BjY1NGajBiRzB2dis0YWRRWk9M?=
 =?utf-8?B?ZmpQcTkwNElwYU04UVJiR2lsZUlINnBXWGhUWWhsaDFTOWpKeldKUThMTU1m?=
 =?utf-8?B?SzB3TWREUCs2RU5aU0FzcTNmWHhWQzRvZ0hKTGtNcVNBazVyNnJQc2hqOUEw?=
 =?utf-8?B?S0NqeVN4RlJZczU3d2hBRUl4UTdJbkZCT1pXekJNdjBHYUltVTREZnpRSEg4?=
 =?utf-8?Q?LOPziXTPJOs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mk96UjJ0UFhmb2hCL2RQaDFUdkZTY3M1emVEVGl1dExSQmFETmVrY1JFNVBQ?=
 =?utf-8?B?b0M2T2ozek8yR2U1d2FJZThjOFNtUk9pV2FCTi9QNW1HSkhSZ2FDakFjTlZ5?=
 =?utf-8?B?VW5xSE5pK2Nhd0Zkd1B4by9EZWtvbXVncWFTL001dnZXMWtvZUZUME1SQU9p?=
 =?utf-8?B?bW9hdUFXN1NYWGhlR0sydFZxMmF1WERpUHhnSGlFaW5TNGNMSTlHUGR3djlI?=
 =?utf-8?B?NzJZdW82OUd3Q0VHVDNDVFFsa1V0NkxhRUtkKzEybkxnREJMaEpsTlRUUUtq?=
 =?utf-8?B?a05yNS9xMkh4MkpnK3dLM2JYalUydEFIc0cwbHpsSXRad0pJL1dWTVNZK1k4?=
 =?utf-8?B?L0NyL0l1QWlQclY3TjFRZ0tPVnYwS2srWjhVTzY0M0lJNE93MFBwdW1hVnNr?=
 =?utf-8?B?WkJQK3NueHNKU2tjMEh0QTB3M3htY2FubTFjNHZOVGU1OFRJMThLWWxab01j?=
 =?utf-8?B?NHBUU0t6Kzd1bklHM0RSQVJiR1c4Yms3UWlRSnlZelZwWWNZWXMyaXRTampJ?=
 =?utf-8?B?UnhlYldJMWhrL1l0T1d5VUFZcFltZjd6eWxyTEk3R2taVWtjK3p5ME96TTBI?=
 =?utf-8?B?bGdtM3R5WVVRQUl4VHppR0U5cEJTSzBUSHNFNUhtRU5qdmpaTlJNNWNjamlH?=
 =?utf-8?B?WU40MkcvbG5kbitkWWJJTUZxd1lCOGRaZnBhSXpwNlJWQkRLeDlKa3RvL0d6?=
 =?utf-8?B?Y2lOYk5HMThxZVNHanlHZ0ZnRzRsbzFFTFZSU2ZES0lTSVpoaEcvZ1dhL01i?=
 =?utf-8?B?amc0enRZcWRmZXZpS05iQVBIaVltQzBZN1RlcjIzWlFXckNIUUQrYUMzMmc1?=
 =?utf-8?B?d1E3c2tRWVRzbVQzSDBDTXh1eTZ5cG9GWDR3T2ZPTloxa2NQNksyWVhrRWRx?=
 =?utf-8?B?VS9laVhLQnIwbjJGZlkyN0lRODFIN2MvMEgyN2tjRzdPNWs0ZFlib3dJeWc5?=
 =?utf-8?B?ekZmS1lMR1E4Mm9kRG1NdFVtZmVrTWs1QTlGT29nbDZ4R3F2eCszdFovMnk1?=
 =?utf-8?B?bDJ5a0NRUGlrV2RtUFozUVY0YXhGNjdmYmsycGZPemNDemY5ZnVEOTlaQ21Q?=
 =?utf-8?B?U1psaDV6Wm5KQlA4VmNEYlFUNHpwdVBHVmFQL3ZOOEt4WVZDT1J3aFhHVFo5?=
 =?utf-8?B?WU96dnRpblBOOHlVMHRDdnc2eFhoVTFLcmZxMngrazJEUHZwN0taNEVSSDJp?=
 =?utf-8?B?dE1acGt5d2E2bDlENkFWbHRrTkhSVnFSa05KMEIwK3lZa2VOOHdDMTMrWkFS?=
 =?utf-8?B?R1o1NHJKc3BnWWkxQkZJRHRIRVFFckptSzU0ZE9OYWZCUkxxU25BWDVnZmhv?=
 =?utf-8?B?Q21TbEFQN1B5RUZUMlZPVlBmbjZ3WUJCU2VIa21DcDVmSjRnOHdpTlRQVXJL?=
 =?utf-8?B?ejNwSTI4VlRIaUVRSGVkVlFVQTgzSGJnbmxSMnBWVG50WFUrZm1pWWtvVk5I?=
 =?utf-8?B?R3J1V0xIQmhEcmZRbUhkdkkxTEh6MmEreXJiOXZJSTFJTVYrUktHZ2lLQ3pR?=
 =?utf-8?B?OXB4V3d0YUMrZGtyc2I2U0kvdndvLzVDbzB6MFVjTGs2VUdlaGdyS1RYNlRF?=
 =?utf-8?B?SDFjc3hLMm9qL2tvemRTZzZJRWkrcHdzekx4eWd4SzNBakF2d1lqNERiM0M3?=
 =?utf-8?B?dTR6Qk1xajhQY2JGRzUyT3gzYzlXb1JVbGlUdzB1blJ2dnBjcXdIcklGcndl?=
 =?utf-8?B?amNCeDUzMjNZWmJpaW5WaTlqMlVqVytKWFBVSEd5dWh4SjFsdmxscFAxMWE5?=
 =?utf-8?B?dGszaHluTkVNYkhDZW1zQU9Leis0OWFNSkVSbzFkTWtVVHIwdDBvWldBbGpW?=
 =?utf-8?B?YnNUWjJFWk5MajdxSnh4emlldUp3M3NnNVpDejVVeFVrT09KRjFWWGhUc2NP?=
 =?utf-8?B?UGd1RXdQRkc4Q3BhZFNNNlYvSUEybi93ZTM4eU5PK3I0OFZjQm9lQ3NmaEFI?=
 =?utf-8?B?SHdyQzJjOEhzdy9KbmZ4Z2ZKT3JubHhiV0kwc0NJM1Y3V3NaSDNlSGk3YlBV?=
 =?utf-8?B?b01mKzhmVnJjOU14T1BNN0Mvb1BjYTMyb0NaT1B0T09HMUNqbU9kejJhaDZY?=
 =?utf-8?B?TGRyOFcwVmM5cmZXUnpGdFZmeDMxdDFlK3pGc3N3NkxiWHo0L0J2ZWpldFF2?=
 =?utf-8?B?Q0VUcnVBbU42aUpIb0tVMjdWOVhBTW5BZ2RuMmFsWFpwOGQwOGZ4c3JnV3U3?=
 =?utf-8?Q?sKev7vRf6kXR5OT+AOdQKRYA2mysrsoTFKF+5gmAE7tG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 705b917b-7d94-40f2-48a8-08ddb325dfc5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 13:49:00.7743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /zaBsmXfnrxxeTt1lPX9e7aNPpfyNhywkNksiJ3d9M8+SDSM4HRVIogg15GibXkrg3q16mCqACDcIkmyItyhag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6270
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

On Tue Jun 24, 2025 at 10:23 PM JST, Danilo Krummrich wrote:
> Implement From for u32 for all enum types used within the register!()
> macro.
>
> This avoids a conflict with [1] as reported in [2].
>
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Link: https://lore.kernel.org/r/20250615-ptr-as-ptr-v12-5-f43b024581e8@gm=
ail.com [1]
> Link: https://lore.kernel.org/all/20250624173114.3be38990@canb.auug.org.a=
u/ [2]
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Also confirmed that Ampere still successfully probed with this:

Tested-by: Alexandre Courbot <acourbot@nvidia.com>

One small comment and question below.

> ---
>  drivers/gpu/nova-core/falcon.rs | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falc=
on.rs
> index 07be1c30668c..1affffb109ec 100644
> --- a/drivers/gpu/nova-core/falcon.rs
> +++ b/drivers/gpu/nova-core/falcon.rs
> @@ -20,6 +20,16 @@
>  mod hal;
>  pub(crate) mod sec2;
> =20
> +macro_rules! impl_from_enum_to_u32 {
> +    ($enum_type:ty) =3D> {
> +        impl From<$enum_type> for u32 {
> +            fn from(value: $enum_type) -> Self {
> +                value as u32
> +            }
> +        }
> +    };
> +}

We might need some equivalent in other modules as well in the future -
do you think we should move it to the root of the driver, and explain
its purpose with a comment?

I am also thinking that we might want to turn this into a derive macro
in the future, similar to `FromPrimitive` - so maybe a TODO item is
warranted for this. I haven't looked closely at the `FromPrimitive`
patchset yet but it would be neat if we could leverage it somehow.
