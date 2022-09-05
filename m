Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D485ACD08
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 09:46:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E56DC10E1FC;
	Mon,  5 Sep 2022 07:46:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D97F10E1F5;
 Mon,  5 Sep 2022 07:46:22 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id e17so2597314edc.5;
 Mon, 05 Sep 2022 00:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Ns0e6BF5lsSCBTPKI8hcA6JQ2wSlm+RnddxbYzGwY78=;
 b=RxePfGbUgFr9m1wzXfMcTyrFLm8VXH3Yjx/yfWE1dMrqrFq06nWkoMsCfSzy5EzaNc
 zkvReGjw1pXYSieHpawZtsbp5SfsbV0sgEO025cH+8zNr0qXEeVAKzG+nVwKkxY+Y2z6
 8PZfmamY9BII8PaTZVTkWWMzy80ttmH0L0j8Kx9BpU3sAFm2gIhnqrN4WWAMpgODdvgs
 RIWPxIUMJEyU3jyYOIWksqLB0g+IUVvJaiT/+vfXkhfHcEpFyqtgJHcd3LCsq0zrTm14
 nRFXPkAFkOEywh8Q1ncIiuWym8mfHtpF/gGHXSB4J1ahZlYtmM3Y/XO88mosIj9W6eZG
 Sy7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Ns0e6BF5lsSCBTPKI8hcA6JQ2wSlm+RnddxbYzGwY78=;
 b=pdmJS3v0AeH1Qsfaba6EF0jlNlLAgTpmkp0f3YHpOJtZj0+TqwljDphN1YJQmLSceS
 gvQusVjyx8vPGI/qfGFxFeXripl168s+5LMbLgO23+mq4O/W4dR3inPd5sw0tAZOTS2W
 vi5Z7GENMCjgrwPrjpkNdlVGQTCAjkC+r7rvuwgcZo6vLwmx0hEJfu/zqdN9vN3z82iQ
 9udYAeqBkSgi126+boi/phZX9i9tEc5XCWCUdqD9XmSxEy0B2Tzgc+pFOf+ngfjfvI2C
 dyXt3nxGsvznvpKEyMQnKKEO0nw9RcRY8RLEI1v+U9X8Zwq7GifxHBNyAw5uo/QFo0JB
 JTGQ==
X-Gm-Message-State: ACgBeo2oZArDE/1YdKbbxLOuUjGrZvoCxbQEUgdByhJatZeTLyCrh64M
 dsJDQ0nqu+1e/Xc/zlqMqRD/7jof+eZwBw4ttcs=
X-Google-Smtp-Source: AA6agR5wybEqXz4dGsViNshife/UNSpksZhb2GioQ2olydywe0lOqHmE3AnukOX3V2PeaiKO4gRc+Yv2kqPhN/RGYDA=
X-Received: by 2002:a05:6402:1f02:b0:445:f674:eac0 with SMTP id
 b2-20020a0564021f0200b00445f674eac0mr41072891edb.370.1662363980652; Mon, 05
 Sep 2022 00:46:20 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_E1BBF05904DFB73C478DCD592740AAE0780A@qq.com>
 <CAJedcCxVW++iH49UFZp9ruUuTcNubWCH6Wsqe11K4COB3E8msg@mail.gmail.com>
 <CAJedcCw1eJqjSK+yR7eQMDheNtH3Mjm+viwt00xAhnmrfpq2pw@mail.gmail.com>
In-Reply-To: <CAJedcCw1eJqjSK+yR7eQMDheNtH3Mjm+viwt00xAhnmrfpq2pw@mail.gmail.com>
From: Zheng Hacker <hackerzheng666@gmail.com>
Date: Mon, 5 Sep 2022 15:46:09 +0800
Message-ID: <CAJedcCweHjD78F7iydiq6Xc2iH=t_3m=H9JKnaCooToUk32FvQ@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/gvt: fix double-free bug in split_2MB_gtt_entry.
To: xmzyshypnc <1002992920@qq.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: alex000young@gmail.com, security@kernel.org,
 dri-devel@lists.freedesktop.org, tvrtko.ursulin@linux.intel.com,
 airlied@linux.ie, Greg KH <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rodrigo.vivi@intel.com, intel-gvt-dev@lists.freedesktop.org,
 zhi.a.wang@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I rewrote the letter. Hope it works.

There is a double-free security bug in split_2MB_gtt_entry.

Here is a calling chain :
ppgtt_populate_spt->ppgtt_populate_shadow_entry->split_2MB_gtt_entry.
If intel_gvt_dma_map_guest_page failed, it will call
ppgtt_invalidate_spt, which will finally call ppgtt_free_spt and
kfree(spt). But the caller does not notice that, and it will call
ppgtt_free_spt again in error path.

Fix this by returning the result of ppgtt_invalidate_spt to split_2MB_gtt_entry.

Signed-off-by: Zheng Wang

---
 drivers/gpu/drm/i915/gvt/gtt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index ce0eb03709c3..9f14fded8c0c 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -1215,7 +1215,7 @@ static int split_2MB_gtt_entry(struct intel_vgpu *vgpu,
                ret = intel_gvt_dma_map_guest_page(vgpu, start_gfn + sub_index,
                                                   PAGE_SIZE, &dma_addr);
                if (ret) {
-                       ppgtt_invalidate_spt(spt);
+                       ret = ppgtt_invalidate_spt(spt);
                        return ret;
                }
                sub_se.val64 = se->val64;
--
2.25.1
