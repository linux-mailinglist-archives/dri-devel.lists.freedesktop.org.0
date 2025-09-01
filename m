Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE544B3DCA6
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 10:38:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4907310E3A8;
	Mon,  1 Sep 2025 08:38:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SRG3IAb0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96BA010E3A8
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 08:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756715888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=P+EUDX1W/ihdzaBuV48woqw6avcEjywzB+FadyRSMcI=;
 b=SRG3IAb0BycXukVhAnpFIapciUKTVB64f+5GBCvoszv3Asp1HTasxG8q5JUu+RRTQ+aVc+
 b84jqxfDeY8+ozRosxWIn6tsb+Pi2WZQebFFtGlUGPSxg8tUFUxHdWwlK9vYuT7GyL4zvt
 61lXBaCwLtEmGVBl6DgTDPpE/aUi5h0=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-RmnbFD6xNq2JlO9q2LWtlw-1; Mon, 01 Sep 2025 04:38:07 -0400
X-MC-Unique: RmnbFD6xNq2JlO9q2LWtlw-1
X-Mimecast-MFC-AGG-ID: RmnbFD6xNq2JlO9q2LWtlw_1756715886
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7725a76dcb4so504933b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 01:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756715885; x=1757320685;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P+EUDX1W/ihdzaBuV48woqw6avcEjywzB+FadyRSMcI=;
 b=wsY4+0NT5B93+qI+b4CX5tGtUtLFj2j3JETOR+Q6Z015wRi2va8t9vwd50LC/0THwW
 7mBODnmXoG5FiwoZT900cSnAw7DGAXR8uTSrtsDn/5DtAEI2JAuZszir5Ir+17avJ1n9
 VigQDRBtI9zyJBwKLeJd42/BnA8JF0ypPqZ8eHvT1bn3ABWS9+Zrv15XlTxf1pVRclOx
 zY5GTryS3QmiSO+P1VapJ2JAhR0+PMD2uAD0YO1AIj15901GqLDnpTCBAJ72jxk29XCC
 2erf7hCMhPjgP40271Ot2gr0ZXrDayB7JE0r20nAaEXfteVM5bPcDIYo3eFwINfgCKrd
 t6+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmTEVx6qPxjDrjXXo0K7WkpWoBNbtMa5+D9BCri5yJIkIxrbSeXkNFg5Pp1t/uKdRXO/fxE0FgTrs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIwDAlDFiYZhqrC3idXOPpxvGWA7BwlKzOV7tdMQVkz4xPh5I/
 LhM8mi1nV1vHBr2ZIeoatdVwsyhqMSikvXNEYMi3pzQpDhxFWSx7LokBJ8hxrW6dYM4k0hiWgKC
 9stErCFupyjXukZ8+/eAOQy5XSFG542bgJredRblWqdmiLuu3cua172j16vxi6NfUkg0aVz3LGM
 iqduVa
X-Gm-Gg: ASbGncs1F7eeXb3elnCcaFZB7cE09rgy+jFMjwVmsuxNjohqNgRy2vxYSeYZC3Hvd9M
 4QLHjVHvd706STUj2haLCqhaE2Ri8hjUqy/YtbHr98YeZi/tkk4Mcts1HbmwjQ9cnwop8OFO6BD
 XKOa8OQQQcX86t/QNkCp61xzynvKEdJ/cmFotKNckdwijb7QONNnhfpr8urwqDwr8Xq/rFFdLaS
 PI0b74Jo2hH/YcC0TsXfTonyEDC+Nqsw1aQziBBVy5MsFVjfFYs8BgHmjOcuM4UKRjEgap574GN
 m+he2VENp2vjdkPoQprfBp2R8w52T9aJGeQ=
X-Received: by 2002:a05:6a20:12ce:b0:243:9587:a774 with SMTP id
 adf61e73a8af0-243d6f7ef50mr9510688637.28.1756715885662; 
 Mon, 01 Sep 2025 01:38:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHICmbVBLeWJ6x4FNJkNFYJdgYcXmjleynjZn+8qv0o+FPmxhi1TGcD3dIfwmIF/wHRSCKB3A==
X-Received: by 2002:a05:6a20:12ce:b0:243:9587:a774 with SMTP id
 adf61e73a8af0-243d6f7ef50mr9510665637.28.1756715885279; 
 Mon, 01 Sep 2025 01:38:05 -0700 (PDT)
Received: from zeus ([2405:6580:83a0:7600:6e93:a15a:9134:ae1f])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a26ae02sm9815337b3a.21.2025.09.01.01.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 01:38:04 -0700 (PDT)
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
To: zack.rusin@broadcom.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jfalempe@redhat.com
Cc: Ryosuke Yasuoka <ryasuoka@redhat.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH drm-misc-next 0/1] add drm_panic_support for stdu
Date: Mon,  1 Sep 2025 17:36:54 +0900
Message-ID: <20250901083701.32365-1-ryasuoka@redhat.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OBbGrihm-FBsnXuwrL4rYUj3zAr3ZbLOGAg70ziRWMs_1756715886
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

Add drm_panic support for stdu in vmwgfx. This patch was tested in 
a VM with VMSVGA on Virtual Box.

Ryosuke Yasuoka (1):
  drm/vmwgfx: add drm_panic support for stdu

 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c   |  43 ++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c |  11 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h    |   4 +
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c    |  48 +++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h    |   1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c   | 139 +++++++++++++++++++++++++
 6 files changed, 246 insertions(+)


base-commit: 73cfd166e045769a1b42d36897accaa6e06b8102
-- 
2.51.0

