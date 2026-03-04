Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLakOX2zp2k6jQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 05:22:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF761FAABE
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 05:22:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B0BD10E94B;
	Wed,  4 Mar 2026 04:22:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="khzxUSzg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D51B610E94B
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 04:22:17 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-b93698bb57aso423857566b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 20:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1772598133; x=1773202933;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ovCqskPnpOFjW1G2FSZwvpfH3H5eWAvHXz2VfXOL+zU=;
 b=khzxUSzg+zxEweUF1L9A9QLfYLX6JcvuAZRljK+JyFOXHRCq6TRvgPZ6fYrwyK7hik
 M/g4o3DUxwYwLVEGF5ELfWBFIDClhpXioLp1ckVMuAyA3snj4sWEBJYscnfBu+VxMslJ
 txvEddvGu16pOU34OX6mei/gQ2AW8MfviQEWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772598133; x=1773202933;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ovCqskPnpOFjW1G2FSZwvpfH3H5eWAvHXz2VfXOL+zU=;
 b=mamGJaV+6j4sE5CJ49QfGHV/+xCFwqJn+epl245RLAIes0FwmpJI/w6wQs7kb/OJQZ
 5neTByXRYvpauxzvbG090qH2EGkv7+abM7uE2svAd+yfoukrnIMlNDkWsGz5ilrYZUSu
 OuqjJ7GrT/9zWCzLAxEjbTA6YKw4PBe3YjAtlqQsJJTUMhxFZfBT3XnxUnDGtGrr8yoa
 5ZI1taH9YNZi9+XReXYZhzY7Xsv4TPvMRpe81ywUFV6t6e5sCCEed+l8LXJHBU8/qmua
 UWz4m2mo1LB+YLVu7Vgq7k6L/1URIgK32gJ+pTg4XzRrvAcRF8i1Nh2qPILQY+nM/znk
 VNgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwGMKCRB7O53MBvl3X8krYPc6R5kS6erqkiRzoSKRDweEHhHQi3ybsFXe2JE3KB5E4CSXtds+EVww=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5svLjUI0G1yXQCwGRRKBlFnYtXR1zaslgibVsi+NBV91D3gb3
 9DTwiJh3dVs63wGWnOvYw7dU5Xzjx/IMgIJDuBLH5HEK+joDy+wfwn+prXNnEFte3YPEZW+ifwn
 WrLTXww==
X-Gm-Gg: ATEYQzxE4zp3GMK2r5422ttg/CFalitAWDPKmOniV5+pqbrNjcQX2MHq4eGGQHVyy6t
 411Knbx/QcjH7VPGZ/XYEAO35jGuuNxhosMm53POpU6LzghvU4ua0O4dltpyWQwrqBYbswKwNmF
 AF9Hx2F6fExDvogDXhI5zeMIBEP0vApeVw1e9CkQZzNHsPeKWT7gbnjC3aZrloWu+wbJvemQpo+
 IzJgdXaBgU601/7xV3iAmPEUvcURYhttRsBw8gmAhurtG4g0Jm1VrGp3nNstjRI0u4ppo1p8A/s
 aI5GdFOGUzGG879H6uwWddeYr9CPr6Be3KBnmjzreY3FHP9q6ejXN2fLx9GzY6Mm3F1QO48YLWj
 5oYDS37cZcG26FAwoCtd+a5tGN4vkDgmW8jyRP8xEyEEb0E0L1TvYw5NJs8D8Vj0qLdyH68Ry+4
 Pyil6KOP/B1Z+AFqZvc2AQafhnFWJKVujgcFqlqDwNhMklMhAxxqzPgEZmDWO2pQ==
X-Received: by 2002:a17:907:7b9b:b0:b8a:e013:9c5b with SMTP id
 a640c23a62f3a-b93ef732efcmr35662866b.4.1772598133243; 
 Tue, 03 Mar 2026 20:22:13 -0800 (PST)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com.
 [209.85.221.47]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b935ac51843sm710197666b.16.2026.03.03.20.22.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2026 20:22:12 -0800 (PST)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-439baf33150so1982647f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 20:22:09 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUB8sixUrr4ihE6XYcrKAVyZ2hQ0i4F2vu+qFaPT/jDpy135o/35UJzzusKlwGyp5MEO0Arhrc55SQ=@lists.freedesktop.org
X-Received: by 2002:a05:6000:2407:b0:439:c018:60e1 with SMTP id
 ffacd0b85a97d-439c111d8ccmr8241952f8f.21.1772598128799; Tue, 03 Mar 2026
 20:22:08 -0800 (PST)
