Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B04937F02
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2024 07:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46BFB10E0A5;
	Sat, 20 Jul 2024 05:19:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bvEvfH3i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D41E10E0A5
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jul 2024 05:19:14 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-70af81e8439so1255583b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 22:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721452754; x=1722057554; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PAqlDIeAXRO1DBTVpb7ic/6UZGkH7oIIoVxSBFI42TI=;
 b=bvEvfH3iU+UewYF9XwQp+aaJCbkY2ZFQ31k8j0q56BVePkgjgxN3r7heE3GDMDNABd
 kPtaGc0zN74/iMpOg4GFHMETtJiF7KF0H34ihTPEOYAu/Q6KxAaVX3SDsR7H+B+mefX8
 6pWEh5j5j0rdhVqjadbzQkm/CGTOA0pk7eZJM6j1j51jkWq5wVyRxzOanSytd+eWLU3Q
 XI5r5QueiQ/+Ox2WGsW94Ly6eErIFOoMUZ0egf/Ap6ferLKA+960GcO9W+0/5hvxXPx7
 imrhNUQV3CiVNzs5EZgnm5ecnuI1WM2EZwGYRg4HthYPRW4OJTghvEZgPxIll4ex1Y6g
 w6sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721452754; x=1722057554;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PAqlDIeAXRO1DBTVpb7ic/6UZGkH7oIIoVxSBFI42TI=;
 b=McK1sLusz4m2fprTSu3ufseTpPyRapq7kKwozUeLzxUxtWo4bISnz97KaiHR9dfocZ
 5bC+dV8+ObWVLzFxiRw4A+Ml9DQZn/wem/icG0Z+BMXMLu8K6FXi1E/pysdoR9bQkfTq
 Lg+tDzwd9NRp/bfLAOMJ6bEjB7Qgd+ud4rFv5J51ngqJ60beKbgtMf7/02j1QCjDbhkF
 QRoFLgZ9vLiEpbqPMkxOcYkNOIy6t/ZDB6gTOij7SM0XlTPF5nHMxnIGozpv4VXNdUgC
 mk2CvTJB2t1qlXil9lAgUGegs1Zi2yrjzypi5YEVoIijnhbQLygankAs8sQ4ADNDsMIs
 K4Gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmRubGo4nSQTkf5CnNtWZhrOouu4gsIOmu1GMKCMKVsfj5o+HpK2rAC+90qiE7EBl4cKr/i0nqZYY83SCX7TdsBQc3/XRZnvVsVlJLBcxw
X-Gm-Message-State: AOJu0YwU+inPpKFSyKJj67Bu0X0QEb8eRaasPZExjcuNdhrl9iiEzWUR
 gjltrPIIhUXOebH8hrhPcAbPcjlO/06DrUZMLZ3QSAYGZMkX9ykm2H0PQewC+3A=
X-Google-Smtp-Source: AGHT+IHRJ62D0AptfuP97fRJQS436WZ8onKwfDqm1vbVFDNJT6EXmzULExUMAm1nN/hVDRAgkmPaqw==
X-Received: by 2002:a05:6a21:8ccc:b0:1c2:9208:3421 with SMTP id
 adf61e73a8af0-1c4228cecc2mr2539274637.28.1721452753702; 
 Fri, 19 Jul 2024 22:19:13 -0700 (PDT)
Received: from [10.3.80.76] ([103.4.222.252]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ccf7b5c385sm2688785a91.18.2024.07.19.22.19.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jul 2024 22:19:12 -0700 (PDT)
Message-ID: <758b3f44-5c8f-46b5-8f02-103601eae278@gmail.com>
Date: Sat, 20 Jul 2024 10:49:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mipi-dsi: Introduce macros to create mipi_dsi_*_multi
 functions
To: Doug Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240716133117.483514-1-tejasvipin76@gmail.com>
 <p7fahem6egnooi5org4lv3gtz2elafylvlnyily7buvzcpv2qh@vssvpfci3lwn>
 <a05b4e6e-272a-43be-8202-2b81049a41a4@gmail.com>
 <CAA8EJpoRd3ooMnH8Z38yNH0M-L_CUd+H4WoYydd2AEmpXGeU8Q@mail.gmail.com>
 <CAD=FV=XDpEfTjTQbO-fZKKwgHCMUmCrb+FBr=3DMzVfs3on9XQ@mail.gmail.com>
Content-Language: en-US
From: Tejas Vipin <tejasvipin76@gmail.com>
In-Reply-To: <CAD=FV=XDpEfTjTQbO-fZKKwgHCMUmCrb+FBr=3DMzVfs3on9XQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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



On 7/19/24 10:29 PM, Doug Anderson wrote:
> Hi,
> 
> On Wed, Jul 17, 2024 at 3:07 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>>>> However it might be better to go other way arround.
>>>> Do we want for all the drivers to migrate to _multi()-kind of API? If
>>>> so, what about renaming the multi and non-multi functions accordingly
>>>> and making the old API a wrapper around the multi() function?
>>>>
>>>
>>> I think this would be good. For the wrapper to make a multi() function
>>> non-multi, what do you think about a macro that would just pass a
>>> default dsi_ctx to the multi() func and return on error? In this case
>>> it would also be good to let the code fill inline instead of generating
>>> a whole new function imo.
>>>
>>> So in this scenario all the mipi dsi functions would be multi functions,
>>> and a function could be called non-multi like MACRO_NAME(func) at the
>>> call site.
>>
>> Sounds good to me. I'd suggest to wait for a day or two for further
>> feedback / comments from other developers.
> 
> I don't totally hate the idea of going full-multi and just having
> macros to wrap anyone who hasn't converted, but I'd be curious how
> much driver bloat this will cause for drivers that aren't converted.
> Would the compiler do a good job optimizing here? Maybe we don't care
> if we just want everyone to switch over? If nothing else, it might
> make sense to at least keep both versions for the very generic
> functions (mipi_dsi_generic_write_multi and
> mipi_dsi_dcs_write_buffer_multi)
> 
> ...oh, but wait. We probably have the non-multi versions wrap the
> _multi ones. One of the things about the _multi functions is that they
> are also "chatty" and print errors. They're designed for the use case
> of a pile of init code where any error is fatal and needs to be
> printed. I suspect that somewhere along the way someone will want to
> be able to call these functions and not have them print errors...
> 

I think what would be interesting is if we had "chatty" member as a
part of mipi_dsi_multi_context as a check for if dev_err should run.
That way, we could make any function not chatty. If we did this, is
there any reason for a driver to not switch over to using the multi
functions? 

> Maybe going with Dmitry's suggested syntax is the best option here?
> Depending on how others feel, we could potentially even get rid of the
> special error message and just stringify the function name for the
> error message?
> 
The problem with any macro solution that defines new multi functions is 
that it creates a lot of bloat. Defining the function through macros
might be smaller than defining them manually, but there are still twice
as many function declarations as there would be if we went all multi. 
The generated code is still just as big as if we manually defined
everything. I think a macro that defines functions should be more of a 
last resort if we don't have any other options.

> -Doug

-- 
Tejas Vipin
