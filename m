Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC4A461482
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 13:07:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E396FA4F;
	Mon, 29 Nov 2021 12:07:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DED56FA3A
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 12:07:04 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id u1so36210583wru.13
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 04:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zHSdQUo/Z1ZUW2K5tQ/UFoyARgZ8X0ChGzLOvRpv+d0=;
 b=X9+o7iX5QfU7Ab0akA1dDvE2mT0HK8UOLIgco2KjGFZkh13zyRptiW3RR2HPLxCMlr
 K3I8Xwd8jwKKeOwFXHiCymTNGMXdaCdnMfLiWItsIS3DqESMXpPGkvk8eSnVSQlizVQM
 25kCS2PIOBra3yyk/9fMKi73GYmWj1ao1VE2rI/AysW/CYl7+A71OWUoVjv0P5RWzvmF
 ei4VR+Og5xrTbOvUhCm5OKvYgce64ioRfT64xyAL/MvgR4RoAkdTdg+/yaX07cLUX2qd
 87ks8GKrCjaJayYD8vkRPYAnZ0V8GhIKpYBaTogI7ZheY6CnEk9Wr2lDGwv1b5r70E5b
 74zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zHSdQUo/Z1ZUW2K5tQ/UFoyARgZ8X0ChGzLOvRpv+d0=;
 b=8GBy9neuF1mDXguCuc/NMWdf8LEJHRDllFS8fXMdaJWOtPVGrXcMBEm1CZeEq9J0T/
 bJLL40KK+fkgerURj2xegp+trqCp867cBrZfZcuBzLARB50iVX6+eM/fvypPbQBb5985
 gQZ7tS6xJ5k9MT/xayfvJAXN5yHdza3b9jdB5OzfczaColR6D0Spk9eooPdKFmxMRYsU
 Q45kB5UOFdA3Ipcly8qTUzUZcmZ2d8tQrc1xtLAwxu9RYYSwDwmCiOr98Pp/867YpZL/
 LVEytMKjIAkNsUuN7d4o+97A/I47Poa70oBVOLXSD8vBzgJPfv3s4uW5rrG/R7+7AJOQ
 UqoQ==
X-Gm-Message-State: AOAM5325vavWSUPqpabH4ONLv8OyiN2+cjB1YByrqR9W87R/ThUeEdTA
 E5VG5X9O3+PnvvNJo9yQ/0U=
X-Google-Smtp-Source: ABdhPJy28uYGJlxEr/SzYN0VNKwr33UJ/8ZdAHdtvlS/NExTfCzbnCk11Gflha3P8ddzATr74mIGpQ==
X-Received: by 2002:adf:eac8:: with SMTP id o8mr34155552wrn.337.1638187622570; 
 Mon, 29 Nov 2021 04:07:02 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id b6sm20415234wmq.45.2021.11.29.04.07.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 04:07:02 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch
Subject: completely rework the dma_resv semantic
Date: Mon, 29 Nov 2021 13:06:31 +0100
Message-Id: <20211129120659.1815-1-christian.koenig@amd.com>
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

Hi everyone,

compared to the last version I've dropped the pruning as suggested by
Maarten, split the new DMA_RESV_USAGE_* patches from the general
introduction as suggeted by Daniel and renamed OTEHRS to BOOKKEEP as
suggested by Pekka.

Please take a look and review,
Christian.


