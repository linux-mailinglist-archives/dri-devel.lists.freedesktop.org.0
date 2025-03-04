Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D5DA4DFE1
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 14:55:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24FD010E5D0;
	Tue,  4 Mar 2025 13:55:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="d4o0IT06";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B399E10E5D7;
 Tue,  4 Mar 2025 13:55:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DISAcKVtGr/m6HMx00YtVSLik9XLXf61ui/mbrvEG+KfdxxNU/z1XX0eK0ACjkj27rwFfoVywQOmuJZYtKxm298i8d92BjIWzguK/9F/PhYBdQDKjtsJakZc6oH/Bb51+qj/8I26mU+6n1LnDY21SLewlrH+BE724CIekVUivd0c5cT6SmOiBjBeFDd/TalF2QT68urU/cFiBRgg8igsXt4SBGU1q1hz8q5XB0jGcsposkxiage81FW0vI4khOeqnk1N33zbvBOSnqDdgmarpXyu3StQEswIuOodm+H7WchhhvhAQxrIVlCASBtx611Hk47arKysEpY4fVJaesaTbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wrk9cVRDcIB3ketMyLZPufB/GYlGfdXAsIYEsarYDHc=;
 b=JekWVmWIk5cDfhKO/w3hTyEJFkRAlAw0w2wRQejMooS6nMeWB92zS42jk1EbW0HmGoOvDaQljfAhSW/Ck+GUXq57RcG5MF/LVwsO5vvKMlsA6r3aOFNPIlzIQ7ua7gjeyLw/3dvChbwMTN2Ib7JlmtRTgiFuGY3W5Ul1a77ULP5j1APHFU7CwD5a3gEKyUft0xwRHvM3oWGrcUSqfjUpxJzboXfVHhYzPQEQxM7v+Nx4PK+bw6wYJQ2FpjTiqE7Pb3Vo2WrtTHHcrbEo2wnH4UZIgPhjc2hXZsd+d3QdqLk+NccQ3idDrzcAImtqbIVlqZdyOT6EjoPQ0p4+ctRrkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wrk9cVRDcIB3ketMyLZPufB/GYlGfdXAsIYEsarYDHc=;
 b=d4o0IT06ySKWfSWlz0qNkapHIwo21xqNBQ4gBA8zCnzxdcct6vJ9Tq3U2EcLZqIT4WVOyt76qO2g9eqsoInAA566WT02R3cSXkGnbkl8sIDALgth2311Z8PZKRSRoxGshUuVgDJ2IcMaigUB/3hnsEPLtZp8Z99kyvbDP1lSFTDu8NE4/oysjkwez49selSz3mBpHkgRcDzQYfiLDwDSaT7KW5PRu4CH65m+N3azb9TlYnR10MrF2nme3jlEYDBCgUFFn+7yBP3fUdkeltH/JyIA5kR/YX6OfdMfMOVrl8Z2JKGSVZ65V7NyCUaj+SjGisBuOFvPi1NDcYKykNGUTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by DS0PR12MB7874.namprd12.prod.outlook.com (2603:10b6:8:141::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Tue, 4 Mar
 2025 13:55:05 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%6]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 13:55:05 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 04 Mar 2025 22:54:00 +0900
