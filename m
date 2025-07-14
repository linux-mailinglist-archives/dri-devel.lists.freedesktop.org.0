Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D5FB034CE
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 05:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E986110E1E5;
	Mon, 14 Jul 2025 03:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="O5tw0JL7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2069.outbound.protection.outlook.com [40.107.236.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E3410E1D9;
 Mon, 14 Jul 2025 03:12:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TCIdy8M+j2I55dJ4dGb2BWFQkGSXRw5oNjLCiCB3a433gehHC1yvaDpwCcsPE2Yv+Vs5FAjNMPAd3l36dMbvR83rlSFvin4f+rTIHFiVuWa8DDzpm7fkpGAhxUnBI7ePGh52zm809rHgM69/1rLgEQYF4FppDS6TeN8pJErJSvHWkBzsJqlTO+SuyHzjXafvX57al8DmKpLxNdDP7/ke/myG2HL1eJk/r4qXaUS60aN4nwm2oXtflQ8bCr8hNgh90STVMXebDuukgRSVkDFRzoydsr7SOaRam19a0wi84Au1BdOWE/yMeWq8uVyjBWt31WyM5XkiTKB7oDFBHfk3aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OThMfNcz4JuIWa9byi7podDWlcov2xX/lOhuZJKAWvo=;
 b=HkKoT1zQbB3fCFRc1x1m6wLHeNBxg8Ab/oqe1YeqS4VRqOSEzbitEgGj2ue5EaJfC5K0S1vH1UKiN+oeVN4fS8GaRfCLBNNxYG/miOPgixj3SK/z5y1+UqHN8pJ8jEfZIRvPTQxApx2y/LneD48uQ22950Jkc5OFJOKAnMKFG3kKr6qTiANeaAA/bRBepuvYzYNjsXEuY7NuO0w3d8zKFmBiRiwc431G7HwYZh7cK6ddu5pNRzBNyYlT1e/8CWQcOP6jbbyZg3/a9/jJOZ8iH4QTdzYXCIb/JLNmptnBG6fov8rTdWPqxmuBkVVbgpSukct25w6naD6XfqqerjfwmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OThMfNcz4JuIWa9byi7podDWlcov2xX/lOhuZJKAWvo=;
 b=O5tw0JL7Anu9+9W7KkNlwWtGJknpot4UOEHO34ok5r2htAXua3Oj9aknXYin4XqOb7WP7eYhiif6Rvv9T5PVlX1FXv4oBREWeW5DEfg/0iBFivecETlu9/iUAhfnXpmQfU9TlQ042KDuyakOjOn+q/dqjoRSelTX1ffzrfVtn7IBqke3MOmsAGSCQxq42sBJwHJVWc3Uw+CXgR1LP0zscLZCS6a1+PtnePxnuLUqJO4gdTHzwVEtRHs9e4w0U/xEEZggGdlIvQhQd1e8NqqfGYyKDzZRoCqTCTWkOWH6hKnDyg7i7ilrg5KreXcUe2xSqn6ZwYX9KbWt42LuSVgEEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB8174.namprd12.prod.outlook.com (2603:10b6:510:298::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Mon, 14 Jul
 2025 03:12:00 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.021; Mon, 14 Jul 2025
 03:12:00 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Jul 2025 12:11:57 +0900
Message-Id: <DBBG6Q86XAAQ.43DPC0D210TI@nvidia.com>
Cc: <airlied@gmail.com>, <simona@ffwll.ch>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] gpu: nova-core: define named constants for magic numbers
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Rhys Lloyd" <krakow20@gmail.com>, <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250713025108.9364-2-krakow20@gmail.com>
 <20250713025108.9364-4-krakow20@gmail.com>
