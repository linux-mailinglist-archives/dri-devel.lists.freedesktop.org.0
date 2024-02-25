Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F71D862C37
	for <lists+dri-devel@lfdr.de>; Sun, 25 Feb 2024 18:14:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D898922E;
	Sun, 25 Feb 2024 17:14:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="I5+g21ZR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37FA18922E
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Feb 2024 17:14:15 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-563d56ee65cso2864177a12.2
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Feb 2024 09:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1708881254; x=1709486054;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0eZgSeXgV3xfMa5j0GZq4dgMO8aNM+WGN0zJZjS5h1g=;
 b=I5+g21ZRjZrND8SXWPXpMyNmQOzgP1RN/0AHdDQ8qqnmqzwiheBXJsRrMiQIwG8H1T
 y5tt/EJ+O0VtqTCLaalilIjUBXtblRUUKW8PM8k/nfjCpqFbkrLBQz/zJ8qvGA+3W8et
 LTqSSucyN9rS9U6SzPaa7Ris2z932L1t/wbig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708881254; x=1709486054;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0eZgSeXgV3xfMa5j0GZq4dgMO8aNM+WGN0zJZjS5h1g=;
 b=B8tyOeQDkQ+Lx8bQEYMcRDcGXMAlLjxP7BS+ofd3bFMy7LEKmgZwgQsN10NzOpt1aX
 qgBP2s/2GmXBmapD+TdAnvD3ph8+lC8/1YaVhsG9WB7Ya7tzTGfwq9wJXF40JFhf4qXM
 0J3iA9Sdbm8BCXDT42l635dYYPhIeWscmueJU3oyASEU/AGrBToLT+SCq5CRhkucrhoX
 piaFvzu0OM6u+A3i3HT+u4on9suRsb/7QUbmgEuVxSqkDQH7Oie7nvrGweN2NF9Oc/6b
 On/5eBs8aOfw4E0J5k2C5h5CaNlcXaWOVM0DDqoA4Ch3VQ7ZZzVPa+zerGBU3emCBy1s
 QUsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV00HVw7fzVJuWx91sRwdG6wtQYjz9tf1/IooET7pwUKvi/qvaxLGVdDW8cfKpB1PqBQPgAszgluACnkhsyWDhlXESiwDrfW+v8NgqMSdQF
X-Gm-Message-State: AOJu0YwNDJLXuOWDBlK5PD41FNapoNzNgWKVQMNxsdeSZ+jkRynt96o8
 OkU4CZi9nGPhNkgPFN13pP43Y4JQj3IJS394/pt/VdQAdynNoDWsR7lm4uZhVMzMNgsZjj0gnEA
 LnuIjHQ==
X-Google-Smtp-Source: AGHT+IEaDytyPPopFyYJ+sXFNAaOL0UgHGCoc0t87CP6/i4CzlOdFgw/i9kI1AznYgXN1XIZBLvPJw==
X-Received: by 2002:a17:906:36cd:b0:a3f:af82:569f with SMTP id
 b13-20020a17090636cd00b00a3faf82569fmr3264697ejc.33.1708881253877; 
 Sun, 25 Feb 2024 09:14:13 -0800 (PST)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com.
 [209.85.208.44]) by smtp.gmail.com with ESMTPSA id
 k25-20020a17090627d900b00a3d932d8fa7sm1618655ejc.183.2024.02.25.09.14.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Feb 2024 09:14:13 -0800 (PST)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-563d56ee65cso2864161a12.2
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Feb 2024 09:14:13 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU09X4BywEnkbg+/8WCqnHe9G8C+OcEMLNd8H7VZ2cJCqiNupE0Kv6fScPgyZcqCsfOewXO+SElsEx3OM/48nHKk+hfXNr9QQUlgLKeeun/
X-Received: by 2002:a17:906:4f01:b0:a43:1201:6287 with SMTP id
 t1-20020a1709064f0100b00a4312016287mr1617440eju.73.1708881252681; Sun, 25 Feb
 2024 09:14:12 -0800 (PST)
MIME-Version: 1.0
References: <0fff52305e584036a777f440b5f474da@AcuMS.aculab.com>
 <c6924533f157497b836bff24073934a6@AcuMS.aculab.com>
In-Reply-To: <c6924533f157497b836bff24073934a6@AcuMS.aculab.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 25 Feb 2024 09:13:56 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgNh5Gw7RTuaRe7mvf3WrSGDRKzdA55KKdTzKt3xPCnLg@mail.gmail.com>
Message-ID: <CAHk-=wgNh5Gw7RTuaRe7mvf3WrSGDRKzdA55KKdTzKt3xPCnLg@mail.gmail.com>
Subject: Re: [PATCH next v2 08/11] minmax: Add min_const() and max_const()
To: David Laight <David.Laight@aculab.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Netdev <netdev@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jens Axboe <axboe@kernel.dk>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Christoph Hellwig <hch@infradead.org>, 
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 "David S . Miller" <davem@davemloft.net>,
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>
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

On Sun, 25 Feb 2024 at 08:53, David Laight <David.Laight@aculab.com> wrote:
>
> The expansions of min() and max() contain statement expressions so are
> not valid for static intialisers.
> min_const() and max_const() are expressions so can be used for static
> initialisers.

I hate the name.

Naming shouldn't be about an implementation detail, particularly not
an esoteric one like the "C constant expression" rule. That can be
useful for some internal helper functions or macros, but not for
something that random people are supposed to USE.

Telling some random developer that inside an array size declaration or
a static initializer you need to use "max_const()" because it needs to
syntactically be a constant expression, and our regular "max()"
function isn't that, is just *horrid*.

No, please just use the traditional C model of just using ALL CAPS for
macro names that don't act like a function.

Yes, yes, that may end up requiring getting rid of some current users of

  #define MIN(a,b) ((a)<(b) ? (a):(b))

but dammit, we don't actually have _that_ many of them, and why should
we have random drivers doing that anyway?

              Linus
