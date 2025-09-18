Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7740B829F6
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 04:11:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42FA510E08E;
	Thu, 18 Sep 2025 02:11:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="xpruWdti";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D45710E08E
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 02:11:09 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-81076e81a23so65246085a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 19:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1758161468; x=1758766268;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Evg9VjC868jXEyq9jooY+5VpA/zgsMZDDv3GTIqYmAI=;
 b=xpruWdtiTfNDq6fEzU2/8Ox0fMebJJRtIo+9xaVW2+Jl8fIAJ4ziSM+ITc54kmn9iI
 ZTk+/zJ3bW7s41DPZwDGH/FykKSwVuIc1k85wd+VCLlEBrx5Pu9A6GG/s4FSqFoT3lWe
 Olb/4wSUgOWLLKuvs4BFoGJ34W3vYAx9r/NE49VP79OWTZMjkMcSQDAXvqvV4i27k2Xq
 ROv83OaYh0FutGjbvmTAZrOO+090Fjv4xM1QYAszCaY3ZwtAFdWxp9sndmtrc8Ppim0h
 LKDsMCM8o09sqd1m0EcX82cJpPVymgf3NLMOcLJsK5oAMVymz8D10R6kJOXhA8a9Wgyx
 e9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758161468; x=1758766268;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Evg9VjC868jXEyq9jooY+5VpA/zgsMZDDv3GTIqYmAI=;
 b=OSak1iO158zfiE1/HozrUa5DpX7X5EJ8KouctHQm/o+7A9igGx8if/vs/dsdv2F3u8
 TJry7BmF+jLGg9tAdJ9wdiewCwKFAAHtcMCQ32wHQsFNPROFlmxSQajlZYH6gjGwN+sN
 /97DXqFwhFZs8DvePayQkg6HY6OPt3b7WlpzJ0CVb4NQMJj9YUcDgf8IRsimsdglQQRR
 c97NKoxrJYxJ5i0e3s7DLl3a2dSXKVsQ4UDEpkYPIlLs+SVIUDUVjCV8HMyDpPYJhv+J
 zY48g72cIf7221bAPnt0jRFhC9Oalarpt+Rl8IOcgmIJUyQtGzW8aRNwfpmkhLr/QrM7
 57/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQKc3ejZn4cCptT8LNsCeYGcoFsDbaFNc3tDPURcN5bfCSN2RYhHyGdc0k7vo8Ld0pXSYkSvmEXk4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0c5AwHkOjMGwbw6w5Ud9F4Wvzib0x9huaSmiK8MtO0yFLrf8r
 3519SDctvUNOwfnKNm2xnNwAL5+31oXHyQa/g5N9heQg13k72C9MgsBHSYjMcOiocbhN5yhxwAk
 barvh
X-Gm-Gg: ASbGncsGk0WdG3NqhM0Z0AdYU3LfRzQBq6IdE3PIvQIdOuh/3cAbLXkvNS6Y3ahZxuc
 k4d7mlprJ4m2ew6AeYcPu1iqdI/guogApC/CCTFeT7jC3ZSDUZ1B3bkJ4li9vdbQvfdNfPJkebd
 C0ixJmqHK36SYDKKrAOc6YiYlaEvv+4a2KLnhJsRWqqwkqbGPp+h1C5AW5SxyTgG7XUQSPGB/+M
 FMBaOcQHVXpVnMfmsgNlYa0YOtRfHTrlJddgYUQoD/zQjMFNH2WSy4KF9AMCVHliI0Agb6msL2I
 9/wsIxGy3d4sZRKOXvZieBokcFofpQ/dCITvsXBSJrANNuvUR5zbpLqfHxwmMi1jtVKzfy8+EO6
 5R9gjaPcH5U94W1522Hwru3QTjv5HZNAjnfwDlHHzoEJU0OXup/2JVMauB3D7Vh8V6BQanlBApF
 uibJNBDg==
X-Google-Smtp-Source: AGHT+IG/GLEg3wUhCq3zxQNU9mkogat7dWnRYMeJFqt+fW2ti/BtmCrgt18+eulLSnVkk+XU7zUx4w==
X-Received: by 2002:a05:620a:2607:b0:835:fa34:5bbe with SMTP id
 af79cd13be357-835fa345d06mr276881485a.36.1758161087152; 
 Wed, 17 Sep 2025 19:04:47 -0700 (PDT)
Received: from localhost (ip-24-156-181-135.user.start.ca. [24.156.181.135])
 by smtp.gmail.com with UTF8SMTPSA id
 af79cd13be357-83626595a14sm83375485a.12.2025.09.17.19.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 19:04:46 -0700 (PDT)
Date: Wed, 17 Sep 2025 22:04:45 -0400
From: Nick Bowler <nbowler@draconx.ca>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, regressions@lists.linux.dev
Subject: Re: PROBLEM: AST2500 BMC video output disabled by reboot (regression)
Message-ID: <cox6kpackepnunrlhpsssvgdmjd24477cc7mide52xptmmoxyr@ijjotb3xju3v>
References: <wpwd7rit6t4mnu6kdqbtsnk5bhftgslio6e2jgkz6kgw6cuvvr@xbfswsczfqsi>
 <CAD=FV=Xp7zOQ2iEVf896P074RW911F-e2Qa36deD0e8fWksFBA@mail.gmail.com>
 <u7ek3ccya4c3c4rteliskjjfczpmrt4vmqo5c6kjdotxdgitn7@ko24dpb35pq4>
 <ef6558a9-c44a-4c66-967c-187f260f73e1@suse.de>
 <xeipdyk2i2lpkg4rrvz4cl2l3ch62sl4zoa73qvlms3ek3zkci@y7xqbgjulaet>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xeipdyk2i2lpkg4rrvz4cl2l3ch62sl4zoa73qvlms3ek3zkci@y7xqbgjulaet>
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

On Wed, Sep 17, 2025 at 11:14:45AM -0400, Nick Bowler wrote:
> On Fri, Aug 29, 2025 at 03:07:14PM +0200, Thomas Zimmermann wrote:
> > The ast driver doesn't do much during shutdown. Could you please out-comment
> > the lines at either [2] xor [3] and report on either effect? These calls
> > turn of the video chip's memory access and sync pulses. Not doing that might
> > resolve the problem.
> > 
> > [2] https://elixir.bootlin.com/linux/v6.16.3/source/drivers/gpu/drm/ast/ast_mode.c#L835
> > [3] https://elixir.bootlin.com/linux/v6.16.3/source/drivers/gpu/drm/ast/ast_mode.c#L839
> 
> I can try this.

OK, I tested 6.17-rc6 and reproduced the problem on this version.  Then:

  - Deleting [2] (only) appears to make no difference whatsoever. That
    is, deleting the following line in ast_mode.c:

      ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x01, 0xdf, AST_IO_VGASR1_SD);

  - Deleting [3] (only) appears sufficient to make things work again,
    that is, deleting the following line in ast_mode.c:

      ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xfc, vgacrb6);

Thanks,
  Nick
