Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B787698FB8
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 10:26:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FBA910E155;
	Thu, 16 Feb 2023 09:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F67510E155
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 09:25:54 +0000 (UTC)
Date: Thu, 16 Feb 2023 09:25:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1676539551; x=1676798751;
 bh=oIRsogz2f3h1q01mDqxEBXvMjkDqA3FXkBJjqRebGFs=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=mf0QvuAPnKaSKcbUszGgu34Ir+4a5jC4WzBNzcX6YknctoYm9u0wePXIYzZ/zSZxB
 ZAfy90J9zu39KfRsc063niziQaJGEWeS3lLOlBBniJmCJXJCcfZzxzDzcQD2x3QkXw
 adO1lk2vy9lb6O0lRyrL79DlqF9VyiuK4HDbYYChmGaY85bJ+qCr56cSzOc6jr9Roi
 EIv80PwPqpNmjl0UDHikjpHW0mWp2jD0HixOYYl3/INoK++iyuKUlYDKH2m6RFX1b5
 PfYXn5HIxLGk3D5xy81GbNiuQ9Xu26ZwsrjaLob/pbf//iqZN9rEtNgpELHkBikSsw
 RsWn7IBjVlw2A==
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: document expectations for GETFB2 handles
Message-ID: <fDk5M2V_0bRfC6CucNJLDy971yxeJ6UrqzhaDHHp-jCBT16MQowi_i_grjeeHV1y2awJFyFwxolMbkWwcpM3hSKj3s9Jt91VJvQVMhgamao=@emersion.fr>
In-Reply-To: <20230216111110.5d1e8e7d@eldfell>
References: <20230215124152.101548-1-contact@emersion.fr>
 <20230215154123.3f9fefce@eldfell>
 <ia5oa4sV74Cq0n0T5yDytOheked1Uuxb8CHh7L_Hdi51oIWuWIwOuqWsidJz3LrNdpoQqT7wNBgvSxVfKV-ZbbHLIC6U0aRrae9rVqUUpYg=@emersion.fr>
 <20230216111110.5d1e8e7d@eldfell>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: daniels@collabora.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, February 16th, 2023 at 10:11, Pekka Paalanen <ppaalanen@gmail.=
com> wrote:

> Btw. does this also mean that if you use GETFB2 to get handle A, you
> export that as dmabuf and import in the same open device instance, you
> again get handle A?

I haven't tested it, but I believe that is correct.

> IOW, you should never ever export a dmabuf of what you got with
> GETFB2. If one did, one might import it oneself via GBM, breaking all
> reference counting. But you also cannot "just leak" the handle A,
> because if GBM happens to run on a different DRM device opened
> instance, GBM would get a different handle to own.
>=20
> That's... err. How is a compositor supposed to do transition animation
> from an old FB to its own thing? I guess mmap + glTexImage2D equivalent
> to make a copy of the old FB so one can use it as a texture?

I think the compositor can export the handle as DMA-BUF, then close the
handle immediately. Then go about its business as usual.
