Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D06AB1C3DF
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 11:57:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D09010E745;
	Wed,  6 Aug 2025 09:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Tnq8VmOQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB96910E745
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 09:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754474220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UnRhCBGz/g5M0sDRDevsbQoDZqubHqeSfzdgXcUdUSU=;
 b=Tnq8VmOQse3Q/kJJOWRiG4ErN2naj+oPJqQfjzEDSrVe7pLZv/u7K2RLDHtKPjeo9k/1wt
 jUjKLoDwTvlhkOknD1dQHkD0q+6KTh0RyC+I6CuUcGj/vsGpfI3cXhvwvBbn5r8jl2381s
 l2rvWTsDlY16fW61qg9fuZCqMhKJRt8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-380-CjdoxXd1OO2GwQYdmfYMSw-1; Wed, 06 Aug 2025 05:56:59 -0400
X-MC-Unique: CjdoxXd1OO2GwQYdmfYMSw-1
X-Mimecast-MFC-AGG-ID: CjdoxXd1OO2GwQYdmfYMSw_1754474218
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3b785aee904so2883438f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Aug 2025 02:56:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754474218; x=1755079018;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UnRhCBGz/g5M0sDRDevsbQoDZqubHqeSfzdgXcUdUSU=;
 b=HSPEUj0iL0mnuUxizHRmx1p6K19+JatNRaCl0qAU+/+SrvNqjI3bfSG5YbkBlYAXad
 GCHqW7clJodHsRIzgtzkHqHMuou5Zjqv/HXCi0M8TUpnrOOgy4WZputdNkZ3oWkE3ESL
 1A7+w3jLExEo0e4ht4lA+vQlceKWY2FdYRPGIGwY4mXws7GkjsYCU/v6qk0jAWrzhohu
 TdS4BW1lkXH/+qMEOlrY44V+B18urw/UK8fix4ulxJpP/C3NDuecmeZ5VVYSzqYTYeeq
 rVclAnwhuIWJfmBnzEX8H01Wgh/yU9yJxWoMj0Lndq6HFeVFexyeADIGh9lywxA0pAuC
 fN1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8EHEOxBaESV6wwKhx38aMrTO69F2AidtxVyZnGPLJN1Z9xBy9wgNeTPFPBv3H/JkNiYai20sbTJU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yws7YASSSfz0Xpki06s+qZoPZxiCuoLnhsVGpUDWSgM8AA6RUV2
 4FkKJZAiGsC6cnZKaei2Dv4+V5LB/FwQjC0NtmUuXnoja/3MlajEsNRO+my4PsGpmNlJbxPshl+
 NIlXB1RZ9bgx31/1ZzJLs0scjyVvbUBdH0x8dA66XRWnv/o5a8RRbUoU6QsTdmyY/iqaoKp40pq
 q2Pjk/gTmpge3w08ehsiTbYqY/aJ9gDtERIoPDjJS4cxOJ
X-Gm-Gg: ASbGnct9kFdD+sRhBnfxfamVWUawW1EMFRP9svfMbcX/XtfRAwdkMi0tkRcj5KIGrNH
 Ae9C8/xk+iF1h9KCv/GMIYZy7yb5EyEZrrEdSI0QO93dxRuwBRcprmIX/ABhi4VawXdcwEmapCL
 4ed5lD3zbZh6JmgOjLPMjNtQ==
X-Received: by 2002:a5d:5849:0:b0:3b7:92ec:68ec with SMTP id
 ffacd0b85a97d-3b8f41bb8c4mr1730016f8f.14.1754474218382; 
 Wed, 06 Aug 2025 02:56:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmkIlZiBIO0pxwuhv5ZEuhlp3NbgCJIQMCznSJgwMIdEJJHMlTE317CHbrVdWmT1WXyuHGPX1pWe6egu5BZuE=
X-Received: by 2002:a5d:5849:0:b0:3b7:92ec:68ec with SMTP id
 ffacd0b85a97d-3b8f41bb8c4mr1729994f8f.14.1754474217980; Wed, 06 Aug 2025
 02:56:57 -0700 (PDT)
MIME-Version: 1.0
References: <CACTEcX6oXBot1VBApOyKVMVXsAN9BsvQMLa8J0iKpNeB-eLttQ@mail.gmail.com>
 <642d439ea1be8e48ee5c47fd3921a786452fb931@intel.com>
 <CACTEcX5Y3PNXNkhnK1dGFe+k3sigOZNpj66KKGAS9XeHqRu35w@mail.gmail.com>
 <0b15e33603a46f6cc7ad7d09a156044f11367169@intel.com>
 <CACTEcX47bUd2tp=LYkQnhK29Js=vLN0JfXL8Aq6mOFBVYumpzQ@mail.gmail.com>
 <CABgObfZKKeqMrAUyS8CB4ARkW_8Z9QREgpgYcq2jxoQ9ppS6MA@mail.gmail.com>
 <CACTEcX7oa+Shj=uYiRMoWpng+RZXDeQrOa-VTRmzVVtXJMCgLQ@mail.gmail.com>
 <CACTEcX7hsRkzYEBg4pQd5s36p_ZXJM=dtxSGmBjfkt5sWrXP8g@mail.gmail.com>
In-Reply-To: <CACTEcX7hsRkzYEBg4pQd5s36p_ZXJM=dtxSGmBjfkt5sWrXP8g@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 6 Aug 2025 11:56:45 +0200
X-Gm-Features: Ac12FXxUD7IfHIB3LF4bE0A3e_MF7VVLU9X5HEvxDOG2SUB9XsZW8ohxIfMVMqA
Message-ID: <CABgObfZagg8_w100tEnbU0_adUWPcnQYzxy8aAyUqVASjxWujQ@mail.gmail.com>
Subject: Re: [REGRESSION] tty lockup and WWAN loss after hibernate/suspend in
 6.8+ on ThinkPad X1 Carbon Gen 10
To: Andy Mindful <andy.mindful@gmail.com>
Cc: regressions@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-acpi@vger.kernel.org, 
 rafael@kernel.org, ville.syrjala@linux.intel.com, tglx@linutronix.de, 
 Christian Brauner <brauner@kernel.org>, Jani Nikula <jani.nikula@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dpSIkX-L066PJxxOdCB4lX8VAUQSRDEve9xgkDvVbAI_1754474218
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 6, 2025 at 10:40=E2=80=AFAM Andy Mindful <andy.mindful@gmail.co=
m> wrote:
>
> Hello,
>
> Can somebody advise how to properly bisect issues in linux-stable
> repository between v6.7.11 to v6.8-rc1 tags?

If you can test 6.7 and bisect between 6.7 and 6.8-rc1 that would be
the easiest.

Paolo

