Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2879196FE92
	for <lists+dri-devel@lfdr.de>; Sat,  7 Sep 2024 01:45:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F86610EAF6;
	Fri,  6 Sep 2024 23:45:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VCgun/vC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665C910E9D1
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 09:17:54 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-204d391f53bso17661245ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2024 02:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725614274; x=1726219074; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kdSscxu4iwCci+/8FixpdemFIaPGSwznJT41/j2DIjA=;
 b=VCgun/vC6QMgL4RgfGbD6SGi0dv1PT+rm/XdrdzmmLPcJ7rGjCMgszAhq3bO3Jo4rB
 6yzS/u4QJ62oJ9MMvqefNlqArvwGvdC1PdsNAyoraTf4oC0CbNW1X6p4DyqHJq4wmNbt
 417pGSdDxSwYqJbeu232lm76qhUfynlXvfZdeu8AVEyM/OJJXHvYopOn7QBxzRCcQxYy
 wAjJG/xAeqN7iWlwwYxXvr5EMTnZQsuFhEb+xm6eFHVmp5ACAcDuwWdzknYLQZ2C+KIE
 md2X5eOwINuWAnm8E01cRHL0TMKV5O+KSgnIOzqoSvI6GTGKJ10UQaYa/kOKokxzkAsm
 8CXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725614274; x=1726219074;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kdSscxu4iwCci+/8FixpdemFIaPGSwznJT41/j2DIjA=;
 b=bmyOMh4P7UgFxAcypyQLPDoQdQ0MmUvlDmAI1CsqAmNSJp8eqINN6BWqh/RSN6loco
 CBh16XclbItjHOznpAwEwPlq8Eg/lfKQpgooEn0NEjNUFwEZMJkju9CWpelT9gNq0nQk
 MD/SKj3yJEBdzvTUwxKRxJjwdsnJ2UJQYtf7fC2fv7rpDN5YWwLDHpbF5x7rslt1OY55
 UoxoCjQzT10FMpsQB/+M8+3KOSLLuTuNamPqxm9GFd5fwW9+sYzUZkGx/AtbC51kdE+4
 u+im9/hy8lqWonOJpaVPm/zG1O0RZrtHU91FPG+pm6zwq785EIbEBNlJHrfprOVCbqsj
 bkRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyHFBqxa9JXkV6cnmnhxYLS5Q28NUcPgqLNLW0aUwYRWYzLWxyn8q/l0zzZhb/7lSQx2nC2xh9suA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrrX9TyeAyOz8RZ7uXXSizYJAjbTnrUfHmEI+3lneu5ifnhO+T
 GTtAu/VSAmYYX8wAwPAQm5j9JPpjjC/nMCgExqXpsybwUMcqrJqomp1zGg==
X-Google-Smtp-Source: AGHT+IE3cJ9IjbyOplSMh7Z19jI3h9PoXhxcIAtQiEBq9hO7fnTUR7JHLZEdW53tyndSQR8iUyPnBw==
X-Received: by 2002:a17:902:cecd:b0:203:a0ea:63c5 with SMTP id
 d9443c01a7336-206f0367aa2mr16748195ad.0.1725614273729; 
 Fri, 06 Sep 2024 02:17:53 -0700 (PDT)
Received: from localhost.localdomain (111-240-109-89.dynamic-ip.hinet.net.
 [111.240.109.89]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-206ae90d174sm39692105ad.48.2024.09.06.02.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 02:17:53 -0700 (PDT)
From: Min-Hua Chen <minhuadotchen@gmail.com>
To: andyshrk@163.com
Cc: airlied@gmail.com, andy.yan@rock-chips.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, heiko@sntech.de, hjc@rock-chips.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, maarten.lankhorst@linux.intel.com,
 minhuadotchen@gmail.com, mripard@kernel.org, tzimmermann@suse.de
Subject: Re:[PATCH] drm/rockchip: include rockchip_drm_drv.h
Date: Fri,  6 Sep 2024 17:17:25 +0800
Message-ID: <20240906091728.109570-1-minhuadotchen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6f07603.7f9.191c4c887b1.Coremail.andyshrk@163.com>
References: <6f07603.7f9.191c4c887b1.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 06 Sep 2024 23:45:00 +0000
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

Hi,

>Hi  Min Hua，
>   Thanks for your work
>
>At 2024-09-06 06:38:50, "Min-Hua Chen" <minhuadotchen@gmail.com> wrote:
>>Include rockchip_drm_drv.h to fix the follow sparse warning:
>>
>>drivers/gpu/drm/rockchip/rockchip_vop2_reg.c:502:24: sparse:
>>warning: symbol 'vop2_platform_driver' was not declared.
>>Should it be static?
>>
>>No functional change intended.
>>
>>Signed-off-by: Min-Hua Chen <minhuadotchen@gmail.com>
>>---
>> drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 1 +
>> 1 file changed, 1 insertion(+)
>>
>>diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
>>index 18efb3fe1c00..c678d1b0fd7c 100644
>>--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
>>+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
>>@@ -14,6 +14,7 @@
>> #include <drm/drm_print.h>
>> 
>> #include "rockchip_drm_vop2.h"
>>+#include "rockchip_drm_drv.h"
>> 
>
>We already have a patch[0] include rockchip_drm_drv.h in rockchip_drm_vop2.h
>
>[0]https://patchwork.kernel.org/project/linux-rockchip/patch/20240904120238.3856782-3-andyshrk@163.com/ 

that's great, thanks for letting me know.

Min-Hua
