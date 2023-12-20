Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80878819EA5
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 13:07:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4097310E553;
	Wed, 20 Dec 2023 12:07:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A6610E330
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 12:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1703074022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EbOwhVS1ctQSdH2sSKDftBcrjpmqhXvm37wmsRPE+1U=;
 b=SRWipTZV9e0rbFN4CnON0T0U5DoBzW+ZVHr4BJqGd+bMmMbAd2SrGyJ6YzJsymgAGiihJW
 ztsQjUcFVPl/bMfevpndyA3l1ynHAmYQRaPs2vns+IARUCC8KKBXEjDmWjQaojY8Mkuwqa
 1BRQQ2g38iGJgiQdIN9DVS6FAuSP3Gk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-103-eItwzIbNPgyj1a3rZmgjIw-1; Wed, 20 Dec 2023 07:07:01 -0500
X-MC-Unique: eItwzIbNPgyj1a3rZmgjIw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-40d2a2a5522so13826255e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 04:07:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703074018; x=1703678818;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EbOwhVS1ctQSdH2sSKDftBcrjpmqhXvm37wmsRPE+1U=;
 b=OT7QEz3vB/GvxKCns4eqzZhZH+dTzk6mwsWB/Och8k+zuCkEU8rfW6v19qCVAjVi2N
 zI9v/BSc3S5N68srCyVOfp7roDOMR94qr5G8DU//T7lgGOOqVQZwtAOZz8FqqVRrJNLX
 wlLKCMGcXJ54qZfswM5YYbZ+/GH+c0k8z8vcv+pfXPJFN2hK266T8AqRWYidDN/OtdYW
 mw8HwaCMu2QeRI9tmdkUpbeOPwxwIzvREkfT5f9RmcEMadRh0lQ9MBKRDgOQ4o5GKBS1
 NTWS6HmQutSq3WmEZ/AU324eiYgSgMlqHuJMBxIf2sGL2npAuO4ArcEVP8ybusUmcjoG
 mopQ==
X-Gm-Message-State: AOJu0YwJx7YmIlUHFyKUnrWuaTB+IMMVdWvoFJWTYuruiax8Y1yALfB6
 bN+ZnHrb3sFWjvjwJGfrvBr7PVvMl+nIs3EA9UkIM+ogJBBi2vElkJ76YsNzqFRSr8jsd/bTBkE
 k5HtNaHqp48ySt3YwiGapKtFk6JXTfv4p0KZl
X-Received: by 2002:a05:600c:4f11:b0:40c:f3d:f31 with SMTP id
 l17-20020a05600c4f1100b0040c0f3d0f31mr7136023wmq.163.1703074018695; 
 Wed, 20 Dec 2023 04:06:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBIxugpHBrjRSIo01FYd4FiSMMdtxTl59PiGMbbg8SDogliNn6YN6Znvfza6bQal3C4SeIPw==
X-Received: by 2002:a05:600c:4f11:b0:40c:f3d:f31 with SMTP id
 l17-20020a05600c4f1100b0040c0f3d0f31mr7136017wmq.163.1703074018350; 
 Wed, 20 Dec 2023 04:06:58 -0800 (PST)
Received: from localhost ([195.166.127.210]) by smtp.gmail.com with ESMTPSA id
 i15-20020a05600c354f00b0040d378510adsm1883028wmq.1.2023.12.20.04.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 04:06:58 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm: Warn when freeing a framebuffer that's still
 on a list
In-Reply-To: <20231211081625.25704-2-ville.syrjala@linux.intel.com>
References: <20231211081625.25704-1-ville.syrjala@linux.intel.com>
 <20231211081625.25704-2-ville.syrjala@linux.intel.com>
Date: Wed, 20 Dec 2023 13:06:57 +0100
Message-ID: <87a5q55b8e.fsf@minerva.mail-host-address-is-not-set>
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ville Syrjala <ville.syrjala@linux.intel.com> writes:

> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Sprinkle some extra WARNs around so that we might catch
> premature framebuffer destruction more readily.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

