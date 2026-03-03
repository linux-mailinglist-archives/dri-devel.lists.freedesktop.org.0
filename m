Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEbtHDI9pmkZNAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 02:45:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C96851E7C98
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 02:45:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A05A10E60C;
	Tue,  3 Mar 2026 01:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="hGRe8rVr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D0910E60C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 01:45:18 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-48373ad38d2so16785e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 17:45:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772502316; cv=none;
 d=google.com; s=arc-20240605;
 b=R++EC8+P3vJtZnBF+noGj4/ULsOSh/2kw+kAo+Yi4XdFTq3jQjI6swZ9+E4WyLLniN
 v7NUqpf6xccW8GAzm4lGCqhHiB2bi3ceozsc48j4LFkDTCWnrLTnLMSiA4rUA5hVEfZi
 CE7xIsQSM/mFQdRic+oGrU7RkPWRqqYDk75FaK8y9o1hMbmU+FmHo7oL23YGZryviY/k
 8QVDRttE387qJw8x/lDHAXvTQM3amYWZMczc67hMG/KciKP7vZaoDEkTEnTFWSg+rTTW
 Z0YC2xom3kZ5Ja1GaaPgO1dfGb8Rb9cKSMYYPfAnNOyoEpjBZgEAUIExPgHLp9TWO5/e
 m6BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=eVfO5NGg3pLHjsODSCaTQcdIWTdROEkpn3YHlUIRyY0=;
 fh=kDDZMN0u8HB5c6R88oOgIpSdxtYg2jMtoJWmxBUILKE=;
 b=VEkLEwQsTwz2jD2eoj+ZAbTNRcBVdpT7iG1El3cnuJafVR+5MlJj+DosMCDc8YUPUq
 /mVU+HD20pD5lSV53QXUWGXYOASZwq9X2jOqE/6bRj72kHIstXvot0GCeK56ZZJODMiw
 /31uvOxNnT9Yv1erC0SBa5YcTjC75qs2Qlp/w0jfJjnPHhZ5ntTVv8MxYPMqHuNem+aw
 rzyLzmZ8XXSqGrVKTaKPIeC++iKY8/Z12qkUkadyqW3TAHDe5mUxKuvcJDibOlowHter
 l8+WT8GuOHhXeYazZC6uiKYgodxtLiXD8bIAH/qBqX49+XDECghevGQ0Erwk7qEuxCUO
 uPyw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1772502316; x=1773107116;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eVfO5NGg3pLHjsODSCaTQcdIWTdROEkpn3YHlUIRyY0=;
 b=hGRe8rVrzERqCtZHPhZt7aBX8p3tQ+eF7YpmzRQYkv2U0l0Nkl7VqWJqkkkE3nb11X
 82QimdRy5h+qc3hRd1dcYkxe6z05ASd4Okl6g4IVBIB55wWrdX66v8KbqtJ/6qClTb+T
 FCaKVqaXAFjkuIvLcbeX5Y34CgVNu3wkqaKj/kdTUcgVimRwNFwrUW9LuyQJTnY4Hb7a
 i/laqLfWo4dk07DhQXQBazi+DqUn6N1WyYn6cFHSx9X7/Mf6dKzxhWd0VAx0YkD2hiuw
 ZDgno7o/gJcCXn/YlZC39W7ZK4t50TiQspqZpLl5yJXWAgtpqVLIMwd5/wcipLh9qVzi
 EwKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772502316; x=1773107116;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eVfO5NGg3pLHjsODSCaTQcdIWTdROEkpn3YHlUIRyY0=;
 b=lT+1r8O3EuYtu0zzxkltUQmzB7d7i9mgnqvaZ2FSSCJ2eEPy617ac6qNNUIGgR8XZM
 UYnieIojUej9OG32zlHa85VmBwBI70ZxxO67LeYpIDo2mP4BoP16NqKCOVEUTRjnimel
 xe1LEIa3jITQrY2r2iEG16YNhQvba73y2+i+35FQ7Iw/s53v2hbXTxvc7b3MVjTmMLX/
 DK6J+otCWNPYQdBmuQlSr0SmhuO3muR6tC7qat86lLtMzW8gOXRZFGeLR3EcaK+sPyFd
 ng/jLvkFe9zUHisxer62d0smcQILplL7Ggsl/8kBL15Hnrsjv/HeZpwi1SBf/G45g4Kb
 WQEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiW2RGfrHSyBjPWr17NTjSZXH/btxeCSH+9xmIxOV6x78AMG37NyejyhkrAQCjSc+2E9pE9KnYTAQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpRLrcTdcEbSEoXa9dvesNjdp3M9h3w2pFtEm2iBbVIGrxVZ4e
 fAPYT8eAhYO8aTfhJ8rzdojXUQAuD/pMYKyHS/ArNdlCrKBLv50d1QH4C7p8E0abxSJASFhuQC/
 xD2XYRjcy108CoFasxCk0XiVbJ/3pvFB/XGky0j17
