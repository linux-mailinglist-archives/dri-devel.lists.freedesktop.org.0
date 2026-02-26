Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPabBLQyoGmLgAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 12:47:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE6B1A5485
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 12:46:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A23E910E8F8;
	Thu, 26 Feb 2026 11:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IAzwdK5t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013002.outbound.protection.outlook.com
 [40.93.201.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F081610E8F3;
 Thu, 26 Feb 2026 11:46:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NakLcKZlmFIX2kmbMnjyje28GKFvHN0rG94gMmEgUOOuEoducbmj68qL85Af20Pfqc1NRjA/AqT6dAur3YSdv3GmwU/VMYGuyY2m7Jc2vanhh6Fo8953dXaMoSwNV11CTDPOjPzWrVeDIJL9z5lX/Qe931pjPBGYlWPWJwNZ11ExBHvHpKwDplnmtafuekNLSNASJaDDhqWBQmIpc/+DwVsrS+6hpWITKX7pqNPec0AkUWSSs8gJXJra7XnAommyiXLvBYTYDCzS/v0KOc+68KOkanOXfx9pz7g73eSNStGj2I91x+/PJRcjeRhrzNb297GTttx3bILTTlwmBmWnHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yLnBNSG3LZd9hKsFkZruHcQsngzYJOAs65QeLA9FC/E=;
 b=Ymg01p6I3l289mj+ATY03mhP8CxgmyXsuXvpRIzJyKMTKOkZfmjfC8xUo6EyN9YdbxLfDY9F2yyACruvKsoV8Vro+wfwNvt8YrN10AUetinTgAGK8A/AspQx+RpuLTCFyZGbRCX5dqjhMeAhThbppkGavnGwPU+zUsuWLbhL1i9a8MYQ3cfMP20VgU3vbUS1ppeyvZIAseuv24UEY8YbBnGBzotjoOO9njgwXsPi3XMfM1nsS8sY7bJ+dH4c4euo/V8k4nWxlVuLD8VNN6mEL1h+MxKn+2WTm0QzzFnNk4Xob8JL9eru6gn4zovv+IZIZ0F3qlVHF6W/NQFBFRLjRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yLnBNSG3LZd9hKsFkZruHcQsngzYJOAs65QeLA9FC/E=;
 b=IAzwdK5tWkbZrlN2eHmy25TOa4sq4esamXUcwpEzB7X0JkXc5za8vXsRhbT5Zy1XcUkyB/4C5fpjQ1MWF5SYYD1MgYvIy2OGCbRsAJry3Alj7/2v2ZsXUt/V8tpkP66MOExdROrJJpMlhn6GQ9zFEAHILKnPdCH3KwEaNV2nlGePh2Iz/goUpkiKWJeGAe4Fl6Hhkfov3IRCm19pT2aHsce0tHF8Qy6KVKegzE3SPTxYdiPEw2KrHbo+YMlluD6qqALBRVBwjhN4n8LaIsC+ciGniqIUlYaabroZXbWt8Z86uWo7HVxsSs5OzXD/0brdimk+U9l49T2nWFgbqqBNzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by PH8PR12MB7112.namprd12.prod.outlook.com (2603:10b6:510:22c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.20; Thu, 26 Feb
 2026 11:46:49 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.007; Thu, 26 Feb 2026
 11:46:49 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Thu, 26 Feb 2026 20:45:34 +0900
Subject: [PATCH v3 2/9] gpu: nova-core: gsp: add mechanism to wait for
 space on command queue
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-cmdq-continuation-v3-2-572ab9916766@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0097.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::11) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|PH8PR12MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: ad08e6dc-efb0-465c-d94c-08de752cba0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: JDfVImzXqICCsMDlNRg5sqC2T3uHIxRXYF9NyyUrPbAN7MJHfoDR19yh5OaUHf9jHAWBOvLDg92r3/ReOJ/YCcmb0j7xoOZMgjqYvc4DBi/IccXeeyFWGgeX1wjhfLUiDrys/a9TMuvu34htXTbS3wv30wYEx8n4JkmATMolzT4K0E6zYq6vg9+8JNn6A/OYaqOihfEa6ygdhqH1xHZ/n7dEMu75B6eS+ODObdZlgbvubKHcYq4HIj6gkO1zxjiZBp6eaIiEKgrx8f0WWj1IFb2Aae6wW/q+QmgSHEL2hPRbvEq4EHYSA2ZiKQLsf196vm+XhmFBgLtqPdY+kE3Vr2sVOQF45T9tm+cadwlyago6hYn45AIEaqkMUWB/PpYCsR/mFx6uPf4ipcbpjV6iUyuFCe+O9mgDfo+no9Bdoo6HnKE9TIEytwmfNy29V5X9F2iTlXKQ713IJX+CFJP9a84cLUIGrKb0gUuc+2OW4OKSA08XAIjrKgdq5hmDjtP4JmF8F1l6ND3PNzFsUN3ZLFxo1J0BZWYiDCHSRUkkCBX07HMOvUMH0wmnn3rqbcIA3d7/I8+VCwEA69qg7kX+d6sfai2I9spiALwafgZYjutSPqeFSfvMLIv7FsfVbXO1xJg1yc7nYwDJ5lvasKJMPqPZym0mbNHNOrtJ0qX1vLOKwxT13vd1XjTkwF3xqRIes2OVWwcwNpadeqa2cZQf1szLi/qKUwcKSnhe0+ieqAOR1SDKpwLDCeJLBIqwlrjLXQnPWl11Tqn4ztVmH1lOlg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sll2dk92UFNLR05VTjI1OFp5WWx5VnZuU254RGMzRnFCQ01zdFQ1cEw0cnlt?=
 =?utf-8?B?MG5KbW1UUytnUVlrRDZhK243b0oydkMxOENreFYwM3ArQmR0SlRob0Y4V01X?=
 =?utf-8?B?dzM5ZlZzcDNyT0tTN1I0Y3l0ZTUwcXNSMlZ0K2xBNlZxMEJwd09lOW51TjR1?=
 =?utf-8?B?VStPQ2d2YmZMTVpraWhVeTJYSmlUbHdzMWZneEoySjFuSG12Z2c3cVB2N2Vr?=
 =?utf-8?B?WDBzWWhWSXo1NmhTbFhHdGNZdzFuWXRkZG1IRnlVWlJNOWorZ056V0lOK2Nq?=
 =?utf-8?B?N0l5VXR0YngxcmRWSWhVL01ZK2wzelhYc1BpYlQ4NW4ydWxOd2JPZ0MvTEFK?=
 =?utf-8?B?T3NsYzYxZ3MvWEE4YWlwYUIxMlI2MFlGOCtTNys2N3Z4MXZsaE1oRFlJZWQ2?=
 =?utf-8?B?MlhzMS9XSE15OFBVVTliWGYxSVJUTWdhUUR4Q2s1b0JkeU5YNnA3VmZ4TG5K?=
 =?utf-8?B?b0VPV3JBWDBJSW1LVUw2UkFNYTNxS2s3YnU0UjBXNTAwL2N3TS9uQWwxYVFj?=
 =?utf-8?B?bWpXZlNGa0FHN2lpbThXZ0RHNVd1c29pQnUwVjRxNWUxK2JZblNBdWNjOUUz?=
 =?utf-8?B?ZDlDb0lCeTNvcnE4YTZWSkRycUVGcEhkaEYvWk85cGVIanBXQ1Z4a0YyVVov?=
 =?utf-8?B?TXdiRnh5bUxuSXRPK2ZtSEh0ZFlQYWZuNUI5d0I3a216MFlBeXBaZHRyS2RS?=
 =?utf-8?B?MU5MdS9majVaamhRUUhLZWJ5eVdZYWZ3UWFkRjViSGlrdHhhR3NsRlFOeTRM?=
 =?utf-8?B?N1ozV0NwOE1CSERSOTB0TWhKOFdCbnY2QTVzVEw1NE1rQU5rRHlHYWwvbGRs?=
 =?utf-8?B?UlZDSlVsa1l5cTFRUDVBSXl5cDQrc2dVTDZlTGNNVE9FWFEyUDNzM3Q3V2Fh?=
 =?utf-8?B?emppTWcvQkRsMGc4NTErRFk1THpFaGFneUJMYWJJcGRIVGdjTnQvSkNxSnJl?=
 =?utf-8?B?QXJNS0ZNTmVtVURkSFUxWTJ5dTlIK2pGcjA2RGZJREIybFlCcTlXUDZ0Rk5t?=
 =?utf-8?B?c1ArbnBZRTg5aXEyTis1UlJ5WS9xL240eEhjaU5pd0FHTmpISTJyVzJPV25i?=
 =?utf-8?B?enJ2blN2aW1EQVVwNSszd1FUaTB1ZktBaENDcHF4b1A4U0lnZFNCVVkwQUNn?=
 =?utf-8?B?RDJOUWZocFMrUEFjemZqdERlTXV5T3gyV1ZZeGdnb3NtY0RRZzl1RitmSnpX?=
 =?utf-8?B?M3VQRE9YNWQ2ZG5mdDdSZmphblN3eVUySG5ManJDK2E2d25wdlJNZXp6bFpu?=
 =?utf-8?B?TXYrY1BkYXNORjJUR1h3UGYzUk5LQm1YUlpHVnFRcnBZTTgxZCt6QkY2WWZG?=
 =?utf-8?B?UktyRnluNE0yV2VDRUc3SFVaa1VlVG00T25JQWNZVHg3VWd3bnBMZ25wWFdC?=
 =?utf-8?B?UjFSTHRZa1lvdncyTFJ0d2RBU3hhSTNLRnFwRGdQc2pjYWtQMlVhMklIa3F1?=
 =?utf-8?B?Z3BTRzRXdmo4RFpOMUxZald3S3MzRk0yeTlnc1JKUk1BclVHYlFwWW1udlBH?=
 =?utf-8?B?eGdGWU5QRWhacGQ4Zk1KdXcyeStrenF2dmo1Qkl2SEdsVG5DdmR0bnF2Si9p?=
 =?utf-8?B?bXdkbXRLOC9TN25sdjFiVFNkSW5DeUtkQjVNSEZ4QkhNenJoeEdVZ29KRWo2?=
 =?utf-8?B?eUdWekhBK0pNamE3dGJqM0RZaWZuMVdnYkU4SktOY2xLK0N1QW1Bc2JuOStK?=
 =?utf-8?B?STJmOUFXQjdITDliNndUVnNxalYrZlNoUG5jTys3dU8yQ2dtUXJacHZva2d3?=
 =?utf-8?B?UC9zUkNJSjNxN0U3RzR6MU9hYmdEWnhOMmt6RWphRXhVNW5XbWRhQ0RPRHFR?=
 =?utf-8?B?UEx2K3hIT082M1cvM2NEc3JObmFldHVMQVV1V2ZQYUtxL2w2emVNMU1pNWFW?=
 =?utf-8?B?RzA1Ukp5OUxEeHpBM3JnZVczYWtxSGlscXRvblVIVzIyVlpJOVNkTjZkakFs?=
 =?utf-8?B?VjZSbFArUkF1K2J6TXV2UG9xamltdkZmZDJTNGpkWkdqRVNYRWNJdkNFY2lY?=
 =?utf-8?B?V09PVHFsWlROTkZiRUZpb3VTVFMzU3FYQTBFYjI3a2MrQXl4bklSWE0wN3dB?=
 =?utf-8?B?cnM1emUzbkZHc2UxWHdOZVRVVXhLUENHWWhnMzBvMkNwZE9uSmcvaGxDTEd3?=
 =?utf-8?B?aGRyeHhSa3U5ZlFGUGJEeEtiK1NmZTE4ZWJQVm5oc3ZSL1FSWnZwSFpHaWx2?=
 =?utf-8?B?MjVyM1V1WmZBNTc3aDZ0YzIrelkvU0ZNRTRjdjBRYVpEM3hCRHdpbkhlbE10?=
 =?utf-8?B?OHVmODJ6REMvQUN5aUhvb1Z5d3JiajdscUNxZlVOaHQxbDV2ekFsaVh4M2RJ?=
 =?utf-8?B?ZG5NZi9ISTlLSlByMzNuMmNyZ0JRWUFCTHVpS1ZSYVZETTI3NUtCWExMQTMz?=
 =?utf-8?Q?QaxzvHw8G5V7Lw3vMQw8Hn347YYctjoXa0kJEvNFo0o/9?=
X-MS-Exchange-AntiSpam-MessageData-1: aAcJL3ze9nBZlA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad08e6dc-efb0-465c-d94c-08de752cba0e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 11:46:49.4679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PuEq++DahqlmBihDm4537G6Qew8XEE+4eeQG+SSTqsIJuX+OAtsHiHxPZz4WUjyEfAtKNPW14OlWHOSsicWZGQ==
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
X-Rspamd-Queue-Id: 9EE6B1A5485
X-Rspamd-Action: no action

Add a timeout to `allocate_command` which waits for space on the GSP
command queue. It uses a similar timeout to nouveau.

This lets `send_command` wait for space to free up in the command queue.
This is required to support continuation records which can fill up the
queue.

Tested-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 39 +++++++++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 87dbbd6d1be9..efbbc89f4d8a 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -250,6 +250,19 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
         }
     }
 
