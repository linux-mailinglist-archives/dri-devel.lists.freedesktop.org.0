Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 800734D2282
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 21:25:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E8F10E561;
	Tue,  8 Mar 2022 20:25:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5947D10E25E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 20:25:18 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id k2so505887oia.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 12:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=oDPDk3UmBsVk40ec9UZG1guo+bgLJlbyhqOvTa87J18=;
 b=ZEU3s/iBsPE/dcbZEncVtRdgyz4R+oUlZ8IFZd75aCfzqlFSkSNyCjKiT+LTsfYBHl
 Cm9iCylS8NjPhmqGyLleWV/AlIuLHWBBjfRO9YzBSGOiL+HUUoYiriTtZCjxZs0k6RSS
 JHDC2KWjdYFrWraKvKeVS8XH3ypl7yOLBoubU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=oDPDk3UmBsVk40ec9UZG1guo+bgLJlbyhqOvTa87J18=;
 b=Lx2X9TwNrazZV+IMCmDPoCzmrOG5ERph2gHAEEuIbMWuBcm5fMtQbf4fL0/NDNOWz+
 rHn3NX0b8Ad/gQvz4hvtN0HzRL4kOpRGe+/fpI17/aT5NE4EsP8YqYASuFYQNNF3KMVI
 RFISP2XrJ9XLi86ofdIUNeF73lLsPNXcLM1KYzBYau9HpJXgwR8xnut1Qglwy/jgOkWJ
 lZaV8/T8RecfmKGV754YL/tWpayD1+v/wI6AD/xd2lVQ/Sfi70hkX80NPDXmvqCee56E
 dt61AvHiEX13h6KGm5vNAo0CT8KJR5gB3c/iHcKU6pDMrxA3NhZ3FZEapg4hbVB80BHS
 3Iog==
X-Gm-Message-State: AOAM530sM0cQYFGJ+ZNaHzF6BK6+MKq0iiBCsq4Q3oV/ZAmB5lN+wxqg
 qC3anH6BhQuMNEXWxwWQfbxVGnJyGUiLzNcHuE7w412gZ44=
X-Google-Smtp-Source: ABdhPJyfkvCfjSZ//u1fwsUJLWTGqZE5hW7zbIbFOcJy9M5AYS6WsphZTeYWH38/SUWdTsorovwAZS/YNjiEUrd/bVU=
X-Received: by 2002:a05:6808:220d:b0:2d4:99cb:3849 with SMTP id
 bd13-20020a056808220d00b002d499cb3849mr3846554oib.63.1646771117701; Tue, 08
 Mar 2022 12:25:17 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Mar 2022 12:25:16 -0800
MIME-Version: 1.0
In-Reply-To: <20220307133105.GA17534@kili>
References: <20220307133105.GA17534@kili>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 8 Mar 2022 12:25:16 -0800
Message-ID: <CAE-0n51by--BL=+12LtVKRY500Y_c4tZHai--bVvMERGNaUg-g@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: fix cast in adreno_get_param()
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Rob Clark <robdclark@gmail.com>
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Jordan Crouse <jordan@cosmicpenguin.net>,
 Sean Paul <sean@poorly.run>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dan Carpenter (2022-03-07 05:31:05)
> These casts need to happen before the shift.  The only time it would
> matter would be if "rev.core" is >= 128.  In that case the sign bit
> would be extended and we do not want that.
>
> Fixes: afab9d91d872 ("drm/msm/adreno: Expose speedbin to userspace")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
