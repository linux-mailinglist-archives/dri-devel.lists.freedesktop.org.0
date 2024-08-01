Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE66944171
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 04:54:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A3310E737;
	Thu,  1 Aug 2024 02:54:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="d5NimfmC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2057.outbound.protection.outlook.com [40.107.255.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC37710E737
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 02:53:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p/XI+IqxBRZ6oRPW4pZwms/lheo1sQK1vw34MTsfQ8TDSkCKfRen2zdui+GqpzQQqyufQlVGIusri7lgkESu40FtDF2C+6pBZL+iTpZywUgxmrp4PAtL+DtTG/Cz2WTMZzIpkZlYcDDay1zjdO31JOU02OX8j1TK2HpKmtRgqXKQkfEjDOJ8jZp2lhQvQ3dRlt+Nup9bVKbRPvFlpqXHW9IcciHTr1vCv2kJsGZPbL0sl+PAdfonSYt+XqoPsYcbwbi9vKHTBgi+24ewD9gacDKczONOm5kbowe6RxC0o1brB1/yNmqZTwWiaXGW9HYY+1QMLgs85C1GZH7iPpKEBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uP/Jw1k1qKo1kq+MykOp0fXzr1GNQPDTxB46HyhLCOg=;
 b=m256usB7yETfaEk+EwRcQn2NWLJSngHTMTIByFj8tOmaWD6+RiHIOoP4isSmxWLPmZiAh+iiy3xAQ7GHQLxaGyb+PwjWcuCegXig8Ozzk7PLNS+qyKNHwGJv3S+6r8b7cxJgJMAoJbJyM/w2g/M7yoKR2W96BAO1pkNcvv/lEJ25vck7lIjQVjItKTMDlcMVw1WMTagULiOesov1LuWznREMny/nDUbAK0F/t2r3KJCNzG6AEoMFW8EWUAv1ACKXBI7iFGrqdEECm5W7hnEt9JtXTTuy/Yp5SA04W/Wj3XtA/6RA9BjCUKKHdBSJjE+x2Ta3WBIz/ooTSoZpzKT1gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uP/Jw1k1qKo1kq+MykOp0fXzr1GNQPDTxB46HyhLCOg=;
 b=d5NimfmCZ7RrxJU1/LuypYyqD8qmuOF4MnoTNb3TuP6XHUZE5cyZ50uCls/qVFmadMgUsNJ31JdfHNxz3N2mpevAWi56Va7icVyWEKYdOaQC37eYsHZI0pF+1843ZjWU/uYhePaxdpiIKSjkSkCdruFS54FQM6W1MYh+CW4/4ONO8zqfwGXzSrzsaKehY02YM9qFWTWMmkCFH5XIFjRMgUC1cv3D91IMgJ+inOVJ3mtuA1un6M8WHFwKy/tBMXTwJ3lSrIMa3sOhaQUcA4sI2ehQ/IrnXVux0HbGw9Jz7k7Cqh5D778aVKiUNrfQ4y4rU7wE7MGhkqrMVO1nrlsXPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SI2PR06MB5137.apcprd06.prod.outlook.com (2603:1096:4:1ac::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Thu, 1 Aug
 2024 02:53:49 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%4]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 02:53:49 +0000
Message-ID: <4e83734a-d0cf-4f8a-9731-d370e1064d65@vivo.com>
Date: Thu, 1 Aug 2024 10:53:45 +0800
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
 <25cf34bd-b11f-4097-87b5-39e6b4a27d85@vivo.com>
 <37b07e69-df85-45fc-888d-54cb7c4be97a@vivo.com>
 <Zqqing7M2notp6Ou@phenom.ffwll.local>
