Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC5F382EE2
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 16:11:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9ECD6E97A;
	Mon, 17 May 2021 14:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30E126E974
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 14:11:33 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id t15so7060551edr.11
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 07:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/uYIsc2htyUAohYH85H3sbQHCzRV4AhZ3J/6S4v6z08=;
 b=ZMT+aN3bQ36dHjsVPAejG43SAmkoEd0Qm9eqOZuzBt7yR5uCEVWzOqx/OXgsulQXh1
 lkRtb0S20RgS6RH2JUwXvd5y72dPEEdat+U1H0ZhncSQdAfMIrGzSRdP5o/RJsy2Urhs
 yehbdjSxyIVROcrPeOIsuxdbE/Cnl9MHvJIf/4KVngUFJ+joRN7alAxBFNNQpqDjv+fO
 gt8jbwVHADfczaJmHLijeKnD10c3seDVPiNPGDZUll6w2r+fEtKxOn2SuHTdhufd1L4T
 asi6ghZVtMLMR17OAPV5w9e6TX1iU/aqtjSs9Ry/3+gZCuN5ML4254TRO33pdEJ1U0Jj
 ZlIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/uYIsc2htyUAohYH85H3sbQHCzRV4AhZ3J/6S4v6z08=;
 b=CYIQ4ywmcgQfV7RzBty03zFhIzJaoFjPkJq8hnpjZyZXQ81VmWU/majWRx0ENQzm19
 YS6bcw9K5ZU+b0oniOjtRqUFFhAs45RlVfTAUiSoj1UnUFn4Gy9DHf0YrzEJIZrEUNDi
 t83UAQAInaN4+ZJuIVpXXydRTPZ7/9TrUEzEqYF8fb29oRHCdITNDVIDXyHCyDMoGFgM
 5he3rJR4P/wZyuzOcymSbzBoV2plEG00Ifn6jYbeidt9kQOcihLXxIGf5sDVVwMe9WDX
 8P2gz71TzU9gT3G7kTEvWTdixB6pXlNw/EixFgj15kTBQCItbsQqUTrMOzMSdPmIFzKp
 IsJg==
X-Gm-Message-State: AOAM5309KbvQjM+rDelccEvCg6I5EOe5C4dkowyZKJqC1YgN+mU8Qtm7
 dkcTKO9gqY3jXpObF8mnkWGKner7a8I=
X-Google-Smtp-Source: ABdhPJwTKKSzjbWvrXVZRu1jfVInDY6a4RxjqvP6I4PFceoNd/UnGgKIZD2ZP1lKx3/D20/pWDdrkw==
X-Received: by 2002:a05:6402:2682:: with SMTP id
 w2mr235852edd.101.1621260692091; 
 Mon, 17 May 2021 07:11:32 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:1df4:c5b6:b8fd:3c4b])
 by smtp.gmail.com with ESMTPSA id b9sm2419624edt.71.2021.05.17.07.11.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 07:11:31 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [RFC] Add DMA_RESV_USAGE flags
Date: Mon, 17 May 2021 16:11:18 +0200
Message-Id: <20210517141129.2225-1-christian.koenig@amd.com>
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

We had a long outstanding problem in amdgpu that buffers exported to user drivers by DMA-buf serialize all command submissions using them.

In other words we can't compose the buffer with different engines and then send it to another driver for display further processing.

This was added to work around the fact that i915 didn't wanted to wait for shared fences in the dma_resv objects before displaying a buffer.

Since this problem is now causing issues with Vulkan we need to find a better solution for that.

The patch set here tries to do this by adding an usage flag to the shared fences noting when and how they should participate in implicit synchronization.

Please review and/or comment,
Christian.


