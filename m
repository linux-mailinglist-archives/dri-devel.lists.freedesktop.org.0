Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E517D9493
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 12:01:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67E8F10E970;
	Fri, 27 Oct 2023 10:01:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE60A10E970
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 10:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698400899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x9sGyyjxI2yvdu7MSOn9Q/9//pNvG/QdFrPdtOgnYyA=;
 b=e4oyEn+uoGAiP6N4Dgz0+vg0c3gunmKjaq93ozMTFOdA+OMdUPOP2/UowR+jVLSX8h605F
 n3f73iIc0vTr1oeRFfrlNB3C/xTs0rOvnu1N6Zo6HhkzUlG2R3zI/QpYEHu/QbNzc8LUtH
 dhtc+RJy/M1HUeKEZ7Kxtc79ARE9mMg=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-446-H7X6HYXcP0OzuT3ll48zKA-1; Fri, 27 Oct 2023 06:01:36 -0400
X-MC-Unique: H7X6HYXcP0OzuT3ll48zKA-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-507c8a8e5d1so2359166e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 03:01:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698400895; x=1699005695;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x9sGyyjxI2yvdu7MSOn9Q/9//pNvG/QdFrPdtOgnYyA=;
 b=JoNk99NmMRlbjiJozMta9X/KFiLGH5dDws7aocmJWKqFTAlGL5Q7BrLI1o22QtZmUv
 8XUhn8q1tvZVTFRS+AamTLB0GNScJuzHhkViyS5J9kr1J+WgcpZKtflHmFaIAuZKjG8w
 EX2VVYgBY3hSlQBo6bCjuLvPpwzje16tIkql682Zl2CAKnY9xZUjdyjFhbct78E+5TFN
 1+yCiRtSCAGajKimyuoAkCIjXnw9l9oHaKN66O6yJ0tBz8eivIdbTfW8Acb07Gm7vBKa
 UZW04aVf2KHEcJOkv22ALt+MEo8JFphz+f4j8NPlWr5OwIWILHag7cFjR68r/+efYX+P
 82DQ==
X-Gm-Message-State: AOJu0YyQ5DklB7YATJCeJWEOJ2X+VCNxrwiE8qHPfSFvS05m0BCPvCfD
 /kvH3RrFTauOHHxQTl1Rtl6xlnL2bm1i+seHN0DrwQA6Q+2so5mcBWJdAREpnu0X/5c6etY1OGD
 o7pC0lUQrwEugnZqzGiJOaqEPYJsT
X-Received: by 2002:a2e:9015:0:b0:2c5:4a0:f3cb with SMTP id
 h21-20020a2e9015000000b002c504a0f3cbmr1687387ljg.11.1698400895116; 
 Fri, 27 Oct 2023 03:01:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+H9/Ygxf/lkcx4PecGJYcAQeCGmSD2RlP+GC9dCkjmaPgIgE8c1duxvrl9rSEp9ilxL8PEA==
X-Received: by 2002:a2e:9015:0:b0:2c5:4a0:f3cb with SMTP id
 h21-20020a2e9015000000b002c504a0f3cbmr1687370ljg.11.1698400894756; 
 Fri, 27 Oct 2023 03:01:34 -0700 (PDT)
Received: from toolbox ([2001:9e8:89a1:3d00:99c5:8880:8db4:298f])
 by smtp.gmail.com with ESMTPSA id
 l25-20020a05600c089900b004081a011c0esm4622201wmp.12.2023.10.27.03.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Oct 2023 03:01:34 -0700 (PDT)
Date: Fri, 27 Oct 2023 12:01:32 +0200
From: Sebastian Wick <sebastian.wick@redhat.com>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>
Subject: Re: [RFC PATCH v2 06/17] drm/doc/rfc: Describe why prescriptive
 color pipeline is needed
Message-ID: <20231027100132.GA435169@toolbox>
References: <20231019212133.245155-7-harry.wentland@amd.com>
 <20231020142256.GA859375@toolbox> <20231020175703.09cd2578@eldfell>
 <20f33898-4c40-4854-a1e8-afaef52f6524@amd.com>
 <20231023111219.6e287958@eldfell>
 <bf69b740-dce7-94f1-293d-a4b274b52f55@nvidia.com>
 <20231026115747.44cbddad@eldfell> <20231026173003.GA319477@toolbox>
 <1255ad3-e22b-063-ffb8-18ea852f054@nvidia.com>
 <34be9d0b-18d7-7568-cf30-b3b1b9f77045@mailbox.org>
