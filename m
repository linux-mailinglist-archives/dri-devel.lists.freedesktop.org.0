Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9588A1653
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 15:53:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C79710F0E1;
	Thu, 11 Apr 2024 13:53:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=t-argos.ru header.i=@t-argos.ru header.b="RH9wow2e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.t-argos.ru (mx1.t-argos.ru [109.73.34.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C259A10F0F1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 13:53:15 +0000 (UTC)
Received: from mx1.t-argos.ru (localhost [127.0.0.1])
 by mx1.t-argos.ru (Postfix) with ESMTP id 70A86100002;
 Thu, 11 Apr 2024 16:52:57 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-argos.ru; s=mail;
 t=1712843577; bh=8ESu4iuRBZIjTPHb0tQ+Ky1GNtW29FKY4e36GtVbDEM=;
 h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
 b=RH9wow2eJPVjMzX5BezRpelreYsbrFyF5hJMq5Nv0yH0DGscHLNWKslrQrIcJEcuD
 0T/D8OCNojfRft9xaCtXEWmlKDYA86srZeX+0T392JBBlkme7dNrUCtyEwF+zEmIKw
 RAdLTm8ad45hQ3QBg9sw2vHpZujDEHXh6f8x98CLwgxyYhoMAvcF2Xceg/ZJmBcqZv
 yIXQTFmM+norJZjkGjpYtM+SonQpF7Zxb2Mu3hCYyeQAJTaX+e+tSGP0YjjgVTkxG2
 6SwIhxSvz2zeX1NyeaRMWW4EKbIqvRbTKJ5r50H/iEVQLDFKxcWdbm1zd7AxfSxLkW
 1lNPWbQqYMizA==
Received: from mx1.t-argos.ru.ru (mail.t-argos.ru [172.17.13.212])
 by mx1.t-argos.ru (Postfix) with ESMTP;
 Thu, 11 Apr 2024 16:52:40 +0300 (MSK)
Received: from [172.17.214.6] (172.17.214.6) by ta-mail-02 (172.17.13.212)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 11 Apr
 2024 16:52:33 +0300
Message-ID: <d6b7a51e-216e-4059-9f28-74fc47078ecf@t-argos.ru>
Date: Thu, 11 Apr 2024 16:49:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] drm: bridge: cdns-mhdp8546: Fix possible null
 pointer dereference
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: <dri-devel@lists.freedesktop.org>
References: <a6e7e2f3-c173-4c33-ba0b-b068140131a9@moroto.mountain>
Content-Language: ru
From: Aleksandr Mishin <amishin@t-argos.ru>
In-Reply-To: <a6e7e2f3-c173-4c33-ba0b-b068140131a9@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.17.214.6]
X-ClientProxiedBy: ta-mail-02.ta.t-argos.ru (172.17.13.212) To ta-mail-02
 (172.17.13.212)
