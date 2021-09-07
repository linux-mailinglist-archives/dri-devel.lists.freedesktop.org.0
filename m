Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A73402E34
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 20:11:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7481A89449;
	Tue,  7 Sep 2021 18:11:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2B889449
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 18:11:45 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id n18so10862110pgm.12
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep 2021 11:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0/23xqaes2XTEieQoEC3hXOVOrS1/VG6sVUwEzA4poY=;
 b=I53v0vNVcXjLUAzgN6FABSj/CpajH90TchdbeflSijyCy/S5z85IqohRum5yaNlzq3
 6yyxJ7b2BJlYRuWxWGiRgrUPTmMviDqWUtIh+vm1yp44d5oq0Trnw1QkiRCoq4NpLTVA
 YBbHyOX3+1JOgv9WN/11gNZTK6Nwjf3Dtt/co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0/23xqaes2XTEieQoEC3hXOVOrS1/VG6sVUwEzA4poY=;
 b=pKfsNX9XRAalOzHUODEytHlpmu2G6Kit81/reL8YSix25o19koqP/x2bhDplJHEJwe
 /uRrCUhn/zdBVQW6y6H0pw2FbnFR7vXnTfDk5IkgH1TRYEvPGDqj0wN0V9shviRuzNCR
 LT7pI0GR0Oiji8T5OmKX0Mu+sPt8nAo8j652xmQ07GaBJeAYNIULx8xNgka3bAVTiLVv
 EfCEcjrAGbn7MXTQQ3hOKGq/pnKkGYRLjFAGfmOz7IyKTfaKqSzVKw10LFckvEJSvuDp
 kMvgB48QCPCaw/MioBQSezVbAbEgHYjyn+CbytHXf/3+ogHvBodRMeOw94peYnXuIqqk
 s2Pg==
X-Gm-Message-State: AOAM5320n08yYX7o2XJsp7ZzrE6XCN9o2Duw9SxEX30W9X+SB7F4wmKa
 /rsQKMwvMuPpGvrCO50iHQj+eA==
X-Google-Smtp-Source: ABdhPJwvTjM+WRKARPvOY9pppfCCr5cnbhUPMqU4TuILvTxoMwyy8qFcltQrhIaNJAzdDsSAdOYp2w==
X-Received: by 2002:a63:5902:: with SMTP id n2mr18155671pgb.305.1631038305244; 
 Tue, 07 Sep 2021 11:11:45 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id c133sm11158629pfb.39.2021.09.07.11.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 11:11:44 -0700 (PDT)
Date: Tue, 7 Sep 2021 11:11:43 -0700
From: Kees Cook <keescook@chromium.org>
To: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
Cc: "Dea, Edmund J" <edmund.j.dea@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] drm/kmb: Avoid warnings on impossible plane_id
Message-ID: <202109071107.1E6C9DA5@keescook>
References: <20210825181807.1138053-1-keescook@chromium.org>
 <BY5PR11MB4182ABD607EB99C1F68777928CC69@BY5PR11MB4182.namprd11.prod.outlook.com>
 <BY5PR11MB4182FEB7263045FC3855723B8CD39@BY5PR11MB4182.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BY5PR11MB4182FEB7263045FC3855723B8CD39@BY5PR11MB4182.namprd11.prod.outlook.com>
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

On Tue, Sep 07, 2021 at 05:32:53PM +0000, Chrisanthus, Anitha wrote:
> Hi Kees,
> This patch https://patchwork.kernel.org/project/dri-devel/patch/20210728003126.1425028-13-anitha.chrisanthus@intel.com/ is pushed to drm-misc-fixes. This change should fix the below warnings.
> 
> I apologize for all the inconveniences. 

No worries; thanks for the heads-up!

(sfr, this change should fix the warning[1] uncovered by the KSPP tree now.)

-Kees

[1] https://lore.kernel.org/linux-next/20210830184429.1ee4b4d8@canb.auug.org.au/

-- 
Kees Cook
