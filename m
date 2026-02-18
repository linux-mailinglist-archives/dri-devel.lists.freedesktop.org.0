Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ArFyB5c7lmkDcwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 23:22:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B0D15A986
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 23:22:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8DA410E03D;
	Wed, 18 Feb 2026 22:22:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FppAmKrS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F27610E03D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 22:22:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1928B40308;
 Wed, 18 Feb 2026 22:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF3F8C116D0;
 Wed, 18 Feb 2026 22:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771453330;
 bh=lzLcD0AsNtvgIa4v+iQyMVG3o2l0D6Gk5ly9tU1d0gw=;
 h=From:Subject:Date:To:Cc:From;
 b=FppAmKrSFhR8Y316Y6xj63PncDQq0u5M6DLGt+w63laXqXpZwzreZBEw0MHOeSUeG
 i4Y4EOpn/1ycZ01h4EqHKvmdFjTdPTskgmtjSHpOYKVJdmi6So2Ra10AJ4yFX6kTau
 yqmwL9nBCZrzgl2+Pg+M/3uWBUQAGAihf8S8IhWguywq/XL17SXWfg47pO0TqfWb+t
 urYfNto+yt9wvKqj9mMyZMKi2wbFYMxKQnNqz5NDjyqR15O35pQYSJzy/cafiDh3aU
 EbWHRMsRANtvm5+/LQHs2arpxb6ym5bZ1+gzgpgdKBOCF1WemWdUtZSBcjhYvNXAVP
 EDOh0NhWI2+pg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH 0/3] accel: ethosu: Runtime PM refcounting and cmd stream
 validation fixes
Date: Wed, 18 Feb 2026 16:21:54 -0600
Message-Id: <20260218-ethos-fixes-v1-0-be3fa3ea9a30@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAII7lmkC/x3LQQqAIBBA0avIrBPUsKyrRAupKWej4UQE4t2Tl
 o/PL8CYCRlmUSDjQ0wpNuhOwBZ8PFHS3gxGmUEZ7STeIbE86EWW2FvlvB0n6wy048r4hzYsa60
 fwanwbF0AAAA=
X-Change-ID: 20260218-ethos-fixes-e3508a579582
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 Anders Roxell <anders.roxell@linaro.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Frank Li <Frank.Li@nxp.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tomeu@tomeuvizoso.net,m:anders.roxell@linaro.org,m:ogabbay@kernel.org,m:tzimmermann@suse.de,m:Frank.Li@nxp.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[robh@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 96B0D15A986
X-Rspamd-Action: no action

This is series of fixes for issues I found in testing additional models 
and adding more supported operations in mesa.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Rob Herring (Arm) (3):
      accel: ethosu: Fix job submit error clean-up refcount underflows
      accel: ethosu: Fix NPU_OP_ELEMENTWISE validation with scalar
      accel: ethosu: Handle possible underflow in IFM size calculations

 drivers/accel/ethosu/ethosu_gem.c | 12 +++++++++---
 drivers/accel/ethosu/ethosu_job.c | 26 ++++++++++++++++++--------
 2 files changed, 27 insertions(+), 11 deletions(-)
---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20260218-ethos-fixes-e3508a579582

Best regards,
--  
Rob Herring (Arm) <robh@kernel.org>

