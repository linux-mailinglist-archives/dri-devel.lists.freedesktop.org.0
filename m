Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AC59500C5
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 11:05:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDDB210E069;
	Tue, 13 Aug 2024 09:05:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="GEAZcncz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from HK3PR03CU002.outbound.protection.outlook.com
 (mail-eastasiaazon11011000.outbound.protection.outlook.com [52.101.129.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2FC910E069
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 09:05:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dj4frDjv0jZ+oun6pWyzSBcr2SKZlLZENPr5rl1ENBqCzb11/ObJ5ZGHFXrzKfe5Pwo7MdTK83e1G15KQZB3C7odcNUbyz/OyD7B9DPc947kTpomjRmtu5iin1XErrT5jz2mwzv8v6S86mNQWTe3ynl+fww0JhpVakLzhR9SPPRfZP/tLxBM8Glqs2mtX3JtTnqpJHDoEuyPLTErT3GBSiMy+mx4x3Rj84b9efXdCtxywWq4PKLmX2oveha2FP3QJe1wwRzZ1MQxqLGH9Ogt4r5Dj1FXRYEMVeLYPf6rWz1gO/O1zN5r+elBJ0EoKaz31Zywz0Cq5hr6qzvp+JWYCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+BAVsbafWS5M8Zwsgb4zx7BrseTuCYrgJ+/U/HeGJY=;
 b=M958T84C0saeXEBOckjE6oO8AdFXq0tHtHMXV7/576U16lfbcvxfTDE66P351c0hRI1Ku/7/NpQMmR+7NQaZ7+8KaY7lR6JwWALGcMG4ZwdKJMPUtzSo+4SZg536fDJLSmCQ1mYCJwXv9zQz/0UHpKm5wfDPOcOqI87+mzrScitqqOjFak7APeOzOuDA9EMLB6Of+R4we2u1E8cs26F6NaWWWAltjkagsdxG47QPHIXRc3SE2HYiAgbrLj3JK2BOcXKC7nqwHEoQxq/ghfIMXH+0mZw7RRi/XcGUpmS44psMSfz1ZSH+2sBADHabm1WUVfQzG2KUhkYDWlK1PduROA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+BAVsbafWS5M8Zwsgb4zx7BrseTuCYrgJ+/U/HeGJY=;
 b=GEAZcncza6DcXI9S3G7Mca06HLzrSydTaszrh+sUOKzOYLrsw5zTHGzdYIU7QnfckdBv51UkdOH0CVVQ0CBfmeYw+DRZZWeOI9VrL6yCJGSWTceVTPmvpEVO7JR8MzZJrZ4Yw5IhaNr2seyiFuPU/nS7ThtmQYOYnWRWWJWg7pDbdbpvGF6fue7gk4XkrIreqlBWECAS1vEzBdrUnXdzq4R6avvEIFGlvps2NM7h/QKxon0ACNqHXUrFILxYdOXFPKQecekKRFGT3//9TfV8lWzSgqTYaFGO4z8YiBsw+r9XxntPA5/HfWaK1FeX2zF6PrY4dXV8dejaJpxcC9P6Nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SEYPR06MB5400.apcprd06.prod.outlook.com (2603:1096:101:8d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Tue, 13 Aug
 2024 09:05:35 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%4]) with mapi id 15.20.7849.019; Tue, 13 Aug 2024
 09:05:34 +0000
