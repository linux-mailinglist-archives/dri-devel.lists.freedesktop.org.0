Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEC73F26BC
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 08:22:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C7406E9FF;
	Fri, 20 Aug 2021 06:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6EFE6E9FF
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 06:22:47 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id w8so8163405pgf.5
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 23:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=99KnB+URAYBtBEFeaEEoqvbN3Lia8bbvXa6b4D4VGvk=;
 b=AelbYVYXhvB2C9bFtneY/yrgfG2toP1CjqK6lvDsXri4wpxXyhmsJgoDY6ahx/XN61
 vKAczg+E4fXnnS8G0G93MoK9T+n8JSHY8ekq/8I4u69XNDvXXmaeliXWl3ny7DbR459m
 W50jTwNToE1LmUUokyr6le1aob0gVY3GnP1Ka3mI4XHwRz2fWCsY/l4SMPzwsS0xTXB9
 EixGvESxoBHqQEVnBddxUt4aKYU3B3NSH4JBU4qDMkK7Jhzi3FgC5Vb8HdCiGR2LwcMT
 sxBxULIIw3r+NvwPaEY2Ixaz7kUmSTr4+dFabybVlm+sD0srX/k7GhsedXDOGcsj6xyH
 5o7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=99KnB+URAYBtBEFeaEEoqvbN3Lia8bbvXa6b4D4VGvk=;
 b=bSO5xncfEN311DH1BeNhKKtyS3WFE1vJv39JjL+UA5pOHWDQooSR8jcXrEXV4Evt/u
 1rmj3LB0L57J9qNrNPpQJiP5jJehLKQbDI/U5EHa7pJd/I3y6aiUhMNwZAke78HeLEYw
 B9UDq0OYWq97KtuqGkgd9keTjWgm1aULuy0406Qx2jIMHQfjn2chpg/QGemiMoVJvcna
 vdrKLAuw4GDttwNHoUjw3INIw2mw5XnObFrUvU0A2MxukBocMx1xqNxdPQZGCrSPtSRY
 59pez6qVaevdtpcaERotgFzMk9vGR4d1R+qMM4AuBV80AGVgk8MuMBXTWQ1ceeJVEP5K
 /mBg==
X-Gm-Message-State: AOAM533pLClPNUH1Tm218mgVeXpcwgK18yVeb3cEzD57XEQCQAisvT11
 3YPY8AVM5h6SVsRtEubUBIy4Yg==
X-Google-Smtp-Source: ABdhPJypGMO2Ed7IdFKaQRO9FolvH4ihNSVV3QakhuP+Wz6bn/ypKEJCBJHQBshWUbxfQ2Oh/Vy6BA==
X-Received: by 2002:a62:b414:0:b029:317:52d:7fd5 with SMTP id
 h20-20020a62b4140000b0290317052d7fd5mr18445201pfn.30.1629440567069; 
 Thu, 19 Aug 2021 23:22:47 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:549a:ad5a:e5bd:8c8a])
 by smtp.gmail.com with ESMTPSA id x7sm5507625pfj.200.2021.08.19.23.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 23:22:46 -0700 (PDT)
Date: Fri, 20 Aug 2021 14:22:43 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Dillon Min <dillon.minfei@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [PATCH 2/2] dt-bindings: sound: rt1015p: correct indentation
Message-ID: <YR9KM5ubMr9JLLb5@google.com>
References: <20210819101020.26368-1-krzysztof.kozlowski@canonical.com>
 <20210819101020.26368-2-krzysztof.kozlowski@canonical.com>
 <CAL_JsqK1dhwSKbmCbuaWtBWQH0e-+rdJaWkzfx5b_5vX0toAjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqK1dhwSKbmCbuaWtBWQH0e-+rdJaWkzfx5b_5vX0toAjg@mail.gmail.com>
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

On Thu, Aug 19, 2021 at 04:52:38PM -0500, Rob Herring wrote:
> On Thu, Aug 19, 2021 at 5:12 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
> >
> > Use common enum instead of oneOf and correct indentation warning:
> >   realtek,rt1015p.yaml:18:7: [warning] wrong indentation: expected 4 but found 6 (indentation)
> >
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Tzung-Bi Shih <tzungbi@google.com>
