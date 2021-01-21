Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCF72FFE79
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 09:45:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 165A86E9A9;
	Fri, 22 Jan 2021 08:45:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA88E6E419
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 11:18:26 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id f63so1286813pfa.13
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 03:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x3SmdleK8UZBluZ+gLv61IXIdA7ChI0uJ8q02WGnkWs=;
 b=kKul5ID8v5TbX97ww+cpfmgrUv3kSKDwJ5+iClldpCxSEMEvh16BW9c99r9D6TxUF/
 UJy9U+fbp6GgTXqQAKH2vpfq+OBFaUhJAFtmu2GlHVA0WGpq/UGkkQR9iGMbQoj1Iitv
 n10xlrNXdq0kiQQIE5ELsxJO+0LGCp2wS9uujRkXF7ZC8F+po6ARY/vc2Wfe1Q2Hl5ea
 ea/DVLs27iqJz6zMgl0grfTLeQyN5TuTmnmrzme3iilGPe9v/xC35tR/mdM3Bl/HM1qU
 XZS/WWhF29VdoamNtm9NTJNGg++hLG8LJsFS9ZiaU3Au8PjSKQyPReA9zoIHqr/wIRDf
 hK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x3SmdleK8UZBluZ+gLv61IXIdA7ChI0uJ8q02WGnkWs=;
 b=oXN3Zw29xQf2YQ13PQZOj3fEFZwepcxpIDTOzs+Jwp/FL+hAyXBfr1tK28IvtQ6j84
 b4k8o7j8hjobxT2iQwQbFzpn4PuHTDCwxCSEcmmujlbSzYJjlMC1x5v0xWavljK/qolE
 LrsLD0m2GVc5wAFm7d6o2wr6xWKzSjC2N23n0JmR6hS5mrNTY0JfHddjlXQE/CHCnQJY
 ds6B2px7XZZhtwViyLTtIhLZ895Aiq7ux8GiqMWRAhneVMeoPdDBN5tcR3kk93b92yHC
 WGUQppYyUuLK5D/KQZekiH+HyXgnT0Ld/wDG53K2q/BKzSY0eM1FOdbD17e1kjYrITHa
 cqWQ==
X-Gm-Message-State: AOAM533pQ1sCL4oKe34f5bUgYBwyvZ54z9ynEFsNQ5Dd5RWRo/npS/6X
 b/XX2vMBCpTL2F44v5TL0ZEcFA==
X-Google-Smtp-Source: ABdhPJzYjBGnMJtovsRHZ48WHArs33wC1W8Lrm5qvHpSIs5QnnIQMqLBBg9eMiM+WEzPlls9eOjVdQ==
X-Received: by 2002:aa7:84d5:0:b029:19d:da20:73fe with SMTP id
 x21-20020aa784d50000b029019dda2073femr13718975pfn.16.1611227895317; 
 Thu, 21 Jan 2021 03:18:15 -0800 (PST)
Received: from localhost ([122.172.59.240])
 by smtp.gmail.com with ESMTPSA id 68sm5691390pfg.90.2021.01.21.03.18.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 Jan 2021 03:18:14 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Nishanth Menon <nm@ti.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Stephen Boyd <sboyd@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH 00/13] opp: Implement dev_pm_opp_set_opp()
Date: Thu, 21 Jan 2021 16:47:40 +0530
Message-Id: <cover.1611227342.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 22 Jan 2021 08:45:43 +0000
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sibi Sankar <sibis@codeaurora.org>,
 linux-tegra@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This patchset implements a new API dev_pm_opp_set_opp(), which
configures the devices represented by an opp table to a particular opp.
The opp core supports a wide variety of devices now, some of them can
change frequency and other properties (like CPUs), while others can just
change their pstates or regulators (like power domains) and then there
are others which can change their bandwidth as well (interconnects).
Instead of having separate implementations for all of them, where all
will eventually lack something or the other, lets try to implement a
common solution for everyone. This takes care of setting regulators, bw,
required opps, etc for all device types.

Dmitry, please go ahead and try this series. This is based of opp tree's
linux-next branch.

Sibi, since you added dev_pm_opp_set_bw() earlier, it would be good if
you can give this a try. In case this breaks anything for you.

I have already tested this on hikey board for CPU devices.

To get this tested better and as early as possible, I have pushed it
here:

git://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git opp/linux-next

This will be part of linux-next tomorrow.

Note, all the patches need to go through OPP tree here. Please provide
your Acks for platform specific bits.

--
Viresh

Viresh Kumar (13):
  opp: Rename _opp_set_rate_zero()
  opp: No need to check clk for errors
  opp: Keep track of currently programmed OPP
  opp: Split _set_opp() out of dev_pm_opp_set_rate()
  opp: Allow _set_opp() to work for non-freq devices
  opp: Allow _generic_set_opp_regulator() to work for non-freq devices
  opp: Allow _generic_set_opp_clk_only() to work for non-freq devices
  opp: Update parameters of  _set_opp_custom()
  opp: Implement dev_pm_opp_set_opp()
  cpufreq: qcom: Migrate to dev_pm_opp_set_opp()
  devfreq: tegra30: Migrate to dev_pm_opp_set_opp()
  drm: msm: Migrate to dev_pm_opp_set_opp()
  opp: Remove dev_pm_opp_set_bw()

 drivers/cpufreq/qcom-cpufreq-hw.c     |   2 +-
 drivers/devfreq/tegra30-devfreq.c     |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c |   8 +-
 drivers/opp/core.c                    | 314 ++++++++++++++------------
 drivers/opp/opp.h                     |   2 +
 include/linux/pm_opp.h                |   6 +-
 6 files changed, 184 insertions(+), 150 deletions(-)

-- 
2.25.0.rc1.19.g042ed3e048af

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