+    /// Returns the size of the region of the CPU message queue that the driver is currently allowed
+    /// to write to, in bytes.
+    fn driver_write_area_size(&self) -> usize {
+        let tx = self.cpu_write_ptr();
+        let rx = self.gsp_read_ptr();
+
+        // `rx` and `tx` are both in `0..MSGQ_NUM_PAGES` per the invariants of `gsp_read_ptr` and
+        // `cpu_write_ptr`. The minimum value case is where `rx == 0` and `tx == MSGQ_NUM_PAGES -
+        // 1`, which gives `0 + MSGQ_NUM_PAGES - (MSGQ_NUM_PAGES - 1) - 1 == 0`.
+        let slots = (rx + MSGQ_NUM_PAGES - tx - 1) % MSGQ_NUM_PAGES;
+        num::u32_as_usize(slots) * GSP_PAGE_SIZE
+    }
+
     /// Returns the region of the GSP message queue that the driver is currently allowed to read
     /// from.
     ///
@@ -281,15 +294,22 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
     }
 
     /// Allocates a region on the command queue that is large enough to send a command of `size`
-    /// bytes.
+    /// bytes, waiting for space to become available based on the provided timeout.
     ///
     /// This returns a [`GspCommand`] ready to be written to by the caller.
     ///
     /// # Errors
     ///
