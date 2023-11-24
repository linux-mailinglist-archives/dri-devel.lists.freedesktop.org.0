Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFD17F86C7
	for <lists+dri-devel@lfdr.de>; Sat, 25 Nov 2023 00:37:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC4A10E376;
	Fri, 24 Nov 2023 23:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7180D10E376
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 23:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700869029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ooa83XnZj65XHeDd7bgPYl/MTM8ubdS8C8vvyOuquTY=;
 b=M870Swuu8lYdmL79OH+y8wWvjGgOUXbgMgNmFGKusV7h/0gAhyPD5l4WPC+HX+og2Jg7lO
 Zc4YBn7nPdNc8C+2WNOH1idwtLSolzhmxva8RjJJsAaUJffWnsej4XLwbdI1r0byq958EA
 rqwNn86azGRx8te5nmxelLvia5W80J8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-VHWAjgcjOlSW_CDV4fU7jw-1; Fri, 24 Nov 2023 18:36:58 -0500
X-MC-Unique: VHWAjgcjOlSW_CDV4fU7jw-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-a018014e8e5so188819266b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 15:36:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700869017; x=1701473817;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ooa83XnZj65XHeDd7bgPYl/MTM8ubdS8C8vvyOuquTY=;
 b=GETs7s1lxRqWiqLaKKqKWvAXKh0DvGFH59AcZY5csLXBJ9XiEWUy8IBcZtNgSNN19K
 zLOKCv0LwEYGj3rBszAd3Arp1mkBfhCaAhTyTXSedWMxJSp2lfi+uUZT7z2OBACoOkaq
 RNaN7CQTNadiEnA2c+KBqSexZF7o5UZUIOQldBQ3crRDZPZatkvk9Q0tTHCSnkCc2fD4
 Fi43pDTj3EEuX2wSH6gJ1xi77Jdur7GFMWRb/KhGv9w/wAflVLvgxb8M0LmC3DB+3syI
 FfaQTlXiYRGt9r7D0rSENdAN2tMg6Dd3ASJUOC4pgROaAk0JBkpt/lJys+O51zOC0d0H
 Dkog==
X-Gm-Message-State: AOJu0YwRE8zXMyocmLj4ja+xm/rnM9XNayexLgYAsuYrHLyIUDgb4PeL
 fLdwaOxs2vp9GYK0a6tB7Wvb5/nhmfL0s6wAPhaffjWjtKaZ4g0diszoXbGrWyoJjtdxar7h34Q
 tcoqm5TVkFO0Y5ER/UQsO/Zf1X0za
X-Received: by 2002:a17:907:1c82:b0:9b2:cf77:a105 with SMTP id
 nb2-20020a1709071c8200b009b2cf77a105mr4022194ejc.15.1700869016939; 
 Fri, 24 Nov 2023 15:36:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0CnBXqcfXTNkotvwAE2bu91Z/qUjDzY8ANBg3E/5DBlY7f4RMdUUzgTz20lXFJlJNuuFYAA==
X-Received: by 2002:a17:907:1c82:b0:9b2:cf77:a105 with SMTP id
 nb2-20020a1709071c8200b009b2cf77a105mr4022180ejc.15.1700869016658; 
 Fri, 24 Nov 2023 15:36:56 -0800 (PST)
Received: from pollux.. ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a1709064a4100b00a0b6b09b4cbsm150109ejv.8.2023.11.24.15.36.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 15:36:56 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 frank.binns@imgtec.com, donald.robson@imgtec.com, matt.coster@imgtec.com,
 sarah.walker@imgtec.com
Subject: [PATCH drm-misc-next 0/5] PowerVR VM fixes
Date: Sat, 25 Nov 2023 00:36:35 +0100
Message-ID: <20231124233650.152653-1-dakr@redhat.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Some major GPUVM changes landed just before v8 of the PowerVR series. Since v8
went in rather quickly (review process was finished otherwise) I haven't had the
chance to review the subsequent code changes.

Hence, this series with a few fixes in this context. Plus a minor GPUVM patch to
make the drm_gpuvm_prepare_* helpers useful for PowerVR.

- Danilo


Danilo Krummrich (5):
  drm/imagination: vm: prevent duplicate drm_gpuvm_bo instances
  drm/imagination: vm: check for drm_gpuvm_range_valid()
  drm/imagination: vm: fix drm_gpuvm reference count
  drm/gpuvm: fall back to drm_exec_lock_obj()
  drm/imagination: vm: make use of GPUVM's drm_exec helper

 drivers/gpu/drm/drm_gpuvm.c          | 36 ++++++++++++++++++++--
 drivers/gpu/drm/imagination/pvr_vm.c | 46 +++++++++++++++-------------
 drivers/gpu/drm/imagination/pvr_vm.h |  3 +-
 include/drm/drm_gpuvm.h              | 23 ++------------
 4 files changed, 63 insertions(+), 45 deletions(-)


base-commit: 46990918f35c1bf6e367cf8e0423e7344fec9fcb
-- 
2.42.0

