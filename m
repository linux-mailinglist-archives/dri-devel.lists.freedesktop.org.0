Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAB7418B39
	for <lists+dri-devel@lfdr.de>; Sun, 26 Sep 2021 23:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FA6F6E593;
	Sun, 26 Sep 2021 21:25:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA4D6E593
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 21:25:29 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id f133so19308007yba.11
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 14:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u90CRQryuo5qOzEPD2UARXOpIxVXCwqfX9T3EpxFXEY=;
 b=dLdd4Qma6HovI+P1dWmrUmAoYhhLxI3a5fHEzT9CBdS4dCjvyBpgpSsWbZjatGRjDl
 /qdfNMUQxJqK0MD7lyjp3bsxU98Ai/xqVZxadWJn2ZUzXjNUHd3q9tLeOusqIykyVYtc
 +VUDVMaRS+NNaWuRee7hMnI2btcYhTBhutKnpXMbHlhEbB6U9a35IeiQSaDMYZsUOlhN
 UUgXqIhhyYDnm3qEGNjRU+iNFLltQ+kkfa0K0YaFYWfSn9spQp7GgeFqGpculh8Uv36G
 JMT0BrF7qehHXEjDCggp6J80N18oe/R63fhXxyGPDbegpscf68H9Va2Ef2zIsA9PNLjs
 oxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u90CRQryuo5qOzEPD2UARXOpIxVXCwqfX9T3EpxFXEY=;
 b=7JqgxngHY7N9VQVG6Wz/5QuUq6FjH+mZwVyZg8zyGc4OuIAmn+D4+FItrcaDJqM7ES
 5D+H+TAumTtTnrdA4AjBG1VmDfpAYfKONmb2VFs6yS5ouw+yviiF5VjrQTtIgnzXcVyP
 4Y3eQcr61PyR6wYOrbfcx+7Il7ZPyRlwCJ3kn7BzRKTBriamR3KnRT7b5Z7ZTfbuErvb
 gTnPGavDaGiN8pSooJbWMnvnl5QZBx8Uxpc8AOrnNLISpywnri7Y3aJrQy362yYB0MSW
 /Rhb8QL191xwFSl50CkSvPqPlyg5d9KJ5hjuBJW9iEuBJY+2tZyJ8EEGUM2kuVBZkIaf
 9dSA==
X-Gm-Message-State: AOAM532ZvXJDpVc5j+fBNWHYqRDJsU3MrLEzc8vrjjWzbr5y/zxFp3xi
 iOFzTIPGdC5Y54BAcAAGorloPrLrSMM3p5iq/dI=
X-Google-Smtp-Source: ABdhPJxoc98jcZdFBXqrdeOonwNyi+31ywmkeMQwNNCb6LjxQ8yDeoDAVI0gHgGGUOPKO2fCsdhTtavDX40PzfyJ+/o=
X-Received: by 2002:a25:2142:: with SMTP id h63mr26275988ybh.70.1632691528815; 
 Sun, 26 Sep 2021 14:25:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210924135530.1036564-1-maxime@cerno.tech>
 <20210924135530.1036564-2-maxime@cerno.tech>
In-Reply-To: <20210924135530.1036564-2-maxime@cerno.tech>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Sun, 26 Sep 2021 22:24:53 +0100
Message-ID: <CADVatmNKZGoLte9OJwRRurgWCWLVP1RDS9aoS_H1GkRa00xDig@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/vc4: hdmi: Check the device state in prepare()
To: Maxime Ripard <maxime@cerno.tech>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, 
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
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

On Fri, Sep 24, 2021 at 2:55 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Even though we already check that the encoder->crtc pointer is there
> during in startup(), which is part of the open() path in ASoC, nothing
> guarantees that our encoder state won't change between the time when we
> open the device and the time we prepare it.
>
> Move the sanity checks we do in startup() to a helper and call it from
> prepare().
>
> Fixes: 91e99e113929 ("drm/vc4: hdmi: Register HDMI codec")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Tested-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>


-- 
Regards
Sudip
