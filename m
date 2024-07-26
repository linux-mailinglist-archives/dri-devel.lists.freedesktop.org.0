Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4643E93D747
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 19:05:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C080F10E267;
	Fri, 26 Jul 2024 17:05:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="swInJ+e2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F8D10E267
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 17:05:27 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 46e09a7af769-7093705c708so1154239a34.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 10:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722013526; x=1722618326; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7g3uZE3B1tHEr6x/n8vqQ5xj8tJN2flPcuVZUC5ZD/Q=;
 b=swInJ+e2+Up20mnOffdaclJvyqvnFmT+vWwcXHyG78Bz2pi8ohey8dDk9rz6Ha9iFD
 Hhm4l+q9QGEtKupzCdEGxnf5Ja2tV1ZGQhRu3A6/3Zp9ysvB2LYUzZ6RgdxEJZl5QbFQ
 +owxuBJ0WLvul7MitO+lZWd8wEkYIUUloPO2om8FTq/XLlvDJbRV2cMexmU1HJe93EvG
 m8jJewSh1ZRMxCLRns6oReo93ozqIA1bnuqc3eSipO0q4whXJcajn46xyr6sep846w9K
 SJlc4XaOUWpxnB0lKvJcWVS5dyXuE3VqZWAO0WI2EU1Hoin4iZn5VVDHuGMqxxR5+pZn
 dyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722013526; x=1722618326;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7g3uZE3B1tHEr6x/n8vqQ5xj8tJN2flPcuVZUC5ZD/Q=;
 b=H2jkCkm+yQiEvDahnzBNfM083aGYJhi2FijcX0o6NJ5BZfrdwuNbqrMWSC+3aQTqOa
 i/1K2glpjpcePUBCGl1NrmYpzuo9+MTZCNHi/Slgupi7Gtk/vnTk+ILSfv09XjeSz/DL
 mC/LF+5NfJDizWelCRHm+kW9N+C7MwjCPCg8fByQeI+lIijXgXC1kdYl6GRREj3hQFqJ
 XBd1KWBIvmuc20B215MvpO7p9zC4uSV18U8CjF0jJ40VhuJeNA9N1Jzqlv1yEdAUkKbU
 WIFN4ECiQJ3SPbajSA0Fwb4NB+ipIgJ0D3LZXEgtH4mwu4iP3Iv9kUjR8fX5QpaN/8DW
 hfAA==
X-Gm-Message-State: AOJu0Ywgv+xYpdm/RNoH2dQx4ln86qobf4MBEu2bcBNZ/keM+apHaaLw
 Ij2ksbN6tPbxX6ckzetP61Bmp9cFw1q6Gt/peFow5TCFjupkTyDCVSk8V81LH8c=
X-Google-Smtp-Source: AGHT+IHBrp2264nEll0lxsiOyCpb1iYiLZ8i4xZTRjz5SxDR16mWdqSjhByN0LQCtSQP7wlqJKJgbA==
X-Received: by 2002:a05:6830:498d:b0:703:638a:7dd2 with SMTP id
 46e09a7af769-70940c0fe1amr306767a34.10.1722013526605; 
 Fri, 26 Jul 2024 10:05:26 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:928f:fdbe:c604:7b3f])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7093050a35fsm812936a34.6.2024.07.26.10.05.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 10:05:26 -0700 (PDT)
Date: Fri, 26 Jul 2024 12:05:24 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomer Tayar <ttayar@habana.ai>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [bug report] accel/habanalabs: enforce release order of compute
 device and dma-buf
Message-ID: <8af94906-6da6-40cf-a1de-d969c5469028@suswa.mountain>
References: <71169637-1e35-48d5-ba04-161d30073495@stanley.mountain>
 <cc6716f4-10e0-4f64-b64c-a3e41e1f7113@habana.ai>
 <d70342ef-2b52-4f26-953f-8c924c20b1cd@suswa.mountain>
 <411dd184-f71a-4d0e-ba82-068a1f0c9206@habana.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <411dd184-f71a-4d0e-ba82-068a1f0c9206@habana.ai>
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

On Fri, Jul 26, 2024 at 02:56:04PM +0000, Tomer Tayar wrote:
> 
> Okay, no problem, I wont change the code.
> 
> Unless you are against it, I think I can still add a short comment
> before calling fput(), explaining why it is okay to access 'ctx' at
> that point. Thanks, Tomer

A comment would be grand.  Thanks!

regards,
dan carpenter
