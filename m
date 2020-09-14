Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D0E268C30
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 15:29:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 987EF89709;
	Mon, 14 Sep 2020 13:29:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD9389709
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 13:29:30 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id g4so17638483edk.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 06:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O337qWgiQtRxWseaQqzKcsApKROYygDiI0vsqDOyWvw=;
 b=FJYW5Zpkr+69Ontc35YOWyp+mL3+YJfwB6//npnOq0Ga13hSRTyG9rqdWj4+XoSTwl
 0uaNEpWiH5ReO87er2LlifBH3NPFWwDgSJtyPPqhcyG9S/rx7NEmE2AK4OmD6az3c7DC
 ECmjZ+seRByPUAp7C5IfbE7h8FYRsyZttir92Zt789sOyIpU3j3rWB5nvqqs7dr7cMO7
 peRappoBTy37hf78g1FzRQmgX/YXKNbYhx8gcXWfsYlOOW3rf6mbLtBBMJyHEnWS3jjd
 9WjyGB1FJEwRD3WS9vt6zSYCrduQ5EHUPtPT6cB1Pg5lJ5U61W3Gr9AcU4++WYHupOt9
 R9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O337qWgiQtRxWseaQqzKcsApKROYygDiI0vsqDOyWvw=;
 b=JqumAYjH3WVtGyb/RKFAQ1J+Pe+lPM+8s/r6beV22XhqGiAE6ITFB7mlbJtm/jlUsp
 qfxAQgno4NfGT2REh1EtrJWckLqabg/WPdKTuP9VkliIO5asVziklvs4MMI2jIRK7ma5
 wo4AFekPO0Ra3Hx2AGjevvcTrRiXaR7ciiJnzKnnz4JyjlKWPO2oqQA11ByilKSJ9xgY
 pvbagqW5jyFP4AyqCuaoHoAKoHzOe5TJYMgiH063QZLV2Hcp/CyZKOeu9FEI5ed/x/w3
 kzMYVkDUbG6ORVDZF+VCvtO8k2bfsOLTZtpVyyFirAAylOa7yIM+UBTjg/BTa92bh3QE
 aHJg==
X-Gm-Message-State: AOAM532UMdH0/bY0L80E/xoN7WzAlm8+XQltcJ6lBcx8psBUI52InRKl
 LMxG+dIjzAFqDUHRF7LX6e8=
X-Google-Smtp-Source: ABdhPJwJsiXZY3KpcwY1vzYkVg2ohf4EGDVpkoGXaNUtWvR8WeUIIoXfyp3ei6G37Iy9uvNZbC5ExA==
X-Received: by 2002:aa7:d78f:: with SMTP id s15mr16965480edq.322.1600090169251; 
 Mon, 14 Sep 2020 06:29:29 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:6179:d701:8021:da3d])
 by smtp.gmail.com with ESMTPSA id d6sm9575625edm.31.2020.09.14.06.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 06:29:28 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: akpm@linux-foundation.org
Subject: Changing vma->vm_file in dma_buf_mmap()
Date: Mon, 14 Sep 2020 15:29:18 +0200
Message-Id: <20200914132920.59183-1-christian.koenig@amd.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrew,

I'm the new DMA-buf maintainer and Daniel and others came up with patches extending the use of the dma_buf_mmap() function.

Now this function is doing something a bit odd by changing the vma->vm_file while installing a VMA in the mmap() system call

The background here is that DMA-buf allows device drivers to export buffer which are then imported into another device driver. The mmap() handler of the importing device driver then find that the pgoff belongs to the exporting device and so redirects the mmap() call there.

In other words user space calls mmap() on one file descriptor, but get a different one mapped into your virtual address space.

My question is now: Is that legal or can you think of something which breaks here?

If it's not legal we should probably block any new users of the dma_buf_mmap() function and consider what should happen with the two existing ones.

If that is legal I would like to document this by adding a new vma_set_file() function which does the necessary reference count dance.

Thanks in advance,
Christian.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