In-Reply-To: <20250713025108.9364-4-krakow20@gmail.com>
X-ClientProxiedBy: TYAPR01CA0032.jpnprd01.prod.outlook.com
 (2603:1096:404:28::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB8174:EE_
X-MS-Office365-Filtering-Correlation-Id: e40d5c0b-b7fb-4240-e76c-08ddc2843315
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SExOOWwvMzh2dXhyVWJzWkljM2xjbDJTQUNFbWUzVmJyczdKR2dyM3lBV2Vj?=
 =?utf-8?B?RGZKVjhzK25uN1J4NEpzNnl5SHBaVHNFMnF6Z0NPNU5PVi92NDVOamN6RENX?=
 =?utf-8?B?QVNpcWp1TzBmT0JSYTVnc0I0Znk1RFFpR3puajNrdHZjQ3ZYNExrRDF2eHo4?=
 =?utf-8?B?RDZ5ZHFhSnlRb1dqQ0hYU1lDWlBnenJ4Vi94OXpvNW5LVEFhaG50bTY2ZlZ4?=
 =?utf-8?B?Y1RCVnpIMlFpUEZLTEt6cm5Ld2EwRlpNMXdVYWczSHl5bkwrTmR1NnJ0Y3pT?=
 =?utf-8?B?eXlFb20zU2V5d0VtM1Z3WTFoMnQxblRVekxkOEZJU3E3NWpBTW84NVFVVDdP?=
 =?utf-8?B?Q1kvKzFHeFkwWHRmcHN3UEdncHUrbHJ4QXVZT1prVklqMER0dlRnSFVRNlZX?=
 =?utf-8?B?Z3ZGTHlmdFVQRCtFdStHbDVrZVdHR29yWDgxRXhJZ0tSbHQzbGJQZDNYSzFn?=
 =?utf-8?B?VzBWcnpPdFVUNG4weXY2aDRJWjJBczFZV04yQTFCVTR4NVkwWGNsMExBU1Zh?=
 =?utf-8?B?UFNuWUlqeHdrOFhwdGhmY1lPODl4bDNCYnZKL0ZycDZSMThnNnFoVGFlQ1N2?=
 =?utf-8?B?aUNSNUNWS2VrNHVqV1VIbkYxQU94bmpiYjQ2S0x1Q0F1TkhHUmU2YVYxdC8y?=
 =?utf-8?B?VC9meVk5OTJqM2lJU0VjRlV6S0VUS1ByS2Q0UVVXQzhMcHFLWURQWHd3Z3pU?=
 =?utf-8?B?Ukdabk9mSDgxRDB3OURkK3NoaEc3TWpPZkZlZUd6akdVLzlTRzEzNE9IMlBU?=
 =?utf-8?B?UFN5U29UNStCRERFdDZ0WU0rdVNDQU1CT28rZXNmSmRPWlVmaWFCU1dzYVBO?=
 =?utf-8?B?NXFLNTVtcXVCbUltZ2xXNDlMR2xPU1ZMOVBsRU5tQXlVQnIrU0FzSEErUllZ?=
 =?utf-8?B?ak1wNHJKRjlOcVdia1hRVEtZWlZqZkFMekZlNzQvUnBoSGR1N0E3RmJIbmUv?=
 =?utf-8?B?dkw1ZkNEcTBiTnltUjNFb2lZZnlyclJib2hMQ0FPbk9wT1lJRmZPc2hSejJE?=
 =?utf-8?B?b3BwbEJ4V3NXZjUrc3FmMitrdFpnVm42UFFDeHA1ckRyeHF6dG1IWlQwclY2?=
 =?utf-8?B?RWkrQXdJbUR3MnRCcGFmd2lrKzZnNzVpeHFGY00xSStBUWhtSVpmU0x2ZHB4?=
 =?utf-8?B?eDYzeWZjRjRqS0NGajFnb0cwME1Wa3Q1ekthWEExckVob2RsMmhQaTdsQWpO?=
 =?utf-8?B?aTBBUjBxNTVKY3ZDNVpONDVmNmJDYkRzeEs0a1ZMTjdrL3pwZ3RuNDI2ZmlQ?=
 =?utf-8?B?aG5QWWIrU3g1N1FZZFpRcVo3MGJtVnd6LzRpaUdaYThJQllxTG44c09vZjNI?=
 =?utf-8?B?T0h3VEFSdWFGOVFVd2R6ZnJld3ZnTnVhbWN2VXVVbTZIOWVNQUJWUHRmRWI2?=
 =?utf-8?B?b3dmd0NRQjFITnh4eEgzWWZXZUNMWjNVU1lBQVdNSmFUYXVsdFZjYXJKZ2Ro?=
 =?utf-8?B?SVM3RjJUYktNbWZTR1FteXlxYjBpMUplYm10czd5aVhMN1VOUFdFcEQwQ1RC?=
 =?utf-8?B?UHFJOTl6OUpKa1h5UE9CY3lSeVczRDdPc3hGRklTbjk1RFp5QjlzYzZhbXVK?=
 =?utf-8?B?TjFSTDVWNSswenN1emczWU5SY3hIaUhLM1VvaWJXTjZJcUlERkd3dU9UZFVi?=
 =?utf-8?B?cjRPMnhOeS8rL2hNeTg0UDlIeW8yem91QmJyWFhQUS9HU2pMVUtoejRGRVJz?=
 =?utf-8?B?dTJNdWl0OVFZcENYOFcrTFFua0hxdmZML01Va0hxK3VtZE9wUHloMFAwa0p1?=
 =?utf-8?B?VnJ6bUxRZXlobEE4U2YzOUFqN3BxaWZDSHhEV1dON3d1MGVVSlNhZWs5bU9p?=
 =?utf-8?B?d01acUdUNGExV1NWNUZrdEdtY0g2emZiV1ZVMWJRNVN6ZXRJS0pQM0IxMGxY?=
 =?utf-8?B?b25YN05zdUNrWVZIcHFCa2wrN3ZNL0graUZWUzFaY3IzeFgwbjFPNCtMcjh3?=
 =?utf-8?Q?nP0GsP0WqoY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVBhUnd2UVB2WnBNM2VQQkQvUlMzSmlid0NDQkswWGxMbFZYK05oSVFBY1lw?=
 =?utf-8?B?SGwydm1oMVU3SjNGOVJhdWhZdHhpeGMxZkRreDA0U0l3VkVVV3dGN1R0VWM4?=
 =?utf-8?B?ckJTY1Q1L2diU3BEaEh5ck01Nlc5SUtLelZVYVhxSks4WXRYRE5iZSs3eEo2?=
 =?utf-8?B?RnpLL3ZZb3pBMFJBSFZvL0N6SThQYzc2MVZYck5FdXRqa2tUUUJtc1UyZXNt?=
 =?utf-8?B?cER0N1dnalBvQlV1M0Q5cC9BWGhsaWNsd3dMOHRqeTRBS0hVTVc4RGpTZ0E1?=
 =?utf-8?B?b0RaNEMxNVBCS0tqam85YkkyVGl2WldrcVV6TU5zdFB1N21kbDErcFk3YkVJ?=
 =?utf-8?B?SVdJOFdzNmJSRTA2RmpIREN2NnVhUWVXOEp4UlNNRTlIRVFkazJnWDJ4NHQy?=
 =?utf-8?B?QThlM3kvd3JaMHYvVG40ZHR6MDZXemxnb0FIdnk2MTZVcHNRcXl4SUZhTTla?=
 =?utf-8?B?UXIwMGhJNUg3TzhEc3FUOXM3eFZmNEs2MFlXZ0RmNEY4UWo2NWNieFZqUDZR?=
 =?utf-8?B?c1VRMy81ZWFCTlJsS3JDdHRNY2dGYkVEbDRzWjZaNGVTV3NCMGptSWVCZ3Aw?=
 =?utf-8?B?emhkK0dNZmZCZ1IwRWdkZmhOSEhEbURHcjFSOWpneHBGODBaalY3OEozY1ll?=
 =?utf-8?B?UytEN0pSUy9SbUxzK3hsQlh4WmNRNStOSTQxZVVpZWNCNmtkTHVLUy9RUnpE?=
 =?utf-8?B?RUErbUFMRnROaEhXdEhURXZ1dmhrQmhLU3czVUFrSFRib1lCeElHTExhM0Zz?=
 =?utf-8?B?L0Z6QnZNRXVOamJKZXNwOVVvcHhOUE0vOFZnQTh3OGh0eHdmUjRzRTZ4SUZ1?=
 =?utf-8?B?TklFS3J5dUhXaTJJbVNKN3ZBQkhwZ1E0dHdnK2lnN1hzcVZ0UU5IaEpEcndw?=
 =?utf-8?B?Q2RnS0pxUU5aWXFwZmhEV0dqL3Ixa0xueUorN09JOFVCc0FsV1AwdjUwM0dQ?=
 =?utf-8?B?enk4dDhuakdYTjBXYUhvQ2RBT1NGZFV5aG90dDZwUWpXem1PZkFHL3NNem16?=
 =?utf-8?B?azlaR2ZKYS9Ubk5ibVQ1NzVlLzRPTzJHWmRrY2RnZTV3NEpTMzJUSW5uMHQx?=
 =?utf-8?B?Z1RTbjJpNXhHZVkyYUd1c3FFZWpHUE84V1ZjYUdwcmRJdURlZkdYY3pWZmtT?=
 =?utf-8?B?TlpFYkN2RjEwUUtnUnEvcVFGOG05ekE3YjJhOGdRQ0lXODRMTjdBZDNuVjQ0?=
 =?utf-8?B?QU5NRStvUnhFNzZuWWVneUZLd294MjRPc1V2T25Da0lDb2NxUldBTzlsMHBP?=
 =?utf-8?B?am9uT2M0VW1zdmczVGUrNkdQOS96RmdQNGFBK25RT0o4UWhqSEQyRWUwVWx4?=
 =?utf-8?B?Q3l0ajNUR01naDlEYTZTdHJEQjRwUXhSV0VaWDJLTEx3V3Qya1REaGxRMWlP?=
 =?utf-8?B?d1hzNmhwSmQ1ZEJFenBGSzczUmo0em5ZVU5TQ1U1R2FDK0JJYmRKNjV0aHIx?=
 =?utf-8?B?ZFYyTnB1UlJYa2YxcHQzSDVwQk9yeE16N3ZTT29Yck9uSjZvU1oxSUp0NjR3?=
 =?utf-8?B?bnpFejBYY3BzL0xmSnovUTNWaFJiWG1iK1Zwa21mU1BXS05aNnZUamRrdGU4?=
 =?utf-8?B?TTZobGxQRy9KdDREVmg5NFlOWkRQSE1YMjRQam9TTUsxbHRFUTZPRGorb2Uv?=
 =?utf-8?B?dWd1QUNGeklEMnpXWXRDVWM1OGViNFNDbktGRzM2bTFaWmZNZFU3amV4YWFE?=
 =?utf-8?B?QU5NUFU4WHZKWlQxUVJIenBNcWZ4QTRLeU5XdnJGMmlSMUJiWlJuWVNLMHFh?=
 =?utf-8?B?ZUpBMFZraGsvZzhyVGE4Rms2ZlBkZXVJV1hVdExiRTE3MFlRQUlYaHlGZlpE?=
 =?utf-8?B?d2hyVkFDMGJCdVNLZEU1Mklsc3UyQ0NaUWczUGw1a1RlbHZyVmpyOXRYU05W?=
 =?utf-8?B?ME9jbjNqTWxEZVNmOGh1Skt1aWdQTXdvdGJ4dGkzelJUY2NUUlJ1RG1nS2ZR?=
 =?utf-8?B?TDJ5bW5URG1SbG5GRmV5NHlLVE5XbDhPN2NYYXA1WGlvOHoyN3hXVGhnWkhT?=
 =?utf-8?B?NE9wbHcrY1k5TG1XcGdteFo0N1QreUZZUEZJVml4a3RteGMzWDJNa3Y0K3p1?=
 =?utf-8?B?b0o3bW9xbm5WeW5GVUdwNTlaTlE2VnZqS0NHVk1HdHZkdENpd1dFUk5GL3oz?=
 =?utf-8?B?SEpoQkMwMHVBa25ZK2Jwc0dRbEt2QjlNN0xUaFc5Wmw2bW5YbjVmS2ZGeWZa?=
 =?utf-8?Q?rqJ6hO8OdzQRThkOTAE3mFXCaCG5zSOA0iRAcWrNWDof?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e40d5c0b-b7fb-4240-e76c-08ddc2843315
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 03:12:00.7014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LVmcITno2DngecQa9XyL1C4LYFUuIAtnyN3LoKmk1RDLfw4Lo4kv9FnJxlaFKtzrlHbsaWAjvNNu4Gsk6WSFiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8174
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

On Sun Jul 13, 2025 at 11:51 AM JST, Rhys Lloyd wrote:
> Introduce an associated constant `MIN_LEN` for each struct that checks
> the length of the input data in its constructor against a magic number.
>
> Signed-off-by: Rhys Lloyd <krakow20@gmail.com>

As I mentioned in [1], I think this would be better addressed by working
in terms of `sizeof` upon the relevant structures, after making them
`#[repr(C)]`. It might require splitting them a bit since some contain
other data (or we can maybe turn them into DSTs).

[1] https://lore.kernel.org/rust-for-linux/DB97X8JAJFI4.3G1I8ZPC1MWLS@nvidi=
a.com/
