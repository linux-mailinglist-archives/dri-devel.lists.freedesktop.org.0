Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 518176D4D82
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 18:24:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 945AE10E529;
	Mon,  3 Apr 2023 16:23:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 931E910E50A
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 16:23:53 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id m8so6541569wmq.5
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Apr 2023 09:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tessares.net; s=google; t=1680539032;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=sLbSiNRsKWqCzdZcwUoUNgk3CV0rprb5ejaACgf2prg=;
 b=Mxhnw+xQ6KKG6PnQsr/Vxp7w4V6qBj09vw1czow7R9Giy1wpvwYXExtlV7amfrcxrv
 RRQZwHNxWsvxoGXx2/G9c+lt8oRQj894cnFuvXlpriaofZXN6dS8tDHUTEWf8CjDGf8R
 nMD1MwuM6pexhAP+njybzWbfntGt/copvvOmQ1H6TDwx/fLG1xpzl9OIN/qCyXtgW6Ck
 WVyw/3frZU/DMFMUsTQ5n8zsphGBjRg8AOTs7e1j1CJwHigvV3OJ1xxkJuZT7N6JBQc2
 Nz5hfVkycRmtElrX9w5Avs/21KmRcdhQ+pUzBNCEYq3rGePDggteBzTPfb6lrJvzLaRR
 rXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680539032;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sLbSiNRsKWqCzdZcwUoUNgk3CV0rprb5ejaACgf2prg=;
 b=nUooTk2C5mCAMLfRl/HBXmNBe6IRBRi2grbEwDBIpituJRi45NIioe6iFL581QBr63
 34f/Uh+NrnelZtLDSx6Zy/F4PoOoPsd8f/tnYiSZ7X4IlxGGJf4wNFj455K6eqDXUweP
 MG8siMUPcmNozI6Q8Df1a0wZ2JZaxYNdSMXjKBilsuFbWpiIvn8+HzaFb7HgZ2303TEI
 B9VxfwWkCNzLCmdXgHpr7z3Ovb3k4Y79mL5Gckz6U0eaPBFpNr0uxbXSJY2z/T/ix446
 8tEp3kzMFfbJKca/uk4lXl0e0tBbH0hxRCarPf+XZxGJ4BrFvuDChndVJ2exJD7mevZh
 jcxg==
X-Gm-Message-State: AAQBX9ftIKc9cl1tISmakjNP0AAvxQXBsbarg9IDh+9nW0eM8zhMsDNC
 RMciIwA0HaqmIotP2II9NLfkJg==
X-Google-Smtp-Source: AKy350ZIhsJBFW5GubL7C8OsVZkFTa1mlVtSwVB51FJQkgDlCo7F/GNE9Vk9g+hGGQoWOVkFmnTJqw==
X-Received: by 2002:a05:600c:b51:b0:3ed:2a91:3bc9 with SMTP id
 k17-20020a05600c0b5100b003ed2a913bc9mr71024wmr.15.1680539031787; 
 Mon, 03 Apr 2023 09:23:51 -0700 (PDT)
Received: from vdi08.nix.tessares.net
 (static.219.156.76.144.clients.your-server.de. [144.76.156.219])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a05600c45c700b003ee2a0d49dbsm19829116wmo.25.2023.04.03.09.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 09:23:51 -0700 (PDT)
