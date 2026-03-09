Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOe5I5b6rmnZKgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 17:51:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE60C23D19F
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 17:51:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4416110E566;
	Mon,  9 Mar 2026 16:51:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B3010E566
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 16:51:29 +0000 (UTC)
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.103.14])
 by APP-05 (Coremail) with SMTP id zQCowAAnvA98+q5pb6z5CQ--.23212S2;
 Tue, 10 Mar 2026 00:51:09 +0800 (CST)
Message-ID: <57436150684e72049b62657caec544a2f18aab1c.camel@iscas.ac.cn>
Subject: Re: [PATCH v7 3/8] drm: verisilicon: add a driver for Verisilicon
 display controllers
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Andrzej Hajda	
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman	 <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring	 <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley	 <conor+dt@kernel.org>, Drew
 Fustini <fustini@kernel.org>, Guo Ren	 <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Dmitry Baryshkov
 <lumag@kernel.org>,  Michal Wilczynski <m.wilczynski@samsung.com>, Han Gao
 <gaohan@iscas.ac.cn>, Yao Zi <ziyao@disroot.org>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Tue, 10 Mar 2026 00:51:08 +0800
In-Reply-To: <301a33fc27bd01bb50d57779c2f9eb51a4fafaa5.camel@iscas.ac.cn>
References: <20260129023922.1527729-1-zhengxingda@iscas.ac.cn>
 <20260129023922.1527729-4-zhengxingda@iscas.ac.cn>
 <DGY9GWWLXGNX.265MMEXXCG8YA@bootlin.com>
 <301a33fc27bd01bb50d57779c2f9eb51a4fafaa5.camel@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-CM-TRANSID: zQCowAAnvA98+q5pb6z5CQ--.23212S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur1fGw4fZFyxKrWfZFykGrg_yoW8Wr4fpF
 Z2qa4SyFn8XrWxGF4jvr1DAr1aq3ykJF4rAryrtr1Fva4IgF1UWr1kCr98uw1jka1kCr15
 AF1DJrnYvFn5ZFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
 A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
 MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
 4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
 67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
 x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
 z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
 UI43ZEXa7IU0iSdDUUUUU==
X-Originating-IP: [112.94.103.14]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
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
X-Rspamd-Queue-Id: EE60C23D19F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[27];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_RECIPIENTS(0.00)[m:luca.ceresoli@bootlin.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:fustini@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:p.zabel@pengutronix.de,m:lumag@kernel.org,m:m.wilczynski@samsung.com,m:gaohan@iscas.ac.cn,m:ziyao@disroot.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[bootlin.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,redhat.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[zhengxingda@iscas.ac.cn,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[zhengxingda@iscas.ac.cn,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	NEURAL_HAM(-0.00)[-0.905];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,iscas.ac.cn:mid,bootlin.com:url]
X-Rspamd-Action: no action

=E5=9C=A8 2026-03-10=E4=BA=8C=E7=9A=84 00:35 +0800=EF=BC=8CIcenowy Zheng=E5=
=86=99=E9=81=93=EF=BC=9A
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D 8< =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +	if (IS_ERR(bridge))
> > > +		return ERR_PTR(PTR_ERR(bridge));
> > > +
> > > +	bridge->crtc =3D crtc;
> > > +	bridge->intf =3D intf;
> > > +	bridge->next_bridge =3D next;
> >=20
> > There is now a next_bridge field in struct drm_bridge, which
> > handles
> > the
> > bridge lifetime in a safer way and more simply [0], so you could
> > use
> > it:
>=20
> Glad to hear such a field exists now. Will more code about
> next_bridge
> lifetime management being shared?

Looks like now many drivers can just share the .attach function,
because they're all doing the same thing:

```
int drm_bridge_attach_next(struct drm_bridge *bridge,
			   struct drm_encoder *encoder,
			   enum drm_bridge_attach_flags flags)
{
	return drm_bridge_attach(encoder, bridge->next_bridge,
				 bridge, flags);
}
```

At least vs_bridge_attach here and meson_encoder_*_attach (named
encoder but they're bridge drivers now) match this pattern (the latter
does a cast from `struct drm_bridge *` to their subclasses, but then
only accessing the `bridge` field of the subclasses and doing the same
things here).

Thanks,
Icenowy

>=20
> Thanks,
> Icenowy
>=20
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bridge->base.next_bridge =3D next;
> >=20
> > Or, after the renames I suggested above:
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vbridge->bridge.next_bridge =3D ne=
xt;
> >=20
> > [0]
> > https://elixir.bootlin.com/linux/v7.0-rc2/source/include/drm/drm_bridge=
.h#L1269-L1278
> >=20
> > Luca
> >=20
> > --
> > Luca Ceresoli, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com

