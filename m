Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25682BB873A
	for <lists+dri-devel@lfdr.de>; Sat, 04 Oct 2025 02:32:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A6110E034;
	Sat,  4 Oct 2025 00:31:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="X1dYviWY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0619010E034
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Oct 2025 00:31:54 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-86be8a110f5so30176676d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Oct 2025 17:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1759537914; x=1760142714;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2Hve5D5bXNWxh8nAKCs1hmgTLg+XAURZWqKyON8mhFU=;
 b=X1dYviWYfIL0npnMaTeKUFG6A1coLwpXxwJ8eSuzWkFtpVojCNXVdkgAxkbm5EAwXa
 JeG13fdGSeMRN8DDb12GHOgQs11dPXUbWepx2ITFtJW/BvLCM8WocvFagDkpxkLKRYP5
 sGqsTn4jQm+yHNIc5QVBjddmXRltyfs5TnCQSuLwpw13quiHz/8LQdlNuLZHf6bP8KTm
 1AB2CcvSeXVY3DFiu2z+3TsegVzc/36hCU5n+tQnqkpPIBQY0LRxE/sHl9qQ0PizXroF
 ySt3q2XXB/u3Y+Tjp4ljmYu279+rRMsIgCKCCp174MvB30icZGEHLsIXppLEr9LMzDRV
 sVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759537914; x=1760142714;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2Hve5D5bXNWxh8nAKCs1hmgTLg+XAURZWqKyON8mhFU=;
 b=aruO43KViXVjyQSC52kZp+tABQZckXw2JU+FxmGghOc3IPp6auvm/qM6AByPrdO8k1
 gtMjmK6LYS/iXtKtx1tRq9pFlk9+7CH4xXP+F+QCOC7hTzZvgv3ontPKLBWPwc3eoXjA
 HBPzGOwA33JxR/aQ7Y7Rr+xy7a7/ZqugXt9u1TbWWqJS+wB1jY0jnY3RIAKU1L1Rpnv5
 m3XQok0Gyu5Z10nohra5gKBaEe9YWmaciOEAUu85he/EhLe/O6gHZWggEJUvQNlp99nw
 ztytNfVQ+k5MlbHyJ8EBcyFMqgjs8Oh1lUoaTBdSFcA1rrl+U0pKhyDVayXfDbIMNmie
 cMNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9xrL4pQXKIlZZxa6zQkKSMBTv47Oy2QO/WuAy0SxY7dKyAWznM1F/Q38yEFyVlYa+a8sWSArlcVA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGdw/7AagBoQMb8LnQVDIr0bU+tbATsCMIYPgTJ6zztMTiFuNl
 5ff8SNFHKwSlksAVc1ljbKPoEgq1N5ufK+tCA6oNqwBGld7CF/uzxKQhkgwIE9rBh7E=
X-Gm-Gg: ASbGncvbRuO7Sz8pwVjorh9BmA5N4qZA5H7xQPyn9oGBwYxriQUOwuDZEl5B96EnvDf
 iTl6o0nBh7ncsUEgjcvUZjMYnTHczAFwRQFu3dOy1azTGmAaeNL4NipwwbFS8eI10TTFxwJKOCp
 PBdMsaGw//9dHG3Gbs5gMncZqCOpUg1L4XFQpKAQ6/29XqpjGC4PlDTDAAIvAPO0GXAeNYzlbjy
 jCVgdHswGjvPzuENgA1ptIZR6JAxAeL+UtqEfvbtxMWGPA12Ebd5PoyIdBW8FXY6Oy4ZO6avxJa
 ++sqenojdO5Rm+Maa/e8C5D65xrTLBDMKoHlaWIcxpkuxlRHpX4qZ8lp/7QRMyRC+E8B1tlbOCm
 3pVAx/OKxJUVjkFwsV/pwGph2kSwDoqP/Pr2EesQJDgfMrA/w8ZC+FpBmVIeMg8GaZWafngwj/C
 dMWQxRplEKbMI=