From: Huan Yang <link@vivo.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH v3 0/5] udmbuf bug fix and some improvements
Date: Tue, 13 Aug 2024 17:05:06 +0800
Message-ID: <20240813090518.3252469-1-link@vivo.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0041.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::15) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SEYPR06MB5400:EE_
X-MS-Office365-Filtering-Correlation-Id: b87c1c79-bbc1-417a-bee3-08dcbb771743
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MDlKMFprdnB3Z05oS3hwRFVXMnpkaXZ2Ulo5N1l0ZHhYWk02VkpYajJQeHgr?=
 =?utf-8?B?bjFlaUNBTlZKV3VLdTFpVmlDQ1B2d0ovNkx1Ull3QmtSdjdPSUxEMWpVVUl1?=
 =?utf-8?B?OG41QzBoY0NuQjJVbG1FUk52VlkxSS9jZVQ5ZmFqN2RUaTRVM1NyT3l6UjBl?=
 =?utf-8?B?TXVGMWdHVGo5bzUrSlFRaFRvK2ZrY2svL3V2VnR1azMyVCtybHJEc0gxRVkv?=
 =?utf-8?B?aUVoOEhZYTNSanVnTkhGODRYS3JTQnM5c0I5ZXhEbnkzVjh1RHdsMytzaWtK?=
 =?utf-8?B?SFk1L3NDZmZocGkxUmFOcnFtaUpNS2ZZZ3dmTy83UFArQ3VWd1hDNUdJL2JU?=
 =?utf-8?B?bXpMWlp0c2ZqSHBYbkU5R2R6dXlpbVRhSGdRM2l5S2F1b1Yydnd5blZPVGJX?=
 =?utf-8?B?eVlwSEw5LzBwOWN5TENIR2JHU09UV0lNUFg3ZFVLdTBsd3B2aW44TkdCVXpz?=
 =?utf-8?B?c2FJcHdqVUlISHY1VWlrYUM0R2hsTWlNN1FadGZFak01TXlFTzduYzNxZlBa?=
 =?utf-8?B?a0gzaDhzS1gzeFprOHVYbDlBZ09UdmNPRlYzT2JLUWFoWnczZjYwbWFmbkFp?=
 =?utf-8?B?b3doQ2tjTnJRVTE3UVZxV0g1ZXRGZkg4dkdBU1pxVzY5clNNWEVJeUx5YzRF?=
 =?utf-8?B?WFJrbGZBNmZwZWRFRnFOeFh4WXI2dW1ud0JYNXFmV2Y5d0I1ejU1blFocnRl?=
 =?utf-8?B?dk9LK3NlYlJpU1QxaG13cnQybW53cktlajBsWWhHd0FsbFhUN2xoczBVWkJ1?=
 =?utf-8?B?NTNDMzgrekNjMkw2YjFPdER5USsvUDkzVEgrUE1Hb0N3MG1KMXlSalcrK0Rk?=
 =?utf-8?B?WnVQMDk4VnVGNDErUTFWbFp6SzE2WTk0N2NROXdqTCtaeHMwTUYwbW1ES3Zt?=
 =?utf-8?B?WDM5M3lPOTMydUE5WnFFSkNSZUw2S0hTaFpZOFQzb1RKc3pOYy9aYmY4TDVt?=
 =?utf-8?B?TUtiS1RXamZjaVFtUTVvS0hLWXhScVlyUFlLWitVWWNzM1ZCTGVKeCtJOFR6?=
 =?utf-8?B?eFNzWE40NENJL0wybWZJcXZCUThVbUpZRGJ6b05ySEMybGRoWkN0VEk0VTdE?=
 =?utf-8?B?K0VwMm5MZUlIZmQ3clZqTVpybXBuSUhucVUrWkY4UFFXUERsbGlDZVEyUXNB?=
 =?utf-8?B?S0JjbkZpbmdpc0FNOHoxTTYxME9zWjZ1aldtNFRoQVcvQmJyYzM5a3prR3Ro?=
 =?utf-8?B?a1dCYzRrVXBobTZKNTZKempmMWYzUFpPY2JoYVZaSGRuUTZtUkNodSt3OG9F?=
 =?utf-8?B?anprMDJIT2V3bWp3WGlqQzhReVo3QUY0UXYxZlZHSGdlYkt2RXZTUC9LdDNa?=
 =?utf-8?B?WjB6S2dqSTU1dWhpbDF1Y2Z0aklrbUl1WFZZU2JGWUx4V0ZlRmwyMWplZ3Vr?=
 =?utf-8?B?ZGt5NEgxNFBVd3k1cWx4QndQUFZXOWZXcHpqejd4dGpLN2owVk0wbm81bmwv?=
 =?utf-8?B?SHY3TzhBbnY5K0JSNFVmcUlheHZOcSt6ZzZMUHBtcmhJT3cyK3hxQ2xVSGov?=
 =?utf-8?B?YTJ5cWxybHV6WUZNTzZXZ1VERjk2M24xY0NmZXpSR0NpQWJIZUxwUnR5VWw4?=
 =?utf-8?B?RnFpUnBsOTlKcVhDMzFPWGkvdEdJK0MvSFZTbEJ5dE5od3gra2JqdzlxRTRI?=
 =?utf-8?B?NmtzUzNCZi9Vamc1c0k0dER4cEJvait2NjFsZ1ZQdG5MckViSG83VlRWRWMr?=
 =?utf-8?B?bE8zbjI5YnFIYU9WcFRrRWU0YWtLN25tSSs4Ym9pWlZtYkFFdE9vcVpBZFly?=
 =?utf-8?B?UEhnWWxIRnZtVDJTWGIvUGF4a25GYXNIYTZkb2puMzRHWmU1R2F2S3IvK2pM?=
 =?utf-8?Q?3e1N52AQnysEQvVGpswd0nenejSs5/JP7AHHY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djhKQXZWWFVyd0ZGRmkyTlVCbGM5aHJBcVB3anZLUTlzakFUcjBWNitwUTVM?=
 =?utf-8?B?Uy93ZEhTUlI3cTVLcTlGeGk3b3h4Nk82dVlndjIwVG05SVd4TWJ0U2NyUVJF?=
 =?utf-8?B?L0dsQWgveW81dFBreFpwVTJiNTJZR05tMXdHbjBicXFweVk4QXJHbi9Namoy?=
 =?utf-8?B?bWJKU053ZTR6Y3Q1bUJzM2hrL2VPNTY5RUs2K1VKTE1sVm9pNE9rNmVMWEwy?=
 =?utf-8?B?M1lOOFBGYVNiMmdFS2pmMlc0NVpxVHVLZ3BETGRDdnk0Y2hGT2hyQ0dGMTc3?=
 =?utf-8?B?UTZpdEp4VmZObGxURUpRQ1NNZ0tBaEVvQnhwbTdkM25aQXJ3ZVphNk11dkkw?=
 =?utf-8?B?WDBHZjhNN3Y4RWliU1hoS29DaUs4RGFtSTBOaG1BQkw2UjlEenJ0S3hvZnFu?=
 =?utf-8?B?RUJSMjZjeXBGK3dFaWF5WUg4QnB4RzYzdHdvTkFtaERSeHRaUEE3T1FHOVhC?=
 =?utf-8?B?Q0VrTTA2U3ZFOWV6T1N1VzJRT3MwZC9pSCt3V1dTWFBVQVhzWXhaNUs2eGtr?=
 =?utf-8?B?eFJYRVRVTy81R2dDeTZPZkZjYklkUzV4MzYrdC9kUkE5TkZXaWUvZ2JUODNq?=
 =?utf-8?B?SGg1UGw5VytJR0ZMSGM3ZVlYa2crdUgvWjU1dmhrRjNNZnlRUGM3NW1BYmFt?=
 =?utf-8?B?ZmJnazZ1djJJYjVHMGY0OWl1NDcvRmpodU5QZFlFUUFlNy9DbmhsNDNsTUlU?=
 =?utf-8?B?Tmh1MXNBc01zMC9DMWZqbEd6aUpTRzZjY0lNQU5FaEJ1YU8zZ3NSZWRiZnlF?=
 =?utf-8?B?YjY2Uk1CVDBHZDBuNllzK0FxUlc3cVJ1dkdteVh1c1FzR3pwTks1OFVzdytU?=
 =?utf-8?B?S2hGcVlFRXNpR3JpbGR6NkFIYmkrSjNtY1NkN2dxVjBSVFFMWUFiSytpODBa?=
 =?utf-8?B?enMraVVjRnJyZjZJcWhYYnIrdkhUM3FpQmZza3ZPYjBtMndmYVFYNWFjODRt?=
 =?utf-8?B?Mjdac2gzWkxmWUJ2ZFZLUkhaanlBQVhhbVhNYTVPZWdxaGtqMEs3UHBYYXY3?=
 =?utf-8?B?empZNmgyUEo5d3g2Y0c4VlFtT3NRNE5KbWUrd09BM0s1MDM2V3lSS3NvWXQ3?=
 =?utf-8?B?QmFHYUZSMGpDbmVDSmJraTF5U2l4dHE0TDh2UDVnOHJQL0l4NTk2bklYdDRO?=
 =?utf-8?B?Z3ZKdG1XT2UrR3JMZU91dHBnRExGODVoUm5VQmg0NFFwMVh6eXE5N2NDV0cz?=
 =?utf-8?B?Z0FwR1hrdklCS3FYS3BlUmQ5Yy9ZeUdzVGlIU3pibmxuUU93ODUxNThUNnVV?=
 =?utf-8?B?WDBpZlNWT3VDSjFzZStyS0J4eXlNUVM3cU5FOTE0ZUpxUDRCU2VTcCtwY3c2?=
 =?utf-8?B?d0pGSWwzRDh2bVFqSVVDOUpleGhESHlHUU5CVFloeERtcHFYLzg0bXhnMmps?=
 =?utf-8?B?V3U5b0I3TTdLRElIOTJWdFovV3dTendzQlBTWkJpMkdOZ0FHNHNvVVE0SHJ0?=
 =?utf-8?B?ajVmOG8xWDJBWGg5b09CTk13M2ROUXd5YTdOQkc3SUhITUxBaHRHNXJHeU1I?=
 =?utf-8?B?Zm9JU01mcmp1WHd0amhINkdOL3NkTDBsenBUT2N4dldkNU5lWWZpeklLY3Jj?=
 =?utf-8?B?WElGTHhGNGRRRkN0ckRqKzZEeEtqczBXYUMvclJKUXpxR2pjWE5mUGVCODI3?=
 =?utf-8?B?YUwxZklyN3NjMitJaGZnSzdqM09aS2RiT1VmYS9pMk9oTDJ4YUdKcWsrVEd6?=
 =?utf-8?B?VldSbWU3M0FiU3piWGJVcHE4ejhvYmJZTUx3Z001WVhYRi9LaHcxUENnN2hT?=
 =?utf-8?B?OWNpZmtLODUrMFVPaUxiM21YRXRhTXU2eWFLRHdhdy9QMHlKOHVTNGduSmVG?=
 =?utf-8?B?NVMxTjlqKzFzZ1FmK1lEa0RxT09KVHhPTjRXUXNTeHQwbGJBTW1EM0Q1R1Jo?=
 =?utf-8?B?M3VDNXNxS3lWSjdSKzNRdlhMVGlydHVQdkFjcHRiZ0lEaXN5eUhXTmxNbGlQ?=
 =?utf-8?B?aFFKaXpFSW1RUHA1V00xNVFib1ZZN094SkdoMk03L0lVL0QyUnA5YVJjdmFN?=
 =?utf-8?B?aXNpc25pYUtGUmRjQVFaV1NnVHd3SWxQT1Z0Qm1jYVJkMmxVVk1yWndqVlNQ?=
 =?utf-8?B?TU1GZFI5a3hMNkQwMTEwVnhEMTllR3Z3NVhueUQrNnpHRXNNMWI4TElKZFN3?=
 =?utf-8?Q?rHC5m5WwsyVthjY33ExIequ4D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b87c1c79-bbc1-417a-bee3-08dcbb771743
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 09:05:34.8014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zeuEYigkIYyfLN3jjNZR3NRrrcIjR8YQl4AilHjWnb3w4Qs1r8qHvMPTMwUtqdYHees8LVQBqNJoTFLRV9ZDyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5400
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

