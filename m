Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cP5FN8tgi2nDUAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 17:46:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD6911D649
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 17:46:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F91210E5D9;
	Tue, 10 Feb 2026 16:46:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SMEfXpgk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013056.outbound.protection.outlook.com
 [40.93.196.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B89B810E5D9
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 16:45:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YraFEBPW/t5TYEB/62Jrb7itWE52ZPmPykeqEGr9f6jlhAcMp43SFma16akRlmvlSEZk2zyb09O/NYf2dmKrkwQcjS+DBOhExTYffvtZmVO/CFgCDet12B1u1BH2UgFbWkUSLuH/Vj+VFQRrVkyb2ee1NuOeoapdWdwRN8kDnVgJg51tD4Y8gTYHLsXjT1p1K6VFKnfeL23R+4tS3tX0ABNnEo0Z0qiTKCdFk+Su4Fm30MSMNMy/uW7rWls/tII+dpxxQ5a9UIY4QCO0FzxtRfLN/JGy9GVDiZS3h3t/1rnWb/wWNfYfHBaQ2ph4a3DbEMRF91MyT2bRBiXGkdhViw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AW2Czl9rkCVUPyjXIifQfJd6Z+/nu+xvrHZcNsiu/Yc=;
 b=CH2AwJD5aX03zrz7xF3Q2oH2Ul4DjiunpdRkWHkh/miDZBXwn+bRYUu//jcb/plDV5XDbmVIIxxywYQBthTFu/1+nHBWDs0gljnOqcEIHoc3vHIE87sQvrhQD7uoeILW6wNspe66W/1PQipmCPwslHQeIDa6xOsyPDV9XgRKxPXVb//At1cLiTZqeDYo12973CNavzQ+QdkIu31eXPMJu+QSKRJrtXcsAIf5vBcALzSk0qmVHPMkkHAQRM4gGOugAXHS1h3Aoc7zFW9tX/CK7dlIJNHM6DUh8lgbqz3+37PBAPdhufUwxD5UBm1XsxXrB79fz1RfAxctybqMWjXWQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AW2Czl9rkCVUPyjXIifQfJd6Z+/nu+xvrHZcNsiu/Yc=;
 b=SMEfXpgkrqmVqIK+NQQUjsUmjbnfLRT1F2U2ZjNj+Vx/y0Nm74VYYFIYV1COaKtNpQkcM603JPf/SBxyMS//bFFkt0MfNkShn4sze0uOPCiZU8SnQXJC3UtuSaRjrFV88JZdo7qcQHK55Dz1BePPLs4GfmHkgf/oeBbGNiJd8c8=
Received: from SN6PR16CA0072.namprd16.prod.outlook.com (2603:10b6:805:ca::49)
 by DS0PR12MB7655.namprd12.prod.outlook.com (2603:10b6:8:11e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 16:45:49 +0000
Received: from SA2PEPF00003F62.namprd04.prod.outlook.com
 (2603:10b6:805:ca:cafe::98) by SN6PR16CA0072.outlook.office365.com
 (2603:10b6:805:ca::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Tue,
 10 Feb 2026 16:45:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003F62.mail.protection.outlook.com (10.167.248.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 16:45:46 +0000
Received: from dogwood-dvt-marlim.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 10 Feb 2026 10:45:46 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: <mario.limonciello@amd.com>, <lizhi.hou@amd.com>, <mamin506@gmail.com>,
 <ogabbay@kernel.org>, <superm1@kernel.org>
CC: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/2] amdxdna: fixes for closing a process
Date: Tue, 10 Feb 2026 10:42:49 -0600
Message-ID: <20260210164521.1094274-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F62:EE_|DS0PR12MB7655:EE_
X-MS-Office365-Filtering-Correlation-Id: 0979c966-e418-4d3a-9677-08de68c3d70c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?G2d/WUhxttbgeb4KODMhm1USY9oJlVT6eLnP9U3GYYC9ZaO24RyaWeCZRYiI?=
 =?us-ascii?Q?AP9B9GKhes+Qg5NUqT9x0o5H7VWl+5chSMfwVEw7SQWD4a2R3nOkfIGifW12?=
 =?us-ascii?Q?ObihXKJN+k5AvZtKvM/ukiHc/qUjCaB0OgHiQ6alABhH0Bof95Bpw1rt5vOG?=
 =?us-ascii?Q?Rm0EFL6PnHzO2x7+Pecnxsuc3yxXNIay7tQT/KHb5FFqlBBWPrMiEJuASQZn?=
 =?us-ascii?Q?N1ZlQ+TF5C8XuUX6jX+2/osH4qtsiK0KmjRioUSOQaEx56qX04oXsWmqEaP7?=
 =?us-ascii?Q?syNT7f8L6XpCYUTqoziU3FjLSdg7RaacQOTBZxd9xjvWrT9Aes0xSn1E2Ho/?=
 =?us-ascii?Q?2kHmVCBQS6qS0w1Gb/0aYg7KQ8V+ymP0YSBtdPH5NrWjk7fPmWzeG1wju3nK?=
 =?us-ascii?Q?qQGGlJ9WRfqK6bXDZlDMcTChdXKJN2UmP0ProN8Q/og+Uv6/kyhB7n+CZ+HY?=
 =?us-ascii?Q?mZPemWslbEDCo+grpfRDrF9cwhlFOOVGfUt2Z3a0cKvhoDpw4CnbNvqWvqk0?=
 =?us-ascii?Q?JH/g7Ak+WZXJuWYQsjgYVztWupirV0+kqBXMy1J0LgD12eNDGKfmyluFzMxr?=
 =?us-ascii?Q?xhGJE4cR6NNxPHTFxdhpvwnZJWi5mI9lB1UQkjnSW7c1vCCxcTNPs9wa59rC?=
 =?us-ascii?Q?cFbCfGhsOo/rwDsa7+/zstDIqf0ZHlPK7e/A+jrdBOYgcea2//vOAUlG3U2l?=
 =?us-ascii?Q?ixx4FKRsmBZVlXfIdVBSNbV0MvGrrFUbQbUbbpalr6ZADyTDosGB6yNRSE6t?=
 =?us-ascii?Q?AzO/rgzkzLcirYd9sSiqbfEJgDqVQO/CuTasFU0RxnQS/0HT400mTq+WwUKz?=
 =?us-ascii?Q?+ZMLzS9vazr0nF2VUtaCrBB0DpUvvEhNkEjbWigEHTqwXaBX0u/mu9K5dklt?=
 =?us-ascii?Q?h/qi29A4zqpqDay+oc1lSpM8NDQ206SSa4W9BMwhPFBTJf5nByT9vNSxRSOH?=
 =?us-ascii?Q?HWYzkbmqIGSmprqbF6+7Y/gPJiEDOhsEvNAZqloPEXFSZ+25o4yjkZ6hrriO?=
 =?us-ascii?Q?ED0Cmn3iAgB3zwluh6vywEAZqiEJ+XmdKwFDyo9XnpjGTlcyTlVgS+0iAsTw?=
 =?us-ascii?Q?ojBaKg8uBbyTROmqxZZK31WAKt92sI1ArNSeR/rsccpHLR54M3Lymxe7hcA8?=
 =?us-ascii?Q?NInyt+RHb02Y8nC6M9WGaFQ8Eq8vnupIMRqyvagbqhuErFJF9XP3evkcvnAy?=
 =?us-ascii?Q?yc/ZgTW+CS+BKH3nX6T/wOgkduGk09VEVrSK+4ECTX0avMGU18th3OekYUSN?=
 =?us-ascii?Q?CxcWVBedpUvtwIP7djzcZgjBwyrE8QefByx6K4U6VVPL6xtF8hWt7PwzfXqR?=
 =?us-ascii?Q?NkBEZx0UgZNhv5OvpdYtZG137PeC4R8VHJrR9YEzWpL/5GopRvedRFBcFvyB?=
 =?us-ascii?Q?XVSwj/XFA7S7GEtV7R4vjorZBekGfdTTM6RmqT/p8+y30LF/qHIi86R06mIQ?=
 =?us-ascii?Q?BG15acQfBpvAx64Tf1RJ6Kke/zLdhm6Tu1FLr+CQSt0pO7D+C3ORuiAT+RKR?=
 =?us-ascii?Q?AXbsjVkI3batRyxTKglONPnabD0EmmWXUuiBEWmSmQv4EEh1PyWUOMp9seBi?=
 =?us-ascii?Q?gN+ljIbTtyWzSIPVlmk0BRlnwvIiMhjTVvnmhGZwONY20DnmJmei30gaVZSX?=
 =?us-ascii?Q?rTW6cJQa1XaON13zhmkAhjjJQjdRFuOfnQjYONE+qV1XaLHs9ZcVu90AZx9X?=
 =?us-ascii?Q?0R2yFA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 1BGW+IjUxc1See4DgaNXAn0/ZUzT4bUMSt5XbSpTkv7FuyG42eSJ7SUQw4ZcU3mjg0CyqFGE01ijihxAKg5jMcKMOnzl79IBsTdxmIIykwT/29oHf0BXUvwIXA8I0AWLuSgZRrM+ySDTXJheeqqwgX0Gr1+WdXUaFP3QEpcMjUlfpliZwliAkpnIa/Q6Yceob3Xs2W3uysgZNSUekK3KdRVBlZzZTlF8DWLHAQUrorCxT36Y5z1rEuo8xXu8a6iGXbWldfAA3R3Tv9/zxZWO5sAP7YM9qk9dGb9eADLYVu9R8gNxTCohTi8PrZc62G+rPehOSTQkQ5YtvqszmYs2DGMXahc6L1nIt/VxKpKCddkTcMbT84Zv9em6gV2Gyemojh3a8NPKSyGDfdCMsaG6JZ7XGuxRsoKP1VzK8wud3E0eA62p2Fleosm56tZx1tuK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 16:45:46.8411 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0979c966-e418-4d3a-9677-08de68c3d70c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7655
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mario.limonciello@amd.com,m:lizhi.hou@amd.com,m:mamin506@gmail.com,m:ogabbay@kernel.org,m:superm1@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,kernel.org];
	FORGED_SENDER(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_NONE(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 6AD6911D649
X-Rspamd-Action: no action

I found that with drm-next when I close a process using amdxdna that
I hit a GPF. After fixing the GPF I found that it was really noisy
for standard cleanup from a closed process.

Mario Limonciello (2):
  accel/amdxdna: Fix NULL pointer dereference in mailbox channel cleanup
  accel/amdxdna: Reduce log noise during process termination

 drivers/accel/amdxdna/aie2_ctx.c     |  6 ++++--
 drivers/accel/amdxdna/aie2_message.c | 18 ++++++++++++------
 drivers/accel/amdxdna/aie2_pci.c     | 14 +++++++++-----
 3 files changed, 25 insertions(+), 13 deletions(-)

-- 
2.53.0

