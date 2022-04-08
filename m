Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C0C4F969D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 15:27:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 739EA10F18C;
	Fri,  8 Apr 2022 13:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1EDE10F18B;
 Fri,  8 Apr 2022 13:26:58 +0000 (UTC)
Date: Fri, 08 Apr 2022 13:26:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1649424416;
 bh=xKdnbX/uu4zDxFZ8hCkBVd/wtWNCWZBH1JAcwPtLw/U=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=LIdIuHNo44bjyNxrW+WjYFfH/4NTVydxbOGEB5iHHJ3owDhI4nYaiOvipxfn+FXvy
 ISRv3yZxCJWe8nQIA+ES9ZFYs7Jhe+sXhp3X8qfjIK1tltflAvTcAUkIyz2okxJiOn
 Zx6dmDOJ6pBaKfMrw1tK0kMiaQ4KAsz3eAPmgzBLiWEWnj+5Ym6Xg+FUNd8bTi3jHZ
 VWAJdM/yRINXPQFHaVfE438ETtnh/XPI90OfXoTxM91zwnBG69RVqDCRevgTx8iRNS
 IOjnq3OqvlRm0L5NAM6LToaXr+Nq6HbePYTbRzixIBO9e1CiSKJSr5s4urJpVoLlp+
 vI7nkcslF/stQ==
To: Grigory Vasilyev <h0tc0d3@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/amdgpu: Fix NULL pointer dereference
Message-ID: <2GaGJp5T0FARGpEE4FSEdCCQQNOecHtBBdQxqneeCWad2PD7gKqhp6-2LhdZSpTvDToW2kKggbfzlcvw9vsM7L_kJXo1uMNjoiAHJ4bQAjI=@emersion.fr>
In-Reply-To: <CAD5ugGD6QzCUqk7_EVwH9Cc6PQtx_VfjVRWzzP9uKR5tkGh1RQ@mail.gmail.com>
References: <20220408092803.3188-1-h0tc0d3@gmail.com>
 <4o2YD5id7zhK5g__CUK3Yf-6Dj459XQ0qsydW6wKHdco3YYtl78BqGUfXvQ9UO0AZoAsMPfhFB0jw1BFldiFDcbZXmGgsobuAoTMWmoDqmE=@emersion.fr>
 <CAP+8YyED70CSqVRaB7JgrAtK-yvBx5EsvrrdR7EpvOG2AVhskQ@mail.gmail.com>
 <QfKpxmkE_cy9wt5VJruw_TSdnl5KceKM8BxJGmZSBs-KiaRwIYfgc8h_-5h7Wmj6G-NtUJ3A88V5pzPvZuLlpkK-oRO5pSjeTxwHcZWlogs=@emersion.fr>
 <CAD5ugGD6QzCUqk7_EVwH9Cc6PQtx_VfjVRWzzP9uKR5tkGh1RQ@mail.gmail.com>
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: David Airlie <airlied@linux.ie>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Sean Paul <seanpaul@chromium.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, April 8th, 2022 at 15:21, Grigory Vasilyev <h0tc0d3@gmail.com> w=
rote:

> Simon Ser and Bas Nieuwenhuizen, do you understand that you are
> proposing to make the code less safe in the future? In the future,
> someone might rewrite the code and we'll get an error.

I don't think we should blindly add NULL checks for all functions which
take a pointer as argument. This makes it way more complicated to find
a bug when the function is mis-used. Crashing is better because it
indicates a programmer error. In the future, any new call with a NULL
pointer will produce a clear error.

Using pointers for output values is a common pattern in C, it allows a
function to return multiple values.
