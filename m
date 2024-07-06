Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFA4929400
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jul 2024 16:11:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AFB910E03D;
	Sat,  6 Jul 2024 14:11:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kde.org header.i=@kde.org header.b="Kn6+hW66";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8996A10E03D
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jul 2024 14:11:03 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172]) (Authenticated sender: zamundaaa)
 by letterbox.kde.org (Postfix) with ESMTPSA id A85C8324357
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jul 2024 15:11:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1720275061; bh=iztWN3+2yX4smGPMelPBpwqBHyjjNnLxKLBWX+5+RyE=;
 h=From:Date:Subject:To:Cc:From;
 b=Kn6+hW66wvBiSN7oqtigs66pG5jySqf85XJj5fhvznv/15KBEh+8FORVsHsDjxUmK
 fSQ6l+YT7ZX5MGfVH150YRv00W8JcePjLKnLbtpByx0Horue1JkvJMz7HDu9hrM41t
 1wefC26iAOiKjWgNWaN6dvhbH3yttZYCpW5JJiWEK/6pGSB6IWLzJJjrRZYhDJ4aKw
 gBDHjoe+W53te36U7aIXUzUs1uMLR7WpFHzB6TQKbIDSA4lRBrMjI9DM47FsBbjwpE
 dtwcJ6sxZps3lE7qNeix9iDaU8zpYC49NUVRMZHSn2snC6x4oGapGiM+aGL0zRe0Bl
 Q4cDKv60Kc+uQ==
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2ee9b098bd5so7723381fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Jul 2024 07:11:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV4LH/8tTU2NB9c5jAkgxFnJbuNlsWF3KPJVs+H7VgQPDhhV0tFFRirz4c5HFlju4u9j0UBEmSEwuc2ei3NxzdCXgYqbYvJr3a5KmbvsIy9
X-Gm-Message-State: AOJu0YxPo3NCtMT9ECQ+843ej3mMWHJNHl0bpHzof4bw3UsXtfJ0Bojy
 LfwZ+TEaI9w+mGoSc1EJL6x8fTkbfNwQAj/FsLJsoQUqWs0BkepvvBaQdwgct/N42Y6TKFUJAqp
 IQ8BqFvgNVqZ+uryfPb8f+S1MEt8=
X-Google-Smtp-Source: AGHT+IGy+3bEnpzhnQAXSTDYApJpTWtLUnp7pUj5Pj1R7Lzzs5XWuX7u8/yQEowy3VhDtHuHK2HWMtw7zBa14oPnQOg=
X-Received: by 2002:a17:906:605:b0:a6f:ddb3:bf2b with SMTP id
 a640c23a62f3a-a77ba48e721mr510262666b.41.1720274738965; Sat, 06 Jul 2024
 07:05:38 -0700 (PDT)
MIME-Version: 1.0
From: Xaver Hugl <xaver.hugl@kde.org>
Date: Sat, 6 Jul 2024 16:05:27 +0200
X-Gmail-Original-Message-ID: <CAFZQkGwz8bo3627=Hd7u9+F+p5dRjTU8MZANpiRabwJj9S5hsw@mail.gmail.com>
Message-ID: <CAFZQkGwz8bo3627=Hd7u9+F+p5dRjTU8MZANpiRabwJj9S5hsw@mail.gmail.com>
Subject: Re: [PATCH] drm/atomic: allow no-op FB_ID updates for async flips
To: Simon Ser <contact@emersion.fr>
Cc: alexander.deucher@amd.com,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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

Hi,

The patch makes sense to me, and with this fix, my implementation for
tearing in KWin can be a lot simpler. Consider it Tested-by: Xaver
Hugl <xaver.hugl@kde.org>