From: Huan Yang <link@vivo.com>
In-Reply-To: <Zqqing7M2notp6Ou@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::10) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SI2PR06MB5137:EE_
X-MS-Office365-Filtering-Correlation-Id: 864f15c0-df37-4cf7-9b68-08dcb1d52b2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|7416014|376014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WDgxSitMLzZEUHhDUGE0Tm4vQ3kybE1RYWZKNlRITU0zRmhIYTMxM0VEUGUv?=
 =?utf-8?B?dDlSdXk4MWpjZ0FwaWhYMndRVzJDbWlITHJTVTBzeUJ4OGJJeDdWREhDL0pn?=
 =?utf-8?B?ZGxDdWkyZkE0YkpYVnQ4aEU1QVhGd0RidDdHUGFvYmtnYVkwQ3Y5dzdyTGR2?=
 =?utf-8?B?d0Y1ZTc3VitXQ2F3S01ZYzh2akM0VTdGeVF3bG4ycVlRa2pvZWdzenZKSnlr?=
 =?utf-8?B?MWxaSzE2QUtTdGZvRE1nWi9LWko0WmhEKzZiY2ZKVkJBeFdnYUViUGRTTC82?=
 =?utf-8?B?UzBuNHRQWENXZ2duSW4yQ05oNlBSOGdBUW5SZGNYWktEMnA0U3RDUmtkN050?=
 =?utf-8?B?L0MzWncwR21tQXR6bk1ITFgrVjRCS3hhdDJHSEYyNmdQRWtnMGJqZGQ1L2tj?=
 =?utf-8?B?b05GeDN5OGwyNjcxaHZtR01JSHUwUERLMm1MZ044UzlRQ2VMQWdCTkZDYjZw?=
 =?utf-8?B?eE1NUEpZaGZPenJieVZGK0pIeWJjZHZIdHJseUN5TGgyUmt3ZEQ1VERyMWcv?=
 =?utf-8?B?VzBvTjBQekwyajFpUDFodGVRakdQWW5adlVCUW9ybk9jTVFQMHByM1F5WnlH?=
 =?utf-8?B?YzhxRHpubG82ZUIwSVdJRjdmbUNSYzdwOGcrZGFydi9qVzRaNkhvQU5hTU1i?=
 =?utf-8?B?bHI0QU8rdGVZQTZJYXQwLy9HTlIreGxFRjRYOGdPWDRPMDkvSEN6aWplS0xm?=
 =?utf-8?B?d1I4VXBHRmlRckdacjJlNTRMU2N2RVhYdXJmTDdMZk43V0dFVmlKeG5qdjZE?=
 =?utf-8?B?T2gwMVJvdnBFeGtyUm9GeFlXdGtCc3Rtb1ZZZEtmV3VpZ2UvMXp3RGdULzFa?=
 =?utf-8?B?NjFRbkg2amYyMjU0SndDR0xIaTlkRVVMa3YrYXpLb0JKajdzLzV6RmxpYWRM?=
 =?utf-8?B?dFo0TXZ4WU5VdzFOQ2cwOWlQV21zTFFtZkE4VUlqUzZiNlc1YXFQYzBiQXlL?=
 =?utf-8?B?N09ScGtzU1pTQTRtSGtoYW1WRU1JNXNicm1OazRDam50TWRVc0plRXdDNWdD?=
 =?utf-8?B?SWVUMnI5M3JZanFONmZuTFk2WDlLa0ZGRGdGcFNnRGNvUGxJNGRUeEZteHdM?=
 =?utf-8?B?L0NIQnArNG56bytPT1R5Q1J1RXZYU3JsMGVMNjE2ejN6b2sycVVBUm8zT3Rk?=
 =?utf-8?B?TWNIQVE1RDBkUVVwWG8zTk9SUDUvVGlIRk50QndIeE93NWp2M0pTODRPaUF1?=
 =?utf-8?B?VDkxbjNMWFZoNnRxcXNmMGJncVdPalBFVWkzSjk3ZnJIbWdsZTM3WmNGRVJo?=
 =?utf-8?B?d28wU0VzMk1hWW5BT1BETHZrUTExZTNOU3pSdUdLaFdSZGZXZmcxM1BHdWZO?=
 =?utf-8?B?YUJiR2dPeklEaCtDb1VJS0JENTNWck9LTU5xMm9uVXhpZUpGVlEzeTFYUzlr?=
 =?utf-8?B?YWJ0L0hVTjh6OU9pNmwvRUNCV2U0aFNOQWR3b0ZRQmhRbmFMcUFuck5mS2pr?=
 =?utf-8?B?NzFhcG5NTHlDQmRmODZvcXU1cGVyZEUzN2tSbjNpRXFGY1I0amJHc0JRY3Nr?=
 =?utf-8?B?MCs2cGtwckJMTjlqTHpreWM4dkhJY25kQi9temJSdE9BMVlpQVlaZEw2ZGlH?=
 =?utf-8?B?SDVvZktFdnFLU01pd1B2WHpBN3k2TFlCYWxDU0dTNlk0ZjQyOWNHUWpGTlVn?=
 =?utf-8?B?TGJNWEdKWlovclBKRENRK0pvY3d2TTJWREZWV3Q1a0p1NGtEUzZ6QjNWUG5O?=
 =?utf-8?B?RXZhWmNMM0lYZEt2VVVrUFNsUmZWYmxEbEhLQ1o1QkZiRnNJNEdPM0h1RjA1?=
 =?utf-8?B?ZnM4djdXV3R4WmdBOVJxN0Q5UXFLYXdXaUpYY2ZqN3kwQVFkSWprcnRIY3BO?=
 =?utf-8?B?MlBBMFBVaGNKK1pOeDNyVHhyMFI2TVdwQy9FWC83OXhSVlhlOWJCQ0hVUnY0?=
 =?utf-8?B?d2Q5T01GQlU4U1NPMVZyTnA0L0hQZXgyZGhlVk9GM0VubHpZZjlKdVMzbWdO?=
 =?utf-8?Q?M7zuk5ldtRo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mjh2RFNpZ1FPK0hOM0plcWhlcVJKWWhZc2pEVVQzV3VkYVpXbWVUMVRnWExi?=
 =?utf-8?B?Y0FKU2ljZkJlVVJ5SUJCR3BPVEhjSEhSSGM2a0dablpZNk55dkZnZC9QMVJB?=
 =?utf-8?B?RU9FY3RhYmlkTGV5SnA3UGVZdE9RL3BpM1k5ME9RYzJhSHJiYjhrVXhmTUFs?=
 =?utf-8?B?WDd4WmRRMDZmZnZFdkE3a2IyQ1hST2hqaXl1YkJCazNkMC9QcVIvb3RheGwr?=
 =?utf-8?B?Qkw4ZFJ3ZnNWWTZuVWkwbTcwOU8rZkRSV2ZhRTIvN2FtTFlUd1pncUUzYlBl?=
 =?utf-8?B?OUExS3oyWnlVSHlBNGJ4Y0p5VFVQdktHSkxMS1MxMU50V0Iyd3Rmb0ZUcUJX?=
 =?utf-8?B?VEduenBqU2lPbW9JdDlvQi9WRzZpV2JBOFJKdDk2UFc3R3JCYTRYa2s0VzdD?=
 =?utf-8?B?LzRuRHBoNTVzQnpTUlVqdWhQYmpGam4wMkRoSHpGU3FKVE9xdThoVTBWY0tu?=
 =?utf-8?B?U3BDUXMzQ05oNndKMkR5OFRSM2ZQS2Z3ZnU0UlZFZzhUTE5jaWRSZXI5QzFZ?=
 =?utf-8?B?QTJtZzZXcERCRGRDQmNYbFNIM3FJTWw0VVRkTGtMZ2M2SEF0Rk5IZlVqVzRY?=
 =?utf-8?B?eGZUTUxmVHk0OTBFSUM5enNlenZ6aGZTSE5BQ2dwb1krcjhwbEt5Tm4xbndE?=
 =?utf-8?B?bjM1OVQwVkMxTUI4OXlsVStXQzVLVUVVTWdaRUJLQ0tmRGk1UUFQNjYrckl4?=
 =?utf-8?B?ZkF0WTVUb1VGSHV5RnhLazdjTm53Tmp6ZS9ibzMyb2xpN0hBVG1IU1c5U0Nq?=
 =?utf-8?B?YVZrWUJ5NHNsenQzZ3BjSnltTzVsOTZoL3JJQzhFYWxCaG5nV2hGbWFmWEIr?=
 =?utf-8?B?U0wrNnBsVGoyNkdWcDhyV3JqUy85M2V2S2lPeHBkSDVIaVZQRmtFa3pablNU?=
 =?utf-8?B?K1kwNm9VZFBpdTlaeFcwaGFoVE1wUU9TdmoxM1c3aTZDRHpoNGZDWU1VTGFq?=
 =?utf-8?B?ckhnUGx5empYR3RTNSsya0h0NDliWnhuc0hKQXV6TkdnNXc4NzEyTWFVUm14?=
 =?utf-8?B?NG5oUWI2ZkhGUXVGMi9IL0VNa1BseGd5Yk50di9Ubk1nY1ZpdVRIbXpGT3Z5?=
 =?utf-8?B?ZnVRRDN5Y01EUjNTYnI3eVM1VkRPWDBvWnU0TzdFNU5KWDJvN0xmWDVFV1hS?=
 =?utf-8?B?TEcvWm1XRGhaMHJQdnlzaGZDTHNBZHliMVRiTENBMWQwMDAyS1QyVXZoSGh1?=
 =?utf-8?B?N2RsT2pOT3h4UGlQSVR6NEhQM2xjdkNnRm9yK0U4UG9QMkt3WVhxalcxbVBQ?=
 =?utf-8?B?b3BBNGRkNFZRbjhkM3Y0U2ZhNjJtRjB4d1B2V0IzUnVOMUpGRTdndzRwTXVt?=
 =?utf-8?B?U0hYcmRQOElqL0tsUzVaaW1YL2E2ajRKYmFWR2dVODJxK2tTOTRYSGpWcnNl?=
 =?utf-8?B?ZGFhUGx2R1dPVEdGVWFZSm9VQnh5ckhwTVQvWDF2Vmg1VTFtckdKQ1dhWnpx?=
 =?utf-8?B?K2gvV3R2b1dUYkF6LzBuU21obG8xUVBuTDk2amZ4MlhCcEJKMlZFRU02YUNx?=
 =?utf-8?B?QlhPWU56Yi9qQ3NIVW5kbFN0M1RhTVR2OVk2TFIxSDlZSWMwYTRqMUNPTGdB?=
 =?utf-8?B?UVE1OWRzcE1RVEV2UzR5ZkdobGNJdEVReHB5V1pZTnRKczB2bUFVeG01YWky?=
 =?utf-8?B?SlR5VEF5cDdZdm00RWkyRWo3aGNqSkFTRlR3SlY4b2xoVU42Y2FDemxoWTMx?=
 =?utf-8?B?VUZqMStQMk1TbkYyMUVJK2NDWmczZFpiWkVhR0hjbDdacHpQQjJERlR3a2Zq?=
 =?utf-8?B?RFdXQ0tUT05MM2pDSW5XM3gxL3JMNWhKUVFrYktLSEtrcElDaWtDckZlRkZP?=
 =?utf-8?B?NWI0NGl0WGwzbHpma0k2Tk9ocWtQVGpMWjM3bHNIeE1wdjhpa2hUQXNVWFp6?=
 =?utf-8?B?MzgzNjdqWXJkeXpZeTMrZ1NYRHV3ditFUEhNM0NhS0gwRmNhREdqNTVhSGVM?=
 =?utf-8?B?Z01vQ3RVTG9pN21oOWdEVk5QV0lKck9mZHhXNVU5dmxRekNyTjNyYjFXK3RS?=
 =?utf-8?B?VmFTeGpFOTZHUnhkREE3VGxMUnhSVDZsbVM5bXdnTWFPc3FLZ3A0U3hoSjBz?=
 =?utf-8?B?TGhvT2l0cWdSUTA0bG9ESEppcFF1cHQ3ZFRsb0VJczJzRXd2SE1YU0hQdjNs?=
 =?utf-8?Q?UpXk5U1KhWZYX25HjylvtVt/0?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 864f15c0-df37-4cf7-9b68-08dcb1d52b2a
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 02:53:49.2243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vGTtp0jXQ1y4nZMxdPJ2jrz8GsqyWTvB3UzzU+xpBkua8UJnqoRvaEfv2HZYDV0FCPGsVB0YtXtV5AR+pbm0vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5137
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


