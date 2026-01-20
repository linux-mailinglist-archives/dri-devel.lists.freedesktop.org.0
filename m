Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFKOJKr1b2m+UQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 22:37:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7414C617
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 22:37:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5761B10E1A7;
	Tue, 20 Jan 2026 21:37:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="kkfzDpxN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD5D10E109
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 21:37:43 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-b87dba51442so426843366b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 13:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1768945056; x=1769549856;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f77R0JQuS4DuPjEO2I2EP1enUnPkpfPM0L3J9mEBbBI=;
 b=kkfzDpxNRMt94qMt51PNBwujDLsNetVahd1a9IFRBHu31PunPVs9IAfccWz/3kpD9r
 jMVp3pB+f+F24ZXmTBHhIwCfZUbZOxuVeBDRxiHNvJk88UbtP/AOYRx+I/+8nTEuFOlq
 P+E0yRfTdMrXPsC8J6WdA+lEycFjIb8DWVfLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768945056; x=1769549856;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=f77R0JQuS4DuPjEO2I2EP1enUnPkpfPM0L3J9mEBbBI=;
 b=Y5F1VxXopc75G7m8g58AQjWduhljV0vYe/OCE7ODn+k84/WOo+S3cshnTxVAVHP7qQ
 V4PaRzkX1MLSSS8I//0P2246o+R2kLQVcLusPS5gVlmXRXG8+YvW8yu59FbZHn4CAoWf
 5yqDb9KZwWnB+9s8uprlpsqXdsMpJ7lAjcZDc3h46O+RtafEPOqLs0yfAEpIS6StHej7
 exrSbQMHPn/4b33LgA7mmiJE7U6iQfjLMCHKCpybNcx3ITR+hkped0MJRVgQr/bGkkPu
 F1+NSu3eyJdJZiThxxcgN4313NkXvda1LKxyXEFSDZPTqouk2+Z3SqWClBzgyYr9BlI2
 G4gw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoU8rYNnVtEctBPtONis0etyIUh7iUQmghHnE8y7Jpej+uCV291B1i6m4wGLZBq/AQ58Uue5bcdb4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZfQTrv+XnhS5LRvwiRkSRbQip/FnIkjMSc5PIxg8qEMaWe9PN
 NyvGv7JU5wsgHTm6CRcd90AXVc/lFY4Akazkv+oSoORTMoVAHVeOErXd8TtiqBF6SEWd+/naoNj
 FEfsUNdFj
X-Gm-Gg: AZuq6aLlQDSrT/zR+gcVlIc7QTxG3cCDyK4150xQYewQsRRu2T9JAy/AIivyIxZ9SvW
 eUr0jWrgvKGgwpAWhHSzgZkDsb1YAhm7yM/2nIxyQIIYvme/boSvVSdVsLaqR3gWftBSa1h+u7P
 wudVXMXCOvtcraT4KSVddFp9Fb98JI9hMRbXTpgYIZLhlApRsnA98K+wBoNK2ztg12FXbTfvor1
 JhScCPCPwfvKajxyODs6qKlFvHb31cwVJtVXWnVnsBSA5/PoqwmqSSGVBDFa6oxfSXo/dkPaq69
 6hMSrv4g7t/stubJZenYuK+pjoqjWDYfLZuF0aBpTCyqik2EL7+Y2cf5XEymaBTmZnDuwnCM/jk
 J8h3vhhubwSCqO0ARwJm+wEfFEwE3X91rfGBF7vLGYa6HhkwTvF+3BOQq84af2iEb5h/ja4ml8L
 Ft5KjdqzLqSPKQ8UwY8mf0KELtEka3dAHmnjbd1NS+a7AKFTWteJREWJtQvJEY
X-Received: by 2002:a17:907:1ca9:b0:b87:35fc:ae5f with SMTP id
 a640c23a62f3a-b87930381c7mr1522553366b.52.1768945056381; 
 Tue, 20 Jan 2026 13:37:36 -0800 (PST)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com.
 [209.85.128.48]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b87959ca4d6sm1480864466b.39.2026.01.20.13.37.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jan 2026 13:37:35 -0800 (PST)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-47edd6111b4so54016515e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 13:37:35 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUIubAsWvaw2rMAU3lI9dibSUrRgh/IoQ3tnpcZbW9n6zOSgCds5Kl5jxRqbqZd8FqYMhR8vLLlWoY=@lists.freedesktop.org
X-Received: by 2002:a05:600c:3483:b0:471:1717:411 with SMTP id
 5b1f17b1804b1-4801e334248mr212707995e9.24.1768945055035; Tue, 20 Jan 2026
 13:37:35 -0800 (PST)
MIME-Version: 1.0
References: <20260119033952.9970-1-terry_hsiao@compal.corp-partner.google.com>
In-Reply-To: <20260119033952.9970-1-terry_hsiao@compal.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 20 Jan 2026 13:37:23 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UVkmUbyU3Et_XFt24tt09LLN68h8WXt+E1f8NLXgW7Qg@mail.gmail.com>
X-Gm-Features: AZwV_QgaS5yLM1dXgti69oaPpU3LOivS72lqskajLkpob6nqo4v-wY6upektzsI
Message-ID: <CAD=FV=UVkmUbyU3Et_XFt24tt09LLN68h8WXt+E1f8NLXgW7Qg@mail.gmail.com>
Subject: Re: [PATCH v1] drm/panel-edp: Add AUO B116XAT04.1 (HW: 1A)
To: "terry_hsiao@compal.corp-partner.google.com"
 <terry_hsiao@compal.corp-partner.google.com>
Cc: linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:terry_hsiao@compal.corp-partner.google.com,m:linux-kernel@vger.kernel.org,m:neil.armstrong@linaro.org,m:quic_jesszhan@quicinc.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linaro.org,quicinc.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER(0.00)[dianders@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,chromium.org:dkim]
X-Rspamd-Queue-Id: EF7414C617
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Sun, Jan 18, 2026 at 7:40=E2=80=AFPM
terry_hsiao@compal.corp-partner.google.com
<terry_hsiao@compal.corp-partner.google.com> wrote:
>
> Add support for the AUO - B116XAT04.1 (HW: 1A) panel.
> This panel is used on MT8186 Chromebooks
>
> The raw EDID:
> 00 ff ff ff ff ff ff 00 06 af ba 89 00 00 00 00
> 0c 23 01 04 95 1a 0e 78 02 9e a5 96 59 58 96 28
> 1b 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 ce 1d 56 ea 50 00 1a 30 30 20
> 46 00 00 90 10 00 00 18 df 13 56 ea 50 00 1a 30
> 30 20 46 00 00 90 10 00 00 18 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 02
> 00 10 48 ff 0f 3c 7d 0c 0a 2a 7d 20 20 20 00 21
>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 679f4af5246d..108569490ed5 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1915,6 +1915,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x723c, &delay_200_500_e50, "B140X=
TN07.2"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x73aa, &delay_200_500_e50, "B116X=
TN02.3"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x8594, &delay_200_500_e50, "B133U=
AN01.0"),
> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x89ba, &delay_200_500_e50, "B116X=
AT04.1"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x8bba, &delay_200_500_e50, "B140U=
AN08.5"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0xa199, &delay_200_500_e50, "B116X=
AN06.1"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0xa7b3, &delay_200_500_e50, "B140U=
AN04.4"),

I was all ready to push it when the tools correctly pointed out that
you're missing a Signed-off-by. I can't add that for you. Please
re-post the patch with your Signed-off-by.

-Doug
