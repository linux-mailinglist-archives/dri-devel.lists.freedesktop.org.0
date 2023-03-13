Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECC26B8CDD
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 09:16:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 168F110E726;
	Tue, 14 Mar 2023 08:16:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16CFF10E52C;
 Mon, 13 Mar 2023 13:55:13 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id r15so21848298edq.11;
 Mon, 13 Mar 2023 06:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678715711;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5ANUqqLjStoxoRFBqdgwmvZsT70GJ/Jr3W8t8R6fOUM=;
 b=LfvryJ/Hh9VtYfYGkYcRE5XtQIW5CiCZpxNR9nyzT1kOsu0Jrtjr7v2iOxMb/w99cx
 tPaTM4Eluypt4+FrGHJ4bjOiMtHW3w9W5QMalZWrztjOw+h0fcExZfKUluQdaNxWUYXJ
 ztahp9nyxgr8S5qxk5aNIdgqrLwh4nlwLflUyQNzYL7zvYo+v0l7j6OL1sutWFvT2J/p
 CEn84V+4Q5kyARP8+iDj6iemwFOwiAsApfRDaAE5fNTr52L4TJ6hyXW1QTsibXdg3zFG
 NB/Rps7/RbXFEYRDO4UbwQrZrQPsvCTZqFGZbzdWpBAPkqbgLBWxg1WR5aNQ7MrM4SOW
 B8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678715711;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5ANUqqLjStoxoRFBqdgwmvZsT70GJ/Jr3W8t8R6fOUM=;
 b=28NkNQ4qZXvd4e0MhAagjbtfXdVqHeiuIpqNtayH/RST6zp/UFrETPh6IJ7uJQBy3x
 KzXA7B3mnr5jA+Mw80OQixIiwOy2B5gPypYRAKq06qGZ/EVltHJ4XU2v2kowzu9hhmS7
 fwpfA9XvdLvFrx6dWnVOrD/Z/Wn+sTz2p9QN74zG1XkmDWb5tAGCgAKymgFyS+wpXxLY
 MK6AIdm23QB6PfYvbXcCPopFLg4Hra9+DAH1iPjRuZrGSQwWDY33gWVRsf/JbI9KriE3
 GR5INyqyYnGqBylnPoWBEZRc120GN+TgxFy0tn4NCl3ZTW/uzMb7qr2a0WzvBNLyPgQ+
 ONiA==
X-Gm-Message-State: AO0yUKVIOGZzFuA2M2Gc/mrtvbHPnVxtuTd5MB6ES36GhCDFvLyiQZP+
 mSgS3KRrTCbip/8nyu13xew=
X-Google-Smtp-Source: AK7set9/H1wWlFAmPUJSqeoduvu77jubQDUoBG2Tq/orIZDxpSFJwPGjAQdHPFvc9rKR1pOjDEClTg==
X-Received: by 2002:a17:906:3141:b0:8b1:7b10:61d5 with SMTP id
 e1-20020a170906314100b008b17b1061d5mr33118610eje.33.1678715711476; 
 Mon, 13 Mar 2023 06:55:11 -0700 (PDT)
Received: from [127.0.1.1] (i130160.upc-i.chello.nl. [62.195.130.160])
 by smtp.googlemail.com with ESMTPSA id
 t29-20020a50d71d000000b004fb419921e2sm2100094edi.57.2023.03.13.06.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 06:55:11 -0700 (PDT)
From: Jakob Koschel <jkl820.git@gmail.com>
Subject: [PATCH v2 0/2] drm/nouveau: avoid usage of list iterator after
 loop
Date: Mon, 13 Mar 2023 14:54:48 +0100
Message-Id: <20230301-drm-nouveau-avoid-iter-after-loop-v2-0-1e6428cc7fa8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACgrD2QC/5WOwQqDMBBEf0Vy7pYkFqU99T+KhzVudMEkJdHQI
 v57o3/Qy8CbXWZmE4kiUxKPahORMicOvoC+VMJM6EcCHgoLLXUta6lgiA58WDPhCpgDD8ALRUB
 76BzCG269tfdWNQ1ZFCWnx0TQR/RmOpIcpvJ6HN6RLH/O8ldXeOK0hPg9t2R1uP/UZgUSZCs1G
 V2XAfI5OuT5aoIT3b7vP6y2HRnrAAAA
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>, 
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678715710; l=1449;
 i=jkl820.git@gmail.com; s=20230112; h=from:subject:message-id;
 bh=2L1COAFZdosvV2nj+9Azdzd+YrB52T+o5+nwJnnaB04=;
 b=bzOGournFjDpt2sMS0dAIh4T4eb7MuWaz0jjEOJP/0+zGY+ul4w4rHxchzbQWjNAK2Exf5l6K3zw
 UxK4gnsXAp1nsjLXuxfTz8D3BlJSObdekHvIPgtIxVdtICKsgUqM
X-Developer-Key: i=jkl820.git@gmail.com; a=ed25519;
 pk=rcRpP90oZXet9udPj+2yOibfz31aYv8tpf0+ZYOQhyA=
X-Mailman-Approved-At: Tue, 14 Mar 2023 08:16:08 +0000
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
Cc: nouveau@lists.freedesktop.org, Pietro Borrello <borrello@diag.uniroma1.it>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>,
 Jakob Koschel <jkl820.git@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch set includes two instances where the list iterator variable
'pstate' is implicitly assumed to be valid after the iterator loop.
While in pratice that is most likely the case (if
'pstatei'/'args->v0.state' is <= the elements in clk->states), we should
explicitly only allow 'pstate' to always point to correct 'nvkm_pstate'
structs.

That allows catching potential bugs with WARN_ON(!pstate) that otherwise
would be completely undetectable.

It also helps the greater mission to hopefully move the list iterator
variable into the iterating macro directly [1].

Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
Signed-off-by: Jakob Koschel <jkl820.git@gmail.com>
---
Changes in v2:
- convert BUG_ON() into WARN_ON()
- Link to v1: https://lore.kernel.org/r/20230301-drm-nouveau-avoid-iter-after-loop-v1-0-0702ec23f970@gmail.com

---
Jakob Koschel (2):
      drm/nouveau/device: avoid usage of list iterator after loop
      drm/nouveau/clk: avoid usage of list iterator after loop

 drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c | 11 ++++++++---
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c    | 10 +++++++---
 2 files changed, 15 insertions(+), 6 deletions(-)
---
base-commit: c0927a7a5391f7d8e593e5e50ead7505a23cadf9
change-id: 20230301-drm-nouveau-avoid-iter-after-loop-4bff97166efa

Best regards,
-- 
Jakob Koschel <jkl820.git@gmail.com>

