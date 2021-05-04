Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 498D1372527
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 06:35:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D256EA83;
	Tue,  4 May 2021 04:35:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A35726EA82
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 04:35:37 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 b5-20020a9d5d050000b02902a5883b0f4bso7174532oti.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 May 2021 21:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=12EeYennVqX2P8FOG2dNNIcrhuVTc1/1jZXtCarHoKM=;
 b=MSPmW8/ZKloKD0QDPiin1h8IqReGKHeqHXMAsiYNU6k3yqy+Tyd86qOIUhBCloDcgQ
 /LA7Rs5mdwb+VyvpdAb25xBsIbQQ9JaXe/e9+dcE3b4+ZERwRX0oSSrK2EW67kWcAWKX
 VajqY9gCYR41BVR/gaGhPObohRvZkgAD8FUaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=12EeYennVqX2P8FOG2dNNIcrhuVTc1/1jZXtCarHoKM=;
 b=PR653IaDGuqEkqUNvsC1gEclN4qgA2mbZ3fQazZ5+jWCYmjkqiICQVHU//HVIqoVix
 tlWgMcdriX4XLP/cGmFnhdghNOnS6/9RsJnIGuCd/nyLrz0LCirV8ciejCgFZ0Zpzzjm
 UYFYQET5+j1zr5/IfesRfHff5sLddPqKam524qqVycOfGoU1L5X+Uq4dvat9/JxkkJtj
 g3FAghTYBK8CEsmK3VJt7ncOYQ0PbT1Fq7qcCi+BgXLuveJadF6atdg1Vua+Hfm+4JNK
 wIEzqjIpZZ2eCNcdjf9SMyMKTY1G3hfyEbJ4AJOGRp2/cuCQn2562RJ16CVgCd2076/x
 vr7Q==
X-Gm-Message-State: AOAM532nuIjG0vgnkdZscrvIdwwBUjfSWDYvds94RGRRqz9F4hhyG+U6
 4FzYktmZgU4odYhLP1M7KWyb93XSVapEtJIIXB/Kmg==
X-Google-Smtp-Source: ABdhPJwjtAQf7I6rJSTL2NdHu7gm1KwLrNIZrA2fuZntbiIwPRA8HpdUJT6TpqFrmficTe1/yOI0+5z2M/cw+exheHY=
X-Received: by 2002:a9d:5e19:: with SMTP id d25mr17257855oti.308.1620102937013; 
 Mon, 03 May 2021 21:35:37 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 3 May 2021 21:35:36 -0700
MIME-Version: 1.0
In-Reply-To: <1619048258-8717-5-git-send-email-khsieh@codeaurora.org>
References: <1619048258-8717-1-git-send-email-khsieh@codeaurora.org>
 <1619048258-8717-5-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 3 May 2021 21:35:36 -0700
Message-ID: <CAE-0n519sFBeLsNF8=Ci1y_xfY4dRuPRNHnJ++ZXHgj6Z6LhQA@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] drm/msm/dp: dp_link_parse_sink_count() return
 immediately if aux read failed
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 abhinavk@codeaurora.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-04-21 16:37:38)
> Add checking aux read/write status at both dp_link_parse_sink_count()
> and dp_link_parse_sink_status_filed() to avoid long timeout delay if

s/filed/field/

> dp aux read/write failed at timeout due to cable unplugged.
>
> Changes in V4:
> -- split this patch as stand alone patch
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>

Can this patch come before the one previously? And then some fixes tag
be added? Otherwise looks good to me.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
