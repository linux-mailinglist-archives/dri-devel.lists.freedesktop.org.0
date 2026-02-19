Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALcOAz5tl2nxyQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 21:06:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C09162361
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 21:06:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9587F10E195;
	Thu, 19 Feb 2026 20:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="PkXW0pxv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA62510E744
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 20:06:16 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-8cb3dfb3461so136646285a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 12:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1771531575;
 x=1772136375; darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IIXy2pMG7ODDdjrHID85DEgKFqwPY/I8njEG3vmpfBE=;
 b=PkXW0pxv1ctPYdo+lQyFDurWRD4By00t/B2JYucru0/XIiTLlNRvwf/xWxIg7hs+Ny
 UcUG3AgioiOFy9iPY2RR7rGicugUbOUhDav4FZQ9NU2lahIZfnosde7Qa+tmJTSHP3uy
 jid8I7QN9rYYt8OdUyarmKuPx0Lib0ut7Os3vOolnboKLi+1kzImK2kkZdgR9+zY9yxG
 iVz68yVBZTuYDDRlWOhokzQunUFahUP9tBrykUgGWC8l1yWnl7B3mRUCsIYQ4/bYKOCj
 RDUuByFqOdcR/Qrl2hknVOKLuLFOXTV/8XMyiA+zHGHwG2UeWUtNkEUrSTcX6nLc6Y5A
 Ea6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771531575; x=1772136375;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IIXy2pMG7ODDdjrHID85DEgKFqwPY/I8njEG3vmpfBE=;
 b=wIJAHycCXkTlDz3QFNay9fjH+Xntc233VYV/LkXl0uED3FEbew1JWk82GcuT0EaHNO
 7EwkXy2Pm2xAhFiAwomXbSe5F0MSrGDazHr6sfR0uSlF7PBvZnFapI402ullryRBOTl1
 tjXTwpGHQxSP8syaQsYlElGMRba0NCZtxWuUOeZKMIZI+hRm5uM/+qJYLY7ENOJVGVRJ
 +8x6oZ2YC1auJDz3bf517aZ/XNBEKOld9YWTOaRwTvRoRRK2W+qMLXFJE/epizQkqhoK
 KqKEacGpOsP/guawTIq3cmzsWSYRg/BljOpoQnmrpcPpompAeaOiuSeJ8fh2LJ0n+MLn
 sMMw==
X-Gm-Message-State: AOJu0YyuCSmDVCKhi1cm81QvD9d/1jTzxoYXT/Riy1uvKoOCz68Sfcmj
 Y6eUtX/0yzVYfSP+KdC9QcsmQbHMwcMwMd9SjnptkuavfidliZMDqviRd4JvECB/oQ4=
X-Gm-Gg: AZuq6aJmfqKZpGCKj/d+De/ctCRe8FPbFwLhSbm/hf3BBCvBTYXOcphcsBEVva6/OKU
 XKSFXq3224rfBZo2J+UlyOWC6hpUJc2b8JsgQ+UUvh+v7FMV44GkqsSlK6Lkxyg9diOiSP2JyjG
 M8vYdtiVxyN5R8msCRNEgbpPRVmLvxHQpKtvzjS+q02qdVg5JSmvjK9oObRL8c1FB0TuOvQbuKK
 hDeBW4vqsBs6cSHYDrE6b1kDZhcU6bobopOfZCDFr3sLufi5cQ6P5/JUEt+KA3Nzkb3bzUemkJ0
 SGfqY8hDK+jr9wIvUTI7OEQyv1T4zHqlA9s8CoKVav0WJGpn3HAYIlCZdH/0XNmop2A8LvS/MXS
 NUaWpFIT3l4O9omzB5IQLjJ7bpFTXQXuSXxVTIP/VfMnCnoswMeD+35rcpf0zro222hrUciLJ/X
 vm8Fm3708fctqzR68TNgVzjqOwY5RrpoRIoR40rbnp0odXf6AqYVf3zuzXsIEAvNswx55Nqe6mA
 YsqYv9ErA==
X-Received: by 2002:a05:620a:720d:b0:8cb:40ca:2f8c with SMTP id
 af79cd13be357-8cb40ca31e4mr2170465885a.31.1771531575440; 
 Thu, 19 Feb 2026 12:06:15 -0800 (PST)
Received: from [96.232.40.90] (pool-96-232-40-90.nycmny.fios.verizon.net.
 [96.232.40.90]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8971c8e60a0sm216675066d6.0.2026.02.19.12.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 12:06:15 -0800 (PST)
From: Mel Henning <mhenning@darkrefraction.com>
Subject: [PATCH v3 0/2] drm/nouveau: zcull support
Date: Thu, 19 Feb 2026 15:05:52 -0500
Message-Id: <20260219-zcull3-v3-0-dbe6a716f104@darkrefraction.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XOQQ6CMBCF4auQWVtTpimgK+9hWNRpkYlITYuNS
 np3K1uX/8vky6wQXWAX4VitEFziyH4uoXYV0GjmqxNsSwNKbCRKLT70nCYlDrLRda3JouqgHD+
 CG/i1Qee+9Mhx8eG9uQl/6x+RUEhhSLc4qI6ovZysCbfiBENLeWNP/g59zvkLFn6cXKUAAAA=
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
	FORGED_RECIPIENTS(0.00)[m:lyude@redhat.com,m:dakr@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:mary@mary.zone,m:nouveau@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:mhenning@darkrefraction.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[darkrefraction.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[mhenning@darkrefraction.com,dri-devel-bounces@lists.freedesktop.org];
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
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[darkrefraction.com:mid,darkrefraction.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 74C09162361
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

(v3): Make commit messages more verbose. Remove WARN_ON() call.

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
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c   | 34 ++++++++++-
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gr.h  | 19 +++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h    |  2 +-
 include/uapi/drm/nouveau_drm.h                     | 66 ++++++++++++++++++++++
 9 files changed, 174 insertions(+), 6 deletions(-)
---
base-commit: 18f7fcd5e69a04df57b563360b88be72471d6b62
change-id: 20260205-zcull3-9065115cd238

Best regards,
-- 
Mel Henning <mhenning@darkrefraction.com>

