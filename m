Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB13B6C2E6F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 11:11:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9367110E063;
	Tue, 21 Mar 2023 10:11:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F8310E063
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 10:11:52 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id cy23so57360515edb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 03:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1679393510;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=OUPpl6aKyx6QD1Ug1OwVixqrqsFEd9FEYWhdA5KB9Sg=;
 b=heGmmUY/dXbTkW5JhXgypLyaFA04g9huJ3+68DC+Jq5wYtu8abzI+qJf+okCr5Dj7S
 z42GDMNcEoYZ9Mnk3MEdD8qK50xUmZDreKzTdza3RhohUU1PZd8jn0/Qbai4NjVhSLkt
 AvAGOWWGC2AZnqazBoOjkfLxN9LOdex7poI9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679393510;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OUPpl6aKyx6QD1Ug1OwVixqrqsFEd9FEYWhdA5KB9Sg=;
 b=uqFfbV9n7MtUazIUi+zMFHXE/5ccDvJ2EkNMjV+qZKzkkgP1cWd5RqXxueNUwTz/aq
 VTGlpDmZUhJMu2eoRAZ/0+9oGVOMzUlVMXSJU8Uteifv76oNLPzuUVI/6ly2dECYQTRj
 5ul3Qbn4Se2qVke1otipi9kTN1foUy5MMcTYmOLy8o5YKdanniv/HJUsbjVNb9HDlvN6
 i9rjPmRtNOlwZ3IuOk1ZCeV/kuq9cS8rFmQgAQwF3Cg4OMSRmQYCqr8I0tr7ax4K6Hht
 9FCqL1vzDLSLGFPZbPLvrLph53CkJHj5yiNvai79imVUyyqDmgJ8NFkUhVkHkbLttJl4
 a0xw==
X-Gm-Message-State: AO0yUKU1EL0wJneJZTMOkJWjb3TdYYkOeU1AteezjT4T97YVsNQoxskL
 jOkxzMClIn0H3EjfoiY87PMzuhRWfbvU326kRRbI387LmINuZhvlCjA=
X-Google-Smtp-Source: AK7set+gzIyEeyeA54Myw4sGjpE1UYEx8xQqnrf0y6Cm3Wv7ufqjr6D3PStyrciMbjCYyWYn6yzdVhEslM2wfACu93A=
X-Received: by 2002:a17:907:1def:b0:877:747e:f076 with SMTP id
 og47-20020a1709071def00b00877747ef076mr997305ejc.0.1679393510262; Tue, 21 Mar
 2023 03:11:50 -0700 (PDT)
MIME-Version: 1.0
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Tue, 21 Mar 2023 11:11:39 +0100
Message-ID: <CAOf5uwkDb=pkEV_qSshA7PnSxCV82sEwrmivAZhth48ae0S++g@mail.gmail.com>
Subject: display band (display area vs real visible area)
To: dri-devel <dri-devel@lists.freedesktop.org>
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

Hi all

I would like to know the best approach in the graphics subsystem how
deal with panels where the display area is different from the visible
area because the display has a band left and right. I have already
done the drm driver for the panel but from userspace point of view
it's a pain to deal in wayland for input device and output device. Do
you have any suggestions?

Regards
Michael
