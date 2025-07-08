Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3DCAFC330
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 08:50:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A17F10E594;
	Tue,  8 Jul 2025 06:50:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DUxTheHg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC5F10E594;
 Tue,  8 Jul 2025 06:50:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RUdi61BIRXE9UQltDqzpU8m2g0CQjKgPCxjAVKrNHgqWxgXiz3O2e/bHf+BJOpz3UeNiWjtTFew9W7NYAehfSV9UKhmWkrZwc9VtJ5m4h3VX/ZQECe2xu/RfOfkAuNPy/z5Z70MFyQCUB6h0j9LMc+xBKP1rACa2slkCmxzHj4/lY4h9n6Ymp09LXcivK4iAtTbw3y66RcJafnmDwi/7mWNmUpE1zjOV6oufQS98hFMr6STFjXGGT+n4DcwoPymE/nbJk6VDwjvWayUMe7NqZBbuCvqJ+WOXKMWeFo7k2F8wBdfEtmRe3adMTNzD6/5XlOzJGkwEZsfpW8PGq3gOQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mTvELx4c6vuuzfnqD9OgoOzve2GCsN/3xoLflGF61Ls=;
 b=pyc2DA2mkwBRDmXASEMGX/bwv9hG7B2cCcO9HqCG2c7z4joSMybEoLOsnlvAUQl0kKgeCjEte84VCMwpyWSuVAsYHWBnGZTuFrVoHPBsixkY6w8uLwG9TPFdJQtVV+Y7EIHsPDVLRJ5mFJFzbl3RGVx60qhyjhZQujIBZKgC47Yb+vpanQBHqH7S+pClWczO7igHbhU2PyBm6DhTq1l8qrOvkDFHnVHCW8lFxSewFRnP998g+OwmviTCZnI1u6FBusCkYT0F6BS/n/ehoFvbhwqRQ+MrYNTNvuYKVYVNL0rwP+N5A7G17HtkbNUvlbA5yizDysd1riLc6x2u9qfxxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTvELx4c6vuuzfnqD9OgoOzve2GCsN/3xoLflGF61Ls=;
 b=DUxTheHgKRMcxLsZUaRFyIuHVF7q2mshddoHz354PW6i0svJWdvx1pAHedpjk8QswwIhY3MBJTmXkBVB7rPIsyq2J5Cdj7Qmu5EruPNf5mSaiipJOBsyTWnoe+T0u9O0M/0dlyAxa3+yJdiBEsB5iFcnv8gF+VYp9/qM9BO+tWj595e0S8HG2aUxmnDHB6Ryu8zn/2IbTpWzV8BccKWbE+FIIIKnExav1S5ZmqB7pLaT9ddsEp7mh55X26nL+ipwcaY5fgNqDsnxzeNUBjyRj+ENeDM7lQnQttWOP0r4RyFs77EjR20dyRPsoYYjVow222g9n+JuB/2/BqDl7h8uWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Tue, 8 Jul
 2025 06:50:08 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.021; Tue, 8 Jul 2025
 06:50:08 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 08 Jul 2025 15:49:45 +0900
