Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F7D957AFB
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 03:31:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A401110E33E;
	Tue, 20 Aug 2024 01:31:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="BCKVcETp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2086.outbound.protection.outlook.com [40.107.255.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2208710E33E
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 01:30:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jCrFoiP6nwF6oFkLlP2SuDhq6ZiPHQp/GTzIJV5Tmtvr5kDDGsF6utZvDTW5WoFQnA4XjOYPb06RcmwSJJfeA9prNGIOfO7g9vUVa012nfqficz2w29Et3xA8QpRMk3SGFdpgLY+tASTcazxvG2FMLk2vkqb+5ufecV9w16ou7EfKemJgIc3NTAThi2hI7Uc4KeYwqyAsfXuc3npQ7dLvcwmVF61nPe8roF46mQVbt1IExk0j4rbaaG8N9DOCP7wCd48YC4iyBS55y3JshBeegj/LvzvkuT5Gs/sB+e2hvyZxObna1HOPk0NQy/3fkMepinkJoVnWq3asjbmO7NZbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HtGXOyn3qehWYUU1adPQE59oyTZfgmWRqNdUOy9Hy2k=;
 b=XlWE8m1eXmrEVUiYKvSTXFQNcMu/eHB0/GWUUKnCnIRtFeBMycnWPlacXGJYiw84WDpCmX524HDBKGOM5wiyacaDWjafVSfrCTndGVOxCn/vR6aY2cbrnOrUv0uSWRq5MCe+xAaRAxsrt43IKa5rLLl8sq89rqaOWgbU9H1GrxgKEzD2HhJCtBoU5fUmNyK1KcYd1rx93C2VKHx+e5YNu7FL9WjsXOxw2lpqed0eX+wHSZ/BnUe7GSTrq9ANHPcrfsrJQF1u13Oc74q62BqirpriKgv1H2pkRvnishDOKsJsn8RrG2COQqu6QBFuTu3miInbH692vY4g+az2E+mplA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HtGXOyn3qehWYUU1adPQE59oyTZfgmWRqNdUOy9Hy2k=;
 b=BCKVcETpk9eK2TxC5HnN0i3x3/6Tn/6txvOAto4S3Ozjha/E7H3pZ3WWoAEb6rkXOVjJ4F1EX+n07/o6Sd/ibx9K1tzysodd9ZUlnab0ZXmpO9xmstT47PHM/CBYTito2pf0iKFligKqCwyPVWyU1K2NTU5u9F0rveokmNhtHVJZ/FghvPOsWAYDWIw2cn9lhV9YyVN2btu4AcOIO5RBuKGYVPlXlUF26J+Jf6uI14GYS44eeNzuoR1G/8c4uTuCioXO+7oadQWt/WH1eIKnz8ieIfSfPJl1AShW0b+ikbTz8hhyjiiUjODH1IvFPg87o0T9y5x6m7gMVV0+6Oxkdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by TYSPR06MB7019.apcprd06.prod.outlook.com (2603:1096:400:46a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Tue, 20 Aug
 2024 01:30:52 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%5]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 01:30:52 +0000
Message-ID: <a6b8865d-1fe6-47f3-a125-ef3079a4d22e@vivo.com>
Date: Tue, 20 Aug 2024 09:30:46 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] udmabuf: cancel mmap page fault, direct map it
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
References: <20240813090518.3252469-1-link@vivo.com>
 <20240813090518.3252469-2-link@vivo.com>
 <IA0PR11MB718566320E42490E32C66C0CF8822@IA0PR11MB7185.namprd11.prod.outlook.com>
