Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 482FC8A15CC
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 15:39:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B2B10EBB4;
	Thu, 11 Apr 2024 13:39:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="C2LACj8R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F7810EB81
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 13:39:11 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a44ad785a44so911583166b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 06:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712842750; x=1713447550; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UqKfpyV0h27mK8HCPiskpiWVAfisxwktnFXalKSo1+0=;
 b=C2LACj8R92CQ/yPU/T7JdqWp4clhM60MM4QkEp0fGp7Scs8ZuBF4MCtTPZqrLkmb+D
 1B0KXKCBbcuQ2wu/oNWr0Rqtcw2qDQSThzEbklF8ERXXMgbGVcj7eaTNTocJrONdeNSZ
 3AK7NAKouRUcTFPhdfl9in0FDhw8q8qC3LVA4hLx4EnYyCZ8/dGBqmevxuirdiIctExg
 uyaE1esjX6yaxKQOuKgro7C7EKxZeSFeCKViHtc4i3yp3QHNPSgl7UMJ3P1jaUyhy6vV
 atYmhe4NWGbnWITKQcUS0YHF72M6u+JSPfW/t0OdNLaY9voEmCy6Do6Fl8pZVtpoAH9G
 CrlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712842750; x=1713447550;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UqKfpyV0h27mK8HCPiskpiWVAfisxwktnFXalKSo1+0=;
 b=DjO9yY8o0Afc/ED4lGhg0jeKN3eovdR35TSXsnpsddVRcLruf1RYU911KZAI6G1ZI/
 iow4ID6cvJmxlEwhcR64Kb1/qNFi9UlihsoWZ3gc8PrUnmbqtjiZJ/HzERSXkV5qvx0/
 h7fn1BrDQfW1eJOc4K3EKjn6+kCYEE0xiKyLLfcl8FlDxL8mPI7OzuQGvYUki+PslFGb
 KYpRx2HpS/iIxRzNgTmtgRg83477d9uuJBlTB4arYDg6VBPhntpwHPR9MIfdmcwvPt1H
 fRjDBTQOEIIwoBZohTt10EHDcl/s6iQGHHsteClAsRlKDzsAOznzHaykT5b68sqH1Lmy
 rw4A==
X-Gm-Message-State: AOJu0Yz4zqSHHVr0sZApwL/URxlVNkkkyPlz/cMF9Tk2an7km/RPSfQ9
 7f+POVPXtA1hOrENBbft7c5uMcdUbvHWpJ3Q6/NzavEL/H7d+2ihGsE7p8Ff3ds=
X-Google-Smtp-Source: AGHT+IHTYOVlbqU7zBvcrzwrc1+W9n1kRmsUn35VAbD/H2pfzaKuCmm1PtJHSnkDJ90HH/bwWTdu5w==
X-Received: by 2002:a17:906:5acc:b0:a51:ad60:ea32 with SMTP id
 x12-20020a1709065acc00b00a51ad60ea32mr3080766ejs.27.1712842749864; 
 Thu, 11 Apr 2024 06:39:09 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 hd13-20020a170907968d00b00a5217964308sm757508ejc.218.2024.04.11.06.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Apr 2024 06:39:09 -0700 (PDT)
Date: Thu, 11 Apr 2024 16:39:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: amishin@t-argos.ru
Cc: dri-devel@lists.freedesktop.org
Subject: [bug report] drm: bridge: cdns-mhdp8546: Fix possible null pointer
 dereference
Message-ID: <a6e7e2f3-c173-4c33-ba0b-b068140131a9@moroto.mountain>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Aleksandr Mishin,

