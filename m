Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4835E9F729F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 03:35:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73B4210E20D;
	Thu, 19 Dec 2024 02:35:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cRLBUEvR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6105B10E20D;
 Thu, 19 Dec 2024 02:35:01 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-7265c18d79bso376314b3a.3; 
 Wed, 18 Dec 2024 18:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734575701; x=1735180501; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ewYmRGbtjw/u5CZQB/fGCIYq/IkhzVppRPs0v4hq1mw=;
 b=cRLBUEvRP8UbMnQvOxuMIMxeNxd4Tp6BGg4homTh/W5wzmvi513Z1lqfHQwTStOU8y
 L1bDo4+nAc97jnYmrVKRM3xRtc4s6An2E/cf07L7TI5Pjum46hDpKThr6esDW87LNxoI
 OpbN40tQH9G5H0graqLE7CazBJZMjNJDApKyJRHjphpStl+u3rYxxBfnR6IAnZWasMFL
 bOE3aDSM5qayROuE0eIBa1oZunxlzcxSgKxItKL0MKq3M8sEGM2+TIMFFn+T6paq7y/I
 2FlSAxh1EpRtIPrZsbyUxo6i+VrlO4kbmjpqvjKQW823sxlZNRgFwSLGe3Eaa+NCwKPC
 3FSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734575701; x=1735180501;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ewYmRGbtjw/u5CZQB/fGCIYq/IkhzVppRPs0v4hq1mw=;
 b=PcH6W7N9eiiTr8aBzCeLlduf3YdDKaSHQ9GcUURlkxl78VCZmj3fKPCVFsnz7DlMlV
 oFiWcmLLGsRxhmFUsib1iLRKQvLLzHjRaaRtFfn4CC0rCDrFCiNqgx44YdXm8O2nvze4
 PLYhaKfwRYZX+CW72MaNRz17cnJKmsBLbNxJHrJSobmY3u2E+2Xby5NssGnFYi7BMVo+
 46jpOgN9EiH33E6If+q+L4O3PmvUV7aDgAfe7PK8+eOC8ib7/kP8n65OTq+SEIbkLloX
 Id3CpBC6W6SxHQ1ne3rgg87COk0KgiJ9CcKIuoQRlBCQoYTL4cSUt4QJgltR5n+ZpkQs
 xNkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVy7qfTqSb9Kfv25Kk3px9zpVVFtT0qpn5hNTtytgPjBqt2DFfGEPJZpqDlEugFHrehbeikYWQeg==@lists.freedesktop.org,
 AJvYcCVw/egzdXDgFX/LlMNU9yep046vwKr3FjiIixkVJNMAYY+CVaIMSO+4Sp/YwPQPzgW8fZwZtEL+zLMa@lists.freedesktop.org,
 AJvYcCWzwiJFp509Q72Y01taZjBK30WUDwxjLN11I4hEXWQc8zTnFDT+vj5lGswrmG3iDLGoscuqHDfRovU=@lists.freedesktop.org,
 AJvYcCXNw3z4aqLRDNqGeXXKE8iyTXNbAgRd76B+tSj2rXY7u41csao0wgCIsH8MM7Y+eViJx94TfXmOiIw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDGiQlEmlGEorXy3M//atFDPhvl13C5JTdpUSfNtos/gAQurNO
 xwF0IpDJhJxyGyMJwsGeO7xdu/u+KWNu+pG06GZBqQkYegcDoXv/
X-Gm-Gg: ASbGncvMZoXWPik0RvbaYJhW9ggQBAYaJDbaFWLZqc4iF20is6/6E3rt2DgW1pPmfNw
 cH0SZ6CnsgYtE1YqdFFsTMbh3Xm0Q+va0VQThtA4m/kYSsUhT20kgcjKuqRyoQS5uEicTmwbl4c
 +rtUp9ITj25J304bxWQHYhREJ8fSkYPc62b/9RMxH154bp5wiJMlCPPM83XHAg+gMHGuTv0LSca
 CVbk4waPmkodwozUSibqLPdO+UXTVuwUUbOykBRy9ZS0NucTrRhdOlum2BkLHP9ix5UzeLle1NR
 XZb+qys=
X-Google-Smtp-Source: AGHT+IGkt8eWE3wh1dURnDDolV6IzXf9MexDfJ0kaeAEgc6DDmy7cFDTyCLLAMMKibF6E7v5iDX6cg==
X-Received: by 2002:aa7:9316:0:b0:724:ed8f:4d35 with SMTP id
 d2e1a72fcca58-72a8d2e0557mr8641134b3a.26.1734575700792; 
 Wed, 18 Dec 2024 18:35:00 -0800 (PST)
Received: from localhost.localdomain ([180.159.118.224])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-842b821da83sm142163a12.40.2024.12.18.18.34.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 18 Dec 2024 18:35:00 -0800 (PST)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, pmladek@suse.com, kvalo@kernel.org,
 bp@alien8.de, andriy.shevchenko@linux.intel.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 x86@kernel.org, linux-snps-arc@lists.infradead.org,
 linux-wireless@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ocfs2-devel@lists.linux.dev,
 Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v2 0/5] Remove get_task_comm() and print task comm directly
Date: Thu, 19 Dec 2024 10:34:47 +0800
Message-Id: <20241219023452.69907-1-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since task->comm is guaranteed to be NUL-terminated, we can print it
directly without the need to copy it into a separate buffer. This
simplifies the code and avoids unnecessary operations.

v1->v2:
- Don't add "%pTN" (Petr, Kalle, Borislav, Andy, Linus)

v1: https://lore.kernel.org/all/20241213054610.55843-1-laoar.shao@gmail.com/

Yafang Shao (5):
  kernel: Remove get_task_comm() and print task comm directly
  arch: Remove get_task_comm() and print task comm directly
  net: Remove get_task_comm() and print task comm directly
  security: Remove get_task_comm() and print task comm directly
  drivers: Remove get_task_comm() and print task comm directly

 arch/arc/kernel/unaligned.c                         |  5 ++---
 arch/x86/kernel/vm86_32.c                           |  5 ++---
 drivers/accel/habanalabs/common/context.c           |  3 +--
 drivers/accel/habanalabs/common/habanalabs_ioctl.c  | 11 +++--------
 drivers/gpu/drm/i915/display/intel_display_driver.c |  6 ++----
 drivers/gpu/drm/nouveau/nouveau_chan.c              |  4 +---
 drivers/gpu/drm/nouveau/nouveau_drm.c               |  5 ++---
 drivers/tty/tty_io.c                                |  3 +--
 kernel/capability.c                                 |  8 ++------
 kernel/futex/waitwake.c                             |  3 +--
 net/wireless/wext-core.c                            |  4 +---
 security/yama/yama_lsm.c                            |  4 +---
 12 files changed, 19 insertions(+), 42 deletions(-)

-- 
2.43.5

