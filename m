Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D672754531C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 19:38:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75F110EC86;
	Thu,  9 Jun 2022 17:38:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57BAF10EC86
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 17:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654796325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k6TtggULp7/GiOA6VvEvNpW/MHPOaym0FBcYUcuSeZU=;
 b=HiP/6B8u7/30osQggbTBUfF2aX2othmy0rEVxbATgYdnkNVLAEpi6+BbGbxYJlhWaX6qFj
 XxXkyXu4APVyDBpnvMYKSIzMZ+OK3e9dgGT3b9BB5+WZWE+ItKCHznBKOeM42uUKnNn4TC
 4ugvWGoMMMwCSb7GqjHjaUkiPUJV7Qo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-8pAyE9tdMFO4YXmH8glWSQ-1; Thu, 09 Jun 2022 13:38:43 -0400
X-MC-Unique: 8pAyE9tdMFO4YXmH8glWSQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 bi22-20020a05600c3d9600b0039c4144992cso7777677wmb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jun 2022 10:38:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=k6TtggULp7/GiOA6VvEvNpW/MHPOaym0FBcYUcuSeZU=;
 b=jT00YNEJQiYYSGlRyVWPTa3I5/qYOA8UlXgoFAucpjDCxuI6yBwNhfiLDEXOKXfIxu
 /NDER1od4iCP74b1/G80Q29OTrT59ajjPuTTi89djd4t9f9XcwjDkiownFQCd/HJptvS
 +3IrHXq3w6bJIZ05KDmA1A+jaV3oy20O6IMYG5m4DYBeTibmXF4iB2wOrHwCyEz7ozzL
 90ptO6nWAshq3XplHSkvy8D4IlKuIHO5iaW3IgJVDPVgXdELkWDl5e2ghcYVhnIDZWOC
 6alsNgpK1tVHZNtTupJNieAt9v4I158pxAd115GWgnBeSzJC/dR9Th2Zuy/uIvU6g6JH
 JrWg==
X-Gm-Message-State: AOAM531ILSZqKr33onV1YbcAVIHQ/Py/n8t5t39FXAW/aZ7HGHLLUcfJ
 aJg90s9gtLR9qlrdNDe636nS84HNITZN3Byl8Wpq5H416jz8nfD3Ss+HgzZ5B3n9LQvDxEC0Xtq
 3WgS268lWrA1bYLSUbdtFsguASPMM
X-Received: by 2002:a5d:6283:0:b0:213:b939:826d with SMTP id
 k3-20020a5d6283000000b00213b939826dmr35332054wru.543.1654796322052; 
 Thu, 09 Jun 2022 10:38:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycbjbAoqYi/Z38MH7gotfLoia/Ifcg797dUpu4eGDAE74k+ABciK+rkA2pggXKQtSvmd1fZw==
X-Received: by 2002:a5d:6283:0:b0:213:b939:826d with SMTP id
 k3-20020a5d6283000000b00213b939826dmr35332021wru.543.1654796321841; 
 Thu, 09 Jun 2022 10:38:41 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z2-20020adff1c2000000b0020c5253d8dcsm23897952wro.40.2022.06.09.10.38.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 10:38:41 -0700 (PDT)
Message-ID: <0bdbec1f-196b-b82e-9d64-06029e250983@redhat.com>
Date: Thu, 9 Jun 2022 19:38:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Mark olpc_dcon BROKEN [Was: [PATCH v6 5/5] fbdev: Make
 registered_fb[] private to fbmem.c]
To: Sam Ravnborg <sam@ravnborg.org>, Jerry Lin <wahahab11@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220607182338.344270-1-javierm@redhat.com>
 <20220607182338.344270-6-javierm@redhat.com>
 <3ebac271-1276-8132-6175-ca95a26cfcbb@suse.de>
 <69d8ad0e-efc6-f37d-9aa7-d06f8de16a6a@redhat.com>
 <YqIskEjUvJo4y4cb@ravnborg.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YqIskEjUvJo4y4cb@ravnborg.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-fbdev@vger.kernel.org, Zheyu Ma <zheyuma97@gmail.com>,
 kvm@vger.kernel.org, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jon Nettleton <jon.nettleton@gmail.com>, dri-devel@lists.freedesktop.org,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 kernel test robot <lkp@intel.com>, Xiyu Yang <xiyuyang19@fudan.edu.cn>,
 Jens Frederich <jfrederich@gmail.com>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev, Matthew Wilcox <willy@infradead.org>,
 Laszlo Ersek <lersek@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Williamson <alex.williamson@redhat.com>,
 Zhen Lei <thunder.leizhen@huawei.com>, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Sam,

On 6/9/22 19:23, Sam Ravnborg wrote:

[snip]

> 
> To repeat myself from irc.
> olpc_dcon is a staging driver and we should avoid inventing anything in
> core code for to make staging drivers works.
> Geert suggested EXPORT_SYMPBOL_NS_GPL() that could work and narrow it
> down to olpc_dcon.
> The better approach is to mark said driver BROKEN and then someone can
> fix it it there is anyone who cares.
> Last commit to olpc_dcon was in 2019: e40219d5e4b2177bfd4d885e7b64e3b236af40ac
> and maybe Jerry Lin cares enough to fix it.
> 
> Added Jerry and Greg to the mail.
> 
> 	Sam
> 

That does sound like the best approach indeed. And if the driver is kept
BROKEN for a few releases then it can just remove it from the kernel. If
someone still uses/cares about the driver, they can fix it as you said,
and it could even be ported to DRM if is something that's still useful.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

