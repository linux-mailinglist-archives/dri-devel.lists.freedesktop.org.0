Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 752C47CDF32
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 16:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 679DD10E090;
	Wed, 18 Oct 2023 14:17:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7545010E090
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 14:17:48 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-32003aae100so5076598f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 07:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697638667; x=1698243467; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qJCjKDRaOx5XAC2x2yATrx2IuXM6NcvlHMKhJ0WmDlo=;
 b=jTgKnJdZ/YbBk6CPL2xsMU/ogkdW6yTqDkFkSI4r+a+VfSLQ2uZGbIBwsAnCGBSQEO
 +GhBlnbo9bN3SEpKNnCmXfOopj9b8barpMRhmvM2vbj1SjewbEm/6D9qmRBX5hZO9P0p
 HEFVfCT9dCS8VU1xBOMgIQp7wLXfma6afSsrUWwcElG95TqJyJ9u/ompoEiNWxwynYQg
 VG8szZdkTR1/idP0FD/9rgp40yX80Q0bFssxd3i+ec7ihCzl86lr8x9AunQ/IEMFoq26
 UkjwSKmTliQQNg7nYHcdcgbE5U0Eb06p7rHxXNQUEy2dsL93GJoMbMJr7uD8/RISFjDk
 WYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697638667; x=1698243467;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qJCjKDRaOx5XAC2x2yATrx2IuXM6NcvlHMKhJ0WmDlo=;
 b=glkcmodjZman6J0q65YbmqMi15qKe7xnZhLaxOEPduly47UO5uNC3Au4FTiQ9Uz3pu
 1ZNA2cWiyB/cG6sc02kbID/oQEEjFBPeLkKjoenlA1lyv7/wPeoPJ3OmjKMVXjxpMCnM
 V8AWsLtxFkvyF5ao9kikXE4oPGn72xforiCRblfDk2p2o9Bhb53lPR9kaGYSqHLWYKYt
 mq/+HuY6abjNSBEBGR74P5qtAvw78J14c8sKuJBbyY8zaD5U6kZZsTc7cypsXBSlthtX
 Uns3oRRXMOkWFX848g5IQXmsf8vLy1nDKUjMnUIB91tYvYlXZxTyGrUAErITKRY0dfrG
 NKNQ==
X-Gm-Message-State: AOJu0YzLv4Sj6T44xGJ2CPAkfnz14cnQL8f6xjctwSdQiLl6uXUgo5Sw
 a0maydjvKm5Ti1dgTmqxclP5iw==
X-Google-Smtp-Source: AGHT+IFr59Tvq3ufc4ENsmwMZ5b2E4kBpZFkx6eFWK7w++DMB7Q644jSxoa/TyJQoJ2Opsnm2iogoA==
X-Received: by 2002:adf:f092:0:b0:32d:980e:ae7 with SMTP id
 n18-20020adff092000000b0032d980e0ae7mr4768010wro.2.1697638666789; 
 Wed, 18 Oct 2023 07:17:46 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 a17-20020a5d5091000000b0032d893d8dc8sm2250422wrt.2.2023.10.18.07.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 07:17:46 -0700 (PDT)
Date: Wed, 18 Oct 2023 17:17:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: ville.syrjala@linux.intel.com
Subject: [bug report] drm: Warn about negative sizes when calculating scale
 factor
Message-ID: <c7f0fd2f-a48d-4120-9291-a0cc58faadce@moroto.mountain>
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
Cc: Daniel =?iso-8859-1?Q?D=EDaz?= <daniel.diaz@linaro.org>,
 kv-team <kv-team@linaro.org>, Naresh Kamboju <naresh.kamboju@linaro.org>,
 dri-devel@lists.freedesktop.org, Arthur Grillo <arthurgrillo@riseup.net>,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drivers/gpu/drm/drm_rect.c
   134  static int drm_calc_scale(int src, int dst)
   135  {
   136          int scale = 0;
   137  
   138          if (WARN_ON(src < 0 || dst < 0))
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^
These days, with automated fuzz testing, this WARN_ON() is problematic.
WARN() is considered a kernel bug, and pr_warn() is the hip new way to
alert the user about issues.

It should probably pr_warn_once() because this is easy to trigger.
There is a kunit test which triggers it:
drivers/gpu/drm/tests/drm_rect_test.c

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

   139                  return -EINVAL;
   140  
   141          if (dst == 0)
   142                  return 0;
   143  
   144          if (src > (dst << 16))
   145                  return DIV_ROUND_UP(src, dst);
   146          else
   147                  scale = src / dst;
   148  
   149          return scale;
   150  }

The stack trace is:

[ 1297.757480] WARNING: CPU: 0 PID: 1555 at drivers/gpu/drm/drm_rect.c:138 drm_rect_calc_hscale+0xcc/0xd8
[ 1297.758551] Modules linked in:
[ 1297.759247] CPU: 0 PID: 1555 Comm: kunit_try_catch Tainted: G    B            N 6.5.1-rc1 #1
[ 1297.760085] Hardware name: Generic DT based system
[ 1297.760619]  unwind_backtrace from show_stack+0x18/0x1c
[ 1297.761257]  show_stack from dump_stack_lvl+0x58/0x70
[ 1297.761936]  dump_stack_lvl from __warn+0xa8/0x180
[ 1297.762536]  __warn from warn_slowpath_fmt+0x110/0x1dc
[ 1297.762901]  warn_slowpath_fmt from drm_rect_calc_hscale+0xcc/0xd8
[ 1297.763241]  drm_rect_calc_hscale from drm_test_rect_calc_hscale+0xb0/0x150
[ 1297.763608]  drm_test_rect_calc_hscale from kunit_generic_run_threadfn_adapter+0x2c/0x48
[ 1297.764020]  kunit_generic_run_threadfn_adapter from kthread+0x184/0x1a8
[ 1297.764384]  kthread from ret_from_fork+0x14/0x2c
[ 1297.764812] Exception stack(0xfa41bfb0 to 0xfa41bff8)
[ 1297.765470] bfa0:                                     00000000 00000000 00000000 00000000
[ 1297.767825] bfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[ 1297.768452] bfe0: 00000000 00000000 00000000 00000000 00000013 00000000
[ 1297.769652] ---[ end trace 0000000000000000 ]---

regards,
dan carpenter
