Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66989321B52
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 16:25:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA7B86E0C6;
	Mon, 22 Feb 2021 15:25:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC086E0C6
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 15:12:43 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id n10so14711954wmq.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 07:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W0TOeWb9HGAVOiFV96tO3iwrSfpr1HUMq4Lyw23rID8=;
 b=FXji/u2iaXY+XOLURddZgd2B9Komiw4Zs+cHylXgLODWE9GujYAMZXOAJt49ncgKkj
 KXasUXoXmvp4d8wnMqKd80kcI7te+i8Ssj5jDkgEWFuHlI+B6a2sASXp0MxfAR6JnXe8
 PMBmzH05uvtN8ixL0Xf+EQKCWEzHPeryma2B8WEKKwAVtI0pXqr1NlCyNenHmBJpSL8S
 /+oAK7AHbhG8Bp1qrmvN2UnpdRZab4b+NfCGuGFlZhbfGdnHHN2BEQP/z7fvhdeo8a9n
 SKJFfnaPm0+G5TFN4ZPUDwZLEAxSLZT3kXUZZdZbgYAQSBq86aQw+eD/RGBp29tx1xWa
 GH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W0TOeWb9HGAVOiFV96tO3iwrSfpr1HUMq4Lyw23rID8=;
 b=ulMSOnj4w6Bux2c2nPYEz/b7gqbdFoAMgJt5v5iIFtNtO9Ptx4IgxJa6F5elR3cAxE
 qNjSRPz1+kwGIAc5KHTfxZB0FcoD0Fi5IUWEuEnXKLWFF0dI+4fGc0SUrR9GClBBKek1
 MGrhgMWDdL87+Dirvi0j5azSv65eV+3Hjs0AHEUWGUa6VqaoxqMrMLtGvB3ySnss+E4m
 EmvEA6OQOIfwYH3W4nq4DcXCja7bQC56jOUlC72gkiGEmvE0cDPxxiDzFDsfRUbQAWMs
 WA1Ge/AQjEdnmu9H44s/naWcBapjua2YMhL6qE5Bl6sTRqVFLX7nIwB4dRmOwwR1eNkr
 cr2A==
X-Gm-Message-State: AOAM531zMnqIEqlSvCgBYT5ZukFoMCMYAHA0vKovRUF0AstvgdCvUKj9
 mjsZvWHdbKXqcGbDWBLE/XA=
X-Google-Smtp-Source: ABdhPJwJjaqNTMZMEqWfwHu3GKPnp7PUpKeoIN2SSKme4SlDCBTSRJD1aRWbEX4S9qfmjT5mjltYPQ==
X-Received: by 2002:a05:600c:26c4:: with SMTP id
 4mr9157865wmv.126.1614006761746; 
 Mon, 22 Feb 2021 07:12:41 -0800 (PST)
Received: from debby (176-141-241-253.abo.bbox.fr. [176.141.241.253])
 by smtp.gmail.com with ESMTPSA id q25sm20952001wmq.15.2021.02.22.07.12.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 07:12:41 -0800 (PST)
From: Romain Perier <romain.perier@gmail.com>
To: Kees Cook <keescook@chromium.org>, kernel-hardening@lists.openwall.com,
 Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Jiri Pirko <jiri@nvidia.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mimi Zohar <zohar@linux.ibm.com>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 "J. Bruce Fields" <bfields@fieldses.org>,
 Chuck Lever <chuck.lever@oracle.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Jessica Yu <jeyu@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Steffen Maier <maier@linux.ibm.com>, Benjamin Block <bblock@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Jiri Slaby <jirislaby@kernel.org>, Felipe Balbi <balbi@kernel.org>,
 Valentina Manea <valentina.manea.m@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: [PATCH 00/20] Manual replacement of all strlcpy in favor of strscpy
