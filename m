Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 490ABC580AB
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 15:53:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D2E10E823;
	Thu, 13 Nov 2025 14:53:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="liWHr7dJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 647FD10E820
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 14:53:36 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-640bd9039fbso1724368a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 06:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763045615; x=1763650415; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=2KuY4uk9dx+SEK4R72zOc8sDn7Cu3S//j0y0j/oIKkY=;
 b=liWHr7dJWqs8+xMVtdKDuVNdTdioArAPEJpe7DMLwLZ/RV51TBmgat7SvtRBnvLHnn
 oqwaLTlHruy/tmJ/8tdYP0uYlbRoGvg7YN7gw8cWLWjvuh940hAZjEkijLWiu4nl/Dyr
 61Es/EoTiSA6KiK7fimuncERP5rTMWLb4+oV3GoCyVu63rnR4J+6tKXZosSWSX2/A/cw
 OCWVC4B7K3udaHpSlZRL4RwvI+/Xl1qJ925KQ2jegbVJ6QQ3aGh8mi7ioFSv9lxtpCd6
 9gL2VnnuCTUI+AewAL1APW53YsujfYg4X7qpppCc4Y+j+KAOS3qY+4EAh/7lJUou3Z/9
 PyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763045615; x=1763650415;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2KuY4uk9dx+SEK4R72zOc8sDn7Cu3S//j0y0j/oIKkY=;
 b=OeDtdX1yt11JrLxq+uqkiZNbEng44U4DdQAw21Q5GtPfL47C9zd2/9OHPw5PEJ27pn
 qyQ0OhtdXdG8tdBuptW1PlS8IFZmbVXIzMk+J73xd1ZTPoRf6wWGNweFu0hSoraoYS7I
 /g7g6bMpOpDvU1NsJt12tpuUUOVhqSRO0xCdwxwGv7FE2gSenUOmUG03klzlX9/POBhL
 eBxorFWLVmey68nWt40FRYmGpU66Y+tVw5wEuw3IdJY1boUvTba48S0BPCS9VJg9hLcS
 uohWsmS/tv0SN+qcAOfJIrwG3xkXGldnMNvqa9Y0yStiohueh+tVlW2Gb0awnwYgiiCQ
 zxEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqX0jt2URIdxv/6j3tpr+F+LBFlZAqNEF0Da/nICJ7i+7YEQaK2IG0x4MVt4mm/9veNnqBpBWSFDM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfPg7JPlJbdzQ7iJJO9f2flmHZnVE/3tVl44iY6gcyRQH1u2qD
 T91afx84sv1aTRIYFi6dGb6422i17F/52lhdxP0JiU+f7zvLtwixDvp8
X-Gm-Gg: ASbGncvVEf9+9mu5s3UQn+tHrF+uPSCuFHQ0OmwvbNBcBAjtGE7FjTPgwX1nB5b5zvz
 Re7DEta5TuliPv3KlKgRtkT3Fv4eDazA7BoYVAmO8T2MfZvpdKB33nVK4iJ7m8C1mFpD2NYrn1L
 w4IlBboL63tTXsK4XsYG46dPTUO2B0A4yo0cQqWCE/wBHpV0PMQwAcp5wj8GJs2HAyzOWMUvomf
 AXJ8G7Z7sUIp9E5nAkzCurXiguwXMMfV/ZcRGJDoWbVUrdZuX21lojWojlXYvXIuEq9TFY91IJD
 WZhoQzaxaumCUMEfxjP3Ag5aehTas9xLVRbd8xrUrm15wF0xYoYVJZh/bRWJjEczsFPkkGCaPJ1
 IzDirJ7ly4G6F982geHxWzj4NF6YkVaCwqX4kHYJrkAVjxE+Crk/4GSRRdozQgpg4UvwIoNYqQ0
 2+BJFULepl60U=
X-Google-Smtp-Source: AGHT+IE17n8JQmz8ZzOanQPyu0ficEa1gOkY5xc57eixhccSjQy8+v1v9r9GRlWtfqrRxGWCG8nk1w==
X-Received: by 2002:a17:906:f597:b0:b04:32ff:5d3a with SMTP id
 a640c23a62f3a-b73317a7930mr732977566b.0.1763045614394; 
 Thu, 13 Nov 2025 06:53:34 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:15aa:c600:cef:d94:436c:abc5])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b73513b400fsm173747166b.1.2025.11.13.06.53.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 06:53:33 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org
Subject: Independence for dma_fences! v3
Date: Thu, 13 Nov 2025 15:51:37 +0100
Message-ID: <20251113145332.16805-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
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

Hi everyone,

dma_fences have ever lived under the tyranny dictated by the module
lifetime of their issuer, leading to crashes should anybody still holding
a reference to a dma_fence when the module of the issuer was unloaded.

The basic problem is that when buffer are shared between drivers
dma_fence objects can leak into external drivers and stay there even
after they are signaled. The dma_resv object for example only lazy releases
dma_fences.

So what happens is that when the module who originally created the dma_fence
unloads the dma_fence_ops function table becomes unavailable as well and so
any attempt to release the fence crashes the system.

Previously various approaches have been discussed, including changing the
locking semantics of the dma_fence callbacks (by me) as well as using the
drm scheduler as intermediate layer (by Sima) to disconnect dma_fences
from their actual users, but none of them are actually solving all problems.

Tvrtko did some really nice prerequisite work by protecting the returned
strings of the dma_fence_ops by RCU. This way dma_fence creators where
able to just wait for an RCU grace period after fence signaling before
they could be save to free those data structures.

Now this patch set here goes a step further and protects the whole
dma_fence_ops structure by RCU, so that after the fence signals the
pointer to the dma_fence_ops is set to NULL when there is no wait nor
release callback given. All functionality which use the dma_fence_ops
reference are put inside an RCU critical section, except for the
deprecated issuer specific wait and of course the optional release
callback.

Additional to the RCU changes the lock protecting the dma_fence state
previously had to be allocated external. This set here now changes the
functionality to make that external lock optional and allows dma_fences
to use an inline lock and be self contained.

This patch set addressed all previous code review comments and is based
on drm-tip, includes my changes for amdgpu as well as Mathew's patches for XE.

Going to push the core DMA-buf changes to drm-misc-next as soon as I get
the appropriate rb. The driver specific changes can go upstream through
the driver channels as necessary.

Please review and comment,
Christian.


