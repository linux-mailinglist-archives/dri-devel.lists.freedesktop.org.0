Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1CCB17A1C
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 01:38:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82DC10E135;
	Thu, 31 Jul 2025 23:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="E057c/AQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2042.outbound.protection.outlook.com [40.107.95.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 363FE10E135;
 Thu, 31 Jul 2025 23:38:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CNNMTtZDUFXHddSrXrOVMB1jc/U7mwYMrohCSBUUS6CezftXvVbUPEgnbGtXnxyUC+50tXk+71zWQCLFugtDJtg9JdJ/BrNfPTz8hfQsXnQlEsIFo7g14oWkea0hmxzv/dYJzFstC0aAmUfchl3Aqp2CveB0c6OAKu/TAUdTBONugNtAlTmFNLQR4Aq6MH9LGJAnx3VBNr1CnFeeUzBbIgpQowCe/+z/DSNp3kVEK0APGHqmlopZ91pWJNQ6ETonjjQgH2W/F9GFpx6yEDOU37cxvjbrrEzWA07mUFuq8VmWkhEfZclqqY/it8uU7JudsBy+DVC+0PlTDjx77EfDug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJfdJMQAh2zqfIucDQnb8AmO+tRvswGyRJ9BNlzO5iY=;
 b=Aswzi8Wws0KfcOfpXMMkyZjitljUGkbCBxfG83/ON+RBXsLRLNaYDy3kdRtn0CN/VtujSg4GivlXdW8SamDlaA8Lp0Xhlc/DeI3TXAFOszCVnieJJXW7vNmtFsFwxGE/LYp7/wwkgC3UmYWeImzt0aR56HNtIjS4ifVdgxb30WLl+3N/xXoCdwgBz5vzUEIFEWsodwDX9jt6HM3MdMTeBKBKCRwGNuxermfMtW069sWSOjsqa6/JeolYImKQ+jaAp7t885SJMk8Yubu/TVIKfl5rFx9zKpYPpnMO2LhsnoTfypXqOxLuEgKNkXj2c3sC2j0QwRvpdSPwo+Z2/W4YqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJfdJMQAh2zqfIucDQnb8AmO+tRvswGyRJ9BNlzO5iY=;
 b=E057c/AQrqJNiFq7+APh1RM1nOZYVNS1ySyYD6Bpe6AsX8YVSypgXQAkMmOEb6MD6ZyMfT7REMS6FmpoAsFLW4yJgXLwYARZldeeNZbS1yThI9WxM0vImhCM0UI+NUJvLp5EjgnQ7YLnTewelWYpObSCnC9Cistwo38rAHIhxfZ8LxCZhH+7Hgc0Ja1rW/DrVZaBHJCt38LhaLeF9fP/IL1zquZSm4TwjNM14z1JV/dodZSMr2Ml12M052RyBY19dYt6n+gxajIEgfg7jLtAkbhPIHvwT6s1bfW0gVKBhbNG+H6p3fR+C1+pw48spJ8MS4863K8tXPmETl+pfNsXMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB6701.namprd12.prod.outlook.com (2603:10b6:806:251::18)
 by DS4PR12MB9636.namprd12.prod.outlook.com (2603:10b6:8:27f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Thu, 31 Jul
 2025 23:38:15 +0000
Received: from SA1PR12MB6701.namprd12.prod.outlook.com
 ([fe80::2be0:c316:443d:da3a]) by SA1PR12MB6701.namprd12.prod.outlook.com
 ([fe80::2be0:c316:443d:da3a%6]) with mapi id 15.20.8989.010; Thu, 31 Jul 2025
 23:38:14 +0000
From: James Jones <jajones@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Lyude Paul <lyude@redhat.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, James Jones <jajones@nvidia.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH] drm/nouveau: Pass along the format info from .fb_create()
 nouveau_framebuffer_new()
