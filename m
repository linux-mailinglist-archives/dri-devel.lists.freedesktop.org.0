Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B014FCC86
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 04:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD7C10E012;
	Tue, 12 Apr 2022 02:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4365B10E0AB
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 02:38:30 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-d6ca46da48so19400988fac.12
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 19:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pa9WwzHadKlCjrvfcB9D4MgnDzHSCGlSrVswLImMa8I=;
 b=D72TXjIRRxAYUF1GhrIJuBx5NNanvsTIdEn3+x88WpFvr8xQvL9Okk2fyovtwES8im
 rjXE8JZEsJHZ+50iEyXzBCfhA0H7a9ghbwIyEo5RRHCX5CUvnxCb12+TN40zmDgzQrU+
 w+feNeZGB/zowaw/EuMMhc9s644RVHwPs8itqCEzBzb9N7Xs0yOOXwRQW+Sn+gsDLooD
 qI8DofOhBZLAQX/9GiPaHsi/I9Zbx8qAO0bBFKt+5D+lazIILxC6JOY284BEVlabuh/m
 DaLXJHuHws8JcJ5GdqhMoxW6X+RdoWdHxwN4I+ScA+JDDb2rchTTzjX/6Z0qAKSqvBkB
 02ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pa9WwzHadKlCjrvfcB9D4MgnDzHSCGlSrVswLImMa8I=;
 b=UdBfRArZl+X0fK0GYnUXEJfcIX4LPFE0xdsI7mbKUOr//+pzmYey6hNttobua2aBRv
 7Bgrg/+nI4MhHKDuXXESv7kmVLKwKw1RT7jQxpZ5X4DLtQC3/Pie+U8q4W9nPu80yZoO
 cILaNo37Mrjy3wNQfEiu3TSxRfRLnvy29GcyDo9zIK5z/pzsdTwkh2VTqYghuzOrNYbh
 DurjqonN4bfXfkrXLycjUEqZWrMXA9s4q2GSkm3qr2xmF6fGbt8HkPgioS28L8oaYWLb
 dqur21t7ivZGz5I+MMmarYMYMjfD4EJ4LJVB/aAhpbEvUIYTteQkh6KNMlBm7o9UH8o7
 Z14w==
X-Gm-Message-State: AOAM5339iQmae8701TNfTfiChpYg5HWuzGWCdu6ti2wdHwfv9TLlulTZ
 TswbyfbItQKOCsRRFAB924JRQa2wazLkUTfl
X-Google-Smtp-Source: ABdhPJyCDg9ewqGRiwFCMT8iZhMryAHQAGR8IoOQ4I0nYRrdV4IAsb5Ni421s9WyGQK7M1Rg7wrRNA==
X-Received: by 2002:a05:6870:c20e:b0:e2:ae93:8ee1 with SMTP id
 z14-20020a056870c20e00b000e2ae938ee1mr1156567oae.12.1649731109593; 
 Mon, 11 Apr 2022 19:38:29 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4c2:8a9b::1002])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a9d744e000000b005b235f5cf92sm12995256otk.65.2022.04.11.19.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 19:38:29 -0700 (PDT)
From: Tales Lelo da Aparecida <tales.aparecida@gmail.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, andrealmeid@riseup.net
Subject: [PATCH 0/1] drm/vkms: check plane_composer->map[0] before using it
Date: Mon, 11 Apr 2022 20:38:00 -0300
Message-Id: <20220411233801.36297-1-tales.aparecida@gmail.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Tales Lelo da Aparecida <tales.aparecida@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello, I'm interested in collaborating with VKMS, please let me know if there's
anything that I could better.

Tales Lelo da Aparecida (1):
  drm/vkms: check plane_composer->map[0] before using it

 drivers/gpu/drm/vkms/vkms_composer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.35.1

