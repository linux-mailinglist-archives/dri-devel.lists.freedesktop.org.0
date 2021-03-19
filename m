Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3703420A4
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 16:13:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F7E6EA42;
	Fri, 19 Mar 2021 15:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D1D96EA2C;
 Fri, 19 Mar 2021 15:13:34 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id x28so10531688lfu.6;
 Fri, 19 Mar 2021 08:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ayTZjFxRhnC8VGTqHsHaHigGOs8/jskQ5TUarpfnr58=;
 b=HqB+ZHZwCbGOtObgPGMI3s8QN70KKaFwnotbPiKFqdwgugyXo8Odhnnc6qKk9kChbD
 w9lXWIo7ASUpeobdz+HDIJ2PdFmYAVCG8VFrlJGq3X012qiXzu+acWEI4sqLDBtHpyrm
 CbjymU9vs8WGSkfLB+1PKXdcE0HeJaR0dWz3tQavRNyZuxrcBH0H+2CoR9wxA7zQV7cH
 qraZKRBjeSgPwBF+DGvh2DLbNMVIkd7dpqAVXvw+ugLo1ga44CrpYOCl0+E1dMsDluH5
 pZS4r+mJBDmGQgdSxeK2b1axCfOc+EH1+7f7ynyVoPmcMaVljiS2F2xJHwxB5AsYJE5X
 Jv8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ayTZjFxRhnC8VGTqHsHaHigGOs8/jskQ5TUarpfnr58=;
 b=hhmlE44MrRNJqCQ1ITXBgwi2XhDDyA8kOLjPOqWF4PRZZ5yACCuy1QOh3snYsp294o
 s1F9WyPbFu6ZRWuYDJH1H8JIy/7V8V7aeu7EwDL/fbkP7ptqw6quYZ6Z2M6Mzs4Bsa2o
 6lF+UeVpxTufmM+nSdu70bZLjrnniehlYW5jTsJZOyEbfxfYwmpLEJx7N7FzL2jemcCH
 4afFd4QQxGAeXYH9pvK1Ri3j6eKI+YSWidolsHGrwS4WnJOB+6ymyiAP7tyovDqVuHle
 7ThqITCXlFSmldOnplfEdL9N/nHsU5upO4wa1SzyZW1Zr5pBZhxouDHctwqtuQ7/rYnD
 EwsA==
X-Gm-Message-State: AOAM530fek0bjaCGpXYJ5b6XWpj2mz4Jz1ZK1FaLYLtlvblm0Z8kYOmn
 KwABiDmuHNrYFpWMVYAo3J2xV9P/IOpZAu/ndu8=
X-Google-Smtp-Source: ABdhPJwNGBC6FdrWz1YtnwSBdmcRHIEvYv1CuN2qrAxfSf7ep3pfkDcpcXIc+9Bu7hMtEsRrnZxSCYGTFWHSGzy0nL8=
X-Received: by 2002:a05:6512:1031:: with SMTP id
 r17mr1058146lfr.583.1616166812521; 
 Fri, 19 Mar 2021 08:13:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210301214152.1805737-1-dmitry.baryshkov@linaro.org>
 <CAOMZO5Br85sf+ndiOWzeG7DgpqVHpXtnNGZLsVMOpBC5eVE2Aw@mail.gmail.com>
 <CAF6AEGtYJegOPt4dju5wyzp+WEhXdKyeUbkoO-oDzSC2aR_9ZQ@mail.gmail.com>
In-Reply-To: <CAF6AEGtYJegOPt4dju5wyzp+WEhXdKyeUbkoO-oDzSC2aR_9ZQ@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 19 Mar 2021 12:13:20 -0300
Message-ID: <CAOMZO5Bd68TtZ=-X_Gg7n9W4BsdAhbQAO2JhjMQvwtjdoWsn2A@mail.gmail.com>
Subject: Re: [PATCH] gpu/drm/msm: fix shutdown hook in case GPU components
 failed to bind
To: Rob Clark <robdclark@gmail.com>
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
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On Fri, Mar 19, 2021 at 11:44 AM Rob Clark <robdclark@gmail.com> wrote:

> I think that might not help if something fails to probe due to (for
> example) a missing dependency, so !priv->kms is probably a better
> check to cover both cases.  But the 2nd patch makes a good point, that
> the suspend/resume path probably needs the same treatment

Thanks for the feedback.
I will follow the same approach for fixing the suspend/resume path then.

Let me test it and then I will re-submit Dmitry's patch and the one
for suspend/resume as part of a patch series.

Thanks
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
