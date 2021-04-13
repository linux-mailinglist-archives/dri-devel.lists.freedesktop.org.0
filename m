Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 662F035D5E3
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 05:30:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8157B6E118;
	Tue, 13 Apr 2021 03:29:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B11236E171
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 03:29:57 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id t23so7739814pjy.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 20:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=DynDyWvccRYWPixdZN4H8oJ4zvAUSDNQf2dmUS2wW00=;
 b=Ql2Y2Kg3KxgNqF3Zg8yz0YIMGEicTbn1eIgNdhf4EPE2qyysjk8AssDl42K3Div+5T
 /4xnHeJVzx4DG9EHMdtng46958IMwdL0u1FlfgKzZapuBL42VnweL9/i3pYSquPq/GCE
 y16hpkz/ha8LsmU7OZiz0FcfjDQCJvz2sCi5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=DynDyWvccRYWPixdZN4H8oJ4zvAUSDNQf2dmUS2wW00=;
 b=VWvjiROTCS24W1Hv21IwHCNsDhaAg+EsUuI4jXWZSE5br2icl6HBSnWYEBDjtWqouG
 OMP7y5TdgHIM2+ttJtDQoR+S5gzjT8/mc3leeZ52ls847uOyRACHYHlh+YvSPdj0nqdo
 2iTzg/I5YqZeequreOJOw6xEj/pzGzh/IiJ/GxxWO1VPCIMc6+MW4cbyNiCIXfseiLNK
 1I8k7pEsRIRF5t4PvWG8TSN+YqASaa77k5Qq3UMOvr9V5T5wwNitWc+yLljDQNgxA0qm
 PTnsM57UOxC4MtWI77RRn6TwVMeesFZh/y1S+2KmWQ5lhC72UJenUmiBLaEr1YD0YCuZ
 l5Ug==
X-Gm-Message-State: AOAM530wLWx8TuVuboKLpEyAlpj3jMXFSA4KStvJQLwuWYKkHJcFdWNl
 /BoPT9prUfsFVaXNxAkI4WWFFQ==
X-Google-Smtp-Source: ABdhPJw9dbnsMYGsSa9Am46g8wAw3a8D88wOwThNmlb1jIzTMyJnO6BG+AI6KgAd6QyZgQVycVY1Vg==
X-Received: by 2002:a17:90a:e28b:: with SMTP id
 d11mr2583048pjz.53.1618284597380; 
 Mon, 12 Apr 2021 20:29:57 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:1d18:a339:7993:e548])
 by smtp.gmail.com with ESMTPSA id r1sm11724978pfh.153.2021.04.12.20.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 20:29:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1618246971-28754-1-git-send-email-khsieh@codeaurora.org>
References: <1618246971-28754-1-git-send-email-khsieh@codeaurora.org>
Subject: Re: [PATCH 1/2] drm/msm/dp: check sink_count before update
 is_connected status
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Date: Mon, 12 Apr 2021 20:29:55 -0700
Message-ID: <161828459569.3764895.16686521998891540267@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, khsieh@codeaurora.org, tanmay@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-04-12 10:02:51)
> At pm_resume check link sisnk_count before update is_connected status
> base on HPD real time link status. Also print out error message only
> when either EV_CONNECT_PENDING_TIMEOUT or EV_DISCONNECT_PENDING_TIMEOUT
> happen.
> 
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Also please include

Reported-by: Stephen Boyd <swboyd@chromium.org>

in the next post.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
