Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAqjM0sfdmlaMAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 14:48:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C5180D51
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 14:48:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE6E10E162;
	Sun, 25 Jan 2026 13:48:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Bz7FAYJO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74BFC10E34E
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 00:12:03 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-82311f4070cso1354018b3a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 16:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769299923; x=1769904723; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=S13bvTkOJ8+hfUIaAAD5yR0hRksywvnKTFVvNAS0+Hk=;
 b=Bz7FAYJOTmt0HtG4PmWKeATFDjEHAzoAO6mIA7OiazEsFPGQ1d1f+NsX91gf5oDF+B
 cx52uMnNC0ZAUshp/2DPKiKKsPlYnh67nc4rOTRRoOlFBL+qSIWI11Flpa45EpRt3zu7
 IHTKx4hS+d/WS3EHebFkB9zvSnqTPe9RMlHqPBPJdZmh+Kqa+wJCeCE0edKXFBsyZSij
 V6Wic8T8GzstB5VgurulG0/TiCTqU9rX20AhENZAtX/9p7fLgsc+/YPsDXsFJYEuPPsr
 Iih42AtdB6dSQfSen+ed9zqoLLeLZVRGT5pXfklQp+yM8cRZ7R3pgCHvoWB0gwj21iUJ
 sJuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769299923; x=1769904723;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S13bvTkOJ8+hfUIaAAD5yR0hRksywvnKTFVvNAS0+Hk=;
 b=qrjU2nLnlME/gg13/Yad//aRw+BIjIcNVl5B6vlYOjsQ/DHmql8EnQDNtXk+8DDj9U
 9PIxF91U147OFRLAZgxpeYrzAvWsVHdCqVp0C9SeM2PjDTokw1LOIZ98SBVK4oRweR2f
 agBpWl5Ki7qes52PZBE8S6Zi+tL6yW2hUDcIRBRyxGeE3uT69sZCbTXN44Ha0tXxiFss
 o1ndJjC6FSrJrXmiKCnSRpgg4Z/QtzpbjsMGODQudv89K8A7hp/kgV8CFnxZdzQbPbTN
 +6LaAO1uOPLza/v2NekipL2ft2peooaGhkwbxQzBmKruHiC3kwhX19juMyMzbzJCrVfi
 60EA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWTE9Zl++wa12T7Gea5Vdy4zxEMIad/UcrU4lRWXWdZ/17f7ecHe4Qvt6hwp2uMt8VT1qbcts3jcY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxU/34YZz+A/BpPb6xnuhmCkk9WyI2vVnvk09MrTiLg47ptmGox
 SorrnnW1TvLSX+xE2mY+9iooeOkBHSm0BT5h5v1szztT2nf6MIwroik=
X-Gm-Gg: AZuq6aIjaQRbBxHsPej8MAAoa1lLmjGwejECEkUYUQaLPyYi7UcYV7B2vSstcpl12+s
 l8d8FZdOGYdKFD/ZIKVSRhczeyzYupNNOs2Mrt549cQcB/EaSDyPdlL8r116LyNsag+pMkoEZLe
 OBfQLO5QJnLJl+jlerHZg5xthkmCHaavmmn0wFvnjFSHdFng2ZLGz0U9nby4wYzxT43cMhOsfcd
 9+53Qr6TP58UKl9fd1xIFB0tke6dU779WGEpeyW9kt1zhIBamVmXnNpofonnPoXmTyftS1YXbi4
 ikt3YhLheB+rK4b3xHOjI5v5O8E5+JquCcOcEJY/q5YZm92ohlGDRotqMfe09gLXy2evYuoa0W/
 wiU9chfAUUtMBdSStSwG9+pVuIxn52CMBcX54fMZPx2ILGXzBuUJ4hybBET87fPSNAYlHk0odz9
 MKtXPEKxPbu0Jpa64=
X-Received: by 2002:a05:6a00:4091:b0:823:1444:7873 with SMTP id
 d2e1a72fcca58-823412bf321mr213136b3a.32.1769299922979; 
 Sat, 24 Jan 2026 16:12:02 -0800 (PST)
Received: from at.. ([171.61.161.234]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8231876e5d0sm5608273b3a.61.2026.01.24.16.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jan 2026 16:12:02 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Add support for eGPUs on Apple Products
Date: Sun, 25 Jan 2026 00:10:59 +0000
Message-ID: <20260125001111.1269-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 25 Jan 2026 13:48:52 +0000
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:atharvatiwarilinuxdev@gmail.com,m:jani.nikula@linux.intel.com,m:rodrigo.vivi@intel.com,m:joonas.lahtinen@linux.intel.com,m:tursulin@ursulin.net,m:airlied@gmail.com,m:simona@ffwll.ch,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[atharvatiwarilinuxdev@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,intel.com,ursulin.net,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atharvatiwarilinuxdev@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A4C5180D51
X-Rspamd-Action: no action

This series adds support for eGPUs on Apple products, by
enabling apple-set-os on all apple devices.

A side effect of this patch is that the iGPU becomes enabled on iMacs.
However, iMacs can’t use the iGPU for rendering (They can't link-train
the internal display), so displays must be disabled on iMacs.


Atharva Tiwari (2):
  efi/libstub: enable apple-set-os for all apple devices
  drm/i915/display: Disable display for iMac's

 drivers/firmware/efi/libstub/x86-stub.c       | 22 +++++--------------
 .../drm/i915/display/intel_display_device.c   |  7 ++++++
 2 files changed, 12 insertions(+), 17 deletions(-)

-- 
2.43.0

