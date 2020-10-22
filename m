Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA93296A35
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 09:22:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB346E49D;
	Fri, 23 Oct 2020 07:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B9DF6E210;
 Thu, 22 Oct 2020 13:40:53 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id v22so958680ply.12;
 Thu, 22 Oct 2020 06:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6ARfb7CCtAyGQWozbpcu69TiW9MOgZYC7V52jr9EMdI=;
 b=cPArrMKj7xSwULJAYitN0m6vC7G/wTwv5trn8fq+nwf0A+2hp5LU49pAbuMhjjeNRv
 fccwBKY40gL96fMEFCrheOhs7geOIGvy7bVVSiZb4TMh4d4+F5geRTxSuZJZ70PQlJbl
 jsiGe1Txe6jSe3uD8rQo5YbSLjz9pGZZWV6R8BiMnBJXhF7UUdTOm46R+31AxuvTjs8f
 4vG70Oj+1gjW8V8CgysBCTnZOVSLzF1KzDbUBCBO/FFxF/jhtqBUeM7IYE1nzUP+YPj1
 KYWxc2DLWI7L4c9F3cvB8q3/pRjebyP3rk0NZq4DzfnO71JrJupHUchu1cnsxLwnxa3y
 INBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6ARfb7CCtAyGQWozbpcu69TiW9MOgZYC7V52jr9EMdI=;
 b=qUA4WjJB2Wz15ZsKI7NOvP8WBi2Jbnh8l6qgOkPDfGD8eojQovrIwp+/VWRR9DDuv+
 QK9PAWpyG3BS9Yb3+KuEwxFAg20sedDhM4dCWX/s10HzDGlj36KTb0xLT75riF9mZGTx
 +xgcQ0jGRJy1ZS5PRPLS1T4o+ZIBGtG3w6lraf7eB+rpyknB+IB107GEtm1P9a/zv7cF
 /kS2IUXwemAeWqi9MtzF66BxzK9WpOEX/YGs43A9wvJaA3cOjEI3Y3qgKS85yMZ1moTy
 9tGohdEOJt/BidV15wc/iUtTQcBIZLykWk/4hLr0rjP7/XkJUKstN5L86yNQ3s8Dk7Yz
 WcqA==
X-Gm-Message-State: AOAM532qaVt9Vht1jz8XjQR2yQ988yyFCll6bz9hap0cm+KWupfqDAw8
 hoinTMkazp6cEl8hlu/DeUMo3/gcn7ujxg==
X-Google-Smtp-Source: ABdhPJzyGexTbAbgzpbd2h8qNCbpH2i7VtqXeR1WWd3CGgsd3u1tqGNz/XhtoLwDvWQSXW1MYy0t5w==
X-Received: by 2002:a17:90a:7d12:: with SMTP id
 g18mr2448814pjl.89.1603374053035; 
 Thu, 22 Oct 2020 06:40:53 -0700 (PDT)
Received: from adolin ([49.207.204.75])
 by smtp.gmail.com with ESMTPSA id j20sm2384100pgl.40.2020.10.22.06.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2020 06:40:52 -0700 (PDT)
Date: Thu, 22 Oct 2020 19:10:47 +0530
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] gpu: drm: amdgpu: Replace snprintf() with sysfs_emit()
Message-ID: <c9fbe2e2c31fae2fea867940a888c68becc993bd.1603371258.git.sylphrenadin@gmail.com>
References: <cover.1603371258.git.sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1603371258.git.sylphrenadin@gmail.com>
X-Mailman-Approved-At: Fri, 23 Oct 2020 07:22:29 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, melissa.srw@gmail.com,
 outreachy-kernel@googlegroups.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using snprintf() for show() methods holds the risk of buffer overrun
as snprintf() does not know the PAGE_SIZE maximum of the temporary
buffer used to output sysfs content.

Modify amdgpu_atombios.c to use sysfs_emit() instead which knows the
size of the temporary buffer.

Issue found with Coccinelle.

Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
index 469352e2d6ec..3c19862c94c7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
@@ -1947,7 +1947,7 @@ static ssize_t amdgpu_atombios_get_vbios_version(struct device *dev,
 	struct amdgpu_device *adev = drm_to_adev(ddev);
 	struct atom_context *ctx = adev->mode_info.atom_context;
 
-	return snprintf(buf, PAGE_SIZE, "%s\n", ctx->vbios_version);
+	return sysfs_emit(buf, PAGE_SIZE, "%s\n", ctx->vbios_version);
 }
 
 static DEVICE_ATTR(vbios_version, 0444, amdgpu_atombios_get_vbios_version,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
