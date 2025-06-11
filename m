Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05090AD5B84
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 18:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1C610E6B3;
	Wed, 11 Jun 2025 16:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T+PLgvCb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57C010E6B3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 16:12:09 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-e818a572828so5360282276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 09:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749658328; x=1750263128; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lel6KWnThfXW5zwACQgaKYQnlTF6ANQe3mMnf5Q4wUs=;
 b=T+PLgvCbIq8mNaCBwIflQN8UFjuks6zN7lWdqrEoIywBzUkV47wDIG4lbTY4FhiYO9
 OLzWqcZFHr3kCZ5hjEXtaZ6FRAy4wAESdONtco4KXBoD+hwQTM1ZWNmbFhDAk4uGYpmY
 bhzox6OxUcl/Emr9s3SMZXMRCQkTcmXg/w/Kjp+T3Qsb5POO5+WcbMP1lHGX2ubtBni+
 WmAhgqibmnWtKvZ7GY46B3VxhqCh24kxcRg20Lrro7hYfL9Jgow0H0ZxmS4WAOsis/fq
 4uz4LKf9txuT1nrLR+EvqEgyY20yh2aDavlwqc+8WOjZU1EKken3CBh/1xSCY9fJFUs1
 TOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749658328; x=1750263128;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lel6KWnThfXW5zwACQgaKYQnlTF6ANQe3mMnf5Q4wUs=;
 b=OW1bo0r9euNQ8VZ7+vhB82I2tFijNuCIrzjAML7Uudb08IkvhjMNqYURZVqVsyhegP
 oBbkJWD2BD8CwAFvgDy//TTt3ebau/H7Pf6DG3fzTE2a5QlliqhQeolCbcKyp4vO6a/U
 //NYyG6HReK9LP9XLvGnVwVX8erg1y7C/sG0nm4XwKUw5NvL0zPM0KHOzNAMMCJkztnh
 6GwMopwohCdm58xx3LNwek/bFoIT3749DRIY3RQ51jvO5UkAv5iNHL200d0l4AZLToNy
 zKaODvBk6xZhFfzDIGA4aFXC+co3uG2iNJMBSCRIVxCkH0ZTmGcscnLfESdr80WDC8xV
 eYQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOzuw//U3V9+0vpymas+MveyHp7O+HeJJOfq5NagoEtsUSMlzbtdq43gIcn3IL5P27Yz21juT6n20=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUUGhsSfQnH3DHYIKSl+pQ8WVm1l1PF/IQohDbN+g1DOhCGIyT
 9uhlRPDKpzhrXeCRiKgNEKiJnHaj/wEp/Tv0e7FrWR9wQhSpz8NRQnS8
X-Gm-Gg: ASbGncuoC7j9mi2dOGm6kAj+LbOiCAWY++iFaDdLFolYYaP0pG50Qs9+2JkKTNEwoiu
 qPV2oOBKpd4RBDudC+j4APJ5CmaopEIzxkZ2/hq9B3t2cuEuB8ZrWtoHMunp4W2X3MSrMl56Mao
 4sogytNS0OmCZx0IE/ZDPo1hX2Ub8zc2PRgFZWdelan7wzHyG3J3yWLl5aPICUJYhg639/PWhBi
 58ICj4+tMkRZ5SEgXcQluKJG1rXjZov5cLQ73FCcvz3oCbE4jTap1s2N5llnF6Nn2Ex424tqXjN
 UogwzV0ylYPYayxRCjbmyFmZLg6UGH7J2hvbOeyS8wnkpD4mAZmd5c65enWgeEXkymKbAzrV6tR
 Qr3UawSJ27+A=
X-Google-Smtp-Source: AGHT+IHw3jX341QHh9PMSkVnd8CwSMWalCeUuZZZCDXumNX2LqqM+bvwBjGn8YRcQyj9ycgeBdLTmA==
X-Received: by 2002:a05:6902:1690:b0:e81:abdb:5f91 with SMTP id
 3f1490d57ef6-e820b6bc432mr168020276.25.1749658328427; 
 Wed, 11 Jun 2025 09:12:08 -0700 (PDT)
Received: from trojai4.cs.purdue.edu ([128.210.0.165])
 by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e81a40217a2sm3625106276.13.2025.06.11.09.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 09:12:08 -0700 (PDT)
From: Alex Guo <alexguo1023@gmail.com>
To: geert@linux-m68k.org
Cc: alexguo1023@gmail.com, deller@gmx.de, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fbdev: pm3fb: Fix potential divide by zero
Date: Wed, 11 Jun 2025 12:12:07 -0400
Message-Id: <20250611161207.4031677-1-alexguo1023@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAMuHMdW5wU1ForGOGD-+HDUu7wcnBx3jx911nLEqbJ71t4MBsg@mail.gmail.com>
References: <CAMuHMdW5wU1ForGOGD-+HDUu7wcnBx3jx911nLEqbJ71t4MBsg@mail.gmail.com>
MIME-Version: 1.0
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

Hi Greet,

Thanks for your confirmation and suggestions.

I added this patch based on existing checks on var->pixclock in other drivers, such as savagefb_check_var, nvidiafb_check_var, etc.
Are you suggesting that it is better to replace an invalid value (var->pixclock == 0) with a default valid value, instead of returning -EINVAL? If so, could you advise what a suitable default value would be for this case?

Actually, I have found a few similar issues in other functions as well. I would like to make sure I am addressing them in the correct way.

Best,
Alex
