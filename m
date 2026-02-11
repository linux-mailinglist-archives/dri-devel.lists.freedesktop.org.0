Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMOpOcvjjGkeuwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 21:17:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D8C1275CE
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 21:17:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4441010E1DE;
	Wed, 11 Feb 2026 20:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="BFvS7U5a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF6110E0E7
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 20:17:11 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-b87677a8abeso1079686366b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 12:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1770841030; x=1771445830;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GYX7c7SNwY4gCgB/MnP4yQFnyaqoeG8GyrZ0LwbHcG8=;
 b=BFvS7U5akv39s4fOcu2bK8l5K2t3N8jASlpWCjEniOjkDMmsiq1o72ceM14t/dy0MR
 l8OUuXx7i0NusyelST6uMjr/Zn1xHJfFyQsirPS9oSHqRp5O24WmOKABx4a/PblPWcIv
 UBzeAWxLa/3Q3An/HStiUAJnNKYznkkUdYTEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770841030; x=1771445830;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GYX7c7SNwY4gCgB/MnP4yQFnyaqoeG8GyrZ0LwbHcG8=;
 b=b2E9Z0yd+hBKk7XsdAGfAxz5pTFzfg1xQABnYod9tr+7NgtAPf/LWj+4YXppNwhLLH
 xoN3+uWZuxgKij6ru0N8h6Jb5LBDlc4tXfj5Gth2OUdh/FFHCPOlrohjONpyB5Z46UqR
 xl4yP1GiL1MwZI32kQHMaaq9jwitDw9R0krKjRgmtYHzv7vPz2Xajaxsm4mKfMHOltlN
 TjTctXC+X/qz4BT7tWDGo56QzA8oRdPwSCAxW51o9Lh5FLB2IkrLRdiMnpTIO/BSRp98
 uvgDJqzeU7QhPHSGwP1VFdqR3CAAMiwObrd6CZqrM/YaOg1q2pQ1lHxBe6yRdFeLZqyx
 JiOw==
X-Gm-Message-State: AOJu0Yzu/T6aitdhd7+m6V6j+MedoitlLuT3lvF+K6VIx1uRkKitWOIo
 EZtECCUieQB6P1lUjIivxKqB/jNg/hNZWBNbHblM78oTn3gTis7Ulv4zMn9XknQbocqcWX1b4MR
 /CaREOcw=
X-Gm-Gg: AZuq6aL88RLoNp0hWRI1OI+HM6bxk+wOr6viZSG4MrAeiBzdoOBw5WVZ9KIFbJZWnGp
 rDNkEoxZ5P9+wU6yiunnnSvyLLJ9r4TEC6HYFfeYRTbFDWmZZ6IVgDf9qTdCL+mKij8Ea8OZmgw
 NjfJnjMFLCuDlKmd4n6/mrZtUHdm5hF0Y9SsRTyjfUljNFJfB6PezGhhMlW2yzTe/vip0qiOtTx
 UAxm7x39pGvYczjoaCNPI/6+e7mtekBVbaSnn9OaFHi0ANmBMaS7oLp0pL45nEGIpgZezUpCPK0
 npj04TYo+qgV6Ok5ULjSNW+N2SXbxx3T/kPJwkGKXIDFt6pZZKLJy635ZB7pj1kz8d1CC/YMq4n
 yvOwDyyoAmulCFeSpCfArPCE17eEMa+DATqgrJjcMB0ZCUwTSLrLG1pG3sdsEbjO+enbSDkG/vu
 tuJQ9/VySQL3C7IBV2ksPWIfbWPeX5rXPxsMu7BF9SHZzdcUCtYZZtpVqFNtdMRUsHOmkMZNfJ
X-Received: by 2002:a17:906:99c2:b0:b88:5182:b869 with SMTP id
 a640c23a62f3a-b8f8f566f25mr20148666b.23.1770841029698; 
 Wed, 11 Feb 2026 12:17:09 -0800 (PST)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com.
 [209.85.218.54]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8f6ec65779sm89609166b.57.2026.02.11.12.17.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 12:17:09 -0800 (PST)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-b87677a8abeso1079680266b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 12:17:08 -0800 (PST)
X-Received: by 2002:a17:906:c10d:b0:b8e:d04e:e4fb with SMTP id
 a640c23a62f3a-b8f8f70c6femr17335866b.48.1770841028482; Wed, 11 Feb 2026
 12:17:08 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9twmmLhc-DJV2hFKJ1kahzxRUY5j1cLH9JjZ33LEjjBNbQ@mail.gmail.com>
In-Reply-To: <CAPM=9twmmLhc-DJV2hFKJ1kahzxRUY5j1cLH9JjZ33LEjjBNbQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 11 Feb 2026 12:16:51 -0800
X-Gmail-Original-Message-ID: <CAHk-=whJtUu+L9hs9m1n7p1XYRRQPuzCU9RBMF=ssadxznXUJg@mail.gmail.com>
X-Gm-Features: AZwV_Qif6Q2n_ln-4fz0KNI8gnknKlF_GA4U1xsyPltpS9JVc2SDJnl_iUqib7I
Message-ID: <CAHk-=whJtUu+L9hs9m1n7p1XYRRQPuzCU9RBMF=ssadxznXUJg@mail.gmail.com>
Subject: Re: drm AI patch review hacks
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, Sima Vetter <sima@ffwll.ch>, 
 "clm@meta.com" <clm@meta.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:sima@ffwll.ch,m:clm@meta.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[torvalds@linux-foundation.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linux-foundation.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 20D8C1275CE
X-Rspamd-Action: no action

On Wed, 11 Feb 2026 at 11:45, Dave Airlie <airlied@gmail.com> wrote:
>
> Hi all,
> This is a public inbox, you can also git clone
>
> https://gitlab.freedesktop.org/drm/ai-reviews-public-inbox

What an odd format that is, and I don't have anything that reads it
natively, so I just did a one-liner script for it:

  git show $(git rev-list HEAD | sed 's/$/:m/')

and having done that I think the review output format is not exactly
lovely, but whatever.

But the details in reviews look mostly pretty good to me. I don't know
the code in question well enough to say whether they are useful to
*you*, but it certainly doesn't look bad to me.

The one review I reacted to was because I *do* know the code enough.
So when Claude reacted to this nonsense patch with that whole "Fix
passing zero to ERR_PTR" thing:

  -       return ERR_PTR(err);
  +       return err ? ERR_PTR(err) : NULL;

*muy* reaction is that it's the opposite of a "fix" and we should get
rid of that whole

        err ? ERR_PTR(err) : NULL

pattern, and just admit that ERR_PTR(err) works fine for 0.

I don't know who started doing that "turn 0 into NULL explicitly"
originally or why, but we certainly shouldn't add to them.

Yes, Claude seems to think that ERR_PTR(0) is "erroneous" and somehow
different from NULL, and maybe that's where some of the existing users
came from? People who already used claude and got the wrong impression
from that?

Claude is correct that casting a non-constant zero value to a pointer
*technically* isn't NULL according to the C standards. But we don't do
standard C, and the fact is, we depend on NULL being not just
"constant 0" at compile time, but also actually have the (dynamic)
value of zero.

However, Claude's other reaction to it is actually much more
interesting than my initial "that's just a nonsense patch".  So while
I disagree with the claude on a detail, I don't think it was overall
bad.

          Linus
