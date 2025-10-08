Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8BFBC5E15
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 17:53:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63CD210E84F;
	Wed,  8 Oct 2025 15:53:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="Bh6lfmrw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2EF310E84F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 15:53:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1759938814; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=AeNkNhTWXbdyavWZ4VHLGg42DNeNFNH8oa2tqLoZ34wfVIZp4OuN48gYJxwlkBt9/WX17dSFYF4P03GbZzlH4LjngEWyabIr+DWb66ssIbfS/RJeXGOcF+n/U2mXveoJmQpCE79axcleMuBHymj0rsJu26A7Ca6HUPwMgPrxioU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1759938814;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=vAJkjR3ZRJTUZ6Y232Lpa+MPsP5PZ9r44KxK9l+kT9M=; 
 b=bfM8AtNTeMf4pJxlv7AwUCOImP1UTfSpkbB5fGfGQJXBaJ8yzQRU2PsemIJAPcAiecEFqKgAr60TbI3rvg6qP3dvIZpugydYMg2Nr1JCOzx6ZuAUD1AGq58z2DKlzI4yZvqmCqf/T4Sq0SARhFYVCs6jNfm9apcI2UvsoKFp/oQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759938814; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=vAJkjR3ZRJTUZ6Y232Lpa+MPsP5PZ9r44KxK9l+kT9M=;
 b=Bh6lfmrwEpSgfiv8mz1cvZ0mfx7UkgNZLBEzZTQv1eigXCpEN0sucFrpMGBLmrOh
 ea5vp2h8DKjDowRkQj47p6/TBMUJwC+ZGJSpu2CzU5XfBu9ZLZSTMqpSUfxa3TvF+dL
 ONWOTk5Nsw84O1KXFuPxQUpCFteC920oabfJLlFo=
Received: by mx.zohomail.com with SMTPS id 1759938813016747.9212973696418;
 Wed, 8 Oct 2025 08:53:33 -0700 (PDT)
Message-ID: <f0dca8a9-5a3b-4778-abec-bd9a4ddd2465@collabora.com>
Date: Wed, 8 Oct 2025 18:53:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] drm/virtio: Add support for saving and restoring
 virtio_gpu_objects
To: "Kim, Dongwon" <dongwon.kim@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "nirmoyd@nvidia.com" <nirmoyd@nvidia.com>
References: <20251003053402.732218-1-dongwon.kim@intel.com>
 <20251003053402.732218-3-dongwon.kim@intel.com>
 <059d3074-dc1f-47cf-9bdd-ca582e150511@collabora.com>
 <PH0PR11MB51125B8A88CBFAE48E7BDC62FAE4A@PH0PR11MB5112.namprd11.prod.outlook.com>
 <ef77d1e3-adea-4120-a23f-b2925ca23b38@collabora.com>
 <PH0PR11MB5112BF73084A79F3F0E785F6FAE4A@PH0PR11MB5112.namprd11.prod.outlook.com>
 <0fef25c6-c423-4d00-bbca-1744c2305afb@collabora.com>
 <PH0PR11MB511295459D829356E4416957FAE3A@PH0PR11MB5112.namprd11.prod.outlook.com>
 <11358030-ec48-4e07-b056-d5be29a38707@collabora.com>
 <da75f737-4593-4ddb-9a51-5a22b2bd635c@collabora.com>
 <PH0PR11MB5112550E12DAE19930A5ECC5FAE0A@PH0PR11MB5112.namprd11.prod.outlook.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <PH0PR11MB5112550E12DAE19930A5ECC5FAE0A@PH0PR11MB5112.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
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

On 10/7/25 21:16, Kim, Dongwon wrote:
> Hi Dmitry,
> 
>> -----Original Message-----
>> From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> Sent: Tuesday, October 7, 2025 10:22 AM
>> To: Kim, Dongwon <dongwon.kim@intel.com>; dri-devel@lists.freedesktop.org
>> Cc: nirmoyd@nvidia.com
>> Subject: Re: [PATCH v5 2/3] drm/virtio: Add support for saving and restoring
>> virtio_gpu_objects
>>
>> On 10/7/25 00:45, Dmitry Osipenko wrote:
>>> Also, reject hibernation on PM_HIBERNATION_PREPARE with a error msg if
>>> virgl is enabled.
>>
>> fail hibernation if hostmem is enabled in addition to virgl since both can't be
>> restored
> 
> Yes, I understand it and am working on changes. But what do you think should be done
> If we really want to recover objects backed by host pages after hibernation. Is it just an
> impossible task In current design or it would be too complicated? 

To restore host blobs from hibernation, we'll need to copy them from
host to guest. This can be done if all host blobs are mappable.

Depending on a context, some blobs may be not mappable, like in a case
of secure memory, or when there is a need to relocate blob from a
dedicate memory to make it mappable. Something new might need to be
invented for that in virtio-gpu protocol.

Restoring blobs won't be enough for 3d contexts. The whole 3d context
needs to be restored along with restored blobs. This is a next level of
complexity.

-- 
Best regards,
Dmitry
