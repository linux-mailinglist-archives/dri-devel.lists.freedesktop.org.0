Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFaAC2BHpGk0cQUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 15:04:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAC21D013F
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 15:04:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B420E10E3C5;
	Sun,  1 Mar 2026 14:04:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gnJMDHWk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010067.outbound.protection.outlook.com
 [40.93.198.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9ACB10E3E3;
 Sun,  1 Mar 2026 14:04:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sZ+JRIgMrRTW2iUy2rHAqEWZ9kjCjSlK2PNGMIKUgt1WhXrUaTufqU/lFsPZjuL+oBEAnW2FuO3QZ6Oh7A38+hFYi4GZ/Ud43fYadt2/F8TmwIwK4IKtILtLwiy5XL1PG/cY6JwY23n5Vx4BnXURoa+MqMOZp8m2MSyJ19H836N0Qyze104y+8AGScWzZ/QAYMdtVXQc4AarqUA64md8/qYm3yrLtBO6vaDCvn7iseRyo7sU5H5COKDLEeI1OA3sBK4qC+3IIs95I07mqSaz7HUrRmAoGhNMfJhBQSkIlKZmld4fzxSYweGhvhRErSFw31wJQyIA8BM9k7DA9MGeoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aud2TLeEKC72QNU2PMJEYofNwuHgLyuaoRuIsCU0Gmo=;
 b=tjGrnBVBFpMIZ/xX3sGpB5H8nrYX6mcRohMIi2TQvh/1zeR6ebf0lwVvkYMQq+B7TNwp9/QRl61JVG5IQpyyT89eyZmiOs6AkjTM38txX/a6MTHyrHEqNshdVk2LuT/MkGeMWRDBjQOFs5Xmxx6Ce0ZlxIBUs+GtF86S3jjjB5n/IeI61YqTEZRX2lzWPnCEWIvtyKx/CkKWuhBZnmjb8h8H/hXgTmNCa455Z8bWzZQ8qtsAa5CA//I/utB/6zGRhHWlu5UuvO7m3uutNlNshFy1D6XwKQ7caCnV9befpf2eAT4Bk6dHiBwiMFkmehWNeMyYUFH6+Fr6zQAYYlGU6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aud2TLeEKC72QNU2PMJEYofNwuHgLyuaoRuIsCU0Gmo=;
 b=gnJMDHWktT8tm+T6Sip60iADl1poynaeC1euXhMgLrzxs8UoQNeV8ExStIxGwFioVVv3Z3hhH1TzS+QSWDaBkKYj2nkvBTaw8a8R79t5RE3/LKeaQ642QpQ5faHIkZ8gq/Xe3b9yDrSC2MwUjgeb4CJNher8KY3Gu2fm53bYoT77AYFho1Cw2ru5tdF46DaTzEXMAFbCdRmnLI5k+JGcquwaoMhBLm+GUtLokACOttO1tirRaNAgD0JpmgjPXSMwuCGLuuDgoxWsjrvbXCAtWzmm0U/HI+HLYM4JhS0IeXGTr0KXS26D4359+iVcZ0TeGkZcqKsWbgUTWjn3NMtsgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB6632.namprd12.prod.outlook.com (2603:10b6:8:d0::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.19; Sun, 1 Mar 2026 14:04:06 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9654.020; Sun, 1 Mar 2026
 14:04:06 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 01 Mar 2026 23:03:45 +0900
Subject: [PATCH v10 02/10] gpu: nova-core: falcon: add constant for memory
 block alignment
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-turing_prep-v10-2-dde5ee437c60@nvidia.com>
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
X-ClientProxiedBy: TYCP301CA0034.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB6632:EE_
X-MS-Office365-Filtering-Correlation-Id: f4901671-4721-4457-ff53-08de779b66f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info: xZanZuxjiJP7IW7OVwA7Fid0e9UKa4V+EDV7sdrUY54mVHVn4+MLO4htUTTBLbReNULqQlkEh9nftQPgzLinTcG9jYQr2nQCOnO91XsynKFM9YV8XuoHIAEd6omWyKpp1HihpEJzJu6CoNlD0QskWMvEtLq/zmed9RLZOPNkHlvVlYJm4kq+btNbOpL3sbmklQPZ8U0FY3NR8ILDhjdt6GV2pLozFqDGllKDqhYAZjqk5hw8niMMTJO3c257ciQ6XvHa/0ZMYuVkGJo5GR7RXj+KjdJxySLR0r1sf+pjsoYbfL54mZT1xBleqO7vhmsjKtEoOC4FT9Wd8Jqvqz4v6wR9tVGk3sRf1bPUSmJbRp6zLElplrpt5dVYTDbkueGrCJCzixatfKENhtBvpARgnqUI7BADUTDmEwShardEoNZ1r483zPCtZY1v3/Dm8Zf5UDgQOqra9ZlyV67VK2npqqVNBRZOT4E/VKbZThalTroil6Dwtc1NtjgHH0UdhWAf3P++/x1OCsP40FZ+Sv50jRHWgGP7wD8CA64HFK6xR6urF3Bx2Z46zHAEieSVjiQFwMO9mkrMr/3B3dQRSo/vw+n1C4icmT+TqRsDIxuPZJJVoZjHFGiksKpzjHQUS3N5A/G9e6nUKSbqFoITfQ03/YvIWC2Hv5/lv95w7RO/9w9rCsmaKAS67sU5N24s0PPJEZK7xxGSiw/ZfNE0sSs5wED2QkL5SZ3UX2SBsPvhzpQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTBrMzBNOXYydjN0YjZ6dm9iSUYxemJCRklzblRLYWRoWHdpLy9QT29CeTda?=
 =?utf-8?B?TnF6K1NJSjVhTFJ0YzYvenhvdDJkcC9rdXR6OEVwUCtSc1krVGdBRWI5YlNp?=
 =?utf-8?B?dFZWQ0tEMi9RMzJIc05wZHhtWkoySkdQdWliMllFaTVCZGlYb3M2cVhIa3p4?=
 =?utf-8?B?SHlUb3NOd2ErYVhFRVU0Y2RCRFZ4MCt4L3UwSjMwb2prZytGOVNuMFBhM2RH?=
 =?utf-8?B?ZGhucUVhZ1NPdlVDZ3R4eE40dW1NazFaT0JBQjNVZlhyWVlUZmN1bUVJTFc4?=
 =?utf-8?B?V3ZkdXFOTmlrUWl6QVRBdGpzMkZYMkVPd2dac0RVbG4wbmtlYWppMHovSzBj?=
 =?utf-8?B?ajhXSnZLUWNZaWNzbFZ4NXpxLzgwYXptdU9MSnMxaGtTOXB0VnRYcU5jeWlI?=
 =?utf-8?B?QzIrcjk1MTZBdTZ5Z3FkQXZnS3M4a2lkME9uSVg5RXBvSW5LTVd0YzZ2c3A3?=
 =?utf-8?B?K3VuRGkyR0p1Y2IxQWlSQTNuTDUrY0NYdUQxdExyM3hQMDRERUxnYWxUbWJF?=
 =?utf-8?B?NFJYVUFXM2VOcm9EUlFQN0EyYWErNFNjaUdqQ3phdTRuWHF1TEFNdURBRk85?=
 =?utf-8?B?WEQwNXhRV3UwRit0cnB3RmMyekVSRmRoeTBIeGVuSlZybklPSWtXZHRxajZC?=
 =?utf-8?B?M1Y3MS9wSjRCelFPN1BBOTBkdytxTEJlejhCTFdmUWZ6a3BnbG1LRFFMekRD?=
 =?utf-8?B?TXVqak1ueTJOaG84N1NBT1Jqd3paSDF0OGdDSjgyb1BrRlNwTXAreUpqaDFN?=
 =?utf-8?B?Z0lMRmFPUllZYlhqS1Q0WXc3OUdYSGZ2NitMRkRvK2lPSy8wZEJTRm9oRnZG?=
 =?utf-8?B?dHd0SS8zODNGR0pPcUFvbUVEcWxoUGsvVkp5SDk3dUFMTENzVHJjdnpIQUp5?=
 =?utf-8?B?eERsOFdqdzRwdHpwSWlyUTlyNXJTanIvTzUzMUtuS2dUQnBweUs4WEJIT3di?=
 =?utf-8?B?b0poZlNiYk55MlNtNXFZVDBlanNvdTZ6MDN1RzkyM1JoNGUvRGx6T0VPUmxm?=
 =?utf-8?B?eFpxMlIrMGdHTWRaVzBCbC9xUFV4b01Zb3N5UGlSWjVucDhSMW4vMkIydjhC?=
 =?utf-8?B?WTdYakRqdnZzZUJwV0huNmNGaS8ya2RCRS9LOFJ4eERPUko2eUkvV1Rsd0hF?=
 =?utf-8?B?YURHcFhBNDdLK2dlaGlYSVIzdFZYRXZJcHBYUkxoWnA1Sm9IK1VsZkxtZGVM?=
 =?utf-8?B?SVk5NVdaRGJVT0hYZmpkdFFTYzB5cnFiTSs3SGh5Nkd1enFzVHRPNTExeE5I?=
 =?utf-8?B?WndsZkI3RVFsR0JUNXRlTkozc2ZXNFBBM3lvQTZoMGtVaFZnN0t4eVl1cW9F?=
 =?utf-8?B?SmZodTdCd3J2QkVvRFdveVI1aElQSEpsV3JKUHJTTkVrQ1dTSW9xSzQySU94?=
 =?utf-8?B?RFFrMWhiVks2TENDWGRWSXV2RllldjF1TFV6V2w3eG5BZExmbjY3L1JvRkU1?=
 =?utf-8?B?Q2dDMmovc0p5Snl2SGFITEljYWlqOWZxWTZjc2pEV3RnZmQrU2xTb2NlbGJO?=
 =?utf-8?B?TUpXU2VVeU5JQ1JjekM3dGkza3ZKMERBUUozczZkV1hMbk9IZVFFd0Rocjdw?=
 =?utf-8?B?clVXV0p5UGtkMU5Nek5tY0dBQlA0c3JCWlljcUJnV20rSURiT3B6RHNLME9a?=
 =?utf-8?B?aGZGV0tiOWg1emwvTWdpR3FjOHh6MUl6U1YzQ1grckhxVEpzckptYWE0ZmV5?=
 =?utf-8?B?WStFNlhaYk5Gb29GM0krMjF3NGtvNjZtTWRhVjZXQVFtUVFFYU91RTJNMml1?=
 =?utf-8?B?MVc2ZC90enZXK0d6elJ4TGxXNktIVUExeHFad1dmOUVGWWl5NjZnZVlCbGVj?=
 =?utf-8?B?TWJieWM4OTNoK1FkSlJvbGdWeTMwdjNRVTlpOUpQQlFTVWYzeTBNdjFFZUQy?=
 =?utf-8?B?UjBXbFdJMlBMVnZ1VncvcTFWV1JXM3hyRDhBTGo5aEVHL1hpS1E5K3Q1dmEv?=
 =?utf-8?B?R2dVb1NTV1ZuTVJLa0xEb1kxbkpkNU5rUUFOOVlGWWZFeGM5RGFWRGZqWkNj?=
 =?utf-8?B?Y3FTWlFpck00Ti8vMFpjQklqaExoWUJCNGVTYW5rMGVFOVozUW56ZDU4V1NG?=
 =?utf-8?B?c0FGalN6QzJIWkJnYUpJN0IwdjZaWWxnMEdmSVRIdG1PRXJCalJTNzI3QSt3?=
 =?utf-8?B?bUM2MCtZTitiR3RrMzlKeGZaZjdPbHptRVdiVEczck1RN00vMHRlZko0azdT?=
 =?utf-8?B?ZWdaeUZELzV5SExHU25rUmQwN1VXM2xoQk5MQUJobGdnRjA3dVIvS0MweXRS?=
 =?utf-8?B?WXhLQzdBaEhOMytEM2RJOHpMeVVCeENYS2duVnM1cmdUamo0all5Z3NZUHNy?=
 =?utf-8?B?TkovbzF6YzMxY1RzRGZJMnV6RzVocE1nMmR6MVp5UE9BdU14aW9ManFoc2hC?=
 =?utf-8?Q?iJn+7+D9jKfiqosXcDLFNeJrO34V/frRcGlyocZl6nGWZ?=
X-MS-Exchange-AntiSpam-MessageData-1: LTlZ+FRPKKI8EA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4901671-4721-4457-ff53-08de779b66f5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 14:04:06.5415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ok7HBlBRHdenbtROKuWR14V6yNYnlsskpFK83BLwOO3h7nygn8/kqc3zrwpeucyUTobyBDm6488/07+VK3gEqQ==
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
X-Rspamd-Queue-Id: CBAC21D013F
X-Rspamd-Action: no action

Falcon memory blocks are 256 bytes in size. This is a hard constant on
all models.

This value was hardcoded, so turn it into a documented constant. It will
also become useful with the PIO loading code.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 8d444cf9d55c..31217cd3a795 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -25,6 +25,7 @@
     falcon::hal::LoadMethod,
     gpu::Chipset,
     num::{
+        self,
         FromSafeCast,
         IntoSafeCast, //
     },
@@ -36,6 +37,9 @@
 mod hal;
 pub(crate) mod sec2;
 
+/// Alignment (in bytes) of falcon memory blocks.
+pub(crate) const MEM_BLOCK_ALIGNMENT: usize = 256;
+
 // TODO[FPRI]: Replace with `ToPrimitive`.
 macro_rules! impl_from_enum_to_u8 {
     ($enum_type:ty) => {
@@ -423,7 +427,7 @@ fn dma_wr(
         target_mem: FalconMem,
         load_offsets: FalconLoadTarget,
     ) -> Result {
-        const DMA_LEN: u32 = 256;
+        const DMA_LEN: u32 = num::usize_into_u32::<{ MEM_BLOCK_ALIGNMENT }>();
 
         // For IMEM, we want to use the start offset as a virtual address tag for each page, since
         // code addresses in the firmware (and the boot vector) are virtual.

-- 
2.53.0

