Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74275CA522E
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 20:36:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE2F10E0BA;
	Thu,  4 Dec 2025 19:36:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="XBuAg5y2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2544610E0BA
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 19:36:54 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-b727f452fffso255956266b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 11:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1764877013; x=1765481813;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hfmTeirb3cJ8WH4Elb1KL8rsHozjiNCHYSp9+LExjhM=;
 b=XBuAg5y2l2kWdxKZfm+K+TyzakVdIqCRuEBwjzd3uBLbO/V1r5yGLzWWg0Tga0yoA0
 +HFvh/TJbhXM4iw6hHSNd+sXWz9PHLwZANWsCpCI8p0Hvg3vflIHrKSLSEE8EihtYPJD
 m3trJ6SOxl+QAg1whTrK923y3cS9P0TYYkbtQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764877013; x=1765481813;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hfmTeirb3cJ8WH4Elb1KL8rsHozjiNCHYSp9+LExjhM=;
 b=LQ7/wHn+AUEoPgWVdUMsurDfgUhzGS9RwpuTANZysHLxnrcKbRmBDubqqzWxpCpoi2
 Me0/DMtM3CmFOu20f8wuiVF+Hg98vHamvLf7GNr327T7TzsEngG6rC5YteEp4mE5XZEn
 4u5S4FTJQHgjJIVFq+k1oA+G0b8xq6ozldvdFqEcYN/PFrkxO+epMg3HNS8Y1LBbJbwj
 3mpTieBBp5mTpbYnNLUFfHYzG4OSUzznz7knaIb7dMQFWm+TJs72wqN2Ioi6g1seWLAX
 pkeecX/8Ig/Da7xQqDdNbLOqXgUTATSZ6ACY7G4lqcvGPLAdQQDpiYlXZ49PpSRspxo+
 9uRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWi7JWh/YVFIkJDUIcntNTPBv/9PJPQ+dgwARK4Z80X7pQQdLxbc8jdmMXqg26AzTC7le8RZAP5NTc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0dIWVi/BOTUBPtpX29Ps63+b/rw8mMmnr0h0kJdeLaDq02VyN
 RQl5L7SaRYbvqX4J14+luYuUmxrOBY0C5A6/O+/N6LA/yOclA6yFKO+AmhExvlRj2PE0b7IPMVy
 dzlY5vek=
X-Gm-Gg: ASbGncubzTCHQ5hZWZJMVNYldEeDOZezyF37L5dopR1SOLY8cW+T511jfpvLyFeE8Y6
 Gar7UhaEzivSlls4uGESBe2hTDKAdRsVFqwsTdYuZvnk6CATQlkW4ssXUx0lUmSaPpJHgetKYvk
 4IJ1GtpBFM5YAY2TQHRBYjslkNuKmyW8a/q8ZG64qQpMPZtAHQDRy/iEIeJsP5Bw1bZsIaJugfO
 dZVFcDaalkcqcLQ+5ngKiGSA4ZdqmxnH/v0SIheboUwQ05fj/tr3sJsSNk6q8NEBurNjupqzVnY
 7iHRYpuwrCflzfSrEX0qyBtYVL6mXSHSYeieik7R0N0sPc1zzuaqnUWDgxRyXhhDwYCYt5grG+W
 m4ZrW4QtLgyzsBRbM+5iJufE6hm7DAswhX+8Sra7I849cws5gmn6sAY/mkXzzrNYjJJ+PqshNgR
 HJ6KThI1V3SJpwnNWkVQZbWpCfbeXT4WzSJSCRq68sHrh9R6feDXPAUhCWnpGK
X-Google-Smtp-Source: AGHT+IHXcPutmaZ/KZeIE/XQeUY+MP/wIb38QrTbmfBES3KAsJ21/FQOmfewAdvbzCHrf6Tj3w/aYg==
X-Received: by 2002:a17:906:f049:b0:b76:d8cc:dfd9 with SMTP id
 a640c23a62f3a-b79eb5d732fmr493783966b.18.1764877012646; 
 Thu, 04 Dec 2025 11:36:52 -0800 (PST)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com.
 [209.85.208.42]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b79f449992csm197736566b.18.2025.12.04.11.36.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Dec 2025 11:36:51 -0800 (PST)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-64320b9bb4bso2622351a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 11:36:51 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWHgKN8XhOZzlEMjxze0lWPP45Xv3jVz+LKgIFsBTvr9XLSfPOvdcTmBfz6VWpN7t9rST4v+Ifijos=@lists.freedesktop.org
