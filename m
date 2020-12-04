Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E832CF367
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 18:57:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91ADE6E1B5;
	Fri,  4 Dec 2020 17:57:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com
 [IPv6:2607:fcd0:100:8a00::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87ECD6E1B5
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 17:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id EFE5C12806D3;
 Fri,  4 Dec 2020 09:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1607104620;
 bh=j/eiQ9XC4YVyXHPaGvnixXqre38vTxKbe7IysEXG/gQ=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=LJv6d585fMMbsbl72vwxEil6yGk8n+dpPg0+K0c9QGLI6z2Tnb35IajlkkZ/poYVt
 Apwk3JR5UaJjDvC46VLJvsCb+SFQ5eqvWGVnU98pT0RQI8tTzpuqlku09Jz0OireDV
 CvQHnAFrsu77RWt/AkDGWfrret+uJBj5l78JAyzI=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id INp-1Jb0T2J6; Fri,  4 Dec 2020 09:57:00 -0800 (PST)
Received: from jarvis.int.hansenpartnership.com (unknown
 [IPv6:2601:600:8280:66d1::527])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 92AB012806D2;
 Fri,  4 Dec 2020 09:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1607104620;
 bh=j/eiQ9XC4YVyXHPaGvnixXqre38vTxKbe7IysEXG/gQ=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=LJv6d585fMMbsbl72vwxEil6yGk8n+dpPg0+K0c9QGLI6z2Tnb35IajlkkZ/poYVt
 Apwk3JR5UaJjDvC46VLJvsCb+SFQ5eqvWGVnU98pT0RQI8tTzpuqlku09Jz0OireDV
 CvQHnAFrsu77RWt/AkDGWfrret+uJBj5l78JAyzI=
Message-ID: <d706cdbcc4eba3fb3fe17453017a6623f1ec80dc.camel@HansenPartnership.com>
Subject: Re: [RFC PATCH v1 00/12] Replace strstarts() by str_has_prefix()
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: laniel_francis@privacyrequired.com, Russell King
 <linux@armlinux.org.uk>,  Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Florian Fainelli <f.fainelli@gmail.com>, 
 bcm-kernel-feedback-list@broadcom.com, Herbert Xu
 <herbert@gondor.apana.org.au>,  "David S. Miller" <davem@davemloft.net>,
 Ard Biesheuvel <ardb@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, Alasdair Kergon
 <agk@redhat.com>,  Mike Snitzer <snitzer@redhat.com>, dm-devel@redhat.com,
 Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jessica Yu <jeyu@kernel.org>
Date: Fri, 04 Dec 2020 09:56:58 -0800
In-Reply-To: <20201204170319.20383-1-laniel_francis@privacyrequired.com>
References: <20201204170319.20383-1-laniel_francis@privacyrequired.com>
User-Agent: Evolution 3.34.4 
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
Cc: linux-efi@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2020-12-04 at 18:03 +0100, laniel_francis@privacyrequired.com
wrote:
> In this patch set, I replaced all calls to strstarts() by calls to
> str_has_prefix(). Indeed, the kernel has two functions to test if a
> string begins with an other:
> 1. strstarts() which returns a bool, so 1 if the string begins with
> the prefix,0 otherwise.
> 2. str_has_prefix() which returns the length of the prefix or 0.
> 
> str_has_prefix() was introduced later than strstarts(), in commit
> 495d714ad140 which also stated that str_has_prefix() should replace
> strstarts(). This is what this patch set does.

What's the reason why?  If you look at the use cases for the
replacement of strstart()  they're all cases where we need to know the
length we're skipping and this is hard coded, leading to potential
errors later.  This is a classic example:  3d739c1f6156 ("tracing: Use
the return of str_has_prefix() to remove open coded numbers").  However
you're not doing this transformation in the conversion, so the
conversion is pretty useless.  I also see no case for replacing
strstart() where we're using it simply as a boolean without needing to
know the length of the prefix.

James


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
