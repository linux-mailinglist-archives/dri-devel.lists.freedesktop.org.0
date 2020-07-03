Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8FD213DC9
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 18:57:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC296EB1C;
	Fri,  3 Jul 2020 16:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE236EB1C
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 16:57:16 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id d15so28366629edm.10
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 09:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x3X0doA9YeDu5ZWYJ9nb7HJQyN8SZY+2XzDSqfCc7Qc=;
 b=Fhc9BF/KonaCZwWn1m5FILkSi/kshHlOiz5hmj/XKZ/fl0UOTrj63ffihejuiK2T9Z
 NT/qfTYcfwNL2UsuEEiGCpx7IK2HLiaqqd9mxdqm0tL94zpTUatHd7dUe1c5eKw7rcLW
 1swgG6yJnb9bdyN7mJu5l4j3FX6uHwc0R3o1/IEaRFii+Lg/9rIRZK3Z7itaFd66GMtF
 m4PJuj7x0/h9E2Fbpvr0EyZoCW3qlsZJhfReYTx39nGL9umrEPxqRY2BcZwJQtWYlNYx
 F0Yoyp4bRsEoF51Jwsc2MEUtQutm+xAlYXm2WnY4ML69fgkcmEpljzrBjeYyhW9buiKN
 zdtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x3X0doA9YeDu5ZWYJ9nb7HJQyN8SZY+2XzDSqfCc7Qc=;
 b=ttHtjCUeJjYsmEEY4KGYrjLG+Mjmxsscrcr80+MB0nXtpcd8yCTypRXFtJOtnWlGer
 WZmrc1qXYAolUW5cVEUY/rifIqs6Jbj81K6sQGjQ9BWkyEQldMimGKviUOe/Mtw9k3Nc
 YU11WzGzfP8g58rGp6sIVCMkbZJVl/vO1ONChS2+FXscIshQ9BJ45QeFBiLBcU0kI28M
 JMLdJisjICAT4L4IQ5TxIHtzIe/+2xN+hf2LIjZAQyf/fbxtvh47s1F1UPhyWa5eEbYw
 VQEe6hqQsw98CWQ6P64xg8o8c76NbtWONVk8W7oWHXipEQlaIV85jTCiw2Bxz8asRHzV
 Ei5w==
X-Gm-Message-State: AOAM531zthrczSKuwM5S8CBuxSImd+GghyiDqHDRLr8XaEWo4hlExYlK
 1ed225amVqfTW1NQMw3LowZuTnNu+0SJilOZgylO4w==
X-Google-Smtp-Source: ABdhPJw0SDje2wcPHp99IE8s4SaMuml5DvxMEgyCkEM97p2DRZ5wMe2UjgZvcfp3wGddm4XE52Q9+PCg4gVPcBDegKI=
X-Received: by 2002:a50:fe16:: with SMTP id f22mr35058745edt.315.1593795434895; 
 Fri, 03 Jul 2020 09:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200703135713.985810-1-maxime@cerno.tech>
In-Reply-To: <20200703135713.985810-1-maxime@cerno.tech>
From: Eric Anholt <eric@anholt.net>
Date: Fri, 3 Jul 2020 09:57:04 -0700
Message-ID: <CADaigPUo=Y6Z6N3jMF9r+xgxQ2Ec_dYUp3vchXyfVqnApMtJkQ@mail.gmail.com>
Subject: Re: [PATCH] drm/vc4: Convert register accessors to FIELD_*
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 3, 2020 at 6:57 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> The VC4_SET_FIELD and VC4_GET_FIELD are reimplementing most of the logic
> already defined in FIELD_SET and FIELD_GET. Let's convert the vc4 macros to
> use the FIELD_* macros.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Eric Anholt <eric@anholt.net>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
