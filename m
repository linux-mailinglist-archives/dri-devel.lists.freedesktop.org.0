Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB43C86A2B4
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 23:41:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A40010E9A3;
	Tue, 27 Feb 2024 22:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="o5B2yp8b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FF4F10E9A1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 22:40:54 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-dcc73148611so5166848276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 14:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709073653; x=1709678453; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=l24av5cz46t7M7tI2luq7oGX/wa+cXf3Hc4YW3YHjSo=;
 b=o5B2yp8bTPPwBJzG94mZg7JpvSoXu7PRT2rFC4Mib5Z6Lhp+pPy2GjUvqNfqXrq8eY
 ZPsOxxhl4TTAeVlPUyb/YnwLVYutqps9TWrrwjP2hGVrTUH6S8hDbyN5JlCjIiQhJ5tm
 06swwgNuEsmzDQhyoIwxMobimo3JP63eVz4ogw+Coyp1GtdRxFxKFseB5V4hK96CgXRX
 ZE6WHBsz7hfBJV5g7BlNu3Z21RjuVTr0aiBf+9k/sGQgB4BcKjls4bW9hwr0gGVM3KSG
 1hTcY2A/i6wn7M3GPcr0Pym1xJqDUGRatxi7jubURKftc8vJbg2bvpfQgLyDCrYGCA5c
 CNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709073653; x=1709678453;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l24av5cz46t7M7tI2luq7oGX/wa+cXf3Hc4YW3YHjSo=;
 b=rFbdXKf7t2kBeXzFFJeJvoDj08Lh0yIeW80oTnyk9Fdoq79XLvvf2/aGIr3SYXKNHD
 vRK7TCSL77HsIfKN7X3rQKIZCg64i+LC64zMBA1g8NluUWw9Y3F6GfWLJiqs6yKj9FHS
 0/q0KIiZoJdPVDCqSnLuzwuXSxIFVx4NinVH6w6lMoah4cf3rIt0GlG3+hIBO+RQvn4B
 qEVgYwtsxRUng0+ohPBaQ+mH37rBE3LrrQ/ay0UiNB6ze5HTVUFg4YEVuPtPr9NpgpEA
 dgFRCMuKydkNE9OAds5sSvbRDCLOfGxMk3k54YjewZ4mvGLPjLoM1AFw8jDU+qyKpzWD
 enWw==
X-Gm-Message-State: AOJu0YyFdS7SKwCC2mhmqAmapNphWrxbpwz6P5kGSjctZ3LZ/sa6KDnX
 cW8BczVbAohAmdxe4TuoyrJn3YohbzCZ7oDMBmLAXPcoLkVgZ7e4nj0HchUB5NyqgFsBwyzRLk9
 kqQz3Os4I3ihdidLDyKFYZ1su/S6TRupmpXFqRqs8EYNM3osIvLs=
X-Google-Smtp-Source: AGHT+IF7JmZrAwSzE5u2YUoyhCfxcW6ZoHVqg/vYI0u+8CvfTAGOQdSqPOy0FsY7FSJXpRenAcBfjlKR9Cj3074cOP4=
X-Received: by 2002:a25:9e8d:0:b0:dcd:5bdb:4aa4 with SMTP id
 p13-20020a259e8d000000b00dcd5bdb4aa4mr830952ybq.51.1709073652982; Tue, 27 Feb
 2024 14:40:52 -0800 (PST)
MIME-Version: 1.0
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 28 Feb 2024 00:40:41 +0200
Message-ID: <CAA8EJprfbMs_3PnpebhVg=NVrO5zc23cgx=1f4HAKLnT5b9J6Q@mail.gmail.com>
Subject: DisplayPort: handling of HPD events / link training
To: "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <dri-devel@lists.freedesktop.org>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>, nouveau@lists.freedesktop.org, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

We are currently looking at checking and/or possibly redesigning the
way the MSM DRM driver handles the HPD events and link training.

After a quick glance at the drivers implementing DP support, I noticed
following main approaches:
- Perform link training at the atomic_enable time, don't report
failures (mtk, analogix, zynqmp, tegra, nouveau)
- Perform link training at the atomic_enable time, report errors using
link_status property (i915, mhdp8546)
- Perform link training on the plug event (msm, it8605).
- Perform link training from the DPMS handler, also calling it from
the enable callback (AMDGPU, radeon).

It looks like the majority wins and we should move HPD to
atomic_enable time. Is that assumption correct?

Also two related questions:
- Is there a plan to actually make use of the link_status property?
Intel presented it at FOSDEM 2018, but since that time it was not
picked up by other drivers.

- Is there any plan to create generic DP link training helpers? After
glancing through the DP drivers there is a lot of similar code in the
link training functions, with minor differences here and there. And
it's those minor differences that bug me. It means that drivers might
respond differently to similar devices. Or that there might be minor
bugs here and there.

-- 
With best wishes
Dmitry
