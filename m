Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A3294E531
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 04:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9170710E078;
	Mon, 12 Aug 2024 02:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="i+MO6Cs9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2055.outbound.protection.outlook.com [40.107.255.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740CF10E074
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 02:49:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eXMaHreQSg3Ksr3JPvogjlnyn/BpqS0oq09SMZ9AS1GrWsL5Mn1a4PYUrSIyHpFehQUcgoi+YMg3StyXDiPu2WPBZiro6ydc/U9/6DAJr4vqKtKht7++ZPfqY5FRilrRlOf8w0yM/zshS+P/TA7QMhxuebGj05vpSN/7Kp5ZFKY43tHzPo70Iny1GkkPmbkzpm3kYtWPXK8U0aVBcylXWfGuXvHlifWI1RYtbhQkMy+m8KpgQaiV1HTaoegWiUUjQzVm3RBeZXGugwye/4FOj3y6ohytsOGuYG/OND1H4xsZkvzyKmi1RFL0np5LoN8qxdkknCw5bGOAL3F1Jg1rlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WYrCnC3hUuMxQavyY8WSYIiP9841QsCpQDhDUoDnCNM=;
 b=QuXoo4WylvxXXAilB6gV1We6oaouZ7QoZSoNv9rd+9jnq2Sbe2m3VSCcFPUG5tibAbyJhxuB5cstRSVW8vSnIYyZCHftZPqCzo6PxD9wFuBngneihKtOWOOcm+Y4lvMrGtNngvOBdFi10E+TO056lYsx/vI0Ji1zUQRy0r7fSxBeqUaDZeCWFllDfcvlt5BDa+T6WTXSNt8GAPG4uArx58SwWTFTnllap5fDUd0JTnLQFqtuXuUEBOvBuG2+Jvi5w/9m3hP6mPO8sl32HUh2s12bht2aYr7FxiJooGU1Lb8Hn2hpMcrDevxu04qMrJGALAHH7U2O+6zmffaPRoccrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WYrCnC3hUuMxQavyY8WSYIiP9841QsCpQDhDUoDnCNM=;
 b=i+MO6Cs9QqrQqMbwr1Rk1e/5THJAqF2hc0dKn5HYEUQRjoAZ7IXA85O6l0ZSlFZO50SruzyvranUB28kpHg97f27qciEczXokaPr+J2JDqRpiHYxlER0/cay1yjsic8yOrB3Nidd5bg3uqy0ZlK9jJFMN0Yau+sJ0+I2uTfwE73i3TrGkpQG6IISQGLf/5nlipMwETMlTbuFOM6ZpWU/fqS/lOxAlk9J8bpgRW5uXdAIghlG63ru05Zzd/Af6yVikHmXjS1B2UGDvSOKnlIojJcndiWQGOsjiD8w7tU5JV9izOgJkiMANBRGFx3l3KnNjQ1M9Js7LqOx3Hm3bg2efQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by JH0PR06MB6477.apcprd06.prod.outlook.com (2603:1096:990:33::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Mon, 12 Aug
 2024 02:49:48 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%4]) with mapi id 15.20.7849.019; Mon, 12 Aug 2024
 02:49:48 +0000
Message-ID: <868bc7ec-762e-4932-b004-e82df915fa97@vivo.com>
Date: Mon, 12 Aug 2024 10:49:42 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] udmabuf: change folios array from kmalloc to
 kvmalloc
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
References: <20240805032550.3912454-1-link@vivo.com>
 <20240805032550.3912454-3-link@vivo.com>
 <IA0PR11MB7185DFA89A4A2058F4B336DBF8BB2@IA0PR11MB7185.namprd11.prod.outlook.com>
