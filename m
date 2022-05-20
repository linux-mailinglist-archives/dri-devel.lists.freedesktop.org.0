Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CED652E885
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 11:16:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 067C610EED1;
	Fri, 20 May 2022 09:16:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4EA110EED1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 09:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653038171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=37VtCkmeYBj19kPbM9wIPiRfK6JVm/8EYkASIsdU9tQ=;
 b=ZCKPAqHMHX1A3GBfKb21thbikI44gMZoZykaDsg0OGHe/CtOb3mx2Fe7EMmdiyq0zHVa3W
 7q4lhM7+gNsDwVCZn3na+BHDzzmjKmUmN3GsUx7dqnsRqV7y4bzVcSntvrgyeKDy6N8bFk
 VUYFgq7oZLuBvrkOGikIYRVRfHIDs4A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-574-d85x04qmPpW198U6G-JFGw-1; Fri, 20 May 2022 05:16:09 -0400
X-MC-Unique: d85x04qmPpW198U6G-JFGw-1
Received: by mail-wm1-f70.google.com with SMTP id
 e9-20020a05600c4e4900b00394779649b1so5837764wmq.3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 02:16:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=37VtCkmeYBj19kPbM9wIPiRfK6JVm/8EYkASIsdU9tQ=;
 b=4jFBHMIw8pbvLJdqbSiiGeDy6JorHDmiqNH87lvgUJ8ByFm7YdnD3q012VVJWL509v
 0kWaOm0m13WA8NCIsz5lOT82ge/lJxc3ZM0AcGlc1xQl05/R7j8DM5x3hOGOFywEIxHh
 cn54HZoHFycBqLbSrOan9I+sxLzb3MUom0ep65lCJ73Qss3cSxj0VdXZg2Rv7+Ox2Km4
 ar6fZMYtFpUo2IqbEICaIjcq24MH9Kf/uhSFdN2NM/07uYXqo3ttX1HhtigRh7Xj23m8
 gKaIi6qTiu/vW6lpsQ6Yuj7g8glwSwlWGFr8K0SBFpw2QhEUo7rltLJWIxC0v7GHOV9X
 aNkA==
X-Gm-Message-State: AOAM531zZGMOz6KjDMSyGanOeiC00keC050Pnf7alEpWfpJ1ZJAor/5G
 4b1o9tI4GE9QpOkUvKZ2pkB9Reg4kFXMr/yEw0+1rgIDqiPwzpXMP9crritdAPLzGFP3M8VMId1
 3lKwIEOFnNy4CfOtd5/c44Pe6ySy2
X-Received: by 2002:a1c:4443:0:b0:397:38a7:30 with SMTP id
 r64-20020a1c4443000000b0039738a70030mr1918608wma.14.1653038168213; 
 Fri, 20 May 2022 02:16:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRnV/FLXilJCVFaq7XzkxHGACQ2befF60ot270hFjpctpC3oeb6FZd2yxb9EjKoqwk5Wqehg==
X-Received: by 2002:a1c:4443:0:b0:397:38a7:30 with SMTP id
 r64-20020a1c4443000000b0039738a70030mr1918587wma.14.1653038167957; 
 Fri, 20 May 2022 02:16:07 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 ay28-20020a05600c1e1c00b003973c4bb19bsm495397wmb.16.2022.05.20.02.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 02:16:07 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/st7735r: Fix module autoloading for Okaya RH128128T
Date: Fri, 20 May 2022 11:16:02 +0200
Message-Id: <20220520091602.179078-1-javierm@redhat.com>
X-Mailer: git-send-email 2.36.1
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
Cc: David Lechner <david@lechnology.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The SPI core always reports a "MODALIAS=spi:<foo>", even if the device was
registered via OF. This means that the st7735r.ko module won't autoload if
a DT has a node with a compatible "okaya,rh128128t" string.

In that case, kmod expects a "MODALIAS=of:N*T*Cokaya,rh128128t" uevent but
instead will get a "MODALIAS=spi:rh128128t", which is not present in the
list of aliases:

  $ modinfo drivers/gpu/drm/tiny/st7735r.ko | grep alias
  alias:          of:N*T*Cokaya,rh128128tC*
  alias:          of:N*T*Cokaya,rh128128t
  alias:          of:N*T*Cjianda,jd-t18003-t01C*
  alias:          of:N*T*Cjianda,jd-t18003-t01
  alias:          spi:jd-t18003-t01

To workaround this issue, add in the SPI table an entry for that device.

Fixes: d1d511d516f7 ("drm: tiny: st7735r: Add support for Okaya RH128128T")
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/tiny/st7735r.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tiny/st7735r.c b/drivers/gpu/drm/tiny/st7735r.c
index 29d618093e94..e0f02d367d88 100644
--- a/drivers/gpu/drm/tiny/st7735r.c
+++ b/drivers/gpu/drm/tiny/st7735r.c
@@ -174,6 +174,7 @@ MODULE_DEVICE_TABLE(of, st7735r_of_match);
 
 static const struct spi_device_id st7735r_id[] = {
 	{ "jd-t18003-t01", (uintptr_t)&jd_t18003_t01_cfg },
+	{ "rh128128t", (uintptr_t)&rh128128t_cfg },
 	{ },
 };
 MODULE_DEVICE_TABLE(spi, st7735r_id);
-- 
2.36.1

