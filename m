Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 623E77B544F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 15:50:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3FD910E2B3;
	Mon,  2 Oct 2023 13:50:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D897E10E2B4
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 13:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696254616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Nwx/VBvi2Ll0/8emzZfMoPpx/p+0CAxTL6gVB2JkPe4=;
 b=EdwmkXAhuMYAmQvda0CJyoP48Ajvixr20tCNHmIxrMkT0RjRFGl0Tl9HwoY82oGRTvgQHX
 peTxlcwDkTvI+uj7C3FzHmdhfY8NcHlxQQVEb2qDXgupIR7HIMqk/ReIRcFtsvVcqbp2g7
 /o2LhfyQtNWqNVtgwxRSnZhTIcLauPA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-nPQnsTN9OHK7d-g9aSkQlg-1; Mon, 02 Oct 2023 09:50:15 -0400
X-MC-Unique: nPQnsTN9OHK7d-g9aSkQlg-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9a9e3f703dfso128115566b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Oct 2023 06:50:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696254614; x=1696859414;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nwx/VBvi2Ll0/8emzZfMoPpx/p+0CAxTL6gVB2JkPe4=;
 b=GMGmsavU/JY8jHoiK98KIHFCf60oApDoR8FhwIRUWmHLYRtyqcKWLXAuurLL56fYca
 rVuZtlmZinhulgAOVLFkg7a8e+5S3ybKGm3NNL3a6n0yMrxpLeRhl7zyqX9NTnNQovGb
 i9TdhHxv0F4PWTvdTzpUfGmAK9+Bg4Wli0JRT+PUUb3YMtVZMOK4f5xnRKRlGW5t8DDu
 UtVhK7nn1UXduJP2mBOvaVEUZ5XxUzfSmcX9VS+vgdKvuMNVPg5eYZ7DQIjQuK2Wwdvr
 GVYLO3LOtQZDKMwGbwLFH1+xAiew0YfV7SDkGn7pkIPl4JQGfEfrh0JNQCA6Pq+nw+Vw
 8NpQ==
X-Gm-Message-State: AOJu0YyQq+8piYklMqEjRLeZS/vcSsLk6JqtRBjkV/Km1UEwkRo/50oU
 ufkwk3Z4k1S8SFakiP4SroMKbIcXfjpwf0QUFSbw6QQjCWfU0RBm9qQKijeDW/ibmj6WIybgFfB
 9mV1b2reEbRQndo36kiXTZRJ/Gbji
X-Received: by 2002:a17:906:109e:b0:9ae:41db:c27f with SMTP id
 u30-20020a170906109e00b009ae41dbc27fmr8638377eju.10.1696254614276; 
 Mon, 02 Oct 2023 06:50:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOyAk2A+5hPWVMwIvF1D2MQJJkYjnhQvamVR/gCygfPW4WM63DnADCGymABNWeANbu1hiwhg==
X-Received: by 2002:a17:906:109e:b0:9ae:41db:c27f with SMTP id
 u30-20020a170906109e00b009ae41dbc27fmr8638363eju.10.1696254613994; 
 Mon, 02 Oct 2023 06:50:13 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a170906050800b009934855d8f1sm16974238eja.34.2023.10.02.06.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 06:50:13 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: nouveau@lists.freedesktop.org,
	faith@gfxstrand.net
Subject: [PATCH v2 1/3] drm/nouveau: chan: use struct nvif_mclass
Date: Mon,  2 Oct 2023 15:46:46 +0200
Message-ID: <20231002135008.10651-1-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: dri-devel@lists.freedesktop.org, kherbst@redhat.com,
 Danilo Krummrich <dakr@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use actual struct nvif_mclass instead of identical anonymous struct.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_chan.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index 1fd5ccf41128..dffbee59be6a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -259,10 +259,7 @@ static int
 nouveau_channel_ctor(struct nouveau_drm *drm, struct nvif_device *device, bool priv, u64 runm,
 		     struct nouveau_channel **pchan)
 {
-	static const struct {
-		s32 oclass;
-		int version;
-	} hosts[] = {
+	const struct nvif_mclass hosts[] = {
 		{  AMPERE_CHANNEL_GPFIFO_B, 0 },
 		{  AMPERE_CHANNEL_GPFIFO_A, 0 },
 		{  TURING_CHANNEL_GPFIFO_A, 0 },
-- 
2.41.0

