Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AE43DC67A
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jul 2021 17:02:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 753956E830;
	Sat, 31 Jul 2021 15:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC1106E15D
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jul 2021 15:01:59 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id ca5so19349027pjb.5
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jul 2021 08:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6NzNWl7LhGEt5gulXFub5aIXRWGd7b+RfXfHU7IL/eI=;
 b=Jx/NovSJ2alFyoaVfse4LYGuhNMlBcAWv6JTiM3YSwvodvaXCAulhewOn2HF0FC+nz
 N7t2fd02SxFeFS/jAywZfBDu3dF82py23YxGadXmxU6FsZZNwFLKknaPYZ73JtAAQWAr
 FgjDEpjlNdXTBhWlUNhxTGhy3p9i8wqoga8qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6NzNWl7LhGEt5gulXFub5aIXRWGd7b+RfXfHU7IL/eI=;
 b=m+x43HV/f6FyCPO6l728aKecAnuAYXnStZOp3/eggh4ggzK6o1I7vKMHGTalGmVvah
 kFGYlOMO0j2S1704Ok58/DLecHe8U95KK37gp3/FItlXfvTh7RbG6NJdOjc4lXY640mu
 WwbidxKYZcEofPQmEfbQg2ulKMyXsUzyQ0YqreAJD1PZXXs+Yl7818nzcdsV3J7Orkcq
 IWBWtY/DyGIksCb2OBNVJgNPUFxAg3D1G8bEIyDrl/EasVN4t60ma4HyrhgoQKD9JYsK
 Y8mhwjvMNQ8iA9b8BpysSUEECPXvY6dvt7X58m7uApxC5erL6rT1NlT7maV2PVSpHCab
 yfWA==
X-Gm-Message-State: AOAM5314WfPwCziSxbk+zPiol8rUq2ZJSiNCE0eIn9jZNI7xdTc3fV8W
 LhT/7FLhMfJXtCSpVJ1Z50rlqw==
X-Google-Smtp-Source: ABdhPJxldKFq/Rzqofqxn4rJbNcLhr5hYJ4ZeyAVRbwaYS9Cd10PchwbLiRXEC7+1Qe+4tL2UtPocg==
X-Received: by 2002:a65:53ce:: with SMTP id z14mr2617394pgr.275.1627743719538; 
 Sat, 31 Jul 2021 08:01:59 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id jz24sm1857832pjb.9.2021.07.31.08.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 08:01:58 -0700 (PDT)
Date: Sat, 31 Jul 2021 08:01:57 -0700
From: Kees Cook <keescook@chromium.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: linux-hardening@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Keith Packard <keithpac@amazon.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-staging@lists.linux.dev, linux-block@vger.kernel.org,
 linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH 54/64] ipv6: Use struct_group() to zero rt6_info
Message-ID: <202107310801.D50070F@keescook>
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-55-keescook@chromium.org>
 <20210729115850.7f913c73@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210729115850.7f913c73@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
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

On Thu, Jul 29, 2021 at 11:58:50AM -0700, Jakub Kicinski wrote:
> On Tue, 27 Jul 2021 13:58:45 -0700 Kees Cook wrote:
> > In preparation for FORTIFY_SOURCE performing compile-time and run-time
> > field bounds checking for memset(), avoid intentionally writing across
> > neighboring fields.
> > 
> > Add struct_group() to mark region of struct rt6_info that should be
> > initialized to zero.
> 
> memset_after() ?

Oh, hah. Yes. I will adjust for v2.

-- 
Kees Cook
