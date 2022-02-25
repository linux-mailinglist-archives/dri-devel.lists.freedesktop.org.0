Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B46D4C3CC9
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 04:56:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EC1E10E738;
	Fri, 25 Feb 2022 03:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA60110E630
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 03:56:14 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 cp23-20020a17090afb9700b001bbfe0fbe94so3716362pjb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 19:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9EL9VRrPBu3az25e2ybIauwEmEdCvI/qWzhGi/e6E5Y=;
 b=jcSFxySYSYdj4BZD63nO0EbhxamC376oNbineqS36uKRwh9Buzq62WyKxAtoxOeaav
 9v1jABoix2QKwwyzDytesOlugbsEVZLu8HuKgUwGjeMAQqUZPOSZV8sv5iCDzLUFHa2f
 nbj7QUigSrMOqlhNT0263Oq4BoU39MfL89xLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9EL9VRrPBu3az25e2ybIauwEmEdCvI/qWzhGi/e6E5Y=;
 b=U93Vg0sxvFWqiWRnKXRoOpLr75PwPbpNfqqqMwWEkrY/4CJoqT+Q0dKUerR1zJiEI9
 a94E7P30byuUUIqsXeS2bnNEoXF0T0MnowscDZyDbu78UzQz0e9QRAeDb/R/FkAwkp4F
 xgT5kk3e5T86x1HWuU4YXGk+xPT24kPy4cb9DRDeXzV2iyelW+xEbCt23MvRY5ZJoPje
 tojxCQeydyWdnUJbnIRC9yuwHj8mSnZlreb3ND7uYVzSgZiPtslWAoVpKV7UH5cntSf0
 e7aZY1xSLpA7NGMlYCPjznz7WCtA0XkU+KGeH+q1JeCItvSesYi3llbx2qSmABi13nnf
 ITBQ==
X-Gm-Message-State: AOAM533HNNuCxPEmyVe5TEUsARtsndnhXeqIVPOopgSpO4Q8mMyBtDss
 Anygu8xNhNE4xEznSmeSiofRBg==
X-Google-Smtp-Source: ABdhPJz4XEl+dLLGOfRROoPWM4zEB50843UCWkcV9Myxwze9zuT7lnhfAPYHX+lJLKs/8Kyb0lahLw==
X-Received: by 2002:a17:90a:19d5:b0:1bc:a5db:b655 with SMTP id
 21-20020a17090a19d500b001bca5dbb655mr1327748pjj.46.1645761374562; 
 Thu, 24 Feb 2022 19:56:14 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 t190-20020a632dc7000000b003759f87f38csm897373pgt.17.2022.02.24.19.56.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 19:56:14 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 0/2] drm/dp: Fix out-of-bounds reads
Date: Thu, 24 Feb 2022 19:56:08 -0800
Message-Id: <20220225035610.2552144-1-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=810; h=from:subject;
 bh=bU37iCBLJ7Q70x0XEhd7PjOmH28YCUaT+vra8oA4uZo=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBiGFNZdsEw9YGr2OGD24Hf0kq+QV8dh1Tl0BsSDlLS
 Qa8/sVWJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYhhTWQAKCRCJcvTf3G3AJonKD/
 9dwPGSsOpHqQ5De1f9MxlBVJY6fcHLK5tsekzkp7Nkho9GLFcV/wCa4odTI+ek/3p+TAAuY06YNpPY
 e2GtXNN2k1N/ScNeCVQ9tRgmqRwEVg8hkmhgTkI6cMdDVSnyWOMZpiXgGJfWshuo9yT4kAnnrL9T35
 NuonIO45jrGXry/WROkxa4UTu0HNUqyfI36hke71TFsWNhMBWFBdsaUHcFw3CdNwLofm6yWegvdL6k
 upXRIp4OJlWrdNvpTRIn9LGq4+p6RlHibE17dzqMBAhkZqvqr9JSMAD/HXba24aIYnDtHGGdMR3rBW
 QrB6UmqP7HO93A2BGUkx/WnzxHJuF1ClR6XNUKghGz8ZBPdbBGehd/JzCQuJQghhS2IyrpJ2N4CiLk
 ckG5Mlse+9Nlon9Zr0UD4nmFHVBDLz+5CO0auzsrO93TvM3Brbj5ZsP9/6mv3xCj18QYFIXV2f/z8R
 m22ovOL5xu0SG2uLEPoXZRD3kLDzB6rb5RRQt6PozL4fRFufF4Pchl24Fh4yTRYaFhnTNVLCvSY+e4
 CnqhcHhjE+X+n43xaOAuGZtnTxWrh20mUwWndVPSD7Cx/B4rXTCqesrZJF+s8m06eA0tuisE7j+nxb
 /Zggztye4Wb/Vo79hwmtVA42S20mTnykG1zZA30JuAQAyR4jKY8a/B/QOR6g==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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
Cc: Douglas Anderson <dianders@chromium.org>, Kees Cook <keescook@chromium.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jani Nikula <jani.nikula@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Uma Shankar <uma.shankar@intel.com>, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I'm sending these again, as they still need fixing. They have been
rebased due to the drm_dp_helper code being moved into a subdirectory.

Can someone please apply these? :)

Thanks!

-Kees

v1: https://patchwork.freedesktop.org/patch/465200/
    https://patchwork.freedesktop.org/patch/465201/
v2: https://patchwork.freedesktop.org/patch/468350/
    https://patchwork.freedesktop.org/patch/468351/
v3:
 - add review tags
 - rebase to drm/drm-next

Kees Cook (2):
  drm/dp: Fix off-by-one in register cache size
  drm/dp: Fix OOB read when handling Post Cursor2 register

 drivers/gpu/drm/dp/drm_dp.c    | 10 ----------
 drivers/gpu/drm/tegra/dp.c     | 11 ++++++++++-
 include/drm/dp/drm_dp_helper.h |  4 +---
 3 files changed, 11 insertions(+), 14 deletions(-)

-- 
2.30.2

