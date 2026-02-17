Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFW4B5YelGk1AAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 08:53:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6AE14965D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 08:53:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADD510E453;
	Tue, 17 Feb 2026 07:53:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LNnvFNt8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E6210E453
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 07:53:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7DEB2407B2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 07:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5168FC2BCB1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 07:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771314829;
 bh=tA2t5oeOUZ8eAwOpBVyGbemY7+jVRLWknKxnMDhCYms=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=LNnvFNt8TzdVxP6kq+X0upGc19BXHfJFty3jpW6tHWQJBEFvfpyonpjVgsx+jJ8mW
 OhxWML1LoAuUxm6+M0IARUuQl8IpXeq3+tOEtWsvJuEwOD9nRjWDP/3PsuMsv7RZQ0
 xsb/4z/aHIf8IXV9W1PuBJDPsydg617d4nwN8d9c9v8y5b0MP32wNRAZT+Yeq1YnIF
 tKMvS140nE/O7gk0LldojB8VqdP+gJKoyiKObJFg59UEgD+cQ5qxdiadZ1yhraRSTT
 v8KRahk1cQUgDZRiKE/Ps5AcYuVJ6HpkkhH2HZ8FWx/l2liL76A5UDmxW0kJacNQvz
 bLZC7NTveINRg==
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-38706f96202so24713091fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 23:53:49 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWAmKOGUL842YNvun2rJfJcSCFhwcxScjYcUEX+KAXaBrmupg4a+H7A8KyyW+BaXnZYpV1AfnEhy+8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6Np5ASSJPhOIDFh4adNhJH5dWoDjgT037AYc4VgHDtqrEPl1o
 bQBuVvDoD5pJFEpfDRBXjPyImHoPCxzptIpjgxBm6ARB+xMbJPSIdnA95oRblF8QOkLYKAVzPt5
 DeLuKDWXD9scsqkt6IgHDD7mhxba2wO4=
X-Received: by 2002:a2e:be1e:0:b0:383:1232:379a with SMTP id
 38308e7fff4ca-3881050bca3mr34254911fa.2.1771314827466; Mon, 16 Feb 2026
 23:53:47 -0800 (PST)
MIME-Version: 1.0
References: <20260217014801.60760-1-ethantidmore06@gmail.com>
In-Reply-To: <20260217014801.60760-1-ethantidmore06@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 17 Feb 2026 15:53:34 +0800
X-Gmail-Original-Message-ID: <CAGb2v64iwahkDyuTtWo3YsdgExBu-fs8XRcsgPvWX5ETb=irtg@mail.gmail.com>
X-Gm-Features: AaiRm53D6IJmr1XrVqkJyD7FBEAc639vco0g_d6NG7g082rgVzjQ9c8XaAjLhcg
Message-ID: <CAGb2v64iwahkDyuTtWo3YsdgExBu-fs8XRcsgPvWX5ETb=irtg@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: backend: fix error pointer dereference
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: jernej.skrabec@gmail.com, samuel@sholland.org, mripard@kernel.org, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, 
 simona@ffwll.ch, neil.armstrong@linaro.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
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
Reply-To: wens@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ethantidmore06@gmail.com,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:mripard@kernel.org,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:neil.armstrong@linaro.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SEM_FAIL(0.00)[131.252.210.177:query timed out];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,sholland.org,kernel.org,linux.intel.com,suse.de,ffwll.ch,linaro.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[wens@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[wens@kernel.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: DF6AE14965D
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 9:48=E2=80=AFAM Ethan Tidmore <ethantidmore06@gmail=
.com> wrote:
>
> The function drm_atomic_get_plane_state() can return an error pointer
> and is not checked for it. Add error pointer check.
>
> Detected by Smatch:
> drivers/gpu/drm/sun4i/sun4i_backend.c:496 sun4i_backend_atomic_check() er=
ror:
> 'plane_state' dereferencing possible ERR_PTR()
>
> Fixes: 96180dde23b79 ("drm/sun4i: backend: Add a custom atomic_check for =
the frontend")
> Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
