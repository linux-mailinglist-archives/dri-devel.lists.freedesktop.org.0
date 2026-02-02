Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGLwJoyFgGnE8wIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 12:07:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2923ECB7B6
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 12:07:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6839510E29B;
	Mon,  2 Feb 2026 11:07:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="f/lhcCe1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27ECD10E29B
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 11:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iy/Xp/fGD9HPcBwx20HT0azIq7gE+vQzb9KSfu2LfXM=; b=f/lhcCe1SxfBpnciD1mKGHm+N5
 DM33B5AGKUhtrak+KINm6CdjHsIuwJqx/MiPbOjcKoB0wGlp5ayOd30V7gSUqWtsLThhbh8S8HZal
 m2cpyVGND/8Qy4Dcqwj2R85Idi0z8t3ytGkeIvRf0z+7y26IglaKd2Yr6xRZbjQ1hurViJbtshG0E
 BmXB1n4KNAe1UqGX17YnugdoE/cHS4i/RUwI0iZS+p7X8s9+y+EBKrAfC33MoJzRZ5JDhxKTImMQ5
 jwEy7M3sety9XNktzzhB0WeZJ0eBrBOLV4+YLx8A1I8oJ/LK9NXZaX7Xp3/dk8/iwcNwrm1tT9czW
 LEwFvf2A==;
Received: from [187.36.210.68] (helo=morissey)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vmrmQ-00CjLX-DX; Mon, 02 Feb 2026 12:07:42 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH v2 1/2] drm/v3d: Replace IDR with XArray for perfmon
 tracking
Date: Mon,  2 Feb 2026 08:07:05 -0300
Message-ID: <177003042076.963288.14807223183003213431.b4-ty@igalia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127115822.64401-1-mcanal@igalia.com>
References: <20260127115822.64401-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mwen@igalia.com,m:itoral@igalia.com,m:mripard@kernel.org,m:dave.stevenson@raspberrypi.com,m:kernel-list@raspberrypi.com,m:mcanal@igalia.com,m:kernel-dev@igalia.com,m:tvrtko.ursulin@igalia.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 2923ECB7B6
X-Rspamd-Action: no action


On Tue, 27 Jan 2026 08:56:59 -0300, Maíra Canal wrote:
> The IDR interface is deprecated and the XArray API is the recommended
> replacement. Replace the per-file IDR used to track perfmons with an
> XArray. This allows us to remove the external mutex that protects the
> IDR.
> 
> While here, introduce the v3d_perfmon_delete() helper to consolidate
> the perfmon cleanup logic used by both v3d_perfmon_close_file() and
> v3d_perfmon_destroy_ioctl().
> 
> [...]

Applied, thanks!

[1/2] drm/v3d: Replace IDR with XArray for perfmon tracking
      commit: 0a5b0d095bcdb219348ed8ae1c97ee99fc4913b8
[2/2] drm/vc4: Replace IDR with XArray for perfmon tracking
      commit: b1cc4172cc60b1039235c9dfc08c3c1ffa4fb863

Best regards,
- Maíra
