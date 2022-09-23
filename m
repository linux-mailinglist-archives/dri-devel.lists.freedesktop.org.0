Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F735E7807
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 12:15:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A1110E804;
	Fri, 23 Sep 2022 10:15:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4580610E804
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 10:15:40 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 n35-20020a05600c502300b003b4924c6868so5001274wmr.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 03:15:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=H3k8nwYg9LM+0smtYDMfCrY2rja+gudmrYIAx1+mEps=;
 b=V5tyb7q3mz7fb0AiC5Sbu+Fsu0uLtqx6G/sx44RQSFrO5k7EbKpiUj03di+bluIjAa
 3vKQxLJaoHwvmi6+FTkdxNTNzCANwbYt/JqeUba1PhI1H7JKqMq7lKFMNMScbVy0uVzQ
 zufK/aBP742ZVV6rrnb/Kq0bDpjIiaiVbIKnzqz0e8HOWykvr5d9mpJ43XW/grdg3/SI
 xK01XJel69w0WogqaSUJEK6BMrXZ/UqqkdCk4qMPlMlZiWKApNonWB1BYbetABPscD5u
 /cb3BBdbQwm5eCOBvMtBFWCrm7K+UPItQJa6kD5GcAXRgm9HrHNC4//s9z0FWMguM3p3
 eq/g==
X-Gm-Message-State: ACrzQf2RpEKYFpvVS+HxcS86ToJB+oX2rPI9+OeCVY6zd1BDd9yq14uS
 4Ft2wW2KKDnsgfFHh9E8Pyk=
X-Google-Smtp-Source: AMsMyM6uVc1utll1leFSA3Ob9+kmyV0+mvx+mZpkH4OV2fn7yg3XyYhCkjXBv8PD3H23g3832TOSOw==
X-Received: by 2002:a05:600c:2b88:b0:3b4:8680:165b with SMTP id
 j8-20020a05600c2b8800b003b48680165bmr13130181wmc.113.1663928138757; 
 Fri, 23 Sep 2022 03:15:38 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id
 h6-20020a05600c2ca600b003b4c40378casm2165673wmc.39.2022.09.23.03.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 03:15:38 -0700 (PDT)
Date: Fri, 23 Sep 2022 10:15:36 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Saurabh Sengar <ssengar@linux.microsoft.com>
Subject: Re: [PATCH] drm/hyperv: Don't overwrite dirt_needed value set by host
Message-ID: <Yy2HSKb4AtcF+em6@liuwe-devbox-debian-v2>
References: <1662996766-19304-1-git-send-email-ssengar@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1662996766-19304-1-git-send-email-ssengar@linux.microsoft.com>
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
Cc: linux-hyperv@vger.kernel.org, airlied@linux.ie, ssengar@microsoft.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mikelley@microsoft.com, drawat.floss@gmail.com, Wei Liu <wei.liu@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 12, 2022 at 08:32:46AM -0700, Saurabh Sengar wrote:
> Existing code is causing a race condition where dirt_needed value is
> already set by the host and gets overwritten with default value. Remove
> this default setting of dirt_needed, to avoid overwriting the value
> received in the channel callback set by vmbus_open. Removing this
> setting also means the default value for dirt_needed is changed to false
> as it's allocated by kzalloc which is similar to legacy hyperv_fb driver.
> 
> Signed-off-by: Saurabh Sengar <ssengar@linux.microsoft.com>

Applied to hyperv-next. Thanks.

I ended up reconstructing the patch myself since the said driver
changed. It is only a one line change so that's fine. If the committed
patch is wrong, please let me know.
