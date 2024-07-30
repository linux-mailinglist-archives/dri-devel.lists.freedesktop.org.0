Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B17CB940CD7
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 11:05:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7AE810E25A;
	Tue, 30 Jul 2024 09:05:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="Ao+MDKzK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2063.outbound.protection.outlook.com [40.107.215.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7553C10E25A
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 09:05:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DlFy1sroSb0z7PT6SbyGucXRPXSXlonTc4UmTRuBR0AreXcaq8/58BxdIJtu2lVO2OONuJ7iBToo/1nPcvLH5fHq2c/tlbkbL/oit/87M9r2wke4iVOhn/bRKtnvctHa+3GRIZggk2vHJmeZjLTb3l1alSjPcJ/LncuNtEa0nryOvbCcK560RjTUUIOUfLXxjNulZ/1dAt/jOn7HumUK0axKKMa/qOfoPynTGPc0oeDbQt2L9wISqnlB8khwqWTQSTLTs+MgECSLgZStljaSSpL/5YmY2O8bZVeU3mA0mw8Y4Sv+DhuE3zPdW706/c9T7EZXVicOwStp0tS1WEwGgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r0BB77gICVMZigc4rPzu+hSqkkPM6I1y+9lzinL2Hq8=;
 b=Pse4ZWsdHK9mL9S5ucF9RH6vomxFi9dNG/hoVs3kf3RhX9nFo13hOLS8pvOamjKBre8wr1ZJ6+55HBXsDg0ICu87zuxDsh0iMY+D+5iRwJYoKkjQ0oLAAsPgsf+6geQi7pSVCvxHVw5n8qfFW+0koxBdnY63hfpCIVroCD+RKch/aQoTTBMNI7QmIQy1teIIgSrgLccfr9AN5uADnQvi3eaSUmc5zObHSJMquagG5POaQJdEujXnocVWUw13FXLbIU/8QeYz+24gJG5BkUf+F3X/uey4d2r0PNzVfhExECyDUN5aFD1vV4VJ7I7lh6txwaDtACpPrF4pOtmDSmMPtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r0BB77gICVMZigc4rPzu+hSqkkPM6I1y+9lzinL2Hq8=;
 b=Ao+MDKzKr6t3vWAq8nDWpDBaIWlOcTxRlyXbda+vVYEgKmULeeW/DPpdWhstN8l/DFVV4BajSWxE9i3ZiZuk4s9kbJnevbdyDfZtsGlspuXyPvZUqq7fVoykSbrEK2OvP/mF0IEI/6Bi/bRaNLC332o2W7W0uDhQy7n2ZYaZZxmDy91dMGNqAw/QmL5/p10Pf1WXpW+vG6XMJPx8/mJ2l3sPbha2apodAjyyhdYwAiMLVCit1v7pWEDlkqVQHlgi8tlZXxhqoj83SU5fChhbjGyGsLQsJEBAqkIMpGJvYfg4PGlUelAz2itcd/bmSMHJVnjDkVoz9/p0it/mUEdtsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by PUZPR06MB6053.apcprd06.prod.outlook.com (2603:1096:301:11a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.26; Tue, 30 Jul
 2024 09:05:13 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 09:05:13 +0000
Message-ID: <25cf34bd-b11f-4097-87b5-39e6b4a27d85@vivo.com>
Date: Tue, 30 Jul 2024 17:05:08 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Introduce DMA_HEAP_ALLOC_AND_READ_FILE heap flag
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 opensource.kernel@vivo.com
References: <20240730075755.10941-1-link@vivo.com>
 <Zqiqv7fomIp1IPS_@phenom.ffwll.local>
From: Huan Yang <link@vivo.com>
In-Reply-To: <Zqiqv7fomIp1IPS_@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:3:18::34) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|PUZPR06MB6053:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d4398c0-2f70-4348-2a59-08dcb076b890
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|52116014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MTB5MXNHT2Vha1paeXJZM3dKZTR5ZGFCMFNZdGd2L3NodmQzcU42c2laSTRn?=
 =?utf-8?B?YU16TExqaVZnclhUWHpQUVF5Uy94b1Erd0wydmdhcHU4UWFMSVo1K3ZpeGJZ?=
 =?utf-8?B?eWdYRWZmNmZNZUwwUWN4NHBVRU9PekxUZGdOMTFUbXROK1hnelBjYzNKRTM0?=
 =?utf-8?B?Z0ZqNDB3MjJudTdXOVZwRHZTQ0o2bW1lRUIzWEhUMGNUVjY5ZDhyc0dtOU9Z?=
 =?utf-8?B?N3RPd3IrNVZ1b09zZE5RYUFZVE9QaTVFeXZzTnN5WWQ4WnoyQklyNnBRS2JW?=
 =?utf-8?B?Z05YVmdKWHVOa0lKaDdPV0xsUGV6dXVUeTViSmdsZjVKL1ZLQ3RSYWNiZE5y?=
 =?utf-8?B?R0Nuc0VCT2NsQWZwdVJFNk5WQnZKZ20xR3lhRll6dXNlRDJMQzY2bHBTMVpS?=
 =?utf-8?B?TmxOM2xVWWRFOXNhUFJkSWV6Qkp4SUJPVFpTWThEcXZTZVc3dkU4cm5hVGc3?=
 =?utf-8?B?SjkvUStkOVpHdDFIR25nUjRSL2lHOXVMdnZETVlZSEFQaXNSNnNVWmlXODho?=
 =?utf-8?B?Um5qVUxzbU10cE50MjlGdWppNEVTRmkwbFpFOEdUakxuVGhBQnpBNjRmUGdu?=
 =?utf-8?B?MGU5Wjl2SkRXL3A2QzJNWlpETTZZZERyT0ZZWGdLeWxEYU9EYWRjTDFZSUFu?=
 =?utf-8?B?VEUxM1k5cms0SVduaGg5OEplU21Vbmpxa2dMKzlnekc0eXNMazhKM3puK2Vl?=
 =?utf-8?B?SmJ2ekFBTE5VNy9sN0g1TXNrY1ZFc2JnTkxPaWErN0tiek8wT0NIbjk4Ny9v?=
 =?utf-8?B?TjNJRTVXNHh5TEh0bk92dWFTdjB6OGkwaE5kYWhyNDdwWUU4VGJ1M1I3VTlX?=
 =?utf-8?B?Vkk2a2I5NlowSCt3Tkx1a1RoMWI5NGRyMGxJdzJBTlhwajJEa0VKRlErR1Nj?=
 =?utf-8?B?N243MGtLdFZUaVoxSTR4K2tDUnhiQ010UHNZZ3RIa0E1aEdVbVJkYzg0ZWxJ?=
 =?utf-8?B?dTRaWXJ1WjJHbUpQR2k2YjI5WmNGZTBIelVwUlBWMjg4bk8wY1pYMVhBSGZN?=
 =?utf-8?B?ZmdhVVh5M1k0WWFPWEhoYVVYNXlqRTBLajRBWEp6OThZUitER2FWRzdyTUVW?=
 =?utf-8?B?aGw0cG9vQktGU3o2MHpkMGhQMm93MUJFWWJ4dFBYSHU0Wm1vL0tOeDZGSTMv?=
 =?utf-8?B?akpEcExNSWdjNnc4UnBkTklBd0JuK1UyN1VLempsa21zd3JQL2E0czZSbEp3?=
 =?utf-8?B?bG9FeEtEd0x6OHYrMzI0ZTB3bGFWQlJMNkplZ1RCYXVCOVhYb2ZUNlc5d2Rp?=
 =?utf-8?B?YzEyL3ZQMHhNYjJONGp0VTBPaUhBV2dnTUdldmNFYmhHNHd4ODBDYnl3U09W?=
 =?utf-8?B?Yk05WjR5RjdYRmQ1T1YrN0NVL3Z0Z1gzZ3RYWmV3UHlDcFo1eHdnV1NmdXdQ?=
 =?utf-8?B?TVZPT0h6MUdmc0NqTUJDOCtiSkVEYVhMYVIrOU5lOElqN2dEOWgvazlmNG9Z?=
 =?utf-8?B?WDdvMVcxQzQzOTNUM2czRWFEdGxXbjdVOUF5dTFOUUxYV0QwRGRSd2xBcTVQ?=
 =?utf-8?B?RndBR2hvY3gzTTE1Ymgrb2JiTzJYOGVWS3FiYlBxb1R3dHpBL2JjUUt6VG50?=
 =?utf-8?B?eTN6UnRDMjZDeGlzU1hUYzBVTnBRYnFTaGlwSnl6dmw5Rjg5SXpaTWhTdUs0?=
 =?utf-8?B?R1J0UkdkWjZGUlJscnhpNTBDcGJEc0U3bjVyZEp6V3RETFFlV3FwWFNORk5X?=
 =?utf-8?B?bFd0eHh5UzIxNVluSlhlaVF0VHNOWW51QjBWVUEvd3RvZVdhRkd4SjZXZDJo?=
 =?utf-8?B?UzRjdU51ekt3VmZIVEhlMmp1UU5YaXBJblhTRXdzL2psQ3JHM0UrYm0yc2Ft?=
 =?utf-8?Q?LsQsYO9jkyHFAQJEq4DyQgUSp3mxeY/GhRGCI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(52116014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFZOQlJ4L1JKK1Jpbytyd21FazlzMEpOUHFvV1BKU3JaKzlMdXR1dEtlaXdT?=
 =?utf-8?B?WmxRb3EzNlM3bE9ZemphbTBDeE91RGs3bUhJaWk5OWZnc0NsRVU5Ym0vMVQx?=
 =?utf-8?B?MmFtWlJwYVpSZ3ZaRUNtYStocEYvd3BZeHlpNldiWlUvZURkMW8vVmI3L3c1?=
 =?utf-8?B?QWkrdzZGWHFoUDJNWDZ5dGdyN1VJVWZ0YkRBUnBvckl4Q2VaMzhyejVqa3Yz?=
 =?utf-8?B?elVJdkY2UnY1Yk5PTVNvSllJRHpWT2RDMDNLTlRxWWtiSEZwUmFQYW1KMk5w?=
 =?utf-8?B?ZzNVLzE1Myt2dEh2Yis2b0l1VW45blZLRG9FT2pSYXREM0szNXcwZDBJemZP?=
 =?utf-8?B?bmUwQzZ5bGZDcFFwQUFnWmpBMmMxWmNqVVk5dVZqa0xRMmdJc2l1NExHWC8w?=
 =?utf-8?B?UFZEV21HVStlRlFzU1QrUnF3U1BIc2FtOWRBcmhySWFHc1NnVFdLUHV2LzFu?=
 =?utf-8?B?YVJ2VC85M0t1OEVHa1F1Ui9lYTVwUVlIT1FBSm5lV29UQ2preE8zbHlpNml1?=
 =?utf-8?B?TktnM3Y2S1JLSVNwWDVjSXdVRXZadGlhMVA0M0VmclRGV1FaMFVnUHNqN3Uy?=
 =?utf-8?B?ZURmUFVBMnhDTVpxTG1yUnF0QkdmUC85ZzJJWDh4WisxL0FaYkhZcHZwOVVG?=
 =?utf-8?B?djFSWHFpWkZ4em9oRTk0Umw1dTBWc2UxTm5jMlphVlcxalBGZnd5QVV4K0FP?=
 =?utf-8?B?NDZyUDRYZ2lFa1MrOWtaSVJzMnRYTGhiZXBVWUlyNmJ2QmJZaXp2L1NMcnE5?=
 =?utf-8?B?U0l6Zlpzc2dIeU9sa0tZeTJQd1pZUmJndDFraEl1WExaeENwRGR2ME9ITmZD?=
 =?utf-8?B?UWpYcS9nZlQ3MjgwV3ZFK1BraWxSNDVhc3VreXlNaitwSUdtMU1qbXo0UHhl?=
 =?utf-8?B?U1RoZnVvNDFXdjgydmd0eFRWaDFGUnRGRjJKM3JyNm9hYTV2ZU4xemJJQU53?=
 =?utf-8?B?ZVRDcUl0YjNCUFg4T0t6WE5OdkZ0ZEc5eTBVU0R5WFNtQWxBQlcvR09VOFl5?=
 =?utf-8?B?V3Q4ekh0MHVDa3hZWE5QMGFPSlY2Q2Q2eHZzWnFibVBFMkJPZ21qdm9iUDBy?=
 =?utf-8?B?WFcwMm9kMDhOTEVYZTlUZm5sQWFCT0tTdVBmZjMxRUNoQitwVWQ4VFhEMGIy?=
 =?utf-8?B?ZUNER1ZhZUg5R1BKUWhIRWMzbDFBNW5MSlFUU01mUTNTakxVcnB1c2E2OXBk?=
 =?utf-8?B?bmZTNWI2OVF2d1hiSTU2Y1Z4OGlTMDV2V3B0d1ordWRrNEJmQ1JuUDgyVmF0?=
 =?utf-8?B?Q0hPTkZKZFRPL25xOENSVHArY2VaZHE5NWtOS2JvYmlHVlBiTy9nWi9VcFBL?=
 =?utf-8?B?aFVkVWIrSU9oVjdXdE11eWtOdGFzTGFCakZBRTR5UU9pekFBdjNJYlAwbU9H?=
 =?utf-8?B?OXIwWEhCd0t1N3BHYUpKdGtnSU15T0dtWFhKbWsrSkpoSXcvZEM5OFNtMnlL?=
 =?utf-8?B?R0hqRE4yK2pRL2NKWjExdEszbW1iU1JDeVRPUmxrcEJISnc4OTBNU2dJOWNh?=
 =?utf-8?B?a2dQb1YrWmR6RzFGMEZYaE93UWozbGNWTXZWQ3R0M3NGRUp4NGNXVElQTDNB?=
 =?utf-8?B?dDlZZXJ2c3IwZEtFOXZaK1RsVGZtVTlDYVp5bHgwOVVRdlRmRWRoRDFDZm1Y?=
 =?utf-8?B?VDFzZVNwS1U3Zk8vVEhjQnJvdW0xdEhJVHVvWG1ZN1d1WXlOek9XTDg4SVJu?=
 =?utf-8?B?T09QdVdvMnZOS2lwcFo2eGRHVkNBcmpOY0JzSFBvbHFhOHRuMVZ5b05ObFZT?=
 =?utf-8?B?NmxHUE9ZNjdZMStuSlhpYS9HVDYwVkh0Zzl4Rko2N1drMlorSWZYaVIzayti?=
 =?utf-8?B?a2g0MDZDaG1ieHpPUVpHVEtHRnFSeTJ1WW1NT2NKazZnN1Z1WlRTVFJTVHpq?=
 =?utf-8?B?TTNLRENzcFQyYU9TQlIrUWRVclgvT2pibVdRYW1nQ2JlWXFYUGE2MTFCL29w?=
 =?utf-8?B?aGtWZFh4bTNXMnJTdmJJcjZVUUErbXJDbU1PWGdnYm9jWkQxMDRkNG41OWY5?=
 =?utf-8?B?aXFUampqVVE4TFUySUwvZG50STd6dXd1ZlNPNEJVb2IzUUFUM3p4UHI3TFM0?=
 =?utf-8?B?aVNXOTNYS3FKNzQvSzkzR1pwMjRSRmtPVHJFc2lpbkp5S0NsZmtJMDF6REN1?=
 =?utf-8?Q?JSTiTziinbBbmLgtD6uSHUdtZ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d4398c0-2f70-4348-2a59-08dcb076b890
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 09:05:13.0542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yPVtYT8BKJ36APL7FZ9duj8ekv9YtYNXkNqHhxW5LdmMWdhMSeDGO9R0L0Bo9Pb9CATGGpE4A/GdS1DkxyXc5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB6053
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


在 2024/7/30 16:56, Daniel Vetter 写道:
> [????????? daniel.vetter@ffwll.ch ????????? https://aka.ms/LearnAboutSenderIdentification?????????????]
>
> On Tue, Jul 30, 2024 at 03:57:44PM +0800, Huan Yang wrote:
>> UDMA-BUF step:
>>    1. memfd_create
>>    2. open file(buffer/direct)
>>    3. udmabuf create
>>    4. mmap memfd
>>    5. read file into memfd vaddr
> Yeah this is really slow and the worst way to do it. You absolutely want
> to start _all_ the io before you start creating the dma-buf, ideally with
> everything running in parallel. But just starting the direct I/O with
> async and then creating the umdabuf should be a lot faster and avoid
That's greate,  Let me rephrase that, and please correct me if I'm wrong.

UDMA-BUF step:
   1. memfd_create
   2. mmap memfd
   3. open file(buffer/direct)
   4. start thread to async read
   3. udmabuf create

With this, can improve

> needlessly serialization operations.
>
> The other issue is that the mmap has some overhead, but might not be too
> bad.
Yes, the time spent on page fault in mmap should be negligible compared 
to the time spent on file read.
> -Sima
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
