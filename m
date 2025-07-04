Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA8DAF895B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 09:26:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1696010E95A;
	Fri,  4 Jul 2025 07:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="W4NUPILO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2077.outbound.protection.outlook.com [40.107.92.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B024110E95E;
 Fri,  4 Jul 2025 07:26:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bJPYxnaruMefDonN282ypOZjQfHBtZUV8J9MyUoKjhCv6os1WGAMbGQf+fc7EisTYoMw8UiaoGgEP05OmqDvTzTcHNk+YSPMxT9aubrjqBtxZGdktqnWE3Qpj5BnJniU+24DyBJWMli/nTHDdGrxymO0zmfdH0drcuX8Erl30tK4YTf6/Cguci8yZH/PQjpUpEkz2y4Q00U/IbiYGaWTAPwho9eV6dqmTlt3z6bQlHpgI1L+ACRAgKYz9Ag/MrhECEvJ3a6LCSeZpKBaTRRShLHDAxA2lLb68dBRrOAcO+4O0EqXw87P+DQqc/RWp6Rzhj6nRzfspOhXQXBqp15+cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KboXs/UmkSRXeAMonmzWXrumeRcrkSAaYp7/maosOgY=;
 b=ov7Wmokh9RbI+tc/gRu7noyj0vxon56FUKJZMsmCmhkswlMSWDDwTGThj/YDQqr7GxxEc4ZDU5+FZ/muzO30A3++gVoiktisQZc8CnHkMoqd4jgLcs5U/QmIugavQMrMXkXjEcj9u93FqGkzBu0+wLntgHNjuUUXX5PMvAT+oodWM3CQWgS2uIr448b48ilSWRZYQq4TJfr/Wy/a6Ff1bJVDYrY7cHEMxBiyvTFDslWLSHPoz39BfnxZd+pZXt33IzT8GetPckDJWbwoaEpsW+nYQ5J/thiZqFTMijfLHQrwY1YXByHSNitJkrlZUF/S2AaI5skAol2MFSf2NPMFmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KboXs/UmkSRXeAMonmzWXrumeRcrkSAaYp7/maosOgY=;
 b=W4NUPILORsgxFHBA/JMHUgcXvX1BhgdV2W8MGTOij+CyQi9SKeoR5JoG/u5bPV/TbFz/THOv+7DgWo/5A0c1OlpBT3kFqZStBLUweXbDVGYf+mKANn3I9dD2IEXxGDMW8r6c4rwSEq4Xeddu7fEfxN5bSwXAxGG3aFMz8LlgqPOrCChjDaSmnYoJwOfZ7/4zhJqAkXSCZcsrK841XqIahtvxEdcsNz0jutnyLaHRyAJ8XaIleIceayVGhcIAdTFw/0j2gxIIPfiFKXxxaLiN1Lu5r/mnSFboRfQAVwBroAKvhPFAeWewqIj/bM9hX0G3Qh6fD2KuMdVRrDDj3cCqkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB6341.namprd12.prod.outlook.com (2603:10b6:208:3c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 4 Jul
 2025 07:26:10 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 07:26:10 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 04 Jul 2025 16:25:15 +0900
Subject: [PATCH 14/18] gpu: nova-core: register: redesign relative
 registers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-nova-regs-v1-14-f88d028781a4@nvidia.com>
References: <20250704-nova-regs-v1-0-f88d028781a4@nvidia.com>
In-Reply-To: <20250704-nova-regs-v1-0-f88d028781a4@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP301CA0083.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB6341:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bca1b07-b0b2-48e5-5d7a-08ddbacc0cac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eTZMcEIxdjBlTlJwKzdpTHFWa0trY0xud09RWFlBcHpmQk1QT3lScWFneVNZ?=
 =?utf-8?B?WWd0dEdJUjQ3NG84a2xZMzZZUFhSOFFTSFF5Mk1oSS8ySEpDWlFlMjNUM2RG?=
 =?utf-8?B?Vld3QmlWOCtYSnJOOXZwdXdkZzVPU09kZElqTmtjZkpTdmlXZm5DR0hseHQx?=
 =?utf-8?B?OGNmVHh2VkJCVHRMeUtQeGdTRjJTY3h5OWxXOUt0T09Rd2cxZ255QldVRThz?=
 =?utf-8?B?VlhIOVlmV0tubmloZmh4UThmSmk3clcwS213SWFjLysyeDhtaHJvV24reExz?=
 =?utf-8?B?bmJMVlJWTFBCbmtsdnhOUXl4MlVxWEVxdzMvOE5YeGljSC9MY0JtQ0taTitu?=
 =?utf-8?B?NDRzU3Vrdk9HNEt2cHIzUU83S3hyWWJuVjFJNUNtZHJPYWF6Ymh6bURMaWs1?=
 =?utf-8?B?cTdGOGdHTXBIWE91ZXlXV1NoR1hjTG9tU1JVbVFKRG8rYkJjK0lxV3cwOXRQ?=
 =?utf-8?B?U1ZJaTdxVDFHS2NLdG90UEEzK05HSWtWZEY2ZEVHVGdiWUhNM24wV09qTlNm?=
 =?utf-8?B?bG9IRzNCM2lnWTJiMnBmYTNMMnJtbnVzRXJZSmpwR1c1dDJLRnczcEIvMGVQ?=
 =?utf-8?B?Skl4NjRlYnZDZEdjbUJQRXNua3hMWDc5VnpWZVNUdE0zeGRLQ3NPcG0vQmky?=
 =?utf-8?B?RFlTR2I1VUV3aGRCQXpNSDFldDk5YnRkRUM4VUJwT3ZzSzh0SmxyeS9NckVv?=
 =?utf-8?B?eHVPSmhZanJPV2l4bmxGTi9xWEJPSlFlSGJRR0F6SURkcFhHSXZpbU5JWEJD?=
 =?utf-8?B?aXI2WW4zR3BQTGtsamNacHRvREdEbVl2ZGdUZnJyV056bHpHVlRvUkgxNFRB?=
 =?utf-8?B?RUR3dkQyUkFIUUNtMnYwR05ld3pkbVdNWTlSa2VNNXFHM0o0bWF4d1FBRm4y?=
 =?utf-8?B?QmxnQk5Wb0xHTGhGcFZJcExDd0RPV2lIM29qRWJNRWpWM2RQS2VzSmpuKzQv?=
 =?utf-8?B?b3R0ZXg4NGtQQms3TWVNSHJFb05oQ0hjTnoxQ2J5Y2JYWDBHWjN1VmRHRGd6?=
 =?utf-8?B?SjFKV1Z6SWY4cS9ZNk8reEJ6YUw0V29XQStNcE9xZTZ3ZVRpV1Z6NThwTHRm?=
 =?utf-8?B?Q2p5WkJrUnVOR1loWUIxdHg2a1o0SUdBTVFmaURvVWJ5QzQ1YVZCVXExZytr?=
 =?utf-8?B?bXpFR1djWGVBaGpWYUd6SHc4QkUrZ09mcVZoZ0RnekczdXE2LzZBb2ZPZko3?=
 =?utf-8?B?RElKaFhaNVkxeGlidVlxTzNHQ1QzcTBsN3JoVk9VNWhkZFQrU0xVOG03MFU2?=
 =?utf-8?B?dDU5Rzk2SXZobFhaMnQ3VmE1eEhGMXFQNTJNTXREZTErMTdYbXQvbTdNZzhj?=
 =?utf-8?B?dU5jL3RpSytqd1RoVzhja3k3OEMvellpQjVqOTZvaXRHMmkybzFTeU03aWIz?=
 =?utf-8?B?aXBmdUVRYXZobTJ1ZmRzV21JV0FiTkd0dkpaUXM1SnFLblRqeEg4U1BiYU5F?=
 =?utf-8?B?L0d1YnlKR3d6RHc2TnBubG1lRWxMVEx0ekxOYU1tM2tTYkY2dGplUW1RZll5?=
 =?utf-8?B?dkloemVxSjBjYWc4ajIzTVdFRW5UQjgyeWJWZ3RuTVhxSjdRQlh4ZkFoVCs2?=
 =?utf-8?B?d2lPa0RFRWpvc0EwWkJYWXlZUkhoSDhIcTUwZ0dERks4NlZGd1NUdUtHWnJZ?=
 =?utf-8?B?eURIS2dxR2FCeW1PRDVaRE9HY2M1ZVhDd2VXN0pINEZ6RTlGR2ZxaDkrdnQ4?=
 =?utf-8?B?ckhqZUlBUkpQa0F3bkNsUmg3ZFlEQ3lJMWtwSmQwRUtBUnJBdmZMekkwOC9l?=
 =?utf-8?B?bDB4WlJoSnpyNFVHYlZwMDQvUVNTVitpUnliaVFaZHV5VjdZZmllQ3VGeFcw?=
 =?utf-8?B?MkVRQ0dJZjl0RW4rOEhpbkxsbk9tUm9mdHZLK2lna3NkQ01qeDNPbjBjeWhh?=
 =?utf-8?B?RmdFUUtHUmVzNUY1ajBKY3BSQm9tQUJ2aXZMY2ZRUlhBaXZncGRNRGp6UUVC?=
 =?utf-8?Q?y2a8RORtlpk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0oydnNJcy9EYWMxTWtWTm0vSWdxTmgvN0x2TC9rV01ocTljUkdhakpyeDcv?=
 =?utf-8?B?bnRGSGxydVc0cDNiUlkvM09rNS9xZFFOT25wVDU4LzlKRFVkQjVZOE1DSzVG?=
 =?utf-8?B?MS93RmhzQ0NGaEJiMTFxZ3FkcXh5YUozSU1Jc0xDRzRQV0dZRmpxK2tSenVP?=
 =?utf-8?B?UlltWEhKdDVrREtzaWU2UC9LNWxkNVRnOW9QL3ZrMzV1ZFpvNEFwOXU4a3Vu?=
 =?utf-8?B?RWZVN0lWcEl0WldKTnJOMzN3REJmL2FIeTA5Y0s4cEVmaTBvTFBnSmMwV2FC?=
 =?utf-8?B?aXRvdE1vaGxpUjR5QW4rQms5T2kvclVBc3BrZkN6OTVlNDFEd3oxZUJJcmdh?=
 =?utf-8?B?QlluTDBNeGhoZFlYK05UcDFENHlueFpnYXlObEJvN0docko0dnFTSjFaMXZ3?=
 =?utf-8?B?TVY0UkNETjgxQWFsa3JCOTlJZ0xMS1VEcDc2Vlh6cXc3MXB2cTlDRnJYdE9o?=
 =?utf-8?B?dDROenlLVThxYXV2MjUwTS9oV21CRll6TFFhVTRWSkhaTklZK3hhL3pEbmpM?=
 =?utf-8?B?L1hVSFBMcVJhbFAwU2g3Z0xZdlJNb0pJcmE1NitDUU5VcUUrN3BBaFpwcUhy?=
 =?utf-8?B?NG96cEl4NGgwc3hwcjRVYitIY1VKU3lnK3oxTmQwSEp1cjk1MHV4bEJXbFAz?=
 =?utf-8?B?UXJURnFsSUhQODNUTDc1Z2JEN1lWNHk2cnJ5L0F1TWdUMDRVeEcraDV1a0lq?=
 =?utf-8?B?QWJSMStYREVnWDQ1UEJVRFY0Umk1U0sxR1lVcDZJdzc4ZTEyUmdsZVJXdFFW?=
 =?utf-8?B?V20xMFFTNzAxVG1WQllWUVo3SCttMG5LYmxwMDRkdzh0cjloczQ3YnI1eElE?=
 =?utf-8?B?WFdPWStyYUdoZmZwNGNKVmp0dUQwaW8zL1hDVEJOZkw2OVdtU0E0aE5sQ2hE?=
 =?utf-8?B?OWNjQTRPY2tUaVhrWUo2WENDMnFSR294TjcvY2Znc3dNMFc0c3U5RWZkTWpC?=
 =?utf-8?B?ck5tTkwzUFVUTnRCb1NwclN2ZWRmUC80UXRWRDk1V09CNU9tc3cxT3hFWVQ0?=
 =?utf-8?B?QndUYk9sSnBIN1pVSUhuZGhCazJYYzNpcjJKOVFROE1lOUpEK1RzM0UxRjVL?=
 =?utf-8?B?VHdEa0RQRXo4Tm1XejJIVERYSG1MUWY0eFI4aWdyM3U0VXhSWEIyNjZ4OWNM?=
 =?utf-8?B?Ny8rY1hFeXYzV0FqcEt2ckt1Znh1RjkzcW9ESUcybUh6V0RPZlAyZ2NqbmJT?=
 =?utf-8?B?VGEzVG11R3IvbWtaQW5qTkprVUNRamQ4U2xTTTJGdzNBeVZSTDhsZkxTcE0v?=
 =?utf-8?B?UjRPa0xENjdwblJnOVZqSGR3N0Y3bHN3b3Vkb1BJSWZZR2JhdndaYlpmYzhO?=
 =?utf-8?B?Y01nQzhWWUkwUzBFMjRYelJhZkhnUjhyWEZLcG9sN3VsN2tCemFRYkp3bzRU?=
 =?utf-8?B?UEVldlpxNXlLc1ZuMVdZTVRQa280aW8rMHUwZ0lOMlpjUERlL2N3NFd5ekRN?=
 =?utf-8?B?dDBrMWNKamFVUklYUjJLeGpaNXhvdjhFb3FZczJ6NFBWMnJkNTJtYkRUa1Bk?=
 =?utf-8?B?eGUwaG1MRW85S00ya282NHowTWF2ZXNsekxFY2ExbUR4dW1qS3lXYUMwU3Jj?=
 =?utf-8?B?S1hrSUlBVmlIczhMWXpxT3dKcnR1RFNLbFBPQ2RjcVRMdmc0WU9aZEwvZUlk?=
 =?utf-8?B?QXBpT3BBVzlZeHJYTUhHbzc2ZmZ0ZVk3dS9aQ0RpT2JFN0dXdG1SMHBjaVY1?=
 =?utf-8?B?aG9TaDJSTi95OVZ1ZmtBemlrQXg2VXVubjhtekp1SFNvOTdGb0dxaWVKM2R5?=
 =?utf-8?B?UENmL0Q0Y1dBWjRrUzRZeWs0MngyM3k5SkJiNW03NHdJOGdGYXFSN2lJRlVD?=
 =?utf-8?B?VXlWYWZYZ2dIQWZlNHJNaHl5SkpwVmdHelk0OE03eTBSMDdMaWVmTXdRZ2JI?=
 =?utf-8?B?TFJWKzFxRlFFYUQ5YUNoRk5nVXFKUjlnMFpQMDd5RVlncVdhSjJpSDJKWWtK?=
 =?utf-8?B?WllYTFJETmwyNkI0YmJFSWIwUGU4VGk0QlJlcnV1STJvbWtKbEFieVNESzUr?=
 =?utf-8?B?VzZZdHdiTXdkVENkZWZSa08vSWZaTXZIakpRZTFkR2I0WkExSFNQMHYxdHVa?=
 =?utf-8?B?bWVNSmVOblVmRThERXVLRHdsWGdSWnAwNzJKREVjc1U0c1M1aUpEMys4OEFw?=
 =?utf-8?B?ZGltOTYzY2VOQUNUQmx0b1crNzlIbUkzZzNENGY1U1V4Wk8zcVJ6SEpsY2RS?=
 =?utf-8?Q?pJQxYnn5OY+99owytz++4PFfou5Qkzvg0W3ikNrkUFFi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bca1b07-b0b2-48e5-5d7a-08ddbacc0cac
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 07:26:10.8154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FHpr41r175M2t7LmncXLXHVAXw4Vt0x4u0d/nn+S9C1jcvW80h5Wevdb9aB//imyXRNWhXCy9mMHl2+84lItPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6341
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

The relative registers are currently very unsafe to use: callers can
specify any constant as the base address for access, meaning they can
effectively interpret any I/O address as any relative register.

Ideally, valid base addresses for a family of registers should be
explicitly defined in the code, and could only be used with the relevant
registers

This patch changes the relative register declaration into this:

    register!(REGISTER_NAME @ BaseTrait[offset] ...

Where `BaseTrait` is the name of a ZST used as a parameter of the
`RegisterBase<>` trait to define a trait unique to a class of register.
This specialized trait is then implemented for every type that provides
a valid base address, enabling said types to be passed as the base
address provider for the register's I/O accessor methods.

This design thus makes it impossible to pass an unexpected base address
to a relative register, and, since the valid bases are all known at
compile-time, also guarantees that all I/O accesses are done within the
valid bounds of the I/O range.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 Documentation/gpu/nova/core/todo.rst      |   1 -
 drivers/gpu/nova-core/falcon.rs           |  67 +++++++++-------
 drivers/gpu/nova-core/falcon/gsp.rs       |  12 ++-
 drivers/gpu/nova-core/falcon/hal/ga102.rs |  14 ++--
 drivers/gpu/nova-core/falcon/sec2.rs      |   9 ++-
 drivers/gpu/nova-core/regs.rs             |  50 ++++++------
 drivers/gpu/nova-core/regs/macros.rs      | 126 +++++++++++++++++++++++-------
 7 files changed, 182 insertions(+), 97 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index 894a1e9c3741a43ad4eb76d24a9486862999874e..a1d12c1b289d89251d914fc271b7243ced11d487 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -131,7 +131,6 @@ crate so it can be used by other components as well.
 
 Features desired before this happens:
 
-* Relative register with build-time base address validation,
 * Arrays of registers with build-time index validation,
 * Make I/O optional I/O (for field values that are not registers),
 * Support other sizes than `u32`,
diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index c2c6f9eb380ab390befe5af1b3c5df260ccd7595..66400d07d186938735f705c116d7c7df5fb77fca 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -14,6 +14,7 @@
 use crate::driver::Bar0;
 use crate::gpu::Chipset;
 use crate::regs;
+use crate::regs::macros::RegisterBase;
 use crate::util;
 
 pub(crate) mod gsp;
@@ -259,10 +260,16 @@ fn from(value: bool) -> Self {
     }
 }
 
-/// Trait defining the parameters of a given Falcon instance.
-pub(crate) trait FalconEngine: Sync {
-    /// Base I/O address for the falcon, relative from which its registers are accessed.
-    const BASE: usize;
+/// Type used to represent the `PFALCON` registers address base for a given falcon engine.
+pub(crate) struct PFalconBase(());
+
+/// Trait defining the parameters of a given Falcon engine.
+///
+/// Each engine provides one base for `PFALCON` and `PFALCON2` registers. The `ID` constant is used
+/// to identify a given Falcon instance with register I/O methods.
+pub(crate) trait FalconEngine: Sync + RegisterBase<PFalconBase> + Sized {
+    /// Singleton of the engine, used to identify it with register I/O methods.
+    const ID: Self;
 }
 
 /// Represents a portion of the firmware to be loaded into a particular memory (e.g. IMEM or DMEM).
@@ -328,13 +335,13 @@ pub(crate) fn new(
         bar: &Bar0,
         need_riscv: bool,
     ) -> Result<Self> {
-        let hwcfg1 = regs::NV_PFALCON_FALCON_HWCFG1::read(bar, E::BASE);
+        let hwcfg1 = regs::NV_PFALCON_FALCON_HWCFG1::read(bar, &E::ID);
         // Check that the revision and security model contain valid values.
         let _ = hwcfg1.core_rev()?;
         let _ = hwcfg1.security_model()?;
 
         if need_riscv {
-            let hwcfg2 = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, E::BASE);
+            let hwcfg2 = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID);
             if !hwcfg2.riscv() {
                 dev_err!(
                     dev,
@@ -354,7 +361,7 @@ pub(crate) fn new(
     fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result {
         // TIMEOUT: memory scrubbing should complete in less than 20ms.
         util::wait_on(Delta::from_millis(20), || {
-            if regs::NV_PFALCON_FALCON_HWCFG2::read(bar, E::BASE).mem_scrubbing_done() {
+            if regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID).mem_scrubbing_done() {
                 Some(())
             } else {
                 None
@@ -364,12 +371,12 @@ fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result {
 
     /// Reset the falcon engine.
     fn reset_eng(&self, bar: &Bar0) -> Result {
-        let _ = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, E::BASE);
+        let _ = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID);
 
         // According to OpenRM's `kflcnPreResetWait_GA102` documentation, HW sometimes does not set
         // RESET_READY so a non-failing timeout is used.
         let _ = util::wait_on(Delta::from_micros(150), || {
-            let r = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, E::BASE);
+            let r = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID);
             if r.reset_ready() {
                 Some(())
             } else {
@@ -377,13 +384,13 @@ fn reset_eng(&self, bar: &Bar0) -> Result {
             }
         });
 
-        regs::NV_PFALCON_FALCON_ENGINE::alter(bar, E::BASE, |v| v.set_reset(true));
+        regs::NV_PFALCON_FALCON_ENGINE::alter(bar, &E::ID, |v| v.set_reset(true));
 
         // TODO[DLAY]: replace with udelay() or equivalent once available.
         // TIMEOUT: falcon engine should not take more than 10us to reset.
         let _: Result = util::wait_on(Delta::from_micros(10), || None);
 
-        regs::NV_PFALCON_FALCON_ENGINE::alter(bar, E::BASE, |v| v.set_reset(false));
+        regs::NV_PFALCON_FALCON_ENGINE::alter(bar, &E::ID, |v| v.set_reset(false));
 
         self.reset_wait_mem_scrubbing(bar)?;
 
@@ -398,7 +405,7 @@ pub(crate) fn reset(&self, bar: &Bar0) -> Result {
 
         regs::NV_PFALCON_FALCON_RM::default()
             .set_value(regs::NV_PMC_BOOT_0::read(bar).into())
-            .write(bar, E::BASE);
+            .write(bar, &E::ID);
 
         Ok(())
     }
@@ -449,10 +456,10 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
 
         regs::NV_PFALCON_FALCON_DMATRFBASE::default()
             .set_base((dma_start >> 8) as u32)
-            .write(bar, E::BASE);
+            .write(bar, &E::ID);
         regs::NV_PFALCON_FALCON_DMATRFBASE1::default()
             .set_base((dma_start >> 40) as u16)
-            .write(bar, E::BASE);
+            .write(bar, &E::ID);
 
         let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::default()
             .set_size(DmaTrfCmdSize::Size256B)
@@ -463,17 +470,17 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
             // Perform a transfer of size `DMA_LEN`.
             regs::NV_PFALCON_FALCON_DMATRFMOFFS::default()
                 .set_offs(load_offsets.dst_start + pos)
-                .write(bar, E::BASE);
+                .write(bar, &E::ID);
             regs::NV_PFALCON_FALCON_DMATRFFBOFFS::default()
                 .set_offs(src_start + pos)
-                .write(bar, E::BASE);
-            cmd.write(bar, E::BASE);
+                .write(bar, &E::ID);
+            cmd.write(bar, &E::ID);
 
             // Wait for the transfer to complete.
             // TIMEOUT: arbitrarily large value, no DMA transfer to the falcon's small memories
             // should ever take that long.
             util::wait_on(Delta::from_secs(2), || {
-                let r = regs::NV_PFALCON_FALCON_DMATRFCMD::read(bar, E::BASE);
+                let r = regs::NV_PFALCON_FALCON_DMATRFCMD::read(bar, &E::ID);
                 if r.idle() {
                     Some(())
                 } else {
@@ -487,9 +494,9 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
 
     /// Perform a DMA load into `IMEM` and `DMEM` of `fw`, and prepare the falcon to run it.
     pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F) -> Result {
-        regs::NV_PFALCON_FBIF_CTL::alter(bar, E::BASE, |v| v.set_allow_phys_no_ctx(true));
-        regs::NV_PFALCON_FALCON_DMACTL::default().write(bar, E::BASE);
-        regs::NV_PFALCON_FBIF_TRANSCFG::alter(bar, E::BASE, |v| {
+        regs::NV_PFALCON_FBIF_CTL::alter(bar, &E::ID, |v| v.set_allow_phys_no_ctx(true));
+        regs::NV_PFALCON_FALCON_DMACTL::default().write(bar, &E::ID);
+        regs::NV_PFALCON_FBIF_TRANSCFG::alter(bar, &E::ID, |v| {
             v.set_target(FalconFbifTarget::CoherentSysmem)
                 .set_mem_type(FalconFbifMemType::Physical)
         });
@@ -502,7 +509,7 @@ pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F)
         // Set `BootVec` to start of non-secure code.
         regs::NV_PFALCON_FALCON_BOOTVEC::default()
             .set_value(fw.boot_addr())
-            .write(bar, E::BASE);
+            .write(bar, &E::ID);
 
         Ok(())
     }
@@ -523,27 +530,27 @@ pub(crate) fn boot(
         if let Some(mbox0) = mbox0 {
             regs::NV_PFALCON_FALCON_MAILBOX0::default()
                 .set_value(mbox0)
-                .write(bar, E::BASE);
+                .write(bar, &E::ID);
         }
 
         if let Some(mbox1) = mbox1 {
             regs::NV_PFALCON_FALCON_MAILBOX1::default()
                 .set_value(mbox1)
-                .write(bar, E::BASE);
+                .write(bar, &E::ID);
         }
 
-        match regs::NV_PFALCON_FALCON_CPUCTL::read(bar, E::BASE).alias_en() {
+        match regs::NV_PFALCON_FALCON_CPUCTL::read(bar, &E::ID).alias_en() {
             true => regs::NV_PFALCON_FALCON_CPUCTL_ALIAS::default()
                 .set_startcpu(true)
-                .write(bar, E::BASE),
+                .write(bar, &E::ID),
             false => regs::NV_PFALCON_FALCON_CPUCTL::default()
                 .set_startcpu(true)
-                .write(bar, E::BASE),
+                .write(bar, &E::ID),
         }
 
         // TIMEOUT: arbitrarily large value, firmwares should complete in less than 2 seconds.
         util::wait_on(Delta::from_secs(2), || {
-            let r = regs::NV_PFALCON_FALCON_CPUCTL::read(bar, E::BASE);
+            let r = regs::NV_PFALCON_FALCON_CPUCTL::read(bar, &E::ID);
             if r.halted() {
                 Some(())
             } else {
@@ -552,8 +559,8 @@ pub(crate) fn boot(
         })?;
 
         let (mbox0, mbox1) = (
-            regs::NV_PFALCON_FALCON_MAILBOX0::read(bar, E::BASE).value(),
-            regs::NV_PFALCON_FALCON_MAILBOX1::read(bar, E::BASE).value(),
+            regs::NV_PFALCON_FALCON_MAILBOX0::read(bar, &E::ID).value(),
+            regs::NV_PFALCON_FALCON_MAILBOX1::read(bar, &E::ID).value(),
         );
 
         Ok((mbox0, mbox1))
diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/falcon/gsp.rs
index d622e9a64470932af0b48032be5a1d4b518bf4a7..0db9f94036a6a7ced5a461aec2cff2ce246a5e0e 100644
--- a/drivers/gpu/nova-core/falcon/gsp.rs
+++ b/drivers/gpu/nova-core/falcon/gsp.rs
@@ -2,23 +2,27 @@
 
 use crate::{
     driver::Bar0,
-    falcon::{Falcon, FalconEngine},
-    regs,
+    falcon::{Falcon, FalconEngine, PFalconBase},
+    regs::{self, macros::RegisterBase},
 };
 
 /// Type specifying the `Gsp` falcon engine. Cannot be instantiated.
 pub(crate) struct Gsp(());
 
-impl FalconEngine for Gsp {
+impl RegisterBase<PFalconBase> for Gsp {
     const BASE: usize = 0x00110000;
 }
 
+impl FalconEngine for Gsp {
+    const ID: Self = Gsp(());
+}
+
 impl Falcon<Gsp> {
     /// Clears the SWGEN0 bit in the Falcon's IRQ status clear register to
     /// allow GSP to signal CPU for processing new messages in message queue.
     pub(crate) fn clear_swgen0_intr(&self, bar: &Bar0) {
         regs::NV_PFALCON_FALCON_IRQSCLR::default()
             .set_swgen0(true)
-            .write(bar, Gsp::BASE);
+            .write(bar, &Gsp::ID);
     }
 }
diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
index 52c33d3f22a8e920742b45940c346c47fdc70e93..3fdacd19322dd122eb00e245de4be8d1edd61a5f 100644
--- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -16,15 +16,15 @@
 use super::FalconHal;
 
 fn select_core_ga102<E: FalconEngine>(bar: &Bar0) -> Result {
-    let bcr_ctrl = regs::NV_PRISCV_RISCV_BCR_CTRL::read(bar, E::BASE);
+    let bcr_ctrl = regs::NV_PRISCV_RISCV_BCR_CTRL::read(bar, &E::ID);
     if bcr_ctrl.core_select() != PeregrineCoreSelect::Falcon {
         regs::NV_PRISCV_RISCV_BCR_CTRL::default()
             .set_core_select(PeregrineCoreSelect::Falcon)
-            .write(bar, E::BASE);
+            .write(bar, &E::ID);
 
         // TIMEOUT: falcon core should take less than 10ms to report being enabled.
         util::wait_on(Delta::from_millis(10), || {
-            let r = regs::NV_PRISCV_RISCV_BCR_CTRL::read(bar, E::BASE);
+            let r = regs::NV_PRISCV_RISCV_BCR_CTRL::read(bar, &E::ID);
             if r.valid() {
                 Some(())
             } else {
@@ -76,16 +76,16 @@ fn signature_reg_fuse_version_ga102(
 fn program_brom_ga102<E: FalconEngine>(bar: &Bar0, params: &FalconBromParams) -> Result {
     regs::NV_PFALCON2_FALCON_BROM_PARAADDR::default()
         .set_value(params.pkc_data_offset)
-        .write(bar, E::BASE);
+        .write(bar, &E::ID);
     regs::NV_PFALCON2_FALCON_BROM_ENGIDMASK::default()
         .set_value(u32::from(params.engine_id_mask))
-        .write(bar, E::BASE);
+        .write(bar, &E::ID);
     regs::NV_PFALCON2_FALCON_BROM_CURR_UCODE_ID::default()
         .set_ucode_id(params.ucode_id)
-        .write(bar, E::BASE);
+        .write(bar, &E::ID);
     regs::NV_PFALCON2_FALCON_MOD_SEL::default()
         .set_algo(FalconModSelAlgo::Rsa3k)
-        .write(bar, E::BASE);
+        .write(bar, &E::ID);
 
     Ok(())
 }
diff --git a/drivers/gpu/nova-core/falcon/sec2.rs b/drivers/gpu/nova-core/falcon/sec2.rs
index 5147d9e2a7fe859210727504688d84cca4de991b..dbc486a712ffce30efa3a4264b0757974962302e 100644
--- a/drivers/gpu/nova-core/falcon/sec2.rs
+++ b/drivers/gpu/nova-core/falcon/sec2.rs
@@ -1,10 +1,15 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use crate::falcon::FalconEngine;
+use crate::falcon::{FalconEngine, PFalconBase};
+use crate::regs::macros::RegisterBase;
 
 /// Type specifying the `Sec2` falcon engine. Cannot be instantiated.
 pub(crate) struct Sec2(());
 
-impl FalconEngine for Sec2 {
+impl RegisterBase<PFalconBase> for Sec2 {
     const BASE: usize = 0x00840000;
 }
+
+impl FalconEngine for Sec2 {
+    const ID: Self = Sec2(());
+}
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index e8b8aabce3f36abe6a7fba3e11f677e36baa3897..4e047fc4947b6dc09dbd34e26eeda1ff14dff4ad 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -5,11 +5,11 @@
 #![allow(non_camel_case_types)]
 
 #[macro_use]
-mod macros;
+pub(crate) mod macros;
 
 use crate::falcon::{
     DmaTrfCmdSize, FalconCoreRev, FalconCoreRevSubversion, FalconFbifMemType, FalconFbifTarget,
-    FalconModSelAlgo, FalconSecurityModel, PeregrineCoreSelect,
+    FalconModSelAlgo, FalconSecurityModel, PFalconBase, PeregrineCoreSelect,
 };
 use crate::gpu::{Architecture, Chipset};
 use kernel::prelude::*;
@@ -181,24 +181,24 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
 
 /* PFALCON */
 
-register!(NV_PFALCON_FALCON_IRQSCLR @ +0x00000004 {
+register!(NV_PFALCON_FALCON_IRQSCLR @ PFalconBase[0x00000004] {
     4:4     halt as bool;
     6:6     swgen0 as bool;
 });
 
-register!(NV_PFALCON_FALCON_MAILBOX0 @ +0x00000040 {
+register!(NV_PFALCON_FALCON_MAILBOX0 @ PFalconBase[0x00000040] {
     31:0    value as u32;
 });
 
-register!(NV_PFALCON_FALCON_MAILBOX1 @ +0x00000044 {
+register!(NV_PFALCON_FALCON_MAILBOX1 @ PFalconBase[0x00000044] {
     31:0    value as u32;
 });
 
-register!(NV_PFALCON_FALCON_RM @ +0x00000084 {
+register!(NV_PFALCON_FALCON_RM @ PFalconBase[0x00000084] {
     31:0    value as u32;
 });
 
-register!(NV_PFALCON_FALCON_HWCFG2 @ +0x000000f4 {
+register!(NV_PFALCON_FALCON_HWCFG2 @ PFalconBase[0x000000f4] {
     10:10   riscv as bool;
     12:12   mem_scrubbing as bool, "Set to 0 after memory scrubbing is completed";
     31:31   reset_ready as bool, "Signal indicating that reset is completed (GA102+)";
@@ -211,17 +211,17 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
     }
 }
 
-register!(NV_PFALCON_FALCON_CPUCTL @ +0x00000100 {
+register!(NV_PFALCON_FALCON_CPUCTL @ PFalconBase[0x00000100] {
     1:1     startcpu as bool;
     4:4     halted as bool;
     6:6     alias_en as bool;
 });
 
-register!(NV_PFALCON_FALCON_BOOTVEC @ +0x00000104 {
+register!(NV_PFALCON_FALCON_BOOTVEC @ PFalconBase[0x00000104] {
     31:0    value as u32;
 });
 
-register!(NV_PFALCON_FALCON_DMACTL @ +0x0000010c {
+register!(NV_PFALCON_FALCON_DMACTL @ PFalconBase[0x0000010c] {
     0:0     require_ctx as bool;
     1:1     dmem_scrubbing as bool;
     2:2     imem_scrubbing as bool;
@@ -229,15 +229,15 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
     7:7     secure_stat as bool;
 });
 
-register!(NV_PFALCON_FALCON_DMATRFBASE @ +0x00000110 {
+register!(NV_PFALCON_FALCON_DMATRFBASE @ PFalconBase[0x00000110] {
     31:0    base as u32;
 });
 
-register!(NV_PFALCON_FALCON_DMATRFMOFFS @ +0x00000114 {
+register!(NV_PFALCON_FALCON_DMATRFMOFFS @ PFalconBase[0x00000114] {
     23:0    offs as u32;
 });
 
-register!(NV_PFALCON_FALCON_DMATRFCMD @ +0x00000118 {
+register!(NV_PFALCON_FALCON_DMATRFCMD @ PFalconBase[0x00000118] {
     0:0     full as bool;
     1:1     idle as bool;
     3:2     sec as u8;
@@ -248,60 +248,60 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
     16:16   set_dmtag as u8;
 });
 
-register!(NV_PFALCON_FALCON_DMATRFFBOFFS @ +0x0000011c {
+register!(NV_PFALCON_FALCON_DMATRFFBOFFS @ PFalconBase[0x0000011c] {
     31:0    offs as u32;
 });
 
-register!(NV_PFALCON_FALCON_DMATRFBASE1 @ +0x00000128 {
+register!(NV_PFALCON_FALCON_DMATRFBASE1 @ PFalconBase[0x00000128] {
     8:0     base as u16;
 });
 
-register!(NV_PFALCON_FALCON_HWCFG1 @ +0x0000012c {
+register!(NV_PFALCON_FALCON_HWCFG1 @ PFalconBase[0x0000012c] {
     3:0     core_rev as u8 ?=> FalconCoreRev, "Core revision";
     5:4     security_model as u8 ?=> FalconSecurityModel, "Security model";
     7:6     core_rev_subversion as u8 ?=> FalconCoreRevSubversion, "Core revision subversion";
 });
 
-register!(NV_PFALCON_FALCON_CPUCTL_ALIAS @ +0x00000130 {
+register!(NV_PFALCON_FALCON_CPUCTL_ALIAS @ PFalconBase[0x00000130] {
     1:1     startcpu as bool;
 });
 
 // Actually known as `NV_PSEC_FALCON_ENGINE` and `NV_PGSP_FALCON_ENGINE` depending on the falcon
 // instance.
-register!(NV_PFALCON_FALCON_ENGINE @ +0x000003c0 {
+register!(NV_PFALCON_FALCON_ENGINE @ PFalconBase[0x000003c0] {
     0:0     reset as bool;
 });
 
 // TODO[REGA]: this is an array of registers.
-register!(NV_PFALCON_FBIF_TRANSCFG @ +0x00000600 {
+register!(NV_PFALCON_FBIF_TRANSCFG @ PFalconBase[0x00000600] {
     1:0     target as u8 ?=> FalconFbifTarget;
     2:2     mem_type as bool => FalconFbifMemType;
 });
 
-register!(NV_PFALCON_FBIF_CTL @ +0x00000624 {
+register!(NV_PFALCON_FBIF_CTL @ PFalconBase[0x00000624] {
     7:7     allow_phys_no_ctx as bool;
 });
 
-register!(NV_PFALCON2_FALCON_MOD_SEL @ +0x00001180 {
+register!(NV_PFALCON2_FALCON_MOD_SEL @ PFalconBase[0x00001180] {
     7:0     algo as u8 ?=> FalconModSelAlgo;
 });
 
-register!(NV_PFALCON2_FALCON_BROM_CURR_UCODE_ID @ +0x00001198 {
+register!(NV_PFALCON2_FALCON_BROM_CURR_UCODE_ID @ PFalconBase[0x00001198] {
     7:0    ucode_id as u8;
 });
 
-register!(NV_PFALCON2_FALCON_BROM_ENGIDMASK @ +0x0000119c {
+register!(NV_PFALCON2_FALCON_BROM_ENGIDMASK @ PFalconBase[0x0000119c] {
     31:0    value as u32;
 });
 
 // TODO[REGA]: this is an array of registers.
-register!(NV_PFALCON2_FALCON_BROM_PARAADDR @ +0x00001210 {
+register!(NV_PFALCON2_FALCON_BROM_PARAADDR @ PFalconBase[0x00001210] {
     31:0    value as u32;
 });
 
 /* PRISCV */
 
-register!(NV_PRISCV_RISCV_BCR_CTRL @ +0x00001668 {
+register!(NV_PRISCV_RISCV_BCR_CTRL @ PFalconBase[0x00001668] {
     0:0     valid as bool;
     4:4     core_select as bool => PeregrineCoreSelect;
     8:8     br_fetch as bool;
diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 316b67ee1cea7c7fa2894c1778e7d43f853bdb19..1f0375d20b5f4328d496a14120eea8a54123f8cc 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -10,6 +10,16 @@
 //! dedicated type for each register. Each such type comes with its own field accessors that can
 //! return an error if a field's value is invalid.
 
+/// Trait providing a base address to be added to the offset of a relative register to obtain
+/// its actual offset.
+///
+/// The `T` generic argument is used to distinguish which base to use, in case a type provides
+/// several bases. It is given to the `register!` macro to restrict the use of the register to
+/// implementors of this particular variant.
+pub(crate) trait RegisterBase<T> {
+    const BASE: usize;
+}
+
 /// Defines a dedicated type for a register with an absolute offset, including getter and setter
 /// methods for its fields and methods to read and write it from an `Io` region.
 ///
@@ -56,20 +66,6 @@
 /// The documentation strings are optional. If present, they will be added to the type's
 /// definition, or the field getter and setter methods they are attached to.
 ///
-/// Putting a `+` before the address of the register makes it relative to a base: the `read` and
-/// `write` methods take a `base` argument that is added to the specified address before access:
-///
-/// ```no_run
-/// register!(CPU_CTL @ +0x0000010, "CPU core control" {
-///    0:0     start as bool, "Start the CPU core";
-/// });
-///
-/// // Flip the `start` switch for the CPU core which base address is at `CPU_BASE`.
-/// let cpuctl = CPU_CTL::read(&bar, CPU_BASE);
-/// pr_info!("CPU CTL: {:#x}", cpuctl);
-/// cpuctl.set_start(true).write(&bar, CPU_BASE);
-/// ```
-///
 /// It is also possible to create a alias register by using the `=> ALIAS` syntax. This is useful
 /// for cases where a register's interpretation depends on the context:
 ///
@@ -85,6 +81,57 @@
 ///
 /// In this example, `SCRATCH_0_BOOT_STATUS` uses the same I/O address as `SCRATCH_0`, while also
 /// providing its own `completed` field.
+///
+/// ## Relative registers
+///
+/// A register can be defined as being accessible from a fixed offset of a provided base. For this,
+/// use the `Base[Offset]` syntax when specifying the register's address.
+///
+/// `Base` is an arbitrary type (typically a ZST) to be used as a generic parameter of the
+/// `RegisterBase` to provide the base as a constant, i.e. each type providing a base for this
+/// register needs to implement `RegisterBase<Base>`.
+///
+/// The`read`, `write` and `alter` methods of relative registers take an extra `base` argument that
+/// is used to resolve the final address of the register.
+///
+/// ```no_run
+/// // Type used as parameter of `RegisterBase` to specify the base.
+/// pub(crate) struct CpuCtlBase;
+///
+/// // ZST describing `CPU0`.
+/// struct Cpu0;
+/// impl RegisterBase<CpuCtlBase> for Cpu0 {
+///     const BASE: usize = 0xf00;
+/// }
+/// // Singleton of `CPU0` used to identify it.
+/// const CPU0: Cpu0 = Cpu0;
+///
+/// // ZST describing `CPU1`.
+/// struct Cpu1;
+/// impl RegisterBase<CpuCtlBase> for Cpu1 {
+///     const BASE: usize = 0x1f00;
+/// }
+/// // Singleton of `CPU1` used to identify it.
+/// const CPU1: Cpu1 = Cpu1;
+///
+/// register!(CPU_CTL @ CpuCtlBase[0x10], "CPU core control" {
+///     0:0     start as bool, "Start the CPU core";
+/// });
+///
+/// // Start `CPU0`.
+/// CPU_CTL::alter(bar, &CPU0, |r| r.set_start(true));
+///
+/// // Start `CPU1`.
+/// CPU_CTL::alter(bar, &CPU1, |r| r.set_start(true));
+///
+/// // Alias of a relative register.
+/// register!(CPU_CTL_ALIAS => CpuCtlBase[CPU_CTL], "Alias to CPU core control" {
+///     1:1     alias_start as bool, "Start the aliased CPU core";
+/// });
+///
+/// // Start the aliased `CPU0`.
+/// CPU_CTL_ALIAS::alter(bar, &CPU0, |r| r.set_alias_start(true));
+/// ```
 macro_rules! register {
     // Creates a register at a fixed offset of the MMIO space.
     ($name:ident @ $offset:literal $(, $comment:literal)? { $($fields:tt)* } ) => {
@@ -98,16 +145,16 @@ macro_rules! register {
         register!(@io_fixed $name @ $alias::OFFSET);
     };
 
-    // Creates a register at a relative offset from a base address.
-    ($name:ident @ + $offset:literal $(, $comment:literal)? { $($fields:tt)* } ) => {
+    // Creates a register at a relative offset from a base address provider.
+    ($name:ident @ $base:ty [ $offset:literal ] $(, $comment:literal)? { $($fields:tt)* } ) => {
         register!(@core $name $(, $comment)? { $($fields)* } );
-        register!(@io_relative $name @ + $offset);
+        register!(@io_relative $name @ $base [ $offset ]);
     };
 
     // Creates an alias register of relative offset register `alias` with its own fields.
-    ($name:ident => + $alias:ident $(, $comment:literal)? { $($fields:tt)* } ) => {
+    ($name:ident => $base:ty [ $alias:ident ] $(, $comment:literal)? { $($fields:tt)* }) => {
         register!(@core $name $(, $comment)? { $($fields)* } );
-        register!(@io_relative $name @ + $alias::OFFSET);
+        register!(@io_relative $name @ $base [ $alias::OFFSET ]);
     };
 
     // All rules below are helpers.
@@ -380,39 +427,62 @@ pub(crate) fn alter<const SIZE: usize, T, F>(
     };
 
     // Generates the IO accessors for a relative offset register.
-    (@io_relative $name:ident @ + $offset:literal) => {
+    (@io_relative $name:ident @ $base:ty [ $offset:expr ]) => {
         #[allow(dead_code)]
         impl $name {
             pub(crate) const OFFSET: usize = $offset;
 
+            /// Read the register from `io`, using the base address provided by `base` and adding
+            /// the register's offset to it.
             #[inline(always)]
-            pub(crate) fn read<const SIZE: usize, T>(
+            pub(crate) fn read<const SIZE: usize, T, B>(
                 io: &T,
-                base: usize,
+                #[allow(unused_variables)]
+                base: &B,
             ) -> Self where
                 T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                B: crate::regs::macros::RegisterBase<$base>,
             {
-                Self(io.read32(base + $offset))
+                const OFFSET: usize = $name::OFFSET;
+
+                let value = io.read32(
+                    <B as crate::regs::macros::RegisterBase<$base>>::BASE + OFFSET
+                );
+
+                Self(value)
             }
 
+            /// Write the value contained in `self` to `io`, using the base address provided by
+            /// `base` and adding the register's offset to it.
             #[inline(always)]
-            pub(crate) fn write<const SIZE: usize, T>(
+            pub(crate) fn write<const SIZE: usize, T, B>(
                 self,
                 io: &T,
-                base: usize,
+                #[allow(unused_variables)]
+                base: &B,
             ) where
                 T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                B: crate::regs::macros::RegisterBase<$base>,
             {
-                io.write32(self.0, base + $offset)
+                const OFFSET: usize = $name::OFFSET;
+
+                io.write32(
+                    self.0,
+                    <B as crate::regs::macros::RegisterBase<$base>>::BASE + OFFSET
+                );
             }
 
+            /// Read the register from `io`, using the base address provided by `base` and adding
+            /// the register's offset to it, then run `f` on its value to obtain a new value to
+            /// write back.
             #[inline(always)]
-            pub(crate) fn alter<const SIZE: usize, T, F>(
+            pub(crate) fn alter<const SIZE: usize, T, B, F>(
                 io: &T,
-                base: usize,
+                base: &B,
                 f: F,
             ) where
                 T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                B: crate::regs::macros::RegisterBase<$base>,
                 F: ::core::ops::FnOnce(Self) -> Self,
             {
                 let reg = f(Self::read(io, base));

-- 
2.50.0

