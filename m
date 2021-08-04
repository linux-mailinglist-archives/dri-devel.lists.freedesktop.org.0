Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8263E02F0
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 16:19:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEFA36EA7D;
	Wed,  4 Aug 2021 14:19:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2CE26EA7D;
 Wed,  4 Aug 2021 14:19:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A52D160F22;
 Wed,  4 Aug 2021 14:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628086789;
 bh=UhV/SQfdLBYTc9D9nBIqPDxNpUescq5pja8sCC7bUhg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GqW+Ix8bE9Xpa1PchSe10rwy9phm1XMd4MtWpBN7X3eojLy8JN6KQp9n/43TFtwni
 80y7yvlPbt9DWFp/kScILAMs5dZoVWsxp5peA10/x5cfZa5vObdwIDWpX0jkQFvYaT
 2MgpL23FyoaDUNhgSS2nyNLYahv0fdWor9n5QSwmUSsJLUvt7JoCZyDZ33EVspregL
 jDwdyiYhAt5flGpgHfIHdpgTM1ACwW61TYHC6twk5Khz9kuXn/Gp2H4ZEQb28P8yN1
 FPN6Bs7CKtVW8/Ig8CE1Yf1LpEy2t7/uIkXgk1gg65UZJGajHvq52xvBjKFLdOLOay
 vieUvKuAW7pSw==
Received: by mail-wr1-f52.google.com with SMTP id m12so2425912wru.12;
 Wed, 04 Aug 2021 07:19:49 -0700 (PDT)
X-Gm-Message-State: AOAM532RJzvXLFVUPEin+dbxhNfM6nUr1g/OjHFLgARD5LnkXCHSCACW
 SrtoCDFn105dsRIs5uhm7Sz3+BU7PPTraNXtolU=
X-Google-Smtp-Source: ABdhPJz4webvoPA0EIBz9Nqvki0G4OjA8pvIy/LkSY3nQYdB4tbtdSxD94XNSCYZc0/wF2Fsa+T9PiEhNiWOJgXVQLE=
X-Received: by 2002:adf:e107:: with SMTP id t7mr29131713wrz.165.1628086788270; 
 Wed, 04 Aug 2021 07:19:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a0i0WP24Z0TScmPqKxmM2ovtKnmm+qZq6+Tc1ju+hma0w@mail.gmail.com>
 <20210804141049.499767-1-kherbst@redhat.com>
In-Reply-To: <20210804141049.499767-1-kherbst@redhat.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 4 Aug 2021 16:19:32 +0200
X-Gmail-Original-Message-ID: <CAK8P3a136c_L3yVn-841Sbfib9UMOf1M-pk+2SqWt0wD2zfRKQ@mail.gmail.com>
Message-ID: <CAK8P3a136c_L3yVn-841Sbfib9UMOf1M-pk+2SqWt0wD2zfRKQ@mail.gmail.com>
Subject: Re: [PATCH] depend on BACKLIGHT_CLASS_DEVICE for more devices
To: Karol Herbst <kherbst@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Lyude Paul <lyude@redhat.com>, 
 Ben Skeggs <bskeggs@redhat.com>, Randy Dunlap <rdunlap@infradead.org>, 
 Daniel Vetter <daniel@ffwll.ch>, ML nouveau <nouveau@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 4, 2021 at 4:10 PM Karol Herbst <kherbst@redhat.com> wrote:
>
> playing around a little bit with this, I think the original "select
> BACKLIGHT_CLASS_DEVICE" is fine. Atm we kind of have this weird mix of
> drivers selecting and others depending on it. We could of course convert
> everything over to depend, and break those cycling dependency issues with
> this.
>
> Anyway this change on top of my initial patch is enough to make Kconfig
> happy and has the advantage of not having to mess with the deps of nouveau
> too much.

Looks good to me. We'd probably want to make the BACKLIGHT_CLASS_DEVICE
option itself 'default FB || DRM' though, to ensure that defconfigs
keep working.

      Arnd
