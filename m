Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73536AF646E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 23:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB5210E074;
	Wed,  2 Jul 2025 21:56:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nD5Ji6kZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FD6F10E0F0;
 Wed,  2 Jul 2025 14:51:44 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-23694cec0feso69109755ad.2; 
 Wed, 02 Jul 2025 07:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751467904; x=1752072704; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qBca6/tX4UaiNS88cVzn9ejTz7Ui0nOCiCDYDy5kH/4=;
 b=nD5Ji6kZa8kvi1OKxAsvYVvuQskmUxShf+kTvyZWBWigl7qTuF/GYSESzQDDNQnKvv
 t5YvhM4yZBaO/xcyVNoJM+F8eDf2t1vsqioYWyPerxCHILIqVOnrGpa/0wCm6Amn7sNt
 kdYjUcTOBeY8/LCEdb11hDklMvPeBOLIMLg3BDlax3n+/izpXDONaZwnmoKOVj0nkfYI
 3+RwCAM0Qn2v1ZIvcyu+5ZOGDr/EMruAopjtk2VCMrgTrXUc5u5KV4Ixxjo2V/S/egjp
 2H5hIYFvuFQRyWgZ1Ah3qcubmfruOfewuVPIFpnqNgaLObn7vCRqrQl5muISd1St41bq
 w1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751467904; x=1752072704;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qBca6/tX4UaiNS88cVzn9ejTz7Ui0nOCiCDYDy5kH/4=;
 b=TnFoBSBtOPqmXh/h2xrL1hhyCqPwzTtlxE/MHJZTKS1yK5PoXHTD9QFwMb/n6CLWFQ
 GPWvqvqub3rs3N0Lau/ucuWN9VpaQAYg5t8p9E43o9LI3G9gMlC8KFYubaFI7wYJUHd+
 a85gakjjKd5Lg9KrxHheuyZ+rw7jos0rdMJPKWB9rPHNE3fLmNM0FbIWHXgP4uY78EdI
 bnOlyRiTmyByqtMyX0TMx7NrWrnCL78SRZT0IVaEMBuaju31y40bCjlZVEUl8Frohtzt
 kTnTpUA81CG5wZNYOA53Jyij1+EWbjDjjARO3fZ0nqPi7fbULDVJr2piNeQoMTdHeZRp
 Uu8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDX21aPQi48td2RUaBYMas1/G73TN3w5uMo93E9yIE2kgxHQHqIj+hHyXEmmjfSW5TiD8vTWriqLQp@lists.freedesktop.org,
 AJvYcCWOuH13xOTKzFB2/vDzmjQ0RC8Q8wo0Deg/FcbhqjvUdGG+FCxX5cgrm0WAxanq4ztkh4N0ytuSVis=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNif+kJHaNJkZP+dLdHSDdNw24+PpcXOMWU18RJZytGLQfnJwx
 XKyackS6Xf0fMR8WJOJ+WwO5rLHAkNTLcixV0WfWX+Upb+g8RkkDMi4z
X-Gm-Gg: ASbGncs1/EaR2YjtrCHcdxmpNEZId5HDlcb3UVGT8Mh4a8P1xhnFLCdiEvmQsnrEyBh
 oUXfPFU6Y+DW9SJIVI/N2KxEAck4FLTwkZuB84dhyw2dzlutmPCxca8vRYCrPp79xDYwWNknQVp
 LeR67ycGgb/3SjwGSfnfVFyAWac8IfFx7kMeb3mW9zwCnZExpimc54xbWWDISdsq1/0KsBL+VrU
 wj1kXA+lSonpoMv2ndRNtvmzvQx/1hTOlzRN6lZO78BwpMEngop5fNCFg77iMWAfMx7qMFd9KRS
 n/uuth1TVXvbNocYq0s0/rW2n5No0iMUwr4KCfY5o0MFV1Mrozl4blwAZj0BMe9HQLoWuKMpSDr
 d8EriSVr5dYT7+BA98NqN+tjL+OaqW39xpozT7Xk=
X-Google-Smtp-Source: AGHT+IHGXFFKwi9KhnB1akNKraPfzeJ2zmSUqQqb7SzFIxYzfjGRA13Y+veDJQIEsP0m/DU4C4O2oA==
X-Received: by 2002:a17:902:c94a:b0:232:1daf:6f06 with SMTP id
 d9443c01a7336-23c6e5d3a53mr39666775ad.47.1751467903710; 
 Wed, 02 Jul 2025 07:51:43 -0700 (PDT)
Received: from ?IPV6:240e:305:798e:6800:81a5:8e22:d9f1:ac68?
 ([240e:305:798e:6800:81a5:8e22:d9f1:ac68])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb3afc94sm138573955ad.155.2025.07.02.07.51.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 07:51:43 -0700 (PDT)
Message-ID: <34b3f8f1-5adf-4f82-8d06-b906cdf0552d@gmail.com>
Date: Wed, 2 Jul 2025 22:51:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] fs: change write_begin/write_end interface to take
 struct kiocb *
To: Matthew Wilcox <willy@infradead.org>
Cc: "tytso@mit.edu" <tytso@mit.edu>, "hch@infradead.org" <hch@infradead.org>, 
 "adilger.kernel@dilger.ca" <adilger.kernel@dilger.ca>,
 "brauner@kernel.org" <brauner@kernel.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "tursulin@ursulin.net" <tursulin@ursulin.net>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "chentao325@qq.com" <chentao325@qq.com>,
 "frank.li@vivo.com" <frank.li@vivo.com>
References: <20250627110257.1870826-1-chentaotao@didiglobal.com>
 <20250627110257.1870826-4-chentaotao@didiglobal.com>
 <aF6-L5Eu7XieS8aM@casper.infradead.org>
From: Taotao Chen <chentt325@gmail.com>
In-Reply-To: <aF6-L5Eu7XieS8aM@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 02 Jul 2025 21:56:20 +0000
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



在 2025/6/27 23:52, Matthew Wilcox 写道:
> On Fri, Jun 27, 2025 at 11:03:11AM +0000, 陈涛涛 Taotao Chen wrote:
>> @@ -1399,13 +1400,10 @@ static int write_end_fn(handle_t *handle, struct inode *inode,
>>   }
>>   
>>   /*
>> - * We need to pick up the new inode size which generic_commit_write gave us
>> - * `file' can be NULL - eg, when called from page_symlink().
>> - *
> Why delete this?  It seems still true to me, other than s/file/iocb/
Sorry, that was my mistake...
