Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0C1CB2834
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 10:16:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6716A10E232;
	Wed, 10 Dec 2025 09:16:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mdzZYIIT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF2C10E64A
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 02:06:46 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-340e525487eso5004634a91.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Dec 2025 18:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765332406; x=1765937206; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=dB4MkiK2v7MqEATSP66OXrd0I3cuJgQCFm92qrJ2lJ8=;
 b=mdzZYIITnDbEmLEsXsNVzXqM7HrK9asoJgbxEVxyBdLrE1Nrn36ArnuOZi65gP1MZx
 5DRI0JgM3y/XrLMkIlmnCKJk9AK5sY6Kyis1Xe2hgzw8YprqaFR2xfJkA3wlI3RHmpHk
 LdzfKCnb4vxxQTawnHwQuwGB27NDU0amzNMtP3tAheR3JckmlgGudOvzBMpnhfJiEepJ
 /jRZODYtcjNxAhKe/sCXYCmshhsN8FAt1rdbQmemapQrwsmlEwCDN37barZ3eTAbKPxa
 DqEXO2ohLVPe6xLK0X9/jG85xDMlE5EYQtQ6jtOgJkhwzSpCMMSa0+Gk8Z9j8aTOY4qX
 gh0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765332406; x=1765937206;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dB4MkiK2v7MqEATSP66OXrd0I3cuJgQCFm92qrJ2lJ8=;
 b=WMidBr9nI7JiDPjsZkUOoyOP1X0/DPdh/mJZZ3MfaNhKYbCcit4FHdMoo3dfHR66h8
 YzJID5Yfnwa7xI5K0le4Qf07H08jGEai230VP7HHsgebRoDD56S7w4Cv4jpZq9R1E+Xe
 B5BlzCiY6VlspfcW8AQ3l59WvaxWdH6NFUNYYamgd/4Rt94ulJPIOksz5kPakESgTW/9
 1W7qxzZJV0QRn9QpVcUMo4oj6G5761Az4KUrNq5gjbu7flQYOah1lXsjKEX5QuuXeMGz
 DA+w6NIhF6TZcISvO0Egt+bVOudPklIJ74WW5mwJ6PtijEy9EMuhIQYJCe+tZeiV1Kx+
 7dVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqzst2Hd0lmykRXggK+NCSVryEkZwU4W/RHGGtfEcYt29tmNzNiZhlZvWO6NPWKVdXPIpYmrquODQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3DSRZWP7TJbVlZcC6izsrx1dM9F94X0XrJdh+N7EGzjTM5AJy
 9mhJx+MSGeS8zvk0t6zfGmfBHct5/uU66tLz64ITKqK0EM4AAy68r/l/q4sGQ4v6MSOrWkWZxYL
 7ayCdWQeUhXUS0X7AfxrEIGU3Gd9ZWSI=
X-Gm-Gg: ASbGnctqo2QVORBrrnwO/BYLFIsyrpLImD068uvvbalgRpBwMqV5JRqynSnXXltFl92
 NAm4Yp1nayfLn7DGOz8isWNc15MP9XR0FvnJa0qOXWCVoCvYNqpOFQ+/JJO4kQcXkjA/y2aazS6
 JG3C38fw+e3lX0mqS7zupR3ZsFqTL3Ryk0fKmNACP8a+/kP2CYWwgs3dBD6ZbtnDHJfTrckSGP3
 x3zeNKVPyX38wDMl7efhwtEHMtzex66mKwq82TFW7VtXs5QJtw2qMW5ZeDK9e+bAp96+5t3+cW9
 XtchQfpNnDDipqMtXPJB/lYV4OemTJ3ElmTOfMjEL6aEeDY+a4MQpqQm6a1SfNy3EDF9dEV8uEl
 6MJt63O9eDEkGuJ4=
X-Google-Smtp-Source: AGHT+IER/q69FCL4HOlCuiPXSy/9N7+BJvlaJ8gV4++EQVcJdhe5QlTVR4toTFk0WEj9Sp4ps54/Zo8eUBI6B3SlAAg=
X-Received: by 2002:a05:7022:412:b0:11e:3e9:3e9a with SMTP id
 a92af1059eb24-11f296f4d4dmr601926c88.50.1765332406102; Tue, 09 Dec 2025
 18:06:46 -0800 (PST)
MIME-Version: 1.0
From: Avraham Hollander <anhollander516@gmail.com>
Date: Tue, 9 Dec 2025 21:06:35 -0500
X-Gm-Features: AQt7F2q1xvMw5Tfz9hXQre8HX4NLZBs_1JPIE2kAknJGpjV98GmMptN_Tf5kgB4
Message-ID: <CAP1mzZSH+VPhA5_53+LxSgOZe5JHqFP_uadWTpgTxrEXBc=52Q@mail.gmail.com>
Subject: Re: Bug#1054514: linux-image-6.1.0-13-amd64: Debian VM with qxl
 graphics freezes frequently
To: carnil@debian.org
Cc: 1054514@bugs.debian.org, airlied@redhat.com, daniel@ffwll.ch, 
 dreaming.about.electric.sheep@gmail.com, dri-devel@lists.freedesktop.org, 
 kraxel@redhat.com, linux-kernel@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, maddog@mir.com, mripard@kernel.org, 
 regressions@lists.linux.dev, spice-devel@lists.freedesktop.org, 
 timo.lindfors@iki.fi, tzimmermann@suse.de, 
 virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 10 Dec 2025 09:16:40 +0000
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

This is also happening to me in Debian Trixie, with the current
6.12.57 kernel. I can also test reverting the commit in the near
future if someone else doesn't get to it first. For now I'll just use
virtio-gpu, though it is a little slower.
