Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DFGCKfmnWlDSgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 18:57:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9755018AD5C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 18:57:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11AFC10E5F7;
	Tue, 24 Feb 2026 17:57:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FlzYna74";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1765110E5F7
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 17:57:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A72E2442A1;
 Tue, 24 Feb 2026 17:57:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D882AC19422;
 Tue, 24 Feb 2026 17:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771955874;
 bh=SQb91GNf6kVtqmOCOt3loCbr4Ww0TH1GIwC6YpIa3uc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=FlzYna74ue06WvicglgW5ofZKmiQcZYJBYKZPX8MGqAMXDGHaYh8mKmSzR39lAyf+
 cc+jWS36ewuLRiEjD9X+ss8iEUip74NsxIZ7HsG6AEoMVgWSy30nIQZXoWQOkOSFWF
 kDA4WkOl70NES7HOrUg4FvIkH8OEPhLSVh4+1pURK53zh8I2S75RccB+wSWBcBP33u
 CaFSdxrtliwgHJEye52dr0VhlRb7VgeQ0QWPPMfM8n2jx0VELRqvp3MOl5/tuo76NU
 VkAlQsvBd+LQlzi7VB5ESr/h+N+p/IcKukRVXMIJWAsD2J0K7HQ5EAcvUlhV8yyQpQ
 wmVQNodQ9fWdQ==
From: Chen-Yu Tsai <wens@kernel.org>
To: jernej.skrabec@gmail.com, samuel@sholland.org, mripard@kernel.org, 
 Ethan Tidmore <ethantidmore06@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, neil.armstrong@linaro.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260217014801.60760-1-ethantidmore06@gmail.com>
References: <20260217014801.60760-1-ethantidmore06@gmail.com>
Subject: Re: [PATCH] drm/sun4i: backend: fix error pointer dereference
Message-Id: <177195587163.131169.15955848927842554754.b4-ty@kernel.org>
Date: Wed, 25 Feb 2026 01:57:51 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:mripard@kernel.org,m:ethantidmore06@gmail.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:neil.armstrong@linaro.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,sholland.org,kernel.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[wens@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev,vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 9755018AD5C
X-Rspamd-Action: no action

On Mon, 16 Feb 2026 19:48:01 -0600, Ethan Tidmore wrote:
> The function drm_atomic_get_plane_state() can return an error pointer
> and is not checked for it. Add error pointer check.
> 
> Detected by Smatch:
> drivers/gpu/drm/sun4i/sun4i_backend.c:496 sun4i_backend_atomic_check() error:
> 'plane_state' dereferencing possible ERR_PTR()
> 
> [...]

Applied to drm-misc-next in drm-misc, thanks!

[1/1] drm/sun4i: backend: fix error pointer dereference
      commit: 06277983eca4a31d3c2114fa33d99a6e82484b11

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

