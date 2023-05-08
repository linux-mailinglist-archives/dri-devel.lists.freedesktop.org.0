Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFBE6FB30C
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 16:36:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B161710E2D5;
	Mon,  8 May 2023 14:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DEBA10E2B3
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 14:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683556566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PDvLE6MOxt+MLFOjl1npkCWLcrid4BACl31i+SxcR50=;
 b=ZnbV0H675qT1X+gRKVEzLDSPGzRpZ0SI76Kszzx4ZLvOUWh5cWt8v9aruFnI/aViLMPSnB
 pd3/0WKag4socMwuA3pDugeN5+O/jqy15mT9kJpt+CjovGwovRdiC1BvXloCDCBbnX+IZZ
 BMJX1Oy/PqGNFyCPa3LhjXPR1uJFrII=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-efISzGDFPEuCNXA2LVQVaQ-1; Mon, 08 May 2023 10:36:05 -0400
X-MC-Unique: efISzGDFPEuCNXA2LVQVaQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3078b9943d6so696443f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 May 2023 07:36:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683556564; x=1686148564;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PDvLE6MOxt+MLFOjl1npkCWLcrid4BACl31i+SxcR50=;
 b=VwaTOb4g7PEZzvmplRXBVSkbJ49dnAAndZWi11H7NF4466+aQmvlaC926tkn7HYJu1
 N1ModviTdU8NIOQSFFKxdjRDAPcywYT/TkHC1E1ob38tO6S07OULxlX+pSH/wvK82I7q
 L9nYj/z4qQtMVNk/CFOOjpEBUHnxuXsvzgeE3KX1fZs58ZlqVXTbRQ1x6/ltrQtDQTZW
 UdCZse3r5yLVg8dekXFbDaYB2G9q4qjoqXJofaR4uqhfoZuuA4vQ0hSgMWfP46OPqDvg
 UrQBLq2zYcQAF589cLDHrr7hvRGPAj7MBKXB3tBU3Viv9z/lb4wSxNTIE28Gdd4FU5fd
 W+CQ==
X-Gm-Message-State: AC+VfDxZsUkZ79QcG87x8PtKD3bPbZxxAJRGlZCZzCTCW7eVC+nws6eu
 iXz9BTh3SiMxXj9pi4Tcc2gyj355KNToRbu9OxPi/QREC+OnLIGLyi/iRxrcTqpJwKQtbdxlNN7
 eJkulauL4wuIQTcNGMWiA1fkF3MLJ
X-Received: by 2002:a5d:4101:0:b0:2f4:9956:e828 with SMTP id
 l1-20020a5d4101000000b002f49956e828mr8240003wrp.18.1683556564296; 
 Mon, 08 May 2023 07:36:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5BHsItldOQxTp0lOsgO3/oTDavJtW0OS2IKfDkOXRYE6jBHhh8FTUyDks7CRuc0j2GTPv27g==
X-Received: by 2002:a5d:4101:0:b0:2f4:9956:e828 with SMTP id
 l1-20020a5d4101000000b002f49956e828mr8239990wrp.18.1683556564030; 
 Mon, 08 May 2023 07:36:04 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 w3-20020a05600018c300b002fe96f0b3acsm11624229wrq.63.2023.05.08.07.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 May 2023 07:36:03 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: =?utf-8?Q?Ma=C3=ADra?= Canal <mairacanal@riseup.net>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rodrigo Siqueira
 <rodrigosiqueiramelo@gmail.com>, Melissa Wen <mwen@igalia.com>, Haneen
 Mohammed <hamohammed.sa@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Maira to VKMS maintainers
In-Reply-To: <20230508141038.327160-1-mairacanal@riseup.net>
References: <20230508141038.327160-1-mairacanal@riseup.net>
Date: Mon, 08 May 2023 16:36:02 +0200
Message-ID: <87h6smx54d.fsf@minerva.mail-host-address-is-not-set>
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
Cc: =?utf-8?Q?Ma=C3=ADra?= Canal <mairacanal@riseup.net>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ma=C3=ADra Canal <mairacanal@riseup.net> writes:

> I've been contributing to VKMS with improvements, reviews, testing and
> debugging. Therefore, add myself as a co-maintainer of the VKMS driver.
>
> Signed-off-by: Ma=C3=ADra Canal <mairacanal@riseup.net>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

