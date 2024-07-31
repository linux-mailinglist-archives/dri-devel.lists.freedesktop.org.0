Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA671942448
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 03:48:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D5610E13B;
	Wed, 31 Jul 2024 01:48:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="ZUTqNDJg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2047.outbound.protection.outlook.com [40.107.255.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F03810E13B
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 01:48:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c9uSL7oc+qs8ymMDmULMYRRt/hAf08J3mLcoPXTyhFpRmYYt9SmyHLrB1jF9OF2uJE+p9Qx5dIDAE3Ir6Ovmnp6Mfwcjwdm9uV45cv15AHZu1EDqv3Yg4hEJEm/PJ+QziMb+s1KTbzaSvHbmS4X/0EJfLndx2xDGvxomuQ3JzWJFXlHQdVW+G5XKD3pvrg9twK/SqaxvuENr1ProOEd6XOug9wA8pefDGRJLvKd1yAZWca9tPyMgFogVbxzSNZIz54UGu1MVGLKrkIGgUw486f3TbCqpi5FxN/MMk8QgdEkvMm052mj2idvin3ezbJSjUu74DnimwJ7az91RVLQtSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JpaFrK+6UpDrkn6uZpepRq7EXV6VnE8qa6BdH0m7ojE=;
 b=eJrA2GAelgljCRMsYpAwLmyKOA9HtbPSvHtL6ufAJJZ83IWaGf2QE+vMy+CzZTHMPhUEsMzZjk892U/F563rXPFR03ogTvgWR07dkmfzDYAl6JeFFR4ZVPuvBX7SxaLQ0xuUyzT+RRmD0zIPaEBDk9lNGTpwBHAH0EVdeZsm5/CWQsqzVAPq2RtCc9gOHoHaOcwO76NzfeyQeo014Ea9PALuK+O2htNV38EsFOLUHYiThfme2Jgqp67l31XpqOdyN6Gngst+35zJXA0IhlYgTp9mIeOY0ZCNpdJ+kdvM9aQ0pOXc5ZYt2fASnuLL7enTRaItyTzC7xcU3JUkye2v/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JpaFrK+6UpDrkn6uZpepRq7EXV6VnE8qa6BdH0m7ojE=;
 b=ZUTqNDJgo2Wg7v8iibAZiUOagUU3GIDnOQ3szkmxHRSpdllNGNhxvU7CFQpIIqB67KRI0nK8o/pqznUdQmVBzHSotaWPAQ6F2us/6TJagD0hVihrR+wC+kIDa/cdD3rg2NrR8ZIgh037cxrynhr+SNqeeKac62M+LkfQJGXDwWBAbFxbQMwIM6+K83PlKoA9lOJlkUDCDorzSAdJhfJMnYqLH7+5GCMX4ZkmGuz2yGYLaIpqSfIqkgcf5LfpKZ3PSUW2YqWqd6Ahg2b/dmm2W+yLn7fXvEyNQZmj1oSuSrZ6DBBW0nKOHhTOlCLw3CxXx/A7FmM6TkfzUUJoE2Tfvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by OSQPR06MB7131.apcprd06.prod.outlook.com (2603:1096:604:29a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.32; Wed, 31 Jul
 2024 01:48:13 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 01:48:13 +0000
Message-ID: <3ca3588a-fd09-4117-9f96-4d935e0295e5@vivo.com>
Date: Wed, 31 Jul 2024 09:48:08 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Introduce DMA_HEAP_ALLOC_AND_READ_FILE heap flag
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
References: <20240730075755.10941-1-link@vivo.com>
 <d2f56198-a3c2-4f7b-9d10-616deb348351@amd.com>
 <966651c0-42fc-4827-bf3e-2170dcf4688c@vivo.com>
 <d5d7674b-eab3-465b-97eb-e33bdbecd7c0@amd.com>
 <79b51a8f-9c28-488b-9be7-b5ce715aa1f2@vivo.com>
 <d8529566-249d-4ae0-87fd-04cdc7e4e573@amd.com>
 <2d94446c-72d1-4c4d-b7e0-696767b98654@vivo.com>
 <06c7266f-8789-47fa-bb42-a18c9d15a87d@amd.com>
From: Huan Yang <link@vivo.com>
In-Reply-To: <06c7266f-8789-47fa-bb42-a18c9d15a87d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::11) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|OSQPR06MB7131:EE_
X-MS-Office365-Filtering-Correlation-Id: 55f92d10-cf2b-4504-82b2-08dcb102d6b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|1800799024|7416014|366016|376014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RThzeDVyNW04alZpbjBTM2tYNW1DemR1SnQ2WWVHSmlKeURWbjlZWXNQQW1l?=
 =?utf-8?B?Qkd3RUcrYkszSTFWSXhLMnVUajc2SzZPOUFzbjRGT3JCeVZlMFpJY2tETlN2?=
 =?utf-8?B?aDNFWEpLYkFGOGlrZFJ4S2lVTWJtRHlQckRuY21Uek93bFpWa0poRG5GRHNU?=
 =?utf-8?B?TlRCOUdsSGc3MUZ3cU1MS29uN1VIR2RyNVRiaFFIbWl5alNBeFVOTXd5MXli?=
 =?utf-8?B?OUsrVnhCdjhZS3RlaUpBaUNTbFAzRlFxN0tXa2EwTzJVTy9ONlQ1ZjFLSzRw?=
 =?utf-8?B?WjB6L2tBV2xJSUprVnVwVHNVRVVzZnpiaWtHOWM3L0lDUG9DYS9TVWJXblRZ?=
 =?utf-8?B?eWFDQW9wMWlCdjY1SEo3M2VqZ2svNGRLL3BWaEpSZVhXcTMvRi9NU2VHdXFh?=
 =?utf-8?B?TWxvTW9CZnhFNytZQkg3Rytoc0FwekFHL1J3dFZTbGx6dHpQbExDamhrNldY?=
 =?utf-8?B?R1habVlxSmU2MHdLRlo0REsvVk53ell1N0dIS1NUU2ZkbTU3ek5pMHZPRkw2?=
 =?utf-8?B?b0VIdnp1VXhmQkNySm96UjVlSnBya3JXTldza0R2eGY4dUNSaDNHWGVwSXNt?=
 =?utf-8?B?TUgzV254WFkyb25HY0liYjVuVlhpdWZuTk9Rc1RaMTFDRXpoaFNBa2kvMXBY?=
 =?utf-8?B?a205eDAxdjNXODM3U2FxQytkWFExSjhSYm9vc3BHU3RVak5DRk5hOExYaVZB?=
 =?utf-8?B?ZTZudFFZdVBUSXdoem0wbmYyRFpINUVPeTBNUGhUVkhZQ1pFWE5jc2U3ZGNn?=
 =?utf-8?B?Nk1tUEFxdUtMUUV2M0lvSzVoa2JESWVtNlRGNG5tWnBBWTZ0TTNZdG0zcmxv?=
 =?utf-8?B?VU90YmMyTTdRU1ZNYnNzeVExazdHdkZ5L2NEbTMxQW1ZVUpuNnpwenc4R0dh?=
 =?utf-8?B?NkxUN3hPajZvdWRUTTZyVDVOeTFvVmh0NHdUeGh4MlB4K0ZUVWpmSjJYeUdr?=
 =?utf-8?B?b3pHWDRsYllCaVdHOXBtcjVsMzBmNElHV1pWL3QxTnVrRk1PQXBoZlVhR1Fy?=
 =?utf-8?B?WmdZZFlyZFRZU2ZQMVQ1d0FFZHlWbHZ3UTdNc0xFVWdSVE9wNFF2MnpXMFBt?=
 =?utf-8?B?YXNsRFByUk4weDMzTktQZGc0RnBqbVdLOVNaM05FcFI3OEhuaGplVDBQS3FH?=
 =?utf-8?B?SWlYR04yWDJVWkdKUlc0cysydW1NcGZtMHJpUlhDSW9nWHBSbEkrQUNwRHgw?=
 =?utf-8?B?MThJVXNkZVlsY0RhSFV6WFc3eTdLR21waTlNc2J6SExyS21lZVMvaHdpUTRq?=
 =?utf-8?B?S3E1VjZkNFNoYmQ2V3FsVnVJcCtRVndZSFozNVJWQ3NUdDdGRk9UVlNQallX?=
 =?utf-8?B?K0d6NEpGZXQ0U2NBUmw4b1BDTm4wTENLZHFUNW1MU0VLWmNSeUZReUUvcWgy?=
 =?utf-8?B?Y25YWkpDeUZrM3ZEUDI4YzFkTUlLTFJVTEtkMVU2QmQzT2dTQVcxOGdKOHpn?=
 =?utf-8?B?Q29hdnI4N1RVa284YzZZVXg2T0ltcTdrOXN5OERUY01QbmhBQU5kMk9BNXNF?=
 =?utf-8?B?T0NQVTVMUXpvTTgyRC9OSkRYdWE4Z0l5WlJPMmpPOXV0Nkt2eFZ4bVdqTENV?=
 =?utf-8?B?SjFINWNDU1RKKzkrRnpSRG52K3JaK2JUSWtFaTZTMFdjbXdNYzJRSzduT3N0?=
 =?utf-8?B?eFRldGpKZkwwa1Fvdm1HWUZqQ0hEWG9FblRlZklOdWVRZFJpZHpWTmhRa2h0?=
 =?utf-8?B?NVZab2J6Z3ZUWkgwbW9SSlIxUzNWRHRadGJtaEVnNXlDdFg5UjFmRGhLd3R2?=
 =?utf-8?B?MFdLT2JVc2Q2SmV0c1NIWkpINzRRaXlweEFrQTNWK3dUZ2VFcVdaU2xKYkZz?=
 =?utf-8?Q?8Ga1Chx+0K1a9rNUCLpPjKLDIlUuodNvAfBag=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(1800799024)(7416014)(366016)(376014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UElmYm9qVUcvWlE2TCtuSFBScTdOeWg0WlJZR3FkcVkvbzhtZjltVjN5cGQ1?=
 =?utf-8?B?b004LzhxeTF4K0FFT2toakNNQ21CMDRzRlE2ZGVMMEM0OGF6WnFBYVRla3lq?=
 =?utf-8?B?ajJPWjE4Rkt2SGY2YVJ1UHoyZEFlcWw3SlJsS0VGWjB3MXlXZXJZUHlIUHUx?=
 =?utf-8?B?Z3g2YURJcjd2alJNWGtFb1VrVGgrU0JMSlZtOU1JeEEwT3UyZitmK1BkbWpN?=
 =?utf-8?B?WWx1dmM0ZTM3SG5vTlNScHpmMktsME1KRGhaTm9nNTZIa01GYk9lLzV1RXNy?=
 =?utf-8?B?SENSaUs3VnBteGphbmYxSnNJYXkyVi96RFBTUmdGNlBTYSsycGYxZnJveFRL?=
 =?utf-8?B?T3doQ1RNU01WU1dBbTJKbmpXc2Qrbm0vdCszdkFFSk5NWXRMQXdpb3pwVVBK?=
 =?utf-8?B?LzVob2x2djRoOGNlVkdSZzhiaXlBbzhadmZ2Qm8vY09QQjk3OHpIbWpwcUpw?=
 =?utf-8?B?K2J1Yld5V1dLbEx6Mlk3eXdhV2VlL1NOTEwwTEovTkhFT1V1c3JnRTloeXhD?=
 =?utf-8?B?TitTb1Y5NWtxOEhZOFBvbEVzUjQwd25mQW95SWI2NjdValJUSEYxbzdENmlT?=
 =?utf-8?B?TmNJQlhmeFZrVVo1VVJieU4vanQraEhWY3dYY0tXMVp2WmhYQ3ltM1F1Y1Bp?=
 =?utf-8?B?Zy9vNTVmcDBuZ2xFdkRaSzVPZ0xXQVZGQTJ4ak5laEQrYXlYdWVyd2FmanFT?=
 =?utf-8?B?UXBzRmc2WWtaWGZ6OFpPL1MvQzJRN3pvMXNSNmoranpHVWVoYVlHTTFnMmNR?=
 =?utf-8?B?UHYvbVFERDByZEx2R2ZtZHgweHcrYTVLcGZkOWYwaXlPekR1WWZUM3UvTC85?=
 =?utf-8?B?SzhKb1JudkoxYlRnMnhDSEg5Q2ZkNDFnUXpNeTZmVkZxeWRPZG52dXIvNGpx?=
 =?utf-8?B?WGxOVGc0STd0dDRHYlY0dG5HVitscjZnVUUxS1JSNnlkQlErNG5nUEFRN2c2?=
 =?utf-8?B?aENsTC9iQmtOQ0xRR0hScGYyYy9HTWx5a3Mwb1h5ODBlbFNQNVU1K1IxTjFP?=
 =?utf-8?B?RjNoZEZMbEErblBvd250TGJqWmNtQkp5S1hlVWhDZ1JseWlLVHlKaXBGWlJB?=
 =?utf-8?B?ZkwyY3oyQjJKVUo1ZDg2SG82WmgrVk5zS2RDVHd5aUZvRGcrRmtUVTVsT3BX?=
 =?utf-8?B?Yk41V3F1VDJyL2VQaFpnMGJraGVwK2ttcUUwN2tWQU5wRnd3alJUS2dlNkhH?=
 =?utf-8?B?N1UrUTJHcm96Z2l4NDhJa1hwZVkwYllxTG5DdndPR0JVdU0xcHhpTm1xNFpz?=
 =?utf-8?B?eG96T3o4cFZKN3F0QXdVWFA3dkhXb2t3cm94TVZOWk5rR2NTTDBvY05NdnEy?=
 =?utf-8?B?dzVCWWxRM09PTkJFeDJEU2hwWE9YSzFoSkZBZHI1VGZXTm9nN3grbkMwYll1?=
 =?utf-8?B?QldaNmxPU2ZTZmpKUS91NnRQL3M5LytpNk9ZaDFsaVhKcUc1aC9keW5tb0tn?=
 =?utf-8?B?VElqR0RPNTkxbDgxTzV3SWdRQW8rYTQyVEduSnFiVE1UNUF1UVk2UW81SUlo?=
 =?utf-8?B?VUVVaGFKbGZ6dXcvSkNJUyt6Z1BvcHhYSndNcUZwa0ZDSmRLTEoxT3U5MU1V?=
 =?utf-8?B?dmVjazBjbVEzUXpZYS9hR0tGQ09ueWtMQVZFYWZxVExCTEpvd1ZrUi9PcmEr?=
 =?utf-8?B?Z1A2OWZMcTlibGU0MjVDSGt1UGsvUGlicjZ6ZWxkTkNVMWR4Q0lvM0Z1MndC?=
 =?utf-8?B?MmdSMVlNbFdjelRBdzdpSzZ6RzB6dkFYUmVUVlRrY2NCYzhseGFHcGNRbmo3?=
 =?utf-8?B?T0lSSWJ6eUxRQS80RU5TWnArbDhYNjd2bEpmR3ljTUcwSENIWnJBblg5Qmw1?=
 =?utf-8?B?bkd0UDcrZFNoM290dHhqaEpPMTdEdTVHN3pnbWkyYTJuazV3Q0JNK3RnYlhv?=
 =?utf-8?B?dm9lRHNhY0kwb1BudW9iWi95b1E2WWFnNFZpd1ZnYytWam03NVc4UnVZV2NI?=
 =?utf-8?B?R3phZEIvZTZ1a240cmRNc0hsQm52emhzejRQb1h2MXZIM3RDQVQzZmxhOUpM?=
 =?utf-8?B?M3dzWTZkNVJ4UG1LWmQ3V1htS0xSWGltQmVhSUU3R1c3eGN6QWt2dElaeFFJ?=
 =?utf-8?B?eGdBSXREdEFkdFM1aTlQcWdBblZrQS9MdlN0U0k5RTVmMGpRdVZ4SzlBWWVl?=
 =?utf-8?Q?GroEoa3srtHvHR6clJT3Zajnu?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55f92d10-cf2b-4504-82b2-08dcb102d6b4
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 01:48:13.1537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aJZtSEyw92OKo46cE+zdpfrmFeJMDjLt3lzbj3/CA+awE9UAwEfGuoNGZrqEJfE5lEM2MzRnQeCfvaK4SbvdWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR06MB7131
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


在 2024/7/30 21:11, Christian König 写道:
> Am 30.07.24 um 13:36 schrieb Huan Yang:
>>>>> Either drop the whole approach or change udmabuf to do what you 
>>>>> want to do.
>>>> OK, if so, do I need to send a patch to make dma-buf support sendfile?
>>>
>>> Well the udmabuf approach doesn't need to use sendfile, so no.
>>
>> Get it, I'll not send again.
>>
>> About udmabuf, I test find it can't support larget find read due to 
>> page array alloc.
>>
>> I already upload this patch, but do not recive answer.
>>
>> https://lore.kernel.org/all/20240725021349.580574-1-link@vivo.com/ 
>>
>>
>> Is there anything wrong with my understanding of it?
>
> No, that patch was totally fine. Not getting a response is usually 
> something good.
>
> In other words when maintainer see something which won't work at all 
> they immediately react, but when nobody complains it usually means you 
> are on the right track.
Thank you for your answer.
>
> As long as nobody has any good arguments against it I'm happy to take 
> that one upstream through drm-misc-next immediately since it's clearly 
> a stand a lone improvement on it's own.

OK, well to know this.

Thank you

>
> Regards,
> Christian.
>
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>>>
>>>>> Apart from that I don't see a doable way which can be accepted 
>>>>> into the kernel.
>>>> Thanks for your suggestion.
>>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>>>
>>>>>>> Regards,
>>>>>>> Christian.
>>>>>>>
>>>>>>>>
>>>>>>>> Patch 1 implement it.
>>>>>>>>
>>>>>>>> Patch 2-5 provides an approach for performance improvement.
>>>>>>>>
>>>>>>>> The DMA_HEAP_ALLOC_AND_READ_FILE heap flag patch enables us to
>>>>>>>> synchronously read files using direct I/O.
>>>>>>>>
>>>>>>>> This approach helps to save CPU copying and avoid a certain 
>>>>>>>> degree of
>>>>>>>> memory thrashing (page cache generation and reclamation)
>>>>>>>>
>>>>>>>> When dealing with large file sizes, the benefits of this 
>>>>>>>> approach become
>>>>>>>> particularly significant.
>>>>>>>>
>>>>>>>> However, there are currently some methods that can improve 
>>>>>>>> performance,
>>>>>>>> not just save system resources:
>>>>>>>>
>>>>>>>> Due to the large file size, for example, a AI 7B model of 
>>>>>>>> around 3.4GB, the
>>>>>>>> time taken to allocate DMA-BUF memory will be relatively long. 
>>>>>>>> Waiting
>>>>>>>> for the allocation to complete before reading the file will add 
>>>>>>>> to the
>>>>>>>> overall time consumption. Therefore, the total time for DMA-BUF
>>>>>>>> allocation and file read can be calculated using the formula
>>>>>>>>     T(total) = T(alloc) + T(I/O)
>>>>>>>>
>>>>>>>> However, if we change our approach, we don't necessarily need 
>>>>>>>> to wait
>>>>>>>> for the DMA-BUF allocation to complete before initiating I/O. 
>>>>>>>> In fact,
>>>>>>>> during the allocation process, we already hold a portion of the 
>>>>>>>> page,
>>>>>>>> which means that waiting for subsequent page allocations to 
>>>>>>>> complete
>>>>>>>> before carrying out file reads is actually unfair to the pages 
>>>>>>>> that have
>>>>>>>> already been allocated.
>>>>>>>>
>>>>>>>> The allocation of pages is sequential, and the reading of the 
>>>>>>>> file is
>>>>>>>> also sequential, with the content and size corresponding to the 
>>>>>>>> file.
>>>>>>>> This means that the memory location for each page, which holds the
>>>>>>>> content of a specific position in the file, can be determined 
>>>>>>>> at the
>>>>>>>> time of allocation.
>>>>>>>>
>>>>>>>> However, to fully leverage I/O performance, it is best to wait and
>>>>>>>> gather a certain number of pages before initiating batch 
>>>>>>>> processing.
>>>>>>>>
>>>>>>>> The default gather size is 128MB. So, ever gathered can see as 
>>>>>>>> a file read
>>>>>>>> work, it maps the gather page to the vmalloc area to obtain a 
>>>>>>>> continuous
>>>>>>>> virtual address, which is used as a buffer to store the 
>>>>>>>> contents of the
>>>>>>>> corresponding file. So, if using direct I/O to read a file, the 
>>>>>>>> file
>>>>>>>> content will be written directly to the corresponding dma-buf 
>>>>>>>> buffer memory
>>>>>>>> without any additional copying.(compare to pipe buffer.)
>>>>>>>>
>>>>>>>> Consider other ways to read into dma-buf. If we assume reading 
>>>>>>>> after mmap
>>>>>>>> dma-buf, we need to map the pages of the dma-buf to the user 
>>>>>>>> virtual
>>>>>>>> address space. Also, udmabuf memfd need do this operations too.
>>>>>>>> Even if we support sendfile, the file copy also need buffer, 
>>>>>>>> you must
>>>>>>>> setup it.
>>>>>>>> So, mapping pages to the vmalloc area does not incur any 
>>>>>>>> additional
>>>>>>>> performance overhead compared to other methods.[6]
>>>>>>>>
>>>>>>>> Certainly, the administrator can also modify the gather size 
>>>>>>>> through patch5.
>>>>>>>>
>>>>>>>> The formula for the time taken for system_heap buffer 
>>>>>>>> allocation and
>>>>>>>> file reading through async_read is as follows:
>>>>>>>>
>>>>>>>>    T(total) = T(first gather page) + Max(T(remain alloc), T(I/O))
>>>>>>>>
>>>>>>>> Compared to the synchronous read:
>>>>>>>>    T(total) = T(alloc) + T(I/O)
>>>>>>>>
>>>>>>>> If the allocation time or I/O time is long, the time difference 
>>>>>>>> will be
>>>>>>>> covered by the maximum value between the allocation and I/O. 
>>>>>>>> The other
>>>>>>>> party will be concealed.
>>>>>>>>
>>>>>>>> Therefore, the larger the size of the file that needs to be 
>>>>>>>> read, the
>>>>>>>> greater the corresponding benefits will be.
>>>>>>>>
>>>>>>>> How to use
>>>>>>>> ===
>>>>>>>> Consider the current pathway for loading model files into DMA-BUF:
>>>>>>>>    1. open dma-heap, get heap fd
>>>>>>>>    2. open file, get file_fd(can't use O_DIRECT)
>>>>>>>>    3. use file len to allocate dma-buf, get dma-buf fd
>>>>>>>>    4. mmap dma-buf fd, get vaddr
>>>>>>>>    5. read(file_fd, vaddr, file_size) into dma-buf pages
>>>>>>>>    6. share, attach, whatever you want
>>>>>>>>
>>>>>>>> Use DMA_HEAP_ALLOC_AND_READ_FILE JUST a little change:
>>>>>>>>    1. open dma-heap, get heap fd
>>>>>>>>    2. open file, get file_fd(buffer/direct)
>>>>>>>>    3. allocate dma-buf with DMA_HEAP_ALLOC_AND_READ_FILE heap 
>>>>>>>> flag, set file_fd
>>>>>>>>       instead of len. get dma-buf fd(contains file content)
>>>>>>>>    4. share, attach, whatever you want
>>>>>>>>
>>>>>>>> So, test it is easy.
>>>>>>>>
>>>>>>>> How to test
>>>>>>>> ===
>>>>>>>> The performance comparison will be conducted for the following 
>>>>>>>> scenarios:
>>>>>>>>    1. normal
>>>>>>>>    2. udmabuf with [3] patch
>>>>>>>>    3. sendfile
>>>>>>>>    4. only patch 1
>>>>>>>>    5. patch1 - patch4.
>>>>>>>>
>>>>>>>> normal:
>>>>>>>>    1. open dma-heap, get heap fd
>>>>>>>>    2. open file, get file_fd(can't use O_DIRECT)
>>>>>>>>    3. use file len to allocate dma-buf, get dma-buf fd
>>>>>>>>    4. mmap dma-buf fd, get vaddr
>>>>>>>>    5. read(file_fd, vaddr, file_size) into dma-buf pages
>>>>>>>>    6. share, attach, whatever you want
>>>>>>>>
>>>>>>>> UDMA-BUF step:
>>>>>>>>    1. memfd_create
>>>>>>>>    2. open file(buffer/direct)
>>>>>>>>    3. udmabuf create
>>>>>>>>    4. mmap memfd
>>>>>>>>    5. read file into memfd vaddr
>>>>>>>>
>>>>>>>> Sendfile step(need suit splice_write/write_iter, just use to 
>>>>>>>> compare):
>>>>>>>>    1. open dma-heap, get heap fd
>>>>>>>>    2. open file, get file_fd(buffer/direct)
>>>>>>>>    3. use file len to allocate dma-buf, get dma-buf fd
>>>>>>>>    4. sendfile file_fd to dma-buf fd
>>>>>>>>    6. share, attach, whatever you want
>>>>>>>>
>>>>>>>> patch1/patch1-4:
>>>>>>>>    1. open dma-heap, get heap fd
>>>>>>>>    2. open file, get file_fd(buffer/direct)
>>>>>>>>    3. allocate dma-buf with DMA_HEAP_ALLOC_AND_READ_FILE heap 
>>>>>>>> flag, set file_fd
>>>>>>>>       instead of len. get dma-buf fd(contains file content)
>>>>>>>>    4. share, attach, whatever you want
>>>>>>>>
>>>>>>>> You can create a file to test it. Compare the performance gap 
>>>>>>>> between the two.
>>>>>>>> It is best to compare the differences in file size from KB to 
>>>>>>>> MB to GB.
>>>>>>>>
>>>>>>>> The following test data will compare the performance 
>>>>>>>> differences between 512KB,
>>>>>>>> 8MB, 1GB, and 3GB under various scenarios.
>>>>>>>>
>>>>>>>> Performance Test
>>>>>>>> ===
>>>>>>>>    12G RAM phone
>>>>>>>>    UFS4.0(the maximum speed is 4GB/s. ),
>>>>>>>>    f2fs
>>>>>>>>    kernel 6.1 with patch[7] (or else, can't support kvec direct 
>>>>>>>> I/O read.)
>>>>>>>>    no memory pressure.
>>>>>>>>    drop_cache is used for each test.
>>>>>>>>
>>>>>>>> The average of 5 test results:
>>>>>>>> | scheme-size         | 512KB(ns)  | 8MB(ns)    | 1GB(ns) | 
>>>>>>>> 3GB(ns)       |
>>>>>>>> | ------------------- | ---------- | ---------- | ------------- 
>>>>>>>> | ------------- |
>>>>>>>> | normal              | 2,790,861  | 14,535,784 | 1,520,790,492 
>>>>>>>> | 3,332,438,754 |
>>>>>>>> | udmabuf buffer I/O  | 1,704,046  | 11,313,476 | 821,348,000 | 
>>>>>>>> 2,108,419,923 |
>>>>>>>> | sendfile buffer I/O | 3,261,261  | 12,112,292 | 1,565,939,938 
>>>>>>>> | 3,062,052,984 |
>>>>>>>> | patch1-4 buffer I/O | 2,064,538  | 10,771,474 | 986,338,800 | 
>>>>>>>> 2,187,570,861 |
>>>>>>>> | sendfile direct I/O | 12,844,231 | 37,883,938 | 5,110,299,184 
>>>>>>>> | 9,777,661,077 |
>>>>>>>> | patch1 direct I/O   | 813,215    | 6,962,092  | 2,364,211,877 
>>>>>>>> | 5,648,897,554 |
>>>>>>>> | udmabuf direct I/O  | 1,289,554  | 8,968,138  | 921,480,784 | 
>>>>>>>> 2,158,305,738 |
>>>>>>>> | patch1-4 direct I/O | 1,957,661  | 6,581,999  | 520,003,538 | 
>>>>>>>> 1,400,006,107 |
>>>>>>
>>>>>> With this test, sendfile can't give a good help base on pipe buffer.
>>>>>>
>>>>>> udmabuf is good, but I think our oem driver can't suit it. (And, 
>>>>>> AOSP do not open this feature)
>>>>>>
>>>>>>
>>>>>> Anyway, I am sending this patchset in the hope of further 
>>>>>> discussion.
>>>>>>
>>>>>> Thanks.
>>>>>>
>>>>>>>>
>>>>>>>> So, based on the test results:
>>>>>>>>
>>>>>>>> When the file is large, the patchset has the highest performance.
>>>>>>>> Compared to normal, patchset is a 50% improvement;
>>>>>>>> Compared to normal, patch1 only showed a degradation of 41%.
>>>>>>>> patch1 typical performance breakdown is as follows:
>>>>>>>>    1. alloc cost 188,802,693 ns
>>>>>>>>    2. vmap cost 42,491,385 ns
>>>>>>>>    3. file read cost 4,180,876,702 ns
>>>>>>>> Therefore, directly performing a single direct I/O read on a 
>>>>>>>> large file
>>>>>>>> may not be the most optimal way for performance.
>>>>>>>>
>>>>>>>> The performance of direct I/O implemented by the sendfile 
>>>>>>>> method is the worst.
>>>>>>>>
>>>>>>>> When file size is small, The difference in performance is not
>>>>>>>> significant. This is consistent with expectations.
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> Suggested use cases
>>>>>>>> ===
>>>>>>>>    1. When there is a need to read large files and system 
>>>>>>>> resources are scarce,
>>>>>>>>       especially when the size of memory is limited.(GB level) 
>>>>>>>> In this
>>>>>>>>       scenario, using direct I/O for file reading can even 
>>>>>>>> bring performance
>>>>>>>>       improvements.(may need patch2-3)
>>>>>>>>    2. For embedded devices with limited RAM, using direct I/O 
>>>>>>>> can save system
>>>>>>>>       resources and avoid unnecessary data copying. Therefore, 
>>>>>>>> even if the
>>>>>>>>       performance is lower when read small file, it can still 
>>>>>>>> be used
>>>>>>>>       effectively.
>>>>>>>>    3. If there is sufficient memory, pinning the page cache of 
>>>>>>>> the model files
>>>>>>>>       in memory and placing file in the EROFS file system for 
>>>>>>>> read-only access
>>>>>>>>       maybe better.(EROFS do not support direct I/O)
>>>>>>>>
>>>>>>>>
>>>>>>>> Changlog
>>>>>>>> ===
>>>>>>>>   v1 [8]
>>>>>>>>   v1->v2:
>>>>>>>>     Uses the heap flag method for alloc and read instead of 
>>>>>>>> adding a new
>>>>>>>>     DMA-buf ioctl command. [9]
>>>>>>>>     Split the patchset to facilitate review and test.
>>>>>>>>       patch 1 implement alloc and read, offer heap flag into it.
>>>>>>>>       patch 2-4 offer async read
>>>>>>>>       patch 5 can change gather limit.
>>>>>>>>
>>>>>>>> Reference
>>>>>>>> ===
>>>>>>>> [1] 
>>>>>>>> https://lore.kernel.org/all/0393cf47-3fa2-4e32-8b3d-d5d5bdece298@amd.com/
>>>>>>>> [2] 
>>>>>>>> https://lore.kernel.org/all/ZpTnzkdolpEwFbtu@phenom.ffwll.local/
>>>>>>>> [3] 
>>>>>>>> https://lore.kernel.org/all/20240725021349.580574-1-link@vivo.com/
>>>>>>>> [4] 
>>>>>>>> https://lore.kernel.org/all/Zpf5R7fRZZmEwVuR@infradead.org/
>>>>>>>> [5] 
>>>>>>>> https://lore.kernel.org/all/ZpiHKY2pGiBuEq4z@infradead.org/
>>>>>>>> [6] 
>>>>>>>> https://lore.kernel.org/all/9b70db2e-e562-4771-be6b-1fa8df19e356@amd.com/
>>>>>>>> [7] 
>>>>>>>> https://patchew.org/linux/20230209102954.528942-1-dhowells@redhat.com/20230209102954.528942-7-dhowells@redhat.com/
>>>>>>>> [8] 
>>>>>>>> https://lore.kernel.org/all/20240711074221.459589-1-link@vivo.com/
>>>>>>>> [9] 
>>>>>>>> https://lore.kernel.org/all/5ccbe705-883c-4651-9e66-6b452c414c74@amd.com/
>>>>>>>>
>>>>>>>> Huan Yang (5):
>>>>>>>>    dma-buf: heaps: Introduce DMA_HEAP_ALLOC_AND_READ_FILE heap 
>>>>>>>> flag
>>>>>>>>    dma-buf: heaps: Introduce async alloc read ops
>>>>>>>>    dma-buf: heaps: support alloc async read file
>>>>>>>>    dma-buf: heaps: system_heap alloc support async read
>>>>>>>>    dma-buf: heaps: configurable async read gather limit
>>>>>>>>
>>>>>>>>   drivers/dma-buf/dma-heap.c          | 552 
>>>>>>>> +++++++++++++++++++++++++++-
>>>>>>>>   drivers/dma-buf/heaps/system_heap.c |  70 +++-
>>>>>>>>   include/linux/dma-heap.h            |  53 ++-
>>>>>>>>   include/uapi/linux/dma-heap.h       |  11 +-
>>>>>>>>   4 files changed, 673 insertions(+), 13 deletions(-)
>>>>>>>>
>>>>>>>>
>>>>>>>> base-commit: 931a3b3bccc96e7708c82b30b2b5fa82dfd04890
>>>>>>>
>>>>>
>>>
>
