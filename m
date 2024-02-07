Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A9584C933
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 12:08:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E46510E12F;
	Wed,  7 Feb 2024 11:08:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ARj4ZieQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08CA810E12F
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 11:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KIzEQsA7FElyhx+OIEPo5FVsvz6p+SaZMmU+eZ1xBY4=; b=ARj4ZieQdCt6LinGeDtpE3lgPz
 OSdmZYiGJaE7m+ktLeQhls7le+1gp9hZEaxDnmN2kog0McjgraDRKnVBtPUOxMpWWJuH/rLoQlYlu
 OVztKVwlVcFu2qYJzTCzytUmvMLGn/cWi5CLxGBOvtanRd4yMgQ77T1TlaQPHbFlSbCj/3tCwd/st
 ykgmMq0KikJtODVgQYvm/cW6z8c5LAhKGYbsc4rmnKb58khNIgNPaaGYh50fB6BSWyBi7KUzOHo3B
 qPG1AW10wT3QQvTfuNX2AlcGqoxUsa02Z8i/KKIa+RCIt4TYu0IIiYd2IiVOJfzZnYEkTMNocYmKC
 CjFepvmg==;
Received: from [179.234.233.159] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rXfnN-00EihT-Hz; Wed, 07 Feb 2024 12:08:49 +0100
Message-ID: <0c4da8bd-452a-4ba5-9c4c-582cbc7b5dec@igalia.com>
Date: Wed, 7 Feb 2024 08:08:42 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xe vs amdgpu userptr handling
Content-Language: en-US
To: Dave Airlie <airlied@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <CAPM=9twPgn+fpbkig0Vhjt=cJdHQFbNH_Z=sRhSZwuvLKhavbA@mail.gmail.com>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <CAPM=9twPgn+fpbkig0Vhjt=cJdHQFbNH_Z=sRhSZwuvLKhavbA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Adding another point to this discussion, would it make sense to somehow
create a generic structure that all drivers, including shmem drivers, 
could use it?

Best Regards,
- Maíra

On 2/7/24 03:56, Dave Airlie wrote:
> I'm just looking over the userptr handling in both drivers, and of
> course they've chosen different ways to represent things. Again this
> is a divergence that is just going to get more annoying over time and
> eventually I'd like to make hmm/userptr driver independent as much as
> possible, so we get consistent semantics in userspace.
> 
> AFAICS the main difference is that amdgpu builds the userptr handling
> inside a GEM object in the kernel, whereas xe doesn't bother creating
> a holding object and just handles things directly in the VM binding
> code.
> 
> Is this just different thinking at different times here?
> like since we have VM BIND in xe, it made sense not to bother creating
> a gem object for userptrs?
> or is there some other advantages to going one way or the other?
> 
> Dave.
