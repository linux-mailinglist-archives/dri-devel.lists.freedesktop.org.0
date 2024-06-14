Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5ABB9090F1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 19:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABF1E10EDE8;
	Fri, 14 Jun 2024 17:05:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="aEOwAX/6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D416D10EDF6
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 17:05:01 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a6e43dad8ecso438271466b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 10:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1718384699; x=1718989499;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qzYNeCAQeD4+6NsX8RjP39JkkbQ+pGWaSkdyTn1CwzA=;
 b=aEOwAX/6t9Ihf6lsqRUZ7c4eiylkIkPDG5J285FagvOvfMX34fl8CGjlkHdU81hyhf
 QoQcsQZGTISwjeKlPPZzWKtYD9MWeZQz0tGzByPgaQGAGdwlCYrnR08+gLSKs7aUjtCn
 sd/woSo3nXCG4SKslQtN9OLdl4qU7M4Qf/b5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718384699; x=1718989499;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qzYNeCAQeD4+6NsX8RjP39JkkbQ+pGWaSkdyTn1CwzA=;
 b=JY4U5sUWbmxOCNcu4E9kdTDCKjG7Iu0J9lLbhewBxVdgM2uxLsCRQO39jgMFAY8M5a
 I9AXWyZL1ZYhNPCuLXil1Vu7VA2a3qjVoPzuWqo/qZPgu+/ROQcC8mlk0hh0cCXVSeil
 75TwZNWWW4gbxdscQpnroKGHs/hX2rpTa94IeTILdLCkA1+7Se3DPo7dSAJLEMo/vQgF
 BoJ+jDEREzc1ZOClgC8ZcVmpNKEIrpXwU1RNBAtusprCwltjDl19OAg01P5bqTGN1Pxr
 OtOj8zmzof5U0uKVeU2zKFQw8ECohInz+gL9l3dB+djwrBLNbLqhTZVHgLvKakGyPity
 sA8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFJUWu8JY8id8fy0vXfCIjK2ZByPjJzU+YMOUXlOp0x9rdDa9jU/bu3zdXk6FFr1OLTDpl+I0U5HYZjqfWqTYmGd1yceWfAPL/eNmmlW3K
X-Gm-Message-State: AOJu0YxAvCYF6BOX3ivrhGvya23ppqRXR2XvHmN8Dlcp4iO0k2iwg0Ac
 maDEQXZukQecqB29A+7OjkRUq4BR1o4CqyBRMPUfeZAGgQ9aXhcpXasBt1/WGcVXEAD/in7cv6I
 GaehD7A==
X-Google-Smtp-Source: AGHT+IFjNftp72zERaDItw7k6pooAPb7w8XA0yYL54wtdjerDBJLDWwZ3F25tzblt+Bnyx0HntOoIA==
X-Received: by 2002:a17:906:c0c5:b0:a6e:f53c:8da0 with SMTP id
 a640c23a62f3a-a6f6080c781mr224176366b.8.1718384699419; 
 Fri, 14 Jun 2024 10:04:59 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com.
 [209.85.208.42]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56fa674bsm202866266b.210.2024.06.14.10.04.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jun 2024 10:04:58 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-57cbc66a0a6so2293412a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 10:04:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVxtXvAQ0MNwIuN/OO8v0rrG0QsaXuhy04ZrB3s0H7T/PnOnJs5yuGkeFlEhFxFoMIClTBoOP/Xpzi6aJxsyqy6ZDp2T2s40tOuX0QNOrYN
X-Received: by 2002:a05:6402:174b:b0:57c:bec1:ff4b with SMTP id
 4fb4d7f45d1cf-57cbec1ffeamr2002152a12.10.1718384698458; Fri, 14 Jun 2024
 10:04:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wjQv_CSPzhjOMoOjGO3FmuHe5hzm6Ds69zZSFPa4PeuCA@mail.gmail.com>
 <ZmrTZozoi0t/tuva@duo.ucw.cz>
 <CAHk-=wjqHL7KjOWYBVKFewcKPWL7CJxddWfJnvL3AfOqfR8vMg@mail.gmail.com>
 <ZmwHGviv/6J6FQLf@duo.ucw.cz>
 <CAHk-=wigB-wVK+4=NuYJxoKLnoUXB52J5WU2hpKj2de6vGuY7g@mail.gmail.com>
In-Reply-To: <CAHk-=wigB-wVK+4=NuYJxoKLnoUXB52J5WU2hpKj2de6vGuY7g@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 14 Jun 2024 10:04:41 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjcdUUip96PnfC+iRjAwPHn3XKsgcohk1ad5VcckCFVKA@mail.gmail.com>
Message-ID: <CAHk-=wjcdUUip96PnfC+iRjAwPHn3XKsgcohk1ad5VcckCFVKA@mail.gmail.com>
Subject: Re: Linux 6.10-rc1
To: Pavel Machek <pavel@ucw.cz>, Dave Airlie <airlied@gmail.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Rafael Wysocki <rafael@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
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

On Fri, 14 Jun 2024 at 09:21, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Let's bring in the actual gpu people.. Dave/Jani/others - does any of
> this sound familiar? Pavel says things have gotten much slower in
> 6.10: "something was very wrong with the performance, likely to do
> with graphics"

Actually, maybe it's not graphics at all. Rafael just sent me a pull
request that fixes a "turbo is disabled at boot, but magically enabled
at runtime by firmware" issue.

The 6.10-rc1 kernel would notice that turbo was disabled, and stopped
noticing that it magically got re-enabled.

Pavel, that was with a very different laptop, but who knows... That
would match the "laptop is much slower" thing.

So current -git might be worth checking.

                Linus
