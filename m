Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPaTHDz/hGl47QMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 21:36:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 149D6F732F
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 21:36:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC5910E07D;
	Thu,  5 Feb 2026 20:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ihtp1nn1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com
 [74.125.82.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4862D10E07D
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 20:36:07 +0000 (UTC)
Received: by mail-dy1-f180.google.com with SMTP id
 5a478bee46e88-2b8095668ebso145470eec.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Feb 2026 12:36:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770323766; cv=none;
 d=google.com; s=arc-20240605;
 b=KhFhIBuiE/wqJ88TMiLoU6nRQazRuorzX+nNtt9WLURyEUUlP3noyjWKftjjAr1M/v
 hh4W6lyRJ/M2LIx0xDlUfU6lbbMP7uUkwlbvumxnv2BqkytcWrXdhEHdEh7XzrvVsOnu
 R4wQfUhhNmOcmNrFnpoEZ8bVYlMHopygPmw56TqggpBviMaUTrTwcxMe7CJ2HkgP5SAv
 S5zThc3F3yPNr7QtBPNT6/ewCHCl7ON3Pd4ttuWuyWFjuIYPzAA5vjhzITL2u1Qj1qIA
 tY8hpt0UAjXs/rAJRwV64TLFQGEe3f8dT5x4bS+59ma4uHdDJ/w9ZwgjqDf1wGT2e0cZ
 q4nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=8sg36/JtdND6msAPPdYlPI96hFkd7iJTiHGCCYDl3uU=;
 fh=rjVvUH1c+fpPDZRMO47Kmkq3k2JIowZDvcRPFEz/8JI=;
 b=dyKLacc4bgyVdXwtaaEx3egUxzCLVJzedzodGz6s1B2lPXPp+wmU+3j0QSVxN11VxK
 8DVfXnULwXNgcsdrRlnTTlWVebtkPy5QZtxvEBcEOjVQLt21GjNDWfia+yx8j/fljoWj
 J8cp7JJ2GM+FJwoatHSv7b72QpiZ8wQXN56FXyhgsYZo7xQ3ai/cDIra1enyES6aUtb3
 IbKwOpilEehSMDX6DxoI1rLTUn6vfmpM1AMCihW8m3PfhMSYtMpjge8lbacvDVSnwzHe
 gqe8q4uintl5S05SVM8y9Jer5HSb/UZQkiEG6SKumrpqdTLzppWIlQex/qOWDBPTypAX
 oQ6A==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770323766; x=1770928566; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8sg36/JtdND6msAPPdYlPI96hFkd7iJTiHGCCYDl3uU=;
 b=ihtp1nn1avg7zWXPt+PqKoXTHq4mr9TxRJUXfaHkW0Pj5HZAwTY+RAdDfp23XPtlsg
 ISmtxwm0hKle96YsHhcqx7bHDmm/QXgh33Lqt0PbxZXc1Ww3oI8pohd1XeaK7XnfbL3p
 pAzfa6DX0HbBk+58IuNlfMLvnqRFLzUJw4ySIpc0F/ja/unwCCpnqFD/QerbULr/QkXr
 rbsr3dc6K/ADxZfMqVQnhiS374vRACJyCAAmu4L87xW2fuifCzq8NLbXlhsyQACQZIcL
 IJP4PyczR3DiuALIgjvwx4aktx9sp8HX8K5zV7ybvyXUSPWrSirCYehfCEIBW3u3JU7U
 tO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770323766; x=1770928566;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8sg36/JtdND6msAPPdYlPI96hFkd7iJTiHGCCYDl3uU=;
 b=OHcsgy4Cl3UpVbo9bN2gNzt6xiDbxzb9ZKJPx+3OFCKbY2jAO9ZOTMTeR4YAY4QqC+
 ldD5d2sOnhLhvtTBJVtTRQNfZFNU7raAdFbXzRIWMsFVOgakrvPKBD9MeA7ANIVaW+bB
 jUWqAG1jB9Vy9t8Z+2v5qEJI7c230B6ugAZ8jflsBr9HYUyVDh7gJOnlxRJGMtjdPrqZ
 GPQKcxkDk79zyFICIvs4EyYnPVnrkB5eCypBE4bmqKFE7rRPLfUqtcW/x2Eeya6E/vzH
 g9tzef05K1ROw6SdVzWkuYT54u529LisRuJJYuE0SyWXkBKteOWaCGzJMIkz2wgvec5/
 aFfw==
X-Gm-Message-State: AOJu0YzmLdI/SagqM0kkj/eZa9GcpQFjD0uK7W55ZpszqXFm3YQomz+0
 5PzaNyo5APJW3gFLJSxEXOTm8ilukWqIx44tnRKOrCxuzwE0yh1yhfiu73O1Wm2WawKd6jcPsfu
 z6ySyMxBav+VEgdgLpDCcBnvo2lrglmY=
X-Gm-Gg: AZuq6aLYf1etYvi3xcHhAsRRtMwCz+YXGwNGtfVFgB/5Dhm7RIJbWMmVKG+8lQu3QTb
 iVs4jnLBayR3eCMnjl95pW8i9HdHXKFowooQulKSEC8wKQ319M5by+65KiUl5QAaU+lG91VgCxU
 BFLINs8YbY4oNQUA/H4K1tlaFOS4p9kxxLT1RRp+LETD27IbhagY3JYRvVNJWE0SP69ti9wclN4
 1SEzYh5lhFcstxoU704tCOXP77fqTvYiMC2y9W9SeUGa0rX40pa+naXmYHSwDZzhtNbCKoP
X-Received: by 2002:a05:7022:b85:b0:119:e56b:46ba with SMTP id
 a92af1059eb24-12703faaee3mr117614c88.4.1770323766367; Thu, 05 Feb 2026
 12:36:06 -0800 (PST)
MIME-Version: 1.0
References: <CADnq5_MTX8CifP25UvE5kdMbCYxgK+A+KGdd-_Ef1m4VYv+WRQ@mail.gmail.com>
 <4c5c0981-fa21-4d8c-b5ed-45ebaf4d713f@gmx.de>
In-Reply-To: <4c5c0981-fa21-4d8c-b5ed-45ebaf4d713f@gmx.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 5 Feb 2026 15:35:54 -0500
X-Gm-Features: AZwV_QiuA1ihJ1g6ZIdAxBVYPzrZAhYftlE5C901IGgEioUs1d7NiosUg3iKc2s
Message-ID: <CADnq5_O1tEQB6whcAc4C=u5QN4-V1KOCDAM3dKepgt+RYcsjig@mail.gmail.com>
Subject: Re: Accelerator/GPU top
To: Natalie Vock <natalie.vock@gmx.de>
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 David Francis <David.Francis@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:natalie.vock@gmx.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:amd-gfx@lists.freedesktop.org,m:David.Francis@amd.com,m:christian.koenig@amd.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmx.de];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,gmail.com,ffwll.ch,amd.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gmx.de:email]
X-Rspamd-Queue-Id: 149D6F732F
X-Rspamd-Action: no action

