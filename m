Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCaaNqmicmkOnwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 23:20:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C346E1DD
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 23:20:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0FED10EB05;
	Thu, 22 Jan 2026 22:20:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="0sbmYxOO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0CEE10EB0C
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 22:20:20 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-64b92abe63aso3290278a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 14:20:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769120419; cv=none;
 d=google.com; s=arc-20240605;
 b=lk7Hszkjtc4qHTjgeXwHCGSIa0mqAWSR6Sn/4FdqbTuTNjy2JQmh5pBRxSWaTNazxT
 uHBYzTyXWB0n771x7MPSskBJnFxQ++mmq+fqxc5CxeuTLrEVh1Fx9kuBMelNYnidSCUt
 HszGSAUG7PQ/L50TyQFt9cklG8iPJrvaX0YU4mFfXwXqk19yNRETBbBHb+sz2+6hyDEx
 l2U+tfdpiAJFf4KaqVLhqDFyiagDIXV0OGGcpi366nnLqw4JzNoZPAGo/TIB8N3Txzza
 0ctRq3J9b9eCIUSv/bb8s6XDaxF1RcLN22M+Aqtku0XGFQbUdTvtcAZXU/VGnoZJHVb1
 GHNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Pt2D6O33Ey4hyzRS6eetgMJ/Hcg5n1cbhI+usjAqh7s=;
 fh=2dmh0iBV1twiX1VeJvztNZLysdOQUdkMhIBX8wFUfjA=;
 b=MLdHIJp/joVMrOBPOP/HgQXqgVHRefcsiiNjytfiom2C2aEW2eFYHKEHESUEpv/hXr
 4mGFWBap7auwSIrw/Ww+QE4+WI36gC/shv/fmCivhGfIj/SOaxDKocz0XB9Je/+Dy2qH
 bBFMUIrh5Dr2MrZQvuavHcHZtdmZLsF1agThoJUgTM3TAR5Xae/HEp0QX6h+4KnbXzfl
 /FJmRSwe8/WqBBzVoIP6bZ+gio0Ho+nEO3YH+K44eyDOJVCYIsqRWPfWGBX0WXUI2on7
 AKkjDUH2xGdgKTjkd8OZbJrfuxaosq+C/1CcR6ErvGUsvGZskJ13/UJ7bAUUuO6LCQiQ
 xvtQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1769120419;
 x=1769725219; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pt2D6O33Ey4hyzRS6eetgMJ/Hcg5n1cbhI+usjAqh7s=;
 b=0sbmYxOOyeIYo65aftEHH6WUVazgzZCUgh3yK5PXFRt/AaC5t2ttYADZ+75Lz6VGfI
 FQ66rlhLEColbBlk0kJqA6YZnyYJw3BzC4ccTqiOfD1ty+H5IXQHr662aaH4Qso9KWi+
 HFFkgkDHqeed9PoVwXVIwAtw1iQjO1UlCAuPp3gPXXvtRoQZM0b3sLMgHLfEaGdWiPcf
 EHUQ8TJXJYioOlZ6ZIjYf2ZALTK7ygIVOpuJrmZ7X38ISmO6KH+J7wrNgvSrMPtgcSGz
 MYO6/9wgdlmyaBmvMI4/pK/JaOnA6tvYBpW112RFo1FAGG0uqyJbEvmojYVJZUuPzFz1
 LpAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769120419; x=1769725219;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Pt2D6O33Ey4hyzRS6eetgMJ/Hcg5n1cbhI+usjAqh7s=;
 b=R++YCdVcU0Q5J4x5xGaN8/HuZLr8Ot27Ghnja/2ywNQN/BtANXSSfj7DD9v9aogfbY
 jaui/cprL2tn8NYvIqkkFGTQ7smxToeFEP4xxvZH0QLnt4vQ7Ug4DWCxvIuYdyW2ZDAi
 vGCUqHIfJ9N2xKdtrvFRMgAvrWYiwmOuWc+vYMtSjXmbDzMnbp/czobpI2AxU4TjAyAj
 WUFEg5wFA/cas2/YxkEe9oCCwEwWIHTq/umr8W2BhCgaUjTHC0qJPfdWdsMPvcAw+nsY
 PIEyrm5c5Leq+NbN/fh48DlP22GVLXDcMlNZX9hIhl/vuKUKT0mCoVoa57uE1dV/sAsE
 fbLA==
X-Gm-Message-State: AOJu0Yzd19bNOC2uhPC2Mpyy9IfPmy+8743Jw58+GhDhvbknIk3//Rv8
 nDctPD/V9zipsYqfiEg7/9mcsqIKcB3oe6wMNwqDSLB+LakfsTw68yHKg5ScNKPqTap73LwEksm
 9YvyJGkXgcsNCurcYn7jQhyY4a5OubrA9AjVylPc6eOLg+nnRgMsNNc4=
X-Gm-Gg: AZuq6aI5beCx8kEObrV1JANZX5itbLtE1Sq9j3jaMkuZknpVyNa+JzUJ+0Vt8b3nzy4
 6vYcM4s6oE13XYHXyfmz3rSuxgS9p25nymbWdV0hfwXw6QTSJ+t6C+sEOry1f5UIaEpqe0kODuf
 iUV/SgtvnvWESA3oAoXorbvKK2ZQeivCCuwBTaHupM/s0JVitYmXL0sYGniqmACs6ey1LGRMzkx
 OPQBC/kZtb3ZJNpmjVdKa2+/dla7CPzUtuEdekf5dXEKZsq2ZLySgcOtugAjWhUBVHcphNFzLgv
 NhsJVCs=
X-Received: by 2002:a17:907:944a:b0:b86:f194:9ee9 with SMTP id
 a640c23a62f3a-b885aceab72mr45582766b.19.1769120419161; Thu, 22 Jan 2026
 14:20:19 -0800 (PST)
MIME-Version: 1.0
References: <20260122202834.414058-1-airlied@gmail.com>
 <CAAgWFh0WMK5Kj-nUDeRXnz-U2+wPY-zh3uw1yAi8==SekQsPmw@mail.gmail.com>
In-Reply-To: <CAAgWFh0WMK5Kj-nUDeRXnz-U2+wPY-zh3uw1yAi8==SekQsPmw@mail.gmail.com>
From: M Henning <mhenning@darkrefraction.com>
Date: Thu, 22 Jan 2026 17:19:53 -0500
X-Gm-Features: AZwV_Qgkt3gePxjDhIM1U8PMFJ5cl6UPTvkYH2N8sWtEvEAz4GH05YxXtQ05dEQ
Message-ID: <CAAgWFh3nnDgEFA4rR5=9r0ko_xUvx0xJL8UvsPNpEzSae67q7Q@mail.gmail.com>
Subject: Re: [PATCH] nouveau/vmm: start tracking if the LPT PTE is valid.
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[darkrefraction-com.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_NA(0.00)[darkrefraction.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:nouveau@lists.freedesktop.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mhenning@darkrefraction.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[darkrefraction-com.20230601.gappssmtp.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.931];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhenning@darkrefraction.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,darkrefraction-com.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 45C346E1DD
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 4:48=E2=80=AFPM M Henning <mhenning@darkrefraction.=
com> wrote:
>
> This is meant to address the MMU faults reported in https://gitlab.freede=
sktop.org/mesa/mesa/-/issues/14610 ?
>
> With this patch I still see faults when running the test script I posted =
there.

In comparison, the top two commits from
https://gitlab.freedesktop.org/marysaka/linux/-/commits/1b985166eff68681922=
6e3515534b51b66283734
do fix the issue for me.
