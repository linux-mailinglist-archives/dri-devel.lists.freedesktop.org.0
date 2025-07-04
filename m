Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6FAAF895D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 09:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3890A10E960;
	Fri,  4 Jul 2025 07:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bSluTf6B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2077.outbound.protection.outlook.com [40.107.92.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F6410E95A;
 Fri,  4 Jul 2025 07:26:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=preBaQOBE48zIpSl0Pie7yfPcqetCKUoF6a2SMeOMCMyRiQle2sdvaRLJiA6MYd4aLzUcBIAnKHSYFfGrxOa+hFluWDnmXGhyL+eZNYuE7hkivniSIt5l41ZV0BrdWIQzU1iWyyDNIqolfgfW425Vry6+cEWKc3NUbrPybRMNVlfbY2CvzueOWqnOyRYTWy04wKGOXuQRcdKh9Gn8kd31pZpSarek9hEiZcV4sriXWlJEp7ACixG3kuqeJ0RaxjHVN9VSzm5tYL1pqSYu9fDKjP380dzNGcSgGv7hX+fn3hZlMbW48VoX8PP2NIdCu69A3qnZ9Xypojd2Tx5lI+HPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/3sWIUxlxAkLWbHtUo8FocrTd5OKRJZU/i5Kcb0UAhY=;
 b=LjKwgWN+VNJuakCnIwmjVU5BRlZAU6MqNTy0aF9Dspuw3TzI5Cnrp9bNx5q/CMvX6YZl+LeZy9CCO4TiChqERd02smnvDy+ZrmwT6TNCLufVy6QD25Sws55JpkFEdl3I/TI1cK1t/kGu6K+dfubflZkslZwJI8FixY+LpSt2ONp7jj+caPEdGWttL8co0WwkTvgIWNGNBPmwTjuWNb34CrqXuIKoggaUeJ50n4K+GjSzUzoc1+yfA6XRe+AJ0dTV0r/UNYPe7xUTMZtQOtPD5VvK21f8grFrENxnWeHTbsP+snA6/GFCEmwWDqSijs/xNoKaadiNk+1cWdapGH3WuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/3sWIUxlxAkLWbHtUo8FocrTd5OKRJZU/i5Kcb0UAhY=;
 b=bSluTf6BLd44jPA7nonBemLr6PLZzmcsHabtrdYFQbdUnsq2/tB1gaBXv6JcJ0N+37Aslzfif+XirSi4FcX7KDL9rA/4bPGeJXJuJotf1VraEfm0b/vIVY4H1RqV/hT4NyYSAPG5yOdtUkc3DwcIjo5R51YFPn7vIe8y4YJeoqTIDKdnygTfsa7cIV8dFocyolOmgggbMVjW6qdZlzo+h3gaRzRUHSMIy7+2IXVbSOX0UOsT5B9FfGPhoZkz0hzeHur+K6BhJDfR6hPBmklVrse5AeOR0ksoo/Lsf55BJhHeKu47UFYcx8+kr78xWB9NgrJSo+RKCYK3Zyeen32rCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB6341.namprd12.prod.outlook.com (2603:10b6:208:3c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 4 Jul
 2025 07:26:14 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 07:26:14 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 04 Jul 2025 16:25:16 +0900
Subject: [PATCH 15/18] gpu: nova-core: falcon: add distinct base address
 for PFALCON2
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-nova-regs-v1-15-f88d028781a4@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0282.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB6341:EE_
X-MS-Office365-Filtering-Correlation-Id: fab95165-73ea-4b8b-9795-08ddbacc0f10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OEtPQVJSVmw1UHROdHIrck9zNnFNTFMvLzFqbzVLK3ZlUWdIcTFpUWhEMmtF?=
 =?utf-8?B?Qk9FUVUzM0FnQkhCOVVkcERZQ3ZzSzJRbUhPNkkrR0N3ZHBKem4wWEZzUUJ3?=
 =?utf-8?B?Zms3c3BzMnVwTjdORXN1Sjdiek4veXMzZmhQQ0doZ0c4VXFjZjVYT1BQaTJU?=
 =?utf-8?B?RjUxRExKMVpNR242cWxIcWdsMkJlaGZNakg5NGdEeVlHNHhjbUNVNGFnWmdW?=
 =?utf-8?B?MWNIaGdFMW9Ud0lHaHptOXVScmZRajVEVGlHb0dWTmdTcURPVzFoeEc2Nml1?=
 =?utf-8?B?ajU3cEIwNi9YZE4wVXE2Y2U4OURQVkthTmhYUnhtWFNuZXNmMW90bms3NHJ2?=
 =?utf-8?B?Q3U0amJ5YnFCNXZsZ1hGcHkzKzQ5VkI2cGtITGVmVWhFQ1BDL3diRlAzVHJX?=
 =?utf-8?B?NzkvWlJFNm16N1FtRGNWdFlaTkFQOUdzaDUyVThQMWZxdDhNMkRzYXVDR3hH?=
 =?utf-8?B?MmhwT01rdEpBeHNvVmJqM3FIOFkvQ0VRRHAwNEcza2YrcG8ySHpDR1RQSEd3?=
 =?utf-8?B?Z2dObEFTOGo3VnBkQ01EZ2JyZ2phOHgva0x4aDZiY2d2dkdDamVKRGRMQ2Nk?=
 =?utf-8?B?RGQrbGFBcE9CNFY1U0N3Rk0zVStXVUlBRi9GditXa1RlUHI0K09ZVi9QSG4x?=
 =?utf-8?B?ZEFYVGRnN0xkcUZaUUdxVG5HdENEcmFteTMrdVVBV2RGZS9WRkdBaXhOdXpn?=
 =?utf-8?B?enNUbHdyNyttT3B3MXU5bG9MeVh2TWtoRm5aOE9lcC9TMmthMXF1emwwcUhj?=
 =?utf-8?B?bERyTXVVeUhjL2tVSy9keDM2WDhWQTFrZlNWNkNJSWlySDRwMSt0WnRIRWNx?=
 =?utf-8?B?ZENuZTJaOWUvMFNwR2o0UXRtUGhQWHVxWXppc25jVWhuaUFURElYeVk4bFM0?=
 =?utf-8?B?ZFR5OWNmZldxdDFlUCtlczN5Rk91YUUwYmNWZGkvQjBXWGJXK0ZnbWxIUkRq?=
 =?utf-8?B?U0R0R05jQloxb05VNEU0N3h2M3RNSklYQkt0alJjQm5uM045YUdZSDZYbEtt?=
 =?utf-8?B?VENobm9EelZGcnh5dmxYLzA3Tzd2emt1algzZVhkWElSdlBkSm9aRWNjeHhC?=
 =?utf-8?B?K1hSdVRKaHZjS2Z5Smx6UCtGVnladUFiYnRYbUhiL0hzdkliYkxvTTRKNFdW?=
 =?utf-8?B?ZzJKMU1tK2lrRUp6RHdSeWpzUGxwTkRvcnZtdU9Xamw1Q09Lc0dIZGFQb25m?=
 =?utf-8?B?QUV5ZEpQazhMb3JXK1g3L1Q1REd2UmlPV29EWnp0T2dVaElMQWZQTktkUEFX?=
 =?utf-8?B?b3l6dUZXU0xaYVhDSThVY1pmM25GQytiUUF4VXhZR0pKazN3YktndWhscTA5?=
 =?utf-8?B?RmlVN2JDVUlNbHFialUrczhYUlNyRkZLczRraDZORU9aS1FkSGUrc01FV05B?=
 =?utf-8?B?ZURURUVYVFdNNnNCV0tQc3Vic1M0UzJVeUJ2bDc2cis4OE5nSUZlWUFOclEw?=
 =?utf-8?B?dFNxcWJDdnVxVjl6OUhSU3UrcXAzRXlzbGJBeTV2eWZkY3hUWGhlRmx3aGpo?=
 =?utf-8?B?N3NsdGFMZ1Z6bDN2elp1Ym4xUjJ6eHZXQ3c5dUcwKzJLY0VMdC9lMENlSDVS?=
 =?utf-8?B?UkJxUURKQkxqL1ZKc21tSjlPZGNuTzk5Z0xKOXQ5UXU1dEsxQWgvcXpCL3U3?=
 =?utf-8?B?WWRZUTVsYWc2WFUrOEk4TmZLRHJmSkRpUllTb0VBOTV3bnI5ODhiOU1HZDJX?=
 =?utf-8?B?V0tyUU5IOHBTcjFYZ2ZkeXNuRzFpMGFYNHlhOURrY2wvRmJ3Wk40Q1BNamNv?=
 =?utf-8?B?VDZxVzRhWklObCsvV0RJK254Y2Q4cmErbU9Kci9EemVlRWwxQWhwaGVSRStn?=
 =?utf-8?B?Vkpaa1lpU291cnBEZWpYa1dJOE1WdlZHcmJTQVRyc2o3UEVkV1VHR3hUTVRB?=
 =?utf-8?B?bEdlamdFZlRON1J4UGV2MTlqNkNzeTJWRVNTY0c1MHR0WGVaQWNXb1owN3ZE?=
 =?utf-8?Q?K779otemohA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHVsNHZEUHJHYm9iczdDdWcwYWtvVVhzOG5ZN2dNUWppbWVaZWZTL01TWTUy?=
 =?utf-8?B?TzdiWU9penFjRUxZWFppYXk3d01EVXczQWVqYlN4Z0k5c0tBNjFOM3lqOHB6?=
 =?utf-8?B?Z2t3alJBQ3VJRmd6d01saXl6enVETFJIZEpKdWorWEI2ckMvQkRvQklIVnVt?=
 =?utf-8?B?eXVMd3l0OUxrUGJJdFFwZ0M5SVpueC9GZmlNMEV6ZFF0eW5yK1VVOXBBem5V?=
 =?utf-8?B?YVJWNFByU2UzcENORGlUL2t6eUs0K0oyWkc5Y3RmZ3J1NmVrRG5UcFRIL3VR?=
 =?utf-8?B?Y2ZhNXZYa2xZQkl1S1pNR0hEdExOeUxsNEwrK0ZlRWxZMEtjNlhqbVBLRDdw?=
 =?utf-8?B?a1hxTCt5MVoySGxkNmhZTWZLanNzd3dqRlhlckxubUZsRWlyVnRmYkxpSExq?=
 =?utf-8?B?cm1jTEw3dFBCR01CNHBMeTV4NHB3WVp2Z2hvVFc5WVNWVmlJNEMvTkxST0pz?=
 =?utf-8?B?aHhscVZPR1JOc1FTWTJmMHRVK1gzbkJSYyt0dXR2ZnNHa3JaeXpJRWRXWFp4?=
 =?utf-8?B?MGlmdnl0UHJPSlBXSkp1Z1IreVFJUDZmSzN6YUQ3VElicXRNYzdRYjRyNG9s?=
 =?utf-8?B?TFVoaTRDZzR6UHRFNUEyTVNmWHlrdU14RHYzTXRXbWoxREVpWnpvSDBTSFgy?=
 =?utf-8?B?dnRFY2czNXVoWHZRWmxZbll6cWxibUFzSjE3VCthYkVrSVZBUDZCUVdsU2Na?=
 =?utf-8?B?bGJWT2ZnOEZac3BIRmNDMnJ0aEQ1MTJQNzNWajBjSzZIeW5OL3JzWnZxZjZ4?=
 =?utf-8?B?NTRpUDRoWGJiTE5TUXc2dFFDb1F1cGlVcy9uc1B6ZFZMVHNWa21QQUp3TU9C?=
 =?utf-8?B?MVY1cW93eVYramRkNnlVb3BDSVhyNURiTlMxOWd5ODdxUktjanlub291K1pG?=
 =?utf-8?B?eDMyWXRkM0lUVDdKSVROcGhnNjNwYXdkUVlxV0VvY1lrRGtrZStXZ3lNUUIx?=
 =?utf-8?B?QWVzbkZxZU5NUVN2ZG9QMFQ2RGpPQjJ1b1docGtBMFZReDU1dU1CQ1dVdU9p?=
 =?utf-8?B?ZDd6UlkwUzRVL0NhMnJYS0xkMG9DUTgvQitlanVyUWR4Z0xzOHJud05zMTRB?=
 =?utf-8?B?cHVHOEFUQUg4YUN3bjZPYUhQZngwbVNRMkhGbjhSWk5oczJaVm96ejlmUTVi?=
 =?utf-8?B?UTNSRVM4dmlJV3YwQlNwbmNiVkIzbVpBZXNIZFVJeng1bXVXd0NBK2F3QzZh?=
 =?utf-8?B?UDF3KzZZbWNpN2dRSm9na2dqVVFXdm5URlJnb2xzQ1JFVTRWa1hTOW1ka2ox?=
 =?utf-8?B?SU8vMkFiSU0xNTFFM3Qvcm5oQlRxTGtnQUUwaUI5dHg4VklSQ1ViRUIvenBr?=
 =?utf-8?B?U3BCT0ZYN2pwZ093T0h6MnVtWFdOQVlOcnYwWTlhdm4xQTI1Q2t1UGl4dlpp?=
 =?utf-8?B?WlBubUFhdlNVb0crT2V6N0Z2V3BvSlFLelo5a3ZMQWdwd3BEV0NNY3dFQVMw?=
 =?utf-8?B?aXg4WFhkOVlpOG80OFhCNkpib0VudURwUUpHaGtiWWNES1o4WkZXdGhlTkl6?=
 =?utf-8?B?bytWcXI1bytRdkNhRlU0T2ZnSXlkV2pDVEtYbXVhdTNoNEVEUENySGJieDJK?=
 =?utf-8?B?TmM0cDVTajczQmRyV1d6aS9Yd0JYTnlUeC9xWkxac1lZSjcxU3ZldHhWditr?=
 =?utf-8?B?QmFJWlA3MUhEUEhJQ0xQb2F3emdhUkNGWm8wVGJrZmp5Y1FONW1CL2l6RC8w?=
 =?utf-8?B?U21Jc0xLd0ZSNVN2ZWxmd2JnNkR3SDBpMW1SZjY0ZHV6RmhabHdCckpNRGxC?=
 =?utf-8?B?bk5ZaFhCK3NLdFJBV1VrSkVpVG5acWlpemt0Q1JpYTk4U0wybEFFS2FreWUy?=
 =?utf-8?B?TGY0Q2JnK1FXZldpS2x6UUpyRW95VFRlVUtpWU9iSEt1N0V2QkVlVUtRWUd4?=
 =?utf-8?B?d25YZC90YkNMN2YxYW9YcWNMMWdlL0MzbjdMS2RYY1l3Z0RkNnpTZ2RqMkhu?=
 =?utf-8?B?NVNucUJod0NUL2hUdklpNzRSd3ZzbXM1QXFBWGRoZXpqU2hlVUpRR3p1S2xt?=
 =?utf-8?B?UmVMRTIrSUxRdVdJR2Faazk1cTlVaWNZb0ExcElFYmZZMGZ4Ym9QVUhZUEJO?=
 =?utf-8?B?cnBJQ00xNDZqZ1ZwblQ3aFFSTkxzS3VyWnh4RTlncWhDb3J0bnRJc2FnOCs0?=
 =?utf-8?B?ZWV6a3RRREtsVjlBT3BOQ0FLWWV2K2ZNcjlCTlUvVld4azVoanoxc0o4MGlM?=
 =?utf-8?Q?qiVphBr8nGl4MN0vmK0bz/FxeJMCCBJ3YcwYrzGo4gvG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fab95165-73ea-4b8b-9795-08ddbacc0f10
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 07:26:14.6606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mZcxWme3ikC37CcVKiij4yCwKU44nSR+27wf25oHyqrhzO4JyY7E0T8f8Lj0WQOgdAVff/omA70PC8SFvicvVw==
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

Falcon engines have two distinct register bases: `PFALCON` and
`PFALCON2`. So far we assumed that `PFALCON2` was located at `PFALCON +
0x1000` because that is the case of most engines, but there are
exceptions (NVDEC uses `0x1c00`).

Fix this shortcoming by leveraging the redesigned relative registers
definitions to assign a distinct `PFalcon2Base` base address to each
falcon engine.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs      |  7 ++++++-
 drivers/gpu/nova-core/falcon/gsp.rs  |  6 +++++-
 drivers/gpu/nova-core/falcon/sec2.rs |  6 +++++-
 drivers/gpu/nova-core/regs.rs        | 12 +++++++-----
 4 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 66400d07d186938735f705c116d7c7df5fb77fca..23a4ff591c8db8d4600ec43dfaa42233cbf65c0e 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -263,11 +263,16 @@ fn from(value: bool) -> Self {
 /// Type used to represent the `PFALCON` registers address base for a given falcon engine.
 pub(crate) struct PFalconBase(());
 
+/// Type used to represent the `PFALCON2` registers address base for a given falcon engine.
+pub(crate) struct PFalcon2Base(());
+
 /// Trait defining the parameters of a given Falcon engine.
 ///
 /// Each engine provides one base for `PFALCON` and `PFALCON2` registers. The `ID` constant is used
 /// to identify a given Falcon instance with register I/O methods.
-pub(crate) trait FalconEngine: Sync + RegisterBase<PFalconBase> + Sized {
+pub(crate) trait FalconEngine:
+    Sync + RegisterBase<PFalconBase> + RegisterBase<PFalcon2Base> + Sized
+{
     /// Singleton of the engine, used to identify it with register I/O methods.
     const ID: Self;
 }
diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/falcon/gsp.rs
index 0db9f94036a6a7ced5a461aec2cff2ce246a5e0e..f17599cb49fa1e5077a554dc14b3715aa62a4ebd 100644
--- a/drivers/gpu/nova-core/falcon/gsp.rs
+++ b/drivers/gpu/nova-core/falcon/gsp.rs
@@ -2,7 +2,7 @@
 
 use crate::{
     driver::Bar0,
-    falcon::{Falcon, FalconEngine, PFalconBase},
+    falcon::{Falcon, FalconEngine, PFalcon2Base, PFalconBase},
     regs::{self, macros::RegisterBase},
 };
 
@@ -13,6 +13,10 @@ impl RegisterBase<PFalconBase> for Gsp {
     const BASE: usize = 0x00110000;
 }
 
+impl RegisterBase<PFalcon2Base> for Gsp {
+    const BASE: usize = 0x00111000;
+}
+
 impl FalconEngine for Gsp {
     const ID: Self = Gsp(());
 }
diff --git a/drivers/gpu/nova-core/falcon/sec2.rs b/drivers/gpu/nova-core/falcon/sec2.rs
index dbc486a712ffce30efa3a4264b0757974962302e..815786c8480db6cb74541d7ab574112baeb816fe 100644
--- a/drivers/gpu/nova-core/falcon/sec2.rs
+++ b/drivers/gpu/nova-core/falcon/sec2.rs
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use crate::falcon::{FalconEngine, PFalconBase};
+use crate::falcon::{FalconEngine, PFalcon2Base, PFalconBase};
 use crate::regs::macros::RegisterBase;
 
 /// Type specifying the `Sec2` falcon engine. Cannot be instantiated.
@@ -10,6 +10,10 @@ impl RegisterBase<PFalconBase> for Sec2 {
     const BASE: usize = 0x00840000;
 }
 
+impl RegisterBase<PFalcon2Base> for Sec2 {
+    const BASE: usize = 0x00841000;
+}
+
 impl FalconEngine for Sec2 {
     const ID: Self = Sec2(());
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 4e047fc4947b6dc09dbd34e26eeda1ff14dff4ad..e6382c116adf699ab24de097c15ddca08017b36d 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -9,7 +9,7 @@
 
 use crate::falcon::{
     DmaTrfCmdSize, FalconCoreRev, FalconCoreRevSubversion, FalconFbifMemType, FalconFbifTarget,
-    FalconModSelAlgo, FalconSecurityModel, PFalconBase, PeregrineCoreSelect,
+    FalconModSelAlgo, FalconSecurityModel, PFalcon2Base, PFalconBase, PeregrineCoreSelect,
 };
 use crate::gpu::{Architecture, Chipset};
 use kernel::prelude::*;
@@ -282,20 +282,22 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
     7:7     allow_phys_no_ctx as bool;
 });
 
-register!(NV_PFALCON2_FALCON_MOD_SEL @ PFalconBase[0x00001180] {
+/* PFALCON2 */
+
+register!(NV_PFALCON2_FALCON_MOD_SEL @ PFalcon2Base[0x00000180] {
     7:0     algo as u8 ?=> FalconModSelAlgo;
 });
 
-register!(NV_PFALCON2_FALCON_BROM_CURR_UCODE_ID @ PFalconBase[0x00001198] {
+register!(NV_PFALCON2_FALCON_BROM_CURR_UCODE_ID @ PFalcon2Base[0x00000198] {
     7:0    ucode_id as u8;
 });
 
-register!(NV_PFALCON2_FALCON_BROM_ENGIDMASK @ PFalconBase[0x0000119c] {
+register!(NV_PFALCON2_FALCON_BROM_ENGIDMASK @ PFalcon2Base[0x0000019c] {
     31:0    value as u32;
 });
 
 // TODO[REGA]: this is an array of registers.
-register!(NV_PFALCON2_FALCON_BROM_PARAADDR @ PFalconBase[0x00001210] {
+register!(NV_PFALCON2_FALCON_BROM_PARAADDR @ PFalcon2Base[0x00000210] {
     31:0    value as u32;
 });
 

-- 
2.50.0