MIME-Version: 1.0
References: <20260303035508.8288-1-chintanlike@gmail.com>
In-Reply-To: <20260303035508.8288-1-chintanlike@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 3 Mar 2026 20:21:56 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WH-vUJ5HtGRWyjeKS0e_c4qZ+7Y3m8bbTg8atQ8-QdwQ@mail.gmail.com>
X-Gm-Features: AaiRm51LyHGnrbzGi2v-kpDTIp0019GwV2U-qIFgV-FPWhUYO6-trVKNEWvE7aI
Message-ID: <CAD=FV=WH-vUJ5HtGRWyjeKS0e_c4qZ+7Y3m8bbTg8atQ8-QdwQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: novatek-nt36672a: Convert to
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
X-Rspamd-Queue-Id: 7AF761FAABE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chintanlike@gmail.com,m:sumit.semwal@linaro.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dianders@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Hi,

On Mon, Mar 2, 2026 at 7:55=E2=80=AFPM Chintan Patel <chintanlike@gmail.com=
> wrote:
>
> -static int nt36672a_panel_power_off(struct drm_panel *panel)
> +static void nt36672a_panel_power_off(struct drm_panel *panel)
>  {
>         struct nt36672a_panel *pinfo =3D to_nt36672a_panel(panel);
> -       int ret =3D 0;
>
>         gpiod_set_value(pinfo->reset_gpio, 1);
>
> -       ret =3D regulator_bulk_disable(ARRAY_SIZE(pinfo->supplies), pinfo=
->supplies);
> -       if (ret)
> -               dev_err(panel->dev, "regulator_bulk_disable failed %d\n",=
 ret);
> -
> -       return ret;
> +       if (regulator_bulk_disable(ARRAY_SIZE(pinfo->supplies), pinfo->su=
pplies) < 0)
> +               dev_err(panel->dev, "regulator_bulk_disable failed\n");

nit: IMO It would have been OK to keep the local "ret" variable here,
but I won't insist. That would have allowed you to keep printing the
error code, which is nice. It's OK to have "ret" as a local variable
even if you aren't returning it...


>  }
>
>  static int nt36672a_panel_unprepare(struct drm_panel *panel)
>  {
>         struct nt36672a_panel *pinfo =3D to_nt36672a_panel(panel);
> -       int ret;
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D pinfo->link =
};
>
>         /* send off cmds */
> -       ret =3D nt36672a_send_cmds(panel, pinfo->desc->off_cmds,
> -                                pinfo->desc->num_off_cmds);
> +       nt36672a_send_cmds(&dsi_ctx, pinfo->desc->off_cmds,
> +                          pinfo->desc->num_off_cmds);
>
> -       if (ret < 0)
> -               dev_err(panel->dev, "failed to send DCS off cmds: %d\n", =
ret);
> -
> -       ret =3D mipi_dsi_dcs_set_display_off(pinfo->link);
> -       if (ret < 0)
> -               dev_err(panel->dev, "set_display_off cmd failed ret =3D %=
d\n", ret);

Probably also need a `dsi_ctx.accum_err =3D 0;` here? Old code still
sent the "display off" command even if nt36672a_send_cmds() returned
an error I think?


> +       mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +       /* Reset error to continue power-down even if display off failed =
*/
> +       dsi_ctx.accum_err =3D 0;
>
>         /* 120ms delay required here as per DCS spec */
>         msleep(120);
>
> -       ret =3D mipi_dsi_dcs_enter_sleep_mode(pinfo->link);
> -       if (ret < 0)
> -               dev_err(panel->dev, "enter_sleep cmd failed ret =3D %d\n"=
, ret);
> +       mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
>
>         /* 0x3C =3D 60ms delay */
> -       msleep(60);
> +       mipi_dsi_msleep(&dsi_ctx, 60);

I think this one should still be a regular msleep(60), right? Prior
code still did msleep(60) even if mipi_dsi_dcs_enter_sleep_mode()
returned an error, so you probably still should too.


> -       ret =3D nt36672a_panel_power_off(panel);
> -       if (ret < 0)
> -               dev_err(panel->dev, "power_off failed ret =3D %d\n", ret)=
;
> +       nt36672a_panel_power_off(panel);
>
> -       return ret;
> +       return 0;

I didn't notice before, but I guess this is a minor change. Previously
nt36672a_panel_unprepare() would ignore all errors (other than
printing) except it would return the final error return from the
regulator_bulk_disable() call. Now it will also ignore the error from
the regulator_bulk_disable().

IMO this is fine, but since it's a slight change in functionality it
could be noted in the commit message. Something like:

This patch is intended to functionally be a no-op, though there is one
slight change. Previously a failure in regulator_bulk_disable() would
have caused nt36672a_panel_unprepare() to return an error. Now it
won't. No other errors in nt36672a_panel_unprepare() were propagated,
so this makes things consistent.
