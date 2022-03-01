Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2564C8C2E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 14:01:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 521B110EC20;
	Tue,  1 Mar 2022 13:01:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB20410EC27
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 13:01:33 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id e6so12961014pgn.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 05:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bBkJiLuPHjOc9NWEYiRCYWyb3Lk5w/JeF/xlR5gs4hs=;
 b=i4OVRGoFkCkNde86gug8c9kHl9wCk8bIw4m5YLIN7XHsdz2jQ7o2wRjMLRdGy3n1Ym
 JnO0O4+hVkm/hktcZ2zfm/1unGF4jrWiy1RLhZqzV+rTA/O1Dw9J8PbHEJddoTmcMl2K
 /W9IQV8PguunKOlg+NiXofDeA8nreHNArqwm+c7OAwK7OtNqfZRSOCp+E+FeaFJqWUAk
 2zPqDjLgsfuRlK7nm63PmwH7HpxHgNFFMQCsifDmGC+NkjIYLOPHO7oRu2Fiad97/SeY
 2el0jSvK52BtZPTTP0BAJKR6NZPys66RMJJqxaj/lE/Ln0GcsaoeLsabyZp/2/Wt0KIL
 m4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bBkJiLuPHjOc9NWEYiRCYWyb3Lk5w/JeF/xlR5gs4hs=;
 b=bYvNgSSPo99MA40GKLRgqiUE5C+0GG55j4WECpdS119BEzvjox52w7JAAxsec0PGU2
 rZnE0Zr8Z3m9Emd92HZSPmV+ZcNzpBONT67WDL5vHzMdE/4V9ZEnQVcxEzcRGrE8i4IN
 3XpZYAXQ2IPx10e0ZxqLmy1/Yu8e+SX+wyHnsngVvKgbP3W/wV0Mmpdy8Bd4LS+NpM5Z
 s1On4NpTNZouncgk1hzTf6Igfyj1jUAhbgt37M8HFvK0aZ62mfuBSctc9cFSeonbL1k9
 2ptu956CPKSQ+UOjJqDqeYpxJdyahLdrQ2O5Sp650Zai/0I0miCx2LfamXhX/uhmJV3W
 udiw==
X-Gm-Message-State: AOAM530dsg408FTDdn4bLW5kIeRVOYqSK4lsV+38R9Rg3k1Z4qd04EvK
 Ffi0idYqjAIhTHp0O4qFuZBiV33zzlZLuXoZjEWPhw==
X-Google-Smtp-Source: ABdhPJzEQEfDRhRPdM/rqM32LFVlYTzuM1o3AH3UQR0rfZLv3PeL3HjwR1NNVypuChzG33h12Nv13wZdzGFJaZEpTFw=
X-Received: by 2002:a05:6a00:889:b0:4e0:dcc3:5e06 with SMTP id
 q9-20020a056a00088900b004e0dcc35e06mr27195834pfj.29.1646139693124; Tue, 01
 Mar 2022 05:01:33 -0800 (PST)
MIME-Version: 1.0
References: <20220217024418.3780171-1-xji@analogixsemi.com>
 <CAJMQK-gDHsH=F=d+9W1-jOqKx6kveUtRRSG03W6KDVat=BzZhg@mail.gmail.com>
 <CAJMQK-j6Nm4xt0oA9332+3AbqZ9YJuAR7EAK2BZnob2EkKLH1A@mail.gmail.com>
In-Reply-To: <CAJMQK-j6Nm4xt0oA9332+3AbqZ9YJuAR7EAK2BZnob2EkKLH1A@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 1 Mar 2022 14:01:22 +0100
Message-ID: <CAG3jFyu_PmcvV7Btz-WQWQMS_GFDZnKgC8BJ+wrmax9CrP6Atg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: Fix release wrong workqueue
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, qwen@analogixsemi.com,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, andrzej.hajda@intel.com,
 bliang@analogixsemi.com, Xin Ji <xji@analogixsemi.com>,
 Xin Ji <xji@analogix.corp-partner.google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-next.
