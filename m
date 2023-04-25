Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CA96EE5E7
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 18:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A4D10E2D9;
	Tue, 25 Apr 2023 16:39:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC0F410E2D9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 16:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682440748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PNgY2KEcmfsm6cKr2gvXewChYpbqNROx2zrnYrsCFjY=;
 b=eWMF85ayd+Io39IpMYKXSWkHKKTNGlgNzbbhtDOaV4qJOlGGrTfonZqP/wCcaK0R8hX+6T
 aHKu1Wjn7/GazD3tnB0A/DGGp+2q306wmREuKPLoww0WZn85xRBF6+4wkSLjeJnhe7DeY+
 hfirraI3O4XDGJfg2sVxv1bTVg8kACw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-NcZ-INHAOk6PYrwjZNW3zg-1; Tue, 25 Apr 2023 12:38:11 -0400
X-MC-Unique: NcZ-INHAOk6PYrwjZNW3zg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f1749c63c9so21241115e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 09:38:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682440688; x=1685032688;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PNgY2KEcmfsm6cKr2gvXewChYpbqNROx2zrnYrsCFjY=;
 b=Fc798H9Qsaj1PypkSQPgznnVGeMMcKttJkhKnGvOqyWgL/6KwciQjuFRwkNr26MU2b
 MIeWRKd4Zr8wNNe3KwosD/gUHGgpEaWTrBuMas23Cc/SFs//XLQtQXxuoxekn+BJCyRf
 /NbtBRRJtwZN1aFU52BVk8dVtQcf9OlFQofnvwgnCrjTPTqhLC3R3G+x0QLX9QXU9iyy
 ZlUzcizacqGQ3PCLt8bAY5yZzpeFPFrsQD0/+WplzuzM5sadbQlsHvGkE8YztBXHcnIU
 tL/1D/4lguyCTW0RCiV52s8QQK5XCcaPyjviHhnWh/3c5yltfon/+gyxpHi/pAqJVPoC
 vHcg==
X-Gm-Message-State: AAQBX9fV7OgNHAMoE+zH9rNlmZj22+XAJCN1Y7v4K2e7L6AK+flEVFFL
 W0aPJLpQUbHe2EUAJgu3+R70mrNHgCpVSJCHN7rRCfR/b0y33/X104+4vj6dXxWyX1mvCVRxtcs
 AXr1tn9txeV2aBQePOrhnKpawmoZmt1yAezRs
X-Received: by 2002:a7b:c8d9:0:b0:3ed:af6b:7fb3 with SMTP id
 f25-20020a7bc8d9000000b003edaf6b7fb3mr10991658wml.2.1682440688674; 
 Tue, 25 Apr 2023 09:38:08 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y0/bFv3y9BzW+gGztulKEYZt2pDIDd1xyQ0jkfZ5hLeVaSLvS/gxxLfG6RPKXJ0zJIz9OfZA==
X-Received: by 2002:a7b:c8d9:0:b0:3ed:af6b:7fb3 with SMTP id
 f25-20020a7bc8d9000000b003edaf6b7fb3mr10991637wml.2.1682440688351; 
 Tue, 25 Apr 2023 09:38:08 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c10-20020a7bc2aa000000b003f080b2f9f4sm18660386wmk.27.2023.04.25.09.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 09:38:08 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, deller@gmx.de, geert@linux-m68k.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com
Subject: Re: [PATCH 3/6] fbdev: Don't re-validate info->state in fb_ops
 implementations
In-Reply-To: <20230425142846.730-4-tzimmermann@suse.de>
References: <20230425142846.730-1-tzimmermann@suse.de>
 <20230425142846.730-4-tzimmermann@suse.de>
Date: Tue, 25 Apr 2023 18:38:07 +0200
Message-ID: <877ctzj4sw.fsf@minerva.mail-host-address-is-not-set>
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

> The file-op entry points fb_read() and fb_write() verify that
> info->state has been set to FBINFO_STATE_RUNNING. Remove the same
> test from the implementations of struct fb_ops.{fb_read,fb_write}.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

