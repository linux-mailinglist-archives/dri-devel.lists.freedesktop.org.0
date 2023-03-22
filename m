Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABC26C4598
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 10:06:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C8A110E8BB;
	Wed, 22 Mar 2023 09:06:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A991910E8BE
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 09:06:08 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id o7so16206472wrg.5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 02:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679475967;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=A0GYGyULbZtt0uXWIyJxQVdXrGI13Wnywzs9yqzApb4=;
 b=jwr60i4WXCJ9WJgubZZY6izQ5hcZMevW3NjL+0ZE2qdv/4MiHWpkrQyvm4YY/66X9H
 fX51e/cvaaxuRiQFRzztoz6RQgMWe+KPGLr0uoX7xyiAY3hmRprX8D/+ciZScoC/en9M
 Rt2p4R2sM3xB3+7ROZOManuQ59hKD4vS+EXhbeQEvQImyOcUfGowu+QIueHs+RiXfmzL
 g1CADlY8aLTmBvQCcZ8lOPzSghIs3vY5Ivz5TFISK+fgYxF/4PV5hWTSno7Vjz098U9c
 fAiJJi4YlOaXfxTR0XK0u+498qjEeRWgPb+1w/lWBZGOc0azB4kZiwpp29o+1EPJfKlK
 1N6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679475967;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A0GYGyULbZtt0uXWIyJxQVdXrGI13Wnywzs9yqzApb4=;
 b=7ZOd0wgBRcKO1FEmhA5tsgOmdjzC44DdDyFAclhcAaR755YkZc2rveshUUIVoQlOjV
 9FlelXxp+o2eTbm8d+ppejt6aP5y0uLCln/Dc9Zw33AN3jpjccHO27YnN/fWKZrEfa+C
 uH/xH2V60GjkM3ZhbFRZhWgy1VpPuvLfEn9Xbctvn3bT/beL9l4xol2lLzilF67FP2lF
 WJ9Kmo16HGXtEMUm2+F8B4d8SuoU9KH1kgxEbgFNy6vGcAwcwPpu3pN1X3wNqYpcZMux
 V8pNRz1pFAxsRJTRzNwN2lL2g8g7TzwIO2fD4mD1t7JWycfhG75mbsRDKZfn3590G0af
 VvYg==
X-Gm-Message-State: AO0yUKWseNNZnjFfuHyYsvybBZGeFJeKTUDfv8gHdZSos1Ec3qsJg42J
 dSZn84DebISPU1gcFo7D02bnPNNS4GFAXQ==
X-Google-Smtp-Source: AK7set9fJW8Ci40436NTRHv3vuhQRtOfO2x57LpoiTsiofhtC62M3LG/NG78xQTA842SFvh3v7Sd4w==
X-Received: by 2002:a5d:69cb:0:b0:2d5:f94a:97f4 with SMTP id
 s11-20020a5d69cb000000b002d5f94a97f4mr4341534wrw.71.1679475967087; 
 Wed, 22 Mar 2023 02:06:07 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 k16-20020a5d6d50000000b002cff0e213ddsm13282474wri.14.2023.03.22.02.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 02:06:06 -0700 (PDT)
Date: Wed, 22 Mar 2023 12:06:03 +0300
From: Dan Carpenter <error27@gmail.com>
To: zackr@vmware.com
Subject: [bug report] drm/vmwgfx: Do not drop the reference to the handle too
 soon
Message-ID: <51a9e126-57f3-4d6a-915f-93cd00b65244@kili.mountain>
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
Cc: VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Zack Rusin,

The patch 9ef8d83e8e25: "drm/vmwgfx: Do not drop the reference to the
handle too soon" from Feb 11, 2023, leads to the following Smatch
static checker warning:

	drivers/gpu/drm/vmwgfx/vmwgfx_bo.c:698 vmw_dumb_create()
	error: uninitialized symbol 'vbo'.

drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
    669 int vmw_dumb_create(struct drm_file *file_priv,
    670                     struct drm_device *dev,
    671                     struct drm_mode_create_dumb *args)
    672 {
    673         struct vmw_private *dev_priv = vmw_priv(dev);
    674         struct vmw_bo *vbo;
    675         int cpp = DIV_ROUND_UP(args->bpp, 8);
    676         int ret;
    677 
    678         switch (cpp) {
    679         case 1: /* DRM_FORMAT_C8 */
    680         case 2: /* DRM_FORMAT_RGB565 */
    681         case 4: /* DRM_FORMAT_XRGB8888 */
    682                 break;
    683         default:
    684                 /*
    685                  * Dumb buffers don't allow anything else.
    686                  * This is tested via IGT's dumb_buffers
    687                  */
    688                 return -EINVAL;
    689         }
    690 
    691         args->pitch = args->width * cpp;
    692         args->size = ALIGN(args->pitch * args->height, PAGE_SIZE);
    693 
    694         ret = vmw_gem_object_create_with_handle(dev_priv, file_priv,
    695                                                 args->size, &args->handle,
    696                                                 &vbo);
    697         /* drop reference from allocate - handle holds it now */
--> 698         drm_gem_object_put(&vbo->tbo.base);

This is a false positive, but the code is buggy.  The bug is that if
"ret" is failure then "vbo" is NULL leading to an Oops.

    699         return ret;
    700 }

regards,
dan carpenter
