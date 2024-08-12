Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBC394E534
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 04:50:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEAF010E07C;
	Mon, 12 Aug 2024 02:50:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="p4xHB02K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2055.outbound.protection.outlook.com [40.107.255.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D45010E074
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 02:49:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lQxE9ocSV3nSIqk+tlYYtLZh8cW6QmJDY+FsKFPaJrQIkFZhWtuzkAWXnylrc79VldhmokeB6kefKkR8X/vQux1l1E0OLFUv/dK7LmyBNguwkCcnWo4yrxshUJV09rZsL0qjgF+BXaPKEW6ZivhsdTbJFC5AGyM6k++lPjjad8NFu2xQG0SMY/mBnEPAg6sSAR16dofXZVz+azOyU3uSesned5zxzb5wmOlvfIAXI2FUR7d1IkY0ZKGUidc9h3MqxI5vhkLbfkNlvSoE+An9B5u3/MmD5gy3c7fLVt604R5FkU8CZdtPdnfxV0DaCY8ytXjKhH11qFW7jdZx4RBs+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3HHRxYVdpDhvm918AdUdWiqbp2vwtq5ucJv8SZ6NsM4=;
 b=CalBWmvZfCixhAb2hu+dFwLOuy4RFTzpRCuPfJRBNzZuuWtlO4TTkX4go5J0cj1gh0mlS+zdumLSAKHy/LRfULhqPG3jYOXI3uvbcRjEAFxXsiNJcb0lBmQUZxNBp29+TZcxEE8d2tagbtuD8K3FwMrfcaFyfiRAfsjlS5qtyU9GcUkDW3JLidQ9ffZFoBOOz07G1WH0vnkgj2UhSFVHQTf4hGn7SYz/GwwnXEWPwnhBkhyyN4eFDO6pi//adalxqQ/u2oNUQKo7l8Yc11Bs19sDx/nQjY7iSGL86E3EPob4TGZhh3wJxgjyhMEj9cVZdJ67IkahzQxlhmkAUdKM0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3HHRxYVdpDhvm918AdUdWiqbp2vwtq5ucJv8SZ6NsM4=;
 b=p4xHB02Kn5Y8w6KyYSFRcGPNCSdw3LPjckRs3rCeyWAnROCE72w7apv8e2D8RVb+eZW10i47dK+qk6j1ttxSGZQpcIZb9DKKu6Mo3qZwXT1I3SMHitJnS+4vB3dWBqJW5UYI3IZTviDo0NSJQUPZrmcEcrV4QYljIct85yE+t4Ct5s6ryvZiagNMoeDHnoCdumy15R5Ss1oPSalBbH/dLIJFP9gbuAG+z9w7MRC9Zj3rxyBEDw41ospRyy96vBfDCZzyeAt19rvH9kHm5NdsjqoP3KIWrJ78NPueTATh3tYlkAu/qnBRFkQKX9gMDaFlAlIz+5jSwpDlssTjJEexDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by JH0PR06MB6477.apcprd06.prod.outlook.com (2603:1096:990:33::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Mon, 12 Aug
 2024 02:49:47 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%4]) with mapi id 15.20.7849.019; Mon, 12 Aug 2024
 02:49:45 +0000
Message-ID: <de3f3cc4-5e0a-4524-902f-4913addba227@vivo.com>
Date: Mon, 12 Aug 2024 10:49:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] udmabuf: cancel mmap page fault, direct map it
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
References: <20240805032550.3912454-1-link@vivo.com>
 <20240805032550.3912454-2-link@vivo.com>
 <IA0PR11MB718542BA11A38A5BD40ECB00F8BB2@IA0PR11MB7185.namprd11.prod.outlook.com>
