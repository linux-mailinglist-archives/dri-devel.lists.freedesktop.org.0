Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOPyOEeOp2nliAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 02:43:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7858C1F99C5
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 02:43:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C729B10E929;
	Wed,  4 Mar 2026 01:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="F0DKuyKi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010036.outbound.protection.outlook.com [52.101.46.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04ED510E920;
 Wed,  4 Mar 2026 01:43:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bc5SxJPvcgtmU0n3piqHjC6JOR5oeXeMTfkshOQ/B/KV03iLerwSAeK3+bt3c7EEROWIp7BzPyX9oxK3Eh0iCTb9M42jhB9musIjliYhbuDxqIpxFfPf97BgQtaaqNF1e1sg8ZPiVeMkJaAMflp3geojXN6XAHb22KcOAJO7FOGar4DJHqmTArBw4aqhUgxCTUIf314UGNtJPefrhxrZCVPoD4k+QJuK6ZNkdnC/RcqvLZReERP5bGZghZWyTr3zZGrts4Eb/p92m3UXMB7tQSei5MZm2Vy4FOBho/N82+XcY2Ytj7FjuUCAJZAZ6Hj8u9AeKckRd+wIEKG0cN10Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4LABRfZ7HpFASrMkxjSXfJNsXo//wBsS+KMqHX66Ux4=;
 b=BJHKVX20nNczL6LMb35LL1s8Vwc+4xqzc97Nb4cd8mxw0+3/T1QPIpSDCpzkBWpGo8HyGuVK10iEYvXzKwliWjxyHBU4hqhu5Qm2OJU8L3msrBkZnpzfwqX5Wlh1EwfYPGv7qn3ituui+fTBUMFcuqIhOeCRFdrGAbJAoiv9y1LvDg2/4gSriURaFq/sbG7VkUNL/XOMOchaINgoPdB+jyNYZCK+yhQ9LgPeiUGBmkice8uoGmtS90ZsuAdkeX7M2zlaICEafGqjzh+DCeSPfNjhRQL2JKJnTXCgXgnN/2vrg96LoiIdwgEJa/eUSFmM/VLgDCHlPeU4pwdrUTpEeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4LABRfZ7HpFASrMkxjSXfJNsXo//wBsS+KMqHX66Ux4=;
 b=F0DKuyKicgM3bxWJuup+QJk8aNSSKArav3OWy7g68ABxm7DmVwm/Srh007M93VDnQW/PcCx+nz57WNZzrwXZU+YBKUo0AY2Oc1T7fI3XpwRAzuOJodi0Iwz9LwannM+3LAu25eEa8WKo/q5bSjf63vnwxvNT6afuwVmJXrKIGVNBSw1mwD9ZM+888+6RibI6Zfy7GM+o7qZyylZSl1ynrnQwBYOZPCVUdFRfa87DFDB1oYcESC5Vt8S0Rr4uYycYlF0t4bI/WDgnXdHAry6qGpzPsyoszLlCM6NugEp/a4M9k4pKdMV/av3Y9Ms8wj8A79wbgmZWHDdMsea1wg9dAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by BL3PR12MB6545.namprd12.prod.outlook.com (2603:10b6:208:38c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Wed, 4 Mar
 2026 01:43:29 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 01:43:29 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Wed, 04 Mar 2026 10:42:22 +0900
Subject: [PATCH v5 6/9] gpu: nova-core: gsp: unconditionally call variable
 payload handling
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-cmdq-continuation-v5-6-3f19d759ed93@nvidia.com>
References: <20260304-cmdq-continuation-v5-0-3f19d759ed93@nvidia.com>
In-Reply-To: <20260304-cmdq-continuation-v5-0-3f19d759ed93@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: Zhi Wang <zhiw@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: DM6PR04CA0017.namprd04.prod.outlook.com
 (2603:10b6:5:334::22) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|BL3PR12MB6545:EE_
X-MS-Office365-Filtering-Correlation-Id: 96921876-6915-4c4f-6143-08de798f6f8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: 50LoA0/YsQFFnSS7JfbTQpkjknd67D/fS/1JOAR9tK2dHoO7mq1jncvShmDQp/IYcToZVhhXD1kl3yuZKW7XluPlXp8qmozZXd9YCv4e30i3JcrGpEpxRFkofSh5lgTSDOQhMw0V2C/JA7pXnX0k9RVWq5lUkxORm3H9L/2IVUIpdrQpFVl6Rfa6lxtzd+roA+toSjYBDMeroCCIhfU1MKMY2A1Aq5j/tF/s71zUXMFyJ1Z651wp95m65O/xA3OlV8H6UhWRMd9a2wE7EVRNOqgz9cV94zyrds2SnSkmChjNKIkRyLzYwFCRFE8EeCKdaGQq8ANG/lsMld2766Tjrcu9Bmt7RG76vVZNk8y5wdmDfE8Mt5wx85n0qGb0asEu1z1yxPG+gLfbjo7McTMkBAqO51HI3YyzA+men7vgEEJQJO0ZdlRb8HxPkoquOCuuM/SrEwy8W21KPRMmpy2VX+M2r5g4W9pRRWcuoSXLSqc0SitCZuYnvqLdt/gbtjTovXlJytQ47bEtOsd+k3MvgWzOQMu4klESDg1hPG4JjiwAOP8HkgmvWdrXBJYUb0lJKVy80p+at47D5+mkN3N2633alafHJ4EPViuv9PhpsI20Tby+pFvoxoTRmrO20YUahLhDVgd3PHArldXjI0swHAuymYkm6QueKKtserUwYlmDZ8X3DWVyPPZgketdO2QKXKyKDxTEqSDBlEi3aNA7M1P64FVwenYtvQlJNeNz91b26MIZ0bN669ff2hUSB37pshmY00D/21rffP2xFm1tDA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0V5b21NbGlEN2VPbXM0S2NmbHI5NDdyM0c1a2dLSEFyMm40dnpMeDluT1Zt?=
 =?utf-8?B?RWpYSzByeFBTS2p0TTl0ekVlREZhZEU5SnBFM3RYUlJrcXJRM2tjMDA2cUov?=
 =?utf-8?B?UDk2K3dTc205WWxXWnZwYk5KeWFpWndaNmxObWpQVW4zN2xPd2IzcU45VFBE?=
 =?utf-8?B?cEkzU2xRamtpakc5UDU4NCsvMFFmekl5U1Qza0JYb3YvMHFIQ2d0NWhORTl6?=
 =?utf-8?B?RHFwOWlqc1Y1UVlraDg3aHQyRnJCaVdLYnNSRmxqT296WThUWldnam9DTmdF?=
 =?utf-8?B?em5VY2hzTUhja0UzNGN1WDlGdE1IWU12WEhSN1ZKaHZPdm41NmdxTXB2NmdC?=
 =?utf-8?B?ZTRtcyt1cHBhb3FNUGxVcHE0UnVINDJMTk1adEZTczFjSFdkZG5sMEs5Mk1p?=
 =?utf-8?B?K3d1MUtFMStSNGEwRjBBNWU1dnBTYU1JUytDT2tVcUluZi9BSzZaOXE2aXc2?=
 =?utf-8?B?L0J2OEZQc1l5QzBLUlhyVktvY1lLODBKTlBFQkEwbVJIdjBUQXVtRk5GNytH?=
 =?utf-8?B?RXpVd2FEN1ZqaXBPNktvOHVnV2lNcVJJbWF1V3dmWlJuNFBCc0VjK2ZBOXZn?=
 =?utf-8?B?RGUwYXdCN3p1RlhBcmVoNWtIZG1sMmJlblRsRXdQSWczWHJlYm5jQWtXeVVU?=
 =?utf-8?B?TXhvazJrcWk4S0Y5UWx4b3MrTTFXYWEzdVdESHp0azlvQmVYU2ozU2g1YWxa?=
 =?utf-8?B?MGhwWmptNEw1MElJS0doTHJwT3R4ODVpMWxXcVBGQzVJTjZSeEF4bVR0clZJ?=
 =?utf-8?B?UDY0NlNnQ2VwQnhDZUsycWIrMTlJRlUvcUpNQk96TU9namtXUWc2Vk9Zc00v?=
 =?utf-8?B?aFZEWDFRUURhUzlsbVgxSktwS0RVc0F2VHJOaTBpOVhRaUpGSVdyTnZibUNy?=
 =?utf-8?B?cXBEMlQrM0ljdWkzZEtVZHoybmJkRkpOd0cwaWZQUXlDRnNwbk9kb1ZqZldk?=
 =?utf-8?B?SVcyaUlwQ3g4ZGRnTUhKZW81eFlJbjdMbjBBMkVrYmt4NzYxa1M0b0lDOXEw?=
 =?utf-8?B?R01iV2Q1eStRQ2ZZRnlXS2F2NGFSTGJzYWx0VUp2MUFRbFpQQlZzRG55MTZQ?=
 =?utf-8?B?QjJQQlZ2ZThna0U4WFo1NUR5eEVUTGpkdSs3K1V4cUpmOUxKMkFWQ1habEti?=
 =?utf-8?B?azE3Qm5EZ3RvVVNDZjFWUFcyTUNqQ3Z3dkVWL1E1eFFyc0REZjJsUXh6NHhH?=
 =?utf-8?B?R1NhTGdNVENwSFY0S2x3RERJNUtIdGE3TDlCTmhiZTRCbWJEbVMxS1BVTzNU?=
 =?utf-8?B?T3Rqekh2WmJ6WnB1R3dkZk9rdHo2SytyQU5qUG5EOGs5YzJtaWpqMTdPTXJs?=
 =?utf-8?B?M1QzanRQRTN2S280Qkh2UnRoTGFOcFYxb2NFc2JwMTMwSnNybzZGKzVmTDlZ?=
 =?utf-8?B?N2xDRlVNREwwRWNVdkh1OEsraHFmc29OQ0lRdWM4VVpOaURlNS9ndjVEcC9I?=
 =?utf-8?B?WnZPa1VtT3g0aEdaSEk0TU1aZndYdnNicXlyQ1BOQ2VJT05XL2lNSnVpZ0RG?=
 =?utf-8?B?V3NLTHdrdjA0T0tMbjFxRVVVMEhlL3pqM0w0VDlyeVBWSURwUUJBZG5BUWhX?=
 =?utf-8?B?UUxucHZyclRiZEE1Y0xLQThPRU9jK28yRnljUWFoOVh4UXllN2hiREZXa1Vj?=
 =?utf-8?B?SW5pYXlrUnkzYTZDUzZhMHVwc0FMdmtIMVdXeXpQcTc3Sk5IQnNCOHpBUTlY?=
 =?utf-8?B?YVEvSGVjNHdwaDlrcWFBWEhSdXhnazJMb0lZMkFJQTdrODR6M2ZYUGpPZ0Jp?=
 =?utf-8?B?bTFIQUdJSkpJTFp3S2FLVlFrREFTdUQwa045V3kwdGt5c3NZQ0MyV250cVda?=
 =?utf-8?B?cXFoTWVWV3l0dVA0eDFWKzIrYnRydWluVXYycWN5K2JQakc2ek9tUzJTTEJW?=
 =?utf-8?B?bUR6NXBmRGkvZ0U1ZVJZYXQxell4SExEanBwL0ozZXVOMkR6OVBPUDdmcXRt?=
 =?utf-8?B?aFZaZkFuYjZiYkp5TjVienkzdjVrcHlDS1daR1RncFVQdk9IVUdzOWRPeWlO?=
 =?utf-8?B?UGdkTkxHTEJVclhJUUluMmpTU1p6Y0FlZklid2h2ZWtLN3FsMWM0Q3V6V2ZE?=
 =?utf-8?B?akpJZURGUUFrVnFkY3lxR0xVdVAvbW50dmlaUkg4YnJua2dzaUU2U0sxWkxQ?=
 =?utf-8?B?VFRSckw0Uk1jakdrNFdyZGRYc1U0aWhIcmZyYmRiUlNMaktVaWk3ejF2TXVE?=
 =?utf-8?B?emlQTTRmMDR6NDF1dGJHbjJTcUh2VXZLTG9IZm1PRkVxOTlKRWtXcWVtVU1j?=
 =?utf-8?B?cGw0VWhUTG1oVFl5RmRJYUF4WmxLUFlTV2pBYUpGcWwyOFBuR1liNGpMalgv?=
 =?utf-8?B?S00xL3R5YUNrTXlhTXZIb3ZYWk9QYytNMnhMOFNSWldqNU92akZHVDdlclJT?=
 =?utf-8?Q?tLMvrlmRJZBTCOBcOrQRgpWq0ZHhO7cnrIrOKe25GUGOH?=
X-MS-Exchange-AntiSpam-MessageData-1: +2uCYuYpA/w/Xw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96921876-6915-4c4f-6143-08de798f6f8f
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 01:43:29.3091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Nvy1mJwzxenoBddSr1F2DcDmd2O7KKswqxWLfiOx4Vtr1HrB0oEgOLbrKYAyTQ1hzfaPRmePurXYtsE1Vo1MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6545
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
X-Rspamd-Queue-Id: 7858C1F99C5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Action: no action

Unconditionally call the variable length payload code, which is a no-op
if there is no such payload but could defensively catch some coding
errors by e.g. checking that the allocated size is completely filled.

Tested-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index c91da368206d..48cf28b41f39 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -548,16 +548,14 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
             command.init().__init(core::ptr::from_mut(cmd))?;
         }
 
-        // Fill the variable-length payload.
-        if command_size > size_of::<M::Command>() {
-            let mut sbuffer =
-                SBufferIter::new_writer([&mut payload_1[..], &mut dst.contents.1[..]]);
-            command.init_variable_payload(&mut sbuffer)?;
+        // Fill the variable-length payload, which may be empty.
+        let mut sbuffer = SBufferIter::new_writer([&mut payload_1[..], &mut dst.contents.1[..]]);
+        command.init_variable_payload(&mut sbuffer)?;
 
-            if !sbuffer.is_empty() {
-                return Err(EIO);
-            }
+        if !sbuffer.is_empty() {
+            return Err(EIO);
         }
+        drop(sbuffer);
 
         // Compute checksum now that the whole message is ready.
         dst.header

-- 
2.53.0

