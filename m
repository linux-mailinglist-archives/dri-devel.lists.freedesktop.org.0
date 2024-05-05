Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4504B8BC2D4
	for <lists+dri-devel@lfdr.de>; Sun,  5 May 2024 19:31:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45B311269A;
	Sun,  5 May 2024 17:31:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="lvdLrmlz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 489A811269A
 for <dri-devel@lists.freedesktop.org>; Sun,  5 May 2024 17:31:25 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-2b27e960016so352855a91.1
 for <dri-devel@lists.freedesktop.org>; Sun, 05 May 2024 10:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1714930285; x=1715535085;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2Cs+A1U1SHJpevw+hi+Q4AcgLtXTFmWGtCKoa+YyyIA=;
 b=lvdLrmlzoylxr+TJlQC4Uo6FUA0yiRIm2Gaz6Bbpxpi/To7/n/ZH8nucFhSlUyAK+p
 U9WB9pbztnLnEAbh/W1IIj7Bg1OIdw7qs1WnZZsJYWMkCsJUCIhnWD45qeHxbx364AwY
 FI/U1z9RWLCFSqsEtfYxid0VyLfCGTddoucQzUBQo6Zr8otQXoAUWvUj2Pl3UaM6j6ei
 zPfK9zV7jiYvCDY1ph+oyq/ha99lO+GXZE5civ5+I1C4HCXTf7/UrB4hf2AvQ1+/TVYj
 tAAS8ld2yDGH99KKnS7DxvNY0UBGSkPrcvL1QnkjA4nDno+Kc9S8yUamw+PtOG2O+Fij
 RMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714930285; x=1715535085;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2Cs+A1U1SHJpevw+hi+Q4AcgLtXTFmWGtCKoa+YyyIA=;
 b=sJroe5HEsfphUa65uO5FqwrpixIOYy+pgRlHP/N16AtWM4/4+UzmpxjCkle4dYrPwD
 nNViNzywEiCQsM3IYVwwMofrNWhEEewYjhCiWUTWK3hhh4bFuOFI0/LsnQkADHeAs5Qp
 j0S0nI34DCaxf1lmvLGEqdMMWjhrQ8S1w+IdJR7Bf3W3LTocfoH6mfd+FjK9ATbFmIww
 bOBKdfX5BEFmG3TR164Tn29vYMIH4ZhwMJYDfMxM/pxpPntYpT92qhC9eEuElGgKom4Z
 nDrKszHSgNlQ6sStUSkve0B7T40L95Blld4Rnacik8dBZMn/0BKrS1gS0NhMDNnHeYEf
 FtYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTHrlEAT/IlSOGLpszwFqYMmq7ZSpngyRkev4Ac0Q3hcyCxsAQyL7mye2Zo1edqOjNJ9edJCNQ9klrJ/zu1FxwJxZVHQsxypDYBAptXg/u
X-Gm-Message-State: AOJu0Yw3/CqBjP30CDxc9n8GcXfPFhYzIv+mNauKeyDCvKJy5VuFhxTU
 wzJ7LQhsLdbMDLs454rnAzznk/JaSLeLoNabZs2Wkzq7wEhJfNRTwDn5SlxIYPM=
X-Google-Smtp-Source: AGHT+IERglgqIQlQxZGy92cwbJYDFAAfOzd8bI+FwSdGNO4w8zW6pBYTMU1wp8NYvmMLo28t69VtUg==
X-Received: by 2002:a05:6a20:841e:b0:1af:667c:466a with SMTP id
 c30-20020a056a20841e00b001af667c466amr10398624pzd.4.1714930285042; 
 Sun, 05 May 2024 10:31:25 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.194])
 by smtp.gmail.com with ESMTPSA id
 ca29-20020a056a02069d00b00624e9960bb7sm1014794pgb.91.2024.05.05.10.31.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 May 2024 10:31:24 -0700 (PDT)
Message-ID: <a64eb06c-199b-45ef-94eb-c2ae620669a0@kernel.dk>
Date: Sun, 5 May 2024 11:31:22 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] epoll: try to be a _bit_ better about file lifetimes
To: Linus Torvalds <torvalds@linux-foundation.org>, keescook@chromium.org
Cc: brauner@kernel.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, io-uring@vger.kernel.org, jack@suse.cz,
 laura@labbott.name, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 minhquangbui99@gmail.com, sumit.semwal@linaro.org,
 syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk
References: <202405031110.6F47982593@keescook>
 <20240503211129.679762-2-torvalds@linux-foundation.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20240503211129.679762-2-torvalds@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 5/3/24 3:11 PM, Linus Torvalds wrote:
> epoll is a mess, and does various invalid things in the name of
> performance.
> 
> Let's try to rein it in a bit. Something like this, perhaps?
> 
> Not-yet-signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
> ---
> 
> This is entirely untested, thus the "Not-yet-signed-off-by".  But I
> think this may be kind of the right path forward. 
> 
> I suspect the ->poll() call is the main case that matters, but there are
> other places where eventpoll just looks up the file pointer without then
> being very careful about it.  The sock_from_file(epi->ffd.file) uses in
> particular should probably also use this to look up the file. 
> 
> Comments?

FWIW, I agree that epoll is the odd one out and there's no reason NOT to
close this gap, regardless of how safe we currently think the existing
usage is.

I've done some basic testing with this - both to verify it fixes the
actual issue at hand (it does, crashes trivially without it), and
networking/pipe based epoll usage and no ill effects observed. Also
passes all ltp test cases as well, but I was less concerned about that
side.

Reviewed-by: Jens Axboe <axboe@kernel.dk>

-- 
Jens Axboe

