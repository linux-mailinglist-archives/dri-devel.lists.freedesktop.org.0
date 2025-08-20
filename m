Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B42E6B2DF87
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 16:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB9E10E763;
	Wed, 20 Aug 2025 14:37:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f8xgm3jj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CE1810E75C;
 Wed, 20 Aug 2025 14:37:43 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3b9e413a219so5221606f8f.3; 
 Wed, 20 Aug 2025 07:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755700662; x=1756305462; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/h5WgUnURJmKBz6rjpCrYx59xCj8F+hnE2Z4mDxSI2Q=;
 b=f8xgm3jjl6ULfFlcOvu4/3ofX4SzzESuy2x5Ru7gM9krsyjCJgN4B50p8dItUMY6yf
 goecWhivAa690eDDUkNQhKodpsWMbjjC7vR5qrt8zTGprwxwmWDmMU5mTRsXO0gIa6WB
 PBE6V2lrlz7VYIgL01pNBPrMI0/htHnhIsITSDdHPwMF/aIVEQ71xI+fxulAs/GD2o4p
 76Ls7NeKxnlgo06N1VWCicoSz/Vgl9z8JMcuKsGwwDW2b8RM3qOZDwlEZ/Uz2eEGv47L
 kJeqIJ3l+R8jX3a3a6HwKHCWz/nPKX5aHE1wIZ/tNxr778nNNxqT0AdkFOidbK8+o1qC
 xn3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755700662; x=1756305462;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/h5WgUnURJmKBz6rjpCrYx59xCj8F+hnE2Z4mDxSI2Q=;
 b=eqbvAW7inmX4c4bnw9WPPgTxol8gmzH9++MHGKAQd/t/8OYToyTaKv2b9TrU0hWlog
 Alm8Es12ptivbEC6IxkVP85Q0k9ucWL4OOUcbkVezPbj9WSD7RxJ04oa/uLl92TLYkpQ
 AKQvMG/iOJzC6sTUN7Fjg9bSj0txDBDOYU1vtZiSo8MVVX8nsetFwCXhJ5dY08Y8Cd5L
 +RmIVbGSoziwi8DeEGMNPz06OYiETYuoOdjRzKeBlkmU165ReYDS3pcdA74sYMWavcok
 8WiIgcg/oxByUUqBUOPImhXqSYOyJpYaeSy20qbPRLM42MDrXQzvD45J0Ij18cPbxm3h
 MQlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUs8Gpy/I5gJDxby3yKMnVAnTIYQG8XW/RxSg4ukB/gVMg/TB8g+V0YSUNHdWoq+3/brPtQDEqZ@lists.freedesktop.org,
 AJvYcCV6x5MyFSs/4ydCos6k+ulXjN5+ogUisPURWCD53kJmGBy9z/w8cwY5YMb3yCRw1CY6T6q0NrZVAIhJ@lists.freedesktop.org,
 AJvYcCW85IKLV0XMrLXUm69yWnwpmJBh65v/n7owuscZMJEDcWvqfq/OkdQSuf1YlrYI2JiqNoIBLy/kwdSU@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyS3Tlj9aZ4bSrf129tCulv5wVYD3xodefFRdsNwRnLAqBr2DtD
 f+fB5qoIpDM5URVHiPMO60eAKNoWBfeSHSHJPKB9mqVeX5uhP5p1CBScqdX9QQ==
X-Gm-Gg: ASbGncukQJombH8rAdRGuEC4sYs74eZ0WtvpXHWymv+N9SQkvxcGGqTDB+A5537idfJ
 eSEUkUlSHX8/WzCje1zqn4zwTapcZM/uboWCt9sarlqLcyfZxR3ROrh3b1R8yQRybuxx4YFzClp
 4lEJfupG7WVA7yVxE5/Rqf24T3fFz7KDYmUW6/zy3kIE1DpDXgUX9M3sfU9s9sDV3KtEJEl6B3q
 vlLhsdLCOt1XdDWDtBxGmXq7xyY4I01ZOTDup7lLqjvtORK6CRBrwJNSZXiE5HF0UU7HDnsvG0D
 M69wdyvCQtYzApH1kreSwwKwkxfYvML3T++bDi/0UluRjGAFCifpqtuTqvX3kbRb+C1kAy1lVXb
 u74BIT5nxPfbdxlv4g52+GuMjNdGsPXZe5aI=
X-Google-Smtp-Source: AGHT+IFlIZ6/tJ89WsmhsHbBVGGH2HYC8H+uJsmdtnLvVwssi83j9MwXW/m6IgCdY5cNkUWzI98S/g==
X-Received: by 2002:a05:6000:2409:b0:3b7:9dc1:74a9 with SMTP id
 ffacd0b85a97d-3c32e6fe70cmr2407135f8f.42.1755700661762; 
 Wed, 20 Aug 2025 07:37:41 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1579:3800:9446:56c7:e203:3b9c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c074d43ba5sm8090404f8f.22.2025.08.20.07.37.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 07:37:41 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 x86@kernel.org
Cc: airlied@gmail.com, thomas.hellstrom@linux.intel.com,
 matthew.brost@intel.com, david@redhat.com, dave.hansen@linux.intel.com,
 luto@kernel.org, peterz@infradead.org
Subject: 
Date: Wed, 20 Aug 2025 16:33:10 +0200
Message-ID: <20250820143739.3422-1-christian.koenig@amd.com>
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

sorry for CCing so many people, but that rabbit hole turned out to be
deeper than originally thought.

TTM always had problems with UC/WC mappings on 32bit systems and drivers
often had to revert to hacks like using GFP_DMA32 to get things working
while having no rational explanation why that helped (see the TTM AGP,
radeon and nouveau driver code for that).

It turned out that the PAT implementation we use on x86 not only enforces
the same caching attributes for pages in the linear kernel mapping, but
also for highmem pages through a separate R/B tree.

That was unexpected and TTM never updated that R/B tree for highmem pages,
so the function pgprot_set_cachemode() just overwrote the caching
attributes drivers passed in to vmf_insert_pfn_prot() and that essentially
caused all kind of random trouble.

An R/B tree is potentially not a good data structure to hold thousands if
not millions of different attributes for each page, so updating that is
probably not the way to solve this issue. 

Thomas pointed out that the i915 driver is using apply_page_range()
instead of vmf_insert_pfn_prot() to circumvent the PAT implementation and
just fill in the page tables with what the driver things is the right
caching attribute.

This patch set here implements this and it turns out to much *faster* than
the old implementation. Together with another change on my test system
mapping 1GiB of memory through TTM improved nearly by a factor of 10
(197ms -> 20ms)!

Please review the general idea and/or comment on the patches.

Thanks,
Christian.

