Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6697B7A9A
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 10:49:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 310BF10E347;
	Wed,  4 Oct 2023 08:49:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 132A310E347;
 Wed,  4 Oct 2023 08:49:43 +0000 (UTC)
Date: Wed, 4 Oct 2023 10:49:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1696409380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3olMcepc++u5sj6w17rdFjD+IEV4ubtfuWg75Zf2PS4=;
 b=RNaRGl2ojAGIWO1QXBmKprOhlK/7spm5+WnC4rW+IE6/nouwsjG+zbEPQM91Tupud9y7k8
 zoHvAEb8XfoCKKtlnG+AMIgGvWYkicf23W5j28mcGB1BStPIReVYCBkAa3syfgHLRKeu59
 GnRF/kQvVw+H0k7MYJYDxJqUL4uA6w/MzSYW+qA1dIhBooPDXCVWePn+2syBMpnsajn8nF
 aR8+/JbFIX0PlP/N0caxMu0nFcEQgZvLJgSW2XymSPohIShingPGwoKYauPWtnDP10XpJf
 oGgJ9S0vsh8p5a746/uLbBRiUnysS0G/sbmCO0XL3tVa+DfE+1rBaNf/Ig4y7w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1696409380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3olMcepc++u5sj6w17rdFjD+IEV4ubtfuWg75Zf2PS4=;
 b=29/neHjkRd4EW3K83VJayOS9nL3/jzAE6ANmMADG8Lwzo+qbjMd6hlxXmjCjZpMrRwAlbR
 26kb0rqnNJOI+MBg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH 0/5] drm/amd/display: Remove migrate-disable and move
 memory allocation.
Message-ID: <20231004084938.xP4rwomD@linutronix.de>
References: <20230921141516.520471-1-bigeasy@linutronix.de>
 <8be685cb-f44a-1143-60ec-d1073fda8e16@gmail.com>
 <20231002105813.NrEGqSCY@linutronix.de>
 <7a3875f6-122f-426e-95c9-06ed8123249b@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <7a3875f6-122f-426e-95c9-06ed8123249b@amd.com>
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
Cc: Leo Li <sunpeng.li@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx@lists.freedesktop.org, Peter Zijlstra <peterz@infradead.org>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-10-03 15:54:58 [-0400], Harry Wentland wrote:
> On 2023-10-02 06:58, Sebastian Andrzej Siewior wrote:
> > On 2023-09-22 07:33:26 [+0200], Christian K=C3=B6nig wrote:
> >> Am 21.09.23 um 16:15 schrieb Sebastian Andrzej Siewior:
> >>> Hi,
> >>>
> >>> I stumbled uppon the amdgpu driver via a bugzilla report. The actual =
fix
> >>> is #4 + #5 and the rest was made while looking at the code.
> >>
> >> Oh, yes please :)
> >>
> >> Rodrigo and I have been trying to sort those things out previously, but
> >> that's Sisyphean work.
> >>
> >> In general the DC team needs to judge, but of hand it looks good to me.
> >=20
> > Any way to get this merged? There was no reply from the DC team=E2=80=
=A6 No
> > reply from the person breaking it either. The bugzilla reporter stated
> > that it solves his trouble. He didn't report anything new ;)
> >=20
>=20
> Apologies for the slow progress. We're feeding it through our CI and
> will let you know the verdict soon.
>=20
> Do you happen to have the bugzilla link that this is fixing? It would
> be helpful to include that as a link in the patches as well, to give
> them context.
The bugzilla report is at
  https://bugzilla.kernel.org/show_bug.cgi?id=3D217928

but the patches explain the situation, too. Even more verbose than the
report=E2=80=A6

> Harry

Sebastian