X-Received: by 2002:a05:6402:5189:b0:640:9997:a229 with SMTP id
 4fb4d7f45d1cf-647a69e6acbmr4507453a12.3.1764877010898; Thu, 04 Dec 2025
 11:36:50 -0800 (PST)
MIME-Version: 1.0
References: <74032153-813a-4a40-8363-cce264f4d5ea@linuxfoundation.org>
 <1eb24816-530b-4470-8e58-ce7d8297996c@roeck-us.net>
 <0425d7b4-76e4-4057-83a5-a7b17a051c54@linuxfoundation.org>
 <ec77d11a-7613-4b75-8c9e-f2bba1595f0f@roeck-us.net>
 <9d520a1d-0b8d-4d30-b29f-230fc0f92b8a@linuxfoundation.org>
 <1f31b86d-283c-4878-92d0-ab90aed0c58d@roeck-us.net>
 <5af4522e-30ab-4eec-a861-c2760cdabd4f@linuxfoundation.org>
 <2bc690ca-fa57-46fa-949b-28b5441cd364@kernel.org>
 <b24fc85c-0e6d-42f9-a6b9-05136409098f@linuxfoundation.org>
In-Reply-To: <b24fc85c-0e6d-42f9-a6b9-05136409098f@linuxfoundation.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 4 Dec 2025 11:36:33 -0800
X-Gmail-Original-Message-ID: <CAHk-=whd-k3GhNGvVmP7W2p1d0d4ctqJ8iCuG8DbyKzgNqCL+g@mail.gmail.com>
X-Gm-Features: AWmQ_bl15pRGGXuHFcuQkuAPhnzgKRm8fbeljiIJE8EGq1gNKXLgKf_oozB3SVU
Message-ID: <CAHk-=whd-k3GhNGvVmP7W2p1d0d4ctqJ8iCuG8DbyKzgNqCL+g@mail.gmail.com>
Subject: Re: Linux 6.18 amdgpu build error
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: "David Hildenbrand (Red Hat)" <david@kernel.org>, akpm@linux-foundation.org,
 Alexander Deucher <Alexander.Deucher@amd.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel <dri-devel@lists.freedesktop.org>, Guenter Roeck <linux@roeck-us.net>,
 Linux Memory Management List <linux-mm@kvack.org>
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

On Thu, 4 Dec 2025 at 09:40, Shuah Khan <skhan@linuxfoundation.org> wrote:
>
> This commit has impact on all architectures, not a narrow scoped
> powerpc only thing -  it enables HAVE_GIGANTIC_FOLIOS on x86_64
> and changes the common code that determines MAX_FOLIO_ORDER in
> include/linux/mm.h

So I suspect your bisection might not have worked out, and there might
be two different things going on.

In particular, hugepages were broken in 6.18-rc6 due to commit
adfb6609c680 ("mm/huge_memory: initialise the tags of the huge zero
folio").

That was then fixed for rc7 (and obviously final 6.18) by commit
5bebe8de19264 ("mm/huge_memory: Fix initialization of huge zero
folio"), but the breakage up until that time was a bit random.

End result: if you ever ended up bisecting into that broken range
between those two commits, you would get failures on some loads (but
not reliably), and your bisection would end up pointing to some random
thing.

But as mentioned, that particular problem would have been fixed in rc7
and in final 6.18, so any issues you saw with the final build would
have been due to something else.

Can I ask you to try to re-do the bisection, but with that commit
5bebe8de19264 applied by hand - if it wasn't already there - every
time you build a kernel that has adfb6609c680?

That way the bisection wouldn't be affected by that other known bug.

                    Linus
