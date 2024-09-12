Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2C7976B57
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 15:57:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E853F10EBA1;
	Thu, 12 Sep 2024 13:57:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Q6Ak4qbD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10BB610EBA1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 13:57:55 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-53659c8d688so737354e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 06:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726149473; x=1726754273; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BquzwUboHzXTtdjd0oA0kjxZhS1hFAwbnuUx4HBJ0HA=;
 b=Q6Ak4qbDpqGo11BYgJ0luQSpv5LyrnvPtVkNXLZv0O6Lpa7ago4d0gIBWcBZ7mAqcl
 VRON1mBmchNqNSdGj+ytySd2Y3m0Hta56WsbZFpZlMoxUPT7NX0QTBs2Ra0YiQGDJFIz
 Qs0TyfVJaZVXecLQ2BEYEz8te9ZHP9GJgpzDOtCcvbTGHdtY7S8vJB9v46BGsKsPk9jz
 BH2XjJuFWfU2e3i5NuHf5K8fv5y+TPc3HVYxtn/WS/Jm7o+Jz2fZy0Wg8mBk2eRYxRpk
 MFYWlXwa+IhLXRX+VTTtefrb4Kva6IdOcKRWtguSj13nAasP5TUTx9Plfu/jCJsRcFPS
 MSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726149473; x=1726754273;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BquzwUboHzXTtdjd0oA0kjxZhS1hFAwbnuUx4HBJ0HA=;
 b=kh1ZlkmbMVOrgvZQpU3dnrIHa8cuuPxHAuZIH03pZ2+tjjFn09iR8PRlg9I5A9BVpI
 ViXFFcxIYmidyja/jHXUxVTXgLIjPkVElKc4slPmFlu3Rplh243cbuD233z7/V20NzMs
 4yMFLeGC216OltArClzlRr4UIk8hISLPosFs/3CgbTzN1WtPl0eMUNdgm0V6PIgqohoP
 CZRoCb9SGwFkG+kzFKsMq9HRdg/ToveVbaiyhOkrZmb+83mASGErCoKBiMmG6ET9sIEX
 XUWnj5KBlh2bP6sSsrquCmS+JCsywhz0T56i1p7L77GgoCJGx5nL/K1779SD6v2oz49t
 97SA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXOySaZTZEwoJy8ABNvq/qKxMmAV/1fTtfWb0KbcspaG+w4jtJHGzZ5Hw+WNU8nuW/a6aNHTMNzdg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqAi2/WchK67V8f5JvODAP/aidJUu9Zut70xOZPF0NImPAF0bB
 EOHUjw7HP/O4ZwEiJ/4xQJO+0G2ictUiEbOMO6nEMeJ9effuIEfd5hKgFvQ+aj4=
X-Google-Smtp-Source: AGHT+IHHjX/elZwmUhRzKmMZTPFW8UNakvXLNck40dZybOYY8Xg9afuQtW40j5sB4fM0Jm7lNQ5O5A==
X-Received: by 2002:a05:6512:3d93:b0:533:32cf:6420 with SMTP id
 2adb3069b0e04-53679075a23mr986727e87.8.1726149472778; 
 Thu, 12 Sep 2024 06:57:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5365f868cc4sm1923399e87.33.2024.09.12.06.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 06:57:52 -0700 (PDT)
Date: Thu, 12 Sep 2024 16:57:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, 
 Maxime Ripard <mripard@kernel.org>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, 
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the drm-misc-fixes tree
Message-ID: <porwsaq63pizqyzq7agmt72lmowramhp6z5yqgu4fzs5n624ge@wyvmaahjmx7b>
References: <20240904163018.214efaa7@canb.auug.org.au>
 <20240911180741.45311006@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911180741.45311006@canb.auug.org.au>
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

On Wed, Sep 11, 2024 at 06:07:41PM GMT, Stephen Rothwell wrote:
> Hi all,
> 
> On Wed, 4 Sep 2024 16:30:18 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the drm-misc-fixes tree, today's linux-next build (htmldocs)
> > produced this warning:
> > 
> > Error: Cannot open file drivers/gpu/drm/drm_bridge_connector.c
> > 
> > Introduced by commit
> > 
> >   9da7ec9b19d8 ("drm/bridge-connector: move to DRM_DISPLAY_HELPER module")
> 
> That commit is now in Linus' tree, but I am still getting the warning.

Pushed out the fix to the drm-misc-fixes branch.

-- 
With best wishes
Dmitry
