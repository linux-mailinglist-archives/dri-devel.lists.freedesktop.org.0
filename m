Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D877590F31F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 17:52:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E51110ED14;
	Wed, 19 Jun 2024 15:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="b94z7dI3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA10810ED14
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 15:52:37 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-52bc29c79fdso8917146e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 08:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1718812355; x=1719417155;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=B8s71NdX52Gwd8z+763rRphKSP2eeZm9/nzW3853+Qw=;
 b=b94z7dI32dyNGBfD2eibOSboWkeYynttTxtIob8YxYuDE4u1IjYgmKRSSLcLw5b74o
 Z2gkdl2DXsh7ofWNqm8YMCDIhyldNYe9sXcp0ETwz73yZnJM6jXTX+Prx8BOEjGccJ+1
 kiq1ZFmOHgrV/1ekgij3iOxqAGq6eNqB46rGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718812355; x=1719417155;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B8s71NdX52Gwd8z+763rRphKSP2eeZm9/nzW3853+Qw=;
 b=KI3rIxNWfGpQ7fDW9BGFpfc8JvLl0qRYg+tKkF/cI5ED0mfnYY9MlV/4x3cgF0kHoQ
 0RhllfcD/e0jDAnXPBG5mJfjDXUh4Xq/pxQeOVPOQZv94BHoSLhzGZbUArhjPknj325U
 TIGaCzeJn3sNmX3v88RZAy02TFlvNO74IFt26anRML+AtVjmDCA1c83x1FZ6MRdbwva7
 tZGBG4hvExVLScXVfBercZx5L2kH0PqPz1uUwNXgIIwkD7/JKp9uBnmUXekf6m5K1scA
 WOaUMC5UKUFHCdl63gqCCjKgNYG47h3jhCcaQ6g9e8GhDRY9tTMEgXX7Hg9S7Fziu+zd
 J52g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2p3UqWyo0oMtDhR3cIuOAzE7LsKS9y3/wlvu7a4GfacWGOWGKUlZn1l/BwojwaBfmJmCLpdhHrXsIeAD6w5OJOgXiGQPVwJ/YL7rUFIJE
X-Gm-Message-State: AOJu0Yw47wsQKp8ijb02Jek2kmwi3YR+aoRJr22hs5XNmjgk4O9tB48D
 emdIPI0R9CiP13EgZ8yIZEBe5AU34GXcP1Xg7TlpREodKVCHzkwHy383NEFaI/koXDx8cSrFndC
 n9tGT6Q==
X-Google-Smtp-Source: AGHT+IFVIjRFUhUtP7K5W69yAC0lDm4EqOhQ+ff84Jry2sUlHq+o6xb1ldHAvxVzm8DdFErM3wrA7A==
X-Received: by 2002:a19:f010:0:b0:52c:9055:b257 with SMTP id
 2adb3069b0e04-52ccaa52515mr2005955e87.44.1718812355436; 
 Wed, 19 Jun 2024 08:52:35 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca287ae9asm1801241e87.211.2024.06.19.08.52.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 08:52:34 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-52c9034860dso8520750e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 08:52:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW06x+iExnjl5aqq00T2wEPtAtOAnBOhQwAOlrc+FXSdl/87fp2qR5K980pOYLbNvEFAAxu4sKc3obxQtb+KjtFVM2EW+2Zvx/X4q5GcBJj
X-Received: by 2002:ac2:5466:0:b0:52c:8075:4f3 with SMTP id
 2adb3069b0e04-52ccaa36996mr1970072e87.36.1718812354107; Wed, 19 Jun 2024
 08:52:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wjQv_CSPzhjOMoOjGO3FmuHe5hzm6Ds69zZSFPa4PeuCA@mail.gmail.com>
 <ZmrTZozoi0t/tuva@duo.ucw.cz>
 <CAHk-=wjqHL7KjOWYBVKFewcKPWL7CJxddWfJnvL3AfOqfR8vMg@mail.gmail.com>
 <ZmwHGviv/6J6FQLf@duo.ucw.cz>
 <CAHk-=wigB-wVK+4=NuYJxoKLnoUXB52J5WU2hpKj2de6vGuY7g@mail.gmail.com>
 <CAHk-=wjcdUUip96PnfC+iRjAwPHn3XKsgcohk1ad5VcckCFVKA@mail.gmail.com>
 <ZnABbKrIzmmEoFEV@duo.ucw.cz> <ZnK2bmDFuwX8E5rY@duo.ucw.cz>
In-Reply-To: <ZnK2bmDFuwX8E5rY@duo.ucw.cz>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 19 Jun 2024 08:52:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgnwBE=n_K9q7x6R-bzQ-vRiLeYUciWTJtMokLC_1a7gw@mail.gmail.com>
Message-ID: <CAHk-=wgnwBE=n_K9q7x6R-bzQ-vRiLeYUciWTJtMokLC_1a7gw@mail.gmail.com>
Subject: Re: Linux 6.10-rc1
To: Pavel Machek <pavel@ucw.cz>
Cc: Dave Airlie <airlied@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Rafael Wysocki <rafael@kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, 
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

On Wed, 19 Jun 2024 at 03:44, Pavel Machek <pavel@ucw.cz> wrote:
>
> Ok, so machine is ready to be thrown out of window, again. Trying to
> play 29C3 video should not make machine completely unusable ... as in
> keyboard looses keystrokes in terminal.

Well, that at least sounds like you can bisect it with a very clear test-case?

Even if you don't bisect all the way, just doing a handful of
bisections tends to narrow things down enough that we can at least
guess at what general kind of area it is...

                Linus