X-Google-Smtp-Source: AGHT+IEsRjI8gCuEno0aPQByvaMn1RbhQu1LEY6DoWqtshtx58svm3JOMSvxRR1frC8lP1Smp+Sc7Q==
X-Received: by 2002:ad4:5ae3:0:b0:820:a83:eaed with SMTP id
 6a1803df08f44-879dc79b792mr57956596d6.24.1759537913717; 
 Fri, 03 Oct 2025 17:31:53 -0700 (PDT)
Received: from localhost (ip-24-156-181-135.user.start.ca. [24.156.181.135])
 by smtp.gmail.com with UTF8SMTPSA id
 6a1803df08f44-878bb53e3f8sm51778496d6.26.2025.10.03.17.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 17:31:52 -0700 (PDT)
Date: Fri, 3 Oct 2025 20:31:51 -0400
From: Nick Bowler <nbowler@draconx.ca>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, regressions@lists.linux.dev
Subject: Re: PROBLEM: AST2500 BMC video output disabled by reboot (regression)
Message-ID: <qjyncqymjja57h2wxxv3ebuqpip5qu7yjalccons5xmtzfw5h5@m3u4rvbqzcxt>
References: <wpwd7rit6t4mnu6kdqbtsnk5bhftgslio6e2jgkz6kgw6cuvvr@xbfswsczfqsi>
 <CAD=FV=Xp7zOQ2iEVf896P074RW911F-e2Qa36deD0e8fWksFBA@mail.gmail.com>
 <u7ek3ccya4c3c4rteliskjjfczpmrt4vmqo5c6kjdotxdgitn7@ko24dpb35pq4>
 <ef6558a9-c44a-4c66-967c-187f260f73e1@suse.de>
 <xeipdyk2i2lpkg4rrvz4cl2l3ch62sl4zoa73qvlms3ek3zkci@y7xqbgjulaet>
 <cox6kpackepnunrlhpsssvgdmjd24477cc7mide52xptmmoxyr@ijjotb3xju3v>
 <f1de37ae-2ae4-4513-98fd-18617016704a@suse.de>
 <5949fd73-3ca4-4bd9-8092-2d9923dcbfd3@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5949fd73-3ca4-4bd9-8092-2d9923dcbfd3@suse.de>
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

On Wed, Oct 01, 2025 at 09:26:28AM +0200, Thomas Zimmermann wrote:
> Am 18.09.25 um 13:17 schrieb Thomas Zimmermann:
> > Am 18.09.25 um 04:04 schrieb Nick Bowler:
> > > On Wed, Sep 17, 2025 at 11:14:45AM -0400, Nick Bowler wrote:
> > > > On Fri, Aug 29, 2025 at 03:07:14PM +0200, Thomas Zimmermann wrote:
> > > > > The ast driver doesn't do much during shutdown. Could you
> > > > > please out-comment the lines at either [2] xor [3] and report
> > > > > on either effect?
[...]
> > > > > [2] https://elixir.bootlin.com/linux/v6.16.3/source/drivers/gpu/drm/ast/ast_mode.c#L835
> > > > > [3] https://elixir.bootlin.com/linux/v6.16.3/source/drivers/gpu/drm/ast/ast_mode.c#L839
[...]
> > >    - Deleting [3] (only) appears sufficient to make things work again,
> > >      that is, deleting the following line in ast_mode.c:
> > > 
> > >        ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xfc, vgacrb6);
> > 
> > Please test if the attached patch fixes the problem for you.
> 
> Have you been able to test the patch?

In the normal scenario where everything is working and I reboot, then
the display remains on for the firmware (this would seem to be an
improvement).

But it introduces a new problem: the screen no longer turns back on if
I boot the patched kernel from the "display off" state.  The unpatched
6.17 kernel would at least turn the display back on from this.
Furthermore, rebooting from this state keeps the display off.

The earlier change [3] above has no such problems.

Thanks,
  Nick
