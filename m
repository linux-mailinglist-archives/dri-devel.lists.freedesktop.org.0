Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNcXOp4Rq2kRZwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 18:40:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 461B32265E5
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 18:40:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6813210E118;
	Fri,  6 Mar 2026 17:40:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="TNEAmiPl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF50B10EE0B
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 17:40:41 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-b9360037cdfso1454236366b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 09:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1772818836; x=1773423636;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/FghQtqyNxFzPiX4DkDTN8nrnXAGaeDn+Uz2gbVEWyc=;
 b=TNEAmiPloQs21LnaZE5ql3dDqbKCyGHz4eSp9DO6Uciecdh00X3xsJOYw81wN58cqy
 A3CiypIKqRuGa2LthllIc8X5Vio1e28FpgVvKmOeiAskdjOpZzL+Ju21dP/VXfTKPD9q
 bruUUUdlskv2UF57CSLMFXVtR9urJ+zJysHR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772818836; x=1773423636;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/FghQtqyNxFzPiX4DkDTN8nrnXAGaeDn+Uz2gbVEWyc=;
 b=n5IWFHZKV259k0LSM6ISnl+yryWH5rufSdf2wOVH6lTrtvRMBrcykyXVc127Kq2QtO
 uP9nMPug+MfzxvBZISvPnr/uaI4mhzKIoaT1kn+e9oU6b19ZNMW8tmCraf1/xtY+raDA
 Mv3nzf7GxCX07Hi7x10j5O33S7qFjiJH+GeHcCWvQyi4QLdo/VbIzmys2S8KEuVWdqTE
 a+hI4a/Cg9X9DIH+4otjHC8U4tIJIPv5yNpAsvm8NeETL5rhn6TKot2OWJx03ER5Cwau
 KOWe6gGduNuEpljz1VlgmpOrxtbVYT0IW1YyoM6ClQ1YRHXMGhl19S2v8/P5+pPgDdyj
 afCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBHIlPZrqfQeTfmv1VCuOrxpEhT5mM9eoRv59hFKltJ2JdL6UkNGPz6WHgURGwhk31uDuRfeEPeGs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0e7rIhbAN7jd4C1y8pkm6bAEaVrv6qgWY8G0bXdVCO5CsSB1i
 Bjv1hGy2MS2QTb54sajmjwU/oYj8zwvL1P4/+W3DjhUldL7npZzP4Xxz3frcSnrQ1kLSF0Qvox5
 R88wXxA==
X-Gm-Gg: ATEYQzzoLK0QNe8sJTrGnrSV7UfTdGgLQ3mLFZhyxLy/2qXBW6obJMtGxfY2zL42KCi
 5GRpSWccM2ZwNVc/FomymFDqNnslyME1wVOU40GHiKmETbf9oSUKOpuypaDzPsovc3IaC+qpcm+
 yzUUV40vhb4aPe4qK6X14oHUj+nisLDbTXM4MhM5wg+EbvK7pOqDpg5DLjsBMectkYWC6pOd0mh
 d5YmT+kmpm6h40dV/vqlgG40JIrZD1Oz0en9n6KO6Gi3wkZOo496XuVgcqeovQ9YFaNl+bOd/5a
 hUBNjEY7NqMrTnOBHA2L8p/ZIXMNpTasq6wsdlq/ZpFMe1XC6YXUAwgVvMDy/plkqrqYPdI+pMY
 0QVuW9ucTe3esbnVbltZqXWBL5box0n6xVVRD/ElVkbXN8CVzJrgq77KjUTD7s1TlGHCoFFU+f6
 Dxp3NguWvgNGUcKzkvZmnjVAH1H5cQU7uNrq16dcqVjGrMue2VuQC9xbw0LYPZXQ==
