Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EEA98A8D1
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 17:40:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B4210E53A;
	Mon, 30 Sep 2024 15:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=networkplumber-org.20230601.gappssmtp.com header.i=@networkplumber-org.20230601.gappssmtp.com header.b="v6qTvmaz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA7A410E53B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 15:40:48 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-20b8be13cb1so11682225ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 08:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=networkplumber-org.20230601.gappssmtp.com; s=20230601; t=1727710848;
 x=1728315648; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gk4IT+ziW7GSilMgu7AJgpoE41t4jq/Ls2rSzqW+beE=;
 b=v6qTvmazkT7RUtfGOKX5Z4zSF5jJJLcIKd1n8/9vR03LKaDAZi+zAnvu8yQlXXOnoO
 ryT6HteQB6ifnHsq//ugLFLf8DsVObtNru3iPP4sC5sgtGajHAAwxke9N5i7GlubLXhx
 88PCXYotYyG66po+OgpRWGsSdaLx0tAggB2+BJdSP9XpZknT4VNm8fkIGi0kdU6KSZjc
 91kiEEQibGajigjBu/Odsy3IFStdqcT/B8IuZsUhEKbVyfP33lZUDwcmQvgB9Oug8g//
 W/MmY36FIN0DX54vb1ATCGc3DvljYfp5mpfhtuqHXGneJSIp8UqebIMdPOFVG6csHFbO
 Xogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727710848; x=1728315648;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gk4IT+ziW7GSilMgu7AJgpoE41t4jq/Ls2rSzqW+beE=;
 b=OoAVWfMWt/fDzpRk5pQ0tuV8qLPAGJEso51qInuXHrldcjtnM7k6aNvMW5ylwI01+E
 +Sez/46yYUqDvFGMJvYvfWx2So4WdhpjmoH3ROvqy7bQhS5QFuFr4eX34P1dhiKfbaf9
 QiKjN0ytv1ZTqbnMnpKWV/DG2eQmL/xSQ7WseSn2Gg1E1KNyWFloU1Ib4eLPWL7X6F0v
 23Nok5s6bOUXleGBpYXuUsR6rQGw7zN0vDsrNg60c+pIfO1MU9O7rz4rOVtzS07FBF+f
 5FmLmLv2b0eCgTA3YPl9Q0TJi0bdueC/ePPVb5AjE7IKtH8HVx8HO3JxI0hSjODgDy/5
 iCUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWF+MvZJMfVt9ae+cxJG04Y3Lgq2Dzd+KS/qY3J9y5bla3xkYxCCkUlYJS/N11e82CWUAcs3JeFZFc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6dkDQgqPCqoKO/0W8amFjGUpg0fQRuj5Rcb4oecaIxy7etiCi
 uIxmnad9wq3X0S29cLAIdhnNm+MWdF6jkTGYaEd2XQIzFhD/OwH3En62b9u84xY=
X-Google-Smtp-Source: AGHT+IEBTYKGJiVF/hvLtnqHSF6GUD7YmyDMyv0oyolLcyv9IFVLXr8V4Z3pE6cLuKRIJT4zroumAw==
X-Received: by 2002:a17:902:f54f:b0:20b:5c94:da02 with SMTP id
 d9443c01a7336-20b5c94de48mr112201815ad.33.1727710848215; 
 Mon, 30 Sep 2024 08:40:48 -0700 (PDT)
Received: from hermes.local (204-195-96-226.wavecable.com. [204.195.96.226])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20b37e6c997sm55788515ad.307.2024.09.30.08.40.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 08:40:47 -0700 (PDT)
Date: Mon, 30 Sep 2024 08:40:45 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, Jamal Hadi Salim
 <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko
 <jiri@resnulli.us>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>
Subject: Re: [PATCH v3 17/19] netem: Include <linux/prandom.h> in sch_netem.c
Message-ID: <20240930084045.7c0e913e@hermes.local>
In-Reply-To: <20240930123702.803617-18-ubizjak@gmail.com>
References: <20240930123702.803617-1-ubizjak@gmail.com>
 <20240930123702.803617-18-ubizjak@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Mon, 30 Sep 2024 14:33:28 +0200
Uros Bizjak <ubizjak@gmail.com> wrote:

> Include <linux/prandom.h> header to allow the removal of legacy
> inclusion of <linux/prandom.h> from <linux/random.h>.
> 
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> Cc: Stephen Hemminger <stephen@networkplumber.org>
> Cc: Jamal Hadi Salim <jhs@mojatatu.com>
> Cc: Cong Wang <xiyou.wangcong@gmail.com>
> Cc: Jiri Pirko <jiri@resnulli.us>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>

Makes sense

Acked-by: Stephen Hemminger <stephen@networkplumber.org>
