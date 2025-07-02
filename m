Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4E9AF12E3
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 13:00:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1642C10E6D1;
	Wed,  2 Jul 2025 11:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YAZdm7e8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE5810E6D1;
 Wed,  2 Jul 2025 11:00:32 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4539cd7990cso18848225e9.0; 
 Wed, 02 Jul 2025 04:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751454031; x=1752058831; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=/u1TiJkRcIrwSUE5tAC+RVsrI6uEdQeH3tbAzyZ69ds=;
 b=YAZdm7e86oPkdMhTuh7t8HSr7B4u2Fva8bfKSAA24NyofsnmLYtIjb7a5aOR7SFiJM
 Qs2ec2Ho6FubiUoU6yeGgI9skjwBpkVodekCDVPmfS1KE9vKIpbMKoshTvCyoa20WGy9
 ay9G8SVVqbhHbxL+Sm+L9bLcUyWhFhEkmbRBJ7RviKZiGiPusyVTRxeEg7kN2y+yUibO
 ImW2f/JqA6ZMOxFLOcJfTacdVQ/JrV2AnuERv6q46IrdpzS7o9v23d4Wm0eRKqSDC1gI
 PaqohwnrVa/TmgfxBtb3P0XHbFgg9wh9sNdhW3VvKwvavhJ0HTUg8vKpbEIQFbZO14r2
 y9zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751454031; x=1752058831;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/u1TiJkRcIrwSUE5tAC+RVsrI6uEdQeH3tbAzyZ69ds=;
 b=IvakBqu0/8q0iMPObnsI1VrgGlOSXEQJiwYEuhTt8t+khidx6SKBUkOSySfAFAXJ4s
 65pBd1s7h1BFVWaCjpEBJX+YTF5jXPHNT3Dq2BADH+ejSeRTqkDb33lcgOuYk+ZBYNRr
 dJaXc/83hw/orJ9HcyTAxCRueel0RQ7AHUmAQl00JX0W0I3EWxlGjwBFuhcuG4STEyS1
 nSloJQzSegNPN9l8mTrrNL6syReara33H+BW7lek6TxaAHFbwxmkz+bxagL2vzxKC0ub
 O4ai+cMq2y6D1xutmqVXqU8IYM8q4k5WuEtddxB+1lEwr5XIIZlQWZaSRl+Cu5hgRaDc
 an5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQhAdG10GlNHSFv06yFufmpZUx/NkArIUgxCpvA26Uqnj7W/wm9TvQX79lZ0dF/Sa8Vv/pi05b@lists.freedesktop.org,
 AJvYcCXFkPdlSizG9EQQxvTwNcAnM0JVK8HRtssIXZMHgZwIQVEVsoGldpDVov1y2Vu1w8DikGArj6bGypNy@lists.freedesktop.org,
 AJvYcCXiTONFy51uJ1RAJWt7QndQhgqdICFKj6tZLY5eIy0EzxIsNYmXuc5pqZcyGmk2vCeycD86HRVqCnw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzAem9SDXzA9scBAFsWVn80luperyR2+VZi+1tdP2uSfrc8ILVK
 CY8ozmOYsHosirfTJ0+yTj0Wa6ZO/nN7ynR43NFWwvA6EQlxP65ENh94
X-Gm-Gg: ASbGnctzR/WkTFn93n9IgZj7Pjsj+67yCNQOjUwlMxla9DoImtzU3IlVjhmkRUPNK7j
 bYwYvXyDjQZIKKDYiIvrPqa7gKEu54izMxcgKdXVcCvqIQry0ca46+ZNglp7Hct/gUp5eqdLWNe
 eu8tuWPDzTGG7UVfAsK39ECnuICQ88PwKynKq0PLp/TdgxhYEiRGyzqIbkt0hW1IG8L+ifHPVMu
 RBnIj5scwMbEho2WRJFVDnMFdYn1bUF3/9QH3ELstT1Be3ut+j5pBPtEE0UcbhDW/o3efwVp7eq
 kqd71yMFY7pDNP9vV19gj8nELBLRc0N71hbqu9HKYpBRylJ3VWaUSZQsv1y2Zc+j0AfCnSBdDWM
 y
X-Google-Smtp-Source: AGHT+IHwnbU1S8GOvGpp8OtzutoIfRwWg11XK/OPkH80Sp2G0Q8UqC9hWCLGktIoe+LlYTD8wSprXg==
X-Received: by 2002:a05:600c:5249:b0:43c:f3e1:a729 with SMTP id
 5b1f17b1804b1-454a3c555aemr18163725e9.12.1751454030702; 
 Wed, 02 Jul 2025 04:00:30 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:158b:1e00:ab87:1cdf:ca26:fa8c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453823b913esm220664735e9.33.2025.07.02.04.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 04:00:30 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, matthew.brost@intel.com,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: Switching TTM over to GEM refcounts v2
Date: Wed,  2 Jul 2025 13:00:26 +0200
Message-Id: <20250702110028.2521-1-christian.koenig@amd.com>
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

Hi everyone,

v2 of this patch set. I've either pushed or removed the other
patches from v1, so only two remain.

Pretty straight forward conversation and shouldn't result in any visible
technical difference.

Please review and/or comment.

Regards,
Christian.


