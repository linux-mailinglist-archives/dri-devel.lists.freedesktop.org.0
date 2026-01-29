Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOtFOykze2lJCQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 11:15:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B9FAE72E
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 11:15:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 539F110E845;
	Thu, 29 Jan 2026 10:15:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TIcZxlbz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010055.outbound.protection.outlook.com [52.101.85.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFDC010E848;
 Thu, 29 Jan 2026 10:14:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hZ1HOgAEnOv6jkRQinYHVzF8O0N61OmSx5jTL4ZC0Oo8LwjSfVrqmAA0TTHPTlspPNi75omBBbqI37iFF7RhWuthDlIbeLwHElODUjyubq8wCjdnNXO43k1gpM+8vV5QBjeqaJRSUyUDJoKndV8/DktFCejOOptj/ICXkV1YQCbudEC/zw/qVn00guhR3iM/gLd9kPCWsATOUv4C8ZBtnuQyi9TPrt+S5xuKx8ZbWf2gNJR2Q057/83GpyR35dXu8+sh5FPiM5tkdzlJmbQKa1L5jZjU9T6B5OjB6ksGQhZkMtZt2l5SWYJfzoDx81UOFhic7ufM7qbBZ841puxHNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VmNLqiG36sEDXEGUD8wS5j9U32HQ/Pl0xNb6Y0PD6Fw=;
 b=lus7H7zLqqosSYwnSaM3R64QJC/4pXxLLRQ7CDMPRyiN9fANYsWM8CLN8dskZYuNX69KPN1T7ICmEuTTn3ncEOgoL10fulrXuboOKGjZzG9/E1byB61DuUqVZ4MjK8grR75/glDSYsNkva1clfcW+BSXh50yR1a7eNaTSBfCExOZ934GXtGCI0MeILPBwtoahCaIlTemTGyFOA32R3PRrGqUs4k+DhJU1PquM2vvLr9HV+JKEt1ZNByRD/DhGNtVLyhiVaBB3lN92i9kP1Xeyv1xrwmTBr7tf3qWmUfndnaK5PJA6ZifWDReOwsKI52+hwjdCFStBr5T1G5QsgyFlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VmNLqiG36sEDXEGUD8wS5j9U32HQ/Pl0xNb6Y0PD6Fw=;
 b=TIcZxlbzZw+ePsdswf7Q8a8NSPjzPvR3u1+uZOYRe7cpwnStYJrlkebEX9VvkRNmrxrzJ/CyOcOHpMue8m24AzjwsrG4YGT0ljSGUCyUnx7g3fltD56XXobCJZXH9lnl58oSOdUmMMFl09JYHlujRM3yl9gKOU4B6dXB8HzDZxY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB7091.namprd12.prod.outlook.com (2603:10b6:806:2d5::17)
 by SA0PR12MB4461.namprd12.prod.outlook.com (2603:10b6:806:9c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Thu, 29 Jan
 2026 10:14:56 +0000
Received: from SA0PR12MB7091.namprd12.prod.outlook.com
 ([fe80::ec33:1213:cfd8:63bc]) by SA0PR12MB7091.namprd12.prod.outlook.com
 ([fe80::ec33:1213:cfd8:63bc%6]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 10:14:56 +0000
Message-ID: <4bfe8f26-3ead-4d6f-a85b-da83ad45d57e@amd.com>
Date: Thu, 29 Jan 2026 15:44:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Fix memory leak in amdgpu_acpi_enumerate_xcc()
To: Zilin Guan <zilin@seu.edu.cn>, alexander.deucher@amd.com
Cc: christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 mario.limonciello@amd.com, pratap.nirujogi@amd.com, alex.hung@amd.com,
 sakari.ailus@linux.intel.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, jianhao.xu@seu.edu.cn
References: <20260129092532.921809-1-zilin@seu.edu.cn>
Content-Language: en-US
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20260129092532.921809-1-zilin@seu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0071.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26c::16) To SA0PR12MB7091.namprd12.prod.outlook.com
 (2603:10b6:806:2d5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB7091:EE_|SA0PR12MB4461:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dd95c62-b5dc-44bb-5feb-08de5f1f4025
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dkhCQ1R6bVNhQ1NwdTBKMlNUbUNDRzVmTjlXdGVOZUlwWGF4ZlZYcjN5dXpX?=
 =?utf-8?B?cDFxb0VVWFVtZXJiUlE3T2psU3BPWnZWNllwZ3hVN0R3V08rc3BYRUMxRW96?=
 =?utf-8?B?RjFzUC9oRHkxK1JnRWNYU3lMWm1FMTVPOStpRk1HRXZjMVJLczJUWDU5K3A0?=
 =?utf-8?B?TUNTRUxoVzJ6N2tydGg0Z0tQVzZpaWZNOWhYYTVJcVNob1dwRlZ5MW16ency?=
 =?utf-8?B?eFBPa1dmR2d5cWpyUXk4ZVYvN3AwYnQ5eXEzUmtlRkxlUGppUEQ1SWNCaTVt?=
 =?utf-8?B?VDdaT0Y1bzdPNG16aS9GQ29aUnRhZTkvZllNdmtoU2tEOE5RV1hMNDhJVHdE?=
 =?utf-8?B?NkdPTVpxUWZUQVVHeitaRjM3SDV2YytBajhUbEV5ZWJJdGZVZkxXYVhvSnh1?=
 =?utf-8?B?RXd1RnlKNTdsa2QrSkg3T3lBWHU4RkJHRzlyU3NjTm1KY1BtM0JpOFlNQng4?=
 =?utf-8?B?T1Z4aXh5TndaVVI0d1lKbUpoNm0zRGhoWlltWWY5ZXFIeko2MzZ1SjRwSHFD?=
 =?utf-8?B?djIrbU5YV0FHSDNGUXVRQTJhZmdwNzlXbWJHVWsyaDJyZlJHdFQ1cWhlQ0x5?=
 =?utf-8?B?S01MSVdiT0lQYjk5bUZmb0FGeTNaUnZkUUk0QTV1N1JSM2gyc0JCa0VXdUc0?=
 =?utf-8?B?ZFc3ZWp1VnJmeFpZdWszSjNHdzE3YnlWTEpSclhUZUFvMDBaaGlwNWtrbGtm?=
 =?utf-8?B?dXZKNGJxanhnYjVSYnNNTkhhQ2ZLMFpucWdyeUtLTk0yUElnSU10RFBwWi9E?=
 =?utf-8?B?ZXFnelpLeHNjMkNEbVZrNWdDUUZlS3phcE5UMmdVT0hWaERNZGdmU2V1d1Rq?=
 =?utf-8?B?blM5YzNSdlRUeStXSStxS054ZGxEWFhOaUk5MnRGRUkvQnF6eml0c284NUpW?=
 =?utf-8?B?bk1RcTFJS1ZDUXlOYytIajRWUzU3SEpRL3d2ZFNOSllyTXBMWkRrM0VPaHk3?=
 =?utf-8?B?SE1keUQ0TFQrUSszT1c4WHhKK3NFRzAyaDA5RWo1Qy95dTVlSDVsQzdNM3RR?=
 =?utf-8?B?TGJXWXM3UXFJWUF0ZzQxRnRVNDB3MEFWSHRxZmMwbE85NkRnMEZ3M1pVSVE1?=
 =?utf-8?B?eWQzeDV6NGVlbDgrNEFPMWhSSTlwU2tFY3dPZ0NVNFluRjFONTlwTG1QNlhK?=
 =?utf-8?B?aTk3UW5BbitXZVNXT1A2UHl3K2ZDdHI2Qlk5b0JvL0NWTWlRdHkzSzFrT3lV?=
 =?utf-8?B?QUtXVmRINklnSmYxVW0vTXlvb042UDlxY1EvQnUycEJSc2xaTkJDQkdHT2dB?=
 =?utf-8?B?N3Q4aU11OWM0OUpUS1FPUkNPU2JlM0k3cFl4OUh6ckF2TkFGcDViV052VklI?=
 =?utf-8?B?YXJtNmpWamJuNGs0aFNzMGxCLzNyYzdyczYwYUE1dlB1SEZGa1Zoam9CL0JG?=
 =?utf-8?B?L3h3U09hRW05cmdobWtjeEM2ckt6SU5xWjNRUGRLMTAycDRGZ05VVGZrNk9p?=
 =?utf-8?B?NXgxWlNka016ZUNOSi8vMzV5aXpZOWtNQ0Z6dFlZVEk5ZmxjV0c0bWRQSW9H?=
 =?utf-8?B?NUphb3c0V3NoZnlFL0FPU3RhRUg2UUI3ZzViSVJiNDdvS0M2aDd3dlp3VW9H?=
 =?utf-8?B?UWRZTmx4YWdvWVl0cHh0S1dQbzkrS3ZXcDhFcDIxQUJqN1p5L3IyQWV2STZR?=
 =?utf-8?B?VE4wMVM0NEFBYjI2ZjJZQWQwSjhIcHpjL1RwRUYyMmFrVDM3OHNNWStrWU9x?=
 =?utf-8?B?ek9zZzMrLzJaUlV2TnpSZTlzdWo1eThZTlhWdVhzVnlESjlaem55ZWhDLzlx?=
 =?utf-8?B?OWhOeVliTkhobWl4eEh5cTNUamlVVktMMEVoS1dZL2hBQUJVYmM0Z2JWT3ZC?=
 =?utf-8?B?MTdKWFg0cUxtR1hjSTBsUURGc1lmVzVCeDVkbkM1MHl4MVVYZmJJaUJzMmVq?=
 =?utf-8?B?TUJBQU1rc1dVdVVYMS8rNTZ4Zk8vUmhGYkFKZzFocmFGNnBpUnBqTEZwSE9h?=
 =?utf-8?B?UHpwR054WWxYNm9HVml2WCtyZ0NHWVBqWGRLYkR4SnlQU1hqZU5nNWM5SEhW?=
 =?utf-8?B?bGdoclhwRU5wZTVIL1c0c0RJdm4wK0NDQXJZVEY0Rmx6WUhPd3k4Q0E5Uk15?=
 =?utf-8?B?YjNUK1VxTUIzV1NsaHVGWnFWa2JHai82RWFWM091SzdVT1JDZ1NUaUtSQTVF?=
 =?utf-8?Q?l+/4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB7091.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFdVWHFkM2RWb2dZWEdLeGdOcnArWmdncld0QmJQb0dDaHVDd05CYjBFUXBh?=
 =?utf-8?B?c1pMbmFJdE9BNEFUemsvRVV6WVdLa3J4N2FxOEZKR2xhUWNoTmRBMXYxYktH?=
 =?utf-8?B?ZTRiSDQ3V2k2MWJoOHl2bkVCT0JPbjFYN1NGeFUyNlVlQjdYUVRFVTBWaGlh?=
 =?utf-8?B?N2VPclROM3lUeUVvclptWnEvKzI1ejllT0ZSUWQ0UnRZSWV0bDU2Mmh6WDJE?=
 =?utf-8?B?cmgwNkVha1BiOTh2TFpXQzk5bitDUjZRYWk1NVFYenJDU0FXWW13TFU0QTF0?=
 =?utf-8?B?dnZadTdBVTg1VEUzRU1zaHg2SXVoVW1RUXdqTEhvSDg1cnNuUU5ldTN0SGZ2?=
 =?utf-8?B?VGE1MFEvNys5ZzduWEFGOGRZT0JnVUx0ZG9VTFpMbHEwOW13Z2xKY0ZxVm1x?=
 =?utf-8?B?V0xwN2FCR1BsL2t2YXdEbUwxWUlGWldsNnZSR2NJZVpWU2w0TEUvcWtFMlcw?=
 =?utf-8?B?dUtOUEh5d2F0d1J3NTVIb3NubThYSzFIYVZVWkg4cFo3cVpoaUZxSU1mcTVG?=
 =?utf-8?B?YmFOWGNsblpIa2NxZGMyNHp5QVdOeEo2emdPY1h5VnNTZ3VMN0VDUjNkWnhs?=
 =?utf-8?B?RlJTdUVJMno3UFM3aWx1V2xMUHhFdXAvWTc3K0twdmdzRmk5NDc3Mk5vM0VE?=
 =?utf-8?B?eUdwUHFJdldWSThRZDdkMVlubXZTZmV5RGh0ZkFtMnBqNS9kLzZQd3ExaEMr?=
 =?utf-8?B?SlJwK3pkdkNyb0xkcmd2ZzFmdVI3cDR3b0QyMm9BVHE1QzJ4Ykx6dXZRUnh6?=
 =?utf-8?B?bmxjZU9vN1duUlYxdTFqY1lRbGdxSzVvYmVBdE5GQkpsbWxzYkNMQmtOU3No?=
 =?utf-8?B?VnlLRzVWdVpsQ0NlS05FUTlWMXdJRW1oOHJmVDdSMDUvN3NJdHRVR29OcFg4?=
 =?utf-8?B?aFlDRjQxOHU0R0hEanhrdEsxSjZvUDJWNGJOZkZ3OUJwVGt6ZDhwanZNN2Jl?=
 =?utf-8?B?dW8xSlBVRkxvVHhjdkJ2bmtCeldQUUI1blVOZ1BKZkJlMG52MDNoOTFlRFdh?=
 =?utf-8?B?dWlRUzVlcW1lazZ2OUQ2UTdDOTN2dGx3c1lUQTl5L0JkeFZnL1UwbXhBN3Jq?=
 =?utf-8?B?aDBrRHBFekgwSk1pdzM1R2hBNzRnQVN0dU56dU9aWlVrK2p3R1Jmb0hIajhL?=
 =?utf-8?B?WVcrd094alN5NGxOU3Q5VFZRM013OVJ2M3pBSWluYUcyTXhyYU5mMS9PNXNz?=
 =?utf-8?B?UHkvQ29BY25YZFJwNzcvcnhLU0puN0kwc1BIcndXL0UrL2ZXeTF1d0E5VG5P?=
 =?utf-8?B?emFydjJTVUdpdUJ5TmVqcjROSHBoRnVhMVJUWG5sc3RHMzk2S0lsTmVPSDlW?=
 =?utf-8?B?eWdJd08vNGdJdjM3ZHpZOTFWaFhGYXUrMzVOclgvdzB5NFgyYTZ3Z0grVFZz?=
 =?utf-8?B?RlJYaDdyelZxbDVqTE5vNXFON2U4UmhlL1F5aHNkWXA4RnAxSHZZdmtxdUU4?=
 =?utf-8?B?VXBDSWZjeTY5dDgyeU9uK1dRRkxpTGR5MWd5cTNpWEdabzFVQkVUVGJoU1NW?=
 =?utf-8?B?SmFNWDN1UkROOEYxTUJCTjlJaFRXcnlZQzVyUDRiVTdlOGk2c2oybW80Q1R2?=
 =?utf-8?B?V0tyaHFrOU5leXRMakM1U051ay9KdDgrNUQvbXk1ZFI2bHorZTV0TTFhZE9D?=
 =?utf-8?B?N1lDcUlYM0lkQVVNUnErY3ZPYURHTUFmYVIzUURScWpFWW1mSUJHY0I2UnBQ?=
 =?utf-8?B?eTBxNFg1dm1aM2krM2NaaVNzWEt3RVlMU1V1RHdiRzVYbjZ4eE82TUo3ZWtZ?=
 =?utf-8?B?b0pXZy8rKzdmVExPYmJKTW9nUGlEbWI4eVFkTUpsTDgzQzBwZHVXUEloYmdh?=
 =?utf-8?B?OWRPMWlGeUpKd3JFVWtCMTdROE9QcC95UnExVlF5RWc3b0FzWWRPZzYzNDE4?=
 =?utf-8?B?eUVwR0xpRm14L2NpdnFrVTRIdE82TDdSRlNncTFVUnNhalJVdE04OE9TS0xp?=
 =?utf-8?B?Vy8yM1phVzg1UUw4RDlxNktiZkxwbENGLzFwUi9LWnpycExuZ0ZMNWxEMjZL?=
 =?utf-8?B?NGdWalVXRHM3Rm4zVElnNG82Tm4xL1hHNjN2SlRNa3UreFRnWlVHOUhmR1hx?=
 =?utf-8?B?NUpUQnRrV2lxV2tYckZTUXNSYzJ1MVk1cStZZ2k2ZS9Zc2xXYnhaa1RjREFl?=
 =?utf-8?B?RFhhOEoxMGdyOFREUGhJZlM1SURYZWtoayt6aTVxYlRSdk9xNFNUTElHdGc1?=
 =?utf-8?B?YkNLNGRXNk1GRllpMDhTWGZIZzVNRmt3T3h6NXZ1MEdCQng2cmNiRlVudDZ0?=
 =?utf-8?B?MHlldEM2dTV1SVpkcTRFR3AwL0w4azhITVZRMTZWZERaQkRPRnJkNEE2ZjFH?=
 =?utf-8?B?TlVYc0N5R3ZqY3ZKZk5PZ28rUVV5b0hQdWtWMHBtZUNqZTNMciszdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dd95c62-b5dc-44bb-5feb-08de5f1f4025
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB7091.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 10:14:56.2176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IXrAiVTvSq3gua1KyBTQKhUHYq+2gCPmtHOdrjPZCphGcyt0e/NXXQXSpUocIyBN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4461
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,linux.intel.com,lists.freedesktop.org,seu.edu.cn];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FROM_NEQ_ENVFROM(0.00)[lijo.lazar@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,seu.edu.cn:email]
X-Rspamd-Queue-Id: A2B9FAE72E
X-Rspamd-Action: no action



On 29-Jan-26 2:55 PM, Zilin Guan wrote:
> In amdgpu_acpi_enumerate_xcc(), if amdgpu_acpi_dev_init() returns -ENOMEM,
> the function returns directly without releasing the allocated xcc_info,
> resulting in a memory leak.
> 
> Fix this by ensuring that xcc_info is properly freed in the error paths.
> 
> Compile tested only. Issue found using a prototype static analysis tool
> and code review.
> 
> Fixes: 4d5275ab0b18 ("drm/amdgpu: Add parsing of acpi xcc objects")
> Signed-off-by: Zilin Guan <zilin@seu.edu.cn>

Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>

Thanks,
Lijo


> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> index d31460a9e958..7c9d8a6d0bfd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -1135,8 +1135,10 @@ static int amdgpu_acpi_enumerate_xcc(void)
>   		if (!dev_info)
>   			ret = amdgpu_acpi_dev_init(&dev_info, xcc_info, sbdf);
>   
> -		if (ret == -ENOMEM)
> +		if (ret == -ENOMEM) {
> +			kfree(xcc_info);
>   			return ret;
> +		}
>   
>   		if (!dev_info) {
>   			kfree(xcc_info);

