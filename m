Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0463E4B7A00
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 22:53:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBCCF10E565;
	Tue, 15 Feb 2022 21:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 310BA10E565
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 21:53:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 729F4B81D0A
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 21:53:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DEBEC340F2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 21:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644962001;
 bh=Vfxjv7E56iaOFRTCObvj3BvVuslFzvG2n3OckI8Aumw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ud/+h1cDLctFXinnhjFDRa48kZs/Sv+52aBGhae3CUMR1ixHIyIH5oYqHkxx9XxE9
 7YOMVJHo9ApG1yi86kyolWpX24iIZ5CKk0M7Efr0GaH2lRN09W8+tfOSi9CEEwaBgW
 F287c+HHEKXmgQjnXSbK8ljE5Zvb3vUO/A99T7aq1++sTdgtjqLlhHGYN0LX/iaxtL
 fAoLjjkmkJZnfigW7zjsYIrhhhP5rsqvqIX8tovq1acLLuab8QzCMidGE9xcUXIbHx
 aZ0wI+UffNxCzoesfDAlvnEwWezGtdxHOBYF4USCONazR2UrovVz7o9/+kA45D0g3u
 UV1O4Cw/kMenA==
Received: by mail-ed1-f45.google.com with SMTP id t21so575377edd.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 13:53:21 -0800 (PST)
X-Gm-Message-State: AOAM531Gepg65aBzDLduhesza92Eko+zzeo6xrF73bhvErfz9sjtG4nq
 8UMmdHTFdM8aasFM76YvKx5NTFpMPuBGQ+B19g==
X-Google-Smtp-Source: ABdhPJwYZKHAsuuqxukUb3ew/CZgg5aKKKTyuRP2EBIW3EIb7cJwFue/JUV1JPmJrNN+olDMIRRtpNXvf0a48ySSLUo=
X-Received: by 2002:a50:e68d:: with SMTP id z13mr993946edm.307.1644961999559; 
 Tue, 15 Feb 2022 13:53:19 -0800 (PST)
MIME-Version: 1.0
References: <20220214203132.4722-1-alyssa.rosenzweig@collabora.com>
In-Reply-To: <20220214203132.4722-1-alyssa.rosenzweig@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 15 Feb 2022 15:53:07 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKdb0_N252hR=iv3Lpi6T9+iCRBwzBQhS7UQGFNhM5k=A@mail.gmail.com>
Message-ID: <CAL_JsqKdb0_N252hR=iv3Lpi6T9+iCRBwzBQhS7UQGFNhM5k=A@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Dynamically allocate pm_domains
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 14, 2022 at 2:31 PM Alyssa Rosenzweig
<alyssa.rosenzweig@collabora.com> wrote:
>
> MT8192 requires 5 power domains. Rather than bump MAX_PM_DOMAINS and
> waste memory on every supported Panfrost chip, instead dynamically
> allocate pm_domain_devs and pm_domain_links. This adds some flexibility;
> it seems inevitable a new MediaTek device will require more than 5
> domains.
>
> On non-MediaTek devices, this saves a small amount of memory.

How much? You measured it?

It's not that simple. kmalloc has finite allocation sizes (see
/proc/slabinfo). So unless panfrost_device shrinks or grows to the
next smaller or larger size, the memory used doesn't change. And each
devm_kmalloc adds its own overhead as well.

I'd do the oneliner changing it to 5 and be done with it. That being
said, we have plenty of examples of doing this both ways, so whatever
makes people happy.

Rob
