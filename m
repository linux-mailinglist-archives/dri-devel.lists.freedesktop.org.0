Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9AEB0CAD9
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 21:12:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1DAE10E3A5;
	Mon, 21 Jul 2025 19:12:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="jPUqHwqU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8772510E3A5
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 19:12:27 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-4aba1bc7f44so32646111cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 12:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1753125146;
 x=1753729946; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/lUkAmcsFJuKtRa8jpai2ZZYWb/fYbdKwA84kAMpapI=;
 b=jPUqHwqUqOjdYGXf/4QAGaYYPgecZHMxZZi3obKb5aQUHjT5O2fYAlRxvxYH4rrJ66
 jFoJhYARmxq0DJ4NX8DYy50/4onbY3EIuxWwdemy3Few0mSpS99kW1fmc1R3ZtAL1YFP
 0PcxUSeZkYSsxuiW9QlUf8X1VpHlepCEahaIgHnQcI8uL4QKLDa3zLFA5BBcDYdwwpKn
 Czl10XEe7ng7GZlK5J/+XeLitRKY+OEIsWS01XwbKDZqQQpsRdqWzhhbH6GjB/oEfrff
 Lb1HLW8x2nqvHXoxpsLwaaKHkoGK3UsjuGwvMfKenn6HRh8uxIARTsff4gm/2rVSf7Rc
 DPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753125146; x=1753729946;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/lUkAmcsFJuKtRa8jpai2ZZYWb/fYbdKwA84kAMpapI=;
 b=hlOVvLyvfQyddk+IC8d0KryP5OVYSox4i4xZZet6r3OTUitlO0X7DNdPRaTWREJ1KI
 3TKwdWW+b5OYzbG7EiT/9CYKLxJUc1FQHQEXIr3Os8kTERs8EhNr1IsYXOKZVuzTUPt8
 EEGwW8w0TLvIWQ34JGf7ALCTu+EFnxXfnDnREpa0iOhPb8a58U7bivAQgw8lk8dWkXCh
 AzVO3b3qCxUwv8JGxjJb5zBvMqh3K4GB8zoGS2IhMsh1IilmzSXq4UVHsZ8uUE1j+SN2
 F+4NYEXAEfwACGncUWvfQr/XJ9W4neyFckG57NLidgub1AYsyOhshAWbUSVqSB+2v7Lf
 UI+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwAD7ZC7xV6B3BV8TGGfhlaXYcbQ+RzS8DCTT/6qXDDdbt/oZYXvcRfiU8lrgyR+IC1SlZZJHKQ+4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxabJuBTBWgQxd5bAwM26v2f7RVK5ITc0FqgIJx/CA1ey6gRpAW
 q3Bj36IEYGXi7bR+mCVhfgOQMSifut+8lJYH6CpzCi5vPrffW6EtnCfWE6dofg/8My0=
X-Gm-Gg: ASbGncs+DDj4yUNu/rmSD7II1Sw/ivNdR71qv6D7j8A+Ugki43SdjTzW8tPGtq2Jwqi
 zS3mZbuWiDq5/XJej/g6f9kylDrOc2Nj4iUxt8zowctJ/EWIn7N0tG7+tiniNPyNqoIOVFOqMCX
 6rHyNDz4MpyxpuWeWIu+1ebul1a4+SZ2qdMZrWE6vrFW9gEFl8/F7fhD1zkd5QBYKsTRpPKACUM
 bHi5vGpsLvaOr0/5lJWdD5opIz7kPSzOi9x29nmD88rWqnmqqZ0Ky0zGbpP3fUgXuz+h0dv8hn4
 veZQuYfOmndhNeOdlxAx6hWoNY8kb6//84XuqeQtvfGppPR+SdgNixIL0cOIrQoSreIvONxuaSR
 Lljr1BPMcVZbPsVUP9boTn9n68sWFN4MTYvk32JzOuQ==
X-Google-Smtp-Source: AGHT+IE1V8c9uplMGuY3pa4ZHwW+fD6G3k8YPKLQmOAwc6WL4bYVHqr7BUKzKekHOuoNGznzU/qCKQ==
X-Received: by 2002:a05:622a:4c89:b0:4ab:731a:541c with SMTP id
 d75a77b69052e-4ae5b72633dmr11924731cf.2.1753125146207; 
 Mon, 21 Jul 2025 12:12:26 -0700 (PDT)
Received: from m-kiwi.verizon.net ([108.27.160.38])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4abb4b24930sm44626211cf.51.2025.07.21.12.12.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 12:12:25 -0700 (PDT)
From: Mel Henning <mhenning@darkrefraction.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, ttabi@nvidia.com,
 bskeggs@nvidia.com, martin.peres@free.fr, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: Mel Henning <mhenning@darkrefraction.com>
Subject: [PATCH V2 0/3] drm/nouveau: Remove DRM_NOUVEAU_GSP_DEFAULT config
Date: Mon, 21 Jul 2025 15:09:13 -0400
Message-ID: <20250721191214.19800-1-mhenning@darkrefraction.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
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

Following earlier discussion at
https://lists.freedesktop.org/archives/nouveau/2025-June/047887.html
this series removes DRM_NOUVEAU_GSP_DEFAULT.

The first two patches are the same as they were in V1. V2 adds a third
commit that improves an error message in response to feedback from V1.

Mel Henning (3):
  drm/nouveau: Remove DRM_NOUVEAU_GSP_DEFAULT config
  drm/nouveau: Remove nvkm_gsp_fwif.enable
  drm/nouveau: Improve message for missing firmware

 drivers/gpu/drm/nouveau/Kconfig                 | 8 --------
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c | 4 ++--
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c  | 4 +++-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb100.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb202.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gh100.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h  | 1 -
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c | 6 +-----
 8 files changed, 9 insertions(+), 20 deletions(-)

-- 
2.50.1

