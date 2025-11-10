Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A51C44DFE
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 05:00:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C621E10E16E;
	Mon, 10 Nov 2025 04:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="al6sTfaS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F1E10E16E
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 04:00:18 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-7aa2170adf9so1980155b3a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Nov 2025 20:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762747218; x=1763352018; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ARePJZFcum0I2UcsNc1I6X6ypbFo44099GunaYErXsE=;
 b=al6sTfaSasLR36MhzTIlh4nkm9nUCmG76OOgeSZ8BuLXK46nh3UHCDbWW1KtCuYHhI
 O3aVQi4mYF4mF1ph9dZsSNmjMw7WFc7Y8O4mPwfO4d36Iq7LszZ6NmP9k4J4gvGtBp/c
 POqZjikvzAV2h7O3zgnc3dwLgcIktCmTZZafwYwJqfciqCcIVq1wE6ICbOBygGx39TuU
 RXeueTJ+XYguTb3VgngIWn0/hZQLWE6qlGY54XnqW6yGlQGkn3nR+E85khvsUelE9ywt
 UYkQ6dpW6JlbHMYOBGeqpyduIPTpryK4uLMPw/ZpM7ZXUgJPwHNXixrJTEwb010t1wer
 ea+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762747218; x=1763352018;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ARePJZFcum0I2UcsNc1I6X6ypbFo44099GunaYErXsE=;
 b=SMup9YkLoloF8HxHQO62S1N5FP3CKhXW4AF1o9lOBbIxBW27aP21vnlCuoC/m5H84s
 yy/zfzNPNa91qGNcb57O06E5hIZfb/Ojg0OiLUK3cvUjueWPWkAA1IJwcKicjqsI55jW
 5MoIBGmmPd4sAOam5OBHC1XukZrMBsjqvxXM0i2dNAcWTFitfjnxxHSR4o8ZM/ELj5Yj
 3+dMQftf2NwjYgYT/WW637lBSxaO8qGBIEX6t6Lteud3Yi23YAqP1BGKHs6/K9fmDiPC
 RWmFKtTVQwcVoHueNrRGJgSWx7nBHNL5uSvYnWwvg4i4SQGz4ebPnF655/m9kJ+95J1J
 +DfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDInafkcGEF+sqGbEvcW4TbtqIk3vh3TWjH6oxus8/Ri/fZR2BFl50sqSanPozsv9ExNwZ2ZryCsk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyvpixs9Zi5VoYkpfLJHUqkmuTNMubt0Q1cx7KkHrJa43B26xT4
 b1PZ45H7ZsYNwUtDmbAeU3W6EbsFjy8qEX9SDmkdjcdl4bgpACqaehYw
X-Gm-Gg: ASbGnctSMjI8f52cppfHzpUZ86+MCCUZ/40dbAqcvcmyZh9WpRAx1t3kCL0qJrYQQim
 SbWLk8KJ7SHYkVJ32uWoQ/krQbRiS4oiEdAznK74rkZQLqpHQcYK8XRx3qYhhNdBZ0YgRADIML5
 rlcsJng1U93PiHA6RFp9kZYSk0JpXYn81Ba+l/nfKGP0ZvCqHtuU1QlUfX2EddzJNQ2iapEb746
 Z9eGQt8HKuC7TNEs/+E5fWhRlgOAmqKkw8H3oHxLTRUg0ZggwIxwV8H8D+r4JCgEAnay0SssTYh
 tHBWwfOq/ySAGryCYQlbRDMQzVCi6CO9IR0VxSZLWzjYI4L2fmL1tFJpAtDTxMA/1uAZzYXu8cx
 RGjUK+wjLPaICORYeD+mWqDhg567UWZY82CkCtk0kbhSaL5MpWwsyyBNNS0iOxLNSg58CVGx7t+
 ZB
X-Google-Smtp-Source: AGHT+IG3yPz6YTXE7nA7vJNdAshD2gcVhiabblc07+gqriIOoO3eDQGJ9UaYyrZ7ijemvVvAFWSB9w==
X-Received: by 2002:a05:6a00:2d8b:b0:7ab:2fd6:5d42 with SMTP id
 d2e1a72fcca58-7b22668fd88mr8043382b3a.16.1762747217714; 
 Sun, 09 Nov 2025 20:00:17 -0800 (PST)
Received: from archie.me ([210.87.74.117]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7b0c9c09f22sm9978570b3a.20.2025.11.09.20.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Nov 2025 20:00:16 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id 10B0B418F1BD; Mon, 10 Nov 2025 11:00:13 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux ARM MSM <linux-arm-msm@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
 Aswin Venkatesan <aswivenk@qti.qualcomm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH 1/2] accel/qaic: Separate DBC_STATE_* definition list
Date: Mon, 10 Nov 2025 10:59:52 +0700
Message-ID: <20251110035952.25778-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251110035952.25778-2-bagasdotme@gmail.com>
References: <20251110035952.25778-2-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1277; i=bagasdotme@gmail.com;
 h=from:subject; bh=MYUt4S+k12lqQeD8erIncNYSK/N6bNXBnqfxnjwY2Q4=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDJmCSVlPHn654866fXaGkX/vH67K4Gkd2k9zdJoDwoQT3
 p+bFNTTUcrCIMbFICumyDIpka/p9C4jkQvtax1h5rAygQxh4OIUgIlY5TH8lbIT33DD/n601bro
 TaYzsh79fvNBrYTVsmn/lBXlDPcCFzD8Fb91IKb6vL9g211jWYVt1/omn5/3nn3rha8PrVLzzCc
 3MQMA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
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

Stephen Rothwell reports htmldocs warnings when merging drm-misc tree:

Documentation/accel/qaic/aic100.rst:502: ERROR: Unexpected indentation. [docutils]
Documentation/accel/qaic/aic100.rst:504: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]

Fix these by separating DBC_STATE_* definition list from preceding
paragraph.

Fixes: 9675093acea04c ("accel/qaic: Implement basic SSR handling")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/20251110132401.200d88bd@canb.auug.org.au/
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/accel/qaic/aic100.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/accel/qaic/aic100.rst b/Documentation/accel/qaic/aic100.rst
index 3b287c3987d269..41331cf580b118 100644
--- a/Documentation/accel/qaic/aic100.rst
+++ b/Documentation/accel/qaic/aic100.rst
@@ -498,6 +498,7 @@ it desires to recover the workload.
 
 When SSR occurs for a specific NSP, the assigned DBC goes through the
 following state transactions in order:
+
 DBC_STATE_BEFORE_SHUTDOWN
 	Indicates that the affected NSP was found in an unrecoverable error
 	condition.
-- 
An old man doll... just what I always wanted! - Clara

