Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPsXHVcYhmktJwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 17:35:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C06EE1005AF
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 17:35:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02E7710E825;
	Fri,  6 Feb 2026 16:35:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="A/O4ECy1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA2A10E825
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 16:35:29 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id
 4fb4d7f45d1cf-6581234d208so1447608a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Feb 2026 08:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1770395727; x=1771000527;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lEqAwzXehbVzchYDAND90vGdwFH8r/bqM6A6cnJ3VvQ=;
 b=A/O4ECy10gMmeiVD83pbkUEqGpecEl3wq2ZKCdjcyrDPRjr7LESQuHeltqW5MBfKG2
 75lujfhuRYia5ggQ3vcRPdHf3bDtfPp780FMvNTgH/qrMKwqmPgO2+KAtHXWgYqp1eQ6
 tYIQUiaXXlvKxOxxfALkxV2qunAFk6p8RkAK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770395727; x=1771000527;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lEqAwzXehbVzchYDAND90vGdwFH8r/bqM6A6cnJ3VvQ=;
 b=vnQKY9A2K73DVkORMqNOW4DiBOvy+9w/NMs18NEj+7N+qZjXy1MrnYed2fohd5V8za
 lXGvZywT2jbt4ZIuF/LN7p7WVkU45wtxE6o11MJbflA/RzynT6mMRRtFq0BhHmdLr3aD
 orvdiVCKlVlTHOPrJkcU2hz6lc/tQUXitLSziOTPNmd4UxSoVns+H24PDhTiqaYWS8An
 1p9kK8KdzcpPVTRvMPcirbiulsm2SVWQZmt24udHSRQ2RhGhWFCcnWwgmaZ6YVL+DKSH
 YBd0zzBnenxzMa6Se6RcwhrzXhZMaR69rjacksIXZIo01w4ugd6bht4DkQ547sidQG13
 SSjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoPzNO+YJKWeUXBd6dg4IRgYCeFoR5IUajJ8C0SJGXfdynkiWzLcmDcTSZtSPYWyLg0+UQFoCz87A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxznOyIFhH7qw0uWca7VDRXgNfTxjo/53+N2DMOACUQsARfVF+6
 VYL9JTLJXhLpXRy+/BO8lG2wpmadJe1fXrDpnrKAPvDPQbnGFldXlXtPc2EPYqT77aYcj4mI9mX
 eYLs05Mxc
X-Gm-Gg: AZuq6aIKWzHpqYPfldz4QmisirWft7iwT0iuyN09oi5RbY3dzlj8++mdkGeMloBC1Xr
 slPKMybqZaqBFQTbgN2fx5jn0EHCXjTj8G3m/FH3nzMluadQ7TxV/ZxagjpTSWMeoYOtsMg522A
 LVmmf+pHpQL4fRkLRUEkTK4zlUSMY3q674ZEIqdT1fY5efQeODd4BvGWzSA85T10eBCnJcEu0G+
 ZOX8qZDYhOG/c34ksMvFiDOIuC14BTTE1A0kLf/X+JioGehA6tPjEtrNclYNGwL9GPfZsqU83YG
 8j25AIkY6gBSXe+BwZqlN4eioCgNagf/rAI7Xa3oRxIWqludgZK4+hMFQgz3Va/QdGEveAxIvXF
 AWzOrFYiDhghFxcwwKTCKRUrMmoIx8656Oq+yroyGMm47vcfi1h7V9ZEb9muVGtYxapnD8PJeCD
 R+DSeyUJkPyBg38qp+Ad0rP+CeY0OKPzJRTdLZekMKbTOQwZrw3g==
X-Received: by 2002:a17:907:9723:b0:b87:225f:2e74 with SMTP id
 a640c23a62f3a-b8edf19d5a6mr189331566b.14.1770395726437; 
 Fri, 06 Feb 2026 08:35:26 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com.
 [209.85.218.46]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8eda7a3004sm95299066b.15.2026.02.06.08.35.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Feb 2026 08:35:25 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-b8869cd7bb1so162120866b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Feb 2026 08:35:25 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWHfeqnhuHNMZiJ1DWhYXdjc7YEuZ87jyNKA9j4MZgIwRfF+2wPrOTC3+NHYNH1MxSxTAW3cHqOIY0=@lists.freedesktop.org
X-Received: by 2002:a05:6000:1848:b0:435:aaba:b8e9 with SMTP id
 ffacd0b85a97d-43629017c58mr4513452f8f.0.1770395238489; Fri, 06 Feb 2026
 08:27:18 -0800 (PST)
MIME-Version: 1.0
References: <20260206123758.374555-1-fra.schnyder@gmail.com>
 <CAD=FV=UO3wHqGKep67pY04PgBJKgvOgDf8u1qxeXmWkgVMLXiQ@mail.gmail.com>
 <20260206161054.GA101724@francesco-nb>