MIME-Version: 1.0
In-Reply-To: <34be9d0b-18d7-7568-cf30-b3b1b9f77045@mailbox.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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
Cc: Sasha McIntosh <sashamcintosh@google.com>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Shashank Sharma <shashank.sharma@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 Hector Martin <marcan@marcan.st>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Victoria Brekenfeld <victoria@system76.com>, dri-devel@lists.freedesktop.org,
 Christopher Braga <quic_cbraga@quicinc.com>, Melissa Wen <mwen@igalia.com>,
 Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, Joshua Ashton <joshua@froggi.es>,
 Aleix Pol <aleixpol@kde.org>, wayland-devel@lists.freedesktop.org,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Naseer Ahmed <quic_naseer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 27, 2023 at 10:59:25AM +0200, Michel Dänzer wrote:
> On 10/26/23 21:25, Alex Goins wrote:
> > On Thu, 26 Oct 2023, Sebastian Wick wrote:
> >> On Thu, Oct 26, 2023 at 11:57:47AM +0300, Pekka Paalanen wrote:
> >>> On Wed, 25 Oct 2023 15:16:08 -0500 (CDT)
> >>> Alex Goins <agoins@nvidia.com> wrote:
> >>>
> >>>> Despite being programmable, the LUTs are updated in a manner that is less
> >>>> efficient as compared to e.g. the non-static "degamma" LUT. Would it be helpful
> >>>> if there was some way to tag operations according to their performance,
> >>>> for example so that clients can prefer a high performance one when they
> >>>> intend to do an animated transition? I recall from the XDC HDR workshop
> >>>> that this is also an issue with AMD's 3DLUT, where updates can be too
> >>>> slow to animate.
> >>>
> >>> I can certainly see such information being useful, but then we need to
> >>> somehow quantize the performance.
> > 
> > Right, which wouldn't even necessarily be universal, could depend on the given
> > host, GPU, etc. It could just be a relative performance indication, to give an
> > order of preference. That wouldn't tell you if it can or can't be animated, but
> > when choosing between two LUTs to animate you could prefer the higher
> > performance one.
> > 
> >>>
> >>> What I was left puzzled about after the XDC workshop is that is it
> >>> possible to pre-load configurations in the background (slow), and then
> >>> quickly switch between them? Hardware-wise I mean.
> > 
> > This works fine for our "fast" LUTs, you just point them to a surface in video
> > memory and they flip to it. You could keep multiple surfaces around and flip
> > between them without having to reprogram them in software. We can easily do that
> > with enumerated curves, populating them when the driver initializes instead of
> > waiting for the client to request them. You can even point multiple hardware
> > LUTs to the same video memory surface, if they need the same curve.
> > 
> >>
> >> We could define that pipelines with a lower ID are to be preferred over
> >> higher IDs.
> > 
> > Sure, but this isn't just an issue with a pipeline as a whole, but the
> > individual elements within it and how to use them in a given context.
> > 
> >>
> >> The issue is that if programming a pipeline becomes too slow to be
> >> useful it probably should just not be made available to user space.
> > 
> > It's not that programming the pipeline is overall too slow. The LUTs we have
> > that are relatively slow to program are meant to be set infrequently, or even
> > just once, to allow the scaler and tone mapping operator to operate in fixed
> > point PQ space. You might still want the tone mapper, so you would choose a
> > pipeline that includes them, but when it comes to e.g. animating a night light,
> > you would want to choose a different LUT for that purpose.
> > 
> >>
> >> The prepare-commit idea for blob properties would help to make the
> >> pipelines usable again, but until then it's probably a good idea to just
> >> not expose those pipelines.
> > 
> > The prepare-commit idea actually wouldn't work for these LUTs, because they are
> > programmed using methods instead of pointing them to a surface. I'm actually not
> > sure how slow it actually is, would need to benchmark it. I think not exposing
> > them at all would be overkill, since it would mean you can't use the preblending
> > scaler or tonemapper, and animation isn't necessary for that.
> > 
> > The AMD 3DLUT is another example of a LUT that is slow to update, and it would
> > obviously be a major loss if that wasn't exposed. There just needs to be some
> > way for clients to know if they are going to kill performance by trying to
> > change it every frame.
> 
> Might a first step be to require the ALLOW_MODESET flag to be set when changing the values for a colorop which is too slow to be updated per refresh cycle?
> 
> This would tell the compositor: You can use this colorop, but you can't change its values on the fly.

I argued before that changing any color op to passthrough should never
require ALLOW_MODESET and while this is really hard to guarantee from a
driver perspective I still believe that it's better to not expose any
feature requiring ALLOW_MODESET or taking too long to program to be
useful for per-frame changes.

When user space has ways to figure out if going back to a specific state
(in this case setting everything to bypass) without ALLOW_MODESET we can
revisit this decision, but until then, let's keep things simple and only
expose things that work reliably without ALLOW_MODESET and fast enough
to work for per-frame changes.

Harry, Pekka: Should we document this? It obviously restricts what can
be exposed but exposing things that can't be used by user space isn't
useful.

> 
> -- 
> Earthling Michel Dänzer            |                  https://redhat.com
> Libre software enthusiast          |         Mesa and Xwayland developer
> 

