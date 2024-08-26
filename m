Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1ED895F143
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 14:25:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B2B10E1EE;
	Mon, 26 Aug 2024 12:25:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gaDNmo3Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C5210E1EE
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 12:25:46 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5bed72ff2f2so5218870a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 05:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724675145; x=1725279945; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fNBj9hOATBnhz/4mAZ40a6b5DcGcVB6sfQANvzEIDEc=;
 b=gaDNmo3Z5Z+obpi0WVKr5cGP7WElfmTM786z0OtUjFEzDMLyODQkjFT+bHm7enCGJ/
 YBbYKHS/ZGv4h7PERaxhdFgPI0aYXM77oPPCo9HzNxevF38h8Orn0fMjhWQbjNvobBW7
 guE/XeMWtAFBfyN/QV/ENaPjQ+SZYNBaAlbWwzg24K3r1dGk+ER04yYYTcVUhKBR2eYS
 UAGyVrmAGEovQ6QfViVtB40L7j7bQhJjd5kly/++IbWBijKKyg7Ac/lQd/8gBb8rwmZ7
 iF3MqEWPCiANO848EqEvqAktOG8F+Jj0bMuSgJWC6TkMLXovEVUhcETDjIU2ljC4i8tz
 7QbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724675145; x=1725279945;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fNBj9hOATBnhz/4mAZ40a6b5DcGcVB6sfQANvzEIDEc=;
 b=eK39W+cWnqxPxEOtm0m9nrgIxK/NMy1i+VqAml0DbI8ILk2Twg58RWD14mmzVshzyQ
 wmNW8qvS1gu0MMyrcSme+0z5AXocgt5OUp1Mk6S8DGst3DahqfwvRr6q3SruHb8+POX2
 uXTbvlqGycEsdbiaTAEpQA66Io77gh72qNkvLte62ZZUhFCeWqoSXx1bQOp/9Zj9Ga1i
 m3PwaT7MEjay7182Is4N05THqimqMO/YRQNCNngLdHCyNyRTARLtzIGnk7Jp+ryyDzFx
 2GyNOuoSSb8OqainvJmEtckriw4r4hohhYBg+czH24ge/O09fUO5iEQAMz0D8J9C4rRA
 QtTg==
X-Gm-Message-State: AOJu0YyZSqO029esf4xDbUdnMRXHzKxg6QVC7pCT7PBYNKr2rrDopz/k
 Xe6q7Cy9AsnO5YyY6H3VWfTIEtmljn3IGXOfygX9HDwi4qXB+/Dm
X-Google-Smtp-Source: AGHT+IHhrnJfCLxeHkYGPcYBa0ig0XlsyOKlsFs1HxiP2n8L/RTvXYdDZ2D7C1iGy16YY8uO0+Oe5g==
X-Received: by 2002:a17:906:d264:b0:a86:a1cd:5a8c with SMTP id
 a640c23a62f3a-a86a52bb759mr612058966b.22.1724675144376; 
 Mon, 26 Aug 2024 05:25:44 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1594:dd00:26ff:beb7:f040:ba50])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f28f122sm655073066b.49.2024.08.26.05.25.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2024 05:25:44 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	vitaly.prosyak@amd.com
Cc: dri-devel@lists.freedesktop.org,
	ltuikov89@gmail.com
Subject: [PATCH 2/4] dma-buf: give examples of error codes to use
Date: Mon, 26 Aug 2024 14:25:39 +0200
Message-Id: <20240826122541.85663-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240826122541.85663-1-christian.koenig@amd.com>
References: <20240826122541.85663-1-christian.koenig@amd.com>
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

The dma_fence_set_error() function allows to set an error code on a
dma_fence object before it is signaled.

Document some of the potential error codes drivers should use and
especially what they mean.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 include/linux/dma-fence.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index e06bad467f55..e7ad819962e3 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -574,6 +574,12 @@ int dma_fence_get_status(struct dma_fence *fence);
  * rather than success. This must be set before signaling (so that the value
  * is visible before any waiters on the signal callback are woken). This
  * helper exists to help catching erroneous setting of #dma_fence.error.
+ *
+ * Examples of error codes which drivers should use:
+ *
+ * * %-ENODATA	 This operation produced no data, no other operation affected.
+ * * %-ECANCELED All operations from the same context have been canceled.
+ * * %-ETIME	 Operation caused a timeout and potentially device reset.
  */
 static inline void dma_fence_set_error(struct dma_fence *fence,
 				       int error)
-- 
2.34.1

