Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPNIOM0yoGksggQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 12:47:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A081A5502
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 12:47:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0BDA10E910;
	Thu, 26 Feb 2026 11:47:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DqByXa8v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013004.outbound.protection.outlook.com
 [40.93.201.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 479BF10E8EC;
 Thu, 26 Feb 2026 11:47:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CZdmqJwYw4jdza8IRJfn3tVh3Xbd4Uwt1EI1pvqyOXmcaxxBqjfVoA6kW1+5Z9JkNNNbH0Odso6X5XskAMAIfJj3d1zAr2Fe29RNHFIBUpOy0cUgDgXUXXCzLJgLwuWmAw8lKvmX05+o6TQDXFiCR/uNRpQb7efcpX/bu08a0L4RYE/eWWBUDN0E+ybExcsgGU+sCVd7Gs7RnBJ3rYx1XoSw5nFtCVwLvNnQjrqDT3MIlelFl4d9bOApwGIex4rA/VtOweyZYQc+q4vL38ap5c+jZ5yTEqAk+GugvSv9ib+doJrooeF36h+/Whz8S/Ob7oByZgZyh+/DAI3/1+SHdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JVQ+AUSa2O8lPjC8zY2F0HyAKJMBLoSAHxI1phpLfM0=;
 b=EGRVEZGp2BphL1vit7SaL55brwPvkKt8xdWz8r2U0OnSauZro0vFnzF0NVXsQ46X/uQwQSwTYVQykrD4cT2SweTKxQc54dc2WVV9/HdNdVPVQe+lmFiOaLrIbocv8zhN65HmlfO3ZTRk6oxl4Bu7BpzDq1nHViQCP6+10rMDBI0AYNyd+6+lz4SFlvLhk9PdR+SZh+1pYSBSrzIFsN1yhsy/laV2AGn8ArgqD+oGfq+JLvKhJkJFjLsbrSntXhCwmUPK4drCEd3bcv9sy2eGSrwQOIp2efW8XyHYd7VCRTMMpwNGOEWbQ2H6WYaHBRN+/Et8KPFoZY2p/JHeWt2YcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JVQ+AUSa2O8lPjC8zY2F0HyAKJMBLoSAHxI1phpLfM0=;
 b=DqByXa8vG/DVQGcYD6Odmd+IgVxIiTcTx1C5bNkp24uWp5NWNjkWcwaP2ff3jUg5wpOpwJLT4H21mc/0l5bhQicDIGF+8aLvHrL8e20RiL50GWDL9PkegWl+RRNWHMpALvUBLk2lsjhnuSI9LZzaDFeRwuOcrarUtI/kt1im2uIT/UGzBwShahKCQ6QF+cLD8Fk/VaNrwLj7vmp9FHlh/Tfc1om2cNvVS0JtEadgiUe9Rs5+sheFHhW6dlBEDaiMySgOY2ni2vF2Es/32j4irPTfhWWye52FGy7E6CCRhdV3kV+btJLqJi2a6tDLpnn8ooO/vvzJOct4Zro4dzlmjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by PH8PR12MB7112.namprd12.prod.outlook.com (2603:10b6:510:22c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.20; Thu, 26 Feb
 2026 11:47:17 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.007; Thu, 26 Feb 2026
 11:47:16 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Thu, 26 Feb 2026 20:45:41 +0900
Subject: [PATCH v3 9/9] gpu: nova-core: gsp: add tests for SplitState
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-cmdq-continuation-v3-9-572ab9916766@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0334.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::12) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|PH8PR12MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: 76da6bf0-a7cb-4f28-d162-08de752cca54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: Y2SCgDlpn8SuEskmdJHmUR0fj3bQWCT5zaOySRn6ujM5IbWydyaGkg6IThYzPnw2PsAS4MdKkC65b0jKMP369yh3gZ6gZuku8ZN+rFs46bX/sD4FoN0KBSUTO4J/TLQ5ucRndcEmME3YSX5Y8fu0SA2y5mRBPD93FWOq7R/V+P4Kbkgo2mlRCkTkaXK5pq7oD+XYSMA/YJINQV8Q1wBIDziKNIGEtm1oely9HqzJcujFL5AWEOe59abG++ANkpUPR4Hv3djEk3kCHEo0Ni78IRPkZn8YTRmzavYp8au3kw5rZLFTPryWfoIstvwQJ9GW1G0Ihrd2z8dO6uYsklgRcj6dcVUMo9UsddK6yeH2J964sELAHysfe1GKYHQgYfkEAuq18sielZa8zhmimQvDqB0DhQcHxK9g7q8k8KNuPtWKtzEbT+wHQsO/qWk03KjClauk7meVB61bXTUiqNtbHiPvg4iumZLbS0TQFdE0aKrY0rBtSqaHJWmL46+ZDUN3fr4OTfEQXT/gYMdnA8dLuev9qzbwCKRvvTerxq6fQS/mP7zl9KfpzOikJeGDnLyyFZQ+GoefuIHfe1N1RSDYC3qKeWi8GcQ3qbnhHT9DlewFttUKedf7es+AtPAAF5oPzF/pE3WJHs+G0gmoR62VjiUg8p90QqdciHZ0Koq/w4uM/gInm1b8hjhIve/1p1zef97x+P5xj4FpVooKaLz/zhjagU8n3fXSxmNY21cZHno0kanHZwcGORWwTmARsRTEzU9wsdOpGubLwsxt5DiJSQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFUwc2ErU0hKdHRoV2orbjl4c203Rlhvd3BraXFzYUZsMncrZFUxMk15eCtN?=
 =?utf-8?B?SnFOYmZidDUrQ3ZtSEFhZllJVWdlanAvTE1pSmdScVU1Ti9HMCtCdjRqREw4?=
 =?utf-8?B?T1BtWWphNkdPclNiWW5VZERVL0ZLazhoN0pCQWFWOW9UZWxqbUFoNGR4UDVT?=
 =?utf-8?B?VUZlNmhNNU9GOVdQWCtoT2xyOHJGeUVXcEJFRVpYV3JtN2FKME4vME04bW5U?=
 =?utf-8?B?VWYyL3k5eS9ON2tLWjd1Zjk3c1gvSENmM1BwNFFROUVJVSs2OCtyNFZ1SXMy?=
 =?utf-8?B?R25yM0pVTUtXT3NMOTl5TU9PMTFEWXBpZDlUK0NaVHB3Ujh4WmJGM2pMSmd3?=
 =?utf-8?B?cmE2R0Y3K0tlQzlZYjI2Y2ExYTR1VlJsLyszcEZBeGFJQmZUNEgxaEVZNldF?=
 =?utf-8?B?eXUrcXFiMDVnNllvQjVhV2xGVnJzcUZ5VllQSzcvN1U4ZXArSHhhWEdvSGxL?=
 =?utf-8?B?eTBFblIreGJ3dWtvU2xaMWVCZlhGVjJFekU2UGkvaWN2Q0pKS2dVazlOblps?=
 =?utf-8?B?M25pbU4vaFZrR2R0alZ0Mk5sa2NuSWVoZFJUNDJhSERjVDZJSTNoaFVNUDht?=
 =?utf-8?B?dWdGZUhaMURvK3RZLytKTW5aTEpFaERzT1FUek9tYlo5U0hvUktSMTRIRjdS?=
 =?utf-8?B?dENxMmNEeG4wazJwSmZET0NpcGFkcDcyZnRmcXVOU2RiR0JOVjhjTUZZU1RR?=
 =?utf-8?B?cFdSRnNQTmsrdFNSeUxOV2VHRE52NEw4V2pPUTBHK1BER3AzY1EraTZ4ZWha?=
 =?utf-8?B?MFloNUxiRGlielhtMVJualdiRHhPV0lXTXFBa0wrYUpRRUdvbzRKbVp1SnBS?=
 =?utf-8?B?WmRrdTNLZ29pOUoyT2xjbEhxTmZUS2pwY05RcC91NmFmdm13b3lZZzZHcmE1?=
 =?utf-8?B?U2ZCTVlZOW5tbUpIamNJNk5vcUtTWFdETFQ5UmovSy9nNlZkSXN2NFBpc3l1?=
 =?utf-8?B?TTRhVEY3RGtPaHhjVVY1a2s4SWdtKzJJRDdFWFdsQVV0S2tUWW5wSlZGYm40?=
 =?utf-8?B?STk1R0xmbUNXdXY1SUFtU1Yrc3hJRUs1VWk1NzcySWtOcFZiRnZiZ1l5R01Y?=
 =?utf-8?B?dlZrcmVGR2lYbU5RUHh1OEZjTVFKSW9tQW5rWlVnY1lseEpDMm5SK0ZYWlVk?=
 =?utf-8?B?NFBBbU4ra2FsWExKcEhGbmpFeE40SVRWcmlTSDR5UllWZFFYUFJ6dnJGTUhX?=
 =?utf-8?B?Rld1Y2ZGRHNuK1prMHBPTXMrcEZUSHJzS25Zc2gxMzZwcjZNQVJMR3dMSCtX?=
 =?utf-8?B?Zi9FVUZrcGZUV3dsUjhmZ1YybFR0SkpvSWtjQThsajVvemxOTDR0M2RCM2F4?=
 =?utf-8?B?bnczZ3RGZmdrMnd1YlIxcGhwYllVK1FXMXF5QlgveGtNelgrNGowRHBQbkxJ?=
 =?utf-8?B?eXNuNEd3QUVJTGp4ZkJyamFwSWRPVWExWlNtby9kMWJtVUkxd3RJbkkvY050?=
 =?utf-8?B?YzF2Y0NZaFR0bE40ay8yYzFhcnpSVGJTeXFlUnY3RmdWTHF4V1lmMW5DYnhS?=
 =?utf-8?B?M3NjSFhINHRQRlJYQ3FDV01SMzkyVm9jd29ZNXNBbkE0TmNhRUd3T0V0c0k5?=
 =?utf-8?B?ZGxWbUJ3eDJMQkcyelcxdXhpNlB4UGlLc1FBeC82UktDbDcyR2NyY1RoM291?=
 =?utf-8?B?cUo0ZHZCN1MrUFBHcHA3azIwRkl2Q1ovaGxlMC8yVjFXcWoxTUlrK0dIYWUy?=
 =?utf-8?B?WkFiUU0waEt4eWM1YlVydkg0TkZBRmgrc3J0T0hBVG82MkMyb0lhOThxZTZq?=
 =?utf-8?B?MjJFU2NmWjBkZ0dsdG4ycXBuUVFvcWlEWUhzOStRa3l3ZEhPYlZTcG8yYnRj?=
 =?utf-8?B?NUJ6bmc5SThqbTZTNzdhWUQ5RzZUbThZZmRSVEh1UHl6eUdpMEtTNUlOSnds?=
 =?utf-8?B?RnA5M1l0b0s2R0U2MUZMMDJHdGl5cndjK2dSdXdiWklmMlVhNnlCa0RvWDVJ?=
 =?utf-8?B?aDhnVWF3RWFPTXdIQ21sclJtVmVJVnVlbkRkdmlMSlk1MHd6VnVKWjVsaURE?=
 =?utf-8?B?cXhvb0dEMk1aMGprSlhEYTkzNE5uM1lLZ3dHUVYyNkM0eVVQZ3RsUVJVM2Vv?=
 =?utf-8?B?ODQvblVnd3FabWNydkhSVHU1M042U1RCYUZ2K0l4djlBbmhSaFJSb01VZjRE?=
 =?utf-8?B?RkFmOHdRN2lhWVZnNkpRM2FOR0dCSUN1OFFQRE16RUFJbldTOVEyT0Z3QXU2?=
 =?utf-8?B?aHNUeG0zVTZzSEVpQURBM0R0V2lUOFJrV2N4NXJxc0pxWjFlOWlKaUo4eGZq?=
 =?utf-8?B?NisySFU2TTRja0ZsK1AzbmVOSFZnZnMzUWhMQkdmM3NGYWRINWVIOVY5eXJr?=
 =?utf-8?B?dFdlZjRTSWUwQTU2a3JOL2ZsVHY5WGQ3dVV3R3NydlUycFFYZkNlR0I2TUhn?=
 =?utf-8?Q?Lc+m2TdxAQkKWRP4yktqDs18cFBe9fMGsxOFSNUrVMv3l?=
X-MS-Exchange-AntiSpam-MessageData-1: kHAScp5Y5R+aYw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76da6bf0-a7cb-4f28-d162-08de752cca54
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 11:47:16.9203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6TNF7u57JvLzGATr7Qc5NZsFxXNVQulAuW1ehdLxhjfFCIP4hzUD40WyASEBSlhgd8M6UO6EBNsDxD4HnOK7Ow==
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
X-Rspamd-Queue-Id: 88A081A5502
X-Rspamd-Action: no action

Add tests for SplitState. They cover boundary conditions at the split
points to make sure the right number of continuation records are made.
They also check that the data concatenated is correct.

Tested-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/commands.rs | 114 ++++++++++++++++++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 6ffd0b9cbf05..74f875755e53 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -384,3 +384,117 @@ fn init_variable_payload(
         }
     }
 }
