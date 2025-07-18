Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1972FB09C63
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 09:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 759CE10E8E0;
	Fri, 18 Jul 2025 07:26:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RIA/zzH4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2049.outbound.protection.outlook.com [40.107.101.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB64C10E8FC;
 Fri, 18 Jul 2025 07:26:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aOpHey2VufOpzsTBNLWOrqvEAjEN0tHfL72jcJPW2GJ9aXLPg8pRFJj+isQ/Caq0Q+bQynSgJju4J4xN9EPCWIjKp42vVRyhU0C3VICMLNEZCqZUUhVGj/PHbT7PqkGwzos+grBSgX6BQw+hSlcxSTPaC9BVhykeDm8FIrWhGORas8sYZIfNcTJOfRGhfUTdx9npvUASTOmt7PhuM9HuE068DxD9/nzEbUkzJC18EitT5MDwE40teA3HMYyQIulzbnU0ipTQFoU3Dl4KQqJHiLX6Uc4lzgIlCOwlnBkfs1isjHiqHRGuLIIRdQsihJuHJA4lgPFd52X85hvj+4nWEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQFN65x/emEQvj9LJUqjYwo0aJy/y5d5ggR81ZiIZK8=;
 b=sxBHBzTEzGt97c1kuijVIkVisDPIvERwINpqqyIhILIddVG8Fj/lHDblvWWu9jOUSgp3HEwx7fMELdy5FErAVv/BXwLh/8Dm9lCoC39NLlDmbsaUEID90wpUbUtQi2UkmpozKq9WC5eFtK6YcgsbUc/o5Km8e6t0olrwKOwrtXxZVVpUHtnXvPdRZn2wkGv2Ze5iRl4Ibse5kZwD9mUyNI2pvnFBDQq9hY1/jwC7s0RVjELhf5JnoqDaNF7+fLVBAEU/SXB5DPF2FM0C7c1XJcXA/63SUu/0FixBTcOcUZLwPtmqJcCS4KE0yerEf9S+zLFDihi+jORZIyq4yOSBvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQFN65x/emEQvj9LJUqjYwo0aJy/y5d5ggR81ZiIZK8=;
 b=RIA/zzH4WvhVpWzBnZf+xTqcrIlUbbgWO9E31uq1UlAmw6Mec/7cjdGOVUrC7r2npHQJxmJaM13bxrZYAs0Pxi02a55Mxh830ltDq/lh37nZv/bJnU7sDuxLvhqTxXk8NvhE/fa7e6JHzO5W29yQSyps3luLSSsjF0kDbhwRv4Ne1GVyMJSVk+mGBUS+ItcmTi+u2zvsqLbmF7iepAnmZeOEKv5jNOt4tYiP/ASfb82M4p2IN88/bR+xQm0v3/hq+c2OW94ATgSa6jUCPa0VZSk+Dm2qXvg+/E+j7TsrDYEQUCnFHfmswwhXctB5MX79yWOnMXKS+szWOfe59LFnxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4091.namprd12.prod.outlook.com (2603:10b6:5:222::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Fri, 18 Jul
 2025 07:26:36 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 07:26:36 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 18 Jul 2025 16:26:10 +0900
Subject: [PATCH v2 05/19] gpu: nova-core: register: simplify @leaf_accessor
 rule
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-nova-regs-v2-5-7b6a762aa1cd@nvidia.com>
References: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
In-Reply-To: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYAPR01CA0213.jpnprd01.prod.outlook.com
 (2603:1096:404:29::33) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4091:EE_
X-MS-Office365-Filtering-Correlation-Id: fa194c3b-769a-41bc-1ee7-08ddc5cc6dd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3J6OFdpWFJCZVljYjE1VGRDMlBkcXRnd04wNkYxM2lWc3BhTkxZV3JyeDg4?=
 =?utf-8?B?NDVhZ0xUYUhPYWRzV2dMckl2eTM4NWkrNDdHQWlRaVRKQU8wZmdQV05RNDZW?=
 =?utf-8?B?V0llalZ4NTgrQUxlczVlM3EvWkw4c1R3eXoza0RvbGZlYkFIQm9jZHZKWngw?=
 =?utf-8?B?UmlPRnNFMzJ6UmdvbDRzWHRhOVVYK0lRWVU3N3l2bVpVK1JNS2lyM3I0L1RH?=
 =?utf-8?B?V2Jna0R4eXQvbHBsY1lEVXZGM1Q5by9iN2pmWjVRbUdZWnZmdys0L3p5M0U1?=
 =?utf-8?B?TjRvQzdYTUg3NmJDYWNsQnFyZXk2MjErN3hoNGVwalFyUkVvRTBOZVdmbERD?=
 =?utf-8?B?SXBWU1BLSTR5R0FDbjhTUmdrWXpmcTE4cTNRczhPSnc3TU93bElKSkN5R0xR?=
 =?utf-8?B?M0lTZGVHaEYra1hVNUNGYm9kcGVnSmJhelhKZ082dVBySFhlb3pzSE5hblRY?=
 =?utf-8?B?bE50UitObGM5RW50RVdQa0FGNlNZbVNIbjJJSmtocWs3T0RraFJERXVtMmNj?=
 =?utf-8?B?NEtEaHFNa204bEN2dGxsek9HTDlPR2VmRFJ2aXVLbjlkUVBDR1ljR01oQ3Nm?=
 =?utf-8?B?YVVHeWxuSW5MSWV6cVpYWHdhL2tJY3lpYk5za0F3LzJBVUdQbWJSQThBc0xP?=
 =?utf-8?B?UXdWSzBvTXN5bzJWSVo0aGRCK1ZIZ2RFWm9BdVNEVS8rTEdXcGhFM2RZTG1v?=
 =?utf-8?B?OTlUcW5MUDVVNm5xaWd0RkhXMjJUUlNpMlhJMXQrZVQxQWFQQW5NVE94K3Mx?=
 =?utf-8?B?dU5EQVQ5Q0plYmFuMzBvTWdGNnhKRUJZTlN1bkw0Q0NPcGhvYzV4TW5xbjFa?=
 =?utf-8?B?TnRmVnhQM285UVpvQTltY3grR0lFajJubjZmVnpDQUhxSldHYXI2dFU3S255?=
 =?utf-8?B?TWF2cEZiVGkxY2hYU1dKNEcrbldsODN5dHprRm94d3BwaTR2R1BCRWt0SFZH?=
 =?utf-8?B?ZWpMQ04vSzlrclhoRjdSMUpKSXVQT0tMK2JYcUR2VFdBVzROenhET2E2emZY?=
 =?utf-8?B?bzQ4L293dE5NTzJackc1YVdwTFdXNjlwMDNobEM2YUh0RnQ1Z0pUMGF3OW5U?=
 =?utf-8?B?N2JJbUdscVpZcG1xUGYwc0hERmtkU0w5d0kyYldWbDlCRjBHREp0WTNITis5?=
 =?utf-8?B?WndhL1k1bTk2VHdYR1RINy9aUkZOdjNDM1BkaEU3U0N5a2tIZjFHRXpZZUQ0?=
 =?utf-8?B?cEtmakt4MFE5eEI0UStrVlhiVTk4OElPVXVNTy9CUHo5akpSSnJobktPaG1o?=
 =?utf-8?B?V2QyaGNhckZaVmVkeHYweVhwa3ZHK05nNTE1Rm1yTXp4SXlWM1VqMTV0Sjkz?=
 =?utf-8?B?ZEltd0lKSWdUQlBobVQ4dnhqK0hqMW54MDRSTEQyRGt3VHdPZUF6WlliazQ3?=
 =?utf-8?B?VHZRUWZOYTBaVTZNTGoyRHpUaHVGRDZ3R0VLVlU4SFBwL0pKNDJHdzJrN09x?=
 =?utf-8?B?ZHBWdUNiQ0xHcEJKM2ZWN3E4UWZjT09Nd1IrUDl1aExrSXgwUnovVk12OCtF?=
 =?utf-8?B?OWpVR2I3SlZMVnYzNFZJSHRwc3YrWjZYRjNaKy9DUWxPeVNtL0d1cmE5ZVdh?=
 =?utf-8?B?bG45d0ZIaVc1RWRzWksxT2tWKzZNUzFsRy9NMnNFNWJYaHlQM1dtSGd3dFA5?=
 =?utf-8?B?MENvZ25zSDlZSExrejdCRElWMU9LcHZoVlRCeE9xVEJnVmdQYVpvT2VSWU02?=
 =?utf-8?B?MDBkNnZXN3JncTEyTndFMzlNWGErWjN1Z1J3YlIwbFNDeXBjNjZyU2hTdktr?=
 =?utf-8?B?eEN2MEZXNzZmSTJLR2s2UmhnVjVlM2lFcS96Ri9TdUJtNWU3RjZvWGdXUHNZ?=
 =?utf-8?B?bjlReFlONlorZUFiUmV6WW1YQ0dzWEdoeVBwR095SkJVaC82anJXVHNEdmkx?=
 =?utf-8?B?RWlmMmVnNWQwUEF5K3hwZWZ0KzVQSlljemQvQVFLSXJBbFBDSC9MM1FDR1Nn?=
 =?utf-8?Q?hCzGRco/WzQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHpSOVg0K1B3TUZMaExWMUdlRDlCWXAxSUZyV2hnQnpTaXFnaHh6Ly9xRVBE?=
 =?utf-8?B?NFprd3l1cWlHSnNnUHIyQnh4cVRISFZIRUtXSkJxSiswTCtwMEZHZGlIWjdY?=
 =?utf-8?B?L251UHVHUUc5TmFlK2pTUllJT2JqWnRUZFVPb09zU1d0akhta2VBV2FzR3Jo?=
 =?utf-8?B?aElHWlhXYkJ3bGVRMVNtY0Q2MTVjMzJtMjRKQU5jY1V5R1BwUG5EUE5ZZ2hW?=
 =?utf-8?B?NlE1d2kwTjcyTjQrVzM4M3oxYXFxbnVOZGRxcVZ3R09hYnpjNEF4UGtXbGFx?=
 =?utf-8?B?RDFNY3dMenc5WGFBaGpMYzE0elpVZlVoYU1qaG5sVExQd1A2b1owOEx5TWZQ?=
 =?utf-8?B?TjNzTVJPYUkzeElQQ0hmcTZLWm50SmVLUzhLUXFzajJBd1IwQ2VtWmRjYXAr?=
 =?utf-8?B?eUlOR0VFQXRhaVdIbXJOUEFEempsT2pKaENFcFJaWlZUTktHbjVoQ3RpSTFh?=
 =?utf-8?B?SmlodWZKRXRrWTF4eTJheFNsM01TQi9VdUYyZ1VpOEc3UXRlR1QrR09oVG5u?=
 =?utf-8?B?d2VnWW5jUEdMUllnSCtHeUphWG4wTHV6M1ZEbEo4OTFmb0Q3NE4wQUNkTVJL?=
 =?utf-8?B?cWs4YkVDQVlacHZSU0J0RUg0d05wZEhxTis0RU0wTkdjN2J1WHlUcDllMUJo?=
 =?utf-8?B?U3BZNU1rUjBpbjJaanF5R3p5MWtLTlE4bWE3dWF1TjlodkdnTXB6VXB5eWdS?=
 =?utf-8?B?Z1l2TkNqUWg0WUorMUU3a1JmWXB1VEU2Um5qZGhSakxGNEpzaHRmSU9GcEc4?=
 =?utf-8?B?NVltVzFkcGFzS3hEcC9sRUNLYlZYSnZmQlVLMFg4Ymx3UFdjSVNlWnZHUkZ3?=
 =?utf-8?B?UWRoZFVUWjlzTWREVldLN1NvdDl1eHZ0THpqdFF2d0FOZ2xJZWtpWExJS1NO?=
 =?utf-8?B?R0JncWtnalprZEdkTW9OUGU3R2lkUG04UCtXTnhSZ096WlhibkNUNWVPdEdN?=
 =?utf-8?B?OUFtVXVQTFhqbXBmemU0VTlmazVyOUZPTXN4STd5ZG04RDBSMXZWQzJWT21Z?=
 =?utf-8?B?L1d6OFVvT0VIS3dPNXk5OC84UTFjS0ZXbDRyTnNXK1FQbzNSeElkbUNiYktP?=
 =?utf-8?B?ZlpNajhwTi9VcTlBblZoVVpuSkV3djJYUGZYM283QVBoWmNZNjBvWDJYMjJD?=
 =?utf-8?B?SllFVnZ3d1lpenFTanJuRDk0dFZvTGxUcVh3TFBJdWh3QU93VkliWXI1aFBV?=
 =?utf-8?B?N1czejlpaFZQRzE1NmxkUWJLVDRyREU4NjVyRzh0M2FmckYzRHdsZmo2Y0Q4?=
 =?utf-8?B?K2pMMXFyUjh0MVYxbC9UdnArY3dabFBQNHoyQWc5WmlrNXVQeTBXQTJKRUd5?=
 =?utf-8?B?S3ZpTFU3U2FnOGpXWXQxV2d0UFRUTlFGZkFUOXZqaEdlV0I4VXJnMmlZb1kv?=
 =?utf-8?B?K0xabXVEdTVwSkhyRHR2WHlYRmR5VmNZUWZmUWRtSjg5bGtlYXZ0c3BCYnJP?=
 =?utf-8?B?OVNVZjBLcnNwZHdsMGhidEtxT1ZBQ2hmbUpJYmpxRUpuN0NiOHRQdmluQ3k5?=
 =?utf-8?B?ZVI0Y3ptMHF3dXpQNEc5Y1BoNkFoOXdaOHZXZURjVDcxZUExY1k1dHBZcDVh?=
 =?utf-8?B?dWxES2s5WUdLVFlLUDVRT0xYNmFKK05ML1BTTUxmMlNMRzRpUk80NjVsUFA1?=
 =?utf-8?B?YVNobTk4MTlIN010R3RjVkRxUFZhVFVVVTZTWlRqZ1NEMkkwdW5HcE96TXNS?=
 =?utf-8?B?b2FvMk0zd0g3ZWM5YzZoQVl5d0VKVTdvUCs2dURra1BuNEFmTHoyaTU4RGEv?=
 =?utf-8?B?YWNYU09jMHdldU91RGs5eGxFYzcyNXNWeC9vR1NjNkdicHRBdUxCbEYra0JB?=
 =?utf-8?B?d3Zvb01sOVVUQ2NrK1VYWGtwVngrZzlUK1c0RXdyc3h0UUg2dmFvNnVZMjRt?=
 =?utf-8?B?eUNxeCtRUysyWTFtS1AwcWkwRTNnNm9aRVM3eElXNU4vd1dKMGpxYlhuQkhY?=
 =?utf-8?B?SnoxV0l2Qk1pQWI3TjlVWmdUKzBtTU5pc1hITFh4Zk41UGU5SEk5T3FsYnVq?=
 =?utf-8?B?VTZ2WVhvYzc0YjgzNFE5R0ZsNjcreGFrdVA0bTdZMC82Z0tEOHBKdVdqMzh1?=
 =?utf-8?B?WFdrSzZrNGl2YWRaNTFWS3BsK2NndXZ1NXpsZ1dnUmhkWWh2UWxUU3hkTnZ6?=
 =?utf-8?B?cTQxQzVnRFNWMzZCZTRwQXhmRzd4czNIelRKQmIrRE9aRGd4d3RVNXM1aHZW?=
 =?utf-8?Q?OS182Sb1+RmfQ5BBLlbd2UWK80hgdHYbwA1tlsl/XfOI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa194c3b-769a-41bc-1ee7-08ddc5cc6dd1
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 07:26:36.5755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bfuvj2RRtE0aTRPIrrM2x/Q3SwxKOCB4tPpmGlyjd2K9A1rNBg2iRbHzi6nutSmwvmpK0iIfEI042a808Z91WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4091
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

The `$type` metavariable is not used in the @leaf_accessor rule, so
remove it.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/regs/macros.rs | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index dac02f8055e76da68e9a82133fa09a1e794252bc..37c7c454ba810447e1fe41231650e616e2f86eb8 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -230,7 +230,7 @@ impl $name {
             $(, $comment:literal)?;
     ) => {
         register!(
-            @leaf_accessor $name $hi:$lo $field as bool
+            @leaf_accessor $name $hi:$lo $field
             { |f| <$into_type>::from(if f != 0 { true } else { false }) }
             $into_type => $into_type $(, $comment)?;
         );
@@ -248,7 +248,7 @@ impl $name {
         @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt ?=> $try_into_type:ty
             $(, $comment:literal)?;
     ) => {
-        register!(@leaf_accessor $name $hi:$lo $field as $type
+        register!(@leaf_accessor $name $hi:$lo $field
             { |f| <$try_into_type>::try_from(f as $type) } $try_into_type =>
             ::core::result::Result<
                 $try_into_type,
@@ -262,7 +262,7 @@ impl $name {
         @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt => $into_type:ty
             $(, $comment:literal)?;
     ) => {
-        register!(@leaf_accessor $name $hi:$lo $field as $type
+        register!(@leaf_accessor $name $hi:$lo $field
             { |f| <$into_type>::from(f as $type) } $into_type => $into_type $(, $comment)?;);
     };
 
@@ -276,7 +276,7 @@ impl $name {
 
     // Generates the accessor methods for a single field.
     (
-        @leaf_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:ty
+        @leaf_accessor $name:ident $hi:tt:$lo:tt $field:ident
             { $process:expr } $to_type:ty => $res_type:ty $(, $comment:literal)?;
     ) => {
         ::kernel::macros::paste!(

-- 
2.50.1

