Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 561DDBCB3AF
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 01:56:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A2D10E251;
	Thu,  9 Oct 2025 23:56:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="OUodB0Bv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A0F10E251
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 23:56:06 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-7960d69f14bso9650396d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 16:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1760054165; x=1760658965;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bTFpCR/KI1F13hy7CFFNjYUFOgplKs84/KujihK2OhQ=;
 b=OUodB0Bv44m+nrewyvLfv469XATXfvQplYsrf5CVQQn2s/hWtF68n060VZtJj5QTkv
 OMAzMyM0MU6W3jnTeHiLb2GCm/SJN232rqYcXlN5V+/67K+MADaaimA2tptsgMXFjmE9
 Brb1pTD8sg9HagUDh113X0tCuieb3pazNAQIorsh2XjN7xZXCrH/VvYw5CxGnAk8v0pq
 TdaIh+7DHsX7UzyOGLl2vPdWVO3eNCqEscbDr4IqQZ1RvMP87OE0Wya91GAmedESECX7
 a2wmLNUrkjMQl0C2zvM7/4ulseoZTzjoWsGifsNk8v8J9flVmI3ZzULp5D1tNGWRz4DG
 lV2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760054165; x=1760658965;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bTFpCR/KI1F13hy7CFFNjYUFOgplKs84/KujihK2OhQ=;
 b=YRuefxOI04n2znotspr89Dz69BaTz2fsJRKbxJs23ES/rCEbPsqMNW8ODwcY0+gno6
 4iIhND8ixVrbJvaAm3fPk5VpdbY1dCkloBqNdFwceXy/izPv7RJEdQCwVzKA0G0o66PE
 dbQiJ3urNjjRXtKf+EAxcHYdJGzDEqyquSeRYFxvCzj3MgKeob7QgAyzgHA3vfvgXGdK
 nElR6Xnai8ItAq6cWhGwCH/KAFGDdooxGhkcwnJO9mZObyJ+ESLykRojDP+KYLTEMQ2M
 SUR+20PoJeP9yVyz8P62HUmgpTC2mlgNUU62jgDfQxqSCxPleoco0Inc/roOYNz+9guW
 rjNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW35hgoraQtmj5idFRKcCH8+0DEnFJiqwQ0pg7WG/jeCu/wrRzDHVK9+ZTNC7O2WR3s/WjAgyFEIH4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCKEGh4p8BdPNOVFT8SeYORqrDYgOkIJcBfQeyrFG8vB9eFqgW
 53y/LNRQ8Dw/AGUOQ6e0MRgFnG6Lv/x06sXNu68FhL4DioMOSPTYr8q6Qo5ZBiygalI=
X-Gm-Gg: ASbGncvYq+kVxeq9MVk8+gsn+t4eovwsa3XhO8ks5y5KnWLScWsCztmEEup+fZwAhwY
 YN6zIwxXp5e2BMCZbOYV8bvCw3BCesIJZjm4uZFXsXjrN0NLMakJSkyoltNgRfyII1UmOypXREL
 y/bviwLS6hDKzhPinFJQ23BEYwGhPoP7jRKqZlNtgd+yp5bc3pO1/6GNR2Z1uEtxnbhmHInZqFd
 2cuJGNfjhVh7gSb/euIA/sgxx/COyxsQLFDQiabRuGTJca6LaYd/l5p4wORxx8HvN2tu7/rpKxB
 UJAZJ1ZkxYHFQWXo2HgQ4Bch+lZ6gGKOgMPxw1uoXpXYKPdumoaCEGPgSYr+dgAk0tOv1A8Jowr
 YoMMesRJ4cr7s6vFnkPaTqfOsVcLOUNiBxcEfoa8IHQW6piJRo8GT8gJ5wDFBOHvYjhf+bGaPd5
 nr
X-Google-Smtp-Source: AGHT+IH6Ltx5J9UQ1h01zMMBVoitoSRQwM7F5bZvt3pvVezHa8vMsYH7ROgPUCpj3UYMdCE/cK73yw==
X-Received: by 2002:a05:6214:f23:b0:80f:abfe:819b with SMTP id
 6a1803df08f44-87b2102679amr124997606d6.26.1760054165314; 
 Thu, 09 Oct 2025 16:56:05 -0700 (PDT)
Received: from localhost (ip-24-156-181-135.user.start.ca. [24.156.181.135])
 by smtp.gmail.com with UTF8SMTPSA id
 d75a77b69052e-4e706b97ba7sm7574841cf.4.2025.10.09.16.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 16:56:04 -0700 (PDT)
Date: Thu, 9 Oct 2025 19:56:03 -0400
From: Nick Bowler <nbowler@draconx.ca>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, regressions@lists.linux.dev
Subject: Re: PROBLEM: AST2500 BMC video output disabled by reboot (regression)
Message-ID: <hyyyuqsyf7c3ed2ku57fp4sjwkpcacygtrwnkgupn2xdq7ez4u@sg6xeg4shkdd>
References: <wpwd7rit6t4mnu6kdqbtsnk5bhftgslio6e2jgkz6kgw6cuvvr@xbfswsczfqsi>
 <CAD=FV=Xp7zOQ2iEVf896P074RW911F-e2Qa36deD0e8fWksFBA@mail.gmail.com>
 <u7ek3ccya4c3c4rteliskjjfczpmrt4vmqo5c6kjdotxdgitn7@ko24dpb35pq4>
 <ef6558a9-c44a-4c66-967c-187f260f73e1@suse.de>
 <xeipdyk2i2lpkg4rrvz4cl2l3ch62sl4zoa73qvlms3ek3zkci@y7xqbgjulaet>
 <cox6kpackepnunrlhpsssvgdmjd24477cc7mide52xptmmoxyr@ijjotb3xju3v>
 <f1de37ae-2ae4-4513-98fd-18617016704a@suse.de>
 <5949fd73-3ca4-4bd9-8092-2d9923dcbfd3@suse.de>
 <qjyncqymjja57h2wxxv3ebuqpip5qu7yjalccons5xmtzfw5h5@m3u4rvbqzcxt>
 <e0104f10-9230-41e5-acd1-4ca95c38220e@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0104f10-9230-41e5-acd1-4ca95c38220e@suse.de>
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

Hello,

On Tue, Oct 07, 2025 at 10:51:29AM +0200, Thomas Zimmermann wrote:
> Am 04.10.25 um 02:31 schrieb Nick Bowler:
> > But it introduces a new problem: the screen no longer turns back on if
> > I boot the patched kernel from the "display off" state.  The unpatched
> > 6.17 kernel would at least turn the display back on from this.
> > Furthermore, rebooting from this state keeps the display off.
[...]
> Thanks again for testing. Looks like your BMC is especially picky about
> these settings. :)
> 
> Attached are two patches; each trying to eliminate one of the possible
> causes. Could you please test them individually and report the results?

0001-ast-Use-VGACR17-sync-enable-and-VGACRB6-sync-off.patch
  ^ Everything appears to work fine with this patch applied on
    top of 6.17.

0001-ast-Use-VGACR17-sync-enable-and-VGASR01-screen-disab.patch
  ^ This one has the same problem as the last patch: the screen
    does not turn back on if it was previously off during bootup.

Thanks,
  Nick
