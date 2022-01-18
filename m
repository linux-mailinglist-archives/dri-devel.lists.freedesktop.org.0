Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 686AB4928B8
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 15:50:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A98710E156;
	Tue, 18 Jan 2022 14:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F21710E156;
 Tue, 18 Jan 2022 14:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642517422; x=1674053422;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AzzRAsgS7TBv6bhnr1PrVcU6g11tMi2v/6siw6c6O8E=;
 b=WYY9Lp0J7owdsQSHGE3K8l3EM1g5h4+jSyPjtgdYe6syeIiHKiuHz589
 Ie/8CMXFXu0G1mq9RsehkkZyxHLQMvBaEFfsIKh5W3NORmnyAdJjFQtY3
 uRX73DwG/DLKVlxPU9c3G8z0vkdy5bgBK6SSGROFmmsiR/pQJ6PE1WGSE
 l8tAroJTNjdLb4GF4jDcrzVGD2kudEnPGaF+IV0Bx4PM80r558yfsD4Qq
 tI/fIle1k3aAjrQYh3vNBmnw+pDbJQ+HRpvq/uWXVxgG0JBz5ERDQOctl
 BMYXJWLxP3AGUaFcZ8LK3xoGMArJj1HRFi7uMP3T+zqK/2tGMxcAFUhv8 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="243652450"
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="243652450"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 06:50:21 -0800
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="517790061"
Received: from lyormanx-mobl.ger.corp.intel.com (HELO [10.252.43.121])
 ([10.252.43.121])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 06:50:20 -0800
Message-ID: <413c501e-3c31-284c-beb6-cb710c5c197a@linux.intel.com>
Date: Tue, 18 Jan 2022 15:50:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/i915: Add locking to i915_gem_evict_vm(), v3.
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <bb70ccb8-043c-bd99-e01e-c2f2a0c48d54@shipmail.org>
 <20220117075604.131477-1-maarten.lankhorst@linux.intel.com>
 <fb8f8150-bdc3-32aa-5352-5f15ae91a592@linux.intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <fb8f8150-bdc3-32aa-5352-5f15ae91a592@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Op 17-01-2022 om 15:08 schreef Thomas Hellström:
>
> On 1/17/22 08:56, Maarten Lankhorst wrote:
>> i915_gem_evict_vm will need to be able to evict objects that are
>> locked by the current ctx. By testing if the current context already
>> locked the object, we can do this correctly. This allows us to
>> evict the entire vm even if we already hold some objects' locks.
>>
>> Previously, this was spread over several commits, but it makes
>> more sense to commit the changes to i915_gem_evict_vm separately
>> from the changes to i915_gem_evict_something() and
>> i915_gem_evict_for_node().
>>
>> Changes since v1:
>> - Handle evicting dead objects better.
>> Changes since v2:
>> - Use for_i915_gem_ww in igt_evict_vm. (Thomas)
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>
> (Please note the series checkpatch- and DOC warnings before commiting!)
>
> Thanks,
>
> Thomas
>
>
Fixed and pushed. :)

~Maarten

