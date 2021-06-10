Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 275A73A2816
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 11:18:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5FA76EC90;
	Thu, 10 Jun 2021 09:18:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD2E6EC8E;
 Thu, 10 Jun 2021 09:18:03 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 k5-20020a05600c1c85b02901affeec3ef8so6115652wms.0; 
 Thu, 10 Jun 2021 02:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Fmb4cueVtOXZ29A3KoEkc9R3bgHt8UwFR2vwnaO9L4o=;
 b=cLz8LVCjuXmwIs0cUlJEHekrA55mhSzQQpmX2bxPLIrXyH+tB3AyaQVlj/jdabTEjj
 BngJdUDDdMw+iN2PFR7UwhOFjppSQz2X9iz7AzjRxtBSi8Pv6XYOv025y5A7PKBmdpyX
 jYLck3rzYgHh3I6x8h+LACBB8BeH0eS+fL8qaoYQnGiFSY9LH0AIIg5RTXpCJ6k8Thsw
 ctZMvX7q7n4tHWUURcGzkJIHgRHD8kXh19JI+Ql297urgxfO4uaYsjnom4tyYkm0SdNE
 koLzJWCnmTX8emeC5T6Ig+X6ZRJ74v74A0s6kCPiRcnSNmP+ous7+Lsd01Ki1u5mJpL8
 fchQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Fmb4cueVtOXZ29A3KoEkc9R3bgHt8UwFR2vwnaO9L4o=;
 b=ZVlfxuPUDP5Mo8jkW36KFTudsZTKrS7giIa7s/QQ0tNJb6upvFVxk/I1Q9iJA/dBAq
 atoE58cGp5RZN1tsYfEkP/Z3DIvX44ncbqtgljq17wRV+K3qxnU4Nnwc4shhtJEFfE5z
 r97PmOVXdlQQ6IGf6aeJ9j6/9FDIG91EL3Bf8XxCRDgBAosbMYKcey5onNmzJFtUuB+C
 tMnJf7RgyTFgVD7PCI8tppIGExJ6YF6glRA271RNDd7B0Df7z5Emi65XLe5r5VMYRe52
 6twUdy/R9XDf3L61U9RNI4fsYw8frFAvYtQv8+lbko+UlnS+gcI7Yb8CuD3tCFItuj8O
 oLgg==
X-Gm-Message-State: AOAM533dRIpD8Nf/YCwsJYmbY6Uu/GMzj3S02H/Tt9QF2Gn438Qv4WfE
 UnXroeenyi85i5ya3x/o1AZlPW6XC3A=
X-Google-Smtp-Source: ABdhPJzXaladOwixE+vJSP7w5UTqwMP1tNW7nfxmDEpeieNhhorC1gVgMhIdsQfiiWTcxL86s62eiQ==
X-Received: by 2002:a05:600c:243:: with SMTP id 3mr4000102wmj.35.1623316682565; 
 Thu, 10 Jun 2021 02:18:02 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:561f:e43a:edf5:8f95])
 by smtp.gmail.com with ESMTPSA id v8sm3087445wrc.29.2021.06.10.02.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 02:18:02 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: Change how amdgpu stores fences in dma_resv objects
Date: Thu, 10 Jun 2021 11:17:53 +0200
Message-Id: <20210610091800.1833-1-christian.koenig@amd.com>
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

Since we can't find a consensus on hot to move forward with the dma_resv object I concentrated on changing the approach for amdgpu first.

This new approach changes how the driver stores the command submission fence in the dma_resv object in DMA-buf exported BOs.

For exported BOs we now store the CS fence in a dma_fence_chain container and assign that one to the exclusive fences slot.

During synchronization this dma_fence_chain container is unpacked again and the containing fences handled individually.

This has a little bit more overhead than the old approach, but it allows for waiting for the exclusive slot for writes again.

Regards,
Christian.


