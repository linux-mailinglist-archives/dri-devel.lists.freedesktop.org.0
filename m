Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 853ED1F567A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 16:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525F26E5B0;
	Wed, 10 Jun 2020 14:05:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 646EB6E5B0;
 Wed, 10 Jun 2020 14:05:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffehwh4rk4XqNYit5YGNIBKEmhbrA/89cM906O6BCC6UBBgSMeHWEZSSl+z+3rkswgwOHhc31J5Btu76TlN0DvcS1PkHEthFJAWJNsxaTMR4On5B0iYXU+LTtsRX9E6FwDB/JRS77uKRFaSsyoYG24ZyNZhaMzJNXnuUSBiKh5cKmr1lT8PXAqCblx7HsrJHJoxpVgus4tuPtNZ1UlSkDjF3H7r5OX1VBxBBs1US65rmx0oIKytzF0pjMo2w9kH5AKTArPK0HBW+VYi+ZqHr4onmP3Ib7x6JMBoId1xXuGVOHXY+dmmoo4qQgeGCoT1LEHhrKH9XARKZ0epf53YwVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g5pMkT6ecp8zYcixr2ibqSODgFBX5sdsp59Omvah9mQ=;
 b=KIQknjuEV2YBjo5EYZ8GLcvl128KQRR7GK22ze5h+u6U0W6erLNbkfq5IChgXyJMGkozPwww5ZKKaJxtmstEy6j7NG/o4plBUfZwU2r83BvV0FK2GsLiRj4S56U2gFG+tnMeGyOaesGaVNR8RYCTRXFkLW8QYcZCeqDWneCP9QQLx0QZST++er1UrTpvPjmn+fgvKzyhRM0iG8HdjbWpaQ63sthzAo/2zHZ/Y60La3jq6/csF4hRZzJNjIiytbRqrBVVuAU8ZUMkYZ5mOiZ5MtXM7MKdL2ANPJI/Sq3ELG/Hi/NmiZMjaZlgWg/6eXMBT3ZB0n2/VGXYvx2CcPLl6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g5pMkT6ecp8zYcixr2ibqSODgFBX5sdsp59Omvah9mQ=;
 b=aKOSf25eGhUt8zB7tKVish92TOEP6CBbUo3Wi1HgxIh5ldZBEhH+REShYVeC9+EoaQyHh0TB2x0XTbzxAkA0r0/xygRK/GJM7Nav0BDeDuxNp/p1EbgQhOYP+p5aeol/JdVd0mTET1Ae1ZKjUXtliTzJi67OmNGiPP8rTVyrknQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB3148.namprd12.prod.outlook.com (2603:10b6:5:11c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Wed, 10 Jun
 2020 14:05:09 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.3088.018; Wed, 10 Jun 2020
 14:05:09 +0000
Subject: Re: [PATCH 1/6] drm/ttm: Add unampping of the entire device address
 space
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
References: <f36c1fa1-bbee-477a-9cb2-ed2726f27eef@email.android.com>
 <eb9e5896-1f16-2102-350a-1e64d9af7ea8@shipmail.org>
 <b415e3d1-eed9-9b11-b8c1-c85c7b57eb93@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ce6f6109-67df-e3d0-d56e-3f5c27df40a0@amd.com>
Date: Wed, 10 Jun 2020 16:05:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <b415e3d1-eed9-9b11-b8c1-c85c7b57eb93@amd.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR03CA0067.eurprd03.prod.outlook.com (2603:10a6:208::44)
 To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR03CA0067.eurprd03.prod.outlook.com (2603:10a6:208::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.19 via Frontend Transport; Wed, 10 Jun 2020 14:05:08 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6e846a77-d68e-499e-60c5-08d80d47492b
X-MS-TrafficTypeDiagnostic: DM6PR12MB3148:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB31481E9CE11393D6BAAD128983830@DM6PR12MB3148.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0430FA5CB7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OMX/xr6/4N3Jz7JuVVRuAXhJrTv8OukrPx4ta1TqXkYn7AZrUqMb3ssY1Uh3V6zCSHRIq96leBYrRdkRUGwsVRO1uDWg1xRUlxvuKx7fGG1tENLl1iC2VlHOu4WCIVZ15Nv1NLRBYvtGyjvhTmG1j8D/PPS6Z8d9htVKkT2xaYt3FRDIcHayG8bvHx7C/ouKXpz5yUUWlYJgq5awcXg4bwLLqgONiJ1+Sv61SDGWGAlUTqBk/XvZyqQp6G7UMowxeXfh03MpOFy0c5nHiYX00EaV1vnsuwMp6ckVh4U4giqK/ujBSadiy/+T0MzcxoScu0VG+xjPV9orclDnNj0IvozslyvPY9lDN2wzWpr4npBFeZuQ8BPxMm7F6Tfsr6VR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(6486002)(66946007)(36756003)(186003)(83380400001)(4326008)(16526019)(86362001)(6666004)(66556008)(2906002)(66476007)(31686004)(31696002)(5660300002)(53546011)(8936002)(54906003)(33964004)(478600001)(316002)(110136005)(52116002)(66574014)(2616005)(8676002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: MUFmbLaeSw8KEy8onTn8gAEO5XQx/4Qz1xRD1LxPRhYmGp6KEtqEVJuHCIp4mUcCV3/Je7OnY0HJ3+8MrQ7zAW0wMtoFJl0tUN1Vs7IVZADkAhd3vQlXea696Y0iRHcawebyps0deUm95gwwnKkl+4S9YKMxE7Afv/915uDbxCtvxCF35kCekhKdgX8Uh24nLQ9Jhp79Lsi/TjDpn+25c6oPts5xNMTPZPqAbtLtZ94R1H+F7zI/ScYtav7KyeXGQV9cIgFlIkoUuC2ZX3fVh70Nq7T3BBvEc9Y56CPwzOnSAYtyyFVkAfL+WNxSVttNtqyzZZZLayGwO6Mn2La1uN0/T2RKefnNClr4vMzvFMtTppD4W+oT6hMhJtR1mxiqGfmgK9W2g/s89l7mz15kM1VAvtyBi/70I8kk0hLY1k4Fp8ChMI+xSk5rgrtp0hn7m7H41Y9RJFq9OAY5ZsBGqQADFF5+YOjAI7WmTOck44dNsmhQvrdIzRlpSoQrJhwPsdr3b0IbP1vIWxAbWbSJ8Sa08zqeh2/6f84TPb2BCEBxhRXmTlq5j4ZSPTzYDi+x
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e846a77-d68e-499e-60c5-08d80d47492b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2020 14:05:09.6982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2MWIhqzG0qPqp4m/sc/VfVrS0sLZAI0PWh0GmQRB0feMO4sQzY2YpYz2lGhYmix4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3148
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
Cc: "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "michel@daenzer.net" <michel@daenzer.net>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1966451517=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1966451517==
Content-Type: multipart/alternative;
 boundary="------------7488A78B2C87745FF1C107F0"
Content-Language: en-US

--------------7488A78B2C87745FF1C107F0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 10.06.20 um 15:54 schrieb Andrey Grodzovsky:
>
>
> On 6/10/20 6:15 AM, Thomas Hellström (Intel) wrote:
>>
>>
>> On 6/9/20 7:21 PM, Koenig, Christian wrote:
>>>
>>>
>>> Am 09.06.2020 18:37 schrieb "Grodzovsky, Andrey" 
>>> <Andrey.Grodzovsky@amd.com>:
>>>
>>>
>>>     On 6/5/20 2:40 PM, Christian König wrote:
>>>     > Am 05.06.20 um 16:29 schrieb Andrey Grodzovsky:
>>>     >>
>>>     >> On 5/11/20 2:45 AM, Christian König wrote:
>>>     >>> Am 09.05.20 um 20:51 schrieb Andrey Grodzovsky:
>>>     >>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>     >>>> ---
>>>     >>>> drivers/gpu/drm/ttm/ttm_bo.c    | 22 +++++++++++++++++++++-
>>>     >>>> include/drm/ttm/ttm_bo_driver.h |  2 ++
>>>     >>>>   2 files changed, 23 insertions(+), 1 deletion(-)
>>>     >>>>
>>>     >>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
>>>     >>>> b/drivers/gpu/drm/ttm/ttm_bo.c
>>>     >>>> index c5b516f..eae61cc 100644
>>>     >>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>>     >>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>>     >>>> @@ -1750,9 +1750,29 @@ void ttm_bo_unmap_virtual(struct
>>>     >>>> ttm_buffer_object *bo)
>>>     >>>> ttm_bo_unmap_virtual_locked(bo);
>>>     >>>> ttm_mem_io_unlock(man);
>>>     >>>>   }
>>>     >>>> +EXPORT_SYMBOL(ttm_bo_unmap_virtual);
>>>     >>>>   +void ttm_bo_unmap_virtual_address_space(struct
>>>     ttm_bo_device *bdev)
>>>     >>>> +{
>>>     >>>> +    struct ttm_mem_type_manager *man;
>>>     >>>> +    int i;
>>>     >>>> -EXPORT_SYMBOL(ttm_bo_unmap_virtual);
>>>     >>>
>>>     >>>> +    for (i = 0; i < TTM_NUM_MEM_TYPES; i++) {
>>>     >>>> +        man = &bdev->man[i];
>>>     >>>> +        if (man->has_type && man->use_type)
>>>     >>>> + ttm_mem_io_lock(man, false);
>>>     >>>> +    }
>>>     >>>
>>>     >>> You should drop that it will just result in a deadlock
>>>     warning for
>>>     >>> Nouveau and has no effect at all.
>>>     >>>
>>>     >>> Apart from that looks good to me,
>>>     >>> Christian.
>>>     >>
>>>     >>
>>>     >> As I am considering to re-include this in V2 of the
>>>     patchsets, can
>>>     >> you clarify please why this will have no effect at all ?
>>>     >
>>>     > The locks are exclusive for Nouveau to allocate/free the io
>>>     address
>>>     > space.
>>>     >
>>>     > Since we don't do this here we don't need the locks.
>>>     >
>>>     > Christian.
>>>
>>>
>>>     So basically calling unmap_mapping_range doesn't require any extra
>>>     locking around it and whatever locks are taken within the function
>>>     should be enough ?
>>>
>>>
>>>
>>> I think so, yes.
>>>
>>> Christian.
>>
>> Yes, that's true. However, without the bo reservation, nothing stops 
>> a PTE from being immediately re-faulted back again. Even while 
>> unmap_mapping_range() is running.
>>
>
> Can you explain more on this - specifically, which function to reserve 
> the BO, why BO reservation would prevent re-fault of the PTE ?
>

Thomas is talking about ttm_bo_reserver()/ttm_bo_unreserve(), but we 
don't need this because we unmap everything because the whole device is 
gone and not just manipulate a single BO.

>
>> So the device removed flag needs to be advertized before this 
>> function is run,
>>
>
> I indeed intend to call this  right after calling drm_dev_unplug from 
> amdgpu_pci_remove while adding drm_dev_enter/exit in ttm_bo_vm_fault 
> (or in amdgpu specific wrapper since I don't see how can I access 
> struct drm_device from ttm_bo_vm_fault) and this in my understanding 
> should stop a PTE from being re-faulted back as you pointed out - so 
> again I don't see how  bo reservation would prevent it so it looks 
> like I am missing something...
>
>
>> (perhaps with a memory barrier pair).
>>
>
> drm_dev_unplug and drm_dev_enter/exit are RCU synchronized and so I 
> don't think require any extra memory barriers for visibility of the 
> removed flag being set
>

As far as I can see that should be perfectly sufficient.

Christian.

>
> Andrey
>
>
>> That should probably be added to the function documentation.
>>
>> (Other than that, please add a commit message if respinning).
>>
>> /Thomas
>>
>>
>>


--------------7488A78B2C87745FF1C107F0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">Am 10.06.20 um 15:54 schrieb Andrey
      Grodzovsky:<br>
    </div>
    <blockquote type="cite" cite="mid:b415e3d1-eed9-9b11-b8c1-c85c7b57eb93@amd.com">
      
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 6/10/20 6:15 AM, Thomas Hellström
        (Intel) wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:eb9e5896-1f16-2102-350a-1e64d9af7ea8@shipmail.org">
        <p><br>
        </p>
        <div class="moz-cite-prefix">On 6/9/20 7:21 PM, Koenig,
          Christian wrote:<br>
        </div>
        <blockquote type="cite" cite="mid:f36c1fa1-bbee-477a-9cb2-ed2726f27eef@email.android.com">
          <div dir="auto">
            <div><br>
              <div class="gmail_extra"><br>
                <div class="gmail_quote">Am 09.06.2020 18:37 schrieb
                  &quot;Grodzovsky, Andrey&quot; <a class="moz-txt-link-rfc2396E" href="mailto:Andrey.Grodzovsky@amd.com" moz-do-not-send="true">&lt;Andrey.Grodzovsky@amd.com&gt;</a>:<br type="attribution">
                  <blockquote class="quote" style="margin:0 0 0
                    .8ex;border-left:1px #ccc solid;padding-left:1ex">
                    <div><font size="2"><span style="font-size:11pt">
                          <div><br>
                            On 6/5/20 2:40 PM, Christian König wrote:<br>
                            &gt; Am 05.06.20 um 16:29 schrieb Andrey
                            Grodzovsky:<br>
                            &gt;&gt;<br>
                            &gt;&gt; On 5/11/20 2:45 AM, Christian König
                            wrote:<br>
                            &gt;&gt;&gt; Am 09.05.20 um 20:51 schrieb
                            Andrey Grodzovsky:<br>
                            &gt;&gt;&gt;&gt; Signed-off-by: Andrey
                            Grodzovsky <a class="moz-txt-link-rfc2396E" href="mailto:andrey.grodzovsky@amd.com" moz-do-not-send="true">&lt;andrey.grodzovsky@amd.com&gt;</a><br>
                            &gt;&gt;&gt;&gt; ---<br>
                            &gt;&gt;&gt;&gt; &nbsp;
                            drivers/gpu/drm/ttm/ttm_bo.c&nbsp;&nbsp;&nbsp; | 22
                            &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-<br>
                            &gt;&gt;&gt;&gt; &nbsp;
                            include/drm/ttm/ttm_bo_driver.h |&nbsp; 2 &#43;&#43;<br>
                            &gt;&gt;&gt;&gt; &nbsp; 2 files changed, 23
                            insertions(&#43;), 1 deletion(-)<br>
                            &gt;&gt;&gt;&gt;<br>
                            &gt;&gt;&gt;&gt; diff --git
                            a/drivers/gpu/drm/ttm/ttm_bo.c <br>
                            &gt;&gt;&gt;&gt;
                            b/drivers/gpu/drm/ttm/ttm_bo.c<br>
                            &gt;&gt;&gt;&gt; index c5b516f..eae61cc
                            100644<br>
                            &gt;&gt;&gt;&gt; ---
                            a/drivers/gpu/drm/ttm/ttm_bo.c<br>
                            &gt;&gt;&gt;&gt; &#43;&#43;&#43;
                            b/drivers/gpu/drm/ttm/ttm_bo.c<br>
                            &gt;&gt;&gt;&gt; @@ -1750,9 &#43;1750,29 @@ void
                            ttm_bo_unmap_virtual(struct <br>
                            &gt;&gt;&gt;&gt; ttm_buffer_object *bo)<br>
                            &gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            ttm_bo_unmap_virtual_locked(bo);<br>
                            &gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            ttm_mem_io_unlock(man);<br>
                            &gt;&gt;&gt;&gt; &nbsp; }<br>
                            &gt;&gt;&gt;&gt;
                            &#43;EXPORT_SYMBOL(ttm_bo_unmap_virtual);<br>
                            &gt;&gt;&gt;&gt; &nbsp; &#43;void
                            ttm_bo_unmap_virtual_address_space(struct
                            ttm_bo_device *bdev)<br>
                            &gt;&gt;&gt;&gt; &#43;{<!-- --><br>
                            &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; struct
                            ttm_mem_type_manager *man;<br>
                            &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; int i;<br>
                            &gt;&gt;&gt;&gt; &nbsp;
                            -EXPORT_SYMBOL(ttm_bo_unmap_virtual);<br>
                            &gt;&gt;&gt;<br>
                            &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; for (i = 0; i &lt;
                            TTM_NUM_MEM_TYPES; i&#43;&#43;) {<!-- --><br>
                            &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; man =
                            &amp;bdev-&gt;man[i];<br>
                            &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if
                            (man-&gt;has_type &amp;&amp;
                            man-&gt;use_type)<br>
                            &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            ttm_mem_io_lock(man, false);<br>
                            &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; }<br>
                            &gt;&gt;&gt;<br>
                            &gt;&gt;&gt; You should drop that it will
                            just result in a deadlock warning for <br>
                            &gt;&gt;&gt; Nouveau and has no effect at
                            all.<br>
                            &gt;&gt;&gt;<br>
                            &gt;&gt;&gt; Apart from that looks good to
                            me,<br>
                            &gt;&gt;&gt; Christian.<br>
                            &gt;&gt;<br>
                            &gt;&gt;<br>
                            &gt;&gt; As I am considering to re-include
                            this in V2 of the patchsets, can <br>
                            &gt;&gt; you clarify please why this will
                            have no effect at all ?<br>
                            &gt;<br>
                            &gt; The locks are exclusive for Nouveau to
                            allocate/free the io address <br>
                            &gt; space.<br>
                            &gt;<br>
                            &gt; Since we don't do this here we don't
                            need the locks.<br>
                            &gt;<br>
                            &gt; Christian.<br>
                            <br>
                            <br>
                            So basically calling unmap_mapping_range
                            doesn't require any extra <br>
                            locking around it and whatever locks are
                            taken within the function <br>
                            should be enough ?<br>
                          </div>
                        </span></font></div>
                  </blockquote>
                </div>
              </div>
            </div>
            <div dir="auto"><br>
            </div>
            <div dir="auto">
              <div class="gmail_extra">
                <div class="gmail_quote">
                  <blockquote class="quote" style="margin:0 0 0
                    .8ex;border-left:1px #ccc solid;padding-left:1ex">
                    <div><font size="2"><span style="font-size:11pt"> </span></font></div>
                  </blockquote>
                </div>
              </div>
            </div>
            <div dir="auto"><br>
            </div>
            <div dir="auto">I think so, yes.</div>
            <div dir="auto"><br>
            </div>
            <div dir="auto">Christian.</div>
          </div>
        </blockquote>
        <p>Yes, that's true. However, without the bo reservation,
          nothing stops a PTE from being immediately re-faulted back
          again. Even while unmap_mapping_range() is running. </p>
      </blockquote>
      <p><br>
      </p>
      <p>Can you explain more on this - specifically, which function to
        reserve the BO, why BO reservation would prevent re-fault of the
        PTE ?</p>
    </blockquote>
    <br>
    Thomas is talking about ttm_bo_reserver()/ttm_bo_unreserve(), but we
    don't need this because we unmap everything because the whole device
    is gone and not just manipulate a single BO.<br>
    <br>
    <blockquote type="cite" cite="mid:b415e3d1-eed9-9b11-b8c1-c85c7b57eb93@amd.com">
      <p><br>
      </p>
      <blockquote type="cite" cite="mid:eb9e5896-1f16-2102-350a-1e64d9af7ea8@shipmail.org">
        <p>So the device removed flag needs to be advertized before this
          function is run,</p>
      </blockquote>
      <p><br>
      </p>
      <p>I indeed intend to call this&nbsp; right after calling
        drm_dev_unplug from amdgpu_pci_remove while adding
        drm_dev_enter/exit in ttm_bo_vm_fault (or in amdgpu specific
        wrapper since I don't see how can I access struct drm_device
        from ttm_bo_vm_fault) and this in my understanding should stop a
        PTE from being re-faulted back as you pointed out - so again I
        don't see how&nbsp; bo reservation would prevent it so it looks like
        I am missing something...</p>
      <p><br>
      </p>
      <blockquote type="cite" cite="mid:eb9e5896-1f16-2102-350a-1e64d9af7ea8@shipmail.org">
        <p> (perhaps with a memory barrier pair). </p>
      </blockquote>
      <p><br>
      </p>
      <p> drm_dev_unplug and drm_dev_enter/exit are RCU synchronized and
        so I don't think require any extra memory barriers for
        visibility of the removed flag being set<br>
      </p>
    </blockquote>
    <br>
    As far as I can see that should be perfectly sufficient.<br>
    <br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:b415e3d1-eed9-9b11-b8c1-c85c7b57eb93@amd.com">
      <p> </p>
      <p><br>
      </p>
      <p>Andrey</p>
      <p><br>
      </p>
      <blockquote type="cite" cite="mid:eb9e5896-1f16-2102-350a-1e64d9af7ea8@shipmail.org">
        <p>That should probably be added to the function documentation.
          <br>
        </p>
        <p>(Other than that, please add a commit message if respinning).</p>
        <p>/Thomas</p>
        <p><br>
        </p>
        <p><br>
        </p>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------7488A78B2C87745FF1C107F0--

--===============1966451517==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1966451517==--
