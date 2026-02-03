Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEf1OQaCgWlNGwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 06:05:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB81D489C
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 06:05:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB3510E1F4;
	Tue,  3 Feb 2026 05:05:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical-com.20230601.gappssmtp.com header.i=@canonical-com.20230601.gappssmtp.com header.b="Mwn2xgdq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B63DB10E1F4
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 05:05:04 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-59dd4b602bfso6402420e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 21:05:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770095102; cv=none;
 d=google.com; s=arc-20240605;
 b=E1cPKcs8RbWeEERevKfYjmHB0Y/Jo3He+bXYuvWWZYUrir+z6+hFKrc6Rlv4PAYXbZ
 ctJ6qHTMIAoxWkZxm3H80IetRMonaskPAkojGWDsTAC2Lx2yv1gciEIr6669q9lj4s4f
 3fwVcJDAhHdWrIHkuIaM7dikpLFWQy910HarWR1Gt07G/YkYJU0WcmEsofgT3SFPoTys
 IaFMU2VVuWj19C+Yov0UNPWfNzb4byQXzP4IgbAY6xV6HCDFjCLY4iVvJJIOP6SoDo0Q
 8to0nsQGvJU7LCJ8fva+R5jXuQ2FoSYrk7G8CE4ytSCKi992zqxQzB405DfeF5ROygRS
 R73Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=R8Uq40im68Bsn440IXZslpowd8o1+PpzUOCwvDYaiRc=;
 fh=09oeyaIgOVPQ2GWN8eKWuJ6LQ3uBprSWpDE8pPtqfOU=;
 b=I5tCe5C12a6IkeDZkHtju4c72eTbJimO79l6N6s8EsOiVk0GTMtAT5zsiqniZUIXdK
 KZL8/f+QWMXmC7ahlTHBfNz2PrU4HfoIn3ONlrjUfQDHae/ccVOAi6hUspEp8PBAS4+0
 7xWhUw5sbdAeO94zgl1mZoUrPi8hQTISdhQHANJMsF7VlvcqUoxERIS1WD3YqIWvQxS0
 8i5qLGLw+9N6KPtq74y+WvDJCS0Usc/4Qz6EBK7fkNmDgKaQYFA//Mt/PbYIQ5dMzOMf
 611Q9avgfacJCrKw8XPPGdeGZIXC446XC0L6ZNs74QhbuRhbVghQqi2352nn6err2Tql
 eguQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=canonical-com.20230601.gappssmtp.com; s=20230601; t=1770095102; x=1770699902;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R8Uq40im68Bsn440IXZslpowd8o1+PpzUOCwvDYaiRc=;
 b=Mwn2xgdqfENDEYcRBQG4KOqB54YMCFVvrp+uTfseuidOC6Gpg2YAjVPx9X7E9RObxa
 OcaYBQxwBwUbIBQfWDF7OwHsg+OAqQsuoS0ZPvMCb3FLCyNUtrHVqzYIoZ+LEXxuYVjG
 hNZ+ckQk1hR6qkpmw1g88GTYfTZmyT21BNvVmUffAmaN9BV2v+WvC/Dr4OHbK3yj+L3X
 2niESbQDIac8wwOga32+q7yGzr1QDi4S58e0yMxNI8rwNOyzYw3k+jV6Fa3Ih6g9P91V
 o96sTMO/wD+CBdqYyY7s37GQRAE4trXGoX6eLx77YxNvWueKChUi13+040vJQeZfM9yv
 Maaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770095102; x=1770699902;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=R8Uq40im68Bsn440IXZslpowd8o1+PpzUOCwvDYaiRc=;
 b=rEY1FZB3qXN+z1M15x2l8OcTp5yzisUyQkYYzvyf5TBV+VAfPxH0Aebo/d7E2JxsCx
 eZiqafbrcbEcUqoseLpl+fJ3sR0/7yghnQfvA39tFJCeJU1wzz71I6CeFJhpus/Wl8kj
 7eB7h5Y8bwuYD+/bgsBfhjn6yii7VlyaGN4W5L3mSHHAC7ow0mKsXzKnMYFa4CHJZvlW
 tLcfHiRYFcRSs3r2JjidqGre/aLExtiKbLANyKwf61b6r4FMBwFw5B0DQC9uEwyumHRZ
 r73dwn7yoROpKq5oB1mdiwJ0lTdFolHTNbBEalCUr55DJ516PS61Pgfj4pz0oDLsq7Sk
 7p7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVM9i70HYU9eEv7ywmrLEYS5elJa9T94rrItJ/4jz7EdXs8gxf3uPXhQ8JI9HGHHvyCzWXQZbhLE8U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQBuebLd5LxJiyA4hodlPqWdSxBqKw3X5A184kGSgD8iSHSdwP
 T7pWmJ+QvbHm/w72YRaknWi6MEkRNixnZZahtWEqgfwRy+cVZW5MozXMXZ7/FM6LIDfla6Y3PZy
 IxFI7XtZnt4pEN1bizAT/QXC3umVQb5M=