Date: Thu, 31 Jul 2025 16:41:04 -0700
Message-ID: <20250731234104.25243-1-jajones@nvidia.com>
X-Mailer: git-send-email 2.50.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0204.namprd05.prod.outlook.com
 (2603:10b6:a03:330::29) To SA1PR12MB6701.namprd12.prod.outlook.com
 (2603:10b6:806:251::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB6701:EE_|DS4PR12MB9636:EE_
X-MS-Office365-Filtering-Correlation-Id: 57fdcd7e-d4d1-4aed-3e65-08ddd08b517d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UW01YktybGcvdnN2MmM1eXg1R3M4Wlo0NU5ya1VyVFJPYmtDL0UzSjhjNW93?=
 =?utf-8?B?SGYrcC9TMHg4RC85Q2NTcjZIZVNMOTZLN2hEMkZhcDVrSWZXQUl4KzlSQThM?=
 =?utf-8?B?cXN0UmFweXJud3EzelcxdW1jSVZENWF5L29EZmxRMkIrVUp4Zzg3ZkhKbHJu?=
 =?utf-8?B?VXg5Sm9oaWUwZzJoSWE2dCtIMjlGWVhncitpZU1SZ3QwTStKYUNCVlBaeC9D?=
 =?utf-8?B?RHBkci9MRVkxLzFTTzc2UWJLYzRMemFINzBRTHFSMzFIc1BnRHhBZG5HREZh?=
 =?utf-8?B?Y1NpcVpJYVN1K0tYT2RoZktEOTVCZWlubVJydkRxK3YvaGhLbGVHUHdSVldi?=
 =?utf-8?B?a1Nkc0Rvc2wzR3JkU1hrRUlDSmkyeXBCMnZ5QzJDRjc5eklZRjZDNFc3OW52?=
 =?utf-8?B?bFpRbWYzUE1pa1B0OUpUcy9TSkxzUDBhTTNHUmNRb29KdDNUK3dwTjU3dlFh?=
 =?utf-8?B?MlN0L3U2dzRQTHVJUDdDKzBJM2lPVGJHWGtpQWwzSWw5R1NaQ1VBcVBlRHRj?=
 =?utf-8?B?eGJ0aDdKYjUvMHFXR0RyNVhmbkFyL2tLdUg1aDRTVERVSDBEUVZBc05uTnVm?=
 =?utf-8?B?WWNQV2YvbDlxMHBjck5pTk53c21SUy8ybVJVRy9HTTluNk5JVWNRQTRFVmw5?=
 =?utf-8?B?VUNpQ0lIVDNsckpRYVVtQXV3L2RkV2NxR2QxbHN5REFYbCt0bml1ajdEL0wv?=
 =?utf-8?B?R2hPdGZyNEdqTUUzUzdHaEs1WmdFdEZUQit1dm5YL01WSUlucGxYSVA3NlA4?=
 =?utf-8?B?SWVLNGk4SkxVSmNBaXprbi9BYWpFblE0Wi90TnQ5K1ZWT2ZjeENZY3Z1OTlu?=
 =?utf-8?B?a3k5Q2V5bDZnRDhzMGtTVkRMV3NQUER2bmFXWEw0UkUzQzVUZ01kOGR5bzJU?=
 =?utf-8?B?c25JMVI1cTNTbFA4dlhqZ2lnd2MwdzdZK2wzNWQxcUpacFJWM2o2LytFWWFG?=
 =?utf-8?B?SW5OTGZxQ0dEVld3Wk94ellvWmg1MWVINmkzckpaaWVqZi9RK2F4ZGYrRzkx?=
 =?utf-8?B?NE1zRDc5TldzQTRXaEpOSENKMGRMMkFDZDNBR0NERnNDcG1NRkFKM1VZOU1E?=
 =?utf-8?B?cXVIWlBiZG1DaS9pa0Z2TWR3UlpXclpjaVZBZzVQK0pzYTI0V0FKc2dLaTdo?=
 =?utf-8?B?bHh5bFdUaXY3VWdTbWNSdUViekpmLzlxYzhYektkbUU2eHNPMERjVHorNEwz?=
 =?utf-8?B?TEtHR1NCeHhqbUt3L0hZKzhzUHYyYjhkMndLbUhkQkJHZGpUVHZiTVRBRTdj?=
 =?utf-8?B?UHd6elROL1c0RXZCUTB2OVhJNjREU2VDYUExRVgxNGZtZUxwQXNNMjE5bWQ0?=
 =?utf-8?B?UXVsMUlsRlZpckdrbU5UUHV5RVJrcFhlVng0dnBBQWpzd2JDVno0ZUE3QVE3?=
 =?utf-8?B?NGoxaVRCODR0dVp2NmNjQ1FpdU91dTZwakZ3UWxHTTArMlQwTjFRQUZYRzdJ?=
 =?utf-8?B?WHJGdHd3a1JTRWN3K1NrVUwvOG0xWGZvWkpqVzNjRG90S2xRbXN5Vk9IejFz?=
 =?utf-8?B?cjZzMXl2RWxkUnRUZVQ3QWNaVk5vc0U0SFF2aXNHcDhvMWphNktpTVEvSEZV?=
 =?utf-8?B?d21ucnYwUytoN2xTOVhKSGo3cFJqYnpIMVduSzFWandWbUluUm94Yy80TkRx?=
 =?utf-8?B?UUtGcUQycVhKa0QxbHl4V1lqY0Z4MStQS1JEUFJqN1JwZTJVNFNPRmQvZW83?=
 =?utf-8?B?Yll3K2NEZ1dRempucHJ0K3k3NHZQeWJ3MkFGWnJFTGkvNUpLeHd3UHoxS3p0?=
 =?utf-8?B?QVZ1TTVNWVUzMDZtdVRkYkRtbk5uc3BPYkZ0ZmdXVUsyTG1uazlkTFUrN0Vy?=
 =?utf-8?B?TVA1em1ORHZwQXd4SFBSNmdqTDBPbkl2NzZIMFVDd0JFZVcwcjRSN3R0ODBC?=
 =?utf-8?B?YnM0Zzd0RXRYcVlnRjJEM1ZEOGl4RTh1WHpBM2h1TjkvY3BuR1N0eTRYTFZQ?=
 =?utf-8?Q?HgK4FAuFM80=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB6701.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bk1SdDF4dGVIZENtUDVQMjVFYnpFK1ZRZyttTW5FSVBlL3V0TjNxUmFXbGVM?=
 =?utf-8?B?VXpOM2VpRGdGTHFHOHRBTXRMMWROTXgvam5BWHI2VGZaTllaVnRTb3VmN0E5?=
 =?utf-8?B?ajVaVnNHcnFOWndZMUQ0aVJkTURRcVNYenFWR01oV1E5UStzVHBqaFB2NEVX?=
 =?utf-8?B?ZVVHQjY4TkdoNERyeXZ2TU9ScktxVllqaUZSdjBBSkxENTk3eGJhZ1RnemRX?=
 =?utf-8?B?RVFobGxta012eFdtVDBZNGUrZXh2Z2huOVovcFJKSHF3L080L2pOZHJwRVNs?=
 =?utf-8?B?YmdmVFBSaSsrN056d1FRTDV5RkQ3VENFSTNULzgxOS9ZR1VxMDlrdFJIdnZB?=
 =?utf-8?B?a1RRbmZjRnFvTHcrWDg0S3ZDZnpyUG5rVTkzVGNadGtWTTVYM1MwYjlLaUVN?=
 =?utf-8?B?RlJLYWFVdDZWOVpySFpaa0NNejdPNE9pN1Z6anVuZG9MdzJTaGkraXZ0UllD?=
 =?utf-8?B?ZzJ1SVIxckt3YVdjRVR0SjVvdjd4Y1Q4amlWUWRHOFlWSWMxMEsrSndDMjZS?=
 =?utf-8?B?bi9rWTNZUlpFODBwUFZvTFhBaTJPZlYzYlpybzlMNGE4MkhicU1PWjIxeHl6?=
 =?utf-8?B?cGlJeHh3dGI3YmhLSWtzek0vS3R1a1RpMmRNN3U0b2hnNG0xSjVaS1N4N0tm?=
 =?utf-8?B?STVyZDBJSCtKSDRzS1dNTDltbVZRWElXOSszbXY0NWFhSDdoSUlqeVUrLzJs?=
 =?utf-8?B?WTJaSll3dnlVSFV5VVl5RXByb3JnRWdJUjZwak1ScHVPQm9LRnZMM0l5eDVG?=
 =?utf-8?B?MzlaeHdSUWxMSWpGWVhzazM5TmRNdFRWam96Z1ZHekxHV1BNa0F5V2NGUHlt?=
 =?utf-8?B?MHlCZEduR2Irb1BhODJRRk1GOC9iWHRxb3o3RUVPT0k5SEhkSFlPMnFPZFRM?=
 =?utf-8?B?d2doZG5HbkJMUEc2enV0dFAzd1FUODhMcFYza2ZNTUZMbUJyY0p1Vjc2Z2ox?=
 =?utf-8?B?UkZwVkptVEZhTUhtUllXclpsa29JV1JRWGozWWxtTlVHamQ2eEdHSkx6YzNz?=
 =?utf-8?B?bGROQURhNHhtSTJsc3FCQ3UwRzZXKzBTa2hWcXl2K0hmWWhvOEJBMUJONDhZ?=
 =?utf-8?B?NHlnempkMlBDZzBjdGpGUzhITFVBbysrenRHTzRtbHk2TjNQOTMxVWhtaHVV?=
 =?utf-8?B?RnRReHZzL2N4VGhzM1A5SzJjZUdPMFI1SlQ3MGxEYXhhUmRRV3hWbmk4U3BI?=
 =?utf-8?B?N1hDQjVWWWdLZWFBY3VDNzZPakVJd3RCN2NJVGZFaHIrcC9wOHJoZjZDMytG?=
 =?utf-8?B?cms1VU5IZ21GS1F0K0x4S0hWQnMwT3llaXhMeFRPRERnYTJFYzRlaWJzdU1C?=
 =?utf-8?B?TG9CaGtxVExDeXgra09LbnQybmhZM3NocFV1NjZwSGQxQ2l3NmdWaWZOLzY5?=
 =?utf-8?B?eWdEcFRFSWk2bTFnQUw3d2VpZmR0MnRaR0h3V0JwZ21kdE1Ka05ROE5sK1JV?=
 =?utf-8?B?NWFVamNvWHdwcUxkdWFaTDhsSFNEdCsxekYrelRvZHJBZFpuVjhYbnJiR1Fj?=
 =?utf-8?B?RVY2UlNtMlEveU91V3M2Zkc5ZkJUSTc2UE81cWF5YkR5SnltcUZFcldLYm5J?=
 =?utf-8?B?dHk0WGE0b3JtdEtCdktudm5HK3lKREJndCtvV2laZlpUTlRBTWhlUDBJdEEz?=
 =?utf-8?B?WHlGSXNPeVZCdEw2Qm5LUnVVNEYrVloxalQyN1hQOFdrMnNFQnRySDNTdzVB?=
 =?utf-8?B?U2cxdDhPUjRtTWtNZm1MNWlPQjdISjBRM0d4d1d5ZGhEdlVTN2NMVU9hV3NC?=
 =?utf-8?B?OStUSmd6TWtrM2JHQkpoRkFlaVl0dXczbjhzN2FkTmZLNlBzeElJODNKbWVv?=
 =?utf-8?B?d3hlNVllQmtCS0UzUXI3cEtsM2VteXNNSU1mMU9aRi9ya25qb1hSWHViR05K?=
 =?utf-8?B?NjV3OWd0NG80VzYyWEg0TzBNRHdLK1RUcXB5WDRNVVlKK0lpUHptTnJUTklT?=
 =?utf-8?B?M0N2bEdBTkFaajRHVU50a0hQekVZdXJzdFBwQlhCTlNnaVRpUXBMU2xSUmNa?=
 =?utf-8?B?WU9MRmx5OVJKSFpPQ1lEYjhReXYwMFRmWHY2STVvUGxEWG9tNHFBMjRwSGxD?=
 =?utf-8?B?bmUzK0RhY0cyV2t2ZWlBZFc3WlQrNkdkVW9jRklkSHBySXVZRm9zay9mZGVJ?=
 =?utf-8?Q?urgcNeaWBm2vV50tKXC6hezaU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57fdcd7e-d4d1-4aed-3e65-08ddd08b517d
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6701.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 23:38:14.3900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qCamP7pv+j1uwQrLhx2bqV+YrCrk81nx22i26YsMvXglT9vOlpNZtd7HCWY1bvRxAM0IskBQ61ODAQoJrdUasg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9636
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

Plumb the format info from .fb_create() all the way to
nouveau_framebuffer_new() to avoid the redundant lookup.
Also plumb the format info from there down to
drm_helper_mode_fill_fb_struct() as required, avoiding
a WARN_ON() and failure every time this path is used,
e.g., during fbdev init.

Fixes: 41ab92d35ccd ("drm: Make passing of format info to drm_helper_mode_fill_fb_struct() mandatory")
Signed-off-by: James Jones <jajones@nvidia.com>
CC: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/nouveau/nouveau_display.c | 9 +++------
 drivers/gpu/drm/nouveau/nouveau_display.h | 1 +
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index e1e542126310..805d0a87aa54 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -253,6 +253,7 @@ nouveau_check_bl_size(struct nouveau_drm *drm, struct nouveau_bo *nvbo,
 
 int
 nouveau_framebuffer_new(struct drm_device *dev,
+			const struct drm_format_info *info,
 			const struct drm_mode_fb_cmd2 *mode_cmd,
 			struct drm_gem_object *gem,
 			struct drm_framebuffer **pfb)
@@ -260,7 +261,6 @@ nouveau_framebuffer_new(struct drm_device *dev,
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_bo *nvbo = nouveau_gem_object(gem);
 	struct drm_framebuffer *fb;
-	const struct drm_format_info *info;
 	unsigned int height, i;
 	uint32_t tile_mode;
 	uint8_t kind;
@@ -295,9 +295,6 @@ nouveau_framebuffer_new(struct drm_device *dev,
 		kind = nvbo->kind;
 	}
 
-	info = drm_get_format_info(dev, mode_cmd->pixel_format,
-				   mode_cmd->modifier[0]);
-
 	for (i = 0; i < info->num_planes; i++) {
 		height = drm_format_info_plane_height(info,
 						      mode_cmd->height,
@@ -321,7 +318,7 @@ nouveau_framebuffer_new(struct drm_device *dev,
 	if (!(fb = *pfb = kzalloc(sizeof(*fb), GFP_KERNEL)))
 		return -ENOMEM;
 
-	drm_helper_mode_fill_fb_struct(dev, fb, NULL, mode_cmd);
+	drm_helper_mode_fill_fb_struct(dev, fb, info, mode_cmd);
 	fb->obj[0] = gem;
 
 	ret = drm_framebuffer_init(dev, fb, &nouveau_framebuffer_funcs);
@@ -344,7 +341,7 @@ nouveau_user_framebuffer_create(struct drm_device *dev,
 	if (!gem)
 		return ERR_PTR(-ENOENT);
 
-	ret = nouveau_framebuffer_new(dev, mode_cmd, gem, &fb);
+	ret = nouveau_framebuffer_new(dev, info, mode_cmd, gem, &fb);
 	if (ret == 0)
 		return fb;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.h b/drivers/gpu/drm/nouveau/nouveau_display.h
index e45f211501f6..d569240df354 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.h
+++ b/drivers/gpu/drm/nouveau/nouveau_display.h
@@ -10,6 +10,7 @@
 
 int
 nouveau_framebuffer_new(struct drm_device *dev,
+			const struct drm_format_info *info,
 			const struct drm_mode_fb_cmd2 *mode_cmd,
 			struct drm_gem_object *gem,
 			struct drm_framebuffer **pfb);
-- 
2.50.1

