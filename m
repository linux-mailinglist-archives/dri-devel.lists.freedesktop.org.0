Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A19BA24E68B
	for <lists+dri-devel@lfdr.de>; Sat, 22 Aug 2020 11:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B166E454;
	Sat, 22 Aug 2020 09:02:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CDCC6E12E
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Aug 2020 01:20:21 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id o5so1804650pgb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 18:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=+grt2lq7z6Xfwjj3obNToZK2iikIyYEevhepcH8Y3zA=;
 b=K5ahScP0ndnTcA/McyN9stxj4UZT171xHGRjMWbB5W8cDeTg/1iLTqmTGsaqDu0fiK
 rfF4DBi8OBRUiMAZBtP8Qx8amcB9RrJEwsC86I3XR89LNYY/IO64eHSPHRS+LFrZIFcj
 HxA4U4qMiFI5/bRQZbT4d6+Ss8gvk4W2oqZeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=+grt2lq7z6Xfwjj3obNToZK2iikIyYEevhepcH8Y3zA=;
 b=VUElJSU4Mpkuk9jTqFJLnHxmN6G/B/K/niFfpzqePGtH9AJlG65BVH/2kRdRuz10qG
 SUVLRAUknvTiKOSUXsw4wxVY+FKIqq3FP0eyHs9eORv0tcOE9yUNIFK1DI32ySd8Zo1z
 fGD+FFfc3qoaUnFlDvsaj+y60FVF/f5J7ekqQpYQl/nLYqvnYAM9RgIBeackeYht9zeN
 tL3XPlZMWFzDqHSSGpWgtxQhXSyyogQVATQ76qJXRQXPCcQ5q+hOSQyTe8+TXFzTARMw
 Dl0sCDBCv/uBMNiB/eXdTgzk4KB1YdqQmruLtDBam5MluQj4lnKqZHRd64CPfFCB51ND
 P36g==
X-Gm-Message-State: AOAM531fRQFOMCi7Frk7cpSP4RD69wi7gjDZ0Jlemazj7VvjD0LkLbPI
 +7Hm5cV2mrIWEGblNiosZSu8mw==
X-Google-Smtp-Source: ABdhPJyy/NybCCraoY2LInilmxjLXa17wS6eM5dZSb+zo1iqkBgmWudnyHSBaYln4qN66CDjiBjOJA==
X-Received: by 2002:a63:4b10:: with SMTP id y16mr4067214pga.93.1598059220930; 
 Fri, 21 Aug 2020 18:20:20 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id u8sm2912191pjy.35.2020.08.21.18.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 18:20:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200818163119.715410-1-robdclark@gmail.com>
References: <20200818163119.715410-1-robdclark@gmail.com>
Subject: Re: [PATCH] drm/msm: enable vblank during atomic commits
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Date: Fri, 21 Aug 2020 18:20:18 -0700
Message-ID: <159805921877.334488.15322995741035336582@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Sat, 22 Aug 2020 09:02:00 +0000
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Rob Clark (2020-08-18 09:31:19)
> From: Rob Clark <robdclark@chromium.org>
> 
> This has roughly the same effect as drm_atomic_helper_wait_for_vblanks(),
> basically just ensuring that vblank accounting is enabled so that we get
> valid timestamp/seqn on pageflip events.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---

Tested-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
