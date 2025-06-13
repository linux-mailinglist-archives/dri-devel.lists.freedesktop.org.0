Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B504FAD8B63
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 13:56:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1918310E8EC;
	Fri, 13 Jun 2025 11:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="aH4jxm+h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B04A510E8EB
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 11:56:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1749815771; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Qv1KDSKHQdZ6+3yO0tCwx580stgqRhgdR1eWghXJTDZtyiGx7RQHmg1L90+x7dHKNUwKDNqx+eFdgx6RYh/AYMp9Hd6/27pdWg7IqAuYs0lzyer337Y71hFqHuHVoFnlqP34W+pf1C9z0iI+k+cvv6NHKnyWGS0qSKZPhBQZw+0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1749815771;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=VUFg/+2IDq4vwt7epwImt1imkzKgQYu7+Au2agn49Og=; 
 b=eh3ccSCAwV97vjQ2Wejl6j0pAhdgnsSOVWSzjjy8ZrEXHKeNc2M5mwWWm9BIkwTb5cz/Oi6q9Pt2S/anS803yiwhmEvgBmc77wb+1bjaXFq9+vjYPiEdzk0l/AXNschpDBX4uZS71aQEx2bv7U3DuiycX8ICe4WjcYYKdPlDekg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749815771; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=VUFg/+2IDq4vwt7epwImt1imkzKgQYu7+Au2agn49Og=;
 b=aH4jxm+h9P4jRdgkpNEEWbu91bORykVFmBm30jloQNEwnbBe+tfx0YNts1xmU4nB
 yyLgKbYaNvsMh1bnLG0PRSriWUHXbglLceLmIP0DzHvvGJol854KtjsGEMC/EmaeY+t
 zTbOAUKSO1OhthZ6RZXzgJskty9CPr9w578WrOX8=
Received: by mx.zohomail.com with SMTPS id 17498157689161004.7727496495353;
 Fri, 13 Jun 2025 04:56:08 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sandy Huang <hjc@rock-chips.com>, 
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Qin Jian <qinjian@cqplus1.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-pci@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, llvm@lists.linux.dev,
 Tvrtko Ursulin <tursulin@igalia.com>
Subject: Re: [PATCH 01/20] bitfield: introduce HWORD_UPDATE bitfield macros
Date: Fri, 13 Jun 2025 13:55:54 +0200
Message-ID: <3683577.irdbgypaU6@workhorse>
In-Reply-To: <5493fd6017de3f393f632125fad95945d1c4294c@intel.com>
References: <20250612-byeword-update-v1-0-f4afb8f6313f@collabora.com>
 <20250612-byeword-update-v1-1-f4afb8f6313f@collabora.com>
 <5493fd6017de3f393f632125fad95945d1c4294c@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

Hello,

