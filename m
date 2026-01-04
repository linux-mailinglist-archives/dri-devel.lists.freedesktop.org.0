Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3742CF0E30
	for <lists+dri-devel@lfdr.de>; Sun, 04 Jan 2026 13:11:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1036410E23E;
	Sun,  4 Jan 2026 12:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="K5vKVzbH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 972FA10E042
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jan 2026 11:06:48 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-bc17d39ccd2so8150478a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jan 2026 03:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767524808; x=1768129608; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yUCt/I1JDgpKPWl0wJY+VdRCfc9g+GhZhdDVLk6Y6Gw=;
 b=K5vKVzbHNaYH1BfykJ/XtcuLA3ST/P4ucnUBkU+a7M+9klS/wzFjqC9aQQedPHHrDj
 JxGNwjq9In33lFRTELUt8hbBL/Awg71BJIeTEh4VjL5lL/hT7OyuUWaG+oO6C+vMdMir
 oe+PbS0KobkkzB7eGEhjOKl/z9kW02VMthwE4q/pXjcQYfJBm+1A3LDrEOGYJO3LySgw
 VaQLRNhiOS/0tZMxsGAq0HWjmFSQdhju9HHwWC6D18RSAyREGjh2+T5uMoRzGeSFu1G7
 ptsjbyIRXH9eN6VcJXjT0VFB6TSpKvQAi4zfWQAjWjv6Nef33haPpzTLjp0+i23LIE/9
 qzWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767524808; x=1768129608;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yUCt/I1JDgpKPWl0wJY+VdRCfc9g+GhZhdDVLk6Y6Gw=;
 b=IUYHIRHM14JVxK831gyhuYmFkQNOfuYJJz6MTSaTKIG65+TdU1aKf+r0Z8O42OuET7
 9+Y28V8M18hOT2q+DityBHn7f6fWmZPhfAdGoieMrGZCqXWUM7OobYmeGslff2Ru2hcD
 afU2V9utnwdlHlmoqeDmvMeTAi9f3ZuIJBX+d2sbbd+WbZQ+F7fe3Rh251qLVl4XImxS
 87FAn9aPxNvzI1DgVe9B/adT8D4k4OKMw6XEVRaYgD0C/QYx8vOsRDgrct3iCNnru5Mf
 QWbrXWJEfZCWCAt5g6SXmLQNNnWZGOKA6zOKD2kYajUWKi53d0QHnBDJAj5NoxFdDa0h
 2jXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyELnLht0DCgX0lkO1XKAZ9f5do45Tu2tw0kmT/DS7Aw+wopz2DrTaZmhA44y1JQOW0blhljHzfwU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YynI1UvsTlJggFhesBjoFm7qQEbdSBPgYFqKDU+zfBCoFH0zy0s
 +DLs8euzjzP0Hnwt//7qjptip7y3QmbY8UlN8p0jnkwkQ/eAU6LdNWXh
X-Gm-Gg: AY/fxX5ACuJ8WA/tG0Eag8n292txbLvXmqcPqBpxYCixMNln/8J/5CznZeVsg14WVIv
 p9qC+mQVWXMON8BOWKqIku+2O/vYm90JKnbJd+tb/aECL9QhLzj36mVh2TnO+mEe/AnxJ75Jvim
 AbxLDy/TgPt0U5WHgxtEeMdPRQrbwJH6rwW1rFQ2kKUEfkHLaKHWtYmkTO7QYVmA+QJfvF2VIOK
 lUB41TT1mtKo+bDqz2UBUQGxNqLRM0/cVeUR1tUfqmIv901tUx1XCyQG/XMe176LwDVxvGjAm31
 4ymKLDFHx4rJKg7TJdIDVx/q8Be7yo0xplxc0PP5NVQQyfBMDkymU3NELA3Fwlg9E7hSc/gHjnt
 hMnTFXXYoBb3E+0WV1Xptk7DIYqqQb8TnODcQi+DHesVUDqLcKlNydJCHaussVciFOzeJx+Z1HA
 r42hbOvvYCGo+LzLEn20hgAZ4eW36FNCV4DMDKS4x6AUNSTF8uCrwdXMw3IGEIHiBGGdRgL+Hu0
 uVmPjDBxtY=
X-Google-Smtp-Source: AGHT+IEJJ1hrsUL+EWG+/LYHmGIsftevAAvshlZviJRsmXOHXp8IxBwsGTPWSTtldkfSDqfO6NUI7A==
X-Received: by 2002:a05:693c:4146:10b0:2b0:738e:287e with SMTP id
 5a478bee46e88-2b073904fd7mr23927432eec.30.1767524807784; 
 Sun, 04 Jan 2026 03:06:47 -0800 (PST)
Received: from ubuntu-linux-2404..
 (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b140c42e4esm7743509eec.15.2026.01.04.03.06.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jan 2026 03:06:47 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH v1 0/4] staging: fbtft: reduce stack usage by avoiding large
 write_reg() varargs
Date: Sun,  4 Jan 2026 19:06:34 +0800
Message-ID: <20260104110638.532615-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 04 Jan 2026 12:11:35 +0000
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

Hi,

This series fixes clang `-Wframe-larger-than=1024` warnings in the fbtft
staging drivers.

The warnings are triggered by very large `write_reg()`/`write_register()`
varargs calls, which result in excessive stack usage.

Switch the affected paths to send a u8 command byte followed by the u8
payload using `fbtft_write_buf_dc()`. The register values and ordering are
kept unchanged; only the transfer method is updated.

Patches:
  1/4 staging: fbtft: core: avoid large stack usage in DT init parsing
  2/4 staging: fbtft: ssd1351: send gamma table via fbtft_write_buf_dc()
  3/4 staging: fbtft: ssd1331: send gamma table via fbtft_write_buf_dc()
  4/4 staging: fbtft: hx8353d: send LUT via buffer to reduce stack usage

Thanks,
Sun Jian

--
Sun Jian (4):
  staging: fbtft: core: avoid large stack usage in DT init parsing
  staging: fbtft: ssd1351: send gamma table via fbtft_write_buf_dc()
  staging: fbtft: ssd1331: send gamma table via fbtft_write_buf_dc()
  staging: fbtft: hx8353d: send LUT via buffer to reduce stack usage

 drivers/staging/fbtft/fb_hx8353d.c | 38 ++++++++++++++++++++++--------
 drivers/staging/fbtft/fb_ssd1331.c | 29 ++++++++++++-----------
 drivers/staging/fbtft/fb_ssd1351.c | 35 ++++++++++++---------------
 drivers/staging/fbtft/fbtft-core.c | 32 ++++++++++---------------
 4 files changed, 71 insertions(+), 63 deletions(-)

-- 
2.43.0

