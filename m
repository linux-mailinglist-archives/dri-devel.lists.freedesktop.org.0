Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EDA80061F
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 09:44:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C7A10E0B8;
	Fri,  1 Dec 2023 08:44:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 924A710E0B8
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 08:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701420283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E9+lZ9dJzuRJeWqWpmk97tl9Rg+YFKszARGDD2A9j04=;
 b=YAibrntEOm2Xe6Vlut2CiXqGufoRRxWUG7EOrbXp0J95u//EroAALKNntme4ageAxVfHee
 B4R5t7SG/0GUKjJN1wBT127zM8ph7yQp+yJ+R/dHuQTbKmhv+fO4m/4JntG3YBZjasjADP
 5AGIkLYyDi0MOlqSLijhepFVTel01HE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-X6-09eS6N-OoGd0IrbaEZQ-1; Fri, 01 Dec 2023 03:44:42 -0500
X-MC-Unique: X6-09eS6N-OoGd0IrbaEZQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-333127fecf9so1438229f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Dec 2023 00:44:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701420281; x=1702025081;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E9+lZ9dJzuRJeWqWpmk97tl9Rg+YFKszARGDD2A9j04=;
 b=kO+JQTJnsl+JsxzPSy0uJTyFpdpSARXfMg19OvtOG6zqk1PfODfpmPCDEZBKYLivr4
 t0AxcXWnt4C5npI90qUYghDEUgc5QszSXMcoEGepsSBIZrSYsrKgHWZGOFSvZ9sG1t3H
 x1lTHbRRASO+2IEwYpnlasVqn9rBuBiQ1KLgAQ3HgclVhbds5+D1eSAvR7x6VpDT98tu
 5GSInLju5bSAuRvgnoGcI+X1OTSz2CvTf5hh5nIW5ife/U8HH1M1y5s3wMeUEJUn30dh
 TYGU+pqzRjQ4i/K4dk4PMFfZ1RyzFrhk9cKmfYdDAMcP1lcYofWnWeaIFUSnuBYei335
 r0lg==
X-Gm-Message-State: AOJu0Ywzgztz0x4NlI4JAHsHwn9ZrYnhq8+VS4eYLSCAKrPBld+Xg/lI
 BPDx6ynVcxSOu+lAzXNpvVcV9zNJHhDkpH7xTv8X+8tjSPjA855SxR4Sqh1eDIKvDtwGXVAAzVq
 6X8aBSifatodc79du288GfcdinGL7
X-Received: by 2002:a5d:4404:0:b0:333:2aca:b07e with SMTP id
 z4-20020a5d4404000000b003332acab07emr542764wrq.12.1701420281469; 
 Fri, 01 Dec 2023 00:44:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKdO9V0B0zYgMzrduXD36LWz3S73oPmERbDFv76kI/ot9S5klbHgm+qC+otEWZosK2Nthdzg==
X-Received: by 2002:a5d:4404:0:b0:333:2aca:b07e with SMTP id
 z4-20020a5d4404000000b003332acab07emr542756wrq.12.1701420281151; 
 Fri, 01 Dec 2023 00:44:41 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 i9-20020adffc09000000b00333083a20e5sm3589349wrr.113.2023.12.01.00.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 00:44:40 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, pjones@redhat.com
Subject: Re: [PATCH 1/4] fbdev/efifb: Replace references to global
 screen_info by local pointer
In-Reply-To: <20231129155218.3475-2-tzimmermann@suse.de>
References: <20231129155218.3475-1-tzimmermann@suse.de>
 <20231129155218.3475-2-tzimmermann@suse.de>
Date: Fri, 01 Dec 2023 09:44:40 +0100
Message-ID: <87y1eel3bb.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Get the global screen_info's address once and access the data via
> this pointer. Limits the use of global state.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

