Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA313296A42
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 09:23:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 692AB6E4BA;
	Fri, 23 Oct 2020 07:22:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F92B6F52F;
 Thu, 22 Oct 2020 13:48:02 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id az3so1056299pjb.4;
 Thu, 22 Oct 2020 06:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=U432S97cU+kXrslvGgog8CihEs2p/DakYW0kgHJLU04=;
 b=rYwjb2xkkh0hxJWaPtOnGa4hSe5DuH6RLUZsZBwxA6M+Z3ZP+laaYWty/n+xFUh7CT
 x62XiY4/BFnQkTugiegwK2EiFTnJxllQ/XJKCth8g5mxJ93KuTm6ClHqTZ8sBEI+L1hq
 C/X1pxD7EjWrJ4/3qk4xaMAAEFtZKDHCo7Sjpb7ezoHZNY5/k26tuFpTDDtl4JTmW4v0
 3+QVKvhFHvha8uUUEE7iCJl2d90+KRDbgRLvBeKbJ2RylZwbMd1l+gVJSnmaRTiDjFb1
 N/sk7fU/JL99mAX5kVZbQ+JYnhO6HLzCtiGv1N1tQoIOymoGU077WXHGYycWfasE6u12
 yQnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=U432S97cU+kXrslvGgog8CihEs2p/DakYW0kgHJLU04=;
 b=BlIfHzo6uOWeOY1X4jjZ128mxhRv3i7k0gAbvKCWDc6ASU0FkkhmXmA0iO1jp2eJbQ
 wDhG6Z3GnL+6iFjPW4IXB93jeSrle0y6jYYXFKEy9hFtl6zL/78+xkrxZyKEf1wQRauZ
 cSCfTdM9TM9D895utwzyfElYkzCAuHodTnD0m/NwR0/PRnOJSiSP0g8DcsP35lNdfy0b
 jJj+e3TrSWyw2ZHpN0fCFqtxORj6+ag4c7TzDcNlxLDhM4fRu6lKKVtOASjrl/fNTZA9
 mfuZW/99k8pewvPm0jc/b2ed1SpqArX4J0tGA2oqxh9WzUldGD2ptr6tsqdld7t9ISs4
 /u8w==
X-Gm-Message-State: AOAM532c06zHMBzVfWZPf+gbRgWOdQa68N/JzIPFFl24cwxUFCYSbwj7
 0bdvf0gDxL4gr0zrCS0duhSjkUNqSmJzCg==
X-Google-Smtp-Source: ABdhPJwM3YcRS24T5SIMczPQMewNzH1W31xII0vjX1FFvHeMteycQ8Cm7A31YkVKAcu0jmw+NBB7Tg==
X-Received: by 2002:a17:902:e983:b029:d5:f469:60c0 with SMTP id
 f3-20020a170902e983b02900d5f46960c0mr2536227plb.61.1603374481995; 
 Thu, 22 Oct 2020 06:48:01 -0700 (PDT)
Received: from adolin ([49.207.204.75])
 by smtp.gmail.com with ESMTPSA id g17sm2357979pfu.130.2020.10.22.06.47.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2020 06:48:01 -0700 (PDT)
Date: Thu, 22 Oct 2020 19:17:56 +0530
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] gpu: drm: amdgpu: Replace snprintf() with sysfs_emit()
Message-ID: <f6107f3e467f1906abdcc33d35f13cf54f7e5a96.1603371258.git.sylphrenadin@gmail.com>
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

Modify amdgpu_psp.c to use sysfs_emit() instead which knows the
size of the temporary buffer.

Issue found with Coccinelle.

Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index d6c38e24f130..4d1d1e1b005d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -2621,7 +2621,7 @@ static ssize_t psp_usbc_pd_fw_sysfs_read(struct device *dev,
 		return ret;
 	}
 
-	return snprintf(buf, PAGE_SIZE, "%x\n", fw_ver);
+	return sysfs_emit(buf, PAGE_SIZE, "%x\n", fw_ver);
 }
 
 static ssize_t psp_usbc_pd_fw_sysfs_write(struct device *dev,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
