Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB4B8478F9
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 20:04:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6FE710E81F;
	Fri,  2 Feb 2024 19:04:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="G3qiEnE8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE0910E81F
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 19:04:20 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-6de287449f1so1704700b3a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Feb 2024 11:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1706900659; x=1707505459;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Npl9pqiYkukISH1qhXGS77Lr3JhlbtXHY6tSof0KXkE=;
 b=G3qiEnE8livvHrrGtWsEyValTo6XMF0nZznmgyTpB6cNeReZEWajxZ1vNiSzcQZWev
 wNw6vO66/Zgu09xGMURXpLfP476p++wykukepIDhqHFEDZbftkZM74CLsOgsWoYa0QkA
 D/rhgz844FJQelMCKb+NlQn77hwSI5777eiU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706900659; x=1707505459;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Npl9pqiYkukISH1qhXGS77Lr3JhlbtXHY6tSof0KXkE=;
 b=R/D/Z0+6UekkwdejGxwGh4RA9L65iQUAtqC93Rop4des5AkuLBm55L8+3rUYlcot/F
 nbD0b7GqANnyU3w7NqlegnRtzRdLpV4bW8xyksRjcCWY6QxZXnCHej7AHTGIeTbmm/xm
 WZ9cwbHKTCrRffxIg6yUEQELWl/zuap3Pwi/V0ZMv4vBr8PTDovOLLKh/nPPKw1m0XZZ
 tdEYN47KQaBs/u2ObuJrq/X3bVWxKzQ94wlILDjllvbEUwVFU8KbP5r9RUUpOTgq8RYP
 08PzE03KKCSfditBMY6+r45BCw6DTLr+ebEvu6bQvQV+dEbWl0LxD0zXYkQy1QjC54zB
 oiiw==
X-Gm-Message-State: AOJu0YylApOtox62FHKjWbrI0V8PtGpUaPyw+Ih6yi7FToz1HG2vbz36
 f1pp+3w2t8CItFlAIEVZCmAmvilcyUpMtF0GHfrUbZrtjTtCSzDmCs0MS68D/q5e1on7oLn8LGL
 A1uD/
X-Google-Smtp-Source: AGHT+IFCpyPMevqxHPeVPHRo8rguLB5uVnRRRLuxPMbaWbXHixnt0A0mZnXv3FwXV68Phi2vfZQnlA==
X-Received: by 2002:a05:6a00:390a:b0:6df:fa71:f044 with SMTP id
 fh10-20020a056a00390a00b006dffa71f044mr2375584pfb.0.1706900657236; 
 Fri, 02 Feb 2024 11:04:17 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com.
 [209.85.128.54]) by smtp.gmail.com with ESMTPSA id
 d22-20020aa78696000000b006dde0df3a7esm1963820pfo.101.2024.02.02.11.04.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Feb 2024 11:04:16 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-40ef9382752so5735e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Feb 2024 11:04:16 -0800 (PST)
X-Received: by 2002:a05:600c:6005:b0:40f:c2f1:9d4c with SMTP id
 az5-20020a05600c600500b0040fc2f19d4cmr56952wmb.4.1706900654849; Fri, 02 Feb
 2024 11:04:14 -0800 (PST)
MIME-Version: 1.0
References: <b0c0de30-9ef7-5753-928e-f189038b7fb9@quicinc.com>
In-Reply-To: <b0c0de30-9ef7-5753-928e-f189038b7fb9@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 2 Feb 2024 11:03:57 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WuHtHF7Lh5OBtnumeEFry9SPEm9cRgDKTATjtTmJegrw@mail.gmail.com>
Message-ID: <CAD=FV=WuHtHF7Lh5OBtnumeEFry9SPEm9cRgDKTATjtTmJegrw@mail.gmail.com>
Subject: Re: TI SN65DSI86 bridge chip DT binding maintainer
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, 
 Bjorn Andersson <quic_bjorande@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Feb 2, 2024 at 10:29=E2=80=AFAM Jeffrey Hugo <quic_jhugo@quicinc.co=
m> wrote:
>
> Hi Doug,
>
> The DT binding for the TI SN65DSI86 [1] lists Sandeep Panda
> <spanda@codeaurora.org> as the maintainer within the file.  This is no
> longer valid because the @codeaurora domain bounces, and Sandeep appears
> to have left the company.  As such the binding appears to be orphaned,
> although the file itself is misleading because it needs to be updated.
>
> I'd like to find a new maintainer and from what I've seen on list, you
> seem to be interested and active in this particular bridge chip.  I also
> see that you are listed as a reviewer of the C code and binding within
> MAINTAINERS.
>
> Would you be willing to volunteer to maintain the binding going forward?
>
> [1]: Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml

Yeah, this is fine. Officially "maintainership" is through the
drm-misc tree, but I can have my name listed in the file. I'm already
listed in the MAINTAINERS file as the reviewer for this file.

If you want to send a patch I can apply it, or I can post a patch and
then apply once someone from Qualcomm gives it a Reviewed-by.

-Doug
