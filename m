Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B18467A806B
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 14:37:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11BF210E4A4;
	Wed, 20 Sep 2023 12:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF0710E4A0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 12:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695213421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CkUiTYo02brbH9rdldgLT7YiM95DCTjC6m+zHLs+f1Y=;
 b=amz9ztIh2WqHpki1KC6uHy1zXJICfGQXzAcYtXaOGfsQ53TsLMaIIVqvhYhkteyhuo4xI6
 ifibXytfMIFe7uzk1/l4yUWaB+fGA9Mb5OgL5NGm2g4sLOFs+2fnfoEMY6BK0numYkYExK
 e+tuj6x+yXS8ocL84bgtMPWWlVESyhU=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-60-lgN8HLBkPUq69FKtUhSnAQ-1; Wed, 20 Sep 2023 08:37:00 -0400
X-MC-Unique: lgN8HLBkPUq69FKtUhSnAQ-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2b6fdb8d0acso15768631fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 05:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695213418; x=1695818218;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CkUiTYo02brbH9rdldgLT7YiM95DCTjC6m+zHLs+f1Y=;
 b=Cz//LIqbkdKqHKjbOI2m/NQsARPjv/ojUwJCjQmhBEnuASoYiviq63S5i4yPR9zs57
 uHTX/yV/Y6uRCXkdLtmuJJpF9rw96VVmQ1iWjF8EBDuhJa0d98feOLCcvZfdxeXswE4/
 J/W5hNafxadDr47SlcW6p5QgRv63wN+PRcrsa8IOVRt9cdsluHTK09227OcWR6FrCwiD
 43zndTCt/nQgZ1y5u67wt0hv3XMKQ7WUNfx3ZffT8SixwPRnJ0fVehUxrVvdP/jdS4Ub
 9FFXXNZOQ6hWWSHQXr6PjYqylrLG49AzINndDya+kBYiV8Likw9pzAFsLFxRKp5gNjw7
 tylA==
X-Gm-Message-State: AOJu0YzOz2M31sMPFz4fs73ukbUGjmmm95ZN6AJFWqE0pl7FegvO1rmw
 UNwixeLN4ntuTy/IxyNGe0eASaF4BW1wKcEn8c76JMgoAcfoa+9rt0rszPso+hJ/fopm/TKPIRB
 EvCrFnpn42v/sj2njqJfeuGo4MIUc
X-Received: by 2002:a05:651c:1693:b0:2c0:196c:e38f with SMTP id
 bd19-20020a05651c169300b002c0196ce38fmr1921140ljb.1.1695213418530; 
 Wed, 20 Sep 2023 05:36:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGtYN79a4/Uyeq8meM3+9mCAQ2LGvBXOKnKduArpSa1zP3qsVYH9Wh1PFHrd4S88GImDITZQ==
X-Received: by 2002:a05:651c:1693:b0:2c0:196c:e38f with SMTP id
 bd19-20020a05651c169300b002c0196ce38fmr1921120ljb.1.1695213418185; 
 Wed, 20 Sep 2023 05:36:58 -0700 (PDT)
Received: from fedorinator.. ([2a01:599:906:7772:a505:d891:dcff:9565])
 by smtp.gmail.com with ESMTPSA id
 op15-20020a170906bcef00b009ae4ead6c01sm660073ejb.163.2023.09.20.05.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 05:36:55 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Kees Cook <keescook@chromium.org>, Andy Shevchenko <andy@kernel.org>,
 Eric Biederman <ebiederm@xmission.com>,
 Christian Brauner <brauner@kernel.org>, David Disseldorp <ddiss@suse.de>,
 Luis Chamberlain <mcgrof@kernel.org>, Siddh Raman Pant <code@siddh.me>,
 Nick Alcock <nick.alcock@oracle.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Zack Rusin <zackr@vmware.com>
Subject: [PATCH v3 3/5] kernel: watch_queue: copy user-array safely
Date: Wed, 20 Sep 2023 14:36:11 +0200
Message-ID: <20230920123612.16914-5-pstanner@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920123612.16914-2-pstanner@redhat.com>
References: <20230920123612.16914-2-pstanner@redhat.com>
MIME-Version: 1.0
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
Cc: Philipp Stanner <pstanner@redhat.com>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 linux-hardening@vger.kernel.org, David Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, there is no overflow-check with memdup_user().

Use the new function memdup_array_user() instead of memdup_user() for
duplicating the user-space array safely.

Suggested-by: David Airlie <airlied@redhat.com>
Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Zack Rusin <zackr@vmware.com>
---
 kernel/watch_queue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/watch_queue.c b/kernel/watch_queue.c
index d0b6b390ee42..778b4056700f 100644
--- a/kernel/watch_queue.c
+++ b/kernel/watch_queue.c
@@ -331,7 +331,7 @@ long watch_queue_set_filter(struct pipe_inode_info *pipe,
 	    filter.__reserved != 0)
 		return -EINVAL;
 
-	tf = memdup_user(_filter->filters, filter.nr_filters * sizeof(*tf));
+	tf = memdup_array_user(_filter->filters, filter.nr_filters, sizeof(*tf));
 	if (IS_ERR(tf))
 		return PTR_ERR(tf);
 
-- 
2.41.0

