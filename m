Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B153F2BB2
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 14:05:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3DE46EA75;
	Fri, 20 Aug 2021 12:05:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC1C6EA73
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 12:05:33 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 v20-20020a1cf714000000b002e71f4d2026so1238605wmh.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 05:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IQ+jBT8vlFg/eykYyV9eMquI3NUUi3FkmRtuCgkgOuY=;
 b=Gotd+9ln1CjdH1/VRJqdBlNYC+QxeUVcCg3Cj4q2RgYat80Hn2UAudjfKFs97QrZEd
 z4G3A4evLAOkllETCmKcvYhfs3xqc5HGbbfEv/RuTD39L8ZAShzygL+3jvThyUqDPup3
 Wfg4LkFSlEwYZGhlDcWlo0fEq5JMSBIay69LNLA/LPlCBRGWUIR7mXaZVEL2el8Qpv8i
 aCP8paMeLOcGHS0efKqYMLglA49UjKWt7ar4wQjPqZ7215fgvcUDObw+xlTiySVhKMnp
 D+5h2IN7MILF+P1U4VED7Iv/9wpVGBfVwbrX3EcZO18pckz45q5vsgVhXJwKl9HRb+fq
 t2bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IQ+jBT8vlFg/eykYyV9eMquI3NUUi3FkmRtuCgkgOuY=;
 b=FekKeiOzxW9PeVLZ0umiEUbM77N+SjpRI6xWlQQQ8TXW8vi2j7b7uB1TXUBweHbIee
 buJHAoZR+LMOyMB7WXbRrK8jxkHsAc76Ctc7UpSN2YLnWiQogvLKdHGqejclEOBJFRg8
 NfFktUnsIyat6/ey8F3D90Tx8rxxx7tKHxdXzAgc90rHq3g2Kg55Zcf6w1IVm5IKoCvh
 34EPcbE0tNMKxDHceAmHD1SycYCqCIiaoHUxh5IIFQ5QvSMMacAamL4V+ctuHHK/OGnx
 72aNBnlp8ZtLUPs/T2FhcvUrXq2l4RFgUHD0QEJdxh5yqRUTCbWSb/9OKNxbn3lIiSfM
 1c/Q==
X-Gm-Message-State: AOAM532O3xGIl+52E2J0FSwoOS8yKt4n9Y6ldou1vSuG8igu1Pxs5l8Y
 KgdvWGn8QW1mSRoUAeIT9i7yBjq1IWg+bCOm
X-Google-Smtp-Source: ABdhPJwjelRFhx5ibnHfmquLKvnFNuRjYvqFhqusFs1GMpKQdLbW2e1MF7emnBzu1XsuuzjbjB78+A==
X-Received: by 2002:a05:600c:1405:: with SMTP id
 g5mr3572230wmi.40.1629461132100; 
 Fri, 20 Aug 2021 05:05:32 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 r12sm6139818wrv.96.2021.08.20.05.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 05:05:31 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: akpm@linux-foundation.org
Cc: dri-devel@lists.freedesktop.org,
	daniel@ffwll.ch
Subject: Adding sync_shrinkers function for TTM pool optimization
Date: Fri, 20 Aug 2021 14:05:26 +0200
Message-Id: <20210820120528.81114-1-christian.koenig@amd.com>
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

Hi Andrew,

Daniel suggested that I ping you once more about this.

Basically we want to add a barrier function to make sure that our TTM pool shrinker is not freeing up pages from a device while the device is being unplugged.

Currently we are having a global mutex to serialize all of this, but this caused contention for unmapping the freed pages in the IOMMU.

We just need your Acked-by and I hope my explanation is now more understandable than the last time.

Cheers,
Christian.


