Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2933999063A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 16:36:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC6E10EA1E;
	Fri,  4 Oct 2024 14:36:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="SDc7TUOv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16EE310EA1E
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 14:36:37 +0000 (UTC)
Received: from [192.168.42.96] (p5de457db.dip0.t-ipconnect.de [93.228.87.219])
 (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 415F52FC0050;
 Fri,  4 Oct 2024 16:36:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1728052596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vP3PFpRd2ZOwvuuhtver3jyV6yAM41O3MdWKWJJcVYY=;
 b=SDc7TUOvYNDRmv+uX4S5nk1hUVTvVtCzA6Kf3EmorrP51VL1iS3un4f9YtTHNYjBKh7nk5
 Otp8VS3kbGEy7SgpFbpQK/eZiP1BbOu6LJdCuZKHfflt5Se1booSIohW0Y2GRhBCHwPmc7
 OkQq1vo+NLEm1BKSapn8rJmO5XC8Bwc=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <8874c084-20b2-44d8-9a0d-67aedad4b456@tuxedocomputers.com>
Date: Fri, 4 Oct 2024 16:36:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO
To: Lee Jones <lee@kernel.org>
Cc: bentiss@kernel.org, dri-devel@lists.freedesktop.org, hdegoede@redhat.com, 
 jelle@vdwaa.nl, jikos@kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org, onitake@gmail.com,
 pavel@ucw.cz, cs@tuxedo.de
References: <20240927124152.139099-1-wse@tuxedocomputers.com>
 <20241002125243.GC7504@google.com>
 <4bfc188c-0873-490f-bfef-119c7fa74be5@tuxedocomputers.com>
 <20241003075927.GI7504@google.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20241003075927.GI7504@google.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 03.10.24 um 09:59 schrieb Lee Jones:
> On Wed, 02 Oct 2024, Werner Sembach wrote:
>
>> Hi,
>>
>> Am 02.10.24 um 14:52 schrieb Lee Jones:
>>> On Fri, 27 Sep 2024, Werner Sembach wrote:
>>>
>>>> Hi,
>>>> first revision integrating Armins feedback.
>>>>
>>>> Stuff I did not yet change and did not comment on previously:
>>>> - Still have to ask Christoffer why the mutex is required
>>>> - Still using acpi_size instad of size_t in the util functions, because the value is put directly into a struct using acpi_size
>>>> - Error messages for __wmi_method_acpi_object_out still in that method because they reference method internal variables
>>>>
>>>> Let me know if my reasoning is flawed
>>> Use `git format-patch`'s --annotate and --compose next time please.
>>>
>> I did but --compose does not automatically insert the subject line, that's
>> why i copied it but forgot to change it to 0/1
>>
>> Sorry for the flawed subject line
> And the missing diff-stat?
>
Also not automatically created by git send-email --compose. is there a flag I'm 
not aware of?
