Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D387B82BCF9
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 10:23:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 481B510EAC0;
	Fri, 12 Jan 2024 09:23:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 672FC10EAC0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 09:23:25 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-336755f1688so5198560f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 01:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705051404; x=1705656204; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v8jL/aiFbGEHSZZH+WK++78/U6to2EwE5D796/LxQfY=;
 b=NADv6xw0MpFZNj9/bor+RntFBrSa0rIkoGSHsVt4KRsas39TTMyRnlHEp0djnbsovr
 uXCv8oWXG4hvoTfpMRnjpUPg+WHE20ABKIqwFaifcHHBDPPTzDyYhzvu+kI7H4YDL34i
 1nHR0p8vPLrkPVYXZlPRQl7xPPQYbOgwed0RbJPixokaCO83Om6AAQ+VhGBNv8eOMUYI
 DsT2Db4kHqqMaiOMuziQOCRzHOtrFZeS3Ur0iI0Cg2FauYjhpdHhqI20K0+Z5fyVYkQx
 XixKKvqzBYXf/WJUvef4MUfOnkoa4Ql+RN5902iYa/H1oN5yNkakW/c0V1XvYBTlmPEk
 M09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705051404; x=1705656204;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v8jL/aiFbGEHSZZH+WK++78/U6to2EwE5D796/LxQfY=;
 b=vAHjJuiM8LQai3dbatZr53Fx4pncdQgOgU/Bv0ClETT0OKP+dPsmg50kHx56ztNOvC
 529hhkOjmE5BF/ghogoy5Y7GVUqUFrcuaMyve0dFOM+I6uTc7sayBHIPcVdcmVNH4vWk
 v+5cGTnG564AmRuUJCEqPKcC6p8NEW88DnTo5ei81xQHYdN6aWDq1Wz/Lux0JdzNrEtp
 8EjEYsYcMbJPdgOS799eAMRD51K5uIEftqcpE22NYXyBHbkVSUPv7mIVX/G5Jqz7QTHS
 z3NHElfBXInsq0EHbCqo/Lv3bU7t6qeapo1PfKaD1997XiUt/o5UixA31q2dz3HSD7u0
 +rtQ==
X-Gm-Message-State: AOJu0Yy+7Ayf+rq2Qvvot86bp5uFJE2bmAj7M4dXKbNpqVbKcrfKhcat
 2Cv+SMVJkONWlRYpxDxWP5wYBrUCv8XC4w==
X-Google-Smtp-Source: AGHT+IE/aIWcI4l4cjJEWOt0tU/U4G4pfqA9rjW2YBFW99nRgMVOTGZRZNa5AnYi2yzt3KlkTND3DQ==
X-Received: by 2002:adf:d1cd:0:b0:336:8c6a:7779 with SMTP id
 b13-20020adfd1cd000000b003368c6a7779mr547702wrd.135.1705051403857; 
 Fri, 12 Jan 2024 01:23:23 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 x6-20020adfcc06000000b00336f43fa654sm3325492wrh.22.2024.01.12.01.23.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 01:23:23 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
In-Reply-To: <20240110082245.417736-1-alexander.stein@ew.tq-group.com>
References: <20240110082245.417736-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v2 1/1] drm: panel: simple: convert LG LB070WV8 fixed
 mode into display timings
Message-Id: <170505140278.907432.11855530308789171532.b4-ty@linaro.org>
Date: Fri, 12 Jan 2024 10:23:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 10 Jan 2024 09:22:45 +0100, Alexander Stein wrote:
> At least the pixelclock has a range which can vary. Convert fixed mode
> into display timings so they can be overwritten in DT if necessary.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm: panel: simple: convert LG LB070WV8 fixed mode into display timings
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=c3ba13a0ed3d81d28aaf475687a5f39766566768

-- 
Neil

