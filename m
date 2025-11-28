Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF96C91BC9
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 11:57:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E4C10E8B6;
	Fri, 28 Nov 2025 10:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qiGYtMYi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 028A810E8B6
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 10:57:37 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-477a2ab455fso17470325e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 02:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764327456; x=1764932256; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mWuVaY44MeGiX1ZZNO+mHfKauuOMqCHPDVFiN5K8IXc=;
 b=qiGYtMYiuei9e+Rv9CPNnaXRFbvlhK5Ca6hAKHDxpJmX0nJGZsPqb9vjApRyZVTNwS
 kpbX+hB13LGKLrs/2Ig6igg6HWH7TPXDuPvEk+iTIhdEvzFaMJlboTiWHO5cEF7qCph2
 42mMP2iVovwGtAFgoEsdB7ojDUKE3weIDjj8zlH6y1uuwawq312zPUJ91QeVN1Z5bX7x
 pcUY+4DVAWIIiSmitHlXbZLERz+Ed2vqUo3W62tlRHYYgFRR7onsHB6iw/m3v2ekLUtV
 3zT9Nm+7QIEgWMz+azi8WxDTf9Pto9RU136gvMjwEFnsF26N0cg9Uk9MkaBvFJR1HJGR
 20iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764327456; x=1764932256;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mWuVaY44MeGiX1ZZNO+mHfKauuOMqCHPDVFiN5K8IXc=;
 b=QGHqplgduPmDgTE2LaA4+CXzioCQ7q5RPaPgoXTsILzTqK9P8W5JESeDL5x7yYd7YS
 ci3NEu5Nv/ByGc++WJzNNexjGzD7akkexP3YqAwHaQ0tg+quW8yUdILD8lnpPAmjnBf3
 GEUNEhJrEyrwqyVCXTLE6Mc2vrMQ0o5AJ4iEArxW/XjkHfZeQeEgW5bqP5/N/jtMulEb
 xHOLCLbUD3PSevqZeDHeXW/epbWZ64b341CeNwf+MgQvBtos5XBK+IcTpKsQXaGFxEm0
 PiJxhoTDK/+wXjvOdoLCXnyO74LXvNRHQT98MowMCY10fkYoEx2cKaROfMllu0h0F7xM
 7sSw==
X-Gm-Message-State: AOJu0YwA//SmX5djIraWQLCWsmXjnfelN/54qKL6MvT9j2RuNZcFENUc
 L2F/M+/LZdCEMcFndNtKkgPOoI+K4mkGOJkZj9709X/StO8MPpZStXNOqdyZRWaiFQA=
X-Gm-Gg: ASbGncvYp6eR6rtcjEaN0bKrqr7SjPkoSmJwJBnYQ8e/xqd7N/pceD62TrewvnK97Xg
 tTiz8uEVXpwUsyVCeZfQNlKYIZnML4IMTxdb0QMhZyChYLDTYWuWCVh1c5uO8rsZbTCInhW2vqr
 LiSYUeYZ6+lD3yHoX2buV9umRdTfkVyzrKzvxisysRcIA4ZonzgTfoCpookeRWj+eULJjqpZFQq
 7fxGsbQhdIKwjUCpSuX4DYouIYzVkmA5vuR7g2zQ0DVAe/5JTexsQdAva6XqfGlKEmk0ciql2lQ
 zpMjNEhA9V8H3dSsilUKBppwCIAAsSytt2l81A8dv6rtvklxIm6PUkLQoyxzT1SPzJpy/itlcVC
 ugKPx3y5mSa21is+X5+j3xx2Vtoqso88s3D6eDTL56bsyzCjfJCQzORLhxGeRCycSvaO5bw8ajR
 TaFGLgSHw9wvHVdRa6
X-Google-Smtp-Source: AGHT+IE6dyu3ATF/OL/19UXiZfKx7DG7KPPl1q+iryh9nJZRpZZCQLOtTQj4WdOnSXzmu9pWU2Fcfw==
X-Received: by 2002:a05:600c:19cd:b0:477:63b5:6f39 with SMTP id
 5b1f17b1804b1-477c1116192mr270332725e9.19.1764327456356; 
 Fri, 28 Nov 2025 02:57:36 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4790addeeaasm143014265e9.7.2025.11.28.02.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Nov 2025 02:57:35 -0800 (PST)
Date: Fri, 28 Nov 2025 13:57:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
Subject: [bug report] drm: omapdrm: fb: Simplify mode command checks when
 creating framebuffer
Message-ID: <aSmAHKJ2OvYj0HXk@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

