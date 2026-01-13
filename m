Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5508BD19D32
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 16:21:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5521710E4F2;
	Tue, 13 Jan 2026 15:21:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="E7sbqdU4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2E0D10E303
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 15:21:29 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-47795f6f5c0so48061245e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 07:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768317688; x=1768922488; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J1dWJcUFzwempxnrfnqw/Kviebg2qhRHXbN655YU35I=;
 b=E7sbqdU4svFzn3D9J9l2IwrlU2HbDJiFMlBq2WwzJK9oO/CoGNKm5sW8ZwxgjwxKd+
 kcrdm2Hw65LOyHxXwHxnZItu98AlNiIxcG9NJKKvGe9a7E3HryfkAyFsdlholkgI0q3p
 PvNxNjyDll+5yysqjyZIPzcFW5vU/ZArm2t7BiW7fYKJVqCkn2wwU2yaBlLMK368aIs6
 pLzU5UHHdqnZwKA7qRZ+5tpeigpI32AlsXCn+l/Ht8PjZrj9GPsMQ3ReV1Uhjz+glESp
 pFW0Aryg0XiWDKYC8+jIMJrS1IZ6FyiPwOdLg4jZZ0ef8kCV0SnDWaLhr+cMjgqm8ejx
 NqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768317688; x=1768922488;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J1dWJcUFzwempxnrfnqw/Kviebg2qhRHXbN655YU35I=;
 b=Pne36F6QbUyqSe9Ayb5a05UUCZWvRzB8A2kzwsA53sYD2Duz9KOFouarXIl8CnpKhh
 dz7D98JordyJFOH/UmZ6acEcYDE7ThLSnW/wyb49A3btVGYuHmRuuKZzW9XuhlI+wpbm
 gvrfurvQxVWVeuinm3LGxQ5ltvnJsA8DndfzIg4TIjJN4FAGN2oam+UQKCrk/fBtZwjf
 g1KFcbU0xynnTtb5A8IPnGzY0OOkpqgj4HzfhG5WQOdO3D86sNcI/8euuWLgZFqhvnOe
 Ae/ueWMsIKmPlDYSMF5gEh4To+1baMv0yU10nnUqozTTWHGcwC4Rzl6Wi5Ss8PMvOe9G
 cAfA==
X-Gm-Message-State: AOJu0Ywj6YBSLCIgACeYmsR4ag/+CtRNblz+o80769uzxZMe3xoJUTzR
 Ru44B9fhclxdqkVD5XpgdpQ7i+AE2e8bqniSOfDXbVcda1U6CDsiF2jP
X-Gm-Gg: AY/fxX5CGfBEBOys/CnRkhiY8v/telcGx2AhbsGXlkhrZLIjanX6CkyvktApQ1IPg8a
 jqBDb50pzAmnv6upwevsmSnMVgk1j6MIA6Yk44EbGCsCp+YzWiyIZGQdAxtq9cyPYy0bqVbp+4w
 3ZEJGmKCGJrc20LDE1mcanA/Y7G/R3gp+fUIGAQ0i3cywneNYTTDUEVigapXBO85uPix047drly
 eqAIu+PGM0vREFTIFnGrjqqvFTrRt50tKwIAwZXMv6KvUOVrzdd1/K35ndyH6jLKDTwP9gIOhV2
 XxUit6uVf+zsqQZo18XpyhnXrq4o89LHm93UCK4d6XNGcFFxm6z+8oF+g/lWOs97pB1ofjIJX8B
 TY5qjftHktQ21TwBciJFxE3SOJQhVH1/lwRFCnEUZ3CChh0g24gZSPi8AKONvp9fChzfxSZo56A
 l5SVIgnLmADIgFNHcLwz+Xga4=
X-Google-Smtp-Source: AGHT+IGjIUEnewA2L+V9SoTvM1a721OQqOdT2FPDelYdlyiQdNYBTR10cb44NTqBgJrYQhPJeCm/cw==
X-Received: by 2002:a05:600c:4f53:b0:46e:506b:20c5 with SMTP id
 5b1f17b1804b1-47d84b5b496mr224286865e9.26.1768317688062; 
 Tue, 13 Jan 2026 07:21:28 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:141c:9800:1651:dfa:9e48:25d5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ecf6a5466sm129518405e9.11.2026.01.13.07.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 07:21:27 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, tursulin@ursulin.net, matthew.brost@intel.com,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: Independence for dma_fences! v5
Date: Tue, 13 Jan 2026 16:16:07 +0100
Message-ID: <20260113152125.47380-1-christian.koenig@amd.com>
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

v4:

Rebases the whole set on upstream changes, especially the cleanup
from Philip in patch "drm/amdgpu: independence for the amdkfd_fence!".

Adding two patches which brings the DMA-fence self tests up to date.
The first selftest changes removes the mock_wait and so actually starts
testing the default behavior instead of some hacky implementation in the
test. This one got upstreamed independent of this set.
The second drops the mock_fence as well and tests the new RCU and inline
spinlock functionality.

v5:

Rebase on top of drm-misc-next instead of drm-tip, leave out all driver
changes for now since those should go through the driver specific paths
anyway.

Address a few more review comments, especially some rebase mess and
typos. And finally fix one more bug found by AMDs CI system.

Especially the first patch still needs a Reviewed-by, apart from that I
think I've addressed all review comments and problems.

Please review and comment,
Christian.

