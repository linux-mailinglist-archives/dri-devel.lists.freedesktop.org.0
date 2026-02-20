Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iM21MH53mGlrJAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 16:02:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE2D1689A2
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 16:02:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A7AE10E809;
	Fri, 20 Feb 2026 15:02:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mfiM0Jys";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
 [209.85.217.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B6E10E809
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 15:02:14 +0000 (UTC)
Received: by mail-vs1-f51.google.com with SMTP id
 ada2fe7eead31-5f52ebff12aso69654137.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 07:02:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771599733; cv=none;
 d=google.com; s=arc-20240605;
 b=YWnpiVf01Un529GyqojN8082u37fKVZRdx4GoWeP/+tEi4C7g98sHVNorztx/3t3hN
 OG6QQySXNOo7ThIOjU6OukWjHxtvf8LqKV9HxM3iBfgTFfqKzijAHxlrGwqHv6LJvIMC
 eZdU5Gg7k80zyrSGVDAYmswjFVpqW2ua++0QpZ2dgbJDuiwkpFpnlaaahYqlNCj3EWta
 /X6NZ0bbt4JQTtQaWcCLXeaoFoKbGn/cyU4s87RmKRtD/x/1Nb3OEfEFTk93h486IASm
 PCvHtLm1eNoaGVmBbfTYWOYI1ShRWNhusNHEeHNBlog9VrJs/xTTwaJMURRU7KzsbI19
 GLnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=LXf8ZAEWmgK4CVNigc0TPHiOo/zpIdTw7aieRuqY3F0=;
 fh=Jo9r5b06WjhfClaDt2lD5OVWFY91XBSqwJPcNMQvpK8=;
 b=iqWLMHhiIOpfOCyFKhIQa7RKq0UjaC/GqxQaUoOqDP6V5egLeTua5TmnxVHVjzGX5Q
 jTOLypJa1mKkBxMrJiZSNyU8O2UV9FrXJpm56bxIw0w4xO/+E/JzpK6JPvjN+2igbOGz
 e0eS82mgBYI83vlydZ3Da5wsW7VjSi69RrOThI+0xtq/prmwzCUNQOQDoQe/VBh4IIqx
 bJ6WriTIXFJDiHpPR/DnIYEx0qATQWS4cPWezW4qRkUfdx25NHHh7f3snLMGoC+lmuc9
 BtGM6ECfnt+j2HnJx57TAsKBNcLqEhRe/lUKvJoljbk7/QAsV4KvyARH4yPiyuZj4D2q
 jOZA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771599733; x=1772204533; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LXf8ZAEWmgK4CVNigc0TPHiOo/zpIdTw7aieRuqY3F0=;
 b=mfiM0JysEEJjp3HY6g5E3f1CbIhvXCqXYoc4JOIunu+0FMQRZbdJQR9wDVCADcA3SO
 vPAY4ZHDJOcLgwUmyorAZML8aviYXES2Oq8fURr8Ll/6NKMkXosgpKbCWHdeqQQAnzXB
 f9o/Zui+QT+UoAwCY3I7tU4osItScFyDqdm0NwMXCzWlZ2onrIHUebPeyYFMpEN9RFX8
 Nr00SeguC+NerV6I+DIACZS020peb8FnxxLDs+EfpYYqlh1+lAS8aobJ3b1IhrEMJCzD
 BiGQimFbIZ2+MCpiyfweXjgjl8tzTO4N9gJpAdL/1OGsk8r2AAlgwMBTUew5X+MLP1sw
 3hzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771599733; x=1772204533;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LXf8ZAEWmgK4CVNigc0TPHiOo/zpIdTw7aieRuqY3F0=;
 b=IPmnJilV/bv6Q7rDszOQclNJ1UABIyJdmRMbwqrXxIx6lEnwvpgeK7GfdrG1NgN8Hc
 LNoAWLkCNZ4kiT8RFD4qbXF0elLpz1LBzfX5ro+kkR3keHwKwbD7V1BFdKzs9WVkk7z/
 r2X36L0fwxnGpPKkxlz5LCrSz5fYVPBm5MENh1SHi4+jGQ64BGkrzWZFDPFZvgL6u0Sa
 T7kFdERj4VTszYE17WH8jaWvoBvhXEc5CS1SeHXIRzRXuyq0TOR3MfWDnRJVzxTwxM7o
 S9p+UVu63OKqkGQUAXzTuYSfNCo/N4Y3LnA8nqnwEqE/xOwbpmsFgvpCZVNysKkKzhot
 AOeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCURnM1WNp/xzPOoRwXtigBUC3Ftwm63R6xr+Tucv4yA1/Tr2y5UZOpTMwMsiahKT/XSCnSBKAVeiDM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhPGkvgFxjmLbFG0rA3/O+xWEqYNSsdVBQWt+QVw86Nv91/Dh7
 N/6V4UoSuA0cJn9xCoXgnYT0W5qRTRQWKC3wgD/PwUZ/X2HEvbtN4Vvx92nYBnA9DUStagREnn1
 1Y92YZnB+MkN57BlkWqPXnK4l//bL0ZO7Ky5kkgm79Q==
X-Gm-Gg: AZuq6aIUrHuRgQTNNYbZmQdF8Wz4PHtqy6s62LMvgpw5XecUh+0O9C1vipRlqDFq0m7
 btnsUFU3VTZmZ0culFbpl1dSDfxJGVmbmanY38EZtGNNPuimSoWH2TbHmr6RzjXaqW+gFFp0IcZ
 pzuqlv7rtKF7N9c/dHYKydfSDxw5QgS+4ruf/mFMZc0HS6VAcoVycGa2XeLfNr9V+Nsb2GNA0LY
 LMTWO6wZAtE4zsq1p1NWgHTR9YlCfUOhTOCQMmjSYvG3vn/4cTtA47OTSlruv+NJaywRrTBlko/
 Aknv8SAOSqwsT/4C
X-Received: by 2002:a05:6102:3708:b0:5db:cc92:26f3 with SMTP id
 ada2fe7eead31-5feb2fdf403mr24006137.3.1771599732103; Fri, 20 Feb 2026
 07:02:12 -0800 (PST)
MIME-Version: 1.0
References: <20260218-ethos-fixes-v1-0-be3fa3ea9a30@kernel.org>
 <20260218-ethos-fixes-v1-2-be3fa3ea9a30@kernel.org>
In-Reply-To: <20260218-ethos-fixes-v1-2-be3fa3ea9a30@kernel.org>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Fri, 20 Feb 2026 16:02:00 +0100
X-Gm-Features: AaiRm507TwY53z6SEbXXZGFXg2qFlKrcfRU4p5GNQPv27asHtT9MeyWluCzW-TU
Message-ID: <CADYN=9LFdrDzE-k_QcPtgYt=RBSaS5r7AA_HD2i3eg4MRRVR_Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] accel: ethosu: Fix NPU_OP_ELEMENTWISE validation with
 scalar
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Frank Li <Frank.Li@nxp.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[anders.roxell@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:tomeu@tomeuvizoso.net,m:ogabbay@kernel.org,m:tzimmermann@suse.de,m:Frank.Li@nxp.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[anders.roxell.linaro.org:query timed out];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anders.roxell@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linaro.org:email,linaro.org:dkim]
X-Rspamd-Queue-Id: 6CE2D1689A2
X-Rspamd-Action: no action

