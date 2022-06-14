Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EEF54B1C5
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 14:58:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE92E10F83F;
	Tue, 14 Jun 2022 12:58:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA6E010F83F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 12:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655211515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ezBmONPgWBH1++OckHRx+3aB1t/HFHrFb9bdukl8H7M=;
 b=PJEZIuqL01eg+XsQ4Xjc+55Loni9mjfGzr04EDNDAYJXi73MNr7iMq+ytqFMW4ugCND1VS
 RBd0dbD7/P5xYooP8Fn2xdVbbthf1BBFNgActbD41h6u3LGLjIrmCoYNcdZ/OkvAD3cBn8
 99pcdTxG1yVWsEXiJa1k3I+YEPJYLsQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-YYGVWAcXNga6mrHXfL0wGg-1; Tue, 14 Jun 2022 08:58:32 -0400
X-MC-Unique: YYGVWAcXNga6mrHXfL0wGg-1
Received: by mail-wr1-f71.google.com with SMTP id
 s14-20020adfa28e000000b0020ac7532f08so1274089wra.15
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 05:58:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ezBmONPgWBH1++OckHRx+3aB1t/HFHrFb9bdukl8H7M=;
 b=WvpdTEpEpbiS/8cA7YuNq8q+D4REVNdSmZKJzBc0z2pDDQ4gzcRjxhC2hiZkSBcke3
 l2iR3bfkfx3p60oH+rbD7N77DQTeCU4fcaMu9H/1+tDUihzgdc7ALIYdDe+6VL2+dWgJ
 tL75dUOef6g/NVB9yOu/rCnNgEjiYijhqnlaK11LN5bJjCangmbwWzcSQWTcwlcYvq/l
 XL3mYGQtNpuvRlXi6mAOu3d0TFHmWF9WyTf5qcmCrCrTxA3zmvoDYduca2CDGtI4M4ko
 JFCwZc5Wgen67r2BXZ89l1p2Vhtm6dBqHr1QmFuYW2bnSOb1rcCLdKQBPt0vIqCbixq4
 ut+A==
X-Gm-Message-State: AJIora/uJ6QGBwNDE4eILcZD0elw7Rp4GMKjLBdw73JxSJ3bveV1AybB
 wzLlpLLSaVwD9gCSqVDT6LcIVPtwgQQCkV5UFmJtQXQjP+9FvcP8WJhz/X/gvbtrXvRBiz02rvX
 LtqXop7SyB9Kc/LBwf/v0JFrQMgJq
X-Received: by 2002:a5d:61c9:0:b0:213:b518:444c with SMTP id
 q9-20020a5d61c9000000b00213b518444cmr4684509wrv.509.1655211511554; 
 Tue, 14 Jun 2022 05:58:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vAVyVUrWMmUPbTsdBaKIL+Sh7mNJHVQooy5Tzk0KSO/pkczKP/EKYcPXfuVbr1y1EZJoM7TA==
X-Received: by 2002:a5d:61c9:0:b0:213:b518:444c with SMTP id
 q9-20020a5d61c9000000b00213b518444cmr4684494wrv.509.1655211511350; 
 Tue, 14 Jun 2022 05:58:31 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 i18-20020a05600c2d9200b0039c235fb6a5sm12555666wmg.8.2022.06.14.05.58.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 05:58:31 -0700 (PDT)
Message-ID: <c50e5c87-3198-08b7-1e32-d0959af1f296@redhat.com>
Date: Tue, 14 Jun 2022 14:58:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 3/3] drm/doc: Add KUnit documentation
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
References: <20220613171738.111013-1-jose.exposito89@gmail.com>
 <20220613171738.111013-4-jose.exposito89@gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220613171738.111013-4-jose.exposito89@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org, davidgow@google.com,
 Maxime Ripard <maxime@cerno.tech>, airlied@linux.ie, dlatypov@google.com,
 linux-kernel@vger.kernel.org, tzimmermann@suse.de, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello José,

On 6/13/22 19:17, José Expósito wrote:

[snip]

> +KUnit (Kernel unit testing framework) provides a common framework for unit tests
> +within the Linux kernel.
> +

I think that it will be useful to have a reference to the KUnit kernel doc here,
something like the following:

`KUnit <https://docs.kernel.org/dev-tools/kunit/index.html>`_ (Kernel Unit...

> +This section covers the specifics for the DRM subsystem. For general information
> +about KUnit, please refer to Documentation/dev-tools/kunit/start.rst.
> +
> +How to run the tests?
> +~~~~~~~~~~~~~~~~~~~~~
> +
> +In order to facilitate running the test suite, a configuration file is present
> +in ``drivers/gpu/drm/kunit/.kunitconfig``. It can be used by ``kunit.py`` as
> +follows:
> +
> +.. code-block:: bash
> +
> +	$ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/kunit \
> +		--kconfig_add CONFIG_VIRTIO_UML=y \
> +		--kconfig_add CONFIG_UML_PCI_OVER_VIRTIO=y
> +
> +.. note::
> +	The configuration included in ``.kunitconfig`` should be as generic as
> +	possible.
> +	``CONFIG_VIRTIO_UML`` and ``CONFIG_UML_PCI_OVER_VIRTIO`` are not
> +	included in it because they are only required for User Mode Linux.
> +
> +

Maybe also add something like this ?

For example, the following command can be used to run the test for x86_64:

	$ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/kunit \
		--arch=x86_64

Regardless, the patch looks good to me:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

