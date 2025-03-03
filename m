Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40010A4BCEF
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 11:53:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD1210E3C2;
	Mon,  3 Mar 2025 10:53:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WKnMkQWT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E27410E3C2
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 10:53:45 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-ab78e6edb99so593766766b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 02:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740999223; x=1741604023; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=gSR1fSju11GwT3CmV4RSTFrBeqMpZeqjsL4Nu+lUL6I=;
 b=WKnMkQWTQP4LvpZ+wzAkfQsjLeNDQQ38c6rO46MKaK7MzmKDjPTKHSUv3WmZnznvdC
 n2IHsv3IlO0qD02yC9rp/c2KgALD90IEnHBq8osoU46B5c/RxKcLS141Uz5hUNeeq9qo
 2s+3e+2kF8CFOIL+eX/Dq8SgBqA5ocMMt4PvOSmhkZatiKz+44VmWGZbe/p4yM64j+eh
 Hrz92BLW57liCEbGvvZ7ogZ7K1wSVczJyrw/ZZbhFL+qkT6nCeI47KLW7GCHRR1PkzhF
 czAUulXL6MMdoFe7Dp3p80rGn/t1TsnQUbtb2i0xnHJZ/wOwep+kdQvDgEWwaBVdx8g6
 uyAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740999223; x=1741604023;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gSR1fSju11GwT3CmV4RSTFrBeqMpZeqjsL4Nu+lUL6I=;
 b=V6Ft7kSP1zPy6Nd9DFTntW5o/yM+ctFm7TOWWAKjivDjKVtgMlci7AUAP0lSPUuOJR
 aPp8bWAFMHG5CCB044RZxbpbMu5r+oId4Oazvq8LhgbuAU3gz1oS80piN9+clauexRhQ
 XYOjPlfGj3BTfIpnzOP2IMMtsEG37TItueGFniludr/gsdtRIC/JeHDQNSVYYlnZM5ia
 ysb7AroM9bEccTHpAE08nN/jervB7L4FCWj7DtEXOio4INY5yOeh5kMrAldpBPREgAyY
 odh81pn0/DPeiIJGChuJa6jSuZNWjI1/qVkQkowM7r+Be4aYshqq2CXRTVwm/Ia55We0
 G9kQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKv9mgzGaEeX2DTKTj12oS0jCVbVbx0UNk7zJRtKktGkfZsTEmpjqGT3KBQft5ujGURtw2ON8+5Iw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7mNUbyT3qgXontsUKXwSzrg37Pf9cs4M2y0HhdtpEcBzr+rTU
 hf2GS0pE4PSzk4oQWOhvM0eSVEIC8Y/VVdQ4g0/PhXV/jTitlo0lpeZPV/GtK9s=
X-Gm-Gg: ASbGncv2cvzXCy1V8I5LPxZdWf/aHZgX3hARlBLc5lb9VwxEW6+ImwGInXKvsXKbanu
 x1cbyQhW4rqvfNekeo27dYJLtGImYPbxcIGnQZIYLng/YzmaMHPKZOFsdzRsS3r3ZQmONCP6rSl
 Buq77Ncb2TJp16Uyw3rCtgnGQ6N1yr2046HTOQ9/nq8uG/upTpIfdJwcdIc/HdteGAcqegk8qWs
 uwQ/JPrllEByjci+ZLvz0+nl1kPjLE7PcxE0kFDlr/ZcnEHs/jaRq1XKIdm6WzQK4DysltDFtq9
 NW00grZAh6bVlf1oIGeS4FVUaPTOH1waqWQgOK9eePbilcFy6w==
X-Google-Smtp-Source: AGHT+IF878WM4Ac0lwU3U8jWhqiDwhdQ1OhLRZrdD2ubBpWef4yPS0ciLaeLOsRMTVQEjBD/4tiTTg==
X-Received: by 2002:a17:906:7310:b0:abf:13cb:c411 with SMTP id
 a640c23a62f3a-abf25fabbaemr1560894766b.18.1740999223509; 
 Mon, 03 Mar 2025 02:53:43 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-abf55e88748sm421511766b.54.2025.03.03.02.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 02:53:43 -0800 (PST)