Date: Mon, 22 Feb 2021 16:12:11 +0100
Message-Id: <20210222151231.22572-1-romain.perier@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 22 Feb 2021 15:25:09 +0000
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
Cc: linux-hwmon@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-scsi@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-m68k@lists.linux-m68k.org,
 target-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
 cgroups@vger.kernel.org, linux-integrity@vger.kernel.org,
 Romain Perier <romain.perier@gmail.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

strlcpy() copy a C-String into a sized buffer, the result is always a
valid NULL-terminated that fits in the buffer, howerver it has severals
issues. It reads the source buffer first, which is dangerous if it is non
NULL-terminated or if the corresponding buffer is unbounded. Its safe
replacement is strscpy(), as suggested in the deprecated interface [1].

We plan to make this contribution in two steps:
- Firsly all cases of strlcpy's return value are manually replaced by the
  corresponding calls of strscpy() with the new handling of the return
  value (as the return code is different in case of error).
- Then all other cases are automatically replaced by using coccinelle.

This series covers manual replacements.

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy

Romain Perier (20):
  cgroup: Manual replacement of the deprecated strlcpy() with return
    values
  crypto: Manual replacement of the deprecated strlcpy() with return
    values
  devlink: Manual replacement of the deprecated strlcpy() with return
    values
  dma-buf: Manual replacement of the deprecated strlcpy() with return
    values
  kobject: Manual replacement of the deprecated strlcpy() with return
    values
  ima: Manual replacement of the deprecated strlcpy() with return values
  SUNRPC: Manual replacement of the deprecated strlcpy() with return
    values
  kernfs: Manual replacement of the deprecated strlcpy() with return
    values
  m68k/atari: Manual replacement of the deprecated strlcpy() with return
    values
  module: Manual replacement of the deprecated strlcpy() with return
    values
  hwmon: Manual replacement of the deprecated strlcpy() with return
    values
  s390/hmcdrv: Manual replacement of the deprecated strlcpy() with
    return values
  scsi: zfcp: Manual replacement of the deprecated strlcpy() with return
    values
  target: Manual replacement of the deprecated strlcpy() with return
    values
  ALSA: usb-audio: Manual replacement of the deprecated strlcpy() with
    return values
  tracing/probe: Manual replacement of the deprecated strlcpy() with
    return values
  vt: Manual replacement of the deprecated strlcpy() with return values
  usb: gadget: f_midi: Manual replacement of the deprecated strlcpy()
    with return values
  usbip: usbip_host: Manual replacement of the deprecated strlcpy() with
    return values
  s390/watchdog: Manual replacement of the deprecated strlcpy() with
    return values

 arch/m68k/emu/natfeat.c                 |  6 +--
 crypto/lrw.c                            |  6 +--
 crypto/xts.c                            |  6 +--
 drivers/dma-buf/dma-buf.c               |  4 +-
 drivers/hwmon/pmbus/max20730.c          | 66 +++++++++++++------------
 drivers/s390/char/diag_ftp.c            |  4 +-
 drivers/s390/char/sclp_ftp.c            |  6 +--
 drivers/s390/scsi/zfcp_fc.c             |  8 +--
 drivers/target/target_core_configfs.c   | 33 ++++---------
 drivers/tty/vt/keyboard.c               |  5 +-
 drivers/usb/gadget/function/f_midi.c    |  4 +-
 drivers/usb/gadget/function/f_printer.c |  8 +--
 drivers/usb/usbip/stub_main.c           |  6 +--
 drivers/watchdog/diag288_wdt.c          | 12 +++--
 fs/kernfs/dir.c                         | 27 +++++-----
 kernel/cgroup/cgroup.c                  |  2 +-
 kernel/module.c                         |  4 +-
 kernel/trace/trace_uprobe.c             | 11 ++---
 lib/kobject_uevent.c                    |  6 +--
 net/core/devlink.c                      |  6 +--
 net/sunrpc/clnt.c                       |  6 ++-
 security/integrity/ima/ima_policy.c     |  8 ++-
 sound/usb/card.c                        |  4 +-
 23 files changed, 129 insertions(+), 119 deletions(-)

-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
