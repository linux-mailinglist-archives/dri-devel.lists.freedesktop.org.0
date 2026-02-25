Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGr0INDLnmm0XQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 11:15:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7251959E2
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 11:15:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47A9810E734;
	Wed, 25 Feb 2026 10:15:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="KflmgFfc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A1E10E229;
 Wed, 25 Feb 2026 10:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1772014536;
 bh=bcKeBLFA7r09gergzTg5pIlB76wIyA8EmIDez8Nds/k=;
 h=From:To:Cc:Subject:Date:From;
 b=KflmgFfcUjSwA9qLCh1cybV9mO5O6HCk5Ve7Kmhe8oF2jTlrxO+aZ4BQpa7MtHOgn
 YZrxciX/19hZB38uNNvNy9Xb35+IxSI9ST4ce7UjGiLxYQ+G8vAqOcDkhOj7JEGYUu
 hRcdjxykZV8SBGDAYV13b6AWIlFFyPvJni2QDqcVeyfCl5Mt4oq3m2YSm1FdAv5hJN
 rUJ4iK+/QLHd8cDh8mq4giTW3PbNMmhhBTAkXXspCi6iyfSEmFyLfS5/NJ9swYmIrT
 C5sP0WOGVFuOi/FIj/9+nV788QUGIgdlF51FfuN3XVNR5vszCIeu/05OLNeODcHvcz
 l5XhmnW7Ede8w==
From: Maarten Lankhorst <dev@lankhorst.se>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 0/1] Fix use-after-free on framebuffers and property blobs
 when calling drm_dev_unplug
Date: Wed, 25 Feb 2026 11:15:33 +0100
Message-ID: <20260225101532.13260-3-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lankhorst.se,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[lankhorst.se:s=default];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[lankhorst.se:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dev@lankhorst.se,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lankhorst.se:mid,lankhorst.se:dkim]
X-Rspamd-Queue-Id: 1B7251959E2
X-Rspamd-Action: no action

I tried to see what happened with xe_module_unload --r reload on a fully
running system, and came across these bugs in the kernel. Even after
these fixes I still see a hang when reloading, related to cgroups, so
likely some more fixes are needed to address those.

Should this patch have a fixes tag or cc stable patch?

Test-with: https://patchwork.freedesktop.org/series/162133/

Maarten Lankhorst (1):
  drm: Fix use-after-free on framebuffers and property blobs when
    calling drm_dev_unplug

 drivers/gpu/drm/drm_crtc_internal.h |  4 +++-
 drivers/gpu/drm/drm_drv.c           |  3 +++
 drivers/gpu/drm/drm_file.c          |  5 ++++-
 drivers/gpu/drm/drm_framebuffer.c   | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/drm_mode_config.c   |  8 ++++++++
 drivers/gpu/drm/drm_property.c      | 20 ++++++++++++++++++++
 6 files changed, 63 insertions(+), 2 deletions(-)

-- 
2.51.0