Subject: [PATCH v4 5/8] Documentation: gpu: nova-core: Document vbios
 layout
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-nova-docs-v4-5-9d188772c4c7@nvidia.com>
References: <20250708-nova-docs-v4-0-9d188772c4c7@nvidia.com>
In-Reply-To: <20250708-nova-docs-v4-0-9d188772c4c7@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0089.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB8412:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ae6afe1-b383-4632-18a0-08ddbdebad6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ekRvNjVSbmF6RjRDUWorbWhtSUZ6eWJLZjduaktxKzRnSDVidW4yanNCazNI?=
 =?utf-8?B?VFJsY1NBR2VzakUzcDF4cmNORGtqNTFEcGh5ME5HV1pjb0xxSHcwTTM2S0Ez?=
 =?utf-8?B?OStRODMyMktwZ3lYVm1NTFdFNmpHb1dzSnVaMUZwa2ZvM0lGT04yZlFnZ1hL?=
 =?utf-8?B?aWIva0UrV0x1S0grYldEZmd1LzNKWk5ZeFBNNTNMaG9KdUZBVHY4b1BHdCtB?=
 =?utf-8?B?ekhNRm5vVUIxemhVM1pCM0cwT21yU3owc0IySkFJMjJjR0o0RjhnZk5WZERQ?=
 =?utf-8?B?RW4xcmd1Uno2RTVrU1RxUXJsN0hkM3E2TzVYRXM1UWJtRFFLNU4yRitBTEQ3?=
 =?utf-8?B?ZStDaGNVdkEyYW9BZG5VNVZ5Y0M0Ullsd05IN1V1cGw0R2xlSlplV2hveFA2?=
 =?utf-8?B?ODE1Y2lLWWdYZ2tTOHRJeDFBS3pCQ0FTQ1gyeG1iVUdKbjRLeHRmT25hbWpw?=
 =?utf-8?B?cGozNS94bGxKM2EydDcrdU9RZTRhNGRYWlBMQUVWU0Y4S28wRms4R3kyNDUw?=
 =?utf-8?B?SHJOVC96dDJ1aVNpN2FLaWlyajZtcUpyKzRoWENuNVFtUjRJRDY3cEZ2ZmpW?=
 =?utf-8?B?d1V3QkZ6dE1MdUV0cjBvdUJnQ2NWVW9LaDlEcVdoekN3eEpQTVRoUHVIaXZD?=
 =?utf-8?B?cDF1bSs0S0RtTUhIbjZUQ0JOUXdmSCtkVmovZkNMaFdGTnFaUnZPaTJuOHpP?=
 =?utf-8?B?QWh0QzJPL1AvTlpJeWhZMUg1N3JNazVMTTFHRzFMWUdBWUprb1hpOTFHVGY0?=
 =?utf-8?B?M0w4R0l0WjUyTHRWdEFpbThjV3VJb0VvbndlR3J5czBVbm1ES0Y2RFRKK1k4?=
 =?utf-8?B?K1BXaEZwYlZlNVZxd0txOVlRVXpzQUI0alNMOSt2OGFOM2pxdERBc1VMaVZy?=
 =?utf-8?B?WTFHMDRBbHJXN0xyRjcrUWw0RjlnLzZzRnpBdmZqYVY0blBXWmxWL2FZV25s?=
 =?utf-8?B?Sll1aVdLSXNleEdQaGQ4YmdBa01DS2diZG04ODRNY2lRSndwcDU0VG5zTXpT?=
 =?utf-8?B?RndIS09qWDM5M3I3NkVMaTlpQnZkYXdFaDdHcHpTY1Budy9BazVDTHVORmhm?=
 =?utf-8?B?ZEJxVXNjdFhaUDBBVUFPM1E5QWJpTTNZTGNlbHlBZkdMekh0N2xIRVAyOFls?=
 =?utf-8?B?d0ZCaG43VXVRQnh2andpRlU2YmZXOEMxQ0pna001Z1AzeS9LWUk5Q0tvaVdv?=
 =?utf-8?B?UXhCalZ4dlRTOVZkT09OOUhpckdVNnBLUnVHb0hZVEZ1VHlQM2JnZVZuYjA2?=
 =?utf-8?B?aGtVeG02czNaQUc5S3VrZkpoZnNROXdiS08ySml5NXF0NEwvUzdIZkRLQmlD?=
 =?utf-8?B?Smx3eUF3MW9CMllqdTRiMVNKWGlxdWkzSmg2RzlINlB0TncrWURDaENUdjFr?=
 =?utf-8?B?TU92K0cvQm9ESnFUU0Q1aDZwVTRrQkJNbTRLSnR6dmc2TjVXekpmWVZwNWZj?=
 =?utf-8?B?N0hNQTExcVBmaDF1Q0p1Z3IvZXhTdkcrKzFXWlRWUGdzVjhkTXdoeUxhZjZG?=
 =?utf-8?B?SzRuZlVjN0hlODJ5RGhRTXVRdmVQREJOM1pJdDZpUzhaRkpJbzlaRkJuTEtF?=
 =?utf-8?B?TEppTXlYSzY5ZEo2eU16MWN1RFgvaGhVY3JVQ3l3cGdURUNEUEc5UFFtZ0lx?=
 =?utf-8?B?dVY0azlKQUtWdklPMHNwdFJPZFJUcnlnbzVpM283R2JuSnhZaHBGUWFMNG5C?=
 =?utf-8?B?OXdKM2hETVM1K0dQM25JdUhiSUp6TlJpWW1TR1BLOGNIazdleGRNRFhYWE9F?=
 =?utf-8?B?Q0lpSU8vZm5iaExLTlJ5MlMvUURuYWhGWjFsek5SdlZla1g3eUJOSStkTm9B?=
 =?utf-8?B?aXlsaWNJSHRtWEs4ZDBzUUZGZUhGeGl3OXltWlVkeFhzYkJ3U1U0cGRob2dP?=
 =?utf-8?B?bm9iT2QwZitFanEzZUZLZGFXM3lucU05WG9UV0RVbUtkdU9lSkcyUUNsMG5P?=
 =?utf-8?Q?qrZDfhnqOtU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUFXS2VQMDM0dmlSNStxNjNJZWpZUlVPa2N0MjhWcHlzUVQ3NytYMmgzemNv?=
 =?utf-8?B?dlJXR05hZmdoT2pBbHRKOTBCeDUyc1JuSTM5VlhWeUxnbUFtY091MTFXN1B5?=
 =?utf-8?B?Rnl5RTVCckhtejBBVnBUVlp6UVkxcWpzcEZQak56ckVlUGVGcXZXZ3lhY3pL?=
 =?utf-8?B?ZWx5bXlyTm11RWpCaHVwWVBYTXJnSTFTLytFeURDeERrUnZhcm1ETmVCelBX?=
 =?utf-8?B?YytEcC82YlV2aTNyNS9yL1Vuem02T3BYY1VwUEFxVmYwd215Vmlrd1lwOUc5?=
 =?utf-8?B?anJ0TjZ4MUVuRWswMk1ORy9FTDZXbzlDK2p0WVQ5MzlWYlpydFUxVEx3aVV2?=
 =?utf-8?B?ZG9qM09YcW9OcXBVV25pQWdvZDJrd2pyeHI1RXVMSGlLSnpwMzg2VzJyY045?=
 =?utf-8?B?TnhQUFhLZWxTWlNuMUU3N3AzQjFkcCtCQ1c4UnRCcXhqUlIrSTEvMUtGNTlz?=
 =?utf-8?B?VUpFam5PMmdENGVQdzdxUzFPcHZUSFM5NFdvenFiQVoveGkyQjZMREJ2RFhZ?=
 =?utf-8?B?THpOT0tCR3pWOXFKK2NPeG1JQ2tJUWExemFhQUNCL3lBUERtQUt2djdQdk9k?=
 =?utf-8?B?NDcwMDdFVUQvQnhIVkpkeDJyeG5rcURMMmRWc0dkall0Z3NNMitIWW1LQU95?=
 =?utf-8?B?bmxDVk5icGtEWlJ0K2VOMEt4OXNuSEJoSHFsQVVuaEliRGMrb3c5MmhXU0Jx?=
 =?utf-8?B?cGZ3ZERJb3pUZll5ekMyd1M5SHphb0hRNmJibDR3akVnRy9najBUQnRCdTFv?=
 =?utf-8?B?bXVxOGxHMFlCd21abEd2emZ1YkFQWXc2Z0dqcCtWa1Vtd3dPZnpEN0graFVR?=
 =?utf-8?B?dmFYTldFZ2ZTd0QvWCtjSG4vV1BvOXNBVzQ1T3haZkRFYVFudUhsYXZucHF6?=
 =?utf-8?B?dzBycWN2YjVxS3hSclh6d0JCbVBOUlJDVVRka2hSYmlIMVNybUxQbTFvdlEy?=
 =?utf-8?B?WUxqazRXN1RyVmlaT3MvakFKdnFBUi9oMEdUdkVIREMxaElkQjNuS0M2Y3Ar?=
 =?utf-8?B?c1V2ZUpna3RrU0tnbDJVbEk0dGF2ckorZlJCNEpWVkNZUUpGdHhFMGxvRVZu?=
 =?utf-8?B?MFRFNVBtU3hyNG9tRWFtc081VzlFWDJMTzIzNmM0WnJlWEFaQ0ZhK1A1c1Vv?=
 =?utf-8?B?TkRHZkpEM3U0RlN4MnJTTEtaS0xWUnRHMkw4V0ErdTZBSzRQOVhDbjFqOEhv?=
 =?utf-8?B?bDBod1BDN2hmL2M1RU0yVHJnQStpdEZwbE9TU0t2Z2FjcThqTU5IYWRwdkdK?=
 =?utf-8?B?aE9NTFBUUXlWenE5bFJjNlFkZ1g2TDlXR0hVLzd0ZXVmdWdYa0VJZ2d2azZs?=
 =?utf-8?B?REtLY29DZjByaTFSMFZnUXpkVlBPa3ExdDRrS1RnQ1FtallvTmMvUnJOdzBC?=
 =?utf-8?B?K0htcVRuKzVTL0NsRDFPTTFNZjBPTWhHUmtqTzYzWGZvTTRkVlZpZE55U2RG?=
 =?utf-8?B?cWt4dURiQWhqRWN6WjdPdEcwbWhHVENqQkVmYy9NODNKNzhJMjB3M3RTMW5V?=
 =?utf-8?B?TXVoMlJkL1NWQWF0Q1JYaUJOWXUvcExQUDl2eFhqWnM0UVllUGdrYXFkQ0JJ?=
 =?utf-8?B?eFVMNlBnRFk4bXhxV1JlbmdsV2JYZ1RPKzR4azJVekljbU82Q3JMV1R5RE1q?=
 =?utf-8?B?MUkxTlVCS0dqSXo3RXNXMFBOeVVDeXhiMEk2ZXdienFKUkJocHhtK09zcmFY?=
 =?utf-8?B?TVBTS0ZuVUdNb24zanRIUjNBOXdNK3VXR0ZCZHFzNXFWUTBXeXMyRWVUUUdq?=
 =?utf-8?B?RGNRTXVoZ01QWUltS0hXMlA1MGVjMTljUXRkVEh4OXd3ZFExMnk2aUw0aEVr?=
 =?utf-8?B?N3pTR1JtV2ptUi96SC9lNGdpaEVCVWxJbUpsUlR4aDhOWEFXRktHOFM0M3Qr?=
 =?utf-8?B?KzdiT0xEODNNWjlnRmN6MzV1K0FmbnFMSlpqbktCZGU0aFMrNkk4SHFybFF6?=
 =?utf-8?B?dTVIbW5JMG1mcmZQZ1JidEl1bkRQRGZkV3VicE05d2xHVEgwNGwxZVJZN3V0?=
 =?utf-8?B?em9UeWJxaEE0d1FVeVJCdEw4Z3BvRWxqSFVVRVJoMFFmM2FVakpadDA2SkxV?=
 =?utf-8?B?T2R0OUNnUkpFZGs3RU1RS0RsVWZsZVpxVWpCNlhqakxHU0ZwK1RZb3pRRjJM?=
 =?utf-8?B?K051akIrL1h1TVVvQ3VoWjh5bXMwU2l3UTZtV28zUWlFazFGSVBhZCtPVVkz?=
 =?utf-8?Q?vtQpHu4VOAjYCcWs0RrLRDC4PAk1Kd9SqZeW4kg+z2ZB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ae6afe1-b383-4632-18a0-08ddbdebad6a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 06:50:08.2663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ru7k2VNWqjs8YFUDfH2IbCwm3bY4LTBVVAw0WyDzjMoaNCsIgIMdHyZ3NIwPeyXPENAePkAXa4WVQIpANkaPYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8412
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

