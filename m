Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB1A38F391
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 21:19:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9477F8921C;
	Mon, 24 May 2021 19:19:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F85089949
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 19:19:12 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 n3-20020a9d74030000b029035e65d0a0b8so4873892otk.9
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 12:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=AsmfRYALyOOPiklFnGLxIxG22/ZrSMjEGdTaIKdv2bU=;
 b=Z6K9qOtHmxNbIvyG9A4ac/vZr8tgn/cWTSgKRQvY4akWmBp6biiPaGssozi+HjDJ6N
 J2iwMafMFTIkGAGFdavLMTAX576r/cJrnUVzQoc5vnJOl4iJDionu1Toua7Pyr+Ggbdt
 05WC5Vk9GH6M/SjqEXJINc5HHx2d/+YYaawdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=AsmfRYALyOOPiklFnGLxIxG22/ZrSMjEGdTaIKdv2bU=;
 b=nDqOVAA7vSsKTeKdNex+6nBht2QhhlaRHZ3TTdHBCQTY7ezUAGSrCkKbDI/ECpcIBK
 Z2XVGjOuU6oEdFpmCoecUTmnASliEyB8UAR2Q4z5AFoQgIjM6wefVPKhHgyyMjcaCA6/
 fnpHrmp7fsSyzMlLMBBY1OVk7HP0DVWyit0lheir2pviN1ZOwgLAWSx901h23SCubF0q
 JHghWECEMfwfmjqFhSJwP9J3Lk90pcOhe0SiJ8ViQ8ydHrPlseWj+zQzol0b2/3DaWuj
 upSHXWn0vuTLYIGgW4q+senNSidDyufIrXeuSrHwRmSCASsutROQ/+GJU45J0Vng/4jO
 7gFw==
X-Gm-Message-State: AOAM530tH9zB7FqlTlapTA8ErgsLfucOWsqv2myR09EJPywnLPLFr+Wl
 0T/MlotSCkjb8EEEN1PEYbVMNh9DNrNId6aIunem+CimzfY=
X-Google-Smtp-Source: ABdhPJyZvnN47Xm+9vSAQTY/yVMkjuiMef8z4kEdnt1y+yOYDWPBCdNJk6g1rCvHRsb/g3TvNREw/LN0Y4VqyfCekTY=
X-Received: by 2002:a05:6830:3154:: with SMTP id
 c20mr2433314ots.233.1621883951712; 
 Mon, 24 May 2021 12:19:11 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 24 May 2021 19:19:11 +0000
MIME-Version: 1.0
In-Reply-To: <1133b2c21eb8f385c16c610638a17d9c@codeaurora.org>
References: <20210507212505.1224111-1-swboyd@chromium.org>
 <20210507212505.1224111-4-swboyd@chromium.org>
 <1133b2c21eb8f385c16c610638a17d9c@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 24 May 2021 19:19:11 +0000
Message-ID: <CAE-0n51G2NGyE4w1ebdBd1svVPA3QvPZX6kivKA1m9o1XhE26A@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/msm/dp: Handle aux timeouts, nacks, defers
To: khsieh@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting khsieh@codeaurora.org (2021-05-24 09:33:49)
> On 2021-05-07 14:25, Stephen Boyd wrote:
> > @@ -367,36 +347,38 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux
> > *dp_aux,
> >       }
> >
> >       ret = dp_aux_cmd_fifo_tx(aux, msg);
> > -
> >       if (ret < 0) {
> >               if (aux->native) {
> >                       aux->retry_cnt++;
> >                       if (!(aux->retry_cnt % MAX_AUX_RETRIES))
> >                               dp_catalog_aux_update_cfg(aux->catalog);
> >               }
> > -             usleep_range(400, 500); /* at least 400us to next try */
> > -             goto unlock_exit;
> > -     }
>
> 1) dp_catalog_aux_update_cfg(aux->catalog) will not work without
> dp_catalog_aux_reset(aux->catalog);
> dp_catalog_aux_reset(aux->catalog) will reset hpd control block and
> potentially cause pending hpd interrupts got lost.
> Therefore I think we should not do
> dp_catalog_aux_update_cfg(aux->catalog) for now.
> reset aux controller will reset hpd control block probolem will be fixed
> at next chipset.
> after that we can add dp_catalog_aux_update_cfg(aux->catalog) followed
> by dp_catalog_aux_reset(aux->catalog) back at next chipset.

Hmm ok. So the phy calibration logic that tweaks the tuning values is
never used? Why can't the phy be tuned while it is active? I don't
understand why we would ever want to reset the aux phy when changing the
settings for a retry. Either way, this is not actually changing in this
patch so it would be another patch to remove this code.

>
> 2) according to DP specification, aux read/write failed have to wait at
> least 400us before next try can start.
> Otherwise, DP compliant test will failed

Yes. The caller of this function, drm_dp_dpcd_access(), has the delay
already

                if (ret != 0 && ret != -ETIMEDOUT) {
                        usleep_range(AUX_RETRY_INTERVAL,
                                     AUX_RETRY_INTERVAL + 100);
                }

so this delay here is redundant.
