Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eA/jMIiGiWkn+gQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 08:02:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7836410C4B6
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 08:02:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB29810E2FD;
	Mon,  9 Feb 2026 07:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aGaZWcyf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F8A10E2FD
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 07:02:28 +0000 (UTC)
Received: by mail-dl1-f67.google.com with SMTP id
 a92af1059eb24-1233c155a42so4873898c88.1
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Feb 2026 23:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770620547; x=1771225347; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=XaEjjnb5CXUgt55Cq6lrOTPEGYspEf0Y+Ywm9+lE9sY=;
 b=aGaZWcyfqjPGVH/bKUmT341uaI88bff6c1c1Uz06AdJxNX5RW5rbafFKeVrxjyOm4o
 Pwoyl6qpA71TfutKjhJm6nUD5BUgJcVuoe5Ay4QQ+EDq3auB99rC5y7kfpE0qfVWw9GT
 Y5ngmqn1Gx8fx13P/9kfnbTs27+9EiM/YI4kL8yulNxtemTinWI2Pg7391nrDqLi/jcD
 jy4yHmw1A0z/HRg5H9rlkpOWY/0XXiS5k9OqNjY9JuCvecOM/NnYJpCV4La24eyrVFHO
 CR8Ha3MUzszbeN0FVp1sfgzmuQ8kG7xcCypOdfuA7fit12aQvXdBYMYlpz4ryH7i0aZR
 quOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770620547; x=1771225347;
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XaEjjnb5CXUgt55Cq6lrOTPEGYspEf0Y+Ywm9+lE9sY=;
 b=Wev7xmoq1734NqMSK6SRTwM5VNk1LSGu2i3tXlIyYP77SJdhuAtAulDAN+++pt64JS
 rcCSbOPtPD5fGhQ+wpLHg93k6Oa7Z5iNG3578erBLdL7w13igUKFsp27cy3ZQfx2OY65
 Pr4kjsLQd2dQLguy2FTeENRWpwWsahAFH+mLH7MoNIqEbCQvfzloW89qCXePd/QrE5my
 nrirrG/sAkwBKislOaxVfSOPaPCPlFGRtVQxYJBrwbzILtLabo51yXogkJ+OYMedx0tq
 pAnJZ14KIVsFjV6951lNUHfdvHpXfy774fqwvkFjKoRq5MdFMCQfslzANFSHwhomTG2i
 tG9A==
X-Gm-Message-State: AOJu0YxARFkVuzVX2wt/HkrH0IIMRIu8fA/z5yrFddxvY/0V74hQ1Ihi
 9hbugSACHeVpx1x26YRrGi55l60OxCUeHt7oAF/3jSvMJr+FqCSD8rF+
X-Gm-Gg: AZuq6aICR/3PsdxEHJp/oqHzdmSV4vCBjD6Wndm4LBACYIVJpWb8lbcpT/2PyFgIxuG
 ZrYelh/U7zJNYQD52uVeWBPoZPc9AV1pb6e4cklWViwB9xmIgUaTNaJk/9S+e3DjhV2cR83/R46
 MLJ47BsWiEN2gvhOMW9RQ0bE8kvPfjtR+YptoauCcRyi2YjiArG8CEfLTbnJWY0NyWnBPJdAlRf
 LGhlw2BVXPO3xoBX+DfREGaEVO04cSR9eSDzGtjfGHTvSfLSOZssA+XpeWLpDhplT4VNxHKrdYo
 K4uXMHU4TecmE8zKu7lVUykZNZBNS/TM4+XhWSvJXfEtQw5z7v+XMYOTt/Nx3NujxJZyuhOpdxz
 f5F7/wU5Cw9NJ5/JIGoz4pWqhMSIBS4/+zzaqTpB7/Eal/oqWBRFf5wec/HVhEuCtSblzM0eGW1
 nseFPpc5C0qQFVNkHoGqvVPdwDTIqKfw==
X-Received: by 2002:a05:7022:6293:b0:11a:335d:80d2 with SMTP id
 a92af1059eb24-1270405aa57mr5370472c88.35.1770620547355; 
 Sun, 08 Feb 2026 23:02:27 -0800 (PST)
