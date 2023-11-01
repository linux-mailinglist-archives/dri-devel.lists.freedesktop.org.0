Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3FC7DDB3D
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 03:58:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4F510E61D;
	Wed,  1 Nov 2023 02:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A0210E61D
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 02:58:30 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5431614d90eso5041853a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 19:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698807509; x=1699412309; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=O7ndj6SqKETbJE3D9n4tccE74TpgGH/obD/rndz78Ng=;
 b=Vg/DK82EF9kDf/A729khBnVuO6dGPKPrWQLi4HMd4C+Zo+7dLcOESYVq4bbI839Tul
 g6a753ERRALQd7FDHwbYPem4aO5BJ/N1t40Lq7VYwXAIovN9AI/LkaviTZw1YEOV4Y2e
 sEb/oVzcYsHYEyNoHoGQNFqw7bOZR2AhEyB+x8FVYIHxo8q3IFxbPDptIWjx8I5jDoei
 xvwUsoEtH80TP8xwrNUKiYpyiXrq4kBtuehrJVXXauGT1rhWCcnq5rwQgNxPg9g/Jw+k
 BtyabcoJ6vCdQpt5mWfclUpxPFLBqRpoBvXFUiRuIpM8KpFa35bWw4W1sWhcjOTtqhLE
 g3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698807509; x=1699412309;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O7ndj6SqKETbJE3D9n4tccE74TpgGH/obD/rndz78Ng=;
 b=A4lrMTucVOsAvQ34RwjxHPHD0LoBnTxV1gPPR2H4hrHaRNufkPmygKddJflsyOHs1L
 4wP1ouFIhnsi7MM4xNgjTxKYLfCT2QFuLvJBTQUcluNVZXRdFsaHO72DRyyMWbc7sFzs
 AkcQrA2dl8xjx1G1FsYNqljulghrqFtlfOg2WfBO3kDzpKUz3NWXZRGME81LxZVpzS10
 uB+7BsDdtOEcwvyYfHpi3vEOIehvtv2Oq77jmue/k5rUQ3+2RqeBNEoGojV0+oMr75jQ
 l9n5eR6obcbM2LVd5x/RixjvputDX38XbbTrotYGA0YJ0rFTxke4mrypUfes1KbKVJM9
 w3oQ==
X-Gm-Message-State: AOJu0YxRYHNyuydfr0es54MVL4T4JcUon/iK1v0ja2v6NzzUXCS5WhS6
 T/eR3fC6NHQk1lrgYdXZAJgtzY/EUNeH/Fi4svw=
X-Google-Smtp-Source: AGHT+IGYp40IUhMfWuWAjfL1+eToP/gK5IWgfdPn7PPO39mqPgiQAS9vh5oUjmqXn97/eY/Ydlftk0TBxe1k5PT+NQ8=
X-Received: by 2002:a17:907:9496:b0:9c6:6f65:def1 with SMTP id
 dm22-20020a170907949600b009c66f65def1mr818507ejc.35.1698807508815; Tue, 31
 Oct 2023 19:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230322085847.3385930-1-zhouzongmin@kylinos.cn>
In-Reply-To: <20230322085847.3385930-1-zhouzongmin@kylinos.cn>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 1 Nov 2023 12:58:17 +1000
Message-ID: <CAPM=9ty9h1_XS47tbFHVppnWQJkGntQwv0Zc0YUZmAQODh5MGA@mail.gmail.com>
Subject: Re: [PATCH] drm/qxl: prevent memory leak
To: Zongmin Zhou <zhouzongmin@kylinos.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Maxime Ripard <mripard@kernel.org>
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
Cc: airlied@redhat.com, kraxel@redhat.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 22 Mar 2023 at 19:04, Zongmin Zhou <zhouzongmin@kylinos.cn> wrote:
>
> The allocated memory for qdev->dumb_heads should be released
> in qxl_destroy_monitors_object before qxl suspend.
> otherwise,qxl_create_monitors_object will be called to
> reallocate memory for qdev->dumb_heads after qxl resume,
> it will cause memory leak.
>
> Signed-off-by: Zongmin Zhou<zhouzongmin@kylinos.cn>

Sorry for nobody picking up on this, qxl isn't really well staffed,

Reviewed-by: Dave Airlie <airlied@redhat.com>

Could one of the misc maintainers pick this up?

Dave.
