Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55542C8A836
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 16:03:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8CF510E65C;
	Wed, 26 Nov 2025 15:03:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gQdUk9ze";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011021.outbound.protection.outlook.com [52.101.52.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C164210E659
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 15:03:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iogJlRd/N5TneAI4zgdcniZ7Rxs0Axg0y5p7ShYHelnP9Vi10nziBusTRYIw06JfBLQyFjYb7Aj87OPBjtyEDmFYUe83hsDOblu3HF+MtOaiGpMxBHOhCRWK223RcQHT/9JbdJSTJ+2uP7TEzWf58fBB07iKs1ThpiCmCL+atgVsUre5JmUrGvUYiDOEqEciyPJtKGIWvlKk6gPnZHsl0pVu23A5na+kkOz0w0RcuUoWyxOVFGVg+3H7bVmX0gl/4CcAxC1GC5siagoxj/suh0SYBG81zr3ylYkw5bH1lAUEqKZ+UaUHb2NBRkZo3iZnS1Nc7Cu7gf9hoZLKs0WC0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=crVuTHAVDtrvpD8rP5m3YT7swADBd7CM4+RwGCsvLqU=;
 b=HjY/OVpJJPAHiEA6nS5G+9pr1w3gSTLv1t5D70yMO2u8LcBw7lctSEoP0seW8jyzww5RX7s/AQSS0HtLtqsf+Iqx4pegIfHPV3pcyun3hEULLJdCdXCpzqLJIuoQKKB5obfykYvL/ejrvVQoPFMUAGoiKb+n7ozCbkxZa3PmEtQW4XG9Whl6OVa8Y7lXiX+3tUI/PFCtQqpB1xqx84g0FyQ53TxFdBdG+Dii1gxt6XKs73YGpiJ6PiUH3/3kiW49w96sE2LyhbWobqZ4QzP8PwrfsnbUiDOgnnYowXYT+3iPlQoD/bFyktcBZKSJaOXqRSp1TSrdMI39/BLsLMS1Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=crVuTHAVDtrvpD8rP5m3YT7swADBd7CM4+RwGCsvLqU=;
 b=gQdUk9zeV2UdRTm16f0dSq5gh+DSl3b9MbuJGUiQGsMhKy5ZR6dWzzQ9KVA2ukKbfk+KYmywVBRUjQObZFNloiY+hyXEQB+YJZnit5s1fDWgfw5lj9rqGNPIFGjloWbu8bqPHHRfFJ4+xhX/jLAxA36Wl2ZFiwQ1UmjLtXy0UB4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PR12MB7774.namprd12.prod.outlook.com (2603:10b6:208:430::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 15:03:43 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 15:03:43 +0000
Message-ID: <6151e7c5-1de2-4857-ae64-1e2fd6cb7513@amd.com>
Date: Wed, 26 Nov 2025 16:03:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dma-buf/fence: give some reasonable maximum signaling
 timeout
To: phasta@kernel.org, Lucas Stach <l.stach@pengutronix.de>,
 alexdeucher@gmail.com, simona.vetter@ffwll.ch, faith@gfxstrand.net,
 sumit.semwal@linaro.org
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org
References: <20251120150018.27385-1-christian.koenig@amd.com>
 <20251120150018.27385-2-christian.koenig@amd.com>
 <380012b9d6f0e9ee3c2f125cfe2f37f65c1979e0.camel@mailbox.org>
 <b46913b6-fe61-48cd-a9ca-aa2fe3a12b63@amd.com>
 <1c1a14d42d0a4a25ebce26a2af0a61dc1b7813fc.camel@mailbox.org>
 <508ff709-0f05-4982-8e15-5fea3bbd12e7@amd.com>
 <c2b571a7e74f86c6cb95bebd11274447c3080df9.camel@mailbox.org>
 <52d484c5-6dfb-4e2f-9caa-a61cf1d94801@amd.com>
 <e2c006ca81081ee1afa00b1b52a035c28a267e0f.camel@pengutronix.de>
 <207d50fe-eef3-4baa-97a7-567598e56b55@amd.com>
 <54d6e863fc606d22f245e30012bb5120d5bee7ee.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <54d6e863fc606d22f245e30012bb5120d5bee7ee.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0984.namprd03.prod.outlook.com
 (2603:10b6:408:109::29) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PR12MB7774:EE_
X-MS-Office365-Filtering-Correlation-Id: dd93d1b0-95d7-4907-f1b8-08de2cfcfdb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1lDdTk3eHgyaVNqUkxSSDZjNm54SGI3T0VsZStpUkN2N2JCbTFmWnRiNWxW?=
 =?utf-8?B?dkpHN1dFVjNJYzhpTmt1Z3k5cnpuak1uRitVZURWei9BeTRTWFdYUnlod1Jj?=
 =?utf-8?B?bWc3VGVHYjNNelhKUGpsOGIyQ1U1VGovVWZpVDZoUU5ybFZLdGhIUWJXeFlo?=
 =?utf-8?B?TDZjQitteFhwRm1vbUFJVDJ2VzVZNWtOTGo2SkphUDJuenM4U3BWSjR4K25a?=
 =?utf-8?B?N1dOTDhLVGhVdFRYUVRGa2lYdlBCOVpmNytiOHZueVFiK2FXRFFZZVJVVERE?=
 =?utf-8?B?T0JKUXkxWUhmbGI3RDBtZVZSdXoydFdaQU9IbDZSVmMzQ0JMNnF5VDhqdUlX?=
 =?utf-8?B?ODl1UW1UOS84VGpkSzFpaEtDWERJVlNWamx5NkIrNFZXSUxNcGo5aEpsVEJN?=
 =?utf-8?B?UmpuaERycGJXM2lkVXVRVzgvOFAwUzZrQTZJaGE2VlhBTHMyYXBjb3lhaUJK?=
 =?utf-8?B?MFBudk5IQkpNWkZyTHhUM2tzYkJrVGI1dXM3VHRtRkVOeFdiZkk1THJDZlFP?=
 =?utf-8?B?bm5ITzRkbEthVzRUOFZ3UVpFSC9mcC9WdlhlanZiNklma00wR3JPUGsrWWtW?=
 =?utf-8?B?L3NBdUgxays1dUJmWEFKdUh2cGU0TW1JZDFJc00yMjRMdCtqNitlK0ZNenNz?=
 =?utf-8?B?S2hsZG1UL3dWVm1PbnVXdVM3dzM5bVRFclJFSTZGWjVhaEtOais0elNWRi9T?=
 =?utf-8?B?YXlxcGRWVmJVUVkvcXAvY1orRFFFcU84U1FOZnE2UzZzSWUvTjY3SFVsTVQ4?=
 =?utf-8?B?ZHQrckdsSGNJSnlFVGU5Y3BtdFhkWURLNEdaMUtjRVl6OE1MN0M4MCszVHpK?=
 =?utf-8?B?TkhhQi9PTm9aZHpRRXRHRVM4RFhMUTBiUXNTYTlJUDcrT3JxdTNvY0JJSnl0?=
 =?utf-8?B?NXlteGxVbnBKWHVseXJ0TDN1NUpTbG1JcTA4cVJjbm1TSk5FUEpHOHNXUkV6?=
 =?utf-8?B?Z284RXU1WUMwa2tLWTc5NXBOQWtFc2g0WE8xL0lhQmZwVDdwMlc1WEhDRkZQ?=
 =?utf-8?B?TFRvQzRKc1RnY0dQR0ZUOElISS9qVVhIc2Zia0lEa1B2djF2Uk5BU3o2OHlp?=
 =?utf-8?B?WU8wZjNnRktYN3Q4YlZGam5CZzN6OU5PQzFvejhvMUJqeGRlSS80bysyc3dt?=
 =?utf-8?B?ZVY0NkZFcDl2K1AyNkw2Kzhpb2R3MUhwRlNZSFFSOXl0OFBPZ0gyQXpJSFZ3?=
 =?utf-8?B?SWEvbGdyZ25Gb0MvTzhRS1lRNUNGRlZoYVNwVlZFYlJwbE5wMWE3MkVpYUE1?=
 =?utf-8?B?dmN0b0xQbDB0YW9sc1JkU0Y1clhybWEwRVRsdmhIajFTYk9Ga2pNZER5RnRM?=
 =?utf-8?B?bUlHZEdvY1FOemxnbHFqTmY0WFgrZEJMU1kyTFpJRWUvclUxSnBna3RSNjJz?=
 =?utf-8?B?OEEwZDU3NkN3eFkwb0c1ekx6SU1wR0ZYc2N6Q3lvKzlnYXFWN0FFN3BrTW1D?=
 =?utf-8?B?TjhQRWYvdU1LS3QzbHJ6dm9EOE9qOVI0TUx1ZWtvUVREaEVxS3JQdDlNRTVk?=
 =?utf-8?B?a3lwNTNXOXZPeWRFLy9JamVlWnlXZFdlYnl6NDZtUmtEZ2x2OSsybzhJZ1ZE?=
 =?utf-8?B?YVd0V3phNkp4cFE2aDhFM2xBcjJtYzQ0T05DOUpyUTg3ZmNMMHpCeDVLVE9p?=
 =?utf-8?B?OGpoWVhiOW8zemdsZUk0TWRWRFBwcnhETjFCdDJKakJrV3g2NU9OOC8ybjc4?=
 =?utf-8?B?cnI0T1hKUUNDSXBrRTlKU05PbTM2YnRoU3FKNCtkZWRISlFGejlpMnlPZDR0?=
 =?utf-8?B?SmgxTUdTbnFIMmFYQlNUM3F1SmpyeHFYc2IzZkY1bFpNQmpEU0Y3blVnWCt2?=
 =?utf-8?B?MFB0WkgzQ1pQV25TRTdOQTJncG1sdW5vNVVmaDRoUWRtbExsVnRXY2V1aSt5?=
 =?utf-8?B?K0srODBsZEFZQ0EzTngyditFNEJyTVhlSzlIV0xkRUgvTDRlaTNvMkZZYlF6?=
 =?utf-8?Q?3ZE8MyfP6KDEemiheIo8WHUHtD4P206J?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1gyZlRYTWE2UzIvOWlPYmtENkFnY2JQL3FCY3JBUklKeStKenFIRVl4YWx2?=
 =?utf-8?B?WkY5NVZQWm05Q2JkSG1nbkFkUU14R0RPbGNPTzEyZVMwTDVNWkh0MHFTVUkr?=
 =?utf-8?B?SzNRaDNoN3ZDOXVaRmFMZ2dQSVptU0p1Yy9lbWNiZ3J1WnptY2NSRkhydjRq?=
 =?utf-8?B?ZFU5VGdXNEVEc0V0ZmVXd0JzNDd3cEdqL3NrSWRlNWNFUENoeWhvVndTbjBr?=
 =?utf-8?B?VE5wRVRqQ0hQRVI0YVdjQmdITm4rNnZLbEZhYTlPa3M5L3h0ejF3ZjhXbVpO?=
 =?utf-8?B?T2tnWVNrOGd6anFxM2lPMGJMaVhkTVVreWdmUk5KN29tRnhNTE1nZ1ljUDBv?=
 =?utf-8?B?aHJLZ2VJMmF4Z1pQb1NOdmpqMWpiWGc1aXZ4dWV2THZISUFKT0NUWDBTZVli?=
 =?utf-8?B?RE9tQllMajZxcXg2QkdiMFZuTDQ2MEdaMXZKWC9kN0NOcmlQNCt0NlkwR1d6?=
 =?utf-8?B?Z2R2L0dLcXJiMU82WHpxV0N2VmpxeW5MZ0Myck1IZ2RDZnBSeEdzSHJZSm1B?=
 =?utf-8?B?ZGJNQ2UwQlVBWUYyaFIzZDh2RmtLbENQYlJ6NE9HdWI3KzFsY1NBQkd6eC9k?=
 =?utf-8?B?MTRrbnZOaXpEQjNRazdHY2tzb2l1OEhxQnJMQ05Qb1huTERoQTdqYWw3TkIr?=
 =?utf-8?B?cnI3V0FvekwxRFQrUUFRc2pZeTBSYUxMblNyV1p2dDNmdEFnbEZsVmx4RDN4?=
 =?utf-8?B?OXJWUkFHTnVSbHJaOHRyOXhMWnRLekhLSC9EWHZ3YkVaUUJJMGl1VjFvMUc0?=
 =?utf-8?B?NFhZZGxnS2lJYjBPRHJDNFhha2JvRi9mL1pGb1M3blVRL3RYclZIMmdzaDlo?=
 =?utf-8?B?SE1KclhKR1UwV1YzSmV3K1lUakR6Tm1SWjlVQUhjd3ZVTGdzbnI2bU5DTTQr?=
 =?utf-8?B?Sjh3SUFkYzNnVXlOQ1lrWDhrcDM4THVjcUx5eTRnOWYvL0ZaQ2U3UTNDUE4r?=
 =?utf-8?B?eXlyZzYxZFJqVDR2RGVBM3JtRkVaUnRIK1hrdGhtU2Q1RFZ5ZmU5WmI4R0pW?=
 =?utf-8?B?YjRLaHFxYW9jWWtJcFgxVU1QSlJwWWVCb1RHMnN1Q3l1dVl6NUZGTFVaTHVn?=
 =?utf-8?B?RFM2b0VpNld1ZE9pRWYzaU92QmQrMFVSNmVYSVQ2TVZZaE82YXRVd3hhcGZr?=
 =?utf-8?B?ajE4c2JBaE1UTVE3ZnZTVlR0RTIyQlhjb25mUy8vRUgwTEcxalJ2bllCZzJL?=
 =?utf-8?B?dGFzRVZnUXVhUktRMDR6MmZDbXBvSmErcGRYcExKR0drOXRHcnpTTTdLQThO?=
 =?utf-8?B?RlhkbDVpUEIwQkRURStlYWZSMXZmSWRScVMvSmpaVUdmQ1FxTVdsQmZjbmxw?=
 =?utf-8?B?MXBaMHMrc29qcE5YSzZXOXdCcHVaYXB3elFaclhhc1lHSlZkeVBQYk41NURt?=
 =?utf-8?B?aHRrUU5LM2t0RFFXNnViM1AxMXRPZEVtSW9YL2VublBQZ1FFUkpzMW1vb3or?=
 =?utf-8?B?bWlSWUV5RzgrUFNDK05lRkJ3YUVTcXhHRjRNTFdsM1BWM25aVGZzaHlLUUxo?=
 =?utf-8?B?aEh0dUliWGJYRjkzQ3gzbUJMNzA5TTNHWG5tMU9sY2hpN3hjVEFJNy9ydU03?=
 =?utf-8?B?M1pJVFdVc201V1ZZRmlwWlhYNm5IVTB5Y28xRkVNRkxyRlJVcE01RFhvbVpB?=
 =?utf-8?B?eXlBN1FVcUNTUWEyYURHdDZQd2FRZ2YyNVY1Z0cwSW1YMGNDb0J2RGNkMGhJ?=
 =?utf-8?B?MjRuYXFOcnZKYkhlYSs4c3Q0NkdENU1lV1I4YS80SXJpcFNwSC9QcHNpdTBk?=
 =?utf-8?B?dnJNQ1I1WFB0YUZ1RlREc0hUMjBtbFVOOHdHQytPcWpTQ3gwTVdHSnd3dXZy?=
 =?utf-8?B?aDkwYzh1ZmtWL04reHJiTHJOYXp5SjhzSkNWbUNYcGVzQ1loRWo4c0ZMTmpE?=
 =?utf-8?B?YjRDSnJQclhvV3J3NVZEakZYNTBFWGRGaGFWSzNxRUZHWEdNdjIza0NQSE9Z?=
 =?utf-8?B?U0Y1d2FwdGpTd2NJVTJ0cE80T1hNUGtpWW8wRW5TcUljb0ZZcy9JbWUwcGNO?=
 =?utf-8?B?bmtsaTMvaW9YajFxVG1Wd3BOM05Ld1h1YmpiaW1JNEtNeXJCaXp1cUFNUU5X?=
 =?utf-8?B?QlU3akpNTFJrYStLaEEwUm9zZHEzTUxJS1ZLeWNxN3Y5ZGxiL2U5VW54VGVh?=
 =?utf-8?Q?/Yds=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd93d1b0-95d7-4907-f1b8-08de2cfcfdb6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 15:03:43.5105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tZmJ0PcceeHJlKx5uFG1l3Z0HevaFQJ3qppaVCuFPdJRV8QyhRXPQaSvM+5R5tWh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7774
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



On 11/26/25 13:37, Philipp Stanner wrote:
> On Wed, 2025-11-26 at 13:31 +0100, Christian König wrote:
>> On 11/25/25 18:02, Lucas Stach wrote:
>>>>> I agree that distinguishing the use case that way is not ideal.
>>>>> However, who has the knowledge of how the hardware is being used by
>>>>> customers / users, if not the driver?
>>>>
>>>> Well the end user.
>>>>
>>>> Maybe we should move the whole timeout topic into the DRM layer or the scheduler component.
>>>>
>>>> Something like 2 seconds default (which BTW is the default on Windows as well), which can be overridden on a global, per device, per queue name basis.
>>>>
>>>> And 10 seconds maximum with only a warning that a not default timeout is used and everything above 10 seconds taints the kernel and should really only be used for testing/debugging.
>>>
>>> The question really is what you want to do after you hit the (lowered)
>>> timeout? Users get grumpy if you block things for 10 seconds, but they
>>> get equally if not more grumpy when you kick out a valid workload that
>>> just happens to need a lot of GPU time.
>>
>> Yeah, exactly that summarizes the problem pretty well.
>>
>>> Fences are only defined to signal eventually, with no real concept of a
>>> timeout. IMO all timeouts waiting for fences should be long enough to
>>> only be considered last resort. You may want to give the user some
>>> indication of a failed fence wait instead of stalling indefinitely, but
>>> you really only want to do this after a quite long timeout, not in a
>>> sense of "Sorry, I ran out of patience after 2 seconds".
>>>
>>> Sure memory management depends on fences making forward progress, but
>>> mm also depends on scheduled writeback making forward progress. You
>>> don't kick out writeback requests after an arbitrary timeout just
>>> because the backing storage happens to be loaded heavily.
>>>
>>> This BTW is also why etnaviv has always had a quite short timeout of
>>> 500ms, with the option to extend the timeout when the GPU is still
>>> making progress. We don't ever want to shoot down valid workloads (we
>>> have some that need a few seconds to upload textures, etc on our wimpy
>>> GPU), but you also don't want to wait multiple seconds until you detect
>>> a real GPU hang.
>>
>> That is a really good point. We considered that as well, but then abandoned the idea, see below for the background.
>>
>> What we could also do is setting a flag on the fence when a process is killed and then waiting for that fence to signal so that it can clean up. Going to prototype that.
>>
>>> So we use the short scheduler timeout to check in on the GPU and see if
>>> it is still making progress (for graphics workloads by looking at the
>>> frontend position within the command buffer and current primitive ID).
>>> If we can deduce that the GPU is stuck we do the usual reset/recovery
>>> dance within a reasonable reaction time, acceptable to users hitting a
>>> real GPU hang. But if the GPU is making progress we will give an
>>> infinite number of timeout extensions with no global timeout at all,
>>> only fulfilling the eventual signaling guarantee of the fence.
>>
>> Well the question is how do you detect *reliable* that there is still forward progress?
> 
> My understanding is that that's impossible since the internals of
> command submissions are only really understood by userspace, who
> submits them.

Right, but we can still try to do our best in the kernel to mitigate the situation.

I think for now amdgpu will implement something like checking if the HW still makes progress after a timeout but only a limited number of re-tries until we say that's it and reset anyway.

> I think the long-term solution can only be fully fledged GPU scheduling
> with preemption. That's why we don't need such a timeout mechanism for
> userspace processes: the scheduler simply interrupts and lets someone
> else run.

Yeah absolutely. 

> 
> My hope would be that in the mid-term future we'd get firmware rings
> that can be preempted through a firmware call for all major hardware.
> Then a huge share of our problems would disappear.

At least on AMD HW pre-emption is actually horrible unreliable as well.

Userspace basically needs to co-operate and provide a buffer where the state on a pre-emption is saved into.

> With the current situation, IDK either. My impression so far is that
> letting the drivers and driver programmers decide is the least bad
> choice.

Yeah, agree. It's the least evil thing we can do.

But I now have a plan how to proceed :)

Thanks for the input,
Christian.

> 
> 
> P.