X-Gm-Gg: ATEYQzxUNS8ogh31pnjezS/Ke7UTyvXpSrTtrTyt1+Pl40SqFm+6nktuxnyqUFlJmsK
 0acQWQXCrnWoTZet+KppCgagoGHRi5i2EeqrkhL8G/WK0invsi2YGfPX9G6b4j3rLnbz9+PpssY
 7DDet5AeWtDXyk7UOsZ2hYMdg80W8swR8lYZ0WYboMi+TxF6AvWi7i88QLdaDs/+66a4L3DDOwu
 TGB1V1mPTlSCTeepwHSQdn03ZYnA2fLvto+SgvsyhHLf9hrbYIPVKCVPp//VyflRs5dvehQOJt6
 4NJ/cktO5s4UJND0pTQrKfvbVkylgCKUsz7PU3MtEicXAUXD
X-Received: by 2002:a05:600c:b4d:b0:47b:deb9:15ca with SMTP id
 5b1f17b1804b1-483d0606017mr1685455e9.3.1772502316281; Mon, 02 Mar 2026
 17:45:16 -0800 (PST)
MIME-Version: 1.0
References: <20260303002309.1401849-1-isaacmanjarres@google.com>
In-Reply-To: <20260303002309.1401849-1-isaacmanjarres@google.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 2 Mar 2026 17:45:03 -0800
X-Gm-Features: AaiRm52M5VZfCpbXmMK9kpf_bZc2gUde5DZblmjqXRWIojHMBeZAG-Sxb_r794o
Message-ID: <CABdmKX3FOUUq=9rriXa3BYOOAqedaLma6TXZsA5LH0gBgCAEvg@mail.gmail.com>
Subject: Re: [PATCH v1] dma-buf: Include ioctl.h in UAPI header
To: "Isaac J. Manjarres" <isaacmanjarres@google.com>
Cc: christian.koenig@amd.com, sumit.semwal@linaro.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, kernel-team@android.com
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
X-Rspamd-Queue-Id: C96851E7C98
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[tjmercier@google.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:isaacmanjarres@google.com,m:christian.koenig@amd.com,m:sumit.semwal@linaro.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:kernel-team@android.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tjmercier@google.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Action: no action

On Mon, Mar 2, 2026 at 4:23=E2=80=AFPM Isaac J. Manjarres
<isaacmanjarres@google.com> wrote:
>
> include/uapi/linux/dma-buf.h uses several macros from ioctl.h to define
> its ioctl commands. However, it does not include ioctl.h itself. So,
> if userspace source code tries to include the dma-buf.h file without
> including ioctl.h, it can result in build failures.
>
> Therefore, include ioctl.h in the dma-buf UAPI header.
>
> Signed-off-by: Isaac J. Manjarres <isaacmanjarres@google.com>

Reviewed-by: T.J. Mercier <tjmercier@google.com>
