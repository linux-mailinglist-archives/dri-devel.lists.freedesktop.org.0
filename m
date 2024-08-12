Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 052B294F788
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 21:37:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7440D10E29A;
	Mon, 12 Aug 2024 19:37:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W1aZRvnY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F5410E29A
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 19:37:21 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1fd66cddd4dso46164025ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 12:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723491441; x=1724096241; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rxx+DMoKnMaSXPEAm9seNFSlpcb7ZMKSV/nNzg3wsb8=;
 b=W1aZRvnY76M+pWQaP3J7UekCHIehRfW+LucoBoFyh2aiDjtJVvXg7BWAxddfY9jUh9
 yfCJERXAlM/rBuo51T2C1zbJzivpx1djLqxPdQh/CX1kmHQpzu02qhzcXtSkylpsQdPx
 x3QhB+ySMs6Cb9elZGyOoXZvQI8Jxwofuu3HbKcexwpMLBtnJ8zdoPrQZ2dBRgbh1LJf
 qvhU4l/cgtgih1myVbSQqn6O9lxOm5PUWkeAgyQVz9D3GLidCtIXOCE6ABHR/nf7BRiA
 9PZSuMVJ3HWbxCicx2lmR42eiGqmUD99Ea9V3Tg2CSzM8tr4LwHc8m4K0Zw3IsQGMBCs
 Pv/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723491441; x=1724096241;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rxx+DMoKnMaSXPEAm9seNFSlpcb7ZMKSV/nNzg3wsb8=;
 b=lnfZPDhnTeS2hHFXv0xKZLkMbYfVEvToDetAwp5AYHJ5z7VEZnwNWIsLv0LwLGws0n
 8iTpDaXak9Oz6UXjhBOGjhit4BJB6q6EgUmHm0V/rhP17HS4X1/FTf3W+rUWMnouyMDh
 onLxNCdnQwYbfh0Z13udp64QkVsHhECmdjEpqsyg+GZv59RMkQkans+qTgxkn9xgZnYR
 TUSZsJ8CKzIOcC2DHf9MVXXNQydDBFrClg5iShgb+dzlfPCku+oGbRahTptWghEiDJiC
 in7WteNqrJwefihxr4xHTZjnFuXb/o9rS6fZO08QHXeEMyq1rBf8dkvPyhDSiP2rT2/A
 DJvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIIU48TUbCk4XzJpcI/ULWhQa0p1oGWtVyZQhVh58DPPnuV/Y47V4fEoPeD6zxEpoIBy+b7fsQbXQwl1lbusvdQkwwxm6Fv/eGZ9U8BmuU
X-Gm-Message-State: AOJu0YxjI5DZbkut/bvG3FgsJjyejT01+6SRVjoURtDWPNIeEE3z7WS9
 lymREb9vYRm1yXpP1p2oXI70az9TOHjvRcicequdswfHd7DEL737
X-Google-Smtp-Source: AGHT+IFIyrmDNlSikdo054BBiVyTFfoxQOYL77pyuRHcWQTEILqG0SAYU1sUxlIh6LQiJIzM/kDYDg==
X-Received: by 2002:a17:902:c949:b0:1fc:2ee3:d45a with SMTP id
 d9443c01a7336-201ca12a60dmr15961945ad.8.1723491441309; 
 Mon, 12 Aug 2024 12:37:21 -0700 (PDT)
Received: from dev0.. ([2405:201:6803:30b3:3671:7e47:70c8:c710])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-201cd1a939fsm488965ad.169.2024.08.12.12.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 12:37:20 -0700 (PDT)
From: Abhinav Jain <jain.abhinav177@gmail.com>
To: jain.abhinav177@gmail.com
Cc: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 javier.carrasco.cruz@gmail.com, julia.lawall@inria.fr,
 linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
 skhan@linuxfoundation.org
Subject: [PATCH v2] gpu: ipu-v3: Add cleanup attribute for prg_node for auto
 cleanup
Date: Tue, 13 Aug 2024 01:07:14 +0530
Message-Id: <20240812193714.1094339-1-jain.abhinav177@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240704132142.1003887-1-jain.abhinav177@gmail.com>
References: <20240704132142.1003887-1-jain.abhinav177@gmail.com>
MIME-Version: 1.0
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

Hello,
Can this be kindly reviewed? Thanks.
