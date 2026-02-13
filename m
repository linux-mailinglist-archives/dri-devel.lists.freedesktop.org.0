Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMaoCq6vj2ndSgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 00:11:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77783139EC8
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 00:11:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C7410E156;
	Fri, 13 Feb 2026 23:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="yosogk5C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0793F10E84C
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 23:11:35 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-b884d5c787bso183464166b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 15:11:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771024294; cv=none;
 d=google.com; s=arc-20240605;
 b=lJL1k1jYsKvxgZbiPt2dvYVbiUJ3YE4HVqwCw2gr+sKbzj9XLGwNXa3S6NG65Km8Dz
 uJCqziIPMo2mAzGTycqPHXZWJIiPKQwDHjuSYAbfG2efraK/24nVINYny0l+7bmlIA1p
 KzqorJMBD9+SjnwmLdZ9hszUwWyCfibfl8wq6mESpgZH+MFLMBEijC7sXcCRFMHCWhJW
 rvGH36qpIbCFgmmMWeOfhrzjiUBefk45hzqzK6Nw0M2iOyIsfnGPYr79qhxl3k4HUwKW
 COlmcJ4XXGuuiYD2rpjHhrIFYWXpos4hHdUYb0NrIFKk/UcBMDNsHNJNzXhye0D0Z3kU
 gjlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=i/aiR4F2aBKPhSsHf4Kof8ApCmMrntWY9Rw5HJoo2C4=;
 fh=vJapJClIwLnI0RIDe5psFxnjAWGF4kP7322XyeP+TOY=;
 b=GS4P9zistUtjD6C7or2rVNmkzX8UT/gsjuzZRSCsZkIz8/l5aCv/7C7Nu7OwDtTBly
 06tZR3slQePB8bHHbXzDHoeVithck5OPJVVODk4i3neCPELbfGeTRCihfGe3hL+jxLB3
 M+t+GyFkQ5CbAkcrslOcblZ884VczlcvzUelsbLxNRvrownPnerPaBASTNJzcK+VsK58
 wPp82YEBd9nY0EiRmxvi1Q56wxa+osq+jUop9SlNtI6AT8KZ8ZXag+QJ10tGztnGIBxo
 c8NghAaKBysZeFWDLE7L1G1wsge/CTWqx7X10ScOFNopKoHIImHbdJKgG73TSwND+F3g
 mJXA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1771024294;
 x=1771629094; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i/aiR4F2aBKPhSsHf4Kof8ApCmMrntWY9Rw5HJoo2C4=;
 b=yosogk5CdmBGYuySDO82xyz7lMYwfODr5HiPhlaTwS+zoU0J3Xuz8jPohWw1zPEZ/v
 3kpvlQPc9HV5d3afW+cLEpSbOSfCZcu+Z2xF7Po68UpH6man2gBo0gqWIyF5Qo6l8+ph
 3t/uYnNL4K0yhrlTh1PDulGfGwElGjIXvJXww74LfFS/iXDhjSmf9XD3Ypqhi7sLaNj5
 cz9LypFtPQF6ZR8rHiCC62k2FhPTgQBHO8QRLcgehfK66lPWKk6tn4MooE5VH7GAZebB
 qWUWpiZa+lN68BUJxGeSqctzs8X1784mAeMcSm0q04D9BUevYCVtXeb/XqSi/TvO4w5V
 y8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771024294; x=1771629094;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=i/aiR4F2aBKPhSsHf4Kof8ApCmMrntWY9Rw5HJoo2C4=;
 b=cpJ66v6QSeYbloiH/DghSGr7I7w98/ibwuzYXzw2OrpeFDbbWvCI2wYfepitNCMu3k
 K/FJttZ9d/IsIh7sdL5nCK661mMC6ikqOeFERpEYqUqGhqXwSXPb8RktvV9exCwQdCP5
 Xn5GF/2ykFYGyycsQssHXYwFxfSYv1jAukloqDsONO+8M7xRnn212Fshx1H+gy9WtTxs
 1ub9vr0G8YhlKz7XnPuY28eUc9dg/K1UWOPRxWciEWYcoMkFWzG3GcvA8ignvLiucpsx
 +RR9gq0up7BpIWyyCCxXVcux+UuMvl8q2G9dTpHOKF4rP5L0HEkd6l2cfeLIheIJB/Kt
 KZzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVy87fBj7V/F46iSprnAHiPdsb984xQjw5ToxG5o8m9bRfUeCK9ztArXJD5uGB+VRKlOAwFOCuYbMc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDhYAUCTL9MYC3NE0JhKYT/AXFYk55zriHf7/u5zr71lpEs56V
 fr9bNSiqTa5bqvjmifH8I9YbahfyEYedg6elE2BT4v5pA5BcKKU66yCML/2CYNYvPjYZv4XIJiG
 wG30srycqM1YWza13j+qwe6iQR74kIl5qEg4Ea2qtYA==
X-Gm-Gg: AZuq6aJ9X0AkdGUBRBFSy/kVh1Jze0lxgVWp4NoB/9TzXAwuqFtk5a6rgzqnCgEq3Km
 WL5fxY1NuC/vlDMcp0zEKuYLDPxOWyAI8rJhh/NG+DVRUs1sbWr9VtZBdbxk/oQgwVXRuUjgNrv
 hD61sI4ysPKdbMhawTWaYsaoROF9gjMLJMqGcSMc8J6kjz5lMiIesgANuShcQiftUGl5liqTTr6
 Gr4izTLzwjuKjg+hMtKRF4Z5WU8Hc9ygRcNfXOfZcrkTCpkkFMOkrfN+Sw4B+QBQ47Mh3TQdVIR
 HvTn
