Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A1C1F5642
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 15:54:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A84526E5A1;
	Wed, 10 Jun 2020 13:54:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 851D46E5A0;
 Wed, 10 Jun 2020 13:54:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OExiNnEVLtmVY4R8Q51AlQOM9/KOGEfetrvrEstTYV1lOwkmuu7GW0r7vcNC/WYodIi/qht63gAOadKAcueB+d+yXpaJT/2YY+lVRDC1myuXbwKaje4Nbg9Sfe1HOA2JOK6v0H19vBjWvY2uu6Ligj4N1/6nheBhM36VUwDlZxQrAobT+ND0QY08QEAyoVI4KdKBox4EcvdUvYktSsPHduSCeT0AhIeM+1iYW62SkO4gzyLVoj+hneTqRiRtrim8UNnrFiQdRqhB/FFVFbbGJBSAB6jsG+KSKK1fQAw6rExc2zGjVdoSeVLsROszbHvoJqtZLZtVgz8AjbuCf8T0fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBOlMQWT3J+Y5wfJu6Gldir7mW71IB9nwLocIXq/eFQ=;
 b=T7zJva2V9lNr5+OwPpOEYZK0q6mFPZrLgtJYml3xukdhaIToRWqXCzagiBE7eXKbEUd4wYo5M0Kp6WW/LeMiUrfXXYjUn5YdFfq58RU4SukyMB09vtbUov3sx7zYzGuJ0IowsjN/sBsOCQh4s8zubPezxz+qusZbSZMYGQrbqluzwy8GEBRu/SY+iQTOBRGgjEFbM8I/Tnn/t23OGiOyDNu1xEQ12+kDWbn3XHuNOhtyjYjmCgC5QfK1PFhvqoCO8vU4VM5xnEg045w6fN93ZWGjnEEjNZ2s9RA1V1Yp6FLP/Md1yN3XYTF1eTVtlYERKVjW1lZv2gP2yuo7ulMEIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBOlMQWT3J+Y5wfJu6Gldir7mW71IB9nwLocIXq/eFQ=;
 b=NqWXYKC6yq0BpkEGYZt00gAjspJZsOPHjRFf+jdWmrRqHwzBsdxD5iYzQD//F4rNL+4Q93aYCJSS/yNthGXBS5swPjYKjJQjqXXPumhj6vaaxuJwBDnWvp/JYDGlFJT0Ed/QSPdoY7ISOj2kBQNZ+dW7qFKALNtNfq6gyEPTqKs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM6PR12MB2779.namprd12.prod.outlook.com (2603:10b6:5:4f::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.22; Wed, 10 Jun 2020 13:54:44 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::943d:4dcf:f18e:5df]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::943d:4dcf:f18e:5df%2]) with mapi id 15.20.3088.018; Wed, 10 Jun 2020
 13:54:44 +0000
Subject: Re: [PATCH 1/6] drm/ttm: Add unampping of the entire device address
 space
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
References: <f36c1fa1-bbee-477a-9cb2-ed2726f27eef@email.android.com>
 <eb9e5896-1f16-2102-350a-1e64d9af7ea8@shipmail.org>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <b415e3d1-eed9-9b11-b8c1-c85c7b57eb93@amd.com>
Date: Wed, 10 Jun 2020 09:54:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <eb9e5896-1f16-2102-350a-1e64d9af7ea8@shipmail.org>
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0013.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::26)
 To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3ee0:2de:8925:fc4b:27b0:2560]
 (2607:fea8:3ee0:2de:8925:fc4b:27b0:2560) by
 YT1PR01CA0013.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.19 via Frontend Transport; Wed, 10 Jun 2020 13:54:44 +0000
