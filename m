Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNfhHRTohGlf6QMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 19:57:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9395F69FF
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 19:57:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8758D10E074;
	Thu,  5 Feb 2026 18:57:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="U4R03ZGk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC8310E013
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 18:57:16 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-502a26e8711so7907541cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Feb 2026 10:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1770317835;
 x=1770922635; darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Plcb1tyHlgD2XmdE3zgDgi5PJu1QpuIkg+akIyg2pv0=;
 b=U4R03ZGkJWAiv/R7OM6sf3nLcwkILtsFxirMfQyVSLQ0lsnywIkx3TX+1nZ/NSRTZH
 yvXTzpg6w4+483bmXZt7iDVlNNPbUZC81dMDTnrP5RSR1jYtEFwfo1YHjHwBzU+R6QDZ
 ++vbENHPWhoPw0w8FaoxdZHai/m819aZUYPB36QNAThY2rTkiWuxj9WBGl1tZLAbu1DX
 j6D2FtNbVb6BnDTMQW2FyhBUTiym0VdMWO0WcbiTSPe7jaTdbeM2ak4s64SxIsjGTx8i
 5//XWl0Nu0kQs+rQ+VGRkHoNOovtKO3j6mcE9dPu4SwXSVl2pJjIZa+oWxvYm/PvwAhV
 OqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770317835; x=1770922635;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Plcb1tyHlgD2XmdE3zgDgi5PJu1QpuIkg+akIyg2pv0=;
 b=wkXYy9Wqy2Ubue06snEx3oQZioCIthwKlRTzlUIy9oH2BulxieMtS02QNzD18yDrq6
 bob9H7TX7DWJ8wp8YOoQqbK59sbu8NWiGfX2DqhQ0SmpwTjAg0CKcZavKrTtjmdC+TS2
 S3Qil2aMbyP/KValNjfBFvm1YMwjK51ajlpneICuKp7y3E9Yom19jdyo8jrbvBRMvUAH
 8aXyIXe2c/5VYYkb0Kl3Y2ng5cbI69vGDKqAjYQ7mRP7nE1Np6oS6esC9MI7svwp5/Ia
 N4ldZRKJ0Pf7TfwKSPHaGhggsfSq7DClYhvuA1RvMGh0MouwLlnYasg/hlx8voG/QbrO
 bPYA==
X-Gm-Message-State: AOJu0Yx/iQ6GHwXEv8m7e2pFc9bLkvCVR3ckg4lSjzeqx2rhlDJAtrDB
 oqe36a67rSjzAA1fVzPO6Xud60Wo6jFoNIOifCxmrUWukZJI3Fw4qeoA7jFAchq9hbA=
X-Gm-Gg: AZuq6aKF+ZuzFNoxwffYIkQubogBAPVS7a5LXrddLl9O/0XwVH7PZZnaioPnTo7Aw95
 9p8AKxB1ig8xuQz/jktWyifQ0UVIX3gkDTzFxkw1LEneyNh2G7Vv0brxTVFpJGtDPs1dt36cx8B
 ldLg3LGlRgsTmvpIgq4UjnOF2zqc1QLGCNuvjvn0FcZhCQnvLhCgFrELJBE7BWY7aE6q1lvMkda
 NrEfXgZpl+sk4XZHvhu2v/b0aMY51cSsgEVIgeu3XjxvNapBko+FOoMsGqsbMFYOEJcQjwyrLe+
 tL8yy18FrlDXDD1XkiqH6vwjunx6sYPZzAvjbHwlCqrtQscyZaVweDijzZ4KHaRevw0AzwC/H2d
 t4MT/2ovlrrA+ryf2p18MYA1hyOwj5ifAJqhyKrSt0xjDWzTTZ8+hpz0TLq0bGeZG7b3kDBewZM
 4IxyRGzDPA/Auqo163LSSv85OPAZyQ
X-Received: by 2002:ac8:5e11:0:b0:4ec:f26f:5aea with SMTP id
 d75a77b69052e-50639a02480mr1109211cf.68.1770317835142; 
 Thu, 05 Feb 2026 10:57:15 -0800 (PST)
Received: from [108.27.160.201] ([108.27.160.201])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-506392902f9sm1678331cf.18.2026.02.05.10.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 10:57:14 -0800 (PST)
From: Mel Henning <mhenning@darkrefraction.com>
Subject: [PATCH v2 0/2] drm/nouveau: zcull support
Date: Thu, 05 Feb 2026 13:56:09 -0500
Message-Id: <20260205-zcull3-v2-0-ac572f38cc7b@darkrefraction.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDIwNT3ark0pwcY11LAzNTQ0PT5BQjYwsloOKCotS0zAqwQdGxtbUAHzQ
 5G1gAAAA=
X-Change-ID: 20260205-zcull3-9065115cd238
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Mary Guillemard <mary@mary.zone>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Mel Henning <mhenning@darkrefraction.com>
X-Mailer: b4 0.14.3
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
	R_DKIM_ALLOW(-0.20)[darkrefraction-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:lyude@redhat.com,m:dakr@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:mary@mary.zone,m:nouveau@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:mhenning@darkrefraction.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[darkrefraction.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mhenning@darkrefraction.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[redhat.com,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,mary.zone];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[mhenning@darkrefraction.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[darkrefraction-com.20230601.gappssmtp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[darkrefraction.com:mid,darkrefraction.com:email]
X-Rspamd-Queue-Id: C9395F69FF
X-Rspamd-Action: no action

These patches add kernel-side support for using the zcull hardware in nvidia
gpus. zcull aims to improve memory bandwidth by using an early approximate
depth test, similar to hierarchical Z on an AMD card. These patches add a
new ioctl on nouveau devices, which is currently only supported when using
gsp firmware.

Corresponding userspace changes for NVK are available here:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33861

This series is also available in git:
https://gitlab.freedesktop.org/mhenning/linux/-/commits/zcull3

(v2): Split the first patch into two - one for fetching information from
      the hardware and the other for adding the UAPI. Also, drop the
      change adding DRM_NOUVEAU_SET_ZCULL_CTXSW_BUFFER - it isn't
      necessary to get zcull working and will be pursued as a separate
      performance improvement in the future.

Signed-off-by: Mel Henning <mhenning@darkrefraction.com>
---
Mel Henning (2):
      drm/nouveau: Fetch zcull info from device
      drm/nouveau: Add DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO

 drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h   | 19 +++++++
 drivers/gpu/drm/nouveau/nouveau_abi16.c            | 29 ++++++++++
 drivers/gpu/drm/nouveau/nouveau_abi16.h            |  1 +
 drivers/gpu/drm/nouveau/nouveau_drm.c              |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c   |  9 ++-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c   | 32 ++++++++++-
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gr.h  | 19 +++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h    |  2 +-
 include/uapi/drm/nouveau_drm.h                     | 66 ++++++++++++++++++++++
 9 files changed, 172 insertions(+), 6 deletions(-)
---
base-commit: 18f7fcd5e69a04df57b563360b88be72471d6b62
change-id: 20260205-zcull3-9065115cd238

Best regards,
-- 
Mel Henning <mhenning@darkrefraction.com>

