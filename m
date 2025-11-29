Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1519C94724
	for <lists+dri-devel@lfdr.de>; Sat, 29 Nov 2025 20:53:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E77410E1EC;
	Sat, 29 Nov 2025 19:53:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DgcuBEm0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com
 [74.125.224.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC8210E1EC
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Nov 2025 19:53:06 +0000 (UTC)
Received: by mail-yx1-f45.google.com with SMTP id
 956f58d0204a3-64107188baeso2529757d50.3
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Nov 2025 11:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764445985; x=1765050785; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bq5yUqUCzfdjLEn9031/L9EMDQ3XGvUTCWlQPofKw7E=;
 b=DgcuBEm0cakbtIg9Y0aWSkq7Ks7wlNP9jpjZgK0khPLrhvRTYLO5DdcnOXTD2rzGR3
 d2RU8or8vKCUf4gNCb8nNP+d5UWO0fgcpUe738BNsozX/0g2RMaUma0Rq+92VTh9iHOg
 VJyBpHsXV8PM5RpVRcja4eZ+IcSJwf44OQk90/F17AwQnVQ5PGW//aPMK+fhnVBe9jC2
 X+HZnqxcLauFaAOksClb0PysM72lr/F/iUn6gDQeLK/rai+ith4iiBRW4j36JjlrN9U+
 U7gjOY3ZY/+Tvd6jepRktHCyAF2rrObJCaJWQ6ZJFjshcpjZuYiMQKeANIATGw6GbZIG
 XXjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764445985; x=1765050785;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bq5yUqUCzfdjLEn9031/L9EMDQ3XGvUTCWlQPofKw7E=;
 b=kqfsWvmRujzdYdiuMDKnKb5PFzn5pMphVHkxYqe/I8uurUgWEyjKB3VwG/W7wyAJsq
 Ll3L3FXJzw9uVM7dIkWLZy+Ph2rQqrAxc6HHbg9EszlWOqvvJmWhZ7kpvIPexB26+u02
 2Wxfd4ztCPtmS4Wf3cga648PNAqerunlZi5EF8e4g4gfODkMxsATe4flM5XeNrkBmHmm
 IJ9s3JsynKaJbUlsxzaZaAP2e0JUlRp0CPlu5eK0EEK/8n1GGFjDTmKjtJx6Mwi1Iw1S
 dgmd4Sv1OQpHRE2GAhzbHBSexR0Eo8+StbTSuf6ZCvGhFVxbu7bIs2+5RC5pwXKmJB9z
 E2Iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+5LaA6xLhZpQ8MYXWYsGDiZ/3x6G5bMYlp6XWNtzKmsZAVdXr+6jYBPGC6gJd4Dutcqc6KZEHwlo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDMGmh+cqNa2at0Ym6U1EluGP6gfpAS8AP7QS8pxW0NxjFE1j0
 /pFcWPv8vhq3ICmTwfcdziLbcNHeTRMaJ5cwq+B0fyVNUqRC/SNMUZOC
X-Gm-Gg: ASbGncubcHBwQUJMGtFX3BEoY5btT68bSTUAY/lWZj34Dvb+AA0lTBMqBhORBCqRh2l
 8ymba8w6Umscu/RbxS0SWHg2L/As61UgJLNnxUZJvRicvdh6rX7CQ1Kcrjj4gWdUq5EYFLMSiej
 5By4dk8IGZUBIydRDA66FdNwx9v+vgXVj2rNFX9wNAEAPajnvvGSnPJ/Kl2qH3Vg6/jInKSan6S
 JZ9uLFXKDF0hUBTwA2NEjvQjcvoBb47WEMP5WcrrD0zA2cxXgGivu2XR1ggB9cdhhDl4PC4mpWO
 2WnTbn+n5i8bxkl0tAM+3fe8bNUdnHtjKHW0k5JTcmK8D6N+U8ywGzc/ce1dPJp4CJTE8aK0uQD
 mTcfQ1S88EEbUdOphK3/uMmJDk8hqVnrLnpf/CkScmMi+BKBffkiFJnqyzCR2kg9kCT8FUMGz84
 K2CNgCRcM=
X-Google-Smtp-Source: AGHT+IEfj6PVUeeY07J7TJfo/pC02NnxeqqVhA9KwWv0e199pnEc7YIXLK9r3fHsMgALzxDeBf1gGQ==
X-Received: by 2002:a05:690e:1510:b0:63f:a8db:47b4 with SMTP id
 956f58d0204a3-64302a8f75fmr24324286d50.3.1764445985371; 
 Sat, 29 Nov 2025 11:53:05 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:353a:b6ab:d4ee:67b9])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-78ad1044f9esm28751737b3.56.2025.11.29.11.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Nov 2025 11:53:05 -0800 (PST)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Subject: [PATCH 0/3] Unload linux/kernel.h
Date: Sat, 29 Nov 2025 14:52:59 -0500
Message-ID: <20251129195304.204082-1-yury.norov@gmail.com>
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

kernel.h hosts declarations that can be placed better.

Yury Norov (NVIDIA) (3):
  kernel.h: drop STACK_MAGIC macro
  kernel.h: move VERIFY_OCTAL_PERMISSIONS() to sysfs.h
  tracing: move tracing declarations from kernel.h to a dedicated header

 MAINTAINERS                       |   1 +
 drivers/gpu/drm/i915/i915_utils.h |   2 +
 include/linux/kernel.h            | 209 +-----------------------------
 include/linux/moduleparam.h       |   2 +-
 include/linux/sysfs.h             |  13 ++
 include/linux/tracing.h           | 203 +++++++++++++++++++++++++++++
 6 files changed, 221 insertions(+), 209 deletions(-)
 create mode 100644 include/linux/tracing.h

-- 
2.43.0

