Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 620B0144242
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 17:35:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 758166E227;
	Tue, 21 Jan 2020 16:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B856E227
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 16:35:46 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CC86B206A2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 16:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579624545;
 bh=nDBgrcmcVV+bME7/k9Et5yvKddM+pNs77UcTAgXEVDA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=AlHP99hPMUQwdOTrU8hOg3UQ4C9Nl8xyD8D/EKnXg1Y2SxKH9QqZ6LUagDMdboyGl
 x/MYMProHwITO84eRPYtUWIdNW3nbrRijEf0p29mnLkGCdQ2HM0WXO0erkS6V2jk4v
 +vd6yB+I0j0pKSGcRZMWekPe90tcHTChuPYzcD2Q=
Received: by mail-qv1-f52.google.com with SMTP id x1so1729481qvr.8
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 08:35:45 -0800 (PST)
X-Gm-Message-State: APjAAAV3xF7E5QWCRZz0NY8tljER6Cxmj0Rct24bOW+pe/9ZoE01npik
 AV/AZgQ0yQco+eDrCkG1IhngynqCFz4Qj9r1LA==
X-Google-Smtp-Source: APXvYqyQgLWbbbl5h99b1XQndCN+P8UL2+GEct+U5tShIxZIptmCOtFZHqGHMWtJ3Tk8qCtmwxXHh/CRegYVZlcR054=
X-Received: by 2002:a0c:f6cd:: with SMTP id d13mr5569919qvo.20.1579624544956; 
 Tue, 21 Jan 2020 08:35:44 -0800 (PST)
MIME-Version: 1.0
References: <20191214045952.9452-1-ezequiel@collabora.com>
 <a31030695321857e0c9fb478e7053f669bfbf6fa.camel@collabora.com>
In-Reply-To: <a31030695321857e0c9fb478e7053f669bfbf6fa.camel@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 21 Jan 2020 10:35:33 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJKqPu+yFLPCiDeiBNbRnHZDs+=7tJBFXD+PiP2Kp9DJA@mail.gmail.com>
Message-ID: <CAL_JsqJKqPu+yFLPCiDeiBNbRnHZDs+=7tJBFXD+PiP2Kp9DJA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panfrost: Prefix interrupt handlers' names
To: Ezequiel Garcia <ezequiel@collabora.com>
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
Cc: Steven Price <steven.price@arm.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 20, 2020 at 11:56 AM Ezequiel Garcia <ezequiel@collabora.com> wrote:
>
> On Sat, 2019-12-14 at 01:59 -0300, Ezequiel Garcia wrote:
> > Currently, the interrupt lines requested by Panfrost
> > use unmeaningful names, which adds some obscurity
> > to interrupt introspection (i.e. any tool based
> > on procfs' interrupts file).
> >
> > In order to improve this, prefix each requested
> > interrupt with the module name: panfrost-{gpu,job,mmu}.
> >
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>
> Gentle ping.

Applied.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
