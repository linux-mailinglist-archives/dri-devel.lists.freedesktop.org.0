Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BE33D8C96
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 13:20:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752276E971;
	Wed, 28 Jul 2021 11:20:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 652D56E971
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 11:20:02 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id bp1so3273500lfb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 04:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WRpAt4Qf30VQcI04z59j1Xhna4kVm3ZAFQjWCiFVzII=;
 b=ZITf0JJkY6siA6zuTWx/S+3I3pJ92j2lsEWHCAUrQgybgq2nu7vMyrV5yFzPnr0ASF
 zQnwOwgLaX1f2Ag8AdE3Zoi+yryD69qxehZj3Axp0G1SI8NHWpwdtRD/AWfB8hXTTU+w
 7JIntZBgXB7V3Bx+KAGMmd0eo1ehu7YXfBEGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WRpAt4Qf30VQcI04z59j1Xhna4kVm3ZAFQjWCiFVzII=;
 b=AjmENztpBfphl5P3V//4H1Cfa5se/bFpAu7kibgTP4khelyaDf32G0SiK+0mpiTWid
 XlvsAyEssJnHp077zhA/OUQHxVhKbmh+1I2yu9LWpkMBslIJxbui3BPkjrPLJNirWrrM
 4dfi0Ed9k6N5mWJ0xoCBwFCxDjIbHdKeovaAjp7bsO0TTlkln3KddTxmfAkOudDjU+bM
 pOBgy+sgM1ZG4qXk3KeCe8Rz6f7pn0HOQhR6iWwOcxO1wKAzI+o9jqo9k4hvB4PgAVv7
 qDHL9wvrwtbfNA3h5IER5Yp7tDrId2tl0jKrk3BnyEK/AsYlmA/9IOypTBnbWOi3VYah
 LtgA==
X-Gm-Message-State: AOAM532454pCNyxfhcOuK5asPhmTudSsYHEuzO85CegTAnLUMAB68rKg
 vKxrUzM6x/U4ORHvosaJa0jW/g==
X-Google-Smtp-Source: ABdhPJwtX9cWcqS+T2RXR4asd80U6YfWCrWHQPG0xseFJRRyUcQAZvx3wnyU+2xS6u5f7adx+ZAvkA==
X-Received: by 2002:a19:dc5e:: with SMTP id f30mr20474709lfj.318.1627471200888; 
 Wed, 28 Jul 2021 04:20:00 -0700 (PDT)
Received: from [172.16.11.1] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id z4sm564853lfe.274.2021.07.28.04.19.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 04:20:00 -0700 (PDT)
Subject: Re: [PATCH 34/64] fortify: Detect struct member overflows in memcpy()
 at compile-time
To: Kees Cook <keescook@chromium.org>, linux-hardening@vger.kernel.org
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-35-keescook@chromium.org>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <d2f9f21c-4d6e-9458-5887-ca5166d07942@rasmusvillemoes.dk>
Date: Wed, 28 Jul 2021 13:19:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727205855.411487-35-keescook@chromium.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
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
Cc: linux-kbuild@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-wireless@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, clang-built-linux@googlegroups.com,
 Keith Packard <keithpac@amazon.com>, netdev@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/07/2021 22.58, Kees Cook wrote:

> At its core, FORTIFY_SOURCE uses the compiler's __builtin_object_size()
> internal[0] to determine the available size at a target address based on
> the compile-time known structure layout details. It operates in two
> modes: outer bounds (0) and inner bounds (1). In mode 0, the size of the
> enclosing structure is used. In mode 1, the size of the specific field
> is used. For example:
> 
> 	struct object {
> 		u16 scalar1;	/* 2 bytes */
> 		char array[6];	/* 6 bytes */
> 		u64 scalar2;	/* 8 bytes */
> 		u32 scalar3;	/* 4 bytes */
> 	} instance;
> 
>
> __builtin_object_size(instance.array, 0) == 18, since the remaining size
> of the enclosing structure starting from "array" is 18 bytes (6 + 8 + 4).

I think the compiler would usually end up making that struct size 24,
with 4 bytes of trailing padding (at least when alignof(u64) is 8). In
that case, does __builtin_object_size(instance.array, 0) actually
evaluate to 18, or to 22? A quick test on x86-64 suggests the latter, so
the memcpy(, , 20) would not be a violation.

Perhaps it's better to base the example on something which doesn't have
potential trailing padding - so either add another 4 byte member, or
also make scalar2 u32.

Rasmus
