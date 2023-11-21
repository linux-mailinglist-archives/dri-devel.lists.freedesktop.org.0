Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6AC7F274D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 09:21:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D20A510E27F;
	Tue, 21 Nov 2023 08:21:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E9710E27F;
 Tue, 21 Nov 2023 08:21:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E060A2183B;
 Tue, 21 Nov 2023 08:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1700554864; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DHvhU3HrqobKGoHLioFRjGKT24arfOIced4wAVOChgA=;
 b=SwQzrjcLmZMWH48dY6XiOmK21OEz/fW4qhRygDWl+M1lp+4hY0clANmK59TflHx0Ac83Pl
 NSYpUYnL8g7EDOUNRu3Mw7WF3hqqBd/++y2d9+osxHd2GaUXJrtuxM098PWu5EbnEeLaFz
 TEuH4TNdVPDMrIsQ0APVRARoRCJE/jE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1700554864;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DHvhU3HrqobKGoHLioFRjGKT24arfOIced4wAVOChgA=;
 b=E7CNSkwwZydCSsuMEAwi2OltJgC8E/vl9e1oATOyomas37GPScTiIqOjpHSH0F1TfSjF0M
 tPfFi1p0M+CaYNCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BF10E139FD;
 Tue, 21 Nov 2023 08:21:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WbulLW9oXGVzBgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 21 Nov 2023 08:21:03 +0000
Message-ID: <250b5d51-93f8-4d8c-8507-0c47adbf7237@suse.de>
Date: Tue, 21 Nov 2023 09:21:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/16] drm: Convert to platform remove callback
 returning void
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Russell King
 <linux@armlinux.org.uk>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Javier Martinez Canillas <javierm@redhat.com>, Zhu Wang
 <wangzhu9@huawei.com>, Rob Herring <robh@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Thierry Reding <treding@nvidia.com>,
 Dan Carpenter <error27@gmail.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Deepak R Varma <drv@mailo.com>, Jani Nikula <jani.nikula@intel.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
 <20231120120537.c22pbb2zovxvpdkf@pengutronix.de>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20231120120537.c22pbb2zovxvpdkf@pengutronix.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------nqnrv9dXMHR4lITUuwdTooYm"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -8.79
