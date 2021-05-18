Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E430938793A
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 14:53:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB6856EB59;
	Tue, 18 May 2021 12:53:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1956EB59
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 12:53:12 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id p6so5015603plr.11
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 05:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5NbTixXgWYXsxanz6aB594uSCEv+grsVBAHiaopDOL4=;
 b=cvlTJ1nijKUYCimS6Hf14ayIjwyPTQI7rc56syE/s07Kd//XjuVoF8DUfvLVL++PC4
 v4agY9I+h8lftxjM8vcMPteZIzoAcB6Xx70MPU2ji+LMgHW9y6211WWNS1cE5ePfsRZV
 pZ6uKxc/jjOSe7tjrR+b06V+NClqhpGOFwlHo41W7K2WFexk5ZS7mdWYlqIRzy2lEm1X
 BpQS2zHFx1sRaDOdQnaFq8vXvuX06lkEom4nX8oJNxP4GTZ1t8sGeBfwXdExDtN13TpB
 9ILJhNAZjYKfl99VnidcBO+XZPtGL2k06oPZW4RKGXokN+kENyo27kYp9A+SgcSDbn19
 bjug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5NbTixXgWYXsxanz6aB594uSCEv+grsVBAHiaopDOL4=;
 b=hOKKrZN5WzRL7X1GPrOMfrdwrcjNS4Rmo3nYqKj0pqHGjwrzTdfxDi7XKkyHg+XaVg
 I3TucU6wDYW7m84LqjGPbvu6qEDyeM7NA0N1yHdRDBs7l1xBysKt3R8z6M7EoB2LHhL5
 pc+XZqAyQ5UR5IHS4+/RvH7wKtqNaBWdS+BWiCHQ7vLoOHEqXZRyMGogsim7aOpL6tZW
 WK8k6yhm0eQuT/xZuDVgAYKavfhxYwBZa9Pf5npDWsrsBzNklpOQdDUp2r+yDbetFdST
 fCPktwwjKgw8u/v49sLbTgXP/7f69mxu0OCdKEKKFsbvVTlIuYTPZxwazbqI7ghQ2B+W
 L74w==
X-Gm-Message-State: AOAM533N/3bEV+TjV+ZOK0EIoilNsXiEc+OmX+O1R+mvPLzeXrRtCW+P
 nx8T65lSKUR2hGZM+CXTLAzbSjgUWtiLCsqF24DY0w==
X-Google-Smtp-Source: ABdhPJwuoavz5RUOgtiz8itk0VusVn3Gd/3D/VTxFq4CRODFlK+jE18X7mtNYNh953/3f0whDZLlZXv8Lt547lVupnQ=
X-Received: by 2002:a17:90a:b38d:: with SMTP id
 e13mr4830251pjr.222.1621342392033; 
 Tue, 18 May 2021 05:53:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210517063553.554955-1-pihsun@chromium.org>
In-Reply-To: <20210517063553.554955-1-pihsun@chromium.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 18 May 2021 14:53:00 +0200
Message-ID: <CAG3jFyu60U7oLSTBZN_X848kfnzuzRpbsnDJSsvmUZ=u2dv2Hw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] drm/bridge: anx7625: refactor power control to use
 runtime PM framework
To: Pi-Hsun Shih <pihsun@chromium.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Tzung-Bi Shih <tzungbi@google.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Series applied to drm-misc-next

https://cgit.freedesktop.org/drm/drm-misc/commit/?id=60487584a79abd763570b54d59e6aad586d64c7b
