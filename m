Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E35F26C0E0F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 11:03:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA66710E2C4;
	Mon, 20 Mar 2023 10:03:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E5910E2C4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 10:03:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 705C621B46;
 Mon, 20 Mar 2023 10:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1679306624; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qpCgO7hlqjiKsTpIkPHtACwzoWUTPlGNnV6BVYZ0Emk=;
 b=1iCP28t3Rvab8cnbTwsQd4h+hXUw975mbsRm6L6TXUn6dronY8oy3aQNjSlJqHIB5OXSqV
 tM9AaPkEjkc3W27zTX0QlHm/6NNYrbshl3zst2pbkXxusnhT36uI/VFRo29IQz4zwb0u5k
 ANQ419YqiUqtuB6cUbaqwnNaBmN7ueg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1679306624;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qpCgO7hlqjiKsTpIkPHtACwzoWUTPlGNnV6BVYZ0Emk=;
 b=PrseXUDbXG8Yo/4gBSwQc2+h8mHY6KFRHecDpOCgHFH9w9qSetUmQenMnIAzxLyByRkEgN
 g/an1GMRbnROZnCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7EF4413A00;
 Mon, 20 Mar 2023 10:03:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qwItHn8vGGQsBQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Mar 2023 10:03:43 +0000
Message-ID: <1970f73c-31f5-17cf-c8ef-f24e13e7ab8a@suse.de>
Date: Mon, 20 Mar 2023 11:03:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 00/51] video: fbdev: Convert to platform remove callback
 returning void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Helge Deller <deller@gmx.de>, Yihao Han <hanyihao@vivo.com>,
 Jaya Kumar <jayalk@intworks.biz>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Alexander Shiyan <shc_work@mail.ru>, Dongliang Mu <dzm91@hust.edu.cn>,
 Peter Jones <pjones@redhat.com>, Gaosheng Cui <cuigaosheng1@huawei.com>,
 Timur Tabi <timur@kernel.org>, Xuezhi Zhang <zhangxuezhi1@coolpad.com>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Ferenc Bakonyi <fero@drama.obuda.kando.hu>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Stephen Kitt
 <steve@sk2.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Yu Zhe
 <yuzhe@nfschina.com>, Xu Panda <xu.panda@zte.com.cn>,
 Zhang Qilong <zhangqilong3@huawei.com>, Hyunwoo Kim <imv4bel@gmail.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Ulf Hansson
 <ulf.hansson@linaro.org>, "wangkailong@jari.cn" <wangkailong@jari.cn>,
 Wang Qing <wangqing@vivo.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Jingoo Han <jingoohan1@gmail.com>, ye xingchen <ye.xingchen@zte.com.cn>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Hans de Goede <hdegoede@redhat.com>, Michal Januszewski <spock@gentoo.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Zeng Heng <zengheng4@huawei.com>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Michal Simek <michal.simek@xilinx.com>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------MAn2YH0jaHmkTW7lW1ammfSN"
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
 NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de,
 linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------MAn2YH0jaHmkTW7lW1ammfSN
Content-Type: multipart/mixed; boundary="------------fSfRse6uwaO609PuE00oTQfI";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Helge Deller <deller@gmx.de>, Yihao Han <hanyihao@vivo.com>,
 Jaya Kumar <jayalk@intworks.biz>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Alexander Shiyan <shc_work@mail.ru>, Dongliang Mu <dzm91@hust.edu.cn>,
 Peter Jones <pjones@redhat.com>, Gaosheng Cui <cuigaosheng1@huawei.com>,
 Timur Tabi <timur@kernel.org>, Xuezhi Zhang <zhangxuezhi1@coolpad.com>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Ferenc Bakonyi <fero@drama.obuda.kando.hu>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Stephen Kitt
 <steve@sk2.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Yu Zhe
 <yuzhe@nfschina.com>, Xu Panda <xu.panda@zte.com.cn>,
 Zhang Qilong <zhangqilong3@huawei.com>, Hyunwoo Kim <imv4bel@gmail.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Ulf Hansson
 <ulf.hansson@linaro.org>, "wangkailong@jari.cn" <wangkailong@jari.cn>,
 Wang Qing <wangqing@vivo.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Jingoo Han <jingoohan1@gmail.com>, ye xingchen <ye.xingchen@zte.com.cn>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Hans de Goede <hdegoede@redhat.com>, Michal Januszewski <spock@gentoo.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Zeng Heng <zengheng4@huawei.com>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Michal Simek <michal.simek@xilinx.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de,
 linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-ID: <1970f73c-31f5-17cf-c8ef-f24e13e7ab8a@suse.de>
