Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JcPOLRlf2mwpgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 15:39:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B12C6353
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 15:39:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD19610E03C;
	Sun,  1 Feb 2026 14:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R1DSTRfO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3897410E03C
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Feb 2026 14:39:43 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-81df6a302b1so3331302b3a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Feb 2026 06:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769956783; x=1770561583; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=sIr4S9fq29SpUMjufiJ6VUXkttUEEBTIS27qyRZQcbI=;
 b=R1DSTRfOtjyGMIMbkZ+b/sTBfJj2bfQ2mXDGMINXShLhEOyQ2e4Pips8pr9U3E8LKr
 +TGqz9BiPEnm4U1uURz1dadGoWB5NSZYEhChEfIocsw5c9H5X6hFJnwNr7aoD/+Vg1Mp
 XoBUFHn/9nkrPwbf8kfxo/apO0re6hMkvF+3GxSrxUSvpx7gjGLaUqETreWnNKsoTIiU
 v3MspyUxlMFzzqRVB5l8dNZg5VrzYQHwKZ7nGWUvVGNRynxRBa+iHNwpbYeohYt6EeHC
 IfuZJDktlcuVkIMKRYwnjHsCSJvh2tXcaEXIKCoX+4VxctLQLjYgZWoyB+IuqXrF0VGH
 tZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769956783; x=1770561583;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sIr4S9fq29SpUMjufiJ6VUXkttUEEBTIS27qyRZQcbI=;
 b=IbmW2ExMsmnplL7Afs+QyMA3skejmwhozTXNoR8YK7UsMvDG+lqOHSJUfR7yWvmLR9
 C6GNBQt12E7QKOZzbb1NwAZx5YB3dUsVZUVTNbSfK55lVIqhOqERarggAimkhDXY21Fk
 hcwHTcVT3hfC01evhcSQ6rlEaHVIqsS3hfAsrML5if6jKBdK9eXqKQxe0EmkVTMsibsn
 2jsuWwz/jFaGLwxlV/fTLwOxbkl06frMMtmLcZIKCq9WJJ7oe6yNOI37d6gXq8PmlmhR
 BH1EV1R5/OiBXMW6+lqLBizv/uOMSriSF4QYU4iEndVTsIhUpqQRdkJPQRgMOWcda8Dm
 fXyw==
X-Gm-Message-State: AOJu0YyzouyVn42mjtHy3bwPgRvbcsNY9d5gbR9HVksAUDw6w7mhoTar
 gBkAyXXuZtfx7l+VD9g7HPIvI5juxKptyUtoJwGDfaj6f/zp3CsLw2O3
X-Gm-Gg: AZuq6aLvyRKMQChyevYm/g1cEbrzsBZtrheR6eiDhalj7i9Tk7dj3RePqTk/bBHDBoy
 txvm5Ed2W8hrO+97xxjIS11rFKXSn9y5D8moyfkdb80dKUAOflX2z20i+Z26/xTBeDdSwOnwdC6
 63BdI7JrfBTz4F/PEDTbIkaOnTs4HMp0q4SnUT0PtyC7dlW1kuFVtS1V/UIZhkQ7mjXhD1ArZAH
 EdLQ1cTRKYjcdQSxcvNrYyhswrdn1bqbG18u4YBpvZm5hBk4WmFWuX5ouPtZ4YrhN5+Oui3qjr+
 Nss7LQ16PBhQu87qoqIM/4/i6u47RUDHzEy9cnt+pQd091Ph9iOZOfUi/12/CqwKEbZSObO3eeA
 Mw9XRVgL3DrKTTQek8eV5ujV/7EG9noRaKgzI2OlFJ6BfFmLK2gsk8FZVEDC8fLQFaK6YFZQ5Bs
 gsWy9qfio1/Z9i+N6Hj1NQcEcXVhBE+/qm/jXJBKVXCUDuK7yLUs5YapI=
X-Received: by 2002:a05:6a00:9297:b0:81e:e0dc:6d00 with SMTP id
 d2e1a72fcca58-823ab74cf77mr8638043b3a.58.1769956782617; 
 Sun, 01 Feb 2026 06:39:42 -0800 (PST)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82379b4a771sm13063027b3a.19.2026.02.01.06.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Feb 2026 06:39:42 -0800 (PST)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-next
Date: Sun,  1 Feb 2026 23:39:39 +0900
Message-Id: <20260201143939.27074-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.34.1
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
X-Spamd-Result: default: False [1.99 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[samsung.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@linux.ie,m:daniel@ffwll.ch,m:linux-samsung-soc@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[inki.dae@samsung.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[inki.dae@samsung.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,samsung.com:mid]
X-Rspamd-Queue-Id: 14B12C6353
X-Rspamd-Action: no action

Hi Dave and Daniel,

    Fix three regressions in the Exynos VIDI driver related to context lookup,
    user pointer handling, and concurrency.
    The fixes ensure the correct vidi context is used, safely copy EDID data
    from user space, and protect EDID memory operations with proper locking
    to prevent invalid access, security issues, and race conditions.

    Please kindly let me know if there is any problem.

Thanks,
Inki Dae


The following changes since commit 502d2d8e01c8930afd42363d543ed11298cbe34a:

  Merge tag 'drm-xe-next-fixes-2026-01-29' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next (2026-01-30 13:02:41 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v6.20

for you to fetch changes up to 52b330799e2d6f825ae2bb74662ec1b10eb954bb:

  drm/exynos: vidi: use ctx->lock to protect struct vidi_context member variables related to memory alloc/free (2026-02-01 23:28:01 +0900)

----------------------------------------------------------------
Fix three regressions
. Fix a regression where vidi_connection_ioctl() used the wrong device
  to look up the vidi context. It stores the vidi device in exynos_drm_private
  and uses it in ioctl(), preventing invalid pointer access and related bugs.
. Fix a security regression where vidi_connection_ioctl() directly dereferenced
  a user pointer for EDID data. It copies EDID from user space
  with copy_from_user() into kernel memory before use, preventing arbitrary
  kernel memory access.
. Fix a concurrency regression where vidi_context members related
  to EDID memory were accessed without locking. It protects alloc/free and
  state updates with ctx->lock, preventing race conditions and use-after-free bugs.

----------------------------------------------------------------
Jeongjun Park (3):
      drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection_ioctl()
      drm/exynos: vidi: fix to avoid directly dereferencing user pointer
      drm/exynos: vidi: use ctx->lock to protect struct vidi_context member variables related to memory alloc/free

 drivers/gpu/drm/exynos/exynos_drm_drv.h  |  1 +
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 74 +++++++++++++++++++++++++++-----
 2 files changed, 64 insertions(+), 11 deletions(-)
