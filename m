Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B33B551762
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 13:26:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3787910E078;
	Mon, 20 Jun 2022 11:26:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F142610E078;
 Mon, 20 Jun 2022 11:26:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 83385B81092;
 Mon, 20 Jun 2022 11:26:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01348C3411C;
 Mon, 20 Jun 2022 11:26:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="YUu9wZ8p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1655724381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TOVLL150QNd38AYGM7SoGBB9k185tGI5xz/TT2kjB+A=;
 b=YUu9wZ8pg15f/UkqJvpukvPSVmLQlvNvZsk8NYCvlcSzBumoSLDPqsMmNYD5iUiF0OIG80
 biKurEEWUq2czo3TPJT57eYUPGg0jW6gFmWnexBKWj7O1jeGpcnhUQQMy1D0VxzjLw3eHJ
 A2a3PjyiJIoYzKCkgzwBZG0ukIJ1h/k=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d0b4f638
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Mon, 20 Jun 2022 11:26:21 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id r3so18411850ybr.6;
 Mon, 20 Jun 2022 04:26:21 -0700 (PDT)
X-Gm-Message-State: AJIora/5r565I4EkalpwZDPcHCUOzKjZShwZslufc6hsvq9hmROuBiAQ
 /v4aaSebaAL/tXjHopX3gE2Fy9sSDs6sJA+7jlQ=
X-Google-Smtp-Source: AGRyM1u+MFU+mkGZfWohms1MUY8JXi39Tbqumt7dBEF5zME7BQ86Ng4DPlZmBric3xPKnQjy1koFBbB3EDp+K9yVSqw=
X-Received: by 2002:a25:8d92:0:b0:656:a73e:a7f with SMTP id
 o18-20020a258d92000000b00656a73e0a7fmr23772353ybl.382.1655724380249; Mon, 20
 Jun 2022 04:26:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220613102241.9236-1-Jason@zx2c4.com>
In-Reply-To: <20220613102241.9236-1-Jason@zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 20 Jun 2022 13:26:09 +0200
X-Gmail-Original-Message-ID: <CAHmME9q0QbuUR-11gkFG9PQpHrNfZk2b-Ja+tDnqbV13JCJ7+g@mail.gmail.com>
Message-ID: <CAHmME9q0QbuUR-11gkFG9PQpHrNfZk2b-Ja+tDnqbV13JCJ7+g@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/display: Re-add check for low voltage sku for
 max dp source rate
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx@lists.freedesktop.org
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Animesh Manna <animesh.manna@intel.com>,
 Jani Saarinen <jani.saarinen@intel.com>, Uma Shankar <uma.shankar@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

Do you plan to merge this revert?

Thanks,
Jason