+
+#[kunit_tests(nova_core_gsp_commands)]
+mod tests {
+    use super::*;
+
+    struct TestPayload {
+        data: KVVec<u8>,
+    }
+
+    impl TestPayload {
+        fn generate_pattern(len: usize) -> Result<KVVec<u8>> {
+            let mut data = KVVec::with_capacity(len, GFP_KERNEL)?;
+            for i in 0..len {
+                data.push(i as u8, GFP_KERNEL)?;
+            }
+            Ok(data)
+        }
+
+        fn new(len: usize) -> Result<Self> {
+            Ok(Self {
+                data: Self::generate_pattern(len)?,
+            })
+        }
+    }
+
+    impl CommandToGsp for TestPayload {
+        const FUNCTION: MsgFunction = MsgFunction::Nop;
+        type Command = ();
+        type InitError = Infallible;
+
+        fn init(&self) -> impl Init<Self::Command, Self::InitError> {
+            <()>::init_zeroed()
+        }
+
+        fn variable_payload_len(&self) -> usize {
+            self.data.len()
+        }
+
+        fn init_variable_payload(
+            &self,
+            dst: &mut SBufferIter<core::array::IntoIter<&mut [u8], 2>>,
+        ) -> Result {
+            dst.write_all(self.data.as_slice())
+        }
+    }
+
+    const MAX_CMD_SIZE: usize = SplitState::<TestPayload>::MAX_CMD_SIZE;
+
+    fn read_payload(cmd: &impl CommandToGsp) -> Result<KVVec<u8>> {
+        let len = cmd.variable_payload_len();
+        let mut buf = KVVec::from_elem(0u8, len, GFP_KERNEL)?;
+        let mut sbuf = SBufferIter::new_writer([buf.as_mut_slice(), &mut []]);
+        cmd.init_variable_payload(&mut sbuf)?;
+        drop(sbuf);
+        Ok(buf)
+    }
+
+    struct SplitTest {
+        payload_size: usize,
+        num_continuations: usize,
+    }
+
+    fn check_split(t: SplitTest) -> Result {
+        let payload = TestPayload::new(t.payload_size)?;
+        let mut state = SplitState::new(&payload)?;
+
+        let mut buf = read_payload(&state.command(payload))?;
+        assert!(buf.len() <= MAX_CMD_SIZE);
+
+        let mut num_continuations = 0;
+        while let Some(cont) = state.next_continuation_record() {
+            let payload = read_payload(&cont)?;
+            assert!(payload.len() <= MAX_CMD_SIZE);
+            buf.extend_from_slice(&payload, GFP_KERNEL)?;
+            num_continuations += 1;
+        }
+
+        assert_eq!(num_continuations, t.num_continuations);
+        assert_eq!(
+            buf.as_slice(),
+            TestPayload::generate_pattern(t.payload_size)?.as_slice()
+        );
+        Ok(())
+    }
+
+    #[test]
+    fn split_command() -> Result {
+        check_split(SplitTest {
+            payload_size: 0,
+            num_continuations: 0,
+        })?;
+        check_split(SplitTest {
+            payload_size: MAX_CMD_SIZE,
+            num_continuations: 0,
+        })?;
+        check_split(SplitTest {
+            payload_size: MAX_CMD_SIZE + 1,
+            num_continuations: 1,
+        })?;
+        check_split(SplitTest {
+            payload_size: MAX_CMD_SIZE * 2,
+            num_continuations: 1,
+        })?;
+        check_split(SplitTest {
+            payload_size: MAX_CMD_SIZE * 2 + 1,
+            num_continuations: 2,
+        })?;
+        check_split(SplitTest {
+            payload_size: MAX_CMD_SIZE * 3 + MAX_CMD_SIZE / 2,
+            num_continuations: 3,
+        })?;
+        Ok(())
+    }
+}

-- 
2.53.0

