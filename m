Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePPiFchdqmkVQQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 05:53:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DE821B8F6
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 05:53:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43D8E10E36A;
	Fri,  6 Mar 2026 04:53:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mGqUxlSz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010054.outbound.protection.outlook.com [52.101.61.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1999F10E36A;
 Fri,  6 Mar 2026 04:53:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tuOmbKn/f/AVPCE1qT1Cz0kCfVO6c11n2voF0kezWjkK8eqmoEk8NnJ9v1GMh//9wOjeEfq3P23SMCaiRAmw9MyuC/Sw4mKxFjiTvNIjXUKOvO/LVj94M8HmID1oyKeyrMoxQ+DkegmWFeyCXRCpmPNInaeRtB/Nm3uLrZ2wrwNCWkAx/TYCBnRMMSddTaXXpxIYOEYrNbcP8ussVgVi8peUZaZO++/WRcyxLSP/y2apQ8ohVUDqW879Qpgz9siKc/3W0Ned5fAsSoYofjTimuQiVvYhePEbIkHc28F3zqYtZTuECq3azz7PId0QolhM32DkEwadEmnCmDfXkjMPQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQSgrAt1rQredlzwinxJILhkl8qxl55sdHyA0ngNSyQ=;
 b=oe05f503r3LGwV/Y+tL9tJ8+SDVwJkCDailX35oAeSNnDWb1Al9fPbYmp4YTz7Pl+PTq9EihAgHO+9gHkffA9O07/AByCYipxIJTCZlja94TsR9D0ndj42XN7Wazo/t94CAh61h1dIGakAnOgB7IC8SsYsxZGtHn01MPx0ycj8bWpx80yEWpJ3yWkJb+NnVA579QLnLttDvsBro2nxbGpQL3D7NaleZ5IOb6G2H7IceQFAqfwcSzvKaMPsaUW45CZ9SBCefRN3a6EaXNM6yiib+a6XKQMY1VwFriLTPlkq1jTZhrrCanUC4qRESwIdMetzot9r/NH8Wgqu+nMLvUUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQSgrAt1rQredlzwinxJILhkl8qxl55sdHyA0ngNSyQ=;
 b=mGqUxlSz5KDrCLYBF3qBZqeqXbSIEFIir+JYhaddI8jWPkyo0Slu5gyefoWrHGUz/ud1tbh4J4MPet5GwF9xzU+Xp30I5Xn08ZE0934Nu6rblLdP5rz9KsO3Y730PyWK8gofn15rgvbu0EdNuDXSiHDoleyH9DIyy200e+umZwzPsgGUbb7JlBUz3+HadSQSD9JqgGnTVIXv3ZzVtmGbY2f4xq7YQubfveFkz1nr4LOYqz4DdiPVoU3jfVPU/eWIbI6sqKJuW0ZD2w0q1vv8ofclxA4DxHvGqxK7uUsBK3DpL7e3lj0QthPlfSZThxcZAo/JS9Jccy2sHLoi3dyCbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB7554.namprd12.prod.outlook.com (2603:10b6:208:43e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 04:53:22 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 04:53:22 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 06 Mar 2026 13:52:46 +0900
Subject: [PATCH v11 09/12] gpu: nova-core: firmware: fix and explain v2
 header offsets computations
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-turing_prep-v11-9-8f0042c5d026@nvidia.com>
References: <20260306-turing_prep-v11-0-8f0042c5d026@nvidia.com>
In-Reply-To: <20260306-turing_prep-v11-0-8f0042c5d026@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCPR01CA0190.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB7554:EE_
X-MS-Office365-Filtering-Correlation-Id: 13b39660-0be9-422e-5f6e-08de7b3c4b2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info: NoAgsgm95NlNW099THYkvSeWpJElvbt+C9UyNnA7GEtSFcAF+k4g6AOfDiffr7TgYRZ1GNi6iiiInl/PkQHnYMK+88pUpfmY65ef7+xjqtRD1UfSR9VizGi7XBU+HuAodp2wsjGUTY66riNZ5nW8vLTiU7RDOtb3PTKSUJJBCzlzm3ewYGdpKjfwnslEJYDyR62LHOkzCwq95D4cXi7f4IKKneTmYNYIaEdIGkV9mKw0Fiovr8TFr6m9m6uxg8ZmxxYrrjv9+IP5ORlbikQJ9j5I+KETxzL/mPXz1JQxNu8bgqLN9ujzWwebqSFZcCu2LbFZWNfVAD15ss/tcKyfpclyBE88dd4yZwoPmwYwtLSaFYCsWNgFayWUwYhlZls0kMJu7MYmUnlNrz+fCcIf/kF+EUXg8QNPx6VeUql034oo/Ci470fiVbwsE+qyTg2o0JmBuwJhM7Z1lqdmDZVcthkXO2GvA5eS033T6N8FPfmvATDct9GjbvmXUOTnlqHwuJUmQg2bA9ntY0OiIWC//qKOI7QESeTyovPdH8XECYXXJQQMwW8LrzpUQrqnWFrESG1cpHnBz8W3W+guSiKOd6h0/9pTGdVPTDdy7+OXi/Ion6FYkDlak1Z9bxkrNrSY8LrMIva9/fre+jJn7J7elZUy3xnQKBMdvkxFCsw+4pJT+XkY1qzbJNClrITDHZ7B42nGUJZAa9yqVlDtkz6HnNRmGDYlBNIJDjW734CYpcs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(10070799003)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkhoT29pcmFYYmYzRW50ZG1rTzhCWWYzT2JJaHNGMEFlN2RCYmRGM0VDWW03?=
 =?utf-8?B?dlpZTmhmL1lXS0pUZldjS04yMDF4OFlvcW5Xai9XVlFMOFA1V215OGhad3Iw?=
 =?utf-8?B?OXRkekVKc1BUekE5bllBanpybERzaCs5Y1JaV1NDN0ZKcFlMRU92Z3MrU0NZ?=
 =?utf-8?B?Tzk5MzRJWWc0MjNwNWJlOGNPQ3RiajR0YnZSNnV6M01kVWtvbzk0YjZCL3dk?=
 =?utf-8?B?S0tzbGlrRlJucWRjRmpkdFBPd2tXR2FUeUZIa2kvaTVZWVpoNU8zeFprRG54?=
 =?utf-8?B?M0d4cjNvT3BPVnRzbjA4Qk91K0x1S2cyaDI3ZU9tajFGc0o4WjZSUTRLRDl1?=
 =?utf-8?B?cFZRWDdtNGZ4L3VBaE1WTXgwRGFEK25QTXVEM2tvcEJxL3FleExxTkZlbUpu?=
 =?utf-8?B?bmZlKy9nY3Zyb2NuS0F0N1ExUU90WUROYVJVZTlqODNmREh2Y3h4b2pLaThU?=
 =?utf-8?B?cWZpT2ZPbEFLS0x3MjUwclh1Ykx3K1kzb2UwZ1hYQWt4S0QrQUw4M2VINnRY?=
 =?utf-8?B?UytKM1J4VStwUndNanV0TEZET2NDZ3NCZ3pMNHBzNGRNdDRQQVVoYjRRK2pT?=
 =?utf-8?B?QThBeUdmSCtqOGF2TytnOGJSM0RGY3lNYUxlYjJJQXBhYmhMeTZJREhNMTRi?=
 =?utf-8?B?bENiUGdGMXlTNVVCdzZuV3V4V2hQb3U5SXl2T28xc1BWaE9QSjhrYjV3UTRr?=
 =?utf-8?B?TnNiSXFYaVBlb3U0cy9Gem1NOXI3blBGQ3lIWVh1UFJuNVh2TjhCWkNLc0Ju?=
 =?utf-8?B?aVkyVjdOZWlsdUtHOVhnUEpDNEkzYmg1N2N0QncvL3NiNVVxNHpmeTVZcGt1?=
 =?utf-8?B?bnVka2ViNCtRTGFTaWx6OGE5ci9VVURZaHRDU1dLWG5tM1R6QndPUlNPLzNF?=
 =?utf-8?B?aGdvKzMrR3VObmRrSFRGK0lyWUhKY25oRWdHNFpjdzlPOXowVWI4K3FvZlN1?=
 =?utf-8?B?VFhFQmVrdjlpRHFpL1RUaUhKUFA2bm5UMVhtbWN6RDFjelh6QXZKU295MWpY?=
 =?utf-8?B?TjhBeFpEY3VoS2xRWlQ0NnVFcTZnOWREL0p0UWNqSmo1emRCVUZPZzhUcnN0?=
 =?utf-8?B?M0NDbGs4bVN1VmpZNzArdkE1czlmMTgvSER3ZytRNEs4SVFKTm8wQ1JndW5U?=
 =?utf-8?B?Ni9Pai9Kb0FqWXFOZ0NyeEFWOWEzb3E1aTR5WjBEQ241SE9kbnpCcmcvT0tq?=
 =?utf-8?B?Z202bFdyWVZtTnByUU9nUGJPQnFMM3ljRnIxRCtMNGh6WEhqOEpHRWd4MkFJ?=
 =?utf-8?B?bkNrZVRGeXJJYkRLZDJHa2FDak1zQU9TY0hXWE8wWnVCbmNDTzI5a2ZvS2hM?=
 =?utf-8?B?U29mZXFSeFNpU284OVlRd3lwMCtwakhaWm9qVDZObXZqck9zaUdRc0RLVVVX?=
 =?utf-8?B?L1FLMkEyVkFEQjgvTWxVdHJVL1dBcko5MWZZeHYyb1VVVGdxWXNtUU1mc1JQ?=
 =?utf-8?B?ZXlPeDUxV1FpclhWS2VyVlVzZjF0L0tyaXlBOWpFdGhlWGVUVUpybDFSQ0ZD?=
 =?utf-8?B?SmV2M0lqaWh1WFNPeFUxTFJReXVCYmV4RHpXNUwrZ2JiR0dGYjZhU3VURFlu?=
 =?utf-8?B?dThUV2ZwRDZaU1FwVG1LcERvMWx5bktqYlcyZlRWRVZ5T3dUQm1lNU9EYWtQ?=
 =?utf-8?B?M25yRGRKWTk4Nkc1RGxVQURybG1pcEIzb3F2MXN4MWxtWW51OGxlZTNoWDNr?=
 =?utf-8?B?N3BsSHlkQUppN3NrUVdidWRTL3J0VEFqU3NONTNubGt5anhVNVdIMjE4aERC?=
 =?utf-8?B?YXJFYUdXRG55WjFQMzd3My9Ddkk1MmZNMjhvKzlmMlFaakVWZ0tYNlVyWWZt?=
 =?utf-8?B?SHgxR2g4Wm92b3dzMTBFVnZyMmVaVEladGQwcStsUGVwRzJHZXRrUjlEYTFq?=
 =?utf-8?B?QlVQZjFXaWprYkhtTUJpM2FCTkw1L3dJc2ViSmNpZFVyQUNpemFtQ1hpdmFL?=
 =?utf-8?B?bnhydktTYnJaYnlHS2pVMXFKck1nWjVyeXpIN1BYb1hadlNRWk9qeUxFTDVK?=
 =?utf-8?B?Sk5iZzZJRGpmRXBkbWlVazVpOVcyZkZMS1hJTE02dzFHSDZoenJNNmd0NUFN?=
 =?utf-8?B?Y3RCRjNuYnBMMW1EUmdYM1pJeThWb0M0Tllhd21IV1I0a081TW1kQ3NqV3JM?=
 =?utf-8?B?bk1KL0dWOXhlVm1ReFg2emlpbXNXNzRKMk8wdTQwWnlxS3U0dzh5dlVLL1Nq?=
 =?utf-8?B?VkJVa0tjelg5MmMzOFY4NnlRZXFxUjNmeW5zNFUxbjUvWGdsL3c3ZFp0MVJk?=
 =?utf-8?B?ZVFLeWVyLzRKb1JucTRHa0szR3FDenoydFpCdGQ2c1dWZTBlR0dkUEpPRUVE?=
 =?utf-8?B?SHY3bW12UVBoKy9tMTdHTG10VXpRblIxL1hjQ1RlemtSdjdISVhCcFM1alpK?=
 =?utf-8?Q?JRnczSRvkvtFyE1Jbd+j8ApuRNeBOSdyXWcGVYoFXFewI?=
X-MS-Exchange-AntiSpam-MessageData-1: 85hZ//6l23MFWQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13b39660-0be9-422e-5f6e-08de7b3c4b2e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 04:53:22.5382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hrIbYBVmpCBX59OGMl/JVfQCTgEp9iVTD14Q9FmKEJ2KmwdLEt2YDbyQTFK/HSD9x3hjC+fS916zqvjK4n2bDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7554
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
X-Rspamd-Queue-Id: 08DE821B8F6
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

There are no offsets in `FalconUCodeDescV2` to give the non-secure and
secure IMEM sections start offsets relative to the beginning of the
firmware object.

The start offsets for both sections were set to `0`, but that is
obviously incorrect since two different sections cannot start at the
same offset. Since these offsets were not used by the bootloader, this
doesn't prevent proper function but is incorrect nonetheless.

Fix this by computing the start of the secure IMEM section relatively to
the start of the firmware object and setting it properly. Also add and
improve comments to explain how the values are obtained.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index c2b24906fb7e..5e56c09cc2df 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -63,7 +63,8 @@ pub(crate) struct FalconUCodeDescV2 {
     pub(crate) interface_offset: u32,
     /// Base address at which to load the code segment into 'IMEM'.
     pub(crate) imem_phys_base: u32,
-    /// Size in bytes of the code to copy into 'IMEM'.
+    /// Size in bytes of the code to copy into 'IMEM' (includes both secure and non-secure
+    /// segments).
     pub(crate) imem_load_size: u32,
     /// Virtual 'IMEM' address (i.e. 'tag') at which the code should start.
     pub(crate) imem_virt_base: u32,
@@ -205,18 +206,25 @@ fn signature_versions(&self) -> u16 {
     }
 
     fn imem_sec_load_params(&self) -> FalconDmaLoadTarget {
+        // `imem_sec_base` is the *virtual* start address of the secure IMEM segment, so subtract
+        // `imem_virt_base` to get its physical offset.
+        let imem_sec_start = self.imem_sec_base.saturating_sub(self.imem_virt_base);
+
         FalconDmaLoadTarget {
-            src_start: 0,
-            dst_start: self.imem_sec_base,
+            src_start: imem_sec_start,
+            dst_start: self.imem_phys_base.saturating_add(imem_sec_start),
             len: self.imem_sec_size,
         }
     }
 
     fn imem_ns_load_params(&self) -> Option<FalconDmaLoadTarget> {
         Some(FalconDmaLoadTarget {
+            // Non-secure code always starts at offset 0.
             src_start: 0,
             dst_start: self.imem_phys_base,
-            len: self.imem_load_size.checked_sub(self.imem_sec_size)?,
+            // `imem_load_size` includes the size of the secure segment, so subtract it to
+            // get the correct amount of data to copy.
+            len: self.imem_load_size.saturating_sub(self.imem_sec_size),
         })
     }
 

-- 
2.53.0

