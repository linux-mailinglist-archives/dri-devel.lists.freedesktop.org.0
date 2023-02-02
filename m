Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E2568873E
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 19:59:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BAC410E5D8;
	Thu,  2 Feb 2023 18:59:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAFAC10E5D8
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Feb 2023 18:59:32 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 nm12-20020a17090b19cc00b0022c2155cc0bso2720310pjb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Feb 2023 10:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=39BPbN0smWcDZ2lm4R39HPEK2re9Dz2vc9CevX7LcLA=;
 b=bEOFscDKsWeiSBzpi36ddl+0X9WUI1rBgKUP+gIgKte2yJuqBAuN61dsDtqnG5RbT4
 FY6so8Ax0l9cznfL7eX6g5uh89Zde819T1dwcvySrLxT8B/INbxsz6tNRRjtNnPtZbnE
 0eW0N4yMVRoYa0O7j8OK7FvIc4+XUfyZ1Ty54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=39BPbN0smWcDZ2lm4R39HPEK2re9Dz2vc9CevX7LcLA=;
 b=ob3o3VDuv2SqcLPJ4k6IEOpRM35zH9Pl2HslqXw2S+2nHPW9MVQGTiVE/oY1nfIXto
 WiaoxXQaJCx7xaQQtlMshdz6tR4l5cplmLTGEP7tpoePg5pSClYOPV9lVQHcE4wbcP3/
 sjV2YHLBRe8+tyAGXy5T3QCuuV/6K+yJBYqqp3+jZaS2+OO4kJiq9XWFJqeAstlUgNgu
 Yhe6/GTav009plLjsWNsDDwUlQsL9vKgPGKqT9/u/88cDLclzMvDBu2wfpyVPPZ6Rkdp
 hoS6/asdvNjfLJ55ZZpe0cY3Hnaeu5fVEn9snMcwkj2ePpFQgdZ/tYDIFoC5+0Kb/Tzj
 AKEA==
X-Gm-Message-State: AO0yUKXi8ALN4E4iBYtsp3F/txTH7qQpzB4NxtSGLQM8q6rqjLoI2vZg
 qsm2WMOrk+EnpGo7X3Pgh3pTeI8NnmS4/3DCvNjNvg==
X-Google-Smtp-Source: AK7set97b7VPGw7HhJiw6iQIHN0soW6YLRSRHIPLLIiJZM1ui9C2RKGR/kE/k35IIF810Iiq7vn4cCqX9gGHHGnP0XE=
X-Received: by 2002:a17:90b:2342:b0:22b:fbc3:d3b1 with SMTP id
 ms2-20020a17090b234200b0022bfbc3d3b1mr795288pjb.102.1675364372222; Thu, 02
 Feb 2023 10:59:32 -0800 (PST)
MIME-Version: 1.0
References: <20230201170210.1253505-1-greenjustin@chromium.org>
 <20230201170210.1253505-2-greenjustin@chromium.org>
 <e96bd735-cf36-0dbd-cf93-446c1ab28778@gmail.com>
In-Reply-To: <e96bd735-cf36-0dbd-cf93-446c1ab28778@gmail.com>
From: Justin Green <greenjustin@chromium.org>
Date: Thu, 2 Feb 2023 13:59:21 -0500
Message-ID: <CAHC42Rf8+yS45VBUc_dDuvCydg4ttKYuGwdgFshZRUZWzGiXRQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/mediatek: Refactor pixel format logic
To: Matthias Brugger <matthias.bgg@gmail.com>
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie, jason-jh.lin@mediatek.com,
 justin.yeh@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matthias,

> mt8173_formats are the same as the old struct formats. Maybe we should use that
> and only overwrite where we actually use a different array.
I think this was sort of how the original patch worked, but we wanted
to add some flexibility to allow different components to support
different formats. In patch 3 of the series, we actually overwrite
this field with mt8195_formats.

> Why can't we use ARRAY_SIZE(formats) here like we did before?
I think ARRAY_SIZE is just a macro for getting the length of
statically allocated arrays. Because we won't know until runtime which
list of pixel formats we will be using, I'm not sure we can use that
in this circumstance?

Regards,
Justin
