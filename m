Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F5635EB00
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 04:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F2AB6E42D;
	Wed, 14 Apr 2021 02:41:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6446E42C
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 02:41:08 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id h20so9293079plr.4
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 19:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=IWQ8kZIVlGhQD8+fDUl3Qr87vRGoEpJEhZ9a36cdmds=;
 b=GhUjZ2ZzTjpi1biirHOduFNr3NQBYkkJ5xRA/5xxo7UwrTjpe5gMi42KF/VcAgf9rB
 sucr6zJ0RA7Zb6zUP40T0031wV3wN2+mdQS9op63T/qR/NUQDJNAGnN/xi1AAXdsYlBO
 G62pKW/wz39ztJxtonQWrGCIbwKywdy2TXntM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=IWQ8kZIVlGhQD8+fDUl3Qr87vRGoEpJEhZ9a36cdmds=;
 b=ahmcdnm1v8ghGNMLh4bIB4IFyH28GikWJ8Olkerme6p/fjUeINXmxvZyIsGUt1eNm+
 1pAwOGyLp2z/mwizE7OHhiCfsVowhYgJN6N/cL4MJGPkUnfcyHp6I0p6TK5NX9rq7ATL
 mFGqxZ/6JSE8tScLSxe7AKmQCjGvtxnvPy1eM9sVCyLAdiBFX5+2fcNwagNh/uDwgFzz
 rdx2MIBJC839tLOw5lFfn1e9xcat9jniM7Y4XuKZXVWDVv4SWkoNLLdakycxgzMolN8a
 ywNGPHp/ebCm423QEx85Q0+7JZ1e5fmCpN5hLFMze7oGhq9f51Bi0uXHZKRAlkE5ujAH
 QHww==
X-Gm-Message-State: AOAM532/BaZTeuCuE/viza9lq1hMYSWPyJc8Vt11KD3YAluZaZtFrPak
 5KSf2IyM7S/KG6QDCUmJpsUKL+U5tK7QZA==
X-Google-Smtp-Source: ABdhPJyWXs4uv20lp9C9gM9mn6ADAno63aDcQTRqZNWrgUoUHGkLTKU1PClRdBDVvX1u664CF+3CWw==
X-Received: by 2002:a17:90b:33c7:: with SMTP id
 lk7mr951786pjb.95.1618368067895; 
 Tue, 13 Apr 2021 19:41:07 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:1d18:a339:7993:e548])
 by smtp.gmail.com with ESMTPSA id x125sm13272511pfd.124.2021.04.13.19.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 19:41:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1618355470-5226-1-git-send-email-khsieh@codeaurora.org>
References: <1618355470-5226-1-git-send-email-khsieh@codeaurora.org>
Subject: Re: [PATCH v2 1/3] drm/msm/dp: check sink_count before update
 is_connected status
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Date: Tue, 13 Apr 2021 19:41:05 -0700
Message-ID: <161836806593.3764895.3487656287937752851@swboyd.mtv.corp.google.com>
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

Quoting Kuogee Hsieh (2021-04-13 16:11:10)
> Link status is different from display connected status in the case
> of something like an Apple dongle where the type-c plug can be
> connected, and therefore the link is connected, but no sink is
> connected until an HDMI cable is plugged into the dongle.
> The sink_count of DPCD of dongle will increase to 1 once an HDMI
> cable is plugged into the dongle so that display connected status
> will become true. This checking also apply at pm_resume.
> 
> Fixes: 94e58e2d06e3 ("drm/msm/dp: reset dp controller only at boot up and pm_resume")
> Reported-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