Subject: [PATCH RFC v2 4/5] gpu: nova-core: add basic timer device
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-nova_timer-v2-4-8fb13f3f8cff@nvidia.com>
References: <20250304-nova_timer-v2-0-8fb13f3f8cff@nvidia.com>
In-Reply-To: <20250304-nova_timer-v2-0-8fb13f3f8cff@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYXPR01CA0050.jpnprd01.prod.outlook.com
 (2603:1096:403:a::20) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|DS0PR12MB7874:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a2917b3-ae80-43ca-540e-08dd5b242afe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bzR4Q3ZaYllGM29MVTgxOUxvbmN3TE5QeXl0My95QlUrVzJibnd1TW01NGh5?=
 =?utf-8?B?Zzc1TTIzbmFZMlJCVEFyZG5uRWRiK3dsa0JVNjgwL05Yd1l6Yk9CY1Uwc2dZ?=
 =?utf-8?B?Y3lSOXd0R05SazNneWhYanpoOFN5TDBNeE44RnZhZE0rSUZzL2owZXN4SHgv?=
 =?utf-8?B?QWJ6ckxUOHRMaHdnTHJLaTdpdU1lZ0trZlY1RDd5VkJnWmg4cndITG9kMzZt?=
 =?utf-8?B?bjVXd2ppSkN5TEVNc2Q0WGkvUGZFYk5ySU1KeTB4dG1YZW9vVkZLa211SmFt?=
 =?utf-8?B?MjJFRW5tWkZmRDE5VjN2RW8yQVJQbDlLZm83eE5wU2hYb3RkMW12ZmYrYXNm?=
 =?utf-8?B?RTkrOW56WkdLdVdQT3FTWUpvWTRURHlocS9QUnZ0NVdLSTd0OTRVM2Znbnhx?=
 =?utf-8?B?dnFVVGhsOXZabWRIRkczS2ZWd28wRUUrOWFTRDBhSkZsR0RNQkR1aWpVMFFR?=
 =?utf-8?B?a3Z5UlFKa1JzVzIzNTBwWENjYmFyWXpaN2N4Ukh3Mk1OZlhnMTdiUWdBb1dl?=
 =?utf-8?B?ZVg5V3kwTjAwN0pzaDRoMmlSUnI0REhsZDdxekdleXJ4cE4rT0dXNzZtOE9X?=
 =?utf-8?B?ejd5c0sxOU9mOG56L2ZFUVV6dVJHa1dlSHlKU0VxNWVEZjU0Ump2UUx1WHU4?=
 =?utf-8?B?aGd4QzVxblVHQ3l2MU1CcFlvRmFrTWFCQnVBSkJ1MTI2NFFYWEcxK1lJb0JD?=
 =?utf-8?B?amVYM3IyaXp5Ynp6K1NDUXNDZ0xjWEY4VGFGYnJKOSt5SGFJNWJwT3BvVE5r?=
 =?utf-8?B?K2tQZGxoaFRnSXh1M0Y1bWdJaWdYQUYxL3FlR2EzZUVKSURHbVVRQUc5UDZn?=
 =?utf-8?B?cUdpY2Rzcm90RC9vZ0pJZlVCdDRXT2EyTitrcCt1Z1I2TkNpeVJvdm9FNzNj?=
 =?utf-8?B?a2lDSS9MUTNjRGUySWFHdGRIWWFQaytrR3IwUGluSEpFY055bU8yVUw4UC8z?=
 =?utf-8?B?d1dUbmtKa3IyQ29zVlJaQVlkU3dqVmZ3QzUxNndUSzRWTlQ3RlBodHpVV0Qy?=
 =?utf-8?B?cE10SUFwR2VSMFdhUG5FVG5CdTcxL2Z1UTA3c3I5R3Z4Z3l4S0JqMEtqbElq?=
 =?utf-8?B?MkYrNWVoTXRjRFY0bmxWYjd6ZnNvNjEvb1VadVNUQ0V0YncvRGwvTFkzR3ZD?=
 =?utf-8?B?andIWVNnNS8vdU9SYlkxZUE0cXpsenNaVk1IOGpjYThyREZsNkxFelMyU0pu?=
 =?utf-8?B?Y051UDJqbkhyMkJSRHVwYWRsQmlXNUxzdkZ0WW9mV1RyeEMrRkVDNHVEaFJs?=
 =?utf-8?B?RzZIUEhSek1oNkFVMGRoR1VtcFAwbTJYMVI4YlAzVUVwdHpubnU0T1ZKN0lt?=
 =?utf-8?B?dE14VjRkcitYSzczdEF1a2pCeW9rUEVPM09kMWczeWlLd0xWc0pNOVN3YXUz?=
 =?utf-8?B?SXB1WFphWnJJMzdaSVFac1NOeXdYRmV5N1ozdUN2M2JhUVk1Q2Q2dyt6K3pk?=
 =?utf-8?B?a01iZnlndGFlMGdUMklPY1JWNS8zOHBPaDh1T0RsdzNlSEZPSStTK1Arbnha?=
 =?utf-8?B?TFJZd29aRFhkb0o5dklmWnI3bnVxeHFqMzFmeTkyc3hGY2NMSWl5TGFKNnBh?=
 =?utf-8?B?cU9GSTAxbHFjWmFBWnhBYnVseDFQdm5MRGo2U1hoVXdwSHovVXpFOXcvS0Fw?=
 =?utf-8?B?MUwvWmNsRm1lUlBWcW0xNlJXNUNvQ2V2MWVsUTFFSFE1YVlUWmpBeGxOWi80?=
 =?utf-8?B?bHVqWCtLdHBpRHdKTnpSQ0M0Qi9EaCswem91ZXY2V1pVV0piVjRHa0lRbFls?=
 =?utf-8?B?L0pTZkFrNkU3Q3JJVkRueXgzSHR6WGRlVC9jS2dqUTZBYzFsUGYrakxOVE0z?=
 =?utf-8?B?YlJUTjBSK00rNENjSHVhcGJSQXVPTW1pWWgwVzUzd05ycXlDYTIzUTJPQU92?=
 =?utf-8?B?Z016a0hvR1BydDAreXNjVTRmL3ZQREVSanNOdHFzTEU5a3hUeDFDaldlSWlu?=
 =?utf-8?Q?cwl3nx+1xVw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VThESEhsWGNsaHJGdFVmM00xSjY2bVc5dHVBck45aEljQnRUa3ZkREl4NFNz?=
 =?utf-8?B?WFJudGVvVmFtZ0ZobVd3dGRyT3VsY0gyV2I1bGZoVTNsbDdzSEZCRmZ0L1RB?=
 =?utf-8?B?eTRUU1RxU2h4dVRwVC9OT3VIK1kzTHVLa2NuUHVnYTIzV3lsd1JyMzR2VlBp?=
 =?utf-8?B?VFd0NDFUZVhSWFBwSlN5TlhtWnlqaVluRC85UWNVU2hxSkRaU3pPUmZZWnFy?=
 =?utf-8?B?eVEwYTc5SXIrRXFhd1hKMFdYRUNHaGZ4eWZJNGY1OHlHWVJ0ZTI5b3VOUUI4?=
 =?utf-8?B?Y3c1SnhFQ0psYkZDOWZjUThCemlCS0UvOWxUVFY2QnF1WmN6ajJ0blJIT2xU?=
 =?utf-8?B?eHhvdjRwenRvU1ZwZjhaSzBCeGI0d2lKUStwTWNvOG90a1VqWVZhOUF6ZWVv?=
 =?utf-8?B?a1E5WlhaWW9oYTdpNzNKNjMwYUdzK3lsRmp6eE4xSkJmeUhMbFZmNzFrSzJs?=
 =?utf-8?B?c0swY0NlOWFhWDFMbGpjWnRaTzgvV3FIc2lCbkJwaGpMcVpLS3hhSFZMaDcz?=
 =?utf-8?B?ekdybUtjZ09XeWhqdm1zODBWb3JadmlzM1BSSnpUeWo5SVpxTkZ5bTF4TlMx?=
 =?utf-8?B?NDI4WTcweGhKdGozci9nRUM1R1lOVm1KbDh6SjgwcFJZRnZ5bENJYUx0S1Zv?=
 =?utf-8?B?bmJtcmVoNndtNXJhMW1aSTRyVkgzcnlMQ2l1cm1ZZEl4RjlVMkdrb0xkWlo3?=
 =?utf-8?B?dzBOQ2lURm5wT0o3djI3Vm9qcjJLWnFlb2c4ZWVPVXduT3U4NlFvZVU3MU5U?=
 =?utf-8?B?OFZMV1IrNTVvZytoclp4bVpPeElwS3BKWFNGTVFiSUF5RjB5QzErLzcvUms2?=
 =?utf-8?B?UlBsKzI4NWlyS2piM3pQUU5URHlGUUhqdi9OSUNEOXU2aEwvTHBIdXkxOXhs?=
 =?utf-8?B?bjlVTlFDcHorRlB1aHoxM0hlTnFrcFpMUDduTk5vOGF4UnFvRDhzSXNKQ3RS?=
 =?utf-8?B?Qk1UbGZuT1JDSm9uNG1mTE5MT1VRS0FhK1lwRWRXcTZWRmhuSjJJbHQ2VEE5?=
 =?utf-8?B?UVNwUi9YaHY1RkFYU3NPRjBlbGx0YndMOFBMeWl6QzJUaU1yejlERVNjeDk2?=
 =?utf-8?B?ckVVeU1ydWttS3hzdU1wcnUyY1BEdEI3cHBZYjk5Yis3bTExYmVqbDA5ay8x?=
 =?utf-8?B?V0UvSmdsakszZlJueFQ5ODk0R3BWZkM5OU5OZVBTTmt2WDVoRzFTZm1lWGR5?=
 =?utf-8?B?U3pXd0ppK0VmQ1JYY0Z5ZG5NUjExekYzZWNPa3Zkc3IydHRvbXcvVzRKK1Fo?=
 =?utf-8?B?ZWdMSHQreUhJQU1TSDlmTldDSzdQRGtZNko3bHRHZEtvV0l6R3JuZE56b3NO?=
 =?utf-8?B?ek8xUW5HN253LzBrR3dsRW0zOUh4SlVKYWZpc0hVZTlEUFlVaFhLR2dwWXFZ?=
 =?utf-8?B?c3c5ZjBNcE5PajJqKzZmYUFqaEVjSW0wNkFPV1ZqS0VwVlY4eWxzbXBQY2Zt?=
 =?utf-8?B?WmNsTHBYMW5ram5QTGdyZkZ3SDNrYTMvS1VQL0dnWWNSbmdndTVva0ZSejFH?=
 =?utf-8?B?cC9kMC9LV0VOZjROMEt4Sm5qZkN0RWtvVXp5bkh4cjBHNVA1VWlUcStNenNt?=
 =?utf-8?B?YzQyaERFVzZucXFMQjF3NXJZNmpFYWFhb1ZJTUF0eWhRdDBMa1J1SkVEREl2?=
 =?utf-8?B?WU1vV0xEUjd1cGpjd2c4WE1hMm9KZ0premg3SlVwZGtxU0RYRDJXazd0aVVM?=
 =?utf-8?B?Y3ZpVEM1YkxybXpCTXBYdnEyQ2VPUnErd3ppcE53bDhaaWhWbytaN3VqQUVz?=
 =?utf-8?B?ZE5BcFBTSEk1cXdFdS9aQ2U2b0hqRk5oeCt5c2llK3FJTHJIZGkrSGNKeHRj?=
 =?utf-8?B?dlVmRDhjUFZpdUd6YUJNREd2emFLbWFEdmo5Y3dHVGtjS0tLUk5aYk5NVCsw?=
 =?utf-8?B?VEJzR2E1YXd5ZFhWRXN4aEpiNnFaQ09ldnNtMDRaeUFXSzhPc2J1QkhxMjM0?=
 =?utf-8?B?azZZRUFxYmp0Z3pyNmZqdHVYTCtnNk9Gd2IyMmdsb21iNVhteFZKZ0xxeEFR?=
 =?utf-8?B?TW1RSEZXSjdUaU1RTE9OSFdJUWNCWHQzOTNxL1E2K2RNNDNMVkNZZGFBcTh1?=
 =?utf-8?B?M1lvRnRpNG5FM1c0ay9QYitwMVltV3B2a0daNmdyU2ErbDAvTktkaW1xMzlR?=
 =?utf-8?B?em9wSXNCWU1wQ2FjSXVWNHg3aE9jNXpWak9WdmtGVyt3Y2M1bW1zc3RNYjhQ?=
 =?utf-8?Q?jY11FE/wVU/xPY0Qa5OIgFL3m1soCxEN5xqSYux7XjSc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a2917b3-ae80-43ca-540e-08dd5b242afe
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 13:55:05.7285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6lLeteIk9bhzelM/Q5G+5UrAs4BvLUC7IaNn8SPzOAZtGDhXYSFJhFps9/pCpUr2xhJqZkmgVFOJxSFAb/3wKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7874
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

