Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UARWMvHLjWn87AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 13:47:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEB212D85A
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 13:47:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38ADB10E25E;
	Thu, 12 Feb 2026 12:47:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="shUD9Kt5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7506A10E25E
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 12:47:41 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4806cc07ce7so30968205e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 04:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770900459; x=1771505259;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NKYheizEjIwbgAq1ciyg8mcQ3Le2jvMLR6sdbCSesTg=;
 b=shUD9Kt5/Ts9uS4nEfcrvTrz+RHXkiWw5bonhHndKMvWC5QHkWpX2/vxNBiE0+2RHc
 Bb+t0yQyn5ALIngShVeAEftsOzYkIEKrEczr41ea0jLc4jasSQfGlooaEbmePTFxbxaH
 Kx/mQtzVZtVbIFiQVfyNJHBHUtxOmB2ZHtiuct+p5sJK9G5BQNyy8ec+XbIh1th4vf4o
 FSRj2TPAm1/xBLNdCtLvGHSA1EAWFkFdCm1xfTpqmDjgMxDYrAkdTmXtQF+hmKq5LK9Y
 eMRvLx1tThzsXFsPjnozZClgF0DV5rYigViS4JLJGzVcp4GiXyLG1AIJz5DlDo3lD6G/
 hb/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770900459; x=1771505259;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NKYheizEjIwbgAq1ciyg8mcQ3Le2jvMLR6sdbCSesTg=;
 b=ZaUe3J6lwyw/2xYElK9Hra/SXnXyuAAHUBmz0h1jdaUhIj3MbREJwB/dQ1CmUvnHFS
 7jO2rI1Te/mS7+vEHzl5IK/nf2O5983IDSBc9zKD0RLMFsFFUCvI5CkH+oiGqu22GX7C
 BgO2EZG9EFKSaXWSAAyfcbhL/sw/rKKTnNyD8pNcwj0mAXN9Jc4u1aSItxpfQdKVxEHC
 BFMwZHrrdRO9FoB81OWPBsBAVagGAZKie+I9RScD+cF5Y6wTOfwe6P3t+I5CsPClNRoI
 Omv4ZGg5FKtU83D+aijJ9QjKtL0rsE/6+WM1AgLIHhS8qdcKyVapUk+vvQX4TTVVuvH2
 /z1g==
X-Gm-Message-State: AOJu0YxEwMKNmp4lPYsHmq7pR7dBZntuQB4PkXm7veMLh7u0VB0FPy6c
 FjaIAF8hCPWvHCk6oK3hJbe1pSXlcxLrVvcx80vsH8W7XDgW+4DG0mCj80c6EKr3ZXM=
X-Gm-Gg: AZuq6aJrQR+xMuyR3DQF1nkXDUCIe6QEOA2TQkBf7ZcoH/4QkZVKXYwwgXXZLWOur5B
 4EjdkR3QOjpFeKPPxYLPLVPGibFBbgvLYYJKQP0bIpGUxg5P01c1gbPgP2wLUl5jXZSJ2kcb2nK
 IWRwxluzM6yFbXXCII/JGl/VC6NPMT+4CXulLnyWtYnJ4HnXu4PAlFeLJqUahAs7z1yIgXhgpgG
 cn13yZ4W3mnT1H66w9DukY7CjN7G9IDjFWdqzPnIfSLYiW+5LE7B6dMbTEYr8sH9Nt2xrQ3+VJV
 zv305+Me255SQJj1Ogyv6P1tXXzgOjtJ9FE0Uq57VDQ1T9Oh0ReqbkuPa2mwfpP70f8A095LHO1
 vQtOuWy72sDT3ICtVsErnTY/jTkJ35j/kgmNht3pBbHxkVKnZp70Qw3SKyq+ud6qixGScOSzBqc
 +jrOP2oBhJtPIq4OM3PW5BfJcxAVpKW4g=
X-Received: by 2002:a05:600c:c08f:b0:483:6e32:50d4 with SMTP id
 5b1f17b1804b1-4836e3250ddmr10528405e9.18.1770900459374; 
 Thu, 12 Feb 2026 04:47:39 -0800 (PST)
Received: from FV6GYCPJ69 ([208.127.45.21]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5e11f5sm183250905e9.4.2026.02.12.04.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Feb 2026 04:47:38 -0800 (PST)
Date: Thu, 12 Feb 2026 13:47:35 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 Sima Vetter <sima@ffwll.ch>, "clm@meta.com" <clm@meta.com>, 
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: drm AI patch review hacks
Message-ID: <s6uh3wrpx7qce2yz3u5oqad74nx6gkpyudragrrpxgfgoyuyrf@umajisatpsv2>
References: <CAPM=9twmmLhc-DJV2hFKJ1kahzxRUY5j1cLH9JjZ33LEjjBNbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPM=9twmmLhc-DJV2hFKJ1kahzxRUY5j1cLH9JjZ33LEjjBNbQ@mail.gmail.com>
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[resnulli.us];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:sima@ffwll.ch,m:clm@meta.com,m:torvalds@linux-foundation.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jiri@resnulli.us,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 1CEB212D85A
X-Rspamd-Action: no action

Wed, Feb 11, 2026 at 08:44:46PM +0100, airlied@gmail.com wrote:
>Hi all,
>
>This came up at kernel maintainers summit, so I've been trying to see
>what I can piece together, and have a small demonstration that may be
>useful to some people.
>
>I didn't want to pollute the mailing list with AI patch reviews, so I
>decided to set up a public-inbox that the reviews are pushed into.
>This isn't currently automated, I'm just asking claude to pull the
>last 2-3 days of patches and review what is new every so often.
>
>The workflow use lei to pull mails to local PC, use review-prompts +
>my own prompt to try and review a patch series, both as a complete
>work, and per-patch reviews, then create the reply emails and put them
>into a public inbox git tree for publishing.
>
>I've no idea if it's using review-prompts properly or at all, this is
>all very vibe coded so far.
>
>https://lore.gitlab.freedesktop.org/drm-ai-reviews/
>
>This is a public inbox, you can also git clone
>
>https://gitlab.freedesktop.org/drm/ai-reviews-public-inbox
>
>I'm currently just using my Red Hat provided claude with opus 4.6,
>until I get told I've burned enough money.
>
>The list below are the patches with reviews, if someone wants to look
>and give feedback on whether the reviews for their series are useful,
>find any bugs or regressions, that would be cool.

Overall for my patchset I think the feedback looks pretty much accurate.
What I like is that is even considered the email disscussion about one
of the patches. But since you ran the AI one-shot, does it make sense?
The disscussion may evolve and the verdict with arguments may be stall
(not our case). Eventually when AI-re-run after every reply might be
needed, in that case, better to have the output publised on
a continuously updated web somewhere perhaps, not over emails?

[...]
