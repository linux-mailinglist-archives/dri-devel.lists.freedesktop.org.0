Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YE8JKVzWgGmFBwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 17:52:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABF5CF314
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 17:52:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4C310E2CB;
	Mon,  2 Feb 2026 16:52:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="U1F05f8G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99CE310E2CB
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 16:52:40 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-b87677a8abeso709112866b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 08:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1770051156; x=1770655956;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=enDw9LkM3CdlAH4/IbRE0pQEHAl9HYEyYit2vG/Lo9A=;
 b=U1F05f8GQ/7t/RyKt/WOBdCJskj5ngEGlziFAOafhBfYr8+2/YHCOL4fJHo+9yL2f7
 jDx5PlP9ZlvRsZGqw/3v13Q3lwCN7l9Ls3hgFLNJYNx+dDu7taQCR4CAJZAQ5u6Bkh+j
 BCjXQajN9XrbvIRvOZLOmVEaC7ntckjAoOhWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770051156; x=1770655956;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=enDw9LkM3CdlAH4/IbRE0pQEHAl9HYEyYit2vG/Lo9A=;
 b=mtfnpIpMYCdH9Txm8HU5GAsuqi0doYWruFz2MUAJFljH+f4MC3GY/mvkHAvBhn6gJd
 skAkhPL2grZInUk6qMlzIGpSg0+cIK6xVx2iQpBnce1A3EXmQZ4noNaXtY+CQgRnB6Hl
 Na6VJGX7wK6UEJMtrpgG+xOsYPtA8i/beZv3gEMvGp3JsGXHlOSVfxmGM4gZH2Wr0yh5
 OeeV0Y8X+y3D5TEVPh8FuhdHKijlqy+4lNKHKf0mfQMeTZosSoQMF4h/lLMMhyqlHPk9
 cXrbcEUfy5PZNyClRC0keFEJRN0brzIhvCOkjuzNfVGVQh+e3lbNEtY+3boQdcpEBhkV
 xkmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+kEVMlsW+c/e3+jcc7Eaw5TfeUuf6eC9S6I53nMHopFrgDgR8t2u4PMR9nQj7xbY0KrQ4pBlA3/U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEGEwXBtOyiner9zXfGkBDegvmxGohFomZLU6nZmDYbiZTWKfx
 z8eS0tgXb78l3psmz7KjJ1EJ2oa6jzb3j9guIf0cWw3jcJEXA7AivzXOPGoeosJYfVruwwHoAJB
 kRvqFcA==
X-Gm-Gg: AZuq6aK396hmqwmWw4aFWVENXZLxyc3Al2H5+AlGU9nSnIpp1B8OilMZHjypDxRwyfm
 cY8ZjcLTzsIYkYUeUo7BHUAiQEIh/szKDSID3vUPPCJl+n84czo1ka3sLG8q0Kf+JZjkko+5NTy
 WBjMncKRYYT0tFtIv+SE23Y4G+Aup7g3Ds/O6L/BVv+VE4caEJu1clGC0LZtCUv1788CDHNjr8I
 GkyMvBuXuIQKGgcBhHhfGBGTBYuQGVjQL6+sSI9SMOJUpY1H9afJSfrd1qgY6thBgjYe0QYi08q
 c9RBByTxfdLI4plu2xpAAtIM3v5NeIp+7xqF66J9QE3I+3RpAvz/cfo7H/02ALsLyiQ5CVt2YnD
 ZJds1RCYiPol6o1pC2uD1cR6akDrGnDgZi01jkG521izp21L5Bfz55YTvMoVHzwqMRygtVr8cJD
 SJi0/WrffnkK/Fq1zj9kptiizR0/LCV6Se3K4tR2mG/F5c5JZBOA==
X-Received: by 2002:a17:907:948a:b0:b87:d839:ae8 with SMTP id
 a640c23a62f3a-b8dff6f6b06mr719507766b.54.1770051155758; 
 Mon, 02 Feb 2026 08:52:35 -0800 (PST)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com.
 [209.85.128.47]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-658b4256a92sm8085894a12.5.2026.02.02.08.52.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 08:52:35 -0800 (PST)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-47fedb7c68dso48574695e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 08:52:34 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXWalPgaYbUAi8rWKGzGnewASckFM3NG62SIIEkUX8JkttFb2HnigYKSWF2U/1xRqRCEgMXOY+Qiaw=@lists.freedesktop.org
X-Received: by 2002:a05:600c:6298:b0:480:5951:fc1e with SMTP id
 5b1f17b1804b1-482db45fbf4mr163945605e9.11.1770051153710; Mon, 02 Feb 2026
 08:52:33 -0800 (PST)
MIME-Version: 1.0
References: <cover.1769191673.git.robin.murphy@arm.com>
 <c7f6f75d55a4801eab63a0dc81d14ae27866aca9.1769191673.git.robin.murphy@arm.com>
In-Reply-To: <c7f6f75d55a4801eab63a0dc81d14ae27866aca9.1769191673.git.robin.murphy@arm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 2 Feb 2026 08:52:22 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XCK1RBgdxs07aHgowNvCSm5-+oUVZ3HcMVWuKwW4ggTg@mail.gmail.com>
X-Gm-Features: AZwV_QjXmR-vAYYsukd2qlxBElYKsT5Nm3boXnLH7lvnRNqLj3lt-cXAEK2VGP4
Message-ID: <CAD=FV=XCK1RBgdxs07aHgowNvCSm5-+oUVZ3HcMVWuKwW4ggTg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: panel: Move FriendlyElec
 HD702E to eDP
To: Robin Murphy <robin.murphy@arm.com>
Cc: heiko@sntech.de, neil.armstrong@linaro.org, thierry.reding@gmail.com, 
 sam@ravnborg.org, jesszhan0024@gmail.com, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
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
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[sntech.de,linaro.org,gmail.com,ravnborg.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dianders@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.murphy@arm.com,m:heiko@sntech.de,m:neil.armstrong@linaro.org,m:thierry.reding@gmail.com,m:sam@ravnborg.org,m:jesszhan0024@gmail.com,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:robh@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,chromium.org:dkim]
X-Rspamd-Queue-Id: 0ABF5CF314
X-Rspamd-Action: no action

Hi,

On Fri, Jan 23, 2026 at 11:22=E2=80=AFAM Robin Murphy <robin.murphy@arm.com=
> wrote:
>
> The "E" alludes to the fact that FriendlyElec's HD702E is actually an
> eDP panel - move its compatible to the appropriate binding doc.
>
> Cc: <devicetree@vger.kernel.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  .../devicetree/bindings/display/panel/panel-edp-legacy.yaml     | 2 ++
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 --
>  2 files changed, 2 insertions(+), 2 deletions(-)

Pushed patches to drm-misc-next:

[1/4] dt-bindings: display: panel: Move FriendlyElec HD702E to eDP
      commit: e2242223b714ac9fd8233546ca74ce972024111f
