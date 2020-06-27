Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D71E20BF20
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jun 2020 09:03:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F157B6E13F;
	Sat, 27 Jun 2020 07:03:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 297496E08C
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jun 2020 07:03:27 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id u5so5638161pfn.7
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jun 2020 00:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FsrSKJ+gJUACgrGolhsPdd0vgGMvepJqfy8379JcKu4=;
 b=EvUBhtFbdA5q/Ln7/JmYkJ4WCSQYr0FDka6B0ToibqDo+KoRIWa5csnmBSRVgeVZpD
 3SycW07fCAwTdh+u5tC0gQuOD9UiiaFw8Pzh8+WwWoF+ppc6VrAXas0XCfYV9gXA5Cah
 O5dfGYTYYOddR91unI7zbYt5VMmXuBus/0h6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FsrSKJ+gJUACgrGolhsPdd0vgGMvepJqfy8379JcKu4=;
 b=tLHG63klHVOZDjaS5Cahdk63iaCuWAB1GFxFhE9/pfA1MVpMA5wdg8V8Ozx1f5wLq4
 VT/CBHuswtCRPlJZVl7mzjQegF6kzBaUadR0J+N4nkuFdTqufqSV0sW/Lq6HQbdOM0wn
 mU+10r/7gFoEVhxLcJ9gLE+JVwcPAKz0bsjzOqgWi9K44u1GHBdnMNjlh+zpUbAAsjX3
 3zUgmJq5uT56iz7XxcRGjTFsdARlJvObf1btdT8zYhiQdlzQGBctwjrP7BCwAi0211xG
 yeEvSxARiEutkHsUcRf5VB7Roh4mJBI2MVeXjZlgaxrkx1YZwdjuKo96NUCIRj3uV2aB
 ZuWQ==
X-Gm-Message-State: AOAM533grFj/jBLWJZ8XEZnvDvo+NWqE31rs9x4duWS0bnvol+hW/a1t
 FPUtrHK2mNZDb3Fz/61Bp0nv0A==
X-Google-Smtp-Source: ABdhPJyZFG/mi1UZ8xodyex8KRwcp8OsluVaczS/+idWJyqCQQeS3g8ufLKi4ZbrLW2qKEXgiYfBLw==
X-Received: by 2002:a62:5c85:: with SMTP id q127mr5814143pfb.311.1593241406667; 
 Sat, 27 Jun 2020 00:03:26 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:d8b7:33af:adcb:b648])
 by smtp.gmail.com with ESMTPSA id u4sm28133269pfl.102.2020.06.27.00.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jun 2020 00:03:25 -0700 (PDT)
From: Nicolas Boichat <drinkcat@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Detect and remove trace_printk
Date: Sat, 27 Jun 2020 15:03:03 +0800
Message-Id: <20200627070307.516803-1-drinkcat@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
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
Cc: Peter Chen <peter.chen@nxp.com>,
 "Guilherme G . Piccoli" <gpiccoli@canonical.com>,
 Rafael Aquini <aquini@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Todor Tomov <todor.too@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Howells <dhowells@redhat.com>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Will Deacon <will@kernel.org>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Kees Cook <keescook@chromium.org>, devel@driverdev.osuosl.org,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Nicolas Boichat <drinkcat@chromium.org>, Jayshri Pawar <jpawar@cadence.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Andy Gross <agross@kernel.org>,
 Tomas Winkler <tomas.winkler@intel.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 linux-media@vger.kernel.org, Pawel Laszczak <pawell@cadence.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Chao Yu <chao@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Roger Quadros <rogerq@ti.com>, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Colin Ian King <colin.king@canonical.com>,
 Andrew Morton <akpm@linux-foundation.org>, Divya Indi <divya.indi@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

trace_printk is meant as a debugging tool, and should not be
compiled into production code without specific debug Kconfig
options enabled or source code changes.

Patches 1 to 3 remove/disable trace_printk that should not
be enabled by default.

Patch 4 adds a config option that can be used to detect such
trace_printk at compile time (instead of printing a nasty
warning at runtime).

Nicolas Boichat (4):
  usb: cdns3: gadget: Replace trace_printk by dev_dbg
  media: atomisp: Replace trace_printk by pr_info
  media: camss: vfe: Use trace_printk for debugging only
  kernel/trace: Add TRACING_ALLOW_PRINTK config option

 drivers/gpu/drm/i915/Kconfig.debug              |  4 ++--
 .../media/platform/qcom/camss/camss-vfe-4-1.c   |  2 ++
 .../media/platform/qcom/camss/camss-vfe-4-7.c   |  2 ++
 drivers/staging/media/atomisp/pci/hmm/hmm.c     | 10 +++++-----
 drivers/usb/cdns3/gadget.c                      |  2 +-
 fs/f2fs/Kconfig                                 |  1 +
 include/linux/kernel.h                          | 17 ++++++++++++++++-
 kernel/trace/Kconfig                            | 10 ++++++++++
 samples/Kconfig                                 |  2 ++
 9 files changed, 41 insertions(+), 9 deletions(-)

-- 
2.27.0.212.ge8ba1cc988-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
