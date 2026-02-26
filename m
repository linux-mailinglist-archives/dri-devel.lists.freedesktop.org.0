Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKpZLT5xoGk7jwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 17:13:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 487E71A9CB1
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 17:13:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5264B10E9A9;
	Thu, 26 Feb 2026 16:13:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mRTAsMgi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012044.outbound.protection.outlook.com [52.101.43.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF66510E9A7;
 Thu, 26 Feb 2026 16:13:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OhNIugziWgAjMffY0yHD5LmPSqbwoUpbs7tLJTNphDFEte8UM72b9ZudTPq0KQM1d91dCoN7nGPMPlm2u7g/ZI5btBiom7VzCIjOc4HvTuaMzjq1vXqIgViLOIqEDnxD8xlBA7ozUvOg1c5qCPG52c2kxpgbrpmaKjwrVj0lkIASNe6TGXr7U/hJ6YwfrDODfquDADsxnzB7dabDg710uSMnhlthSQF+zHkGzOMOcqXYnrEQ2YwAoitQPlqIU+daEuYGNvS2/u09p587yJYjbG8yXmue+lo+zSRhxNJtnBTEjfBOwAFD0Porjwy8I5DUk0EuvX8cbnvj8p2cOtQ0Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zrfdn01DvUA9D4GuHnoz3WfK5qbckAQwQY+Fh8TzNUo=;
 b=bxfKEux0RT/zSVdmyw74AC2pjmWw6R86tKvHVYCtr89VvuAiOoNPLOI8j8QJrOTVylCMi33UOGky4W1sMMc91sYEVStGgwkrBDUNcI5WlLBihngi28ESPsF9cBniypNQOLUAQ1q3CH8jSILBQLc2sUHFI2XOXMQYRtjr0DDdy3QrJb9I9+NbyKMEsGI+45sl/6WZ/k9dAdNlCqTSrU/w301fyB8VbOFtUdgwOS8kXaYtp3BI2PbS/NSzMpx9xYkzi+/zSTh3b/JOmt+LQRDdO+XbQYmFiAa9elr7E/I4qCuArVQTOOVRB+KptfvUQjxSf4GpZbCVd/FO9YiR5tOt7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zrfdn01DvUA9D4GuHnoz3WfK5qbckAQwQY+Fh8TzNUo=;
 b=mRTAsMgiZvCW55hnsgr6C+mGyYFk/tZVng34lrSiwLew4cRn7N+FFtiBAeKgH4SaRtMBWOmBuHd511BvoeHn0UAXCSKfOPP3wY7mE1wD2lWT2wlZ+343UQgvrxiUILSLZvtshI2gkdcf7rqvVmYlIT1XkwUysMYMXliK8pYz6k4=
Received: from PH8PR05CA0014.namprd05.prod.outlook.com (2603:10b6:510:2cc::7)
 by BL4PR12MB9507.namprd12.prod.outlook.com (2603:10b6:208:58d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 16:13:43 +0000
Received: from CY4PEPF0000E9CE.namprd03.prod.outlook.com
 (2603:10b6:510:2cc:cafe::61) by PH8PR05CA0014.outlook.office365.com
 (2603:10b6:510:2cc::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.0 via Frontend Transport; Thu,
 26 Feb 2026 16:13:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9CE.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 16:13:43 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 26 Feb
 2026 10:13:41 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 26 Feb
 2026 08:13:41 -0800
Received: from p8.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 26 Feb 2026 10:13:40 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-7.0
Date: Thu, 26 Feb 2026 11:13:30 -0500
Message-ID: <20260226161330.3549393-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CE:EE_|BL4PR12MB9507:EE_
X-MS-Office365-Filtering-Correlation-Id: f376df9e-bdaf-4ce7-56db-08de7552030a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: BSs7xEkjZ6Cvq7idfWdon2UC3M3ev3svL20WFL7QUFpw18Xic0W+9DYDBO+Jvc/4Y4dO7S4Q0JhrulNUiyD6gi5QyVLtxexGFejFwuJQQcc5z8vAWV0PVZluSkjjPa4l6vIqMOPZB5GcHpw40yRkkNSgeg8SM1MSecZgID8bPECj6ri55i8rUtuSmRYN7jTdUjGuAZIf8/v+gWOyvCFLzHEL0MrpKDc6yTwdGTrzErn9V//u3w8shlGDBwtPPbz6g7z9sPJbNn/puB87dCpWqPmjzsH/ngN4SpKDLCH8BeDAnDII1j7NxBW1syk4UZ/XQ6nnqi+Ietk+Z376oD4zGqNwTkL3dojvmvXRoHtB7BBftt4NNbY3a6OfJHmKshtHBar3Lrn25O8TFQ7mYUOaEHBC7+r81437VYhKVFYpkjsDlAdtxLYVFkc7SJdiQjhNZuqQSvefNnkE81jNB/h0rAvFI9NhxmsNw0TOnN7ttqwASA0ex0p3JnfoxvWUY9wo8H0h7/H5fULx3Qf3GlRf61sPOm2XbsfzkD5w0QrY5PhvDrbXJAlexUjwFzuulAV3G3GDDIytxma9RrzRZI1sKO/e1iSId/vYbl9cB5y0Jd/Kh2bBqMuCQMiGAG0BgYgpzpTXXOpZXxUqPg+RY+i8RHdzxdDYQvvnXnVByt4em/Ea+uUittXQfQBehjOBuCh8ZixP3VyyRthYuDQIvWHqbU3qG6fJm+n0oPfCMQzu/eSvlI22HMyRpuKQhCyK9dkLBYDDLWj9vNT2eFqmO+8kQg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /8rZUpDzALvdeLOnvEnz10P0x2jGrrXb2pX0yk1NB8YhtPFqLCOFlXScZS9Z2xmTj+LpYYDTYo+5izllRWFuksGFxKnDwVXP2gBH1PFOhUHSduBZuxFE2tXnf1Zg85SOdY95YyG1A9KEAGo95RtYBkc5XRevDBjZk8N8nKSeMjRtkxJDqkBO+0xkD+Sj4TBqHZfiDcD5Ov2yx4wfeb6RW2y/LQ6XfoF7ceAuhi5dN3YKbINmhH59MgYbEcEpiSE0Aq29IqM/BBfzV/uRitDVvX9c1//SI2sTSzdd6ki/n89q4FPF8Q9xzY7LicUpuo88MSlaJyle3iafiFLfSXqJXTpI4oxeyWSmG8NhASbaOexv5pwAAf1Y8wFTwYYCLZWTSACZnkmvZ6Aa6pYIGk+dCrx7u4aXuV/tqg9+PsW9S+q5gy7pEbpu15vL8570EZ9i
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 16:13:43.1064 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f376df9e-bdaf-4ce7-56db-08de7552030a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9CE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9507
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[lists.freedesktop.org,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[alexander.deucher@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gitlab.freedesktop.org:url,amd.com:mid,amd.com:dkim];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 487E71A9CB1
X-Rspamd-Action: no action

Hi Dave, Simona,

Fixes for 7.0.

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-7.0-2026-02-26

for you to fetch changes up to 6b0d812971370c64b837a2db4275410f478272fe:

  drm/amd: Disable MES LR compute W/A (2026-02-25 17:58:06 -0500)

----------------------------------------------------------------
amd-drm-fixes-7.0-2026-02-26:

amdgpu:
- UserQ fixes
- DC fix
- RAS fixes
- VCN 5 fix
- Slot reset fix
- Remove MES workaround that's no longer needed

----------------------------------------------------------------
Bart Van Assche (2):
      drm/amdgpu: Unlock a mutex before destroying it
      drm/amdgpu: Fix locking bugs in error paths

Lijo Lazar (1):
      drm/amdgpu: Fix error handling in slot reset

Mario Limonciello (1):
      drm/amd: Disable MES LR compute W/A

Natalie Vock (1):
      drm/amd/display: Use GFP_ATOMIC in dc_create_stream_for_sink

Sunil Khatri (2):
      drm/amdgpu: add upper bound check on user inputs in signal ioctl
      drm/amdgpu: add upper bound check on user inputs in wait ioctl

Tvrtko Ursulin (2):
      drm/amdgpu/userq: Fix reference leak in amdgpu_userq_wait_ioctl
      drm/amdgpu/userq: Do not allow userspace to trivially triger kernel warnings

sguttula (1):
      drm/amdgpu/vcn5: Add SMU dpm interface type

 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c         |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c      | 17 ++++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c      | 12 +++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c | 22 ++++++++++++++++++----
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c          |  5 -----
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c          |  5 -----
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c         |  4 ++++
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c |  4 ++--
 8 files changed, 42 insertions(+), 28 deletions(-)
