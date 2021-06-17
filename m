Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B533AB227
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 13:16:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99AC46E104;
	Thu, 17 Jun 2021 11:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABCAD6E104
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 11:16:02 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id z12so3500798edc.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 04:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eRoeVaaXjTUDEXCwT0O7O9+YvstCRV3pUx1vTDqRgQg=;
 b=G4wBwRp0IjZh+y0I9yhNcfOxHF+Za8sU6/ookQRfC8i1TVCIFcg3TQ9kveDi300x6q
 gdQqx77sfv0OtlGiYtOgajzGlUHIS1Ia/W/aJWKCQ9a22UKHP2FyRfZprVG/OBAzkY3r
 /oQEo33n5soAsdloWhelH3zPTiKwFVEXJdTg7+kNxpexB7bvOfGWCkqhoNsXos2Qua4q
 0uDo+1LSIVQk9PS4881xGdI2pDiJQBpPaVudCP+DShbmVho+BW4rNeeyZ6H5XSrhRXpS
 IzjNMQuKPBEF2K4zX91ZSpyEQnniQmfmIildKcuwkCYmDArJk1HvAxgf0IvMGBI/XwKW
 dUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eRoeVaaXjTUDEXCwT0O7O9+YvstCRV3pUx1vTDqRgQg=;
 b=bIpNMBrzy/hpOhSa1nwpaQcoey8HabTggA1onag9tywYCG8DF0b+VwOj9vkIODZOiz
 yyNVoe67YKU4XOvXsXQ/lbssMKFGKmB44BKjwVBGlFgf9jW4YaRGOq8gYKRNZlo5IDkD
 OdUKpDg9qBZJYsAGIzpxUvvFRu/4LBCCLXqLR1nHa+OYGrqmpa2yb1qzbEoYO04JVbNw
 Z6dNJja33PJ4gMly7h/CMrNzOB+2COmCgSjIi9hWJuYJj/pCadsCghNtJU9wnRCRB+4X
 OBdVRfPUXIjK2yuRfJbZsdDDLk6IlLbK5GWXjaG5g4fMXsvr9AkaB5eCJnulpdTrHRcQ
 iLtw==
X-Gm-Message-State: AOAM531Zcigk62zXpKKK+ORWz9qoBBO33RgF+WucI5qCEv16EzdXPiXh
 QDNtj373aBEiEyCfy39u4hE=
X-Google-Smtp-Source: ABdhPJytH6yVvyCmyeiBB7rLMSWtt83HkP7MUpXyrNkBfXBgFQ2Z867Cw4vlh/L4I8F8GBSaCTnRyg==
X-Received: by 2002:a05:6402:543:: with SMTP id
 i3mr5777204edx.173.1623928561443; 
 Thu, 17 Jun 2021 04:16:01 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8534:5e76:1ee5:f3ad])
 by smtp.gmail.com with ESMTPSA id y10sm3531353ejm.76.2021.06.17.04.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 04:16:00 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Subject: Introduce fence iterators to abstract dma_resv RCU handling
Date: Thu, 17 Jun 2021 13:15:42 +0200
Message-Id: <20210617111558.28486-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi guys,

during the recent discussion about SLAB_TYPESAFE_BY_RCU, dma_fence_get_rcu and dma_fence_get_rcu_safe we found that the RCU handling for dma_resv objects was implemented multiple times.

Unfortunately a lot of those implementations get the rather complicated dance with RCU and the sequence number handling wrong.

So this patch set aims to audit and unify this by providing an iterator which automatically restarts when a modification to the dma_resv object is detected.

The result is pretty impressive I think since this not only mean that we got rid of all those incorrect dma_fence_get_rcu() cases, but also reduce the overall loc count quite a bit.

Please review and/or comment.

Cheers,
Christian.