X-KSMG-Rule-ID: 1
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184674 [Apr 11 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: amishin@t-argos.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 16 0.3.16
 6e64c33514fcbd07e515710c86ba61de7f56194e,
 {Tracking_from_domain_doesnt_match_to},
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; t-argos.ru:7.1.1;
 mx1.t-argos.ru.ru:7.1.1; 127.0.0.199:7.1.2, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/04/11 07:47:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30,
 bases: 2024/04/11 10:13:00 #24743273
X-KSMG-AntiVirus-Status: Clean, skipped
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



On 11.04.2024 16:39, Dan Carpenter wrote:
> Hello Aleksandr Mishin,
> 
> Commit 935a92a1c400 ("drm: bridge: cdns-mhdp8546: Fix possible null
> pointer dereference") from Apr 8, 2024 (linux-next), leads to the
> following Smatch static checker warning:
> 
> 	drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:2074 cdns_mhdp_atomic_enable()
> 	warn: inconsistent returns '&mhdp->link_mutex'.
> 
> drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>      1986 static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
>      1987                                     struct drm_bridge_state *bridge_state)
>      1988 {
>      1989         struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
>      1990         struct drm_atomic_state *state = bridge_state->base.state;
>      1991         struct cdns_mhdp_bridge_state *mhdp_state;
>      1992         struct drm_crtc_state *crtc_state;
>      1993         struct drm_connector *connector;
>      1994         struct drm_connector_state *conn_state;
>      1995         struct drm_bridge_state *new_state;
>      1996         const struct drm_display_mode *mode;
>      1997         u32 resp;
>      1998         int ret;
>      1999
>      2000         dev_dbg(mhdp->dev, "bridge enable\n");
>      2001
>      2002         mutex_lock(&mhdp->link_mutex);
>                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Holding a lock
> 
>      2003
>      2004         if (mhdp->plugged && !mhdp->link_up) {
>      2005                 ret = cdns_mhdp_link_up(mhdp);
>      2006                 if (ret < 0)
>      2007                         goto out;
>      2008         }
>      2009
>      2010         if (mhdp->info && mhdp->info->ops && mhdp->info->ops->enable)
>      2011                 mhdp->info->ops->enable(mhdp);
>      2012
>      2013         /* Enable VIF clock for stream 0 */
>      2014         ret = cdns_mhdp_reg_read(mhdp, CDNS_DPTX_CAR, &resp);
>      2015         if (ret < 0) {
>      2016                 dev_err(mhdp->dev, "Failed to read CDNS_DPTX_CAR %d\n", ret);
>      2017                 goto out;
>      2018         }
>      2019
>      2020         cdns_mhdp_reg_write(mhdp, CDNS_DPTX_CAR,
>      2021                             resp | CDNS_VIF_CLK_EN | CDNS_VIF_CLK_RSTN);
>      2022
>      2023         connector = drm_atomic_get_new_connector_for_encoder(state,
>      2024                                                              bridge->encoder);
>      2025         if (WARN_ON(!connector))
>      2026                 goto out;
>      2027
>      2028         conn_state = drm_atomic_get_new_connector_state(state, connector);
>      2029         if (WARN_ON(!conn_state))
>      2030                 goto out;
>      2031
>      2032         if (mhdp->hdcp_supported &&
>      2033             mhdp->hw_state == MHDP_HW_READY &&
>      2034             conn_state->content_protection ==
>      2035             DRM_MODE_CONTENT_PROTECTION_DESIRED) {
>      2036                 mutex_unlock(&mhdp->link_mutex);
>      2037                 cdns_mhdp_hdcp_enable(mhdp, conn_state->hdcp_content_type);
>      2038                 mutex_lock(&mhdp->link_mutex);
>      2039         }
>      2040
>      2041         crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
>      2042         if (WARN_ON(!crtc_state))
>      2043                 goto out;
>      2044
>      2045         mode = &crtc_state->adjusted_mode;
>      2046
>      2047         new_state = drm_atomic_get_new_bridge_state(state, bridge);
>      2048         if (WARN_ON(!new_state))
>      2049                 goto out;
>      2050
>      2051         if (!cdns_mhdp_bandwidth_ok(mhdp, mode, mhdp->link.num_lanes,
>      2052                                     mhdp->link.rate)) {
>      2053                 ret = -EINVAL;
>      2054                 goto out;
>      2055         }
>      2056
>      2057         cdns_mhdp_sst_enable(mhdp, mode);
>      2058
>      2059         mhdp_state = to_cdns_mhdp_bridge_state(new_state);
>      2060
>      2061         mhdp_state->current_mode = drm_mode_duplicate(bridge->dev, mode);
>      2062         if (!mhdp_state->current_mode)
>      2063                 return;
>                           ^^^^^^^
> Needs to unlock before returning.

Yes. Sorry. It's my mistake.
I'll replace 'return' with 'ret=-EINVAL; goto out;' and offer v2 patch.

> 
>      2064
>      2065         drm_mode_set_name(mhdp_state->current_mode);
>      2066
>      2067         dev_dbg(mhdp->dev, "%s: Enabling mode %s\n", __func__, mode->name);
>      2068
>      2069         mhdp->bridge_enabled = true;
>      2070
>      2071 out:
>      2072         mutex_unlock(&mhdp->link_mutex);
>      2073         if (ret < 0)
> --> 2074                 schedule_work(&mhdp->modeset_retry_work);
>      2075 }
> 
> regards,
> dan carpenter

-- 
Kind regards
Aleksandr
