Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B68BB54E59
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 14:48:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D1810E1C6;
	Fri, 12 Sep 2025 12:48:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="HkmJrg+m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com
 [91.218.175.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296FF10EC3D
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 12:48:28 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1757681306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NL7JO++Q7ebDk6pnXvHTsS19g6iMYqqChi1RqThV9CA=;
 b=HkmJrg+mMrppIasXNvQVeCpET13y1bq8glGlYP1V2XPWP9scdkCLANvhZfhm8HjcJC4KLK
 PByAdTAnV5kpTdjMI0Fv/tELbfO5gxo8mT6tK/cNOtDYnwS25Llnv53CE0KKOqrCcoQ4bD
 5h7+0gBTn9+OQZp2R4pDjb/O7cOYFm4=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] drm/amdkfd: Replace kmalloc + copy_from_user with
 memdup_user
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <CADnq5_MFDZdJg3XFFw9+tWB=_LP47PwE3HXgPK=sryOx+_0wGQ@mail.gmail.com>
Date: Fri, 12 Sep 2025 14:48:13 +0200
Cc: Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <FED6FFD1-2C51-45F4-BF34-76484C415C83@linux.dev>
References: <20250909151146.760450-2-thorsten.blum@linux.dev>
 <CADnq5_MFDZdJg3XFFw9+tWB=_LP47PwE3HXgPK=sryOx+_0wGQ@mail.gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>
X-Migadu-Flow: FLOW_OUT
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

Hi Alex,

On 9. Sep 2025, at 17:35, Alex Deucher wrote:
> Applied.  Thanks!
>=20
> On Tue, Sep 9, 2025 at 11:29=E2=80=AFAM Thorsten Blum =
<thorsten.blum@linux.dev> wrote:
>>=20
>> Replace kmalloc() followed by copy_from_user() with memdup_user() to
>> improve and simplify kfd_criu_restore_queue().
>>=20
>> No functional changes intended.
>>=20
>> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
>> ---

I just learned that calling kfree() on an error pointer doesn't work, so
this patch should probably be reverted/not applied.

Thanks,
Thorsten

