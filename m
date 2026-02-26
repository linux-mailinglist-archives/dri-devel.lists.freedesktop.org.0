Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JhqDit0oGlZjwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 17:26:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E781AA43C
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 17:26:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C7A10E99F;
	Thu, 26 Feb 2026 16:26:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="amRdQr2c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A079910E99F
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 16:26:14 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-b886fc047d5so176006566b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 08:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1772123171; x=1772727971;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+P/NABn7QNyqGIEp9LriyRqGQ1C5eThY04lovxqjyqA=;
 b=amRdQr2cc8QFHooMzvcSR1iBmIFVaTE+bT6HWYMIQuytR3xTWF62WZPowkMAKnbSHb
 dBadwtbQYwPoFsuSin5RRjKUaMiXpw3CXsguwumM24AxJZ5UMonrxtXtbMQPfZxu7yCW
 Tv+hc0NCCzf92wEFFW62NsyO8PNl2xldUtyt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772123171; x=1772727971;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+P/NABn7QNyqGIEp9LriyRqGQ1C5eThY04lovxqjyqA=;
 b=g7CSacpRsPsjrTiva+fLjbrsfjkoPSFG2FWsXsoFdqI+d3AFzJqnPvc+AF1q6ZXNoz
 YBhtaIyfbIKDYnzCHlL98VACYsyNn55uU9/v/Yc1GLc4Arok/NzlvpdOVBxejEwGoNUU
 Cw3e7MC3Mb1VxxsWLPhXONZ9ro70LFOmgECqam17g82Mpiwaac4/Hm+ddkp8I5xkHpJk
 33idwFyhctk6AIBW+ymuMMXqH37dbFipiSPEBX65QRDnm059/oz1xJvKTrjnba0/hpI8
 FEuHQavAVF3joyv1Dm5FXbl2BCF56XaP1LaSeiixtAVdveoXWtl6nlWDdRRFUw9YfjXg
 ZN2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfU9rYtRsFGnhz2eewXN2obcdxZNrZDadIB/tjfGH/9f1gJEnsrzCkIXOiwO+QkvZKKw5cFFmfGDY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwA8lZtaq1qFaX4QEevZ7GM4NxJ1dhSToPQsl7lbCCV8+zSU3lk
 YHAnlWoPu4XYMK8A9p+coqu1HNKgKzBTnty+9Yy5W39egZmyvdUyIq7exLpnENMgm7KEJtT9IAk
 jefQZyg==
X-Gm-Gg: ATEYQzy9wqJAdWNcy2lIfW1mjWf9vo6Jc9mBvZjyvW+rdfxpMHTLdJjX2JM7CyyrccE
 LfX1oJYCfUP7KyRv2aidiAhm9SjVDoj8IfYYibZ4dQzFIvVKpyGYCGOypy1/0oI2ZVt3U9h8NNu
 K9on+e5z/snsBdYzLuNL+BFJ7VGYfZNluVY08fex/JOWpV9U2rC7pw+AQ9kNsnsBQcE7SJwBUQg
 OIGLbW9FaWfYZ24PebWnRBIhUfqBlYHoJ+5My2AsAW5SwP+fIW40Q5f67c4/ExlE+Fuvw4bsWM4
 SkhlE0ziBWmpjz2gauHGH6sBoUptlfDQALaFqdvXgpNhUNtTbLIgmtQeLi09cndQCmL0USz7cSC
 5bpTFu0vuybCVtJYSy4RMz7Zg8DjaIPnrr71uT6rJ6HBX6xpoKwVCmoDYdwoF0PsHnEsF3uiGth
 AEzsEQ7j8XwdL/oVJ6FJR3sf2AooHKbWQCXZdTj1o/HU9jsRraxUIk33g7Y+i7ZA==
X-Received: by 2002:a17:907:2d10:b0:b93:6ae4:aa83 with SMTP id
 a640c23a62f3a-b936ae4add6mr83240966b.18.1772123171070; 
 Thu, 26 Feb 2026 08:26:11 -0800 (PST)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com.
 [209.85.221.49]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b935aee56c2sm77666966b.65.2026.02.26.08.26.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Feb 2026 08:26:10 -0800 (PST)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-4398d9a12c6so845887f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 08:26:09 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWH9saIazQOKTiQToWt77r1Sr/W4c+5wmZhoC2RtIT7UrrdDwSxLNVCcEhuFIfJhYhYlwjZKLgcxvA=@lists.freedesktop.org
X-Received: by 2002:a5d:5f53:0:b0:435:e3bd:5838 with SMTP id
 ffacd0b85a97d-4396f16e2cemr38225919f8f.25.1772123168649; Thu, 26 Feb 2026
 08:26:08 -0800 (PST)
MIME-Version: 1.0
References: <20260226083235.2176689-1-zhouhaikun5@huaqin.corp-partner.google.com>
In-Reply-To: <20260226083235.2176689-1-zhouhaikun5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 26 Feb 2026 08:25:57 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V5=H14Uw4-p2fKQ2U7q9w6jGdm7ckY3JSoOrWY8h35Yg@mail.gmail.com>
X-Gm-Features: AaiRm52XV1DmkXVaDzS0m8I7VWdmm8se4MRdf6H6n5gw815EmJindpm0Gmi0Zr0
Message-ID: <CAD=FV=V5=H14Uw4-p2fKQ2U7q9w6jGdm7ckY3JSoOrWY8h35Yg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Change BOE NV140WUM-N64 timings
To: Haikun Zhou <zhouhaikun5@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, jesszhan0024@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
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
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zhouhaikun5@huaqin.corp-partner.google.com,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dianders@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,chromium.org:email,chromium.org:dkim]
X-Rspamd-Queue-Id: 61E781AA43C
X-Rspamd-Action: no action

Hi,

On Thu, Feb 26, 2026 at 12:33=E2=80=AFAM Haikun Zhou
<zhouhaikun5@huaqin.corp-partner.google.com> wrote:
>
> This screen timing requires a backlight off time of more than 100ms
> from the end of the data stream to avoid screen flickering and red
> light caused by screen material limitations.
>
> Signed-off-by: Haikun Zhou <zhouhaikun5@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

...and pushed to drm-misc-next:

[1/1] drm/panel-edp: Change BOE NV140WUM-N64 timings
      commit: bbe814bcb961ed2f30706ffdc806f18150709d2d