X-Received: by 2002:a17:907:7207:b0:b7a:2d:71af with SMTP id
 a640c23a62f3a-b942df658fcmr181370366b.38.1772818836065; 
 Fri, 06 Mar 2026 09:40:36 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com.
 [209.85.128.45]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-661a3f5e494sm664019a12.13.2026.03.06.09.40.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Mar 2026 09:40:35 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso79024755e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 09:40:34 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXcPkyihyDkw2w5sZmOPwTmbIv58yVv4GUq99OyWs4E1u+f8GhfM2n9PDTN2crSfwsmhXGS75GKR/U=@lists.freedesktop.org
X-Received: by 2002:a05:600c:45d1:b0:480:6ab1:ed0d with SMTP id
 5b1f17b1804b1-4852691d5f0mr49674775e9.9.1772818833423; Fri, 06 Mar 2026
 09:40:33 -0800 (PST)
MIME-Version: 1.0
References: <20260305044921.10942-1-chintanlike@gmail.com>
In-Reply-To: <20260305044921.10942-1-chintanlike@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 6 Mar 2026 09:40:22 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WMKjA3eRhZyHd820BFBYUMfz_=F4ppNYPWDEHKwiORXA@mail.gmail.com>
X-Gm-Features: AaiRm50USB2P18Wq8m-urICon27GB8JuAPVw0Wr5IxblnYi6ng6K4yxBkyjEckY
Message-ID: <CAD=FV=WMKjA3eRhZyHd820BFBYUMfz_=F4ppNYPWDEHKwiORXA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/panel: novatek-nt36672a: Convert to
 mipi_dsi_*_multi() helpers
To: Chintan Patel <chintanlike@gmail.com>
Cc: sumit.semwal@linaro.org, neil.armstrong@linaro.org, jesszhan0024@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
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
X-Rspamd-Queue-Id: 461B32265E5
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
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chintanlike@gmail.com,m:sumit.semwal@linaro.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dianders@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

Hi,

On Wed, Mar 4, 2026 at 8:49=E2=80=AFPM Chintan Patel <chintanlike@gmail.com=
> wrote:
>
> Convert the driver to use the non-deprecated mipi_dsi_*_multi() helpers a=
nd
> mipi_dsi_msleep().
>
> Switch DCS command sequences to the multi context API and
> accumulate errors via struct mipi_dsi_multi_context. Replace
> open-coded error handling with the multi helpers and convert
> nt36672a_send_cmds() and power sequencing accordingly.
>
> This patch is intended to functionally be a no-op, though there is one
> slight change. Previously a failure in regulator_bulk_disable() would
> have caused nt36672a_panel_unprepare() to return an error. Now it
> won't. No other errors in nt36672a_panel_unprepare() were propagated,
> so this makes things consistent.
>
> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
> ---
> Changes in v3:
> - Keep local ret variable in nt36672a_panel_power_off() to preserve error=
 code in logging.
> - Change mipi_dsi_msleep() back to regular msleep(60) in power-down seque=
nce to preserve behavior.
> - Reset dsi_ctx.accum_err before set_display_off_multi() and before power=
-down to preserve original error-tolerant shutdown behavior.
>
> Changes in v2:
> - Address alignment feedback from Doug.
> - Restore original power-down ordering.
> - Drop return value from nt36672a_panel_power_off().
> - Consolidate error handling around dsi_ctx.accum_err.
>
>  .../gpu/drm/panel/panel-novatek-nt36672a.c    | 94 ++++++-------------
>  1 file changed, 30 insertions(+), 64 deletions(-)

Looks good to me now. I'll plan to apply in ~1 week if there is no
further feedback.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

As per my response in v1 [1], someone could still do additional
cleanup to move away from the table-based initialization, but it
doesn't make sense to block this patch on that. :-)

[1] https://lore.kernel.org/r/CAD=3DFV=3DWtjW5WWmjeb2zwF2PjiJeZv1jZS_UKZ0bT=
1658=3DCkwVA@mail.gmail.com

-Doug
