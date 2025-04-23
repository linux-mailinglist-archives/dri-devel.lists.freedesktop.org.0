Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88092A98093
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 09:23:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9BA189336;
	Wed, 23 Apr 2025 07:23:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="Tf1+yB4W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYPPR03CU001.outbound.protection.outlook.com
 (mail-japaneastazon11012062.outbound.protection.outlook.com [52.101.126.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 989EE89336
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 07:23:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GZAaFVz3yyVRZefjpy8Wklvd3VH8d9hI6DsdEx0TxEP1S99wzmWEtodglIdOc4kCIlH4xQwrrRpVx+ccYG+JTO6K7gpTky6JHuUouAhLurb4WF+CC9MxLBQXCIQaFU/6h8rKdD1+PHUFsA20FVOZkWaJvHrSdpynyWzciRye0Bi64ffqJ99dTAit60YlMqatr/wRTOcFzd2QDgUXj2je7c9VxsT9FCW1WTAlrljveipAqy1znjPNtMJqESaN0rhA6uHd5h/cMFzbPNk8nC4rJ9PJQSKreapEig0sgBw9ewqrPmkwO5d4nSxtvZL99X3RQx18Oi6ZYvuilEwLF/Ma4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RIfOJeA/tJBn05oPTAzlGeQ/FHd00cyZCrLFffvVFF0=;
 b=XGI5d9f6o3Z8MPiMUxf8D1eXEdGb7JrWnm+z+W+JrLB26DkSCqyDKqLPcvYBEuGpxuqNzO6smi1f86MPt+2HcPhvD9EjXY7wX7GPGmgzuyuS7vqsQOK+bwmQI3MIA2DC6pqQCVb7xBqjsRj/HhDJisE0W7691uaUMo1GpRTtVGZYd+Q/64V28E9WxvjCPmllDLFlkkIOEMzlj3e1BDPi2I9If9mGo4zixRkXDXr9Qe60Sls/TLlSypkDo6RlsbLKLTszewf0rBRNU+4yJ4T9v6wU9JB8PHtGzDaENqxdduAd13AgApqQkwvtTjZ0OFGHar1vHPAC35xk84j/i7el/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RIfOJeA/tJBn05oPTAzlGeQ/FHd00cyZCrLFffvVFF0=;
 b=Tf1+yB4W+SFPG2wTY11OIvnKVbpFNCfIp0DQrKW/t8pp7enjEmYCBZMfiXeX/A1Pewwfa0tE+ZAvRZJRhdWjXeezSftMCvNIQN026img4Vih/Kes2ajIyDGGSMqTclkPpq4ojXHN4p25LEqECN4ibhVCq5vigLZDyh4p8QVXSUiKZIoJJEnmMq7Ve32+Qfq4ZPTO3/bP2ZmyM7mC1jqJFGXr7kQ9QCER4jhPVAAwoAUyRw+PBdcc5ua3GakiuD2sDhgXTVYyvd9a0ZsvawZ4Q5jgDworoZIY/lpgtWYZiiOJDahLUjkFSbfbMMUhyOPDFdfpCmDl/tYaagYlxFsldA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SE2PPF6DE20C888.apcprd06.prod.outlook.com (2603:1096:108:1::7d6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.32; Wed, 23 Apr
 2025 07:23:01 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.8632.036; Wed, 23 Apr 2025
 07:23:01 +0000
Message-ID: <63297d3f-5e37-411e-8150-108a03a01a89@vivo.com>
Date: Wed, 23 Apr 2025 15:22:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Revert "udmabuf: fix vmap_udmabuf error page set"
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Andrew Morton
 <akpm@linux-foundation.org>, Dave Airlie <airlied@redhat.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>,
 Bingbu Cao <bingbu.cao@linux.intel.com>
References: <20250415031548.2007942-1-link@vivo.com>
 <20250415031548.2007942-2-link@vivo.com>
 <IA0PR11MB71852A481E8A99C9380C7317F8BB2@IA0PR11MB7185.namprd11.prod.outlook.com>
From: Huan Yang <link@vivo.com>
In-Reply-To: <IA0PR11MB71852A481E8A99C9380C7317F8BB2@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0036.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::20) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SE2PPF6DE20C888:EE_
X-MS-Office365-Filtering-Correlation-Id: 931d2967-7da7-4c9b-4ce5-08dd8237ae16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|52116014|921020|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THpzWkt0R29QNlBxbEtvenIrMHE4Q0pacGJ4KzgxWmZVYmExMStNVVNndkE4?=
 =?utf-8?B?OWdsV3plT2l5aVRvU1FwSWVjOHYrcERaWlFlbGUwOUFlMzd6MEpxWVM3aEpv?=
 =?utf-8?B?eGxRZVZ0WDVkUS9NVngxemoyYVphQ3AxSEtTaTYxVzdEOW1ad01aTlFCUlBz?=
 =?utf-8?B?MVNxVDU2cU5SSHFCalZtTFJ4Qit2anB0QjZTRkE3RlJ0TzBvUW9lRit0NTJN?=
 =?utf-8?B?V0Mvazd6UUU0c05RN1JlUnJMWTJoeTBPdmphMmlsMHpyVVY4TTN6STJSRUZp?=
 =?utf-8?B?TG02ZFh0Wnl1eXZSMkRjUW1VVThaMUtGT205VGliSHFkSGczUVlLeXF0eUxx?=
 =?utf-8?B?bVppRUZLbXVZY09sTFdmaUgrQUlaRjJHT3A5eUtSbDFEUFhsZzJicnVxUkR5?=
 =?utf-8?B?NVJRUm5mQ1N1QnpBd3RGY3N6Zm50WERJRXZPNVBXOUM4ZE5seDhYUlRSOTZx?=
 =?utf-8?B?amtWMkFwNDdrSUE0SDBSeEVpTTZ3RUF2cUVMMXIwcHlPUXhpM0VOMzQ1dXBa?=
 =?utf-8?B?eElHWDZDNTBOUHF0QUZoM21wZ2MzRUpsWE5ZaTdtK2xwU3VyemRHYnM4YTdB?=
 =?utf-8?B?RXYyOGZUQUFUTWJwZVVscm13Z3F0QmRaRlNlUmlpUkY3TEpTNC9wNDdnRW13?=
 =?utf-8?B?SWtva3lPa1prcUZuTXE0STcvc29qeGMycHRCM1Rwa1FNR1JIM09XRVB4M09s?=
 =?utf-8?B?N3N6MGNENzlVWnF4cDJWNVhYOXBKeTNGNWJJbE5veU4waWFSS3hsOVFlbzNQ?=
 =?utf-8?B?aUFuU1hvVXF5YXpuWXl2RWxrSmQ2ZTdxZjFIaklZaUsrTUZ5Z29RNmN4SHRF?=
 =?utf-8?B?Nkg3cE82UjhPMjZkZTBiQm9xU1lWckQzZlBKOC9mYUtNcEZ4T0JxalJ6dmxh?=
 =?utf-8?B?VlpUcG8wNmJsdFNJZkk1aTgwcTlZRTJSb3BZSEdEeTdNV3VqVDR0Wi95bHg5?=
 =?utf-8?B?WXlIckxvSWRkZWw1czFDQk9FOGpmQ0t1aFEyM1pweUxjdndCd1JNRnRlOEwv?=
 =?utf-8?B?azBWODNpWmdvSlVNVWN5ZXpUbmkzU1F5bDdvYXJlRFF4UGlFK2x3dVFPTGpz?=
 =?utf-8?B?UjdENElKaXdrcGN6YmdMaEo0YitYWFhnZmNqcVJTY3Urb3ZnSzhDUHFWWWVq?=
 =?utf-8?B?dk5kb1lXYUUwRmNqdG9OTUYzQWpRdFFnNUF2Y1B0N3FIdWQzcGR6cHJ1M3BO?=
 =?utf-8?B?MFVNdVlGUU5PNWQ2c2R5OUxIZnVoVnBISEtzR1p0VFdnemFrQXlJcS9pUHBh?=
 =?utf-8?B?VFU1L3F2S2c3U2w3OVRIL1IyK3hqNlY2QmYrVVFOYVhnVGRaeFBZbzZyNzQ4?=
 =?utf-8?B?cWh1ZWZibGg2NWRCd01mYWFDaXozbWpOKzh1ZjZKY2ZKN0R4TXNnWWpEREI0?=
 =?utf-8?B?eXN6aUxMRTFuZUxFZGdjeStFdkZ3SkZQWDNnR2Q4elpQYy9GZVkrQTl3SklK?=
 =?utf-8?B?NmlLQjlmaGVtTzRXUS9XZmNWaUl4ZE1EY2p1RWNaWUhYWEJsODhSQWs2T3cz?=
 =?utf-8?B?TEhPdERiL1BscVU0TXJRaWNHUitDNy9LTDY0TnNlRVZvMmg2NlJjdHZQejFy?=
 =?utf-8?B?eTArUWF3U2ZNbFJNa2hEK1Bqamd4dEhYWHN5YlpqZGtIbzdHMVV6WjhuLys1?=
 =?utf-8?B?bVViOTFGRnd2cS9CMGJtb0F0Wm0xMnVTOUVlUU9HYUVSWUlPbTFnZlAzR1lC?=
 =?utf-8?B?MXlRQzhBZ3BEZnpsWUlDbEw3SDFMZ1B5dTR5YlNOekpSOER6Qzl1SkJJaXF3?=
 =?utf-8?B?VVd1ck95U2s3a3l1M0VMUFFRcTY5eXdDUzIrci8yK08xZEFFREJJekw5OVZ6?=
 =?utf-8?B?Rm0xTnZVa2drR2taMExUYjE1SUhwVFZrMTVrMDZmZWloWTErUWJnaGJJcWRs?=
 =?utf-8?B?MUljN05pL24wQXRuMGFmWklWL3FoUGlTcjJIbk9OV3hFNXo3eElVK2ZpcXJs?=
 =?utf-8?Q?QFUQGqTQa4LUpDSOIaky1/rf45nV3MZe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(921020)(38350700014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djJtMDBBcEczOVY3bzAyR3NKV1U3RDdrYmYyMGdEUjFLWEVJR2FWSEMwSTZH?=
 =?utf-8?B?RnJlOURZaUNjTkp3b1ZLVlo2c3VxM3ZyWEMzZ1ZRaDVtdUFXME5WdlB6RXFM?=
 =?utf-8?B?a0c0aUExVklhaVhxR2RVMkUxUWFzbkFYaGd1ckdqQnRhTmNBZXVQTUZuY0JR?=
 =?utf-8?B?VmRBMGtqNXZFRVpSZEcyaU5MYnRKRTFMQS8vRWxCTHZvRUR2bVhSdVMwZ0lw?=
 =?utf-8?B?eG5sNjA3Q1ZQN2ZGa1RmZWs0YW4xMmczRjk5L3E2dHhRVnpaaHFJN1NvU0w0?=
 =?utf-8?B?ZVdDZ3JzRzBBdkwvZlR6MDZwYm1PSmZOZUtyNkNGZTlsUjljellQd3d2aWxJ?=
 =?utf-8?B?cUhuRXZER0FTb3RGVkNFQ3VxQnEyQVhKaitFa2JqaCs5VmlBbXlBMzFsNFBE?=
 =?utf-8?B?NlJJNGxKSkpjMUFXS2FFVC9jbjYydmcvSHVOdlZ4aHZEOERvWDE5UkhFcEhF?=
 =?utf-8?B?RkYycmRucS9FNzNweFIwU2orem16cTQwWGEwSUZTQnhpclc1ZmlIdnZQY1Uy?=
 =?utf-8?B?OThzYm9tOUk4UmtiYlVkQnF2QURzcitYZjhqejd0TW9XcG5GbnVydGdZZzBS?=
 =?utf-8?B?bGtHN3Fuckp3by9rQ296L1RzWjdoS3ZFd2IyY3hkR2YrNnhta3Vka0F3VEFP?=
 =?utf-8?B?azFhZVc3b3dZMWMxZ29nL0JtbTE0bUZBQnc1Ty8zd0F6SGQ4VjV1YytHeEow?=
 =?utf-8?B?L09rL2wycFlDRjVqY1hWbnFvVG03VFpNa2JwT2FRaWM4QTRLV2l0bDM1VndU?=
 =?utf-8?B?K2gvMzFCMzVhelJhNHlHMmZ0bGEzN1VQVTJjei8zcWVpOTBUWlVCQW9VeFRH?=
 =?utf-8?B?SE5iejhCYmcxUm90MFZyaENhb0JXakp0V2VIS0ZnS25CL1RmbEo0QjR3QmdH?=
 =?utf-8?B?TUpFdm1ZSmwzZ043TzF6NkUyQ2Ewc2h3Vkl4bm1rVWNsMnhMLzRmbVRwdlY0?=
 =?utf-8?B?d3hZM1hFcjVTRHQ0M0hma1F3UWpOa3REZUk4U1U0TUFGSnN3TUoxdHRiYVlV?=
 =?utf-8?B?UUd2dFZSZ1oyTlR2N2d4VmVhUjdHTnJVZklvRS9XUFlTOHF0MHVka3hQTFFo?=
 =?utf-8?B?eW40QUFTWDdtcERqczBUQUVVcUVWV2tlV2xscktaZ1ZqRS9zY0IxVWxSUWdT?=
 =?utf-8?B?Y3hIaEc0dUh0K0ptaTF0eG9YRHBoTHJERC9CeFdJcS9YWFNDQWQ4ei9mZ0tP?=
 =?utf-8?B?V3o2REM5VmhqUEp1V1JheGowSjZjMTFOSURzd05BTm5tdW4raFc4cFB5Ympm?=
 =?utf-8?B?WEhRZS9UcXZUcGM5L2NmaXhJNUkxWlF5ZDc4MU1NYWgxRlpPcDRGN2VuVFJv?=
 =?utf-8?B?MDlBT3daRXlEZUYwNzR3TWMrR2JjQUpRZ0RJUUs0eklrbGJyMnRIbzc2RnBF?=
 =?utf-8?B?ZkRUY3RIMVNnOFR5SWRRQ1Q3T09BVEtiRUhLUHhzRW9iNmd6bkc1eU5VNUhz?=
 =?utf-8?B?T2M2WDV5NEc4akxkZ2pJZlVBMzlESi9BUytHUXdLWC9nZWI3YVlQL0xhSmdv?=
 =?utf-8?B?VjVwV3JxbmtvV2RsWVA3M3BhY0dFeVlncUdCd0Z0bG5zTmdlMG9sM3o1dkh3?=
 =?utf-8?B?TXEvZEZZWDZ4TVlQaG9BZUJ3SzlOS1ArdnFrU3hMTi8rb2srVEZUajZXQVhk?=
 =?utf-8?B?TlpKZXFSTG1NTnRiYXBUd1RRR1NGVml6c244aTBGWnBTM1dpaFBNcm91QS9M?=
 =?utf-8?B?ZkIvMVFJYU10cWYrUzd2VTJDK04yL0lFWXlzSzRiM2FTS3A2RnBGVENJNjVF?=
 =?utf-8?B?MERlNTlydVNFRkloa1hyZkgwYnZKOWJLcDVuRnJmMTF2UktaVTV4eDRiTjEz?=
 =?utf-8?B?alI3ckdYcUM1L3hOYXAxMmQ1VGY0ZS9hc2ZIR3IyMXNFYkF0MzdkSStSOUI0?=
 =?utf-8?B?akFCb3VrbkJ4K1RVc08yU3d6WEMwNkVyOUdPNUNhOU4rWEJJTTV0MmVpd2lY?=
 =?utf-8?B?eVlNVUFRNTZDRzFvR1hSTlFPYy9uYzFtZ0FKUW5NZkdTRlorYXlIQ1JRY3Qv?=
 =?utf-8?B?amJubUhuR2IwS1lJanI4a00vNlBHekxNMUtPelpuNGRzOUQyTndhTHRXL0dM?=
 =?utf-8?B?Y3JSSUMrTUVmVTRXYy9YTkpOM2IxOERUTGMyN2F2aVRiUXBvc3V4bG5vYVV6?=
 =?utf-8?Q?IA8sa6YMBvLWJ/1Ylm98DcUZj?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 931d2967-7da7-4c9b-4ce5-08dd8237ae16
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 07:23:01.4032 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eIsoSgr6fagPW3uy8qm+a1Ni/zUsunbA1EobbBMVC+DNzZShiHRFcSB9M5jFyWGMAR4D4s8SUqG25gKBivfy9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2PPF6DE20C888
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

Hi Vivek,

Thanks for your ack.

在 2025/4/22 13:14, Kasireddy, Vivek 写道:
> Hi Huan,
>
>> Subject: [PATCH 1/2] Revert "udmabuf: fix vmap_udmabuf error page set"
>>
>> This reverts commit 18d7de823b7150344d242c3677e65d68c5271b04.
>>
>> This given a misuse of vmap_pfn, vmap_pfn only allow none-page based
>> user invoke, i.e. PCIe BARs and other.
> The commit message can be improved a little bit to briefly explain why vmap_pfn()
> would not work for this use-case.

OK, I will update patch direct in later reply.:)

Thanks,

Huan

>
> Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
>
> Thanks,
> Vivek
>
>> Signed-off-by: Huan Yang <link@vivo.com>
>> Reported-by: Bingbu Cao <bingbu.cao@linux.intel.com>
>> Closes: https://lore.kernel.org/dri-devel/eb7e0137-3508-4287-98c4-
>> 816c5fd98e10@vivo.com/T/#mbda4f64a3532b32e061f4e8763bc8e307bea3ca
>> 8
>> ---
>>   drivers/dma-buf/Kconfig   |  1 -
>>   drivers/dma-buf/udmabuf.c | 22 +++++++---------------
>>   2 files changed, 7 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
>> index fee04fdb0822..b46eb8a552d7 100644
>> --- a/drivers/dma-buf/Kconfig
>> +++ b/drivers/dma-buf/Kconfig
>> @@ -36,7 +36,6 @@ config UDMABUF
>>   	depends on DMA_SHARED_BUFFER
>>   	depends on MEMFD_CREATE || COMPILE_TEST
>>   	depends on MMU
>> -	select VMAP_PFN
>>   	help
>>   	  A driver to let userspace turn memfd regions into dma-bufs.
>>   	  Qemu can use this to create host dmabufs for guest framebuffers.
>> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
>> index 7eee3eb47a8e..79845565089d 100644
>> --- a/drivers/dma-buf/udmabuf.c
>> +++ b/drivers/dma-buf/udmabuf.c
>> @@ -109,29 +109,21 @@ static int mmap_udmabuf(struct dma_buf *buf,
>> struct vm_area_struct *vma)
>>   static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
>>   {
>>   	struct udmabuf *ubuf = buf->priv;
>> -	unsigned long *pfns;
>> +	struct page **pages;
>>   	void *vaddr;
>>   	pgoff_t pg;
>>
>>   	dma_resv_assert_held(buf->resv);
>>
>> -	/**
>> -	 * HVO may free tail pages, so just use pfn to map each folio
>> -	 * into vmalloc area.
>> -	 */
>> -	pfns = kvmalloc_array(ubuf->pagecount, sizeof(*pfns), GFP_KERNEL);
>> -	if (!pfns)
>> +	pages = kvmalloc_array(ubuf->pagecount, sizeof(*pages),
>> GFP_KERNEL);
>> +	if (!pages)
>>   		return -ENOMEM;
>>
>> -	for (pg = 0; pg < ubuf->pagecount; pg++) {
>> -		unsigned long pfn = folio_pfn(ubuf->folios[pg]);
>> -
>> -		pfn += ubuf->offsets[pg] >> PAGE_SHIFT;
>> -		pfns[pg] = pfn;
>> -	}
>> +	for (pg = 0; pg < ubuf->pagecount; pg++)
>> +		pages[pg] = &ubuf->folios[pg]->page;
>>
>> -	vaddr = vmap_pfn(pfns, ubuf->pagecount, PAGE_KERNEL);
>> -	kvfree(pfns);
>> +	vaddr = vm_map_ram(pages, ubuf->pagecount, -1);
>> +	kvfree(pages);
>>   	if (!vaddr)
>>   		return -EINVAL;
>>
>> --
>> 2.48.1
