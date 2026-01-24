Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDxDFXwOdGmS1wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 01:12:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4349F7B9B0
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 01:12:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99DEB10E2F2;
	Sat, 24 Jan 2026 00:12:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="gf1v0GSU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A64C10E2F2
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 00:12:39 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-b8715a4d9fdso339571966b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 16:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1769213557; x=1769818357;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=azy955UGEyqveHEk/McQyAh+ooZ//BKMfZa6e5iRaAA=;
 b=gf1v0GSU587lhQ7JSG/uQSIWhNY691v0Dfp4FVUjDJsjSv3kQRzLKMZve/4ft+RvkN
 puxDqdTC4mUQO2Aa7p1wnL/JqDD0okJCPkAQJALx5I1P2bVDDW90g39v0Qzt2b6Kp1qQ
 munkpBrRc0ByLW33xNHaR0RGoinCYg4Tregb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769213557; x=1769818357;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=azy955UGEyqveHEk/McQyAh+ooZ//BKMfZa6e5iRaAA=;
 b=J2ZttuysB7artDIvMfvC+dXgMxOLt54l06S2EF2cJQCEddUmz4U3A0CJzod0y2SGKl
 E9aYZ2VVIa21BmjmBrrqXvT4x2h9MjBojHQ0OJBANWFblRDyLcTnA+fT/z69HcHZPRzw
 GDAMYko8aGq08GvYh4JsmYIsbRE4HgYorYyDpnnkNkMLachdrQkovsUrNNhpvGhDk7iG
 luBKGHlNzoPFpQyDcA/eaF10OAMEOI+BGjMXYKacWxDsYywm3l55aB+H6GWZ0MJcQOWL
 o21iFyPNMK+3rn90Xb/HOar/cIuI+6gDJCpI8uAeqcxRbZOQD9iYwMTnUF9QN598w6IP
 Cpzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNC9hMMFC3L55gWQrdmc9CaZl5EvhC7cjJSrBeLlBFQgmomRhzg1zwvhJcb6Z4XqzFB2jrZP4xzDg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/FptXiSci6EV3ilWzlJCec9fC9aajBjlN6ssOAIdulGYfXxVJ
 khpoHAgKc3nvKftIxdjN88O5dA8CQbZZI/W2Ry/3Z58JNyD3CsBxJPjgVRqN+DJjQuxLfu7GmGG
 7lT3REf+V
X-Gm-Gg: AZuq6aIVx79EoP9XqM83fm9+En1kzkLklcbN9lw7COyZdA2+ssajz6t88g8Dv60DkEJ
 twx1bdSA9SXBMtCOtJxUIglExAAloAwbt14N/uBnjn4sBH5IAlJz1gIaPWkOe057ukXIIR+G1K9
 rSZqAJUkq/IRS+M8tIeDWjxZFuoUtpn5tY+2IPOOmFXqJG3cX/PSiHH7dppTtv/xfd2nbeavCqZ
 NYtn/g7hqD8iW9//dLD74iqsgl/mFRlFAGnPlzjG3hPljTYqIbFyTz6WecjLptZzUkCisUvbNDW
 55nnH9y+PxW0zF/zH82zEYdS0V+FKomaDBW3tKYtCHqyjDiB7ku3e2FDCf7Op4DXX29K538CVy3
 pMSp4QFHQ5MtW8uGrMF1rvXUI/a0n/k+OMCLvrj2OSzGgG4XdUDaxNQkgCeLxyQjYx997/CN6jb
 xijgRhPAC7Ogz3ackT9lzX2rfky2NV46kyoliBPyWode0RpC1osw==
X-Received: by 2002:a17:906:fe08:b0:b3b:5fe6:577a with SMTP id
 a640c23a62f3a-b885abeafc7mr325561466b.8.1769213556954; 
 Fri, 23 Jan 2026 16:12:36 -0800 (PST)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com.
 [209.85.221.53]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b885b445af5sm180749366b.31.2026.01.23.16.12.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jan 2026 16:12:36 -0800 (PST)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-4359019da8cso2577957f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 16:12:36 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWD5bzD7bODWZ/9kAL1WQ1H6UZUaGgnj8vjUpo7yIynkNJW75ctOnp2XoD9jhncJXL9+7U51WKQ1LE=@lists.freedesktop.org
X-Received: by 2002:a05:6000:2383:b0:432:dd71:8f2c with SMTP id
 ffacd0b85a97d-435b1593243mr8070487f8f.10.1769213555590; Fri, 23 Jan 2026
 16:12:35 -0800 (PST)
MIME-Version: 1.0
References: <20260122032904.3933-1-terry_hsiao@compal.corp-partner.google.com>
In-Reply-To: <20260122032904.3933-1-terry_hsiao@compal.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 23 Jan 2026 16:12:24 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vuu+0HRM-xeNs_uuCOZkFMxBYQF0nqh0jzCRCW6xk2FA@mail.gmail.com>
X-Gm-Features: AZwV_Qjffdu8lQ8ko-8WoMYLhztrQ3BCq5A_kk0zyDT6tUFtsKzC1D3Mm7b4DVc
Message-ID: <CAD=FV=Vuu+0HRM-xeNs_uuCOZkFMxBYQF0nqh0jzCRCW6xk2FA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/panel-edp: Add AUO B116XAT04.1 (HW: 1A)
To: Terry Hsiao <terry_hsiao@compal.corp-partner.google.com>
Cc: linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
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
	FREEMAIL_CC(0.00)[vger.kernel.org,linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:terry_hsiao@compal.corp-partner.google.com,m:linux-kernel@vger.kernel.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4349F7B9B0
X-Rspamd-Action: no action

Hi,

On Wed, Jan 21, 2026 at 7:29=E2=80=AFPM Terry Hsiao
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
> Signed-off-by: Terry Hsiao <terry_hsiao@compal.corp-partner.google.com>
> ---
> Changes in v3:
> - Fixed the Signed-off-by name format.
> Changes in v2:
> - Added missing Signed-off-by tag.
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/1] drm/panel-edp: Add AUO B116XAT04.1 (HW: 1A)
      commit: 2cb217301e0df17f7107a1b0941b28d4053eae8b
