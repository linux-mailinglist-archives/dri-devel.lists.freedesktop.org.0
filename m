Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 356D06CFA6C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 06:53:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31DCD10ECD9;
	Thu, 30 Mar 2023 04:53:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org
 [IPv6:2001:67c:2050:0:465::202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D98B10ECD9
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 04:53:39 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Pn9zg43vWz9sRK;
 Thu, 30 Mar 2023 06:53:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1680152015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YWgtpd4fPVhiIFkjr04jTbq0IIVxM0oReji2cEeLfdU=;
 b=0OB7M/a5iFHbPqjPbr/ZjCY8Co+ka63KsdbxBGmim5q3SJGAxJrjlZOvtpdXteJCpTqDYP
 0OOlps4JPQbBO/CbC6lQoajGKnh12+sqBzuE+GBW7jynF5voI9hZCzdHeQRqYzZwlXkHSQ
 BW7FTkkCcX/VpeyrTrIHCgivtVEyx62TQqar4gg7BhgvCYTiqqYOIJP3GF5bfE8VltFQAw
 iznGEjhyjpCgmwz16H0nJEIKeKUbVI4JMs0aLhIVrKT+S0ndzjum1BfoJ/k+LpeKdwMdZK
 zEB9GhNUp5sxl/hg92tDlHj+FG24O6BZWEX7OLZ+bO6qUU3nd6SUWKtBoytN4g==
References: <20230320161636.24411-1-romanberanek@icloud.com>
 <87wn356ni4.fsf@oltmanns.dev> <20230327202045.ceeqqwjug4ktxtsf@penduick>
 <CRHKFX934UA0.1MCKCD8SJSPIE@iMac.local>
 <20230329195802.veybo3367zifw77n@penduick>
From: Frank Oltmanns <frank@oltmanns.dev>
To: Roman Beranek <romanberanek@icloud.com>
Subject: Re: [PATCH] drm/sun4i: uncouple DSI dotclock divider from
 TCON0_DCLK_REG
Date: Thu, 30 Mar 2023 06:45:22 +0200
In-reply-to: <20230329195802.veybo3367zifw77n@penduick>
Message-ID: <877cuyon5e.fsf@oltmanns.dev>
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
Cc: Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Roman,

On 2023-03-29 at 21:58:02 +0200, Maxime Ripard <maxime@cerno.tech> wrote:
> On Tue, Mar 28, 2023 at 01:48:33AM +0200, Roman Beranek wrote:
>> On Mon Mar 27, 2023 at 10:20 PM CEST, Maxime Ripard wrote:
>> >
>> > On Sat, Mar 25, 2023 at 12:40:04PM +0100, Frank Oltmanns wrote:
>> > > Claiming to set the divider to a different value (bpp / lanes) than =
what we=E2=80=99re actually using in
>> > > the end (SUN6I_DSIO_TCON_DIV) is somehow bugging me. I feel like the=
 proposal that I submitted is
>> > > more direct: <https://lore.kernel.org/all/20230319160704.9858-2-fran=
k@oltmanns.dev/>
>> >
>> > Yeah, this patch looks better to me too: it's simpler, more straightfo=
rward. If Roman can confirm it
>> > works with his testing, I'll be happy to merge it.
>> >
>>
>> So I've just found out that my understanding of what sun4i_dotclock is
>> was wrong the whole time. I treated it as a virtual clock representing
>> the true CRTC pixel clock and only coincidentally also matching what
>> A64 Reference Manual labels as TCON0 data clock (a coincidence to which
>> DSI is an exception).
>>
>> Now that I finally see dotclock as 'what could dclk be an abbreviation
>> to', I to agree that it's not only straightforward but also correct to
>> keep the divider at 4 and adjust the rate as is done it the patch Frank
>> submitted.
>>
>> In order to preserve semantic correctness however, I propose to preface
>> the change with a patch that renames sun4i_dotclock and tcon-pixel-clock
>> such that dot/pixel is replaced with d/data. What do you think?
>
> I don't think it's exposed to the userspace in any way so it makes sense =
to me

Roman, will you please submit a V2 of the patch I submitted then? Or do
you want me to do it?

Thanks,
  Frank

>
> Maxime
>


--
