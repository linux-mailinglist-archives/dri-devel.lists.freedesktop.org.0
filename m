Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F15771DDD
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 12:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7403710E1EB;
	Mon,  7 Aug 2023 10:21:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A98710E1EB
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 10:21:54 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4RKC6Q649Kz9sTM;
 Mon,  7 Aug 2023 12:21:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1691403710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sQzi2S+q3MI0M2bjrRlM38JTCqMPl5w8t6f8TRBRm7U=;
 b=QwHrtU5CETeaZrUwf1mIBWZp8n945TPDsjMrcsmASsdxhxPN2YDAVo0MotLIHl07/9RxtO
 dcGIr6Om5QLrMvbWMKHAw10RkGSuNLSsAWDLRnyemDGe6cSsBYcQyOcyuEy539HM30Lidz
 Yy8IjPTJ9RtXwhcGZQ3RDGdJhyV1m9/oFeAYPUefuWnFhTfz8Ls4Md0Iohnh/6Hpre9nvU
 k2etkJX9fQJ2/fxEalijvtVFyi5WvX0LfIfFsw4cNqgLWqjC3QKNawMtvSyUNhGDLstrtG
 QhbuA26GvE7B/rOYQyOFhhwvcZD0MPq2j0bH1VzUAGSQpmX4oGSx09mDwguyJw==
References: <20230807-a64_pll_video0_notifier-v1-0-8a7ccdc14c79@oltmanns.dev>
 <20230807-a64_pll_video0_notifier-v1-1-8a7ccdc14c79@oltmanns.dev>
 <27d09ea33c085d6a2ea9efb91a8cdd7e7464fda7.camel@icenowy.me>
From: Frank Oltmanns <frank@oltmanns.dev>
To: Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH 1/3] clk: sunxi-ng: add support for rate resetting notifier
In-reply-to: <27d09ea33c085d6a2ea9efb91a8cdd7e7464fda7.camel@icenowy.me>
Date: Mon, 07 Aug 2023 12:21:47 +0200
Message-ID: <87edkftao4.fsf@oltmanns.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4RKC6Q649Kz9sTM
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
Cc: dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Ond?0?0ej Jirman <x@xnux.eu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023-08-07 at 17:42:22 +0800, Icenowy Zheng <uwu@icenowy.me> wrote:
> =E5=9C=A8 2023-08-07=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 11:36 +0200=EF=
=BC=8CFrank Oltmanns=E5=86=99=E9=81=93=EF=BC=9A
>> From: Icenowy Zheng <icenowy@aosc.io>
>>
>> In some situaitons, we will want a clock rate be kept while its
>> parent
>> can change, for example, to make dual-head work on A64, TCON0 clock
>> needs to be kept for LCD display and its parent (or grandparent)
>> PLL-Video0 need to be changed for HDMI display. (There's a quirk on
>> A64
>> that HDMI PHY can only use PLL-Video0, not PLL-Video1).
>>
>> Add a notifier helper to create such kind of rate keeping notifier by
>> reset the rate after the parent changed.
>>
>> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
>> ---
>> =C2=A0drivers/clk/sunxi-ng/ccu_common.c | 22 ++++++++++++++++++++++
>> =C2=A0drivers/clk/sunxi-ng/ccu_common.h | 12 ++++++++++++
>> =C2=A02 files changed, 34 insertions(+)
>>
>> diff --git a/drivers/clk/sunxi-ng/ccu_common.c b/drivers/clk/sunxi-
>> ng/ccu_common.c
>> index 8d28a7a079d0..434fa46ad460 100644
>> --- a/drivers/clk/sunxi-ng/ccu_common.c
>> +++ b/drivers/clk/sunxi-ng/ccu_common.c
>> @@ -87,6 +87,28 @@ int ccu_pll_notifier_register(struct ccu_pll_nb
>> *pll_nb)
>> =C2=A0}
>> =C2=A0EXPORT_SYMBOL_NS_GPL(ccu_pll_notifier_register, SUNXI_CCU);
>> =C2=A0
>> +static int ccu_rate_reset_notifier_cb(struct notifier_block *nb,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 un=
signed long event, void
>> *data)
>> +{
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct ccu_rate_reset_nb *rat=
e_reset =3D
>> to_ccu_rate_reset_nb(nb);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (event =3D=3D PRE_RATE_CHA=
NGE) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0rate_reset->saved_rate =3D clk_get_rate(rate_reset-
>> >target_clk);
>
> In fact I think we should have a better way to save the intended clock
> rate ;-)
>

Are you referring to struct clk_core's clk_req member [1]? Maxime Ripard
also mentioned it to me [2]? Or do you have something else in mind?

Note that I have a patchset on the way [3], that will improve rate
selection for pll-video0 and its descendants. I'll double-check if that
improves the situation in a way so that the clk_get_rate() might be good
enough.

Thanks,
  Frank

[1]: https://elixir.bootlin.com/linux/latest/source/drivers/clk/clk.c#L68
[2]: https://lore.kernel.org/linux-clk/xcgmqvdoip53yao4sfoznnppauhmsmdablwo=
ewh43zjv3bhidp@d7pxqohxydve/
[3]: https://lore.kernel.org/linux-clk/20230806-pll-mipi_set_rate_parent-v5=
-0-db4f5ca33fc3@oltmanns.dev/

>
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} else if (event =3D=3D POST_=
RATE_CHANGE) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0clk_set_rate(rate_reset->target_clk, rate_reset-
>> >saved_rate);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return NOTIFY_DONE;
>> +}
>> +
>> +int ccu_rate_reset_notifier_register(struct ccu_rate_reset_nb
>> *rate_reset_nb)
>> +{
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rate_reset_nb->clk_nb.notifie=
r_call =3D
>> ccu_rate_reset_notifier_cb;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return clk_notifier_register(=
rate_reset_nb->common->hw.clk,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &rate_re=
set_nb->clk_nb);
>> +}
>> +
>> =C2=A0static int sunxi_ccu_probe(struct sunxi_ccu *ccu, struct device
>> *dev,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 struct device_node *node, void __iomem
>> *reg,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 const struct sunxi_ccu_desc *desc)
>> diff --git a/drivers/clk/sunxi-ng/ccu_common.h b/drivers/clk/sunxi-
>> ng/ccu_common.h
>> index fbf16c6b896d..6b0b05fae123 100644
>> --- a/drivers/clk/sunxi-ng/ccu_common.h
>> +++ b/drivers/clk/sunxi-ng/ccu_common.h
>> @@ -69,4 +69,16 @@ int devm_sunxi_ccu_probe(struct device *dev, void
>> __iomem *reg,
>> =C2=A0void of_sunxi_ccu_probe(struct device_node *node, void __iomem *re=
g,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0con=
st struct sunxi_ccu_desc *desc);
>> =C2=A0
>> +struct ccu_rate_reset_nb {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct notifier_block=C2=A0=
=C2=A0=C2=A0clk_nb;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct ccu_common=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*common;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct clk=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*target_c=
lk;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned long=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0saved_rate;
>> +};
>> +
>> +#define to_ccu_rate_reset_nb(_nb) container_of(_nb, struct
>> ccu_rate_reset_nb, clk_nb)
>> +
>> +int ccu_rate_reset_notifier_register(struct ccu_rate_reset_nb
>> *rate_reset_nb);
>> +
>> =C2=A0#endif /* _COMMON_H_ */
>>
