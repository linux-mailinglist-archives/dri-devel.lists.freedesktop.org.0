Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B94D0B25A25
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 05:56:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E4A110E0C2;
	Thu, 14 Aug 2025 03:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="fbEmI3nK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B802910E0C2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 03:56:33 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-b47052620a6so1277662a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 20:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1755143793; x=1755748593;
 darn=lists.freedesktop.org; 
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sYvTUhn+98XihTDP31SzYmddVdxZwaJtzy0vGCN/OrQ=;
 b=fbEmI3nKiyva3Y/fdrwCTVzlRjUcoUWcG4p40m3Q3a6itPe79/Eu05p5Zt+4vXQqRh
 5HIh/gTV2sL3SkFt6LUqqZ0iHP0JIJ8iKJ/4T7ggBmfEYBFUGlp+FOSqMmejzACXSIA4
 E0CVNaVxgoNhUO7Vw2rX7UWnxAWj9J4Bf3ITELD16OAcM3LQHqa8ZELQhQn/E629+A7R
 CA+UjwoLqfGZeVZ6r6skdtLeaHi/gHSW62CPCPsmmqhLw/negsR0fjQJHRlFAa4elDCN
 KoNwVGbcHEOWOfcWP1QAZhOefAS6QUW8aO0BPY00obZW8rZvczbkaTZ+j455BGm0n+wP
 Cpdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755143793; x=1755748593;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=sYvTUhn+98XihTDP31SzYmddVdxZwaJtzy0vGCN/OrQ=;
 b=IPBeU2qucaZUpq1qs8l8HfnA6uPhrfY7ZvBcSoYGwNMPN3Zz1ko5GM43GBlDcWP+AY
 /ZTaXReQ1j+3Q2t82fDIKSqVX+iRctofa4Z8mOxHs1cwMvoB/mBg6gKSBHjULZ/aTNom
 kDB+0v8rMIt4ueVtqghFWdCs5XZ3ClntWe0A9xQ8PZ+aL0qbv7MR7Y025TVrUpImOsSX
 xNGedFK4PDegVcyztXOQCdQcEoaUzqbqoGqM7cKRcC/rp+qA48vx4FhuhWSVOChj8168
 rEbjyz9SlcT8WG66Nz+ak0s3CnHzEZsi8LEaQFvB8OBQlf8e+dYJwQhGtSPpKM27KbKE
 e1MQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCViG6F3fUzByfr7vIixKL8R+ky+NVqhpHSKixbn/2OCQ0CyCkFzDZ4UHtq6Ab9YtDx2suI7YKgvZ4o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywmhkl2CuxyhkL3fOxxKyOPjSGqtzdVJvQoHkpgjDtvwIma4Z/U
 DmGrUvqvb2i5W3cueaZLluPJwUuHAMtzTnekxomxaoP2Z+Qg3Ypkn1/H/foESbUSMew=
X-Gm-Gg: ASbGncsCmMV8c1DAYIAYm6J1Q+ef8dtCe5ajGwuAWWc/fZ9ictSjOXSutRvt5VgpvvU
 dFMXgqITh1LzgDBt/SA9rh7xaZS1WMis54jCYBSuMjhafZDDRpZ4REgCQAlnJ0eNx9z+/a7tBTm
 zX8PLMTe0s9xH3V+oztx0x8TpLt19TNJDeXDlzTDhYtNCZeiqNsGhna/OKnzlV9joMOKLZmwFRb
 4RyD7XXxo8gypcNuZ22ehJ8hMCJ4JgD/TSy9nlOgxhukzfmBEBM/nyfvzbnYzPSqtpO7Fhs0qQF
 wKgITYCwzqNCRvXP4Kys6YLbTi4f7RwVOa4eshbu1CmbcCwyd+AP62NO47h/uWYQw37o3/QmDsd
 nhJYt3wvVgn1GY3JVCZQM2Hk=
X-Google-Smtp-Source: AGHT+IEiwhj6AlTJP0zjelqjRFQKsbDuEXwt1c17YxK/9VQTXmFU6azYy0s6xYMjgeJygYuCHmugIQ==
X-Received: by 2002:a17:903:3b88:b0:240:417d:8166 with SMTP id
 d9443c01a7336-2445c54c606mr11647155ad.19.1755143793182; 
 Wed, 13 Aug 2025 20:56:33 -0700 (PDT)
Received: from localhost ([2605:fb40:0:c09:323a:5679:3782:80b8])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-242fea29f1fsm58678255ad.99.2025.08.13.20.56.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Aug 2025 20:56:32 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 13 Aug 2025 21:56:31 -0600
Message-Id: <DC1UJQKMO63Z.1ZLS5VS0OXZAE@brighamcampbell.com>
Subject: Re: [PATCH] accel/rocket: Fix usages of kfree() and sizeof()
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Markus Elfring" <Markus.Elfring@web.de>,
 <dri-devel@lists.freedesktop.org>, <lkp@intel.com>
Cc: "LKML" <linux-kernel@vger.kernel.org>, "Julia Lawall"
 <julia.lawall@inria.fr>, "Oded Gabbay" <ogabbay@kernel.org>, "Tomeu Vizoso"
 <tomeu@tomeuvizoso.net>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250813-rocket-free-fix-v1-1-51f00a7a1271@brighamcampbell.com>
 <65769f0a-af9f-4e96-93d4-8594e76d8e73@web.de>
In-Reply-To: <65769f0a-af9f-4e96-93d4-8594e76d8e73@web.de>
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

On Wed Aug 13, 2025 at 11:56 AM MDT, Markus Elfring wrote:
>> Replace usages of kfree() with kvfree() for pointers which were
>> allocated using kvmalloc(), as required by the kernel memory management
>> API.
>
> How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/submitting-patches.rst?h=3Dv6.17-rc1#n145

All issues addressed by this patch were introduced by the following
commit:

Fixes: 0810d5ad88a1 ("accel/rocket: Add job submission IOCTL")

>> Use sizeof() on the type that a pointer references instead of =E2=80=A6
>
> Would it be helpful to offer desirable changes by separate update steps?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/submitting-patches.rst?h=3Dv6.17-rc1#n81

Tomeu? Oded? Would either of you prefer that I split this patch into two
patches (one to fix kfree()->kvfree() and another to fix sizeof())?

I had considered splitting it into two patches, but the changes were so
minor that I figured it wasn't worth it. Please let me know if you
prefer separate patches and I'll gladly prep another revision.

Thanks,
Brigham