Add a basic timer device and exercise it during device probing. This
first draft is probably very questionable.

One point in particular which should IMHO receive attention: the generic
wait_on() method aims at providing similar functionality to Nouveau's
nvkm_[num]sec() macros. Since this method will be heavily used with
different conditions to test, I'd like to avoid monomorphizing it
entirely with each instance ; that's something that is achieved in
nvkm_xsec() using functions that the macros invoke.

I have tried achieving the same result in Rust using closures (kept
as-is in the current code), but they seem to be monomorphized as well.
Calling extra functions could work better, but looks also less elegant
to me, so I am really open to suggestions here.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs    |   4 +-
 drivers/gpu/nova-core/gpu.rs       |  58 ++++++++++++++++-
 drivers/gpu/nova-core/nova_core.rs |   1 +
 drivers/gpu/nova-core/regs.rs      |   8 +++
 drivers/gpu/nova-core/timer.rs     | 124 +++++++++++++++++++++++++++++++++++++
 5 files changed, 193 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 63c19f140fbdd65d8fccf81669ac590807cc120f..0cd23aa306e4082405f480afc0530a41131485e7 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -10,7 +10,7 @@ pub(crate) struct NovaCore {
     pub(crate) gpu: Gpu,
 }
 
-const BAR0_SIZE: usize = 8;
+const BAR0_SIZE: usize = 0x9500;
 pub(crate) type Bar0 = pci::Bar<BAR0_SIZE>;
 
 kernel::pci_device_table!(
@@ -42,6 +42,8 @@ fn probe(pdev: &mut pci::Device, _info: &Self::IdInfo) -> Result<Pin<KBox<Self>>
             GFP_KERNEL,
         )?;
 
