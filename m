Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJ3pFsQyoGmLgAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 12:47:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C785A1A54CE
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 12:47:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB8910E8E0;
	Thu, 26 Feb 2026 11:47:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jTudqZoP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012000.outbound.protection.outlook.com
 [40.93.195.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D862710E8F1;
 Thu, 26 Feb 2026 11:47:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=INsZh8T+MwHsEsZ0D5CvfrC3T5cs41g1Ktd96ut6KxyEqnXoviwLjoK6iPmG3SIhlDRhrqdyDRDUJsuGYkrCfWWoMQjAaiMxnxzJXsAznaAov731HsG03QsCcB2RA4QhESr4KOEoILSn1QYahj8DjWKM4KbI5PGCpU0NxR0G2eU3hvr/6Y9LcvbbUefOe1P0+VAVhnQcs9hBGLp32ERZ3CbCUAZtOzvzZBH8Irrzy55n7MkvdhS9WUxWOGn7zPcIQ+wUrEAoVgqUn+NQ1BOgzeQG5BKx/7gTRAHpCHCaYJlWdf3xCugKFNE+18Yfaif2WA/YnBXWr+v2xpqbPYHXPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YHyYwFhSGalfP502Ba8nE94zzxFZO1J8n1P1B4869tc=;
 b=YiT+bFVJVGLyIRqxcTQVjuHLa5pqYGj5I9seZjvyANrbs+ffjeJsMGuJhSFJpR3Zzc0j2C7HU9wrQAHAkDn2E9mQg7mq7rtoGqOHO2HT525Kg/OrD3UHLA09cdWTs9xpczX+nFFWe77S5iJc9LucE5FBF+0o7muuP8Mn6EndedfbmMljrzYhTr5O3gn0buV5ESYyuBoC0nroNTdXgoyHSaYC/VxVIFAUu8x2B5NdkOA8Yj++f3b1eAxRI441qOTY64UkPBAnO3EWs3V1BR31F7VwbyqSEJeoFMGootoy1bpnoY19WRwTSx0BOLBsbx79FXJa0iiWrzGlucLoeeW/RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YHyYwFhSGalfP502Ba8nE94zzxFZO1J8n1P1B4869tc=;
 b=jTudqZoP+1pT4muv8Gly9LO6hFjcESAwW5ODyybrU8sIt6AAqbRb7AG7POWh+Uc39Dg2c1yoQEgcoaRBI0FhU2F1ZBPUt1Ay2SHjaHEzgmFjEJnduJW6tvk6PSahYfpEhaHUktpO5VDnJBz/NEj2xe6BbGj56/DGH9RaQsE9zAb+1Gec8AR621QjK+xTQJ/IF7816ikxKG/R/1FHcOWVv4QLUiLpVpYuCKvgBJkJhvzBUVhkhnedxXdcGcEw93kXg2QwpQU8Wav+rN4AMnhVvP+yZd1PNCJXHer3n+ZX2wE+nY43qDllfjwK8AUVcZGJB/Xm2YLqEHFsuG4lQEKj6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by PH8PR12MB7112.namprd12.prod.outlook.com (2603:10b6:510:22c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.20; Thu, 26 Feb
 2026 11:47:08 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.007; Thu, 26 Feb 2026
 11:47:08 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Thu, 26 Feb 2026 20:45:39 +0900
Subject: [PATCH v3 7/9] gpu: nova-core: gsp: add command_size helper
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-cmdq-continuation-v3-7-572ab9916766@nvidia.com>
References: <20260226-cmdq-continuation-v3-0-572ab9916766@nvidia.com>
In-Reply-To: <20260226-cmdq-continuation-v3-0-572ab9916766@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP301CA0001.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::19) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|PH8PR12MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: 15969664-1bae-4a96-78c1-08de752cc554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: VRajRYLyJWVrfTEEC8guCm/geh5DIoxArHLSKM7FVJuYfRTDemUoa2x9MIWG4UHGcUsaJpZkR3CSzMEvFCRgjqrQl3CuOuKpmai4WDeWBPu8oxDUGuYQrV2LYOevjJPT7QgnwYm4xZCLcJY7+9s3oy9qwEgGwl9MCQfDwgZOHlA+C2uvWpjRpJxpsm96Z0uhZRB+lAIy9F9Y9rilm6/I8oMt90iSln7sXXQK74q73cVrfC59LQzdtbO+z7mVzhXwDNFCv0ZFXN92NVzp99E0IFOhRew5fuYjvrQ2+wtD1jRbVOuMENhJ9gJy4AlkkgxHDkWBzlqIhoqqA1KXyF2l6Xq0Y18QHgkvduPtnZQR5bmDuOa8VVkKUkjceRtok4FBt+1lzxo89Ckk0NURHGKRp6OiDu88Zhm6YtajR+JjAARkkVpJR8+LYgGboWZ1EF7+4vWBkmuEZDOo+SEjgMac1QmUYOawY+9ESm9I2UXvnE5fDQtQPpFg8pFsmUYL1Oj4vGCS+jTjsONJ6TFXgxjrtguWTXaAltV4w+JQDAM1hktIhZjMb+I0chQ0uMKacpq1NjyCNPDaFl2w7Va2lHXncmrS7uCHoVdURr8r9X3fkl/gZBDGz2HzdPDPQ+T+zFxMXg6UufMc0B4wnyv48sv8R1avzTL+rvEtRgU5whJtEHrLe+e+/ePWOSaxqKO/r1fe4p7joMfFZ1eDOLLsbDkGXMoEoa6ue2jtU/q5vDtvpZFunjebanaSXLSTH56N9aWnJN9/cupDY4YxsFiEiosEvg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVk1TDhNVzJZWk42RlRYbEhoKytQT0wya1NUa2xlbFhvczIwUXByTVp4a1hj?=
 =?utf-8?B?VHF2K2RYNWhzS2oycXUvVjRvWWpTb1QvalUzaGFMd3VNTklVTzRMZHRIakxV?=
 =?utf-8?B?bFluam1IekhaSVl1dktzZVpiMjY3OWpXQTFjMERKTURwdERaN01mMjA1ZjNO?=
 =?utf-8?B?cncwbjNLK0tBdlVudjlOTkNhUmliWkkwSGJWMm91VTlOeEwvS0dndkJjZVdu?=
 =?utf-8?B?T2htRUFDUnBxWWpGWGc4N0ZEck5hNTlaRDN6REFSYmIvNi9DSmhTQXRKM29y?=
 =?utf-8?B?WGE1bUxFVm52MXliVGRVVzZJS2pzdDluWnNWSWNja1RlK2tjUHR5U01JdURs?=
 =?utf-8?B?dEYwWnVzWHd3aEx2OHpRaXpxQ2d5L3R0QkVmSUQva1M0M1VQcnMyN1Nnc2Fl?=
 =?utf-8?B?ZWVLV0s5dFd5Wm51QVNld2dtdGdWeFNSOUkxQU1zaHRZSndLbm9vcCtTQ1VX?=
 =?utf-8?B?cDU3VnNXdVVOeXlrTVBkMG5MZXZHSVZQN0ZtUFBZRElpazFDdVFBUENHWXJC?=
 =?utf-8?B?SW1kRFZJUTlNdFBONFR2cVhrbFZZb1F2YWNHVzhUdmVkL2IraGw2TlZhRHZy?=
 =?utf-8?B?bnNYdFpNQzg0M1l3c3lQMW9obkdqQ0xIOVc1cUo2b2Z2NEU4UEErUWI5SGFZ?=
 =?utf-8?B?ZGd4WjZXWFZiVytZZTU5QXpOU2QwQTl1dldZVzk3VGt3WlowQkpzNWNoNk5l?=
 =?utf-8?B?RUVBc1hmMzRNaDVmU2ZHZ3AzUTBEWXhRc2VDSkpkSHZ3WVBQQUlVcVhJaDl4?=
 =?utf-8?B?bWVuTXdOeWd6aWZnZnBhWlhMWUYyVHM3VUFvMlZMYzdrdHBnN0hGTFEvNlQw?=
 =?utf-8?B?cEpUbUh3dVNYSEI0QTROVWVZcXJVUVE3bXV5RmhMUEtIUE5vbGphU2JNc05l?=
 =?utf-8?B?d0hsWWlOaXJRKyt3SzY3V3lERDhQYVlUMG43bHdLM01nMEhHRjB0a1ErNmF1?=
 =?utf-8?B?cWliN2dxejhZL2RUYXJnNzI5OHBjZ3RqY291ZlFaYkZoRDQ4VmtINW9CUWsz?=
 =?utf-8?B?b1NrTjYwb3FoUEl3L3N4ZTZZTGJjb0ZuSVI3T2tkeEhjNkNMZ3BkVUVLQ3dT?=
 =?utf-8?B?czBKZ0ZtRnRoMDY1UkQ4U1FURDlUTEZTSUMvOU9vM0ZNV3pQMnRmS3RvdlhI?=
 =?utf-8?B?OWRPeDJMRW5zQUtmVzhvYVI3NG5HM3ZEUXdzb3d1bkMvVnFubnYvZ0g2MjZP?=
 =?utf-8?B?MmY1MGJqRVhWeEZtT28yR1R1bmNLTmFaVGNoK0FQR3RLSlNWZ0RpVnNLWEIz?=
 =?utf-8?B?V2F3TzZGQ1prL0s2eTF2am9YQ3dmUVd3TUJ5QjNsZ1VlVUp0eTJJb1QwUWEx?=
 =?utf-8?B?Y0JOVFdSQm8ySVkyWGNYZ083ekhkZGlUby9kWjR3akE0YkRjZ1YvOHNZQWZF?=
 =?utf-8?B?NGZ2a2FqNHl1YnNGbmdxTG11N2dsMklIejRqL1R2ZjVJc2hBdzQ4Y09yaE1q?=
 =?utf-8?B?VHlwY2V2cWpiTHpCUGRQTnFmUDlmR2h0YXFHKzAxRGpHUDRGTDk3QWU2dTBs?=
 =?utf-8?B?QmJOQkVwL2h2cDJGVnJYNGRMU3lPR2FmMndsejlmVDZEM2VzVFdRa0liZWEz?=
 =?utf-8?B?SzJLaXdWT3BzN1ZHWlhySjRpU0xDZS9vM0FsZHRIVXVRclp4ejN6cDk1K1p2?=
 =?utf-8?B?UjdRY0U1dGRBa0Fmdk16UUt5MkFKU0g1WTQ4OVJtZ015TExkWnlpSjFLVDVU?=
 =?utf-8?B?UXJqVGRiSEhIc3B3bVFJVjBwQ0x3b3JtZzRxWWtiM0p0MURzOWtUajVmSytR?=
 =?utf-8?B?VlhOU1BEZjZiZmE4QjJ4WUlWQU14U2VxcWhmY25JL2FKTFlXY0pNcHl0aFpK?=
 =?utf-8?B?RXFpYkVPdHRsZnNzd1NZWko5NHdITDg1dUQ4NjE2bjhvbmdGMktKTjVjNmVJ?=
 =?utf-8?B?OEtIYVlkV0VEeXFxSWNYZEtiT0EwSnpXOEMyUTNpSWhFejROVjZ2U3lnKzJm?=
 =?utf-8?B?dDFRcWpNbU4yMnNLTU1CVnBUdDIrZGdjWkZFbFR0bExhSGFZb1p6YzUzNFZR?=
 =?utf-8?B?Z21QY2VxQzJ0TytyTkpPU052bkp5L01CRFlKN2VZNmJ6NTlHd0U4WDYyWFZH?=
 =?utf-8?B?YVQvcDdKcjZhcFphMGVPMmhaRWVxYzA0RnBZTC92eXlra3lSSE51ZkF2dkJw?=
 =?utf-8?B?czdXOTNUUmJ2REx5QXFoMmN5a2VCdWNZKzhhazZoWlBYdGZWSWs0eUlhWmtX?=
 =?utf-8?B?WjZIZ1A3REJhbXZvaXhpSHdXKzgvM2dicmpDYWhMdnRsQnJPNURVODZVYjlY?=
 =?utf-8?B?L3BZZGFOQnRubU1BMlZVUk5oc2p1UUZIUkJ1NTQ5Zm5WNFBYN2Q5cmIwQThV?=
 =?utf-8?B?d1Vlc3lVa3NLMWVlOW5PQ2NySFNlbU1sZVM2WmZuV0gxenBJdjBVZk4rZThs?=
 =?utf-8?Q?OnqvYPDaMELhDIgPFztre56znAXXJPRN9yQ65jYu0lv/B?=
X-MS-Exchange-AntiSpam-MessageData-1: V4Sd8ke1MajJbQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15969664-1bae-4a96-78c1-08de752cc554
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 11:47:08.3875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QXkEbOB5p+rXNIo7d9rBF3WUXgpasIZKFj5wmakUWC3XYeHpjudwoixmHQ3Ej2PJ20pmRRX43aDFwseS/2tB7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7112
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
	FREEMAIL_TO(0.00)[kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: C785A1A54CE
X-Rspamd-Action: no action

Add a helper function which computes the size of a command.

Tested-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 9f74f0898d90..4a663a5b3437 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -450,6 +450,15 @@ struct GspMessage<'a> {
     contents: (&'a [u8], &'a [u8]),
 }
 
+/// Computes the total size of the command (including its variable-length payload) without the
+/// [`GspMsgElement`] header.
+fn command_size<M>(command: &M) -> usize
+where
+    M: CommandToGsp,
+{
+    size_of::<M::Command>() + command.variable_payload_len()
+}
+
 /// GSP command queue.
 ///
 /// Provides the ability to send commands and receive messages from the GSP using a shared memory
@@ -526,7 +535,7 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
         // This allows all error types, including `Infallible`, to be used for `M::InitError`.
         Error: From<M::InitError>,
     {
-        let command_size = size_of::<M::Command>() + command.variable_payload_len();
+        let command_size = command_size(&command);
         let dst = self
             .gsp_mem
             .allocate_command(command_size, Delta::from_secs(1))?;

-- 
2.53.0