From: Huan Yang <link@vivo.com>
In-Reply-To: <IA0PR11MB718566320E42490E32C66C0CF8822@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0004.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::22) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|TYSPR06MB7019:EE_
X-MS-Office365-Filtering-Correlation-Id: 1261b184-8557-45c5-140a-08dcc0b7ba56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|366016|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YXJQa3E4ZnlIc1pZdjBvTXdkY3h1ZXdFdFRacHNDOUJmQnFwWm8weVN3N3JS?=
 =?utf-8?B?YXNDeFU0ZVNONGxOZmhiVi9nb2Z5ai9yenpyTUluMUxCUWJsT0ZPRHdQaWF6?=
 =?utf-8?B?VWZUOUpsejc5RWdHR1ppN1FXTlQvNkVJVk5vY1YyelF0NmVObXZPM3VSam55?=
 =?utf-8?B?cyt6aXZ5L0F3TEJtZ3czeDIwTDJ1ZkpoRUR6YVZKQllFVW5KbzlhS3B3SHlP?=
 =?utf-8?B?aUNUVzdnTmlqbEdhQUZwMlNVM1BrU3FuRVNoZVhVWXlJN3ZuWXl5TGlpR2xV?=
 =?utf-8?B?WUpkcmhzeHZTMkx0VVpqRWtuTUNLWTNRNURXdWpsRzR6cmZHOG84bW9GQWdO?=
 =?utf-8?B?dFZXRkVvcjh2bzJxbU1ZN24vT3dndFBSZGtXM2tsTVRiUUNrUmNENTdKUU9U?=
 =?utf-8?B?L2FVVGk5ZExoTElmRWFoN051UVdIeWU3OG1mTnFPVkg0V2xycjVRQjh2ME1q?=
 =?utf-8?B?OG5GOHhvRVlRanpLYjZrUENqRmxrcjVDODlxQXZNa0UyNVJmMjNLWldqQUU4?=
 =?utf-8?B?Q09jRWI1ZEFJS3hwa1pHVmhJa1FFU0dIRENRSDBVeFhOZzZJbTlxdThuOHlj?=
 =?utf-8?B?Z0FZcUltNEo5VzlYMEF6Tk9PV29CaHFlL2VIdDYvZHhsUkdlcjJodjN0ZG1q?=
 =?utf-8?B?U25USVAvdzg1ZzVUVThqRXJaeldYWnhXazM0d1dQUnplSDdxMUdJU2NXNnlY?=
 =?utf-8?B?UlJMRVFhM1h0WmJmVnlrT1cwQTVIcUxzTDFjdEdReHo0ZmEvUUdpUlE3enJT?=
 =?utf-8?B?WWNZZWlVVldOUWZ4SnZVbVlZT1pYSDBFZmExenNQUlFydk5yUTZSUFFLYW5q?=
 =?utf-8?B?ZVcybWVGNEdHa3lqWmdybHJNc0Mwb09XNUdDQ3Y1K045YXlvMWcrRW95OVRE?=
 =?utf-8?B?SWlDTDA4Q3d3ekZFOUVEZVRJVGpTMDZkQ1hIUEtWVk1CeFkzM25GaG05NnFZ?=
 =?utf-8?B?Syt3Qm9SWEJ4ZG1ickNqRHdmeURGcVltQ09YWG11bjdaY3pSYi9GV3FYeHow?=
 =?utf-8?B?bHpBMlRtcEtRK3FxcE5teTBENk83NElSTWJ0MUp5SGV1dWg4U2E1NVc2c2xl?=
 =?utf-8?B?OFEvaDFtMmprVVMveFVQZFd6WWdGMmdTc0oxU29DaWNSRjFSSXpUOHIxTGVv?=
 =?utf-8?B?SzNmUUVhUGo2UFd0VHgyZ3ZiQUVhci91MEZSY1phT3ZBOXpobGo3Y1hsWnRG?=
 =?utf-8?B?M0VYS0dJcktsUzR3Q0RET3gza0JaNDJDLzI0eGJxR3o3TW52QmVBY2J2emgy?=
 =?utf-8?B?QzE2dktHcVhoek5sL20vY0k0M1g4T3BaQWd5dmUxWHFiQU4xOEplNzNhVFNs?=
 =?utf-8?B?MWtMZUJzYVpCNWtGR3Yxb3E3MmxpMDgvaFE5Y1MyNnByMXRHbDlqdmdoYjVu?=
 =?utf-8?B?S1diOWpqTDBVc2JBdkZ5aGxZbWU0cmdyU2kyWG41eEZyL3ZTZ2FqM0lnRysx?=
 =?utf-8?B?NjFvN2pOdEJ3RWFYOXB2bzhwTjZSVE1XNFBjV0lZZ1dFekcrbVZZMjNxUWZD?=
 =?utf-8?B?UEFCM05YK2VGbUNFZThIbWVPcHJzWkdiVjlZZlFNU1I4WXlZSlBwbUVYNk9Q?=
 =?utf-8?B?aklkZ052UEpRZXRZUmd4S1N6ZzJsSlg3TGNQc0Z6QjNsSkdBRXR4MU1WY1VO?=
 =?utf-8?B?cG5jR29FZjRFRUEvVGVzc0ZqbkYwYzBDT1cyMjJKZkwvaldpUEdlV1dlTXhH?=
 =?utf-8?B?aFI4Z0hSUjJSTGUzaDNVRldoOWFMRm9rYU1wTGZLNjhNd1Q3VXV1c2xEYTQ5?=
 =?utf-8?B?V09iSjFwYXFPSHZhSktZTEJ6MXpnZmFBRkEzb0tFRWxzUnZ0MkJOUnVRMlRo?=
 =?utf-8?B?Y1BLVitoSHR3a0w3NUhwOCtoS3BFVXNlcllMWHlvbUphV0pQUndhZUcwZjlR?=
 =?utf-8?B?akJvYTNXL2t5eUE2dGs3ZytwKzBsS2VsdE1NNWpvajB0bVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2hIM2JvN3JaWDBMRmVLRWx6emx3TDE2MjgvQThPVDhWWEU3VWRjUHdKSlFB?=
 =?utf-8?B?Tkg1azVvNGNVSElOUDF4bWwyNlhzZXZzK1lDNzBkU1AwZW9JQmVWQWhoMWJP?=
 =?utf-8?B?ZDBTMS82MkY5UWZOR0JnRFZVMFo0N2ZLQ21wR3greHN6bkNpOTMwMmkrdGNX?=
 =?utf-8?B?UTFTUk5tRHE2ZUNtYzYxcjZGWkdaanJtREhNbklNaVd0d09PQ2QxQXZaQkpK?=
 =?utf-8?B?VlFtL2ZQV2ZRMTVQTDV3NVA4NHBWUVdkUVI3Rkx3OUR0U2lIV1Zza3E2czNH?=
 =?utf-8?B?RmJwdm5xRXhBaEFhUlQzbXRMN2UwR1k0Nkh3cytsWTlWMU03L3FOaWtTSzZ4?=
 =?utf-8?B?THdCRW80VnJCMGwrNlVUdk9kYXU1MU83SmN1Q1N3MituMDAyeVY0VHJ6TVpT?=
 =?utf-8?B?Z1A5S0hERUhzWTFiZTFycHdsaG9MZ3Rzbk1La0doSTdwR3FmekRWbVg5eEFW?=
 =?utf-8?B?cW9QZEJJYkkyVDg3Sk1XTGFweGltaTM1aTIzZG90cnhzTDJwRTJETXBlMDBX?=
 =?utf-8?B?NGZmZW9TV3NXcFlNMStLS0U0ZnJEZlpodFdwMU0rZWNnQ3FlUnc1Q2JPK3li?=
 =?utf-8?B?dEFva1ovaEdaSTl0R09MbElrRld5bnVYWS96ZjQ2V29OcEhPVVBjM3p0eGpZ?=
 =?utf-8?B?bzBMeDYwNGpUVlVoMDhDOVNzczExQUFjWVVLUmNmSHpFd1V5eUM1N1loMkI4?=
 =?utf-8?B?ampoYXBtQ1NsWmY4Q0EyWXBzV0lVa2t5OUU5SThPREVlZHA5NEpFanFjYU5Y?=
 =?utf-8?B?ZVR0M1FrQUZxT2xtbDJFczZWZmluM2gvV2txcjRoNE9qbDVRekpRK1FHcit2?=
 =?utf-8?B?ZmlMMjNrMGRhSjV0M1Z2cHRFVzdPcjNDUXNmT21EYWpabW9yYzVUbnpwZUtq?=
 =?utf-8?B?QlhRYmNvZkNxVDJ5aTZhakFaSWM1K29YaTNIakFWU3BWZGlmWTFhSzVTcnNz?=
 =?utf-8?B?dUJBczdjSkJPbHhvemQ0TFZubGJXN1JCVU8rUjdXNG9zMTN3dXo4a1cveXFR?=
 =?utf-8?B?NWdCYXdkem9IclRmWVY1R3Rsa0tSdStwaTN1UWtqd1hBY21lWHRZS2ZXdVFS?=
 =?utf-8?B?UThhd1lTUjN6TmlWNER2M3BxQitOSHdlbDF3S3BDY0srVVJOMDJSUkJVdVVh?=
 =?utf-8?B?R0JpcXZHWmFtaDExZGNtVGh0ZU54TUd6OVhuYkxROENYWEt3TjlsWVhmUkpG?=
 =?utf-8?B?VjAzNGFPak1WbkNacEk1MDNrZW5nUFFMQ1M0TTM5UGE2N0xRZnNGcjkvWStv?=
 =?utf-8?B?RCt3cFFtcUg4dmhLZW14ZG8rMDFvMHcreWVoU1h5WmZLd0liS2NPQnd2TnN4?=
 =?utf-8?B?T0NNa3pJTG9IVzJzWUZVZ0NnOHkwWVpVSE1QbU52WWc1VkhTdlVxdEJ6Smov?=
 =?utf-8?B?SHpneGJWZ3pxZ2g1akQ5b1BDRG4ySnNTWmZtTXFwckVCOEZSc0MvSkFIc3Jw?=
 =?utf-8?B?YkpQRzdEZjJab093N3FQUHFuMm1TWDdrb2pHd3YzM0k5ZzZGK1NvdDBuUlFw?=
 =?utf-8?B?RkpCOTdUMEVPKzVXOWIzajJqVzRlTnBtY0VCSy96b2N6eHo5QVJLdjRuYU11?=
 =?utf-8?B?Mys4TjF5T0J1N2lFT3Vid2x5cHBrNXJUUlY3WTNPL0dYR2llazQvM1RKZHVo?=
 =?utf-8?B?b0VMR0RqdC9xaEY5a0dWbUhOek1SblVONDFaeXkyRHVSQUlqa0s5TXZkeDBL?=
 =?utf-8?B?cWxwT0MvR3JoL0lXbCtoUVgyZEhkV0dycXgyMTBicnc1K3N4S1kxUlk1WEdZ?=
 =?utf-8?B?WmhmNGNBVFk4a2c5aUhJTVBacmJmT2JZb0RvdXhLNWxhTWhrd2xNdWViOTdw?=
 =?utf-8?B?RjNQNGtHeEhTbXRWRm1kWURFc2M4MW1nVHA4UFNPcm9LQ1dxbUNwUmdzYjJ2?=
 =?utf-8?B?K0IwZnJ5RFNuUFJoU0ZqT0JobHE3ZU1vOXBFNCtlekpsZDBIdzlCWDBtbHlx?=
 =?utf-8?B?RCtFTlU1THNqQk1VZ2YvMkdwa1Vjelc0MmtxTDdmRi9GVzA4Ylp5dWxRVHFZ?=
 =?utf-8?B?TDUvZk4rZjJSSnBNdjY0bzN1NlZjU2VocElQaVkxcFpYOUNHVTBOT2hWQU5v?=
 =?utf-8?B?ajZkQnRoUGxmK2lIdTR2OVlab2tTcmxjMUJNZlYrS2lMTm9acEt6blJQWVI3?=
 =?utf-8?Q?dN/+T13ZQKCgsBwTzknPUU3uv?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1261b184-8557-45c5-140a-08dcc0b7ba56
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 01:30:51.9911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oUogq42UJHr6nTTG/LlS9LAg5JzSSnxSr5DYsn21Y46IE5RfzYiIa9UMI7l3hWEyWDGNSIacM1u++j6M98Q8kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB7019
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


