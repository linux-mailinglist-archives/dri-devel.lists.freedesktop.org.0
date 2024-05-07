Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C333C8BEDCE
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 22:07:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0377112604;
	Tue,  7 May 2024 20:07:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ayce0jpT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406AC112631
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 20:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1715112466;
 bh=fipWuacVxzVGjU5VN53PElEjG/EVMb8BJ11r6n3Qv6w=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=ayce0jpTxn/KmZ5Mg7KGIx3PNbevbAYK9fpmSuiWhC9OoTF5RynAKB31qJBgqop6m
 SCuon0S6OseuU+bLsJvOo768IJ/HQxvJc7YlZDykNaHUatUmZVqZIOXAu67v3ObuAT
 rBWLOmR2jVrcZUNfXp3PDUuFNsnrSrhAU01VCRM9eytOy0S50jtKbjIClzR72op8ip
 mPuhRlzPQoYd5RWXWJ2OcqZY547pj/GLfuH5K/0S3QqIVuYq4nWRbltLhOMkFjR/y7
 okl4Xc8YxYOIThydVzngeXdBIGaSX3i+S0LmWZ4mLpwSITDBsfz5MYqC6w4GH/JLEU
 +93cxjjAc5JDA==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com
 [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nicolas)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9274B37809D1;
 Tue,  7 May 2024 20:07:43 +0000 (UTC)
Message-ID: <4f59a9d78662831123cc7e560218fa422e1c5eca.camel@collabora.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present
 users (udev uaccess tag) ?
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Daniel Vetter
 <daniel@ffwll.ch>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Hans de Goede <hdegoede@redhat.com>, Sumit
 Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Lennart
 Poettering <mzxreary@0pointer.de>,  Robert Mader
 <robert.mader@collabora.com>, Sebastien Bacher
 <sebastien.bacher@canonical.com>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>,  linaro-mm-sig@lists.linaro.org, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Milan Zamazal
 <mzamazal@redhat.com>, Maxime Ripard <mripard@redhat.com>, Andrey Konovalov
 <andrey.konovalov.ynk@gmail.com>
Date: Tue, 07 May 2024 16:07:39 -0400
In-Reply-To: <20240507183613.GB20390@pendragon.ideasonboard.com>
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
 <ojduxo54lpcbfg2wfuhqhy7k3phncamtklh65z7gvttcwztmhk@zkifewcy4ovi>
 <3c0c7e7e-1530-411b-b7a4-9f13e0ff1f9e@redhat.com>
 <e7ilwp3vc32xze3iu2ejgqlgz44codsktnvyiufjhuf2zxcnnf@tnwzgzoxvbg2>
 <d2a512b2-e6b1-4675-b406-478074bbbe95@linaro.org>
 <Zjpmu_Xj6BPdkDPa@phenom.ffwll.local>
 <20240507183613.GB20390@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0
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

Hi,

Le mardi 07 mai 2024 =C3=A0 21:36 +0300, Laurent Pinchart a =C3=A9crit=C2=
=A0:
> Shorter term, we have a problem to solve, and the best option we have
> found so far is to rely on dma-buf heaps as a backend for the frame
> buffer allocatro helper in libcamera for the use case described above.
> This won't work in 100% of the cases, clearly. It's a stop-gap measure
> until we can do better.

Considering the security concerned raised on this thread with dmabuf heap
allocation not be restricted by quotas, you'd get what you want quickly wit=
h
memfd + udmabuf instead (which is accounted already).

It was raised that distro don't enable udmabuf, but as stated there by Hans=
, in
any cases distro needs to take action to make the softISP works. This
alternative is easy and does not interfere in anyway with your future plan =
or
the libcamera API. You could even have both dmabuf heap (for Raspbian) and =
the
safer memfd+udmabuf for the distro with security concerns.

And for the long term plan, we can certainly get closer by fixing that issu=
e
with accounting. This issue also applied to v4l2 io-ops, so it would be nic=
e to
find common set of helpers to fix these exporters.

regards,
Nicolas