Subject: Re: [PATCH 00/51] video: fbdev: Convert to platform remove callback
 returning void
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>

--------------fSfRse6uwaO609PuE00oTQfI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SSdtIGEgYml0IGxhdGUsIGJ1dCBzdGlsbA0KDQpBY2tlZC1ieTogVGhvbWFzIFppbW1lcm1h
bm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoNCmZvciB0aGUgc2VyaWVzLiBUaGFua3MgZm9y
IHRoaXMgY2xlYW51cC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KQW0gMTkuMDMuMjMg
dW0gMDA6NTMgc2NocmllYiBVd2UgS2xlaW5lLUvDtm5pZzoNCj4gSGVsbG8sDQo+IA0KPiB0
aGlzIHNlcmllcyBhZGFwdHMgdGhlIHBsYXRmb3JtIGRyaXZlcnMgYmVsb3cgZHJpdmVycy92
aWRlby9mYmRldiB0byB1c2UgdGhlDQo+IC5yZW1vdmVfbmV3KCkgY2FsbGJhY2suIENvbXBh
cmVkIHRvIHRoZSB0cmFkaXRpb25hbCAucmVtb3ZlKCkgY2FsbGJhY2sNCj4gLnJlbW92ZV9u
ZXcoKSByZXR1cm5zIG5vIHZhbHVlLiBUaGlzIGlzIGEgZ29vZCB0aGluZyBiZWNhdXNlIHRo
ZSBkcml2ZXIgY29yZQ0KPiBkb2Vzbid0IChhbmQgY2Fubm90KSBjb3BlIGZvciBlcnJvcnMg
ZHVyaW5nIHJlbW92ZS4gVGhlIG9ubHkgZWZmZWN0IG9mIGENCj4gbm9uLXplcm8gcmV0dXJu
IHZhbHVlIGluIC5yZW1vdmUoKSBpcyB0aGF0IHRoZSBkcml2ZXIgY29yZSBlbWl0cyBhIHdh
cm5pbmcuIFRoZQ0KPiBkZXZpY2UgaXMgcmVtb3ZlZCBhbnlob3cgYW5kIGFuIGVhcmx5IHJl
dHVybiBmcm9tIC5yZW1vdmUoKSB1c3VhbGx5IHlpZWxkcyBhDQo+IHJlc291cmNlIGxlYWsu
DQo+IA0KPiBCeSBjaGFuZ2luZyB0aGUgcmVtb3ZlIGNhbGxiYWNrIHRvIHJldHVybiB2b2lk
IGRyaXZlciBhdXRob3JzIGNhbm5vdA0KPiByZWFzb25hYmx5IGFzc3VtZSBhbnkgbW9yZSB0
aGF0IHRoZXJlIGlzIHNvbWUga2luZCBvZiBjbGVhbnVwIGxhdGVyLg0KPiANCj4gVGhlIGZp
cnN0IHBhdGNoIHNpbXBsaWZpZXMgdGhlIHJlbW92ZSBjYWxsYmFjayBvZiBvbmUgZHJpdmVy
IHRvIG9idmlvdXNseQ0KPiBhbHdheXMgcmV0dXJuIHplcm8uIEFmdGVyIHRoYXQgYWxsIGRy
aXZlcnMgYXJlIGNvbnZlcnRlZCB0cml2aWFsbHkgdG8NCj4gLnJlbW92ZV9uZXcoKS4NCj4g
DQo+IEJlc3QgcmVnYXJkcw0KPiBVd2UNCj4gDQo+IFV3ZSBLbGVpbmUtS8O2bmlnICg1MSk6
DQo+ICAgIHZpZGVvOiBmYmRldjogYXUxMTAwZmI6IERyb3AgaWYgd2l0aCBhbiBhbHdheXMg
ZmFsc2UgY29uZGl0aW9uDQo+ICAgIHZpZGVvOiBmYmRldjogYXJjZmI6IENvbnZlcnQgdG8g
cGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZw0KPiAgICAgIHZvaWQNCj4gICAg
dmlkZW86IGZiZGV2OiBhdTExMDBmYjogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2Fs
bGJhY2sgcmV0dXJuaW5nDQo+ICAgICAgdm9pZA0KPiAgICB2aWRlbzogZmJkZXY6IGF1MTIw
MGZiOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcNCj4g
ICAgICB2b2lkDQo+ICAgIHZpZGVvOiBmYmRldjogYnJvYWRzaGVldGZiOiBDb252ZXJ0IHRv
IHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjaw0KPiAgICAgIHJldHVybmluZyB2b2lkDQo+ICAg
IHZpZGVvOiBmYmRldjogYncyOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFj
ayByZXR1cm5pbmcgdm9pZA0KPiAgICB2aWRlbzogZmJkZXY6IGNnMTQ6IENvbnZlcnQgdG8g
cGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkDQo+ICAgIHZpZGVvOiBm
YmRldjogY2czOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5p
bmcgdm9pZA0KPiAgICB2aWRlbzogZmJkZXY6IGNnNjogQ29udmVydCB0byBwbGF0Zm9ybSBy
ZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQNCj4gICAgdmlkZW86IGZiZGV2OiBjbHBz
NzExeC1mYjogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sNCj4gICAgICBy
ZXR1cm5pbmcgdm9pZA0KPiAgICB2aWRlbzogZmJkZXY6IGNvYmFsdF9sY2RmYjogQ29udmVy
dCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sNCj4gICAgICByZXR1cm5pbmcgdm9pZA0K
PiAgICB2aWRlbzogZmJkZXY6IGRhOHh4LWZiOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92
ZSBjYWxsYmFjayByZXR1cm5pbmcNCj4gICAgICB2b2lkDQo+ICAgIHZpZGVvOiBmYmRldjog
ZWZpZmI6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZw0K
PiAgICAgIHZvaWQNCj4gICAgdmlkZW86IGZiZGV2OiBlcDkzeHgtZmI6IENvbnZlcnQgdG8g
cGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZw0KPiAgICAgIHZvaWQNCj4gICAg
dmlkZW86IGZiZGV2OiBmZmI6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNr
IHJldHVybmluZyB2b2lkDQo+ICAgIHZpZGVvOiBmYmRldjogZnNsLWRpdS1mYjogQ29udmVy
dCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sNCj4gICAgICByZXR1cm5pbmcgdm9pZA0K
PiAgICB2aWRlbzogZmJkZXY6IGdiZWZiOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBj
YWxsYmFjayByZXR1cm5pbmcNCj4gICAgICB2b2lkDQo+ICAgIHZpZGVvOiBmYmRldjogZ29s
ZGZpc2hmYjogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sNCj4gICAgICBy
ZXR1cm5pbmcgdm9pZA0KPiAgICB2aWRlbzogZmJkZXY6IGdydmdhOiBDb252ZXJ0IHRvIHBs
YXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcNCj4gICAgICB2b2lkDQo+ICAgIHZp
ZGVvOiBmYmRldjogaGVjdWJhZmI6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxi
YWNrIHJldHVybmluZw0KPiAgICAgIHZvaWQNCj4gICAgdmlkZW86IGZiZGV2OiBoZ2FmYjog
Q29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nDQo+ICAgICAg
dm9pZA0KPiAgICB2aWRlbzogZmJkZXY6IGhpdGZiOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJl
bW92ZSBjYWxsYmFjayByZXR1cm5pbmcNCj4gICAgICB2b2lkDQo+ICAgIHZpZGVvOiBmYmRl
djogaW14ZmI6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmlu
Zw0KPiAgICAgIHZvaWQNCj4gICAgdmlkZW86IGZiZGV2OiBsZW86IENvbnZlcnQgdG8gcGxh
dGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkDQo+ICAgIHZpZGVvOiBmYmRl
djogbWI4NjJ4eDogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJu
aW5nDQo+ICAgICAgdm9pZA0KPiAgICB2aWRlbzogZmJkZXY6IG1ldHJvbm9tZWZiOiBDb252
ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjaw0KPiAgICAgIHJldHVybmluZyB2b2lk
DQo+ICAgIHZpZGVvOiBmYmRldjogbXgzZmI6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3Zl
IGNhbGxiYWNrIHJldHVybmluZw0KPiAgICAgIHZvaWQNCj4gICAgdmlkZW86IGZiZGV2OiBv
Y2ZiOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9p
ZA0KPiAgICB2aWRlbzogZmJkZXY6IG9mZmI6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3Zl
IGNhbGxiYWNrIHJldHVybmluZyB2b2lkDQo+ICAgIHZpZGVvOiBmYmRldjogb21hcGZiOiBD
b252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcNCj4gICAgICB2
b2lkDQo+ICAgIHZpZGVvOiBmYmRldjogcDkxMDA6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVt
b3ZlIGNhbGxiYWNrIHJldHVybmluZw0KPiAgICAgIHZvaWQNCj4gICAgdmlkZW86IGZiZGV2
OiBwbGF0aW51bWZiOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjaw0KPiAg
ICAgIHJldHVybmluZyB2b2lkDQo+ICAgIHZpZGVvOiBmYmRldjogcHhhMTY4ZmI6IENvbnZl
cnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZw0KPiAgICAgIHZvaWQN
Cj4gICAgdmlkZW86IGZiZGV2OiBweGEzeHgtZ2N1OiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJl
bW92ZSBjYWxsYmFjaw0KPiAgICAgIHJldHVybmluZyB2b2lkDQo+ICAgIHZpZGVvOiBmYmRl
djogcHhhZmI6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmlu
Zw0KPiAgICAgIHZvaWQNCj4gICAgdmlkZW86IGZiZGV2OiBzMWQxM3h4eGZiOiBDb252ZXJ0
IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjaw0KPiAgICAgIHJldHVybmluZyB2b2lkDQo+
ICAgIHZpZGVvOiBmYmRldjogczNjLWZiOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBj
YWxsYmFjayByZXR1cm5pbmcNCj4gICAgICB2b2lkDQo+ICAgIHZpZGVvOiBmYmRldjogc2g3
NzYwZmI6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZw0K
PiAgICAgIHZvaWQNCj4gICAgdmlkZW86IGZiZGV2OiBzaF9tb2JpbGVfbGNkY2ZiOiBDb252
ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjaw0KPiAgICAgIHJldHVybmluZyB2b2lk
DQo+ICAgIHZpZGVvOiBmYmRldjogc2ltcGxlZmI6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVt
b3ZlIGNhbGxiYWNrIHJldHVybmluZw0KPiAgICAgIHZvaWQNCj4gICAgdmlkZW86IGZiZGV2
OiBzbTUwMWZiOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5p
bmcNCj4gICAgICB2b2lkDQo+ICAgIHZpZGVvOiBmYmRldjogdGN4OiBDb252ZXJ0IHRvIHBs
YXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZA0KPiAgICB2aWRlbzogZmJk
ZXY6IHV2ZXNhZmI6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVy
bmluZw0KPiAgICAgIHZvaWQNCj4gICAgdmlkZW86IGZiZGV2OiB2ZXNhZmI6IENvbnZlcnQg
dG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZw0KPiAgICAgIHZvaWQNCj4g
ICAgdmlkZW86IGZiZGV2OiB2ZmI6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxi
YWNrIHJldHVybmluZyB2b2lkDQo+ICAgIHZpZGVvOiBmYmRldjogdmdhMTZmYjogQ29udmVy
dCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nDQo+ICAgICAgdm9pZA0K
PiAgICB2aWRlbzogZmJkZXY6IHZpYTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2Fs
bGJhY2sgcmV0dXJuaW5nIHZvaWQNCj4gICAgdmlkZW86IGZiZGV2OiB2dDg1MDBsY2RmYjog
Q29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sNCj4gICAgICByZXR1cm5pbmcg
dm9pZA0KPiAgICB2aWRlbzogZmJkZXY6IHdtODUwNWZiOiBDb252ZXJ0IHRvIHBsYXRmb3Jt
IHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcNCj4gICAgICB2b2lkDQo+ICAgIHZpZGVvOiBm
YmRldjogd210X2dlX3JvcHM6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNr
DQo+ICAgICAgcmV0dXJuaW5nIHZvaWQNCj4gICAgdmlkZW86IGZiZGV2OiB4aWxpbnhmYjog
Q29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nDQo+ICAgICAg
dm9pZA0KPiANCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2FyY2ZiLmMgICAgICAgICAgICAg
ICAgICAgIHwgIDUgKystLS0NCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2F1MTEwMGZiLmMg
ICAgICAgICAgICAgICAgIHwgMTEgKysrLS0tLS0tLS0NCj4gICBkcml2ZXJzL3ZpZGVvL2Zi
ZGV2L2F1MTIwMGZiLmMgICAgICAgICAgICAgICAgIHwgIDYgKystLS0tDQo+ICAgZHJpdmVy
cy92aWRlby9mYmRldi9icm9hZHNoZWV0ZmIuYyAgICAgICAgICAgICB8ICA1ICsrLS0tDQo+
ICAgZHJpdmVycy92aWRlby9mYmRldi9idzIuYyAgICAgICAgICAgICAgICAgICAgICB8ICA2
ICsrLS0tLQ0KPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvY2cxNC5jICAgICAgICAgICAgICAg
ICAgICAgfCAgNiArKy0tLS0NCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NnMy5jICAgICAg
ICAgICAgICAgICAgICAgIHwgIDYgKystLS0tDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9j
ZzYuYyAgICAgICAgICAgICAgICAgICAgICB8ICA2ICsrLS0tLQ0KPiAgIGRyaXZlcnMvdmlk
ZW8vZmJkZXYvY2xwczcxMXgtZmIuYyAgICAgICAgICAgICAgfCAgNiArKy0tLS0NCj4gICBk
cml2ZXJzL3ZpZGVvL2ZiZGV2L2NvYmFsdF9sY2RmYi5jICAgICAgICAgICAgIHwgIDYgKyst
LS0tDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9kYTh4eC1mYi5jICAgICAgICAgICAgICAg
ICB8ICA2ICsrLS0tLQ0KPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvZWZpZmIuYyAgICAgICAg
ICAgICAgICAgICAgfCAgNiArKy0tLS0NCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2VwOTN4
eC1mYi5jICAgICAgICAgICAgICAgIHwgIDYgKystLS0tDQo+ICAgZHJpdmVycy92aWRlby9m
YmRldi9mZmIuYyAgICAgICAgICAgICAgICAgICAgICB8ICA2ICsrLS0tLQ0KPiAgIGRyaXZl
cnMvdmlkZW8vZmJkZXYvZnNsLWRpdS1mYi5jICAgICAgICAgICAgICAgfCAgNiArKy0tLS0N
Cj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2diZWZiLmMgICAgICAgICAgICAgICAgICAgIHwg
IDYgKystLS0tDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9nb2xkZmlzaGZiLmMgICAgICAg
ICAgICAgICB8ICA1ICsrLS0tDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9ncnZnYS5jICAg
ICAgICAgICAgICAgICAgICB8ICA2ICsrLS0tLQ0KPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYv
aGVjdWJhZmIuYyAgICAgICAgICAgICAgICAgfCAgNSArKy0tLQ0KPiAgIGRyaXZlcnMvdmlk
ZW8vZmJkZXYvaGdhZmIuYyAgICAgICAgICAgICAgICAgICAgfCAgNiArKy0tLS0NCj4gICBk
cml2ZXJzL3ZpZGVvL2ZiZGV2L2hpdGZiLmMgICAgICAgICAgICAgICAgICAgIHwgIDYgKyst
LS0tDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9pbXhmYi5jICAgICAgICAgICAgICAgICAg
ICB8ICA2ICsrLS0tLQ0KPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvbGVvLmMgICAgICAgICAg
ICAgICAgICAgICAgfCAgNiArKy0tLS0NCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L21iODYy
eHgvbWI4NjJ4eGZiZHJ2LmMgICAgIHwgIDUgKystLS0NCj4gICBkcml2ZXJzL3ZpZGVvL2Zi
ZGV2L21ldHJvbm9tZWZiLmMgICAgICAgICAgICAgIHwgIDUgKystLS0NCj4gICBkcml2ZXJz
L3ZpZGVvL2ZiZGV2L214M2ZiLmMgICAgICAgICAgICAgICAgICAgIHwgIDUgKystLS0NCj4g
ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L29jZmIuYyAgICAgICAgICAgICAgICAgICAgIHwgIDYg
KystLS0tDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9vZmZiLmMgICAgICAgICAgICAgICAg
ICAgICB8ICA4ICsrKy0tLS0tDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9vbWFwL29tYXBm
Yl9tYWluLmMgICAgICAgICB8ICA2ICsrLS0tLQ0KPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYv
b21hcDIvb21hcGZiL2Rzcy9jb3JlLmMgICAgfCAgNiArKy0tLS0NCj4gICBkcml2ZXJzL3Zp
ZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kc3MvZGlzcGMuYyAgIHwgIDUgKystLS0NCj4gICBk
cml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kc3MvZHBpLmMgICAgIHwgIDUgKyst
LS0NCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kc3MvZHNpLmMgICAg
IHwgIDUgKystLS0NCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kc3Mv
ZHNzLmMgICAgIHwgIDUgKystLS0NCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29t
YXBmYi9kc3MvaGRtaTQuYyAgIHwgIDUgKystLS0NCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2
L29tYXAyL29tYXBmYi9kc3MvaGRtaTUuYyAgIHwgIDUgKystLS0NCj4gICBkcml2ZXJzL3Zp
ZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kc3Mvc2RpLmMgICAgIHwgIDUgKystLS0NCj4gICBk
cml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kc3MvdmVuYy5jICAgIHwgIDUgKyst
LS0NCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9vbWFwZmItbWFpbi5j
IHwgIDYgKystLS0tDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9wOTEwMC5jICAgICAgICAg
ICAgICAgICAgICB8ICA2ICsrLS0tLQ0KPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvcGxhdGlu
dW1mYi5jICAgICAgICAgICAgICAgfCAgNiArKy0tLS0NCj4gICBkcml2ZXJzL3ZpZGVvL2Zi
ZGV2L3B4YTE2OGZiLmMgICAgICAgICAgICAgICAgIHwgIDggKysrLS0tLS0NCj4gICBkcml2
ZXJzL3ZpZGVvL2ZiZGV2L3B4YTN4eC1nY3UuYyAgICAgICAgICAgICAgIHwgIDYgKystLS0t
DQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9weGFmYi5jICAgICAgICAgICAgICAgICAgICB8
ICA4ICsrKy0tLS0tDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9zMWQxM3h4eGZiLmMgICAg
ICAgICAgICAgICB8ICA1ICsrLS0tDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9zM2MtZmIu
YyAgICAgICAgICAgICAgICAgICB8ICA2ICsrLS0tLQ0KPiAgIGRyaXZlcnMvdmlkZW8vZmJk
ZXYvc2g3NzYwZmIuYyAgICAgICAgICAgICAgICAgfCAgNiArKy0tLS0NCj4gICBkcml2ZXJz
L3ZpZGVvL2ZiZGV2L3NoX21vYmlsZV9sY2RjZmIuYyAgICAgICAgIHwgIDUgKystLS0NCj4g
ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3NpbXBsZWZiLmMgICAgICAgICAgICAgICAgIHwgIDYg
KystLS0tDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9zbTUwMWZiLmMgICAgICAgICAgICAg
ICAgICB8ICA2ICsrLS0tLQ0KPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvdGN4LmMgICAgICAg
ICAgICAgICAgICAgICAgfCAgNiArKy0tLS0NCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3V2
ZXNhZmIuYyAgICAgICAgICAgICAgICAgIHwgIDYgKystLS0tDQo+ICAgZHJpdmVycy92aWRl
by9mYmRldi92ZXNhZmIuYyAgICAgICAgICAgICAgICAgICB8ICA2ICsrLS0tLQ0KPiAgIGRy
aXZlcnMvdmlkZW8vZmJkZXYvdmZiLmMgICAgICAgICAgICAgICAgICAgICAgfCAgNSArKy0t
LQ0KPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvdmdhMTZmYi5jICAgICAgICAgICAgICAgICAg
fCAgNiArKy0tLS0NCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3ZpYS92aWEtZ3Bpby5jICAg
ICAgICAgICAgIHwgIDUgKystLS0NCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3ZpYS92aWFf
aTJjLmMgICAgICAgICAgICAgIHwgIDUgKystLS0NCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2
L3Z0ODUwMGxjZGZiLmMgICAgICAgICAgICAgIHwgIDYgKystLS0tDQo+ICAgZHJpdmVycy92
aWRlby9mYmRldi93bTg1MDVmYi5jICAgICAgICAgICAgICAgICB8ICA2ICsrLS0tLQ0KPiAg
IGRyaXZlcnMvdmlkZW8vZmJkZXYvd210X2dlX3JvcHMuYyAgICAgICAgICAgICAgfCAgNSAr
Ky0tLQ0KPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYveGlsaW54ZmIuYyAgICAgICAgICAgICAg
ICAgfCAgNiArKy0tLS0NCj4gICA2MSBmaWxlcyBjaGFuZ2VkLCAxMjYgaW5zZXJ0aW9ucygr
KSwgMjMwIGRlbGV0aW9ucygtKQ0KPiANCj4gYmFzZS1jb21taXQ6IGZlMTVjMjZlZTI2ZWZh
MTE3NDFhN2I2MzJlOWYyM2IwMWFjYTRjYzYNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0K
R3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2Vy
bWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihI
UkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYN
Cg==

