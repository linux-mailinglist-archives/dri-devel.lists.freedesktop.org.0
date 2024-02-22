Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE05B860058
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 19:06:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1EDA10E9DC;
	Thu, 22 Feb 2024 18:06:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JFDaZOZY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E00910E9DC
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 18:06:14 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a3d5e77cfbeso15675466b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 10:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708625172; x=1709229972; darn=lists.freedesktop.org;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=23sxARfoLLtuANI+8O5QcT09VvJkT8XI10hruzxREg8=;
 b=JFDaZOZYnesPVxMkm1Iny3DviZItreHyvOVucvxxDgyJoZ0P+hZBe/dGwO/ygRlltu
 hjAvkbcqqjx5ky6VB10/aW0v+r0njrrCdZspznLUxf6EXCT5fj32D3OA9CnjO0DUIFIJ
 yYILj+eHMhnfq9x0X3camPWRHB5ZtSipcY++KXS/777iW7gX7zjnQrt9sxOnmQfffRuS
 RmJMcByGBw5OnzPZmGA+5wGcKxGN9JF3jf1Ybt6EBt+0stRssjOt2KRKuv8wi6ih1Fif
 NbPHs/2Equ3ubovXVdlBSCMcwIqVkl3ElbKkvfgNMLNMPaksSQtzeztVP61fxJSRqAQH
 exag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708625172; x=1709229972;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=23sxARfoLLtuANI+8O5QcT09VvJkT8XI10hruzxREg8=;
 b=fncNVBCN6UCuwMUyjywrXb9huneyuzMwc1ersNQMjwkoyctjJAyuZDJ+R00HI+KFTt
 u/RMeQpEC6K4kI/qopcixH0nxixvxTnMYh8Ua5KcYmxBQb25koqwUn9VOb54Lv6pCugo
 iX+iTRiW6W9Hz81V22oSEkcQkXX4Zi3jzeaqX7RsYPuEcB6qNCNhUAsti1whgteBooVF
 yaRMAvuuClqN1dUHBbjBk/b86yJczFiRbom45d7wz0pfiXrgF3geVtPmPmsopSGCp1cm
 CH2YFdq+DWMKwz8sdoiFtzoEYrqskGniBys+xh2ctpQoy/LTsZ8eaDBBDR7RK7tMKmg0
 IWTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2YWroWszCWelHUTU36lgQ0UXHkRCs+c5+dJbPnmI72FRpwLKWQz3kjzZwfCA0lxdXikW+YfzgKoqmQ4kGbuo5x+CBeZeXEfsOTiRv831P
X-Gm-Message-State: AOJu0YzPqgVdFWNKEx1yGiCZsuIF0JfjqNloENdKDniUyZgp8Si9iopy
 xaRB5QYcQNWXU7HAlTRfDW3jeAiCnEmyGavgS3r74Rbs9Nnf1EZL
X-Google-Smtp-Source: AGHT+IFhsO8Xnm0fF5/bEORNP+Ggj3xPHQT+PkXGStvV3I38Lkij7k1+BJy0Y7PPxfc4TFdkTCGM+g==
X-Received: by 2002:a17:906:c40b:b0:a3e:6bd4:9ac3 with SMTP id
 u11-20020a170906c40b00b00a3e6bd49ac3mr3085190ejz.11.1708625172028; 
 Thu, 22 Feb 2024 10:06:12 -0800 (PST)
Received: from localhost
 (p200300e41f2d4600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f2d:4600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 sn24-20020a170906629800b00a3e1939b23bsm5826313ejc.127.2024.02.22.10.06.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 10:06:11 -0800 (PST)
Content-Type: multipart/signed;
 boundary=4a659079f1e590d675fd8e64a35f402ed1085394e8a76e8a2114007e0625;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Mime-Version: 1.0
Date: Thu, 22 Feb 2024 19:06:11 +0100
Message-Id: <CZBT2NJ7IDA5.1OXUZ5JBIQE5C@gmail.com>
Subject: Re: [PATCH] gpu: host1x: Skip reset assert on Tegra186
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Mikko Perttunen" <cyndis@kapsi.fi>
Cc: "Mikko Perttunen" <mperttunen@nvidia.com>,
 <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240222010517.1573931-1-cyndis@kapsi.fi>
In-Reply-To: <20240222010517.1573931-1-cyndis@kapsi.fi>
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

--4a659079f1e590d675fd8e64a35f402ed1085394e8a76e8a2114007e0625
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Feb 22, 2024 at 2:05 AM CET, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
>
> On Tegra186, secure world applications may need to access host1x
> during suspend/resume, and rely on the kernel to keep Host1x out
> of reset during the suspend cycle. As such, as a quirk,
> skip asserting Host1x's reset on Tegra186.
>
> We don't need to keep the clocks enabled, as BPMP ensures the clock
> stays on while Host1x is being used. On newer SoC's, the reset line
> is inaccessible, so there is no need for the quirk.
>
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/host1x/dev.c | 15 +++++++++------
>  drivers/gpu/host1x/dev.h |  6 ++++++
>  2 files changed, 15 insertions(+), 6 deletions(-)

Applied to drm-misc-fixes, though I added the Fixes: tag that Jon
mentioned in reply to v1 of this as well as his Reviewed-by and
Tested-by as well, since this is pretty much the same patch except
for the comments.

Thanks,
Thierry

--4a659079f1e590d675fd8e64a35f402ed1085394e8a76e8a2114007e0625
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmXXjRMACgkQ3SOs138+
s6EGhw//QO3oeEMLuSNhH/BAcFwzkvx66/9jQOm1ZXuVXQyXD7SPXWUkYmdD7MAD
jYGu2TSeBwmXERytQOdQPTCYGsADbVnrP91WwqmMtjcWExnkRO49NgSkxzoWRm7E
REtIWJ3QtS7SwnMgqlQcudFtKlNrAiTkpIgJQogfshQ2lIt6D0wkGh531ZMSKSjK
DPBbVC/D9MBUhq2kV40t9itXjdEXrITIbzTMKdCdOVqFVFoKApDtPTiwrxhye9YN
BqOgjs45Rt0qe0RmoflK4BNhn34MSbIreOUqyGHBbbJjMHBfmnYXPG82z8Omdeoe
e8hDdbTs3NGly0/lzWLaOXco92C6QdmfP+eab/ZUW3xtUjpuuN6cfM6HWKrzkzS8
RmOJFu3/JqXdlPvbDNH0jwibpytYXicMPumSx0kLeFpstSTBuaUb1gaPguBHOg40
VFvlSzApq3Qf+dWa+QEr9g2Qy07HYQVCn1/ggEOnWp7tCZdCRyWhY5tYeQSiiQdI
kuXfO/d8nBypShDOlFp9fUSJOPoOxxXS5kg2xH/N5ozKEj9JABpNW6n4XKAnw3H9
XIPrDeW+Y7XCcSRPEoGK1ZY5C63wOhZAQQj5dFRB80pZ3UYl4AROisrTr9CAUYWS
/09cBIDw8vYDWFSwTeDBqbIAT/M9DXTB8qOQG/nZH4Z5/8c1224=
=TH+C
-----END PGP SIGNATURE-----

--4a659079f1e590d675fd8e64a35f402ed1085394e8a76e8a2114007e0625--