On Wed, 18 Feb 2026 at 23:22, Rob Herring (Arm) <robh@kernel.org> wrote:
>
> The NPU_OP_ELEMENTWISE instruction uses a scalar value for IFM2 if the
> IFM2_BROADCAST "scalar" mode is set. It is a bit (7) on the u65 and
> part of a field (bits 3:0) on the u85. The driver was hardcoded to the
> u85.
>
> Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-and-Tested-by: Anders Roxell <anders.roxell@linaro.org>

> ---
>  drivers/accel/ethosu/ethosu_gem.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
> index 473b5f5d7514..a735f860a119 100644
> --- a/drivers/accel/ethosu/ethosu_gem.c
> +++ b/drivers/accel/ethosu/ethosu_gem.c
> @@ -417,7 +417,10 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
>                                 return ret;
>                         break;
>                 case NPU_OP_ELEMENTWISE:
> -                       use_ifm2 = !((st.ifm2.broadcast == 8) || (param == 5) ||
> +                       use_scale = ethosu_is_u65(edev) ?
> +                                   (st.ifm2.broadcast & 0x80) :
> +                                   (st.ifm2.broadcast == 8);
> +                       use_ifm2 = !(use_scale || (param == 5) ||
>                                 (param == 6) || (param == 7) || (param == 0x24));
>                         use_ifm = st.ifm.broadcast != 8;
>                         ret = calc_sizes_elemwise(ddev, info, cmd, &st, use_ifm, use_ifm2);
>
> --
> 2.51.0
>
