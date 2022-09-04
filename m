Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1D05AC6E5
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61C010E20F;
	Sun,  4 Sep 2022 21:42:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C4E10E12F;
 Sun,  4 Sep 2022 21:42:13 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id h78so5628051iof.13;
 Sun, 04 Sep 2022 14:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=uH+4PavI6tAvpP/bjllSxBrsqqx6lF8VrU02FESH7jw=;
 b=KSguwditGP/8FfWJ8QbYlUiwq8c5izqFVOSRXyhmdm05P40z31yyLERnx/4KMPZ18U
 yGQR/CcjnDmULO16vw9EZu863miip8Q4Ywm4OktFjjZNUdUqH0muQK6Hts5AQIQFY6EB
 Gnd8tvXDTP4gJcju+NDHoa6XhCzxcDglfVGpQH0OUqyXe+AwXj6MR3J0j7QIftZAI5mj
 aaAjnkm2GGxbLWKdhe9FWSpkC220hHqlwQNKss4GdfYbEiEqODGTAqXksS6qf8YV6XOx
 K+5l+OjHWI7q3CG8hiEA7+JF714yQmdURuxM/WmEm8lMmPJufYDfmHmioTV5V0ZMKzak
 OMig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=uH+4PavI6tAvpP/bjllSxBrsqqx6lF8VrU02FESH7jw=;
 b=GXqvhABD/jZoIL5+7NTzjFJdyFFcypNsYVsNr+00tzzIq898u9Z/E1gnVuz8fXQvpZ
 BmWYcwk6sNZJu0pcSoGS+dGKhfJZCDnt9tYHBuassbCdH77j5Lf2Jf064djI9p3LQR4r
 ma3OAEGqzQQc7YnnEgI6ZVzDmdRKZhH0hCD/WiKTib5euD5hJBo5c2jgucxK5JlB/puE
 JZbnGXXmIYsp/CHdXUcjGG6VSVH5ktPbBUFcGrrPmilFhpn4jTmed4es5sn7DuQBCjYI
 qH59K0Alj/SPG3/TEKLozdxSPIleoJk3O470KXHmZZU8XEoOvXRmjn+ntSZNlw5T3YwV
 dCyQ==
X-Gm-Message-State: ACgBeo35sgMykxe7liW6rwRF96jCl2f7+tvSswHjzIwHK5NpUWIbeGAx
 +vnzK9QpJMabspeGCENDWis=
X-Google-Smtp-Source: AA6agR47srkJpi3DXb58PnE0nCQCRP4+fmezLwneAZEvxkrMVJGtdvwOuDoiXOHxF1d7qDgzdSj+Lg==
X-Received: by 2002:a05:6602:140d:b0:68b:1bd1:1c54 with SMTP id
 t13-20020a056602140d00b0068b1bd11c54mr18562369iov.9.1662327731887; 
 Sun, 04 Sep 2022 14:42:11 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:42:11 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 02/57] dyndbg: fix module.dyndbg handling
Date: Sun,  4 Sep 2022 15:40:39 -0600
Message-Id: <20220904214134.408619-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904214134.408619-1-jim.cromie@gmail.com>
References: <20220904214134.408619-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk, seanpaul@chromium.org,
 joe@perches.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For CONFIG_DYNAMIC_DEBUG=N, the ddebug_dyndbg_module_param_cb()
stub-fn is too permissive:

bash-5.1# modprobe drm JUNKdyndbg
bash-5.1# modprobe drm dyndbgJUNK
[   42.933220] dyndbg param is supported only in CONFIG_DYNAMIC_DEBUG builds
[   42.937484] ACPI: bus type drm_connector registered

This caused no ill effects, because unknown parameters are either
ignored by default with an "unknown parameter" warning, or ignored
because dyndbg allows its no-effect use on non-dyndbg builds.

But since the code has an explicit feedback message, it should be
issued accurately.  Fix with strcmp for exact param-name match.

Reported-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Fixes: b48420c1d301 dynamic_debug: make dynamic-debug work for module initialization
Acked-by: Jason Baron <jbaron@akamai.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index dce631e678dd..f30b01aa9fa4 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -201,7 +201,7 @@ static inline int ddebug_remove_module(const char *mod)
 static inline int ddebug_dyndbg_module_param_cb(char *param, char *val,
 						const char *modname)
 {
-	if (strstr(param, "dyndbg")) {
+	if (!strcmp(param, "dyndbg")) {
 		/* avoid pr_warn(), which wants pr_fmt() fully defined */
 		printk(KERN_WARNING "dyndbg param is supported only in "
 			"CONFIG_DYNAMIC_DEBUG builds\n");
-- 
2.37.2