+        let _ = this.gpu.test_timer();
+
         Ok(this)
     }
 }
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 58b97c7f0b2ab1edacada8346b139f6336b68272..8fa8616c0deccc7297b090fcbe74f3cda5cc9741 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -1,12 +1,16 @@
 // SPDX-License-Identifier: GPL-2.0
 
+use kernel::device::Device;
+use kernel::types::ARef;
 use kernel::{
     device, devres::Devres, error::code::*, firmware, fmt, pci, prelude::*, str::BStr, str::CString,
 };
 
 use crate::driver::Bar0;
 use crate::regs;
+use crate::timer::Timer;
 use core::fmt;
+use core::time::Duration;
 
 const fn to_lowercase_bytes<const N: usize>(s: &str) -> [u8; N] {
     let src = s.as_bytes();
@@ -201,10 +205,12 @@ fn new(dev: &device::Device, spec: &Spec, ver: &str) -> Result<Firmware> {
 /// Structure holding the resources required to operate the GPU.
 #[pin_data]
 pub(crate) struct Gpu {
+    dev: ARef<Device>,
     spec: Spec,
     /// MMIO mapping of PCI BAR 0
     bar: Devres<Bar0>,
     fw: Firmware,
+    timer: Timer,
 }
 
 impl Gpu {
@@ -220,6 +226,56 @@ pub(crate) fn new(pdev: &pci::Device, bar: Devres<Bar0>) -> Result<impl PinInit<
             spec.revision
         );
 
-        Ok(pin_init!(Self { spec, bar, fw }))
+        let dev = pdev.as_ref().into();
+        let timer = Timer::new();
+
+        Ok(pin_init!(Self {
+            dev,
+            spec,
+            bar,
+            fw,
+            timer,
+        }))
+    }
+
+    pub(crate) fn test_timer(&self) -> Result<()> {
+        let bar = self.bar.try_access().ok_or(ENXIO)?;
+        dev_info!(&self.dev, "testing timer subdev\n");
+        dev_info!(&self.dev, "current timestamp: {}\n", self.timer.read(&bar));
+        drop(bar);
+
+        assert!(matches!(
+            self.timer
+                .wait_on(&self.bar, Duration::from_millis(10), || Some(())),
+            Ok(())
+        ));
+
+        let bar = self.bar.try_access().ok_or(ENXIO)?;
+        dev_info!(
+            &self.dev,
+            "timestamp after immediate exit: {}\n",
+            self.timer.read(&bar)
+        );
+        let t1 = self.timer.read(&bar);
+        drop(bar);
+
+        assert_eq!(
+            self.timer
+                .wait_on(&self.bar, Duration::from_millis(10), || Option::<()>::None),
+            Err(ETIMEDOUT)
+        );
+
+        let bar = self.bar.try_access().ok_or(ENXIO)?;
+        let t2 = self.timer.read(&bar);
+        assert!(t2 - t1 >= Duration::from_millis(10));
+        dev_info!(
+            &self.dev,
+            "timestamp after timeout: {} ({:?})\n",
+            self.timer.read(&bar),
+            t2 - t1
+        );
+        drop(bar);
+
+        Ok(())
     }
 }
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 8479be2a3f31798e887228863f223d42a63bd8ca..891a93ba7656d2aa5e1fa4357d1d84ee3a054942 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -6,6 +6,7 @@
 mod firmware;
 mod gpu;
 mod regs;