On Thu, Feb 5, 2026 at 2:25=E2=80=AFPM Natalie Vock <natalie.vock@gmx.de> w=
rote:
>
> On 2/5/26 19:58, Alex Deucher wrote:
> > Has anyone given any thought on how to support something like top for
> > accelerators or GPUs?
>
> top for accelerators/GPUs kind of exists already, see [1] or [2].
> Clearly, this problem has some kind of solution (looking through the
> code, it seems like they check every fd if it has a DRM fdinfo file
> associated (which is indeed not particularly efficient)).
>
> Maybe it's worth asking the authors of the respective tools for their
> opinions here?

These tools use the existing interfaces which are available, but
require admin privileges to display the per process data for all
processes using the accelerators.  That's the part I'm interested in
solving.  For example the drm client list is admin only in debugfs.
Could we add something in sysfs which anyone could read to get a list
of processes using the GPU?  Presumably this was done for
privacy/security reasons, but as accelerators become more general
purpose, I think it's reasonable for users to see how loaded they are
similar to the CPU.

Alex

>
> Natalie
>
> [1] https://github.com/Umio-Yasuno/amdgpu_top
> [2] https://github.com/Syllo/nvtop
> > We have fdinfo, but using fdinfo requires extra
> > privileges (CAP_SYS_PTRACE) and there is not a particularly efficient
> > way to even discover what processes are using the GPU.  There is the
> > clients list in debugfs, but that is also admin only.  Tools like ps
> > and top use /proc/<pid>/stat and statm.  Do you think there would be
> > an appetite for something like /proc/<pid>/drm/stat, statm, etc.?
> > This would duplicate much of what is in fdinfo, but would be available
> > to regular users.
> >
> > Thanks,
> >
> > Alex
>