Commit 935a92a1c400 ("drm: bridge: cdns-mhdp8546: Fix possible null
pointer dereference") from Apr 8, 2024 (linux-next), leads to the
following Smatch static checker warning:

	drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:2074 cdns_mhdp_atomic_enable()
	warn: inconsistent returns '&mhdp->link_mutex'.

drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
    1986 static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
    1987                                     struct drm_bridge_state *bridge_state)
    1988 {
    1989         struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
    1990         struct drm_atomic_state *state = bridge_state->base.state;
    1991         struct cdns_mhdp_bridge_state *mhdp_state;
    1992         struct drm_crtc_state *crtc_state;
    1993         struct drm_connector *connector;
    1994         struct drm_connector_state *conn_state;
    1995         struct drm_bridge_state *new_state;
    1996         const struct drm_display_mode *mode;
    1997         u32 resp;
    1998         int ret;
    1999 
    2000         dev_dbg(mhdp->dev, "bridge enable\n");
    2001 
    2002         mutex_lock(&mhdp->link_mutex);
                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Holding a lock

    2003 
    2004         if (mhdp->plugged && !mhdp->link_up) {
    2005                 ret = cdns_mhdp_link_up(mhdp);
    2006                 if (ret < 0)
    2007                         goto out;
    2008         }
    2009 
    2010         if (mhdp->info && mhdp->info->ops && mhdp->info->ops->enable)
    2011                 mhdp->info->ops->enable(mhdp);
    2012 
    2013         /* Enable VIF clock for stream 0 */
    2014         ret = cdns_mhdp_reg_read(mhdp, CDNS_DPTX_CAR, &resp);
    2015         if (ret < 0) {
    2016                 dev_err(mhdp->dev, "Failed to read CDNS_DPTX_CAR %d\n", ret);
    2017                 goto out;
    2018         }
    2019 
    2020         cdns_mhdp_reg_write(mhdp, CDNS_DPTX_CAR,
    2021                             resp | CDNS_VIF_CLK_EN | CDNS_VIF_CLK_RSTN);
    2022 
    2023         connector = drm_atomic_get_new_connector_for_encoder(state,
    2024                                                              bridge->encoder);
    2025         if (WARN_ON(!connector))
    2026                 goto out;
    2027 
    2028         conn_state = drm_atomic_get_new_connector_state(state, connector);
    2029         if (WARN_ON(!conn_state))
    2030                 goto out;
    2031 
    2032         if (mhdp->hdcp_supported &&
    2033             mhdp->hw_state == MHDP_HW_READY &&
    2034             conn_state->content_protection ==
    2035             DRM_MODE_CONTENT_PROTECTION_DESIRED) {
    2036                 mutex_unlock(&mhdp->link_mutex);
    2037                 cdns_mhdp_hdcp_enable(mhdp, conn_state->hdcp_content_type);
    2038                 mutex_lock(&mhdp->link_mutex);
    2039         }
    2040 
    2041         crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
    2042         if (WARN_ON(!crtc_state))
    2043                 goto out;
    2044 
    2045         mode = &crtc_state->adjusted_mode;
    2046 
    2047         new_state = drm_atomic_get_new_bridge_state(state, bridge);
    2048         if (WARN_ON(!new_state))
    2049                 goto out;
    2050 
    2051         if (!cdns_mhdp_bandwidth_ok(mhdp, mode, mhdp->link.num_lanes,
    2052                                     mhdp->link.rate)) {
    2053                 ret = -EINVAL;
    2054                 goto out;
    2055         }
    2056 
    2057         cdns_mhdp_sst_enable(mhdp, mode);
    2058 
    2059         mhdp_state = to_cdns_mhdp_bridge_state(new_state);
    2060 
    2061         mhdp_state->current_mode = drm_mode_duplicate(bridge->dev, mode);
    2062         if (!mhdp_state->current_mode)
    2063                 return;
                         ^^^^^^^
Needs to unlock before returning.

    2064 
    2065         drm_mode_set_name(mhdp_state->current_mode);
    2066 
    2067         dev_dbg(mhdp->dev, "%s: Enabling mode %s\n", __func__, mode->name);
    2068 
    2069         mhdp->bridge_enabled = true;
    2070 
    2071 out:
    2072         mutex_unlock(&mhdp->link_mutex);
    2073         if (ret < 0)
--> 2074                 schedule_work(&mhdp->modeset_retry_work);
    2075 }

regards,
dan carpenter