From: Matthieu Baerts <matthieu.baerts@tessares.net>
Date: Mon, 03 Apr 2023 18:23:47 +0200
Subject: [PATCH v4 2/5] checkpatch: don't print the next line if not
 defined
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230314-doc-checkpatch-closes-tag-v4-2-d26d1fa66f9f@tessares.net>
References: <20230314-doc-checkpatch-closes-tag-v4-0-d26d1fa66f9f@tessares.net>
In-Reply-To: <20230314-doc-checkpatch-closes-tag-v4-0-d26d1fa66f9f@tessares.net>
To: Jonathan Corbet <corbet@lwn.net>, Andy Whitcroft <apw@canonical.com>, 
 Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
 =?utf-8?q?Kai_Wasserb=C3=A4ch?= <kai@dev.carbon-project.org>, 
 Thorsten Leemhuis <linux@leemhuis.info>, 
 Andrew Morton <akpm@linux-foundation.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Bagas Sanjaya <bagasdotme@gmail.com>, 
 Linus Torvalds <torvalds@linux-foundation.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1457;
 i=matthieu.baerts@tessares.net; h=from:subject:message-id;
 bh=K3cjNbV9tUlSWM4bnvbSgWdjh1Zoz6cfbrBe3P7xpF4=;
 b=owEBbQKS/ZANAwAIAfa3gk9CaaBzAcsmYgBkKv2UgvhwReqAHut5rSYlb6gkdkA+ymQEB79mc
 ux2STszGiOJAjMEAAEIAB0WIQToy4X3aHcFem4n93r2t4JPQmmgcwUCZCr9lAAKCRD2t4JPQmmg
 c9zpD/9Zn9Kd+V59Exp4MDR8um6ylr3dkGhOgdQbkW1v/XOZI2M44kiNB7XTXQ+nw10k0gxnzSv
 Cn3M5xWghoIK6rtlkEWOoqK3+fiYdgQIqNyV8CDYFtsyr0S/HaxPKClYLYNoC+HQ3dRu11EM3vl
 bxPSXjYIaVSK64AEaxkSpmLNN8MuTZhU6kVMAOyB3gv/jYSOr/2kNCE+WoTlOONTtpqlXp3sFnp
 sNHTSDZgFA5BjIy5on1kfOWK1N6C0RGjNgLC53/NOD/OYu9xLFtdgJZwAMUXL7267eUTJMk8oTQ
 u2LbVhoAmhJn6ZWw1ga1Imao93Hezg1AwwhbQ6nizbOEoZYP+383m9ErD02A7BGACCF8tniccqB
 lqeVV5gRgQzhRGCp9nGvmhKF+DRdIu95XoT1z0H8p1UjcOjCMdLrCfqJKU0vQ8riELAMSUZ8U0o
 CCPbw+bTL2nq2tWKoqer1z65lFhUa6boCqRPk7Z1E3XTqN/qg84GmgztTiF7Vkuipp0emNXwXcy
 8hQv/pyCFdpaALFfHT0eDDROgyXhKT1QrsuLO9SpsErqdfM6wr8bYuIagVeGe1JlwJiE+me+Dwf
 4Izt4nfeoDBFOOvdksRXPlsxWNbt5W4lZdFRx2kujwavImkrvxLnS1jOxUeEqzmwtevz01qNTj3
 DqR+9hHRWNlTxpQ==
X-Developer-Key: i=matthieu.baerts@tessares.net; a=openpgp;
 fpr=E8CB85F76877057A6E27F77AF6B7824F4269A073
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
Cc: Matthieu Baerts <matthieu.baerts@tessares.net>, mptcp@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When checking if "Reported-by" tag is followed by "Link:", there is no
need to print the next line if there is no next line.

While at it, also mention in this case that the "Link:" tag should be
followed by a URL, similar to the next warning.

By doing that, the code is now similar to what is done above when
checking if the Co-developed-by tag is properly used.

Fixes: d7f1d71e5ef6 ("checkpatch: warn when Reported-by: is not followed by Link:")
Signed-off-by: Matthieu Baerts <matthieu.baerts@tessares.net>
---
v4:
 - Add new patch.
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index bd44d12965c9..b170fc7ef258 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3162,7 +3162,7 @@ sub process {
 			if ($sign_off =~ /^reported(?:|-and-tested)-by:$/i) {
 				if (!defined $lines[$linenr]) {
 					WARN("BAD_REPORTED_BY_LINK",
-					     "Reported-by: should be immediately followed by Link: to the report\n" . $herecurr . $rawlines[$linenr] . "\n");
+					     "Reported-by: should be immediately followed by Link: with a URL to the report\n" . $herecurr . "\n");
 				} elsif ($rawlines[$linenr] !~ m{^link:\s*https?://}i) {
 					WARN("BAD_REPORTED_BY_LINK",
 					     "Reported-by: should be immediately followed by Link: with a URL to the report\n" . $herecurr . $rawlines[$linenr] . "\n");

-- 
2.39.2

