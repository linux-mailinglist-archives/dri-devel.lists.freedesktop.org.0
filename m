Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C9A50E9EE
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 22:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE09710E290;
	Mon, 25 Apr 2022 20:11:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719FE10E290
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 20:11:23 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id q129so18414139oif.4
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 13:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Mjic/+zJme8zynP2sX08SrHAg/3yMfrQ4Fx00iF0fX0=;
 b=YFgrUyczjyRzM90CDf5/Q+sTl7Kk/h/LjwzwpqWYXv8MY6Ga3wHBTtJbp4NrHlrftw
 bnW+y73vDjwcQZmAoJZZRdXVMvoZOcrRQGqlI+V9gNKnqrvxEAUaR0vvfMW+3XTxIAi0
 S42sLU1a7TGGtIAvPUaN1sh2Nl4dEk/2gxGYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Mjic/+zJme8zynP2sX08SrHAg/3yMfrQ4Fx00iF0fX0=;
 b=NOnB+P3WJcPlm2M3ugRC8nPoTQZP80pH9eC2ZVGDYcPz0DNDnrz2KdarXu7LhA4lin
 QdGMKIX/AebHmtRmTfh9hKLEQksSbbjQ5DHC60OaK8Ziowt9Rd+rbKfHqoBnhQFkTejx
 uJfE9/jlu+JCbs5KYZzXUrHmCTXvFXx1On/l4EPfh7Zk+Pw43NtuR77K4MffSV+lAEIT
 MNDBI6qwhL7rNPq0SjOyP04slAUNUfMCC1rpuFC0NVXBD/MdfGbhI0/VLR45+Spa9Q/N
 MhU9RPh/EbftNJIRmLi70R8ZEYKnCbJSmOE/u3qlqV6egiuis/5v5BjiauFDxWt8xqJd
 Bk/w==
X-Gm-Message-State: AOAM5309UGt+NoZPv+iS/PwPX+4a68EzQqTATJuXFz5tMAqM7bozR/sQ
 XEtGlY+rmiGyp1AU6QoEq0adEqcNatmSIdYnpp4pKw==
X-Google-Smtp-Source: ABdhPJxsMQaEqd9ibkQQl1fMlnDAr7kXgMYwl7tspORWVrkHPLW8+XsZ5FMAITRuX/xmgDJGyjvQ9czYe2KUg+TvZD8=
X-Received: by 2002:a05:6808:1296:b0:325:8fb:68f3 with SMTP id
 a22-20020a056808129600b0032508fb68f3mr5230521oiw.193.1650917482697; Mon, 25
 Apr 2022 13:11:22 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 25 Apr 2022 13:11:22 -0700
MIME-Version: 1.0
In-Reply-To: <20220425091831.3500487-1-lv.ruyi@zte.com.cn>
References: <20220425091831.3500487-1-lv.ruyi@zte.com.cn>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 25 Apr 2022 13:11:22 -0700
Message-ID: <CAE-0n53xBM+n__eKKGaCuB+3Ea4O+rNk2PUQbD2bjW3JS7YJBA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/hdmi: fix error check return value of
 irq_of_parse_and_map()
To: cgel.zte@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run
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
Cc: daniel.thompson@linaro.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 lv.ruyi@zte.com.cn, linmq006@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, christophe.jaillet@wanadoo.fr,
 dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org,
 Zeal Robot <zealci@zte.com.cn>, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting cgel.zte@gmail.com (2022-04-25 02:18:31)
> From: Lv Ruyi <lv.ruyi@zte.com.cn>
>
> The irq_of_parse_and_map() function returns 0 on failure, and does not
> return a negative value anyhow, so never enter this conditional branch.
>
> Fixes: f6a8eaca0ea1 ("drm/msm/mdp5: use irqdomains")
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
> ---

This one fixes a commit that moved away from platform APIs!

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
