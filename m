Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB6D4059CF
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 16:57:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F2676E85F;
	Thu,  9 Sep 2021 14:57:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C75996E85F
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 14:57:23 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id b64so2102192qkg.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Sep 2021 07:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=eh9zb6x4R+av+0Ip8O73HGfErcPJrTHpqHsaliXsyNI=;
 b=hRnNCcGd2RVDUzc7JBZ6OPREbI1uIbT8ZtwGbdEcYgUM3Yq75qMvZJEIaq4xVyrzyE
 wdkCFVP90DRwX0/zdTyadfRP0NOdA/04Jp5Q+m6enUkXsIMXotwVu9qs6QJguP5hN+8g
 iizvT2+tE7pUCcKwCEOrdzgtlYgGvcyG+3U3ylzMpx/YzVew2ghz2d3h2gVaHqB0bSRm
 OMh/ZG3KiB7IaAA6sVviPUlB8MSaPWCnfY/AeSCN5AbqiNABjvVV+VK9L/aBE9uD0ada
 kO/sZO/CmnPU3qz9V/GYiKpCGltES40iDVzwzEi+sTGEbchrLhVT1XQ8heAgQbxKXlhO
 OBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=eh9zb6x4R+av+0Ip8O73HGfErcPJrTHpqHsaliXsyNI=;
 b=BauNxUwU1nfPk7d11A+ykwJ+pkDbHz6ctcXcfpQoJDYkUHF5BJTuj2UUIRG6JvBWoz
 /Yl6ky7Tmu+HrFxnM+pep7DPH8GqTybAAFhrvuwR24an4WUXvyuWr2HgNbVuk9NtNn2i
 Kr2I2a8q6mIbLR9Ztd8dUQ2tQO2h04t/+mdBj4x12wtmHovoK5WkOzQ4v2N77u0UnIOr
 dcKO2ss1Eo9IdMT59Ylp3wpSKS4aE4vDUvh3K5BR8jNMOT+8PNyh7xcpxzujddAcg0n0
 NCvWLX8ncAWw7WMKrfNRU+nBorx/zHFufpLyOmkidQk2E2HrecDaTj8nkADq+PFtX0E2
 RMxw==
X-Gm-Message-State: AOAM532+uJGcOAS0BN5+1vafkGQsGTXmv5IZzvpiPHJVHgKN3Wcnx6Q7
 UyLm+22G3vFRdJLPhDuRmHzGObuS2jIAKAkaBR8=
X-Google-Smtp-Source: ABdhPJwaiDHZ70fnbScVi9snrmpiBzoGUHN3EWLka4ihQMu/E80QoRASg1E4KkmCS/X5VraEZGlZVKg40IMgk+gSoYY=
X-Received: by 2002:ae9:f701:: with SMTP id s1mr3173369qkg.223.1631199442729; 
 Thu, 09 Sep 2021 07:57:22 -0700 (PDT)
MIME-Version: 1.0
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 9 Sep 2021 15:56:55 +0100
Message-ID: <CAM0jSHO+vBwJmB=bsYcdjzHFfnaLYSDrPYWNUmEe1BqmrVOBxA@mail.gmail.com>
Subject: i915 ttm_tt shmem backend
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>
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

Hi Christian,

We are looking into using shmem as a ttm_tt backend in i915 for cached
system memory objects. We would also like to make such objects visible
to the i915-gem shrinker, so that they may be swapped out or discarded
when under memory pressure.

One idea for handling this is roughly something like:
- Add a new TTM_PAGE_FLAG_SHMEM flag, or similar.
- Skip the ttm_pages_allocated accounting on such objects, similar to
how FLAG_SG is already handled.
- Skip all the page->mapping and page->index related bits, like in
tt_add_mapping, since it looks like these are set and used by shmem.
Not sure what functionally this might break, but looks like it's maybe
only driver specific?
- Skip calling into ttm_bo_swap_out/in and just have
ttm_populate/unpopulate handle this directly for such objects.
- Make such objects visible to the i915-gem shrinker.

Does this approach look acceptable?
