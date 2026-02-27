Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CQMIVaPoWkruQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 13:34:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A31E1B7260
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 13:34:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 565EA10EB2B;
	Fri, 27 Feb 2026 12:34:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="h07VZzHb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010033.outbound.protection.outlook.com
 [52.101.193.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE3710E189;
 Fri, 27 Feb 2026 12:34:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pg3sqGb90gaUSetBKLLHsDT9eaNEhY54UsxzOWh9bZVmrHSLJOZjWu0umMur9pG230fUFp83IvoWzOwXC0RIsJ1pH5nU2t1yHJbaiZzQ6bh/BVwblITbaf+6eY579Ah0m61qJGz1/KNv4/ehRt2g6qRGJYCJ+IFlv8aqawDwNgbSpmfXIdtwPXPTk+8/I1KYoST6AR4Wu7SVJE9NHW252gkAiiO8yqedUq1siuwqoYuW523k0xrRdtnxSi6gyHlTI2/9iSZLz7b1kCoZrWI+DvKMUo7gchr+vuSlwDH/pZg6M6qFB7lYymhMiaqeAiYU75uD0snqIMFeF452RXyeNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5nhcZAQ2gJL9MOPZGcrmtYVN8hyZP9rB+yj5vICLNg=;
 b=v6V6xoWQKWyDvPYdfPzREzhrhgVoG+7nDxT2kC/n/khbST0jjOMTRQix3kbARuBHxe6Vjn9tQfPsekXAB3Gbf1f+5z9BgNcVNXCamvWpVV9WhsxAM/RC9vTUvXNhs97YXyr3LbJ0GKZw4PJQukgK2MXbrQm0vCEPUTA9ORlUYGHuYCoiVaYcUygMUC1dLGbyWtL2WldXJ8+Z06TEfOB5czFAOqSevbgPKXDsNYxRRAdwxWBJkUKB2uzoK1yMGfqzqCNKGOPBTJZd47xFN0+WGwWe8bTA5gz2ntBHF8k2mgF/RBzdm46xWB3RaBG7ib+8beXJaNIjQRUn0T5fpGnwng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o5nhcZAQ2gJL9MOPZGcrmtYVN8hyZP9rB+yj5vICLNg=;
 b=h07VZzHbsrXaqq7FBgtBs+WInIPQcmDdqNDtgT6Tbj8cJgQIP1TsdZcMOOXHShI4R8X7ths3/FMhtAmkw+4sZUvUh9TrJOjPMyWqmVX6ATkyNrUgpPdgWOjzgrQP0zg4dF9Yceu6Q4GQacDkRhB3XqgeW0Hd155MGyejt9bsnug29LFCWYXAck1fJ0mpcABRP1wI2lVXS0WqCGnsfc6ukOYvKxRjMPhx908PFHRz8pLhWBxt14RZAJd3pBBuzWrzOMrj396Loe9EsG+gGb6qd4gOSvVFPhrMQoRgblcYNgHulJd0VYuUXu5XeQS1jQr5McH+VXQ7g8za10KTcGI7Eg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by MN2PR12MB4287.namprd12.prod.outlook.com (2603:10b6:208:1dd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 12:33:15 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.007; Fri, 27 Feb 2026
 12:33:15 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Fri, 27 Feb 2026 21:32:13 +0900
Subject: [PATCH 8/9] gpu: nova-core: gsp: add CE fault method buffer size
 bindings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-rmcontrol-v1-8-86648e4869f9@nvidia.com>
References: <20260227-rmcontrol-v1-0-86648e4869f9@nvidia.com>
In-Reply-To: <20260227-rmcontrol-v1-0-86648e4869f9@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P286CA0060.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::8) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|MN2PR12MB4287:EE_
X-MS-Office365-Filtering-Correlation-Id: 15eb758e-c107-4f2c-03d9-08de75fc60f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|376014|10070799003;
X-Microsoft-Antispam-Message-Info: ejZI0j1eejd/RQTEPzJFqBJFIR9Itflbb1VspPFoDQaDULSsaMuCqdYhMsJRaz2uCtl5wyAJ0GOuvE2DRlPOjXbxboZIwQ+z01LGIsqF6ZykO4HgpjoCBdtPEA9B93ASh/Y6jJmMhAwihxvgJl7MIAtMK0xolwyBQi2vIEVqIiVoreqMQysxi0DnneUT9V5Sefd372bGs7KKNajDZ823Dvi8+HczJT2Q2nH7YeAmc0uo7iM6wf7p0IcGCFrrCoWZs0AqWZV9LM6Ahm5UgA4kixn4QXfYOePAdnrbBaw0XRpYk9Mcg8RXdNBIl7iENpOQjdkF3vNAAoIrL8L5QqqPAQ1k26fUXrjou2uUQJx03aqP5fLzVxsM4m+xd0GYiyify2xSxKT6LlcpN+sqNsf1g7Q7QLeBdKA7gIiKmL1+v5BiUaZygIQ/NE+AwmSjr8Y3e0IaZvLa7f92O8I3kydxQG+Pb1PfECSjcSQIoP23DlNs6kLRPmuEhvmJH1M8fuhPeH6LliISupfJD0LH0K4JOXATf9PzLEvltqHzL9evrA1zgz0KeRb/sPG/fH3N/uqDQd6x7NuR3kQ1OgJX5EcZGFpQZ7NuAT6pP51QW4hCL0UgAONmBdjNbIa9cmOcu81D8q0pr1A5aOosXYmXvQqRwF4m5vnGTP4+L6EIiPywTkdWOeM/NlI6SJOmCQOAaIUgFbVadbnTGswF0dA89hToX+z6Wa8DgkMthZ1Sh8j0EEg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlM2NTdoOXVVKzJiRzJia2Q1NVA1YnhPVU54SnFpVjJpQjZGeTFETFZGN3E4?=
 =?utf-8?B?VXM2UVg5eThuUzlOVDVTUG1wa2t1Qy81Sk1KRkFWbGcxVzBmM0FycEZqb1VE?=
 =?utf-8?B?SHVuejJ3cjlJRUVSYW42NEtKaHBvMEhLbS9HeGNoYStTbCtTRXVaaTdzN0hX?=
 =?utf-8?B?aTd3TXJTWFRVaTNuRHRPUFJJWUN4TkJyYzUyY3AyMzQ4dExBMFA0Uy9ZTGo0?=
 =?utf-8?B?eWRkaDI2cDMvMGJrZXlzWVhWSi96MUltWkNwT3VZTzVBVE04ZDU5bHh4cEFh?=
 =?utf-8?B?Z0lhVVpvUDJPYXhzUmVUY3lselJvQ29BcmRtN3hLQThWRGF4M2dwOFlLVGxj?=
 =?utf-8?B?b3ViOVB1eTlpNEFjeGFxYzFGRTh4cmJVaEdUUll2d2tWQjNzd1g2WHJxR1ZY?=
 =?utf-8?B?eVVmK0YrSUdCREJVWlY3RmMvcktEbC83L25TK2hzeU95dVV2RkY2QmpFdVF6?=
 =?utf-8?B?WkpVaWFzM2w5aHNwMXVKWmgrQTlMdFRxVWd3SWdXaldGdlZKV0FQdzdrbzVq?=
 =?utf-8?B?bS9xNE5jeXF4WFhnQjFFdndqdnJIT2ZFckZNVysvcW05eGhtd0NSaXlxcHRR?=
 =?utf-8?B?VXF3OCtZMVRMem9qQVM5M2RTdnRrWHU4SUFYVXBRckFJK2lEbmRZK0wxbFQz?=
 =?utf-8?B?Tk5JM1hKdndiMmY0OGlkRlJNeFB1VDByVVhrMldNTVk1MENPanFQNjllWkw3?=
 =?utf-8?B?SHNmNVJoYlM2NFAzajVHNzA1S3U2Nzc2V2dDdXlTVzBjbDVJVXBFaXV5Zngz?=
 =?utf-8?B?WGpPTGdXOFp0SjU3QkJaTmVNYmdlR2VBbU9VYkNTY2todWJHZUh1ODhrOTY5?=
 =?utf-8?B?WWJQbEpXVkJnVmVhaE9HQWt4dGNWb2ltUk5tNmIzdUNhcFBWTSthU29sRHAx?=
 =?utf-8?B?eWt4SnN4MHB3aEVFbjhVVE5FR3dSN1UyU0NCc3I1L0xyRXFWUVRRQldYQTFM?=
 =?utf-8?B?aUR5Z1c2ekxYeTlGVjNFekFOS1M4M0prajhjSHdDaFNyNEI3eUQwMkVjM0pH?=
 =?utf-8?B?T1ZnUXZNa0dJSHZCQllNM1c4Y05VVFVmWEFRZktwb3JaMythSUFOOXpkSzNn?=
 =?utf-8?B?VnFneGlCYVhKR1pDNW9uM0pBY3JwcFprSjEvTjNoL2swK0UyZXo0amUvNUhq?=
 =?utf-8?B?MUZZUHU5ZWY3cG41QmpVWDVrcTFFWmIyOFFlYTFjVjl2TmxISGplZXFqY2Ey?=
 =?utf-8?B?cjZOaElJU0E3NGlYUmUwbm40Qnh2VjhRM0ZrbWRHKzA1akkybnd4bWtkK1NP?=
 =?utf-8?B?YTdnaG5qTXlKZno4UC9HMllTMkJxcjB1dWNyOWxIdVlDZ1NoNUtjbG5yWnZN?=
 =?utf-8?B?MGFkZGFyKytOL1IzcGZuWjl0aUkvQTdieVBhODF1LzhOMVV2Nk51MFNkWDIv?=
 =?utf-8?B?MWpQNGxGemlyazYweHgzUEJ2L05XMWRsY1M0UkVuY3FvZnRHQjAyT0lDbVg2?=
 =?utf-8?B?cEdmOUt3ZnQxc1hQTHU2NWFDNlVhaG51bE1tSm1rSldjRTRZN1A4TXQxb0xm?=
 =?utf-8?B?NkhSR1BXa0tqS2pRNDNyVENJekdXdGtaYUgyNzlPeXhnVSt1QURhYk1mSjR5?=
 =?utf-8?B?RnFDYjhHU0I4R3ZUbndQL0tsL1QyV0pqeTRnTUtJdm1BTHY4QkZ1Y3Q0ZTQz?=
 =?utf-8?B?MXpUT2NBZE42V0Y0UG1haExkak5kcG9xbjY5VHFFaWc3eFBJelp0c0pyZEJR?=
 =?utf-8?B?UlJIM2ZYMEFyU1Z3clZieXBWNEdxK0NJdkRtaitBNFA5YkFVaHplbUI2bEZL?=
 =?utf-8?B?NDVOS3lhSFAwdW1MVXliWXlleE1Ib2RucU1ac1p3UUFSOGNCZTF1TlV6cnV5?=
 =?utf-8?B?Z3VmeFdVek1hQVlCeTd1SG1NNWZTcVc1L2g1clpLNW0wRDFhNXVIanZDbTZl?=
 =?utf-8?B?dy85bUlzbUFrNHdkV0ZUdG5obEthc2VkVFdhNEd2dVNkcXV1ckFMNmVEdUFx?=
 =?utf-8?B?VDVrTVMvMDR4VTNOL3poNjU1Wmt2YnNpUWxtYWhoV3ljamxCQjJXWE1wdUd6?=
 =?utf-8?B?d04zelZBTGlEc2xuZFpjcE5ma053SVFYdWNPSjVyRjJteExMMEl6Y3lYYzhw?=
 =?utf-8?B?YXpMWnNNUFVoRHF1ZmYwc2lOTHRVN0E2WUVsVEsxMTBvWER6QmtEa2N2QzBT?=
 =?utf-8?B?RVlTSmZHZnFQaGxVaFZ1ZnhzazdDc3JzSURURFZyb0NhaXRNZ3FtaW1IRUMx?=
 =?utf-8?B?eHBDTmhyVkVVYlZRNGpnUmVBSlBrVlhQM0JHOWFHNGNmSlNsUFo3RDRjT05t?=
 =?utf-8?B?WkxkTE5CaXFJWWkzRmo4eklWNGo1OE43RzBoMW5OcytzM055V2c3N01QL1JC?=
 =?utf-8?B?aFhvODdLZXliZ2o4Rk1iZzdabDlCWVBtVEdLUGpiSDNRY0VPUU1NUkNDTGND?=
 =?utf-8?Q?tn0BkPC5EOMydOWoWmSexZz/EofGOrExJharCDIU9Irl8?=
X-MS-Exchange-AntiSpam-MessageData-1: djPRMKPFbxs4/Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15eb758e-c107-4f2c-03d9-08de75fc60f9
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 12:33:15.3070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QtUgOKddju842gsYO+tWxUqYr8PCAQrZt4xswQ/FbimEqiLEum8LdYKbl3ZMLsoKJqezBBowGNy5x/7Ve2JtNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4287
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
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 1A31E1B7260
X-Rspamd-Action: no action

Add the bindings for CE fault method buffer size RM control RPC. This
will be needed for channel allocation and is also a simple way to
demonstrate the usage of the `send_rm_control` infrastructure for now.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index ece31cc32f5b..354ee2cfa295 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -1025,6 +1025,11 @@ fn default() -> Self {
     }
 }
 #[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct NV2080_CTRL_CE_GET_FAULT_METHOD_BUFFER_SIZE_PARAMS {
+    pub size: u32_,
+}
+#[repr(C)]
 #[derive(Debug, Default, MaybeZeroable)]
 pub struct rpc_gsp_rm_control_v03_00 {
     pub hClient: u32_,

-- 
2.53.0

