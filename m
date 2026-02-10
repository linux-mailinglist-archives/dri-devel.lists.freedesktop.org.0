Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOxiLjthi2nDUAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 17:47:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE3111D69B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 17:47:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B5610E154;
	Tue, 10 Feb 2026 16:47:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="h1VvAcxN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA9F310E154
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 16:47:49 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-b7cf4a975d2so155860966b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 08:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1770742066; x=1771346866;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xq2glYYScNf4+kjxC0lqaYJCS1j/XHIulxiFnn3Mqt4=;
 b=h1VvAcxNi5i7+L7dFXJwMAmbgqMQvW5q0U6jy5/ZBzHGxLUmLjnv/D+H05anmhX8vx
 kQBAfIyQEMEDrSl125dsceF800nlnNLzixyXO1dp1FAaZ0i3uWn6DvnxjLRRb5HzT4+1
 ye0mkHm9vbPIrowJ1EhMdy9HmFwWrXCXUNzbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770742066; x=1771346866;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xq2glYYScNf4+kjxC0lqaYJCS1j/XHIulxiFnn3Mqt4=;
 b=vNsqwpVMuXFpsvsRuD/tsAc5XQ9zAO1FTSJ18p18ZcSIwgYW8ZSlhXy+jJCGxjOHH3
 1ecS2/q2e9wNGmrrooubuvlrGGwo7hJkHy23VyvYCvdaDPOaek6Jf50X8zuVp9rYtGsf
 VIeKrqrqNjcSgwJ98N4UN0BZIXasJ8/JiGzSlOsIDYMwg2mRSLNR/RG6b4jthgPE3Zk+
 7+RQB7Rk5bzTNcYCxG8ZS0DsvzaSr66fKUqZ6NBrPvDjOtYRYORGAQ3qnluHgHWvRhI5
 0PrYN5VzqxndG/PSuoOXNAMBXBK6f83GNwoRAMxj7nY8mMXwZBIywTjDdP8zwv+3dxeZ
 d0SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLBTH9YJv3amzokReeAR2vSlLKxWbMA9tQQQbzD1MH7qH8Gz37IMIStORBAVrt+t7BORmBICYAdYA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3T3tOyAllCLWHz0mFdMwoPW8IPZUgnp9oVe9fYkujemHyPZNk
 CHpjokLIzAxRVuayGSy36PQpNE2Oxn7+TN3NW0Tw3rDlzNjSIL7HeE1fV8yWeEZ4qhpWx1C1Zqn
 S+3499g==
X-Gm-Gg: AZuq6aIqBn50g1ysGjTiVEZMPxFEi+lEtzpkV1c5gVm9+lHqQlI99Zxnhby06ur93hi
 bRQ3FRD34HG5NIWPpl8Zwzkr/wpSksDPHU04lGbkgLiduGVGv++O2fbXGgmGN1OzvmbT0hLZxQQ
 St0j8lRIRjBtLaFMXSjoLKt/qRM6zYwVXVjpRsSfpOj7GSWspdWwURWpy781i++TafO8bQqzlWW
 T/z1NWmo+cXJeM3zeq/2gMN7+63T+PuavUWw1jQ5vVMnwiZw8SlV94wIFhxJG/ZsGBONVynJiHl
 y6JZd84jxg2kREXt5DLVEI3Zyp8AaAyUF7SN6z860H67oAy6zzXXqzqfFxSfyACl/wYv6keHtKm
 eQ296Vb7n+jCtwVN3MBuAjqwY7Sfu2M/2MnUpolYsgpNmlliY59rmmp7skIyskGT56QaVDJcDD/
 Tl5MIxxPaqhOIkUeJ4bGbAy2FIf3dNvclx6NfG4PgujvOO8gwfW/H8iAxSMqDnXg==
