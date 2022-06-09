Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B789D5456B1
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 23:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B398F10E3CD;
	Thu,  9 Jun 2022 21:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E574C10E221
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 21:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654811060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B1pdgF7AnLu0fVQCtydwApAx3WZNtJh5bsvpbPEg0J0=;
 b=eS6SQpz+ywcjgd0sAI/vvEs9NWMWx9wXBpp80hz9vMvuJuRk8hfr8301T5ZfjmOubltLYv
 piL8dgK11d04i958czQRnfjpe8qFa6iidTGjfrxkCP+7YzLdB6zMX4OeAoIh+lz8ntZSiw
 16vGo2FNkBYAPP41uuPQznrSLDJmo3o=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-365-Lt2Pm1MrOdWw23UrNK43qQ-1; Thu, 09 Jun 2022 17:44:19 -0400
X-MC-Unique: Lt2Pm1MrOdWw23UrNK43qQ-1
Received: by mail-il1-f197.google.com with SMTP id
 a2-20020a923302000000b002d1ad5053feso18454000ilf.17
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jun 2022 14:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=B1pdgF7AnLu0fVQCtydwApAx3WZNtJh5bsvpbPEg0J0=;
 b=b2ScYCCkj7woXN85jr2n6Vr02cih4f1/KDxXgMbqucPnES5Ox3X93kSFKa5GwGCyEV
 L73BJLrX4B9yzUQFuk/nSXKAqZzAuTLHUtxDKQaSDxKW1CiJqbFCjhyZbPYRAIK6i8mv
 5R/06omvfBpO3Zpqhj0qEee+zTLYWgvOkYr0UPXDKkl7qVe6KQjsJ7dhMc5U12N4M4SQ
 nZLIHzsGkkkpNAzizK0zTpFHoFcYX0yDlG6nYhgePe/dBIj4dKqnIZbIfg/CZb6UPv0S
 hnT3HC1Bumo5lsrZG7zqyE1ujY0sQqrU+jkEbLgFd5qmt5UbcIIlG3F0Qn+GfsNFK32n
 843Q==
X-Gm-Message-State: AOAM530oVZEJP6SK+Mn6QTJxEpyv1Hn5fNuSbD5hf+kUtD8UGMpIL+hn
 tlh0Qao8f6gPG55IbDgo8pYtC5a3f5CslGAUE53BWZW7SLjcarJtccEsTRx71jYxZY961LS8NQO
 OzOH0MIr/kF0QNcCuHreQ65nKryhB
X-Received: by 2002:a05:6e02:1e09:b0:2d1:97ca:a241 with SMTP id
 g9-20020a056e021e0900b002d197caa241mr23122503ila.238.1654811059000; 
 Thu, 09 Jun 2022 14:44:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDscdO/W1/4no+7jY69FGERgzQXiRmYHQK/m9EuLA1t1bvx3ksqGSpUr0meCCLPhXF9woEYQ==
X-Received: by 2002:a05:6e02:1e09:b0:2d1:97ca:a241 with SMTP id
 g9-20020a056e021e0900b002d197caa241mr23122496ila.238.1654811058769; 
 Thu, 09 Jun 2022 14:44:18 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 n29-20020a02711d000000b00331a94f2b04sm5740155jac.105.2022.06.09.14.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 14:44:18 -0700 (PDT)
Date: Thu, 9 Jun 2022 15:44:16 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/2] vfio/pci: Remove console drivers
Message-ID: <20220609154416.676b1068.alex.williamson@redhat.com>
In-Reply-To: <20220609154102.5cb1d3ca.alex.williamson@redhat.com>
References: <165453797543.3592816.6381793341352595461.stgit@omen>
 <165453800875.3592816.12944011921352366695.stgit@omen>
 <0c45183c-cdb8-4578-e346-bc4855be038f@suse.de>
 <20220608080432.45282f0b.alex.williamson@redhat.com>
 <01c74525-38b7-1e00-51ba-7cd793439f03@suse.de>
 <20220609154102.5cb1d3ca.alex.williamson@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Cc: kvm@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 9 Jun 2022 15:41:02 -0600
Alex Williamson <alex.williamson@redhat.com> wrote:

> On Thu, 9 Jun 2022 11:13:22 +0200
> Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > 
> > Please have a look at the attached patch. It moves the aperture helpers 
> > to a location common to the various possible users (DRM, fbdev, vfio). 
> > The DRM interfaces remain untouched for now.  The patch should provide 
> > what you need in vfio and also serve our future use cases for graphics 
> > drivers. If possible, please create your patch on top of it.  
> 
> Looks good to me, this of course makes the vfio change quite trivial.
> One change I'd request:
> 
> diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfig
> index 40c50fa2dd70..7f3c44e1538b 100644
> --- a/drivers/video/console/Kconfig
> +++ b/drivers/video/console/Kconfig
> @@ -10,6 +10,7 @@ config VGA_CONSOLE
>  	depends on !4xx && !PPC_8xx && !SPARC && !M68K && !PARISC &&  !SUPERH && \
>  		(!ARM || ARCH_FOOTBRIDGE || ARCH_INTEGRATOR || ARCH_NETWINDER) && \
>  		!ARM64 && !ARC && !MICROBLAZE && !OPENRISC && !S390 && !UML
> +	select APERTURE_HELPERS if (DRM || FB || VFIO_PCI)
>  	default y
>  	help
>  	  Saying Y here will allow you to use Linux in text mode through a
> 
> This should be VFIO_PCI_CORE.  Thanks,

Also, whatever tree this lands in, I'd appreciate a topic branch being
made available so I can more easily get the vfio change in on the same
release.  Thanks,

Alex

