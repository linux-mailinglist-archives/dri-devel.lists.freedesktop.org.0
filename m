Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB53C1BE3B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 17:00:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F8BB10E163;
	Wed, 29 Oct 2025 16:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hM48l62M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 971C210E163
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 16:00:30 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-47710acf715so20329745e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 09:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761753629; x=1762358429; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QjbKfgzHn5tyeA0m3V5JJ3BLODA9JPFCp9Sk+QT8tK8=;
 b=hM48l62MCT4FE+u1RxHBSMsYcSTOhbzL5lxHwP5m5vrB2Ut6h1Px+TuBkOkEYvN0/+
 C6pOXbrUj4ZYY68egrqFeoEoJOPZ2T/QgoCbInXwjUjKimQLNPRO/Lj1UNFYAPgGkF9V
 Qm+akhwNFR4WuDn+E+ggyN3kxzkGAoOpCEQgA9yAieXKUDfGDo/6OueiyPnkXaX58p34
 0CR1fJkArFmcemxS63xRH8AmI7uqf/GOZ5c5JBt+husUnT3Ym/TyucRJoff8+mD5DYQF
 MoMGKkxVv5FnPdfjgVBqn1gv2zhZvmBtTFNHELk5zPARbxr4Pudw6zWa/Kf9SjD3Xkk8
 qU1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761753629; x=1762358429;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QjbKfgzHn5tyeA0m3V5JJ3BLODA9JPFCp9Sk+QT8tK8=;
 b=jf3hsXMNS6ovtaABSuCY04cMB6cpBN9zCPoM5d/t8EJ4SR7Ietxqnc6cvcmx5BX+ea
 6FUQAL4yJUV9pHNrqu8ptK6+g5Pqj3Nd76hDEGPTMeO1HjU9lnCPxPwMRWE0V7SqpC2Q
 Uxobplb7gdMI8Kx5gshr66FG+j7PiYndZB66a6PxC9OWACoYJgT0trVfqKemxotxp+n7
 V7gA5iYoU9uwM5QJkY4L5i//nf0SqxPW7eKVo7hZkoyIe74la6ptsnmATzzjoSIp+A8n
 nbdPxO2wXasfyIvruDYN8SGXdCpvBcAoNEAGDqyuLInR39Gv/Fu/qZ1KRbthdIm6p51X
 YfhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVs1hMv1SQfIqlu0aw8RuCrDorRad8J6cLKhqJIPq9Al7jiFvr2FqaV4doPYMBpM0KCDBz8nyPwgEo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTlb7aD5fYHQNjojqIzkJntxN8eGbQfGlKNIgajY7nwg2d671f
 ObLzDSFIxIaVCrMz5O4U3KwY3s8VPa/mHLtQ9YErBt9LZhjzLctHoPl/
X-Gm-Gg: ASbGnct+J1GsIht5DeQ8nJlKggztOSt884JU4pcjQkabqZ77FEZHa5q9IfC9X+qfuU5
 LH095CyAwGNEZ1Tlb/wjmBHkeo9eo0rMECkqgQHABzRHUgaz6rh1TLINpPYi7Aqvo0rqLu8iQ0t
 JkIhD3nOSxylhS7sFCBqrjsIRw2T5NlgrO/BMEbYVYQ3rHM9afebwQVnWTTF0esKbP63g6apwYc
 fZFsmsTEsk89c7tbE5SKqOUPOSJuB+FotjLJHAci2azm8xaHxa9AG8a4A/+8P0V8rbuTjabj8pN
 0Xe6wtqDGMdu85L73yEZODQ7bgvHIB+tpmBRzMr5xtnMLhP06+sLgbQSciu72mJsA8fKpIazHBR
 QswkiyvMfdQabT3K2XM/2yiAkf4f3lTKOu+aTA73lbgynwYzZ4FlkSVpQBULiZ7zuZa4/iwZgvn
 5KbXscylz7IJ/u3REaMMmprxu/FkfaRFnO+VDa80QlBITLh1g5ydZAdy5fRaPzO6Tzz78w
X-Google-Smtp-Source: AGHT+IELwKkyoHZcEXoDh+ODYAhJc1PkQChXNnF/56yRmyxyp0iQGf8PAy40wU0hq97LrnXaNPX15Q==
X-Received: by 2002:a05:600c:848a:b0:45d:d97c:236c with SMTP id
 5b1f17b1804b1-4771e21c484mr25812165e9.21.1761753628706; 
 Wed, 29 Oct 2025 09:00:28 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net.
 [178.79.73.218]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4771e3a8209sm54097015e9.11.2025.10.29.09.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 09:00:28 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Miaoqian Lin <linmq006@gmail.com>
Cc: linmq006@gmail.com, stable@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: Fix device node reference leak in
 sun4i_tcon_of_get_id_from_port
Date: Wed, 29 Oct 2025 17:00:26 +0100
Message-ID: <3848160.MHq7AAxBmi@jernej-laptop>
In-Reply-To: <20251029074911.19265-1-linmq006@gmail.com>
References: <20251029074911.19265-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Dne sreda, 29. oktober 2025 ob 08:49:10 Srednjeevropski standardni =C4=8Das=
 je Miaoqian Lin napisal(a):
> Fix a device node reference leak where the remote endpoint node obtained
> by of_graph_get_remote_endpoint() was not being properly released.
>=20
> Add of_node_put() calls after of_property_read_u32() to fix this.
>=20
> Fixes: e8d5bbf7f4c4 ("drm/sun4i: tcon: get TCON ID and matching engine wi=
th remote endpoint ID")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


