Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BsyBbcXnmmcTQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 22:27:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D60118CBED
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 22:27:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE58010E623;
	Tue, 24 Feb 2026 21:27:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PcPkTOS/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012014.outbound.protection.outlook.com [52.101.43.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A33D810E623;
 Tue, 24 Feb 2026 21:27:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lGj52kXL8YryzlvTxLpKzh/694AE8VZWkWsbKXOuH00qENH+6uDAR4YL6XTGtrkGxJjsbgz+BKmoZSG5Y65+xArnoKW5frWeZE4rAu5B1l+Qn/9iF4ng6G8MOhiOUSaHGWu3uwdMkv+mx8no4etqpdbtevL/SsEbiJ05yAScKs+XAy8NX8+bjdxM7V/CGD7Ieg9Y+/UKlS7LB9AGbo1Bt30qXLZdAHEdmIcdTP7ZJkDAe/z0V/F8AVk1m2F5O39USNm4t6Vr1Bi2+kqeAOzhr0ABXJRQBIS0EP1PpkgL+XO08khGv2D8pXEJZI6viso+UAoYtCid1HI1p35hBa+JPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vCzKPl7/m7ICy5aZT/fgzQDU1i1neplz6ezVF5m1NnM=;
 b=LCcYhYQ6F2v1+UrJeQokcTJJqD4gyGDePzTmo1MpbY7fQ7Ai83c1s4c+4emyqaTFgGDUhD+jpR5/tAxxQpekgGMgPiAxKXf3hsjhds/C7XrRpWecfX2gRqM/AhYUOlQBCeJ4SW7Yjo4rhoR1Al3KZyfar2hEn+KIVCnJcQblkjknwrvV8u4YaeO7AnVzmWQfOmqfMo7dIhGuGXVM+4bh+5yIyQvB1LClhPqyuIbM8mINfTsPmA90VMNQvXHKzAYzrFw6H3UHo8028xP1yvyPBR8PuleeLE6cAmHLeC5laKWaCGV0Qxs+pcOo8gGcy/xLxuJpM913HbTWoUb8kdWIXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCzKPl7/m7ICy5aZT/fgzQDU1i1neplz6ezVF5m1NnM=;
 b=PcPkTOS/mIZRXnWiGsnTaJZ8uUA/4Z/GbVI1ne60Fvoz+zrclG+L+l4ZWyCA/aUX62l53C31ZgT8Bm1W9W3QC4KEDkqhibNG4qklqs1PrEeidg/E7QJjo6dv76hk5qjZd+sJ/L5FSL6rsh1XrfKnoxlXtkBVJcV3pcVmzBaNQCY=
Received: from SN1PR12CA0063.namprd12.prod.outlook.com (2603:10b6:802:20::34)
 by PH7PR12MB7818.namprd12.prod.outlook.com (2603:10b6:510:269::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 21:27:04 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:802:20:cafe::ef) by SN1PR12CA0063.outlook.office365.com
 (2603:10b6:802:20::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 21:26:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 21:26:57 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 24 Feb
 2026 15:26:57 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Feb
 2026 15:26:57 -0600
Received: from thonkpad (10.180.168.240) by satlexmb07.amd.com (10.181.42.216)
 with Microsoft SMTP Server id 15.2.2562.17 via Frontend Transport;
 Tue, 24 Feb 2026 15:26:56 -0600
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <simona@ffwll.ch>, <airlied@gmail.com>,
 <jani.nikula@linux.intel.com>, <ville.syrjala@linux.intel.com>,
 <superm1@kernel.org>, Leo Li <sunpeng.li@amd.com>
Subject: [PATCH 0/5] drm/vblank: Deferred Enable and Disable
Date: Tue, 24 Feb 2026 16:26:34 -0500
Message-ID: <20260224212639.390768-1-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: sunpeng.li@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|PH7PR12MB7818:EE_
X-MS-Office365-Filtering-Correlation-Id: 13942167-0d27-4ab7-9ce5-08de73eb70d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EmrcplB/lnYGDub7lLpnF9BH9lZMnNIJdVK67HWsR3tU6b/OatGohmV7T8V7?=
 =?us-ascii?Q?OcPQ0dhvBPvADr5jW0EQXnallTx1O3mqzjnGKCyXIeNfq/NvbSkb7eobBha6?=
 =?us-ascii?Q?xbQ3vwybdpikM9LG505kd5enPQQ6mAdAVJ00+LBGopzgtWNqETHMiu8dw/Mo?=
 =?us-ascii?Q?aXn9gSL6QnSbODKcSg/GeaIV+FRR3ZQicH7G7HHhwZNTv1RHeb3VIzxmyDXF?=
 =?us-ascii?Q?0vYYc9TMx/A2uErT+0DkXyFKGQHuDIs32UVcIO52aAznXEA/1ZBjWaXjxigb?=
 =?us-ascii?Q?tXWO4YBNpVYhVQBiNvYu6PYbS79rA4fOOIPvjaZTfcc60TquYRG3OB6AQLqS?=
 =?us-ascii?Q?IU1+UKF1ZB3USt8VSv7buWU3EzjPykKTCkNOm8VoGbYRtGR3hIP/CAj9r00N?=
 =?us-ascii?Q?MIfiDUlL+PXAdt9A7s+j1HCFb5gQXmXpGQsBbEF2fAfe96JHGkIi/D5Qkt7W?=
 =?us-ascii?Q?yOJfsavaHsJzmagHK7//o/Q0K+cNkIVvm85tDBSaUQG0pL/YtUYeNcduM4Kq?=
 =?us-ascii?Q?lbfNUGed0eaHvjDHyfuYl2GB+bX+QMCUiQy5w8PKykUGurvxtujjkq/Da67L?=
 =?us-ascii?Q?j/nB2LlPoa+ug0PEDYA1KiZvCLdYPf6ma+t6TOTEqeaKrIxFhrZXAP8zTYj9?=
 =?us-ascii?Q?BMd4HqjJb0wOKKEI7AA4BzP6pJh5lmo+RJkA0Lyt5KHapJLte8A6r99u1Ca5?=
 =?us-ascii?Q?fcae6UmBO21tkCcWIiymO34V0aEagkVR0iQS0z7elBeN/M1IVx5h1iKP0zva?=
 =?us-ascii?Q?QGnaoDj1K1+w31l/jxmfY6RGLaB3y3ekTKVQZMoGHaHLCi7Mg5F1MKBi01fQ?=
 =?us-ascii?Q?iLBcbcgAqbZuhtzkv3aUVuNp1O/HGIDEOA677iBnzOtGjhFJuxpxg41VM/4S?=
 =?us-ascii?Q?347kTuGGWHqYJJTeal30B/MavE9IO+wf/sIiSv7m6VA5ih/NoBx/u9+kkVAC?=
 =?us-ascii?Q?Qsu4w6sZ6COoxCrFUqSEBhVuMCwC1LroNvGEkvxGr0VdEzTZ+LP50hA7NUdc?=
 =?us-ascii?Q?uQXVKz25i2oEYWfe510UysEtDyPoPc+kCuAlD51+IRzND5S6EojbpG/x4QeA?=
 =?us-ascii?Q?z48EJRO1AYV+41OpzsOjdxaZkqZ3qNj44TTeFzCQktBMZg9Za2XNrio3Y9i3?=
 =?us-ascii?Q?qi87P9pW6+pLs+fnn2pBuKpAPS4gmxqE79x9yaHn9QTNyxsn5gs/CqenYjDv?=
 =?us-ascii?Q?sO57PV6tbN5Nx3M8pqVkURFOxL7FE3U8w3b8yTUte3TUdU/6GPrATtvmmQQo?=
 =?us-ascii?Q?0lgIG4bshd6qz8uUlXu/E+qQucOnMXHoBHmhqYtq6RTHasS3FJue0oGvcdgq?=
 =?us-ascii?Q?w5Z7VMEua/TsU6saTu08F2hAOhkrsPbDtXx5nG9sU9lYlg/bjWd76eAEL3Jh?=
 =?us-ascii?Q?phM3vAHXNcN5vYFQcNXX5QLHWdoVxGb3xnEfgyptu9CvN7zaoLS94banQ2TP?=
 =?us-ascii?Q?MMcFlyBGzrnhf4EH4ql2vilIdKN2ktOIjDQW9kY1CrknNo2BULZTsmB0A/vR?=
 =?us-ascii?Q?eghTa1KFC+wxLXLqaTWsyW0hLnBVTHmYZSmDpYaY3NiaEu58PqjdMlGlBNa7?=
 =?us-ascii?Q?oHEDxlc1SJf6Q3nGj4ya9xJetfSWWw0GGKb862wgOrsVvJ993cCP/yjJTXsB?=
 =?us-ascii?Q?TsDyp8b6swMthrZrY7DJsfo=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MkMFtvo3YTgWM+6NgPKWlrDkAnQoasyIDo6GlR9zybulDwjqQl86aym66ud+HabxLs+Pqm0jqZ8FSx0EV5vIVybu3Q2JZSIbTMTUb6ScA9iW7FNbT4p14tMrzu+rmgvqil/eUJLOXujf3uds+LefYcnsmkll51IoH+zoMEaTicrUBO6+lr/DKxZCsPSTisCyb39pGKaDNP1q9ewgRox5AVMIlanwwOqQM13xwjjXAChNRjDDZ56j85cxFXLGYa8jDGPoZg5rx9NkkBXHCWzKpeo1ywt3YGR5LOjNHKGkZltzlfgFq0yMuyPmYJHsOVU8zXNC5z3z/2tPGfXZ4yTJ44vQkFalESnjzL2M2nU9i8LJIA8L4o9DK3v4Hmt1FMUtaRPcl+PYSHphLHG5drn6uhZAMPbkMdjflWdrj01Ly8jMmiOfYe1XDxRnXvybUfI4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 21:26:57.9808 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13942167-0d27-4ab7-9ce5-08de73eb70d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7818
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
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[amd.com,ffwll.ch,gmail.com,linux.intel.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email];
	FROM_NEQ_ENVFROM(0.00)[sunpeng.li@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7D60118CBED
X-Rspamd-Action: no action

From: Leo Li <sunpeng.li@amd.com>

# Abstract

The purpose of this series is to introduce a way for drivers to do blocking work
as part of their vblank enable/disable callbacks. Today, this isn't possible
since drm_crtc_funcs->(enable|disable)_vblank() can be called from atomic
context. The proposed solution is to defer drm_vblank_enable() and
vblank_disable_fn() to a workqueue from within the DRM vblank core, along with
introducing new crtc callbacks where drivers can do blocking work.

A drm-misc-next based branch with this series applied is available here:
https://gitlab.freedesktop.org/leoli/drm-misc/-/commits/drm-misc-next

# Considerations

Why not defer within the driver callbacks? It can introduce concurrency between
the deferred work, and access to HW upon the callback's return. See
drm_vblank_enable()'s call to drm_update_vblank_count() that reads the HW vblank
counter and scanout position, for example. If the underlying HW remains
accessible when vblanks are disabled, then this wouldn't be an issue. But that's
not always the case (amdgpu_dm being an example, see patch 4/5's commit
description). One may be tempted to spin-wait on the driver's enable worker to
complete from the callbacks that access HW, (*)but waiting on a deferred
process-context worker while possibly in atomic context is not ideal.

Doesn't deferring from the DRM vblank core have the same issue? Yes and no (and
here is where I think some additional review is required):

Since the entirety of drm_vblank_enable/disable_and_save() is deferred, access
to HW counter and scanout position from within is synchronized with the
enable/disable callbacks. However, it is still possible for the caller of
drm_vblank_get() to run concurrently with the deferred enable worker that it
scheduled. This is not an issue with vblank_put(), since HW is already in an
enabled state, and it's OK for HW to disabled a little later.

In cases where the vblank_getter wants to ensure that vblank counts will
increment (e.g. for waiting on a specific vblank), this shouldn't be an issue:
HW vblanks will be enabled eventually, and the counter will progress (albeit
with some additional delay). This seems the case for all vblank_get() calls from
within DRM core, with one exception addressed in patch 1/5.

But if the vblank_getter requires HW to be enabled upon return (e.g. programming
something that depends on HW being enabled), a new
drm_crtc_vblank_wait_deferred_enable() helper is provided. Drivers can use it to
wait for the enable work to complete before proceeding. This doesn't have the
same concern as (*) above, since wait_deferred_enable() must run from process
context. And if the driver needs deferred enable/disable work, it sounds
reasonable to ask it to also do such work from process context.

# Some more context

This is actually a redo of a previous attempt to introduce a "vblank_prepare()"
driver callback that the DRM core calls prior to entering atomic context. It was
dropped because it has synchronization issues -- there was nothing preventing a
previous vblank_put() from "undoing" the prepare work while there is a pending
vblank_get() (IOW vblank_prepare() and vblank_disable() runs concurrently)(*).
It also asks all callers of vblank_get() to be vblank_prepare()-aware, which
isn't great. This series can be found here:

https://lore.kernel.org/dri-devel/20260127194143.176248-1-sunpeng.li@amd.com/

(*) With the pre/post_enable/disable() callbacks for deferred vblank
    enable/disable, drivers can acquire/release their own locks, as long as
    they're properly paired.

Leo Li (5):
  drm/vblank: Add drm_crtc_vblank_is_off() helper
  drm/vblank: Introduce deferred vblank enable/disable
  drm/amd/display: Refactor amdgpu_dm_crtc_set_vblank
  drm/amd/display: Implement deferred vblanks on IPS platforms
  drm/vblank: Add some debugging trace events

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   8 +
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 263 ++++++++++++++++--
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.h    |   4 -
 drivers/gpu/drm/drm_atomic_helper.c           |  11 +-
 drivers/gpu/drm/drm_drv.c                     |   5 +
 drivers/gpu/drm/drm_internal.h                |   1 +
 drivers/gpu/drm/drm_trace.h                   | 112 ++++++++
 drivers/gpu/drm/drm_vblank.c                  | 227 ++++++++++++++-
 include/drm/drm_crtc.h                        |  34 +++
 include/drm/drm_device.h                      |   6 +
 include/drm/drm_vblank.h                      |  20 ++
 11 files changed, 642 insertions(+), 49 deletions(-)

-- 
2.52.0

