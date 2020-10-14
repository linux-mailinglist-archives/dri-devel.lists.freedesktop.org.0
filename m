Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D73028DA41
	for <lists+dri-devel@lfdr.de>; Wed, 14 Oct 2020 09:05:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 888706EA1B;
	Wed, 14 Oct 2020 07:04:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6AD56E027
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Oct 2020 00:37:48 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id y14so892337pfp.13
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 17:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=hj/dmzhSD6nEq1ECbJRrN5k3Yj70fyLPOHyyW3Lpa2M=;
 b=kubmvMu5gTY7pe6tnlFzYeC3gTJERFLXcbo2oIc2aoaGVmm+rI0CYNxe0OLsyZjRws
 xiq1KhAlYf0lKT3uew8qUdM2El6LoZ2FsouGYxKdKL2OQNPwgXebCx9wmHNtYiYyZI4q
 vTh4pcTulPq9jus3R3S/D25hLkJgue+fJuk6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=hj/dmzhSD6nEq1ECbJRrN5k3Yj70fyLPOHyyW3Lpa2M=;
 b=QY6a0Ahto2E/LptKiYpPAlt4EWBnw//e10cdTN/F9rFoZN+DEeOOhaJq9SsYmsYjBE
 AItpnPCqvaFyMQMkwPKXhWq6fFekj8byueQe9PeRSCNbbnj7zudt3OUUW4o8MRkNNULF
 XASoNiqAdj6epGhawpoVih0j7ztI6JbolRvabaUrSBeQC4vJOZKYxLWzj0DDVCWTt7MH
 Yt6w3f0PLe0dCxGvTCN5+1R7cl9nVcfDDcqmFM5o4ZXFqhOhq4zAU8JtemtT08D6W0Q1
 Q/DDh+kFiko2/Vgr7elE79uYr66i/9XqCtUs/oGcTrlPFCS6y2YP6Jxr8OXQRVxNgFRf
 +eUA==
X-Gm-Message-State: AOAM533bhZhz63rAVH4FGAaP9GrxOU+qovfEs+vt6qVAfdieA0UaqPVc
 w6oszWTLn9k3MaLJDiKfineV0w==
X-Google-Smtp-Source: ABdhPJy6yojyBg652Pz+i9adM86lSaHrUVX9BrY5jyJAsPNpduOoyeGyfJRzzoqU3rl001da66WPpQ==
X-Received: by 2002:a62:cd85:0:b029:152:6881:5e2c with SMTP id
 o127-20020a62cd850000b029015268815e2cmr2060162pfg.36.1602635868572; 
 Tue, 13 Oct 2020 17:37:48 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id u8sm833323pfk.79.2020.10.13.17.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 17:37:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20201013233544.5324-1-khsieh@codeaurora.org>
References: <20201013233544.5324-1-khsieh@codeaurora.org>
Subject: Re: [PATCH v3] drm/msm/dp: fixes wrong connection state caused by
 failure of link train
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Date: Tue, 13 Oct 2020 17:37:46 -0700
Message-ID: <160263586661.310579.4100614256936519238@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Wed, 14 Oct 2020 07:03:59 +0000
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

Quoting Kuogee Hsieh (2020-10-13 16:35:44)
> Connection state is not set correctly happen when either failure of link
> train due to cable unplugged in the middle of aux channel reading or
> cable plugged in while in suspended state. This patch fixes these problems.
> This patch also replace ST_SUSPEND_PENDING with ST_DISPLAY_OFF.
> 
> Changes in V2:
> -- Add more information to commit message.
> 
> Changes in V3:
> -- change base
> 
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Any Fixes tag?

Tested-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