+mod timer;
 
 kernel::module_pci_driver! {
     type: driver::NovaCore,
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index a874cb2fa5bedee258a60e5c3b471f52e5f82469..35bbd3c0b58972de3a2478ef20f93f31c69940e7 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -172,3 +172,11 @@ impl Builder<$name> {
     7:4     major_rev as (u8), "major revision of the chip";
     25:20   chipset try_into (Chipset), "chipset model"
 );
+
+nv_reg!(PtimerTime0@0x00009400;
+    31:0    lo as (u32), "low 32-bits of the timer"
+);
+
+nv_reg!(PtimerTime1@0x00009410;
+    31:0    hi as (u32), "high 32 bits of the timer"
+);
diff --git a/drivers/gpu/nova-core/timer.rs b/drivers/gpu/nova-core/timer.rs
new file mode 100644
index 0000000000000000000000000000000000000000..919995bf32141c568206fda165dcac6f4d4ce8b8
--- /dev/null
+++ b/drivers/gpu/nova-core/timer.rs
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Nova Core Timer subdevice
+
+use core::fmt::Display;
+use core::ops::{Add, Sub};
+use core::time::Duration;
+
+use kernel::devres::Devres;
+use kernel::num::U64Ext;
+use kernel::prelude::*;
+
+use crate::driver::Bar0;
+use crate::regs;
+
+/// A timestamp with nanosecond granularity obtained from the GPU timer.
+///
+/// A timestamp can also be substracted to another in order to obtain a [`Duration`].
+///
+/// TODO: add Kunit tests!
+#[derive(Debug, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
+pub(crate) struct Timestamp(u64);
+
+impl Display for Timestamp {
+    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+        write!(f, "{}", self.0)
+    }
+}
+
+impl Add<u64> for Timestamp {
+    type Output = Self;
+
+    fn add(self, rhs: u64) -> Self::Output {
+        Timestamp(self.0.wrapping_add(rhs))
+    }
+}
+
+impl Sub for Timestamp {
+    type Output = Duration;
+
+    fn sub(self, rhs: Self) -> Self::Output {
+        Duration::from_nanos(self.0.wrapping_sub(rhs.0))
+    }
+}
+
+pub(crate) struct Timer {}
+
+impl Timer {
+    pub(crate) fn new() -> Self {
+        Self {}
+    }
+
+    /// Read the current timer timestamp.
+    pub(crate) fn read(&self, bar: &Bar0) -> Timestamp {
+        loop {
+            let hi = regs::PtimerTime1::read(bar);
+            let lo = regs::PtimerTime0::read(bar);
+
+            if hi.hi() == regs::PtimerTime1::read(bar).hi() {
+                return Timestamp(u64::from_u32s(hi.hi(), lo.lo()));
+            }
+        }
+    }
+
+    #[allow(dead_code)]
+    pub(crate) fn time(bar: &Bar0, time: u64) {
+        regs::PtimerTime1::new().hi(time.upper_32_bits()).write(bar);
+        regs::PtimerTime0::new().lo(time.lower_32_bits()).write(bar);
+    }
+
+    /// Wait until `cond` is true or `timeout` elapsed, based on GPU time.
+    ///
+    /// When `cond` evaluates to `Some`, its return value is returned.
+    ///
+    /// `Err(ETIMEDOUT)` is returned if `timeout` has been reached without `cond` evaluating to
+    /// `Some`, or if the timer device is stuck for some reason.
+    pub(crate) fn wait_on<R, F: Fn() -> Option<R>>(
+        &self,
+        dev_bar: &Devres<Bar0>,
+        timeout: Duration,
+        cond: F,
+    ) -> Result<R> {
+        // Number of consecutive time reads after which we consider the timer frozen if it hasn't
+        // moved forward.
+        const MAX_STALLED_READS: usize = 16;
+
+        let (mut cur_time, mut prev_time, deadline) = {
+            let bar = dev_bar.try_access().ok_or(ENXIO)?;
+            let cur_time = self.read(&bar);
+            let deadline = cur_time + u64::try_from(timeout.as_nanos()).unwrap_or(u64::MAX);
+
+            (cur_time, cur_time, deadline)
+        };
+        let mut num_reads = 0;
+
+        loop {
+            if let Some(ret) = cond() {
+                return Ok(ret);
+            }
+
+            (|| {
+                let bar = dev_bar.try_access().ok_or(ENXIO)?;
+                cur_time = self.read(&bar);
+
+                /* Check if the timer is frozen for some reason. */
+                if cur_time == prev_time {
+                    if num_reads >= MAX_STALLED_READS {
+                        return Err(ETIMEDOUT);
+                    }
+                    num_reads += 1;
+                } else {
+                    if cur_time >= deadline {
+                        return Err(ETIMEDOUT);
+                    }
+
+                    num_reads = 0;
+                    prev_time = cur_time;
+                }
+
+                Ok(())
+            })()?;
+        }
+    }
+}

-- 
2.48.1

