Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3AB9473D0
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 05:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A1D10E10D;
	Mon,  5 Aug 2024 03:26:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="ASq+hjIp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2040.outbound.protection.outlook.com [40.107.215.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 247C610E10D
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 03:26:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qYmtZzd0X3XzutAnE4/PsHOwLpZEvW+VH2Wj+xanttWGISA51vclZP2w5b7nKz24qxOSFUn55wlhuHHw1YspiudxbZLvgQQDDihB1XLwWFS1u3UYckGfGKVCqmTK37CE8oT72bVvsEAxCOuAllvAWq0x9dukvSQPuR/OKSr9m3QoJ9xsXRbtnCecNQw70UFZt7ESa0e6ry/go9YSZnfYKFg9IQKZs+hU3LQJ14SQz/QDHROdxhKkJGGT6FIxG4cBFuTYEuV6Q/PX6/3vGSxfjplr3emqlEae08YuwA53cdD7ZvTbFrpJhHv1LWIni/tLpQRZpkOr/Nypqak68GgUJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bMMgKldtfDr3QFcMmOCqX4/gPmI6D2ZORAU1RuBPZM4=;
 b=dt8NUC5h+qxgMOByZ2SPl94eUogQv3+z5v1mZjsScxodygC0H20NE3JGnQkUjmzFpnxKjSWehyZogwC01YS1685f7Nfx878IYIjB/BXuZ8NA2vO8rJdNKBx0LIk+F/2nqNcDeYXc0gn1DY17aqYqnAyUQeky75Qj0Dd3j3JxuYsgTAxrrrThSeLpG77P0L+WISaYUgPQRG6BR/hl7NBHQZq7awnx5DFjHyzk7yTPbV1wepHw99Wv0lZ0mW/Al//7iPKNXnqd9Bei0AesDPFhnoXGt/fNNspy37x74bh5m1vvYH/9Abgm/A0r8AboHwE+lmdrAGDp23WaIBEBwYRliQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMMgKldtfDr3QFcMmOCqX4/gPmI6D2ZORAU1RuBPZM4=;
 b=ASq+hjIpweQ6E69ZcnFI5iqbaAL4e87nVDstv0dxJ2qG1DVAo1v3BtKG/ZA0kt5dMpgHSNgzB6Ivaq3tetDt8NutS3Xwy0eNqyyHeOmHCx5F/O7iC/m3VOXvEm3+ACil3+ATOcjcIZBIlLHnD5ZqyMiA/LT+1p69KDmCpJoOolL2uekTc1S+mYWgPsF28FjYwkqyq3yYfC72sE5lWOduhPlTO/bxfa5spP8cJSWuIJxLSqIjBVbVu6/uvn963pDtdsmM+DlAbJSwoHL9OV103+Z3z24nu0ZNrpS3M1gBlKQZ5bvd0aTEzj6u0GHp4JV1cQAFxFbsMVUH48QN6whraQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by JH0PR06MB7349.apcprd06.prod.outlook.com (2603:1096:990:a5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 03:26:06 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%4]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 03:26:06 +0000
