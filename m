Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1734856FF80
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 12:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 324558DB82;
	Mon, 11 Jul 2022 10:51:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D9298DB82
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 10:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657536713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8uFWZvmNxeUCUG4J10cXTXSlmZcaIHVpBO/oH3cNaHQ=;
 b=FwUfooUk9CV6K3QPzCd3eK+C9S+cRwyC1D4KPwYV/eB7fBUqiETOySGEifrvg/m2ZTTPp5
 Nj8VzwS4XbVQ09iDQFdvP9E8JtJYNguHrNwDM74cuAgxb8LsIzLyW7UmTwrmNYiqhGVwCP
 2m7UKqukz2h4JV+eQnazK3uVsAjpLoQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-hmSXNZMLM32R6Jp9-FVdug-1; Mon, 11 Jul 2022 06:51:52 -0400
X-MC-Unique: hmSXNZMLM32R6Jp9-FVdug-1
Received: by mail-wr1-f70.google.com with SMTP id
 j23-20020adfb317000000b0021d7986c07eso522337wrd.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 03:51:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8uFWZvmNxeUCUG4J10cXTXSlmZcaIHVpBO/oH3cNaHQ=;
 b=0nH7+QDwe3R0RAnr9Cw+N3gX342xzmFuh16EQRXmcutuJjKitUdKZRuFJifOxlQnSa
 M5nkY3gHsnhJl2HiU/SmV8am0qprP45PqQ1e89tKZqO+Vj6CN9jKlp1WpHQMWY8lv9AF
 y4MNyo1fzCL5dGJs7TRz3SNIurRpKHl0GNTZD3Ac9vGIS8lAaoK0lR7ULvFvC9L1rI8B
 FxoyvzEwGXbUC6A9RAhsWEz6UKniFWtotO+ntxPbomPtvfMZtwpvIlVgedJA1gIXS607
 5CPkegqpRi++PvViBp4387+zlFoKbTjI/naiembFCaEWfuiXE7omaQsFZXSJbbCxXrNr
 y+rA==
X-Gm-Message-State: AJIora89EMHdCzAX6e3Y99PtOWlp8p1uFNhjSLTjbxS1Sbzrc1L1MICh
 CKlmrP0Lhhp9bijurQv1rgE/cgTUbGI8Za8ciAac2sfolHS4Lfax36zW2bYa6wsRcMEUO8DkORi
 D9xXOkiHKrj90Cn0YEjIPW4IpN5tp
X-Received: by 2002:a5d:4283:0:b0:21d:7ae3:71a3 with SMTP id
 k3-20020a5d4283000000b0021d7ae371a3mr16383208wrq.233.1657536710799; 
 Mon, 11 Jul 2022 03:51:50 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vu6LqD2qjjUVCTi9EWsA19dI4u6WP0tL9irr+0IwqQ8S9FDd2rjpYTsgldXuCbUfGofCXuzQ==
X-Received: by 2002:a5d:4283:0:b0:21d:7ae3:71a3 with SMTP id
 k3-20020a5d4283000000b0021d7ae371a3mr16383189wrq.233.1657536710638; 
 Mon, 11 Jul 2022 03:51:50 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m8-20020a05600c3b0800b003a2ead2c884sm71463wms.13.2022.07.11.03.51.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 03:51:50 -0700 (PDT)
Message-ID: <fc704026-df50-76df-8d55-b16ea1378119@redhat.com>
Date: Mon, 11 Jul 2022 12:51:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 04/11] fbdev/core: Remove
 remove_conflicting_pci_framebuffers()
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org, maxime@cerno.tech
References: <20220707153952.32264-1-tzimmermann@suse.de>
 <20220707153952.32264-5-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220707153952.32264-5-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/7/22 17:39, Thomas Zimmermann wrote:
> Remove remove_conflicting_pci_framebuffers() and implement similar
> functionality in aperture_remove_conflicting_pci_device(), which was
> the only caller. Removes an otherwise unused interface and streamlines
> the aperture helper. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

