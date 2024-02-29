Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 029EF86D7B5
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 00:26:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97EC110E6E5;
	Thu, 29 Feb 2024 23:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZiVx8Bhi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 384E310E6E5
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 23:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709249171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=KfbPgYrMbRvjqJfH9XiwG72zsrb2/xSuJyU18MOmvYM=;
 b=ZiVx8BhiYe2I7n/9IS/oIST+jSOcW2yrG2uUkpjRlK61flbwGHkXarM5+63E2E3yQTJ5Py
 v3P93+2xFZiXI5u1URIKq7B5QLIypS7fDRzlA7pPwQDL86zRrDgGJZamWLRPsNLJjHQmOH
 7BCY0pC2ZaX9yNgFynM1/o0hPuxRKn0=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-9IkUGTLmObOoGACWzG98nA-1; Thu, 29 Feb 2024 18:26:09 -0500
X-MC-Unique: 9IkUGTLmObOoGACWzG98nA-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2d31843ae13so6573001fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 15:26:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709249167; x=1709853967;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KfbPgYrMbRvjqJfH9XiwG72zsrb2/xSuJyU18MOmvYM=;
 b=VBJA1kFQ0IiquU8sv39g5qvOVKkfn58SqVkcu1Hnche77aoqHZ1pT7YnU3MSlszHw4
 4jT9Wu3S9GSTm4Aj+bzcU4IaqyIYH8GOwtRG+PVaLchPK6/o62+E+2a3cPHV1LCIOfK7
 cTO0OcS2qZ7zLFBReeMarKAJykN2ZDcW1fNucW8i6YBQcp/a1c/8/O0dvWHlvJrCpMxa
 C0aw5T1iViOzCSBgA56F5RfUNdZzztByz+F+FxqhxKp98WxlK1UpKK3q+RPqrAAwrp63
 wD1Vd6HnT2na3UAeiJRYHXY3cmk5ER0z2tzf9hBKqn2YipJzJTBSSj9F1IfYLRKYOR9o
 EiiA==
X-Gm-Message-State: AOJu0YzwM+442XVGloiEZfAQwvik29yyXUYsdmGQvJEw3WlrGPUcYKP0
 hekN7SvUUuMLkkBpGZPPBpnMxIakMoeiGotPF1M5XqEnsFblgs+nzz9cOHU96jFQz9V3+s/MDec
 Bi+vfVBQa0m4Vko07PT7KZmbT7o5AukIMiZnfwzN397nUn4oT+NU7tO1/AY6VfTFkmENwhPVmjM
 9vjXyUAKnS5Cs6OVz3+00yMWKHnspZYdsaFA/3Ojsr7DWdsL8x7rWIQjFV8p3PAfM=
X-Received: by 2002:a2e:a23a:0:b0:2d3:2a95:6ebe with SMTP id
 i26-20020a2ea23a000000b002d32a956ebemr373220ljm.36.1709249167542; 
 Thu, 29 Feb 2024 15:26:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZ+FJmzrY7P+5l+z3Hwms+UP8SZ3mKvf+VEpPectelcfVsnvNT2QksgCjnGuh8SSKsDXY06g==
X-Received: by 2002:a2e:a23a:0:b0:2d3:2a95:6ebe with SMTP id
 i26-20020a2ea23a000000b002d32a956ebemr373204ljm.36.1709249167101; 
 Thu, 29 Feb 2024 15:26:07 -0800 (PST)
Received: from toolbox ([2001:9e8:8984:bd00:2340:7b35:5e60:4abd])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a1c4c0b000000b00412ba5cda16sm3767679wmf.33.2024.02.29.15.26.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 15:26:06 -0800 (PST)
Date: Fri, 1 Mar 2024 00:26:05 +0100
From: Sebastian Wick <sebastian.wick@redhat.com>
To: dri-devel@lists.freedesktop.org
Cc: Pekka Paalanen <ppaalanen@gmail.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Joshua Ashton <joshua@froggi.es>, Xaver Hugl <xaver.hugl@gmail.com>
Subject: Colorspace "Default" and the CTA-861 spec
Message-ID: <20240229232605.GC166694@toolbox>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hey all,

I was trying to document the Colorspace property variants with what the
sink expects, what kind of data the CRTC should be configured to
produce, and what drivers must guarantee. I tried to stick to CTA-861-I
for this exercise and after more than an hour to get the "Default"
variant right, I gave up and now I'm writing this mail.

There are actually 4 distinct parameters that have to be known: the
colorimetry (primaries and white point), the transfer characteristics,
the YCbCr conversion matrix and the quantization level.

Section 5.1 has two paragraphs talking about the default color space
(which should imply the rest of the parameters). For IT formats, and CE
formats in some situations "the RGB color space used should be the RGB
color space the Sink declares in the Basic Display Parameters and
Features Block of its EDID". For sinks that accept YCbCr data and
InfoFrames, CE formats default to other color spaces. They do support
setting InfoFrames though and thus can set Y2=Y1=Y0=0 and force the sink
into accepting RGB (Table 18) and set C1=C0=0 for Colorimetry RGB. Foote
a helpfully notes that this is the colorimetry declared in the EDID.

Now, the first obvious issue is that none of that defines the YCbCr
matrix to be used. It is entirely undefined. If drivers use an YCbCr
output format, user space gets undefined behavior.

The second issue is the transfer characteristics. Section 5.3 defines
the transfer characteristics when a specific color space is selected. If
the colorimetry is RGB then the BT.709 transfer characteristics are used
(and not the gamma from the EDID) whereas the default color space as
defined in 5.1 seems to point to the EDID even for gamma.

That would means depending on if we have an IT mode or a CE mode with a
sink that supports YCbCr and InfoFrames, the default transfer
characteristics could be different. User space would have to figure all
of that out to know which transfer characteristics it should use.

Is the spec just wrong here?

There also is the "defaultRGB" colorimetry. This one actually clearly
defines that the sink shall expect data with the colorimetry and gamma
from the EDID. It seems to have been added in CTA-861-I so support for
it is basically non-existent.

So what should we do? To me it seems almost impossible to define
anything useful for the "Default" property variant, but because the
"defaultRGB" colorimetry is not supported at all right now, making
"Default" undefined means we can't get predictable colors on almost all
displays.

Cheers,
Sebastian

