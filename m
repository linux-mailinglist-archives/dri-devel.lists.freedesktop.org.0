Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A55346E4AA1
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 16:04:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2091310E098;
	Mon, 17 Apr 2023 14:04:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C61710E098
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 14:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681740249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y3L1WEaxjL+XN/Fi5q1N93v3Mce3GL43HmRYXc4owZg=;
 b=MHkpiU17EfMgKsIJmwKozv5DWg4gw4yWXfMmWirkM9wLmfWD9Yf8lJm1qU/Ag7GSSMbOw1
 c6lyQyaZMHhJlxtvctOLESiFVlMYPcRa1vjNwzph+tj8naC9I7a6ooCAKGi879f1UgebKj
 qVzNGJ0JMNeJVVMycVH8L0QTVPOJtSM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-167-VPGhlVP1PzK-hrZOZDeG7Q-1; Mon, 17 Apr 2023 10:04:08 -0400
X-MC-Unique: VPGhlVP1PzK-hrZOZDeG7Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 h26-20020adfa4da000000b002f5d7b791d2so2172915wrb.6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 07:04:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681740247; x=1684332247;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y3L1WEaxjL+XN/Fi5q1N93v3Mce3GL43HmRYXc4owZg=;
 b=eoRVRmqH6ZgePi5WzoV3yTkeEH53EZGEJl9Q8xIgTKJoMEESBzLyzREuVwAtAV5NbY
 1Oq6cvNhsx4OwcDdiexNAJlkB3CLAyikQLBLihNP/aNMdPcnfbEtQpy8oGEwORUXD8Vf
 b7Rr9s8CBB1SYkVrAKujM9O3GjW8K+tRyJrxKVtTxYIp8zOcpx/mh3H28JjyENL788PR
 tfAGvv11B6XF1SRxgsLr7iXsq8As4b1cyiFCBryA9GTdmWb2JfPXyrfPfY2PsiAynKgy
 N7UQs61siCQquxu2biMf2JZKniy9E7bhYwgqbLRkq/6dK0kYN0LnTSARDjJFLZLgfslq
 IN4w==
X-Gm-Message-State: AAQBX9c+IHyQtGr6JixyFLah3JIcAzCkI9K6oq61zMYqSUYO9nTRhOHW
 aSk0ZgTC7dvvjwyerGXWLvP+fB4BSQopE0rxEeaP+O+02D93oS3rWK/9dDhMj/oc4/d2SyAnbIw
 WeOQvwRLuxBgSiaJhkw5Vw+uzhNEv
X-Received: by 2002:a7b:c4c1:0:b0:3ed:ec34:f1 with SMTP id
 g1-20020a7bc4c1000000b003edec3400f1mr10451986wmk.35.1681740246843; 
 Mon, 17 Apr 2023 07:04:06 -0700 (PDT)
X-Google-Smtp-Source: AKy350aghoD/n8llvJ769mcuzAA0ljHtNf706owTECzwTBysWHUv18oXXr2otE3wkIi3nGjQY19nVQ==
X-Received: by 2002:a7b:c4c1:0:b0:3ed:ec34:f1 with SMTP id
 g1-20020a7bc4c1000000b003edec3400f1mr10451965wmk.35.1681740246467; 
 Mon, 17 Apr 2023 07:04:06 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z17-20020adfe551000000b002f7394e7c01sm8282901wrm.104.2023.04.17.07.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 07:04:05 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, linux@armlinux.org.uk,
 airlied@gmail.com, daniel@ffwll.ch
Subject: Re: [PATCH 3/4] drm/armada: Initialize fbdev DRM client
In-Reply-To: <20230330073046.7150-4-tzimmermann@suse.de>
References: <20230330073046.7150-1-tzimmermann@suse.de>
 <20230330073046.7150-4-tzimmermann@suse.de>
Date: Mon, 17 Apr 2023 16:04:05 +0200
Message-ID: <87bkjmehbe.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hello Thomas,

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Initialize the fbdev client in the fbdev code with empty helper
> functions. Also clean up the client. The helpers will later
> implement various functionality of the DRM client. No functional
> changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