-    /// - `EAGAIN` if the driver area is too small to hold the requested command.
+    /// - `ETIMEDOUT` if space does not become available within the timeout.
     /// - `EIO` if the command header is not properly aligned.
-    fn allocate_command(&mut self, size: usize) -> Result<GspCommand<'_>> {
+    fn allocate_command(&mut self, size: usize, timeout: Delta) -> Result<GspCommand<'_>> {
+        read_poll_timeout(
+            || Ok(self.driver_write_area_size()),
+            |available_bytes| *available_bytes >= size_of::<GspMsgElement>() + size,
+            Delta::ZERO,
+            timeout,
+        )?;
+
         // Get the current writable area as an array of bytes.
         let (slice_1, slice_2) = {
             let (slice_1, slice_2) = self.driver_write_area();
@@ -298,13 +318,6 @@ fn allocate_command(&mut self, size: usize) -> Result<GspCommand<'_>> {
             (slice_1.as_flattened_mut(), slice_2.as_flattened_mut())
         };
 
-        // If the GSP is still processing previous messages the shared region
-        // may be full in which case we will have to retry once the GSP has
-        // processed the existing commands.
-        if size_of::<GspMsgElement>() + size > slice_1.len() + slice_2.len() {
-            return Err(EAGAIN);
-        }
-
         // Extract area for the `GspMsgElement`.
         let (header, slice_1) = GspMsgElement::from_bytes_mut_prefix(slice_1).ok_or(EIO)?;
 
@@ -497,7 +510,7 @@ fn notify_gsp(bar: &Bar0) {
     ///
     /// # Errors
     ///
-    /// - `EAGAIN` if there was not enough space in the command queue to send the command.
+    /// - `ETIMEDOUT` if space does not become available within the timeout.
     /// - `EIO` if the variable payload requested by the command has not been entirely
     ///   written to by its [`CommandToGsp::init_variable_payload`] method.
     ///
@@ -509,7 +522,9 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
         Error: From<M::InitError>,
     {
         let command_size = size_of::<M::Command>() + command.variable_payload_len();
-        let dst = self.gsp_mem.allocate_command(command_size)?;
+        let dst = self
+            .gsp_mem
+            .allocate_command(command_size, Delta::from_secs(1))?;
 
         // Extract area for the command itself.
         let (cmd, payload_1) = M::Command::from_bytes_mut_prefix(dst.contents.0).ok_or(EIO)?;

-- 
2.53.0

