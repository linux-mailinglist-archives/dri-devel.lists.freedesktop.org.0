Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E67A598B579
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 09:26:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B4210E5EB;
	Tue,  1 Oct 2024 07:26:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TN5xyO6E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65CF710E583
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 19:38:29 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id
 41be03b00d2f7-70b2421471aso2940065a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 12:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727725109; x=1728329909; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=AKT8LYqobBT2BaRfv06utI0biZxWMsM1Ve8o0fYaoVk=;
 b=TN5xyO6ENTb64nX+OWQg99JgWVfQyoVAhL1qr2dIDy2joQZdMPL7OgdZBTG8URdvpI
 PkNJf9FYuEOIPQ9C2EouSSZUyYAUsuHC0IYzwlFwJm2XM/lFMhD4Ber1syXyfa5wGQTK
 IKmM9fTxQI8uVy32ZH5Ks/zmDJHRLv09mqYr2zHOm9JSm3K8VBC/fHFHXR2aChZjirz8
 znk3e1x24X0lqShZpQEPHUXbJTybtO3UkC2QJVbfEyoVrqn22qu3KbsIVLWJfzcB0fMH
 l06uQfza4uSZZjQCEbptOyG1Cu+MR2cQ1jnXiu56Ivh48chKBZXryFmpitSUdo/8BtZV
 /fqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727725109; x=1728329909;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AKT8LYqobBT2BaRfv06utI0biZxWMsM1Ve8o0fYaoVk=;
 b=em+lJoCVa9hOgR5klEa0U1yGVAYge8kPiJeYZ5f8RO98oWbFSFSz6+54tQFOk8ogeI
 j+TfPVRHf44fZlVbxIxJDTjMm04ldnTOkcxnyTynbFzOdIahw9y6xqfwaFv+BE24G4/v
 jnNnTWE6vJkTwX5Sn0VtFIBTKfNzKeLyzq0GPNHztcKcrN7hWNs4c1m8Ipymh5qcY4Ir
 lsHIPP7Rsn8ZbDblZHI6rMLc2j0fWRBAQeig2TEvzCWtf4fGL+kYokUUiKWe5sSjmINn
 1sauEP9cPtXP2iezPc88xcRW3BqgLI7GdEQXlN8wzTIT4yZTcn9yPLFGV5zXPPvjYD5C
 K+TQ==
X-Gm-Message-State: AOJu0YxGVIQdGzn+KjIlJmJcykwLMb269qByTB1nPfifDle6F27dE63c
 mjIojsFM1+dIHICiHpWY6a/PnjMI/VAShMk4w5OH6jEjG56f9mDmQzCxJOzGgv2Lha+XMs3GPm1
 sCNmDRtAuM74B6y2Q3poijhe5rS0=
X-Google-Smtp-Source: AGHT+IFlaF5JPw0wUcDKRw6u7HGnsO/QXSTkRae9tKndIlj3EdkvFhzx8f7JyDR4nekb+7FS8D4QKjv096mI6FOoui8=
X-Received: by 2002:a05:6a20:d045:b0:1d5:14ff:a15f with SMTP id
 adf61e73a8af0-1d514ffa2b8mr9654739637.11.1727725108694; Mon, 30 Sep 2024
 12:38:28 -0700 (PDT)
MIME-Version: 1.0
From: Zichen Xie <zichenxie0106@gmail.com>
Date: Mon, 30 Sep 2024 14:38:19 -0500
Message-ID: <CANdh5G4Yz4+s342F3GHy6wNWNXXR6PTC2tRibfVjTAg=K_KMtQ@mail.gmail.com>
Subject: Question about 'dma_resv_get_fences'
To: sumit.semwal@linaro.org, christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-media@vger.kernel.org, Zijie Zhao <zzjas98@gmail.com>, 
 Chenyuan Yang <chenyuan0y@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 01 Oct 2024 07:26:13 +0000
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

Dear Linux Developers for DMA BUFFER SHARING FRAMEWORK,

We are curious about the function 'dma_resv_get_fences' here:
https://elixir.bootlin.com/linux/v6.11/source/drivers/dma-buf/dma-resv.c#L568,
and the logic below:
```
dma_resv_for_each_fence_unlocked(&cursor, fence) {

if (dma_resv_iter_is_restarted(&cursor)) {
struct dma_fence **new_fences;
unsigned int count;

while (*num_fences)
dma_fence_put((*fences)[--(*num_fences)]);

count = cursor.num_fences + 1;

/* Eventually re-allocate the array */
new_fences = krealloc_array(*fences, count,
    sizeof(void *),
    GFP_KERNEL);
if (count && !new_fences) {
kfree(*fences);
*fences = NULL;
*num_fences = 0;
dma_resv_iter_end(&cursor);
return -ENOMEM;
}
*fences = new_fences;
}

(*fences)[(*num_fences)++] = dma_fence_get(fence);
}
```
The existing check 'if (count && !new_fences)' may fail if count==0,
and 'krealloc_array' with count==0 is an undefined behavior. The
realloc may fail and return a NULL pointer, leading to a NULL Pointer
Dereference in '(*fences)[(*num_fences)++] = dma_fence_get(fence);'

Please correct us if we miss some key prerequisites for this function!
Thank you very much!
