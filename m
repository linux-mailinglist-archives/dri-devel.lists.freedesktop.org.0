Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B7FA7B8D5
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 10:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B037610E33D;
	Fri,  4 Apr 2025 08:27:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wm7CUFPy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F37D10E33D
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 08:27:45 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43cf3192f3bso17575135e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Apr 2025 01:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743755263; x=1744360063; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=DJa0y5uHqB+uXYxg4Ee5P8Mqg/g0/KhhIdf1SuA6v4A=;
 b=wm7CUFPyw9OIFgng3yeIgngnEjn+wdmlaiPdF6oLiwLpPPqX9iLOhAaeB2YHI8Zb4o
 XBZi8ifqNJ2yaxaTEAgiNPopDV5tgiJCDdRu30U3ercH7+o7uPZFCwKRJ2qy6afwCLLE
 3F7c9QLH8ycVqNH01kJ0d+tUlecEST/7UtqfCQWtrC1VWjziPLZm8IkDM3hN/V6ovBIx
 2yjSwAsuclSvjULq3+QUubGnKLFYkh0T+NnvcmDP6TfvZdpYeDHHUiI2ETe3NMOxbtBr
 vToPIK5GSxHqUeXU82g/t8JVIIUprqAoUkGOOZFHY98z6bbuzm20TprShfofp/zxH3am
 fDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743755263; x=1744360063;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DJa0y5uHqB+uXYxg4Ee5P8Mqg/g0/KhhIdf1SuA6v4A=;
 b=nrubrzGkCgNlx2mhsufP5fnR+yNURhjsomuksDnbBA/uucRCfprsawWAwzuSmmL1Wd
 6cQtm7gH4KeqMcG3uQayOhGm/ZEbQKazXc/oB3OAb0Xe3PFQzmYaY1Dsanm2cNIiosGA
 +FHCK6aSyIf+XPfV5+l2Dh3hgjmbUTnIqBqpbZBsc6TE+GKlWV3JkaizhDXXsbABx3i+
 F+J62QUERQPVbt52pqZ4/lnAA0gEmGbs0FCbgMuVXCel+e3Sn9xS8YI9jygELzFyciY8
 ftP0nXTXaMvyNniHsQydWpFK4saLAkJpzlxl9tGSXSAnYWPRsVcHmqrq75VSKaI/3vxd
 jCwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIemB69jNAkKR21VP7862rd4HHUxn0jNeOv/cYIr+/71gz18ZsBV8JKikWG3bWCVAWenNginniq40=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxuCut9R6FPytB7WHtLotUYGECqoZF0+cYyr3LVrXabLx8ZNibf
 L9p7a8f+7ZXNShANbQcabMUc9GikVC3z+4avrfy5dPT09zED3lg+xzPwe6tZ170=
X-Gm-Gg: ASbGncvekoM09rfLzVYQ+jb7U0paieDjtqP92bG5tEKX/lOV5iFlfU+o+TcpZpzF7SP
 H83DCpsrLpN1m6bCVvi20vPRGx2Vdy7b1j+BICt+PyoniVa+TPKnvWNTmJ2rm2yIdPUbiEeq05X
 OsOiAh41UmuIn6g3fVInB5VWHl4+aEz2m2KpBkg2mPgutYN5BEQWP0infjWTr7DE7qwtrw8Qd8L
 mTqLy2oQvB9si4ekxDl6pMiT8Y92AW1xElUMF0uQicPjWGkdKhXcRKZKyN5Jip7IqYzAT4HCcm6
 anMLj1cyaAV/7WrzS/T032jm4rM9SzNOamEJttxjZctvaJp8SA==
X-Google-Smtp-Source: AGHT+IG+NDQDuY7wpbCJM2rLv7MTUqbCkkmKdHj5rYcXcQpcsNWGZu7a+1mkk53652ueI0HgxX47pg==
X-Received: by 2002:a05:6000:250a:b0:391:12a5:3cb3 with SMTP id
 ffacd0b85a97d-39d0873fd19mr1619780f8f.3.1743755263387; 
 Fri, 04 Apr 2025 01:27:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-39c3020dacfsm3780694f8f.72.2025.04.04.01.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Apr 2025 01:27:42 -0700 (PDT)