On Friday, 13 June 2025 10:51:15 Central European Summer Time Jani Nikula wrote:
> On Thu, 12 Jun 2025, Nicolas Frattaroli <nicolas.frattaroli@collabora.com> wrote:
> > Hardware of various vendors, but very notably Rockchip, often uses
> > 32-bit registers where the upper 16-bit half of the register is a
> > write-enable mask for the lower half.
> >
> > This type of hardware setup allows for more granular concurrent register
> > write access.
> >
> > Over the years, many drivers have hand-rolled their own version of this
> > macro, usually without any checks, often called something like
> > HIWORD_UPDATE or FIELD_PREP_HIWORD, commonly with slightly different
> > semantics between them.
> >
> > Clearly there is a demand for such a macro, and thus the demand should
> > be satisfied in a common header file.
> >
> > Add two macros: HWORD_UPDATE, and HWORD_UPDATE_CONST. The latter is a
> > version that can be used in initializers, like FIELD_PREP_CONST. The
> > macro names are chosen to not clash with any potential other macros that
> > drivers may already have implemented themselves, while retaining a
> > familiar name.
> >
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  include/linux/bitfield.h | 47 +++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 47 insertions(+)
> >
> > diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
> > index 6d9a53db54b66c0833973c880444bd289d9667b1..b90d88db7405f95b78cdd6f3426263086bab5aa6 100644
> > --- a/include/linux/bitfield.h
> > +++ b/include/linux/bitfield.h
> > @@ -8,6 +8,7 @@
> >  #define _LINUX_BITFIELD_H
> >  
> >  #include <linux/build_bug.h>
> > +#include <linux/limits.h>
> >  #include <linux/typecheck.h>
> >  #include <asm/byteorder.h>
> >  
> > @@ -142,6 +143,52 @@
> >  		(((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask))	\
> >  	)
> >  
> > +/**
> > + * HWORD_UPDATE() - prepare a bitfield element with a mask in the upper half
> > + * @_mask: shifted mask defining the field's length and position
> > + * @_val:  value to put in the field
> > + *
> > + * HWORD_UPDATE() masks and shifts up the value, as well as bitwise ORs the
> > + * result with the mask shifted up by 16.
> > + *
> > + * This is useful for a common design of hardware registers where the upper
> > + * 16-bit half of a 32-bit register is used as a write-enable mask. In such a
> > + * register, a bit in the lower half is only updated if the corresponding bit
> > + * in the upper half is high.
> > + */
> > +#define HWORD_UPDATE(_mask, _val)					 \
> > +	({								 \
> > +		__BF_FIELD_CHECK(_mask, ((u16) 0U), _val,		 \
> > +				 "HWORD_UPDATE: ");			 \
> > +		(((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask)) | \
> > +		((_mask) << 16);					 \
> > +	})
> 
> i915 uses something like this for a few registers too, with the name
> _MASKED_FIELD(). I think we could use it.
> 
> I do think this is clearly an extension of FIELD_PREP(), though, and
> should be be named similarly, instead of the completely deviating
> HWORD_UPDATE().
> 
> Also, we recently got GENMASK() versions with sizes, GENMASK_U16()
> etc. so I find it inconsistent to denote size here with HWORD.
> 
> FIELD_PREP_MASKED_U16? MASKED_FIELD_PREP_U16? Something along those
> lines?

Yeah, I agree the name could be better. I used HWORD_UPDATE as Yury and
I couldn't come up with a name we liked either, and Yury suggested not
breaking from what's already there too much. I do think making the name
more field-adjacent would be good though, as well as somehow indicating
that it is 16 bits of data.

> 
> And perhaps that (and more potential users) could persuade Jakub that
> this is not that weird after all?

I will operate under the assumption that Jakub's opinion will not change
as he ignored the commit message that talks about multiple vendors,
ignored the cover letter that talks about multiple vendors, and ignored
my e-mail where I once again made it clear to him that it's multiple
vendors, and still claims it's a Rockchip specific convention.

> 
> 
> BR,
> Jani.
> 

Best Regards,
Nicolas Frattaroli

> 
> 
> 
> > +
> > +/**
> > + * HWORD_UPDATE_CONST() - prepare a constant bitfield element with a mask in
> > + *                        the upper half
> > + * @_mask: shifted mask defining the field's length and position
> > + * @_val:  value to put in the field
> > + *
> > + * HWORD_UPDATE_CONST() masks and shifts up the value, as well as bitwise ORs
> > + * the result with the mask shifted up by 16.
> > + *
> > + * This is useful for a common design of hardware registers where the upper
> > + * 16-bit half of a 32-bit register is used as a write-enable mask. In such a
> > + * register, a bit in the lower half is only updated if the corresponding bit
> > + * in the upper half is high.
> > + *
> > + * Unlike HWORD_UPDATE(), this is a constant expression and can therefore
> > + * be used in initializers. Error checking is less comfortable for this
> > + * version.
> > + */
> > +#define HWORD_UPDATE_CONST(_mask, _val)					  \
> > +	(								  \
> > +		FIELD_PREP_CONST(_mask, _val) |				  \
> > +		(BUILD_BUG_ON_ZERO(const_true((u64) (_mask) > U16_MAX)) + \
> > +		 ((_mask) << 16))					  \
> > +	)
> > +
> >  /**
> >   * FIELD_GET() - extract a bitfield element
> >   * @_mask: shifted mask defining the field's length and position
> 
> 




