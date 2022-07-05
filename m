Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 587325669A2
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 13:34:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A67A10EC08;
	Tue,  5 Jul 2022 11:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 171B310E021
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 10:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657015360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PXp75we4g7tfDLKjBv7MZGhsHN2tTZVGENMsoYt5xd8=;
 b=d37FDTbue/zG8qUaBocnybdF20Tn9w/LHgQDDpYjKBfkFOuCSEYowyyWLlhzoEs8LQuSlp
 1SnfVsrNCErkpfIeoUhNycF4xTtoaiVArdacwASasy6GzSPnd2/zlKQUSdL5YclmcZhPDp
 8xT1kW6ORqBKGfhmLXSPHs75jC+9PN0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-310-vJcLB_HpOYWYK9pMI16LoA-1; Tue, 05 Jul 2022 06:02:39 -0400
X-MC-Unique: vJcLB_HpOYWYK9pMI16LoA-1
Received: by mail-wm1-f71.google.com with SMTP id
 n35-20020a05600c3ba300b003a02d7bd5caso6562437wms.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jul 2022 03:02:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PXp75we4g7tfDLKjBv7MZGhsHN2tTZVGENMsoYt5xd8=;
 b=O1AYUr5eZBeMy/BEOcLhgCKIs+qbkoPwTmlvfdNpa4ZF4git98vtboBJf+K3jV1f9a
 Lz8t4sRFfbFpMC+iAioadcJnOwFMXwOykbMOLvN664Iuiy219giOEEec0ihZsyjxmRU6
 XeqkFDOgVGntYX6vPm+Kal78rqN3xxWW8eGttZjJSY62ABXuDWDzmdEn8CUQ6jjTYFWW
 8Qp1ZAGGGQc5bpyWqpulc55ln5O9ZWLdkbBjweKSqHLRYTk4CLQutk+75yA2Vn0yEL2V
 gP5r+djpnuMhgL0p83r85X6zFpSBx77fmHYtfzW0cqEXeCxWZNcVVf8DBbRY/4EiGVie
 /Ngw==
X-Gm-Message-State: AJIora90JTa6jM7xucIEjMpPbG04gjkdzXR/pIL2Klq+EpxvCS2fVSAb
 BynI4VDs7OCsIVAsYxCPox5wQdJ9+ir4Fsh4B0/ca+7wu3Vx+1KRaCVF4yaX0n0Vu2WSQwHg5Nb
 fUcLhewfzvDOVUYWP9ytXQG5tTYcN
X-Received: by 2002:adf:f84a:0:b0:21d:6e52:7957 with SMTP id
 d10-20020adff84a000000b0021d6e527957mr5815162wrq.252.1657015357805; 
 Tue, 05 Jul 2022 03:02:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vZWSLJ9APoFLLcARii/p9DrogtNdYkpeeiX/0eZqF0i0sAWYJXINSPuRKOHdGqmknYrdkgDA==
X-Received: by 2002:adf:f84a:0:b0:21d:6e52:7957 with SMTP id
 d10-20020adff84a000000b0021d6e527957mr5815138wrq.252.1657015357593; 
 Tue, 05 Jul 2022 03:02:37 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f7-20020a0560001b0700b0021d68e1fd42sm6255192wrz.89.2022.07.05.03.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 03:02:37 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] drm: Prevent drm_copy_field() to attempt copying a
 NULL pointer
Date: Tue,  5 Jul 2022 12:02:14 +0200
Message-Id: <20220705100215.572498-3-javierm@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220705100215.572498-1-javierm@redhat.com>
References: <20220705100215.572498-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are some struct drm_driver fields that are required by drivers since
drm_copy_field() attempts to copy them to user-space via DRM_IOCTL_VERSION.

But it can be possible that a driver has a bug and did not set some of the
fields, which leads to drm_copy_field() attempting to copy a NULL pointer:

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

Changes in v2:
- Just warn if a value isn't set and report it as a string of length 0.
  (Thomas Zimmermann).

 drivers/gpu/drm/drm_ioctl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index e1b9a03e619c..ca2a6e6101dc 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -474,6 +474,12 @@ static int drm_copy_field(char __user *buf, size_t *buf_len, const char *value)
 {
 	size_t len;
 
+	/* don't attempt to copy a NULL pointer */
+	if (WARN_ONCE(!value, "BUG: the value to copy was not set!")) {
+		*buf_len = 0;
+		return 0;
+	}
+
 	/* don't overflow userbuf */
 	len = strlen(value);
 	if (len > *buf_len)
-- 
2.36.1

