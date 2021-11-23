Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 555D645A533
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 15:21:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A056E529;
	Tue, 23 Nov 2021 14:21:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A88A06E529
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 14:21:18 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id i5so39316494wrb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 06:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L0WQbPMmu7q1niXukhiHRfwOhv7htBGMZaUFwRTW/pU=;
 b=E8AElN6+/bBVTPJB1wlzguxBOE6x6n5zrNRdHXJyNZHjIyGsuO3OLe0mqHRs57A4ag
 Gxm+UVD+N7+eEdkm4KMGQDOnsizFXwDSmUCwAMuJhl35KmUOiUlt89nZYwWqIv24f4fK
 gw9peW2/IQVheul8jqWHfHnu88Mz2kQtagB51z0aUC08V3+zhqli6xS18Anv//qBqp61
 fUmEdq6sDcP/ORG4jKSmRLGxXnwHqkiS9g0ApmyTQoHZ5b4kOebPVA3jfb8tae37FbcZ
 O9n1wH5rUrPaHhW3YJqf4yud61GFKVD0LU5iMX+P6ceS9fa6BfhgL7rmFUjhHjDrErBa
 axrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L0WQbPMmu7q1niXukhiHRfwOhv7htBGMZaUFwRTW/pU=;
 b=Dk7Qv98kGUFPaNXOoJrACmzuV7umpdJZX93QOiJXhW5/JRW4hsBbA807i02Voa0P1d
 U/SCR23u1h3kz8cDOAk54s/b7/07Ps9CjO3nRMTblwh85tq3BAEt865YDnGhonQxQCIw
 twMTOTd/gr8Fz7OS126Vsg2Eq1b2mD3Hs3k2jZCCICA6MEzCBjgDbgw+dZpWB1+Zl+hl
 Hh3eqa9QdNiA5qGMh+s9KiaTdkg5J6UlXxEaJxvmxGeRvAiw/b1FMZMo3bmPXy8ibxZL
 PpyKwb3W20XOG3broHFRetEtCJ5Ik76442231lb9zYn4YDLzfEoGQMlTuDEnCI7J95ip
 OYew==
X-Gm-Message-State: AOAM532Y8USm5JclgUrAhGbAHqXXJ0dzwZIqP1Z+y4OFtAFYUAtVg+4M
 /d4L+ACRQKOgdErP1Lc19mY=
X-Google-Smtp-Source: ABdhPJxMp1wlSMUNWPTuyd4QDJB4bZkg86F/2VpDGO6xW6jlSNTQmog4E4SSMIMlxZX8BompHjcOSQ==
X-Received: by 2002:a5d:6043:: with SMTP id j3mr7507583wrt.375.1637677276940; 
 Tue, 23 Nov 2021 06:21:16 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id t8sm1645928wmq.32.2021.11.23.06.21.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 06:21:16 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org,
	daniel@ffwll.ch
Subject: completely rework the dma_resv semantic
Date: Tue, 23 Nov 2021 15:20:45 +0100
Message-Id: <20211123142111.3885-1-christian.koenig@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi guys,

as discussed before this set of patches completely rework the dma_resv semantic
and spreads the new handling over all the existing drivers and users.

First of all this drops the DAG approach because it requires that every single
driver implements those relatively complicated rules correctly and any
violation of that immediately leads to either corruption of freed memory or
even more severe security problems.

Instead we just keep all fences around all the time until they are signaled.
Only fences with the same context are assumed to be signaled in the correct
order since this is exercised elsewhere as well. Replacing fences is now only
supported for hardware mechanism like VM page table updates where the hardware
can guarantee that the resource can't be accessed any more.

Then the concept of a single exclusive fence and multiple shared fences is
dropped as well.

Instead the dma_resv object is now just a container for dma_fence objects where
each fence has associated usage flags. Those use flags describe how the
operation represented by the dma_fence object is using the resource protected
by the dma_resv object. This allows us to add multiple fences for each usage
type.

Additionally to the existing WRITE/READ usages this patch set also adds the new
KERNEL and OTHER usages. The KERNEL usages is used in cases where the kernel
needs to do some operation with the resource protected by the dma_resv object,
like copies or clears. Those are mandatory to wait for when dynamic memory
management is used.

The OTHER usage is for cases where we don't want that the operation represented
by the dma_fence object participate in any implicit sync but needs to be
respected by the kernel memory management. Examples for those are VM page table
updates and preemption fences.

While doing this the new implementation cleans up existing workarounds all over
the place, but especially amdgpu and TTM. Surprisingly I also found two use
cases for the KERNEL/OTHER usage in i915 and Nouveau, those might need more
thoughts.

In general the existing functionality should been preserved, the only downside
is that we now always need to reserve a slot before adding a fence. The newly
added call to the reservation function can probably use some more cleanup.

TODOs: Testing, testing, testing, doublechecking the newly added
kerneldoc for any typos.

Please review and/or comment,
Christian.


