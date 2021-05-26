Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34835391892
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 15:12:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 312DC6E4F8;
	Wed, 26 May 2021 13:12:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA416E4EA
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 13:12:25 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id z17so1082774wrq.7
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 06:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+NH+U5vO/IFNZscOsXAWCP+NPUo3uYF1MTfXKjnDIYw=;
 b=iwUPN+Ew24Jf5bPzMRakaULMn6YXc84KAOR+tGfXxr4aqqOACrhBPUFvpvtWllnlSQ
 cvEJLFy6p9CSlS+f0cXuUUxRfV9zXWs2JZpRKTzMaGbqcIbTAYSvoSGyEK7LnBU1rQh3
 74IljsYACyafuK/gnmfZUhiad6UiPblLjvgdoUbW60MQIhCgtN4oA5oc5bmR86MV0QA4
 t/ZoMMqYGRHEG2uBbKtDM508jzZ0fvsjxtg1NHaiaO3aafbcAEmt/cnYTGgYvfkXR8zP
 WCBGyhdKlwSMYYWi/pM4s6MkmExwrAi3kBdTfS/M+WtkuDgpU+PRAPjP+0RQ5dUQOKj5
 d9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+NH+U5vO/IFNZscOsXAWCP+NPUo3uYF1MTfXKjnDIYw=;
 b=aqtwzJiqNQfaZ7lYa1W013QvhAy64gqsZ9FPSQ0K0Ab51vnVuZ6h6ynjQZmeRXGR5j
 Fh0Uks8LihyAMDLuu2dxUx4nekYysxEEFuSoZPl12Rdc0RIpZVbqbHgqW9KZgz5sxTAG
 xOUBerTgVmeTP5Th0J6epPZBJnJvi4Y2C/Ruwd8Tq2OroYGfSoodHg5fyKa1Y20Sxcv5
 bj80WnnXDg5yKSQXDgnB6F62bO5jhOheCkDOb00QQb+5hGkS8UPBpghKwXB+kl3bA/w3
 DZ8XBU3Jj1Nu8rKlsXUuN+kwjFQle8Jrey28IPPPaCfr+Jpw0BY4L0KWYhgOZLR1vj9U
 u3iw==
X-Gm-Message-State: AOAM530ogsxZg7Gu+2iZZ+jRRgwJt+GbwGCrT9rpEkaA+0/ls7ml2Kro
 pd+G+DVJi9GGQltluszHBk8SqhGwRQ7PJWioW7UfHQ==
X-Google-Smtp-Source: ABdhPJw9LA9GMJ4q5Qaip1X/LD6PP/IcCoAZEn3xFE04tMp2dqzlEsArHBvWu3ft2kb90dtgJyIQ/t2uMb9Zlnd/t0c=
X-Received: by 2002:a05:6000:184a:: with SMTP id
 c10mr34694182wri.244.1622034744051; 
 Wed, 26 May 2021 06:12:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210525211753.1086069-1-jason@jlekstrand.net>
 <20210525211753.1086069-6-jason@jlekstrand.net>
 <acc1737c-261d-9da5-7ea7-759063136c56@amd.com>
 <CAPj87rN_7vmmWcL1vqhvM=etaTjwts_L0vYbsgvYF0_qZw83gw@mail.gmail.com>
 <770eb698-1dde-9e46-da83-44911d96abec@amd.com>
In-Reply-To: <770eb698-1dde-9e46-da83-44911d96abec@amd.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 26 May 2021 14:12:11 +0100
Message-ID: <CAPj87rPdMthO2Wv7QxMGnO__BiZVauMa9HaRk+35Sgvm69QSjw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 5/7] dma-buf: Add an API for exporting sync
 files (v11)
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 26 May 2021 at 13:46, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
> Am 26.05.21 um 13:31 schrieb Daniel Stone:
> > How would we insert a syncobj+val into a resv though? Like, if we pass
> > an unmaterialised syncobj+val here to insert into the resv, then an
> > implicit-only media user (or KMS) goes to sync against the resv, what
> > happens?
>
> Well this is for exporting, not importing. So we don't need to worry
> about that.
>
> It's just my thinking because the drm_syncobj is the backing object on
> VkSemaphore implementations these days, isn't it?

Yeah, I can see that to an extent. But then binary vs. timeline
syncobjs are very different in use (which is unfortunate tbh), and
then we have an asymmetry between syncobj export & sync_file import.

You're right that we do want a syncobj though. This is probably not
practical due to smashing uAPI to bits, but if we could wind the clock
back a couple of years, I suspect the interface we want is that export
can either export a sync_file or a binary syncobj, and further that
binary syncobjs could transparently act as timeline semaphores by
mapping any value (either wait or signal) to the binary signal. In
hindsight, we should probably just never have had binary syncobj. Oh
well.

Cheers,
Daniel
