Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDB1A84457
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 15:14:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B83B10E9B5;
	Thu, 10 Apr 2025 13:14:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="a6ioDff5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B391410E9AC
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 13:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744290874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5CWh61VoBeWDkhfINVEgBQUPREI3OeT7vB60AjBLh4k=;
 b=a6ioDff5p4pJ0jNuu8AEUWBsdjKDw3dn9/4up6+cCx/nBCHw0K48EYWD0oMdV3koStCEy1
 JBYHJ67yxRwW8+xOkXPN3jL1IYJXwmYfWCQ2tiK84Ter8Biroov/PlZreiA0fFxqzMMXd5
 /J7qhcUWYjwpC92f6DIVk2jXfaMaXTU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-302-uHYKO4sYNUiaXaUyYJphhg-1; Thu, 10 Apr 2025 09:14:33 -0400
X-MC-Unique: uHYKO4sYNUiaXaUyYJphhg-1
X-Mimecast-MFC-AGG-ID: uHYKO4sYNUiaXaUyYJphhg_1744290872
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43ceb011ea5so5423455e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 06:14:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744290872; x=1744895672;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5CWh61VoBeWDkhfINVEgBQUPREI3OeT7vB60AjBLh4k=;
 b=jVptKk+il2m8lAiF9IBvzlSTioPrUMmgiboU32GNDDylf8N9SMmfyr4d4LfHnXAoid
 b8XEywtKKlrlF2UXi7IfmnykYTMvvS550O0ozmPWEuX+cYcODbymWSkgP+2bSr2Wyew+
 wGJBMqwwyi6CO28Wz3WdbhdQ52Za8M6B++g73/903vDGArZfB2MLIVQNaz2yKFXzjWeL
 9WDZHF53eg7SoWLRKKyqlFP+OkDyK0hQJWACCVs5vZcKKL9lxZrtNKlO3U7JTCk7Fyy1
 KHYa7mZbvO3cHMaDPF13Q+XVs7pbVJj8xVtFguExquzJTiL0sO+EIvUOGRljo1vJaPpd
 BfOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6BzDroDr0pMgLHfEp0PxjiYg3LLuiTwo3rgo2xFFuSa03JhoFUYJzxbJel158pj1JNWA6+Z03eCM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjrxtF4OnUw/NvRodVl4Bs9ofXeS+cPPi2hvhFNNOdHAPzntZW
 mTnTadqeeyQ0A2l6Hllm+4BkxeewOMxNrKmAG91n555+xepQVKVeUpRsR4pBjBaf743GaUEgIKJ
 YCXXzbdvt5zAQbf7zB+duK7umg4AGvF4R+MfWFDFzSnnZ1E5pCvxsTreBYaU35UK0Zg==
X-Gm-Gg: ASbGncuvf7ljSpez7fOoxIwovsmfTAwxOhpR9Rbgzhh+I1Sq4KN2X9u5g7guDTlIqHb
 o5T19WM4Z6LriSh5NZaPxvNUn2Tx6PVE0pznQB6bMMY4YrB81mRFPxGx49zbrKp/UKzK/P99yp0
 nRMwkm9PhtoNeZRs3rwtHgp6W/SHVw5U/Ns+FV0tSdRpeXQ9095kHx6YGIleSWnbSJ1mKQdbfg6
 FCSdKVIz382nprLTMK2e7xRpgJrTx7HmpDtAeAtp8y86xdNkV9kl6sLZ+tCv82qPAcBMKiDrjhV
 l6/Q9A==
X-Received: by 2002:a05:600c:674a:b0:43c:eeee:b70a with SMTP id
 5b1f17b1804b1-43f2d97bc34mr26435615e9.22.1744290871752; 
 Thu, 10 Apr 2025 06:14:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEV4Lyb/tgfnVcyyFGflhKQfwEnIUsEBhqCrwWvjfkvUDgCHowyRpN3WF1pM6qN8aW55vrjDw==
X-Received: by 2002:a05:600c:674a:b0:43c:eeee:b70a with SMTP id
 5b1f17b1804b1-43f2d97bc34mr26435315e9.22.1744290871261; 
 Thu, 10 Apr 2025 06:14:31 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f207aeaccsm53922205e9.33.2025.04.10.06.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 06:14:30 -0700 (PDT)
Date: Thu, 10 Apr 2025 09:14:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: linux-kernel@vger.kernel.org, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 Eric Auger <eauger@redhat.com>
Subject: Re: [PATCH RFC] virtgpu: don't reset on shutdown
Message-ID: <20250410090619-mutt-send-email-mst@kernel.org>
References: <0d24e539766c9220b2380839472d1dc8739b5322.1744268995.git.mst@redhat.com>
 <07b30329-b4f0-4655-87fb-3ac52f9c64ff@redhat.com>
 <20250410084651-mutt-send-email-mst@kernel.org>
 <f1f3cfb2-86c4-42f9-b540-6feff196d426@redhat.com>
MIME-Version: 1.0
In-Reply-To: <f1f3cfb2-86c4-42f9-b540-6feff196d426@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: V41bVCpusM6YqbioDa_1bBOBS8EqMb1qB3PwYPtpXqc_1744290872
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

On Thu, Apr 10, 2025 at 02:51:47PM +0200, Jocelyn Falempe wrote:
> > > So it looks like the shutdown is called in the middle of console drawing, so
> > > either wait for it to finish, or let drm handle the shutdown, like your
> > > patch does.

The cleanest approach is actually just fixing surprise removal
of virtio-gpu. Because that's the path the generic shotdown takes -
pretends the device is gone.  I don't feel confident enough to work
on this, though.
Gerd, what's your take on it? Have some cycles to fix it properly?
Now? Eventually? Ack my hack for now?

-- 
MST

