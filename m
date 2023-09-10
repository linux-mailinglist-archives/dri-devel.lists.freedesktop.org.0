Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D82F5799CDA
	for <lists+dri-devel@lfdr.de>; Sun, 10 Sep 2023 08:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC7E10E167;
	Sun, 10 Sep 2023 06:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8046610E168
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Sep 2023 06:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694329112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EF+mREtObA6if9r8T28Dzw3gPzt9UPJWLv6e0kWaOFM=;
 b=JzvS8dFiBqgGZI0/Hf+cYG+gEPmB7oZSdQsFHipOytxE0J9FGv/QBO806RNIZPHyRVa2oX
 943/x4ipNJk0Vc1aOo/13/YogMEGsqSnRcBZfVNBgXp0jRFbGcvA0jcwSTGlEWfXO3VGF5
 NELfAOtmrf7U0/GRpY/vjimo09qwAc0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-7tVt_OWNPg-ikCOFPf0VWw-1; Sun, 10 Sep 2023 02:58:30 -0400
X-MC-Unique: 7tVt_OWNPg-ikCOFPf0VWw-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-31f87a56b46so732119f8f.2
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Sep 2023 23:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694329109; x=1694933909;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EF+mREtObA6if9r8T28Dzw3gPzt9UPJWLv6e0kWaOFM=;
 b=LD5SJa705gczWkRlv+DFs36nGFRMJsOaBFbTzFtEVEtQ7l4Sg2tfY3vOboeXTsmq7X
 FKzKZqGSa4seEBK+IybeIMn2jflw8IN9lXq6jrJeVzKkZROVrPCsT1krb82/PQ+u1TFD
 oHh5btVLG/hW3IUzDAsIBzHE9AqKlTnabdRR+O4OLcyoCotuboEBhfLlIdL1WQgFv6mj
 UtxjEmHmNiK0m3bCc+uayGITrz8sKvGlBsai/ohsLyLcI3y5xDXVf5P9+gMUM8CsbM0C
 dYJLyst678xOs7YxLSUEv7LSakSQJLuFDM+NUWdbb53jxC+EXDrBJD8Gb9kqHdC/bjnI
 w7Hw==
X-Gm-Message-State: AOJu0Ywwl7T8/E3cpctnOL2P1oq6lHEUd5OoVE14WNGzZJnJaHzAQVlp
 y7j74mvAeZtHrzxIc7cF2iU13VNMxYu+RvJqNTkxTdu0Ec1YBk14rik0KdSqLRFjoH32u/D8grK
 hzJbcpOgl8HItX5rH5WKfL8KwJ7jD
X-Received: by 2002:a5d:6b06:0:b0:319:6e74:1637 with SMTP id
 v6-20020a5d6b06000000b003196e741637mr4428770wrw.27.1694329109787; 
 Sat, 09 Sep 2023 23:58:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSx+L2ni7dhd9xEaYUSqtrodGiDpQly/+lPBox6GKopSYayzZ75i6DkIouMBEt+4EzGlCrUg==
X-Received: by 2002:a5d:6b06:0:b0:319:6e74:1637 with SMTP id
 v6-20020a5d6b06000000b003196e741637mr4428761wrw.27.1694329109475; 
 Sat, 09 Sep 2023 23:58:29 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 i9-20020a5d5589000000b003141e629cb6sm6502547wrv.101.2023.09.09.23.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Sep 2023 23:58:29 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 2/3] video: fbdev: ssd1307fb: Print the PWM's label
 instead of its number
In-Reply-To: <20230909202110.bcz5qvb7bfrzco73@pengutronix.de>
References: <20230728145824.616687-1-u.kleine-koenig@pengutronix.de>
 <20230728145824.616687-3-u.kleine-koenig@pengutronix.de>
 <87lef0xcw4.fsf@minerva.mail-host-address-is-not-set>
 <87zg1vif8b.fsf@minerva.mail-host-address-is-not-set>
 <20230909202110.bcz5qvb7bfrzco73@pengutronix.de>
Date: Sun, 10 Sep 2023 08:58:27 +0200
Message-ID: <87v8ciikfg.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Jilin Yuan <yuanjilin@cdjrlc.com>, kernel@pengutronix.de,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> writes:

Hello Uwe,

> Hello,
>
> On Sat, Sep 09, 2023 at 04:38:28PM +0200, Javier Martinez Canillas wrote:
>> Javier Martinez Canillas <javierm@redhat.com> writes:
>>=20
>> > Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> writes:
>> >
>> >> struct pwm_device::pwm is a write-only variable in the pwm core and u=
sed
>> >> nowhere apart from this and another dev_dbg. So it isn't useful to
>> >> identify the used PWM. Emit the PWM's label instead in the debug
>> >> message.
>> >>
>> >> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>> >> ---
>> >
>> > Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>> >
>>=20
>> Pushed to drm-misc (drm-misc-next). Thanks!
>
> JFTR: This patch is already in linus/master. And Javier pushed
> "drm/ssd130x: Print the PWM's label instead of its number" to
> drm-misc-next which is great. So the "Pushed to ..." mail is just in
> reply to the wrong patch in this thread and in git everything is fine.
>

Ups, that's correct. Thanks a lot for pointing that out!

> Thanks
> Uwe
>


--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