Received: from mhkubun.search.charter.net ([66.91.163.55])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-12706faa047sm6966305c88.14.2026.02.08.23.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Feb 2026 23:02:27 -0800 (PST)
From: mhkelley58@gmail.com
X-Google-Original-From: mhklinux@outlook.com
To: drawat.floss@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, kys@microsoft.com, haiyangz@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, longli@microsoft.com,
 ryasuoka@redhat.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hyperv@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH 2/2] drm/hyperv: During panic do VMBus unload after frame
 buffer is flushed
Date: Sun,  8 Feb 2026 23:02:01 -0800
Message-Id: <20260209070201.1492-2-mhklinux@outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260209070201.1492-1-mhklinux@outlook.com>
References: <20260209070201.1492-1-mhklinux@outlook.com>
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
Reply-To: mhklinux@outlook.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.69 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM_DOM(3.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_REPLYTO(0.00)[outlook.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:drawat.floss@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ryasuoka@redhat.com,m:jfalempe@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:stable@vger.kernel.org,m:drawatfloss@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,microsoft.com,redhat.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[mhkelley58@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.847];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhkelley58@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[mhklinux@outlook.com];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:replyto,outlook.com:email,outlook.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7836410C4B6
X-Rspamd-Action: no action

From: Michael Kelley <mhklinux@outlook.com>

In a VM, Linux panic information (reason for the panic, stack trace,
etc.) may be written to a serial console and/or a virtual frame buffer
for a graphics console. The latter may need to be flushed back to the
host hypervisor for display.

The current Hyper-V DRM driver for the frame buffer does the flushing
*after* the VMBus connection has been unloaded, such that panic messages
are not displayed on the graphics console. A user with a Hyper-V graphics
console is left with just a hung empty screen after a panic. The enhanced
control that DRM provides over the panic display in the graphics console
is similarly non-functional.

Commit 3671f3777758 ("drm/hyperv: Add support for drm_panic") added
the Hyper-V DRM driver support to flush the virtual frame buffer. It
provided necessary functionality but did not handle the sequencing
problem with VMBus unload.

Fix the full problem by using VMBus functions to suppress the VMBus
unload that is normally done by the VMBus driver in the panic path. Then
after the frame buffer has been flushed, do the VMBus unload so that a
kdump kernel can start cleanly. As expected, CONFIG_DRM_PANIC must be
selected for these changes to have effect. As a side benefit, the
enhanced features of the DRM panic path are also functional.

Fixes: 3671f3777758 ("drm/hyperv: Add support for drm_panic")
Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c     |  4 ++++
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c | 15 ++++++++-------
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
index 06b5d96e6eaf..79e51643be67 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
@@ -150,6 +150,9 @@ static int hyperv_vmbus_probe(struct hv_device *hdev,
 		goto err_free_mmio;
 	}
 
+	/* If DRM panic path is stubbed out VMBus code must do the unload */
+	if (IS_ENABLED(CONFIG_DRM_PANIC) && IS_ENABLED(CONFIG_PRINTK))
+		vmbus_set_skip_unload(true);
 	drm_client_setup(dev, NULL);
 
 	return 0;
@@ -169,6 +172,7 @@ static void hyperv_vmbus_remove(struct hv_device *hdev)
 	struct drm_device *dev = hv_get_drvdata(hdev);
 	struct hyperv_drm_device *hv = to_hv(dev);
 
+	vmbus_set_skip_unload(false);
 	drm_dev_unplug(dev);
 	drm_atomic_helper_shutdown(dev);
 	vmbus_close(hdev->channel);
diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
index 7978f8c8108c..d48ca6c23b7c 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
@@ -212,15 +212,16 @@ static void hyperv_plane_panic_flush(struct drm_plane *plane)
 	struct hyperv_drm_device *hv = to_hv(plane->dev);
 	struct drm_rect rect;
 
-	if (!plane->state || !plane->state->fb)
-		return;
+	if (plane->state && plane->state->fb) {
+		rect.x1 = 0;
+		rect.y1 = 0;
+		rect.x2 = plane->state->fb->width;
+		rect.y2 = plane->state->fb->height;
 
-	rect.x1 = 0;
-	rect.y1 = 0;
-	rect.x2 = plane->state->fb->width;
-	rect.y2 = plane->state->fb->height;
+		hyperv_update_dirt(hv->hdev, &rect);
+	}
 
-	hyperv_update_dirt(hv->hdev, &rect);
+	vmbus_initiate_unload(true);
 }
 
 static const struct drm_plane_helper_funcs hyperv_plane_helper_funcs = {
-- 
2.25.1