From: Huan Yang <link@vivo.com>
In-Reply-To: <IA0PR11MB718542BA11A38A5BD40ECB00F8BB2@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:195::16) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|JH0PR06MB6477:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f8f8be2-f20d-42e3-bb4f-08dcba796c8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHl0ODFLMHZOTkJPMGZNNUptcWFDYVl0TE5wb0U5VUdwaCt0Z3FzTXJ4V3h1?=
 =?utf-8?B?UW1jNXpuZFhoYkkxcFFjTWJzV0JXZDE3YU1OZkI1WlgvY3l1VGhrWlhnWWlv?=
 =?utf-8?B?Q1QzQUc3OGQyYmZreGlZd0ovTUlyRk5zM0dXaTdSbTNxTjYzMnpTZUoxa1N0?=
 =?utf-8?B?MkR2dWpIUlNzeksvVHVVYlcveUxnYlg2YTk5c2ZTanpLZlpYNWh3Zk9LUUlF?=
 =?utf-8?B?NzFnSFN1bTUvbFh4bjg4dm5HV0RXa2JNdDIvdk5ybVNMTTJzcHdnV29mZzdE?=
 =?utf-8?B?c0JET1BjZE8yOVV4SytEa1Q0aVpuQXBzWWRjOTdJY2RmbWpiRkVpZEliTHNV?=
 =?utf-8?B?eEdKWm1MOVlyb0lrdmlGdTBpU2hoZzFWZkNrZnh6MUtYem5MWFJDS1JOeHU5?=
 =?utf-8?B?d2Myc3I1MmhJT2dTR293NEFLeFgraDhMVTBxSnp1K09Ta1lBOGN3K2VEbnl1?=
 =?utf-8?B?MjJjZGZxMFlkQVRMMmxtRm1lemF0UVIwNXlwVEY0MkI5bmpkRnpsZmdFRGlS?=
 =?utf-8?B?UmhYMlg0ck92T2VnSGdIM3loc2xobjdqUnJ5S0RFdEIxdWtEcytBWE9QZXJw?=
 =?utf-8?B?cU05M0hib3V4bWttT1dCbGZ0QXhZeWl1RXhURUNpLytBRytEYkE2T2RYay9q?=
 =?utf-8?B?Vk84VDNpUDZsYlF6TjM1aXgzbDMwL2Q1N0I2MmlLV2dSck9TRi94b1IrNjgw?=
 =?utf-8?B?Mlg0OGdDNkFodkJrRGRSNVBnQnVwTTZrODBkb3pIYXRGYUd6QVFjVmxPbG9m?=
 =?utf-8?B?VlIxWWRLR21lMHRkcXpuUnpnTnE3N1hia0lNYy9iL2g1WlF3eWJSTW1RNEJk?=
 =?utf-8?B?NnZ3UWd5dzVKYzU2OFhjem4rSWtJQlNPYnFnT2tjZnF2ZEN4ZFBBVkorSlZX?=
 =?utf-8?B?QkhRMFVsZ2x2d1dGa3F1RVJucTI0UFFQMEVpaHJVelFucGRZSEVDZXZvS09u?=
 =?utf-8?B?VDBrSDg0OGpydGNzTENCUzU4RDFZa25oSENubDlVVzZpbmg3UEVxRC9jTFAv?=
 =?utf-8?B?QUUxdVNVcHBXZTFPSUhZdnRXYzRDNXVaRGxKOE5ZUEc3cWxqbTVpc1oyVU1R?=
 =?utf-8?B?bko5TXBXZXBNTklWcDdnaUxHNkhmdDU0RUVnUWl0V1VqL0NoMkh0Vjk0NXE2?=
 =?utf-8?B?NVJWaURPNmE1UFZlOVJIV0pGOWFLcVB0SzI3c3dLdXZpbGRpYzcyY1I3Smwz?=
 =?utf-8?B?cTJBM1UxWkdTcTlENjMwUlZST0xBTURVb1JCeElpSUk2RFM1SkN2elQ0M2FG?=
 =?utf-8?B?U1J5ZmhwWGwzS09OSkk5TjBpRGVReDNoWDdaVlVhcHA5cGNWTTJGTFFOMG9D?=
 =?utf-8?B?VmI3QVZpNmtNWXM3Zm8rSVVLbC9leVQyZnJPTk9WejBxQWMxSmEyb2VTZThL?=
 =?utf-8?B?Vy94ZUhSRU5tVGljek9mMk9iSGR6SXBESnhtWkFEczM0czFqK0JGbEs1eHI5?=
 =?utf-8?B?T2xtM3RDREEwdGpaNEVqcXh2RFJvODVYZ1Z2bmd5YXRTTGRxMHdmS2RPUXIz?=
 =?utf-8?B?ajYxS1ZqYnVNVFhoRTc3elpES3JtYVYwbTdNYnU5OU11UWFvaWVPdmR2RERj?=
 =?utf-8?B?dnAyR1ZTSnI1dTIwVkZCN0hUbXArTUlSODFhYkpBcDVUVHBvTmxaVXM2TThM?=
 =?utf-8?B?WTZ6TVdmSUZPTnYzK3hPcWVPSDBiVWQ2NTI1ai81TXhhVTg3ZkVZdWhLY2JP?=
 =?utf-8?B?Qkp1RTR5V2lhTnFERTJWS3p4eU9yUGZ0OHJPTWVaNVBIM3V6UzZKaHZQWkQ0?=
 =?utf-8?B?QWc1TmFZQ3I4MnFUTjZWUmJMTnZXa2pyd0kxNXFYM2tsNWN0S0M5NXFsZGUw?=
 =?utf-8?B?VCtsOFR3R1ovMVRSTmtOaGkrOHZKNThwNVRlVlg4RjUrMGVva3ZHb0RPTnll?=
 =?utf-8?B?YnFyNXM0c2lEQWZTNEhTSFlPNmxhR0N0aVIxdHU0ajF1Ymc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tmwza0tDRk5pK1NJL0k5Yks0Y2hPU1BUd3VtMUltUXhnNVNFSnNBOTRPY090?=
 =?utf-8?B?RjQyR1o2UTgrMStjMlBQWjd0UFpZbVZhNzNONkxQS2t1YmtYMVhWSk9mcVIw?=
 =?utf-8?B?Y1FYVnBQVW1ZaEUvem5LbmtTM1NJUGR6dGl0Z2xBeWswYzYvY0Mxb08yMVE2?=
 =?utf-8?B?alFFZVpjWE0zOTZwYjBVc0dCakpEdkpPUTNmaDFNTkc3SXhkOFU1dXpkWWli?=
 =?utf-8?B?RGpOYTRYcnRxNWVYa2ZCOCtISk96cEZmS2c3dldzdndaNEpDWFRiQkd1S3pG?=
 =?utf-8?B?b1lQM2VOUGpnTWtuT25IclBlbGVOR0FFREpDZkRBVlpuRzhjdXFRY25ZcmRE?=
 =?utf-8?B?eHN1QUM1bG90WFNYK1ZPTTl3Z0g2ZDZZS3doeU9yVFByYUFQK0wxSjY5NlR4?=
 =?utf-8?B?WjIvdDIyekhieHhYVGY5ZC8wNVV1VUtLbFBmOE5MNWQzYjVuTzB1VTUzU1dU?=
 =?utf-8?B?V2ROMlhiRm1ReUx6WGpUUTNtYStsSEhHRGFhWGRxRnQ3TVRNblZxQWZrWDMy?=
 =?utf-8?B?SWhqMkhBc3VWeGUweGdHbVFYM0ZnT0dlOHdaQ2pCZEY0NWFaZ0I1ZnRTS2ov?=
 =?utf-8?B?Nnh3U085ckhIUzNlY2tzQm1JY05VYnZBcFJENXBPL0JzcVczd1VHVXl1Ukll?=
 =?utf-8?B?Yi9lQ24rcGZWcGUwSklIWFdlSmV2dkxkN3RnYXhSbzArUkNXUWlDYWFSMUVQ?=
 =?utf-8?B?c1d2ZzJZdStJOG9PenFwdVBZMjlVT0NhaEtOMzdpNEFRLzhXNmRMSUZWS2NE?=
 =?utf-8?B?aU9tK0QwYzF0QXBLVnlkNzVyZXZVWUZVTzNaK2NHWC9LbHltUEVMVVBzNG1E?=
 =?utf-8?B?RE9FaWZoc2htU3hjZFNwQ09McHVERVJaL3ZTdEZPdklTV3VPVTBkZU1WRlpE?=
 =?utf-8?B?RmN2a3k0Y1Ixdk1HRGZHVHRnWVR5OGRGeU9CMTMyRGt0NCsyNi9EdGVPSXhH?=
 =?utf-8?B?cXMrWE1BL0FzMm9SZVF6YjRIeU5mUkFORjFqeWg5OElPbGVEQnJvVUlsSUYz?=
 =?utf-8?B?QXJJRXlmR2ZyZ2JZK2FnUXI1Q2ZRNEQ3aEcvNEgvUDBsc2dMVlBWUGpuY1lQ?=
 =?utf-8?B?YkdtQ0hCYk5Fclg2bjV4TlV6U1hiNCtmWlFySEVVNk9Xb1Bqd2Y2aWFwUHhI?=
 =?utf-8?B?dVlSZmFocjV3SFNXQytndjdHMlFIRk5nYVhGdG5jZFhzUU9SN01tblJKTHVO?=
 =?utf-8?B?eFRQcFlkTTBxbkVBUzBIQ3lBNFdoUmFEelNpYWlTTGdvTC9SMSttNlIxMUE4?=
 =?utf-8?B?czdXZXJGRWw4RjE4WnA5Y3FSRUY1OFMyTDRJQnV1SkxCK2FnSVNMUGRVQlJs?=
 =?utf-8?B?RGhQTDdyMG4vTmVGVVFzbmxXNmVBeTl3V2dhK2E0eEhEbFJNdmlIdXZ5NFJp?=
 =?utf-8?B?SzVvcjNvTS9FVGlMVTZjQmxsVkFuTUxTTEsxS25lUGREeDd6eEhRRzA2TWF2?=
 =?utf-8?B?RUxuVHJKM3R4a1Bqc2RPWStJZWx4RFVzWFE3TlVDMVVsbWdQa2RnUGZ3SmlJ?=
 =?utf-8?B?WEZRc1hvZXU2TElXNVJYQlZ6TkZmam14NFVGNDZLd0h1azM3ck42bGxOeE81?=
 =?utf-8?B?SWhYYmMrZFJQWWtBQThJVjh0OHc2U3pCekNXOEZ2aXJURG1BZmdpMlk5bFZQ?=
 =?utf-8?B?Z1ppcHdZNTlObWJYbm05S3FBY2hzRGk1SXBKTjJrM2d3TVlwbTMyKzhidnpP?=
 =?utf-8?B?R2YrcnZMMFBBL2xFR2x4Qzd5c3FKQ0RwcG5uZXc3SVpaem1iTkV3dW4xUG1H?=
 =?utf-8?B?Q3FqWk9DUGJoWkxlUHh2T2hhUmxQWHpWMmZ6YkdyK3F4T3ZSelljaG0yS3Rt?=
 =?utf-8?B?TVdLN3NOTG05M2k5RWdWSU9zdUVpMGl2bmlEdXc5dksremxwNmhWK2tiRXVW?=
 =?utf-8?B?MjBFdUlvbTFSYm45OTcyNVdhNnFXREdIMDVKKzFtenhveE1LeTE4TDlmbE1u?=
 =?utf-8?B?S2NNMnJFRzFSc21PMXc5WDUwUDNxNnZRUFdYWlo5ZUlzTFVJOFlYZWJFUkNL?=
 =?utf-8?B?L24vZUxwQXF6a0ZnbkN2bWhnQWIxK2oyWWFzYnlOL2phNkZzZWsvM1plWnpJ?=
 =?utf-8?B?anJWUC9vTlBJMEFIN2o0QThRS0xmTlJRYVRFNEpZcHJLckJkTUl1RWZGZVN4?=
 =?utf-8?Q?qf9QZ1eSdJPUFdOoravvX7ycj?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f8f8be2-f20d-42e3-bb4f-08dcba796c8a
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 02:49:45.6677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: in/Evp8SsCpuYsV9qDFhNzXfZ1fSKdwPiHujC9kAujs+VmDKSn15Dn8HT7hHxaLBnlgQVdcaCsjykQKr8GoK5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6477
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


