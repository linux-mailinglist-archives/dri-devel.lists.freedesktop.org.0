Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02132CACA8D
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 10:27:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4982B10E3AC;
	Mon,  8 Dec 2025 09:27:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jFxdw/Xg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010013.outbound.protection.outlook.com
 [40.93.198.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9264210E3E8;
 Mon,  8 Dec 2025 09:27:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=om75tNFxA5wHZ/ju/Y16sdqk4t4bfT0YOY9plItz4ojDdullDnl5ohHs90+zEMnoqOPZK8cJBuQPsy7NadSqXEtM9G8sYM8jAvHNbuwqZP/lrWQ6rwKbp2333bmlOScmclCIpu0wiL0dEeVRXZ3A+hpRbmbUn+VytZsFYdZmMbwpwKM+l9h8zrk7l6U3XP1BMeoJCI+mZ6ufLm8+EySw0OsfwOQIvRrbeijfwjRcGVkQ4n49gDfv/Cyx7L8fssKQSQug2fvkH4yf2m4xjOhxQ6k6+O6+NuaxReLIAD4hK4K0Yvmmi2jJZTEzWkX4y2loS80aQcJxa1iYVT7CBEghzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ny1a+e9kKYV3Nq4vvWU6eNUEWPTT7sBxMECh4ntvEUw=;
 b=fJ0Ht6mNDFvmq7YK9TRtm46lwit/IsezS7EUBVYIOvwp4B/bsBCKTWaqI5NMWMdudGow1/GT+uEyywbhTuAjOClQlcJoOzNvWXDmFnb+ehLMpQ/C7M29u00k2JlluECeAQfzRsLOe8+iUqJZAXVPnfIOhuWS1nkPAgn4CTgFh2rQ1pM4qG7iDYHiXUayJ/RKK8cMSJ/CqtYyEkR6HeroLrbCR4H245t4pLTWQqD3pyalpSrdBIOaReQS9jvuYNAFncDWORV52az3TIQEBM0ay3oFQICcwWWxgLMDqQFu5XX3LIFeVrS8sSWLp5qpiqxlz86YI3nD4WAl2rHGCnJXog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ny1a+e9kKYV3Nq4vvWU6eNUEWPTT7sBxMECh4ntvEUw=;
 b=jFxdw/XgSRWewolyLJOqW2KCUV2vQWoxSOXWYiOLVObvrSRgBgrWHbgPenWyAiIDRx6in//0gb2tEy0fsxFoeaqKfYN9Cvly97hmvKXzsM2KV9XyszjM5vE3tSOrPBNsZQPM7EFrwvl9F30F1fnRINYlgmUVNoPh0Zq92V/8faJv3/Hpvu02hodVe1w3dgIXQso1c4sI9T1aW+fwg37nJe+A43+BKLfLFDs/ciPMGGccaDs5vU4I7wQMVlyiSpxC/gyIQvitwD8DSG+5Lp7OXOKGzM3duTIIQFQsTK+xp9XhkUG5Qq7zS59BfJhZopB6H67BrTFYNUFxPVPWQspViQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB8108.namprd12.prod.outlook.com (2603:10b6:510:2bc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Mon, 8 Dec
 2025 09:27:22 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9388.011; Mon, 8 Dec 2025
 09:27:22 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 08 Dec 2025 18:26:56 +0900
Subject: [PATCH 4/9] gpu: nova-core: gsp: remove unneeded sequencer trait
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-nova-misc-v1-4-a3ce01376169@nvidia.com>
References: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
In-Reply-To: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P301CA0112.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37b::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB8108:EE_
X-MS-Office365-Filtering-Correlation-Id: 37824426-de96-476f-4c47-08de363bfda7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RzdQL0dnU1I3ZWh6dWk4ZGM4K1VLZEhhZ2RPVjBpQ1lCcDhqWUV3SVkzVXA4?=
 =?utf-8?B?T0Z5Si9CbnpmNndEUWpuVFlFL2JxMEI5dnY5NDJ4RHpNQTdGKzk2Z2lVYzZO?=
 =?utf-8?B?TjlLZjVnK3M4bGtQZGU3WmRRSVMyTWhtZXA1cXFGTjhYRWhGWmVxY2gwcXhR?=
 =?utf-8?B?VEpDRVJ6c1JkUlNaU0syYkg1ajVoeFJsU1g5M0tQRkxXeExOVVJyVkREaDZI?=
 =?utf-8?B?eXU3V0w1dURPQ21vT1lEYXZQZUYyenFnRWt1eEw0V0RZM3NjK1MyUVNNU1hU?=
 =?utf-8?B?NWhscE9RdXFIRWlSSll6QzVyajBYcGd6c1E4RVlxMW5WU3NFenpLME9LcXE5?=
 =?utf-8?B?emtMU2xldXhrZzVrRk15YWNwNTdqck9tRndFbkRtQUYxaHMrNkF2aVNhQ2Rk?=
 =?utf-8?B?YmdFOXJ0TnVHV05BVjFNTEljVGs0ejhWZTQ4QXgydjVrdnlvYlBNWjFGOTIr?=
 =?utf-8?B?V05STUF6K2ZGMUVqM0NjYURSTlRodjlmWkMwcUwybmlwMk15MlRNbHJiNFhM?=
 =?utf-8?B?WWFjRzR1MHJERDFpVlE2QVN6YlM5dHpQb2tVK2pLVXFnOE9GS1J5eDBINVVH?=
 =?utf-8?B?YlphMmxlSzNrelRNYXJlc3prVkc3cnRQYjNSNUNRczN5QmR4K1NnZE1jM2xV?=
 =?utf-8?B?UjJzVEpGR3hvUmdxaTI0T1hWbXhlWnNRV2NOMHpWUFZPTGNvZXpUT3hoV2pr?=
 =?utf-8?B?bktWV3RCOHJxbFVoWlFHd1VxUllINjJLZ0s5R1N0VG92TG5FSmxOMjNST0hR?=
 =?utf-8?B?SHFneUVMelhUYXFoVTFjTnNZbzY0TlZCZVU1QmVQRFFMckZPcEdwSzdOUlBM?=
 =?utf-8?B?NmdWSU1VOWFHbEN6dm9aZ3FZUEg1Y0hrTUhsd05JRCtFZjl5OGdoajV3WXZ0?=
 =?utf-8?B?TE13dTJvbk42VEh4TklaK0g2enRjTmM0RHplTXFXQkI2akhjNEZhZkhod1A3?=
 =?utf-8?B?a2dpc3dVblJZREJ6TjAzRkxGN3VtbVViRXlMVHZQS1VUWmNxU0hQL3lHRnk4?=
 =?utf-8?B?UjQwTWFoVm45RUFJMWtkYXUwRkJHTEdZamp3MkQ1eklEMEkxendFdURaUXhk?=
 =?utf-8?B?NVI4cnovbVhJUjRiY1BsWERpeXRmWlBxbk90KzhmVHBDMFE0VEt4ajd5ajV2?=
 =?utf-8?B?ZXl2cVBYSWFldUZyNVppSkxUNG14VUI2cTdkWWZOS0lId1NLWEVXMlE0VHlP?=
 =?utf-8?B?NkNXRXpDeDVNOVZybjBqWmovUS9BbmV3UmpRU2h1TGtiMENRUkFDU2pOU1U3?=
 =?utf-8?B?Z3Qxc1M4a0M5K25KbWdOaWI2eHNNTGlSMDU3R0sreXpEL0VEd0tJeHRsL3By?=
 =?utf-8?B?QTlVWHZPS0FCTkhTQVIwREkyaDBCd1ZCdEcrS29QUXVrUS9yOUVZOTI5Mms5?=
 =?utf-8?B?dTR0bGZOelhIMkw2WXU0NWF6bnNXMkZtNWZmTW1CMmtyM2hmYzFUbXdUSnBD?=
 =?utf-8?B?SVJwVjQ1UkJsbWRGcktpQXJtMEJYeHltWE92ekZNUjNjbUVmMEdXQU9CR3Fn?=
 =?utf-8?B?aW1NdGJTYjZNeWdUYlhlZGgvSnpFbzV1Z2pUcktqeEZ5MTNUcXl5Wk9rM09a?=
 =?utf-8?B?dkkrNzVpdUdwYTZrQWllTldCbUdQU3pwVmFOU3lDVnlkQ3A1MVRxR0dpVlpS?=
 =?utf-8?B?byt2TDFXUmtoMFZMWUFmdmhWMzVMdVRmUDJSaC9CcWkrbW9XRlRCdzFkTW45?=
 =?utf-8?B?aERMcmR4OE5vRGFUQ2dCVitNaEY3UW5UdHl5OTVYR3pvTUYzbnplc1ZFN3Zj?=
 =?utf-8?B?ZG1CS3BiWGJMZkNqeXhQaVBUUlowZVJzaEZmcTJ6MzBLcGlxVmFQVHlRWW1l?=
 =?utf-8?B?dG9aYVJmYm92ZXRHazF4ZEY5M052VzVnK3ZEeGI1S2lyM3Rhak1XaEVhYWhJ?=
 =?utf-8?B?ZjM0WkxwTHIrbzhPRXp6VXpjZFZzS3FaQVlJVmhtbnJYcXlhTjhWc2Jjazgz?=
 =?utf-8?Q?CYPMxOq+JKWRgPKvWi9pBxOLiTAevfxw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlZNRStEUUc1bnhhZlVBTnZBMEVGNkVBalpjRmVOZWJFRURxZXVOcTZzWXk1?=
 =?utf-8?B?bU5zcElGYnV4WHVVSGFZcklmVkxIYnpERHFWN08vMm10VW1GaW9UMy9yNHNI?=
 =?utf-8?B?SDg3Tkt4VjlydXRRMm0zWlZQazBLZ0hzSnJVQ2M0NmpUSmpxSTN5L09OUVBa?=
 =?utf-8?B?a1pydWxJczRYeC9RREMrbDQramhBZnRvL1Zpa2VhVWhGTzAzbHhKR3JIcnRZ?=
 =?utf-8?B?UytRYk1TaVVTR3pUV1gvRGV4bFJ1V3hRSUVLWUJLUkZRYlhYSFY1VzVUNG5n?=
 =?utf-8?B?THpQVkk5Z1JXRWk4YzAybEppd1ppMW1qMjZadkdicmh3ZzRzbGZmM2cwanRM?=
 =?utf-8?B?eUdYQnJ4NFM3b1hwdW5xTHROdjgvZ1NnRnJ1djZuVlNKTFdzU1NpRklwajB5?=
 =?utf-8?B?cXdWMEhyVWJPMXFMelI1aVdidEltcFBqOWthMmJ4MjltTU0vQzk3YlF4L2tM?=
 =?utf-8?B?SU50S0l5WEtyaVpRZExaN1E1dVBnTllqR0RHUWNFNGZNUE96dmZuS3lxd1o2?=
 =?utf-8?B?TjdwMU5HNm5yTUkxWFVFN3FEVFhBZDFjcjBXTm5WWlBHNitUKy8rUE9YdlFB?=
 =?utf-8?B?V2hqL1k0MG52WDFYYTh3YWdFMW9yNy9sT2trNGl3MGg1ZTdld0RIVnBwbzBG?=
 =?utf-8?B?MEdMRkpxWndWaWZ3SWwwWHRCWDNtRHlGNDBuVE1RS1ozdnIwN3VlVm1hMmxa?=
 =?utf-8?B?MTRZYzRMUVRxUUtySi9MM3RGaUI5YWZ6dHE5b1hySjBjSjV5VFdwR0dSTnlw?=
 =?utf-8?B?dVlmSmpFSlY1dG1xK1JSeDdPU3pqeGRIR1A0QnF6N01Qa1pOc1pWTmhpNGRX?=
 =?utf-8?B?S0dTaXBXYjl6VXlOV0c2bVNPVTdhbDJlYi9iM1VKblV6Y0VsQkgyM3B0WTEy?=
 =?utf-8?B?ZWJLc29xMmE3a0ZsYVpXVjZPMzlrYlpLSUp2dzRmS0JIVlhuVWphMTFpNEtE?=
 =?utf-8?B?R2dHdFBIKzZ6ejFRREFjZC83THpObjFMUkhTTXVna3lCZkdrcWJSUjdQMk5C?=
 =?utf-8?B?WmwxKzM4ajBhMzdDL1RWWmlDdS94NllQdWVpS0N3dU11U3RMNlFLNHhpOTha?=
 =?utf-8?B?TTlacDAvZ2RFcFNEUk1xVlExZzdIa3B6blcyM3VqQ3ZXRWs0ZFZPWnI1Sngy?=
 =?utf-8?B?S2dwbjF5WmtENndDclBmMkVURklndTYwN2Z6cExOMDZKUFN4VlB5TWZXUGUx?=
 =?utf-8?B?QWt2REdRamQzbWpFdEN4RXlqc25yRDFYa3JyWE5tMmp3eTg4dDRtVlZGSGFt?=
 =?utf-8?B?UGhCSE9QanJZQzBlck9IczNDcVdEUWZTUy85STNDejY3RmhrV2s4NHhTK21a?=
 =?utf-8?B?WkJoUEd5TWM0WWFRN2xzUFlLcUJBUnQ2T3k3L2lJMDM2TTdUNTFzVFhSVERz?=
 =?utf-8?B?bDZYcXJMT3JjdXI3a0haVXA2eWM1UlVXNEhMQXZ6MGVXbkZoZHcwdE9nUkZh?=
 =?utf-8?B?ajI3K2ZGcTV1WklCdlgxaE1manYrYVRpQ0dCNU0rZGxTTmlxa1d1M2FxdWJm?=
 =?utf-8?B?cU82STFkREU2Vi9aQkYzRE90U0ZMeXVkU3ZySkZnaU5XS3J0eVZENGtlZVFq?=
 =?utf-8?B?YjV3R2VEanJPTko5c0Y5SXM4MlhaMHc3enNvazVkRFpEclYxZ0Y3YXR3VTEy?=
 =?utf-8?B?WkhKK2c1SzcrNDZsUjFjdFU0RXp3Mi9ZVTF4T25wZDExdXU1bW91SGx0MS9N?=
 =?utf-8?B?VzExRjhqUlVUMzZqeWFSN0hYTjNJWDRKYms1NWZ0YW5RQUtYN1VrTWMwaHNr?=
 =?utf-8?B?UlB2MGFOOTMyWkQwbTRkKzRjUjRXL1lyQlpjWDJBdFZRT2dMR2gwc0x0bEl0?=
 =?utf-8?B?YVdUaXF1WVlMa1NRTU9ZU3dma0FOVFJ4c2V1cHN4OHlpMTJKZ2R5T1FNTThl?=
 =?utf-8?B?NEtrdlQ4WEw3Z2pubGRhMHZuTGhCajFrODYrc2dCRS9oWTZTZ3BydnpDbldv?=
 =?utf-8?B?OWorTXZ5RjIvRmlFRHVaeVBINkVOZkpIOG0yajhMSkJ3ajR3U1h5OVg3N05I?=
 =?utf-8?B?NUwxdVpZZW9OOEtlWlQ0TWp6MG5UNTAyZHdTeDlTc2Qrck5EOEpnNkc4ZTN0?=
 =?utf-8?B?Yk9ZbTRpSGVOOHVoeGduK1VESGRUV1c1VGNQN2FycC9LMi9Id3RDR08ralU3?=
 =?utf-8?B?UGptN3FPeDRCRzA3VGJSZ3lFeG8zRzhPbWd2RVNkdng5Nmkxak5mNlVLUHda?=
 =?utf-8?Q?xkGsEznMHgIpMtJj3Hx3YaSV7iQMJhVpauIRLprp1KFG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37824426-de96-476f-4c47-08de363bfda7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 09:27:22.1315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d51GLMaW66LOFnVFSAl/SjQtCWkiVbIaz3U60DK58sJJQSHYmrZSXiJvcJAGgXwyCVsGF2ivt3TCkXfHvrj+xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8108
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

The `GspSeqCmdRunner` trait is never used as we never call the `run`
methods from generic code. Remove it.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/sequencer.rs | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index 2d0369c49092..4efa048b9d93 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -147,12 +147,7 @@ pub(crate) struct GspSequencer<'a> {
     dev: ARef<device::Device>,
 }
 
