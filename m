Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D7870CBA5
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 22:54:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A7C010E38D;
	Mon, 22 May 2023 20:54:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2273510E38D
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 20:54:52 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-64d2c865e4eso3255231b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 13:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684788891; x=1687380891;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0NoMOPLv7no4oTfFk9NPdm7qdXLsHesaFY5RP9uixIY=;
 b=YAbkAhamHMqgwB/fmb97d06Aas3nfKBdgo3MFaaijc8nFzNSIQN4hG+Q3a31wS63AP
 K/0Q5fEOURfRDKRvNesUwiJ2FuPd/kvLXtteSJHVjZDEzM4ir/gWRYNlsj+jTs6J34x8
 tM4UB+Q+LycG1DFt0P+cdepL/65Bzozly6vJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684788891; x=1687380891;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0NoMOPLv7no4oTfFk9NPdm7qdXLsHesaFY5RP9uixIY=;
 b=BrGgLTJmuSMdrPhruug02HyS9JdiMRC1s2rx1vFKrwmBnd1AXfM/V0Q28KXZVz793y
 1uZ5lgl+TIhjiomDYBiuWmSrxDxRAzT/eiFPfz0vGL5ehgZYuXaRZH7g3l0WSthocwFp
 bZc/SevBja0gW3qtcJb5uh//79CtTeFSrQyS1af2bjYykjHKU1dcrAMF49Ex6I1THhcB
 rwDSxGpl/Cj1llcgP8wJXCBQh1377EFdwVxkqARAaP2IjADi4vk4/e/GThFICuNpa8yn
 QQ7b0lvZu9NPXBaBHlmKBZwbjAkcEvUBnJEXy1mYZruJFJLuXips5mlMx6fEmkrK0bTn
 UCvw==
X-Gm-Message-State: AC+VfDzuA7RgbHHXnFSbItG/V6rO7bCm5lwrw3qn4Ny5uVKuNgVZPlad
 3rCtURAsb9X97lrOZNR3GxFvLg==
X-Google-Smtp-Source: ACHHUZ4WCaSPgXTc5XPwlg4IRq/kzCNCY0JzzAU84nb9QtSpKKa25DGdSRYQ9MlGMDG8WMvF0qdEIw==
X-Received: by 2002:a17:902:c944:b0:1a6:46f2:4365 with SMTP id
 i4-20020a170902c94400b001a646f24365mr14314154pla.30.1684788891502; 
 Mon, 22 May 2023 13:54:51 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 q10-20020a170902bd8a00b001a1a82fc6d3sm5231582pls.268.2023.05.22.13.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 13:54:50 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: azeemshaikh38@gmail.com,
	evan.quan@amd.com
Subject: Re: [PATCH] drm/amd/pm: Replace all non-returning strlcpy with strscpy
Date: Mon, 22 May 2023 13:54:48 -0700
Message-Id: <168478888725.1444594.3121115156306616962.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230522155245.2336818-1-azeemshaikh38@gmail.com>
References: <20230522155245.2336818-1-azeemshaikh38@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Kees Cook <keescook@chromium.org>, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 22 May 2023 15:52:45 +0000, Azeem Shaikh wrote:
> strlcpy() reads the entire source buffer first.
> This read may exceed the destination size limit.
> This is both inefficient and can lead to linear read
> overflows if a source string is not NUL-terminated [1].
> In an effort to remove strlcpy() completely [2], replace
> strlcpy() here with strscpy().
> No return values were used, so direct replacement is safe.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] drm/amd/pm: Replace all non-returning strlcpy with strscpy
      https://git.kernel.org/kees/c/0f53b61b1ca0

-- 
Kees Cook

