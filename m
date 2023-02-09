Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A161690A91
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 14:41:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411EA10EAD4;
	Thu,  9 Feb 2023 13:41:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D58C10EAD5
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 13:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675950062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OzV7p16/yEZQKmwWUFxj9RZMdMX7gGqoUkNDU++eOPw=;
 b=VlU+v4pGRIRSCBGmrrEKNGSjUa8Lk7Crk2TJHyegN1agdUxAIGJ2CRaXwzc1xnXkPbUXKS
 uG6cymLa37siLKjfwzWCVBKTb8gUAEsQpmBeubH/4/Z8B1CBNwFcbBAHa/oj+5vM9j2XK5
 ++3c/99cSwMPFMHqEl9WT1BSmOsAbSk=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-333-bTKL-L8rO3SmNMb1s8Taxw-1; Thu, 09 Feb 2023 08:40:59 -0500
X-MC-Unique: bTKL-L8rO3SmNMb1s8Taxw-1
Received: by mail-qt1-f200.google.com with SMTP id
 cr22-20020a05622a429600b003b694a9f291so1106801qtb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 05:40:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OzV7p16/yEZQKmwWUFxj9RZMdMX7gGqoUkNDU++eOPw=;
 b=uyitPU3CDQV8r+/O+fm4aJbbrpxCkh8T1YOXH5/wWgfIrBnBHUwHavtctoSaBeaGgF
 sJDgMkaodAK4josxyPSKxnUJ553I3LsNcZPtwunUard6hIPJL7KHQZzNGMzMIGqohtfm
 9hhbLS/T32sda5vsE794fxDjc/ocI2m2p/TFeyjf3ICd3RqoRyyMTGHav2MicqzU4wnD
 xBc8yt1vOS2V+fJ5TqfLGMTw8QBwqX+kd+r9FGI7xtqDDIl9+6N7xM+4lQruJeQtTl0g
 RFHTSNoQ4EJ8UPIVlZOvT4HYEN1u46L7WvZKk2Fv0DDRPu3SDKcWLC/NyAmJsyQfDZnU
 nbAA==
X-Gm-Message-State: AO0yUKWs47NLFub44Q1OzL+yZ9BDQ7x8tO59mhdS7X7/v/QYS9phsmIa
 OIPFwVR+c4ZW/fIIhQ/VkVlPBUE82aQ9z9eVs8hgdZCj36i/FEP7JtBREMSAwArK84Dc/tKOHjz
 R+iQ7qXX8JYFAxq33a7ri2ypS4VK9
X-Received: by 2002:a05:6214:2684:b0:56b:f2d7:f66d with SMTP id
 gm4-20020a056214268400b0056bf2d7f66dmr21321725qvb.46.1675950058605; 
 Thu, 09 Feb 2023 05:40:58 -0800 (PST)
X-Google-Smtp-Source: AK7set8nFqGwwydA/Qv//jTnLpI8YmlDl2IBDR+nilaOo8Jek16gZhJgf+ALhc6AphqS+W1bio6i8w==
X-Received: by 2002:a05:6214:2684:b0:56b:f2d7:f66d with SMTP id
 gm4-20020a056214268400b0056bf2d7f66dmr21321696qvb.46.1675950058373; 
 Thu, 09 Feb 2023 05:40:58 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com.
 [24.205.208.113]) by smtp.gmail.com with ESMTPSA id
 t187-20020ae9dfc4000000b0073902217c00sm224072qkf.23.2023.02.09.05.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 05:40:58 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, Dmytro.Laktyushkin@amd.com,
 qingqing.zhuo@amd.com, Charlene.Liu@amd.com, nicholas.kazlauskas@amd.com,
 meenakshikumar.somasundaram@amd.com
Subject: [PATCH] drm/amd/display: set should_disable_otg
 storage-class-specifier to static
Date: Thu,  9 Feb 2023 05:40:49 -0800
Message-Id: <20230209134049.2000865-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Tom Rix <trix@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

smatch reports
drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c:90:6:
  warning: symbol 'should_disable_otg' was not declared. Should it be static?

should_disable_otg() is only used in dcn315_clk_mgr.c, so it should be static

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
index 8c368bcc8e7e..a737782b2840 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
@@ -87,7 +87,7 @@ static int dcn315_get_active_display_cnt_wa(
 	return display_count;
 }
 
-bool should_disable_otg(struct pipe_ctx *pipe)
+static bool should_disable_otg(struct pipe_ctx *pipe)
 {
 	bool ret = true;
 
-- 
2.26.3

