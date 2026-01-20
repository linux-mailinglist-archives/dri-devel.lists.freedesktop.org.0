Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPs5IU/4b2m+UQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 22:49:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C1E4C88E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 22:49:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F1010E11A;
	Tue, 20 Jan 2026 21:49:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="BszYZtg5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3218B10E11A
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 21:48:59 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-6505d3adc3aso9248506a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 13:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1768945734; x=1769550534;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uywpCcOl3gnCRmtjGmJJnBGjcZqidvXnsvfeIDvMl1E=;
 b=BszYZtg51wBarSGiKmEIueg7ngFOHZFC3HDMf0Itc61+vnHUX71tle0w1/bLoIMQpv
 CsVrOb1t30Ua8mdUZLEP9Lwxg/E+dH156W8tlkzu8u4G/mOm61P9vBQlzjKDP6O3U0q+
 YUZ+YFArDn6o4VK3nzJ4jQo+yOczLCLc4SaSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768945734; x=1769550534;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uywpCcOl3gnCRmtjGmJJnBGjcZqidvXnsvfeIDvMl1E=;
 b=MM6H8h2NwEeBr8T5pVBy4iRjgyBi6lJRAukMjAAD+C7FMoWZONoZ1xS4ZkWfFCEm1y
 lFsapS59LSl+HRgb29gygZpfTcOuybyZgRn2pNsT2EmTaGU5ea7eB8MCkOPJWORyFbmx
 Fstb1iw5GfgMT/Tv08kt0u/95Ogtkl1K/RyaTLbPtvkq4plZeLC7LkItXkkjckh2OpTY
 6DNVlpvP/g5BvMOwtf62NsgSM35vicmsnizmsHXiHyI7vnHS+QmF9mNVJBVGLjIQxKre
 DLJMFii3Qxq2SeB7gM7dkCm8J7YvOht31RIs37x3OXoh5FQwblsAkP7xibrhdIHOpJcb
 nJuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgd8k2EO+0zdVf/UYBMj+1sn3767KSP8QOSHixH7udiz6Jr6aDIuytjGXO14VwwPVOboHx7z5Dj7k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRTSOawFcaARILIKQ+CEb9gDGHsAP5Omnca7P0a6nzCdqDy78c
 RJXKAi5V+76y78h4Kq6SxpWXegU4WLCUlVEuavNIjqY9Uu0s4YNePJh0FJ1CWKKCVYram+4k3/O
 YkvQkUCah
X-Gm-Gg: AZuq6aI30X/DYlpPgUYpPMUftVgtZJLe3vDlCKx51GfRFnXSeH1iisoLm4hePZWuwVY
 uKee+/qnximU8AwhqvBv0bLmwOTgN9GuoPmUFMvRV44YKyxnREBJqCGTQ0Bj219tPhdHl4TCmWK
 nIF578Sz7PafLBdvnaT6tV4hH04udhAKgwSPcZfUoWS8Kc1l618DKj72HLX14r24sx95tGBoell
 epEsediE3pFgP86OGgxYHKA4rbFegK7XHq5UZrcP5iP6Sc7RkhkapCpTEY+9k4zWa2AYI+sRtgY
 U1UVUn5sy93HJYvcUfub4i8gQk1dm+KrPzJUQhjE5TpX8E1OkAya8UWg9uxUS9rE2zOQdAE/ddL
 eh8IVX9TxisBfHaN+HhUnXDN0wFjKkBKkYQ7wiI5phkFLM1P51m/NOscRlobLccXvRU9ADWEj9p
 P22ZniKlj3Yx/TzzmBGV9rfpUckfekE4KH1SIr4fcnKrZ+iveQDg==
X-Received: by 2002:a05:6402:3547:b0:64c:9e19:9831 with SMTP id
 4fb4d7f45d1cf-654ba1c92e9mr12189931a12.12.1768945734397; 
 Tue, 20 Jan 2026 13:48:54 -0800 (PST)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-654534c8b7fsm14471979a12.27.2026.01.20.13.48.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jan 2026 13:48:54 -0800 (PST)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-47ee807a4c5so44541775e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 13:48:52 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXu+h24PbiP4tCA2AODObd3gm723isHJBYVCpPO0pVoBa55vEV8hiqG7t5ezAwg5mpU4voyxOkTAy0=@lists.freedesktop.org
X-Received: by 2002:a05:6000:400f:b0:430:f41f:bd5d with SMTP id
 ffacd0b85a97d-4356a0897f0mr18898399f8f.55.1768945732512; Tue, 20 Jan 2026
 13:48:52 -0800 (PST)
MIME-Version: 1.0
References: <20251029-mailmap-fix-v1-1-8534ffa12ed3@gmail.com>
In-Reply-To: <20251029-mailmap-fix-v1-1-8534ffa12ed3@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 20 Jan 2026 13:48:41 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VPdf-X7HzCFTOKQATZpcgDXpMTXGQyTCAV=y_xr9pD1Q@mail.gmail.com>
X-Gm-Features: AZwV_QjaxP26eQTw4--8Qze5CTzgWoVmspYP5DVKJyJ5O4LuAjSnwcQLfdJ3TgI
Message-ID: <CAD=FV=VPdf-X7HzCFTOKQATZpcgDXpMTXGQyTCAV=y_xr9pD1Q@mail.gmail.com>
Subject: Re: [PATCH] mailmap: Update Jessica Zhang's email address
To: Jessica Zhang <jesszhan0024@gmail.com>
Cc: neil.armstrong@linaro.org, lumag@kernel.org, robin.clark@oss.qualcomm.com, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jesszhan0024@gmail.com,m:neil.armstrong@linaro.org,m:lumag@kernel.org,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dianders@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:dkim,mail.gmail.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,linaro.org:email]
X-Rspamd-Queue-Id: 36C1E4C88E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Wed, Oct 29, 2025 at 11:31=E2=80=AFPM Jessica Zhang <jesszhan0024@gmail.=
com> wrote:
>
> Update mailmap to point to my current address
>
> Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Jessica Zhang <jesszhan0024@gmail.com>
> ---
>  .mailmap | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Pushed to drm-misc-next:

[1/1] mailmap: Update Jessica Zhang's email address
      commit: 6cdd8b58458941ab4c0ffade957db8dc773fd91c
