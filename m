Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5228CCD898
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 21:34:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2374E10EB4E;
	Thu, 18 Dec 2025 20:34:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="d5/KWBGo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2379510EB4E
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 20:34:26 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-b79e7112398so171073966b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 12:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1766090065; x=1766694865;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AFdyme3OdkfY6SG6LYuzpXFnNfm347qWal7RaQqaQwE=;
 b=d5/KWBGoreZvRINxH5Rzcxf07Oa1Jj76sHgMNQ+QhjB9nj5NF0+PVZL/f3RzN7KoQh
 VMPC6XvZjORHszsTcgD8XhVkDVkok8AteHpr8SJvsbxTeLmpqVOz+sVi09jSflP/mvi+
 B6143hlIBARsfWPopUieK8V59uwbzzNqPuUcY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766090065; x=1766694865;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AFdyme3OdkfY6SG6LYuzpXFnNfm347qWal7RaQqaQwE=;
 b=DTu6F+HHmmL2Vk2Er4TdX4qIyarv5psPBuAoDRwO878CuoKCQ2Z6b7tzfJGgWcia0P
 YpX2wq5hNYOtJW99K95F05proRtDIMGIXP3Q1FSr5FUk39SxIRW8Exvx20HHYfsfQFqm
 MDZd3nQnELfQ4WQU9GPKDGIzGs6gFHXtyLxXVo+lnLwBVXTcTerfyWImBLNX2SLpRDA7
 uao3wc1Hwu1uB1k8EkR67eIWbl1uKqp1E1m10aLoA99aLUhKy0hq9BbuErayBNIVX9lT
 K4yJN/otz10Dhay8R7MA6d9I8HRQO/e/9FztMCLHhFYuY/fq8X8083xfr44AAZ7f9SaL
 zpOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlp6c446y5Q6AX2AFAnQTQ6at3Gqesf6nWfRn8OtLG9X6/RbRliHw3KM0T0QP8lRMm+IhG9lUbJKo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhEFOyyxaJUpvrg0vwHk3E8771BZSErscp69BZYRwywcAVGTOa
 64crvHdOTyU4F1T/piyX5vmOSF4mCbcwZyda2bozvnutRN6z/nyq+dk6PlVsvgekajHJ6NoCzzv
 p5fuSdshaFA==
X-Gm-Gg: AY/fxX54owMYluvhdJqBJhewb5D6GNJQYtb8bn5mQMatAQRi5+MHqJ4mxZomocHL6vg
 KFuHJBVtOXlxnYJuFh1SynuOv+N181M40SFP8RCxYMRrMfzgfrphNyvw/Q8rbio/q8HVokKj+PI
 uV9pYVh3HZrQq7QP3JONgkPnXQhteKcpGtKoDPjty9jqbQGcMMXnIKXqBTPWr0H90BFpu0Jnd2J
 vzo0wdhtfBNx/+lpSU/h4MeUHQglpm3XSRPFIL1bjP1vg/w7HaBjnPk39/+cI7a8tJsNFqBbkJn
 93fqT18rH0eDFSYM+Yoen1L5X5QH7xpAtqemlbhneuR0SDiGm6+kJgcNCT9hOOoXkQUmgFaV1rI
 vT1FY5Vw08tshKnGknY506/3TEJuRvhlhdS/PTDR9TluJ15J3OcEKalqUyrlBZ2GMfs+tXajspu
 MTMX3cQTeiPOZ9hy6j8iqnrIIP+IVm+YYw01HWcHjODp/zDxeXY1HpRvFAaBjcrr7/YE5/VQY=
X-Google-Smtp-Source: AGHT+IFut5AdqoTLuUaldwK3pRyAn6eo1djSRpsfyzLTiv+CUsNCzjMk295izwv9BjksJIAcNjTGng==
X-Received: by 2002:a17:907:6d06:b0:b7f:e703:fd77 with SMTP id
 a640c23a62f3a-b8036ebf29bmr54797966b.11.1766090065083; 
 Thu, 18 Dec 2025 12:34:25 -0800 (PST)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com.
 [209.85.208.53]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037ad8577sm34488066b.24.2025.12.18.12.34.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Dec 2025 12:34:23 -0800 (PST)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-64b92abe63aso244127a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 12:34:22 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVgntXw01OBECbho7opzuT/alZJ8W3LW1V0J5d0jvF08RqZPVZWZTD7cBUpvJDFVg6Gr2W3PS1LQbc=@lists.freedesktop.org
X-Received: by 2002:a05:6402:1ec8:b0:647:532f:8efc with SMTP id
 4fb4d7f45d1cf-64b8ec8f844mr669213a12.33.1766090062459; Thu, 18 Dec 2025
 12:34:22 -0800 (PST)
MIME-Version: 1.0
References: <20251218-remove_wtype-limits-v1-0-735417536787@kernel.org>
 <20251218202644.0bd24aa8@pumpkin>
In-Reply-To: <20251218202644.0bd24aa8@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 19 Dec 2025 08:34:05 +1200
X-Gmail-Original-Message-ID: <CAHk-=wjrNyuMfkU2RHs28TbFGSORk45mkjtzqeB7uhYJx33Vuw@mail.gmail.com>
X-Gm-Features: AQt7F2qOKBa-zo7QJgMQveUGo5xuaKkhNSphimTCrBEi3RG5l67qg5BeTDIQqhM
Message-ID: <CAHk-=wjrNyuMfkU2RHs28TbFGSORk45mkjtzqeB7uhYJx33Vuw@mail.gmail.com>
Subject: Re: [PATCH 0/2] kbuild: remove gcc's -Wtype-limits
To: David Laight <david.laight.linux@gmail.com>
Cc: Vincent Mailhol <mailhol@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
 linux-kbuild@vger.kernel.org, 
 linux-sparse@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 linux-btrfs@vger.kernel.org
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

On Fri, 19 Dec 2025 at 08:26, David Laight <david.laight.linux@gmail.com> wrote:
>
> One possibility is to conditionally add _Pragma()

No. That compiler warning is pure and utter garbage. I have pointed it
out fopr *years*, and compiler people don't get it.

So that warning just needs to die. It's shit. It's wrong.

The sparse patch points out that this *can* be done correctly if you a
compiler person doesn't have their head up their arse.

(And no, I'm not claiming the sparse patch is perfect. I'm only
claiming the sparse patch is _much_ better. Bit tt could be better
still, and there could be other valid cases that could be warned for).

The "warn on type limits" is idiotic. It expects programmers to have
to always track what the exact type limits are, instead of just
writing safe and obvious code, and it warns about *good* code and.

It's exactly the *wrong* kind of thing to warn about.

               Linus