This patchset attempts to fix some errors in udmabuf and remove the
upin_list structure.

Some of this fix just gather the patches which I upload before.

Patch 1,2,4,5 has passed the udmabuf self-test suite's tests.
Suggested by Kasireddy, Vivek <vivek.kasireddy@intel.com>
Patch5 modified the unpin function, therefore running the udmabuf
self-test program in a loop did not reveal any memory leaks.

Notice: Test item 6 maybe requires running the command:
  echo 1024 > /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages

Patch1
===
Try to remove page fault mmap and direct map it.
Due to current udmabuf has already obtained and pinned the folio
upon completion of the creation.This means that the physical memory has
already been acquired, rather than being accessed dynamically. The
current page fault method only saves some page table memory.

As a result, the page fault mechanism has lost its purpose as a demanding
page. Due to the fact that page fault requires trapping into kernel mode
and filling in when accessing the corresponding virtual address in mmap,
this means that user mode access to virtual addresses needs to trap into
kernel mode.

Therefore, when creating a large size udmabuf, this represents a
considerable overhead.

Patch2
===
This is the same to patch:
https://lore.kernel.org/all/20240725021349.580574-1-link@vivo.com/

Patch3
===
The current implementation of udmabuf's vmap has issues.

It does not correctly set each page of the folio to the page structure,
so that when vmap is called, all pages are the head page of the folio.

