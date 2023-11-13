Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C41857E9BBF
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 13:02:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F4410E362;
	Mon, 13 Nov 2023 12:01:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C188210E361
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 12:01:56 +0000 (UTC)
Received: from [100.102.120.103]
 (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D288A6601710;
 Mon, 13 Nov 2023 12:01:52 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1699876915;
 bh=Tvih1onIKqpZTx2G6rz268ug+WBFIIIgCLwsjMZL1tE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=R8SBuDt028+v1z29vgmNcmpe4yilQx7xMVrwrbRVOfRyp7Mo3xQe+tY+oJDHNi7em
 1uGWhWMpKbx717CniffcQh9WrzR4mrGKn17Cm484WUSjy50PhYzj7ppbdV4/RtZSp4
 0nYnq39w7oIG9smAHAUqil3vv46jSOyIzkX+p6tZCrsNeGvS50DwKOu9YXg0PcCC/F
 8LUgQsLoJT/3iFCXBvGs8C2ldBxEcoxxNXW+if62RpiIYATIa0xXfLEEl1K2ubavi4
 B6Z5iVMDBFHda+5x9UeEIYUTfMAgpGSLNeyIur0nCLkYNUbYhjyBYQ4Pk1bq5atF1y
 EOF4hB7DcZz5g==
Message-ID: <0007372a-1fb3-40df-a1d0-cc9c76d0feec@collabora.com>
Date: Mon, 13 Nov 2023 09:01:47 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: github version complaints about the gitlab CI requirements.txt
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>,
 David Heidelberg <david.heidelberg@collabora.com>,
 Vignesh Raman <vignesh.raman@collabora.com>
References: <CAHk-=wjTGzKGcEmSW98j7kZin71x3yLFEuQS-2VP2pB+qxCwoA@mail.gmail.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <CAHk-=wjTGzKGcEmSW98j7kZin71x3yLFEuQS-2VP2pB+qxCwoA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

On 12/11/2023 17:33, Linus Torvalds wrote:
> So every time I push to my github mirror, github now ends up having a
> 'dependabot' thing that warns about some of the CI version
> requirements for the gitlab automated testing file.
> 
> It wants to update the pip requirements from 23.2.1 to 23.3
> 
>   - When installing a package from a Mercurial VCS URL, e.g. pip install
>     hg+..., with pip prior to v23.3, the specified Mercurial revision
>     could be used to inject arbitrary configuration options to the hg
>     clone call (e.g. --config). Controlling the Mercurial configuration
>     can modify how and which repository is installed. This vulnerability
>     does not affect users who aren't installing from Mercurial.
> 
> and upgrade the urllib3 requirements from 2.0.4 to 2.0.7:
> 
>   - urllib3's request body not stripped after redirect from 303 status
>     changes request method to GET
> 
>   - `Cookie` HTTP header isn't stripped on cross-origin redirects
> 
> And it's not like any of this looks like a big deal, but I'd like to
> shut up the messages I get.
> 
> I can either just close those issues, or I can apply a patch something
> like the attached (which also adds a missing newline at the end).
> 
> I thought I should ask the people who actually set this up. Comments?

I just tested your attached patch and looks fine, the scripts with those
requirements worked as expected, so please go ahead with your patch with
Tested-by: Helen Koike <helen.koike@collabora.com>

Now I'm thinking how to prevent those warnings in the future.

Thank you,
Helen

> 
>                 Linus
