Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 138B748428A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 14:31:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 403F010E27A;
	Tue,  4 Jan 2022 13:31:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD93310E27A
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 13:31:09 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id mj19so31327106pjb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jan 2022 05:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bqezZ2/HwBTxC4hfR4A8RkBTbm8B6r0iUtltdIvH/WQ=;
 b=x2szVsGY/GCNpl2j+O35x4NIWSKA7MQRRX/Mddw47w7h5E5OqQe1Mbk/vXkOX8NV7r
 TsOlKTY1yUcXHwIR7Ievh2BHgL5Q3nLY+KuiF2BESpnZaXaOhA7Hs93V/Yde3YC7bkDI
 PjNeE5aenYNyDc6QAn7uoW4hu4vXnds9wuowl0ZBZNuTLWeBj6oTLy2CxaEJWYOcc6xB
 htI4/GKD8pf5ZiZTwaKvQYD/Ki0QotmpKNV1XjcVow4ueIDRmsTvjUmvOnJvbQdU+PRb
 DwshlQntTMYbyjYThDPvcFTxKfRzZrHpsL/gfvIskk4zMPmKQiVUMEJ8wpOO4qwQPH5O
 3edw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bqezZ2/HwBTxC4hfR4A8RkBTbm8B6r0iUtltdIvH/WQ=;
 b=hJdSyO1EYqlkrdR0f7/luTzvZxUU+oJUPTcoV2QZFhwICQLu6kyXvCn84ZuJR4Nt1Y
 pFUj2cIQ+eLtZ0OovjpbBu+510dRSpVkIM4WoHBjLNXelRREZ2ZWBjKxmQ61N/XdRsDc
 q2/mP6DZlM3gOMbmAEY+6X0uySwYcK5Dhzrc+nFvpNXZ24gtRBpe2loStu03VHVXRUPm
 G+J1k4+vKXB+58WhGA4BtSsP62W9XhSyH1fnuUlt/qspG8DlsqxMRUfCEzzm0LrvtT32
 RjRVJ2YAK9SZfyGXiWNUdklYsH1NZEKZc09DDS4bLrMYVSnToVDb1uxMmG66i5IsG9Aa
 sjBw==
X-Gm-Message-State: AOAM533tlAAqXiebGoA+HNUxKFGefEz5UBsZTsV3gRbBkEBupG2oaJIa
 jBMXDrRa9NsyMscyMKPDa62YJLz/zL7jmtcwmnbFjA==
X-Google-Smtp-Source: ABdhPJymoHS2LOpMnBomaiWBlq68VCq0TF8Pj9Nw2vHCzTTGaBPSskw4jJP8+fMranAQ8mA9S2rzd7aKWkci3NU8Q5I=
X-Received: by 2002:a17:902:b189:b0:149:6c45:24c with SMTP id
 s9-20020a170902b18900b001496c45024cmr42673250plr.21.1641303069261; Tue, 04
 Jan 2022 05:31:09 -0800 (PST)
MIME-Version: 1.0
References: <20211119145325.1775046-1-jagan@amarulasolutions.com>
 <CAMty3ZBGeHHWQ9C7mJn7i3i1HFEiqNmTUVe0_3O1uNwCHeFM5w@mail.gmail.com>
 <CAG3jFyvL9qkOBxa7DVrUhCRUUYZuMBoi84b-TrnGVYr6nn5ARQ@mail.gmail.com>
In-Reply-To: <CAG3jFyvL9qkOBxa7DVrUhCRUUYZuMBoi84b-TrnGVYr6nn5ARQ@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 4 Jan 2022 14:30:58 +0100
Message-ID: <CAG3jFys8Z8Lmcg8BzyN6KXgdcwhephH7MNwJg+q4MuPwNDzR-g@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/bridge: chipone-icn6211: Switch to atomic
 operations
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-amarula@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-next
