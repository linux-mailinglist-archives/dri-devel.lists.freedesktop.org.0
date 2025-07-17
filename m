Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA95B0941C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 20:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0540510E31B;
	Thu, 17 Jul 2025 18:41:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="TrlNG/0q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E40B110E31B
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 18:41:04 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-7490702fc7cso929109b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 11:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1752777664; x=1753382464;
 darn=lists.freedesktop.org; 
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oOsxMfNQT/qsQwwKg0YZL6vPa28xMbHs+2C6Y8zV2dw=;
 b=TrlNG/0qDoD6/gRZxo8Jux7poknMtYKHjwpwTG552AFAPzhI4vg5VMw5CGf4j+MRu/
 byRk9AkDtLYuc0gCBTrjPOFGccNaI5veNZxlC0J4gdtwutBhs/Ts60bZ3EnJbgeEO+BW
 B8WP7QumX9HQ5/JISgTDsidvgnNhJLldieZ/GKHLBSPUKa7EV6+mr57vMiI3hpgdnnYO
 zU4CSWttjqvjGrfQimNSEFlZgAlxDoZk4dj9afkHm/jS6cE27rbIxtNCeGbE9iZIyWBK
 ZYCNSDF061Jlk8HSc2vRpi8RsPyOYbMv/jXfiS7cAQUD3EGYqh0S9G2a1+NRIr3i3Epb
 D9TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752777664; x=1753382464;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=oOsxMfNQT/qsQwwKg0YZL6vPa28xMbHs+2C6Y8zV2dw=;
 b=c4lw0LQGR5p2xhZHulhIccwzkjFNRMVn5HKUEVY7F2cpHx6nOMSGhPkNsWcJzlsFW6
 zMPB1maxFG5QMXq6sT3gDF0xZCXSrik641M2N0rgcHT00vgx0+NGTTI1i+LfmqCCQXj2
 B9xQfTDYBVGjKbJUiVwJ/NddOxdxkpjrDSy8qoque3PH8KF/Yu7KZqkrtjfUyg3NiaEc
 R0tTxG6PYPotAsnJ23+v+V2XILgO3Mf6n6D9Z1GvxzykIKuUybJo5GjFXdzWFIYpFaXI
 sOk7t2kfb6G1L2V/VXiE1WrRD1CMix9K6CuktF0VvneYBLlB3E5Yz7H8VohN9Tx1v/a5
 wGHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJ168SJ0LrVxCkDC9qoxN1j4YY44FTF1XDlqb2/hGpeqgTpy87Q6g3dln7o//D24hvnVwhSRybfDg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHCCYL2BfMyTQ5N+2DalplME4Jv+Lp9LTrR/XdouMv+E2nqEu/
 QfAaMrhB+sHk1495e+07Xp7DImvq6+ccict/rou7HS9EuzzYXowAw+ZXNRH9X22c2XE=
X-Gm-Gg: ASbGnctesS/401RiXMhSDY84whOKuV7+LMmgphZ6WMieh8AdRT41urgpDCX+6K9xNsB
 kR0HMQkByaf+/+xLWwAtWpo7c/Cljrmcfp+in0/H6Pi3xi/WwYpP4GUhoh2Grx7fPqqzv3idSXP
 QNzP++jTvnlsIVzcR/pTY4HoK25v0BlDZbvmJFkIXQYPkuA+P8bkSVcurPC+1dT7J05vY0dmkTI
 PJLdKgm54sBF4jgbuTht4j0RRb7V/mJhsrdKN5T/2LdY6iUL9whxIvRKZmr737+ZMa+CNFNaqCd
 2vCmT61nAFbxodvrPf4YzyfGh9EoPbpuak0/pc+dkrLXPkWj3Se1KX37nkvuVCmZ7m4AB5CkbZb
 Es8a6gdZD2C6vTUfbXUU=
X-Google-Smtp-Source: AGHT+IGJSiqVRqEqNHtQKOugHVGaBNjYMDOrySpKjtT1rTqdZu4A+8+NkiaILNEtNNDxpHEp7TmBLA==
X-Received: by 2002:a05:6a00:814:b0:748:f3b0:4db6 with SMTP id
 d2e1a72fcca58-756e99fafffmr13108030b3a.11.1752777664328; 
 Thu, 17 Jul 2025 11:41:04 -0700 (PDT)
Received: from localhost ([64.71.154.6]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9e06890sm16623945b3a.48.2025.07.17.11.41.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 11:41:03 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Jul 2025 12:41:02 -0600
Message-Id: <DBEJTQ0J7H88.5X7XSNC712Z1@brighamcampbell.com>
Subject: Re: [PATCH v3 0/4] drm: Fix bug in panel driver, update MIPI
 support macros
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Brigham Campbell" <me@brighamcampbell.com>, <dianders@chromium.org>,
 <tejasvipin76@gmail.com>, <diogo.ivo@tecnico.ulisboa.pt>,
 <skhan@linuxfoundation.org>, <linux-kernel-mentees@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250717164053.284969-1-me@brighamcampbell.com>
In-Reply-To: <20250717164053.284969-1-me@brighamcampbell.com>
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

Woops. When I copied over the subject from the previous cover letter, I
accidentally overwrote v4 with v3. I'll issue a v5 if that's a problem.

My bad,
Brigham
