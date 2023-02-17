Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 362FA69A71D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 09:37:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F9910EF0E;
	Fri, 17 Feb 2023 08:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CBD210EF0E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 08:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676623071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MSzy/8JN5jaVlg7s7Ev+cHsdti/OpYprCjQK25MrEM0=;
 b=CNgZmlkaWlaYgy2ejei3/tmvRtdQy6MM1s4riwHq5JOwIiAOYcMNzl+FOCXEY/uRASZB8D
 OHgbDlARMUhTUEm/g64XGE5QPCsoGn4gqlu75VyJHvcJ/P+3OYfEF63XfUyBzhlYrlJS3E
 cGSkuEhTYIygsl9ZEVkQJ0DeQpsVnKc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-655-XUt09HpFNOauEJWeYn1ulw-1; Fri, 17 Feb 2023 03:37:49 -0500
X-MC-Unique: XUt09HpFNOauEJWeYn1ulw-1
Received: by mail-wm1-f69.google.com with SMTP id
 bi27-20020a05600c3d9b00b003e1e7d3db06so325583wmb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 00:37:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MSzy/8JN5jaVlg7s7Ev+cHsdti/OpYprCjQK25MrEM0=;
 b=qwsFVJ0rzZaebLJhXWFDs9ym5ds2f9Rpk0Nanum0ljvZsM6/XhB7caeGmKccgN9yBP
 GFEh/SfGClq90vTt5yqUvAHCLbfErIUdxIyff9X7m88nbzkLhbrwixRETOF/IaheEWN8
 sqNlooL+C0ZgV3R/ZoJ7VdVbTkJQXH4P+tbql4NETTbtcTX1j6U2FocGJw2hyYcADQMu
 OVzP8GD7NxjhOQOd+qb0ghK9sttdKreXTm1PIrC1fKD+cVB5Mmfl9p36lURv0wwcKFeN
 EnKi1dP4HMJZRkL7A5R8+ZPN7SaNVt3zHNeVuz98yeFoAD8KlimxRqJ1+jop+rWse2p3
 PfDA==
X-Gm-Message-State: AO0yUKXE/QZwob5l/+UGWAJhifOQsSNsRPdMnVuJdt7jStTE+v8KwpiW
 RHKVVUGe7ZEu16zFRf0GnRone5Lg4rRUEwsr753cxtmjiDVL2AGQnT6dzqyfefKyXeBLxOj2gJT
 lr8OfWJJIVYjupoEH1G+eQo53wNdK
X-Received: by 2002:a05:600c:16c7:b0:3e2:1e01:803a with SMTP id
 l7-20020a05600c16c700b003e21e01803amr1933580wmn.9.1676623068628; 
 Fri, 17 Feb 2023 00:37:48 -0800 (PST)
X-Google-Smtp-Source: AK7set8mFyGd004x7JjuNSnWDCqg+N00uieOFI0jxDxZPqHUm7LxzesmJkc9kYDEF+RIXwKqhhHhUQ==
X-Received: by 2002:a05:600c:16c7:b0:3e2:1e01:803a with SMTP id
 l7-20020a05600c16c700b003e21e01803amr1933569wmn.9.1676623068346; 
 Fri, 17 Feb 2023 00:37:48 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 x9-20020a05600c21c900b003e11ad0750csm4292183wmj.47.2023.02.17.00.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 00:37:47 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, geoff@infradead.org, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: Re: [PATCH 02/11] fbdev: Transfer video= option strings to caller;
 clarify ownership
In-Reply-To: <20230209135509.7786-3-tzimmermann@suse.de>
References: <20230209135509.7786-1-tzimmermann@suse.de>
 <20230209135509.7786-3-tzimmermann@suse.de>
Date: Fri, 17 Feb 2023 09:37:46 +0100
Message-ID: <87a61cy9et.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> In fb_get_options(), always duplicate the returned option string and
> transfer ownership of the memory to the function's caller.
>
> Until now, only the global option string got duplicated and transferred
> to the caller; the per-driver options were owned by fb_get_options().
> In the end, it was impossible for the function's caller to detect if
> it had to release the string's memory buffer. Hence, all calling drivers
> leak the memory buffer. The leaks have existed ever since, but drivers
> only call fb_get_option() once as part of module initialization. So the
> amount of leaked memory is not significant.
>
> Fix the semantics of fb_get_option() by unconditionally transferring
> ownership of the memory buffer to the caller. Later patches can resolve
> the memory leaks in the fbdev drivers.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[...]

> +	if (option) {
> +		if (options)
> +			*option = kstrdup(options, GFP_KERNEL);
> +		else
> +			*option = NULL;
> +	}
>

I know the old code wasn't checking if kstrdup() succeeded, but you should
do it here and let the caller know. And same if (!options). So I guess the
following check can be added (to be consistent with the rest of the code):

	if (!*option)
		retval = 1;

>  	return retval;
>  }
> -- 
> 2.39.1

Best regards,
Javier

