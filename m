Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CC5AF8963
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 09:26:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 163F410E965;
	Fri,  4 Jul 2025 07:26:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bkOxdsOl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B8C210E969;
 Fri,  4 Jul 2025 07:26:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s2ZSdyygO0RZxgaIQD52Z76UJADCs0zMSgm7X8uLZg88WD4VX9l1GTjnEtba2oCSj3PzX8kUuWcNNpZOeK69rLe23oDRpS1KldMICSBIjQ6MKDjSG3YwFZNv6RyPpEfVquDkT8cNOxzhzE0+QMs9N+Qu3wTi6kdN7vuZVcuxXiLJiApJHddEMjyDzfEXqx/eo5TRqdmncHwZqQSQz/a/BkVkYvTzxbxIsH3NjWl8abnPw6ahuxI2UbJ/322q1sqk2F8YOfvh9v9E1qIDSlL8aeUqjwSRnAHKegltOek27acsZDLWlgXx70DSJOwRwmBM/1udhFWwlHkFLH2j8cM0Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6RvgtaT8sUtDZtck6reYag8oqpCc5NLpQ/QqXfkYYU=;
 b=dmaaTZ0GKP5NitLtGjMl8IhRXMpnu1GgM+OYu9m9tNKNGdrPZWgwIYW7bABaZ4b1RG6GIr+p1hTvpV6CXjXFoTYuWj+cPXRb9AK5rh76qvu8hOJS+3hSUet0F4tbPbmjWgJZCAmFEEcDj2u0GFHM+ypimxQ5vTNCTJgNcIwz9fKo0NiS9xPXWR7A7XlZuFNt/UlCBbsoXq99u5A/Zv6SQOK1RS/g9bR+DXzTSIVgZnTIZNtwNOI9XWGWzqlLrTSd8X89LVeveHsXmqGKaeiRXOyremNyoENSoXp1DUAWtQWAcDzlc46qc7SYu+arcS+7NSTnwLkkzkStC26elf0f4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6RvgtaT8sUtDZtck6reYag8oqpCc5NLpQ/QqXfkYYU=;
 b=bkOxdsOlvaz01skIe2l8qyoTl1JHKEz51PxDqsSdKJwtsjZVZLTYt7YWexoKIEeiznolRDPKnAugpTcVtmSeNBdzNkifJQ8Ah6r2IzyeaDE+sVul4mlYqcNn6PjP8RL6crbuvbSNHLgHxL0v3dXi/VVUmhOqof07XU83j20NWg4eilvnwgncAhdWNINSXa7QdgbGlSBwKIWwFxF6/5kf9VC0dbmBc+NBMCk8/cGUBdd1Zxm58NE2W2TKR3dcIRoJ6/JSbz6FAGn05F76VnxB3k3vKXm6S06VOOJPelkNKB0TJBXb6MyHwdUCdWO1WkgKxPKZ5B2uznlm63cVXkDfRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB6341.namprd12.prod.outlook.com (2603:10b6:208:3c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 4 Jul
 2025 07:26:21 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 07:26:21 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 04 Jul 2025 16:25:18 +0900
Subject: [PATCH 17/18] gpu: nova-core: falcon: use register arrays for FUSE
 registers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-nova-regs-v1-17-f88d028781a4@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0037.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB6341:EE_
X-MS-Office365-Filtering-Correlation-Id: 48fec38c-36ec-4854-58c9-08ddbacc12fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEk4aldRMWNLREQ1ako5clpBbmhBVW1nMHFVRHUzSHZRci90eEc4MUhmZXhR?=
 =?utf-8?B?TjhGN3RhbTZUajg3cmFrNEs0cEk3QlRCcytlR3JEdDFDNmVpLzB4Vjh6OUpB?=
 =?utf-8?B?QmsweG9zUjFsNjluemVSOFRzZVBERXA3dFY2SUQwOUkyRUZsODAwMFVWQW0x?=
 =?utf-8?B?SUpMQllJTWg4WTRVL1R5dU44UjRrTjFrUVlLVDhqdDNORStDdlFMSlpWTnNt?=
 =?utf-8?B?VWU2TjJLT2dhd1k3WWh2S0lYK0orZTdvVEpkTGZKdVVmK2diUjhyT29iTGZw?=
 =?utf-8?B?bTBjWEFQU3R1NlczZHIwV2d0Tk9ueFVsRitUK0dMc2lvd2xmS1l0Skh6dFZr?=
 =?utf-8?B?SEh0QTdwYkFrdVR5RW1teXhyT1p2ZDFhSEh4TElKbWVpcms4cGtFY0ZQYWpL?=
 =?utf-8?B?MGNwREJwVDlMcUkweWRzVUlMQjRvdEN2NGltc3BaaGRDRitRaWpwbzYyM1NY?=
 =?utf-8?B?SXRBWlZIYzR4UUp0NFpMZHhYUVJ5R3NHUE9HZExTMVZJYjdMQXF0TWZWeVNB?=
 =?utf-8?B?TzhKUlpxWFpUQXUwOURQT25OQW83SUowR2kzQnJESG0wYnRldHJwVUlpdU4x?=
 =?utf-8?B?dnc0UHNIVkRtdS83Y050MHlOalJ6b2dBZFM0aWlaRVNRbHV1c0krY2IxWXRV?=
 =?utf-8?B?akZCbG9mcXFpeXVEM1lFVjQ2eXRpUEhOUnowc2xsUzhHVnlHL0dVNUYrOXRF?=
 =?utf-8?B?cWpobnlnbFdEb3ByOXNlNFZzUHkwaDd5OHpwRURjSEpIUGtlam82eHpZREYw?=
 =?utf-8?B?a25UY0tjVDA3K2o0NGlRRTNVVTlrVGo1NElVdVJWVHk5UFVlTVFGL09NcW5u?=
 =?utf-8?B?cm1LQzZrSlpIVGFWWE5Ba3NFa1ltYWQ3WGRGVk00THpDRHA2Mm9aWFVrWE1o?=
 =?utf-8?B?NTNYRjNIU2R1ZGsrZUxZU2hKUXZjUFVUcXRaRWdMbkVLYUUwWEN2Y2hkQlpw?=
 =?utf-8?B?YXBpUG8zWXUyd2Z5NnZFbzRod0RuNTFHQlRPVUcyenNVaFA1anptUVVXWDJF?=
 =?utf-8?B?aWJ2dTdZL3hzc0RXTmZUdXIyaUlwOXg4aTk4aXhKZnJiNVUyU0dZNGRsdHRR?=
 =?utf-8?B?N2JMZEdrbGZmbVgrYnA1eklWcjJaLzlPVG9yK3lKUUJmdS9NVkVXOEVaQmFw?=
 =?utf-8?B?N0lyTU5LSWl6WHRvWHZIei8rQVlFRm1wcDIvY085L0VRR3RhWFF4Y21CZnBK?=
 =?utf-8?B?Y1M0N1YzV2ZuNWhYUHI1SFNCNVorci9VNHFQcmpnWUQrS0UyYVdTK2NtdnAv?=
 =?utf-8?B?SkJEemFCU05hY2k0TjhDZnUvMk5NaExzbEVKZWpJSTlOeGs5V1F3TXp1MUlx?=
 =?utf-8?B?WHFoWUxKU0RxSW9SZUw3aG1jN2JkZWhaMG5BcTVDeU84enVmUlkrQmJkTG44?=
 =?utf-8?B?WGtrdFB5bzRoRTZFUDBMbFFzMG95aEhlVXUzdTJYYVFXYVZvaWFwL2NtM0Ju?=
 =?utf-8?B?RWhiQ3VpN3ZsRzViVUdHa2pXVWNBWmNSQzRzbTVuZG1nOCtPWmdzR29mKzFQ?=
 =?utf-8?B?REh4UytnYzlXY0N6cVNJcWlyR01EaFFUVE1FTzBFSzFiemJybFBZWTl6SWhR?=
 =?utf-8?B?SUNSYWNtZE8xa3RPTjcxWTJGTERkNjRqNTNicUhiVFlOQTAxZzJCRG5Ob3A2?=
 =?utf-8?B?M1lMUi9ZNlVCTUFZdHU1bE91NkJyckNJMGJOc2cvcko4alNKVkdSMXBxLzBP?=
 =?utf-8?B?SWwvN25LMVJUQkYvT0Y0LzF6WWIrdzdTME9aanAwU09aY0NyaDI1aU5FMGRR?=
 =?utf-8?B?dlAvL000bHZOWnhEZU1hZ0pXYTMwd1VwbmFhY3orQ1VqcldpSnNsUWppQk4r?=
 =?utf-8?B?MEFMZk9VWUpHaFZRU3VlTlFIQ0dxSWpPMjU5cWZ2Vzc4Mm5mR1VFVTFBWWRI?=
 =?utf-8?B?a1BBRS83cmlmRDY5T0pRUFFBWFZ4eUZvSzJHZHlUOEFlME1KbnVYcFBNNkl6?=
 =?utf-8?Q?nHA8VR8a8V8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emtiMUFjZ2VTV1RhS3JuUkRCb2lqY0dHaFdCaklYOXlYOE40dDFBYmtTVUVo?=
 =?utf-8?B?WGlOaGtncUdQdnAySGhscjZTK0lZVlJZaWNSVWw0TytCbzJKL2w2SWRsdUt2?=
 =?utf-8?B?S3BYbFV6OGNpdDc0aHovOThkUndqVTdzWEFhek5aQ2xkRWhLZk5VdUJZdzhX?=
 =?utf-8?B?eXNTc1V2eVkvcmNqVVRORmhydW0vbzhrVnNUc0RCYStIQ2libGJPTjQvYjFp?=
 =?utf-8?B?YmgzUVpqSExGTTZLQ2hvNVh1SERQbFp5Z3pOSkhXclByVVluYVV6VnlHNnRM?=
 =?utf-8?B?ZEdWREdWVzhOaWlPZ29pei9kcGZmRWZwQUNScHhxVUN0TVFGamNxYnFONFRI?=
 =?utf-8?B?a3Z5d1RjbVpqc1RGakZEdElLWUx5c3cwbEFONUR3NW05alkwY0NaVXA4SVMy?=
 =?utf-8?B?ZHdOTWdDY1lSeTBmUE53LzFZQU1pTjBWYWl1aHpnNnR0TWVXT1czNjFGQzdE?=
 =?utf-8?B?dEpHdXpIMC96Yzl4YmJJcmZxVTFMcjFtR09RbU1IeUlTMndkdU52MEF2UW5a?=
 =?utf-8?B?NUhWNEwzU3BWc3B5aXpyTHU1b29oY3hNR2pmazJPL0VWc3YrS2phaERWSjZv?=
 =?utf-8?B?RTBIRjFaZUlUQ0lVbEl5RTdWT3ptVGlXbmVLRnFsejVPNkFNWWFXd2F3VXV6?=
 =?utf-8?B?dkRodUgxZXpvNkd3REJ0b1h1RkZ1VDh5MUdHb1AxYTlpS3I4VHQ4RU91aXlS?=
 =?utf-8?B?MGxXb2w0Q0JKM016K0RTNGlGS3pmMC9HZ0FWTldkZE04UHM3RDkvRWFzT05w?=
 =?utf-8?B?REw1cytxeDV3b3VNUHdENG5CVDFocVRoNVRlRXJRQ2ZuZlg2RU9kRUh1elpP?=
 =?utf-8?B?TCtJNmpaaGJUdUJFYkp0N1VZU0UrMGQ3VmVaZzY1NFhpTG0xYmp2MUprQnZT?=
 =?utf-8?B?K2hERlpoT3REYi9mczM2bG94NkxzODFMK3ZWNWRhMlNXR0hhbzVwUVhER05N?=
 =?utf-8?B?dnFTQ2NHcnF5ZEJQVXJDNm1vUWwwZzRJeUJMUmVXcDNqM1dRV0QyYnRFMGJL?=
 =?utf-8?B?U0xJUkduaXZ1eHVzT0ZSQnRDSUtxSUxkNFFsOFB6MC9qSUR5eVhUR2t1b2w2?=
 =?utf-8?B?RzBaNTYyTDJPZDl5UXd4dm5JWUttSDE2NGlpeGlzMVhRWXRwaEh6c0RQeHV0?=
 =?utf-8?B?dFpYZEFuY1RkM2ROMGpCeGR4MkJpVjJCUE9zbTZtL3RpMWZ4R0lFZ0grZVZM?=
 =?utf-8?B?azdOQUNDNUprckRERDNyNFdZOTFkbUpRNHdWQnY5T0psVXB3MXMrNTMrd3Fp?=
 =?utf-8?B?aFFjV3BjelBENCs5b2xGVzZCbWJ2bjZ5cmJJeERYbVhGM1JPU3VjUkxMVEph?=
 =?utf-8?B?dm5KRlZ4VlI5MkFQY1d4MkM0VEd1eDFUZ09pMzRvOXhRRk16NmtTeTgwOFdK?=
 =?utf-8?B?R0pOdENXM3VacTdBNVZ4QVk2N0FkbVZ4WXRVOWIxOHgxVzB5bHk0d1FabnRZ?=
 =?utf-8?B?MDFWM3VlZk9CZm9IWWpyQ2JCRzUvNmlud0RzeWxraU5TanlMMmtaVFpuWnhR?=
 =?utf-8?B?eHFPMG5ybWVBd3JMTUQxWTRyZzhXRGFWd1hWaW45bGdkQUNkTGVreDU2dlhM?=
 =?utf-8?B?a3lvSlcwd0p2WGhJUG02dWxsUEwyL0dXZ1J5MnZxYXJmQ2hGRnVxSEZ0U05t?=
 =?utf-8?B?NmVrL1ZhVDlGNi8xUitBWEQ0c0ZuRVY3U25DZk1TSGpmUGJmWG5LaXIxRk8w?=
 =?utf-8?B?STF4bTlZaHl0QWw3b3dsTllpWjNRMjh2aUN1UEZodjNsVjRqelB1RVBTNW1z?=
 =?utf-8?B?SHlRMzUzbi9LZ0MwcWljV2d5Zk9CREo4UjEyZzBmZVZSbzNpTUZZM08rNjFv?=
 =?utf-8?B?MVJEVHJ5eURNeWdQRnpMTGx5YW4yTXpka0Y3eFhNb0U3RWJHWjExM2VMWW55?=
 =?utf-8?B?YmFqZTJ6VHVpT0tkL3JrMnBVY09CWmlZUzVaekg0NFV1YlN3end0dlVlbjZM?=
 =?utf-8?B?RGVUb3dsak1NNG40TEJYak9ZODJlRXFRYnBmZUhqdDk1OEpudkk0TU1oNWF6?=
 =?utf-8?B?SC9vbFVMVm84MzVaYnozVmNoWEVYVExTUVNMQ1FYL2FtOEhmeWFPMlRsa1hG?=
 =?utf-8?B?cnVuTGdpWE9xZEUvb1NWdklHOEdGTTJyOXU3OWpEZ3VKL0prWVJwWXVPMndS?=
 =?utf-8?B?UEU4bS95ZmpGdW02OXZPMVJrZWdFYTdsdXpYeTMrV2xjTXlYY1JUZjIrNmNB?=
 =?utf-8?Q?5Xfs8IVJqrqKWSAY9KhRwBwgtPRnfMwVfTQJ+hwIhH47?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48fec38c-36ec-4854-58c9-08ddbacc12fd
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 07:26:21.3510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rb6s2LOg5gdcaX7nHYoSvPr9GmbJ/YNdVvdf1tEAYWioBzDWdjk0ADqBmOMKMVvjXOqad5xCm9gvfvy7NiZGjA==
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

FUSE registers are an array of 16 consecutive registers. Use the
newly available register array feature to define them properly and
improve the code using them.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal/ga102.rs | 33 ++++++++++++++-----------------
 drivers/gpu/nova-core/regs.rs             |  8 +++++---
 2 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
index 3fdacd19322dd122eb00e245de4be8d1edd61a5f..13c945fd6d6b7b1acbb466678af0bf18da506265 100644
--- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -42,35 +42,32 @@ fn signature_reg_fuse_version_ga102(
     engine_id_mask: u16,
     ucode_id: u8,
 ) -> Result<u32> {
-    // TODO[REGA]: The ucode fuse versions are contained in the
-    // FUSE_OPT_FPF_<ENGINE>_UCODE<X>_VERSION registers, which are an array. Our register
-    // definition macros do not allow us to manage them properly, so we need to hardcode their
-    // addresses for now. Clean this up once we support register arrays.
+    const NV_FUSE_OPT_FPF_SIZE: u8 = regs::NV_FUSE_OPT_FPF_SIZE as u8;
 
     // Each engine has 16 ucode version registers numbered from 1 to 16.
-    if ucode_id == 0 || ucode_id > 16 {
-        dev_err!(dev, "invalid ucode id {:#x}", ucode_id);
-        return Err(EINVAL);
-    }
+    let ucode_idx = match ucode_id {
+        1..=NV_FUSE_OPT_FPF_SIZE => (ucode_id - 1) as usize,
+        _ => {
+            dev_err!(dev, "invalid ucode id {:#x}", ucode_id);
+            return Err(EINVAL);
+        }
+    };
 
-    // Base address of the FUSE registers array corresponding to the engine.
-    let reg_fuse_base = if engine_id_mask & 0x0001 != 0 {
-        regs::NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION::OFFSET
+    // `ucode_idx` is guaranteed to be in the range [0..15], making the `read` calls provable valid
+    // at build-time.
+    let reg_fuse_version = if engine_id_mask & 0x0001 != 0 {
+        regs::NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION::read(bar, ucode_idx).data()
     } else if engine_id_mask & 0x0004 != 0 {
-        regs::NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION::OFFSET
+        regs::NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION::read(bar, ucode_idx).data()
     } else if engine_id_mask & 0x0400 != 0 {
-        regs::NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION::OFFSET
+        regs::NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION::read(bar, ucode_idx).data()
     } else {
         dev_err!(dev, "unexpected engine_id_mask {:#x}", engine_id_mask);
         return Err(EINVAL);
     };
 
-    // Read `reg_fuse_base[ucode_id - 1]`.
-    let reg_fuse_version =
-        bar.read32(reg_fuse_base + ((ucode_id - 1) as usize * core::mem::size_of::<u32>()));
-
     // TODO[NUMM]: replace with `last_set_bit` once it lands.
-    Ok(u32::BITS - reg_fuse_version.leading_zeros())
+    Ok(u16::BITS - reg_fuse_version.leading_zeros())
 }
 
 fn program_brom_ga102<E: FalconEngine>(bar: &Bar0, params: &FalconBromParams) -> Result {
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 95b2c0d6b88f3b04af96f07c055c539870649937..5156ab1910501e86b4391a34549817d2e7818e07 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -168,15 +168,17 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
 
 /* FUSE */
 
-register!(NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION @ 0x00824100 {
+pub(crate) const NV_FUSE_OPT_FPF_SIZE: usize = 16;
+
+register!(NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION @ 0x00824100[NV_FUSE_OPT_FPF_SIZE] {
     15:0    data as u16;
 });
 
-register!(NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION @ 0x00824140 {
+register!(NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION @ 0x00824140[NV_FUSE_OPT_FPF_SIZE] {
     15:0    data as u16;
 });
 
-register!(NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION @ 0x008241c0 {
+register!(NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION @ 0x008241c0[NV_FUSE_OPT_FPF_SIZE] {
     15:0    data as u16;
 });
 

-- 
2.50.0