在 2024/8/17 8:53, Kasireddy, Vivek 写道:
> Hi Huan,
>
>> The current udmabuf mmap uses a page fault to populate the vma.
>>
>> However, the current udmabuf has already obtained and pinned the folio
>> upon completion of the creation.This means that the physical memory has
>> already been acquired, rather than being accessed dynamically. The
>> current page fault method only saves some page table memory.
>>
>> As a result, the page fault has lost its purpose as a demanding
>> page. Due to the fact that page fault requires trapping into kernel mode
>> and filling in when accessing the corresponding virtual address in mmap,
>> when creating a large size udmabuf, this represents a considerable
>> overhead.
>>
>> The current patch removes the page fault method of mmap and
>> instead fills pfn directly when mmap is triggered.
>>
>> Signed-off-by: Huan Yang <link@vivo.com>
>> Suggested-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
>> ---
>>   drivers/dma-buf/udmabuf.c | 37 +++++++++++++++----------------------
>>   1 file changed, 15 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
>> index 047c3cd2ceff..d39f9e1cd532 100644
>> --- a/drivers/dma-buf/udmabuf.c
>> +++ b/drivers/dma-buf/udmabuf.c
>> @@ -38,36 +38,29 @@ struct udmabuf_folio {
>>   	struct list_head list;
>>   };
>>
>> -static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
>> -{
>> -	struct vm_area_struct *vma = vmf->vma;
>> -	struct udmabuf *ubuf = vma->vm_private_data;
>> -	pgoff_t pgoff = vmf->pgoff;
>> -	unsigned long pfn;
>> -
>> -	if (pgoff >= ubuf->pagecount)
>> -		return VM_FAULT_SIGBUS;
>> -
>> -	pfn = folio_pfn(ubuf->folios[pgoff]);
>> -	pfn += ubuf->offsets[pgoff] >> PAGE_SHIFT;
>> -
>> -	return vmf_insert_pfn(vma, vmf->address, pfn);
>> -}
>> -
>> -static const struct vm_operations_struct udmabuf_vm_ops = {
>> -	.fault = udmabuf_vm_fault,
>> -};
> So, what I was suggesting earlier is that it would be OK to populate the whole
> vma after first fault because userspace can simply call mmap() but choose not
> to use the returned pointer for various reasons. This is what Qemu's virtio-gpu
> module does and in this case we'd be unnecessarily populating the vma.

