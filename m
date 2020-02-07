Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0A515610F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 23:14:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D686FDD8;
	Fri,  7 Feb 2020 22:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 393936FDCC
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 22:14:03 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id s1so460389pfh.10
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2020 14:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MTe0CW9jxWI6fSYrv38d/IBZLnVvjUU+5+AqeeybSs4=;
 b=OlE5Ig43tbuBy0DZeluuqgtUvyE4WkpwkmLMpHffLAXrWbmJY+/ILf1sJDcDqrjzIM
 ZXi4hvrNvLaRalmj6hENly7lIRDGsE+5vbZBslQSm6F8n27AbsdHCug4SYydjqkaAAwZ
 qkh0wmpXU024f3EvP/XiXJR/Bhh0rDFibBJtr/YsZo0iZ1kX3U7oaqjAGM0kXIQOGe4A
 Apr6vJD0diI5ZXlwyKs2952v4KwjQ8cC6+8eCNNvB/vOEkT6JZN0sQVsvINSzBEAFT++
 HLxugozJ4a+fAJN14nUHY999jbZhHB/du8sH8h6D/4G254TEND38pPlXpLu6OE/xVFHz
 j0VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MTe0CW9jxWI6fSYrv38d/IBZLnVvjUU+5+AqeeybSs4=;
 b=tEzbHoed07na2nW2kpDxg7UAAGKGywCYn4Ccfb/VdX29E36LEVdZRf++ErvL6MAEBA
 9LU1/lfQdFNYAwHUjHfk8uil/jaUpo7EKvxkyM2ovIfwTb/tJ5jQgbpEpK8jsBiE5PlI
 nMSHP3SYcaLQyDFWC1lxjf4vYAGoyBZ9ELA/qSmuH3n5vsJlM3leDynPhqrsPXp5nfuC
 9+C9syKVb7JgJ1tipfXPuQVgbrIxZomwzbs8RCcSwjaBIWaLpFHh0jDXelQFwwMha5tF
 MNsejaEROZjWL/12xc5JSCy0smvv6+AlOEIu4SYpHErZ+JH52UIK+KjHeOzD3gcriPR5
 Na/g==
X-Gm-Message-State: APjAAAUqdjTpraztmIUt4K4zqqhV9bTPvB3vk4YSDbMJEkh64o8Loj7V
 mLn/RxbYCWaHhPa98D6FXR89ifri
X-Google-Smtp-Source: APXvYqwfp6Nof+kjQxfRvbJVdo3zB87Blxdo+rxmJUdDS7BvQ5ge+xRVHHrAN/vN+JlbLdSVkjFCHA==
X-Received: by 2002:a63:cc4a:: with SMTP id q10mr1319263pgi.241.1581113642158; 
 Fri, 07 Feb 2020 14:14:02 -0800 (PST)
Received: from olv0.mtv.corp.google.com
 ([2620:15c:202:201:9649:82d6:f889:b307])
 by smtp.gmail.com with ESMTPSA id t65sm3899043pfd.178.2020.02.07.14.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 14:14:00 -0800 (PST)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/3] drm/virtio: rework command batching
Date: Fri,  7 Feb 2020 14:13:56 -0800
Message-Id: <20200207221359.187340-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200206192214.86818-1-olvaffe@gmail.com>
References: <20200206192214.86818-1-olvaffe@gmail.com>
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
Cc: kraxel@redhat.com, gurchetansingh@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This series replaces the global disable_notify state by command-level bools to
control vq kicks.  When command batching is applied to more places, this
prevents one process from affecting another process.

v2: update to this convention

  virtio_gpu_cmd_foo: add foo and commit
  virtio_gpu_add_foo: add foo but do not commit

However, the spinlock is now grabbed twice in both add and commit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
