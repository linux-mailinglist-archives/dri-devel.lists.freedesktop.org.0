Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePX6CkVkqWmB6gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 12:08:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D0E21053E
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 12:08:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DBC310E24D;
	Thu,  5 Mar 2026 11:08:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="nGcWLTcH";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nGcWLTcH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011027.outbound.protection.outlook.com
 [40.107.130.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B35A10E276
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 11:08:48 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=J7GU0lh9Bj++fhAtxV9N68nKdoe4MkGA+9DqqyhobPFyWGdcMV2ueDgU0Lbc1fFbbelMK1srQCAWlfsr8dO21WdoN5LIvrrWPIGTUdNDi9M+FD/k/52ppW9mqWkPO0jL7Nppali2wruOM3Et2k/eOhiH6etXXpKutDB5Ww5JgUOI5oQw3j+2uPSRjlTMDtlxz2wDEx4SA1frvh1jtHXBqXroT4yh0ZrbL30l7zkKwkhnZddYuc/XJiM6zrUaJtYvPE3V3jdyyPR9wCz/qv96pFkPzvyiFk3Oz5b5iQkTxUzW769X/kGS/KYhlENLj6BwE5RXH4hoLCyvQU1G32jz5A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e+XGegIy24nNRpCRVmoFL7iun0mc7aCbsxT6pQ1fsX4=;
 b=pJt0MNRQnqTkph2hrNKS6zwbCdBfAXhrjsn8dH9pZQDVlkyB3ZQq2P3fgWIramCf9VHFRnSZVofrS4+ygQj2NxVAYajvRIQiDdpa/7h/XHEamCp7x4O5u/vrNpdHtcawXfAAy1AS/Hf0PZoJwZLfD86DADtmbd5IDHHrIHCXST2UibP6qPVlkr7PIYcf71thJhcJ3SbiumLo80Dg9b72XSRQi2dDMtsw4wFvQ90V3XbfetA1pagyT6I2DA4C7jjr7TZzSZYq6ExrSdhbwIiyiu4/oI5ZMdlJi7XVVjyF/zItTaXiS0fSTLVkXE+1CikY8dVJsHPfPdjez7efafTIMg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e+XGegIy24nNRpCRVmoFL7iun0mc7aCbsxT6pQ1fsX4=;
 b=nGcWLTcHQn3XIsOAkPOKhE2ke/bj1JOe5aSeg+goXA2JLU1T8oi2x/nbCxXKkRHyiIEIu4GLldwIZ4e4Pm8jbTr+STpzumtwN1McSNys3T7stJPJYP2HMNgRIYqSSEBKgb91mE0/5hvIXeMb44GiFBQG788AlL/3tH5IgBI34Dk=
Received: from DUZP191CA0003.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::22)
 by AS8PR08MB9217.eurprd08.prod.outlook.com (2603:10a6:20b:5a0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 11:08:40 +0000
Received: from DU2PEPF00028D0B.eurprd03.prod.outlook.com
 (2603:10a6:10:4f9:cafe::a1) by DUZP191CA0003.outlook.office365.com
 (2603:10a6:10:4f9::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Thu,
 5 Mar 2026 11:08:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0B.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16
 via Frontend Transport; Thu, 5 Mar 2026 11:08:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DRDhpdQNj+79FkDwvwa5uVHs4+w1RgK0vtrRZUMurRV8Er7PqRHtexhu5ZJ0s6y3DtYyntNo3fuzVdgd6WBStADshl+bmHw8hUztfQdErFAOJ5SUbjq7y2sFvQcBMBhwmlijDPbQtbW7RU1gniOZCEiqR6I8AzZkSvucMAa6ccW4xlgAE00S7Cv0fByFbtfxCmkqrkbSwsUciqzoxN33kcgALo5rc+dtHzMCYr0ZTQlfSPnosdgLTDJzT6xHF9/5ly/Ahhy4wrGcpjnTCyYbwkRWlpvbb2Y6xk/bqtcxGSX2DJQJIfO4H027HKuWhcz39rMzojREJ2NXZ5C8lsCStQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e+XGegIy24nNRpCRVmoFL7iun0mc7aCbsxT6pQ1fsX4=;
 b=gmRZZaD9LDJjm/It5F/KiDRD6KeUiFmtaxSqpe/766ty953qI8UTycaegFapSQzOfSHSu2cl42bmFEZyQfOer9xQ5Afp9KxNLG+HaEMoG8/pzLThFqoc4CsP76YZsFLEvYTVpSKgzHCWj6/WBCZSFzRL3fcFLAJXCatV1jSUXyYMu8aMEKe8nA8AULO+UQTDFYqOfvdc/vqbWN942N0Cr3q2gXxJhld0iLSP6iLHMpOhAK8FuzZF2Vh7hoNCMAodrDiPL3OQd983/KzcMgWFK+Xerp17ZhDV0BJ/ABsdZ0zL5ne6CjuVLKmaTvGBca6A5jnuRe6oZhrNu6ry5BVumA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e+XGegIy24nNRpCRVmoFL7iun0mc7aCbsxT6pQ1fsX4=;
 b=nGcWLTcHQn3XIsOAkPOKhE2ke/bj1JOe5aSeg+goXA2JLU1T8oi2x/nbCxXKkRHyiIEIu4GLldwIZ4e4Pm8jbTr+STpzumtwN1McSNys3T7stJPJYP2HMNgRIYqSSEBKgb91mE0/5hvIXeMb44GiFBQG788AlL/3tH5IgBI34Dk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com (2603:10a6:20b:415::16)
 by DB8PR08MB5402.eurprd08.prod.outlook.com (2603:10a6:10:11b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 11:07:37 +0000
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::65b:44e2:e002:6499]) by AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::65b:44e2:e002:6499%4]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 11:07:37 +0000
From: Akash Goel <akash.goel@arm.com>
To: boris.brezillon@collabora.com, liviu.dudau@arm.com, steven.price@arm.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com,
 Akash Goel <akash.goel@arm.com>