From: Huan Yang <link@vivo.com>
In-Reply-To: <IA0PR11MB7185DFA89A4A2058F4B336DBF8BB2@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:195::16) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|JH0PR06MB6477:EE_
X-MS-Office365-Filtering-Correlation-Id: 26860469-51ed-48b5-3a2d-08dcba796dcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXF0d2RKTkJsa1B4blJoeUMrSlZNZ3Rybm5wYU9SUkZrRmh3d3VlbnhZdmhn?=
 =?utf-8?B?SkxYNkh0RTRHcEpmZSsyZWVKVmM5WGJadmxkN3M0WkNybTVoK3BMWXhlUUc0?=
 =?utf-8?B?MThVeEN2cDRYeVFXTytmVHZBUkVhZml5VDIzdWdvYXJrdVlZN3NWdndWYjhB?=
 =?utf-8?B?MnJBT3RSMExRSTcxT3l0SzRrK1pFc2k2QkI2Z2pqVEVFeXlCUk9OSU40dnVU?=
 =?utf-8?B?blZBSHVlMkxualUyeEFYYVFXa2czaXRxUVdXY2pJSjhnWnYyNlNOVnRLMWxl?=
 =?utf-8?B?UFN3MmR5TTJjVit4dW9TTFlzbFNDZ09PRmhGd0JmQWxyN1lBRkM2R3BNZTd0?=
 =?utf-8?B?YUYxVW1ISmMyR2NhRDFVMUt0eXVZVXREY1ZRR1ltdXErSkFNL2pDUW16eHd2?=
 =?utf-8?B?eUJrMmFkWEhNU3BxY3ZqOVZ4NHNESXo3c0hHQ0ZSLzVKdDNYTE5hUjhMTEpD?=
 =?utf-8?B?TWJJNDlLdXFOM1ZQeUlOR2xXeEpiL2l4VWsyMkQwUitUK0hzeGlOa2N0NlRS?=
 =?utf-8?B?d1pRMWpkb29TU0greWRGR3pKQnRSd3VabDV2LzZ0b2JDTE1laHZENFN2aDdK?=
 =?utf-8?B?QW8xa295b0VlSFd4Sks5U0czcGdzWmdGNk94VFlTZTdVM2hrK1JxbTR2dGVt?=
 =?utf-8?B?VlU2aVZ1LzlFNENTa04vTEZIb2VVUXp0QklOR1dNMHVmazc2S2Z3b0lGM0tP?=
 =?utf-8?B?OHJJRWlFQThMM25EdS9PdGV0NllXenZZdDlhUUZYN3dhSVNQcDVqa1NvcUM5?=
 =?utf-8?B?RVZGYWdFb0RZN2daV0F6c0c2UXAzekltbC9VQXhLTVhHTnNKV24zVFFNRWFn?=
 =?utf-8?B?cko2NnFPbUd5UnB6NjNQL1J4b0ozY2h1M2JhV1Rlb2NLejBRbDdaYzREaE5u?=
 =?utf-8?B?dG13UEZoT0pTbTV5aWNsYURmdDlOdGxmSzRGU0lJUHMrbXFpRzYrOW9GRWhH?=
 =?utf-8?B?aTRyMmxXTTU3bXhLSlpwdUZabU4xeVhqTzRkeVBjYW9pcE5wcHpPVWpiNE1i?=
 =?utf-8?B?enhsSHVEUk1rcDFidWJVNWRHUnoyclJpWGZnK01wSjZ3UE9LYkFtRVBncTJS?=
 =?utf-8?B?dDZlaGw4ZnBlNWVYUlEzd2NsdU1JQVZUN1lzUkJyZXVTTGVhdWFmeXhiSFB2?=
 =?utf-8?B?c0tWZXE5emI4cnNvQUNIaXQzQzh1dXdmVzVsTnNGRDQ0WUxXVWk4Mlo4clRO?=
 =?utf-8?B?SktVMW5aQkhxc1hhNDRrVkF0ak9EQjE1ajI2NlBjdUYvWWtHOTZ4YmQ5b0gz?=
 =?utf-8?B?N0tOaFlyalQ4WUMzaDY4RHBXbG1iYWgvSGR2VW95djZCbWwraklHbGJlTlhs?=
 =?utf-8?B?M3FIU3hIUXU0UXVEYXVSOUJNZ2Vxb1RiUlliamhmZk9ncEVrREthSVNtYzU1?=
 =?utf-8?B?dE9uV1VIcU0xeHp4TVp5YUZmNnpRRXFxZGkrQ0pXSTNydWp0Y0dUYWE3YjZJ?=
 =?utf-8?B?azhQa1VKcCtoUWRzZjhBNHgweitHMGRDTlM5K1p6OSsvUG5Md0FYVjZHSGpH?=
 =?utf-8?B?cnU1STVObTNYa2JJc2JtVWFPZWhmb1o1aTdxWlI3dm9RUnBMS3pCZ2ZNTStJ?=
 =?utf-8?B?Z3lOVlZ2Z29kWGQwUFRpV2NjdGlzZmQ5UnJKVXBUNXRuaU5EemRySVpMalZT?=
 =?utf-8?B?OEg2MDMzUjRQcDRSY1F3YVpNNFl4bDJ4MDc2ellBRG9WQjUvYWZsVlFHTVpm?=
 =?utf-8?B?NHhkcnhKbEwxcjVnVGFvWFdObThoSkljL1QxUGZ0TStPTnU4Y3p3RC9qWkRM?=
 =?utf-8?B?b0FtRTV5UzF0NG5CNUFkZUkrWGprdXhQNWs0b0ErTHArU1FJRTRnZnpLMnBi?=
 =?utf-8?B?NzljK3dnRkJlRjlkeHNVZnpOMUhid3FKUTVDcXQ1UElsTnBNZ25mTE9wUTl2?=
 =?utf-8?B?SjVjTWVBK0oyRnNoQm9jeTl2TnZhY3crbDR2aXZiM2k3cGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGlaZFFaTlJYSlg2bWVIUEZ0MDc0RUp1RWl3dWFMVytPc3czTzBVMW5GTXlP?=
 =?utf-8?B?Y1VUN1NxWDIwTzZhTVVqWjQwaEU4MEc0ODI4SWZydkN6alplTDV0U1ZLNlNK?=
 =?utf-8?B?R1dsRmVsd0I2V2dIL092ajA3dGF3QUlKdlZvRFYrWDVTUU5BREZLMzdmN05s?=
 =?utf-8?B?NlNUZE9oSHlLQ04rNWxXME90MnJrS2dSQytvdVRuOXA0d1QzT2NER0FReHNw?=
 =?utf-8?B?a25vMHJGeEpQMjFiY3Y0NDZiSzVMRlAxcG9hRU9zOTVMdmtyU2FpMm1lcmpm?=
 =?utf-8?B?QUIxSm1MRnhTOFZvemcrK2xMYWtleE9nYk1wM0NrOXdpUDVlQ2JHNjdaUWFW?=
 =?utf-8?B?aDc3dnJCVUN0dzI5NVNQYU9HQ3drd3Y0UjJIRk5NNXlzL0w4QjFFMTVvcWlO?=
 =?utf-8?B?UXFCblpVZTFOTDVmRHVpdno4R2xERit3dkpqQUZpQ1krT0FuTzBSdGV3YUxv?=
 =?utf-8?B?UU1lcnBkWndRTktlMElZaTF5SzdtUytYa2RDcGlkaHFVNmMyMm05R1hqZE90?=
 =?utf-8?B?QUEzbzZ2djlDcEcva2xlSE56QjB6LytlaWVQN3cxOEVOTU92MmNqN3JyMTBt?=
 =?utf-8?B?c2hFSU1SL3oxWG11dDJEWHJyR1V6dmpxVkJaYlBCVHpSRmVaRHg1ZEt3Sllv?=
 =?utf-8?B?N1p4cldlUncrK29iZDNJV3ZnbmJ3MDI4MHpqT1JpTTE1aGNvZThHK2loUW8y?=
 =?utf-8?B?MDR1MDFJRWJXQkFIdE5zWUUvNnVIQi9jem9YNVhIekJFYVdKWHNsdUJIUUpv?=
 =?utf-8?B?cUJkVGNPdDZyNlpvc1JYY1E2Sk1YS3dtM1NGUWtPQ2pmdlBha00wdW9McCtQ?=
 =?utf-8?B?Z3FMR1E0dmZidjJYeVBlYWoza1krN3ZlaC9ScGhRUkgwWWF5R0k0Z0dSemdM?=
 =?utf-8?B?NEUzZmladVB1Q1RNU21nT3A5MTJyODR3WlI0L09XT3UzU2tpZnJ0MFZLOFd4?=
 =?utf-8?B?YWUwTXI5OW5PYXBVcFdhUmdHK1VkaElObTloc2F0aFE0dGdxWkovaHk1bzIx?=
 =?utf-8?B?YVBVV3F1ajdFdDFTS1orNjVkRE5tVmpTR1l0a1gwSVZiWTVvbExVYTNqWjhB?=
 =?utf-8?B?S1FCRnlBekwzUmp4blcyR2Y0RjVERVB1dHY0N2NkekFENXVTd1FMTGlJMW90?=
 =?utf-8?B?MlFJemppNGdUcnhWMkp5S1liTmxOc2NZRCtEelQrVEFNK25YV1lCOTNJU29Q?=
 =?utf-8?B?V085M2lZOGtXYldMSjVwTk5nbjhaOFV3OG8wNkRtUGZaa29HclJ0c0lZbXRQ?=
 =?utf-8?B?b2ZOc1dxNXpvWTF6M09XMFdEU1lRSzNJR05RTUR4OHdiMklyUGdTellQdlB3?=
 =?utf-8?B?cTBaV1VaR21jclE5bzFKbXRIcUgweExPMDEvWUs2T2Q5QjVqSG83VmxBZlE5?=
 =?utf-8?B?VG5PNnBWTVA2d2ZlSENHY29OMEpwLzFhY2FZVWlSYjBNeWc1OXBCQzZxcHdF?=
 =?utf-8?B?d2xXOEJRQm4vSjQ5KzQ0K25WcFR0a01qRlhOeWZCRVFJUUc4SFkvQStsazA1?=
 =?utf-8?B?YVRQeGpPcWZ2UVBLa3JDMXc1bS9SZDFxWStCZks5dVdRdlZ4blFjWmVqbU5r?=
 =?utf-8?B?TEtRZWluclVIekRwbnVkOFJvekZYTWV1V2djbkIvNFl0MUpOdTYrZDNLTGFq?=
 =?utf-8?B?dFVQOG9OWGxnV3dKaEdyaXNjakhOZ2tPdHZDbjVrV2NrUHRTS25vUitZRk9n?=
 =?utf-8?B?RVVZSE8rSC90MTJoOHozL3JocENOMTJQbDh3S3ZpQmNuWGJCTlJWZndYQ1V5?=
 =?utf-8?B?MW5neStpWUlVWVlqcDczUGVGdTRyeCt5K1JYUGEzVXhHVGhpVjYwdmlidkgz?=
 =?utf-8?B?T1dWUkVhOTVXRGRoRk9JSXVrNVcxTVpKSkcxMmRGU25VS3EyQlBoNVpYMkZo?=
 =?utf-8?B?SVBwQVY1dXFlSFd0bGhOZHc4Ti9Jb3ROclhBTDBIeWlIMGtkZWp5N0dBMWhr?=
 =?utf-8?B?b0JscVV6V3ZPR2FRN2Vxc0NHbW8zaEliMFdNbjhWWGh6UWpjMzRkRFRDdVlN?=
 =?utf-8?B?SVNxbkpnVm11TTd5VTZFemV0ZFVWNy9DOFdsZEJyVjc0Ujd5b0VHUklGM205?=
 =?utf-8?B?MEphamljaFdZYjJiWHE5N0p0enBPc0xTdHNZQTNxZk1nRTdlWTRjaGthalZJ?=
 =?utf-8?Q?RkXBQz3eqnLLpq04CVGbiSpPL?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26860469-51ed-48b5-3a2d-08dcba796dcc
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 02:49:47.7325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RV6K78vI4Q6GfaLDtSFhvzJ8GT3iVqrU8PHrWAsIMdFuoIyb/2Bq7OzBKqvg4iFNyiTtE6uj+tLR3uOHSWqG6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6477
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


