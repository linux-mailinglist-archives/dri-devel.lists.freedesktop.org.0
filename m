Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFD346BB24
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 13:34:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E29AE6E437;
	Tue,  7 Dec 2021 12:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF4873824
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 12:34:16 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id j3so29230522wrp.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 04:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UsLymO2NJxokLiyNAuPhk/abHIkS5BcAyNq3oHabOw0=;
 b=L6i3ochUOdIIETzfMMhvl0xo+H8PmC13ybWiQDxyxHPOFGCNd+9x0hd1C0uXpix9WD
 0DNwXOLiHGYfiy9TZku7tlkw7W6o37V3Th8X7CJs/M1hLkk36/VJSGAYJTTh0yaRbFtD
 w61hkT14D2249rxzC224Nge9I3Ng8NXsUBF3eXEhr4ILcahaEdIYkmqU8auYhSh/d0bK
 PEMGFapUXGs8izpAeBsxU1cFTTR1p0DKXZ0IxE7pSrKJh1pUbMCUlyqW0xGImtOlZZuu
 Weup2zh9VXTlhiS4yJzPlF21UqN4wI9fV+vjZdkpR3jnMsvFEmTlmBxLa3IuD16qS60R
 kh0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UsLymO2NJxokLiyNAuPhk/abHIkS5BcAyNq3oHabOw0=;
 b=YSZotoBbyIXKH4MtJq6oUnZUmUunNd2lrMcp5P9WTp0iIiEKIp1IbFWQt0mBgf9lZ9
 Qci5PFq9l55qSOZDPACDUZmKJ3N5W9eV2CSRvbfYxokaR7U86IUnuuxC0YzkKAdjeeJ9
 cPGyQMisgKNwSZAwROZQr1remGPvA03M232DUmHaXj87uHDG1Xamb9qsbr+0aCkUZMVI
 0DhdcLTrbZyNfIIidTWclu1W0gj/Z9ZoKfGxwf+JZe/yAQught09pvfReQaSpethniWH
 m0Iyf7JrTTAbxoU8FD5g7HR37m7kBmXxFcUR/3Hik617MyQy4CW0WZk8o6bWCXPI/Sfg
 CLeg==
X-Gm-Message-State: AOAM530X+ndABtSalcpUMFnRYNZJ27saOUTNEl0lZCJSKfUDtnQ/HDst
 hD+L02zPMm2/MObnfaGSNfw=
X-Google-Smtp-Source: ABdhPJwXJf/rZIxlu0oRQ74XzCWMNqr/EEFzXvSGNCj6TPD/+9C+4p2bj/r7c/TlKRh50YHkBhdduw==
X-Received: by 2002:a5d:6508:: with SMTP id x8mr49147397wru.388.1638880455017; 
 Tue, 07 Dec 2021 04:34:15 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id f19sm2802203wmq.34.2021.12.07.04.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 04:34:14 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: completely rework the dma_resv semantic
Date: Tue,  7 Dec 2021 13:33:47 +0100
Message-Id: <20211207123411.167006-1-christian.koenig@amd.com>
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

Hi Daniel,

just a gentle ping that you wanted to take a look at this.

Not much changed compared to the last version, only a minor bugfix in
the dma_resv_get_singleton error handling.

Regards,
Christian.