From: Huan Yang <link@vivo.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH v2 0/4] udmbuf bug fix and some improvements
Date: Mon,  5 Aug 2024 11:25:42 +0800
Message-ID: <20240805032550.3912454-1-link@vivo.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0025.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::12) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|JH0PR06MB7349:EE_
X-MS-Office365-Filtering-Correlation-Id: 3db27d5e-de4e-4177-59ec-08dcb4fe5772
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFM4ZktRRkVORUtYdEpjLzZFK2dIMjR3NmNwYWVaUWdCWXVlOEE0ckVsNDV5?=
 =?utf-8?B?VTAzcWFQYXFqSUlSR3RmSlAvTzl2SysvWjdpbUlnTEkwd0JGcjVYdjA3a2hD?=
 =?utf-8?B?YUY2TzFnZ0lpbmd0T2FlRXd5WkNscGJtZUZaTU0zOWVGMWJ3VHZoNjhxR09j?=
 =?utf-8?B?RUhZOUZVZGJRQjMrM0pjL3Y0VDhJY2ViZ0k2V0Z3TTdyelR3ZEJabWNFaEph?=
 =?utf-8?B?TWVSeXNtaUNYTE9Ic2JoZndBZ3NmSkhXemxYRHkwVE1vcS9aNmw2QitRVFA5?=
 =?utf-8?B?eXBFekJ0T0MxcDJWeXRHNGNRZmVjN0xkNDQweWc0emx6VXR5V3ZPOGp0bDhC?=
 =?utf-8?B?ZVhDaEs5bmU4RmVXZjdYYlhUTWJBdWZUeVBQNnYwZWJlRFRQWlNuVG5rZGky?=
 =?utf-8?B?Ujd0cVhYd1VtVzI3amxudk5NYytCMFpuYkhKVDBTRnE3aGF5NXJieG5UdGpv?=
 =?utf-8?B?VW5QMlc0MFJGOUdkNFV3Z1RXVEJvZk56T2g4MGFqbzdKL1pmaTd3bDZhSE5S?=
 =?utf-8?B?RUFPaXg3UzNDRUt3RTluYmpXZFozTWpmcFNJbGJZYVZkRFZ6b3VxbzM5TGp2?=
 =?utf-8?B?aG51andXZjVscUV2RVY4UmFkL21LWVJZbmRtWUlrSk9zNHZ1MlU3MGpydGMr?=
 =?utf-8?B?bTBrSjhObjJlZWNYYW4zazJ1Y3hoeE1yd0liZGdnTkl6YndKOXFPVFgxUEo5?=
 =?utf-8?B?QVlLM0FBKzE3SDlUZUtZNk84NDFXeW5Mc0ZlRW0ySTN3d1c3U1hoQVJDb3pt?=
 =?utf-8?B?bk9NcFBadWc2Mm5TcGhnY05FZjc2N2ZLaERhaFRlRGtOYTk4NS92RVVCOUt0?=
 =?utf-8?B?a3F1eUZRdDFXR0xsaHVaMmhZQ2tzNUNZVWZoZzdUQ1hzN3gvWkRMT2F3aUN5?=
 =?utf-8?B?eElGSmZ0RE1QNEhrMDYxYVB4M21Ka3dra2F4dlpPR01BeXg4QksyR2hHZTNZ?=
 =?utf-8?B?ZUljczc3ckhSTlVNa25YSGRpanFXQlR3RkE4cHFtZUpPZDdyaEVUVXVMRVho?=
 =?utf-8?B?S2ZGSUNDb2VucmQ0T3o5aFJBUTNTZmxBSmU0eExVYnp5S09HTTFwYmdEMjJ0?=
 =?utf-8?B?RHh6T29xNUFrVTd0MElLQlBiOW1iRXdXL2hTNE9peG5XaGF1emVWWFdtb2Fo?=
 =?utf-8?B?eVZvVEc0OXZzSDQyNXp3TEM3SldJcXc1djQ0VWQrMXVDUXNvN1dacWp1WEY2?=
 =?utf-8?B?VlRLVk9QRSthVmhUN3pVcmxTMXJBc0taT0dvRW5UZXBtTkhHMk1QRzFWRlUy?=
 =?utf-8?B?ZDJHQzF0bk9MYXFzRXR2RVd0Q3lPZkJWTFpHazRDcTJHU3VqN1NmSUlaQlhL?=
 =?utf-8?B?QzZXUEgxelR6UEhsMlhzdmpMT1JkY1lPTFlaZUlERnUzQWRwb0hPTGpRSFht?=
 =?utf-8?B?MGZvcG5wdjNabU45NmE0alFURlRxb3pPOFRnNXR4dWgxRURJWFI5bmJCMnkv?=
 =?utf-8?B?dndybDRzeHdTZWhWUVRGVjhOVFFNaGRLNW9tR2xVZ01KYkNUUzZPdDZDNWNm?=
 =?utf-8?B?WnhzQ0crbVdOMUdPWm9kMUlicEx3elJmeDB1Vmlja3phdWRqTmwzeFBacmVu?=
 =?utf-8?B?aXFsc1FvV1BMSW1ka0pOYks5VTNQZjV4cDN6NENlbW9jbElURWkxeU9XSXl1?=
 =?utf-8?B?M2pZM0VxQjREQ2VCdkpyRnVKSXFBSlBUbXd3YkhwMjJQNDAyWTQzT3ErSlgz?=
 =?utf-8?B?V0dOWEJMbm1PdlNqRFFBcWNtUW1DenM0T3JCUjQvMTJaL21hT3duWTMzellL?=
 =?utf-8?B?TXZEWTZ5c21GdWJGNGhvcW5JRG52VlM0RVlrNHJOeWlGenVaNDY3SWJTQzBL?=
 =?utf-8?Q?kKb1EtlQIvWfYbSbHzQConBd4tBrry+wtLPUI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXkxREhQdklBZ1pBRTR1WHlINGlGb3pHM3U0Vk1kTi9Ma1ZQUVJveDJDMDQ5?=
 =?utf-8?B?b29tcTJWWHlMZGNqc1BrOTRiYVkzR2x6SlhwdDIvQ01Jd09XZU5HUjE3TkV1?=
 =?utf-8?B?dmhTSWVOQXdqeWVEb2VKWWJkWFVjUGFtWlFUYWJVSG5IbktwU0h4czNwT2F4?=
 =?utf-8?B?cGt6dTlLaHIrbFR1UzlyazNiRkFmMVpmV24yRE5uMjBrTW9WRm5abmlXU3dr?=
 =?utf-8?B?T0xna0g1NlFNaENpMWlpdC9BK0dnVDlhUVZJSytqOGFZNnI1UTV2TS95bmpT?=
 =?utf-8?B?dWJhU0VrMFFraWZVdjdrellxRmRabEN2d09zb2JYUlJoMWJxNW5TMkVUdHc5?=
 =?utf-8?B?RG56YzVTQWg5M0RpV0p1MTAyeTJIWG5FOVNRaTJpem41R25xTGxaSWtmS1Jn?=
 =?utf-8?B?WUlwbnIvcVBDRUtxc3pSMzFUcTRxTkxEcTQ1SjNpSGdwd01uTUZQbEhZNVhF?=
 =?utf-8?B?bVNUaE1FRmIrbGwwMjBYNmRVNW9xYnorZnJLbmg1OXhUa0dSSExXOXRIUVZk?=
 =?utf-8?B?Q0swWkdSTktqdlVwVG05MmkxcEpCOWkwYk9mY1BlSFFwVDA3TWp0RnhrZHRN?=
 =?utf-8?B?eExFYi81SXFzODhjUlNGOVFPbXNNdHVjZmNNTS9NY0d1cnBJeXcvQTM0QW84?=
 =?utf-8?B?Z1B0R2g1a2dDN0FZMnRQVTQ5TFVKSE9tcjR6YW9YTnFTSHkwVTJmTEpJNU5t?=
 =?utf-8?B?YURwOERtZ0lXK0dkd0p4cWhkSzdoanpFaVdHZHA3WmxZNzRYWDN1aDFTZzFF?=
 =?utf-8?B?Z3kxUVM0bWI5cWhIcHRwNVdxMUZ3aG15di9nYTU5cS80Um5xS2puUmw3VXpu?=
 =?utf-8?B?UWZKVkxaRmhPOW1KdEFlTkNxbEpFbDNyb3dYd2NNWUVneFBDWndDejgrQklD?=
 =?utf-8?B?eFpVWFphRXFmdlR2UG1ScXNWUGdIRkRETUtkeW9nWks1MTcwZ2Q0anVRYlV4?=
 =?utf-8?B?MHl3TC9QZTd2Y0hQdWVpWHVnNmpaSHovcXBBM2p5ZjNtQW9hVjczaEhlZzhS?=
 =?utf-8?B?WVd6WEFsTUszVkgxc3hhSEpJdG9ud01tYXVERkMwSVNKNnhremN2Tm9tT0F2?=
 =?utf-8?B?RkM0ZFQ5aWxRcnRIUVE5UEU3ZUQ5T0diVC8xWlhOUzIzUWoySUloUC96T2w2?=
 =?utf-8?B?YlFzVS9OY2d2Qkx4YkN4bVVjNUg0UDUzVzJobk9IYlVMRVcwdlFOT0JHMzVR?=
 =?utf-8?B?YzB4enJPcWFnaE1DbmNDSXpxQU0zaTRwUXB1NlhOSDlhTytiM2hMRC8wZFlk?=
 =?utf-8?B?NnBnNERaTlNyRmhMTDgxR0tiSEhpbTVsRkdPWVlsUzZuZnRRNnNiTVkzejVh?=
 =?utf-8?B?R1M0ZjZvcEd6Vm1uT0M3UTF3ZlZ0bjdiUHB6dlFFclZ2TGJETWJuUTR1REgr?=
 =?utf-8?B?RlNFUzFKSmxkUTlUWFBkSVUzUWdOQmZGQXdFdjhlU2JKNm1NQWxZN0ZMamdz?=
 =?utf-8?B?ejlOZmhrYXZyQzdBU2hkajh3QWtwbUdWdkFzM05GMWdNeEVLOWttV3luaUhl?=
 =?utf-8?B?cU9qUTVpNGxwMlZBblRhK1RLOUd4QTZldG1nelRNak10Z285RlNlc254YUpa?=
 =?utf-8?B?K2dKU3hkbHZKSWpPYTZ5emdVOEJCSGVwamZpb29oL0NVaUFWUDgzSGtkSjg4?=
 =?utf-8?B?RmNoeTl0Tytab0gzVXVxeWtwZ2wwK0NtbFVZZm51dFBic2dnc0NUckcxZmFq?=
 =?utf-8?B?U212RTloK0J2V2hBcGpnUnVXUEgrdWI4WlhHVFc0MjhIbWJFaWFWOFl1ajVo?=
 =?utf-8?B?U0srR0ZCcm5HTVJHcVdJeC9CT1dzUDVwcmJaS3ppTVZjUi9RWVJ1TTdtQlZy?=
 =?utf-8?B?U2F1Y2wzblpnN1U3Ykd1dlg1SlFKOUkwcUp1bTBvcS9BNFBtbzZDK3dtVE45?=
 =?utf-8?B?Qkh3SjBId3g2K2hNQXBzR0lYQ3JyOXZmNkc0YUk1bWxuNEMrazFYM2QvQUlD?=
 =?utf-8?B?QTFENlJvMGNsdkdRck5odU5ObUpGR2l5bHRocHhJNGpwenptOFlscmlRTS9s?=
 =?utf-8?B?dlZLeEpGdFE5MFBVa3hMVG4ydUFWMzlTWEViSGwzc3phRm8xdEpwd2ExR2Zv?=
 =?utf-8?B?RXJ0T09TUlY2Uzd2TVYvakVpOVpHNGlBYWxrM1Q4VXZJdjRYZWJWMVJwOUVF?=
 =?utf-8?Q?+7B7OWY0O/61K+9sCsbqBA3e3?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3db27d5e-de4e-4177-59ec-08dcb4fe5772
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 03:26:06.3227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7+IPE1coSyszF+EWbd1lQ8fv3LT+JrzjwbfMraW/SYo4OGnFdKKHo2JWFDTktCatpymmfRM3vW/gEfNpnJP0WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7349
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

