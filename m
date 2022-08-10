Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E56D658E4CC
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 04:10:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2557EE3074;
	Wed, 10 Aug 2022 02:10:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 998ECE304D
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 02:10:27 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 j66-20020a9d17c8000000b00636b0377a8cso8754899otj.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Aug 2022 19:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc;
 bh=jLuXr02/4FcnH6sSE/wa3hWFY34+NhWVn6axHTm9v/U=;
 b=SnnzWIIwqEobH0Hd3ElkxWCS38PwdORjOB/7trnM5hVytyfdptItihRxhMGoPP5fqe
 sKhDjKnAmbLJIES5S/ksPgr1XhXVLMEs5mTFcH8A4VgLJWI3ICoZdbpVobzoT2IOXJyU
 LK2WAGuvO87YkEAZsMlvKsPAZ7tuRLY3R30fc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc;
 bh=jLuXr02/4FcnH6sSE/wa3hWFY34+NhWVn6axHTm9v/U=;
 b=tv0eW66qspfzIVaMYdRRL0ScVgE++omi93t0UFsDKWJU+FWZ2dSyQRBkFD78c10VF1
 UVhfCFLNIbwhOK/t60ch+RljiPelh9UNjT4Pms/O68FjqVqjpRzfaPanYtspvFZ93kBp
 l1XfWsFoGjwpdo9ob3h9FYIUTs7/QjgHvctfqZAGrsEZ7ujyj+RaG36EAnXc1Acjg8tE
 Gq/C86wIHZLDFMemeydW0H4TV9FsXcjB2skslt57UeLXc8ORW09xi956AI/i4h/JYEIA
 g5R64jjq4PGW7vablos5QlaUnTCiMQsBCWgx6hkVNXZZNvO0gzVUeTd960qQZqWVcR5E
 pCeg==
X-Gm-Message-State: ACgBeo2Gqano6axuZ295TzeG3vcE2RWsBXBfeUAvoW47g3EDsPdpouKW
 XW67RJBrJMPCetBF6zdBda0CdaSUMbWK6TFdkMIjKQ==
X-Google-Smtp-Source: AA6agR5OcLVB+7ZF57mi3MW+ZH7iZGc+sxaF/YsydE2T4hd6AePeikXS7eWcIyvhYpSWNwM09WrM0Xvr8aG+ebLGr54=
X-Received: by 2002:a05:6830:34a9:b0:637:eaf:573a with SMTP id
 c41-20020a05683034a900b006370eaf573amr1897387otu.3.1660097426801; Tue, 09 Aug
 2022 19:10:26 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 9 Aug 2022 21:10:26 -0500
MIME-Version: 1.0
In-Reply-To: <1660077890-31622-1-git-send-email-quic_khsieh@quicinc.com>
References: <1660077890-31622-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 9 Aug 2022 21:10:26 -0500
Message-ID: <CAE-0n50e_rwTGwHyi=bajNCQ==h3ETO0iM1f75VpvoeLEpaZoA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: check hpd_state before push idle pattern at
 dp_bridge_disable()
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-08-09 13:44:50)
> dp_bridge_disable() is the first step toward tearing down main link.
> Its major function is to start transmitting idle pattern to replace
> video stream. This patch will check hpd_state to make sure main link
> is enabled before commit changes of main link's configuration to
> push idle pattern out to avoid system crashing due to main link clock
> is disabled while access main link registers.
>
> Fixes: 13ea4799a81b ("drm/msm/dp: remove extra wrappers and public functions");

Does it really fix 375a126090b9 ("drm/msm/dp: tear down main link at
unplug handle immediately")? I don't see how removing extra wrappers
caused us to start trying to set the idle pattern when the device was
unclocked.
