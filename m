Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E188ED3A3AA
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 10:50:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2372E10E24F;
	Mon, 19 Jan 2026 09:49:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="r8QIndoh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010021.outbound.protection.outlook.com
 [40.93.198.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 065C610E24F
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 09:49:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vH/bQVjHMfwenjTAtq0JvA3aUSRcugpyiu2k1nvRqpVA0H50kQMmq0JBxnUBRFrrWCs+xGjVlGcwPOawFarT0ChSw+tgZ19O7ufh4tuurd2td4d/TLZw4QZKPhYA3QIw/3lwJWZPVwxZpW/9iC8uuKS7LgQxTlwAfC9jD1860ayYQdxSSXYkpL4KgzkzyA59ejGSyf6v+Uv90uSTuqsWH03pWYE7yG6c5+3U8lAg+YuBAUdVMez96kv7KW7eAQNP34a9V22xv3dXwPL/uTiUBgobDLQSBB4F1fymE9fAaLTSawUxsIwXxr/I2mzcAQq/Fc1kQYGuA2yfhLXT0iSBjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9bk+sGhT4ct8PiRxvu7NJLgmbEDsrCoK9CDbCOgF40Q=;
 b=KM73LDV1waxMHTT9mdY9UvresWAxWgFtg6pvf8G8T4uE1Hjcsk9ReZwArrlflQjfVx1WLnZyIJJKg0h4He1QPg+h0QlUryWpv4QoAXfDYK0c6O5pssOoUNOcSoMTP08QhtQmwbK8tqac0hYmAXnNoxVBj7yuCRDyr3ugZ/iGgCh9zAFyS94sPEB9z8YjafOtXkzpnEiHcJnOTsndfvMxJZYgCoNDGf3/OBZ0MBamCV1+x1FJEWoIJPwJWfyhovMOd8sa6n7Y/ewqAlT9z1RpIy9W3mhomT+w7uCYVFrgfsn/sQFuffCyAmmVKreoozX92joipLBY/7/VUk3L3avA3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9bk+sGhT4ct8PiRxvu7NJLgmbEDsrCoK9CDbCOgF40Q=;
 b=r8QIndohhtZyFin2yLvl57ZXc2KHL9wdMoM6wowlB+EkUXQcK5h9DDp4R0VobERr0I5KKFzOCWEQQAubjbB02v4tnd0Grtlh+DAzCMNqybVkzt4ClZ0ScZ5Xi2sUNqpaiwoGk+f3f5gsUYXwpsiB1Kcvc3hBuVLOkYANPFsLxd8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS2PR12MB9565.namprd12.prod.outlook.com (2603:10b6:8:279::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 09:49:56 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 09:49:56 +0000
Message-ID: <c3d66415-0e2e-4945-917f-4c47f16bf743@amd.com>
Date: Mon, 19 Jan 2026 10:49:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dma-buf: heaps: add parameter to account
 allocations using cgroup
To: "T.J. Mercier" <tjmercier@google.com>, Eric Chanudet <echanude@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 Maxime Ripard <mripard@redhat.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
References: <20260116-dmabuf-heap-system-memcg-v3-0-ecc6b62cc446@redhat.com>
 <20260116-dmabuf-heap-system-memcg-v3-1-ecc6b62cc446@redhat.com>
 <CABdmKX1ZCkF2N1Esi6Uo=jK=soXZe_eWhSSxHtMTcRWs-ZUYog@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CABdmKX1ZCkF2N1Esi6Uo=jK=soXZe_eWhSSxHtMTcRWs-ZUYog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS2PR12MB9565:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fb7cd5c-df5c-4ada-1cf3-08de574019d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aTZOMFJjdUZvUHhsVzBMZ0dPMmhGdno5QVlpUFBXVitGcEQxVDJYa3pCb25Q?=
 =?utf-8?B?QWQ4NlpBNlJWbnIrY01OemZDbVNBeVBydWdkRTVabGh6Uy9OT0k0Nkh5Q3lw?=
 =?utf-8?B?b1RsUmRVcDNVeHU2V2dDMDF2UWFRYlBpdGU5RDVHM0o3M3Izc29Dd3FLaHhs?=
 =?utf-8?B?SGJVZE5xbTFlaUJGVXAyc3hmZ0hDaGhWelpJL0JRNEJEL3BQbTRNMFZ0UW1m?=
 =?utf-8?B?U3NlQmdQUHRKRzdwWHlBUFdLclBFR21tZTgxQUxTaXdQdmlPZjF0VnVESXJW?=
 =?utf-8?B?bTU5SlllcEwrbEwyM2dkY1ZqME1sQmx0YmdLWmNMUUhza3hreCt3cVhVZHVt?=
 =?utf-8?B?b2luRytmWkgxZXYxaWIrSUkxVDJvR2k1ZUlZandFaUp6T1BSOEZTNXhKbUww?=
 =?utf-8?B?NGhVdHBraDVrRGZCN0Q0ZDAxREdnY1VzV21vL1VtL3pNRUdNS1FURU55VFh5?=
 =?utf-8?B?YkFHTEsyUk1WWjZCR2N5cDVjWEczOTZyMFBkaC9yUDg5QlNZZWFsVGMrNnpH?=
 =?utf-8?B?M3dsUUExNHJYcW5ZOW5zRlFZblFndkdYUmxZN2NPRU0zb2J3bExDLzl4TU9t?=
 =?utf-8?B?V2lmeTRiSk9FWkMxVjJwUDRXeFFKQVorbDdONEQ1OUt1SFlESU5BWUtEM1NG?=
 =?utf-8?B?OHBlNlZoOTUvOThTVDV0c0Z6OHN5aEppSTRFYzVWamt0U3JjUzVwTm9MblMz?=
 =?utf-8?B?UkhmVGFoeUZUWjk1TUU0eCtRckNMcTNSQUw2RzIvbjllaG5EemJBNGwwSUd2?=
 =?utf-8?B?WGN3NlcreXZBZ3BieHF4Qm5XZ2JDU1ZRZlhZMHNMaHdqNmlTRnkzVWZNOWhk?=
 =?utf-8?B?RldTTHJWOEwzUHhIcWNNbUhZSDI5UzNlaFFJS1NsRTVtMmVTNkFUWVNMZm1u?=
 =?utf-8?B?eFpidGZSc0UyZ0hKVWwwemc1UTVZbUNGbm5OekFmVGpkTDA1NStwQWdleGE4?=
 =?utf-8?B?ZGJBekFBUU9sUmlrd3QrVVlmS2VmemhZdldzaGN3b0dFU3llcHVoZ2hyK0Iz?=
 =?utf-8?B?VUdwdm00OCtYZjJFdzg0WjNGekF5OEp0VlhtbFIxQlJ1allHV2N6VGp6QW9I?=
 =?utf-8?B?TkRkem1nN3dZUUpqcWFBd0d3Z3hMdnNKL254N2d6SnpkNFYyc3R0UlRNZ0dM?=
 =?utf-8?B?T1dOMUFkdFhuMDVDSUwzL0JCMkdLdkY1elN4Qmptdk9oL3ljMXpONkV2dXB0?=
 =?utf-8?B?SzdwMkZsUzRzT0F3YWJybTJOVXdYTm9mZEF2SGNWSGxTdFJ3N0d4M1p4Mlpr?=
 =?utf-8?B?ZnpSbWhIRkh6VTBia21DRXc5M1hiTk4vUWMxQUFjNDVnejNlNGxSSGFCNWwv?=
 =?utf-8?B?VGpwbFRNZngzZy9uZFJaT2p0RFNXK1IveXlFdlY5Y05HNEJyVWIzNVRHclpi?=
 =?utf-8?B?L0NIQlFhaHlIYmpwcVAvN0M5aVdQdVVQQS8yZnVXMUFRWStsOWNiVHBZUXZ1?=
 =?utf-8?B?QnJnczJ3UG9VU1ZGcEVOeVdoNUxjalcxYWozQVl4ckpYaTN5bXVma0xGNml6?=
 =?utf-8?B?UWUrbGpZUjlJSGxuODBzWnVPMXVCZUtnNXg5V0JZV1VtcjYrRng5MDN6dlNI?=
 =?utf-8?B?OTQzMTE0SVNMU0dVWWg3T0g4ZWR2RGF0anNvcUw2U0ZiK3JlZUREVXZoUlpn?=
 =?utf-8?B?bEQ4a3JnQkdZNDdLTm0zeEgzTVkrSCs1b1JONmNZUlBDZ0hLNWxUa0U4T1VW?=
 =?utf-8?B?UXZqN3Q1VmwvSzdwc0ZqREFqZGhGQ1E2MXA1UmN5eEtLM0wzUkV1c1lyUkUy?=
 =?utf-8?B?bG8wZ2tyMTVYdXB2UldkbWZCblplZlo5L08vd3UwMzFZaVlKTkVQRk5wYVNh?=
 =?utf-8?B?OWY5RlMvV05YVy96b0pvR1JKNTZqaTVjcTQrT080N2xTSmNLWTVmUEU5OUZu?=
 =?utf-8?B?N3MyaHoyeEtUaFRzNE5qVXdvMlhGYXVGMGFYQVZ4RC9UZ2hVMFl4Y3A1Tkk2?=
 =?utf-8?B?YmJVSUJpbTF3cnFqKytGTmdKR2N2ZGdUUWZEV0luQjFDNTkrNkdLUC9IYUpR?=
 =?utf-8?B?QURhREtCenBsT3E5ZFJDLzVNTjl2UzBtOFZRcUZSZDVCMW5RWFdXOFhDdW5U?=
 =?utf-8?B?LzhtSWRvTkZ2U2FDaVl6SDM1YzJQc2FWQ3h4bnB0b2lUcWxsUk1nZFRyVzRo?=
 =?utf-8?Q?h/fs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFU3c2tXM0U0enpCNU1NcTZreHUrRS8yQmZqcUM2bjFiNG80cjVVeCs3S1A4?=
 =?utf-8?B?TTFuc2JVNWJlUis3UnhkWHBMU0wvR2NQVVZVUGR4cW9GazdYWTNnV0tyMm5M?=
 =?utf-8?B?OEdwYlF2ZCtwd1BTU2gweGJQZ1F5SW11bndJMDBvby9uLytmVUNjaWlId0Fa?=
 =?utf-8?B?WVUyTWlUSW9pWU10TE1URU9lRWM1STUzRUdweERVOUhKMTdRTVNkMU9qbWVS?=
 =?utf-8?B?aWg1eFpaUzgrN2psS2xjL01rWGtvNFQ5NkF5RHdiUUFIRWo3bmtYemUzNVIr?=
 =?utf-8?B?NUtONHBIUG5hN0psa3l0b3RKS3Q3dFBObnpoS25WK1VVdlJkWjg3ZFZwMzkw?=
 =?utf-8?B?WnQ0OWR0b2hVNENHQkJXUWtBamljbU4wZzdwOWNGSW45M1pZVGY2UWw1Q0w4?=
 =?utf-8?B?NHdqWkN2RExUMU1TVEs0REJuUzErM1Y4TzZxTlMvbVRabzhCcDBPYUpnaS9u?=
 =?utf-8?B?Mk42RWhJN1ZxZEZYb2xNZXdaSlVIMVNrN0VhQ2pMbldxVHRBVmlQZDcvV2wx?=
 =?utf-8?B?bUhLWSthN1ppSjJ0WEZyUlhLTjMzMkNiTEdsUFYyN1hzK1p6RVdndENHTmhV?=
 =?utf-8?B?Y3pDZkJOYnRHa2ZBeWx5bUJ5TUVVTHlMNWZ1UWFiVVYwTG9BOWxaT2YvMUMy?=
 =?utf-8?B?TWVpV0owd0F5dFhPVmRWeklnUVJVRnBoQkFOdm5lNEU1L3lZTXZLUXF5dW5S?=
 =?utf-8?B?R1lnUVBmemt3SDhVdDFlOEdCMFIzSmRzNzJLQ3dqZnlqTDVsSHpxZWk2cFNt?=
 =?utf-8?B?dTdWSlBYSGZQN0dnaytZcEpCZi9SVjA0ckw0OC95YVdub0NLcXpSbW83QU5l?=
 =?utf-8?B?NUFQeklCalZBa0xEaWJiUU5zTFhwQS9HL2QzT3h2RExrTUE1czhaemxNVXVQ?=
 =?utf-8?B?UnRNV3ZLbmpxd3gzQjk0YlM0S1cyN2R4RWY4eHd6WDdPTE13TUdkS3BtSGdY?=
 =?utf-8?B?SDJ0K2R5TjdOb1AxWVU0aGxXbU9sYTJkMU1zbDg5TjZGazJpTXlkckpncUZj?=
 =?utf-8?B?RkJtV1ZOdStMMXFTZkZXMVJ5aUtMaWVXVkdwS3lYMGdQRGU5UTZzNnhKdStX?=
 =?utf-8?B?WGxNdnVxd0c1VmlCRlo3QTVTZ3o4NnJkNnM5c0JmbDNpa3ZQVWtMSzVNaFZ6?=
 =?utf-8?B?ajVrcHRzMTdaak5LcTMybFI2cDRONWN6ejhyRUg5N2tSNW9qZHNoaXBNWTFw?=
 =?utf-8?B?OXl3ODZXcU1ES3FHK05iNW9lcGZETWZJVDluY3VrZGJtemFwOXBkR3hTWnox?=
 =?utf-8?B?d0pIQjJnQ01lWXloclk5OUNmUXBlYTlodmpsODFlbVNiaWVoMVZXcG1ZMGFu?=
 =?utf-8?B?OS9MTEtOZUlaRDA5djhKZ0JNbzhuWnRLN3ZUcm53eVR3NnhiN1llYmFEaDRO?=
 =?utf-8?B?SUNxeEQzcVFDYzgwRDRZanVlWFB3RXpPRlJ6eENSdS8rdDArTnRxUUhBRnY2?=
 =?utf-8?B?TC85ck5tOWVCWVk2OFd0VG4xRVMreTBMZFJUYis4Yjc2WmhjVllweWJVU2E3?=
 =?utf-8?B?L1dsNmtaakhOSDJEMFZKZExIKzV2SjZTcjE1TXpuK1NQRGkxOGdzUzhWOFBM?=
 =?utf-8?B?ZDBoM0hrd2g5b25DNkVuSDJZdlVwYnFxTjJmdHhOeWZjaUZVeXRlWUlIR3Ft?=
 =?utf-8?B?MVFrbUhzdVU0SU1FQWNQMnRiZ3lnQStLSDVDSlFQeTkxSHZsUDlUYVYrRXow?=
 =?utf-8?B?ejROSUYwMXNvRUxFMk1wU3FVdkkwaGlWMHVJN3EzSXFTZjY3S0hFQjNPQUJ4?=
 =?utf-8?B?KyszN0hsQVZDbEh1enU5QlU0aEo3aDNMcEdXM0JVOGpCbUFFNkhNaU9rSHdJ?=
 =?utf-8?B?WFhYNjYwVUdKZGRjbGhxTDhyRXdvZE1FZU52ajdveWpTRVRPUXZOa0w3U0VI?=
 =?utf-8?B?bVZkTEdpaE84eVpqMUJPWHluNEZOWlNERzZWVU1vZ1BXWVk4WUxWenh2Uit4?=
 =?utf-8?B?WjEzZTU4S2QzZlBEVlpHVUxYNVRpc1VFd1NPMXdTQmxwbFpOT3JPQ1UvQVZK?=
 =?utf-8?B?NmpCYzkvUWVyaTJhRXNBaVZrbEthMVk4OVgzWnJOc3NIVVpCYUhCY1Z4TTA0?=
 =?utf-8?B?aFRyRlREMmxuSW1iYVozcUdRTjVMdzBqMlFVVnc3cys2cXlrL1I4ZFFMSWg3?=
 =?utf-8?B?c2hjKzdsaERSdnArWEQzcWJ0bUhsSlNyS2VORDBlOGZzYklzQXRwUDJ1M3FB?=
 =?utf-8?B?Q3ora24xY0NFSFBTbGYrSXZ2RS8wdnBML0tlRmxRdTJabWtQNjJtUGQ5bit1?=
 =?utf-8?B?UzFiV0RLcm1pMGZJbHpmRUpObjdlY0NTVjQvWHhIME93em1KZ0hLbXgvS0dI?=
 =?utf-8?Q?lCRUhYXFqJFNaexPhY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fb7cd5c-df5c-4ada-1cf3-08de574019d3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 09:49:55.8650 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GOTu5thD5/IY+lksm/KCmT810EqHZ8D5CH/300hGKH118NPcdKuBvSgPjOSmHkdx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9565
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

On 1/16/26 23:36, T.J. Mercier wrote:
> On Fri, Jan 16, 2026 at 12:06 PM Eric Chanudet <echanude@redhat.com> wrote:
>>
>> Add a parameter to enable dma-buf heaps allocation accounting using
>> cgroup for heaps that implement it. It is disabled by default as doing
>> so incurs caveats based on how memcg currently accounts for shared
>> buffers.
>>
>> Signed-off-by: Eric Chanudet <echanude@redhat.com>
> 
> Reviewed-by: T.J. Mercier <tjmercier@google.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

Should I push that into drm-misc-next or does anybody else has commit access?

Regards,
Christian.