Date: Mon, 3 Mar 2025 13:53:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Antonino Daplas <adaplas@pol.net>, Helge Deller <deller@gmx.de>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Yihao Han <hanyihao@vivo.com>, cocci@inria.fr,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] video: au1100fb: Move a variable assignment
 behind a null pointer check in au1100fb_setmode()
Message-ID: <47c37d1a-5740-4f48-ac0f-635d8b6f51b2@stanley.mountain>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <86551e6f-d529-1ff6-6ce6-b9669d10e6cb@web.de>
 <3f1e7aaa-501a-44f1-8122-28e9efa0a33c@web.de>
 <ugymllbkcsg22ffgyofvkquh5afbvoyv2nna5udmy3xfhv2rjz@jhgghzldzm4u>
 <eebf8c0c-7a6a-405f-aaab-2a8a8c2bd91f@stanley.mountain>
 <hwk2nf62owdo3olxrwt5tu7nwfpjkrr3yawizfpb3xn6ydeekx@xwz7nh5ece2c>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <hwk2nf62owdo3olxrwt5tu7nwfpjkrr3yawizfpb3xn6ydeekx@xwz7nh5ece2c>
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

On Mon, Mar 03, 2025 at 11:30:46AM +0100, Uwe Kleine-König wrote:
> On Mon, Mar 03, 2025 at 01:08:29PM +0300, Dan Carpenter wrote:
> > On Mon, Mar 03, 2025 at 10:19:06AM +0100, Uwe Kleine-König wrote:
> > > Hello,
> > > 
> > > On Sun, Mar 02, 2025 at 07:02:12PM +0100, Markus Elfring wrote:
> > > > From: Markus Elfring <elfring@users.sourceforge.net>
> > > > Date: Thu, 13 Apr 2023 21:35:36 +0200
> > > > 
> > > > The address of a data structure member was determined before
> > > > a corresponding null pointer check in the implementation of
> > > > the function “au1100fb_setmode”.
> > > > 
> > > > Thus avoid the risk for undefined behaviour by moving the assignment
> > > > for the variable “info” behind the null pointer check.
> > > > 
> > > > This issue was detected by using the Coccinelle software.
> > > > 
> > > > Fixes: 3b495f2bb749 ("Au1100 FB driver uplift for 2.6.")
> > > > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> > > 
> > > Acked-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> > > 
> > > Should also get
> > > 
> > > Cc: stable@vger.kernel.org
> > > 
> > > to ensure this is backported to stable.
> > 
> > It's not a bugfix, it's a cleanup.  That's not a dereference, it's
> > just pointer math.  It shouldn't have a Fixes tag.
> > 
> > Real bugs where we dereference a pointer and then check for NULL don't
> > last long in the kernel.  Most of the stuff Markus is sending is false
> > positives like this.
> 
> I thought a compiler translating the code
> 
> 	struct fb_info *info = &fbdev->info;
> 
> 	if (!fbdev)
> 		return -EINVAL;
> 
> is free (and expected) to just drop the if block.

If you dereference a pointer then it doesn't make sense to have a NULL
check after that because the kernel would already have crashed.

In 2009, we had the famous tun.c bug where there was a dereference
followed by a NULL check and the compiler deleted it as you say.
And then, it turned out that you could remap the NULL pointer to and so
the NULL dereference didn't lead to a crash and the missing NULL meant
the kernel kept running happily.  The remapped memory was full of
function pointers to get root.

We changed min_mmap_addr so that we can't remap the NULL pointer and
we started using the -fno-delete-null-pointer-checks compiler option so
that it wouldn't remove the NULL check even in places where it didn't
make sense.  We also started doing more static analysis.  We've also
tried to randomize where functions are in the memory so it's trickier
to hardcode function pointers.

A couple years later we had another bug where it turned out you could
still remap NULL.  I forget how the details.  No one wrote an exploit
and it wasn't publicized as much.

Anyway, none of that applies here, because this is just pointer math.

regards,
dan carpenter
