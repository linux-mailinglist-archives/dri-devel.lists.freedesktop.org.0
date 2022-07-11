Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12597570A42
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 21:01:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D4818FFC2;
	Mon, 11 Jul 2022 19:01:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BDB790831
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 19:01:34 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id a5so8205522wrx.12
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 12:01:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GCvXsFqmGcG182YLyR0NaWgqK0wvYaWydrJj/u6gK+k=;
 b=trV6SpcZC7/OWx664S7NuNX/8IlPdXBzlNnJD9H/HhOwhADpn1jUaCv7DUmyRV9soo
 xNzp/ZoaaKaUab9yXJiuT52gRHFPKjP9zX4+lMaEXc/wDfj8pvYsEABw3SEX8f3WhFve
 SXhY0ygQMdbVHKISIk6IkOw/ac53TMI40cseZeKa+AURaM0qgQWC0b+v/njm18SVsQ0G
 KM8CRwpuGAIHe8bN1QBPyz7q53M77CyIoyMx1c9Y0C1UhUkpIg72zTH6ICi2QXIU4ipl
 jY9znPXVRu0kSamGRgjiJORDXh9tn6bOeJRBhbsoskGD1fyYYMtpm6XVPgkJ724ykC4s
 ANEQ==
X-Gm-Message-State: AJIora+WvgHlum4nCbEyesqtsGvN6GkpFg7KVCUJrkKwtRRmAr0sMtV/
 62Js6ZlfdI+neUVDxrc1D9U=
X-Google-Smtp-Source: AGRyM1scmNY4S0Xl2+XqeMETn5g9lEyU8dbM9QTy11CtbUUt2Tl01RBApZpORr/SubhUuaWXk1Ujcw==
X-Received: by 2002:adf:979b:0:b0:21d:868a:7f3b with SMTP id
 s27-20020adf979b000000b0021d868a7f3bmr17948046wrb.451.1657566092969; 
 Mon, 11 Jul 2022 12:01:32 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id
 j5-20020adff545000000b0021d864d4461sm6364819wrp.83.2022.07.11.12.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 12:01:32 -0700 (PDT)
Date: Mon, 11 Jul 2022 19:01:20 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Saurabh Sengar <ssengar@linux.microsoft.com>
Subject: Re: [PATCH v2] drm/hyperv : Removing the restruction of VRAM
 allocation with PCI bar size
Message-ID: <20220711190120.jbbbwmp5rhlopuoh@liuwe-devbox-debian-v2>
References: <1653143019-20032-1-git-send-email-ssengar@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1653143019-20032-1-git-send-email-ssengar@linux.microsoft.com>
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
Cc: linux-hyperv@vger.kernel.org, airlied@linux.ie, haiyangz@microsoft.com,
 ssengar@microsoft.com, decui@microsoft.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, drawat.floss@gmail.com,
 Wei Liu <wei.liu@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, May 21, 2022 at 07:23:39AM -0700, Saurabh Sengar wrote:
> There were two different approaches getting used in this driver to
> allocate vram:
> 	1. VRAM allocation from PCI region for Gen1
> 	2. VRAM alloaction from MMIO region for Gen2
> First approach limilts the vram to PCI BAR size, which is 64 MB in most
> legacy systems. This limits the maximum resolution to be restricted to
> 64 MB size, and with recent conclusion on fbdev issue its concluded to have
> similar allocation strategy for both Gen1 and Gen2. This patch unifies
> the Gen1 and Gen2 vram allocation strategy.
> 
> Signed-off-by: Saurabh Sengar <ssengar@linux.microsoft.com>
> Reviewed-by: Deepak Rawat <drawat.floss@gmail.com>

Applied to hyperv-next. Thanks.
