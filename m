Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E495164990
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 17:12:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC626E3EE;
	Wed, 19 Feb 2020 16:12:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770D16E3EE
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 16:12:22 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id q23so969586ljm.4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 08:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2SO0d+kJDPLx0bmH6ygcKGysX2UmEbvjCjCNiII+2tM=;
 b=DIk2Rrh/n852Ww2RFUiafMhEombwe5HzSh2G9FZYFac+zdbcyWTJFe6oJq9lTVoaUM
 rZQVDEBNhXFIo2iibc5yqdmNGYXONGSCnJS9yR0FSO5sCa0LBg8PDx9DNUDOUw79z4rV
 FcoRoRLV7HwzX6GUH+eB9RKNQHNTQha6Lt+elOBjAirae5W24EPra9JmMk30hFjvABM9
 yNS3f3idAhlHKcK/1Xnu+Ebmgon2uF0836VwjHMp0U+Fav6OsbtLlruEaIL9OcImq2k8
 NC0K/hWI8TD/6Ws599ussZ6dtBAbvNsBa6aT7afS7Mblkv5XOruYOw120snjIhrwa8GC
 CGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2SO0d+kJDPLx0bmH6ygcKGysX2UmEbvjCjCNiII+2tM=;
 b=k6+1xhbuPJ3QksRtRKXubBn/4MYE3pm3dNXMaEBYLkDZ6Y8/GJzujpCgtUJxpcQXRh
 4JKtkQkSFxMhZZHWkOLJ6jMe4Ja79pUFnPjzJKLi6UKSAG62xCN7xMRJzZcmFsrR89nR
 TBBaXzhXM3nx40vBl0z2sk6BccdehTFdkSRIOmpxe/83/LaDBBlfzLCiE2It2OHN9QHz
 qfnpfl6jKvHVxlCQRRLpNBWhbJ1PYTT8XOsRYPP8zBpZPm7aLliMi1OWo4DzYSWr59kO
 TcMKKqQIof8JIw0jbQHhvgkXVTTNp/Ik5M0k7suw5IJD5teTecJewrD9bUOhtrwrPoO3
 inEw==
X-Gm-Message-State: APjAAAU0PUHtCJUUDQxs/kSIkXpPBBYbN+Aup+aVnrQojkm8RXhWu9CD
 frzgSW280WOOPENMUgoAHXq++hEgTEpjBIyWf5bZdQ==
X-Google-Smtp-Source: APXvYqzPR4nMtjdWAS65f0wagI3EkJS5HZzeTooAJyqaL1AqLMjUbKRDUwxLEio9xoAUwxum/TWjbeIyvZedIAFKqJg=
X-Received: by 2002:a05:651c:1bb:: with SMTP id
 c27mr16953518ljn.277.1582128740948; 
 Wed, 19 Feb 2020 08:12:20 -0800 (PST)
MIME-Version: 1.0
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-14-daniel.vetter@ffwll.ch>
In-Reply-To: <20200219102122.1607365-14-daniel.vetter@ffwll.ch>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Feb 2020 17:12:09 +0100
Message-ID: <CACRpkdYcz+hBVPBByE7LcAAwjqYHo6dgoQRh2xmBJqkXu5nDzg@mail.gmail.com>
Subject: Re: [PATCH 13/52] drm/mcde: Use drmm_add_final_kfree
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 19, 2020 at 11:21 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> With this we can drop the final kfree from the release function.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
