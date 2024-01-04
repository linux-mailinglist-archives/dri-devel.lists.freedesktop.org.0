Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9788244E6
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 16:26:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E26389AAE;
	Thu,  4 Jan 2024 15:26:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94AF289AAE
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 15:26:44 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2ccb4adbffbso7543731fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jan 2024 07:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704382002; x=1704986802; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kR6fri6zfOqsumIMPFqXw2iWj6TDkCagFBePFWGJhIk=;
 b=ezCIr4nsBclPVmfE8g3CLIElrW5EU+SpMfRWeejOm2EE5m2xzF1Q+5k+qx8oqdf7I/
 /pICIcQYqqdWeBdF08RZm2xzSbM8i3HyEyGrIDtRlOVr0oxDHE0PR5dwKB/ui0SYNCBi
 JzvwNvq/ZOY/SdZATN9V65Ew9K2d2yPJTGIhALLnC5MXpLjPokpb50TnGuBe4Eb5DQFj
 qJpTRCVWRFE3xkewzbiJE69oBnKrXgXTI5fKkQ0O/39Mm3ytDK4pe7kdZVU6lEp7+kY8
 XxLnPSaLTQPPA/Yx1UjcY3LX+0WPJAYIHFzdAtsjkfgnIzDiqlspPqujmOucuwsnbYp1
 guWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704382002; x=1704986802;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kR6fri6zfOqsumIMPFqXw2iWj6TDkCagFBePFWGJhIk=;
 b=ujRzm9Cl9rcTyMytQv49qlyTAAqTN4As3a3IPh7lYUYjl64UTu6xKm+c7GhJagw0AN
 nBxHwR0KnPJ9lWR4QgGcdZgCsg5h3SEWtOD/tf92885HA0KLr8lAoA4qLp4Dg8ZV6E30
 J4xLMfMfng3eJCcW3CRXwVQ/jfO7gKSZY/+jUE7UPLn8VsEo/gIvwxF1LV+vio/hxvw9
 h50rEHFphq4v+spF8EOzpzCos6tC0WluCh6nSDxT8TDiZfHohtcLNXfsuWeY0L8qe31Q
 +XyE4kS8mzKRooLUjsvpXYiLQJ1V4bAaUw5Cz5xgroewe8Qo8EuBxJNH69LhHXqBz9jN
 0dDg==
X-Gm-Message-State: AOJu0Ywe/GffNlrNAQgVBY+w7+0WF+09C4uLds8ytvr3NxDXeqrW9xJn
 RDv0hqKEDAu2k1CWOyJ13iK9XSjH7oDtaw==
X-Google-Smtp-Source: AGHT+IENlCSAIUJOeRuY3KAhsacO67sooGmTlUINZ+Exrwrq129QzN3yc1GQd5n4NyrMGN7+x6vRLg==
X-Received: by 2002:a19:ae1a:0:b0:50e:7f5e:59b with SMTP id
 f26-20020a19ae1a000000b0050e7f5e059bmr380944lfc.60.1704382002669; 
 Thu, 04 Jan 2024 07:26:42 -0800 (PST)
Received: from localhost ([102.140.209.237]) by smtp.gmail.com with ESMTPSA id
 d33-20020a056402402100b0055422adeb00sm18858482eda.33.2024.01.04.07.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jan 2024 07:26:42 -0800 (PST)
Date: Thu, 4 Jan 2024 18:26:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>
Subject: Re: [PATCH 1/3] drm: property: One function call less in
 drm_property_create() after error detection
Message-ID: <b56e4902-f020-4461-abf1-563e6f8b23e6@moroto.mountain>
References: <ff7ce5d0-59fa-470c-8dd6-68dbe65c18e5@web.de>
 <9b1e7330-f4f6-47f8-a568-eaea1624bb6f@web.de>
 <37647c33-7f9d-4763-8bf4-cfc5c9a811de@mailbox.org>
 <c5f1a7bf-b444-4934-a205-3c2b3a045ff7@web.de>
 <dd300771-851f-4cfb-b9a2-d87d2b4399aa@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dd300771-851f-4cfb-b9a2-d87d2b4399aa@mailbox.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Markus Elfring <Markus.Elfring@web.de>, Maxime Ripard <mripard@kernel.org>,
 cocci@inria.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 03, 2024 at 06:18:13PM +0100, Michel Dänzer wrote:
> On 2024-01-03 17:24, Markus Elfring wrote:
> > 
> >> Out of curiosity, what exactly did Coccinelle report?
> > 
> > Some SmPL scripts from my own selection tend to point questionable implementation details out.
> 
> That doesn't answer my question.
> 
> Without seeing the actual Coccinelle report, I'll assume that it didn't actually call for this change.

This isn't one of the Coccinelle scripts which ship with the kernel,
it's something that Markus wrote himself.

regards,
dan carpenter

