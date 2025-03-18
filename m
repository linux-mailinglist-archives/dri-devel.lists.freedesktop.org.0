Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C92D8A67361
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 13:03:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90B5510E1F6;
	Tue, 18 Mar 2025 12:03:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jzfp0Maz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C5210E1F6;
 Tue, 18 Mar 2025 12:03:18 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5e6f4b3ebe5so9482750a12.0; 
 Tue, 18 Mar 2025 05:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742299397; x=1742904197; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=oVYybeI/Ddfyc3YGNwrPdSaOzz8JoBglxTH8pEdb9Fc=;
 b=jzfp0Maz/s00QDbrMvGFue1ohOSXeTCHC+lBTSYrq2ME063XnxSPr3klashfY43xca
 9eOmpQGXr/Y6eCrlCcSwkQ8ySHX/hbFzO7s2zfYK/HeaKOzJrwjJNQysXsFkkNKKWptD
 5zVc4ewESMWTU3eyUdJoH//cNegI9dY1dvpXN8zOhIbGsmwaPedYRHZWnXO7yvIiD+bc
 vyYCa3+y5PfND1niJACCa5fhwCtzZ7eSHfbt7EJS0RFE3/OWMuzsGsr0sEwy7F4/xCVp
 7WFRXxKGSmSnAEvzO0D0+FDyjjS+EUrcgnWV6g+8liAUQrQP/eYljAw8mD/26Ns3BAKH
 oekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742299397; x=1742904197;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oVYybeI/Ddfyc3YGNwrPdSaOzz8JoBglxTH8pEdb9Fc=;
 b=nDlx9t0GZBU3+V3sEGA4vILu7ekneXCJlMdXZOaA5yfEsyosOcOiuMjH8wKNyp9CBV
 Mbw0gJrbr7yQ67A2h6ZOdbuNUmQ/xIMrtpcFwuQvVG0N3xzYcQg5L66UkaYn4kRsNdYu
 kxkbUKy4Bz7IqizypAW4keDoaci9d6qqZ1zZ/kJKahsIsNpSqc/sURIf8zWZAH37lZus
 JtSSwSos6xxa6L+mNwPY0CX+IMYFNr/4GfTMINGvcRrcnDL1aTziHl/mBD2QUxew8r0y
 nwgN6yYbbyzzKsTzZcDY9iyiBKksDP1GhTJ5wkkxhQ0Uorgs43SfYJDfYp+HJDHU2f64
 i9jQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUV7ZFC2GSJJlg+WNwdW/EsfUR9iJiH/T0EnlCONk6kc8TSCfc8E2H4RoHedbC61TsShH7aqyah@lists.freedesktop.org,
 AJvYcCV9RuolsVrSAORe5jsfcWznfkSjsVReGl+EAIr3VIqKy3SuK6HpMza6Vlpq+hIyMWo1y24IRXht1dm8@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxdwyzh+fhB0X1w10omvWgQWNzs8FBX8nZ/PTpFXUp2GyKJ93mv
 uMbwsvDPRWKBU75zNE3UrU3TH0RaorUZATCSYnnPN0uDdkgi4zrn
X-Gm-Gg: ASbGncuNJ972+ipNp6GmD8HEmqqyi6omwuDZnN7x12/S51hhmtAb4gNiqltv+gaaL6k
 zFYVLsV5XB9k7pX8lIr33GovZl96MiFtA4PN6r0tmniQwb2PGFBpb0HzKy92J01JciTiyXkMU4l
 yhCVSg14ndqJm8h6XTVaEJ7N4IAhOvdQFOjDnuQbySRivlL+IsI9njlK11EU8feF6XZe7LuJtkt
 +jpsIimklmeoXV2Pa23h6r5wqeqkEzIyRR9R8E/lqMV15i9FG3OiEC1ZLw1MDNeR23HmNsKTNO+
 CoQuiqghcMIn7HArq3LvtklHFFWgGcbS55DWEiclupPAoZmY7Qqo1PEU8w==
X-Google-Smtp-Source: AGHT+IEvLBJojU4HHVDZUUjGLwZsU/AOnqvBTOHVgiOmpuxlb0HdtyMehWGKnBXqqWxsfTXyYhb8Gw==
X-Received: by 2002:a05:6402:1d53:b0:5e4:b66f:880b with SMTP id
 4fb4d7f45d1cf-5e89ea8f6a7mr18151961a12.6.1742299396870; 
 Tue, 18 Mar 2025 05:03:16 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1527:7100:c898:4de8:4301:2cfa])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e816afe1f6sm7433380a12.77.2025.03.18.05.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 05:03:16 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, tvrtko.ursulin@igalia.com,
 dri-devel@lists.freedesktop.org, dakr@kernel.org,
 amd-gfx@lists.freedesktop.org
Subject: Try to fix amdgpu's error handling
Date: Tue, 18 Mar 2025 13:03:11 +0100
Message-Id: <20250318120313.19099-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi guys,

as partially discussed on the list already amdgpu has a bug in it's gang
submission code.

Basic problem is to add the correct dependency to the gang leader we
need to arm the other gang members first, but that is a point of no
return and it is possible that adding the dependencies fails with
ENOMEM.

Try to fix that by allowing drivers to preallocate dependency slots. Not
sure if that is a good approach, but of hand I don't see much
alternative.

Please comment,
Christian.