The ancient commits from times of yore lead to the following static
checker warning:

	drivers/gpu/drm/omapdrm/omap_fb.c:429 omap_framebuffer_init()
	warn: untrusted unsigned subtract. 'omap_gem_mmap_size(bos[i]) - mode_cmd->offsets[i]' '0-u64max minus 0-u32max(user_rl)'

drivers/gpu/drm/omapdrm/omap_fb.c
    368 struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
    369                 const struct drm_format_info *info,
    370                 const struct drm_mode_fb_cmd2 *mode_cmd, struct drm_gem_object **bos)
    371 {
    372         struct omap_framebuffer *omap_fb = NULL;
    373         struct drm_framebuffer *fb = NULL;
    374         unsigned int pitch = mode_cmd->pitches[0];
    375         int ret, i;
    376 
    377         DBG("create framebuffer: dev=%p, mode_cmd=%p (%dx%d@%4.4s)",
    378                         dev, mode_cmd, mode_cmd->width, mode_cmd->height,
    379                         (char *)&mode_cmd->pixel_format);
    380 
    381         for (i = 0; i < ARRAY_SIZE(formats); i++) {
    382                 if (formats[i] == mode_cmd->pixel_format)
    383                         break;
    384         }
    385 
    386         if (i == ARRAY_SIZE(formats)) {
    387                 dev_dbg(dev->dev, "unsupported pixel format: %4.4s\n",
    388                         (char *)&mode_cmd->pixel_format);
    389                 ret = -EINVAL;
    390                 goto fail;
    391         }
    392 
    393         omap_fb = kzalloc(sizeof(*omap_fb), GFP_KERNEL);
    394         if (!omap_fb) {
    395                 ret = -ENOMEM;
    396                 goto fail;
    397         }
    398 
    399         fb = &omap_fb->base;
    400         omap_fb->format = info;
    401         mutex_init(&omap_fb->lock);
    402 
    403         /*
    404          * The code below assumes that no format use more than two planes, and
    405          * that the two planes of multiplane formats need the same number of
    406          * bytes per pixel.
    407          */
    408         if (info->num_planes == 2 && pitch != mode_cmd->pitches[1]) {
    409                 dev_dbg(dev->dev, "pitches differ between planes 0 and 1\n");
    410                 ret = -EINVAL;
    411                 goto fail;
    412         }
    413 
    414         if (pitch % info->cpp[0]) {
    415                 dev_dbg(dev->dev,
    416                         "buffer pitch (%u bytes) is not a multiple of pixel size (%u bytes)\n",
    417                         pitch, info->cpp[0]);
    418                 ret = -EINVAL;
    419                 goto fail;
    420         }
    421 
    422         for (i = 0; i < info->num_planes; i++) {
    423                 struct plane *plane = &omap_fb->planes[i];
    424                 unsigned int vsub = i == 0 ? 1 : info->vsub;
    425                 unsigned int size;
    426 
    427                 size = pitch * mode_cmd->height / vsub;
    428 
--> 429                 if (size > omap_gem_mmap_size(bos[i]) - mode_cmd->offsets[i]) {

The mode_cmd->offsets[i] value comes from the user via the drm_ioctl()
and it hasn't been checked at all so far as I can see.  If it's larger
than omap_gem_mmap_size(bos[i]) then the result is unsigned so it's a
huge unsigned value which means that "size" can be anything.

It would be simple enough to add a check:

	if (mode_cmd->offsets[i] > omap_gem_mmap_size(bos[i]))
		return -EINVAL;

But I don't know the code very well so maybe there is a better place
to check for this?

    430                         dev_dbg(dev->dev,
    431                                 "provided buffer object is too small! %zu < %d\n",
    432                                 bos[i]->size - mode_cmd->offsets[i], size);
    433                         ret = -EINVAL;
    434                         goto fail;
    435                 }
    436 
    437                 fb->obj[i]    = bos[i];
    438                 plane->dma_addr  = 0;
    439         }
    440 
    441         drm_helper_mode_fill_fb_struct(dev, fb, info, mode_cmd);
    442 
    443         ret = drm_framebuffer_init(dev, fb, &omap_framebuffer_funcs);
    444         if (ret) {
    445                 dev_err(dev->dev, "framebuffer init failed: %d\n", ret);
    446                 goto fail;
    447         }
    448 
    449         DBG("create: FB ID: %d (%p)", fb->base.id, fb);
    450 
    451         return fb;
    452 
    453 fail:
    454         kfree(omap_fb);
    455 
    456         return ERR_PTR(ret);
    457 }

regards,
dan carpenter
