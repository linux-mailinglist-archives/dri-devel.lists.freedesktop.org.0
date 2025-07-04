Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F143AF894C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 09:25:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E91010E94E;
	Fri,  4 Jul 2025 07:25:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QHolrUH7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2088.outbound.protection.outlook.com [40.107.94.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F7410E952;
 Fri,  4 Jul 2025 07:25:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FPl10/nMIksJGOyY2tNOQpSPAe0k3nZEkiXUkid3cWJ47Kem9KYPcqEF18EJ9BMRCrkrp5q542nAnDfTUh7N9ZCKpjkzc/CNl2+BmpRX8DWlrdUNXcmI5cbSS0bMN4nLWnmR/EC5BJw9Vp2qfJmVIE4G6bWC7x6pcYC/emyt2oLR2p9M20zZX0kUwHRqZfMoIzDJR0/tHRazJZzJgK2LeGYTbh7Iz9ahoLpmTs7GK6Mv8I8NQ6FEm8G/Z0Ot1b5SsX+1MCIKLR+ZTCz43C3HfVkFu1nHTfgyDSR/Z6L94o0cu4wxnbwQtRXhwqVdCZiRUXtNEeyUZfdkF93qvUD0CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mirb2b7gOec3Rq4W8RGJ3Io0+6j1YsAPh8+eyc18GX8=;
 b=AMU+RxPOsfyWqjS9pORnJ5IZsEGv+bsNGKJLpoBh88aFKEjdk+C4vXLFt0vlAXTjmveS9+YHMV7oVo4+6bYipqLQbCfNaQQNvzB8ikQibwmqD5jq1w+uGMkI+g3WFvsRjuv7GVLKQu2hDx2D4vcitXxbHGTicnUPaYf7FbP8BdU9ISdqBA1Pf/tR0Nt6XV2J5c8yIssSkBstq15qWjWZiQ+sYNhM31EPFKqscrS5GLeUGwPtvdlS8lQRerd9gAOnfAruq9TSm5F6KWr0Uhq53uqiG3zF5NPZ1NFMYs1H8mZnVV1lLM8yXPpMRV/wbSyimaMx+pel0AM7xqwHNaEgSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mirb2b7gOec3Rq4W8RGJ3Io0+6j1YsAPh8+eyc18GX8=;
 b=QHolrUH7jm7FEsWH0iyAgZyuguIdWEYrGY1wE5e1KcSwS2RNHWB4OMYupm9gHLqPJsOE1ktI4m+HchtNIAIkPzXlCif+RK3NKFzU49lUB0Zq5VbbzU4RBbKLg9S7aojXAaE2MMPN6/OHyG7E8pr3oZsqNpmaeOuNJEWYHOnRxN3ibIWulz6E8uBa3ee+pZ11IsOuHBS23kmjYGGL/z59w5VNMT5og2azM53lciUOig8olwHhdp5yUPYBWg8BWDCAnybjA1nXe4IZyP3CbRPvUb+M0wr5H8bmRFeBiFOe15DnPniI854voVL8kUM/vq7oPg1wqoY7d3UsPOhGsuLEhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB6341.namprd12.prod.outlook.com (2603:10b6:208:3c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 4 Jul
 2025 07:25:46 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 07:25:46 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 04 Jul 2025 16:25:08 +0900
Subject: [PATCH 07/18] gpu: nova-core: register: fix documentation and
 indentation
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-nova-regs-v1-7-f88d028781a4@nvidia.com>
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
X-ClientProxiedBy: TY2PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:404:a6::35) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB6341:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f989413-3c12-45d8-2ac6-08ddbacbfe7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGZURXJFbjNLbDJjMVRYSHRvVU5seHJ6c2NQdlg2V3JiQ3BpQXo3T2JBMlUw?=
 =?utf-8?B?aHVLNmxpL2tFdi83QkgxZGdYMlpSWHBXYzZhQkE5dkNXZGdVbGtLM0p0d3dC?=
 =?utf-8?B?YUFOS09pVW1XNTQ2WFVDYzhSZEFwTU1zSjhqbTcwNUY4T2J2Vit3T1k4WUdL?=
 =?utf-8?B?VWNCUUU3eCtSanVBQmkwajN4ajJkb1ZOMEJlSm5tRU5VcE1qajNhc29BeFRY?=
 =?utf-8?B?enQvNUpkVWxRdjh4bDN4NGc0TWVWTnJLeXRkL1JjalRLT1ArY29zZzNZMHJn?=
 =?utf-8?B?citzdWZTcWVtV0ZNNE82UGVXbytwQkhweGVUZzZocXVrdlFzOXU2YldzODEy?=
 =?utf-8?B?YTVzOHQ2UFA4VkY3Wlc0eGd5NXhaUEdjNkxJWk56S0lMZVhYSzZxQUFSdmtX?=
 =?utf-8?B?UDIwUHRLWXBFWkZObzJMaVAyVlRlQzBHUGJNbityZU4zb210Wi9WWGlibUVH?=
 =?utf-8?B?eWhuaktuN2dyV1dvbjV2RGk4Q0ZEMk1xZE5odUx5Z1BRdnZCVHB4RDFkQXFE?=
 =?utf-8?B?cThNbE9WZ2gxMnBkVEc3STJ6MFVUdDIwOUkwM2lldHJqdmNZZ0RSNDVjU2or?=
 =?utf-8?B?VWVvT0ZHRFRFdUg1TUFBbU9iRzBESDZkdEtxYWExSkh1aWIvTGpHTFI2MmIw?=
 =?utf-8?B?c1lOSXdHdFBsK1FRd0JNa0VpajV6VWJOV0orSXJvTFhKMlR0dzkyaUp6NjY0?=
 =?utf-8?B?S0RtMndSOE1yODBUNEJIUDNVMUM4V0E3Sk0rS1BTdVR6bTdnSW5CZHFGQitO?=
 =?utf-8?B?ZXd0ZkxrS083a204bTlCcEZVKzRiNGZFWmZpMzF4WlpYYktKNHdhKzJjYlc5?=
 =?utf-8?B?NDdJWWVBSFFFQ0FUVmlPMWh2MCtCVXBDSUdpSEE4VnkwYjFDakx6ZllKd2Vs?=
 =?utf-8?B?UEZaaWZId0JCZUVnUEhaSUJtcnhUV0szUEVoSncyZHFKdjEzMzBRYlAzWEQz?=
 =?utf-8?B?SUFzS3QzQjlCaEduWUtXdDRJN0VDbTM5SlN3eFgxY2paVE81blBhYkxJV1l4?=
 =?utf-8?B?YjE3YU9VLzRwTVJPS2NtSnVZY2c0R2ZFalZJeFN4WmJFbTE3UE1CWUI0bmEx?=
 =?utf-8?B?RnFHYUpHOEttQkwyVFN0aFJabm9SeGtUVko2MlZ3SlF2djVOOVAzMWkwbVg0?=
 =?utf-8?B?RVdXQy9jR3NOa0tCaUV4VlRGN2hPUXRrbE1wdFBaN3pVR1hCbTBJMTBxbmov?=
 =?utf-8?B?bWYxNmUxQTVnbVpwUDhCa2FBN0QyU3piR0tEUWpSZlg4QTQwQlN3TndVdksx?=
 =?utf-8?B?UWxqdEF5WEpOZk1RaklGS3BuM2dqTUxmMVp6UnByOE00akRTOWF6bFgrTFVU?=
 =?utf-8?B?UnQwVFBCQkd0QWlLUnpTZDJtK2JqSkZPUEhuS1F4aTFZbXZnWnpYaUtZVmJu?=
 =?utf-8?B?azJHd3AwclBUWnk4Z3BxSGpqQVVLYncxaytNdFM5MWhGcFRYdmQya0pqS0ox?=
 =?utf-8?B?NG9URVdTQ3pQQ2k2NUYySDBrSkFlaEN4OWJoazRGdkwzRHpITFZUQ1ZFYjhK?=
 =?utf-8?B?RWI4WFR3enpjRVVNNlRVT2J3UTB3THVRNXdmWXVnK0ZsbFROSlREbmVMV3BQ?=
 =?utf-8?B?QzJIQzZCRW5TbXhieVFuTU8wYTJLallJWkVCTWZSTlljb1FoWk5WQzJCSmR3?=
 =?utf-8?B?L2ZnSFdzTzZSS3o3K09PVjZ1cldhaEIzWGJDWWo3dWtPNTFWeWtRd0hUVERn?=
 =?utf-8?B?UGJjYStQRkFwQmZ3SWpJdXlaZGhUSUphcXFSRVQ5OEhaczhEL1doRTd1SVJV?=
 =?utf-8?B?enNEMEp6WW5hdlFhTjU4YUZ0UlJvY3NpOTAyM0ZnOGpnWnBaQW02UzEwSzBX?=
 =?utf-8?B?SnN5ZlUyMzBLUVZ5a1U4MlpseVVqRmU1UzFXOWpRSzdUNk8wSU5qYmhFVzZG?=
 =?utf-8?B?VGRjcWx2ckViekw1c3pvbng3QU5vVjN1MmdrSmhMSkFqdXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlhvTmtabjVGc0tGM2RXWkNHaHlTRU5Wdk9idjN2bXhabXBWMG9iQ0M0cHoz?=
 =?utf-8?B?aDl6WmZmZWttbVNSeHl6OUJpUlk0Tnk0cnQ1SlZYdW9YcTRlQ21WWjJETUwx?=
 =?utf-8?B?SG1tQVVVWjhmRTB1U2NoY1FHV2ZqNXdLK29BMDVCbHdQVlUxaFJ3cHZXYWlR?=
 =?utf-8?B?MUxTWFNKbUVFdFRjeVNyakUxY3Q3UjZ0VnFJSERzR1hTRWV3NGNOUXJaMGVE?=
 =?utf-8?B?Qk5pOEpCb0ZHb3AyWk0vWkpyTTg1ajRZVTNhUHZmQ1NMaVVwQWpBVWYrbmwy?=
 =?utf-8?B?NVNhY3BlTFdleFVIaFZRUzlWaTVRV0ZJbGZVa2xSWER5T2dPVVFIUmExOHpO?=
 =?utf-8?B?RGg2Z0xSc0xaeGNKQlZGajlxdjBsTDI0VERRTmgyTkZQaWJsTWlKMWZZUTFo?=
 =?utf-8?B?NEdmcWZhTXRmVHZ4OUdLdjJqMGVobC9zSllOYkpYTHlwUWZSUWt5OG5JYTVY?=
 =?utf-8?B?TjE1OU9yQzBiQXpRYlY4TTBJRSt4ckxLZTR6THNKRUdjYitCeTBFS2VIUDBW?=
 =?utf-8?B?eCs2d2Fkc1ZWVmhocDJUQ0ptSXFuelpDT01HZzlDUDh3MHl1ZmhEamVkY1NF?=
 =?utf-8?B?OVErNGM2Q3crUVh2Umd6bUxBYjVKZU9HNnRCbzZUMU11WUgzQkZWYk42dDA0?=
 =?utf-8?B?Zll2VnN4ZHoxY0E2ZHBkY1NrTkk4R2FWMmJZYUFXNGk4WTVjMWZDUXhFanFR?=
 =?utf-8?B?dzFoK2t3RW5FT0xSTzZYa0JHZlZYRDhxYkpmeERxQTJjczEwdFJvYWF5N082?=
 =?utf-8?B?YmtXUkNLK0tkeTdhRVYzanRaU3JES3M5UGVReHFZTnhueGJIMndGdU92SHhr?=
 =?utf-8?B?Q3NPQS9aMDhPQktZYW1FdjNGeGlBZ2ZHL2FnLzRSMVA0ZlJZOHBad2M5SDYy?=
 =?utf-8?B?RVkxTVIvUGdPZ2s3S2F3TG9lQ3p4UGlHTVdIZGNCbTZrSCtCK0F2Zk8vTmFF?=
 =?utf-8?B?Q0pPdmpQMzQ2T3d5STd1dENHc1N2bW0xYUpBTW9UMDVVMjNRWWF0WVFJVjBF?=
 =?utf-8?B?WlA2WVd0TnZrUHExeXJwR2lrZDB4VDd2ckYrUW5YdEZyYnhqUWkxUDlQa3hx?=
 =?utf-8?B?QitiMDdUeiswQzZJbnlNay9wVnlXdWVDTU54b2psSDNKQXJEb00yanBDVzFC?=
 =?utf-8?B?YmdEM1l1VGNvMnh6WC9mYVc4cTUwOXhyK3dxNmd3aDl3Rk9wTUVjQmMwWFhG?=
 =?utf-8?B?NHVxZnhQUDBmQ1kwOGEzVDFwZms3U3I3YkdLeEtxcjRVRnU3WTUwOEhWNlFh?=
 =?utf-8?B?QkRTcmxuMWRKSmI1NUVvWVIvOTZ3STFhOGd1QkMwWDAvOHVwQnphcGd2eWg5?=
 =?utf-8?B?NUpnSHNPVXoreVVNaklJRnJUcnNkZURIdzdvT09GNGQvSnh0bTNiTVRVMVY5?=
 =?utf-8?B?QUwwTjJTNG5zbkpWUjhTalQ2VFNPb1RUSTFucklxeHE3OVNITkJlWFlDWERp?=
 =?utf-8?B?Sk1VVWtpVU5lN1dHQnlmOWJ5MHJ6QnptckxUdG0vUmcwek9vRHJZTFNDbDEv?=
 =?utf-8?B?VmRiSkQ2M1RZQ01VYUhHYTBwOG05RUpyRFBrcmtyL1VmMlZReHMzTWxhWkJJ?=
 =?utf-8?B?SkZxa3JQSHl2U3VPd3VQQXNSY2xLQXg4WXNTcWpxZXhoZ1BOOTRpOFFRQTJz?=
 =?utf-8?B?dXpYVktXSzlvS3hTUHRwY1FZMTlRbzlSYWpXaVFxY0UyL0Z1YnlWdW8xUDFs?=
 =?utf-8?B?T3JmZ1MweHZHZUh5bTl2YlFqR3gxVjhlcXp1a1dNL0x3WDhQUVd1MkJ6aHNk?=
 =?utf-8?B?Q2RPWWpBa2JlQWs1R3VTRGFoMDRzKzYyaUNYdU0vZlAyTG50ODF5WW5ub29E?=
 =?utf-8?B?MCs0Y1hSbzRpcFArRDc3VU9JWXlCMXVCbEVJOXFaSGxIOHpEZG1uOHRZM3FP?=
 =?utf-8?B?M2Q4Y2JzdnJEN2w3UE1MWGp4Nm9jcFQ3bzJEVnd4K2hXRWErREZ1Uit0ZWNp?=
 =?utf-8?B?MFNpb3A4dkJhL0ZmUnRJRnJzWnA0R0I5NVlJMHBiNmJLTEVqdHlHeXJQT3lB?=
 =?utf-8?B?QUNNQTZIT2ZlWjR1cm41RW5OajJDMFpKWFNmVnJZejN1clg2cUJlVU9LTTdx?=
 =?utf-8?B?R2Z4SkJNZm04YkdETTdWakVremhHNUkrdlowNnJTVElPVzdpcURtYUZ5TE14?=
 =?utf-8?B?am96TVR4Tkc3cGJWWWVyRkgxaUJ1SjYzUDRRdVQxYy9HV3lQSThpT1JhL1pI?=
 =?utf-8?Q?z+q4lgSsO/AYjEompEaM3QR/4jWI/obeYwLY7JtiWcMi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f989413-3c12-45d8-2ac6-08ddbacbfe7d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 07:25:46.8257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pVdehSYYLQiRvZx8SpQhqbY20ZrPUuJmOzx3FzC66GEDqoBD9ali2HgF0G+cPwnowTGgWquuGmq+/Aatk/N64g==
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

Fix a few documentation inconsistencies, and harmonize indentation where
possible.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/regs/macros.rs | 34 +++++++++-------------------------
 1 file changed, 9 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index b096a3689483fa79dc22f16f4baac2f9a9495c28..73ee72a6c7baa7e9d1032ec0da119940b8f1a3f7 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -87,44 +87,28 @@
 /// providing its own `completed` field.
 macro_rules! register {
     // Creates a register at a fixed offset of the MMIO space.
-    (
-        $name:ident @ $offset:literal $(, $comment:literal)? {
-            $($fields:tt)*
-        }
-    ) => {
+    ($name:ident @ $offset:literal $(, $comment:literal)? { $($fields:tt)* } ) => {
         register!(@common $name $(, $comment)?);
         register!(@field_accessors $name { $($fields)* });
         register!(@io $name @ $offset);
     };
 
-    // Creates a alias register of fixed offset register `alias` with its own fields.
-    (
-        $name:ident => $alias:ident $(, $comment:literal)? {
-            $($fields:tt)*
-        }
-    ) => {
+    // Creates an alias register of fixed offset register `alias` with its own fields.
+    ($name:ident => $alias:ident $(, $comment:literal)? { $($fields:tt)* } ) => {
         register!(@common $name $(, $comment)?);
         register!(@field_accessors $name { $($fields)* });
         register!(@io $name @ $alias::OFFSET);
     };
 
     // Creates a register at a relative offset from a base address.
-    (
-        $name:ident @ + $offset:literal $(, $comment:literal)? {
-            $($fields:tt)*
-        }
-    ) => {
+    ($name:ident @ + $offset:literal $(, $comment:literal)? { $($fields:tt)* } ) => {
         register!(@common $name $(, $comment)?);
         register!(@field_accessors $name { $($fields)* });
         register!(@io $name @ + $offset);
     };
 
-    // Creates a alias register of relative offset register `alias` with its own fields.
-    (
-        $name:ident => + $alias:ident $(, $comment:literal)? {
-            $($fields:tt)*
-        }
-    ) => {
+    // Creates an alias register of relative offset register `alias` with its own fields.
+    ($name:ident => + $alias:ident $(, $comment:literal)? { $($fields:tt)* } ) => {
         register!(@common $name $(, $comment)?);
         register!(@field_accessors $name { $($fields)* });
         register!(@io $name @ + $alias::OFFSET);
@@ -259,7 +243,7 @@ impl $name {
             { |f| <$into_type>::from(f as $type) } $into_type => $into_type $(, $comment)?;);
     };
 
-    // Shortcut for fields defined as non-`bool` without the `=>` or `?=>` syntax.
+    // Shortcut for non-boolean fields defined without the `=>` or `?=>` syntax.
     (
         @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt
             $(, $comment:literal)?;
@@ -310,7 +294,7 @@ pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self {
         );
     };
 
-    // Creates the IO accessors for a fixed offset register.
+    // Generates the IO accessors for a fixed offset register.
     (@io $name:ident @ $offset:expr) => {
         #[allow(dead_code)]
         impl $name {
@@ -344,7 +328,7 @@ pub(crate) fn alter<const SIZE: usize, T, F>(
         }
     };
 
-    // Create the IO accessors for a relative offset register.
+    // Generates the IO accessors for a relative offset register.
     (@io $name:ident @ + $offset:literal) => {
         #[allow(dead_code)]
         impl $name {

-- 
2.50.0

