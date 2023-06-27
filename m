Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 254EE73F503
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 09:00:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D1310E089;
	Tue, 27 Jun 2023 07:00:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C47EB10E27B
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 02:05:16 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-98e1c6a687fso229539766b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 19:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687831513; x=1690423513;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ViaS8m/tB1ZwDe3hpa7K3nFc8JiLeIQbzktG4koecjI=;
 b=DbvyrX8Kh6kxBwi4yPwAltA2DiZ4o5SRvn1oCCtneYIqW/eqa7r2XGFRQyu78iwNs2
 wXeZBKPhv6+36Q8iBzozcDu3iljnRp9SwDuy3oee+rBB/i3QAQx9otI3bMpXWqextziI
 DL2h7g9XafAHZPIAqijGEQ9OSIQihcHIYIYl+RpgnVtPQ2vUbgm6Df+iDNd8vP2GIIl/
 KvPVEQf7KhtPYozARf4MqECgM/2P+8fBMufVPYiTz72BNlbX9zi4MqnkrNnxeqh+3dBV
 LxgwaqbU7PoHpQaQI+WdIHviBoCm4xPijBE/cCmRaj4oVbjWmeY3WoUPiY3l/2Ov7AWR
 JB4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687831513; x=1690423513;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ViaS8m/tB1ZwDe3hpa7K3nFc8JiLeIQbzktG4koecjI=;
 b=Y9LrZagu/rpCWzwHDGsr+NtpFmcsoTIeCCMcZmA0CtrejZ/KtCvupFcCWTcvTAKtq2
 U7akAsJz1DBsYcrhRiLXuuQW08t6lsh8sfrwkMYWhCuzo2aStlSH+TyuzRPLcw+iWJfs
 uSLNEeD+mLKR4rsjLCI5mr1jFk3olWSfRWvTcuft1uKE+XpkZORgdcSbpPYPdB47URwi
 BF2Mejpcd7XctSG0UweNCu7SW1Dhikzgpuye0qXYAhs6TLxJMAPrgq033UFsDr1CdRAa
 QSS5vYABLRg2NmWG1clQRRVxKVdKjCQOBWZZjFNlXQemhxT6OeRcslmUOqw3blEfnf4i
 87ug==
X-Gm-Message-State: AC+VfDxnqXKaCNPjCGA6s0uqMM2Mci815nKB6lYOkGpOmYO6Yvw8iEsS
 LVPkewU6A9bp/vjsVp8NpWIAlxRSjshdDJLbx/g=
X-Google-Smtp-Source: ACHHUZ5LWoLu45t0nxwwx6EzTGqalF+tTk0Cb0uyHlY09yrEoSb6duKmX7N6iCSU1Seld7+UMlKh04UsMs/qaXFOdn0=
X-Received: by 2002:a17:906:8a4a:b0:991:c842:2ca2 with SMTP id
 gx10-20020a1709068a4a00b00991c8422ca2mr2584920ejc.15.1687831512929; Mon, 26
 Jun 2023 19:05:12 -0700 (PDT)
MIME-Version: 1.0
From: yguoaz <yguoaz@gmail.com>
Date: Tue, 27 Jun 2023 10:05:01 +0800
Message-ID: <CAM7=BFqB16zNZ3TVZM3XBAP6PiqtTniQ0PeS2CEf1thq15PHZw@mail.gmail.com>
Subject: [drm/bridge]: possible buffer overrun in cdns-mhdp8546-core.c
To: sjakhade@cadence.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 27 Jun 2023 07:00:45 +0000
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
Cc: yamonkar@cadence.com, dri-devel@lists.freedesktop.org,
 quentin.schulz@free-electrons.com, tomi.valkeinen@ti.com, jsarha@ti.com,
 andrzej.hajda@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the file drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c, the
function cdns_mhdp_print_lt_status has the following code:

char vs[8] = "0/0/0/0";
char pe[8] = "0/0/0/0";
unsigned int i;

for (i = 0; i < mhdp->link.num_lanes; i++) {
    vs[i * 2] = '0' + phy_cfg->dp.voltage[i];
    pe[i * 2] = '0' + phy_cfg->dp.pre[i];
}

vs[i * 2 - 1] = '\0';
pe[i * 2 - 1] = '\0';

If mhdp->link.num_lanes == 0, the above code accesses vs[-1] and
pe[-1]. I think this case might be possible. For example, in the
function cdns_mhdp_link_training_channel_eq, we have:

cdns_mhdp_adjust_lt(mhdp, mhdp->link.num_lanes,
    training_interval, lanes_data, link_status);

r = drm_dp_clock_recovery_ok(link_status, mhdp->link.num_lanes);
if (!r)
    goto err;
if (drm_dp_channel_eq_ok(link_status, mhdp->link.num_lanes)) {
    cdns_mhdp_print_lt_status("EQ phase ok", mhdp, &phy_cfg);
    return true;
}

Notice that inside the function cdns_mhdp_adjust_lt, there is a check
for possibly invalid number of lanes:

if (nlanes != 4 && nlanes != 2 && nlanes != 1) {
    dev_err(mhdp->dev, "invalid number of lanes: %u\n", nlanes);
    ret = -EINVAL;
    goto out;
}

If nlanes == 0,  a buffer overrun can happen in the subsequent call of
cdns_mhdp_print_lt_status.