I may get your point. Fill pgtable when access is better than fill when 
invoke mmap?

This is reasonable. And I'll try to test it too.

IMO, there won't be much of a difference in performance.

>
> Therefore, my request to you is to try to benchmark your userspace to see if
> there is a significant difference in performance when you populate the vma
> during mmap() vs doing it after first fault (which means moving the for loop
> to udmabuf_vm_fault()).
>
>> -
>>   static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct
>> *vma)
>>   {
>>   	struct udmabuf *ubuf = buf->priv;
>> +	unsigned long addr;
>> +	unsigned long end;
>> +	unsigned long pgoff;
>> +	int ret;
> Looks like ret's type needs to be vm_fault_t.
>
>>   	if ((vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) == 0)
>>   		return -EINVAL;
>>
>> -	vma->vm_ops = &udmabuf_vm_ops;
>> -	vma->vm_private_data = ubuf;
>>   	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND |
>> VM_DONTDUMP);
>> +
>> +	for (pgoff = vma->vm_pgoff, end = vma->vm_end, addr = vma-
> I think initializing these variables above at the declaration time looks better
> than initializing them in the for loop, IMO.

Yes, even though initializing in the loop declaration can better 
indicate which variables the loop needs,

here it makes the loop declaration too long.

I'll change it in next version.

Thanks.

>
> Thanks,
> Vivek
>
>>> vm_start;
>> +	     addr < end; pgoff++, addr += PAGE_SIZE) {
>> +		unsigned long pfn = folio_pfn(ubuf->folios[pgoff]);
>> +
>> +		pfn += ubuf->offsets[pgoff] >> PAGE_SHIFT;
>> +		ret = vmf_insert_pfn(vma, addr, pfn);
>> +		if (ret & VM_FAULT_ERROR)
>> +			return vm_fault_to_errno(ret, 0);
>> +	}
>> +
>>   	return 0;
>>   }
>>
>> --
>> 2.45.2
