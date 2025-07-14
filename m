Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DC1B044CE
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 17:54:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A6F110E603;
	Mon, 14 Jul 2025 15:54:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YXbyWnld";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D7710E567
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 15:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752508488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zOG1Nvo/l+gwKO8BFDZuLd2b0R76dEBumOlOk4xJ6DU=;
 b=YXbyWnldPcNIgABrf1MxIdvSzPQv+Z+/u97ukSkhOZxfXM4hMg1IbEv06wp6o5EXlRANzW
 P0jNv6c6NAGrF5abmVYPgrOm0qNkUEO79bpnQmPYXQtuaJ0ANYIbAUY/d50DBFtc1IbD/e
 pClwli+tMbHvSOsp6To564V3dnFYeDs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-VLW_43PfOFuH3FQFIz7wIQ-1; Mon, 14 Jul 2025 11:54:46 -0400
X-MC-Unique: VLW_43PfOFuH3FQFIz7wIQ-1
X-Mimecast-MFC-AGG-ID: VLW_43PfOFuH3FQFIz7wIQ_1752508485
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-451d30992bcso34908995e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 08:54:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752508485; x=1753113285;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zOG1Nvo/l+gwKO8BFDZuLd2b0R76dEBumOlOk4xJ6DU=;
 b=L6S72aj+6KD6VTbXnCxUxKdPv3ZMPKTtUKPSsDqyqjKCPb1Bsu7p4kirtx2JMymGUH
 S7xSpFxCYBiYL3qHIn37ggvoHZf3EWv0ja1vHAwYPsdHarX0Uyvbj44uTOY4QfLWrZFa
 rOLwU3ptvO+A18ANF56ffGs/lYoZbxTtTsrFcZlOcdztJZByz16w/ToaN2idN5y+zEBl
 s7lwL2DEKicOEOn9Gj9fysbnyA7Wyev4k/VJGA2mrwTS1PhcQZznL6gASFmfeKsLeC6Z
 7ewiUC5aSU4cbi9h+MHnpPsl20gZ3/F4r79rpjyHt2+ABa7a14ifQv4hgBE5UBixCaZ9
 RD+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0j4fBpXM6u7g7eVuT2fhW7HZX7/ESv9083qWYd2YSi+n3wwFU9Cct/BfjgJ6lkHP/Q1nl8Gx0SUA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9VgldGw2tYplhUWS/n1uQmH2BMBryHyvzz+4etSw0dIME7Ti7
 EJ8CSajqzEPCbZnrXHVLcpYzXTUc5GNjYcO1Z2I51b//symRIcHdoR6x2CNc7GsJYCLe4i2Sxgg
 Q2S/3LGZ6FVQ4ny7hkIC0VLcwn6KkLFW6m0Z5BUibEZXuTbtPVtebD4VhAWD1dNZVgQtSVQ==
X-Gm-Gg: ASbGncu0nVw145uwPspFop9K454BwINVXe7nbYY8IUeP3sfKaJGvt7AGGiLLRtaFXS2
 65dsMKL/gArwbEtdI+HRdzMYoL2trSiiT1OTlWQDGmoEahmFnW+fpewUaJcCVKtacTw7/JCRJBF
 PC4d1FWFpk1svQ1eBStR++I8nNj/tmahjim0Xii5+JW3I52EAMwZ6cCY+kOHh8jfKL+3XGeYTT6
 YtpNouR/y1tnXvpnxIc5MuN42G4C2VZNyYItd/8S998mtkrKlqnuZukkmp/R7S5YaWaySDAdfSf
 loC+VMU612feS9bJInvHdSrQwwup6b/6ArXd5fesf5i2PHLc/TxFqXgCHq1XisoY+A==
X-Received: by 2002:a05:6000:2707:b0:3b5:f8d5:5dba with SMTP id
 ffacd0b85a97d-3b5f8d55e64mr4732085f8f.30.1752508485440; 
 Mon, 14 Jul 2025 08:54:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGz92D4MS71muOuG5qTgK18jL+PvOXMZCtPLjCp6/q9A5nOHQ2DyRXHcgTNMlTfI+AggOmBA==
X-Received: by 2002:a05:6000:2707:b0:3b5:f8d5:5dba with SMTP id
 ffacd0b85a97d-3b5f8d55e64mr4732073f8f.30.1752508485008; 
 Mon, 14 Jul 2025 08:54:45 -0700 (PDT)
Received: from localhost ([89.128.88.54]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454d5103c2asm173094775e9.33.2025.07.14.08.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 08:54:44 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: linux-kernel@vger.kernel.org, ipedrosa@redhat.com, David Airlie
 <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/5] drm/sitronix/st7571-i2c: Log probe deferral
 cause for GPIO get failure
In-Reply-To: <aHTyTsFuakcQsEm7@gmail.com>
References: <20250714104421.323753-1-javierm@redhat.com>
 <20250714104421.323753-3-javierm@redhat.com> <aHTyTsFuakcQsEm7@gmail.com>
Date: Mon, 14 Jul 2025 17:54:43 +0200
Message-ID: <874ive22f0.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EjyvaW3EwR7SfyfmJQi7gtML2b8zCc8d1vvzFb6J2Yc_1752508485
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Marcus Folkesson <marcus.folkesson@gmail.com> writes:

> On Mon, Jul 14, 2025 at 12:44:01PM +0200, Javier Martinez Canillas wrote:
>> The driver already uses the dev_err_probe() helper (that only prints error
>> messages for the -EPROBE_DEFER case) when fails to get any other resource.
>> 
>> Also do the same when it fails to obtain the rest GPIO.
> reset GPIO

Ups, I'll fix the typo when applying the patches.

>> 
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>
> Reviewed-by: Marcus Folkesson <marcus.folkesson@gmail.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

