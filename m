Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFoRHzU9nGklCAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 12:42:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3751175A1D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 12:42:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E807D10E261;
	Mon, 23 Feb 2026 11:42:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aUkC69IG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010057.outbound.protection.outlook.com
 [40.93.198.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 212B310E261
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 11:42:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cmZZOsBXQ9uWeY2z27KCBVbi9zagouMvh2Dlstw465c4/PRl9j7H5AxLPpFkZI/rFAhQ2pCNlRJ+Joqc6E1ZaZ/q1aY2TYiFaExtGqF5KStwOzeVGwEQl8QfcwOdZR76kFt/6fyel/9B/63LQ0fnEa1bJLrs96fjiH9yO6Rt1zjQvJLVgIHDZEZhm8fyC0kAJduHQTfqikCWJHUuyyk+kC/rArj+oZyj2s3buYDO7OuiV3swbx7ycMITRk54rEuc/2iLvLH2nuvxYE4J3zIGxuOY1Uy8rNSfgZGBn2bZKJ2clPeNa/53z0jcmrUC2rNVZw6ZyrKHoWO+KWyTAuV3uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f2R1pKafH2Wj+D+UURgFyphMbChDzljqBAL27iyLD74=;
 b=BcSnJZx15EuepFo6baIUjuQHTthXUuvg56bQUq2MuN98TSoOgMGpamt/BcQaAi3FcLs/owTxQ0nvsHRrJp9R9MS83fNkgp8IgAcBjP0zD0kTqOrkXVl2y6JNtkb2GEsH3o8Het3/f3cXROq/V/NamR93vT40q50w5olH8xhBCHzRvkvhuMp/BLMFVy1PMaAduHyEAL4EcITH3l4xa2oXFndIXaKzgiO/EsZ+SBHFqC2HIsBcSwWEMF59ChyEjFZftiAj2/L25rKn4TbTZcXHwKHCcpMy/wsf+GkavlWc3MKJyGNtW4zOA/Fn6ZnFpJW+LzCh6jKbe404jZOeFXdQ7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f2R1pKafH2Wj+D+UURgFyphMbChDzljqBAL27iyLD74=;
 b=aUkC69IGJrAx2eWmKJaPi/IQya5uqfPyNzl3O26IAi38GTAiFPAOyMTS4UPACM0gJqEyTEwPciBDMI5s8PDQom2JMNz+B2yWtkvOxKNKlUIAi4DDGxkcNxWws9ZYwC0KX9+lpigOsUqBgA9l1RitdHKtCUWvDnuDjWVh/PQZ4zQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB7552.namprd12.prod.outlook.com (2603:10b6:8:10c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 11:42:38 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 11:42:38 +0000
Message-ID: <e9bbe32f-b165-483b-a2c9-e581bfe57b59@amd.com>
Date: Mon, 23 Feb 2026 12:42:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Opportunistic dma_fence polling
To: phasta@kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Danilo Krummrich <dakr@redhat.com>
References: <91f84eccd59d593822dbb97c995ae9c52ba788d2.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <91f84eccd59d593822dbb97c995ae9c52ba788d2.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0229.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB7552:EE_
X-MS-Office365-Filtering-Correlation-Id: f639d73f-7132-4737-8485-08de72d0a4d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dHhqRDFSdnhnMFFGVEw5ZlBJSmthWU1vNzE1aWMrdVFQcXEvRENrdWtaOXRO?=
 =?utf-8?B?UlczYUxuR2JJd3BxQU9OYWtyTk5lUTd3TmJyU1c2L0RlWHVjRnZGbVFSd0xK?=
 =?utf-8?B?UysxeHNzRHREb0NGeGZoN244WUhhR0dsc1JvSkl4TEpTeitDMStOdDNkcks1?=
 =?utf-8?B?RE5aWU9VcWpGdEtaZllZSXoydm9HOVNFZUtSQnkySXZ6NDgzSWFvaFp4TmRN?=
 =?utf-8?B?VlVjY0tQUWgrVEJpTGJVSmZhWFNyNVdWNTMweUlqL1h5aHJxY1k5ZHNUbHdS?=
 =?utf-8?B?L3ZxRjBLNkJUdG56dUpUWUlZWU9Pc1VpNkVxZnZDN2FWTE1GL21pS2xlOThS?=
 =?utf-8?B?WHBXL2c4NnhlZFhWTGZ6T1NwS3pVcTF0eXcxRDdwdjMwYzdWYVp6UDIveDZh?=
 =?utf-8?B?WWNyWlBsa2FyMVFXYW9XbUZDank5Sm0wU3FjQTQ2NVVWR2h0Ymdnd2R6ZERu?=
 =?utf-8?B?MXprRUJRWGlSV0xkeFdxWXBSdEdBT1BvSDFKUmlrWGhURndGMi84NmpOQW85?=
 =?utf-8?B?bDdvSjY4am1idHl4OFhnN1RkaXIvNkNaM3I2MjcyejNMT1duSXJLdkpzcG9Y?=
 =?utf-8?B?cWl2SElKZUJBY1EyTWZJNHRBakxlV3kwWkQ5RytDNEZubXpQSHdFMzRKaWhj?=
 =?utf-8?B?Z0pFbWlRb0I4UGpkSHpRK0syL0o0NSswRjdGUTJHVXgxeVl0LytoUGx0UkF1?=
 =?utf-8?B?Y1o2a0YzK3dqWHMyTVI4QWduLzhTdlpGOFF5YUROQnZXdjg0R2UyMkZxeG94?=
 =?utf-8?B?Z1VYTXc1NHJEd0J5WERGOThCQld4WnhhbTRKbVZxRGdXRWc2NTY2NnNtUWFk?=
 =?utf-8?B?cDdBeEpBMFF5T2dINFZBclNvcTBPSTJBTThGVHdqTDdZR3ZzRGE5ZmdKTU5G?=
 =?utf-8?B?eXNwc3I2UW9GWVZWN1RIbmgxMG81RUdoQmtuLzR3MkE2ejkzUTVCaUREWFRv?=
 =?utf-8?B?M1o4S0xTaFNFcURLZjZNc0xCVkY1eEtwMkdobGlWOUk1R09haW1KN1FWQWpi?=
 =?utf-8?B?bGp0WmVZdHVWUzMrZldnSE1wdmRMUWNJY1R5eE5YeU81Y0ZyaWExNDBUSzhY?=
 =?utf-8?B?QXJSeUsrQTJBMmZtSXYxa1FOY2pSTmxvdHU2N3l4U3lTZFVSUDllcnkvVHR3?=
 =?utf-8?B?eWpEUTlxZ1BuTU1hZlRQY2N5YjFMUUtyQWorUWlvUk1uYU5BcEN3T2svNWlt?=
 =?utf-8?B?THJESlpibUJ6MGlYcHVOMk1IcDJ1Y1ZJSFlyWUJjYTBjaERsWmFoeDNWNXpE?=
 =?utf-8?B?YXcyaTU2Tkt6dGxjWWpBbWl4dHQxbmgxOHZhYWVWdUZPd0llQTExM1BGRlpY?=
 =?utf-8?B?M2tzSlpKWURlQWZ4bHF3em03SHdpUmhqai9maFRWdC9vQnJQVHBnYXZFVGk1?=
 =?utf-8?B?S3hyeE9JTlFKcFNsZnFISG41L3R5dlpXNVdhWXEyR1JxZzhIMVBEcW5mYmI5?=
 =?utf-8?B?azU1TWh5eEtkTzlGbE00MU5Fb0pqZU1IOUZJc1cySEJmOVZIenlmQU5zb2dx?=
 =?utf-8?B?bkJQWmVjeHlRSjZjeFdjWmZQaWtaN2daQVQzc3dueThNcHUxZDF4QnZ6ZWZr?=
 =?utf-8?B?cVZ1L2FxU0taN3ZMQW9xUXowVk4yVkpqWlpZK2FEVWIxZEZGN3BGR2prVnIv?=
 =?utf-8?B?ckZMaXRRKzE4NEpZaDdtRFkwRER2ak0vdVZaT3Y1TE9Na3hGbjFXQ2lsVEFi?=
 =?utf-8?B?OTJ3SUNCWmk0WWlncjNLZlhmTUpsV282WUk5cXVlOS94OS9LK0orQ0hRWFJE?=
 =?utf-8?B?U2ZvanVkRWlBMTBLODI2c0dDYnE4Qklrd29pajFuMitZcUpWY1grWkcwNExw?=
 =?utf-8?B?UzJJaDU3RkUyRWd3cTc1ZU40VmRRbXlxbUgxbEx1bDUrUEpUN0NJMzBmYjQ0?=
 =?utf-8?B?U3RQMVdCMysxR1FvM0RuMVNTSk94V21TL3B2aHQvVkRseVFvR0haT3RmSFo4?=
 =?utf-8?B?cDBMR2trQ3ZKUU5YNmYrMWRPbVNOZ3E0Y29sMkdobG5JMzhPK29udUp1RTZh?=
 =?utf-8?B?UENrTXIzRDZuV21Rd1JROHlFREs0TXdMUkZ3T0x3WW1HY3A1QmtpaTVCYSsr?=
 =?utf-8?B?N0t2OW96cDNoVDBZWEpxRm90MEVGbFR2UjlrcjNtYjhlMVNTVFpPblQ5TUZP?=
 =?utf-8?Q?NiMU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VG1yOFRhYWpudWFMd1k3elB2VktnbG41d3pHMmpWOUF2bHFEN0xaa2lQVjNl?=
 =?utf-8?B?RkEyUVhUTWpzU1lUNTExcVVkbWlwRll6Mzd3NDNqeW5lbkN3R3plVjVjcU04?=
 =?utf-8?B?UStDeVgxTUVNZzVqQ2dGNGFlTDYwTkwyeTdoazVyT3lsUGFTTTFhRVpUaGJM?=
 =?utf-8?B?c0lIV1ZDWHdTdFdnb2kvQ1E3elQwMGwyenVBOHdNVVM1SmhCZ0w4dDZlMXR5?=
 =?utf-8?B?U3FJWktML21VZlZnc0JCQ0xUNitYenY1OG1oN0Nndm9DaXM3NDVmQkVnTzJ2?=
 =?utf-8?B?QmpFVVczRldaSXF5cDVBQlFNdi9yTkRaOWRsSGtQcjlVRGVsNkRlZHJCbHA5?=
 =?utf-8?B?ajZxVFg3b3l6aVZjRENKNm1wTmtkVHlrSGhMZTlEemxMSTFLTjRKL2pJanpR?=
 =?utf-8?B?TWd0MHhEcTJ4eEQ4ZUk1RjU5amVXcW5VUVNyb2t6bGY1SzJkYWhISWNXOXdJ?=
 =?utf-8?B?L1dCeUltV1NWMkwyMGVPOTFtS2FhQ0lvMk5CeXd2Q3QzWTVJMnpSL0ZXeG5j?=
 =?utf-8?B?ZDJmd1VDdGFKT1FBZjVQdmNLdWxydzNZd3gzbC9EZlF4emlCaks2aURacFdj?=
 =?utf-8?B?cmphRmc5NFZNSHhXa3hHalpWckxWczZ6RkJQSE1maW1rUkJEU1RSUWJPUEE1?=
 =?utf-8?B?UlRRTllidGJzUFYyNmg1WHBBZVFFZ2d6QWUydGxLaWJpY3pMeCtNQ3lmRWFz?=
 =?utf-8?B?eVNuZDV2NDNNaVoyZVMzeStpbDNMd1BHUmJGMmx1eU1SUnlmdVlLdDVxK1p4?=
 =?utf-8?B?WmUzVExKRU12VG9XS0Rxc09jQnFCdkVxQjZYaTJ0T3p4TW9hZVUvTkNkbXVL?=
 =?utf-8?B?YnlTeTlHWDJnTHVTQ1pwUVByUWZuRzQ4TVF6eFpEL3RqbzRYUEo0YjVvVkRk?=
 =?utf-8?B?VmNXVHo4Q3NDcEN2d0JPTnNsQW1PaFNYNDZpZXQ5UUYwZnQxQ2djOE5aMFdY?=
 =?utf-8?B?R0RJelVUWFRlVHBTaDFwVDArdmJsb0svVGhoY21aUm1BQmlaYXZiM0ljeGdE?=
 =?utf-8?B?Si94anYzZzVrTDYrdkRRYy9sWHdISkFqU1RsNTZsVlg0ZGVwblJwL0ZSL2o1?=
 =?utf-8?B?eW1KUXFpRlZNM0hhTkFDZUZZcFo2anlkekFQbHYvRXJRNy91Q2d1U2d2YThU?=
 =?utf-8?B?TWpOMXdwM1RwV0ZyYkszcnVGaEh6Z2habmVUSTdmSEsxYUNWNEVmbjhyUE9z?=
 =?utf-8?B?OUFCay9ValdkR3pLYVcyUU1kQjZyS0VLbXhyeVZiOTB1V3ZZMUo1bjB4b3Nv?=
 =?utf-8?B?aDQySHYrNG9ReDF3NmNqVE81NXl1aFRxUjZjOVBNMTRDYmVXYVBhSFdFY0dB?=
 =?utf-8?B?WlBHQklkSXNPRmFtbGhsQjhyM3BJUlBtYkxHZzBkSlA2N0pubU5MN29pZWYr?=
 =?utf-8?B?b25NK3ByM0V4T3luZ1lwVXFlb2hZZjBqKzhMRElDWE1USFhOSU9MSGV1Yjly?=
 =?utf-8?B?QXBIU1k4MjVqYjhFcGNia0NzcUlvdE56QVFTY0h3TTlSbksrU2dKUS9GV2l2?=
 =?utf-8?B?ZGVXNWYyTVhKWm9IQVd2Y20vckF6RzBqRGt5Q2pSZUdycU1BUUsrZFBnczEy?=
 =?utf-8?B?Tkt6NTNwbUpSeXV4dHBaVjgvR28yblhweEtyQkVXSGw2TURSZVdBQlFaNmpr?=
 =?utf-8?B?MHlnanQxeHVLN2FnOG1ET21UL3llbFZJcjF5Y3dQeXF4eERWOS8xdkFGM2U0?=
 =?utf-8?B?V2MrNWV6d3RFSjRibUE3UXpUMVAxRmJqeHQwR2xWMHRuTkhCUXg3SVY4UENm?=
 =?utf-8?B?QWtkTWhodFJ5MzYyRTMyRUFLTVZYNUF1cGMvSmNRcWkvdmw5d1BRSWlVY0VE?=
 =?utf-8?B?eUZUTlhmb2JMbjUrbHR6OWIyd0F4ZVdSY21MbHlNdlRjcFFjVGxlSWthL0dt?=
 =?utf-8?B?M1U0RzF0cjFtN1hXVVFmK0VRNy9hekZ6VE5GbG5HSlNHeDJHZnlnS05YMVEz?=
 =?utf-8?B?NGlzMjI4YVBxTWtRdURtMnJtNWpnM29jTTY4cXRuenRIdnpoK096MzRiNS9w?=
 =?utf-8?B?Q29yNWlRMWZlRFNEeS9RS1VDNHArZ2JGZlhLVnoyblZZbmFBdXc2MkpzczBq?=
 =?utf-8?B?UUpXTHFqY1F0cVE5aWd4NGJ4aFN1cmVNRFo2TWY5N3JSRzRrVDRaa2lkMFFO?=
 =?utf-8?B?WVc1MURTVWd3cXdXTE56NVZpVVN1VndSeEpzZmtqVmV5c21mWnlOTkJEd2Er?=
 =?utf-8?B?QldrbkZZeEJGcDZBZ0dtUkFJTUVpNEFuOGZQMTIzK2xuWFRRUEVrL3g0cXQx?=
 =?utf-8?B?cGwxNmd1MVM3WHNkNVhHOWRaaGdkTHNhWVhjeWJQajFBTXkrbUZ1QnhJUlRB?=
 =?utf-8?Q?pIW/2W1ZSqum7bvQ00?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f639d73f-7132-4737-8485-08de72d0a4d5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 11:42:37.9660 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i9CFr3YM71CvEAHdt2CAlx35FObEjn8JUT1B9XI9+aRCDP80rBmSdrcz32YQp1MK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7552
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
X-Spamd-Result: default: False [-1.60 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MIXED_CHARSET(0.71)[subject];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:boris.brezillon@collabora.com,m:dakr@redhat.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: C3751175A1D
X-Rspamd-Action: no action

Hi Philip,

I only found this message by coincident, please make sure to always CC my AMD work email address as well.

On 2/19/26 12:06, Philipp Stanner wrote:
> Yo Christian,
> 
> I'd like to discuss the dma_fence fast path optimization
> (ops.is_signaled) again.
> 
> As far as I understand by now, the use case is that some drivers will
> never signal fences; but the consumer of the fence actively polls
> whether a fence is signaled or not.
> 
> Right?

Close but not 100% right. The semantic is that enabled_signaling is only called when somebody actively waits for the dma_fence to finish.

So as long as both userspace and kernel only poll for the fence status enable_signaling is never called and only is_signaled is called.

What drivers/fence implementations do with that is up to them. For example userqueues use it as preemption signaling, but most drivers simply try to avoid waking up the system with IRQs.

> I have a bunch of questions regarding that:
> 
>    1. What does the party polling the fence typically look like? I bet
>       it's not userspace, is it? Userspace I'd expect to use poll() on
>       a FD, thus an underlying driver has to check the fence somehow.

No no, that is indeed userspace.

As soon as the kernel starts to call dma_fence_wait() (for example) we have the normal guaranteed to signal semantics we always have.

>    2. What if that party checks the fence, determines it is unsignaled?
>       Will it then again try later?

I have no idea, that depends on how the userspace component is implemented.

>    3. If it tries again later anyways, then what is the problem with
>       the fence-issuing driver itself checking every 5, 10 or 50
>       milliseconds what the counter in the GPU ring buffer is, and then
>       signals all those fences?

That you need to wake up for that, this costs quite a lot of power.

See two different approach:

1. Interrupt driven, e.g. somebody says signal me as soon as possible when the work is done.

2. Poll driven, e.g. userspace wakes up every N milliseconds anyway and it doesn't matter if the status changes a bit later.

> So it circles around the question why ops.is_signaled is supposedly
> unavoidable.

Additional to the interrupt/poll handling it is also a really important optimization for multicore systems, e.g. it makes the signaling state visible to other CPU cores even when the core handling the IRQ is still busy.

That is also really important for some use cases as far as I know. Keep in mind that this framework drivers everything from Android mobiles all the way up to supercomputers.

I mean what we could potentially do is to fix the locking invariant of the is_signaled callback, but that is probably the only simplification possible without breaking tons of use cases.

Regards,
Christian.

> 
> Regards
> P.