X-Received: by 2002:a17:906:f594:b0:b83:95ca:23e7 with SMTP id
 a640c23a62f3a-b8edf173c00mr922470366b.4.1770742065755; 
 Tue, 10 Feb 2026 08:47:45 -0800 (PST)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com.
 [209.85.221.53]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-659840238f0sm4135671a12.31.2026.02.10.08.47.43
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Feb 2026 08:47:45 -0800 (PST)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-4362507f396so889231f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 08:47:43 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV3cix0htSA9ltlZGYs0BGIevFlGYIkWsQienefMbEyjbWWpEFzISvAQS6J81Pddq+X87gmvAaxDgk=@lists.freedesktop.org
X-Received: by 2002:a5d:5f88:0:b0:435:f29d:8c41 with SMTP id
 ffacd0b85a97d-436293a91aemr25295366f8f.62.1770742063267; Tue, 10 Feb 2026
 08:47:43 -0800 (PST)
MIME-Version: 1.0
References: <20260203044605.5890-1-chintanlike@gmail.com>
 <CAD=FV=U=+CvY2qPGWWwsde0a-OQuqk55QG_HqWSPCKZ-TP8Huw@mail.gmail.com>
In-Reply-To: <CAD=FV=U=+CvY2qPGWWwsde0a-OQuqk55QG_HqWSPCKZ-TP8Huw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Feb 2026 08:47:31 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W4p_GdKL50cz3hgSpntWJNCnObF1C6B8eskeVuRc+otQ@mail.gmail.com>
X-Gm-Features: AZwV_Qh3jDBKioU7R65dP6mTWC9izC1nIdx0VFnsJEj6uBkH_nwf17Ro87bKDj4
Message-ID: <CAD=FV=W4p_GdKL50cz3hgSpntWJNCnObF1C6B8eskeVuRc+otQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: jdi-lt070me05000: Use MIPI DSI multi
 functions
To: Chintan Patel <chintanlike@gmail.com>
Cc: neil.armstrong@linaro.org, jesszhan0024@gmail.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chintanlike@gmail.com,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dianders@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,chromium.org:email,chromium.org:dkim]
X-Rspamd-Queue-Id: DCE3111D69B
X-Rspamd-Action: no action

Hi,

On Tue, Feb 3, 2026 at 7:14=E2=80=AFPM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Mon, Feb 2, 2026 at 8:46=E2=80=AFPM Chintan Patel <chintanlike@gmail.c=
om> wrote:
> >
> > Convert to the non-deprecated mipi_dsi_*_multi() helpers per the TODO
> > list. This reduces boilerplate error checking while providing proper
> > error accumulation.
> >
> > Use mipi_dsi_msleep() and mipi_dsi_usleep_range() macros for delays.
> > Replace mdelay(10) and mdelay(20) with mipi_dsi_usleep_range() calls
> > using tighter slop (10-11ms and 20-21ms respectively) since these
> > functions aren't run often and don't need large timing windows.
> >
> > In jdi_panel_off(), reset the error context between display_off and
> > enter_sleep_mode to preserve the original behavior of continuing power-=
down
> > even if display_off fails. This ensures enter_sleep_mode executes befor=
e
> > GPIO/regulator control, which is critical for proper power sequencing.
> >
> > Signed-off-by: Chintan Patel <chintanlike@gmail.com>
> > ---
> >
> > Changes in v2:
> > - Replaced mdelay() with mipi_dsi_usleep_range() for timing (tighter bo=
unds per review)
> > - Switched to mipi_dsi_generic_write_seq_multi() for cleaner varargs sy=
ntax
> > - Applied lowercase hex notation per kernel style guide
> > - Added error accumulator reset in jdi_panel_off() to preserve power-do=
wn behavior
> > - Kept final msleep(100) outside multi context for safety
> >
> >  .../gpu/drm/panel/panel-jdi-lt070me05000.c    | 105 ++++--------------
> >  1 file changed, 24 insertions(+), 81 deletions(-)
>
> This looks nice to me now, and I think it's a nice improvement to the dri=
ver.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> I'll put it in my queue and plan to land it next week unless someone
> beats me to it or has additional comments.

Pushed to drm-misc-next. Thanks!

[1/1] drm/panel: jdi-lt070me05000: Use MIPI DSI multi functions
      commit: 857e2d886ad32d9a49fe99fd06bd78f4354043f4
