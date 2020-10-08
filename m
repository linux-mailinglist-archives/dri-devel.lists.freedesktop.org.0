Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5297B287B7A
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 20:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EED186EAB9;
	Thu,  8 Oct 2020 18:16:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE1B56EAB9
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 18:16:20 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id n14so4655626pff.6
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Oct 2020 11:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6K8hpv/4YeHRKpMzZIBfYvB0+aU265UJegq54L3mwxI=;
 b=mfWPZjP4mjjmJHAiu5zCknppsCmXLU9X80dfdU6XBID9qFS2AeCK+K0L1FTgcWJhZB
 90dJ+aFP6NXwhMGLnF01TnzJ6bEKxtwF2Qq078XURLjYRbts5sbuvZ2YedsNyciuQYaH
 Tc8Ta5IeVBcdnBnrcte2B4cSMdCV/w96dAo2lNrGONBC5Ye/WJt6KmdFMtuIKbZb9Jdy
 inqsWRQ+5Roiy3XoeeJeTkBeXEiVZ7LDlx8qJnpF2V0B/rtWkEsYUcSpFL9LW6D/4uM9
 pzKV3nokr+F7E/Wu9SC0wKs7Mq1fWHJrHxeCSD+SNZDVYqPT+iWy72HLQPmrGgWEQ6ix
 yi+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6K8hpv/4YeHRKpMzZIBfYvB0+aU265UJegq54L3mwxI=;
 b=bNDitDlA5jaurni6/kF1Tr0K6c8kni70z9eCzCM3n7XsOYlhbfGrtqsJ2jIO6JAU7A
 bhhWhQnvd7IjGRaFU4mj4/+f46dP2e2v77+f87TUNmKm0EsTTX+4Up0LJPJEDVS0YVU7
 LH8dwVxaIEgWZfdOypeIQjRwocVSC3nGv3PgsZT2XIlaD+/+/BFIKrJR7cmVP5YCWvjD
 MVX7bwC+PIY+KmO4ItKq0mfWLA7fIcHnjCW13ALDyOWwYsyEFUG4EtzDDilAqCKepWWF
 HUoC7u5wVvH3VY/1odsKAFKP/Qsk4O+rq0V5XrmjkovrQu6OkAw++gkAHIe65ycXBAsM
 1NKg==
X-Gm-Message-State: AOAM531VtwMAKkjVwbgvHQvDvvBVkspfo/GsxCL9/RwEyBh6JQwflTvT
 t7Y9+zjkpPYeFundWtVGdEg=
X-Google-Smtp-Source: ABdhPJx/xxH5VJkzzcdErQeZ/QLSs+m3TWFA0ib6OPkWQ7b8LnM5LUpo8OZDU33Z6R4OrsSnsABMiw==
X-Received: by 2002:a17:90a:aa91:: with SMTP id
 l17mr121689pjq.198.1602180980241; 
 Thu, 08 Oct 2020 11:16:20 -0700 (PDT)
Received: from localhost.localdomain ([49.207.141.225])
 by smtp.gmail.com with ESMTPSA id u18sm8492491pgk.18.2020.10.08.11.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 11:16:19 -0700 (PDT)
From: sandy.8925@gmail.com
To: alexander.deucher@amd.com
Subject: [PATCH 1/3] drm/radeon: Add new callback that exposes vddc
Date: Thu,  8 Oct 2020 23:46:04 +0530
Message-Id: <20201008181606.460499-2-sandy.8925@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201008181606.460499-1-sandy.8925@gmail.com>
References: <20201008181606.460499-1-sandy.8925@gmail.com>
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
Cc: Sandeep Raghuraman <sandy.8925@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sandeep Raghuraman <sandy.8925@gmail.com>

Signed-off-by: Sandeep Raghuraman <sandy.8925@gmail.com>
---
 drivers/gpu/drm/radeon/radeon.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index cc4f58d16589..85a1cafdf303 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -1992,6 +1992,7 @@ struct radeon_asic {
 		int (*get_fan_speed_percent)(struct radeon_device *rdev, u32 *speed);
 		u32 (*get_current_sclk)(struct radeon_device *rdev);
 		u32 (*get_current_mclk)(struct radeon_device *rdev);
+		u16 (*get_current_vddc)(struct radeon_device *rdev);
 	} dpm;
 	/* pageflipping */
 	struct {
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
