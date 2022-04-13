Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3190C4FEE71
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 07:17:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 644DC112025;
	Wed, 13 Apr 2022 05:17:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88321112025
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 05:17:39 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id f3so1029863pfe.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 22:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qKdnsHbCO7pP3uEagIAEVEW5aLCkOugF8FrrZybf0t4=;
 b=Y4SbTLcFvJTIwS1+Ez/SWHb1/JMXuzjPG+yjUp+RBTwjzogohF+Rw/KDrRMf0Uhpl9
 nkLeG3868Zo+ZT48Yx6WlyiSvcNo1IZ33Ini3NzSn8Milk+pBrRFCT4b8R6xSR61ffmZ
 1fBUHIy5a6PuZEsqKh1lYBWNDxT7zvRZQQfb1J6nOo6q9OgLqIBjvHYBH9ujqSeITKSW
 m+8u6QsjTLoZAghpbnFxjRv1h4S3OVH3nVhatr/e8VX0goLycQM6GxoKcp8FYvsTr+xr
 OfM+t+grXOUfutjmlJJBDGAKG+65P1XWV5Vyc0KkjuDsO/Zy5DKPNBrQ4+Az8SeOu6ut
 exBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qKdnsHbCO7pP3uEagIAEVEW5aLCkOugF8FrrZybf0t4=;
 b=p3S3FBMNwJjeQQ5xsB1+cnkHyx8gSSqmK75JSBEBUDe3xD691UHB7Q4lpsugIG2Ce9
 /TetSbHfws/LwL9TxhgVyf9mD1kPrjAE5x1WT2t4bWHebiv2tMbdwG0xEf9xV0M08hPc
 Rk/Mwr2f+MZJtbgzTwLVMugSqt3I16aMW1QvVXQlXmy5NpfiQqqBUSrcNPnm04WF9xMj
 YFWTK+thk5Oj15mrsKh706P7Jo5uqHMhHw8upFwtGpiIZKi22oIuaHdqzI8uPPei2zON
 sAPRGBq1wIC+WLUlugeum7m3isbAQAIHE0x8VGCVo+hFjWVw0nwFCj8IASZu3GRKrBaW
 Fyhg==
X-Gm-Message-State: AOAM531rVrrtZluUVaAMGKsf3tUHzSdL0cEFWIBdK6Ht5+yrLN2xJLhV
 DJNlTaYIl5WeyJXSvvLvuZUQG2NAdNbPQQ==
X-Google-Smtp-Source: ABdhPJwlNCjgnq3rWTz0ZvV+7x7rjSzlzuZX/W+ct/kDNdSIY9PRxDWO4sBMxMwMB22OC2O3yEaMRA==
X-Received: by 2002:a05:6a00:181f:b0:505:a395:3ad5 with SMTP id
 y31-20020a056a00181f00b00505a3953ad5mr7957568pfa.43.1649827059037; 
 Tue, 12 Apr 2022 22:17:39 -0700 (PDT)
Received: from localhost.localdomain ([119.3.119.18])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a633741000000b0039958c06c53sm4396441pgn.61.2022.04.12.22.17.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 22:17:38 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: patrik.r.jakobsson@gmail.com
Subject: Re: [PATCH v2] drm/gma500: fix a potential repeat execution in
 psb_driver_load
Date: Wed, 13 Apr 2022 13:17:34 +0800
Message-Id: <20220413051734.5975-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAMeQTsaXM-ddGLukxuEJvm+0UtuJEZGL_5KEY8h9ZPH-ZxmBsQ@mail.gmail.com>
References: <CAMeQTsaXM-ddGLukxuEJvm+0UtuJEZGL_5KEY8h9ZPH-ZxmBsQ@mail.gmail.com>
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
Cc: airlied@linux.ie, xiam0nd.tong@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 12 Apr 2022 16:58:24 +0200, Patrik Jakobsson wrote:
> Hi,
> This would work but using gotos like this easily turns the code into
> spaghetti. See "7. Centralized exiting of functions" in
> Documentation/process/coding-style.rst for when to use gotos.
> 
> In this particular case I think we are better off using an
> if-statement. What about something like this:
> 
> if (gma_encoder->type == INTEL_OUTPUT_LVDS ||
>     gma_encoder->type == INTEL_OUTPUT_MIPI) {
>         ret = gma_backlight_init();
>         break;
> }

Yes, it looks better.
I have sent a PATCH v3 with changes as you suggested, please check it.
Thank you very much.

--
Xiaomeng Tong
