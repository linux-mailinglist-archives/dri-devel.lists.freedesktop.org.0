Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12485A4418A
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 15:00:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C263410E6A5;
	Tue, 25 Feb 2025 14:00:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="BVdosQ43";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 962E510E6A5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 14:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1740492027; x=1741096827; i=markus.elfring@web.de;
 bh=HIc4omP8IbDtggPZZGnEqQnknZ3Pe8zMXVMDeyALcDo=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=BVdosQ43RXaej7khcdx8PGH40RKeuQYZa+AIXDIyBEZKnY5kbP5LekRgo2T3Apz2
 Zyg4B+Mwb2sJgbZRNzUTm631b3TQEHkDro8AcyXpuV35aEABcXt587fUY0oYvYcCs
 hiQGUWFFYN/m8MnsHhA3yE3ijVvNcAhcOQDAvaL2oYDDbndAGRi2Hux1t45PjuQsr
 PuLMl0g93SQpH5GWq0BZt5Vp6nseH/G3OXsQuI7KDPZQJlsao5bwlGFGFrNNAkr3R
 ibWxDmJUHF/noLq4FU8aafpPD+zQg65BBJc7R85ZNaj5lwoo2qcXOKhVHDiDHF0Uo
 Ka8RCsYyUOMXTnovWw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.36]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mcpqq-1tE8td0t6o-00asfo; Tue, 25
 Feb 2025 15:00:27 +0100
Message-ID: <bc3ae5a6-9b04-4f1b-9045-2182138f748e@web.de>
Date: Tue, 25 Feb 2025 15:00:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Qianyi Liu <liuqianyi125@gmail.com>, dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Philipp Stanner <phasta@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20250221062702.1293754-1-liuqianyi125@gmail.com>
Subject: Re: [PATCH] drm/scheduler: Fix mem leak when last_scheduled signaled
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250221062702.1293754-1-liuqianyi125@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5cuqKylqTNFjYrhDL/rMPd351yTTTVW7fp9A6kzA7t79GRUkJfx
 dxhbz3J3AwlqLbO7PpR180PnYanEbE0dBHAdy3q/qLfyvA4BzvRJBU70lbJa5NQhGBVIpnO
 FJ4zpGl4dyjMIzr8ctB+HJajsRFSYPwO2grpgelfE7dPHEF0qumWBtPFARJeCw44YyJXALA
 /MGSovTRxfE26Ol94WuDw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qoTXesFAs04=;LuYDJvGE4k3+uxvn5P+XMBzEvsI
 DMPnxvTcXXOPMzG3sdamynSLB/aAuhT4sGY/c8FqmCUS3LF855BcFElXlPPSvCa/mEmpR6DQ5
 WrdMyQdRW+G1jDbq++SQ73RzBUm8XOyixPVihvbxzQLHRkf+oOzOJJSehaXZmV48t34418dyX
 BJ28O+bIQ7pzGLtq07Fzm9U8Vv1loUesSoZ69fqkdbdeS8ktxcdBSBOaarGl22hQWT0SFpDvg
 Y5ZB52dC/VvlGsTvjDOoKr4z7UNVhNIil1hNfW2hEIIyE1DNxdjKsW62sGjkoHVPwaKXhOAUT
 +IkVoerzblUXsqeQUJg55s/HC/fwGe9jOkt6/TZdTtyw1DFfLH4kxN/3MBabnAXmCV9BhKK4X
 se/kZZWaLIGn7zuH9LtRreVKYzBZH2x2w5IXdAEELg39/D4p89zVivys+DOPJVg33VP4aM32L
 XXp0m8Pb15kH9I0PiydvVJYmjVFjrGVC0gQcAuoLSW6+6GKCTf9Sf6CSRcXSCYkQHhhhoFA0c
 5UKLc+uRkXeQzHGzD+lNKB2lktX9faWF4d/OzDieFn3gqwPT0XF8AETc+QnH41BuQ2ANhNeWx
 HVS9Lzt6G39I9UZ/4nocCTV2Cziex7BWRgwJfqr5RHWq5PcRBl8pk+vooYmMEzomZRXrQBZN7
 e0x7XL/UAoWlYYyXoTk6j2OzssqhG5K/fciPIyNiF2VCCSiRKnmKgSOjrvTvy0zxoEFa+ortH
 KvVoJblcvgKDi720c3M1nxPjBLM5gk3uWP/Orj2g2hkI9hm2/RBOn7pLX1lAj97EwrM5RApqw
 0H2uN5Ja9vFPqQoF4Y/VeGGXYwdZr+0QpgqsQU6HbP+/wNaO1oTYidhSsDpH6S20wEHjcNvz8
 0C3TBInTKEpCeg18IKX82h0NfcNt+PAV/F4R9p6KQdbdUKGqfcDzvGodHekbd+EWPk5d2/HjQ
 4BnUHp89fyWNjPJDFY/mS7T0isFulHH7KuU0ZyJ84Rz05lQLeAnwXmhWBX7jRi/geqw9podCE
 bPtabC9rfPfl2yxUw/80itf6Jqz6XURJ52lRN3ioXvBsIe5/Z7IHUy2bQIKCWDNty2kISi35p
 KVWA6dsFYF6Oh1QpV9PpYozUY06s/SkK5w1zMazU2sa1jTLmwUpkt06Y8w0XnFEpPeyfaY36L
 sCS861Qm/BJtDXQoxexqOdC61RpfBDJa2F/fy84abZqXCM8VhdMClzzZsFV4IZuzS2uM1tyCC
 rZERvwYKPEVYuvWYZeMHvmqthcdFZzalkrCnh2JWI+16PFkFcaBPvgYK+mJ/IGnTscHxFGNtl
 QVWSHWN+QYs1cGW6nd6UEEgHjFn55hwdavftXJuXxryKAkCz3P2ayplKzqEEzIKElniiAMPOf
 FXHi/QRTEfOlStdBM5kURFN/OUPYkW9JD0X/Ja/VoN0e6LuXQWF4KwfDOjg/ZVc4/lAT6bpaj
 OtuAgu57/ZgqI+sf7tx09wzid/is=
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

> Problem: If prev(last_scheduled) was already signaled I encountred a

                                               signalled? encountered?


> memory leak in drm_sched_entity_fini. This is because the
> prev(last_scheduled) fence is not free properly.

                                    freed?


> Fix: Balance the prev(last_scheduled) fence refcnt when
=E2=80=A6
                                              reference count?


Would a summary phrase like =E2=80=9CFix memory leak when last_scheduled s=
ignalled=E2=80=9D
be more appropriate?


How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.14-rc4#n145

Regards,
Markus
