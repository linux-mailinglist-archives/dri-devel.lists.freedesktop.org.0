Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1D0371124
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 07:06:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C8E36E877;
	Mon,  3 May 2021 05:06:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F5246E873
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 05:06:13 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id lp4so963114pjb.1
 for <dri-devel@lists.freedesktop.org>; Sun, 02 May 2021 22:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E/FKJGJCQ2WFjnbO5YcetVVfi3vvMJqoARGeLl89eC8=;
 b=lh4za3xaTooJfbOeXMng1u3MjSxWc2HhVsNObUs5jj06JlvMqZu/IWYTVsv7WRr8Yq
 +RD6LF67WLbpj674PvIqT1c+mm/V/E9Y6qS42OeH3AGU8J9qCH45dPp4UrrKawDocPCT
 TLlIKznAvXBe2BdyTkRGmnyhLxR8OoTvpJe8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E/FKJGJCQ2WFjnbO5YcetVVfi3vvMJqoARGeLl89eC8=;
 b=ltPEKVNQTp3E8pweOwE/aVPrcRaZYafIPZah1F2FXITQtcTe3mjpnVzTXhV0eTcFtL
 C94KSf1aPKLhLIJpTfnd84eIQwojUHRpjn1yFZ9p1LvD6I41aPgAPsjdM4j0r5yivZFa
 OP5mWwjIKP0IbPWEd3vTKjSZRX0cs9YpzY6/fTk/HPtN7KB7Buy5CnFj1We+sAxDCT3y
 nBUO8JqMm9/9vFyto7pwDqzwPay8uALBQkui2VuVGVIaNRflT04ph20JKBE83ZpvnvwV
 7o046OOPJ2nh1s07ftUmnT/17eLSWJcaldEQf7IZdc2weFOPT6DT9Dv2jsSd5oXfnFK4
 iZhg==
X-Gm-Message-State: AOAM533iBnEWdwZduTxahx2VWog8uyJyE5rqgJbZqV5Dy45Ro5ytYwYE
 P92ocFHpRlM9smlBkcFcYJQ6PA==
X-Google-Smtp-Source: ABdhPJzK7f9E96uhGaYj9Z8XDC4clhUq0a6o0CReg/QOI2eaar9BmY6biZNhpeflByLUdzTTvNXTMg==
X-Received: by 2002:a17:902:a58b:b029:ee:d13a:2642 with SMTP id
 az11-20020a170902a58bb02900eed13a2642mr5016303plb.35.1620018373006; 
 Sun, 02 May 2021 22:06:13 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id q128sm7743860pfb.67.2021.05.02.22.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 22:06:11 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 0/2] drm/radeon: Fix off-by-one power_state index heap
 overwrite
Date: Sun,  2 May 2021 22:06:06 -0700
Message-Id: <20210503050608.2158996-1-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: "Erhard F." <erhard_f@mailbox.org>, Kees Cook <keescook@chromium.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This is an attempt at fixing a bug[1] uncovered by the relocation of
the slab freelist pointer offset, as well as some related clean-ups.

I don't have hardware to do runtime testing, but it builds. ;)

-Kees

[1] https://bugzilla.kernel.org/show_bug.cgi?id=211537

Kees Cook (2):
  drm/radeon: Fix off-by-one power_state index heap overwrite
  drm/radeon: Avoid power table parsing memory leaks

 drivers/gpu/drm/radeon/radeon_atombios.c | 26 ++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
