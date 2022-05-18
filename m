Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDD752B417
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 09:50:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC52113E80;
	Wed, 18 May 2022 07:50:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 348 seconds by postgrey-1.36 at gabe;
 Wed, 18 May 2022 07:50:53 UTC
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF67113E80;
 Wed, 18 May 2022 07:50:53 +0000 (UTC)
Received: from zn.tnic (p200300ea974657d0329c23fffea6a903.dip0.t-ipconnect.de
 [IPv6:2003:ea:9746:57d0:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 527C91EC0666;
 Wed, 18 May 2022 09:44:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1652859898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a8Szr4z7U3LLWZpmFRmG29wYOgRi5MD6X+p5qsug0OA=;
 b=Pob2AA/6Vhjy47GRjAV39j87RoTblM7SFu97DnhIry+QeDLbyAQdHuDrgFDWIiEnpC4bm/
 Xi/iAffzZviq9amZHlIwnWlB180E1+Fa+9cjED1quaEIpjZb08y2XM+M/dfSOZpW8uPJ98
 G1U8sQiSeFJI7pnTBmLcMFUjPrbkZYw=
Date: Wed, 18 May 2022 09:44:52 +0200
From: Borislav Petkov <bp@alien8.de>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 11/11] drm/i915: Fix undefined behavior due to shift
 overflowing the constant
Message-ID: <YoSj9O/6yA0nn/xW@zn.tnic>
References: <20220405151517.29753-1-bp@alien8.de>
 <20220405151517.29753-12-bp@alien8.de>
 <78e67e42-7e1e-e9fa-036d-441168100731@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <78e67e42-7e1e-e9fa-036d-441168100731@infradead.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 17, 2022 at 04:05:46PM -0700, Randy Dunlap wrote:
> 
> 
> On 4/5/22 08:15, Borislav Petkov wrote:
> > From: Borislav Petkov <bp@suse.de>
> > 
> > Fix:
> > 
> >   In file included from <command-line>:0:0:
> >   drivers/gpu/drm/i915/gt/uc/intel_guc.c: In function ‘intel_guc_send_mmio’:
> >   ././include/linux/compiler_types.h:352:38: error: call to ‘__compiletime_assert_1047’ \
> >   declared with attribute error: FIELD_PREP: mask is not constant
> >     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
> > 
> > and other build errors due to shift overflowing values.
> > 
> > See https://lore.kernel.org/r/YkwQ6%2BtIH8GQpuct@zn.tnic for the gory
> > details as to why it triggers with older gccs only.
> > 
> 
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
> 
> Is this merged anywhere?

It's state is "new" in their patchwork:

https://patchwork.freedesktop.org/patch/480756/

so I guess not yet.

> It could/should at least be in linux-next so that other people
> don't waste time on it.

-ETOOMANYPATCHES I guess. :-\

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
