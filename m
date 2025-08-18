Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3873B29DF9
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 11:34:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2602A10E1CE;
	Mon, 18 Aug 2025 09:34:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W0UfkJC8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE8110E1CE
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 09:34:35 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-32326e05b3eso2718004a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 02:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755509675; x=1756114475; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=60vbViMR8Uy+6kl93oThleRFTtzQFX1+pX+f2yZSrkk=;
 b=W0UfkJC85WuIJ5enf9tsog6OfWvch799alpOC8Pec+kO2jetdLrlgb0E4kifEAxkUP
 YJyREdk3jrwcgpScQZlnh7FBwm5YLSuaPbUqs7eD3iYVIo3nTTHXJcpSlWsLCAsvjn5P
 nB/+eUHx+UkT9bDyTstXcT1YXNXsGQBzUk6Y2uMs0BxGuHt9XDq5CWI9nzn1L2e4m43q
 wp4AbSS/iXHabAjRpho/6bylIfc/rjLj2EVTOjA89eryGE/fxqICWNUwpsfAu5cdNfuL
 szGO8P+rX6JRSnuQ2RK6KI/4ntC3zhrvD2wel8c5bQn1vXKut9vC/baGl3PDN/FH9sA8
 9W6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755509675; x=1756114475;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=60vbViMR8Uy+6kl93oThleRFTtzQFX1+pX+f2yZSrkk=;
 b=dplrgsWpg6OOMF+GFZd+farIodjX0JwQYeIfri4ekjB/e6bneWhbnRgd7AUkYiH3WB
 /XFv7YLhZKOxVL7UoJKeyfcGoY8MvZ4nULLHED7scWZABMVZZ8buCk7NyaM/zevCktwi
 1qHw5zzm3z5KKJN0hvX1RZDWheQ/7RSekBJ3jlLTC2SaXAfDoi1i1SigZEKIESmm7wk5
 +QemQAcsPz1IHAXBcZn2nTWghhS1sqJRRXHYTcyj89bLKsdWqmuENyYMAYMzqgcfUiej
 ur4JYBccDfiZCuJxPOOrlNUpi4pwdsf5zbk4ZDMdos7Piqj1RugE0NHbPzn64WWh0nkk
 pq+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeI1R72G5ZGsekEv+E5eDLNSym0fgjQbXbiVZI18GNoJ1PCx02YiG2mNlEk3WjZ8a5NvolRog6DRE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpZ9t5lP59Y0eK3CSh9CZSDZeCRKizZyK3WcopZvU+1tp8Ztce
 CG395qGwbTMGjE48GmXmZri9XkPrUvC4jX15H/V9GHG77ySp6WbjQhu3
X-Gm-Gg: ASbGnctsg+gKZ0D1kjbEGOW0eFvWhz/veAVkvnK+FCeRievg1EH03GXwR+ih64oSd0v
 JWwTOaG/lFl/cQaJzXgn74Bmx9upniLfLk+Df/y8vT5PoN/wgzwia6bfOZG+Dw3RpeZIKjNA5Ff
 v2QBhBzDfox1Wx7iV9DQhwvPT/H2lza/hS0Va9zxooAbgQjAZEUgsHAkmW52RF0LUYhkPexJytg
 A7TVZcfA2dz2b2aE/Y3xVX4aH4nRo0QqETE3QXw8dRwxU1GNLJnSEfASCfz+/CKadYUUEsEc4xr
 /pL1ZcWrW/92Vj6z4q2xcmtclU+QFDa8DDiRv09b4ekvKJvtHmQFCv8UFEVkiZK6uNOzJJlf4v8
 btl0gly7iZPzN7gyjLyPW0WH88txdYhXr/vP+HMkj9Ybm9ORFhEqj9g==
X-Google-Smtp-Source: AGHT+IFf+8zELKXLnNrTHwU3uwOFmVF3ojyNrlULiylhfH6Vx8GnSmdVQWDD/kELqJPafmdTuOsPqA==
X-Received: by 2002:a17:90b:180d:b0:31f:2bd7:a4d2 with SMTP id
 98e67ed59e1d1-32342122b93mr17625593a91.35.1755509674970; 
 Mon, 18 Aug 2025 02:34:34 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c408:a82f:ebb8:7335:2344:5a58])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3233116f46fsm10859247a91.28.2025.08.18.02.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 02:34:34 -0700 (PDT)
From: Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>
To: kevinpaul468@gmail.com
Cc: airlied@gmail.com, corbet@lwn.net, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch,
 tzimmermann@suse.de
Subject: workaround for Sphinx false positive preventing indexing
Date: Mon, 18 Aug 2025 15:04:27 +0530
Message-Id: <20250818093427.42456-1-kevinpaul468@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250702161337.69943-1-kevinpaul468@gmail.com>
References: <20250702161337.69943-1-kevinpaul468@gmail.com>
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

THe V2 of the patch was tested by Bagas Sanjaya
and Reviewed by Mauro, In V3 I made the changes Mauro suggested
Wanted to know what is the status of the patch
