Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14922702443
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 08:16:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C639D10E126;
	Mon, 15 May 2023 06:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D2E10E126
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 06:16:02 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3077d134028so7242338f8f.3
 for <dri-devel@lists.freedesktop.org>; Sun, 14 May 2023 23:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684131360; x=1686723360;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5BPkIUsnqT9GahOW3fInFew2Yz3mR1xWSCLsfNLCaFA=;
 b=UH1zp+P7ZSiPjsEYWkZJ/Jnlt623yqm85fGFw/WDL+kaGg3ZQ4SeRrfN8xytTA+pZa
 A9x5gz82gjNrFdwV1Dnvf/qFGHUaqnx7V5CNlXGP//OE4RzA9eOxqcx2ndT7VH4+Rp/Z
 i4l7TFY0wbiq32IC6iJ7VgYAdrQGM3EsjQc9xvx+K5lkAQlLgUsB4xmVm1BRNmG1UvnC
 y3ieabclwPGmQu0ZJGazMWFbXachIVuz2ykpp1zH8xC+Mp87/Oojyrt5ZLA+S75vv0Dp
 4HjJR9+/1UM6rkkfJE0NT9LIXOxxfXSMgqAQnt1UGp+NihzGrV7pwOx83SJGJfwtNWbY
 uaQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684131360; x=1686723360;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5BPkIUsnqT9GahOW3fInFew2Yz3mR1xWSCLsfNLCaFA=;
 b=DHDHi5epQrlHGMlHSnIrzyPMXsEPB2hEd8XxmF2koF4KhP5qGre7gng9kRrteG8QW3
 qbPzoRsazYmXx1DhZDblGbufUz9xVB+3hqBtU03JWPStsfxCb+I58rotMNCZMlhMGMlR
 66J2iIKBvWtwNZN/gxt8ihYz5c3ZRjHXWaCg0ylc6f3ZvSg5xX1w7T5TOOQ4F6vG59YU
 IPJc7n8YBN5l/0sdH6KO74aH25yiRdzx7YaSIH6r0vQkrCTCqj/Bwy/wZRGe+vFPi/hV
 +6w4K8MTWKUuLCH/AEnVetBegvYhHw+yBPO3NWOSZsEVBYIIuDyjZHG18VrWFIHc3yHZ
 b1Pw==
X-Gm-Message-State: AC+VfDzXZkEjMrukZSO+GDNGo0xtf3bSlu0lYX3OPDYbItysabQczbEF
 2zmkb3/KPNZNUK/NgPmOj7Ntu7cgQKP3435+NXA=
X-Google-Smtp-Source: ACHHUZ5+pxIK/LF+0uvyAPhaqxSLcdZqK44kbIFKd6QpHLEDKtNXFa6jeDXr9vyybt5k5Y2w4RUfTg==
X-Received: by 2002:a5d:6981:0:b0:306:43bc:806f with SMTP id
 g1-20020a5d6981000000b0030643bc806fmr22103823wru.24.1684131360135; 
 Sun, 14 May 2023 23:16:00 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 n19-20020a1c7213000000b003f4268f51f5sm21570739wmc.0.2023.05.14.23.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 May 2023 23:15:57 -0700 (PDT)
Date: Mon, 15 May 2023 09:15:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: maxime@cerno.tech
Subject: [bug report] drm: Use the state pointer directly in planes
 atomic_check
Message-ID: <d6bcdcb3-8b60-4c72-8102-55ec6a0ea45c@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Maxime Ripard,

This is a semi-automatic email about new static checker warnings.

The patch dec92020671c: "drm: Use the state pointer directly in 
planes atomic_check" from Feb 19, 2021, leads to the following Smatch 
complaint:

    drivers/gpu/drm/armada/armada_plane.c:97 armada_drm_plane_atomic_check()
    warn: variable dereferenced before check 'state' (see line 84)

drivers/gpu/drm/armada/armada_plane.c
    81  int armada_drm_plane_atomic_check(struct drm_plane *plane,
    82          struct drm_atomic_state *state)
    83  {
    84          struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
                                                                                         ^^^^^
state is deferenced here.

    85                                                                                   plane);
    86          struct armada_plane_state *st = to_armada_plane_state(new_plane_state);
    87          struct drm_crtc *crtc = new_plane_state->crtc;
    88          struct drm_crtc_state *crtc_state;
    89          bool interlace;
    90          int ret;
    91  
    92          if (!new_plane_state->fb || WARN_ON(!new_plane_state->crtc)) {
    93                  new_plane_state->visible = false;
    94                  return 0;
    95          }
    96  
    97          if (state)

This used to check "if (new_plane_state->state)".  If state is NULL then
we will already have crashed.

    98                  crtc_state = drm_atomic_get_existing_crtc_state(state,
    99                                                                  crtc);
   100          else
   101                  crtc_state = crtc->state;
   102  
   103          ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
   104                                                    0,
   105                                                    INT_MAX, true, false);

regards,
dan carpenter
