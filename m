Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B402679180E
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 15:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE6CD10E358;
	Mon,  4 Sep 2023 13:27:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC11910E132
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 13:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693834034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zxZkq0it8hCbAJaaXiECPzcax9Qu561b49DP/zFJ1B0=;
 b=fbwzf9isn9SbicqyU2JGiv1r1RDnt6L40EAr7sOkX7fsgDRbEAhBnCkvHQcTa3uxgRzFPy
 qpz81JiRDiE9ijPG5QMpqezsSYSQRlVIi2UaS+23+1DGs4UlzeNjt7pPgtcnLfRDju2kph
 HIJiVzkUIFbZ9baK6wiBAbJxoKJsFPs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-2AJOwdRbNJGkIEZjNj1PAA-1; Mon, 04 Sep 2023 09:27:10 -0400
X-MC-Unique: 2AJOwdRbNJGkIEZjNj1PAA-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-317d5b38194so643030f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Sep 2023 06:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693834029; x=1694438829;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zxZkq0it8hCbAJaaXiECPzcax9Qu561b49DP/zFJ1B0=;
 b=V+T6bKV7ei0dT0kbbs0g53GwdvJR+gATpoE/lq3qWQ3QVCNsD9psEsFVPGSPDln4d0
 rbealyNwDLpqk/KEuE12wxL0gcUi+RQUVRDnLwsWrFK+6s4I8iVFALnZr85gFRKFNoCX
 gSYPjqS+6CFvDlwnDPwZGq4N/0n+ibEN25CTqiaubaGJ55OoX1IpL7CBwnry+vrO32qz
 R6C06dSlQwWvxWpmzOh+7hfler1la4Jc+uNbatv5FgSYNsZt+1q6eOaYoFXB9jIWbYPe
 dHAvQt52klgZeVhNY4lXvHutPdFs2b8JDvUTGgRBaCPqwoGZ0Vp/pcJxTbQZ/g3J3C6+
 rQKA==
X-Gm-Message-State: AOJu0YyfCyiLyKloqIeM8v7nUYDLkwcJR9+OyLsCmbcZlh08Yt6FEe5Q
 mTCU+L4gwtSydPgn8UDPqT+FVKrtHnMLpt7rgedBgKpmqWMC3NOq1ZseECYbnx+f5tP1B+2q19o
 +Uqp9ZmTPXOUmszTk1Pw4vf2lylsZ
X-Received: by 2002:a5d:4612:0:b0:317:ce01:fe99 with SMTP id
 t18-20020a5d4612000000b00317ce01fe99mr7234099wrq.9.1693834029681; 
 Mon, 04 Sep 2023 06:27:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaqwNGWlc6zhQO+ObluvLtHBcvGlX5RhgjUyBHLBy+K84UjEg1PZVnv6fvBEAk50QZ/mL+mA==
X-Received: by 2002:a5d:4612:0:b0:317:ce01:fe99 with SMTP id
 t18-20020a5d4612000000b00317ce01fe99mr7234089wrq.9.1693834029373; 
 Mon, 04 Sep 2023 06:27:09 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 y1-20020adff6c1000000b00317a29af4b2sm14399476wrp.68.2023.09.04.06.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Sep 2023 06:27:09 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org
Subject: Re: [PATCH 6/8] hid/picolcd: Use fb_ops helpers for deferred I/O
In-Reply-To: <20230828132131.29295-7-tzimmermann@suse.de>
References: <20230828132131.29295-1-tzimmermann@suse.de>
 <20230828132131.29295-7-tzimmermann@suse.de>
Date: Mon, 04 Sep 2023 15:27:08 +0200
Message-ID: <87a5u2cbmb.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 linux-staging@lists.linux.dev, linux-hyperv@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Bruno =?utf-8?Q?Pr=C3=A9mont?= <bonbons@linux-vserver.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-input@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Generate callback functions for struct fb_ops with the fbdev macro
> FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS(). Initialize struct fb_ops to
> the generated functions with an fbdev initializer macro.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jiri Kosina <jikos@kernel.org>
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Cc: "Bruno Pr=C3=A9mont" <bonbons@linux-vserver.org>
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

