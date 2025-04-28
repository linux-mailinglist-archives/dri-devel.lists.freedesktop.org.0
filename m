Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D0CA9F80F
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 20:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DBF710E672;
	Mon, 28 Apr 2025 18:08:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="qkQKV/q0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 908E810E672
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 18:08:35 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-acb615228a4so1080973266b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 11:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1745863714; x=1746468514;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ObSXFlGsDpWRV8E/7b0vGadnQXgzqYHgpaoAoCxwOYI=;
 b=qkQKV/q0VzrmpC3+UlSKK6N2aLD4fJEmjCgZX/UNukIVQhqbL+F4hCSfpp19OFMAgv
 Ab5KEoriBHzEi+2T1Um32M9BIv7BMyv4tO2042dnJd8C+7j9gZsJWui9Ivt+5Dvat5Pa
 9iXhxLOC8AvMGSrB02Gz38oCv6/pEb3/9Knlwbv4vsRsJpWLuq2htzkck7MKGOrkSW6N
 J/wgqr1Qv7NwieVBvT4Q/TEZ3WhN8KIDVVtfFnNsXanjU5C437/TbElhz5M7of0bPlBQ
 LcVbbZlXwpOsxmgCLmL3PBYBImGT+Z0RD59GeS0X1etDv7xk9wOReIDVaeG+30Ntr6UW
 sJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745863714; x=1746468514;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ObSXFlGsDpWRV8E/7b0vGadnQXgzqYHgpaoAoCxwOYI=;
 b=onnOzP4UQWsjinQaGtBtHguoFVoOyU0SLt3DHEZ2Knpn4IGhRa4t/gvGAzBxC5libh
 9yAeVwGk/JenKAEYJbqjy4X2gjcmC+pxoybl01CffNzYDNUi0hgZn4+Xifc1bnHOoDB6
 QRRVrUFbFzFhemPAIeY7hzvuiZlcig+hNnv/fznNjYP3xVyYyC/lTrzmeha/Flw7uQAB
 hkvjxIqD3BG/JaClW0ibqrbLbdPtxAqN1uYRHSYvBr9xFyN8y7rvKUIlrqAhRk2vO+pd
 Hlv/mXtWlqbH/TX53ST1u6hJTnjvAqwjFPh6INRrKzi+9s/LRZMYks9+lMIiB+0vd1Hr
 sEyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWq1Sn/vlf8pQUG+JmbAKqMUvO9jdGmpXjb6u6lSAsKDYaEjKSLiDT3u3dsGENIO3HVQiQqFfsi8fM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzL+bdTI9lWNqnjVvFaJNufykGWSUFsQD0BWX3FkZU6BP7UYBAR
 gwvYn9Y8XqicFeVtsDB7cbt1EMTNRTp3iIuak+Zuh1gbkOtVOlKhjVAzcOIO2ayzJysxg7rHv96
 lT5TWGr/IiZ9D9sW5ozIaYyfNjp+Dj7c8GVU=
X-Gm-Gg: ASbGncuHfQuxLczyTL7jXseSKlEP2jvD71+Q2jsAjNuX+I045DVLNgLcEp5obBwv++Q
 HqBRhjaiYAdDLH8t0I0WdB0sL6fMjhIJs+mfETZY0BpdA5D545gMba7QKC1nbBL/lnU6nUov4kP
 +mJBZJiFJp4JuB/hjwuBo=
X-Google-Smtp-Source: AGHT+IH17lQSjopDcYFAF6vUXYSB4/G8Ck6PNpMZfMLiwEZdqHhhJ7KrtjzzJEVPEcYGZn8hDBoMJ8c6jyFfD4ISC3U=
X-Received: by 2002:a17:907:940e:b0:acb:1165:9a93 with SMTP id
 a640c23a62f3a-acec69a7894mr16522666b.3.1745863713696; Mon, 28 Apr 2025
 11:08:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wiq=E0fwJLFpCc3wPY_9BPZF3dbdqGgVoOmK9Ykj5JEeg@mail.gmail.com>
 <CAHk-=wip2-yTrWpAkrUQ0iejEo2PjReddu4xntwBvdnSvWDbzg@mail.gmail.com>
 <20250426200513.GA427956@ax162>
 <CAHk-=wgPCbZv0JgqoNWMOO+p=N772YW16xYk_pmb1GU7aeuPFA@mail.gmail.com>
 <20250426232344.GA1395819@ax162>
 <CAHk-=wha-AgeeqATWRrKuopM4fKhhF_tZE_raQM77qO7Zd3fOQ@mail.gmail.com>
In-Reply-To: <CAHk-=wha-AgeeqATWRrKuopM4fKhhF_tZE_raQM77qO7Zd3fOQ@mail.gmail.com>
From: Bill Wendling <morbo@google.com>
Date: Mon, 28 Apr 2025 11:08:16 -0700
X-Gm-Features: ATxdqUHdkMoNTiG3otQDMcEbh3e1opeHpcZVUMb0X719K18pydkfuXGdraIMEuw
Message-ID: <CAGG=3QUk8-Ak7YKnRziO4=0z=1C_7+4jF+6ZeDQ9yF+kuTOHOQ@mail.gmail.com>
Subject: Re: clang and drm issue: objtool warnings from clang build
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Justin Stitt <justinstitt@google.com>, 
 "the arch/x86 maintainers" <x86@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sat, Apr 26, 2025 at 5:31=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> So please. Clang people need to get a clue. Yes, we care *deeply*
> about performance in the kernel, but a C compiler that thinks that
> using UD to generate "better" code is a disgrace and pure garbage.
> Because security matters a whole lot too, and the downsides of turning
> undefined behavior into random garbage are about a million times
> bigger than the "I can remove one integer instruction for zero gain".
>
> For the kerrnel, we want to disable absolutely all undefined behavior
> crap ideas by the compiler. It's why we use -fwrapv and have for
> years. It's why we disable the idiotic "strict alias" stuff that
> should never have become part of C. And it's why I want that "turn UD
> into unreachable" mindfart fixed.
>
> The notion of "optimizing" unreachable code is crazy. And the notion
> of thinking that "UD means unreachable" is so incredibly insane that
> any compiler person that thinks it is reasonable should have his head
> examined.

I tend to agree that generating bad code in the face of UB is bad;
there was another, unrelated, instance where Clang silently generated
bad code with UB.

The problem borders on the philosophical. But I believe the argument
is roughly "generating 'good' code in the face of UB is a never-ending
game of Wack-A-Mole(tm), where we don't actually know what the correct
outcome should be." ("Correct" implying that the compiler could
somehow divine what the programmer was hoping for, or at least get
close to it, but it's not possible.) This situation is one of the
easier ones: "do something other than fall into the next function";
but there are far more involved examples, of course. And even in this
case, the compiler needs to know if a "trap" is okay, or would
returning with garbage in %rax be okay.

-bw