在 2024/8/10 9:29, Kasireddy, Vivek 写道:
> [Some people who received this message don't often get email from vivek.kasireddy@intel.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Hi Huan,
>
>> When PAGE_SIZE 4096, MAX_PAGE_ORDER 10, 64bit machine,
>> page_alloc only support 4MB.
>> If above this, trigger this warn and return NULL.
>>
>> udmabuf can change size limit, if change it to 3072(3GB), and then alloc
>> 3GB udmabuf, will fail create.
>>
>> [ 4080.876581] ------------[ cut here ]------------
>> [ 4080.876843] WARNING: CPU: 3 PID: 2015 at mm/page_alloc.c:4556
>> __alloc_pages+0x2c8/0x350
>> [ 4080.878839] RIP: 0010:__alloc_pages+0x2c8/0x350
>> [ 4080.879470] Call Trace:
>> [ 4080.879473]  <TASK>
>> [ 4080.879473]  ? __alloc_pages+0x2c8/0x350
>> [ 4080.879475]  ? __warn.cold+0x8e/0xe8
>> [ 4080.880647]  ? __alloc_pages+0x2c8/0x350
>> [ 4080.880909]  ? report_bug+0xff/0x140
>> [ 4080.881175]  ? handle_bug+0x3c/0x80
>> [ 4080.881556]  ? exc_invalid_op+0x17/0x70
>> [ 4080.881559]  ? asm_exc_invalid_op+0x1a/0x20
>> [ 4080.882077]  ? udmabuf_create+0x131/0x400
>>
>> Because MAX_PAGE_ORDER, kmalloc can max alloc 4096 * (1 << 10), 4MB
>> memory, each array entry is pointer(8byte), so can save 524288 pages(2GB).
>>
>> Further more, costly order(order 3) may not be guaranteed that it can be
>> applied for, due to fragmentation.
>>
>> This patch change udmabuf array use kvmalloc_array, this can fallback
>> alloc into vmalloc, which can guarantee allocation for any size and does
>> not affect the performance of kmalloc allocations.
>>
>> Signed-off-by: Huan Yang <link@vivo.com>
>> Acked-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/dma-buf/udmabuf.c | 26 +++++++++++++-------------
>>   1 file changed, 13 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
>> index 475268d4ebb1..af2391cea0bf 100644
>> --- a/drivers/dma-buf/udmabuf.c
>> +++ b/drivers/dma-buf/udmabuf.c
>> @@ -73,7 +73,7 @@ static int vmap_udmabuf(struct dma_buf *buf, struct
>> iosys_map *map)
>>
>>        dma_resv_assert_held(buf->resv);
>>
>> -     pages = kmalloc_array(ubuf->pagecount, sizeof(*pages),
>> GFP_KERNEL);
>> +     pages = kvmalloc_array(ubuf->pagecount, sizeof(*pages),
>> GFP_KERNEL);
>>        if (!pages)
>>                return -ENOMEM;
>>
>> @@ -81,7 +81,7 @@ static int vmap_udmabuf(struct dma_buf *buf, struct
>> iosys_map *map)
>>                pages[pg] = &ubuf->folios[pg]->page;
>>
>>        vaddr = vm_map_ram(pages, ubuf->pagecount, -1);
>> -     kfree(pages);
>> +     kvfree(pages);
>>        if (!vaddr)
>>                return -EINVAL;
>>
>> @@ -189,8 +189,8 @@ static void release_udmabuf(struct dma_buf *buf)
>>                put_sg_table(dev, ubuf->sg, DMA_BIDIRECTIONAL);
>>
>>        unpin_all_folios(&ubuf->unpin_list);
>> -     kfree(ubuf->offsets);
>> -     kfree(ubuf->folios);
>> +     kvfree(ubuf->offsets);
>> +     kvfree(ubuf->folios);
>>        kfree(ubuf);
>>   }
>>
>> @@ -315,14 +315,14 @@ static long udmabuf_create(struct miscdevice
>> *device,
>>        if (!ubuf->pagecount)
>>                goto err;
>>
>> -     ubuf->folios = kmalloc_array(ubuf->pagecount, sizeof(*ubuf->folios),
>> -                                 GFP_KERNEL);
>> +     ubuf->folios = kvmalloc_array(ubuf->pagecount, sizeof(*ubuf-
>>> folios),
>> +                                   GFP_KERNEL);
>>        if (!ubuf->folios) {
>>                ret = -ENOMEM;
>>                goto err;
>>        }
>> -     ubuf->offsets = kcalloc(ubuf->pagecount, sizeof(*ubuf->offsets),
>> -                             GFP_KERNEL);
>> +     ubuf->offsets =
>> +             kvcalloc(ubuf->pagecount, sizeof(*ubuf->offsets),
> No strong opinion, but I'd prefer to keep the kvcalloc on the same line.
> Regardless,

This style is auto formatted by my clang-format with .clang-format set 
in kernel.

But, I chang into online:

     ubuf->offsets = kvcalloc(ubuf->pagecount, sizeof(*ubuf->offsets),
                  GFP_KERNEL);

checkpatch  also did not report any errors.

So, I can send the next version of the patch when needed.

Thanks.

>
> Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
>
>> GFP_KERNEL);
>>        if (!ubuf->offsets) {
>>                ret = -ENOMEM;
>>                goto err;
>> @@ -336,7 +336,7 @@ static long udmabuf_create(struct miscdevice
>> *device,
>>                        goto err;
>>
>>                pgcnt = list[i].size >> PAGE_SHIFT;
>> -             folios = kmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
>> +             folios = kvmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
>>                if (!folios) {
>>                        ret = -ENOMEM;
>>                        goto err;
>> @@ -346,7 +346,7 @@ static long udmabuf_create(struct miscdevice
>> *device,
>>                ret = memfd_pin_folios(memfd, list[i].offset, end,
>>                                       folios, pgcnt, &pgoff);
>>                if (ret <= 0) {
>> -                     kfree(folios);
>> +                     kvfree(folios);
>>                        if (!ret)
>>                                ret = -EINVAL;
>>                        goto err;
>> @@ -375,7 +375,7 @@ static long udmabuf_create(struct miscdevice
>> *device,
>>                        }
>>                }
>>
>> -             kfree(folios);
>> +             kvfree(folios);
>>                fput(memfd);
>>                memfd = NULL;
>>        }
>> @@ -391,8 +391,8 @@ static long udmabuf_create(struct miscdevice
>> *device,
>>        if (memfd)
>>                fput(memfd);
>>        unpin_all_folios(&ubuf->unpin_list);
>> -     kfree(ubuf->offsets);
>> -     kfree(ubuf->folios);
>> +     kvfree(ubuf->offsets);
>> +     kvfree(ubuf->folios);
>>        kfree(ubuf);
>>        return ret;
>>   }
>> --
>> 2.45.2
