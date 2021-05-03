Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCD9372037
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 21:15:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358B46EA21;
	Mon,  3 May 2021 19:15:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E9B6EA21
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 19:15:16 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id i3so7648138edt.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 May 2021 12:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:mime-version
 :content-disposition;
 bh=fyFJP735XQXj4LkTnGwzm4qSEE25PUlvsZ5m+5XoeTg=;
 b=R5TKedJKe8jFlf9lMHC2G4AqVWRJE0dTCT/4m3gzvsre1icWgKAlqnQ/n8OCP5qBu6
 OD201KjlWSPNGB7YCWZ0BEgT0iiYzJnMY8R9kBq7QxnWO5Ec69yWP5imZDzfjfI87Icq
 Vu9mz6P83IjWi+hHed0zvq1mo7iSp7BFBiuFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:mime-version:content-disposition;
 bh=fyFJP735XQXj4LkTnGwzm4qSEE25PUlvsZ5m+5XoeTg=;
 b=K6d+tlmjrX1tajVIKXckfKU0oIKhK0XUtGkOAxosY4HKcSRX5VvJ1Vc68QFp2/36o2
 P+NJ01LrXJaiIlhOjdzWIJiihnKWXBNK3wKz9+ihFZ2J2sLwa/vuH8E9v5ryWiEqOcPh
 PX09YmFWpPplERTyhdknIskd9CgzR04wEA7T1QLkTwpOhDsnFrsSHQZahdkt72u23ynX
 r2n+Q95v6GasSJ6KfprcjIQNJ61mfXwNK7UNh4+jTjUAWyqIjFW9y7/PDypcQVPHo5AU
 L4t3lAeu4KI0nOb63eqr6TDSiewLP0HoeOwzF16eCOqhciplGzOnZNJLUB9j+tIbUaO9
 435Q==
X-Gm-Message-State: AOAM530VfXDElN1mGCeuGrV0NlbNoZREMfa4AHCcf5JrlNr55qSl4P2U
 kq34me/nDVDXTtIsPQ0YX/qi5w==
X-Google-Smtp-Source: ABdhPJwHjMUFJwM40ARD1fhW9cBMZs1N9ixtJyT4oagDjJlQdPziQznBELdraes2Gu2qzngLQrV4Pw==
X-Received: by 2002:a05:6402:c8:: with SMTP id
 i8mr22275371edu.57.1620069315093; 
 Mon, 03 May 2021 12:15:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id sb20sm255703ejb.100.2021.05.03.12.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 12:15:14 -0700 (PDT)
Date: Mon, 3 May 2021 21:15:08 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PULL] topic/iomem-mmap-vs-gup
Message-ID: <YJBHiRiCGzojk25U@phenom.ffwll.local>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: linux-samsung-soc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

It's still the same topic branch as last merge window, but the name isn't
fitting all that well anymore :-)

Anyway here's a small pull for you to ponder, now that the big ones are
all through. It's been in -next almost the entire cycle, I've only done
some non-code rebases due to the -rc1 fumble and to fix some commit
message typos.

Christoph Hellwig also looked at these and aside from wanting to outright
remove it all didn't have objections.

topic/iomem-mmap-vs-gup-2021-05-03:
unexport follow_pfn

Follow-up to my pull from last merge window: kvm and vfio lost their
very unsafe use of follow_pfn, this appropriately marks up the very
last user for some userptr-as-buffer use-cases in media. There was
some resistance to outright removing it, maybe we can do this in a few
releases.

Cheers, Daniel

The following changes since commit 0d02ec6b3136c73c09e7859f0d0e4e2c4c07b49b:

  Linux 5.12-rc4 (2021-03-21 14:56:43 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/topic/iomem-mmap-vs-gup-2021-05-03

for you to fetch changes up to ac8b8400620a4b0d9ca903ee9ad440bec736f5fa:

  mm: unexport follow_pfn (2021-04-08 16:54:38 +0200)

----------------------------------------------------------------
unexport follow_pfn

Follow-up to my pull from last merge window: kvm and vfio lost their
very unsafe use of follow_pfn, this appropriately marks up the very
last user for some userptr-as-buffer use-cases in media. There was
some resistance to outright removing it, maybe we can do this in a few
releases.

----------------------------------------------------------------
Daniel Vetter (3):
      mm: Add unsafe_follow_pfn
      media/videobuf1|2: Mark follow_pfn usage as unsafe
      mm: unexport follow_pfn

 drivers/media/common/videobuf2/frame_vector.c |  2 +-
 drivers/media/v4l2-core/videobuf-dma-contig.c |  2 +-
 include/linux/mm.h                            |  4 +--
 mm/memory.c                                   | 46 +++++++++++++++++----------
 mm/nommu.c                                    | 28 ++++++++++++----
 security/Kconfig                              | 13 ++++++++
 6 files changed, 68 insertions(+), 27 deletions(-)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
