Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B628D1E8A
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 16:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF8A10E0D9;
	Tue, 28 May 2024 14:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=usp.br header.i=@usp.br header.b="RVwg7ihT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B1C10E543
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 13:11:38 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-701b0b0be38so671587b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 06:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=usp.br; s=usp-google; t=1716901898; x=1717506698; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QoaTOCmlXkenptztn+mDC2rLsS4IERfQPTeSACgx6t4=;
 b=RVwg7ihTEw9z4dvaRXMgla7IIp3H4X6rq/TENhjsL0Dc05Y1FZGmWCPQFAAGTMRFFB
 XY6XnSYpySkgvaQjP17UeCtLwBdkRI6XkoaQK11qNvc9gXJ5x45SMl8IplfT+dfTyxyC
 Ktl0QdZTWuARcVPc+BZox9jP402bvygqed/BvwB9HOX8SQmoTUXlqDh6eg0vFEKSalTY
 5uTBYWhw+HP0BbbR9O9eTKgKIGsMZIT4vETQqWGDbWOChOQ5SHs7TjWcnh8m+rQTDIBe
 3s5jy5xSBBko34yu5rKf2/1qsHpw53WvosIlwk+HeAMz+D1Z9VGUuPgM8Qi8PPpTOs+R
 SUwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716901898; x=1717506698;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QoaTOCmlXkenptztn+mDC2rLsS4IERfQPTeSACgx6t4=;
 b=HyxyHQPo6+p8KTcaoKy3Mh7knHNILuVtkKUW5vCy3MUaZxRq7+SpQ05dNeu/V1mLwd
 8koTferRB88SVgnmHZfHJid9pJbau5eCPnePfdlpI8OS7ywE8f0s5HTaABkWlcTa2gSo
 Kwc0bO9TMYHrp3MNp7CzXparIf82bYXvFWJ/HQ9c86tffZx6bAxvmZNPWiG/pOqaXbgA
 nE1K0e687V93GXjBcHuwz/7gdQI3F60q95+ZTjwB0hpCAPRAuFEnpSqPwzXPNL2yAwrW
 YOXrRZ4TynLAE2+FD7m07ezMUSOCDNj7a6P2ZW7UlAzRuydb0w+yi8s3VvTOp2jBw8Ti
 krzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCqWWPyun0N6IQ90aLQfilS/QfeniGlGDlGmQnKxSqxeuGoHcPRRQ041EiCvAkUlsdDg67ih50je4L926glGJaNDcS1tFIBuJUAYSMxlS4
X-Gm-Message-State: AOJu0YzeFgKp83iRXY2u/9EVQpCwcXXD9la2JTVhVaNRzYibKgnMhiYX
 FnquSblyGnfPyaLBq6HCJrZd2tFxKjpqMTyzJDCly7fq/pEPg2ptDLlCR1gyCBE=
X-Google-Smtp-Source: AGHT+IHPZoHe+5AtTnRZyrDiZBI1RraIlifONBLBScJQgU8Dwsc/BwuyckzD6ggcJxPHoRaMZ0SMIw==
X-Received: by 2002:a05:6a20:5b03:b0:1af:881c:e924 with SMTP id
 adf61e73a8af0-1b212e91384mr11340139637.62.1716901898281; 
 Tue, 28 May 2024 06:11:38 -0700 (PDT)
Received: from ccsl-Inspiron-7472.semfio.usp.br ([143.107.45.1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-682226fc4dcsm7507164a12.42.2024.05.28.06.11.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 06:11:37 -0700 (PDT)
From: Bruno Rocha Levi <brunolevilevi@usp.br>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: Bruno Rocha Levi <brunolevilevi@usp.br>,
 Lucas Antonio <lucasantonio.santos@usp.br>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drivers/gpu: Fix misalignment in comment block
Date: Tue, 28 May 2024 10:08:04 -0300
Message-ID: <20240528131026.214773-3-brunolevilevi@usp.br>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240528131026.214773-1-brunolevilevi@usp.br>
References: <20240528131026.214773-1-brunolevilevi@usp.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 28 May 2024 14:24:34 +0000
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

This patch fixes a warning from checkpatch by ensuring the trailing */ is
aligned with the rest of the *, improving readability.

Co-developed-by: Lucas Antonio <lucasantonio.santos@usp.br>
Signed-off-by: Lucas Antonio <lucasantonio.santos@usp.br>
Signed-off-by: Bruno Rocha Levi <brunolevilevi@usp.br>
---
 drivers/gpu/drm/amd/acp/include/acp_gfx_if.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/acp/include/acp_gfx_if.h b/drivers/gpu/drm/amd/acp/include/acp_gfx_if.h
index feab8eb7f..b26710cae 100644
--- a/drivers/gpu/drm/amd/acp/include/acp_gfx_if.h
+++ b/drivers/gpu/drm/amd/acp/include/acp_gfx_if.h
@@ -19,7 +19,7 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  *
-*/
+ */
 
 #ifndef _ACP_GFX_IF_H
 #define _ACP_GFX_IF_H
-- 
2.45.1

