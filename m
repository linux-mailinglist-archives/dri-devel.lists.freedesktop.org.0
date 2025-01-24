Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2466BA1BBEF
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 19:15:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E26310E9FC;
	Fri, 24 Jan 2025 18:15:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="V5XYXxdT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA9010E9FC
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 18:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737742530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uNMLMXRsGIwKH3oEVvbcuQJLGughbp+wVpR10R9kOUk=;
 b=V5XYXxdTN/g8xO9nnBLki1bdDmZp/Ff25n5+5S2mkDJJAa0qarQJVN2Ef/i/JKBgSinyV8
 48g7Zdp5TjOJAiIKG6M8NSQutP9Pv3eGuR+2FHyY2F71K3myB/IuUf/Dx7tDG9csTISKyq
 iZxxPc2Pu0E1AyggfW5lgtQqypvwZjo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142-GxxgIJZgP4Speru2tYpR5Q-1; Fri, 24 Jan 2025 13:15:28 -0500
X-MC-Unique: GxxgIJZgP4Speru2tYpR5Q-1
X-Mimecast-MFC-AGG-ID: GxxgIJZgP4Speru2tYpR5Q
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43623bf2a83so19366995e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 10:15:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737742527; x=1738347327;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uNMLMXRsGIwKH3oEVvbcuQJLGughbp+wVpR10R9kOUk=;
 b=FX+3l8x6x/5YJpHSgIoA9sADV/XkWGmZiV5ClwEP0lhajktb4rE3+AS0auXJy5pMj3
 GT3CB71Mxm+dEhgfUw0UtyOc46CMTW/A5tZ1HG7+dA64OhiCyNnxBOSH3/KfZfKaem6d
 tGkA2gHxifoUqglPo0heffeH33+nxMsEBeufh1Xbhk+0xvZ0+GFqwWEMsx8jzVM2mJ/L
 C4jR7rfHgHw3CGS5fWGjw5fS8K7PzyP8v9B5TmgJEwZnUVjEDljFUWObgzhqsm48ehIT
 8UyLetbQbTLJOardgnNNmDcPHAySXGpTMrltJl5nc+C2pwn8URuPghsDxAQMWIr8Km0i
 3qhg==
X-Gm-Message-State: AOJu0YyJwy9Wu+ka2mD0zQm3lgAS4fB/sD73A4CjwDDn5LZU6/K3/Qhc
 LuelO2kt+rCIBsu39OhX5y8iyy10DNK3QyCy7A2vffYw2SjgdrmUUa33DQbto9EtnniXUw/arGZ
 Iqp2D6Iv6wfxsQM0hgrApSZlmXR8rtNY3xX0x2HJsi8o7duvCjR9DmBZyTMPVbeGa2w==
X-Gm-Gg: ASbGnctKTX/j7dZIA/RSKniQL2FCFQJRKe6EYrhFae89XRBcd/gkruphajymoUoDSn5
 xxHU7V9Tgg3pisIOvJjWyy1JG0FWoAKD5knPzegLaOvf9TQpW/1FglB0r8MLScjmI2a+9lqP2OV
 +Q1nR6W3sgIRf5PnDu4tQFX26euW5r1CjeauoLMHod7gk4mW0tAum9tfcSCVP+mjflyWF9yh81d
 SmWxCvxh7m5KrEqbJOmuBqCnMW3XbIuGXSM3Or5oomVPhd0WMkudAGder82SRUEYzMh0lSCSw9c
 0bCIir46v5xGrt8e6NI=
X-Received: by 2002:a05:600c:83ce:b0:436:ed33:1535 with SMTP id
 5b1f17b1804b1-438913e0384mr311105105e9.12.1737742527594; 
 Fri, 24 Jan 2025 10:15:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8s5w2r5GnraTv+tLMkaOyIRUe0oMPHR+MHeLBSQhRCsweLhtKjIKgoOzmPKljbLSnElWINw==
X-Received: by 2002:a05:600c:83ce:b0:436:ed33:1535 with SMTP id
 5b1f17b1804b1-438913e0384mr311104875e9.12.1737742527262; 
 Fri, 24 Jan 2025 10:15:27 -0800 (PST)
Received: from localhost (p4ff2332e.dip0.t-ipconnect.de. [79.242.51.46])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-38c2a1bad16sm3434838f8f.68.2025.01.24.10.15.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 10:15:26 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 David Hildenbrand <david@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alistair Popple <apopple@nvidia.com>
Subject: [PATCH v1 0/2] nouveau/svm: fix + cleanup for
 nouveau_atomic_range_fault()
Date: Fri, 24 Jan 2025 19:15:22 +0100
Message-ID: <20250124181524.3584236-1-david@redhat.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0zcPqSET9FEiFLh8oWF2daljk7UnFsnIqkizZgTiXwY_1737742528
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

One fix and a minor cleanup.

Only compile-tested due to lack of HW, so I'd be happy if someone with
access to HW could test. But not sure how easy this is to trigger. Likely
some concurrent MADV_DONTNEED on the PTE we just converted might be able
to trigger it.

Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Alistair Popple <apopple@nvidia.com>

David Hildenbrand (2):
  nouveau/svm: fix missing folio unlock + put after
    make_device_exclusive_range()
  nouveau/svm: don't initialize ret in nouveau_atomic_range_fault()

 drivers/gpu/drm/nouveau/nouveau_svm.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

-- 
2.47.1

