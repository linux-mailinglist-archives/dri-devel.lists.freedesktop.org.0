Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDgmGHS6hGnG4wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 16:42:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0506F4B33
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 16:42:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C06AC10E90C;
	Thu,  5 Feb 2026 15:42:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="r+ErSEst";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011047.outbound.protection.outlook.com
 [40.93.194.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4014E10E90C;
 Thu,  5 Feb 2026 15:42:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b8l68YhlxDr/E3V6ItsAsntbXSG6VE9uQg6x9LSI6cr6IXoTAy4DoyIdUohi/VLNBhgrE+3LJys/YvOtN/ldIrn7RoO0WpqAJ7qSGInuf9HohCAdCfPkxUzQaYQsTzO8LuCQXp2AKITVcaLLA8E5LecSmVFlRaxsEYXhuMOyWNgMLfPdOQg2H3g5WWmGVoR4+XBjhCDeEIZpyio+cl2XJP5ltL4dicl7e+Pr14hCtXIyrFDm1utZsQNnyEuLcaixAVgcj1ZvIQtmU3thQe+1X4+p/V9Us2cpeSqynhfdfuKL4I5BHTMcUgZp2peq3TaxygztpbvxucGh5LINrkBkSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r71ABCHzgzFuBAUc4DetywHzfEJHh9+fWEXCWpa+mYc=;
 b=P0KX7Ni72Z9YLD36UdvVS5xyrYZanlw6av7ghkpjKHrowYxYtdHdZiZDdquQFxudQTCAQLwSHEPfxx5bB0DGWJ6wLpnzotRM/tPyUnDAywcx/pH7zIyF38UydM7EApS6TN7AovkkuqZDCf2tI96PJWQU01aLetF1tMleiKhgB91M5UdijewnhBrKEBJNnDUyD0GGpX3Hyoz9NtmCc11Gij9QwkPCWHmQL0n2eRqO+qrEHj/evjHD4aD/C6vuJ1W8c7jR1FQmltgiGtWUOc3WJXOaA4/e5iISiRv8GogjqVHNnwTGnjST/ZWRKyXZFJXBwpOLRbelHJ8XKIxgoVjZ0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ursulin.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r71ABCHzgzFuBAUc4DetywHzfEJHh9+fWEXCWpa+mYc=;
 b=r+ErSEstR4naoVxjO2Z11G27m163Ztrc5MG+8UYQsjKMXAnEFlAzP/92t28dzQntt5Qxa6JqXiRloxS+nEm7UWttImmNN+6P7Lgai2+cpBIhnu/jKrpJlZjOYXDatT2eQ1q4rLZq7ilmg0JMP66EENMyEL2zvCKNJaLfG8Nge3E=
Received: from PH7PR17CA0032.namprd17.prod.outlook.com (2603:10b6:510:323::22)
 by DM6PR12MB4388.namprd12.prod.outlook.com (2603:10b6:5:2a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Thu, 5 Feb
 2026 15:42:33 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:510:323:cafe::aa) by PH7PR17CA0032.outlook.office365.com
 (2603:10b6:510:323::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Thu,
 5 Feb 2026 15:42:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Thu, 5 Feb 2026 15:42:32 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 5 Feb 2026 09:42:30 -0600
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>
CC: Tvrtko Ursulin <tursulin@ursulin.net>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>
Subject: [PATCH v5] drm/gem: Make drm_gem_objects_lookup() self-cleaning on
 failure v5
Date: Thu, 5 Feb 2026 21:12:15 +0530
Message-ID: <20260205154215.1460845-1-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|DM6PR12MB4388:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a8366f8-185e-44f1-3803-08de64cd2d71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Szl2VHhzMlhzdWV2eDNMdjVZcWpJUS9RYTR4SXFNVnB3MVFGemt0VzAzTDhz?=
 =?utf-8?B?dEw5cTNoL09lQzNmOWlZbUJCNTB2MTkya1JMbWE2MDhKMXlkTEloRS9WSWph?=
 =?utf-8?B?aDArQ29jeWxUWnpBR3k0aUZnUXhqelJFejQ2eWhaTzZwbFI1MHJSTG9IT2pK?=
 =?utf-8?B?a0xhMk5HUlJEaldFaEx1Z01SNEZzajVCd3d1Yjh5dTNQRGVZUThoY05lbXU0?=
 =?utf-8?B?TGVmT0pLNnVvUXpqakFKam1XczZtVENxQ0hWUkkxNld6NzNadXY3ZytUUFg1?=
 =?utf-8?B?RTV1TTVaeG1iTXNldWhQMUdKSlNLRHBzVWx0YUsyTEtpa3hIbXBUcGsrYzlT?=
 =?utf-8?B?TktocHV2TlVjQXhJcVZZQWtUNHZackx2ZlVDcUtGUnM0c2QzclZ5SFBOYmVV?=
 =?utf-8?B?dVFKeS9TVVRybHRkK2ZFb0VHc00xZVVjSzZYY2I0ZS9raXUvSTZXUDhJVEZi?=
 =?utf-8?B?Vng1N1JYdWhLbXBGN1pQVUdDdDFkRmxuK0V6azcxSVFwb0FEbUZKVzlFZkhl?=
 =?utf-8?B?ZDhMYnZZckpGQ3BSeVhscDd2SXRDaFl1aWRwaEhyVXIyUGpTeW0wa1lWRzlG?=
 =?utf-8?B?M3FjblVVVTRwdmlBbkZQenlnei8veTRteEsvR1RaY0YwS1JYaFlCV21nQ0tQ?=
 =?utf-8?B?TEtjbVhVTkZGenNwUCthcVp1Wnd6STl4QitlbUt3VjhPaDFkbGIrOVJmWE9o?=
 =?utf-8?B?SisyLzlBY3lhdkJkOWpseFdvN0xITDczbm8vbzQ4VXFLRmQrVUtuWHUyYTVL?=
 =?utf-8?B?aXlxMFRLRUhiZWF2OC9qSXZJc1JCV0Jmb2Jjc0QvcllhVXFtUk1pTzVndjhl?=
 =?utf-8?B?cGlTYmVLT3NMMStYeWtHaENybklnM1JFWmpoVmVEQkRISTNMWVdOQVJ5cXlw?=
 =?utf-8?B?Um9udFpTZ0o2c3pESTRwU2V6aUJ0bHFSWHNMRFUwZ1pJUWJzbHNObUk1SGRw?=
 =?utf-8?B?OGVOQTBpY2N4T3BTNm1ON0NoSUZBdDY1UWFYOXdKZXR1bVoxa1prY1UwZUw4?=
 =?utf-8?B?MVczTFR4MDZzaXpYb2RLVEY4TmFmeWd2d3dWeTk1OWhIaFM0NG5KMk9tVXRw?=
 =?utf-8?B?dmwrWTFvUW1yWi9NR2R2NnZrQ3JKclRXcVE5ckdNQVg2SG9aOWxjMHRDZm9z?=
 =?utf-8?B?RFVNWGtjdmZMTGdXMlh0MFNpVi9wZTg4TFRybGRwVkpvZ3pRNi9LOUQwVVJh?=
 =?utf-8?B?aXhOL0RMMVBYMFozbkNveFp0dDlRNXFXVUtVWXdNNmRsOTB2WjdZTTBVWlVO?=
 =?utf-8?B?ZjVXVmJlUnlzZXAxUmgzUWtQajZ4eE1Ga2pGblBPQUNqN1RBV1RvSmlPTnhH?=
 =?utf-8?B?dUUxZWFncjA0ZmdLSGt6OUdTNnhEenBRbWZIK2M4OHVBb3RjNzg1OGhWMjI3?=
 =?utf-8?B?c0JSM3lxOWRUeFM0bzNqV0ZTcHdhakdJZEFvT0xTcm5DcVhCUk1FdkFMclg1?=
 =?utf-8?B?R3A2U3ZzQnJjQThVVkw2eTVidnE5SUdOMDVUYXJSUjdWWXZpVlhZaHd6c1RT?=
 =?utf-8?B?ZFpVSW5EaTI3ak9URTBBcEIvK2V6WC9xOHpNc3pHWDJRTHhlRm5ZNXpDeTIv?=
 =?utf-8?B?MXpzWlhiZ1IxZWN4aVVGTVM4VzJicUUxUG8xNUIzVCtrZ3RPMEM3elllbldK?=
 =?utf-8?B?VnRwdWkyT1FMamh2d2dQZXdOUzVyTURTTmhXTUJQclJtbDh0aDErWk1TRldS?=
 =?utf-8?B?VDFHYjhRTDdRYkxkd0J5NFNxWnFwU2hwM3lIanhuZmhEdUQrMTdyMldVdHNO?=
 =?utf-8?B?WEZSRGxqQnVlTlJTK3lpT2Q0K29iWXA5amhIVGlLRzl3aEJGZkE0QTN5TFBM?=
 =?utf-8?B?aVhWNldZSE9MaGJ6SG9vcFhVQWczdUNKZkZidEFWbFNGM0JaVEUrSlRldFJJ?=
 =?utf-8?B?VVlxd29ISFpHS0dYZUtVN3lyUlZYN2hBcFFTWW1lZDI1RmRuUTRKV25tTERn?=
 =?utf-8?B?WWtIckpjOEIrZEF5ZjM2Tlp2L1E2M2t4T0RsNEdNSmJ5ZjlUQStmcmZFQmV5?=
 =?utf-8?B?NDdFZnllTkxmZnBTN0NNZG1DNndrS1l2UElCelVmQUU5S042ZllZTVdybUhQ?=
 =?utf-8?B?VHF0bGM1SE53TndxNlpDNy9zdGRNTk1OTGh2cVNXOWdoelBFNUt1eVU3UC9C?=
 =?utf-8?B?YkRZMGNBa2FjaWEzUllsRFhDalJQT201YmpSZVArUDUrZ2VzcGwxbXovRHRY?=
 =?utf-8?B?dUVyUmIzLzI1VkE3ZjdJVWRVK2o5ckdWam41UGdtcE9tWDRTZTVNWE9TaWNy?=
 =?utf-8?B?RU1BQUk3eDMzekVVRnlOUUZMbXp3PT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Q1Z5it8Nlu+GTJJLyy+psdfuk41H9a3Em0rD/5ww3SclZ//c7DAXVODDzg9Bg1xTpZNQkxWTjjMd2NSFL8fKW1akZ7FxfbT6Tv01NH0u6vl7ueAemNMO0yFGkrJkGGPUJkHHglUYCBxOVqWm0XDf8Is7SH1ynMh3KqsDpIwGwpCfeu/tuwh8VGcP7/T+8bbQzdeZYPttiKZ8Of+4XXjvhYbSG1fKidIc+u0Cy/wstYcM83copkmvqv8I5GVC4pmlhOKKE0cZqko1tTEG9jB8eY4njlXEaYBx4QYn52TdNi1/IhDo2LOjkoteJ2uJJHBWiiRljd5Dusp8Nu/OzgPc3H6KCMOK26b9q1uliK33nxMbmSIE8MVtnClgvRqkDNpg91U1Pzg37ZJgnITSOuZlaSBf0QttxiQnbrMh3kXdtDDUiVMlkEXoSUpve3bWOF/D
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 15:42:32.5744 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a8366f8-185e-44f1-3803-08de64cd2d71
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4388
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
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[srinivasan.shanmugam@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ursulin.net:email,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: B0506F4B33
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

v3: Move partial-lookup cleanup into objects_lookup(), perform reference
dropping outside the lock, and remove reliance on __GFP_ZERO or implicit
NULL handling. (Christian)

v4: Use goto-style error handling in objects_lookup(), drop partial
references outside the lock, and simplify drm_gem_objects_lookup()
cleanup by routing failures through err_free_handles as suggested.
(Christian)

v5: Rebase on drm-misc-next, drop the ret local variable. (Christian)

Cc: Alex Deucher <alexander.deucher@amd.com>
Suggested-by: Christian König <christian.koenig@amd.com>
Suggested-by: Tvrtko Ursulin <tursulin@ursulin.net>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
---
 drivers/gpu/drm/drm_gem.c | 45 +++++++++++++++++++++++++++------------
 1 file changed, 31 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 7ff6b7bbeb73..5895ae09c27d 100644
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
@@ -825,27 +832,37 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
 			   int count, struct drm_gem_object ***objs_out)
 {
 	struct drm_gem_object **objs;
-	u32 *handles;
+	u32 *handles = NULL;
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