-/// Trait for running sequencer commands.
-pub(crate) trait GspSeqCmdRunner {
-    fn run(&self, sequencer: &GspSequencer<'_>) -> Result;
-}
-
-impl GspSeqCmdRunner for fw::RegWritePayload {
+impl fw::RegWritePayload {
     fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
         let addr = usize::from_safe_cast(self.addr());
 
@@ -160,7 +155,7 @@ fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
     }
 }
 
-impl GspSeqCmdRunner for fw::RegModifyPayload {
+impl fw::RegModifyPayload {
     fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
         let addr = usize::from_safe_cast(self.addr());
 
@@ -172,7 +167,7 @@ fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
     }
 }
 
-impl GspSeqCmdRunner for fw::RegPollPayload {
+impl fw::RegPollPayload {
     fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
         let addr = usize::from_safe_cast(self.addr());
 
@@ -197,14 +192,14 @@ fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
     }
 }
 
-impl GspSeqCmdRunner for fw::DelayUsPayload {
+impl fw::DelayUsPayload {
     fn run(&self, _sequencer: &GspSequencer<'_>) -> Result {
         fsleep(Delta::from_micros(i64::from(self.val())));
         Ok(())
     }
 }
 
-impl GspSeqCmdRunner for fw::RegStorePayload {
+impl fw::RegStorePayload {
     fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
         let addr = usize::from_safe_cast(self.addr());
 
@@ -212,7 +207,7 @@ fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
     }
 }
 
-impl GspSeqCmdRunner for GspSeqCmd {
+impl GspSeqCmd {
     fn run(&self, seq: &GspSequencer<'_>) -> Result {
         match self {
             GspSeqCmd::RegWrite(cmd) => cmd.run(seq),

-- 
2.52.0

