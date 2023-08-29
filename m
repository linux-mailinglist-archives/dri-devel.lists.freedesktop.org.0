Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A2A78C9DC
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 18:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6F110E092;
	Tue, 29 Aug 2023 16:45:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA2F10E092
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 16:45:50 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id
 6a1803df08f44-6490c2c4702so23528816d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 09:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1693327549; x=1693932349;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Gd7wbDLNyz8eBHL7fGCPyOOExG5MY/ZyAjupuh5K/2U=;
 b=HaXmMM9EX6NG/E/ePntVX4MvLS/9Bx4fRXcv7ussLeXTZOdZOS/LqfmjBM8ohryTt9
 wvBkhAnaAh9sYZ8KMb9StpU5wQ78P4J//rF2vCmv6OtBEmW4y6c0ZPzOV8Z92s1j465E
 6BJQVeujYC6QBknB+9VhksHfV8vWWR+U56HltBfS8MYs341LnooqP6sfzTMVDYPr7/j5
 5fYnCGD1dMdnL5Tp+f4DSIgcqd59EKNU52fLtXhcp8O8EhE0UZEjnk2CPXe36aIcNIvM
 BV7URAe3NbqVPg1m+61uFXuXgFuaxlMuqD2P2cHRbRALOrQUMeU1ntTM7eY2AQVVmjhM
 ukoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693327549; x=1693932349;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Gd7wbDLNyz8eBHL7fGCPyOOExG5MY/ZyAjupuh5K/2U=;
 b=VoqUd0q9iFi6Ti76ZoncXkiqf8IXpyWKcjl9GKLU5agsgDKNZb4dbPNK7msjUN5eM6
 peS9NnPT/xMOkOoEVLg7O47tJDSlXJ7Rp9Kdjin8YxI4VFDgKQ0PwO7UwLF0H8y6uvk1
 fPoXHFPxZs3ZGU9ddiiLwahvuEPB6MDU9IchttBUzmzqOHS1VFqJCAPdmI6mC5utMgkL
 b82jjfZvJDR44w0mly4cpZ/JMZ/80pq1WInv7+AF8/KhZeyLQh/Mu3pjoYm02shUPPnS
 KGT6UShBhoM/50Hmzu3/ciKEg5ZTSQuqMtA80Jpj7Gkxt6eD8VSW07iOE1WC+AVJwCe0
 RVyA==
X-Gm-Message-State: AOJu0Ywkeu34n3pwPt4p3UGYsoDOCdXCDWsQZ0Q8TkDCH0GrCnxS+YDr
 a6lZVDXTJWIfp9fuCCQoz47wHeLszFhW7rQnx1tlY8GZsSqPszj80oQHJg==
X-Google-Smtp-Source: AGHT+IFMxQxI9GFxNCtBrC7GsH5CSI9yib7ImtOZtC9YNFMY9C889/jaH2b0JivfMTd74M/lUF+8Hsx7eUcoq7MLAFE=
X-Received: by 2002:a0c:e451:0:b0:64f:91de:2ece with SMTP id
 d17-20020a0ce451000000b0064f91de2ecemr7657913qvm.21.1693327548975; Tue, 29
 Aug 2023 09:45:48 -0700 (PDT)
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 29 Aug 2023 09:45:38 -0700
Message-ID: <CAKwvOdn0xoVWjQ6ufM_rojtKb0f1i1hW-J_xYGfKDNFdHwaeHQ@mail.gmail.com>
Subject: truncation in drivers/video/fbdev/neofb.c
To: Helge Deller <deller@gmx.de>
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
Cc: linux-fbdev@vger.kernel.org, clang-built-linux <llvm@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Helge,
A recent change in clang made it better about spotting snprintf that
will result in truncation.  Nathan reported the following instances:

drivers/video/fbdev/neofb.c:1959:3: warning: 'snprintf' will always be
truncated; specified size is 16, but format string expands to at least
17 [-Wfortify-source]
drivers/video/fbdev/neofb.c:1963:3: warning: 'snprintf' will always be
truncated; specified size is 16, but format string expands to at least
18 [-Wfortify-source]
drivers/video/fbdev/neofb.c:1967:3: warning: 'snprintf' will always be
truncated; specified size is 16, but format string expands to at least
17 [-Wfortify-source]
drivers/video/fbdev/neofb.c:1971:3: warning: 'snprintf' will always be
truncated; specified size is 16, but format string expands to at least
17 [-Wfortify-source]
drivers/video/fbdev/neofb.c:1978:3: warning: 'snprintf' will always be
truncated; specified size is 16, but format string expands to at least
18 [-Wfortify-source]
drivers/video/fbdev/neofb.c:1985:3: warning: 'snprintf' will always be
truncated; specified size is 16, but format string expands to at least
17 [-Wfortify-source]
drivers/video/fbdev/neofb.c:1992:3: warning: 'snprintf' will always be
truncated; specified size is 16, but format string expands to at least
18 [-Wfortify-source]

https://github.com/ClangBuiltLinux/linux/issues/1923

Clang is right here.  `info->fix.id` is declared as `char id[16];` so
indeed string literals like "MagicGraph 256AV+" indeed lead to
truncation. But this is declared in include/uapi/linux/fb.h; I assume
those headers cant be changed? Can the strings be shortened then? Is
it perhaps time to delete this driver?

I see AKPM mentioned alluded to this in
commit 0e90454 ("neofb: avoid overwriting fb_info fields")

(Also, snprintf probably isn't necessary for string literals that
don't contain format strings)
-- 
Thanks,
~Nick Desaulniers
