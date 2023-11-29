Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9AF7FE2B0
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 23:08:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFBC610E696;
	Wed, 29 Nov 2023 22:08:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D1010E68C
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 22:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701295722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EwDzdDItBJXcdcquSttPHmAm63Z9qClgG73YO2gODcE=;
 b=Wgyh1fYhd9fRxOW3tcH6zj8Wu7qu4VRR3bBhNhj1TR/YI7lInm0OrqDhLC+YIPcQo4e1pX
 g9ISt+XrmYJxfbqztXUpBnqIRWoQMjzszOr9LCYtLQv+oYLxgo/vzyT7W4wM+cN/mCFHw9
 qrLUIUPsWvnFLtttTXzKXPr9EGKoUl8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-aA3S8SZ4P3iuPyL4ASdkFg-1; Wed, 29 Nov 2023 17:08:40 -0500
X-MC-Unique: aA3S8SZ4P3iuPyL4ASdkFg-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-a177760d469so26487766b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 14:08:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701295719; x=1701900519;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EwDzdDItBJXcdcquSttPHmAm63Z9qClgG73YO2gODcE=;
 b=tz4tGtGtLy1LrNNM6vFyj5bHMsf5dOJfzaZT6WZYj6HS4i6MtCyXmv4AOi9aOg74j0
 Dg6SZK+Do1TICdJSyacQrE/yS/9rC+HEC5rQTVEEKtKgBKjmFS0/7xBhuqPbWo/cvaYc
 4sygCMW4uVCV8hRdbqz++4rT9Fktyqdqa0NSOqC0U4+Et5YDXJM1kbt/v3YDQhmcwwoT
 fBnk4CZ1TJOQE7QqO4O2GZ84Z7s6JFhrNfNvawi2vgstnl4UMgGnkiNDsV3O+4vxNIOa
 YTN33NlRMV3b4t7FEUn2V2kiSBW21SECvdjXONZByECa9/fjBCvhkGfT8YQEqRc8rYjL
 4/zQ==
X-Gm-Message-State: AOJu0YwjM3FxJAhGC70ce94rG/Hp3VJuJXj2gBWhEHu/veY6kCSQNK0u
 9e2A5LkBYJW1ufPmEeRUUwF8kzq9R4QqR0ijE2RIFjsJq9IGqY9qJE+1C4+1aJuurLUumHf8JTf
 MvhtdzuxWjEDCU1RdnmdRL4GrMyfx
X-Received: by 2002:a17:906:3fd6:b0:a02:8820:cfa4 with SMTP id
 k22-20020a1709063fd600b00a028820cfa4mr12351660ejj.32.1701295719420; 
 Wed, 29 Nov 2023 14:08:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSpZxd6lUeE167toP/YcYRTZtdRiDojthFKJUloBIdXRvKtOG8bdnDO/aG82E9od51VGUg8A==
X-Received: by 2002:a17:906:3fd6:b0:a02:8820:cfa4 with SMTP id
 k22-20020a1709063fd600b00a028820cfa4mr12351649ejj.32.1701295719172; 
 Wed, 29 Nov 2023 14:08:39 -0800 (PST)
Received: from pollux.. ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 b6-20020a170906660600b009fc42f37970sm8450609ejp.171.2023.11.29.14.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 14:08:38 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 frank.binns@imgtec.com, donald.robson@imgtec.com, matt.coster@imgtec.com,
 sarah.walker@imgtec.com
Subject: [PATCH drm-misc-next v2 0/2] PowerVR VM fixes
Date: Wed, 29 Nov 2023 23:07:59 +0100
Message-ID: <20231129220835.297885-1-dakr@redhat.com>
X-Mailer: git-send-email 2.43.0
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

Changes in V2
=============
- GPUVM: update function DOC comment to indicate the passing zero fences to
  drm_gpuvm_prepare_* functions results into drm_exec_lock_obj() calls rather
  than drm_exec_prepare_obj() calls.
- pvr/vm: use drm_gpuvm_exec wrappers
- drop 3 patches which were applied already

Danilo Krummrich (2):
  drm/gpuvm: fall back to drm_exec_lock_obj()
  drm/imagination: vm: make use of GPUVM's drm_exec helper

 drivers/gpu/drm/drm_gpuvm.c          | 43 +++++++++++--
 drivers/gpu/drm/imagination/pvr_vm.c | 91 +++++++++++-----------------
 include/drm/drm_gpuvm.h              | 23 +------
 3 files changed, 77 insertions(+), 80 deletions(-)


base-commit: 83dc1029dcf50b5b849b26679a1b3f860b85d79c
-- 
2.43.0

