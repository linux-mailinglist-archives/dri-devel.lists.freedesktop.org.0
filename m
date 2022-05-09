Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C91C51FD99
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 15:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB3F10F17E;
	Mon,  9 May 2022 13:09:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89CA810F175
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 13:09:56 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 125-20020a1c1983000000b003941f354c62so8251880wmz.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 May 2022 06:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oQy5/C8/H4xIWaS7uuEEWSH0byVJQIpgnLnWaK+VkdI=;
 b=oBltIU2GNCeWVR3BQU5jEPqLbZC6sYes+/WBzGuaRJaWZiIimTBGGoRFNtZ6Ty1FGt
 e4DwDZsonwpKYqIIWKmkpDE1zfJAkt6J3EloaJDsN4X/R2JAsLuosCGgBRn7n8wwpQ0q
 N3lfhpzIP4rjGVUKsD5bQJRyUOznl9Q1JejRSYeZvaYYJtN/Z0Ah5VAsHACjbVMKP7OL
 Lop0E1qSxQ2f4bb1/0prHd49SpifQ6pxAaPGvGyxr3j2cFM61x7lRvBFy2CSmoq2l0Ky
 TjfZBXcTJ3mcMrrmB8VdVZD5Pa11W6EQ2m+Ad7L/84tY1wKADcAjRjOtQSPxzBvwukRG
 fcbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oQy5/C8/H4xIWaS7uuEEWSH0byVJQIpgnLnWaK+VkdI=;
 b=JBmYjXMPMmg16YYRy8J7XEXUTnrvpqj9dYTrlIU3OTv7TOFFxB8IzR4dT3iV140Fyf
 WIBKNgAFMlD9luQIPyyrkM6RMpyh7IUdcVs06k9pBkdCIeH1GD0iMbBHJZ5YBv6Pylkc
 +eKMEn1rKeBJNZKRFsGIYWZEBZiAzzmMVoeS5wyXGOziUAvnUg3v0EXrx9IrEqJZUa2N
 hp33Bx4L29GUnkCvxIOcAPym8xwc4rl3HXMR2wLTNSwjShcZOzw0O6lZakH/dg6beGyL
 AwEeq59prqmeLJ7QOwbnL9ccOqTH60/MOSjMvj2n5tS1S31mBV1snS8VI8ylzhSNuwF5
 +VGA==
X-Gm-Message-State: AOAM532JbipaT+o2BDD1lmqYf+EjJfZAkOmg0OiTT4cdCdqR8Nx+LBrQ
 /6NT9d0AsEruVztTWCroSys=
X-Google-Smtp-Source: ABdhPJzEV02z3FPqi2QplVe6L53O9RPruolggy+j32U01mXYGuohEGs52uL7pbv5g2C9Wq1BUu2XKg==
X-Received: by 2002:a05:600c:3ca3:b0:392:990b:af11 with SMTP id
 bg35-20020a05600c3ca300b00392990baf11mr15966260wmb.173.1652101794938; 
 Mon, 09 May 2022 06:09:54 -0700 (PDT)
Received: from able.fritz.box (p57b0b3fd.dip0.t-ipconnect.de. [87.176.179.253])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a05600c2f9000b003942a244f50sm18683385wmn.41.2022.05.09.06.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 06:09:54 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: bob.beckett@collabora.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch
Subject: Improve TTMs empty object handling
Date: Mon,  9 May 2022 15:09:40 +0200
Message-Id: <20220509130951.486344-1-christian.koenig@amd.com>
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

Hi everyone,

re-sending this because Daniel was requesting a background why this is
useful.

When TTM creates a buffer this object initially should not have any
backing store and there no resource object associated with it. The same
can happen when a driver requests that the backing store of an object is
destroyed without allocating a new one.

This is really useful during initial buffer creation as well as temporary
buffers and page tables which content doesn't need to be preserved when
they are evicted.

Currently TTM allocates dummy system resources for that because drivers
couldn't handle a NULL pointer there. Audit the drivers and then clean
up TTM to stop making those dummy allocations.

Please review and comment,
Christian.


