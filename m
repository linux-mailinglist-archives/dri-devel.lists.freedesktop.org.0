Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC231FCF3F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 16:15:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD58F6E0D8;
	Wed, 17 Jun 2020 14:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E5406E0D8
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 14:15:52 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id p20so2456481ejd.13
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 07:15:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EdNnFmNidXG+iw545o8LEdhsC19KXQ8OYf5/ou+pAjg=;
 b=TdZNMwgTvS+hEyNMI8CDEmx2SMAhc8TEiw8urh0xpgB3+OyPgzJq4fgqRCFDtgbbRx
 DPox43BTAYjRdEPfKiBPP+Y7JfXKbgpJd/zdrVZ00MrGhF4nvcBluDX/fDcQELDi+cAx
 2vSQ8lY42ZaggYtaDX3XCFXHDE2BARDRm41QbJoUg42hSG1bKDGe0gwef2cmpn0klwrV
 p3Sybsm/Kny2tr0UUwvtS5v981Ktcx6yUsDv7sPIih/Rd6dGdjEtuf5w74gbFFe9fS9o
 22IuSDeM6rf0eqYq1aGv1OXaV+QcBIFmxZSZrx292JizGUWCyCT83fiK7o072twG86Pw
 Ob+A==
X-Gm-Message-State: AOAM531UQ5xlGCqgPKXw2Ac99jTAI4F/0g1bz3om8I/cf7/eypWHMK0d
 jsKNLn03SDSgbPHHWpESmBw=
X-Google-Smtp-Source: ABdhPJzubahcLWtjqgPKN2JPsi4MMLpFdvi5Kw7GssTmd1JXZ4jnm/85WzhBm30soQfepQKCuRUKiQ==
X-Received: by 2002:a17:906:9254:: with SMTP id
 c20mr8079327ejx.540.1592403351074; 
 Wed, 17 Jun 2020 07:15:51 -0700 (PDT)
Received: from kozik-lap ([194.230.155.126])
 by smtp.googlemail.com with ESMTPSA id i21sm12222210edr.68.2020.06.17.07.15.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 17 Jun 2020 07:15:50 -0700 (PDT)
Date: Wed, 17 Jun 2020 16:15:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v3] drm/panfrost: Reduce the amount of logs on deferred
 probe
Message-ID: <20200617141547.GA30516@kozik-lap>
References: <20200527200544.7849-1-krzk@kernel.org>
 <20200527204334.GA15485@kevin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200527204334.GA15485@kevin>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: David Airlie <airlied@linux.ie>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 27, 2020 at 04:43:34PM -0400, Alyssa Rosenzweig wrote:
> Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> 
> On Wed, May 27, 2020 at 10:05:44PM +0200, Krzysztof Kozlowski wrote:
> > There is no point to print deferred probe (and its failures to get
> > resources) as an error.  Also there is no need to print regulator errors
> > twice.
> > 
> > In case of multiple probe tries this would pollute the dmesg.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > Reviewed-by: Steven Price <steven.price@arm.com>
> > 
> > ---
> > 
> > Changes since v2:
> > 1. Rebase
> > 2. Add Steven's review
> > 
> > Changes since v1:
> > 1. Remove second error message from calling panfrost_regulator_init()
> > ---
> >  drivers/gpu/drm/panfrost/panfrost_device.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 

Hi Rob, Tomeu and Steven,

You're listed as maintainers for panfrost. Is anyone going to pick this
up?

Maybe I sent it to wrong mailing list or forgot about anything?

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
