Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D11F99487D3
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 05:10:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7955A10E2C2;
	Tue,  6 Aug 2024 03:10:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="OHFxdss5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB8610E2C2
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 03:10:10 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5a156556fb4so73011a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2024 20:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1722913809; x=1723518609;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ddVwpujzlJzBqKH8my+rFJponoM7SG54MA80H5/+gq8=;
 b=OHFxdss5bj9VCotvDk8uT84j/8rplWjalJpraMDRTOWKTpU3w0HzYvzPEbkOD7uFfk
 irD8QOE8h5uAaBAgsO7NKyYn6+BFqaX/rUBhwRfHsfmuivVQe/QSgirb9/oYT/FIwvPO
 9cWy0zUglA9wKfoCaNLYa/L19ACho7IGi+FhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722913809; x=1723518609;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ddVwpujzlJzBqKH8my+rFJponoM7SG54MA80H5/+gq8=;
 b=xInnfgGb/5M90zYd30n4UhwDi9/KqwWjrLwJ2sRx2XiaKiQDozJOsDkFbsOyCWcicF
 Dh65Na/40Z6Y74w4prIEQCCqMydJjAqlwnS4SCYHC+a8ETtPkhBwJtTNlQhaiLKTEdVx
 y9fEzTnWy4R9OAZgazfS1PjhwuXYvktMT/JavKQb/tyxS9/w1p2DPicXx2tpXKXeQWa+
 il3L7BPsHIbFqTEETkunDOJ5SzEEZnINA3K0OL/YQUaYxTHVsnGEUHaW1y84W9UPioRe
 n2/NgHFWz17G51DUDq8cJjcht6eVzV+l3gLWYP+BlSzynJXqfAlxW/84U6s6TFpJLLdB
 tvVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjQWK1vBNF998rmwVn9NVb2RrY8ZNW3QtuusjatoIUgZmZv7R7rglVBr49gvTPiJz+/OP/j0D7M6x7DDTVjImNKssmhV8ZhsJP3K4KRNIa
X-Gm-Message-State: AOJu0YxeZQMR4HPejV1nj/n9DTW8ets0CItcgZ0ipsNQS3Wg4w8CdUum
 LesKj2kJGTS1bkGUhHf9YWpQNwzC8rJ2dU06cgGMNGSM/9EuToiO+l05CldSD1qwtPt44brzG9Q
 HAiVZ5A==
X-Google-Smtp-Source: AGHT+IE9HDhV5A186ACylB9JtXScT1UM0bvMtqIhx9ZiElavI3TxEziSjDzCqJDRsKVKntHQBL4ZDg==
X-Received: by 2002:aa7:df97:0:b0:57d:3df:f882 with SMTP id
 4fb4d7f45d1cf-5b7f340c27emr8963878a12.7.1722913808691; 
 Mon, 05 Aug 2024 20:10:08 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com.
 [209.85.218.49]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5b83b82bf63sm5530219a12.75.2024.08.05.20.10.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Aug 2024 20:10:08 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a7a8a4f21aeso5245666b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2024 20:10:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW2TVOCs7QYM2RzgsqMbUgeuYZikFpQgNodqixTEtww3fctkT9wndFKD9mhYNdFS0Hg6lV2GFSXr0JgBY3FCX6Of21jPGBCg+COkXhYD4OP
X-Received: by 2002:a17:907:da9:b0:a6f:4fc8:266b with SMTP id
 a640c23a62f3a-a7dc4db9f44mr1005005366b.3.1722913808064; Mon, 05 Aug 2024
 20:10:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240804075619.20804-1-laoar.shao@gmail.com>
 <CAHk-=whWtUC-AjmGJveAETKOMeMFSTwKwu99v7+b6AyHMmaDFA@mail.gmail.com>
 <CALOAHbCVk08DyYtRovXWchm9JHB3-fGFpYD-cA+CKoAsVLNmuw@mail.gmail.com>
In-Reply-To: <CALOAHbCVk08DyYtRovXWchm9JHB3-fGFpYD-cA+CKoAsVLNmuw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 5 Aug 2024 20:09:51 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgXYkMueFpxgSY_vfCzdcCnyoaPcjS8e0BXiRfgceRHfQ@mail.gmail.com>
Message-ID: <CAHk-=wgXYkMueFpxgSY_vfCzdcCnyoaPcjS8e0BXiRfgceRHfQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Improve the copy of task comm
To: Yafang Shao <laoar.shao@gmail.com>
Cc: akpm@linux-foundation.org, ebiederm@xmission.com, 
 alexei.starovoitov@gmail.com, rostedt@goodmis.org, catalin.marinas@arm.com, 
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 audit@vger.kernel.org, linux-security-module@vger.kernel.org, 
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
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

On Mon, 5 Aug 2024 at 20:01, Yafang Shao <laoar.shao@gmail.com> wrote:
>
> One concern about removing the BUILD_BUG_ON() is that if we extend
> TASK_COMM_LEN to a larger size, such as 24, the caller with a
> hardcoded 16-byte buffer may overflow.

No, not at all. Because get_task_comm() - and the replacements - would
never use TASK_COMM_LEN.

They'd use the size of the *destination*. That's what the code already does:

  #define get_task_comm(buf, tsk) ({                      \
  ...
        __get_task_comm(buf, sizeof(buf), tsk);         \

note how it uses "sizeof(buf)".

Now, it might be a good idea to also verify that 'buf' is an actual
array, and that this code doesn't do some silly "sizeof(ptr)" thing.

We do have a helper for that, so we could do something like

   #define get_task_comm(buf, tsk) \
        strscpy_pad(buf, __must_be_array(buf)+sizeof(buf), (tsk)->comm)

as a helper macro for this all.

(Although I'm not convinced we generally want the "_pad()" version,
but whatever).

                    Linus
