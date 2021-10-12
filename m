Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD2C42A618
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 15:42:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 793ED6E990;
	Tue, 12 Oct 2021 13:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E3926E990
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 13:42:14 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id t2so67148919wrb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 06:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kynesim-co-uk.20210112.gappssmtp.com; s=20210112;
 h=from:to:subject:date:message-id:user-agent:mime-version
 :content-transfer-encoding;
 bh=hwS9aDxYfM0NlbaZFVetR0eqXsuI0V8eGJKsRRT/jAA=;
 b=VaAQNXg53WlnR1EQCiKCv6O1hpbSSuhDKdzKBlQs7aqQnQ6orZgmxp6dVednqwGvys
 +EwqrLr/UyF84pUsbClCSnZGJr9W/7A8auR3AO/afhEBHCgyV6qIhHvDLeKSyPUY4OTj
 +6p1agOK2PYKwWkz1qtzpoiTHE1wiOucLSBbPx+EXRh4QKyhXy/KC911CeUwAHukxJET
 1rEo5JZrDaohIoW64BXUzlqdJEySOqjt0i7b8e4YmW4fy50GW7/ukjy3UdRG6Hk0lCMc
 M6A+m/YO+x/161eDA4i1PD/5XrOinSG9R6B3eWzXAYQ8+540A8H74BFr85Eg/8wv/pVF
 VUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:user-agent
 :mime-version:content-transfer-encoding;
 bh=hwS9aDxYfM0NlbaZFVetR0eqXsuI0V8eGJKsRRT/jAA=;
 b=6ZV5Yt+zFNexneRLTi/xyHITNpQA6p8j5iZs0wvonba52xSvfpd/uAQefZekTX+9xv
 j33Yc2KM5s1ApWsOwMf84vaLhaLbm8fSUs6eKNQb0xLxW2rArKBwIMe1mP4tsQa9dEUI
 8an2ihBN30curuZEC8G0a91kwXuLEIUPePDci8CbHMHH3wyGKUpYQQwoK4IGd9754Nzv
 u+kcflyXy9L13/Aoh9r7qQaCdDd7kox4S+dYXk54n9emnr9GuEU0YE9c0eq50GX2W6sb
 KV66XqlbGylKyLd8Hi7jVUB4WuTxnVbOB0JWE/L4NNXOTjVCbmKj2kzzAqZUNDG2k8Fp
 F8PA==
X-Gm-Message-State: AOAM530UjTsEDDLSj6erSXDSPH2Ht3eSpffXFmLLCH90sgW8o+SKVvv8
 ntXyXzeFA2tYXtXoHDQDXkoUFkVnMB2SJ9cC
X-Google-Smtp-Source: ABdhPJzVpCJM3pRiBSF+VzNlTd5tLFbbIxywH8hzmZe37Ee6IEktSvQ7GchJzQyrMZx+xKs4Nhh74w==
X-Received: by 2002:a5d:6da9:: with SMTP id u9mr32096842wrs.84.1634046132636; 
 Tue, 12 Oct 2021 06:42:12 -0700 (PDT)
Received: from CTHALPA.outer.uphall.net
 (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
 by smtp.gmail.com with ESMTPSA id w11sm2446423wmc.44.2021.10.12.06.42.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Tue, 12 Oct 2021 06:42:11 -0700 (PDT)
From: John Cox <jc@kynesim.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: Should multiple PRIME_FD_TO_HANDLE ioctls on the same fd require
 multiple GEM_CLOSE?
Date: Tue, 12 Oct 2021 14:42:11 +0100
Message-ID: <mg3bmgt12b5s7qlqn1gkc5q8f75dgfu91m@4ax.com>
User-Agent: ForteAgent/8.00.32.1272
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
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

Hi

I've a question about expected behavior. I am using the "vc4" backend.

If I convert a dmabuf fd to a bo handle twice using
DRM_IOCTL_PRIME_FD_TO_HANDLE then I get the same bo handle both times -
fair enough.

If I then close it twice with DRM_IOCTL_GEM_CLOSE then the second time
fails.

Is this expected behavior?  I think I would have hoped that the
PRIME_FD_TO_HANDLE ops would have incremented a ref count on the object
and it would need to be CLOSED as many times as it was "opened"
otherwise one bit of code can accidentally close a bo handle that was in
use in another.

Many thanks

John Cox
