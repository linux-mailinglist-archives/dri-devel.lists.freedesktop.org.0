Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A8A5F74C9
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 09:41:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC7E10E061;
	Fri,  7 Oct 2022 07:41:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24AB110E061
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 07:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665128501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PeC1fkr59l/EIYZggXoKHLLeXrApnsZiAf+izzP2tyA=;
 b=FyPu77XL2MowDO6Gui8W+aNccLCdlcDwRb6tgn2ikjx52uGW0+2FYgDbUoEG9f1axxEAq8
 eMrsKbgCGoD6FwYuLMHhFm9lMYPPdZmqqU7uzED1oTf5fJ7Veh+QHTo2rwBD5J4dn77QZP
 p1p8Ootcy/CSgWBATr8dFTOz5rnsZTo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-159-OVNksQjsMEmtpI0p6SYywQ-1; Fri, 07 Oct 2022 03:41:37 -0400
X-MC-Unique: OVNksQjsMEmtpI0p6SYywQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 i82-20020a1c3b55000000b003bf635eac31so2299377wma.4
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Oct 2022 00:41:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PeC1fkr59l/EIYZggXoKHLLeXrApnsZiAf+izzP2tyA=;
 b=W5FA571Eys6qOAJqaIBfRvpimAsR6awL7nU27gHa8D2x3Vs0otENnSLOJ6pcxlCoGS
 AeSj96Gw0wKq7MM36XMPo/EWc01HEcZUJM89TvQGxkJXpzrhucV4Rx7pU9IEPXtzjAdQ
 FZIXHGDAqhKJULn3wDL/FKvEy2gYm1yroVXASrPo8w48m7jPnPQ1TM9sJ2KbGno9HtFx
 jxjA8djmm8MKVjdSZQmme8PnVp9Xyk7VL/nGXpDFYqVr4X4C0G6tzeGh1cb8lIWqrjSl
 XoLIsKRZkaAr/FcYlAruGAB0FmdSZXh5bJRvXPmGxVml4bHSOQ8BUkta/dLsuLMy9VkU
 +emw==
X-Gm-Message-State: ACrzQf1QOLoQiOV2HycSX7qSYZxOg/T7zcvaDkNMt7mp9PqKWslmIH+Z
 t9a03U4Lo5tbrMW3pzs1ip/MGnLliyJih6EMwRhdclSYqTNw5kvZDHUcDRI3+2BX9+wlwTD7amF
 fzhDuYxzdn9nx8v25DLaB/4hQNRW/
X-Received: by 2002:a5d:58d6:0:b0:22e:7318:4e8f with SMTP id
 o22-20020a5d58d6000000b0022e73184e8fmr2300335wrf.578.1665128496784; 
 Fri, 07 Oct 2022 00:41:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7P6jg/mR6XMrO/+fFikahcM7WGyU6oBVN5bq31Pn4WilVTHEnJMhQbdtcg/Cd7qCx5kvgpLg==
X-Received: by 2002:a5d:58d6:0:b0:22e:7318:4e8f with SMTP id
 o22-20020a5d58d6000000b0022e73184e8fmr2300323wrf.578.1665128496620; 
 Fri, 07 Oct 2022 00:41:36 -0700 (PDT)
Received: from [172.20.10.4] ([84.78.240.215])
 by smtp.gmail.com with ESMTPSA id
 fc19-20020a05600c525300b003a342933727sm7529292wmb.3.2022.10.07.00.41.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Oct 2022 00:41:36 -0700 (PDT)
Message-ID: <c8288c68-2948-7399-594d-7a95995f652c@redhat.com>
Date: Fri, 7 Oct 2022 09:41:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v4 2/2] drm/atomic-helper: Replace
 drm_atomic_helper_check_crtc_state()
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20221005114002.3715-1-tzimmermann@suse.de>
 <20221005114002.3715-3-tzimmermann@suse.de>
 <7bea011f-f1d0-4375-ee1c-f97e12cd3f0a@redhat.com>
 <Yz/QICUIu25XjZGX@intel.com>
 <890f79b7-4c6b-0f99-f9c7-ba16bb9367a9@redhat.com>
 <Yz/VZqQN33gvk1Ab@intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <Yz/VZqQN33gvk1Ab@intel.com>
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
Cc: jfalempe@redhat.com, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/7/22 09:29, Ville Syrjälä wrote:

[...]

>> 	drm_for_each_plane_mask(plane, dev, crtc_state->plane_mask)
>> 		if (plane->type == DRM_PLANE_TYPE_PRIMARY)
>> 			return 0;
> 
> That is exactly what it says not to do.
> 

Ah, good to know. I re-read the kernel coding style and see now
that it only applies to single simple statements.

Better then, since not using braces even for single statements
is something that's error prone IMO, as mentioned before.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

