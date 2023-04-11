Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8B66DE43D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 20:46:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C30B410E616;
	Tue, 11 Apr 2023 18:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D61910E616
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 18:46:24 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id z26so9011322ljq.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 11:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1681238782;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=iGi56Bg5OUpWDH44viG14oM0bwik+WxXcsnn4rAhg4g=;
 b=JY3NR6Kd1R5Edh80q6U5b5maTRy1MgNEFB7cvjkoR4ryfX9BcbYUpwbEWlneTCEvkb
 3fCyg1MyVZoGNKT/AG/5Gn6gtxonf0T7UF3/U6O50Hqy0TZbB8zmRMvLwnigcSUKedf9
 rChAExcHpw7ETolrqjkkCvtgaHVaRHyfcrkuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681238782;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iGi56Bg5OUpWDH44viG14oM0bwik+WxXcsnn4rAhg4g=;
 b=oe3ilfvvn9fSqWo/IEOykm9c1TaZJ+fI1YvEOAVqNrXQ74Ae5art/oLAEz1/zgnuMz
 2pMUs63uuMdParf2cCJfpSvHjBSusyIFsyWgRnkLJL/tRF8pQi4IM3COjCRP7JTeOHpq
 Mk7gpXLiLav9w0w0vp9n5rOEMeiyEF9LKksFjTc2L/RsN6qEGRWUr9dqmzSBvBByoLYW
 QuqZyOMmdjuL7y/YExI9an5iD6PImVyZxk+Qd4WwAkdHXP4O7TG3wYeiq4yfXWPS3o7H
 7mmkWkt4ZIN36JENK1bc9hA93Vq5+yZEGVxDyIs4kCk8zxvAhgyO1gCZknmvZ1KhjTa0
 CrEQ==
X-Gm-Message-State: AAQBX9d31GUvg4XkEGopWVELKCpnm5zA61J/bUgI48x8rEm9kKLINxpx
 827M9stjLeSpCwajy30PNEpNd6ZGr2g8obgDikJnxg==
X-Google-Smtp-Source: AKy350ZfMTgXBCfIYGkHy5hZyhZsQ32BoV8dwK3uBPbJHXwS8s/7arQZv8IsNfSSDQyzo3Fu3PuMODQh8egr6Uw8r5M=
X-Received: by 2002:a2e:3005:0:b0:295:bb34:9c2 with SMTP id
 w5-20020a2e3005000000b00295bb3409c2mr3646077ljw.10.1681238782309; Tue, 11 Apr
 2023 11:46:22 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 11 Apr 2023 11:46:21 -0700
MIME-Version: 1.0
In-Reply-To: <20230411161903.599222-2-dmitry.baryshkov@linaro.org>
References: <20230411161903.599222-1-dmitry.baryshkov@linaro.org>
 <20230411161903.599222-2-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 11 Apr 2023 11:46:21 -0700
Message-ID: <CAE-0n508=PMma-X8rANuA0ogk9147mTR6XT1YsxcYyq3f-Oj9Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/msm/adreno: change adreno_is_* functions to
 accept const argument
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2023-04-11 09:19:03)
> All adreno_is_*() functions do not modify their argument in any way, so
> they can be changed to accept const struct adreno_gpu pointer.
>
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