From: Joel Fernandes <joelagnelf@nvidia.com>

Add detailed explanation and block diagrams of the layout of the vBIOS
on Nvidia GPUs. This is important to understand how nova-core boots an
Nvidia GPU.

[ Applied Timur Tabi's feedback on providing link to BIT documentation. ]

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 Documentation/gpu/nova/core/vbios.rst | 181 ++++++++++++++++++++++++++++++++++
 Documentation/gpu/nova/index.rst      |   1 +
 2 files changed, 182 insertions(+)

diff --git a/Documentation/gpu/nova/core/vbios.rst b/Documentation/gpu/nova/core/vbios.rst
new file mode 100644
index 0000000000000000000000000000000000000000..efd40087480c4fd6cc8ef10ddfaa9f0297417e5b
--- /dev/null
+++ b/Documentation/gpu/nova/core/vbios.rst
@@ -0,0 +1,181 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+==========
+VBIOS
+==========
+This document describes the layout of the VBIOS image which is a series of concatenated
+images in the ROM of the GPU. The VBIOS is mirrored onto the BAR 0 space and is read
+by both Boot ROM firmware (also known as IFR or init-from-rom firmware) on the GPU to
+bootstrap various microcontrollers (PMU, SEC, GSP) with critical initialization before
+the driver loads, as well as by the nova-core driver in the kernel to boot the GSP.
+
+The format of the images in the ROM follow the "BIOS Specification" part of the
+PCI specification, with Nvidia-specific extensions. The ROM images of type FwSec
+are the ones that contain Falcon ucode and what we are mainly looking for.
+
+As an example, the following are the different image types that can be found in the
+VBIOS of an Ampere GA102 GPU which is supported by the nova-core driver.
+
+- PciAt Image (Type 0x00) - This is the standard PCI BIOS image, whose name
+  likely comes from the "IBM PC/AT" architecture.
+
+- EFI Image (Type 0x03) - This is the EFI BIOS image. It contains the UEFI GOP
+  driver that is used to display UEFI graphics output.
+
+- First FwSec Image (Type 0xE0) - The first FwSec image (Secure Firmware)
+
+- Second FwSec Image (Type 0xE0) - The second FwSec image (Secure Firmware)
+  contains various  microcodes (also known as an applications) that do a range
+  of different functions. The FWSEC ucode is run in heavy-secure mode and
+  typically runs directly on the GSP (it could be running on a different
+  designated processor in future generations but as of Ampere, it is the GSP).
+  This firmware then loads other firmware ucodes onto the PMU and SEC2
+  microcontrollers for gfw initialization after GPU reset and before the driver
+  loads (see devinit.rst). The DEVINIT ucode is itself another ucode that is
+  stored in this ROM partition.
+
+Once located, the Falcon ucodes have "Application Interfaces" in their data
+memory (DMEM). For FWSEC, the application interface we use for FWSEC is the
+"DMEM mapper" interface which is configured to run the "FRTS" command. This
+command carves out the WPR2 (Write-Protected Region) in VRAM. It then places
+important power-management data, called 'FRTS', into this region. The WPR2
+region is only accessible to heavy-secure ucode.
+
+.. note::
+   It is not clear why FwSec has 2 different partitions in the ROM, but they both
+   are of type 0xE0 and can be identified as such. This could be subject to change
+   in future generations.
+
+VBIOS ROM Layout
+----------------
+The VBIOS layout is roughly a series of concatenated images laid out as follows::
+
+    +----------------------------------------------------------------------------+
+    | VBIOS (Starting at ROM_OFFSET: 0x300000)                                   |
+    +----------------------------------------------------------------------------+
+    | +-----------------------------------------------+                          |
+    | | PciAt Image (Type 0x00)                       |                          |
+    | +-----------------------------------------------+                          |
+    | | +-------------------+                         |                          |
+    | | | ROM Header        |                         |                          |
+    | | | (Signature 0xAA55)|                         |                          |
+    | | +-------------------+                         |                          |
+    | |         | rom header's pci_data_struct_offset |                          |
+    | |         | points to the PCIR structure        |                          |
+    | |         V                                     |                          |
+    | | +-------------------+                         |                          |
+    | | | PCIR Structure    |                         |                          |
+    | | | (Signature "PCIR")|                         |                          |
+    | | | last_image: 0x80  |                         |                          |
+    | | | image_len: size   |                         |                          |
+    | | | in 512-byte units |                         |                          |
+    | | +-------------------+                         |                          |
+    | |         |                                     |                          |
+    | |         | NPDE immediately follows PCIR       |                          |
+    | |         V                                     |                          |
+    | | +-------------------+                         |                          |
+    | | | NPDE Structure    |                         |                          |
+    | | | (Signature "NPDE")|                         |                          |
+    | | | last_image: 0x00  |                         |                          |
+    | | +-------------------+                         |                          |
+    | |                                               |                          |
+    | | +-------------------+                         |                          |
+    | | | BIT Header        | (Signature scanning     |                          |
+    | | | (Signature "BIT") |  provides the location  |                          |
+    | | +-------------------+  of the BIT table)      |                          |
+    | |         | header is                           |                          |
+    | |         | followed by a table of tokens       |                          |
+    | |         V one of which is for falcon data.    |                          |
+    | | +-------------------+                         |                          |
+    | | | BIT Tokens        |                         |                          |
+    | | |  ______________   |                         |                          |
+    | | | | Falcon Data |   |                         |                          |
+    | | | | Token (0x70)|---+------------>------------+--+                       |
+    | | | +-------------+   |  falcon_data_ptr()      |  |                       |
+    | | +-------------------+                         |  V                       |
+    | +-----------------------------------------------+  |                       |
+    |              (no gap between images)               |                       |
+    | +-----------------------------------------------+  |                       |
+    | | EFI Image (Type 0x03)                         |  |                       |
+    | +-----------------------------------------------+  |                       |
+    | | Contains the UEFI GOP driver (Graphics Output)|  |                       |
+    | | +-------------------+                         |  |                       |
+    | | | ROM Header        |                         |  |                       |
+    | | +-------------------+                         |  |                       |
+    | | | PCIR Structure    |                         |  |                       |
+    | | +-------------------+                         |  |                       |
+    | | | NPDE Structure    |                         |  |                       |
+    | | +-------------------+                         |  |                       |
+    | | | Image data        |                         |  |                       |
+    | | +-------------------+                         |  |                       |
+    | +-----------------------------------------------+  |                       |
+    |              (no gap between images)               |                       |
+    | +-----------------------------------------------+  |                       |
+    | | First FwSec Image (Type 0xE0)                 |  |                       |
+    | +-----------------------------------------------+  |                       |
+    | | +-------------------+                         |  |                       |
+    | | | ROM Header        |                         |  |                       |
+    | | +-------------------+                         |  |                       |
+    | | | PCIR Structure    |                         |  |                       |
+    | | +-------------------+                         |  |                       |
+    | | | NPDE Structure    |                         |  |                       |
+    | | +-------------------+                         |  |                       |
+    | | | Image data        |                         |  |                       |
+    | | +-------------------+                         |  |                       |
+    | +-----------------------------------------------+  |                       |
+    |              (no gap between images)               |                       |
+    | +-----------------------------------------------+  |                       |
+    | | Second FwSec Image (Type 0xE0)                |  |                       |
+    | +-----------------------------------------------+  |                       |
+    | | +-------------------+                         |  |                       |
+    | | | ROM Header        |                         |  |                       |
+    | | +-------------------+                         |  |                       |
+    | | | PCIR Structure    |                         |  |                       |
+    | | +-------------------+                         |  |                       |
+    | | | NPDE Structure    |                         |  |                       |
+    | | +-------------------+                         |  |                       |
+    | |                                               |  |                       |
+    | | +-------------------+                         |  |                       |
+    | | | PMU Lookup Table  | <- falcon_data_offset <----+                       |
+    | | | +-------------+   |    pmu_lookup_table     |                          |
+    | | | | Entry 0x85  |   |                         |                          |
+    | | | | FWSEC_PROD  |   |                         |                          |
+    | | | +-------------+   |                         |                          |
+    | | +-------------------+                         |                          |
+    | |         |                                     |                          |
+    | |         | points to                           |                          |
+    | |         V                                     |                          |
+    | | +-------------------+                         |                          |
+    | | | FalconUCodeDescV3 | <- falcon_ucode_offset  |                          |
+    | | | (FWSEC Firmware)  |    fwsec_header()       |                          |
+    | | +-------------------+                         |                          |
+    | |         |   immediately followed  by...       |                          |
+    | |         V                                     |                          |
+    | | +----------------------------+                |                          |
+    | | | Signatures + FWSEC Ucode   |                |                          |
+    | | | fwsec_sigs(), fwsec_ucode()|                |                          |
+    | | +----------------------------+                |                          |
+    | +-----------------------------------------------+                          |
+    |                                                                            |
+    +----------------------------------------------------------------------------+
+
+.. note::
+   This diagram is created based on an GA-102 Ampere GPU as an example and could
+   vary for future or other GPUs.
+
+.. note::
+   For more explanations of acronyms, see the detailed descriptions in `vbios.rs`.
+
+Falcon data Lookup
+------------------
+A key part of the VBIOS extraction code (vbios.rs) is to find the location of the
+Falcon data in the VBIOS which contains the PMU lookup table. This lookup table is
+used to find the required Falcon ucode based on an application ID.
+
+The location of the PMU lookup table is found by scanning the BIT (`BIOS Information Table`_)
+tokens for a token with the id `BIT_TOKEN_ID_FALCON_DATA` (0x70) which indicates the
+offset of the same from the start of the VBIOS image. Unfortunately, the offset
+does not account for the EFI image located between the PciAt and FwSec images.
+The `vbios.rs` code compensates for this with appropriate arithmetic.
+
+.. _`BIOS Information Table`: https://download.nvidia.com/open-gpu-doc/BIOS-Information-Table/1/BIOS-Information-Table.html
diff --git a/Documentation/gpu/nova/index.rst b/Documentation/gpu/nova/index.rst
index 2701b3f4af358b373d4ef47975d5a80213f3e276..f38041fcd595524b204eabf6ca3aad51038682cf 100644
--- a/Documentation/gpu/nova/index.rst
+++ b/Documentation/gpu/nova/index.rst
@@ -28,3 +28,4 @@ vGPU manager VFIO driver and the nova-drm driver.
 
    core/guidelines
    core/todo
+   core/vbios

-- 
2.50.0

