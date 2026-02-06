Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +M2NHxHrhWlvIQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 14:22:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3BFFE0D3
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 14:22:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5856010E035;
	Fri,  6 Feb 2026 13:22:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UzTUopk+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012026.outbound.protection.outlook.com [52.101.53.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C3E510E035;
 Fri,  6 Feb 2026 13:22:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gsdpPtWIhWpjBspTNoSTNQwttrwLDH2XAL4JzyrQcd2hr1tIjf8/6yCqymkmWivuTUuFZFpiqSVqBxytPWn7FAY9y4aidPlOOm+jPY5ZdYvjsbJRj5mCUa9d4mS7YDAMGZ3ojfZmg0hgTd7wOnatlfZhvZnLkUd0vGMSdCNSYBd1JviK2mgkJD9DqavD5VEDUyD+ZdPIBoRxnouq0Gn2FkzR49T6iIJF9R0IgDydEGvYeh0/H0FVQJ9hFYxBlsoxstFYbDuEuogi+icBopAdzFq2L+ARwTs8MEOeYKxVCRkTUNX3HvHoAu0QQqqg+A5i1QryZZyQAAfGZtlil4QEVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vr1rs17iDjg4x+UDWVzh/6r98xEFANbondShi+yZtQo=;
 b=hLYcLAIs8Fjjw6qFNDGoYLToViEZhWpbh9bYWsmnk5FkiVHbBZwuN4tAR3SysFp3ryKvgt8cvrxRbO5HFnFVmWD5XPJdbGvPEXPu01j+vDKgn2vRQv2nofks1bYovadbHIcYThvCveaZ7WoClt5XAXHHA3cQkuqH/MF58TvjA4LZW2qjVZAhM4nQ8eijle/LOjPdBptJjrhAbi0UNDzZ43ryS6+gJHa2SvOYl5LOuxZEc4NGtVH5G5G2EP13ZV066LfiTsoqYQZEPZnjXC1Pu4yDfZpxZyngDrU0HdJ0GfStlV8ScFiXDgFOMpulx/UUWoxp5CbKpn8FiCaMilJ+SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ursulin.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vr1rs17iDjg4x+UDWVzh/6r98xEFANbondShi+yZtQo=;
 b=UzTUopk+kgycY1+tVUZxiOgK0jkvgShPFROhiWjgLEQv/q1Fr9XPEThkGqSUskfpB3w4XBGzNTqpYhaReovV10fhmHhTqP1PahRaMMzQ1KmXl3K+yVa7fC+XaYP263QurRjtBCAyEtt5fjOMD6PPUK2oFJaup6Ke07dpLUmlvL8=
Received: from SJ0PR03CA0170.namprd03.prod.outlook.com (2603:10b6:a03:338::25)
 by SA3PR12MB9228.namprd12.prod.outlook.com (2603:10b6:806:39c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Fri, 6 Feb
 2026 13:22:15 +0000
Received: from CO1PEPF00012E83.namprd03.prod.outlook.com
 (2603:10b6:a03:338:cafe::f) by SJ0PR03CA0170.outlook.office365.com
 (2603:10b6:a03:338::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.16 via Frontend Transport; Fri,
 6 Feb 2026 13:21:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E83.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 13:22:14 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 6 Feb 2026 07:22:12 -0600
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>
CC: Tvrtko Ursulin <tursulin@ursulin.net>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v6] drm/gem: Make drm_gem_objects_lookup() self-cleaning on
 failure v6
Date: Fri, 6 Feb 2026 18:51:41 +0530
Message-ID: <20260206132141.1474191-1-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E83:EE_|SA3PR12MB9228:EE_
X-MS-Office365-Filtering-Correlation-Id: a1d2083a-c1c2-4a9c-6a5d-08de6582be63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1NMZ2krb3h1b0wwZkVuV0Z5VTUwQUthR1R3V1c4bm0wcG91bFBhQUp1TDBO?=
 =?utf-8?B?QXEyODlMTnYzeHlPQVJmSFZxTGg3QmdpNmxTK3RlY1BtOEhzTnRYMDJQdTRC?=
 =?utf-8?B?STFhUGxFLzV5ZDhIQmo1S0NwS2xiQUp6WUh3SlZoV0s1OE1lWklicEZXcWo1?=
 =?utf-8?B?NzEyZ2M0RXFaQXlYZjFFOUFDZ1d3OUtjdUJNTjBBcUt0OWdVd0crYVFmU0xW?=
 =?utf-8?B?SzhNbzlmNzVLYzc1NHRTSllVc29Xc29tYVd2NTVialhyN1hOUnN6SVFhUWFp?=
 =?utf-8?B?MkkxWHhrRzlERS9qTHI0WExxYnh4OWhISCtXRm44dHR1ajc5VUNFMGFLZXMw?=
 =?utf-8?B?eUk4ZHFkVE5nNElDVjI0L1h6c1FnZXpDb2p1R09qdjY1elFGK1BMdklXZVJz?=
 =?utf-8?B?NDdzOS93N2JQVmQ3UURtOS9ucVVTNDk5ZU1FeE5DaDJIZVlNWlhTVnovTUVl?=
 =?utf-8?B?RFMvVlJFSXdmanJZVmJVWkhHcHMyUW5QdmFhejl2R0dEUnMrZUZVVXZOSTlR?=
 =?utf-8?B?SWpuUkNiSUZtS0hya0pzc05xczh0SVphVjdyalV3M1lYaHVVYzV6elpTR0Zk?=
 =?utf-8?B?TUxoWWJBbkEwakl3bCtqUExHMytyV2hFK0ZGRSs4aXZBVSs5b2c3Nm5XWVln?=
 =?utf-8?B?YlZPL01ZblI5Uit1djRaSXJOY2xZTjNiaVBnNy80bmZYZGgwQ21RVGNUY2Q4?=
 =?utf-8?B?Tjc5OEtYSXRpcGJxc0Q4emhWa1E5NUM4MVlvMlhTb3A1L3VjdFdxMTFla2ts?=
 =?utf-8?B?dktNR2Y0UWFwa0FDeEYvcUdoRVVKc3lnTU42a29yNlVTVVlKVTFvSlFUcWF3?=
 =?utf-8?B?bGtmVGpvR3YrTVJwVG5VU0NsTjU1Tys4bHdEZ0dFZHpjVjExSG1FVmJVUTZK?=
 =?utf-8?B?WHNzbjR1MUNvdS9tTFNTZklkb0NBUGN0bjN6ejVVTXp3MnZCVHRYeW9aMnVG?=
 =?utf-8?B?L3JaeEdOT3B3R0JicXR4SSttclY5QmhaOFQ1Ui80T01VeXNjRW4yeUxXRXdk?=
 =?utf-8?B?cUZvU0Q5c25tN05WcU9GTXZWOGJwbGNNWVQ3MW9SS3Q0c3JFdlNMSE1qTmxm?=
 =?utf-8?B?bDdCdTVJOUlIVWlya3V5WjZwNDBwUzUzL2dFcm95cFlHdWQxYjgzNzNZVDgr?=
 =?utf-8?B?MmJrSlZWK2xENnBDRnpYVndnUy9UTGNZWXdjM2QwMjVuNzNVbFo3alVaNVEx?=
 =?utf-8?B?UEhYQVBoTzRWMnRmQ29GK2hMZEJUcFAzZm5XaW9xbG5MYnhLS0phN1VlZGRu?=
 =?utf-8?B?M2FUcERTRDVrRkl5U1ZFSk04VE1SNnZwVHJKK2VUZUxYcHFNcjJKdEJDNlRI?=
 =?utf-8?B?dWlFTWgvRmdSOUVHUzFLWE9uVjZidm5JaUdkR2pLYlltUkV2UUxzU2Y0cDRM?=
 =?utf-8?B?MlA2c2xkejRoSWwxa2JEcWVyZGRpa0JOT2xxVy94SlNPNW84MkNzMWRvNlZD?=
 =?utf-8?B?aFd0SEJLYUFxeVF2T25vOGY2TEwzaEgrNFUvelBpb01XbkRzK0Z6VXhoTElP?=
 =?utf-8?B?WjFmblhycGQrNWlaWHkvUk9GQ2JVY2Q5Nm9nOVJJbXdKcXVaSW5qSlE4aklJ?=
 =?utf-8?B?cnh1RE1xVncveGVURklUYXU1UmFQVTIvMmtabkhaM3BPYTlrV3IyTDE0OTVh?=
 =?utf-8?B?S2czMUdQbzh5V09Md0ZNUGR0OHl4R2VpNmdjM0tqUlp6RVJqaUZMSnRFVXl2?=
 =?utf-8?B?MVRJRzBiL1lzdUZPZENlSjkzalFHMlVnZXNMSlpCTFhFckJQbXBlOW16SnNs?=
 =?utf-8?B?Q1VVam1ZNVlnQUdPa051VmJTSU9CR21XQmxYTFhWME5BQWhjVmt5ODRxa3pC?=
 =?utf-8?B?N1lRMFhEcEFVS2svYW9meEhIT2xBVzlMbUloMEYxdUdDZlU2UG1pNGw5N2oy?=
 =?utf-8?B?QWZqc3h0UWRtcGh6cVUzY0QyWnc1bllFSXdFQnMxdlJLd0pJQTlueDh5VWov?=
 =?utf-8?B?bnFCVW0yWmxPU3RpZGZrOGJtdDdDa1JvenhHa1ltNktCY1V5Q2JTck1QeC9T?=
 =?utf-8?B?MWIxTEtqcFlFbTFySm9jc0k0VFQvbFQ5ajRXbGsxWUI4cC9nRy9oYXI5YVp3?=
 =?utf-8?B?RHpmOTdTWW5jSTVjVnVEWmprYW5XTHA5OWVDckIwK1pqenVtbkYwa2MyQ2po?=
 =?utf-8?B?MkxveFplR2RTM2VHMkkyeGRzc2pFRmpmYkxKT050eVpyMXVhUVd2MDlwcDZ5?=
 =?utf-8?B?UnpNU2ptS1RFMElsdG4vVzdudVdXaTFVQjZzYlA1d2VjYUZMeThHNWE1cHVV?=
 =?utf-8?B?SG5UblVaSnJuTnJWajRNWWd3U3ZRPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: qmUBmVL9Rm2GCoMG8bDBysHglqmlsCjSRhiBtS+zfBj6W+uacmU2L3evzB3+ztrNc/ck7WAseNBPuSbWeNX8D+TgC/FAEOPbpgmi3kIO6qMNLsP1o8Sf8r/NQ/dH+8cQDqdmq1Y6F2R2ZRBkrwlND7dUBe5J2ZhQhHFhnWpw7wh96c680mNzNlS6tEaIeQGrAno9gsfagkXqu/7z63OsOvYiGAmyRa3y1jIX4TFM4QHtzNSg8jQHJh2pclqzu2qhJNDP93HZLPkjb1I2L88pQQwo4TSHHQACxwldOFFwqab0ZNu3IuGPJWJYq9hZip3MEaRTNEH9yNRPtLblPOj6n+tKNJ6a39uTHr58KJ/Xo4y5A8h+hQZdXpjD6TBJc4XtGjR11/KLPhfyYN/y3yhvxrXB6RM7B19jxM9PSqGh3qwP4EWbQ27vc8RjvP2RsZ3W
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 13:22:14.6185 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1d2083a-c1c2-4a9c-6a5d-08de6582be63
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E83.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9228
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[srinivasan.shanmugam@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.974];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,igalia.com:email,amd.com:email,amd.com:dkim,amd.com:mid,ursulin.net:email]
X-Rspamd-Queue-Id: DB3BFFE0D3
X-Rspamd-Action: no action

drm_gem_objects_lookup() can allocate the output array and take
references on GEM objects before it fails.

If an error happens part-way through, callers previously had to clean up
partially created results themselves. This relied on subtle and
undocumented behavior and was easy to get wrong.

Make drm_gem_objects_lookup() clean up on failure. The function now
drops any references it already took, frees the array, and sets
*objs_out to NULL before returning an error.

On success, behavior is unchanged. Existing callers remain correct and
their error cleanup paths simply do nothing when *objs_out is NULL.

v2/v3: Move partial-lookup cleanup into objects_lookup(), perform
reference dropping outside the lock, and remove reliance on __GFP_ZERO
or implicit NULL handling. (Christian)

v4: Use goto-style error handling in objects_lookup(), drop partial
references outside the lock, and simplify drm_gem_objects_lookup()
cleanup by routing failures through err_free_handles as suggested.
(Christian)

v5: Rebase on drm-misc-next, drop the ret local variable. (Christian)

v6: Drop superfluous initialization of handles. (Christian/Tvrtko)

Cc: Alex Deucher <alexander.deucher@amd.com>
Suggested-by: Christian König <christian.koenig@amd.com>
Suggested-by: Tvrtko Ursulin <tursulin@ursulin.net>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/drm_gem.c | 43 +++++++++++++++++++++++++++------------
 1 file changed, 30 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 7ff6b7bbeb73..c4a3de3b920e 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -783,7 +783,7 @@ EXPORT_SYMBOL(drm_gem_put_pages);
 static int objects_lookup(struct drm_file *filp, u32 *handle, int count,
 			  struct drm_gem_object **objs)
 {
-	int i, ret = 0;
+	int i;
 	struct drm_gem_object *obj;
 
 	spin_lock(&filp->table_lock);
@@ -791,16 +791,23 @@ static int objects_lookup(struct drm_file *filp, u32 *handle, int count,
 	for (i = 0; i < count; i++) {
 		/* Check if we currently have a reference on the object */
 		obj = idr_find(&filp->object_idr, handle[i]);
-		if (!obj) {
-			ret = -ENOENT;
-			break;
-		}
+		if (!obj)
+			goto err;
+
 		drm_gem_object_get(obj);
 		objs[i] = obj;
 	}
+
 	spin_unlock(&filp->table_lock);
+	return 0;
 
-	return ret;
+err:
+	spin_unlock(&filp->table_lock);
+
+	while (i--)
+		drm_gem_object_put(objs[i]);
+
+	return -ENOENT;
 }
 
 /**
@@ -828,24 +835,34 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
 	u32 *handles;
 	int ret;
 
+	*objs_out = NULL;
+
 	if (!count)
 		return 0;
 
-	objs = kvmalloc_array(count, sizeof(struct drm_gem_object *),
-			     GFP_KERNEL | __GFP_ZERO);
+	objs = kvmalloc_array(count, sizeof(*objs), GFP_KERNEL);
 	if (!objs)
 		return -ENOMEM;
 
-	*objs_out = objs;
-
 	handles = vmemdup_array_user(bo_handles, count, sizeof(u32));
-	if (IS_ERR(handles))
-		return PTR_ERR(handles);
+	if (IS_ERR(handles)) {
+		ret = PTR_ERR(handles);
+		goto err_free_objs;
+	}
 
 	ret = objects_lookup(filp, handles, count, objs);
+	if (ret)
+		goto err_free_handles;
+
 	kvfree(handles);
-	return ret;
+	*objs_out = objs;
+	return 0;
 
+err_free_handles:
+	kvfree(handles);
+err_free_objs:
+	kvfree(objs);
+	return ret;
 }
 EXPORT_SYMBOL(drm_gem_objects_lookup);
 
-- 
2.34.1