Date: Fri, 4 Apr 2025 11:27:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Rob Clark <robdclark@chromium.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] dma-buf/sw_sync: Decrement refcount on error in
 sw_sync_ioctl_get_deadline()
Message-ID: <03c838ab-3bc8-4e5a-9f0a-331254701b0c@stanley.mountain>
References: <5dbd6105-3acf-47ad-84d6-2920171916ac@stanley.mountain>
 <0e832ed8-9692-43ba-869d-8db3b419f3a9@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e832ed8-9692-43ba-869d-8db3b419f3a9@amd.com>
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

On Mon, Mar 31, 2025 at 02:02:44PM +0200, Christian König wrote:
> Am 31.03.25 um 11:45 schrieb Dan Carpenter:
> > Call dma_fence_put(fence) before returning an error on this error path.
> >
> > Fixes: 70e67aaec2f4 ("dma-buf/sw_sync: Add fence deadline support")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/dma-buf/sw_sync.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
> > index f5905d67dedb..b7615c5c6cac 100644
> > --- a/drivers/dma-buf/sw_sync.c
> > +++ b/drivers/dma-buf/sw_sync.c
> > @@ -438,8 +438,10 @@ static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long a
> >  		return -EINVAL;
> >  
> >  	pt = dma_fence_to_sync_pt(fence);
> > -	if (!pt)
> > +	if (!pt) {
> > +		dma_fence_put(fence);
> >  		return -EINVAL;
> > +	}
> 
> Good catch.
> 
> I think it would be cleaner if we add an error label and then use "ret = -EINVAL; goto error;" here as well as a few lines below when ret is set to -ENOENT.
> 
> This way we can also avoid the ret = 0 in the declaration and let the compiler actually check the lifetime of the assignment.
> 

I had some issues with my email and it silently ate a bunch of outgoing
email without saving a single trace of anything I had sent.  I see
this was one that was eaten.

Unwind ladders don't work really well for things where you just take it
for a little while and then drop it a few lines later.  Such as here you
take reference and then drop it or you take a lock and then drop it.
Normally, you can add things to anywere in the unwind ladder but if you
add an unlock to the ladder than you to add a weird bunny hop if the goto
isn't holding the lock.  It ends up getting confusing.  With that kind of
thing, I prefer to do the unlock before the goto.

free_c:
	free(c);
	goto free_b;  <-- bunny hop;
unlock:
	unlock();
free_b:
	free(b);
free_a:
	free(a);

	return ret;

regards,
dan carpenter

diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index f5905d67dedb..22a808995f10 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -438,15 +438,17 @@ static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long a
 		return -EINVAL;
 
 	pt = dma_fence_to_sync_pt(fence);
-	if (!pt)
-		return -EINVAL;
+	if (!pt) {
+		ret = -EINVAL;
+		goto put_fence;
+	}
 
 	spin_lock_irqsave(fence->lock, flags);
-	if (test_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags)) {
-		data.deadline_ns = ktime_to_ns(pt->deadline);
-	} else {
+	if (!test_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags)) {
 		ret = -ENOENT;
+		goto unlock;
 	}
+	data.deadline_ns = ktime_to_ns(pt->deadline);
 	spin_unlock_irqrestore(fence->lock, flags);
 
 	dma_fence_put(fence);
@@ -458,6 +460,13 @@ static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long a
 		return -EFAULT;
 
 	return 0;
+
+unlock:
+	spin_unlock_irqrestore(fence->lock, flags);
+put_fence:
+	dma_fence_put(fence);
+
+	return ret;
 }
 
 static long sw_sync_ioctl(struct file *file, unsigned int cmd,


