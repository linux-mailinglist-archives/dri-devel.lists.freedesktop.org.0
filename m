Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC43F3D7E71
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 21:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 575AC6E4B6;
	Tue, 27 Jul 2021 19:21:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE9B6E4DD
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 19:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627413688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uGKrqOctliwjS0X4Sldrr5gAehx34qSkobccEFs4N28=;
 b=Th2dcNera7r/ZbDALWiGquRDPT0KXEOH+JilueOzjbTd7kOcfZgmCyLwqI/zp80GCPuiGV
 TxTtyBZFsapepo//NwY1HajOi9D8m7C/a7QAWrcbfOjbzLesvDu9sV0nuqheUkGfBmPbnK
 tWnPmr45civoMEHui2nyj8WwyJ1hsCQ=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-ZjdFNPyAOgC1SiI_1qh1jQ-1; Tue, 27 Jul 2021 15:21:26 -0400
X-MC-Unique: ZjdFNPyAOgC1SiI_1qh1jQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 e19-20020ac84b530000b0290251f0b91196so6872617qts.14
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 12:21:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=uGKrqOctliwjS0X4Sldrr5gAehx34qSkobccEFs4N28=;
 b=gXFLSkj/hf7ItCJd7qwEOoqV5XaNsl2zjwpWVrqvU9fws8++BWpP61LcccLs8DFZTo
 EeHdxPzNnJLZdAirOgmxjkPYnjcgKExv7pXmykdfgLA2q3mStgwLzfjJ0pgqFubXVytW
 U2i++n8ZSCC+waR2Cm3uK/cdzg1IB9mffvX4ZgVfrimaYqHdfnYTDrni4rIkhdF2IEDC
 VMvf05IWYvlIOFdog1aoAaiCq0QKMMvOqQhry9/R07ZisAjvWwS6J4YcJfkuJ2kPIOPH
 342v9SxyQci3ZvoYGbrTGUpd+RnJijmkovpMWcvD0kEZJXoO6s5rB8eLFA8llQot1JiH
 AVxA==
X-Gm-Message-State: AOAM531DCXHTadWZ1RdY0EktAmSedSh/Fq57hyLaXsgXSU0ghEJh97rh
 tcUSXsnEJbtaZ8krTTzzAaT2/ZBgdcfn25QHw7lSH3jgD8emj6oL9a4L2AFCVCfgdx4MZ4kE15F
 c9QJ76wifOFjwsqUWu+4GSHndMeqX
X-Received: by 2002:a05:620a:13a1:: with SMTP id
 m1mr22845973qki.91.1627413686311; 
 Tue, 27 Jul 2021 12:21:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmGZgQ7NnlCRlYkJ8czqKlAtNQKQ4f+q3WwLktTQbZsVbgcLLxWZj0DA7sLlD/FFLHp/3Lpw==
X-Received: by 2002:a05:620a:13a1:: with SMTP id
 m1mr22845940qki.91.1627413686080; 
 Tue, 27 Jul 2021 12:21:26 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id r16sm2124371qke.73.2021.07.27.12.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 12:21:25 -0700 (PDT)
Message-ID: <79c5a60fc189261b7a9ef611acd126a41f921593.camel@redhat.com>
Subject: Re: [PATCH v3] drm/dp_mst: Fix return code on sideband message failure
From: Lyude Paul <lyude@redhat.com>
To: khsieh@codeaurora.org
Date: Tue, 27 Jul 2021 15:21:23 -0400
In-Reply-To: <d9ec812b4be57e32246735ca2f5e9560@codeaurora.org>
References: <1625585434-9562-1-git-send-email-khsieh@codeaurora.org>
 <87zguy7c5a.fsf@intel.com>
 <a514c19f712a6feeddf854dc17cb8eb5@codeaurora.org>
 <2da3949fa3504592da42c9d01dc060691c6a8b8b.camel@redhat.com>
 <d9ec812b4be57e32246735ca2f5e9560@codeaurora.org>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: rnayak@codeaurora.org, tzimmermann@suse.de, airlied@linux.ie,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, swboyd@chromium.org,
 aravindh@codeaurora.org, sean@poorly.run, rsubbia@codeaurora.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2021-07-22 at 15:28 -0700, khsieh@codeaurora.org wrote:
> 
> It looks like this patch is good to go (mainlined).
> Anything needed from me to do?
> Thanks,

Do you have access for pushing this patch? If not let me know and I can go
ahead and push it to drm-misc-next for you.

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

