Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1F0615632
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 00:40:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA7110E032;
	Tue,  1 Nov 2022 23:40:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12DAA10E04C
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Nov 2022 23:40:08 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id p21so11141879plr.7
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Nov 2022 16:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=HMjoSMseYo9dv+OYtpDQcotuckgj0OnEhXYZObymQfA=;
 b=N4bCntNKJyNrCrWRnxFbKWGV538e38A/akJR4zZz/OuvuV1Bx92CKGBWkW4XIkb+mg
 at2PxLtvS+9V8fzxowpA0pMEHI/pFRmIUoF3dIlw96H4BwhgK79jOTHaNSb4ib3bQqJE
 AjvoxglA+JnoO3xYI+DkujScXt/j12hqgfLIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HMjoSMseYo9dv+OYtpDQcotuckgj0OnEhXYZObymQfA=;
 b=odFzPExOsr1q1w5ZWRZ87MrCsRgVlMUyEwDcC2COmqtmDplRkpMdUTqlTSlemp+MLo
 t66vT//yDVSGDGCR4MP2V6EP7aTLlcRCbVP686rl08RwEG3dI1lRXi9jtO/8EtzfqlgT
 SBeq9cljGQ3vwdG+nkOMXgljoGdMVlFGPZdnJpb6b2hIXvBnluzSF4IgP9FzsodEMCUz
 3c9fBvVewqThY8pub8OU4tjAKPzPpD7ncUJG8pxiO0A6GAATyaUbMsFrcuxq014PaqQ/
 fu38omPj1IQUuVLb2KKJT49zWGQuVC76p7CRsL9sUSR/P6wxts2TpEGm7kulkFeZeJ2o
 en9Q==
X-Gm-Message-State: ACrzQf2jF9zt9k0A2EYtgXsLcIH3fd7wEn0YUqNF7AdXgr8eF5ZyZOsG
 iRD/rx+8a1fomPn25xKgQYSdRg==
X-Google-Smtp-Source: AMsMyM4P4eIG6ZNPzEizuQdoi/YqYr8KPBMw3NArEJ1RJ/GARU4RtwCb2NPtiryMlgBp+ThPDf6xZw==
X-Received: by 2002:a17:90b:33c3:b0:213:f5be:c3ad with SMTP id
 lk3-20020a17090b33c300b00213f5bec3admr9845989pjb.123.1667346007336; 
 Tue, 01 Nov 2022 16:40:07 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 20-20020a621714000000b0056ded8d5918sm636830pfx.134.2022.11.01.16.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 16:40:06 -0700 (PDT)
Date: Tue, 1 Nov 2022 16:40:05 -0700
From: Kees Cook <keescook@chromium.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: Re: [PATCH] drm/radeon: Replace kmap() with kmap_local_page()
Message-ID: <202211011639.4938CC9@keescook>
References: <20221013210714.16320-1-fmdefrancesco@gmail.com>
 <fb0b7389-7121-04f8-176d-1ababe0ad8f2@amd.com>
 <CADnq5_PP3VCXQ5rbC0-8Qsi5W7Ew87U_bRknz4=qxbrPxVQ+qA@mail.gmail.com>
 <1942083.usQuhbGJ8B@suse>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1942083.usQuhbGJ8B@suse>
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
Cc: linux-hwmon@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Ira Weiny <ira.weiny@intel.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Alex Deucher <alexander.deucher@amd.com>,
 "Venkataramanan, Anirudh" <anirudh.venkataramanan@intel.com>,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bpf@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 02, 2022 at 12:11:53AM +0100, Fabio M. De Francesco wrote:
> On lunedì 17 ottobre 2022 18:52:10 CET Alex Deucher wrote:
> > Applied.  Thanks!
> 
> Many thanks to you!
> 
> However, about a week ago, I received a report saying that this patch is "Not 
> Applicable". 
> 
> That email was also referring to another patch, for which I'll reply in its 
> own thread.
> 
> That report has a link to https://patchwork.linuxtv.org/project/linux-media/
> patch/20221013210714.16320-1-fmdefrancesco@gmail.com/
> 
> Can you please let me understand why, despite it was applied, this patch later 
> shifted "State" to "Not Applicable"?

The kernel has multiple patchwork instances, so you got an "N/A" from
linux-media, but it was applied to the drm tree. (Yes, confusing. :P)

-- 
Kees Cook
