Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3E97DACED
	for <lists+dri-devel@lfdr.de>; Sun, 29 Oct 2023 16:07:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8245D10E176;
	Sun, 29 Oct 2023 15:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC7A10E175;
 Sun, 29 Oct 2023 15:07:50 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1cc3542e328so2625555ad.1; 
 Sun, 29 Oct 2023 08:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698592069; x=1699196869; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rq2lTx4r6AxRWMwoBx4OQjZx3mpwnDbM/buzeUwRHtY=;
 b=Xj7pqT0w1U8TSk1ixlSYrWFF7MKW6Ogu7tXRgvPbVGVEh6cbokiZ+zEjmovEbPgBI3
 5xXk/AThd/SPI7g7pO3jJlm0Q8JQ4q13shD5Y83/JdbKu9idm/4csMseo37RxjNrelLr
 pJZByhk5ZmkFRTMIhVZdPB89cIKGAdyMzyVipOGo7CD4RkiE9X6qGLjt3H9+qy7TE54j
 A8wvh5b+6pMLhWeDoYO6JU+ps+GPQaJbjwn1pJoRISgp0iWGMyOTsZXw3FFUkLnN0YhC
 VJy5eX9ZGh+7VTm/9V4l7HedpLzcYNsjhJYN0JVviR2mnuAHRp1EXMpjCVapsfFfRjVg
 JyiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698592069; x=1699196869;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rq2lTx4r6AxRWMwoBx4OQjZx3mpwnDbM/buzeUwRHtY=;
 b=jd3FQZT1RJ+umFOjRhakmh4178GC+OEY8LJucLB5XkKUiDv2/1NOjNRAVculb8SX8N
 bzVJRFRdYd0Q7Gn312Pq6t0NO19I3tte39II5vbwbUP0CoZQTigWcmLgBnQIgUTTpCQl
 qh9mnU1iSjVJlHavueYWiRjDsnwowsbpK+iOi96HgIkBDYA74whoutADHiZvIyYcUc+O
 w0v+F5Z/rUra1qO1wLlg6bVfdlkQJ1WkXC3tv+97A+7yoZvVTdJeErDKErqm1Wd2MVD2
 KFuuC4lqCr6V9BXGwkqmn5/lV8r570eMRbOsjKiHTLp860tZrxujdSEyfGU5erDn8Ub6
 9TFQ==
X-Gm-Message-State: AOJu0Ywiw2yj9c/KvoRRNDo3YV+Dpcm5UrC2UeOkjSNha+2exdE0/MFZ
 y0WqUCQHRAeYEP1t9de7ND5IybinyM0=
X-Google-Smtp-Source: AGHT+IHqEqQMKupQeBAJEYNFdKsCoTID1AbZp8zrduE+qBv97MGFQtDmaZUFOCmKTxG5w1vSOlteIg==
X-Received: by 2002:a17:902:c641:b0:1cc:2bd9:1b2d with SMTP id
 s1-20020a170902c64100b001cc2bd91b2dmr3052186pls.43.1698592069312; 
 Sun, 29 Oct 2023 08:07:49 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a170902dad000b001c5eb37e92csm4640408plx.305.2023.10.29.08.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Oct 2023 08:07:48 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/2] drm/msm/gem: Add metadata uapi
Date: Sun, 29 Oct 2023 08:07:36 -0700
Message-ID: <20231029150740.6434-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231027194537.408922-1-robdclark@gmail.com>
References: <20231027194537.408922-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Stone <daniels@collabora.com>,
 "open list:HIBERNATION aka Software Suspend,
 aka swsusp" <linux-pm@vger.kernel.org>, linux-arm-msm@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Add metadata mechanism to provide a back-channel to communicate image
layout information between vk and gl, because EXT_external_objects
doesn't support explicit modifiers and "OPTIMAL_TILING_EXT" is not
enough information for the importer to deduce the layout.

Rob Clark (2):
  drm/msm: Small uabi fixes
  drm/msm/gem: Add metadata

 drivers/gpu/drm/msm/msm_drv.c | 59 +++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/msm_gem.c |  1 +
 drivers/gpu/drm/msm/msm_gem.h |  4 +++
 include/uapi/drm/msm_drm.h    |  2 ++
 4 files changed, 64 insertions(+), 2 deletions(-)

-- 
2.41.0

