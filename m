Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB7156792F
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 23:08:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B448D967;
	Tue,  5 Jul 2022 21:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 338 seconds by postgrey-1.36 at gabe;
 Tue, 05 Jul 2022 21:08:26 UTC
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com
 [96.44.175.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 850818D7C7
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 21:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1657054968;
 bh=YgWzh+6xAhVZmhNiRAGCghd03lbCI399QAh5EJvstO8=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=WG6JAHRuuovkKlwHIAGmmwS8o4md89S+zhK4zcu0ZMWIagGecT8JmRf1WNa1W9Szx
 gaeQIaaU9xNM8psZgNk8CJhwuxB26d8/SEhffX7ejPV7mxhIMCNiSZ5YqnIjx5cDDn
 3rPMwedtXF8nnv5+1l5xR1PW4JzkugFrDKAmNPW0=
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id 3C25D1287B1C;
 Tue,  5 Jul 2022 17:02:48 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id Y7EVco9mAS-T; Tue,  5 Jul 2022 17:02:48 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1657054968;
 bh=YgWzh+6xAhVZmhNiRAGCghd03lbCI399QAh5EJvstO8=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=WG6JAHRuuovkKlwHIAGmmwS8o4md89S+zhK4zcu0ZMWIagGecT8JmRf1WNa1W9Szx
 gaeQIaaU9xNM8psZgNk8CJhwuxB26d8/SEhffX7ejPV7mxhIMCNiSZ5YqnIjx5cDDn
 3rPMwedtXF8nnv5+1l5xR1PW4JzkugFrDKAmNPW0=
Received: from [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b] (unknown
 [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 9B5E61287A76;
 Tue,  5 Jul 2022 17:02:47 -0400 (EDT)
Message-ID: <b72fb530cbfe35800fca33f7110b17b1ea1f3649.camel@HansenPartnership.com>
Subject: Re: flush_icache_range in the sticore driver
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Christoph Hellwig <hch@lst.de>
Date: Tue, 05 Jul 2022 17:02:46 -0400
In-Reply-To: <20220705164623.GA14566@lst.de>
References: <20220705164623.GA14566@lst.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-parisc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-07-05 at 18:46 +0200, Christoph Hellwig wrote:
> Hi all,
> 
> flush_icache_range is supposed to flush the instruction cache, which
> is something no driver should be doing.  It was added in commit
> 03b18f1b2afe ("[PARISC] Clean up sti_flush") but the explanation in
> there looks odd.
> 
> Can someone shed a light what flushes this tries to flush and why it
> can't be done behind a proper API?

What's wrong with the explanation:

"sti_flush is supposed to flush the caches so we can execute the STI
rom we copied to memory."

Which is in that commit?

The STI driver is taking the executable STI ROM code, which is in a
very slow to access part of the system and copying it to RAM so it can
be executed.  After the driver has done the copy it needs to flush the
icache just in case there's anything stale in there before executing
the newly copied code.

If you grep the drive for sti_call, you'll see all the points we call
into the copied rom code.

James


