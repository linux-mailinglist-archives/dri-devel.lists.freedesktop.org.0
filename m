Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD8C84EFDA
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 06:15:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E4410F1EE;
	Fri,  9 Feb 2024 05:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="ql12PmRr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CCB10F1EC
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 05:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1707455717;
 bh=JVP7+dHngWW5QqFjEB3Li2tXHIk33S+0+gwI4qejE7A=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ql12PmRrPeN6w15lje0jOXjYkyY4Zd3bn4cGc9CmK5XAkHEd2zUxKooodVCroXa45
 kQV1oAv/jc19j1oapUa9U1naSax2L39VnHTlJ4XWJ+5o+x0q5doggVed4SEmfx16AR
 47Va7RWrUaEWrCijh4RGdaIOgfgCLjBCJ6uN/a7zaJODkKr80vu3wIYPLweb4b97OM
 IzMTkga+Mpg34Ji2O3+9htpWgzzL087MgTWe/OWyxTcafRRpWZAWpqZ6ibmmHv5KnB
 KQl4189OKresii4X6aw1xpo50zNSuDxE+Ly/sLi6jGwt2h0avLb4qRNLwgQFeqscv4
 TJxv47moU5mVA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TWMVr4k82z4wcD;
 Fri,  9 Feb 2024 16:15:16 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Thomas Zimmermann <tzimmermann@suse.de>, Randy Dunlap
 <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Geoff Levand <geoff@infradead.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drivers/ps3: select VIDEO to provide cmdline functions
In-Reply-To: <e0893d21-606e-429e-a554-c9ee60fd0ae4@suse.de>
References: <20240207161322.8073-1-rdunlap@infradead.org>
 <e0893d21-606e-429e-a554-c9ee60fd0ae4@suse.de>
Date: Fri, 09 Feb 2024 16:15:15 +1100
Message-ID: <8734u28bh8.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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

Thomas Zimmermann <tzimmermann@suse.de> writes:
> Am 07.02.24 um 17:13 schrieb Randy Dunlap:
>> When VIDEO is not set, there is a build error. Fix that by selecting
>> VIDEO for PS3_PS3AV.
>>
>> ERROR: modpost: ".video_get_options" [drivers/ps3/ps3av_mod.ko] undefined!
>>
>> Fixes: dae7fbf43fd0 ("driver/ps3: Include <video/cmdline.h> for mode parsing")
>> Fixes: a3b6792e990d ("video/cmdline: Introduce CONFIG_VIDEO for video= parameter")
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Nicholas Piggin <npiggin@gmail.com>
>> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
>> Cc: Naveen N. Rao <naveen.n.rao@linux.ibm.com>
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Geoff Levand <geoff@infradead.org>
>> Acked-by: Geoff Levand <geoff@infradead.org>
>> Cc: linux-fbdev@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Can you take it via whatever tree the CONFIG_VIDEO patch is in?

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers
