Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D2A7E92AF
	for <lists+dri-devel@lfdr.de>; Sun, 12 Nov 2023 21:33:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B5610E0BF;
	Sun, 12 Nov 2023 20:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ABF410E0BF
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Nov 2023 20:33:24 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2c5210a1515so52619691fa.0
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Nov 2023 12:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1699821202; x=1700426002;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=PyC1nR2+1KOgDTeitjMxXYmiTa5//EBoJYZ839GCYBc=;
 b=DIHZKKNyOAMmZUhHM4EEr/YU1WJ2krIG8MdWyuBw5z3CEFblSWlbSK2EEP6NfXqw+x
 eUTcaJ4ZAJCrSrMdYAs/+EJUPaUrClbY2lHEnj5NJ8BT4eI8Oq/5HhgERUTPtWJUA+Os
 BDlqXoBqQwKK/9nRfw5KGlSbDFhzQU8HT1g0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699821202; x=1700426002;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PyC1nR2+1KOgDTeitjMxXYmiTa5//EBoJYZ839GCYBc=;
 b=NRVeIlt9yCNZtrz3/5IpU+2DWaq1GCkk2OkymCX35mVxdE8o3LMv3k+aeE+YZke9th
 mdcT9DZIrs+IjL/bVPxpDUYkqZt06DbHtEWbAyyPpEWriAERdDFl+1SWh977NMvmptRQ
 IL7ziNixHofl8r8GmAD9K6IvekI7G8nfJ7R+m0dOAzMIcspWGZ8fQUEf29AJEVRGjQ1s
 WWGzkjuQ17NFkZeJhH+MTlZ19Zjd0alQXREi5bVizJUqLPSL3XO8VYTmJ8LuLDvlNIWr
 aYVDAYqj1WLQyIf3VFDykInOhPPNXKsmzy3f2n2JsWvuI4IkksMSUqnxNhihAByJCTQD
 zERQ==
X-Gm-Message-State: AOJu0YxT+n9u7BCm6UeXpOc+nGT/FtSXGzh4Nol/vsiVJnCLPJPebORI
 bWrowICN+7YlvzyQAAP+lFLNy06R4p2Z4lTfJs3W4A==
X-Google-Smtp-Source: AGHT+IGjQ7UR7RK4Z12EsLxqIG5H2HoQEkr5BKpTw4+VEsxtBAdS9FxAjrvmX/3Je28NZhb0pvh3kA==
X-Received: by 2002:a2e:8310:0:b0:2c6:ef8d:b49d with SMTP id
 a16-20020a2e8310000000b002c6ef8db49dmr2979223ljh.24.1699821202302; 
 Sun, 12 Nov 2023 12:33:22 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com.
 [209.85.208.182]) by smtp.gmail.com with ESMTPSA id
 h15-20020a2ea48f000000b002b70a64d4desm729871lji.46.2023.11.12.12.33.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Nov 2023 12:33:21 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2c5039d4e88so52423831fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Nov 2023 12:33:20 -0800 (PST)
X-Received: by 2002:ac2:47fc:0:b0:507:ac56:66a0 with SMTP id
 b28-20020ac247fc000000b00507ac5666a0mr3043577lfp.56.1699821200232; Sun, 12
 Nov 2023 12:33:20 -0800 (PST)
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 12 Nov 2023 12:33:02 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjTGzKGcEmSW98j7kZin71x3yLFEuQS-2VP2pB+qxCwoA@mail.gmail.com>
Message-ID: <CAHk-=wjTGzKGcEmSW98j7kZin71x3yLFEuQS-2VP2pB+qxCwoA@mail.gmail.com>
Subject: github version complaints about the gitlab CI requirements.txt
To: Helen Koike <helen.koike@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>, 
 David Heidelberg <david.heidelberg@collabora.com>, 
 Vignesh Raman <vignesh.raman@collabora.com>
Content-Type: multipart/mixed; boundary="000000000000d326680609fa7692"
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000d326680609fa7692
Content-Type: text/plain; charset="UTF-8"

So every time I push to my github mirror, github now ends up having a
'dependabot' thing that warns about some of the CI version
requirements for the gitlab automated testing file.

It wants to update the pip requirements from 23.2.1 to 23.3

 - When installing a package from a Mercurial VCS URL, e.g. pip install
   hg+..., with pip prior to v23.3, the specified Mercurial revision
   could be used to inject arbitrary configuration options to the hg
   clone call (e.g. --config). Controlling the Mercurial configuration
   can modify how and which repository is installed. This vulnerability
   does not affect users who aren't installing from Mercurial.

and upgrade the urllib3 requirements from 2.0.4 to 2.0.7:

 - urllib3's request body not stripped after redirect from 303 status
   changes request method to GET

 - `Cookie` HTTP header isn't stripped on cross-origin redirects

And it's not like any of this looks like a big deal, but I'd like to
shut up the messages I get.

I can either just close those issues, or I can apply a patch something
like the attached (which also adds a missing newline at the end).

I thought I should ask the people who actually set this up. Comments?

               Linus

--000000000000d326680609fa7692
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_lovxkzqq0>
X-Attachment-Id: f_lovxkzqq0

IGRyaXZlcnMvZ3B1L2RybS9jaS94ZmFpbHMvcmVxdWlyZW1lbnRzLnR4dCB8IDYgKysrLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9jaS94ZmFpbHMvcmVxdWlyZW1lbnRzLnR4dCBiL2RyaXZlcnMv
Z3B1L2RybS9jaS94ZmFpbHMvcmVxdWlyZW1lbnRzLnR4dAppbmRleCBkODg1NmQxNTgxZmQuLmU5
OTk0YzlkYjc5OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2NpL3hmYWlscy9yZXF1aXJl
bWVudHMudHh0CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9jaS94ZmFpbHMvcmVxdWlyZW1lbnRzLnR4
dApAQCAtNSw3ICs1LDcgQEAgdGVybWNvbG9yPT0yLjMuMAogY2VydGlmaT09MjAyMy43LjIyCiBj
aGFyc2V0LW5vcm1hbGl6ZXI9PTMuMi4wCiBpZG5hPT0zLjQKLXBpcD09MjMuMi4xCitwaXA9PTIz
LjMKIHB5dGhvbi1naXRsYWI9PTMuMTUuMAogcmVxdWVzdHM9PTIuMzEuMAogcmVxdWVzdHMtdG9v
bGJlbHQ9PTEuMC4wCkBAIC0xMyw1ICsxMyw1IEBAIHJ1YW1lbC55YW1sPT0wLjE3LjMyCiBydWFt
ZWwueWFtbC5jbGliPT0wLjIuNwogc2V0dXB0b29scz09NjguMC4wCiB0ZW5hY2l0eT09OC4yLjMK
LXVybGxpYjM9PTIuMC40Ci13aGVlbD09MC40MS4xClwgTm8gbmV3bGluZSBhdCBlbmQgb2YgZmls
ZQordXJsbGliMz09Mi4wLjcKK3doZWVsPT0wLjQxLjEK
--000000000000d326680609fa7692--
