Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD7B181A3A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 14:52:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA3C8915A;
	Wed, 11 Mar 2020 13:52:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FDA88915A;
 Wed, 11 Mar 2020 13:52:02 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id r15so2718425wrx.6;
 Wed, 11 Mar 2020 06:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5PhxfGnB0bi/gRdfMRgwxp+GcrZerOX4kQOU9IbhHZA=;
 b=uZJqsWiKmHaq4ziRnRmLD0zId8jDdq//XwQSURKrW6HCp0ReQQTdOC70oLGSikpvwM
 5E8UySIgODRaQdQ5Y4RoJyV9l1IHE+0oXdWGgNTeUits8dXoHcyembmkwHmd4pO5N5kn
 3um9IGA5aH7Qt1xiJXxLeVz5dufMWH044EJVRfDVnxCYXUV7LGOsYYLL2/NYXNnJAMRb
 y45XsVAFdukVpXLyC1C2dbkZJIz/OpsKDvCXhiNaOCQo9yq49cwyxpSyTjFyx1G0Hcv9
 eEDusp5gX1/6dYKID6wOKlL2CcbbSIYEQ9oiXNUEkx+ela4QTqu6L5xlZ7x7XQ4sgTXP
 iRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5PhxfGnB0bi/gRdfMRgwxp+GcrZerOX4kQOU9IbhHZA=;
 b=H+GVsw6tujOUnRkZAlCG8DjPWFSL1HpM6mMrOUrekIO3t/OWdmdda0nhcBuBj5pR9b
 sPMdcQk+bOkyylVv3MaPXeKvWiz3Y2K6YXKbusg1AYWImH4ImVWKlY90DAWRXeWN0RFs
 0e+4haI1YRfG4hYcUCQR6zfsRa77aCw5lCT6Rcnh+arw7Xqxz5mVmOq2cp51JD7zUdG7
 hOHfwqEEVwTd6gpM+LruEh33o3dBRwvUOT1Ncz9YLuFBJSngyZ4CTXmLH4wvZqnuPS06
 AgNTZ0192YnCEqh2A4NloH2uzPkZLCbINRT1/G0JDen8WHCPmn2Yr+XgX+/TqZw4BLkX
 /OUw==
X-Gm-Message-State: ANhLgQ1n3Yxl66yd5+ua33W9djcEYb7zkuF6enci1QDDfMMyD+nucW8M
 GQYGHMOfEvW1GDwhBWJaPFc=
X-Google-Smtp-Source: ADFU+vsbcw4rcvimyCnA6PJVUVnMRN0NAEKodMUwcQvB+YmthLNI/yMnz9IvZqCGyifYCK9lhcBn7g==
X-Received: by 2002:a5d:56ca:: with SMTP id m10mr4782708wrw.313.1583934720965; 
 Wed, 11 Mar 2020 06:52:00 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8dc:e796:e7da:a319])
 by smtp.gmail.com with ESMTPSA id 138sm3183811wmb.21.2020.03.11.06.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 06:52:00 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: David1.Zhou@amd.com, hch@infradead.org, jgg@ziepe.ca, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: P2P for DMA-buf
Date: Wed, 11 Mar 2020 14:51:52 +0100
Message-Id: <20200311135158.3310-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the third and final part of my series to start supporting P2P with DMA-buf.

The implementation is straight forward, apart from a helper to aid constructing scatterlists without having struct pages we only add a new flag indicating that an DMA-buf importer can handle peer2peer.

The exporter can then check if P2P is general possible using the pci_p2pdma_distance_many() function and if necessary can also clear the flag.

The rest is an example how to implementing the necessary functionality into the amdgpu driver to setup scatterlists pointing to device memory.

Please review and comment,
Christian.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
