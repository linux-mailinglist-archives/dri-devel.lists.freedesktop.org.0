Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FD2B1736C
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 16:50:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 338B010E7AF;
	Thu, 31 Jul 2025 14:50:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mary.guillemard@collabora.com header.b="jAbMVuG3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 902 seconds by postgrey-1.36 at gabe;
 Thu, 31 Jul 2025 14:50:46 UTC
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com
 [136.143.188.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE10310E7AF
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 14:50:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1753972537; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=cwVndOAnBquabL2/M1yBGYfepdBwW+X4OctQEiIvtWZLbTuSn3VeYSy6kQITRM8zNp9m9nymXMidH+jgujEKUu+8DNI96ZNWLn48LLz7qP5tM4zJEoNDVF0dAjfiAWw/p/dRCKlpyGNF62IKwpySVnoNo7uDNBpxHHcb+enyKv4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1753972537;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=rKcAcr2DwC7zTd6PfcPIGNAWLmYsXKMR8BuUiIJfbTg=; 
 b=Tayiukse9FS1xYP31XxyC/YnuDA4kA00IZ9y4wodzvw8dc77+53EO2riFeh0s0eWRENClpriY34IoTv/h299j639eZc+Dh1yfTYR0hrA0QZ7xBxG36y8/7CBl2g20qlPyYe1RQHw9uLq9yXlOWW1OyEKT8YpUai/GX2Jq+pmFmM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mary.guillemard@collabora.com;
 dmarc=pass header.from=<mary.guillemard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753972537; 
 s=zohomail; d=collabora.com; i=mary.guillemard@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:Subject:Subject:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=rKcAcr2DwC7zTd6PfcPIGNAWLmYsXKMR8BuUiIJfbTg=;
 b=jAbMVuG3sknuTodVk0cimWo79+TEk7/kCj1JHHo6Qc72H6gWZOLVqnpm3vxepSZR
 U1KJvCUGeOnbEKwc8V4DWnhdH5V7ASYfjZS97KUP5OveOVIJuQr8OQe42izDuN1ZLX9
 okvQdwTml+ne95k6AEqZfVYH+t+KRkQG5+MvTDPo=
Received: by mx.zohomail.com with SMTPS id 1753972535514926.5704440251537;
 Thu, 31 Jul 2025 07:35:35 -0700 (PDT)
Message-ID: <783cfede-8b79-49c7-bf7c-fa3a67cc0f56@collabora.com>
Date: Thu, 31 Jul 2025 16:35:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: karunika.choo@arm.com
Cc: airlied@gmail.com, boris.brezillon@collabora.com, dennis.tsiang@arm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 nd@arm.com, simona@ffwll.ch, steven.price@arm.com, tzimmermann@suse.de
References: <20250730174338.1650212-1-karunika.choo@arm.com>
Subject: Re: [PATCH v1] drm/panthor: Serialize GPU cache flush operations
Content-Language: en-US
From: Mary Guillemard <mary.guillemard@collabora.com>
In-Reply-To: <20250730174338.1650212-1-karunika.choo@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

Tested and passing VKCTS on G925-Immortalis.

Tested-by: Mary Guillemard <mary.guillemard@collabora.com>

