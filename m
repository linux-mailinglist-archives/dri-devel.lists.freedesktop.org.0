Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4CD1C1D76
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 20:58:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC246ED33;
	Fri,  1 May 2020 18:58:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752106ED31
 for <dri-devel@lists.freedesktop.org>; Fri,  1 May 2020 18:58:20 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id w2so7972707edx.4
 for <dri-devel@lists.freedesktop.org>; Fri, 01 May 2020 11:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vt0QD0qGDDBVo/FGY17/QPfRi70EGhMjrVST5CXganc=;
 b=n+VOSW7MD4XNSmZihQfjum+mxK5FnIdMcEiBsOxO2YKarPrGhNRlvcg2KHGBfRAO6e
 4gbTcv566mvkBg2iFpc/NReOVomtY9GLeW4yURrBxLL94iCOMH2NFhidOSWDfOVLE8h5
 QYrYIGtF90V/JseWG8q987eBRh2ABNYDpFCvHQr5VZK4WNOxMrhCyO9RONejoHOPH296
 sHzmULyHaChfwP/e/fMlyiabp3YCA16BBXIfKWM2tDqpwkLKNwN9ZYhLwBrIsHtUfS1Y
 fXdtX4nNCU0HVUP/jeU7v5WrRblEk6xrYarJ+/+Kfdv8tLcKTkqacAqVy9gqdGwqr0YQ
 VRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vt0QD0qGDDBVo/FGY17/QPfRi70EGhMjrVST5CXganc=;
 b=nYp+QPLtliaxKaXB5x3CN+B6mR9ARBVzdxF6zHXeYSCY2B3L1RAzTphAf99PlITSfn
 c02qOQH0PxHWd2R3jgpxKHGg4/WKy12PuA/yPrQtbNlOzZ/mcZlMI//Aym/rnxjtcdww
 jPXDY2s4mIu5Eat4drssqlfZVzqhhmetfsYf/JCItNTlaBs5G5oCffbzyBb7Xw3e43TN
 kSQfUdtpc7H2QaLdg/dyYDxu1fxfQZ6shDx/TnBlDTfqHLJ+w4VFED+CydBZvVSimMks
 UkUcZmWpg9ksifrfSqnCV+rjpFNWHGcXl69aAiKM5CKb65wnU8j4vAY5xu11Kt3LafNh
 0bWQ==
X-Gm-Message-State: AGi0PuaRkw+4ejEc7u20ThOq+tDpslJjqVD45TxOakaBw9wlEQ1UvYzD
 7P0og5Dau3RRD/IkBOA5tn/2GA9SqkeDFeFzkOUtMw==
X-Google-Smtp-Source: APiQypLXpYI05phFZgf41A4e2ccy/aLjYv3h3qo7mTf3PdPfV7hhelvJX+6ErvFxVnYeV8WkozZ6Kn83pMp9XjQxpfs=
X-Received: by 2002:a50:aa8d:: with SMTP id q13mr4726587edc.88.1588359499000; 
 Fri, 01 May 2020 11:58:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200501182533.19753-1-jcrouse@codeaurora.org>
In-Reply-To: <20200501182533.19753-1-jcrouse@codeaurora.org>
From: Eric Anholt <eric@anholt.net>
Date: Fri, 1 May 2020 11:58:08 -0700
Message-ID: <CADaigPXLOp8+cJ6XGzUm=bmyyhMO2qCGHhgAA44Auq9NvhfFhw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Check for powered down HW in the devfreq
 callbacks
To: Jordan Crouse <jcrouse@codeaurora.org>
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
Cc: freedreno@lists.freedesktop.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, stable@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Ben Dooks <ben.dooks@codethink.co.uk>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 1, 2020 at 11:26 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Writing to the devfreq sysfs nodes while the GPU is powered down can
> result in a system crash (on a5xx) or a nasty GMU error (on a6xx):
>
>  $ /sys/class/devfreq/5000000.gpu# echo 500000000 > min_freq
>   [  104.841625] platform 506a000.gmu: [drm:a6xx_gmu_set_oob]
>         *ERROR* Timeout waiting for GMU OOB set GPU_DCVS: 0x0
>
> Despite the fact that we carefully try to suspend the devfreq device when
> the hardware is powered down there are lots of holes in the governors that
> don't check for the suspend state and blindly call into the devfreq
> callbacks that end up triggering hardware reads in the GPU driver.
>
> Check the power state in the gpu_busy() and gpu_set_freq() callbacks for
> a5xx and a6xx to make sure that the hardware is active before trying to
> access it.

Chatted on IRC -- while this avoids the instaboot on db820c when
setting /sys/class/devfreq/devfreq1/min_freq, I think we should be
using pm_runtime_get_if_in_use() to avoid the races while still
avoiding bringing up the GPU.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
