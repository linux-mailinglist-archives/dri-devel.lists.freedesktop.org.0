Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 845E5563328
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 14:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 493CC11BDE2;
	Fri,  1 Jul 2022 12:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A312911BDDC
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 12:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656677287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=33CX6tqttkMHMf61l9Fet5nDm88rS4svreUI5dKwpqM=;
 b=LODv5rWRhSsB5oqJDj7js88kRZo4F0/P4hrjKy0BR7AptHx2SHBCiDlVZ0PW9rXgUA9wdb
 +IPq7WFX4zmQO5a91JJiz0SnEyIGLBa4YbwtkCnCMuvHinmlNd818rZfwsJe3vwdeKg3oi
 GUcjJThJXNk+i7PEU+zMKN51SnUK9M0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-q8hrdba-OmWtu0HtF79vzA-1; Fri, 01 Jul 2022 08:08:06 -0400
X-MC-Unique: q8hrdba-OmWtu0HtF79vzA-1
Received: by mail-wm1-f71.google.com with SMTP id
 o7-20020a05600c510700b003a18addaaa9so1173949wms.4
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Jul 2022 05:08:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=33CX6tqttkMHMf61l9Fet5nDm88rS4svreUI5dKwpqM=;
 b=euhzFP08MmoF8c8icccFbhtVtzy/4zSuUJXsKjHFXfrZYjUToC40MpxPssJlFHRHAW
 2hOlhrVOJFMTfxiKXnZb+fb6t5gTliMRHmxHkUEFoRbM9DJAOpJn5ujeNvoKwcxO7sOj
 lEdT1soxo1bqCcjFaYAcQxmM/LpHK2y9cDcfs8OrG+R2FhPE+nCNytkvd5eyBdw8Igxx
 kc4hzVTFHv2CkCOfEvYcL2i6hZcWH1ea3ampX85ea0ftQgH1vBkISXQwb61y/VVZYmJt
 HzeFqKpRos3D0PI0AO23XgX1PNqO/gEBpkOR/+RUXUBZda0A2Emr+O6T7ZqDmArwdlRl
 GUjQ==
X-Gm-Message-State: AJIora8tAfiCi/ZFe7+OhQFVqbyERRlLtfrmPoNxS20cuh+sVFbjCFIO
 lxKPnk4f65OOJS991/h/yktSLCfD9fAhUvqZ7sLobEQZR8Ph+NR+TuCQ4+i+PkKxoaCev/MvICA
 fEVHe7PS1lg0NwpjpTU3tmE+RUilf
X-Received: by 2002:a05:600c:4fd4:b0:3a0:334e:241e with SMTP id
 o20-20020a05600c4fd400b003a0334e241emr18258846wmq.73.1656677283923; 
 Fri, 01 Jul 2022 05:08:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uYAikOSSOPPoi0aaWV3LrSgiuaCowzzz4IMHySnpiKFRNdnx51jOHlhQgu8NYG8h3fw/z43g==
X-Received: by 2002:a05:600c:4fd4:b0:3a0:334e:241e with SMTP id
 o20-20020a05600c4fd400b003a0334e241emr18258817wmq.73.1656677283681; 
 Fri, 01 Jul 2022 05:08:03 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 v4-20020a7bcb44000000b0039746638d6esm9813160wmj.33.2022.07.01.05.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 05:08:03 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm: Prevent drm_copy_field() to attempt copying a NULL
 pointer
Date: Fri,  1 Jul 2022 14:07:55 +0200
Message-Id: <20220701120755.2135100-3-javierm@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220701120755.2135100-1-javierm@redhat.com>
References: <20220701120755.2135100-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_copy_field() helper is used to copy some struct drm_driver fields
to userspace through the DRM_IOCTL_VERSION ioctl. But it could be possible
that the driver didn't set some of the fields and are instead set to NULL.

If that is the case, the drm_copy_field() attempts to copy a NULL pointer:

[ +10.395966] Unable to handle kernel access to user memory outside uaccess routines at virtual address 0000000000000000
[  +0.010955] Mem abort info:
[  +0.002835]   ESR = 0x0000000096000004
[  +0.003872]   EC = 0x25: DABT (current EL), IL = 32 bits
[  +0.005395]   SET = 0, FnV = 0
[  +0.003113]   EA = 0, S1PTW = 0
[  +0.003182]   FSC = 0x04: level 0 translation fault
[  +0.004964] Data abort info:
[  +0.002919]   ISV = 0, ISS = 0x00000004
[  +0.003886]   CM = 0, WnR = 0
[  +0.003040] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000115dad000
[  +0.006536] [0000000000000000] pgd=0000000000000000, p4d=0000000000000000
[  +0.006925] Internal error: Oops: 96000004 [#1] SMP
...
[  +0.011113] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  +0.007061] pc : __pi_strlen+0x14/0x150
[  +0.003895] lr : drm_copy_field+0x30/0x1a4
[  +0.004156] sp : ffff8000094b3a50
[  +0.003355] x29: ffff8000094b3a50 x28: ffff8000094b3b70 x27: 0000000000000040
[  +0.007242] x26: ffff443743c2ba00 x25: 0000000000000000 x24: 0000000000000040
[  +0.007243] x23: ffff443743c2ba00 x22: ffff8000094b3b70 x21: 0000000000000000
[  +0.007241] x20: 0000000000000000 x19: ffff8000094b3b90 x18: 0000000000000000
[  +0.007241] x17: 0000000000000000 x16: 0000000000000000 x15: 0000aaab14b9af40
[  +0.007241] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
[  +0.007239] x11: 0000000000000000 x10: 0000000000000000 x9 : ffffa524ad67d4d8
[  +0.007242] x8 : 0101010101010101 x7 : 7f7f7f7f7f7f7f7f x6 : 6c6e6263606e7141
[  +0.007239] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
[  +0.007241] x2 : 0000000000000000 x1 : ffff8000094b3b90 x0 : 0000000000000000
[  +0.007240] Call trace:
[  +0.002475]  __pi_strlen+0x14/0x150
[  +0.003537]  drm_version+0x84/0xac
[  +0.003448]  drm_ioctl_kernel+0xa8/0x16c
[  +0.003975]  drm_ioctl+0x270/0x580
[  +0.003448]  __arm64_sys_ioctl+0xb8/0xfc
[  +0.003978]  invoke_syscall+0x78/0x100
[  +0.003799]  el0_svc_common.constprop.0+0x4c/0xf4
[  +0.004767]  do_el0_svc+0x38/0x4c
[  +0.003357]  el0_svc+0x34/0x100
[  +0.003185]  el0t_64_sync_handler+0x11c/0x150
[  +0.004418]  el0t_64_sync+0x190/0x194
[  +0.003716] Code: 92402c04 b200c3e8 f13fc09f 5400088c (a9400c02)
[  +0.006180] ---[ end trace 0000000000000000 ]---

Reported-by: Peter Robinson <pbrobinson@gmail.com>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/drm_ioctl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index e1b9a03e619c..dacaddc59c82 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -474,6 +474,10 @@ static int drm_copy_field(char __user *buf, size_t *buf_len, const char *value)
 {
 	size_t len;
 
+	/* don't attempt to copy a NULL pointer */
+	if (WARN_ONCE(!value, "BUG: the value to copy was not set!"))
+		return -EINVAL;
+
 	/* don't overflow userbuf */
 	len = strlen(value);
 	if (len > *buf_len)
-- 
2.36.1

