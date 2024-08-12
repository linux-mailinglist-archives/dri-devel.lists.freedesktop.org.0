Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D7194E9DE
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 11:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BFDD10E191;
	Mon, 12 Aug 2024 09:32:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.astralinux.ru (mx.astralinux.ru [89.232.161.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A7910E19D
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 09:32:22 +0000 (UTC)
Received: from [10.177.185.108] (helo=new-mail.astralinux.ru)
 by mx.astralinux.ru with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <abelova@astralinux.ru>)
 id 1sdROV-005gCi-Cp; Mon, 12 Aug 2024 12:31:15 +0300
Received: from [10.177.20.58] (unknown [10.177.20.58])
 by new-mail.astralinux.ru (Postfix) with ESMTPA id 4Wj8RZ4dDkz1gwbf;
 Mon, 12 Aug 2024 12:31:54 +0300 (MSK)
Message-ID: <bb45ed80-7871-47ba-a1fd-ee71dc21a409@astralinux.ru>
Date: Mon, 12 Aug 2024 12:30:57 +0300
MIME-Version: 1.0
User-Agent: RuPost Desktop
Subject: Re: [PATCH] drm/meson: add check to prevent dereference of NULL
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
References: <20240809124725.17956-1-abelova@astralinux.ru>
 <CAFBinCATiUnR=P9VRBxWeQhf49k6PVxK+nU95G7w94f-mR2HWQ@mail.gmail.com>
Content-Language: ru
From: Anastasia Belova <abelova@astralinux.ru>
In-Reply-To: <CAFBinCATiUnR=P9VRBxWeQhf49k6PVxK+nU95G7w94f-mR2HWQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DrWeb-SpamScore: 0
X-DrWeb-SpamState: legit
X-DrWeb-SpamDetail: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehuddgtddvucetufdoteggodetrfcurfhrohhfihhlvgemucfftfghgfeunecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttderjeenucfhrhhomheptehnrghsthgrshhirgcuuegvlhhovhgruceorggsvghlohhvrgesrghsthhrrghlihhnuhigrdhruheqnecuggftrfgrthhtvghrnhepvdegleehkeejueehledvhffhuefhieejudevvdejtdeukefghffgveegteeikeeunecukfhppedutddrudejjedrvddtrdehkeenucfrrghrrghmpehhvghloheplgdutddrudejjedrvddtrdehkegnpdhinhgvthepuddtrddujeejrddvtddrheekmeegudeftdeipdhmrghilhhfrhhomheprggsvghlohhvrgesrghsthhrrghlihhnuhigrdhruhdpnhgspghrtghpthhtohepudegpdhrtghpthhtohepmhgrrhhtihhnrdgslhhumhgvnhhsthhinhhglhesghhoohhglhgvmhgrihhlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhope
 grihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlsehffhiflhhlrdgthhdprhgtphhtthhopehkhhhilhhmrghnsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopehjsghruhhnvghtsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheplhhinhhugidqrghmlhhoghhitgeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlvhgtqdhprhhojhgvtghtsehlihhnuhigthgvshhtihhnghdrohhrghenucffrhdrhggvsgcutehnthhishhprghmmecunecuvfgrghhsme
X-DrWeb-SpamVersion: Dr.Web Antispam 1.0.7.202406240#1723449779#02
X-AntiVirus: Checked by Dr.Web [MailD: 11.1.19.2307031128,
 SE: 11.1.12.2210241838, Core engine: 7.00.65.05230, Virus records: 12102994,
 Updated: 2024-Aug-12 08:00:48 UTC]
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

Hello Martin,


10/08/24 12:09, Martin Blumenstingl пишет:
> Hello Anastasia,
>
> Thank you for working on this!
>
> On Fri, Aug 9, 2024 at 2:48 PM Anastasia Belova <abelova@astralinux.ru> wrote:
> [...]
>> @@ -373,9 +373,11 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>>   free_drm:
>>          drm_dev_put(drm);
>>
>> -       meson_encoder_dsi_remove(priv);
>> -       meson_encoder_hdmi_remove(priv);
>> -       meson_encoder_cvbs_remove(priv);
>> +       if (priv) {
>> +               meson_encoder_dsi_remove(priv);
>> +               meson_encoder_hdmi_remove(priv);
>> +               meson_encoder_cvbs_remove(priv);
>> +       }
> This is the straight-forward approach.
>
> There's been conversions from non-devm_ functions to their devm_*
> counterparts in the past in various subsystems.
> I just found that there's a devm_drm_dev_alloc() which seems to be
> calling drm_dev_put() automatically - but I have never used it myself
> before.
> As an alternative to your suggested approach: could you please look
> into whether devm_drm_dev_alloc() is a suitable replacement (if not:
> just explain why - then this patch is good to be merged)?

If I understood correctly, devm_drm_dev_alloc allows to delete drm_dev_put
from error path in meson_drv_bind_master and in meson_drv_unbind.

Then the proposed check may be ommited and function may just return
instead of jumping to free_drm.

And would it be better to rename free_drm to remove_encoders?

Thank you,
Anastasia Belova
