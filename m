Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84363B09C65
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 09:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD83610E8FE;
	Fri, 18 Jul 2025 07:26:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VQI7JOhh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2083.outbound.protection.outlook.com [40.107.100.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8469410E8FE;
 Fri, 18 Jul 2025 07:26:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PYxf+a4zW3wZuf+qOZrj+rop6iSf2hy8IZaHhVfrqczhVxEU5MtVIpaLuDedGTDBWz9b+1pb6MYl4c1vmqAnIWjuqg7TpHUq5jw03l71Sdg2Au56vMupW3jzX9XIZ7j+AKcK/BkO0F4dA1Uza9pjsIUBfciBf69soZ5GhL/Jnl+EqMyQgAmsDaPkm6uUOqw9Swc9CKSiO2noT85lGWRscPXwKfmbGAV1ChRC24UHoQcYnaB+NHoKY3TrQ8afEf4usriJAc7MjzPeIrJ6xThSMYe+t8LujjgWdzNEV0fuHJxkv7qz27Q1OAoRqpCvxFU0xQsWOER3h/Dh1BLQeZIvaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=thVhZLBvtILLp0QqiOFMrSdPHAOOZhNqrpZ5vJY/C60=;
 b=kto5trZSTckQ2YW1Qj1X9NZjEk8B9qTJX2UtpJZ/mas21GLmKceomAsKyyxhoxy23ET3uy+3K65NRX8CMZaqVmIEXlwPFEO0yRVl3zaRD7HyFC4zkHPy5997acjHc7fm85HiK/su3oPuY9bpsG+ioVVhEv/wjojnzPm9IPaY4Fc73mShCtnAA6JqFfpiM0zU1U/08zKZH/iGuEkil3sluPPrQ3P8ocvO9ENBLInjL4Dgm0DEbwVilx/0gt3IVGHZnCRtEuDGQxggwPi6f4B6OIUeVtaYJNPcnKPiRYfWjECBpob/K41unsip8GZleo45oFWKiZPlwC1HEFW9vbz2+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=thVhZLBvtILLp0QqiOFMrSdPHAOOZhNqrpZ5vJY/C60=;
 b=VQI7JOhh33RWc84zdZKKdxsP2PUWPDGeOeons5zoKeAuPwymzwEFD2T8PLUkklO7o80ScVBwx6ITGiExh3MhE8n+5tMpTj6hTSYJVuBqtXMbmRUTnokiC1fW8sxoH6QjPiLpRoM6xssRdkAKTCBNXYs3bEVYFxS9TjY3dNVUHQu12foqs7tnI4aq2hTOEQGqXVAlEs2lVmCVAJ7xHaEhFxrU43x5pBzSxRMJXcTKglKYwS1GF7p31GI1xUaha3ccokaneq/VOyL0MAAEGQ5HSyLlT4S/f86BWY35ypMIaa4djaSom3s9iQlXXFnLXK3QXtlnH4y/X8KQ1chhqpeHjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4091.namprd12.prod.outlook.com (2603:10b6:5:222::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Fri, 18 Jul
 2025 07:26:40 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 07:26:40 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 18 Jul 2025 16:26:11 +0900
Subject: [PATCH v2 06/19] gpu: nova-core: register: remove `try_` accessors
 for relative registers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-nova-regs-v2-6-7b6a762aa1cd@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0303.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4091:EE_
X-MS-Office365-Filtering-Correlation-Id: c454867f-c79c-4ff3-cd26-08ddc5cc7001
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TlVnNFo2UmszK0x2TjA0YnVObkhYdVM2dW1vdERwaGVzUWswdnNSa0paQ05p?=
 =?utf-8?B?a3cvS3NBSUFMODUvcXhrT0h4bXo1Nk5ZVnByM1J2d1hBWEEySXY5eWRxNkpm?=
 =?utf-8?B?RlNnNXB3S29yb1h4enVoRTgzVWtTSkJOT2M0TGtMVWlMSUpWYlpRaUlIM0V5?=
 =?utf-8?B?bllRR3pqK2hsY0w2cDkzOXpxdkV3VGNlT2V5MEQyOXFrMVpIZWgzc0YyWVBV?=
 =?utf-8?B?RWtoWDZJNUYwMVFDOUJDZ0NqdkRXRFdkSy9qalFaVGk2S1dxZ3docU5hVHQ4?=
 =?utf-8?B?OGJNa3ZJQldsVzMyTnhFYm5tOEkzczA4V2ZPbTREemRDS0dCNjR0U2VyN3Zh?=
 =?utf-8?B?M1A2MGFDOVFLWHo4SDd3WVV0MUJBL2ZybXBlMkVYd1pEQ2xndVdReEJQRzVr?=
 =?utf-8?B?VENncm4rQ2tXcXYrOEMzY3JGNVlwK3VYc3JMcjJSR3pZN1FYSEFSNUhqYkRw?=
 =?utf-8?B?bmZBaEJjdkxvUGpjNS9jaTkrcEhzYkx6dVlLbk9ERHJNVnJ3L2JPTENUZDlw?=
 =?utf-8?B?cmw0S3pqSmJNUjlZVVlRdHByU0EwU1NjQ1F0WnRqb0FNcmVZTXVGN0lyTzVT?=
 =?utf-8?B?VzdSWEIxTHBqMktNdG94bkV6NGlaMVMwekw4b0s1RU1FVG9TTEhKeWF3NkNs?=
 =?utf-8?B?REZRQlJvMmt3ajE5YWt5dDJZbm5RZEllZ0ozM3FSOVBRUFU0OERwYXpQMGFS?=
 =?utf-8?B?UlFDb25pajB2ci8ySzUzTTNNbTdLVC9leXpDSCtNVnZXMWk5bHMrY1hxa09p?=
 =?utf-8?B?dWp1bmNDK2N1YTNvdElyZ0l4QVBVY0tvMnlnMkljbXFBWjVOdHJyZExocm5W?=
 =?utf-8?B?NWV6TWczdi9xSXdqRlVjOHA1cU9GV240clJuaUQrZ05uaGQ2cjlJSFVBWGxi?=
 =?utf-8?B?WngrQ1hCek5xYitEU2JDLzB4TmVBSFc0d0llbzU0NG85bVoxUUpFRU5MRTlF?=
 =?utf-8?B?ak5HRlVqbDRUTEN0ajcwVmJiQzhBUnRFZWJYS3pWaGkwbFdia3RWeDBUOVZt?=
 =?utf-8?B?cVI0UFZBNko3QVd3ZDNRZUJ3aGR2N0J2ZmtiQ3E5a0RFTC9QV1V6U0ZLMHhU?=
 =?utf-8?B?MTV6TDhjbzhYODExMDlJM3d1QU45R1ZhMUFQeXdCeFdNM3VGSU9MZCtpbUNU?=
 =?utf-8?B?V0lnVTlicFB4TjBnR25KR1cvWjRld0p3ZDFZZEpKZ3NtQ0pHOTRUN1NkNkdG?=
 =?utf-8?B?T0xmWE52N2pSeE9HTGxINkc0NDZpZ0NMNUN0eERtQXFHRHVsV0JuVUQ5bzE3?=
 =?utf-8?B?bDhVTDNyam5Hd2hqelNiWlZBOE11ekVsWTgxMVo4OUc0NWt3ZUtDelI0VWh4?=
 =?utf-8?B?SFpEMjBpSTBvc3lWTjFtbS9nb1JaUzQwYVEzUEcraDFHOWtqL0wvaElYNmNO?=
 =?utf-8?B?R1VuczhPUWJtSzdwaW9VODg5d0tPUVpYOFdPMWt0ZC9weDR3emNrY2JOU2hw?=
 =?utf-8?B?UGR4U1lDUk9UU2lKYU9vZXR2a3dMemJuQzNGSjIvQmMzT2tXVFdTUllRdWY4?=
 =?utf-8?B?QzFBL01aRDN1UUhuNys2QUtLc1kwbjN5UmpPK1pac3p6QkwxekJxU3liZXVs?=
 =?utf-8?B?YkFDTEEyWXNHWE56TWwvZ01rN0EvdFprTmkxdTU1UC9jU0RWYWVRZ21YLytj?=
 =?utf-8?B?enZMajJQcWY2RFFRQVNNeVVTSkJ6REpqbGJoWVJkN2oybjlheVpEb3RUU3NQ?=
 =?utf-8?B?NzFwNk5hUkhCWFI3WUlSZzNYMkxHK08ybjczMkxWQTBDVVpMdmlld3VTbWNN?=
 =?utf-8?B?azV1c2UwbDJJL2VPU2c1dUF6S3pQWDFEanFQanJkYTh2bW5ZSjFFeFVDVVp3?=
 =?utf-8?B?MUxIODVMdHlXZVAvb2o2bHRVY1JkR0piSzB2YU5vNmpwRlU2SHFVbXFKZEs0?=
 =?utf-8?B?K3FvN0RDWmtpUkJaaThhdW5LajhxTlRUck0rQ2trTFhqTVlSWnM3QUtpTllQ?=
 =?utf-8?Q?HYnS5NeBXMI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajdXeE5OamJXc0h1NWNtT1BnNldEZDc5cGdQaCtaNENmZjMwRHpCZzFFVFox?=
 =?utf-8?B?ZDl2VXAvTlBDNWFKSFQ0YXk2RGMrM1JlMDVwQVVxeXBKSkNDMkxrR3M1TW5Y?=
 =?utf-8?B?MUVra0dJSDdFdUdKWSswN25FeVVYTktKZUZPR2dvczZVbzhYSTdTang4S0E5?=
 =?utf-8?B?YzFETXlYa2NYbE9jVk5mZFRhekQxSzdGM1FMMi92WmdUeW5yQkVwUSs4a2Vm?=
 =?utf-8?B?Si9GWWVzRkthYXdVVFNPdU1TQ1FVMlFML1ZPUUJtS3lQYXRvaEZYTjJCQllz?=
 =?utf-8?B?UzJSd3NtZzN2RWlmMURZTUcxQk10Y1ZQeWg0UnRvVEdWSHRoSWQyWHI0Nkh2?=
 =?utf-8?B?QUtpTnBpdWFMRHl4T1R5cUIrc2t1VkVLd3h6a1V3c3E1aGt3M3dTL0JNVVpS?=
 =?utf-8?B?cVc2eFRhemdTYlRyRXcwbXhIWTZ5MndjcndubW0za2lIQ2lybHJSR2hhdFVn?=
 =?utf-8?B?NVFsVkV6dmZ0U2hzM2ZNL1ZtN1NwekEzbnNOcWlwb1lXREwvaHFVV1pLN29a?=
 =?utf-8?B?d3Y0UTRvd3BuQTFIOWlNM0RlcW9maVFuR2d0dVo4alRraGpSYyt4dDI0ZFRM?=
 =?utf-8?B?OW11UDJDa0tDbGNpNnNCTkQzeHZNTi9YN0Vaa1lIOXM4a2ltYjc5b0dDdTBw?=
 =?utf-8?B?VFhZZ2d0NVNoWlZYMDdLeURYRjZXdXRPb3lPYnoyZ2dwV01XNTJxd0t5Sjgy?=
 =?utf-8?B?U2FIZEpWc3BjeExMRGVHN0djbFczUkFOMG4ybDhwNWlleVgxblVLVFpzY3or?=
 =?utf-8?B?YTJKN0sybXdDWFRsMytTbDg0MTliV280QjhnelpMcC80R1lmOFUwT3NaeDBm?=
 =?utf-8?B?S2lwMjBkNXQ0b3BMZkdWUXNIZWVhNWUyWmJ1RDRTUG83aXZ4TXVVcE9hQ1Az?=
 =?utf-8?B?SWxXaVAyZThHVjdpVzRqSlNUMk9aUEpOTDE3dExWV09KTWh1eWhvQ1cvbkYv?=
 =?utf-8?B?Q0hZckp2bUptcXBBQzNSd0xodlB4alV2QnNJczdmeVFSRHV6cWxpUm83YWNB?=
 =?utf-8?B?MU5OWFR5OVY0ZUhValppMVdybEtJUTZoYUs1OEVadERMYmJtU0ZFdy9oYVJw?=
 =?utf-8?B?TjRHS3JjVzNTTGkwcjcrK3B6dmhJbUlHUHlXSnJraUVWVDU1ZWkzd2lwR2Mz?=
 =?utf-8?B?N1M5a2JHdXhwNFkwOFRGWmN5VldwQXRzdVVYTXZqV0diakJicVJYYlhrcUY0?=
 =?utf-8?B?bjIzTC9HZW5CdTgwOTFac3FUK255RWdQQnhrZ2lybk5ZN1JsbGRMeXVzRGhP?=
 =?utf-8?B?VDdlTCszRTZoOFV3eDRIY1N3WTZkWkVQTHZ1R1YzYklNUzV1Zk0rT2ZwZHVi?=
 =?utf-8?B?KzgxODg5TDU4SS84cDNXaldKaGNvWHZIaXFXMHd1VFFvVVhFNk01cUZUdGVj?=
 =?utf-8?B?bnVOdkVheTQ4VEo0cVpUN3JwMGcvMlJLdmIvVk1FYjRXbXVENGQ5RXZYbnhV?=
 =?utf-8?B?d0RxTXdYVWNkaGNOdXhka3N1aHY0aW9vOGd5VFJ0MXMxOFdPRlduVXl1NklH?=
 =?utf-8?B?dFRYemgvazJaWDBOck15N0tnYWQ0aFJWZlBzTkJmYytmbXh3a3BnQkhiQVRB?=
 =?utf-8?B?dWpzT3p4TlVQZGRIZFFxK0VYcVNmREh6M3B6ZVZoMnpybXZ5bi9ydzhYSzJs?=
 =?utf-8?B?bVBOcUNYK0MzV2RMT2QxZ0xsSk85Q3RPS0RjbWxnakRZeENNbTdObFFrUVYw?=
 =?utf-8?B?SGpmc1RWUDlYZFhOK0Fxc2svSFVpUnBQZWRBWTIrbGdJcjg0cnQzNHdISnlu?=
 =?utf-8?B?OXVlWjRmVUk3QnY3TUFicnM1cVVZQ2piUisrWDluK0RuRkVzK2ZqVld6T1JB?=
 =?utf-8?B?WkpCMDZ5MnVHUGIwQkM3akw3eUFsZWYzR0s5b1lUVURMdW82S0M3RjR1SFhC?=
 =?utf-8?B?SWVKRW01MVlxd3dBMnhGd0pOZDlnVk9LdFE0aHJDdG5CU3ZhY1duOVNXZ3Zx?=
 =?utf-8?B?dUQ4VTlZei85OGVwUmpTcUxjVWVzTDdhOENYRmtEaGxWT0dlampScG1vNVFa?=
 =?utf-8?B?L2tmdlVQLzJRNUJ5TWcvRXNHckU5QW1OWUVyc2dYUG1BWlluNHdYQVpMZE8y?=
 =?utf-8?B?S04wTHdpRFkwck03YVBIQXJrUWFMWnQyWnB3TWF1Vm1PNUtjWkhmTUo3MDdW?=
 =?utf-8?B?RlZycXMvZWEzK2VVTDRkdERYWW9oOUFpWk1hc2lEUTZCYkZJbXM0SGhaZTZq?=
 =?utf-8?Q?/Z6+iZRenSWx7WIU0ERV3qx+aGq3VlR24Srf7BtUsbzI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c454867f-c79c-4ff3-cd26-08ddc5cc7001
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 07:26:40.0617 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /PdFnxq2w4ACvRA5bL/r4WcG3NraAikxzTIzIEW5DJjdc05TVtOk/BXqWh80YBGLOrryNYkYk5apeYmskH4jog==
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

Relative registers are always accessed using a literal base, meaning
their validity can always be checked at compile-time. Thus remove the
`try_` accessors that have no purpose.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/regs/macros.rs | 38 +-----------------------------------
 1 file changed, 1 insertion(+), 37 deletions(-)

diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 37c7c454ba810447e1fe41231650e616e2f86eb8..742afd3ae1a3c798817bbf815945889077ce10d0 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -57,9 +57,7 @@
 /// definition, or the field getter and setter methods they are attached to.
 ///
 /// Putting a `+` before the address of the register makes it relative to a base: the `read` and
-/// `write` methods take a `base` argument that is added to the specified address before access,
-/// and `try_read` and `try_write` methods are also created, allowing access with offsets unknown
-/// at compile-time:
+/// `write` methods take a `base` argument that is added to the specified address before access:
 ///
 /// ```no_run
 /// register!(CPU_CTL @ +0x0000010, "CPU core control" {
@@ -386,40 +384,6 @@ pub(crate) fn alter<const SIZE: usize, T, F>(
                 let reg = f(Self::read(io, base));
                 reg.write(io, base);
             }
-
-            #[inline]
-            pub(crate) fn try_read<const SIZE: usize, T>(
-                io: &T,
-                base: usize,
-            ) -> ::kernel::error::Result<Self> where
-                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-            {
-                io.try_read32(base + $offset).map(Self)
-            }
-
-            #[inline]
-            pub(crate) fn try_write<const SIZE: usize, T>(
-                self,
-                io: &T,
-                base: usize,
-            ) -> ::kernel::error::Result<()> where
-                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-            {
-                io.try_write32(self.0, base + $offset)
-            }
-
-            #[inline]
-            pub(crate) fn try_alter<const SIZE: usize, T, F>(
-                io: &T,
-                base: usize,
-                f: F,
-            ) -> ::kernel::error::Result<()> where
-                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                F: ::core::ops::FnOnce(Self) -> Self,
-            {
-                let reg = f(Self::try_read(io, base)?);
-                reg.try_write(io, base)
-            }
         }
     };
 }

-- 
2.50.1