Due to udmabuf can use hugetlb, if HVO enabled, tail page may not exist,
so, we can't use page array to map, instead, use pfn array.

Patch4
===
Change codestyle and fix a potential bug.

There are some variables in udmabuf_create that are only used inside the
loop. Therefore, there is no need to declare them outside the scope.
This patch moved it into loop.

It is difficult to understand the loop condition of the code that adds
folio to the unpin_list.

The outer loop of this patch iterates through folios, while the inner
loop correctly sets the folio and corresponding offset into the udmabuf
starting from the offset. if reach to pgcnt or nr_folios, end of loop.

By this, more readable.

ubuf->pagecount already set before true set in loop, if get some error
when create, This means that pagecount and folios are not equivalent,
which could lead to potential issues when release.

This patch dynamic update ubuf->pagecount only when folios update end.

Patch5
===
Attempt to remove unpin_list and other related data structures.

In order to adapt to Folio, we established the unpin_list data structure
to unpin all folios and maintain the page mapping relationship.

However, this data structure requires 24 bytes for each page and has low
traversal performance for the list. And maintaining the offset structure
also consumes a portion of memory.

This patch attempts to remove these data structures.

Considering that during creation, we arranged the folio array in the
order of pin and set the offset according to pgcnt.

We actually don't need to use unpin_list to unpin during release.
Instead, we can iterate through the folios array during release and
unpin any folio that is different from the ones previously accessed.

