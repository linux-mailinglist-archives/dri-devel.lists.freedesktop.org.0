Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C2C17710B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 09:24:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB8A6EA03;
	Tue,  3 Mar 2020 08:24:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 980886E25A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 10:32:28 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id y17so7566670lfe.8
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 02:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QnYXcIKWVcVSniTvImIOUV2GKYnwwg6k3OeoObFRdpM=;
 b=Ri8EY8zjK8JQBlTwBx2lPNX4EJyj2l0TFRRuH965V0Dj13z0lqud6RgyZnmchIT3mL
 i4kB/cPt3Qs+Pzey02cSv5WkFTPpkId23mXl9MEIu1B9ODeukat2DB7Yu9lxNaddFEFi
 jVOuf5L3ZPXefhjqnIRG2EuOmKGw3QWf3vm21KVXQVnh9zbMTBiG9nti2Z4eVtfMW/pk
 s/mUUQY3Aku49cOy/dx8baIcHtONli0joOFAowL3ySG9fe+VcmXaUCRDdH0sFNf2ecBp
 flyGcYDnGwRG1mKJV0Nj6Wmzbk6VrIAnx0Ke2rBlhUGVg2QKtsQmsMQlKLAs0rV5UZMW
 b2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QnYXcIKWVcVSniTvImIOUV2GKYnwwg6k3OeoObFRdpM=;
 b=sJ1WXOdgtj51KZrkmyQbR0Ql1LYZOliJjT0Zw9sDCGBRl8DHix5p+2Vg8mBqyb+6aj
 qaacGcg7LqCwKc27P7i5MkFHCMGJWXR4b7cCEh3dLBdLwNcP4tERdl0YzGaQHSPtiKNb
 qae1qN5Qzuuj24L51goYVAGWC5269VX9kTntcyPUn4J6uwrsSEtTlwQivJt9Y1Wov+Sg
 urXbe4EJz1W7hRqGf6PlV7yX2Hc3YtyqIKHJYT6rn5xOEUSJ0hcrNRImPUEB42MN/lXy
 GAx/VC7vzLmQsHgzwbPQKzi3jUxv/5ooz9UNCo+WEZe9WC82UctJkK8nRW3Dfm84oHKw
 QOBg==
X-Gm-Message-State: ANhLgQ0byejexkBhVP7BytF+may9wLWUekVp0o9hQaWC47juLpQSnuHF
 QGIirdjp2mIdgnolmlL5K/g=
X-Google-Smtp-Source: ADFU+vum+gRzgYNjn0fs2L8U2Ud019xJc9t09+jbn5reMOsLMhPUU7XhcnXXsDSa0U8EPiu3o1eJHA==
X-Received: by 2002:a19:48cf:: with SMTP id v198mr10081652lfa.68.1583145147101; 
 Mon, 02 Mar 2020 02:32:27 -0800 (PST)
Received: from localhost.localdomain ([149.255.131.2])
 by smtp.gmail.com with ESMTPSA id n21sm3895328lfh.2.2020.03.02.02.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 02:32:26 -0800 (PST)
From: Roman Stratiienko <r.stratiienko@gmail.com>
To: jernej.skrabec@siol.net,
	mripard@kernel.org,
	wens@csie.org
Subject: .[PATCH v4 0/4] drm/sun4i: Improve alpha processing
Date: Mon,  2 Mar 2020 12:31:34 +0200
Message-Id: <20200302103138.17916-1-r.stratiienko@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <.>
References: <.>
X-Mailman-Approved-At: Tue, 03 Mar 2020 08:24:06 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Patches 1-2 already reviewed and ready to be applied.

Patch 4 is RFC and require more testing on real hardware.

[PATCH v4 1/4] drm/sun4i: Add alpha property for sun8i UI layer
[PATCH v4 2/4] drm/sun4i: Add alpha property for sun8i and sun50i VI
[PATCH v4 3/4] drm/sun4i: Add support for premulti/coverage blending
[PATCH v4 4/4] RFC: drm/sun4i: Process alpha channel of most bottom layer

 drivers/gpu/drm/sun4i/sun8i_mixer.h    |  2 +
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 50 ++++++++++++++++
 drivers/gpu/drm/sun4i/sun8i_ui_layer.h | 10 ++++
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 72 +++++++++++++++++++++---
 drivers/gpu/drm/sun4i/sun8i_vi_layer.h | 16 ++++++
 5 files changed, 142 insertions(+), 8 deletions(-)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