--------------fSfRse6uwaO609PuE00oTQfI--

--------------MAn2YH0jaHmkTW7lW1ammfSN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQYL38FAwAAAAAACgkQlh/E3EQov+AR
2A//TsOJhSHjY+aFvkAUtFF+xSlLNtsgYcFzAnA7eairW1e+SaHnCtivW4cDPqfG55RdKoqrpCF3
5KimqWC9w9Rlr60Ew6mY75hRN/CdrNrlCCigRMCl0yFPHeGCI0idTbn+bUYLgM1lUOiFyM7w8iCa
fx6JyOuIxuWxnWUKQCxIKUue0PW1xSV+iMru2Q4PF0nM+rC0nRD/hE1E2eIUycthbteX1vmuSQG5
1RxTHPyDtQ7RkVB1vaaQewecaoRWlsynVl8kwfaFLlDk9i8S8ZkLdldbEbZt8vq3GK3UAI5ve6Ww
nO415L84JEgYMmu06CdTRG9T7QISaNU8jISll6fk/ZBz/SoIkvXBzGt+Ebk5MtEnPRGpforj6pNX
cIZHJE6jFhh196U/y+Ju+Xxh3nbdlQ7f5TT6+E0jdtDSDtRGCXTNC2mJ6Hf14763WISNawdwgBEU
IlHhsHCOV+awJAiVwRdacxWlTwznOFg1XLK01yqErkf3CwyHlWjas/xCRUmGLBUQFCQ39ZTMW7f6
9Th9Ba91nvuMM2ukq8S4olj9IEzsSYOGlDCM00OouiNE/eckjnBx0H30e25AzmOMUzd5MQwjKIoi
K24CVjm0kzKWuaVKY1h5IdgjiRkFWqJiPdTzUiuEAYtyelRO4+LpbviLq4EosEYvaPICU5GDg1Xp
18Q=
=cW2b
-----END PGP SIGNATURE-----

--------------MAn2YH0jaHmkTW7lW1ammfSN--