Patch1,2,4 has passed the udmabuf self-test suite's tests.
Suggested by Kasireddy, Vivek <vivek.kasireddy@intel.com>
Test item 6 maybe requires running the command:
  echo 1024 > /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages

Patch3 changed vmap, which can't simple test by testsuit.
But Patch4 restore vmap to the implementation before adding folio.

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

This implementation is same as this patch:
https://lore.kernel.org/all/20240731090233.1343559-1-link@vivo.com/

Patch4
===
Attempt to remove unpin_list and other related data structures.

In order to adapt to Folio, we established the unpin_list data structure
to unpin all folios and maintain the page mapping relationship.

However, this data structure requires 24 bytes for each page and has low
traversal performance for the list. And maintaining the offset structure
also consumes a portion of memory.

This patch attempts to remove these data structures and modify the
semantics of some existing data structures.

udmabuf:
  add folios -> folio array, which only contain's the folio, org contains
duplicate.
  add foliocount -> folios array number
  add pages -> page array, which contains pages which in folios, offset,
               size determined by the offset of the memfd when udmabuf
               created.

This patch also remove single folios' create on each create item, use it
be the ubuf->folios arrays' pointer, slide to fill the corresponding
folio under the item into the array.

Changelog
===
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

v1
  https://lore.kernel.org/all/20240801104512.4056860-1-link@vivo.com/

Huan Yang (4):
  udmabuf: cancel mmap page fault, direct map it
  udmabuf: change folios array from kmalloc to kvmalloc
  fix vmap_udmabuf error page set
  udmabuf: remove folio unpin list

 drivers/dma-buf/udmabuf.c | 207 ++++++++++++++------------------------
 1 file changed, 78 insertions(+), 129 deletions(-)


base-commit: 048d8cb65cde9fe7534eb4440bcfddcf406bb49c
-- 
2.45.2

