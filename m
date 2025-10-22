Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3ADBFB768
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 12:51:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E84D010E750;
	Wed, 22 Oct 2025 10:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="q6AboAWv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012039.outbound.protection.outlook.com [40.107.209.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEC8B10E749;
 Wed, 22 Oct 2025 10:51:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nVE4dMEbg6d2OWJCTXxdiN06Xisgqk2Joq7TyztTuErCkb9ZZJPBUZBoyrUW6Lkeli+pZcNOkIDO+dScE5ODiZw4W5WsklajH8qm7EVy4nh6smdP90wtQgf2nbUG2PpuYYWzcWktPXiBpd4fmFjVti0Y11PruRwCInUmPcKlqvxso49sFhKUaWCLXu4PQ28EOxt2XzLQmTgQU60l4cg7lWCZTUKza3MVuOUh/ynwnC+IeaffrvHYyequC9aagT+TrV33NPfOvuNmw3iPRfu93tdaPi2mZFLVSSSH7Pgu9TXN0axD2C9mQuP5XS80tCQPhwKslaStCEPg2aV+hiV5Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NXeBraECBFssxqBfzj/tdk1erl92y9js16VYEsT9wv4=;
 b=t3FJnD/UvV5KQX9m5OIxkDph8wtfdHzXO4gEMlvpIStRu1coJaA4la0UEsXO7GXu2ZNH6M01MKAC2C2mPFd8jmu4jpxI40uqKybFywSp4SQvIA7mdxmgq32f3qWMEiRuSPID/xd/4ELL2t7FcRh2fM2JZVXhfbUaVk2G79iX7VfjnYJHqNcRgTI07N81qcnDRW4ZizCzSWxOLyPwBEag3fYreSWeYOU5dQ2MzY/liuPqTLeTMXMZeZy52VH67tlfwFrOuag126PjR5wRztz0bwWHBn3rBPI4CwGt7aOT09P7crphIvF3g3Y2yI6DaCCDPCMjywZi/d8UQ/DNzX9bsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXeBraECBFssxqBfzj/tdk1erl92y9js16VYEsT9wv4=;
 b=q6AboAWvGlS50C5yVbgN7lyxE23Ia4WBMcrVQkapGrMl1ebQcZWIaDj8cx3JGSOM6TZOlbM9VkD2l0jfxQh9bk1p0E+qAZvvrzfkdUhHyhoTlXaF48LJlX+9uzHvmdEJjqeo/T8HX/SkpJyoGzUpZEwhFTsqpWL0jFf8Cyd1TusGNxwvNosCy9wzGk8YuJ85bYzAUC7IPtUOgdtx0Qi0g3R5ldPGMqXAXMUdZJnlfhsVPbckiCruPFIGHCQaPMDCDH6ypzZn1kMrGTZ8d/nw372uuy+qN6WIcuznJ7QGs3QK9lINdA2vFDX8/OtGHOgILAssSa1GpgTi3LQdrS3u2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB7917.namprd12.prod.outlook.com (2603:10b6:a03:4c7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 10:51:15 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 10:51:15 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 22 Oct 2025 19:50:58 +0900
Subject: [PATCH 3/3] gpu: nova-core: bitfield: remove BitOr implementation
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-nova-bitfield-v1-3-73bc0988667b@nvidia.com>
References: <20251022-nova-bitfield-v1-0-73bc0988667b@nvidia.com>
In-Reply-To: <20251022-nova-bitfield-v1-0-73bc0988667b@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Edwin Peer <epeer@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4PR01CA0023.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB7917:EE_
X-MS-Office365-Filtering-Correlation-Id: f8c70427-e956-4fa9-6573-08de1158ec74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXZVWFRXTndzTUwwbmVBc2ZUTkd2R0hNMXlOWFlSQkE5TWd5REJTVThTcGxh?=
 =?utf-8?B?ZUxMWVVCZkxWMjRFZTRwWmJ2UEFoNWxOZ3M4a2svVHZCNnMxTnY4VHNwUVB0?=
 =?utf-8?B?VzExZHNCdTJ4azBJUU4zR2M0aFY0eUtJMU03MEdLOGRLOWF6MU1hRFBuQTF1?=
 =?utf-8?B?TVJIcTN3SVZYQUQ3MUsrODI2a29zNU1SWTM5WnY1N1k5MlRIYllrajcxYkV3?=
 =?utf-8?B?dXhYNE1tSm1aK2Q0YkFtSlBpK1FIUjFoOHhVOHZZQVJqNFQrNUxKeElyZXhh?=
 =?utf-8?B?Si8zai94dldvM083RkRYN201ZzBDQkFBNVJLcG4rL1V6OElwWTA3UXZnRTZ4?=
 =?utf-8?B?cForRnRrK1FPMEMzMzFuQXc3eWVjcGM4NU5XVHhyKzZvUTAxM1k4U094Mnlj?=
 =?utf-8?B?eHNOUlJlTkUwYzYzQ1c1a2NZU1l0bVczcE9NQU90S0R4YlZ1RTQxR1NHcXJn?=
 =?utf-8?B?MDFPNjdlbHY1dVpXQWtFZEJHUmRicEkyOEtyejQ5N2xEbnVrSVVKK2VpcWIy?=
 =?utf-8?B?NUdEOFlxUlQwY2xJSk1GNnVGU2F5QXhya0xMWGRneDdnczkzVzlKN3A0OFlY?=
 =?utf-8?B?UDdsRkxFemNXMmlhS0xoZHR0M1d2TTYvMDVUMTBjTXZiWFJoek5kc3d5eTRJ?=
 =?utf-8?B?Ymc1UDBWRXlEaExUM3NGVkFXWnFHZnZteFV2YW4yS1pzcFdFTDIrdDM2VThV?=
 =?utf-8?B?dkc3VmhyYXJSRjJZL0xQSElSdGNxSzNQNmxUQWlFOEZjOWM3dnBJNmo0Yko0?=
 =?utf-8?B?T0IySXNsWFMvOTdzUWdBKzRyUUlUclpwem0zR3ZLMjRDZGIvZFNDTUF3NDE4?=
 =?utf-8?B?WVZMdllRWEdqQjhLdzlZbUxqeno4bmpuUUNNeUNvNS83ejVvOFNpRVBVUWNM?=
 =?utf-8?B?Nm9vbm5qc1lSVVIvR0lnV2gxOENvQVZYMU9pcE1nekZGaS9kTUo4MHAwUUhT?=
 =?utf-8?B?cm5PUDgvdHUwc3BOV0d2MDRXTWsxNWMwWnVBNWVVRlRDY0ZDNzJhaE1IRmhS?=
 =?utf-8?B?dmEreU5YekNYOVplTzNSU1N3Uy9jOVZuVTdTSnRGY1lQZHlTVTlTQk5uMkk2?=
 =?utf-8?B?NmVCR1RJRjRvTTBqZmdtYm9kYWl1TGxNNkNGNnZGU1RGNFc4OUN3aWxGQy9X?=
 =?utf-8?B?bzJJZ1hsMzRHYkx0RmpTNnpGRGVIdExueHNNcy9jb2RpWUI2elIxb3pVSkZh?=
 =?utf-8?B?WDBnWkV4UUR4Ky9NUmRBd3RXaGZzeXcvZGs4WHVDNWN2c0RQUDVzeEVqOVI3?=
 =?utf-8?B?NzZyZlBkRHFUUHUySE1uYThsSVNCSzhZeVNickMyLy91bUJMQ2krSWhxVWtI?=
 =?utf-8?B?OXhBcmp3S3UrQXhtSSsrUUdPZHQvWFhTa2Z1TUt2TllGZkpYZlIzWW1CN2RP?=
 =?utf-8?B?a2VGODdNS0gvK1Y3MjgzY2x3TnF6b3owRm4waVBObkVKbFR6UGV3Yy9hTG0r?=
 =?utf-8?B?YjBDbXRqYUNpK1dBbTc2QlQ1M1RleUpnSUZValdkTllBVTcvaEpOcUhSN0ly?=
 =?utf-8?B?N0ltWm5rM1FXOWhUY1RwRFN6VlZnbmNZaUwzUGN3VVczSlJUSy9qK0U3T3BC?=
 =?utf-8?B?WHNCd3VRVlpKQjFlRzRlbzhmU0NHanJRZlgwWitoT20rZVRlV2JXTWxqZ1ZB?=
 =?utf-8?B?QXJaVWF2ME1NZGUvbmFEZzJZM3VNYUErRlpONXphMDRrR0I4cXJpcUgyUnBC?=
 =?utf-8?B?bFJUWWFkZEs1VFhMb0tzenJjaDlrOC9GVGlVbXVCdXV3NjhYYzRzWUhScnZW?=
 =?utf-8?B?ekZQaitLS0hRQVN4SmpqdTJDbWE1Q0ZlTGswTFhDbW1wTGN1Z1hZdzVuWi9T?=
 =?utf-8?B?ZmV1anVvWXlkTW1hZzZOQm9wRmxGVEhjeEFDdHVxZ2FsL2dHMGxwTmsxT0xQ?=
 =?utf-8?B?QUxEZ2IxVU9jT3FPMFBqQXZ2QjZyYnI2Q2IyYmdrVmtEUWU0N3RYbEQ4a0VW?=
 =?utf-8?Q?a0+J7/Qr+n0IxzFr7rhWyiv/OeI7Y/Vw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M21mNDV2ZmlKVHpxK3ZiTUQ5QUxZdWRGNlhQZHU0emZlMXFud1YrQlJVTE1K?=
 =?utf-8?B?TVZTeDV2c1NLYmxjbjdNMTRVZ1Q3Q1A5SldKTDNHTDdVYmg1bWJhWlZTaHRp?=
 =?utf-8?B?aVNjL1ZjdDZMSlozUjh3RXFIZjhYYnBzSjd3ekhlZU9CWnVnaTlqUkhnY1Y0?=
 =?utf-8?B?SE5mZkFwYlBYQnlkQThjZjUwb2dIc2ljUkIrTEVDamVwYXB2Q0pqV1h3YVNu?=
 =?utf-8?B?OENDeE1JK1JXWmlPNXRIN0szVXk2WHNrNTVlQTBSaHJuRGRLcXF1UjBzUUFJ?=
 =?utf-8?B?Myt1dkk5aHkwUmp6aUxVcCttelo1MjhRaXBkU1VCK0pidWlsbWtOT2txY0ZH?=
 =?utf-8?B?d2g4bEw5bi9oOHEwMnRtcklHTWcxcS9kL0RvYzRGYU5RU3IvdjE4LzBhM0c4?=
 =?utf-8?B?OG9mUWs4bWVJbGNPVmtOWXE3blBtemlpZThPcDdLUjAxN0dOdm9UYS92djF1?=
 =?utf-8?B?Rm81ekNJem13bHBEdi9BeU9leWY3cVROdE43cG9VUUtQaExQQ3QwanJGRFdE?=
 =?utf-8?B?NXNuMmVvVDJuMjUxVk11ZGtiN2hrZnVMKzE1eEw1YXZwbk84UkFkYXVzQmMz?=
 =?utf-8?B?SG9LL1hHTDQydGxneDhuRUxGdmc0bXExRitvV3ZNaHNlbzRpNjVuWTAxUTlN?=
 =?utf-8?B?N3VqTHRtNEJJQk9jSVo1RDF1OGVacFNrNlorWWQra1paQStkWHQrWlBPdHYy?=
 =?utf-8?B?NE5ySU5HendLVFJiRC9VVWZ6ZUFBMVI1c0RKeEVxQ3Y5eGNNTUVscHI1RUVa?=
 =?utf-8?B?UTROTUhTcEZCRXlybG9Wa2U4WUdBTFhraWVPT1BjZEg0bGI3b3hlZ2JvbDBE?=
 =?utf-8?B?SXlNUTFMYnY4Q2hsM3JTT2t5elVvZm5RaTNqbkJIa1RMcS9yOWxpWlduTnps?=
 =?utf-8?B?WlYwdnZzaHpFK1UyQ2lObHVmREVMalhqTFo0RUtkRFhobTBlaVQyMmV4bUlx?=
 =?utf-8?B?d1ZQS0sxYzkxd2dOTEx6NmNJeHRUV2R6N1FLMnUrY1lDWHVhNlc1Z2YxUGI2?=
 =?utf-8?B?bUEwV3NNR3E5K1ZEUkZ4RWFSeXhLRzFaQ21LeWt1Z3p2UXNLSllTVm1aNGtF?=
 =?utf-8?B?V2ZoWTFKbFhZRDVrWEhNWGZaREp6SU55cndDK3dKTDRoaGtHbTY3V3hYYUFs?=
 =?utf-8?B?SHZtejZtSHJiaHZib2szVmN5dFBNcytqTk1PNmpMNHVISU1xOWdZUWFvbHF2?=
 =?utf-8?B?Nmhrdkt2NGVIZUtLT0sycWxUR3FaN1FDTHJteG5BVlU5dFdJVEduUHBXSEx0?=
 =?utf-8?B?MWo0dkhtbFpENGsvcGxkNk1hMW9GdWlIbVQ5V0dOd3FyWkx2bk5pQ2VkelY5?=
 =?utf-8?B?bk9wK3pKK0xxSE05ZTNkZ051THozUUhEN0xFcTZrT1V2RWhYLzVaOWJxSmIr?=
 =?utf-8?B?cVBlSkJzcmtrTnF5MWoybzg3cWZpK296b2VRaGpUQjNIczk2ZVJ2TE9JS3Rn?=
 =?utf-8?B?L01UekJFRWQ2ZVlGSjIwZGp5dkhLVStHdkxHSy9ta1F0YVh0L3V5WHlpUTE4?=
 =?utf-8?B?My9WZFlvYzZ4dWxXbCtWUVhEejZrbkFYMi9KdEl5eSt2Y3Z6OUQwQ0dzVW03?=
 =?utf-8?B?SEZ4T255SWVwdHYvd0Y1cWs2Q3JET1pGN0dwbmJnMDJkZTRJVXFYbzRLdHh1?=
 =?utf-8?B?SWlGRlIyU0k2TUtJMUIvV3JmdTBlVjF2dHcvM0krQmtSd1ZFTk0zTng2dGdr?=
 =?utf-8?B?ZnNYMHc4MmsyOUhNMFVMSC9BejAwb3dhczdiYWZsUUNpMFZ1S0x2U0tVRjdJ?=
 =?utf-8?B?VnpORXYxVHNtQk5PakV6NzZyR2c1M3Y4djhOK2JFL05iUjI2ZUM3R3pwYjIw?=
 =?utf-8?B?UWE3eWFMb1lmUSs4MnQyaXlGQlphTHlRdmNtdlg3dTNvbnFncTRCYWo4UHNX?=
 =?utf-8?B?SHFUdko2U082WEFsTGRMMHJPbEhZL01TaWw5cVYwT003TnBaQnRCRXo1SGxV?=
 =?utf-8?B?NEZoV1VEUkxyamZNM1Q1VzYxaHhlZEFpWnU1NlR0Q3V5Smtmck4zbThTdmVH?=
 =?utf-8?B?b0FwRzdVbjVmbTJ1aGh3Vis5L3JlSVRFQXVwd2k4TU0zTzBIRkJqdmFBSGxF?=
 =?utf-8?B?TlIzWCtRWjhVWUE0NXlqdXNNWmx0K3F1elIwU2N1VEgxVVllZUt2MU4vcVkz?=
 =?utf-8?B?SUJnUzd4N2V0QlpxMWxhYkltQmF0SGx4eEpuMmhMdEszeFNoN3J6K0ZQaUwr?=
 =?utf-8?Q?2G+MtyWzCgeWVBjKWZdXCU8falSqrk3mpyx3K1SBnofI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8c70427-e956-4fa9-6573-08de1158ec74
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 10:51:15.6620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mg9nGbEjOzY9hMaix4QKAIJz6b75MPX9PQtC5E0Hxud/eFiktYC+i9Rd5njpb0TWWtcVY3TbRScARVGqJwcpwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7917
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

Using this operand can produce invalid values. It also doesn't bring
any benefit as one can use the builder pattern to assemble a new value.

Reported-by: Edwin Peer <epeer@nvidia.com>
Link: https://lore.kernel.org/rust-for-linux/F3853912-2C1C-4F9B-89B0-3168689F35B3@nvidia.com/
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/bitfield.rs | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/nova-core/bitfield.rs b/drivers/gpu/nova-core/bitfield.rs
index f113439c6501..16e143658c51 100644
--- a/drivers/gpu/nova-core/bitfield.rs
+++ b/drivers/gpu/nova-core/bitfield.rs
@@ -94,7 +94,7 @@ macro_rules! bitfield {
     // All rules below are helpers.
 
     // Defines the wrapper `$name` type, as well as its relevant implementations (`Debug`,
-    // `Default`, `BitOr`, and conversion to the value type) and field accessor methods.
+    // `Default`, and conversion to the value type) and field accessor methods.
     (@core $vis:vis $name:ident $storage:ty $(, $comment:literal)? { $($fields:tt)* }) => {
         $(
         #[doc=$comment]
@@ -103,14 +103,6 @@ macro_rules! bitfield {
         #[derive(Clone, Copy)]
         $vis struct $name($storage);
 
-        impl ::core::ops::BitOr for $name {
-            type Output = Self;
-
-            fn bitor(self, rhs: Self) -> Self::Output {
-                Self(self.0 | rhs.0)
-            }
-        }
-
         impl ::core::convert::From<$name> for $storage {
             fn from(val: $name) -> $storage {
                 val.0

-- 
2.51.0