X-Gm-Gg: AZuq6aJZHJDcw12KxtJbuJyQ7QaXvsavW2CyfRyK8Euau21SEfXG6F3lX5CdsLzTr5R
 Mz+eDka3EF2CkgxfX6UV7G8YCvn4cEQy40SMwaqxRmMlETTawqCQph43nX4e0e2V97eubeCWBm0
 ZC3QFJCTd1ZatZ/lEGXsSWStefCwnAQgudqTK4AzIzmALrCg3cKqQM+dKpY3bNSpamypT0d8m7n
 DUISGRYR+33QMVZCa6aI10zK8ppY08utlBuJ6KGK9VZ6t0gmZi6JiIVT25wOuPHxWfOA2I+
X-Received: by 2002:a05:6512:12c4:b0:59e:1813:76ae with SMTP id
 2adb3069b0e04-59e181378f9mr4300091e87.44.1770095101318; Mon, 02 Feb 2026
 21:05:01 -0800 (PST)
MIME-Version: 1.0
References: <20260114011917.241196-1-acelan.kao@canonical.com>
In-Reply-To: <20260114011917.241196-1-acelan.kao@canonical.com>
From: AceLan Kao <acelan.kao@canonical.com>
Date: Tue, 3 Feb 2026 13:04:49 +0800
X-Gm-Features: AZwV_Qi2T0EhTqZVBJiCZ6adKX1ZiJrDZb_bikoYUAtxh6o1wMI284ojl7lLFWc
Message-ID: <CAMz9Wg8ez3U3qbB5AbyA_8QUkEoPyejyAhyy82+xwiH8wxi1Jw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: set SB_I_NOEXEC and SB_I_NODEV on dmabuf
 filesystem
To: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
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
X-Spamd-Result: default: False [0.19 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),reject];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[canonical-com.20230601.gappssmtp.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[acelan.kao@canonical.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acelan.kao@canonical.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[canonical-com.20230601.gappssmtp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 1DB81D489C
X-Rspamd-Action: no action

Chia-Lin Kao (AceLan) <acelan.kao@canonical.com> =E6=96=BC 2026=E5=B9=B41=
=E6=9C=8814=E6=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=889:19=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> The VFS now warns if an inode flagged with S_ANON_INODE is located on a
> filesystem that does not have SB_I_NOEXEC set. dmabuf inodes are
> created using alloc_anon_inode(), which sets S_ANON_INODE.
>
> This triggers a warning in path_noexec() when a dmabuf is mmapped, for
> example by GStreamer's v4l2src element.
>
> [   60.061328] WARNING: CPU: 2 PID: 2803 at fs/exec.c:125 path_noexec+0xa=
0/0xd0
> ...
> [   60.061637]  do_mmap+0x2b5/0x680
>
> The warning was introduced by commit 1e7ab6f67824 ("anon_inode: rework
> assertions") which added enforcement that anonymous inodes must be on
> filesystems with SB_I_NOEXEC set.
>
> Fix this by setting SB_I_NOEXEC and SB_I_NODEV on the dmabuf filesystem
> context, following the same pattern as commit ce7419b6cf23d ("anon_inode:
> raise SB_I_NODEV and SB_I_NOEXEC") and commit 98f99394a104c ("secretmem:
> use SB_I_NOEXEC").
>
> Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
> ---
>  drivers/dma-buf/dma-buf.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index a4d8f2ff94e46..dea79aaab10ce 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -221,6 +221,8 @@ static int dma_buf_fs_init_context(struct fs_context =
*fc)
>         if (!ctx)
>                 return -ENOMEM;
>         ctx->dops =3D &dma_buf_dentry_ops;
> +       fc->s_iflags |=3D SB_I_NOEXEC;
> +       fc->s_iflags |=3D SB_I_NODEV;
>         return 0;
>  }
>
> --
> 2.51.0
>
A gentle ping, please review this patch, thanks.

--=20
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)
