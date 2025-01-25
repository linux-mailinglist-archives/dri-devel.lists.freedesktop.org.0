Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B027A1C199
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5B3F10EA82;
	Sat, 25 Jan 2025 06:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dOV07QWL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B1610EA89;
 Sat, 25 Jan 2025 06:47:32 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id
 ca18e2360f4ac-844e1020253so73050539f.3; 
 Fri, 24 Jan 2025 22:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787652; x=1738392452; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9nFXwDpq2Q3SkKmn7wq2mLhcg7oyd+q4sRfSktkILp0=;
 b=dOV07QWLbeRpfHNZnHF5wz2VkaYOAkThDF/4ynGeaSc1cO/Eq4fDUX46l+DWAGZEy3
 1mfAS0irxN4OcGfEqnqIA1HQOBu+1gFBzptsaZjBziiPZTtFsu1peKYGJ4b/9WPsw0Cs
 GQwHTwwwS6JlSeyuN3pHUjiiHlv3COs2+cdkvcPVer/1QLSIWwkbXAJn8hnFpgvgVaEx
 zQgfWIf8pTXXROCQm0tJE0zILqH5RT9iK80IeYDdINts+exTbwhr/uSgdyilseEbQBjk
 E1s82onJyytwvaL1lfbzA1a7jGLJt8RbKLLLj4QoDGe2CJQN0UabiJcZSH0cKXDIQuK+
 yxew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787652; x=1738392452;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9nFXwDpq2Q3SkKmn7wq2mLhcg7oyd+q4sRfSktkILp0=;
 b=T1g0AylYKlriQNIp7uNSWGrAAqY70UGVYtJSQsekSMzV6OX/Fy6vEoaTBdd92vasQy
 VgkDs4ZqsnIgX3OSaLweO3qFSCsDH+xxnBo1bJIC6+jz1w//Wsg0eUhvpPRDYqkAlq4s
 +nyGg5ivMU7t7iWHDXErBL2nMBerkSIDBgOzYoDVV+WhqDUEFIWx0YBTHJgrq+IS1Yt7
 pZimNMnZCTAIW+MCGWa3zaPFXKNA9a8+IU+wI3sxvTCj6Yp+3UszOEFkZTIy+E7jBA/l
 iuWJTv8KcxQHrakvGk2gg8Ul6M/MBICjAkUq7thMl08g3Zk6qy0mljkBoVrQtaEnRkpW
 GbYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgsmmkRY2bs2/fT3ZblDDLifgkIlPs7cJCmsnxzwRI1zzva3Pe2TvN5LmWSxZK5lqz3lKeSk83@lists.freedesktop.org,
 AJvYcCUz+2xuvUEqVYztZwLg0NM7rpQKJw3rcZ8N0uRCuS0qtXO09Tj5ob/hzYUfmpZmGn4mWfQ7pqFOJFrBGxeN6A==@lists.freedesktop.org,
 AJvYcCXk08eIGkmXGlPV4UCYBvqcIT0sWUvBqgodkJFXJSLXDBq03ujDZdZn6N8Tks7sBpdXsgYvviWd4aFp@lists.freedesktop.org,
 AJvYcCXsaiHDzfAwZlYuRs3Dizn/gH+6mrIopUws0T9xA81ADFtm+8fGTmta7mBAOExMkbznE6gZ9CZl0lLS@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKxyOF8biJpHRc6orLygeob6gxR0nNpFypzWpdrZ7QTVtUxorw
 E2ypXtd64BasOqfDcmalPhfES9aZmsSCw+JBMjnvExYsFAbRVC0fi/cJIw==
X-Gm-Gg: ASbGnctuiRfZb1UW0EEdkKZjoIIcx8DA3qYdmy6csSzWqpXokE/lvM1KFECt246CXjR
 c1VJu+xBPmO7mYNb/dZ3juA+JNhcpRveSzgdgrEeqO9lVJHp4/E8HqoFjZwbFJ9GS00FCQYvudp
 pHeBSglc0uRTCdf5lA56m1g6u/knO/GT+SRofoPwcRINZxsydr+m2eDCJouI2gdVFzKN5jqQhpB
 csNY+IOcD5yrlBqi/lTcnN+Nv3VCjkab/mYX6VhdUyKmb1C1vcTsXNmND0O6ARCP2GEuX7Cz7bQ
 NoG6/Tx5pN7COYDv2YqgZ9iNt7HVZUo5ydRAdw==
X-Google-Smtp-Source: AGHT+IGdia7MRs+Xca+0tVgRbyhuswJTIMLLqTubbBnEVp0qZ3vKl3vZA4F4GsGhK46lRDAVflURPg==
X-Received: by 2002:a05:6602:600a:b0:849:8540:446 with SMTP id
 ca18e2360f4ac-8521a727564mr600091039f.13.1737787651864; 
 Fri, 24 Jan 2025 22:47:31 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:47:31 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 51/63] drm-dyndbg: add DRM_CLASSMAP_USE to simpledrm
Date: Fri, 24 Jan 2025 23:46:05 -0700
Message-ID: <20250125064619.8305-52-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125064619.8305-1-jim.cromie@gmail.com>
References: <20250125064619.8305-1-jim.cromie@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tiny/simpledrm has 3 DRM_UT_DRIVER debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/tiny/simpledrm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 4d4f05dee244..7d9e7420d85f 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -35,6 +35,8 @@
 #define DRIVER_MAJOR	1
 #define DRIVER_MINOR	0
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /*
  * Helpers for simplefb
  */
-- 
2.48.1