By this, not only saves the overhead of the udmabuf_folio data structure
but also makes array access more cache-friendly.


Changelog
===
  v3 -> v2:
    Patch1, avoid use page, instead, use pfn, and use vmf_insert_pfn map
    suggested-by Kasireddy, Vivek <vivek.kasireddy@intel.com>

    Patch2, update acked-by Kasireddy, Vivek <vivek.kasireddy@intel.com>
    And keep the kvcalloc on the same line.

    Patch3, avoid use page, instead, use pfn, then use vmap_pfn map

    Patch4, split v2 patch4, single update codestyle to keep review
    easy.

    Patch5, another way to remove udmabuf_folio
    
---
  v2 -> v1:
    Patch1, 3 Rectify the improper use of the sg table.
    suggested-by Christian König <christian.koenig@amd.com>
    
    Patch2 add acked-by Christian K�nig <christian.koenig@amd.com> which
    marked in v1

    Patch4
    Modify the data structure to restore the use of pages and
    correct the misunderstanding of loop conditions such as "pgcnt".
    make sure pass self test.

    remove v1's patch4

v2
  https://lore.kernel.org/all/20240805032550.3912454-1-link@vivo.com/
v1
  https://lore.kernel.org/all/20240801104512.4056860-1-link@vivo.com/

Huan Yang (5):
  udmabuf: cancel mmap page fault, direct map it
  udmabuf: change folios array from kmalloc to kvmalloc
  fix vmap_udmabuf error page set
  udmabuf: codestyle cleanup
  udmabuf: remove udmabuf_folio

 drivers/dma-buf/udmabuf.c | 198 ++++++++++++++++++--------------------
 1 file changed, 96 insertions(+), 102 deletions(-)


base-commit: 033a4691702cdca3a613256b0623b8eeacb4985e
-- 
2.45.2

