Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E12B8559492
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 10:05:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B5CF1120A5;
	Fri, 24 Jun 2022 08:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61AFD10F2C7;
 Fri, 24 Jun 2022 08:04:49 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id c13so2291698eds.10;
 Fri, 24 Jun 2022 01:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LhrZ1UxjIpVC2XBdksQBTmD7BAYYNmGWhWbEjzEkz2c=;
 b=IT/2QY1S3wcM8FS/v0FfdNQ+N0HXcgQBGNh20MRJf8eVnqxcRW0P4dlyNLO+vVZ8g/
 6Q+9dkqSDlXiGXgDpZQ0Bpt/FxnTiQwhmLrYF2pPF4xCysoOJkrd6xdjVCkn+Uvy+ffB
 quJO025nVRDKuN9elrZ48yacmrwHG6j8fQ5ySbuBDjbc6A7DHjXpkjjTouvrDvdQmO8c
 ms0eTCTSdv2gdgpHBUxImXnUGSIc33A3tu+afJmcDei235oxk6m1CWDn/CTQ5PlKsxAC
 SPK5To3d1dYAUUDB5YpwfCNc5A+uFc9Q9nF0XhuNgx0cPr6s4OJUdGvNRl1Rtwlr7tA1
 Xb0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LhrZ1UxjIpVC2XBdksQBTmD7BAYYNmGWhWbEjzEkz2c=;
 b=FbKWmQfOlmBLGVCt9NzwaEbDVI6LxX+pyozkVFZzD5faWxBydP+y0oPiieM8s+npUr
 IGaKxMneWZXhqZpNuFNdLz/6ED7P0vigWgqYbWpq8pY7aiR+sxYcRvffo/v9YIaeh76C
 THR1A9Ql0Ns2pIEt4BbK0S3oggjoxxj5Vz8yKD4bFkTJiEKeg4cC8K/D+WYFMZsRDprp
 EB+SOOvMr5hNSssLq+LVmksTW39f3a6npljJ+zyTUTIlQZ8pokvQM3JB3UDgRNVKTB/7
 gcbxxs3upqOfinlVuCJaNtax56pSsaAIljBBZa9LXhVldXccCvazBXLeV6u+x03tnMhV
 Jv+g==
X-Gm-Message-State: AJIora/yzKJp9jBTBgSKIAhLCHeoYILROKH5HX34aj9q9Hanb/DozfR7
 b+XnPuyPRNCyK5wAreOss4s=
X-Google-Smtp-Source: AGRyM1vntYWPcpiFR2W5uxDMzVDamojnDeNXHGRVhdRGjoQWJzpXxx+4TF3fYwBFNAdDWENhklW23w==
X-Received: by 2002:aa7:d29a:0:b0:435:705f:1319 with SMTP id
 w26-20020aa7d29a000000b00435705f1319mr15758286edq.54.1656057887845; 
 Fri, 24 Jun 2022 01:04:47 -0700 (PDT)
Received: from able.fritz.box (p57b0bd9f.dip0.t-ipconnect.de. [87.176.189.159])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a170906155300b006fea43db5c1sm697779ejd.21.2022.06.24.01.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:04:47 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org
Subject: [RFC] Per file OOM-badness / RSS once more
Date: Fri, 24 Jun 2022 10:04:30 +0200
Message-Id: <20220624080444.7619-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: mhocko@suse.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello everyone,

To summarize the issue I'm trying to address here: Processes can allocate
resources through a file descriptor without being held responsible for it.

I'm not explaining all the details again. See here for a more deeply
description of the problem: https://lwn.net/ml/linux-kernel/20220531100007.174649-1-christian.koenig@amd.com/

With this iteration I'm trying to address a bunch of the comments Michal Hocko
(thanks a lot for that) gave as well as giving some new ideas.

Changes made so far:
1. Renamed the callback into file_rss(). This is at least a start to better
   describe what this is all about. I've been going back and forth over the
   naming here, if you have any better idea please speak up.

2. Cleanups, e.g. now providing a helper function in the fs layer to sum up
   all the pages allocated by the files in a file descriptor table.

3. Using the actual number of allocated pages for the shmem implementation
   instead of just the size. I also tried to ignore shmem files which are part
   of tmpfs, cause that has a separate accounting/limitation approach.

4. The OOM killer now prints the memory of the killed process including the per
   file pages which makes the whole things much more comprehensible.

5. I've added the per file pages to the different reports in RSS in procfs.
   This has the interesting effect that tools like top suddenly give a much
   more accurate overview of the memory use as well. This of course increases
   the overhead of gathering those information quite a bit and I'm not sure how
   feasible that is for up-streaming. On the other hand this once more clearly
   shows that we need to do something about this issue.

Another rather interesting observation is that multiple subsystems (shmem,
tmpfs, ttm) came up with the same workaround of limiting the memory which can
be allocated through them to 50% of the whole system memory. Unfortunately
that isn't the same 50% and it doesn't apply everywhere, so you can still
easily crash the box.

Ideas and/or comments are really welcome.

Thanks,
Christian.