X-Spamd-Result: default: False [-8.79 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 XM_UA_NO_VERSION(0.01)[]; TO_DN_SOME(0.00)[];
 HAS_ATTACHMENT(0.00)[]; REPLY(-4.00)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_BASE64_TEXT(0.10)[];
 RCPT_COUNT_GT_50(0.00)[62]; SIGNED_PGP(-2.00)[];
 FREEMAIL_TO(0.00)[pengutronix.de,intel.com,linaro.org,kernel.org,linux.intel.com,gmail.com,ffwll.ch,ravnborg.org,collabora.com,synopsys.com,armlinux.org.uk,ti.com,redhat.com,huawei.com,samsung.com,oss.nxp.com,arm.com,nvidia.com,baylibre.com,linux.alibaba.com,ideasonboard.com,mailo.com,iki.fi];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 MID_RHS_MATCH_FROM(0.00)[]; BAYES_HAM(-3.00)[100.00%];
 ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 TAGGED_RCPT(0.00)[etnaviv,renesas];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 TO_MATCH_ENVRCPT_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[]; SUSPICIOUS_RECIPS(1.50)[];
 FREEMAIL_CC(0.00)[vger.kernel.org, pengutronix.de, collabora.com, kwiboo.se,
 googlemail.com, lists.freedesktop.org, gmail.com, nxp.com, lists.infradead.org,
 samsung.com, armlinux.org.uk, baylibre.com, ideasonboard.com]
X-Spam-Flag: NO
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
Cc: linux-samsung-soc@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 linux-mediatek@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>,
 kernel@pengutronix.de, Russell King <linux+etnaviv@armlinux.org.uk>,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------nqnrv9dXMHR4lITUuwdTooYm
Content-Type: multipart/mixed; boundary="------------oJColUxlBAXTr0a7Klbx8daP";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Russell King
 <linux@armlinux.org.uk>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Javier Martinez Canillas <javierm@redhat.com>, Zhu Wang
 <wangzhu9@huawei.com>, Rob Herring <robh@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Thierry Reding <treding@nvidia.com>,
 Dan Carpenter <error27@gmail.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Deepak R Varma <drv@mailo.com>, Jani Nikula <jani.nikula@intel.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 nouveau@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, NXP Linux Team
 <linux-imx@nxp.com>, Christian Gmeiner <christian.gmeiner@gmail.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Message-ID: <250b5d51-93f8-4d8c-8507-0c47adbf7237@suse.de>
Subject: Re: [PATCH v3 00/16] drm: Convert to platform remove callback
 returning void
References: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
 <20231120120537.c22pbb2zovxvpdkf@pengutronix.de>
In-Reply-To: <20231120120537.c22pbb2zovxvpdkf@pengutronix.de>

--------------oJColUxlBAXTr0a7Klbx8daP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjAuMTEuMjMgdW0gMTM6MDUgc2NocmllYiBVd2UgS2xlaW5lLUvDtm5pZzoN
Cj4gW0Ryb3BwZWQgYSBmZXcgcGVvcGxlIGZyb20gVG8gdGhhdCByZXN1bHRlZCBpbiBib3Vu
Y2VzIGJlZm9yZS5dDQo+IA0KPiBPbiBUaHUsIE5vdiAwMiwgMjAyMyBhdCAwNTo1Njo0MVBN
ICswMTAwLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToNCj4+IEhlbGxvLA0KPj4NCj4+IHRo
aXMgc2VyaWVzIGNvbnZlcnRzIGFsbCBwbGF0Zm9ybSBkcml2ZXJzIGJlbG93IGRyaXZlcnMv
Z3B1L2RybSB0byB1c2UNCj4+IC5yZW1vdmVfbmV3KCkuIEl0IHN0YXJ0cyB3aXRoIGEgZml4
IGZvciBhIHByb2JsZW0gdGhhdCBwb3RlbnRpYWxseSBtaWdodA0KPj4gY3Jhc2ggdGhlIGtl
cm5lbCB0aGF0IEkgc3R1bWJsZWQgb3ZlciB3aGlsZSBpbXBsZW1lbnRpbmcgdGhlIGNvbnZl
cnNpb24uDQo+Pg0KPj4gU29tZSBvZiB0aGUgY29udmVyc2lvbiBwYXRjaGVzIGZvbGxvd2lu
ZyB0aGlzIGZpeCB3ZXJlIGFscmVhZHkgc2VuZCBpbg0KPj4gZWFybGllciBzZXJpZXM6DQo+
Pg0KPj4gCWh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZlbC8yMDIzMDgwMTExMDIz
OS44MzEwOTktMS11LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGUNCj4+IAlodHRwczov
L2xvcmUua2VybmVsLm9yZy9kcmktZGV2ZWwvMjAyMzAzMTgxOTA4MDQuMjM0NjEwLTEtdS5r
bGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlDQo+Pg0KPj4gYW5kIHRocmVlIHBhdGNoZXMg
KGJyaWRnZS90cGQxMnMwMTUsIGV4eW5vcyArIHRpbGNkYykgYXJlIG5ldy4gUGFydHMgb2YN
Cj4+IHRoZSBhYm92ZSBzZXJpZXMgd2VyZSBwaWNrZWQgdXAsIHRoZSBwYXRjaGVzIHJlc2Vu
ZCBoZXJlIGFyZSBub3QuDQo+IA0KPiBBcGFydCBmcm9tIGEgUmV2aWV3ZWQtYnk6IGJ5IFRv
bmkgVmFsa2VpbmVuIGZvciBwYXRjaCAjMTYgYW5kIElua2kgRGFlDQo+IHdobyB3cm90ZSB0
byBoYXZlIHRha2VuIHBhdGNoICM4IChidXQgdGhhdCBkaWRuJ3QgYXBwZWFyIGluIG5laXRo
ZXIgbmV4dA0KPiBub3IgZHJtLW1pc2MtbmV4dCB5ZXQpLg0KPiANCj4gQWxzbyBpbiB2MiB0
aGV5IGRpZG4ndCByZXN1bHQgaW4gZXVwaG9yaWMgcmVwbGllcy4NCj4gDQo+IENhbiBzb21l
b25lIHdobyBjYXJlcyBhYm91dCBkcm0gYXMgYSB3aG9sZSBwbGVhc2UgY2FyZSBmb3IgdGhp
cyBzZXJpZXMNCj4gYXBwbHkgaXQ/DQoNCkV4Y2VwdCBmb3IgcGF0Y2hlcyA4IGFuZCAxNiwg
SSd2ZSBwdXNoZWQgdGhpcyBwYXRjaHNldCBpbnRvIGRybS1taXNjLW5leHQuDQoNCkJlc3Qg
cmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IEJlc3QgcmVnYXJkcw0KPiBVd2UNCj4gICANCg0K
LS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VT
RSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYs
IDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJz
LCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVy
bmJlcmcpDQo=

--------------oJColUxlBAXTr0a7Klbx8daP--

--------------nqnrv9dXMHR4lITUuwdTooYm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVcaG4FAwAAAAAACgkQlh/E3EQov+AN
KA//a9kAa/bdNI0Ai8/4/SH2OhY7AVHPXJdcQec7SKrNSi64hCplCI6zwvSrTKHdb6ViCONzvUPj
Z/lLHxxOq2GXTjhiSLgqVEQKBIrJ7v5l8WAZfJ/2SLf5hWTncBM/TvrFLu0brzcYa93ZOnT6jMm0
1Ybx4kfSN9INpiydrOCS5B2r7T/QIdhaBoDGgptMVE98gdjrHqoODVgcyiOEPNnkK/aCO/vnIEmr
BmyCVSCD+AiSC/w6x8pu5/2FXrYuM6Ssz3duqJp6eL7LgJNOI7HBHXpY1wnmOwpUYw6OZVDSUZjX
Rh2P73O8E4XeSem8ZnYZHwvqptO1pmtlnosL+sQQSjtQ1HdHnQfV0t2AmJg0e8qWycyDQNSVNRX4
y6RnHdCk/fd0X2IGACvPw0Y8LuUhEbHwPeeGS3fQJr8RvRD7maMH5FduraKOgKjvxEJnIifX067n
T28SJLqdlbTuB05QUz8004eCqrzjBzqF/s6FwfMVSHytCeGuMsrpb3GcSoBv8eXnbn1jCmoZh6TL
PDXgAJEFmPHYe+oRoDrZnmOI/bXt7I3033iZZkvERz544Ts2QR1VUBOr0elo9GlxcLkFhvy53Bev
8NTNzLjGJl++/klVQqBC2VS6MxE6NdTaNSMpOAygDVxoj4mBHFhPC1WfDYvm/T9s7YKdQQDSdQQC
Q5s=
=GPlo
-----END PGP SIGNATURE-----

--------------nqnrv9dXMHR4lITUuwdTooYm--