X-Received: by 2002:a17:906:794d:b0:b8f:7aa8:d9a4 with SMTP id
 a640c23a62f3a-b8fc3a34ecdmr59186666b.20.1771024294200; Fri, 13 Feb 2026
 15:11:34 -0800 (PST)
MIME-Version: 1.0
References: <20260205-zcull3-v2-0-ac572f38cc7b@darkrefraction.com>
 <20260205-zcull3-v2-1-ac572f38cc7b@darkrefraction.com>
 <DGE036OEW8ZK.1PX0DRV8R9EVB@kernel.org>
 <CAAgWFh0zX=u7OZYq3QBrs0ySve897LXb1PN9QFzhYg0gtHy5wQ@mail.gmail.com>
 <DGE6O1OYR4F3.2PSFQLJ8XXJ78@kernel.org>
In-Reply-To: <DGE6O1OYR4F3.2PSFQLJ8XXJ78@kernel.org>
From: M Henning <mhenning@darkrefraction.com>
Date: Fri, 13 Feb 2026 18:11:08 -0500
X-Gm-Features: AZwV_QjvEdNIqn6JcsnMJ6QigGTIGx6XW3_NM1uKPaKIqIv3KZRLaa33eXNGZCM
Message-ID: <CAAgWFh0GyrSYeEJuh3xTLGk8c9ZmQoamRnvAvk-t-pydsKTZMg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/nouveau: Fetch zcull info from device
To: Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Mary Guillemard <mary@mary.zone>, 
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
X-Spamd-Result: default: False [-1.81 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[darkrefraction-com.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_NA(0.00)[darkrefraction.com];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:lyude@redhat.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:mary@mary.zone,m:nouveau@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mhenning@darkrefraction.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,mary.zone,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhenning@darkrefraction.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[darkrefraction-com.20230601.gappssmtp.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,darkrefraction-com.20230601.gappssmtp.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 77783139EC8
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 5:22=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Fri Feb 13, 2026 at 10:48 PM CET, M Henning wrote:
> > On Fri, Feb 13, 2026 at 12:12=E2=80=AFPM Danilo Krummrich <dakr@kernel.=
org> wrote:
> >>
> >> On Thu Feb 5, 2026 at 7:56 PM CET, Mel Henning wrote:
> >> > This information will be exposed to userspace in the following commi=
t.
> >> >
> >> > Signed-off-by: Mel Henning <mhenning@darkrefraction.com>
> >>
> >> For someone looking at this commit, this commit message is not very us=
eful.
> >>
> >> Please add at least a brief explanation of what the patch does and - e=
ven more
> >> important - why it does it. See also [1].
> >>
> >> [1] https://docs.kernel.org/process/submitting-patches.html#describe-y=
our-changes
> >
> > What I'm struggling with is that I don't know how to do this without
> > repeating myself. If you want, I can copy-paste my explanation of
> > zcull here too and then it will appear three times, once in each
> > commit and once in the cover letter. But that kind of repetition
> > doesn't seem very helpful to me.
>
> Again, the commit message should explain what the commit does and why. Fo=
r
> instance, I asked you why you did combine those two callbacks below.
>
> The commit message could mention this, e.g. it could be something along t=
he lines
> of:
>
> "Add struct nvkm_gr_zcull_info, which serves as abstraction layer between=
 the
> corresponding uAPI (added in a subsequent patch) and the firmware (versio=
n
> specific) structure.
>
> This is needed in order to not leak the uAPI layer into nvkm. Also note t=
hat we
> are bypassing the nvif layer, since ...
>
> Also note that we reuse the get_ctxbufs_info() callback, since ..."
>
> I.e. make it obvious to maintainers what's going on and what's the motiva=
tion
> for the patch and it's implementation details.

Okay, I'll give it another go.

> > Because of this, I decided that it was simplest to combine them in a
> > single call, which avoids repeated rpc calls to the gpu without the
> > complexity of handling partially complete states.
>
> Ok, that seems reasonable.
>
> >> > +     if (WARN_ON(IS_ERR(zcull_info)))
> >>
> >> What justifies this WARN_ON()? To me this seems like normal error hand=
ling, i.e.
> >> it is not a violation of some API invariant, etc. Also, this is in the=
 driver's
> >> probe() path.
> >
> > I was just copying the error handling that already exists in this funct=
ion.
> >
> > I do think these are weird error cases though - they mean that the gpu
> > was partially but not fully initialized which shouldn't happen during
> > normal usage. The only cases I can think of that would trigger this
> > warning are a kernel bug or an intermittent PCI link, which I think
> > are both reasonable to warn on.
>
> It could also be that the firmware is buggy, etc. In any case, I don't se=
e that
> a WARN_ON() is justified. Please use dev_err() instead.

Okay. I've now written this as:

if (IS_ERR(zcull_info)) {
    nvdev_error(gr->base.engine.subdev.device, "could not fetch zcull info\=
n");
    return PTR_ERR(zcull_info);
}

since nouveau seems to use its own nvdev_error() macro over dev_err()