在 2024/8/10 9:28, Kasireddy, Vivek 写道:
> [Some people who received this message don't often get email from vivek.kasireddy@intel.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Hi Huan,
>
>> The current udmabuf mmap uses a page fault mechanism to populate the
>> vma.
>>
>> However, the current udmabuf has already obtained and pinned the folio
>> upon completion of the creation.This means that the physical memory has
>> already been acquired, rather than being accessed dynamically. The
>> current page fault method only saves some page table memory.
>>
>> As a result, the page fault mechanism has lost its purpose as a demanding
>> page. Due to the fact that page fault requires trapping into kernel mode
>> and filling in when accessing the corresponding virtual address in mmap,
>> this means that user mode access to virtual addresses needs to trap into
>> kernel mode.
>>
>> Therefore, when creating a large size udmabuf, this represents a
>> considerable overhead.
>>
>> The current patch removes the page fault method of mmap and
>> instead fills it directly when mmap is triggered.
> I think it makes sense to populate the vma when the first fault is triggered
> instead of doing it during mmap. This is because the userspace may call
> mmap but does not actually use the data. Qemu works this way depending on
Yes, the idea of this is also related to the concept of page fault.

However, the folio has already been pinned during creation. I think 
using the page fault

again is theoretically sound, but it may not save memory, only increase 
context switch overhead.


> whether opengl is available in the environment or not.
>
>> Signed-off-by: Huan Yang <link@vivo.com>
>> ---
>>   drivers/dma-buf/udmabuf.c | 39 ++++++++++++++++-----------------------
>>   1 file changed, 16 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
>> index 047c3cd2ceff..475268d4ebb1 100644
>> --- a/drivers/dma-buf/udmabuf.c
>> +++ b/drivers/dma-buf/udmabuf.c
>> @@ -38,36 +38,29 @@ struct udmabuf_folio {
>>        struct list_head list;
>>   };
>>
>> -static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
>> -{
>> -     struct vm_area_struct *vma = vmf->vma;
>> -     struct udmabuf *ubuf = vma->vm_private_data;
>> -     pgoff_t pgoff = vmf->pgoff;
>> -     unsigned long pfn;
>> -
>> -     if (pgoff >= ubuf->pagecount)
>> -             return VM_FAULT_SIGBUS;
>> -
>> -     pfn = folio_pfn(ubuf->folios[pgoff]);
>> -     pfn += ubuf->offsets[pgoff] >> PAGE_SHIFT;
>> -
>> -     return vmf_insert_pfn(vma, vmf->address, pfn);
>> -}
>> -
>> -static const struct vm_operations_struct udmabuf_vm_ops = {
>> -     .fault = udmabuf_vm_fault,
>> -};
>> -
>>   static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct
>> *vma)
>>   {
>>        struct udmabuf *ubuf = buf->priv;
>> +     unsigned long addr;
>> +     unsigned long end;
>> +     unsigned long pgoff;
>> +     int ret;
>>
>>        if ((vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) == 0)
>>                return -EINVAL;
>>
>> -     vma->vm_ops = &udmabuf_vm_ops;
>> -     vma->vm_private_data = ubuf;
>> -     vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND |
>> VM_DONTDUMP);
>> +     for (pgoff = vma->vm_pgoff, end = vma->vm_end, addr = vma-
>>> vm_start;
>> +          addr < end; pgoff++, addr += PAGE_SIZE) {
>> +             struct page *page =
>> +                     folio_page(ubuf->folios[pgoff],
>> +                                ubuf->offsets[pgoff] >> PAGE_SHIFT);
> Please don't use struct page pointers, given the recent conversion to use
> only folios in udmabuf driver. I think what you are trying to do above can
> be done using only folios.
Yes, just use pfn. Consider of HVO, must use this.
>
>> +
>> +             ret = remap_pfn_range(vma, addr, page_to_pfn(page),
>> PAGE_SIZE,
>> +                                   vma->vm_page_prot);
> Could you please retain the use of vmf_insert_pfn() here, given the simplicity,
> among other reasons?
I will make the correction.

Thanks.
>
> Thanks,
> Vivek
>
>> +             if (ret)
>> +                     return ret;
>> +     }
>> +
>>        return 0;
>>   }
>>
>> --
>> 2.45.2
