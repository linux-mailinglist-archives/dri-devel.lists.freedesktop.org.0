Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5908796988E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 11:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C0310E44C;
	Tue,  3 Sep 2024 09:17:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="a6JFqxfP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12CF310E44C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 09:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725355062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d9X1NNLzucsrIUJA/W+nkx3jW6oIqsnKng1xNjblM64=;
 b=a6JFqxfPzFXBAJ6f601AKSO6d2x7GnFWnevFRNupPWw4MLPuSJ37QCXSBtX2R07XyYSKib
 YqTa/rLHU1OEhr+RADvWcq1FUVUNZUUBupSSCyuDzlOZ+RMAebAonXanle+g274unNu6xp
 wHhU270BVolF7eSqlJxznsAGu3B/Cjg=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-HnkCzN3fOrW5h6QoiVgoeg-1; Tue, 03 Sep 2024 05:17:41 -0400
X-MC-Unique: HnkCzN3fOrW5h6QoiVgoeg-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-5344b7df784so5638144e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 02:17:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725355060; x=1725959860;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d9X1NNLzucsrIUJA/W+nkx3jW6oIqsnKng1xNjblM64=;
 b=a3FYzhw/1KKZFWD3RQZ6mFpKb5vughm6DyPpdQ9zefPA6HkLZ/cUGyjbB2tXum5OmB
 755dZcYV3rX9kHc2TDPKVpGHG09uJx5rqUSM1EGG3v1ddwQxgY9sZBZpuPzwHRv0BmR4
 YyeyPLE9hfB6+zjqwwxRGIqP5gEBwDCWTCS/X8tH4rN3AUIR0oHzynaogxkr8iM3ZCoR
 kgczGddhNMajEo1g42ujiwBCVwvMJUZJeqQjIXuJJCAyHWjmqn4DoFuH3EiNYBngIvjD
 UK00X2HMDraK4KTVoMlcBHF0AlmOOoZCI3TyEh8CtITF4RY2LutOs4sEOKSnWnv17Lko
 l62g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWbkdjTO5acNK8zmq+i9zu1APgcDR/vUdXZDg89HWiqLPYSLs25AlNfQoL/Kc4RouhNtifWnu2vpU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkOY7ObuGJhmWC7RNel5JKSnE3V+OpZo1DowjrKiVS+QGgyuuq
 AY/xkhZlM1gZzPy2rsN8kp/tQGo6O2+KqQd/6sbmDxYFsPkF00Mct2I+TqMsPKeaqRez86IYSqt
 Xi/lRx5/sN8o8HXc8ie3jcPu/d7n3stzSDnz6eqQTGCmaKkdcGeepzWFn4t2i6GBypw==
X-Received: by 2002:a05:6512:1328:b0:52e:7656:a0f4 with SMTP id
 2adb3069b0e04-53546b93f39mr8985508e87.41.1725355059625; 
 Tue, 03 Sep 2024 02:17:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3xeKyziMqcDCx9+tKLN9bJxYrhVG6uCV34wc0/n7HkAIUcH0MBCdLafl7DwaQE1ysW+KWKQ==
X-Received: by 2002:a05:6512:1328:b0:52e:7656:a0f4 with SMTP id
 2adb3069b0e04-53546b93f39mr8985480e87.41.1725355059058; 
 Tue, 03 Sep 2024 02:17:39 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bacaac810sm183985045e9.33.2024.09.03.02.17.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 02:17:38 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>,
 neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Cc: quic_jesszhan@quicinc.com, skhan@linuxfoundation.org,
 rbmarliere@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel: hx83112a: Switch to wrapped mipi_dsi functions
In-Reply-To: <20240902170153.34512-1-abhishektamboli9@gmail.com>
References: <20240902170153.34512-1-abhishektamboli9@gmail.com>
Date: Tue, 03 Sep 2024 11:17:37 +0200
Message-ID: <87plplgkpa.fsf@minerva.mail-host-address-is-not-set>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Abhishek Tamboli <abhishektamboli9@gmail.com> writes:

Hello Abhishek

> Use the new mipi_dsi_*_multi wrapped function in hx83112a_on
> and hx83112a_disable function.
>

IMO commit messages should explain why the change is needed and
not just what the patch is changing (for this one can just look
at the diffstat).

> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> ---

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