在 2024/8/1 4:46, Daniel Vetter 写道:
> On Tue, Jul 30, 2024 at 08:04:04PM +0800, Huan Yang wrote:
>> 在 2024/7/30 17:05, Huan Yang 写道:
>>> 在 2024/7/30 16:56, Daniel Vetter 写道:
>>>> [????????? daniel.vetter@ffwll.ch ?????????
>>>> https://aka.ms/LearnAboutSenderIdentification?????????????]
>>>>
>>>> On Tue, Jul 30, 2024 at 03:57:44PM +0800, Huan Yang wrote:
>>>>> UDMA-BUF step:
>>>>>     1. memfd_create
>>>>>     2. open file(buffer/direct)
>>>>>     3. udmabuf create
>>>>>     4. mmap memfd
>>>>>     5. read file into memfd vaddr
>>>> Yeah this is really slow and the worst way to do it. You absolutely want
>>>> to start _all_ the io before you start creating the dma-buf, ideally
>>>> with
>>>> everything running in parallel. But just starting the direct I/O with
>>>> async and then creating the umdabuf should be a lot faster and avoid
>>> That's greate,  Let me rephrase that, and please correct me if I'm wrong.
>>>
>>> UDMA-BUF step:
>>>    1. memfd_create
>>>    2. mmap memfd
>>>    3. open file(buffer/direct)
>>>    4. start thread to async read
>>>    3. udmabuf create
>>>
>>> With this, can improve
>> I just test with it. Step is:
>>
>> UDMA-BUF step:
>>    1. memfd_create
>>    2. mmap memfd
>>    3. open file(buffer/direct)
>>    4. start thread to async read
>>    5. udmabuf create
>>
>>    6 . join wait
>>
>> 3G file read all step cost 1,527,103,431ns, it's greate.
> Ok that's almost the throughput of your patch set, which I think is close
> enough. The remaining difference is probably just the mmap overhead, not
> sure whether/how we can do direct i/o to an fd directly ... in principle
> it's possible for any file that uses the standard pagecache.

Yes, for mmap, IMO, now that we get all folios and pin it. That's mean 
all pfn it's got when udmabuf created.

So, I think mmap with page fault is helpless for save memory but 
increase the mmap access cost.(maybe can save a little page table's memory)

I want to offer a patchset to remove it and more suitable for folios 
operate(And remove unpin list). And contains some fix patch.

I'll send it when I test it's good.


About fd operation for direct I/O, maybe use sendfile or copy_file_range?

sendfile base pipe buffer, it's low performance when I test is.

copy_file_range can't work due to it's not the same file system.

So, I can't find other way to do it. Can someone give some suggestions?

> -Sima