Subject: [PATCH] drm/panthor: Correct the order of arguments passed to gem_sync
Date: Thu,  5 Mar 2026 11:07:23 +0000
Message-Id: <20260305110723.2871733-1-akash.goel@arm.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0007.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::12) To AM9PR08MB6982.eurprd08.prod.outlook.com
 (2603:10a6:20b:415::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6982:EE_|DB8PR08MB5402:EE_|DU2PEPF00028D0B:EE_|AS8PR08MB9217:EE_
X-MS-Office365-Filtering-Correlation-Id: e400bda5-cad7-40e4-f63c-08de7aa78e85
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: tTc5YFm5f5SjYsQxi9XhLSugZPg+gQ+AotVpd4KF1/EHniRZGZluAYLg3b+xmEsywmjm8qvATc4Ec5L4bcg7fHFgTh3QihT8WAGRSlGy7x6pfAxez8pSeWdN9uJWEkUgYhXGXRynIaodXVUlDeGTeURvdgwIOZAKHQ46SdWhtKf1tTaJ+EePnU4L3PvseFa8Pi9uBglDvR/KPhFfUH3h8IQkkbPGfAOdNSzIft9iCgtvoL8K0N+KeQQFL1DFhcwU0S6yskzKXoGYv8xXpqyRLihjkITgQUZF6cQd78hd/dpGVfNJVgNYB2tg8bPdGSdQe+f2g72lGH/if/I8DweyA7tGndcdh27YuiT7hXtFN9HE0mtJbgpSeYglsBiaMFNQxCtEDmqC5tfswn+bDnkvXkZxOd2bu9ts+Rax+amotMeXkjXFKKcq5XvVtBxggbAEDdS5D9rRniHS/FMIvcyleEY+quP5FYzRXL3otQh4HE2ogwPNtKWofNhG+77tWMgLJnqKzlE1pZaM62VInarDSL431QkHRXgtm5kixtSLLcwEI4JKhvyzgAOy7kJc1v/sRcxkjbixhVXlSj7f7oH695Kvu7we6BB+YGp+6iGx1mZNuPprPLBF/N0Z0RWE9M9b6gxBnC8t+bkjWYz8BEWtOEmZHSpDJ+8oars7xhHwxuLlEBjCdwm7Zh+M4uYlzFQVBh/LM3EvvYsklOqA5I7ubpe31bK1IOtoQ7AhB6yUlB8=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6982.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5402
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D0B.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: bb7580df-6e77-46e0-474d-08de7aa768f0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|14060799003|82310400026|35042699022|1800799024|36860700016;
X-Microsoft-Antispam-Message-Info: JGYWCw1JZ/w0dmckkTMJ0Zwvql1gln2seAhkozVsP5qJk1Lo8GaHzv5mwxH93N5aecHvuvAu3/PQA7uXO3xEki+i+tlBfqkr95fuh9KSpVaTI2Vk6+cfU9Wboy6JernNOq/lziQy+PZ7NBrXwT3mgEv5aEUyIXu8gBoakVmcQJr705PzzBI4t4kcUfpLd2z0HcgyZSppb/r2qArbpv/M4ihfVqLwUiRt7YrqFRtvxtX9DEgZhWbEYbBWD4kZp95/NI8LloziQ3FfkEwaEx0t+Cr4iwHqnMURjDp0xbhb+SyGrmfJASOpZhAVBQCNuFAV539mAUsUMS7rnKE+o3tkw14lmaSF0zBCt9fZMYZahFcrNio9ciArdFxVFePwyiSo8q3whp7hD8IbplQBt2DU8v3IoyygPLte5oQF6SJfc1S68yqq6mpTzg50r4auv8029YdJIsIPvfgfK8j+ZnMSqKKrc2IVN0FhlxWuY+QUjs1rJichVFooU93x59OGq/ueC0h4VGfCbhWGnp/p2St6I1j5dxpTHkAj+JtlsQ48Mte4haTGzX++/lFejoDUvS1ovtgtKSaMlj7u+l6bz2KKaELSUjE2Kv8/kEBiyNQ64ltO4pqUwZQ+iY7dGgiJzQjzEXqT+dhtesrK928F6oPTIQSa2lnyXqD0SFmHrMxWrZfbcviWkOvUaCl5QeywrQERGSdR10diiyBvmRaBt2P3gMMVyE2nwJyFpoyFeF3URfPy9+HThC+FwPL1eeYq3ZElOGAXF7xPgx2rLC37Musdxw==
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(14060799003)(82310400026)(35042699022)(1800799024)(36860700016);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: uX6xTlMWEGusjGCQLkn7QQu9N5qwhd24AL2kL93BqUaozF5frA5wgpxSDyjXOABbSfa2uI9PG1kRJxNhwIMucmGHUEUca+LA1vGnFBfWFT9Cz+/S4qIbuEqc1SSjJ0WugKZEJum2zOrIKP4ZJzANTA78846YGC9dcAJtRhxRUC2WsMV2M1IOVkqpsIkHXRyejDY2I3Jtq9ZJS7P94RGaOlvvbMiuowGip/DIgyHZeo6seLq/TNPyoMLt1m9HjPcrffe8Uwlhil7pE72GgNiReInrZyD8lHg1hI2cp+1v2cpA/xCXqrWfwASWR2uIwKeJDABKNyE1R/uGa5IKBdQ3N3PmRj4uIGryO4KzobVTExfdgwqloCFJPsJH+kJRuZSTJLJWwzNGQJhLnu306PMEwo0sciymV3XjAZADyA1tCvsSVehOEnT6mAGxjgltKo16
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 11:08:40.1484 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e400bda5-cad7-40e4-f63c-08de7aa78e85
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0B.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9217
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
X-Rspamd-Queue-Id: 72D0E21053E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,arm.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:liviu.dudau@arm.com,m:steven.price@arm.com,m:linux-kernel@vger.kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:daniel@ffwll.ch,m:nd@arm.com,m:akash.goel@arm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[akash.goel@arm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,arm.com:dkim,arm.com:email,arm.com:mid];
	FROM_NEQ_ENVFROM(0.00)[akash.goel@arm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This commit corrects the order of arguments passed to panthor_gem_sync()
function, called when the SYNC_WAIT condition has to be evaluated for a
blocked GPU queue.

Fixes: cd2c9c3015e6 (drm/panthor: Add flag to map GEM object Write-Back Cacheable)
Signed-off-by: Akash Goel <akash.goel@arm.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index bd703a2904a1..a70f1db0764e 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -893,14 +893,15 @@ panthor_queue_get_syncwait_obj(struct panthor_group *group, struct panthor_queue
 
 out_sync:
 	/* Make sure the CPU caches are invalidated before the seqno is read.
-	 * drm_gem_shmem_sync() is a NOP if map_wc=true, so no need to check
+	 * panthor_gem_sync() is a NOP if map_wc=true, so no need to check
 	 * it here.
 	 */
-	panthor_gem_sync(&bo->base.base, queue->syncwait.offset,
+	panthor_gem_sync(&bo->base.base,
+			 DRM_PANTHOR_BO_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE,
+			 queue->syncwait.offset,
 			 queue->syncwait.sync64 ?
 			 sizeof(struct panthor_syncobj_64b) :
-			 sizeof(struct panthor_syncobj_32b),
-			 DRM_PANTHOR_BO_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE);
+			 sizeof(struct panthor_syncobj_32b));
 
 	return queue->syncwait.kmap + queue->syncwait.offset;
 
-- 
2.25.1

