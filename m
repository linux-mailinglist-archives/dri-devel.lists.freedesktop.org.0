Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B63C20A31
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 15:37:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 095C110E9CE;
	Thu, 30 Oct 2025 14:37:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="S22ZZovO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B7D110E9C5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 14:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761835065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nkks9IPPTiRjudJKz2fy8ztuwHSVrBIwR6A4uWG3RWI=;
 b=S22ZZovOv4dk2DtO7f6rbdTBTGuyF0LZ84MApUzajYKYF8+3VgcX9Rp8w1uLRptBb2JjYW
 1BnfhiPzDJCNKpttzh3fhPZVp8NUkA8MrxEe3XU+RIgeeLLDrQ/upvsjq9BjrD+oP1DEJ0
 xNyN+hJKrZJg3RNPYsiokGbnNDuzgsw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-310-bYhw2toDO3uww24gP8TRtA-1; Thu, 30 Oct 2025 10:37:44 -0400
X-MC-Unique: bYhw2toDO3uww24gP8TRtA-1
X-Mimecast-MFC-AGG-ID: bYhw2toDO3uww24gP8TRtA_1761835063
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-426d4f59cbcso1287100f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 07:37:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761835063; x=1762439863;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nkks9IPPTiRjudJKz2fy8ztuwHSVrBIwR6A4uWG3RWI=;
 b=wwaF9ZZcrlWdXN+m60S24kSn564tCmNZXaLV+NQ257cfTUeBuLZMU/Q7JoAUfR8rrT
 1aY4coqGEy1OQ7R9uNIXxdTAvlE5mxuEbPgtcRN8vTyAIvnKNsdQTFyGr7zGvQy09AW6
 REu3cFKj1sd+t8x9olvIBl2IDZUhSXfyM4MHaAuBYA/QC0aUw/HF6ipk+6MzGxGEmXKe
 Ss8n+jV8wEPQUWgeRO8l/M59xmjwo1jA8TU+UQkQF4/np2b1+XGoD7VRC7xwjInPm3I8
 lW5HIWJ3nCo+pXGUEBbR/o6frWP0S0GPW+jZ58PoZpe68f7U+d4/ydRGY3w0zlvvAuXq
 6POA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjiPWibEPxWSie80eWxDjQcXNLHMiJlFVO+pb9NGQKv0eK5TdW/2mb1a9O4+Bso1W26tFmBOKl0rc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtLp/uv50EBoFJV6mgaZNk+BmujNQEZc/1FxiEnjBZ9SM7JMoG
 HPjgn9KrBzoO2BvxuhK+ceHyN1YRTKZhIOiTiekGrDjGvR2tcISJhmJQjSX5v3v9zSvfCyeGHQy
 /LXEdVOYdk/dlReMHgjnmU/xVUlGmH7+K/NpDr9ULmjbfTmTeKNZKxag8B01zZOLVkJVYDw==
X-Gm-Gg: ASbGncuuPPSw2b3jsJfTHZEvxAJfV1OtzcLKNhgKLOzymmRxXOfOyk6fKZmOVFZbg19
 47jVURuJbL6qS03YLjNjuAebkRmc2pNmfMXKEgr4JnVYxXmYFdulhfDrB/ROBRFpI7qD2GScS9s
 5blIVOaURNZeVNlnTI1I0DD9pkn/w0WV7ja1AY7XyuWFqT5AXzNB0sBIUlBnlXJutmjL5ONyEHA
 9a8QU+DcFrJSm1SuLC/oX/JnR0+Gv5mh5vWppPh8BIO50dVs+Z9rMCw163d73leVK7Fcou2iRzi
 YGmM/TnTcKF+UNEhYG0KL1BAlzRvAWsPjG0uUuNa6Wen4cCyL1Os07Wvbxp6vPu/9kAbK7xyqXa
 LnLx7zAuQFQnQTWEiUDf0IMmKxqyvqdqbqfVozaYkAx5VGg/o
X-Received: by 2002:a05:6000:1449:b0:429:b963:cdd5 with SMTP id
 ffacd0b85a97d-429bcccf0aamr87220f8f.5.1761835062923; 
 Thu, 30 Oct 2025 07:37:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4Hb1Zr2+1H9F1aQQVjn8swQhMlyoOrBtrdyyo6F0SLZbU4syUP2hFz8P5UzKpetZ1C9iD6A==
X-Received: by 2002:a05:6000:1449:b0:429:b963:cdd5 with SMTP id
 ffacd0b85a97d-429bcccf0aamr87184f8f.5.1761835062481; 
 Thu, 30 Oct 2025 07:37:42 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb
 ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952b7a94sm38472105f8f.5.2025.10.30.07.37.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 07:37:41 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Austin Zheng <austin.zheng@amd.com>, Dillon Varone <dillon.varone@amd.com>,
 waynelin <Wayne.Lin@amd.com>, Dan Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Jun Lei <jun.lei@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in AMD DISPLAY CORE - DML
Date: Thu, 30 Oct 2025 15:37:37 +0100
Message-ID: <20251030143737.136120-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: w00a3Ud7SWSh2SSQTZAaxCwumbWxTGYU8K6JvbBOkGI_1761835063
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

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit e6a8a000cfe6 ("drm/amd/display: Rename dml2 to dml2_0 folder")
renames the directory dml2 to dml2_0 in ./drivers/gpu/drm/amd/display/dc,
but misses to adjust the file entry in AMD DISPLAY CORE - DML.

Adjust the file entry after this directory renaming.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4d739e18aab6..7031ee1e7cff 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1080,7 +1080,7 @@ M:	Austin Zheng <austin.zheng@amd.com>
 M:	Jun Lei <jun.lei@amd.com>
 S:	Supported
 F:	drivers/gpu/drm/amd/display/dc/dml/
-F:	drivers/gpu/drm/amd/display/dc/dml2/
+F:	drivers/gpu/drm/amd/display/dc/dml2_0/
 
 AMD FAM15H PROCESSOR POWER MONITORING DRIVER
 M:	Huang Rui <ray.huang@amd.com>
-- 
2.51.0

