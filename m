Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MQvJw+Se2nOGAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 17:59:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD73B290B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 17:59:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB5610E172;
	Thu, 29 Jan 2026 16:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="TZ6We6y7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D15A710E172
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 16:59:54 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-64b92abe63aso2458841a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 08:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1769705991; x=1770310791;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hqc2vCWSDd5aIAyofM9eEYuTiqzTogSBi0HVjQNj3eY=;
 b=TZ6We6y7ARHBfwrPsLtUEIOaY2d+st789/xkn/DUTBgqVGU7sossIXoUv7I2ZnQJLt
 1v047AWne4nsur/Ugz1vSahTSWgW2Dil+UJCRX+gniEUX+Bv8aBMFrzIICDPVdhkPe+R
 FUlrvUkbVKNYia7omgBuLF4KvOp+s0aAewtNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769705991; x=1770310791;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hqc2vCWSDd5aIAyofM9eEYuTiqzTogSBi0HVjQNj3eY=;
 b=N8aXQ010FgDwcuhvR0MpyZb/fVNigOimYbn/8ZvVvkAkHvqkT8NjHzHFuc+5FF5ydK
 ePfVdhlscfRyLAgDal+ZllEP34JImVG2Kxp92rpW7F455prkajdnMi1hOM6qEungShCK
 RfeYzc0wZNvVsL4hHddlQYk9YUxSQJ9pA0BMKTzMp9/paDyW1uJxiK67WxbgDAuTuGKe
 Swv+bGnZN5V1jNFdvfz7yfSoAKpq6t8jZgEQeVIpWpMFKOKFMtxAJLiCroXB8hUNpk87
 ep6xUx9S0CO/E7aAd2xBwtdhMpKhla8GvTJyxCURWKlp0OjI00q80Dmp1CCgLkp72Iqj
 XzNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeFyxORUN1t8efSCVMAK2eBfsIDOtn/gPOEn47Y90OMHmHA3QDjLdtSQKFbpkB+Xy5Qvucq/1WnoU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkRGAfhRU7lySb+cm13AZldyCLqElDPszYIDzVjMwMFQywPR/c
 Mip0ltiPwEKeNEfbgB5vOmMfJXvCIzgNB3EASIuVRr7gyUIlnZB9PKm/ZrRmUkqaM6eOsUIPX4e
 Md/afZw==
X-Gm-Gg: AZuq6aKQeVe/U4ReXpU0ndGqod3pUrg4qheKRUmEvcjqU/1dJJCII2icOtRu/xrkL2U
 EWJnhxkEmoBghUsknxEK5ZO/d3Azzkg14lH0psKoRn3eYAOsjwCLJhsILp76eeL4fuZmEyGXVyH
 U5bYVFtFKKgLbX537ZPTufmXfkLg7UNy6InBb4cvta1LWn0G1Kyj+ElXNukoQG3Jjie2X7R5Js/
 VwQX3geUuppQF6+EtCHOL5pmtCJd/YAmg/HWyJShzKkYIFP0x0WLWfyEZALlm5Jsr7pMyBBcGd7
 +DKprh1IOMK7u6tDzZQ11ZjNK8ys73H05cM/GxX/rwlV1OKguEVHWs4fdAAsQ3B18uBMIyBDsMb
 2KEw4VvmlbO6fvSS5F6q+5VyjKm9bkHr1ObRu2EEcjfHr6qc+NxA31Kj0I1xNYGvRLW/HBvxhxL
 wNOWenRn7pfyyaJd8Uvm8fz5FAbYZ7lKvkuppzt7EfP2TlhGSRag==
X-Received: by 2002:a17:907:3c90:b0:b8a:f65a:bee0 with SMTP id
 a640c23a62f3a-b8dab28cf02mr601682066b.8.1769705990807; 
 Thu, 29 Jan 2026 08:59:50 -0800 (PST)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com.
 [209.85.221.42]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8dbef87254sm279244966b.12.2026.01.29.08.59.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jan 2026 08:59:49 -0800 (PST)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-42fed090e5fso1038644f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 08:59:49 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVVSZav5kzVMg2BbaMOecqDDjYLOu8yJP14pH5teVHS44MviWZtuwepvPTcctyVp81Q1DFYCm57fSA=@lists.freedesktop.org
X-Received: by 2002:a05:6000:1a8f:b0:42f:bb4a:9989 with SMTP id
 ffacd0b85a97d-435f3a9ad2cmr373697f8f.28.1769705988781; Thu, 29 Jan 2026
 08:59:48 -0800 (PST)
MIME-Version: 1.0
References: <20260129033033.2046228-1-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20260129033033.2046228-1-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 29 Jan 2026 08:59:36 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V2HzOYcOgeY94h+Pk33=niJrQzzZF0hLE+VH8Jacbfvw@mail.gmail.com>
X-Gm-Features: AZwV_QjG33LW3pMrcS49NmXJ4K_pxJYPZFafPY9mAJv9RYzSOy2zwUwLv4ztDX8
Message-ID: <CAD=FV=V2HzOYcOgeY94h+Pk33=niJrQzzZF0hLE+VH8Jacbfvw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add CMN N116BCL-EAK-c2
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, jesszhan0024@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, treapking@chromium.org, 
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
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,chromium.org,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yangcong5@huaqin.corp-partner.google.com,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:treapking@chromium.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dianders@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: EFD73B290B
X-Rspamd-Action: no action

Hi,

On Wed, Jan 28, 2026 at 7:30=E2=80=AFPM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> Add support for the CMN N116BCL-EAK-c2, pleace the EDID here for
> subsequent reference.
>
> edid-decode (hex):
>
> 00 ff ff ff ff ff ff 00 0d ae 7a 11 00 00 00 00
> 08 22 01 04 95 1a 0e 78 03 46 a5 9c 5b 53 8b 24
> 1d 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 e6 1e 56 e2 50 00 3c 30 30 20
> a6 00 00 90 10 00 00 1a 00 00 00 fd 00 28 3c 32
> 32 08 01 0a 20 20 20 20 20 20 00 00 00 fe 00 43
> 4d 4e 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
> 00 4e 31 31 36 42 43 4c 2d 45 41 4b 0a 20 01 80
>
> 70 20 79 02 00 25 01 09 fc 34 01 fc 34 01 28 3c
> 80 81 00 10 72 1a 00 00 03 01 28 3c 00 00 00 00
> 00 00 3c 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 2f 90
>
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 108569490ed5..54c73bba1c14 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -2014,6 +2014,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1160, &delay_200_500_e80_d50, "N=
116BCJ-EAK"),
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1161, &delay_200_500_e80, "N116B=
CP-EA2"),
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1163, &delay_200_500_e80_d50, "N=
116BCJ-EAK"),
> +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x117a, &delay_200_500_e80_d50, "N=
116BCL-EAK-c2"),

It's probably better to change the string to be just "N116BCL-EAK".
Even though there's already another "N116BCL-EAK" in the list, that's
OK. Why do I suggest that? The EDID itself has:

ASCII string: CMN
ASCII string: N116BCL-EAK

...and when the EDID has the ID string in it then it's best to match
that string exactly. That would help us if a vendor ever accidentally
re-used the same ID. See Hsin-Yi's patch 6e3fdedcf0bc ("drm/edid: Add
a function to match EDID with identity").

It's still a good idea to call the panel "N116BCL-EAK-c2" in the
commit message, though.


-Doug