X-Originating-IP: [2607:fea8:3ee0:2de:8925:fc4b:27b0:2560]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 95567a18-996e-475d-6973-08d80d45d4b7
X-MS-TrafficTypeDiagnostic: DM6PR12MB2779:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB2779E0CA9CA81D1734346527EA830@DM6PR12MB2779.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 0430FA5CB7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 46VeNSKYJsAYCtFu8GLz8/8xhqJ+qAdb2jRJzrjNvFkfitWAx6kDpQJH5U8rYwWgehl+usbcqohS4OJfEnnCT0SoQsYbgjlvELefR4vp8/5vpW5Er/0MyODz9mmnKM2ot5pjDeflElKGabrn9n5e6h3qLIfZLbFL/RIXbhKBfKW5VpmJ5fp9G+rvHI2wv04ESBCCBdMI2hIyIjqoXmVlLPBr0eZpx1Vv6SNfWvDDgYX/UlVDU8MVJ54LaKjVldBr33wGjiFjFDWmUsJbQKGE9CSTKT3jj82Voe+TZsQQEF4eA8qr6pX6c4W2GiClT73HvchldLlgysjDAXEVRGLTfLEf1Er6uk4Of2D7CNX+yLxOaGEgvIA+osPUJufAWG7A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(396003)(346002)(366004)(376002)(39860400002)(36756003)(54906003)(478600001)(83380400001)(2616005)(5660300002)(2906002)(6486002)(110136005)(6636002)(66556008)(53546011)(6666004)(66574014)(4326008)(8936002)(316002)(86362001)(66476007)(8676002)(66946007)(16526019)(52116002)(186003)(31696002)(31686004)(33964004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: Sf2+PJaQsPtxKS8Uv8pqK8stYsCA/t7OUximpvGfJDVUULrmFA4nuiEBV7uD59gHNNu7WsxvGWraxWHVUvBAAg8WDomxu6Nohs2N5sYiTA+jDHf4QCwuviE+9Uq38GCYKbpCskP4iX6yUrZ3urCHif4gJH5EqGJsJJCjbZvHJBI2AyXWQbX3GE3uUXnM+iGJjSmihnMMwlvN2mPvbTvW8AHLXKfiqvDESBra2qBqPQokpBGZSXWwptdTj+HOCX58UvDTEDj9AiVXHg/pqYLseV+wELXnKtPY8M6mkZiQJWjYqJB+x79rHjurO5Hu3ocEP6sLDljPjUgzF6Z4evpKNGGyaA9JGBJWhnl8TaM84T00tLHfn2Np1z9DbYDu7Pc2KOY9S9GooB0O7aTODsA2Tja4GviuGU8KMDR9zlf0MrlljJ8NarKRPfFv2VQDYTQk012wbU/y/i/TCc3GLqk51xR7wCcwxBiYy9yU2JUBpJnX6v+GcQG8huV4Q2mCK6JZizWuyMOdcDbtN2XhI6IxW9M7BOiwmnC9wvh0u9xo9fc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95567a18-996e-475d-6973-08d80d45d4b7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2020 13:54:44.7142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fa8MFYlWPajNU6wkWKZ1IDJhHNcVYpgeFFOIfPudjWJZj3ptmK406nkoKNK2FPIf+9vdlh+hcEqQFzrYiXUVkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2779
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
Content-Type: multipart/mixed; boundary="===============1380002134=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1380002134==
Content-Type: multipart/alternative;
 boundary="------------D8267944C0089BED8303B85A"
Content-Language: en-US

--------------D8267944C0089BED8303B85A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/10/20 6:15 AM, Thomas Hellström (Intel) wrote:
>
>
> On 6/9/20 7:21 PM, Koenig, Christian wrote:
>>
>>
>> Am 09.06.2020 18:37 schrieb "Grodzovsky, Andrey" 
>> <Andrey.Grodzovsky@amd.com>:
>>
>>
>>     On 6/5/20 2:40 PM, Christian König wrote:
>>     > Am 05.06.20 um 16:29 schrieb Andrey Grodzovsky:
>>     >>
>>     >> On 5/11/20 2:45 AM, Christian König wrote:
>>     >>> Am 09.05.20 um 20:51 schrieb Andrey Grodzovsky:
>>     >>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>     >>>> ---
>>     >>>> drivers/gpu/drm/ttm/ttm_bo.c    | 22 +++++++++++++++++++++-
>>     >>>> include/drm/ttm/ttm_bo_driver.h |  2 ++
>>     >>>>   2 files changed, 23 insertions(+), 1 deletion(-)
>>     >>>>
>>     >>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
>>     >>>> b/drivers/gpu/drm/ttm/ttm_bo.c
>>     >>>> index c5b516f..eae61cc 100644
>>     >>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>     >>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>     >>>> @@ -1750,9 +1750,29 @@ void ttm_bo_unmap_virtual(struct
>>     >>>> ttm_buffer_object *bo)
>>     >>>> ttm_bo_unmap_virtual_locked(bo);
>>     >>>>       ttm_mem_io_unlock(man);
>>     >>>>   }
>>     >>>> +EXPORT_SYMBOL(ttm_bo_unmap_virtual);
>>     >>>>   +void ttm_bo_unmap_virtual_address_space(struct
>>     ttm_bo_device *bdev)
>>     >>>> +{
>>     >>>> +    struct ttm_mem_type_manager *man;
>>     >>>> +    int i;
>>     >>>> -EXPORT_SYMBOL(ttm_bo_unmap_virtual);
>>     >>>
>>     >>>> +    for (i = 0; i < TTM_NUM_MEM_TYPES; i++) {
>>     >>>> +        man = &bdev->man[i];
>>     >>>> +        if (man->has_type && man->use_type)
>>     >>>> + ttm_mem_io_lock(man, false);
>>     >>>> +    }
>>     >>>
>>     >>> You should drop that it will just result in a deadlock
>>     warning for
>>     >>> Nouveau and has no effect at all.
>>     >>>
>>     >>> Apart from that looks good to me,
>>     >>> Christian.
>>     >>
>>     >>
>>     >> As I am considering to re-include this in V2 of the patchsets,
>>     can
>>     >> you clarify please why this will have no effect at all ?
>>     >
>>     > The locks are exclusive for Nouveau to allocate/free the io
>>     address
>>     > space.
>>     >
>>     > Since we don't do this here we don't need the locks.
>>     >
>>     > Christian.
>>
>>
>>     So basically calling unmap_mapping_range doesn't require any extra
>>     locking around it and whatever locks are taken within the function
>>     should be enough ?
>>
>>
>>
>> I think so, yes.
>>
>> Christian.
>
> Yes, that's true. However, without the bo reservation, nothing stops a 
> PTE from being immediately re-faulted back again. Even while 
> unmap_mapping_range() is running.
>

Can you explain more on this - specifically, which function to reserve 
the BO, why BO reservation would prevent re-fault of the PTE ?


> So the device removed flag needs to be advertized before this function 
> is run,
>

I indeed intend to call this  right after calling drm_dev_unplug from 
amdgpu_pci_remove while adding drm_dev_enter/exit in ttm_bo_vm_fault (or 
in amdgpu specific wrapper since I don't see how can I access struct 
drm_device from ttm_bo_vm_fault) and this in my understanding should 
stop a PTE from being re-faulted back as you pointed out - so again I 
don't see how  bo reservation would prevent it so it looks like I am 
missing something...


> (perhaps with a memory barrier pair).
>

drm_dev_unplug and drm_dev_enter/exit are RCU synchronized and so I 
don't think require any extra memory barriers for visibility of the 
removed flag being set


Andrey


> That should probably be added to the function documentation.
>
> (Other than that, please add a commit message if respinning).
>
> /Thomas
>
>
>

--------------D8267944C0089BED8303B85A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/10/20 6:15 AM, Thomas Hellström
      (Intel) wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:eb9e5896-1f16-2102-350a-1e64d9af7ea8@shipmail.org">
      
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 6/9/20 7:21 PM, Koenig, Christian
        wrote:<br>
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
                          &gt;&gt;&gt;&gt; index c5b516f..eae61cc 100644<br>
                          &gt;&gt;&gt;&gt; ---
                          a/drivers/gpu/drm/ttm/ttm_bo.c<br>
                          &gt;&gt;&gt;&gt; &#43;&#43;&#43;
                          b/drivers/gpu/drm/ttm/ttm_bo.c<br>
                          &gt;&gt;&gt;&gt; @@ -1750,9 &#43;1750,29 @@ void
                          ttm_bo_unmap_virtual(struct <br>
                          &gt;&gt;&gt;&gt; ttm_buffer_object *bo)<br>
                          &gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          ttm_bo_unmap_virtual_locked(bo);<br>
                          &gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm_mem_io_unlock(man);<br>
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
                          &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (man-&gt;has_type
                          &amp;&amp; man-&gt;use_type)<br>
                          &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          ttm_mem_io_lock(man, false);<br>
                          &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; }<br>
                          &gt;&gt;&gt;<br>
                          &gt;&gt;&gt; You should drop that it will just
                          result in a deadlock warning for <br>
                          &gt;&gt;&gt; Nouveau and has no effect at all.<br>
                          &gt;&gt;&gt;<br>
                          &gt;&gt;&gt; Apart from that looks good to me,<br>
                          &gt;&gt;&gt; Christian.<br>
                          &gt;&gt;<br>
                          &gt;&gt;<br>
                          &gt;&gt; As I am considering to re-include
                          this in V2 of the patchsets, can <br>
                          &gt;&gt; you clarify please why this will have
                          no effect at all ?<br>
                          &gt;<br>
                          &gt; The locks are exclusive for Nouveau to
                          allocate/free the io address <br>
                          &gt; space.<br>
                          &gt;<br>
                          &gt; Since we don't do this here we don't need
                          the locks.<br>
                          &gt;<br>
                          &gt; Christian.<br>
                          <br>
                          <br>
                          So basically calling unmap_mapping_range
                          doesn't require any extra <br>
                          locking around it and whatever locks are taken
                          within the function <br>
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
      <p>Yes, that's true. However, without the bo reservation, nothing
        stops a PTE from being immediately re-faulted back again. Even
        while unmap_mapping_range() is running. </p>
    </blockquote>
    <p><br>
    </p>
    <p>Can you explain more on this - specifically, which function to
      reserve the BO, why BO reservation would prevent re-fault of the
      PTE ?</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:eb9e5896-1f16-2102-350a-1e64d9af7ea8@shipmail.org">
      <p>So the device removed flag needs to be advertized before this
        function is run,</p>
    </blockquote>
    <p><br>
    </p>
    <p>I indeed intend to call this&nbsp; right after calling drm_dev_unplug
      from amdgpu_pci_remove while adding drm_dev_enter/exit in
      ttm_bo_vm_fault (or in amdgpu specific wrapper since I don't see
      how can I access struct drm_device from ttm_bo_vm_fault) and this
      in my understanding should stop a PTE from being re-faulted back
      as you pointed out - so again I don't see how&nbsp; bo reservation
      would prevent it so it looks like I am missing something...</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:eb9e5896-1f16-2102-350a-1e64d9af7ea8@shipmail.org">
      <p> (perhaps with a memory barrier pair). </p>
    </blockquote>
    <p><br>
    </p>
    <p> drm_dev_unplug and drm_dev_enter/exit are RCU synchronized and
      so I don't think require any extra memory barriers for visibility
      of the removed flag being set<br>
    </p>
    <p><br>
    </p>
    <p>Andrey</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:eb9e5896-1f16-2102-350a-1e64d9af7ea8@shipmail.org">
      <p>That should probably be added to the function documentation. <br>
      </p>
      <p>(Other than that, please add a commit message if respinning).</p>
      <p>/Thomas</p>
      <p><br>
      </p>
      <p><br>
      </p>
    </blockquote>
  </body>
</html>

--------------D8267944C0089BED8303B85A--

--===============1380002134==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1380002134==--
