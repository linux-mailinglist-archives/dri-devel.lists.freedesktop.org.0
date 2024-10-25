Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C31079B0F7B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 22:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FCCC10E0D7;
	Fri, 25 Oct 2024 20:01:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="JRfSbjRm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5B710E0D7
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 20:00:58 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5c9693dc739so3129011a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 13:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1729886456; x=1730491256;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RqgVnPZ+sAFjUIPKthsMDBXPwRC2/usor5uwXmwjBkM=;
 b=JRfSbjRmC0q8OAJeE98o7PbKFsUkmc426JYi7MEExJri7mEsygncdfn041tjLl548B
 5iQoAQYDd1eQX0XhuGpSrvol41cIXwtP46QYnEx4A5nq7kjEdpHaaxV5BoiX10VIlJR7
 yzasmS7yiruZfYL1tFKQUaSBHd4xHw763sV1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729886456; x=1730491256;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RqgVnPZ+sAFjUIPKthsMDBXPwRC2/usor5uwXmwjBkM=;
 b=kZBFRLI8on0gVfXgpw1k8t6kqiYDjUbzhZV92ifvfTNmSTykYerSKfuG12ieIBxxBW
 2dCZEBH4DkDsGaGdSsnfcoeXIAREae1Ga5zdFyKEBqO5QkHKLoV35eSYadGD+q/lt35E
 93LA2f398koXUpwbOpMnnHy4DpC3qfe0DdDm4sbDOsZYfU9YsUU9ZO+RmkpxBjTC89UG
 +cYJd7ZLGVA2NenJuGRmKc2KOoxbXzf/U0rmcUv6V9p6bDtxvcmjslhqDlrWbCP6FRzO
 qbce0V/hYfatnTVPdbVMM4rQyuJ0PX0U02xS5Dtx/ZY0ZRhUy6yVbWPbn/TdREQmhWNs
 1mww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXY0rZuHFcC//fFrQouKrwKcSTlKPiJ/C7snJyRZN0OHqIDQvvFNJYMwrNGRGrS9bpAv/eXWVZoZfQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbPcrsPTlN8rBxXqy/wpgtjP6neRJeS963W4/M9bsO6rs2YW3s
 1z/x0msFTwazN2Kq/L3/q2dtZjxXiJTaLqkd8Dgjxt4zyEgDyYykGlBrLMQXjY5NLv/U5gN5e0b
 6tT0=
X-Google-Smtp-Source: AGHT+IGe5S6XlWxGfuhFhETTXePeeCnnAPpk8dMpcXATq+Ybe156JJ0WhB6JlcO55JroTczU/Q8KrA==
X-Received: by 2002:a05:6402:1eca:b0:5c9:5c1c:a1e5 with SMTP id
 4fb4d7f45d1cf-5cbbf88c70fmr378210a12.8.1729886456100; 
 Fri, 25 Oct 2024 13:00:56 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com.
 [209.85.218.46]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cbb62c20dasm926888a12.46.2024.10.25.13.00.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Oct 2024 13:00:55 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a9a628b68a7so365865366b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 13:00:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWxlPRYJ0yzoJ5ixNwwTpqvPxiWOKphTJ6nJhInmn653XMaStFglM+KMZ3S60dt6j4zY3ZnPQQLCrs=@lists.freedesktop.org
X-Received: by 2002:a17:907:7e86:b0:a99:77f0:51f7 with SMTP id
 a640c23a62f3a-a9de62ec48amr21019766b.61.1729886453894; Fri, 25 Oct 2024
 13:00:53 -0700 (PDT)
MIME-Version: 1.0
References: <ZxvBfDuqSC_TEM78@carbonx1>
 <CAHk-=wjKouRizUF97ZABtCmijjKR+sAOmWA4uiYhhSOwhxCT3w@mail.gmail.com>
 <e3debf69-0507-41bd-999c-b3de79c809b5@gmx.de>
In-Reply-To: <e3debf69-0507-41bd-999c-b3de79c809b5@gmx.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 25 Oct 2024 13:00:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjhG+UYcrFWc5-XzF73R-ZBLqquXWDoEgZjOTGe2Tkuug@mail.gmail.com>
Message-ID: <CAHk-=wjhG+UYcrFWc5-XzF73R-ZBLqquXWDoEgZjOTGe2Tkuug@mail.gmail.com>
Subject: Re: [GIT PULL] fbdev late fixes for v6.12-rc5
To: Helge Deller <deller@gmx.de>
Cc: Helge Deller <deller@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
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

On Fri, 25 Oct 2024 at 12:36, Helge Deller <deller@gmx.de> wrote:
>
> Do you want me to send a revert for this specific patch?

No, it's in now, more churn this time around just makes it worse. I
just don't want to see these kinds of non-fixes in the future.

           Linus
