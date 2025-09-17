Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69454B80745
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 17:14:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E6EA10E559;
	Wed, 17 Sep 2025 15:14:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="t+Gn0gaK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F1B210E559
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 15:14:49 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-78f15d58576so5204816d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 08:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1758122088; x=1758726888;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=v6NrCcDiMgz4BfT37/6MfLkoGQSFwd3bQQCaY08TYjM=;
 b=t+Gn0gaKL27tL8uo1/Yjkk3uW0GhVnKLBCgnNQ9LIhmtUqbcZN0fXUhjzkanWE1K5c
 a1d9+VNkcDNjMNYvdCTigDb1FdHRJ/LSjQ8odEamoNfMnFPtF+mzOqTggqiA0H11FjeJ
 wKu79fw4VNX/og5RYdASe8REI3COoBALJ1k9PX7oLygv9BqozNRP+/dcNKBshL7Eh7BH
 We7W1+DbYUYORP0Mobe1+E64ON2wVCgqr3ivfZylsgDx9Z5sN4amQreO/d6HeCoEWI+q
 pEUTyvFmfGsROYh76/AzoSS2jHVermJpn6JEakG1zu69nlFok5mm8D5+Qzo1b+GT9vCz
 eLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758122088; x=1758726888;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v6NrCcDiMgz4BfT37/6MfLkoGQSFwd3bQQCaY08TYjM=;
 b=GOc1goGgbtjejW2f/FniknlzIveYhp2No9VoEfHxHuz4Nn5NOLdSEHodDeihbB/WLF
 ZS533m2iK4mBuqTJHvHacET+7BiEWXY4QFJFsFqZjS5vUUKqWVe7uSO8p14SNlDNX3zt
 n3ZPLc/ARfMR3qgxwgJPspIcXdwQpjI8Yadqcfj9b06WNMPQEHBV+1GJNrWx6eF3O3tK
 hDolKhXm+wLflsg5PAYZCihqUMgChuqNMzHiEd+YiuikomeSy+2E+9PpMY1g248G940X
 0Mj4hjoyTrRgk53J7jW0UKTDY4ggSCt7iiaMBCs8ry0XIVLHT/5CYKx24goxYtBfp5GZ
 Ptiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwIkwBRGwdvRvYry4mD62xkWNDeEsx9y59PT24e9j1dsAj6EwPcqL/BniZaJBy9nmy53VCdx2dUtk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz23hC08gDiYdZdDnQuo91/yF4cCkifKDew1R6oMw450ul8Beam
 Yjzzj7apLzpE+qJUp+5bM4lMVzXDUgDJL87Od3C4zC0xRhUce7N4R8pk1Qh0dwlGptk=
X-Gm-Gg: ASbGncsMSnS6Cnj5D2NdxuRvJdPqZFUBVgdJbS2Ya1I/l7CNikhXkPVFDSmGoMF3zFr
 NzBhFajMr4hx19kbkyaZ1AbfST7ofVaakbFm9Naa8lWXcVmjjvg8uX76IC7THaXzRvqNZker0Ou
 R57pKwKbLiqfL7fpagMWyLDfrjiycx4Q/71UzIyK9zLH3aCPp0wONMMHaKcDdgbRsMskv6GlD4o
 pJfhqT9qC/Zx02/6LEuw7KJqykk7edTPvsVJBVHP9Xeq2B2ejHoOuyEn7+C+fQAuxtC/OwhA/e4
 1MgI38h8XlQjc771XkcvJcdHR9WvUcmZFGz4zxsTrEwdJ3MR7OpXzLVkNUbRWOkNfDr7pBMyvo1
 g1UV+CLKx+y+ZI6+O/Mo3wYyaJuW6JiYy5hyZUbxEB+z3voa+/yg=
X-Google-Smtp-Source: AGHT+IGd/ABHMF4f3Hvae/ZzKRbwMwLDu0yyj04cHbrYciDrdwe6HnEu0vohHTaXLEoMoD8R1qEw/Q==
X-Received: by 2002:ad4:5b84:0:b0:77e:8d71:c335 with SMTP id
 6a1803df08f44-78ec6177b6bmr28182516d6.19.1758122087595; 
 Wed, 17 Sep 2025 08:14:47 -0700 (PDT)
Received: from localhost (ip-24-156-181-135.user.start.ca. [24.156.181.135])
 by smtp.gmail.com with UTF8SMTPSA id
 6a1803df08f44-77cb4cf2a35sm65042936d6.51.2025.09.17.08.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 08:14:46 -0700 (PDT)
Date: Wed, 17 Sep 2025 11:14:45 -0400
From: Nick Bowler <nbowler@draconx.ca>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, regressions@lists.linux.dev
Subject: Re: PROBLEM: AST2500 BMC video output disabled by reboot (regression)
Message-ID: <xeipdyk2i2lpkg4rrvz4cl2l3ch62sl4zoa73qvlms3ek3zkci@y7xqbgjulaet>
References: <wpwd7rit6t4mnu6kdqbtsnk5bhftgslio6e2jgkz6kgw6cuvvr@xbfswsczfqsi>
 <CAD=FV=Xp7zOQ2iEVf896P074RW911F-e2Qa36deD0e8fWksFBA@mail.gmail.com>
 <u7ek3ccya4c3c4rteliskjjfczpmrt4vmqo5c6kjdotxdgitn7@ko24dpb35pq4>
 <ef6558a9-c44a-4c66-967c-187f260f73e1@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef6558a9-c44a-4c66-967c-187f260f73e1@suse.de>
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

On Fri, Aug 29, 2025 at 03:07:14PM +0200, Thomas Zimmermann wrote:
> it's been a while since you sent this report. I assume, the problem is this
> there?

Sorry, I haven't had much time to try the latest versions, the most
recent version tested is 6.15-rc7 and the problem occurs there.

I have just patched out the shutdown call in the ast driver and
everything is fine.

> Am 30.04.25 um 15:28 schrieb Nick Bowler:
> > On Mon, Apr 28, 2025 at 01:40:25PM -0700, Doug Anderson wrote:
[...]
> > > 2. Could you give more details about what panel you're using?
> > According to the documentation I have for the machine, the video output
> > of the AST2500 BMC is connected to an IT66121 HDMI transmitter.
> 
> That dmesg refers to a SIL164. I always thought these where only for DVI.
> With the IT66121, I'd expect the warning from [1] in the dmesg.

It's not impossible that there is an error in the documentation.

Although the comment in the driver right above the linked code suggests
that it might just report SIL164 even for other kinds of transmitter
chips?

> [1] https://elixir.bootlin.com/linux/v6.16.3/source/drivers/gpu/drm/ast/ast_main.c#L196
> 
> 
> The ast driver doesn't do much during shutdown. Could you please out-comment
> the lines at either [2] xor [3] and report on either effect? These calls
> turn of the video chip's memory access and sync pulses. Not doing that might
> resolve the problem.
> 
> [2] https://elixir.bootlin.com/linux/v6.16.3/source/drivers/gpu/drm/ast/ast_mode.c#L835
> [3] https://elixir.bootlin.com/linux/v6.16.3/source/drivers/gpu/drm/ast/ast_mode.c#L839

I can try this.

Thanks,
  Nick
