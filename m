Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D1DAC3C40
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 11:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BCBD10E297;
	Mon, 26 May 2025 09:01:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gOweAHam";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C72A10E297
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 09:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748250112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XpqFq1Cn/q29H6M8GbCwazfqpbC4oULqm059siADfdQ=;
 b=gOweAHamXFvLGE1s7fLFszkm0JNBoRfqFrRYqp25G/l6ziTJzEDHRbWp2EeRBATyG/07iG
 hoxMJ+12oMtmAspXdTnbVEyIQwLNA/hMqCZx2t35lqN1vj11Fa5+dAzI2djnjTxoLspptV
 inNlNM9IsPz84CTfr3SQa5FYGUMtXng=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-1f8mU95FPdWY1W_rbuiKNg-1; Mon, 26 May 2025 05:01:50 -0400
X-MC-Unique: 1f8mU95FPdWY1W_rbuiKNg-1
X-Mimecast-MFC-AGG-ID: 1f8mU95FPdWY1W_rbuiKNg_1748250110
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7391d68617cso2307617b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 02:01:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748250109; x=1748854909;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XpqFq1Cn/q29H6M8GbCwazfqpbC4oULqm059siADfdQ=;
 b=SpW//MD3qUAJ0rn8NP/h+lax0RWctGYflnq4ghEZh+VVC9CWWg7PAXFZC43PCNk3r1
 HvM7B9xvfSjdg/Hg2SoNt2YlMMayf+oxmNFEp6Um3sXAI6WytoB1/JW/OW2RAMQfBMja
 05RDYfyVXBKWiNMMCvaY+HsOKX9XG4zYuOoBNNvFhtfskEbAktnX3A092bE2SZW4ZVb/
 ZjOO7n0xYkLIMPbN6y3rSlvWwy/V40b725SzGP+1uQ995Iqummu4STwjYoqlnZtFuXlP
 R5rcY6EKVaMW3vxkGm6hu8gCR2husLNlQAuC1Nle+2Oz4N/oHUZ6bb3Io3JacaYtwYfr
 Y4ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVAwP5yqLUt4Is5xH9WxEZYpqccdoNiH2gEN1ZczVUYs07GBvtDsKcLAqmhMivg20H2rhFP9jnxhk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEFYrn4Cq5ugoWzXm3njeiIoePkM+w3oSu4wcdphlE2HlQAAnC
 PksSy5+BoPSDVFYgQSCA3OJ/0j+zvb42mWBPvc06j35ALoprY0WNMwOK1lrmFWtcF4xRnzY6pIc
 4vCxAK221XkGEHFGRdNLa6y8Mh+zIMzsNLY+5vMkAiBmBnqCefqkXxlE3RWe4eySgs2GgUQ==
X-Gm-Gg: ASbGnctJNyn+z5u3FDLCtbS/K7dkKn9xeiTrwJFtBxpzCvAM1jOSBZiRR7bzKz4JopL
 Lc3mA0uRKbYqfpdCiJMMe5a5MxK7vDWMfVR5OoxhC6gRF/E3HU4/ql37D10SbGgVu6UJvo8hgM0
 g6AEMER5bdN8J/euyd3geYVJVgRZFsKPwCjcU3iTtxfhMoA+dUyn4ey3t+Q5fI/slPh1Tm/b8Kq
 ZjOkcIMQgEeYRq6FzsT5+u6x2xIjinodBhppAHnSlltaZIccDjR3lhJtWtONcEzekdIZxc4AgMA
 BhRnVskMeHAT
X-Received: by 2002:a05:6a21:3390:b0:1f5:8cf7:de4b with SMTP id
 adf61e73a8af0-2188b6edb8amr12702087637.16.1748250109593; 
 Mon, 26 May 2025 02:01:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEg0OYyfVBPgdKD2DLb50UwcWBJCWgjQ/A2N0sS7L7e5vajyw7pe8MKb0ud18NgI98tWZxDgQ==
X-Received: by 2002:a05:6a21:3390:b0:1f5:8cf7:de4b with SMTP id
 adf61e73a8af0-2188b6edb8amr12702050637.16.1748250109169; 
 Mon, 26 May 2025 02:01:49 -0700 (PDT)
Received: from zeus.elecom ([240b:10:83a2:bd00:6e35:f2f5:2e21:ae3a])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a9878b53sm16575092b3a.152.2025.05.26.02.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 02:01:48 -0700 (PDT)
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
To: drawat.floss@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jfalempe@redhat.com
Cc: Ryosuke Yasuoka <ryasuoka@redhat.com>, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH RFC drm-misc-next v2 0/1] Add support for drm_panic
Date: Mon, 26 May 2025 18:01:04 +0900
Message-ID: <20250526090117.80593-1-ryasuoka@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6YPSBRomve6HQcCow0-dvU2xQAmAxCFV_TQyx_TdEVU_1748250110
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

This patch adds drm_panic support for hyperv-drm driver. This function
works but it's still needed to brush up. Let me hear your opinions.

Once kernel panic occurs we expect to see a panic screen. However, to
see the screen, I need to close/re-open the graphic console client
window. As the panic screen shows correctly in the small preview
window in Hyper-V manager and debugfs API for drm_panic works correctly,
I think kernel needs to send signal to Hyper-V host that the console
client refreshes, but I have no idea what kind of signal is needed.

This patch is tested on Hyper-V 2022.

v2:
- Re-write codes with regular atomic helper. The driver was implemented
  with simple KMS. So replace it with regular atomic helper in [1],
  implement this feature on it.

[1] https://lore.kernel.org/all/20250427101825.812766-1-ryasuoka@redhat.com/

v1:
https://lore.kernel.org/lkml/20250402084351.1545536-1-ryasuoka@redhat.com/

Ryosuke Yasuoka (1):
  drm/hyperv: Add support for drm_panic

 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c | 36 +++++++++++++++++++++
 1 file changed, 36 insertions(+)


base-commit: c06cb85ad1412c6ff34792b028b2f89495761398
-- 
2.49.0

