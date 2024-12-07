Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3E79E8287
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2024 23:36:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA42F10E084;
	Sat,  7 Dec 2024 22:36:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iq908tlJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA5910E084
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2024 22:36:24 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id
 e9e14a558f8ab-3a7d7db4d89so13078185ab.1
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2024 14:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733610984; x=1734215784; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=urI7US1zAMf6eOuwKNpt419Njn9MCMtobiUqyPiJ5WQ=;
 b=iq908tlJZq+A/XYocZFhNcmhK2+A/UfLMqeWIK0q9kJ8EFR/I2C7brK5qG/TgyZNmZ
 AmGKJ5OgPe82664lgPs5IFvJ5tnFgRy2o+Wi+Bty/hghmcf/btpokkKzJw8qcJZpeaGz
 ZmhfKbaGiYc86YcRSEM+GvBQ1moXh+2T5gAv74hATwFaO0++UH5Vj/zS0ZYldinj3b9x
 qtIcYQmqJzi5pzaSPLRQsqQJ59zQyJk4jokWGJTe8ES99JdEr7PlzW8oBkzyBANKH5t7
 5ewZL7a1+r+/87VDGdGL1vznOy7VjiB1emIf+dM7xSqpkdsPMIbuz/ruTVbwhC+6vwN5
 tj8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733610984; x=1734215784;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=urI7US1zAMf6eOuwKNpt419Njn9MCMtobiUqyPiJ5WQ=;
 b=KwDhsEeevev2lJW9ARL5R75R5ICYvhue3NFtFkvklSUBVNJz4jbt/NBkqVssQeYnIQ
 Rux1R1wjnhrTGoTXhXhStL8opSuIOthLJdZQOtUB7y1xP7XQDg1jvnXNbVHnqx6m0Bi+
 E70p7IcNyQ7heZsaaYlmLWT/+gg1q7OwKxwKJ3pgA88m3FZntm5+LVdZohLrkOMvNuob
 WyLTEitJ1Fec41BZGqwsNDSxB7Wa2nSjBJ4d3yQxpuiOOZ9qGwDDK2vAhK2hKe17YXJ9
 nQ8DcTPGqK0lfjC6gsEfCUGE2zdVYvNDLRwTlkD7bW3RK3N91WCj+wgiUDkjrwx6Mu5K
 v6pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6/4Z6E4fJ4pSUMjpE/UgK2Ietu1fDkRWyeRCKanNmFFQ5XJxnapEgIS+AyH/Sucf2SoKfYPlabR4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yww2y2PYA5wXOG7gENTrjQ8+GYa4FN14bKSBQtw6puVZTu7gKWW
 GYjP2Nlp9A479Ax7o32qe4F0kf6yH1mf8j9NaAA5N0QBrAmab5punjkLVox2UfYGkrAk2tC9xW0
 ZZvn21gEOqEbHtyzNZIRrHRKewgA=
X-Gm-Gg: ASbGncvRHJRM+E1nmiKOS8NeYCFEloU9C72BofJAf/qZMzSs6d4NUzHsviAfiB0Vzl7
 6Oq9J60bPq6GUZjOe6UO2F9ijVhk=
X-Google-Smtp-Source: AGHT+IGxzU83LUpVfJxMuU8ObhncHI3dIWYNbBVPEPvjuESw/sHk10gB7/kPZJqaK7jk0SPcqqX5+a98M+3fxcKvZ44=
X-Received: by 2002:a92:c563:0:b0:3a7:6792:60f with SMTP id
 e9e14a558f8ab-3a811c799a7mr92656935ab.4.1733610983875; Sat, 07 Dec 2024
 14:36:23 -0800 (PST)
MIME-Version: 1.0
References: <20220621104617.8817-1-tzimmermann@suse.de>
 <CAEXMXLR55DziAMbv_+2hmLeH-jP96pmit6nhs6siB22cpQFr9w@mail.gmail.com>
 <d2562174-eebe-4462-9a9a-03936b3bcf89@leemhuis.info>
 <b4d28b98-a85c-4095-9c1b-8ebdfa13861c@suse.de>
 <CAEXMXLQEJPVPyqLpH6C7R6iqhhKBpdNS9QeESbEdcmxB70goSA@mail.gmail.com>
 <da4288a6-96cc-4095-bd73-d66b68e9ed01@suse.de>
 <CAEXMXLQw1yqUGbWcrKZdOuGvA4eZMG0utiyQ2PVRvTeuFedGbA@mail.gmail.com>
 <9c902ac0-a94d-4465-98ff-840132e482b1@suse.de>
In-Reply-To: <9c902ac0-a94d-4465-98ff-840132e482b1@suse.de>
From: =?UTF-8?Q?Nuno_Gon=C3=A7alves?= <nunojpg@gmail.com>
Date: Sat, 7 Dec 2024 23:36:13 +0100
Message-ID: <CAEXMXLSLau0sEy8WSZ3=ofK97xP8aPcDQEnT=JFkkt7K=Rzivw@mail.gmail.com>
Subject: Re: drm/fbdev-dma: regression
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, 
 Linux kernel regressions list <regressions@lists.linux.dev>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, 
 Linux Framebuffer <linux-fbdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Dec 2, 2024 at 12:18=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> Thanks for testing. Attached is another patch. It attempts to restore
> the fbdev handling as before the regression. Please give it a try.

This one fixes it for me. Thanks
