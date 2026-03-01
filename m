Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0jCuHm1HpGk8cQUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 15:04:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C46E1D0187
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 15:04:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9EF810E3D8;
	Sun,  1 Mar 2026 14:04:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Z+/K4iaz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012009.outbound.protection.outlook.com [52.101.43.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F8A410E3DA;
 Sun,  1 Mar 2026 14:04:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mvhvTJPtEiIEuRh4XBuJKqYeVoPJGFLJv5LXn3b6zOT9nbRhXnemHc7dbhCUTwyzzHHnFVGphLWjKPaTpudw0XphQG8rLsKmjryN4k6WqGZ4b8dEqTgoaQqdN5UFATzxYwenX4MKKQYObWZisYvmn7KL5zvmmkTFrMCadl6m4aOx6PfzS28FfNiR20wt7PmvdiVoTYxtL/uhtCjnwJP/y7xFuLJYSWBnFwEr4d7354CNFB3tGzsf+y+01d/an7A2CENq9mCvIr3cRAtBDOsYfOlYMdI448VnZQVynlaBB8Iofo4tHp1uksna0lkDcSf67j7xL5Y2zYgP6WXOJ3CJbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+X5sNU6wYFcq5pGXZfVIeGBeYeVrgsV8nc6nc0dHzQ=;
 b=JA6cu/SKl4NdzeKdE9w1rCzMaaSKk8XgT9kOiEW1GXes7sphiEcxFBvC5BVBNoge7SZ24Bl0h/WjZOI3opqKX3+JRA3dcWn4JeCMq+2tMPYjZxIDPY683S+al/XT0cb0au6e4eUUOQFDlTPagDdgBswj3kDsc9rLpMK/K+AqABD9ZkWbe9bbYvhXLhcspD5oXpIjmoas4HUQNsIXAxJB4pEoO7ApLBoDXukCS4bnIKu2zjbbNVqhn7kh6uIqPmZCRIMeH8kxGrTeDl1HLdajS0ceyZz73pDfNJU/aueZwEeAlvEGDzhu7wC9bpHTxKvIIeiPziM69Hyf3NMAneCXEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+X5sNU6wYFcq5pGXZfVIeGBeYeVrgsV8nc6nc0dHzQ=;
 b=Z+/K4iaz9AOfiJhhvh7+PPmPUfpGvxJjXPlD3ISpON97taHVwCSctgS52CSL4ghvgXUUyqm69CB1T2pDe8EnbrxenTM5mdyKPTUXzP0GBkMRkbCIkc05fZ/i9bLu38wHqhtyWdiYEKz3CoLvp5vnUFpehE4JljAZxzSHSVOsYZEw6+ZuX5DAJL1mVNPIFSAa/AVLwN0qyx9FDMzEMMQUEz9oRFIyDAH08Y2cnPJu/MeES5YNdrqUrpvsV4TeJtN/BOX/xluKdFpOJClKQw5lhz8oOLlviZ5zHZcliPKnqQruTlsdD2FU6hIbCxPCYcaYAjJtlmi1g+bms+rHsYrSUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB6632.namprd12.prod.outlook.com (2603:10b6:8:d0::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.19; Sun, 1 Mar 2026 14:04:22 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9654.020; Sun, 1 Mar 2026
 14:04:22 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 01 Mar 2026 23:03:49 +0900
Subject: [PATCH v10 06/10] gpu: nova-core: move brom_params and boot_addr
 to FalconFirmware
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-turing_prep-v10-6-dde5ee437c60@nvidia.com>
References: <20260301-turing_prep-v10-0-dde5ee437c60@nvidia.com>
In-Reply-To: <20260301-turing_prep-v10-0-dde5ee437c60@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0374.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB6632:EE_
X-MS-Office365-Filtering-Correlation-Id: e6c3cdbd-8840-4d94-9b21-08de779b704c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info: 93RuhsVdYh/6/IHzhoctnKlLxrEcfghrjHN82th1vA7J6GBqWcwHYOl8A1bCOzTyg+zt8ZiWr2areI2uo+isQoElseC3fO8J/Xojo2bOupH51zuMF45sUxxgdPCeskMJchzPOk8RxGNeG2Irzl5Im6oBG8wvasIKYod6YZm3ud+PEYMGnnGh7DanZ1MXCnowHhwmNelaQcZfuWmwfO7d+7UU+ptI6YoJU/kNujwDJ5fhYchAXJn/qskC2o/jMsIDFg9g0qpdW4GJN7huVLBHecuPx/9gno8QphjwCkleR42N0pvlU1JByEt0pjPwudliNugckFITU7mmWXoo09giNPqXj1QURnGdKxCtd0AYOzIKCFrf4QoXMBM0k2XYJ0/lvUbBDYNsfLyOTeRf8T+aKYVAXU4NtAbgBRrwDPKSeEPg2fd+w99XhIdpq4zl03UZFFb2nH4mMD1Dvok2u0B99LmNxKBXx58xJKgh2pfpJDfUNVM9vtUiSzL0Wf4Hpszx5Q7j+VXITBPU42Yv1ARO79FAKUXAZnw6l94gdQrep/IbCQruRCqu0ldFc5wR+4dopNYn4liCtHW7RVSiSx8dRpEtpUVg4dQ9ycn2Toi1Y1oWcooK6mi2M0fzyE1ci2T3ADHIlX5PqXbzVwV04f5Q77tJWeBbj5N1fnqrckOsvJhPglkqNBgvWMpTtbYdz9ubfDv/usq48cWein3nKgw8hJ61lbj1ndAX0UVdJRZ47Ws=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVlEMmtueUdMdkIwMGJRZ3lZdVJCRmU3UkFtWlZ3S2t1bjNFMXllSTd0YW9V?=
 =?utf-8?B?bFpTV1hualFuWnprdVU2aWtnUEpwMlJLTWcveEs1dUdiR25xSTh4VVExM241?=
 =?utf-8?B?c0xQUDcycnQwRVZKMUVYUTUyeHp5b3ZXM2ZzRWdxbXJ3VFJZekt3Z2I2OXEv?=
 =?utf-8?B?ZzJoeEtXR1JpK2Z6VFhlSmgvSnBSSEZJa1NNUkpaNXBta0VCcVhFci9SMUVr?=
 =?utf-8?B?Zmtvb0xCV0oyM29WTmZRTWw2VVdrQmI1cFQ0LzdxZitQbStjbzQ1VWhvYVBM?=
 =?utf-8?B?eHFsZ0pnZVYwdU9aaEJQdGVwbngwczZ0dkVSM0UzTUJ0emJqSHlmeXdXcFpn?=
 =?utf-8?B?LzdzWm9pcUJUWDdGWTIvNncyNEk0dkJUV1NpK1pSYytzamFqTnhWUldNOXdR?=
 =?utf-8?B?aGNidHBZUXJDT0ozbklObld0QkVwZTZVdW84Q3dpakFBMWh0eThXS2hzRlF6?=
 =?utf-8?B?SUJ6V2R5NFZNMWw3cDMrQUVJUFk2L1l3b2lkd1QvR2lZYzI3eUlyRk42WDlz?=
 =?utf-8?B?d25QZlExWllLc3NXb0h3a1Z6MmlxNW1KbmV3aXpPTE9LeVBCSkRDSFZSTlJM?=
 =?utf-8?B?b1JyNjNwNEFkZDdzaDdvWmk2SFhZR2dtaEVXSUNKS2hhWGFZVUN6Wk1KS1lE?=
 =?utf-8?B?c1BiRXp3K0NTMzFseTg3QUwyR3hFREhaUlI3UFpReDJuUFkzdzRRTVVwSXha?=
 =?utf-8?B?b3hQQmxSSzJLNVVpTENKd0YxRGdJL04vMmVVdGhDb2hPZXNGMHVYWG90bWcr?=
 =?utf-8?B?YWhWbEJVZkh5akxyeUQzWEJUeVZmMThScW92L3ZKSXdNS1ZDUXZyQ29Ia052?=
 =?utf-8?B?TkxUdm84TGNWYnRHWEpvbThJd0lNcUdpbGR2TEtPMTJTVldLSWJZTUR6WkZt?=
 =?utf-8?B?ZFcwMllYeWI4WVJuaDVpS0hzei9DaExnYjBCT1ZpTFlYUTFNZXFrQTZydmxK?=
 =?utf-8?B?SHU1SzdLT3RBdWRZOGtIQWVOeUc3R0dkQWZTckpsZHB5OW8xNHRkdTJhTGlq?=
 =?utf-8?B?bGNJMDdJcElYSzh5M21YWiszUnRVWE9nbFYyVDl3bVd1dEkvZXp0eU90QStY?=
 =?utf-8?B?cHVsVU15bmRSZTZtV0pHUmt3dzMxN29XeDhyZG1OdEZINy9tcTN3czNsaVh5?=
 =?utf-8?B?cy9NV3czVjJZVmVaQ2V0ZDM5MHFIYUtSZXRJUG0wV1RCc2p4M3VHOGw2am00?=
 =?utf-8?B?NHdNc1BKZFozWWpWQUdsaVpuSHBJS1hyY2NHNjFlSGNmeVlQQWhSdmJ1QlBW?=
 =?utf-8?B?eThaaThJbzI2NVduaXlDbndwUEVwcGtJMmhoVGd6SXpFL2JWWG1CQWowZEJ5?=
 =?utf-8?B?NHM5ditPTmpPaW1MRnlLQ2xYOW43b25vNEw3QS9jbE1wdjIzR3Vld0dMUW4x?=
 =?utf-8?B?SWc1ZW1mWG5aaGRNQjdxODZhd1Y4Q3pVbFRHL1FMZ1RTL1hEbkREZnY2dHBh?=
 =?utf-8?B?RHMzK3FYUzRNaGp4OXgwWENXemNBdnJzZm9nUnBsUHJ2MCtBVHFPME4rYnBP?=
 =?utf-8?B?NUtpSzNZRzB2YzlRaEF2c01VVlFkUElibzVGcDAvNzVValQ3MnRXM2ZYbVd0?=
 =?utf-8?B?R2llUUM0by9ZbWRVTHRjUUZRR29vOG9kT0h3QkZkZU54STRqS3NsYzhTNC9t?=
 =?utf-8?B?Tm5IWVN0WFN3b0g0NjlBREhMaWJPSjF5U295ZkZGdU40ZVhTMDUzQm1RN2Z2?=
 =?utf-8?B?ckJXZHpUOU5FU2NwOTZVVTU4S01hZEtBQlBlUERGa0xDTlRtSEY4THlWZ0xz?=
 =?utf-8?B?aGcvVDArVEthVW1ZZ2IwTEo1K2JSeGNTajR4cUk3UHBVVE5CV1dWaERyeThY?=
 =?utf-8?B?MTdBYm1UdkFMaGtqdzVDcHZITmJVb0hZNDdqd1dUeTA4aHJYQ0swc1FZSkFr?=
 =?utf-8?B?VDNjWnJkcUcwVHRYbDZPOCtHVVFOV3BjM0psZGR2UTNCam5pOGJ4MklhYnVv?=
 =?utf-8?B?T3F2Vzl2TnRiTTI5dDkrcE5oeFJSaE9MS0Y3eEpxL0NvMXJPdXhqNTJzditi?=
 =?utf-8?B?MkJPTHN4UHdCMlZRbkMyRnhHalJqUXlMaENTR0FDdHg3aUVnNXgyemFSSXZL?=
 =?utf-8?B?MURHcERtdVlXSmROeHhXc1J5MUJEZWZ6NyttS2w3OERrVjR1TjhJeTZ2V1VH?=
 =?utf-8?B?NzY1OXlmUjV3bjM5QmVFcDhycDU3QlVmV2lnMkkrci9icTVBZWpLQno5YS9U?=
 =?utf-8?B?RlJDUm1yNmF5cjRFdmpMOWhQTjNoR0VqVlJlc0d6MUdEVi82WjVZVmdML3Za?=
 =?utf-8?B?TVdjdEJDemFvSk1xNkxOOE9mMmo5aU4wZ1NCOWNCclREeEpseHdXTEgxVFhS?=
 =?utf-8?B?Sk5MRmlXVDdUYmx2TFFrNjFzSVVMV0NqWTJOaEdTU3Y2bE95SitqMlpueUk0?=
 =?utf-8?Q?y1W2kXWuOgv9Cyq/wBvodYPf8pnkeBKqhbm0kOwJJDRSi?=
X-MS-Exchange-AntiSpam-MessageData-1: m6GdNRDUr2obtQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6c3cdbd-8840-4d94-9b21-08de779b704c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 14:04:22.2092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nZj6t/MMGXFnwU3GU0HWkuzDlvPBFv8IYyNKBuCk5YF8WxUVkrtrhr4P9hB/hegktT96/IgZW/BvMzM8Xzwo2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6632
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 1C46E1D0187
X-Rspamd-Action: no action

These methods are relevant no matter the loading method used, thus move
them to the common `FalconFirmware` trait.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs          | 12 ++++++------
 drivers/gpu/nova-core/firmware/booter.rs |  8 ++++----
 drivers/gpu/nova-core/firmware/fwsec.rs  |  8 ++++----
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index c02b73b1cfe6..53ee388f88be 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -367,12 +367,6 @@ pub(crate) trait FalconDmaLoadable {
 
     /// Returns the load parameters for `DMEM`.
     fn dmem_load_params(&self) -> FalconDmaLoadTarget;
-
-    /// Returns the parameters to write into the BROM registers.
-    fn brom_params(&self) -> FalconBromParams;
-
-    /// Returns the start address of the firmware.
-    fn boot_addr(&self) -> u32;
 }
 
 /// Trait for a falcon firmware.
@@ -381,6 +375,12 @@ pub(crate) trait FalconDmaLoadable {
 pub(crate) trait FalconFirmware {
     /// Engine on which this firmware is to be loaded.
     type Target: FalconEngine;
+
+    /// Returns the parameters to write into the BROM registers.
+    fn brom_params(&self) -> FalconBromParams;
+
+    /// Returns the start address of the firmware.
+    fn boot_addr(&self) -> u32;
 }
 
 /// Contains the base parameters common to all Falcon instances.
diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index d569151982d1..7bb732aa4cd6 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -414,6 +414,10 @@ fn imem_ns_load_params(&self) -> Option<FalconDmaLoadTarget> {
     fn dmem_load_params(&self) -> FalconDmaLoadTarget {
         self.dmem_load_target.clone()
     }
+}
+
+impl FalconFirmware for BooterFirmware {
+    type Target = Sec2;
 
     fn brom_params(&self) -> FalconBromParams {
         self.brom_params.clone()
@@ -427,7 +431,3 @@ fn boot_addr(&self) -> u32 {
         }
     }
 }
-
-impl FalconFirmware for BooterFirmware {
-    type Target = Sec2;
-}
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index 2ba70e0c5a30..07404164ef12 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -196,6 +196,10 @@ fn imem_ns_load_params(&self) -> Option<FalconDmaLoadTarget> {
     fn dmem_load_params(&self) -> FalconDmaLoadTarget {
         self.desc.dmem_load_params()
     }
+}
+
+impl FalconFirmware for FwsecFirmware {
+    type Target = Gsp;
 
     fn brom_params(&self) -> FalconBromParams {
         FalconBromParams {
@@ -210,10 +214,6 @@ fn boot_addr(&self) -> u32 {
     }
 }
 
-impl FalconFirmware for FwsecFirmware {
-    type Target = Gsp;
-}
-
 impl FirmwareObject<FwsecFirmware, Unsigned> {
     fn new_fwsec(bios: &Vbios, cmd: FwsecCommand) -> Result<Self> {
         let desc = bios.fwsec_image().header()?;

-- 
2.53.0