In-Reply-To: <20260206161054.GA101724@francesco-nb>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 6 Feb 2026 08:27:07 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VvePQt9LgupM+hW72doRja4UPBj6sBXUh091yHFxcxVw@mail.gmail.com>
X-Gm-Features: AZwV_Qgm-zXegQuSpVm1x9sbLixy4tTG3qVrk--0qkuaZQnLYdiCiKMrx8LFrHU
Message-ID: <CAD=FV=VvePQt9LgupM+hW72doRja4UPBj6sBXUh091yHFxcxVw@mail.gmail.com>
Subject: Re: [PATCH v1] drm/bridge: ti-sn65dsi86: Enable HPD polling if IRQ is
 not used
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Franz Schnyder <fra.schnyder@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Franz Schnyder <franz.schnyder@toradex.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,linux.intel.com,suse.de,ffwll.ch,toradex.com,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:francesco@dolcini.it,m:fra.schnyder@gmail.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:franz.schnyder@toradex.com,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:fraschnyder@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[dianders@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.991];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,toradex.com:email,chromium.org:dkim,dolcini.it:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: C06EE1005AF
X-Rspamd-Action: no action

Hi,

On Fri, Feb 6, 2026 at 8:11=E2=80=AFAM Francesco Dolcini <francesco@dolcini=
.it> wrote:
>
> Hello Doug,
>
> On Fri, Feb 06, 2026 at 07:46:10AM -0800, Doug Anderson wrote:
> > On Fri, Feb 6, 2026 at 4:38=E2=80=AFAM Franz Schnyder <fra.schnyder@gma=
il.com> wrote:
> > >
> > > From: Franz Schnyder <franz.schnyder@toradex.com>
> > >
> > > Fallback to polling to detect hotplug events on systems without
> > > interrupts.
> > >
> > > On systems where the interrupt line of the bridge is not connected,
> > > the bridge cannot notify hotplug events. Only add the
> > > DRM_BRIDGE_OP_HPD flag if an interrupt has been registered
> > > otherwise remain in polling mode.
> > >
> > > Fixes: 9133bc3f0564 ("drm/bridge: ti-sn65dsi86: Add support for Displ=
ayPort mode with HPD")
> > > Fixes: 55e8ff842051 ("drm/bridge: ti-sn65dsi86: Add HPD for DisplayPo=
rt connector type")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
> > > ---
> > >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > It's weird that you have two fixes, but upon closer inspection, I see
> > why you tagged it as you did.
> >
> > The first commit that landed, commit 55e8ff842051 ("drm/bridge:
> > ti-sn65dsi86: Add HPD for DisplayPort connector type"), was still
> > using polling mode and just using the HPD line for polling. That
> > commit incorrectly set the flag "DRM_BRIDGE_OP_HPD". So the proper
> > backport to kernels with just that commit would be to take away that
> > flag. Unfortunately, I didn't notice this problem during the review
> > and I don't personally have any hardware using this bridge for DP,
> > only eDP.
> >
> > The second commit that landed, commit 9133bc3f0564 ("drm/bridge:
> > ti-sn65dsi86: Add support for DisplayPort mode with HPD"), actually
> > added support for the HPD interrupt. After this commit, your fix
> > (which makes the flag "DRM_BRIDGE_OP_HPD" depend on the IRQ) is the
> > correct one.
> >
> > Unfortunately, I think the above will confuse the stable scripts.
> > Since your patch applied cleanly atop the first commit then it will
> > picked to any kernels with it, even if they don't have the second
> > commit.
> >
> > I think the first commit landed in v6.16 and the second commit isn't
> > yet in any stable release.
> >
> > Maybe the right way to look at this is to just call the 2nd patch a
> > prereq? So this:
> >
> > Fixes: 55e8ff842051 ("drm/bridge: ti-sn65dsi86: Add HPD for
> > DisplayPort connector type")
> > Cc: <stable@vger.kernel.org> # 6.16: 9133bc3f0564: drm/bridge: ti-sn65d=
si86: Add
> >
> > That will cause the 2nd patch to get picked up for stable too, but
> > that would be preferable to having just your fix without the 2nd
> > patch. Alternatively, you could try to add some other note to the
> > stable team to help them arrive at the right backport.
>
> We had some internal review before sending this patch and I am the one
> that suggested to put both commit as fixes in the end.
>
> I agree that your solution is the correct one (I am not familiar with
> the syntax there, but I agree on the concept), assuming
> nobody disagree on this, should we send a v2, or are you going to amend
> the commit message when applying it?

You can see the docs at:

Documentation/process/stable-kernel-rules.rst

As long as you agree with what I came up with, there's no need for you
to resend and I can adjust it when I land the patch. I'll still let it
sit on the list for at least next week to give others a chance to
review / comment.

-Doug
