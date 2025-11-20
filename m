Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 061C4C75525
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 17:22:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E6C610E783;
	Thu, 20 Nov 2025 16:22:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AQCVe6ac";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC31610E783
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 16:22:42 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-78a6a7654a4so11139087b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 08:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763655762; x=1764260562; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yd7ElyC8hNAN6UxXUzLg/ixBrwdD5Fw2fjCcLcS/Ktk=;
 b=AQCVe6acFgxiuik4W+ZXyPdvag0DhkuBPmEGriug1KIZdohuHuyZyZGaNOOwzY7Cuf
 E+ipEKuoIEfz5CwgazQl5vhIJOjBRHCaX81a5kFyakyiYGDni6mL68nkwjY819EP7Vly
 68A1ttbGVzTvtH16pMBgcVnQB4CXa7euqR5VIDwL9/Yyyii0FpO2RKVV04DQNEMxYBA4
 cMDWhJS+503Zqf1Kaf7upJHripJB9FcYK5WkXn5ErBW6Xs6TBSgQspBH2mGH9ycmB5lR
 9uh/bsruPqP9FmZ8ZaQCAbg2puw6mHhsg/Nn3iVJQyMm6rAoPKNxhfrPETpE9LwVdU9I
 Ohsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763655762; x=1764260562;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Yd7ElyC8hNAN6UxXUzLg/ixBrwdD5Fw2fjCcLcS/Ktk=;
 b=rZQZ9XvGGgZrM3x+CfhQatfJHnTFPifvHszks7JSQg0G/w+820Kz0hEfUawEshmJB5
 3CJhf31a2h89zTYHiBBmDouOZtkaLiuI2aRtI8264QZvyh0SMSnCEDf+/jVMZKMYa2/n
 E4WPLbk8aSCfguMww70Y2AElyATrTXhC4+DTj6MfVsOeXJEP1cIIaLZN8UgWxNRjbJBB
 qD6xlUZ6932oeAGUVAIgB6sHhuCYvHsaNh9rFug7Y22C9nsPHhGc9cZHpTHSiaVlyzVC
 zw9zFfHbQRH+SL4SAAIn/KPCqCC1c/wb6hdJ6ZmzKH797SvUYoVFKh0V9j75q2L1k01h
 jIug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUj04BneT3Ul4/EEa3PHJt8g6Sr+jSK83kMQbrT25icL2+7/9o3Uyb3A+tzoYrzx/Yf5kQzd3qSes=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHGCFHDHhMR+jxDB4zxnfwVFb2Q09rmqDZ+2z81mV1y28xnRyR
 dtyANzMhYoAxEid1wdEZH2RhyYEC050NisyykAtZ6FsmvdsZEvVRMGvIeObU3OW/hNo2JWnTDj2
 ATyRYGifPz9QDiBTZMuagas69bdZYrgDHxTrh
X-Gm-Gg: ASbGnctkiZClovBjJckm73AKHfxDO2sGOykHF89BWrLacZQ0/lI1vtFSNVHqXev679E
 AayI+lzCxv6JTWOa/HCngMzDfDvVgMLAA9xYqEOwgFCqm9aI0kdKJfnQkXQaDjJ9AcxqqWog54l
 Ic3hDmz4mtR59Mb5UKuE9kp3dx2OLjjrcE57aIffBg5eMYRkjLoTkT2PFc+ttj8Wq+IGYO5IDxx
 Tea1ZZ9OjpG8q0wANiYlPg95tiA0LgO8sSIbX7u7rrsnGyv5YyzeGYo4Ksg75wMP6kj5GMUsJAZ
 2H3SXgo2VEeukA==
X-Google-Smtp-Source: AGHT+IFq5A3u9+F1TokwS5dUKdaBBB62w3CmlDYwEHoOqj7Ok50heHQTQwF4tD5d3aQanYGQe9sdpFSOXi4WfFNLYds=
X-Received: by 2002:a05:690c:6f0a:b0:788:20ec:aeda with SMTP id
 00721157ae682-78a7ac3bc0fmr27834947b3.68.1763655761627; Thu, 20 Nov 2025
 08:22:41 -0800 (PST)
MIME-Version: 1.0
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
 <20251118201842.1447666-32-jim.cromie@gmail.com> <aR6GQeLW-sh9-A3W@archie.me>
In-Reply-To: <aR6GQeLW-sh9-A3W@archie.me>
From: jim.cromie@gmail.com
Date: Thu, 20 Nov 2025 09:22:15 -0700
X-Gm-Features: AWmQ_bn4xc_q45O1CPWkB7PGXFRHp_9VQPJxDn7Om1tvqeP31kDpnK_d4gkFAtk
Message-ID: <CAJfuBxxKM_4nxm3YLeCqiDpb5TBB_Hrx0UWOtASTRLBbKmH6Og@mail.gmail.com>
Subject: Re: [PATCH v6 31/31] docs/dyndbg: add classmap info to howto
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 gregkh@linuxfoundation.org, jbaron@akamai.com, ukaszb@chromium.org, 
 louis.chauvet@bootlin.com, linux-doc@vger.kernel.org
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

On Wed, Nov 19, 2025 at 8:08=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
>
> On Tue, Nov 18, 2025 at 01:18:41PM -0700, Jim Cromie wrote:
> > diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Docume=
ntation/admin-guide/dynamic-debug-howto.rst
...
>
> Hmmm... the resulting htmldocs looks messy so I clean it up:
>

thank you.
  Ive absorbed your fixes into my copy.
